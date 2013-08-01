/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_10.s
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
!	Seed = 327144527
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1500_10.s created on Mar 27, 2009 (14:45:27)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_1500_10 -p 1 -l 1500

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
!	%f0  = 3221c248 b44f964d f7d99c0b c2e5d15a
!	%f4  = 1654d3f0 420478f1 2f7d001e cf157334
!	%f8  = 7d4eefa7 d6755a69 006a18af 96fbc312
!	%f12 = bf4482ca 583d2e41 206388cb 8c04ea9a
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 64156cc9 dfaee5f8 38483f48 1ddbdfe4
!	%f20 = 9bf246d6 47fbeea9 5d2b4d48 6e662eef
!	%f24 = 93b2eb62 ba371750 6eccb852 6383fbc7
!	%f28 = 91aa7ae8 ef868c3a b7282509 5c808fe7
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 9046dbbc bedbe687 f2869c52 6f8ebefc
!	%f36 = f9a2b020 c914127d 2f416023 3b2accf7
!	%f40 = 5c0710e5 0d4b6a57 efbf24aa fbc7e253
!	%f44 = 6b922a06 a9bb2186 1440f0c2 72338462
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x9002cfa00000005f,%g7,%g1 ! GSR scale = 11, align = 7
	wr	%g1,%g0,%gsr		! GSR = 9002cfa00000005f
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l1 = 4ad4ed8fe343679a, Mem[0000000030181410] = f8bd8e54
	stwa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = e343679a
!	Mem[0000000030081400] = ba15c5ef 1b180e12, %l4 = f5c9b774, %l5 = 98406171
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 00000000ba15c5ef 000000001b180e12
!	Mem[0000000010181408] = f8018012, %l3 = 5ac14325d5e3c596
	ldswa	[%i6+%o4]0x80,%l3	! %l3 = fffffffff8018012
!	Mem[00000000300c1410] = 3681d37a47f5cb5c, %l7 = 5d33acf2a5161374
	ldxa	[%i3+%o5]0x89,%l7	! %l7 = 3681d37a47f5cb5c
!	Mem[00000000300c1400] = e102e5c6295b9652, %f18 = 38483f48 1ddbdfe4
	ldda	[%i3+%g0]0x89,%f18	! %f18 = e102e5c6 295b9652
!	Mem[00000000100c141c] = 8f2b7ac9, %l3 = f8018012, %l7 = 47f5cb5c
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 000000008f2b7ac9
!	Mem[0000000030181410] = 9a6743e3, %l7 = 000000008f2b7ac9
	lduba	[%i6+%o5]0x89,%l7	! %l7 = 00000000000000e3
!	Mem[0000000030081410] = c249ef42, %l5 = 000000001b180e12
	lduwa	[%i2+%o5]0x89,%l5	! %l5 = 00000000c249ef42
!	Mem[0000000030041408] = 5ea7019c271a0bdf, %l5 = 00000000c249ef42
	ldxa	[%i1+%o4]0x81,%l5	! %l5 = 5ea7019c271a0bdf
!	Starting 10 instruction Store Burst
!	%f16 = 64156cc9 dfaee5f8 e102e5c6 295b9652
!	%f20 = 9bf246d6 47fbeea9 5d2b4d48 6e662eef
!	%f24 = 93b2eb62 ba371750 6eccb852 6383fbc7
!	%f28 = 91aa7ae8 ef868c3a b7282509 5c808fe7
	stda	%f16,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400

p0_label_2:
!	%f14 = 206388cb 8c04ea9a, Mem[00000000300c1408] = bbf97ce3 28119639
	stda	%f14,[%i3+%o4]0x89	! Mem[00000000300c1408] = 206388cb 8c04ea9a
!	%l3 = fffffffff8018012, Mem[00000000300c1410] = 47f5cb5c
	stba	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 47f5cb12
!	%f0  = 3221c248 b44f964d f7d99c0b c2e5d15a
!	%f4  = 1654d3f0 420478f1 2f7d001e cf157334
!	%f8  = 7d4eefa7 d6755a69 006a18af 96fbc312
!	%f12 = bf4482ca 583d2e41 206388cb 8c04ea9a
	stda	%f0,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	%l5 = 5ea7019c271a0bdf, Mem[0000000010181410] = 75add3f78b7554bb
	stxa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 5ea7019c271a0bdf
!	%l6 = 20e6151a76907d07, Mem[00000000100c142c] = 314d4c48
	stb	%l6,[%i3+0x02c]		! Mem[00000000100c142c] = 074d4c48
!	%l7 = 00000000000000e3, Mem[0000000030181400] = 821e648728cf5bea
	stxa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000000000e3
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010101410] = 9cbe1c9c, %l1 = 4ad4ed8fe343679a, %asi = 80
	swapa	[%i4+0x010]%asi,%l1	! %l1 = 000000009cbe1c9c
!	%l2 = d7ce58d8, %l3 = f8018012, Mem[0000000030081400] = efc515ba 120e181b
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = d7ce58d8 f8018012
!	Mem[00000000100c1400] = 0388eb08, %l6 = 20e6151a76907d07
	swapa	[%i3+%g0]0x88,%l6	! %l6 = 000000000388eb08
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 661cf0c1, %l4 = 00000000ba15c5ef
	lduha	[%i5+%o5]0x88,%l4	! %l4 = 000000000000f0c1

p0_label_3:
!	Mem[0000000010101410] = 9a6743e3, %l0 = bff8eb0004679c44
	ldsba	[%i4+%o5]0x88,%l0	! %l0 = ffffffffffffffe3
!	Mem[0000000010041400] = 9792608a, %l1 = 000000009cbe1c9c
	lduha	[%i1+%g0]0x80,%l1	! %l1 = 0000000000009792
!	Mem[0000000030141400] = d2592811 96fdf3a0, %l0 = ffffffe3, %l1 = 00009792
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 0000000096fdf3a0 00000000d2592811
!	Mem[0000000010101420] = 27f3dffe8f92258e, %f14 = 206388cb 8c04ea9a
	ldd	[%i4+0x020],%f14	! %f14 = 27f3dffe 8f92258e
!	Mem[00000000300c1400] = e102e5c6295b9652, %f18 = e102e5c6 295b9652
	ldda	[%i3+%g0]0x89,%f18	! %f18 = e102e5c6 295b9652
!	Mem[0000000010181400] = 9179af5a, %l7 = 00000000000000e3
	ldsba	[%i6+%g0]0x88,%l7	! %l7 = 000000000000005a
!	Mem[0000000030001400] = f38e27e7 a2cd6bbb, %l4 = 0000f0c1, %l5 = 271a0bdf
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 00000000f38e27e7 00000000a2cd6bbb
!	Mem[0000000030141410] = a2572ae2, %l0 = 0000000096fdf3a0
	lduwa	[%i5+%o5]0x81,%l0	! %l0 = 00000000a2572ae2
!	Mem[0000000020800040] = 6ded6b19, %l7 = 000000000000005a
	ldsba	[%o1+0x040]%asi,%l7	! %l7 = 000000000000006d
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 99ae8ef5, %l0 = 00000000a2572ae2
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 000000f5000000ff

p0_label_4:
!	%f5  = 420478f1, %f19 = 295b9652, %f21 = 47fbeea9
	fsubs	%f5 ,%f19,%f21		! %f21 = 420478f1
!	Mem[00000000100c1400] = 76907d07, %l7 = 000000000000006d
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 00000007000000ff
!	%l7 = 0000000000000007, Mem[0000000010141408] = 83c1336a
	stha	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 0007336a
!	%l4 = 00000000f38e27e7, Mem[0000000010181408] = f8018012
	stwa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = f38e27e7
!	%f7  = cf157334, Mem[0000000010041400] = 9792608a
	sta	%f7 ,[%i1+%g0]0x80	! Mem[0000000010041400] = cf157334
!	%l3 = fffffffff8018012, Mem[0000000010181432] = 1a5e3f5e, %asi = 80
	stha	%l3,[%i6+0x032]%asi	! Mem[0000000010181430] = 1a5e8012
!	Mem[0000000030181410] = 9a6743e3, %l7 = 0000000000000007
	ldstuba	[%i6+%o5]0x89,%l7	! %l7 = 000000e3000000ff
!	%l0 = 00000000000000f5, Mem[0000000030081400] = d858ced7
	stha	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 00f5ced7
!	Mem[0000000020800040] = 6ded6b19, %l6 = 000000000388eb08
	ldstub	[%o1+0x040],%l6		! %l6 = 0000006d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = f8e5aedfc96c1564, %f6  = 2f7d001e cf157334
	ldda	[%i2+0x000]%asi,%f6 	! %f6  = f8e5aedf c96c1564

p0_label_5:
!	Mem[0000000030081408] = eab27ac30fb2e0f4, %l5 = 00000000a2cd6bbb
	ldxa	[%i2+%o4]0x81,%l5	! %l5 = eab27ac30fb2e0f4
!	Mem[0000000010181408] = f38e27e7, %l6 = 000000000000006d
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = fffffffffffff38e
!	Mem[0000000030141400] = 96fdf3a0, %l6 = fffffffffffff38e
	lduba	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000a0
!	Mem[0000000010001418] = 340c95e4, %l4 = 00000000f38e27e7
	lduw	[%i0+0x018],%l4		! %l4 = 00000000340c95e4
!	Mem[0000000010101410] = e343679a, %l6 = 00000000000000a0
	ldsba	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffffffe3
!	%l3 = fffffffff8018012, immd = 0000000000000109, %l5 = eab27ac30fb2e0f4
	udivx	%l3,0x109,%l5		! %l5 = 00f74e3fc224b710
!	Mem[0000000030141400] = a0f3fd96, %l7 = 00000000000000e3
	ldsba	[%i5+%g0]0x81,%l7	! %l7 = ffffffffffffffa0
!	Mem[0000000010101400] = e306e568, %l3 = fffffffff8018012
	lduwa	[%i4+%g0]0x88,%l3	! %l3 = 00000000e306e568
!	Mem[0000000030141408] = 6ff66c29, %l3 = 00000000e306e568
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 000000006ff66c29
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000f5, Mem[0000000010101420] = 27f3dffe8f92258e, %asi = 80
	stxa	%l0,[%i4+0x020]%asi	! Mem[0000000010101420] = 00000000000000f5

p0_label_6:
!	Mem[00000000211c0001] = c044f58c, %l0 = 00000000000000f5
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 00000044000000ff
!	%f9  = d6755a69, Mem[0000000030141408] = 6ff66c29
	sta	%f9 ,[%i5+%o4]0x89	! Mem[0000000030141408] = d6755a69
!	Mem[0000000010001400] = 99ae8eff, %l1 = 00000000d2592811
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c141b] = 5dc1e4a3, %l0 = 0000000000000044
	ldstub	[%i3+0x01b],%l0		! %l0 = 000000a3000000ff
!	%f0  = 3221c248, Mem[0000000030141400] = a0f3fd96
	sta	%f0 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 3221c248
!	%f12 = bf4482ca 583d2e41, %l1 = 00000000000000ff
!	Mem[0000000030041410] = 633954c8ac268a04
	add	%i1,0x010,%g1
	stda	%f12,[%g1+%l1]ASI_PST8_S ! Mem[0000000030041410] = bf4482ca583d2e41
!	%f23 = 6e662eef, Mem[0000000030181410] = 9a6743ff
	sta	%f23,[%i6+%o5]0x89	! Mem[0000000030181410] = 6e662eef
!	%f16 = 64156cc9 dfaee5f8 e102e5c6 295b9652
!	%f20 = 9bf246d6 420478f1 5d2b4d48 6e662eef
!	%f24 = 93b2eb62 ba371750 6eccb852 6383fbc7
!	%f28 = 91aa7ae8 ef868c3a b7282509 5c808fe7
	stda	%f16,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
!	Mem[0000000010081415] = d646f29b, %l2 = f8bee037d7ce58d8
	ldstub	[%i2+0x015],%l2		! %l2 = 00000046000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 5385e695, %l1 = 00000000000000ff
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000005385

p0_label_7:
!	Mem[00000000100c1410] = 3a51f9d5, %l3 = 000000006ff66c29
	lduha	[%i3+%o5]0x88,%l3	! %l3 = 000000000000f9d5
!	Mem[0000000010141408] = 6a330700, %l4 = 00000000340c95e4
	ldsba	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = c249ef42, %l6 = ffffffffffffffe3
	lduba	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000042
!	Mem[0000000010081408] = 52965b29 c6e502e1, %l6 = 00000042, %l7 = ffffffa0
	ldd	[%i2+%o4],%l6		! %l6 = 0000000052965b29 00000000c6e502e1
!	%l3 = 000000000000f9d5, %l7 = 00000000c6e502e1, %l6 = 0000000052965b29
	orn	%l3,%l7,%l6		! %l6 = ffffffff391afddf
!	Mem[0000000010081410] = 47fbeea9, %l1 = 0000000000005385
	lduba	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000a9
!	Mem[000000001000143c] = ea2c70e6, %f6  = f8e5aedf
	ld	[%i0+0x03c],%f6 	! %f6 = ea2c70e6
!	Mem[0000000010081428] = c7fb836352b8cc6e, %l5 = 00f74e3fc224b710
	ldx	[%i2+0x028],%l5		! %l5 = c7fb836352b8cc6e
!	Mem[0000000030181400] = 00000000, %l0 = 00000000000000a3
	lduwa	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = f7d99c0b c2e5d15a, Mem[0000000030101400] = 4d964fb4 48c22132
	stda	%f2 ,[%i4+%g0]0x81	! Mem[0000000030101400] = f7d99c0b c2e5d15a

p0_label_8:
!	%l2 = 00000046, %l3 = 0000f9d5, Mem[0000000030001408] = 01d428d1 d9e33282
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000046 0000f9d5
!	%f7  = c96c1564, Mem[0000000010081400] = f8e5aedf
	sta	%f7 ,[%i2+%g0]0x80	! Mem[0000000010081400] = c96c1564
!	%f8  = 7d4eefa7 d6755a69, Mem[0000000030101400] = 0b9cd9f7 5ad1e5c2
	stda	%f8 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 7d4eefa7 d6755a69
!	Mem[0000000030141408] = d6755a69, %l6 = ffffffff391afddf
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 00000000d6755a69
!	%f6  = ea2c70e6, Mem[0000000010141400] = 5385e695
	sta	%f6 ,[%i5+0x000]%asi	! Mem[0000000010141400] = ea2c70e6
!	%l1 = 00000000000000a9, Mem[0000000030141408] = dffd1a39c8859aef
	stxa	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000000000a9
!	%f3  = c2e5d15a, Mem[0000000030081410] = c249ef42
	sta	%f3 ,[%i2+%o5]0x89	! Mem[0000000030081410] = c2e5d15a
!	%l4 = 0000000000000000, Mem[0000000030141408] = 00000000
	stha	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%l6 = d6755a69, %l7 = c6e502e1, Mem[0000000030041400] = 45e52085 3b5b8666
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = d6755a69 c6e502e1
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 46000000, %l0 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000046

p0_label_9:
!	Mem[0000000010041400] = cf157334 6d25e01f, %l6 = d6755a69, %l7 = c6e502e1
	ldd	[%i1+%g0],%l6		! %l6 = 00000000cf157334 000000006d25e01f
!	%f13 = 583d2e41, %f14 = 27f3dffe
	fcmpes	%fcc1,%f13,%f14		! %fcc1 = 2
!	%l2 = 0000000000000046, imm = 000000000000088a, %l2 = 0000000000000046
	orn	%l2,0x88a,%l2		! %l2 = fffffffffffff777
!	Mem[00000000100c1408] = 5c6683ae, %l4 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l4	! %l4 = 000000005c6683ae
!	Mem[0000000010141408] = 0007336a, %l6 = 00000000cf157334
	lduha	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000007
!	Mem[00000000300c1400] = 295b9652, %l5 = c7fb836352b8cc6e
	ldswa	[%i3+%g0]0x89,%l5	! %l5 = 00000000295b9652
!	Mem[0000000010141410] = c1f01c66, %f13 = 583d2e41
	ld	[%i5+%o5],%f13	! %f13 = c1f01c66
!	Mem[0000000030181408] = 09e1f365, %l2 = fffffffffffff777
	ldsba	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000065
!	Mem[0000000010001410] = f1e90850, %l2 = 0000000000000065
	lduha	[%i0+%o5]0x80,%l2	! %l2 = 000000000000f1e9
!	Starting 10 instruction Store Burst
!	%l0 = 00000046, %l1 = 000000a9, Mem[0000000030101410] = 420478f1 1654d3f0
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000046 000000a9

p0_label_10:
!	%l4 = 000000005c6683ae, Mem[00000000201c0000] = 78200197, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 83ae0197
!	Mem[0000000010081410] = a9eefb47, %l2 = 000000000000f1e9
	swapa	[%i2+%o5]0x80,%l2	! %l2 = 00000000a9eefb47
!	%f2  = f7d99c0b, Mem[0000000010141410] = c1f01c66
	st	%f2 ,[%i5+%o5]		! Mem[0000000010141410] = f7d99c0b
!	Mem[0000000010141438] = a30bd602, %l2 = a9eefb47, %l7 = 6d25e01f
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 00000000a30bd602
!	%l6 = 00000007, %l7 = a30bd602, Mem[0000000010081408] = 52965b29 c6e502e1
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000007 a30bd602
!	%f10 = 006a18af 96fbc312, Mem[0000000010081410] = e9f10000 9bf2ffd6
	stda	%f10,[%i2+%o5]0x88	! Mem[0000000010081410] = 006a18af 96fbc312
!	Mem[0000000010081400] = c96c1564, %l2 = 00000000a9eefb47
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000c96c1564
!	%l5 = 00000000295b9652, Mem[0000000030181408] = 65f3e109
	stha	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 9652e109
!	Mem[0000000030041408] = 9c01a75e, %l7 = 00000000a30bd602
	ldstuba	[%i1+%o4]0x89,%l7	! %l7 = 0000005e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff8eae99f7357668, %f22 = 5d2b4d48 6e662eef
	ldda	[%i0+%g0]0x80,%f22	! %f22 = ff8eae99 f7357668

p0_label_11:
!	Mem[0000000010081400] = a9eefb47, %l5 = 00000000295b9652
	ldub	[%i2+0x002],%l5		! %l5 = 00000000000000fb
!	Mem[0000000010181438] = 1744b198, %l0 = 0000000000000046
	ldsha	[%i6+0x038]%asi,%l0	! %l0 = 0000000000001744
!	Mem[0000000030141408] = 00000000, %l4 = 000000005c6683ae
	ldsha	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[000000001004143c] = ab2faf04, %l4 = 0000000000000000
	lduw	[%i1+0x03c],%l4		! %l4 = 00000000ab2faf04
!	Mem[00000000100c1410] = 77fa433d 3a51f9d5, %l6 = 00000007, %l7 = 0000005e
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 000000003a51f9d5 0000000077fa433d
!	Mem[0000000010001430] = 801d3639, %l1 = 00000000000000a9
	lduw	[%i0+0x030],%l1		! %l1 = 00000000801d3639
!	Mem[0000000030101408] = 5ad1e5c2 0b9cd9f7, %l2 = c96c1564, %l3 = 0000f9d5
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 000000005ad1e5c2 000000000b9cd9f7
!	Mem[0000000010141408] = 6a330700, %l2 = 000000005ad1e5c2
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000700
!	Mem[0000000030141400] = 3221c248, %l1 = 00000000801d3639
	ldsba	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000032
!	Starting 10 instruction Store Burst
!	%l6 = 000000003a51f9d5, Mem[00000000211c0000] = c0fff58c
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = f9d5f58c

p0_label_12:
!	Mem[0000000021800180] = dc84ed8e, %l2 = 0000000000000700
	ldstuba	[%o3+0x180]%asi,%l2	! %l2 = 000000dc000000ff
!	%f30 = b7282509 5c808fe7, Mem[0000000010101410] = f1780442 d646f29b
	std	%f30,[%i4+%o5]	! Mem[0000000010101410] = b7282509 5c808fe7
!	Mem[0000000010001418] = 340c95e447c7492b, %l1 = 0000000000000032, %l6 = 000000003a51f9d5
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 340c95e447c7492b
!	%l1 = 0000000000000032, Mem[0000000010141408] = 6a330700
	stwa	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000032
!	Mem[0000000020800041] = ffed6b19, %l1 = 0000000000000032
	ldstub	[%o1+0x041],%l1		! %l1 = 000000ed000000ff
!	%l4 = 00000000ab2faf04, Mem[0000000010001410] = 5008e9f1
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ab2faf04
!	Mem[00000000100c1410] = 3a51f9d5, %l1 = 00000000000000ed
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 000000003a51f9d5
!	%f15 = 8f92258e, Mem[0000000010141430] = 243de36b
	sta	%f15,[%i5+0x030]%asi	! Mem[0000000010141430] = 8f92258e
!	Mem[00000000300c1400] = 52965b29, %l0 = 0000000000001744
	ldstuba	[%i3+%g0]0x81,%l0	! %l0 = 00000052000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 6e662eef, %f8  = 7d4eefa7
	lda	[%i6+%o5]0x89,%f8 	! %f8 = 6e662eef

p0_label_13:
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010101400] = f8e5aedf c96c1564 52965b29 c6e502e1
!	Mem[0000000010101410] = b7282509 5c808fe7 ef2e666e 484d2b5d
!	Mem[0000000010101420] = 501737ba 62ebb293 c7fb8363 52b8cc6e
!	Mem[0000000010101430] = 3a8c86ef e87aaa91 e78f805c 092528b7
	ldda	[%i4]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400
!	%l7 = 0000000077fa433d, immd = fffffffffffff63f, %l2 = 00000000000000dc
	sdivx	%l7,-0x9c1,%l2		! %l2 = fffffffffff3b315
!	Mem[0000000010141430] = 8f92258eff49bfdb, %l7 = 0000000077fa433d
	ldxa	[%i5+0x030]%asi,%l7	! %l7 = 8f92258eff49bfdb
!	Mem[0000000030001400] = e7278ef3, %l7 = 8f92258eff49bfdb
	lduwa	[%i0+%g0]0x89,%l7	! %l7 = 00000000e7278ef3
!	Mem[0000000030081400] = d7cef500, %l4 = 00000000ab2faf04
	lduba	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00f5ced7, %l7 = 00000000e7278ef3
	lduha	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000f5
!	Mem[0000000030101400] = d6755a69, %l6 = 340c95e447c7492b
	ldswa	[%i4+%g0]0x89,%l6	! %l6 = ffffffffd6755a69
!	Mem[0000000010141410] = f7d99c0b19d5d19b, %l6 = ffffffffd6755a69
	ldxa	[%i5+%o5]0x80,%l6	! %l6 = f7d99c0b19d5d19b
!	Mem[0000000010041410] = 60b37d12, %f9  = d6755a69
	lda	[%i1+%o5]0x80,%f9 	! %f9 = 60b37d12
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (3)
!	%l6 = f7d99c0b19d5d19b, Mem[0000000010101410] = 092528b7
	stha	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 0925d19b

p0_label_14:
!	%l4 = 00000000, %l5 = 000000fb, Mem[0000000030001408] = 00000046 0000f9d5
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 000000fb
!	%l4 = 0000000000000000, Mem[0000000010001438] = 6c103ed1
	sth	%l4,[%i0+0x038]		! Mem[0000000010001438] = 00003ed1
!	%l4 = 0000000000000000, Mem[0000000030181400] = 00000000
	stha	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%f22 = 5d2b4d48 6e662eef, Mem[0000000030081410] = c2e5d15a 3eacf3c1
	stda	%f22,[%i2+%o5]0x89	! Mem[0000000030081410] = 5d2b4d48 6e662eef
!	Mem[0000000021800100] = 0abd39f1, %l6 = f7d99c0b19d5d19b
	ldstub	[%o3+0x100],%l6		! %l6 = 0000000a000000ff
!	%l2 = fffffffffff3b315, Mem[0000000010001430] = 801d36399b7971a7
	stx	%l2,[%i0+0x030]		! Mem[0000000010001430] = fffffffffff3b315
!	%l2 = fffffffffff3b315, Mem[00000000100c1400] = ff7d907672d43f38
	stxa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = fffffffffff3b315
!	%l5 = 00000000000000fb, Mem[0000000030181410] = ef2e666e
	stha	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 00fb666e
!	%l2 = fff3b315, %l3 = 0b9cd9f7, Mem[0000000010141418] = 52a01884 3c17bdea
	stda	%l2,[%i5+0x018]%asi	! Mem[0000000010141418] = fff3b315 0b9cd9f7
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = c36b4a05, %l2 = fffffffffff3b315
	lduba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000005

p0_label_15:
!	Mem[0000000030141400] = 3221c248112859d2, %f16 = 64156cc9 dfaee5f8
	ldda	[%i5+%g0]0x81,%f16	! %f16 = 3221c248 112859d2
!	%l1 = 000000003a51f9d5, %l3 = 000000000b9cd9f7, %l5 = 00000000000000fb
	xnor	%l1,%l3,%l5		! %l5 = ffffffffce32dfdd
!	%l4 = 0000000000000000, %l2 = 0000000000000005, %l3 = 000000000b9cd9f7
	sub	%l4,%l2,%l3		! %l3 = fffffffffffffffb
!	Mem[0000000010181410] = 5ea7019c, %l7 = 00000000000000f5
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 000000005ea7019c
!	Mem[0000000030141410] = 5eb4fc79e22a57a2, %l6 = 000000000000000a
	ldxa	[%i5+%o5]0x89,%l6	! %l6 = 5eb4fc79e22a57a2
!	Mem[00000000100c1400] = 15b3f3ffffffffff, %f12 = bf4482ca c1f01c66
	ldda	[%i3+%g0]0x88,%f12	! %f12 = 15b3f3ff ffffffff
!	Mem[0000000010081428] = c7fb836352b8cc6e, %l1 = 000000003a51f9d5
	ldx	[%i2+0x028],%l1		! %l1 = c7fb836352b8cc6e
!	Mem[0000000030001408] = 00000000, %l5 = ffffffffce32dfdd
	lduwa	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = df0b1a279c01a75e, %l3 = fffffffffffffffb
	ldxa	[%i6+%o5]0x88,%l3	! %l3 = df0b1a279c01a75e
!	Starting 10 instruction Store Burst
!	%l3 = df0b1a279c01a75e, Mem[0000000030001408] = 00000000
	stba	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000005e

p0_label_16:
!	%l0 = 00000052, %l1 = 52b8cc6e, Mem[00000000100c1410] = ed000000 3d43fa77
	stda	%l0,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00000052 52b8cc6e
!	%l4 = 0000000000000000, Mem[00000000100c1400] = fffffffffff3b315
	stxa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000000
!	%l0 = 00000052, %l1 = 52b8cc6e, Mem[0000000010081408] = 07000000 02d60ba3
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000052 52b8cc6e
!	%l2 = 0000000000000005, Mem[0000000010141408] = 32000000, %asi = 80
	stha	%l2,[%i5+0x008]%asi	! Mem[0000000010141408] = 00050000
!	Mem[00000000300c1408] = 8c04ea9a, %l0 = 0000000000000052
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 000000008c04ea9a
!	Mem[0000000010101414] = 5c808fe7, %l1 = c7fb836352b8cc6e
	ldstuba	[%i4+0x014]%asi,%l1	! %l1 = 0000005c000000ff
!	%l3 = df0b1a279c01a75e, Mem[0000000010101408] = 295b9652
	stba	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 295b965e
!	Mem[00000000201c0000] = 83ae0197, %l2 = 0000000000000005
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 00000083000000ff
!	%l0 = 000000008c04ea9a, Mem[0000000010141408] = 9d33a05d00000500
	stxa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000008c04ea9a
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 5eb4fc79e22a57a2, %l5 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l5	! %l5 = 5eb4fc79e22a57a2

p0_label_17:
!	%l6 = 5eb4fc79e22a57a2, imm = 0000000000000f8b, %l7 = 000000005ea7019c
	xor	%l6,0xf8b,%l7		! %l7 = 5eb4fc79e22a5829
!	Mem[0000000020800000] = 24d37ff0, %l0 = 000000008c04ea9a
	ldsh	[%o1+%g0],%l0		! %l0 = 00000000000024d3
!	Mem[0000000030181408] = 0d4a40cc09e15296, %l6 = 5eb4fc79e22a57a2
	ldxa	[%i6+%o4]0x89,%l6	! %l6 = 0d4a40cc09e15296
!	Mem[0000000010041400] = 347315cf, %l0 = 00000000000024d3
	lduha	[%i1+%g0]0x88,%l0	! %l0 = 00000000000015cf
!	Mem[0000000010101400] = dfaee5f8, %l3 = df0b1a279c01a75e
	ldswa	[%i4+%g0]0x88,%l3	! %l3 = ffffffffdfaee5f8
!	Mem[0000000010041410] = 60b37d12, %l2 = 0000000000000083
	ldsba	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000060
!	Mem[0000000030041410] = bf4482ca, %l1 = 000000000000005c
	ldsba	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffffbf
!	Mem[0000000010181400] = 9179af5a, %l7 = 5eb4fc79e22a5829
	ldsha	[%i6+%g0]0x88,%l7	! %l7 = ffffffffffffaf5a
!	Mem[0000000010081434] = e87aaa91, %l7 = ffffffffffffaf5a
	lduba	[%i2+0x035]%asi,%l7	! %l7 = 000000000000007a
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000060, Mem[0000000010101410] = 9bd12509
	sth	%l2,[%i4+%o5]		! Mem[0000000010101410] = 00602509

p0_label_18:
!	%l0 = 00000000000015cf, Mem[000000001018141c] = 8a415afe
	sth	%l0,[%i6+0x01c]		! Mem[000000001018141c] = 15cf5afe
!	Mem[0000000010001408] = d9ec5d54, %l3 = ffffffffdfaee5f8
	swapa	[%i0+%o4]0x88,%l3	! %l3 = 00000000d9ec5d54
!	Mem[00000000100c1408] = ae83665c, %l0 = 00000000000015cf
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 0000005c000000ff
!	%l1 = ffffffffffffffbf, Mem[000000001018140e] = 5d07b1d6, %asi = 80
	stha	%l1,[%i6+0x00e]%asi	! Mem[000000001018140c] = 5d07ffbf
!	%f18 = e102e5c6, Mem[0000000030041408] = ffa7019c
	sta	%f18,[%i1+%o4]0x81	! Mem[0000000030041408] = e102e5c6
!	Mem[0000000010001408] = dfaee5f8, %l6 = 0d4a40cc09e15296
	swapa	[%i0+%o4]0x88,%l6	! %l6 = 00000000dfaee5f8
!	%l4 = 0000000000000000, Mem[0000000030041400] = 695a75d6
	stwa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%l0 = 000000000000005c, Mem[00000000300c1400] = 295b96ff
	stha	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 295b005c
!	%l6 = 00000000dfaee5f8, Mem[0000000010041428] = 71f23d4beacb05d3
	stx	%l6,[%i1+0x028]		! Mem[0000000010041428] = 00000000dfaee5f8
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 0000005e, %l4 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l4	! %l4 = 000000000000005e

p0_label_19:
!	Mem[0000000030101400] = d6755a69, %l0 = 000000000000005c
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000069
!	Mem[0000000010141404] = 2a2ecef3, %l1 = ffffffffffffffbf
	lduh	[%i5+0x004],%l1		! %l1 = 0000000000002a2e
!	Mem[00000000300c1400] = 5c005b29c6e502e1, %l4 = 000000000000005e
	ldxa	[%i3+%g0]0x81,%l4	! %l4 = 5c005b29c6e502e1
!	Mem[0000000010101400] = dfaee5f8, %l1 = 0000000000002a2e
	lduha	[%i4+%g0]0x88,%l1	! %l1 = 000000000000e5f8
!	Mem[0000000010001400] = 99ae8eff, %l3 = 00000000d9ec5d54
	lduwa	[%i0+%g0]0x88,%l3	! %l3 = 0000000099ae8eff
	membar	#Sync			! Added by membar checker (4)
!	Mem[00000000100c1400] = 00000000 00000000 ff6683ae a3dc7ce3
!	Mem[00000000100c1410] = 00000052 52b8cc6e 5dc1e4ff 8f2b7ac9
!	Mem[00000000100c1420] = 1a360512 65622c50 c5e0d3b9 074d4c48
!	Mem[00000000100c1430] = 7f400752 361be08e 5b023817 be6e4936
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000010181408] = e7278ef3, %l0 = 0000000000000069
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = ffffffffe7278ef3
!	Mem[0000000030101410] = 000000a900000046, %l7 = 000000000000007a
	ldxa	[%i4+%o5]0x89,%l7	! %l7 = 000000a900000046
!	Mem[0000000010101400] = f8e5aedf, %l6 = 00000000dfaee5f8
	lduba	[%i4+%g0]0x80,%l6	! %l6 = 00000000000000f8
!	Starting 10 instruction Store Burst
!	%f29 = ef868c3a, Mem[0000000010101400] = dfaee5f8
	sta	%f29,[%i4+%g0]0x88	! Mem[0000000010101400] = ef868c3a

p0_label_20:
!	%l2 = 00000060, %l3 = 99ae8eff, Mem[0000000030081400] = d7cef500 f8018012
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000060 99ae8eff
	membar	#Sync			! Added by membar checker (5)
!	%l6 = 00000000000000f8, Mem[00000000100c1408] = ae8366ff
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000f8
!	%l6 = 00000000000000f8, Mem[0000000010101410] = 09256000
	stba	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 092560f8
!	Mem[0000000010101430] = 3a8c86efe87aaa91, %l2 = 0000000000000060, %l6 = 00000000000000f8
	add	%i4,0x30,%g1
	casxa	[%g1]0x80,%l2,%l6	! %l6 = 3a8c86efe87aaa91
!	%l2 = 00000060, %l3 = 99ae8eff, Mem[0000000010141408] = 8c04ea9a 00000000
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000060 99ae8eff
!	%l4 = 5c005b29c6e502e1, Mem[0000000030041400] = 00000000e102e5c6
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 5c005b29c6e502e1
!	Mem[0000000030081410] = 6e662eef, %l3 = 0000000099ae8eff
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 000000ef000000ff
!	%l4 = c6e502e1, %l5 = e22a57a2, Mem[0000000010001400] = ff8eae99 f7357668
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = c6e502e1 e22a57a2
!	%f24 = 93b2eb62 ba371750, Mem[0000000010081408] = 00000052 52b8cc6e
	stda	%f24,[%i2+%o4]0x88	! Mem[0000000010081408] = 93b2eb62 ba371750
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 501737ba, %l1 = 000000000000e5f8
	lduw	[%i2+%o4],%l1		! %l1 = 00000000501737ba

p0_label_21:
!	Mem[0000000030141400] = 3221c248, %l4 = 5c005b29c6e502e1
	lduba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000032
!	Mem[00000000100c1438] = 5b023817be6e4936, %l5 = 5eb4fc79e22a57a2
	ldxa	[%i3+0x038]%asi,%l5	! %l5 = 5b023817be6e4936
!	Mem[0000000010141400] = ea2c70e62a2ecef3, %l1 = 00000000501737ba
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = ea2c70e62a2ecef3
!	Mem[0000000030041408] = c6e502e1, %l7 = 000000a900000046
	ldswa	[%i1+%o4]0x89,%l7	! %l7 = ffffffffc6e502e1
!	Mem[0000000010081408] = 93b2eb62ba371750, %l1 = ea2c70e62a2ecef3
	ldxa	[%i2+%o4]0x88,%l1	! %l1 = 93b2eb62ba371750
!	Mem[0000000030141400] = 48c22132, %l3 = 00000000000000ef
	lduha	[%i5+%g0]0x89,%l3	! %l3 = 0000000000002132
!	%f26 = 6eccb852 6383fbc7, %f3  = a3dc7ce3
	fxtos	%f26,%f3 		! %f3  = 5edd9971
!	Mem[00000000100c1408] = f8000000, %f7  = 8f2b7ac9
	lda	[%i3+%o4]0x80,%f7 	! %f7 = f8000000
!	Mem[0000000030041400] = 295b005c, %l5 = 5b023817be6e4936
	ldsha	[%i1+%g0]0x89,%l5	! %l5 = 000000000000005c
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 00fb666e, %l4 = 0000000000000032
	swapa	[%i6+%o5]0x81,%l4	! %l4 = 0000000000fb666e

p0_label_22:
!	%l7 = ffffffffc6e502e1, imm = fffffffffffff729, %l7 = ffffffffc6e502e1
	sub	%l7,-0x8d7,%l7		! %l7 = ffffffffc6e50bb8
!	%l2 = 0000000000000060, Mem[00000000100c140c] = a3dc7ce3
	stw	%l2,[%i3+0x00c]		! Mem[00000000100c140c] = 00000060
!	Mem[0000000010141423] = 8488d6c2, %l1 = 93b2eb62ba371750
	ldstuba	[%i5+0x023]%asi,%l1	! %l1 = 000000c2000000ff
!	Mem[00000000300c1408] = 00000052, %l1 = 00000000000000c2
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000052
!	%l5 = 000000000000005c, Mem[00000000300c1410] = 47f5cb12
	stwa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000005c
!	%f22 = 5d2b4d48 6e662eef, Mem[0000000010101408] = 5e965b29 c6e502e1
	stda	%f22,[%i4+0x008]%asi	! Mem[0000000010101408] = 5d2b4d48 6e662eef
!	%l4 = 00fb666e, %l5 = 0000005c, Mem[0000000010181400] = 5aaf7991 f1b73b1d
	stda	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00fb666e 0000005c
!	Mem[0000000030101408] = c2e5d15a, %l3 = 0000000000002132
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 0000005a000000ff
!	%f16 = 3221c248, Mem[0000000030041410] = bf4482ca
	sta	%f16,[%i1+%o5]0x81	! Mem[0000000030041410] = 3221c248
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010081400] = a9eefb47 c96c1564 501737ba 62ebb293
!	Mem[0000000010081410] = 12c3fb96 af186a00 ef2e666e 484d2b5d
!	Mem[0000000010081420] = 501737ba 62ebb293 c7fb8363 52b8cc6e
!	Mem[0000000010081430] = 3a8c86ef e87aaa91 e78f805c 092528b7
	ldda	[%i2]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400

p0_label_23:
!	Mem[0000000020800000] = 24d37ff0, %l4 = 0000000000fb666e
	ldsh	[%o1+%g0],%l4		! %l4 = 00000000000024d3
!	%l1 = 0000000000000052, Mem[00000000300c1408] = 206388cb000000c2
	stxa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000052
!	Mem[0000000030001410] = f45c4994, %l6 = 3a8c86efe87aaa91
	lduba	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000f4
!	Mem[0000000010001408] = 09e15296, %l5 = 000000000000005c
	lduha	[%i0+%o4]0x88,%l5	! %l5 = 0000000000005296
!	Mem[0000000010001408] = 09e15296, %l2 = 0000000000000060
	lduha	[%i0+%o4]0x88,%l2	! %l2 = 0000000000005296
!	Mem[0000000030141410] = a2572ae2, %l4 = 00000000000024d3
	lduwa	[%i5+%o5]0x81,%l4	! %l4 = 00000000a2572ae2
!	Mem[0000000010001410] = 04af2fab, %l3 = 000000000000005a
	ldsba	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000004
!	Mem[0000000010141408] = 00000060, %l4 = 00000000a2572ae2
	lduha	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000060
!	Mem[0000000030001410] = d10841fe 94495cf4, %l4 = 00000060, %l5 = 00005296
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 0000000094495cf4 00000000d10841fe
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (7)
!	%l2 = 0000000000005296, Mem[0000000010081400] = a9eefb47
	stwa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00005296

p0_label_24:
!	Mem[0000000010081434] = e87aaa91, %l5 = 00000000d10841fe
	swap	[%i2+0x034],%l5		! %l5 = 00000000e87aaa91
!	%l7 = ffffffffc6e50bb8, imm = 000000000000002c, %l7 = ffffffffc6e50bb8
	sub	%l7,0x02c,%l7		! %l7 = ffffffffc6e50b8c
!	%l5 = 00000000e87aaa91, Mem[0000000030141408] = 00000000
	stha	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = aa910000
!	%l4 = 94495cf4, %l5 = e87aaa91, Mem[0000000010181418] = b0d1769d 15cf5afe
	stda	%l4,[%i6+0x018]%asi	! Mem[0000000010181418] = 94495cf4 e87aaa91
!	%l4 = 0000000094495cf4, Mem[0000000010081408] = 501737ba
	stba	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = f41737ba
!	%l4 = 94495cf4, %l5 = e87aaa91, Mem[0000000030101410] = 00000046 000000a9
	stda	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 94495cf4 e87aaa91
!	Mem[0000000010081414] = af186a00, %l1 = 0000000000000052
	ldstuba	[%i2+0x014]%asi,%l1	! %l1 = 000000af000000ff
!	%l0 = ffffffffe7278ef3, Mem[0000000010141400] = e6702cea
	stba	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = e6702cf3
!	Mem[0000000010041438] = 93456004, %l2 = 0000000000005296
	ldstub	[%i1+0x038],%l2		! %l2 = 00000093000000ff
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_1:
!	%l0 = ffffffffe7278ef3
	setx	0xf43a21d8571a5a58,%g7,%l0 ! %l0 = f43a21d8571a5a58
!	%l1 = 00000000000000af
	setx	0x108d42505620df35,%g7,%l1 ! %l1 = 108d42505620df35
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f43a21d8571a5a58
	setx	0xb46f8b10113d9173,%g7,%l0 ! %l0 = b46f8b10113d9173
!	%l1 = 108d42505620df35
	setx	0x9be6efd86090664c,%g7,%l1 ! %l1 = 9be6efd86090664c

p0_label_25:
!	Mem[0000000030141408] = aa910000, %f20 = 006a18af
	lda	[%i5+%o4]0x81,%f20	! %f20 = aa910000
!	Mem[0000000010181434] = 17c0a3f4, %l7 = ffffffffc6e50b8c
	ldsha	[%i6+0x034]%asi,%l7	! %l7 = 00000000000017c0
!	Mem[00000000100c1410] = 52000000, %f21 = 96fbc312
	lda	[%i3+%o5]0x88,%f21	! %f21 = 52000000
!	Mem[0000000010101410] = 092560f8, %l1 = 9be6efd86090664c
	ldsha	[%i4+%o5]0x88,%l1	! %l1 = 00000000000060f8
!	Mem[0000000030001410] = 94495cf4, %l5 = 00000000e87aaa91
	lduwa	[%i0+%o5]0x89,%l5	! %l5 = 0000000094495cf4
!	Mem[0000000030041408] = c6e502e1, %f28 = 91aa7ae8
	lda	[%i1+%o4]0x89,%f28	! %f28 = c6e502e1
!	%f29 = ef868c3a, %f20 = aa910000, %f20 = aa910000 52000000
	fsmuld	%f29,%f20,%f20		! %f20 = 43530d5b 36800000
!	Mem[0000000030141408] = aa910000 000000a9, %l4 = 94495cf4, %l5 = 94495cf4
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 00000000aa910000 00000000000000a9
!	Mem[0000000030101408] = c2e5d1ff, %l5 = 00000000000000a9
	ldsha	[%i4+%o4]0x89,%l5	! %l5 = ffffffffffffd1ff
!	Starting 10 instruction Store Burst
!	%l6 = 000000f4, %l7 = 000017c0, Mem[0000000030101408] = c2e5d1ff f7d99c0b
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000f4 000017c0

p0_label_26:
!	%l1 = 00000000000060f8, Mem[0000000010041408] = 054a6bc3
	stwa	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 000060f8
!	%l4 = aa910000, %l5 = ffffd1ff, Mem[0000000010081410] = 12c3fb96 ff186a00
	stda	%l4,[%i2+0x010]%asi	! Mem[0000000010081410] = aa910000 ffffd1ff
!	Mem[0000000010101400] = ef868c3a, %l2 = 0000000000000093
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 0000003a000000ff
!	Code Fragment 3
p0_fragment_2:
!	%l0 = b46f8b10113d9173
	setx	0x71ec39580f8ea139,%g7,%l0 ! %l0 = 71ec39580f8ea139
!	%l1 = 00000000000060f8
	setx	0x59872d086dad8bfe,%g7,%l1 ! %l1 = 59872d086dad8bfe
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 71ec39580f8ea139
	setx	0xc05b804fa4bec229,%g7,%l0 ! %l0 = c05b804fa4bec229
!	%l1 = 59872d086dad8bfe
	setx	0xfe83c247c35cab33,%g7,%l1 ! %l1 = fe83c247c35cab33
!	Mem[0000000030101408] = 000000f4, %l1 = fe83c247c35cab33
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 000000f4000000ff
!	%l2 = 0000003a, %l3 = 00000004, Mem[0000000010041410] = 60b37d12 8685b60f
	stda	%l2,[%i1+0x010]%asi	! Mem[0000000010041410] = 0000003a 00000004
!	Mem[00000000100c1428] = c5e0d3b9, %l0 = c05b804fa4bec229
	ldstub	[%i3+0x028],%l0		! %l0 = 000000c5000000ff
!	Mem[0000000030081400] = 00000060, %l2 = 000000000000003a
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 00000060000000ff
!	%f22 = 5d2b4d48 6e662eef, %l2 = 0000000000000060
!	Mem[0000000030041430] = 60d8ebf72d2ddae3
	add	%i1,0x030,%g1
	stda	%f22,[%g1+%l2]ASI_PST16_S ! Mem[0000000030041430] = 60d8ebf72d2ddae3
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = a2572ae279fcb45e, %f12 = 7f400752 361be08e
	ldda	[%i5+%o5]0x81,%f12	! %f12 = a2572ae2 79fcb45e

p0_label_27:
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 00000000000000c5
	setx	0x49b6502fbf06514a,%g7,%l0 ! %l0 = 49b6502fbf06514a
!	%l1 = 00000000000000f4
	setx	0x907dca6794a1302b,%g7,%l1 ! %l1 = 907dca6794a1302b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 49b6502fbf06514a
	setx	0xdf0a29af926fa878,%g7,%l0 ! %l0 = df0a29af926fa878
!	%l1 = 907dca6794a1302b
	setx	0x93a6df1fe98dc842,%g7,%l1 ! %l1 = 93a6df1fe98dc842
!	Mem[0000000030041400] = 5c005b29, %l6 = 00000000000000f4
	ldsha	[%i1+%g0]0x81,%l6	! %l6 = 0000000000005c00
!	Mem[0000000010081428] = c7fb8363, %l2 = 0000000000000060
	lduba	[%i2+0x02a]%asi,%l2	! %l2 = 0000000000000083
!	Mem[000000001000141c] = 47c7492b, %l5 = ffffffffffffd1ff
	lduwa	[%i0+0x01c]%asi,%l5	! %l5 = 0000000047c7492b
!	Mem[0000000010041408] = f8600000, %l2 = 0000000000000083
	lduwa	[%i1+%o4]0x88,%l2	! %l2 = 00000000f8600000
!	Mem[0000000010141410] = f7d99c0b 19d5d19b, %l4 = aa910000, %l5 = 47c7492b
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 00000000f7d99c0b 0000000019d5d19b
!	Mem[00000000300c1410] = 5c000000, %l3 = 0000000000000004
	lduba	[%i3+%o5]0x81,%l3	! %l3 = 000000000000005c
!	Mem[0000000010041428] = 00000000dfaee5f8, %l3 = 000000000000005c
	ldxa	[%i1+0x028]%asi,%l3	! %l3 = 00000000dfaee5f8
!	%l3 = 00000000dfaee5f8, %l6 = 0000000000005c00, %l2 = 00000000f8600000
	subc	%l3,%l6,%l2		! %l2 = 00000000dfae89f8
!	Starting 10 instruction Store Burst
!	%l2 = dfae89f8, %l3 = dfaee5f8, Mem[0000000030041410] = 3221c248 583d2e41
	stda	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = dfae89f8 dfaee5f8

p0_label_28:
!	%l5 = 0000000019d5d19b, Mem[0000000010081430] = 3a8c86efd10841fe, %asi = 80
	stxa	%l5,[%i2+0x030]%asi	! Mem[0000000010081430] = 0000000019d5d19b
!	Mem[00000000211c0000] = f9d5f58c, %l0 = df0a29af926fa878
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 000000f9000000ff
!	%f0  = 00000000 00000000, Mem[0000000010101438] = e78f805c 092528b7
	std	%f0 ,[%i4+0x038]	! Mem[0000000010101438] = 00000000 00000000
!	%l6 = 0000000000005c00, Mem[0000000010041410] = 040000003a000000
	stxa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000005c00
!	%l3 = 00000000dfaee5f8, Mem[0000000030041410] = dfae89f8dfaee5f8
	stxa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000dfaee5f8
!	%l4 = 00000000f7d99c0b, Mem[00000000201c0001] = ffae0197
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = ff0b0197
!	%l0 = 00000000000000f9, Mem[0000000010141410] = 0b9cd9f7
	stba	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0b9cd9f9
!	%l7 = 00000000000017c0, Mem[0000000030081410] = ff2e666e
	stba	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = c02e666e
!	%l4 = 00000000f7d99c0b, Mem[0000000030141408] = 000091aa
	stha	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00009c0b
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000, %l6 = 0000000000005c00
	lduba	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000

p0_label_29:
!	Mem[0000000010141434] = ff49bfdb, %l0 = 00000000000000f9
	lduwa	[%i5+0x034]%asi,%l0	! %l0 = 00000000ff49bfdb
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 00000000ff49bfdb
	setx	0x5821fb7fbf5e463f,%g7,%l0 ! %l0 = 5821fb7fbf5e463f
!	%l1 = 93a6df1fe98dc842
	setx	0x344a1f47df7fa27d,%g7,%l1 ! %l1 = 344a1f47df7fa27d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5821fb7fbf5e463f
	setx	0x4ad6d507a8450d89,%g7,%l0 ! %l0 = 4ad6d507a8450d89
!	%l1 = 344a1f47df7fa27d
	setx	0xa02f79afea1bab11,%g7,%l1 ! %l1 = a02f79afea1bab11
!	Mem[0000000010181408] = e7278ef3, %l5 = 0000000019d5d19b
	ldsba	[%i6+%o4]0x88,%l5	! %l5 = fffffffffffffff3
!	Mem[00000000300c1400] = 295b005c, %l0 = 4ad6d507a8450d89
	ldsba	[%i3+%g0]0x89,%l0	! %l0 = 000000000000005c
!	Mem[00000000300c1400] = 295b005c, %f0  = 00000000
	lda	[%i3+%g0]0x89,%f0 	! %f0 = 295b005c
!	Mem[0000000030141400] = d259281148c22132, %l1 = a02f79afea1bab11
	ldxa	[%i5+%g0]0x89,%l1	! %l1 = d259281148c22132
!	Mem[0000000010081400] = 00005296, %l4 = 00000000f7d99c0b
	lduwa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000005296
!	Mem[0000000010101428] = c7fb8363, %l1 = d259281148c22132
	ldsh	[%i4+0x028],%l1		! %l1 = ffffffffffffc7fb
!	Mem[0000000021800180] = ff84ed8e, %l5 = fffffffffffffff3
	ldsh	[%o3+0x180],%l5		! %l5 = ffffffffffffff84
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = cf157334, %l3 = 00000000dfaee5f8
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 000000cf000000ff

p0_label_30:
!	%l2 = 00000000dfae89f8, Mem[0000000030181408] = 9652e109cc404a0d
	stxa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000dfae89f8
!	%f26 = 6eccb852, Mem[0000000010141400] = e6702cf3
	sta	%f26,[%i5+%g0]0x88	! Mem[0000000010141400] = 6eccb852
!	%l7 = 00000000000017c0, Mem[0000000010141410] = 9bd1d5190b9cd9f9
	stxa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000017c0
!	Mem[0000000030141410] = e22a57a2, %l1 = ffffffffffffc7fb
	ldstuba	[%i5+%o5]0x89,%l1	! %l1 = 000000a2000000ff
!	%l1 = 00000000000000a2, Mem[0000000030081410] = c02e666e
	stwa	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000a2
!	%l4 = 0000000000005296, Mem[0000000020800000] = 24d37ff0, %asi = 80
	stba	%l4,[%o1+0x000]%asi	! Mem[0000000020800000] = 96d37ff0
!	%l0 = 0000005c, %l1 = 000000a2, Mem[0000000010081400] = 00005296 c96c1564
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000005c 000000a2
!	Mem[0000000020800000] = 96d37ff0, %l1 = 00000000000000a2
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 00000096000000ff
!	%f28 = c6e502e1 ef868c3a, %l7 = 00000000000017c0
!	Mem[0000000030081408] = eab27ac30fb2e0f4
	add	%i2,0x008,%g1
	stda	%f28,[%g1+%l7]ASI_PST32_S ! Mem[0000000030081408] = eab27ac30fb2e0f4
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 7407d1cc, %l4 = 0000000000005296
	ldsh	[%i1+0x030],%l4		! %l4 = 0000000000007407

p0_label_31:
!	Mem[0000000010141410] = 000017c0, %l1 = 0000000000000096
	lduba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000c0
!	Mem[0000000030101400] = d6755a69, %l2 = 00000000dfae89f8
	ldswa	[%i4+%g0]0x89,%l2	! %l2 = ffffffffd6755a69
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 000000000000005c
	setx	0x190fda8fa3938f50,%g7,%l0 ! %l0 = 190fda8fa3938f50
!	%l1 = 00000000000000c0
	setx	0x8d1c5b17e3bd0874,%g7,%l1 ! %l1 = 8d1c5b17e3bd0874
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 190fda8fa3938f50
	setx	0x240e68e7bbb63b03,%g7,%l0 ! %l0 = 240e68e7bbb63b03
!	%l1 = 8d1c5b17e3bd0874
	setx	0x728e73ff9013e10e,%g7,%l1 ! %l1 = 728e73ff9013e10e
!	Mem[0000000010141400] = 52b8cc6e, %f10 = c5e0d3b9
	lda	[%i5+%g0]0x80,%f10	! %f10 = 52b8cc6e
!	Mem[0000000010001400] = c6e502e1 e22a57a2, %l0 = bbb63b03, %l1 = 9013e10e
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000c6e502e1 00000000e22a57a2
!	Mem[0000000010141418] = fff3b3150b9cd9f7, %f0  = 295b005c 00000000
	ldda	[%i5+0x018]%asi,%f0 	! %f0  = fff3b315 0b9cd9f7
!	Mem[0000000030141400] = 3221c248, %l0 = 00000000c6e502e1
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = 000000003221c248
!	Mem[0000000030081400] = 000000ff, %l6 = 0000000000000000
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141408] = 00009c0b, %f7  = f8000000
	lda	[%i5+%o4]0x89,%f7 	! %f7 = 00009c0b
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 00000000, %l1 = e22a57a2, %l7 = 000017c0
	casa	[%i3]0x80,%l1,%l7	! %l7 = 0000000000000000

p0_label_32:
!	%l7 = 0000000000000000, Mem[0000000010181400] = 5c0000006e66fb00
	stxa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000000
!	%l2 = d6755a69, %l3 = 000000cf, Mem[0000000010101438] = 00000000 00000000
	stda	%l2,[%i4+0x038]%asi	! Mem[0000000010101438] = d6755a69 000000cf
!	%l6 = 00000000000000ff, Mem[0000000030001400] = bb6bcda2e7278ef3
	stxa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000000000ff
!	%f16 = 64156cc9 47fbeea9, Mem[0000000030041408] = e102e5c6 271a0bdf
	stda	%f16,[%i1+%o4]0x81	! Mem[0000000030041408] = 64156cc9 47fbeea9
!	%f16 = 64156cc9 47fbeea9, Mem[0000000030041400] = 295b005c e102e5c6
	stda	%f16,[%i1+%g0]0x89	! Mem[0000000030041400] = 64156cc9 47fbeea9
!	%f10 = 52b8cc6e, Mem[0000000030041410] = 00000000
	sta	%f10,[%i1+%o5]0x89	! Mem[0000000030041410] = 52b8cc6e
!	Mem[00000000100c141c] = 8f2b7ac9, %l5 = ffffff84, %l7 = 00000000
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 000000008f2b7ac9
!	%f6  = 5dc1e4ff 00009c0b, %l7 = 000000008f2b7ac9
!	Mem[0000000030081420] = f4043d401f9967de
	add	%i2,0x020,%g1
	stda	%f6,[%g1+%l7]ASI_PST8_S ! Mem[0000000030081420] = 5dc13d400099670b
!	%l2 = ffffffffd6755a69, Mem[0000000030141408] = 00009c0b
	stba	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00009c69
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 5c000000, %l6 = 00000000000000ff
	lduwa	[%i3+%o5]0x81,%l6	! %l6 = 000000005c000000

p0_label_33:
!	Mem[0000000010081408] = ba3717f4, %l1 = 00000000e22a57a2
	ldsha	[%i2+%o4]0x88,%l1	! %l1 = 00000000000017f4
!	Mem[0000000030041408] = a9eefb47c96c1564, %f2  = ff6683ae 5edd9971
	ldda	[%i1+%o4]0x89,%f2 	! %f2  = a9eefb47 c96c1564
!	Mem[00000000100c1408] = 000000f8, %l1 = 00000000000017f4
	ldswa	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000f8
!	Mem[0000000030181400] = 00000000, %l0 = 000000003221c248
	lduba	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = 0000000000005c00, %f2  = a9eefb47 c96c1564
	ldda	[%i1+%o5]0x88,%f2 	! %f2  = 00000000 00005c00
!	Mem[0000000030101400] = 695a75d6, %l4 = 0000000000007407
	ldsba	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000069
!	Mem[0000000010041410] = 005c0000 00000000, %l6 = 5c000000, %l7 = 8f2b7ac9
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 00000000005c0000 0000000000000000
!	%l2 = ffffffffd6755a69, imm = 0000000000000790, %l5 = ffffffffffffff84
	subc	%l2,0x790,%l5		! %l5 = ffffffffd67552d9
!	Mem[0000000030101408] = ff000000, %l6 = 00000000005c0000
	ldswa	[%i4+%o4]0x81,%l6	! %l6 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%f16 = 64156cc9 47fbeea9, %l5 = ffffffffd67552d9
!	Mem[0000000030041420] = 5e600eb66985defb
	add	%i1,0x020,%g1
	stda	%f16,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030041420] = a9600e47c9851564

p0_label_34:
!	%l7 = 0000000000000000, Mem[0000000030001410] = f45c4994fe4108d1
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000
!	%l4 = 0000000000000069, Mem[0000000030101410] = 94495cf4
	stha	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 94490069
!	%f0  = fff3b315 0b9cd9f7, Mem[0000000010041408] = f8600000 fe011be2
	stda	%f0 ,[%i1+%o4]0x88	! Mem[0000000010041408] = fff3b315 0b9cd9f7
!	%f23 = 6e662eef, %f4  = 00000052, %f0  = fff3b315
	fadds	%f23,%f4 ,%f0 		! %l0 = 0000000000000022, Unfinished, %fsr = 0200000000
!	%l0 = 0000000000000022, Mem[0000000030181410] = 00000032
	stha	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00220032
!	%l7 = 0000000000000000, Mem[0000000010001400] = e102e5c6
	stba	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = e102e500
!	Mem[0000000010081430] = 0000000019d5d19b, %l6 = ffffffffff000000, %l1 = 00000000000000f8
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 0000000019d5d19b
!	%l1 = 0000000019d5d19b, Mem[0000000030141408] = 00009c69
	stba	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 00009c9b
!	%l1 = 0000000019d5d19b, Mem[0000000010081408] = f41737ba
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 9b1737ba
!	Starting 10 instruction Load Burst
!	%l1 = 0000000019d5d19b, imm = fffffffffffffa17, %l5 = ffffffffd67552d9
	subc	%l1,-0x5e9,%l5		! %l5 = 0000000019d5d784

p0_label_35:
!	Mem[00000000300c1410] = 0000005c, %l0 = 0000000000000022
	lduba	[%i3+%o5]0x89,%l0	! %l0 = 000000000000005c
!	Mem[00000000300c1410] = 0000005c, %l3 = 00000000000000cf
	ldsha	[%i3+%o5]0x89,%l3	! %l3 = 000000000000005c
!	Mem[00000000300c1408] = 52000000, %l5 = 0000000019d5d784
	lduwa	[%i3+%o4]0x81,%l5	! %l5 = 0000000052000000
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010001400] = 00e502e1 e22a57a2 9652e109 462ee53a
!	Mem[0000000010001410] = 04af2fab 0792203f 340c95e4 47c7492b
!	Mem[0000000010001420] = 0fda436a f0123356 bcc28440 e9fe58b4
!	Mem[0000000010001430] = ffffffff fff3b315 00003ed1 ea2c70e6
	ldda	[%i0]ASI_BLK_PL,%f0	! Block Load from 0000000010001400
!	Mem[0000000030181400] = 00000000, %l2 = ffffffffd6755a69
	ldswa	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = ff000000, %l2 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[00000000300c1400] = 295b005c, %f30 = b7282509
	lda	[%i3+%g0]0x89,%f30	! %f30 = 295b005c
!	Mem[0000000010041408] = 0b9cd9f7, %l6 = ffffffffff000000
	ldswa	[%i1+%o4]0x88,%l6	! %l6 = 000000000b9cd9f7
!	Mem[00000000211c0000] = ffd5f58c, %l4 = 0000000000000069
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffffd5
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000005c, Mem[0000000030141408] = 00009c9b
	stwa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000005c

p0_label_36:
!	%f20 = 43530d5b, Mem[00000000300c1408] = 00000052
	sta	%f20,[%i3+%o4]0x89	! Mem[00000000300c1408] = 43530d5b
!	%l6 = 000000000b9cd9f7, Mem[000000001008140a] = 9b1737ba
	sth	%l6,[%i2+0x00a]		! Mem[0000000010081408] = 9b17d9f7
!	Mem[00000000300c1400] = 295b005c, %l6 = 000000000b9cd9f7
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 0000005c000000ff
!	%l3 = 000000000000005c, Mem[0000000010181420] = bbe115c9fe596a5a, %asi = 80
	stxa	%l3,[%i6+0x020]%asi	! Mem[0000000010181420] = 000000000000005c
!	%l0 = 0000005c, %l1 = 19d5d19b, Mem[0000000030081410] = 000000a2 484d2b5d
	stda	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000005c 19d5d19b
!	Mem[0000000010041410] = 005c0000, %l7 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l7	! %l7 = 00000000005c0000
!	Mem[0000000010001400] = 00e502e1, %l3 = 000000000000005c
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l0 = 000000000000005c
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[00000000300c1408] = 5b0d5343
	stwa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ef868cff, %l7 = 00000000005c0000
	ldswa	[%i4+%g0]0x88,%l7	! %l7 = ffffffffef868cff

p0_label_37:
!	Mem[0000000010081400] = a2000000 5c000000, %l2 = 0000ff00, %l3 = 00000000
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 000000005c000000 00000000a2000000
!	Mem[000000001018141c] = e87aaa91, %f23 = 6e662eef
	lda	[%i6+0x01c]%asi,%f23	! %f23 = e87aaa91
!	Mem[0000000030041410] = 6eccb852dfaee5f8, %l1 = 0000000019d5d19b
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = 6eccb852dfaee5f8
!	Mem[0000000010101410] = f8602509, %f22 = 5d2b4d48
	lda	[%i4+0x010]%asi,%f22	! %f22 = f8602509
!	Mem[0000000010001410] = ab2faf04, %l5 = 0000000052000000
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000004
!	Mem[0000000010141408] = 60000000, %l2 = 000000005c000000
	lduwa	[%i5+%o4]0x80,%l2	! %l2 = 0000000060000000
!	Mem[0000000021800100] = ffbd39f1, %l0 = 0000000000000000
	lduha	[%o3+0x100]%asi,%l0	! %l0 = 000000000000ffbd
!	Mem[0000000030081410] = 0000005c, %l5 = 0000000000000004
	lduba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = 94490069, %l0 = 000000000000ffbd
	ldsba	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000069
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ff0b0197, %l6 = 000000000000005c
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 000000ff000000ff

p0_label_38:
!	%f26 = 6eccb852 6383fbc7, %l3 = 00000000a2000000
!	Mem[0000000030141408] = 5c000000000000a9
	add	%i5,0x008,%g1
	stda	%f26,[%g1+%l3]ASI_PST32_S ! Mem[0000000030141408] = 5c000000000000a9
!	Mem[0000000030141408] = 5c000000, %l1 = 6eccb852dfaee5f8
	ldstuba	[%i5+%o4]0x81,%l1	! %l1 = 0000005c000000ff
!	%l6 = 000000ff, %l7 = ef868cff, Mem[0000000010141410] = 000017c0 00000000
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff ef868cff
!	%l6 = 00000000000000ff, Mem[0000000010081410] = 000091aa
	stha	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	%l0 = 00000069, %l1 = 0000005c, Mem[0000000030081408] = eab27ac3 0fb2e0f4
	stda	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000069 0000005c
!	Mem[0000000030141408] = 000000ff, %l3 = 00000000a2000000
	ldstuba	[%i5+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[000000001010140c] = 6e662eef, %l5 = 0000000000000000
	swap	[%i4+0x00c],%l5		! %l5 = 000000006e662eef
!	Mem[0000000030181410] = 32002200, %l6 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 0000000032002200
!	%f18 = 93b2eb62 ba371750, %l2 = 0000000060000000
!	Mem[0000000010041438] = ff456004ab2faf04
	add	%i1,0x038,%g1
	stda	%f18,[%g1+%l2]ASI_PST32_P ! Mem[0000000010041438] = ff456004ab2faf04
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = e7278ef3, %l1 = 000000000000005c
	lduba	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000f3

p0_label_39:
!	Mem[00000000201c0000] = ff0b0197, %l6 = 0000000032002200
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 000000000000000b
!	Mem[0000000010101438] = d6755a69 000000cf, %l0 = 00000069, %l1 = 000000f3
	ldda	[%i4+0x038]%asi,%l0	! %l0 = 00000000d6755a69 00000000000000cf
!	%l2 = 0000000060000000, immed = fffff1cb, %y  = 00000000
	umul	%l2,-0xe35,%l2		! %l2 = 5ffffaac20000000, %y = 5ffffaac
!	Mem[0000000030141400] = 48c22132, %l6 = 000000000000000b
	ldswa	[%i5+%g0]0x89,%l6	! %l6 = 0000000048c22132
!	%f30 = 295b005c 5c808fe7, Mem[0000000010041408] = 0b9cd9f7 fff3b315
	stda	%f30,[%i1+%o4]0x88	! Mem[0000000010041408] = 295b005c 5c808fe7
!	Mem[0000000010141400] = 6eccb852, %l1 = 00000000000000cf
	lduha	[%i5+%g0]0x88,%l1	! %l1 = 000000000000b852
!	%l2 = 5ffffaac20000000, imm = fffffffffffff9db, %l3 = 00000000000000ff
	orn	%l2,-0x625,%l3		! %l3 = 5ffffaac20000624
!	Mem[00000000218001c0] = 2ab55ac0, %l6 = 0000000048c22132
	ldsh	[%o3+0x1c0],%l6		! %l6 = 0000000000002ab5
!	Mem[00000000201c0000] = ff0b0197, %l7 = ffffffffef868cff
	ldsh	[%o0+%g0],%l7		! %l7 = ffffffffffffff0b
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ff0b0197, %l2 = 5ffffaac20000000
	ldstub	[%o0+0x001],%l2		! %l2 = 0000000b000000ff

p0_label_40:
!	%f23 = e87aaa91, Mem[0000000030041408] = c96c1564
	sta	%f23,[%i1+%o4]0x89	! Mem[0000000030041408] = e87aaa91
!	Mem[0000000030141408] = 000000ff, %l4 = ffffffffffffffd5
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = 6e662eef, Mem[00000000100c1400] = ff000000 00000000
	std	%l4,[%i3+%g0]		! Mem[00000000100c1400] = 000000ff 6e662eef
!	Mem[00000000300c1408] = 00000000, %l0 = 00000000d6755a69
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (9)
!	%l0 = 0000000000000000, Mem[0000000010001402] = ffe502e1, %asi = 80
	stba	%l0,[%i0+0x002]%asi	! Mem[0000000010001400] = ffe500e1
!	Mem[0000000010181420] = 00000000, %l7 = ffffffffffffff0b, %asi = 80
	swapa	[%i6+0x020]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101430] = 3a8c86efe87aaa91, %l1 = 000000000000b852, %l6 = 0000000000002ab5
	add	%i4,0x30,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 3a8c86efe87aaa91
!	%f24 = 93b2eb62 ba371750, Mem[0000000030181410] = 000000ff 7a94bcc4
	stda	%f24,[%i6+%o5]0x89	! Mem[0000000030181410] = 93b2eb62 ba371750
!	%l0 = 0000000000000000, Mem[0000000010101400] = ef868cff
	stha	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = ef860000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 3221c248112859d2, %f0  = a2572ae2 e102e500
	ldda	[%i5+%g0]0x81,%f0 	! %f0  = 3221c248 112859d2

p0_label_41:
!	Mem[0000000010181408] = f38e27e7, %l0 = 0000000000000000
	ldswa	[%i6+0x008]%asi,%l0	! %l0 = fffffffff38e27e7
!	Mem[0000000030001408] = 5e000000, %l5 = 000000006e662eef
	ldsba	[%i0+%o4]0x81,%l5	! %l5 = 000000000000005e
!	Mem[0000000030081400] = ff000000, %f22 = f8602509
	lda	[%i2+%g0]0x81,%f22	! %f22 = ff000000
!	Mem[00000000201c0000] = ffff0197, %l3 = 5ffffaac20000624
	lduh	[%o0+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010101408] = 5d2b4d4800000000, %l4 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l4	! %l4 = 5d2b4d4800000000
!	Mem[0000000030101400] = d6755a69, %l2 = 000000000000000b
	ldsba	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000069
!	Mem[0000000030181410] = 501737ba, %f25 = ba371750
	lda	[%i6+%o5]0x81,%f25	! %f25 = 501737ba
!	Mem[0000000030041408] = 91aa7ae8, %l2 = 0000000000000069
	ldsba	[%i1+%o4]0x81,%l2	! %l2 = ffffffffffffff91
!	Mem[0000000030101408] = 000000ff, %l6 = 3a8c86efe87aaa91
	lduha	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = d6755a69, %l2 = ffffffffffffff91
	ldstuba	[%i4+%g0]0x89,%l2	! %l2 = 00000069000000ff

p0_label_42:
!	%l3 = 000000000000ffff, Mem[0000000010081400] = 5c000000
	stba	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 5c0000ff
!	Mem[0000000010001400] = ffe500e1, %l1 = 000000000000b852
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ffe500e1
!	%l7 = 0000000000000000, Mem[00000000300c1400] = 295b00ff
	stwa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%f20 = 43530d5b 36800000, Mem[00000000100c1400] = ff000000 ef2e666e
	stda	%f20,[%i3+%g0]0x88	! Mem[00000000100c1400] = 43530d5b 36800000
!	Mem[0000000010181410] = 5ea7019c, %l6 = 00000000000000ff
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 000000005ea7019c
!	%f14 = e6702cea, Mem[000000001004143c] = ab2faf04
	sta	%f14,[%i1+0x03c]%asi	! Mem[000000001004143c] = e6702cea
!	%f0  = 3221c248 112859d2 3ae52e46 09e15296
!	%f4  = 3f209207 ab2faf04 2b49c747 e4950c34
!	%f8  = 563312f0 6a43da0f b458fee9 4084c2bc
!	%f12 = 15b3f3ff ffffffff e6702cea d13e0000
	stda	%f0,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	%l2 = 0000000000000069, Mem[0000000030141408] = ff000000
	stba	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 69000000
!	%l7 = 0000000000000000, Mem[0000000030041408] = 91aa7ae847fbeea9
	stxa	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	%l7 = 0000000000000000, %l4 = 5d2b4d4800000000, %l0 = fffffffff38e27e7
	andn	%l7,%l4,%l0		! %l0 = 0000000000000000

p0_label_43:
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 0000000000000000
	setx	0xe40ab2279e83c425,%g7,%l0 ! %l0 = e40ab2279e83c425
!	%l1 = 00000000ffe500e1
	setx	0xdda67bb79b904a6a,%g7,%l1 ! %l1 = dda67bb79b904a6a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e40ab2279e83c425
	setx	0x7a02d7a023e04b32,%g7,%l0 ! %l0 = 7a02d7a023e04b32
!	%l1 = dda67bb79b904a6a
	setx	0x975e204792a13755,%g7,%l1 ! %l1 = 975e204792a13755
!	Mem[0000000030041408] = 00000000, %f21 = 36800000
	lda	[%i1+%o4]0x89,%f21	! %f21 = 00000000
!	Mem[00000000211c0000] = ffd5f58c, %l5 = 000000000000005e
	ldsb	[%o2+0x001],%l5		! %l5 = ffffffffffffffd5
!	Mem[0000000030081400] = ff000000ff8eae99, %f22 = ff000000 e87aaa91
	ldda	[%i2+%g0]0x81,%f22	! %f22 = ff000000 ff8eae99
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 7a02d7a023e04b32
	setx	0x85e37c780128110d,%g7,%l0 ! %l0 = 85e37c780128110d
!	%l1 = 975e204792a13755
	setx	0x531a3037ade8a850,%g7,%l1 ! %l1 = 531a3037ade8a850
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 85e37c780128110d
	setx	0x6ae829582c12740b,%g7,%l0 ! %l0 = 6ae829582c12740b
!	%l1 = 531a3037ade8a850
	setx	0xb371e40840a088a1,%g7,%l1 ! %l1 = b371e40840a088a1
!	Mem[00000000300c1410] = 5c0000007ad38136, %l7 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = 5c0000007ad38136
!	Mem[0000000030041400] = 47fbeea9, %f25 = 501737ba
	lda	[%i1+%g0]0x89,%f25	! %f25 = 47fbeea9
!	Mem[0000000010001408] = 9652e109, %l6 = 000000005ea7019c
	lduha	[%i0+%o4]0x80,%l6	! %l6 = 0000000000009652
!	%l1 = b371e40840a088a1, imm = 00000000000005c0, %l4 = 5d2b4d4800000000
	orn	%l1,0x5c0,%l4		! %l4 = fffffffffffffabf
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000069, Mem[0000000010081400] = 5c0000ff
	stha	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 5c000069

p0_label_44:
!	%l5 = ffffffffffffffd5, Mem[0000000020800040] = ffff6b19
	sth	%l5,[%o1+0x040]		! Mem[0000000020800040] = ffd56b19
!	%l6 = 0000000000009652, Mem[00000000100c1408] = 60000000000000f8
	stxa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000009652
!	Mem[0000000010001400] = 0000b852, %l7 = 5c0000007ad38136
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030101408] = 09e15296
	stha	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 09e10000
!	Mem[0000000010041411] = 00000000, %l0 = 6ae829582c12740b
	ldstub	[%i1+0x011],%l0		! %l0 = 00000000000000ff
!	Mem[0000000020800000] = ffd37ff0, %l4 = fffffffffffffabf
	ldstuba	[%o1+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000218000c0] = 2f456ac2, %l1 = b371e40840a088a1
	ldstub	[%o3+0x0c0],%l1		! %l1 = 0000002f000000ff
!	%f25 = 47fbeea9, %f28 = c6e502e1, %f7  = e4950c34
	fadds	%f25,%f28,%f7 		! %f7  = 47c2adf1
!	%l0 = 00000000, %l1 = 0000002f, Mem[0000000010001410] = ab2faf04 3f209207
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 0000002f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = a9eefb47, %l2 = 0000000000000069
	ldsba	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffffa9

p0_label_45:
!	Mem[00000000300c1410] = 5c000000 7ad38136, %l4 = 000000ff, %l5 = ffffffd5
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 000000005c000000 000000007ad38136
!	Mem[0000000030081410] = 5c000000, %l4 = 000000005c000000
	lduha	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = e7278ef3, %l1 = 000000000000002f
	ldswa	[%i6+%o4]0x88,%l1	! %l1 = ffffffffe7278ef3
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010101438] = d6755a69, %l1 = ffffffffe7278ef3
	ldsb	[%i4+0x03a],%l1		! %l1 = 000000000000005a
!	Mem[0000000030081408] = 69000000, %l4 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = f38e27e7, %l2 = ffffffffffffffa9
	ldswa	[%i6+%o4]0x80,%l2	! %l2 = fffffffff38e27e7
!	Mem[0000000030141410] = e22a57ff, %l1 = 000000000000005a
	lduwa	[%i5+%o5]0x89,%l1	! %l1 = 00000000e22a57ff
!	Mem[0000000021800140] = a19bd3d6, %l0 = 0000000000000000
	lduh	[%o3+0x140],%l0		! %l0 = 000000000000a19b
!	Mem[0000000010001400] = ff00b852, %l4 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l4	! %l4 = 00000000ff00b852
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000ffff, Mem[0000000030081408] = 000000690000005c
	stxa	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000000000ffff

p0_label_46:
!	%l1 = 00000000e22a57ff, Mem[00000000201c0000] = ffff0197
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = ffff0197
!	%l6 = 0000000000009652, Mem[0000000030101410] = 04af2fab
	stwa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00009652
!	%l2 = fffffffff38e27e7, Mem[00000000100c1408] = 52960000
	stba	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = e7960000
!	Mem[0000000030081408] = 00000000, %l0 = 000000000000a19b
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 48c22132, %l4 = 00000000ff00b852
	ldstuba	[%i5+%g0]0x89,%l4	! %l4 = 00000032000000ff
!	%l4 = 00000032, %l5 = 7ad38136, Mem[0000000010101408] = 484d2b5d 00000000
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000032 7ad38136
!	%f30 = 295b005c 5c808fe7, Mem[0000000030101408] = 09e10000 3ae52e46
	stda	%f30,[%i4+%o4]0x89	! Mem[0000000030101408] = 295b005c 5c808fe7
!	Mem[0000000030081400] = 000000ff, %l6 = 0000000000009652
	ldstuba	[%i2+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010081428] = c7fb8363, %l3 = 0000ffff, %l0 = 00000000
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 00000000c7fb8363
!	Starting 10 instruction Load Burst
!	%l5 = 000000007ad38136, %l2 = fffffffff38e27e7, %l2 = fffffffff38e27e7
	sdivx	%l5,%l2,%l2		! %l2 = fffffffffffffff7

p0_label_47:
!	Mem[0000000010001408] = 09e15296, %l5 = 000000007ad38136
	ldswa	[%i0+%o4]0x88,%l5	! %l5 = 0000000009e15296
!	Mem[0000000030141410] = 5eb4fc79e22a57ff, %f22 = ff000000 ff8eae99
	ldda	[%i5+%o5]0x89,%f22	! %f22 = 5eb4fc79 e22a57ff
!	Mem[0000000030081410] = 5c000000, %l4 = 0000000000000032
	lduba	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141428] = 17ee7a79 31eddc7e, %l2 = fffffff7, %l3 = 0000ffff
	ldd	[%i5+0x028],%l2		! %l2 = 0000000017ee7a79 0000000031eddc7e
!	Mem[00000000100c1404] = 5b0d5343, %l6 = 00000000000000ff
	ldsh	[%i3+0x004],%l6		! %l6 = 0000000000005b0d
!	Mem[0000000030181408] = 00000000dfae89f8, %f4  = 3f209207 ab2faf04
	ldda	[%i6+%o4]0x81,%f4 	! %f4  = 00000000 dfae89f8
!	Mem[00000000100c1400] = 43530d5b36800000, %l7 = 0000000000000000
	ldxa	[%i3+%g0]0x88,%l7	! %l7 = 43530d5b36800000
!	Mem[00000000201c0000] = ffff0197, %l7 = 43530d5b36800000
	ldsba	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	%f4  = 00000000, %f29 = ef868c3a, %f24 = 93b2eb62 47fbeea9
	fsmuld	%f4 ,%f29,%f24		! %f24 = 80000000 00000000
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffff, Mem[0000000010081408] = f7d9179b
	stwa	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffff

p0_label_48:
!	%f31 = 5c808fe7, Mem[0000000010141438] = a30bd602
	st	%f31,[%i5+0x038]	! Mem[0000000010141438] = 5c808fe7
!	%f18 = 93b2eb62, Mem[0000000030141400] = 48c221ff
	sta	%f18,[%i5+%g0]0x89	! Mem[0000000030141400] = 93b2eb62
!	%f4  = 00000000 dfae89f8, %l7 = ffffffffffffffff
!	Mem[0000000030141400] = 62ebb293112859d2
	stda	%f4,[%i5+%l7]ASI_PST16_S ! Mem[0000000030141400] = 00000000dfae89f8
!	%f31 = 5c808fe7, Mem[0000000010141400] = 52b8cc6e
	sta	%f31,[%i5+%g0]0x80	! Mem[0000000010141400] = 5c808fe7
!	Mem[0000000030141400] = 00000000dfae89f8, %l0 = 00000000c7fb8363
	ldxa	[%i5+%g0]0x81,%l0	! %l0 = 00000000dfae89f8
!	Mem[0000000010041418] = 14d059cbafe44c84, %l3 = 0000000031eddc7e, %l2 = 0000000017ee7a79
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = 14d059cbafe44c84
!	%l1 = 00000000e22a57ff, Mem[0000000010141414] = ff8c86ef, %asi = 80
	stwa	%l1,[%i5+0x014]%asi	! Mem[0000000010141414] = e22a57ff
!	%l0 = 00000000dfae89f8, %l3 = 0000000031eddc7e, %l6 = 0000000000005b0d
	sub	%l0,%l3,%l6		! %l6 = 00000000adc0ad7a
!	%l5 = 0000000009e15296, Mem[0000000030101410] = 00009652
	stba	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 96009652
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 9ba10000, %l4 = 0000000000000000
	lduwa	[%i2+%o4]0x89,%l4	! %l4 = 000000009ba10000

p0_label_49:
!	%f15 = d13e0000, %f25 = 00000000, %f29 = ef868c3a
	fdivs	%f15,%f25,%f29		! %f29 = ff800000
!	Mem[0000000030101410] = 52960096, %l5 = 0000000009e15296
	lduwa	[%i4+%o5]0x89,%l5	! %l5 = 0000000052960096
!	Mem[0000000030101408] = 5c808fe7, %l2 = 14d059cbafe44c84
	ldswa	[%i4+%o4]0x89,%l2	! %l2 = 000000005c808fe7
!	Mem[0000000030181408] = f889aedf00000000, %l7 = ffffffffffffffff
	ldxa	[%i6+%o4]0x89,%l7	! %l7 = f889aedf00000000
!	Mem[00000000100c1410] = 00000052, %l0 = 00000000dfae89f8
	ldsha	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = 69000000000000a9, %l5 = 0000000052960096
	ldxa	[%i5+%o4]0x81,%l5	! %l5 = 69000000000000a9
!	Mem[0000000010181418] = 94495cf4, %f0  = 3221c248
	ld	[%i6+0x018],%f0 	! %f0 = 94495cf4
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 0000000000000000
	setx	0xb7704d67e70ba09a,%g7,%l0 ! %l0 = b7704d67e70ba09a
!	%l1 = 00000000e22a57ff
	setx	0xa69db8c7f742355e,%g7,%l1 ! %l1 = a69db8c7f742355e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b7704d67e70ba09a
	setx	0xf896ba07bc715627,%g7,%l0 ! %l0 = f896ba07bc715627
!	%l1 = a69db8c7f742355e
	setx	0xc508ec9040ea69f1,%g7,%l1 ! %l1 = c508ec9040ea69f1
!	Mem[0000000030181408] = f889aedf00000000, %l4 = 000000009ba10000
	ldxa	[%i6+%o4]0x89,%l4	! %l4 = f889aedf00000000
!	Starting 10 instruction Store Burst
!	%l5 = 69000000000000a9, %l0 = f896ba07bc715627, %y  = 5ffffaac
	umul	%l5,%l0,%l0		! %l0 = 0000007c66d1dfbf, %y = 0000007c

p0_label_50:
!	%l2 = 000000005c808fe7, Mem[0000000030141410] = e22a57ff
	stha	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = e22a8fe7
!	%l2 = 5c808fe7, %l3 = 31eddc7e, Mem[00000000300c1410] = 0000005c 3681d37a
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 5c808fe7 31eddc7e
!	%l3 = 0000000031eddc7e, Mem[0000000010141400] = f3ce2e2ae78f805c
	stxa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000031eddc7e
!	%l4 = f889aedf00000000, Mem[00000000300c1408] = ff000000
	stba	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%l6 = 00000000adc0ad7a, Mem[0000000010141430] = 8f92258eff49bfdb, %asi = 80
	stxa	%l6,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000000adc0ad7a
!	%f16 = 64156cc9 47fbeea9 93b2eb62 ba371750
!	%f20 = 43530d5b 00000000 5eb4fc79 e22a57ff
!	%f24 = 80000000 00000000 6eccb852 6383fbc7
!	%f28 = c6e502e1 ff800000 295b005c 5c808fe7
	stda	%f16,[%i5]ASI_BLK_AIUPL	! Block Store to 0000000010141400
!	Mem[000000001018142a] = 808ef943, %l4 = f889aedf00000000
	ldstuba	[%i6+0x02a]%asi,%l4	! %l4 = 000000f9000000ff
!	%f12 = 15b3f3ff, Mem[0000000030041408] = 00000000
	sta	%f12,[%i1+%o4]0x89	! Mem[0000000030041408] = 15b3f3ff
!	Mem[0000000030041410] = 52b8cc6e, %l5 = 69000000000000a9
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 0000000052b8cc6e
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010141410] = 43530d5b00000000, %f0  = 94495cf4 112859d2
	ldda	[%i5+%o5]0x88,%f0 	! %f0  = 43530d5b 00000000

p0_label_51:
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 0000007c66d1dfbf
	setx	0x94bce830413d6aae,%g7,%l0 ! %l0 = 94bce830413d6aae
!	%l1 = c508ec9040ea69f1
	setx	0xaa0b82179724d9e5,%g7,%l1 ! %l1 = aa0b82179724d9e5
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 94bce830413d6aae
	setx	0x984e96379f96990b,%g7,%l0 ! %l0 = 984e96379f96990b
!	%l1 = aa0b82179724d9e5
	setx	0xfa30bfd86a06530f,%g7,%l1 ! %l1 = fa30bfd86a06530f
!	Mem[0000000030001400] = ff000000, %l2 = 000000005c808fe7
	lduwa	[%i0+%g0]0x81,%l2	! %l2 = 00000000ff000000
!	Mem[00000000100c1408] = 000096e7, %l2 = 00000000ff000000
	lduwa	[%i3+%o4]0x88,%l2	! %l2 = 00000000000096e7
!	Mem[0000000010001410] = 00000000, %l1 = fa30bfd86a06530f
	lduba	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = e78f805c, %l0 = 984e96379f96990b
	lduwa	[%i4+%o4]0x81,%l0	! %l0 = 00000000e78f805c
!	%l5 = 0000000052b8cc6e, immd = ffffffffffffff0a, %l3 = 0000000031eddc7e
	sdivx	%l5,-0x0f6,%l3		! %l3 = ffffffffffa9ea5c
!	Mem[0000000030181408] = 00000000, %l5 = 0000000052b8cc6e
	ldswa	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = f8602509, %l4 = 00000000000000f9
	ldsba	[%i4+%o5]0x80,%l4	! %l4 = fffffffffffffff8
!	Mem[0000000010101400] = 000086ef, %l5 = 0000000000000000
	lduha	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000e78f805c, Mem[0000000030081410] = 5c000000
	stba	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 5c00005c

p0_label_52:
!	Mem[0000000030101410] = 52960096, %l2 = 00000000000096e7
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 00000096000000ff
!	%f19 = ba371750, Mem[0000000010001418] = 340c95e4
	sta	%f19,[%i0+0x018]%asi	! Mem[0000000010001418] = ba371750
!	%l5 = 0000000000000000, Mem[00000000211c0000] = ffd5f58c, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000f58c
!	%f28 = c6e502e1 ff800000, Mem[0000000010141408] = ba371750 93b2eb62
	stda	%f28,[%i5+%o4]0x88	! Mem[0000000010141408] = c6e502e1 ff800000
!	%l2 = 0000000000000096, Mem[0000000010081410] = ff000000
	stba	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 96000000
!	%l4 = fffffffffffffff8, Mem[0000000030101400] = 112859d2
	stwa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = fffffff8
!	%l1 = 0000000000000000, %l7 = f889aedf00000000, %l6 = 00000000adc0ad7a
	xnor	%l1,%l7,%l6		! %l6 = 07765120ffffffff
!	Mem[0000000010141423] = 00000000, %l3 = ffffffffffa9ea5c
	ldstuba	[%i5+0x023]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141401] = a9eefb47, %l0 = 00000000e78f805c
	ldstub	[%i5+0x001],%l0		! %l0 = 000000ee000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001008141c] = 484d2b5d, %l0 = 00000000000000ee
	ldsb	[%i2+0x01c],%l0		! %l0 = 0000000000000048

p0_label_53:
!	Mem[0000000010181428] = 808eff43, %l2 = 0000000000000096
	ldsba	[%i6+0x02b]%asi,%l2	! %l2 = 0000000000000043
!	Mem[00000000100c1400] = 00008036, %l7 = f889aedf00000000
	lduwa	[%i3+%g0]0x80,%l7	! %l7 = 0000000000008036
!	Mem[0000000010041400] = ff1573346d25e01f, %f22 = 5eb4fc79 e22a57ff
	ldda	[%i1+%g0]0x80,%f22	! %f22 = ff157334 6d25e01f
!	Mem[0000000010101410] = f8602509, %l4 = fffffffffffffff8
	lduha	[%i4+%o5]0x80,%l4	! %l4 = 000000000000f860
!	Mem[0000000030101400] = f8ffffff, %l1 = 0000000000000000
	ldsha	[%i4+%g0]0x81,%l1	! %l1 = fffffffffffff8ff
!	Mem[0000000010101410] = 092560f8, %f18 = 93b2eb62
	lda	[%i4+%o5]0x88,%f18	! %f18 = 092560f8
!	Mem[00000000100c1400] = 00008036, %f20 = 43530d5b
	lda	[%i3+%g0]0x80,%f20	! %f20 = 00008036
!	Mem[0000000030041410] = a9000000, %l0 = 0000000000000048
	lduha	[%i1+%o5]0x81,%l0	! %l0 = 000000000000a900
!	%l4 = 000000000000f860, %l6 = 07765120ffffffff, %l3  = 0000000000000000
	mulx	%l4,%l6,%l3		! %l3 = 6af6645fffff07a0
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = ffd37ff0, %l2 = 0000000000000043
	ldstuba	[%o1+0x001]%asi,%l2	! %l2 = 000000d3000000ff

p0_label_54:
!	%l4 = 000000000000f860, Mem[0000000010041408] = 295b005c5c808fe7
	stxa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000000000f860
!	Mem[0000000030041408] = fff3b315, %l0 = 000000000000a900
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 00000000fff3b315
!	%f30 = 295b005c, Mem[00000000300c1410] = 5c808fe7
	sta	%f30,[%i3+%o5]0x89	! Mem[00000000300c1410] = 295b005c
!	%l7 = 0000000000008036, Mem[0000000030081400] = ff000000
	stba	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 36000000
!	%l2 = 00000000000000d3, imm = fffffffffffff659, %l6 = 07765120ffffffff
	and	%l2,-0x9a7,%l6		! %l6 = 0000000000000051
!	%l6 = 0000000000000051, Mem[0000000021800180] = ff84ed8e
	stb	%l6,[%o3+0x180]		! Mem[0000000021800180] = 5184ed8e
!	Mem[0000000030101410] = 529600ff, %l0 = 00000000fff3b315
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 00000000529600ff
!	Mem[0000000030101408] = 5c808fe7, %l7 = 0000000000008036
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 000000005c808fe7
!	%l2 = 00000000000000d3, Mem[00000000100c1408] = e7960000
	stha	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00d30000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000032, %l5 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000032

p0_label_55:
!	Mem[0000000010181400] = 00000000, %l2 = 00000000000000d3
	lduha	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 60f8000000000000, %f2  = 3ae52e46 09e15296
	ldda	[%i1+%o4]0x80,%f2 	! %f2  = 60f80000 00000000
!	Mem[0000000021800140] = a19bd3d6, %l2 = 0000000000000000
	ldsha	[%o3+0x140]%asi,%l2	! %l2 = ffffffffffffa19b
!	Mem[0000000010101428] = c7fb8363, %l7 = 000000005c808fe7
	ldsha	[%i4+0x02a]%asi,%l7	! %l7 = ffffffffffff8363
!	Mem[00000000218000c0] = ff456ac2, %l4 = 000000000000f860
	lduha	[%o3+0x0c0]%asi,%l4	! %l4 = 000000000000ff45
!	Mem[00000000100c1408] = 00d3000000000000, %l6 = 0000000000000051
	ldxa	[%i3+%o4]0x80,%l6	! %l6 = 00d3000000000000
!	Mem[0000000010181400] = 00000000 00000000 f38e27e7 5d07ffbf
!	Mem[0000000010181410] = 000000ff 271a0bdf 94495cf4 e87aaa91
!	Mem[0000000010181420] = ffffff0b 0000005c 808eff43 4ff7e202
!	Mem[0000000010181430] = 1a5e8012 17c0a3f4 1744b198 0a4020df
	ldda	[%i6]ASI_BLK_PL,%f0	! Block Load from 0000000010181400
!	Mem[0000000010001400] = ff00b852 e22a57a2, %l4 = 0000ff45, %l5 = 00000032
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 00000000ff00b852 00000000e22a57a2
!	Mem[0000000030041410] = a9000000, %l1 = fffffffffffff8ff
	ldsba	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffffa9
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffff8363, Mem[0000000010141400] = 47fbffa9
	stha	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 47fb8363

p0_label_56:
!	Mem[0000000010101430] = 3a8c86ef, %l1 = ffffffffffffffa9
	swap	[%i4+0x030],%l1		! %l1 = 000000003a8c86ef
	membar	#Sync			! Added by membar checker (12)
!	%l4 = 00000000ff00b852, Mem[0000000010181408] = e7278ef3
	stba	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = e7278e52
!	%l4 = 00000000ff00b852, Mem[0000000010101434] = e87aaa91
	stw	%l4,[%i4+0x034]		! Mem[0000000010101434] = ff00b852
!	%l6 = 00d3000000000000, Mem[0000000010181408] = 528e27e7
	stwa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	Mem[0000000010101408] = 320000003681d37a, %l0 = 00000000529600ff, %l7 = ffffffffffff8363
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = 320000003681d37a
!	%f10 = 02e2f74f, Mem[0000000010081410] = 96000000
	sta	%f10,[%i2+%o5]0x80	! Mem[0000000010081410] = 02e2f74f
!	%f12 = f4a3c017 12805e1a, Mem[00000000100c1428] = ffe0d3b9 074d4c48
	stda	%f12,[%i3+0x028]%asi	! Mem[00000000100c1428] = f4a3c017 12805e1a
!	Mem[0000000010081410] = 4ff7e202, %l4 = 00000000ff00b852
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 00000002000000ff
!	%f9  = 0bffffff, %f14 = df20400a, %f0  = 00000000
	fmuls	%f9 ,%f14,%f0 		! %f0  = aba04009
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = e78f2ae2, %l5 = 00000000e22a57a2
	ldswa	[%i5+%o5]0x81,%l5	! %l5 = ffffffffe78f2ae2

p0_label_57:
!	Mem[0000000030101408] = 295b005c00008036, %l4 = 0000000000000002
	ldxa	[%i4+%o4]0x89,%l4	! %l4 = 295b005c00008036
!	Mem[0000000010081400] = 6900005c000000a2, %f2  = bfff075d e7278ef3
	ldda	[%i2+%g0]0x80,%f2 	! %f2  = 6900005c 000000a2
!	Mem[0000000010141400] = 6383fb47, %l5 = ffffffffe78f2ae2
	lduha	[%i5+%g0]0x80,%l5	! %l5 = 0000000000006383
!	Mem[0000000030081410] = 5c00005c, %l0 = 00000000529600ff
	lduwa	[%i2+%o5]0x89,%l0	! %l0 = 000000005c00005c
!	Mem[0000000030041410] = 000000a9, %l1 = 000000003a8c86ef
	ldswa	[%i1+%o5]0x89,%l1	! %l1 = 00000000000000a9
!	Mem[0000000010141420] = 000000ff00000080, %l3 = 6af6645fffff07a0
	ldx	[%i5+0x020],%l3		! %l3 = 000000ff00000080
!	%l6 = 00d3000000000000, %l7 = 320000003681d37a, %y  = 0000007c
	umul	%l6,%l7,%l3		! %l3 = 0000000000000000, %y = 00000000
!	%f10 = 02e2f74f, %f3  = 000000a2, %f31 = 5c808fe7
	fsubs	%f10,%f3 ,%f31		! %l0 = 000000005c00007e, Unfinished, %fsr = 0200000000
!	Mem[0000000030081410] = 5c00005c, %f18 = 092560f8
	lda	[%i2+%o5]0x81,%f18	! %f18 = 5c00005c
!	Starting 10 instruction Store Burst
!	%l2 = ffffa19b, %l3 = 00000000, Mem[0000000030001410] = 00000000 00000000
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffa19b 00000000

p0_label_58:
!	%l1 = 00000000000000a9, %l7 = 320000003681d37a, %l6 = 00d3000000000000
	add	%l1,%l7,%l6		! %l6 = 320000003681d423
!	%l1 = 00000000000000a9, Mem[0000000010101410] = f8602509
	stwa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000a9
!	%l0 = 000000005c00007e, Mem[0000000010101408] = 320000003681d37a
	stxa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000005c00007e
!	Mem[0000000030141408] = 69000000, %l4 = 295b005c00008036
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 00000069000000ff
!	%l4 = 00000069, %l5 = 00006383, Mem[0000000030081400] = 00000036 99ae8eff
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000069 00006383
!	Mem[0000000030041410] = 000000a9, %l7 = 320000003681d37a
	swapa	[%i1+%o5]0x89,%l7	! %l7 = 00000000000000a9
!	%l7 = 00000000000000a9, Mem[0000000010001408] = 9652e109, %asi = 80
	stwa	%l7,[%i0+0x008]%asi	! Mem[0000000010001408] = 000000a9
!	%l3 = 0000000000000000, Mem[0000000030081410] = 9bd1d5195c00005c
	stxa	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000000
!	%l2 = ffffffffffffa19b, Mem[0000000010101408] = 7e00005c00000000
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffffffffa19b
!	Starting 10 instruction Load Burst
!	%l0 = 000000005c00007e, immd = fffffffffffffe87, %l3  = 0000000000000000
	mulx	%l0,-0x179,%l3		! %l3 = ffffff7883ff4672

p0_label_59:
!	Mem[0000000010001408] = 000000a9462ee53a, %l1 = 00000000000000a9
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = 000000a9462ee53a
!	Mem[0000000010041408] = 000000000000f860, %l7 = 00000000000000a9
	ldxa	[%i1+%o4]0x88,%l7	! %l7 = 000000000000f860
!	Mem[0000000030141400] = 00000000, %l3 = ffffff7883ff4672
	lduba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 64156cc9 ef860000, %l4 = 00000069, %l5 = 00006383
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 00000000ef860000 0000000064156cc9
!	Mem[0000000010001410] = 00000000, %l4 = 00000000ef860000
	lduha	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = 9ba1ffff, %l3 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 0000000000009ba1
!	Mem[0000000010001410] = 00000000, %l7 = 000000000000f860
	ldswa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l5 = 0000000064156cc9
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = 6eccb85252000000, %f16 = 64156cc9 47fbeea9
	ldda	[%i3+%o5]0x88,%f16	! %f16 = 6eccb852 52000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030041410] = 7ad38136
	stha	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 00008136

p0_label_60:
!	%l6 = 320000003681d423, Mem[00000000100c1410] = 00000052
	stwa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 3681d423
!	%f0  = aba04009 00000000 6900005c 000000a2
!	%f4  = df0b1a27 ff000000 91aa7ae8 f45c4994
!	%f8  = 5c000000 0bffffff 02e2f74f 43ff8e80
!	%f12 = f4a3c017 12805e1a df20400a 98b14417
	stda	%f0,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	%f16 = 6eccb852 52000000, Mem[0000000030001410] = ffffa19b 00000000
	stda	%f16,[%i0+%o5]0x89	! Mem[0000000030001410] = 6eccb852 52000000
!	%l0 = 000000005c00007e, Mem[0000000010141410] = 00000000
	stba	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000007e
!	Mem[0000000010101410] = 000000a9, %l4 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181428] = 808eff434ff7e202, %l7 = 0000000000000000, %l5 = 0000000000000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = 808eff434ff7e202
!	%f24 = 80000000, %f18 = 5c00005c ba371750
	fstod	%f24,%f18		! %f18 = 80000000 00000000
!	%l7 = 0000000000000000, Mem[0000000030081408] = 9ba10000
	stha	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 9ba10000
!	%f20 = 00008036, Mem[0000000010101400] = ef860000
	sta	%f20,[%i4+%g0]0x88	! Mem[0000000010101400] = 00008036
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = 1a490053, %l0 = 000000005c00007e
	lduha	[%o3+0x040]%asi,%l0	! %l0 = 0000000000001a49

p0_label_61:
!	Mem[0000000010141408] = ff800000, %l7 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = ffffffff, %l5 = 808eff434ff7e202
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001400] = a2572ae252b800ff, %l7 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l7	! %l7 = a2572ae252b800ff
!	Mem[0000000010041410] = 00ff000000000000, %f30 = 295b005c 5c808fe7
	ldda	[%i1+%o5]0x80,%f30	! %f30 = 00ff0000 00000000
!	Mem[0000000010041408] = 60f80000 00000000, %l0 = 00001a49, %l1 = 462ee53a
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 0000000060f80000 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l7 = a2572ae252b800ff
	ldsha	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001430] = fffffffffff3b315, %l5 = ffffffffffffffff
	ldxa	[%i0+0x030]%asi,%l5	! %l5 = fffffffffff3b315
!	Mem[0000000030041400] = a9eefb47, %l2 = ffffffffffffa19b
	ldsba	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffffa9
!	Mem[0000000010001400] = ff00b852, %l7 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l7	! %l7 = ffffffffff00b852
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010041410] = 00ff0000
	stwa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000

p0_label_62:
!	Mem[0000000030081408] = 0000a19b, %l3 = 0000000000009ba1
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030141408] = 000000ff
	stha	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%f28 = c6e502e1 ff800000, %l3 = 0000000000000000
!	Mem[0000000030141428] = ead959f7eda98a64
	add	%i5,0x028,%g1
	stda	%f28,[%g1+%l3]ASI_PST16_S ! Mem[0000000030141428] = ead959f7eda98a64
!	%f23 = 6d25e01f, %f31 = 00000000, %f31 = 00000000
	fmuls	%f23,%f31,%f31		! %f31 = 00000000
!	%l2 = ffffffffffffffa9, Mem[0000000030081400] = 69000000
	stwa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffa9
	membar	#Sync			! Added by membar checker (13)
!	Mem[00000000100c1424] = 0bffffff, %l6 = 320000003681d423
	swap	[%i3+0x024],%l6		! %l6 = 000000000bffffff
!	%l3 = 0000000000000000, imm = fffffffffffffcc3, %l6 = 000000000bffffff
	add	%l3,-0x33d,%l6		! %l6 = fffffffffffffcc3
!	%f5  = ff000000, Mem[00000000300c1410] = 295b005c
	sta	%f5 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff000000
!	%l6 = fffffffffffffcc3, Mem[0000000010141408] = 000080ff
	stha	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = fcc380ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffffa19b, %l4 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l4	! %l4 = ffffffffffffa19b

p0_label_63:
!	Mem[0000000010181410] = df0b1a27ff000000, %f0  = aba04009 00000000
	ldda	[%i6+%o5]0x88,%f0 	! %f0  = df0b1a27 ff000000
!	Mem[0000000030041410] = 00008136, %f11 = 43ff8e80
	lda	[%i1+%o5]0x81,%f11	! %f11 = 00008136
!	Mem[0000000010081400] = 6900005c000000a2, %l7 = ffffffffff00b852
	ldxa	[%i2+%g0]0x80,%l7	! %l7 = 6900005c000000a2
!	Mem[0000000030081400] = ffffffa9 83630000 ff00a19b 0000ffff
!	Mem[0000000030081410] = 00000000 00000000 08201d86 1b64b120
!	Mem[0000000030081420] = 5dc13d40 0099670b 6ef4f038 27071131
!	Mem[0000000030081430] = d89688aa d0f33bc2 7eaa893a 52d67f34
	ldda	[%i2]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030081400
!	Mem[0000000010001408] = 000000a9462ee53a, %l6 = fffffffffffffcc3
	ldxa	[%i0+%o4]0x80,%l6	! %l6 = 000000a9462ee53a
!	Mem[0000000030001408] = 5e000000 fb000000, %l2 = ffffffa9, %l3 = 00000000
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 000000005e000000 00000000fb000000
!	Mem[0000000010101408] = 9ba1ffff, %l6 = 000000a9462ee53a
	ldsha	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffff9ba1
!	Mem[0000000010081408] = ffffffff, %l4 = ffffffffffffa19b
	ldsba	[%i2+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041424] = dfbb042c, %l1 = 0000000000000000
	lduh	[%i1+0x026],%l1		! %l1 = 000000000000042c
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00000000, %l6 = ffffffffffff9ba1
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000

p0_label_64:
!	%l4 = ffffffffffffffff, Mem[0000000030101408] = 36800000
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = ffff0000
!	Mem[0000000010081410] = 4ff7e2ff, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 000000004ff7e2ff
!	Code Fragment 4
p0_fragment_10:
!	%l0 = 0000000060f80000
	setx	0x42c564d82308d4c8,%g7,%l0 ! %l0 = 42c564d82308d4c8
!	%l1 = 000000000000042c
	setx	0x866382906762c36f,%g7,%l1 ! %l1 = 866382906762c36f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 42c564d82308d4c8
	setx	0x07b0d9efd585168a,%g7,%l0 ! %l0 = 07b0d9efd585168a
!	%l1 = 866382906762c36f
	setx	0x5ddefc0840aecaec,%g7,%l1 ! %l1 = 5ddefc0840aecaec
!	Mem[0000000030101408] = ffff0000, %l4 = ffffffffffffffff
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ffff0000
!	%l4 = 00000000ffff0000, Mem[0000000010141410] = 7e000000
	stha	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
	membar	#Sync			! Added by membar checker (14)
!	%f16 = 6eccb852, Mem[0000000030081400] = ffffffa9
	sta	%f16,[%i2+%g0]0x81	! Mem[0000000030081400] = 6eccb852
!	Mem[00000000100c1408] = 6900005c, %l4 = 00000000ffff0000
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 000000006900005c
!	%f16 = 6eccb852 52000000, Mem[0000000030041400] = a9eefb47 c96c1564
	stda	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = 6eccb852 52000000
!	Mem[00000000100c1404] = 00000000, %l5 = fff3b315, %l7 = 000000a2
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffffffff, %l2 = 000000005e000000
	ldsha	[%i2+%o4]0x80,%l2	! %l2 = ffffffffffffffff

p0_label_65:
!	Mem[0000000030181410] = 501737ba, %l2 = ffffffffffffffff
	lduwa	[%i6+%o5]0x81,%l2	! %l2 = 00000000501737ba
!	Mem[0000000030181400] = ff000000, %l5 = fffffffffff3b315
	ldsba	[%i6+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041410] = 36810000, %l1 = 5ddefc0840aecaec
	lduha	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l5 = ffffffffffffffff
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c141c] = f45c4994, %l4 = 000000006900005c
	ldsb	[%i3+0x01f],%l4		! %l4 = ffffffffffffff94
!	Mem[0000000010101408] = ffffffffffffa19b, %l1 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l1	! %l1 = ffffffffffffa19b
!	Mem[0000000010141408] = ff80c3fc, %l1 = ffffffffffffa19b
	ldswa	[%i5+%o4]0x88,%l1	! %l1 = ffffffffff80c3fc
!	Mem[0000000030181400] = 000000ff, %l2 = 00000000501737ba
	ldsba	[%i6+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041408] = 60f80000, %l1 = ffffffffff80c3fc
	lduba	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000060
!	Starting 10 instruction Store Burst
!	%l4 = ffffff94, %l5 = 00000000, Mem[0000000010141400] = 47fb8363 64156cc9
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffff94 00000000

p0_label_66:
!	Mem[0000000030101400] = fffffff8, %l6 = 000000004ff7e2ff
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 00000000fffffff8
!	%l5 = 0000000000000000, Mem[000000001014140a] = fcc380ff
	stb	%l5,[%i5+0x00a]		! Mem[0000000010141408] = fcc300ff
!	%f4  = 00000000 00000000, Mem[0000000010101410] = a90000ff e78f80ff
	stda	%f4 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 00000000
!	Mem[0000000030141410] = e78f2ae2, %l2 = ffffffffffffffff
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000e78f2ae2
!	%f14 = 347fd652 3a89aa7e, %l1 = 0000000000000060
!	Mem[0000000010081408] = ffffffff62ebb293
	add	%i2,0x008,%g1
	stda	%f14,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010081408] = ffffffff62ebb293
!	%f0  = 00006383 a9ffffff, Mem[0000000030041400] = 6eccb852 52000000
	stda	%f0 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 00006383 a9ffffff
!	%f16 = 6eccb852 52000000 80000000 00000000
!	%f20 = 00008036 00000000 ff157334 6d25e01f
!	%f24 = 80000000 00000000 6eccb852 6383fbc7
!	%f28 = c6e502e1 ff800000 00ff0000 00000000
	stda	%f16,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%f8  = 0b679900 403dc15d, Mem[0000000030181410] = ba371750 93b2eb62
	stda	%f8 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 0b679900 403dc15d
!	%l6 = 00000000fffffff8, Mem[0000000030141400] = f889aedf00000000
	stxa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000fffffff8
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l4 = ffffffffffffff94
	lduba	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000

p0_label_67:
!	Mem[0000000030081410] = 00000000, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800040] = ffd56b19, %l5 = 0000000000000000
	lduba	[%o1+0x040]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l6 = 00000000fffffff8
	ldsba	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081414] = ffffd1ff, %l2 = 00000000e78f2ae2
	ldub	[%i2+0x014],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030081410] = 00000000 00000000, %l0 = d585168a, %l1 = 00000060
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000211c0000] = 0000f58c, %l4 = 0000000000000000
	lduba	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = ffffff94, %l5 = 00000000000000ff
	ldswa	[%i5+%g0]0x88,%l5	! %l5 = ffffffffffffff94
!	Mem[00000000100c1428] = 02e2f74f, %l3 = 00000000fb000000
	ldswa	[%i3+0x028]%asi,%l3	! %l3 = 0000000002e2f74f
!	Mem[0000000010041428] = 00000000, %f12 = c23bf3d0
	lda	[%i1+0x028]%asi,%f12	! %f12 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 52b8cc6e, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l1	! %l1 = 0000006e000000ff

p0_label_68:
!	%f12 = 00000000, %f13 = aa8896d8
	fcmpes	%fcc3,%f12,%f13		! %fcc3 = 2
!	%l6 = 0000000000000000, Mem[0000000010081428] = c7fb836352b8cc6e
	stx	%l6,[%i2+0x028]		! Mem[0000000010081428] = 0000000000000000
!	Mem[00000000300c1410] = 000000ff, %l1 = 000000000000006e
	swapa	[%i3+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081408] = 9ba100ff, %l5 = ffffffffffffff94
	swapa	[%i2+%o4]0x89,%l5	! %l5 = 000000009ba100ff
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010101410] = 00000000, %l2 = 00000000000000ff
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010101408] = 9ba1ffff
	stha	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000ffff
!	%f19 = 00000000, Mem[0000000010081410] = 00000000
	sta	%f19,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Mem[0000000010001408] = a9000000, %l3 = 0000000002e2f74f
	swapa	[%i0+%o4]0x88,%l3	! %l3 = 00000000a9000000
!	%l2 = 0000000000000000, Mem[0000000010081410] = 00000000, %asi = 80
	stwa	%l2,[%i2+0x010]%asi	! Mem[0000000010081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ffff0000, %l2 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l2	! %l2 = ffffffffffffffff

p0_label_69:
!	Mem[0000000030001410] = 52000000, %l7 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 00000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+0x010]%asi,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010081400] = 6900005c000000a2, %f30 = 00ff0000 00000000
	ldda	[%i2+%g0]0x80,%f30	! %f30 = 6900005c 000000a2
!	Mem[0000000010141400] = ffffff94, %f2  = ffff0000
	lda	[%i5+%g0]0x88,%f2 	! %f2 = ffffff94
!	Mem[00000000100c1410] = df0b1a27, %f8  = 0b679900
	lda	[%i3+%o5]0x80,%f8 	! %f8 = df0b1a27
!	Mem[0000000010181408] = 00000000, %l3 = 00000000a9000000
	lduba	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = ffff0000, %l2 = ffffffffffffffff
	ldsba	[%i3+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = ffffffff, %f24 = 80000000
	lda	[%i2+%o4]0x80,%f24	! %f24 = ffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030081408] = 94ffffff
	stha	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000ffff

p0_label_70:
!	Mem[000000001018140c] = 5d07ffbf, %l3 = 00000000, %l3 = 00000000
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 000000005d07ffbf
!	Mem[0000000030141408] = 00000000, %l5 = 000000009ba100ff
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141434] = e102e5c6, %l0 = 00000000, %l0 = 00000000
	add	%i5,0x34,%g1
	casa	[%g1]0x80,%l0,%l0	! %l0 = 00000000e102e5c6
!	Mem[00000000211c0000] = 0000f58c, %l6 = 0000000000000000
	ldsb	[%o2+%g0],%l6		! %l6 = 0000000000000000
!	%l0 = 00000000e102e5c6, Mem[0000000030101410] = 00000000
	stba	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000c6
!	Mem[0000000010081400] = 5c000069, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 000000005c000069
!	%f28 = c6e502e1 ff800000, Mem[0000000010181400] = 00000000 00000000
	stda	%f28,[%i6+%g0]0x80	! Mem[0000000010181400] = c6e502e1 ff800000
!	Mem[000000001008142f] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i2+0x02f]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041418] = 14d059cb, %l4 = 00000000, %l0 = e102e5c6
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 0000000014d059cb
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l2 = ffffffffffffffff
	ldswa	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_71:
!	Mem[0000000010001410] = 00000000, %l6 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = ffff0197, %l0 = 0000000014d059cb
	ldsb	[%o0+0x001],%l0		! %l0 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000030081400] = ffccb852 83630000 0000ffff 0000ffff
!	Mem[0000000030081410] = 00000000 00000000 08201d86 1b64b120
!	Mem[0000000030081420] = 5dc13d40 0099670b 6ef4f038 27071131
!	Mem[0000000030081430] = d89688aa d0f33bc2 7eaa893a 52d67f34
	ldda	[%i2]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030081400
!	Mem[000000001008142c] = 000000ff, %l4 = 0000000000000000
	lduha	[%i2+0x02c]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00006383 52b8ccff, %l6 = 00000000, %l7 = 5c000069
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 0000000052b8ccff 0000000000006383
!	Mem[0000000021800040] = 1a490053, %l7 = 0000000000006383
	ldsba	[%o3+0x040]%asi,%l7	! %l7 = 000000000000001a
!	Mem[0000000010001400] = 52b800ff, %l1 = 00000000000000ff
	ldswa	[%i0+%g0]0x88,%l1	! %l1 = 0000000052b800ff
!	Mem[0000000010081400] = 00000000, %l1 = 0000000052b800ff
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 5eb4fc79 ffffffff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 00000000ffffffff 000000005eb4fc79
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00000000, %l4 = 00000000ffffffff
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_72:
!	%l0 = ffffffffffffffff, Mem[00000000211c0000] = 0000f58c, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = fffff58c
!	%l2 = 00000000, %l3 = 5d07ffbf, Mem[0000000010101420] = 501737ba 62ebb293
	std	%l2,[%i4+0x020]		! Mem[0000000010101420] = 00000000 5d07ffbf
!	%l4 = 0000000000000000, Mem[0000000010081433] = 00000000
	stb	%l4,[%i2+0x033]		! Mem[0000000010081430] = 00000000
!	%f22 = ff157334 6d25e01f, Mem[0000000010181400] = c6e502e1 ff800000
	stda	%f22,[%i6+%g0]0x80	! Mem[0000000010181400] = ff157334 6d25e01f
!	%l7 = 000000000000001a, Mem[0000000030141400] = fffffff8
	stba	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffff1a
!	%l2 = 0000000000000000, Mem[00000000100c1420] = 5c0000003681d423, %asi = 80
	stxa	%l2,[%i3+0x020]%asi	! Mem[00000000100c1420] = 0000000000000000
!	Code Fragment 4
p0_fragment_11:
!	%l0 = ffffffffffffffff
	setx	0x20466497f79fadbf,%g7,%l0 ! %l0 = 20466497f79fadbf
!	%l1 = 0000000000000000
	setx	0xcdd962bf8c7f3293,%g7,%l1 ! %l1 = cdd962bf8c7f3293
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 20466497f79fadbf
	setx	0xf9e777482dbe4bb9,%g7,%l0 ! %l0 = f9e777482dbe4bb9
!	%l1 = cdd962bf8c7f3293
	setx	0xbf6a065fb830e0de,%g7,%l1 ! %l1 = bf6a065fb830e0de
!	%l3 = 000000005d07ffbf, Mem[0000000010181408] = 000000005d07ffbf
	stx	%l3,[%i6+%o4]		! Mem[0000000010181408] = 000000005d07ffbf
!	%l0 = 2dbe4bb9, %l1 = b830e0de, Mem[00000000300c1408] = ffff9ba1 00000000
	stda	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 2dbe4bb9 b830e0de
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 271a0bdf, %l6 = 0000000052b8ccff
	lduwa	[%i3+%o5]0x88,%l6	! %l6 = 00000000271a0bdf

p0_label_73:
!	Mem[0000000010081410] = ffd1ffffffffffff, %l7 = 000000000000001a
	ldxa	[%i2+%o5]0x88,%l7	! %l7 = ffd1ffffffffffff
!	Mem[0000000030101410] = 000000c6, %l1 = bf6a065fb830e0de
	lduha	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000c6
!	Mem[0000000010141408] = c6e502e1ff00c3fc, %f30 = 6900005c 000000a2
	ldda	[%i5+%o4]0x88,%f30	! %f30 = c6e502e1 ff00c3fc
!	Mem[0000000010041404] = 6d25e01f, %l4 = 0000000000000000
	ldsha	[%i1+0x004]%asi,%l4	! %l4 = 0000000000006d25
!	Mem[00000000300c1408] = 2dbe4bb9b830e0de, %l7 = ffd1ffffffffffff
	ldxa	[%i3+%o4]0x81,%l7	! %l7 = 2dbe4bb9b830e0de
!	Mem[0000000030181400] = 000000ff, %l3 = 000000005d07ffbf
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	%l7 = 2dbe4bb9b830e0de, immed = fffff25e, %y  = 00000000
	umul	%l7,-0xda2,%l2		! %l2 = b830d70ef5a66d84, %y = b830d70e
!	Mem[00000000100c1410] = df0b1a27ff000000, %l1 = 00000000000000c6
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = df0b1a27ff000000
!	%l7 = 2dbe4bb9b830e0de, %l3 = ffffffffffffffff, %l3 = ffffffffffffffff
	orn	%l7,%l3,%l3		! %l3 = 2dbe4bb9b830e0de
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 0000f860, %l0 = f9e777482dbe4bb9
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 000000000000f860

p0_label_74:
!	%l5 = 000000005eb4fc79, %l3 = 2dbe4bb9b830e0de, %y  = b830d70e
	udiv	%l5,%l3,%l5		! %l5 = 00000000fffff25d
	mov	%l0,%y			! %y = 0000f860
!	%l4 = 0000000000006d25, Mem[0000000010001410] = 000000002f000000
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000006d25
!	%l4 = 00006d25, %l5 = fffff25d, Mem[0000000010081420] = 501737ba 62ebb293
	stda	%l4,[%i2+0x020]%asi	! Mem[0000000010081420] = 00006d25 fffff25d
!	%l4 = 0000000000006d25, Mem[00000000100c1410] = df0b1a27
	stba	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 250b1a27
!	%l7 = 2dbe4bb9b830e0de, Mem[0000000021800180] = 5184ed8e
	stb	%l7,[%o3+0x180]		! Mem[0000000021800180] = de84ed8e
!	%l4 = 0000000000006d25, Mem[0000000021800040] = 1a490053
	sth	%l4,[%o3+0x040]		! Mem[0000000021800040] = 6d250053
!	Mem[00000000100c1408] = ffff0000, %l3 = 2dbe4bb9b830e0de
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 00000000ffff0000
!	%l4 = 0000000000006d25, Mem[0000000010141400] = ffffff94
	stwa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00006d25
!	%l5 = 00000000fffff25d, Mem[0000000010041400] = ff157334
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = f25d7334
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00008136, %l0 = 000000000000f860
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_75:
!	Mem[0000000010081434] = 19d5d19b, %f30 = c6e502e1
	lda	[%i2+0x034]%asi,%f30	! %f30 = 19d5d19b
!	Mem[0000000010081410] = ffffffff, %f30 = 19d5d19b
	lda	[%i2+%o5]0x88,%f30	! %f30 = ffffffff
!	Mem[0000000030181408] = 00000000, %l5 = 00000000fffff25d
	ldswa	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = fffff58c, %l4 = 0000000000006d25
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1428] = 02e2f74f43ff8e80, %l4 = 00000000000000ff
	ldxa	[%i3+0x028]%asi,%l4	! %l4 = 02e2f74f43ff8e80
!	%f6  = 20b1641b, %f3  = ffff0000
	fsqrts	%f6 ,%f3 		! %f3  = 3016af6e
!	Mem[0000000030081400] = 0000638352b8ccff, %l2 = b830d70ef5a66d84
	ldxa	[%i2+%g0]0x89,%l2	! %l2 = 0000638352b8ccff
!	Mem[0000000010041410] = 00000000, %l0 = 0000000000000000
	lduwa	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l0 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00000000, %l2 = 0000638352b8ccff
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000

p0_label_76:
!	%f24 = ffffffff 00000000, Mem[0000000010081400] = 00000000 000000a2
	stda	%f24,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff 00000000
!	%f23 = 6d25e01f, Mem[0000000010081400] = ffffffff
	sta	%f23,[%i2+%g0]0x88	! Mem[0000000010081400] = 6d25e01f
!	%f14 = 347fd652 3a89aa7e, %l4 = 02e2f74f43ff8e80
!	Mem[00000000300c1428] = 972e35a02ff72323
	add	%i3,0x028,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_S ! Mem[00000000300c1428] = 972e35a02ff72323
!	Mem[0000000030181400] = ff000000 000000e3, %l0 = 00000000, %l1 = ff000000
	ldda	[%i6+%g0]0x81,%l0	! %l0 = 00000000ff000000 00000000000000e3
!	%l7 = 2dbe4bb9b830e0de, %l0 = 00000000ff000000, %l5 = 0000000000000000
	add	%l7,%l0,%l5		! %l5 = 2dbe4bbab730e0de
	membar	#Sync			! Added by membar checker (17)
!	%l6 = 00000000271a0bdf, Mem[0000000030081400] = 52b8ccff
	stba	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 52b8ccdf
!	%l5 = 2dbe4bbab730e0de, Mem[000000001010140c] = ffffffff, %asi = 80
	stwa	%l5,[%i4+0x00c]%asi	! Mem[000000001010140c] = b730e0de
!	%f10 = 31110727 38f0f46e, %l2 = 0000000000000000
!	Mem[00000000300c1410] = 0000006e7edced31
	add	%i3,0x010,%g1
	stda	%f10,[%g1+%l2]ASI_PST16_SL ! Mem[00000000300c1410] = 0000006e7edced31
!	%l4 = 43ff8e80, %l5 = b730e0de, Mem[00000000100c1408] = b830e0de 000000a2
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 43ff8e80 b730e0de
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l5 = 2dbe4bbab730e0de
	lduba	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_77:
!	Mem[0000000030001408] = 0000005e, %l7 = 2dbe4bb9b830e0de
	lduwa	[%i0+%o4]0x89,%l7	! %l7 = 000000000000005e
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 00000000ff000000
	setx	0x63c26b37eae452ae,%g7,%l0 ! %l0 = 63c26b37eae452ae
!	%l1 = 00000000000000e3
	setx	0x3d0380b060682132,%g7,%l1 ! %l1 = 3d0380b060682132
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 63c26b37eae452ae
	setx	0xbac082379394e03d,%g7,%l0 ! %l0 = bac082379394e03d
!	%l1 = 3d0380b060682132
	setx	0xd3c9f2a7f768b10d,%g7,%l1 ! %l1 = d3c9f2a7f768b10d
!	Mem[0000000010101400] = 00008036, %l5 = 0000000000000000
	lduwa	[%i4+%g0]0x88,%l5	! %l5 = 0000000000008036
!	Mem[0000000030041410] = 00008136, %f16 = 6eccb852
	lda	[%i1+%o5]0x81,%f16	! %f16 = 00008136
!	Mem[0000000030041410] = 00008136dfaee5f8, %f28 = c6e502e1 ff800000
	ldda	[%i1+%o5]0x81,%f28	! %f28 = 00008136 dfaee5f8
!	Mem[0000000030041410] = 00008136, %l4 = 02e2f74f43ff8e80
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ffff0197, %l5 = 0000000000008036
	lduba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = ffff0197, %l7 = 000000000000005e
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1410] = 0000006e7edced31, %l6 = 00000000271a0bdf
	ldxa	[%i3+%o5]0x81,%l6	! %l6 = 0000006e7edced31
!	Starting 10 instruction Store Burst
!	Mem[000000001000143c] = ea2c70e6, %l0 = 9394e03d, %l0 = 9394e03d
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l0,%l0	! %l0 = 00000000ea2c70e6

p0_label_78:
!	Mem[0000000010141405] = 00000000, %l6 = 0000006e7edced31
	ldstub	[%i5+0x005],%l6		! %l6 = 00000000000000ff
!	Mem[00000000300c1410] = 6e000000, %l6 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 000000006e000000
!	%f0  = 00006383 52b8ccff ffff0000 3016af6e
!	%f4  = 00000000 00000000 20b1641b 861d2008
!	%f8  = 0b679900 403dc15d 31110727 38f0f46e
!	%f12 = c23bf3d0 aa8896d8 347fd652 3a89aa7e
	stda	%f0,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	Mem[0000000030081408] = 0000ffff, %l6 = 000000006e000000
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1408] = 2dbe4bb9, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 000000002dbe4bb9
!	%l3 = 00000000ffff0000, Mem[00000000300c1408] = 00000000b830e0de
	stxa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000ffff0000
!	%l1 = d3c9f2a7f768b10d, %l0 = 00000000ea2c70e6, %y  = 0000f860
	umul	%l1,%l0,%l4		! %l4 = e250a4f065c0c1ae, %y = e250a4f0
!	%f31 = ff00c3fc, Mem[0000000030101400] = 52000000
	sta	%f31,[%i4+%g0]0x89	! Mem[0000000030101400] = ff00c3fc
!	%l4 = e250a4f065c0c1ae, Mem[0000000010081408] = 93b2eb62ffffffff
	stxa	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = e250a4f065c0c1ae
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff00ffff, %l6 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l6	! %l6 = ffffffffff00ffff

p0_label_79:
!	Mem[0000000030101410] = 00008036000000c6, %f20 = 00008036 00000000
	ldda	[%i4+%o5]0x89,%f20	! %f20 = 00008036 000000c6
!	Mem[0000000030041400] = 00006383, %l4 = e250a4f065c0c1ae
	ldswa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000006383
!	Mem[0000000010001410] = 256d000000000000, %l3 = 00000000ffff0000
	ldxa	[%i0+%o5]0x88,%l3	! %l3 = 256d000000000000
!	%f21 = 000000c6, %f31 = ff00c3fc
	fcmpes	%fcc0,%f21,%f31		! %fcc0 = 2
!	Mem[0000000010101400] = 00008036, %l1 = d3c9f2a7f768b10d
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000036
!	Mem[0000000010041408] = b94bbe2d, %f17 = 52000000
	lda	[%i1+%o4]0x80,%f17	! %f17 = b94bbe2d
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000030141410] = 00000000 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030141400] = ffccb852, %l1 = 0000000000000036
	ldswa	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffccb852
!	Mem[0000000030101400] = ff00c3fc, %l0 = 00000000ea2c70e6
	lduba	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000fc
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000021800100] = ffbd39f1
	sth	%l2,[%o3+0x100]		! Mem[0000000021800100] = 000039f1

p0_label_80:
!	%l3 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stba	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000010081410] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[000000001008140b] = aec1c065, %l6 = ffffffffff00ffff
	ldstub	[%i2+0x00b],%l6		! %l6 = 00000065000000ff
!	Mem[00000000300c1408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000000000fc, Mem[0000000030081400] = dfccb852
	stba	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = fcccb852
!	%l4 = 0000000000006383, Mem[00000000201c0000] = ffff0197
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 63830197
!	%f28 = 00008136 dfaee5f8, Mem[0000000010001420] = 0fda436a f0123356
	std	%f28,[%i0+0x020]	! Mem[0000000010001420] = 00008136 dfaee5f8
!	%l2 = 0000000000000000, Mem[0000000030141410] = 00000000
	stha	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	Mem[0000000010041406] = 6d25e01f, %l0 = 00000000000000fc
	ldstuba	[%i1+0x006]%asi,%l0	! %l0 = 000000e0000000ff
!	Starting 10 instruction Load Burst
!	%l4 = 0000000000006383, %l3 = 00000000000000ff, %l0 = 00000000000000e0
	xor	%l4,%l3,%l0		! %l0 = 000000000000637c

p0_label_81:
!	Mem[0000000030101400] = ff00c3fc, %l6 = 0000000000000065
	ldsba	[%i4+%g0]0x89,%l6	! %l6 = fffffffffffffffc
!	Mem[00000000211c0000] = fffff58c, %l0 = 000000000000637c
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000010041408] = b94bbe2d, %l5 = 00000000000000ff
	ldsba	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffffffb9
!	Mem[00000000100c1400] = aba04009, %l2 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l2	! %l2 = 000000000000aba0
!	Mem[0000000030181408] = 00000000, %l0 = 000000000000ffff
	ldsba	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Code Fragment 3
p0_fragment_13:
!	%l0 = 0000000000000000
	setx	0xfd20a567ae01c667,%g7,%l0 ! %l0 = fd20a567ae01c667
!	%l1 = ffffffffffccb852
	setx	0xd7338bcfa964d8ee,%g7,%l1 ! %l1 = d7338bcfa964d8ee
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fd20a567ae01c667
	setx	0xd8a675bff04124dc,%g7,%l0 ! %l0 = d8a675bff04124dc
!	%l1 = d7338bcfa964d8ee
	setx	0x69c4cc187b725a64,%g7,%l1 ! %l1 = 69c4cc187b725a64
!	Mem[0000000030141400] = ffccb852, %l0 = d8a675bff04124dc
	ldsba	[%i5+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001430] = fffffffffff3b315, %f0  = 00006383 52b8ccff
	ldda	[%i0+0x030]%asi,%f0 	! %f0  = ffffffff fff3b315
!	Mem[00000000211c0000] = fffff58c, %l0 = ffffffffffffffff
	ldsh	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 0000aba0, %l3 = 000000ff, Mem[00000000300c1408] = 000000ff 0000ffff
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000aba0 000000ff

p0_label_82:
!	%l6 = fffffffc, %l7 = ffffffff, Mem[0000000010001408] = 4ff7e202 462ee53a
	stda	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = fffffffc ffffffff
!	Mem[0000000010181430] = 1a5e801217c0a3f4, %l7 = ffffffffffffffff, %l5 = ffffffffffffffb9
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = 1a5e801217c0a3f4
!	%l0 = ffffffffffffffff, Mem[0000000010041400] = 34735df2
	stha	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 3473ffff
!	%f0  = ffffffff fff3b315, Mem[0000000010001408] = fffffffc ffffffff
	stda	%f0 ,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff fff3b315
!	Mem[0000000010141408] = fcc300ff, %l6 = fffffffffffffffc
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 000000fc000000ff
!	Mem[0000000010001400] = ff00b852, %l0 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	%l0 = 000000ff, %l1 = 7b725a64, Mem[0000000030101408] = 00000000 80000000
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff 7b725a64
!	%l5 = 1a5e801217c0a3f4, Mem[0000000010041410] = 00000000
	stba	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = f4000000
!	%f2  = ffff0000, Mem[0000000010081400] = 1fe0256d
	sta	%f2 ,[%i2+%g0]0x80	! Mem[0000000010081400] = ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff00b852, %l5 = 1a5e801217c0a3f4
	lduha	[%i0+%g0]0x80,%l5	! %l5 = 000000000000ff00

p0_label_83:
!	Mem[0000000030181408] = 00000000, %l5 = 000000000000ff00
	ldswa	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = ffffffff, %l6 = 00000000000000fc
	ldsba	[%i0+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141400] = 00006d25, %l4 = 0000000000006383
	lduha	[%i5+%g0]0x88,%l4	! %l4 = 0000000000006d25
!	Mem[0000000030081400] = 52b8ccfc, %l1 = 69c4cc187b725a64
	ldsha	[%i2+%g0]0x89,%l1	! %l1 = ffffffffffffccfc
!	Mem[0000000010081408] = ffc0c1ae, %l3 = 00000000000000ff
	lduha	[%i2+%o4]0x88,%l3	! %l3 = 000000000000c1ae
!	Mem[0000000010101400] = 36800000, %l7 = ffffffffffffffff
	ldsha	[%i4+%g0]0x80,%l7	! %l7 = 0000000000003680
!	Mem[0000000030101400] = ff00c3fc, %l1 = ffffffffffffccfc
	ldsba	[%i4+%g0]0x89,%l1	! %l1 = fffffffffffffffc
!	Mem[00000000100c1408] = dee030b7808eff43, %f30 = ffffffff ff00c3fc
	ldda	[%i3+%o4]0x88,%f30	! %f30 = dee030b7 808eff43
!	Mem[0000000010081408] = aec1c0ff, %l1 = fffffffffffffffc
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffffffae
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = aec1c0ff, %l6 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 000000ae000000ff

p0_label_84:
!	%f10 = 31110727 38f0f46e, Mem[0000000010101408] = 0000ffff b730e0de
	stda	%f10,[%i4+%o4]0x80	! Mem[0000000010101408] = 31110727 38f0f46e
!	Mem[0000000021800100] = 000039f1, %l5 = 0000000000000000
	ldstuba	[%o3+0x100]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = ff00ffff, %l2 = 000000000000aba0
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 00000000ff00ffff
!	%l4 = 00006d25, %l5 = 00000000, Mem[0000000030081410] = 00000000 00000000
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00006d25 00000000
!	Mem[0000000010101418] = ef2e666e484d2b5d, %l7 = 0000000000003680, %l4 = 0000000000006d25
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l7,%l4	! %l4 = ef2e666e484d2b5d
!	Mem[0000000010101400] = 36800000c96c1564, %l6 = 00000000000000ae, %l1 = ffffffffffffffae
	casxa	[%i4]0x80,%l6,%l1	! %l1 = 36800000c96c1564
!	%f23 = 6d25e01f, Mem[00000000100c1408] = 43ff8e80
	sta	%f23,[%i3+%o4]0x80	! Mem[00000000100c1408] = 6d25e01f
!	%l6 = 00000000000000ae, Mem[0000000010101428] = c7fb8363, %asi = 80
	stba	%l6,[%i4+0x028]%asi	! Mem[0000000010101428] = aefb8363
!	%l5 = 0000000000000000, Mem[00000000100c1410] = 250b1a27
	stha	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00001a27
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000000940a0ab, %f2  = ffff0000 3016af6e
	ldda	[%i3+%g0]0x88,%f2 	! %f2  = 00000000 0940a0ab

p0_label_85:
!	Mem[0000000030041410] = 36810000, %l7 = 0000000000003680
	lduwa	[%i1+%o5]0x89,%l7	! %l7 = 0000000036810000
!	Mem[000000001018141c] = e87aaa91, %l0 = 00000000000000ff
	lduh	[%i6+0x01c],%l0		! %l0 = 000000000000e87a
!	Mem[0000000010141400] = 0000ff00 00006d25, %l0 = 0000e87a, %l1 = c96c1564
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 0000000000006d25 000000000000ff00
!	Mem[0000000010101430] = ffffffa9, %l3 = 000000000000c1ae
	ldsha	[%i4+0x030]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081410] = ffffffff, %l4 = ef2e666e484d2b5d
	ldswa	[%i2+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = 256d0000, %l6 = 00000000000000ae
	lduwa	[%i5+%g0]0x80,%l6	! %l6 = 00000000256d0000
!	Mem[00000000100c1408] = 6d25e01f, %l7 = 0000000036810000
	lduba	[%i3+%o4]0x80,%l7	! %l7 = 000000000000006d
!	Mem[00000000100c1410] = 271a0000, %l3 = ffffffffffffffff
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 00000000271a0000
!	Mem[0000000030101410] = c6000000, %l5 = 0000000000000000
	lduha	[%i4+%o5]0x81,%l5	! %l5 = 000000000000c600
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 000000f4, %l4 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 000000f4000000ff

p0_label_86:
!	Mem[0000000010081400] = ffff0000, %l0 = 0000000000006d25
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	%f12 = c23bf3d0, Mem[00000000300c1410] = 00000000
	sta	%f12,[%i3+%o5]0x81	! Mem[00000000300c1410] = c23bf3d0
!	%l6 = 256d0000, %l7 = 0000006d, Mem[0000000010101408] = 31110727 38f0f46e
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 256d0000 0000006d
!	%l2 = 00000000ff00ffff, Mem[0000000020800000] = ffff7ff0, %asi = 80
	stba	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = ffff7ff0
!	%l7 = 000000000000006d, Mem[0000000030181410] = 5dc13d40
	stwa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000006d
!	%l7 = 000000000000006d, Mem[0000000010181400] = ff157334, %asi = 80
	stwa	%l7,[%i6+0x000]%asi	! Mem[0000000010181400] = 0000006d
!	Mem[00000000100c140e] = b730e0de, %l4 = 00000000000000f4
	ldstuba	[%i3+0x00e]%asi,%l4	! %l4 = 000000e0000000ff
!	Mem[0000000030181410] = 0000006d, %l3 = 00000000271a0000
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 000000000000006d
!	Mem[00000000100c1410] = 00001a27, %l3 = 000000000000006d
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010001400] = ff00b852 e22a57a2 ffffffff fff3b315
!	Mem[0000000010001410] = 00000000 00006d25 ba371750 47c7492b
!	Mem[0000000010001420] = 00008136 dfaee5f8 bcc28440 e9fe58b4
!	Mem[0000000010001430] = ffffffff fff3b315 00003ed1 ea2c70e6
	ldda	[%i0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400

p0_label_87:
!	Mem[0000000010101438] = d6755a69 000000cf, %l4 = 000000e0, %l5 = 0000c600
	ldd	[%i4+0x038],%l4		! %l4 = 00000000d6755a69 00000000000000cf
!	%l4 = 00000000d6755a69, immed = 00000eab, %y  = e250a4f0
	umul	%l4,0xeab,%l5		! %l5 = 00000c49ab552223, %y = 00000c49
!	Mem[00000000100c1438] = df20400a, %l5 = 00000c49ab552223
	ldsb	[%i3+0x038],%l5		! %l5 = ffffffffffffffdf
!	Mem[0000000010041418] = 14d059cbafe44c84, %f4  = 00000000 00000000
	ldd	[%i1+0x018],%f4 	! %f4  = 14d059cb afe44c84
!	Mem[0000000010181410] = 000000ff 271a0bdf, %l0 = 000000ff, %l1 = 0000ff00
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 00000000000000ff 00000000271a0bdf
!	Mem[00000000300c1400] = 00000000, %l7 = 000000000000006d
	lduwa	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = 0000005e, %l4 = 00000000d6755a69
	ldswa	[%i0+%o4]0x89,%l4	! %l4 = 000000000000005e
!	Mem[0000000030141400] = ffccb85283630000, %f6  = 20b1641b 861d2008
	ldda	[%i5+%g0]0x81,%f6 	! %f6  = ffccb852 83630000
!	Mem[0000000030001400] = ff000000, %l0 = 00000000000000ff
	lduwa	[%i0+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = fffff58c, %l0 = 00000000ff000000
	ldstub	[%o2+0x001],%l0		! %l0 = 000000ff000000ff

p0_label_88:
!	Mem[0000000030081408] = 0000aba0, %l1 = 00000000271a0bdf
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%l2 = 00000000ff00ffff, Mem[0000000010081410] = ffffffff
	stb	%l2,[%i2+%o5]		! Mem[0000000010081410] = ffffffff
!	%l6 = 256d0000, %l7 = 00000000, Mem[00000000300c1410] = d0f33bc2 31eddc7e
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 256d0000 00000000
!	Mem[0000000010101400] = 36800000, %l2 = 00000000ff00ffff
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 00000036000000ff
!	%l6 = 256d0000, %l7 = 00000000, Mem[0000000010101438] = d6755a69 000000cf
	std	%l6,[%i4+0x038]		! Mem[0000000010101438] = 256d0000 00000000
!	Mem[0000000010141428] = c7fb836352b8cc6e, %l7 = 0000000000000000, %l0 = 00000000000000ff
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = c7fb836352b8cc6e
!	%l0 = c7fb836352b8cc6e, %l5 = ffffffffffffffdf, %l3  = 0000000000000000
	mulx	%l0,%l5,%l3		! %l3 = 38941032562da5d2
!	Mem[0000000030081408] = a0ab00ff, %l6 = 00000000256d0000
	swapa	[%i2+%o4]0x89,%l6	! %l6 = 00000000a0ab00ff
!	Mem[0000000030101408] = 000000ff, %l0 = c7fb836352b8cc6e
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 000000c6, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000c6

p0_label_89:
!	Mem[0000000030181400] = 000000ff, %l0 = 00000000000000ff
	lduha	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181408] = 00000000, %l7 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 0000a900 00000000, %l6 = a0ab00ff, %l7 = 00000000
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 000000000000a900 0000000000000000
!	Mem[0000000010041410] = 00000000000000ff, %l2 = 0000000000000036
	ldxa	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001408] = 5e000000fb000000, %f10 = 31110727 38f0f46e
	ldda	[%i0+%o4]0x81,%f10	! %f10 = 5e000000 fb000000
!	Mem[0000000010181420] = ffffff0b, %l0 = 00000000000000ff
	lduha	[%i6+0x022]%asi,%l0	! %l0 = 000000000000ff0b
!	Mem[0000000010001410] = 0000000000006d25, %f14 = 347fd652 3a89aa7e
	ldd	[%i0+%o5],%f14		! %f14 = 00000000 00006d25
!	Mem[0000000030101400] = ff00c3fc, %l4 = 000000000000005e
	lduwa	[%i4+%g0]0x89,%l4	! %l4 = 00000000ff00c3fc
!	Mem[00000000100c1418] = 91aa7ae8, %l6 = 000000000000a900
	ldsha	[%i3+0x01a]%asi,%l6	! %l6 = 0000000000007ae8
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000c6, imm = fffffffffffff677, %l0 = 000000000000ff0b
	add	%l1,-0x989,%l0		! %l0 = fffffffffffff73d

p0_label_90:
!	%l1 = 00000000000000c6, Mem[0000000010181410] = 000000ff271a0bdf
	stxa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000000000c6
!	%f2  = 00000000 0940a0ab, Mem[0000000010181418] = 94495cf4 e87aaa91
	std	%f2 ,[%i6+0x018]	! Mem[0000000010181418] = 00000000 0940a0ab
!	Mem[0000000010141420] = 000000ff, %l0 = fffffffffffff73d
	swap	[%i5+0x020],%l0		! %l0 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010101438] = 256d000000000000
	stx	%l0,[%i4+0x038]		! Mem[0000000010101438] = 00000000000000ff
!	%f7  = 83630000, %f10 = 5e000000, %f6  = ffccb852 83630000
	fsmuld	%f7 ,%f10,%f6 		! %f6  = bc3c6000 00000000
!	%l4 = 00000000ff00c3fc, Mem[0000000030101400] = ff00c3fc
	stba	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = ff00c3fc
!	%l5 = ffffffffffffffdf, Mem[0000000030041408] = 00a90000
	stba	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 00a900df
!	Mem[0000000030181408] = 00000000, %l5 = ffffffffffffffdf
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%f8  = 0b679900 403dc15d, %l1 = 00000000000000c6
!	Mem[0000000030001418] = 7b76804409c19a6a
	add	%i0,0x018,%g1
	stda	%f8,[%g1+%l1]ASI_PST8_S ! Mem[0000000030001418] = 0b678044093dc16a
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00006383a9ffffff, %l2 = 00000000000000ff
	ldxa	[%i1+%g0]0x81,%l2	! %l2 = 00006383a9ffffff

p0_label_91:
!	%l2 = 00006383a9ffffff, imm = fffffffffffff507, %l6 = 0000000000007ae8
	xor	%l2,-0xaf9,%l6		! %l6 = ffff9c7c56000af8
!	Mem[0000000010041410] = ff000000, %l6 = ffff9c7c56000af8
	ldswa	[%i1+%o5]0x80,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030001400] = 000000ff, %l1 = 00000000000000c6
	ldsba	[%i0+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1430] = f4a3c01712805e1a, %f16 = a2572ae2 52b800ff
	ldd	[%i3+0x030],%f16	! %f16 = f4a3c017 12805e1a
!	Mem[00000000100c1408] = 6d25e01f, %l1 = ffffffffffffffff
	lduwa	[%i3+%o4]0x80,%l1	! %l1 = 000000006d25e01f
!	%l0 = 00000000000000ff, %l6 = ffffffffff000000, %l1 = 000000006d25e01f
	and	%l0,%l6,%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1414] = ff000000, %l3 = 38941032562da5d2
	lduba	[%i3+0x015]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = 256d0000, %l2 = 00006383a9ffffff
	lduwa	[%i5+%g0]0x80,%l2	! %l2 = 00000000256d0000
!	Mem[0000000030041408] = df00a90000000000, %l7 = 0000000000000000
	ldxa	[%i1+%o4]0x81,%l7	! %l7 = df00a90000000000
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffff000000, %l0 = 00000000000000ff, %l1 = 0000000000000000
	add	%l6,%l0,%l1		! %l1 = ffffffffff0000ff

p0_label_92:
!	%l1 = ffffffffff0000ff, Mem[0000000030081410] = 256d0000
	stba	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 256d00ff
!	Mem[0000000010081438] = e78f805c092528b7, %l5 = 0000000000000000, %l3 = 0000000000000000
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = e78f805c092528b7
!	%l0 = 00000000000000ff, imm = 0000000000000dfa, %l0 = 00000000000000ff
	or	%l0,0xdfa,%l0		! %l0 = 0000000000000dff
!	Mem[00000000100c1419] = 91aa7ae8, %l0 = 0000000000000dff
	ldstuba	[%i3+0x019]%asi,%l0	! %l0 = 000000aa000000ff
!	Mem[0000000010181400] = 0000006d, %l0 = 00000000000000aa
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 000000000000006d
!	Mem[0000000010181408] = 00000000, %l5 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l1 = ffffffffff0000ff
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[000000001014142d] = 52b8cc6e, %l0 = 000000000000006d
	ldstub	[%i5+0x02d],%l0		! %l0 = 000000b8000000ff
!	%l7 = df00a90000000000, Mem[0000000030041410] = 00008136
	stwa	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101434] = ff00b852, %l5 = 0000000000000000
	lduba	[%i4+0x037]%asi,%l5	! %l5 = 0000000000000052

p0_label_93:
!	Mem[0000000010141414] = 5b0d5343, %l7 = df00a90000000000
	ldsba	[%i5+0x017]%asi,%l7	! %l7 = 0000000000000043
!	Mem[0000000030141410] = 00000000, %l2 = 00000000256d0000
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = 0000005252b8cc6e, %f28 = 15b3f3ff ffffffff
	ldda	[%i0+%o5]0x81,%f28	! %f28 = 00000052 52b8cc6e
!	Mem[0000000010101434] = ff00b852, %l3 = e78f805c092528b7
	lduh	[%i4+0x034],%l3		! %l3 = 000000000000ff00
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (20)
!	Mem[00000000100c1400] = aba04009 00000000 6d25e01f b730ffde
!	Mem[00000000100c1410] = ff001a27 ff000000 91ff7ae8 f45c4994
!	Mem[00000000100c1420] = 00000000 00000000 02e2f74f 43ff8e80
!	Mem[00000000100c1430] = f4a3c017 12805e1a df20400a 98b14417
	ldda	[%i3]ASI_BLK_AIUPL,%f0	! Block Load from 00000000100c1400
!	Mem[00000000100c1408] = 6d25e01fb730ffde, %f24 = f8e5aedf 36810000
	ldda	[%i3+%o4]0x80,%f24	! %f24 = 6d25e01f b730ffde
!	Mem[0000000030041410] = 00000000, %l7 = 0000000000000043
	lduba	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 000000aa 6d25e01f 00000000 5d07ffbf
!	Mem[0000000010181410] = 00000000 000000c6 00000000 0940a0ab
!	Mem[0000000010181420] = ffffff0b 0000005c 808eff43 4ff7e202
!	Mem[0000000010181430] = 1a5e8012 17c0a3f4 1744b198 0a4020df
	ldda	[%i6]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 000080ff, %l2 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 00000000000080ff

p0_label_94:
!	%l0 = 000000b8, %l1 = 000000ff, Mem[00000000300c1400] = 00000000 e102e5c6
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000b8 000000ff
!	Mem[0000000020800000] = ffff7ff0, %l0 = 00000000000000b8
	ldstub	[%o1+%g0],%l0		! %l0 = 000000ff000000ff
!	%f9  = 00000000, Mem[0000000010101400] = 00000000
	sta	%f9 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l0 = 00000000000000ff, Mem[0000000010041439] = ff456004
	stb	%l0,[%i1+0x039]		! Mem[0000000010041438] = ffff6004
!	Mem[0000000010041408] = 2dbe4bb9, %l3 = 000000000000ff00
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 000000002dbe4bb9
!	%l5 = 0000000000000052, %l2 = 00000000000080ff, %y  = 00000c49
	udiv	%l5,%l2,%l0		! %l0 = 0000000018616de7
	mov	%l0,%y			! %y = 18616de7
!	Mem[0000000010101400] = 00000000, %l2 = 00000000000080ff
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l0 = 0000000018616de7, Mem[0000000010141410] = 52b8ccff
	stwa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 18616de7
!	Mem[0000000030001400] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = c6000000 36800000, %l6 = ff000000, %l7 = 000000ff
	ldda	[%i4+%o5]0x81,%l6	! %l6 = 00000000c6000000 0000000036800000

p0_label_95:
!	Mem[0000000010041410] = ff000000, %l0 = 0000000018616de7
	ldsha	[%i1+0x012]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l7 = 0000000036800000
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = ffff7ff0, %l1 = 00000000000000ff
	ldsh	[%o1+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030041410] = 00000000dfaee5f8, %f2  = deff30b7 1fe0256d
	ldda	[%i1+%o5]0x81,%f2 	! %f2  = 00000000 dfaee5f8
!	Mem[0000000030101410] = 000000c6, %f9  = 00000000
	lda	[%i4+%o5]0x89,%f9 	! %f9 = 000000c6
!	Mem[0000000010101400] = ff000000c96c1564, %l6 = 00000000c6000000
	ldxa	[%i4+%g0]0x80,%l6	! %l6 = ff000000c96c1564
!	Mem[000000001000142c] = e9fe58b4, %l2 = 0000000000000000
	ldswa	[%i0+0x02c]%asi,%l2	! %l2 = ffffffffe9fe58b4
!	Mem[0000000010141410] = e76d6118, %f14 = 1744b198
	ld	[%i5+%o5],%f14	! %f14 = e76d6118
!	Mem[00000000100c1400] = 0940a0ab, %l3 = 000000002dbe4bb9
	ldsha	[%i3+%g0]0x88,%l3	! %l3 = ffffffffffffa0ab
!	Starting 10 instruction Store Burst
!	%f10 = 808eff43, Mem[0000000030141400] = 52b8ccff
	sta	%f10,[%i5+%g0]0x89	! Mem[0000000030141400] = 808eff43

p0_label_96:
!	Mem[0000000030081408] = 256d0000, %l4 = 00000000ff00c3fc
	ldstuba	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010101408] = 6d00000000006d25
	stxa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000000
	membar	#Sync			! Added by membar checker (21)
!	%f6  = 94495cf4 e87aff91, Mem[00000000100c1400] = aba04009 00000000
	stda	%f6 ,[%i3+0x000]%asi	! Mem[00000000100c1400] = 94495cf4 e87aff91
!	Mem[0000000010081408] = ffc1c0ff, %l1 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000201c0000] = 63830197, %l0 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 00000063000000ff
!	%f9  = 000000c6, Mem[0000000030141408] = 6eaf1630
	sta	%f9 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000c6
!	Mem[0000000030041408] = 00a900df, %l1 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 000000df000000ff
!	Mem[0000000030141408] = 000000c6, %l4 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 00000000000000c6
!	Mem[0000000030141408] = 00000000, %l2 = ffffffffe9fe58b4
	ldstuba	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff00b852, %l6 = ff000000c96c1564
	ldsba	[%i0+%g0]0x80,%l6	! %l6 = ffffffffffffffff

p0_label_97:
!	Mem[00000000211c0000] = fffff58c, %l4 = 00000000000000c6
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[000000001010140c] = 00000000, %l2 = 0000000000000000
	ldsha	[%i4+0x00c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041424] = dfbb042c, %l0 = 0000000000000063
	ldub	[%i1+0x026],%l0		! %l0 = 0000000000000004
!	Mem[0000000010041408] = 0000ff00, %l0 = 0000000000000004
	lduba	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = b8000000, %l6 = ffffffffffffffff
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = ffffffffb8000000
!	Mem[0000000030141400] = 43ff8e80, %l2 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000043
!	Mem[0000000030101400] = ff00c3fc, %l3 = ffffffffffffa0ab
	lduwa	[%i4+%g0]0x89,%l3	! %l3 = 00000000ff00c3fc
!	Mem[0000000010181438] = 1744b198 0a4020df, %l2 = 00000043, %l3 = ff00c3fc
	ldda	[%i6+0x038]%asi,%l2	! %l2 = 000000001744b198 000000000a4020df
!	Mem[0000000010181414] = 000000c6, %f30 = 1744b198
	ld	[%i6+0x014],%f30	! %f30 = 000000c6
!	Starting 10 instruction Store Burst
!	Mem[0000000021800181] = de84ed8e, %l6 = ffffffffb8000000
	ldstuba	[%o3+0x181]%asi,%l6	! %l6 = 00000084000000ff

p0_label_98:
!	%l3 = 000000000a4020df, Mem[0000000010181414] = 000000c6
	sth	%l3,[%i6+0x014]		! Mem[0000000010181414] = 20df00c6
!	Mem[0000000030181400] = ff000000, %l3 = 000000000a4020df
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	%l2 = 000000001744b198, Mem[0000000010101410] = 000000ff
	stwa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 1744b198
!	%l7 = 0000000000000000, Mem[0000000010141408] = ff00c3ff
	stba	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = ff00c300
!	%l2 = 000000001744b198, Mem[0000000010001410] = 00000000
	stba	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 98000000
!	Mem[0000000010041400] = ffff7334, %l6 = 0000000000000084
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000300c1410] = 00006d25, %l4 = 000000000000ffff
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%f22 = 00000000 0940a0ab, Mem[0000000010101400] = 000000ff 64156cc9
	stda	%f22,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 0940a0ab
!	%l3 = 00000000ff000000, Mem[0000000010041408] = 00ff000000000000
	stxa	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = ba37175047c7492b, %f22 = 00000000 0940a0ab
	ldd	[%i0+0x018],%f22	! %f22 = ba371750 47c7492b

p0_label_99:
!	Mem[0000000010141434] = e102e5c6, %l0 = 0000000000000000
	ldsh	[%i5+0x036],%l0		! %l0 = ffffffffffffe5c6
!	Mem[0000000010181410] = 00000000, %f28 = 1a5e8012
	lda	[%i6+%o5]0x80,%f28	! %f28 = 00000000
!	Mem[0000000010041408] = 00000000, %l6 = 00000000000000ff
	lduba	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = ff00000000000000, %f14 = e76d6118 0a4020df
	ldda	[%i0+%g0]0x81,%f14	! %f14 = ff000000 00000000
!	Mem[00000000300c1408] = 000000ff0000aba0, %f22 = ba371750 47c7492b
	ldda	[%i3+%o4]0x89,%f22	! %f22 = 000000ff 0000aba0
!	Mem[0000000010081408] = ffc0c1ff, %l3 = 00000000ff000000
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 00000000ffc0c1ff
!	Mem[0000000030141400] = 43ff8e80, %l0 = ffffffffffffe5c6
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = 0000000043ff8e80
!	Mem[0000000030081400] = 52b8ccfc, %l7 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000fc
!	Mem[0000000030141408] = 000000ff, %f21 = 000000c6
	lda	[%i5+%o4]0x89,%f21	! %f21 = 000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ffc0c1ff, Mem[0000000010141410] = e76d6118, %asi = 80
	stwa	%l3,[%i5+0x010]%asi	! Mem[0000000010141410] = ffc0c1ff

p0_label_100:
!	%l2 = 1744b198, %l3 = ffc0c1ff, Mem[00000000300c1400] = b8000000 ff000000
	stda	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 1744b198 ffc0c1ff
!	Mem[0000000010101403] = aba04009, %l5 = 0000000000000052
	ldstub	[%i4+0x003],%l5		! %l5 = 00000009000000ff
!	Mem[0000000010001418] = ba37175047c7492b, %l2 = 000000001744b198, %l2 = 000000001744b198
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = ba37175047c7492b
!	Mem[0000000010101410] = 98b14417, %l0 = 0000000043ff8e80
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 00000017000000ff
!	Mem[0000000030001410] = 00000052, %l0 = 0000000000000017
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000052
!	%l5 = 0000000000000009, Mem[00000000100c1410] = ff001a27
	stha	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00091a27
!	Mem[00000000100c1408] = 1fe0256d, %l5 = 0000000000000009
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 0000006d000000ff
!	Mem[00000000300c1410] = 256d00ff, %l5 = 000000000000006d
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%l0 = 0000000000000052, Mem[0000000030001408] = 5e000000
	stba	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 52000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181434] = 17c0a3f4, %l6 = 0000000000000000
	ldsha	[%i6+0x036]%asi,%l6	! %l6 = ffffffffffffa3f4

p0_label_101:
!	Mem[0000000030141410] = 256d0000, %l0 = 0000000000000052
	ldsba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = ff25e01f b730ffde, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 00000000ff25e01f 00000000b730ffde
!	Mem[00000000100c1410] = 00091a27, %l4 = 00000000ff25e01f
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = 0000000000091a27
!	Mem[0000000030001410] = 00000017, %l7 = 00000000000000fc
	ldsha	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 1fe025ff, %f22 = 000000ff
	lda	[%i3+%o4]0x88,%f22	! %f22 = 1fe025ff
!	Mem[0000000010101408] = 0000000000000000, %f14 = ff000000 00000000
	ldda	[%i4+%o4]0x88,%f14	! %f14 = 00000000 00000000
!	Mem[0000000010041400] = ffff7334, %l2 = ba37175047c7492b
	lduba	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = 256d000000000098, %l6 = ffffffffffffa3f4
	ldxa	[%i0+%o5]0x88,%l6	! %l6 = 256d000000000098
!	Mem[0000000030101400] = ff00c3fc, %l5 = 00000000b730ffde
	ldsha	[%i4+%g0]0x89,%l5	! %l5 = ffffffffffffc3fc
!	Starting 10 instruction Store Burst
!	Mem[0000000010041430] = 7407d1cce5105f46, %l4 = 0000000000091a27, %l1 = 00000000000000df
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l4,%l1	! %l1 = 7407d1cce5105f46

p0_label_102:
!	%l7 = 0000000000000000, Mem[0000000010101400] = aba040ff
	stwa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l6 = 256d000000000098, Mem[0000000030081400] = 52b8ccfc
	stba	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 52b8cc98
!	%l6 = 00000098, %l7 = 00000000, Mem[0000000010041410] = ff000000 00000000
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000098 00000000
!	%l6 = 00000098, %l7 = 00000000, Mem[0000000010081410] = ffffffff ffd1ffff
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000098 00000000
!	%l2 = 00000000000000ff, Mem[0000000030101400] = fcc300ff
	stba	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = ffc300ff
!	%l5 = ffffffffffffc3fc, Mem[0000000030001410] = 17000000
	stha	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 1700c3fc
!	Mem[0000000010181410] = 00000000, %l3 = 00000000ffc0c1ff
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 94495cf4
	stha	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00005cf4
!	%f30 = 000000c6 0a4020df, %l7 = 0000000000000000
!	Mem[0000000010181428] = 808eff434ff7e202
	add	%i6,0x028,%g1
	stda	%f30,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010181428] = 808eff434ff7e202
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = fffff58c, %l2 = 00000000000000ff
	lduh	[%o2+%g0],%l2		! %l2 = 000000000000ffff

p0_label_103:
!	Mem[0000000010041410] = 98000000, %l2 = 000000000000ffff
	ldsha	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041424] = dfbb042c, %l2 = 0000000000000000
	ldsh	[%i1+0x026],%l2		! %l2 = 000000000000042c
!	Mem[0000000030041400] = 00006383, %l4 = 0000000000091a27
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 00005cf4, %l3 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[000000001010140c] = 00000000, %f8  = 00000000
	lda	[%i4+0x00c]%asi,%f8 	! %f8 = 00000000
!	Mem[00000000100c1410] = 00091a27 ff000000, %l2 = 0000042c, %l3 = 00000000
	ldda	[%i3+0x010]%asi,%l2	! %l2 = 0000000000091a27 00000000ff000000
!	Mem[0000000010001410] = 98000000, %l2 = 0000000000091a27
	lduha	[%i0+%o5]0x80,%l2	! %l2 = 0000000000009800
!	Mem[0000000010101410] = 98b144ff, %l7 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l7	! %l7 = 00000000000044ff
!	Mem[0000000030001400] = 000000ff, %l0 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000030041400] = 83630000
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff

p0_label_104:
!	%l2 = 00009800, %l3 = ff000000, Mem[0000000030001400] = ff000000 00000000
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00009800 ff000000
!	%l3 = 00000000ff000000, Mem[0000000010041408] = 00000000ff000000
	stxa	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000ff000000
!	%l4 = 0000000000000000, Mem[0000000010181410] = ff000000
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%l0 = 00000000000000ff, Mem[000000001018140f] = 5d07ffbf
	stb	%l0,[%i6+0x00f]		! Mem[000000001018140c] = 5d07ffff
!	Mem[0000000010181408] = 00000000, %l5 = ffffffffffffc3fc
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081400] = 0000ffff, %l0 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 000000000000ffff
!	%l2 = 00009800, %l3 = ff000000, Mem[0000000010141408] = ff00c300 c6e502e1
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00009800 ff000000
!	Mem[0000000010141418] = ff572ae2, %l7 = 00000000000044ff, %asi = 80
	swapa	[%i5+0x018]%asi,%l7	! %l7 = 00000000ff572ae2
!	%l6 = 256d000000000098, Mem[0000000010141400] = 256d0000
	stha	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00980000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000098, %f0  = 00000000
	lda	[%i1+%o5]0x80,%f0 	! %f0 = 00000098

p0_label_105:
!	Mem[0000000010101410] = 98b144ff, %f31 = 0a4020df
	lda	[%i4+%o5]0x88,%f31	! %f31 = 98b144ff
!	Mem[00000000300c1400] = 98b14417, %l7 = 00000000ff572ae2
	ldsha	[%i3+%g0]0x89,%l7	! %l7 = 0000000000004417
!	Mem[00000000201c0000] = ff830197, %l5 = 0000000000000000
	ldub	[%o0+0x001],%l5		! %l5 = 0000000000000083
!	Mem[0000000010041400] = ffff73346d25ff1f, %l4 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = ffff73346d25ff1f
!	Mem[0000000010101400] = 00000000, %l5 = 0000000000000083
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 98b14417, %l0 = 000000000000ffff
	lduba	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000017
!	Mem[0000000010081400] = 000000ff, %l3 = 00000000ff000000
	ldswa	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = 1fe025ff, %l0 = 0000000000000017
	ldsba	[%i3+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030141408] = ff000000, %l2 = 0000000000009800
	lduba	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000030081408] = ffff0000256d00ff
	stxa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000ff

p0_label_106:
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010141408] = 00009800 ff000000
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff 000000ff
!	%l1 = 7407d1cce5105f46, Mem[0000000030181410] = 271a0000
	stha	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 5f460000
!	%f20 = 00000000 000000ff, Mem[0000000030181408] = ff000000 dfae89f8
	stda	%f20,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 000000ff
!	Mem[0000000010041434] = e5105f46, %l1 = 7407d1cce5105f46
	swap	[%i1+0x034],%l1		! %l1 = 00000000e5105f46
!	Mem[00000000300c1400] = 98b14417, %l3 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l3	! %l3 = 0000000098b14417
!	%f14 = 00000000 00000000, %l3 = 0000000098b14417
!	Mem[00000000300c1410] = ff006d2500000000
	add	%i3,0x010,%g1
	stda	%f14,[%g1+%l3]ASI_PST16_S ! Mem[00000000300c1410] = ff00000000000000
!	Mem[0000000021800041] = 6d250053, %l5 = 0000000000000000
	ldstub	[%o3+0x041],%l5		! %l5 = 00000025000000ff
!	Mem[0000000010101438] = 00000000000000ff, %l6 = 256d000000000098, %l1 = 00000000e5105f46
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001408] = ffffffff, %l1 = 00000000000000ff
	swapa	[%i0+%o4]0x88,%l1	! %l1 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = fffff58c, %l0 = ffffffffffffffff
	ldsba	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffffff

p0_label_107:
!	Mem[0000000020800000] = ffff7ff0, %l0 = ffffffffffffffff
	ldsba	[%o1+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1400] = ffc1c0ff000000ff, %l7 = 0000000000004417
	ldxa	[%i3+%g0]0x89,%l7	! %l7 = ffc1c0ff000000ff
!	Mem[00000000100c1408] = ff25e01fb730ffde, %l4 = ffff73346d25ff1f
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = ff25e01fb730ffde
!	Mem[0000000010141410] = ffc0c1ff, %l6 = 256d000000000098
	ldswa	[%i5+%o5]0x80,%l6	! %l6 = ffffffffffc0c1ff
!	Mem[00000000100c142c] = 43ff8e80, %f24 = ffffff0b
	ld	[%i3+0x02c],%f24	! %f24 = 43ff8e80
!	Mem[0000000010001408] = 15b3f3ff000000ff, %l2 = 00000000000000ff
	ldxa	[%i0+%o4]0x88,%l2	! %l2 = 15b3f3ff000000ff
!	Mem[0000000030101408] = ff000000, %l4 = ff25e01fb730ffde
	ldsba	[%i4+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041400] = ff000000, %l2 = 15b3f3ff000000ff
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010181430] = 1a5e8012, %f21 = 000000ff
	lda	[%i6+0x030]%asi,%f21	! %f21 = 1a5e8012
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1430] = f4a3c017, %l0 = ffffffffffffffff
	swap	[%i3+0x030],%l0		! %l0 = 00000000f4a3c017

p0_label_108:
!	%l4 = ffffffffffffffff, Mem[00000000211c0000] = fffff58c
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = fffff58c
!	Mem[0000000010181430] = 1a5e8012, %l1 = ffffffff, %l4 = ffffffff
	add	%i6,0x30,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 000000001a5e8012
!	Mem[0000000030141410] = 256d0000, %l2 = ffffffffffffff00
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%f0  = 00000098 0940a0ab, Mem[0000000030141408] = 000000ff ffff0000
	stda	%f0 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000098 0940a0ab
!	Mem[00000000300c1410] = ff000000, %l0 = 00000000f4a3c017
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%f2  = 00000000, Mem[0000000010181408] = ff000000
	sta	%f2 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%l4 = 000000001a5e8012, Mem[0000000010181410] = 00000000
	stba	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 12000000
!	%f24 = 43ff8e80 0000005c, Mem[0000000030081400] = 98ccb852 83630000
	stda	%f24,[%i2+%g0]0x81	! Mem[0000000030081400] = 43ff8e80 0000005c
!	%l5 = 0000000000000025, %l4 = 000000001a5e8012, %l2 = 0000000000000000
	subc	%l5,%l4,%l2		! %l2 = ffffffffe5a18013
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 000000ff00000000, %f6  = 94495cf4 e87aff91
	ldda	[%i1+%o4]0x88,%f6 	! %f6  = 000000ff 00000000

p0_label_109:
!	Mem[0000000010041408] = 00000000, %l2 = ffffffffe5a18013
	ldsha	[%i1+0x00a]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 000000005d07ffff, %l2 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l2	! %l2 = 000000005d07ffff
!	Mem[0000000010101410] = ff44b198, %l2 = 000000005d07ffff
	ldsha	[%i4+%o5]0x80,%l2	! %l2 = ffffffffffffff44
!	Mem[00000000100c140c] = b730ffde, %l5 = 0000000000000025
	ldsw	[%i3+0x00c],%l5		! %l5 = ffffffffb730ffde
!	Mem[00000000100c1408] = deff30b7 1fe025ff, %l4 = 1a5e8012, %l5 = b730ffde
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 000000001fe025ff 00000000deff30b7
!	Mem[00000000201c0000] = ff830197, %l7 = ffc1c0ff000000ff
	ldsba	[%o0+0x001]%asi,%l7	! %l7 = ffffffffffffff83
!	Mem[0000000010041430] = 7407d1cc, %l5 = 00000000deff30b7
	lduba	[%i1+0x030]%asi,%l5	! %l5 = 0000000000000074
!	Mem[0000000010001408] = 000000ff, %l4 = 000000001fe025ff
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041408] = 0000000000a900ff, %f6  = 000000ff 00000000
	ldda	[%i1+%o4]0x89,%f6 	! %f6  = 00000000 00a900ff
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffff44, Mem[0000000021800140] = a19bd3d6
	sth	%l2,[%o3+0x140]		! Mem[0000000021800140] = ff44d3d6

p0_label_110:
!	%f13 = 17c0a3f4, Mem[0000000010041400] = ffff7334
	sta	%f13,[%i1+%g0]0x80	! Mem[0000000010041400] = 17c0a3f4
!	%l2 = ffffffffffffff44, Mem[0000000010081410] = 00000098
	stha	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000ff44
!	%f20 = 00000000 1a5e8012, %l2 = ffffffffffffff44
!	Mem[0000000010141408] = ff000000ff000000
	add	%i5,0x008,%g1
	stda	%f20,[%g1+%l2]ASI_PST8_P ! Mem[0000000010141408] = ff000000ff5e0000
!	%l0 = 00000000000000ff, Mem[0000000010181404] = 6d25e01f, %asi = 80
	stwa	%l0,[%i6+0x004]%asi	! Mem[0000000010181404] = 000000ff
!	%f13 = 17c0a3f4, Mem[0000000010101400] = 00000000
	sta	%f13,[%i4+%g0]0x80	! Mem[0000000010101400] = 17c0a3f4
!	Mem[000000001000140c] = fff3b315, %l7 = ffffff83, %l1 = ffffffff
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 00000000fff3b315
!	%f4  = 000000ff 271a00ff, Mem[0000000010181410] = 12000000 20df00c6
	stda	%f4 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff 271a00ff
!	%l3 = 0000000098b14417, Mem[0000000010081408] = e250a4f0ffc0c1ff
	stxa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000000098b14417
!	%l5 = 0000000000000074, Mem[0000000030181400] = df20400a
	stha	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = df200074
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00091a27 ff000000, %l2 = ffffff44, %l3 = 98b14417
	ldda	[%i3+%o5]0x80,%l2	! %l2 = 0000000000091a27 00000000ff000000

p0_label_111:
!	Mem[0000000010001410] = 00000098, %l6 = ffffffffffc0c1ff
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = ffffffffffffff98
!	Mem[0000000030101410] = 000000c6, %l5 = 0000000000000074
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000c6
!	Mem[0000000010141410] = ffc1c0ff, %f3  = dfaee5f8
	lda	[%i5+%o5]0x88,%f3 	! %f3 = ffc1c0ff
!	Mem[0000000010141400] = 0000ff0000009800, %f16 = 000000aa 6d25e01f
	ldda	[%i5+%g0]0x88,%f16	! %f16 = 0000ff00 00009800
!	%l4 = 00000000000000ff, imm = 0000000000000b5d, %l4 = 00000000000000ff
	subc	%l4,0xb5d,%l4		! %l4 = fffffffffffff5a2
!	Mem[00000000300c1400] = ff000000, %l7 = ffffffffffffff83
	ldsba	[%i3+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141410] = 00000000256d00ff, %l2 = 0000000000091a27
	ldxa	[%i5+%o5]0x89,%l2	! %l2 = 00000000256d00ff
!	Mem[0000000010181408] = 00000000, %l4 = fffffffffffff5a2
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l3 = 00000000ff000000
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000c6, Mem[0000000030001400] = 00980000
	stba	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 009800c6

p0_label_112:
!	Mem[00000000300c1410] = ff000000, %l6 = ffffffffffffff98
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	%l2 = 00000000256d00ff, Mem[00000000211c0001] = fffff58c
	stb	%l2,[%o2+0x001]		! Mem[00000000211c0000] = fffff58c
!	%f2  = 00000000, Mem[00000000100c1404] = e87aff91
	sta	%f2 ,[%i3+0x004]%asi	! Mem[00000000100c1404] = 00000000
!	%l0 = 000000ff, %l1 = fff3b315, Mem[0000000030041410] = 00000000 f8e5aedf
	stda	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff fff3b315
!	Mem[0000000010041410] = 98000000, %l5 = 00000000000000c6
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l7 = ffffffffffffffff
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030141408] = aba0400998000000
	stxa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000000
!	Code Fragment 3
p0_fragment_14:
!	%l0 = 00000000000000ff
	setx	0xcad5caefafd03ca3,%g7,%l0 ! %l0 = cad5caefafd03ca3
!	%l1 = 00000000fff3b315
	setx	0xa3033557f972d3aa,%g7,%l1 ! %l1 = a3033557f972d3aa
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cad5caefafd03ca3
	setx	0xe04f5187fb71a2ae,%g7,%l0 ! %l0 = e04f5187fb71a2ae
!	%l1 = a3033557f972d3aa
	setx	0xa4d09cafe57b87c7,%g7,%l1 ! %l1 = a4d09cafe57b87c7
!	%l5 = 0000000000000000, Mem[0000000030181410] = 5f4600000099670b
	stxa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff000000aa000000, %f20 = 00000000 1a5e8012
	ldda	[%i6+%g0]0x88,%f20	! %f20 = ff000000 aa000000

p0_label_113:
!	Mem[00000000100c1408] = 1fe025ff, %l4 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 000000001fe025ff
!	%f15 = 00000000, %f27 = 4ff7e202
	fsqrts	%f15,%f27		! %f27 = 00000000
!	Mem[0000000010001438] = 00003ed1 ea2c70e6, %l0 = fb71a2ae, %l1 = e57b87c7
	ldda	[%i0+0x038]%asi,%l0	! %l0 = 0000000000003ed1 00000000ea2c70e6
!	Mem[0000000010141400] = 0098000000ff0000, %f0  = 00000098 0940a0ab
	ldda	[%i5+%g0]0x80,%f0 	! %f0  = 00980000 00ff0000
!	Mem[0000000010101408] = 00000000, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = 98000000, %l3 = 0000000000000000
	lduba	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000098
!	Mem[0000000010081418] = ef2e666e, %l0 = 0000000000003ed1
	lduba	[%i2+0x018]%asi,%l0	! %l0 = 00000000000000ef
!	Mem[00000000300c1410] = 000000ff, %l1 = 00000000ea2c70e6
	lduba	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101420] = 00000000 5d07ffbf, %l2 = 256d00ff, %l3 = 00000098
	ldda	[%i4+0x020]%asi,%l2	! %l2 = 0000000000000000 000000005d07ffbf
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[00000000300c1410] = ff000000
	stba	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff000000

p0_label_114:
!	%l4 = 000000001fe025ff, Mem[00000000201c0000] = ff830197, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 25ff0197
!	%l3 = 000000005d07ffbf, Mem[0000000030001408] = 00000052
	stha	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000ffbf
!	Mem[0000000010081408] = 98b14417, %l3 = 000000005d07ffbf
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 00000017000000ff
!	%f26 = 808eff43, %f29 = 17c0a3f4
	fcmpes	%fcc0,%f26,%f29		! %fcc0 = 1
!	Mem[0000000010041410] = ff000098, %l0 = 00000000000000ef
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%l2 = 00000000, %l3 = 00000017, Mem[0000000030141410] = 256d00ff 00000000
	stda	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 00000017
!	Mem[00000000100c1400] = 00005cf4, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%f24 = 43ff8e80, Mem[0000000010181408] = ffffffff
	sta	%f24,[%i6+%o4]0x80	! Mem[0000000010181408] = 43ff8e80
!	%f8  = 00000000 000000c6, Mem[0000000010101400] = 17c0a3f4 00000000
	stda	%f8 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 000000c6
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 98b144ff, %l2 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l2	! %l2 = 00000000000044ff

p0_label_115:
!	Mem[0000000010181408] = 808eff43, %f7  = 00a900ff
	lda	[%i6+%o4]0x88,%f7 	! %f7 = 808eff43
!	Mem[0000000030081410] = ff006d2500000000, %l4 = 000000001fe025ff
	ldxa	[%i2+%o5]0x81,%l4	! %l4 = ff006d2500000000
!	Mem[0000000010141400] = 00009800, %l7 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l7	! %l7 = 0000000000009800
!	Mem[00000000300c1400] = ff000000ffc0c1ff, %l5 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l5	! %l5 = ff000000ffc0c1ff
!	Mem[0000000030141408] = 00000000 00000000, %l4 = 00000000, %l5 = ffc0c1ff
	ldda	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010141424] = 00000080, %l6 = 00000000000000ff
	lduha	[%i5+0x026]%asi,%l6	! %l6 = 0000000000000080
!	Mem[0000000020800040] = ffd56b19, %l0 = 00000000000000ff
	ldsb	[%o1+0x041],%l0		! %l0 = ffffffffffffffd5
!	Mem[0000000010181400] = aa000000, %l2 = 00000000000044ff
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 00000000aa000000
!	Mem[0000000010041410] = 980000ff, %l7 = 0000000000009800
	ldsba	[%i1+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030101408] = ff000000 645a727b
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 00000000

p0_label_116:
!	%f16 = 0000ff00 00009800, Mem[0000000010181410] = ff000000 ff001a27
	stda	%f16,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000ff00 00009800
!	%f7  = 808eff43, Mem[0000000010181400] = aa000000
	sta	%f7 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 808eff43
!	%f0  = 00980000 00ff0000, %l1 = 00000000000000ff
!	Mem[00000000100c1400] = ff005cf400000000
	stda	%f0,[%i3+%l1]ASI_PST8_P ! Mem[00000000100c1400] = 0098000000ff0000
!	%f21 = aa000000, %f26 = 808eff43
	fcmpes	%fcc0,%f21,%f26		! %fcc0 = 1
!	%l5 = 0000000000000000, Mem[0000000010141400] = 00980000
	stha	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010141408] = ff000000 ff5e0000
	stda	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 00000000
!	Mem[0000000010101424] = 5d07ffbf, %l1 = 00000000000000ff
	ldstub	[%i4+0x024],%l1		! %l1 = 0000005d000000ff
!	Mem[0000000010001422] = 00008136, %l1 = 000000000000005d
	ldstuba	[%i0+0x022]%asi,%l1	! %l1 = 00000081000000ff
!	%l2 = 00000000aa000000, Mem[00000000100c1410] = 271a0900
	stba	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 271a0900
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000098, %l3 = 0000000000000017
	ldsba	[%i0+%o5]0x88,%l3	! %l3 = ffffffffffffff98

p0_label_117:
!	Mem[0000000010041400] = 1fff256df4a3c017, %l6 = 0000000000000080
	ldxa	[%i1+%g0]0x88,%l6	! %l6 = 1fff256df4a3c017
!	Mem[0000000030001400] = c6009800, %l5 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000c6
!	%l7 = ffffffffffffffff, %l4 = 0000000000000000, %l6 = 1fff256df4a3c017
	xor	%l7,%l4,%l6		! %l6 = ffffffffffffffff
!	Mem[00000000100c1408] = 1fe025ff, %l0 = ffffffffffffffd5
	ldsba	[%i3+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041408] = 000000ff00000000, %f22 = 1fe025ff 0000aba0
	ldda	[%i1+%o4]0x88,%f22	! %f22 = 000000ff 00000000
!	Mem[00000000300c1408] = a0ab0000, %f5  = 271a00ff
	lda	[%i3+%o4]0x81,%f5 	! %f5 = a0ab0000
!	Mem[00000000300c1408] = 0000aba0, %f9  = 000000c6
	lda	[%i3+%o4]0x89,%f9 	! %f9 = 0000aba0
!	Mem[0000000030001400] = 009800c6, %l1 = 0000000000000081
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000c6
!	Mem[0000000030141400] = 808eff43, %l3 = ffffffffffffff98
	ldswa	[%i5+%g0]0x89,%l3	! %l3 = ffffffff808eff43
!	Starting 10 instruction Store Burst
!	%f4  = 000000ff a0ab0000, Mem[0000000030101410] = c6000000 36800000
	stda	%f4 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff a0ab0000

p0_label_118:
!	%f0  = 00980000, Mem[0000000010081400] = 000000ff
	sta	%f0 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 00980000
!	%l0 = ffffffff, %l1 = 000000c6, Mem[0000000030101400] = ffc300ff 52b8cc6e
	stda	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffff 000000c6
!	%l2 = 00000000aa000000, Mem[0000000010041400] = 17c0a3f4
	stba	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00c0a3f4
!	%f26 = 808eff43 00000000, Mem[0000000010101408] = 00000000 00000000
	stda	%f26,[%i4+%o4]0x80	! Mem[0000000010101408] = 808eff43 00000000
!	%l1 = 00000000000000c6, Mem[0000000020800001] = ffff7ff0, %asi = 80
	stba	%l1,[%o1+0x001]%asi	! Mem[0000000020800000] = ffc67ff0
!	Mem[0000000010181400] = 808eff43, %l6 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 00000043000000ff
!	%l7 = ffffffffffffffff, %l3 = ffffffff808eff43, %l2 = 00000000aa000000
	subc	%l7,%l3,%l2		! %l2 = 000000007f7100bc
!	%f2  = 00000000 ffc1c0ff, Mem[0000000030081410] = ff006d25 00000000
	stda	%f2 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 ffc1c0ff
!	Mem[0000000010081408] = 98b144ff, %l5 = 00000000000000c6
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 00006d25fffff25d, %l2 = 000000007f7100bc
	ldx	[%i2+0x020],%l2		! %l2 = 00006d25fffff25d

p0_label_119:
!	%l5 = 00000000000000ff, immed = fffff912, %y  = 18616de7
	smul	%l5,-0x6ee,%l1		! %l1 = fffffffffff918ee, %y = ffffffff
!	Mem[00000000100c1410] = 271a0900, %l5 = 00000000000000ff
	lduwa	[%i3+%o5]0x88,%l5	! %l5 = 00000000271a0900
!	Mem[0000000030141400] = 43ff8e80, %l6 = 0000000000000043
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000043
!	Mem[0000000030041410] = 000000ff, %l6 = 0000000000000043
	ldsha	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %l2 = 00006d25fffff25d
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 43ff8e80, %l1 = fffffffffff918ee
	ldsba	[%i4+%o4]0x88,%l1	! %l1 = ffffffffffffff80
!	Mem[0000000030141410] = 00000000, %l5 = 00000000271a0900
	lduha	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = ff000000, %l7 = ffffffffffffffff
	ldsba	[%i3+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	%l0 = ffffffffffffffff, immd = 0000000000000305, %l5 = 0000000000000000
	sdivx	%l0,0x305,%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f13 = 17c0a3f4, Mem[0000000010001430] = ffffffff
	st	%f13,[%i0+0x030]	! Mem[0000000010001430] = 17c0a3f4

p0_label_120:
!	%f21 = aa000000, %f14 = 00000000, %f23 = 00000000
	fdivs	%f21,%f14,%f23		! %f23 = ff800000
!	%f0  = 00980000 00ff0000, %l7 = ffffffffffffffff
!	Mem[0000000010181408] = 43ff8e805d07ffff
	add	%i6,0x008,%g1
	stda	%f0,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010181408] = 0000ff0000009800
!	%f6  = 00000000 808eff43, %l7 = ffffffffffffffff
!	Mem[0000000030141418] = 08201d861b64b120
	add	%i5,0x018,%g1
	stda	%f6,[%g1+%l7]ASI_PST32_S ! Mem[0000000030141418] = 00000000808eff43
!	%l3 = ffffffff808eff43, Mem[0000000030001400] = c6009800
	stwa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 808eff43
!	Mem[0000000030041410] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1410] = 00091a27, %l2 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 0000000000091a27
!	%l3 = ffffffff808eff43, Mem[0000000010081408] = ff44b19800000000, %asi = 80
	stxa	%l3,[%i2+0x008]%asi	! Mem[0000000010081408] = ffffffff808eff43
!	Mem[0000000010001400] = ff00b852, %l0 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	%f0  = 00980000 00ff0000, Mem[0000000010101408] = 808eff43 00000000
	stda	%f0 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 00980000 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000, %f9  = 0000aba0
	lda	[%i4+%o4]0x81,%f9 	! %f9 = 00000000

p0_label_121:
!	Mem[0000000010001400] = 52b800ff, %l1 = ffffffffffffff80
	lduha	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081410] = 00000000, %l0 = 00000000000000ff
	ldsha	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 808eff43, %l2 = 0000000000091a27
	ldsba	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000043
!	Mem[0000000030141408] = 00000000, %l3 = ffffffff808eff43
	ldsha	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101428] = aefb8363, %f8  = 00000000
	lda	[%i4+0x028]%asi,%f8 	! %f8 = aefb8363
!	Mem[0000000010041400] = 00c0a3f4, %l2 = 0000000000000043
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l0 = 0000000000000000
	ldsba	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 808eff43, %l7 = ffffffffffffffff
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffffff80
!	Mem[0000000010041418] = 14d059cb, %l5 = 0000000000000000
	ldsw	[%i1+0x018],%l5		! %l5 = 0000000014d059cb
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030141400] = 43ff8e80
	stba	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 00ff8e80

p0_label_122:
!	%l5 = 0000000014d059cb, Mem[0000000010181408] = 0000ff00, %asi = 80
	stwa	%l5,[%i6+0x008]%asi	! Mem[0000000010181408] = 14d059cb
!	%l5 = 0000000014d059cb, Mem[0000000010081410] = 0000ff44
	stba	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000ffcb
!	%l4 = 0000000000000000, Mem[0000000030141408] = 00000000
	stha	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%f24 = 43ff8e80 0000005c, %l6 = 00000000000000ff
!	Mem[00000000100c1400] = 0098000000ff0000
	stda	%f24,[%i3+%l6]ASI_PST16_P ! Mem[00000000100c1400] = 43ff8e800000005c
!	Mem[0000000010081410] = cbff0000, %l5 = 0000000014d059cb
	swap	[%i2+%o5],%l5		! %l5 = 00000000cbff0000
!	%l1 = 00000000000000ff, Mem[0000000010141408] = 00000000
	stwa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff
!	Mem[0000000030181408] = 00000000, %l5 = 00000000cbff0000
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[00000000201c0001] = 25ff0197, %asi = 80
	stba	%l0,[%o0+0x001]%asi	! Mem[00000000201c0000] = 25000197
!	Mem[00000000100c1420] = 00000000, %l4 = 0000000000000000
	swap	[%i3+0x020],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000000ff, %l6 = 00000000000000ff
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = ffffffffffffffff

p0_label_123:
!	Mem[00000000211c0000] = fffff58c, %l7 = ffffffffffffff80
	lduh	[%o2+%g0],%l7		! %l7 = 000000000000ffff
!	Mem[0000000030081408] = 000000ff, %l1 = 00000000000000ff
	lduha	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000020800000] = ffc67ff0, %l2 = 0000000000000000
	lduba	[%o1+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101410] = 000000ffa0ab0000, %f22 = 000000ff ff800000
	ldda	[%i4+%o5]0x81,%f22	! %f22 = 000000ff a0ab0000
!	Mem[0000000010141400] = 00000000, %l2 = 00000000000000ff
	lduha	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l4 = 0000000000000000
	ldsha	[%i4+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1410] = ff000000, %l5 = 0000000000000000
	ldswa	[%i3+%o5]0x81,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010101410] = 98b144ff, %l2 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l2	! %l2 = 0000000098b144ff
!	Mem[00000000100c1410] = 000000ff, %l3 = 0000000000000000
	lduw	[%i3+%o5],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f16 = 0000ff00, Mem[0000000030181410] = 00000000
	sta	%f16,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ff00

p0_label_124:
!	%l1 = 00000000000000ff, Mem[0000000030041410] = 000000ff
	stwa	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	%f6  = 00000000, Mem[0000000010041400] = f4a3c000
	sta	%f6 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%f24 = 43ff8e80, Mem[0000000030081410] = 00000000
	sta	%f24,[%i2+%o5]0x89	! Mem[0000000030081410] = 43ff8e80
!	%l6 = ffffffffffffffff, Mem[00000000100c1420] = 00000000, %asi = 80
	stba	%l6,[%i3+0x020]%asi	! Mem[00000000100c1420] = ff000000
!	Mem[00000000201c0001] = 25000197, %l1 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181438] = 1744b1980a4020df, %l4 = ffffffffffffffff
	ldxa	[%i6+0x038]%asi,%l4	! %l4 = 1744b1980a4020df
!	%f12 = 1a5e8012 17c0a3f4, %l4 = 1744b1980a4020df
!	Mem[0000000010001428] = bcc28440e9fe58b4
	add	%i0,0x028,%g1
	stda	%f12,[%g1+%l4]ASI_PST16_P ! Mem[0000000010001428] = 1a5e801217c0a3f4
!	%l2 = 98b144ff, %l3 = 000000ff, Mem[00000000100c1400] = 808eff43 5c000000
	stda	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 98b144ff 000000ff
!	%l0 = 0000000000000000, Mem[0000000010101410] = 98b144ff
	stha	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 98b10000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff000000, %f9  = 00000000
	lda	[%i1+%o5]0x81,%f9 	! %f9 = ff000000

p0_label_125:
!	Mem[000000001010143c] = 000000ff, %l5 = ffffffffff000000
	ldswa	[%i4+0x03c]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = ffc0c1ff43ff8e80, %f4  = 000000ff a0ab0000
	ldda	[%i2+%o5]0x89,%f4 	! %f4  = ffc0c1ff 43ff8e80
!	Mem[0000000010041410] = 980000ff, %l4 = 1744b1980a4020df
	lduha	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1404] = ff000000, %f14 = 00000000
	ld	[%i3+0x004],%f14	! %f14 = ff000000
!	Mem[0000000010181410] = 00980000, %f27 = 00000000
	lda	[%i6+%o5]0x80,%f27	! %f27 = 00980000
!	Mem[0000000010101400] = c600000000000000, %f20 = ff000000 aa000000
	ldda	[%i4+%g0]0x88,%f20	! %f20 = c6000000 00000000
!	Mem[0000000030101400] = ffffffff000000c6, %f22 = 000000ff a0ab0000
	ldda	[%i4+%g0]0x81,%f22	! %f22 = ffffffff 000000c6
!	Mem[0000000030101410] = 0000aba0ff000000, %l7 = 000000000000ffff
	ldxa	[%i4+%o5]0x89,%l7	! %l7 = 0000aba0ff000000
!	Mem[0000000010081410] = cb59d014, %l0 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000014
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000030141410] = 00000000
	stwa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff

p0_label_126:
!	%l0 = 0000000000000014, Mem[0000000010101430] = ffffffa9, %asi = 80
	stwa	%l0,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000014
!	Mem[0000000010181410] = 00009800, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f12 = 1a5e8012 17c0a3f4, %l3 = 0000000000000000
!	Mem[0000000010081418] = ef2e666e484d2b5d
	add	%i2,0x018,%g1
	stda	%f12,[%g1+%l3]ASI_PST16_P ! Mem[0000000010081418] = ef2e666e484d2b5d
!	%l3 = 0000000000000000, Mem[0000000030041400] = ff000000
	stha	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%f11 = 4ff7e202, %f31 = 98b144ff, %f22 = ffffffff
	fdivs	%f11,%f31,%f22		! %f22 = f6b2fcc4
!	Mem[0000000030101400] = ffffffff, %l7 = 0000aba0ff000000
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	%l2 = 0000000098b144ff, Mem[0000000010101410] = 0000b198, %asi = 80
	stha	%l2,[%i4+0x010]%asi	! Mem[0000000010101410] = 44ffb198
!	%f20 = c6000000, Mem[0000000010101408] = 00009800
	sta	%f20,[%i4+%o4]0x88	! Mem[0000000010101408] = c6000000
!	%l2 = 0000000098b144ff, Mem[0000000030081400] = 808eff43
	stwa	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 98b144ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ffffffff 000000c6, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 00000000ffffffff 00000000000000c6

p0_label_127:
!	Mem[0000000010101400] = 00000000, %l4 = 00000000000000ff
	ldub	[%i4+%g0],%l4		! %l4 = 0000000000000000
!	%f10 = 808eff43, %f18 = 00000000
	fsqrts	%f10,%f18		! %f18 = 7fffffff
!	Mem[0000000010101410] = 00000000 98b1ff44, %l0 = 00000014, %l1 = 00000000
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 0000000098b1ff44 0000000000000000
!	Mem[0000000010141410] = ffc0c1ff, %l4 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = 000000ff 00000000, %l0 = 98b1ff44, %l1 = 00000000
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000020800000] = ffc67ff0, %l0 = 00000000000000ff
	ldub	[%o1+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010081418] = ef2e666e, %l6 = 00000000ffffffff
	ldsw	[%i2+0x018],%l6		! %l6 = ffffffffef2e666e
!	Mem[0000000010081428] = 00000000, %l7 = 00000000000000c6
	lduh	[%i2+0x02a],%l7		! %l7 = 0000000000000000
!	Mem[0000000010001410] = 98000000, %l7 = 0000000000000000
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = ffffffffffff9800
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_15:
!	%l0 = 00000000000000ff
	setx	0x8f7959afe78a8c06,%g7,%l0 ! %l0 = 8f7959afe78a8c06
!	%l1 = 0000000000000000
	setx	0x152a56305bb2ef60,%g7,%l1 ! %l1 = 152a56305bb2ef60
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8f7959afe78a8c06
	setx	0x0074fdcf88410260,%g7,%l0 ! %l0 = 0074fdcf88410260
!	%l1 = 152a56305bb2ef60
	setx	0x096f5f078f94bdd2,%g7,%l1 ! %l1 = 096f5f078f94bdd2

p0_label_128:
!	%l0 = 88410260, %l1 = 8f94bdd2, Mem[0000000010101420] = 00000000 ff07ffbf
	std	%l0,[%i4+0x020]		! Mem[0000000010101420] = 88410260 8f94bdd2
!	Mem[0000000030141410] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i5+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000030041410] = 000000ff
	stwa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030141400] = 00ff8e80
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00008e80
!	%f0  = 00980000 00ff0000 00000000 ffc1c0ff
!	%f4  = ffc0c1ff 43ff8e80 00000000 808eff43
!	%f8  = aefb8363 ff000000 808eff43 4ff7e202
!	%f12 = 1a5e8012 17c0a3f4 ff000000 00000000
	stda	%f0,[%i5]ASI_BLK_P	! Block Store to 0000000010141400
!	%l0 = 88410260, %l1 = 8f94bdd2, Mem[0000000030041408] = 00a900ff 00000000
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 88410260 8f94bdd2
!	%f22 = f6b2fcc4 000000c6, %l6 = ffffffffef2e666e
!	Mem[0000000030141408] = 0000000000000000
	add	%i5,0x008,%g1
	stda	%f22,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030141408] = 0000000000fcb200
!	Code Fragment 4
p0_fragment_16:
!	%l0 = 0074fdcf88410260
	setx	0x74bca4106fa90ee6,%g7,%l0 ! %l0 = 74bca4106fa90ee6
!	%l1 = 096f5f078f94bdd2
	setx	0x6460852f946eda7b,%g7,%l1 ! %l1 = 6460852f946eda7b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 74bca4106fa90ee6
	setx	0x398d6be81a8df47a,%g7,%l0 ! %l0 = 398d6be81a8df47a
!	%l1 = 6460852f946eda7b
	setx	0x022c3a7028117f66,%g7,%l1 ! %l1 = 022c3a7028117f66
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000980000ff, %f20 = c6000000 00000000
	ldda	[%i1+%o5]0x88,%f20	! %f20 = 00000000 980000ff

p0_label_129:
!	Mem[0000000010101424] = 8f94bdd2, %l4 = ffffffffffffffff
	ldsw	[%i4+0x024],%l4		! %l4 = ffffffff8f94bdd2
!	Mem[0000000010101408] = 000000c6, %l4 = ffffffff8f94bdd2
	lduw	[%i4+%o4],%l4		! %l4 = 00000000000000c6
!	Mem[0000000030041400] = 00000000 a9ffffff, %l2 = 98b144ff, %l3 = 000000ff
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000 00000000a9ffffff
!	Mem[0000000030181400] = df200074, %l4 = 00000000000000c6
	ldsba	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000074
!	Mem[0000000010081424] = fffff25d, %l7 = ffffffffffff9800
	lduha	[%i2+0x026]%asi,%l7	! %l7 = 000000000000f25d
!	Mem[0000000030081408] = 000000ff, %l6 = ffffffffef2e666e
	lduba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000218000c0] = ff456ac2, %l0 = 398d6be81a8df47a
	lduba	[%o3+0x0c1]%asi,%l0	! %l0 = 0000000000000045
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	ldub	[%i5+0x00a],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = ffc67ff0, %l4 = 0000000000000074
	ldstub	[%o1+%g0],%l4		! %l4 = 000000ff000000ff

p0_label_130:
!	Mem[0000000010141400] = 00980000, %l0 = 0000000000000045
	ldstuba	[%i5+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 0000f25d, Mem[0000000010081400] = 00009800 00000000
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff 0000f25d
!	%l1 = 022c3a7028117f66, Mem[0000000010101408] = 000000c600ff0000
	stxa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 022c3a7028117f66
!	%l5 = 0000000000000000, Mem[000000001014141e] = 808eff43, %asi = 80
	stha	%l5,[%i5+0x01e]%asi	! Mem[000000001014141c] = 808e0000
!	Mem[0000000030141410] = ff0000ff, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000030141408] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l0 = 00000000, %l1 = 28117f66, Mem[0000000030041408] = 88410260 8f94bdd2
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 28117f66
!	%f24 = 43ff8e80 0000005c, %l5 = 0000000000000000
!	Mem[00000000300c1420] = 709ec2c6b2c040b4
	add	%i3,0x020,%g1
	stda	%f24,[%g1+%l5]ASI_PST8_SL ! Mem[00000000300c1420] = 709ec2c6b2c040b4
!	%f12 = 1a5e8012 17c0a3f4, %l7 = 000000000000f25d
!	Mem[0000000030041418] = f0bfc8a77f0c4dfe
	add	%i1,0x018,%g1
	stda	%f12,[%g1+%l7]ASI_PST16_S ! Mem[0000000030041418] = 1a5e80127f0ca3f4
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffffffff, %f1  = 00ff0000
	lda	[%i2+%o4]0x80,%f1 	! %f1 = ffffffff

p0_label_131:
!	Mem[00000000100c1410] = 000000ff, %l4 = 00000000000000ff
	ldub	[%i3+0x012],%l4		! %l4 = 0000000000000000
!	Mem[0000000010181400] = ff000000808effff, %f30 = 000000c6 98b144ff
	ldda	[%i6+%g0]0x88,%f30	! %f30 = ff000000 808effff
!	Mem[0000000010141400] = ff98000000ff0000, %f26 = 808eff43 00980000
	ldda	[%i5+%g0]0x80,%f26	! %f26 = ff980000 00ff0000
!	Mem[0000000030041400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = 740020df 000000e3, %l2 = ff0000ff, %l3 = a9ffffff
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 00000000740020df 00000000000000e3
!	Mem[0000000010101408] = 022c3a70 28117f66, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 00000000022c3a70 0000000028117f66
!	Mem[0000000010001400] = ff00b852e22a57a2, %f28 = 00000000 17c0a3f4
	ldda	[%i0+0x000]%asi,%f28	! %f28 = ff00b852 e22a57a2
!	Mem[0000000010181400] = ffff8e80 000000ff 14d059cb 00009800
!	Mem[0000000010181410] = ff980000 00ff0000 00000000 0940a0ab
!	Mem[0000000010181420] = ffffff0b 0000005c 808eff43 4ff7e202
!	Mem[0000000010181430] = 1a5e8012 17c0a3f4 1744b198 0a4020df
	ldda	[%i6]ASI_BLK_PL,%f16	! Block Load from 0000000010181400
!	Mem[00000000100c141c] = f45c4994, %l2 = 00000000740020df
	lduba	[%i3+0x01f]%asi,%l2	! %l2 = 0000000000000094
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 0000ffbf, %l6 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 000000000000ffbf

p0_label_132:
!	Mem[0000000010041400] = 00000000, %l3 = 00000000000000e3
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041404] = 6d25ff1f, %l4 = 00000000022c3a70
	ldstub	[%i1+0x004],%l4		! %l4 = 0000006d000000ff
!	%f6  = 00000000, Mem[00000000300c1408] = 0000aba0
	sta	%f6 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l5 = 0000000028117f66, Mem[0000000010001408] = ff000000
	stha	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 7f660000
!	Mem[00000000201c0000] = 25ff0197, %l6 = 000000000000ffbf
	ldstub	[%o0+%g0],%l6		! %l6 = 00000025000000ff
!	Mem[0000000010141408] = 00000000, %l1 = 022c3a7028117f66
	ldstuba	[%i5+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = 000098ff, %l6 = 0000000000000025
	swapa	[%i6+%o5]0x88,%l6	! %l6 = 00000000000098ff
!	%l4 = 000000000000006d, %l5 = 0000000028117f66, %l3 = 0000000000000000
	or	%l4,%l5,%l3		! %l3 = 0000000028117f6f
!	%l4 = 0000006d, %l5 = 28117f66, Mem[0000000010001400] = ff00b852 e22a57a2
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000006d 28117f66
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l0 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_133:
!	Mem[0000000020800000] = ffc67ff0, %l0 = 0000000000000000
	ldub	[%o1+0x001],%l0		! %l0 = 00000000000000c6
!	Mem[0000000010041410] = ff000098, %l2 = 0000000000000094
	lduha	[%i1+%o5]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010101408] = 703a2c02, %l2 = 000000000000ff00
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000002
!	%f3  = ffc1c0ff, %f8  = aefb8363
	fsqrts	%f3 ,%f8 		! %f8  = ffc1c0ff
!	Mem[00000000218000c0] = ff456ac2, %l7 = 000000000000f25d
	ldsb	[%o3+0x0c0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000021800100] = ff0039f1, %l7 = ffffffffffffffff
	ldsha	[%o3+0x100]%asi,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030141408] = 000000ff, %l0 = 00000000000000c6
	ldsha	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101410] = 000000ff, %l6 = 00000000000098ff
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[000000001008142c] = 000000ff, %f11 = 4ff7e202
	ld	[%i2+0x02c],%f11	! %f11 = 000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 000000ff, %l7 = ffffffffffffff00
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 00000000000000ff

p0_label_134:
!	%f8  = ffc1c0ff ff000000, Mem[0000000010001408] = 0000667f 15b3f3ff
	stda	%f8 ,[%i0+%o4]0x88	! Mem[0000000010001408] = ffc1c0ff ff000000
!	%l2 = 00000002, %l3 = 28117f6f, Mem[0000000010041410] = ff000098 00000000
	stda	%l2,[%i1+0x010]%asi	! Mem[0000000010041410] = 00000002 28117f6f
!	%l3 = 0000000028117f6f, Mem[00000000300c1410] = 000000ff
	stba	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000006f
!	%l3 = 0000000028117f6f, Mem[0000000010041400] = 000000ff
	stha	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 00007f6f
!	Mem[0000000010001400] = 6d000000, %l7 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 000000006d000000
!	%l4 = 000000000000006d, %l0 = 00000000000000ff, %l2 = 0000000000000002
	and	%l4,%l0,%l2		! %l2 = 000000000000006d
!	Mem[00000000100c1430] = ffffffff, %l4 = 000000000000006d
	swap	[%i3+0x030],%l4		! %l4 = 00000000ffffffff
!	%l3 = 0000000028117f6f, Mem[0000000030141410] = 00000000
	stha	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 7f6f0000
!	Mem[0000000010101408] = 703a2c02, %l1 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l1	! %l1 = 00000000703a2c02
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 6f7f0000, %l1 = 00000000703a2c02
	ldswa	[%i1+%g0]0x80,%l1	! %l1 = 000000006f7f0000

p0_label_135:
!	Mem[000000001000143c] = ea2c70e6, %l1 = 000000006f7f0000
	ldsba	[%i0+0x03d]%asi,%l1	! %l1 = 000000000000002c
!	Mem[0000000030001400] = 808eff43, %l7 = 000000006d000000
	ldswa	[%i0+%g0]0x81,%l7	! %l7 = ffffffff808eff43
!	Mem[0000000030181410] = 0000ff00, %l0 = 00000000000000ff
	lduwa	[%i6+%o5]0x89,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010041408] = 00000000, %f12 = 1a5e8012
	lda	[%i1+%o4]0x80,%f12	! %f12 = 00000000
!	Mem[0000000010181410] = 00000025, %l1 = 000000000000002c
	lduha	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000025
!	Mem[0000000030141408] = ff000000, %l3 = 0000000028117f6f
	lduha	[%i5+%o4]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010181410] = 2500000000ff0000, %l3 = 000000000000ff00
	ldxa	[%i6+%o5]0x80,%l3	! %l3 = 2500000000ff0000
!	Mem[0000000010101400] = 00000000, %l1 = 0000000000000025
	lduwa	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = ffffff00ff000000, %f22 = aba04009 00000000
	ldda	[%i3+%o5]0x80,%f22	! %f22 = ffffff00 ff000000
!	Starting 10 instruction Store Burst
!	%f3  = ffc1c0ff, Mem[0000000030141400] = 808e0000
	sta	%f3 ,[%i5+%g0]0x89	! Mem[0000000030141400] = ffc1c0ff

p0_label_136:
!	Mem[00000000100c1408] = ff25e01f, %l6 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%f19 = cb59d014, Mem[0000000030181400] = 740020df
	sta	%f19,[%i6+%g0]0x81	! Mem[0000000030181400] = cb59d014
!	%l2 = 0000006d, %l3 = 00ff0000, Mem[0000000030141400] = ffc1c0ff 00006383
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000006d 00ff0000
!	%l0 = 000000000000ff00, Mem[0000000020800040] = ffd56b19, %asi = 80
	stha	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = ff006b19
!	Mem[0000000010001400] = ff000000, %l2 = 000000000000006d
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010101435] = ff00b852, %l5 = 0000000028117f66
	ldstub	[%i4+0x035],%l5		! %l5 = 00000000000000ff
!	%f12 = 00000000 17c0a3f4, Mem[0000000030101400] = ffffffff c6000000
	stda	%f12,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 17c0a3f4
!	Code Fragment 4
p0_fragment_17:
!	%l0 = 000000000000ff00
	setx	0xf8cb2d07f518fb9a,%g7,%l0 ! %l0 = f8cb2d07f518fb9a
!	%l1 = 0000000000000000
	setx	0xcfdadc906bbe5bbc,%g7,%l1 ! %l1 = cfdadc906bbe5bbc
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f8cb2d07f518fb9a
	setx	0xcc379c587776fbac,%g7,%l0 ! %l0 = cc379c587776fbac
!	%l1 = cfdadc906bbe5bbc
	setx	0x310a626006ef6504,%g7,%l1 ! %l1 = 310a626006ef6504
!	%f4  = ffc0c1ff, Mem[000000001014143c] = 00000000
	st	%f4 ,[%i5+0x03c]	! Mem[000000001014143c] = ffc0c1ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 808eff43ffc1c0ff, %f26 = 02e2f74f 43ff8e80
	ldda	[%i2+%o5]0x81,%f26	! %f26 = 808eff43 ffc1c0ff

p0_label_137:
!	Mem[0000000030001410] = fcc3001752b8cc6e, %l6 = 00000000000000ff
	ldxa	[%i0+%o5]0x81,%l6	! %l6 = fcc3001752b8cc6e
!	Mem[0000000030081400] = ff44b1980000005c, %f6  = 00000000 808eff43
	ldda	[%i2+%g0]0x81,%f6 	! %f6  = ff44b198 0000005c
!	Mem[0000000010081410] = 14d059cb 00000000, %l0 = 7776fbac, %l1 = 06ef6504
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 0000000014d059cb 0000000000000000
!	Mem[0000000010141408] = ff000000, %l5 = 0000000000000000
	ldsba	[%i5+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141408] = 000000ff, %l2 = 00000000000000ff
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181400] = ffff8e80000000ff, %l4 = 00000000ffffffff
	ldxa	[%i6+0x000]%asi,%l4	! %l4 = ffff8e80000000ff
!	Mem[0000000010141410] = ffc0c1ff43ff8e80, %f20 = 0000ff00 000098ff
	ldda	[%i5+%o5]0x80,%f20	! %f20 = ffc0c1ff 43ff8e80
!	Code Fragment 4
p0_fragment_18:
!	%l0 = 0000000014d059cb
	setx	0x896adb084ff99972,%g7,%l0 ! %l0 = 896adb084ff99972
!	%l1 = 0000000000000000
	setx	0x0a8fab405021a9f2,%g7,%l1 ! %l1 = 0a8fab405021a9f2
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 896adb084ff99972
	setx	0xe171ae87d90968d7,%g7,%l0 ! %l0 = e171ae87d90968d7
!	%l1 = 0a8fab405021a9f2
	setx	0xa9f351bf9bcced6e,%g7,%l1 ! %l1 = a9f351bf9bcced6e
!	Mem[0000000021800140] = ff44d3d6, %l5 = ffffffffffffffff
	ldsh	[%o3+0x140],%l5		! %l5 = ffffffffffffff44
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00000000, %l3 = 2500000000ff0000
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000

p0_label_138:
!	Mem[0000000010001408] = 000000ff, %l7 = ffffffff808eff43
	ldstub	[%i0+%o4],%l7		! %l7 = 00000000000000ff
!	%l6 = 52b8cc6e, %l7 = 00000000, Mem[0000000030181408] = 000000ff ff000000
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 52b8cc6e 00000000
!	%l5 = ffffffffffffff44, Mem[0000000021800041] = 6dff0053
	stb	%l5,[%o3+0x041]		! Mem[0000000021800040] = 6d440053
!	Mem[0000000030041408] = 00000000, %l6 = fcc3001752b8cc6e
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000100c1400] = 000000ff98b144ff
	stxa	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000
!	Mem[00000000100c1408] = 1fe025ff, %l5 = ffffffffffffff44
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 000000001fe025ff
!	%l6 = 0000000000000000, Mem[0000000010081438] = e78f805c, %asi = 80
	stha	%l6,[%i2+0x038]%asi	! Mem[0000000010081438] = 0000805c
!	Mem[0000000030081410] = 43ff8e80, %l0 = e171ae87d90968d7
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 00000080000000ff
!	%l4 = ffff8e80000000ff, Mem[0000000010081408] = ffffffff
	stha	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = ffff00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l1 = a9f351bf9bcced6e
	lduha	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000

p0_label_139:
!	Mem[0000000021800100] = ff0039f1, %l5 = 000000001fe025ff
	lduba	[%o3+0x101]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800000] = 3456d163, %l6 = 0000000000000000
	lduba	[%o3+0x000]%asi,%l6	! %l6 = 0000000000000034
	membar	#Sync			! Added by membar checker (23)
!	%f12 = 00000000, Mem[0000000010181410] = 25000000
	sta	%f12,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	Mem[0000000030101410] = ff000000, %l1 = 0000000000000000
	ldswa	[%i4+%o5]0x89,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010041400] = 6f7f0000 ff25ff1f, %l6 = 00000034, %l7 = 00000000
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 000000006f7f0000 00000000ff25ff1f
!	Mem[0000000010001400] = 000000ff, %l1 = ffffffffff000000
	ldswa	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = cb59d014000000e3, %f20 = ffc0c1ff 43ff8e80
	ldda	[%i6+%g0]0x81,%f20	! %f20 = cb59d014 000000e3
!	Mem[00000000100c1408] = 44ffffff, %l7 = 00000000ff25ff1f
	ldsh	[%i3+0x00a],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010041410] = 0000000228117f6f, %f26 = 808eff43 ffc1c0ff
	ldda	[%i1+%o5]0x80,%f26	! %f26 = 00000002 28117f6f
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000010101400] = 00000000
	stha	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = ffff0000

p0_label_140:
!	Mem[00000000100c1410] = 00ffffff, %l6 = 000000006f7f0000
	ldstuba	[%i3+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%f0  = 00980000, Mem[0000000030001400] = 808eff43
	sta	%f0 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 00980000
!	%l1 = 00000000000000ff, Mem[0000000030081408] = ff000000
	stba	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000
!	Mem[0000000030081408] = 000000ff, %l4 = ffff8e80000000ff
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l2 = ffffffffffffffff, Mem[0000000010081410] = 14d059cb
	stwa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffff
!	%l1 = 00000000000000ff, Mem[0000000010181400] = ffff8e80
	stwa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	%l2 = ffffffffffffffff, Mem[000000001000141c] = 47c7492b, %asi = 80
	stwa	%l2,[%i0+0x01c]%asi	! Mem[000000001000141c] = ffffffff
!	%f14 = ff000000 00000000, %l4 = 00000000000000ff
!	Mem[0000000030181428] = 81d681194c426a58
	add	%i6,0x028,%g1
	stda	%f14,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030181428] = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000030101410] = ff000000
	stba	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000000ff 000000ff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000ff 00000000000000ff

p0_label_141:
!	Mem[0000000010041430] = 7407d1cce5105f46, %f6  = ff44b198 0000005c
	ldd	[%i1+0x030],%f6 	! %f6  = 7407d1cc e5105f46
!	Mem[0000000030181410] = 00ff0000, %l1 = 00000000000000ff
	ldsba	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 44ffffffb730ffde, %f14 = ff000000 00000000
	ldda	[%i3+%o4]0x80,%f14	! %f14 = 44ffffff b730ffde
!	%l1 = 0000000000000000, imm = 000000000000056c, %l7 = ffffffffffffffff
	subc	%l1,0x56c,%l7		! %l7 = fffffffffffffa94
!	Mem[0000000030181410] = 0000ff00, %l0 = 0000000000000080
	lduha	[%i6+%o5]0x89,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030081408] = 000000ff, %f16 = ff000000
	lda	[%i2+%o4]0x89,%f16	! %f16 = 000000ff
!	Mem[0000000030101410] = ff0000ff, %l1 = 0000000000000000
	lduha	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l2 = ffffffffffffffff, imm = 0000000000000231, %l2 = ffffffffffffffff
	add	%l2,0x231,%l2		! %l2 = 0000000000000230
!	Mem[00000000100c1408] = 44ffffff, %f21 = 000000e3
	lda	[%i3+%o4]0x80,%f21	! %f21 = 44ffffff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000230, Mem[00000000300c1408] = 0000ff00
	stba	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000ff30

p0_label_142:
!	Mem[0000000030041410] = fff3b31500000000, %l6 = 00000000000000ff
	ldxa	[%i1+%o5]0x89,%l6	! %l6 = fff3b31500000000
!	%f0  = 00980000 ffffffff 00000000 ffc1c0ff
!	%f4  = ffc0c1ff 43ff8e80 7407d1cc e5105f46
!	%f8  = ffc1c0ff ff000000 808eff43 000000ff
!	%f12 = 00000000 17c0a3f4 44ffffff b730ffde
	stda	%f0,[%i6]ASI_COMMIT_P	! Block Store to 0000000010181400
!	%l3 = 0000000000000000, Mem[0000000030041410] = 00000000
	stwa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	Mem[00000000300c1400] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%f20 = cb59d014 44ffffff, Mem[0000000010001408] = ff0000ff ffc0c1ff
	stda	%f20,[%i0+%o4]0x80	! Mem[0000000010001408] = cb59d014 44ffffff
!	%l5 = 00000000000000ff, imm = fffffffffffff04d, %l2 = 0000000000000230
	or	%l5,-0xfb3,%l2		! %l2 = fffffffffffff0ff
	membar	#Sync			! Added by membar checker (24)
!	%f28 = f4a3c017, Mem[0000000010181410] = ffc1c0ff
	sta	%f28,[%i6+%o5]0x88	! Mem[0000000010181410] = f4a3c017
!	%f0  = 00980000 ffffffff 00000000 ffc1c0ff
!	%f4  = ffc0c1ff 43ff8e80 7407d1cc e5105f46
!	%f8  = ffc1c0ff ff000000 808eff43 000000ff
!	%f12 = 00000000 17c0a3f4 44ffffff b730ffde
	stda	%f0,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	%l7 = fffffffffffffa94, Mem[0000000010141428] = 808eff43, %asi = 80
	stwa	%l7,[%i5+0x028]%asi	! Mem[0000000010141428] = fffffa94
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l1 = 00000000000000ff
	ldswa	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_143:
!	Mem[00000000300c1400] = ffc1c0ff000000ff, %f24 = 5c000000 0bffffff
	ldda	[%i3+%g0]0x89,%f24	! %f24 = ffc1c0ff 000000ff
!	Mem[0000000010001400] = 000000ff, %l4 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = 30ff0000, %l5 = 00000000000000ff
	lduha	[%i3+%o4]0x81,%l5	! %l5 = 00000000000030ff
!	Mem[0000000010101410] = 44ffb198, %l6 = fff3b31500000000
	lduha	[%i4+%o5]0x80,%l6	! %l6 = 00000000000044ff
!	Mem[0000000030181400] = cb59d014, %l0 = 000000000000ff00
	ldsha	[%i6+%g0]0x81,%l0	! %l0 = ffffffffffffcb59
!	Mem[0000000030101410] = 0000aba0 ff0000ff, %l0 = ffffcb59, %l1 = 00000000
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 00000000ff0000ff 000000000000aba0
!	%l2 = fffffffffffff0ff, %l3 = 0000000000000000, %l3 = 0000000000000000
	addc	%l2,%l3,%l3		! %l3 = fffffffffffff0ff
!	Mem[0000000010181408] = 00000000ffc1c0ff, %l6 = 00000000000044ff, %l0 = 00000000ff0000ff
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = 00000000ffc1c0ff
!	Mem[000000001014140c] = ffc1c0ff, %l2 = fffffffffffff0ff
	lduba	[%i5+0x00c]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ffff00ff, %l5 = 00000000000030ff
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 00000000ffff00ff

p0_label_144:
!	%f29 = 12805e1a, Mem[0000000030081408] = ff000000
	sta	%f29,[%i2+%o4]0x81	! Mem[0000000030081408] = 12805e1a
!	%f18 = 00980000, Mem[0000000010001438] = 00003ed1
	st	%f18,[%i0+0x038]	! Mem[0000000010001438] = 00980000
!	%f27 = 28117f6f, Mem[0000000030101400] = 17c0a3f4
	sta	%f27,[%i4+%g0]0x89	! Mem[0000000030101400] = 28117f6f
!	%l5 = 00000000ffff00ff, Mem[0000000021800140] = ff44d3d6, %asi = 80
	stha	%l5,[%o3+0x140]%asi	! Mem[0000000021800140] = 00ffd3d6
!	Mem[0000000010101400] = 0000ffff, %l7 = fffffffffffffa94
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 000000000000ffff
!	%l6 = 00000000000044ff, Mem[0000000030081410] = ff8eff43
	stba	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = ff8eff43
!	Mem[0000000030001410] = 1700c3fc, %l5 = 00000000ffff00ff
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 000000fc000000ff
!	%l6 = 000044ff, %l7 = 0000ffff, Mem[0000000030141410] = 00006f7f 00000017
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 000044ff 0000ffff
!	Mem[0000000010141408] = 000000ff, %l0 = 00000000ffc1c0ff
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 98000000, %l4 = 00000000000000ff
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = ffffffff98000000

p0_label_145:
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010041400] = 00007f6f, %l6 = 00000000000044ff
	ldsba	[%i1+%g0]0x88,%l6	! %l6 = 000000000000006f
!	Mem[0000000010081410] = ffffffff, %l6 = 000000000000006f
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010081400] = 000000ff 0000f25d ff300000 808eff43
!	Mem[0000000010081410] = ffffffff 00000000 ef2e666e 484d2b5d
!	Mem[0000000010081420] = 00006d25 fffff25d 00000000 000000ff
!	Mem[0000000010081430] = 00000000 19d5d19b 0000805c 092528b7
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000010181408] = 00000000, %l7 = 000000000000ffff
	lduwa	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%l2 = 00000000000000ff, imm = 0000000000000ecd, %l6 = 000000000000ffff
	or	%l2,0xecd,%l6		! %l6 = 0000000000000eff
!	Mem[0000000010141400] = ff980000, %l6 = 0000000000000eff
	ldswa	[%i5+%g0]0x80,%l6	! %l6 = ffffffffff980000
!	Mem[0000000010181410] = 17c0a3f4, %l0 = 00000000000000ff
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = 0000000017c0a3f4
!	Mem[0000000010081420] = 00006d25, %l6 = ffffffffff980000
	lduha	[%i2+0x022]%asi,%l6	! %l6 = 0000000000006d25
!	Mem[0000000010081410] = ffffffff, %l3 = fffffffffffff0ff
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = ff8eff43, %l1 = 000000000000aba0
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 00000000ff8eff43

p0_label_146:
!	%f14 = 44ffffff b730ffde, Mem[0000000030141408] = 000000ff 00b2fc00
	stda	%f14,[%i5+%o4]0x89	! Mem[0000000030141408] = 44ffffff b730ffde
!	%f0  = 00980000 ffffffff 00000000 ffc1c0ff
!	%f4  = ffc0c1ff 43ff8e80 7407d1cc e5105f46
!	%f8  = ffc1c0ff ff000000 808eff43 000000ff
!	%f12 = 00000000 17c0a3f4 44ffffff b730ffde
	stda	%f0,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	Mem[0000000030001408] = 00000000, %l1 = 00000000ff8eff43
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 0000ff30, %l3 = ffffffffffffffff
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 000000000000ff30
!	%f23 = 484d2b5d, Mem[0000000010001400] = ff000000
	sta	%f23,[%i0+%g0]0x80	! Mem[0000000010001400] = 484d2b5d
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000030081400] = ffffffff, %l7 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[000000001010143f] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i4+0x03f]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030001410] = ffc30017, %l3 = 000000000000ff30
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 00000000ffc30017
!	%l7 = 00000000000000ff, %l0 = 0000000017c0a3f4, %l3 = 00000000ffc30017
	orn	%l7,%l0,%l3		! %l3 = ffffffffe83f5cff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000017c0a3f4
	lduba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_147:
!	Mem[0000000030101408] = 0000000000000000, %f10 = 808eff43 000000ff
	ldda	[%i4+%o4]0x81,%f10	! %f10 = 00000000 00000000
!	Mem[0000000030101400] = 6f7f1128, %f9  = ff000000
	lda	[%i4+%g0]0x81,%f9 	! %f9 = 6f7f1128
!	Mem[0000000030181400] = 14d059cb, %l1 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l1	! %l1 = 00000000000059cb
!	Mem[0000000030001408] = 43ff8eff, %f20 = ffffffff
	lda	[%i0+%o4]0x89,%f20	! %f20 = 43ff8eff
!	Mem[0000000010141408] = ff000000ffc1c0ff, %l7 = 00000000000000ff
	ldxa	[%i5+0x008]%asi,%l7	! %l7 = ff000000ffc1c0ff
!	Mem[0000000010041410] = 00000002, %l7 = ff000000ffc1c0ff
	lduba	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = 484d2b5d28117f66, %l4 = ffffffff98000000
	ldxa	[%i0+%g0]0x80,%l4	! %l4 = 484d2b5d28117f66
!	Mem[0000000010001408] = cb59d014, %f11 = 00000000
	lda	[%i0+%o4]0x80,%f11	! %f11 = cb59d014
!	Mem[0000000030181400] = 14d059cb, %f30 = 0000805c
	lda	[%i6+%g0]0x89,%f30	! %f30 = 14d059cb
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = cb59d014, %l1 = 000059cb, %l2 = 000000ff
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 00000000cb59d014

p0_label_148:
!	%f31 = 092528b7, %f19 = 808eff43, %f14 = 44ffffff
	fdivs	%f31,%f19,%f14		! %f14 = c813d670
!	Mem[0000000010001400] = 484d2b5d, %l1 = 00000000000059cb
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000048000000ff
!	%l4 = 484d2b5d28117f66, Mem[0000000010081410] = ffffffff
	stwa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 28117f66
!	%f14 = c813d670 b730ffde, Mem[00000000100c1400] = 00000000 00000000
	std	%f14,[%i3+%g0]	! Mem[00000000100c1400] = c813d670 b730ffde
!	%f20 = 43ff8eff 00000000, %l0 = 0000000000000000
!	Mem[00000000300c1410] = 6f00000000000000
	add	%i3,0x010,%g1
	stda	%f20,[%g1+%l0]ASI_PST8_SL ! Mem[00000000300c1410] = 6f00000000000000
!	%l6 = 0000000000006d25, Mem[0000000030041400] = ffffffff
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 6d25ffff
!	Mem[0000000010101410] = 98b1ff44, %l1 = 0000000000000048
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 00000044000000ff
!	Mem[0000000030101400] = 6f7f1128, %l3 = ffffffffe83f5cff
	swapa	[%i4+%g0]0x81,%l3	! %l3 = 000000006f7f1128
!	%l6 = 0000000000006d25, Mem[0000000030141408] = 44ffffffb730ffde
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000006d25
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff0197, %l2 = 00000000cb59d014
	lduh	[%o0+%g0],%l2		! %l2 = 000000000000ffff

p0_label_149:
!	Mem[000000001014142c] = 4ff7e202, %l6 = 0000000000006d25
	lduw	[%i5+0x02c],%l6		! %l6 = 000000004ff7e202
!	Mem[0000000010081410] = 667f1128, %l4 = 484d2b5d28117f66
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 00000000667f1128
!	Mem[0000000010001410] = 98000000, %l2 = 000000000000ffff
	lduba	[%i0+0x013]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = 00009800, %l1 = 0000000000000044
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 0000000000009800
!	%l6 = 000000004ff7e202, imm = 00000000000008d9, %l6 = 000000004ff7e202
	add	%l6,0x8d9,%l6		! %l6 = 000000004ff7eadb
!	Mem[00000000100c1410] = 000000ff 00ffffff, %l6 = 4ff7eadb, %l7 = 00000000
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 0000000000ffffff 00000000000000ff
!	Mem[0000000030141410] = 000044ff, %f12 = 00000000
	lda	[%i5+%o5]0x89,%f12	! %f12 = 000044ff
!	Mem[00000000300c1410] = 000000000000006f, %f8  = ffc1c0ff 6f7f1128
	ldda	[%i3+%o5]0x89,%f8 	! %f8  = 00000000 0000006f
!	Mem[00000000300c1408] = ffffffff, %l2 = 0000000000000000
	ldsha	[%i3+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010081408] = ff300000
	stwa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000

p0_label_150:
!	Mem[0000000030081400] = ffffffff, %l7 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000021800140] = 00ffd3d6, %l5 = 00000000000000fc
	ldstub	[%o3+0x140],%l5		! %l5 = 00000000000000ff
!	%f6  = 7407d1cc, Mem[0000000030181410] = 00ff0000
	sta	%f6 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 7407d1cc
!	Mem[0000000010081408] = 00000000, %l7 = 00000000000000ff
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141408] = 256d0000, %l0 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l0	! %l0 = 00000025000000ff
!	%l4 = 00000000667f1128, Mem[0000000010141408] = ff000000ffc1c0ff
	stx	%l4,[%i5+%o4]		! Mem[0000000010141408] = 00000000667f1128
!	%f28 = 00000000 19d5d19b, %l7 = 0000000000000000
!	Mem[0000000010101408] = 022c3a7028117f66
	add	%i4,0x008,%g1
	stda	%f28,[%g1+%l7]ASI_PST16_P ! Mem[0000000010101408] = 022c3a7028117f66
!	%l3 = 000000006f7f1128, Mem[0000000030001410] = 30ff0000
	stba	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 30ff0028
!	%l3 = 000000006f7f1128, Mem[00000000100c1400] = c813d670
	stba	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 2813d670
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 022c3a7028117f66, %f28 = 00000000 19d5d19b
	ldda	[%i4+%o4]0x80,%f28	! %f28 = 022c3a70 28117f66

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	fdivs	%f6,%f4,%f30
	sdiv	%l5,0xdca,%l4
	xor	%l3,0x7b2,%l7
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000025
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000009800
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 000000006f7f1128
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000667f1128
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000ffffff
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
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
	cmp	%l0,%l1			! %f0  should be 00980000 ffffffff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 ffc1c0ff
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ffc0c1ff 43ff8e80
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 7407d1cc e5105f46
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 0000006f
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 cb59d014
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 000044ff 17c0a3f4
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be c813d670 b730ffde
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 000000ff 0000f25d
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ff300000 808eff43
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 43ff8eff 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ef2e666e 484d2b5d
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00006d25 fffff25d
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 000000ff
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 022c3a70 28117f66
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 14d059cb 092528b7
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
	xor	%l0,0x79a,%l1
	mulx	%l0,0xcc0,%l3
	fmuls	%f2 ,%f4 ,%f1 
	udivx	%l5,%l1,%l7
	and	%l1,%l4,%l5
	fadds	%f1 ,%f11,%f12
	done

p0_trap1o:
	xor	%l0,0x79a,%l1
	mulx	%l0,0xcc0,%l3
	fmuls	%f2 ,%f4 ,%f1 
	udivx	%l5,%l1,%l7
	and	%l1,%l4,%l5
	fadds	%f1 ,%f11,%f12
	done


p0_trap2e:
	fadds	%f3 ,%f10,%f1 
	done

p0_trap2o:
	fadds	%f3 ,%f10,%f1 
	done


p0_trap3e:
	addc	%l0,0xab6,%l0
	done

p0_trap3o:
	addc	%l0,0xab6,%l0
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
	ldx	[%g1+0x000],%l0		! %l0 = bff8eb0004679c44
	ldx	[%g1+0x008],%l1		! %l1 = 4ad4ed8fe343679a
	ldx	[%g1+0x010],%l2		! %l2 = f8bee037d7ce58d8
	ldx	[%g1+0x018],%l3		! %l3 = 5ac14325d5e3c596
	ldx	[%g1+0x020],%l4		! %l4 = 67030d04f5c9b774
	ldx	[%g1+0x028],%l5		! %l5 = 5e1ad98198406171
	ldx	[%g1+0x030],%l6		! %l6 = 20e6151a76907d07
	ldx	[%g1+0x038],%l7		! %l7 = 5d33acf2a5161374

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
	xor	%l0,0x79a,%l1
	jmpl	%o7,%g0
	nop
p0_near_0_he:
	ldstub	[%o1+0x041],%l6		! Mem[0000000020800041]
	udivx	%l5,%l1,%l7
	and	%l1,%l4,%l5
	fadds	%f17,%f27,%f28
	jmpl	%o7,%g0
	fadds	%f19,%f26,%f17
near0_b2b_h:
	jmpl	%o7,%g0
	addc	%l0,0xab6,%l0
	jmpl	%o7,%g0
	nop
near0_b2b_l:
	jmpl	%o7,%g0
	udivx	%l0,0x29d,%l1
	jmpl	%o7,%g0
	nop
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	fdivs	%f8 ,%f12,%f14
	sdivx	%l0,0x3de,%l3
	addc	%l3,0xab4,%l0
	sub	%l2,-0xd9b,%l6
	xor	%l2,-0x21a,%l7
	jmpl	%o7,%g0
	xor	%l1,%l5,%l7
p0_near_1_he:
	orn	%l6,%l1,%l3
	jmpl	%o7,%g0
	fdivs	%f20,%f29,%f30
near1_b2b_h:
	fdivs	%f31,%f22,%f20
	umul	%l3,-0xef2,%l7
	jmpl	%o7,%g0
	fsubs	%f29,%f19,%f24
near1_b2b_l:
	xnor	%l7,0xd49,%l0
	and	%l4,%l6,%l3
	jmpl	%o7,%g0
	udivx	%l6,-0xd33,%l2
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	jmpl	%o7,%g0
	swap	[%i0+0x000],%l4		! Mem[0000000010001400]
	jmpl	%o7,%g0
	nop
p0_near_2_he:
	xor	%l2,%l7,%l0
	mulx	%l2,%l1,%l0
	xnor	%l2,0x0c2,%l1
	xor	%l0,%l2,%l1
	fmuls	%f20,%f24,%f28
	and	%l1,%l4,%l6
	sdivx	%l7,-0x80f,%l3
	jmpl	%o7,%g0
	fcmps	%fcc0,%f19,%f30
near2_b2b_h:
	umul	%l0,%l5,%l5
	and	%l3,0x82d,%l0
	fcmps	%fcc2,%f20,%f20
	jmpl	%o7,%g0
	xor	%l5,%l1,%l7
near2_b2b_l:
	addc	%l5,0xc10,%l6
	fadds	%f12,%f1 ,%f1 
	addc	%l0,%l6,%l7
	jmpl	%o7,%g0
	and	%l7,0x47b,%l4
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	fcmps	%fcc0,%f0 ,%f5 
	or	%l1,-0xcc3,%l3
	udivx	%l3,-0xa04,%l7
	fmuls	%f2 ,%f15,%f2 
	fdivs	%f5 ,%f13,%f1 
	jmpl	%o7,%g0
	mulx	%l0,%l6,%l3
p0_near_3_he:
	fdivs	%f17,%f24,%f31
	jmpl	%o7,%g0
	fsubs	%f30,%f23,%f26
near3_b2b_h:
	or	%l0,-0xad8,%l6
	udivx	%l0,%l2,%l6
	mulx	%l7,0x0e8,%l1
	jmpl	%o7,%g0
	or	%l1,-0x455,%l2
near3_b2b_l:
	subc	%l2,%l7,%l3
	smul	%l5,%l4,%l4
	xnor	%l2,0xfdd,%l1
	jmpl	%o7,%g0
	xor	%l7,%l4,%l0
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	smul	%l3,-0x4bb,%l4
	xnor	%l1,-0x21c,%l6
	fcmps	%fcc1,%f12,%f5 
	andn	%l6,%l1,%l3
	smul	%l5,%l1,%l7
	subc	%l4,%l1,%l0
	smul	%l7,-0x59f,%l5
	jmpl	%o7,%g0
	fdivs	%f0 ,%f14,%f9 
p0_far_0_lem:
	smul	%l3,-0x4bb,%l4
	xnor	%l1,-0x21c,%l6
	fcmps	%fcc1,%f12,%f5 
	andn	%l6,%l1,%l3
	smul	%l5,%l1,%l7
	subc	%l4,%l1,%l0
	smul	%l7,-0x59f,%l5
	jmpl	%o7,%g0
	fdivs	%f0 ,%f14,%f9 
p0_far_0_he:
	xnor	%l4,0x4d9,%l1
	andn	%l6,%l2,%l6
	smul	%l6,0xbe3,%l1
	add	%l7,%l5,%l3
	addc	%l6,%l3,%l5
	xnor	%l6,%l5,%l0
	jmpl	%o7,%g0
	fadds	%f19,%f21,%f21
p0_far_0_hem:
	xnor	%l4,0x4d9,%l1
	andn	%l6,%l2,%l6
	smul	%l6,0xbe3,%l1
	add	%l7,%l5,%l3
	addc	%l6,%l3,%l5
	xnor	%l6,%l5,%l0
	jmpl	%o7,%g0
	fadds	%f19,%f21,%f21
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	mulx	%l0,-0x165,%l3
	fitod	%f26,%f22
	fadds	%f23,%f21,%f16
	and	%l6,0x616,%l0
	jmpl	%o7,%g0
	mulx	%l7,%l4,%l0
far0_b2b_l:
	addc	%l1,0xcef,%l1
	mulx	%l6,-0xaee,%l3
	or	%l3,0xb94,%l4
	udivx	%l7,%l1,%l5
	jmpl	%o7,%g0
	and	%l6,%l7,%l1
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fadds	%f3 ,%f3 ,%f12
	fadds	%f12,%f6 ,%f11
	umul	%l0,-0x5ad,%l1
	fadds	%f2 ,%f8 ,%f1 
	addc	%l7,%l4,%l1
	umul	%l6,-0xf4b,%l6
	smul	%l3,%l2,%l4
	jmpl	%o7,%g0
	fsubs	%f7 ,%f3 ,%f3 
p0_far_1_lem:
	fadds	%f3 ,%f3 ,%f12
	fadds	%f12,%f6 ,%f11
	umul	%l0,-0x5ad,%l1
	fadds	%f2 ,%f8 ,%f1 
	addc	%l7,%l4,%l1
	umul	%l6,-0xf4b,%l6
	smul	%l3,%l2,%l4
	jmpl	%o7,%g0
	fsubs	%f7 ,%f3 ,%f3 
p0_far_1_he:
	xnor	%l1,%l3,%l2
	andn	%l6,%l0,%l1
	or	%l0,%l2,%l3
	xor	%l4,0xe15,%l3
	orn	%l6,0xe38,%l4
	subc	%l7,%l6,%l7
	subc	%l2,%l1,%l4
	jmpl	%o7,%g0
	xor	%l3,0xc21,%l7
p0_far_1_hem:
	xnor	%l1,%l3,%l2
	andn	%l6,%l0,%l1
	or	%l0,%l2,%l3
	xor	%l4,0xe15,%l3
	orn	%l6,0xe38,%l4
	subc	%l7,%l6,%l7
	subc	%l2,%l1,%l4
	jmpl	%o7,%g0
	xor	%l3,0xc21,%l7
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	xor	%l1,-0x60c,%l0
	fcmps	%fcc3,%f21,%f25
	sub	%l1,-0x9ac,%l6
	jmpl	%o7,%g0
	xnor	%l2,%l7,%l4
far1_b2b_l:
	subc	%l7,%l6,%l2
	fsubs	%f11,%f5 ,%f2 
	addc	%l1,-0xe89,%l7
	jmpl	%o7,%g0
	umul	%l1,0x5b2,%l7
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	umul	%l7,%l4,%l5
	fmuls	%f1 ,%f7 ,%f4 
	stx	%l5,[%i5+0x038]		! Mem[0000000010141438]
	jmpl	%o7,%g0
	xor	%l7,%l3,%l0
p0_far_2_lem:
	umul	%l7,%l4,%l5
	fmuls	%f1 ,%f7 ,%f4 
	membar	#Sync
	stx	%l5,[%i5+0x038]		! Mem[0000000010141438]
	jmpl	%o7,%g0
	xor	%l7,%l3,%l0
p0_far_2_he:
	jmpl	%o7,%g0
	or	%l2,-0x5ad,%l0
	jmpl	%o7,%g0
	nop
p0_far_2_hem:
	jmpl	%o7,%g0
	or	%l2,-0x5ad,%l0
	jmpl	%o7,%g0
	nop
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	udivx	%l5,%l3,%l4
	fsubs	%f27,%f28,%f21
	jmpl	%o7,%g0
	xor	%l1,-0x9c2,%l1
far2_b2b_l:
	subc	%l7,%l2,%l5
	umul	%l3,0x551,%l0
	jmpl	%o7,%g0
	xnor	%l3,%l4,%l1
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	orn	%l5,%l4,%l3
	smul	%l6,%l7,%l1
	xnor	%l2,%l7,%l4
	subc	%l2,0x2f8,%l5
	fmuls	%f11,%f9 ,%f4 
	orn	%l2,%l3,%l2
	mulx	%l1,-0x1aa,%l2
	jmpl	%o7,%g0
	std	%l0,[%i4+0x008]		! Mem[0000000010101408]
p0_far_3_lem:
	orn	%l5,%l4,%l3
	smul	%l6,%l7,%l1
	xnor	%l2,%l7,%l4
	subc	%l2,0x2f8,%l5
	fmuls	%f11,%f9 ,%f4 
	orn	%l2,%l3,%l2
	mulx	%l1,-0x1aa,%l2
	membar	#Sync
	jmpl	%o7,%g0
	std	%l0,[%i4+0x008]		! Mem[0000000010101408]
p0_far_3_he:
	sub	%l5,%l1,%l2
	fadds	%f29,%f16,%f30
	jmpl	%o7,%g0
	umul	%l0,0xb79,%l6
p0_far_3_hem:
	sub	%l5,%l1,%l2
	fadds	%f29,%f16,%f30
	jmpl	%o7,%g0
	umul	%l0,0xb79,%l6
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	andn	%l3,%l6,%l6
	jmpl	%o7,%g0
	fdivs	%f17,%f19,%f19
far3_b2b_l:
	subc	%l0,0xce4,%l4
	jmpl	%o7,%g0
	sdivx	%l5,0x0f5,%l5
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	jmpl	%g6+8,%g0
	fmuls	%f13,%f3 ,%f2 
p0_call_0_le:
	addc	%l4,%l6,%l5
	add	%l7,%l3,%l1
	and	%l1,%l2,%l5
	sub	%l3,-0xb5e,%l0
	andn	%l1,%l7,%l3
	retl
	udivx	%l1,0xe93,%l4
p0_jmpl_0_lo:
	jmpl	%g6+8,%g0
	fmuls	%f13,%f3 ,%f2 
p0_call_0_lo:
	addc	%l4,%l6,%l5
	add	%l7,%l3,%l1
	and	%l1,%l2,%l5
	sub	%l3,-0xb5e,%l0
	andn	%l1,%l7,%l3
	retl
	udivx	%l1,0xe93,%l4
p0_jmpl_0_he:
	fdivs	%f31,%f26,%f18
	and	%l1,-0x783,%l2
	add	%l6,0xb8b,%l2
	jmpl	%g6+8,%g0
	fitod	%f22,%f16
p0_call_0_he:
	fadds	%f24,%f24,%f29
	addc	%l2,0xb70,%l7
	subc	%l1,-0xeae,%l6
	retl
	orn	%l7,0xd39,%l4
p0_jmpl_0_ho:
	fdivs	%f31,%f26,%f18
	and	%l1,-0x783,%l2
	add	%l6,0xb8b,%l2
	jmpl	%g6+8,%g0
	fitod	%f22,%f16
p0_call_0_ho:
	fadds	%f24,%f24,%f29
	addc	%l2,0xb70,%l7
	subc	%l1,-0xeae,%l6
	retl
	orn	%l7,0xd39,%l4
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	xor	%l2,-0x886,%l5
	jmpl	%g6+8,%g0
	umul	%l6,%l1,%l3
p0_call_1_le:
	swap	[%i6+0x018],%l1		! Mem[0000000010181418]
	swap	[%i1+0x020],%l1		! Mem[0000000010041420]
	retl
	fsubs	%f10,%f3 ,%f7 
p0_jmpl_1_lo:
	xor	%l2,-0x886,%l5
	jmpl	%g6+8,%g0
	umul	%l6,%l1,%l3
p0_call_1_lo:
	swap	[%o6+0x018],%l1		! Mem[0000000010181418]
	swap	[%o1+0x020],%l1		! Mem[0000000010041420]
	retl
	fsubs	%f10,%f3 ,%f7 
p0_jmpl_1_he:
	subc	%l3,0x6bf,%l7
	jmpl	%g6+8,%g0
	xnor	%l6,%l0,%l2
p0_call_1_he:
	fdivs	%f19,%f18,%f26
	xor	%l6,0xf47,%l2
	retl
	sdivx	%l2,%l6,%l4
p0_jmpl_1_ho:
	subc	%l3,0x6bf,%l7
	jmpl	%g6+8,%g0
	xnor	%l6,%l0,%l2
p0_call_1_ho:
	fdivs	%f19,%f18,%f26
	xor	%l6,0xf47,%l2
	retl
	sdivx	%l2,%l6,%l4
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	xnor	%l0,0x5d1,%l1
	sdivx	%l7,%l0,%l3
	fcmps	%fcc3,%f10,%f10
	jmpl	%g6+8,%g0
	smul	%l6,-0x90c,%l2
p0_call_2_le:
	or	%l2,%l3,%l1
	and	%l2,%l4,%l0
	mulx	%l4,-0xa9e,%l7
	smul	%l5,0x07b,%l6
	xnor	%l5,%l5,%l6
	fadds	%f8 ,%f5 ,%f12
	subc	%l3,%l2,%l6
	retl
	orn	%l7,-0x443,%l3
p0_jmpl_2_lo:
	xnor	%l0,0x5d1,%l1
	sdivx	%l7,%l0,%l3
	fcmps	%fcc3,%f10,%f10
	jmpl	%g6+8,%g0
	smul	%l6,-0x90c,%l2
p0_call_2_lo:
	or	%l2,%l3,%l1
	and	%l2,%l4,%l0
	mulx	%l4,-0xa9e,%l7
	smul	%l5,0x07b,%l6
	xnor	%l5,%l5,%l6
	fadds	%f8 ,%f5 ,%f12
	subc	%l3,%l2,%l6
	retl
	orn	%l7,-0x443,%l3
p0_jmpl_2_he:
	or	%l0,%l5,%l7
	andn	%l0,%l0,%l4
	andn	%l2,%l7,%l7
	fcmps	%fcc2,%f16,%f30
	or	%l0,%l2,%l5
	or	%l4,%l4,%l6
	mulx	%l5,-0xfa7,%l3
	jmpl	%g6+8,%g0
	mulx	%l1,-0xc06,%l4
p0_call_2_he:
	ldsb	[%i4+0x02b],%l5		! Mem[000000001010142b]
	orn	%l7,-0xf81,%l6
	addc	%l0,%l4,%l2
	or	%l4,%l1,%l0
	mulx	%l2,-0x5dc,%l6
	retl
	umul	%l6,0xb4c,%l7
p0_jmpl_2_ho:
	or	%l0,%l5,%l7
	andn	%l0,%l0,%l4
	andn	%l2,%l7,%l7
	fcmps	%fcc2,%f16,%f30
	or	%l0,%l2,%l5
	or	%l4,%l4,%l6
	mulx	%l5,-0xfa7,%l3
	jmpl	%g6+8,%g0
	mulx	%l1,-0xc06,%l4
p0_call_2_ho:
	ldsb	[%o4+0x02b],%l5		! Mem[000000001010142b]
	orn	%l7,-0xf81,%l6
	addc	%l0,%l4,%l2
	or	%l4,%l1,%l0
	mulx	%l2,-0x5dc,%l6
	retl
	umul	%l6,0xb4c,%l7
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	ldstub	[%o2+0x000],%l7		! Mem[00000000211c0000]
	jmpl	%g6+8,%g0
	stx	%l5,[%i1+0x020]		! Mem[0000000010041420]
p0_call_3_le:
	xor	%l6,-0x996,%l6
	addc	%l2,%l4,%l5
	orn	%l0,-0x9f0,%l3
	and	%l1,%l5,%l5
	fadds	%f11,%f10,%f10
	retl
	udivx	%l0,0x431,%l4
p0_jmpl_3_lo:
	ldstub	[%i2+0x000],%l7		! Mem[00000000211c0000]
	jmpl	%g6+8,%g0
	stx	%l5,[%o1+0x020]		! Mem[0000000010041420]
p0_call_3_lo:
	xor	%l6,-0x996,%l6
	addc	%l2,%l4,%l5
	orn	%l0,-0x9f0,%l3
	and	%l1,%l5,%l5
	fadds	%f11,%f10,%f10
	retl
	udivx	%l0,0x431,%l4
p0_jmpl_3_he:
	jmpl	%g6+8,%g0
	umul	%l0,-0xd16,%l0
p0_call_3_he:
	mulx	%l6,%l2,%l2
	udivx	%l7,%l2,%l5
	fadds	%f29,%f25,%f31
	sub	%l3,0x981,%l1
	retl
	orn	%l3,%l2,%l4
p0_jmpl_3_ho:
	jmpl	%g6+8,%g0
	umul	%l0,-0xd16,%l0
p0_call_3_ho:
	mulx	%l6,%l2,%l2
	udivx	%l7,%l2,%l5
	fadds	%f29,%f25,%f31
	sub	%l3,0x981,%l1
	retl
	orn	%l3,%l2,%l4
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
	.word	0xbff8eb00,0x04679c44		! Init value for %l0
	.word	0x4ad4ed8f,0xe343679a		! Init value for %l1
	.word	0xf8bee037,0xd7ce58d8		! Init value for %l2
	.word	0x5ac14325,0xd5e3c596		! Init value for %l3
	.word	0x67030d04,0xf5c9b774		! Init value for %l4
	.word	0x5e1ad981,0x98406171		! Init value for %l5
	.word	0x20e6151a,0x76907d07		! Init value for %l6
	.word	0x5d33acf2,0xa5161374		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x3221c248,0xb44f964d		! Init value for %f0 
	.word	0xf7d99c0b,0xc2e5d15a		! Init value for %f2 
	.word	0x1654d3f0,0x420478f1		! Init value for %f4 
	.word	0x2f7d001e,0xcf157334		! Init value for %f6 
	.word	0x7d4eefa7,0xd6755a69		! Init value for %f8 
	.word	0x006a18af,0x96fbc312		! Init value for %f10
	.word	0xbf4482ca,0x583d2e41		! Init value for %f12
	.word	0x206388cb,0x8c04ea9a		! Init value for %f14
	.word	0x64156cc9,0xdfaee5f8		! Init value for %f16
	.word	0x38483f48,0x1ddbdfe4		! Init value for %f18
	.word	0x9bf246d6,0x47fbeea9		! Init value for %f20
	.word	0x5d2b4d48,0x6e662eef		! Init value for %f22
	.word	0x93b2eb62,0xba371750		! Init value for %f24
	.word	0x6eccb852,0x6383fbc7		! Init value for %f26
	.word	0x91aa7ae8,0xef868c3a		! Init value for %f28
	.word	0xb7282509,0x5c808fe7		! Init value for %f30
	.word	0x9046dbbc,0xbedbe687		! Init value for %f32
	.word	0xf2869c52,0x6f8ebefc		! Init value for %f34
	.word	0xf9a2b020,0xc914127d		! Init value for %f36
	.word	0x2f416023,0x3b2accf7		! Init value for %f38
	.word	0x5c0710e5,0x0d4b6a57		! Init value for %f40
	.word	0xefbf24aa,0xfbc7e253		! Init value for %f42
	.word	0x6b922a06,0xa9bb2186		! Init value for %f44
	.word	0x1440f0c2,0x72338462		! Init value for %f46
	.word	0xef3d682c,0xed8475a3
	.word	0x935f85f4,0x4d3e0347
	.word	0x18df1166,0xf51970bd
	.word	0x745dcb30,0x51adc62f
	.word	0xa3eb91dc,0x25b611cc
	.word	0x6b8c3944,0x3a26b299
	.word	0x399fa82d,0x0ad1d69a
	.word	0xf37046ec,0x43675f4e
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
	.word	0x00000000,0x00000025
	.word	0x00000000,0x00009800
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x6f7f1128
	.word	0x00000000,0x667f1128
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00ffffff
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0x00980000,0xffffffff
	.word	0x00000000,0xffc1c0ff
	.word	0xffc0c1ff,0x43ff8e80
	.word	0x7407d1cc,0xe5105f46
	.word	0x00000000,0x0000006f
	.word	0x00000000,0xcb59d014
	.word	0x000044ff,0x17c0a3f4
	.word	0xc813d670,0xb730ffde
	.word	0x000000ff,0x0000f25d
	.word	0xff300000,0x808eff43
	.word	0x43ff8eff,0x00000000
	.word	0xef2e666e,0x484d2b5d
	.word	0x00006d25,0xfffff25d
	.word	0x00000000,0x000000ff
	.word	0x022c3a70,0x28117f66
	.word	0x14d059cb,0x092528b7
	.word	0x00000022,0x00000400		! %fsr = 0000002200000400
p0_local0_expect:
	.word	0xff4d2b5d,0x28117f66
	.word	0xcb59d014,0x44ffffff
	.word	0x98000000,0x00006d25
	.word	0xba371750,0xffffffff
	.word	0x0000ff36,0xdfaee5f8
	.word	0x1a5e8012,0x17c0a3f4
	.word	0x17c0a3f4,0xfff3b315
	.word	0x00980000,0xea2c70e6
p0_local0_sec_expect:
	.word	0x00980000,0xff000000
	.word	0xff8eff43,0xfb000000
	.word	0x2800ff30,0x52b8cc6e
	.word	0x0b678044,0x093dc16a
	.word	0xb2abd000,0x2fc60389
	.word	0xa2eb71c0,0x24b6d5dc
	.word	0x7adb3055,0x862cf6d5
	.word	0x4a7bb918,0x80967e71
p0_local1_expect:
	.word	0x6f7f0000,0xff25ff1f
	.word	0x00000000,0xff000000
	.word	0x00000002,0x28117f6f
	.word	0x14d059cb,0xafe44c84
	.word	0xe4fab6fa,0xdfbb042c
	.word	0x00000000,0xdfaee5f8
	.word	0x7407d1cc,0xe5105f46
	.word	0xffff6004,0xe6702cea
p0_local1_sec_expect:
	.word	0x6d25ffff,0x00009800
	.word	0xffc0c1ff,0x00000000
	.word	0x808eff43,0xffc1c0ff
	.word	0x465f10e5,0xccd10774
	.word	0x000000ff,0xffc0c1ff
	.word	0xff000000,0x43ff8e80
	.word	0xf4a3c017,0x00000000
	.word	0xdeff30b7,0xffffff44
p0_local2_expect:
	.word	0x000000ff,0x0000f25d
	.word	0x000000ff,0x808eff43
	.word	0x667f1128,0x00000000
	.word	0xef2e666e,0x484d2b5d
	.word	0x00006d25,0xfffff25d
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x19d5d19b
	.word	0x0000805c,0x092528b7
p0_local2_sec_expect:
	.word	0xffffffff,0x00009800
	.word	0xffc0c1ff,0x00000000
	.word	0x808eff43,0xffc1c0ff
	.word	0x465f10e5,0xccd10774
	.word	0x000000ff,0xffc0c1ff
	.word	0xff000000,0x43ff8e80
	.word	0xf4a3c017,0x00000000
	.word	0xdeff30b7,0xffffff44
p0_local3_expect:
	.word	0x2813d670,0xb730ffde
	.word	0x44ffffff,0xb730ffde
	.word	0xffffff00,0xff000000
	.word	0x91ff7ae8,0xf45c4994
	.word	0xff000000,0x00000000
	.word	0x02e2f74f,0x43ff8e80
	.word	0x0000006d,0x12805e1a
	.word	0xdf20400a,0x98b14417
p0_local3_sec_expect:
	.word	0xff000000,0xffc0c1ff
	.word	0xffffffff,0xff000000
	.word	0x6f000000,0x00000000
	.word	0xa450d7b6,0x563b0e8e
	.word	0x709ec2c6,0xb2c040b4
	.word	0x972e35a0,0x2ff72323
	.word	0xe2d92047,0x671bb07e
	.word	0x0397c4d4,0xd04f08da
p0_local4_expect:
	.word	0x94faffff,0x000000c6
	.word	0x022c3a70,0x28117f66
	.word	0xffffb198,0x00000000
	.word	0xef2e666e,0x484d2b5d
	.word	0x88410260,0x8f94bdd2
	.word	0xaefb8363,0x52b8cc6e
	.word	0x00000014,0xffffb852
	.word	0x00000000,0x000000ff
p0_local4_sec_expect:
	.word	0xe83f5cff,0x00000000
	.word	0x00000000,0x00000000
	.word	0xff0000ff,0xa0ab0000
	.word	0x1fe0256d,0x347315ff
	.word	0x00000000,0x00000080
	.word	0xc7fb8363,0x52b8cc6e
	.word	0x000080ff,0xe102e5c6
	.word	0x00000000,0x0000ff00
p0_local5_expect:
	.word	0xff980000,0x00ff0000
	.word	0x00000000,0x667f1128
	.word	0xffc0c1ff,0x43ff8e80
	.word	0x00000000,0x808e0000
	.word	0xaefb8363,0xff000000
	.word	0xfffffa94,0x4ff7e202
	.word	0x1a5e8012,0x17c0a3f4
	.word	0xff000000,0xffc0c1ff
p0_local5_sec_expect:
	.word	0x6d000000,0x0000ff00
	.word	0xff6d0000,0x00000000
	.word	0xff440000,0xffff0000
	.word	0x00000000,0x808eff43
	.word	0x5dc13d40,0x0099670b
	.word	0x6ef4f038,0x27071131
	.word	0xd89688aa,0xd0f33bc2
	.word	0x7eaa893a,0x52d67f34
p0_local6_expect:
	.word	0x00980000,0xffffffff
	.word	0x00000000,0xffc1c0ff
	.word	0x17c0a3f4,0x43ff8e80
	.word	0x7407d1cc,0xe5105f46
	.word	0xffc1c0ff,0xff000000
	.word	0x808eff43,0x000000ff
	.word	0x00000000,0x17c0a3f4
	.word	0x44ffffff,0xb730ffde
p0_local6_sec_expect:
	.word	0xcb59d014,0x000000e3
	.word	0x6eccb852,0x00000000
	.word	0x7407d1cc,0x00000000
	.word	0x922278b1,0x8904c0a0
	.word	0x45df31fa,0xbd9e8c1b
	.word	0x00000000,0x000000ff
	.word	0x1023cb8f,0x5c17eedb
	.word	0xef7efc30,0xbcdb2031
share0_expect:
	.word	0xffff0197,0xfdbe9350
	.word	0xc065189b,0x8e9b1280
	.word	0x4a5c2f67,0x40d13041
	.word	0x1d0300f4,0x4e303ff3
	.word	0xa905ad5c,0x82c43b8c
	.word	0x1af0224d,0x20147aad
	.word	0x881f2cf0,0xed453c64
	.word	0x12a38543,0xc53c8018
share1_expect:
	.word	0xffc67ff0,0xfb92df5a
	.word	0x4de19446,0xbc4e4f7a
	.word	0x2d533f95,0xd5e8cba6
	.word	0x6feba8dd,0x6db0eb98
	.word	0xb14778c8,0x50b7856f
	.word	0x7446e588,0x6d00cdd2
	.word	0x3f868aa5,0xc6c25818
	.word	0xa5579dab,0x81e1f1a2
	.word	0xff006b19,0x33060126
	.word	0xc6a82e77,0x3988f14d
	.word	0x64bb63bc,0xb40b9796
	.word	0x3ef6dd8c,0x8120a712
	.word	0xe69dcb72,0x9f20634a
	.word	0x0e372f9f,0xd32b2c12
	.word	0x0e5d75d2,0xacb5bc2d
	.word	0x7888dc5b,0x596d2eb8
share2_expect:
	.word	0xfffff58c,0x84a19dd3
	.word	0xd26edcbf,0x63cf6c6f
	.word	0x1d8efe13,0x38e9a7f4
	.word	0x2ca3a113,0x9e27ba75
	.word	0x1d72ee48,0xd610743f
	.word	0x8d61bbdc,0xc375006c
	.word	0x16017c1c,0xbebab9ac
	.word	0x1bdd2e28,0xcef6cacb
share3_expect:
	.word	0x3456d163,0xc39ca3b7
	.word	0x09bbffff,0x6c3f4b3d
	.word	0xf2ee590c,0x711a1b72
	.word	0x394e2d57,0xdd7ae3a5
	.word	0xd3bcfdc7,0x67d85ca7
	.word	0x3602cef6,0x77eaebf1
	.word	0xc191884c,0x928d2de9
	.word	0x10df14a2,0x892c3829
	.word	0x6d440053,0xdeb20a87
	.word	0x16baea48,0x93cb7964
	.word	0x080fe335,0x195df954
	.word	0x6df042be,0x8f8aa00c
	.word	0x6c900abf,0x50e93888
	.word	0x83714b07,0xf5950668
	.word	0x41611537,0x001910a9
	.word	0x55697f26,0xb5480dde
	.word	0xd1dee373,0x6762610b
	.word	0x1a676ba9,0xd0600250
	.word	0xb487b506,0xed06790b
	.word	0xd4d1d6fe,0xa8e92dea
	.word	0x35dec38b,0x846f7b53
	.word	0x052c46cd,0xd0cc46e7
	.word	0x4e047d4c,0x1281101e
	.word	0x563e0f02,0x020a894b
	.word	0xff456ac2,0xc2b9a731
	.word	0xc1842566,0x68a7176a
	.word	0x9cc46886,0x8da94e71
	.word	0xd61f212c,0x13cb7c62
	.word	0x9f26afef,0x34cbe10b
	.word	0xc5101cf0,0x6a5fd440
	.word	0x1ed47ac2,0x7fd2d8cf
	.word	0x0076115b,0xdd727f5a
	.word	0xff0039f1,0xa41e9328
	.word	0x0642c14d,0xb931cb63
	.word	0x085738a7,0x4a85bab8
	.word	0x69585b51,0x99f6690c
	.word	0xf8c3b50f,0x179742bc
	.word	0xd28fa4c9,0x5066763b
	.word	0xb489ff1b,0xbbb503af
	.word	0x7a4b3865,0x73bf2f73
	.word	0xffffd3d6,0xf078e82d
	.word	0xadab0eae,0xf9371b77
	.word	0xa5c280c5,0x037a73e9
	.word	0x37fc2349,0xf5747856
	.word	0x643d614c,0x56f0c557
	.word	0x6f65f30f,0xd18a7fa0
	.word	0x600d00dd,0xec449e80
	.word	0xf492579a,0x663a3b58
	.word	0xdeffed8e,0xbbe91513
	.word	0x77e88375,0x68d12ab2
	.word	0xd08adfd9,0xc2943cf1
	.word	0x45f0a211,0x77703dda
	.word	0xae52f67a,0x58550433
	.word	0xb4dd79e4,0xb5acedd3
	.word	0x20fdace3,0xf393c0c3
	.word	0xb0fcf946,0x1a5216ed
	.word	0x2ab55ac0,0x996980f1
	.word	0x42b324cb,0xfd4b40d0
	.word	0x2f9dae1f,0x372a9527
	.word	0xf56170ca,0xcb6d99ed
	.word	0x618b32b3,0x35a1842e
	.word	0x0f947554,0xdddcc178
	.word	0xb9da26f5,0x316fb275
	.word	0xeabd68b6,0x44f1a530
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
	.word	0x86919e4f,0xb08eda42
	.word	0x00000000,0x00000002
	.word	0xb508501f,0xdc30686e
	.word	0x00000000,0x00000003
	.word	0x78b3fd0f,0xf9a81dc5
	.word	0x00000000,0x00000004
	.word	0xae88e9c0,0x75c580ee
	.word	0x00000000,0x00000005
	.word	0x0ea6c9e8,0x714a907d
	.word	0x00000000,0x00000006
	.word	0xe6301640,0x5012bcfc
	.word	0x00000000,0x00000007
	.word	0x6a4a8750,0x47b12fe5
	.word	0x00000000,0x00000008
	.word	0x8d02b368,0x698a0d62
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
	.word	0xf58eae99,0xf7357668,0x545decd9,0x462ee53a
	.word	0xf1e90850,0x0792203f,0x340c95e4,0x47c7492b
	.word	0x0fda436a,0xf0123356,0xbcc28440,0xe9fe58b4
	.word	0x801d3639,0x9b7971a7,0x6c103ed1,0xea2c70e6
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
	.word	0xf38e27e7,0xa2cd6bbb,0xd128d401,0x8232e3d9
	.word	0xf45c4994,0xfe4108d1,0x7b768044,0x09c19a6a
	.word	0xb2abd000,0x2fc60389,0xa2eb71c0,0x24b6d5dc
	.word	0x7adb3055,0x862cf6d5,0x4a7bb918,0x80967e71
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
	.word	0x9792608a,0x6d25e01f,0x054a6bc3,0xe21b01fe
	.word	0x60b37d12,0x8685b60f,0x14d059cb,0xafe44c84
	.word	0xe4fab6fa,0xdfbb042c,0x71f23d4b,0xeacb05d3
	.word	0x7407d1cc,0xe5105f46,0x93456004,0xab2faf04
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
	.word	0x8520e545,0x66865b3b,0x5ea7019c,0x271a0bdf
	.word	0x633954c8,0xac268a04,0xf0bfc8a7,0x7f0c4dfe
	.word	0x5e600eb6,0x6985defb,0x7719e653,0x6764dfe1
	.word	0x60d8ebf7,0x2d2ddae3,0x6fba9fc0,0xdc3c7c6a
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
	.word	0xe4b63d0b,0xcd52b88d,0x7f2f6afe,0x20a12b56
	.word	0x84432ada,0x2c513879,0xc3f82a23,0xc1b61043
	.word	0x50219dc2,0xa8ee0efb,0x69f7a12d,0x4a2e3e94
	.word	0x4ae1ef45,0x5bf40f3f,0x8705205f,0x9a3d54ea
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
	.word	0xba15c5ef,0x1b180e12,0xeab27ac3,0x0fb2e0f4
	.word	0x42ef49c2,0xc1f3ac3e,0x08201d86,0x1b64b120
	.word	0xf4043d40,0x1f9967de,0x6ef4f038,0x27071131
	.word	0xd89688aa,0xd0f33bc2,0x7eaa893a,0x52d67f34
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
	.word	0x08eb8803,0x72d43f38,0x5c6683ae,0xa3dc7ce3
	.word	0xd5f9513a,0x3d43fa77,0x5dc1e4a3,0x8f2b7ac9
	.word	0x1a360512,0x65622c50,0xc5e0d3b9,0x314d4c48
	.word	0x7f400752,0x361be08e,0x5b023817,0xbe6e4936
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
	.word	0x52965b29,0xc6e502e1,0xe37cf9bb,0x39961128
	.word	0x5ccbf547,0x7ad38136,0xa450d7b6,0x563b0e8e
	.word	0x709ec2c6,0xb2c040b4,0x972e35a0,0x2ff72323
	.word	0xe2d92047,0x671bb07e,0x0397c4d4,0xd04f08da
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
	.word	0x68e506e3,0x9c397054,0x394501e0,0x7dee64b4
	.word	0x9cbe1c9c,0x65fccfd2,0xbcec1289,0xfbac83dc
	.word	0x27f3dffe,0x8f92258e,0xd6b058ec,0x15d4c030
	.word	0xa7fe0043,0x36c0d133,0x3a485644,0xec96fcd4
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
	.word	0xecede008,0x25125fa6,0xd539fc46,0x39570e50
	.word	0x2ea79bc4,0x785de915,0x7f497e02,0x8e88571c
	.word	0xcdb710a1,0x1768fb5f,0xdfbf1d3c,0x03a0a2e2
	.word	0x1579295f,0xf3485b17,0xbe6d7562,0xbec4ee6a
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
	.word	0x5385e695,0x2a2ecef3,0x83c1336a,0x5da0339d
	.word	0xc1f01c66,0x19d5d19b,0x52a01884,0x3c17bdea
	.word	0x8488d6c2,0x90de70f4,0x17ee7a79,0x31eddc7e
	.word	0x243de36b,0xff49bfdb,0xa30bd602,0x2468e797
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
	.word	0xa0f3fd96,0x112859d2,0x296cf66f,0xc8859aef
	.word	0xa2572ae2,0x79fcb45e,0xbadaa8a2,0x38cfe90d
	.word	0xf2b425f2,0x8ff71d63,0xead959f7,0xeda98a64
	.word	0x18248437,0xf8cc198f,0x53f9fb45,0x0252cf50
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
	.word	0x5aaf7991,0xf1b73b1d,0xf8018012,0x5d07b1d6
	.word	0x75add3f7,0x8b7554bb,0xb0d1769d,0x8a415afe
	.word	0xbbe115c9,0xfe596a5a,0x808ef943,0x4ff7e202
	.word	0x1a5e3f5e,0x17c0a3f4,0x1744b198,0x0a4020df
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
	.word	0x821e6487,0x28cf5bea,0x65f3e109,0xcc404a0d
	.word	0xf8bd8e54,0xc4bc947a,0x922278b1,0x8904c0a0
	.word	0x45df31fa,0xbd9e8c1b,0x81d68119,0x4c426a58
	.word	0x1023cb8f,0x5c17eedb,0xef7efc30,0xbcdb2031
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
	.word	0x78200197,0xfdbe9350,0xc065189b,0x8e9b1280
	.word	0x4a5c2f67,0x40d13041,0x1d0300f4,0x4e303ff3
	.word	0xa905ad5c,0x82c43b8c,0x1af0224d,0x20147aad
	.word	0x881f2cf0,0xed453c64,0x12a38543,0xc53c8018
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
	.word	0x24d37ff0,0xfb92df5a,0x4de19446,0xbc4e4f7a
	.word	0x2d533f95,0xd5e8cba6,0x6feba8dd,0x6db0eb98
	.word	0xb14778c8,0x50b7856f,0x7446e588,0x6d00cdd2
	.word	0x3f868aa5,0xc6c25818,0xa5579dab,0x81e1f1a2
	.word	0x6ded6b19,0x33060126,0xc6a82e77,0x3988f14d
	.word	0x64bb63bc,0xb40b9796,0x3ef6dd8c,0x8120a712
	.word	0xe69dcb72,0x9f20634a,0x0e372f9f,0xd32b2c12
	.word	0x0e5d75d2,0xacb5bc2d,0x7888dc5b,0x596d2eb8
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
	.word	0xc044f58c,0x84a19dd3,0xd26edcbf,0x63cf6c6f
	.word	0x1d8efe13,0x38e9a7f4,0x2ca3a113,0x9e27ba75
	.word	0x1d72ee48,0xd610743f,0x8d61bbdc,0xc375006c
	.word	0x16017c1c,0xbebab9ac,0x1bdd2e28,0xcef6cacb
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
	.word	0x3456d163,0xc39ca3b7,0x09bbffff,0x6c3f4b3d
	.word	0xf2ee590c,0x711a1b72,0x394e2d57,0xdd7ae3a5
	.word	0xd3bcfdc7,0x67d85ca7,0x3602cef6,0x77eaebf1
	.word	0xc191884c,0x928d2de9,0x10df14a2,0x892c3829
	.word	0x1a490053,0xdeb20a87,0x16baea48,0x93cb7964
	.word	0x080fe335,0x195df954,0x6df042be,0x8f8aa00c
	.word	0x6c900abf,0x50e93888,0x83714b07,0xf5950668
	.word	0x41611537,0x001910a9,0x55697f26,0xb5480dde
	.word	0xd1dee373,0x6762610b,0x1a676ba9,0xd0600250
	.word	0xb487b506,0xed06790b,0xd4d1d6fe,0xa8e92dea
	.word	0x35dec38b,0x846f7b53,0x052c46cd,0xd0cc46e7
	.word	0x4e047d4c,0x1281101e,0x563e0f02,0x020a894b
	.word	0x2f456ac2,0xc2b9a731,0xc1842566,0x68a7176a
	.word	0x9cc46886,0x8da94e71,0xd61f212c,0x13cb7c62
	.word	0x9f26afef,0x34cbe10b,0xc5101cf0,0x6a5fd440
	.word	0x1ed47ac2,0x7fd2d8cf,0x0076115b,0xdd727f5a
	.word	0x0abd39f1,0xa41e9328,0x0642c14d,0xb931cb63
	.word	0x085738a7,0x4a85bab8,0x69585b51,0x99f6690c
	.word	0xf8c3b50f,0x179742bc,0xd28fa4c9,0x5066763b
	.word	0xb489ff1b,0xbbb503af,0x7a4b3865,0x73bf2f73
	.word	0xa19bd3d6,0xf078e82d,0xadab0eae,0xf9371b77
	.word	0xa5c280c5,0x037a73e9,0x37fc2349,0xf5747856
	.word	0x643d614c,0x56f0c557,0x6f65f30f,0xd18a7fa0
	.word	0x600d00dd,0xec449e80,0xf492579a,0x663a3b58
	.word	0xdc84ed8e,0xbbe91513,0x77e88375,0x68d12ab2
	.word	0xd08adfd9,0xc2943cf1,0x45f0a211,0x77703dda
	.word	0xae52f67a,0x58550433,0xb4dd79e4,0xb5acedd3
	.word	0x20fdace3,0xf393c0c3,0xb0fcf946,0x1a5216ed
	.word	0x2ab55ac0,0x996980f1,0x42b324cb,0xfd4b40d0
	.word	0x2f9dae1f,0x372a9527,0xf56170ca,0xcb6d99ed
	.word	0x618b32b3,0x35a1842e,0x0f947554,0xdddcc178
	.word	0xb9da26f5,0x316fb275,0xeabd68b6,0x44f1a530
share3_end:
