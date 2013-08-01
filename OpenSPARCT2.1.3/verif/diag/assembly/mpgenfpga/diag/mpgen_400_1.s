/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_400_1.s
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
!	Seed = 327141849
!	Riesling can be on
!	1 Thread, 400 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_400_1.s created on Mar 27, 2009 (14:18:49)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_400_1 -p 1 -l 400

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
!	%f0  = 1cc4ef06 11bb5b80 9b3fc076 7f4197f4
!	%f4  = e12ed996 558b8924 2b4a8a4f da763c8f
!	%f8  = 5a6976ca f6c155f6 ae479939 7edb5512
!	%f12 = 883b9063 fbcadb6b 7e16a1da 4171fb46
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 6c8d6f51 f05f3c57 19ab2a7a 7b0fecfa
!	%f20 = 01f0f213 638e3258 9eac79fb 82f81466
!	%f24 = 8f931556 3e3afa1e cd5a8ead 54fb148e
!	%f28 = 9677a534 636c5a90 430c8ca2 c9cd084f
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 5cbfae9d 8115ea5b 25479f92 88d790a7
!	%f36 = 8e81b953 c02f20e8 780e1187 66202a73
!	%f40 = 5008158b 70cf906d 10624502 9347cb08
!	%f44 = 42faed94 96791945 14e2b4cf 2c461fea
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x321a38e80000007d,%g7,%g1 ! GSR scale = 15, align = 5
	wr	%g1,%g0,%gsr		! GSR = 321a38e80000007d
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l0 = 5c1ddcb203bac9ef, imm = fffffffffffffac0, %l0 = 5c1ddcb203bac9ef
	xnor	%l0,-0x540,%l0		! %l0 = 5c1ddcb203baccd0
!	Mem[0000000010141400] = 780e373a0814e7d7, %f18 = 19ab2a7a 7b0fecfa
	ldda	[%i5+%g0]0x88,%f18	! %f18 = 780e373a 0814e7d7
!	%f20 = 01f0f213 638e3258, %l3 = a6757cc427f500e7
!	Mem[0000000030101408] = 701b83712037be79
	add	%i4,0x008,%g1
	stda	%f20,[%g1+%l3]ASI_PST16_S ! Mem[0000000030101408] = 701bf213638e3258
!	Mem[0000000010101430] = 6848025a, %f2  = 9b3fc076
	lda	[%i4+0x030]%asi,%f2 	! %f2 = 6848025a
!	Mem[0000000010181410] = c8a8cb20, %l2 = 5979c59ba55ee6a3
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000020000000ff
!	Mem[00000000100c1420] = b446531f6faac087, %l6 = f7de1af8726bdb14
	ldxa	[%i3+0x020]%asi,%l6	! %l6 = b446531f6faac087
!	Mem[0000000010041410] = 6dc19768, %l1 = f5f7578c42919d25
	lduh	[%i1+%o5],%l1		! %l1 = 0000000000006dc1
!	%l6 = b446531f6faac087, Mem[00000000211c0001] = fa597fdc
	stb	%l6,[%o2+0x001]		! Mem[00000000211c0000] = fa877fdc
!	Mem[00000000100c1410] = 872bb17d, %l4 = 1a321a2a98290373
	lduba	[%i3+%o5]0x88,%l4	! %l4 = 000000000000007d
!	Starting 10 instruction Store Burst
!	%l2 = 00000020, %l3 = 27f500e7, Mem[0000000010041410] = 6dc19768 27314a59
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000020 27f500e7

p0_label_2:
!	Mem[0000000010081400] = b38ed1fa, %l4 = 000000000000007d
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 000000b3000000ff
!	%l6 = b446531f6faac087, Mem[00000000211c0001] = fa877fdc, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = fa877fdc
!	Mem[00000000100c1408] = 1231bb46, %l4 = 00000000000000b3
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 00000012000000ff
!	%f10 = ae479939, Mem[0000000010141400] = d7e71408
	sta	%f10,[%i5+%g0]0x80	! Mem[0000000010141400] = ae479939
!	%l6 = 6faac087, %l7 = a8607ae4, Mem[0000000010001400] = 51e2bae9 4f7709ff
	stda	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 6faac087 a8607ae4
!	%l6 = 6faac087, %l7 = a8607ae4, Mem[0000000030101410] = 8b90c238 89fe37c4
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 6faac087 a8607ae4
!	%l2 = 0000000000000020, Mem[0000000010101400] = a211d7fc
	stba	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 2011d7fc
!	%l2 = 0000000000000020, Mem[00000000100c140c] = 7fe6ab73
	stw	%l2,[%i3+0x00c]		! Mem[00000000100c140c] = 00000020
!	Mem[0000000030181408] = 8dc07560, %l3 = a6757cc427f500e7
	swapa	[%i6+%o4]0x89,%l3	! %l3 = 000000008dc07560
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 6faac087, %f11 = 7edb5512
	lda	[%i0+%g0]0x80,%f11	! %f11 = 6faac087

p0_label_3:
!	Mem[0000000010181410] = ffcba8c8, %l1 = 0000000000006dc1
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1414] = 34c02ab1, %l5 = 08c34e6e42942d06
	ldsha	[%i3+0x016]%asi,%l5	! %l5 = 0000000000002ab1
!	Mem[0000000030041408] = ca28027c, %l2 = 0000000000000020
	ldsba	[%i1+%o4]0x89,%l2	! %l2 = 000000000000007c
!	Mem[0000000010181408] = 8a49c73463294e77, %f12 = 883b9063 fbcadb6b
	ldd	[%i6+%o4],%f12		! %f12 = 8a49c734 63294e77
!	%f30 = 430c8ca2, %f28 = 9677a534, %f28 = 9677a534
	fsubs	%f30,%f28,%f28		! %f28 = 430c8ca2
!	Mem[0000000030101410] = 6faac087, %l0 = 5c1ddcb203baccd0
	lduha	[%i4+%o5]0x81,%l0	! %l0 = 0000000000006faa
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030101400] = 616b1647 0cbf59d3 701bf213 638e3258
!	Mem[0000000030101410] = 6faac087 a8607ae4 022d3d25 41beac25
!	Mem[0000000030101420] = ed2f139a af9e27bd e122d6a9 5a7d01a6
!	Mem[0000000030101430] = 036ec2ad fecd2424 d8d4fc61 3607b4bf
	ldda	[%i4]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030101400
!	Mem[0000000010081400] = ff8ed1fa808695a1, %f28 = 430c8ca2 636c5a90
	ldda	[%i2+%g0]0x80,%f28	! %f28 = ff8ed1fa 808695a1
!	Mem[0000000010101400] = 2011d7fc 9bd23bb2 d2d75a07 1e2383c4
!	Mem[0000000010101410] = 4ecacd8a 60070c7c a4563c50 1ad51c87
!	Mem[0000000010101420] = 0a38f4ab 01ea11b0 b8b92e18 ec4806e0
!	Mem[0000000010101430] = 6848025a 9508be0d 5564060b be510f69
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 0e440b1e, %l1 = ffffffffffffffff
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 000000000e440b1e

p0_label_4:
!	%l2 = 000000000000007c, Mem[0000000010001416] = 3bdbfab6
	stb	%l2,[%i0+0x016]		! Mem[0000000010001414] = 3bdb7cb6
!	Mem[0000000010181420] = 4769515b0989201a, %l2 = 000000000000007c, %l2 = 000000000000007c
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = 4769515b0989201a
!	Mem[0000000010001420] = 5a26c80a, %l6 = b446531f6faac087
	swap	[%i0+0x020],%l6		! %l6 = 000000005a26c80a
!	%f24 = 8f931556 3e3afa1e, %l2 = 4769515b0989201a
!	Mem[0000000030081400] = 007ff2e95a9de4ea
	stda	%f24,[%i2+%l2]ASI_PST8_SL ! Mem[0000000030081400] = 00faf23e569de4ea
!	Mem[00000000100c1400] = 889eabf0, %l0 = 0000000000006faa
	ldstuba	[%i3+%g0]0x88,%l0	! %l0 = 000000f0000000ff
!	%l2 = 0989201a, %l3 = 8dc07560, Mem[0000000010041420] = f8a994eb fb9e6f01
	stda	%l2,[%i1+0x020]%asi	! Mem[0000000010041420] = 0989201a 8dc07560
	membar	#Sync			! Added by membar checker (2)
!	%l4 = 00000012, %l5 = 00002ab1, Mem[0000000030101410] = 87c0aa6f e47a60a8
	stda	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000012 00002ab1
!	Mem[0000000030001400] = 8ee179ea, %l5 = 0000000000002ab1
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 000000008ee179ea
!	%f0  = 2011d7fc 9bd23bb2 d2d75a07 1e2383c4
!	%f4  = 4ecacd8a 60070c7c a4563c50 1ad51c87
!	%f8  = 0a38f4ab 01ea11b0 b8b92e18 ec4806e0
!	%f12 = 6848025a 9508be0d 5564060b be510f69
	stda	%f0,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = c920a977, %l7 = a97cdac1a8607ae4
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffc920

p0_label_5:
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010041400] = 87c31993 026adde4 d771bfc8 58f92337
!	Mem[0000000010041410] = 00000020 27f500e7 516620d4 d4d29d36
!	Mem[0000000010041420] = 0989201a 8dc07560 6961ecbe 4cb570a3
!	Mem[0000000010041430] = 659692dd d256d61b 4d41dc2e dfa1ed8a
	ldda	[%i1]ASI_BLK_AIUP,%f16	! Block Load from 0000000010041400
!	Mem[0000000010181408] = 8a49c734, %l3 = 000000008dc07560
	lduwa	[%i6+0x008]%asi,%l3	! %l3 = 000000008a49c734
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 00000000000000f0
	setx	0x41e0b6805020c049,%g7,%l0 ! %l0 = 41e0b6805020c049
!	%l1 = 000000000e440b1e
	setx	0xa6bbc8f791dc6f9f,%g7,%l1 ! %l1 = a6bbc8f791dc6f9f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 41e0b6805020c049
	setx	0x68ce0a887a457aa8,%g7,%l0 ! %l0 = 68ce0a887a457aa8
!	%l1 = a6bbc8f791dc6f9f
	setx	0x4a0fa1b046d8432b,%g7,%l1 ! %l1 = 4a0fa1b046d8432b
!	Mem[0000000030001408] = 96663fa9e0799ca9, %l3 = 000000008a49c734
	ldxa	[%i0+%o4]0x89,%l3	! %l3 = 96663fa9e0799ca9
!	Mem[0000000030081400] = 00faf23e, %f14 = 5564060b
	lda	[%i2+%g0]0x81,%f14	! %f14 = 00faf23e
!	Mem[0000000030141408] = 7cd578437e90290b, %l3 = 96663fa9e0799ca9
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = 7cd578437e90290b
!	Mem[0000000010141410] = c6bbdf3b, %l2 = 4769515b0989201a
	lduba	[%i5+%o5]0x88,%l2	! %l2 = 000000000000003b
!	Mem[0000000030181400] = 2eadec1c, %l3 = 7cd578437e90290b
	lduba	[%i6+%g0]0x81,%l3	! %l3 = 000000000000002e
!	Mem[0000000010041424] = 8dc07560, %f11 = ec4806e0
	ld	[%i1+0x024],%f11	! %f11 = 8dc07560
!	Starting 10 instruction Store Burst
!	%l6 = 000000005a26c80a, Mem[00000000211c0000] = fa877fdc
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = c80a7fdc

p0_label_6:
!	Mem[0000000030081410] = 524a35b3, %l2 = 000000000000003b
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 00000052000000ff
!	%l7 = ffffffffffffc920, Mem[0000000010081408] = 2ccb1377
	stha	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = c9201377
!	Mem[0000000030101400] = 47166b61, %l0 = 68ce0a887a457aa8
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 00000061000000ff
!	Mem[0000000030181400] = 1cecad2e, %l2 = 0000000000000052
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 0000002e000000ff
!	%f2  = d2d75a07, Mem[0000000010141400] = ae479939
	sta	%f2 ,[%i5+%g0]0x80	! Mem[0000000010141400] = d2d75a07
!	%l7 = ffffffffffffc920, Mem[0000000010181408] = 34c7498a
	stha	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 34c7c920
!	%f12 = 6848025a 9508be0d, Mem[00000000300c1408] = 3bd3dfd0 41143843
	stda	%f12,[%i3+%o4]0x81	! Mem[00000000300c1408] = 6848025a 9508be0d
!	%l0 = 0000000000000061, Mem[0000000010101408] = 075ad7d2
	stha	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 075a0061
!	%l6 = 000000005a26c80a, Mem[00000000100c1430] = 3dc99f1167bb5cc4
	stx	%l6,[%i3+0x030]		! Mem[00000000100c1430] = 000000005a26c80a
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 740ea328, %l5 = 000000008ee179ea
	ldsba	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000074

p0_label_7:
!	Mem[0000000030001408] = a99c79e0, %l2 = 000000000000002e
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = ffffffffa99c79e0
!	Mem[0000000010181408] = 34c7c920, %l1 = 4a0fa1b046d8432b
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 0000000034c7c920
!	Mem[00000000300c1400] = 9bb6e523, %l7 = ffffffffffffc920
	lduba	[%i3+%g0]0x81,%l7	! %l7 = 000000000000009b
!	Mem[00000000300c1410] = 5cf99de5 c298736b, %l4 = 00000012, %l5 = 00000074
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 00000000c298736b 000000005cf99de5
!	Mem[0000000010181408] = 20c9c73463294e77, %l7 = 000000000000009b
	ldxa	[%i6+%o4]0x80,%l7	! %l7 = 20c9c73463294e77
!	Mem[0000000030001408] = 96663fa9e0799ca9, %l0 = 0000000000000061
	ldxa	[%i0+%o4]0x89,%l0	! %l0 = 96663fa9e0799ca9
!	Mem[0000000010141400] = 075ad7d2, %l6 = 000000005a26c80a
	lduwa	[%i5+%g0]0x88,%l6	! %l6 = 00000000075ad7d2
!	Mem[0000000030081410] = b3354aff, %l2 = ffffffffa99c79e0
	lduwa	[%i2+%o5]0x89,%l2	! %l2 = 00000000b3354aff
!	Mem[0000000030181400] = 9f7196df1cecadff, %l0 = 96663fa9e0799ca9
	ldxa	[%i6+%g0]0x89,%l0	! %l0 = 9f7196df1cecadff
!	Starting 10 instruction Store Burst
!	%f13 = 9508be0d, Mem[0000000010141400] = 075ad7d2
	sta	%f13,[%i5+%g0]0x88	! Mem[0000000010141400] = 9508be0d

p0_label_8:
!	%l0 = 9f7196df1cecadff, Mem[00000000100c1410] = 7db12b8734c02ab1
	stxa	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 9f7196df1cecadff
!	%f9  = 01ea11b0, Mem[0000000030181410] = 7b5b6d7d
	sta	%f9 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 01ea11b0
!	%f20 = 00000020 27f500e7, %l2 = 00000000b3354aff
!	Mem[0000000010081410] = 4765f615a82049d9
	add	%i2,0x010,%g1
	stda	%f20,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010081410] = e700f52720000000
!	%f23 = d4d29d36, Mem[0000000030141410] = d39a7694
	sta	%f23,[%i5+%o5]0x81	! Mem[0000000030141410] = d4d29d36
!	Mem[00000000300c1408] = 6848025a, %l4 = 00000000c298736b
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 000000006848025a
	membar	#Sync			! Added by membar checker (4)
!	%l2 = b3354aff, %l3 = 0000002e, Mem[0000000010041400] = 9319c387 e4dd6a02
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = b3354aff 0000002e
!	%l2 = b3354aff, %l3 = 0000002e, Mem[0000000010041408] = d771bfc8 58f92337
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = b3354aff 0000002e
!	Mem[0000000010141400] = 0dbe0895, %l7 = 20c9c73463294e77, %asi = 80
	swapa	[%i5+0x000]%asi,%l7	! %l7 = 000000000dbe0895
!	%f5  = 60070c7c, Mem[00000000100c1408] = 46bb31ff
	sta	%f5 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 60070c7c
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = b23bd29bfcd71120, %l4 = 000000006848025a
	ldxa	[%i1+%g0]0x81,%l4	! %l4 = b23bd29bfcd71120

p0_label_9:
!	Mem[0000000030041400] = b23bd29b fcd71120 c483231e 075ad7d2
!	Mem[0000000030041410] = 7c0c0760 8acdca4e 871cd51a 503c56a4
!	Mem[0000000030041420] = b011ea01 abf4380a e00648ec 182eb9b8
!	Mem[0000000030041430] = 0dbe0895 5a024868 690f51be 0b066455
	ldda	[%i1]ASI_BLK_AIUS,%f16	! Block Load from 0000000030041400
!	Mem[0000000010081400] = a1958680fad18eff, %l6 = 00000000075ad7d2
	ldxa	[%i2+%g0]0x88,%l6	! %l6 = a1958680fad18eff
!	Mem[0000000020800000] = 28a38205, %l7 = 000000000dbe0895
	lduba	[%o1+0x001]%asi,%l7	! %l7 = 00000000000000a3
!	Mem[0000000010081424] = 0168627b, %l7 = 00000000000000a3
	lduba	[%i2+0x024]%asi,%l7	! %l7 = 0000000000000001
!	Mem[0000000010001424] = 47895f38, %l1 = 0000000034c7c920
	lduba	[%i0+0x027]%asi,%l1	! %l1 = 0000000000000038
!	%f8  = 0a38f4ab, %f2  = d2d75a07, %f2  = d2d75a07
	fsubs	%f8 ,%f2 ,%f2 		! %f2  = 52d75a07
!	Mem[0000000030101410] = 12000000b12a0000, %f12 = 6848025a 9508be0d
	ldda	[%i4+%o5]0x81,%f12	! %f12 = 12000000 b12a0000
!	Mem[00000000201c0000] = c920a977, %l1 = 0000000000000038
	lduba	[%o0+0x001]%asi,%l1	! %l1 = 0000000000000020
!	%f2  = 52d75a07, %f7  = 1ad51c87
	fcmpes	%fcc3,%f2 ,%f7 		! %fcc3 = 2
!	Starting 10 instruction Store Burst
!	%l4 = b23bd29bfcd71120, Mem[0000000030081410] = ff4a35b3
	stwa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = fcd71120

p0_label_10:
!	%l7 = 0000000000000001, Mem[0000000030181410] = 01ea11b0
	stha	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 000111b0
!	%l2 = 00000000b3354aff, imm = 000000000000014a, %l6 = a1958680fad18eff
	xor	%l2,0x14a,%l6		! %l6 = 00000000b3354bb5
!	%f4  = 4ecacd8a 60070c7c, Mem[0000000010081410] = 27f500e7 00000020
	stda	%f4 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 4ecacd8a 60070c7c
!	%l0 = 1cecadff, %l1 = 00000020, Mem[0000000010041410] = 00000020 27f500e7
	stda	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 1cecadff 00000020
!	%l1 = 0000000000000020, Mem[0000000010141410] = 0b2f3955c6bbdf3b
	stxa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000020
!	%f6  = a4563c50, Mem[0000000010141400] = 63294e77
	sta	%f6 ,[%i5+%g0]0x80	! Mem[0000000010141400] = a4563c50
!	Mem[0000000030141400] = ffffffff, %l2 = 00000000b3354aff
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010081410] = 60070c7c, %l2 = 00000000000000ff
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 0000007c000000ff
	membar	#Sync			! Added by membar checker (5)
!	%l2 = 000000000000007c, Mem[0000000030041400] = 9bd23bb2
	stwa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000007c
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 0951d5c23bdb7cb6, %l7 = 0000000000000001
	ldxa	[%i0+%o5]0x80,%l7	! %l7 = 0951d5c23bdb7cb6

p0_label_11:
!	Mem[0000000010041408] = b3354aff0000002e, %l6 = 00000000b3354bb5
	ldxa	[%i1+%o4]0x80,%l6	! %l6 = b3354aff0000002e
!	Mem[0000000030001408] = e0799ca9, %l4 = b23bd29bfcd71120
	ldsha	[%i0+%o4]0x89,%l4	! %l4 = ffffffffffff9ca9
!	Mem[00000000300c1400] = 9bb6e523, %l1 = 0000000000000020
	lduba	[%i3+%g0]0x81,%l1	! %l1 = 000000000000009b
!	Mem[0000000010181410] = ffcba8c8, %f3  = 1e2383c4
	lda	[%i6+%o5]0x80,%f3 	! %f3 = ffcba8c8
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 9f7196df1cecadff
	setx	0x942975b012a1adfa,%g7,%l0 ! %l0 = 942975b012a1adfa
!	%l1 = 000000000000009b
	setx	0x3340fdf8101943fa,%g7,%l1 ! %l1 = 3340fdf8101943fa
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 942975b012a1adfa
	setx	0x0cf9fb9ff568aa2e,%g7,%l0 ! %l0 = 0cf9fb9ff568aa2e
!	%l1 = 3340fdf8101943fa
	setx	0x152b9b6837faf5bc,%g7,%l1 ! %l1 = 152b9b6837faf5bc
!	Mem[00000000300c1400] = 9bb6e523 3a39647a c298736b 9508be0d
!	Mem[00000000300c1410] = 6b7398c2 e59df95c 3a3fdf7f 62b75853
!	Mem[00000000300c1420] = 859ea2cd 20c72c48 31b40122 a7fca223
!	Mem[00000000300c1430] = 73debf3b 80583b4e 07fbeb25 082dfea0
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030101408] = 13f21b70, %l3 = 000000000000002e
	ldsba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000070
!	Mem[0000000010101410] = 4ecacd8a, %l6 = b3354aff0000002e
	ldswa	[%i4+%o5]0x80,%l6	! %l6 = 000000004ecacd8a
!	Mem[00000000100c1418] = 8950e1f04be97d13, %l3 = 0000000000000070
	ldxa	[%i3+0x018]%asi,%l3	! %l3 = 8950e1f04be97d13
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000007c, Mem[0000000030101410] = 00000012
	stwa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000007c

p0_label_12:
!	Mem[00000000218001c1] = 118e79c5, %l2 = 000000000000007c
	ldstub	[%o3+0x1c1],%l2		! %l2 = 0000008e000000ff
!	%l1 = 152b9b6837faf5bc, Mem[0000000010081408] = c9201377
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = bc201377
!	%l5 = 000000005cf99de5, Mem[0000000030001410] = 26f1e63a
	stwa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 5cf99de5
!	Mem[00000000211c0001] = c80a7fdc, %l6 = 000000004ecacd8a
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 0000000a000000ff
!	%f27 = 182eb9b8, Mem[0000000010081408] = bc201377
	sta	%f27,[%i2+%o4]0x80	! Mem[0000000010081408] = 182eb9b8
!	%l3 = 8950e1f04be97d13, Mem[0000000010181408] = 20c9c734
	stba	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 13c9c734
!	%l6 = 000000000000000a, Mem[0000000010181410] = ffcba8c802f4e2e0
	stxa	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000000000000a
!	%f16 = b23bd29b fcd71120, %l7 = 0951d5c23bdb7cb6
!	Mem[0000000010181400] = 9775f57498c410c4
	stda	%f16,[%i6+%l7]ASI_PST16_PL ! Mem[0000000010181400] = 9775d7fc9bd210c4
!	%f26 = e00648ec 182eb9b8, %l4 = ffffffffffff9ca9
!	Mem[0000000010141420] = 4bb5d947c6d74810
	add	%i5,0x020,%g1
	stda	%f26,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010141420] = b8b92e18c6d74810
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 7c0c07608acdca4e, %f20 = 7c0c0760 8acdca4e
	ldda	[%i1+%o5]0x81,%f20	! %f20 = 7c0c0760 8acdca4e

p0_label_13:
!	Mem[00000000100c1400] = ffab9e88, %l7 = 0951d5c23bdb7cb6
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000ffab
!	Mem[0000000010181430] = 295d3b9f, %l0 = 0cf9fb9ff568aa2e
	lduha	[%i6+0x032]%asi,%l0	! %l0 = 0000000000003b9f
!	Mem[0000000030101408] = 13f21b70, %l5 = 000000005cf99de5
	ldswa	[%i4+%o4]0x89,%l5	! %l5 = 0000000013f21b70
!	Mem[0000000030141400] = ffffffff 81154b27, %l2 = 0000008e, %l3 = 4be97d13
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000ffffffff 0000000081154b27
!	Mem[0000000030181408] = 27f500e7, %l0 = 0000000000003b9f
	lduba	[%i6+%o4]0x89,%l0	! %l0 = 00000000000000e7
!	Mem[00000000300c1408] = 0dbe08956b7398c2, %l2 = 00000000ffffffff
	ldxa	[%i3+%o4]0x89,%l2	! %l2 = 0dbe08956b7398c2
!	Mem[0000000021800180] = 99c2f773, %l2 = 0dbe08956b7398c2
	lduh	[%o3+0x180],%l2		! %l2 = 00000000000099c2
!	%l1 = 152b9b6837faf5bc, %l0 = 00000000000000e7, %y  = 00000000
	udiv	%l1,%l0,%l3		! %l3 = 00000000003e09ed
	mov	%l0,%y			! %y = 000000e7
!	Mem[0000000010101400] = fcd71120, %l5 = 0000000013f21b70
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000001120
!	Starting 10 instruction Store Burst
!	%f20 = 7c0c0760, Mem[0000000030101410] = 0000007c
	sta	%f20,[%i4+%o5]0x89	! Mem[0000000030101410] = 7c0c0760

p0_label_14:
!	%l4 = ffffffffffff9ca9, Mem[0000000030101408] = 13f21b70
	stha	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 13f29ca9
!	%f26 = e00648ec, Mem[0000000010101420] = 0a38f4ab
	st	%f26,[%i4+0x020]	! Mem[0000000010101420] = e00648ec
!	%l2 = 00000000000099c2, Mem[0000000010001400] = 6faac087a8607ae4, %asi = 80
	stxa	%l2,[%i0+0x000]%asi	! Mem[0000000010001400] = 00000000000099c2
!	Mem[00000000100c1410] = df96719f, %l4 = ffffffffffff9ca9
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 00000000df96719f
!	Mem[0000000010141400] = 503c56a4, %l4 = 00000000df96719f
	swapa	[%i5+%g0]0x88,%l4	! %l4 = 00000000503c56a4
!	Mem[0000000010001430] = d2014b45, %l2 = 00000000000099c2
	swap	[%i0+0x030],%l2		! %l2 = 00000000d2014b45
!	%f27 = 182eb9b8, Mem[0000000010041410] = ffadec1c
	sta	%f27,[%i1+%o5]0x88	! Mem[0000000010041410] = 182eb9b8
!	%f30 = 690f51be, Mem[0000000010101424] = 01ea11b0
	sta	%f30,[%i4+0x024]%asi	! Mem[0000000010101424] = 690f51be
!	Mem[0000000020800041] = 813933c3, %l0 = 00000000000000e7
	ldstub	[%o1+0x041],%l0		! %l0 = 00000039000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = c483231e075a0061, %f0  = 9bb6e523 3a39647a
	ldda	[%i4+%o4]0x88,%f0 	! %f0  = c483231e 075a0061

p0_label_15:
!	Mem[0000000010141400] = 9f7196df, %f25 = abf4380a
	lda	[%i5+%g0]0x80,%f25	! %f25 = 9f7196df
!	Mem[0000000030141400] = ffffffff, %f7  = 62b75853
	lda	[%i5+%g0]0x89,%f7 	! %f7 = ffffffff
!	Mem[0000000010141404] = 3a370e78, %l2 = 00000000d2014b45
	ldsw	[%i5+0x004],%l2		! %l2 = 000000003a370e78
!	Mem[00000000211c0000] = c8ff7fdc, %l6 = 000000000000000a
	ldsba	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffffffc8
!	Mem[00000000100c1408] = 20000000 60070c7c, %l4 = 503c56a4, %l5 = 00001120
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 0000000060070c7c 0000000020000000
!	%l5 = 0000000020000000, Mem[00000000211c0000] = c8ff7fdc, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00007fdc
!	Mem[0000000030001408] = a99c79e0, %l2 = 000000003a370e78
	lduwa	[%i0+%o4]0x81,%l2	! %l2 = 00000000a99c79e0
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010181400] = 9775d7fc 9bd210c4 13c9c734 63294e77
!	Mem[0000000010181410] = 00000000 0000000a e469d714 5f1fffa0
!	Mem[0000000010181420] = 4769515b 0989201a 1986cff4 d10592fe
!	Mem[0000000010181430] = 295d3b9f 1c017674 1b3a4718 cee2dc88
	ldda	[%i6]ASI_BLK_PL,%f0	! Block Load from 0000000010181400
!	%f24 = b011ea01, %f31 = 0b066455, %f26 = e00648ec
	fmuls	%f24,%f31,%f26		! %l0 = 000000000000005b, Unfinished, %fsr = 2000000000
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ffab, Mem[0000000030041400] = 0000007c
	stwa	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000ffab

p0_label_16:
!	Mem[0000000030101408] = 13f29ca9, %l4 = 0000000060070c7c
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 0000000013f29ca9
!	Mem[0000000010081408] = 182eb9b8, %l0 = 000000000000005b, %asi = 80
	swapa	[%i2+0x008]%asi,%l0	! %l0 = 00000000182eb9b8
!	%f18 = c483231e 075ad7d2, %l4 = 0000000013f29ca9
!	Mem[0000000010081420] = fd3094530168627b
	add	%i2,0x020,%g1
	stda	%f18,[%g1+%l4]ASI_PST8_P ! Mem[0000000010081420] = c4302353076862d2
!	%f16 = b23bd29b fcd71120, Mem[0000000010041400] = ff4a35b3 2e000000
	stda	%f16,[%i1+%g0]0x80	! Mem[0000000010041400] = b23bd29b fcd71120
	membar	#Sync			! Added by membar checker (7)
!	%f24 = b011ea01 9f7196df, Mem[0000000010181410] = 00000000 0000000a
	stda	%f24,[%i6+0x010]%asi	! Mem[0000000010181410] = b011ea01 9f7196df
!	%l3 = 00000000003e09ed, Mem[0000000030041408] = c483231e
	stwa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 003e09ed
!	%l0 = 182eb9b8, %l1 = 37faf5bc, Mem[0000000010181408] = 13c9c734 63294e77
	std	%l0,[%i6+%o4]		! Mem[0000000010181408] = 182eb9b8 37faf5bc
!	%l0 = 00000000182eb9b8, Mem[0000000021800081] = cc67fdf4, %asi = 80
	stba	%l0,[%o3+0x081]%asi	! Mem[0000000021800080] = ccb8fdf4
!	%l7 = 000000000000ffab, Mem[00000000100c1430] = 00000000
	stw	%l7,[%i3+0x030]		! Mem[00000000100c1430] = 0000ffab
!	Starting 10 instruction Load Burst
!	Mem[0000000010081434] = df4e814b, %l0 = 00000000182eb9b8
	lduwa	[%i2+0x034]%asi,%l0	! %l0 = 00000000df4e814b

p0_label_17:
!	Mem[0000000010081410] = 60070cff, %l2 = 00000000a99c79e0
	lduha	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000cff
!	Mem[0000000010141410] = 2000000000000000, %f24 = b011ea01 9f7196df
	ldda	[%i5+%o5]0x80,%f24	! %f24 = 20000000 00000000
!	Mem[0000000010041400] = 9bd23bb2, %l1 = 152b9b6837faf5bc
	ldsba	[%i1+%g0]0x88,%l1	! %l1 = ffffffffffffffb2
!	Mem[0000000030041408] = 003e09ed075ad7d2, %l4 = 0000000013f29ca9
	ldxa	[%i1+%o4]0x81,%l4	! %l4 = 003e09ed075ad7d2
!	Mem[0000000010081410] = ff0c0760, %l2 = 0000000000000cff
	lduwa	[%i2+%o5]0x80,%l2	! %l2 = 00000000ff0c0760
!	Mem[0000000030041410] = 7c0c07608acdca4e, %f14 = 88dce2ce 18473a1b
	ldda	[%i1+%o5]0x81,%f14	! %f14 = 7c0c0760 8acdca4e
!	Mem[0000000010101400] = 2011d7fc9bd23bb2, %f26 = e00648ec 182eb9b8
	ldda	[%i4+%g0]0x80,%f26	! %f26 = 2011d7fc 9bd23bb2
!	Mem[0000000010101408] = 61005a07, %l7 = 000000000000ffab
	lduba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000061
!	Mem[0000000030141408] = 7cd578437e90290b, %l2 = 00000000ff0c0760
	ldxa	[%i5+%o4]0x89,%l2	! %l2 = 7cd578437e90290b
!	Starting 10 instruction Store Burst
!	%l3 = 00000000003e09ed, Mem[0000000010181410] = 01ea11b0
	stwa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 003e09ed

p0_label_18:
!	Mem[0000000030001410] = 5cf99de5, %l4 = 003e09ed075ad7d2
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 000000005cf99de5
!	Mem[0000000010181408] = 182eb9b8, %l7 = 0000000000000061
	ldstuba	[%i6+%o4]0x80,%l7	! %l7 = 00000018000000ff
!	%l1 = ffffffffffffffb2, Mem[00000000100c1408] = 7c0c0760
	stha	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffb20760
!	%f12 = 7476011c 9f3b5d29, %l7 = 0000000000000018
!	Mem[0000000010041418] = 516620d4d4d29d36
	add	%i1,0x018,%g1
	stda	%f12,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010041418] = 5166209f1cd29d36
!	Mem[00000000201c0000] = c920a977, %l3 = 00000000003e09ed
	ldstub	[%o0+%g0],%l3		! %l3 = 000000c9000000ff
!	%f15 = 8acdca4e, Mem[0000000010081424] = 076862d2
	sta	%f15,[%i2+0x024]%asi	! Mem[0000000010081424] = 8acdca4e
!	%l0 = 00000000df4e814b, Mem[0000000030001408] = 96663fa9e0799ca9
	stxa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000df4e814b
!	%l0 = 00000000df4e814b, Mem[0000000010081410] = ff0c0760
	stwa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = df4e814b
!	%l0 = 00000000df4e814b, imm = 000000000000099a, %l7 = 0000000000000018
	addc	%l0,0x99a,%l7		! %l7 = 00000000df4e8ae5
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = b446531f, %l4 = 000000005cf99de5
	swap	[%i3+0x020],%l4		! %l4 = 00000000b446531f

p0_label_19:
!	Mem[0000000030101410] = 00002ab17c0c0760, %l6 = ffffffffffffffc8
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 00002ab17c0c0760
!	Mem[0000000030101400] = d359bf0c 47166bff, %l2 = 7e90290b, %l3 = 000000c9
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 0000000047166bff 00000000d359bf0c
!	Mem[0000000010001428] = ea835772, %l3 = 00000000d359bf0c
	ldswa	[%i0+0x028]%asi,%l3	! %l3 = ffffffffea835772
!	Mem[0000000010081400] = ff8ed1fa, %l0 = 00000000df4e814b
	lduwa	[%i2+%g0]0x80,%l0	! %l0 = 00000000ff8ed1fa
!	Mem[00000000300c1408] = 0dbe0895 6b7398c2, %l6 = 7c0c0760, %l7 = df4e8ae5
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 000000006b7398c2 000000000dbe0895
!	Mem[0000000030081408] = 6b15eca1, %f19 = 075ad7d2
	lda	[%i2+%o4]0x89,%f19	! %f19 = 6b15eca1
!	Mem[0000000010081410] = df4e814b8acdca4e, %f18 = c483231e 6b15eca1
	ldda	[%i2+%o5]0x80,%f18	! %f18 = df4e814b 8acdca4e
!	Mem[0000000030141400] = ffffffff81154b27, %l3 = ffffffffea835772
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = ffffffff81154b27
!	Mem[0000000030101408] = 7c0c0760, %l0 = 00000000ff8ed1fa
	swapa	[%i4+%o4]0x81,%l0	! %l0 = 000000007c0c0760
!	Starting 10 instruction Store Burst
!	%f28 = 0dbe0895 5a024868, Mem[0000000030141400] = ffffffff 81154b27
	stda	%f28,[%i5+%g0]0x81	! Mem[0000000030141400] = 0dbe0895 5a024868

p0_label_20:
!	Mem[0000000030181410] = 000111b0, %l5 = 0000000020000000
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 00000000000111b0
!	%l4 = 00000000b446531f, Mem[0000000030001400] = b12a0000
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = b446531f
!	%l3 = ffffffff81154b27, Mem[000000001010142d] = ec4806e0, %asi = 80
	stba	%l3,[%i4+0x02d]%asi	! Mem[000000001010142c] = ec2706e0
!	Mem[0000000030081410] = fcd71120, %l0 = 000000007c0c0760
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 00000000fcd71120
!	%f6  = a0ff1f5f, %f9  = 5b516947, %f0  = c410d29b
	fadds	%f6 ,%f9 ,%f0 		! %f0  = 5b516947
!	%l5 = 00000000000111b0, Mem[0000000010181410] = ed093e00
	stba	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = b0093e00
!	Mem[0000000030181408] = 27f500e7, %l3 = ffffffff81154b27
	ldsba	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffffffe7
!	Mem[00000000100c1408] = ffb20760, %l5 = 00000000000111b0
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030101410] = 7c0c0760, %l6 = 000000006b7398c2
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 000000007c0c0760
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff20a977, %l2 = 0000000047166bff
	ldsb	[%o0+%g0],%l2		! %l2 = ffffffffffffffff

p0_label_21:
!	Mem[00000000300c1410] = 5cf99de5c298736b, %f28 = 0dbe0895 5a024868
	ldda	[%i3+%o5]0x89,%f28	! %f28 = 5cf99de5 c298736b
!	%l6 = 000000007c0c0760, %l4 = 00000000b446531f, %l6 = 000000007c0c0760
	xor	%l6,%l4,%l6		! %l6 = 00000000c84a547f
!	Mem[0000000010141410] = 20000000, %l4 = 00000000b446531f
	lduba	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000020
!	Mem[000000001000140c] = 938c6625, %l6 = 00000000c84a547f
	ldswa	[%i0+0x00c]%asi,%l6	! %l6 = ffffffff938c6625
!	Mem[0000000021800140] = d19e6a3a, %l1 = ffffffffffffffb2
	ldsba	[%o3+0x141]%asi,%l1	! %l1 = ffffffffffffff9e
!	Mem[0000000010001408] = 28a30e74, %l4 = 0000000000000020
	lduha	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000e74
!	Mem[0000000020800040] = 81ff33c3, %l2 = ffffffffffffffff
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffff81ff
!	Mem[0000000010141410] = 00000020, %f1  = fcd77597
	lda	[%i5+%o5]0x88,%f1 	! %f1 = 00000020
!	Mem[0000000030181408] = 27f500e7, %l3 = ffffffffffffffe7
	lduha	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000e7
!	Starting 10 instruction Store Burst
!	%f12 = 7476011c 9f3b5d29, %l3 = 00000000000000e7
!	Mem[0000000030101430] = 036ec2adfecd2424
	add	%i4,0x030,%g1
	stda	%f12,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030101430] = 295d3badfe017674

p0_label_22:
!	Mem[00000000201c0000] = ff20a977, %l2 = ffffffffffff81ff
	ldstub	[%o0+%g0],%l2		! %l2 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010041408] = ff4a35b3
	stwa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	Mem[0000000030041400] = 0000ffab, %l4 = 0000000000000e74
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 000000000000ffab
!	%l5 = 00000000000000ff, Mem[0000000010041438] = 4d41dc2edfa1ed8a
	stx	%l5,[%i1+0x038]		! Mem[0000000010041438] = 00000000000000ff
!	Mem[0000000020800000] = 28a38205, %l7 = 000000000dbe0895
	ldstub	[%o1+%g0],%l7		! %l7 = 00000028000000ff
!	%l4 = 000000000000ffab, Mem[0000000010081416] = 8acdca4e, %asi = 80
	stha	%l4,[%i2+0x016]%asi	! Mem[0000000010081414] = 8acdffab
!	Mem[00000000100c1410] = a99cffff, %l5 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 00000000a99cffff
!	%l4 = 000000000000ffab, Mem[0000000010081400] = ff8ed1fa
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000ffab
!	%l0 = fcd71120, %l1 = ffffff9e, Mem[0000000030141400] = 0dbe0895 5a024868
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = fcd71120 ffffff9e
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = c298736b, %l0 = 00000000fcd71120
	lduwa	[%i3+%o5]0x89,%l0	! %l0 = 00000000c298736b

p0_label_23:
!	Mem[0000000030081400] = 00faf23e, %f7  = 14d769e4
	lda	[%i2+%g0]0x81,%f7 	! %f7 = 00faf23e
!	Mem[0000000010101410] = 4ecacd8a60070c7c, %l0 = 00000000c298736b
	ldxa	[%i4+0x010]%asi,%l0	! %l0 = 4ecacd8a60070c7c
!	Mem[0000000010181410] = 003e09b0, %f22 = 871cd51a
	lda	[%i6+%o5]0x88,%f22	! %f22 = 003e09b0
!	Mem[0000000010001400] = 00000000, %f20 = 7c0c0760
	lda	[%i0+%g0]0x88,%f20	! %f20 = 00000000
!	Mem[0000000010001408] = 740ea328, %f14 = 7c0c0760
	lda	[%i0+%o4]0x80,%f14	! %f14 = 740ea328
!	Mem[00000000211c0000] = 00007fdc, %l3 = 00000000000000e7
	lduba	[%o2+0x001]%asi,%l3	! %l3 = 0000000000000000
!	%l5 = 00000000a99cffff, %l7 = 0000000000000028, %y  = 000000e7
	sdiv	%l5,%l7,%l1		! %l1 = 000000007fffffff
	mov	%l0,%y			! %y = 60070c7c
!	Mem[0000000030181410] = 200000001aee5d55, %l0 = 4ecacd8a60070c7c
	ldxa	[%i6+%o5]0x81,%l0	! %l0 = 200000001aee5d55
!	Mem[0000000030001400] = 1f5346b4, %l4 = 000000000000ffab
	ldsba	[%i0+%g0]0x89,%l4	! %l4 = ffffffffffffffb4
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010141408] = cab88a24 34b1113e
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff 00000000

p0_label_24:
!	%l6 = ffffffff938c6625, Mem[0000000010141404] = 3a370e78
	stb	%l6,[%i5+0x004]		! Mem[0000000010141404] = 25370e78
!	Mem[0000000010001410] = 0951d5c2, %l0 = 200000001aee5d55
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 000000000951d5c2
!	%l7 = 0000000000000028, Mem[0000000030101408] = fad18eff
	stba	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = fad18e28
!	Mem[00000000300c1410] = 6b7398c2, %l2 = 00000000000000ff
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 0000006b000000ff
!	Mem[0000000030081410] = 60070c7c, %l4 = ffffffffffffffb4
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 0000007c000000ff
!	%l4 = 000000000000007c, Mem[0000000010001400] = 00000000000099c2
	stxa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000000000007c
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 000000000951d5c2
	setx	0xdd632310232f44d6,%g7,%l0 ! %l0 = dd632310232f44d6
!	%l1 = 000000007fffffff
	setx	0x973db2c79f07d8e2,%g7,%l1 ! %l1 = 973db2c79f07d8e2
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dd632310232f44d6
	setx	0x5e727d10384c4fed,%g7,%l0 ! %l0 = 5e727d10384c4fed
!	%l1 = 973db2c79f07d8e2
	setx	0xbd6ab4df85487398,%g7,%l1 ! %l1 = bd6ab4df85487398
!	%l2 = 0000006b, %l3 = 00000000, Mem[0000000030001408] = 4b814edf 00000000
	stda	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000006b 00000000
!	Mem[0000000010081430] = cd88ffec, %l4 = 000000000000007c
	swap	[%i2+0x030],%l4		! %l4 = 00000000cd88ffec
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 81ff33c3, %l4 = 00000000cd88ffec
	lduh	[%o1+0x040],%l4		! %l4 = 00000000000081ff

p0_label_25:
!	Mem[0000000010181408] = b8b92eff, %l5 = 00000000a99cffff
	lduwa	[%i6+%o4]0x88,%l5	! %l5 = 00000000b8b92eff
!	Mem[0000000030141400] = 2011d7fc, %l1 = bd6ab4df85487398
	lduba	[%i5+%g0]0x89,%l1	! %l1 = 00000000000000fc
!	%l3 = 0000000000000000, %l3 = 0000000000000000, %l6 = ffffffff938c6625
	sub	%l3,%l3,%l6		! %l6 = 0000000000000000
!	Mem[0000000010141408] = 000000ff, %l7 = 0000000000000028
	ldsba	[%i5+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001408] = 0000006b, %l5 = 00000000b8b92eff
	ldswa	[%i0+%o4]0x81,%l5	! %l5 = 000000000000006b
!	%f31 = 0b066455, %f27 = 9bd23bb2, %f23 = 503c56a4
	fadds	%f31,%f27,%f23		! %f23 = 9bd23bb2
!	Mem[00000000300c1400] = 23e5b69b, %l2 = 000000000000006b
	lduwa	[%i3+%g0]0x89,%l2	! %l2 = 0000000023e5b69b
!	Mem[0000000010081410] = df4e814b, %l5 = 000000000000006b
	ldswa	[%i2+%o5]0x80,%l5	! %l5 = ffffffffdf4e814b
!	Mem[0000000030041400] = 740e0000fcd71120, %l5 = ffffffffdf4e814b
	ldxa	[%i1+%g0]0x81,%l5	! %l5 = 740e0000fcd71120
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030001410] = d2d75a071d8af143
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000

p0_label_26:
!	%l0 = 5e727d10384c4fed, Mem[0000000010101410] = 4ecacd8a
	stba	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = edcacd8a
!	Mem[0000000030041408] = 003e09ed, %l5 = 740e0000fcd71120
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001434] = ff4271ca, %l6 = 0000000000000000
	ldstub	[%i0+0x034],%l6		! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[0000000010141400] = 780e3725df96719f
	stxa	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000000000ff
!	Mem[0000000010041408] = 000000ff, %l2 = 0000000023e5b69b
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[00000000100c1410] = 000000ff
	stba	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	%l3 = 0000000000000000, imm = 0000000000000a0f, %l7 = ffffffffffffffff
	or	%l3,0xa0f,%l7		! %l7 = 0000000000000a0f
!	%f30 = 690f51be 0b066455, Mem[0000000010181410] = b0093e00 9f7196df
	stda	%f30,[%i6+%o5]0x80	! Mem[0000000010181410] = 690f51be 0b066455
!	Mem[0000000020800001] = ffa38205, %l3 = 0000000000000000
	ldstub	[%o1+0x001],%l3		! %l3 = 000000a3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 740ea328938c6625, %f30 = 690f51be 0b066455
	ldda	[%i0+%o4]0x80,%f30	! %f30 = 740ea328 938c6625

p0_label_27:
!	Mem[0000000030181400] = 9f7196df1cecadff, %l0 = 5e727d10384c4fed
	ldxa	[%i6+%g0]0x89,%l0	! %l0 = 9f7196df1cecadff
!	Mem[0000000030181400] = 1cecadff, %l1 = 00000000000000fc
	lduwa	[%i6+%g0]0x89,%l1	! %l1 = 000000001cecadff
!	%l5 = 0000000000000000, %l2 = 00000000000000ff, %y  = 60070c7c
	umul	%l5,%l2,%l3		! %l3 = 0000000000000000, %y = 00000000
!	%l7 = 0000000000000a0f, imm = 0000000000000e9a, %l5 = 0000000000000000
	sub	%l7,0xe9a,%l5		! %l5 = fffffffffffffb75
!	Mem[0000000010101408] = 075a0061, %l7 = 0000000000000a0f
	ldsba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000061
!	Mem[0000000010041408] = 000000ff, %l4 = 00000000000081ff
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = 3ef2fa00, %l0 = 9f7196df1cecadff
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = fffffffffffffa00
!	Code Fragment 3
p0_fragment_4:
!	%l0 = fffffffffffffa00
	setx	0x76c2e7906f4fa301,%g7,%l0 ! %l0 = 76c2e7906f4fa301
!	%l1 = 000000001cecadff
	setx	0xceb31df7e1b92b57,%g7,%l1 ! %l1 = ceb31df7e1b92b57
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 76c2e7906f4fa301
	setx	0x3bf394606b28a3f5,%g7,%l0 ! %l0 = 3bf394606b28a3f5
!	%l1 = ceb31df7e1b92b57
	setx	0x73782b603fea6b22,%g7,%l1 ! %l1 = 73782b603fea6b22
!	Mem[0000000010101404] = 9bd23bb2, %l0 = 3bf394606b28a3f5
	ldswa	[%i4+0x004]%asi,%l0	! %l0 = ffffffff9bd23bb2
!	Starting 10 instruction Store Burst
!	%l5 = fffffffffffffb75, Mem[00000000100c1408] = ffb20760
	stha	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = fb750760

p0_label_28:
!	Mem[000000001000140b] = 740ea328, %l2 = 00000000000000ff
	ldstuba	[%i0+0x00b]%asi,%l2	! %l2 = 00000028000000ff
!	Mem[0000000010101400] = fcd71120, %l1 = 73782b603fea6b22
	ldstuba	[%i4+%g0]0x88,%l1	! %l1 = 00000020000000ff
!	%l5 = fffffffffffffb75, Mem[0000000030081410] = ff0c0760
	stwa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = fffffb75
!	%l7 = 0000000000000061, Mem[0000000030081410] = fffffb7534aaaa81
	stxa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000061
!	%l4 = 000000ff, %l5 = fffffb75, Mem[0000000010041410] = b8b92e18 00000020
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff fffffb75
!	%f16 = b23bd29b fcd71120, %l0 = ffffffff9bd23bb2
!	Mem[0000000030141408] = 0b29907e4378d57c
	add	%i5,0x008,%g1
	stda	%f16,[%g1+%l0]ASI_PST8_S ! Mem[0000000030141408] = b229d29b4378117c
!	Mem[0000000010181400] = 9775d7fc, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 000000009775d7fc
!	Mem[0000000010081408] = 5b000000, %l6 = 000000009775d7fc
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081400] = 0000ffab, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 000000000000ffab
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000, %l3 = 000000000000ffab
	ldsha	[%i5+%o4]0x80,%l3	! %l3 = ffffffffffffff00

p0_label_29:
!	Mem[0000000030181400] = 1cecadff, %l3 = ffffffffffffff00
	lduba	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = e700f52764c93059, %f24 = 20000000 00000000
	ldda	[%i6+%o4]0x81,%f24	! %f24 = e700f527 64c93059
!	Mem[0000000010041400] = b23bd29b, %l4 = 00000000000000ff
	ldswa	[%i1+%g0]0x80,%l4	! %l4 = ffffffffb23bd29b
!	Mem[0000000010181408] = ff2eb9b837faf5bc, %f28 = 5cf99de5 c298736b
	ldda	[%i6+%o4]0x80,%f28	! %f28 = ff2eb9b8 37faf5bc
!	Mem[0000000010041400] = b23bd29b, %l0 = ffffffff9bd23bb2
	lduba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000b2
!	Mem[0000000010081408] = 5b0000ff, %l3 = 00000000000000ff
	ldsba	[%i2+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 00000000000000b2
	setx	0x8ae1a8d04cf65eae,%g7,%l0 ! %l0 = 8ae1a8d04cf65eae
!	%l1 = 0000000000000020
	setx	0x98b17d9850aa320a,%g7,%l1 ! %l1 = 98b17d9850aa320a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8ae1a8d04cf65eae
	setx	0x75200c08241863d2,%g7,%l0 ! %l0 = 75200c08241863d2
!	%l1 = 98b17d9850aa320a
	setx	0xb0608107894ec78a,%g7,%l1 ! %l1 = b0608107894ec78a
!	Mem[0000000010081408] = ff00005b, %l6 = 0000000000000000
	lduha	[%i2+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010141410] = 20000000, %l5 = fffffffffffffb75
	ldswa	[%i5+%o5]0x80,%l5	! %l5 = 0000000020000000
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000ff00, Mem[0000000010141408] = 000000ff
	stwa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000ff00

p0_label_30:
!	Mem[0000000010181400] = 000000ff, %l7 = 0000000000000061
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[0000000010041410] = ff000000
	stba	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = ff0000ff
!	%f28 = ff2eb9b8 37faf5bc, Mem[0000000030181400] = ffadec1c df96719f
	stda	%f28,[%i6+%g0]0x81	! Mem[0000000030181400] = ff2eb9b8 37faf5bc
!	Mem[000000001000142e] = 19e9ea3f, %l6 = 000000000000ff00
	ldstub	[%i0+0x02e],%l6		! %l6 = 000000ea000000ff
!	%f0  = 5b516947 00000020 774e2963 34c7c913
!	%f4  = 0a000000 00000000 a0ff1f5f 00faf23e
!	%f8  = 1a208909 5b516947 fe9205d1 f4cf8619
!	%f12 = 7476011c 9f3b5d29 740ea328 8acdca4e
	stda	%f0,[%i6]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	%f18 = df4e814b, %f16 = b23bd29b
	fcmpes	%fcc2,%f18,%f16		! %fcc2 = 1
!	%l4 = b23bd29b, %l5 = 20000000, Mem[0000000030141408] = 9bd229b2 7c117843
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = b23bd29b 20000000
!	Mem[0000000030001408] = 0000006b, %l6 = 00000000000000ea
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 000000000000006b
!	%l6 = 0000006b, %l7 = 00000000, Mem[0000000030081408] = 6b15eca1 3efb1992
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000006b 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l4 = ffffffffb23bd29b
	lduha	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000

p0_label_31:
!	%l6 = 000000000000006b, %l3 = ffffffffffffffff, %l2 = 0000000000000028
	subc	%l6,%l3,%l2		! %l2 = 000000000000006c
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030181408] = 774e2963, %l5 = 0000000020000000
	ldsba	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000077
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 75200c08241863d2
	setx	0x45ae24982051a2a6,%g7,%l0 ! %l0 = 45ae24982051a2a6
!	%l1 = b0608107894ec78a
	setx	0x36b04eb78c58cc63,%g7,%l1 ! %l1 = 36b04eb78c58cc63
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 45ae24982051a2a6
	setx	0x5a90383782b3fd7c,%g7,%l0 ! %l0 = 5a90383782b3fd7c
!	%l1 = 36b04eb78c58cc63
	setx	0x36c25967f405c843,%g7,%l1 ! %l1 = 36c25967f405c843
!	Mem[000000001010141c] = 1ad51c87, %l7 = 0000000000000000
	ldswa	[%i4+0x01c]%asi,%l7	! %l7 = 000000001ad51c87
!	Mem[0000000010141408] = 00ff0000, %l0 = 5a90383782b3fd7c
	lduba	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 740e0000fcd71120, %l5 = 0000000000000077
	ldxa	[%i1+%g0]0x81,%l5	! %l5 = 740e0000fcd71120
!	Mem[00000000201c0000] = ff20a977, %l6 = 000000000000006b
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000ff20
!	Mem[0000000030041400] = 00000e74, %l6 = 000000000000ff20
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000e74
!	Mem[0000000030141408] = 9bd23bb2, %l5 = 740e0000fcd71120
	lduha	[%i5+%o4]0x81,%l5	! %l5 = 0000000000009bd2
!	Starting 10 instruction Store Burst
!	%l2 = 0000006c, %l3 = ffffffff, Mem[0000000010181420] = 4769515b 0989201a
	std	%l2,[%i6+0x020]		! Mem[0000000010181420] = 0000006c ffffffff

p0_label_32:
!	%f26 = 2011d7fc 9bd23bb2, Mem[0000000030141408] = b23bd29b 20000000
	stda	%f26,[%i5+%o4]0x89	! Mem[0000000030141408] = 2011d7fc 9bd23bb2
!	%l6 = 0000000000000e74, Mem[0000000010181408] = b8b92eff
	stwa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000e74
!	Mem[000000001000142c] = 19e9ff3f, %l6 = 0000000000000e74
	swap	[%i0+0x02c],%l6		! %l6 = 0000000019e9ff3f
!	Mem[00000000100c1410] = 000000ff, %l2 = 000000000000006c
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1410] = c29873ff, %l3 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, immed = 00000988, %y  = 00000000
	udiv	%l3,0x988,%l2		! %l2 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	%f26 = 2011d7fc 9bd23bb2, %l4 = 0000000000000000
!	Mem[0000000030041410] = 7c0c07608acdca4e
	add	%i1,0x010,%g1
	stda	%f26,[%g1+%l4]ASI_PST32_S ! Mem[0000000030041410] = 7c0c07608acdca4e
!	Mem[0000000010001410] = 1aee5d55, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 0000001a000000ff
!	%l6 = 19e9ff3f, %l7 = 1ad51c87, Mem[0000000010001400] = 00000000 7c000000
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 19e9ff3f 1ad51c87
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 0000000000000000
	setx	0x7cfb5d4845ab2f0b,%g7,%l0 ! %l0 = 7cfb5d4845ab2f0b
!	%l1 = 36c25967f405c843
	setx	0x93baa04844b7104d,%g7,%l1 ! %l1 = 93baa04844b7104d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7cfb5d4845ab2f0b
	setx	0x85482f6fab170b16,%g7,%l0 ! %l0 = 85482f6fab170b16
!	%l1 = 93baa04844b7104d
	setx	0x8e284df81048084b,%g7,%l1 ! %l1 = 8e284df81048084b

p0_label_33:
!	Mem[0000000010181408] = 740e0000, %l3 = 00000000000000ff
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 00000000740e0000
!	Mem[0000000020800040] = 81ff33c3, %l6 = 0000000019e9ff3f
	ldsba	[%o1+0x041]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141404] = 00000000, %l7 = 000000001ad51c87
	lduwa	[%i5+0x004]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = 369dd2d4, %l3 = 00000000740e0000
	ldsha	[%i5+%o5]0x89,%l3	! %l3 = ffffffffffffd2d4
!	Mem[0000000030101400] = 47166bff, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = 0000000047166bff
!	Mem[00000000211c0000] = 00007fdc, %l7 = 0000000047166bff
	ldsh	[%o2+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010001408] = 740ea3ff 938c6625, %l4 = 00000000, %l5 = 00009bd2
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 00000000740ea3ff 00000000938c6625
!	Mem[0000000010141408] = 00ff0000, %l0 = 85482f6fab170b16
	ldsba	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = 4ecacd8a60070c7c, %f8  = 1a208909 5b516947
	ldda	[%i1+%o5]0x89,%f8 	! %f8  = 4ecacd8a 60070c7c
!	Starting 10 instruction Store Burst
!	%f8  = 4ecacd8a 60070c7c, Mem[0000000010041408] = 000000ff 2e000000
	stda	%f8 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 4ecacd8a 60070c7c

p0_label_34:
!	%f19 = 8acdca4e, Mem[0000000030001410] = 00000000
	sta	%f19,[%i0+%o5]0x89	! Mem[0000000030001410] = 8acdca4e
!	%f4  = 0a000000 00000000, Mem[0000000010041430] = 659692dd d256d61b
	std	%f4 ,[%i1+0x030]	! Mem[0000000010041430] = 0a000000 00000000
!	Mem[000000001018143c] = cee2dc88, %l6 = ffffffffffffffff
	ldstuba	[%i6+0x03c]%asi,%l6	! %l6 = 000000ce000000ff
!	%l5 = 00000000938c6625, Mem[0000000010041418] = 5166209f
	stw	%l5,[%i1+0x018]		! Mem[0000000010041418] = 938c6625
!	%l2 = 000000000000001a, Mem[0000000030001400] = a4c5720a1f5346b4
	stxa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000000000001a
!	%f2  = 774e2963 34c7c913, Mem[0000000010181410] = 690f51be 0b066455
	stda	%f2 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 774e2963 34c7c913
!	Mem[0000000030141400] = 2011d7fc, %l3 = ffffffffffffd2d4
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 000000002011d7fc
!	%f24 = e700f527 64c93059, Mem[0000000010101410] = edcacd8a 60070c7c
	stda	%f24,[%i4+%o5]0x80	! Mem[0000000010101410] = e700f527 64c93059
!	%l6 = 00000000000000ce, Mem[0000000010181428] = 1986cff4, %asi = 80
	stwa	%l6,[%i6+0x028]%asi	! Mem[0000000010181428] = 000000ce
!	Starting 10 instruction Load Burst
!	Mem[0000000010081428] = b207bcd5, %l1 = 8e284df81048084b
	lduha	[%i2+0x02a]%asi,%l1	! %l1 = 000000000000bcd5

p0_label_35:
!	Mem[0000000010101408] = 075a0061, %l3 = 000000002011d7fc
	ldswa	[%i4+%o4]0x88,%l3	! %l3 = 00000000075a0061
!	%l5 = 00000000938c6625, %l4 = 00000000740ea3ff, %y  = 00000000
	sdiv	%l5,%l4,%l2		! %l2 = 0000000000000001
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010081400] = 00000000 808695a1, %l4 = 740ea3ff, %l5 = 938c6625
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000 00000000808695a1
!	Mem[0000000030081408] = 6b000000, %f23 = 9bd23bb2
	lda	[%i2+%o4]0x81,%f23	! %f23 = 6b000000
!	Mem[0000000030001410] = 4ecacd8a, %f19 = 8acdca4e
	lda	[%i0+%o5]0x81,%f19	! %f19 = 4ecacd8a
!	Mem[0000000010141408] = 00ff0000, %l4 = 0000000000000000
	ldsh	[%i5+%o4],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030141410] = d4d29d36 819fd230, %l6 = 000000ce, %l7 = 00000000
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 00000000d4d29d36 00000000819fd230
!	%f11 = f4cf8619, %f25 = 64c93059
	fsqrts	%f11,%f25		! %f25 = 7fffffff
!	Mem[0000000030081400] = 00faf23e 569de4ea 6b000000 00000000
!	Mem[0000000030081410] = 00000000 00000061 1475009c 95e8a059
!	Mem[0000000030081420] = 69611ef1 1724420a d20663ab 2753da1f
!	Mem[0000000030081430] = 2e791a89 742b1530 df4ff009 9f4c1a7a
	ldda	[%i2]ASI_BLK_S,%f0	! Block Load from 0000000030081400
!	Starting 10 instruction Store Burst
!	%l5 = 00000000808695a1, Mem[0000000010181408] = 00000e74
	stba	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000ea1

p0_label_36:
!	%f24 = e700f527 7fffffff, Mem[0000000030001408] = ea000000 00000000
	stda	%f24,[%i0+%o4]0x89	! Mem[0000000030001408] = e700f527 7fffffff
!	%l2 = 0000000000000001, Mem[0000000030141400] = d4d2ffffffffff9e
	stxa	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000001
!	%l0 = 0000000000000000, Mem[00000000218001c0] = 11ff79c5, %asi = 80
	stba	%l0,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 00ff79c5
!	%l0 = 0000000000000000, Mem[000000001000142f] = 00000e74
	stb	%l0,[%i0+0x02f]		! Mem[000000001000142c] = 00000e00
!	Mem[0000000030041400] = 740e0000, %l7 = 00000000819fd230
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 00000000740e0000
	membar	#Sync			! Added by membar checker (9)
!	%f30 = 740ea328, Mem[0000000030081408] = 0000006b
	sta	%f30,[%i2+%o4]0x89	! Mem[0000000030081408] = 740ea328
!	%l5 = 00000000808695a1, Mem[0000000030081400] = 00faf23e
	stwa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 808695a1
!	%l7 = 00000000740e0000, %l4 = 00000000000000ff, %l3 = 00000000075a0061
	or	%l7,%l4,%l3		! %l3 = 00000000740e00ff
!	Mem[0000000010001408] = ffa30e74, %l4 = 00000000000000ff
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 00000074000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 6b7398c2, %l3 = 00000000740e00ff
	lduba	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000c2

p0_label_37:
!	Mem[0000000030041400] = 819fd230, %l6 = 00000000d4d29d36
	ldsha	[%i1+%g0]0x81,%l6	! %l6 = ffffffffffff819f
!	Mem[0000000030141400] = 0100000000000000, %f12 = 2e791a89 742b1530
	ldda	[%i5+%g0]0x89,%f12	! %f12 = 01000000 00000000
!	Mem[000000001000142c] = 00000e00, %l5 = 00000000808695a1
	ldsba	[%i0+0x02e]%asi,%l5	! %l5 = 000000000000000e
!	Mem[0000000030001400] = 1a000000, %l7 = 00000000740e0000
	lduba	[%i0+%g0]0x81,%l7	! %l7 = 000000000000001a
!	Mem[0000000030141408] = b23bd29b, %l0 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffffb2
!	Mem[0000000030181400] = 200000004769515b, %l4 = 0000000000000074
	ldxa	[%i6+%g0]0x89,%l4	! %l4 = 200000004769515b
!	Mem[0000000010041418] = 938c6625, %l0 = ffffffffffffffb2
	ldsw	[%i1+0x018],%l0		! %l0 = ffffffff938c6625
!	Mem[0000000030101410] = 6b7398c2, %l5 = 000000000000000e
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = ffffffffffff98c2
!	Mem[0000000010041410] = ff0000ff, %l0 = ffffffff938c6625
	ldsba	[%i1+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f18 = df4e814b 4ecacd8a, Mem[0000000030101400] = 47166bff d359bf0c
	stda	%f18,[%i4+%g0]0x89	! Mem[0000000030101400] = df4e814b 4ecacd8a

p0_label_38:
!	Mem[00000000211c0001] = 00007fdc, %l6 = ffffffffffff819f
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	%f8  = 69611ef1 1724420a, %l3 = 00000000000000c2
!	Mem[0000000010041410] = ff0000fffffffb75
	add	%i1,0x010,%g1
	stda	%f8,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010041410] = ff0000fff11e6169
!	Mem[00000000100c1400] = 889eabff, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	%f13 = 00000000, Mem[0000000030141410] = d4d29d36
	sta	%f13,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Mem[0000000010141408] = 0000ff00, %l1 = 000000000000bcd5
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101410] = 27f500e7, %l6 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l6	! %l6 = 0000000027f500e7
!	%l2 = 00000001, %l3 = 000000c2, Mem[0000000030181400] = 4769515b 20000000
	stda	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000001 000000c2
!	%l7 = 000000000000001a, Mem[0000000010081410] = 4b814edf
	stha	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 4b81001a
!	%l1 = 0000000000000000, Mem[0000000010081408] = ff00005b2e557796
	stxa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 774e2963, %l3 = 00000000000000c2
	ldsh	[%i6+%o5],%l3		! %l3 = 000000000000774e

p0_label_39:
!	Mem[0000000030041400] = 819fd230, %l1 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l1	! %l1 = 000000000000819f
!	Mem[0000000030081410] = 00000000, %l1 = 000000000000819f
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 555deeff, %l3 = 000000000000774e
	lduwa	[%i0+%o5]0x88,%l3	! %l3 = 00000000555deeff
!	Mem[0000000010041408] = 7c0c0760, %l7 = 000000000000001a
	lduwa	[%i1+%o4]0x80,%l7	! %l7 = 000000007c0c0760
!	Mem[0000000010101408] = 61005a07, %l2 = 0000000000000001
	lduha	[%i4+%o4]0x80,%l2	! %l2 = 0000000000006100
!	%l0 = ffffffffffffffff, %l3 = 00000000555deeff, %l2 = 0000000000006100
	sdivx	%l0,%l3,%l2		! %l2 = 0000000000000000
!	Mem[0000000030081408] = 740ea328, %l2 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000028
!	Mem[0000000030141408] = 9bd23bb2, %l5 = ffffffffffff98c2
	lduha	[%i5+%o4]0x89,%l5	! %l5 = 0000000000003bb2
!	Mem[0000000010001438] = a46ad298, %l1 = 0000000000000000
	ldsba	[%i0+0x03a]%asi,%l1	! %l1 = ffffffffffffffd2
!	Starting 10 instruction Store Burst
!	%l4 = 200000004769515b, Mem[0000000010081418] = e22473a4
	stb	%l4,[%i2+0x018]		! Mem[0000000010081418] = 5b2473a4

p0_label_40:
!	Mem[0000000030041400] = 819fd230, %l7 = 000000007c0c0760
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 00000000819fd230
!	%l1 = ffffffffffffffd2, Mem[00000000300c1400] = 9bb6e523
	stwa	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffd2
!	Mem[0000000010181408] = a10e0000, %l2 = 0000000000000028
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000a10e0000
!	%f16 = b23bd29b fcd71120, Mem[0000000030001400] = 0000001a 00000000
	stda	%f16,[%i0+%g0]0x89	! Mem[0000000030001400] = b23bd29b fcd71120
!	%l6 = 0000000027f500e7, Mem[0000000010101400] = ff11d7fc9bd23bb2
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000027f500e7
!	%l2 = a10e0000, %l3 = 555deeff, Mem[0000000030001410] = 4ecacd8a 00000000
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = a10e0000 555deeff
!	%l4 = 200000004769515b, Mem[0000000020800001] = ffff8205
	stb	%l4,[%o1+0x001]		! Mem[0000000020800000] = ff5b8205
!	%l4 = 200000004769515b, Mem[0000000030181410] = 000000000000000a
	stxa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 200000004769515b
!	%l2 = a10e0000, %l3 = 555deeff, Mem[0000000010141410] = 00000020 00000000
	stda	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = a10e0000 555deeff
!	Starting 10 instruction Load Burst
!	%l1 = ffffffffffffffd2, %l4 = 200000004769515b, %y  = 00000000
	sdiv	%l1,%l4,%l6		! %l6 = 0000000000000003
	mov	%l0,%y			! %y = ffffffff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	ldxa	[%i2+0x010]%asi,%l6
	nop
	udivx	%l4,0x433,%l4
	nop
	fsqrts	%f8,%f12
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be ffffffffffffffd2
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000a10e0000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000555deeff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 200000004769515b
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000003bb2
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000003
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000819fd230
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
	cmp	%l0,%l1			! %f0  should be 00faf23e 569de4ea
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 6b000000 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 00000061
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 1475009c 95e8a059
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 69611ef1 1724420a
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be d20663ab 2753da1f
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 01000000 00000000
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be df4ff009 9f4c1a7a
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be b23bd29b fcd71120
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be df4e814b 4ecacd8a
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 8acdca4e
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 003e09b0 6b000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be e700f527 7fffffff
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 2011d7fc 9bd23bb2
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ff2eb9b8 37faf5bc
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 740ea328 938c6625
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
	fcmps	%fcc1,%f6 ,%f7 
	fcmps	%fcc3,%f3 ,%f7 
	xnor	%l2,0xd61,%l4
	done

p0_trap1o:
	fcmps	%fcc1,%f6 ,%f7 
	fcmps	%fcc3,%f3 ,%f7 
	xnor	%l2,0xd61,%l4
	done


p0_trap2e:
	nop
	done

p0_trap2o:
	nop
	done


p0_trap3e:
	addc	%l7,-0x945,%l2
	xor	%l1,-0xe68,%l4
	done

p0_trap3o:
	addc	%l7,-0x945,%l2
	xor	%l1,-0xe68,%l4
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
	ldx	[%g1+0x000],%l0		! %l0 = 5c1ddcb203bac9ef
	ldx	[%g1+0x008],%l1		! %l1 = f5f7578c42919d25
	ldx	[%g1+0x010],%l2		! %l2 = 5979c59ba55ee6a3
	ldx	[%g1+0x018],%l3		! %l3 = a6757cc427f500e7
	ldx	[%g1+0x020],%l4		! %l4 = 1a321a2a98290373
	ldx	[%g1+0x028],%l5		! %l5 = 08c34e6e42942d06
	ldx	[%g1+0x030],%l6		! %l6 = f7de1af8726bdb14
	ldx	[%g1+0x038],%l7		! %l7 = a97cdac1a8607ae4

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
	fcmps	%fcc1,%f6 ,%f7 
	jmpl	%o7,%g0
	sdivx	%l7,0xd7c,%l6
p0_near_0_he:
	smul	%l2,0xba7,%l4
	smul	%l7,%l3,%l6
	jmpl	%o7,%g0
	xnor	%l5,0x13e,%l0
near0_b2b_h:
	fmuls	%f24,%f16,%f30
	fsqrts	%f23,%f25
	or	%l1,-0xadd,%l7
	andn	%l3,-0xe3b,%l7
	umul	%l5,0x353,%l6
	jmpl	%o7,%g0
	xnor	%l7,-0x6d0,%l6
near0_b2b_l:
	addc	%l7,-0x945,%l2
	orn	%l0,-0x773,%l7
	addc	%l5,%l5,%l4
	xor	%l2,-0xad7,%l3
	mulx	%l4,-0x1af,%l2
	jmpl	%o7,%g0
	orn	%l4,-0x98b,%l6
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	add	%l3,%l2,%l0
	jmpl	%o7,%g0
	orn	%l4,%l6,%l2
p0_near_1_he:
	jmpl	%o7,%g0
	andn	%l7,0x30f,%l4
	jmpl	%o7,%g0
	nop
near1_b2b_h:
	smul	%l7,-0xa73,%l0
	smul	%l0,%l3,%l0
	xor	%l3,-0x7d0,%l2
	umul	%l0,0xf43,%l7
	jmpl	%o7,%g0
	orn	%l4,-0xc46,%l1
near1_b2b_l:
	subc	%l0,%l2,%l2
	addc	%l1,%l3,%l2
	fdivs	%f12,%f5 ,%f0 
	sdivx	%l4,%l5,%l2
	jmpl	%o7,%g0
	xor	%l4,%l6,%l3
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	subc	%l0,%l2,%l6
	jmpl	%o7,%g0
	fdivs	%f1 ,%f9 ,%f2 
p0_near_2_he:
	mulx	%l6,%l1,%l5
	jmpl	%o7,%g0
	addc	%l6,%l0,%l2
near2_b2b_h:
	sub	%l2,%l3,%l4
	andn	%l6,0x23f,%l1
	fdivs	%f17,%f27,%f31
	fdtoi	%f20,%f25
	jmpl	%o7,%g0
	fsubs	%f24,%f19,%f19
near2_b2b_l:
	umul	%l3,0x7c3,%l5
	udivx	%l3,%l4,%l7
	and	%l0,%l1,%l5
	fcmps	%fcc2,%f9 ,%f4 
	jmpl	%o7,%g0
	fsubs	%f13,%f5 ,%f6 
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	jmpl	%o7,%g0
	addc	%l1,0x1bc,%l0
	jmpl	%o7,%g0
	nop
p0_near_3_he:
	smul	%l7,0x979,%l2
	subc	%l2,%l1,%l3
	smul	%l6,0x94a,%l2
	fsubs	%f19,%f27,%f22
	sub	%l0,0xf7c,%l6
	and	%l4,0xc02,%l0
	udivx	%l3,0xb45,%l4
	jmpl	%o7,%g0
	mulx	%l6,0xd45,%l1
near3_b2b_h:
	or	%l3,%l3,%l5
	xor	%l3,%l3,%l0
	subc	%l6,%l7,%l7
	fsubs	%f16,%f16,%f18
	jmpl	%o7,%g0
	xnor	%l0,-0x54b,%l3
near3_b2b_l:
	fmuls	%f4 ,%f6 ,%f13
	andn	%l5,-0xe1d,%l4
	and	%l3,%l7,%l2
	sdivx	%l2,-0xe97,%l2
	jmpl	%o7,%g0
	fsqrts	%f15,%f7 
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	jmpl	%o7,%g0
	udivx	%l7,-0x45f,%l4
	jmpl	%o7,%g0
	nop
p0_far_0_lem:
	jmpl	%o7,%g0
	udivx	%l7,-0x45f,%l4
	jmpl	%o7,%g0
	nop
p0_far_0_he:
	udivx	%l4,%l5,%l5
	fadds	%f23,%f24,%f17
	andn	%l1,%l7,%l3
	fmuls	%f26,%f19,%f17
	jmpl	%o7,%g0
	or	%l5,-0x743,%l2
p0_far_0_hem:
	udivx	%l4,%l5,%l5
	fadds	%f23,%f24,%f17
	andn	%l1,%l7,%l3
	fmuls	%f26,%f19,%f17
	jmpl	%o7,%g0
	or	%l5,-0x743,%l2
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	fcmps	%fcc1,%f17,%f28
	sdivx	%l4,%l1,%l2
	fcmps	%fcc0,%f21,%f30
	udivx	%l4,%l0,%l6
	sub	%l2,%l6,%l4
	addc	%l6,%l4,%l3
	fcmps	%fcc3,%f28,%f20
	jmpl	%o7,%g0
	smul	%l4,%l0,%l7
far0_b2b_l:
	fdivs	%f3 ,%f5 ,%f10
	andn	%l4,0xede,%l5
	sub	%l7,%l6,%l4
	or	%l2,-0x97c,%l3
	add	%l0,0x552,%l2
	xnor	%l7,0x359,%l0
	sub	%l3,%l2,%l3
	jmpl	%o7,%g0
	fmuls	%f5 ,%f3 ,%f2 
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fsubs	%f4 ,%f8 ,%f4 
	sdivx	%l0,%l3,%l2
	xnor	%l6,-0xe62,%l3
	umul	%l6,0x19d,%l7
	fadds	%f4 ,%f15,%f6 
	smul	%l7,0xcb4,%l7
	jmpl	%o7,%g0
	fadds	%f11,%f14,%f0 
p0_far_1_lem:
	fsubs	%f4 ,%f8 ,%f4 
	sdivx	%l0,%l3,%l2
	xnor	%l6,-0xe62,%l3
	umul	%l6,0x19d,%l7
	fadds	%f4 ,%f15,%f6 
	smul	%l7,0xcb4,%l7
	jmpl	%o7,%g0
	fadds	%f11,%f14,%f0 
p0_far_1_he:
	add	%l5,%l4,%l0
	fdivs	%f31,%f30,%f18
	sub	%l3,0x018,%l3
	and	%l0,%l5,%l7
	and	%l3,%l3,%l6
	jmpl	%o7,%g0
	fadds	%f23,%f26,%f30
p0_far_1_hem:
	add	%l5,%l4,%l0
	fdivs	%f31,%f30,%f18
	sub	%l3,0x018,%l3
	and	%l0,%l5,%l7
	and	%l3,%l3,%l6
	jmpl	%o7,%g0
	fadds	%f23,%f26,%f30
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	fadds	%f17,%f16,%f30
	jmpl	%o7,%g0
	fsqrts	%f24,%f30
far1_b2b_l:
	fadds	%f0 ,%f14,%f13
	jmpl	%o7,%g0
	fdivs	%f4 ,%f0 ,%f2 
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	udivx	%l7,-0x136,%l6
	xor	%l6,0xd5f,%l5
	addc	%l1,%l5,%l0
	and	%l4,0x241,%l4
	jmpl	%o7,%g0
	ldsw	[%i3+0x02c],%l6		! Mem[00000000100c142c]
p0_far_2_lem:
	udivx	%l7,-0x136,%l6
	xor	%l6,0xd5f,%l5
	addc	%l1,%l5,%l0
	and	%l4,0x241,%l4
	membar	#Sync
	jmpl	%o7,%g0
	ldsw	[%i3+0x02c],%l6		! Mem[00000000100c142c]
p0_far_2_he:
	fadds	%f28,%f24,%f16
	addc	%l4,%l5,%l2
	udivx	%l6,-0x26f,%l5
	andn	%l1,%l3,%l7
	udivx	%l5,%l4,%l7
	jmpl	%o7,%g0
	andn	%l4,%l6,%l6
p0_far_2_hem:
	fadds	%f28,%f24,%f16
	addc	%l4,%l5,%l2
	udivx	%l6,-0x26f,%l5
	andn	%l1,%l3,%l7
	udivx	%l5,%l4,%l7
	jmpl	%o7,%g0
	andn	%l4,%l6,%l6
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	mulx	%l5,%l2,%l0
	fmuls	%f24,%f29,%f28
	smul	%l5,0x557,%l5
	addc	%l3,0xd93,%l7
	jmpl	%o7,%g0
	mulx	%l1,-0x5f8,%l6
far2_b2b_l:
	add	%l0,%l1,%l0
	sub	%l5,%l1,%l4
	and	%l7,-0xb7d,%l0
	udivx	%l3,0xeb8,%l2
	jmpl	%o7,%g0
	fsubs	%f4 ,%f3 ,%f11
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	jmpl	%o7,%g0
	xnor	%l7,%l5,%l1
	jmpl	%o7,%g0
	nop
p0_far_3_lem:
	jmpl	%o7,%g0
	xnor	%l7,%l5,%l1
	jmpl	%o7,%g0
	nop
p0_far_3_he:
	fcmps	%fcc3,%f20,%f22
	and	%l7,%l3,%l4
	smul	%l5,%l1,%l2
	subc	%l5,%l6,%l6
	orn	%l2,0x40c,%l7
	xnor	%l2,%l4,%l1
	jmpl	%o7,%g0
	orn	%l6,%l2,%l3
p0_far_3_hem:
	fcmps	%fcc3,%f20,%f22
	and	%l7,%l3,%l4
	smul	%l5,%l1,%l2
	subc	%l5,%l6,%l6
	orn	%l2,0x40c,%l7
	xnor	%l2,%l4,%l1
	jmpl	%o7,%g0
	orn	%l6,%l2,%l3
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	andn	%l2,%l0,%l2
	jmpl	%o7,%g0
	orn	%l4,0x925,%l3
far3_b2b_l:
	smul	%l2,%l6,%l5
	jmpl	%o7,%g0
	sub	%l5,%l3,%l4
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	sub	%l5,%l3,%l6
	jmpl	%g6+8,%g0
	fdivs	%f5 ,%f8 ,%f3 
p0_call_0_le:
	subc	%l4,%l4,%l2
	ldd	[%i2+0x028],%f14	! Mem[0000000010081428]
	mulx	%l7,0x9d8,%l5
	sth	%l0,[%i3+0x008]		! Mem[00000000100c1408]
	andn	%l3,0x15a,%l7
	or	%l0,%l1,%l7
	smul	%l7,-0x2d2,%l5
	retl
	xor	%l1,%l3,%l7
p0_jmpl_0_lo:
	sub	%l5,%l3,%l6
	jmpl	%g6+8,%g0
	fdivs	%f5 ,%f8 ,%f3 
p0_call_0_lo:
	subc	%l4,%l4,%l2
	ldd	[%o2+0x028],%f14	! Mem[0000000010081428]
	mulx	%l7,0x9d8,%l5
	sth	%l0,[%o3+0x008]		! Mem[00000000100c1408]
	andn	%l3,0x15a,%l7
	or	%l0,%l1,%l7
	smul	%l7,-0x2d2,%l5
	retl
	xor	%l1,%l3,%l7
p0_jmpl_0_he:
	andn	%l3,-0x2c0,%l5
	addc	%l5,0xbe2,%l3
	mulx	%l2,-0x295,%l6
	add	%l5,%l0,%l3
	xor	%l1,%l7,%l0
	fmuls	%f27,%f25,%f22
	swap	[%i5+0x008],%l2		! Mem[0000000010141408]
	jmpl	%g6+8,%g0
	fsubs	%f21,%f30,%f30
p0_call_0_he:
	mulx	%l2,%l6,%l1
	subc	%l3,-0xb68,%l0
	ldx	[%i4+0x028],%l6		! Mem[0000000010101428]
	smul	%l3,-0x199,%l6
	fsubs	%f27,%f25,%f23
	umul	%l4,-0xe36,%l3
	orn	%l6,0x599,%l3
	retl
	orn	%l7,%l3,%l5
p0_jmpl_0_ho:
	andn	%l3,-0x2c0,%l5
	addc	%l5,0xbe2,%l3
	mulx	%l2,-0x295,%l6
	add	%l5,%l0,%l3
	xor	%l1,%l7,%l0
	fmuls	%f27,%f25,%f22
	swap	[%o5+0x008],%l2		! Mem[0000000010141408]
	jmpl	%g6+8,%g0
	fsubs	%f21,%f30,%f30
p0_call_0_ho:
	mulx	%l2,%l6,%l1
	subc	%l3,-0xb68,%l0
	ldx	[%o4+0x028],%l6		! Mem[0000000010101428]
	smul	%l3,-0x199,%l6
	fsubs	%f27,%f25,%f23
	umul	%l4,-0xe36,%l3
	orn	%l6,0x599,%l3
	retl
	orn	%l7,%l3,%l5
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	xnor	%l7,%l1,%l0
	addc	%l2,%l2,%l2
	fadds	%f8 ,%f11,%f9 
	mulx	%l6,-0x16b,%l3
	andn	%l7,-0x60d,%l0
	orn	%l2,0x6ee,%l4
	jmpl	%g6+8,%g0
	smul	%l5,%l6,%l7
p0_call_1_le:
	sub	%l0,0x5fd,%l1
	fsqrts	%f14,%f3 
	xor	%l7,%l3,%l0
	fdivs	%f9 ,%f14,%f15
	mulx	%l4,0xe60,%l6
	retl
	add	%l7,-0x10a,%l1
p0_jmpl_1_lo:
	xnor	%l7,%l1,%l0
	addc	%l2,%l2,%l2
	fadds	%f8 ,%f11,%f9 
	mulx	%l6,-0x16b,%l3
	andn	%l7,-0x60d,%l0
	orn	%l2,0x6ee,%l4
	jmpl	%g6+8,%g0
	smul	%l5,%l6,%l7
p0_call_1_lo:
	sub	%l0,0x5fd,%l1
	fsqrts	%f14,%f3 
	xor	%l7,%l3,%l0
	fdivs	%f9 ,%f14,%f15
	mulx	%l4,0xe60,%l6
	retl
	add	%l7,-0x10a,%l1
p0_jmpl_1_he:
	fmuls	%f30,%f27,%f17
	fdivs	%f22,%f31,%f16
	xor	%l0,%l0,%l7
	xor	%l0,0x3e1,%l4
	xnor	%l7,-0xef5,%l3
	jmpl	%g6+8,%g0
	and	%l4,%l2,%l6
p0_call_1_he:
	andn	%l2,-0xa5b,%l6
	andn	%l6,0x791,%l1
	and	%l2,%l2,%l3
	retl
	fadds	%f19,%f26,%f16
p0_jmpl_1_ho:
	fmuls	%f30,%f27,%f17
	fdivs	%f22,%f31,%f16
	xor	%l0,%l0,%l7
	xor	%l0,0x3e1,%l4
	xnor	%l7,-0xef5,%l3
	jmpl	%g6+8,%g0
	and	%l4,%l2,%l6
p0_call_1_ho:
	andn	%l2,-0xa5b,%l6
	andn	%l6,0x791,%l1
	and	%l2,%l2,%l3
	retl
	fadds	%f19,%f26,%f16
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	jmpl	%g6+8,%g0
	addc	%l4,%l0,%l5
p0_call_2_le:
	retl
	addc	%l2,%l4,%l5
p0_jmpl_2_lo:
	jmpl	%g6+8,%g0
	addc	%l4,%l0,%l5
p0_call_2_lo:
	retl
	addc	%l2,%l4,%l5
p0_jmpl_2_he:
	jmpl	%g6+8,%g0
	and	%l1,-0x3ec,%l7
p0_call_2_he:
	xor	%l1,%l4,%l2
	mulx	%l6,%l2,%l2
	retl
	smul	%l2,0xece,%l1
p0_jmpl_2_ho:
	jmpl	%g6+8,%g0
	and	%l1,-0x3ec,%l7
p0_call_2_ho:
	xor	%l1,%l4,%l2
	mulx	%l6,%l2,%l2
	retl
	smul	%l2,0xece,%l1
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	smul	%l4,-0x3c4,%l3
	sdivx	%l1,-0x5ee,%l5
	jmpl	%g6+8,%g0
	fsubs	%f4 ,%f13,%f13
p0_call_3_le:
	retl
	st	%f4 ,[%i3+0x010]	! Mem[00000000100c1410]
p0_jmpl_3_lo:
	smul	%l4,-0x3c4,%l3
	sdivx	%l1,-0x5ee,%l5
	jmpl	%g6+8,%g0
	fsubs	%f4 ,%f13,%f13
p0_call_3_lo:
	retl
	st	%f4 ,[%o3+0x010]	! Mem[00000000100c1410]
p0_jmpl_3_he:
	swap	[%i1+0x03c],%l5		! Mem[000000001004143c]
	xor	%l6,-0x20c,%l4
	fdivs	%f25,%f18,%f23
	umul	%l6,%l7,%l4
	orn	%l0,%l1,%l5
	fsqrts	%f22,%f17
	subc	%l1,%l4,%l2
	jmpl	%g6+8,%g0
	fmuls	%f29,%f20,%f24
p0_call_3_he:
	fdivs	%f16,%f20,%f30
	xnor	%l4,0x193,%l7
	smul	%l2,0x31f,%l7
	mulx	%l0,0xac0,%l6
	fcmps	%fcc3,%f16,%f17
	fcmps	%fcc3,%f23,%f22
	sdivx	%l1,0xc89,%l5
	retl
	std	%f30,[%i6+0x038]	! Mem[0000000010181438]
p0_jmpl_3_ho:
	swap	[%o1+0x03c],%l5		! Mem[000000001004143c]
	xor	%l6,-0x20c,%l4
	fdivs	%f25,%f18,%f23
	umul	%l6,%l7,%l4
	orn	%l0,%l1,%l5
	fsqrts	%f22,%f17
	subc	%l1,%l4,%l2
	jmpl	%g6+8,%g0
	fmuls	%f29,%f20,%f24
p0_call_3_ho:
	fdivs	%f16,%f20,%f30
	xnor	%l4,0x193,%l7
	smul	%l2,0x31f,%l7
	mulx	%l0,0xac0,%l6
	fcmps	%fcc3,%f16,%f17
	fcmps	%fcc3,%f23,%f22
	sdivx	%l1,0xc89,%l5
	retl
	std	%f30,[%o6+0x038]	! Mem[0000000010181438]
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
	.word	0x5c1ddcb2,0x03bac9ef		! Init value for %l0
	.word	0xf5f7578c,0x42919d25		! Init value for %l1
	.word	0x5979c59b,0xa55ee6a3		! Init value for %l2
	.word	0xa6757cc4,0x27f500e7		! Init value for %l3
	.word	0x1a321a2a,0x98290373		! Init value for %l4
	.word	0x08c34e6e,0x42942d06		! Init value for %l5
	.word	0xf7de1af8,0x726bdb14		! Init value for %l6
	.word	0xa97cdac1,0xa8607ae4		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x1cc4ef06,0x11bb5b80		! Init value for %f0 
	.word	0x9b3fc076,0x7f4197f4		! Init value for %f2 
	.word	0xe12ed996,0x558b8924		! Init value for %f4 
	.word	0x2b4a8a4f,0xda763c8f		! Init value for %f6 
	.word	0x5a6976ca,0xf6c155f6		! Init value for %f8 
	.word	0xae479939,0x7edb5512		! Init value for %f10
	.word	0x883b9063,0xfbcadb6b		! Init value for %f12
	.word	0x7e16a1da,0x4171fb46		! Init value for %f14
	.word	0x6c8d6f51,0xf05f3c57		! Init value for %f16
	.word	0x19ab2a7a,0x7b0fecfa		! Init value for %f18
	.word	0x01f0f213,0x638e3258		! Init value for %f20
	.word	0x9eac79fb,0x82f81466		! Init value for %f22
	.word	0x8f931556,0x3e3afa1e		! Init value for %f24
	.word	0xcd5a8ead,0x54fb148e		! Init value for %f26
	.word	0x9677a534,0x636c5a90		! Init value for %f28
	.word	0x430c8ca2,0xc9cd084f		! Init value for %f30
	.word	0x5cbfae9d,0x8115ea5b		! Init value for %f32
	.word	0x25479f92,0x88d790a7		! Init value for %f34
	.word	0x8e81b953,0xc02f20e8		! Init value for %f36
	.word	0x780e1187,0x66202a73		! Init value for %f38
	.word	0x5008158b,0x70cf906d		! Init value for %f40
	.word	0x10624502,0x9347cb08		! Init value for %f42
	.word	0x42faed94,0x96791945		! Init value for %f44
	.word	0x14e2b4cf,0x2c461fea		! Init value for %f46
	.word	0x7a30f59a,0x632faa64
	.word	0x6bac85ba,0x0238beb2
	.word	0x5b0f99ac,0x76cada9c
	.word	0x8f2247e8,0x047e88f1
	.word	0x435ba081,0x38a522eb
	.word	0x76d2ae79,0xf79d947a
	.word	0x5a86160c,0xbcd97dc4
	.word	0xf046de33,0xe10d48e8
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
	.word	0xffffffff,0xffffffff
	.word	0xffffffff,0xffffffd2
	.word	0x00000000,0xa10e0000
	.word	0x00000000,0x555deeff
	.word	0x20000000,0x4769515b
	.word	0x00000000,0x00003bb2
	.word	0x00000000,0x00000003
	.word	0x00000000,0x819fd230
p0_expected_fp_regs:
	.word	0x00faf23e,0x569de4ea
	.word	0x6b000000,0x00000000
	.word	0x00000000,0x00000061
	.word	0x1475009c,0x95e8a059
	.word	0x69611ef1,0x1724420a
	.word	0xd20663ab,0x2753da1f
	.word	0x01000000,0x00000000
	.word	0xdf4ff009,0x9f4c1a7a
	.word	0xb23bd29b,0xfcd71120
	.word	0xdf4e814b,0x4ecacd8a
	.word	0x00000000,0x8acdca4e
	.word	0x003e09b0,0x6b000000
	.word	0xe700f527,0x7fffffff
	.word	0x2011d7fc,0x9bd23bb2
	.word	0xff2eb9b8,0x37faf5bc
	.word	0x740ea328,0x938c6625
	.word	0x00000024,0x00000000		! %fsr = 0000002400000000
p0_local0_expect:
	.word	0x3fffe919,0x871cd51a
	.word	0xff0ea3ff,0x938c6625
	.word	0xffee5d55,0x3bdb7cb6
	.word	0xa3554143,0x6712add7
	.word	0x6faac087,0x47895f38
	.word	0xea835772,0x00000e00
	.word	0x000099c2,0xff4271ca
	.word	0xa46ad298,0x83ac2e49
p0_local0_sec_expect:
	.word	0x2011d7fc,0x9bd23bb2
	.word	0xffffff7f,0x27f500e7
	.word	0xa10e0000,0x555deeff
	.word	0x797e28c2,0x78b00c6d
	.word	0x8686909d,0x618f0054
	.word	0x60e0feb9,0x34673859
	.word	0x39308402,0xcee07961
	.word	0xa20a1c1f,0xe31d4a3b
p0_local1_expect:
	.word	0xb23bd29b,0xfcd71120
	.word	0x7c0c0760,0x8acdca4e
	.word	0xff0000ff,0xf11e6169
	.word	0x938c6625,0x1cd29d36
	.word	0x0989201a,0x8dc07560
	.word	0x6961ecbe,0x4cb570a3
	.word	0x0a000000,0x00000000
	.word	0x00000000,0x000000ff
p0_local1_sec_expect:
	.word	0x7c0c0760,0xfcd71120
	.word	0xff3e09ed,0x075ad7d2
	.word	0x7c0c0760,0x8acdca4e
	.word	0x871cd51a,0x503c56a4
	.word	0xb011ea01,0xabf4380a
	.word	0xe00648ec,0x182eb9b8
	.word	0x0dbe0895,0x5a024868
	.word	0x690f51be,0x0b066455
p0_local2_expect:
	.word	0x00000000,0x808695a1
	.word	0x00000000,0x00000000
	.word	0x1a00814b,0x8acdffab
	.word	0x5b2473a4,0x984a4799
	.word	0xc4302353,0x8acdca4e
	.word	0xb207bcd5,0xf2b1d19f
	.word	0x0000007c,0xdf4e814b
	.word	0xea8837cb,0xd5e0865b
p0_local2_sec_expect:
	.word	0x808695a1,0x569de4ea
	.word	0x28a30e74,0x00000000
	.word	0x9f810000,0x00000061
	.word	0x1475009c,0x95e8a059
	.word	0x69611ef1,0x1724420a
	.word	0xd20663ab,0x2753da1f
	.word	0x2e791a89,0x742b1530
	.word	0xdf4ff009,0x9f4c1a7a
p0_local3_expect:
	.word	0xffab9e88,0x9783de72
	.word	0xfb750760,0x00000020
	.word	0xff0000ff,0x1cecadff
	.word	0x8950e1f0,0x4be97d13
	.word	0x5cf99de5,0x6faac087
	.word	0xef909986,0xde425201
	.word	0x0000ffab,0x5a26c80a
	.word	0x8cec4e1e,0xdfedd9ed
p0_local3_sec_expect:
	.word	0xffffffd2,0x3a39647a
	.word	0xc298736b,0x9508be0d
	.word	0xff7398c2,0xe59df95c
	.word	0x3a3fdf7f,0x62b75853
	.word	0x859ea2cd,0x20c72c48
	.word	0x31b40122,0xa7fca223
	.word	0x73debf3b,0x80583b4e
	.word	0x07fbeb25,0x082dfea0
p0_local4_expect:
	.word	0x00000000,0x27f500e7
	.word	0x61005a07,0x1e2383c4
	.word	0xff000000,0x64c93059
	.word	0xa4563c50,0x1ad51c87
	.word	0xe00648ec,0x690f51be
	.word	0xb8b92e18,0xec2706e0
	.word	0x6848025a,0x9508be0d
	.word	0x5564060b,0xbe510f69
p0_local4_sec_expect:
	.word	0x8acdca4e,0x4b814edf
	.word	0x288ed1fa,0x638e3258
	.word	0xc298736b,0xb12a0000
	.word	0x022d3d25,0x41beac25
	.word	0xed2f139a,0xaf9e27bd
	.word	0xe122d6a9,0x5a7d01a6
	.word	0x295d3bad,0xfe017674
	.word	0xd8d4fc61,0x3607b4bf
p0_local5_expect:
	.word	0xff000000,0x00000000
	.word	0xffff0000,0x00000000
	.word	0x00000ea1,0xffee5d55
	.word	0xa46e0de3,0xc87c3cdc
	.word	0xb8b92e18,0xc6d74810
	.word	0xde905478,0xf2c0b754
	.word	0x49a014aa,0x82db3bdd
	.word	0x30a96025,0x79773ef5
p0_local5_sec_expect:
	.word	0x00000000,0x00000001
	.word	0xb23bd29b,0xfcd71120
	.word	0x00000000,0x819fd230
	.word	0xebb03758,0x8302cdd5
	.word	0x297811a7,0x1debbbb0
	.word	0xd17a569c,0x0f5159e4
	.word	0x6277041d,0x1fae74d2
	.word	0x88c0307d,0xb6d4e9b0
p0_local6_expect:
	.word	0xff0000ff,0x9bd210c4
	.word	0x00000028,0x37faf5bc
	.word	0x774e2963,0x34c7c913
	.word	0xe469d714,0x5f1fffa0
	.word	0x0000006c,0xffffffff
	.word	0x000000ce,0xd10592fe
	.word	0x295d3b9f,0x1c017674
	.word	0x1b3a4718,0xffe2dc88
p0_local6_sec_expect:
	.word	0x01000000,0xc2000000
	.word	0x774e2963,0x34c7c913
	.word	0x5b516947,0x00000020
	.word	0xa0ff1f5f,0x00faf23e
	.word	0x1a208909,0x5b516947
	.word	0xfe9205d1,0xf4cf8619
	.word	0x7476011c,0x9f3b5d29
	.word	0x740ea328,0x8acdca4e
share0_expect:
	.word	0xff20a977,0x9e5e04b1
	.word	0x607fa4ea,0xb9877519
	.word	0xa963c463,0xf1885efa
	.word	0xe64434c4,0x002eed5e
	.word	0xc88360cf,0x89710443
	.word	0x4123a7c1,0xcdf76e9c
	.word	0xe182ed0e,0x2db3a5bb
	.word	0xa72bac89,0xf2a279f3
share1_expect:
	.word	0xff5b8205,0x76b7b0c4
	.word	0x52ae930e,0xde372917
	.word	0x9c56914b,0xe9aa5ae4
	.word	0x2b238c99,0xe452d4b9
	.word	0x5272ac43,0x7083d0be
	.word	0x63a8104b,0xa7fa04f6
	.word	0x0fc64c99,0x7804c6cc
	.word	0x49118a21,0x06f81102
	.word	0x81ff33c3,0xb806f216
	.word	0xb9afe1e3,0xc5577be3
	.word	0xf5e1f6bf,0x970031de
	.word	0xed8dae8a,0x31ed2a80
	.word	0xeacfeed3,0xd1c462f1
	.word	0x29b37db9,0xf98134b9
	.word	0x061778b8,0x75f1f874
	.word	0xf8ec0505,0x43af7300
share2_expect:
	.word	0x00ff7fdc,0x496019da
	.word	0x9ea63dc3,0xdeda1e6e
	.word	0x5960b024,0x0657031a
	.word	0xe4f86083,0x134e77db
	.word	0x8a15245a,0x48891d75
	.word	0x4ed500f3,0xfaaa5ee6
	.word	0x8db34ff4,0xa20685a5
	.word	0xfe34b491,0x220c8d41
share3_expect:
	.word	0x93504c9b,0xb7c3a64d
	.word	0x0de19198,0x9bfcd261
	.word	0xce11a1a7,0x1cee47cb
	.word	0x6352d7d6,0xab7644e0
	.word	0x4e953133,0x088800e4
	.word	0xb3c166a4,0x96383a12
	.word	0x6ee54644,0x93884f71
	.word	0x72db907c,0x69a191e3
	.word	0x2b43ca8e,0x989b2176
	.word	0xc75d7f4b,0x42a04f64
	.word	0xfdb58252,0x517e351c
	.word	0x487986b6,0xca647c59
	.word	0xc8f7bcb2,0xd5ee9f31
	.word	0x17fb91a7,0x5fa5dd6f
	.word	0xda5cd39b,0x8564a1a1
	.word	0x958950f4,0x3cf65d8f
	.word	0xccb8fdf4,0xf2e649e9
	.word	0x5cc8d31c,0x81ceaab1
	.word	0x7b53b13d,0xbfdb1e17
	.word	0x79412f6a,0xf8d0bd7d
	.word	0xa1845a0e,0xb6e69af3
	.word	0x612b3912,0xe7341902
	.word	0xd3e08f44,0xc8086a84
	.word	0x7c4ee4e8,0x637f691a
	.word	0x4ab3dbf8,0x9d20667c
	.word	0x81ffa511,0x848c4f23
	.word	0x6e38c7db,0x1a324662
	.word	0x57f2d56b,0x30bbb9c1
	.word	0x24212b2e,0x2c307e90
	.word	0xb040ad98,0x6837f86d
	.word	0xa8f4e3f5,0x3d77fb54
	.word	0x64d8bea5,0xfccd0c3a
	.word	0x73594e12,0x3ec7e032
	.word	0x65c3ab83,0xabb9a772
	.word	0x522a986f,0x82d332c3
	.word	0xf0ba7414,0xe9b76875
	.word	0x286243fa,0xda6f2082
	.word	0xba8374d7,0xcf8cf42e
	.word	0x62162ae0,0xed5c5b2a
	.word	0x2cbe8490,0x6e093163
	.word	0xd19e6a3a,0xb6744d87
	.word	0x273481ea,0xe226ad5c
	.word	0x32d3d4ce,0x28500494
	.word	0x7939ad64,0x71f9ea64
	.word	0xb5bdea8e,0xd9e38af0
	.word	0x5c0bd115,0x62f9e532
	.word	0xb92c19e0,0xc51fb2fb
	.word	0xccc67de0,0x5f09c694
	.word	0x99c2f773,0x4a124c17
	.word	0xde392ad4,0x969e7a16
	.word	0x8300b8f3,0xdc5b65a4
	.word	0x61312ad4,0x8871d7b6
	.word	0xe2f76f0e,0x4090cda8
	.word	0x9ed24485,0xd9868d79
	.word	0xe602be16,0xc8272916
	.word	0x339059d2,0x9b1125d0
	.word	0x00ff79c5,0x671728c2
	.word	0xdf6e2abb,0x86618f3c
	.word	0x6ebed3e3,0xc80b7ca6
	.word	0x59349609,0x5ae5705b
	.word	0xa3447f22,0x100a61fb
	.word	0xcbb5757e,0x47f717ad
	.word	0xa401c508,0x48f646ab
	.word	0x1c770aee,0x56e45abf
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
	.word	0x54175898,0x3c5f5ba1
	.word	0x00000000,0x00000002
	.word	0x411a0f1f,0xfe1dcd66
	.word	0x00000000,0x00000003
	.word	0xf8dff097,0xa73d6cc0
	.word	0x00000000,0x00000004
	.word	0x6475c5c8,0x4fc74098
	.word	0x00000000,0x00000005
	.word	0xea66b5cf,0xc864ca5e
	.word	0x00000000,0x00000006
	.word	0x434827f8,0x72317fad
	.word	0x00000000,0x00000007
	.word	0x537511b8,0x10a9c9f5
	.word	0x00000000,0x00000008
	.word	0x20e37cf8,0x2c3721f1
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
	.word	0x51e2bae9,0x4f7709ff,0x740ea328,0x938c6625
	.word	0x0951d5c2,0x3bdbfab6,0xa3554143,0x6712add7
	.word	0x5a26c80a,0x47895f38,0xea835772,0x19e9ea3f
	.word	0xd2014b45,0xff4271ca,0xa46ad298,0x83ac2e49
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
	.word	0xea79e18e,0x0a72c5a4,0xa99c79e0,0xa93f6696
	.word	0x3ae6f126,0x1d8af143,0x797e28c2,0x78b00c6d
	.word	0x8686909d,0x618f0054,0x60e0feb9,0x34673859
	.word	0x39308402,0xcee07961,0xa20a1c1f,0xe31d4a3b
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
	.word	0x87c31993,0x026adde4,0xd771bfc8,0x58f92337
	.word	0x6dc19768,0x27314a59,0x516620d4,0xd4d29d36
	.word	0xf8a994eb,0xfb9e6f01,0x6961ecbe,0x4cb570a3
	.word	0x659692dd,0xd256d61b,0x4d41dc2e,0xdfa1ed8a
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
	.word	0xefc6e656,0x2f33da96,0x7c0228ca,0xf5b98c4d
	.word	0x5bb9b747,0xc5f1295c,0x436f042c,0xd7db070c
	.word	0x050f057c,0x5d1c1d9c,0xa508bb47,0xc745495b
	.word	0xac417d83,0x5fd5cbe1,0x8bfd652c,0x75069dd4
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
	.word	0xb38ed1fa,0x808695a1,0x2ccb1377,0x2e557796
	.word	0x4765f615,0xa82049d9,0xe22473a4,0x984a4799
	.word	0xfd309453,0x0168627b,0xb207bcd5,0xf2b1d19f
	.word	0xcd88ffec,0xdf4e814b,0xea8837cb,0xd5e0865b
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
	.word	0x007ff2e9,0x5a9de4ea,0xa1ec156b,0x9219fb3e
	.word	0x524a35b3,0x34aaaa81,0x1475009c,0x95e8a059
	.word	0x69611ef1,0x1724420a,0xd20663ab,0x2753da1f
	.word	0x2e791a89,0x742b1530,0xdf4ff009,0x9f4c1a7a
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
	.word	0xf0ab9e88,0x9783de72,0x1231bb46,0x7fe6ab73
	.word	0x7db12b87,0x34c02ab1,0x8950e1f0,0x4be97d13
	.word	0xb446531f,0x6faac087,0xef909986,0xde425201
	.word	0x3dc99f11,0x67bb5cc4,0x8cec4e1e,0xdfedd9ed
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
	.word	0x9bb6e523,0x3a39647a,0x3bd3dfd0,0x41143843
	.word	0x6b7398c2,0xe59df95c,0x3a3fdf7f,0x62b75853
	.word	0x859ea2cd,0x20c72c48,0x31b40122,0xa7fca223
	.word	0x73debf3b,0x80583b4e,0x07fbeb25,0x082dfea0
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
	.word	0xa211d7fc,0x9bd23bb2,0xd2d75a07,0x1e2383c4
	.word	0x4ecacd8a,0x60070c7c,0xa4563c50,0x1ad51c87
	.word	0x0a38f4ab,0x01ea11b0,0xb8b92e18,0xec4806e0
	.word	0x6848025a,0x9508be0d,0x5564060b,0xbe510f69
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
	.word	0x616b1647,0x0cbf59d3,0x701b8371,0x2037be79
	.word	0x8b90c238,0x89fe37c4,0x022d3d25,0x41beac25
	.word	0xed2f139a,0xaf9e27bd,0xe122d6a9,0x5a7d01a6
	.word	0x036ec2ad,0xfecd2424,0xd8d4fc61,0x3607b4bf
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
	.word	0xd7e71408,0x3a370e78,0x248ab8ca,0x3e11b134
	.word	0x3bdfbbc6,0x55392f0b,0xa46e0de3,0xc87c3cdc
	.word	0x4bb5d947,0xc6d74810,0xde905478,0xf2c0b754
	.word	0x49a014aa,0x82db3bdd,0x30a96025,0x79773ef5
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
	.word	0x1e0b440e,0x81154b27,0x0b29907e,0x4378d57c
	.word	0xd39a7694,0x819fd230,0xebb03758,0x8302cdd5
	.word	0x297811a7,0x1debbbb0,0xd17a569c,0x0f5159e4
	.word	0x6277041d,0x1fae74d2,0x88c0307d,0xb6d4e9b0
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
	.word	0x9775f574,0x98c410c4,0x8a49c734,0x63294e77
	.word	0x20cba8c8,0x02f4e2e0,0xe469d714,0x5f1fffa0
	.word	0x4769515b,0x0989201a,0x1986cff4,0xd10592fe
	.word	0x295d3b9f,0x1c017674,0x1b3a4718,0xcee2dc88
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
	.word	0x2eadec1c,0xdf96719f,0x6075c08d,0x64c93059
	.word	0x7b5b6d7d,0x1aee5d55,0xe84d354f,0xb8bffeed
	.word	0xc5d45d25,0x3b046c02,0x6aec86a6,0xd6f8534b
	.word	0xcfa12cb1,0x4c9bee42,0xe8e100a4,0x4c20c8f5
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
	.word	0xc920a977,0x9e5e04b1,0x607fa4ea,0xb9877519
	.word	0xa963c463,0xf1885efa,0xe64434c4,0x002eed5e
	.word	0xc88360cf,0x89710443,0x4123a7c1,0xcdf76e9c
	.word	0xe182ed0e,0x2db3a5bb,0xa72bac89,0xf2a279f3
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
	.word	0x28a38205,0x76b7b0c4,0x52ae930e,0xde372917
	.word	0x9c56914b,0xe9aa5ae4,0x2b238c99,0xe452d4b9
	.word	0x5272ac43,0x7083d0be,0x63a8104b,0xa7fa04f6
	.word	0x0fc64c99,0x7804c6cc,0x49118a21,0x06f81102
	.word	0x813933c3,0xb806f216,0xb9afe1e3,0xc5577be3
	.word	0xf5e1f6bf,0x970031de,0xed8dae8a,0x31ed2a80
	.word	0xeacfeed3,0xd1c462f1,0x29b37db9,0xf98134b9
	.word	0x061778b8,0x75f1f874,0xf8ec0505,0x43af7300
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
	.word	0xfa597fdc,0x496019da,0x9ea63dc3,0xdeda1e6e
	.word	0x5960b024,0x0657031a,0xe4f86083,0x134e77db
	.word	0x8a15245a,0x48891d75,0x4ed500f3,0xfaaa5ee6
	.word	0x8db34ff4,0xa20685a5,0xfe34b491,0x220c8d41
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
	.word	0x93504c9b,0xb7c3a64d,0x0de19198,0x9bfcd261
	.word	0xce11a1a7,0x1cee47cb,0x6352d7d6,0xab7644e0
	.word	0x4e953133,0x088800e4,0xb3c166a4,0x96383a12
	.word	0x6ee54644,0x93884f71,0x72db907c,0x69a191e3
	.word	0x2b43ca8e,0x989b2176,0xc75d7f4b,0x42a04f64
	.word	0xfdb58252,0x517e351c,0x487986b6,0xca647c59
	.word	0xc8f7bcb2,0xd5ee9f31,0x17fb91a7,0x5fa5dd6f
	.word	0xda5cd39b,0x8564a1a1,0x958950f4,0x3cf65d8f
	.word	0xcc67fdf4,0xf2e649e9,0x5cc8d31c,0x81ceaab1
	.word	0x7b53b13d,0xbfdb1e17,0x79412f6a,0xf8d0bd7d
	.word	0xa1845a0e,0xb6e69af3,0x612b3912,0xe7341902
	.word	0xd3e08f44,0xc8086a84,0x7c4ee4e8,0x637f691a
	.word	0x4ab3dbf8,0x9d20667c,0x81ffa511,0x848c4f23
	.word	0x6e38c7db,0x1a324662,0x57f2d56b,0x30bbb9c1
	.word	0x24212b2e,0x2c307e90,0xb040ad98,0x6837f86d
	.word	0xa8f4e3f5,0x3d77fb54,0x64d8bea5,0xfccd0c3a
	.word	0x73594e12,0x3ec7e032,0x65c3ab83,0xabb9a772
	.word	0x522a986f,0x82d332c3,0xf0ba7414,0xe9b76875
	.word	0x286243fa,0xda6f2082,0xba8374d7,0xcf8cf42e
	.word	0x62162ae0,0xed5c5b2a,0x2cbe8490,0x6e093163
	.word	0xd19e6a3a,0xb6744d87,0x273481ea,0xe226ad5c
	.word	0x32d3d4ce,0x28500494,0x7939ad64,0x71f9ea64
	.word	0xb5bdea8e,0xd9e38af0,0x5c0bd115,0x62f9e532
	.word	0xb92c19e0,0xc51fb2fb,0xccc67de0,0x5f09c694
	.word	0x99c2f773,0x4a124c17,0xde392ad4,0x969e7a16
	.word	0x8300b8f3,0xdc5b65a4,0x61312ad4,0x8871d7b6
	.word	0xe2f76f0e,0x4090cda8,0x9ed24485,0xd9868d79
	.word	0xe602be16,0xc8272916,0x339059d2,0x9b1125d0
	.word	0x118e79c5,0x671728c2,0xdf6e2abb,0x86618f3c
	.word	0x6ebed3e3,0xc80b7ca6,0x59349609,0x5ae5705b
	.word	0xa3447f22,0x100a61fb,0xcbb5757e,0x47f717ad
	.word	0xa401c508,0x48f646ab,0x1c770aee,0x56e45abf
share3_end:
