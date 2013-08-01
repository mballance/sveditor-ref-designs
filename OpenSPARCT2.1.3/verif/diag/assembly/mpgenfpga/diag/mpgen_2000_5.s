/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_2000_5.s
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
!	Seed = 327144520
!	Riesling can be on
!	1 Thread, 2000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_2000_5.s created on Mar 27, 2009 (14:45:20)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_2000_5 -p 1 -l 2000

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
!	%f0  = 7fad7583 33515ebc 9229ab27 ee91ed0b
!	%f4  = c89791bf 27250de1 5fddcad8 bb7ad107
!	%f8  = e1ba7fde 065fda19 aa34c928 2a4c1902
!	%f12 = 9321e048 47f5580a 0ff22520 1e354b08
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 9add2e4d db7324a6 7ab642f5 ddd6894b
!	%f20 = 74ff757f 9138869f 6f6a89f7 bdc11bc9
!	%f24 = 422583a4 234b1eb3 9c639e05 fb19b368
!	%f28 = 14f00a66 4e9f3621 16f57748 f83a800b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 5ecccfef b771ba89 236324e2 0b3c4318
!	%f36 = 5a767b80 c57976f8 1e3086dd f953efed
!	%f40 = b8ab23c4 b025dd8e cc313636 1039d077
!	%f44 = 89c8fcc9 2fa10283 9d3f56c3 5e0838a6
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x6e5296a70000000a,%g7,%g1 ! GSR scale =  1, align = 2
	wr	%g1,%g0,%gsr		! GSR = 6e5296a70000000a
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000030101410] = 63eda791, %f27 = fb19b368
	lda	[%i4+%o5]0x81,%f27	! %f27 = 63eda791
!	Mem[0000000030041400] = 4b589d0a 49834273 227da9f1 9eae159f
!	Mem[0000000030041410] = bd2cc120 243b2037 f1431b73 025bbbfa
!	Mem[0000000030041420] = e7b888d8 713aee24 25947489 65663675
!	Mem[0000000030041430] = 374a5c79 d29b6627 51d96e56 470b17d0
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000030141410] = a328c6e0, %l5 = 90edc9905530e475
	lduba	[%i5+%o5]0x81,%l5	! %l5 = 00000000000000a3
!	Mem[00000000300c1400] = ce61d65ab6412789, %l1 = 5aab6f46a376f165
	ldxa	[%i3+%g0]0x89,%l1	! %l1 = ce61d65ab6412789
!	Mem[00000000211c0000] = 993ec8b9, %l2 = b6c082f272a1b344
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffff993e
!	%l6 = c47227b7, %l7 = 5ab9110c, Mem[0000000010041410] = 2623cbfa 9581f902
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = c47227b7 5ab9110c
!	Mem[00000000201c0000] = 57de2191, %l6 = ab97f624c47227b7
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 00000057000000ff
!	Mem[0000000030081410] = 103764d0, %l3 = a28d71900b8ec4b0
	lduba	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000010
!	%l7 = a702287a5ab9110c, Mem[0000000030181400] = 5ec4f368
	stba	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 5ec4f30c
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = b2ee11ad, %l7 = a702287a5ab9110c
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 00000000b2ee11ad

p0_label_2:
!	%l5 = 00000000000000a3, Mem[0000000030101408] = 2453335f
	stba	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 245333a3
!	%f14 = 0ff22520, Mem[0000000010181408] = 8c94ee7a
	sta	%f14,[%i6+%o4]0x80	! Mem[0000000010181408] = 0ff22520
!	Mem[0000000010001410] = 27937675 786843f7, %l2 = ffff993e, %l3 = 00000010
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 00000000786843f7 0000000027937675
!	Mem[00000000211c0000] = 993ec8b9, %l0 = 761aa9dec9e64c60
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 00000099000000ff
!	Mem[0000000030181410] = f1e2995e, %l3 = 0000000027937675
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 0000005e000000ff
!	Mem[0000000030141400] = 398e5534, %l1 = ce61d65ab6412789
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 00000000398e5534
!	Mem[000000001018141a] = 26d6aad3, %l6 = 0000000000000057
	ldstuba	[%i6+0x01a]%asi,%l6	! %l6 = 000000aa000000ff
!	%f13 = 47f5580a, Mem[0000000010181414] = 74564f1e
	st	%f13,[%i6+0x014]	! Mem[0000000010181414] = 47f5580a
!	%l1 = 00000000398e5534, Mem[00000000300c1400] = 892741b65ad661ce
	stxa	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000398e5534
!	Starting 10 instruction Load Burst
!	%f3  = ee91ed0b, %f10 = aa34c928
	fcmpes	%fcc0,%f3 ,%f10		! %fcc0 = 1

p0_label_3:
!	Mem[0000000010041408] = 431962a6e10e96eb, %f10 = aa34c928 2a4c1902
	ldda	[%i1+0x008]%asi,%f10	! %f10 = 431962a6 e10e96eb
!	%l6 = 00000000000000aa, %l5 = 00000000000000a3, %l1 = 00000000398e5534
	and	%l6,%l5,%l1		! %l1 = 00000000000000a2
!	%l1 = 00000000000000a2, %l1 = 00000000000000a2, %l1 = 00000000000000a2
	sub	%l1,%l1,%l1		! %l1 = 0000000000000000
!	Mem[0000000010041408] = 431962a6e10e96eb, %l2 = 00000000786843f7
	ldxa	[%i1+0x008]%asi,%l2	! %l2 = 431962a6e10e96eb
!	Mem[0000000030141400] = b641278984dc10e1, %f10 = 431962a6 e10e96eb
	ldda	[%i5+%g0]0x81,%f10	! %f10 = b6412789 84dc10e1
!	%l4 = 2f2cf2c28f35cba1, %l6 = 00000000000000aa, %y  = 00000000
	smul	%l4,%l6,%l3		! %l3 = ffffffb519b938ea, %y = ffffffb5
!	%f0  = 7fad7583, %f10 = b6412789, %f13 = 47f5580a
	fadds	%f0 ,%f10,%f13		! %f13 = 7fed7583
!	Mem[00000000300c1400] = 00000000, %l5 = 00000000000000a3
	ldsba	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = e932f07f, %l1 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l1	! %l1 = ffffffffe932f07f
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = c47227b7, %l1 = ffffffffe932f07f
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 00000000c47227b7

p0_label_4:
!	Mem[0000000010101434] = b4d360de, %l4 = 2f2cf2c28f35cba1
	swap	[%i4+0x034],%l4		! %l4 = 00000000b4d360de
!	%f14 = 0ff22520 1e354b08, Mem[0000000010001400] = 0903e604 7d08d239
	stda	%f14,[%i0+0x000]%asi	! Mem[0000000010001400] = 0ff22520 1e354b08
!	%l6 = 000000aa, %l7 = b2ee11ad, Mem[0000000010041410] = e932f07f 5ab9110c
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000aa b2ee11ad
!	%f15 = 1e354b08, Mem[0000000010041408] = 431962a6
	sta	%f15,[%i1+%o4]0x80	! Mem[0000000010041408] = 1e354b08
!	%l4 = b4d360de, %l5 = 00000000, Mem[0000000030001400] = 1a28fb61 336a3c7d
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = b4d360de 00000000
!	Mem[00000000300c1400] = 00000000, %l1 = 00000000c47227b7
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%l2 = e10e96eb, %l3 = 19b938ea, Mem[0000000010181430] = 04e05b1b eaa32946
	std	%l2,[%i6+0x030]		! Mem[0000000010181430] = e10e96eb 19b938ea
!	%f22 = f1431b73 025bbbfa, Mem[0000000010181408] = 2025f20f 81c48226
	stda	%f22,[%i6+%o4]0x88	! Mem[0000000010181408] = f1431b73 025bbbfa
!	Mem[0000000010041400] = de6588f7, %l4 = 00000000b4d360de
	ldstuba	[%i1+%g0]0x88,%l4	! %l4 = 000000f7000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010041400] = ff8865de 2345cf60 1e354b08 e10e96eb
!	Mem[0000000010041410] = aa000000 ad11eeb2 0f369c27 53b63443
!	Mem[0000000010041420] = e7e8b55b b7a00186 7ee6ac96 87f2d5cb
!	Mem[0000000010041430] = 70078c09 70791367 d3a4448c 2cba1041
	ldda	[%i1]ASI_BLK_PL,%f0	! Block Load from 0000000010041400

p0_label_5:
!	Mem[00000000100c1438] = 2fbaa38f, %f18 = 227da9f1
	lda	[%i3+0x038]%asi,%f18	! %f18 = 2fbaa38f
!	Mem[0000000010101400] = a5f0c390, %l4 = 00000000000000f7
	ldsha	[%i4+%g0]0x80,%l4	! %l4 = ffffffffffffa5f0
!	Mem[0000000030141408] = b0a2d071c2064e31, %f22 = f1431b73 025bbbfa
	ldda	[%i5+%o4]0x81,%f22	! %f22 = b0a2d071 c2064e31
!	Mem[00000000218000c0] = 5553f237, %l6 = 00000000000000aa
	ldsb	[%o3+0x0c0],%l6		! %l6 = 0000000000000055
!	Mem[0000000030041410] = bd2cc120, %f30 = 51d96e56
	lda	[%i1+%o5]0x81,%f30	! %f30 = bd2cc120
!	Mem[0000000010181430] = e10e96eb, %l7 = 00000000b2ee11ad
	ldsba	[%i6+0x030]%asi,%l7	! %l7 = ffffffffffffffe1
!	Mem[000000001000141c] = d6e04e0f, %l0 = 0000000000000099
	ldub	[%i0+0x01c],%l0		! %l0 = 00000000000000d6
!	Mem[0000000010141400] = e00dc980 dbe7fe5a 4babefe5 191aa1fc
!	Mem[0000000010141410] = 7fd980ed f904cd83 1e162ee4 015e7453
!	Mem[0000000010141420] = 93d84b5f 26c0a520 c9666182 66eae3a5
!	Mem[0000000010141430] = 393873ce a444290d 0b78fedc d63e8b28
	ldda	[%i5]ASI_BLK_PL,%f0	! Block Load from 0000000010141400
!	Mem[00000000201c0000] = ffde2191, %l1 = 0000000000000000
	lduh	[%o0+%g0],%l1		! %l1 = 000000000000ffde
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (2)
!	%l6 = 0000000000000055, Mem[0000000010041408] = 084b351e
	stha	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 084b0055

p0_label_6:
!	Mem[00000000100c1424] = a42f7dfb, %l1 = 0000ffde, %l4 = ffffa5f0
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000a42f7dfb
!	%l5 = 0000000000000000, Mem[0000000030101400] = d07243ea7ff032e9
	stxa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000000
!	Mem[0000000030141400] = 892741b6, %l3 = ffffffb519b938ea
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 00000000892741b6
!	%l6 = 0000000000000055, Mem[0000000030101410] = 63eda791
	stha	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 0055a791
!	%l5 = 0000000000000000, Mem[00000000100c1408] = 95fbb146
	stwa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Mem[00000000100c1404] = 3c3564da, %l3 = 00000000892741b6, %asi = 80
	swapa	[%i3+0x004]%asi,%l3	! %l3 = 000000003c3564da
!	Mem[0000000030101410] = 0055a791, %l5 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 000000000055a791
!	%f18 = 2fbaa38f, Mem[000000001000142c] = 9f6e605d
	st	%f18,[%i0+0x02c]	! Mem[000000001000142c] = 2fbaa38f
!	%f10 = a5e3ea66 826166c9, Mem[0000000030141408] = 71d0a2b0 314e06c2
	stda	%f10,[%i5+%o4]0x89	! Mem[0000000030141408] = a5e3ea66 826166c9
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 2025f20f, %l2 = 431962a6e10e96eb
	ldsba	[%i0+%g0]0x88,%l2	! %l2 = 000000000000000f

p0_label_7:
!	Mem[00000000100c1400] = 24cf0992, %l2 = 000000000000000f
	lduba	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000092
!	Mem[0000000010141408] = 4babefe5 191aa1fc, %l4 = a42f7dfb, %l5 = 0055a791
	ldd	[%i5+%o4],%l4		! %l4 = 000000004babefe5 00000000191aa1fc
!	Mem[0000000010101408] = ef49f822, %f6  = 53745e01
	lda	[%i4+%o4]0x88,%f6 	! %f6 = ef49f822
!	Mem[0000000030041410] = 20c12cbd, %l4 = 000000004babefe5
	lduha	[%i1+%o5]0x89,%l4	! %l4 = 0000000000002cbd
!	Mem[0000000020800000] = 392f7fd0, %l0 = 00000000000000d6
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 000000000000392f
!	Mem[0000000010041408] = 084b0055, %f10 = a5e3ea66
	lda	[%i1+%o4]0x88,%f10	! %f10 = 084b0055
!	Mem[0000000010041400] = 60cf4523 de6588ff, %l0 = 0000392f, %l1 = 0000ffde
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 00000000de6588ff 0000000060cf4523
!	Mem[00000000300c1400] = 34558e39 000000ff, %l0 = de6588ff, %l1 = 60cf4523
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 00000000000000ff 0000000034558e39
!	Mem[0000000010181420] = f894d1ea219ea414, %f0  = 5afee7db 80c90de0
	ldda	[%i6+0x020]%asi,%f0 	! %f0  = f894d1ea 219ea414
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000002cbd, Mem[0000000010141410] = 7fd980ed
	stba	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = bdd980ed

p0_label_8:
!	%l3 = 000000003c3564da, Mem[00000000100c1408] = 00000000
	stwa	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 3c3564da
!	%l5 = 00000000191aa1fc, Mem[0000000021800100] = 797fa456, %asi = 80
	stha	%l5,[%o3+0x100]%asi	! Mem[0000000021800100] = a1fca456
!	Mem[0000000010101420] = 04557cfd69b25e34, %l2 = 0000000000000092, %l5 = 00000000191aa1fc
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 04557cfd69b25e34
!	%f16 = 4b589d0a 49834273, %l0 = 00000000000000ff
!	Mem[0000000010141430] = 393873cea444290d
	add	%i5,0x030,%g1
	stda	%f16,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010141430] = 734283490a9d584b
!	%l0 = 00000000000000ff, Mem[0000000010141410] = ed80d9bd
	stha	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = ed8000ff
!	%l1 = 0000000034558e39, Mem[0000000010181408] = 025bbbfa
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 025bbb39
!	%l6 = 00000055, %l7 = ffffffe1, Mem[0000000010181400] = 5ab9110c 216df3f4
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000055 ffffffe1
!	%l4 = 0000000000002cbd, Mem[0000000010081400] = 2ebe852a
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00002cbd
!	Mem[0000000010141408] = e5efab4b, %l6 = 0000000000000055
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 0000004b000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff3ec8b9, %l1 = 0000000034558e39
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffff3e

p0_label_9:
!	Mem[00000000211c0000] = ff3ec8b9, %l6 = 000000000000004b
	ldub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030001400] = de60d3b4, %l7 = ffffffffffffffe1
	lduba	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000b4
!	Mem[0000000030001408] = 60d8412a 474dcccf, %l4 = 00002cbd, %l5 = 69b25e34
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 0000000060d8412a 00000000474dcccf
!	Mem[0000000010141408] = ffabefe5 191aa1fc, %l2 = 00000092, %l3 = 3c3564da
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 00000000ffabefe5 00000000191aa1fc
!	Mem[0000000030141400] = e110dc8419b938ea, %l6 = 00000000000000ff
	ldxa	[%i5+%g0]0x89,%l6	! %l6 = e110dc8419b938ea
!	Mem[00000000300c1410] = 8c941997378b6def, %l0 = 00000000000000ff
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = 8c941997378b6def
!	Mem[0000000010081400] = 00002cbd, %l3 = 00000000191aa1fc
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 0000000000002cbd
!	Mem[0000000030081400] = ed5838a4, %l4 = 0000000060d8412a
	lduba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000a4
!	Mem[0000000010141418] = 1e162ee4015e7453, %l5 = 00000000474dcccf
	ldx	[%i5+0x018],%l5		! %l5 = 1e162ee4015e7453
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000b4, Mem[000000001014142b] = c9666182, %asi = 80
	stba	%l7,[%i5+0x02b]%asi	! Mem[0000000010141428] = c96661b4

p0_label_10:
!	%f11 = 826166c9, Mem[0000000010101408] = ef49f822
	sta	%f11,[%i4+%o4]0x88	! Mem[0000000010101408] = 826166c9
!	Mem[0000000010141400] = e00dc980, %l5 = 1e162ee4015e7453
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 00000000e00dc980
!	%f7  = e42e161e, Mem[0000000010001434] = d8a985bd
	sta	%f7 ,[%i0+0x034]%asi	! Mem[0000000010001434] = e42e161e
!	%l2 = ffabefe5, %l3 = 00002cbd, Mem[0000000030101410] = 00000000 d5f113c5
	stda	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = ffabefe5 00002cbd
!	%l0 = 8c941997378b6def, Mem[0000000010041410] = b2ee11ad000000aa
	stxa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 8c941997378b6def
!	%l0 = 8c941997378b6def, Mem[00000000100c1400] = 9209cf24892741b6
	stxa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 8c941997378b6def
!	%l2 = ffabefe5, %l3 = 00002cbd, Mem[0000000030101408] = 245333a3 74b63173
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = ffabefe5 00002cbd
!	Mem[0000000010001410] = f7436878, %l3 = 0000000000002cbd
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 000000f7000000ff
!	Mem[0000000030041410] = 20c12cbd, %l4 = 00000000000000a4
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 0000000020c12cbd
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffde2191, %l4 = 0000000020c12cbd
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = ffffffffffffffde

p0_label_11:
!	%f21 = 243b2037, %f2  = fca11a19, %f18 = 2fbaa38f
	fsubs	%f21,%f2 ,%f18		! %f18 = 7ca11a19
!	Mem[0000000030181400] = 5ec4f30c, %l1 = ffffffffffffff3e
	ldswa	[%i6+%g0]0x89,%l1	! %l1 = 000000005ec4f30c
!	Mem[0000000010081400] = bd2c0000, %l2 = 00000000ffabefe5
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001414] = 75769327, %l0 = 8c941997378b6def
	lduw	[%i0+0x014],%l0		! %l0 = 0000000075769327
!	Mem[0000000010001400] = 2025f20f, %l0 = 0000000075769327
	lduha	[%i0+%g0]0x88,%l0	! %l0 = 000000000000f20f
!	Mem[0000000030181400] = 5ec4f30c, %f25 = 713aee24
	lda	[%i6+%g0]0x89,%f25	! %f25 = 5ec4f30c
!	Mem[0000000010141408] = ffabefe5, %l4 = ffffffffffffffde
	ldsha	[%i5+%o4]0x80,%l4	! %l4 = ffffffffffffffab
!	Mem[0000000030141408] = c9666182 66eae3a5, %l4 = ffffffab, %l5 = e00dc980
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 00000000c9666182 0000000066eae3a5
!	Mem[0000000010141410] = ed8000ff, %l0 = 000000000000f20f
	ldsba	[%i5+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f2  = fca11a19 e5efab4b, %l1 = 000000005ec4f30c
!	Mem[0000000030101430] = d83bd0f87beed065
	add	%i4,0x030,%g1
	stda	%f2,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030101430] = d83bd0f87beed065

p0_label_12:
!	%f8  = 20a5c026 5f4bd893, Mem[0000000010141410] = ff0080ed f904cd83
	stda	%f8 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 20a5c026 5f4bd893
!	Mem[0000000010081418] = 9dc993a3, %l4 = 00000000c9666182
	swap	[%i2+0x018],%l4		! %l4 = 000000009dc993a3
!	%f10 = 084b0055 826166c9, Mem[0000000030101408] = e5efabff bd2c0000
	stda	%f10,[%i4+%o4]0x81	! Mem[0000000030101408] = 084b0055 826166c9
!	Mem[0000000030081408] = c7382f17, %l2 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 00000000c7382f17
!	Mem[0000000010101408] = 826166c9, %l1 = 000000005ec4f30c
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 000000c9000000ff
!	%l3 = 00000000000000f7, Mem[0000000030081410] = d0643710
	stwa	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000f7
!	Mem[0000000030001400] = b4d360de, %l5 = 0000000066eae3a5
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 000000b4000000ff
!	%f16 = 4b589d0a 49834273, Mem[0000000030141408] = c9666182 66eae3a5
	stda	%f16,[%i5+%o4]0x81	! Mem[0000000030141408] = 4b589d0a 49834273
!	%l5 = 00000000000000b4, Mem[0000000030081408] = 00000000
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000b4
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 691fd57f, %l0 = ffffffffffffffff
	ldsh	[%o1+0x040],%l0		! %l0 = 000000000000691f

p0_label_13:
!	Mem[0000000010141410] = 26c0a520, %l6 = e110dc8419b938ea
	lduha	[%i5+%o5]0x88,%l6	! %l6 = 000000000000a520
!	Mem[00000000300c1410] = ef6d8b379719948c, %l1 = 00000000000000c9
	ldxa	[%i3+%o5]0x89,%l1	! %l1 = ef6d8b379719948c
!	Mem[0000000010041410] = 378b6def, %l3 = 00000000000000f7
	lduwa	[%i1+%o5]0x88,%l3	! %l3 = 00000000378b6def
!	Mem[0000000010141408] = ffabefe5, %f13 = ce733839
	lda	[%i5+%o4]0x80,%f13	! %f13 = ffabefe5
!	Mem[00000000100c1408] = 3c3564da, %l5 = 00000000000000b4
	lduwa	[%i3+%o4]0x88,%l5	! %l5 = 000000003c3564da
!	Mem[0000000030181408] = ad2ae708, %l6 = 000000000000a520
	lduba	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000ad
!	Mem[00000000100c1404] = 378b6def, %l1 = ef6d8b379719948c
	lduwa	[%i3+0x004]%asi,%l1	! %l1 = 00000000378b6def
!	Mem[0000000030101408] = 084b0055, %l3 = 00000000378b6def
	ldsba	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000008
!	Mem[00000000100c1424] = a42f7dfb, %l0 = 000000000000691f
	ldsha	[%i3+0x024]%asi,%l0	! %l0 = ffffffffffffa42f
!	Starting 10 instruction Store Burst
!	Mem[0000000010101428] = b4f63201a2a323db, %l0 = ffffffffffffa42f, %l2 = 00000000c7382f17
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l0,%l2	! %l2 = b4f63201a2a323db

p0_label_14:
!	%l2 = b4f63201a2a323db, Mem[00000000211c0000] = ff3ec8b9, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = db3ec8b9
!	Mem[000000001000141f] = d6e04e0f, %l2 = b4f63201a2a323db
	ldstuba	[%i0+0x01f]%asi,%l2	! %l2 = 0000000f000000ff
!	%l6 = 000000ad, %l7 = 000000b4, Mem[0000000010081438] = f8fdf5d0 49742534
	std	%l6,[%i2+0x038]		! Mem[0000000010081438] = 000000ad 000000b4
!	%l1 = 00000000378b6def, Mem[0000000030141410] = a328c6e084908f0f
	stxa	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000378b6def
!	%l2 = 0000000f, %l3 = 00000008, Mem[0000000010041400] = ff8865de 2345cf60
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000f 00000008
!	%l1 = 00000000378b6def, Mem[0000000010041414] = 9719948c, %asi = 80
	stwa	%l1,[%i1+0x014]%asi	! Mem[0000000010041414] = 378b6def
!	%l2 = 000000000000000f, Mem[0000000010001400] = 2025f20f
	stwa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000f
!	Mem[0000000010141410] = 26c0a520, %l6 = 00000000000000ad
	ldstuba	[%i5+%o5]0x88,%l6	! %l6 = 00000020000000ff
!	Mem[0000000030141410] = 00000000, %l2 = 000000000000000f
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = e02a34925ec4f30c, %l7 = 00000000000000b4
	ldxa	[%i6+%g0]0x89,%l7	! %l7 = e02a34925ec4f30c

p0_label_15:
!	Mem[0000000010081410] = a6ad1112, %l0 = ffffffffffffa42f
	ldsba	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000012
!	Mem[0000000030141410] = ef6d8b37 0000000f, %l2 = 00000000, %l3 = 00000008
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 000000000000000f 00000000ef6d8b37
!	Mem[0000000010081410] = 1211ada601b32f0a, %l1 = 00000000378b6def
	ldxa	[%i2+%o5]0x80,%l1	! %l1 = 1211ada601b32f0a
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010081400] = 00002cbd 01333f72 510501e2 dab6b9b2
!	Mem[0000000010081410] = 1211ada6 01b32f0a c9666182 29783887
!	Mem[0000000010081420] = fc058a65 a383718a 14c478fb f2e76961
!	Mem[0000000010081430] = 0cce34bc e5951aba 000000ad 000000b4
	ldda	[%i2]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[000000001014142c] = 66eae3a5, %l6 = 0000000000000020
	ldsh	[%i5+0x02e],%l6		! %l6 = ffffffffffffe3a5
!	Mem[0000000010181420] = f894d1ea, %l6 = ffffffffffffe3a5
	ldsha	[%i6+0x020]%asi,%l6	! %l6 = fffffffffffff894
!	Mem[0000000010001410] = 786843ff, %l6 = fffffffffffff894
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = de60d3ff, %l3 = 00000000ef6d8b37
	ldsha	[%i0+%g0]0x89,%l3	! %l3 = ffffffffffffd3ff
!	Mem[00000000100c141c] = e11d7c54, %l6 = ffffffffffffffff
	lduba	[%i3+0x01d]%asi,%l6	! %l6 = 000000000000001d
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000012, Mem[0000000030101400] = 00000000
	stha	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00120000

p0_label_16:
!	%l2 = 0000000f, %l3 = ffffd3ff, Mem[0000000010041400] = 0000000f 00000008
	std	%l2,[%i1+%g0]		! Mem[0000000010041400] = 0000000f ffffd3ff
!	%l6 = 000000000000001d, Mem[0000000010101408] = 099772b4826166ff
	stxa	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000000000001d
!	%f12 = 0d2944a4 ffabefe5, Mem[0000000030181410] = f1e299ff 61ceed07
	stda	%f12,[%i6+%o5]0x89	! Mem[0000000030181410] = 0d2944a4 ffabefe5
!	%f14 = 288b3ed6 dcfe780b, %l4 = 000000009dc993a3
!	Mem[0000000010141428] = c96661b466eae3a5
	add	%i5,0x028,%g1
	stda	%f14,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010141428] = 0b7861b4663ee328
!	%l3 = ffffffffffffd3ff, %l0 = 0000000000000012, %l1 = 1211ada601b32f0a
	udivx	%l3,%l0,%l1		! %l1 = 0e38e38e38e38bc7
!	%l0 = 0000000000000012, Mem[00000000211c0000] = db3ec8b9
	sth	%l0,[%o2+%g0]		! Mem[00000000211c0000] = 0012c8b9
!	%f2  = fca11a19 e5efab4b, %l0 = 0000000000000012
!	Mem[0000000030081420] = b3409e892a2439d5
	add	%i2,0x020,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_S ! Mem[0000000030081420] = fca11a192a2439d5
!	%l4 = 000000009dc993a3, Mem[0000000030101410] = ffabefe5
	stwa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 9dc993a3
!	Mem[0000000010141410] = ffa5c026, %l6 = 000000000000001d
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ffa5c026, %l3 = ffffffffffffd3ff
	lduba	[%i5+%o5]0x80,%l3	! %l3 = 00000000000000ff

p0_label_17:
!	Mem[0000000030081400] = ed5838a4, %l6 = 00000000000000ff
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 00000000ed5838a4
!	Mem[0000000010181420] = f894d1ea, %l1 = 0e38e38e38e38bc7
	lduw	[%i6+0x020],%l1		! %l1 = 00000000f894d1ea
!	Mem[0000000010101424] = 69b25e34, %l6 = 00000000ed5838a4
	lduh	[%i4+0x026],%l6		! %l6 = 0000000000005e34
!	Mem[0000000030001400] = ffd360de00000000, %l5 = 000000003c3564da
	ldxa	[%i0+%g0]0x81,%l5	! %l5 = ffd360de00000000
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030101400] = 00120000 00000000 084b0055 826166c9
!	Mem[0000000030101410] = 9dc993a3 00002cbd ab8637c4 5dc79274
!	Mem[0000000030101420] = 4a06ab7d fb087c2a b6ce9d67 5e860d17
!	Mem[0000000030101430] = d83bd0f8 7beed065 8519824d 01c7a1db
	ldda	[%i4]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030101400
!	Mem[000000001014140c] = 191aa1fc, %l0 = 0000000000000012
	lduha	[%i5+0x00e]%asi,%l0	! %l0 = 000000000000a1fc
!	Mem[0000000010041400] = 0000000f, %l0 = 000000000000a1fc
	ldsha	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141428] = 0b7861b4, %f21 = a6ad1112
	ld	[%i5+0x028],%f21	! %f21 = 0b7861b4
!	Mem[00000000218001c0] = 8aec1988, %l5 = ffd360de00000000
	lduba	[%o3+0x1c1]%asi,%l5	! %l5 = 00000000000000ec
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000005e34, Mem[00000000300c1400] = ff000000
	stwa	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00005e34

p0_label_18:
!	%l5 = 00000000000000ec, Mem[000000001014142c] = 663ee328
	stw	%l5,[%i5+0x02c]		! Mem[000000001014142c] = 000000ec
!	%l7 = e02a34925ec4f30c, Mem[0000000010101410] = 8af4d862b43e66f3
	stxa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = e02a34925ec4f30c
!	%l2 = 0000000f, %l3 = 000000ff, Mem[0000000010181410] = 79a6db06 47f5580a
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000f 000000ff
!	%l6 = 0000000000005e34, Mem[0000000030001400] = de60d3ff
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00005e34
!	Mem[0000000030041410] = 000000a4, %l5 = 00000000000000ec
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000a4
!	%f0  = 00000000 00001200 c9666182 55004b08
!	%f4  = bd2c0000 a393c99d 7492c75d c43786ab
!	%f8  = 2a7c08fb 7dab064a 170d865e 679dceb6
!	%f12 = 65d0ee7b f8d03bd8 dba1c701 4d821985
	stda	%f0,[%i4]ASI_COMMIT_P	! Block Store to 0000000010101400
!	Mem[000000001014142c] = 000000ec, %l2 = 000000000000000f
	swap	[%i5+0x02c],%l2		! %l2 = 00000000000000ec
!	%f20 = 0a2fb301 0b7861b4, %l1 = 00000000f894d1ea
!	Mem[0000000030181428] = 1cd654bddd4a3a7e
	add	%i6,0x028,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_S ! Mem[0000000030181428] = 0a2fb301dd4a3a7e
!	%f20 = 0a2fb301 0b7861b4, %l2 = 00000000000000ec
!	Mem[00000000300c1438] = 16bcdb2fdad8f819
	add	%i3,0x038,%g1
	stda	%f20,[%g1+%l2]ASI_PST16_S ! Mem[00000000300c1438] = 0a2fb301dad8f819
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = a43858ed, %f23 = 826166c9
	lda	[%i2+%g0]0x81,%f23	! %f23 = a43858ed

p0_label_19:
!	Mem[0000000010041410] = ef6d8b37378b6def, %f22 = 87387829 a43858ed
	ldda	[%i1+%o5]0x80,%f22	! %f22 = ef6d8b37 378b6def
!	Mem[0000000010081408] = 510501e2, %l3 = 00000000000000ff
	ldswa	[%i2+%o4]0x80,%l3	! %l3 = 00000000510501e2
!	Mem[00000000100c1400] = 8c941997378b6def, %l3 = 00000000510501e2
	ldxa	[%i3+%g0]0x80,%l3	! %l3 = 8c941997378b6def
!	Mem[0000000030141400] = e110dc8419b938ea, %l6 = 0000000000005e34
	ldxa	[%i5+%g0]0x89,%l6	! %l6 = e110dc8419b938ea
!	Mem[0000000030141410] = 0000000f, %l0 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l0	! %l0 = 000000000000000f
!	Mem[0000000010081410] = 0a2fb301a6ad1112, %f18 = b2b9b6da e2010551
	ldda	[%i2+%o5]0x88,%f18	! %f18 = 0a2fb301 a6ad1112
!	Mem[0000000010001414] = 75769327, %l7 = e02a34925ec4f30c
	lduha	[%i0+0x016]%asi,%l7	! %l7 = 0000000000009327
!	Mem[0000000010141408] = ffabefe5, %f17 = bd2c0000
	ld	[%i5+%o4],%f17	! %f17 = ffabefe5
!	Mem[0000000010181410] = 0000000f, %f26 = 6169e7f2
	lda	[%i6+%o5]0x80,%f26	! %f26 = 0000000f
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010101400] = 00000000, %l6 = e110dc8419b938ea
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000

p0_label_20:
!	Mem[0000000010041400] = 0f000000, %l7 = 0000000000009327
	swapa	[%i1+%g0]0x88,%l7	! %l7 = 000000000f000000
!	Mem[0000000010141410] = ffa5c026, %l7 = 000000000f000000
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	%l1 = 00000000f894d1ea, Mem[0000000030141410] = 0000000f
	stwa	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = f894d1ea
!	Mem[0000000030001400] = 00005e34, %l2 = 00000000000000ec
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 00000034000000ff
!	%f8  = 2a7c08fb 7dab064a, Mem[0000000010181428] = c5e16727 2f0a5bf4
	std	%f8 ,[%i6+0x028]	! Mem[0000000010181428] = 2a7c08fb 7dab064a
!	%l3 = 8c941997378b6def, Mem[0000000010081400] = bd2c0000
	stwa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 378b6def
!	%f30 = b4000000 ad000000, Mem[0000000030141408] = 0a9d584b 73428349
	stda	%f30,[%i5+%o4]0x89	! Mem[0000000030141408] = b4000000 ad000000
!	%f17 = ffabefe5, Mem[0000000010101408] = 826166c9
	sta	%f17,[%i4+%o4]0x88	! Mem[0000000010101408] = ffabefe5
!	%l1 = 00000000f894d1ea, Mem[0000000010141400] = 53745e01
	stwa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = f894d1ea
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = e5efabff, %f28 = ba1a95e5
	lda	[%i5+%o4]0x88,%f28	! %f28 = e5efabff

p0_label_21:
!	Mem[0000000020800040] = 691fd57f, %l7 = 00000000000000ff
	lduh	[%o1+0x040],%l7		! %l7 = 000000000000691f
!	Mem[0000000030041408] = 227da9f1, %l2 = 0000000000000034
	lduha	[%i1+%o4]0x81,%l2	! %l2 = 000000000000227d
!	Mem[0000000030141408] = 000000ad, %l0 = 000000000000000f
	lduwa	[%i5+%o4]0x81,%l0	! %l0 = 00000000000000ad
!	Mem[0000000010181410] = 0f000000, %f11 = 679dceb6
	lda	[%i6+%o5]0x88,%f11	! %f11 = 0f000000
!	Mem[00000000100c1408] = da64353c ba4c53f9, %l2 = 0000227d, %l3 = 378b6def
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 00000000da64353c 00000000ba4c53f9
!	%l3 = 00000000ba4c53f9, Mem[0000000010181408] = 39bb5b02
	stha	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 53f95b02
!	Mem[00000000201c0000] = ffde2191, %l5 = 00000000000000a4
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000ffde
!	Mem[0000000030081400] = a43858ed, %l2 = 00000000da64353c
	lduwa	[%i2+%g0]0x81,%l2	! %l2 = 00000000a43858ed
!	Mem[0000000010041410] = ef6d8b37 378b6def, %l4 = 9dc993a3, %l5 = 0000ffde
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 00000000378b6def 00000000ef6d8b37
!	Starting 10 instruction Store Burst
!	%f16 = 723f3301 ffabefe5 0a2fb301 a6ad1112
!	%f20 = 0a2fb301 0b7861b4 ef6d8b37 378b6def
!	%f24 = 8a7183a3 658a05fc 0000000f fb78c414
!	%f28 = e5efabff bc34ce0c b4000000 ad000000
	stda	%f16,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400

p0_label_22:
!	%l6 = 0000000000000000, Mem[0000000010001400] = 0f000000
	stwa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l4 = 00000000378b6def, Mem[0000000030141410] = ead194f8
	stha	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 6def94f8
!	%f2  = c9666182 55004b08, %l6 = 0000000000000000
!	Mem[00000000100c1408] = da64353cba4c53f9
	add	%i3,0x008,%g1
	stda	%f2,[%g1+%l6]ASI_PST8_P ! Mem[00000000100c1408] = da64353cba4c53f9
!	%l5 = 00000000ef6d8b37, Mem[0000000030181410] = ffabefe5
	stba	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = ffabef37
!	%l2 = a43858ed, %l3 = ba4c53f9, Mem[0000000030041408] = f1a97d22 9f15ae9e
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = a43858ed ba4c53f9
!	%l0 = 00000000000000ad, Mem[0000000021800180] = 69b868e0
	sth	%l0,[%o3+0x180]		! Mem[0000000021800180] = 00ad68e0
!	%f6  = 7492c75d c43786ab, Mem[0000000030141410] = f894ef6d ef6d8b37
	stda	%f6 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 7492c75d c43786ab
!	%f4  = bd2c0000, %f0  = 00000000, %f12 = 65d0ee7b f8d03bd8
	fsmuld	%f4 ,%f0 ,%f12		! %f12 = 80000000 00000000
!	Mem[0000000010101400] = 19b938ea, %l7 = 000000000000691f
	ldstuba	[%i4+%g0]0x88,%l7	! %l7 = 000000ea000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 000000b4, %f3  = 55004b08
	lda	[%i2+%o4]0x89,%f3 	! %f3 = 000000b4

p0_label_23:
!	Mem[0000000030101410] = a393c99d, %l5 = 00000000ef6d8b37
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = ffffffffa393c99d
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010041400] = 723f3301, %l2 = 00000000a43858ed
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 000000000000723f
!	Mem[00000000201c0000] = ffde2191, %l1 = 00000000f894d1ea
	ldsba	[%o0+0x001]%asi,%l1	! %l1 = ffffffffffffffde
!	Mem[00000000100c141c] = e11d7c54, %l5 = ffffffffa393c99d
	ldsh	[%i3+0x01e],%l5		! %l5 = 0000000000007c54
!	Mem[0000000030141400] = ea38b919, %l6 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 000000000000ea38
!	Mem[0000000010101410] = bd2c0000, %l2 = 000000000000723f
	lduwa	[%i4+%o5]0x80,%l2	! %l2 = 00000000bd2c0000
!	Mem[0000000030181400] = 5ec4f30c, %l7 = 00000000000000ea
	ldsba	[%i6+%g0]0x89,%l7	! %l7 = 000000000000000c
!	Mem[0000000030141400] = ea38b919, %l0 = 00000000000000ad
	lduha	[%i5+%g0]0x81,%l0	! %l0 = 000000000000ea38
!	Mem[0000000010181408] = 025bf953, %l7 = 000000000000000c
	ldswa	[%i6+%o4]0x88,%l7	! %l7 = 00000000025bf953
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = e5efabff, %l1 = ffffffffffffffde
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 000000e5000000ff

p0_label_24:
!	%f5  = a393c99d, Mem[0000000030101408] = 55004b08
	sta	%f5 ,[%i4+%o4]0x89	! Mem[0000000030101408] = a393c99d
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 000000000000ea38
	setx	0x7bd66a0034303574,%g7,%l0 ! %l0 = 7bd66a0034303574
!	%l1 = 00000000000000e5
	setx	0x3b076ea7a7119edd,%g7,%l1 ! %l1 = 3b076ea7a7119edd
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7bd66a0034303574
	setx	0x52ab38efe956f288,%g7,%l0 ! %l0 = 52ab38efe956f288
!	%l1 = 3b076ea7a7119edd
	setx	0xf5ea501fc06f4b9c,%g7,%l1 ! %l1 = f5ea501fc06f4b9c
!	Mem[00000000100c143d] = 79887bcf, %l1 = f5ea501fc06f4b9c
	ldstuba	[%i3+0x03d]%asi,%l1	! %l1 = 00000088000000ff
!	Mem[0000000010141400] = ead194f8, %l4 = 00000000378b6def
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 000000ea000000ff
!	Mem[0000000010181410] = 0f000000, %l5 = 0000000000007c54
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081414] = 01b32f0a, %l4 = 00000000000000ea
	swap	[%i2+0x014],%l4		! %l4 = 0000000001b32f0a
!	Mem[0000000030181400] = 0cf3c45e, %l3 = 00000000ba4c53f9
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 000000000cf3c45e
!	%f24 = 8a7183a3 658a05fc, %l4 = 0000000001b32f0a
!	Mem[0000000010081410] = 1211ada6000000ea
	add	%i2,0x010,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_P ! Mem[0000000010081410] = 1211ada6650005ea
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 52ab38efe956f288
	setx	0x262d2dc86ce108b4,%g7,%l0 ! %l0 = 262d2dc86ce108b4
!	%l1 = 0000000000000088
	setx	0x7c8588481843111e,%g7,%l1 ! %l1 = 7c8588481843111e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 262d2dc86ce108b4
	setx	0xd8a6cd4fb6918f29,%g7,%l0 ! %l0 = d8a6cd4fb6918f29
!	%l1 = 7c8588481843111e
	setx	0x75fcc317be4661b6,%g7,%l1 ! %l1 = 75fcc317be4661b6
!	Starting 10 instruction Load Burst
!	%l7 = 00000000025bf953, imm = 0000000000000214, %l1 = 75fcc317be4661b6
	xnor	%l7,0x214,%l1		! %l1 = fffffffffda404b8

p0_label_25:
!	%f22 = ef6d8b37, %f2  = c9666182
	fcmps	%fcc2,%f22,%f2 		! %fcc2 = 1
!	Mem[0000000030041408] = a43858ed, %f31 = ad000000
	lda	[%i1+%o4]0x89,%f31	! %f31 = a43858ed
!	Mem[0000000030041400] = 4b589d0a 49834273 ed5838a4 f9534cba
!	Mem[0000000030041410] = ec000000 243b2037 f1431b73 025bbbfa
!	Mem[0000000030041420] = e7b888d8 713aee24 25947489 65663675
!	Mem[0000000030041430] = 374a5c79 d29b6627 51d96e56 470b17d0
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	%l6 = 000000000000ea38, imm = fffffffffffff077, %l7 = 00000000025bf953
	and	%l6,-0xf89,%l7		! %l7 = 000000000000e030
!	Mem[0000000030001408] = 60d8412a, %l1 = fffffffffda404b8
	ldsba	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000060
!	Mem[00000000100c1410] = 6b4447a8 aba8a6b1, %l2 = bd2c0000, %l3 = 0cf3c45e
	ldda	[%i3+%o5]0x88,%l2	! %l2 = 00000000aba8a6b1 000000006b4447a8
!	Mem[0000000010141410] = 93d84b5f26c0a5ff, %f2  = c9666182 000000b4
	ldda	[%i5+%o5]0x88,%f2 	! %f2  = 93d84b5f 26c0a5ff
!	Mem[000000001010143c] = 4d821985, %l6 = 000000000000ea38
	ldsha	[%i4+0x03c]%asi,%l6	! %l6 = 0000000000004d82
!	Mem[0000000010181410] = 0f0000ff, %l7 = 000000000000e030
	lduwa	[%i6+%o5]0x88,%l7	! %l7 = 000000000f0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 1e159191, %l2 = 00000000aba8a6b1
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 0000001e000000ff

p0_label_26:
!	%l4 = 0000000001b32f0a, Mem[0000000030001400] = ff5e000000000000
	stxa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000001b32f0a
!	%f6  = 7492c75d, Mem[0000000030001400] = 00000000
	sta	%f6 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 7492c75d
!	Mem[0000000010181410] = ff00000f, %l7 = 000000000f0000ff
	swap	[%i6+%o5],%l7		! %l7 = 00000000ff00000f
!	Mem[0000000010141410] = ffa5c026, %l6 = 0000000000004d82
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000300c1400] = 00005e34, %l1 = 0000000000000060
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001408] = 60d8412a, %l0 = d8a6cd4fb6918f29
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 0000000060d8412a
!	%l7 = 00000000ff00000f, Mem[0000000030181400] = ba4c53f9
	stwa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = ff00000f
!	Mem[0000000010041416] = 0b7861b4, %l7 = 00000000ff00000f
	ldstuba	[%i1+0x016]%asi,%l7	! %l7 = 00000061000000ff
!	%l1 = 0000000000000000, Mem[0000000010081410] = 1211ada6650005ea
	stxa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = 734283490a9d584b, %l4 = 0000000001b32f0a
	ldx	[%i5+0x030],%l4		! %l4 = 734283490a9d584b

p0_label_27:
!	Mem[0000000010001420] = 89724a09, %l4 = 734283490a9d584b
	ldsh	[%i0+0x022],%l4		! %l4 = 0000000000004a09
!	Mem[00000000300c1400] = ff005e34, %l6 = 00000000000000ff
	ldsba	[%i3+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041408] = 0a2fb301, %l2 = 000000000000001e
	ldsba	[%i1+0x00a]%asi,%l2	! %l2 = ffffffffffffffb3
!	Mem[0000000010101408] = ffefabff, %l0 = 0000000060d8412a
	ldsba	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030081408] = b4000000, %l7 = 0000000000000061
	lduba	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000b4
!	Mem[0000000010001400] = 00000000, %f1  = 00001200
	ld	[%i0+%g0],%f1 	! %f1 = 00000000
!	Mem[0000000010081410] = 00000000, %l2 = ffffffffffffffb3
	lduha	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141408] = 000000ad, %l1 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 0a2fb301, %l5 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000a2f
!	Starting 10 instruction Store Burst
!	%l4 = 00004a09, %l5 = 00000a2f, Mem[0000000010041408] = 01b32f0a 1211ada6
	stda	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00004a09 00000a2f

p0_label_28:
!	%f0  = 00000000 00000000, %l0 = ffffffffffffffff
!	Mem[0000000030181430] = c739ec771739cc66
	add	%i6,0x030,%g1
	stda	%f0,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030181430] = 0000000000000000
!	Mem[0000000010101400] = ff38b919, %l3 = 000000006b4447a8
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000300c1400] = ff005e34, %l4 = 0000000000004a09
	ldstuba	[%i3+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010141410] = ffa5c026 5f4bd893
	stda	%l2,[%i5+0x010]%asi	! Mem[0000000010141410] = 00000000 000000ff
!	Mem[00000000100c1436] = bfa0494d, %l5 = 0000000000000a2f
	ldstub	[%i3+0x036],%l5		! %l5 = 00000049000000ff
!	Mem[00000000300c1410] = 9719948c, %l3 = 00000000000000ff
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 0000008c000000ff
!	Mem[0000000030141410] = c43786ab, %l3 = 000000000000008c
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000c43786ab
!	Mem[0000000030141410] = 0000008c, %l4 = 00000000000000ff
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 000000000000008c
!	Mem[000000001014140c] = 191aa1fc, %l6 = ffffffffffffffff, %asi = 80
	swapa	[%i5+0x00c]%asi,%l6	! %l6 = 00000000191aa1fc
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff00000f, %l3 = 00000000c43786ab
	ldsba	[%i6+%g0]0x81,%l3	! %l3 = ffffffffffffffff

p0_label_29:
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000030101400] = 00120000 00000000 9dc993a3 826166c9
!	Mem[0000000030101410] = 9dc993a3 00002cbd ab8637c4 5dc79274
!	Mem[0000000030101420] = 4a06ab7d fb087c2a b6ce9d67 5e860d17
!	Mem[0000000030101430] = d83bd0f8 7beed065 8519824d 01c7a1db
	ldda	[%i4]ASI_BLK_AIUS,%f16	! Block Load from 0000000030101400
!	Mem[00000000300c1410] = 971994ff, %l0 = ffffffffffffffff
	lduha	[%i3+%o5]0x89,%l0	! %l0 = 00000000000094ff
!	Mem[00000000100c1420] = 8e99c375, %l5 = 0000000000000049
	lduba	[%i3+0x023]%asi,%l5	! %l5 = 0000000000000075
!	Mem[00000000100c1408] = 3c3564da, %l7 = 00000000000000b4
	lduba	[%i3+%o4]0x88,%l7	! %l7 = 00000000000000da
!	Mem[0000000010041400] = 723f3301, %l4 = 000000000000008c
	ldsba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000072
!	Mem[0000000010081438] = 000000ad000000b4, %f2  = 93d84b5f 26c0a5ff
	ldda	[%i2+0x038]%asi,%f2 	! %f2  = 000000ad 000000b4
!	%l2 = 0000000000000000, imm = 00000000000000b0, %l1 = 0000000000000000
	and	%l2,0x0b0,%l1		! %l1 = 0000000000000000
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 00000000000094ff
	setx	0x1bf1de17a77682d8,%g7,%l0 ! %l0 = 1bf1de17a77682d8
!	%l1 = 0000000000000000
	setx	0x681bbea8317f34c7,%g7,%l1 ! %l1 = 681bbea8317f34c7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1bf1de17a77682d8
	setx	0xa1d1b838367274b6,%g7,%l0 ! %l0 = a1d1b838367274b6
!	%l1 = 681bbea8317f34c7
	setx	0x82250bcfea584e8c,%g7,%l1 ! %l1 = 82250bcfea584e8c
!	Mem[0000000030041410] = ec000000, %l2 = 0000000000000000
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = ffffffffffffffec
!	Starting 10 instruction Store Burst
!	%l1 = 82250bcfea584e8c, Mem[0000000010101410] = bd2c0000
	stha	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 4e8c0000

p0_label_30:
!	%l4 = 0000000000000072, Mem[0000000010081424] = a383718a
	stb	%l4,[%i2+0x024]		! Mem[0000000010081424] = 7283718a
!	%l1 = 82250bcfea584e8c, Mem[0000000030181400] = 0f0000ff
	stwa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = ea584e8c
!	Mem[00000000100c1410] = aba8a6b1, %l7 = 00000000000000da
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 000000b1000000ff
!	%l5 = 0000000000000075, Mem[0000000010101410] = 4e8c0000
	stwa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000075
!	%l7 = 00000000000000b1, Mem[0000000010041400] = 01333f72
	stwa	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000b1
!	Mem[0000000010101408] = ffabefff, %l0 = a1d1b838367274b6
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 00000000ffabefff
!	%l2 = ffffffffffffffec, Mem[0000000030001408] = b6918f29
	stba	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = ec918f29
	membar	#Sync			! Added by membar checker (8)
!	%l1 = 82250bcfea584e8c, Mem[0000000030101400] = 0012000000000000
	stxa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 82250bcfea584e8c
!	Mem[0000000030081400] = ed5838a4, %l3 = ffffffffffffffff
	swapa	[%i2+%g0]0x89,%l3	! %l3 = 00000000ed5838a4
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 82250bcfea584e8c, %l3 = 00000000ed5838a4
	ldxa	[%i4+%g0]0x81,%l3	! %l3 = 82250bcfea584e8c

p0_label_31:
!	Mem[00000000211c0000] = 0012c8b9, %l5 = 0000000000000075
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000012
!	Mem[0000000010141400] = ffd194f8 dbe7fe5a ffabefe5 ffffffff
!	Mem[0000000010141410] = 00000000 000000ff 1e162ee4 015e7453
!	Mem[0000000010141420] = 93d84b5f 26c0a520 0b7861b4 0000000f
!	Mem[0000000010141430] = 73428349 0a9d584b 0b78fedc d63e8b28
	ldda	[%i5]ASI_BLK_P,%f0	! Block Load from 0000000010141400
!	%f24 = 4a06ab7d fb087c2a, %f22 = ab8637c4
	fxtos	%f24,%f22		! %f22 = 5e940d57
!	Mem[0000000030081400] = ffffffff, %l7 = 00000000000000b1
	lduha	[%i2+%g0]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010081410] = 00000000, %l7 = 000000000000ffff
	ldsha	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 378b6def, %l1 = 82250bcfea584e8c
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000006def
!	Mem[0000000030141400] = e110dc8419b938ea, %f30 = 8519824d 01c7a1db
	ldda	[%i5+%g0]0x89,%f30	! %f30 = e110dc84 19b938ea
!	Mem[00000000201c0000] = ffde2191, %l4 = 0000000000000072
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffde
!	Mem[0000000010101400] = ff38b919, %l2 = ffffffffffffffec
	lduba	[%i4+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffde, Mem[0000000030141408] = ad000000
	stha	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = ad00ffde

p0_label_32:
!	%f29 = 7beed065, Mem[0000000030001410] = 68d3ebc0
	sta	%f29,[%i0+%o5]0x89	! Mem[0000000030001410] = 7beed065
!	Mem[000000001004141c] = 378b6def, %l3 = 82250bcfea584e8c
	ldstub	[%i1+0x01c],%l3		! %l3 = 00000037000000ff
	membar	#Sync			! Added by membar checker (9)
!	%l0 = 00000000ffabefff, Mem[000000001014142c] = 0000000f
	sth	%l0,[%i5+0x02c]		! Mem[000000001014142c] = efff000f
!	%l0 = 00000000ffabefff, Mem[00000000201c0000] = ffde2191, %asi = 80
	stba	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffde2191
!	%f15 = d63e8b28, Mem[0000000010101408] = 367274b6
	sta	%f15,[%i4+%o4]0x88	! Mem[0000000010101408] = d63e8b28
!	%l0 = 00000000ffabefff, Mem[00000000100c1410] = 6b4447a8aba8a6ff
	stxa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000ffabefff
!	Mem[0000000010101408] = d63e8b28, %l1 = 0000000000006def
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000d63e8b28
!	Mem[0000000030141400] = 19b938ea, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 000000ea000000ff
!	%l0 = 00000000ffabefff, imm = fffffffffffffcb9, %l3 = 0000000000000037
	xnor	%l0,-0x347,%l3		! %l3 = 00000000ffabecb9
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 0012c8b9, %l3 = 00000000ffabecb9
	ldsh	[%o2+%g0],%l3		! %l3 = 0000000000000012

p0_label_33:
!	Mem[0000000010081410] = 00000000 00000000, %l4 = ffffffde, %l5 = 00000012
	ldd	[%i2+%o5],%l4		! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010141400] = ffd194f8, %l7 = 00000000000000ea
	ldswa	[%i5+%g0]0x80,%l7	! %l7 = ffffffffffd194f8
!	%f24 = 4a06ab7d, %f8  = 93d84b5f
	fcmps	%fcc3,%f24,%f8 		! %fcc3 = 2
!	Mem[0000000030081410] = 000000f7, %f26 = b6ce9d67
	lda	[%i2+%o5]0x89,%f26	! %f26 = 000000f7
!	Mem[0000000030081400] = ffffffff, %f28 = d83bd0f8
	lda	[%i2+%g0]0x81,%f28	! %f28 = ffffffff
!	Mem[00000000100c1410] = ffabefff, %l1 = 00000000d63e8b28
	ldswa	[%i3+%o5]0x88,%l1	! %l1 = ffffffffffabefff
!	Mem[0000000010001410] = 786843ff, %l0 = 00000000ffabefff
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = 00000000786843ff
!	Mem[0000000030101408] = 9dc993a3, %l1 = ffffffffffabefff
	ldswa	[%i4+%o4]0x81,%l1	! %l1 = ffffffff9dc993a3
!	Mem[0000000030081408] = 93b81113000000b4, %f18 = 9dc993a3 826166c9
	ldda	[%i2+%o4]0x89,%f18	! %f18 = 93b81113 000000b4
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 7492c75d, %l6 = 00000000191aa1fc
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 000000007492c75d

p0_label_34:
!	%l0 = 786843ff, %l1 = 9dc993a3, Mem[0000000030041408] = ed5838a4 f9534cba
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 786843ff 9dc993a3
!	Mem[0000000030101410] = 9dc993a3, %l7 = ffffffffffd194f8
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 0000009d000000ff
!	%l1 = ffffffff9dc993a3, Mem[0000000010101430] = 65d0ee7b, %asi = 80
	stha	%l1,[%i4+0x030]%asi	! Mem[0000000010101430] = 93a3ee7b
!	Mem[00000000300c1410] = ff941997, %l0 = 00000000786843ff
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000010141410] = 00000000
	stha	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00ff0000
!	Mem[0000000030141410] = 000000ff, %l1 = ffffffff9dc993a3
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c140c] = ba4c53f9, %l6 = 000000007492c75d
	swap	[%i3+0x00c],%l6		! %l6 = 00000000ba4c53f9
!	Mem[0000000010181400] = 55000000, %l6 = 00000000ba4c53f9
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 0000000055000000
!	Mem[0000000010181408] = 025bf953, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 00000000025bf953
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff005e34, %l1 = 00000000000000ff
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_35:
!	Mem[0000000030041408] = ff436878, %l5 = 0000000000000000
	lduha	[%i1+%o4]0x89,%l5	! %l5 = 0000000000006878
!	Mem[0000000010081408] = 510501e2, %l1 = ffffffffffffffff
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000051
!	Mem[0000000010101410] = 9dc993a375000000, %f22 = 5e940d57 5dc79274
	ldda	[%i4+%o5]0x88,%f22	! %f22 = 9dc993a3 75000000
!	Mem[0000000010101408] = ef6d000055004b08, %l4 = 00000000025bf953
	ldxa	[%i4+%o4]0x80,%l4	! %l4 = ef6d000055004b08
!	Mem[0000000010141400] = ffd194f8, %l5 = 0000000000006878
	lduba	[%i5+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181408] = 00000000 731b43f1, %l0 = 000000ff, %l1 = 00000051
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000 00000000731b43f1
!	Mem[00000000100c141c] = e11d7c54, %l3 = 0000000000000012
	lduha	[%i3+0x01e]%asi,%l3	! %l3 = 0000000000007c54
!	Mem[0000000010141408] = e5efabff, %l1 = 00000000731b43f1
	ldswa	[%i5+%o4]0x88,%l1	! %l1 = ffffffffe5efabff
!	Mem[0000000010101408] = ef6d0000, %l6 = 0000000055000000
	lduba	[%i4+%o4]0x80,%l6	! %l6 = 00000000000000ef
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffe5efabff, %l5 = 00000000000000ff, %l5 = 00000000000000ff
	sdivx	%l1,%l5,%l5		! %l5 = ffffffffffe5d582

p0_label_36:
!	%l7 = 000000000000009d, Mem[0000000030041400] = 4b589d0a
	stwa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000009d
!	Mem[00000000201c0000] = ffde2191, %l4 = ef6d000055004b08
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000010181410] = 0f0000ff
	stwa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%l1 = ffffffffe5efabff, Mem[00000000300c1408] = df630b975c650373
	stxa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffffe5efabff
!	%f18 = 93b81113 000000b4, Mem[0000000030041410] = ec000000 243b2037
	stda	%f18,[%i1+%o5]0x81	! Mem[0000000030041410] = 93b81113 000000b4
!	%l4 = 000000ff, %l5 = ffe5d582, Mem[00000000100c1408] = da64353c 7492c75d
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff ffe5d582
!	%l4 = 00000000000000ff, Mem[00000000300c1410] = ff941997
	stha	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ff1997
!	%l4 = 00000000000000ff, Mem[0000000030101408] = a393c99d
	stwa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff
!	%l6 = 00000000000000ef, Mem[0000000030041410] = 93b81113
	stwa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ef
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000000, Mem[0000000010001400] = 00000000
	stwa	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000

p0_label_37:
!	Mem[0000000030081410] = 000000f7, %l2 = 00000000000000ff
	lduba	[%i2+%o5]0x89,%l2	! %l2 = 00000000000000f7
!	Mem[0000000010141410] = 0000ff00, %l1 = ffffffffe5efabff
	lduwa	[%i5+%o5]0x88,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010181400] = f9534cba, %l3 = 0000000000007c54
	ldsba	[%i6+%g0]0x88,%l3	! %l3 = ffffffffffffffba
!	Mem[0000000010181434] = 19b938ea, %l3 = ffffffffffffffba
	ldub	[%i6+0x037],%l3		! %l3 = 00000000000000ea
!	Mem[0000000030101410] = a393c9ff, %l0 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081400] = 55f1f847ffffffff, %l3 = 00000000000000ea
	ldxa	[%i2+%g0]0x89,%l3	! %l3 = 55f1f847ffffffff
!	Mem[0000000010181408] = 00000000, %l0 = 00000000000000ff
	ldsba	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800040] = 691fd57f, %l1 = 000000000000ff00
	ldsh	[%o1+0x040],%l1		! %l1 = 000000000000691f
!	Mem[00000000300c1408] = ffffffff, %l1 = 000000000000691f
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000009d, Mem[0000000030041400] = 0000009d
	stwa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000009d

p0_label_38:
!	Mem[0000000021800141] = cfac8e22, %l0 = 0000000000000000
	ldstuba	[%o3+0x141]%asi,%l0	! %l0 = 000000ac000000ff
!	Mem[0000000020800001] = 392f7fd0, %l0 = 00000000000000ac
	ldstub	[%o1+0x001],%l0		! %l0 = 0000002f000000ff
!	Mem[0000000010141420] = 93d84b5f26c0a520, %l3 = 55f1f847ffffffff, %l1 = ffffffffffffffff
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = 93d84b5f26c0a520
!	%l3 = 55f1f847ffffffff, Mem[0000000010001408] = ff1591913115edb8
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 55f1f847ffffffff
!	Mem[0000000010081421] = fc058a65, %l4 = 00000000000000ff
	ldstuba	[%i2+0x021]%asi,%l4	! %l4 = 00000005000000ff
!	%f6  = 1e162ee4, Mem[0000000010001410] = ff436878
	sta	%f6 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 1e162ee4
!	Mem[00000000201c0000] = ffde2191, %l5 = ffffffffffe5d582
	ldsh	[%o0+%g0],%l5		! %l5 = ffffffffffffffde
!	%l5 = ffffffffffffffde, imm = fffffffffffffb84, %l6 = 00000000000000ef
	xnor	%l5,-0x47c,%l6		! %l6 = fffffffffffffba5
!	%f8  = 93d84b5f 26c0a520, Mem[0000000030001408] = 298f91ec cfcc4d47
	stda	%f8 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 93d84b5f 26c0a520
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffffffff, %l2 = 00000000000000f7
	ldsba	[%i2+%g0]0x89,%l2	! %l2 = ffffffffffffffff

p0_label_39:
!	Mem[0000000030001408] = 20a5c026, %l6 = fffffffffffffba5
	ldswa	[%i0+%o4]0x81,%l6	! %l6 = 0000000020a5c026
!	Mem[0000000010181408] = 00000000, %l0 = 000000000000002f
	lduh	[%i6+%o4],%l0		! %l0 = 0000000000000000
!	Mem[00000000201c0000] = ffde2191, %l4 = 0000000000000005
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffde
!	Mem[0000000030141400] = e110dc8419b938ff, %l6 = 0000000020a5c026
	ldxa	[%i5+%g0]0x89,%l6	! %l6 = e110dc8419b938ff
!	Mem[0000000021800180] = 00ad68e0, %l1 = 93d84b5f26c0a520
	lduba	[%o3+0x180]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 0012000019b938ff, %l0 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = 0012000019b938ff
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010081400] = ef6d8b37 01333f72 510501e2 dab6b9b2
!	Mem[0000000010081410] = 00000000 00000000 c9666182 29783887
!	Mem[0000000010081420] = fcff8a65 7283718a 14c478fb f2e76961
!	Mem[0000000010081430] = 0cce34bc e5951aba 000000ad 000000b4
	ldda	[%i2]ASI_BLK_P,%f0	! Block Load from 0000000010081400
!	Mem[0000000030001410] = 65d0ee7b, %l5 = ffffffffffffffde
	ldswa	[%i0+%o5]0x81,%l5	! %l5 = 0000000065d0ee7b
!	Mem[000000001014143c] = d63e8b28, %l3 = 55f1f847ffffffff
	ldsba	[%i5+0x03c]%asi,%l3	! %l3 = ffffffffffffffd6
!	Starting 10 instruction Store Burst
!	%l6 = e110dc8419b938ff, Mem[0000000010101408] = ef6d0000
	stba	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = ff6d0000

p0_label_40:
!	%f22 = 9dc993a3 75000000, Mem[0000000010181408] = 00000000 731b43f1
	stda	%f22,[%i6+%o4]0x80	! Mem[0000000010181408] = 9dc993a3 75000000
	membar	#Sync			! Added by membar checker (11)
!	%l4 = ffffffde, %l5 = 65d0ee7b, Mem[0000000010081408] = 510501e2 dab6b9b2
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffde 65d0ee7b
!	%l2 = ffffffff, %l3 = ffffffd6, Mem[0000000010041438] = b4000000 ad000000
	stda	%l2,[%i1+0x038]%asi	! Mem[0000000010041438] = ffffffff ffffffd6
!	%l1 = 0000000000000000, Mem[0000000010101408] = ff6d0000
	stha	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l6 = e110dc8419b938ff, Mem[0000000010041408] = 094a0000
	stba	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = ff4a0000
!	%f20 = 9dc993a3 00002cbd, Mem[0000000030041410] = ef000000 b4000000
	stda	%f20,[%i1+%o5]0x89	! Mem[0000000030041410] = 9dc993a3 00002cbd
!	Mem[0000000010101430] = 93a3ee7b, %l0 = 19b938ff, %l5 = 65d0ee7b
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 0000000093a3ee7b
!	Mem[0000000030001408] = 26c0a520, %l6 = e110dc8419b938ff
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 00000020000000ff
!	%l6 = 00000020, %l7 = 0000009d, Mem[0000000010101410] = 00000075 a393c99d
	std	%l6,[%i4+%o5]		! Mem[0000000010101410] = 00000020 0000009d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c143c] = 79ff7bcf, %l0 = 0012000019b938ff
	ldswa	[%i3+0x03c]%asi,%l0	! %l0 = 0000000079ff7bcf

p0_label_41:
!	Mem[0000000010181400] = ba4c53f9, %l3 = ffffffffffffffd6
	ldswa	[%i6+%g0]0x80,%l3	! %l3 = ffffffffba4c53f9
!	Mem[0000000030181408] = ad2ae708, %l4 = ffffffffffffffde
	ldsha	[%i6+%o4]0x81,%l4	! %l4 = ffffffffffffad2a
!	Mem[00000000100c1400] = 9719948c, %l3 = ffffffffba4c53f9
	ldswa	[%i3+%g0]0x88,%l3	! %l3 = ffffffff9719948c
!	Mem[0000000010141410] = 00ff0000, %l0 = 0000000079ff7bcf
	lduwa	[%i5+%o5]0x80,%l0	! %l0 = 0000000000ff0000
!	%f9  = 7283718a, %f28 = ffffffff 7beed065
	fstod	%f9 ,%f28		! %f28 = 46506e31 40000000
!	Mem[0000000030141408] = deff00ad000000b4, %l5 = 0000000093a3ee7b
	ldxa	[%i5+%o4]0x81,%l5	! %l5 = deff00ad000000b4
!	Mem[000000001014143c] = d63e8b28, %l6 = 0000000000000020
	lduw	[%i5+0x03c],%l6		! %l6 = 00000000d63e8b28
!	Mem[0000000010041410] = 0a2fb301, %l7 = 000000000000009d
	lduwa	[%i1+%o5]0x80,%l7	! %l7 = 000000000a2fb301
!	Mem[0000000030141400] = 19b938ff, %f25 = fb087c2a
	lda	[%i5+%g0]0x89,%f25	! %f25 = 19b938ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ffabef37, %l4 = ffffffffffffad2a
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 00000037000000ff

p0_label_42:
!	%f22 = 9dc993a3 75000000, Mem[0000000010001418] = 5c4739be d6e04eff
	std	%f22,[%i0+0x018]	! Mem[0000000010001418] = 9dc993a3 75000000
!	%l1 = 0000000000000000, Mem[0000000021800180] = 00ad68e0
	sth	%l1,[%o3+0x180]		! Mem[0000000021800180] = 000068e0
!	%l2 = ffffffffffffffff, Mem[00000000211c0001] = 0012c8b9
	stb	%l2,[%o2+0x001]		! Mem[00000000211c0000] = 00ffc8b9
!	%f22 = 9dc993a3, Mem[0000000010181410] = 00000000
	sta	%f22,[%i6+%o5]0x88	! Mem[0000000010181410] = 9dc993a3
!	%l0 = 0000000000ff0000, Mem[0000000030001410] = 65d0ee7b
	stba	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 00d0ee7b
!	%l4 = 0000000000000037, Mem[0000000030181408] = 08e72aad
	stha	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 08e70037
!	%f16 = 00120000, Mem[00000000300c1400] = ff005e34
	sta	%f16,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00120000
!	%l5 = deff00ad000000b4, Mem[00000000300c1408] = ffffffff
	stha	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffff00b4
!	Mem[0000000010001400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001018141c] = 2058379e, %f29 = 40000000
	ld	[%i6+0x01c],%f29	! %f29 = 2058379e

p0_label_43:
!	%f7  = 29783887, %f27 = 5e860d17
	fcmps	%fcc3,%f7 ,%f27		! %fcc3 = 1
!	Mem[0000000010181408] = 00000075a393c99d, %l2 = ffffffffffffffff
	ldxa	[%i6+%o4]0x88,%l2	! %l2 = 00000075a393c99d
!	Mem[0000000010081400] = 378b6def, %l2 = 00000075a393c99d
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ef
!	Mem[0000000010101400] = 19b938ff, %l5 = deff00ad000000b4
	lduba	[%i4+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101410] = ffc993a3, %l4 = 0000000000000037
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1410] = 00ff1997, %l0 = 0000000000ff0000
	ldsha	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101410] = 000000200000009d, %f6  = c9666182 29783887
	ldda	[%i4+0x010]%asi,%f6 	! %f6  = 00000020 0000009d
!	%f3  = dab6b9b2, %f6  = 00000020
	fcmps	%fcc3,%f3 ,%f6 		! %fcc3 = 1
!	Mem[0000000030081400] = ffffffff, %l4 = ffffffffffffffff
	lduba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000030081400] = ffffffff 55f1f847
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff 000000ff

p0_label_44:
!	%l2 = 00000000000000ef, Mem[0000000010101411] = 00000020
	stb	%l2,[%i4+0x011]		! Mem[0000000010101410] = 00ef0020
!	%f10 = 14c478fb, Mem[0000000010101400] = 19b938ff
	sta	%f10,[%i4+%g0]0x88	! Mem[0000000010101400] = 14c478fb
!	Mem[0000000030001410] = 7beed000, %l3 = ffffffff9719948c
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = 000000ff, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%f0  = ef6d8b37 01333f72 510501e2 dab6b9b2
!	%f4  = 00000000 00000000 00000020 0000009d
!	%f8  = fcff8a65 7283718a 14c478fb f2e76961
!	%f12 = 0cce34bc e5951aba 000000ad 000000b4
	stda	%f0,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030181410] = 00000000, %l7 = 000000000a2fb301
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = ff4a0000, %l2 = 00000000000000ef
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000201c0000] = ffde2191, %l3 = 0000000000000000
	ldstub	[%o0+%g0],%l3		! %l3 = 000000ff000000ff
!	%f14 = 000000ad 000000b4, Mem[0000000010081430] = 0cce34bc e5951aba
	stda	%f14,[%i2+0x030]%asi	! Mem[0000000010081430] = 000000ad 000000b4
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 000000ff, %l5 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff

p0_label_45:
!	Mem[0000000010081410] = 00000000, %l6 = 00000000d63e8b28
	lduba	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 00000000000000ff
	setx	0xbb9b9da7826db32f,%g7,%l0 ! %l0 = bb9b9da7826db32f
!	%l1 = 00000000000000ff
	setx	0x93541fdfe17111a8,%g7,%l1 ! %l1 = 93541fdfe17111a8
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = bb9b9da7826db32f
	setx	0xb0e4555052441a5c,%g7,%l0 ! %l0 = b0e4555052441a5c
!	%l1 = 93541fdfe17111a8
	setx	0x852f3c3fbe88360c,%g7,%l1 ! %l1 = 852f3c3fbe88360c
!	Mem[00000000211c0000] = 00ffc8b9, %l7 = 0000000000000000
	lduba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = 0000009d, %f27 = 5e860d17
	lda	[%i1+%g0]0x81,%f27	! %f27 = 0000009d
!	Mem[0000000010181410] = ff0000009dc993a3, %l5 = 00000000000000ff
	ldxa	[%i6+%o5]0x88,%l5	! %l5 = ff0000009dc993a3
!	Mem[0000000030001410] = 7beed0ff, %l1 = 852f3c3fbe88360c
	ldswa	[%i0+%o5]0x89,%l1	! %l1 = 000000007beed0ff
!	Mem[0000000010041400] = b1000000ffabefe5, %f12 = 0cce34bc e5951aba
	ldda	[%i1+%g0]0x80,%f12	! %f12 = b1000000 ffabefe5
!	Mem[0000000010181428] = 2a7c08fb, %l5 = ff0000009dc993a3
	lduw	[%i6+0x028],%l5		! %l5 = 000000002a7c08fb
!	%l5 = 000000002a7c08fb, %l0 = b0e4555052441a5c, %l6 = 0000000000000000
	sub	%l5,%l0,%l6		! %l6 = 4f1baaafd837ee9f
!	Starting 10 instruction Store Burst
!	%l6 = 4f1baaafd837ee9f, Mem[0000000030181410] = 01b32f0a
	stha	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 01b3ee9f

p0_label_46:
!	%l2 = 00000000000000ff, Mem[0000000010001400] = ff000000, %asi = 80
	stha	%l2,[%i0+0x000]%asi	! Mem[0000000010001400] = 00ff0000
!	%f20 = 9dc993a3 00002cbd, Mem[00000000100c1410] = ffabefff 00000000
	stda	%f20,[%i3+%o5]0x88	! Mem[00000000100c1410] = 9dc993a3 00002cbd
!	Mem[0000000010181400] = ba4c53f9, %l2 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 000000ba000000ff
!	%l5 = 000000002a7c08fb, Mem[0000000010181400] = ffffffe1f9534cff
	stxa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000002a7c08fb
!	%f14 = 000000ad 000000b4, Mem[0000000010001400] = 0000ff00 084b351e
	stda	%f14,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ad 000000b4
!	Mem[00000000211c0000] = 00ffc8b9, %l7 = 0000000000000000
	ldstub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	%l2 = 00000000000000ba, Mem[0000000030041400] = 9d000000
	stwa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ba
!	%l1 = 000000007beed0ff, Mem[0000000010001400] = 000000b4
	stha	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000d0ff
!	Mem[0000000030081408] = b4000000, %l1 = 000000007beed0ff
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 00000000b4000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = bd2c0000, %l6 = 4f1baaafd837ee9f
	lduba	[%i1+%o5]0x81,%l6	! %l6 = 00000000000000bd

p0_label_47:
!	%l4 = 00000000000000ff, Mem[0000000010101408] = 00000000
	stba	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000
!	Mem[0000000010141400] = ffd194f8dbe7fe5a, %f8  = fcff8a65 7283718a
	ldda	[%i5+%g0]0x80,%f8 	! %f8  = ffd194f8 dbe7fe5a
!	Mem[0000000010081434] = 000000b4, %f3  = dab6b9b2
	lda	[%i2+0x034]%asi,%f3 	! %f3 = 000000b4
!	Mem[00000000100c1410] = bd2c0000, %l3 = 00000000000000ff
	lduha	[%i3+%o5]0x80,%l3	! %l3 = 000000000000bd2c
!	Mem[0000000010041400] = b1000000 ffabefe5, %l6 = 000000bd, %l7 = 00000000
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000b1000000 00000000ffabefe5
!	Mem[0000000030181408] = 510501e2dab6b9b2, %f4  = 00000000 00000000
	ldda	[%i6+%o4]0x89,%f4 	! %f4  = 510501e2 dab6b9b2
!	Mem[0000000010181430] = e10e96eb, %f31 = 19b938ea
	ld	[%i6+0x030],%f31	! %f31 = e10e96eb
!	Mem[0000000010181400] = 2a7c08fb, %l2 = 00000000000000ba
	ldsba	[%i6+%g0]0x88,%l2	! %l2 = fffffffffffffffb
!	Mem[00000000100c1418] = bef7bb6d, %l2 = fffffffffffffffb
	ldub	[%i3+0x01a],%l2		! %l2 = 00000000000000bb
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = a393c99d, %l4 = 000000ff, %l5 = 2a7c08fb
	add	%i6,0x10,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 00000000a393c99d

p0_label_48:
!	Mem[00000000201c0000] = ffde2191, %l2 = 00000000000000bb
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%l0 = b0e4555052441a5c, Mem[0000000030041408] = 786843ff
	stwa	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 52441a5c
!	Mem[0000000030081400] = 00000000, %l6 = 00000000b1000000
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 8c941997, %l3 = 000000000000bd2c
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 0000008c000000ff
!	Mem[000000001018140a] = 9dc993a3, %l1 = 00000000b4000000
	ldstub	[%i6+0x00a],%l1		! %l1 = 00000093000000ff
!	%f30 = e110dc84, Mem[000000001014140c] = ffffffff
	sta	%f30,[%i5+0x00c]%asi	! Mem[000000001014140c] = e110dc84
!	%l7 = 00000000ffabefe5, Mem[0000000030081408] = 7beed0ff
	stba	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = e5eed0ff
!	%l6 = 00000000, %l7 = ffabefe5, Mem[0000000010081410] = 00000000 00000000
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 ffabefe5
!	Mem[0000000010141400] = f894d1ff, %l1 = 0000000000000093
	ldstuba	[%i5+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181434] = 19b938ea, %l7 = 00000000ffabefe5
	ldsw	[%i6+0x034],%l7		! %l7 = 0000000019b938ea

p0_label_49:
!	Mem[0000000010101410] = 2000ef00, %l7 = 0000000019b938ea
	lduwa	[%i4+%o5]0x88,%l7	! %l7 = 000000002000ef00
!	Mem[00000000100c1410] = 9dc993a3 00002cbd, %l6 = 00000000, %l7 = 2000ef00
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 0000000000002cbd 000000009dc993a3
!	Mem[0000000030041400] = 73428349 000000ba, %l6 = 00002cbd, %l7 = 9dc993a3
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ba 0000000073428349
!	Mem[0000000010141400] = ffd194f8 dbe7fe5a, %l4 = 000000ff, %l5 = a393c99d
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000ffd194f8 00000000dbe7fe5a
!	Mem[0000000010101420] = 2a7c08fb7dab064a, %f20 = 9dc993a3 00002cbd
	ldd	[%i4+0x020],%f20	! %f20 = 2a7c08fb 7dab064a
!	Mem[00000000100c1430] = 2e8fd907 bfa0ff4d, %l2 = 000000ff, %l3 = 0000008c
	ldd	[%i3+0x030],%l2		! %l2 = 000000002e8fd907 00000000bfa0ff4d
!	Mem[00000000100c1410] = 00002cbd, %l3 = 00000000bfa0ff4d
	ldswa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000002cbd
!	Mem[00000000300c1400] = 34558e39 00001200, %l4 = ffd194f8, %l5 = dbe7fe5a
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 0000000000001200 0000000034558e39
!	Mem[0000000010141410] = 0000ff00, %l6 = 00000000000000ba
	lduha	[%i5+%o5]0x88,%l6	! %l6 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l5 = 0000000034558e39, Mem[0000000030101410] = bd2c0000a393c9ff
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000034558e39

p0_label_50:
!	%l0 = b0e4555052441a5c, Mem[0000000030001400] = fca11a19
	stba	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = fca11a5c
!	Mem[0000000030101408] = ff000000, %l3 = 0000000000002cbd
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	%f24 = 4a06ab7d, Mem[0000000010041408] = 00004aff
	sta	%f24,[%i1+%o4]0x88	! Mem[0000000010041408] = 4a06ab7d
!	Mem[0000000010141408] = e5efabff, %l2 = 000000002e8fd907
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 00000000e5efabff
!	%l1 = 00000000000000ff, Mem[0000000030141408] = ad00ffde
	stha	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = ad0000ff
!	%l3 = 00000000000000ff, %l6 = 000000000000ff00, %l2 = 00000000e5efabff
	orn	%l3,%l6,%l2		! %l2 = ffffffffffff00ff
!	%l4 = 0000000000001200, Mem[0000000030081400] = 000000b1
	stwa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00001200
!	Mem[0000000010081411] = 00000000, %l5 = 0000000034558e39
	ldstub	[%i2+0x011],%l5		! %l5 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010081420] = fcff8a657283718a
	stx	%l5,[%i2+0x020]		! Mem[0000000010081420] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 9719ff00, %l6 = 000000000000ff00
	lduwa	[%i3+%o5]0x89,%l6	! %l6 = 000000009719ff00

p0_label_51:
!	Mem[0000000010041410] = 0a2fb301, %f22 = 9dc993a3
	ld	[%i1+%o5],%f22	! %f22 = 0a2fb301
!	Mem[0000000010081400] = 378b6def, %l5 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l5	! %l5 = 0000000000006def
!	%l0 = b0e4555052441a5c, imm = fffffffffffff900, %l7 = 0000000073428349
	xnor	%l0,-0x700,%l7		! %l7 = b0e4555052441ca3
!	Mem[0000000030141410] = 9dc993a3, %l3 = 00000000000000ff
	ldsha	[%i5+%o5]0x89,%l3	! %l3 = ffffffffffff93a3
!	Mem[0000000030081408] = ffd0eee5, %l0 = b0e4555052441a5c
	ldsba	[%i2+%o4]0x89,%l0	! %l0 = ffffffffffffffe5
!	Mem[0000000030181408] = dab6b9b2, %l4 = 0000000000001200
	lduba	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000b2
!	Mem[0000000010101408] = ff00000055004b08, %f4  = 510501e2 dab6b9b2
	ldda	[%i4+%o4]0x80,%f4 	! %f4  = ff000000 55004b08
!	Mem[0000000030001410] = ffd0ee7b e3ae3d96, %l4 = 000000b2, %l5 = 00006def
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 00000000ffd0ee7b 00000000e3ae3d96
!	Mem[00000000100c1408] = 82d5e5ffff000000, %f26 = 000000f7 0000009d
	ldda	[%i3+%o4]0x88,%f26	! %f26 = 82d5e5ff ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800041] = f2215509, %l3 = ffffffffffff93a3
	ldstuba	[%o3+0x041]%asi,%l3	! %l3 = 00000021000000ff

p0_label_52:
!	%f2  = 510501e2 000000b4, Mem[0000000010181410] = a393c99d 000000ff
	stda	%f2 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 510501e2 000000b4
!	%f14 = 000000ad 000000b4, %l6 = 000000009719ff00
!	Mem[00000000100c1420] = 8e99c375a42f7dfb
	add	%i3,0x020,%g1
	stda	%f14,[%g1+%l6]ASI_PST32_PL ! Mem[00000000100c1420] = 8e99c375a42f7dfb
!	Mem[0000000010001400] = 0000d0ff, %l2 = ffffffffffff00ff
	ldstuba	[%i0+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[0000000010101410] = 9d0000002000ef00
	stxa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000000000ff
!	Mem[0000000030101410] = 34558e39, %l7 = b0e4555052441ca3
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 0000000034558e39
!	Mem[00000000300c1400] = 00120000, %l6 = 000000009719ff00
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[00000000100c1408] = ff000000
	stwa	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	%f16 = 00120000 00000000, %l7 = 0000000034558e39
!	Mem[0000000030181410] = 9feeb30100000000
	add	%i6,0x010,%g1
	stda	%f16,[%g1+%l7]ASI_PST16_S ! Mem[0000000030181410] = 0012b30100000000
!	Mem[0000000010001410] = 1e162ee4, %l1 = 00000000000000ff
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 0000001e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 9dc9ffa3 75000000, %l6 = 00000000, %l7 = 34558e39
	ldd	[%i6+%o4],%l6		! %l6 = 000000009dc9ffa3 0000000075000000

p0_label_53:
!	Mem[00000000100c1410] = bd2c0000a393c99d, %l3 = 0000000000000021
	ldxa	[%i3+%o5]0x80,%l3	! %l3 = bd2c0000a393c99d
!	Mem[0000000010041408] = 4a06ab7d, %l1 = 000000000000001e
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = 000000000000007d
!	Mem[0000000010101418] = 7492c75d c43786ab, %l4 = ffd0ee7b, %l5 = e3ae3d96
	ldda	[%i4+0x018]%asi,%l4	! %l4 = 000000007492c75d 00000000c43786ab
!	Mem[0000000030081400] = 00001200 ff000000, %l6 = 9dc9ffa3, %l7 = 75000000
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 0000000000001200 00000000ff000000
!	Mem[0000000010101408] = ff000000, %f21 = 7dab064a
	lda	[%i4+%o4]0x80,%f21	! %f21 = ff000000
!	Mem[0000000010141400] = f894d1ff, %l0 = ffffffffffffffe5
	ldswa	[%i5+%g0]0x88,%l0	! %l0 = fffffffff894d1ff
!	Mem[0000000010081410] = 00ff0000, %l0 = fffffffff894d1ff
	ldswa	[%i2+%o5]0x80,%l0	! %l0 = 0000000000ff0000
!	Mem[0000000030101410] = a31c4452, %f15 = 000000b4
	lda	[%i4+%o5]0x81,%f15	! %f15 = a31c4452
!	%l6 = 0000000000001200, Mem[0000000010101410] = ff00000000000000
	stxa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000001200
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 7beed0ff, %l2 = 00000000000000ff
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 000000ff000000ff

p0_label_54:
!	%f0  = ef6d8b37 01333f72, %l3 = bd2c0000a393c99d
!	Mem[0000000010141420] = 93d84b5f26c0a520
	add	%i5,0x020,%g1
	stda	%f0,[%g1+%l3]ASI_PST32_P ! Mem[0000000010141420] = 93d84b5f01333f72
!	Mem[0000000030141400] = ff38b919, %l2 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 00000000ff38b919
!	Mem[0000000010001410] = ff162ee4, %l3 = a393c99d, %l5 = c43786ab
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 00000000ff162ee4
!	%l4 = 000000007492c75d, Mem[0000000010001400] = ffd00000
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 7492c75d
!	%l4 = 000000007492c75d, imm = 0000000000000141, %l1 = 000000000000007d
	addc	%l4,0x141,%l1		! %l1 = 000000007492c89e
!	Mem[0000000010101410] = 00000000, %l0 = 0000000000ff0000
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = 2a7c08fb, %l0 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l0	! %l0 = 000000fb000000ff
!	Mem[0000000010001408] = 55f1f847, %l7 = 00000000ff000000
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 0000000055f1f847
!	Mem[0000000010181408] = a3ffc99d, %l2 = 00000000ff38b919
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 00000000a3ffc99d
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000ff, %l0 = 00000000000000fb
	lduba	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff

p0_label_55:
!	Mem[0000000010001400] = 7492c75d, %l0 = 00000000000000ff
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 000000007492c75d
!	Mem[0000000030041408] = 5c1a4452, %l2 = 00000000a3ffc99d
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = 000000005c1a4452
!	Mem[00000000300c1410] = 9719ff00, %f27 = ff000000
	lda	[%i3+%o5]0x89,%f27	! %f27 = 9719ff00
!	Mem[0000000010081400] = ef6d8b37, %l3 = bd2c0000a393c99d
	lduba	[%i2+%g0]0x80,%l3	! %l3 = 00000000000000ef
!	Mem[0000000010101428] = 170d865e, %l2 = 000000005c1a4452
	ldsb	[%i4+0x02a],%l2		! %l2 = ffffffffffffff86
!	Mem[00000000300c1410] = 9719ff00, %f25 = 19b938ff
	lda	[%i3+%o5]0x89,%f25	! %f25 = 9719ff00
!	Mem[0000000020800000] = 39ff7fd0, %l0 = 000000007492c75d
	ldsha	[%o1+0x000]%asi,%l0	! %l0 = 00000000000039ff
!	Mem[0000000010001414] = 75769327, %l2 = ffffffffffffff86
	lduha	[%i0+0x014]%asi,%l2	! %l2 = 0000000000007576
!	Mem[00000000100c1410] = bd2c0000a393c99d, %l2 = 0000000000007576
	ldxa	[%i3+%o5]0x80,%l2	! %l2 = bd2c0000a393c99d
!	Starting 10 instruction Store Burst
!	%l7 = 0000000055f1f847, Mem[0000000030181408] = b2b9b6da
	stha	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = f847b6da

p0_label_56:
!	%l1 = 000000007492c89e, Mem[0000000030001408] = 26c0a5ff
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 7492c89e
!	Mem[0000000010101420] = 2a7c08fb7dab064a, %l2 = bd2c0000a393c99d, %l2 = bd2c0000a393c99d
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = 2a7c08fb7dab064a
!	Mem[0000000010101410] = ff00000000001200, %l2 = 2a7c08fb7dab064a, %l1 = 000000007492c89e
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = ff00000000001200
!	%l1 = ff00000000001200, Mem[0000000010081400] = 378b6def
	stwa	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 00001200
!	%l6 = 0000000000001200, Mem[0000000030081400] = 000000ff00120000
	stxa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000001200
!	%l6 = 00001200, %l7 = 55f1f847, Mem[0000000030181408] = f847b6da e2010551
	stda	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 00001200 55f1f847
!	Mem[0000000030041410] = bd2c0000, %l1 = ff00000000001200
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 000000bd000000ff
!	Mem[0000000010141408] = 2e8fd907, %l1 = 00000000000000bd
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 00000007000000ff
!	%l4 = 000000007492c75d, Mem[00000000100c1410] = bd2c0000, %asi = 80
	stwa	%l4,[%i3+0x010]%asi	! Mem[00000000100c1410] = 7492c75d
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = deffffff, %l7 = 0000000055f1f847
	lduwa	[%i2+%o4]0x88,%l7	! %l7 = 00000000deffffff

p0_label_57:
!	Mem[0000000030001410] = 963daee3 7beed0ff, %l4 = 7492c75d, %l5 = ff162ee4
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 000000007beed0ff 00000000963daee3
!	Mem[0000000030001410] = 7beed0ff, %l7 = 00000000deffffff
	lduba	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = 9ec89274, %l6 = 0000000000001200
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 0000009e000000ff
!	Mem[0000000010141408] = ffd98f2e, %l0 = 00000000000039ff
	lduha	[%i5+%o4]0x80,%l0	! %l0 = 000000000000ffd9
!	Mem[0000000010141428] = 0b7861b4, %l2 = 2a7c08fb7dab064a
	ldub	[%i5+0x029],%l2		! %l2 = 0000000000000078
!	Mem[0000000030041400] = 73428349 000000ba, %l0 = 0000ffd9, %l1 = 00000007
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ba 0000000073428349
!	Mem[0000000010041428] = 0000000f, %l2 = 0000000000000078
	lduwa	[%i1+0x028]%asi,%l2	! %l2 = 000000000000000f
!	Mem[00000000300c1400] = ff120000, %l5 = 00000000963daee3
	ldswa	[%i3+%g0]0x81,%l5	! %l5 = ffffffffff120000
!	Mem[0000000010141400] = 5afee7dbf894d1ff, %l1 = 0000000073428349
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = 5afee7dbf894d1ff
!	Starting 10 instruction Store Burst
!	%f22 = 0a2fb301, Mem[0000000030041408] = 52441a5c
	sta	%f22,[%i1+%o4]0x81	! Mem[0000000030041408] = 0a2fb301

p0_label_58:
!	%l3 = 00000000000000ef, Mem[0000000021800000] = fdddb958, %asi = 80
	stba	%l3,[%o3+0x000]%asi	! Mem[0000000021800000] = efddb958
!	Mem[0000000030181410] = 0012b301, %l2 = 000000000000000f
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001400] = fca11a5c, %l1 = 5afee7dbf894d1ff
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 0000005c000000ff
!	Mem[00000000211c0000] = ffffc8b9, %l4 = 000000007beed0ff
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%f12 = b1000000, Mem[00000000100c1408] = 000000ff
	sta	%f12,[%i3+%o4]0x88	! Mem[00000000100c1408] = b1000000
!	Mem[0000000030141400] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l5 = ffffffffff120000, Mem[0000000010081410] = e5efabff0000ff00
	stxa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffffff120000
!	%l0 = 00000000000000ba, Mem[0000000030181400] = 723f3301378b6def
	stxa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000000000ba
!	%f18 = 93b81113 000000b4, %l3 = 00000000000000ef
!	Mem[0000000010141408] = ffd98f2ee110dc84
	add	%i5,0x008,%g1
	stda	%f18,[%g1+%l3]ASI_PST16_P ! Mem[0000000010141408] = 93b81113000000b4
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff087c2a, %l5 = ffffffffff120000
	ldswa	[%i6+%g0]0x80,%l5	! %l5 = ffffffffff087c2a

p0_label_59:
!	Mem[00000000211c0000] = ffffc8b9, %l2 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[00000000300c1408] = b400ffffe5efabff, %l2 = 000000000000ffff
	ldxa	[%i3+%o4]0x81,%l2	! %l2 = b400ffffe5efabff
!	Mem[0000000010041410] = 0a2fb301, %l1 = 000000000000005c
	ldsha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000a2f
!	Mem[0000000010041408] = 7dab064a, %l6 = 000000000000009e
	lduha	[%i1+%o4]0x80,%l6	! %l6 = 0000000000007dab
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 00000000000000ba
	setx	0xcca1d0ef96d641d4,%g7,%l0 ! %l0 = cca1d0ef96d641d4
!	%l1 = 0000000000000a2f
	setx	0x716a55083d5300ca,%g7,%l1 ! %l1 = 716a55083d5300ca
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cca1d0ef96d641d4
	setx	0x972b12ffc10b0b5b,%g7,%l0 ! %l0 = 972b12ffc10b0b5b
!	%l1 = 716a55083d5300ca
	setx	0x6da59e5fb91bca31,%g7,%l1 ! %l1 = 6da59e5fb91bca31
!	Mem[0000000030041410] = 00002cff, %l5 = ffffffffff087c2a
	lduwa	[%i1+%o5]0x89,%l5	! %l5 = 0000000000002cff
!	Mem[0000000030101408] = ff000000, %l1 = 6da59e5fb91bca31
	lduwa	[%i4+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030041408] = 0a2fb301, %l1 = 00000000ff000000
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000a2f
!	Mem[0000000010001400] = 7492c75d, %l3 = 00000000000000ef
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000074
!	Starting 10 instruction Store Burst
!	%f18 = 93b81113 000000b4, %l4 = 00000000000000ff
!	Mem[0000000030101408] = ff000000826166c9
	add	%i4,0x008,%g1
	stda	%f18,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030101408] = b40000001311b893

p0_label_60:
!	%l0 = 972b12ffc10b0b5b, Mem[0000000010101400] = fb78c414
	stwa	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = c10b0b5b
!	%l4 = 00000000000000ff, Mem[0000000010041432] = e5efabff, %asi = 80
	stba	%l4,[%i1+0x032]%asi	! Mem[0000000010041430] = e5efffff
!	%f19 = 000000b4, %f4  = ff000000
	fsqrts	%f19,%f4 		! %l0 = 972b12ffc10b0b7d, Unfinished, %fsr = 1400000400
!	%f26 = 82d5e5ff 9719ff00, Mem[0000000010041408] = 4a06ab7d 00000a2f
	stda	%f26,[%i1+%o4]0x88	! Mem[0000000010041408] = 82d5e5ff 9719ff00
!	Mem[0000000010081420] = 0000000000000000, %l5 = 0000000000002cff, %l6 = 0000000000007dab
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[00000000211c0001] = ffffc8b9
	stb	%l4,[%o2+0x001]		! Mem[00000000211c0000] = ffffc8b9
!	%l2 = e5efabff, %l3 = 00000074, Mem[0000000030041410] = ff2c0000 a393c99d
	stda	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = e5efabff 00000074
!	%l7 = 00000000000000ff, Mem[0000000030141400] = 000000ff84dc10e1
	stxa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000000000ff
!	%l0 = 972b12ffc10b0b7d, Mem[0000000010081408] = deffffff
	stba	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = deffff7d
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 972b12ffc10b0b7d
	setx	0xc0cbdfefcdb6c3bf,%g7,%l0 ! %l0 = c0cbdfefcdb6c3bf
!	%l1 = 0000000000000a2f
	setx	0xf65958002ca82b8a,%g7,%l1 ! %l1 = f65958002ca82b8a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c0cbdfefcdb6c3bf
	setx	0xe7f8c6ff98fe2da2,%g7,%l0 ! %l0 = e7f8c6ff98fe2da2
!	%l1 = f65958002ca82b8a
	setx	0x066ececfd5a70b00,%g7,%l1 ! %l1 = 066ececfd5a70b00

p0_label_61:
!	Mem[0000000010181400] = ff087c2a00000000, %f14 = 000000ad a31c4452
	ldda	[%i6+0x000]%asi,%f14	! %f14 = ff087c2a 00000000
!	Mem[0000000030001410] = ffd0ee7b e3ae3d96, %l2 = e5efabff, %l3 = 00000074
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 00000000ffd0ee7b 00000000e3ae3d96
!	Mem[0000000020800000] = 39ff7fd0, %l0 = e7f8c6ff98fe2da2
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 00000000000039ff
!	%l1 = 066ececfd5a70b00, %l6 = 0000000000000000, %l5 = 0000000000002cff
	addc	%l1,%l6,%l5		! %l5 = 066ececfd5a70b00
!	%l4 = 00000000000000ff, immed = 00000876, %y  = ffffffb5
	umul	%l4,0x876,%l3		! %l3 = 0000000000086d8a, %y = 00000000
!	Mem[000000001000141c] = 75000000, %f21 = ff000000
	ld	[%i0+0x01c],%f21	! %f21 = 75000000
!	Mem[0000000020800000] = 39ff7fd0, %l6 = 0000000000000000
	ldsh	[%o1+%g0],%l6		! %l6 = 00000000000039ff
!	Mem[0000000010141408] = 93b81113, %l3 = 0000000000086d8a
	ldsw	[%i5+%o4],%l3		! %l3 = ffffffff93b81113
!	Mem[0000000010101410] = ff000000 00001200, %l6 = 000039ff, %l7 = 000000ff
	ldda	[%i4+0x010]%asi,%l6	! %l6 = 00000000ff000000 0000000000001200
!	Starting 10 instruction Store Burst
!	%l0 = 000039ff, %l1 = d5a70b00, Mem[0000000010081408] = 7dffffde 65d0ee7b
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 000039ff d5a70b00

p0_label_62:
!	%l6 = 00000000ff000000, Mem[0000000010001414] = 75769327
	stw	%l6,[%i0+0x014]		! Mem[0000000010001414] = ff000000
!	%l5 = 066ececfd5a70b00, Mem[00000000211c0000] = ffffc8b9, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0b00c8b9
!	%f16 = 00120000 00000000, Mem[0000000010101400] = c10b0b5b 00001200
	stda	%f16,[%i4+%g0]0x80	! Mem[0000000010101400] = 00120000 00000000
!	Mem[0000000010001430] = 2c728cdc, %l2 = ffd0ee7b, %l4 = 000000ff
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 000000002c728cdc
!	%l1 = 066ececfd5a70b00, Mem[0000000010101408] = ff00000055004b08
	stxa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 066ececfd5a70b00
!	Mem[0000000010141401] = ffd194f8, %l2 = 00000000ffd0ee7b
	ldstub	[%i5+0x001],%l2		! %l2 = 000000d1000000ff
!	Mem[0000000030041410] = e5efabff, %l0 = 00000000000039ff
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 000000e5000000ff
!	%l0 = 00000000000000e5, Mem[0000000010181412] = 510501e2
	sth	%l0,[%i6+0x012]		! Mem[0000000010181410] = 510500e5
!	%l4 = 000000002c728cdc, Mem[0000000030041408] = 0a2fb3019dc993a3
	stxa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000002c728cdc
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff12b301 00000000, %l2 = 000000d1, %l3 = 93b81113
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff12b301 0000000000000000

p0_label_63:
!	Mem[0000000030041408] = 00000000, %l0 = 00000000000000e5
	lduha	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 9dc993a3, %f23 = 75000000
	lda	[%i5+%o5]0x89,%f23	! %f23 = 9dc993a3
!	Mem[0000000030041410] = ffefabff, %l5 = 066ececfd5a70b00
	lduba	[%i1+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141410] = a393c99d, %l5 = 00000000000000ff
	lduha	[%i5+%o5]0x81,%l5	! %l5 = 000000000000a393
!	Mem[0000000010041434] = bc34ce0c, %f27 = 9719ff00
	ld	[%i1+0x034],%f27	! %f27 = bc34ce0c
!	Mem[0000000030001408] = ffc89274, %l2 = 00000000ff12b301
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = ffffffffffc89274
!	Mem[0000000030001410] = ffd0ee7be3ae3d96, %l1 = 066ececfd5a70b00
	ldxa	[%i0+%o5]0x81,%l1	! %l1 = ffd0ee7be3ae3d96
!	Mem[0000000030101400] = cf0b2582, %l7 = 0000000000001200
	lduwa	[%i4+%g0]0x89,%l7	! %l7 = 00000000cf0b2582
!	Mem[0000000030081410] = 000000f7, %l4 = 000000002c728cdc
	lduwa	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000f7
!	Starting 10 instruction Store Burst
!	%f14 = ff087c2a, Mem[0000000030081408] = ffd0eee5
	sta	%f14,[%i2+%o4]0x89	! Mem[0000000030081408] = ff087c2a

p0_label_64:
!	%l7 = 00000000cf0b2582, Mem[0000000030081400] = 00001200
	stba	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 00001282
!	%l4 = 00000000000000f7, Mem[00000000211c0000] = 0b00c8b9, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00f7c8b9
!	%l6 = 00000000ff000000, Mem[0000000030041408] = 00000000
	stba	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Mem[000000001008140c] = d5a70b00, %l3 = 0000000000000000
	ldstuba	[%i2+0x00c]%asi,%l3	! %l3 = 000000d5000000ff
!	%l0 = 0000000000000000, Mem[0000000030081408] = ff087c2a
	stha	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = ff080000
!	%l5 = 000000000000a393, Mem[0000000030101400] = 82250bcf
	stha	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = a3930bcf
!	%l3 = 00000000000000d5, Mem[0000000010041410] = 01b32f0a
	stba	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 01b32fd5
!	%l0 = 0000000000000000, Mem[0000000010081400] = 00120000
	stwa	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%f0  = ef6d8b37, Mem[0000000010101420] = 2a7c08fb
	sta	%f0 ,[%i4+0x020]%asi	! Mem[0000000010101420] = ef6d8b37
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000, %l3 = 00000000000000d5
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000

p0_label_65:
!	%f15 = 00000000, %f28 = 46506e31
	fcmpes	%fcc2,%f15,%f28		! %fcc2 = 1
!	Mem[000000001000142c] = 2fbaa38f, %l0 = 0000000000000000
	lduw	[%i0+0x02c],%l0		! %l0 = 000000002fbaa38f
!	Mem[00000000211c0000] = 00f7c8b9, %l2 = ffffffffffc89274
	ldub	[%o2+%g0],%l2		! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (13)
!	Mem[00000000300c1400] = ff120000 398e5534 b400ffff e5efabff
!	Mem[00000000300c1410] = 00ff1997 378b6def a14c30b9 c51c61bb
!	Mem[00000000300c1420] = 19bb3acc ca9768bf da2d032b fb5acd6b
!	Mem[00000000300c1430] = 82e04a37 466e5e97 0a2fb301 dad8f819
	ldda	[%i3]ASI_BLK_SL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010141410] = 00ff0000000000ff, %f4  = ff000000 55004b08
	ldda	[%i5+0x010]%asi,%f4 	! %f4  = 00ff0000 000000ff
!	Mem[0000000030041400] = 73428349 000000ba, %l6 = ff000000, %l7 = cf0b2582
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ba 0000000073428349
!	Mem[0000000030081400] = 00001282, %l7 = 0000000073428349
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 0000000000001282
!	Mem[0000000010141410] = 00ff0000, %l0 = 000000002fbaa38f
	lduba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = a3930bcfea584e8c, %f14 = ff087c2a 00000000
	ldda	[%i4+%g0]0x81,%f14	! %f14 = a3930bcf ea584e8c
!	Starting 10 instruction Store Burst
!	Mem[000000001008140c] = ffa70b00, %l1 = ffd0ee7be3ae3d96, %asi = 80
	swapa	[%i2+0x00c]%asi,%l1	! %l1 = 00000000ffa70b00

p0_label_66:
!	Mem[00000000100c1424] = a42f7dfb, %l2 = 0000000000000000, %asi = 80
	swapa	[%i3+0x024]%asi,%l2	! %l2 = 00000000a42f7dfb
!	%l4 = 000000f7, %l5 = 0000a393, Mem[0000000010001400] = 5dc79274 000000ad
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000f7 0000a393
!	%l2 = a42f7dfb, %l3 = 00000000, Mem[0000000030181400] = 00000000 000000ba
	stda	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = a42f7dfb 00000000
!	%l3 = 0000000000000000, Mem[0000000010181408] = ff38b919
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = ff380000
!	%l1 = 00000000ffa70b00, Mem[0000000030001410] = 963daee37beed0ff
	stxa	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000ffa70b00
!	%l6 = 00000000000000ba, Mem[0000000030081400] = 00001282
	stba	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 000012ba
!	%f14 = a3930bcf ea584e8c, Mem[0000000030041408] = 00000000 2c728cdc
	stda	%f14,[%i1+%o4]0x81	! Mem[0000000030041408] = a3930bcf ea584e8c
!	Mem[00000000300c1400] = 000012ff, %l4 = 00000000000000f7
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010001400] = 000000f7, %l6 = 00000000000000ba
	lduha	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000f7
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 8c4e58eacf0b93a3, %f0  = ef6d8b37 01333f72
	ldda	[%i4+%g0]0x89,%f0 	! %f0  = 8c4e58ea cf0b93a3

p0_label_67:
!	Mem[0000000010081418] = c9666182, %l4 = 00000000000000ff
	lduh	[%i2+0x018],%l4		! %l4 = 000000000000c966
!	Mem[0000000010181400] = ff087c2a, %l2 = 00000000a42f7dfb
	lduha	[%i6+%g0]0x80,%l2	! %l2 = 000000000000ff08
!	Mem[0000000010081400] = 0000000001333f72, %f12 = b1000000 ffabefe5
	ldda	[%i2+%g0]0x80,%f12	! %f12 = 00000000 01333f72
!	%l2 = 000000000000ff08, %l1 = 00000000ffa70b00, %l6 = 00000000000000f7
	add	%l2,%l1,%l6		! %l6 = 00000000ffa80a08
!	Mem[0000000010081400] = 00000000, %l0 = 0000000000000000
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 000000b4, %l0 = 0000000000000000
	ldswa	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000b4
!	Mem[0000000010101410] = 000000ff, %l5 = 000000000000a393
	lduha	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181410] = 01b312ff, %l3 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l3	! %l3 = 0000000001b312ff
!	Mem[0000000010141414] = 000000ff, %l4 = 000000000000c966
	lduwa	[%i5+0x014]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010001408] = ff000000
	sth	%l5,[%i0+%o4]		! Mem[0000000010001408] = 00ff0000

p0_label_68:
!	%l3 = 0000000001b312ff, Mem[0000000010041400] = b1000000ffabefe5
	stxa	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000001b312ff
!	%f2  = 510501e2 000000b4, Mem[0000000030081410] = f7000000 568acf96
	stda	%f2 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 510501e2 000000b4
!	%l0 = 00000000000000b4, Mem[0000000030041410] = ffabefff
	stwa	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000b4
!	%f8  = ffd194f8, Mem[0000000010001408] = 0000ff00
	sta	%f8 ,[%i0+%o4]0x88	! Mem[0000000010001408] = ffd194f8
!	%l5 = 00000000000000ff, Mem[0000000030181400] = a42f7dfb
	stba	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = ff2f7dfb
!	%l6 = ffa80a08, %l7 = 00001282, Mem[0000000010101408] = cfce6e06 000ba7d5
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ffa80a08 00001282
!	%l6 = 00000000ffa80a08, Mem[0000000010081408] = 000039ff
	stha	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 0a0839ff
!	Mem[00000000300c1408] = ffff00b4, %l4 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 000000b4000000ff
!	%l3 = 0000000001b312ff, Mem[0000000030081400] = ba120000
	stha	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 12ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 0000120055f1f847, %l1 = 00000000ffa70b00
	ldxa	[%i6+%o4]0x81,%l1	! %l1 = 0000120055f1f847

p0_label_69:
!	Mem[0000000030101410] = 52441ca3, %f19 = ffff00b4
	lda	[%i4+%o5]0x89,%f19	! %f19 = 52441ca3
!	Mem[0000000010101408] = 080aa8ff, %l4 = 00000000000000b4
	ldsba	[%i4+0x00a]%asi,%l4	! %l4 = ffffffffffffffa8
!	Mem[0000000030041400] = ba000000, %l7 = 0000000000001282
	lduwa	[%i1+%g0]0x81,%l7	! %l7 = 00000000ba000000
!	Mem[0000000010081408] = 0a0839ff, %l5 = 00000000000000ff
	ldswa	[%i2+%o4]0x80,%l5	! %l5 = 000000000a0839ff
!	Mem[0000000010141408] = 93b81113, %f24 = bf6897ca
	lda	[%i5+%o4]0x80,%f24	! %f24 = 93b81113
!	Mem[0000000010141400] = ffff94f8dbe7fe5a, %f28 = 975e6e46 374ae082
	ldda	[%i5+%g0]0x80,%f28	! %f28 = ffff94f8 dbe7fe5a
!	Mem[0000000010001408] = ffd194f8, %f17 = 000012ff
	lda	[%i0+%o4]0x88,%f17	! %f17 = ffd194f8
!	%l5 = 000000000a0839ff, Mem[0000000010181400] = ff087c2a
	stha	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 39ff7c2a
!	%l5 = 000000000a0839ff, %l6 = 00000000ffa80a08, %y  = 00000000
	sdiv	%l5,%l6,%l7		! %l7 = ffffffffffffffe3
	mov	%l0,%y			! %y = 000000b4
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = f7000000, %l4 = ffffffffffffffa8
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 00000000f7000000

p0_label_70:
!	%f8  = ffd194f8 dbe7fe5a, Mem[0000000030001408] = ffc89274 5f4bd893
	stda	%f8 ,[%i0+%o4]0x81	! Mem[0000000030001408] = ffd194f8 dbe7fe5a
!	Mem[0000000030001408] = f894d1ff, %l7 = ffffffffffffffe3
	swapa	[%i0+%o4]0x89,%l7	! %l7 = 00000000f894d1ff
!	%l6 = 00000000ffa80a08, Mem[0000000030041408] = cf0b93a3
	stwa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = ffa80a08
!	Mem[0000000010041405] = 01b312ff, %l2 = 000000000000ff08
	ldstub	[%i1+0x005],%l2		! %l2 = 000000b3000000ff
!	Mem[00000000100c1410] = 5dc79274, %l4 = 00000000f7000000
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 00000074000000ff
!	%l5 = 000000000a0839ff, Mem[0000000030181410] = 01b312ff
	stwa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 0a0839ff
!	%l7 = 00000000f894d1ff, Mem[0000000010181400] = 2a7cff39
	stha	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 2a7cd1ff
!	%l0 = 00000000000000b4, Mem[00000000100c1420] = 8e99c37500000000, %asi = 80
	stxa	%l0,[%i3+0x020]%asi	! Mem[00000000100c1420] = 00000000000000b4
!	%l2 = 00000000000000b3, Mem[00000000100c1410] = ff92c75d
	stha	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00b3c75d
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00ff1997, %l7 = 00000000f894d1ff
	ldswa	[%i1+%o4]0x80,%l7	! %l7 = 0000000000ff1997

p0_label_71:
!	Mem[0000000010041408] = 00ff1997, %f28 = ffff94f8
	lda	[%i1+%o4]0x80,%f28	! %f28 = 00ff1997
!	Mem[00000000100c1430] = 2e8fd907, %l0 = 00000000000000b4
	ldswa	[%i3+0x030]%asi,%l0	! %l0 = 000000002e8fd907
!	Mem[00000000100c1410] = 00b3c75d, %l4 = 0000000000000074
	ldsha	[%i3+%o5]0x80,%l4	! %l4 = 00000000000000b3
!	Mem[0000000010101408] = 080aa8ff, %f8  = ffd194f8
	lda	[%i4+%o4]0x80,%f8 	! %f8 = 080aa8ff
!	Mem[0000000010041408] = 9719ff00, %l2 = 00000000000000b3
	ldswa	[%i1+%o4]0x88,%l2	! %l2 = ffffffff9719ff00
!	Mem[0000000030181408] = 00001200, %l7 = 0000000000ff1997
	ldswa	[%i6+%o4]0x81,%l7	! %l7 = 0000000000001200
!	%f17 = ffd194f8, %f14 = a3930bcf, %f12 = 00000000 01333f72
	fsmuld	%f17,%f14,%f12		! %f12 = fffa329f 00000000
!	Mem[0000000010081408] = 963daee3ff39080a, %l5 = 000000000a0839ff
	ldxa	[%i2+%o4]0x88,%l5	! %l5 = 963daee3ff39080a
!	Mem[0000000010181410] = 510500e5000000b4, %f28 = 00ff1997 dbe7fe5a
	ldda	[%i6+%o5]0x80,%f28	! %f28 = 510500e5 000000b4
!	Starting 10 instruction Store Burst
!	%l2 = ffffffff9719ff00, Mem[0000000030041400] = ba00000049834273
	stxa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff9719ff00

p0_label_72:
!	%f1  = cf0b93a3, Mem[0000000030141400] = 00000000
	sta	%f1 ,[%i5+%g0]0x81	! Mem[0000000030141400] = cf0b93a3
!	%f6  = 00000020 0000009d, Mem[00000000100c1428] = 822f97c0 1ea7a347
	stda	%f6 ,[%i3+0x028]%asi	! Mem[00000000100c1428] = 00000020 0000009d
!	%l2 = ffffffff9719ff00, Mem[0000000030001408] = ffffffe3
	stha	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffff00
!	%f4  = 00ff0000 000000ff, %l7 = 0000000000001200
!	Mem[0000000010141430] = 734283490a9d584b
	add	%i5,0x030,%g1
	stda	%f4,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010141430] = 734283490a9d584b
!	Mem[0000000010081400] = 00000000, %l0 = 000000002e8fd907
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%f29 = 000000b4, Mem[0000000010101410] = 000000ff
	sta	%f29,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000b4
!	Mem[0000000010141408] = 93b81113, %l4 = 00000000000000b3
	swapa	[%i5+%o4]0x80,%l4	! %l4 = 0000000093b81113
!	%l4 = 0000000093b81113, Mem[00000000218000c1] = 5553f237
	stb	%l4,[%o3+0x0c1]		! Mem[00000000218000c0] = 5513f237
!	%l7 = 0000000000001200, Mem[0000000010041410] = 01b32fd5
	stha	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 01b31200
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00120000, %f25 = cc3abb19
	lda	[%i6+%o4]0x89,%f25	! %f25 = 00120000

p0_label_73:
!	Mem[00000000100c1438] = 2fbaa38f79ff7bcf, %f18 = ffabefe5 52441ca3
	ldd	[%i3+0x038],%f18	! %f18 = 2fbaa38f 79ff7bcf
!	Mem[0000000030181410] = ff39080a, %l1 = 0000120055f1f847
	lduwa	[%i6+%o5]0x81,%l1	! %l1 = 00000000ff39080a
	membar	#Sync			! Added by membar checker (14)
!	Mem[00000000100c1400] = ff941997 378b6def 000000b1 ffe5d582
!	Mem[00000000100c1410] = 00b3c75d a393c99d bef7bb6d e11d7c54
!	Mem[00000000100c1420] = 00000000 000000b4 00000020 0000009d
!	Mem[00000000100c1430] = 2e8fd907 bfa0ff4d 2fbaa38f 79ff7bcf
	ldda	[%i3]ASI_BLK_AIUP,%f0	! Block Load from 00000000100c1400
!	Mem[00000000100c1408] = 82d5e5ffb1000000, %l0 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l0	! %l0 = 82d5e5ffb1000000
!	Mem[0000000010081400] = 000000ff, %f16 = 34558e39
	lda	[%i2+%g0]0x88,%f16	! %f16 = 000000ff
!	Mem[0000000030001408] = 00ffffffdbe7fe5a, %f22 = bb611cc5 b9304ca1
	ldda	[%i0+%o4]0x81,%f22	! %f22 = 00ffffff dbe7fe5a
!	Mem[0000000010181410] = e5000551, %f25 = 00120000
	lda	[%i6+%o5]0x88,%f25	! %f25 = e5000551
!	Mem[0000000030001400] = fca11aff, %l7 = 0000000000001200
	ldswa	[%i0+%g0]0x89,%l7	! %l7 = fffffffffca11aff
!	Mem[0000000030101408] = b4000000, %f27 = 2b032dda
	lda	[%i4+%o4]0x81,%f27	! %f27 = b4000000
!	Starting 10 instruction Store Burst
!	%l2 = ffffffff9719ff00, Mem[0000000010101400] = 00001200
	stha	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000ff00

p0_label_74:
!	%f28 = 510500e5 000000b4, %l4 = 0000000093b81113
!	Mem[0000000010041438] = ffffffffffffffd6
	add	%i1,0x038,%g1
	stda	%f28,[%g1+%l4]ASI_PST8_P ! Mem[0000000010041438] = ffffffe5ffff00b4
!	Mem[0000000010141420] = 93d84b5f, %l2 = ffffffff9719ff00, %asi = 80
	swapa	[%i5+0x020]%asi,%l2	! %l2 = 0000000093d84b5f
!	%f16 = 000000ff ffd194f8 2fbaa38f 79ff7bcf
!	%f20 = ef6d8b37 9719ff00 00ffffff dbe7fe5a
!	%f24 = 93b81113 e5000551 6bcd5afb b4000000
!	%f28 = 510500e5 000000b4 19f8d8da 01b32f0a
	stda	%f16,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	%l0 = 82d5e5ffb1000000, Mem[0000000010001410] = ff162ee4
	stwa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = b1000000
!	Mem[0000000010001408] = ffd194f8, %l5 = 963daee3ff39080a
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000f8000000ff
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010041400] = 00000000, %l3 = 0000000001b312ff
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041410] = 01b31200, %l4 = 0000000093b81113
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 0000000001b31200
!	%l7 = fffffffffca11aff, Mem[000000001010141c] = c43786ab, %asi = 80
	stwa	%l7,[%i4+0x01c]%asi	! Mem[000000001010141c] = fca11aff
!	%l4 = 01b31200, %l5 = 000000f8, Mem[0000000010181428] = 2a7c08fb 7dab064a
	stda	%l4,[%i6+0x028]%asi	! Mem[0000000010181428] = 01b31200 000000f8
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 510500e5, %l3 = 0000000000000000
	lduw	[%i6+%o5],%l3		! %l3 = 00000000510500e5

p0_label_75:
!	Mem[00000000100c1410] = 00b3c75da393c99d, %l0 = 82d5e5ffb1000000
	ldxa	[%i3+%o5]0x80,%l0	! %l0 = 00b3c75da393c99d
!	Mem[00000000100c1400] = ff941997, %l0 = 00b3c75da393c99d
	lduwa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ff941997
!	Mem[0000000010101410] = b4000000, %l1 = 00000000ff39080a
	ldswa	[%i4+%o5]0x80,%l1	! %l1 = ffffffffb4000000
!	Mem[0000000010041400] = 000000ff, %l4 = 0000000001b31200
	lduba	[%i1+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001410] = b1000000, %l3 = 00000000510500e5
	lduwa	[%i0+%o5]0x80,%l3	! %l3 = 00000000b1000000
!	Mem[0000000010101438] = dba1c701 4d821985, %l0 = ff941997, %l1 = b4000000
	ldd	[%i4+0x038],%l0		! %l0 = 00000000dba1c701 000000004d821985
!	Mem[00000000100c143c] = 79ff7bcf, %l4 = 00000000000000ff
	ldsba	[%i3+0x03d]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101408] = 000000b4, %l5 = 00000000000000f8
	ldsha	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000b4
!	Mem[0000000030001408] = 00ffffff, %f18 = 2fbaa38f
	lda	[%i0+%o4]0x81,%f18	! %f18 = 00ffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081438] = 000000ad, %l1 = 000000004d821985
	swap	[%i2+0x038],%l1		! %l1 = 00000000000000ad

p0_label_76:
!	%f27 = b4000000, Mem[0000000030001408] = ffffff00
	sta	%f27,[%i0+%o4]0x89	! Mem[0000000030001408] = b4000000
!	%f20 = ef6d8b37 9719ff00, %l6 = 00000000ffa80a08
!	Mem[00000000100c1430] = 2e8fd907bfa0ff4d
	add	%i3,0x030,%g1
	stda	%f20,[%g1+%l6]ASI_PST32_PL ! Mem[00000000100c1430] = 2e8fd907bfa0ff4d
!	%l0 = 00000000dba1c701, Mem[0000000030181410] = 0a0839ff
	stwa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = dba1c701
!	Mem[0000000010141408] = 000000b3, %l1 = 00000000000000ad
	ldstuba	[%i5+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101410] = b4000000, %l2 = 0000000093d84b5f
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 000000b4000000ff
!	Mem[0000000030141410] = 9dc993a3, %l7 = fffffffffca11aff
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 000000009dc993a3
!	Mem[0000000010141438] = 0b78fedcd63e8b28, %l3 = 00000000b1000000, %l6 = 00000000ffa80a08
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = 0b78fedcd63e8b28
!	%l6 = 0b78fedcd63e8b28, Mem[0000000010081408] = ff39080a
	stba	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = ff390828
!	%l7 = 000000009dc993a3, Mem[0000000010141408] = ff0000b3
	stba	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = a30000b3
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffa80a08, %l6 = 0b78fedcd63e8b28
	ldsba	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000008

p0_label_77:
!	Mem[00000000300c1408] = ff00ffff, %l6 = 0000000000000008
	lduba	[%i3+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181400] = fb7d2fff, %l0 = 00000000dba1c701
	lduba	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181410] = 01c7a1db, %l7 = 000000009dc993a3
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000001
!	Mem[0000000010101410] = ff000000, %l5 = 00000000000000b4
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[00000000100c1404] = 378b6def, %f1  = 378b6def
	lda	[%i3+0x004]%asi,%f1 	! %f1 = 378b6def
!	Mem[0000000010181404] = 00000000, %l2 = 00000000000000b4
	lduw	[%i6+0x004],%l2		! %l2 = 0000000000000000
!	Mem[0000000021800080] = 74422d54, %l2 = 0000000000000000
	lduba	[%o3+0x080]%asi,%l2	! %l2 = 0000000000000074
!	Mem[0000000030081400] = 0000ff12, %l3 = 00000000b1000000
	ldswa	[%i2+%g0]0x89,%l3	! %l3 = 000000000000ff12
!	Mem[0000000010001434] = e42e161e, %l1 = 0000000000000000
	lduba	[%i0+0x036]%asi,%l1	! %l1 = 0000000000000016
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010041400] = ff00000001ff12ff
	stxa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000000000ff

p0_label_78:
!	Mem[0000000010001400] = a8ffffff, %l3 = 000000000000ff12
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[00000000300c1410] = 9719ff00
	stwa	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff
!	Mem[000000001000141c] = 75000000, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x01c]%asi,%l3	! %l3 = 0000000075000000
!	%f26 = 6bcd5afb b4000000, Mem[0000000010181410] = 510500e5 000000b4
	stda	%f26,[%i6+%o5]0x80	! Mem[0000000010181410] = 6bcd5afb b4000000
!	%f18 = 00ffffff 79ff7bcf, Mem[0000000030081400] = 0000ff12 00000000
	stda	%f18,[%i2+%g0]0x89	! Mem[0000000030081400] = 00ffffff 79ff7bcf
!	Mem[0000000010101410] = 000000ff, %l2 = 0000000000000074
	swapa	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081410] = ff120000, %l3 = 0000000075000000
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l1 = 0000000000000016, Mem[0000000030081400] = cf7bff79
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 0016ff79
!	%l2 = 00000000000000ff, Mem[00000000300c1410] = 000000ff
	stha	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff
!	Starting 10 instruction Load Burst
!	%l7 = 0000000000000001, imm = fffffffffffff47c, %l2 = 00000000000000ff
	xnor	%l7,-0xb84,%l2		! %l2 = 0000000000000b82

p0_label_79:
!	Mem[0000000010101408] = 080aa8ff82120000, %f30 = 19f8d8da 01b32f0a
	ldda	[%i4+%o4]0x80,%f30	! %f30 = 080aa8ff 82120000
!	Mem[0000000010101410] = 00000074, %l0 = 00000000000000ff
	ldsha	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000074
!	%l0 = 0000000000000074, %l7 = 0000000000000001, %l1 = 0000000000000016
	sdivx	%l0,%l7,%l1		! %l1 = 0000000000000074
!	Mem[0000000010001410] = b1000000, %f11 = 0000009d
	lda	[%i0+%o5]0x80,%f11	! %f11 = b1000000
!	Mem[0000000010081410] = ff1200ff, %l3 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1408] = ffff00ff, %l1 = 0000000000000074
	ldswa	[%i3+%o4]0x89,%l1	! %l1 = ffffffffffff00ff
!	Mem[00000000201c0000] = ffde2191, %l2 = 0000000000000b82
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffde
!	%l7 = 0000000000000001, immed = 0000028d, %y  = 000000b4
	smul	%l7,0x28d,%l7		! %l7 = 000000000000028d, %y = 00000000
!	Mem[0000000010141430] = 73428349, %l3 = 00000000000000ff
	ldsba	[%i5+0x031]%asi,%l3	! %l3 = 0000000000000042
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = ffd17c2a, %l2 = ffffffffffffffde
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 00000000ffd17c2a

p0_label_80:
!	%f22 = 00ffffff dbe7fe5a, Mem[00000000300c1400] = 000012ff 34558e39
	stda	%f22,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00ffffff dbe7fe5a
!	Mem[0000000010041400] = 00000000, %l2 = 00000000ffd17c2a
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%f31 = 82120000, Mem[0000000010041408] = 00ff1997
	sta	%f31,[%i1+%o4]0x80	! Mem[0000000010041408] = 82120000
!	Mem[0000000030181410] = 01c7a1db, %l3 = 0000000000000042
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 0000000001c7a1db
!	%l0 = 0000000000000074, Mem[0000000010001410] = b1000000
	stwa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000074
!	%f27 = b4000000, %f28 = 510500e5
	fcmpes	%fcc0,%f27,%f28		! %fcc0 = 1
!	%f4  = 00b3c75d, Mem[0000000030001400] = fca11aff
	sta	%f4 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 00b3c75d
!	%l2 = 00000000, %l3 = 01c7a1db, Mem[0000000030041400] = ffd194f8 000000ff
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 01c7a1db
!	%f4  = 00b3c75d a393c99d, Mem[0000000010141400] = ffff94f8 dbe7fe5a
	stda	%f4 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 00b3c75d a393c99d
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = fca11aff, %l7 = 000000000000028d
	lduba	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000ff

p0_label_81:
!	Mem[0000000030081410] = 510501e2 000000b4, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000510501e2 00000000000000b4
!	%l6 = 00000000510501e2, imm = 00000000000009c2, %l1 = ffffffffffff00ff
	add	%l6,0x9c2,%l1		! %l1 = 0000000051050ba4
!	Mem[0000000010101408] = 080aa8ff82120000, %f12 = 2e8fd907 bfa0ff4d
	ldda	[%i4+%o4]0x80,%f12	! %f12 = 080aa8ff 82120000
!	Mem[0000000010001428] = ba881e28, %l1 = 0000000051050ba4
	ldub	[%i0+0x02b],%l1		! %l1 = 0000000000000028
!	Mem[0000000030141408] = ff0000ad000000b4, %l3 = 0000000001c7a1db
	ldxa	[%i5+%o4]0x81,%l3	! %l3 = ff0000ad000000b4
!	Mem[0000000030101408] = b4000000, %l4 = ffffffffffffffff
	lduba	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000b4
!	Mem[00000000300c1408] = ff00ffff, %l6 = 00000000510501e2
	lduha	[%i3+%o4]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000030141410] = ff1aa1fc, %l7 = 00000000000000b4
	lduwa	[%i5+%o5]0x81,%l7	! %l7 = 00000000ff1aa1fc
!	Mem[0000000010101410] = 7400000000001200, %f4  = 00b3c75d a393c99d
	ldda	[%i4+%o5]0x80,%f4 	! %f4  = 74000000 00001200
!	Starting 10 instruction Store Burst
!	%f26 = 6bcd5afb, Mem[0000000030041400] = 00000000
	sta	%f26,[%i1+%g0]0x89	! Mem[0000000030041400] = 6bcd5afb

p0_label_82:
!	Mem[0000000030141400] = a3930bcf, %l1 = 0000000000000028
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 000000cf000000ff
!	Mem[0000000010101400] = 00ff0000, %l1 = 000000cf, %l2 = 00000000
	casa	[%i4]0x80,%l1,%l2	! %l2 = 0000000000ff0000
!	Mem[0000000010001408] = ffd194ff, %l3 = ff0000ad000000b4
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000201c0001] = ffde2191, %l1 = 00000000000000cf
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 000000de000000ff
!	%l2 = 0000000000ff0000, Mem[0000000010001408] = ff94d1ff
	stwa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00ff0000
!	Mem[0000000030041400] = fb5acd6b, %l3 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000fb5acd6b
!	Mem[00000000100c1408] = b1000000, %l1 = 00000000000000de
	swapa	[%i3+%o4]0x88,%l1	! %l1 = 00000000b1000000
!	%f18 = 00ffffff, Mem[0000000010001404] = 93a30000
	sta	%f18,[%i0+0x004]%asi	! Mem[0000000010001404] = 00ffffff
!	%l4 = 000000b4, %l5 = 0000ff00, Mem[0000000010101410] = 74000000 00001200
	std	%l4,[%i4+%o5]		! Mem[0000000010101410] = 000000b4 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 79ff7bcf, %l7 = 00000000ff1aa1fc
	ldsha	[%i1+%o4]0x89,%l7	! %l7 = 0000000000007bcf

p0_label_83:
!	Mem[00000000300c1410] = 000000ff, %l2 = 0000000000ff0000
	lduwa	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000020800040] = 691fd57f, %l0 = 0000000000000074
	ldsh	[%o1+0x040],%l0		! %l0 = 000000000000691f
!	%l0 = 000000000000691f, %l3 = 00000000fb5acd6b, %l6 = 000000000000ff00
	and	%l0,%l3,%l6		! %l6 = 000000000000490b
!	Mem[0000000010141410] = 00ff0000 000000ff, %l4 = 000000b4, %l5 = 0000ff00
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 0000000000ff0000 00000000000000ff
!	Mem[0000000010181430] = e10e96eb 19b938ea, %l2 = 000000ff, %l3 = fb5acd6b
	ldd	[%i6+0x030],%l2		! %l2 = 00000000e10e96eb 0000000019b938ea
!	Mem[0000000030041408] = 79ff7bcf, %l1 = 00000000b1000000
	lduwa	[%i1+%o4]0x89,%l1	! %l1 = 0000000079ff7bcf
!	Mem[0000000010141400] = 9dc993a35dc7b300, %l3 = 0000000019b938ea
	ldxa	[%i5+%g0]0x88,%l3	! %l3 = 9dc993a35dc7b300
!	Mem[0000000030181400] = fb7d2fff, %l1 = 0000000079ff7bcf
	ldswa	[%i6+%g0]0x89,%l1	! %l1 = fffffffffb7d2fff
!	Mem[0000000010101400] = 00ff0000, %f2  = 000000b1
	lda	[%i4+%g0]0x80,%f2 	! %f2 = 00ff0000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff941997, %l3 = 9dc993a35dc7b300
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ff941997

p0_label_84:
!	%l4 = 0000000000ff0000, Mem[00000000100c1400] = 00b3c75d
	stwa	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00ff0000
!	Mem[0000000010181410] = fb5acd6b, %l6 = 000000000000490b
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 0000006b000000ff
!	%l3 = 00000000ff941997, Mem[0000000010041410] = 93b81113
	stwa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = ff941997
!	%f2  = 00ff0000 ffe5d582, %l5 = 00000000000000ff
!	Mem[00000000100c1400] = 0000ff00378b6def
	stda	%f2,[%i3+%l5]ASI_PST32_P ! Mem[00000000100c1400] = 00ff0000ffe5d582
!	%f27 = b4000000, Mem[0000000010101400] = 00ff0000
	sta	%f27,[%i4+%g0]0x80	! Mem[0000000010101400] = b4000000
!	%l3 = 00000000ff941997, Mem[00000000300c1400] = 5afee7db
	stha	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 1997e7db
!	%f24 = 93b81113 e5000551, %l2 = 00000000e10e96eb
!	Mem[0000000010181428] = 01b31200000000f8
	add	%i6,0x028,%g1
	stda	%f24,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010181428] = 510512e50011b893
!	Mem[0000000010181430] = e10e96eb19b938ea, %l1 = fffffffffb7d2fff, %l4 = 0000000000ff0000
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = e10e96eb19b938ea
!	%l6 = 0000006b, %l7 = 00007bcf, Mem[0000000030181410] = 42000000 00000000
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000006b 00007bcf
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = de000000 ffe5d582, %l4 = 19b938ea, %l5 = 000000ff
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 00000000de000000 00000000ffe5d582

p0_label_85:
!	Mem[0000000010181438] = a8b4658bc4f360f5, %l4 = 00000000de000000
	ldxa	[%i6+0x038]%asi,%l4	! %l4 = a8b4658bc4f360f5
!	Mem[0000000010141408] = a30000b3, %f7  = e11d7c54
	lda	[%i5+%o4]0x80,%f7 	! %f7 = a30000b3
!	Mem[0000000010181418] = 26d6ffd3, %l6 = 000000000000006b
	lduh	[%i6+0x018],%l6		! %l6 = 00000000000026d6
!	Mem[00000000300c1410] = ff000000378b6def, %l7 = 0000000000007bcf
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = ff000000378b6def
!	%l7 = ff000000378b6def, imm = fffffffffffff760, %l2 = 00000000e10e96eb
	andn	%l7,-0x8a0,%l2		! %l2 = 000000000000088f
!	Mem[0000000010041414] = 0b78ffb4, %f3  = ffe5d582
	lda	[%i1+0x014]%asi,%f3 	! %f3 = 0b78ffb4
!	Mem[0000000010041408] = 82120000 ffe5d582, %l0 = 0000691f, %l1 = fb7d2fff
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 0000000082120000 00000000ffe5d582
!	Mem[0000000010041400] = 000000ff, %l5 = 00000000ffe5d582
	lduwa	[%i1+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081400] = 0016ff79, %f24 = 93b81113
	lda	[%i2+%g0]0x81,%f24	! %f24 = 0016ff79
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00ff0000, %l5 = 00000000000000ff
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 0000000000ff0000

p0_label_86:
!	Mem[0000000010141410] = ff000000, %l4 = a8b4658bc4f360f5
	lduha	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ffff2191, %l4 = 0000000000000000
	ldstub	[%o0+%g0],%l4		! %l4 = 000000ff000000ff
!	Mem[000000001000143c] = 049e95c3, %l7 = ff000000378b6def
	swap	[%i0+0x03c],%l7		! %l7 = 00000000049e95c3
!	%l4 = 00000000000000ff, %l2 = 000000000000088f, %l6 = 00000000000026d6
	sdivx	%l4,%l2,%l6		! %l6 = 0000000000000000
!	Mem[0000000010101420] = ef6d8b377dab064a, %l6 = 0000000000000000, %l3 = 00000000ff941997
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = ef6d8b377dab064a
!	%f20 = ef6d8b37 9719ff00, Mem[0000000030101408] = b4000000 1311b893
	stda	%f20,[%i4+%o4]0x81	! Mem[0000000030101408] = ef6d8b37 9719ff00
!	%f24 = 0016ff79 e5000551, %l0 = 0000000082120000
!	Mem[0000000010181428] = 510512e50011b893
	add	%i6,0x028,%g1
	stda	%f24,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010181428] = 510512e50011b893
!	Mem[0000000010181410] = fb5acdff, %l1 = 00000000ffe5d582
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010181400] = deffffff, %l5 = 0000000000ff0000
	ldstuba	[%i6+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 000000ff, %l5 = 00000000000000ff
	ldsba	[%i2+%g0]0x88,%l5	! %l5 = ffffffffffffffff

p0_label_87:
!	Mem[00000000100c1408] = 000000de, %l4 = 00000000000000ff
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000de
!	Mem[0000000010101424] = 7dab064a, %l4 = 00000000000000de
	ldsha	[%i4+0x026]%asi,%l4	! %l4 = 000000000000064a
!	Mem[00000000211c0000] = 00f7c8b9, %l3 = ef6d8b377dab064a
	ldsb	[%o2+0x001],%l3		! %l3 = fffffffffffffff7
!	Mem[0000000010001400] = ffffffa800ffffff, %l5 = ffffffffffffffff
	ldxa	[%i0+%g0]0x80,%l5	! %l5 = ffffffa800ffffff
!	Mem[000000001004141c] = ff8b6def, %l2 = 000000000000088f
	ldsba	[%i1+0x01d]%asi,%l2	! %l2 = ffffffffffffff8b
!	Mem[00000000100c1408] = de000000, %l6 = 0000000000000000
	ldsba	[%i3+%o4]0x80,%l6	! %l6 = ffffffffffffffde
!	Mem[00000000100c1400] = 00ff0000ffe5d582, %f6  = bef7bb6d a30000b3
	ldda	[%i3+%g0]0x80,%f6 	! %f6  = 00ff0000 ffe5d582
!	Mem[00000000211c0000] = 00f7c8b9, %l5 = ffffffa800ffffff
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = 000008ff, %l6 = ffffffffffffffde
	ldswa	[%i2+%o4]0x81,%l6	! %l6 = 00000000000008ff
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000064a, Mem[0000000030041408] = cf7bff798fa3ba2f
	stxa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000000000064a

p0_label_88:
!	%l0 = 0000000082120000, Mem[0000000010041417] = 0b78ffb4
	stb	%l0,[%i1+0x017]		! Mem[0000000010041414] = 0b78ff00
!	%f8  = 00000000 000000b4, %l5 = 0000000000000000
!	Mem[0000000010141438] = 0b78fedcd63e8b28
	add	%i5,0x038,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_P ! Mem[0000000010141438] = 0b78fedcd63e8b28
!	Mem[0000000021800081] = 74422d54, %l2 = ffffffffffffff8b
	ldstub	[%o3+0x081],%l2		! %l2 = 00000042000000ff
!	Mem[0000000030081408] = ff080000, %l3 = fffffffffffffff7
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 00000000ff080000
!	Mem[0000000010001428] = ba881e28, %l4 = 000000000000064a, %asi = 80
	swapa	[%i0+0x028]%asi,%l4	! %l4 = 00000000ba881e28
!	%l0 = 0000000082120000, Mem[0000000030101408] = 00ff1997378b6def
	stxa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000082120000
!	Mem[0000000010001400] = a8ffffff, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000a8ffffff
!	%l7 = 00000000049e95c3, %l2 = 0000000000000042, %y  = 00000000
	smul	%l7,%l2,%l0		! %l0 = 0000000130e29c46, %y = 00000001
!	%f28 = 510500e5 000000b4, %l4 = 00000000ba881e28
!	Mem[0000000030081438] = d50014bddaba14a9
	add	%i2,0x038,%g1
	stda	%f28,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030081438] = d50014bddaba14a9
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff380000, %l3 = 00000000ff080000
	ldsba	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_89:
!	Mem[0000000010181410] = 000000b4fb5acdff, %f4  = 74000000 00001200
	ldda	[%i6+%o5]0x88,%f4 	! %f4  = 000000b4 fb5acdff
!	Mem[0000000010141408] = a30000b3 000000b4, %l2 = 00000042, %l3 = 00000000
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 00000000a30000b3 00000000000000b4
!	Mem[0000000010141428] = 0b7861b4, %l2 = 00000000a30000b3
	ldsw	[%i5+0x028],%l2		! %l2 = 000000000b7861b4
!	Mem[0000000030101400] = cf0b93a3, %l3 = 00000000000000b4
	lduwa	[%i4+%g0]0x89,%l3	! %l3 = 00000000cf0b93a3
!	Mem[0000000010141418] = 1e162ee4, %f18 = 00ffffff
	ld	[%i5+0x018],%f18	! %f18 = 1e162ee4
!	Mem[0000000030041400] = 000000ff dba1c701, %l2 = 0b7861b4, %l3 = cf0b93a3
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 00000000000000ff 00000000dba1c701
!	Mem[0000000030081410] = e2010551, %l3 = 00000000dba1c701
	ldsba	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000051
!	Mem[0000000010141400] = 5dc7b300, %l1 = 00000000000000ff
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 000000005dc7b300
!	Mem[0000000030081408] = 93b81113 fffffff7, %l0 = 30e29c46, %l1 = 5dc7b300
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 00000000fffffff7 0000000093b81113
!	Starting 10 instruction Store Burst
!	%f18 = 1e162ee4, Mem[0000000010001400] = 00000000
	sta	%f18,[%i0+%g0]0x88	! Mem[0000000010001400] = 1e162ee4

p0_label_90:
!	Mem[0000000010001430] = 2c728cdc, %l6 = 00000000000008ff
	ldstuba	[%i0+0x030]%asi,%l6	! %l6 = 0000002c000000ff
!	%l5 = 00000000a8ffffff, Mem[00000000218001c1] = 8aec1988
	stb	%l5,[%o3+0x1c1]		! Mem[00000000218001c0] = 8aff1988
!	%l1 = 0000000093b81113, immd = 0000000000000eba, %l5 = 00000000a8ffffff
	udivx	%l1,0xeba,%l5		! %l5 = 00000000000a07e1
!	%l3 = 0000000000000051, Mem[0000000010181400] = deffffff
	stba	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = deffff51
!	Code Fragment 4
p0_fragment_7:
!	%l0 = 00000000fffffff7
	setx	0xd36da66fea7312a0,%g7,%l0 ! %l0 = d36da66fea7312a0
!	%l1 = 0000000093b81113
	setx	0x042bd4d7d6e07912,%g7,%l1 ! %l1 = 042bd4d7d6e07912
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d36da66fea7312a0
	setx	0x90daaf9fb74c9b29,%g7,%l0 ! %l0 = 90daaf9fb74c9b29
!	%l1 = 042bd4d7d6e07912
	setx	0xcdf077686847d6b9,%g7,%l1 ! %l1 = cdf077686847d6b9
!	Mem[00000000100c1400] = 0000ff00, %l5 = 00000000000a07e1
	swapa	[%i3+%g0]0x88,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010181410] = fb5acdff, %l2 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	%f26 = 6bcd5afb b4000000, Mem[0000000030141400] = ff0b93a3 000000ff
	stda	%f26,[%i5+%g0]0x81	! Mem[0000000030141400] = 6bcd5afb b4000000
!	Mem[0000000010101405] = 00000000, %l1 = cdf077686847d6b9
	ldstuba	[%i4+0x005]%asi,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000074, %l5 = 000000000000ff00
	lduba	[%i0+0x011]%asi,%l5	! %l5 = 0000000000000000

p0_label_91:
!	Mem[00000000100c1408] = 000000de, %l1 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000de
!	Mem[00000000100c1408] = 000000de, %l3 = 0000000000000051
	lduwa	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000de
!	Mem[00000000201c0000] = ffff2191, %l0 = 90daaf9fb74c9b29
	ldsh	[%o0+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030141410] = fca11aff, %l2 = 00000000000000ff
	lduwa	[%i5+%o5]0x89,%l2	! %l2 = 00000000fca11aff
!	Mem[0000000010101410] = b4000000, %l2 = 00000000fca11aff
	ldswa	[%i4+%o5]0x88,%l2	! %l2 = ffffffffb4000000
!	Mem[0000000030181410] = 6b000000, %l0 = ffffffffffffffff
	ldswa	[%i6+%o5]0x81,%l0	! %l0 = 000000006b000000
!	Mem[00000000300c1408] = ff00ffff e5efabff, %l2 = b4000000, %l3 = 000000de
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 00000000ff00ffff 00000000e5efabff
!	Mem[0000000030041410] = 00ff1997378b6def, %l0 = 000000006b000000
	ldxa	[%i1+%o5]0x81,%l0	! %l0 = 00ff1997378b6def
!	Mem[0000000030001410] = 000ba7ff, %l1 = 00000000000000de
	lduba	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = ff941997 378b6def, Mem[0000000010181410] = fb5acdff 000000b4
	stda	%f0 ,[%i6+%o5]0x88	! Mem[0000000010181410] = ff941997 378b6def

p0_label_92:
!	%f10 = 00000020 b1000000, Mem[0000000010041408] = 82120000 ffe5d582
	stda	%f10,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000020 b1000000
!	%l7 = 00000000049e95c3, Mem[00000000100c1420] = 00000000000000b4, %asi = 80
	stxa	%l7,[%i3+0x020]%asi	! Mem[00000000100c1420] = 00000000049e95c3
!	%l2 = 00000000ff00ffff, Mem[0000000010101408] = ffa80a08
	stwa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ff00ffff
!	%l1 = 0000000000000000, Mem[00000000211c0000] = 00f7c8b9, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00f7c8b9
!	%l5 = 0000000000000000, %l6 = 000000000000002c, %l1 = 0000000000000000
	udivx	%l5,%l6,%l1		! %l1 = 0000000000000000
!	Mem[0000000030041410] = 9719ff00, %l2 = 00000000ff00ffff
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l4 = 00000000ba881e28, Mem[0000000010141400] = 9dc993a35dc7b300
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000ba881e28
!	Mem[0000000010081400] = ff000000, %l3 = 00000000e5efabff
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	Code Fragment 4
p0_fragment_8:
!	%l0 = 00ff1997378b6def
	setx	0x0086a2a7b7b38547,%g7,%l0 ! %l0 = 0086a2a7b7b38547
!	%l1 = 0000000000000000
	setx	0x00af85902515a3c7,%g7,%l1 ! %l1 = 00af85902515a3c7
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0086a2a7b7b38547
	setx	0x7e95f857a2855430,%g7,%l0 ! %l0 = 7e95f857a2855430
!	%l1 = 00af85902515a3c7
	setx	0x464672f01eccaff9,%g7,%l1 ! %l1 = 464672f01eccaff9
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff1200ff, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff

p0_label_93:
!	Mem[0000000010081410] = ff0012ff, %l0 = 7e95f857a2855430
	lduwa	[%i2+%o5]0x80,%l0	! %l0 = 00000000ff0012ff
!	Mem[0000000030041410] = 9719ffff, %l2 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l2	! %l2 = ffffffff9719ffff
!	Mem[0000000010101410] = 000000b4, %l5 = 00000000000000ff
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 20000000, %f1  = 378b6def
	lda	[%i1+%o4]0x88,%f1 	! %f1 = 20000000
!	Mem[0000000010081410] = ff1200ff, %l7 = 00000000049e95c3
	lduwa	[%i2+%o5]0x88,%l7	! %l7 = 00000000ff1200ff
!	Mem[0000000010141430] = 73428349, %l5 = 0000000000000000
	ldsb	[%i5+0x033],%l5		! %l5 = 0000000000000049
!	Mem[0000000030001400] = 00b3c75d, %l0 = 00000000ff0012ff
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = ffffffffffffc75d
!	Mem[0000000010181414] = 971994ff, %l6 = 000000000000002c
	ldub	[%i6+0x014],%l6		! %l6 = 0000000000000097
!	Mem[0000000010041400] = ff000000000000ff, %l2 = ffffffff9719ffff
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = ff000000000000ff
!	Starting 10 instruction Store Burst
!	%f0  = ff941997 20000000 00ff0000 0b78ffb4
!	%f4  = 000000b4 fb5acdff 00ff0000 ffe5d582
!	%f8  = 00000000 000000b4 00000020 b1000000
!	%f12 = 080aa8ff 82120000 2fbaa38f 79ff7bcf
	stda	%f0,[%i6]ASI_BLK_AIUPL	! Block Store to 0000000010181400

p0_label_94:
!	Mem[0000000010141410] = 000000ff, %l2 = ff000000000000ff
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l7 = 00000000ff1200ff, Mem[0000000021800100] = a1fca456, %asi = 80
	stha	%l7,[%o3+0x100]%asi	! Mem[0000000021800100] = 00ffa456
!	%l3 = 00000000000000ff, Mem[00000000211c0001] = 00f7c8b9, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00ffc8b9
!	Mem[0000000030101400] = a3930bcf, %l2 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 000000a3000000ff
!	%l7 = 00000000ff1200ff, Mem[0000000010101408] = ff00ffff
	stba	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = ff00ffff
!	%l4 = ba881e28, %l5 = 00000049, Mem[00000000100c1408] = 000000de 82d5e5ff
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = ba881e28 00000049
!	%f16 = 000000ff ffd194f8, %l6 = 0000000000000097
!	Mem[0000000010141420] = 9719ff0001333f72
	add	%i5,0x020,%g1
	stda	%f16,[%g1+%l6]ASI_PST8_P ! Mem[0000000010141420] = 0019ffff01d194f8
!	%l7 = 00000000ff1200ff, Mem[0000000030141408] = ad0000ff
	stwa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = ff1200ff
!	Mem[0000000030181408] = 00001200, %l2 = 00000000000000a3
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 0000000000001200
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ffc8b9, %l0 = ffffffffffffc75d
	ldsb	[%o2+%g0],%l0		! %l0 = 0000000000000000

p0_label_95:
!	Mem[00000000100c1408] = 281e88ba, %l3 = 00000000000000ff
	ldswa	[%i3+%o4]0x80,%l3	! %l3 = 00000000281e88ba
!	Mem[0000000030101400] = ff930bcf, %l5 = 0000000000000049
	lduwa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ff930bcf
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010181408] = b4ff780b0000ff00, %f24 = 0016ff79 e5000551
	ldda	[%i6+%o4]0x80,%f24	! %f24 = b4ff780b 0000ff00
!	%l5 = 00000000ff930bcf, %l2 = 0000000000001200, %l3 = 00000000281e88ba
	sub	%l5,%l2,%l3		! %l3 = 00000000ff92f9cf
!	Mem[0000000010081410] = ff0012ff, %l4 = 00000000ba881e28
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 000000000000ff00
!	%l4 = 000000000000ff00, imm = fffffffffffff958, %l6 = 0000000000000097
	addc	%l4,-0x6a8,%l6		! %l6 = 000000000000f858
!	Mem[0000000030181400] = fb7d2fff, %l5 = 00000000ff930bcf
	ldsha	[%i6+%g0]0x89,%l5	! %l5 = 0000000000002fff
!	Mem[0000000030041400] = 000000ff dba1c701 00000000 0000064a
!	Mem[0000000030041410] = ffff1997 378b6def 5afee7db ffffff00
!	Mem[0000000030041420] = 510500e5 1311b893 000000b4 fb5acd6b
!	Mem[0000000030041430] = b4000000 e5000551 0a2fb301 dad8f819
	ldda	[%i1]ASI_BLK_AIUS,%f16	! Block Load from 0000000030041400
!	Mem[0000000010041400] = ff000000 000000ff, %l0 = 00000000, %l1 = 1eccaff9
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000ff 00000000ff000000
!	Starting 10 instruction Store Burst
!	%f5  = fb5acdff, Mem[0000000010001418] = 9dc993a3
	st	%f5 ,[%i0+0x018]	! Mem[0000000010001418] = fb5acdff

p0_label_96:
!	%l3 = 00000000ff92f9cf, Mem[0000000010101400] = b4000000
	stha	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = f9cf0000
!	%l5 = 0000000000002fff, Mem[0000000030181410] = 00007bcf0000006b
	stxa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000002fff
!	%l7 = 00000000ff1200ff, Mem[0000000030141408] = ff1200ff
	stha	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = ff1200ff
!	Mem[0000000010081400] = ff000000, %l6 = 000000000000f858
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 00000000ff000000
!	%l2 = 0000000000001200, Mem[0000000030101400] = cf0b93ff
	stba	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = cf0b9300
!	%l4 = 000000000000ff00, Mem[0000000030181408] = a3000000
	stwa	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000ff00
!	%l6 = 00000000ff000000, Mem[000000001010140c] = 82120000
	stw	%l6,[%i4+0x00c]		! Mem[000000001010140c] = ff000000
!	Mem[0000000030141410] = ff1aa1fc, %l6 = 00000000ff000000
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010081404] = 01333f72, %l0 = 000000ff, %l0 = 000000ff
	add	%i2,0x04,%g1
	casa	[%g1]0x80,%l0,%l0	! %l0 = 0000000001333f72
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff00ffffe5efabff, %l3 = 00000000ff92f9cf
	ldxa	[%i3+%o4]0x81,%l3	! %l3 = ff00ffffe5efabff

p0_label_97:
!	Mem[00000000211c0000] = 00ffc8b9, %l0 = 0000000001333f72
	lduba	[%o2+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 5dc7b300 01b32f0a, %l0 = 00000000, %l1 = ff000000
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 000000005dc7b300 0000000001b32f0a
!	Mem[0000000021800180] = 000068e0, %l4 = 000000000000ff00
	ldsha	[%o3+0x180]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = 00930bcf, %l5 = 0000000000002fff
	lduha	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000093
!	Mem[0000000030101400] = 00930bcf, %l6 = 00000000000000ff
	lduwa	[%i4+%g0]0x81,%l6	! %l6 = 0000000000930bcf
!	Mem[000000001018142c] = 20000000, %l6 = 0000000000930bcf
	ldsb	[%i6+0x02e],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041400] = 01c7a1db ff000000, %l0 = 5dc7b300, %l1 = 01b32f0a
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 00000000ff000000 0000000001c7a1db
!	Code Fragment 3
p0_fragment_9:
!	%l0 = 00000000ff000000
	setx	0xb80ca677996f86e0,%g7,%l0 ! %l0 = b80ca677996f86e0
!	%l1 = 0000000001c7a1db
	setx	0x09538a6fa7f310cb,%g7,%l1 ! %l1 = 09538a6fa7f310cb
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b80ca677996f86e0
	setx	0x99c3c54fcdcc7c28,%g7,%l0 ! %l0 = 99c3c54fcdcc7c28
!	%l1 = 09538a6fa7f310cb
	setx	0x50ea444023c2f135,%g7,%l1 ! %l1 = 50ea444023c2f135
!	Mem[00000000300c1410] = ff000000, %l4 = 0000000000000000
	ldsba	[%i3+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f2  = 00ff0000 0b78ffb4, %l6 = 0000000000000000
!	Mem[0000000030181438] = b4000000ad000000
	add	%i6,0x038,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_S ! Mem[0000000030181438] = b4000000ad000000

p0_label_98:
!	%l3 = ff00ffffe5efabff, Mem[00000000300c1410] = ff000000378b6def
	stxa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff00ffffe5efabff
!	Mem[0000000010041434] = bc34ce0c, %l4 = ffffffffffffffff
	swap	[%i1+0x034],%l4		! %l4 = 00000000bc34ce0c
!	%l6 = 00000000, %l7 = ff1200ff, Mem[0000000010001410] = 00000074 ff000000
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 ff1200ff
!	Mem[00000000300c1410] = ffff00ff, %l3 = ff00ffffe5efabff
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010181400] = 00000020, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x000]%asi,%l3	! %l3 = 0000000000000020
!	Mem[0000000010001408] = 00ff0000, %l4 = 00000000bc34ce0c
	swapa	[%i0+%o4]0x80,%l4	! %l4 = 0000000000ff0000
!	Mem[0000000010181408] = b4ff780b, %l4 = 0000000000ff0000
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 00000000b4ff780b
!	Mem[0000000010001405] = 00ffffff, %l0 = 99c3c54fcdcc7c28
	ldstub	[%i0+0x005],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000010181410] = fb5acdff, %l4 = 00000000b4ff780b
	swapa	[%i6+%o5]0x88,%l4	! %l4 = 00000000fb5acdff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff2191, %l0 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000ffff

p0_label_99:
!	%f29 = e5000551, %f28 = b4000000
	fstoi	%f29,%f28		! %f28 = 80000000
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000030141400] = 6bcd5afb b4000000 ff0012ff 000000b4
!	Mem[0000000030141410] = ff1aa1fc 5dc79274 2dcb5f2c 59de9a45
!	Mem[0000000030141420] = 3e1ff97f 014a49f2 a04e5cfe fc2d5b3d
!	Mem[0000000030141430] = 32a62ca1 d6aaa767 83db89d2 fd4d317b
	ldda	[%i5]ASI_BLK_AIUS,%f0	! Block Load from 0000000030141400
!	Mem[00000000100c1408] = 281e88ba, %l2 = 0000000000001200
	lduba	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000028
!	%f31 = dad8f819, %f28 = 80000000
	fcmps	%fcc2,%f31,%f28		! %fcc2 = 1
!	Mem[00000000300c1400] = dbe79719, %l7 = 00000000ff1200ff
	lduba	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000019
!	Mem[0000000010181400] = 000000ff, %l6 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001408] = b4000000, %l2 = 0000000000000028
	ldsha	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = 00b3c75d, %l4 = 00000000fb5acdff
	lduba	[%i0+%g0]0x89,%l4	! %l4 = 000000000000005d
!	Mem[0000000010081408] = ff390828, %l1 = 50ea444023c2f135
	ldsha	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000828
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000019, Mem[0000000030101408] = 00001282
	stwa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000019

p0_label_100:
!	%l1 = 0000000000000828, Mem[00000000300c1400] = 1997e7dbffffff00
	stxa	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000828
!	Mem[000000001014141c] = 015e7453, %l4 = 000000000000005d
	swap	[%i5+0x01c],%l4		! %l4 = 00000000015e7453
!	%l5 = 0000000000000093, Mem[0000000010041400] = ff000000
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 00930000
!	%f28 = 80000000 e5000551, Mem[0000000010181400] = 000000ff 971994ff
	stda	%f28,[%i6+%g0]0x80	! Mem[0000000010181400] = 80000000 e5000551
	membar	#Sync			! Added by membar checker (18)
!	%l2 = 0000000000000000, Mem[0000000030141410] = 7492c75dfca11aff
	stxa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	Mem[0000000030181400] = fb7d2fff, %l3 = 0000000000000020
	ldstuba	[%i6+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%f16 = 000000ff dba1c701, Mem[0000000030001400] = 5dc7b300 01b32f0a
	stda	%f16,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff dba1c701
!	%l3 = 00000000000000ff, Mem[00000000300c1410] = ffff00ff
	stha	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffff00ff
!	Mem[0000000020800000] = 39ff7fd0, %l7 = 0000000000000019
	ldstub	[%o1+%g0],%l7		! %l7 = 00000039000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 0016ff79, %l6 = 00000000000000ff
	ldsha	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000016

p0_label_101:
!	Mem[0000000020800000] = ffff7fd0, %l3 = 00000000000000ff
	ldsb	[%o1+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010041410] = 971994ff, %l5 = 0000000000000093
	ldsha	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffff9719
!	Mem[0000000010101410] = 000000b4, %l1 = 0000000000000828
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%f28 = 80000000, %f12 = 32a62ca1, %f31 = dad8f819
	fadds	%f28,%f12,%f31		! %f31 = 32a62ca1
!	Mem[0000000010141420] = 0019ffff, %l0 = 000000000000ffff
	ldsb	[%i5+0x023],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030141408] = ff0012ff, %l6 = 0000000000000016
	lduba	[%i5+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041400] = 00930000 000000ff 00000020 b1000000
!	Mem[0000000010041410] = 971994ff 0b78ff00 ef6d8b37 ff8b6def
!	Mem[0000000010041420] = 8a7183a3 658a05fc 0000000f fb78c414
!	Mem[0000000010041430] = e5efffff ffffffff ffffffe5 ffff00b4
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[0000000030041408] = 00000000, %l4 = 00000000015e7453
	lduwa	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = 00000020, %l1 = 0000000000000000
	ldub	[%i1+%o4],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000039, Mem[0000000030181410] = ff2f0000
	stwa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000039

p0_label_102:
!	%l6 = 00000000000000ff, Mem[0000000010101410] = 00ff0000b4000000
	stxa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000000000ff
!	Mem[000000001014143b] = 0b78fedc, %l4 = 0000000000000000
	ldstuba	[%i5+0x03b]%asi,%l4	! %l4 = 000000dc000000ff
!	%l7 = 0000000000000039, Mem[0000000030001410] = 000ba7ff00000000
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000039
!	Mem[0000000010041410] = 971994ff, %l4 = 00000000000000dc
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000971994ff
!	Mem[0000000010141400] = 281e88ba, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 00000000281e88ba
!	Mem[0000000010141400] = 00000000, %l3 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = 281e88ba, %l3 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 00000000281e88ba
!	%l2 = 00000000281e88ba, Mem[00000000300c1400] = 0000000000000828
	stxa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000281e88ba
!	Mem[00000000218000c0] = 5513f237, %l6 = 00000000000000ff
	ldstub	[%o3+0x0c0],%l6		! %l6 = 00000055000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = cfff8e22, %l4 = 00000000971994ff
	lduba	[%o3+0x141]%asi,%l4	! %l4 = 00000000000000ff

p0_label_103:
!	Mem[00000000100c1400] = e1070a00ffe5d582, %f16 = 000000ff dba1c701
	ldda	[%i3+%g0]0x80,%f16	! %f16 = e1070a00 ffe5d582
!	Mem[0000000010081430] = 000000ad, %l3 = 00000000281e88ba
	ldsw	[%i2+0x030],%l3		! %l3 = 00000000000000ad
!	%l6 = 0000000000000055, %l1 = 0000000000000000, %l7 = 0000000000000039
	xnor	%l6,%l1,%l7		! %l7 = ffffffffffffffaa
!	Mem[0000000010001400] = e42e161e, %l3 = 00000000000000ad
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffffe4
!	Mem[0000000030081408] = f7ffffff, %l0 = ffffffffffffffff
	lduwa	[%i2+%o4]0x81,%l0	! %l0 = 00000000f7ffffff
!	Mem[0000000010081408] = 963daee3 ff390828, %l0 = f7ffffff, %l1 = 00000000
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000ff390828 00000000963daee3
!	Mem[00000000100c1408] = 00000000 49000000, %l0 = ff390828, %l1 = 963daee3
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000 0000000049000000
!	Mem[0000000010101400] = 0000cff9, %l0 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l0	! %l0 = ffffffffffffcff9
!	Mem[0000000020800040] = 691fd57f, %l5 = ffffffffffff9719
	ldsha	[%o1+0x040]%asi,%l5	! %l5 = 000000000000691f
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000021800101] = 00ffa456
	stb	%l4,[%o3+0x101]		! Mem[0000000021800100] = 00ffa456

p0_label_104:
!	Mem[00000000100c1400] = 000a07e1, %l7 = ffffffffffffffaa
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 000000e1000000ff
!	%f30 = 0a2fb301 32a62ca1, Mem[0000000010081400] = 58f80000 723f3301
	stda	%f30,[%i2+%g0]0x88	! Mem[0000000010081400] = 0a2fb301 32a62ca1
!	Mem[0000000010041408] = 20000000, %l0 = ffffffffffffcff9
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 0000000020000000
!	%f20 = ffff1997 378b6def, Mem[0000000030141400] = fb5acd6b 000000b4
	stda	%f20,[%i5+%g0]0x89	! Mem[0000000030141400] = ffff1997 378b6def
!	%l7 = 00000000000000e1, Mem[0000000020800041] = 691fd57f
	stb	%l7,[%o1+0x041]		! Mem[0000000020800040] = 69e1d57f
!	%l5 = 000000000000691f, Mem[0000000030081408] = f7ffffff
	stha	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 691fffff
!	Mem[0000000010181409] = 00ff0000, %l7 = 00000000000000e1
	ldstuba	[%i6+0x009]%asi,%l7	! %l7 = 000000ff000000ff
!	%f25 = 1311b893, Mem[0000000030101408] = 00000019
	sta	%f25,[%i4+%o4]0x81	! Mem[0000000030101408] = 1311b893
!	%l1 = 0000000049000000, Mem[0000000010141434] = 0a9d584b, %asi = 80
	stwa	%l1,[%i5+0x034]%asi	! Mem[0000000010141434] = 49000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1434] = bfa0ff4d, %l2 = 00000000281e88ba
	ldsha	[%i3+0x036]%asi,%l2	! %l2 = ffffffffffffff4d

p0_label_105:
!	Mem[0000000010141410] = 000000ff, %l5 = 000000000000691f
	ldsba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = ffff00ff, %l0 = 0000000020000000
	ldsha	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = a12ca63201b32f0a, %f6  = ef6d8b37 ff8b6def
	ldd	[%i2+%g0],%f6 		! %f6  = a12ca632 01b32f0a
!	%l0 = 00000000000000ff, %l5 = 0000000000000000, %y  = 00000001
	umul	%l0,%l5,%l1		! %l1 = 0000000000000000, %y = 00000000
!	Mem[0000000010181410] = b4ff780b, %l7 = 00000000000000ff
	ldsha	[%i6+%o5]0x88,%l7	! %l7 = 000000000000780b
!	Mem[0000000010041400] = 00930000000000ff, %l0 = 00000000000000ff
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = 00930000000000ff
!	Mem[00000000300c1408] = ffabefe5 ffff00ff, %l2 = ffffff4d, %l3 = ffffffe4
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 00000000ffff00ff 00000000ffabefe5
!	Mem[0000000010101400] = f9cf0000 00ff0000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 00000000f9cf0000 0000000000ff0000
!	%l3 = 00000000ffabefe5, immd = fffffffffffffa6c, %l4 = 00000000f9cf0000
	sdivx	%l3,-0x594,%l4		! %l4 = ffffffffffd22a52
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ff000000, %l6 = 0000000000000055
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 000000ff000000ff

p0_label_106:
!	%f8  = 8a7183a3 658a05fc, %l0 = 00930000000000ff
!	Mem[0000000030101418] = ab8637c45dc79274
	add	%i4,0x018,%g1
	stda	%f8,[%g1+%l0]ASI_PST16_S ! Mem[0000000030101418] = 8a7183a3658a05fc
!	%f3  = b1000000, Mem[000000001014141c] = 0000005d
	sta	%f3 ,[%i5+0x01c]%asi	! Mem[000000001014141c] = b1000000
!	%l5 = 0000000000ff0000, Mem[0000000010141400] = 00000000000000ff
	stxa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000ff0000
!	%f26 = 000000b4 fb5acd6b, %l2 = 00000000ffff00ff
!	Mem[0000000030081420] = fca11a192a2439d5
	add	%i2,0x020,%g1
	stda	%f26,[%g1+%l2]ASI_PST32_S ! Mem[0000000030081420] = 000000b4fb5acd6b
!	%l3 = 00000000ffabefe5, Mem[0000000030081400] = 0016ff79
	stba	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = e516ff79
!	%l3 = 00000000ffabefe5, Mem[0000000030101400] = 00930bcfea584e8c
	stxa	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000ffabefe5
!	%l2 = 00000000ffff00ff, Mem[00000000100c1428] = 00000020, %asi = 80
	stha	%l2,[%i3+0x028]%asi	! Mem[00000000100c1428] = 00ff0020
!	%l7 = 000000000000780b, Mem[0000000010081400] = a12ca632
	stha	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 780ba632
!	%f30 = 0a2fb301, Mem[0000000010081410] = ff0012ff
	sta	%f30,[%i2+%o5]0x80	! Mem[0000000010081410] = 0a2fb301
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 00930000000000ff
	setx	0xef49bbd84a02012a,%g7,%l0 ! %l0 = ef49bbd84a02012a
!	%l1 = 0000000000000000
	setx	0xc502285018fe4546,%g7,%l1 ! %l1 = c502285018fe4546
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ef49bbd84a02012a
	setx	0x9f7ff578371f51c6,%g7,%l0 ! %l0 = 9f7ff578371f51c6
!	%l1 = c502285018fe4546
	setx	0x0384bae01977ef29,%g7,%l1 ! %l1 = 0384bae01977ef29

p0_label_107:
!	Mem[00000000300c1410] = ffff00ff, %l7 = 000000000000780b
	ldsha	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101410] = 000000ff, %l3 = 00000000ffabefe5
	lduwa	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000, %l0 = 9f7ff578371f51c6
	ldswa	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081428] = 14c478fb, %l0 = 0000000000000000
	lduha	[%i2+0x028]%asi,%l0	! %l0 = 00000000000014c4
!	Mem[00000000211c0000] = 00ffc8b9, %l2 = 00000000ffff00ff
	ldsh	[%o2+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010141410] = 000000ff000000ff, %l7 = 00000000000000ff
	ldxa	[%i5+0x010]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030081400] = 00ffffff 79ff16e5, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 0000000079ff16e5 0000000000ffffff
!	Mem[000000001000140c] = ffffffff, %l1 = 0384bae01977ef29
	lduw	[%i0+0x00c],%l1		! %l1 = 00000000ffffffff
!	Mem[0000000010181410] = 0b78ffb4, %l6 = 0000000079ff16e5
	ldswa	[%i6+%o5]0x80,%l6	! %l6 = 000000000b78ffb4
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000010081400] = 780ba632
	stwa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff

p0_label_108:
	membar	#Sync			! Added by membar checker (19)
!	%l6 = 000000000b78ffb4, Mem[0000000010041428] = 0000000ffb78c414, %asi = 80
	stxa	%l6,[%i1+0x028]%asi	! Mem[0000000010041428] = 000000000b78ffb4
!	%f3  = b1000000, %f0  = 00930000
	fsqrts	%f3 ,%f0 		! %f0  = 7fffffff
!	%f4  = 971994ff 0b78ff00, Mem[0000000030141410] = 00000000 00000000
	stda	%f4 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 971994ff 0b78ff00
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010101438] = dba1c701 4d821985
	std	%l2,[%i4+0x038]		! Mem[0000000010101438] = 000000ff 000000ff
!	%l6 = 000000000b78ffb4, Mem[0000000010081410] = 01b32f0a
	stwa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 0b78ffb4
!	%l7 = 0000000000ffffff, Mem[0000000010101410] = ff000000
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = ffff0000
!	Mem[0000000030101400] = 00000000, %l4 = ffffffffffd22a52
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[00000000100c1408] = 00000000
	stha	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ff0000
!	%l2 = 00000000000000ff, %l2 = 00000000000000ff, %y  = 00000000
	sdiv	%l2,%l2,%l6		! %l6 = 0000000000000001
	mov	%l0,%y			! %y = 000014c4
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00b3c75d, %l4 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 00000000000000b3

p0_label_109:
!	%l2 = 00000000000000ff, immd = 0000000000000d83, %l3  = 00000000000000ff
	mulx	%l2,0xd83,%l3		! %l3 = 00000000000d757d
!	Mem[0000000010101420] = ef6d8b377dab064a, %l1 = 00000000ffffffff
	ldxa	[%i4+0x020]%asi,%l1	! %l1 = ef6d8b377dab064a
!	Mem[0000000030001408] = 000000b4, %l7 = 0000000000ffffff
	lduha	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = 000000b1ffffcff9, %l7 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l7	! %l7 = 000000b1ffffcff9
!	Mem[0000000010181400] = 80000000, %l4 = 00000000000000b3
	lduwa	[%i6+%g0]0x80,%l4	! %l4 = 0000000080000000
!	Mem[0000000021800140] = cfff8e22, %l3 = 00000000000d757d
	lduba	[%o3+0x140]%asi,%l3	! %l3 = 00000000000000cf
!	Mem[0000000010141408] = a30000b3, %l3 = 00000000000000cf
	ldswa	[%i5+%o4]0x80,%l3	! %l3 = ffffffffa30000b3
!	Mem[00000000100c1400] = ff070a00, %l6 = 0000000000000001
	lduba	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141408] = ff1200ff, %l1 = ef6d8b377dab064a
	ldsba	[%i5+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010181434] = ffa80a08, %asi = 80
	stwa	%l2,[%i6+0x034]%asi	! Mem[0000000010181434] = 000000ff

p0_label_110:
!	%l6 = 000000ff, %l7 = ffffcff9, Mem[0000000010041410] = 000000dc 0b78ff00
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff ffffcff9
!	%f16 = e1070a00, Mem[0000000030101410] = a31c4452
	sta	%f16,[%i4+%o5]0x81	! Mem[0000000030101410] = e1070a00
!	Mem[00000000100c1410] = 00b3c75d, %l4 = 0000000080000000
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 0000000000b3c75d
!	Mem[0000000030041400] = ff000000, %l4 = 0000000000b3c75d
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 00000000ff000000
!	%l5 = 0000000000ff0000, Mem[0000000030101408] = 1311b893
	stba	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 0011b893
!	%l2 = 00000000000000ff, Mem[0000000030141408] = ff0012ff000000b4
	stxa	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000000000ff
!	%l0 = 00000000000014c4, Mem[00000000100c1408] = 00ff0000
	stwa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000014c4
!	%l1 = ffffffffffffffff, Mem[0000000010181400] = 80000000, %asi = 80
	stha	%l1,[%i6+0x000]%asi	! Mem[0000000010181400] = ffff0000
!	%f0  = 7fffffff 000000ff 00000020 b1000000
!	%f4  = 971994ff 0b78ff00 a12ca632 01b32f0a
!	%f8  = 8a7183a3 658a05fc 0000000f fb78c414
!	%f12 = e5efffff ffffffff ffffffe5 ffff00b4
	stda	%f0,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0000ff00, %f27 = fb5acd6b
	ld	[%i5+%g0],%f27	! %f27 = 0000ff00

p0_label_111:
!	Mem[0000000010181438] = cf7bff79, %l2 = 00000000000000ff
	ldub	[%i6+0x039],%l2		! %l2 = 000000000000007b
!	Mem[0000000010181408] = 00ff00000000ff00, %f20 = ffff1997 378b6def
	ldda	[%i6+%o4]0x88,%f20	! %f20 = 00ff0000 0000ff00
!	Mem[0000000010181410] = 000000b4 b4ff780b, %l4 = ff000000, %l5 = 00ff0000
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 00000000b4ff780b 00000000000000b4
	membar	#Sync			! Added by membar checker (20)
!	Mem[000000001008142c] = fb78c414, %l1 = ffffffffffffffff
	ldsb	[%i2+0x02f],%l1		! %l1 = 0000000000000014
!	Mem[0000000030001400] = ff000000, %l4 = 00000000b4ff780b
	lduba	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 5dc7b300, %l4 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l4	! %l4 = 0000000000005dc7
!	Mem[00000000100c1410] = 80000000, %l1 = 0000000000000014
	lduha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000008000
!	Mem[0000000030041408] = 000000000000064a, %l6 = 00000000000000ff
	ldxa	[%i1+%o4]0x81,%l6	! %l6 = 000000000000064a
!	Mem[0000000030141410] = 00ff780bff941997, %f28 = 80000000 e5000551
	ldda	[%i5+%o5]0x89,%f28	! %f28 = 00ff780b ff941997
!	Starting 10 instruction Store Burst
!	%l7 = 000000b1ffffcff9, Mem[000000001000140c] = ffffffff
	stb	%l7,[%i0+0x00c]		! Mem[000000001000140c] = f9ffffff

p0_label_112:
!	%f9  = 658a05fc, Mem[0000000010181410] = b4ff780b
	sta	%f9 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 658a05fc
!	%f14 = ffffffe5 ffff00b4, %l0 = 00000000000014c4
!	Mem[0000000010141400] = 0000ff0000000000
	stda	%f14,[%i5+%l0]ASI_PST32_PL ! Mem[0000000010141400] = 0000ff0000000000
!	Mem[000000001004140a] = f9cfffff, %l6 = 000000000000064a
	ldstub	[%i1+0x00a],%l6		! %l6 = 000000ff000000ff
!	%l3 = ffffffffa30000b3, Mem[0000000010081408] = 00000020
	stha	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 00b30020
!	Mem[0000000010001400] = 1e162ee4, %l0 = 00000000000014c4
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 000000001e162ee4
!	Mem[00000000100c1431] = 2e8fd907, %l2 = 000000000000007b
	ldstuba	[%i3+0x031]%asi,%l2	! %l2 = 0000008f000000ff
!	%l0 = 1e162ee4, %l1 = 00008000, Mem[0000000030041408] = 00000000 4a060000
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 1e162ee4 00008000
!	Mem[0000000010081438] = ffffffe5, %l3 = ffffffffa30000b3
	ldstub	[%i2+0x038],%l3		! %l3 = 000000ff000000ff
!	Mem[0000000030041400] = 5dc7b300, %l7 = 000000b1ffffcff9
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 0000005d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 000000ff, %l3 = 00000000000000ff
	lduwa	[%i5+%o5]0x80,%l3	! %l3 = 00000000000000ff

p0_label_113:
!	Mem[0000000030141410] = 971994ff, %l6 = 00000000000000ff
	lduba	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000097
!	Mem[0000000010141408] = b30000a3, %l0 = 000000001e162ee4
	lduba	[%i5+%o4]0x88,%l0	! %l0 = 00000000000000a3
!	Mem[0000000010141410] = ff000000, %l0 = 00000000000000a3
	ldsha	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 000014c4, %l2 = 000000000000008f
	ldswa	[%i0+%g0]0x88,%l2	! %l2 = 00000000000014c4
!	Mem[0000000021800140] = cfff8e22, %l7 = 000000000000005d
	lduba	[%o3+0x141]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[000000001008143c] = ffff00b4, %l5 = 00000000000000b4
	ldsh	[%i2+0x03e],%l5		! %l5 = 00000000000000b4
!	Mem[0000000010101408] = ffff00ff, %l5 = 00000000000000b4
	lduba	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[000000001010142c] = 679dceb6, %l6 = 0000000000000097
	ldub	[%i4+0x02e],%l6		! %l6 = 00000000000000ce
!	Mem[0000000010081408] = 2000b300, %l1 = 0000000000008000
	lduha	[%i2+%o4]0x88,%l1	! %l1 = 000000000000b300
!	Starting 10 instruction Store Burst
!	%f24 = 510500e5, Mem[0000000010081400] = 7fffffff
	sta	%f24,[%i2+0x000]%asi	! Mem[0000000010081400] = 510500e5

p0_label_114:
!	Mem[0000000010101400] = f9cf0000, %l5 = 00000000000000ff
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 00000000f9cf0000
!	Mem[0000000010081410] = 971994ff, %l4 = 0000000000005dc7
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 00000000971994ff
!	Mem[00000000300c1410] = ffff00ff, %l4 = 00000000971994ff
	ldstuba	[%i3+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%l6 = 000000ce, %l7 = 000000ff, Mem[0000000030101408] = 0011b893 00000000
	stda	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ce 000000ff
!	Mem[00000000300c1410] = ff00ffff, %l3 = 00000000000000ff
	ldstuba	[%i3+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141400] = 0000ff00
	stwa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff
!	Mem[0000000030101408] = 000000ce, %l2 = 00000000000014c4
	ldstuba	[%i4+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141400] = 378b6def, %l7 = 00000000000000ff
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 000000ef000000ff
!	%l3 = 00000000000000ff, Mem[000000001018143d] = 8fa3ba2f
	stb	%l3,[%i6+0x03d]		! Mem[000000001018143c] = 8fffba2f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ffc7b300dba1c701, %l1 = 000000000000b300
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = ffc7b300dba1c701

p0_label_115:
!	%l5 = 00000000f9cf0000, imm = 0000000000000acc, %l6 = 00000000000000ce
	addc	%l5,0xacc,%l6		! %l6 = 00000000f9cf0acc
!	Mem[0000000030001410] = 00000000, %l5 = 00000000f9cf0000
	lduwa	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = 000080001e162ee4, %f4  = 971994ff 0b78ff00
	ldda	[%i1+%o4]0x89,%f4 	! %f4  = 00008000 1e162ee4
!	Mem[0000000010041400] = 00930000 000000ff, %l0 = 00000000, %l1 = dba1c701
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 0000000000930000 00000000000000ff
!	Mem[0000000010141428] = 0b7861b4, %l2 = 0000000000000000
	ldub	[%i5+0x02b],%l2		! %l2 = 00000000000000b4
!	%f11 = fb78c414, %f26 = 000000b4
	fcmps	%fcc1,%f11,%f26		! %fcc1 = 1
!	Mem[0000000030101410] = e1070a0000000000, %l1 = 00000000000000ff
	ldxa	[%i4+%o5]0x81,%l1	! %l1 = e1070a0000000000
!	Mem[0000000030181400] = 00000000fb7d2fff, %l7 = 00000000000000ef
	ldxa	[%i6+%g0]0x89,%l7	! %l7 = 00000000fb7d2fff
!	Mem[0000000010041400] = 00930000, %l2 = 00000000000000b4
	lduwa	[%i1+%g0]0x80,%l2	! %l2 = 0000000000930000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000fb7d2fff, Mem[0000000030001408] = 000000b4
	stha	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 2fff00b4

p0_label_116:
!	%l4 = 00000000000000ff, Mem[0000000030041400] = ffc7b300
	stba	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = ffc7b300
!	%l3 = 00000000000000ff, %l4 = 00000000000000ff, %l0 = 0000000000930000
	udivx	%l3,%l4,%l0		! %l0 = 0000000000000001
!	%l3 = 00000000000000ff, Mem[0000000030141408] = ff00000000000000
	stxa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000000000ff
!	Mem[00000000300c1410] = ff00ffff, %l7 = 00000000fb7d2fff
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 00000000ff00ffff
!	%l4 = 00000000000000ff, Mem[0000000010001410] = 00000000ff1200ff
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000000000ff
!	%f28 = 00ff780b ff941997, %l7 = 00000000ff00ffff
!	Mem[0000000030141408] = ff00000000000000
	add	%i5,0x008,%g1
	stda	%f28,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030141408] = 971994ff0b78ff00
!	%f16 = e1070a00 ffe5d582, %l3 = 00000000000000ff
!	Mem[0000000010081410] = 00005dc70b78ff00
	add	%i2,0x010,%g1
	stda	%f16,[%g1+%l3]ASI_PST16_P ! Mem[0000000010081410] = e1070a00ffe5d582
!	Mem[000000001000142c] = 2fbaa38f, %l4 = 000000ff, %l7 = ff00ffff
	add	%i0,0x2c,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 000000002fbaa38f
!	Mem[0000000010001430] = ff728cdc, %l1 = 00000000, %l3 = 000000ff
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 00000000ff728cdc
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 000000ff, %l7 = 000000002fbaa38f
	lduba	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000000

p0_label_117:
!	Mem[00000000201c0000] = ffff2191, %l5 = 0000000000000000
	ldub	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010081408] = 00b30020b1000000, %f8  = 8a7183a3 658a05fc
	ldda	[%i2+%o4]0x80,%f8 	! %f8  = 00b30020 b1000000
!	Mem[0000000010141408] = b30000a3, %l7 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l7	! %l7 = ffffffffb30000a3
!	Mem[0000000010041408] = ffffcff9, %l7 = ffffffffb30000a3
	lduba	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000f9
!	Mem[0000000030041408] = 1e162ee4, %l3 = 00000000ff728cdc
	ldsha	[%i1+%o4]0x89,%l3	! %l3 = 0000000000002ee4
!	Mem[0000000010041428] = 000000000b78ffb4, %f14 = ffffffe5 ffff00b4
	ldda	[%i1+0x028]%asi,%f14	! %f14 = 00000000 0b78ffb4
!	Mem[0000000010181408] = 00ff0000 0000ff00, %l4 = 000000ff, %l5 = 000000ff
	ldd	[%i6+%o4],%l4		! %l4 = 0000000000ff0000 000000000000ff00
!	Mem[0000000030141400] = 378b6dff, %f23 = ffffff00
	lda	[%i5+%g0]0x89,%f23	! %f23 = 378b6dff
!	Mem[0000000010101410] = 0000ffff, %l7 = 00000000000000f9
	lduwa	[%i4+%o5]0x88,%l7	! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l4 = 00ff0000, %l5 = 0000ff00, Mem[0000000010041410] = ff000000 f9cfffff
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00ff0000 0000ff00

p0_label_118:
!	Mem[0000000010141410] = ff000000, %l5 = 000000000000ff00
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%l2 = 0000000000930000, Mem[0000000030001410] = 00000000
	stba	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%f10 = 0000000f fb78c414, Mem[0000000010001400] = 000014c4 ffffff00
	stda	%f10,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000f fb78c414
!	%l1 = e1070a0000000000, Mem[0000000030001410] = 00000000
	stha	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%f0  = 7fffffff, Mem[0000000010001424] = f47d9ad3
	sta	%f0 ,[%i0+0x024]%asi	! Mem[0000000010001424] = 7fffffff
!	%l1 = e1070a0000000000, Mem[0000000010001400] = 14c478fb0f000000
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = e1070a0000000000
!	Mem[000000001014140d] = 000000b4, %l3 = 0000000000002ee4
	ldstuba	[%i5+0x00d]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0000] = 00ffc8b9, %l6 = 00000000f9cf0acc
	ldstub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	%l2 = 00930000, %l3 = 00000000, Mem[00000000100c1400] = ff070a00 ffe5d582
	stda	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00930000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = 82d5e5ff0000ff00, %l3 = 0000000000000000
	ldx	[%i6+0x018],%l3		! %l3 = 82d5e5ff0000ff00

p0_label_119:
!	Mem[0000000010081400] = ff000000e5000551, %f26 = 000000b4 0000ff00
	ldda	[%i2+%g0]0x88,%f26	! %f26 = ff000000 e5000551
!	Mem[0000000010001438] = 954e5ecf378b6def, %l6 = 0000000000000000
	ldxa	[%i0+0x038]%asi,%l6	! %l6 = 954e5ecf378b6def
!	Mem[0000000030041410] = ffff1997378b6def, %f0  = 7fffffff 000000ff
	ldda	[%i1+%o5]0x81,%f0 	! %f0  = ffff1997 378b6def
!	Mem[00000000100c1408] = c4140000, %l6 = 954e5ecf378b6def
	lduwa	[%i3+%o4]0x88,%l6	! %l6 = 00000000c4140000
!	Mem[00000000100c1408] = 000014c4, %l1 = e1070a0000000000
	lduha	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = ff00ffff, %f5  = 1e162ee4
	lda	[%i4+%o4]0x88,%f5 	! %f5 = ff00ffff
!	Mem[0000000030081410] = e2010551, %f20 = 00ff0000
	lda	[%i2+%o5]0x89,%f20	! %f20 = e2010551
!	Mem[0000000010141400] = ff000000, %l6 = 00000000c4140000
	ldswa	[%i5+%g0]0x88,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010141410] = ff000000 ff0000ff, %l2 = 00930000, %l3 = 0000ff00
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 00000000ff0000ff 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l6 = ff000000, %l7 = 0000ffff, Mem[0000000010081400] = e5000551 ff000000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000 0000ffff

p0_label_120:
!	%l5 = 0000000000000000, Mem[0000000010101408] = ff00ffff
	stba	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = ff00ff00
!	%l0 = 0000000000000001, Mem[0000000030141400] = 378b6dff
	stwa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000001
!	Mem[0000000030181410] = 00000039, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%l2 = 00000000ff0000ff, immed = 000004aa, %y  = 000014c4
	udiv	%l2,0x4aa,%l0		! %l0 = 00000000ffffffff
	mov	%l0,%y			! %y = ffffffff
!	%l7 = 000000000000ffff, Mem[00000000211c0001] = ffffc8b9
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = ffffc8b9
!	%l0 = ffffffff, %l1 = 00000000, Mem[0000000010001400] = e1070a00 00000000
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffff 00000000
!	%l6 = ff000000, %l7 = 0000ffff, Mem[0000000010101428] = 170d865e 679dceb6
	std	%l6,[%i4+0x028]		! Mem[0000000010101428] = ff000000 0000ffff
!	%l0 = 00000000ffffffff, imm = 0000000000000ddb, %l1 = 0000000000000000
	add	%l0,0xddb,%l1		! %l1 = 0000000100000dda
!	Mem[0000000030101408] = ff0000ce, %l1 = 0000000100000dda
	ldstuba	[%i4+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000ff0000
	lduwa	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000

p0_label_121:
!	Mem[000000001004143c] = ffff00b4, %l6 = ffffffffff000000
	ldsh	[%i1+0x03e],%l6		! %l6 = 00000000000000b4
!	Mem[0000000010081410] = 000a07e1, %l7 = 000000000000ffff
	lduwa	[%i2+%o5]0x88,%l7	! %l7 = 00000000000a07e1
!	Mem[000000001018140c] = 0000ff00, %l0 = 00000000ffffffff
	ldub	[%i6+0x00e],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010141410] = ff0000ff000000ff, %l3 = 00000000ff000000
	ldxa	[%i5+%o5]0x80,%l3	! %l3 = ff0000ff000000ff
!	Mem[0000000010041400] = 00009300, %l1 = 00000000000000ff
	ldswa	[%i1+%g0]0x88,%l1	! %l1 = 0000000000009300
!	Mem[00000000100c1410] = 80000000, %f8  = 00b30020
	lda	[%i3+%o5]0x80,%f8 	! %f8 = 80000000
!	Mem[0000000010001400] = ffffffff 00000000, %l6 = 000000b4, %l7 = 000a07e1
	ldda	[%i0+0x000]%asi,%l6	! %l6 = 00000000ffffffff 0000000000000000
!	Mem[0000000010181400] = ffff0000e5000551, %f4  = 00008000 ff00ffff
	ldda	[%i6+%g0]0x80,%f4 	! %f4  = ffff0000 e5000551
!	Mem[00000000100c140c] = 49000000, %l6 = 00000000ffffffff
	ldsw	[%i3+0x00c],%l6		! %l6 = 0000000049000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000211c0001] = ffffc8b9, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff00c8b9

p0_label_122:
!	%l1 = 0000000000009300, Mem[0000000010041400] = 00930000000000ff
	stxa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000009300
!	Mem[0000000030041400] = 00b3c7ff, %l3 = ff0000ff000000ff
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000030041400] = 00b3c7ff
	stba	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00b3c700
!	Mem[0000000030141400] = 00000001, %l1 = 0000000000009300
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000001
!	Mem[0000000010041430] = e5efffff, %l7 = 0000000000000000
	swap	[%i1+0x030],%l7		! %l7 = 00000000e5efffff
!	%l6 = 0000000049000000, imm = fffffffffffff393, %l2 = 00000000ff0000ff
	addc	%l6,-0xc6d,%l2		! %l2 = 0000000048fff393
!	%l2 = 0000000048fff393, Mem[0000000010181410] = fc058a65b4000000, %asi = 80
	stxa	%l2,[%i6+0x010]%asi	! Mem[0000000010181410] = 0000000048fff393
!	%l2 = 0000000048fff393, imm = 0000000000000b57, %l7 = 00000000e5efffff
	orn	%l2,0xb57,%l7		! %l7 = fffffffffffff7bb
!	Mem[00000000100c1410] = 00000080, %l1 = 0000000000000001
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 00000080000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00ff0000, %f19 = 0000064a
	lda	[%i1+%o5]0x88,%f19	! %f19 = 00ff0000

p0_label_123:
!	Mem[00000000100c1408] = 00000049c4140000, %l0 = 00000000000000ff
	ldxa	[%i3+%o4]0x88,%l0	! %l0 = 00000049c4140000
!	Mem[0000000010181430] = 00001282000000ff, %f20 = e2010551 0000ff00
	ldd	[%i6+0x030],%f20	! %f20 = 00001282 000000ff
!	Mem[0000000010101400] = 000000ff, %l6 = 0000000049000000
	lduba	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = ffff0000, %l4 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030001408] = b400ff2f, %l1 = 0000000000000080
	ldsha	[%i0+%o4]0x89,%l1	! %l1 = ffffffffffffff2f
!	Mem[0000000010181400] = 510500e50000ffff, %l0 = 00000049c4140000
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = 510500e50000ffff
!	Mem[0000000010001410] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l7 = fffffffffffff7bb, imm = fffffffffffff2af, %l1 = ffffffffffffff2f
	or	%l7,-0xd51,%l1		! %l1 = fffffffffffff7bf
!	Mem[0000000030001410] = 0000000000000039, %l4 = 000000000000ffff
	ldxa	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000039
!	Starting 10 instruction Store Burst
!	%l1 = fffffffffffff7bf, Mem[0000000010081400] = ff000000
	stha	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = ff00f7bf

p0_label_124:
!	%f4  = ffff0000 e5000551, Mem[0000000010041410] = 0000ff00 00ff0000
	stda	%f4 ,[%i1+%o5]0x80	! Mem[0000000010041410] = ffff0000 e5000551
!	Mem[0000000010141438] = 0b78feff, %l7 = fffffffffffff7bb
	swap	[%i5+0x038],%l7		! %l7 = 000000000b78feff
!	Mem[0000000010041400] = 00000000, %l1 = fffffffffffff7bf
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%l4 = 0000000000000039, imm = ffffffffffffffab, %l4 = 0000000000000039
	sub	%l4,-0x055,%l4		! %l4 = 000000000000008e
!	%f20 = 00001282, Mem[00000000300c1410] = fb7d2fff
	sta	%f20,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00001282
!	Mem[0000000010081408] = 2000b300, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l7 = 000000000b78feff, Mem[00000000100c1410] = 9dc993a3000000ff
	stxa	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000000b78feff
!	%l6 = 0000000000000000, Mem[0000000010181400] = ffff0000, %asi = 80
	stwa	%l6,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000
!	Mem[0000000010001418] = fb5acdff000000ff, %l4 = 000000000000008e, %l7 = 000000000b78feff
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = fb5acdff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l4 = 000000000000008e
	ldsba	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000

p0_label_125:
!	Mem[00000000100c1400] = 00009300, %l7 = fb5acdff000000ff
	ldsha	[%i3+%g0]0x88,%l7	! %l7 = ffffffffffff9300
!	Mem[0000000010081408] = ffb30020, %l0 = 510500e50000ffff
	ldsha	[%i2+%o4]0x80,%l0	! %l0 = ffffffffffffffb3
!	Mem[0000000010181408] = 00ff0000, %l0 = ffffffffffffffb3
	ldsw	[%i6+%o4],%l0		! %l0 = 0000000000ff0000
!	Mem[0000000030001400] = ff000000, %l1 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = a30000b3, %l0 = 0000000000ff0000
	ldsha	[%i5+%o4]0x80,%l0	! %l0 = ffffffffffffa300
!	Mem[0000000010181410] = 93f3ff4800000000, %l7 = ffffffffffff9300
	ldxa	[%i6+%o5]0x88,%l7	! %l7 = 93f3ff4800000000
!	Mem[0000000030001410] = 3900000000000000, %l4 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = 3900000000000000
!	Mem[0000000030081400] = 79ff16e5, %l5 = 0000000000000000
	lduwa	[%i2+%g0]0x89,%l5	! %l5 = 0000000079ff16e5
!	Mem[0000000010041408] = f9cfffff, %l7 = 93f3ff4800000000
	ldsha	[%i1+%o4]0x80,%l7	! %l7 = fffffffffffff9cf
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 00000000000000ff

p0_label_126:
!	%l4 = 3900000000000000, Mem[0000000010181400] = 00000000
	stwa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%f14 = 00000000, Mem[00000000300c1400] = 00000000
	sta	%f14,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010081420] = 8a7183a3658a05fc, %l6 = 0000000000000000, %l2 = 0000000048fff393
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = 8a7183a3658a05fc
!	%f0  = ffff1997 378b6def 00000020 b1000000
!	%f4  = ffff0000 e5000551 a12ca632 01b32f0a
!	%f8  = 80000000 b1000000 0000000f fb78c414
!	%f12 = e5efffff ffffffff 00000000 0b78ffb4
	stda	%f0,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	Mem[0000000030141400] = 00930000, %l0 = ffffffffffffa300
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 0000000000930000
!	%l6 = 0000000000000000, Mem[00000000100c1400] = 0093000000000000
	stxa	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000000
!	Mem[0000000010081408] = 2000b3ff, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%f0  = ffff1997 378b6def 00000020 b1000000
!	%f4  = ffff0000 e5000551 a12ca632 01b32f0a
!	%f8  = 80000000 b1000000 0000000f fb78c414
!	%f12 = e5efffff ffffffff 00000000 0b78ffb4
	stda	%f0,[%i3]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	%l6 = 0000000000000000, Mem[0000000030041400] = 00b3c700
	stba	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00b3c700
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010101400] = 000000ff00ff0000, %f16 = e1070a00 ffe5d582
	ldda	[%i4+%g0]0x80,%f16	! %f16 = 000000ff 00ff0000

p0_label_127:
!	Mem[0000000010141400] = 000000ff00000000, %l7 = fffffffffffff9cf
	ldxa	[%i5+%g0]0x80,%l7	! %l7 = 000000ff00000000
!	Mem[0000000010141400] = 000000ff00000000, %f26 = ff000000 e5000551
	ldda	[%i5+0x000]%asi,%f26	! %f26 = 000000ff 00000000
!	Mem[0000000010181400] = 00000000, %l4 = 3900000000000000
	ldsba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ffff2191, %l0 = 0000000000930000
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	%l2 = 8a7183a3658a05fc, %l6 = 0000000000000000, %l3 = 00000000000000ff
	and	%l2,%l6,%l3		! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 00000020b1000000, %f18 = 00000000 00ff0000
	ldda	[%i3+%o4]0x88,%f18	! %f18 = 00000020 b1000000
!	Mem[0000000030081410] = 510501e2000000b4, %l6 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = 510501e2000000b4
!	Mem[00000000100c1408] = b1000000, %l0 = ffffffffffffffff
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 00c7b300, %l2 = 8a7183a3658a05fc
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = 00000000000000c7
!	Starting 10 instruction Store Burst
!	%f16 = 000000ff 00ff0000, Mem[0000000010141408] = b30000a3 b400ff00
	stda	%f16,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff 00ff0000

p0_label_128:
!	Mem[00000000100c1400] = 378b6def, %l2 = 00000000000000c7
	swapa	[%i3+%g0]0x88,%l2	! %l2 = 00000000378b6def
!	%l2 = 00000000378b6def, imm = 0000000000000500, %l4 = 0000000000000000
	or	%l2,0x500,%l4		! %l4 = 00000000378b6def
!	Mem[0000000030081400] = 79ff16e5, %l7 = 000000ff00000000
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 0000000079ff16e5
!	%l6 = 510501e2000000b4, Mem[0000000030181408] = 47f8f1550000ff00
	stxa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 510501e2000000b4
!	%f19 = b1000000, Mem[0000000010101408] = 00ff00ff
	sta	%f19,[%i4+%o4]0x80	! Mem[0000000010101408] = b1000000
!	Mem[0000000030001408] = b400ff2f, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 0000002f000000ff
!	Mem[0000000010001408] = bc34ce0c, %l7 = 0000000079ff16e5
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 00000000bc34ce0c
!	Mem[0000000010101410] = ffff0000, %l6 = 510501e2000000b4
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%f17 = 00ff0000, %f24 = 510500e5, %f16 = 000000ff
	fmuls	%f17,%f24,%f16		! %f16 = 12847be4
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = 73428349, %l1 = 0000000000000000
	ldsba	[%i5+0x030]%asi,%l1	! %l1 = 0000000000000073

p0_label_129:
!	Mem[0000000030181410] = ff000039 00000000, %l6 = 000000ff, %l7 = bc34ce0c
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 00000000ff000039 0000000000000000
!	Mem[0000000010001408] = 79ff16e5, %l0 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l0	! %l0 = 00000000000079ff
!	Mem[0000000030181400] = fb7d2fff, %l4 = 00000000378b6def
	lduba	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181408] = 00ff00000000ff00, %l3 = 000000000000002f
	ldxa	[%i6+%o4]0x80,%l3	! %l3 = 00ff00000000ff00
!	Mem[0000000010181408] = 0000ff00, %l2 = 00000000378b6def
	lduha	[%i6+%o4]0x88,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030001408] = ffff00b4dbe7fe5a, %l2 = 000000000000ff00
	ldxa	[%i0+%o4]0x81,%l2	! %l2 = ffff00b4dbe7fe5a
!	Mem[0000000010181424] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i6+0x024]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = e1070a00, %l6 = 00000000ff000039
	lduba	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000e1
!	Mem[0000000010001420] = 89724a09, %l6 = 00000000000000e1
	ldsb	[%i0+0x022],%l6		! %l6 = 000000000000004a
!	Starting 10 instruction Store Burst
!	%f12 = e5efffff ffffffff, %l3 = 00ff00000000ff00
!	Mem[0000000030141430] = 32a62ca1d6aaa767
	add	%i5,0x030,%g1
	stda	%f12,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030141430] = 32a62ca1d6aaa767

p0_label_130:
!	%l4 = 0000000000000000, Mem[00000000100c1418] = 0a2fb30132a62ca1, %asi = 80
	stxa	%l4,[%i3+0x018]%asi	! Mem[00000000100c1418] = 0000000000000000
!	%l3 = 00ff00000000ff00, immed = 00000e8d, %y  = ffffffff
	smul	%l3,0xe8d,%l3		! %l3 = 000000000e7e7300, %y = 00000000
!	Mem[0000000010101420] = ef6d8b37, %l1 = 0000000000000073, %asi = 80
	swapa	[%i4+0x020]%asi,%l1	! %l1 = 00000000ef6d8b37
!	%l2 = dbe7fe5a, %l3 = 0e7e7300, Mem[00000000100c1410] = e5000551 ffff0000
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = dbe7fe5a 0e7e7300
!	%l4 = 00000000, %l5 = 79ff16e5, Mem[0000000030081400] = 00000000 00ffffff
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 79ff16e5
!	%l4 = 0000000000000000, %l1 = 00000000ef6d8b37, %y  = 00000000
	smul	%l4,%l1,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[00000000300c1400] = 00000000, %l5 = 0000000079ff16e5
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181408] = 000000b4, %l0 = 00000000000079ff
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 000000b4000000ff
!	%f0  = ffff1997 378b6def, Mem[0000000010101410] = ffff0000 00000000
	stda	%f0 ,[%i4+%o5]0x80	! Mem[0000000010101410] = ffff1997 378b6def
!	Starting 10 instruction Load Burst
!	%f28 = 00ff780b, %f9  = b1000000, %f6  = a12ca632
	fadds	%f28,%f9 ,%f6 		! %f6  = b1000000

p0_label_131:
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000030181400] = ff2f7dfb 00000000 ff000000 e2010551
!	Mem[0000000030181410] = ff000039 00000000 9d000000 20000000
!	Mem[0000000030181420] = 8a718372 658afffc 6169e7f2 fb78c414
!	Mem[0000000030181430] = ba1a95e5 bc34ce0c b4000000 ad000000
	ldda	[%i6]ASI_BLK_AIUS,%f0	! Block Load from 0000000030181400
!	Mem[0000000030081400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 00ff0000, %l7 = 0000000000000000
	lduha	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = ff000000000000ff, %l1 = 00000000ef6d8b37
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = ff000000000000ff
!	Mem[00000000100c1408] = 00000020b1000000, %f28 = 00ff780b ff941997
	ldda	[%i3+%o4]0x88,%f28	! %f28 = 00000020 b1000000
!	%l6 = 000000000000004a, imm = 0000000000000e3e, %l4 = 0000000000000000
	addc	%l6,0xe3e,%l4		! %l4 = 0000000000000e88
!	Mem[0000000021800100] = 00ffa456, %l2 = ffff00b4dbe7fe5a
	ldub	[%o3+0x100],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001410] = ff000000, %l0 = 00000000000000b4
	lduwa	[%i0+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030081410] = e2010551, %l1 = ff000000000000ff
	lduba	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000051
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010181400] = 00000000
	stwa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000

p0_label_132:
!	%l2 = 0000000000000000, Mem[0000000010181400] = 00000000
	stwa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
	membar	#Sync			! Added by membar checker (23)
!	%l1 = 0000000000000051, Mem[0000000030181408] = ff000000
	stha	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 00510000
!	%l0 = 00000000ff000000, Mem[0000000030101400] = ffff1997378b6def
	stxa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000ff000000
!	Mem[0000000030001408] = b400ffff, %l4 = 0000000000000e88
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%f14 = b4000000 ad000000, Mem[0000000010141428] = 0b7861b4 efff000f
	std	%f14,[%i5+0x028]	! Mem[0000000010141428] = b4000000 ad000000
!	%l0 = 00000000ff000000, Mem[0000000010181410] = 00000000
	stba	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%f23 = 378b6dff, Mem[0000000030081410] = e2010551
	sta	%f23,[%i2+%o5]0x89	! Mem[0000000030081410] = 378b6dff
!	Mem[0000000010041400] = ff000000, %l6 = 000000000000004a
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010081408] = ffb30020 b1000000
	stda	%l2,[%i2+0x008]%asi	! Mem[0000000010081408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000ff00, %l7 = 0000000000000000
	ldswa	[%i5+%o4]0x80,%l7	! %l7 = 000000000000ff00

p0_label_133:
!	Mem[0000000030041408] = e42e161e, %f22 = 5afee7db
	lda	[%i1+%o4]0x81,%f22	! %f22 = e42e161e
!	Mem[0000000010041400] = 00930000 000000ff, %l0 = ff000000, %l1 = 00000051
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000ff 0000000000930000
!	Mem[00000000300c1408] = ffabefe5 ffff00ff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 00000000ffff00ff 00000000ffabefe5
!	Mem[0000000030141400] = ffffa300, %l5 = 00000000ffabefe5
	lduha	[%i5+%g0]0x81,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030141400] = ffffa3009719ffff, %l2 = 0000000000000000
	ldxa	[%i5+%g0]0x81,%l2	! %l2 = ffffa3009719ffff
!	Mem[0000000030041400] = 00c7b300, %f31 = 32a62ca1
	lda	[%i1+%g0]0x81,%f31	! %f31 = 00c7b300
!	Mem[0000000010181408] = 00ff0000, %l2 = ffffa3009719ffff
	lduba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l3 = 0000000000000000, imm = 0000000000000b92, %l7 = 000000000000ff00
	add	%l3,0xb92,%l7		! %l7 = 0000000000000b92
!	Mem[0000000010181400] = 00000000, %l3 = 0000000000000000
	ldsw	[%i6+%g0],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081420] = 8a7183a3, %l4 = 00000000ffff00ff, %asi = 80
	swapa	[%i2+0x020]%asi,%l4	! %l4 = 000000008a7183a3

p0_label_134:
!	%l3 = 0000000000000000, Mem[0000000030001400] = 000000ffdba1c701
	stxa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l0 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%f24 = 510500e5 1311b893, Mem[00000000300c1408] = ffff00ff ffabefe5
	stda	%f24,[%i3+%o4]0x89	! Mem[00000000300c1408] = 510500e5 1311b893
!	Mem[0000000010101400] = ff000000, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 00000000ff000000
!	%f22 = e42e161e 378b6dff, Mem[00000000100c1410] = dbe7fe5a 0e7e7300
	stda	%f22,[%i3+%o5]0x88	! Mem[00000000100c1410] = e42e161e 378b6dff
!	%l5 = 000000000000ffff, Mem[00000000100c1400] = ffff1997000000c7
	stxa	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000000000ffff
!	%f18 = 00000020 b1000000, %l7 = 0000000000000b92
!	Mem[0000000030101418] = a12ca63201b32f0a
	add	%i4,0x018,%g1
	stda	%f18,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030101418] = a100a63220b32f00
!	%l7 = 0000000000000b92, Mem[0000000030181408] = 00005100
	stha	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000b92
!	%l1 = 0000000000930000, Mem[00000000211c0000] = ff00c8b9
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 0000c8b9
!	Starting 10 instruction Load Burst
!	Mem[0000000010101414] = 378b6def, %l4 = 000000008a7183a3
	ldsba	[%i4+0x017]%asi,%l4	! %l4 = ffffffffffffffef

p0_label_135:
!	Mem[0000000010141408] = 000000ff00ff0000, %f24 = 510500e5 1311b893
	ldda	[%i5+%o4]0x88,%f24	! %f24 = 000000ff 00ff0000
!	Mem[0000000010081400] = ff00f7bf, %f21 = 000000ff
	lda	[%i2+%g0]0x88,%f21	! %f21 = ff00f7bf
!	Mem[0000000010001400] = 00000000 ffffffff, %l4 = ffffffef, %l5 = 0000ffff
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Mem[0000000010001408] = 79ff16e5, %f2  = ff000000
	lda	[%i0+%o4]0x80,%f2 	! %f2 = 79ff16e5
!	Mem[00000000300c1400] = ff000000, %l5 = 0000000000000000
	lduwa	[%i3+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010041400] = ff000000 00009300, %l4 = ffffffff, %l5 = ff000000
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 00000000ff000000 0000000000009300
!	Mem[0000000010041410] = ffff0000e5000551, %l3 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = ffff0000e5000551
!	Mem[0000000010001418] = fb5acdff, %l7 = 0000000000000b92
	ldsb	[%i0+0x01b],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010001410] = ff000000, %l0 = 0000000000000000
	ldsba	[%i0+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = ff000000, %l7 = ffffffff, Mem[0000000030141400] = ffffa300 9719ffff
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = ff000000 ffffffff

p0_label_136:
!	%f24 = 000000ff 00ff0000, Mem[0000000010081400] = ff00f7bf 0000ffff
	stda	%f24,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff 00ff0000
!	%l0 = ffffffffffffffff, Mem[0000000010181410] = 00000000
	stba	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	Mem[0000000030101400] = ff000000, %l0 = ffffffffffffffff
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000ff000000
!	%l2 = 00000000, %l3 = e5000551, Mem[0000000010081408] = 00000000 00000000
	stda	%l2,[%i2+0x008]%asi	! Mem[0000000010081408] = 00000000 e5000551
!	Mem[0000000030181410] = ff000039, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff000039
!	%l3 = ffff0000e5000551, Mem[00000000300c1400] = 000000ff
	stha	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000551
!	%l7 = ffffffffffffffff, Mem[0000000010001410] = ff000000
	stwa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffff
!	Mem[0000000010041402] = ff000000, %l3 = ffff0000e5000551
	ldstub	[%i1+0x002],%l3		! %l3 = 00000000000000ff
!	%f31 = 00c7b300, Mem[00000000300c1410] = 00001282
	sta	%f31,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00c7b300
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %f24 = 000000ff
	lda	[%i2+%g0]0x89,%f24	! %f24 = 00000000

p0_label_137:
!	Mem[0000000010101408] = b1000000, %l5 = 0000000000009300
	lduba	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000b1
!	Mem[0000000010101410] = ffff1997, %l7 = ffffffffffffffff
	ldsba	[%i4+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001408] = 79ff16e5, %l6 = 00000000ff000000
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = 0000000079ff16e5
!	Mem[0000000010141408] = 0000ff00, %f7  = 20000000
	lda	[%i5+%o4]0x80,%f7 	! %f7 = 0000ff00
!	Mem[0000000030041400] = 00c7b300, %l7 = ffffffffffffffff
	ldswa	[%i1+%g0]0x81,%l7	! %l7 = 0000000000c7b300
!	Mem[0000000030041408] = e42e161e, %l2 = 00000000ff000039
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = ffffffffffffe42e
!	Mem[0000000030101410] = ffff0000, %l3 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141400] = 000000ff00000000, %l6 = 0000000079ff16e5
	ldxa	[%i5+%g0]0x80,%l6	! %l6 = 000000ff00000000
!	Mem[0000000010141408] = 0000ff00, %l6 = 000000ff00000000
	lduwa	[%i5+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000ff00, imm = fffffffffffffe2a, %l3 = ffffffffffffffff
	and	%l6,-0x1d6,%l3		! %l3 = 000000000000fe00

p0_label_138:
!	Mem[00000000201c0001] = ffff2191, %l6 = 000000000000ff00
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	%l6 = 000000ff, %l7 = 00c7b300, Mem[0000000010181438] = cf7bff79 8fffba2f
	stda	%l6,[%i6+0x038]%asi	! Mem[0000000010181438] = 000000ff 00c7b300
!	%l4 = 00000000ff000000, Mem[0000000010081410] = e1070a00ffe5d582
	stxa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000ff000000
!	Mem[0000000010181410] = 000000ff, %l0 = 00000000ff000000
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%f18 = 00000020 b1000000, Mem[0000000010101400] = 000000ff 0000ff00
	stda	%f18,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000020 b1000000
!	%l4 = ff000000, %l5 = 000000b1, Mem[0000000010101438] = 000000ff 000000ff
	std	%l4,[%i4+0x038]		! Mem[0000000010101438] = ff000000 000000b1
!	%f26 = 000000ff 00000000, %l5 = 00000000000000b1
!	Mem[0000000030001410] = 0000000000000039
	add	%i0,0x010,%g1
	stda	%f26,[%g1+%l5]ASI_PST32_S ! Mem[0000000030001410] = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l5 = 00000000000000b1
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%f29 = b1000000, Mem[0000000010141400] = 000000ff
	sta	%f29,[%i5+%g0]0x80	! Mem[0000000010141400] = b1000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = b100000000000000, %f6  = 9d000000 0000ff00
	ldda	[%i5+0x000]%asi,%f6 	! %f6  = b1000000 00000000

p0_label_139:
!	Mem[0000000010081400] = 0000ff00, %l3 = 000000000000fe00
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010141410] = ff0000ff, %l7 = 0000000000c7b300
	lduha	[%i5+%o5]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030181408] = 920b0000, %l0 = 00000000000000ff
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = ffffffffffffff92
!	Mem[0000000030141410] = 971994ff, %l1 = 0000000000930000
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = ffffffffffffff97
!	Mem[0000000030141408] = 971994ff0b78ff00, %l3 = 000000000000ff00
	ldxa	[%i5+%o4]0x81,%l3	! %l3 = 971994ff0b78ff00
!	Mem[0000000010001410] = ff000000 ffffffff, %l6 = 000000ff, %l7 = 0000ff00
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 00000000ffffffff 00000000ff000000
!	Mem[0000000030101408] = 000000b120000000, %f22 = e42e161e 378b6dff
	ldda	[%i4+%o4]0x89,%f22	! %f22 = 000000b1 20000000
!	Mem[00000000100c1408] = b1000000, %l3 = 971994ff0b78ff00
	lduba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = fb7d2fff, %l6 = 00000000ffffffff
	lduha	[%i6+%g0]0x89,%l6	! %l6 = 0000000000002fff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ff000000, Mem[0000000030041400] = 00c7b300
	stwa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = ff000000

p0_label_140:
!	Mem[00000000211c0001] = 0000c8b9, %l4 = 00000000ff000000
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101400] = ffffffff, %l7 = 00000000ff000000
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	%l6 = 0000000000002fff, Mem[0000000010101420] = 00000073, %asi = 80
	stha	%l6,[%i4+0x020]%asi	! Mem[0000000010101420] = 2fff0073
!	%l1 = ffffffffffffff97, Mem[0000000030081400] = 00000000
	stba	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000097
!	%l7 = 00000000000000ff, Mem[00000000100c1438] = b4ff780b00000000
	stx	%l7,[%i3+0x038]		! Mem[00000000100c1438] = 00000000000000ff
!	%l1 = ffffffffffffff97, Mem[0000000030081410] = ff6d8b37
	stha	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = ff978b37
!	Mem[0000000010001410] = ffffffff, %l6 = 0000000000002fff
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000201c0000] = ffff2191, %l0 = ffffffffffffff92
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	%l6 = 00000000000000ff, Mem[0000000010101408] = b1000000
	stwa	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1404] = 00000000, %l0 = ffffffffffffffff
	lduw	[%i3+0x004],%l0		! %l0 = 0000000000000000

p0_label_141:
!	Mem[0000000010081430] = e5efffff, %l1 = ffffffffffffff97
	ldsb	[%i2+0x030],%l1		! %l1 = ffffffffffffffe5
!	Mem[0000000010041410] = 510500e50000ffff, %f18 = 00000020 b1000000
	ldda	[%i1+%o5]0x88,%f18	! %f18 = 510500e5 0000ffff
!	Mem[0000000010181418] = 82d5e5ff, %l7 = 00000000000000ff
	ldswa	[%i6+0x018]%asi,%l7	! %l7 = ffffffff82d5e5ff
!	%l7 = ffffffff82d5e5ff, immed = 00000641, %y  = 00000000
	smul	%l7,0x641,%l7		! %l7 = fffffcf13bb35fbf, %y = fffffcf1
!	Mem[00000000300c1400] = 51050000, %f16 = 12847be4
	lda	[%i3+%g0]0x81,%f16	! %f16 = 51050000
!	Mem[0000000010001410] = ffffffff, %l5 = 0000000000000000
	ldsba	[%i0+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001400] = 0000000000000000, %f24 = 00000000 00ff0000
	ldda	[%i0+%g0]0x89,%f24	! %f24 = 00000000 00000000
!	Mem[0000000010181410] = 000000ff, %l1 = ffffffffffffffe5
	lduwa	[%i6+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101408] = 000000b120000000, %l5 = ffffffffffffffff
	ldxa	[%i4+%o4]0x89,%l5	! %l5 = 000000b120000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 20000000, Mem[0000000010101410] = ffff1997 378b6def
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 20000000

p0_label_142:
!	%l3 = 0000000000000000, Mem[0000000030001408] = b400ffff
	stha	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = b4000000
!	%l1 = 00000000000000ff, Mem[0000000010101400] = 000000b1
	stwa	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff
!	%f4  = ff000039 00000000, %l6 = 00000000000000ff
!	Mem[0000000030081438] = d50014bddaba14a9
	add	%i2,0x038,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030081438] = 00000000390000ff
!	%l0 = 0000000000000000, Mem[0000000010081400] = 00ff0000
	stwa	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l7 = fffffcf13bb35fbf, Mem[0000000010041400] = ff00ff0000009300
	stxa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = fffffcf13bb35fbf
!	%l4 = 0000000000000000, Mem[00000000300c1400] = 00000551
	stha	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l5 = 000000b120000000, Mem[0000000010081408] = ff000000
	stha	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	Mem[0000000030041400] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010001418] = fb5acdff, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x018]%asi,%l6	! %l6 = 00000000fb5acdff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffffffff, %l2 = ffffffffffffe42e
	ldswa	[%i0+%o5]0x88,%l2	! %l2 = ffffffffffffffff

p0_label_143:
!	Mem[0000000010081418] = a12ca63201b32f0a, %f18 = 510500e5 0000ffff
	ldd	[%i2+0x018],%f18	! %f18 = a12ca632 01b32f0a
!	Mem[0000000030041400] = 000000ff, %l0 = 0000000000000000
	lduwa	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041410] = ffff1997, %l5 = 000000b120000000
	ldswa	[%i1+%o5]0x81,%l5	! %l5 = ffffffffffff1997
!	Mem[0000000010181410] = 93f3ff48 ff000000, %l6 = fb5acdff, %l7 = 3bb35fbf
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 00000000ff000000 0000000093f3ff48
!	Mem[0000000010081408] = 00000000, %l6 = 00000000ff000000
	ldswa	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = 00ffc8b9, %l0 = 00000000000000ff
	ldsba	[%o2+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = ffff2191, %l0 = 0000000000000000
	ldsb	[%o0+%g0],%l0		! %l0 = ffffffffffffffff
!	%l4 = 0000000000000000, %l7 = 0000000093f3ff48, %l3 = 00000000000000ff
	addc	%l4,%l7,%l3		! %l3 = 0000000093f3ff48
!	Mem[0000000010001410] = ff000000ffffffff, %l6 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l6	! %l6 = ff000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 00ff0000, %l4 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_144:
!	%f11 = fb78c414, %f13 = bc34ce0c, %f22 = 000000b1
	fmuls	%f11,%f13,%f22		! %f22 = 782fb218
!	%l5 = ffffffffffff1997, Mem[0000000010181400] = 00000000
	stba	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 97000000
!	Mem[0000000010081400] = 00000000ff000000, %l2 = ffffffffffffffff, %l6 = ff000000ffffffff
	casxa	[%i2]0x80,%l2,%l6	! %l6 = 00000000ff000000
!	%l1 = 00000000000000ff, Mem[0000000010181410] = 000000ff48fff393
	stxa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000000000ff
!	Mem[0000000010101438] = ff000000000000b1, %l7 = 0000000093f3ff48, %l3 = 0000000093f3ff48
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l7,%l3	! %l3 = ff000000000000b1
!	%l7 = 0000000093f3ff48, Mem[0000000010001408] = fffffff9e516ff79
	stxa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000093f3ff48
!	%f28 = 00000020 b1000000, Mem[0000000010081410] = 00000000 000000ff
	stda	%f28,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000020 b1000000
!	%f28 = 00000020, %f11 = fb78c414
	fcmpes	%fcc1,%f28,%f11		! %fcc1 = 2
!	%l1 = 00000000000000ff, Mem[0000000030001400] = 00000000
	stha	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010101400] = 000000ff 20000000 000000ff ff000000
!	Mem[0000000010101410] = 00000000 20000000 7492c75d fca11aff
!	Mem[0000000010101420] = 2fff0073 7dab064a ff000000 0000ffff
!	Mem[0000000010101430] = 93a3ee7b f8d03bd8 ff000000 000000b1
	ldda	[%i4]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400

p0_label_145:
!	Mem[0000000030041400] = 000000ff, %l1 = 00000000000000ff
	ldswa	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001408] = 48fff393, %l2 = ffffffffffffffff
	ldsba	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000048
!	Mem[0000000010041424] = 658a05fc, %l3 = ff000000000000b1
	ldub	[%i1+0x027],%l3		! %l3 = 00000000000000fc
!	Mem[0000000030041408] = e42e161e 00800000, %l0 = ffffffff, %l1 = 000000ff
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 00000000e42e161e 0000000000800000
!	Mem[0000000030101400] = ffffffff, %l5 = ffffffffffff1997
	lduwa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ffffffff
!	Mem[00000000100c1400] = ffff0000, %l1 = 0000000000800000
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffff0000
!	Mem[0000000030101408] = 00000020, %l5 = 00000000ffffffff
	ldsha	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = ffffffff, %l4 = 0000000000000000
	ldsw	[%i0+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030041408] = e42e161e, %f9  = 658afffc
	lda	[%i1+%o4]0x81,%f9 	! %f9 = e42e161e
!	Starting 10 instruction Store Burst
!	%f6  = b1000000 00000000, Mem[0000000010001400] = ffffffff 00000000
	stda	%f6 ,[%i0+%g0]0x80	! Mem[0000000010001400] = b1000000 00000000

p0_label_146:
!	%l2 = 00000048, %l3 = 000000fc, Mem[0000000010081420] = ffff00ff 658a05fc
	std	%l2,[%i2+0x020]		! Mem[0000000010081420] = 00000048 000000fc
!	Mem[0000000030181410] = 00000000, %l0 = 00000000e42e161e
	swapa	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 00000020 ff000000, %l2 = 00000048, %l3 = 000000fc
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 00000000ff000000 0000000000000020
!	%l1 = ffffffffffff0000, Mem[0000000030041408] = 1e162ee4
	stba	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 1e162e00
!	%f5  = 00000000, Mem[0000000030141410] = 971994ff
	sta	%f5 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Mem[0000000010141410] = ff0000ff, %l2 = 00000000ff000000, %asi = 80
	swapa	[%i5+0x010]%asi,%l2	! %l2 = 00000000ff0000ff
!	%l0 = 0000000000000000, Mem[0000000010081400] = 00000000, %asi = 80
	stwa	%l0,[%i2+0x000]%asi	! Mem[0000000010081400] = 00000000
!	%f12 = ba1a95e5, %f15 = ad000000, %f4  = ff000039 00000000
	fsmuld	%f12,%f15,%f4 		! %f4  = 3cf352bc a0000000
!	%l2 = 00000000ff0000ff, %l7 = 0000000093f3ff48, %l7 = 0000000093f3ff48
	subc	%l2,%l7,%l7		! %l7 = 000000006b0c01b7
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 5afee7dbb4000000, %f2  = 79ff16e5 e2010551
	ldda	[%i0+%o4]0x89,%f2 	! %f2  = 5afee7db b4000000

p0_label_147:
!	Mem[0000000010041410] = 510500e50000ffff, %f6  = b1000000 00000000
	ldda	[%i1+%o5]0x88,%f6 	! %f6  = 510500e5 0000ffff
!	Mem[0000000030041410] = 9719ffff, %l5 = 0000000000000000
	lduha	[%i1+%o5]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010041438] = ffffffe5ffff00b4, %f4  = 3cf352bc a0000000
	ldd	[%i1+0x038],%f4 	! %f4  = ffffffe5 ffff00b4
!	Mem[0000000010041410] = 0000ffff, %f3  = b4000000
	lda	[%i1+%o5]0x88,%f3 	! %f3 = 0000ffff
!	Mem[0000000030181408] = 920b0000, %f7  = 0000ffff
	lda	[%i6+%o4]0x81,%f7 	! %f7 = 920b0000
!	Mem[0000000010001410] = ffffffff, %l1 = ffffffffffff0000
	ldsha	[%i0+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081410] = 378b97ff, %l0 = 0000000000000000
	ldsha	[%i2+%o5]0x89,%l0	! %l0 = ffffffffffff97ff
!	Mem[0000000010181408] = 00ff00000000ff00, %f2  = 5afee7db 0000ffff
	ldda	[%i6+%o4]0x88,%f2 	! %f2  = 00ff0000 0000ff00
!	Mem[00000000100c1410] = 378b6dff, %l5 = 000000000000ffff
	lduba	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, %l3 = 0000000000000020, %l1 = ffffffffffffffff
	sub	%l4,%l3,%l1		! %l1 = ffffffffffffffdf

p0_label_148:
!	%l0 = ffffffffffff97ff, Mem[0000000030081400] = 00000097
	stwa	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = ffff97ff
!	Mem[00000000300c1410] = 00c7b300, %l7 = 000000006b0c01b7
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 0000000000c7b300
!	%l2 = 00000000ff0000ff, Mem[0000000030141408] = ff941997
	stba	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = ff9419ff
!	%l5 = 00000000000000ff, %l1 = ffffffffffffffdf, %l2 = 00000000ff0000ff
	add	%l5,%l1,%l2		! %l2 = 00000000000000de
!	Mem[0000000010081408] = 00000000, %l0 = ffffffffffff97ff, %asi = 80
	swapa	[%i2+0x008]%asi,%l0	! %l0 = 0000000000000000
!	%l1 = ffffffffffffffdf, Mem[00000000100c1400] = 000000000000ffff
	stxa	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffffffffffdf
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000030001408] = b4000000 5afee7db
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff 000000ff
!	%l2 = 00000000000000de, Mem[00000000100c1400] = dfffffff
	stha	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00deffff
!	Mem[0000000010001408] = 48fff393, %l5 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 0000000048fff393
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff000000, %l3 = 0000000000000020
	lduwa	[%i5+%g0]0x81,%l3	! %l3 = 00000000ff000000

p0_label_149:
!	Mem[0000000030141410] = 00000000, %l3 = 00000000ff000000
	lduba	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = b1000000, %l1 = ffffffffffffffdf
	lduha	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 920b0000, %l0 = 0000000000000000
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000092
!	Mem[0000000030001408] = ffffffff, %l1 = 0000000000000000
	ldswa	[%i0+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041408] = 1e162e00, %l0 = 0000000000000092
	ldsba	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = ffffffff, %l1 = ffffffffffffffff
	lduha	[%i0+%o4]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010181414] = 000000ff, %l7 = 0000000000c7b300
	ldsba	[%i6+0x014]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = ffff1997, %l0 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l0	! %l0 = ffffffffffff1997
!	Mem[0000000030181408] = 510501e2 00000b92, %l4 = ffffffff, %l5 = 48fff393
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000b92 00000000510501e2
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000b92, Mem[0000000010041400] = fffffcf1
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 92fffcf1

p0_label_150:
!	%l6 = ff000000, %l7 = 00000000, Mem[0000000010181400] = 97000000 e5000551
	stda	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000000 00000000
!	%l2 = 00000000000000de, Mem[00000000300c1408] = 93b81113
	stha	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00de1113
!	Mem[0000000010081410] = 000000b1, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%f14 = b4000000 ad000000, %l2 = 00000000000000de
!	Mem[0000000030101420] = 80000000b1000000
	add	%i4,0x020,%g1
	stda	%f14,[%g1+%l2]ASI_PST8_S ! Mem[0000000030101420] = b4000000ad000000
!	Mem[0000000010141414] = 000000ff, %l7 = 00000000, %l6 = ff000000
	add	%i5,0x14,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (25)
!	%f6  = 510500e5 920b0000, Mem[0000000010101408] = ff000000 000000ff
	stda	%f6 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 510500e5 920b0000
!	%l3 = 0000000000000000, %l1 = 000000000000ffff, %l7 = 0000000000000000
	addc	%l3,%l1,%l7		! %l7 = 000000000000ffff
!	%l4 = 00000b92, %l5 = 510501e2, Mem[00000000100c1400] = ffffde00 ffffffff
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000b92 510501e2
!	Starting 10 instruction Load Burst
!	%l6 = 00000000000000ff, imm = fffffffffffffde6, %l1 = 000000000000ffff
	andn	%l6,-0x21a,%l1		! %l1 = 0000000000000019

p0_label_151:
!	Mem[0000000010181428] = 000000b120000000, %f24 = 2fff0073 7dab064a
	ldda	[%i6+0x028]%asi,%f24	! %f24 = 000000b1 20000000
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 20000000, %l7 = 000000000000ffff
	ldsba	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001418] = 000000ff, %l1 = 0000000000000019
	lduw	[%i0+0x018],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010001434] = e42e161e, %f15 = ad000000
	lda	[%i0+0x034]%asi,%f15	! %f15 = e42e161e
!	Mem[00000000100c1400] = 00000b92, %f21 = 20000000
	lda	[%i3+%g0]0x88,%f21	! %f21 = 00000b92
!	Mem[0000000030181400] = 00000000fb7d2fff, %l7 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l7	! %l7 = 00000000fb7d2fff
!	Mem[00000000300c1400] = 00000000, %f16 = 000000ff
	lda	[%i3+%g0]0x81,%f16	! %f16 = 00000000
!	Mem[0000000030101408] = 00000020, %l1 = 00000000000000ff
	lduha	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffff1997, Mem[0000000030041410] = ffff1997
	stwa	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = ffff1997

p0_label_152:
!	%l4 = 00000b92, %l5 = 510501e2, Mem[0000000010001410] = ffffffff 000000ff
	stda	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000b92 510501e2
!	%l2 = 00000000000000de, Mem[0000000010001408] = 00000000ff000000
	stxa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000000000de
!	%l6 = 00000000000000ff, Mem[0000000010041400] = bf5fb33bf1fcff92
	stxa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000000000ff
!	Mem[000000001010140b] = 00000b92, %l6 = 00000000000000ff
	ldstub	[%i4+0x00b],%l6		! %l6 = 00000092000000ff
!	%l6 = 0000000000000092, Mem[00000000300c1400] = 00000000
	stha	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000092
!	Mem[0000000010081437] = ffffffff, %l6 = 0000000000000092
	ldstub	[%i2+0x037],%l6		! %l6 = 000000ff000000ff
!	Mem[00000000100c1408] = b1000000, %l4 = 0000000000000b92
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 00000000b1000000
!	%f16 = 00000000, %f4  = ffffffe5, %f16 = 00000000 20000000
	fsmuld	%f16,%f4 ,%f16		! %f16 = fffffffc a0000000
!	Mem[0000000020800040] = 69e1d57f, %l0 = ffffffffffff1997
	ldstub	[%o1+0x040],%l0		! %l0 = 00000069000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 000000ff, %l2 = 00000000000000de
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_153:
!	Mem[0000000030141400] = ff000000, %l5 = 00000000510501e2
	lduwa	[%i5+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010041400] = ff000000, %l6 = 00000000000000ff
	lduha	[%i1+%g0]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010081400] = 00000000, %l2 = 00000000000000ff
	ldsha	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1430] = ffffffffffffefe5, %l6 = 000000000000ff00
	ldxa	[%i3+0x030]%asi,%l6	! %l6 = ffffffffffffefe5
!	Mem[0000000010181400] = 000000ff, %l7 = 00000000fb7d2fff
	ldswa	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = 920b0000, %l0 = 0000000000000069
	ldsha	[%i3+%o4]0x80,%l0	! %l0 = ffffffffffff920b
!	Mem[0000000010101420] = 2fff0073, %l6 = ffffffffffffefe5
	ldsha	[%i4+0x020]%asi,%l6	! %l6 = 0000000000002fff
!	Mem[0000000010041408] = f9cfffffb1000000, %l4 = 00000000b1000000
	ldxa	[%i1+%o4]0x80,%l4	! %l4 = f9cfffffb1000000
!	Mem[00000000100c1400] = 920b0000, %f20 = 00000000
	lda	[%i3+%g0]0x80,%f20	! %f20 = 920b0000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ff000000, Mem[0000000030101408] = 00000020
	stba	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000020

p0_label_154:
!	%f0  = ff2f7dfb, Mem[0000000010081428] = 0000000f
	sta	%f0 ,[%i2+0x028]%asi	! Mem[0000000010081428] = ff2f7dfb
!	%l6 = 0000000000002fff, Mem[0000000010041410] = 0000ffff
	stwa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00002fff
!	Mem[00000000218000c1] = ff13f237, %l0 = ffffffffffff920b
	ldstub	[%o3+0x0c1],%l0		! %l0 = 00000013000000ff
!	%l1 = 0000000000000000, Mem[0000000030041410] = 9719ffff
	stba	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 9719ff00
!	Mem[0000000010081410] = ff0000b1, %l2 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030181408] = 920b0000e2010551, %f26 = ff000000 0000ffff
	ldda	[%i6+%o4]0x81,%f26	! %f26 = 920b0000 e2010551
!	%l0 = 00000013, %l1 = 00000000, Mem[0000000030101400] = ffffffff ff000000
	stda	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000013 00000000
!	%l6 = 0000000000002fff, Mem[00000000300c1410] = b7010c6b
	stwa	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00002fff
!	%f16 = fffffffc a0000000 000000ff ff000000
!	%f20 = 920b0000 00000b92 7492c75d fca11aff
!	%f24 = 000000b1 20000000 920b0000 e2010551
!	%f28 = 93a3ee7b f8d03bd8 ff000000 000000b1
	stda	%f16,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010001400] = b1000000 00000000 de000000 00000000
!	Mem[0000000010001410] = 00000b92 510501e2 000000ff 000000ff
!	Mem[0000000010001420] = 89724a09 7fffffff 0000064a 2fbaa38f
!	Mem[0000000010001430] = ff728cdc e42e161e 954e5ecf 378b6def
	ldda	[%i0]ASI_BLK_PL,%f0	! Block Load from 0000000010001400

p0_label_155:
!	Mem[0000000010181408] = 00ff00000000ff00, %f22 = 7492c75d fca11aff
	ldda	[%i6+0x008]%asi,%f22	! %f22 = 00ff0000 0000ff00
!	Mem[0000000010041414] = e5000551, %l3 = 0000000000000000
	lduw	[%i1+0x014],%l3		! %l3 = 00000000e5000551
!	Mem[0000000010141400] = b1000000, %l7 = 00000000000000ff
	lduwa	[%i5+%g0]0x80,%l7	! %l7 = 00000000b1000000
!	%l3 = 00000000e5000551, %l6 = 0000000000002fff, %l4 = f9cfffffb1000000
	udivx	%l3,%l6,%l4		! %l4 = 000000000004c56e
!	Mem[0000000010101438] = ff000000000000b1, %f22 = 00ff0000 0000ff00
	ldda	[%i4+0x038]%asi,%f22	! %f22 = ff000000 000000b1
!	Mem[0000000010101410] = 920b0000, %l7 = 00000000b1000000
	ldsha	[%i4+%o5]0x80,%l7	! %l7 = ffffffffffff920b
!	Mem[0000000010181400] = 000000ff, %l7 = ffffffffffff920b
	ldsba	[%i6+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101400] = fcffffff, %l6 = 0000000000002fff
	lduha	[%i4+%g0]0x88,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010181410] = 00000000, %l0 = 0000000000000013
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (27)
!	%f24 = 000000b1 20000000, Mem[0000000010001400] = b1000000 00000000
	stda	%f24,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000b1 20000000

p0_label_156:
!	%f25 = 20000000, Mem[0000000030181410] = e42e161e
	sta	%f25,[%i6+%o5]0x81	! Mem[0000000030181410] = 20000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010141408] = 00ff0000 000000ff
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 00000000
!	Mem[0000000010101408] = 000000ff, %l5 = 00000000ff000000
	swapa	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010041400] = ff000000
	stb	%l0,[%i1+%g0]		! Mem[0000000010041400] = 00000000
!	Mem[0000000020800001] = ffff7fd0, %l7 = ffffffffffffffff
	ldstub	[%o1+0x001],%l7		! %l7 = 000000ff000000ff
!	%l3 = 00000000e5000551, Mem[0000000030081400] = ff97ffff
	stba	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 5197ffff
!	%l3 = 00000000e5000551, Mem[000000001004140e] = b1000000, %asi = 80
	stha	%l3,[%i1+0x00e]%asi	! Mem[000000001004140c] = b1000551
!	Mem[0000000010081410] = b10000ff, %l5 = 00000000000000ff
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030041408] = 002e161e, %l2 = 00000000000000ff
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 00000000002e161e
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff000000, %l3 = 00000000e5000551
	ldub	[%i6+0x002],%l3		! %l3 = 0000000000000000

p0_label_157:
!	%l3 = 0000000000000000, immd = 00000000000000b4, %l7 = 00000000000000ff
	udivx	%l3,0x0b4,%l7		! %l7 = 0000000000000000
!	%l2 = 002e161e, %l3 = 00000000, Mem[0000000010181410] = 00000000 ff000000
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 002e161e 00000000
!	Mem[0000000030041410] = 9719ff00, %l0 = 0000000000000000
	lduha	[%i1+%o5]0x89,%l0	! %l0 = 000000000000ff00
!	Mem[00000000100c1418] = 0000000000000000, %l0 = 000000000000ff00
	ldx	[%i3+0x018],%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1408] = 1311de00, %l2 = 00000000002e161e
	ldsha	[%i3+%o4]0x89,%l2	! %l2 = ffffffffffffde00
!	Mem[0000000030001410] = 0000000000000000, %l0 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 691fffff, %f6  = ff000000
	lda	[%i2+%o4]0x81,%f6 	! %f6 = 691fffff
!	Mem[0000000030141408] = ff9419ff, %l1 = 0000000000000000
	lduba	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001410] = 00000b92 510501e2, %l6 = 0000ffff, %l7 = 00000000
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000b92 00000000510501e2
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010001425] = 7fffffff, %asi = 80
	stba	%l3,[%i0+0x025]%asi	! Mem[0000000010001424] = 7f00ffff

p0_label_158:
!	Mem[0000000030141408] = ff9419ff, %l2 = ffffffffffffde00
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000ff9419ff
!	%f6  = 691fffff, Mem[0000000010181408] = 00ff0000
	sta	%f6 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 691fffff
!	%l7 = 00000000510501e2, Mem[0000000010141410] = ff000000
	stha	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 01e20000
!	Mem[0000000010101410] = 00000b92, %l0 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000b92
!	%l5 = 00000000000000ff, Mem[0000000030001400] = ff000000
	stwa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	%l0 = 00000b92, %l1 = 000000ff, Mem[0000000010001400] = b1000000 00000020
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000b92 000000ff
!	Mem[0000000010081439] = ffffffe5, %l0 = 0000000000000b92
	ldstuba	[%i2+0x039]%asi,%l0	! %l0 = 000000ff000000ff
!	Code Fragment 4
p0_fragment_11:
!	%l0 = 00000000000000ff
	setx	0xf4d88bb83e30b8b9,%g7,%l0 ! %l0 = f4d88bb83e30b8b9
!	%l1 = 00000000000000ff
	setx	0xefeb51bfbc094371,%g7,%l1 ! %l1 = efeb51bfbc094371
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f4d88bb83e30b8b9
	setx	0x287bd5a7be38ac52,%g7,%l0 ! %l0 = 287bd5a7be38ac52
!	%l1 = efeb51bfbc094371
	setx	0xbb8aa260464d284a,%g7,%l1 ! %l1 = bb8aa260464d284a
!	%l2 = 00000000ff9419ff, Mem[0000000010041424] = 658a05fc, %asi = 80
	stba	%l2,[%i1+0x024]%asi	! Mem[0000000010041424] = ff8a05fc
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 79ff16e5ffff9751, %f16 = fffffffc a0000000
	ldda	[%i2+%g0]0x89,%f16	! %f16 = 79ff16e5 ffff9751

p0_label_159:
!	Mem[0000000010001400] = 920b0000, %l4 = 000000000004c56e
	ldsha	[%i0+%g0]0x80,%l4	! %l4 = ffffffffffff920b
!	%l7 = 00000000510501e2, %l5 = 00000000000000ff, %l4 = ffffffffffff920b
	sub	%l7,%l5,%l4		! %l4 = 00000000510500e3
!	Mem[0000000010081410] = 00000020b10000ff, %l7 = 00000000510501e2
	ldxa	[%i2+%o5]0x88,%l7	! %l7 = 00000020b10000ff
!	%l3 = 0000000000000000, %l6 = 0000000000000b92, %y  = fffffcf1
	sdiv	%l3,%l6,%l0		! %l0 = ffffffffbc53a993
	mov	%l0,%y			! %y = bc53a993
!	Mem[0000000030101408] = 00000020b1000000, %l4 = 00000000510500e3
	ldxa	[%i4+%o4]0x81,%l4	! %l4 = 00000020b1000000
!	Mem[0000000010001400] = 920b0000, %l1 = bb8aa260464d284a
	ldswa	[%i0+%g0]0x80,%l1	! %l1 = ffffffff920b0000
!	Mem[0000000010181404] = 00000000, %l2 = 00000000ff9419ff
	lduw	[%i6+0x004],%l2		! %l2 = 0000000000000000
!	Mem[0000000030081410] = ff978b37, %l5 = 00000000000000ff
	lduha	[%i2+%o5]0x81,%l5	! %l5 = 000000000000ff97
!	Mem[0000000030001408] = ffffffff, %l7 = 00000020b10000ff
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 378b6dff, %l6 = 0000000000000b92
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 00000000378b6dff

p0_label_160:
!	%l5 = 000000000000ff97, Mem[0000000030081408] = 93b81113ffff1f69
	stxa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000000000ff97
!	Mem[000000001014142c] = ad000000, %l4 = 00000020b1000000, %asi = 80
	swapa	[%i5+0x02c]%asi,%l4	! %l4 = 00000000ad000000
!	%f20 = 920b0000 00000b92, %l4 = 00000000ad000000
!	Mem[0000000010041420] = 8a7183a3ff8a05fc
	add	%i1,0x020,%g1
	stda	%f20,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010041420] = 8a7183a3ff8a05fc
!	%l7 = 00000000000000ff, Mem[0000000030181410] = 20000000
	stwa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff
!	Mem[0000000020800040] = ffe1d57f, %l6 = 00000000378b6dff
	ldstub	[%o1+0x040],%l6		! %l6 = 000000ff000000ff
!	%l2 = 0000000000000000, imm = 00000000000002d2, %l7 = 00000000000000ff
	addc	%l2,0x2d2,%l7		! %l7 = 00000000000002d2
!	%f4  = e2010551 920b0000, Mem[00000000100c1400] = 00000b92 510501e2
	stda	%f4 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = e2010551 920b0000
!	%l7 = 00000000000002d2, Mem[0000000030081408] = 97ff0000
	stha	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 02d20000
!	Mem[0000000010101408] = ff000000, %l6 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 1e162e00, %l3 = 0000000000000000
	lduwa	[%i6+%o5]0x80,%l3	! %l3 = 000000001e162e00

p0_label_161:
!	Mem[00000000100c1410] = 920b0000, %f16 = 79ff16e5
	lda	[%i3+%o5]0x80,%f16	! %f16 = 920b0000
!	Mem[00000000100c1400] = 00000b92, %l1 = ffffffff920b0000
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000b92
!	Mem[0000000010101420] = 000000b1, %l0 = ffffffffbc53a993
	ldsb	[%i4+0x021],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141410] = ff0000000000e201, %f6  = 691fffff ff000000
	ldda	[%i5+%o5]0x88,%f6 	! %f6  = ff000000 0000e201
!	Mem[00000000100c1424] = 00000080, %l6 = 00000000000000ff
	lduw	[%i3+0x024],%l6		! %l6 = 0000000000000080
!	Mem[0000000030141400] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000 00000000, %l0 = 00000000, %l1 = 00000b92
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010181400] = ff00000000000000, %f24 = 000000b1 20000000
	ldda	[%i6+%g0]0x80,%f24	! %f24 = ff000000 00000000
!	Mem[0000000030001408] = ffffffff, %l6 = 0000000000000080
	lduwa	[%i0+%o4]0x89,%l6	! %l6 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030001410] = 00000000
	stba	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000

p0_label_162:
!	Mem[0000000030081410] = ff978b37, %l0 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 00000000ff978b37
!	Mem[0000000030081408] = 02d20000, %l2 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 00000002000000ff
!	%l5 = 000000000000ff97, Mem[0000000010001400] = 00000b92
	stwa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000ff97
!	%l4 = 00000000ad000000, %l7 = 00000000000002d2, %l5 = 000000000000ff97
	xnor	%l4,%l7,%l5		! %l5 = ffffffff52fffd2d
!	%l0 = 00000000ff978b37, Mem[000000001008142c] = fb78c414, %asi = 80
	stba	%l0,[%i2+0x02c]%asi	! Mem[000000001008142c] = 3778c414
!	Mem[0000000010081430] = e5efffffffffffff, %l6 = 00000000ffffffff, %l7 = 00000000000002d2
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = e5efffffffffffff
!	Mem[00000000100c1410] = 920b0000, %l4 = 00000000ad000000
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 00000092000000ff
!	%l6 = 00000000ffffffff, Mem[0000000010041410] = 00002fff
	stba	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00002fff
!	%f8  = ffffff7f, Mem[0000000010081400] = 00000000
	st	%f8 ,[%i2+%g0]		! Mem[0000000010081400] = ffffff7f
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 01e20000, %f31 = 000000b1
	lda	[%i5+%o5]0x80,%f31	! %f31 = 01e20000

p0_label_163:
!	Mem[0000000010001410] = 00000b92, %l1 = 0000000000000000
	lduha	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 92000000, %l7 = e5efffffffffffff
	lduba	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000092
!	Mem[0000000030041410] = ef6d8b379719ff00, %l4 = 0000000000000092
	ldxa	[%i1+%o5]0x89,%l4	! %l4 = ef6d8b379719ff00
!	Mem[0000000030041408] = ff000000, %l0 = 00000000ff978b37
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010081400] = ffffff7f ff000000 ffff97ff e5000551
!	Mem[0000000010081410] = ff0000b1 20000000 a12ca632 01b32f0a
!	Mem[0000000010081420] = 00000048 000000fc ff2f7dfb 3778c414
!	Mem[0000000010081430] = e5efffff ffffffff ffffffe5 ffff00b4
	ldda	[%i2]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010081400
!	Mem[0000000030001400] = 000000ff, %l4 = ef6d8b379719ff00
	ldsha	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = 00ff780b00000000, %l3 = 000000001e162e00
	ldxa	[%i5+%o5]0x89,%l3	! %l3 = 00ff780b00000000
!	Mem[0000000010101400] = fffffffc, %l2 = 0000000000000002
	ldswa	[%i4+%g0]0x80,%l2	! %l2 = fffffffffffffffc
!	Mem[0000000010141408] = 00000000 00000000, %l4 = 00000000, %l5 = 52fffd2d
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = fffffffffffffffc, Mem[0000000021800100] = 00ffa456, %asi = 80
	stba	%l2,[%o3+0x100]%asi	! Mem[0000000021800100] = fcffa456

p0_label_164:
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010101408] = ff000000 ff000000
	stda	%l0,[%i4+0x008]%asi	! Mem[0000000010101408] = 00000000 00000000
!	Mem[0000000010081400] = 7fffffff, %l6 = 00000000ffffffff
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	%l7 = 0000000000000092, Mem[0000000010181408] = 691fffff
	stwa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000092
!	%l6 = 00000000000000ff, Mem[0000000010041400] = 00000000
	stwa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	%l7 = 0000000000000092, immd = fffffffffffff258, %l4 = 0000000000000000
	sdivx	%l7,-0xda8,%l4		! %l4 = 0000000000000000
!	%f30 = ff000000 01e20000, Mem[0000000010101410] = 00000000 920b0000
	stda	%f30,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000000 01e20000
!	%l1 = 0000000000000000, Mem[0000000030001410] = 00000000
	stba	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l4 = 0000000000000000, Mem[0000000030141408] = ffffde00
	stba	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffde00
!	%l1 = 0000000000000000, Mem[0000000030041410] = 9719ff00
	stba	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 9719ff00
!	Starting 10 instruction Load Burst
!	%l3 = 00ff780b00000000, imm = fffffffffffff70a, %l0 = 0000000000000000
	and	%l3,-0x8f6,%l0		! %l0 = 00ff780b00000000

p0_label_165:
!	Mem[0000000010081410] = ff0000b1, %l3 = 00ff780b00000000
	lduwa	[%i2+%o5]0x80,%l3	! %l3 = 00000000ff0000b1
!	Mem[0000000030001408] = ffffffff, %l7 = 0000000000000092
	ldsha	[%i0+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1408] = 00000b92, %l5 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l5	! %l5 = ffffffffffffff92
!	%f24 = ff000000, %f23 = 000000b1, %f18 = 000000ff ff000000
	fsmuld	%f24,%f23,%f18		! %l0 = 00ff780b00000022, Unfinished, %fsr = 1600000400
!	Mem[0000000030101408] = 20000000, %f29 = f8d03bd8
	lda	[%i4+%o4]0x89,%f29	! %f29 = 20000000
!	Mem[00000000300c1410] = 00002fff, %l3 = 00000000ff0000b1
	ldsha	[%i3+%o5]0x89,%l3	! %l3 = 0000000000002fff
!	Mem[0000000010001410] = 920b0000, %l3 = 0000000000002fff
	ldsba	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c141c] = 00000000, %l2 = fffffffffffffffc
	ldsha	[%i3+0x01c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 920b0000, %l4 = 0000000000000000
	ldsba	[%i3+%o4]0x80,%l4	! %l4 = ffffffffffffff92
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (29)
!	%f30 = ff000000 01e20000, Mem[0000000010081430] = e5efffff ffffffff
	stda	%f30,[%i2+0x030]%asi	! Mem[0000000010081430] = ff000000 01e20000

p0_label_166:
!	%l5 = ffffffffffffff92, Mem[00000000201c0000] = ffff2191, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = ff922191
!	Mem[0000000030141410] = 00000000, %l7 = ffffffffffffffff
	swapa	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041428] = 00000000, %l4 = ffffffffffffff92, %asi = 80
	swapa	[%i1+0x028]%asi,%l4	! %l4 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000021800140] = cfff8e22
	stb	%l7,[%o3+0x140]		! Mem[0000000021800140] = 00ff8e22
!	%l1 = 0000000000000000, Mem[0000000010181408] = 00ff000092000000
	stxa	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000000000000
!	Mem[0000000030101410] = 0000ffff, %l6 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[00000000100c1400] = 920b0000, %l1 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 00000000920b0000
!	%l2 = 0000000000000000, Mem[0000000010081410] = b10000ff
	stba	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = b1000000
!	Mem[0000000010141408] = 00000000, %l6 = 000000000000ffff
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0000000013000000, %f22 = ff000000 000000b1
	ldda	[%i4+%g0]0x89,%f22	! %f22 = 00000000 13000000

p0_label_167:
!	Mem[0000000030141410] = ffffffff, %f2  = 510500e5
	lda	[%i5+%o5]0x89,%f2 	! %f2 = ffffffff
!	Mem[0000000010001410] = 920b0000, %l0 = 00ff780b00000022
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = ffffffff920b0000
!	%l2 = 0000000000000000, %l4 = 0000000000000000, %l0 = ffffffff920b0000
	and	%l2,%l4,%l0		! %l0 = 0000000000000000
!	Mem[0000000021800040] = f2ff5509, %l6 = 0000000000000000
	ldsb	[%o3+0x041],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000100c1408] = 920b0000 20000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 00000000920b0000 0000000020000000
!	Mem[0000000010001428] = 0000064a, %l0 = 0000000000000000
	lduha	[%i0+0x02a]%asi,%l0	! %l0 = 000000000000064a
!	Mem[0000000020800040] = ffe1d57f, %l7 = 0000000000000000
	ldub	[%o1+0x041],%l7		! %l7 = 00000000000000e1
!	Mem[0000000030041408] = 00008000ff0000ff, %l6 = ffffffffffffffff
	ldxa	[%i1+%o4]0x89,%l6	! %l6 = 00008000ff0000ff
!	Mem[0000000030141400] = 000000ff, %l1 = 00000000920b0000
	ldsba	[%i5+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000020000000, Mem[00000000300c1400] = ba881e2800000092
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000020000000

p0_label_168:
!	%l1 = ffffffffffffffff, Mem[0000000010101400] = fcffffff
	stha	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = fcffffff
!	%f12 = ffffffff, %f1  = 7fffffff
	fcmpes	%fcc3,%f12,%f1 		! %fcc3 = 3
!	Mem[0000000030141410] = ffffffff, %l3 = 0000000020000000
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000ffffffff
!	%f22 = 00000000, Mem[0000000030141410] = 20000000
	sta	%f22,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l1 = ffffffffffffffff, Mem[0000000010081410] = b1000000
	stba	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = b10000ff
!	Mem[0000000010101434] = f8d03bd8, %l5 = ffffff92, %l7 = 000000e1
	add	%i4,0x34,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 00000000f8d03bd8
!	Mem[0000000010041410] = 00002fff, %l5 = ffffffffffffff92
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010081410] = b10000ff, %l3 = 00000000ffffffff
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[000000001010142c] = e2010551, %l0 = 000000000000064a
	swap	[%i4+0x02c],%l0		! %l0 = 00000000e2010551
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = 0019ffff01d194f8, %f16 = 920b0000 ffff9751
	ldda	[%i5+0x020]%asi,%f16	! %f16 = 0019ffff 01d194f8

p0_label_169:
!	Mem[0000000010181408] = 00000000 00000000, %l2 = 920b0000, %l3 = 000000ff
	ldda	[%i6+0x008]%asi,%l2	! %l2 = 0000000000000000 0000000000000000
!	%l0 = 00000000e2010551, immed = fffff945, %y  = bc53a993
	umul	%l0,-0x6bb,%l0		! %l0 = e200ff5fe32137d5, %y = e200ff5f
!	Mem[0000000030001410] = 00000000, %l1 = ffffffffffffffff
	ldsha	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = de000000, %l2 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l2	! %l2 = 000000000000de00
!	Mem[0000000030141410] = 00ff780b 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000ff780b
!	Mem[00000000100c1408] = 920b0000 20000000, %l0 = e32137d5, %l1 = 00000000
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 00000000920b0000 0000000020000000
!	Mem[0000000030141408] = 00deffff0b78ff00, %f22 = 00000000 13000000
	ldda	[%i5+%o4]0x81,%f22	! %f22 = 00deffff 0b78ff00
!	Mem[0000000020800040] = ffe1d57f, %l2 = 000000000000de00
	ldsba	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffffffff
!	Code Fragment 3
p0_fragment_12:
!	%l0 = 00000000920b0000
	setx	0xcf1d07f7c898c0c6,%g7,%l0 ! %l0 = cf1d07f7c898c0c6
!	%l1 = 0000000020000000
	setx	0xe4ccbf5fd8d47cd7,%g7,%l1 ! %l1 = e4ccbf5fd8d47cd7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cf1d07f7c898c0c6
	setx	0x2d9022705f99429a,%g7,%l0 ! %l0 = 2d9022705f99429a
!	%l1 = e4ccbf5fd8d47cd7
	setx	0x6578fc9042696fb0,%g7,%l1 ! %l1 = 6578fc9042696fb0
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = ffffde00, %l7 = 00000000f8d03bd8
	swapa	[%i5+%o4]0x89,%l7	! %l7 = 00000000ffffde00

p0_label_170:
!	%f4  = 00000020 b10000ff, Mem[00000000100c1410] = ff0b0000 1e162ee4
	stda	%f4 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000020 b10000ff
!	Mem[0000000010181400] = ff000000, %l0 = 2d9022705f99429a
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[00000000201c0000] = ff922191
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 00ff2191
!	%f18 = 000000ff, Mem[0000000010001408] = de000000
	sta	%f18,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff
!	Mem[0000000030141410] = 00000000, %l2 = ffffffffffffffff
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%f18 = 000000ff ff000000, Mem[0000000030181400] = fb7d2fff 00000000
	stda	%f18,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff ff000000
!	%f26 = 920b0000 e2010551, %l6 = 00008000ff0000ff
!	Mem[00000000300c1408] = 00de1113e5000551
	add	%i3,0x008,%g1
	stda	%f26,[%g1+%l6]ASI_PST8_S ! Mem[00000000300c1408] = 920b0000e2010551
!	%l6 = ff0000ff, %l7 = ffffde00, Mem[0000000030081400] = ffff9751 79ff16e5
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = ff0000ff ffffde00
!	%f12 = ffffffff ffffefe5, Mem[0000000010181430] = 00001282 000000ff
	stda	%f12,[%i6+0x030]%asi	! Mem[0000000010181430] = ffffffff ffffefe5
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff2f0000, %l6 = 00008000ff0000ff
	ldswa	[%i1+%o5]0x80,%l6	! %l6 = ffffffffff2f0000

p0_label_171:
!	%f12 = ffffffff ffffefe5, %l3 = 0000000000000000
!	Mem[0000000030141408] = d83bd0f80b78ff00
	add	%i5,0x008,%g1
	stda	%f12,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030141408] = d83bd0f80b78ff00
!	Mem[00000000100c1408] = 920b0000, %l6 = ffffffffff2f0000
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = ffffffffffff920b
!	%l1 = 6578fc9042696fb0, %l7 = 00000000ffffde00, %y  = e200ff5f
	sdiv	%l1,%l7,%l2		! %l2 = 000000007fffffff
	mov	%l0,%y			! %y = 000000ff
!	Mem[00000000100c1430] = ffffffff, %l5 = 0000000000ff780b
	lduwa	[%i3+0x030]%asi,%l5	! %l5 = 00000000ffffffff
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010041400] = 000000ff 00000000 f9cfffff b1000551
!	Mem[0000000010041410] = ff2f0000 e5000551 ef6d8b37 ff8b6def
!	Mem[0000000010041420] = 8a7183a3 ff8a05fc ffffff92 0b78ffb4
!	Mem[0000000010041430] = 00000000 ffffffff ffffffe5 ffff00b4
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[0000000010101438] = ff000000000000b1, %l0 = 00000000000000ff
	ldx	[%i4+0x038],%l0		! %l0 = ff000000000000b1
!	Mem[00000000211c0000] = 00ffc8b9, %l6 = ffffffffffff920b
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141408] = f8d03bd8, %l4 = 0000000000000000
	lduba	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000d8
!	Mem[00000000300c1410] = ff2f0000e5efabff, %f26 = 920b0000 e2010551
	ldda	[%i3+%o5]0x81,%f26	! %f26 = ff2f0000 e5efabff
!	Starting 10 instruction Store Burst
!	%f28 = 93a3ee7b, %f19 = ff000000, %f18 = 000000ff
	fadds	%f28,%f19,%f18		! %f18 = ff000000

p0_label_172:
!	%l0 = ff000000000000b1, Mem[0000000010181400] = ff00000000000000, %asi = 80
	stxa	%l0,[%i6+0x000]%asi	! Mem[0000000010181400] = ff000000000000b1
!	%l1 = 6578fc9042696fb0, Mem[0000000010181410] = 002e161e
	stba	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 002e16b0
!	%l1 = 6578fc9042696fb0, Mem[0000000030041408] = ff0000ff
	stba	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = ff0000b0
!	%l0 = ff000000000000b1, Mem[0000000010181400] = 000000ff
	stwa	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000b1
!	%f22 = 00deffff 0b78ff00, Mem[0000000010001410] = 920b0000 e2010551
	stda	%f22,[%i0+%o5]0x88	! Mem[0000000010001410] = 00deffff 0b78ff00
!	%l6 = 000000ff, %l7 = ffffde00, Mem[0000000010081418] = a12ca632 01b32f0a
	stda	%l6,[%i2+0x018]%asi	! Mem[0000000010081418] = 000000ff ffffde00
!	%l3 = 0000000000000000, Mem[0000000010141410] = 01e20000000000ff, %asi = 80
	stxa	%l3,[%i5+0x010]%asi	! Mem[0000000010141410] = 0000000000000000
!	%f20 = 920b0000 00000b92, Mem[0000000030181408] = 00000b92 510501e2
	stda	%f20,[%i6+%o4]0x89	! Mem[0000000030181408] = 920b0000 00000b92
!	Mem[0000000030101408] = 00000020, %l4 = 00000000000000d8
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffff97ff, %l7 = 00000000ffffde00
	ldsw	[%i2+%o4],%l7		! %l7 = ffffffffffff97ff

p0_label_173:
!	Mem[0000000030181410] = 000000ff, %f23 = 0b78ff00
	lda	[%i6+%o5]0x81,%f23	! %f23 = 000000ff
!	Mem[0000000010141408] = 000000ff, %l2 = 000000007fffffff
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101438] = ff000000, %l2 = ffffffffffffffff
	ldsba	[%i4+0x03b]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = e201055100000000, %f28 = 93a3ee7b 20000000
	ldda	[%i3+%g0]0x88,%f28	! %f28 = e2010551 00000000
!	Mem[0000000010141400] = 000000b1, %l5 = 00000000ffffffff
	lduha	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000b1
!	Mem[0000000030181410] = 000000ff00000000, %f22 = 00deffff 000000ff
	ldda	[%i6+%o5]0x81,%f22	! %f22 = 000000ff 00000000
!	Mem[00000000300c1400] = 20000000, %l5 = 00000000000000b1
	ldsba	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = 920b0000, %l5 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000092
!	Mem[0000000030041408] = b00000ff, %l0 = ff000000000000b1
	lduba	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000b0
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 7fffffff, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 000000ff000000ff

p0_label_174:
!	Mem[0000000010081410] = ff0000b1 20000000, %l6 = 000000ff, %l7 = ffff97ff
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 00000000ff0000b1 0000000020000000
!	%l4 = 000000ff, %l5 = 00000092, Mem[0000000010001418] = 000000ff 000000ff
	std	%l4,[%i0+0x018]		! Mem[0000000010001418] = 000000ff 00000092
!	%l2 = 0000000000000000, imm = 0000000000000715, %l3 = 0000000000000000
	xor	%l2,0x715,%l3		! %l3 = 0000000000000715
	membar	#Sync			! Added by membar checker (31)
!	%f22 = 000000ff 00000000, Mem[0000000010041408] = f9cfffff b1000551
	stda	%f22,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff 00000000
!	%f16 = 0019ffff 01d194f8, Mem[0000000030081400] = ff0000ff 00deffff
	stda	%f16,[%i2+%g0]0x81	! Mem[0000000030081400] = 0019ffff 01d194f8
!	Mem[0000000030181410] = 000000ff, %l3 = 0000000000000715
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041404] = 00000000, %l5 = 0000000000000092, %asi = 80
	swapa	[%i1+0x004]%asi,%l5	! %l5 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000030041408] = ff0000b0
	stha	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = ff0000ff
!	%f20 = 920b0000, %f16 = 0019ffff, %f29 = 00000000
	fdivs	%f20,%f16,%f29		! %l0 = 00000000000000d2, Unfinished, %fsr = 3600000400
!	Starting 10 instruction Load Burst
!	%l4 = 00000000000000ff, immd = fffffffffffffdf5, %l5 = 0000000000000000
	sdivx	%l4,-0x20b,%l5		! %l5 = 0000000000000000

p0_label_175:
!	Mem[0000000010181410] = 002e16b0, %l3 = 00000000000000ff
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = 00000000000016b0
!	Mem[0000000010181408] = 00000000, %l4 = 00000000000000ff
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010001408] = 00000000ff000000
	stxa	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000000000000
!	Mem[0000000030041400] = ff000000dba1c701, %f18 = ff000000 ff000000
	ldda	[%i1+%g0]0x81,%f18	! %f18 = ff000000 dba1c701
!	Mem[0000000030001408] = ffffffff, %l0 = 00000000000000d2
	lduha	[%i0+%o4]0x89,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010181438] = 000000ff, %f22 = 000000ff
	lda	[%i6+0x038]%asi,%f22	! %f22 = 000000ff
!	Mem[0000000030041410] = 00ff1997, %l1 = 6578fc9042696fb0
	lduba	[%i1+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%f0  = 000000ff, %f24 = ff000000, %f17 = 01d194f8
	fdivs	%f0 ,%f24,%f17		! %f17 = 80000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010141400] = b1000000
	stba	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000

p0_label_176:
!	%l5 = 0000000000000000, Mem[0000000010181418] = 82d5e5ff, %asi = 80
	stwa	%l5,[%i6+0x018]%asi	! Mem[0000000010181418] = 00000000
!	%l5 = 0000000000000000, %l6 = 00000000ff0000b1, %l7 = 0000000020000000
	sdivx	%l5,%l6,%l7		! %l7 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010101400] = fffffffc
	stha	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000fffc
!	Mem[0000000030181410] = 00000715, %l1 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000715
!	%f16 = 0019ffff 80000000, Mem[0000000010041420] = 8a7183a3 ff8a05fc
	std	%f16,[%i1+0x020]	! Mem[0000000010041420] = 0019ffff 80000000
!	%f0  = 000000ff 00000000 f9cfffff b1000551
!	%f4  = ff2f0000 e5000551 ef6d8b37 ff8b6def
!	%f8  = 8a7183a3 ff8a05fc ffffff92 0b78ffb4
!	%f12 = 00000000 ffffffff ffffffe5 ffff00b4
	stda	%f0,[%i4]ASI_COMMIT_S	! Block Store to 0000000030101400
!	%l6 = 00000000ff0000b1, immed = 00000c7c, %y  = 000000ff
	sdiv	%l6,0xc7c,%l7		! %l7 = 0000000014815c98
	mov	%l0,%y			! %y = 0000ffff
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000030101408] = f9cfffff, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000f9cfffff
!	Mem[0000000030181410] = 00000000, %l6 = 00000000ff0000b1
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l2	! %l2 = 00000000000000ff

p0_label_177:
!	Mem[0000000010081400] = ffffff7f, %l7 = 0000000014815c98
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffffff7f
!	Mem[0000000030041410] = ef6d8b379719ff00, %f30 = ff000000 01e20000
	ldda	[%i1+%o5]0x89,%f30	! %f30 = ef6d8b37 9719ff00
!	Mem[00000000100c1408] = 920b0000, %l3 = 00000000000016b0
	ldsba	[%i3+%o4]0x80,%l3	! %l3 = ffffffffffffff92
!	Mem[0000000010141400] = 0000000000000000, %f28 = e2010551 00000000
	ldda	[%i5+%g0]0x88,%f28	! %f28 = 00000000 00000000
!	Mem[0000000030141410] = ffffffff0b78ff00, %f18 = ff000000 dba1c701
	ldda	[%i5+%o5]0x81,%f18	! %f18 = ffffffff 0b78ff00
!	Mem[0000000030001410] = 0000000000000000, %f14 = ffffffe5 ffff00b4
	ldda	[%i0+%o5]0x89,%f14	! %f14 = 00000000 00000000
!	Mem[0000000010041408] = 000000ff, %l6 = 0000000000000000
	ldsba	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 01c7a1db000000ff, %f0  = 000000ff 00000000
	ldda	[%i1+%g0]0x89,%f0 	! %f0  = 01c7a1db 000000ff
!	Mem[0000000010181408] = 000000ff00000000, %l7 = ffffffffffffff7f
	ldxa	[%i6+0x008]%asi,%l7	! %l7 = 000000ff00000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, %l1 = 0000000000000715, %l6 = 0000000000000000
	orn	%l2,%l1,%l6		! %l6 = fffffffffffff8ff

p0_label_178:
!	%f30 = ef6d8b37, Mem[0000000030181400] = ff0000ff
	sta	%f30,[%i6+%g0]0x89	! Mem[0000000030181400] = ef6d8b37
!	Mem[0000000010101424] = 20000000, %l4 = 00000000f9cfffff
	ldsha	[%i4+0x024]%asi,%l4	! %l4 = 0000000000002000
!	Mem[00000000100c1413] = 00000020, %l0 = 000000000000ffff
	ldstub	[%i3+0x013],%l0		! %l0 = 00000020000000ff
!	%l0 = 0000000000000020, %l1 = 0000000000000715, %y  = 0000ffff
	umul	%l0,%l1,%l2		! %l2 = 000000000000e2a0, %y = 00000000
!	%l0 = 0000000000000020, Mem[00000000300c1410] = 00002fff
	stba	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00002f20
!	Mem[0000000010081410] = b10000ff, %l0 = 0000000000000020
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l6 = fffff8ff, %l7 = 00000000, Mem[0000000030101410] = 00002fff 510500e5
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = fffff8ff 00000000
!	Mem[000000001008143f] = ffff00b4, %l3 = ffffffffffffff92
	ldstub	[%i2+0x03f],%l3		! %l3 = 000000b4000000ff
!	Mem[0000000010041408] = ff000000, %l6 = fffffffffffff8ff
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff2f0000, %l5 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l5	! %l5 = 000000000000ff2f

p0_label_179:
!	Mem[0000000010081408] = ffff97ff e5000551, %l4 = 00002000, %l5 = 0000ff2f
	ldda	[%i2+%o4]0x80,%l4	! %l4 = 00000000ffff97ff 00000000e5000551
!	Mem[0000000030141400] = ff000000, %f29 = 00000000
	lda	[%i5+%g0]0x81,%f29	! %f29 = ff000000
!	Mem[0000000030081400] = 0019ffff, %l4 = 00000000ffff97ff
	ldswa	[%i2+%g0]0x81,%l4	! %l4 = 000000000019ffff
!	Mem[0000000030041408] = ff0000ff, %f6  = ef6d8b37
	lda	[%i1+%o4]0x89,%f6 	! %f6 = ff0000ff
!	Mem[0000000010001410] = 00ff780b ffffde00, %l2 = 0000e2a0, %l3 = 000000b4
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 0000000000ff780b 00000000ffffde00
!	Mem[0000000010101404] = a0000000, %l6 = 0000000000000000
	ldsha	[%i4+0x004]%asi,%l6	! %l6 = ffffffffffffa000
!	Mem[0000000030081400] = 0019ffff, %l6 = ffffffffffffa000
	ldsba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = fffff8ff, %l2 = 0000000000ff780b
	ldsha	[%i4+%o5]0x89,%l2	! %l2 = fffffffffffff8ff
!	Mem[0000000010001400] = 000000ff 0000ff97, %l0 = 000000ff, %l1 = 00000715
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 000000000000ff97 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = ff000000, %l4 = 000000000019ffff
	swapa	[%i4+%g0]0x89,%l4	! %l4 = 00000000ff000000

p0_label_180:
!	%l2 = fffff8ff, %l3 = ffffde00, Mem[0000000030081400] = 0019ffff 01d194f8
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = fffff8ff ffffde00
!	Mem[0000000030141410] = ffffffff, %l2 = fffffffffffff8ff
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000ffffffff
!	%l6 = 0000000000000000, Mem[0000000030101410] = fffff8ff
	stwa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l3 = 00000000ffffde00, Mem[00000000100c1410] = ff000000
	stha	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff00de00
!	%l7 = 000000ff00000000, Mem[0000000010041408] = ff0000ff
	stw	%l7,[%i1+%o4]		! Mem[0000000010041408] = 00000000
!	%l7 = 000000ff00000000, Mem[0000000010001410] = 0b78ff00
	stwa	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[0000000010001400] = 0000ff97, %l3 = 00000000ffffde00
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 00000097000000ff
!	Mem[0000000010141428] = b4000000, %l2 = ffffffff, %l3 = 00000097
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 00000000b4000000
!	%l0 = 000000000000ff97, Mem[00000000100c1408] = 920b0000
	stba	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 970b0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000020 b10000ff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 00000000b10000ff 0000000000000020

p0_label_181:
!	Mem[00000000201c0000] = 00ff2191, %l1 = 00000000000000ff
	ldsba	[%o0+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ff2191, %l0 = 000000000000ff97
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = 00000000ffffde00, %f10 = ffffff92 0b78ffb4
	ldda	[%i0+%o5]0x80,%f10	! %f10 = 00000000 ffffde00
!	Mem[000000001018142c] = 20000000, %l2 = 00000000ffffffff
	lduh	[%i6+0x02e],%l2		! %l2 = 0000000000000000
!	Mem[0000000010101408] = 0000000000000000, %f22 = 000000ff 00000000
	ldda	[%i4+%o4]0x88,%f22	! %f22 = 00000000 00000000
!	Mem[0000000030101410] = 00000000 00000000, %l2 = 00000000, %l3 = b4000000
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010081400] = ffffff7fff000000, %l0 = 0000000000000000
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = ffffff7fff000000
!	Mem[0000000010081400] = ffffff7f, %l5 = 00000000e5000551
	ldswa	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffffff7f
!	Mem[0000000030141408] = f8d03bd8, %l0 = ffffff7fff000000
	lduba	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000d8
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 000000ff, %l5 = ffffffffffffff7f
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ff

p0_label_182:
!	%l2 = 0000000000000000, Mem[00000000100c1408] = 00000b97
	stba	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000b00
!	%l1 = ffffffffffffffff, Mem[00000000201c0000] = 00ff2191, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff2191
!	Mem[0000000030141400] = ff000000, %l0 = 00000000000000d8
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030001400] = 000000ff, %l6 = 00000000b10000ff
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%l4 = 00000000ff000000, %l7 = 0000000000000020, %l5 = 00000000000000ff
	addc	%l4,%l7,%l5		! %l5 = 00000000ff000020
!	%f28 = 00000000 ff000000, %l2 = 0000000000000000
!	Mem[0000000030141428] = a04e5cfefc2d5b3d
	add	%i5,0x028,%g1
	stda	%f28,[%g1+%l2]ASI_PST8_S ! Mem[0000000030141428] = a04e5cfefc2d5b3d
!	%l4 = 00000000ff000000, Mem[0000000010181408] = 000000ff
	stwa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000000
!	Mem[0000000030141400] = 000000d8, %l0 = 00000000ff000000
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 00000000000000d8
!	Mem[0000000030101400] = 0019ffff, %l6 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 000000000019ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff2191, %l4 = 00000000ff000000
	ldsh	[%o0+%g0],%l4		! %l4 = ffffffffffffffff

p0_label_183:
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000030041400] = 7fffffff dba1c701 ff0000ff 00800000
!	Mem[0000000030041410] = 00ff1997 378b6def 5afee7db ffffff00
!	Mem[0000000030041420] = 510500e5 1311b893 000000b4 fb5acd6b
!	Mem[0000000030041430] = b4000000 e5000551 0a2fb301 dad8f819
	ldda	[%i1]ASI_BLK_S,%f0	! Block Load from 0000000030041400
!	%l0 = 00000000000000d8, %l3 = 0000000000000000, %y  = 00000000
	umul	%l0,%l3,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[0000000030141400] = ff000000, %l7 = 0000000000000020
	ldswa	[%i5+%g0]0x81,%l7	! %l7 = ffffffffff000000
!	Code Fragment 3
p0_fragment_13:
!	%l0 = 00000000000000d8
	setx	0xbb78f12804a8a44e,%g7,%l0 ! %l0 = bb78f12804a8a44e
!	%l1 = ffffffffffffffff
	setx	0xd388a7a7cd787f24,%g7,%l1 ! %l1 = d388a7a7cd787f24
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = bb78f12804a8a44e
	setx	0x670a9557cb16fda8,%g7,%l0 ! %l0 = 670a9557cb16fda8
!	%l1 = d388a7a7cd787f24
	setx	0x42d3faf78af47301,%g7,%l1 ! %l1 = 42d3faf78af47301
!	Mem[0000000010001408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 510501e200000b92, %l1 = 42d3faf78af47301
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = 510501e200000b92
!	Mem[0000000030001400] = ff0000ff 00000000 ffffffff ff000000
!	Mem[0000000030001410] = 00000000 00000000 901b85da 3bb43509
!	Mem[0000000030001420] = a49bdccb f60e80fa 34b566da c82b0702
!	Mem[0000000030001430] = 52fcd8d1 734e063e d52d968b 1443ff53
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000010001408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l0 = 670a9557cb16fda8
	lduw	[%i5+%o5],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 000000000019ffff, %l5 = 00000000ff000020, %l6 = 000000000019ffff
	and	%l6,%l5,%l6		! %l6 = 0000000000000020

p0_label_184:
!	%l2 = 0000000000000000, Mem[0000000010141408] = 00000000000000ff
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
	membar	#Sync			! Added by membar checker (34)
!	%f6  = 5afee7db ffffff00, Mem[0000000030001400] = ff0000ff 00000000
	stda	%f6 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 5afee7db ffffff00
!	%f10 = 000000b4 fb5acd6b, Mem[0000000010041418] = ef6d8b37 ff8b6def
	std	%f10,[%i1+0x018]	! Mem[0000000010041418] = 000000b4 fb5acd6b
!	%f28 = 52fcd8d1 734e063e, Mem[0000000030141408] = f8d03bd8 00ff780b
	stda	%f28,[%i5+%o4]0x89	! Mem[0000000030141408] = 52fcd8d1 734e063e
!	%f4  = 00ff1997 378b6def, Mem[0000000030101400] = 00000000 00000000
	stda	%f4 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 00ff1997 378b6def
!	%f18 = ffffffff, %f29 = 734e063e, %f13 = e5000551
	fsubs	%f18,%f29,%f13		! %f13 = ffffffff
!	%l5 = 00000000ff000020, Mem[0000000010141404] = 00000000, %asi = 80
	stwa	%l5,[%i5+0x004]%asi	! Mem[0000000010141404] = ff000020
!	Mem[0000000010041435] = ffffffff, %l0 = 0000000000000000
	ldstub	[%i1+0x035],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000010181408] = ff000000, %l1 = 510501e200000b92
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 002e16b0, %l3 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l3	! %l3 = 00000000000016b0

p0_label_185:
!	Mem[0000000010101434] = f8d03bd8, %f10 = 000000b4
	lda	[%i4+0x034]%asi,%f10	! %f10 = f8d03bd8
!	Mem[0000000030181408] = 920b000000000b92, %l5 = 00000000ff000020
	ldxa	[%i6+%o4]0x81,%l5	! %l5 = 920b000000000b92
!	Mem[00000000100c1438] = 00000000, %l0 = 00000000000000ff
	ldsba	[%i3+0x03b]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800000] = efddb958, %l5 = 920b000000000b92
	ldsba	[%o3+0x001]%asi,%l5	! %l5 = ffffffffffffffdd
!	Mem[0000000030101400] = 378b6def, %l5 = ffffffffffffffdd
	ldswa	[%i4+%g0]0x89,%l5	! %l5 = 00000000378b6def
!	Mem[0000000010001408] = 0000000000000000, %f10 = f8d03bd8 fb5acd6b
	ldda	[%i0+%o4]0x88,%f10	! %f10 = 00000000 00000000
!	Mem[0000000010041408] = 00000000, %l6 = 0000000000000020
	ldsba	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Code Fragment 3
p0_fragment_14:
!	%l0 = 0000000000000000
	setx	0xdccb0effd9479b1a,%g7,%l0 ! %l0 = dccb0effd9479b1a
!	%l1 = 00000000ff000000
	setx	0xcff409583aa2e69d,%g7,%l1 ! %l1 = cff409583aa2e69d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dccb0effd9479b1a
	setx	0x2eef1f47ff11a7e5,%g7,%l0 ! %l0 = 2eef1f47ff11a7e5
!	%l1 = cff409583aa2e69d
	setx	0x64c7bec860cc87af,%g7,%l1 ! %l1 = 64c7bec860cc87af
!	Mem[0000000010181418] = 00000000, %l7 = ffffffffff000000
	lduba	[%i6+0x01b]%asi,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 920b0000, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 00000092000000ff

p0_label_186:
!	%l1 = 64c7bec860cc87af, Mem[0000000010001410] = 00000000
	stba	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = af000000
!	Mem[0000000030181400] = 378b6def, %l5 = 00000000378b6def
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 00000037000000ff
!	Mem[0000000010081400] = ffffff7f, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ffffff7f
!	%l2 = 0000000000000092, Mem[00000000211c0000] = 00ffc8b9, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0092c8b9
!	Mem[00000000300c1410] = 00002f20, %l7 = 00000000ffffff7f
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 00000020000000ff
!	%l0 = ff11a7e5, %l1 = 60cc87af, Mem[0000000030081410] = 00000000 b4000000
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = ff11a7e5 60cc87af
!	%f26 = 34b566da c82b0702, Mem[0000000010181410] = 002e16b0 00000000
	stda	%f26,[%i6+%o5]0x88	! Mem[0000000010181410] = 34b566da c82b0702
!	%l6 = 00000000, %l7 = 00000020, Mem[0000000030141400] = 000000ff ffffffff
	stda	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 00000020
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = 000000ff ffffde00, %l0 = ff11a7e5, %l1 = 60cc87af
	ldd	[%i2+0x018],%l0		! %l0 = 00000000000000ff 00000000ffffde00

p0_label_187:
!	Mem[0000000030081400] = fff8ffff, %f21 = 00000000
	lda	[%i2+%g0]0x89,%f21	! %f21 = fff8ffff
!	Code Fragment 3
p0_fragment_15:
!	%l0 = 00000000000000ff
	setx	0xc81c9ca816ea0214,%g7,%l0 ! %l0 = c81c9ca816ea0214
!	%l1 = 00000000ffffde00
	setx	0x48ab4657df19fae4,%g7,%l1 ! %l1 = 48ab4657df19fae4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c81c9ca816ea0214
	setx	0x0b800487e44f346f,%g7,%l0 ! %l0 = 0b800487e44f346f
!	%l1 = 48ab4657df19fae4
	setx	0xa3187d57a79f2ef5,%g7,%l1 ! %l1 = a3187d57a79f2ef5
!	Mem[0000000030181400] = ff8b6def, %l3 = 00000000000016b0
	ldsba	[%i6+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	%l2 = 0000000000000092, imm = fffffffffffff496, %l3 = ffffffffffffffff
	and	%l2,-0xb6a,%l3		! %l3 = 0000000000000092
!	Mem[00000000300c1408] = 00000b92, %l3 = 0000000000000092
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000b92
!	Mem[0000000030081410] = e5a711ff af87cc60, %l2 = 00000092, %l3 = 00000b92
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000e5a711ff 00000000af87cc60
!	Mem[00000000300c1408] = 510501e200000b92, %f30 = d52d968b 1443ff53
	ldda	[%i3+%o4]0x89,%f30	! %f30 = 510501e2 00000b92
!	Mem[00000000100c1410] = 00de00ff, %l0 = 0b800487e44f346f
	lduba	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = b1000000, %l7 = 0000000000000020
	lduwa	[%i6+0x000]%asi,%l7	! %l7 = 00000000b1000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[000000001014140c] = 00000000
	sth	%l6,[%i5+0x00c]		! Mem[000000001014140c] = 00000000

p0_label_188:
!	%l6 = 00000000, %l7 = b1000000, Mem[0000000010101408] = 00000000 00000000
	stda	%l6,[%i4+0x008]%asi	! Mem[0000000010101408] = 00000000 b1000000
!	Mem[0000000010041410] = 00002fff, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 0000000000002fff
!	%f12 = b4000000, Mem[0000000030001410] = 00000000
	sta	%f12,[%i0+%o5]0x81	! Mem[0000000030001410] = b4000000
!	Mem[0000000010041408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l1 = a3187d57a79f2ef5
	ldstuba	[%i5+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f14 = 0a2fb301 dad8f819, Mem[0000000010041410] = 00000000 510500e5
	stda	%f14,[%i1+%o5]0x88	! Mem[0000000010041410] = 0a2fb301 dad8f819
!	%l7 = 00000000b1000000, Mem[00000000211c0000] = 0092c8b9
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 0000c8b9
!	Mem[0000000030081400] = fffff8ff, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000fffff8ff
!	%f10 = 00000000 00000000, Mem[0000000030001408] = ffffffff ff000000
	stda	%f10,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000, %l4 = 0000000000002fff
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_189:
!	Mem[0000000030001400] = 00ffffffdbe7fe5a, %l4 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l4	! %l4 = 00ffffffdbe7fe5a
!	Mem[0000000030041410] = ef6d8b379719ff00, %f12 = b4000000 ffffffff
	ldda	[%i1+%o5]0x89,%f12	! %f12 = ef6d8b37 9719ff00
!	Mem[0000000010081400] = 000000ff 00000000, %l2 = e5a711ff, %l3 = af87cc60
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[000000001018140c] = 00000000, %l1 = 0000000000000000
	lduw	[%i6+0x00c],%l1		! %l1 = 0000000000000000
!	Mem[0000000010101410] = 0000e201000000ff, %l3 = 00000000000000ff
	ldxa	[%i4+%o5]0x80,%l3	! %l3 = 0000e201000000ff
!	Mem[000000001014143c] = d63e8b28, %f3  = 00800000
	ld	[%i5+0x03c],%f3 	! %f3 = d63e8b28
!	Mem[00000000218000c0] = fffff237, %l2 = 0000000000000000
	ldsba	[%o3+0x0c1]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041400] = 7fffffff, %l5 = 0000000000000037
	lduwa	[%i1+%g0]0x81,%l5	! %l5 = 000000007fffffff
!	Mem[0000000030181410] = 00000000ff0000b1, %l6 = 00000000fffff8ff
	ldxa	[%i6+%o5]0x89,%l6	! %l6 = 00000000ff0000b1
!	Starting 10 instruction Store Burst
!	%l6 = ff0000b1, %l7 = b1000000, Mem[0000000030141408] = 3e064e73 d1d8fc52
	stda	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = ff0000b1 b1000000

p0_label_190:
!	%l4 = dbe7fe5a, %l5 = 7fffffff, Mem[0000000030081408] = ffd20000 00000000
	stda	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = dbe7fe5a 7fffffff
!	%l6 = ff0000b1, %l7 = b1000000, Mem[0000000010141410] = ff000000 00000000
	std	%l6,[%i5+%o5]		! Mem[0000000010141410] = ff0000b1 b1000000
!	%l6 = ff0000b1, %l7 = b1000000, Mem[0000000010101410] = 0000e201 000000ff
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = ff0000b1 b1000000
!	%l0 = 00000000, %l1 = 00000000, Mem[00000000300c1410] = ff2f0000 e5efabff
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 00000000
!	Mem[0000000010141408] = 00000000, %l5 = 000000007fffffff
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%f20 = 00000000, Mem[00000000100c1400] = 00000000
	sta	%f20,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Mem[0000000010041420] = 0019ffff80000000, %l1 = 0000000000000000, %l7 = 00000000b1000000
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 0019ffff80000000
!	Mem[00000000100c1426] = 00000080, %l4 = 00ffffffdbe7fe5a
	ldstub	[%i3+0x026],%l4		! %l4 = 00000000000000ff
!	Code Fragment 3
p0_fragment_16:
!	%l0 = 0000000000000000
	setx	0x31783ca86635b944,%g7,%l0 ! %l0 = 31783ca86635b944
!	%l1 = 0000000000000000
	setx	0xfc90ac685993a413,%g7,%l1 ! %l1 = fc90ac685993a413
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 31783ca86635b944
	setx	0x97bbab9002ebf410,%g7,%l0 ! %l0 = 97bbab9002ebf410
!	%l1 = fc90ac685993a413
	setx	0x498190906173c049,%g7,%l1 ! %l1 = 498190906173c049
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ffe1d57f, %l5 = 0000000000000000
	lduha	[%o1+0x040]%asi,%l5	! %l5 = 000000000000ffe1

p0_label_191:
!	Mem[0000000010141400] = 00000000, %l2 = ffffffffffffffff
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181428] = 000000b1 20000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i6+0x028]%asi,%l2	! %l2 = 00000000000000b1 0000000020000000
!	Mem[0000000030141410] = fffff8ff0b78ff00, %l1 = 498190906173c049
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = fffff8ff0b78ff00
!	Mem[00000000211c0000] = 0000c8b9, %l0 = 97bbab9002ebf410
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081420] = 00000048000000fc, %f16 = ff0000ff 00000000
	ldda	[%i2+0x020]%asi,%f16	! %f16 = 00000048 000000fc
!	Mem[0000000030041400] = ffffff7f, %l2 = 00000000000000b1
	lduwa	[%i1+%g0]0x89,%l2	! %l2 = 00000000ffffff7f
!	Mem[0000000030141408] = 000000b1b10000ff, %f4  = 00ff1997 378b6def
	ldda	[%i5+%o4]0x89,%f4 	! %f4  = 000000b1 b10000ff
!	Mem[0000000030041410] = 00ff1997, %l3 = 0000000020000000
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = 0000000000ff1997
!	Mem[0000000010181400] = b1000000, %l2 = 00000000ffffff7f
	lduwa	[%i6+0x000]%asi,%l2	! %l2 = 00000000b1000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 000000ff, %l1 = fffff8ff0b78ff00
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff

p0_label_192:
!	Mem[0000000030181400] = ff8b6def, %l2 = 00000000b1000000
	swapa	[%i6+%g0]0x81,%l2	! %l2 = 00000000ff8b6def
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010041408] = 000000ff 00000000
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 000000ff
!	Mem[0000000010001438] = 954e5ecf378b6def, %l5 = 000000000000ffe1, %l5 = 000000000000ffe1
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = 954e5ecf378b6def
!	%f28 = 52fcd8d1 734e063e, %l4 = 0000000000000000
!	Mem[0000000010041430] = 00000000ffffffff
	add	%i1,0x030,%g1
	stda	%f28,[%g1+%l4]ASI_PST16_P ! Mem[0000000010041430] = 00000000ffffffff
!	%f30 = 510501e2 00000b92, Mem[0000000030081408] = dbe7fe5a 7fffffff
	stda	%f30,[%i2+%o4]0x81	! Mem[0000000030081408] = 510501e2 00000b92
!	%l6 = 00000000ff0000b1, Mem[0000000010101400] = 0000fffca0000000
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000ff0000b1
!	%l2 = 00000000ff8b6def, Mem[0000000030081410] = ff11a7e5
	stha	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = ff116def
!	Mem[0000000030041408] = ff0000ff, %l7 = 0019ffff80000000
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 00000000ff0000ff
!	%f23 = 3bb43509, Mem[0000000030081408] = 510501e2
	sta	%f23,[%i2+%o4]0x81	! Mem[0000000030081408] = 3bb43509
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ef6d8b37, %l1 = 00000000000000ff
	lduba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000ef

p0_label_193:
!	%f20 = 00000000, %f0  = 7fffffff, %f9  = 1311b893
	fmuls	%f20,%f0 ,%f9 		! %f9  = 7fffffff
!	Mem[0000000030081408] = 3bb43509 00000b92, %l6 = ff0000b1, %l7 = ff0000ff
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 000000003bb43509 0000000000000b92
!	Randomly selected nop
	nop
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000ff1997
	lduwa	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = ffffff00, %l2 = 00000000ff8b6def
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010141408] = 0b78ff00, %l6 = 000000003bb43509
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041438] = ffffffe5ffff00b4, %l6 = 0000000000000000
	ldx	[%i1+0x038],%l6		! %l6 = ffffffe5ffff00b4
!	Mem[00000000201c0000] = ffff2191, %l2 = 000000000000ff00
	ldsb	[%o0+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[00000000211c0000] = 0000c8b9, %l4 = 0000000000000000
	lduh	[%o2+%g0],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ef, Mem[00000000100c1408] = 000b0000
	stha	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ef0000

p0_label_194:
!	Mem[0000000030041410] = 00ff1997, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l4	! %l4 = 0000000000ff1997
!	Mem[0000000020800040] = ffe1d57f, %l3 = 0000000000000000
	ldstub	[%o1+0x040],%l3		! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000030041400] = 7fffffff
	stha	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 00ffffff
!	%f4  = 000000b1 b10000ff, Mem[00000000100c1438] = 00000000 000000ff
	stda	%f4 ,[%i3+0x038]%asi	! Mem[00000000100c1438] = 000000b1 b10000ff
!	%l2 = ffffffffffffffff, Mem[0000000030081410] = ef6d11ff
	stba	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = ff6d11ff
!	Mem[00000000100c1400] = 00000000, %l4 = 0000000000ff1997
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l5 = 954e5ecf378b6def, Mem[0000000010081430] = ff000000, %asi = 80
	stwa	%l5,[%i2+0x030]%asi	! Mem[0000000010081430] = 378b6def
!	%f16 = 00000048 000000fc, Mem[00000000300c1400] = 20000000 00000000
	stda	%f16,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000048 000000fc
!	%l2 = ffffffff, %l3 = 000000ff, Mem[00000000100c1428] = 14c478fb 0f000000
	stda	%l2,[%i3+0x028]%asi	! Mem[00000000100c1428] = ffffffff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 00000048, %l6 = ffffffe5ffff00b4
	lduh	[%i2+0x020],%l6		! %l6 = 0000000000000000

p0_label_195:
!	%f5  = b10000ff, %f2  = ff0000ff
	fsqrts	%f5 ,%f2 		! %f2  = 7fffffff
!	Mem[0000000010141410] = 000000b1b10000ff, %f20 = 00000000 fff8ffff
	ldda	[%i5+%o5]0x88,%f20	! %f20 = 000000b1 b10000ff
!	Mem[0000000030141408] = b10000ff, %l0 = 0000000000000000
	lduba	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141410] = 000000b1 b10000ff, %l4 = 00000000, %l5 = 378b6def
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 00000000b10000ff 00000000000000b1
!	Mem[0000000020800000] = ffff7fd0, %l2 = ffffffffffffffff
	ldsha	[%o1+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101410] = 000000b1b10000ff, %f24 = a49bdccb f60e80fa
	ldda	[%i4+%o5]0x88,%f24	! %f24 = 000000b1 b10000ff
!	%l4 = 00000000b10000ff, imm = fffffffffffffb07, %l7 = 0000000000000b92
	addc	%l4,-0x4f9,%l7		! %l7 = 00000000b0fffc06
!	Mem[0000000010041400] = 000000ff, %f8  = 510500e5
	lda	[%i1+%g0]0x80,%f8 	! %f8 = 000000ff
!	Mem[0000000030041410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000b0fffc06, Mem[0000000020800000] = ffff7fd0
	stb	%l7,[%o1+%g0]		! Mem[0000000020800000] = 06ff7fd0

p0_label_196:
!	Mem[0000000030081400] = 00000000, %l0 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%f28 = 52fcd8d1, Mem[0000000010141408] = 0b78ff00
	sta	%f28,[%i5+%o4]0x88	! Mem[0000000010141408] = 52fcd8d1
!	%l0 = 0000000000000000, Mem[0000000030141400] = 00000000
	stwa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Mem[00000000100c1400] = ff000000, %l5 = 00000000000000b1
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[00000000100c1400] = 000000b1, %l5 = 00000000ff000000
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000b1
!	Mem[00000000100c1400] = ff000000, %l7 = 00000000b0fffc06
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	%f0  = 7fffffff dba1c701 7fffffff d63e8b28
!	%f4  = 000000b1 b10000ff 5afee7db ffffff00
!	%f8  = 000000ff 7fffffff 00000000 00000000
!	%f12 = ef6d8b37 9719ff00 0a2fb301 dad8f819
	stda	%f0,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
!	%l6 = 0000000000000000, Mem[0000000010181400] = b1000000000000b1
	stxa	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l5 = 00000000000000b1
	swapa	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = fffff7bb d63e8b28, %l2 = ffffffff, %l3 = 000000ff
	ldda	[%i5+0x038]%asi,%l2	! %l2 = 00000000fffff7bb 00000000d63e8b28

p0_label_197:
!	Mem[0000000010141410] = ff0000b1, %l3 = 00000000d63e8b28
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = ffffffffff0000b1
!	Mem[0000000010081410] = b10000ff, %l3 = ffffffffff0000b1
	ldsha	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = 02072bc8, %l2 = 00000000fffff7bb
	ldswa	[%i6+%o5]0x80,%l2	! %l2 = 0000000002072bc8
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000b10000ff
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010101408] = 288b3ed6ffffff7f, %f18 = ffffffff ff000000
	ldda	[%i4+%o4]0x80,%f18	! %f18 = 288b3ed6 ffffff7f
!	Mem[00000000100c1400] = 000000ff, %l0 = 0000000000000000
	ldswa	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 0a2fb301 dad8f819, %l2 = 02072bc8, %l3 = 000000ff
	ldda	[%i1+%o5]0x88,%l2	! %l2 = 00000000dad8f819 000000000a2fb301
!	Mem[0000000010101408] = 288b3ed6, %f6  = 5afee7db
	lda	[%i4+%o4]0x80,%f6 	! %f6 = 288b3ed6
!	Starting 10 instruction Store Burst
!	%l3 = 000000000a2fb301, Mem[00000000211c0000] = 0000c8b9, %asi = 80
	stba	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0100c8b9

p0_label_198:
!	Mem[0000000030041410] = 00000000, %l6 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010001432] = ff728cdc
	stb	%l4,[%i0+0x032]		! Mem[0000000010001430] = ff7200dc
!	Mem[0000000010181428] = 000000b120000000, %l5 = 0000000000000000, %l7 = 0000000000000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = 000000b120000000
!	Mem[000000001018143c] = 00c7b300, %l1 = 00000000000000ef
	swap	[%i6+0x03c],%l1		! %l1 = 0000000000c7b300
!	%l6 = 00000000, %l7 = 20000000, Mem[0000000030141408] = b10000ff 000000b1
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 20000000
!	%l6 = 00000000, %l7 = 20000000, Mem[00000000300c1408] = 920b0000 e2010551
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 20000000
!	%f8  = 000000ff 7fffffff, %l4 = 0000000000000000
!	Mem[0000000010101438] = 19f8d8da01b32f0a
	add	%i4,0x038,%g1
	stda	%f8,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010101438] = 19f8d8da01b32f0a
!	Mem[0000000010101410] = ff0000b1, %l5 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 00000000ff0000b1
!	Mem[0000000030081400] = ff000000, %l5 = 00000000ff0000b1
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ffe1d57f, %l1 = 0000000000c7b300
	ldsba	[%o1+0x041]%asi,%l1	! %l1 = ffffffffffffffe1

p0_label_199:
!	Mem[0000000030081410] = ff116dff, %l0 = 00000000000000ff
	ldsha	[%i2+%o5]0x89,%l0	! %l0 = 0000000000006dff
!	Mem[0000000010101400] = dba1c701, %l1 = ffffffffffffffe1
	ldswa	[%i4+%g0]0x88,%l1	! %l1 = ffffffffdba1c701
!	Mem[0000000010001408] = 00000000 00000000, %l6 = 00000000, %l7 = 20000000
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030101408] = b1000000 b1000551, %l0 = 00006dff, %l1 = dba1c701
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 00000000b1000000 00000000b1000551
!	Mem[0000000010001410] = 000000af, %l2 = 00000000dad8f819
	lduba	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000af
!	Mem[0000000030101400] = 00ff1997378b6def, %l0 = 00000000b1000000
	ldxa	[%i4+%g0]0x89,%l0	! %l0 = 00ff1997378b6def
!	Mem[0000000030141410] = fffff8ff, %l3 = 000000000a2fb301
	lduba	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l2 = 00000000000000af
	lduba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = ff0000b1, %l4 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f20 = 000000b1 b10000ff, %l0 = 00ff1997378b6def
!	Mem[0000000010001408] = 0000000000000000
	add	%i0,0x008,%g1
	stda	%f20,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010001408] = ff0000b1b1000000

p0_label_200:
!	%f28 = 52fcd8d1 734e063e, %l6 = 0000000000000000
!	Mem[0000000030041418] = 5afee7dbffffff00
	add	%i1,0x018,%g1
	stda	%f28,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030041418] = 5afee7dbffffff00
!	%l6 = 0000000000000000, Mem[0000000010001400] = ffff0000
	stha	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Mem[0000000010141430] = 73428349, %l0 = 00ff1997378b6def
	swap	[%i5+0x030],%l0		! %l0 = 0000000073428349
!	Mem[00000000100c1408] = 00ef0000, %l5 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000021800080] = 74ff2d54, %l5 = 0000000000000000
	ldstuba	[%o3+0x080]%asi,%l5	! %l5 = 00000074000000ff
!	Mem[0000000010181418] = 00000000, %l1 = 00000000b1000551
	ldstub	[%i6+0x018],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010001420] = 89724a09, %l4 = 000000ff, %l1 = 00000000
	add	%i0,0x20,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 0000000089724a09
!	%l1 = 0000000089724a09, %l1 = 0000000089724a09, %l5 = 0000000000000074
	add	%l1,%l1,%l5		! %l5 = 0000000112e49412
!	%f19 = ffffff7f, Mem[0000000030141408] = 00000000
	sta	%f19,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffff7f
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 288b3ed6 ffffff7f, %l4 = 000000ff, %l5 = 12e49412
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 00000000288b3ed6 00000000ffffff7f

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	add	%l1,0x3e8,%l2
	fmuls	%f8,%f25,%f15
	or	%l0,%l4,%l1
	nop
	fmuls	%f19,%f9,%f16
	stw	%l6,[%i3+0x014]
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000073428349
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000089724a09
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000288b3ed6
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000ffffff7f
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
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
	cmp	%l0,%l1			! %f0  should be 7fffffff dba1c701
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 7fffffff d63e8b28
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 000000b1 b10000ff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 288b3ed6 ffffff00
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 000000ff 7fffffff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be ef6d8b37 9719ff00
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 0a2fb301 dad8f819
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000048 000000fc
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 288b3ed6 ffffff7f
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 000000b1 b10000ff
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 901b85da 3bb43509
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 000000b1 b10000ff
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 34b566da c82b0702
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 52fcd8d1 734e063e
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 510501e2 00000b92
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
	subc	%l1,-0xcbc,%l0
	andn	%l0,0x475,%l5
	subc	%l4,0x12b,%l0
	done

p0_trap1o:
	subc	%l1,-0xcbc,%l0
	andn	%l0,0x475,%l5
	subc	%l4,0x12b,%l0
	done


p0_trap2e:
	addc	%l5,0x7fd,%l0
	addc	%l6,%l7,%l7
	xor	%l4,-0xdde,%l5
	sub	%l1,-0x922,%l2
	fsubs	%f9 ,%f11,%f2 
	fadds	%f8 ,%f8 ,%f6 
	smul	%l6,0x73b,%l6
	done

p0_trap2o:
	addc	%l5,0x7fd,%l0
	addc	%l6,%l7,%l7
	xor	%l4,-0xdde,%l5
	sub	%l1,-0x922,%l2
	fsubs	%f9 ,%f11,%f2 
	fadds	%f8 ,%f8 ,%f6 
	smul	%l6,0x73b,%l6
	done


p0_trap3e:
	subc	%l6,%l7,%l0
	sub	%l7,0x329,%l0
	addc	%l3,0xa3b,%l2
	xor	%l2,-0x7d7,%l2
	add	%l4,%l1,%l3
	done

p0_trap3o:
	subc	%l6,%l7,%l0
	sub	%l7,0x329,%l0
	addc	%l3,0xa3b,%l2
	xor	%l2,-0x7d7,%l2
	add	%l4,%l1,%l3
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
	ldx	[%g1+0x000],%l0		! %l0 = 761aa9dec9e64c60
	ldx	[%g1+0x008],%l1		! %l1 = 5aab6f46a376f165
	ldx	[%g1+0x010],%l2		! %l2 = b6c082f272a1b344
	ldx	[%g1+0x018],%l3		! %l3 = a28d71900b8ec4b0
	ldx	[%g1+0x020],%l4		! %l4 = 2f2cf2c28f35cba1
	ldx	[%g1+0x028],%l5		! %l5 = 90edc9905530e475
	ldx	[%g1+0x030],%l6		! %l6 = ab97f624c47227b7
	ldx	[%g1+0x038],%l7		! %l7 = a702287a5ab9110c

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
	subc	%l0,-0x738,%l4
	std	%f10,[%i2+0x008]	! Mem[0000000010081408]
	lduh	[%i5+0x008],%l1		! Mem[0000000010141408]
	smul	%l7,-0xf57,%l1
	fdtos	%f4 ,%f8 
	mulx	%l7,-0x949,%l0
	lduw	[%i3+0x014],%l7		! Mem[00000000100c1414]
	jmpl	%o7,%g0
	add	%l1,%l1,%l3
p0_near_0_he:
	addc	%l2,-0x9f1,%l7
	sdivx	%l3,0x902,%l6
	umul	%l3,%l4,%l2
	jmpl	%o7,%g0
	xnor	%l0,-0xe4e,%l1
near0_b2b_h:
	fdivs	%f19,%f29,%f29
	add	%l0,%l4,%l0
	jmpl	%o7,%g0
	umul	%l1,%l4,%l3
near0_b2b_l:
	fsqrts	%f9 ,%f5 
	mulx	%l0,%l7,%l4
	jmpl	%o7,%g0
	xor	%l7,%l1,%l5
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	fsubs	%f12,%f4 ,%f9 
	jmpl	%o7,%g0
	fmuls	%f10,%f6 ,%f2 
p0_near_1_he:
	xnor	%l4,%l3,%l6
	fsubs	%f16,%f23,%f21
	add	%l5,%l4,%l3
	andn	%l5,0x6f5,%l1
	sub	%l0,%l7,%l4
	jmpl	%o7,%g0
	or	%l5,-0x040,%l0
near1_b2b_h:
	mulx	%l4,%l7,%l3
	fdivs	%f30,%f24,%f23
	smul	%l4,-0xd39,%l4
	fmuls	%f19,%f31,%f30
	addc	%l4,-0x593,%l7
	jmpl	%o7,%g0
	fmuls	%f25,%f25,%f19
near1_b2b_l:
	addc	%l5,%l0,%l3
	mulx	%l3,0xf66,%l0
	xor	%l3,%l7,%l4
	orn	%l7,%l5,%l4
	xor	%l3,0x7f4,%l5
	jmpl	%o7,%g0
	subc	%l2,0x7c7,%l7
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	jmpl	%o7,%g0
	smul	%l7,%l3,%l1
	jmpl	%o7,%g0
	nop
p0_near_2_he:
	fmuls	%f30,%f24,%f17
	sdivx	%l6,-0x11a,%l4
	jmpl	%o7,%g0
	smul	%l2,%l1,%l4
near2_b2b_h:
	jmpl	%o7,%g0
	addc	%l4,-0xba4,%l0
	jmpl	%o7,%g0
	nop
near2_b2b_l:
	jmpl	%o7,%g0
	addc	%l1,%l5,%l6
	jmpl	%o7,%g0
	nop
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	subc	%l6,0x62a,%l2
	orn	%l1,0xfce,%l3
	addc	%l7,%l3,%l4
	fcmps	%fcc2,%f5 ,%f12
	fadds	%f15,%f3 ,%f7 
	jmpl	%o7,%g0
	fcmps	%fcc2,%f15,%f11
p0_near_3_he:
	addc	%l1,0xff1,%l6
	jmpl	%o7,%g0
	std	%f30,[%i3+0x030]	! Mem[00000000100c1430]
near3_b2b_h:
	and	%l0,0x79e,%l4
	addc	%l7,0xf79,%l1
	mulx	%l6,%l1,%l5
	and	%l1,%l4,%l1
	fsqrts	%f26,%f31
	fsubs	%f30,%f17,%f31
	fdivs	%f22,%f28,%f26
	jmpl	%o7,%g0
	fcmps	%fcc2,%f31,%f30
near3_b2b_l:
	subc	%l1,-0x752,%l3
	fsqrts	%f12,%f9 
	add	%l5,-0x72e,%l6
	fsqrts	%f6 ,%f0 
	orn	%l4,-0x614,%l7
	subc	%l7,0x17b,%l6
	or	%l2,0xb7a,%l1
	jmpl	%o7,%g0
	sub	%l1,%l4,%l5
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	orn	%l6,0x511,%l7
	ldx	[%i3+0x018],%l3		! Mem[00000000100c1418]
	and	%l7,-0xe66,%l3
	xnor	%l1,0x4a4,%l2
	andn	%l0,%l6,%l6
	jmpl	%o7,%g0
	add	%l4,%l2,%l4
p0_far_0_lem:
	orn	%l6,0x511,%l7
	membar	#Sync
	ldx	[%i3+0x018],%l3		! Mem[00000000100c1418]
	and	%l7,-0xe66,%l3
	xnor	%l1,0x4a4,%l2
	andn	%l0,%l6,%l6
	jmpl	%o7,%g0
	add	%l4,%l2,%l4
p0_far_0_he:
	fmuls	%f19,%f29,%f28
	subc	%l4,0x10c,%l6
	fdivs	%f19,%f19,%f16
	or	%l2,-0xef8,%l5
	fdivs	%f28,%f30,%f18
	or	%l1,%l5,%l3
	jmpl	%o7,%g0
	xor	%l1,0xb5f,%l0
p0_far_0_hem:
	fmuls	%f19,%f29,%f28
	subc	%l4,0x10c,%l6
	fdivs	%f19,%f19,%f16
	or	%l2,-0xef8,%l5
	fdivs	%f28,%f30,%f18
	or	%l1,%l5,%l3
	jmpl	%o7,%g0
	xor	%l1,0xb5f,%l0
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	fadds	%f22,%f31,%f21
	orn	%l0,-0xdfa,%l3
	umul	%l6,0xdd2,%l3
	sub	%l7,%l1,%l1
	jmpl	%o7,%g0
	addc	%l4,0x156,%l1
far0_b2b_l:
	fadds	%f6 ,%f9 ,%f4 
	smul	%l1,0xe3b,%l2
	xor	%l2,%l0,%l1
	fsubs	%f12,%f14,%f13
	jmpl	%o7,%g0
	sub	%l4,%l2,%l7
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	mulx	%l2,%l4,%l2
	jmpl	%o7,%g0
	fsqrts	%f6 ,%f15
p0_far_1_lem:
	mulx	%l2,%l4,%l2
	jmpl	%o7,%g0
	fsqrts	%f6 ,%f15
p0_far_1_he:
	smul	%l4,%l0,%l5
	jmpl	%o7,%g0
	subc	%l0,-0x93f,%l0
p0_far_1_hem:
	smul	%l4,%l0,%l5
	jmpl	%o7,%g0
	subc	%l0,-0x93f,%l0
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	fdivs	%f26,%f27,%f17
	fcmps	%fcc3,%f25,%f30
	orn	%l6,0x12c,%l1
	jmpl	%o7,%g0
	andn	%l7,%l6,%l3
far1_b2b_l:
	xor	%l3,0x250,%l3
	fadds	%f1 ,%f3 ,%f14
	xor	%l5,-0xd03,%l6
	jmpl	%o7,%g0
	udivx	%l5,0xd14,%l5
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	udivx	%l2,%l5,%l1
	jmpl	%o7,%g0
	fsubs	%f3 ,%f4 ,%f12
p0_far_2_lem:
	udivx	%l2,%l5,%l1
	jmpl	%o7,%g0
	fsubs	%f3 ,%f4 ,%f12
p0_far_2_he:
	or	%l5,%l0,%l1
	fadds	%f29,%f16,%f20
	sdivx	%l2,%l6,%l2
	add	%l1,%l0,%l5
	jmpl	%o7,%g0
	sub	%l5,%l1,%l1
p0_far_2_hem:
	or	%l5,%l0,%l1
	fadds	%f29,%f16,%f20
	sdivx	%l2,%l6,%l2
	add	%l1,%l0,%l5
	jmpl	%o7,%g0
	sub	%l5,%l1,%l1
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	xor	%l4,-0x472,%l6
	and	%l1,0x2eb,%l7
	xnor	%l1,-0x141,%l7
	andn	%l1,%l3,%l1
	add	%l7,%l1,%l0
	umul	%l0,0xbda,%l5
	jmpl	%o7,%g0
	fsubs	%f19,%f23,%f17
far2_b2b_l:
	xnor	%l3,%l0,%l1
	udivx	%l2,0xc86,%l6
	smul	%l0,%l6,%l6
	fcmps	%fcc0,%f14,%f2 
	andn	%l3,%l2,%l1
	andn	%l3,0x3ca,%l3
	jmpl	%o7,%g0
	fsqrts	%f11,%f13
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	jmpl	%o7,%g0
	stw	%l0,[%i5+0x030]		! Mem[0000000010141430]
	jmpl	%o7,%g0
	nop
p0_far_3_lem:
	membar	#Sync
	jmpl	%o7,%g0
	stw	%l0,[%i5+0x030]		! Mem[0000000010141430]
	jmpl	%o7,%g0
	nop
p0_far_3_he:
	addc	%l3,%l0,%l3
	fdivs	%f27,%f31,%f22
	jmpl	%o7,%g0
	mulx	%l5,-0x3f8,%l4
p0_far_3_hem:
	addc	%l3,%l0,%l3
	fdivs	%f27,%f31,%f22
	jmpl	%o7,%g0
	mulx	%l5,-0x3f8,%l4
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	xor	%l4,0x1fe,%l2
	umul	%l1,0x48d,%l2
	jmpl	%o7,%g0
	orn	%l3,0xe9f,%l6
far3_b2b_l:
	mulx	%l3,-0x47a,%l3
	fsubs	%f3 ,%f2 ,%f15
	jmpl	%o7,%g0
	fcmps	%fcc2,%f1 ,%f6 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	xor	%l3,0x095,%l4
	subc	%l0,0x540,%l5
	sdivx	%l1,0x335,%l0
	fcmps	%fcc3,%f7 ,%f13
	fmuls	%f15,%f7 ,%f7 
	std	%f14,[%i4+0x018]	! Mem[0000000010101418]
	andn	%l6,0x2e6,%l3
	jmpl	%g6+8,%g0
	udivx	%l0,%l7,%l5
p0_call_0_le:
	fsqrts	%f12,%f0 
	sdivx	%l0,-0x98c,%l4
	udivx	%l4,%l6,%l2
	fsqrts	%f0 ,%f12
	udivx	%l3,-0xf77,%l2
	fdivs	%f0 ,%f0 ,%f5 
	retl
	sdivx	%l1,-0xbf2,%l5
p0_jmpl_0_lo:
	xor	%l3,0x095,%l4
	subc	%l0,0x540,%l5
	sdivx	%l1,0x335,%l0
	fcmps	%fcc3,%f7 ,%f13
	fmuls	%f15,%f7 ,%f7 
	std	%f14,[%o4+0x018]	! Mem[0000000010101418]
	andn	%l6,0x2e6,%l3
	jmpl	%g6+8,%g0
	udivx	%l0,%l7,%l5
p0_call_0_lo:
	fsqrts	%f12,%f0 
	sdivx	%l0,-0x98c,%l4
	udivx	%l4,%l6,%l2
	fsqrts	%f0 ,%f12
	udivx	%l3,-0xf77,%l2
	fdivs	%f0 ,%f0 ,%f5 
	retl
	sdivx	%l1,-0xbf2,%l5
p0_jmpl_0_he:
	jmpl	%g6+8,%g0
	umul	%l5,%l5,%l7
p0_call_0_he:
	fcmps	%fcc0,%f19,%f31
	retl
	xnor	%l4,-0x5da,%l2
p0_jmpl_0_ho:
	jmpl	%g6+8,%g0
	umul	%l5,%l5,%l7
p0_call_0_ho:
	fcmps	%fcc0,%f19,%f31
	retl
	xnor	%l4,-0x5da,%l2
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	fsubs	%f14,%f11,%f3 
	fdivs	%f0 ,%f1 ,%f12
	addc	%l1,%l0,%l5
	fadds	%f12,%f6 ,%f14
	fcmps	%fcc0,%f9 ,%f0 
	ldsh	[%i3+0x024],%l1		! Mem[00000000100c1424]
	fitos	%f15,%f1 
	jmpl	%g6+8,%g0
	xnor	%l2,%l6,%l5
p0_call_1_le:
	andn	%l5,%l6,%l2
	retl
	add	%l4,-0x555,%l0
p0_jmpl_1_lo:
	fsubs	%f14,%f11,%f3 
	fdivs	%f0 ,%f1 ,%f12
	addc	%l1,%l0,%l5
	fadds	%f12,%f6 ,%f14
	fcmps	%fcc0,%f9 ,%f0 
	ldsh	[%o3+0x024],%l1		! Mem[00000000100c1424]
	fitos	%f15,%f1 
	jmpl	%g6+8,%g0
	xnor	%l2,%l6,%l5
p0_call_1_lo:
	andn	%l5,%l6,%l2
	retl
	add	%l4,-0x555,%l0
p0_jmpl_1_he:
	add	%l1,0xd41,%l7
	addc	%l4,%l1,%l1
	fsqrts	%f18,%f24
	or	%l7,%l7,%l0
	fsubs	%f30,%f18,%f26
	umul	%l6,0x43c,%l1
	fdivs	%f31,%f29,%f17
	jmpl	%g6+8,%g0
	addc	%l7,-0x524,%l7
p0_call_1_he:
	or	%l0,0x1e6,%l4
	xnor	%l7,%l1,%l0
	retl
	addc	%l5,%l3,%l1
p0_jmpl_1_ho:
	add	%l1,0xd41,%l7
	addc	%l4,%l1,%l1
	fsqrts	%f18,%f24
	or	%l7,%l7,%l0
	fsubs	%f30,%f18,%f26
	umul	%l6,0x43c,%l1
	fdivs	%f31,%f29,%f17
	jmpl	%g6+8,%g0
	addc	%l7,-0x524,%l7
p0_call_1_ho:
	or	%l0,0x1e6,%l4
	xnor	%l7,%l1,%l0
	retl
	addc	%l5,%l3,%l1
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	and	%l7,%l4,%l7
	fdtos	%f0 ,%f5 
	jmpl	%g6+8,%g0
	sdivx	%l4,%l0,%l4
p0_call_2_le:
	nop
	udivx	%l0,0xc9e,%l2
	fadds	%f7 ,%f15,%f14
	xnor	%l6,%l3,%l0
	sub	%l0,%l2,%l4
	retl
	fdivs	%f10,%f2 ,%f9 
p0_jmpl_2_lo:
	and	%l7,%l4,%l7
	fdtos	%f0 ,%f5 
	jmpl	%g6+8,%g0
	sdivx	%l4,%l0,%l4
p0_call_2_lo:
	nop
	udivx	%l0,0xc9e,%l2
	fadds	%f7 ,%f15,%f14
	xnor	%l6,%l3,%l0
	sub	%l0,%l2,%l4
	retl
	fdivs	%f10,%f2 ,%f9 
p0_jmpl_2_he:
	subc	%l6,0xb01,%l0
	fdivs	%f16,%f18,%f31
	or	%l4,-0xac6,%l6
	and	%l2,-0xee5,%l5
	xor	%l5,%l7,%l3
	xnor	%l5,-0x473,%l0
	jmpl	%g6+8,%g0
	fadds	%f16,%f27,%f16
p0_call_2_he:
	fadds	%f20,%f22,%f16
	retl
	mulx	%l7,-0x108,%l1
p0_jmpl_2_ho:
	subc	%l6,0xb01,%l0
	fdivs	%f16,%f18,%f31
	or	%l4,-0xac6,%l6
	and	%l2,-0xee5,%l5
	xor	%l5,%l7,%l3
	xnor	%l5,-0x473,%l0
	jmpl	%g6+8,%g0
	fadds	%f16,%f27,%f16
p0_call_2_ho:
	fadds	%f20,%f22,%f16
	retl
	mulx	%l7,-0x108,%l1
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	jmpl	%g6+8,%g0
	xnor	%l7,-0x7cd,%l0
p0_call_3_le:
	smul	%l4,%l3,%l7
	xnor	%l0,-0xcd4,%l2
	fcmps	%fcc3,%f12,%f10
	orn	%l6,-0x26a,%l2
	retl
	fadds	%f15,%f14,%f8 
p0_jmpl_3_lo:
	jmpl	%g6+8,%g0
	xnor	%l7,-0x7cd,%l0
p0_call_3_lo:
	smul	%l4,%l3,%l7
	xnor	%l0,-0xcd4,%l2
	fcmps	%fcc3,%f12,%f10
	orn	%l6,-0x26a,%l2
	retl
	fadds	%f15,%f14,%f8 
p0_jmpl_3_he:
	andn	%l5,%l5,%l5
	ld	[%i1+0x004],%f26	! Mem[0000000010041404]
	jmpl	%g6+8,%g0
	addc	%l4,%l5,%l6
p0_call_3_he:
	subc	%l2,%l1,%l1
	std	%l0,[%i2+0x010]		! Mem[0000000010081410]
	fmuls	%f28,%f18,%f17
	and	%l6,%l6,%l4
	umul	%l3,-0x93c,%l7
	retl
	umul	%l1,0x18a,%l5
p0_jmpl_3_ho:
	andn	%l5,%l5,%l5
	ld	[%o1+0x004],%f26	! Mem[0000000010041404]
	jmpl	%g6+8,%g0
	addc	%l4,%l5,%l6
p0_call_3_ho:
	subc	%l2,%l1,%l1
	std	%l0,[%o2+0x010]		! Mem[0000000010081410]
	fmuls	%f28,%f18,%f17
	and	%l6,%l6,%l4
	umul	%l3,-0x93c,%l7
	retl
	umul	%l1,0x18a,%l5
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
	.word	0x761aa9de,0xc9e64c60		! Init value for %l0
	.word	0x5aab6f46,0xa376f165		! Init value for %l1
	.word	0xb6c082f2,0x72a1b344		! Init value for %l2
	.word	0xa28d7190,0x0b8ec4b0		! Init value for %l3
	.word	0x2f2cf2c2,0x8f35cba1		! Init value for %l4
	.word	0x90edc990,0x5530e475		! Init value for %l5
	.word	0xab97f624,0xc47227b7		! Init value for %l6
	.word	0xa702287a,0x5ab9110c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x7fad7583,0x33515ebc		! Init value for %f0 
	.word	0x9229ab27,0xee91ed0b		! Init value for %f2 
	.word	0xc89791bf,0x27250de1		! Init value for %f4 
	.word	0x5fddcad8,0xbb7ad107		! Init value for %f6 
	.word	0xe1ba7fde,0x065fda19		! Init value for %f8 
	.word	0xaa34c928,0x2a4c1902		! Init value for %f10
	.word	0x9321e048,0x47f5580a		! Init value for %f12
	.word	0x0ff22520,0x1e354b08		! Init value for %f14
	.word	0x9add2e4d,0xdb7324a6		! Init value for %f16
	.word	0x7ab642f5,0xddd6894b		! Init value for %f18
	.word	0x74ff757f,0x9138869f		! Init value for %f20
	.word	0x6f6a89f7,0xbdc11bc9		! Init value for %f22
	.word	0x422583a4,0x234b1eb3		! Init value for %f24
	.word	0x9c639e05,0xfb19b368		! Init value for %f26
	.word	0x14f00a66,0x4e9f3621		! Init value for %f28
	.word	0x16f57748,0xf83a800b		! Init value for %f30
	.word	0x5ecccfef,0xb771ba89		! Init value for %f32
	.word	0x236324e2,0x0b3c4318		! Init value for %f34
	.word	0x5a767b80,0xc57976f8		! Init value for %f36
	.word	0x1e3086dd,0xf953efed		! Init value for %f38
	.word	0xb8ab23c4,0xb025dd8e		! Init value for %f40
	.word	0xcc313636,0x1039d077		! Init value for %f42
	.word	0x89c8fcc9,0x2fa10283		! Init value for %f44
	.word	0x9d3f56c3,0x5e0838a6		! Init value for %f46
	.word	0xa623667f,0x15cb4e16
	.word	0x2b866603,0xe04b58c2
	.word	0x90d83225,0x938fc31b
	.word	0x9f79447c,0x29f54524
	.word	0xa55bfb09,0x2d3411ca
	.word	0x3f83d2e8,0x003f50fb
	.word	0x370b6f7a,0x93435ca3
	.word	0xb7fdd2cd,0x829bed0f
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
	.word	0x00000000,0x73428349
	.word	0x00000000,0x89724a09
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x288b3ed6
	.word	0x00000000,0xffffff7f
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0x7fffffff,0xdba1c701
	.word	0x7fffffff,0xd63e8b28
	.word	0x000000b1,0xb10000ff
	.word	0x288b3ed6,0xffffff00
	.word	0x000000ff,0x7fffffff
	.word	0x00000000,0x00000000
	.word	0xef6d8b37,0x9719ff00
	.word	0x0a2fb301,0xdad8f819
	.word	0x00000048,0x000000fc
	.word	0x288b3ed6,0xffffff7f
	.word	0x000000b1,0xb10000ff
	.word	0x901b85da,0x3bb43509
	.word	0x000000b1,0xb10000ff
	.word	0x34b566da,0xc82b0702
	.word	0x52fcd8d1,0x734e063e
	.word	0x510501e2,0x00000b92
	.word	0x00000036,0x00000400		! %fsr = 0000003600000400
p0_local0_expect:
	.word	0x00000000,0xff000000
	.word	0xff0000b1,0xb1000000
	.word	0xaf000000,0xffffde00
	.word	0x000000ff,0x00000092
	.word	0x89724a09,0x7f00ffff
	.word	0x0000064a,0x2fbaa38f
	.word	0xff7200dc,0xe42e161e
	.word	0x954e5ecf,0x378b6def
p0_local0_sec_expect:
	.word	0x00ffffff,0xdbe7fe5a
	.word	0x00000000,0x00000000
	.word	0xb4000000,0x00000000
	.word	0x901b85da,0x3bb43509
	.word	0xa49bdccb,0xf60e80fa
	.word	0x34b566da,0xc82b0702
	.word	0x52fcd8d1,0x734e063e
	.word	0xd52d968b,0x1443ff53
p0_local1_expect:
	.word	0x000000ff,0x00000092
	.word	0x00000000,0xff000000
	.word	0x19f8d8da,0x01b32f0a
	.word	0x000000b4,0xfb5acd6b
	.word	0x0019ffff,0x80000000
	.word	0xffffff92,0x0b78ffb4
	.word	0x00000000,0xffffffff
	.word	0xffffffe5,0xffff00b4
p0_local1_sec_expect:
	.word	0x00ffffff,0xdba1c701
	.word	0x00000080,0x00800000
	.word	0x00000000,0x378b6def
	.word	0x5afee7db,0xffffff00
	.word	0x510500e5,0x1311b893
	.word	0x000000b4,0xfb5acd6b
	.word	0xb4000000,0xe5000551
	.word	0x0a2fb301,0xdad8f819
p0_local2_expect:
	.word	0x00000000,0xff000000
	.word	0xffff97ff,0xe5000551
	.word	0xff0000b1,0x20000000
	.word	0x000000ff,0xffffde00
	.word	0x00000048,0x000000fc
	.word	0xff2f7dfb,0x3778c414
	.word	0x378b6def,0x01e20000
	.word	0xffffffe5,0xffff00ff
p0_local2_sec_expect:
	.word	0xff0000ff,0xffffde00
	.word	0x3bb43509,0x00000b92
	.word	0xff6d11ff,0xaf87cc60
	.word	0x73589b02,0x2c598a50
	.word	0x000000b4,0xfb5acd6b
	.word	0x4fb6ba7a,0xbd1339d9
	.word	0xde781c1e,0x03a2b00a
	.word	0x00000000,0x390000ff
p0_local3_expect:
	.word	0xff000000,0x510501e2
	.word	0xffef0000,0x20000000
	.word	0x00de00ff,0xb10000ff
	.word	0x00000000,0x00000000
	.word	0x000000b1,0x0000ff80
	.word	0xffffffff,0x000000ff
	.word	0xffffffff,0xffffefe5
	.word	0x000000b1,0xb10000ff
p0_local3_sec_expect:
	.word	0xfc000000,0x48000000
	.word	0x00000000,0x20000000
	.word	0x00000000,0x00000000
	.word	0xa14c30b9,0xc51c61bb
	.word	0x19bb3acc,0xca9768bf
	.word	0xda2d032b,0xfb5acd6b
	.word	0x82e04a37,0x466e5e97
	.word	0x0a2fb301,0xdad8f819
p0_local4_expect:
	.word	0x01c7a1db,0xffffff7f
	.word	0x288b3ed6,0xffffff7f
	.word	0x00000000,0xb1000000
	.word	0x00ffffff,0xdbe7fe5a
	.word	0xffffff7f,0xff000000
	.word	0x00000000,0x00000000
	.word	0x00ff1997,0x378b6def
	.word	0x19f8d8da,0x01b32f0a
p0_local4_sec_expect:
	.word	0xef6d8b37,0x9719ff00
	.word	0xb1000000,0xb1000551
	.word	0x00000000,0x00000000
	.word	0xef6d8b37,0xff8b6def
	.word	0x8a7183a3,0xff8a05fc
	.word	0xffffff92,0x0b78ffb4
	.word	0x00000000,0xffffffff
	.word	0xffffffe5,0xffff00b4
p0_local5_expect:
	.word	0x00000000,0xff000020
	.word	0xd1d8fc52,0x00000000
	.word	0xff0000b1,0xb1000000
	.word	0x1e162ee4,0xb1000000
	.word	0x0019ffff,0x01d194f8
	.word	0xb4000000,0xb1000000
	.word	0x378b6def,0x49000000
	.word	0xfffff7bb,0xd63e8b28
p0_local5_sec_expect:
	.word	0x00000000,0x20000000
	.word	0xffffff7f,0x00000020
	.word	0xfffff8ff,0x0b78ff00
	.word	0x2dcb5f2c,0x59de9a45
	.word	0x3e1ff97f,0x014a49f2
	.word	0xa04e5cfe,0xfc2d5b3d
	.word	0x32a62ca1,0xd6aaa767
	.word	0x83db89d2,0xfd4d317b
p0_local6_expect:
	.word	0x00000000,0x00000000
	.word	0x00000b92,0x00000000
	.word	0x02072bc8,0xda66b534
	.word	0xff000000,0x0000ff00
	.word	0xb4000000,0x00000000
	.word	0x000000b1,0x20000000
	.word	0xffffffff,0xffffefe5
	.word	0x000000ff,0x000000ef
p0_local6_sec_expect:
	.word	0xb1000000,0xff000000
	.word	0xff0b0000,0x00000b92
	.word	0xb10000ff,0x00000000
	.word	0x9d000000,0x20000000
	.word	0x8a718372,0x658afffc
	.word	0x6169e7f2,0xfb78c414
	.word	0xba1a95e5,0xbc34ce0c
	.word	0xb4000000,0xad000000
share0_expect:
	.word	0xffff2191,0x200207fd
	.word	0x00fe3a40,0x8e524b68
	.word	0xeb6de5c1,0x09c37176
	.word	0x17cc97e8,0xa0267b16
	.word	0xd89845b8,0x4673a94d
	.word	0x2a2c1179,0x1fed970e
	.word	0x26e7c8f0,0x2c05ed92
	.word	0x2474fa30,0x80c800db
share1_expect:
	.word	0x06ff7fd0,0x2462a9fb
	.word	0x90965e88,0x902ced82
	.word	0x3c171b4c,0x2b15f2e1
	.word	0x46dd7985,0xd161952b
	.word	0x9ec70755,0x81ebfb33
	.word	0x2bcebbe3,0x9f93703f
	.word	0x347a8755,0xfeac47ab
	.word	0xcf15a003,0x1a2f5847
	.word	0xffe1d57f,0x2de965a4
	.word	0x58ac2f05,0xb47cd031
	.word	0xe8b4a3de,0x028d7f45
	.word	0xedfa570a,0x26233d61
	.word	0x6a985cc8,0x643dcfae
	.word	0xac584f55,0x1b5a97df
	.word	0x110e11c0,0x68d703f0
	.word	0xe44a1491,0x6e03db57
share2_expect:
	.word	0x0100c8b9,0x860046f7
	.word	0xba9598a2,0x844821af
	.word	0x4a72911b,0xddaa10e4
	.word	0xf0152ac4,0x892c41a5
	.word	0x00b690d9,0xef71c8d7
	.word	0x1e846641,0xdcfc9579
	.word	0x498b2cc1,0xebaee405
	.word	0x017be3c0,0x94d10d42
share3_expect:
	.word	0xefddb958,0x89ae4197
	.word	0xeb53d1c3,0x401e1ffc
	.word	0x13babf3a,0x148d6884
	.word	0x751f34a6,0x8e4c29ca
	.word	0x37521c5c,0x100bf86e
	.word	0x33ef13b8,0x8bc9b7df
	.word	0x30100570,0x229d73ac
	.word	0xc03f9541,0xf8ec0a09
	.word	0xf2ff5509,0x5dc1f394
	.word	0xf4f3aba6,0x0e592eaa
	.word	0x99d9d071,0x24d05fbe
	.word	0x8e125c57,0x81987996
	.word	0xe678f589,0x5fdd4932
	.word	0x7738cc8b,0xc4d7cefc
	.word	0xc316c636,0x35eff3ab
	.word	0x9a3ab717,0x6fa34cd0
	.word	0xffff2d54,0xf9abe84c
	.word	0x831187f5,0x5f4ce07a
	.word	0xf89b3e05,0xfdc113fd
	.word	0x19e94f20,0x93224171
	.word	0xd0f89738,0xbef37f6c
	.word	0x9f9c0214,0xdcd9f33f
	.word	0xbb1416b0,0x47cf1de1
	.word	0xd5af167f,0x8d07c048
	.word	0xfffff237,0x50606eee
	.word	0xd0fe950c,0x7bd633b3
	.word	0x8999ba21,0x1d05e6ce
	.word	0x5c57f564,0x9c745bec
	.word	0xd56c21c2,0x5c940de1
	.word	0x0c2a2de0,0x11ae64e1
	.word	0x1a82200b,0x1c339cb8
	.word	0xae90d155,0xcaf6227f
	.word	0xfcffa456,0x57464ff8
	.word	0x4eeefdd6,0x8119d8d3
	.word	0xc1691b7c,0x7d02e25a
	.word	0x08fe5741,0x45071dfd
	.word	0xe55821be,0xdffbf15b
	.word	0x434842ff,0x5c5808ae
	.word	0x9a8d1d9f,0xaba16c35
	.word	0x57a34068,0xa717f880
	.word	0x00ff8e22,0x31ab0400
	.word	0x23612e44,0x7a6ed770
	.word	0xd02e9755,0xd4c39221
	.word	0xdc8eafb0,0xdcb2dbfb
	.word	0xebe7497d,0xfde0800c
	.word	0xad6bd1d2,0x3e119e26
	.word	0x18dc3c42,0xd560fbc6
	.word	0xcaea6410,0xe3f01148
	.word	0x000068e0,0x3871c7ab
	.word	0x45f2411b,0x7166cec5
	.word	0xb082b4c6,0x3564df48
	.word	0x4c908764,0x6a1f42a5
	.word	0x84c4ceb9,0x64f24a7d
	.word	0x499bcaec,0xd0eee09d
	.word	0x8d509600,0x8f11e2f8
	.word	0xa23ec0ab,0xd7d8b043
	.word	0x8aff1988,0xbca51cef
	.word	0xad426e29,0xacb201f5
	.word	0x42a61a3a,0x0ad04e66
	.word	0x3ed98d20,0x8e62d680
	.word	0xa636c93c,0x30139184
	.word	0x7a11ecc2,0x7a432777
	.word	0x84484286,0xe22914b2
	.word	0xb9b10ff0,0x7f12941c
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
	.word	0xfd9d6a37,0x9cef8beb
	.word	0x00000000,0x00000002
	.word	0x8ee60370,0x4c4243bc
	.word	0x00000000,0x00000003
	.word	0xe8b80608,0x75d8f641
	.word	0x00000000,0x00000004
	.word	0x87a70f18,0x04785cf3
	.word	0x00000000,0x00000005
	.word	0xbf9c308f,0xb71e6194
	.word	0x00000000,0x00000006
	.word	0xff5e4558,0x501f9967
	.word	0x00000000,0x00000007
	.word	0x5066474f,0xed34b530
	.word	0x00000000,0x00000008
	.word	0xaa3d340f,0xff52ae9e
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
	.word	0x0903e604,0x7d08d239,0x1e159191,0x3115edb8
	.word	0xf7436878,0x75769327,0x5c4739be,0xd6e04e0f
	.word	0x89724a09,0xf47d9ad3,0xba881e28,0x9f6e605d
	.word	0x2c728cdc,0xd8a985bd,0x954e5ecf,0x049e95c3
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
	.word	0x1a28fb61,0x336a3c7d,0x60d8412a,0x474dcccf
	.word	0xc0ebd368,0xe3ae3d96,0x901b85da,0x3bb43509
	.word	0xa49bdccb,0xf60e80fa,0x34b566da,0xc82b0702
	.word	0x52fcd8d1,0x734e063e,0xd52d968b,0x1443ff53
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
	.word	0xf78865de,0x2345cf60,0x431962a6,0xe10e96eb
	.word	0xfacb2326,0x02f98195,0x0f369c27,0x53b63443
	.word	0xe7e8b55b,0xb7a00186,0x7ee6ac96,0x87f2d5cb
	.word	0x70078c09,0x70791367,0xd3a4448c,0x2cba1041
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
	.word	0x4b589d0a,0x49834273,0x227da9f1,0x9eae159f
	.word	0xbd2cc120,0x243b2037,0xf1431b73,0x025bbbfa
	.word	0xe7b888d8,0x713aee24,0x25947489,0x65663675
	.word	0x374a5c79,0xd29b6627,0x51d96e56,0x470b17d0
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
	.word	0x2ebe852a,0x01333f72,0x510501e2,0xdab6b9b2
	.word	0x1211ada6,0x01b32f0a,0x9dc993a3,0x29783887
	.word	0xfc058a65,0xa383718a,0x14c478fb,0xf2e76961
	.word	0x0cce34bc,0xe5951aba,0xf8fdf5d0,0x49742534
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
	.word	0xa43858ed,0x47f8f155,0xc7382f17,0x1311b893
	.word	0x103764d0,0x568acf96,0x73589b02,0x2c598a50
	.word	0xb3409e89,0x2a2439d5,0x4fb6ba7a,0xbd1339d9
	.word	0xde781c1e,0x03a2b00a,0xd50014bd,0xdaba14a9
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
	.word	0x9209cf24,0x3c3564da,0x95fbb146,0xba4c53f9
	.word	0xb1a6a8ab,0xa847446b,0xbef7bb6d,0xe11d7c54
	.word	0x8e99c375,0xa42f7dfb,0x822f97c0,0x1ea7a347
	.word	0x2e8fd907,0xbfa0494d,0x2fbaa38f,0x79887bcf
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
	.word	0x892741b6,0x5ad661ce,0xdf630b97,0x5c650373
	.word	0x8c941997,0x378b6def,0xa14c30b9,0xc51c61bb
	.word	0x19bb3acc,0xca9768bf,0xda2d032b,0xfb5acd6b
	.word	0x82e04a37,0x466e5e97,0x16bcdb2f,0xdad8f819
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
	.word	0xa5f0c390,0x158b4d22,0x22f849ef,0xb4729709
	.word	0xf3663eb4,0x62d8f48a,0x09feac9b,0x617d3cbc
	.word	0x04557cfd,0x69b25e34,0xb4f63201,0xa2a323db
	.word	0x0eae8317,0xb4d360de,0x7d059879,0x6a47b52c
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
	.word	0xe932f07f,0xea4372d0,0x5f335324,0x7331b674
	.word	0x63eda791,0xd5f113c5,0xab8637c4,0x5dc79274
	.word	0x4a06ab7d,0xfb087c2a,0xb6ce9d67,0x5e860d17
	.word	0xd83bd0f8,0x7beed065,0x8519824d,0x01c7a1db
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
	.word	0xe00dc980,0xdbe7fe5a,0x4babefe5,0x191aa1fc
	.word	0x7fd980ed,0xf904cd83,0x1e162ee4,0x015e7453
	.word	0x93d84b5f,0x26c0a520,0xc9666182,0x66eae3a5
	.word	0x393873ce,0xa444290d,0x0b78fedc,0xd63e8b28
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
	.word	0x398e5534,0x84dc10e1,0xb0a2d071,0xc2064e31
	.word	0xa328c6e0,0x84908f0f,0x2dcb5f2c,0x59de9a45
	.word	0x3e1ff97f,0x014a49f2,0xa04e5cfe,0xfc2d5b3d
	.word	0x32a62ca1,0xd6aaa767,0x83db89d2,0xfd4d317b
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
	.word	0xad11eeb2,0xf4f36d21,0x8c94ee7a,0x2682c481
	.word	0x79a6db06,0x74564f1e,0x26d6aad3,0x2058379e
	.word	0xf894d1ea,0x219ea414,0xc5e16727,0x2f0a5bf4
	.word	0x04e05b1b,0xeaa32946,0xa8b4658b,0xc4f360f5
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
	.word	0x68f3c45e,0x92342ae0,0xad2ae708,0xb022e973
	.word	0x5e99e2f1,0x07edce61,0x868fa915,0x6f605b97
	.word	0xcddf584f,0xdeec00c7,0x1cd654bd,0xdd4a3a7e
	.word	0xc739ec77,0x1739cc66,0x3d494246,0x80b4893f
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
	.word	0x57de2191,0x200207fd,0x00fe3a40,0x8e524b68
	.word	0xeb6de5c1,0x09c37176,0x17cc97e8,0xa0267b16
	.word	0xd89845b8,0x4673a94d,0x2a2c1179,0x1fed970e
	.word	0x26e7c8f0,0x2c05ed92,0x2474fa30,0x80c800db
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
	.word	0x392f7fd0,0x2462a9fb,0x90965e88,0x902ced82
	.word	0x3c171b4c,0x2b15f2e1,0x46dd7985,0xd161952b
	.word	0x9ec70755,0x81ebfb33,0x2bcebbe3,0x9f93703f
	.word	0x347a8755,0xfeac47ab,0xcf15a003,0x1a2f5847
	.word	0x691fd57f,0x2de965a4,0x58ac2f05,0xb47cd031
	.word	0xe8b4a3de,0x028d7f45,0xedfa570a,0x26233d61
	.word	0x6a985cc8,0x643dcfae,0xac584f55,0x1b5a97df
	.word	0x110e11c0,0x68d703f0,0xe44a1491,0x6e03db57
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
	.word	0x993ec8b9,0x860046f7,0xba9598a2,0x844821af
	.word	0x4a72911b,0xddaa10e4,0xf0152ac4,0x892c41a5
	.word	0x00b690d9,0xef71c8d7,0x1e846641,0xdcfc9579
	.word	0x498b2cc1,0xebaee405,0x017be3c0,0x94d10d42
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
	.word	0xfdddb958,0x89ae4197,0xeb53d1c3,0x401e1ffc
	.word	0x13babf3a,0x148d6884,0x751f34a6,0x8e4c29ca
	.word	0x37521c5c,0x100bf86e,0x33ef13b8,0x8bc9b7df
	.word	0x30100570,0x229d73ac,0xc03f9541,0xf8ec0a09
	.word	0xf2215509,0x5dc1f394,0xf4f3aba6,0x0e592eaa
	.word	0x99d9d071,0x24d05fbe,0x8e125c57,0x81987996
	.word	0xe678f589,0x5fdd4932,0x7738cc8b,0xc4d7cefc
	.word	0xc316c636,0x35eff3ab,0x9a3ab717,0x6fa34cd0
	.word	0x74422d54,0xf9abe84c,0x831187f5,0x5f4ce07a
	.word	0xf89b3e05,0xfdc113fd,0x19e94f20,0x93224171
	.word	0xd0f89738,0xbef37f6c,0x9f9c0214,0xdcd9f33f
	.word	0xbb1416b0,0x47cf1de1,0xd5af167f,0x8d07c048
	.word	0x5553f237,0x50606eee,0xd0fe950c,0x7bd633b3
	.word	0x8999ba21,0x1d05e6ce,0x5c57f564,0x9c745bec
	.word	0xd56c21c2,0x5c940de1,0x0c2a2de0,0x11ae64e1
	.word	0x1a82200b,0x1c339cb8,0xae90d155,0xcaf6227f
	.word	0x797fa456,0x57464ff8,0x4eeefdd6,0x8119d8d3
	.word	0xc1691b7c,0x7d02e25a,0x08fe5741,0x45071dfd
	.word	0xe55821be,0xdffbf15b,0x434842ff,0x5c5808ae
	.word	0x9a8d1d9f,0xaba16c35,0x57a34068,0xa717f880
	.word	0xcfac8e22,0x31ab0400,0x23612e44,0x7a6ed770
	.word	0xd02e9755,0xd4c39221,0xdc8eafb0,0xdcb2dbfb
	.word	0xebe7497d,0xfde0800c,0xad6bd1d2,0x3e119e26
	.word	0x18dc3c42,0xd560fbc6,0xcaea6410,0xe3f01148
	.word	0x69b868e0,0x3871c7ab,0x45f2411b,0x7166cec5
	.word	0xb082b4c6,0x3564df48,0x4c908764,0x6a1f42a5
	.word	0x84c4ceb9,0x64f24a7d,0x499bcaec,0xd0eee09d
	.word	0x8d509600,0x8f11e2f8,0xa23ec0ab,0xd7d8b043
	.word	0x8aec1988,0xbca51cef,0xad426e29,0xacb201f5
	.word	0x42a61a3a,0x0ad04e66,0x3ed98d20,0x8e62d680
	.word	0xa636c93c,0x30139184,0x7a11ecc2,0x7a432777
	.word	0x84484286,0xe22914b2,0xb9b10ff0,0x7f12941c
share3_end:
