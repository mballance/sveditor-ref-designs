/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_9.s
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
!	Seed = 330103143
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1500_9.s created on Mar 30, 2009 (10:31:43)
!	RC file : mar26.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar26.rc -o mpgen_1500_9 -p 1 -l 1500

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
!	%f0  = b7e83110 8f0502e1 0f3182ff 88736332
!	%f4  = 272f85d8 6fde6585 280733ba 724b4428
!	%f8  = e00800fb a9562fd5 fe7d5987 9ae2e312
!	%f12 = aa9ef186 c64fa1d9 3b17526f 0733e1aa
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 305ba6e9 59eee89c 6aa433c0 404c134c
!	%f20 = 99212682 652f148d 3021dadc 24bfc0f3
!	%f24 = a14a01d2 b89387d8 5bec8646 65e1e60b
!	%f28 = b2251e38 290b9ca2 7184b745 f8671507
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 43fe4ad8 8be5e777 6eff4d52 b1e26a30
!	%f36 = 2731a5b4 580ba1b1 0caefb13 2512f087
!	%f40 = 181207cd 7391a6ff b5bf580a 0598849f
!	%f44 = 6e718b8e 797232aa 27b6bd2e d7a68e02
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x8e65647f00000027,%g7,%g1 ! GSR scale =  4, align = 7
	wr	%g1,%g0,%gsr		! GSR = 8e65647f00000027
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000030141400] = 72c31e4a, %l2 = 4e8cdb28a28d460c
	lduwa	[%i5+%g0]0x81,%l2	! %l2 = 0000000072c31e4a
!	Mem[0000000010101408] = 27acc074, %l7 = b9787fb21f22d3b4
	lduba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000027
!	%f12 = aa9ef186 c64fa1d9, Mem[0000000010181400] = e82004ba f7edc55f
	stda	%f12,[%i6+%g0]0x80	! Mem[0000000010181400] = aa9ef186 c64fa1d9
!	Mem[0000000030141408] = 6d4f275d, %l7 = 0000000000000027
	ldstuba	[%i5+%o4]0x89,%l7	! %l7 = 0000005d000000ff
!	%l6 = c8683373, %l7 = 0000005d, Mem[0000000010181438] = 4680de71 679fb42a
	std	%l6,[%i6+0x038]		! Mem[0000000010181438] = c8683373 0000005d
!	Mem[00000000300c1410] = af51e4ca, %l0 = 1b50cc78b0f3e5f8
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = ffffffffaf51e4ca
!	%f10 = fe7d5987 9ae2e312, %l6 = a94ed761c8683373
!	Mem[0000000030081408] = 47aa4ea5593ebc74
	add	%i2,0x008,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_S ! Mem[0000000030081408] = 47aa4ea59ae2e312
!	Mem[0000000010041410] = e524bf98, %l6 = a94ed761c8683373
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 00000000e524bf98
!	Mem[0000000010041408] = 7c55dc65, %l0 = ffffffffaf51e4ca
	ldswa	[%i1+%o4]0x88,%l0	! %l0 = 000000007c55dc65
!	Starting 10 instruction Store Burst
!	%f22 = 3021dadc, Mem[0000000010141408] = 5467e664
	sta	%f22,[%i5+%o4]0x88	! Mem[0000000010141408] = 3021dadc

p0_label_2:
!	%l6 = 00000000e524bf98, Mem[0000000030001408] = e651e6a4f9ae0cd0
	stxa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000e524bf98
!	%l0 = 000000007c55dc65, Mem[0000000010081400] = 4b6d194e9e50da66
	stxa	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000007c55dc65
!	%f16 = 305ba6e9 59eee89c, Mem[00000000100c1400] = 58e5457d 4ab54820
	stda	%f16,[%i3+%g0]0x88	! Mem[00000000100c1400] = 305ba6e9 59eee89c
!	%l5 = 048b0f5267089abd, Mem[00000000100c1410] = 1219f874
	stwa	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 67089abd
!	%l2 = 72c31e4a, %l3 = 4cd87372, Mem[0000000010141408] = 3021dadc 16688f4c
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 72c31e4a 4cd87372
!	Mem[0000000010141410] = ebd7d6db, %l0 = 000000007c55dc65
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 00000000ebd7d6db
!	Mem[0000000010041418] = 0d8ff46c, %l5 = 048b0f5267089abd, %asi = 80
	swapa	[%i1+0x018]%asi,%l5	! %l5 = 000000000d8ff46c
!	Mem[0000000010141410] = 65dc557c, %l7 = 000000000000005d
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 0000000065dc557c
!	%f9  = a9562fd5, Mem[0000000030101400] = 762cfe44
	sta	%f9 ,[%i4+%g0]0x89	! Mem[0000000030101400] = a9562fd5
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = e5be92ba, %l2 = 0000000072c31e4a
	lduwa	[%i6+%g0]0x89,%l2	! %l2 = 00000000e5be92ba

p0_label_3:
!	Mem[0000000010141410] = 6f371fa3 5d000000, %l6 = e524bf98, %l7 = 65dc557c
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 000000005d000000 000000006f371fa3
!	Mem[0000000030081408] = a54eaa47, %l0 = 00000000ebd7d6db
	ldsba	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000047
!	Mem[0000000010101408] = c328171674c0ac27, %f6  = 280733ba 724b4428
	ldda	[%i4+%o4]0x88,%f6 	! %f6  = c3281716 74c0ac27
!	Mem[00000000201c0000] = 5685e51a, %l2 = 00000000e5be92ba
	ldsb	[%o0+0x001],%l2		! %l2 = ffffffffffffff85
!	Mem[0000000010001408] = 5ffda2c4, %l6 = 000000005d000000
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = 000000005ffda2c4
!	Mem[0000000010101410] = 8269079c8b4c6584, %l7 = 000000006f371fa3
	ldxa	[%i4+%o5]0x88,%l7	! %l7 = 8269079c8b4c6584
!	Mem[0000000010001400] = c247b3d6 11bfe9a5, %l6 = 5ffda2c4, %l7 = 8b4c6584
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000c247b3d6 0000000011bfe9a5
!	Mem[0000000030081408] = a54eaa47, %l0 = 0000000000000047
	lduwa	[%i2+%o4]0x89,%l0	! %l0 = 00000000a54eaa47
!	Mem[0000000030181408] = 2eb86decb7fa8082, %f24 = a14a01d2 b89387d8
	ldda	[%i6+%o4]0x89,%f24	! %f24 = 2eb86dec b7fa8082
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffff85, Mem[0000000010041400] = e2dc1530
	stba	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 85dc1530

p0_label_4:
!	Mem[0000000010001404] = 11bfe9a5, %l6 = 00000000c247b3d6
	swap	[%i0+0x004],%l6		! %l6 = 0000000011bfe9a5
!	Mem[0000000010081425] = 2b024165, %l6 = 0000000011bfe9a5
	ldstub	[%i2+0x025],%l6		! %l6 = 00000002000000ff
!	%l6 = 0000000000000002, Mem[0000000010041409] = 65dc557c, %asi = 80
	stba	%l6,[%i1+0x009]%asi	! Mem[0000000010041408] = 6502557c
!	Mem[0000000030041410] = cd31c970, %l6 = 0000000000000002
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffffcd
!	Mem[0000000010081410] = 4f3bcec6, %l5 = 000000000d8ff46c
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 000000004f3bcec6
!	Mem[0000000010081430] = 74c8d83e243125ad, %l3 = 953b6e6e4cd87372, %l0 = 00000000a54eaa47
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = 74c8d83e243125ad
!	%f10 = fe7d5987 9ae2e312, Mem[0000000010081410] = 0d8ff46c df13e779
	stda	%f10,[%i2+%o5]0x88	! Mem[0000000010081410] = fe7d5987 9ae2e312
!	%l6 = ffffffffffffffcd, Mem[00000000300c1400] = 5e19ccb1
	stha	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 5e19ffcd
!	%l3 = 953b6e6e4cd87372, Mem[0000000010081408] = 73ef0a93
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 73ef0a72
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 5685e51a, %l2 = ffffffffffffff85
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 0000000000005685

p0_label_5:
!	Mem[0000000010101408] = 74c0ac27, %l6 = ffffffffffffffcd
	ldsha	[%i4+%o4]0x88,%l6	! %l6 = ffffffffffffac27
!	Mem[0000000010101400] = c38cc13e, %l4 = 1656e32c3d112658
	lduwa	[%i4+%g0]0x80,%l4	! %l4 = 00000000c38cc13e
!	Mem[0000000010101400] = c38cc13e2a03f6bc, %l1 = adff012013306dce
	ldxa	[%i4+0x000]%asi,%l1	! %l1 = c38cc13e2a03f6bc
!	Mem[0000000030101400] = d52f56a9, %l3 = 953b6e6e4cd87372
	ldswa	[%i4+%g0]0x81,%l3	! %l3 = ffffffffd52f56a9
!	Mem[0000000010001408] = c4a2fd5f, %l4 = 00000000c38cc13e
	lduwa	[%i0+%o4]0x88,%l4	! %l4 = 00000000c4a2fd5f
!	Mem[0000000010001400] = d6b347c2, %l5 = 000000004f3bcec6
	ldsha	[%i0+%g0]0x88,%l5	! %l5 = 00000000000047c2
!	Mem[0000000030101410] = 5b94dcd9, %l5 = 00000000000047c2
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = ffffffffffffdcd9
!	Mem[0000000020800000] = 42ad7920, %l5 = ffffffffffffdcd9
	lduh	[%o1+%g0],%l5		! %l5 = 00000000000042ad
!	Mem[0000000010081408] = 720aef73, %l3 = ffffffffd52f56a9
	ldsba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000072
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = e3ec3d62, %l5 = 00000000000042ad
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 00000062000000ff

p0_label_6:
!	%l3 = 0000000000000072, Mem[0000000030101408] = 1ce98060
	stwa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000072
!	%f26 = 5bec8646 65e1e60b, Mem[0000000010041410] = c8683373 ad434642
	stda	%f26,[%i1+%o5]0x88	! Mem[0000000010041410] = 5bec8646 65e1e60b
!	Mem[0000000010041410] = 0be6e165, %l6 = ffffffffffffac27
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 0000000b000000ff
!	%l2 = 00005685, %l3 = 00000072, Mem[0000000030041400] = ffa6a53e b29a2924
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00005685 00000072
!	Mem[00000000211c0001] = 4a513616, %l7 = 0000000011bfe9a5
	ldstub	[%o2+0x001],%l7		! %l7 = 00000051000000ff
!	%f4  = 272f85d8 6fde6585, %l1 = c38cc13e2a03f6bc
!	Mem[0000000030101400] = d52f56a9d1aea1a6
	stda	%f4,[%i4+%l1]ASI_PST32_SL ! Mem[0000000030101400] = d52f56a9d1aea1a6
!	%l1 = c38cc13e2a03f6bc, Mem[0000000010081408] = 197ec40b73ef0a72
	stxa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = c38cc13e2a03f6bc
!	%l2 = 00005685, %l3 = 00000072, Mem[0000000030041408] = 45df9aeb 295bb2eb
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00005685 00000072
!	Mem[0000000030181410] = c6932774, %l2 = 0000000000005685
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 00000074000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 400228d9, %l7 = 0000000000000051
	ldswa	[%i3+%o4]0x81,%l7	! %l7 = 00000000400228d9

p0_label_7:
!	Mem[0000000030041400] = 00005685, %l2 = 0000000000000074
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 6ac8e0fe, %l0 = 74c8d83e243125ad
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 000000006ac8e0fe
!	Mem[0000000030081410] = 8fed6b77edca7feb, %l0 = 000000006ac8e0fe
	ldxa	[%i2+%o5]0x89,%l0	! %l0 = 8fed6b77edca7feb
!	Mem[0000000010141400] = 11dad1b1 d5e1af77, %l4 = c4a2fd5f, %l5 = 00000062
	ldd	[%i5+%g0],%l4		! %l4 = 0000000011dad1b1 00000000d5e1af77
!	Mem[00000000300c1408] = d9280240, %l0 = 8fed6b77edca7feb
	lduba	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000040
!	Mem[00000000300c1400] = 5e19ffcd, %l0 = 0000000000000040
	lduha	[%i3+%g0]0x89,%l0	! %l0 = 000000000000ffcd
!	Mem[0000000010001408] = c4a2fd5f, %l7 = 00000000400228d9
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = ffffffffc4a2fd5f
!	Mem[0000000010181400] = aa9ef186, %l7 = ffffffffc4a2fd5f
	lduba	[%i6+%g0]0x80,%l7	! %l7 = 00000000000000aa
!	Mem[00000000300c1400] = cdff195e275c3e78, %f24 = 2eb86dec b7fa8082
	ldda	[%i3+%g0]0x81,%f24	! %f24 = cdff195e 275c3e78
!	Starting 10 instruction Store Burst
!	%l1 = c38cc13e2a03f6bc, Mem[0000000010001400] = d6b347c2
	stwa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 2a03f6bc

p0_label_8:
!	%l2 = 0000000000000000, Mem[00000000100c1410] = 67089abd
	stba	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 67089a00
!	%l2 = 0000000000000000, Mem[0000000030181410] = ff2793c6
	stha	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 000093c6
!	%f12 = aa9ef186 c64fa1d9, Mem[0000000010181410] = e5a8302b c2cf4497
	stda	%f12,[%i6+%o5]0x80	! Mem[0000000010181410] = aa9ef186 c64fa1d9
!	%l6 = 000000000000000b, Mem[0000000010081400] = 65dc557c
	stwa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000b
!	%f0  = b7e83110 8f0502e1, %l5 = 00000000d5e1af77
!	Mem[0000000030101408] = 72000000b68a8948
	add	%i4,0x008,%g1
	stda	%f0,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030101408] = e102058f10318948
!	Mem[0000000010041408] = 7c550265, %l1 = c38cc13e2a03f6bc
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 000000007c550265
!	%l1 = 000000007c550265, Mem[0000000030141408] = ff274f6d
	stba	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 65274f6d
!	%l4 = 0000000011dad1b1, Mem[0000000020800040] = f7d612f0, %asi = 80
	stha	%l4,[%o1+0x040]%asi	! Mem[0000000020800040] = d1b112f0
!	Mem[0000000010141408] = 4a1ec372, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 000000004a1ec372
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = d1b112f0, %l0 = 000000000000ffcd
	lduh	[%o1+0x040],%l0		! %l0 = 000000000000d1b1

p0_label_9:
!	Mem[0000000030001408] = 00000000, %l6 = 000000000000000b
	lduba	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141410] = 0e8b1de3, %l6 = 0000000000000000
	ldswa	[%i5+%o5]0x81,%l6	! %l6 = 000000000e8b1de3
!	Mem[0000000010001410] = bb1bb6acac18890f, %f10 = fe7d5987 9ae2e312
	ldda	[%i0+%o5]0x88,%f10	! %f10 = bb1bb6ac ac18890f
!	Mem[00000000100c1400] = 9ce8ee59 e9a65b30, %l0 = 0000d1b1, %l1 = 7c550265
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 000000009ce8ee59 00000000e9a65b30
!	Mem[0000000020800040] = d1b112f0, %l1 = 00000000e9a65b30
	lduha	[%o1+0x040]%asi,%l1	! %l1 = 000000000000d1b1
!	Mem[00000000211c0000] = 4aff3616, %l7 = 00000000000000aa
	ldsh	[%o2+%g0],%l7		! %l7 = 0000000000004aff
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030041400] = 00005685 00000072 00005685 00000072
!	Mem[0000000030041410] = cd31c970 7506eaa6 91ff4bac 3918c9fc
!	Mem[0000000030041420] = 73d87561 8b959f9f 0a8e4cf8 593e6b7f
!	Mem[0000000030041430] = 1b0e6cf8 91ff89e4 35a848b3 6df6ad86
	ldda	[%i1]ASI_BLK_AIUS,%f0	! Block Load from 0000000030041400
!	Mem[0000000010141400] = 11dad1b1d5e1af77, %l3 = 0000000000000072
	ldxa	[%i5+%g0]0x80,%l3	! %l3 = 11dad1b1d5e1af77
!	Mem[000000001004143c] = 8f7cd9c8, %l0 = 000000009ce8ee59
	lduw	[%i1+0x03c],%l0		! %l0 = 000000008f7cd9c8
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000d1b1, Mem[0000000030181408] = b7fa8082
	stha	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = b7fad1b1

p0_label_10:
	membar	#Sync			! Added by membar checker (2)
!	%l5 = 00000000d5e1af77, Mem[0000000030041408] = 85560000
	stha	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 8556af77
!	%l1 = 000000000000d1b1, Mem[0000000030001408] = 00000000
	stwa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000d1b1
!	%l0 = 8f7cd9c8, %l1 = 0000d1b1, Mem[0000000030141400] = 4a1ec372 64665494
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 8f7cd9c8 0000d1b1
!	%l0 = 000000008f7cd9c8, Mem[0000000010081410] = 12e3e29a87597dfe
	stxa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000008f7cd9c8
!	%l2 = 000000004a1ec372, %l1 = 000000000000d1b1, %y  = 00000000
	smul	%l2,%l1,%l4		! %l4 = 00003cb65cd533d2, %y = 00003cb6
!	Mem[0000000010141400] = b1d1da11, %l1 = 000000000000d1b1
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 00000000b1d1da11
!	Mem[0000000010081410] = 00000000, %l3 = 11dad1b1d5e1af77
	swapa	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = bcf6032ac247b3d6, %l4 = 00003cb65cd533d2, %l1 = 00000000b1d1da11
	casxa	[%i0]0x80,%l4,%l1	! %l1 = bcf6032ac247b3d6
!	%f10 = 0a8e4cf8, Mem[0000000010141410] = 0000005d
	sta	%f10,[%i5+0x010]%asi	! Mem[0000000010141410] = 0a8e4cf8
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 5ffda2c4, %l4 = 00003cb65cd533d2
	ldsba	[%i0+%o4]0x80,%l4	! %l4 = 000000000000005f

p0_label_11:
!	Mem[00000000300c1410] = cae451af, %l2 = 000000004a1ec372
	ldsba	[%i3+%o5]0x89,%l2	! %l2 = ffffffffffffffaf
!	Mem[0000000010001400] = 2a03f6bc, %l1 = bcf6032ac247b3d6
	ldsba	[%i0+%g0]0x88,%l1	! %l1 = ffffffffffffffbc
!	Mem[00000000300c1410] = af51e4ca, %l0 = 000000008f7cd9c8
	lduba	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000af
!	Mem[0000000010041410] = ffe6e165, %l7 = 0000000000004aff
	lduwa	[%i1+%o5]0x80,%l7	! %l7 = 00000000ffe6e165
!	Mem[0000000030141408] = 65274f6d, %l5 = 00000000d5e1af77
	ldswa	[%i5+%o4]0x81,%l5	! %l5 = 0000000065274f6d
!	Mem[0000000030141400] = c8d97c8f, %l6 = 000000000e8b1de3
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 000000000000c8d9
!	Mem[0000000010041410] = ffe6e165, %l1 = ffffffffffffffbc
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = ffffffffffe6e165
!	Mem[0000000010141410] = 6f371fa3f84c8e0a, %l0 = 00000000000000af
	ldxa	[%i5+%o5]0x88,%l0	! %l0 = 6f371fa3f84c8e0a
!	Mem[0000000020800000] = 42ad7920, %l2 = ffffffffffffffaf
	lduh	[%o1+%g0],%l2		! %l2 = 00000000000042ad
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = bcf6032a, %l5 = 0000000065274f6d
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 000000bc000000ff

p0_label_12:
!	Mem[0000000010101410] = 84654c8b, %l7 = 00000000ffe6e165
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 00000084000000ff
!	%l3 = 0000000000000000, Mem[0000000010181400] = aa9ef186
	stwa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Mem[0000000010001400] = 2a03f6ff, %l6 = 000000000000c8d9
	swapa	[%i0+%g0]0x88,%l6	! %l6 = 000000002a03f6ff
!	%f26 = 5bec8646 65e1e60b, %l1 = ffffffffffe6e165
!	Mem[0000000030101410] = d9dc945b01ff9793
	add	%i4,0x010,%g1
	stda	%f26,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030101410] = 0bdce15b0186ec93
!	Mem[00000000100c1410] = 67089a00, %l1 = ffffffffffe6e165
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 0000000067089a00
!	%l2 = 00000000000042ad, Mem[0000000010041400] = 3015dc85
	stwa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 000042ad
!	%l5 = 00000000000000bc, Mem[000000001004140f] = e42da704, %asi = 80
	stba	%l5,[%i1+0x00f]%asi	! Mem[000000001004140c] = e42da7bc
!	%f30 = 7184b745 f8671507, %l0 = 6f371fa3f84c8e0a
!	Mem[0000000030081438] = e64e3c9a1ecf8afc
	add	%i2,0x038,%g1
	stda	%f30,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030081438] = e6153cf81ecf8afc
!	%l7 = 0000000000000084, Mem[0000000010001408] = 5ffda2c4
	stwa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000084
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = e45ba2c8 c6930000, %l4 = 0000005f, %l5 = 000000bc
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 00000000c6930000 00000000e45ba2c8

p0_label_13:
!	Mem[0000000010001400] = 0000c8d9, %l4 = 00000000c6930000
	ldswa	[%i0+%g0]0x88,%l4	! %l4 = 000000000000c8d9
!	Mem[0000000010041428] = e9ef4673, %l6 = 000000002a03f6ff
	lduw	[%i1+0x028],%l6		! %l6 = 00000000e9ef4673
!	Mem[0000000010101408] = 27acc074, %f13 = 91ff89e4
	lda	[%i4+0x008]%asi,%f13	! %f13 = 27acc074
!	Mem[0000000010141410] = 0a8e4cf8, %l0 = 6f371fa3f84c8e0a
	lduha	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000a8e
!	Mem[0000000010041400] = 000042ad, %l0 = 0000000000000a8e
	lduha	[%i1+%g0]0x88,%l0	! %l0 = 00000000000042ad
!	Mem[0000000030041410] = cd31c970, %l7 = 0000000000000084
	ldswa	[%i1+%o5]0x81,%l7	! %l7 = ffffffffcd31c970
!	Mem[0000000021800100] = da77b18b, %l0 = 00000000000042ad
	lduba	[%o3+0x101]%asi,%l0	! %l0 = 0000000000000077
!	Mem[0000000010101410] = ff654c8b9c076982, %f22 = 3021dadc 24bfc0f3
	ldd	[%i4+%o5],%f22		! %f22 = ff654c8b 9c076982
!	Mem[0000000010101400] = 3ec18cc3, %l1 = 0000000067089a00
	lduha	[%i4+%g0]0x88,%l1	! %l1 = 0000000000008cc3
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 0e8b1de3, %l0 = 0000000000000077
	swapa	[%i5+%o5]0x81,%l0	! %l0 = 000000000e8b1de3

p0_label_14:
!	%l6 = 00000000e9ef4673, Mem[00000000300c1400] = cdff195e275c3e78
	stxa	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000e9ef4673
!	Mem[0000000010041434] = 49ae6a9b, %l2 = 00000000000042ad
	swap	[%i1+0x034],%l2		! %l2 = 0000000049ae6a9b
!	%l0 = 000000000e8b1de3, Mem[0000000010041408] = 2a03f6bc
	stba	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 2a03f6e3
!	%f0  = 00005685 00000072 00005685 00000072
!	%f4  = cd31c970 7506eaa6 91ff4bac 3918c9fc
!	%f8  = 73d87561 8b959f9f 0a8e4cf8 593e6b7f
!	%f12 = 1b0e6cf8 27acc074 35a848b3 6df6ad86
	stda	%f0,[%i3]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	%l3 = 0000000000000000, Mem[0000000010101408] = 27acc074
	stha	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000c074
!	Mem[0000000021800181] = 5050a73c, %l5 = 00000000e45ba2c8
	ldstub	[%o3+0x181],%l5		! %l5 = 00000050000000ff
!	%l0 = 0e8b1de3, %l1 = 00008cc3, Mem[0000000030001408] = 0000d1b1 e524bf98
	stda	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 0e8b1de3 00008cc3
	membar	#Sync			! Added by membar checker (3)
!	Mem[00000000100c1410] = 7506eaa6, %l0 = 000000000e8b1de3
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 000000007506eaa6
!	%f2  = 00005685 00000072, %l4 = 000000000000c8d9
!	Mem[0000000030141428] = 3e5f089bb7628ffb
	add	%i5,0x028,%g1
	stda	%f2,[%g1+%l4]ASI_PST16_S ! Mem[0000000030141428] = 0000089bb7620072
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff654c8b, %l2 = 0000000049ae6a9b
	ldsba	[%i4+%o5]0x80,%l2	! %l2 = ffffffffffffffff

p0_label_15:
!	Mem[00000000100c1408] = 72000000 85560000, %l4 = 0000c8d9, %l5 = 00000050
	ldd	[%i3+%o4],%l4		! %l4 = 0000000072000000 0000000085560000
!	Mem[0000000030041408] = 77af5685, %l7 = ffffffffcd31c970
	ldsba	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000077
!	Mem[0000000010101410] = ff654c8b, %l6 = 00000000e9ef4673
	lduha	[%i4+%o5]0x80,%l6	! %l6 = 000000000000ff65
!	Mem[0000000010101400] = c38cc13e, %l0 = 000000007506eaa6
	ldsba	[%i4+%g0]0x80,%l0	! %l0 = ffffffffffffffc3
!	Mem[0000000030041400] = 7200000085560000, %l0 = ffffffffffffffc3
	ldxa	[%i1+%g0]0x89,%l0	! %l0 = 7200000085560000
!	Mem[0000000030001410] = 7ca5bd15, %l0 = 7200000085560000
	ldsha	[%i0+%o5]0x81,%l0	! %l0 = 0000000000007ca5
!	Mem[0000000010141400] = b1d10000, %l0 = 0000000000007ca5
	ldsba	[%i5+%g0]0x80,%l0	! %l0 = ffffffffffffffb1
!	Mem[0000000010181400] = 00000000, %l5 = 0000000085560000
	ldswa	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 000093c6, %l7 = 0000000000000077
	ldswa	[%i6+%o5]0x81,%l7	! %l7 = 00000000000093c6
!	Starting 10 instruction Store Burst
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000030181400] = e5be92ba 72102068
	stda	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff 00000000

p0_label_16:
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010001400] = 0000c8d9 d6b347c2
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffff 00000000
!	%l5 = 0000000000000000, Mem[0000000010181410] = aa9ef186c64fa1d9
	stxa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000
!	Mem[0000000030081410] = eb7fcaed, %l2 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 000000eb000000ff
!	Mem[0000000010141438] = ba86da64, %l3 = 0000000000000000, %asi = 80
	swapa	[%i5+0x038]%asi,%l3	! %l3 = 00000000ba86da64
!	%l2 = 000000eb, %l3 = ba86da64, Mem[0000000030041400] = 00005685 00000072
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000eb ba86da64
!	%f0  = 00005685 00000072, Mem[0000000010001408] = 00000084 02d34e51
	stda	%f0 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 00005685 00000072
!	%f20 = 99212682 652f148d, %l4 = 0000000072000000
!	Mem[0000000010141420] = eeb260e944bfd777
	add	%i5,0x020,%g1
	stda	%f20,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010141420] = eeb260e944bfd777
!	%l6 = 0000ff65, %l7 = 000093c6, Mem[0000000030181410] = c6930000 e45ba2c8
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ff65 000093c6
!	Mem[0000000010001410] = ac18890f, %l2 = 00000000000000eb
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 00000000ac18890f
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = af51e4ca, %l6 = 000000000000ff65
	lduba	[%i3+%o5]0x81,%l6	! %l6 = 00000000000000af

p0_label_17:
!	Mem[0000000010001408] = 7200000085560000, %l5 = 0000000000000000
	ldxa	[%i0+%o4]0x88,%l5	! %l5 = 7200000085560000
!	Mem[0000000010001400] = ffffffff, %l5 = 7200000085560000
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000021800140] = 56535fa3, %l4 = 0000000072000000
	lduba	[%o3+0x140]%asi,%l4	! %l4 = 0000000000000056
!	Mem[0000000030041400] = 000000eb, %l2 = 00000000ac18890f
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = e3f6032a, %l4 = 0000000000000056
	lduwa	[%i1+%o4]0x80,%l4	! %l4 = 00000000e3f6032a
!	Mem[0000000030081400] = 6ac8e0fe9d193cd3, %l3 = 00000000ba86da64
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = 6ac8e0fe9d193cd3
!	Mem[00000000100c1410] = e31d8b0e, %l1 = 0000000000008cc3
	lduha	[%i3+%o5]0x80,%l1	! %l1 = 000000000000e31d
!	Mem[00000000211c0000] = 4aff3616, %l1 = 000000000000e31d
	ldsb	[%o2+%g0],%l1		! %l1 = 000000000000004a
!	Mem[00000000300c1410] = cae451af, %l7 = 00000000000093c6
	lduha	[%i3+%o5]0x89,%l7	! %l7 = 00000000000051af
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = ffffffff, %l7 = 00000000000051af
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 000000ff000000ff

p0_label_18:
!	%l3 = 6ac8e0fe9d193cd3, Mem[0000000030181400] = ffffffff
	stha	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = ffff3cd3
!	%f2  = 00005685 00000072, %l2 = 0000000000000000
!	Mem[00000000300c1430] = 105d34934c6c6932
	add	%i3,0x030,%g1
	stda	%f2,[%g1+%l2]ASI_PST8_SL ! Mem[00000000300c1430] = 105d34934c6c6932
!	%l1 = 000000000000004a, Mem[00000000100c1408] = 0000568500000072
	stxa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000000000004a
!	%l1 = 000000000000004a, Mem[00000000300c1408] = d9280240
	stwa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000004a
!	%l5 = 00000000000000ff, Mem[0000000010001404] = 00000000
	sth	%l5,[%i0+0x004]		! Mem[0000000010001404] = 00ff0000
!	%f0  = 00005685 00000072, Mem[00000000300c1400] = 00000000 e9ef4673
	stda	%f0 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00005685 00000072
!	%l4 = 00000000e3f6032a, Mem[00000000100c1400] = 7200000085560000
	stxa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000e3f6032a
!	%l6 = 000000af, %l7 = 000000ff, Mem[0000000030181400] = d33cffff 00000000
	stda	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000af 000000ff
!	%f18 = 6aa433c0 404c134c, Mem[00000000300c1408] = 4a000000 c3a94d44
	stda	%f18,[%i3+%o4]0x81	! Mem[00000000300c1408] = 6aa433c0 404c134c
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff000000af000000, %l0 = ffffffffffffffb1
	ldxa	[%i6+%g0]0x89,%l0	! %l0 = ff000000af000000

p0_label_19:
!	Mem[00000000300c1408] = 6aa433c0404c134c, %f18 = 6aa433c0 404c134c
	ldda	[%i3+%o4]0x81,%f18	! %f18 = 6aa433c0 404c134c
!	Mem[0000000010181420] = 63c30925 47e764a1, %l4 = e3f6032a, %l5 = 000000ff
	ldda	[%i6+0x020]%asi,%l4	! %l4 = 0000000063c30925 0000000047e764a1
!	Mem[0000000010101408] = 0000c074, %l1 = 000000000000004a
	lduwa	[%i4+0x008]%asi,%l1	! %l1 = 000000000000c074
!	Mem[00000000100c1400] = 00000000, %l6 = 00000000000000af
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 0e8b1de3, %l0 = ff000000af000000
	lduba	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000e3
!	Mem[0000000010141408] = 00000000, %l3 = 6ac8e0fe9d193cd3
	lduha	[%i5+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 0000c074161728c3, %l2 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = 0000c074161728c3
!	Mem[0000000030081408] = 47aa4ea5, %l2 = 0000c074161728c3
	lduwa	[%i2+%o4]0x81,%l2	! %l2 = 0000000047aa4ea5
!	Mem[00000000300c1408] = 6aa433c0, %l1 = 000000000000c074
	lduha	[%i3+%o4]0x81,%l1	! %l1 = 0000000000006aa4
!	Starting 10 instruction Store Burst
!	%l2 = 0000000047aa4ea5, Mem[0000000010041412] = ffe6e165
	sth	%l2,[%i1+0x012]		! Mem[0000000010041410] = ffe64ea5

p0_label_20:
!	%f0  = 00005685 00000072, Mem[0000000010041400] = ad420000 c9c55ac9
	stda	%f0 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 00005685 00000072
!	%f27 = 65e1e60b, Mem[0000000030181408] = b7fad1b1
	sta	%f27,[%i6+%o4]0x89	! Mem[0000000030181408] = 65e1e60b
!	%l5 = 0000000047e764a1, Mem[0000000010101410] = 8269079c8b4c65ff
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000047e764a1
!	%l3 = 0000000000000000, Mem[0000000030081400] = fee0c86a
	stwa	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%l1 = 0000000000006aa4, Mem[0000000010101408] = 74c00000
	stha	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 74c06aa4
!	%l5 = 0000000047e764a1, Mem[0000000010181410] = 00000000
	stba	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000a1
!	Mem[0000000010101410] = 47e764a1, %l0 = 00000000000000e3
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 000000a1000000ff
!	%f28 = b2251e38 290b9ca2, %l2 = 0000000047aa4ea5
!	Mem[0000000030141420] = 9577d1b2275c3de2
	add	%i5,0x020,%g1
	stda	%f28,[%g1+%l2]ASI_PST32_S ! Mem[0000000030141420] = 9577d1b2290b9ca2
!	Mem[0000000010041400] = 00005685, %l6 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 0000000000005685
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0000d1b1, %l2 = 0000000047aa4ea5
	lduba	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000b1

p0_label_21:
!	Mem[0000000010081400] = 0000000b, %l0 = 00000000000000a1
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = e3ec3dff, %l3 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101400] = d52f56a9, %f25 = 275c3e78
	lda	[%i4+%g0]0x81,%f25	! %f25 = d52f56a9
!	Mem[0000000010101438] = 35ab3bd1, %l3 = ffffffffffffffff
	lduw	[%i4+0x038],%l3		! %l3 = 0000000035ab3bd1
!	Mem[000000001004142c] = 4d529356, %l7 = 00000000000000ff
	ldsw	[%i1+0x02c],%l7		! %l7 = 000000004d529356
!	Mem[0000000030141408] = 6d4f2765, %l3 = 0000000035ab3bd1
	ldsha	[%i5+%o4]0x89,%l3	! %l3 = 0000000000002765
!	Mem[0000000030181408] = 65e1e60b, %l1 = 0000000000006aa4
	ldsba	[%i6+%o4]0x89,%l1	! %l1 = 000000000000000b
!	Mem[0000000030081410] = 8fed6b77edca7fff, %f14 = 35a848b3 6df6ad86
	ldda	[%i2+%o5]0x89,%f14	! %f14 = 8fed6b77 edca7fff
!	Mem[00000000100c1400] = 00000000, %l7 = 000000004d529356
	lduba	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1416] = 70c931cd, %l4 = 0000000063c30925
	ldstub	[%i3+0x016],%l4		! %l4 = 00000031000000ff

p0_label_22:
!	Mem[00000000300c1400] = 00005685, %l5 = 0000000047e764a1
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l4 = 0000000000000031, Mem[000000001010140b] = a46ac074, %asi = 80
	stba	%l4,[%i4+0x00b]%asi	! Mem[0000000010101408] = a46ac031
!	%l1 = 000000000000000b, Mem[0000000010001400] = ffffffff
	stwa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000b
!	%l4 = 00000031, %l5 = 00000000, Mem[0000000030181410] = 65ff0000 c6930000
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000031 00000000
!	Mem[0000000030001408] = e31d8b0e, %l1 = 000000000000000b
	swapa	[%i0+%o4]0x89,%l1	! %l1 = 00000000e31d8b0e
!	%f22 = ff654c8b 9c076982, %l3 = 0000000000002765
!	Mem[0000000030001408] = 0b00000000008cc3
	add	%i0,0x008,%g1
	stda	%f22,[%g1+%l3]ASI_PST16_S ! Mem[0000000030001408] = 0b004c8b00006982
!	%l3 = 0000000000002765, Mem[0000000010181408] = e3ec3dff
	stwa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 00002765
!	%f4  = cd31c970 7506eaa6, Mem[0000000030101400] = a9562fd5 a6a1aed1
	stda	%f4 ,[%i4+%g0]0x89	! Mem[0000000030101400] = cd31c970 7506eaa6
!	%l5 = 0000000000000000, Mem[0000000010141401] = b1d10000, %asi = 80
	stba	%l5,[%i5+0x001]%asi	! Mem[0000000010141400] = b1000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101404] = 2a03f6bc, %l0 = 0000000000000000
	ldsb	[%i4+0x004],%l0		! %l0 = 000000000000002a

p0_label_23:
!	Mem[0000000010181410] = 00000000000000a1, %l3 = 0000000000002765
	ldxa	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000a1
!	Mem[0000000030001410] = 7ca5bd156ec4a143, %l0 = 000000000000002a
	ldxa	[%i0+%o5]0x81,%l0	! %l0 = 7ca5bd156ec4a143
!	Mem[00000000100c1410] = e31d8b0e, %l3 = 00000000000000a1
	ldsba	[%i3+%o5]0x80,%l3	! %l3 = ffffffffffffffe3
!	Mem[0000000030041410] = 70c931cd, %l6 = 0000000000005685
	lduba	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000cd
!	Mem[0000000030041410] = 70c931cd, %f17 = 59eee89c
	lda	[%i1+%o5]0x89,%f17	! %f17 = 70c931cd
!	Mem[0000000010001410] = bb1bb6ac000000eb, %l1 = 00000000e31d8b0e
	ldxa	[%i0+%o5]0x88,%l1	! %l1 = bb1bb6ac000000eb
!	Mem[0000000030041408] = 8556af77, %l7 = 0000000000000000
	lduwa	[%i1+%o4]0x89,%l7	! %l7 = 000000008556af77
!	Mem[0000000010101418] = ff0440643483ff92, %f2  = 00005685 00000072
	ldd	[%i4+0x018],%f2 	! %f2  = ff044064 3483ff92
!	Mem[0000000010181410] = a1000000, %l1 = bb1bb6ac000000eb
	lduha	[%i6+%o5]0x80,%l1	! %l1 = 000000000000a100
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00000000, %l2 = 00000000000000b1
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000

p0_label_24:
!	%f26 = 5bec8646 65e1e60b, Mem[0000000010101400] = 3ec18cc3 bcf6032a
	stda	%f26,[%i4+%g0]0x88	! Mem[0000000010101400] = 5bec8646 65e1e60b
!	Mem[0000000030081408] = 47aa4ea5, %l0 = 7ca5bd156ec4a143
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 00000047000000ff
!	Mem[0000000010081410] = 77afe1d5, %l3 = ffffffffffffffe3
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 00000077000000ff
!	%l0 = 00000047, %l1 = 0000a100, Mem[0000000010101430] = 538b941c ee7bc91a
	stda	%l0,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000047 0000a100
!	%l5 = 0000000000000000, Mem[0000000010101410] = 0000000047e764ff
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	Mem[0000000030081410] = ff7fcaed, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030101400] = 7506eaa6, %l4 = 0000000000000031
	swapa	[%i4+%g0]0x89,%l4	! %l4 = 000000007506eaa6
!	Mem[0000000010181400] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1428] = 7f6b3e59f84c8e0a, %l6 = 00000000000000cd, %l0 = 0000000000000047
	add	%i3,0x28,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = 7f6b3e59f84c8e0a
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 7ca5bd15, %l4 = 000000007506eaa6
	ldswa	[%i0+%o5]0x81,%l4	! %l4 = 000000007ca5bd15

p0_label_25:
!	%l7 = 000000008556af77, Mem[0000000030001408] = 0b004c8b
	stwa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 8556af77
!	Mem[0000000010181410] = 000000a1, %l6 = 00000000000000cd
	ldswa	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000a1
!	Mem[0000000010141408] = b1000000, %l1 = 000000000000a100
	ldswa	[%i5+%o4]0x80,%l1	! %l1 = ffffffffb1000000
!	Mem[0000000030001400] = fe6cd1f2b3215666, %f26 = 5bec8646 65e1e60b
	ldda	[%i0+%g0]0x81,%f26	! %f26 = fe6cd1f2 b3215666
!	Mem[0000000010001408] = 85560000, %l7 = 000000008556af77
	lduba	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = fe6cd1f2, %l3 = 0000000000000077
	ldswa	[%i0+%g0]0x81,%l3	! %l3 = fffffffffe6cd1f2
!	Mem[0000000030141400] = c8d97c8f, %l0 = 7f6b3e59f84c8e0a
	lduba	[%i5+%g0]0x81,%l0	! %l0 = 00000000000000c8
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030001400] = fe6cd1f2 b3215666 8556af77 00006982
!	Mem[0000000030001410] = 7ca5bd15 6ec4a143 0ef5f9f1 22ce5506
!	Mem[0000000030001420] = 4736f953 73ed1447 23205f4d 33611345
!	Mem[0000000030001430] = 01c4f8b8 25f9566d 08c193c0 04aaf5fe
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Starting 10 instruction Store Burst
!	%f2  = ff044064 3483ff92, Mem[0000000010081400] = 0b000000 00000000
	stda	%f2 ,[%i2+%g0]0x88	! Mem[0000000010081400] = ff044064 3483ff92

p0_label_26:
!	Mem[00000000300c1400] = ff005685, %l6 = 00000000000000a1
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 00000000ff005685
!	%l2 = 0000000000000000, Mem[0000000010101410] = 0000000000000000
	stxa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	%f2  = ff044064, Mem[0000000010181408] = 65270000
	sta	%f2 ,[%i6+%o4]0x80	! Mem[0000000010181408] = ff044064
!	Mem[00000000300c1410] = cae451af, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 000000af000000ff
!	%f4  = cd31c970, Mem[0000000010141408] = b1000000
	sta	%f4 ,[%i5+%o4]0x80	! Mem[0000000010141408] = cd31c970
!	%l4 = 7ca5bd15, %l5 = 00000000, Mem[0000000010141400] = 000000b1 77afe1d5
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 7ca5bd15 00000000
!	%f8  = 73d87561 8b959f9f, Mem[0000000030081400] = 00000000 9d193cd3
	stda	%f8 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 73d87561 8b959f9f
!	%f8  = 73d87561 8b959f9f, %l6 = 00000000ff005685
!	Mem[0000000030141430] = fbd3046a896b78f6
	add	%i5,0x030,%g1
	stda	%f8,[%g1+%l6]ASI_PST16_S ! Mem[0000000030141430] = fbd37561896b9f9f
!	%f14 = 8fed6b77 edca7fff, Mem[0000000010041428] = e9ef4673 4d529356
	stda	%f14,[%i1+0x028]%asi	! Mem[0000000010041428] = 8fed6b77 edca7fff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 70c931cd, %l6 = 00000000ff005685
	ldsha	[%i5+%o4]0x88,%l6	! %l6 = 00000000000031cd

p0_label_27:
!	Mem[0000000030141410] = 00000077, %f15 = edca7fff
	lda	[%i5+%o5]0x81,%f15	! %f15 = 00000077
!	Mem[0000000030081410] = ff7fcaed776bed8f, %l4 = 000000007ca5bd15
	ldxa	[%i2+%o5]0x81,%l4	! %l4 = ff7fcaed776bed8f
!	Mem[0000000010141410] = 0a8e4cf8, %l3 = fffffffffe6cd1f2
	ldsha	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000a8e
!	Mem[0000000030081408] = 12e3e29a a54eaaff, %l2 = 00000000, %l3 = 00000a8e
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000a54eaaff 0000000012e3e29a
!	Mem[0000000010101400] = 65e1e60b, %l6 = 00000000000031cd
	ldswa	[%i4+%g0]0x88,%l6	! %l6 = 0000000065e1e60b
!	Mem[000000001014140c] = 7273d84c, %l0 = 00000000000000c8
	ldsba	[%i5+0x00d]%asi,%l0	! %l0 = 0000000000000073
!	%l1 = ffffffffb1000000, Mem[0000000010041410] = a54ee6ff
	stha	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = a54e0000
!	Mem[0000000010141400] = 00000000 7ca5bd15, %l4 = 776bed8f, %l5 = 00000000
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 000000007ca5bd15 0000000000000000
!	Mem[0000000010141410] = 0a8e4cf8 a31f376f, %l2 = a54eaaff, %l3 = 12e3e29a
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 000000000a8e4cf8 00000000a31f376f
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 85560000, %l2 = 000000000a8e4cf8
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 0000000085560000

p0_label_28:
!	Mem[0000000030101400] = 00000031, %l0 = 0000000000000073
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000031
!	Mem[0000000030101410] = 0bdce15b, %l1 = ffffffffb1000000
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 000000000bdce15b
!	Mem[00000000218001c1] = e2274442, %l0 = 0000000000000031
	ldstub	[%o3+0x1c1],%l0		! %l0 = 00000027000000ff
!	%l6 = 0000000065e1e60b, Mem[0000000010041410] = a54e0000
	stwa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 65e1e60b
!	%l6 = 0000000065e1e60b, Mem[00000000201c0000] = 5685e51a
	stb	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 0b85e51a
!	Mem[0000000010141408] = 70c931cd, %l3 = 00000000a31f376f
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 000000cd000000ff
!	%l2 = 85560000, %l3 = 000000cd, Mem[0000000010181408] = ff044064 4ea85da0
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 85560000 000000cd
!	%l4 = 000000007ca5bd15, Mem[0000000010041430] = 10a9ea56000042ad, %asi = 80
	stxa	%l4,[%i1+0x030]%asi	! Mem[0000000010041430] = 000000007ca5bd15
!	%l2 = 85560000, %l3 = 000000cd, Mem[0000000030081408] = a54eaaff 12e3e29a
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 85560000 000000cd
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = a1000000, %l6 = 0000000065e1e60b
	lduha	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000

p0_label_29:
!	Mem[0000000010101408] = a46ac031 161728c3, %l0 = 00000027, %l1 = 0bdce15b
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 00000000a46ac031 00000000161728c3
!	Mem[00000000300c1408] = 6aa433c0404c134c, %f4  = cd31c970 7506eaa6
	ldda	[%i3+%o4]0x81,%f4 	! %f4  = 6aa433c0 404c134c
!	Mem[0000000010181400] = 000000ff, %l1 = 00000000161728c3
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010041400] = 00000000 00000072 e3f6032a e42da7bc
!	Mem[0000000010041410] = 0be6e165 4686ec5b 67089abd 7caf6829
!	Mem[0000000010041420] = 98db05a2 de11bf9b 8fed6b77 edca7fff
!	Mem[0000000010041430] = 00000000 7ca5bd15 6e22557f 8f7cd9c8
	ldda	[%i1]ASI_BLK_AIUP,%f0	! Block Load from 0000000010041400
!	Mem[0000000010141400] = 15bda57c00000000, %l0 = 00000000a46ac031
	ldx	[%i5+%g0],%l0		! %l0 = 15bda57c00000000
!	Mem[0000000030081408] = 00005685, %l4 = 000000007ca5bd15
	ldswa	[%i2+%o4]0x81,%l4	! %l4 = 0000000000005685
!	Mem[0000000020800040] = d1b112f0, %l7 = 00000000000000af
	ldsb	[%o1+0x041],%l7		! %l7 = ffffffffffffffb1
!	Mem[0000000030101410] = b10000000186ec93, %l7 = ffffffffffffffb1
	ldxa	[%i4+%o5]0x81,%l7	! %l7 = b10000000186ec93
!	Mem[0000000010101400] = 0be6e165, %l6 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l6	! %l6 = 000000000000000b
!	Starting 10 instruction Store Burst
!	%l6 = 0000000b, %l7 = 0186ec93, Mem[00000000100c1418] = fcc91839 ac4bff91
	std	%l6,[%i3+0x018]		! Mem[00000000100c1418] = 0000000b 0186ec93

p0_label_30:
!	%l6 = 000000000000000b, Mem[000000001010140a] = a46ac031
	sth	%l6,[%i4+0x00a]		! Mem[0000000010101408] = a46a000b
!	Mem[0000000030181400] = 000000af, %l1 = 00000000000000ff
	swapa	[%i6+%g0]0x81,%l1	! %l1 = 00000000000000af
!	%l3 = 00000000000000cd, Mem[0000000030181408] = 65e1e60b
	stha	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 65e100cd
!	Mem[0000000030041410] = 70c931cd, %l1 = 00000000000000af
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 0000000070c931cd
!	Mem[0000000010041400] = 00000000, %l1 = 0000000070c931cd
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001410] = 000000eb, %l6 = 000000000000000b
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 000000eb000000ff
!	Mem[0000000030141408] = 6d4f2765, %l4 = 0000000000005685
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 000000006d4f2765
!	Mem[00000000100c1410] = e31d8b0e, %l3 = 00000000000000cd
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 000000e3000000ff
!	%l7 = b10000000186ec93, Mem[0000000030141408] = 00005685
	stwa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 0186ec93
!	Starting 10 instruction Load Burst
!	%l6 = 000000eb, %l7 = 0186ec93, Mem[0000000030141400] = c8d97c8f b1d10000
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000eb 0186ec93

p0_label_31:
!	Mem[00000000300c1400] = 000000a1, %l4 = 000000006d4f2765
	ldsha	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = ff000000ff000000, %l7 = b10000000186ec93
	ldxa	[%i6+%g0]0x89,%l7	! %l7 = ff000000ff000000
!	Mem[0000000030181410] = 00000031, %l0 = 15bda57c00000000
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1434] = f86c0e1b, %l7 = ff000000ff000000
	ldsha	[%i3+0x036]%asi,%l7	! %l7 = 0000000000000e1b
!	Mem[0000000030181408] = cd00e165 ec6db82e, %l6 = 000000eb, %l7 = 00000e1b
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 00000000cd00e165 00000000ec6db82e
!	Mem[0000000020800040] = d1b112f0, %l2 = 0000000085560000
	lduba	[%o1+0x040]%asi,%l2	! %l2 = 00000000000000d1
!	Mem[0000000030081408] = 00005685cd000000, %f24 = 4736f953 73ed1447
	ldda	[%i2+%o4]0x81,%f24	! %f24 = 00005685 cd000000
!	Mem[0000000030041408] = 8556af77, %l3 = 00000000000000e3
	lduha	[%i1+%o4]0x89,%l3	! %l3 = 000000000000af77
!	Mem[0000000010001410] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i0+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010181419] = 58c6b939
	stb	%l1,[%i6+0x019]		! Mem[0000000010181418] = 5800b939

p0_label_32:
!	Mem[0000000010081436] = 243125ad, %l7 = 00000000ec6db82e
	ldstub	[%i2+0x036],%l7		! %l7 = 00000025000000ff
!	Mem[0000000010081400] = 92ff8334, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 00000092000000ff
!	%l0 = 0000000000000000, Mem[00000000300c1410] = ff51e4ca
	stba	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0051e4ca
!	%l3 = 000000000000af77, Mem[00000000218001c0] = e2ff4442
	sth	%l3,[%o3+0x1c0]		! Mem[00000000218001c0] = af774442
!	%f24 = 00005685 cd000000, Mem[0000000010101410] = 00000000 00000000
	std	%f24,[%i4+%o5]	! Mem[0000000010101410] = 00005685 cd000000
!	%l7 = 0000000000000025, Mem[0000000030081408] = 85560000
	stba	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 85560025
!	Mem[0000000010181409] = 85560000, %l7 = 0000000000000025
	ldstuba	[%i6+0x009]%asi,%l7	! %l7 = 00000056000000ff
	membar	#Sync			! Added by membar checker (6)
!	%f22 = 0ef5f9f1 22ce5506, Mem[0000000010041410] = 65e1e60b 5bec8646
	stda	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = 0ef5f9f1 22ce5506
!	%l3 = 000000000000af77, Mem[00000000201c0000] = 0b85e51a
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = af77e51a
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 5fa7efb32bff4165, %l1 = 0000000000000092
	ldx	[%i2+0x020],%l1		! %l1 = 5fa7efb32bff4165

p0_label_33:
!	Mem[00000000100c1430] = 74c0ac27, %l5 = 00000000000000ff
	ldub	[%i3+0x032],%l5		! %l5 = 00000000000000ac
!	Mem[0000000030101408] = e102058f, %l5 = 00000000000000ac
	lduha	[%i4+%o4]0x81,%l5	! %l5 = 000000000000e102
!	Mem[000000001010141c] = 3483ff92, %l1 = 5fa7efb32bff4165
	lduw	[%i4+0x01c],%l1		! %l1 = 000000003483ff92
!	Mem[0000000030181410] = 31000000, %l3 = 000000000000af77
	lduba	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = 15bda57c, %l7 = 0000000000000056
	ldsw	[%i5+%g0],%l7		! %l7 = 0000000015bda57c
!	Mem[0000000030041408] = 77af568500000072, %f20 = 7ca5bd15 6ec4a143
	ldda	[%i1+%o4]0x81,%f20	! %f20 = 77af5685 00000072
!	Mem[0000000010081418] = 99d9f9b0 4a11aaaa, %l4 = 00000000, %l5 = 0000e102
	ldda	[%i2+0x018]%asi,%l4	! %l4 = 0000000099d9f9b0 000000004a11aaaa
!	Mem[0000000010181408] = 85ff0000, %l6 = 00000000cd00e165
	ldswa	[%i6+%o4]0x80,%l6	! %l6 = ffffffff85ff0000
!	Mem[00000000100c1410] = ff1d8b0e, %l5 = 000000004a11aaaa
	lduha	[%i3+%o5]0x80,%l5	! %l5 = 000000000000ff1d
!	Starting 10 instruction Store Burst
!	%f22 = 0ef5f9f1, Mem[0000000030101410] = b1000000
	sta	%f22,[%i4+%o5]0x81	! Mem[0000000030101410] = 0ef5f9f1

p0_label_34:
!	%l4 = 99d9f9b0, %l5 = 0000ff1d, Mem[0000000010181410] = a1000000 00000000
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 99d9f9b0 0000ff1d
!	%f30 = 08c193c0 04aaf5fe, Mem[0000000030141400] = eb000000 93ec8601
	stda	%f30,[%i5+%g0]0x89	! Mem[0000000030141400] = 08c193c0 04aaf5fe
!	%l6 = ffffffff85ff0000, Mem[0000000030101408] = e102058f
	stba	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 0002058f
!	Mem[00000000100c1400] = 00000000, %l5 = 000000000000ff1d
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141408] = ff31c970, %l1 = 000000003483ff92
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 00000000ff31c970
!	%f28 = 01c4f8b8 25f9566d, Mem[0000000030041408] = 77af5685 00000072
	stda	%f28,[%i1+%o4]0x81	! Mem[0000000030041408] = 01c4f8b8 25f9566d
!	Mem[0000000010101438] = 35ab3bd17c2e8980, %l6 = ffffffff85ff0000, %l6 = ffffffff85ff0000
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 35ab3bd17c2e8980
!	%f10 = 8fed6b77, Mem[0000000010081408] = 2a03f6bc
	sta	%f10,[%i2+%o4]0x88	! Mem[0000000010081408] = 8fed6b77
!	%l3 = 0000000000000000, Mem[0000000010101436] = 0000a100
	sth	%l3,[%i4+0x036]		! Mem[0000000010101434] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000ff, %l0 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff

p0_label_35:
!	Mem[0000000030001408] = 77af5685, %l3 = 0000000000000000
	ldsha	[%i0+%o4]0x89,%l3	! %l3 = 0000000000005685
!	Mem[0000000030081408] = 000000cd 85560025, %l4 = 99d9f9b0, %l5 = 00000000
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 0000000085560025 00000000000000cd
!	Mem[00000000100c1410] = ff1d8b0e, %f8  = 98db05a2
	lda	[%i3+%o5]0x80,%f8 	! %f8 = ff1d8b0e
!	Mem[0000000010041400] = ff00000000000072, %l5 = 00000000000000cd
	ldx	[%i1+%g0],%l5		! %l5 = ff00000000000072
!	Mem[0000000030001408] = 8556af7700006982, %f30 = 08c193c0 04aaf5fe
	ldda	[%i0+%o4]0x81,%f30	! %f30 = 8556af77 00006982
!	Mem[0000000030041408] = 6d56f925 b8f8c401, %l0 = 000000ff, %l1 = ff31c970
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 00000000b8f8c401 000000006d56f925
!	Mem[0000000010001400] = 0b000000, %l5 = ff00000000000072
	ldsha	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 00000000b8f8c401
	setx	0xdcb29387da2ed27a,%g7,%l0 ! %l0 = dcb29387da2ed27a
!	%l1 = 000000006d56f925
	setx	0x8c6436a84b2d557c,%g7,%l1 ! %l1 = 8c6436a84b2d557c
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = dcb29387da2ed27a
	setx	0x51377317b8e45294,%g7,%l0 ! %l0 = 51377317b8e45294
!	%l1 = 8c6436a84b2d557c
	setx	0xc3004e30485403d7,%g7,%l1 ! %l1 = c3004e30485403d7
!	Mem[0000000010001410] = 000000ff, %l5 = 0000000000000000
	ldsha	[%i0+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000015bda57c, Mem[0000000030181410] = 00000031
	stwa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 15bda57c

p0_label_36:
!	Mem[0000000010041410] = 22ce5506, %l6 = 35ab3bd17c2e8980
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 00000006000000ff
!	Mem[0000000030181400] = ff000000, %l0 = 51377317b8e45294
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 00000000ff000000
!	%l5 = 00000000000000ff, Mem[0000000030141410] = 00000077
	stwa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff
!	%l5 = 00000000000000ff, %l0 = 00000000ff000000, %l1 = c3004e30485403d7
	addc	%l5,%l0,%l1		! %l1 = 00000000ff0000ff
!	%f0  = 00000000 00000072 e3f6032a e42da7bc
!	%f4  = 0be6e165 4686ec5b 67089abd 7caf6829
!	%f8  = ff1d8b0e de11bf9b 8fed6b77 edca7fff
!	%f12 = 00000000 7ca5bd15 6e22557f 8f7cd9c8
	stda	%f0,[%i5]ASI_BLK_AIUS	! Block Store to 0000000030141400
!	%l4 = 0000000085560025, Mem[00000000211c0000] = 4aff3616
	stb	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 25ff3616
!	Mem[0000000030081410] = ff7fcaed, %l2 = 00000000000000d1
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff7fcaed
!	%l0 = 00000000ff000000, Mem[0000000010041400] = 000000ff
	stwa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000
!	%l2 = ff7fcaed, %l3 = 00005685, Mem[0000000030041408] = 01c4f8b8 25f9566d
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = ff7fcaed 00005685
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 000000eb, %l2 = 00000000ff7fcaed
	lduha	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_37:
!	Mem[00000000201c0000] = af77e51a, %l2 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffaf77
!	Mem[0000000021800040] = a2f759f3, %l3 = 0000000000005685
	lduh	[%o3+0x040],%l3		! %l3 = 000000000000a2f7
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010141400] = 15bda57c, %l6 = 0000000000000006
	lduwa	[%i5+%g0]0x80,%l6	! %l6 = 0000000015bda57c
!	Mem[0000000010041408] = e3f6032a e42da7bc, %l4 = 85560025, %l5 = 000000ff
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 00000000e3f6032a 00000000e42da7bc
!	Mem[0000000030141410] = 0be6e165, %f2  = e3f6032a
	lda	[%i5+%o5]0x81,%f2 	! %f2 = 0be6e165
!	Mem[0000000030101408] = 8f050200, %l2 = ffffffffffffaf77
	lduwa	[%i4+%o4]0x89,%l2	! %l2 = 000000008f050200
!	Mem[0000000010101414] = cd000000, %l3 = 000000000000a2f7
	lduw	[%i4+0x014],%l3		! %l3 = 00000000cd000000
!	Mem[0000000030141400] = 00000000, %l0 = 00000000ff000000
	lduha	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = 0000004a, %l7 = 0000000015bda57c
	lduha	[%i3+%o4]0x88,%l7	! %l7 = 000000000000004a
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000004a, Mem[0000000010141400] = 000000007ca5bd15
	stxa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000000000004a

p0_label_38:
!	%l0 = 0000000000000000, Mem[0000000010041410] = 0ef5f9f122ce55ff
	stxa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000
!	Mem[0000000010081408] = 776bed8f, %l3 = 00000000cd000000
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 00000077000000ff
!	%f16 = fe6cd1f2 b3215666 8556af77 00006982
!	%f20 = 77af5685 00000072 0ef5f9f1 22ce5506
!	%f24 = 00005685 cd000000 23205f4d 33611345
!	%f28 = 01c4f8b8 25f9566d 8556af77 00006982
	stda	%f16,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	%l5 = 00000000e42da7bc, Mem[0000000030101400] = 73000000
	stba	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = bc000000
!	%l2 = 000000008f050200, Mem[0000000030141410] = 00000072
	stba	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%f0  = 00000000 00000072, Mem[0000000030101400] = bc000000 70c931cd
	stda	%f0 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 00000072
!	%l5 = 00000000e42da7bc, Mem[0000000010081400] = ffff8334
	stwa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = e42da7bc
!	%l7 = 000000000000004a, Mem[0000000030041408] = edca7fff
	stha	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = edca004a
!	%l2 = 8f050200, %l3 = 00000077, Mem[0000000030001400] = fe6cd1f2 b3215666
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 8f050200 00000077
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030001400] = 8f050200 00000077 8556af77 00006982
!	Mem[0000000030001410] = 7ca5bd15 6ec4a143 0ef5f9f1 22ce5506
!	Mem[0000000030001420] = 4736f953 73ed1447 23205f4d 33611345
!	Mem[0000000030001430] = 01c4f8b8 25f9566d 08c193c0 04aaf5fe
	ldda	[%i0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030001400

p0_label_39:
!	Mem[0000000030001408] = 8556af77, %l3 = 0000000000000077
	lduba	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000085
!	Mem[0000000010181410] = 99d9f9b00000ff1d, %l2 = 000000008f050200
	ldxa	[%i6+%o5]0x80,%l2	! %l2 = 99d9f9b00000ff1d
!	Mem[00000000300c1410] = cae45100, %l1 = 00000000ff0000ff
	lduwa	[%i3+%o5]0x89,%l1	! %l1 = 00000000cae45100
!	Mem[0000000030141400] = 665621b3, %l2 = 99d9f9b00000ff1d
	ldsha	[%i5+%g0]0x81,%l2	! %l2 = 0000000000006656
!	Mem[0000000030041410] = af000000, %l5 = 00000000e42da7bc
	lduwa	[%i1+%o5]0x81,%l5	! %l5 = 00000000af000000
!	Mem[0000000010081408] = ff6bed8f3ec18cc3, %l1 = 00000000cae45100
	ldxa	[%i2+0x008]%asi,%l1	! %l1 = ff6bed8f3ec18cc3
!	Mem[0000000030001400] = 8f050200, %l6 = 0000000015bda57c
	ldsba	[%i0+%g0]0x81,%l6	! %l6 = ffffffffffffff8f
!	Mem[00000000100c1400] = 000000ff, %l4 = 00000000e3f6032a
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1410] = 0e8b1dff, %l0 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000020800041] = d1b112f0
	stb	%l4,[%o1+0x041]		! Mem[0000000020800040] = d1ff12f0

p0_label_40:
!	%l2 = 0000000000006656, Mem[0000000010081408] = c38cc13e8fed6bff
	stxa	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000000000006656
!	%l4 = ffffffffffffffff, Mem[000000001000141e] = da6bde82, %asi = 80
	stha	%l4,[%i0+0x01e]%asi	! Mem[000000001000141c] = da6bffff
!	%l6 = ffffffffffffff8f, Mem[0000000010141434] = ff5766bb
	stw	%l6,[%i5+0x034]		! Mem[0000000010141434] = ffffff8f
!	Mem[0000000010041410] = 0000000000000000, %l7 = 000000000000004a, %l7 = 000000000000004a
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = 0000000000000000
!	%l2 = 0000000000006656, Mem[0000000030041400] = 64da86baeb000000
	stxa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000006656
!	%l4 = ffffffffffffffff, Mem[0000000010181408] = 85ff0000000000cd
	stxa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffffffffffff
!	%f2  = 0be6e165 e42da7bc, Mem[0000000030101410] = f1f9f50e 93ec8601
	stda	%f2 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 0be6e165 e42da7bc
!	%l3 = 0000000000000085, Mem[0000000010041410] = 00000000
	stwa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000085
!	%f12 = 00000000 7ca5bd15, %l5 = 00000000af000000
!	Mem[0000000010101418] = ff0440643483ff92
	add	%i4,0x018,%g1
	stda	%f12,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010101418] = ff0440643483ff92
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 77af5685, %l1 = ff6bed8f3ec18cc3
	lduwa	[%i0+%o4]0x89,%l1	! %l1 = 0000000077af5685

p0_label_41:
!	Mem[0000000030141410] = 00000000, %l0 = ffffffffffffffff
	ldsha	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = ff000000c64fa1d9, %f6  = 67089abd 7caf6829
	ldda	[%i6+%g0]0x80,%f6 	! %f6  = ff000000 c64fa1d9
!	Mem[0000000030141408] = 8556af77 00006982, %l2 = 00006656, %l3 = 00000085
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 0000000000006982 000000008556af77
!	Mem[0000000010101410] = 00005685, %l0 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 3483ff92, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000003483
!	Mem[0000000010081410] = ffafe1d58f7cd9c8, %l7 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l7	! %l7 = ffafe1d58f7cd9c8
!	Mem[00000000300c1400] = 000000a1 00000072, %l6 = ffffff8f, %l7 = 8f7cd9c8
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000a1 0000000000000072
!	Mem[0000000030141408] = 82690000, %l7 = 0000000000000072
	lduha	[%i5+%o4]0x81,%l7	! %l7 = 0000000000008269
!	Mem[0000000030041408] = 85560000edca004a, %l2 = 0000000000006982
	ldxa	[%i1+%o4]0x89,%l2	! %l2 = 85560000edca004a
!	Starting 10 instruction Store Burst
!	Mem[0000000010141418] = a044d64e, %l4 = ffffffffffffffff, %asi = 80
	swapa	[%i5+0x018]%asi,%l4	! %l4 = 00000000a044d64e

p0_label_42:
!	%l2 = edca004a, %l3 = 8556af77, Mem[0000000010041418] = 67089abd 7caf6829
	std	%l2,[%i1+0x018]		! Mem[0000000010041418] = edca004a 8556af77
!	%l4 = a044d64e, %l5 = af000000, Mem[0000000030141400] = b3215666 fe6cd1f2
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = a044d64e af000000
!	Mem[0000000010141400] = 0000004a, %l5 = 00000000af000000
	swapa	[%i5+%g0]0x88,%l5	! %l5 = 000000000000004a
!	Mem[0000000020800000] = 42ad7920, %l2 = 85560000edca004a
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 00000042000000ff
!	%l5 = 000000000000004a, Mem[00000000300c1410] = cae45100
	stba	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = cae4514a
!	%l4 = 00000000a044d64e, Mem[0000000010181408] = ffffffff
	stba	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffff4e
!	Mem[0000000030101408] = 8f050200, %l6 = 00000000000000a1
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 000000008f050200
!	Mem[00000000300c1400] = 000000a1, %l4 = 00000000a044d64e
	ldstuba	[%i3+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l2 = 0000000000000042, Mem[0000000010141400] = af000000
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = af000042
!	Starting 10 instruction Load Burst
!	Mem[000000001014142c] = 33831619, %l2 = 0000000000000042
	ldsb	[%i5+0x02f],%l2		! %l2 = 0000000000000019

p0_label_43:
!	Mem[0000000030101400] = 0000000000000072, %f22 = 0ef5f9f1 22ce5506
	ldda	[%i4+%g0]0x81,%f22	! %f22 = 00000000 00000072
!	Mem[0000000010101410] = 00005685, %f16 = 8f050200
	lda	[%i4+%o5]0x80,%f16	! %f16 = 00005685
!	Mem[0000000030181408] = cd00e165, %l2 = 0000000000000019
	lduwa	[%i6+%o4]0x81,%l2	! %l2 = 00000000cd00e165
!	Mem[0000000010001400] = 0b000000, %f19 = 00006982
	lda	[%i0+%g0]0x88,%f19	! %f19 = 0b000000
!	Mem[00000000100c1408] = 0000004a, %l4 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l4	! %l4 = 000000000000004a
!	Mem[0000000010001408] = f84c8e0a, %l5 = 000000000000004a
	lduha	[%i0+%o4]0x80,%l5	! %l5 = 000000000000f84c
!	Mem[0000000030141408] = 82690000, %l4 = 000000000000004a
	lduha	[%i5+%o4]0x81,%l4	! %l4 = 0000000000008269
!	Mem[0000000010081400] = bca72de4, %l6 = 000000008f050200
	lduwa	[%i2+%g0]0x88,%l6	! %l6 = 00000000bca72de4
!	Mem[0000000010001408] = 0a8e4cf8, %l7 = 0000000000008269
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = fffffffffffffff8
!	Starting 10 instruction Store Burst
!	%l2 = 00000000cd00e165, Mem[0000000010001400] = 0000000b, %asi = 80
	stwa	%l2,[%i0+0x000]%asi	! Mem[0000000010001400] = cd00e165

p0_label_44:
!	Mem[00000000100c1410] = ff1d8b0e, %l0 = 0000000000003483
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff1d8b0e
!	Mem[00000000300c1410] = cae4514a, %l5 = 000000000000f84c
	ldsba	[%i3+%o5]0x89,%l5	! %l5 = 000000000000004a
!	%f14 = 6e22557f 8f7cd9c8, %l1 = 0000000077af5685
!	Mem[0000000030041438] = 35a848b36df6ad86
	add	%i1,0x038,%g1
	stda	%f14,[%g1+%l1]ASI_PST16_S ! Mem[0000000030041438] = 35a8557f6df6d9c8
!	Mem[0000000010141400] = af000042, %f18 = 8556af77
	lda	[%i5+%g0]0x88,%f18	! %f18 = af000042
!	%l3 = 000000008556af77, Mem[0000000010041430] = 000000007ca5bd15, %asi = 80
	stxa	%l3,[%i1+0x030]%asi	! Mem[0000000010041430] = 000000008556af77
!	%l6 = bca72de4, %l7 = fffffff8, Mem[00000000100c1410] = 00003483 70c9ffcd
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = bca72de4 fffffff8
!	Mem[00000000201c0001] = af77e51a, %l6 = 00000000bca72de4
	ldstub	[%o0+0x001],%l6		! %l6 = 00000077000000ff
!	Mem[0000000010041410] = 00000085, %l7 = fffffffffffffff8
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%f6  = ff000000 c64fa1d9, Mem[0000000030101410] = e42da7bc 0be6e165
	stda	%f6 ,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000 c64fa1d9
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 0a8e4cf8, %l5 = 000000000000004a
	ldub	[%i5+0x011],%l5		! %l5 = 000000000000008e

p0_label_45:
!	Mem[00000000100c1420] = 9f9f958b6175d873, %f22 = 00000000 00000072
	ldd	[%i3+0x020],%f22	! %f22 = 9f9f958b 6175d873
!	Mem[0000000030181400] = b8e45294, %l2 = 00000000cd00e165
	lduha	[%i6+%g0]0x89,%l2	! %l2 = 0000000000005294
!	Mem[00000000211c0000] = 25ff3616, %l2 = 0000000000005294
	ldsb	[%o2+%g0],%l2		! %l2 = 0000000000000025
!	Mem[000000001018141c] = 1c365040, %l6 = 0000000000000077
	lduha	[%i6+0x01c]%asi,%l6	! %l6 = 0000000000001c36
!	Mem[0000000010001408] = f84c8e0a, %l1 = 0000000077af5685
	ldswa	[%i0+%o4]0x80,%l1	! %l1 = fffffffff84c8e0a
!	Mem[000000001008143c] = f272b603, %f24 = 4736f953
	ld	[%i2+0x03c],%f24	! %f24 = f272b603
!	Mem[00000000211c0000] = 25ff3616, %l3 = 000000008556af77
	ldsb	[%o2+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030141408] = 8556af77 00006982, %l4 = 00008269, %l5 = 0000008e
	ldda	[%i5+%o4]0x89,%l4	! %l4 = 0000000000006982 000000008556af77
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000030101400] = 00000000 00000072 a1000000 10318948
!	Mem[0000000030101410] = d9a14fc6 000000ff 269f5250 edce7ea8
!	Mem[0000000030101420] = 973718fc 9735ac9a 8b5527da 549e2a30
!	Mem[0000000030101430] = 4124e2c4 b5751555 1ba8f2d6 69308b24
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Starting 10 instruction Store Burst
!	%f10 = 8fed6b77 edca7fff, %l7 = 0000000000000000
!	Mem[0000000010181430] = 94652c7335a29a77
	add	%i6,0x030,%g1
	stda	%f10,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010181430] = 94652c7335a29a77

p0_label_46:
!	Mem[000000001010141a] = ff044064, %l6 = 0000000000001c36
	ldstub	[%i4+0x01a],%l6		! %l6 = 00000040000000ff
	membar	#Sync			! Added by membar checker (10)
!	%f8  = ff1d8b0e de11bf9b, Mem[0000000030101408] = a1000000 10318948
	stda	%f8 ,[%i4+%o4]0x81	! Mem[0000000030101408] = ff1d8b0e de11bf9b
!	%l4 = 0000000000006982, Mem[0000000030081410] = 000000d1
	stwa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00006982
!	Mem[0000000030141408] = 82690000, %l0 = 00000000ff1d8b0e
	ldstuba	[%i5+%o4]0x81,%l0	! %l0 = 00000082000000ff
!	Mem[0000000030181410] = 7ca5bd15, %l6 = 0000000000000040
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 00000015000000ff
!	%l6 = 0000000000000015, Mem[0000000030181408] = 65e100cd
	stba	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 65e10015
!	Mem[0000000010001410] = 000000ff, %l5 = 000000008556af77
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000300c1400] = ff0000a1, %l6 = 0000000000000015
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 00000000ff0000a1
!	%f22 = 269f5250, Mem[0000000010101400] = 65e1e60b
	sta	%f22,[%i4+%g0]0x88	! Mem[0000000010101400] = 269f5250
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 269f5250, %l5 = 00000000000000ff
	ldswa	[%i4+%g0]0x88,%l5	! %l5 = 00000000269f5250

p0_label_47:
!	Mem[0000000010141400] = 420000af, %l1 = fffffffff84c8e0a
	ldsha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000004200
!	Mem[00000000211c0000] = 25ff3616, %l1 = 0000000000004200
	ldsba	[%o2+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101408] = 9bbf11de0e8b1dff, %f26 = 8b5527da 549e2a30
	ldda	[%i4+%o4]0x89,%f26	! %f26 = 9bbf11de 0e8b1dff
!	Mem[0000000010081400] = ff044064 bca72de4, %l0 = 00000082, %l1 = ffffffff
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 00000000bca72de4 00000000ff044064
!	Mem[00000000100c1410] = e42da7bc, %l2 = 0000000000000025
	ldswa	[%i3+%o5]0x88,%l2	! %l2 = ffffffffe42da7bc
!	Mem[0000000010041410] = ff000085, %l5 = 00000000269f5250
	ldsba	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181410] = ffbda57c, %l4 = 0000000000006982
	lduba	[%i6+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = 6175d873, %l7 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000073
!	Mem[00000000201c0000] = afffe51a, %l1 = 00000000ff044064
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffaf
!	Starting 10 instruction Store Burst
!	%f2  = 0be6e165 e42da7bc, %l3 = ffffffffffffffff
!	Mem[0000000030141420] = 000000cd85560000
	add	%i5,0x020,%g1
	stda	%f2,[%g1+%l3]ASI_PST32_S ! Mem[0000000030141420] = 0be6e165e42da7bc

p0_label_48:
!	Mem[0000000030101410] = c64fa1d9, %l5 = ffffffffffffffff
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 00000000c64fa1d9
!	%f24 = 973718fc 9735ac9a, %l3 = ffffffffffffffff
!	Mem[0000000030081438] = e6153cf81ecf8afc
	add	%i2,0x038,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_S ! Mem[0000000030081438] = 973718fc9735ac9a
!	Mem[0000000010041438] = 6e22557f8f7cd9c8, %l7 = 0000000000000073, %l3 = ffffffffffffffff
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l7,%l3	! %l3 = 6e22557f8f7cd9c8
!	Mem[0000000020800000] = ffad7920, %l4 = 00000000000000ff
	ldstub	[%o1+%g0],%l4		! %l4 = 000000ff000000ff
!	Mem[0000000010181400] = 000000ff, %l0 = 00000000bca72de4
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%f24 = 973718fc 9735ac9a, %f1  = 00000072
	fxtos	%f24,%f1 		! %f1  = ded191ce
!	Mem[0000000010181410] = b0f9d999, %l4 = 00000000000000ff
	swapa	[%i6+%o5]0x88,%l4	! %l4 = 00000000b0f9d999
!	Mem[0000000010001418] = ccccd747da6bffff, %f2  = 0be6e165 e42da7bc
	ldd	[%i0+0x018],%f2 	! %f2  = ccccd747 da6bffff
!	Mem[0000000010041408] = e3f6032a, %l5 = 00000000c64fa1d9
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 000000e3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffad7920, %l2 = ffffffffe42da7bc
	lduha	[%o1+0x000]%asi,%l2	! %l2 = 000000000000ffad

p0_label_49:
!	Mem[0000000010141410] = 0a8e4cf8, %l5 = 00000000000000e3
	ldswa	[%i5+%o5]0x80,%l5	! %l5 = 000000000a8e4cf8
!	Mem[0000000030001408] = 8556af77, %l5 = 000000000a8e4cf8
	ldsba	[%i0+%o4]0x81,%l5	! %l5 = ffffffffffffff85
!	Mem[0000000030101408] = 0e8b1dff, %l1 = ffffffffffffffaf
	ldsba	[%i4+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101408] = c32817160b006aa4, %f18 = a1000000 10318948
	ldda	[%i4+%o4]0x88,%f18	! %f18 = c3281716 0b006aa4
!	Mem[0000000010041410] = ff000085, %l5 = ffffffffffffff85
	lduba	[%i1+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001410] = 7ca5bd15, %f23 = edce7ea8
	lda	[%i0+%o5]0x81,%f23	! %f23 = 7ca5bd15
!	Mem[000000001008142c] = 5246e53a, %l7 = 0000000000000073
	lduwa	[%i2+0x02c]%asi,%l7	! %l7 = 000000005246e53a
!	Mem[00000000100c1400] = ff000000, %l1 = ffffffffffffffff
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081400] = e42da7bc, %l2 = 000000000000ffad
	lduha	[%i2+%g0]0x80,%l2	! %l2 = 000000000000e42d
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 000000ff, %l3 = 6e22557f8f7cd9c8
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff

p0_label_50:
!	Mem[00000000100c1410] = e42da7bc, %l2 = 000000000000e42d
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 00000000e42da7bc
!	Mem[00000000201c0001] = afffe51a, %l5 = 00000000000000ff
	ldstub	[%o0+0x001],%l5		! %l5 = 000000ff000000ff
!	%f8  = ff1d8b0e de11bf9b, %l4 = 00000000b0f9d999
!	Mem[0000000030101418] = 269f5250edce7ea8
	add	%i4,0x018,%g1
	stda	%f8,[%g1+%l4]ASI_PST32_S ! Mem[0000000030101418] = 269f5250de11bf9b
!	%f27 = 0e8b1dff, Mem[0000000030001408] = 8556af77
	sta	%f27,[%i0+%o4]0x81	! Mem[0000000030001408] = 0e8b1dff
!	Mem[0000000030181408] = 65e10015, %l5 = 00000000000000ff
	swapa	[%i6+%o4]0x89,%l5	! %l5 = 0000000065e10015
!	Mem[0000000010041400] = 000000ff, %l5 = 0000000065e10015
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%f28 = 4124e2c4 b5751555, Mem[0000000030141408] = 000069ff 8556af77
	stda	%f28,[%i5+%o4]0x89	! Mem[0000000030141408] = 4124e2c4 b5751555
!	Mem[0000000021800040] = a2f759f3, %l1 = 00000000000000ff
	ldstub	[%o3+0x040],%l1		! %l1 = 000000a2000000ff
!	%f30 = 1ba8f2d6 69308b24, %l6 = 00000000ff0000a1
!	Mem[0000000030081408] = 25005685cd000000
	add	%i2,0x008,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030081408] = 248b3069cd000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffafe1d5, %l3 = 00000000000000ff
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 00000000000000ff

p0_label_51:
!	Mem[0000000030141410] = 77af5685 00000000, %l4 = b0f9d999, %l5 = 00000000
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000077af5685
!	Mem[0000000030101400] = 0000000000000072, %f6  = ff000000 c64fa1d9
	ldda	[%i4+%g0]0x81,%f6 	! %f6  = 00000000 00000072
!	Mem[0000000010101400] = 50529f26, %l6 = 00000000ff0000a1
	lduha	[%i4+%g0]0x80,%l6	! %l6 = 0000000000005052
!	Mem[0000000010041408] = 2a03f6ff, %f25 = 9735ac9a
	lda	[%i1+%o4]0x88,%f25	! %f25 = 2a03f6ff
!	Mem[00000000100c1400] = 000000ff, %l2 = 00000000e42da7bc
	ldswa	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = ff000000 e3f6032a, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000ff000000 00000000e3f6032a
!	Mem[0000000010141428] = b5b9f742, %l1 = 00000000000000a2
	ldstuba	[%i5+0x028]%asi,%l1	! %l1 = 000000b5000000ff
!	Mem[0000000010081410] = ffafe1d5, %f21 = 000000ff
	lda	[%i2+%o5]0x80,%f21	! %f21 = ffafe1d5
!	Mem[0000000030181400] = 9452e4b8, %l1 = 00000000000000b5
	lduba	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000094
!	Starting 10 instruction Store Burst
!	%f29 = b5751555, Mem[00000000300c1408] = 6aa433c0
	sta	%f29,[%i3+%o4]0x81	! Mem[00000000300c1408] = b5751555

p0_label_52:
!	%f6  = 00000000 00000072, Mem[0000000010001400] = cd00e165 00ff0000
	stda	%f6 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 00000072
!	%l6 = 0000000000005052, Mem[0000000020800040] = d1ff12f0, %asi = 80
	stha	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 505212f0
!	%f0  = 00000000 ded191ce ccccd747 da6bffff
!	%f4  = 0be6e165 4686ec5b 00000000 00000072
!	%f8  = ff1d8b0e de11bf9b 8fed6b77 edca7fff
!	%f12 = 00000000 7ca5bd15 6e22557f 8f7cd9c8
	stda	%f0,[%i1]ASI_BLK_P	! Block Store to 0000000010041400
!	Mem[0000000010141410] = 0a8e4cf8, %l3 = 00000000e3f6032a
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 000000000a8e4cf8
!	%l3 = 000000000a8e4cf8, Mem[00000000100c142e] = f84c8e0a, %asi = 80
	stha	%l3,[%i3+0x02e]%asi	! Mem[00000000100c142c] = f84c4cf8
!	%f28 = 4124e2c4 b5751555, %f28 = 4124e2c4
	fdtos	%f28,%f28		! %f28 = 49271626
!	%f30 = 1ba8f2d6 69308b24, Mem[0000000010101400] = 269f5250 5bec8646
	stda	%f30,[%i4+%g0]0x88	! Mem[0000000010101400] = 1ba8f2d6 69308b24
!	%f28 = 49271626, Mem[0000000030141410] = 00000000
	sta	%f28,[%i5+%o5]0x89	! Mem[0000000030141410] = 49271626
!	%f18 = c3281716 0b006aa4, %l1 = 0000000000000094
!	Mem[0000000030001438] = 08c193c004aaf5fe
	add	%i0,0x038,%g1
	stda	%f18,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030001438] = 08c193c01617f5fe
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000cd85560000, %f30 = 1ba8f2d6 69308b24
	ldda	[%i4+%o5]0x88,%f30	! %f30 = 000000cd 85560000

p0_label_53:
!	Mem[0000000010001410] = ff000000, %l0 = 00000000000000ff
	lduha	[%i0+0x010]%asi,%l0	! %l0 = 000000000000ff00
!	Mem[00000000100c1410] = 0000e42d, %l3 = 000000000a8e4cf8
	ldsha	[%i3+%o5]0x88,%l3	! %l3 = ffffffffffffe42d
!	Mem[0000000030141400] = a044d64e, %l7 = 000000005246e53a
	lduha	[%i5+%g0]0x89,%l7	! %l7 = 000000000000d64e
!	Mem[0000000030141410] = 49271626, %l5 = 0000000077af5685
	lduha	[%i5+%o5]0x89,%l5	! %l5 = 0000000000001626
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010041410] = 0be6e165, %f21 = ffafe1d5
	lda	[%i1+%o5]0x80,%f21	! %f21 = 0be6e165
!	Mem[000000001010140c] = 161728c3, %l3 = ffffffffffffe42d
	ldsba	[%i4+0x00e]%asi,%l3	! %l3 = 0000000000000028
!	Mem[00000000100c1410] = 2de40000, %l1 = 0000000000000094
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000002de4
!	Mem[0000000030001410] = 7ca5bd15, %l4 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l4	! %l4 = 000000007ca5bd15
!	Mem[0000000010181410] = c8d97c8f 0000ff1d, %l6 = 00005052, %l7 = 0000d64e
	ldda	[%i6+0x010]%asi,%l6	! %l6 = 00000000c8d97c8f 000000000000ff1d
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 4ed644a0, %l1 = 0000000000002de4
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 0000004e000000ff

p0_label_54:
!	Mem[0000000010081408] = 56660000, %l6 = 00000000c8d97c8f
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 00000056000000ff
!	Mem[0000000030001410] = 15bda57c, %l0 = 000000000000ff00
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 0000007c000000ff
!	%f16 = 00000000 00000072 c3281716 0b006aa4
!	%f20 = d9a14fc6 0be6e165 269f5250 7ca5bd15
!	%f24 = 973718fc 2a03f6ff 9bbf11de 0e8b1dff
!	%f28 = 49271626 b5751555 000000cd 85560000
	stda	%f16,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
!	%f11 = edca7fff, Mem[000000001004142c] = edca7fff
	sta	%f11,[%i1+0x02c]%asi	! Mem[000000001004142c] = edca7fff
!	%l1 = 000000000000004e, Mem[0000000010041410] = 0be6e1654686ec5b
	stxa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000000000004e
!	Mem[0000000010101400] = 248b3069, %l0 = 000000000000007c
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 00000024000000ff
!	%l4 = 000000007ca5bd15, Mem[0000000010001408] = f84c8e0a
	stwa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 7ca5bd15
!	%f8  = ff1d8b0e de11bf9b, Mem[0000000030041400] = 56660000 00000000
	stda	%f8 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ff1d8b0e de11bf9b
!	%l0 = 0000000000000024, Mem[0000000010141400] = 420000af
	stba	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 240000af
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010181430] = 94652c73, %l6 = 0000000000000056
	lduh	[%i6+0x030],%l6		! %l6 = 0000000000009465

p0_label_55:
!	Mem[0000000010101410] = 000000cd85560000, %f18 = c3281716 0b006aa4
	ldda	[%i4+%o5]0x88,%f18	! %f18 = 000000cd 85560000
!	Mem[0000000010041400] = 00000000, %l0 = 0000000000000024
	ldsba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = ff660000, %l7 = 000000000000ff1d
	lduba	[%i2+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = ff8b3069 d6f2a81b, %l0 = 00000000, %l1 = 0000004e
	ldda	[%i4+%g0]0x80,%l0	! %l0 = 00000000ff8b3069 00000000d6f2a81b
!	Mem[0000000010081404] = 644004ff, %f30 = 000000cd
	lda	[%i2+0x004]%asi,%f30	! %f30 = 644004ff
!	Mem[0000000010141410] = 2a03f6e3, %f15 = 8f7cd9c8
	lda	[%i5+%o5]0x88,%f15	! %f15 = 2a03f6e3
!	Mem[0000000030081400] = 73d87561, %l4 = 000000007ca5bd15
	ldsba	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000073
!	Mem[0000000010101400] = 69308bff, %l5 = 0000000000001626
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000008bff
!	Mem[0000000010081410] = c8d97c8fd5e1afff, %l6 = 0000000000009465
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = c8d97c8fd5e1afff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1414] = fffffff8, %l1 = 00000000d6f2a81b
	swap	[%i3+0x014],%l1		! %l1 = 00000000fffffff8

p0_label_56:
!	Mem[000000001000143c] = f76ce7cf, %l5 = 0000000000008bff
	swap	[%i0+0x03c],%l5		! %l5 = 00000000f76ce7cf
!	Mem[0000000010081408] = ff660000, %l0 = 00000000ff8b3069
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	%l4 = 00000073, %l5 = f76ce7cf, Mem[00000000100c1408] = 4a000000 00000000
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000073 f76ce7cf
!	%l3 = 0000000000000028, Mem[0000000030041408] = 4a00caed
	stwa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000028
!	%f2  = ccccd747 da6bffff, Mem[00000000300c1400] = 00000015 00000072
	stda	%f2 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = ccccd747 da6bffff
!	%l0 = 00000000000000ff, Mem[00000000100c1400] = 000000ff
	stha	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	Mem[00000000100c1430] = 74c0ac27, %l2 = 00000000ff000000, %asi = 80
	swapa	[%i3+0x030]%asi,%l2	! %l2 = 0000000074c0ac27
!	%f1  = ded191ce, Mem[0000000010041400] = 00000000
	sta	%f1 ,[%i1+%g0]0x88	! Mem[0000000010041400] = ded191ce
!	Mem[0000000020800001] = ffad7920, %l6 = c8d97c8fd5e1afff
	ldstub	[%o1+0x001],%l6		! %l6 = 000000ad000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00005685cd000000, %f28 = 49271626 b5751555
	ldd	[%i4+%o5],%f28		! %f28 = 00005685 cd000000

p0_label_57:
!	Mem[0000000030141408] = b5751555, %l0 = 00000000000000ff
	ldsha	[%i5+%o4]0x89,%l0	! %l0 = 0000000000001555
!	Mem[0000000010081418] = 99d9f9b0, %l4 = 0000000000000073
	lduha	[%i2+0x018]%asi,%l4	! %l4 = 00000000000099d9
!	Mem[0000000030041408] = 00000028, %l2 = 0000000074c0ac27
	lduwa	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000028
!	Mem[00000000201c0000] = afffe51a, %l5 = 00000000f76ce7cf
	ldsh	[%o0+%g0],%l5		! %l5 = ffffffffffffafff
!	Mem[0000000030041400] = 0e8b1dff, %l7 = 00000000000000ff
	lduha	[%i1+%g0]0x89,%l7	! %l7 = 0000000000001dff
!	Mem[000000001010142c] = d5267ddc, %l6 = 00000000000000ad
	lduh	[%i4+0x02e],%l6		! %l6 = 0000000000007ddc
!	Mem[00000000300c1410] = 4a51e4ca, %l1 = 00000000fffffff8
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = 0000000000004a51
!	Mem[000000001004140c] = da6bffff, %l3 = 0000000000000028
	ldsba	[%i1+0x00d]%asi,%l3	! %l3 = 000000000000006b
!	Mem[0000000010141410] = 6f371fa32a03f6e3, %f14 = 6e22557f 2a03f6e3
	ldda	[%i5+%o5]0x88,%f14	! %f14 = 6f371fa3 2a03f6e3
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000006b, Mem[0000000030101408] = 0e8b1dff
	stha	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 0e8b006b

p0_label_58:
!	%l0 = 0000000000001555, Mem[0000000010101408] = 0b006aa4
	stba	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 0b006a55
!	%l2 = 00000028, %l3 = 0000006b, Mem[00000000100c1410] = 2de40000 d6f2a81b
	stda	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000028 0000006b
!	%l2 = 0000000000000028, Mem[00000000100c1410] = 00000028
	stha	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00280028
!	%l4 = 00000000000099d9, Mem[0000000030001408] = 0e8b1dff00006982
	stxa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000000099d9
!	%l2 = 0000000000000028, Mem[0000000010081400] = bca72de4
	stba	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = bca72d28
!	%l0 = 00001555, %l1 = 00004a51, Mem[0000000010041428] = 8fed6b77 edca7fff
	stda	%l0,[%i1+0x028]%asi	! Mem[0000000010041428] = 00001555 00004a51
!	%l0 = 0000000000001555, Mem[00000000100c1401] = ff000000, %asi = 80
	stba	%l0,[%i3+0x001]%asi	! Mem[00000000100c1400] = ff550000
!	%l3 = 000000000000006b, Mem[00000000211c0000] = 25ff3616
	stb	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 6bff3616
!	%f13 = 7ca5bd15, Mem[00000000100c1408] = 00000073
	sta	%f13,[%i3+%o4]0x80	! Mem[00000000100c1408] = 7ca5bd15
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 7ca5bd1500000072, %l7 = 0000000000001dff
	ldx	[%i0+%o4],%l7		! %l7 = 7ca5bd1500000072

p0_label_59:
!	Mem[0000000010001410] = 000000ff, %l0 = 0000000000001555
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101400] = 00000000, %l4 = 00000000000099d9
	ldsba	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 47d7cccc, %l7 = 7ca5bd1500000072
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 0000000047d7cccc
!	Mem[0000000010081430] = 74c8d83e, %l7 = 0000000047d7cccc
	ldsba	[%i2+0x031]%asi,%l7	! %l7 = ffffffffffffffc8
!	Mem[0000000030141400] = ffd644a0 000000af, %l6 = 00007ddc, %l7 = ffffffc8
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000ffd644a0 00000000000000af
!	Mem[0000000010141400] = 240000af, %l3 = 000000000000006b
	lduw	[%i5+%g0],%l3		! %l3 = 00000000240000af
!	Mem[0000000030141400] = af000000a044d6ff, %l0 = 00000000000000ff
	ldxa	[%i5+%g0]0x89,%l0	! %l0 = af000000a044d6ff
!	Mem[00000000201c0000] = afffe51a, %l2 = 0000000000000028
	ldub	[%o0+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010041438] = 6e22557f8f7cd9c8, %l3 = 00000000240000af
	ldx	[%i1+0x038],%l3		! %l3 = 6e22557f8f7cd9c8
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = bca72d28, %l0 = af000000a044d6ff
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 00000000bca72d28

p0_label_60:
!	%l6 = ffd644a0, %l7 = 000000af, Mem[0000000010101400] = ff8b3069 d6f2a81b
	stda	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = ffd644a0 000000af
!	%l4 = 0000000000000000, Mem[000000001004143c] = 8f7cd9c8, %asi = 80
	stha	%l4,[%i1+0x03c]%asi	! Mem[000000001004143c] = 0000d9c8
!	%f28 = 00005685, Mem[0000000010081400] = ffd644a0
	sta	%f28,[%i2+0x000]%asi	! Mem[0000000010081400] = 00005685
!	Mem[0000000010101400] = a044d6ff, %l0 = 00000000bca72d28
	swapa	[%i4+%g0]0x88,%l0	! %l0 = 00000000a044d6ff
!	%l5 = ffffffffffffafff, Mem[0000000010141408] = 92ff8334
	stba	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 92ff83ff
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 00000000a044d6ff
	setx	0x91f997e828946891,%g7,%l0 ! %l0 = 91f997e828946891
!	%l1 = 0000000000004a51
	setx	0x0eebcd482bf427e7,%g7,%l1 ! %l1 = 0eebcd482bf427e7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 91f997e828946891
	setx	0xfa0a425876d822b6,%g7,%l0 ! %l0 = fa0a425876d822b6
!	%l1 = 0eebcd482bf427e7
	setx	0x431a13c7f9b0f7b2,%g7,%l1 ! %l1 = 431a13c7f9b0f7b2
!	%l3 = 6e22557f8f7cd9c8, Mem[0000000030141400] = ffd644a0
	stha	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = d9c844a0
!	Mem[000000001014142c] = 33831619, %l0 = fa0a425876d822b6
	swap	[%i5+0x02c],%l0		! %l0 = 0000000033831619
!	%l0 = 33831619, %l1 = f9b0f7b2, Mem[0000000010141430] = 027c5172 ffffff8f
	std	%l0,[%i5+0x030]		! Mem[0000000010141430] = 33831619 f9b0f7b2
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff83ff92 7273d84c, %l6 = ffd644a0, %l7 = 000000af
	ldda	[%i5+0x008]%asi,%l6	! %l6 = 00000000ff83ff92 000000007273d84c

p0_label_61:
!	Mem[0000000010101410] = 00005685, %f24 = 973718fc
	ld	[%i4+%o5],%f24	! %f24 = 00005685
!	Mem[0000000030181408] = c3281716, %l3 = 6e22557f8f7cd9c8
	ldsha	[%i6+%o4]0x81,%l3	! %l3 = ffffffffffffc328
!	Mem[0000000010001410] = ff000000 acb61bbb, %l6 = ff83ff92, %l7 = 7273d84c
	ldda	[%i0+0x010]%asi,%l6	! %l6 = 00000000ff000000 00000000acb61bbb
!	Mem[0000000010001430] = ae37e6b8, %l5 = ffffffffffffafff
	lduba	[%i0+0x032]%asi,%l5	! %l5 = 00000000000000e6
!	Mem[0000000010001400] = 00000000, %l4 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = c3281716, %l5 = 00000000000000e6
	ldsba	[%i6+%o4]0x81,%l5	! %l5 = ffffffffffffffc3
!	Mem[0000000030081410] = 82690000, %l4 = 0000000000000000
	ldsha	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041410] = af000000 7506eaa6, %l6 = ff000000, %l7 = acb61bbb
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 00000000af000000 000000007506eaa6
!	Mem[00000000201c0000] = afffe51a, %l7 = 000000007506eaa6
	ldub	[%o0+%g0],%l7		! %l7 = 00000000000000af
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000af, Mem[0000000030101408] = 0e8b006b
	stha	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 0e8b00af

p0_label_62:
!	Mem[0000000010101410] = 00005685, %f30 = 644004ff
	ld	[%i4+%o5],%f30	! %f30 = 00005685
!	%l0 = 0000000033831619, Mem[000000001008143c] = f272b603, %asi = 80
	stha	%l0,[%i2+0x03c]%asi	! Mem[000000001008143c] = 1619b603
!	%l5 = ffffffffffffffc3, Mem[0000000030141408] = 551575b5
	stha	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = ffc375b5
!	Mem[0000000030001410] = ffa5bd15, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l4	! %l4 = 00000000ffa5bd15
!	Mem[0000000030141408] = b575c3ff, %l0 = 0000000033831619
	ldstuba	[%i5+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%l3 = ffffffffffffc328, Mem[0000000030181410] = c64fa1d9
	stha	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = c64fc328
!	Mem[0000000010001420] = fbdb9e41207f2668, %l2 = 00000000000000ff, %l3 = ffffffffffffc328
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = fbdb9e41207f2668
!	%l1 = 431a13c7f9b0f7b2, Mem[0000000010001410] = ff000000
	stwa	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = f9b0f7b2
!	%l5 = ffffffffffffffc3, Mem[0000000010101410] = 85560000
	stba	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 855600c3
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1414] = 0000006b, %l5 = ffffffffffffffc3
	ldsha	[%i3+0x016]%asi,%l5	! %l5 = 000000000000006b

p0_label_63:
!	Mem[000000001014141c] = 69f207b2, %l4 = 00000000ffa5bd15
	lduw	[%i5+0x01c],%l4		! %l4 = 0000000069f207b2
!	Mem[0000000010001410] = b2f7b0f9, %l7 = 00000000000000af
	ldswa	[%i0+%o5]0x88,%l7	! %l7 = ffffffffb2f7b0f9
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 00000000000000ff
	setx	0x7965c2a82a6c75d1,%g7,%l0 ! %l0 = 7965c2a82a6c75d1
!	%l1 = 431a13c7f9b0f7b2
	setx	0x332d7e601fe7805a,%g7,%l1 ! %l1 = 332d7e601fe7805a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7965c2a82a6c75d1
	setx	0x71cc4f2fb75ed4e2,%g7,%l0 ! %l0 = 71cc4f2fb75ed4e2
!	%l1 = 332d7e601fe7805a
	setx	0x2a340d087e7226db,%g7,%l1 ! %l1 = 2a340d087e7226db
!	Mem[000000001018142c] = e680c94e, %l6 = 00000000af000000
	ldsw	[%i6+0x02c],%l6		! %l6 = ffffffffe680c94e
!	Mem[0000000030081410] = 00006982, %l0 = 71cc4f2fb75ed4e2
	ldsha	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 4a51e4ca, %l0 = 0000000000000000
	lduha	[%i3+%o5]0x81,%l0	! %l0 = 0000000000004a51
!	Mem[0000000030001410] = 00000000, %f11 = edca7fff
	lda	[%i0+%o5]0x89,%f11	! %f11 = 00000000
!	Mem[0000000010041410] = 00000000, %l5 = 000000000000006b
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000030181400] = 00000000 00000072 c3281716 0b006aa4
!	Mem[0000000030181410] = 28c34fc6 0be6e165 269f5250 7ca5bd15
!	Mem[0000000030181420] = 973718fc 2a03f6ff 9bbf11de 0e8b1dff
!	Mem[0000000030181430] = 49271626 b5751555 000000cd 85560000
	ldda	[%i6]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030181400
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff550000, %l6 = ffffffffe680c94e
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 00000000ff550000

p0_label_64:
!	Mem[0000000010101408] = 556a000b, %l3 = fbdb9e41207f2668
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 00000000556a000b
!	%f0  = 00000000, Mem[0000000010081410] = ffafe1d5
	sta	%f0 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%l1 = 2a340d087e7226db, Mem[0000000030041410] = af000000
	stba	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = db000000
!	%f0  = 00000000 ded191ce, Mem[0000000010101400] = bca72d28 af000000
	stda	%f0 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 ded191ce
!	%l0 = 0000000000004a51, Mem[0000000030001400] = 0002058f
	stwa	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 00004a51
!	%f5  = 4686ec5b, Mem[0000000010141408] = 92ff83ff
	sta	%f5 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 4686ec5b
!	%l2 = 000000ff, %l3 = 556a000b, Mem[0000000030081400] = 73d87561 8b959f9f
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff 556a000b
!	%f0  = 00000000 ded191ce, %l4 = 0000000069f207b2
!	Mem[0000000030001438] = 08c193c01617f5fe
	add	%i0,0x038,%g1
	stda	%f0,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030001438] = 089193c00000f500
!	Mem[0000000030041410] = 000000db, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 000000db000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffc375b5, %f5  = 4686ec5b
	lda	[%i5+%o4]0x81,%f5 	! %f5 = ffc375b5

p0_label_65:
!	Mem[0000000010041408] = 47d7cccc, %l6 = 00000000ff550000
	lduba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000cc
!	Mem[0000000030041408] = 00000028, %l0 = 0000000000004a51
	ldsha	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = ff660000, %l1 = 2a340d087e7226db
	ldsha	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffffff66
!	Mem[00000000300c1410] = 4a51e4ca5c3964ce, %f8  = ff1d8b0e de11bf9b
	ldda	[%i3+%o5]0x81,%f8 	! %f8  = 4a51e4ca 5c3964ce
!	Mem[000000001014143c] = abd6bfd6, %l4 = 0000000069f207b2
	ldsba	[%i5+0x03e]%asi,%l4	! %l4 = ffffffffffffffbf
!	Mem[00000000300c1400] = ffff6bda47d7cccc, %l0 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l0	! %l0 = ffff6bda47d7cccc
!	Mem[0000000010001410] = bb1bb6acb2f7b0f9, %f4  = 0be6e165 ffc375b5
	ldda	[%i0+%o5]0x88,%f4 	! %f4  = bb1bb6ac b2f7b0f9
!	Mem[0000000010041410] = 00000000, %l1 = ffffffffffffff66
	lduha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = 15bda57c, %l7 = ffffffffb2f7b0f9
	ldsha	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffa57c
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010101408] = 68267f20
	stha	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 682600ff

p0_label_66:
!	Mem[0000000010081400] = 85560000, %l5 = 00000000000000db
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l0 = ffff6bda47d7cccc, Mem[0000000030101410] = ffffffff
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 47d7cccc
!	%l7 = ffffffffffffa57c, Mem[0000000030141408] = b575c3ff
	stha	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = b575a57c
!	%l0 = ffff6bda47d7cccc, Mem[0000000010081400] = ff005685644004ff, %asi = 80
	stxa	%l0,[%i2+0x000]%asi	! Mem[0000000010081400] = ffff6bda47d7cccc
!	%l6 = 000000cc, %l7 = ffffa57c, Mem[0000000030081410] = 82690000 8fed6b77
	stda	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000cc ffffa57c
!	%l6 = 00000000000000cc, Mem[0000000010001400] = 00000000
	stba	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000cc
!	Mem[0000000030101410] = 47d7cccc, %l0 = ffff6bda47d7cccc
	ldstuba	[%i4+%o5]0x89,%l0	! %l0 = 000000cc000000ff
!	%l0 = 00000000000000cc, Mem[0000000010101414] = cd000000, %asi = 80
	stwa	%l0,[%i4+0x014]%asi	! Mem[0000000010101414] = 000000cc
!	%f2  = ccccd747 da6bffff, %l3 = 00000000556a000b
!	Mem[00000000300c1418] = bbebff7fa710a422
	add	%i3,0x018,%g1
	stda	%f2,[%g1+%l3]ASI_PST8_SL ! Mem[00000000300c1418] = ffffffdaa710a422
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 000066ff, %l0 = 00000000000000cc
	ldsha	[%i2+%o4]0x88,%l0	! %l0 = 00000000000066ff

p0_label_67:
!	Mem[0000000010001400] = cc000000, %l6 = 00000000000000cc
	ldsba	[%i0+%g0]0x80,%l6	! %l6 = ffffffffffffffcc
!	Mem[0000000010001408] = 7200000015bda57c, %l6 = ffffffffffffffcc
	ldxa	[%i0+%o4]0x88,%l6	! %l6 = 7200000015bda57c
!	Mem[0000000030181400] = 7200000000000000, %l0 = 00000000000066ff
	ldxa	[%i6+%g0]0x89,%l0	! %l0 = 7200000000000000
!	Mem[0000000010001410] = f9b0f7b2, %l6 = 7200000015bda57c
	ldsha	[%i0+%o5]0x80,%l6	! %l6 = fffffffffffff9b0
!	Mem[0000000030081410] = ffffa57c000000cc, %l3 = 00000000556a000b
	ldxa	[%i2+%o5]0x89,%l3	! %l3 = ffffa57c000000cc
!	Mem[00000000201c0000] = afffe51a, %l0 = 7200000000000000
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000af
!	Mem[00000000100c1410] = 28002800, %l3 = ffffa57c000000cc
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 0000000028002800
!	Mem[0000000010181400] = e42da7bc, %f11 = 00000000
	lda	[%i6+%g0]0x80,%f11	! %f11 = e42da7bc
!	Mem[0000000010041400] = ded191ce, %l2 = 00000000000000ff
	lduba	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ce
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 000000cc, %l6 = fffffffffffff9b0
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 000000cc000000ff

p0_label_68:
!	%l7 = ffffffffffffa57c, Mem[0000000030101400] = 00000000
	stba	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 7c000000
!	Mem[0000000030001410] = 00000000, %l0 = 00000000000000af
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081408] = 69308b24, %l0 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 0000000069308b24
!	%f28 = 551575b5 26162749, Mem[0000000010001420] = fbdb9e41 207f2668
	stda	%f28,[%i0+0x020]%asi	! Mem[0000000010001420] = 551575b5 26162749
!	%l7 = ffffffffffffa57c, Mem[00000000201c0000] = afffe51a, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 7cffe51a
!	%l7 = ffffffffffffa57c, Mem[00000000300c1408] = b5751555
	stba	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 7c751555
!	Mem[0000000010141410] = 2a03f6e3, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l5	! %l5 = 000000002a03f6e3
!	%l7 = ffffffffffffa57c, Mem[0000000010181400] = d9a14fc6bca72de4
	stxa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffffffffa57c
!	%l6 = 000000cc, %l7 = ffffa57c, Mem[0000000010141408] = 5bec8646 7273d84c
	stda	%l6,[%i5+0x008]%asi	! Mem[0000000010141408] = 000000cc ffffa57c
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = 9f9f958b6175d873, %f28 = 551575b5 26162749
	ldd	[%i3+0x020],%f28	! %f28 = 9f9f958b 6175d873

p0_label_69:
!	Mem[0000000030041400] = ff1d8b0e, %l0 = 0000000069308b24
	ldswa	[%i1+%g0]0x81,%l0	! %l0 = ffffffffff1d8b0e
!	Mem[0000000030141400] = a044c8d9, %l0 = ffffffffff1d8b0e
	lduha	[%i5+%g0]0x89,%l0	! %l0 = 000000000000c8d9
!	Mem[0000000010181400] = 7ca5ffffffffffff, %l6 = 00000000000000cc
	ldxa	[%i6+%g0]0x80,%l6	! %l6 = 7ca5ffffffffffff
!	Mem[00000000100c1418] = 0000000b0186ec93, %l6 = 7ca5ffffffffffff
	ldxa	[%i3+0x018]%asi,%l6	! %l6 = 0000000b0186ec93
!	Mem[0000000030141400] = d9c844a0, %l1 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l1	! %l1 = 00000000d9c844a0
!	Mem[0000000020800000] = ffff7920, %l7 = ffffffffffffa57c
	lduha	[%o1+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030141410] = 77af568549271626, %l1 = 00000000d9c844a0
	ldxa	[%i5+%o5]0x89,%l1	! %l1 = 77af568549271626
!	Mem[0000000010001420] = 551575b5, %l0 = 000000000000c8d9
	lduw	[%i0+0x020],%l0		! %l0 = 00000000551575b5
!	Mem[0000000010141434] = f9b0f7b2, %l4 = ffffffffffffffbf
	ldub	[%i5+0x036],%l4		! %l4 = 00000000000000f7
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ccccd747, %l4 = 00000000000000f7
	ldstuba	[%i1+%o4]0x80,%l4	! %l4 = 000000cc000000ff

p0_label_70:
!	%l4 = 00000000000000cc, Mem[00000000300c1400] = ccccd747
	stwa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000cc
!	%l2 = 000000ce, %l3 = 28002800, Mem[0000000010101408] = 682600ff c3281716
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ce 28002800
!	%l5 = 000000002a03f6e3, Mem[0000000010181400] = ffffa57c
	stba	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffa5e3
!	%f16 = 72000000 00000000, Mem[0000000030081410] = 000000ff ffffa57c
	stda	%f16,[%i2+%o5]0x89	! Mem[0000000030081410] = 72000000 00000000
!	%l2 = 000000ce, %l3 = 28002800, Mem[0000000010141408] = cc000000 7ca5ffff
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ce 28002800
!	%f28 = 9f9f958b, Mem[0000000010001400] = cc000000
	sta	%f28,[%i0+%g0]0x80	! Mem[0000000010001400] = 9f9f958b
!	Mem[0000000010001408] = 7ca5bd15, %l1 = 77af568549271626
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 0000007c000000ff
!	%f0  = 00000000 ded191ce, %l2 = 00000000000000ce
!	Mem[0000000010141420] = eeb260e944bfd777
	add	%i5,0x020,%g1
	stda	%f0,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010141420] = eeb260e900000000
!	%l4 = 00000000000000cc, Mem[0000000010001400] = 8b959f9f
	stba	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 8b959fcc
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 000000ff, %f7  = 00000072
	lda	[%i0+%o5]0x89,%f7 	! %f7 = 000000ff

p0_label_71:
!	Mem[0000000010181428] = e1cb281e, %l3 = 0000000028002800
	lduha	[%i6+0x028]%asi,%l3	! %l3 = 000000000000e1cb
!	Mem[0000000030001400] = 00004a51, %l3 = 000000000000e1cb
	ldswa	[%i0+%g0]0x89,%l3	! %l3 = 0000000000004a51
!	Mem[0000000020800040] = 505212f0, %l4 = 00000000000000cc
	lduh	[%o1+0x040],%l4		! %l4 = 0000000000005052
!	Mem[0000000010001410] = b2f7b0f9, %l5 = 000000002a03f6e3
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 000000000000b0f9
!	Mem[000000001004143c] = 0000d9c8, %l0 = 00000000551575b5
	ldsba	[%i1+0x03c]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 7c00000000000072, %f30 = 00005685 cd000000
	ldda	[%i4+%g0]0x81,%f30	! %f30 = 7c000000 00000072
!	Mem[0000000010141408] = 28002800 000000ce, %l0 = 00000000, %l1 = 0000007c
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 00000000000000ce 0000000028002800
!	Mem[0000000021800080] = 653fd437, %l5 = 000000000000b0f9
	ldsh	[%o3+0x080],%l5		! %l5 = 000000000000653f
!	Mem[0000000030041408] = 00000028, %l1 = 0000000028002800
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041424] = de11bf9b, %l2 = 00000000000000ce
	swap	[%i1+0x024],%l2		! %l2 = 00000000de11bf9b

p0_label_72:
!	Mem[0000000030001408] = 00000000, %l4 = 0000000000005052
	swapa	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%f16 = 72000000 00000000, Mem[0000000010101408] = ce000000 00280028
	stda	%f16,[%i4+%o4]0x80	! Mem[0000000010101408] = 72000000 00000000
!	%l6 = 0186ec93, %l7 = 0000ffff, Mem[0000000030001408] = 00005052 d9990000
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 0186ec93 0000ffff
!	Mem[000000001018140c] = ffffffff, %l5 = 0000653f, %l1 = 00000000
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 00000000ffffffff
!	%l0 = 00000000000000ce, Mem[0000000010041410] = 00000000
	stba	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ce
!	Mem[0000000010181434] = 35a29a77, %l6 = 0000000b0186ec93
	swap	[%i6+0x034],%l6		! %l6 = 0000000035a29a77
!	Mem[0000000010081428] = 80f6b15e, %l1 = ffffffff, %l3 = 00004a51
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 0000000080f6b15e
!	Mem[0000000010041400] = ded191ce, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l4	! %l4 = 00000000ded191ce
!	%l6 = 35a29a77, %l7 = 0000ffff, Mem[0000000010141410] = 00000000 a31f376f
	stda	%l6,[%i5+0x010]%asi	! Mem[0000000010141410] = 35a29a77 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 000000cc, %l6 = 0000000035a29a77
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000cc

p0_label_73:
!	Mem[00000000100c1410] = 00280028 0000006b, %l6 = 000000cc, %l7 = 0000ffff
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 0000000000280028 000000000000006b
!	Mem[0000000030001410] = 000000ff, %l6 = 0000000000280028
	lduwa	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041400] = 9bbf11de0e8b1dff, %f26 = ff1d8b0e de11bf9b
	ldda	[%i1+%g0]0x89,%f26	! %f26 = 9bbf11de 0e8b1dff
!	Mem[0000000010001400] = cc9f958b, %l1 = 00000000ffffffff
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 00000000cc9f958b
!	Mem[0000000030181400] = 7200000000000000, %l7 = 000000000000006b
	ldxa	[%i6+%g0]0x89,%l7	! %l7 = 7200000000000000
!	Mem[0000000030181400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = ffa5bd15, %l1 = 00000000cc9f958b
	lduha	[%i0+%o4]0x80,%l1	! %l1 = 000000000000ffa5
!	Mem[0000000010041420] = ff1d8b0e 000000ce, %l4 = ded191ce, %l5 = 0000653f
	ldda	[%i1+0x020]%asi,%l4	! %l4 = 00000000ff1d8b0e 00000000000000ce
!	Mem[0000000010181408] = 4effffff, %f14 = 6f371fa3
	lda	[%i6+%o4]0x80,%f14	! %f14 = 4effffff
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 ded191ce ccccd747 da6bffff
!	%f4  = bb1bb6ac b2f7b0f9 00000000 000000ff
!	%f8  = 4a51e4ca 5c3964ce 8fed6b77 e42da7bc
!	%f12 = 00000000 7ca5bd15 4effffff 2a03f6e3
	stda	%f0,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400

p0_label_74:
!	%l5 = 00000000000000ce, Mem[0000000010001408] = ffa5bd15
	stha	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00cebd15
!	Mem[0000000010081408] = ff660000, %l4 = 00000000ff1d8b0e
	swapa	[%i2+%o4]0x80,%l4	! %l4 = 00000000ff660000
!	%l4 = 00000000ff660000, Mem[0000000010041410] = b2f7b0f9
	stwa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = ff660000
!	%f0  = 00000000 ded191ce ccccd747 da6bffff
!	%f4  = bb1bb6ac b2f7b0f9 00000000 000000ff
!	%f8  = 4a51e4ca 5c3964ce 8fed6b77 e42da7bc
!	%f12 = 00000000 7ca5bd15 4effffff 2a03f6e3
	stda	%f0,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	Mem[0000000030001408] = 93ec8601, %l2 = 00000000de11bf9b
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 0000000093ec8601
!	%f17 = 00000000, Mem[0000000010041408] = ffff6bda
	sta	%f17,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	Mem[00000000218001c0] = af774442, %l4 = 00000000ff660000
	ldstub	[%o3+0x1c0],%l4		! %l4 = 000000af000000ff
!	%l0 = 00000000000000ce, Mem[0000000010001400] = 8b959fcc
	stha	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 8b9500ce
!	%l4 = 00000000000000af, Mem[000000001004141c] = 00000000
	sth	%l4,[%i1+0x01c]		! Mem[000000001004141c] = 00af0000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 6b00000028002800, %l6 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l6	! %l6 = 6b00000028002800

p0_label_75:
!	Mem[00000000300c1400] = 000000cc, %l2 = 0000000093ec8601
	ldswa	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000cc
!	Mem[0000000030101400] = 0000007c, %f18 = a46a000b
	lda	[%i4+%g0]0x89,%f18	! %f18 = 0000007c
!	Mem[0000000010181408] = 4effffff, %l7 = 7200000000000000
	ldsha	[%i6+%o4]0x80,%l7	! %l7 = 0000000000004eff
!	Mem[0000000010181408] = 4effffffffffffff, %f30 = 7c000000 00000072
	ldda	[%i6+%o4]0x80,%f30	! %f30 = 4effffff ffffffff
!	Mem[0000000030101410] = ff00000047d7ccff, %f30 = 4effffff ffffffff
	ldda	[%i4+%o5]0x89,%f30	! %f30 = ff000000 47d7ccff
!	Mem[000000001008143c] = 1619b603, %l4 = 00000000000000af
	ldsb	[%i2+0x03e],%l4		! %l4 = ffffffffffffffb6
!	Mem[0000000010181410] = c8d97c8f, %l4 = ffffffffffffffb6
	lduha	[%i6+0x012]%asi,%l4	! %l4 = 0000000000007c8f
!	Mem[0000000010181408] = ffffff4e, %f21 = c64fc328
	lda	[%i6+%o4]0x88,%f21	! %f21 = ffffff4e
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000030041408] = da6bffff, %l0 = 00000000000000ce
	lduba	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181438] = c86833730000005d, %l3 = 0000000080f6b15e
	ldxa	[%i6+0x038]%asi,%l3	! %l3 = c86833730000005d

p0_label_76:
!	%f0  = 00000000 ded191ce ccccd747 da6bffff
!	%f4  = bb1bb6ac b2f7b0f9 00000000 000000ff
!	%f8  = 4a51e4ca 5c3964ce 8fed6b77 e42da7bc
!	%f12 = 00000000 7ca5bd15 4effffff 2a03f6e3
	stda	%f0,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	%l4 = 0000000000007c8f, Mem[0000000010181400] = e3a5ffff, %asi = 80
	stwa	%l4,[%i6+0x000]%asi	! Mem[0000000010181400] = 00007c8f
!	Mem[0000000010181400] = 00007c8f, %l0 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%f22 = 15bda57c 50529f26, %l5 = 00000000000000ce
!	Mem[0000000030001408] = de11bf9bffff0000
	add	%i0,0x008,%g1
	stda	%f22,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030001408] = de9f5250ffffbd15
!	%l2 = 00000000000000cc, Mem[00000000201c0000] = 7cffe51a, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00cce51a
!	Mem[0000000030101410] = ffccd747, %l3 = c86833730000005d
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 00000000ffccd747
!	%l7 = 0000000000004eff, Mem[0000000010101408] = 0000000000000072
	stxa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000004eff
!	%l3 = 00000000ffccd747, Mem[0000000010081410] = 000000008f7cd9c8
	stxa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000ffccd747
!	Mem[00000000300c1410] = 4a51e4ca, %l3 = 00000000ffccd747
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 000000004a51e4ca
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000ce, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x88,%l0	! %l0 = 00000000000000ce

p0_label_77:
!	Mem[0000000030081410] = 00000000, %l3 = 000000004a51e4ca
	ldswa	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (15)
!	Mem[00000000100c1400] = ce91d1de, %l7 = 0000000000004eff
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000ce91
!	Mem[0000000030141408] = 4124e2c4 b575a57c, %l6 = 28002800, %l7 = 0000ce91
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 00000000b575a57c 000000004124e2c4
!	Mem[0000000021800180] = 50ffa73c, %l6 = 00000000b575a57c
	ldub	[%o3+0x181],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030141408] = 4124e2c4 b575a57c, %l6 = 000000ff, %l7 = 4124e2c4
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 00000000b575a57c 000000004124e2c4
!	Mem[0000000010081400] = ffff6bda, %l0 = 00000000000000ce
	lduba	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081408] = ff1d8b0e, %l6 = 00000000b575a57c
	ldsba	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000020800040] = 505212f0, %l2 = 00000000000000cc
	lduh	[%o1+0x040],%l2		! %l2 = 0000000000005052
!	Mem[0000000010181408] = ffffffffffffff4e, %l4 = 0000000000007c8f
	ldxa	[%i6+%o4]0x88,%l4	! %l4 = ffffffffffffff4e
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = 0000ffa5, Mem[0000000010081428] = 80f6b15e 5246e53a
	stda	%l0,[%i2+0x028]%asi	! Mem[0000000010081428] = 000000ff 0000ffa5

p0_label_78:
!	Mem[0000000030081400] = 000000ff, %l6 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101428] = 0ff315d0, %l7 = 000000004124e2c4, %asi = 80
	swapa	[%i4+0x028]%asi,%l7	! %l7 = 000000000ff315d0
!	Mem[0000000030181400] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%f22 = 15bda57c, Mem[0000000010041410] = ff660000
	sta	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = 15bda57c
!	Mem[0000000010101410] = 855600c3, %l2 = 0000000000005052
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 000000c3000000ff
!	%l1 = 000000000000ffa5, Mem[0000000010001404] = 00000072
	stb	%l1,[%i0+0x004]		! Mem[0000000010001404] = a5000072
!	%f11 = e42da7bc, Mem[0000000030081400] = ff0000ff
	sta	%f11,[%i2+%g0]0x89	! Mem[0000000030081400] = e42da7bc
!	Mem[0000000030041410] = b2f7b0f9, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 00000000b2f7b0f9
!	%l5 = 00000000000000ce, Mem[0000000010101410] = ff005685
	stha	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ce5685
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffff6bda, %l6 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l6	! %l6 = 00000000000000ff

p0_label_79:
!	Mem[0000000021800040] = fff759f3, %l2 = 00000000000000c3
	ldsba	[%o3+0x041]%asi,%l2	! %l2 = fffffffffffffff7
!	Mem[0000000010101408] = ff4e000000000000, %f18 = 0000007c 161728c3
	ldda	[%i4+%o4]0x80,%f18	! %f18 = ff4e0000 00000000
!	Mem[0000000010141410] = 35a29a77, %l4 = ffffffffffffff4e
	ldswa	[%i5+%o5]0x80,%l4	! %l4 = 0000000035a29a77
!	Mem[00000000201c0000] = 00cce51a, %l4 = 0000000035a29a77
	ldub	[%o0+0x001],%l4		! %l4 = 00000000000000cc
!	Mem[0000000030081408] = 00000000, %l4 = 00000000000000cc
	lduba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 8556ce00, %l5 = 00000000000000ce
	ldsba	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = 47d7ccff00000000, %l0 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l0	! %l0 = 47d7ccff00000000
!	Mem[0000000010041430] = 15bda57c, %l2 = fffffffffffffff7
	ldsw	[%i1+0x030],%l2		! %l2 = 0000000015bda57c
!	Mem[00000000300c1410] = ffccd7475c3964ce, %f6  = 00000000 000000ff
	ldda	[%i3+%o5]0x81,%f6 	! %f6  = ffccd747 5c3964ce
!	Starting 10 instruction Store Burst
!	%f13 = 7ca5bd15, Mem[0000000010181400] = ff007c8f
	sta	%f13,[%i6+%g0]0x80	! Mem[0000000010181400] = 7ca5bd15

p0_label_80:
!	Mem[0000000010041400] = ce91d1de, %l7 = 000000000ff315d0
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 000000ce000000ff
!	%l0 = 47d7ccff00000000, Mem[0000000010141410] = 35a29a77
	stwa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	Mem[0000000030041400] = ded191ce, %l6 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l6	! %l6 = 00000000ded191ce
!	Mem[0000000010041400] = ded191ff, %l2 = 0000000015bda57c
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 00000000ded191ff
!	%f22 = 15bda57c, Mem[0000000030101410] = 5d000000
	sta	%f22,[%i4+%o5]0x89	! Mem[0000000030101410] = 15bda57c
!	%l3 = 00000000b2f7b0f9, Mem[00000000100c1438] = e3f6032a, %asi = 80
	stba	%l3,[%i3+0x038]%asi	! Mem[00000000100c1438] = f9f6032a
!	Mem[0000000010181400] = 15bda57c, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 0000000015bda57c
!	%l3 = 00000000b2f7b0f9, Mem[0000000030141410] = 261627498556af77
	stxa	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000b2f7b0f9
!	%l4 = 0000000000000000, Mem[0000000010001410] = f9b0f7b2acb61bbb
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ce91d1de, %l0 = 47d7ccff00000000
	lduwa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ce91d1de

p0_label_81:
!	Mem[00000000100c1410] = b2f7b0f9, %l3 = 00000000b2f7b0f9
	ldsha	[%i3+%o5]0x88,%l3	! %l3 = ffffffffffffb0f9
!	Mem[0000000010081408] = ff1d8b0e00000000, %f26 = 9bbf11de 0e8b1dff
	ldda	[%i2+%o4]0x80,%f26	! %f26 = ff1d8b0e 00000000
!	Mem[0000000010101408] = ff4e000000000000, %f30 = ff000000 47d7ccff
	ldda	[%i4+%o4]0x80,%f30	! %f30 = ff4e0000 00000000
!	Mem[0000000030001400] = 00004a51, %l5 = 0000000015bda57c
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 0000000000004a51
!	Mem[0000000030141408] = 7ca575b5, %f30 = ff4e0000
	lda	[%i5+%o4]0x81,%f30	! %f30 = 7ca575b5
!	Mem[0000000010101410] = 00ce5685000000cc, %l3 = ffffffffffffb0f9
	ldxa	[%i4+%o5]0x80,%l3	! %l3 = 00ce5685000000cc
!	Mem[0000000030101410] = 7ca5bd15, %f14 = 4effffff
	lda	[%i4+%o5]0x81,%f14	! %f14 = 7ca5bd15
!	Mem[0000000030081410] = 00000000, %l2 = 00000000ded191ff
	lduba	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = 6bff3616, %l7 = 00000000000000ce
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 0000000000006bff
!	Starting 10 instruction Store Burst
!	%f6  = ffccd747, Mem[0000000030081410] = 00000000
	sta	%f6 ,[%i2+%o5]0x89	! Mem[0000000030081410] = ffccd747

p0_label_82:
!	%l0 = ce91d1de, %l1 = 0000ffa5, Mem[0000000030181410] = c64fc328 65e1e60b
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = ce91d1de 0000ffa5
!	Mem[0000000030141408] = b575a57c, %l3 = 00ce5685000000cc
	ldstuba	[%i5+%o4]0x89,%l3	! %l3 = 0000007c000000ff
!	%l1 = 000000000000ffa5, Mem[0000000030101410] = 15bda57c
	stwa	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000ffa5
!	%l0 = 00000000ce91d1de, Mem[0000000030041408] = ffff6bda
	stba	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = deff6bda
!	Mem[0000000030101410] = 0000ffa5, %l0 = 00000000ce91d1de
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 000000000000ffa5
!	Mem[0000000030181410] = ded191ce, %l0 = 000000000000ffa5
	swapa	[%i6+%o5]0x81,%l0	! %l0 = 00000000ded191ce
!	Mem[00000000201c0001] = 00cce51a, %l3 = 000000000000007c
	ldstub	[%o0+0x001],%l3		! %l3 = 000000cc000000ff
!	%l1 = 000000000000ffa5, Mem[0000000030141410] = 00000000
	stwa	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ffa5
!	Mem[0000000010101408] = ff4e0000, %l3 = 00000000000000cc
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 00000000ff4e0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ded191ce, %l5 = 0000000000004a51
	ldsha	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffffded1

p0_label_83:
!	Mem[0000000010181414] = 0000ff1d, %l4 = 0000000000000000
	lduha	[%i6+0x016]%asi,%l4	! %l4 = 000000000000ff1d
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010081400] = ffff6bda 47d7cccc ff1d8b0e 00000000
!	Mem[0000000010081410] = 00000000 ffccd747 99d9f9b0 4a11aaaa
!	Mem[0000000010081420] = 5fa7efb3 2bff4165 000000ff 0000ffa5
!	Mem[0000000010081430] = 74c8d83e 2431ffad 1d2817cb 1619b603
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000010081408] = ff1d8b0e00000000, %f14 = 7ca5bd15 2a03f6e3
	ldda	[%i2+%o4]0x80,%f14	! %f14 = ff1d8b0e 00000000
!	Mem[0000000030181408] = 161728c3, %l5 = ffffffffffffded1
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = ffffffffffffffc3
!	Mem[00000000211c0000] = 6bff3616, %l4 = 000000000000ff1d
	lduba	[%o2+0x000]%asi,%l4	! %l4 = 000000000000006b
!	%f2  = ccccd747 da6bffff, %f4  = bb1bb6ac
	fdtoi	%f2 ,%f4 		! %f4  = 80000000
!	Mem[0000000010141400] = 00000000af000024, %f14 = ff1d8b0e 00000000
	ldda	[%i5+%g0]0x88,%f14	! %f14 = 00000000 af000024
!	Mem[0000000010141410] = 00000000, %l6 = 00000000ded191ce
	ldswa	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = af000024, %l4 = 000000000000006b
	ldsha	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000024
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000006bff, Mem[00000000100c143d] = ffffff4e
	stb	%l7,[%i3+0x03d]		! Mem[00000000100c143c] = ffffff4e

p0_label_84:
!	%l2 = 0000000000000000, Mem[0000000010041400] = 7ca5bd15
	stwa	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%l4 = 0000000000000024, Mem[0000000010181410] = c8d97c8f
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000024
!	Mem[0000000010081400] = ffff6bda, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1408] = da6bffff, %l2 = 00000000000000ff
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 00000000da6bffff
!	%l2 = 00000000da6bffff, Mem[0000000030181408] = 161728c3
	stha	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 1617ffff
!	%l4 = 0000000000000024, Mem[0000000030001410] = 43a1c46e000000ff
	stxa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000000000024
!	%f12 = 00000000 7ca5bd15, %l0 = 00000000ded191ce
!	Mem[0000000010101428] = 4124e2c4d5267ddc
	add	%i4,0x028,%g1
	stda	%f12,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010101428] = 4124e2c400000000
!	%l6 = 00000000, %l7 = 00006bff, Mem[0000000010041408] = 00000000 ccccd747
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 00006bff
!	%l1 = 000000000000ffa5, Mem[0000000030041410] = 00000000
	stwa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000ffa5
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = 15bda57c, %l4 = 0000000000000024
	lduwa	[%i3+0x030]%asi,%l4	! %l4 = 0000000015bda57c

p0_label_85:
!	Mem[0000000010141400] = af000024, %l6 = 0000000000000000
	ldsba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000024
!	Mem[0000000010141400] = af000024, %l3 = 00000000ff4e0000
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000024
!	Mem[0000000030081410] = 47d7ccff, %l6 = 0000000000000024
	ldsha	[%i2+%o5]0x81,%l6	! %l6 = 00000000000047d7
!	Mem[0000000010081408] = 0e8b1dff, %l4 = 0000000015bda57c
	ldswa	[%i2+%o4]0x88,%l4	! %l4 = 000000000e8b1dff
!	Mem[0000000010001400] = ce00958b, %l2 = 00000000da6bffff
	lduha	[%i0+%g0]0x80,%l2	! %l2 = 000000000000ce00
!	Mem[0000000010101404] = 00000000, %l2 = 000000000000ce00
	lduwa	[%i4+0x004]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000218000c0] = dde1f22b, %l3 = 0000000000000024
	ldsba	[%o3+0x0c1]%asi,%l3	! %l3 = ffffffffffffffe1
!	Mem[0000000010001410] = 00000000, %l7 = 0000000000006bff
	ldsba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001438] = 7fedd978, %f4  = 80000000
	ld	[%i0+0x038],%f4 	! %f4 = 7fedd978
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = da6bffde, %l7 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l7	! %l7 = 000000de000000ff

p0_label_86:
!	%l5 = ffffffffffffffc3, Mem[0000000010001400] = 720000a58b9500ce
	stxa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffffffffffc3
!	%f12 = 00000000 7ca5bd15, Mem[0000000010041400] = 00000000 00000000
	stda	%f12,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 7ca5bd15
!	%l0 = ded191ce, %l1 = 0000ffa5, Mem[0000000010041408] = 00000000 00006bff
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = ded191ce 0000ffa5
!	%l3 = ffffffffffffffe1, Mem[00000000201c0000] = 00ffe51a
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = ffe1e51a
!	Mem[00000000100c1408] = ff000000, %l6 = 00000000000047d7
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000010181434] = 0186ec93, %asi = 80
	stwa	%l2,[%i6+0x034]%asi	! Mem[0000000010181434] = 00000000
!	%l0 = 00000000ded191ce, Mem[00000000100c1408] = ff000000
	stha	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 91ce0000
!	Mem[0000000010101400] = ce91d1de, %l5 = ffffffffffffffc3
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 000000ce000000ff
!	Mem[0000000021800180] = 50ffa73c, %l7 = 00000000000000de
	ldstub	[%o3+0x180],%l7		! %l7 = 00000050000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffccd747, %l6 = 00000000000000ff
	ldsha	[%i2+%o5]0x89,%l6	! %l6 = ffffffffffffd747

p0_label_87:
!	Mem[0000000030101410] = ded191ce, %l7 = 0000000000000050
	lduha	[%i4+%o5]0x81,%l7	! %l7 = 000000000000ded1
!	Mem[0000000021800040] = fff759f3, %l6 = ffffffffffffd747
	ldsha	[%o3+0x040]%asi,%l6	! %l6 = fffffffffffffff7
!	Mem[0000000030141400] = a044c8d9, %l7 = 000000000000ded1
	ldswa	[%i5+%g0]0x89,%l7	! %l7 = ffffffffa044c8d9
!	Mem[0000000030001410] = 2400000000000000, %f2  = ccccd747 da6bffff
	ldda	[%i0+%o5]0x81,%f2 	! %f2  = 24000000 00000000
!	Mem[000000001014140c] = 00280028, %l7 = ffffffffa044c8d9
	lduwa	[%i5+0x00c]%asi,%l7	! %l7 = 0000000000280028
!	Mem[0000000030181400] = ff0000ff, %l1 = 000000000000ffa5
	lduba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l5 = 00000000000000ce
	lduba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 15bda57c, %l7 = 0000000000280028
	ldsba	[%i1+%o5]0x88,%l7	! %l7 = 000000000000007c
!	Mem[0000000010001408] = 00cebd1500000072, %f26 = 000000ff 0000ffa5
	ldda	[%i0+%o4]0x80,%f26	! %f26 = 00cebd15 00000072
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffe1, Mem[00000000100c1410] = f9b0f7b2acb61bbb
	stxa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffffffffffe1

p0_label_88:
!	%l2 = 00000000, %l3 = ffffffe1, Mem[0000000010041400] = 7ca5bd15 00000000
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 ffffffe1
!	%f22 = 99d9f9b0 4a11aaaa, Mem[0000000010101408] = 000000cc 00000000
	stda	%f22,[%i4+%o4]0x80	! Mem[0000000010101408] = 99d9f9b0 4a11aaaa
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%f10 = 8fed6b77 e42da7bc, Mem[0000000030141410] = a5ff0000 b2f7b0f9
	stda	%f10,[%i5+%o5]0x81	! Mem[0000000030141410] = 8fed6b77 e42da7bc
!	%l2 = 00000000, %l3 = ffffffe1, Mem[0000000010181400] = 00000000 ffffffff
	stda	%l2,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000 ffffffe1
!	%l6 = fffffff7, %l7 = 0000007c, Mem[0000000010141400] = af000024 00000000
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = fffffff7 0000007c
!	%l0 = ded191ce, %l1 = 000000ff, Mem[0000000010041410] = 15bda57c bb1bb6ac
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = ded191ce 000000ff
!	Mem[0000000010101438] = 35ab3bd17c2e8980, %l5 = 0000000000000000, %l1 = 00000000000000ff
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 35ab3bd17c2e8980
!	%f13 = 7ca5bd15, Mem[0000000010001414] = 00000000
	sta	%f13,[%i0+0x014]%asi	! Mem[0000000010001414] = 7ca5bd15
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l1 = 35ab3bd17c2e8980
	lduba	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_89:
!	Mem[0000000010101404] = 00000000, %l0 = 00000000ded191ce
	lduha	[%i4+0x004]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = ffffffffffffffe1, %f28 = 74c8d83e 2431ffad
	ldda	[%i3+%o5]0x80,%f28	! %f28 = ffffffff ffffffe1
!	Mem[0000000010041424] = cae4514a, %l1 = 0000000000000000
	ldsha	[%i1+0x024]%asi,%l1	! %l1 = ffffffffffffcae4
!	Mem[00000000100c1430] = 15bda57c00000000, %f26 = 00cebd15 00000072
	ldda	[%i3+0x030]%asi,%f26	! %f26 = 15bda57c 00000000
!	Mem[0000000010041410] = 000000ffded191ce, %f22 = 99d9f9b0 4a11aaaa
	ldda	[%i1+%o5]0x88,%f22	! %f22 = 000000ff ded191ce
!	Mem[0000000030001408] = de9f5250ffffbd15, %l0 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l0	! %l0 = de9f5250ffffbd15
!	Mem[0000000010141418] = ffffffff 69f207b2, %l0 = ffffbd15, %l1 = ffffcae4
	ldd	[%i5+0x018],%l0		! %l0 = 00000000ffffffff 0000000069f207b2
!	Mem[0000000030101400] = 7c000000, %l1 = 0000000069f207b2
	lduwa	[%i4+%g0]0x81,%l1	! %l1 = 000000007c000000
!	Mem[00000000100c1410] = ffffffff, %l1 = 000000007c000000
	lduwa	[%i3+%o5]0x80,%l1	! %l1 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00000000, %l4 = 000000000e8b1dff
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff

p0_label_90:
!	%l0 = ffffffff, %l1 = ffffffff, Mem[00000000100c1408] = 91ce0000 47d7cccc
	std	%l0,[%i3+%o4]		! Mem[00000000100c1408] = ffffffff ffffffff
!	Mem[0000000030041410] = 0000ffa5, %l7 = 000000000000007c
	swapa	[%i1+%o5]0x81,%l7	! %l7 = 000000000000ffa5
!	Mem[0000000010141400] = f7ffffff, %l7 = 000000000000ffa5
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 000000f7000000ff
!	%l1 = 00000000ffffffff, Mem[00000000100c1404] = 00000000, %asi = 80
	stwa	%l1,[%i3+0x004]%asi	! Mem[00000000100c1404] = ffffffff
!	%l2 = 00000000, %l3 = ffffffe1, Mem[0000000030101410] = ce91d1de ff000000
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 ffffffe1
!	Mem[000000001004143c] = ffffff4e, %l4 = 0000000000000000
	ldstub	[%i1+0x03c],%l4		! %l4 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (17)
!	%l0 = 00000000ffffffff, Mem[0000000010081418] = 99d9f9b04a11aaaa, %asi = 80
	stxa	%l0,[%i2+0x018]%asi	! Mem[0000000010081418] = 00000000ffffffff
!	%f28 = ffffffff ffffffe1, Mem[00000000100c1400] = ce91d1de ffffffff
	stda	%f28,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffff ffffffe1
!	Mem[0000000010001420] = 551575b5, %l2 = 0000000000000000
	swap	[%i0+0x020],%l2		! %l2 = 00000000551575b5
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000ce, %l2 = 00000000551575b5
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ce

p0_label_91:
!	Mem[0000000030141410] = 8fed6b77, %l0 = 00000000ffffffff
	lduwa	[%i5+%o5]0x81,%l0	! %l0 = 000000008fed6b77
!	Mem[00000000218001c0] = ff774442, %l3 = ffffffffffffffe1
	lduha	[%o3+0x1c0]%asi,%l3	! %l3 = 000000000000ff77
!	Mem[00000000100c1410] = ffffffffffffffe1, %f30 = 1d2817cb 1619b603
	ldda	[%i3+%o5]0x80,%f30	! %f30 = ffffffff ffffffe1
!	Mem[0000000021800100] = da77b18b, %l6 = fffffffffffffff7
	lduba	[%o3+0x101]%asi,%l6	! %l6 = 0000000000000077
!	Mem[0000000030141408] = ffa575b5 c4e22441, %l6 = 00000077, %l7 = 000000f7
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 00000000ffa575b5 00000000c4e22441
!	Mem[000000001000142c] = 64bbdd5a, %l2 = 00000000000000ce
	ldsba	[%i0+0x02f]%asi,%l2	! %l2 = 000000000000005a
!	Mem[0000000010081428] = 000000ff0000ffa5, %l0 = 000000008fed6b77
	ldx	[%i2+0x028],%l0		! %l0 = 000000ff0000ffa5
!	Mem[0000000010101408] = aaaa114ab0f9d999, %f14 = 00000000 af000024
	ldda	[%i4+%o4]0x88,%f14	! %f14 = aaaa114a b0f9d999
!	Mem[0000000010101400] = ff91d1de, %l1 = 00000000ffffffff
	ldsba	[%i4+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = e42da7bc, %l3 = 000000000000ff77
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 000000bc000000ff

p0_label_92:
!	Mem[00000000100c1428] = bca72de4776bed8f, %l5 = 0000000000000000, %l5 = 0000000000000000
	add	%i3,0x28,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = bca72de4776bed8f
!	%l7 = 00000000c4e22441, Mem[0000000010081438] = 1d2817cb1619b603, %asi = 80
	stxa	%l7,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000000c4e22441
!	%l3 = 00000000000000bc, Mem[0000000010181400] = 00000000
	stha	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000bc
!	%f18 = ff1d8b0e 00000000, Mem[0000000010141408] = 000000ce 28002800
	stda	%f18,[%i5+%o4]0x88	! Mem[0000000010141408] = ff1d8b0e 00000000
!	%l4 = 00000000000000ff, Mem[0000000010081410] = ff000000ffccd747
	stxa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000000000ff
!	Mem[0000000030101400] = 7c000000, %l7 = 00000000c4e22441
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 0000007c000000ff
!	Mem[0000000010081410] = 00000000, %l1 = ffffffffffffffff
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = b575a5ff, %l5 = bca72de4776bed8f
	swapa	[%i5+%o4]0x89,%l5	! %l5 = 00000000b575a5ff
!	Mem[0000000010081408] = ff1d8b0e, %l4 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 776bed8f, %l1 = 0000000000000000
	lduba	[%i5+%o5]0x89,%l1	! %l1 = 000000000000008f

p0_label_93:
!	Mem[0000000010001430] = ae37e6b8, %l4 = 00000000000000ff
	ldsh	[%i0+0x030],%l4		! %l4 = ffffffffffffae37
!	Mem[0000000010041410] = ce91d1de, %l2 = 000000000000005a
	lduh	[%i1+0x012],%l2		! %l2 = 000000000000d1de
!	Mem[0000000030001408] = de9f5250ffffbd15, %l3 = 00000000000000bc
	ldxa	[%i0+%o4]0x81,%l3	! %l3 = de9f5250ffffbd15
!	Mem[0000000010181400] = bc000000ffffffe1, %l7 = 000000000000007c
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = bc000000ffffffe1
!	Mem[0000000030081408] = 000000cd00000000, %f16 = ffff6bda 47d7cccc
	ldda	[%i2+%o4]0x89,%f16	! %f16 = 000000cd 00000000
!	Mem[0000000010181400] = bc000000, %l4 = ffffffffffffae37
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 000000000000bc00
!	Mem[00000000300c1408] = 4c134c405515757c, %f26 = 15bda57c 00000000
	ldda	[%i3+%o4]0x89,%f26	! %f26 = 4c134c40 5515757c
!	Mem[0000000030001410] = 00000024, %f0  = 00000000
	lda	[%i0+%o5]0x89,%f0 	! %f0 = 00000024
!	Mem[0000000030001400] = 7ca5bd15, %l7 = bc000000ffffffe1
	lduha	[%i0+%g0]0x81,%l7	! %l7 = 0000000000007ca5
!	Starting 10 instruction Store Burst
!	%f10 = 8fed6b77 e42da7bc, %l1 = 000000000000008f
!	Mem[0000000010141400] = ffffffff7c000000
	stda	%f10,[%i5+%l1]ASI_PST32_P ! Mem[0000000010141400] = 8fed6b77e42da7bc

p0_label_94:
!	%l1 = 000000000000008f, Mem[0000000030101408] = af008b0e
	stha	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 008f8b0e
!	%l3 = de9f5250ffffbd15, Mem[0000000010101400] = 00000000ded191ff
	stxa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = de9f5250ffffbd15
!	Mem[0000000030181410] = 0000ffa5, %l7 = 0000000000007ca5
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%f12 = 00000000 7ca5bd15, Mem[00000000100c1408] = ffffffff ffffffff
	stda	%f12,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 7ca5bd15
!	%l1 = 000000000000008f, Mem[000000001014143f] = abd6bfd6, %asi = 80
	stba	%l1,[%i5+0x03f]%asi	! Mem[000000001014143c] = abd6bf8f
!	Mem[0000000030041410] = 0000007c, %l2 = 000000000000d1de
	ldstuba	[%i1+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000218000c0] = dde1f22b, %l1 = 000000000000008f
	ldstub	[%o3+0x0c0],%l1		! %l1 = 000000dd000000ff
!	Mem[00000000300c1408] = 5515757c, %l0 = 000000ff0000ffa5
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 000000005515757c
!	%l2 = 0000000000000000, Mem[0000000010181408] = 4effffffffffffff
	stxa	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 0000ffa5, %l2 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 000000000000ffa5

p0_label_95:
!	Mem[00000000100c1408] = 7ca5bd15, %l6 = 00000000ffa575b5
	lduha	[%i3+%o4]0x88,%l6	! %l6 = 000000000000bd15
!	Mem[000000001018143c] = 0000005d, %l3 = de9f5250ffffbd15
	lduwa	[%i6+0x03c]%asi,%l3	! %l3 = 000000000000005d
!	Mem[0000000030181408] = 1617ffff, %l3 = 000000000000005d
	ldswa	[%i6+%o4]0x89,%l3	! %l3 = 000000001617ffff
!	Mem[0000000010081418] = 00000000 ffffffff, %l6 = 0000bd15, %l7 = 00000000
	ldd	[%i2+0x018],%l6		! %l6 = 0000000000000000 00000000ffffffff
!	Mem[0000000010181410] = 1dff0000 24000000, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 0000000024000000 000000001dff0000
!	Mem[0000000030041410] = ff00007c, %l2 = 000000000000ffa5
	ldsha	[%i1+%o5]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030041408] = ccccd747 da6bffff, %l6 = 24000000, %l7 = 1dff0000
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 00000000da6bffff 00000000ccccd747
!	Mem[0000000010081420] = 5fa7efb32bff4165, %f6  = ffccd747 5c3964ce
	ldda	[%i2+0x020]%asi,%f6 	! %f6  = 5fa7efb3 2bff4165
!	Mem[0000000021800000] = 4babfc74, %l5 = 00000000b575a5ff
	ldsh	[%o3+%g0],%l5		! %l5 = 0000000000004bab
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 7ca5bd15, %l6 = 00000000da6bffff
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 000000007ca5bd15

p0_label_96:
!	Mem[0000000030101408] = 0e8b8f00, %l7 = 00000000ccccd747
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 000000000e8b8f00
!	%l5 = 0000000000004bab, Mem[00000000211c0000] = 6bff3616
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 4bab3616
!	%l3 = 000000001617ffff, Mem[0000000010141400] = 8fed6b77
	stba	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = ffed6b77
!	%l5 = 0000000000004bab, Mem[00000000300c1408] = a5ff0000404c134c
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000004bab
!	%l3 = 000000001617ffff, Mem[000000001008140c] = 00000000, %asi = 80
	stha	%l3,[%i2+0x00c]%asi	! Mem[000000001008140c] = ffff0000
!	%l6 = 000000007ca5bd15, Mem[0000000010101400] = 15bdffff50529fde
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000007ca5bd15
!	Mem[0000000010041434] = 00000000, %l6 = 000000007ca5bd15, %asi = 80
	swapa	[%i1+0x034]%asi,%l6	! %l6 = 0000000000000000
!	%l4 = 000000000000bc00, Mem[0000000020800041] = 505212f0
	stb	%l4,[%o1+0x041]		! Mem[0000000020800040] = 500012f0
!	Mem[0000000030141408] = 776bed8f, %l3 = 000000001617ffff
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 00000000776bed8f
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff0000ff, %l3 = 00000000776bed8f
	ldsha	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff

p0_label_97:
!	Mem[0000000010181408] = 00000000, %l1 = 00000000000000dd
	ldsba	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = ffe1e51a, %l5 = 0000000000004bab
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = ffffffffffffffe1
!	Mem[00000000100c1438] = f9f6032a, %l6 = 0000000000000000
	ldsba	[%i3+0x03a]%asi,%l6	! %l6 = 0000000000000003
!	Mem[0000000010081408] = 0000ffff 0e8b1dff, %l4 = 0000bc00, %l5 = ffffffe1
	ldda	[%i2+%o4]0x88,%l4	! %l4 = 000000000e8b1dff 000000000000ffff
!	Mem[0000000010101400] = 00000000, %l0 = 000000005515757c
	lduwa	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = ffffffff000000ff, %l5 = 000000000000ffff
	ldx	[%i2+%o5],%l5		! %l5 = ffffffff000000ff
!	Mem[0000000010141400] = 776bedff, %l2 = ffffffffffffff00
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = ffffffffffffedff
!	Mem[0000000030041410] = bb1bb6ac7c0000ff, %f4  = 7fedd978 b2f7b0f9
	ldda	[%i1+%o5]0x89,%f4 	! %f4  = bb1bb6ac 7c0000ff
!	Mem[0000000010081414] = 000000ff, %l2 = ffffffffffffedff
	lduha	[%i2+0x016]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = ffffffff, %l7 = 000000000e8b8f00
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 000000ff000000ff

p0_label_98:
!	%f4  = bb1bb6ac 7c0000ff, Mem[0000000030041400] = ff000000 00000000
	stda	%f4 ,[%i1+%g0]0x81	! Mem[0000000030041400] = bb1bb6ac 7c0000ff
!	Mem[00000000100c1400] = ffffffff, %l4 = 000000000e8b1dff
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	%l6 = 0000000000000003, Mem[0000000030001408] = 50529fde
	stha	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 50520003
!	Mem[0000000010081400] = da6bffff, %l2 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l2	! %l2 = 00000000da6bffff
!	Mem[0000000030001410] = 24000000, %l1 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 0000000024000000
!	Mem[0000000010001434] = 929501af, %l3 = 000000ff, %l3 = 000000ff
	add	%i0,0x34,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 00000000929501af
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000000000, %asi = 80
	swapa	[%i5+0x008]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = ff0000ff, %l6 = 0000000000000003
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000ff0000ff
!	%f16 = 000000cd 00000000 ff1d8b0e 00000000
!	%f20 = 00000000 ffccd747 000000ff ded191ce
!	%f24 = 5fa7efb3 2bff4165 4c134c40 5515757c
!	%f28 = ffffffff ffffffe1 ffffffff ffffffe1
	stda	%f16,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	Starting 10 instruction Load Burst
!	Mem[000000001014140c] = 0e8b1dff, %l4 = 00000000000000ff
	ldsba	[%i5+0x00c]%asi,%l4	! %l4 = 000000000000000e

p0_label_99:
!	Mem[0000000010181400] = 000000bc, %l5 = ffffffff000000ff
	lduha	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000bc
!	%l6 = 00000000ff0000ff, imm = fffffffffffff24c, %l4 = 000000000000000e
	or	%l6,-0xdb4,%l4		! %l4 = fffffffffffff2ff
!	Mem[0000000020800040] = 500012f0, %l2 = 00000000da6bffff
	lduha	[%o1+0x040]%asi,%l2	! %l2 = 0000000000005000
!	Mem[0000000010041400] = 00000000 e1ffffff, %l0 = 00000000, %l1 = 24000000
	ldd	[%i1+%g0],%l0		! %l0 = 0000000000000000 00000000e1ffffff
!	Mem[0000000030041400] = bb1bb6ac7c0000ff, %f4  = bb1bb6ac 7c0000ff
	ldda	[%i1+%g0]0x81,%f4 	! %f4  = bb1bb6ac 7c0000ff
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010081410] = ffffffff, %f7  = 2bff4165
	lda	[%i2+%o5]0x88,%f7 	! %f7 = ffffffff
!	Mem[0000000010141424] = 00000000, %l4 = fffffffffffff2ff
	ldub	[%i5+0x026],%l4		! %l4 = 0000000000000000
!	Mem[00000000100c1410] = ffffffff, %l7 = 00000000000000ff
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030081400] = 00000000, %l6 = 00000000ff0000ff
	ldswa	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00005000, %l3 = 929501af, Mem[0000000030141408] = ffff1716 c4e22441
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00005000 929501af

p0_label_100:
!	%f28 = ffffffff ffffffe1, Mem[0000000030041410] = ff00007c acb61bbb
	stda	%f28,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffff ffffffe1
!	%l1 = 00000000e1ffffff, Mem[0000000030181410] = a5ff00ff
	stwa	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = e1ffffff
!	Mem[0000000030141410] = 8fed6b77, %l7 = 000000000000ffff
	ldstuba	[%i5+%o5]0x81,%l7	! %l7 = 0000008f000000ff
!	%l1 = 00000000e1ffffff, Mem[0000000030041408] = da6bffff
	stba	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = da6bffff
!	%l4 = 0000000000000000, Mem[000000001004141c] = 00af0000, %asi = 80
	stwa	%l4,[%i1+0x01c]%asi	! Mem[000000001004141c] = 00000000
!	Mem[0000000030001410] = 00000000, %l0 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800001] = ffff7920, %l0 = 0000000000000000
	ldstub	[%o1+0x001],%l0		! %l0 = 000000ff000000ff
!	%l4 = 00000000, %l5 = 000000bc, Mem[0000000010001408] = 00cebd15 00000072
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 000000bc
!	Mem[0000000010001410] = 00000000, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = bb1bb6ac, %l3 = 00000000929501af
	ldswa	[%i1+%g0]0x81,%l3	! %l3 = ffffffffbb1bb6ac

p0_label_101:
!	Mem[0000000010181400] = bc000000, %l7 = 000000000000008f
	lduh	[%i6+%g0],%l7		! %l7 = 000000000000bc00
!	Mem[00000000100c1400] = ffffffff, %l7 = 000000000000bc00
	ldsha	[%i3+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181410] = 000000240000ff1d, %f2  = 24000000 00000000
	ldda	[%i6+%o5]0x80,%f2 	! %f2  = 00000024 0000ff1d
!	Mem[00000000100c1408] = 15bda57c, %l7 = ffffffffffffffff
	lduha	[%i3+%o4]0x80,%l7	! %l7 = 00000000000015bd
!	Mem[0000000030001400] = ffff6bda, %f8  = 4a51e4ca
	lda	[%i0+%g0]0x89,%f8 	! %f8 = ffff6bda
!	Mem[00000000300c1400] = cc000000, %f15 = b0f9d999
	lda	[%i3+%g0]0x89,%f15	! %f15 = cc000000
!	Mem[0000000030101410] = 00000000, %l5 = 00000000000000bc
	lduba	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = ffffffff, %l4 = 0000000000000000
	lduha	[%i3+%g0]0x88,%l4	! %l4 = 000000000000ffff
!	Mem[00000000100c1428] = bca72de4, %l6 = 0000000000000000
	lduwa	[%i3+0x028]%asi,%l6	! %l6 = 00000000bca72de4
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = da6bffff, %l6 = 00000000bca72de4
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 00000000da6bffff

p0_label_102:
!	%l1 = 00000000e1ffffff, Mem[0000000010041410] = ded191ce
	stha	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = ded1ffff
!	%l0 = 00000000000000ff, Mem[0000000030041408] = e42da7bc
	stwa	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff
!	Mem[0000000010141431] = 33831619, %l6 = 00000000da6bffff
	ldstub	[%i5+0x031],%l6		! %l6 = 00000083000000ff
!	%f24 = 5fa7efb3 2bff4165, Mem[00000000100c1408] = 15bda57c 00000000
	stda	%f24,[%i3+%o4]0x80	! Mem[00000000100c1408] = 5fa7efb3 2bff4165
!	%l4 = 000000000000ffff, Mem[00000000100c1410] = ffffffffffffffe1
	stxa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000000000ffff
!	%f12 = 00000000 7ca5bd15, %l5 = 0000000000000000
!	Mem[0000000010181430] = 94652c7300000000
	add	%i6,0x030,%g1
	stda	%f12,[%g1+%l5]ASI_PST32_P ! Mem[0000000010181430] = 94652c7300000000
!	%l3 = ffffffffbb1bb6ac, Mem[0000000010081438] = 00000000, %asi = 80
	stwa	%l3,[%i2+0x038]%asi	! Mem[0000000010081438] = bb1bb6ac
!	%l4 = 000000000000ffff, Mem[0000000030141410] = 776bedff
	stwa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ffff
!	%l2 = 0000000000005000, Mem[00000000100c1400] = ffffffff
	stwa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00005000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffffffff, %l1 = 00000000e1ffffff
	lduwa	[%i2+%o5]0x80,%l1	! %l1 = 00000000ffffffff

p0_label_103:
!	Mem[0000000030001408] = 03005250, %l7 = 00000000000015bd
	ldsha	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000300
!	Mem[0000000030081410] = 00000000 ffccd747, %l4 = 0000ffff, %l5 = 00000000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000ffccd747 0000000000000000
!	Mem[00000000300c1410] = 47d7ccff, %l2 = 0000000000005000
	lduba	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000020800000] = ffff7920, %l0 = 00000000000000ff
	ldub	[%o1+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[00000000300c1400] = cc000000, %l3 = ffffffffbb1bb6ac
	ldsha	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141420] = eeb260e900000000, %f10 = 8fed6b77 e42da7bc
	ldd	[%i5+0x020],%f10	! %f10 = eeb260e9 00000000
!	Mem[00000000100c143c] = ffffff4e, %l2 = 00000000000000ff
	ldsba	[%i3+0x03d]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001400] = ffff6bda, %l6 = 0000000000000083
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = 0000000000006bda
!	Mem[0000000030001410] = 00000000 00000000, %l6 = 00006bda, %l7 = 00000300
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffccd747, Mem[0000000010041410] = ffffd1deff000000
	stx	%l4,[%i1+%o5]		! Mem[0000000010041410] = 00000000ffccd747

p0_label_104:
!	%l5 = 0000000000000000, Mem[00000000201c0000] = ffe1e51a
	stb	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 00e1e51a
!	%f19 = 00000000, Mem[0000000030041400] = bb1bb6ac
	sta	%f19,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Mem[0000000010101410] = 8556ce00, %l6 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l6	! %l6 = 000000008556ce00
!	%f10 = eeb260e9, Mem[0000000010101408] = b0f9d999
	sta	%f10,[%i4+%o4]0x88	! Mem[0000000010101408] = eeb260e9
!	%l4 = 00000000ffccd747, Mem[00000000100c1410] = 00000000
	stwa	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffccd747
!	%l1 = 00000000ffffffff, %l6 = 000000008556ce00, %l0 = 00000000000000ff
	xor	%l1,%l6,%l0		! %l0 = 000000007aa931ff
!	%l2 = ffffffffffffffff, Mem[0000000010181410] = 000000240000ff1d
	stxa	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffffffffffff
!	%f4  = bb1bb6ac 7c0000ff, Mem[0000000010141400] = 776bedff bca72de4
	stda	%f4 ,[%i5+%g0]0x88	! Mem[0000000010141400] = bb1bb6ac 7c0000ff
!	%f30 = ffffffff ffffffe1, %l0 = 000000007aa931ff
!	Mem[0000000030101410] = 00000000e1ffffff
	add	%i4,0x010,%g1
	stda	%f30,[%g1+%l0]ASI_PST16_S ! Mem[0000000030101410] = ffffffffffffffe1
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 1617ffff, %l4 = 00000000ffccd747
	lduha	[%i6+%o4]0x89,%l4	! %l4 = 000000000000ffff

p0_label_105:
!	Mem[0000000010141408] = 00000000, %l0 = 000000007aa931ff
	ldsh	[%i5+0x00a],%l0		! %l0 = 0000000000000000
!	Mem[0000000010041414] = ffccd747, %l2 = ffffffffffffffff
	lduh	[%i1+0x016],%l2		! %l2 = 000000000000d747
!	Mem[0000000030141408] = 00500000, %l3 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 0000000000500000
!	Mem[0000000030041410] = ffffffff, %f21 = ffccd747
	lda	[%i1+%o5]0x89,%f21	! %f21 = ffffffff
!	Mem[0000000010081420] = 5fa7efb3, %l5 = 0000000000000000
	lduw	[%i2+0x020],%l5		! %l5 = 000000005fa7efb3
!	Mem[0000000010181428] = e1cb281e, %l2 = 000000000000d747
	ldsha	[%i6+0x028]%asi,%l2	! %l2 = ffffffffffffe1cb
!	Mem[0000000010181438] = c8683373 0000005d, %l2 = ffffe1cb, %l3 = 00500000
	ldda	[%i6+0x038]%asi,%l2	! %l2 = 00000000c8683373 000000000000005d
!	Mem[0000000030181408] = 1617ffff, %f5  = 7c0000ff
	lda	[%i6+%o4]0x89,%f5 	! %f5 = 1617ffff
!	Mem[0000000010041400] = ffffffe100000000, %l1 = 00000000ffffffff
	ldxa	[%i1+%g0]0x88,%l1	! %l1 = ffffffe100000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ffffffff, %l0 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 00000000ffffffff

p0_label_106:
!	%l0 = 00000000ffffffff, Mem[0000000010101410] = 00000000
	stba	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = ff000000
!	%l6 = 000000008556ce00, Mem[000000001014143c] = abd6bf8f
	stw	%l6,[%i5+0x03c]		! Mem[000000001014143c] = 8556ce00
!	%l2 = c8683373, %l3 = 0000005d, Mem[0000000010141408] = 00000000 ff1d8b0e
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = c8683373 0000005d
!	Mem[00000000211c0000] = 4bab3616, %l4 = 000000000000ffff
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 0000004b000000ff
!	Mem[0000000010081400] = ff000000, %l2 = 00000000c8683373
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010041408] = ce91d1dea5ff0000, %l3 = 000000000000005d, %l7 = 0000000000000000
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = ce91d1dea5ff0000
!	Mem[00000000100c1400] = 00005000, %l3 = 000000000000005d
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030081400] = 00000000
	stha	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[00000000211c0000] = ffab3616, %l5 = 000000005fa7efb3
	ldstub	[%o2+%g0],%l5		! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = d9c844a0, %l2 = 00000000000000ff
	ldsha	[%i5+%g0]0x81,%l2	! %l2 = ffffffffffffd9c8

p0_label_107:
!	Mem[0000000030081400] = 00000000, %l1 = ffffffe100000000
	ldsha	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 0000ffff 0e8b1dff, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 000000000e8b1dff 000000000000ffff
!	Mem[0000000030181410] = e1ffffff, %l5 = 00000000000000ff
	lduha	[%i6+%o5]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[00000000100c1434] = 00000000, %l2 = ffffffffffffd9c8
	ldub	[%i3+0x036],%l2		! %l2 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l7 = ce91d1dea5ff0000
	ldsba	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = bc000000, %l1 = 000000000000ffff
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = ffffffffffffffbc
!	Mem[0000000010041408] = ded191ce, %l1 = ffffffffffffffbc
	lduha	[%i1+%o4]0x88,%l1	! %l1 = 00000000000091ce
!	Mem[0000000030141400] = a044c8d9, %l2 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l2	! %l2 = 00000000a044c8d9
!	Mem[0000000030041408] = 000000ff47d7cccc, %f14 = aaaa114a cc000000
	ldda	[%i1+%o4]0x81,%f14	! %f14 = 000000ff 47d7cccc
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 0000ffff, %l4 = 000000000000004b
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 000000ff000000ff

p0_label_108:
!	%f0  = 00000024 ded191ce, %l5 = 000000000000ffff
!	Mem[00000000100c1408] = 5fa7efb32bff4165
	add	%i3,0x008,%g1
	stda	%f0,[%g1+%l5]ASI_PST32_P ! Mem[00000000100c1408] = 00000024ded191ce
!	%l1 = 00000000000091ce, Mem[0000000030181410] = 0000ffa5e1ffffff
	stxa	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000091ce
!	Mem[0000000010081408] = ff1d8b0e, %l1 = 00000000000091ce
	swapa	[%i2+%o4]0x80,%l1	! %l1 = 00000000ff1d8b0e
!	%l5 = 000000000000ffff, Mem[0000000010041400] = 00000000
	stha	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000ffff
!	%f2  = 00000024 0000ff1d, Mem[0000000030141400] = a044c8d9 af000000
	stda	%f2 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000024 0000ff1d
!	%f6  = 5fa7efb3 ffffffff, Mem[0000000010041408] = ce91d1de a5ff0000
	stda	%f6 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 5fa7efb3 ffffffff
!	%l5 = 000000000000ffff, Mem[0000000010181400] = bc000000
	stwa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000ffff
!	Mem[0000000030141400] = 0000ff1d, %l5 = 000000000000ffff
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 0000001d000000ff
!	Mem[00000000300c1408] = 00000000, %l5 = 000000000000001d
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = a46a000b1617ffff, %l4 = 00000000000000ff
	ldxa	[%i6+%o4]0x89,%l4	! %l4 = a46a000b1617ffff

p0_label_109:
!	Mem[00000000100c1400] = 005000ff, %l7 = 0000000000000000
	ldsha	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001400] = ffffffff ffffffc3, %l2 = a044c8d9, %l3 = 00000000
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 00000000ffffffc3 00000000ffffffff
!	Mem[0000000010081410] = 00000000, %f20 = 00000000
	lda	[%i2+%o5]0x80,%f20	! %f20 = 00000000
!	Mem[0000000030001410] = 00000000, %l2 = 00000000ffffffc3
	ldsba	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081420] = 5fa7efb3 2bff4165, %l6 = 8556ce00, %l7 = 000000ff
	ldda	[%i2+0x020]%asi,%l6	! %l6 = 000000005fa7efb3 000000002bff4165
!	Mem[0000000010141400] = 7c0000ff, %l0 = 000000000e8b1dff
	ldswa	[%i5+%g0]0x88,%l0	! %l0 = 000000007c0000ff
!	Mem[0000000021800080] = 653fd437, %l2 = 0000000000000000
	ldub	[%o3+0x081],%l2		! %l2 = 000000000000003f
!	Mem[0000000030181410] = ce91000000000000, %l6 = 000000005fa7efb3
	ldxa	[%i6+%o5]0x81,%l6	! %l6 = ce91000000000000
!	Mem[0000000020800040] = 500012f0, %l4 = a46a000b1617ffff
	ldsb	[%o1+0x040],%l4		! %l4 = 0000000000000050
!	Starting 10 instruction Store Burst
!	%f6  = 5fa7efb3 ffffffff, Mem[00000000100c1408] = 24000000 ce91d1de
	stda	%f6 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 5fa7efb3 ffffffff

p0_label_110:
!	%l3 = 00000000ffffffff, Mem[0000000010001400] = ffffffffffffffc3
	stxa	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000ffffffff
!	%f24 = 5fa7efb3 2bff4165, Mem[0000000010041400] = 0000ffff ffffffe1
	stda	%f24,[%i1+%g0]0x88	! Mem[0000000010041400] = 5fa7efb3 2bff4165
!	Mem[0000000010101408] = e960b2ee, %l4 = 0000000000000050
	ldstuba	[%i4+%o4]0x80,%l4	! %l4 = 000000e9000000ff
!	Mem[0000000010041400] = 2bff4165, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 00000065000000ff
!	%l6 = 00000000, %l7 = 2bff4165, Mem[0000000010081410] = 00000000 ff000000
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 2bff4165
!	Mem[000000001008143c] = c4e22441, %l6 = ce91000000000000
	swap	[%i2+0x03c],%l6		! %l6 = 00000000c4e22441
!	Mem[000000001010140e] = 4a11aaaa, %l2 = 000000000000003f
	ldstuba	[%i4+0x00e]%asi,%l2	! %l2 = 000000aa000000ff
!	Mem[00000000201c0001] = 00e1e51a, %l1 = 00000000ff1d8b0e
	ldstub	[%o0+0x001],%l1		! %l1 = 000000e1000000ff
!	Mem[0000000020800041] = 500012f0, %l3 = 00000000ffffffff
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 15bdffff50520003, %l6 = 00000000c4e22441
	ldxa	[%i0+%o4]0x89,%l6	! %l6 = 15bdffff50520003

p0_label_111:
!	Mem[0000000030001410] = 00000000, %l1 = 00000000000000e1
	ldsba	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1438] = f9f6032a, %l6 = 15bdffff50520003
	ldsh	[%i3+0x03a],%l6		! %l6 = 000000000000032a
!	Mem[0000000010181400] = e1ffffffffff0000, %f12 = 00000000 7ca5bd15
	ldda	[%i6+%g0]0x88,%f12	! %f12 = e1ffffff ffff0000
!	Mem[0000000010141410] = 00000000, %l2 = 00000000000000aa
	ldsba	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = ffff6bda, %l7 = 000000002bff4165
	ldsha	[%i0+%g0]0x89,%l7	! %l7 = 0000000000006bda
!	Mem[0000000030141410] = 0000ffff, %l7 = 0000000000006bda
	ldsha	[%i5+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181408] = 00000000, %l7 = ffffffffffffffff
	lduha	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081420] = 5fa7efb3, %l4 = 00000000000000e9
	ldsw	[%i2+0x020],%l4		! %l4 = 000000005fa7efb3
!	Mem[0000000030101410] = e1ffffffffffffff, %f30 = ffffffff ffffffe1
	ldda	[%i4+%o5]0x89,%f30	! %f30 = e1ffffff ffffffff
!	Starting 10 instruction Store Burst
!	%f30 = e1ffffff, Mem[0000000030181410] = 000091ce
	sta	%f30,[%i6+%o5]0x89	! Mem[0000000030181410] = e1ffffff

p0_label_112:
!	%f25 = 2bff4165, Mem[0000000010041408] = 5fa7efb3
	sta	%f25,[%i1+%o4]0x80	! Mem[0000000010041408] = 2bff4165
!	%f5  = 1617ffff, Mem[0000000030001410] = 00000000
	sta	%f5 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 1617ffff
!	%l6 = 0000032a, %l7 = 00000000, Mem[0000000010101418] = ff04ff64 3483ff92
	stda	%l6,[%i4+0x018]%asi	! Mem[0000000010101418] = 0000032a 00000000
!	%l0 = 000000007c0000ff, Mem[0000000010141408] = 733368c8
	stwa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 7c0000ff
!	Mem[0000000010041434] = 7ca5bd15, %l7 = 00000000, %l6 = 0000032a
	add	%i1,0x34,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 000000007ca5bd15
!	%f14 = 000000ff 47d7cccc, Mem[0000000010141410] = 00000000 ffff0000
	stda	%f14,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff 47d7cccc
!	%l4 = 000000005fa7efb3, Mem[0000000030141408] = 00500000
	stwa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 5fa7efb3
!	%l4 = 000000005fa7efb3, Mem[0000000010101432] = 00000047, %asi = 80
	stha	%l4,[%i4+0x032]%asi	! Mem[0000000010101430] = 0000efb3
!	Mem[0000000010001408] = 00000000, %l5 = 0000000000000065
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041404] = b3efa75f, %l2 = 0000000000000000
	ldsw	[%i1+0x004],%l2		! %l2 = ffffffffb3efa75f

p0_label_113:
!	Mem[0000000030041408] = ff000000, %l6 = 000000007ca5bd15
	ldsba	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ffab3616, %l1 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 000000000000ffab
!	Mem[0000000010001410] = 000000007ca5bd15, %l1 = 000000000000ffab
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = 000000007ca5bd15
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 7c0000ff, %l3 = 0000000000000000
	lduba	[%i5+0x00a]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 000000ff 47d7cccc, %l2 = b3efa75f, %l3 = 00000000
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000ff 0000000047d7cccc
!	Mem[0000000030041410] = ffffffffffffffe1, %l1 = 000000007ca5bd15
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffffe1
!	Mem[0000000010101424] = ce0741a8, %l2 = 00000000000000ff
	ldsw	[%i4+0x024],%l2		! %l2 = ffffffffce0741a8
!	Mem[00000000100c1400] = ff005000, %l4 = 000000005fa7efb3
	ldsb	[%i3+%g0],%l4		! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101438] = 35ab3bd17c2e8980, %l4 = ffffffffffffffff, %l3 = 0000000047d7cccc
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 35ab3bd17c2e8980

p0_label_114:
!	%l1 = ffffffffffffffe1, Mem[0000000010081408] = 000091ce
	stw	%l1,[%i2+%o4]		! Mem[0000000010081408] = ffffffe1
!	Mem[00000000300c1408] = 1d000000, %l1 = ffffffffffffffe1
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%f24 = 5fa7efb3 2bff4165, %l6 = 0000000000000000
!	Mem[00000000300c1438] = a97712629f6b69b2
	add	%i3,0x038,%g1
	stda	%f24,[%g1+%l6]ASI_PST8_S ! Mem[00000000300c1438] = a97712629f6b69b2
!	%l2 = ffffffffce0741a8, Mem[0000000010181408] = 00000000
	stba	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000a8
!	Mem[000000001010140c] = 4a11ffaa, %l3 = 35ab3bd17c2e8980, %asi = 80
	swapa	[%i4+0x00c]%asi,%l3	! %l3 = 000000004a11ffaa
!	%f29 = ffffffe1, Mem[00000000100c1400] = 005000ff
	sta	%f29,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffe1
!	%l2 = ffffffffce0741a8, Mem[00000000300c1408] = ff00001d00004bab
	stxa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffffce0741a8
!	%l2 = ce0741a8, %l3 = 4a11ffaa, Mem[0000000030001408] = 03005250 ffffbd15
	stda	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = ce0741a8 4a11ffaa
!	%l4 = ffffffffffffffff, Mem[0000000020800000] = ffff7920
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = ffff7920
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffccd7475c3964ce, %f10 = eeb260e9 00000000
	ldda	[%i3+%o5]0x81,%f10	! %f10 = ffccd747 5c3964ce

p0_label_115:
!	Mem[0000000030141410] = bca72de4 0000ffff, %l2 = ce0741a8, %l3 = 4a11ffaa
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 000000000000ffff 00000000bca72de4
!	Mem[00000000100c1408] = ffffffff, %l1 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081408] = 000000000e8b1dff, %l3 = 00000000bca72de4
	ldxa	[%i2+%o4]0x81,%l3	! %l3 = 000000000e8b1dff
!	Mem[0000000010001408] = 000000ff, %l6 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101410] = ffffffff, %l1 = ffffffffffffffff
	lduha	[%i4+%o5]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[00000000211c0000] = ffab3616, %l6 = 00000000000000ff
	ldub	[%o2+0x001],%l6		! %l6 = 00000000000000ab
!	Mem[0000000010001410] = 00000000 7ca5bd15, %l2 = 0000ffff, %l3 = 0e8b1dff
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000 000000007ca5bd15
!	Mem[0000000010181418] = 5800b9391c365040, %l3 = 000000007ca5bd15
	ldx	[%i6+0x018],%l3		! %l3 = 5800b9391c365040
!	Mem[00000000100c1400] = e1ffffff, %f19 = 00000000
	lda	[%i3+%g0]0x80,%f19	! %f19 = e1ffffff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030041408] = 000000ff47d7cccc
	stxa	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000000000000

p0_label_116:
!	%l1 = 000000000000ffff, Mem[00000000300c1410] = ce64395c47d7ccff
	stxa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000000000ffff
!	%f31 = ffffffff, Mem[0000000010001410] = 00000000
	sta	%f31,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffff
!	Mem[000000001008140c] = ffff0000, %l7 = 00000000, %l3 = 1c365040
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000ffff0000
!	%l6 = 000000ab, %l7 = 00000000, Mem[00000000100c1428] = bca72de4 776bed8f
	std	%l6,[%i3+0x028]		! Mem[00000000100c1428] = 000000ab 00000000
!	%l6 = 00000000000000ab, Mem[0000000010081400] = ccccd747000000ff
	stxa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000000000ab
!	%l0 = 000000007c0000ff, Mem[0000000030081400] = 00000000
	stwa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 7c0000ff
!	%l0 = 000000007c0000ff, Mem[0000000030001408] = a84107ce
	stwa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 7c0000ff
!	%l5 = 0000000000000000, Mem[0000000030141410] = ffff0000e42da7bc
	stxa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000000
!	Mem[0000000010181410] = ffffffff, %l4 = ffffffffffffffff
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff00007c, %l7 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff

p0_label_117:
!	Mem[0000000030041410] = ffffffffffffffe1, %l7 = 00000000000000ff
	ldxa	[%i1+%o5]0x81,%l7	! %l7 = ffffffffffffffe1
!	Mem[0000000030141408] = 5fa7efb3, %l4 = 00000000ffffffff
	lduha	[%i5+%o4]0x89,%l4	! %l4 = 000000000000efb3
!	Mem[00000000211c0000] = ffab3616, %l4 = 000000000000efb3
	lduba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000020800000] = ffff7920, %l6 = 00000000000000ab
	ldsb	[%o1+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030101408] = 47d7cccc, %l7 = ffffffffffffffe1
	ldsba	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000047
!	Mem[0000000030081410] = ffccd747, %l4 = 00000000000000ff
	ldsha	[%i2+%o5]0x89,%l4	! %l4 = ffffffffffffd747
!	Mem[000000001004142c] = 776bed8f, %l6 = ffffffffffffffff
	ldsh	[%i1+0x02e],%l6		! %l6 = ffffffffffffed8f
!	Mem[0000000010181408] = a800000000000000, %f14 = 000000ff 47d7cccc
	ldda	[%i6+%o4]0x80,%f14	! %f14 = a8000000 00000000
!	Mem[0000000010141424] = 00000000, %l0 = 000000007c0000ff
	lduh	[%i5+0x026],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ff

p0_label_118:
!	Mem[0000000010101410] = 000000ff, %l7 = 0000000000000047
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	%f29 = ffffffe1, %f11 = 5c3964ce, %f29 = ffffffe1
	fsubs	%f29,%f11,%f29		! %f29 = ffffffe1
!	%l4 = ffffd747, %l5 = 00000000, Mem[00000000100c1410] = ffccd747 ffff0000
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffd747 00000000
!	%f2  = 00000024 0000ff1d, Mem[0000000030041410] = ffffffff ffffffe1
	stda	%f2 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000024 0000ff1d
!	Mem[0000000030041410] = 24000000, %l1 = 000000000000ffff
	ldstuba	[%i1+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l4 = ffffffffffffd747, Mem[00000000201c0000] = 00ffe51a
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = d747e51a
!	Mem[0000000010141400] = 7c0000ff, %l4 = ffffffffffffd747
	swapa	[%i5+%g0]0x88,%l4	! %l4 = 000000007c0000ff
!	Mem[0000000010101410] = 000000ff, %l3 = 00000000ffff0000
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	%l4 = 7c0000ff, %l5 = 00000000, Mem[00000000100c1410] = ffffd747 00000000
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 7c0000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffff0000, %f7  = ffffffff
	lda	[%i3+%o5]0x81,%f7 	! %f7 = ffff0000

p0_label_119:
!	Mem[0000000010001410] = ffffffff7ca5bd15, %l4 = 000000007c0000ff
	ldxa	[%i0+%o5]0x80,%l4	! %l4 = ffffffff7ca5bd15
!	Mem[0000000030041400] = ff00007c000000ff, %f0  = 00000024 ded191ce
	ldda	[%i1+%g0]0x89,%f0 	! %f0  = ff00007c 000000ff
!	Mem[0000000010041404] = b3efa75f, %l3 = 00000000000000ff
	ldub	[%i1+0x005],%l3		! %l3 = 00000000000000ef
!	Mem[0000000010041408] = ffffffff6541ff2b, %l1 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l1	! %l1 = ffffffff6541ff2b
!	Mem[0000000010101410] = ff000000, %l7 = 00000000000000ff
	lduba	[%i4+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041410] = 00000000 ffccd747, %l4 = 7ca5bd15, %l5 = 00000000
	ldda	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000 00000000ffccd747
!	Mem[00000000100c1414] = 00000000, %l4 = 0000000000000000
	lduha	[%i3+0x014]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = e1ffffff, %l2 = 0000000000000000
	lduha	[%i6+%o5]0x89,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030001410] = 1617ffff 00000000, %l4 = 00000000, %l5 = ffccd747
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 000000001617ffff 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010141410] = 000000ff47d7cccc
	stxa	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000

p0_label_120:
!	Mem[00000000100c1400] = e1ffffffffffffe1, %l6 = ffffffffffffed8f, %l0 = 0000000000000000
	casxa	[%i3]0x80,%l6,%l0	! %l0 = e1ffffffffffffe1
!	%l2 = 000000000000ffff, Mem[0000000010101400] = 00000000
	stwa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000ffff
!	%l0 = ffffffe1, %l1 = 6541ff2b, Mem[0000000030001400] = da6bffff 00000077
	stda	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffe1 6541ff2b
!	%l5 = 0000000000000000, Mem[0000000010081420] = 5fa7efb32bff4165
	stx	%l5,[%i2+0x020]		! Mem[0000000010081420] = 0000000000000000
!	Mem[0000000010101400] = ffff0000, %l3 = 00000000000000ef
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 00000000ffff0000
!	%l7 = 00000000000000ff, Mem[000000001018140b] = a8000000
	stb	%l7,[%i6+0x00b]		! Mem[0000000010181408] = a80000ff
!	%l4 = 000000001617ffff, Mem[0000000010141408] = ff00007c
	stwa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 1617ffff
!	%f18 = ff1d8b0e e1ffffff, Mem[0000000010081400] = 000000ab 00000000
	stda	%f18,[%i2+%g0]0x88	! Mem[0000000010081400] = ff1d8b0e e1ffffff
!	%f16 = 000000cd 00000000, %l7 = 00000000000000ff
!	Mem[0000000030101410] = ffffffffffffffe1
	add	%i4,0x010,%g1
	stda	%f16,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030101410] = 00000000cd000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = e1ffffff, %l4 = 000000001617ffff
	ldsha	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffe1ff

p0_label_121:
!	Mem[0000000030041408] = 00000000, %l2 = 000000000000ffff
	ldsba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = 0000ffffffffffe1, %f20 = 00000000 ffffffff
	ldda	[%i6+%g0]0x80,%f20	! %f20 = 0000ffff ffffffe1
!	Mem[0000000030181400] = 00000003, %l0 = e1ffffffffffffe1
	ldswa	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000003
!	Mem[0000000010081400] = ffffffe1, %l1 = ffffffff6541ff2b
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[000000001000141c] = da6bffff, %f1  = 000000ff
	lda	[%i0+0x01c]%asi,%f1 	! %f1 = da6bffff
!	Mem[0000000030181400] = 03000000, %f16 = 000000cd
	lda	[%i6+%g0]0x81,%f16	! %f16 = 03000000
!	Mem[0000000030041408] = 00000000, %l3 = 00000000ffff0000
	lduwa	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010041400] = ff41ff2b b3efa75f 2bff4165 ffffffff
!	Mem[0000000010041410] = 00000000 ffccd747 ff000000 00000000
!	Mem[0000000010041420] = ce64395c cae4514a bca72de4 776bed8f
!	Mem[0000000010041430] = 15bda57c 7ca5bd15 e3f6032a ffffff4e
	ldda	[%i1]ASI_BLK_PL,%f16	! Block Load from 0000000010041400
!	Mem[0000000030081410] = 47d7ccff, %l0 = 0000000000000003
	lduwa	[%i2+%o5]0x81,%l0	! %l0 = 0000000047d7ccff
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffed8f, Mem[00000000100c1400] = e1ffffff
	stha	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = ed8fffff

p0_label_122:
!	Mem[0000000030181400] = 03000000, %l0 = 0000000047d7ccff
	ldstuba	[%i6+%g0]0x81,%l0	! %l0 = 00000003000000ff
!	%f0  = ff00007c da6bffff, %l0 = 0000000000000003
!	Mem[0000000010181420] = 63c3092547e764a1
	add	%i6,0x020,%g1
	stda	%f0,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010181420] = ffff092547e764a1
!	%l3 = 0000000000000000, Mem[0000000030101400] = ff000000
	stwa	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Mem[0000000010181408] = a80000ff, %l1 = 00000000000000ff
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 00000000a80000ff
!	%l3 = 0000000000000000, Mem[0000000010001428] = c29fba2964bbdd5a, %asi = 80
	stxa	%l3,[%i0+0x028]%asi	! Mem[0000000010001428] = 0000000000000000
!	%l4 = ffffffffffffe1ff, Mem[0000000030081400] = 7c0000ff
	stba	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = ff0000ff
!	%f14 = a8000000 00000000, %l1 = 00000000a80000ff
!	Mem[0000000010141400] = 47d7ffffacb61bbb
	stda	%f14,[%i5+%l1]ASI_PST16_PL ! Mem[0000000010141400] = 00000000000000a8
	membar	#Sync			! Added by membar checker (20)
!	%l2 = 0000000000000000, Mem[0000000010041404] = b3efa75f
	stw	%l2,[%i1+0x004]		! Mem[0000000010041404] = 00000000
!	%l6 = ffffed8f, %l7 = 000000ff, Mem[0000000010141430] = 33ff1619 f9b0f7b2
	std	%l6,[%i5+0x030]		! Mem[0000000010141430] = ffffed8f 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 000000ff00000000, %f0  = ff00007c da6bffff
	ldd	[%i6+%o4],%f0 		! %f0  = 000000ff 00000000

p0_label_123:
!	Mem[0000000030081408] = ff1d8b0e00000000, %f14 = a8000000 00000000
	ldda	[%i2+%o4]0x89,%f14	! %f14 = ff1d8b0e 00000000
!	Mem[0000000010081400] = ff1d8b0e e1ffffff, %l4 = ffffe1ff, %l5 = 00000000
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 00000000e1ffffff 00000000ff1d8b0e
!	Mem[00000000100c1428] = 000000ab00000000, %l3 = 0000000000000000
	ldxa	[%i3+0x028]%asi,%l3	! %l3 = 000000ab00000000
!	Mem[0000000010041408] = 2bff4165, %l3 = 000000ab00000000
	ldswa	[%i1+%o4]0x80,%l3	! %l3 = 000000002bff4165
!	Mem[0000000010001410] = ffffffff, %l3 = 000000002bff4165
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081400] = ffffffe10e8b1dff, %l1 = 00000000a80000ff, %l1 = 00000000a80000ff
	casxa	[%i2]0x80,%l1,%l1	! %l1 = ffffffe10e8b1dff
!	Mem[0000000030041400] = 000000ff, %f27 = e42da7bc
	lda	[%i1+%g0]0x89,%f27	! %f27 = 000000ff
!	Mem[0000000010181408] = 000000ff, %l0 = 0000000000000003
	lduba	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800040] = 50ff12f0, %l5 = 00000000ff1d8b0e
	ldsba	[%o1+0x041]%asi,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = ffff7920, %l7 = 00000000000000ff
	ldstub	[%o1+0x001],%l7		! %l7 = 000000ff000000ff

p0_label_124:
!	Mem[000000001018143c] = 0000005d, %l7 = 00000000000000ff
	ldstub	[%i6+0x03c],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010001414] = 7ca5bd15, %l0 = 0000000000000000
	swap	[%i0+0x014],%l0		! %l0 = 000000007ca5bd15
!	Mem[000000001004141d] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+0x01d]%asi,%l2	! %l2 = 00000000000000ff
!	%f4  = bb1bb6ac 1617ffff, %l3 = ffffffffffffffff
!	Mem[0000000010141410] = 0000000000000000
	add	%i5,0x010,%g1
	stda	%f4,[%g1+%l3]ASI_PST16_P ! Mem[0000000010141410] = bb1bb6ac1617ffff
!	Mem[0000000010041410] = 00000000, %l2 = 0000000000000000
	lduwa	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%f11 = 5c3964ce, Mem[0000000030181410] = e1ffffff
	sta	%f11,[%i6+%o5]0x89	! Mem[0000000030181410] = 5c3964ce
!	%l2 = 0000000000000000, Mem[00000000100c1400] = ed8fffff
	stha	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000ffff
!	%f0  = 000000ff 00000000, Mem[0000000030041410] = ff000024 0000ff1d
	stda	%f0 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff 00000000
!	%f6  = 5fa7efb3 ffff0000, Mem[0000000030181408] = 1617ffff a46a000b
	stda	%f6 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 5fa7efb3 ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffff1716, %l4 = 00000000e1ffffff
	ldsha	[%i5+%o4]0x80,%l4	! %l4 = ffffffffffffffff

p0_label_125:
!	Mem[0000000010181400] = 0000ffff ffffffe1, %l4 = ffffffff, %l5 = ffffffff
	ldda	[%i6+%g0]0x80,%l4	! %l4 = 000000000000ffff 00000000ffffffe1
!	Mem[0000000030101408] = ccccd747, %l7 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l7	! %l7 = ffffffffffffd747
!	Mem[0000000010181400] = ffff0000, %l5 = 00000000ffffffe1
	lduba	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = ffff0000 24000000 b3efa75f 929501af
!	Mem[0000000030141410] = 00000000 00000000 0655ce22 f1f9f50e
!	Mem[0000000030141420] = 0be6e165 e42da7bc 45136133 4d5f2023
!	Mem[0000000030141430] = 6d56f925 b8f8c401 82690000 77af5685
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[00000000300c1408] = a84107ceffffffff, %f4  = bb1bb6ac 1617ffff
	ldda	[%i3+%o4]0x89,%f4 	! %f4  = a84107ce ffffffff
!	Mem[0000000010001410] = ffffffff, %f3  = 0000ff1d
	lda	[%i0+%o5]0x80,%f3 	! %f3 = ffffffff
!	Mem[0000000010181400] = ffff0000, %l7 = ffffffffffffd747
	ldsha	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = ffffffff, %l2 = 0000000000000000
	ldswa	[%i6+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001408] = bc000000000000ff, %f12 = e1ffffff ffff0000
	ldda	[%i0+%o4]0x88,%f12	! %f12 = bc000000 000000ff
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffed8f, Mem[0000000030041408] = 0000000000000000
	stxa	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffffffffed8f

p0_label_126:
!	%f4  = a84107ce ffffffff, Mem[0000000030101410] = 00000000 cd000000
	stda	%f4 ,[%i4+%o5]0x81	! Mem[0000000030101410] = a84107ce ffffffff
!	%l2 = ffffffffffffffff, Mem[0000000010041410] = 00000000
	stha	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = ffff0000
!	%l1 = ffffffe10e8b1dff, Mem[0000000030101408] = ccccd747
	stba	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = ccccd7ff
!	Mem[0000000030101408] = ffd7cccc, %l5 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%f2  = 00000024 ffffffff, %l7 = 0000000000000000
!	Mem[0000000030081438] = e1ffffffffffffff
	add	%i2,0x038,%g1
	stda	%f2,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030081438] = e1ffffffffffffff
!	Mem[0000000010041400] = 2bff41ff, %l2 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030181400] = ff000000, %l2 = 00000000000000ff
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000030081408] = 00000000
	stha	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	%f16 = ffff0000 24000000 b3efa75f 929501af
!	%f20 = 00000000 00000000 0655ce22 f1f9f50e
!	%f24 = 0be6e165 e42da7bc 45136133 4d5f2023
!	%f28 = 6d56f925 b8f8c401 82690000 77af5685
	stda	%f16,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ffff1716, %l3 = ffffffffffffffff
	lduba	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000016

p0_label_127:
!	Mem[0000000030041408] = ffffffff, %f6  = 5fa7efb3
	lda	[%i1+%o4]0x81,%f6 	! %f6 = ffffffff
!	Mem[0000000010001420] = 00000000 26162749, %l2 = 000000ff, %l3 = 00000016
	ldd	[%i0+0x020],%l2		! %l2 = 0000000000000000 0000000026162749
!	Mem[00000000201c0000] = d747e51a, %l1 = ffffffe10e8b1dff
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffd747
!	Mem[0000000010081408] = e1ffffff, %f12 = bc000000
	lda	[%i2+%o4]0x88,%f12	! %f12 = e1ffffff
!	Mem[0000000030001410] = 1617ffff00000000, %f14 = ff1d8b0e 00000000
	ldda	[%i0+%o5]0x81,%f14	! %f14 = 1617ffff 00000000
!	Mem[0000000030001400] = ffffffe1, %l4 = 000000000000ffff
	ldsha	[%i0+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	%l4 = ffffffffffffffff, imm = ffffffffffffff75, %l4 = ffffffffffffffff
	sub	%l4,-0x08b,%l4		! %l4 = 000000000000008a
!	Mem[0000000030001410] = 00000000 ffff1716, %l2 = 00000000, %l3 = 26162749
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 00000000ffff1716 0000000000000000
!	Mem[0000000030041410] = 000000ff 00000000, %l6 = ffffed8f, %l7 = 00000000
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181438] = c8683373, %l5 = 000000ff, %l0 = 7ca5bd15
	add	%i6,0x38,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 00000000c8683373

p0_label_128:
!	%f6  = ffffffff ffff0000, Mem[0000000010181438] = c8683373 ff00005d
	std	%f6 ,[%i6+0x038]	! Mem[0000000010181438] = ffffffff ffff0000
!	%l5 = 00000000000000ff, Mem[0000000010041410] = ffff0000
	stba	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = ffff0000
!	%f1  = 00000000, Mem[0000000030101400] = 00000000
	sta	%f1 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%l1 = ffffffffffffd747, Mem[0000000020800040] = 50ff12f0, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = d74712f0
!	%f1  = 00000000, Mem[0000000010041408] = 6541ff2b
	sta	%f1 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000010081400] = ffffffe1, %l5 = 00000000000000ff
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%l0 = 00000000c8683373, Mem[0000000010081402] = ffffffe1
	sth	%l0,[%i2+0x002]		! Mem[0000000010081400] = ffff3373
!	%l4 = 000000000000008a, Mem[0000000030181408] = ffff0000
	stba	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = ffff008a
!	%l1 = ffffffffffffd747, Mem[0000000030041410] = ff000000
	stba	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = ff000047
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (21)
!	Mem[00000000100c1408] = ffffffff b3efa75f, %l4 = 0000008a, %l5 = 000000ff
	ldda	[%i3+0x008]%asi,%l4	! %l4 = 00000000ffffffff 00000000b3efa75f

p0_label_129:
!	Mem[0000000010101410] = cc000000000000ff, %f10 = ffccd747 5c3964ce
	ldda	[%i4+%o5]0x88,%f10	! %f10 = cc000000 000000ff
!	Mem[0000000010001438] = 7fedd978, %l4 = 00000000ffffffff
	ldsb	[%i0+0x03b],%l4		! %l4 = 0000000000000078
!	Mem[0000000010101410] = ff000000, %l5 = 00000000b3efa75f
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001410] = ffffffff, %f24 = 0be6e165
	lda	[%i0+%o5]0x80,%f24	! %f24 = ffffffff
!	Mem[0000000030081408] = ff000000, %l4 = 0000000000000078
	lduwa	[%i2+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010101410] = ff000000, %l4 = 00000000ff000000
	lduwa	[%i4+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1408] = ffffffff, %l1 = ffffffffffffd747
	lduwa	[%i3+%o4]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030001400] = e1ffffff, %l7 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = ffff1716acb61bbb, %l2 = 00000000ffff1716
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = ffff1716acb61bbb
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 0000ffff, %l0 = 00000000c8683373
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 000000ff000000ff

p0_label_130:
!	%f14 = 1617ffff 00000000, Mem[0000000010081400] = ffff3373 0e8b1dff
	std	%f14,[%i2+%g0]	! Mem[0000000010081400] = 1617ffff 00000000
!	Mem[0000000030101400] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i4+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%f0  = 000000ff 00000000 00000024 ffffffff
!	%f4  = a84107ce ffffffff ffffffff ffff0000
!	%f8  = ffff6bda 5c3964ce cc000000 000000ff
!	%f12 = e1ffffff 000000ff 1617ffff 00000000
	stda	%f0,[%i5]ASI_BLK_AIUP	! Block Store to 0000000010141400
!	%l0 = 00000000000000ff, Mem[0000000010001416] = 00000000
	sth	%l0,[%i0+0x016]		! Mem[0000000010001414] = 000000ff
!	Mem[0000000010101408] = eeb260ff, %l1 = 00000000ffffffff
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000eeb260ff
!	%f16 = ffff0000 24000000 b3efa75f 929501af
!	%f20 = 00000000 00000000 0655ce22 f1f9f50e
!	%f24 = ffffffff e42da7bc 45136133 4d5f2023
!	%f28 = 6d56f925 b8f8c401 82690000 77af5685
	stda	%f16,[%i2]ASI_COMMIT_P	! Block Store to 0000000010081400
!	Mem[0000000010041400] = ff41ff2b, %l1 = 00000000eeb260ff
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	%f1  = 00000000, Mem[0000000010141408] = 00000024
	st	%f1 ,[%i5+%o4]		! Mem[0000000010141408] = 00000000
!	%f8  = ffff6bda 5c3964ce, Mem[0000000010041408] = 00000000 ffffffff
	stda	%f8 ,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff6bda 5c3964ce
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff00007c, %l1 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l1	! %l1 = 00000000000000ff

p0_label_131:
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010141408] = 00000000, %l4 = 00000000ff000000
	ldsba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 5fa7efb3 ffffffff, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000ffffffff 000000005fa7efb3
!	Mem[0000000030081400] = ff0000ff, %l6 = 00000000000000ff
	lduba	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1408] = b3efa75f929501af, %l1 = 00000000000000ff
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = b3efa75f929501af
!	Mem[0000000010101408] = ffffffff, %l5 = 000000005fa7efb3
	lduha	[%i4+%o4]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010041410] = 47d7ccff0000ffff, %f20 = 00000000 00000000
	ldda	[%i1+%o5]0x88,%f20	! %f20 = 47d7ccff 0000ffff
!	Mem[0000000010101410] = 000000ff, %l3 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000020800040] = d74712f0, %l7 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = ffffffffffffd747
!	Mem[0000000030141408] = af0195925fa7efb3, %f26 = 45136133 4d5f2023
	ldda	[%i5+%o4]0x89,%f26	! %f26 = af019592 5fa7efb3
!	Starting 10 instruction Store Burst
!	%l2 = ffff1716acb61bbb, Mem[0000000010041410] = ffff0000
	stha	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 1bbb0000

p0_label_132:
!	Mem[000000001010141d] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i4+0x01d]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041410] = 0000bb1b, %l6 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 000000000000bb1b
!	%f12 = e1ffffff 000000ff, Mem[0000000010001408] = 000000ff bc000000
	stda	%f12,[%i0+%o4]0x88	! Mem[0000000010001408] = e1ffffff 000000ff
!	%l4 = 00000000ffffffff, Mem[0000000021800180] = ffffa73c
	sth	%l4,[%o3+0x180]		! Mem[0000000021800180] = ffffa73c
!	Mem[0000000010001408] = ff000000, %l2 = ffff1716acb61bbb
	swapa	[%i0+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	%l5 = 000000000000ffff, Mem[00000000100c140c] = b3efa75f, %asi = 80
	stba	%l5,[%i3+0x00c]%asi	! Mem[00000000100c140c] = ffefa75f
!	%f12 = e1ffffff 000000ff, Mem[00000000100c1400] = 0000ffff ffffffe1
	stda	%f12,[%i3+%g0]0x80	! Mem[00000000100c1400] = e1ffffff 000000ff
!	Mem[0000000030101400] = ff000000, %l6 = 000000000000bb1b
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%f2  = 00000024 ffffffff, Mem[0000000010101408] = ffffffff 80892e7c
	stda	%f2 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000024 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = 00000000, %l6 = 00000000000000ff
	ldsb	[%i0+0x020],%l6		! %l6 = 0000000000000000

p0_label_133:
!	Mem[0000000010141400] = 00000000ff000000, %l3 = 00000000000000ff
	ldxa	[%i5+%g0]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030101408] = ffd7cccc, %l6 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = ffffffffffffffd7
!	Mem[0000000030041408] = ffffffff, %l0 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001410] = 00000000ffff1716, %l2 = 00000000ff000000
	ldxa	[%i0+%o5]0x89,%l2	! %l2 = 00000000ffff1716
!	Mem[00000000100c1400] = ff000000ffffffe1, %f24 = ffffffff e42da7bc
	ldda	[%i3+%g0]0x88,%f24	! %f24 = ff000000 ffffffe1
!	Mem[0000000021800140] = 56535fa3, %l3 = 00000000ff000000
	ldsh	[%o3+0x140],%l3		! %l3 = 0000000000005653
!	Mem[0000000030181400] = ff000000, %l6 = ffffffffffffffd7
	lduba	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = ccccd7ff, %l4 = 00000000ffffffff
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 000000000000d7ff
!	Mem[0000000030141408] = 5fa7efb3, %l5 = 000000000000ffff
	ldsba	[%i5+%o4]0x89,%l5	! %l5 = ffffffffffffffb3
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = ffffffff, %l0 = ffffffff, %l5 = ffffffb3
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000ffffffff

p0_label_134:
!	Mem[0000000010081408] = 5fa7efb3, %l3 = 0000000000005653
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 000000b3000000ff
!	%f14 = 1617ffff, Mem[0000000030001400] = e1ffffff
	sta	%f14,[%i0+%g0]0x89	! Mem[0000000030001400] = 1617ffff
!	%l6 = 00000000000000ff, Mem[00000000211c0000] = ffab3616, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff3616
!	%l0 = ffffffffffffffff, Mem[0000000030081408] = 000000ff
	stwa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffff
!	%l3 = 00000000000000b3, Mem[0000000030101410] = a84107ceffffffff
	stxa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000000000b3
!	Mem[0000000030181400] = 000000ff, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%f10 = cc000000 000000ff, Mem[0000000010081428] = 45136133 4d5f2023
	stda	%f10,[%i2+0x028]%asi	! Mem[0000000010081428] = cc000000 000000ff
!	Mem[0000000010141408] = 00000000, %l2 = 00000000ffff1716
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%f14 = 1617ffff 00000000, Mem[0000000030001400] = ffff1716 6541ff2b
	stda	%f14,[%i0+%g0]0x81	! Mem[0000000030001400] = 1617ffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 8a00ffffb3efa75f, %f16 = ffff0000 24000000
	ldda	[%i6+%o4]0x81,%f16	! %f16 = 8a00ffff b3efa75f

p0_label_135:
!	Mem[0000000030181408] = 8a00ffffb3efa75f, %l4 = 000000000000d7ff
	ldxa	[%i6+%o4]0x81,%l4	! %l4 = 8a00ffffb3efa75f
!	Mem[0000000010141408] = ffffffff1617ffff, %f14 = 1617ffff 00000000
	ldda	[%i5+%o4]0x88,%f14	! %f14 = ffffffff 1617ffff
!	Mem[0000000010181430] = 94652c73, %l3 = 00000000000000b3
	lduba	[%i6+0x030]%asi,%l3	! %l3 = 0000000000000094
!	Mem[0000000030141408] = af0195925fa7efb3, %f4  = a84107ce ffffffff
	ldda	[%i5+%o4]0x89,%f4 	! %f4  = af019592 5fa7efb3
!	Mem[0000000010081424] = e42da7bc, %l0 = ffffffffffffffff
	lduba	[%i2+0x025]%asi,%l0	! %l0 = 000000000000002d
!	Mem[0000000010141400] = 00000000 ff000000, %l6 = 000000ff, %l7 = ffffd747
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000010141408] = ffff1716, %l1 = b3efa75f929501af
	lduh	[%i5+0x00a],%l1		! %l1 = 0000000000001716
!	Mem[0000000010041408] = 5c3964ce, %l2 = 0000000000000000
	lduba	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ce
!	Mem[0000000010041434] = 7ca5bd15, %l1 = 0000000000001716
	lduw	[%i1+0x034],%l1		! %l1 = 000000007ca5bd15
!	Starting 10 instruction Store Burst
!	Mem[0000000010041407] = 00000000, %l5 = 00000000ffffffff
	ldstuba	[%i1+0x007]%asi,%l5	! %l5 = 00000000000000ff

p0_label_136:
!	Mem[0000000030141410] = 00000000, %l1 = 000000007ca5bd15
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l5 = 0000000000000000, Mem[00000000300c1400] = 00000024
	stwa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010101408] = ffffffff, %l7 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010101411] = ff000000, %l1 = 0000000000000000
	ldstub	[%i4+0x011],%l1		! %l1 = 00000000000000ff
!	%l0 = 000000000000002d, Mem[00000000100c1410] = ff00007c
	stba	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 2d00007c
!	Mem[0000000010081408] = 5fa7efff, %l2 = 00000000000000ce
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[00000000211c0000] = 00ff3616, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00003616
!	%f6  = ffffffff ffff0000, Mem[00000000300c1410] = 00000000 00000000
	stda	%f6 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffff ffff0000
!	Mem[0000000010181408] = 000000ff, %l1 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000 ffff1716, %l0 = 0000002d, %l1 = 000000ff
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 00000000ffff1716 0000000000000000

p0_label_137:
!	Mem[0000000030081410] = ffccd747, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l1	! %l1 = ffffffffffccd747
!	Mem[0000000030101410] = b300000000000000, %f28 = 6d56f925 b8f8c401
	ldda	[%i4+%o5]0x89,%f28	! %f28 = b3000000 00000000
!	Mem[0000000010081408] = 5fa7efff, %l7 = 00000000000000ff
	lduba	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000020800040] = d74712f0, %l3 = 0000000000000094
	ldsb	[%o1+0x040],%l3		! %l3 = ffffffffffffffd7
!	Mem[0000000010041434] = 7ca5bd15, %l5 = 0000000000000000
	lduwa	[%i1+0x034]%asi,%l5	! %l5 = 000000007ca5bd15
!	Mem[0000000010101410] = ffff0000, %f17 = b3efa75f
	lda	[%i4+%o5]0x80,%f17	! %f17 = ffff0000
!	Mem[0000000010001418] = ccccd747da6bffff, %l3 = ffffffffffffffd7
	ldx	[%i0+0x018],%l3		! %l3 = ccccd747da6bffff
!	Mem[0000000010101408] = ffffffff24000000, %l5 = 000000007ca5bd15
	ldx	[%i4+%o4],%l5		! %l5 = ffffffff24000000
!	Mem[00000000211c0000] = 00003616, %l1 = ffffffffffccd747
	ldsb	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f28 = b3000000 00000000, Mem[00000000100c1408] = ffffffff ffefa75f
	std	%f28,[%i3+%o4]	! Mem[00000000100c1408] = b3000000 00000000

p0_label_138:
!	Mem[0000000030081400] = ff0000ff, %l0 = 00000000ffff1716
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 00000000ff0000ff
!	%l2 = 00000000000000ff, Mem[0000000030041408] = 8fedffffffffffff
	stxa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000000000ff
!	%f14 = ffffffff, Mem[0000000030181410] = ce64395c
	sta	%f14,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff
!	%l3 = ccccd747da6bffff, Mem[0000000010181410] = ffffffff
	stba	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffff
!	Mem[0000000010001410] = b3ffffff, %l7 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	%l6 = 00000000ff000000, Mem[0000000010101400] = 15bda57cef000000
	stxa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000ff000000
!	%l3 = ccccd747da6bffff, Mem[0000000010041410] = 000000ff
	stwa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = da6bffff
!	Mem[0000000010101400] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000030181410] = ffffffff
	stba	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff0000ff, %f16 = 8a00ffff
	lda	[%i4+%g0]0x80,%f16	! %f16 = ff0000ff

p0_label_139:
!	Mem[0000000030081400] = ffff1716, %l0 = 00000000ff0000ff
	lduha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000001716
!	Mem[0000000010001418] = ccccd747da6bffff, %f24 = ff000000 ffffffe1
	ldd	[%i0+0x018],%f24	! %f24 = ccccd747 da6bffff
!	Mem[00000000218000c0] = ffe1f22b, %l6 = 00000000ff000000
	ldsb	[%o3+0x0c0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010001408] = acb61bbb, %l0 = 0000000000001716
	ldsha	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffffacb6
!	Mem[0000000030001410] = 1617ffff, %l6 = ffffffffffffffff
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 000000001617ffff
!	Mem[0000000010101410] = ffff0000, %l0 = ffffffffffffacb6
	lduwa	[%i4+%o5]0x80,%l0	! %l0 = 00000000ffff0000
!	Mem[0000000010081400] = 0000ffff, %l3 = ccccd747da6bffff
	lduha	[%i2+%g0]0x88,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030101400] = ff00000000000072, %l1 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l1	! %l1 = ff00000000000072
!	Mem[0000000030181400] = 000000ff, %l7 = 00000000000000ff
	lduwa	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = ffff0000, %l1 = 00000072, Mem[0000000030081408] = ffffffff ff1d8b0e
	stda	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = ffff0000 00000072

p0_label_140:
!	%f6  = ffffffff ffff0000, %l4 = 8a00ffffb3efa75f
!	Mem[0000000010041410] = ffff6bdaffccd747
	add	%i1,0x010,%g1
	stda	%f6,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010041410] = 0000ffffffffffff
!	%l4 = 8a00ffffb3efa75f, Mem[0000000030141400] = ffff0000
	stwa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = b3efa75f
!	Mem[0000000010141400] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001400] = ffff1716, %l5 = ffffffff24000000
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 00000000ffff1716
!	Mem[0000000030101400] = ff000000, %l1 = ff00000000000072
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010141408] = 1617ffff, %l4 = 8a00ffffb3efa75f
	ldstuba	[%i5+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000021800181] = ffffa73c, %l1 = 00000000ff000000
	ldstuba	[%o3+0x181]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010141408] = 1617ffff, %l0 = 00000000ffff0000
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	%f0  = 000000ff 00000000, Mem[0000000030101408] = ccccd7ff 9bbf11de
	stda	%f0 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 8a00ffff, %l0 = 00000000000000ff
	ldswa	[%i6+%o4]0x81,%l0	! %l0 = ffffffff8a00ffff

p0_label_141:
!	Mem[0000000030181410] = ffffffff, %l4 = 00000000000000ff
	lduwa	[%i6+%o5]0x89,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010141408] = 1617ffff, %l2 = 00000000000000ff
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141400] = 5fa7efb3, %l6 = 000000001617ffff
	lduha	[%i5+%g0]0x89,%l6	! %l6 = 000000000000efb3
!	Mem[0000000010081408] = af019592 5fa7efff, %l0 = 8a00ffff, %l1 = 000000ff
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 000000005fa7efff 00000000af019592
!	Mem[0000000010141400] = 000000ff, %l1 = 00000000af019592
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181408] = 8a00ffff, %l4 = 00000000ffffffff
	lduha	[%i6+%o4]0x81,%l4	! %l4 = 0000000000008a00
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 000000005fa7efff
	setx	0xd9570ab84ccc9619,%g7,%l0 ! %l0 = d9570ab84ccc9619
!	%l1 = 00000000000000ff
	setx	0xb029924fd9e35f8c,%g7,%l1 ! %l1 = b029924fd9e35f8c
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d9570ab84ccc9619
	setx	0xaaa8742fc973bd90,%g7,%l0 ! %l0 = aaa8742fc973bd90
!	%l1 = b029924fd9e35f8c
	setx	0x5b71a9a87c694a7a,%g7,%l1 ! %l1 = 5b71a9a87c694a7a
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000030101400] = 00000072 00000072 00000000 ff000000
!	Mem[0000000030101410] = 00000000 000000b3 269f5250 de11bf9b
!	Mem[0000000030101420] = 973718fc 9735ac9a 8b5527da 549e2a30
!	Mem[0000000030101430] = 4124e2c4 b5751555 1ba8f2d6 69308b24
	ldda	[%i4]ASI_BLK_SL,%f0	! Block Load from 0000000030101400
!	Mem[0000000010081408] = ffefa75f929501af, %f16 = ff0000ff ffff0000
	ldda	[%i2+%o4]0x80,%f16	! %f16 = ffefa75f 929501af
!	Starting 10 instruction Store Burst
!	%l1 = 5b71a9a87c694a7a, Mem[0000000010041400] = ff41ff2b
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 7c694a7a

p0_label_142:
!	%l3 = 000000000000ffff, Mem[0000000010101408] = ffffffff
	stwa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000ffff
!	%l6 = 0000efb3, %l7 = 000000ff, Mem[0000000030181400] = 000000ff 72000000
	stda	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000efb3 000000ff
!	Mem[0000000010141408] = ffff1716, %l1 = 5b71a9a87c694a7a
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 00000000ffff1716
	membar	#Sync			! Added by membar checker (24)
!	%f20 = 47d7ccff 0000ffff, %l6 = 000000000000efb3
!	Mem[0000000030101408] = 00000000ff000000
	add	%i4,0x008,%g1
	stda	%f20,[%g1+%l6]ASI_PST8_S ! Mem[0000000030101408] = 4700ccffff00ffff
!	%l4 = 0000000000008a00, Mem[0000000010001410] = ffffffb3
	stha	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 8a00ffb3
!	%f8  = 9aac3597, Mem[0000000030181408] = ffff008a
	sta	%f8 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 9aac3597
!	Mem[00000000211c0001] = 00003616, %l6 = 000000000000efb3
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141410] = ce0741a8, %l0 = aaa8742fc973bd90
	lduha	[%i5+%o5]0x88,%l0	! %l0 = 00000000000041a8
!	Mem[0000000010181408] = 00000000, %l0 = 00000000000041a8
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000ff, %l5 = 00000000ffff1716
	ldsba	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_143:
!	Mem[0000000010181408] = ff000000, %l4 = 0000000000008a00
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = 0000ffffffffffe1, %f0  = 72000000 72000000
	ldda	[%i6+%g0]0x80,%f0 	! %f0  = 0000ffff ffffffe1
!	Mem[00000000300c1400] = 00000000 0000ffff af019592 5fa7efb3
!	Mem[00000000300c1410] = ffffffff ffff0000 0ef5f9f1 22ce5506
!	Mem[00000000300c1420] = bca72de4 65e1e60b 23205f4d 33611345
!	Mem[00000000300c1430] = 01c4f8b8 25f9566d 8556af77 00006982
	ldda	[%i3]ASI_BLK_SL,%f0	! Block Load from 00000000300c1400
!	Mem[0000000010101438] = 35ab3bd1, %l4 = 00000000000000ff
	lduw	[%i4+0x038],%l4		! %l4 = 0000000035ab3bd1
!	Mem[0000000030001408] = ff00007c4a11ffaa, %f20 = 47d7ccff 0000ffff
	ldda	[%i0+%o4]0x81,%f20	! %f20 = ff00007c 4a11ffaa
!	Mem[00000000300c1408] = af019592, %l0 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l0	! %l0 = 000000000000af01
!	Mem[0000000030001400] = 24000000, %l4 = 0000000035ab3bd1
	ldsha	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 00000000 ffccd747, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 00000000ffccd747 0000000000000000
!	Mem[0000000030181410] = ffffffff, %l4 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f26 = af019592 5fa7efb3, %l3 = 000000000000ffff
!	Mem[0000000030101418] = 269f5250de11bf9b
	add	%i4,0x018,%g1
	stda	%f26,[%g1+%l3]ASI_PST8_S ! Mem[0000000030101418] = af0195925fa7efb3

p0_label_144:
!	Mem[0000000010041410] = 0000ffff, %l7 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000ffccd747, Mem[0000000020800000] = ffff7920
	stb	%l6,[%o1+%g0]		! Mem[0000000020800000] = 47ff7920
!	%l6 = 00000000ffccd747, Mem[00000000201c0001] = d747e51a, %asi = 80
	stba	%l6,[%o0+0x001]%asi	! Mem[00000000201c0000] = d747e51a
!	%l5 = 0000000000000000, Mem[0000000010141408] = ffffffff7a4a697c
	stxa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	Mem[00000000100c1410] = 2d00007c, %l2 = ffffffffffffffff
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 000000002d00007c
!	%l3 = 000000000000ffff, Mem[0000000030001400] = 24000000
	stha	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 2400ffff
!	%l1 = 00000000ffff1716, Mem[0000000030181400] = b3ef0000
	stwa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = ffff1716
!	%l0 = 0000af01, %l1 = ffff1716, Mem[0000000010181410] = ffffffff ffffffff
	std	%l0,[%i6+%o5]		! Mem[0000000010181410] = 0000af01 ffff1716
!	%l4 = ffffffffffffffff, Mem[0000000010181408] = ff000000
	stba	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffff0000, %l4 = ffffffffffffffff
	ldsba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_145:
!	Mem[0000000030181410] = ffffffff, %l1 = 00000000ffff1716
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010181400] = 0000ffff, %l5 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010101408] = 0000ffff, %l4 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030181400] = ffff1716, %l2 = 000000002d00007c
	lduha	[%i6+%g0]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010141420] = ffff6bda5c3964ce, %f26 = af019592 5fa7efb3
	ldd	[%i5+0x020],%f26	! %f26 = ffff6bda 5c3964ce
!	Mem[0000000010081408] = 5fa7efff, %l1 = 000000000000ffff
	ldsha	[%i2+%o4]0x88,%l1	! %l1 = ffffffffffffefff
!	Mem[0000000010181408] = ff000000, %l2 = 000000000000ffff
	lduwa	[%i6+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030041408] = ff00000000000000, %f16 = ffefa75f 929501af
	ldda	[%i1+%o4]0x81,%f16	! %f16 = ff000000 00000000
!	Mem[00000000100c1410] = ffffffff, %l7 = 0000000000000000
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f22 = 0655ce22, Mem[000000001000140c] = ffffffe1
	st	%f22,[%i0+0x00c]	! Mem[000000001000140c] = 0655ce22

p0_label_146:
!	Mem[0000000010101408] = ffff0000, %l6 = 00000000ffccd747
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041408] = 000000ff, %l2 = 00000000ff000000
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = b3ff008a, %l5 = 000000000000ffff
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 0000008a000000ff
!	%l3 = 000000000000ffff, Mem[0000000030181408] = 9735ac9ab3efa75f
	stxa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000000000ffff
!	%l1 = ffffffffffffefff, Mem[00000000100c1410] = ffffffff
	stba	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffffff
!	%l6 = 0000000000000000, Mem[0000000010001420] = 00000000
	stw	%l6,[%i0+0x020]		! Mem[0000000010001420] = 00000000
!	%l1 = ffffffffffffefff, Mem[0000000010081408] = 5fa7efff
	stwa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffefff
!	%f20 = ff00007c 4a11ffaa, Mem[0000000010181410] = 0000af01 ffff1716
	stda	%f20,[%i6+0x010]%asi	! Mem[0000000010181410] = ff00007c 4a11ffaa
!	Mem[0000000010081428] = cc000000, %l1 = ffffffffffffefff, %asi = 80
	swapa	[%i2+0x028]%asi,%l1	! %l1 = 00000000cc000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffffffff, %l3 = 000000000000ffff
	lduwa	[%i0+%g0]0x80,%l3	! %l3 = 00000000ffffffff

p0_label_147:
!	Mem[0000000030101400] = 72000000, %l3 = 00000000ffffffff
	ldsba	[%i4+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l7 = 000000000000ffff
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = ffefffff, %l5 = 000000000000008a
	lduwa	[%i2+%o4]0x80,%l5	! %l5 = 00000000ffefffff
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[000000001000143c] = 00008bff, %l0 = 000000000000af01
	ldub	[%i0+0x03c],%l0		! %l0 = 0000000000000000
!	Mem[0000000030001400] = ffff0024, %l0 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181410] = ffffffff00000000, %f10 = 45136133 4d5f2023
	ldda	[%i6+%o5]0x81,%f10	! %f10 = ffffffff 00000000
!	Mem[0000000020800040] = d74712f0, %l3 = 0000000000000000
	lduh	[%o1+0x040],%l3		! %l3 = 000000000000d747
!	Mem[0000000010001410] = ff00ffb3, %l4 = 000000000000ffff
	lduwa	[%i0+0x010]%asi,%l4	! %l4 = 00000000ff00ffb3
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010001408] = 22ce5506bb1bb6ac
	stxa	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000000000000

p0_label_148:
!	%f0  = ffff0000 00000000, %l1 = 00000000cc000000
!	Mem[0000000010181428] = e1cb281ee680c94e
	add	%i6,0x028,%g1
	stda	%f0,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010181428] = e1cb281ee680c94e
!	%f20 = ff00007c, Mem[0000000030141408] = 5fa7efb3
	sta	%f20,[%i5+%o4]0x89	! Mem[0000000030141408] = ff00007c
!	%l0 = 000000ff, %l1 = cc000000, Mem[0000000010141408] = 00000000 00000000
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff cc000000
!	Mem[0000000030081410] = 47d7ccff, %l0 = 00000000000000ff
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 00000047000000ff
!	Mem[0000000030041400] = ff000000, %l7 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	%l5 = 00000000ffefffff, Mem[0000000010181410] = 7c0000ff
	stba	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 7c0000ff
!	%l0 = 0000000000000047, Mem[00000000100c142e] = 00000000, %asi = 80
	stha	%l0,[%i3+0x02e]%asi	! Mem[00000000100c142c] = 00000047
!	%l0 = 0000000000000047, Mem[0000000030101408] = ffcc0047
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = ffcc0047
!	%l6 = 0000000000000000, Mem[0000000010141410] = a84107ce
	stba	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 004107ce
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = ce64395c, %l3 = 000000000000d747
	lduba	[%i1+0x022]%asi,%l3	! %l3 = 0000000000000039

p0_label_149:
!	Mem[00000000201c0000] = d747e51a, %l0 = 0000000000000047
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000d747
!	Mem[0000000010081408] = ffefffff, %l0 = 000000000000d747
	lduba	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101400] = 00000072, %l4 = 00000000ff00ffb3
	lduba	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = ffd7ccff 00000000, %l0 = 000000ff, %l1 = cc000000
	ldda	[%i2+%o5]0x81,%l0	! %l0 = 00000000ffd7ccff 0000000000000000
!	Mem[0000000010041400] = 7c694a7a, %l3 = 0000000000000039
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 000000000000007c
!	Mem[0000000010001408] = 00000000, %f3  = 929501af
	lda	[%i0+%o4]0x88,%f3 	! %f3 = 00000000
!	Mem[00000000300c1408] = b3efa75f929501af, %f24 = ccccd747 da6bffff
	ldda	[%i3+%o4]0x89,%f24	! %f24 = b3efa75f 929501af
!	Mem[0000000010181410] = ff00007c, %l7 = ffffffffffffffff
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 00000000ff00007c
!	Mem[0000000010101408] = ff00ffff, %l2 = 00000000000000ff
	ldsha	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = ff0000ff, %l1 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l1	! %l1 = 000000ff000000ff

p0_label_150:
!	%f6  = 0655ce22 f1f9f50e, %l1 = 00000000000000ff
!	Mem[0000000010041430] = 15bda57c7ca5bd15
	add	%i1,0x030,%g1
	stda	%f6,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010041430] = 0ef5f9f122ce5506
!	%l3 = 000000000000007c, Mem[00000000218000c0] = ffe1f22b, %asi = 80
	stha	%l3,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 007cf22b
!	%l0 = ffd7ccff, %l1 = 000000ff, Mem[00000000100c1408] = b3000000 00000000
	stda	%l0,[%i3+0x008]%asi	! Mem[00000000100c1408] = ffd7ccff 000000ff
!	Mem[0000000030001408] = ff00007c, %l1 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010001408] = 00000000, %l0 = 00000000ffd7ccff
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030041400] = 000000ff ff00007c
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 000000ff
!	%f20 = ff00007c 4a11ffaa, %l4 = 0000000000000000
!	Mem[0000000010181410] = ff00007c4a11ffaa
	add	%i6,0x010,%g1
	stda	%f20,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010181410] = ff00007c4a11ffaa
	membar	#Sync			! Added by membar checker (25)
!	%l1 = 00000000000000ff, Mem[00000000300c1408] = 929501af
	stwa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	Mem[0000000010001410] = ff00ffb3, %l5 = 00000000ffefffff
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 00000000ff00ffb3
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ce64395c da6bffff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 00000000ce64395c 00000000da6bffff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	and	%l2,0xdde,%l4
	stda	%l0,[%i0+0x010]%asi
	stb	%l3,[%i5+0x026]
	ldda	[%i5+0x000]%asi,%l4
	ldda	[%i5+0x000]%asi,%l2
	ldsba	[%i6+0x012]%asi,%l2
	lduha	[%i4+0x006]%asi,%l2
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000ce64395c
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000da6bffff
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be ffffffffffffff00
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 000000000000007c
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000ff00ffb3
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000ff00007c
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00003cb6,%g2
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
	cmp	%l0,%l1			! %f0  should be ffff0000 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be b3efa75f 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 0000ffff ffffffff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 0655ce22 f1f9f50e
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 0be6e165 e42da7bc
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be ffffffff 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 6d56f925 b8f8c401
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 82690000 77af5685
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ff000000 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be b3efa75f 929501af
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ff00007c 4a11ffaa
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 0655ce22 f1f9f50e
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be b3efa75f 929501af
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ffff6bda 5c3964ce
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be b3000000 00000000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 82690000 77af5685
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
	fsqrts	%f0 ,%f1 
	andn	%l5,-0x8c9,%l4
	fsubs	%f1 ,%f9 ,%f3 
	fadds	%f12,%f4 ,%f9 
	stwa	%l6,[%i4+%o4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010101408]
	stda	%l2,[%i5+%o4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010141408]
	done

p0_trap1o:
	fsqrts	%f0 ,%f1 
	andn	%l5,-0x8c9,%l4
	fsubs	%f1 ,%f9 ,%f3 
	fadds	%f12,%f4 ,%f9 
	stwa	%l6,[%o4+%i4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010101408]
	stda	%l2,[%o5+%i4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010141408]
	done


p0_trap2e:
	ldsha	[%i0+%o4]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010001408]
	mulx	%l5,0x833,%l3
	fadds	%f9 ,%f6 ,%f8 
	stba	%l0,[%i3+%o5]ASI_AS_IF_USER_PRIMARY	! Mem[00000000100c1410]
	lduha	[%i5+%o5]ASI_AS_IF_USER_PRIMARY,%l2	! Mem[0000000010141410]
	fdivs	%f7 ,%f4 ,%f0 
	done

p0_trap2o:
	ldsha	[%o0+%i4]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010001408]
	mulx	%l5,0x833,%l3
	fadds	%f9 ,%f6 ,%f8 
	stba	%l0,[%o3+%i5]ASI_AS_IF_USER_PRIMARY	! Mem[00000000100c1410]
	lduha	[%o5+%i5]ASI_AS_IF_USER_PRIMARY,%l2	! Mem[0000000010141410]
	fdivs	%f7 ,%f4 ,%f0 
	done


p0_trap3e:
	add	%l7,-0xb24,%l6
	xor	%l4,%l6,%l0
	sub	%l0,-0x18d,%l2
	done

p0_trap3o:
	add	%l7,-0xb24,%l6
	xor	%l4,%l6,%l0
	sub	%l0,-0x18d,%l2
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
	ldx	[%g1+0x000],%l0		! %l0 = 1b50cc78b0f3e5f8
	ldx	[%g1+0x008],%l1		! %l1 = adff012013306dce
	ldx	[%g1+0x010],%l2		! %l2 = 4e8cdb28a28d460c
	ldx	[%g1+0x018],%l3		! %l3 = 953b6e6e4cd87372
	ldx	[%g1+0x020],%l4		! %l4 = 1656e32c3d112658
	ldx	[%g1+0x028],%l5		! %l5 = 048b0f5267089abd
	ldx	[%g1+0x030],%l6		! %l6 = a94ed761c8683373
	ldx	[%g1+0x038],%l7		! %l7 = b9787fb21f22d3b4

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
	fsqrts	%f0 ,%f1 
	andn	%l5,-0x8c9,%l4
	fdtoi	%f10,%f13
	and	%l3,-0x1cc,%l1
	jmpl	%o7,%g0
	addc	%l0,%l4,%l4
p0_near_0_he:
	swap	[%i1+0x004],%l1		! Mem[0000000010041404]
	jmpl	%o7,%g0
	fdivs	%f31,%f19,%f29
near0_b2b_h:
	fdtoi	%f26,%f24
	jmpl	%o7,%g0
	sub	%l2,%l3,%l0
near0_b2b_l:
	nop
	jmpl	%o7,%g0
	fmuls	%f6 ,%f2 ,%f12
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	ldstub	[%i3+0x012],%l7		! Mem[00000000100c1412]
	mulx	%l5,-0x4f8,%l4
	sub	%l2,0x091,%l1
	fcmps	%fcc0,%f6 ,%f12
	jmpl	%o7,%g0
	ldub	[%i6+0x03e],%l0		! Mem[000000001018143e]
p0_near_1_he:
	fstod	%f16,%f20
	udivx	%l3,%l3,%l4
	jmpl	%o7,%g0
	ldstub	[%o0+0x001],%l7		! Mem[00000000201c0001]
near1_b2b_h:
	fitod	%f16,%f30
	andn	%l1,0xcb5,%l2
	jmpl	%o7,%g0
	and	%l3,%l6,%l4
near1_b2b_l:
	fcmps	%fcc2,%f8 ,%f13
	fitos	%f5 ,%f11
	jmpl	%o7,%g0
	fdivs	%f8 ,%f12,%f1 
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	fstoi	%f0 ,%f5 
	jmpl	%o7,%g0
	lduh	[%i4+0x000],%l7		! Mem[0000000010101400]
p0_near_2_he:
	ldstub	[%i0+0x02f],%l1		! Mem[000000001000142f]
	fdivs	%f26,%f24,%f19
	xor	%l1,0xb4b,%l1
	ldd	[%i0+0x000],%f16	! Mem[0000000010001400]
	and	%l2,0x62f,%l0
	jmpl	%o7,%g0
	fmuls	%f31,%f19,%f19
near2_b2b_h:
	xor	%l5,0x0bf,%l7
	sub	%l6,%l2,%l3
	add	%l3,-0xd1b,%l0
	jmpl	%o7,%g0
	xor	%l3,%l7,%l3
near2_b2b_l:
	fstod	%f0 ,%f6 
	fstoi	%f5 ,%f10
	sdivx	%l0,%l6,%l1
	jmpl	%o7,%g0
	fdivs	%f15,%f4 ,%f0 
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	std	%f6 ,[%i2+0x038]	! Mem[0000000010081438]
	ldd	[%i4+0x020],%f14	! Mem[0000000010101420]
	lduw	[%i0+0x030],%l7		! Mem[0000000010001430]
	ldd	[%i1+0x008],%l2		! Mem[0000000010041408]
	sdivx	%l7,-0xe68,%l0
	jmpl	%o7,%g0
	fitos	%f14,%f4 
p0_near_3_he:
	or	%l4,0x048,%l0
	and	%l1,%l4,%l2
	fmuls	%f20,%f16,%f23
	fdtos	%f30,%f18
	jmpl	%o7,%g0
	fstoi	%f16,%f16
near3_b2b_h:
	udivx	%l5,%l0,%l0
	fitos	%f16,%f17
	subc	%l7,%l0,%l6
	fitos	%f20,%f23
	jmpl	%o7,%g0
	umul	%l1,0x1ed,%l7
near3_b2b_l:
	xor	%l1,%l5,%l1
	xnor	%l4,0x5f9,%l6
	sub	%l7,0xa3f,%l2
	sdivx	%l6,%l2,%l4
	jmpl	%o7,%g0
	smul	%l1,0xe85,%l5
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	sub	%l5,0xb4b,%l4
	swap	[%i3+0x03c],%l5		! Mem[00000000100c143c]
	sdivx	%l4,0xebd,%l2
	jmpl	%o7,%g0
	lduw	[%i5+0x004],%l7		! Mem[0000000010141404]
p0_far_0_lem:
	sub	%l5,0xb4b,%l4
	membar	#Sync
	swap	[%i3+0x03c],%l5		! Mem[00000000100c143c]
	sdivx	%l4,0xebd,%l2
	membar	#Sync
	jmpl	%o7,%g0
	lduw	[%i5+0x004],%l7		! Mem[0000000010141404]
p0_far_0_he:
	nop
	andn	%l3,%l0,%l7
	addc	%l3,-0x311,%l2
	umul	%l1,-0x69e,%l6
	ldub	[%i2+0x008],%l2		! Mem[0000000010081408]
	jmpl	%o7,%g0
	fdivs	%f25,%f26,%f26
p0_far_0_hem:
	nop
	andn	%l3,%l0,%l7
	addc	%l3,-0x311,%l2
	umul	%l1,-0x69e,%l6
	membar	#Sync
	ldub	[%i2+0x008],%l2		! Mem[0000000010081408]
	jmpl	%o7,%g0
	fdivs	%f25,%f26,%f26
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	umul	%l5,%l6,%l3
	fsubs	%f25,%f30,%f26
	fadds	%f28,%f22,%f28
	fitod	%f19,%f28
	fsqrts	%f18,%f30
	xnor	%l6,%l7,%l4
	jmpl	%o7,%g0
	fmuls	%f20,%f31,%f19
far0_b2b_l:
	fdtoi	%f10,%f8 
	mulx	%l5,%l6,%l5
	fitod	%f13,%f14
	fstoi	%f8 ,%f10
	mulx	%l6,-0xe1a,%l4
	smul	%l3,%l2,%l6
	jmpl	%o7,%g0
	fmuls	%f6 ,%f11,%f11
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	ldd	[%i4+0x038],%f8 	! Mem[0000000010101438]
	or	%l4,%l1,%l3
	jmpl	%o7,%g0
	fitos	%f6 ,%f14
p0_far_1_lem:
	membar	#Sync
	ldd	[%i4+0x038],%f8 	! Mem[0000000010101438]
	or	%l4,%l1,%l3
	jmpl	%o7,%g0
	fitos	%f6 ,%f14
p0_far_1_he:
	ldd	[%i3+0x000],%l2		! Mem[00000000100c1400]
	lduw	[%i6+0x038],%l5		! Mem[0000000010181438]
	fadds	%f18,%f20,%f31
	jmpl	%o7,%g0
	andn	%l6,%l6,%l5
p0_far_1_hem:
	membar	#Sync
	ldd	[%i3+0x000],%l2		! Mem[00000000100c1400]
	lduw	[%i6+0x038],%l5		! Mem[0000000010181438]
	fadds	%f18,%f20,%f31
	jmpl	%o7,%g0
	andn	%l6,%l6,%l5
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	addc	%l4,0x438,%l4
	jmpl	%o7,%g0
	sdivx	%l2,-0xba5,%l1
far1_b2b_l:
	smul	%l3,-0x8fa,%l6
	jmpl	%o7,%g0
	andn	%l3,-0x5d5,%l7
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	udivx	%l4,0x58d,%l2
	addc	%l0,-0x813,%l2
	jmpl	%o7,%g0
	mulx	%l1,%l7,%l3
p0_far_2_lem:
	udivx	%l4,0x58d,%l2
	addc	%l0,-0x813,%l2
	jmpl	%o7,%g0
	mulx	%l1,%l7,%l3
p0_far_2_he:
	fadds	%f24,%f27,%f27
	stb	%l0,[%i3+0x00f]		! Mem[00000000100c140f]
	stx	%l3,[%i4+0x000]		! Mem[0000000010101400]
	orn	%l0,%l4,%l6
	fitod	%f24,%f28
	subc	%l5,-0x4d9,%l4
	fcmps	%fcc2,%f29,%f22
	jmpl	%o7,%g0
	fdtoi	%f28,%f25
p0_far_2_hem:
	fadds	%f24,%f27,%f27
	membar	#Sync
	stb	%l0,[%i3+0x00f]		! Mem[00000000100c140f]
	stx	%l3,[%i4+0x000]		! Mem[0000000010101400]
	orn	%l0,%l4,%l6
	fitod	%f24,%f28
	subc	%l5,-0x4d9,%l4
	fcmps	%fcc2,%f29,%f22
	jmpl	%o7,%g0
	fdtoi	%f28,%f25
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fsubs	%f21,%f18,%f25
	jmpl	%o7,%g0
	fdivs	%f29,%f30,%f17
far2_b2b_l:
	orn	%l5,%l4,%l1
	jmpl	%o7,%g0
	andn	%l0,-0x0cd,%l3
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	mulx	%l1,%l2,%l4
	stb	%l5,[%i1+0x00d]		! Mem[000000001004140d]
	fdivs	%f8 ,%f1 ,%f14
	and	%l0,%l6,%l0
	jmpl	%o7,%g0
	orn	%l7,%l5,%l4
p0_far_3_lem:
	mulx	%l1,%l2,%l4
	membar	#Sync
	stb	%l5,[%i1+0x00d]		! Mem[000000001004140d]
	fdivs	%f8 ,%f1 ,%f14
	and	%l0,%l6,%l0
	jmpl	%o7,%g0
	orn	%l7,%l5,%l4
p0_far_3_he:
	ldstub	[%o3+0x000],%l7		! Mem[0000000021800000]
	fitod	%f23,%f18
	fitod	%f22,%f22
	and	%l1,%l5,%l2
	udivx	%l6,-0x5c1,%l7
	xor	%l3,%l7,%l6
	jmpl	%o7,%g0
	lduh	[%i3+0x02e],%l0		! Mem[00000000100c142e]
p0_far_3_hem:
	ldstub	[%o3+0x000],%l7		! Mem[0000000021800000]
	fitod	%f23,%f18
	fitod	%f22,%f22
	and	%l1,%l5,%l2
	udivx	%l6,-0x5c1,%l7
	xor	%l3,%l7,%l6
	membar	#Sync
	jmpl	%o7,%g0
	lduh	[%i3+0x02e],%l0		! Mem[00000000100c142e]
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fsubs	%f27,%f25,%f20
	fdivs	%f18,%f16,%f16
	fsqrts	%f23,%f30
	fcmps	%fcc1,%f22,%f20
	andn	%l4,%l7,%l3
	jmpl	%o7,%g0
	nop
far3_b2b_l:
	umul	%l2,0xb02,%l5
	fstod	%f0 ,%f12
	xnor	%l0,%l3,%l5
	fadds	%f15,%f4 ,%f10
	fitos	%f2 ,%f4 
	jmpl	%o7,%g0
	fsubs	%f7 ,%f9 ,%f3 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	fcmps	%fcc0,%f13,%f0 
	fdtos	%f10,%f8 
	or	%l3,%l0,%l0
	stw	%l1,[%i2+0x008]		! Mem[0000000010081408]
	jmpl	%g6+8,%g0
	lduw	[%i5+0x030],%l4		! Mem[0000000010141430]
p0_call_0_le:
	add	%l5,-0xed6,%l4
	std	%l2,[%i3+0x000]		! Mem[00000000100c1400]
	std	%l6,[%i1+0x038]		! Mem[0000000010041438]
	retl
	fsqrts	%f6 ,%f13
p0_jmpl_0_lo:
	fcmps	%fcc0,%f13,%f0 
	fdtos	%f10,%f8 
	or	%l3,%l0,%l0
	stw	%l1,[%o2+0x008]		! Mem[0000000010081408]
	jmpl	%g6+8,%g0
	lduw	[%o5+0x030],%l4		! Mem[0000000010141430]
p0_call_0_lo:
	add	%l5,-0xed6,%l4
	std	%l2,[%o3+0x000]		! Mem[00000000100c1400]
	std	%l6,[%o1+0x038]		! Mem[0000000010041438]
	retl
	fsqrts	%f6 ,%f13
p0_jmpl_0_he:
	nop
	jmpl	%g6+8,%g0
	fitod	%f24,%f22
p0_call_0_he:
	nop
	andn	%l6,0xa67,%l3
	fadds	%f28,%f20,%f25
	udivx	%l1,0xf64,%l3
	ldsb	[%i6+0x01e],%l3		! Mem[000000001018141e]
	sdivx	%l1,-0xa7d,%l0
	fcmps	%fcc0,%f28,%f21
	retl
	st	%f27,[%i0+0x010]	! Mem[0000000010001410]
p0_jmpl_0_ho:
	nop
	jmpl	%g6+8,%g0
	fitod	%f24,%f22
p0_call_0_ho:
	nop
	andn	%l6,0xa67,%l3
	fadds	%f28,%f20,%f25
	udivx	%l1,0xf64,%l3
	ldsb	[%o6+0x01e],%l3		! Mem[000000001018141e]
	sdivx	%l1,-0xa7d,%l0
	fcmps	%fcc0,%f28,%f21
	retl
	st	%f27,[%o0+0x010]	! Mem[0000000010001410]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	fitod	%f11,%f6 
	stw	%l2,[%i1+0x038]		! Mem[0000000010041438]
	ldstub	[%i3+0x00d],%l6		! Mem[00000000100c140d]
	umul	%l7,%l7,%l2
	jmpl	%g6+8,%g0
	fcmps	%fcc3,%f0 ,%f11
p0_call_1_le:
	fdtos	%f10,%f15
	fstod	%f13,%f0 
	retl
	fdtos	%f6 ,%f5 
p0_jmpl_1_lo:
	fitod	%f11,%f6 
	stw	%l2,[%o1+0x038]		! Mem[0000000010041438]
	ldstub	[%o3+0x00d],%l6		! Mem[00000000100c140d]
	umul	%l7,%l7,%l2
	jmpl	%g6+8,%g0
	fcmps	%fcc3,%f0 ,%f11
p0_call_1_lo:
	fdtos	%f10,%f15
	fstod	%f13,%f0 
	retl
	fdtos	%f6 ,%f5 
p0_jmpl_1_he:
	jmpl	%g6+8,%g0
	stx	%l0,[%i6+0x038]		! Mem[0000000010181438]
p0_call_1_he:
	orn	%l7,%l0,%l2
	add	%l0,%l5,%l7
	addc	%l7,-0xcaf,%l1
	add	%l7,%l6,%l5
	add	%l3,0x19f,%l7
	swap	[%i1+0x000],%l3		! Mem[0000000010041400]
	smul	%l5,0x5fd,%l3
	retl
	and	%l6,-0xf80,%l3
p0_jmpl_1_ho:
	jmpl	%g6+8,%g0
	stx	%l0,[%o6+0x038]		! Mem[0000000010181438]
p0_call_1_ho:
	orn	%l7,%l0,%l2
	add	%l0,%l5,%l7
	addc	%l7,-0xcaf,%l1
	add	%l7,%l6,%l5
	add	%l3,0x19f,%l7
	swap	[%o1+0x000],%l3		! Mem[0000000010041400]
	smul	%l5,0x5fd,%l3
	retl
	and	%l6,-0xf80,%l3
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	swap	[%i4+0x024],%l3		! Mem[0000000010101424]
	andn	%l7,%l3,%l6
	subc	%l3,%l5,%l3
	subc	%l6,%l6,%l0
	nop
	fitos	%f7 ,%f15
	jmpl	%g6+8,%g0
	fdtos	%f12,%f10
p0_call_2_le:
	ldsw	[%i4+0x004],%l1		! Mem[0000000010101404]
	ldstub	[%o1+0x000],%l7		! Mem[0000000020800000]
	sdivx	%l3,0x99c,%l3
	sdivx	%l7,%l4,%l6
	ldd	[%i1+0x018],%l2		! Mem[0000000010041418]
	fmuls	%f13,%f13,%f0 
	retl
	udivx	%l7,%l6,%l1
p0_jmpl_2_lo:
	swap	[%o4+0x024],%l3		! Mem[0000000010101424]
	andn	%l7,%l3,%l6
	subc	%l3,%l5,%l3
	subc	%l6,%l6,%l0
	nop
	fitos	%f7 ,%f15
	jmpl	%g6+8,%g0
	fdtos	%f12,%f10
p0_call_2_lo:
	ldsw	[%o4+0x004],%l1		! Mem[0000000010101404]
	ldstub	[%i1+0x000],%l7		! Mem[0000000020800000]
	sdivx	%l3,0x99c,%l3
	sdivx	%l7,%l4,%l6
	ldd	[%o1+0x018],%l2		! Mem[0000000010041418]
	fmuls	%f13,%f13,%f0 
	retl
	udivx	%l7,%l6,%l1
p0_jmpl_2_he:
	nop
	jmpl	%g6+8,%g0
	sth	%l7,[%i3+0x022]		! Mem[00000000100c1422]
p0_call_2_he:
	stb	%l5,[%i1+0x02c]		! Mem[000000001004142c]
	addc	%l0,0xb8d,%l6
	st	%f17,[%i5+0x014]	! Mem[0000000010141414]
	fsubs	%f27,%f16,%f22
	ldsh	[%i2+0x02c],%l0		! Mem[000000001008142c]
	udivx	%l4,-0x0a8,%l2
	swap	[%i3+0x030],%l4		! Mem[00000000100c1430]
	retl
	fstod	%f27,%f24
p0_jmpl_2_ho:
	nop
	jmpl	%g6+8,%g0
	sth	%l7,[%o3+0x022]		! Mem[00000000100c1422]
p0_call_2_ho:
	stb	%l5,[%o1+0x02c]		! Mem[000000001004142c]
	addc	%l0,0xb8d,%l6
	st	%f17,[%o5+0x014]	! Mem[0000000010141414]
	fsubs	%f27,%f16,%f22
	ldsh	[%o2+0x02c],%l0		! Mem[000000001008142c]
	udivx	%l4,-0x0a8,%l2
	swap	[%o3+0x030],%l4		! Mem[00000000100c1430]
	retl
	fstod	%f27,%f24
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	fmuls	%f9 ,%f2 ,%f4 
	addc	%l5,0x404,%l3
	swap	[%i3+0x020],%l7		! Mem[00000000100c1420]
	addc	%l5,%l3,%l7
	lduh	[%i6+0x020],%l5		! Mem[0000000010181420]
	ldsw	[%i4+0x024],%l2		! Mem[0000000010101424]
	jmpl	%g6+8,%g0
	umul	%l5,0xedb,%l6
p0_call_3_le:
	fsubs	%f2 ,%f2 ,%f12
	ldsw	[%i2+0x03c],%l2		! Mem[000000001008143c]
	addc	%l7,%l6,%l4
	stx	%l3,[%i0+0x000]		! Mem[0000000010001400]
	fdtos	%f8 ,%f5 
	retl
	addc	%l0,%l5,%l1
p0_jmpl_3_lo:
	fmuls	%f9 ,%f2 ,%f4 
	addc	%l5,0x404,%l3
	swap	[%o3+0x020],%l7		! Mem[00000000100c1420]
	addc	%l5,%l3,%l7
	lduh	[%o6+0x020],%l5		! Mem[0000000010181420]
	ldsw	[%o4+0x024],%l2		! Mem[0000000010101424]
	jmpl	%g6+8,%g0
	umul	%l5,0xedb,%l6
p0_call_3_lo:
	fsubs	%f2 ,%f2 ,%f12
	ldsw	[%o2+0x03c],%l2		! Mem[000000001008143c]
	addc	%l7,%l6,%l4
	stx	%l3,[%o0+0x000]		! Mem[0000000010001400]
	fdtos	%f8 ,%f5 
	retl
	addc	%l0,%l5,%l1
p0_jmpl_3_he:
	mulx	%l4,%l4,%l0
	ldstub	[%i4+0x03c],%l0		! Mem[000000001010143c]
	fcmps	%fcc3,%f27,%f16
	ldsw	[%i1+0x024],%l2		! Mem[0000000010041424]
	fsqrts	%f21,%f16
	fstoi	%f26,%f25
	ldsh	[%i6+0x01c],%l7		! Mem[000000001018141c]
	jmpl	%g6+8,%g0
	sth	%l0,[%i4+0x03a]		! Mem[000000001010143a]
p0_call_3_he:
	ldub	[%i5+0x036],%l2		! Mem[0000000010141436]
	ldx	[%i2+0x020],%l3		! Mem[0000000010081420]
	sub	%l3,-0x02a,%l2
	mulx	%l1,%l6,%l1
	sdivx	%l0,%l1,%l7
	and	%l5,0x875,%l4
	ldsh	[%i6+0x010],%l5		! Mem[0000000010181410]
	retl
	fstod	%f29,%f18
p0_jmpl_3_ho:
	mulx	%l4,%l4,%l0
	ldstub	[%o4+0x03c],%l0		! Mem[000000001010143c]
	fcmps	%fcc3,%f27,%f16
	ldsw	[%o1+0x024],%l2		! Mem[0000000010041424]
	fsqrts	%f21,%f16
	fstoi	%f26,%f25
	ldsh	[%o6+0x01c],%l7		! Mem[000000001018141c]
	jmpl	%g6+8,%g0
	sth	%l0,[%o4+0x03a]		! Mem[000000001010143a]
p0_call_3_ho:
	ldub	[%o5+0x036],%l2		! Mem[0000000010141436]
	ldx	[%o2+0x020],%l3		! Mem[0000000010081420]
	sub	%l3,-0x02a,%l2
	mulx	%l1,%l6,%l1
	sdivx	%l0,%l1,%l7
	and	%l5,0x875,%l4
	ldsh	[%o6+0x010],%l5		! Mem[0000000010181410]
	retl
	fstod	%f29,%f18
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
	.word	0x1b50cc78,0xb0f3e5f8		! Init value for %l0
	.word	0xadff0120,0x13306dce		! Init value for %l1
	.word	0x4e8cdb28,0xa28d460c		! Init value for %l2
	.word	0x953b6e6e,0x4cd87372		! Init value for %l3
	.word	0x1656e32c,0x3d112658		! Init value for %l4
	.word	0x048b0f52,0x67089abd		! Init value for %l5
	.word	0xa94ed761,0xc8683373		! Init value for %l6
	.word	0xb9787fb2,0x1f22d3b4		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xb7e83110,0x8f0502e1		! Init value for %f0 
	.word	0x0f3182ff,0x88736332		! Init value for %f2 
	.word	0x272f85d8,0x6fde6585		! Init value for %f4 
	.word	0x280733ba,0x724b4428		! Init value for %f6 
	.word	0xe00800fb,0xa9562fd5		! Init value for %f8 
	.word	0xfe7d5987,0x9ae2e312		! Init value for %f10
	.word	0xaa9ef186,0xc64fa1d9		! Init value for %f12
	.word	0x3b17526f,0x0733e1aa		! Init value for %f14
	.word	0x305ba6e9,0x59eee89c		! Init value for %f16
	.word	0x6aa433c0,0x404c134c		! Init value for %f18
	.word	0x99212682,0x652f148d		! Init value for %f20
	.word	0x3021dadc,0x24bfc0f3		! Init value for %f22
	.word	0xa14a01d2,0xb89387d8		! Init value for %f24
	.word	0x5bec8646,0x65e1e60b		! Init value for %f26
	.word	0xb2251e38,0x290b9ca2		! Init value for %f28
	.word	0x7184b745,0xf8671507		! Init value for %f30
	.word	0x43fe4ad8,0x8be5e777		! Init value for %f32
	.word	0x6eff4d52,0xb1e26a30		! Init value for %f34
	.word	0x2731a5b4,0x580ba1b1		! Init value for %f36
	.word	0x0caefb13,0x2512f087		! Init value for %f38
	.word	0x181207cd,0x7391a6ff		! Init value for %f40
	.word	0xb5bf580a,0x0598849f		! Init value for %f42
	.word	0x6e718b8e,0x797232aa		! Init value for %f44
	.word	0x27b6bd2e,0xd7a68e02		! Init value for %f46
	.word	0x5645a134,0xb511f7bf
	.word	0x801b301c,0x6d12d1fb
	.word	0x1bee71ce,0x1a223121
	.word	0xd1b36f10,0xf4362067
	.word	0x948fcc28,0xba7547b0
	.word	0x3675f890,0x468acdf5
	.word	0xd8c6dc91,0x4c92f1f2
	.word	0x8d833630,0x3958d366
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
	.word	0x00000000,0xce64395c
	.word	0x00000000,0xda6bffff
	.word	0xffffffff,0xffffff00
	.word	0x00000000,0x0000007c
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff00ffb3
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff00007c
p0_expected_fp_regs:
	.word	0xffff0000,0x00000000
	.word	0xb3efa75f,0x00000000
	.word	0x0000ffff,0xffffffff
	.word	0x0655ce22,0xf1f9f50e
	.word	0x0be6e165,0xe42da7bc
	.word	0xffffffff,0x00000000
	.word	0x6d56f925,0xb8f8c401
	.word	0x82690000,0x77af5685
	.word	0xff000000,0x00000000
	.word	0xb3efa75f,0x929501af
	.word	0xff00007c,0x4a11ffaa
	.word	0x0655ce22,0xf1f9f50e
	.word	0xb3efa75f,0x929501af
	.word	0xffff6bda,0x5c3964ce
	.word	0xb3000000,0x00000000
	.word	0x82690000,0x77af5685
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0xffffffff,0x00000000
	.word	0xffccd7ff,0x00000000
	.word	0xffefffff,0x000000ff
	.word	0xccccd747,0xda6bffff
	.word	0x00000000,0x26162749
	.word	0x00000000,0x00000000
	.word	0xae37e6b8,0x929501af
	.word	0x7fedd978,0x00008bff
p0_local0_sec_expect:
	.word	0xffff0024,0x00000000
	.word	0xff00007c,0x4a11ffaa
	.word	0x1617ffff,0x00000000
	.word	0x0ef5f9f1,0x22ce5506
	.word	0x4736f953,0x73ed1447
	.word	0x23205f4d,0x33611345
	.word	0x01c4f8b8,0x25f9566d
	.word	0x089193c0,0x0000f500
p0_local1_expect:
	.word	0x7c694a7a,0x000000ff
	.word	0xce64395c,0xda6bffff
	.word	0xff00ffff,0xffffffff
	.word	0xff000000,0x00ff0000
	.word	0xce64395c,0xcae4514a
	.word	0xbca72de4,0x776bed8f
	.word	0x0ef5f9f1,0x22ce5506
	.word	0xe3f6032a,0xffffff4e
p0_local1_sec_expect:
	.word	0x00000000,0xff000000
	.word	0x000000ff,0x00000000
	.word	0x470000ff,0x00000000
	.word	0xff000000,0x00000000
	.word	0xce64395c,0xcae4514a
	.word	0xbca72de4,0x776bed8f
	.word	0x15bda57c,0x00000000
	.word	0xe3f6032a,0xffffff4e
p0_local2_expect:
	.word	0xffff0000,0x24000000
	.word	0xffefffff,0x929501af
	.word	0x00000000,0x00000000
	.word	0x0655ce22,0xf1f9f50e
	.word	0xffffffff,0xe42da7bc
	.word	0xffffefff,0x000000ff
	.word	0x6d56f925,0xb8f8c401
	.word	0x82690000,0x77af5685
p0_local2_sec_expect:
	.word	0x1617ffff,0xcd000000
	.word	0x0000ffff,0x72000000
	.word	0xffd7ccff,0x00000000
	.word	0xce91d1de,0xff000000
	.word	0x6541ff2b,0xb3efa75f
	.word	0x7c751555,0x404c134c
	.word	0xe1ffffff,0xffffffff
	.word	0xe1ffffff,0xffffffff
p0_local3_expect:
	.word	0xe1ffffff,0x000000ff
	.word	0xffd7ccff,0x000000ff
	.word	0xffffffff,0x00000000
	.word	0xff000000,0x00000000
	.word	0xce64395c,0xcae4514a
	.word	0x000000ab,0x00000047
	.word	0x15bda57c,0x00000000
	.word	0xf9f6032a,0xffffff4e
p0_local3_sec_expect:
	.word	0x00000000,0x0000ffff
	.word	0xff000000,0x5fa7efb3
	.word	0xffffffff,0xffff0000
	.word	0x0ef5f9f1,0x22ce5506
	.word	0xbca72de4,0x65e1e60b
	.word	0x23205f4d,0x33611345
	.word	0x01c4f8b8,0x25f9566d
	.word	0x8556af77,0x00006982
p0_local4_expect:
	.word	0xff0000ff,0x00000000
	.word	0xff00ffff,0x24000000
	.word	0xffff0000,0x000000cc
	.word	0x0000032a,0x00ff0000
	.word	0x9ea1da47,0xce0741a8
	.word	0x4124e2c4,0x00000000
	.word	0x0000efb3,0x00000000
	.word	0x35ab3bd1,0x7c2e8980
p0_local4_sec_expect:
	.word	0x00000072,0x00000072
	.word	0x4700ccff,0xff00ffff
	.word	0x00000000,0x000000b3
	.word	0xaf019592,0x5fa7efb3
	.word	0x973718fc,0x9735ac9a
	.word	0x8b5527da,0x549e2a30
	.word	0x4124e2c4,0xb5751555
	.word	0x1ba8f2d6,0x69308b24
p0_local5_expect:
	.word	0x000000ff,0x00000000
	.word	0x000000ff,0xcc000000
	.word	0x004107ce,0xffffffff
	.word	0xffffffff,0xffff0000
	.word	0xffff6bda,0x5c3964ce
	.word	0xcc000000,0x000000ff
	.word	0xe1ffffff,0x000000ff
	.word	0x1617ffff,0x00000000
p0_local5_sec_expect:
	.word	0xb3efa75f,0x24000000
	.word	0x7c0000ff,0x929501af
	.word	0x15bda57c,0x00000000
	.word	0x0655ce22,0xf1f9f50e
	.word	0x0be6e165,0xe42da7bc
	.word	0x45136133,0x4d5f2023
	.word	0x6d56f925,0xb8f8c401
	.word	0x82690000,0x77af5685
p0_local6_expect:
	.word	0x0000ffff,0xffffffe1
	.word	0xff000000,0x00000000
	.word	0xff00007c,0x4a11ffaa
	.word	0x5800b939,0x1c365040
	.word	0xffff0925,0x47e764a1
	.word	0xe1cb281e,0xe680c94e
	.word	0x94652c73,0x00000000
	.word	0xffffffff,0xffff0000
p0_local6_sec_expect:
	.word	0xffff1716,0xff000000
	.word	0x00000000,0x0000ffff
	.word	0xffffffff,0x00000000
	.word	0x269f5250,0x7ca5bd15
	.word	0x973718fc,0x2a03f6ff
	.word	0x9bbf11de,0x0e8b1dff
	.word	0x49271626,0xb5751555
	.word	0x000000cd,0x85560000
share0_expect:
	.word	0xd747e51a,0x0199c9cf
	.word	0x9519ea91,0xa7f7a594
	.word	0x9a31cce3,0xbced6bd7
	.word	0xb57909bc,0xee0f9a59
	.word	0x314251af,0x98c65268
	.word	0xa9c9a463,0xfd9596d4
	.word	0x8f6ec37b,0xeb58df15
	.word	0x4661878c,0x0a0852c3
share1_expect:
	.word	0x47ff7920,0xdfad4dd8
	.word	0x59b48bf1,0x8cb4bb49
	.word	0xba392524,0x6944ad70
	.word	0xa7f01883,0x465f0504
	.word	0x397c8aa0,0xbee5230a
	.word	0x3b23e262,0x2f9f6556
	.word	0x3f7d0379,0x5e98b63a
	.word	0xa990712d,0xe478d54c
	.word	0xd74712f0,0xfcb1697f
	.word	0x8b838890,0x972be596
	.word	0x59f486e9,0x2019ca14
	.word	0x5ca1282f,0x52ae5c3e
	.word	0x4409be45,0x4a71e3d2
	.word	0xe8f29887,0xce58e1c5
	.word	0x1cdfc874,0xf279edc6
	.word	0xb5913e7c,0xfda2572e
share2_expect:
	.word	0x00ff3616,0x87e33b6e
	.word	0xa9b0e0f7,0xde87443a
	.word	0x4c313d8a,0x4a3b3c4d
	.word	0xfc03dda7,0x8cc4cca8
	.word	0xbb57cf14,0xeb309093
	.word	0x754b1d63,0x15d3573b
	.word	0xa3093a57,0x6db0bc58
	.word	0x4b19d1f3,0x8e6ecc01
share3_expect:
	.word	0x4babfc74,0x54258e6f
	.word	0x97daabb4,0xec33770c
	.word	0x88d24818,0xdb0b54b8
	.word	0x87d35764,0x3cfd848b
	.word	0x6ad24afb,0xc5ded5d3
	.word	0xf9c70337,0x5cc4c795
	.word	0x5e156170,0xd3c1b962
	.word	0xf2c1e053,0x51d38f2d
	.word	0xfff759f3,0xc004d813
	.word	0x1c07d7c6,0xdceac7c5
	.word	0x56aa1258,0x0a9d06fd
	.word	0x46635abe,0xa5a32c35
	.word	0x0212a567,0x64d4c637
	.word	0x87287658,0x109a856c
	.word	0x40adf579,0xb25d5b8c
	.word	0x630846b2,0x5085a834
	.word	0x653fd437,0x6d73a6ec
	.word	0xac9bd2a7,0x364370fc
	.word	0x80a18bcf,0xb5e5df9d
	.word	0xdec4e3a2,0x6acf0246
	.word	0x6a1c541b,0x4ea16427
	.word	0x533872c9,0xfb97db7c
	.word	0x6ab87262,0x5a11776f
	.word	0x8afedbe2,0x0f62ed1a
	.word	0x007cf22b,0xc7a6ed77
	.word	0xb00d1719,0x45c0ead3
	.word	0xf1ccb16c,0x70790036
	.word	0x43dbe6a2,0x27719d37
	.word	0x06cc469a,0x9b3eb0b1
	.word	0x009dded2,0x98707286
	.word	0xde6c8a96,0x6e850889
	.word	0xa50c2478,0x482c37b2
	.word	0xda77b18b,0xc0b35fb7
	.word	0x894fe99c,0xfa9ac28c
	.word	0xa8f3d5ba,0x738a27b7
	.word	0x64bc47bf,0x91594d7a
	.word	0xd3d417cd,0x5e1c921c
	.word	0xd2af2f59,0x759f6033
	.word	0x29b6fdb7,0x9ccfbd88
	.word	0x06688441,0xddab6714
	.word	0x56535fa3,0x95f348b0
	.word	0x2db6ddd5,0x92557347
	.word	0xb3bfc67f,0x8c0d38cb
	.word	0x527710ad,0x34cd01b7
	.word	0x579f5cb2,0x31df7199
	.word	0x19ab9eb6,0x5f6facfb
	.word	0x424bfaa9,0xaa8e179d
	.word	0x0dc0e9bd,0x188696b6
	.word	0xffffa73c,0x2db7aa9f
	.word	0xf78f5a23,0x5dba78a0
	.word	0xd6ac3ba5,0x776e0200
	.word	0xebf77972,0x5983d54c
	.word	0x998c9e8a,0x17e1eb6f
	.word	0x64b91011,0x9f3f5f4e
	.word	0x6015338d,0xea87e905
	.word	0x1956b71d,0xe917168a
	.word	0xff774442,0xa3a1a62b
	.word	0x447dfa30,0xdd801667
	.word	0x47ed7c77,0x44547127
	.word	0x2609125e,0x66829f4d
	.word	0xc6fdbc38,0xbb98ccc9
	.word	0x2796b767,0xf9344aa4
	.word	0x548dc523,0xa500e05f
	.word	0x26b2eda6,0x51b73e39
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
	.word	0x584db7bf,0xc4054684
	.word	0x00000000,0x00000002
	.word	0x9552bf28,0x46079e78
	.word	0x00000000,0x00000003
	.word	0xbfb10678,0x75adf443
	.word	0x00000000,0x00000004
	.word	0x73aefe6f,0x89d1df15
	.word	0x00000000,0x00000005
	.word	0xa8dcb3c0,0x68c72e0b
	.word	0x00000000,0x00000006
	.word	0xdda77488,0x308d9bd1
	.word	0x00000000,0x00000007
	.word	0x49a26200,0x5d76b8cc
	.word	0x00000000,0x00000008
	.word	0x344c437f,0xc685ffff
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
	.word	0xc247b3d6,0x11bfe9a5,0x5ffda2c4,0x02d34e51
	.word	0x0f8918ac,0xacb61bbb,0xccccd747,0xda6bde82
	.word	0xfbdb9e41,0x207f2668,0xc29fba29,0x64bbdd5a
	.word	0xae37e6b8,0x929501af,0x7fedd978,0xf76ce7cf
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
	.word	0xfe6cd1f2,0xb3215666,0xe651e6a4,0xf9ae0cd0
	.word	0x7ca5bd15,0x6ec4a143,0x0ef5f9f1,0x22ce5506
	.word	0x4736f953,0x73ed1447,0x23205f4d,0x33611345
	.word	0x01c4f8b8,0x25f9566d,0x08c193c0,0x04aaf5fe
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
	.word	0xe2dc1530,0xc9c55ac9,0x65dc557c,0xe42da704
	.word	0x98bf24e5,0x424643ad,0x0d8ff46c,0x7caf6829
	.word	0x98db05a2,0xde11bf9b,0xe9ef4673,0x4d529356
	.word	0x10a9ea56,0x49ae6a9b,0x6e22557f,0x8f7cd9c8
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
	.word	0xffa6a53e,0xb29a2924,0x45df9aeb,0x295bb2eb
	.word	0xcd31c970,0x7506eaa6,0x91ff4bac,0x3918c9fc
	.word	0x73d87561,0x8b959f9f,0x0a8e4cf8,0x593e6b7f
	.word	0x1b0e6cf8,0x91ff89e4,0x35a848b3,0x6df6ad86
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
	.word	0x66da509e,0x4e196d4b,0x930aef73,0x0bc47e19
	.word	0xc6ce3b4f,0x79e713df,0x99d9f9b0,0x4a11aaaa
	.word	0x5fa7efb3,0x2b024165,0x80f6b15e,0x5246e53a
	.word	0x74c8d83e,0x243125ad,0x1d2817cb,0xf272b603
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
	.word	0x6ac8e0fe,0x9d193cd3,0x47aa4ea5,0x593ebc74
	.word	0xeb7fcaed,0x776bed8f,0x1f092a2f,0x236d81ce
	.word	0x785a4c63,0x0a4bf14e,0xf1f06cb7,0xc2db7cd8
	.word	0x73d87fe6,0x844e2d86,0xe64e3c9a,0x1ecf8afc
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
	.word	0x7d45e558,0x2048b54a,0x8aafd57c,0x5058dd51
	.word	0x74f81912,0xd9b12e86,0xc802223a,0x83e73264
	.word	0xc6b1a427,0xa8841940,0xb915133a,0x5bc52bd3
	.word	0x40a0453e,0xd44e0a33,0x418220e3,0x6fa49171
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
	.word	0xb1cc195e,0x275c3e78,0x400228d9,0xc3a94d44
	.word	0xaf51e4ca,0x5c3964ce,0xbbebff7f,0xa710a422
	.word	0x7405fa45,0xd87ef485,0xbc95fddb,0xfd29aac0
	.word	0x105d3493,0x4c6c6932,0xa9771262,0x9f6b69b2
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
	.word	0xc38cc13e,0x2a03f6bc,0x27acc074,0x161728c3
	.word	0x84654c8b,0x9c076982,0xff044064,0x3483ff92
	.word	0x9ea1da47,0xce0741a8,0x0ff315d0,0xd5267ddc
	.word	0x538b941c,0xee7bc91a,0x35ab3bd1,0x7c2e8980
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
	.word	0x44fe2c76,0xd1aea1a6,0x6080e91c,0xb68a8948
	.word	0xd9dc945b,0x01ff9793,0x269f5250,0xedce7ea8
	.word	0x973718fc,0x9735ac9a,0x8b5527da,0x549e2a30
	.word	0x4124e2c4,0xb5751555,0x1ba8f2d6,0x69308b24
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
	.word	0x11dad1b1,0xd5e1af77,0x64e66754,0x4c8f6816
	.word	0xdbd6d7eb,0xa31f376f,0xa044d64e,0x69f207b2
	.word	0xeeb260e9,0x44bfd777,0xb5b9f742,0x33831619
	.word	0x027c5172,0xff5766bb,0xba86da64,0xabd6bfd6
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
	.word	0x72c31e4a,0x94546664,0x5d274f6d,0x4cdad04e
	.word	0x0e8b1de3,0x710a31f3,0x3d121396,0xd73d8f9b
	.word	0x9577d1b2,0x275c3de2,0x3e5f089b,0xb7628ffb
	.word	0xfbd3046a,0x896b78f6,0x92f84d36,0xc51001e5
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
	.word	0xe82004ba,0xf7edc55f,0x623dece3,0x4ea85da0
	.word	0xe5a8302b,0xc2cf4497,0x58c6b939,0x1c365040
	.word	0x63c30925,0x47e764a1,0xe1cb281e,0xe680c94e
	.word	0x94652c73,0x35a29a77,0x4680de71,0x679fb42a
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
	.word	0xba92bee5,0x68201072,0x8280fab7,0xec6db82e
	.word	0x742793c6,0xc8a25be4,0x0c337858,0x9882348b
	.word	0xc3a22967,0xd67646be,0x636b7ec9,0xdc4dc54d
	.word	0xb680d570,0x7db74a86,0x7a901f01,0xf8a33c2c
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
	.word	0x5685e51a,0x0199c9cf,0x9519ea91,0xa7f7a594
	.word	0x9a31cce3,0xbced6bd7,0xb57909bc,0xee0f9a59
	.word	0x314251af,0x98c65268,0xa9c9a463,0xfd9596d4
	.word	0x8f6ec37b,0xeb58df15,0x4661878c,0x0a0852c3
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
	.word	0x42ad7920,0xdfad4dd8,0x59b48bf1,0x8cb4bb49
	.word	0xba392524,0x6944ad70,0xa7f01883,0x465f0504
	.word	0x397c8aa0,0xbee5230a,0x3b23e262,0x2f9f6556
	.word	0x3f7d0379,0x5e98b63a,0xa990712d,0xe478d54c
	.word	0xf7d612f0,0xfcb1697f,0x8b838890,0x972be596
	.word	0x59f486e9,0x2019ca14,0x5ca1282f,0x52ae5c3e
	.word	0x4409be45,0x4a71e3d2,0xe8f29887,0xce58e1c5
	.word	0x1cdfc874,0xf279edc6,0xb5913e7c,0xfda2572e
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
	.word	0x4a513616,0x87e33b6e,0xa9b0e0f7,0xde87443a
	.word	0x4c313d8a,0x4a3b3c4d,0xfc03dda7,0x8cc4cca8
	.word	0xbb57cf14,0xeb309093,0x754b1d63,0x15d3573b
	.word	0xa3093a57,0x6db0bc58,0x4b19d1f3,0x8e6ecc01
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
	.word	0x4babfc74,0x54258e6f,0x97daabb4,0xec33770c
	.word	0x88d24818,0xdb0b54b8,0x87d35764,0x3cfd848b
	.word	0x6ad24afb,0xc5ded5d3,0xf9c70337,0x5cc4c795
	.word	0x5e156170,0xd3c1b962,0xf2c1e053,0x51d38f2d
	.word	0xa2f759f3,0xc004d813,0x1c07d7c6,0xdceac7c5
	.word	0x56aa1258,0x0a9d06fd,0x46635abe,0xa5a32c35
	.word	0x0212a567,0x64d4c637,0x87287658,0x109a856c
	.word	0x40adf579,0xb25d5b8c,0x630846b2,0x5085a834
	.word	0x653fd437,0x6d73a6ec,0xac9bd2a7,0x364370fc
	.word	0x80a18bcf,0xb5e5df9d,0xdec4e3a2,0x6acf0246
	.word	0x6a1c541b,0x4ea16427,0x533872c9,0xfb97db7c
	.word	0x6ab87262,0x5a11776f,0x8afedbe2,0x0f62ed1a
	.word	0xdde1f22b,0xc7a6ed77,0xb00d1719,0x45c0ead3
	.word	0xf1ccb16c,0x70790036,0x43dbe6a2,0x27719d37
	.word	0x06cc469a,0x9b3eb0b1,0x009dded2,0x98707286
	.word	0xde6c8a96,0x6e850889,0xa50c2478,0x482c37b2
	.word	0xda77b18b,0xc0b35fb7,0x894fe99c,0xfa9ac28c
	.word	0xa8f3d5ba,0x738a27b7,0x64bc47bf,0x91594d7a
	.word	0xd3d417cd,0x5e1c921c,0xd2af2f59,0x759f6033
	.word	0x29b6fdb7,0x9ccfbd88,0x06688441,0xddab6714
	.word	0x56535fa3,0x95f348b0,0x2db6ddd5,0x92557347
	.word	0xb3bfc67f,0x8c0d38cb,0x527710ad,0x34cd01b7
	.word	0x579f5cb2,0x31df7199,0x19ab9eb6,0x5f6facfb
	.word	0x424bfaa9,0xaa8e179d,0x0dc0e9bd,0x188696b6
	.word	0x5050a73c,0x2db7aa9f,0xf78f5a23,0x5dba78a0
	.word	0xd6ac3ba5,0x776e0200,0xebf77972,0x5983d54c
	.word	0x998c9e8a,0x17e1eb6f,0x64b91011,0x9f3f5f4e
	.word	0x6015338d,0xea87e905,0x1956b71d,0xe917168a
	.word	0xe2274442,0xa3a1a62b,0x447dfa30,0xdd801667
	.word	0x47ed7c77,0x44547127,0x2609125e,0x66829f4d
	.word	0xc6fdbc38,0xbb98ccc9,0x2796b767,0xf9344aa4
	.word	0x548dc523,0xa500e05f,0x26b2eda6,0x51b73e39
share3_end:
