/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000_1.s
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
!	Seed = 327144513
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_3000_1.s created on Mar 27, 2009 (14:45:13)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_3000_1 -p 1 -l 3000

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
!	%f0  = bae8ddbe 1e1c212c ac39f5c2 388d3f5c
!	%f4  = 3cf8d76e 085ac4d0 eebd8db3 95df57db
!	%f8  = 78a9ce36 f7a81e4a 4d9c7ba1 fd949712
!	%f12 = 01834367 6faa8653 75824276 69ae75b6
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = baed3071 c49472b3 c53d9142 ddad30d2
!	%f20 = 0df09827 2d4ae274 3d724527 c1286522
!	%f24 = f0de7be6 ad4fd416 31827479 fcef8d0a
!	%f28 = 17cbdde4 09c878e8 759380a6 2c8f72af
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 43a83241 c1367bab 1548ab92 67c90033
!	%f36 = b4c7c93f b1cbe074 48a3b397 b9488ce3
!	%f40 = 8acd3823 e6f6cf45 13d4c062 3f34423c
!	%f44 = f820c28c 893f27a1 82ffcd63 ca61af0a
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x6ca7fcf700000035,%g7,%g1 ! GSR scale =  6, align = 5
	wr	%g1,%g0,%gsr		! GSR = 6ca7fcf700000035
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%f26 = 31827479 fcef8d0a, %l5 = c3c0b99e1211677a
!	Mem[0000000010181438] = da8c5dfe8d6e885c
	add	%i6,0x038,%g1
	stda	%f26,[%g1+%l5]ASI_PST8_P ! Mem[0000000010181438] = da827479fc6e8d5c
!	Mem[0000000030101410] = dd39c6d7, %l3 = ea599ffbc149c3cb
	lduha	[%i4+%o5]0x89,%l3	! %l3 = 000000000000c6d7
!	Mem[0000000010041420] = 9e7dbfc7, %l7 = f0d0a402105c0ea4, %asi = 80
	swapa	[%i1+0x020]%asi,%l7	! %l7 = 000000009e7dbfc7
!	Mem[0000000010181428] = 7cca72a4, %l6 = 3649d7309243d268
	ldsha	[%i6+0x02a]%asi,%l6	! %l6 = 00000000000072a4
!	Mem[0000000010101400] = 232976cf, %l2 = 74c225ac0d750daf
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 00000000232976cf
!	Mem[00000000100c1400] = 293e0dfb1b7071a6, %f12 = 01834367 6faa8653
	ldda	[%i3+%g0]0x88,%f12	! %f12 = 293e0dfb 1b7071a6
!	Mem[00000000201c0000] = e35b1b53, %l3 = 000000000000c6d7
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 000000e3000000ff
!	Mem[0000000030001408] = ee0c2209, %l3 = 00000000000000e3
	ldswa	[%i0+%o4]0x89,%l3	! %l3 = ffffffffee0c2209
!	Mem[00000000100c1400] = a671701b fb0d3e29 cb827008 d5e74385
!	Mem[00000000100c1410] = 7594537a 8c9fd8d8 b476594e 1613187e
!	Mem[00000000100c1420] = 8c5704a7 320cf197 7ba05fed 20d7d574
!	Mem[00000000100c1430] = a798c753 97a45277 e52742bb c6617e1e
	ldda	[%i3]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = c93bb6ee, %l7 = 000000009e7dbfc7
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 00000000c93bb6ee

p0_label_2:
!	%f1  = 1e1c212c, Mem[0000000010041410] = a713afb0
	sta	%f1 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 1e1c212c
!	%l4 = f756d882a8a1dfcf, Mem[0000000030001410] = 6ef64cba29394cc6
	stxa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = f756d882a8a1dfcf
!	%l1 = 6a81f0fc63aa7b31, imm = 0000000000000fa4, %l5 = c3c0b99e1211677a
	xnor	%l1,0xfa4,%l5		! %l5 = 957e0f039c558b6a
!	Mem[00000000211c0001] = f04937e1, %l5 = 957e0f039c558b6a
	ldstub	[%o2+0x001],%l5		! %l5 = 00000049000000ff
!	%l2 = 00000000232976cf, Mem[0000000010081410] = ba8d4672e49c43bd
	stxa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000232976cf
!	%l7 = 00000000c93bb6ee, Mem[0000000010041412] = 2c211c1e
	stb	%l7,[%i1+0x012]		! Mem[0000000010041410] = 2c21ee1e
!	Mem[000000001010142b] = 7238dcfc, %l3 = ffffffffee0c2209
	ldstuba	[%i4+0x02b]%asi,%l3	! %l3 = 000000fc000000ff
!	%l7 = 00000000c93bb6ee, Mem[0000000030141408] = e5fc3ef0
	stba	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = e5fc3eee
!	%l2 = 00000000232976cf, imm = fffffffffffff64f, %l3 = 00000000000000fc
	addc	%l2,-0x9b1,%l3		! %l3 = 0000000023296d1e
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 50caa067, %l1 = 6a81f0fc63aa7b31
	lduwa	[%i4+%o5]0x88,%l1	! %l1 = 0000000050caa067

p0_label_3:
!	Mem[0000000010141410] = 1348bc61, %l2 = 00000000232976cf
	lduwa	[%i5+%o5]0x88,%l2	! %l2 = 000000001348bc61
!	Mem[00000000211c0000] = f0ff37e1, %l3 = 0000000023296d1e
	ldsb	[%o2+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030141410] = 6de2f6a10bec4aca, %l6 = 00000000000072a4
	ldxa	[%i5+%o5]0x81,%l6	! %l6 = 6de2f6a10bec4aca
!	Mem[0000000010181400] = 0384a2b8e5f4aea1, %f8  = 78a9ce36 f7a81e4a
	ldda	[%i6+%g0]0x80,%f8 	! %f8  = 0384a2b8 e5f4aea1
!	Mem[0000000010081410] = 232976cf, %l2 = 000000001348bc61
	lduha	[%i2+%o5]0x88,%l2	! %l2 = 00000000000076cf
!	Mem[0000000010181408] = 1e3fe782, %l1 = 0000000050caa067
	lduba	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000082
!	Mem[0000000010041408] = 13b3afd1e5ddf087, %f4  = 3cf8d76e 085ac4d0
	ldda	[%i1+%o4]0x80,%f4 	! %f4  = 13b3afd1 e5ddf087
!	Mem[0000000010001408] = a0f19afc, %l3 = ffffffffffffffff
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 00000000000000fc
!	Mem[0000000010001404] = b2a88f6f, %l3 = 00000000000000fc
	ldsb	[%i0+0x007],%l3		! %l3 = 000000000000006f
!	Starting 10 instruction Store Burst
!	%f14 = 75824276, Mem[0000000030001408] = 09220cee
	sta	%f14,[%i0+%o4]0x81	! Mem[0000000030001408] = 75824276

p0_label_4:
!	%l6 = 6de2f6a10bec4aca, Mem[00000000211c0000] = f0ff37e1
	stb	%l6,[%o2+%g0]		! Mem[00000000211c0000] = caff37e1
!	%l2 = 000076cf, %l3 = 0000006f, Mem[0000000010081400] = b21aea3b 8496004b
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 000076cf 0000006f
	membar	#Sync			! Added by membar checker (1)
!	%l6 = 6de2f6a10bec4aca, Mem[00000000100c1408] = 087082cb
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0bec4aca
!	%l4 = f756d882a8a1dfcf, Mem[0000000030081408] = 2363895f
	stha	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 2363dfcf
!	%l2 = 00000000000076cf, Mem[0000000010101420] = cf9aeed45dececa2, %asi = 80
	stxa	%l2,[%i4+0x020]%asi	! Mem[0000000010101420] = 00000000000076cf
!	Mem[0000000030101410] = d7c639dd291999b3, %f12 = 293e0dfb 1b7071a6
	ldda	[%i4+%o5]0x81,%f12	! %f12 = d7c639dd 291999b3
!	Mem[0000000010141428] = 423f2bbf, %l3 = 000000000000006f, %asi = 80
	swapa	[%i5+0x028]%asi,%l3	! %l3 = 00000000423f2bbf
!	%f8  = 0384a2b8 e5f4aea1, Mem[0000000030081400] = 7dd394a7 9a91b30c
	stda	%f8 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 0384a2b8 e5f4aea1
!	Mem[0000000010081408] = c7bf7d9e, %l4 = f756d882a8a1dfcf
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 000000c7000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 1b7071a6, %l0 = 2c3c68ba8f64fc7b
	ldsba	[%i3+%g0]0x88,%l0	! %l0 = ffffffffffffffa6

p0_label_5:
!	%l5 = 0000000000000049, immed = 00000575, %y  = 00000000
	umul	%l5,0x575,%l3		! %l3 = 0000000000018e5d, %y = 00000000
!	Mem[0000000010101400] = 0d750daf, %l0 = ffffffffffffffa6
	ldswa	[%i4+%g0]0x80,%l0	! %l0 = 000000000d750daf
!	%l6 = 6de2f6a10bec4aca, imm = 0000000000000a59, %l6 = 6de2f6a10bec4aca
	and	%l6,0xa59,%l6		! %l6 = 0000000000000a48
!	Mem[0000000030001400] = fc96f4db, %f12 = d7c639dd
	lda	[%i0+%g0]0x81,%f12	! %f12 = fc96f4db
!	Mem[0000000030141408] = ee3efce5, %l4 = 00000000000000c7
	ldsba	[%i5+%o4]0x81,%l4	! %l4 = ffffffffffffffee
!	Mem[0000000010001400] = ff1608c7b2a88f6f, %l6 = 0000000000000a48
	ldx	[%i0+%g0],%l6		! %l6 = ff1608c7b2a88f6f
!	Mem[0000000010001400] = c70816ff, %l0 = 000000000d750daf
	ldswa	[%i0+%g0]0x88,%l0	! %l0 = ffffffffc70816ff
!	Mem[0000000010081410] = cf76292300000000, %l0 = ffffffffc70816ff
	ldxa	[%i2+%o5]0x80,%l0	! %l0 = cf76292300000000
!	Mem[0000000030041410] = a6c22be26a2312de, %l3 = 0000000000018e5d
	ldxa	[%i1+%o5]0x81,%l3	! %l3 = a6c22be26a2312de
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000076cf, Mem[0000000010041408] = 13b3afd1
	stha	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 76cfafd1

p0_label_6:
!	Mem[00000000211c0001] = caff37e1, %l1 = 0000000000000082
	ldstub	[%o2+0x001],%l1		! %l1 = 000000ff000000ff
!	%f13 = 291999b3, Mem[000000001000142c] = b30a75d3
	sta	%f13,[%i0+0x02c]%asi	! Mem[000000001000142c] = 291999b3
!	%l5 = 0000000000000049, %l5 = 0000000000000049, %y  = 00000000
	smul	%l5,%l5,%l2		! %l2 = 00000000000014d1, %y = 00000000
!	%f16 = 293e0dfb 1b7071a6 8543e7d5 087082cb
!	%f20 = d8d89f8c 7a539475 7e181316 4e5976b4
!	%f24 = 97f10c32 a704578c 74d5d720 ed5fa07b
!	%f28 = 7752a497 53c798a7 1e7e61c6 bb4227e5
	stda	%f16,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	Mem[0000000010181400] = b8a28403, %l4 = ffffffffffffffee
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 00000003000000ff
!	%l2 = 00000000000014d1, Mem[0000000010001418] = f0b2eb57
	sth	%l2,[%i0+0x018]		! Mem[0000000010001418] = 14d1eb57
!	%l5 = 0000000000000049, Mem[0000000010001408] = fc9af1a0b275da05, %asi = 80
	stxa	%l5,[%i0+0x008]%asi	! Mem[0000000010001408] = 0000000000000049
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000030101410] = 7594537a, %l3 = a6c22be26a2312de
	ldstuba	[%i4+%o5]0x81,%l3	! %l3 = 00000075000000ff
!	Mem[0000000010101410] = 67a0ca50, %l0 = cf76292300000000
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 0000000067a0ca50
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 7594537a, %l5 = 0000000000000049
	lduba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000075

p0_label_7:
!	Mem[0000000030001400] = fc96f4db82c2da69, %l4 = 0000000000000003
	ldxa	[%i0+%g0]0x81,%l4	! %l4 = fc96f4db82c2da69
!	Mem[0000000010181418] = 86990270, %l0 = 0000000067a0ca50
	lduh	[%i6+0x01a],%l0		! %l0 = 0000000000000270
!	Mem[0000000010041400] = c3e8b55d4a5adada, %l0 = 0000000000000270
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = c3e8b55d4a5adada
!	Mem[0000000010101410] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = c3e8b55d 4a5adada 76cfafd1 e5ddf087
!	Mem[0000000010041410] = 2c21ee1e 01a907db d387454c 674b9e0c
!	Mem[0000000010041420] = 105c0ea4 70e87990 c812ebd5 76ecb488
!	Mem[0000000010041430] = c4b02542 2936aee7 94f6f2fd 16440446
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[0000000010141414] = 19928940, %l6 = ff1608c7b2a88f6f
	ldsba	[%i5+0x016]%asi,%l6	! %l6 = ffffffffffffff89
!	Mem[0000000010001400] = c70816ff, %l4 = fc96f4db82c2da69
	ldsba	[%i0+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c142c] = 20d7d574, %l4 = ffffffffffffffff
	lduha	[%i3+0x02c]%asi,%l4	! %l4 = 00000000000020d7
!	Mem[0000000030101408] = cb827008, %l7 = 00000000c93bb6ee
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 000000cb000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 3cd7d8b9, %l6 = ffffffffffffff89
	swapa	[%i6+%o5]0x88,%l6	! %l6 = 000000003cd7d8b9

p0_label_8:
!	%f22 = 7e181316 4e5976b4, Mem[0000000010141410] = 1348bc61 40899219
	stda	%f22,[%i5+%o5]0x88	! Mem[0000000010141410] = 7e181316 4e5976b4
!	%l3 = 0000000000000075, Mem[00000000100c1400] = 1b7071a6
	stha	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 1b700075
!	%l4 = 00000000000020d7, Mem[0000000010081400] = 000076cf
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 000020d7
!	%f16 = 293e0dfb 1b7071a6 8543e7d5 087082cb
!	%f20 = d8d89f8c 7a539475 7e181316 4e5976b4
!	%f24 = 97f10c32 a704578c 74d5d720 ed5fa07b
!	%f28 = 7752a497 53c798a7 1e7e61c6 bb4227e5
	stda	%f16,[%i6]ASI_COMMIT_S	! Block Store to 0000000030181400
!	Mem[00000000201c0001] = ff5b1b53, %l1 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 0000005b000000ff
!	%l6 = 3cd7d8b9, %l7 = 000000cb, Mem[0000000030101408] = 087082ff 8543e7d5
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 3cd7d8b9 000000cb
!	Mem[0000000010081410] = 232976cf, %l4 = 00000000000020d7
	swapa	[%i2+%o5]0x88,%l4	! %l4 = 00000000232976cf
!	Mem[0000000010101418] = f7c8f7ce, %l0 = 4a5adada, %l2 = 000014d1
	add	%i4,0x18,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 00000000f7c8f7ce
!	%f9  = 70e87990, %f0  = c3e8b55d, %f11 = 76ecb488
	fdivs	%f9 ,%f0 ,%f11		! %f11 = ec7fbe37
!	Starting 10 instruction Load Burst
!	Mem[000000001010143c] = 0deeec80, %l0 = c3e8b55d4a5adada
	ldsw	[%i4+0x03c],%l0		! %l0 = 000000000deeec80

p0_label_9:
!	Mem[0000000010001410] = 51be144e, %l0 = 000000000deeec80
	ldsha	[%i0+%o5]0x80,%l0	! %l0 = 00000000000051be
!	Mem[0000000030081408] = cfdf6323, %f0  = c3e8b55d
	lda	[%i2+%o4]0x81,%f0 	! %f0 = cfdf6323
!	Mem[00000000201c0000] = ffff1b53, %l3 = 0000000000000075
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010141408] = 3dc9a958, %l5 = 0000000000000075
	ldsba	[%i5+%o4]0x80,%l5	! %l5 = 000000000000003d
!	Mem[0000000020800000] = 72f9aff8, %l5 = 000000000000003d
	ldsha	[%o1+0x000]%asi,%l5	! %l5 = 00000000000072f9
!	Mem[00000000300c1400] = 452046e1, %l4 = 00000000232976cf
	lduha	[%i3+%g0]0x81,%l4	! %l4 = 0000000000004520
!	Mem[00000000300c1410] = 485fb885ff606077, %f12 = c4b02542 2936aee7
	ldda	[%i3+%o5]0x81,%f12	! %f12 = 485fb885 ff606077
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000030181408] = d5e74385, %f10 = c812ebd5
	lda	[%i6+%o4]0x89,%f10	! %f10 = d5e74385
!	Mem[0000000030181400] = a671701bfb0d3e29, %l2 = 00000000f7c8f7ce
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = a671701bfb0d3e29
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000072f9, Mem[0000000010001408] = 00000000
	stba	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000f9

p0_label_10:
!	Mem[0000000030181400] = fb0d3e29, %l2 = a671701bfb0d3e29
	swapa	[%i6+%g0]0x89,%l2	! %l2 = 00000000fb0d3e29
!	%l0 = 00000000000051be, Mem[0000000030141400] = de962820
	stwa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 000051be
!	Mem[00000000300c1408] = 4bd07fcc, %l4 = 0000000000004520
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 000000004bd07fcc
!	%l7 = 00000000000000cb, immed = 00000511, %y  = 00000000
	sdiv	%l7,0x511,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010141400] = c7ddf38e, %l7 = 00000000000000cb
	swapa	[%i5+%g0]0x80,%l7	! %l7 = 00000000c7ddf38e
!	Mem[0000000010101400] = 0d750daf, %l0 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l0	! %l0 = 000000000d750daf
!	Mem[0000000010041400] = c3e8b55d, %l2 = 00000000fb0d3e29
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000c3e8b55d
!	%l4 = 000000004bd07fcc, Mem[0000000030181408] = 8543e7d5
	stwa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 4bd07fcc
!	Mem[00000000211c0001] = caff37e1, %l1 = 000000000000005b
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff84a2b8, %l6 = 000000003cd7d8b9
	lduwa	[%i6+%g0]0x80,%l6	! %l6 = 00000000ff84a2b8

p0_label_11:
!	Mem[0000000010081410] = 000020d7, %f1  = 4a5adada
	lda	[%i2+%o5]0x88,%f1 	! %f1 = 000020d7
!	Mem[0000000030081408] = 2363dfcf, %l5 = 00000000000072f9
	ldswa	[%i2+%o4]0x89,%l5	! %l5 = 000000002363dfcf
!	Mem[0000000030101400] = a671701b fb0d3e29, %l4 = 4bd07fcc, %l5 = 2363dfcf
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 00000000a671701b 00000000fb0d3e29
!	Mem[000000001008141c] = 3391135f, %l7 = 00000000c7ddf38e
	lduw	[%i2+0x01c],%l7		! %l7 = 000000003391135f
!	Mem[0000000010141408] = 3dc9a958, %l7 = 000000003391135f
	lduw	[%i5+%o4],%l7		! %l7 = 000000003dc9a958
!	Mem[0000000010181410] = 89ffffff, %l5 = 00000000fb0d3e29
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 00000000000089ff
!	Mem[00000000211c0000] = caff37e1, %l5 = 00000000000089ff
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101400] = 00000000, %f17 = 1b7071a6
	lda	[%i4+%g0]0x80,%f17	! %f17 = 00000000
!	Mem[0000000020800000] = 72f9aff8, %l6 = 00000000ff84a2b8
	lduba	[%o1+0x001]%asi,%l6	! %l6 = 00000000000000f9
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = d1afcf76, %l0 = 000000000d750daf
	ldstuba	[%i1+%o4]0x88,%l0	! %l0 = 00000076000000ff

p0_label_12:
!	%l6 = 00000000000000f9, Mem[0000000010181400] = b8a284ff
	stha	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = b8a200f9
!	%f30 = 1e7e61c6, Mem[0000000030101408] = 3cd7d8b9
	sta	%f30,[%i4+%o4]0x89	! Mem[0000000030101408] = 1e7e61c6
!	%l0 = 00000076, %l1 = 000000ff, Mem[0000000010181400] = f900a2b8 e5f4aea1
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000076 000000ff
!	Mem[0000000010181430] = d104c68c, %l4 = 00000000a671701b
	swap	[%i6+0x030],%l4		! %l4 = 00000000d104c68c
!	%f28 = 7752a497 53c798a7, Mem[0000000010041428] = c812ebd5 76ecb488
	stda	%f28,[%i1+0x028]%asi	! Mem[0000000010041428] = 7752a497 53c798a7
!	%l0 = 00000076, %l1 = 000000ff, Mem[0000000030081410] = cb028f30 45f6268c
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000076 000000ff
!	Mem[0000000010141418] = 6f8f22e4, %l6 = 000000f9, %l6 = 000000f9
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 000000006f8f22e4
!	%l2 = 00000000c3e8b55d, Mem[0000000010041428] = 7752a49753c798a7, %asi = 80
	stxa	%l2,[%i1+0x028]%asi	! Mem[0000000010041428] = 00000000c3e8b55d
!	Mem[0000000030001400] = dbf496fc, %l7 = 000000003dc9a958
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 000000fc000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 89fffffff56ee344, %l3 = 000000000000ffff
	ldxa	[%i6+%o5]0x80,%l3	! %l3 = 89fffffff56ee344

p0_label_13:
!	Mem[0000000030141408] = ee3efce5, %l5 = ffffffffffffffff
	ldswa	[%i5+%o4]0x81,%l5	! %l5 = ffffffffee3efce5
!	Mem[0000000030101410] = 7a5394ff, %l3 = 89fffffff56ee344
	ldsha	[%i4+%o5]0x89,%l3	! %l3 = ffffffffffff94ff
!	Mem[0000000010141408] = 3dc9a958, %l1 = 00000000000000ff
	lduba	[%i5+%o4]0x80,%l1	! %l1 = 000000000000003d
!	Mem[0000000010081400] = 000020d70000006f, %l3 = ffffffffffff94ff
	ldxa	[%i2+%g0]0x80,%l3	! %l3 = 000020d70000006f
!	Mem[0000000030141400] = be510000, %l5 = ffffffffee3efce5
	ldswa	[%i5+%g0]0x89,%l5	! %l5 = ffffffffbe510000
!	Mem[0000000030001400] = 69dac282dbf496ff, %f24 = 97f10c32 a704578c
	ldda	[%i0+%g0]0x89,%f24	! %f24 = 69dac282 dbf496ff
!	Mem[0000000030001408] = 7582427667186f7c, %l0 = 0000000000000076
	ldxa	[%i0+%o4]0x81,%l0	! %l0 = 7582427667186f7c
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010101400] = 00000000 5d844adb 2ad8b0ca 1cee0b21
!	Mem[0000000010101410] = 00000000 b2519884 f7c8f7ce 034d07b3
!	Mem[0000000010101420] = 00000000 000076cf 7238dcff d4d23108
!	Mem[0000000010101430] = 5541c53f 6530e007 221197b8 0deeec80
	ldda	[%i4]ASI_BLK_AIUP,%f0	! Block Load from 0000000010101400
!	Mem[0000000010081410] = d7200000, %l5 = ffffffffbe510000
	ldsha	[%i2+%o5]0x80,%l5	! %l5 = ffffffffffffd720
!	Starting 10 instruction Store Burst
!	%l4 = 00000000d104c68c, Mem[0000000010141400] = cb000000
	stba	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = cb00008c

p0_label_14:
!	%l4 = 00000000d104c68c, Mem[0000000010081400] = d7200000
	stwa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = d104c68c
!	%l4 = d104c68c, %l5 = ffffd720, Mem[00000000100c1400] = 1b700075 293e0dfb
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = d104c68c ffffd720
!	%l2 = 00000000c3e8b55d, Mem[0000000010081410] = 00000000000020d7
	stxa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000c3e8b55d
!	%l6 = 000000006f8f22e4, Mem[0000000030081400] = 0384a2b8
	stba	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = e484a2b8
!	%l0 = 7582427667186f7c, Mem[0000000030181408] = cc7fd04b
	stwa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 67186f7c
!	Mem[0000000030081410] = 76000000, %l2 = 00000000c3e8b55d
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 0000000076000000
!	%l1 = 000000000000003d, Mem[00000000300c1400] = e1462045
	stha	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = e146003d
!	Mem[0000000020800000] = 72f9aff8, %l2 = 0000000076000000
	ldstub	[%o1+%g0],%l2		! %l2 = 00000072000000ff
!	%l6 = 000000006f8f22e4, Mem[0000000010041400] = dada5a4a293e0dfb
	stxa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000006f8f22e4
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = d8d89f8c, %f28 = 7752a497
	lda	[%i6+%o5]0x81,%f28	! %f28 = d8d89f8c

p0_label_15:
!	Mem[00000000300c1400] = 3d0046e1, %l2 = 0000000000000072
	ldsba	[%i3+%g0]0x81,%l2	! %l2 = 000000000000003d
!	Mem[0000000030081410] = c3e8b55d, %l6 = 000000006f8f22e4
	ldswa	[%i2+%o5]0x81,%l6	! %l6 = ffffffffc3e8b55d
!	Mem[0000000030041408] = b7925e43, %l7 = 00000000000000fc
	lduha	[%i1+%o4]0x89,%l7	! %l7 = 0000000000005e43
!	%l7 = 0000000000005e43, %l1 = 000000000000003d, %l6 = ffffffffc3e8b55d
	andn	%l7,%l1,%l6		! %l6 = 0000000000005e42
!	Mem[0000000010041400] = e4228f6f, %l0 = 7582427667186f7c
	ldsha	[%i1+%g0]0x80,%l0	! %l0 = ffffffffffffe422
!	Mem[0000000010181438] = da827479 fc6e8d5c, %l6 = 00005e42, %l7 = 00005e43
	ldd	[%i6+0x038],%l6		! %l6 = 00000000da827479 00000000fc6e8d5c
!	Mem[0000000010001408] = 000000f9, %f29 = 53c798a7
	lda	[%i0+%o4]0x88,%f29	! %f29 = 000000f9
!	Mem[0000000010001410] = 51be144e, %l0 = ffffffffffffe422
	ldsha	[%i0+%o5]0x80,%l0	! %l0 = 00000000000051be
!	Mem[0000000030001408] = 76428275, %l3 = 000020d70000006f
	lduba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000075
!	Starting 10 instruction Store Burst
!	%f16 = 293e0dfb 00000000 8543e7d5 087082cb
!	%f20 = d8d89f8c 7a539475 7e181316 4e5976b4
!	%f24 = 69dac282 dbf496ff 74d5d720 ed5fa07b
!	%f28 = d8d89f8c 000000f9 1e7e61c6 bb4227e5
	stda	%f16,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400

p0_label_16:
!	%f4  = 00000000 b2519884, Mem[0000000010001410] = 4e14be51 b55f6225
	stda	%f4 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 b2519884
!	%l6 = 00000000da827479, imm = 0000000000000c70, %l7 = 00000000fc6e8d5c
	subc	%l6,0xc70,%l7		! %l7 = 00000000da826809
!	%l3 = 0000000000000075, %l3 = 0000000000000075, %l1 = 000000000000003d
	sub	%l3,%l3,%l1		! %l1 = 0000000000000000
!	Mem[0000000010081400] = 8cc604d1, %l5 = ffffffffffffd720
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 000000008cc604d1
!	Mem[000000001008143d] = 40ee1e7d, %l7 = 00000000da826809
	ldstuba	[%i2+0x03d]%asi,%l7	! %l7 = 000000ee000000ff
!	Mem[00000000300c1410] = 85b85f48, %l1 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 00000048000000ff
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010141410] = b476594e, %l5 = 000000008cc604d1
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 000000b4000000ff
!	Mem[0000000010101404] = 5d844adb, %l3 = 0000000000000075
	swap	[%i4+0x004],%l3		! %l3 = 000000005d844adb
!	%l3 = 000000005d844adb, Mem[0000000010081400] = ffffd720
	stha	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 4adbd720
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 70c11228 9e7dbfff, %l2 = 0000003d, %l3 = 5d844adb
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 000000009e7dbfff 0000000070c11228

p0_label_17:
!	Mem[0000000010001428] = 57bb84ce 291999b3, %l6 = da827479, %l7 = 000000ee
	ldd	[%i0+0x028],%l6		! %l6 = 0000000057bb84ce 00000000291999b3
!	Mem[0000000030001408] = 7582427667186f7c, %l5 = 00000000000000b4
	ldxa	[%i0+%o4]0x81,%l5	! %l5 = 7582427667186f7c
!	Mem[0000000010001420] = a3224195, %l2 = 000000009e7dbfff
	lduh	[%i0+0x020],%l2		! %l2 = 000000000000a322
!	Mem[0000000020800040] = 4717e56e, %l3 = 0000000070c11228
	lduha	[%o1+0x040]%asi,%l3	! %l3 = 0000000000004717
!	Mem[0000000030081408] = 2363dfcf, %l0 = 00000000000051be
	ldsba	[%i2+%o4]0x89,%l0	! %l0 = ffffffffffffffcf
!	Mem[0000000010081408] = 70c112289e7dbfff, %l3 = 0000000000004717
	ldxa	[%i2+%o4]0x88,%l3	! %l3 = 70c112289e7dbfff
!	Mem[0000000030001410] = f756d882a8a1dfcf, %l0 = ffffffffffffffcf
	ldxa	[%i0+%o5]0x89,%l0	! %l0 = f756d882a8a1dfcf
!	Mem[0000000030001400] = dbf496ff, %l5 = 7582427667186f7c
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 00000000dbf496ff
!	Mem[0000000010041400] = e4228f6f00000000, %l1 = 0000000000000048
	ldxa	[%i1+%g0]0x80,%l1	! %l1 = e4228f6f00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 1e3fe782, %l3 = 70c112289e7dbfff
	swapa	[%i6+%o4]0x88,%l3	! %l3 = 000000001e3fe782

p0_label_18:
!	%l5 = 00000000dbf496ff, Mem[0000000010081410] = c3e8b55d
	stwa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = dbf496ff
!	Mem[00000000300c1408] = 00004520, %l5 = 00000000dbf496ff
	ldstuba	[%i3+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000020800001] = fff9aff8, %l7 = 00000000291999b3
	ldstub	[%o1+0x001],%l7		! %l7 = 000000f9000000ff
!	%f27 = ed5fa07b, Mem[0000000010181410] = ffffff89
	sta	%f27,[%i6+%o5]0x88	! Mem[0000000010181410] = ed5fa07b
!	%l7 = 00000000000000f9, Mem[0000000010041400] = e4228f6f
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00f98f6f
!	%l4 = 00000000d104c68c, Mem[00000000100c142c] = 20d7d574
	stw	%l4,[%i3+0x02c]		! Mem[00000000100c142c] = d104c68c
!	%f2  = 2ad8b0ca 1cee0b21, %l0 = f756d882a8a1dfcf
!	Mem[0000000010081410] = ff96f4db00000000
	add	%i2,0x010,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010081410] = 210bee1ccab0d82a
!	%l1 = e4228f6f00000000, Mem[0000000030141410] = 7594537a
	stwa	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Mem[0000000030081408] = cfdf6323, %l1 = e4228f6f00000000
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 000000cf000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 293e0dfb, %l0 = f756d882a8a1dfcf
	ldswa	[%i6+%g0]0x81,%l0	! %l0 = 00000000293e0dfb

p0_label_19:
!	%f15 = 0deeec80, %f5  = b2519884, %f8  = 00000000 000076cf
	fsmuld	%f15,%f5 ,%f8 		! %f8  = b81873ad 83be4000
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 00000000293e0dfb
	setx	0xf650e8cfe102429b,%g7,%l0 ! %l0 = f650e8cfe102429b
!	%l1 = 00000000000000cf
	setx	0x1a3a103fd2aac2de,%g7,%l1 ! %l1 = 1a3a103fd2aac2de
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f650e8cfe102429b
	setx	0x5e6f924865077128,%g7,%l0 ! %l0 = 5e6f924865077128
!	%l1 = 1a3a103fd2aac2de
	setx	0xf4d80b201ce9c623,%g7,%l1 ! %l1 = f4d80b201ce9c623
!	Mem[0000000030081400] = b8a284e4, %l5 = 0000000000000000
	lduha	[%i2+%g0]0x89,%l5	! %l5 = 00000000000084e4
!	Mem[0000000020800040] = 4717e56e, %l1 = f4d80b201ce9c623
	ldsb	[%o1+0x041],%l1		! %l1 = 0000000000000017
!	Mem[00000000300c1408] = ff004520, %l7 = 00000000000000f9
	lduba	[%i3+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001400] = ff96f4db 82c2da69 75824276 67186f7c
!	Mem[0000000030001410] = cfdfa1a8 82d856f7 046279b8 a0f0cd14
!	Mem[0000000030001420] = 9a031f0a 626377fa 018cf05f 551890a6
!	Mem[0000000030001430] = 46a78731 a35aa749 e7e33264 85eb95f9
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[0000000030041400] = 0349e050, %f26 = 74d5d720
	lda	[%i1+%g0]0x89,%f26	! %f26 = 0349e050
!	Mem[0000000010101428] = 7238dcff, %l1 = 0000000000000017
	ldub	[%i4+0x02a],%l1		! %l1 = 00000000000000dc
!	Mem[0000000010101410] = 00000000, %l4 = 00000000d104c68c
	lduba	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 3dc9a958, %l7 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 0000003d000000ff

p0_label_20:
!	%l3 = 000000001e3fe782, Mem[0000000030081408] = ffdf6323
	stha	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = e7826323
!	%f18 = 8543e7d5 087082cb, Mem[0000000010181400] = 76000000 ff000000
	stda	%f18,[%i6+%g0]0x88	! Mem[0000000010181400] = 8543e7d5 087082cb
!	%f26 = 0349e050 ed5fa07b, Mem[0000000010001400] = ff1608c7 b2a88f6f
	stda	%f26,[%i0+%g0]0x80	! Mem[0000000010001400] = 0349e050 ed5fa07b
!	Mem[0000000010101408] = 2ad8b0ca, %l2 = 000000000000a322
	ldstub	[%i4+%o4],%l2		! %l2 = 0000002a000000ff
!	Mem[0000000010041416] = 01a907db, %l0 = 5e6f924865077128
	ldstub	[%i1+0x016],%l0		! %l0 = 00000007000000ff
!	%f30 = 1e7e61c6 bb4227e5, %l7 = 000000000000003d
!	Mem[0000000030181430] = 7752a49753c798a7
	add	%i6,0x030,%g1
	stda	%f30,[%g1+%l7]ASI_PST8_S ! Mem[0000000030181430] = 775261c6bb4298e5
!	Mem[0000000010081404] = 0000006f, %l6 = 0000000057bb84ce
	swap	[%i2+0x004],%l6		! %l6 = 000000000000006f
!	Mem[0000000010141424] = 189c058a, %l3 = 000000001e3fe782
	swap	[%i5+0x024],%l3		! %l3 = 00000000189c058a
!	Mem[0000000030101400] = a671701b, %l5 = 00000000000084e4
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000a671701b
!	Starting 10 instruction Load Burst
!	Mem[0000000010181420] = f0a4f62b, %l1 = 00000000000000dc
	lduh	[%i6+0x020],%l1		! %l1 = 000000000000f0a4

p0_label_21:
!	Mem[0000000030081408] = e7826323 006478bb, %l4 = 00000000, %l5 = a671701b
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 00000000e7826323 00000000006478bb
!	%l2 = 000000000000002a, Mem[0000000010181402] = cb827008
	stb	%l2,[%i6+0x002]		! Mem[0000000010181400] = cb822a08
!	Mem[00000000201c0000] = ffff1b53, %l5 = 00000000006478bb
	ldsh	[%o0+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010141400] = b9dd7106 cb00008c, %l0 = 00000007, %l1 = 0000f0a4
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 00000000cb00008c 00000000b9dd7106
!	Mem[0000000030081410] = c3e8b55dff000000, %l6 = 000000000000006f
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = c3e8b55dff000000
!	Mem[0000000010081410] = 1cee0b21, %l3 = 00000000189c058a
	lduwa	[%i2+%o5]0x88,%l3	! %l3 = 000000001cee0b21
!	Mem[0000000030041408] = ce5bc12bb7925e43, %l5 = ffffffffffffffff
	ldxa	[%i1+%o4]0x89,%l5	! %l5 = ce5bc12bb7925e43
!	Mem[000000001000141c] = e57e6728, %l1 = 00000000b9dd7106
	lduba	[%i0+0x01d]%asi,%l1	! %l1 = 000000000000007e
!	Mem[0000000010141438] = d666fe08, %l1 = 000000000000007e
	lduh	[%i5+0x03a],%l1		! %l1 = 000000000000fe08
!	Starting 10 instruction Store Burst
!	Mem[000000001008142c] = 53f81b30, %l4 = 00000000e7826323
	swap	[%i2+0x02c],%l4		! %l4 = 0000000053f81b30

p0_label_22:
!	Mem[00000000100c1400] = 8cc604d1, %l1 = 0000fe08, %l7 = 0000003d
	casa	[%i3]0x80,%l1,%l7	! %l7 = 000000008cc604d1
!	%l5 = ce5bc12bb7925e43, Mem[00000000100c1410] = 7a539475
	stwa	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = b7925e43
!	%f20 = d8d89f8c, Mem[0000000030081410] = c3e8b55d
	sta	%f20,[%i2+%o5]0x81	! Mem[0000000030081410] = d8d89f8c
!	%f18 = 8543e7d5 087082cb, %l6 = c3e8b55dff000000
!	Mem[0000000010101420] = 00000000000076cf
	add	%i4,0x020,%g1
	stda	%f18,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010101420] = 00000000000076cf
!	%f16 = 293e0dfb 00000000 8543e7d5 087082cb
!	%f20 = d8d89f8c 7a539475 7e181316 4e5976b4
!	%f24 = 69dac282 dbf496ff 0349e050 ed5fa07b
!	%f28 = d8d89f8c 000000f9 1e7e61c6 bb4227e5
	stda	%f16,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	Mem[0000000030181408] = 7c6f1867, %l7 = 000000008cc604d1
	swapa	[%i6+%o4]0x81,%l7	! %l7 = 000000007c6f1867
!	Mem[0000000030101408] = c6617e1e, %l4 = 0000000053f81b30
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 000000c6000000ff
!	Mem[0000000010101410] = 00000000, %l5 = ce5bc12bb7925e43
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = e4840000, %l0 = 00000000cb00008c
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000e4840000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = d8d89f8c7a539475, %l0 = 00000000e4840000
	ldxa	[%i6+%o5]0x81,%l0	! %l0 = d8d89f8c7a539475

p0_label_23:
!	Mem[0000000010101400] = 00000000 00000075, %l6 = ff000000, %l7 = 7c6f1867
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000 0000000000000075
!	Mem[0000000030081400] = e484a2b8, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l5	! %l5 = 00000000000000e4
!	Mem[0000000030041408] = 435e92b72bc15bce, %f2  = 75824276 67186f7c
	ldda	[%i1+%o4]0x81,%f2 	! %f2  = 435e92b7 2bc15bce
!	Mem[00000000300c1410] = ff5fb885, %l2 = 000000000000002a
	lduwa	[%i3+%o5]0x81,%l2	! %l2 = 00000000ff5fb885
!	Mem[00000000201c0000] = ffff1b53, %l0 = d8d89f8c7a539475
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081400] = 20d7db4a, %f8  = 9a031f0a
	lda	[%i2+%g0]0x88,%f8 	! %f8 = 20d7db4a
!	Mem[0000000010101408] = ffd8b0ca, %l1 = 000000000000fe08
	ldsha	[%i4+%o4]0x80,%l1	! %l1 = ffffffffffffffd8
!	Mem[0000000030141410] = 00000000, %l2 = 00000000ff5fb885
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141408] = 58a9c9ff, %l7 = 0000000000000075
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[00000000211c0001] = caff37e1
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = caff37e1

p0_label_24:
!	Mem[0000000010041434] = 2936aee7, %l3 = 000000001cee0b21, %asi = 80
	swapa	[%i1+0x034]%asi,%l3	! %l3 = 000000002936aee7
!	Code Fragment 3
p0_fragment_2:
!	%l0 = ffffffffffffffff
	setx	0xa1b9029780cc0667,%g7,%l0 ! %l0 = a1b9029780cc0667
!	%l1 = ffffffffffffffd8
	setx	0xc4a7533077f48596,%g7,%l1 ! %l1 = c4a7533077f48596
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a1b9029780cc0667
	setx	0x05dfc9d7a6f16840,%g7,%l0 ! %l0 = 05dfc9d7a6f16840
!	%l1 = c4a7533077f48596
	setx	0x77e77fb063542bc5,%g7,%l1 ! %l1 = 77e77fb063542bc5
!	Mem[0000000010041428] = 00000000, %l3 = 000000002936aee7, %asi = 80
	swapa	[%i1+0x028]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 4e5976ff, %l7 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	%f0  = ff96f4db 82c2da69, Mem[0000000030181408] = d104c68c cb827008
	stda	%f0 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ff96f4db 82c2da69
!	Mem[0000000030181400] = fb0d3e29, %l2 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 00000029000000ff
!	%f5  = 82d856f7, Mem[0000000030041400] = 50e04903
	sta	%f5 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 82d856f7
!	Mem[00000000218001c1] = d97173ed, %l0 = 05dfc9d7a6f16840
	ldstuba	[%o3+0x1c1]%asi,%l0	! %l0 = 00000071000000ff
!	%l7 = 00000000000000ff, Mem[0000000030141410] = 00000000
	stba	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ed5fa07b, %l4 = 00000000000000c6
	lduha	[%i6+%o5]0x88,%l4	! %l4 = 000000000000a07b

p0_label_25:
!	Mem[000000001008141c] = 3391135f, %l4 = 000000000000a07b
	ldsw	[%i2+0x01c],%l4		! %l4 = 000000003391135f
!	Mem[0000000030041408] = b7925e43, %l3 = 0000000000000000
	ldsba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000043
!	Mem[0000000010001408] = f900000000000049, %l2 = 0000000000000029
	ldxa	[%i0+%o4]0x80,%l2	! %l2 = f900000000000049
!	%l3 = 0000000000000043, %l7 = 00000000000000ff, %l0 = 0000000000000071
	and	%l3,%l7,%l0		! %l0 = 0000000000000043
!	Mem[0000000010041408] = 87f0dde5 d1afcfff, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 00000000d1afcfff 0000000087f0dde5
!	Mem[0000000010081408] = 9e7dbfff, %l5 = 00000000000000e4
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 000000009e7dbfff
!	Mem[0000000030001408] = 75824276, %l6 = 00000000d1afcfff
	lduba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000075
!	%f21 = 7a539475, %f22 = 7e181316
	fcmps	%fcc1,%f21,%f22		! %fcc1 = 1
!	Mem[0000000010081408] = 9e7dbfff, %l5 = 000000009e7dbfff
	ldsba	[%i2+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 77e77fb063542bc5, Mem[0000000010141400] = cb00008c
	stwa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 63542bc5

p0_label_26:
!	%l5 = ffffffffffffffff, Mem[0000000030101410] = ff94537a
	stba	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = ff94537a
!	Mem[0000000010141400] = c52b5463, %l0 = 0000000000000043
	ldstuba	[%i5+%g0]0x80,%l0	! %l0 = 000000c5000000ff
!	Mem[0000000030141410] = 000000ff, %l0 = 00000000000000c5
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010041424] = 70e87990, %l4 = 3391135f, %l7 = 87f0dde5
	add	%i1,0x24,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 0000000070e87990
!	Mem[0000000010081400] = 20d7db4a, %l5 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 0000004a000000ff
!	%f7  = a0f0cd14, Mem[0000000030081410] = 8c9fd8d8
	sta	%f7 ,[%i2+%o5]0x89	! Mem[0000000030081410] = a0f0cd14
!	%f15 = 85eb95f9, Mem[0000000030141410] = 000000ff
	sta	%f15,[%i5+%o5]0x89	! Mem[0000000030141410] = 85eb95f9
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 00000000000000ff
	setx	0x288a7cf850364c0f,%g7,%l0 ! %l0 = 288a7cf850364c0f
!	%l1 = 77e77fb063542bc5
	setx	0x067f9dff9c0149ac,%g7,%l1 ! %l1 = 067f9dff9c0149ac
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 288a7cf850364c0f
	setx	0x8540a02faf5d7f93,%g7,%l0 ! %l0 = 8540a02faf5d7f93
!	%l1 = 067f9dff9c0149ac
	setx	0xe1e246202c5c7a42,%g7,%l1 ! %l1 = e1e246202c5c7a42
!	%l7 = 0000000070e87990, immd = 0000000000000f7a, %l4 = 000000003391135f
	sdivx	%l7,0xf7a,%l4		! %l4 = 0000000000074ba0
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (6)
!	Mem[00000000100c1400] = 293e0dfb 00000000, %l0 = af5d7f93, %l1 = 2c5c7a42
	ldd	[%i3+%g0],%l0		! %l0 = 00000000293e0dfb 0000000000000000

p0_label_27:
!	Mem[0000000010001408] = 000000f9, %f29 = 000000f9
	lda	[%i0+%o4]0x88,%f29	! %f29 = 000000f9
!	Mem[0000000030141408] = cb827008 d5e74385, %l0 = 293e0dfb, %l1 = 00000000
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000cb827008 00000000d5e74385
!	Mem[0000000030041400] = 82d856f782039345, %f30 = 1e7e61c6 bb4227e5
	ldda	[%i1+%g0]0x81,%f30	! %f30 = 82d856f7 82039345
!	Mem[00000000300c1408] = 204500ff, %l5 = 000000000000004a
	ldswa	[%i3+%o4]0x89,%l5	! %l5 = 00000000204500ff
!	Mem[0000000010041400] = 00f98f6f, %l2 = f900000000000049
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = 8c9fd8d8, %l0 = 00000000cb827008
	lduba	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000d8
!	Mem[0000000030081400] = b8a284e4, %f4  = cfdfa1a8
	lda	[%i2+%g0]0x89,%f4 	! %f4 = b8a284e4
!	Mem[00000000300c1400] = 3d0046e1, %l3 = 0000000000000043
	ldswa	[%i3+%g0]0x81,%l3	! %l3 = 000000003d0046e1
!	Mem[0000000020800000] = ffffaff8, %l7 = 0000000070e87990
	lduha	[%o1+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000d8, Mem[000000001010141c] = 034d07b3
	sth	%l0,[%i4+0x01c]		! Mem[000000001010141c] = 00d807b3

p0_label_28:
!	%l0 = 00000000000000d8, Mem[0000000030181408] = ff96f4db82c2da69
	stxa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000d8
!	Mem[000000001000142f] = 291999b3, %l5 = 00000000204500ff
	ldstub	[%i0+0x02f],%l5		! %l5 = 000000b3000000ff
!	%l6 = 0000000000000075, Mem[0000000010141418] = 6f8f22e4cafdd486, %asi = 80
	stxa	%l6,[%i5+0x018]%asi	! Mem[0000000010141418] = 0000000000000075
!	Mem[00000000100c1410] = 8c9fd8d8, %l2 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 000000d8000000ff
!	%l6 = 0000000000000075, Mem[0000000030001410] = cfdfa1a8
	stba	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 75dfa1a8
!	%f10 = 018cf05f, Mem[0000000010001410] = b2519884
	sta	%f10,[%i0+%o5]0x88	! Mem[0000000010001410] = 018cf05f
!	Mem[00000000100c1400] = fb0d3e29, %l4 = 0000000000074ba0
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 00000000fb0d3e29
!	%l6 = 0000000000000075, Mem[00000000201c0001] = ffff1b53
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = ff751b53
!	%f8  = 20d7db4a 626377fa, Mem[0000000030141400] = 00000000 293e0dfb
	stda	%f8 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 20d7db4a 626377fa
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ffd89f8c, %l4 = 00000000fb0d3e29
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 000000000000ffd8

p0_label_29:
!	Mem[0000000010041418] = d387454c674b9e0c, %f18 = 8543e7d5 087082cb
	ldd	[%i1+0x018],%f18	! %f18 = d387454c 674b9e0c
!	Mem[00000000300c1408] = ff004520, %l2 = 00000000000000d8
	lduwa	[%i3+%o4]0x81,%l2	! %l2 = 00000000ff004520
!	Mem[0000000010181438] = da827479, %l6 = 0000000000000075
	ldsba	[%i6+0x039]%asi,%l6	! %l6 = ffffffffffffff82
!	Mem[0000000010141410] = ff76594e 1613187e, %l0 = 000000d8, %l1 = d5e74385
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 00000000ff76594e 000000001613187e
!	Mem[0000000030141410] = f995eb85, %l3 = 000000003d0046e1
	ldswa	[%i5+%o5]0x81,%l3	! %l3 = fffffffff995eb85
!	Mem[0000000010041400] = 00f98f6f 00000000 ffcfafd1 e5ddf087
!	Mem[0000000010041410] = 2c21ee1e 01a9ffdb d387454c 674b9e0c
!	Mem[0000000010041420] = 105c0ea4 70e87990 2936aee7 c3e8b55d
!	Mem[0000000010041430] = c4b02542 1cee0b21 94f6f2fd 16440446
	ldda	[%i1]ASI_BLK_AIUP,%f16	! Block Load from 0000000010041400
!	Mem[0000000010101410] = 849851b2000000ff, %l6 = ffffffffffffff82
	ldxa	[%i4+%o5]0x88,%l6	! %l6 = 849851b2000000ff
!	%f12 = 46a78731, %f5  = 82d856f7
	fcmpes	%fcc3,%f12,%f5 		! %fcc3 = 2
!	Mem[0000000030101410] = 7a5394ff, %l1 = 000000001613187e
	lduba	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ffff, Mem[0000000010141408] = c97ea54d58a9c9ff
	stxa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000000000ffff

p0_label_30:
!	%f0  = ff96f4db, %f3  = 2bc15bce
	fcmpes	%fcc2,%f0 ,%f3 		! %fcc2 = 3
!	%l6 = 849851b2000000ff, Mem[00000000300c1400] = 55010824e146003d
	stxa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 849851b2000000ff
!	Mem[0000000010041434] = 1cee0b21, %l1 = 00000000000000ff
	swap	[%i1+0x034],%l1		! %l1 = 000000001cee0b21
!	Mem[0000000010081410] = 1cee0b21, %l2 = 00000000ff004520
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 000000001cee0b21
!	%l5 = 00000000000000b3, Mem[00000000300c1410] = 85b85fff
	stba	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 85b85fb3
!	%f2  = 435e92b7, %f3  = 2bc15bce, %f15 = 85eb95f9
	fadds	%f2 ,%f3 ,%f15		! %f15 = 435e92b7
	membar	#Sync			! Added by membar checker (7)
!	%f8  = 20d7db4a 626377fa, Mem[0000000010041400] = 00f98f6f 00000000
	stda	%f8 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 20d7db4a 626377fa
!	%f28 = c4b02542 1cee0b21, Mem[0000000010041408] = ffcfafd1 e5ddf087
	stda	%f28,[%i1+%o4]0x80	! Mem[0000000010041408] = c4b02542 1cee0b21
!	%l2 = 000000001cee0b21, Mem[0000000010101408] = 210bee1ccab0d8ff
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000001cee0b21
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = cb822a08d5e74385, %f26 = 2936aee7 c3e8b55d
	ldda	[%i6+%g0]0x80,%f26	! %f26 = cb822a08 d5e74385

p0_label_31:
!	Mem[0000000030081400] = e484a2b8, %l4 = 000000000000ffd8
	lduwa	[%i2+%g0]0x81,%l4	! %l4 = 00000000e484a2b8
!	Mem[00000000201c0000] = ff751b53, %l7 = 000000000000ffff
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041438] = 94f6f2fd, %l6 = 849851b2000000ff
	lduw	[%i1+0x038],%l6		! %l6 = 0000000094f6f2fd
!	Mem[0000000030181400] = fb0d3eff, %f16 = 00f98f6f
	lda	[%i6+%g0]0x89,%f16	! %f16 = fb0d3eff
!	Mem[00000000300c1410] = 776060ff85b85fb3, %l2 = 000000001cee0b21
	ldxa	[%i3+%o5]0x89,%l2	! %l2 = 776060ff85b85fb3
!	Mem[0000000030081410] = 14cdf0a0, %l5 = 00000000000000b3
	lduha	[%i2+%o5]0x81,%l5	! %l5 = 00000000000014cd
!	Mem[00000000300c1400] = ff000000, %l7 = 00000000000000ff
	lduba	[%i3+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = 000000f9, %f5  = 82d856f7
	lda	[%i0+%o4]0x88,%f5 	! %f5 = 000000f9
!	Mem[0000000010141400] = ff2b5463, %l3 = fffffffff995eb85
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff76594e, Mem[0000000010001429] = 57bb84ce
	stb	%l0,[%i0+0x029]		! Mem[0000000010001428] = 574e84ce

p0_label_32:
!	%f16 = fb0d3eff 00000000, %l5 = 00000000000014cd
!	Mem[0000000030041410] = a6c22be26a2312de
	add	%i1,0x010,%g1
	stda	%f16,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030041410] = 000000006a2312de
!	%l0 = 00000000ff76594e, Mem[0000000010181408] = 9e7dbfff
	stba	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 9e7dbf4e
!	%l7 = 00000000000000ff, Mem[0000000021800101] = bd2b1701
	stb	%l7,[%o3+0x101]		! Mem[0000000021800100] = bdff1701
!	%l6 = 94f6f2fd, %l7 = 000000ff, Mem[0000000010081430] = 00c65d71 bb31ef93
	stda	%l6,[%i2+0x030]%asi	! Mem[0000000010081430] = 94f6f2fd 000000ff
!	Mem[0000000010181400] = cb822a08, %l7 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 000000cb000000ff
!	Mem[00000000100c1408] = d5e74385, %l5 = 00000000000014cd
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 00000085000000ff
!	Mem[0000000010141408] = 0000ffff, %l0 = 00000000ff76594e
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 000000000000ffff
!	%l6 = 0000000094f6f2fd, Mem[0000000010141438] = d666fe08c1115a08
	stx	%l6,[%i5+0x038]		! Mem[0000000010141438] = 0000000094f6f2fd
!	Mem[00000000300c1410] = 85b85fb3, %l0 = 000000000000ffff
	ldstuba	[%i3+%o5]0x89,%l0	! %l0 = 000000b3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 4717e56e, %l4 = 00000000e484a2b8
	ldsba	[%o1+0x040]%asi,%l4	! %l4 = 0000000000000047

p0_label_33:
!	Mem[0000000010101430] = 5541c53f, %f14 = e7e33264
	lda	[%i4+0x030]%asi,%f14	! %f14 = 5541c53f
!	Mem[0000000010101410] = ff000000 b2519884, %l2 = 85b85fb3, %l3 = 000000ff
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 00000000ff000000 00000000b2519884
!	Mem[0000000010141410] = ff76594e, %l3 = 00000000b2519884
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = ffffffffff76594e
!	Mem[00000000211c0000] = caff37e1, %l7 = 00000000000000cb
	ldsb	[%o2+%g0],%l7		! %l7 = ffffffffffffffca
!	Mem[0000000010001400] = 50e04903, %l6 = 0000000094f6f2fd
	ldsba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000003
!	Mem[0000000010081400] = ffdbd720, %l2 = 00000000ff000000
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010141400] = 63542bff, %l2 = 00000000000000ff
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = 0000000000002bff
!	%f2  = 435e92b7, %f26 = cb822a08, %f6  = 046279b8
	fadds	%f2 ,%f26,%f6 		! %f6  = cb822999
!	Mem[00000000300c1400] = ff000000, %l4 = 0000000000000047
	lduha	[%i3+%g0]0x81,%l4	! %l4 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l2 = 00002bff, %l3 = ff76594e, Mem[0000000010081420] = a0b7e376 764c52f1
	stda	%l2,[%i2+0x020]%asi	! Mem[0000000010081420] = 00002bff ff76594e

p0_label_34:
!	%l3 = ffffffffff76594e, Mem[0000000010041400] = 4adbd720
	stwa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = ff76594e
!	Mem[0000000030001400] = dbf496ff, %l3 = ffffffffff76594e
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 00000000dbf496ff
!	Mem[0000000030001410] = 75dfa1a8, %l2 = 0000000000002bff
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 00000075000000ff
!	%f20 = 2c21ee1e, Mem[0000000010001438] = 0c818230
	sta	%f20,[%i0+0x038]%asi	! Mem[0000000010001438] = 2c21ee1e
!	%l5 = 0000000000000085, Mem[0000000010081400] = ffdbd72057bb84ce
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000085
!	%f6  = cb822999 a0f0cd14, Mem[0000000010001400] = 50e04903 7ba05fed
	stda	%f6 ,[%i0+%g0]0x88	! Mem[0000000010001400] = cb822999 a0f0cd14
!	Mem[0000000010181408] = 9e7dbf4e, %l3 = 00000000dbf496ff
	swapa	[%i6+%o4]0x88,%l3	! %l3 = 000000009e7dbf4e
!	%f9  = 626377fa, Mem[0000000030001408] = 76428275
	sta	%f9 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 626377fa
!	Mem[00000000300c1408] = 204500ff, %l2 = 0000000000000075
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 00000000204500ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 000000f9, %l6 = 0000000000000003
	ldsha	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000f9

p0_label_35:
!	Mem[0000000010141408] = 4e5976ff, %f25 = 70e87990
	lda	[%i5+0x008]%asi,%f25	! %f25 = 4e5976ff
!	Mem[0000000010141408] = 4e5976ff, %l4 = 000000000000ff00
	lduha	[%i5+%o4]0x80,%l4	! %l4 = 0000000000004e59
!	Mem[0000000030101400] = 293e0dfb cb00008c, %l4 = 00004e59, %l5 = 00000085
	ldda	[%i4+%g0]0x89,%l4	! %l4 = 00000000cb00008c 00000000293e0dfb
!	Mem[0000000010081420] = 00002bff ff76594e, %l6 = 000000f9, %l7 = ffffffca
	ldda	[%i2+0x020]%asi,%l6	! %l6 = 0000000000002bff 00000000ff76594e
!	Mem[0000000030081400] = e484a2b8, %l3 = 000000009e7dbf4e
	lduha	[%i2+%g0]0x81,%l3	! %l3 = 000000000000e484
!	Mem[0000000030101400] = 8c0000cb, %l3 = 000000000000e484
	lduha	[%i4+%g0]0x81,%l3	! %l3 = 0000000000008c00
!	Mem[0000000030041400] = 82d856f7, %l3 = 0000000000008c00
	ldswa	[%i1+%g0]0x81,%l3	! %l3 = ffffffff82d856f7
!	Mem[0000000030001410] = a8a1dfff, %f8  = 20d7db4a
	lda	[%i0+%o5]0x89,%f8 	! %f8 = a8a1dfff
!	Mem[0000000030041410] = de12236a 00000000, %l6 = 00002bff, %l7 = ff76594e
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000 00000000de12236a
!	Starting 10 instruction Store Burst
!	%f28 = c4b02542 1cee0b21, %l0 = 00000000000000b3
!	Mem[0000000010041420] = 105c0ea470e87990
	add	%i1,0x020,%g1
	stda	%f28,[%g1+%l0]ASI_PST8_P ! Mem[0000000010041420] = c45c254270e80b21

p0_label_36:
!	Mem[000000001010142c] = d4d23108, %l2 = 00000000204500ff, %asi = 80
	swapa	[%i4+0x02c]%asi,%l2	! %l2 = 00000000d4d23108
!	%l2 = 00000000d4d23108, Mem[00000000211c0000] = caff37e1, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 08ff37e1
!	%l1 = 000000001cee0b21, Mem[0000000010101410] = ff000000b2519884
	stxa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000001cee0b21
!	%l5 = 00000000293e0dfb, Mem[0000000010141400] = ff2b5463
	stwa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 293e0dfb
!	Mem[0000000030081410] = a0f0cd14, %l7 = 00000000de12236a
	swapa	[%i2+%o5]0x89,%l7	! %l7 = 00000000a0f0cd14
!	%l3 = ffffffff82d856f7, Mem[0000000010001400] = 14cdf0a0
	stba	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = f7cdf0a0
!	%l7 = 00000000a0f0cd14, Mem[00000000201c0001] = ff751b53, %asi = 80
	stba	%l7,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff141b53
!	%l4 = cb00008c, %l5 = 293e0dfb, Mem[0000000010081408] = ffbf7d9e 2812c170
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = cb00008c 293e0dfb
!	Mem[0000000030101400] = cb00008c, %l1 = 000000001cee0b21
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 0000008c000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000 00000075, %l2 = d4d23108, %l3 = 82d856f7
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000 0000000000000075

p0_label_37:
!	Mem[0000000030141400] = 626377fa, %l6 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l6	! %l6 = fffffffffffffffa
!	Mem[0000000010081408] = cb00008c293e0dfb, %l4 = 00000000cb00008c
	ldxa	[%i2+%o4]0x80,%l4	! %l4 = cb00008c293e0dfb
!	Mem[0000000030181408] = 000000d8, %f2  = 435e92b7
	lda	[%i6+%o4]0x89,%f2 	! %f2 = 000000d8
!	Mem[0000000010101410] = 000000001cee0b21, %l4 = cb00008c293e0dfb
	ldxa	[%i4+0x010]%asi,%l4	! %l4 = 000000001cee0b21
!	Mem[0000000010041404] = 626377fa, %l1 = 000000000000008c
	ldsba	[%i1+0x007]%asi,%l1	! %l1 = fffffffffffffffa
!	Mem[0000000030101400] = cb0000ff, %l0 = 00000000000000b3
	lduha	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101410] = ff94537a, %l3 = 0000000000000075
	ldsha	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffff94
!	Mem[0000000010141410] = 7e1813164e5976ff, %f26 = cb822a08 d5e74385
	ldda	[%i5+%o5]0x88,%f26	! %f26 = 7e181316 4e5976ff
!	%l2 = 0000000000000000, imm = 00000000000008e9, %l2 = 0000000000000000
	xnor	%l2,0x8e9,%l2		! %l2 = fffffffffffff716
!	Starting 10 instruction Store Burst
!	%l4 = 000000001cee0b21, Mem[0000000021800101] = bdff1701
	stb	%l4,[%o3+0x101]		! Mem[0000000021800100] = bd211701

p0_label_38:
!	Mem[0000000010081400] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101408] = 1cee0b21, %l3 = ffffffffffffff94
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 000000001cee0b21
!	%l6 = fffffffffffffffa, Mem[0000000030141410] = d8d89f8c85eb95f9
	stxa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = fffffffffffffffa
!	%l2 = fffffffffffff716, Mem[0000000020800001] = ffffaff8
	stb	%l2,[%o1+0x001]		! Mem[0000000020800000] = ff16aff8
!	%l7 = 00000000a0f0cd14, %l6 = fffffffffffffffa, %y  = 00000000
	umul	%l7,%l6,%l2		! %l2 = a0f0cd103a5b3188, %y = a0f0cd10
!	%l5 = 00000000293e0dfb, %l2 = a0f0cd103a5b3188, %y  = a0f0cd10
	sdiv	%l5,%l2,%l6		! %l6 = ffffffff80000000
	mov	%l0,%y			! %y = 00000000
!	%f6  = cb822999 a0f0cd14, Mem[00000000300c1408] = 00000075 de2eb0db
	stda	%f6 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = cb822999 a0f0cd14
!	%l4 = 000000001cee0b21, Mem[0000000030141408] = 087082cb
	stwa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 1cee0b21
!	%f12 = 46a78731 a35aa749, Mem[0000000010001410] = 5ff08c01 00000000
	stda	%f12,[%i0+%o5]0x80	! Mem[0000000010001410] = 46a78731 a35aa749
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = e7826323, %l3 = 000000001cee0b21
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = ffffffffffffe782

p0_label_39:
!	%l1 = fffffffffffffffa, Mem[00000000211c0000] = 08ff37e1, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = faff37e1
!	Mem[0000000030041410] = 00000000, %l5 = 00000000293e0dfb
	ldsha	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 85000000 000000ff, %l2 = 3a5b3188, %l3 = ffffe782
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff 0000000085000000
!	Mem[0000000010141408] = 4e5976ff, %l4 = 000000001cee0b21
	lduba	[%i5+%o4]0x80,%l4	! %l4 = 000000000000004e
!	%l3 = 0000000085000000, imm = fffffffffffffc09, %l6 = ffffffff80000000
	and	%l3,-0x3f7,%l6		! %l6 = 0000000085000000
!	Mem[0000000010081408] = 8c0000cb, %f20 = 2c21ee1e
	lda	[%i2+%o4]0x88,%f20	! %f20 = 8c0000cb
!	Mem[0000000030081410] = 6a2312de, %l0 = 0000000000000000
	ldsha	[%i2+%o5]0x81,%l0	! %l0 = 0000000000006a23
!	Mem[0000000021800040] = cf09f702, %l4 = 000000000000004e
	lduba	[%o3+0x040]%asi,%l4	! %l4 = 00000000000000cf
!	Mem[0000000030001410] = a8a1dfff, %l0 = 0000000000006a23
	lduwa	[%i0+%o5]0x89,%l0	! %l0 = 00000000a8a1dfff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 85b85fff, %l4 = 00000000000000cf
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 0000000085b85fff

p0_label_40:
!	%l1 = fffffffffffffffa, %l5 = 0000000000000000, %l1 = fffffffffffffffa
	add	%l1,%l5,%l1		! %l1 = fffffffffffffffa
!	Mem[0000000030001410] = a8a1dfff, %l4 = 0000000085b85fff
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 00000000a8a1dfff
!	Mem[0000000020800001] = ff16aff8, %l5 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 00000016000000ff
!	%l1 = fffffffffffffffa, Mem[00000000300c1400] = 000000ff
	stha	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000fffa
!	Mem[0000000010041438] = 94f6f2fd16440446, %l6 = 0000000085000000, %l1 = fffffffffffffffa
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 94f6f2fd16440446
!	Mem[0000000010181410] = ed5fa07b, %l5 = 0000000000000016
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 0000007b000000ff
!	%f0  = ff96f4db 82c2da69, Mem[00000000100c1410] = 8c9fd8ff 7594537a
	stda	%f0 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff96f4db 82c2da69
!	Mem[0000000010081410] = ff004520, %l6 = 0000000085000000
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000ff004520
!	%l6 = 00000000ff004520, Mem[0000000010101400] = 00000000
	stwa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = ff004520
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 7c6f1867 626377fa, %l6 = ff004520, %l7 = a0f0cd14
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000626377fa 000000007c6f1867

p0_label_41:
!	Mem[0000000030041400] = f756d882, %f17 = 00000000
	lda	[%i1+%g0]0x89,%f17	! %f17 = f756d882
!	Mem[0000000030141408] = 1cee0b21, %l3 = 0000000085000000
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 000000001cee0b21
!	%l4 = 00000000a8a1dfff, imm = fffffffffffff531, %l7 = 000000007c6f1867
	orn	%l4,-0xacf,%l7		! %l7 = 00000000a8a1dfff
!	Mem[00000000100c1408] = ff43e7d5, %f31 = 16440446
	lda	[%i3+%o4]0x80,%f31	! %f31 = ff43e7d5
!	Mem[00000000211c0000] = faff37e1, %l6 = 00000000626377fa
	ldub	[%o2+0x001],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %f10 = 018cf05f
	lda	[%i4+%o5]0x88,%f10	! %f10 = 00000000
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030041400] = 82d856f7 82039345 435e92b7 2bc15bce
!	Mem[0000000030041410] = 00000000 6a2312de 767d3dba d3c9b966
!	Mem[0000000030041420] = 0aaf40f1 0b8830e7 5ce1c8ac ff2daf8c
!	Mem[0000000030041430] = f1b5ec40 8c647f34 09ac1b34 7b1e9ff7
	ldda	[%i1]ASI_BLK_AIUS,%f0	! Block Load from 0000000030041400
!	Mem[0000000010141400] = fb0d3e29, %l7 = 00000000a8a1dfff
	ldswa	[%i5+%g0]0x88,%l7	! %l7 = fffffffffb0d3e29
!	Mem[00000000100c1400] = 00074ba0, %l7 = fffffffffb0d3e29
	lduwa	[%i3+%g0]0x88,%l7	! %l7 = 0000000000074ba0
!	Starting 10 instruction Store Burst
!	%l3 = 000000001cee0b21, Mem[00000000201c0000] = ff141b53, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0b211b53

p0_label_42:
!	%l2 = 00000000000000ff, Mem[00000000100c1400] = a04b0700
	stba	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff4b0700
!	%l0 = 00000000a8a1dfff, Mem[000000001004140c] = 1cee0b21, %asi = 80
	stwa	%l0,[%i1+0x00c]%asi	! Mem[000000001004140c] = a8a1dfff
!	%l1 = 94f6f2fd16440446, Mem[00000000300c1410] = cf000000
	stba	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 46000000
!	%f20 = 8c0000cb, %f27 = 4e5976ff
	fcmpes	%fcc2,%f20,%f27		! %fcc2 = 1
!	%l6 = 00000000000000ff, Mem[0000000010141400] = 293e0dfb
	stba	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = ff3e0dfb
!	Mem[0000000010141408] = 4e5976ff, %l4 = 00000000a8a1dfff
	swap	[%i5+%o4],%l4		! %l4 = 000000004e5976ff
!	%l4 = 000000004e5976ff, Mem[00000000100c1410] = 69dac282
	stwa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 4e5976ff
!	Mem[0000000010081410] = 85000000, %l5 = 000000000000007b
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 00074ba0, Mem[0000000010081408] = 8c0000cb fb0d3e29
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff 00074ba0
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 4e5976ff, %l2 = 00000000000000ff
	lduha	[%i3+%o5]0x80,%l2	! %l2 = 0000000000004e59

p0_label_43:
!	Mem[0000000010001400] = f7cdf0a0, %l4 = 000000004e5976ff
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 000000000000f7cd
!	Mem[0000000030101410] = ff94537a 8c9fd8d8, %l2 = 00004e59, %l3 = 1cee0b21
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000ff94537a 000000008c9fd8d8
!	Mem[00000000300c1408] = 14cdf0a0, %l6 = 00000000000000ff
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 0000000014cdf0a0
!	Mem[0000000010041400] = ff76594e, %f27 = 4e5976ff
	lda	[%i1+%g0]0x88,%f27	! %f27 = ff76594e
!	Mem[00000000300c1400] = faff0000, %l4 = 000000000000f7cd
	ldswa	[%i3+%g0]0x81,%l4	! %l4 = fffffffffaff0000
!	Mem[0000000010081410] = ff000085, %l6 = 0000000014cdf0a0
	lduwa	[%i2+%o5]0x80,%l6	! %l6 = 00000000ff000085
!	Mem[0000000010081408] = 000000ff, %l1 = 94f6f2fd16440446
	ldswa	[%i2+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081400] = a1aef4e5 b8a284e4, %l0 = a8a1dfff, %l1 = 000000ff
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 00000000b8a284e4 00000000a1aef4e5
!	%l3 = 000000008c9fd8d8, imm = 000000000000093e, %l4 = fffffffffaff0000
	sub	%l3,0x93e,%l4		! %l4 = 000000008c9fcf9a
!	Starting 10 instruction Store Burst
!	%f0  = 82d856f7 82039345 435e92b7 2bc15bce
!	%f4  = 00000000 6a2312de 767d3dba d3c9b966
!	%f8  = 0aaf40f1 0b8830e7 5ce1c8ac ff2daf8c
!	%f12 = f1b5ec40 8c647f34 09ac1b34 7b1e9ff7
	stda	%f0,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400

p0_label_44:
!	%f0  = 82d856f7 82039345 435e92b7 2bc15bce
!	%f4  = 00000000 6a2312de 767d3dba d3c9b966
!	%f8  = 0aaf40f1 0b8830e7 5ce1c8ac ff2daf8c
!	%f12 = f1b5ec40 8c647f34 09ac1b34 7b1e9ff7
	stda	%f0,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	Mem[0000000010141400] = ff3e0dfb, %l5 = 00000000, %l1 = a1aef4e5
	casa	[%i5]0x80,%l5,%l1	! %l1 = 00000000ff3e0dfb
!	Mem[000000001014142c] = 7e5b4503, %l3 = 000000008c9fd8d8
	swap	[%i5+0x02c],%l3		! %l3 = 000000007e5b4503
!	Mem[0000000010101410] = 00000000, %l1 = 00000000ff3e0dfb
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f24 = 105c0ea4, Mem[0000000010041410] = de12236a
	sta	%f24,[%i1+%o5]0x80	! Mem[0000000010041410] = 105c0ea4
!	%l2 = 00000000ff94537a, imm = fffffffffffff54e, %l0 = 00000000b8a284e4
	and	%l2,-0xab2,%l0		! %l0 = 00000000ff94514a
!	%l1 = 0000000000000000, Mem[0000000030141400] = fa776362
	stwa	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%f20 = 8c0000cb 01a9ffdb, %l1 = 0000000000000000
!	Mem[0000000030141418] = b476594e1613187e
	add	%i5,0x018,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_S ! Mem[0000000030141418] = b476594e1613187e
!	Mem[0000000010181408] = dbf496ff, %l1 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010041400] = 82d856f782039345, %f24 = 105c0ea4 4e5976ff
	ldda	[%i1+%g0]0x88,%f24	! %f24 = 82d856f7 82039345

p0_label_45:
!	Mem[0000000010101408] = 94ffffff 00000000, %l0 = ff94514a, %l1 = 000000ff
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 0000000094ffffff 0000000000000000
!	Mem[00000000100c1400] = ff4b0700, %f9  = 0b8830e7
	lda	[%i3+%g0]0x80,%f9 	! %f9 = ff4b0700
!	Mem[0000000010041400] = 45930382, %l5 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = 0000000045930382
!	Mem[00000000211c0000] = faff37e1, %l4 = 000000008c9fcf9a
	ldub	[%o2+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030181410] = d8d89f8c 7a539475, %l6 = ff000085, %l7 = 00074ba0
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 00000000d8d89f8c 000000007a539475
!	Mem[0000000010181408] = ff96f4db43a63ff5, %f6  = 767d3dba d3c9b966
	ldda	[%i6+%o4]0x80,%f6 	! %f6  = ff96f4db 43a63ff5
!	Mem[0000000010081408] = ff000000, %l5 = 0000000045930382
	lduba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 0000000094ffffff
	setx	0x1443a3d04b62e152,%g7,%l0 ! %l0 = 1443a3d04b62e152
!	%l1 = 0000000000000000
	setx	0x780adc378f299f1d,%g7,%l1 ! %l1 = 780adc378f299f1d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1443a3d04b62e152
	setx	0x6c0fd177be6559b0,%g7,%l0 ! %l0 = 6c0fd177be6559b0
!	%l1 = 780adc378f299f1d
	setx	0x7932ad981c2c290b,%g7,%l1 ! %l1 = 7932ad981c2c290b
!	Mem[00000000100c1400] = ff4b070000000000, %l4 = 00000000000000ff
	ldxa	[%i3+%g0]0x80,%l4	! %l4 = ff4b070000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ffa05fed, %l6 = 00000000d8d89f8c
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 000000ff000000ff

p0_label_46:
!	%f6  = ff96f4db 43a63ff5, Mem[0000000030101410] = 7a5394ff d8d89f8c
	stda	%f6 ,[%i4+%o5]0x89	! Mem[0000000030101410] = ff96f4db 43a63ff5
!	Mem[0000000010041400] = 82039345, %l5 = 00000000000000ff
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 00000045000000ff
!	%l3 = 000000007e5b4503, Mem[0000000030081400] = b8a284e4
	stba	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = b8a28403
!	Mem[0000000030081400] = b8a28403, %l3 = 000000007e5b4503
	swapa	[%i2+%g0]0x89,%l3	! %l3 = 00000000b8a28403
!	%f8  = 0aaf40f1, Mem[0000000030041408] = b7925e43
	sta	%f8 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 0aaf40f1
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 6c0fd177be6559b0
	setx	0x0ac02dafed436fec,%g7,%l0 ! %l0 = 0ac02dafed436fec
!	%l1 = 7932ad981c2c290b
	setx	0x221ed290489019c6,%g7,%l1 ! %l1 = 221ed290489019c6
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0ac02dafed436fec
	setx	0x337699c82a5df9b7,%g7,%l0 ! %l0 = 337699c82a5df9b7
!	%l1 = 221ed290489019c6
	setx	0xab2f14882edcdabc,%g7,%l1 ! %l1 = ab2f14882edcdabc
!	Mem[0000000010081420] = 00002bff, %l2 = 00000000ff94537a
	swap	[%i2+0x020],%l2		! %l2 = 0000000000002bff
!	Mem[0000000030101410] = 43a63ff5, %l3 = 00000000b8a28403
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 000000f5000000ff
!	Mem[0000000030001410] = ff5fb885, %l3 = 00000000000000f5
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = d8000000, %l1 = ab2f14882edcdabc
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000d8

p0_label_47:
!	Mem[00000000211c0000] = faff37e1, %l5 = 0000000000000045
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081400] = 7e5b4503, %l5 = 00000000000000ff
	ldswa	[%i2+%g0]0x89,%l5	! %l5 = 000000007e5b4503
!	Mem[00000000100c1400] = ff4b0700, %l5 = 000000007e5b4503
	lduha	[%i3+%g0]0x80,%l5	! %l5 = 000000000000ff4b
!	Mem[0000000021800100] = bd211701, %l5 = 000000000000ff4b
	ldsb	[%o3+0x100],%l5		! %l5 = ffffffffffffffbd
!	Mem[0000000030101400] = cb0000ff, %l7 = 000000007a539475
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = ffffffffcb0000ff
!	Mem[0000000010081400] = 85000000000000ff, %l2 = 0000000000002bff
	ldxa	[%i2+%g0]0x88,%l2	! %l2 = 85000000000000ff
!	Mem[0000000010041408] = 435e92b72bc15bce, %f2  = 435e92b7 2bc15bce
	ldda	[%i1+%o4]0x88,%f2 	! %f2  = 435e92b7 2bc15bce
!	Mem[0000000010181430] = a671701b, %l4 = ff4b070000000000
	ldsh	[%i6+0x032],%l4		! %l4 = 000000000000701b
!	Mem[0000000030001410] = ff5fb885 82d856f7, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 00000000ff5fb885 0000000082d856f7
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff5fb885, Mem[0000000010181400] = 082a82ff
	stba	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 082a8285

p0_label_48:
!	%f6  = ff96f4db, %f5  = 6a2312de
	fcmps	%fcc2,%f6 ,%f5 		! %fcc2 = 3
!	Mem[0000000030081400] = 7e5b4503, %l1 = 00000000000000d8
	ldstuba	[%i2+%g0]0x89,%l1	! %l1 = 00000003000000ff
!	Mem[0000000020800041] = 4717e56e, %l5 = ffffffffffffffbd
	ldstub	[%o1+0x041],%l5		! %l5 = 00000017000000ff
!	%f0  = 82d856f7 82039345, Mem[0000000030181408] = d8000000 00000000
	stda	%f0 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 82d856f7 82039345
!	%l3 = 0000000082d856f7, Mem[0000000010101408] = 94ffffff00000000
	stxa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000082d856f7
!	%l1 = 0000000000000003, imm = fffffffffffff5d4, %l1 = 0000000000000003
	or	%l1,-0xa2c,%l1		! %l1 = fffffffffffff5d7
!	%l6 = 00000000000000ff, immd = 0000000000000ab7, %l0 = 337699c82a5df9b7
	udivx	%l6,0xab7,%l0		! %l0 = 0000000000000000
!	%l2 = 00000000ff5fb885, Mem[00000000211c0000] = faff37e1
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = b88537e1
!	%l6 = 00000000000000ff, Mem[00000000100c1430] = d8d89f8c
	sth	%l6,[%i3+0x030]		! Mem[00000000100c1430] = 00ff9f8c
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = 221197b8, %l4 = 000000000000701b
	ldsb	[%i4+0x038],%l4		! %l4 = 0000000000000022

p0_label_49:
!	Mem[0000000010001410] = 3187a746, %l2 = 00000000ff5fb885
	ldsba	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000046
!	Mem[0000000010041400] = ff930382, %l2 = 0000000000000046
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 000000000000ff93
!	Mem[0000000010001408] = 000000f9, %l4 = 0000000000000022
	lduba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000f9
!	Mem[0000000010101400] = ff004520, %f14 = 09ac1b34
	lda	[%i4+%g0]0x80,%f14	! %f14 = ff004520
!	Mem[0000000010181408] = ff96f4db43a63ff5, %f14 = ff004520 7b1e9ff7
	ldda	[%i6+%o4]0x80,%f14	! %f14 = ff96f4db 43a63ff5
!	Mem[0000000010141428] = 0000006f, %l2 = 000000000000ff93
	ldsha	[%i5+0x028]%asi,%l2	! %l2 = 0000000000000000
!	%l7 = ffffffffcb0000ff, imm = 000000000000050d, %l3 = 0000000082d856f7
	xor	%l7,0x50d,%l3		! %l3 = ffffffffcb0005f2
!	Mem[00000000100c1410] = ff96f4dbff76594e, %f24 = 82d856f7 82039345
	ldda	[%i3+%o5]0x88,%f24	! %f24 = ff96f4db ff76594e
!	Mem[0000000030101410] = ff3fa643, %l7 = ffffffffcb0000ff
	lduwa	[%i4+%o5]0x81,%l7	! %l7 = 00000000ff3fa643
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = fa776362, %l1 = fffffffffffff5d7
	ldstuba	[%i0+%o4]0x81,%l1	! %l1 = 000000fa000000ff

p0_label_50:
!	%l1 = 00000000000000fa, Mem[0000000030041400] = 82d856f7
	stha	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 00fa56f7
!	%l2 = 00000000, %l3 = cb0005f2, Mem[0000000030081408] = 236382e7 bb786400
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 cb0005f2
!	%l6 = 00000000000000ff, %l2 = 0000000000000000, %l2 = 0000000000000000
	xor	%l6,%l2,%l2		! %l2 = 00000000000000ff
!	%l1 = 00000000000000fa, Mem[00000000300c1410] = 00000046
	stha	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000fa
!	Mem[0000000010001410] = 46a78731, %l3 = ffffffffcb0005f2
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 0000000046a78731
!	%l0 = 00000000, %l1 = 000000fa, Mem[0000000030141400] = 00000000 20d7db4a
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 000000fa
!	%f8  = 0aaf40f1 ff4b0700, %l4 = 00000000000000f9
!	Mem[0000000030081428] = bba05b5d6b54eed4
	add	%i2,0x028,%g1
	stda	%f8,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030081428] = 00a05bfff140af0a
!	%l7 = 00000000ff3fa643, Mem[00000000100c1401] = ff4b0700
	stb	%l7,[%i3+0x001]		! Mem[00000000100c1400] = ff430700
!	%l2 = 00000000000000ff, Mem[0000000010181408] = dbf496ff
	stba	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = dbf496ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff76594e, %l6 = 00000000000000ff
	ldsha	[%i5+%o5]0x80,%l6	! %l6 = ffffffffffffff76

p0_label_51:
!	Mem[0000000030041410] = 00000000, %l0 = 0000000000000000
	lduwa	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = ff430700, %l5 = 0000000000000017
	ldsba	[%i3+0x002]%asi,%l5	! %l5 = 0000000000000007
!	Mem[00000000300c1410] = fa000000ff606077, %f30 = 94f6f2fd ff43e7d5
	ldda	[%i3+%o5]0x81,%f30	! %f30 = fa000000 ff606077
!	Mem[00000000300c1408] = a0f0cd14, %l0 = 0000000000000000
	ldsha	[%i3+%o4]0x89,%l0	! %l0 = ffffffffffffcd14
	membar	#Sync			! Added by membar checker (10)
!	Mem[00000000300c1400] = faff0000 b2519884 14cdf0a0 992982cb
!	Mem[00000000300c1410] = fa000000 ff606077 2e49a05e d795162c
!	Mem[00000000300c1420] = 8027dda3 f8fe5e6a ced2d5d0 4d1df443
!	Mem[00000000300c1430] = f91629a7 aee130a9 7f453f10 f500ddda
	ldda	[%i3]ASI_BLK_AIUS,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030001408] = 626377ff, %l5 = 0000000000000007
	lduwa	[%i0+%o4]0x89,%l5	! %l5 = 00000000626377ff
!	Mem[0000000030141400] = 00000000, %l6 = ffffffffffffff76
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 14cdf0a0, %f22 = d387454c
	lda	[%i3+%o4]0x81,%f22	! %f22 = 14cdf0a0
!	Mem[0000000030041408] = f140af0a2bc15bce, %f28 = c4b02542 1cee0b21
	ldda	[%i1+%o4]0x81,%f28	! %f28 = f140af0a 2bc15bce
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 00000000, %l0 = ffffffffffffcd14
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 00000000000000ff

p0_label_52:
!	%l4 = 00000000000000f9, Mem[0000000030041400] = f756fa00
	stha	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = f75600f9
!	%l7 = 00000000ff3fa643, Mem[00000000100c1400] = 000743ff
	stha	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0007a643
!	%l4 = 000000f9, %l5 = 626377ff, Mem[0000000010041428] = 8caf2dff acc8e15c
	std	%l4,[%i1+0x028]		! Mem[0000000010041428] = 000000f9 626377ff
!	%f16 = fb0d3eff f756d882, %l1 = 00000000000000fa
!	Mem[0000000030081428] = 00a05bfff140af0a
	add	%i2,0x028,%g1
	stda	%f16,[%g1+%l1]ASI_PST32_S ! Mem[0000000030081428] = fb0d3efff140af0a
!	%l0 = 0000000000000000, Mem[0000000020800001] = ffffaff8
	stb	%l0,[%o1+0x001]		! Mem[0000000020800000] = ff00aff8
!	%l6 = 0000000000000000, %l0 = 0000000000000000, %l1 = 00000000000000fa
	udivx	%l6,%l0,%l1		! %l1 = 00000000000000fa
!	%f29 = 2bc15bce, Mem[0000000010181400] = 082a8285
	sta	%f29,[%i6+%g0]0x88	! Mem[0000000010181400] = 2bc15bce
!	Mem[0000000010041408] = ce5bc12b, %l7 = 00000000ff3fa643
	ldstuba	[%i1+%o4]0x80,%l7	! %l7 = 000000ce000000ff
!	%l7 = 00000000000000ce, Mem[0000000030181410] = d8d89f8c
	stba	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = ced89f8c
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff77636267186f7c, %f18 = ffcfafd1 e5ddf087
	ldda	[%i0+%o4]0x81,%f18	! %f18 = ff776362 67186f7c

p0_label_53:
!	%f21 = 01a9ffdb, %f20 = 8c0000cb
	fcmps	%fcc2,%f21,%f20		! %fcc2 = 2
!	Mem[0000000030101408] = ff617e1e, %f17 = f756d882
	lda	[%i4+%o4]0x81,%f17	! %f17 = ff617e1e
!	Mem[0000000010041400] = 82d856f7820393ff, %l3 = 0000000046a78731
	ldxa	[%i1+%g0]0x88,%l3	! %l3 = 82d856f7820393ff
!	%l4 = 00000000000000f9, %l1 = 00000000000000fa, %l7 = 00000000000000ce
	andn	%l4,%l1,%l7		! %l7 = 0000000000000001
!	Mem[0000000030081400] = 7e5b45ff, %l6 = 0000000000000000
	lduha	[%i2+%g0]0x89,%l6	! %l6 = 00000000000045ff
!	%l0 = 0000000000000028, %l4 = 00000000000000f9, %l1  = 00000000000000fa
	mulx	%l0,%l4,%l1		! %l1 = 00000000000026e8
!	Mem[0000000030101400] = cb0000ff, %l2 = 00000000000000ff
	lduha	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001408] = 000000f9, %l1 = 00000000000026e8
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = fffffffffffffff9
!	Mem[0000000030101408] = ff617e1ecb000000, %f24 = ff96f4db ff76594e
	ldda	[%i4+%o4]0x81,%f24	! %f24 = ff617e1e cb000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000001, Mem[00000000201c0001] = 0b211b53
	stb	%l7,[%o0+0x001]		! Mem[00000000201c0000] = 0b011b53

p0_label_54:
!	%l0 = 00000028, %l1 = fffffff9, Mem[0000000030041400] = f75600f9 45930382
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000028 fffffff9
!	%f26 = 7e181316 ff76594e, Mem[0000000010141408] = ffdfa1a8 00000000
	stda	%f26,[%i5+%o4]0x88	! Mem[0000000010141408] = 7e181316 ff76594e
!	Mem[00000000300c1400] = faff0000, %l6 = 00000000000045ff
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 000000fa000000ff
!	%f26 = 7e181316, Mem[0000000030081408] = 00000000
	sta	%f26,[%i2+%o4]0x81	! Mem[0000000030081408] = 7e181316
!	Mem[0000000030181400] = fb0d3eff, %l6 = 00000000000000fa
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000fb0d3eff
!	Mem[000000001018141b] = 86990270, %l2 = 00000000000000ff
	ldstub	[%i6+0x01b],%l2		! %l2 = 00000070000000ff
!	%f18 = ff776362 67186f7c, %l3 = 82d856f7820393ff
!	Mem[0000000030181418] = 7e1813164e5976b4
	add	%i6,0x018,%g1
	stda	%f18,[%g1+%l3]ASI_PST16_S ! Mem[0000000030181418] = ff77636267186f7c
!	%f28 = f140af0a 2bc15bce, %l0 = 0000000000000028
!	Mem[0000000010101438] = 221197b80deeec80
	add	%i4,0x038,%g1
	stda	%f28,[%g1+%l0]ASI_PST16_P ! Mem[0000000010101438] = f14097b80deeec80
!	%l0 = 00000028, %l1 = fffffff9, Mem[0000000010141410] = ff76594e 1613187e
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000028 fffffff9
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff0000cb fb0d3e29, %l4 = 000000f9, %l5 = 626377ff
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 00000000ff0000cb 00000000fb0d3e29

p0_label_55:
!	Mem[0000000010041408] = 2bc15bff, %l2 = 0000000000000070
	ldsba	[%i1+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101410] = ff000000, %l1 = fffffffffffffff9
	lduwa	[%i4+%o5]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[00000000100c1408] = ff43e7d5, %l0 = 0000000000000028
	ldsha	[%i3+%o4]0x80,%l0	! %l0 = ffffffffffffff43
!	Mem[00000000100c1408] = ff43e7d5, %l6 = 00000000fb0d3eff
	ldswa	[%i3+%o4]0x80,%l6	! %l6 = ffffffffff43e7d5
!	Mem[0000000030101408] = ff617e1e, %f22 = 14cdf0a0
	lda	[%i4+%o4]0x81,%f22	! %f22 = ff617e1e
!	Mem[0000000030041400] = 00000028, %l7 = 0000000000000001
	ldswa	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000028
!	Mem[0000000030041400] = fffffff900000028, %f8  = 8027dda3 f8fe5e6a
	ldda	[%i1+%g0]0x89,%f8 	! %f8  = fffffff9 00000028
!	Mem[0000000030101410] = 43a63fff, %l0 = ffffffffffffff43
	lduba	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041400] = ff930382, %l0 = 00000000000000ff
	lduwa	[%i1+%g0]0x80,%l0	! %l0 = 00000000ff930382
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 204500ff, %l7 = 0000000000000028
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 00000000204500ff

p0_label_56:
!	%l3 = 82d856f7820393ff, Mem[0000000010101408] = f756d88200000000
	stxa	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 82d856f7820393ff
!	%l2 = ffffffffffffffff, Mem[0000000021800180] = 8223ca9e, %asi = 80
	stha	%l2,[%o3+0x180]%asi	! Mem[0000000021800180] = ffffca9e
!	%l0 = 00000000ff930382, Mem[0000000010041408] = 2bc15bff
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 2bc10382
!	%l1 = 00000000ff000000, Mem[0000000030181400] = fa000000
	stwa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	Mem[00000000201c0000] = 0b011b53, %l2 = ffffffffffffffff
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 0000000b000000ff
!	Mem[000000001000143c] = 98ccc562, %l2 = 000000000000000b
	swap	[%i0+0x03c],%l2		! %l2 = 0000000098ccc562
!	%f27 = ff76594e, Mem[0000000030081400] = ff455b7e
	sta	%f27,[%i2+%g0]0x81	! Mem[0000000030081400] = ff76594e
!	%l6 = ffffffffff43e7d5, Mem[0000000010001400] = f7cdf0a0
	stba	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = d5cdf0a0
!	%f18 = ff776362 67186f7c, Mem[0000000010101410] = ff000000 1cee0b21
	stda	%f18,[%i4+%o5]0x80	! Mem[0000000010101410] = ff776362 67186f7c
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 47ffe56e, %l1 = 00000000ff000000
	lduh	[%o1+0x040],%l1		! %l1 = 00000000000047ff

p0_label_57:
!	Mem[0000000030081408] = 7e181316, %l7 = 00000000204500ff
	lduha	[%i2+%o4]0x81,%l7	! %l7 = 0000000000007e18
!	Mem[00000000100c1410] = 4e5976ff, %f25 = cb000000
	lda	[%i3+%o5]0x80,%f25	! %f25 = 4e5976ff
!	Mem[0000000010081408] = ff000000, %l0 = 00000000ff930382
	ldsh	[%i2+%o4],%l0		! %l0 = ffffffffffffff00
!	Mem[0000000010141424] = 1e3fe782, %f21 = 01a9ffdb
	lda	[%i5+0x024]%asi,%f21	! %f21 = 1e3fe782
!	Mem[0000000010181400] = ce5bc12b, %l5 = 00000000fb0d3e29
	ldub	[%i6+%g0],%l5		! %l5 = 00000000000000ce
!	Mem[0000000030101410] = ff3fa643, %l4 = 00000000ff0000cb
	ldsha	[%i4+%o5]0x81,%l4	! %l4 = ffffffffffffff3f
!	Mem[0000000030081410] = de12236a, %l5 = 00000000000000ce
	ldsha	[%i2+%o5]0x89,%l5	! %l5 = 000000000000236a
!	Mem[0000000030181410] = 7594537a8c9fd8ce, %f26 = 7e181316 ff76594e
	ldda	[%i6+%o5]0x89,%f26	! %f26 = 7594537a 8c9fd8ce
!	Mem[00000000100c141c] = 4e5976b4, %l6 = ffffffffff43e7d5
	ldub	[%i3+0x01c],%l6		! %l6 = 000000000000004e
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = a0f0cdd5, %l0 = ffffffffffffff00
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 00000000a0f0cdd5

p0_label_58:
!	%f13 = aee130a9, Mem[0000000030081408] = 7e181316
	sta	%f13,[%i2+%o4]0x81	! Mem[0000000030081408] = aee130a9
!	Mem[0000000030081410] = de12236a, %l5 = 000000000000236a
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 0000006a000000ff
!	%f10 = ced2d5d0 4d1df443, %l0 = 00000000a0f0cdd5
!	Mem[0000000010001438] = 2c21ee1e0000000b
	add	%i0,0x038,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_P ! Mem[0000000010001438] = ced2eed0001d0043
!	%l4 = ffffffffffffff3f, Mem[0000000030081408] = cb0005f2a930e1ae
	stxa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffffffffff3f
!	Mem[0000000030001410] = 85b85fff, %l2 = 0000000098ccc562
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030041410] = 00000000, %l7 = 0000000000007e18
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%f16 = fb0d3eff ff617e1e ff776362 67186f7c
!	%f20 = 8c0000cb 1e3fe782 ff617e1e 674b9e0c
!	%f24 = ff617e1e 4e5976ff 7594537a 8c9fd8ce
!	%f28 = f140af0a 2bc15bce fa000000 ff606077
	stda	%f16,[%i3]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	%l4 = ffffffffffffff3f, Mem[0000000030001410] = f756d88285b85fff
	stxa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffffffffffff3f
!	Mem[0000000030081410] = de1223ff, %l1 = 00000000000047ff
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = f900000000000049, %l5 = 000000000000006a
	ldxa	[%i0+0x008]%asi,%l5	! %l5 = f900000000000049

p0_label_59:
	membar	#Sync			! Added by membar checker (11)
!	Mem[00000000100c1410] = ff76594e, %l4 = ffffffffffffff3f
	ldsha	[%i3+%o5]0x88,%l4	! %l4 = 000000000000594e
!	Mem[00000000300c1400] = fb0d3eff, %l2 = 00000000000000ff
	lduwa	[%i3+%g0]0x81,%l2	! %l2 = 00000000fb0d3eff
!	Mem[0000000020800040] = 47ffe56e, %l3 = 82d856f7820393ff
	lduh	[%o1+0x040],%l3		! %l3 = 00000000000047ff
!	Mem[0000000030081410] = de1223ff, %l5 = f900000000000049
	ldsha	[%i2+%o5]0x89,%l5	! %l5 = 00000000000023ff
!	Mem[00000000100c1410] = 4e5976ff, %l6 = 000000000000004e
	lduwa	[%i3+%o5]0x80,%l6	! %l6 = 000000004e5976ff
!	Mem[0000000030141410] = faffffff, %l0 = 00000000a0f0cdd5
	ldswa	[%i5+%o5]0x81,%l0	! %l0 = fffffffffaffffff
!	%f6  = 2e49a05e, %f17 = ff617e1e
	fcmpes	%fcc1,%f6 ,%f17		! %fcc1 = 2
!	Mem[0000000010041410] = a40e5c10, %l2 = 00000000fb0d3eff
	ldswa	[%i1+%o5]0x88,%l2	! %l2 = ffffffffa40e5c10
!	Mem[00000000100c1400] = 000000000007a643, %l6 = 000000004e5976ff
	ldxa	[%i3+%g0]0x88,%l6	! %l6 = 000000000007a643
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffa40e5c10, Mem[0000000010001408] = 49000000000000f9
	stxa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffffa40e5c10

p0_label_60:
!	%f13 = aee130a9, %f4  = fa000000
	fsqrts	%f13,%f4 		! %f4  = 7fffffff
!	Mem[0000000030081410] = de1223ff, %l6 = 000000000007a643
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 00000000de1223ff
!	%l3 = 00000000000047ff, Mem[00000000201c0000] = ff011b53
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 47ff1b53
!	%f2  = 14cdf0a0 992982cb, %l2 = ffffffffa40e5c10
!	Mem[0000000010101428] = 7238dcff204500ff
	add	%i4,0x028,%g1
	stda	%f2,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010101428] = 7238dcffa04500ff
!	Mem[0000000010041410] = a40e5c10, %l1 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 00000000a40e5c10
!	Mem[0000000010141408] = 4e5976ff, %l1 = 00000000a40e5c10
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 000000004e5976ff
!	%l1 = 000000004e5976ff, %l6 = 00000000de1223ff, %l6 = 00000000de1223ff
	xor	%l1,%l6,%l6		! %l6 = 00000000904b5500
!	%l6 = 00000000904b5500, Mem[0000000030181410] = 8c9fd8ce
	stwa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 904b5500
!	Mem[0000000010081408] = 000000ff, %l2 = ffffffffa40e5c10
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141404] = 0671ddb9, %f30 = fa000000
	lda	[%i5+0x004]%asi,%f30	! %f30 = 0671ddb9

p0_label_61:
!	Mem[0000000010081400] = 85000000000000ff, %l5 = 00000000000023ff
	ldxa	[%i2+%g0]0x88,%l5	! %l5 = 85000000000000ff
!	Mem[0000000010101400] = 28000000, %l0 = fffffffffaffffff
	ldsha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000002800
!	Mem[0000000010181400] = ce5bc12bd5e74385, %f10 = ced2d5d0 4d1df443
	ldda	[%i6+%g0]0x80,%f10	! %f10 = ce5bc12b d5e74385
!	Mem[0000000030001408] = ff776362, %l5 = 85000000000000ff
	ldswa	[%i0+%o4]0x81,%l5	! %l5 = ffffffffff776362
!	Mem[0000000030101410] = 43a63fff, %f28 = f140af0a
	lda	[%i4+%o5]0x89,%f28	! %f28 = 43a63fff
!	Mem[0000000030101400] = 293e0dfbcb0000ff, %l7 = 0000000000000000
	ldxa	[%i4+%g0]0x89,%l7	! %l7 = 293e0dfbcb0000ff
!	Mem[0000000010081410] = 2ad8b0ca850000ff, %f22 = ff617e1e 674b9e0c
	ldda	[%i2+%o5]0x88,%f22	! %f22 = 2ad8b0ca 850000ff
!	Mem[0000000010141400] = b9dd7106fb0d3eff, %l2 = 00000000000000ff
	ldxa	[%i5+%g0]0x88,%l2	! %l2 = b9dd7106fb0d3eff
!	Mem[0000000030141408] = 210bee1c, %l4 = 000000000000594e
	ldswa	[%i5+%o4]0x81,%l4	! %l4 = 00000000210bee1c
!	Starting 10 instruction Store Burst
!	Mem[000000001000141c] = e57e6728, %l5 = ff776362, %l4 = 210bee1c
	add	%i0,0x1c,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 00000000e57e6728

p0_label_62:
!	Mem[0000000030081408] = 3fffffff, %l6 = 00000000904b5500
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 0000003f000000ff
!	Mem[0000000010001410] = f20500cb, %l7 = 293e0dfbcb0000ff
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 000000cb000000ff
!	%l1 = 000000004e5976ff, Mem[0000000010181410] = ffa05fedf56ee344
	stxa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000004e5976ff
!	%l0 = 0000000000002800, %l0 = 0000000000002800, %l3  = 00000000000047ff
	mulx	%l0,%l0,%l3		! %l3 = 0000000006400000
!	Mem[0000000010001400] = 00ffffff, %l1 = 000000004e5976ff
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 0000000000ffffff
!	%f5  = ff606077, Mem[0000000030081400] = ff76594e
	sta	%f5 ,[%i2+%g0]0x81	! Mem[0000000030081400] = ff606077
!	%l0 = 0000000000002800, Mem[0000000010041410] = ff00000000000000
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000002800
!	%l6 = 0000003f, %l7 = 000000cb, Mem[0000000010101410] = 626377ff 7c6f1867
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000003f 000000cb
!	%l1 = 0000000000ffffff, Mem[00000000300c1410] = 8c0000cb
	stba	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff0000cb
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff0005f2 a35aa749, %l0 = 00002800, %l1 = 00ffffff
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 00000000ff0005f2 00000000a35aa749

p0_label_63:
!	Mem[0000000010001408] = 105c0ea4ffffffff, %f24 = ff617e1e 4e5976ff
	ldd	[%i0+%o4],%f24		! %f24 = 105c0ea4 ffffffff
!	Mem[0000000010041408] = 8203c12b, %l3 = 0000000006400000
	lduha	[%i1+%o4]0x80,%l3	! %l3 = 0000000000008203
!	%l7 = 00000000000000cb, %l0 = 00000000ff0005f2, %l6 = 000000000000003f
	sdivx	%l7,%l0,%l6		! %l6 = 0000000000000000
!	%f8  = fffffff9, %f29 = 2bc15bce, %f25 = ffffffff
	fsubs	%f8 ,%f29,%f25		! %f25 = fffffff9
!	Mem[00000000100c1428] = 0349e050ed5fa07b, %f10 = ce5bc12b d5e74385
	ldda	[%i3+0x028]%asi,%f10	! %f10 = 0349e050 ed5fa07b
!	Mem[0000000030001408] = ff776362, %l4 = 00000000e57e6728
	lduba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1418] = 7e181316, %l3 = 0000000000008203
	ldsh	[%i3+0x018],%l3		! %l3 = 0000000000007e18
!	Mem[0000000010081408] = 00074ba0a40e5c10, %f26 = 7594537a 8c9fd8ce
	ldda	[%i2+%o4]0x88,%f26	! %f26 = 00074ba0 a40e5c10
!	%l0 = 00000000ff0005f2, imm = fffffffffffffe01, %l3 = 0000000000007e18
	addc	%l0,-0x1ff,%l3		! %l3 = 00000000ff0003f3
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 2bc15bce, %l3 = 00000000ff0003f3
	ldstuba	[%i6+%g0]0x88,%l3	! %l3 = 000000ce000000ff

p0_label_64:
!	%f10 = 0349e050 ed5fa07b, %l0 = 00000000ff0005f2
!	Mem[0000000030101428] = 7ba05fed20d7d574
	add	%i4,0x028,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030101428] = 7ba05fed50e04903
!	Mem[000000001018143c] = fc6e8d5c, %l2 = b9dd7106fb0d3eff
	swap	[%i6+0x03c],%l2		! %l2 = 00000000fc6e8d5c
!	%l7 = 00000000000000cb, Mem[00000000211c0000] = b88537e1
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 00cb37e1
!	%l2 = 00000000fc6e8d5c, %l3 = 00000000000000ce, %l1 = 00000000a35aa749
	sub	%l2,%l3,%l1		! %l1 = 00000000fc6e8c8e
!	Mem[0000000030181400] = ff000000, %l5 = ffffffffff776362
	swapa	[%i6+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[000000001000141d] = e57e6728, %l1 = 00000000fc6e8c8e
	ldstuba	[%i0+0x01d]%asi,%l1	! %l1 = 0000007e000000ff
!	Mem[000000001014140d] = 1613187e, %l3 = 00000000000000ce
	ldstuba	[%i5+0x00d]%asi,%l3	! %l3 = 00000013000000ff
!	%l5 = 00000000ff000000, Mem[0000000030101410] = ff3fa643
	stha	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000a643
!	Mem[0000000030141410] = fffffffa, %l5 = 00000000ff000000
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 00000000fffffffa
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000085, %f22 = 2ad8b0ca
	lda	[%i2+%o5]0x80,%f22	! %f22 = ff000085

p0_label_65:
!	Mem[0000000010041438] = f79f1e7b, %l1 = 000000000000007e
	ldsha	[%i1+0x038]%asi,%l1	! %l1 = fffffffffffff79f
!	Mem[00000000100c1410] = ff76594e, %l5 = 00000000fffffffa
	ldswa	[%i3+%o5]0x88,%l5	! %l5 = ffffffffff76594e
!	Mem[0000000010101408] = ff930382f756d882, %l2 = 00000000fc6e8d5c
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = ff930382f756d882
!	Mem[0000000030081400] = ff606077, %l3 = 0000000000000013
	ldswa	[%i2+%g0]0x81,%l3	! %l3 = ffffffffff606077
!	Mem[00000000100c1408] = ff43e7d5087082cb, %f2  = 14cdf0a0 992982cb
	ldda	[%i3+%o4]0x80,%f2 	! %f2  = ff43e7d5 087082cb
!	Mem[0000000030041400] = 00000028, %l5 = ffffffffff76594e
	ldsba	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000028
!	Mem[0000000030041400] = fffffff9 00000028, %l2 = f756d882, %l3 = ff606077
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000028 00000000fffffff9
!	Mem[00000000211c0000] = 00cb37e1, %l4 = 00000000000000ff
	ldsh	[%o2+%g0],%l4		! %l4 = 00000000000000cb
!	Mem[0000000030041400] = fffffff9 00000028, %l4 = 000000cb, %l5 = 00000028
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000028 00000000fffffff9
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = ff000000, %l3 = 00000000fffffff9
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ff000000

p0_label_66:
!	%l7 = 00000000000000cb, Mem[0000000020800041] = 47ffe56e, %asi = 80
	stba	%l7,[%o1+0x041]%asi	! Mem[0000000020800040] = 47cbe56e
!	Mem[0000000010181400] = 2bc15bff, %l7 = 00000000000000cb
	ldstuba	[%i6+%g0]0x88,%l7	! %l7 = 000000ff000000ff
!	%l2 = 0000000000000028, Mem[0000000010081400] = f9ffffff
	stwa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000028
!	Mem[0000000030001410] = 3fffffff, %l3 = 00000000ff000000
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 000000003fffffff
!	%l0 = 00000000ff0005f2, imm = fffffffffffffa0e, %l6 = 0000000000000000
	add	%l0,-0x5f2,%l6		! %l6 = 00000000ff000000
!	Mem[00000000100c1400] = 43a60700, %l3 = 000000003fffffff
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 00000043000000ff
!	%l6 = ff000000, %l7 = 000000ff, Mem[0000000010141410] = 00000028 fffffff9
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000000 000000ff
!	%f17 = ff617e1e, Mem[00000000100c1410] = 4e5976ff
	sta	%f17,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff617e1e
!	%f15 = f500ddda, Mem[0000000030181400] = ff776362
	sta	%f15,[%i6+%g0]0x81	! Mem[0000000030181400] = f500ddda
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l7 = 00000000000000ff
	lduw	[%i1+%o5],%l7		! %l7 = 0000000000000000

p0_label_67:
!	Mem[0000000010141408] = a40e5c10 16ff187e, %l4 = 00000028, %l5 = fffffff9
	ldda	[%i5+0x008]%asi,%l4	! %l4 = 00000000a40e5c10 0000000016ff187e
!	Mem[0000000010041400] = ff930382 f756d882, %l0 = ff0005f2, %l1 = fffff79f
	ldd	[%i1+%g0],%l0		! %l0 = 00000000ff930382 00000000f756d882
!	Mem[0000000030041400] = 28000000 f9ffffff, %l0 = ff930382, %l1 = f756d882
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 0000000028000000 00000000f9ffffff
!	Mem[0000000030141408] = 1cee0b21, %l2 = 0000000000000028
	lduha	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000b21
!	Mem[000000001008141c] = 3391135f, %f21 = 1e3fe782
	ld	[%i2+0x01c],%f21	! %f21 = 3391135f
!	Mem[0000000030181400] = dadd00f5, %l7 = 0000000000000000
	ldswa	[%i6+%g0]0x89,%l7	! %l7 = ffffffffdadd00f5
!	Mem[0000000010001410] = ff0005f2, %l1 = 00000000f9ffffff
	ldswa	[%i0+0x010]%asi,%l1	! %l1 = ffffffffff0005f2
!	Mem[0000000010141410] = ff000000 000000ff, %l0 = 28000000, %l1 = ff0005f2
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000ff 00000000ff000000
!	Mem[0000000030081408] = ffffffffffffffff, %f16 = fb0d3eff ff617e1e
	ldda	[%i2+%o4]0x81,%f16	! %f16 = ffffffff ffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000b21, Mem[0000000010101410] = 0000003f
	stba	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000021

p0_label_68:
!	%l1 = 00000000ff000000, Mem[0000000030141408] = 1cee0b21
	stba	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 1cee0b00
!	%l0 = 00000000000000ff, Mem[0000000030141408] = 000bee1c
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ffee1c
!	Mem[0000000010001408] = a40e5c10, %l5 = 0000000016ff187e
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 00000010000000ff
!	Mem[0000000030101410] = 43a60000, %l6 = 00000000ff000000
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l2 = 0000000000000b21, Mem[0000000010081408] = a40e5c10
	stba	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = a40e5c21
!	Mem[00000000100c1408] = ff43e7d5, %l4 = a40e5c10, %l4 = a40e5c10
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 00000000ff43e7d5
!	%l5 = 0000000000000010, Mem[0000000010081431] = 94f6f2fd
	stb	%l5,[%i2+0x031]		! Mem[0000000010081430] = 9410f2fd
!	Mem[0000000010081408] = a40e5c21, %l2 = 0000000000000b21
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 00000000a40e5c21
!	%l3 = 0000000000000043, Mem[00000000100c1400] = ffa60700
	stwa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000043
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000ff, %l5 = 0000000000000010
	lduha	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000ff

p0_label_69:
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010081400] = 28000000 00000085 210b0000 a04b0700
!	Mem[0000000010081410] = ff000085 cab0d82a d1193ab9 3391135f
!	Mem[0000000010081420] = ff94537a ff76594e d3332db5 e7826323
!	Mem[0000000010081430] = 9410f2fd 000000ff d2ab68ff 40ff1e7d
	ldda	[%i2]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010081400
!	Mem[0000000010081410] = ff000085cab0d82a, %f20 = 8c0000cb 3391135f
	ldda	[%i2+0x010]%asi,%f20	! %f20 = ff000085 cab0d82a
!	Mem[00000000100c1410] = ff617e1e, %l4 = 00000000ff43e7d5
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = ffffffffff617e1e
!	Mem[0000000030101400] = cb0000ff, %l7 = ffffffffdadd00f5
	lduha	[%i4+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1418] = 7e181316, %l6 = 0000000000000000
	ldswa	[%i3+0x018]%asi,%l6	! %l6 = 000000007e181316
!	Mem[00000000100c1408] = d5e743ff, %l0 = 00000000000000ff
	lduwa	[%i3+%o4]0x88,%l0	! %l0 = 00000000d5e743ff
!	Mem[0000000010001400] = ff76594e, %f20 = ff000085
	lda	[%i0+%g0]0x88,%f20	! %f20 = ff76594e
!	Mem[0000000010081420] = ff94537a, %l3 = 0000000000000043
	ldsh	[%i2+0x020],%l3		! %l3 = ffffffffffffff94
!	Mem[0000000030101410] = ff96f4db 43a600ff, %l4 = ff617e1e, %l5 = 000000ff
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 0000000043a600ff 00000000ff96f4db
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ff000000, Mem[0000000010041400] = ff930382
	stha	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000382

p0_label_70:
!	Mem[0000000030041400] = 28000000, %l1 = 00000000ff000000
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 00000028000000ff
!	%l0 = 00000000d5e743ff, %l1 = 0000000000000028, %l7 = 00000000000000ff
	or	%l0,%l1,%l7		! %l7 = 00000000d5e743ff
!	Mem[0000000030141400] = ff000000, %l4 = 0000000043a600ff
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	%l7 = 00000000d5e743ff, Mem[0000000030041410] = ff000000
	stba	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000
!	Mem[0000000010101408] = 820393ff, %l3 = ffffffffffffff94
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010081410] = ff000085, %l1 = 0000000000000028
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 00000000ff000085
!	Mem[0000000010041410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[000000001008140c] = a04b0700, %l0 = 00000000d5e743ff, %asi = 80
	swapa	[%i2+0x00c]%asi,%l0	! %l0 = 00000000a04b0700
!	Mem[0000000010141418] = 0000000000000075, %l2 = 00000000a40e5c21, %l1 = 00000000ff000085
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 0000000000000075
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = f53fa643 dbf496ff, %l2 = a40e5c21, %l3 = 00000000
	ldda	[%i6+%o4]0x88,%l2	! %l2 = 00000000dbf496ff 00000000f53fa643

p0_label_71:
!	Mem[0000000030101408] = ff617e1e cb000000, %l6 = 7e181316, %l7 = d5e743ff
	ldda	[%i4+%o4]0x81,%l6	! %l6 = 00000000ff617e1e 00000000cb000000
!	Mem[0000000030181408] = f756d882, %l3 = 00000000f53fa643
	ldswa	[%i6+%o4]0x89,%l3	! %l3 = fffffffff756d882
!	Mem[0000000030081410] = 43a60700 ff000000, %l0 = a04b0700, %l1 = 00000075
	ldda	[%i2+%o5]0x81,%l0	! %l0 = 0000000043a60700 00000000ff000000
!	Mem[0000000010101414] = cb000000, %l5 = 00000000ff96f4db
	ldswa	[%i4+0x014]%asi,%l5	! %l5 = ffffffffcb000000
!	Mem[0000000030141410] = ffffffffff000000, %f20 = ff76594e cab0d82a
	ldda	[%i5+%o5]0x89,%f20	! %f20 = ffffffff ff000000
!	Mem[0000000030181400] = f500ddda, %l3 = fffffffff756d882
	lduwa	[%i6+%g0]0x81,%l3	! %l3 = 00000000f500ddda
!	Mem[000000001000142c] = 291999ff, %f16 = ffffffff
	ld	[%i0+0x02c],%f16	! %f16 = 291999ff
!	Mem[0000000030181400] = dadd00f5, %l2 = 00000000dbf496ff
	lduwa	[%i6+%g0]0x89,%l2	! %l2 = 00000000dadd00f5
!	Mem[0000000010001424] = 56bd72e2, %l3 = 00000000f500ddda
	lduha	[%i0+0x026]%asi,%l3	! %l3 = 00000000000072e2
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff930382, %l2 = 00000000dadd00f5
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 000000ff000000ff

p0_label_72:
!	Mem[0000000030181408] = 82d856f7, %l5 = ffffffffcb000000
	swapa	[%i6+%o4]0x81,%l5	! %l5 = 0000000082d856f7
!	Mem[0000000010181408] = dbf496ff, %l4 = 00000000ff000000
	ldstuba	[%i6+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010081408] = 00000b21, %l6 = 00000000ff617e1e
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 00000021000000ff
!	%f31 = ff606077, Mem[0000000010041408] = 8203c12b
	sta	%f31,[%i1+%o4]0x80	! Mem[0000000010041408] = ff606077
!	Mem[0000000030001408] = ff776362, %l4 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%l1 = 00000000ff000000, %l5 = 0000000082d856f7, %l7 = 00000000cb000000
	sub	%l1,%l5,%l7		! %l7 = 000000007c27a909
!	%l7 = 000000007c27a909, Mem[0000000030141410] = ff000000
	stba	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000009
!	%l0 = 0000000043a60700, Mem[0000000030041410] = 000000ff
	stba	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l3 = 00000000000072e2, Mem[0000000010101410] = 00000021
	stwa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 000072e2
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = d9ff73ed, %l5 = 0000000082d856f7
	ldub	[%o3+0x1c0],%l5		! %l5 = 00000000000000d9

p0_label_73:
!	Mem[00000000100c141c] = 4e5976b4, %l1 = 00000000ff000000
	lduw	[%i3+0x01c],%l1		! %l1 = 000000004e5976b4
!	%l0 = 0000000043a60700, imm = fffffffffffffdb6, %l2 = 00000000000000ff
	sub	%l0,-0x24a,%l2		! %l2 = 0000000043a6094a
!	Mem[0000000030081400] = ff606077, %l0 = 0000000043a60700
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff606077
!	Mem[0000000010001410] = ff0005f2, %l4 = 00000000000000ff
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = ffffffffff0005f2
!	Mem[0000000010081400] = 00000028, %f17 = ffffffff
	lda	[%i2+%g0]0x88,%f17	! %f17 = 00000028
!	%f15 = ff68abd2, %f2  = 00074ba0, %f25 = fffffff9
	fdivs	%f15,%f2 ,%f25		! %f25 = ff800000
!	Mem[00000000211c0000] = 00cb37e1, %l6 = 0000000000000021
	ldsh	[%o2+%g0],%l6		! %l6 = 00000000000000cb
!	Mem[0000000030001400] = ff76594e, %f1  = 00000028
	lda	[%i0+%g0]0x89,%f1 	! %f1 = ff76594e
!	Mem[0000000030141400] = ff00a643, %l7 = 000000007c27a909
	lduwa	[%i5+%g0]0x89,%l7	! %l7 = 00000000ff00a643
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = a40e5cff, %l7 = 00000000ff00a643
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 00000000a40e5cff

p0_label_74:
!	Mem[00000000218001c1] = d9ff73ed, %l7 = 00000000a40e5cff
	ldstub	[%o3+0x1c1],%l7		! %l7 = 000000ff000000ff
!	Mem[0000000010101408] = 820393ff, %l3 = 00000000000072e2
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 00000000820393ff
!	Mem[0000000030101400] = cb0000ff, %l3 = 00000000820393ff
	swapa	[%i4+%g0]0x89,%l3	! %l3 = 00000000cb0000ff
!	Mem[0000000010041400] = 00000382, %l2 = 0000000043a6094a, %asi = 80
	swapa	[%i1+0x000]%asi,%l2	! %l2 = 0000000000000382
!	Mem[0000000010081408] = 00000bff, %l3 = 00000000cb0000ff
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010001410] = ff0005f2
	stw	%l7,[%i0+%o5]		! Mem[0000000010001410] = 000000ff
!	Mem[0000000020800040] = 47cbe56e, %l6 = 00000000000000cb
	ldstuba	[%o1+0x040]%asi,%l6	! %l6 = 00000047000000ff
!	%l3 = 00000000000000ff, Mem[0000000030181410] = 00554b90
	stwa	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff
!	%f15 = ff68abd2, Mem[0000000010001420] = a3224195
	sta	%f15,[%i0+0x020]%asi	! Mem[0000000010001420] = ff68abd2
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = cb000000, %l2 = 0000000000000382
	ldswa	[%i6+%o4]0x81,%l2	! %l2 = ffffffffcb000000

p0_label_75:
!	Mem[0000000021800000] = 24338e4e, %l5 = 00000000000000d9
	lduba	[%o3+0x000]%asi,%l5	! %l5 = 0000000000000024
!	Mem[0000000030181410] = 000000ff7a539475, %f30 = 0671ddb9 ff606077
	ldda	[%i6+%o5]0x81,%f30	! %f30 = 000000ff 7a539475
!	%l6 = 0000000000000047, %l7 = 00000000000000ff, %l1 = 000000004e5976b4
	xnor	%l6,%l7,%l1		! %l1 = ffffffffffffff47
!	Mem[00000000100c1418] = 7e181316, %l7 = 00000000000000ff
	ldsba	[%i3+0x01b]%asi,%l7	! %l7 = 0000000000000016
!	Mem[000000001014143c] = 94f6f2fd, %l6 = 0000000000000047
	lduwa	[%i5+0x03c]%asi,%l6	! %l6 = 0000000094f6f2fd
!	Mem[0000000030101400] = 820393ff, %l2 = ffffffffcb000000
	lduba	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l1 = ffffffffffffff47
	ldsba	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = ff000000, %l2 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 626377ff, %l6 = 0000000094f6f2fd
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 00000000000077ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010001400] = 4e5976ff 992982cb
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 000000ff

p0_label_76:
!	Mem[0000000010181410] = 00000000, %l6 = 00000000000077ff
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800040] = ffcbe56e, %l1 = 0000000000000000
	ldstub	[%o1+0x040],%l1		! %l1 = 000000ff000000ff
!	Mem[0000000030141408] = 1ceeff00, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 000000001ceeff00
!	Mem[0000000021800141] = b97adf62, %l7 = 0000000000000016
	ldstuba	[%o3+0x141]%asi,%l7	! %l7 = 0000007a000000ff
!	Mem[0000000030001408] = ff776362, %l2 = 000000001ceeff00
	ldstuba	[%i0+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	%f20 = ffffffff ff000000, Mem[0000000030141408] = 00000000 8543e7d5
	stda	%f20,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff ff000000
!	%l4 = ffffffffff0005f2, Mem[000000001000142e] = 291999ff
	sth	%l4,[%i0+0x02e]		! Mem[000000001000142c] = 291905f2
!	%f0  = 85000000 ff76594e, %l4 = ffffffffff0005f2
!	Mem[0000000010001418] = 14d1eb57e5ff6728
	add	%i0,0x018,%g1
	stda	%f0,[%g1+%l4]ASI_PST32_P ! Mem[0000000010001418] = 85000000e5ff6728
!	%f6  = 5f139133 b93a19d1, Mem[0000000030181408] = 000000cb 45930382
	stda	%f6 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 5f139133 b93a19d1
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = a40e5c10, %l2 = 00000000000000ff
	ldsha	[%i5+%o4]0x80,%l2	! %l2 = ffffffffffffa40e

p0_label_77:
!	Mem[0000000030181400] = dadd00f5, %f24 = 105c0ea4
	lda	[%i6+%g0]0x89,%f24	! %f24 = dadd00f5
!	Mem[00000000100c1418] = 7e1813164e5976b4, %f10 = 236382e7 b52d33d3
	ldd	[%i3+0x018],%f10	! %f10 = 7e181316 4e5976b4
!	Mem[0000000010141400] = ff3e0dfb 0671ddb9 a40e5c10 16ff187e
!	Mem[0000000010141410] = ff000000 000000ff 00000000 00000075
!	Mem[0000000010141420] = 3ccf9e5c 1e3fe782 0000006f 8c9fd8d8
!	Mem[0000000010141430] = 1f21457c 9fd8fddb 00000000 94f6f2fd
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[00000000300c1400] = ff3e0dfb, %l5 = 0000000000000024
	lduwa	[%i3+%g0]0x89,%l5	! %l5 = 00000000ff3e0dfb
!	Mem[0000000030041400] = 000000ff, %l7 = 000000000000007a
	ldsba	[%i1+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081400] = ff606077e5f4aea1, %f6  = 5f139133 b93a19d1
	ldda	[%i2+%g0]0x81,%f6 	! %f6  = ff606077 e5f4aea1
!	Mem[0000000030041410] = 00000000, %l4 = ffffffffff0005f2
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = f140af0a, %l1 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = fffffffffffffff1
!	Mem[0000000030101400] = ff930382, %l5 = 00000000ff3e0dfb
	lduba	[%i4+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000030041400] = 000000ff
	stwa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff

p0_label_78:
!	%f10 = 7e181316 4e5976b4, %l5 = 00000000000000ff
!	Mem[0000000010181408] = ff96f4db43a63ff5
	add	%i6,0x008,%g1
	stda	%f10,[%g1+%l5]ASI_PST16_P ! Mem[0000000010181408] = 7e1813164e5976b4
!	Mem[0000000010141408] = 105c0ea4, %l0 = 00000000ff606077
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 00000000105c0ea4
!	%l3 = 00000000000000ff, Mem[0000000030001408] = 626377ff
	stba	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 626377ff
!	Mem[0000000010101410] = e2720000, %l3 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 000000e2000000ff
!	Mem[00000000300c1400] = fb0d3eff, %l0 = 00000000105c0ea4
	ldstuba	[%i3+%g0]0x81,%l0	! %l0 = 000000fb000000ff
!	%l5 = 00000000000000ff, Mem[00000000100c1408] = ff43e7d5
	stwa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	%f11 = 4e5976b4, Mem[00000000300c1408] = 626377ff
	sta	%f11,[%i3+%o4]0x89	! Mem[00000000300c1408] = 4e5976b4
!	Mem[0000000010101408] = 000072e2, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 000000e2000000ff
!	%l7 = ffffffffffffffff, Mem[00000000201c0000] = 47ff1b53
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = ffff1b53
!	Starting 10 instruction Load Burst
!	Mem[0000000010141424] = 1e3fe782, %l6 = 00000000000000e2
	ldsh	[%i5+0x026],%l6		! %l6 = ffffffffffffe782

p0_label_79:
!	Mem[0000000030081410] = 0007a643, %l7 = ffffffffffffffff
	ldsha	[%i2+%o5]0x89,%l7	! %l7 = ffffffffffffa643
!	Mem[0000000010001410] = 000000ff a35aa749, %l2 = ffffa40e, %l3 = 000000e2
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 00000000000000ff 00000000a35aa749
!	Mem[0000000030001410] = ff000000ffffffff, %l5 = 00000000000000ff
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = ff000000ffffffff
!	Mem[00000000100c1410] = ff617e1e, %l4 = 0000000000000000
	ldswa	[%i3+0x010]%asi,%l4	! %l4 = ffffffffff617e1e
!	Mem[00000000100c1410] = 1e7e61ff, %l4 = ffffffffff617e1e
	lduwa	[%i3+%o5]0x88,%l4	! %l4 = 000000001e7e61ff
!	Mem[0000000010141410] = ff000000, %l5 = ff000000ffffffff
	ldswa	[%i5+%o5]0x80,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010101438] = f14097b80deeec80, %f0  = 85000000 ff76594e
	ldda	[%i4+0x038]%asi,%f0 	! %f0  = f14097b8 0deeec80
!	Mem[0000000030141408] = ff000000, %l6 = ffffffffffffe782
	lduba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 820393ff, %l2 = 00000000000000ff
	ldsba	[%i4+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 776060ff, %l1 = fffffffffffffff1
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 00000000776060ff

p0_label_80:
	membar	#Sync			! Added by membar checker (13)
!	%l2 = ffffffff, %l3 = a35aa749, Mem[0000000010141420] = 3ccf9e5c 1e3fe782
	stda	%l2,[%i5+0x020]%asi	! Mem[0000000010141420] = ffffffff a35aa749
!	%l0 = 00000000000000fb, imm = 00000000000000de, %l2 = ffffffffffffffff
	xnor	%l0,0x0de,%l2		! %l2 = ffffffffffffffda
!	%f0  = f14097b8 0deeec80 00074ba0 00000b21
!	%f4  = 2ad8b0ca 850000ff ff606077 e5f4aea1
!	%f8  = 4e5976ff 7a5394ff 7e181316 4e5976b4
!	%f12 = ff000000 fdf21094 7d1eff40 ff68abd2
	stda	%f0,[%i4]ASI_COMMIT_P	! Block Store to 0000000010101400
!	%l0 = 00000000000000fb, Mem[00000000211c0000] = 00cb37e1, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00fb37e1
!	%l6 = 00000000, %l7 = ffffa643, Mem[0000000030001410] = 000000ff ffffffff
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 ffffa643
!	Mem[0000000010141408] = 776060ff 16ff187e, %l4 = 1e7e61ff, %l5 = ff000000
	ldda	[%i5+0x008]%asi,%l4	! %l4 = 00000000776060ff 0000000016ff187e
!	Mem[0000000030101408] = ff617e1e, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000100c1434] = 000000f9, %l4 = 00000000776060ff
	swap	[%i3+0x034],%l4		! %l4 = 00000000000000f9
!	%l0 = 00000000000000fb, Mem[0000000010141410] = ff000000
	stha	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00fb0000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00fb37e1, %l1 = 00000000776060ff
	ldsh	[%o2+%g0],%l1		! %l1 = 00000000000000fb

p0_label_81:
!	Mem[0000000010181400] = ff5bc12bd5e74385, %f28 = 1f21457c 9fd8fddb
	ldda	[%i6+%g0]0x80,%f28	! %f28 = ff5bc12b d5e74385
!	Mem[0000000030081408] = ffffffff, %l2 = ffffffffffffffda
	ldswa	[%i2+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181408] = 7e181316, %l7 = ffffffffffffa643
	ldswa	[%i6+%o4]0x80,%l7	! %l7 = 000000007e181316
!	Mem[0000000010041410] = 000000ff00002800, %f28 = ff5bc12b d5e74385
	ldda	[%i1+%o5]0x80,%f28	! %f28 = 000000ff 00002800
!	Mem[0000000030041410] = 00000000, %l3 = 00000000a35aa749
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = ff617e1ecb000000, %l1 = 00000000000000fb
	ldxa	[%i4+%o4]0x81,%l1	! %l1 = ff617e1ecb000000
!	Mem[00000000201c0000] = ffff1b53, %l2 = ffffffffffffffff
	lduh	[%o0+%g0],%l2		! %l2 = 000000000000ffff
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010101418] = ff606077e5f4aea1, %f22 = 00000000 00000075
	ldda	[%i4+0x018]%asi,%f22	! %f22 = ff606077 e5f4aea1
!	Mem[0000000010181400] = ff5bc12b, %l4 = 00000000000000f9
	lduba	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000ffff, Mem[0000000010041410] = 00280000ff000000
	stxa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000000000ffff

p0_label_82:
!	%f5  = 850000ff, Mem[0000000030081410] = 0007a643
	sta	%f5 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 850000ff
!	Mem[0000000010041432] = 347f648c, %l6 = 00000000000000ff
	ldstuba	[%i1+0x032]%asi,%l6	! %l6 = 00000064000000ff
!	%f26 = 0000006f 8c9fd8d8, %l5 = 0000000016ff187e
!	Mem[00000000300c1438] = fa000000ff606077
	add	%i3,0x038,%g1
	stda	%f26,[%g1+%l5]ASI_PST8_SL ! Mem[00000000300c1438] = fad89f8c6f000077
!	Mem[00000000100c1420] = 69dac282, %l7 = 000000007e181316
	ldstub	[%i3+0x020],%l7		! %l7 = 00000069000000ff
!	%l0 = 000000fb, %l1 = cb000000, Mem[00000000100c1410] = ff617e1e dbf496ff
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000fb cb000000
!	Mem[0000000010081400] = 00000028, %l3 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 00000028000000ff
!	%l1 = ff617e1ecb000000, Mem[0000000030001400] = ff76594e
	stha	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = ff760000
!	%f22 = ff606077 e5f4aea1, Mem[0000000010081420] = ff94537a ff76594e
	std	%f22,[%i2+0x020]	! Mem[0000000010081420] = ff606077 e5f4aea1
!	%f20 = ff000000 000000ff, %l5 = 0000000016ff187e
!	Mem[00000000300c1408] = b476594e67186f7c
	add	%i3,0x008,%g1
	stda	%f20,[%g1+%l5]ASI_PST32_S ! Mem[00000000300c1408] = ff00000067186f7c
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l2 = 000000000000ffff
	lduba	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_83:
!	Mem[00000000100c1418] = 7e1813164e5976b4, %l0 = 00000000000000fb
	ldx	[%i3+0x018],%l0		! %l0 = 7e1813164e5976b4
!	Mem[0000000010081410] = 28000000, %l3 = 0000000000000028
	ldsha	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141420] = ffffffffa35aa749, %f22 = ff606077 e5f4aea1
	ldda	[%i5+0x020]%asi,%f22	! %f22 = ffffffff a35aa749
!	Mem[0000000010001400] = 00000000, %f29 = 00002800
	lda	[%i0+%g0]0x88,%f29	! %f29 = 00000000
!	%l0 = 7e1813164e5976b4, immed = fffff921, %y  = 00000000
	udiv	%l0,-0x6df,%l4		! %l4 = 0000000000000000
	mov	%l0,%y			! %y = 4e5976b4
!	Mem[0000000010081408] = ff43e7d500000bff, %l1 = ff617e1ecb000000
	ldxa	[%i2+%o4]0x88,%l1	! %l1 = ff43e7d500000bff
!	Mem[0000000010001400] = 00000000, %f0  = f14097b8
	lda	[%i0+%g0]0x80,%f0 	! %f0 = 00000000
!	Mem[00000000100c1408] = cb827008ff000000, %l1 = ff43e7d500000bff
	ldxa	[%i3+%o4]0x88,%l1	! %l1 = cb827008ff000000
!	Mem[00000000300c1410] = 82e73f1ecb0000ff, %f18 = a40e5c10 16ff187e
	ldda	[%i3+%o5]0x89,%f18	! %f18 = 82e73f1e cb0000ff
!	Starting 10 instruction Store Burst
!	%f22 = ffffffff a35aa749, Mem[0000000030141410] = 090000ff ffffffff
	stda	%f22,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff a35aa749

p0_label_84:
!	%l2 = 0000000000000000, Mem[0000000030181408] = d1193ab9
	stwa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%f14 = 7d1eff40 ff68abd2, Mem[0000000010001410] = 000000ff a35aa749
	stda	%f14,[%i0+%o5]0x80	! Mem[0000000010001410] = 7d1eff40 ff68abd2
!	%f4  = 2ad8b0ca, Mem[0000000030081410] = ff000085
	sta	%f4 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 2ad8b0ca
!	Mem[0000000030181408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%f22 = ffffffff, Mem[0000000010081410] = 28000000
	sta	%f22,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffff
!	Mem[0000000010081400] = ff000000, %l5 = 0000000016ff187e
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000010101420] = 4e5976ff
	stw	%l3,[%i4+0x020]		! Mem[0000000010101420] = 00000000
!	Mem[0000000010041410] = 0000ffff, %l5 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030081400] = ff606077, %l1 = cb827008ff000000
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 00000000ff606077
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = cb827008ff000000, %l3 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l3	! %l3 = cb827008ff000000

p0_label_85:
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 7e1813164e5976b4
	setx	0x32c0d4f813ec8ed8,%g7,%l0 ! %l0 = 32c0d4f813ec8ed8
!	%l1 = 00000000ff606077
	setx	0x14ead2b007d9989d,%g7,%l1 ! %l1 = 14ead2b007d9989d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 32c0d4f813ec8ed8
	setx	0x2f2ba8bfb4de2c8f,%g7,%l0 ! %l0 = 2f2ba8bfb4de2c8f
!	%l1 = 14ead2b007d9989d
	setx	0x991f892fa0aa426e,%g7,%l1 ! %l1 = 991f892fa0aa426e
!	Mem[0000000030041410] = 000000006a2312de, %l5 = 00000000000000ff
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = 000000006a2312de
!	Mem[0000000010101400] = f14097b80deeec80, %f28 = 000000ff 00000000
	ldda	[%i4+0x000]%asi,%f28	! %f28 = f14097b8 0deeec80
!	Mem[0000000010101428] = 7e1813164e5976b4, %f24 = 3ccf9e5c 1e3fe782
	ldd	[%i4+0x028],%f24	! %f24 = 7e181316 4e5976b4
!	Mem[0000000010141400] = fb0d3eff, %f31 = 94f6f2fd
	lda	[%i5+%g0]0x88,%f31	! %f31 = fb0d3eff
!	Mem[0000000030181400] = f500ddda, %l2 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l2	! %l2 = fffffffffffff500
!	Mem[000000001010143c] = ff68abd2, %l5 = 000000006a2312de
	lduw	[%i4+0x03c],%l5		! %l5 = 00000000ff68abd2
!	Mem[000000001008142c] = e7826323, %l2 = fffffffffffff500
	ldswa	[%i2+0x02c]%asi,%l2	! %l2 = ffffffffe7826323
!	Mem[0000000010101404] = 0deeec80, %l0 = 2f2ba8bfb4de2c8f
	ldswa	[%i4+0x004]%asi,%l0	! %l0 = 000000000deeec80
!	Starting 10 instruction Store Burst
!	%f28 = f14097b8 0deeec80, %l4 = 0000000000000000
!	Mem[00000000300c1408] = ff00000067186f7c
	add	%i3,0x008,%g1
	stda	%f28,[%g1+%l4]ASI_PST32_S ! Mem[00000000300c1408] = ff00000067186f7c

p0_label_86:
!	Mem[0000000010101408] = a04b0700, %l0 = 000000000deeec80
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%f24 = 7e181316 4e5976b4, Mem[0000000010041410] = ffff0000 00000000
	stda	%f24,[%i1+%o5]0x80	! Mem[0000000010041410] = 7e181316 4e5976b4
!	%f20 = ff000000 000000ff, Mem[00000000300c1410] = ff0000cb 1e3fe782
	stda	%f20,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff000000 000000ff
!	%l5 = 00000000ff68abd2, %l5 = 00000000ff68abd2, %y  = 4e5976b4
	udiv	%l5,%l5,%l7		! %l7 = 000000004e87e2ae
	mov	%l0,%y			! %y = 00000000
!	%l6 = 0000000000000064, Mem[0000000030001408] = 626377ff
	stwa	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000064
!	%l2 = ffffffffe7826323, Mem[0000000030101400] = ff930382
	stba	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 23930382
!	%l4 = 00000000, %l5 = ff68abd2, Mem[0000000010181400] = 2bc15bff 8543e7d5
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 ff68abd2
!	%l5 = 00000000ff68abd2, Mem[0000000030041408] = 0aaf40f1
	stwa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = ff68abd2
!	%l4 = 0000000000000000, Mem[0000000010001418] = 85000000
	sth	%l4,[%i0+0x018]		! Mem[0000000010001418] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ff760000, %f7  = e5f4aea1
	lda	[%i0+%g0]0x89,%f7 	! %f7 = ff760000

p0_label_87:
!	%f4  = 2ad8b0ca, %f5  = 850000ff, %f31 = fb0d3eff
	fsubs	%f4 ,%f5 ,%f31		! %f31 = 2ad8b0ca
!	Mem[00000000300c1408] = 7c6f1867 000000ff, %l4 = 00000000, %l5 = ff68abd2
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff 000000007c6f1867
!	Mem[0000000010041408] = 435e92b7fffffff1, %l2 = ffffffffe7826323
	ldxa	[%i1+%o4]0x88,%l2	! %l2 = 435e92b7fffffff1
!	Mem[00000000100c1410] = 000000fb, %l7 = 000000004e87e2ae
	lduha	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = b9dd7106fb0d3eff, %l0 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l0	! %l0 = b9dd7106fb0d3eff
!	Mem[000000001000141c] = e5ff6728, %l6 = 0000000000000064
	ldsha	[%i0+0x01e]%asi,%l6	! %l6 = 0000000000006728
!	Mem[0000000030041410] = 000000006a2312de, %f4  = 2ad8b0ca 850000ff
	ldda	[%i1+%o5]0x81,%f4 	! %f4  = 00000000 6a2312de
!	Mem[00000000300c1410] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000300c1400] = ff3e0dff, %f4  = 00000000
	lda	[%i3+%g0]0x89,%f4 	! %f4 = ff3e0dff
!	Starting 10 instruction Store Burst
!	%l2 = 435e92b7fffffff1, Mem[0000000010181408] = 1613187e
	stba	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 161318f1

p0_label_88:
!	%l6 = 0000000000006728, Mem[0000000010141428] = 0000006f, %asi = 80
	stha	%l6,[%i5+0x028]%asi	! Mem[0000000010141428] = 6728006f
!	Mem[00000000211c0000] = 00fb37e1, %l3 = cb827008ff000000
	ldstub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	%l0 = b9dd7106fb0d3eff, Mem[0000000010181400] = 00000000
	stwa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = fb0d3eff
!	%f10 = 7e181316 4e5976b4, %l0 = b9dd7106fb0d3eff
!	Mem[0000000030101428] = 7ba05fed50e04903
	add	%i4,0x028,%g1
	stda	%f10,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030101428] = b476594e1613187e
!	%l3 = 0000000000000000, Mem[00000000300c1410] = ff000000
	stwa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000010101430] = ff000000fdf21094, %asi = 80
	stxa	%l4,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000000000ff
!	Mem[0000000010001424] = 56bd72e2, %l2 = 435e92b7fffffff1
	swap	[%i0+0x024],%l2		! %l2 = 0000000056bd72e2
!	Code Fragment 4
p0_fragment_7:
!	%l0 = b9dd7106fb0d3eff
	setx	0x1fac2ad7afced800,%g7,%l0 ! %l0 = 1fac2ad7afced800
!	%l1 = 991f892fa0aa426e
	setx	0x4a0e809ff82ebd2d,%g7,%l1 ! %l1 = 4a0e809ff82ebd2d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1fac2ad7afced800
	setx	0x779ebbc8792b6c90,%g7,%l0 ! %l0 = 779ebbc8792b6c90
!	%l1 = 4a0e809ff82ebd2d
	setx	0xb7b7d1905db07350,%g7,%l1 ! %l1 = b7b7d1905db07350
!	Mem[0000000010181400] = ff3e0dfb, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l7	! %l7 = 000000fb000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffffffff, %l1 = b7b7d1905db07350
	lduha	[%i2+%o5]0x80,%l1	! %l1 = 000000000000ffff

p0_label_89:
!	Mem[0000000010141408] = 776060ff, %l5 = 000000007c6f1867
	lduha	[%i5+%o4]0x80,%l5	! %l5 = 0000000000007760
!	Mem[0000000010081400] = 000000ff, %l3 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041430] = 347fff8c, %l1 = 000000000000ffff
	lduh	[%i1+0x030],%l1		! %l1 = 000000000000347f
!	Mem[0000000030101400] = 23930382, %f10 = 7e181316
	lda	[%i4+%g0]0x81,%f10	! %f10 = 23930382
!	Mem[00000000300c1410] = 00000000, %l7 = 00000000000000fb
	ldsha	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = ff0b0000 d5e743ff, %l0 = 792b6c90, %l1 = 0000347f
	ldda	[%i2+0x008]%asi,%l0	! %l0 = 00000000ff0b0000 00000000d5e743ff
!	Mem[00000000300c1408] = ff000000, %l0 = 00000000ff0b0000
	ldswa	[%i3+%o4]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010101408] = 210b0000 a04b07ff, %l2 = 56bd72e2, %l3 = 000000ff
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 00000000a04b07ff 00000000210b0000
!	Mem[0000000010181428] = 7cca72a4, %l6 = 0000000000006728
	lduh	[%i6+0x028],%l6		! %l6 = 0000000000007cca
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000010081410] = ffffffff
	stwa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff

p0_label_90:
!	%l4 = 00000000000000ff, Mem[0000000030001408] = 6400000067186f7c
	stxa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000000000ff
!	Mem[0000000030001400] = ff760000, %l4 = 00000000000000ff
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l1 = 00000000d5e743ff, imm = fffffffffffff3e6, %l2 = 00000000a04b07ff
	sub	%l1,-0xc1a,%l2		! %l2 = 00000000d5e75019
!	%f30 = 00000000 2ad8b0ca, Mem[0000000030081408] = ffffffff ffffffff
	stda	%f30,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 2ad8b0ca
!	%l0 = ffffffffff000000, Mem[00000000218000c0] = 354f8436, %asi = 80
	stha	%l0,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00008436
!	%l6 = 0000000000007cca, Mem[0000000030141408] = 000000ff
	stba	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = ca0000ff
!	Mem[00000000201c0001] = ffff1b53, %l7 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010141431] = 1f21457c, %l7 = 00000000000000ff
	ldstuba	[%i5+0x031]%asi,%l7	! %l7 = 00000021000000ff
!	%l4 = 0000000000000000, Mem[0000000010041400] = 43a6094a
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 00a6094a
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000030081400] = ff000000 e5f4aea1 cab0d82a 00000000
!	Mem[0000000030081410] = 2ad8b0ca ff000000 14785cb6 0932356f
!	Mem[0000000030081420] = de9b58ca 30e7b50f fb0d3eff f140af0a
!	Mem[0000000030081430] = d4584a05 a287c415 6e2dcd72 1a9b537f
	ldda	[%i2]ASI_BLK_S,%f0	! Block Load from 0000000030081400

p0_label_91:
!	Mem[0000000030141410] = ffffffffa35aa749, %f30 = 00000000 2ad8b0ca
	ldda	[%i5+%o5]0x81,%f30	! %f30 = ffffffff a35aa749
!	Mem[0000000030001408] = 00000000000000ff, %f16 = ff3e0dfb 0671ddb9
	ldda	[%i0+%o4]0x81,%f16	! %f16 = 00000000 000000ff
!	Mem[00000000100c1410] = 000000cbfb000000, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = 000000cbfb000000
!	Mem[0000000030001400] = ff0076ff, %l5 = 0000000000007760
	ldsba	[%i0+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181408] = f1181316, %l5 = ffffffffffffffff
	ldsha	[%i6+%o4]0x80,%l5	! %l5 = fffffffffffff118
!	Mem[0000000010141414] = 000000ff, %l0 = ffffffffff000000
	lduw	[%i5+0x014],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010141438] = 00000000, %l5 = fffffffffffff118
	ldswa	[%i5+0x038]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001438] = ced2eed0, %l3 = 00000000210b0000
	ldsb	[%i0+0x038],%l3		! %l3 = ffffffffffffffce
!	Mem[00000000100c142c] = ed5fa07b, %f23 = a35aa749
	lda	[%i3+0x02c]%asi,%f23	! %f23 = ed5fa07b
!	Starting 10 instruction Store Burst
!	%l2 = d5e75019, %l3 = ffffffce, Mem[0000000030141410] = ffffffff a35aa749
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = d5e75019 ffffffce

p0_label_92:
!	%f16 = 00000000 000000ff, Mem[0000000030181400] = dadd00f5 a671701b
	stda	%f16,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 000000ff
!	%f16 = 00000000 000000ff 82e73f1e cb0000ff
!	%f20 = ff000000 000000ff ffffffff ed5fa07b
!	%f24 = 7e181316 4e5976b4 0000006f 8c9fd8d8
!	%f28 = f14097b8 0deeec80 ffffffff a35aa749
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	%l4 = 000000cbfb000000, imm = 0000000000000126, %l7 = 0000000000000021
	xor	%l4,0x126,%l7		! %l7 = 000000cbfb000126
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000030081408] = 1e3fe782, %l4 = 000000cbfb000000
	ldstuba	[%i2+%o4]0x89,%l4	! %l4 = 00000082000000ff
!	%l5 = 0000000000000000, Mem[0000000030001400] = 69dac282ff7600ff
	stxa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000030001410] = ffffa64300000000
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000000000ff
!	Mem[0000000030181410] = ff000000, %l2 = 00000000d5e75019
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010141410] = 0000fb00, %l3 = ffffffffffffffce
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f19 = cb0000ff, Mem[0000000010181408] = f1181316
	sta	%f19,[%i6+%o4]0x80	! Mem[0000000010181408] = cb0000ff
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, Mem[0000000030181400] = ff000000
	stha	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000

p0_label_93:
!	Mem[00000000100c143c] = bb4227e5, %l6 = 0000000000007cca
	ldswa	[%i3+0x03c]%asi,%l6	! %l6 = ffffffffbb4227e5
!	Mem[0000000010001400] = 00000000000000ff, %f4  = 2ad8b0ca ff000000
	ldda	[%i0+0x000]%asi,%f4 	! %f4  = 00000000 000000ff
!	Mem[0000000010141408] = 776060ff 16ff187e, %l4 = 00000082, %l5 = 00000000
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 00000000776060ff 0000000016ff187e
!	Mem[0000000030141408] = ff0000ca, %l6 = ffffffffbb4227e5
	lduba	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ca
!	Mem[00000000300c1408] = ff000000, %l4 = 00000000776060ff
	ldsba	[%i3+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181410] = ff000000 4e5976ff, %l2 = ff000000, %l3 = 00000000
	ldd	[%i6+%o5],%l2		! %l2 = 00000000ff000000 000000004e5976ff
!	Mem[0000000030101408] = 000000cb1e7e61ff, %l1 = 00000000d5e743ff
	ldxa	[%i4+%o4]0x89,%l1	! %l1 = 000000cb1e7e61ff
!	Mem[00000000100c1410] = fb000000, %l2 = 00000000ff000000
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l4 = ffffffffffffffff
	lduwa	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 000000cb1e7e61ff, Mem[0000000010181420] = f0a4f62b, %asi = 80
	stwa	%l1,[%i6+0x020]%asi	! Mem[0000000010181420] = 1e7e61ff

p0_label_94:
!	Mem[0000000030081410] = 000000ff, %l1 = 000000cb1e7e61ff
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%f18 = 82e73f1e cb0000ff, %l1 = 00000000000000ff
!	Mem[00000000300c1410] = 00000000000000ff
	add	%i3,0x010,%g1
	stda	%f18,[%g1+%l1]ASI_PST8_SL ! Mem[00000000300c1410] = ff0000cb1e3fe782
!	%l7 = 000000cbfb000126, Mem[0000000030041410] = de12236a00000000
	stxa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000cbfb000126
!	Mem[0000000020800041] = ffcbe56e, %l4 = 0000000000000000
	ldstub	[%o1+0x041],%l4		! %l4 = 000000cb000000ff
!	Mem[0000000020800001] = ff00aff8, %l4 = 00000000000000cb
	ldstuba	[%o1+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181408] = cb0000ff, %l5 = 16ff187e, %l4 = 00000000
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 00000000cb0000ff
!	Mem[00000000211c0000] = fffb37e1, %l1 = 00000000000000ff
	ldstub	[%o2+%g0],%l1		! %l1 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000010041400] = 00a6094af756d882, %asi = 80
	stxa	%l2,[%i1+0x000]%asi	! Mem[0000000010041400] = 0000000000000000
!	Mem[0000000010041410] = 1613187e, %l7 = 000000cbfb000126
	ldstuba	[%i1+%o5]0x88,%l7	! %l7 = 0000007e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %f22 = ffffffff
	lda	[%i0+%o4]0x89,%f22	! %f22 = 00000000

p0_label_95:
!	Mem[00000000100c1408] = ff000000, %f16 = 00000000
	lda	[%i3+%o4]0x88,%f16	! %f16 = ff000000
!	Mem[0000000010101410] = 2ad8b0ca, %l3 = 000000004e5976ff
	ldsba	[%i4+%o5]0x80,%l3	! %l3 = 000000000000002a
!	Mem[0000000010181410] = 000000ff, %l1 = 00000000000000ff
	lduwa	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = ff000000 4e5976ff, %l6 = 000000ca, %l7 = 0000007e
	ldda	[%i6+0x010]%asi,%l6	! %l6 = 00000000ff000000 000000004e5976ff
!	Mem[000000001000141c] = e5ff6728, %l7 = 000000004e5976ff
	ldsw	[%i0+0x01c],%l7		! %l7 = ffffffffe5ff6728
!	Mem[0000000010001410] = 40ff1e7d, %l4 = 00000000cb0000ff
	lduba	[%i0+%o5]0x88,%l4	! %l4 = 000000000000007d
!	%l5 = 0000000016ff187e, imm = fffffffffffffc6f, %l7 = ffffffffe5ff6728
	subc	%l5,-0x391,%l7		! %l7 = 0000000016ff1c0f
!	Mem[0000000010041408] = f1ffffffb7925e43, %l3 = 000000000000002a
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = f1ffffffb7925e43
!	Mem[0000000010141400] = b9dd7106fb0d3eff, %f24 = 7e181316 4e5976b4
	ldda	[%i5+%g0]0x88,%f24	! %f24 = b9dd7106 fb0d3eff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000016ff1c0f, Mem[0000000010141400] = ff3e0dfb0671ddb9
	stx	%l7,[%i5+%g0]		! Mem[0000000010141400] = 0000000016ff1c0f

p0_label_96:
!	%l3 = f1ffffffb7925e43, Mem[0000000010101400] = 80ecee0db89740f1
	stxa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = f1ffffffb7925e43
!	%l6 = ff000000, %l7 = 16ff1c0f, Mem[0000000010141410] = fffb0000 000000ff
	std	%l6,[%i5+%o5]		! Mem[0000000010141410] = ff000000 16ff1c0f
!	Mem[0000000021800100] = bd211701, %l4 = 000000000000007d
	ldstub	[%o3+0x100],%l4		! %l4 = 000000bd000000ff
!	Mem[0000000010101408] = ff074ba0, %l0 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 00000000ff074ba0
!	%f27 = 8c9fd8d8, Mem[0000000030041410] = 260100fb
	sta	%f27,[%i1+%o5]0x81	! Mem[0000000030041410] = 8c9fd8d8
!	Mem[00000000201c0000] = ffff1b53, %l3 = f1ffffffb7925e43
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010001400] = 00000000, %l4 = 00000000000000bd
	swapa	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l5 = 0000000016ff187e, immd = 00000000000002e2, %l0 = 00000000ff074ba0
	udivx	%l5,0x2e2,%l0		! %l0 = 000000000007fa22
!	%l6 = 00000000ff000000, Mem[0000000010001410] = 7d1eff40ff68abd2
	stxa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = cb0000ff, %l7 = 0000000016ff1c0f
	lduwa	[%i3+%o5]0x89,%l7	! %l7 = 00000000cb0000ff

p0_label_97:
!	Mem[0000000010101400] = 435e92b7, %l6 = 00000000ff000000
	ldsba	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000043
!	Mem[00000000300c1408] = ff000000, %l5 = 0000000016ff187e
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001434] = f2690d26, %l1 = 00000000000000ff
	ldsw	[%i0+0x034],%l1		! %l1 = fffffffff2690d26
!	%f31 = a35aa749, %f16 = ff000000
	fitos	%f31,%f16		! %f16 = ceb94ab1
!	Mem[0000000030001410] = ff000000, %l5 = ffffffffffffffff
	lduba	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181400] = ff3e0dff, %l2 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1400] = ff0d3eff, %l3 = 00000000000000ff
	ldswa	[%i3+%g0]0x81,%l3	! %l3 = ffffffffff0d3eff
!	Mem[0000000010141410] = ff000000, %l2 = ffffffffffffffff
	ldsba	[%i5+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1430] = 00ff9f8c, %l5 = 00000000000000ff
	ldsb	[%i3+0x031],%l5		! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = fffffffff2690d26, Mem[0000000010041400] = 00000000
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 26000000

p0_label_98:
!	%l0 = 0007fa22, %l1 = f2690d26, Mem[0000000010041408] = fffffff1 435e92b7
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 0007fa22 f2690d26
!	Mem[0000000030081408] = ffe73f1e, %l6 = 0000000000000043
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 00000000ffe73f1e
!	Mem[0000000030001400] = 00000000, %l2 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081410] = ff617e1e, %l4 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 00000000ff617e1e
!	%f3  = 00000000, Mem[0000000010001410] = 00000000
	sta	%f3 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	Mem[0000000010101428] = 7e1813164e5976b4, %l3 = ffffffffff0d3eff, %l1 = fffffffff2690d26
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = 7e1813164e5976b4
!	Mem[0000000010101410] = 2ad8b0ca, %l4 = 00000000ff617e1e
	swapa	[%i4+%o5]0x80,%l4	! %l4 = 000000002ad8b0ca
!	%l7 = 00000000cb0000ff, Mem[0000000010181424] = e3a003d0
	stb	%l7,[%i6+0x024]		! Mem[0000000010181424] = ffa003d0
!	Mem[0000000010001418] = 00000000, %l4 = 2ad8b0ca, %l5 = ffffffff
	add	%i0,0x18,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101414] = 850000ff, %f31 = a35aa749
	ld	[%i4+0x014],%f31	! %f31 = 850000ff

p0_label_99:
!	Mem[0000000030081408] = 00000043, %l7 = 00000000cb0000ff
	ldswa	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000043
!	Mem[0000000010081400] = ff000000, %l7 = 0000000000000043
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081408] = 43000000, %l1 = 7e1813164e5976b4
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l0 = 000000000007fa22
	lduha	[%i3+%o4]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010041408] = 0007fa22, %l4 = 000000002ad8b0ca
	ldsba	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000022
!	Mem[0000000010101408] = ff000000, %l6 = 00000000ffe73f1e
	lduwa	[%i4+%o4]0x88,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010001400] = bd000000, %l1 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 00000000bd000000
!	Mem[0000000010181408] = cb0000ff, %l5 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l5	! %l5 = 00000000cb0000ff
!	Mem[0000000010101408] = ff000000, %l3 = ffffffffff0d3eff
	lduha	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = ff000000, %l6 = 00000000ff000000
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 00000000ff000000

p0_label_100:
!	%f0  = ff000000, Mem[0000000010001410] = 00000000
	sta	%f0 ,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000
!	Mem[0000000030141400] = 43a600ff, %l6 = 00000000ff000000
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 00000043000000ff
!	Mem[00000000100c1430] = 00ff9f8c, %l5 = 00000000cb0000ff
	ldstub	[%i3+0x030],%l5		! %l5 = 00000000000000ff
!	%l4 = 0000000000000022, Mem[0000000010081410] = 000000ffcab0d82a
	stxa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000022
!	%l4 = 0000000000000022, Mem[0000000010081410] = 0000000000000022
	stxa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000022
!	Mem[0000000030041408] = d2ab68ff, %l1 = 00000000bd000000
	ldstuba	[%i1+%o4]0x81,%l1	! %l1 = 000000d2000000ff
!	Mem[00000000300c1410] = cb0000ff, %l6 = 0000000000000043
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 00000000cb0000ff
!	%f2  = cab0d82a 00000000, Mem[0000000030001410] = ff000000 00000000
	stda	%f2 ,[%i0+%o5]0x81	! Mem[0000000030001410] = cab0d82a 00000000
!	%l7 = 00000000000000ff, Mem[0000000030101400] = 82039323
	stha	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 820300ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000000, %l1 = 00000000000000d2
	lduha	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_101:
!	Mem[0000000030101408] = ff617e1ecb000000, %l3 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l3	! %l3 = ff617e1ecb000000
!	Mem[00000000300c1410] = 00000043, %l5 = 0000000000000000
	lduha	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000043
!	Mem[00000000300c1400] = ff3e0dff, %f24 = b9dd7106
	lda	[%i3+%g0]0x89,%f24	! %f24 = ff3e0dff
!	Mem[0000000010081408] = ff0b0000d5e743ff, %f16 = ceb94ab1 000000ff
	ldda	[%i2+%o4]0x80,%f16	! %f16 = ff0b0000 d5e743ff
!	Mem[0000000010041408] = 0007fa22, %l3 = ff617e1ecb000000
	ldswa	[%i1+%o4]0x88,%l3	! %l3 = 000000000007fa22
!	Mem[0000000030101408] = ff617e1e, %l5 = 0000000000000043
	lduha	[%i4+%o4]0x81,%l5	! %l5 = 000000000000ff61
!	Mem[00000000218001c0] = d9ff73ed, %l4 = 0000000000000022
	ldsba	[%o3+0x1c1]%asi,%l4	! %l4 = ffffffffffffffff
!	%f28 = f14097b8, %f10 = fb0d3eff
	fsqrts	%f28,%f10		! %f10 = 7fffffff
!	Mem[0000000010041408] = 0007fa22, %l2 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000022
!	Starting 10 instruction Store Burst
!	%l6 = 00000000cb0000ff, Mem[00000000300c1410] = 00000043
	stba	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff

p0_label_102:
!	%l2 = 0000000000000022, Mem[0000000010101400] = 435e92b7fffffff1
	stxa	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000000022
!	%l6 = 00000000cb0000ff, Mem[00000000100c1400] = 0000004300000000
	stxa	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000cb0000ff
!	%l2 = 0000000000000022, Mem[0000000010041402] = 26000000, %asi = 80
	stba	%l2,[%i1+0x002]%asi	! Mem[0000000010041400] = 26002200
!	Mem[0000000010001410] = 000000ff, %l2 = 0000000000000022
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f14 = 6e2dcd72, Mem[00000000100c1438] = 1e7e61c6
	sta	%f14,[%i3+0x038]%asi	! Mem[00000000100c1438] = 6e2dcd72
!	Mem[0000000030041408] = ffab68ff, %l3 = 000000000007fa22
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010041408] = 0007fa22, %l0 = 000000000000ff00
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 000000000007fa22
!	%f4  = 00000000, Mem[0000000010101400] = 00000000
	sta	%f4 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Mem[0000000020800001] = ffffaff8, %l3 = 00000000000000ff
	ldstub	[%o1+0x001],%l3		! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l6 = 00000000cb0000ff
	lduwa	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_103:
!	Mem[0000000010101400] = 22000000 00000000, %l4 = ffffffff, %l5 = 0000ff61
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000 0000000022000000
!	Mem[0000000030181400] = 00000000, %l5 = 0000000022000000
	ldsba	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800000] = ffffaff8, %l0 = 000000000007fa22
	ldsh	[%o1+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030001400] = 000000ff, %l2 = 00000000000000ff
	ldsha	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = 85000000000000ff, %l4 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = 85000000000000ff
!	Mem[0000000010141408] = ff606077, %l5 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000077
!	%f15 = 1a9b537f, %f25 = fb0d3eff, %f22 = 00000000
	fdivs	%f15,%f25,%f22		! %f22 = 80000000
!	Mem[0000000030001408] = 00000000, %l6 = 0000000000000000
	ldsha	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010181400] = ff0d3eff d2ab68ff cb0000ff 4e5976b4
!	Mem[0000000010181410] = ff000000 4e5976ff 869902ff e5c28370
!	Mem[0000000010181420] = 1e7e61ff ffa003d0 7cca72a4 8a27d318
!	Mem[0000000010181430] = a671701b 918610af da827479 fb0d3eff
	ldda	[%i6]ASI_BLK_PL,%f16	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	%f8  = de9b58ca 30e7b50f, Mem[0000000010081430] = 9410f2fd 000000ff
	std	%f8 ,[%i2+0x030]	! Mem[0000000010081430] = de9b58ca 30e7b50f

p0_label_104:
!	Mem[0000000010081410] = 00000000, %l5 = 0000000000000077
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%f14 = 6e2dcd72, Mem[0000000010081424] = e5f4aea1
	sta	%f14,[%i2+0x024]%asi	! Mem[0000000010081424] = 6e2dcd72
!	Mem[0000000030141408] = ca0000ff, %l7 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000ca000000ff
!	%l1 = 0000000000000000, Mem[00000000218000c0] = 00008436, %asi = 80
	stha	%l1,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00008436
!	Mem[0000000010001428] = 574e84ce, %l0 = ffffffffffffffff
	ldstub	[%i0+0x028],%l0		! %l0 = 00000057000000ff
!	Mem[0000000021800000] = 24338e4e, %l6 = 0000000000000000
	ldstuba	[%o3+0x000]%asi,%l6	! %l6 = 00000024000000ff
!	%l0 = 0000000000000057, immd = fffffffffffffa0a, %l3 = 00000000000000ff
	sdivx	%l0,-0x5f6,%l3		! %l3 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l6 = 0000000000000024
	swap	[%i5+%g0],%l6		! %l6 = 0000000000000000
!	%l1 = 0000000000000000, Mem[00000000300c1410] = ff000000
	stwa	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffffaff8, %l0 = 0000000000000057
	ldub	[%o1+%g0],%l0		! %l0 = 00000000000000ff

p0_label_105:
!	Mem[0000000010081410] = 000000ff, %l4 = 85000000000000ff
	lduwa	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041400] = ff000000, %l3 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041408] = 00ff0000 260d69f2, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 0000000000ff0000 00000000260d69f2
!	Mem[0000000030081408] = 00000043cb0000ff, %f14 = 6e2dcd72 1a9b537f
	ldda	[%i2+%o4]0x81,%f14	! %f14 = 00000043 cb0000ff
!	Mem[0000000030141410] = d5e75019, %l2 = 0000000000ff0000
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000d5
!	Mem[0000000010141428] = 6728006f, %l1 = 0000000000000000
	ldswa	[%i5+0x028]%asi,%l1	! %l1 = 000000006728006f
!	Mem[0000000010101408] = ff000000, %f5  = 000000ff
	lda	[%i4+%o4]0x88,%f5 	! %f5 = ff000000
!	Mem[00000000211c0000] = fffb37e1, %l4 = 00000000000000ff
	ldub	[%o2+0x001],%l4		! %l4 = 00000000000000fb
!	Mem[00000000201c0000] = ffff1b53, %l3 = 00000000260d69f2
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ff00a643, %l2 = 00000000000000d5
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 00000000ff00a643

p0_label_106:
!	Mem[0000000010101400] = 00000000, %l3 = 000000000000ffff
	swapa	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030041408] = ce5bc12bff68abff
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	Mem[0000000010181408] = cb0000ff, %l6 = 00000000, %l1 = 6728006f
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 00000000cb0000ff
!	Mem[0000000010141404] = 16ff1c0f, %l7 = 00000000000000ca, %asi = 80
	swapa	[%i5+0x004]%asi,%l7	! %l7 = 0000000016ff1c0f
!	%f7  = 0932356f, Mem[000000001008141c] = 3391135f
	sta	%f7 ,[%i2+0x01c]%asi	! Mem[000000001008141c] = 0932356f
!	%l1 = 00000000cb0000ff, Mem[0000000030081400] = ff00000000000000
	stxa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000cb0000ff
!	Mem[0000000010081410] = ff000000, %l2 = 00000000ff00a643
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 16ff1c0f, Mem[0000000030081410] = 00000000 ff000000
	stda	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 16ff1c0f
!	%f10 = 7fffffff f140af0a, %l7 = 0000000016ff1c0f
!	Mem[0000000030001428] = 018cf05f551890a6
	add	%i0,0x028,%g1
	stda	%f10,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030001428] = 0aaf40f1ffffff7f
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 43a600ff, %l1 = 00000000cb0000ff
	lduha	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff

p0_label_107:
!	Mem[0000000010181410] = ff0000004e5976ff, %f10 = 7fffffff f140af0a
	ldda	[%i6+0x010]%asi,%f10	! %f10 = ff000000 4e5976ff
!	Mem[00000000300c1400] = ff0d3eff, %l5 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181408] = ff0000cb, %l7 = 0000000016ff1c0f
	lduwa	[%i6+%o4]0x88,%l7	! %l7 = 00000000ff0000cb
!	%f8  = de9b58ca, %f15 = cb0000ff, %f16 = ff68abd2
	fdivs	%f8 ,%f15,%f16		! %f16 = 531b5795
!	Mem[0000000010001410] = 000000ff00000022, %f8  = de9b58ca 30e7b50f
	ldda	[%i0+%o5]0x88,%f8 	! %f8  = 000000ff 00000022
!	Mem[0000000010101410] = 1e7e61ff, %l5 = ffffffffffffffff
	ldsba	[%i4+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1400] = ff0d3effff617e1e, %l4 = 00000000000000fb
	ldxa	[%i3+%g0]0x81,%l4	! %l4 = ff0d3effff617e1e
!	Mem[0000000010141408] = 7e18ff16ff606077, %l1 = 00000000000000ff
	ldxa	[%i5+%o4]0x88,%l1	! %l1 = 7e18ff16ff606077
!	Mem[00000000100c1400] = 00000000, %f3  = 00000000
	lda	[%i3+%g0]0x88,%f3 	! %f3 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000ff0000cb
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000

p0_label_108:
!	%l3 = 0000000000000000, Mem[00000000300c1400] = ff0d3eff
	stha	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00003eff
!	%l5 = ffffffffffffffff, Mem[0000000010101430] = 00000000, %asi = 80
	stba	%l5,[%i4+0x030]%asi	! Mem[0000000010101430] = ff000000
!	Mem[0000000030041408] = 00000000, %l2 = 00000000000000ff
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = ff000000, %l1 = 7e18ff16ff606077
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000010141410] = 000000ff
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%l2 = 0000000000000000, Mem[0000000030081400] = cb0000ff
	stha	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = cb000000
	membar	#Sync			! Added by membar checker (18)
!	%f2  = cab0d82a, Mem[0000000010181408] = ff0000cb
	sta	%f2 ,[%i6+%o4]0x88	! Mem[0000000010181408] = cab0d82a
!	Mem[00000000300c1400] = 00003eff, %l0 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 0000000000003eff
!	%f4  = 00000000 ff000000, Mem[0000000030041410] = d8d89f8c 000000cb
	stda	%f4 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ff000000, %f22 = 7083c2e5
	lda	[%i0+%g0]0x81,%f22	! %f22 = ff000000

p0_label_109:
!	Mem[00000000300c1400] = 000000ff, %l6 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000003eff
	lduba	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = ffff000000000022, %l4 = ff0d3effff617e1e
	ldxa	[%i4+%g0]0x80,%l4	! %l4 = ffff000000000022
!	Mem[0000000010001400] = 000000bd, %l0 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000bd
!	Mem[0000000030001410] = cab0d82a, %l6 = 0000000000000000
	ldsba	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffffffca
!	Mem[00000000218001c0] = d9ff73ed, %l0 = 00000000000000bd
	ldsh	[%o3+0x1c0],%l0		! %l0 = ffffffffffffd9ff
!	Mem[0000000010181410] = ff000000 4e5976ff, %l4 = 00000022, %l5 = ffffffff
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 00000000ff000000 000000004e5976ff
!	Mem[0000000010181410] = 000000ff, %l6 = ffffffffffffffca
	ldsba	[%i6+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030041400] = ff000000f9ffffff, %l4 = 00000000ff000000
	ldxa	[%i1+%g0]0x81,%l4	! %l4 = ff000000f9ffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ffff1b53, %l6 = ffffffffffffffff
	ldstub	[%o0+%g0],%l6		! %l6 = 000000ff000000ff

p0_label_110:
!	Mem[0000000010001400] = bd000000, %l5 = 000000004e5976ff
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 000000bd000000ff
!	%f26 = 18d3278a a472ca7c, %l4 = ff000000f9ffffff
!	Mem[0000000030101428] = b476594e1613187e
	add	%i4,0x028,%g1
	stda	%f26,[%g1+%l4]ASI_PST8_S ! Mem[0000000030101428] = 18d3278aa472ca7c
!	Mem[000000001018141d] = e5c28370, %l7 = 0000000000000000
	ldstub	[%i6+0x01d],%l7		! %l7 = 000000c2000000ff
!	Mem[000000001000141c] = e5ff6728, %l1 = 000000ff, %l7 = 000000c2
	add	%i0,0x1c,%g1
	casa	[%g1]0x80,%l1,%l7	! %l7 = 00000000e5ff6728
!	Mem[0000000030141408] = ff0000ff, %l4 = ff000000f9ffffff
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%l1 = 00000000000000ff, %l0 = ffffffffffffd9ff, %l2 = 0000000000000000
	udivx	%l1,%l0,%l2		! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l7 = 00000000e5ff6728, immd = ffffffffffffff1f, %l0  = ffffffffffffd9ff
	mulx	%l7,-0x0e1,%l0		! %l0 = ffffff35da8655d8
!	%l7 = 00000000e5ff6728, Mem[0000000010181400] = ff3e0dff
	stwa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = e5ff6728
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l0 = ffffff35da8655d8
	ldsba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_111:
!	Mem[0000000010181410] = ff000000, %l3 = 0000000000000000
	ldsha	[%i6+%o5]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000020800000] = ffffaff8, %l5 = 00000000000000bd
	ldsha	[%o1+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101400] = ffff0000, %f21 = 000000ff
	lda	[%i4+%g0]0x80,%f21	! %f21 = ffff0000
!	Mem[00000000100c1410] = 000000fb, %l6 = 00000000000000ff
	ldsb	[%i3+0x011],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %l3 = ffffffffffffff00
	lduba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l5 = ffffffffffffffff
	ldswa	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = 0000ffff, %l4 = 00000000000000ff
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030181400] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 776060ff, %f2  = cab0d82a
	lda	[%i5+%o4]0x80,%f2 	! %f2 = 776060ff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030081400] = cb000000
	stba	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = cb000000

p0_label_112:
!	%f12 = d4584a05 a287c415, Mem[0000000030001400] = 000000ff 00000000
	stda	%f12,[%i0+%g0]0x89	! Mem[0000000030001400] = d4584a05 a287c415
!	Mem[0000000030101400] = ff000382, %l7 = 00000000e5ff6728
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000100c1413] = 000000fb, %l1 = 0000000000000000
	ldstub	[%i3+0x013],%l1		! %l1 = 000000fb000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141410] = 00000000
	stba	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000000
!	Mem[0000000030181410] = d5e75019, %l0 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 00000000d5e75019
!	Mem[0000000030081410] = 00000000, %l1 = 00000000000000fb
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041400] = 000000ff, %l4 = 000000000000ffff
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000010141400] = 24000000
	stwa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	Code Fragment 4
p0_fragment_8:
!	%l0 = 00000000d5e75019
	setx	0xfc6123dfd1158a26,%g7,%l0 ! %l0 = fc6123dfd1158a26
!	%l1 = 0000000000000000
	setx	0x29109b0822bc760f,%g7,%l1 ! %l1 = 29109b0822bc760f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fc6123dfd1158a26
	setx	0xeb3629a06b3f99ab,%g7,%l0 ! %l0 = eb3629a06b3f99ab
!	%l1 = 29109b0822bc760f
	setx	0xe1c595f8144d1c05,%g7,%l1 ! %l1 = e1c595f8144d1c05
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 000000ff, %l1 = e1c595f8144d1c05
	lduwa	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff

p0_label_113:
!	Mem[0000000010181430] = a671701b, %l4 = 00000000000000ff
	lduba	[%i6+0x030]%asi,%l4	! %l4 = 00000000000000a6
!	Mem[0000000010081400] = ff000000, %l4 = 00000000000000a6
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010101418] = ff606077e5f4aea1, %l7 = 00000000000000ff
	ldxa	[%i4+0x018]%asi,%l7	! %l7 = ff606077e5f4aea1
!	Mem[0000000030081400] = 000000cb, %f28 = af108691
	lda	[%i2+%g0]0x81,%f28	! %f28 = 000000cb
!	Mem[0000000030081410] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[000000001004142c] = 626377ff, %l5 = 00000000000000ff
	lduha	[%i1+0x02e]%asi,%l5	! %l5 = 00000000000077ff
!	Mem[0000000021800140] = b9ffdf62, %l1 = 00000000000000ff
	lduha	[%o3+0x140]%asi,%l1	! %l1 = 000000000000b9ff
!	Mem[0000000010001410] = 22000000, %l6 = 0000000000000000
	lduwa	[%i0+0x010]%asi,%l6	! %l6 = 0000000022000000
!	Mem[0000000010101410] = ff617e1e, %l1 = 000000000000b9ff
	ldsh	[%i4+%o5],%l1		! %l1 = ffffffffffffff61
!	Starting 10 instruction Store Burst
!	%f16 = 531b5795 ff3e0dff, Mem[0000000010081410] = ff000000 00000022
	stda	%f16,[%i2+%o5]0x80	! Mem[0000000010081410] = 531b5795 ff3e0dff

p0_label_114:
!	%f6  = 14785cb6 0932356f, Mem[00000000100c1400] = cb0000ff ff0000cb
	stda	%f6 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 14785cb6 0932356f
!	Mem[0000000010181402] = 2867ffe5, %l3 = 0000000000000000
	ldstuba	[%i6+0x002]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030181408] = 000000ff, %l6 = 0000000022000000
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000020800040] = ffffe56e
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 00ffe56e
!	Mem[0000000030141410] = d5e75019, %l4 = 000000000000ff00
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 000000d5000000ff
!	%f10 = ff000000 4e5976ff, Mem[0000000010181408] = 2ad8b0ca 4e5976b4
	stda	%f10,[%i6+0x008]%asi	! Mem[0000000010181408] = ff000000 4e5976ff
!	%l0 = eb3629a06b3f99ab, Mem[0000000010041428] = 000000f9626377ff, %asi = 80
	stxa	%l0,[%i1+0x028]%asi	! Mem[0000000010041428] = eb3629a06b3f99ab
!	%f30 = ff3e0dfb 797482da, %l2 = 0000000000000000
!	Mem[0000000010101420] = 000000007a5394ff
	add	%i4,0x020,%g1
	stda	%f30,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010101420] = 000000007a5394ff
!	%f10 = ff000000 4e5976ff, Mem[0000000010041430] = 347fff8c 40ecb5f1
	std	%f10,[%i1+0x030]	! Mem[0000000010041430] = ff000000 4e5976ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = d5000000, %l0 = eb3629a06b3f99ab
	lduba	[%i0+%o4]0x80,%l0	! %l0 = 00000000000000d5

p0_label_115:
!	Mem[00000000201c0000] = ffff1b53, %l5 = 00000000000077ff
	ldsh	[%o0+%g0],%l5		! %l5 = ffffffffffffffff
!	%l2 = 0000000000000000, immed = 00000c8d, %y  = 00000000
	smul	%l2,0xc8d,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[0000000020800040] = 00ffe56e, %l4 = 0000000000000000
	lduba	[%o1+0x041]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = ff617e1e, %f12 = d4584a05
	lda	[%i4+%o4]0x81,%f12	! %f12 = ff617e1e
!	Mem[0000000030101408] = ff617e1e, %f23 = ff029986
	lda	[%i4+%o4]0x81,%f23	! %f23 = ff617e1e
!	Mem[0000000030141408] = ff0000ff, %l2 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141408] = ff0000ff, %l7 = ff606077e5f4aea1
	ldstuba	[%i5+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010181408] = 000000ff, %l0 = 00000000000000d5
	lduba	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = ffe75019ffffffce, %l7 = 00000000000000ff
	ldxa	[%i5+%o5]0x81,%l7	! %l7 = ffe75019ffffffce
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = d5000000, %l1 = ffffffffffffff61
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 000000d5000000ff

p0_label_116:
!	%l4 = 00000000000000ff, Mem[0000000030141408] = ff0000ff
	stba	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = ff0000ff
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000030141410] = 1950e7ff ceffffff
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff ffffffff
!	%l6 = 00000000000000ff, Mem[0000000030001410] = 2ad8b0ca
	stha	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 2ad800ff
!	%l6 = 00000000000000ff, Mem[00000000100c1418] = 7e181316
	stw	%l6,[%i3+0x018]		! Mem[00000000100c1418] = 000000ff
!	%l4 = 000000ff, %l5 = ffffffff, Mem[00000000100c1400] = 0932356f 14785cb6
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff ffffffff
!	%f0  = ff000000, Mem[0000000010101400] = 0000ffff
	sta	%f0 ,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000
!	Mem[0000000010181408] = 000000ff, %l6 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%f7  = 0932356f, Mem[0000000010101410] = ff617e1e
	sta	%f7 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 0932356f
!	Mem[0000000010001400] = ff000000, %l2 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff000000, %l6 = 00000000000000ff
	lduwa	[%i1+%o5]0x89,%l6	! %l6 = 00000000ff000000

p0_label_117:
!	Mem[0000000010101428] = 7e181316 4e5976b4, %l6 = ff000000, %l7 = ffffffce
	ldda	[%i4+0x028]%asi,%l6	! %l6 = 000000007e181316 000000004e5976b4
!	Mem[0000000030181408] = 000000223391135f, %f18 = b476594e ff0000cb
	ldda	[%i6+%o4]0x81,%f18	! %f18 = 00000022 3391135f
!	Mem[0000000030041410] = ff000000, %l1 = 00000000000000d5
	ldsba	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = ff1813164e5976b4, %f2  = 776060ff 00000000
	ldda	[%i1+%o5]0x80,%f2 	! %f2  = ff181316 4e5976b4
!	Mem[00000000100c1404] = ffffffff, %l0 = 00000000000000ff
	lduw	[%i3+0x004],%l0		! %l0 = 00000000ffffffff
!	Mem[00000000100c1410] = ff000000, %l3 = 00000000000000ff
	ldsha	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 0932356f850000ff, %f14 = 00000043 cb0000ff
	ldda	[%i4+%o5]0x80,%f14	! %f14 = 0932356f 850000ff
!	Mem[0000000030141410] = ff000000ffffffff, %l3 = 0000000000000000
	ldxa	[%i5+%o5]0x81,%l3	! %l3 = ff000000ffffffff
!	Mem[0000000010101410] = 6f353209, %l7 = 000000004e5976b4
	lduwa	[%i4+%o5]0x88,%l7	! %l7 = 000000006f353209
!	Starting 10 instruction Store Burst
!	%f12 = ff617e1e, %f23 = ff617e1e, %f14 = 0932356f 850000ff
	fsmuld	%f12,%f23,%f14		! %f14 = 4fe8d3dd dbb17080

p0_label_118:
!	Mem[0000000030081400] = 000000cb, %l4 = 00000000000000ff
	ldstuba	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l6 = 000000007e181316, Mem[0000000010001400] = 000000ff
	stha	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 00001316
!	%f24 = d003a0ff ff617e1e, %l0 = 00000000ffffffff
!	Mem[0000000030041400] = ff000000f9ffffff
	stda	%f24,[%i1+%l0]ASI_PST32_S ! Mem[0000000030041400] = d003a0ffff617e1e
!	Mem[0000000021800180] = ffffca9e, %l6 = 000000007e181316
	ldstuba	[%o3+0x180]%asi,%l6	! %l6 = 000000ff000000ff
!	%l3 = ff000000ffffffff, Mem[0000000010101410] = 0932356f
	stw	%l3,[%i4+%o5]		! Mem[0000000010101410] = ffffffff
!	%l6 = 00000000000000ff, Mem[0000000010001408] = 000000ff
	stba	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	Mem[0000000010001400] = 16130000, %l1 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 0000000016130000
!	%l5 = ffffffffffffffff, Mem[0000000030041410] = 000000ff
	stba	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = ff0000ff
!	Mem[0000000010081401] = ff000000, %l3 = ff000000ffffffff
	ldstub	[%i2+0x001],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 2867ffe5d2ab68ff, %l3 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l3	! %l3 = 2867ffe5d2ab68ff

p0_label_119:
!	Mem[0000000030041400] = d003a0ff, %f8  = 000000ff
	lda	[%i1+%g0]0x81,%f8 	! %f8 = d003a0ff
!	Mem[0000000010001400] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = ff181316, %f0  = ff000000
	lda	[%i1+%o5]0x80,%f0 	! %f0 = ff181316
!	Mem[000000001018140c] = 4e5976ff, %l6 = 0000000000000000
	ldswa	[%i6+0x00c]%asi,%l6	! %l6 = 000000004e5976ff
!	Mem[0000000030101410] = ff00a643, %f16 = 531b5795
	lda	[%i4+%o5]0x81,%f16	! %f16 = ff00a643
!	Mem[0000000030141400] = ff00a6ff, %l2 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001400] = 15c487a2, %l1 = 0000000016130000
	lduba	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000015
!	Mem[0000000030101408] = ff617e1e, %f30 = ff3e0dfb
	lda	[%i4+%o4]0x81,%f30	! %f30 = ff617e1e
!	Mem[00000000300c1400] = 000000ff, %l1 = 0000000000000015
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010101408] = 000000ff
	stha	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff

p0_label_120:
!	Mem[0000000030181408] = 00000022, %l4 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001408] = 000000ff, %l4 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%f24 = d003a0ff ff617e1e, Mem[0000000030181400] = 00000000 00000000
	stda	%f24,[%i6+%g0]0x89	! Mem[0000000030181400] = d003a0ff ff617e1e
!	Mem[00000000100c1400] = ff000000, %l5 = ffffffffffffffff
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 00000000ff000000
!	%f4  = 00000000 ff000000, Mem[00000000300c1400] = ff000000 1e7e61ff
	stda	%f4 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 ff000000
!	Mem[0000000030041410] = ff0000ff, %l5 = 00000000ff000000
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%l0 = 00000000ffffffff, Mem[000000001008142c] = e7826323, %asi = 80
	stwa	%l0,[%i2+0x02c]%asi	! Mem[000000001008142c] = ffffffff
!	%l6 = 4e5976ff, %l7 = 6f353209, Mem[00000000100c1418] = 000000ff 4e5976b4
	std	%l6,[%i3+0x018]		! Mem[00000000100c1418] = 4e5976ff 6f353209
!	Mem[0000000010081418] = d1193ab90932356f, %l4 = 00000000000000ff, %l0 = 00000000ffffffff
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = d1193ab90932356f
!	Starting 10 instruction Load Burst
!	%l5 = 00000000000000ff, %l6 = 000000004e5976ff, %y  = 00000000
	sdiv	%l5,%l6,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000

p0_label_121:
!	Mem[0000000030101410] = ff00a643dbf496ff, %f16 = ff00a643 ff3e0dff
	ldda	[%i4+%o5]0x81,%f16	! %f16 = ff00a643 dbf496ff
!	%f6  = 14785cb6, %f0  = ff181316, %f10 = ff000000
	fadds	%f6 ,%f0 ,%f10		! %f10 = ff181316
!	Mem[00000000300c1410] = 000000ff, %l7 = 000000006f353209
	ldsba	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001408] = 00000000, %l6 = 000000004e5976ff
	ldsha	[%i0+0x008]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1438] = 6e2dcd72 bb4227e5, %l4 = 000000ff, %l5 = 000000ff
	ldd	[%i3+0x038],%l4		! %l4 = 000000006e2dcd72 00000000bb4227e5
!	Mem[0000000030001400] = d4584a05a287c415, %l6 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = d4584a05a287c415
!	Mem[0000000010041400] = 26002200, %f18 = 00000022
	lda	[%i1+%g0]0x80,%f18	! %f18 = 26002200
!	Mem[0000000030001410] = ff00d82a, %l6 = d4584a05a287c415
	ldsba	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030081408] = ff0000cb 43000000, %l2 = 000000ff, %l3 = d2ab68ff
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 0000000043000000 00000000ff0000cb
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 95571b53, %l7 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 00000053000000ff

p0_label_122:
!	%l1 = 0000000000000000, Mem[0000000010181408] = 000000ff
	stwa	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%l6 = ffffffffffffffff, Mem[00000000201c0001] = ffff1b53
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = ffff1b53
!	%f20 = ff76594e ffff0000, %l0 = 0000000000000000
!	Mem[0000000030181408] = ff0000223391135f
	add	%i6,0x008,%g1
	stda	%f20,[%g1+%l0]ASI_PST8_S ! Mem[0000000030181408] = ff0000223391135f
!	Mem[0000000010041408] = 00ff0000, %l0 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%f4  = 00000000 ff000000, %l3 = 00000000ff0000cb
!	Mem[0000000030081430] = f14097b80deeec80
	add	%i2,0x030,%g1
	stda	%f4,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030081430] = 000000ff00000000
!	Mem[0000000030181400] = 1e7e61ff, %l2 = 0000000043000000
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 0000001e000000ff
!	%f14 = 4fe8d3dd dbb17080, %l6 = ffffffffffffffff
!	Mem[00000000100c1420] = ffdac282dbf496ff
	add	%i3,0x020,%g1
	stda	%f14,[%g1+%l6]ASI_PST8_P ! Mem[00000000100c1420] = 4fe8d3dddbb17080
!	Mem[0000000010101434] = 000000ff, %l2 = 000000000000001e, %asi = 80
	swapa	[%i4+0x034]%asi,%l2	! %l2 = 00000000000000ff
!	%f16 = ff00a643 dbf496ff 26002200 3391135f
!	%f20 = ff76594e ffff0000 ff000000 ff617e1e
!	%f24 = d003a0ff ff617e1e 18d3278a a472ca7c
!	%f28 = 000000cb 1b7071a6 ff617e1e 797482da
	stda	%f16,[%i1]ASI_BLK_P	! Block Store to 0000000010041400
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l2 = 00000000000000ff
	ldswa	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_123:
!	Mem[0000000030001408] = ff000000 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000 00000000ff000000
!	Mem[00000000300c1410] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101408] = 000000ff, %f2  = ff181316
	lda	[%i4+%o4]0x80,%f2 	! %f2 = 000000ff
!	Mem[0000000010001410] = 00000022, %f13 = a287c415
	lda	[%i0+%o5]0x88,%f13	! %f13 = 00000022
!	Mem[0000000030101410] = 43a600ff, %l4 = 000000006e2dcd72
	lduwa	[%i4+%o5]0x89,%l4	! %l4 = 0000000043a600ff
!	Mem[0000000030001410] = 2ad800ff, %l1 = 00000000ff000000
	ldswa	[%i0+%o5]0x89,%l1	! %l1 = 000000002ad800ff
!	Mem[00000000100c1410] = 000000ff, %l2 = 00000000000000ff
	ldsha	[%i3+0x012]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101410] = ffffffff, %l4 = 0000000043a600ff
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041408] = 00000000 000000ff, %l6 = ffffffff, %l7 = 00000053
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = ff000000, %l6 = 00000000000000ff
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 00000000ff000000

p0_label_124:
!	Mem[0000000030101408] = 1e7e61ff, %l4 = ffffffffffffffff
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 000000001e7e61ff
!	%l3 = 00000000ff0000cb, Mem[00000000100c1408] = ff000000
	stwa	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff0000cb
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010041430] = 000000cb1b7071a6, %l2 = 00000000000000ff, %l0 = 0000000000000000
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = 000000cb1b7071a6
!	Mem[0000000030181408] = ff000022, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l6 = 00000000ff000000, Mem[0000000010101408] = ff000000
	stba	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000
!	%l7 = 00000000000000ff, Mem[0000000030081400] = cb0000ff
	stwa	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	%l7 = 00000000000000ff, Mem[0000000010101410] = ffffffff
	stha	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = ffff00ff
!	Mem[0000000010041400] = ff00a643, %l3 = 00000000ff0000cb
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	%l4 = 000000001e7e61ff, Mem[00000000211c0000] = fffb37e1, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 61ff37e1
!	Starting 10 instruction Load Burst
!	%f14 = 4fe8d3dd, %f25 = ff617e1e
	fcmps	%fcc3,%f14,%f25		! %fcc3 = 2

p0_label_125:
!	%f16 = ff00a643, %f27 = a472ca7c, %f6  = 14785cb6 0932356f
	fsmuld	%f16,%f27,%f6 		! %f6  = 447e80bb 35d99d00
!	Mem[0000000030101410] = ff96f4db 43a600ff, %l4 = 1e7e61ff, %l5 = bb4227e5
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 0000000043a600ff 00000000ff96f4db
!	Mem[0000000030041400] = d003a0ff, %l2 = 00000000000000ff
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffd003
!	Mem[0000000030041408] = ff000000 00000000, %l2 = ffffd003, %l3 = 000000ff
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010181408] = ff76594e00000000, %f24 = d003a0ff ff617e1e
	ldda	[%i6+%o4]0x88,%f24	! %f24 = ff76594e 00000000
!	Mem[0000000010181410] = ff76594e000000ff, %l4 = 0000000043a600ff
	ldxa	[%i6+%o5]0x88,%l4	! %l4 = ff76594e000000ff
!	Mem[0000000010001400] = 00000000, %f27 = a472ca7c
	lda	[%i0+%g0]0x80,%f27	! %f27 = 00000000
!	Mem[0000000030081400] = ff000000, %l7 = 00000000000000ff
	ldsba	[%i2+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181410] = 00000000 7a539475, %l4 = 000000ff, %l5 = ff96f4db
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000000 000000007a539475
!	Starting 10 instruction Store Burst
!	%l6 = ff000000, %l7 = ffffffff, Mem[0000000030081408] = 00000043 cb0000ff
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000 ffffffff

p0_label_126:
!	%l0 = 000000cb1b7071a6, Mem[0000000010041404] = dbf496ff
	sth	%l0,[%i1+0x004]		! Mem[0000000010041404] = 71a696ff
!	%l4 = 0000000000000000, Mem[0000000030141400] = ffa600fffa000000
	stxa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000000
!	%f22 = ff000000, Mem[0000000010081410] = 95571bff
	sta	%f22,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000
!	%l0 = 000000cb1b7071a6, Mem[00000000201c0000] = ffff1b53, %asi = 80
	stba	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = a6ff1b53
!	%l2 = ff000000, %l3 = 00000000, Mem[0000000010081408] = ff0b0000 d5e743ff
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000 00000000
!	Mem[0000000010101426] = 7a5394ff, %l6 = 00000000ff000000
	ldstub	[%i4+0x026],%l6		! %l6 = 00000094000000ff
!	%f26 = 18d3278a 00000000, Mem[0000000010141410] = ff000000 0f1cff16
	stda	%f26,[%i5+%o5]0x88	! Mem[0000000010141410] = 18d3278a 00000000
!	Mem[0000000030101408] = ffffffff, %l5 = 000000007a539475
	ldstuba	[%i4+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l2 = ff000000, %l3 = 00000000, Mem[0000000030181408] = 220000ff 5f139133
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 43a600ff, %f29 = 1b7071a6
	lda	[%i4+%o5]0x89,%f29	! %f29 = 43a600ff

p0_label_127:
!	%f26 = 18d3278a, %f26 = 18d3278a, %f23 = ff617e1e
	fadds	%f26,%f26,%f23		! %f23 = 1953278a
!	Mem[00000000211c0000] = 61ff37e1, %l5 = 00000000000000ff
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141408] = 776060ff16ff187e, %f0  = ff181316 e5f4aea1
	ldda	[%i5+%o4]0x80,%f0 	! %f0  = 776060ff 16ff187e
!	Mem[0000000010001404] = 000000ff, %l6 = 0000000000000094
	ldub	[%i0+0x004],%l6		! %l6 = 0000000000000000
!	Mem[0000000030181400] = ff7e61ff, %l4 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l4	! %l4 = ffffffffffffff7e
!	Mem[0000000030001410] = ff00d82a00000000, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l3	! %l3 = ff00d82a00000000
!	Mem[00000000100c1400] = ffffffff, %l3 = ff00d82a00000000
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[000000001004141c] = ff617e1e, %l4 = ffffffffffffff7e
	ldsw	[%i1+0x01c],%l4		! %l4 = ffffffffff617e1e
!	Mem[0000000010081408] = ff00000000000000, %f26 = 18d3278a 00000000
	ldda	[%i2+%o4]0x80,%f26	! %f26 = ff000000 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010041410] = 4e5976ff
	stba	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 4e597600

p0_label_128:
!	Mem[0000000010001408] = 00000000, %l0 = 000000cb1b7071a6
	ldstuba	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l1 = 000000002ad800ff, Mem[0000000010101408] = 000000ff
	stwa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 2ad800ff
!	%l4 = ffffffffff617e1e, Mem[00000000211c0000] = 61ff37e1
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 7e1e37e1
!	%f4  = 00000000 ff000000, Mem[0000000030101410] = 43a600ff ff96f4db
	stda	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 ff000000
!	Mem[00000000300c1400] = 000000ff, %l2 = 00000000ff000000
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000, %l1 = 2ad800ff, Mem[00000000300c1400] = ff0000ff 00000000
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 2ad800ff
!	%l2 = 0000000000000000, Mem[0000000020800040] = 00ffe56e
	stb	%l2,[%o1+0x040]		! Mem[0000000020800040] = 00ffe56e
!	Mem[0000000030081400] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030181408] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff00000000000000, %l1 = 000000002ad800ff
	ldxa	[%i2+%o4]0x80,%l1	! %l1 = ff00000000000000

p0_label_129:
!	Mem[0000000010101410] = ff00ffff, %l0 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010101410] = ff00ffff, %l0 = ffffffffffffff00
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010141408] = 776060ff16ff187e, %l2 = 00000000000000ff
	ldxa	[%i5+%o4]0x80,%l2	! %l2 = 776060ff16ff187e
!	Mem[0000000010001410] = 000000ff00000022, %f6  = 447e80bb 35d99d00
	ldda	[%i0+%o5]0x88,%f6 	! %f6  = 000000ff 00000022
!	Mem[0000000010081430] = de9b58ca, %l4 = ffffffffff617e1e
	ldsba	[%i2+0x030]%asi,%l4	! %l4 = ffffffffffffffde
!	Mem[0000000010001408] = ff000000, %l4 = ffffffffffffffde
	lduwa	[%i0+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030141400] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = ffff0000, %l3 = 00000000000000ff
	lduba	[%i2+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041430] = 000000cb, %l3 = 00000000000000ff
	lduh	[%i1+0x030],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 000000ff, %l2 = 776060ff16ff187e
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 000000ff000000ff

p0_label_130:
!	%f30 = ff617e1e, Mem[0000000010081400] = ffff0000
	sta	%f30,[%i2+%g0]0x80	! Mem[0000000010081400] = ff617e1e
!	Mem[0000000030041410] = ff0000ff, %l7 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	%f8  = d003a0ff, %f5  = ff000000
	fcmpes	%fcc0,%f8 ,%f5 		! %fcc0 = 2
!	%l7 = 00000000000000ff, Mem[000000001000142c] = 291905f2, %asi = 80
	stwa	%l7,[%i0+0x02c]%asi	! Mem[000000001000142c] = 000000ff
!	%f21 = ffff0000, Mem[0000000010001400] = 00000000
	sta	%f21,[%i0+%g0]0x88	! Mem[0000000010001400] = ffff0000
!	Mem[00000000300c1400] = 00000000, %l5 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l0 = ffffffffffffff00
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	%l5 = 0000000000000000, Mem[0000000021800100] = ff211701, %asi = 80
	stba	%l5,[%o3+0x100]%asi	! Mem[0000000021800100] = 00211701
!	%l6 = 0000000000000000, Mem[0000000010101400] = 000000ff00000022
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff7e61ff, %l2 = 00000000000000ff
	ldswa	[%i6+%g0]0x81,%l2	! %l2 = ffffffffff7e61ff

p0_label_131:
!	Mem[0000000010081408] = ffffff00, %f11 = 4e5976ff
	lda	[%i2+%o4]0x80,%f11	! %f11 = ffffff00
!	Mem[0000000010001410] = 000000ff00000022, %l5 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l5	! %l5 = 000000ff00000022
!	Mem[000000001014142c] = 8c9fd8d8, %l4 = 00000000ff000000
	ldswa	[%i5+0x02c]%asi,%l4	! %l4 = ffffffff8c9fd8d8
!	Mem[0000000010041400] = ff00a643, %l7 = 00000000000000ff
	ldsha	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[00000000300c1410] = 82e73f1e 000000ff, %l6 = 00000000, %l7 = ffffff00
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff 0000000082e73f1e
!	Mem[00000000100c1408] = ff0000cb, %l4 = ffffffff8c9fd8d8
	lduha	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000cb
!	Mem[0000000030181410] = 00000000, %l7 = 0000000082e73f1e
	ldswa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 2867ffe5, %f31 = 797482da
	ld	[%i6+%g0],%f31	! %f31 = 2867ffe5
!	Mem[0000000030041400] = ffa003d0, %l0 = 00000000ff000000
	ldswa	[%i1+%g0]0x89,%l0	! %l0 = ffffffffffa003d0
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ff000000, %l4 = 00000000000000cb
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 000000ff000000ff

p0_label_132:
!	%l7 = 0000000000000000, Mem[0000000010001400] = 0000ffff
	stwa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l4 = 000000ff, %l5 = 00000022, Mem[0000000010041400] = 43a600ff ff96a671
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff 00000022
!	%l7 = 0000000000000000, Mem[000000001008141a] = d1193ab9, %asi = 80
	stha	%l7,[%i2+0x01a]%asi	! Mem[0000000010081418] = d1190000
!	Mem[0000000010081408] = 00ffffff, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030101408] = ffffffff, %l1 = ff00000000000000
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010141410] = 00000000, %l6 = 00000000000000ff
	swapa	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l1 = 00000000ffffffff
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l0 = ffa003d0, %l1 = 00000000, Mem[0000000010141408] = ff606077 7e18ff16
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = ffa003d0 00000000
!	Mem[00000000300c1400] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = d003a0ff, %l6 = 0000000000000000
	ldsha	[%i1+%g0]0x81,%l6	! %l6 = ffffffffffffd003

p0_label_133:
!	Mem[0000000010081410] = ff0d3effff000000, %f0  = 776060ff 16ff187e
	ldda	[%i2+%o5]0x88,%f0 	! %f0  = ff0d3eff ff000000
!	Mem[0000000010081400] = ff617e1e, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ff617e1e
!	Mem[0000000010141400] = ca000000000000ff, %f12 = ff617e1e 00000022
	ldda	[%i5+%g0]0x88,%f12	! %f12 = ca000000 000000ff
!	Mem[00000000100c1438] = 6e2dcd72bb4227e5, %f24 = ff76594e 00000000
	ldda	[%i3+0x038]%asi,%f24	! %f24 = 6e2dcd72 bb4227e5
!	Mem[0000000010081400] = ff617e1e, %l1 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ff617e1e
!	Mem[0000000030041400] = 1e7e61ffffa003d0, %l1 = 00000000ff617e1e
	ldxa	[%i1+%g0]0x89,%l1	! %l1 = 1e7e61ffffa003d0
!	Mem[0000000030101400] = ff000382, %l7 = 00000000ff617e1e
	lduba	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081410] = 000000ff, %l5 = 000000ff00000022
	lduba	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[000000001000142c] = 000000ff, %l5 = 00000000000000ff
	ldswa	[%i0+0x02c]%asi,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010001410] = 00000022
	stba	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff

p0_label_134:
!	Mem[0000000010141438] = 00000000, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x038]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = ff00d82a, %l1 = 1e7e61ffffa003d0
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ff00d82a
!	%l6 = ffffffffffffd003, Mem[0000000030141400] = 00000000
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = d0030000
!	Mem[0000000010001400] = 00000000, %l1 = 00000000ff00d82a
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%f6  = 000000ff 00000022, %l0 = ffffffffffa003d0
!	Mem[0000000010001408] = ff000000ffffffff
	add	%i0,0x008,%g1
	stda	%f6,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010001408] = ff000000ffffffff
!	%l0 = ffa003d0, %l1 = 00000000, Mem[0000000010081410] = ff000000 ff0d3eff
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = ffa003d0 00000000
!	%l3 = 00000000000000ff, Mem[00000000100c1410] = ff000000
	stha	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff0000ff
!	Mem[0000000030001400] = 15c487a2, %l4 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 00000015000000ff
!	Mem[0000000010101408] = ff00d82a, %l5 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l5	! %l5 = 00000000ff00d82a
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff000000, %l6 = ffffffffffffd003
	ldsba	[%i3+%o5]0x81,%l6	! %l6 = ffffffffffffffff

p0_label_135:
!	Mem[00000000211c0000] = 7e1e37e1, %l6 = ffffffffffffffff
	lduba	[%o2+0x001]%asi,%l6	! %l6 = 000000000000001e
!	Mem[0000000010181400] = e5ff6728, %f30 = ff617e1e
	lda	[%i6+%g0]0x88,%f30	! %f30 = e5ff6728
!	%l2 = ffffffffff7e61ff, %l1 = 0000000000000000, %l7 = 00000000000000ff
	andn	%l2,%l1,%l7		! %l7 = ffffffffff7e61ff
!	Mem[0000000010141400] = 000000ff, %l4 = 0000000000000015
	ldsba	[%i5+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041410] = 0076594e, %l1 = 0000000000000000
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = 000000000076594e
!	%f14 = 4fe8d3dd dbb17080, Mem[0000000030041410] = ff0000ff 00000000
	stda	%f14,[%i1+%o5]0x81	! Mem[0000000030041410] = 4fe8d3dd dbb17080
!	Mem[0000000010001400] = 000000ff, %l3 = 00000000000000ff
	ldswa	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1434] = 776060ff, %f14 = 4fe8d3dd
	ld	[%i3+0x034],%f14	! %f14 = 776060ff
!	%l7 = ffffffffff7e61ff, %l0 = ffffffffffa003d0, %l2 = ffffffffff7e61ff
	xnor	%l7,%l0,%l2		! %l2 = ffffffffff219dd0
!	Starting 10 instruction Store Burst
!	%f1  = ff000000, %f17 = dbf496ff, %f24 = 6e2dcd72 bb4227e5
	fsmuld	%f1 ,%f17,%f24		! %f24 = 4b6e92df e0000000

p0_label_136:
!	Mem[0000000030041400] = ffa003d0, %l4 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 000000d0000000ff
!	%f6  = 000000ff 00000022, %l5 = 00000000ff00d82a
!	Mem[00000000100c1418] = 4e5976ff6f353209
	add	%i3,0x018,%g1
	stda	%f6,[%g1+%l5]ASI_PST32_PL ! Mem[00000000100c1418] = 4e5976ffff000000
!	%f13 = 000000ff, Mem[000000001014142c] = 8c9fd8d8
	sta	%f13,[%i5+0x02c]%asi	! Mem[000000001014142c] = 000000ff
!	Mem[0000000010141408] = ffa003d0, %l6 = 000000000000001e
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 00000000ffa003d0
!	%l0 = ffffffffffa003d0, Mem[0000000030001400] = ffc487a2
	stwa	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = ffa003d0
!	%f6  = 000000ff 00000022, %l5 = 00000000ff00d82a
!	Mem[00000000100c1410] = ff0000ffcb000000
	add	%i3,0x010,%g1
	stda	%f6,[%g1+%l5]ASI_PST8_PL ! Mem[00000000100c1410] = ff000000cb000000
!	%l1 = 000000000076594e, Mem[0000000020800040] = 00ffe56e, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = 594ee56e
!	Mem[00000000100c1400] = ffffffff, %l1 = 000000000076594e
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 00000000ffffffff
!	%l4 = 00000000000000d0, Mem[0000000030141400] = d0030000
	stba	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = d0030000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ffa003ff, %l0 = ffffffffffa003d0
	ldsba	[%i1+%g0]0x89,%l0	! %l0 = ffffffffffffffff

p0_label_137:
!	Mem[0000000030141408] = ff0000ff, %l2 = ffffffffff219dd0
	lduha	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081408] = 000000ff, %l6 = 00000000ffa003d0
	ldsba	[%i2+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181408] = 00000000, %l4 = 00000000000000d0
	ldsha	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = ff0000004e5976ff, %l2 = 00000000000000ff
	ldxa	[%i6+%o5]0x80,%l2	! %l2 = ff0000004e5976ff
!	Mem[0000000010141410] = ff0000008a27d318, %f24 = 4b6e92df e0000000
	ldda	[%i5+%o5]0x80,%f24	! %f24 = ff000000 8a27d318
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000030181400] = ff7e61ff ffa003d0 000000ff 00000000
!	Mem[0000000030181410] = 00000000 7a539475 ff776362 67186f7c
!	Mem[0000000030181420] = 97f10c32 a704578c 74d5d720 ed5fa07b
!	Mem[0000000030181430] = 775261c6 bb4298e5 1e7e61c6 bb4227e5
	ldda	[%i6]ASI_BLK_S,%f16	! Block Load from 0000000030181400
!	Mem[0000000010001400] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l5 = 00000000ff00d82a, Mem[0000000010141408] = 1e000000
	stba	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 2a000000
!	Mem[0000000021800180] = ffffca9e, %l5 = 00000000ff00d82a
	ldsb	[%o3+0x180],%l5		! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f12 = ca000000, Mem[0000000030041400] = ffa003ff
	sta	%f12,[%i1+%g0]0x89	! Mem[0000000030041400] = ca000000

p0_label_138:
!	%l3 = 00000000000000ff, Mem[0000000010001410] = 000000ff000000ff
	stxa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000000000ff
!	%f0  = ff0d3eff, Mem[00000000100c1410] = ff000000
	sta	%f0 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff0d3eff
!	%l0 = ffffffff, %l1 = ffffffff, Mem[00000000100c1408] = ff0000cb cb827008
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffff ffffffff
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000010001400] = ff000000 000000ff
	std	%l4,[%i0+%g0]		! Mem[0000000010001400] = 000000ff ffffffff
!	%l7 = ffffffffff7e61ff, immd = fffffffffffff715, %l1  = 00000000ffffffff
	mulx	%l7,-0x8eb,%l1		! %l1 = 0000000483ec12eb
!	Mem[00000000100c141e] = ff000000, %l7 = ffffffffff7e61ff
	ldstub	[%i3+0x01e],%l7		! %l7 = 00000000000000ff
!	%f14 = 776060ff, %f7  = 00000022
	fcmps	%fcc3,%f14,%f7 		! %fcc3 = 2
!	Mem[0000000010101408] = ff000000, %l3 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	%l0 = ffffffffffffffff, Mem[00000000100c1420] = 4fe8d3dddbb17080, %asi = 80
	stxa	%l0,[%i3+0x020]%asi	! Mem[00000000100c1420] = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff000000, %l7 = 0000000000000000
	ldsba	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_139:
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010001400] = 000000ff ffffffff ff000000 ffffffff
!	Mem[0000000010001410] = ff000000 00000000 00000000 e5ff6728
!	Mem[0000000010001420] = ff68abd2 fffffff1 ff4e84ce 000000ff
!	Mem[0000000010001430] = 53b35b83 f2690d26 ced2eed0 001d0043
	ldda	[%i0]ASI_BLK_PL,%f0	! Block Load from 0000000010001400
!	Mem[0000000010181408] = 00000000, %l5 = ffffffffffffffff
	lduwa	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = 000000ff, %l2 = ff0000004e5976ff
	ldswa	[%i4+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l6 = ffffffffffffffff
	ldsba	[%i3+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141400] = 000003d0, %l6 = ffffffffffffffff
	lduba	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000d0
!	Mem[0000000030001408] = ff000000 00000000, %l0 = ffffffff, %l1 = 83ec12eb
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000 00000000ff000000
!	Mem[0000000030041400] = 000000ca, %l5 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000ca
!	Mem[000000001000140c] = ffffffff, %l5 = 00000000000000ca
	lduha	[%i0+0x00e]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030081410] = ff000000, %l7 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l7	! %l7 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ffff, %l6 = 00000000000000d0, %l5 = 000000000000ffff
	xnor	%l5,%l6,%l5		! %l5 = ffffffffffff00d0

p0_label_140:
!	Mem[0000000030141408] = ff0000ff, %l5 = ffffffffffff00d0
	swapa	[%i5+%o4]0x89,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000010101408] = 000000ff00000b21, %l4 = 00000000000000ff
	ldxa	[%i4+0x008]%asi,%l4	! %l4 = 000000ff00000b21
!	Mem[0000000010041415] = ffff0000, %l7 = ffffffffff000000
	ldstuba	[%i1+0x015]%asi,%l7	! %l7 = 000000ff000000ff
!	%l0 = 00000000, %l1 = ff000000, Mem[0000000030001408] = 00000000 000000ff
	stda	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 ff000000
!	%f21 = 7a539475, Mem[0000000030101400] = 820300ff
	sta	%f21,[%i4+%g0]0x89	! Mem[0000000030101400] = 7a539475
!	Mem[00000000100c1400] = 0076594e, %l6 = 00000000000000d0
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 0000004e000000ff
!	Mem[0000000030141410] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030041410] = 4fe8d3dd, %l0 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 0000004f000000ff
!	%l4 = 00000b21, %l5 = ff0000ff, Mem[0000000030081408] = ff000000 ffffffff
	stda	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000b21 ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l2 = 00000000000000ff
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000

p0_label_141:
!	Mem[00000000100c1410] = ff3e0dff, %l4 = 000000ff00000b21
	ldswa	[%i3+%o5]0x88,%l4	! %l4 = ffffffffff3e0dff
!	Mem[0000000010101420] = 00000000 7a53ffff, %l6 = 0000004e, %l7 = 000000ff
	ldda	[%i4+0x020]%asi,%l6	! %l6 = 0000000000000000 000000007a53ffff
!	Mem[0000000010001410] = 000000ff, %f25 = a704578c
	lda	[%i0+%o5]0x88,%f25	! %f25 = 000000ff
!	Mem[0000000030141400] = d0030000, %l7 = 000000007a53ffff
	ldswa	[%i5+%g0]0x81,%l7	! %l7 = ffffffffd0030000
!	Mem[0000000010141400] = 000000ff, %l7 = ffffffffd0030000
	lduwa	[%i5+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = ff000000, %f22 = ff776362
	lda	[%i5+%o5]0x80,%f22	! %f22 = ff000000
!	Mem[0000000030181408] = 000000ff, %l5 = 00000000ff0000ff
	ldsha	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = d003a0ff, %l6 = 0000000000000000
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 000000000000d003
!	Mem[0000000010141410] = ff0000008a27d318, %l2 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l2	! %l2 = ff0000008a27d318
!	Starting 10 instruction Store Burst
!	%l2 = ff0000008a27d318, Mem[0000000021800100] = 00211701, %asi = 80
	stha	%l2,[%o3+0x100]%asi	! Mem[0000000021800100] = d3181701

p0_label_142:
!	%l7 = 00000000000000ff, Mem[0000000010101408] = 000000ff
	stwa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff
!	%f26 = 74d5d720 ed5fa07b, %l6 = 000000000000d003
!	Mem[0000000030081418] = ffffffffed5fa07b
	add	%i2,0x018,%g1
	stda	%f26,[%g1+%l6]ASI_PST8_S ! Mem[0000000030081418] = ffffffffed5fa07b
!	%l3 = 00000000ff000000, Mem[0000000030041400] = ca000000
	stba	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = ca000000
!	%l5 = 0000000000000000, Mem[0000000010101410] = ff00ffff
	stha	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000ffff
!	%l4 = ffffffffff3e0dff, Mem[000000001018143a] = da827479, %asi = 80
	stba	%l4,[%i6+0x03a]%asi	! Mem[0000000010181438] = da82ff79
!	Mem[0000000010001430] = 53b35b83, %l0 = 0000004f, %l7 = 000000ff
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 0000000053b35b83
!	%l2 = 8a27d318, %l3 = ff000000, Mem[00000000100c1410] = ff0d3eff cb000000
	stda	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 8a27d318 ff000000
!	%l0 = 000000000000004f, Mem[00000000100c1408] = ffffffffffffffff
	stx	%l0,[%i3+%o4]		! Mem[00000000100c1408] = 000000000000004f
!	%f22 = ff000000 67186f7c, %l1 = 00000000ff000000
!	Mem[0000000010181438] = da82ff79fb0d3eff
	add	%i6,0x038,%g1
	stda	%f22,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010181438] = da82ff79fb0d3eff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000ff, %l4 = ffffffffff3e0dff
	ldsba	[%i5+%g0]0x88,%l4	! %l4 = ffffffffffffffff

p0_label_143:
!	Mem[00000000100c143c] = bb4227e5, %f18 = 000000ff
	ld	[%i3+0x03c],%f18	! %f18 = bb4227e5
!	Mem[000000001000142c] = 000000ff, %l1 = 00000000ff000000
	lduha	[%i0+0x02e]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = d003a0ff ff617eff, %l2 = 8a27d318, %l3 = ff000000
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 00000000ff617eff 00000000d003a0ff
!	Mem[0000000010001410] = ff000000 00000000, %l0 = 0000004f, %l1 = 000000ff
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[00000000100c143c] = bb4227e5, %l4 = ffffffffffffffff
	lduwa	[%i3+0x03c]%asi,%l4	! %l4 = 00000000bb4227e5
!	Mem[0000000030081408] = 00000b21, %l1 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = 00000000000000ff, %f20 = 00000000 7a539475
	ldda	[%i2+%g0]0x89,%f20	! %f20 = 00000000 000000ff
!	Mem[0000000030101410] = 000000ff, %f5  = 000000ff
	lda	[%i4+%o5]0x81,%f5 	! %f5 = 000000ff
!	Mem[0000000010141400] = ff000000, %l2 = 00000000ff617eff
	ldsha	[%i5+%g0]0x80,%l2	! %l2 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 000000ff000000ff

p0_label_144:
	membar	#Sync			! Added by membar checker (22)
!	%l6 = 000000000000d003, Mem[0000000010001410] = 000000ff
	stwa	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000d003
!	Mem[0000000030181408] = 000000ff, %l7 = 0000000053b35b83
	lduba	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000030101410] = 000000ff
	stha	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ff00ff
!	%l5 = 0000000000000000, Mem[0000000010001438] = ced2eed0001d0043
	stx	%l5,[%i0+0x038]		! Mem[0000000010001438] = 0000000000000000
!	%l6 = 000000000000d003, Mem[0000000030081408] = 210b0000
	stha	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 210bd003
!	Mem[0000000010101408] = 000000ff, %l2 = ffffffffffffff00
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = 000000ca, %l3 = 00000000d003a0ff
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000000000ca
!	%f12 = 260d69f2 835bb353, Mem[0000000030181408] = 000000ff 00000000
	stda	%f12,[%i6+%o4]0x81	! Mem[0000000030181408] = 260d69f2 835bb353
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffffaff8, %l3 = 00000000000000ca
	lduh	[%o1+%g0],%l3		! %l3 = 000000000000ffff

p0_label_145:
!	Mem[0000000030041408] = 000000ff, %f21 = 000000ff
	lda	[%i1+%o4]0x89,%f21	! %f21 = 000000ff
!	Mem[0000000030181400] = ff7e61ffffa003d0, %f4  = 00000000 000000ff
	ldda	[%i6+%g0]0x81,%f4 	! %f4  = ff7e61ff ffa003d0
!	Mem[00000000300c1408] = ff00000067186f7c, %f0  = ffffffff ff000000
	ldda	[%i3+%o4]0x81,%f0 	! %f0  = ff000000 67186f7c
!	Mem[0000000030041400] = 1e7e61ff ffa003d0, %l4 = bb4227e5, %l5 = 00000000
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 00000000ffa003d0 000000001e7e61ff
!	Mem[0000000030001410] = d003a0ff, %f29 = bb4298e5
	lda	[%i0+%o5]0x89,%f29	! %f29 = d003a0ff
!	Mem[00000000100c1410] = 8a27d318, %l4 = 00000000ffa003d0
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 0000000000008a27
!	Mem[0000000010001410] = 000000000000d003, %f14 = 43001d00 d0eed2ce
	ldda	[%i0+%o5]0x88,%f14	! %f14 = 00000000 0000d003
!	Mem[0000000010181408] = 00000000, %l4 = 0000000000008a27
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l2 = 00000000000000ff
	lduha	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f4  = ff7e61ff ffa003d0, Mem[0000000010001408] = ff000000 ffffffff
	stda	%f4 ,[%i0+0x008]%asi	! Mem[0000000010001408] = ff7e61ff ffa003d0

p0_label_146:
!	Mem[0000000030001400] = d003a0ff, %l7 = 00000000000000ff
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	%f21 = 000000ff, Mem[0000000010041400] = ff000000
	sta	%f21,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	%l1 = 00000000000000ff, Mem[0000000021800140] = b9ffdf62
	sth	%l1,[%o3+0x140]		! Mem[0000000021800140] = 00ffdf62
!	%l4 = 0000000000000000, %l0 = 00000000ff000000, %l2 = 0000000000000000
	sub	%l4,%l0,%l2		! %l2 = ffffffff01000000
!	Mem[0000000020800000] = ffffaff8, %l3 = 000000000000ffff
	ldstub	[%o1+%g0],%l3		! %l3 = 000000ff000000ff
!	%f4  = ff7e61ff ffa003d0, Mem[00000000300c1408] = ff000000 67186f7c
	stda	%f4 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff7e61ff ffa003d0
!	%l4 = 00000000, %l5 = 1e7e61ff, Mem[0000000010141408] = 0000002a 00000000
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 1e7e61ff
!	%f28 = 775261c6 d003a0ff, %l0 = 00000000ff000000
!	Mem[0000000030101410] = 00ff00ff00000000
	add	%i4,0x010,%g1
	stda	%f28,[%g1+%l0]ASI_PST32_S ! Mem[0000000030101410] = 00ff00ff00000000
!	Mem[00000000100c1400] = ff597600, %l6 = 000000000000d003
	ldstuba	[%i3+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffffffffffff00d0, %l3 = 00000000000000ff
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = ffffffffffff00d0

p0_label_147:
!	Mem[0000000030181400] = ff7e61ff ffa003d0, %l0 = ff000000, %l1 = 000000ff
	ldda	[%i6+%g0]0x81,%l0	! %l0 = 00000000ff7e61ff 00000000ffa003d0
!	Mem[0000000030001410] = ffa003d000000000, %l0 = 00000000ff7e61ff
	ldxa	[%i0+%o5]0x81,%l0	! %l0 = ffa003d000000000
!	Mem[0000000010101410] = ffff0000, %l7 = 00000000000000ff
	ldsba	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081424] = 6e2dcd72, %l7 = 0000000000000000
	ldsb	[%i2+0x024],%l7		! %l7 = 000000000000006e
!	Mem[0000000010101428] = 7e181316, %l0 = ffa003d000000000
	lduh	[%i4+0x02a],%l0		! %l0 = 0000000000001316
!	Mem[00000000300c1408] = ff617eff, %l0 = 0000000000001316
	ldsba	[%i3+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041430] = 000000cb1b7071a6, %f2  = ffffffff 000000ff
	ldd	[%i1+0x030],%f2 	! %f2  = 000000cb 1b7071a6
!	Mem[0000000010141408] = 1e7e61ff00000000, %f6  = 2867ffe5 00000000
	ldda	[%i5+%o4]0x88,%f6 	! %f6  = 1e7e61ff 00000000
!	Mem[0000000030041408] = 00000000000000ff, %l7 = 000000000000006e
	ldxa	[%i1+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = d003a0ff, %l3 = ffffffffffff00d0
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 000000ff000000ff

p0_label_148:
!	%l4 = 0000000000000000, Mem[0000000030041400] = d003a0ffff617e1e
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000010141400] = 000000ff
	stba	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	%l0 = ffffffff, %l1 = ffa003d0, Mem[0000000010001410] = 03d00000 00000000
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffff ffa003d0
!	Mem[0000000030141408] = ffff00d0, %l6 = 00000000000000ff
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 000000d0000000ff
!	Mem[0000000010141400] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101408] = ffffff00, %l0 = ffffffffffffffff
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 00000000ffffff00
!	Mem[0000000010081410] = ffa003d0, %l3 = 00000000000000ff
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 000000d0000000ff
!	%l7 = 00000000000000ff, Mem[00000000100c1430] = ffff9f8c, %asi = 80
	stwa	%l7,[%i3+0x030]%asi	! Mem[00000000100c1430] = 000000ff
!	%l4 = 0000000000000000, Mem[0000000030001410] = ffa003d0
	stba	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00a003d0
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 260d69f2835bb353, %f6  = 1e7e61ff 00000000
	ldda	[%i6+%o4]0x81,%f6 	! %f6  = 260d69f2 835bb353

p0_label_149:
!	Mem[0000000010141410] = ff000000, %l0 = 00000000ffffff00
	ldswa	[%i5+0x010]%asi,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030041400] = 00000000, %l7 = 00000000000000ff
	lduha	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Code Fragment 3
p0_fragment_9:
!	%l0 = ffffffffff000000
	setx	0x10cc13bfa41e2e1e,%g7,%l0 ! %l0 = 10cc13bfa41e2e1e
!	%l1 = 00000000ffa003d0
	setx	0xacabc467dd0734ca,%g7,%l1 ! %l1 = acabc467dd0734ca
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 10cc13bfa41e2e1e
	setx	0x7468aeb036e368e8,%g7,%l0 ! %l0 = 7468aeb036e368e8
!	%l1 = acabc467dd0734ca
	setx	0x9e906ed795cd2faa,%g7,%l1 ! %l1 = 9e906ed795cd2faa
!	Mem[0000000030181400] = ff617eff, %l3 = 00000000000000d0
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1410] = 8a27d318, %l5 = 000000001e7e61ff
	ldsba	[%i3+0x011]%asi,%l5	! %l5 = 0000000000000027
!	Mem[0000000010001408] = ff7e61ffffa003d0, %l1 = 9e906ed795cd2faa
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = ff7e61ffffa003d0
!	Mem[0000000010001410] = d003a0ffffffffff, %l7 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l7	! %l7 = d003a0ffffffffff
!	Mem[0000000010101430] = ff0000000000001e, %f10 = ff000000 ce844eff
	ldd	[%i4+0x030],%f10	! %f10 = ff000000 0000001e
!	Mem[0000000010041408] = 00220026, %l0 = 7468aeb036e368e8
	lduha	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000026
!	Starting 10 instruction Store Burst
!	Mem[0000000010141409] = 00000000, %l5 = 0000000000000027
	ldstuba	[%i5+0x009]%asi,%l5	! %l5 = 00000000000000ff

p0_label_150:
!	Mem[0000000010181408] = 00000000, %l7 = d003a0ffffffffff
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%f6  = 260d69f2 835bb353, Mem[00000000100c1400] = ff597600 ffffffff
	stda	%f6 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 260d69f2 835bb353
!	Mem[0000000010001400] = ff000000, %l0 = 0000000000000026
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000300c1408] = d003a0ffff617eff
	stxa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030141400] = 000003d0
	stwa	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stba	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010141400] = 00000000
	stha	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000030181410] = 00000000, %l1 = ff7e61ffffa003d0
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%f5  = ffa003d0, %f14 = 00000000, %f8  = f1ffffff d2ab68ff
	fsmuld	%f5 ,%f14,%f8 		! %f8  = fffc007a 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff0000ff210bd003, %l6 = 00000000000000d0
	ldxa	[%i2+%o4]0x89,%l6	! %l6 = ff0000ff210bd003

p0_label_151:
!	Mem[0000000010041410] = 4e597600, %l5 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = d003a0ff ffffffff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 00000000ffffffff 00000000d003a0ff
!	Mem[0000000010101410] = ff000085ffff0000, %f28 = 775261c6 d003a0ff
	ldda	[%i4+%o5]0x88,%f28	! %f28 = ff000085 ffff0000
!	Mem[0000000010081408] = 00ffffff, %l1 = 00000000d003a0ff
	lduba	[%i2+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001420] = ff68abd2, %l3 = ffffffffffffffff
	lduha	[%i0+0x020]%asi,%l3	! %l3 = 000000000000ff68
!	Mem[0000000030101400] = 7594537a, %l3 = 000000000000ff68
	lduwa	[%i4+%g0]0x81,%l3	! %l3 = 000000007594537a
!	Mem[0000000030141410] = ff000000, %l1 = 00000000000000ff
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081400] = 1e7e61ff, %l1 = ffffffffffffffff
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 00000000000061ff
!	Mem[0000000010001404] = ffffffff, %l0 = 00000000ffffffff
	lduh	[%i0+0x006],%l0		! %l0 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f31 = bb4227e5, %f14 = 00000000, %f27 = ed5fa07b
	fdivs	%f31,%f14,%f27		! %f27 = ff800000

p0_label_152:
!	%f13 = 835bb353, Mem[0000000010001400] = ff0000ff
	sta	%f13,[%i0+%g0]0x80	! Mem[0000000010001400] = 835bb353
!	%l7 = 0000000000000000, Mem[0000000030101400] = 7594537a
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Mem[0000000030181410] = ff000000, %l1 = 00000000000061ff
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	%f26 = 74d5d720 ff800000, %l4 = 0000000000000000
!	Mem[0000000010081428] = d3332db5ffffffff
	add	%i2,0x028,%g1
	stda	%f26,[%g1+%l4]ASI_PST16_P ! Mem[0000000010081428] = d3332db5ffffffff
!	%f16 = ff7e61ff ffa003d0, %l1 = 00000000ff000000
!	Mem[0000000030081408] = 03d00b21ff0000ff
	add	%i2,0x008,%g1
	stda	%f16,[%g1+%l1]ASI_PST16_S ! Mem[0000000030081408] = 03d00b21ff0000ff
!	%l1 = 00000000ff000000, Mem[0000000010041410] = 0076594e
	stb	%l1,[%i1+%o5]		! Mem[0000000010041410] = 0076594e
!	%l6 = ff0000ff210bd003, Mem[0000000010081400] = 850000001e7e61ff
	stxa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ff0000ff210bd003
!	Mem[0000000020800000] = ffffaff8, %l0 = 000000000000ffff
	ldstub	[%o1+%g0],%l0		! %l0 = 000000ff000000ff
!	%l3 = 000000007594537a, Mem[0000000010081400] = 210bd003
	stwa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 7594537a
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 0076594effff0000, %l3 = 000000007594537a
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = 0076594effff0000

p0_label_153:
!	Mem[0000000010041400] = ff000000, %l7 = 0000000000000000
	ldsha	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 00000000 00000000, %l2 = 01000000, %l3 = ffff0000
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030101400] = 00000000, %f12 = 260d69f2
	lda	[%i4+%g0]0x89,%f12	! %f12 = 00000000
!	Mem[0000000030041400] = 00000000, %l3 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = a6ff1b53, %l0 = 00000000000000ff
	ldsh	[%o0+%g0],%l0		! %l0 = ffffffffffffa6ff
!	Mem[00000000300c1400] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181400] = ff617eff, %l6 = ff0000ff210bd003
	ldswa	[%i6+%g0]0x89,%l6	! %l6 = ffffffffff617eff
!	Mem[00000000300c1410] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010041410] = 0000ffff4e597600
	stxa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000000000ff

p0_label_154:
!	%l2 = 0000000000000000, Mem[00000000201c0000] = a6ff1b53
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 00001b53
!	%f0  = ff000000 67186f7c 000000cb 1b7071a6
!	%f4  = ff7e61ff ffa003d0 260d69f2 835bb353
!	%f8  = fffc007a 00000000 ff000000 0000001e
!	%f12 = 00000000 835bb353 00000000 0000d003
	stda	%f0,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	%f0  = ff000000 67186f7c 000000cb 1b7071a6
!	%f4  = ff7e61ff ffa003d0 260d69f2 835bb353
!	%f8  = fffc007a 00000000 ff000000 0000001e
!	%f12 = 00000000 835bb353 00000000 0000d003
	stda	%f0,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400
!	Mem[0000000010101408] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000030001400] = d4584a05d003a0ff
	stxa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000000000ff
!	Mem[00000000201c0000] = 00001b53, %l5 = 00000000000000ff
	ldstub	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = ff000000, %l1 = 00000000ff000000
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000020800041] = 594ee56e, %l2 = 0000000000000000
	ldstub	[%o1+0x041],%l2		! %l2 = 0000004e000000ff
!	%f22 = ff000000, Mem[0000000010101410] = ffff0000
	sta	%f22,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = fffffff1, %l2 = 000000000000004e
	ldsb	[%i0+0x025],%l2		! %l2 = ffffffffffffffff

p0_label_155:
!	%l3 = 00000000000000ff, imm = 0000000000000a98, %l4 = 0000000000000000
	sub	%l3,0xa98,%l4		! %l4 = fffffffffffff667
!	Mem[00000000100c142c] = ed5fa07b, %f27 = ff800000
	ld	[%i3+0x02c],%f27	! %f27 = ed5fa07b
!	Mem[0000000030001408] = 00000000 ff000000, %l6 = ff617eff, %l7 = 000000ff
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[0000000030101410] = ff00ff00, %l7 = 00000000ff000000
	ldswa	[%i4+%o5]0x89,%l7	! %l7 = ffffffffff00ff00
!	Mem[0000000030081400] = 00000000 000000ff, %l6 = 00000000, %l7 = ff00ff00
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000030001400] = ff00000000000000, %l0 = ffffffffffffa6ff
	ldxa	[%i0+%g0]0x81,%l0	! %l0 = ff00000000000000
!	Mem[0000000010101400] = 0000000000000000, %l4 = fffffffffffff667
	ldxa	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 000000ff, %l2 = ffffffffffffffff
	ldsba	[%i5+%o5]0x88,%l2	! %l2 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010181400] = e5ff6728, %l6 = 00000000000000ff
	lduha	[%i6+%g0]0x88,%l6	! %l6 = 0000000000006728
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010041408] = a671701bcb000000
	stxa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000

p0_label_156:
!	Mem[0000000010181410] = ff000000, %l1 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x010]%asi,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010001400] = 53b35b83, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 0000000053b35b83
!	Mem[000000001014141c] = 00000075, %l7 = 00000000, %l6 = 00006728
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 0000000000000075
!	Mem[0000000010141420] = ffffffff, %l7 = 0000000000000000, %asi = 80
	swapa	[%i5+0x020]%asi,%l7	! %l7 = 00000000ffffffff
!	%l5 = 0000000053b35b83, Mem[0000000030081408] = 210bd003
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 53b35b83
!	%f4  = ff7e61ff ffa003d0, Mem[0000000010141410] = 000000ff 18d3278a
	stda	%f4 ,[%i5+%o5]0x88	! Mem[0000000010141410] = ff7e61ff ffa003d0
!	%l0 = ff00000000000000, Mem[0000000030001410] = 00000000d003a000
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = ff00000000000000
!	%l2 = ffffffffffffffff, Mem[0000000010101418] = ff606077e5f4aea1
	stx	%l2,[%i4+0x018]		! Mem[0000000010101418] = ffffffffffffffff
!	Mem[0000000030141408] = ff00ffff, %l7 = 00000000ffffffff
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = a671701b, %l0 = ff00000000000000
	ldsha	[%i6+0x032]%asi,%l0	! %l0 = 000000000000701b

p0_label_157:
!	Mem[0000000030181410] = d003a0ff, %l0 = 000000000000701b
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = ffffffffffffffd0
!	Mem[00000000300c1410] = 000000ff, %l7 = 00000000000000ff
	ldsba	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041400] = 0000000000000000, %f26 = 74d5d720 ed5fa07b
	ldda	[%i1+%g0]0x81,%f26	! %f26 = 00000000 00000000
!	Mem[0000000010041438] = 00000000, %l1 = 00000000ff000000
	ldsba	[%i1+0x038]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = ff001b53, %l4 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000ff00
!	Mem[000000001000141c] = e5ff6728, %l1 = 0000000000000000
	ldub	[%i0+0x01e],%l1		! %l1 = 0000000000000067
!	%f6  = 260d69f2, %f1  = 67186f7c, %f6  = 260d69f2
	fmuls	%f6 ,%f1 ,%f6 		! %f6  = 4da868fa
!	Mem[00000000300c1410] = ff000000, %l1 = 0000000000000067
	lduwa	[%i3+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010081408] = ffffff0000000000, %f30 = 1e7e61c6 bb4227e5
	ldda	[%i2+%o4]0x80,%f30	! %f30 = ffffff00 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181420] = 1e7e61ffffa003d0, %l5 = 0000000053b35b83, %l1 = 00000000ff000000
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 1e7e61ffffa003d0

p0_label_158:
!	%f0  = ff000000 67186f7c, Mem[0000000030141400] = 00000000 00000000
	stda	%f0 ,[%i5+%g0]0x89	! Mem[0000000030141400] = ff000000 67186f7c
!	Mem[0000000010001410] = ffffffff, %l6 = 0000000000000075
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000ffffffff
!	%f18 = bb4227e5 00000000, %l0 = ffffffffffffffd0
!	Mem[00000000300c1420] = ff617e1e4e5976ff
	add	%i3,0x020,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_S ! Mem[00000000300c1420] = ff617e1e4e5976ff
!	%f0  = ff000000 67186f7c, Mem[00000000300c1408] = 00000000 00000000
	stda	%f0 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff000000 67186f7c
!	Mem[00000000201c0001] = ff001b53, %l5 = 0000000053b35b83
	ldstub	[%o0+0x001],%l5		! %l5 = 00000000000000ff
!	%f24 = 97f10c32 000000ff, Mem[0000000010001410] = 75000000 ffa003d0
	stda	%f24,[%i0+%o5]0x80	! Mem[0000000010001410] = 97f10c32 000000ff
!	%f14 = 00000000 0000d003, Mem[0000000030141408] = ff00ffff ffffffff
	stda	%f14,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000 0000d003
!	Mem[0000000030141408] = 00000000, %l1 = 1e7e61ffffa003d0
	swapa	[%i5+%o4]0x81,%l1	! %l1 = 0000000000000000
!	%l6 = 00000000ffffffff, Mem[0000000010081408] = ffffff0000000000, %asi = 80
	stxa	%l6,[%i2+0x008]%asi	! Mem[0000000010081408] = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000, %l5 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000

p0_label_159:
!	Mem[0000000010081418] = d1190000, %l6 = 00000000ffffffff
	lduwa	[%i2+0x018]%asi,%l6	! %l6 = 00000000d1190000
!	Mem[0000000030101400] = 00000000, %l1 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = ff000000 67186f7c, %l4 = 0000ff00, %l5 = 00000000
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 0000000067186f7c 00000000ff000000
!	Mem[0000000010141410] = d003a0ffff617eff, %l3 = 00000000000000ff
	ldx	[%i5+%o5],%l3		! %l3 = d003a0ffff617eff
!	Mem[0000000030101410] = ff00ff00, %l6 = 00000000d1190000
	lduha	[%i4+%o5]0x89,%l6	! %l6 = 000000000000ff00
!	%l4 = 0000000067186f7c, Mem[00000000300c1410] = ff000000
	stha	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 6f7c0000
!	Mem[0000000010181410] = ff000000, %l4 = 0000000067186f7c
	ldsha	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l0 = ffffffffffffffd0
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = ca000000 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000 00000000ca000000
!	Starting 10 instruction Store Burst
!	%f10 = ff000000 0000001e, %l4 = 0000000000000000
!	Mem[0000000030141420] = ff96f4db82c2da69
	add	%i5,0x020,%g1
	stda	%f10,[%g1+%l4]ASI_PST16_S ! Mem[0000000030141420] = ff96f4db82c2da69

p0_label_160:
!	Mem[0000000010141408] = 0000ff00, %l7 = ffffffffffffffff
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 000000000000ff00
!	%f31 = 00000000, Mem[0000000030181408] = 1b7071a6
	sta	%f31,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%l3 = d003a0ffff617eff, Mem[0000000010101408] = ffffffff
	stwa	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = ff617eff
!	%f2  = 000000cb, Mem[00000000100c1410] = 8a27d318
	sta	%f2 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000cb
!	%l6 = 000000000000ff00, Mem[00000000201c0001] = ffff1b53
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = ff001b53
!	Mem[0000000010041420] = fffc007a, %l6 = 0000ff00, %l4 = 00000000
	add	%i1,0x20,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000fffc007a
!	%l5 = 00000000ff000000, Mem[0000000030081408] = 53b35b83
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000000
!	%f0  = ff000000 67186f7c, Mem[00000000300c1408] = 67186f7c ff000000
	stda	%f0 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff000000 67186f7c
!	%f3  = 1b7071a6, Mem[0000000010181408] = ff000000
	sta	%f3 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 1b7071a6
!	Starting 10 instruction Load Burst
!	Mem[0000000010001414] = 000000ff, %l3 = d003a0ffff617eff
	ldsb	[%i0+0x016],%l3		! %l3 = 0000000000000000

p0_label_161:
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000030001400] = ff000000 00000000 00000000 ff000000
!	Mem[0000000030001410] = 00000000 000000ff 046279b8 a0f0cd14
!	Mem[0000000030001420] = 9a031f0a 626377fa 0aaf40f1 ffffff7f
!	Mem[0000000030001430] = 46a78731 a35aa749 e7e33264 85eb95f9
	ldda	[%i0]ASI_BLK_SL,%f0	! Block Load from 0000000030001400
!	Mem[0000000030101408] = 00000000, %f21 = 000000ff
	lda	[%i4+%o4]0x89,%f21	! %f21 = 00000000
!	Mem[0000000010101408] = ff617eff, %l3 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001408] = ff7e61ffffa003d0, %f18 = bb4227e5 00000000
	ldda	[%i0+%o4]0x80,%f18	! %f18 = ff7e61ff ffa003d0
!	Mem[0000000030101408] = 00000000, %f22 = ff000000
	lda	[%i4+%o4]0x81,%f22	! %f22 = 00000000
!	Code Fragment 4
p0_fragment_10:
!	%l0 = 0000000000000000
	setx	0x974edca0772785cd,%g7,%l0 ! %l0 = 974edca0772785cd
!	%l1 = 00000000ca000000
	setx	0xa48b9d0878743a92,%g7,%l1 ! %l1 = a48b9d0878743a92
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 974edca0772785cd
	setx	0x1284982ff68cd68b,%g7,%l0 ! %l0 = 1284982ff68cd68b
!	%l1 = a48b9d0878743a92
	setx	0x6360bd6fd12aff77,%g7,%l1 ! %l1 = 6360bd6fd12aff77
!	Mem[0000000010141424] = a35aa749, %l6 = 000000000000ff00
	ldub	[%i5+0x024],%l6		! %l6 = 00000000000000a3
!	Mem[00000000300c1410] = 82e73f1e00007c6f, %l0 = 1284982ff68cd68b
	ldxa	[%i3+%o5]0x89,%l0	! %l0 = 82e73f1e00007c6f
!	Mem[0000000010081408] = 00000000, %l5 = 00000000ff000000
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00007c6f, %l1 = d12aff77, Mem[0000000030181408] = 00000000 cb000000
	stda	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00007c6f d12aff77

p0_label_162:
!	Mem[0000000030001400] = 000000ff, %l4 = 00000000fffc007a
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010001404] = ffffffff, %l7 = 0000ff00, %l6 = 000000a3
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 00000000ffffffff
!	%l0 = 00007c6f, %l1 = d12aff77, Mem[0000000030181400] = 7c6f1867 000000ff
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 00007c6f d12aff77
!	%l5 = 0000000000000000, Mem[00000000300c1400] = ff0000002ad800ff
	stxa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l0 = 82e73f1e00007c6f
	swapa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f29 = ffff0000, Mem[0000000010041408] = 00000000
	sta	%f29,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff0000
!	%l4 = 0000000000000000, Mem[0000000010041408] = 0000ffff
	stba	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000ffff
!	Mem[0000000010041410] = ff7e61ff, %l1 = 6360bd6fd12aff77
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000ff7e61ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l7 = 000000000000ff00
	ldswa	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_163:
!	Mem[0000000010141410] = d003a0ff, %l7 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l7	! %l7 = ffffffffd003a0ff
!	Mem[0000000010041400] = 000000ff, %l2 = ffffffffffffffff
	ldswa	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %l7 = ffffffffd003a0ff
	lduh	[%i4+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000030041408] = ff00000000000000, %l1 = 00000000ff7e61ff
	ldxa	[%i1+%o4]0x81,%l1	! %l1 = ff00000000000000
!	Mem[0000000030181400] = 6f7c0000, %l6 = 00000000ffffffff
	ldswa	[%i6+%g0]0x89,%l6	! %l6 = 000000006f7c0000
!	Mem[0000000030081408] = ff000000, %l7 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141430] = 1fff457c9fd8fddb, %f22 = 00000000 67186f7c
	ldd	[%i5+0x030],%f22	! %f22 = 1fff457c 9fd8fddb
!	Mem[0000000030141408] = d003a0ff, %l7 = 0000000000000000
	ldsba	[%i5+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1424] = ffffffff, %l7 = ffffffffffffffff
	lduha	[%i3+0x026]%asi,%l7	! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 000000ff 000000ff 00000000
!	%f4  = ff000000 00000000 14cdf0a0 b8796204
!	%f8  = fa776362 0a1f039a 7fffffff f140af0a
!	%f12 = 49a75aa3 3187a746 f995eb85 6432e3e7
	stda	%f0,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400

p0_label_164:
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010001404] = 00000000, %l3 = 000000ff, %l2 = 000000ff
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l3,%l2	! %l2 = 0000000000000000
!	%f18 = ff7e61ff ffa003d0, Mem[00000000100c1428] = 0349e050 ed5fa07b
	stda	%f18,[%i3+0x028]%asi	! Mem[00000000100c1428] = ff7e61ff ffa003d0
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010141410] = d003a0ff ff617eff
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 00000000
!	%l2 = 0000000000000000, Mem[0000000030081408] = 000000ff
	stwa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%f22 = 1fff457c 9fd8fddb, Mem[0000000030081408] = 00000000 ff0000ff
	stda	%f22,[%i2+%o4]0x81	! Mem[0000000030081408] = 1fff457c 9fd8fddb
!	Mem[0000000030181408] = 6f7c0000, %l1 = ff00000000000000
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 000000006f7c0000
!	Mem[0000000010141400] = 00007c6f, %l0 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000007c6f
!	%l3 = 00000000000000ff, Mem[0000000030101408] = 00000000
	stba	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000
!	%f13 = 3187a746, Mem[0000000010081404] = ff0000ff
	st	%f13,[%i2+0x004]	! Mem[0000000010081404] = 3187a746
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff617eff, %l1 = 000000006f7c0000
	ldsha	[%i4+%o4]0x88,%l1	! %l1 = 0000000000007eff

p0_label_165:
!	Mem[0000000010101400] = 00000000, %l2 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 000000ff00000000, %f2  = 000000ff 00000000
	ldda	[%i0+%o4]0x88,%f2 	! %f2  = 000000ff 00000000
!	Mem[00000000211c0000] = 7e1e37e1, %l5 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 000000000000001e
!	Mem[0000000010101400] = 00000000, %l6 = 000000006f7c0000
	ldsba	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = ffa003ff, %f13 = 3187a746
	lda	[%i2+%o5]0x88,%f13	! %f13 = ffa003ff
!	Mem[0000000010041400] = 000000ff, %l3 = 00000000000000ff
	ldsba	[%i1+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1410] = cb000000, %l5 = 000000000000001e
	lduha	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = ffa003d0, %l1 = 0000000000007eff
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffffffa0
!	Mem[00000000218000c0] = 00008436, %l4 = 0000000000000000
	ldub	[%o3+0x0c1],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 00000000, %l4 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000

p0_label_166:
!	%f17 = ffa003d0, Mem[0000000010101400] = 00000000
	sta	%f17,[%i4+%g0]0x88	! Mem[0000000010101400] = ffa003d0
!	%f31 = 00000000, Mem[0000000010001400] = 000000ff
	sta	%f31,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%l4 = 0000000000000000, Mem[00000000201c0000] = ff001b53, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00001b53
!	Mem[0000000010141400] = 00000000, %l0 = 0000000000007c6f
	ldstuba	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[00000000211c0000] = 7e1e37e1
	stb	%l3,[%o2+%g0]		! Mem[00000000211c0000] = ff1e37e1
!	Mem[0000000030081410] = ff000000, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 00000000ff000000
!	%f25 = 000000ff, Mem[0000000030081410] = 00000000
	sta	%f25,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff
!	Mem[0000000010181408] = 1b7071a6, %l0 = 00000000, %l5 = 00000000
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 000000001b7071a6
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l2 = 0000000000000000
	lduha	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000

p0_label_167:
!	Mem[0000000010081430] = de9b58ca, %l7 = 000000000000ffff
	lduba	[%i2+0x031]%asi,%l7	! %l7 = 000000000000009b
!	Mem[0000000030141408] = ffa003d0, %l2 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l2	! %l2 = 00000000ffa003d0
!	Mem[0000000010101410] = 000000ff, %l0 = 0000000000000000
	lduba	[%i4+0x011]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = 00000000000000ff, %f30 = ffffff00 00000000
	ldda	[%i0+%o5]0x80,%f30	! %f30 = 00000000 000000ff
!	%f3  = 00000000, %f0  = 00000000
	fsqrts	%f3 ,%f0 		! %f0  = 00000000
!	Mem[0000000030081410] = ff000000, %f29 = ffff0000
	lda	[%i2+%o5]0x89,%f29	! %f29 = ff000000
	membar	#Sync			! Added by membar checker (26)
!	Mem[00000000100c1400] = 260d69f2 835bb353 ff000000 0000004f
!	Mem[00000000100c1410] = 000000cb ff000000 4e5976ff ff00ff00
!	Mem[00000000100c1420] = ffffffff ffffffff ff7e61ff ffa003d0
!	Mem[00000000100c1430] = 000000ff 776060ff 6e2dcd72 bb4227e5
	ldda	[%i3]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000030141400] = 7c6f1867, %l4 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l4	! %l4 = 0000000000007c6f
!	Mem[0000000010181400] = 2867ffe5, %f3  = 00000000
	lda	[%i6+%g0]0x80,%f3 	! %f3 = 2867ffe5
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff000000, Mem[0000000030141408] = d003a0ff
	stba	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = d003a000

p0_label_168:
!	%l5 = 000000001b7071a6, Mem[0000000030181410] = ffa003d0
	stwa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 1b7071a6
!	%f14 = f995eb85 6432e3e7, %l6 = 00000000ff000000
!	Mem[0000000030081420] = 7e1813164e5976b4
	add	%i2,0x020,%g1
	stda	%f14,[%g1+%l6]ASI_PST8_S ! Mem[0000000030081420] = 7e1813164e5976b4
!	%f14 = f995eb85 6432e3e7, Mem[0000000010141410] = 00000000 00000000
	stda	%f14,[%i5+%o5]0x80	! Mem[0000000010141410] = f995eb85 6432e3e7
!	%l3 = ffffffffffffffff, Mem[0000000030041400] = 00000000
	stba	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = ff000000
!	Mem[0000000020800000] = ffffaff8, %l0 = 0000000000000000
	ldstub	[%o1+%g0],%l0		! %l0 = 000000ff000000ff
!	%l2 = 00000000ffa003d0, Mem[0000000021800100] = d3181701, %asi = 80
	stba	%l2,[%o3+0x100]%asi	! Mem[0000000021800100] = d0181701
!	Mem[0000000010181410] = ff0000ff, %l0 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%f12 = 49a75aa3 ffa003ff, %l3 = ffffffffffffffff
!	Mem[0000000030041430] = f1b5ec408c647f34
	add	%i1,0x030,%g1
	stda	%f12,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030041430] = ff03a0ffa35aa749
!	%l2 = ffa003d0, %l3 = ffffffff, Mem[00000000300c1400] = 00000000 00000000
	stda	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffa003d0 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = 00000000, %l6 = 00000000ff000000
	ldsh	[%i5+0x022],%l6		! %l6 = 0000000000000000

p0_label_169:
!	Mem[0000000030141410] = 000000ff, %l3 = ffffffffffffffff
	lduwa	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101400] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i4+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = ff617eff, %l2 = 00000000ffa003d0
	lduwa	[%i4+%o4]0x88,%l2	! %l2 = 00000000ff617eff
!	Mem[0000000030081400] = ff000000, %f2  = 000000ff
	lda	[%i2+%g0]0x81,%f2 	! %f2 = ff000000
!	Mem[0000000030141410] = ff000000, %l2 = 00000000ff617eff
	lduha	[%i5+%o5]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010101410] = ff000085 ff000000, %l0 = 000000ff, %l1 = ffffffa0
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 00000000ff000000 00000000ff000085
!	Mem[0000000010081408] = 00000000, %l1 = 00000000ff000085
	ldswa	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = ff00000000000000, %f10 = 7fffffff f140af0a
	ldda	[%i1+%o4]0x81,%f10	! %f10 = ff000000 00000000
!	Mem[0000000010001408] = 00000000, %l1 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = 49a75aa3 ffa003ff, Mem[0000000030141410] = ff000000 ffffffff
	stda	%f12,[%i5+%o5]0x81	! Mem[0000000030141410] = 49a75aa3 ffa003ff

p0_label_170:
!	Mem[0000000030001410] = 00000000, %l2 = 000000000000ff00
	swapa	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081428] = d3332db5, %l1 = 00000000, %l2 = 00000000
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 00000000d3332db5
!	%l7 = 000000000000009b, Mem[0000000030101408] = 000000ff
	stba	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000009b
!	%l0 = 00000000ff000000, Mem[00000000211c0001] = ff1e37e1, %asi = 80
	stba	%l0,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff0037e1
!	Mem[0000000010101400] = ffa003d0, %l1 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l1	! %l1 = 000000d0000000ff
!	%l2 = 00000000d3332db5, Mem[0000000010141400] = ff000000
	stha	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 2db50000
!	Mem[00000000300c1410] = 00007c6f, %l2 = 00000000d3332db5
	ldstuba	[%i3+%o5]0x89,%l2	! %l2 = 0000006f000000ff
!	Mem[0000000010141410] = f995eb85, %l2 = 000000000000006f
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 00000000f995eb85
!	%l0 = 00000000ff000000, Mem[0000000030101410] = 00ff00ff
	stha	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00001b53, %l0 = 00000000ff000000
	ldsh	[%o0+%g0],%l0		! %l0 = 0000000000000000

p0_label_171:
!	%l6 = 0000000000000000, Mem[0000000030181410] = a671701b
	stwa	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	Mem[0000000030101410] = ff000000, %l2 = 00000000f995eb85
	lduwa	[%i4+%o5]0x89,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010141400] = 2db50000, %l5 = 000000001b7071a6
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 0000002d000000ff
!	Mem[00000000100c1410] = 000000cbff000000, %f4  = ff000000 00000000
	ldda	[%i3+%o5]0x80,%f4 	! %f4  = 000000cb ff000000
!	Mem[0000000010001408] = 00000000, %l2 = 00000000ff000000
	lduha	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = ff000000 00000000, %l6 = 00000000, %l7 = 0000009b
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000030141400] = 67186f7c, %l7 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l7	! %l7 = 000000000000007c
!	Mem[00000000300c1410] = ff7c0000, %l0 = 0000000000000000
	lduwa	[%i3+%o5]0x81,%l0	! %l0 = 00000000ff7c0000
!	Mem[0000000030101400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001010141c] = ffffffff, %l6 = ff000000, %l6 = ff000000
	add	%i4,0x1c,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 00000000ffffffff

p0_label_172:
!	Mem[0000000030141410] = 49a75aa3, %l4 = 0000000000007c6f
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 00000049000000ff
!	Mem[0000000010181424] = ffa003d0, %l6 = 00000000ffffffff
	ldstuba	[%i6+0x024]%asi,%l6	! %l6 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000030041410] = ddd3e8ff
	stha	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = ddd30000
!	%l6 = 00000000000000ff, Mem[0000000030181408] = 00000000
	stba	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	%l0 = 00000000ff7c0000, Mem[00000000211c0000] = ff0037e1
	sth	%l0,[%o2+%g0]		! Mem[00000000211c0000] = 000037e1
!	%l3 = 0000000000000000, Mem[0000000030041410] = 0000d3dddbb17080
	stxa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030181410] = 00000000
	stba	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	Mem[0000000010081418] = d1190000, %l4 = 0000000000000049
	ldstub	[%i2+0x018],%l4		! %l4 = 000000d1000000ff
!	%l2 = 0000000000000000, Mem[0000000010101410] = ff000000
	stba	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff7e61ff00000000, %f2  = ff000000 2867ffe5
	ldda	[%i6+%o5]0x89,%f2 	! %f2  = ff7e61ff 00000000

p0_label_173:
!	Mem[00000000100c1410] = 000000cb, %l6 = 00000000000000ff
	ldsha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l4 = 00000000000000d1
	lduba	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001408] = 00000000ff000000, %l0 = 00000000ff7c0000
	ldxa	[%i0+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010101408] = ff7e61ff 00000b21, %l0 = ff000000, %l1 = 000000d0
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 00000000ff7e61ff 0000000000000b21
!	Mem[0000000010081408] = 00000000, %l0 = 00000000ff7e61ff
	lduha	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 7c6f1867, %f14 = f995eb85
	lda	[%i5+%g0]0x81,%f14	! %f14 = 7c6f1867
!	Mem[0000000010041408] = ffff0000, %l5 = 000000000000002d
	ldsba	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 1b7071a6, %l6 = 0000000000000000
	ldsw	[%i6+%o4],%l6		! %l6 = 000000001b7071a6
!	Mem[0000000030081408] = 1fff457c, %l1 = 0000000000000b21
	lduha	[%i2+%o4]0x81,%l1	! %l1 = 0000000000001fff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff

p0_label_174:
!	%l2 = 0000000000000000, Mem[0000000030001408] = 00000000
	stha	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	Mem[0000000030181408] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010141420] = 00000000a35aa749, %l7 = 000000000000007c, %l5 = 0000000000000000
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = 00000000a35aa749
!	Mem[00000000211c0001] = 000037e1, %l6 = 000000001b7071a6
	ldstub	[%o2+0x001],%l6		! %l6 = 00000000000000ff
!	%l4 = 000000ff, %l5 = a35aa749, Mem[0000000010081410] = ff03a0ff 00000000
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff a35aa749
!	%l6 = 0000000000000000, Mem[0000000030001400] = 000000ff
	stha	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000030001408] = 000000ff00000000
	stxa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000000000ff
!	Mem[0000000030081400] = 000000ff, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%f23 = ff76594e, Mem[0000000030081410] = ff000000
	sta	%f23,[%i2+%o5]0x89	! Mem[0000000030081410] = ff76594e
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 000000ff00000000, %l2 = 00000000000000ff
	ldxa	[%i0+%o4]0x88,%l2	! %l2 = 000000ff00000000

p0_label_175:
!	Mem[0000000030001410] = 00ff0000, %l6 = 00000000000000ff
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 0000009b, %l7 = 000000000000007c
	ldsha	[%i4+%o4]0x89,%l7	! %l7 = 000000000000009b
!	Mem[00000000300c1410] = ff7c0000, %l7 = 000000000000009b
	ldsba	[%i3+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000201c0000] = 00001b53, %l3 = 0000000000000000
	lduh	[%o0+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000010081408] = 000000ff, %l2 = 000000ff00000000
	lduwa	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081400] = 0000000000000000, %f4  = 000000cb ff000000
	ldda	[%i2+%g0]0x89,%f4 	! %f4  = 00000000 00000000
!	Mem[0000000030041400] = ff000000, %l0 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030041400] = 00000000 000000ff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000010101408] = ff7e61ff00000b21, %l7 = ffffffffffffffff
	ldxa	[%i4+%o4]0x80,%l7	! %l7 = ff7e61ff00000b21
!	Starting 10 instruction Store Burst
!	%f24 = ffffffff ffffffff, Mem[0000000030041400] = ff000000 00000000
	stda	%f24,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff ffffffff

p0_label_176:
!	Mem[0000000030001410] = 00ff0000, %l7 = ff7e61ff00000b21
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101438] = 7d1eff40, %l3 = 0000000000000000
	swap	[%i4+0x038],%l3		! %l3 = 000000007d1eff40
!	%l0 = ffffffffff000000, Mem[00000000201c0000] = 00001b53, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00001b53
!	Mem[0000000030081408] = 7c45ff1f, %f16 = 53b35b83
	lda	[%i2+%o4]0x89,%f16	! %f16 = 7c45ff1f
!	%l4 = 00000000000000ff, Mem[0000000010181410] = ff0000ff
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff
!	%l4 = 00000000000000ff, Mem[0000000010181406] = d2ab68ff, %asi = 80
	stba	%l4,[%i6+0x006]%asi	! Mem[0000000010181404] = d2abffff
!	%l2 = 00000000000000ff, Mem[00000000201c0000] = 00001b53
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 00ff1b53
!	Mem[0000000010001400] = 00000000, %l1 = 0000000000001fff
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 7d1eff40, Mem[0000000030081400] = 00000000 00000000
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff 7d1eff40
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 1b7071a6, %l2 = 00000000000000ff
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = 000000000000001b

p0_label_177:
!	Mem[00000000300c1408] = 7c6f1867, %l6 = 00000000000000ff
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 000000007c6f1867
!	Mem[0000000010141400] = 0000b5ff, %l2 = 000000000000001b
	lduba	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141408] = ffffffff, %l2 = 00000000000000ff
	lduba	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181408] = 000000ff, %f2  = ff7e61ff
	lda	[%i6+%o4]0x89,%f2 	! %f2 = 000000ff
!	Mem[0000000010081400] = 7594537a, %l0 = ffffffffff000000
	ldsba	[%i2+%g0]0x88,%l0	! %l0 = 000000000000007a
!	Mem[0000000010041410] = d12aff77ffa003d0, %f2  = 000000ff 00000000
	ldd	[%i1+%o5],%f2 		! %f2  = d12aff77 ffa003d0
!	Mem[0000000030141410] = a35aa7ff, %l4 = 00000000000000ff
	ldsba	[%i5+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = 0000b5ff, %l2 = 00000000000000ff
	ldswa	[%i5+%g0]0x88,%l2	! %l2 = 000000000000b5ff
!	Mem[0000000010101410] = ff000000, %l4 = ffffffffffffffff
	lduha	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 000000007d1eff40, Mem[0000000010181410] = 000000ff
	stba	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 400000ff

p0_label_178:
!	Mem[0000000021800040] = cf09f702, %l4 = 0000000000000000
	ldstuba	[%o3+0x040]%asi,%l4	! %l4 = 000000cf000000ff
!	%l6 = 000000007c6f1867, Mem[0000000010141408] = ffffffff
	stha	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = ffff1867
!	%l2 = 000000000000b5ff, %l7 = 0000000000000000, %l3 = 000000007d1eff40
	and	%l2,%l7,%l3		! %l3 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	%l6 = 000000007c6f1867, Mem[0000000010181400] = 2867ffe5
	stba	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 6767ffe5
!	Mem[0000000010101400] = ffa003ff, %l3 = 00000000ff000000
	ldstuba	[%i4+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l2 = 000000000000b5ff, Mem[0000000030181408] = 000000ff
	stha	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000b5ff
!	%l6 = 000000007c6f1867, Mem[0000000030041400] = ffffffff
	stba	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffff67
	membar	#Sync			! Added by membar checker (27)
!	%l0 = 000000000000007a, Mem[00000000100c1408] = ff0000000000004f
	stxa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000000000007a
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000085ff000000, %l4 = 00000000000000cf
	ldxa	[%i4+%o5]0x88,%l4	! %l4 = ff000085ff000000

p0_label_179:
!	Mem[000000001010142c] = 4e5976b4, %l2 = 000000000000b5ff
	lduh	[%i4+0x02e],%l2		! %l2 = 00000000000076b4
!	Mem[0000000010081408] = 00000000, %l5 = 00000000a35aa749
	ldsha	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = ff000000 00000000, %l6 = 7c6f1867, %l7 = 00000000
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000030001410] = 0000ffff, %l4 = ff000085ff000000
	lduwa	[%i0+%o5]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030041408] = 000000ff, %l3 = 00000000000000ff
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1410] = 000000cb, %l5 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l2 = 00000000000076b4
	lduha	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800000] = ffffaff8, %l4 = 000000000000ffff
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010041430] = 00000000 835bb353, %l6 = ff000000, %l7 = 00000000
	ldd	[%i1+0x030],%l6		! %l6 = 0000000000000000 00000000835bb353
!	Starting 10 instruction Store Burst
!	%f4  = 00000000 00000000, Mem[0000000010181400] = 6767ffe5 d2abffff
	std	%f4 ,[%i6+%g0]	! Mem[0000000010181400] = 00000000 00000000

p0_label_180:
!	Mem[0000000030101408] = 9b000000, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l2	! %l2 = 000000009b000000
!	%f16 = 7c45ff1f f2690d26 4f000000 000000ff
!	%f20 = 000000ff cb000000 00ff00ff ff76594e
!	%f24 = ffffffff ffffffff d003a0ff ff617eff
!	%f28 = ff606077 ff000000 e52742bb 72cd2d6e
	stda	%f16,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	Mem[0000000030141400] = 67186f7c, %l3 = 00000000000000ff
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 0000007c000000ff
!	%f11 = 00000000, Mem[0000000010081408] = 00000000
	sta	%f11,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010001400] = 00000000000000ff
	stxa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	%f13 = ffa003ff, Mem[0000000030041408] = 000000ff
	sta	%f13,[%i1+%o4]0x89	! Mem[0000000030041408] = ffa003ff
!	%l5 = 0000000000000000, Mem[0000000030101408] = 00000000cb000000
	stxa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000
!	%f15 = 6432e3e7, Mem[0000000010101400] = ffa003ff
	sta	%f15,[%i4+%g0]0x88	! Mem[0000000010101400] = 6432e3e7
!	Mem[0000000010101414] = 850000ff, %l2 = 000000009b000000, %asi = 80
	swapa	[%i4+0x014]%asi,%l2	! %l2 = 00000000850000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff76594e, %l5 = 0000000000000000
	ldsha	[%i2+%o5]0x89,%l5	! %l5 = 000000000000594e

p0_label_181:
!	Mem[0000000030041410] = 0000000000000000, %l7 = 00000000835bb353
	ldxa	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 0000ffff, %l4 = 000000000000ffff
	lduba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = 00ff37e1, %l6 = 0000000000000000
	ldsb	[%o2+0x001],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030041410] = 00000000, %l2 = 00000000850000ff
	lduha	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = 0000006f 6432e3e7, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 000000000000006f 000000006432e3e7
!	%f14 = 7c6f1867, %f13 = ffa003ff, %f0  = 00000000
	fadds	%f14,%f13,%f0 		! %f0  = ffe003ff
	membar	#Sync			! Added by membar checker (28)
!	Mem[00000000100c1408] = 0000004f, %l0 = 000000000000007a
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = 000000000000004f
!	Mem[00000000201c0000] = 00ff1b53, %l6 = 000000000000006f
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010141423] = 00000000
	stb	%l6,[%i5+0x023]		! Mem[0000000010141420] = 000000ff

p0_label_182:
!	%l3 = 000000000000007c, %l3 = 000000000000007c, %l3 = 000000000000007c
	udivx	%l3,%l3,%l3		! %l3 = 0000000000000001
!	Mem[0000000010001400] = 00000000, %l7 = 000000006432e3e7
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181410] = 00000000, %l3 = 0000000000000001
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%f8  = fa776362, Mem[0000000010001414] = 000000ff
	sta	%f8 ,[%i0+0x014]%asi	! Mem[0000000010001414] = fa776362
!	Mem[00000000100c1408] = 4f000000, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 000000004f000000
!	%l2 = 4f000000, %l3 = 00000000, Mem[0000000010041400] = ff000000 67186f7c
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 4f000000 00000000
!	Mem[0000000010081418] = ff1900000932356f, %l0 = 000000000000004f, %l4 = 0000000000000000
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = ff1900000932356f
!	%l1 = 0000000000000000, Mem[0000000030001400] = 00000000
	stwa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l6 = 00000000000000ff, Mem[0000000010041410] = 77ff2ad1
	stha	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 77ff00ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 7c6f1867, %l4 = ff1900000932356f
	lduwa	[%i3+%o4]0x81,%l4	! %l4 = 000000007c6f1867

p0_label_183:
!	Mem[00000000300c1408] = 7c6f1867 000000ff, %l4 = 7c6f1867, %l5 = 0000594e
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 000000007c6f1867 00000000000000ff
!	Mem[00000000300c1408] = 7c6f1867, %l2 = 000000004f000000
	ldsba	[%i3+%o4]0x81,%l2	! %l2 = 000000000000007c
!	Mem[0000000010041400] = 0000004f, %l3 = 0000000000000000
	lduba	[%i1+%g0]0x88,%l3	! %l3 = 000000000000004f
!	Mem[0000000010141410] = 6f000000, %f21 = cb000000
	lda	[%i5+%o5]0x88,%f21	! %f21 = 6f000000
!	Mem[0000000010041408] = 0000ffff 00000000, %l0 = 0000004f, %l1 = 00000000
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 000000000000ffff 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l6 = 00000000000000ff
	ldsha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 77ff2ad1 0000b5ff, %l2 = 0000007c, %l3 = 0000004f
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 000000000000b5ff 0000000077ff2ad1
!	Mem[0000000030001400] = 00000000, %l4 = 000000007c6f1867
	ldswa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = 293e0dfb00000000, %f26 = d003a0ff ff617eff
	ldda	[%i4+%g0]0x89,%f26	! %f26 = 293e0dfb 00000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000020800001] = ffffaff8
	stb	%l7,[%o1+0x001]		! Mem[0000000020800000] = ff00aff8

p0_label_184:
!	%f28 = ff606077 ff000000, Mem[0000000030141408] = d003a000 03d00000
	stda	%f28,[%i5+%o4]0x89	! Mem[0000000030141408] = ff606077 ff000000
!	Mem[0000000010101410] = 000000ff, %l4 = 0000000000000000
	ldstub	[%i4+%o5],%l4		! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010081404] = 3187a746, %asi = 80
	stwa	%l4,[%i2+0x004]%asi	! Mem[0000000010081404] = 00000000
!	Mem[0000000030081408] = 7c45ff1f, %l0 = 000000000000ffff
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 0000001f000000ff
!	%l4 = 0000000000000000, Mem[0000000010001422] = 9a031f0a
	sth	%l4,[%i0+0x022]		! Mem[0000000010001420] = 9a030000
!	%f8  = fa776362, Mem[000000001004142c] = 0000001e
	st	%f8 ,[%i1+0x02c]	! Mem[000000001004142c] = fa776362
!	%l4 = 0000000000000000, Mem[0000000010141400] = 0000b5ff
	stwa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010101408] = ff617eff
	stba	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = ff617e00
!	%l3 = 0000000077ff2ad1, Mem[0000000010001432] = 46a78731
	sth	%l3,[%i0+0x032]		! Mem[0000000010001430] = 46a72ad1
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff0000ff, %l4 = 0000000000000000
	ldub	[%i4+0x013],%l4		! %l4 = 00000000000000ff

p0_label_185:
!	%l0 = 000000000000001f, %l1 = 0000000000000000, %y  = 00000000
	sdiv	%l0,%l1,%l6		! Div by zero, %l0 = 000000000000006f
	mov	%l0,%y			! %y = 00000047
!	Mem[0000000020800000] = ff00aff8, %l7 = 0000000000000000
	lduba	[%o1+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = ff000000, %l3 = 0000000077ff2ad1
	lduha	[%i2+%g0]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[0000000030041408] = ff03a0ff, %l1 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	%l6 = 0000000000000000, immed = fffff59c, %y  = 00000047
	sdiv	%l6,-0xa64,%l3		! %l3 = fffffffff92abb18
	mov	%l0,%y			! %y = 00000047
!	Mem[0000000030101408] = 0000000000000000, %f10 = ff000000 00000000
	ldda	[%i4+%o4]0x81,%f10	! %f10 = 00000000 00000000
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 1e7e61ffffff1867, %f28 = ff606077 ff000000
	ldda	[%i5+%o4]0x88,%f28	! %f28 = 1e7e61ff ffff1867
!	Mem[0000000030181400] = 6f7c0000, %l6 = 0000000000000000
	ldsba	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030101408] = 00000000
	stba	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000

p0_label_186:
!	Mem[0000000030041400] = ffffff67, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 00000067000000ff
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000, %asi = 80
	swapa	[%i6+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041434] = 835bb353, %l3 = f92abb18, %l4 = 000000ff
	add	%i1,0x34,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 00000000835bb353
!	%l4 = 00000000835bb353, Mem[0000000010141410] = 6f000000
	stha	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 6f00b353
!	%f28 = 1e7e61ff ffff1867, Mem[00000000100c1410] = 000000ff cb000000
	stda	%f28,[%i3+%o5]0x80	! Mem[00000000100c1410] = 1e7e61ff ffff1867
!	Mem[00000000100c1420] = ffffffff, %l5 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x020]%asi,%l5	! %l5 = 00000000ffffffff
!	%f23 = ff76594e, %f12 = 49a75aa3, %f18 = 4f000000
	fadds	%f23,%f12,%f18		! %f18 = ff76594e
!	%l5 = 00000000ffffffff, %l5 = 00000000ffffffff, %l6 = 0000000000000000
	xor	%l5,%l5,%l6		! %l6 = 0000000000000000
!	%l4 = 00000000835bb353, Mem[0000000030181408] = ffb50000d12aff77
	stxa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000835bb353
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 0000ffff, %l7 = 0000000000000067
	ldsha	[%i0+%o5]0x89,%l7	! %l7 = ffffffffffffffff

p0_label_187:
!	Mem[0000000030001410] = ffff0000, %l3 = fffffffff92abb18
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[00000000300c1400] = ffa003d0, %l6 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l6	! %l6 = 00000000ffa003d0
!	Mem[00000000201c0000] = 00ff1b53, %l1 = ffffffffffffffff
	ldsb	[%o0+0x001],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030041400] = ffffffffffffffff, %f16 = 7c45ff1f f2690d26
	ldda	[%i1+%g0]0x89,%f16	! %f16 = ffffffff ffffffff
!	%l0 = 0000000000000047, %l2 = 000000000000b5ff, %l7  = ffffffffffffffff
	mulx	%l0,%l2,%l7		! %l7 = 00000000003279b9
!	Mem[00000000201c0000] = 00ff1b53, %l7 = 00000000003279b9
	ldub	[%o0+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010081420] = ff606077, %l6 = 00000000ffa003d0
	ldsh	[%i2+0x020],%l6		! %l6 = ffffffffffffff60
!	Mem[0000000030081400] = ff000000, %l6 = ffffffffffffff60
	ldswa	[%i2+%g0]0x81,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010081410] = 000000ff, %l1 = ffffffffffffffff
	lduha	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = ffe003ff, Mem[0000000010101410] = ff0000ff
	sta	%f0 ,[%i4+%o5]0x88	! Mem[0000000010101410] = ffe003ff

p0_label_188:
!	%f4  = 00000000, Mem[000000001018141c] = e5ff8370
	st	%f4 ,[%i6+0x01c]	! Mem[000000001018141c] = 00000000
!	%f30 = e52742bb 72cd2d6e, Mem[0000000010181410] = 400000ff 4e5976ff
	stda	%f30,[%i6+%o5]0x80	! Mem[0000000010181410] = e52742bb 72cd2d6e
!	%l0 = 00000047, %l1 = 00000000, Mem[0000000010141410] = 6f00b353 e7e33264
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000047 00000000
!	%f14 = 7c6f1867 6432e3e7, %l2 = 000000000000b5ff
!	Mem[0000000010001400] = ff00000000000000
	stda	%f14,[%i0+%l2]ASI_PST16_PL ! Mem[0000000010001400] = e7e3326467186f7c
!	%l7 = 00000000000000ff, Mem[0000000010181410] = e52742bb
	stha	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 00ff42bb
!	%l0 = 0000000000000047, Mem[0000000030101408] = 00000000
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000047
!	Mem[0000000010101400] = e7e33264, %l4 = 00000000835bb353
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 00000000e7e33264
!	%l3 = 000000000000ffff, Mem[0000000010041410] = ff00ff77
	stwa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000ffff
!	%l6 = ffffffffff000000, Mem[0000000010081410] = 000000ff
	stba	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffff0000, %l3 = 000000000000ffff
	lduba	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_189:
!	Mem[0000000010041410] = 0000ffffffa003d0, %f12 = 49a75aa3 ffa003ff
	ldd	[%i1+%o5],%f12		! %f12 = 0000ffff ffa003d0
!	Mem[0000000010181418] = 869902ff, %l5 = 00000000ffffffff
	lduha	[%i6+0x01a]%asi,%l5	! %l5 = 00000000000002ff
!	Mem[0000000010081400] = 7594537a, %f12 = 0000ffff
	lda	[%i2+%g0]0x88,%f12	! %f12 = 7594537a
!	Mem[00000000300c1408] = 67186f7c, %l4 = 00000000e7e33264
	lduwa	[%i3+%o4]0x89,%l4	! %l4 = 0000000067186f7c
!	Mem[0000000010101400] = 835bb35300000000, %l6 = ffffffffff000000
	ldxa	[%i4+%g0]0x80,%l6	! %l6 = 835bb35300000000
!	Mem[0000000010101400] = 835bb353, %l3 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l3	! %l3 = ffffffffffffff83
!	Mem[00000000100c1400] = 1fff457c, %l7 = 00000000000000ff
	ldswa	[%i3+%g0]0x88,%l7	! %l7 = 000000001fff457c
!	Mem[0000000010141400] = 00000000, %l4 = 0000000067186f7c
	lduha	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = ff617e00, %l3 = ffffffffffffff83
	ldsha	[%i4+%o4]0x88,%l3	! %l3 = 0000000000007e00
!	Starting 10 instruction Store Burst
!	%l6 = 835bb35300000000, Mem[0000000010101400] = 835bb353
	stba	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 005bb353

p0_label_190:
!	%l3 = 0000000000007e00, Mem[0000000030141400] = ff6f1867
	stha	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 7e001867
!	%f26 = 293e0dfb 00000000, Mem[0000000010141408] = 6718ffff ff617e1e
	stda	%f26,[%i5+%o4]0x80	! Mem[0000000010141408] = 293e0dfb 00000000
!	%f8  = fa776362 0a1f039a, %l1 = 0000000000000000
!	Mem[0000000010001400] = e7e3326467186f7c
	stda	%f8,[%i0+%l1]ASI_PST32_P ! Mem[0000000010001400] = e7e3326467186f7c
!	%l6 = 835bb35300000000, Mem[0000000010001430] = 46a72ad1, %asi = 80
	stwa	%l6,[%i0+0x030]%asi	! Mem[0000000010001430] = 00000000
!	%l5 = 00000000000002ff, Mem[0000000030181400] = 00007c6f
	stba	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = ff007c6f
!	Mem[0000000010001410] = 00000000fa776362, %l5 = 00000000000002ff, %l1 = 0000000000000000
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 00000000fa776362
!	%f22 = 00ff00ff ff76594e, Mem[0000000010001420] = 9a030000 626377fa
	stda	%f22,[%i0+0x020]%asi	! Mem[0000000010001420] = 00ff00ff ff76594e
!	%l3 = 0000000000007e00, Mem[0000000010081418] = ff190000
	stw	%l3,[%i2+0x018]		! Mem[0000000010081418] = 00007e00
!	%f12 = 7594537a ffa003d0, Mem[00000000300c1408] = 7c6f1867 000000ff
	stda	%f12,[%i3+%o4]0x81	! Mem[00000000300c1408] = 7594537a ffa003d0
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000, %l7 = 000000001fff457c
	lduwa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000

p0_label_191:
!	Mem[0000000030141408] = ff606077ff000000, %l6 = 835bb35300000000
	ldxa	[%i5+%o4]0x89,%l6	! %l6 = ff606077ff000000
!	Mem[0000000010181408] = a671701b, %f4  = 00000000
	lda	[%i6+%o4]0x88,%f4 	! %f4 = a671701b
!	%f7  = b8796204, %f9  = 0a1f039a, %f31 = 72cd2d6e
	fsubs	%f7 ,%f9 ,%f31		! %f31 = b8796204
!	Mem[0000000030101408] = 4700000000000000, %l1 = 00000000fa776362
	ldxa	[%i4+%o4]0x81,%l1	! %l1 = 4700000000000000
!	Mem[0000000010101400] = 53b35b00, %l4 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = 0000000053b35b00
!	Mem[0000000030101410] = ff000000, %l1 = 4700000000000000
	ldswa	[%i4+%o5]0x89,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010001428] = 0aaf40f1ffffff7f, %f16 = ffffffff ffffffff
	ldda	[%i0+0x028]%asi,%f16	! %f16 = 0aaf40f1 ffffff7f
!	Code Fragment 4
p0_fragment_11:
!	%l0 = 0000000000000047
	setx	0xfc1c7f48558b06d0,%g7,%l0 ! %l0 = fc1c7f48558b06d0
!	%l1 = ffffffffff000000
	setx	0x51cb628f8f7e12ea,%g7,%l1 ! %l1 = 51cb628f8f7e12ea
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fc1c7f48558b06d0
	setx	0xaddf747ffeea17f8,%g7,%l0 ! %l0 = addf747ffeea17f8
!	%l1 = 51cb628f8f7e12ea
	setx	0x60551bf80b005f22,%g7,%l1 ! %l1 = 60551bf80b005f22
!	%l2 = 000000000000b5ff, imm = fffffffffffff62f, %l4 = 0000000053b35b00
	addc	%l2,-0x9d1,%l4		! %l4 = 000000000000ac2e
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 293e0dfb, %l6 = ff606077ff000000
	ldstub	[%i5+%o4],%l6		! %l6 = 00000029000000ff

p0_label_192:
!	Mem[00000000100c1410] = ff617e1e, %l6 = 0000000000000029
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 00000000ff617e1e
!	%f14 = 7c6f1867 6432e3e7, Mem[0000000030181410] = 00000001 ff617eff
	stda	%f14,[%i6+%o5]0x81	! Mem[0000000030181410] = 7c6f1867 6432e3e7
!	%l2 = 000000000000b5ff, Mem[0000000030081400] = 000000ff
	stha	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000b5ff
!	Mem[0000000030001408] = 000000ff, %l4 = 000000000000ac2e
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%f9  = 0a1f039a, Mem[0000000010101410] = ff03e0ff
	sta	%f9 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 0a1f039a
!	%f5  = 00000000, %f27 = 00000000, %f25 = ffffffff
	fmuls	%f5 ,%f27,%f25		! %f25 = 00000000
!	%l1 = 60551bf80b005f22, Mem[0000000010081400] = 7a539475
	stba	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 22539475
!	%l4 = 000000ff, %l5 = 000002ff, Mem[0000000010081400] = 22539475 00000000
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff 000002ff
!	Mem[0000000010181404] = 00000000, %l3 = 0000000000007e00
	ldstub	[%i6+0x004],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = d003a0ff, %f7  = b8796204
	lda	[%i3+%g0]0x81,%f7 	! %f7 = d003a0ff

p0_label_193:
!	Mem[0000000010141408] = ff3e0dfb, %l7 = 0000000000000000
	ldsba	[%i5+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1408] = 00000000, %l2 = 000000000000b5ff
	lduha	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 000000ff, %l4 = 00000000000000ff
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041410] = ffff0000, %l3 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l0 = addf747ffeea17f8
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 1fff457c, %f20 = 000000ff
	lda	[%i3+%g0]0x88,%f20	! %f20 = 1fff457c
!	Mem[0000000010101400] = 53b35b00, %l4 = 00000000000000ff
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = 0000000053b35b00
!	%l1 = 60551bf80b005f22, %l7 = ffffffffffffffff, %y  = 00000047
	smul	%l1,%l7,%l3		! %l3 = fffffffff4ffa0de, %y = ffffffff
!	Mem[0000000010101414] = 9b000000, %l4 = 0000000053b35b00
	lduw	[%i4+0x014],%l4		! %l4 = 000000009b000000
!	Starting 10 instruction Store Burst
!	%f16 = 0aaf40f1 ffffff7f ff76594e 000000ff
!	%f20 = 1fff457c 6f000000 00ff00ff ff76594e
!	%f24 = ffffffff 00000000 293e0dfb 00000000
!	%f28 = 1e7e61ff ffff1867 e52742bb b8796204
	stda	%f16,[%i5]ASI_BLK_P	! Block Store to 0000000010141400

p0_label_194:
!	%l3 = fffffffff4ffa0de, Mem[00000000300c1410] = 00007cff
	stha	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000a0de
!	Mem[0000000010001400] = e7e33264, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000e7000000ff
!	%l7 = ffffffffffffffff, Mem[0000000010181408] = a671701b
	stba	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = a67170ff
!	%l4 = 000000009b000000, Mem[0000000030081408] = 7c45ffff
	stha	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 7c450000
!	Code Fragment 3
p0_fragment_12:
!	%l0 = 0000000000000000
	setx	0x084a05efcc0fd169,%g7,%l0 ! %l0 = 084a05efcc0fd169
!	%l1 = 60551bf80b005f22
	setx	0x1486b99fde4ba3b3,%g7,%l1 ! %l1 = 1486b99fde4ba3b3
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 084a05efcc0fd169
	setx	0xc083daefdd8b7c51,%g7,%l0 ! %l0 = c083daefdd8b7c51
!	%l1 = 1486b99fde4ba3b3
	setx	0x5e4a065fc0963418,%g7,%l1 ! %l1 = 5e4a065fc0963418
!	%f0  = ffe003ff 000000ff, Mem[0000000010141400] = f140af0a 7fffffff
	stda	%f0 ,[%i5+%g0]0x88	! Mem[0000000010141400] = ffe003ff 000000ff
!	%f16 = 0aaf40f1 ffffff7f ff76594e 000000ff
!	%f20 = 1fff457c 6f000000 00ff00ff ff76594e
!	%f24 = ffffffff 00000000 293e0dfb 00000000
!	%f28 = 1e7e61ff ffff1867 e52742bb b8796204
	stda	%f16,[%i1]ASI_BLK_P	! Block Store to 0000000010041400
!	%l6 = ff617e1e, %l7 = ffffffff, Mem[0000000010081410] = 000000ff a35aa749
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = ff617e1e ffffffff
!	%l6 = 00000000ff617e1e, Mem[0000000030081408] = 0000457c9fd8fddb
	stxa	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000ff617e1e
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffb50000, %l4 = 000000009b000000
	lduwa	[%i2+%g0]0x81,%l4	! %l4 = 00000000ffb50000

p0_label_195:
!	Mem[0000000030101408] = 47000000 00000000, %l6 = ff617e1e, %l7 = ffffffff
	ldda	[%i4+%o4]0x81,%l6	! %l6 = 0000000047000000 0000000000000000
!	Mem[0000000030181408] = 00000000, %l2 = 00000000000000e7
	lduha	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = ffe33264, %l3 = fffffffff4ffa0de
	ldsha	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffffe3
!	Mem[0000000010081408] = 00000000, %f13 = ffa003d0
	lda	[%i2+%o4]0x80,%f13	! %f13 = 00000000
!	Mem[00000000201c0000] = 00ff1b53, %l6 = 0000000047000000
	ldub	[%o0+%g0],%l6		! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010041430] = 1e7e61ff, %l5 = 00000000000002ff
	lduha	[%i1+0x032]%asi,%l5	! %l5 = 00000000000061ff
!	Mem[0000000030181410] = 7c6f1867, %f5  = 00000000
	lda	[%i6+%o5]0x81,%f5 	! %f5 = 7c6f1867
!	Mem[0000000030001400] = 00000000, %l4 = 00000000ffb50000
	ldswa	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 0000006f7c45ff1f, %l2 = 0000000000000000
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = 0000006f7c45ff1f
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 000061ff, Mem[0000000010181430] = a671701b 918610af
	stda	%l4,[%i6+0x030]%asi	! Mem[0000000010181430] = 00000000 000061ff

p0_label_196:
!	%f18 = ff76594e 000000ff, %l5 = 00000000000061ff
!	Mem[0000000030101400] = 00000000fb0d3e29
	stda	%f18,[%i4+%l5]ASI_PST8_SL ! Mem[0000000030101400] = ff0000004e5976ff
!	%l1 = 5e4a065fc0963418, Mem[0000000010141410] = 0000006f7c45ff1f
	stxa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 5e4a065fc0963418
!	%l7 = 0000000000000000, Mem[00000000211c0000] = 00ff37e1
	stb	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 00ff37e1
!	%l4 = 0000000000000000, Mem[0000000010001418] = 046279b8a0f0cd14, %asi = 80
	stxa	%l4,[%i0+0x018]%asi	! Mem[0000000010001418] = 0000000000000000
!	%l2 = 7c45ff1f, %l3 = ffffffe3, Mem[0000000010041410] = 1fff457c 6f000000
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 7c45ff1f ffffffe3
!	%l5 = 00000000000061ff, Mem[0000000010041408] = 4e5976ff
	stwa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 000061ff
!	Mem[0000000010141400] = ff000000, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%f30 = e52742bb b8796204, %l6 = 0000000000000000
!	Mem[0000000030141438] = e52742bbc6617e1e
	add	%i5,0x038,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030141438] = e52742bbc6617e1e
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %f2  = d12aff77
	lda	[%i0+%o4]0x80,%f2 	! %f2 = 00000000

p0_label_197:
!	Mem[00000000100c1438] = e52742bb, %l7 = 00000000ff000000
	lduba	[%i3+0x039]%asi,%l7	! %l7 = 0000000000000027
!	Mem[0000000010101424] = 7a53ffff, %l0 = c083daefdd8b7c51
	ldsw	[%i4+0x024],%l0		! %l0 = 000000007a53ffff
!	%l4 = 0000000000000000, Mem[0000000030101408] = 47000000
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[0000000010001438] = e7e3326485eb95f9, %f0  = ffe003ff 000000ff
	ldda	[%i0+0x038]%asi,%f0 	! %f0  = e7e33264 85eb95f9
!	Mem[00000000100c1410] = 29000000ffff1867, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l4	! %l4 = 29000000ffff1867
!	Mem[0000000030181410] = 7c6f18676432e3e7, %f4  = a671701b 7c6f1867
	ldda	[%i6+%o5]0x81,%f4 	! %f4  = 7c6f1867 6432e3e7
!	Mem[00000000218000c0] = 00008436, %l1 = 5e4a065fc0963418
	ldsh	[%o3+0x0c0],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l0 = 000000007a53ffff
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l0 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010001408] = 00000000ff000000
	stxa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000000

p0_label_198:
!	%f7  = d003a0ff, Mem[0000000010001408] = 00000000
	sta	%f7 ,[%i0+0x008]%asi	! Mem[0000000010001408] = d003a0ff
!	%l4 = 29000000ffff1867, %l0 = 0000000000000000, %l2 = 0000006f7c45ff1f
	sdivx	%l4,%l0,%l2		! %l2 = 0000006f7c45ff1f
!	%f22 = 00ff00ff ff76594e, Mem[0000000030101410] = ff000000 00000000
	stda	%f22,[%i4+%o5]0x89	! Mem[0000000030101410] = 00ff00ff ff76594e
!	%l4 = 29000000ffff1867, Mem[0000000010101410] = 9a031f0a
	stba	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 9a031f67
!	%l3 = ffffffffffffffe3, Mem[0000000010081433] = de9b58ca, %asi = 80
	stba	%l3,[%i2+0x033]%asi	! Mem[0000000010081430] = de9b58e3
!	%l3 = ffffffffffffffe3, Mem[00000000100c1400] = 1fff457c
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffe3
!	Mem[0000000010001410] = 00000000, %l5 = 00000000000061ff
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000020800040] = 59ffe56e, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000e56e
!	Mem[00000000211c0000] = 00ff37e1, %l3 = ffffffffffffffe3
	ldstub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 000000ff 776060ff, %l0 = 00000028, %l1 = 00000000
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000000000ff 00000000776060ff

p0_label_199:
!	Mem[0000000030001400] = 00000000, %l1 = 00000000776060ff
	ldsba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = ffa75aa3, %l5 = 0000000000000000
	lduwa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ffa75aa3
!	Mem[0000000010181410] = bb42ff00, %l1 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l1	! %l1 = 00000000bb42ff00
!	Mem[0000000010001400] = 6432e3ff, %f31 = b8796204
	lda	[%i0+%g0]0x88,%f31	! %f31 = 6432e3ff
!	Mem[0000000020800000] = ff00aff8, %l6 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010141408] = 4e5976ff, %l2 = 0000006f7c45ff1f
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010101408] = ff617e00, %l1 = 00000000bb42ff00
	lduba	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = ff606077ff000000, %f0  = e7e33264 85eb95f9
	ldda	[%i5+%o4]0x89,%f0 	! %f0  = ff606077 ff000000
!	Mem[0000000030041410] = 00000000, %l0 = 00000000000000ff
	lduha	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000027, Mem[0000000030001400] = 00000000
	stba	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 27000000

p0_label_200:
!	Code Fragment 4
p0_fragment_13:
!	%l0 = 0000000000000000
	setx	0xc21c85dffabd98a4,%g7,%l0 ! %l0 = c21c85dffabd98a4
!	%l1 = 0000000000000000
	setx	0x9347650ff830c2c4,%g7,%l1 ! %l1 = 9347650ff830c2c4
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c21c85dffabd98a4
	setx	0x0ef3afb7d82b51d1,%g7,%l0 ! %l0 = 0ef3afb7d82b51d1
!	%l1 = 9347650ff830c2c4
	setx	0x063d97f8480ed2f5,%g7,%l1 ! %l1 = 063d97f8480ed2f5
!	%l1 = 063d97f8480ed2f5, Mem[00000000100c1411] = 29000000
	stb	%l1,[%i3+0x011]		! Mem[00000000100c1410] = 29f50000
!	%l6 = 000000000000ff00, Mem[0000000030181410] = 67186f7c
	stwa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ff00
!	%l7 = 0000000000000027, Mem[0000000010141410] = c0963418
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000027
!	%l0 = d82b51d1, %l1 = 480ed2f5, Mem[0000000010101400] = 53b35b00 00000000
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = d82b51d1 480ed2f5
!	%l6 = 000000000000ff00, Mem[00000000211c0001] = ffff37e1, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff0037e1
!	%l5 = 00000000ffa75aa3, %l2 = 00000000000000ff, %l3 = 0000000000000000
	orn	%l5,%l2,%l3		! %l3 = ffffffffffffffa3
!	%f25 = 00000000, Mem[0000000030181400] = ff007c6f
	sta	%f25,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[00000000201c0001] = 00ff1b53, %l3 = ffffffffffffffa3
	ldstub	[%o0+0x001],%l3		! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff617e00, %l5 = 00000000ffa75aa3
	lduha	[%i4+%o4]0x88,%l5	! %l5 = 0000000000007e00

p0_label_201:
!	Mem[00000000300c1400] = ffa003d0, %l7 = 0000000000000027
	lduha	[%i3+%g0]0x89,%l7	! %l7 = 00000000000003d0
!	Mem[0000000010081400] = 000000ff 000002ff, %l2 = 000000ff, %l3 = 000000ff
	ldd	[%i2+%g0],%l2		! %l2 = 00000000000000ff 00000000000002ff
!	Mem[0000000010101408] = ff617e00, %l5 = 0000000000007e00
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = 480ed2f5d82b51d1, %l1 = 063d97f8480ed2f5
	ldxa	[%i4+%g0]0x88,%l1	! %l1 = 480ed2f5d82b51d1
!	Mem[0000000010041408] = ff610000, %l1 = 480ed2f5d82b51d1
	lduwa	[%i1+%o4]0x80,%l1	! %l1 = 00000000ff610000
!	Mem[0000000030181408] = 00000000, %l3 = 00000000000002ff
	lduwa	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%f10 = 00000000 00000000, Mem[0000000010081430] = de9b58e3 30e7b50f
	std	%f10,[%i2+0x030]	! Mem[0000000010081430] = 00000000 00000000
!	Mem[0000000010081410] = 1e7e61ff, %l3 = 0000000000000000
	ldsha	[%i2+%o5]0x88,%l3	! %l3 = 00000000000061ff
!	Mem[0000000010181408] = ff7071a64e5976ff, %f20 = 1fff457c 6f000000
	ldda	[%i6+0x008]%asi,%f20	! %f20 = ff7071a6 4e5976ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ffa75aa3, %l7 = 00000000000003d0
	ldstuba	[%i5+%o5]0x81,%l7	! %l7 = 000000ff000000ff

p0_label_202:
!	%f0  = ff606077, Mem[0000000030181410] = 00ff0000
	sta	%f0 ,[%i6+%o5]0x81	! Mem[0000000030181410] = ff606077
!	Mem[000000001004140c] = 000000ff, %l3 = 00000000000061ff
	swap	[%i1+0x00c],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010081400] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000030001410] = ffff0000
	stha	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ff0000
!	Mem[00000000100c1400] = ffffffe3, %l6 = 000000000000ff00
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 000000e3000000ff
!	%f30 = e52742bb 6432e3ff, %l7 = 00000000000000ff
!	Mem[0000000010141400] = 00000000ff03e0ff
	stda	%f30,[%i5+%l7]ASI_PST32_PL ! Mem[0000000010141400] = ffe33264bb4227e5
!	%f22 = 00ff00ff ff76594e, Mem[0000000010081410] = ff617e1e ffffffff
	stda	%f22,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ff00ff ff76594e
!	%l4 = 29000000ffff1867, Mem[00000000300c1410] = 0000a0de
	stha	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00001867
!	%f25 = 00000000, %f6  = 14cdf0a0, %f24 = ffffffff
	fdivs	%f25,%f6 ,%f24		! %f24 = 00000000
!	Starting 10 instruction Load Burst
!	Mem[000000001010141c] = ffffffff, %l6 = 00000000000000e3
	lduw	[%i4+0x01c],%l6		! %l6 = 00000000ffffffff

p0_label_203:
!	Mem[0000000010081410] = 4e5976ffff00ff00, %f22 = 00ff00ff ff76594e
	ldda	[%i2+%o5]0x88,%f22	! %f22 = 4e5976ff ff00ff00
!	Mem[0000000030141408] = 000000ff776060ff, %l2 = 00000000000000ff
	ldxa	[%i5+%o4]0x81,%l2	! %l2 = 000000ff776060ff
!	Mem[0000000010081408] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800080] = 6f896ccf, %l3 = 0000000000000000
	lduha	[%o3+0x080]%asi,%l3	! %l3 = 0000000000006f89
!	Mem[0000000030001410] = 00ff0000 000000ff, %l2 = 776060ff, %l3 = 00006f89
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 0000000000ff0000 00000000000000ff
!	Code Fragment 3
p0_fragment_14:
!	%l0 = 0ef3afb7d82b51d1
	setx	0x66a790c7d7d20474,%g7,%l0 ! %l0 = 66a790c7d7d20474
!	%l1 = 00000000ff610000
	setx	0x275ee510286b3e91,%g7,%l1 ! %l1 = 275ee510286b3e91
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 66a790c7d7d20474
	setx	0x595788584c32b66d,%g7,%l0 ! %l0 = 595788584c32b66d
!	%l1 = 275ee510286b3e91
	setx	0x2888080074ab031f,%g7,%l1 ! %l1 = 2888080074ab031f
!	%l5 = 0000000000000000, Mem[0000000030001410] = 00ff0000
	stba	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ff0000
!	%l6 = 00000000ffffffff, imm = fffffffffffff920, %l6 = 00000000ffffffff
	addc	%l6,-0x6e0,%l6		! %l6 = 00000000fffff91f
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000ff0000, Mem[000000001000141c] = 00000000
	sth	%l2,[%i0+0x01c]		! Mem[000000001000141c] = 00000000

p0_label_204:
!	Mem[0000000010141408] = 4e5976ff, %l1 = 2888080074ab031f
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 000000004e5976ff
!	Mem[0000000030141400] = 6718007e, %l6 = 00000000fffff91f
	ldstuba	[%i5+%g0]0x89,%l6	! %l6 = 0000007e000000ff
!	Mem[0000000010001428] = 0aaf40f1, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x028]%asi,%l3	! %l3 = 000000000aaf40f1
!	Mem[00000000100c1410] = 0000f529, %l6 = 000000000000007e
	ldstuba	[%i3+%o5]0x88,%l6	! %l6 = 00000029000000ff
!	%l2 = 0000000000ff0000, Mem[0000000010001400] = ffe3326467186f7c
	stxa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000ff0000
!	Mem[0000000010141410] = 270000005f064a5e, %l2 = 0000000000ff0000, %l5 = 0000000000000000
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 270000005f064a5e
!	%l7 = 0000000000000000, Mem[0000000010081408] = 00000000
	stba	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	Mem[00000000100c1410] = 0000f5ff, %l0 = 595788584c32b66d
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 000000000000f5ff
!	Code Fragment 4
p0_fragment_15:
!	%l0 = 000000000000f5ff
	setx	0xf64d20804262ef39,%g7,%l0 ! %l0 = f64d20804262ef39
!	%l1 = 000000004e5976ff
	setx	0x0ab2d25fe9ecbd57,%g7,%l1 ! %l1 = 0ab2d25fe9ecbd57
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f64d20804262ef39
	setx	0x9cbfce07e98fdd4a,%g7,%l0 ! %l0 = 9cbfce07e98fdd4a
!	%l1 = 0ab2d25fe9ecbd57
	setx	0x20c5a6f7f4f58ea8,%g7,%l1 ! %l1 = 20c5a6f7f4f58ea8
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff7071a6, %l3 = 000000000aaf40f1
	ldswa	[%i6+%o4]0x80,%l3	! %l3 = ffffffffff7071a6

p0_label_205:
!	Mem[0000000010081410] = ff00ff00, %l3 = ffffffffff7071a6
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = ffffffff, %l5 = 270000005f064a5e
	lduba	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1404] = f2690d26, %f25 = 00000000
	lda	[%i3+0x004]%asi,%f25	! %f25 = f2690d26
!	Mem[0000000030141410] = ffa75aa3, %f29 = ffff1867
	lda	[%i5+%o5]0x81,%f29	! %f29 = ffa75aa3
!	Mem[00000000100c1410] = 6db6324c, %l3 = 0000000000000000
	lduba	[%i3+0x011]%asi,%l3	! %l3 = 00000000000000b6
!	%f6  = 14cdf0a0, %f7  = d003a0ff, %f7  = d003a0ff
	fadds	%f6 ,%f7 ,%f7 		! %f7  = d003a0ff
!	Mem[00000000100c1400] = ffffffff, %f21 = 4e5976ff
	lda	[%i3+%g0]0x80,%f21	! %f21 = ffffffff
!	Mem[0000000030101410] = 4e5976ff, %l6 = 0000000000000029
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = 000000004e5976ff
!	Mem[0000000030141408] = 000000ff 776060ff, %l6 = 4e5976ff, %l7 = 00000000
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 00000000000000ff 00000000776060ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = ff000000, %l2 = 0000000000ff0000
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 00000000ff000000

p0_label_206:
!	Mem[0000000010101408] = ff617e00, %l0 = 9cbfce07e98fdd4a
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010081400] = ff0000ff
	stwa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%f4  = 7c6f1867 6432e3e7, Mem[0000000010081400] = 000000ff ff020000
	stda	%f4 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 7c6f1867 6432e3e7
!	%l6 = 00000000000000ff, Mem[0000000030041410] = 0000000000000000
	stxa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000000000ff
!	%f9  = 0a1f039a, Mem[0000000030101400] = 000000ff
	sta	%f9 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 0a1f039a
!	%l4 = ffff1867, %l5 = 000000ff, Mem[0000000030081410] = 4e5976ff 0f1cff16
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ffff1867 000000ff
!	%l6 = 00000000000000ff, Mem[0000000010041410] = 1fff457c
	stwa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l7 = 00000000776060ff, Mem[0000000010001418] = 00000000, %asi = 80
	stwa	%l7,[%i0+0x018]%asi	! Mem[0000000010001418] = 776060ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 0000ff00, %l5 = 00000000000000ff
	ldswa	[%i0+%o5]0x88,%l5	! %l5 = 000000000000ff00

p0_label_207:
!	Mem[0000000030181408] = 53b35b8300000000, %l2 = 00000000ff000000
	ldxa	[%i6+%o4]0x89,%l2	! %l2 = 53b35b8300000000
!	Mem[0000000030041408] = ff03a0ff, %l7 = 00000000776060ff
	lduha	[%i1+%o4]0x81,%l7	! %l7 = 000000000000ff03
!	Mem[0000000030041410] = 000000ff, %l6 = 00000000000000ff
	lduha	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = d82b51d1, %l1 = 20c5a6f7f4f58ea8
	ldswa	[%i4+%g0]0x88,%l1	! %l1 = ffffffffd82b51d1
!	Mem[0000000010001410] = 0000ff00, %l5 = 000000000000ff00
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = ff7e61ff, %l7 = 000000000000ff03
	lduha	[%i4+%o4]0x80,%l7	! %l7 = 000000000000ff7e
!	Mem[0000000030001408] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = 00000000, %l7 = 000000000000ff7e
	ldsha	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = ffffffff, %l3 = 00000000000000b6
	ldswa	[%i3+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000211c0000] = ff0037e1
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 000037e1

p0_label_208:
!	%f20 = ff7071a6, Mem[00000000300c1408] = 7594537a
	sta	%f20,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff7071a6
!	%l2 = 53b35b8300000000, imm = 0000000000000f62, %l5 = 00000000000000ff
	xor	%l2,0xf62,%l5		! %l5 = 53b35b8300000f62
!	Mem[00000000201c0000] = 00ff1b53, %l3 = ffffffffffffffff
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	%l1 = ffffffffd82b51d1, Mem[0000000010181410] = 00ff42bb
	stwa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = d82b51d1
!	%l4 = ffff1867, %l5 = 00000f62, Mem[0000000010101410] = 9a031f67 0000009b
	stda	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = ffff1867 00000f62
!	Mem[0000000010001410] = 0000ff00, %l2 = 53b35b8300000000
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041410] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[0000000010181410] = d82b51d1
	stwa	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff
!	Mem[00000000300c1400] = ffa003d0, %l4 = 29000000ffff1867
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 000000d0000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 000037e1, %l7 = 0000000000000000
	ldsb	[%o2+%g0],%l7		! %l7 = 0000000000000000

p0_label_209:
!	Mem[00000000100c1400] = ffffffff, %l0 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030081410] = 6718ffff, %f10 = 00000000
	lda	[%i2+%o5]0x89,%f10	! %f10 = 6718ffff
!	Mem[0000000030101410] = ff76594e, %l2 = 0000000000000000
	ldswa	[%i4+%o5]0x89,%l2	! %l2 = ffffffffff76594e
!	Mem[0000000010081400] = 7c6f18676432e3e7, %f26 = 293e0dfb 00000000
	ldda	[%i2+%g0]0x88,%f26	! %f26 = 7c6f1867 6432e3e7
!	Mem[0000000030181410] = ff606077, %l2 = ffffffffff76594e
	lduha	[%i6+%o5]0x81,%l2	! %l2 = 000000000000ff60
!	Mem[0000000020800040] = 0000e56e, %l3 = 0000000000000000
	ldsba	[%o1+0x040]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = ffff0000, %f0  = ff606077
	lda	[%i0+%o5]0x80,%f0 	! %f0 = ffff0000
!	Mem[0000000030001408] = 00000000000000ff, %f14 = 7c6f1867 6432e3e7
	ldda	[%i0+%o4]0x89,%f14	! %f14 = 00000000 000000ff
!	Mem[00000000100c1410] = 4c32b66d, %l2 = 000000000000ff60
	ldswa	[%i3+%o5]0x88,%l2	! %l2 = 000000004c32b66d
!	Starting 10 instruction Store Burst
!	%f19 = 000000ff, Mem[00000000300c1400] = ffa003ff
	sta	%f19,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff

p0_label_210:
!	Mem[000000001010142c] = 4e5976b4, %l4 = 00000000000000d0, %asi = 80
	swapa	[%i4+0x02c]%asi,%l4	! %l4 = 000000004e5976b4
!	Mem[0000000030101408] = 00000000, %l0 = 00000000ffffffff
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l5 = 53b35b8300000f62, Mem[0000000010101417] = 620f0000
	stb	%l5,[%i4+0x017]		! Mem[0000000010101414] = 620f0062
!	%l5 = 53b35b8300000f62, Mem[00000000100c1400] = 000000ff
	stwa	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000f62
!	%l3 = 0000000000000000, Mem[0000000010141408] = 74ab031f
	stha	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 74ab0000
!	%l0 = 00000000, %l1 = d82b51d1, Mem[00000000300c1400] = 000000ff ffffffff
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 d82b51d1
!	%l0 = 00000000, %l1 = d82b51d1, Mem[0000000030181408] = 00000000 53b35b83
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 d82b51d1
!	Mem[0000000021800100] = d0181701, %l6 = 00000000000000ff
	ldstuba	[%o3+0x100]%asi,%l6	! %l6 = 000000d0000000ff
!	Mem[0000000030001410] = 00ff0000, %l6 = 00000000000000d0
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 6718ffff, %l4 = 000000004e5976b4
	ldsba	[%i2+%o5]0x89,%l4	! %l4 = ffffffffffffffff

p0_label_211:
!	Mem[0000000030041410] = 000000ff, %l2 = 000000004c32b66d
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041410] = 000000ff, %l4 = ffffffffffffffff
	lduwa	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1410] = 00001867, %l4 = 00000000000000ff
	ldsba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000067
!	Mem[0000000030081410] = ff000000 6718ffff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 000000006718ffff 00000000ff000000
!	Mem[0000000010001408] = 00000000 ffa003d0, %l4 = 00000067, %l5 = 00000f62
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 00000000ffa003d0 0000000000000000
!	Mem[0000000010081428] = d3332db5, %f30 = e52742bb
	ld	[%i2+0x028],%f30	! %f30 = d3332db5
!	Mem[00000000100c1410] = 6718ffff 4c32b66d, %l0 = 00000000, %l1 = d82b51d1
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 000000004c32b66d 000000006718ffff
!	Mem[0000000010081410] = 00ff00ffff76594e, %f20 = ff7071a6 ffffffff
	ldda	[%i2+%o5]0x80,%f20	! %f20 = 00ff00ff ff76594e
!	Mem[0000000030081400] = ffb50000, %l2 = 00000000000000ff
	lduwa	[%i2+%g0]0x81,%l2	! %l2 = 00000000ffb50000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 0000b5ff, %l7 = 00000000ff000000
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 000000ff000000ff

p0_label_212:
!	%l0 = 000000004c32b66d, Mem[0000000020800040] = 0000e56e, %asi = 80
	stha	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = b66de56e
!	%l7 = 00000000000000ff, Mem[00000000300c1408] = a67170ff
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	Mem[0000000010181408] = ff7071a6, %l2 = 00000000ffb50000
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000ff7071a6
!	%l4 = ffa003d0, %l5 = 00000000, Mem[0000000030141408] = 000000ff 776060ff
	stda	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = ffa003d0 00000000
!	Mem[0000000010041408] = ff610000, %l0 = 000000004c32b66d
	swapa	[%i1+%o4]0x80,%l0	! %l0 = 00000000ff610000
!	%f2  = 00000000, %f12 = 7594537a
	fsqrts	%f2 ,%f12		! %f12 = 00000000
!	Mem[0000000030041400] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%l6 = 6718ffff, %l7 = 000000ff, Mem[0000000010081408] = 00000000 ffffffff
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 6718ffff 000000ff
!	Mem[000000001018141c] = 00000000, %l4 = ffa003d0, %l1 = 6718ffff
	add	%i6,0x1c,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 62000f62ffff1867, %f0  = ffff0000 ff000000
	ldda	[%i4+%o5]0x88,%f0 	! %f0  = 62000f62 ffff1867

p0_label_213:
!	Mem[0000000010141400] = ffe33264, %l4 = 00000000ffa003d0
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041408] = 4c32b66d, %l5 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l5	! %l5 = 0000000000004c32
!	Mem[00000000100c1400] = 00000f62, %l6 = 000000006718ffff
	lduba	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = 00ff00ffff76594e, %f2  = 00000000 ffa003d0
	ldda	[%i4+%o5]0x89,%f2 	! %f2  = 00ff00ff ff76594e
!	Mem[0000000010001400] = ff000000, %l0 = 00000000ff610000
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[00000000300c1400] = d82b51d100000000, %f24 = 00000000 f2690d26
	ldda	[%i3+%g0]0x89,%f24	! %f24 = d82b51d1 00000000
!	Mem[0000000030141400] = 671800ff, %l5 = 0000000000004c32
	ldsha	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001410] = 0000ffff, %l7 = 00000000000000ff
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 000000000000ffff
!	Mem[000000001004140c] = 000061ff, %l4 = 00000000000000ff
	ldsw	[%i1+0x00c],%l4		! %l4 = 00000000000061ff
!	Starting 10 instruction Store Burst
!	%f8  = fa776362 0a1f039a, %l0 = 00000000ff000000
!	Mem[0000000030041400] = ffffffffffffffff
	stda	%f8,[%i1+%l0]ASI_PST8_SL ! Mem[0000000030041400] = ffffffffffffffff

p0_label_214:
!	Mem[0000000030001410] = ffff0000, %l1 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ffff0000
!	Code Fragment 4
p0_fragment_16:
!	%l0 = 00000000ff000000
	setx	0x8c6c7347cc949033,%g7,%l0 ! %l0 = 8c6c7347cc949033
!	%l1 = 00000000ffff0000
	setx	0xae6413d8088c0238,%g7,%l1 ! %l1 = ae6413d8088c0238
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8c6c7347cc949033
	setx	0x043fafaf9e506b1d,%g7,%l0 ! %l0 = 043fafaf9e506b1d
!	%l1 = ae6413d8088c0238
	setx	0x0c8cd2886fe7a7eb,%g7,%l1 ! %l1 = 0c8cd2886fe7a7eb
!	%f16 = 0aaf40f1 ffffff7f, Mem[0000000030041400] = ffffffff ffffffff
	stda	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = 0aaf40f1 ffffff7f
!	Mem[0000000010001404] = 00ff0000, %l1 = 0c8cd2886fe7a7eb, %asi = 80
	swapa	[%i0+0x004]%asi,%l1	! %l1 = 0000000000ff0000
!	Mem[0000000030001408] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	%l7 = 000000000000ffff, Mem[0000000010181400] = 00000000
	stba	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	Mem[000000001010143c] = ff68abd2, %l1 = 0000000000ff0000
	swap	[%i4+0x03c],%l1		! %l1 = 00000000ff68abd2
!	%l2 = 00000000ff7071a6, Mem[0000000010081404] = 67186f7c, %asi = 80
	stha	%l2,[%i2+0x004]%asi	! Mem[0000000010081404] = 71a66f7c
!	Mem[0000000010181410] = ff000000, %l5 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00ff00ffff76594e, %f2  = 00ff00ff ff76594e
	ldda	[%i4+%o5]0x89,%f2 	! %f2  = 00ff00ff ff76594e

p0_label_215:
!	Mem[000000001008141c] = 0932356f, %l3 = 00000000000000ff
	ldsha	[%i2+0x01e]%asi,%l3	! %l3 = 000000000000356f
!	Mem[00000000100c1430] = ff606077, %l3 = 000000000000356f
	ldsb	[%i3+0x033],%l3		! %l3 = 0000000000000077
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010001400] = ff000000 6fe7a7eb d003a0ff 00000000
!	Mem[0000000010001410] = ffff0000 fa776362 776060ff 00000000
!	Mem[0000000010001420] = 00ff00ff ff76594e 000000ff ffffff7f
!	Mem[0000000010001430] = 00000000 a35aa749 e7e33264 85eb95f9
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Mem[0000000010041430] = 1e7e61ff ffff1867, %l0 = 9e506b1d, %l1 = ff68abd2
	ldda	[%i1+0x030]%asi,%l0	! %l0 = 000000001e7e61ff 00000000ffff1867
!	Mem[0000000030081400] = ffb50000 40ff1e7d, %l0 = 1e7e61ff, %l1 = ffff1867
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 00000000ffb50000 0000000040ff1e7d
!	Mem[0000000030101410] = 4e5976ff, %l4 = 00000000000061ff
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = 000000000000004e
!	Mem[0000000030001400] = 27000000, %l5 = 0000000000000000
	ldsha	[%i0+%g0]0x81,%l5	! %l5 = 0000000000002700
!	Mem[0000000030081400] = 0000b5ff, %f23 = ff00ff00
	lda	[%i2+%g0]0x89,%f23	! %f23 = 0000b5ff
!	%l2 = 00000000ff7071a6, %l4 = 000000000000004e, %l1 = 0000000040ff1e7d
	xor	%l2,%l4,%l1		! %l1 = 00000000ff7071e8
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000004e, Mem[0000000030141408] = d003a0ff
	stha	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = d003004e

p0_label_216:
!	%l4 = 000000000000004e, Mem[0000000030081400] = ffb50000
	stba	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 4eb50000
!	%f28 = 1e7e61ff, Mem[0000000010081400] = e7e33264
	sta	%f28,[%i2+%g0]0x80	! Mem[0000000010081400] = 1e7e61ff
	membar	#Sync			! Added by membar checker (31)
!	%l2 = 00000000ff7071a6, Mem[0000000010001410] = 0000ffff
	stwa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = ff7071a6
!	%l3 = 0000000000000077, Mem[0000000030041410] = 6db6324c00000000
	stxa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000077
!	%l0 = 00000000ffb50000, Mem[0000000030001408] = ff000000
	stwa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = ffb50000
!	Mem[0000000010001400] = ff000000, %l4 = 000000000000004e
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 00000000ff000000
!	%l4 = 00000000ff000000, Mem[0000000030101400] = 9a031f0a
	stwa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000000
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 00000000ffb50000
	setx	0xd38d194856b34355,%g7,%l0 ! %l0 = d38d194856b34355
!	%l1 = 00000000ff7071e8
	setx	0x99d03d28587c0b39,%g7,%l1 ! %l1 = 99d03d28587c0b39
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d38d194856b34355
	setx	0x2a3db6905fd0369d,%g7,%l0 ! %l0 = 2a3db6905fd0369d
!	%l1 = 99d03d28587c0b39
	setx	0xbb9d13802c245533,%g7,%l1 ! %l1 = bb9d13802c245533
!	Mem[00000000211c0001] = 000037e1, %l5 = 0000000000002700
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 27000000, %l4 = 00000000ff000000
	ldsha	[%i0+%g0]0x81,%l4	! %l4 = 0000000000002700

p0_label_217:
!	Mem[0000000010081408] = 6718ffff, %f13 = a35aa749
	lda	[%i2+%o4]0x88,%f13	! %f13 = 6718ffff
!	Mem[00000000300c1410] = 67180000, %l6 = 0000000000000000
	lduha	[%i3+%o5]0x81,%l6	! %l6 = 0000000000006718
!	Mem[0000000010101410] = ffff1867, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l5	! %l5 = 00000000ffff1867
!	Mem[0000000030041410] = 00000000, %l5 = 00000000ffff1867
	lduha	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 6db6324c, %f16 = 0aaf40f1
	lda	[%i1+%o4]0x88,%f16	! %f16 = 6db6324c
!	Mem[00000000300c1408] = ff000000, %l6 = 0000000000006718
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030041400] = 0aaf40f1, %l1 = bb9d13802c245533
	ldswa	[%i1+%g0]0x81,%l1	! %l1 = 000000000aaf40f1
!	%f11 = ffffff7f, %f26 = 7c6f1867, %f19 = 000000ff
	fadds	%f11,%f26,%f19		! %f19 = ffffff7f
!	Mem[0000000010141410] = 27000000, %l2 = 00000000ff7071a6
	lduwa	[%i5+%o5]0x80,%l2	! %l2 = 0000000027000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000211c0000] = 00ff37e1, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 000037e1

p0_label_218:
!	%f2  = d003a0ff 00000000, Mem[00000000300c1408] = ff000000 ffa003d0
	stda	%f2 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = d003a0ff 00000000
!	Mem[0000000030181408] = 00000000, %l4 = 0000000000002700
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%f20 = 00ff00ff ff76594e, %l4 = 0000000000000000
!	Mem[0000000030101438] = e52742bbc6617e1e
	add	%i4,0x038,%g1
	stda	%f20,[%g1+%l4]ASI_PST16_S ! Mem[0000000030101438] = e52742bbc6617e1e
!	Mem[0000000010081408] = ffff1867, %l5 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 00000000ffff1867
!	%f2  = d003a0ff 00000000, Mem[0000000030081400] = 4eb50000 40ff1e7d
	stda	%f2 ,[%i2+%g0]0x81	! Mem[0000000030081400] = d003a0ff 00000000
!	Mem[0000000030001410] = 00000000, %l0 = 2a3db6905fd0369d
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l7 = 000000000000ffff
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = d003a0ff, %l2 = 0000000027000000
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 000000d0000000ff
!	Mem[0000000010141410] = 27000000, %l1 = 000000000aaf40f1
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 0000000027000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101424] = 7a53ffff, %l1 = 0000000027000000
	lduha	[%i4+0x026]%asi,%l1	! %l1 = 000000000000ffff

p0_label_219:
!	Mem[0000000030181400] = 77ff2ad1000000ff, %f12 = 00000000 6718ffff
	ldda	[%i6+%g0]0x89,%f12	! %f12 = 77ff2ad1 000000ff
!	Mem[0000000010041410] = ff000000, %l7 = 0000000000000000
	ldsb	[%i1+0x011],%l7		! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l2 = 00000000000000d0
	lduwa	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = d82b51d1, %l0 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l0	! %l0 = ffffffffd82b51d1
!	Mem[0000000010001408] = ffa003d0, %l4 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = ffffffffffa003d0
!	Mem[0000000030001408] = ffb50000, %l3 = 0000000000000077
	lduwa	[%i0+%o4]0x81,%l3	! %l3 = 00000000ffb50000
!	Mem[0000000030081410] = 6718ffff, %l1 = 000000000000ffff
	ldswa	[%i2+%o5]0x89,%l1	! %l1 = 000000006718ffff
!	Mem[0000000030101410] = ff76594e, %l4 = ffffffffffa003d0
	ldsba	[%i4+%o5]0x89,%l4	! %l4 = 000000000000004e
!	Mem[00000000100c143c] = 72cd2d6e, %l0 = ffffffffd82b51d1
	ldsha	[%i3+0x03c]%asi,%l0	! %l0 = 00000000000072cd
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = a35aa7ff, %l3 = 00000000ffb50000
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 000000ff000000ff

p0_label_220:
!	%l0 = 000072cd, %l1 = 6718ffff, Mem[0000000010181400] = ff000000 ff000000
	std	%l0,[%i6+%g0]		! Mem[0000000010181400] = 000072cd 6718ffff
!	Mem[0000000010101400] = d82b51d1, %l3 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l3	! %l3 = 000000d1000000ff
!	%l6 = 00000000ff000000, Mem[0000000010081400] = ff617e1e
	stha	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ff610000
!	%f1  = 6fe7a7eb, Mem[0000000030181408] = 00002700
	sta	%f1 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 6fe7a7eb
!	Mem[0000000010001400] = 4e000000, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 000000004e000000
!	%l0 = 00000000000072cd, Mem[0000000030081410] = 6718ffff
	stha	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 671872cd
!	%f4  = ffff0000 fa776362, %l6 = 00000000ff000000
!	Mem[0000000030141438] = e52742bbc6617e1e
	add	%i5,0x038,%g1
	stda	%f4,[%g1+%l6]ASI_PST8_S ! Mem[0000000030141438] = e52742bbc6617e1e
!	%l6 = 00000000ff000000, Mem[0000000010001408] = ffa003d0
	stba	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = ffa00300
!	Mem[0000000030141410] = ffa75aa3, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000ffa75aa3
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff000000, %l5 = 00000000ffff1867
	lduwa	[%i6+%g0]0x81,%l5	! %l5 = 00000000ff000000

p0_label_221:
!	Mem[0000000010081410] = ff00ff00, %l0 = 00000000000072cd
	lduba	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = ff000000, %l7 = 000000004e000000
	ldswa	[%i6+%g0]0x81,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010141410] = 0aaf40f15f064a5e, %l2 = 00000000ffa75aa3
	ldxa	[%i5+%o5]0x80,%l2	! %l2 = 0aaf40f15f064a5e
!	Mem[00000000100c1428] = d003a0ff ff617eff, %l6 = ff000000, %l7 = ff000000
	ldda	[%i3+0x028]%asi,%l6	! %l6 = 00000000d003a0ff 00000000ff617eff
!	Mem[0000000010101438] = 00000000, %l6 = 00000000d003a0ff
	ldsha	[%i4+0x03a]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1420] = 000000ffffffffff, %f24 = d82b51d1 00000000
	ldda	[%i3+0x020]%asi,%f24	! %f24 = 000000ff ffffffff
!	Mem[00000000100c1408] = 00000000, %l4 = 000000000000004e
	ldsba	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = 0000ab74 000000ff, %l6 = 00000000, %l7 = ff617eff
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 000000000000ab74 00000000000000ff
!	Mem[0000000010001408] = 0003a0ff, %f2  = d003a0ff
	lda	[%i0+%o4]0x80,%f2 	! %f2 = 0003a0ff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010181412] = ff0000ff, %asi = 80
	stha	%l0,[%i6+0x012]%asi	! Mem[0000000010181410] = ff000000

p0_label_222:
!	%f16 = 6db6324c, Mem[0000000010141408] = 74ab0000
	sta	%f16,[%i5+%o4]0x88	! Mem[0000000010141408] = 6db6324c
!	%f6  = 776060ff 00000000, Mem[0000000010001408] = ffa00300 00000000
	stda	%f6 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 776060ff 00000000
!	%l6 = 000000000000ab74, Mem[0000000030181400] = ff000000d12aff77
	stxa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000000000ab74
!	%l6 = 0000ab74, %l7 = 000000ff, Mem[0000000010141408] = 6db6324c ff000000
	stda	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000ab74 000000ff
!	Mem[0000000010041431] = 1e7e61ff, %l7 = 00000000000000ff
	ldstub	[%i1+0x031],%l7		! %l7 = 0000007e000000ff
!	Mem[0000000010141400] = ffe33264, %l1 = 000000006718ffff
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 00000000ffe33264
!	%f19 = ffffff7f, Mem[00000000100c1410] = 6db6324c
	sta	%f19,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffff7f
!	Mem[00000000100c1408] = 00000000, %l6 = 000000000000ab74
	lduba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = ffb50000, %l4 = 00000000, %l7 = 0000007e
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 00000000ffb50000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l5 = 00000000ff000000
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000

p0_label_223:
!	Mem[00000000300c1408] = d003a0ff00000000, %f8  = 00ff00ff ff76594e
	ldda	[%i3+%o4]0x81,%f8 	! %f8  = d003a0ff 00000000
!	Mem[0000000030101408] = ff000000, %l4 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030041400] = 7fffffff f140af0a, %l4 = ff000000, %l5 = 00000000
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 00000000f140af0a 000000007fffffff
!	Mem[00000000300c1410] = 67180000, %l5 = 000000007fffffff
	lduha	[%i3+%o5]0x81,%l5	! %l5 = 0000000000006718
!	Mem[0000000020800000] = ff00aff8, %l5 = 0000000000006718
	lduh	[%o1+%g0],%l5		! %l5 = 000000000000ff00
!	Mem[00000000100c1400] = 620f0000, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 00000f62, %f8  = d003a0ff
	lda	[%i3+%g0]0x80,%f8 	! %f8 = 00000f62
!	Mem[0000000030101408] = 000000ff, %l2 = 0aaf40f15f064a5e
	lduwa	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000218000c0] = 00008436, %l0 = 0000000000000000
	ldub	[%o3+0x0c0],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 0000ab74, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 00000074000000ff

p0_label_224:
!	Mem[0000000010181408] = ffb50000, %l6 = 0000000000000074
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000ffb50000
!	Mem[0000000010041414] = ffffffe3, %l7 = 00000000ffb50000, %asi = 80
	swapa	[%i1+0x014]%asi,%l7	! %l7 = 00000000ffffffe3
!	%l2 = 000000ff, %l3 = 000000d1, Mem[0000000010081420] = ff606077 6e2dcd72
	std	%l2,[%i2+0x020]		! Mem[0000000010081420] = 000000ff 000000d1
!	Mem[0000000010081415] = ff76594e, %l4 = 00000000f140af0a
	ldstub	[%i2+0x015],%l4		! %l4 = 00000076000000ff
!	%l2 = 00000000000000ff, Mem[0000000030041410] = 00000000
	stha	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 00ff0000
!	%f12 = 77ff2ad1, Mem[0000000030081408] = 00000000
	sta	%f12,[%i2+%o4]0x81	! Mem[0000000030081408] = 77ff2ad1
!	%l0 = 0000000000000000, Mem[0000000010101410] = ffff1867
	stba	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = ffff1800
!	%l0 = 00000000, %l1 = ffe33264, Mem[0000000030001400] = 27000000 00000000
	stda	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 ffe33264
!	Mem[0000000030001400] = 00000000, %l1 = 00000000ffe33264
	swapa	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 7ffffffff140af0a, %l3 = 00000000000000d1
	ldxa	[%i1+%g0]0x88,%l3	! %l3 = 7ffffffff140af0a

p0_label_225:
!	Mem[0000000010141418] = 00ff00ff, %l2 = 00000000000000ff
	ldsha	[%i5+0x01a]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041410] = ff000000ffb50000, %l4 = 0000000000000076
	ldx	[%i1+%o5],%l4		! %l4 = ff000000ffb50000
!	Mem[0000000030181410] = ff606077, %f0  = ff000000
	lda	[%i6+%o5]0x81,%f0 	! %f0 = ff606077
!	Mem[0000000030181408] = 6fe7a7eb, %l6 = 00000000ffb50000
	lduha	[%i6+%o4]0x81,%l6	! %l6 = 0000000000006fe7
!	Mem[00000000300c1400] = 00000000 d1512bd8, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000 00000000d1512bd8
!	Mem[0000000010081400] = 000061ff71a66f7c, %l0 = 0000000000000000
	ldxa	[%i2+0x000]%asi,%l0	! %l0 = 000061ff71a66f7c
!	Mem[0000000010101408] = ff7e61ff, %l0 = 000061ff71a66f7c
	ldsba	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = 00000f62f2690d26, %l5 = 000000000000ff00
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = 00000f62f2690d26
!	Mem[0000000030041408] = ffa003ff, %l1 = 00000000d1512bd8
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = ffffffffffa003ff
!	Starting 10 instruction Store Burst
!	%l3 = 7ffffffff140af0a, Mem[0000000010181400] = 000072cd
	stba	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 0a0072cd

p0_label_226:
!	%f4  = ffff0000 fa776362, %l5 = 00000f62f2690d26
!	Mem[0000000010101408] = ff7e61ff00000b21
	add	%i4,0x008,%g1
	stda	%f4,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010101408] = ff7e61ff0000ffff
!	Mem[0000000010101408] = ff617eff, %l1 = ffffffffffa003ff
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000ff617eff
!	Mem[00000000100c1410] = ffffff7fffff1867, %l0 = ffffffffffffffff, %l3 = 7ffffffff140af0a
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = ffffff7fffff1867
!	Mem[0000000030041410] = 0000ff00, %l4 = ff000000ffb50000
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030181410] = ff606077, %l2 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff606077
!	%f21 = ff76594e, Mem[0000000010101430] = ff000000
	st	%f21,[%i4+0x030]	! Mem[0000000010101430] = ff76594e
!	Mem[0000000010181400] = cd72000a, %l5 = 00000f62f2690d26
	ldstuba	[%i6+%g0]0x88,%l5	! %l5 = 0000000a000000ff
!	%l1 = 00000000ff617eff, Mem[0000000030001410] = 5fd0369d
	stwa	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = ff617eff
!	%f24 = 000000ff, Mem[0000000030001400] = 6432e3ff
	sta	%f24,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101434] = 0000001e, %l1 = 00000000ff617eff
	lduba	[%i4+0x036]%asi,%l1	! %l1 = 0000000000000000

p0_label_227:
!	Mem[0000000010041438] = e52742bb b8796204, %l2 = ff606077, %l3 = ffff1867
	ldda	[%i1+0x038]%asi,%l2	! %l2 = 00000000e52742bb 00000000b8796204
!	Mem[0000000010041408] = 4c32b66d000061ff, %f12 = 77ff2ad1 000000ff
	ldd	[%i1+%o4],%f12		! %f12 = 4c32b66d 000061ff
!	Mem[0000000030101400] = ff000000, %f10 = 000000ff
	lda	[%i4+%g0]0x81,%f10	! %f10 = ff000000
!	Mem[000000001010143c] = 00ff0000, %l1 = 0000000000000000
	lduba	[%i4+0x03c]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = 000037e1, %l1 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 0000000000000000
!	%f23 = 0000b5ff, %f28 = 1e7e61ff
	fcmps	%fcc1,%f23,%f28		! %fcc1 = 1
!	Mem[00000000100c1408] = 00000000, %f28 = 1e7e61ff
	lda	[%i3+%o4]0x80,%f28	! %f28 = 00000000
!	Mem[00000000100c1438] = e52742bb, %f17 = ffffff7f
	ld	[%i3+0x038],%f17	! %f17 = e52742bb
!	Mem[0000000010181428] = 7cca72a4, %l0 = ffffffffffffffff
	ldsw	[%i6+0x028],%l0		! %l0 = 000000007cca72a4
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 7fffffff, %l0 = 000000007cca72a4
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 000000007fffffff

p0_label_228:
!	%f0  = ff606077 6fe7a7eb, Mem[0000000030081410] = 671872cd ff000000
	stda	%f0 ,[%i2+%o5]0x89	! Mem[0000000030081410] = ff606077 6fe7a7eb
!	Mem[00000000300c1410] = 00001867, %l4 = 000000000000ff00
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 0000000000001867
!	%l1 = 0000000000000000, Mem[0000000010081412] = 00ff00ff, %asi = 80
	stha	%l1,[%i2+0x012]%asi	! Mem[0000000010081410] = 00ff0000
!	%l0 = 7fffffff, %l1 = 00000000, Mem[0000000010081420] = 000000ff 000000d1
	std	%l0,[%i2+0x020]		! Mem[0000000010081420] = 7fffffff 00000000
!	%l4 = 00001867, %l5 = 0000000a, Mem[0000000010081400] = 000061ff 71a66f7c
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00001867 0000000a
!	%f9  = 00000000, Mem[0000000010101408] = ff03a0ff
	sta	%f9 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l7 = 00000000ffffffe3, Mem[000000001000143e] = 85eb95f9
	stb	%l7,[%i0+0x03e]		! Mem[000000001000143c] = 85ebe3f9
!	Mem[0000000030081410] = 6fe7a7eb, %l5 = 000000000000000a
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 000000006fe7a7eb
!	Mem[00000000211c0000] = 000037e1, %l4 = 0000000000001867
	ldstub	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%f21 = ff76594e, %f23 = 0000b5ff, %f1  = 6fe7a7eb
	fdivs	%f21,%f23,%f1 		! %f1  = ff800000

p0_label_229:
!	Mem[0000000030141408] = 4e0003d0, %l1 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l1	! %l1 = 000000004e0003d0
!	Mem[000000001008141c] = 0932356f, %l1 = 000000004e0003d0
	ldsb	[%i2+0x01f],%l1		! %l1 = 000000000000006f
!	Mem[00000000100c1410] = a472ca7cffff1867, %f24 = 000000ff ffffffff
	ldda	[%i3+%o5]0x80,%f24	! %f24 = a472ca7c ffff1867
!	Mem[0000000010141400] = ffff1867, %l4 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l4	! %l4 = 0000000000001867
!	Mem[0000000010101434] = 0000001e, %l3 = 00000000b8796204
	ldub	[%i4+0x037],%l3		! %l3 = 000000000000001e
!	Mem[0000000010041410] = ff000000ffb50000, %f18 = ff76594e ffffff7f
	ldda	[%i1+%o5]0x80,%f18	! %f18 = ff000000 ffb50000
!	Mem[0000000030101410] = 4e5976ff, %l2 = 00000000e52742bb
	lduba	[%i4+%o5]0x81,%l2	! %l2 = 000000000000004e
!	Mem[0000000010181418] = 869902ff 00000000, %l0 = 7fffffff, %l1 = 0000006f
	ldda	[%i6+0x018]%asi,%l0	! %l0 = 00000000869902ff 0000000000000000
!	Mem[0000000010081410] = 4e59ffff0000ff00, %l5 = 000000006fe7a7eb
	ldxa	[%i2+%o5]0x88,%l5	! %l5 = 4e59ffff0000ff00
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000006fe7, Mem[0000000030081410] = 0a000000
	stwa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00006fe7

p0_label_230:
!	%f10 = ff000000 ffffff7f, %l7 = 00000000ffffffe3
!	Mem[0000000010181430] = 00000000000061ff
	add	%i6,0x030,%g1
	stda	%f10,[%g1+%l7]ASI_PST16_P ! Mem[0000000010181430] = 00000000ffffff7f
!	%l3 = 000000000000001e, Mem[0000000030001408] = 0000b5ff
	stwa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000001e
!	Mem[0000000030001400] = ff000000, %l6 = 0000000000006fe7
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 00000000ff000000
!	%l7 = 00000000ffffffe3, imm = 000000000000060d, %l4 = 0000000000001867
	xor	%l7,0x60d,%l4		! %l4 = 00000000fffff9ee
!	%l1 = 0000000000000000, Mem[0000000030001408] = 1e000000
	stwa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%f16 = 6db6324c e52742bb, %l3 = 000000000000001e
!	Mem[0000000030001400] = e76f0000ffe33264
	stda	%f16,[%i0+%l3]ASI_PST8_SL ! Mem[0000000030001400] = e74227e54ce33264
!	Mem[0000000010001416] = fa776362, %l0 = 00000000869902ff
	ldstub	[%i0+0x016],%l0		! %l0 = 00000063000000ff
!	%f4  = ffff0000 fa776362, Mem[0000000030101400] = ff000000 4e5976ff
	stda	%f4 ,[%i4+%g0]0x81	! Mem[0000000030101400] = ffff0000 fa776362
!	%l4 = fffff9ee, %l5 = 0000ff00, Mem[0000000010101408] = 00000000 ffff0000
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = fffff9ee 0000ff00
!	Starting 10 instruction Load Burst
!	%l2 = 000000000000004e, immd = 000000000000063c, %l7  = 00000000ffffffe3
	mulx	%l2,0x63c,%l7		! %l7 = 000000000001e648

p0_label_231:
!	Mem[00000000100c1408] = 00000000, %l3 = 000000000000001e
	lduha	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = 0000ff00, %l3 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l5 = 4e59ffff0000ff00
	lduha	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l6 = 00000000ff000000
	ldsha	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 6718ffff, %l5 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l5	! %l5 = 000000006718ffff
!	Mem[0000000030081400] = ffa003ff, %l3 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l3	! %l3 = 00000000000003ff
!	Mem[0000000010141408] = ffab0000, %l3 = 00000000000003ff
	ldsba	[%i5+%o4]0x80,%l3	! %l3 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000010101400] = ff512bd8 f5d20e48 eef9ffff 00ff0000
!	Mem[0000000010101410] = 0018ffff 620f0062 ffffffff ffffffff
!	Mem[0000000010101420] = 00000000 7a53ffff 7e181316 000000d0
!	Mem[0000000010101430] = ff76594e 0000001e 00000000 00ff0000
	ldda	[%i4]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400
!	Mem[0000000010041400] = 0aaf40f1, %f10 = ff000000
	lda	[%i1+%g0]0x80,%f10	! %f10 = 0aaf40f1
!	Starting 10 instruction Store Burst
!	%l7 = 000000000001e648, Mem[0000000010081410] = 00ff0000
	stwa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 0001e648

p0_label_232:
!	Mem[00000000300c1408] = d003a0ff, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 00000000d003a0ff
!	%f10 = 0aaf40f1 ffffff7f, Mem[0000000030041408] = ffa003ff 00000000
	stda	%f10,[%i1+%o4]0x89	! Mem[0000000030041408] = 0aaf40f1 ffffff7f
!	Mem[000000001004140f] = 000061ff, %l3 = ffffffffffffffff
	ldstuba	[%i1+0x00f]%asi,%l3	! %l3 = 000000ff000000ff
!	%f13 = 000061ff, Mem[0000000010181410] = 000000ff
	sta	%f13,[%i6+%o5]0x88	! Mem[0000000010181410] = 000061ff
!	%l1 = 00000000d003a0ff, Mem[00000000300c1410] = 00ff0000
	stba	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffff0000
!	%f10 = 0aaf40f1 ffffff7f, Mem[0000000030181408] = eba7e76f d82b51d1
	stda	%f10,[%i6+%o4]0x89	! Mem[0000000030181408] = 0aaf40f1 ffffff7f
!	%l1 = 00000000d003a0ff, Mem[0000000010001408] = 00000000
	stwa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = d003a0ff
!	%f4  = ffff0000, %f6  = 776060ff
	fcmpes	%fcc0,%f4 ,%f6 		! %fcc0 = 3
!	Mem[0000000010141404] = bb4227e5, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x004]%asi,%l3	! %l3 = 00000000bb4227e5
!	Starting 10 instruction Load Burst
!	Mem[0000000010001434] = a35aa749, %l1 = 00000000d003a0ff
	ldsh	[%i0+0x034],%l1		! %l1 = ffffffffffffa35a

p0_label_233:
!	Mem[0000000010041408] = 4c32b66d, %l6 = 0000000000000000
	lduha	[%i1+%o4]0x80,%l6	! %l6 = 0000000000004c32
!	Mem[0000000030101408] = 000000ff, %l6 = 0000000000004c32
	ldsha	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001400] = e74227e5, %l1 = ffffffffffffa35a
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffffe742
!	%l1 = ffffffffffffe742, %l3 = 00000000bb4227e5, %y  = ffffffff
	sdiv	%l1,%l3,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030101410] = 00ff00ffff76594e, %l3 = 00000000bb4227e5
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = 00ff00ffff76594e
!	Mem[00000000201c0000] = ffff1b53, %l5 = 000000006718ffff
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[000000001008140c] = ff000000, %l2 = 000000000000004e
	lduh	[%i2+0x00e],%l2		! %l2 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l3 = 00ff00ffff76594e
	ldsha	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 0aaf40f1, %l1 = ffffffffffffe742
	lduba	[%i1+%g0]0x81,%l1	! %l1 = 000000000000000a
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000000a, Mem[0000000030081408] = d12aff77
	stha	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = d12a000a

p0_label_234:
!	Mem[0000000030081408] = d12a000a, %l4 = 00000000fffff9ee
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 00000000d12a000a
!	%f4  = ffff0000 fa776362, Mem[00000000100c1400] = 00000f62 f2690d26
	stda	%f4 ,[%i3+0x000]%asi	! Mem[00000000100c1400] = ffff0000 fa776362
!	%f10 = 0aaf40f1, Mem[000000001014141c] = ff76594e
	sta	%f10,[%i5+0x01c]%asi	! Mem[000000001014141c] = 0aaf40f1
	membar	#Sync			! Added by membar checker (33)
!	%f2  = 0003a0ff, Mem[0000000010101408] = eef9ffff
	sta	%f2 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 0003a0ff
!	%f20 = 0018ffff 620f0062, %l7 = 000000000001e648
!	Mem[00000000300c1438] = fad89f8c6f000077
	add	%i3,0x038,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_S ! Mem[00000000300c1438] = fa189f8c62000077
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010081408] = 00000000 ff000000
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 00000000
!	Mem[0000000010041408] = 4c32b66d, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 0000004c000000ff
!	Mem[00000000211c0000] = ff0037e1, %l0 = 0000000000000000
	ldstub	[%o2+%g0],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000030081410] = e76f0000, %l6 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 00000000e76f0000
!	Starting 10 instruction Load Burst
!	%l6 = 00000000e76f0000, immed = 00000ba6, %y  = 00000000
	sdiv	%l6,0xba6,%l7		! %l7 = 000000000013de42
	mov	%l0,%y			! %y = 000000ff

p0_label_235:
!	Mem[0000000010141400] = ff000000 ffff1867, %l6 = e76f0000, %l7 = 0013de42
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 00000000ffff1867 00000000ff000000
!	Mem[00000000100c1410] = a472ca7c, %l0 = 00000000000000ff
	ldsba	[%i3+%o5]0x80,%l0	! %l0 = ffffffffffffffa4
!	Mem[00000000300c1410] = ffff0000, %l3 = 000000000000004c
	lduwa	[%i3+%o5]0x81,%l3	! %l3 = 00000000ffff0000
!	Mem[0000000010041400] = f140af0a, %l2 = 0000000000000000
	lduba	[%i1+%g0]0x88,%l2	! %l2 = 000000000000000a
!	Mem[0000000021800100] = ff181701, %l5 = 000000000000ffff
	lduha	[%o3+0x100]%asi,%l5	! %l5 = 000000000000ff18
!	Mem[00000000211c0000] = ff0037e1, %l7 = 00000000ff000000
	ldsb	[%o2+0x001],%l7		! %l7 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l6 = 00000000ffff1867
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 7fffffff, %l3 = 00000000ffff0000
	lduwa	[%i6+%o4]0x81,%l3	! %l3 = 000000007fffffff
!	Mem[0000000010001408] = ffa003d0, %l1 = 000000000000000a
	ldsba	[%i0+0x009]%asi,%l1	! %l1 = ffffffffffffffa0
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[00000000100c1400] = ffff0000
	stwa	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000

p0_label_236:
!	%f16 = ff512bd8 f5d20e48 eef9ffff 00ff0000
!	%f20 = 0018ffff 620f0062 ffffffff ffffffff
!	%f24 = 00000000 7a53ffff 7e181316 000000d0
!	%f28 = ff76594e 0000001e 00000000 00ff0000
	stda	%f16,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	Mem[0000000010181410] = ff610000, %l5 = 000000000000ff18
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 00000000ff610000
!	Mem[0000000030041410] = ffb50000, %l5 = 00000000ff610000
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%f10 = 0aaf40f1 ffffff7f, Mem[0000000010001408] = d003a0ff 776060ff
	stda	%f10,[%i0+%o4]0x88	! Mem[0000000010001408] = 0aaf40f1 ffffff7f
!	%l0 = ffffffffffffffa4, Mem[0000000030081400] = ffa003ff
	stba	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = ffa003a4
!	%f4  = ffff0000 fa776362, %l4 = 00000000d12a000a
!	Mem[0000000010141420] = ffffffff00000000
	add	%i5,0x020,%g1
	stda	%f4,[%g1+%l4]ASI_PST8_P ! Mem[0000000010141420] = fffffffffa006300
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 0000ffff
	stba	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000ff00
!	Mem[0000000030081400] = a403a0ff, %l0 = ffffffffffffffa4
	ldstuba	[%i2+%g0]0x81,%l0	! %l0 = 000000a4000000ff
!	Mem[0000000010041410] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l7 = 0000000000000000
	lduwa	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000

p0_label_237:
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000030141408] = 00ff0000, %l0 = 00000000000000a4
	lduba	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = cd7200ff, %l1 = ffffffffffffffa0
	lduwa	[%i6+%g0]0x88,%l1	! %l1 = 00000000cd7200ff
!	Mem[0000000030181410] = 000000ff, %l3 = 000000007fffffff
	ldsba	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 7fffffff, %l2 = 000000000000000a
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = 0000000000007fff
!	Mem[0000000030041410] = ff00b5ff00000077, %f2  = 0003a0ff 00000000
	ldda	[%i1+%o5]0x81,%f2 	! %f2  = ff00b5ff 00000077
!	Mem[0000000030181408] = 0aaf40f1ffffff7f, %f28 = ff76594e 0000001e
	ldda	[%i6+%o4]0x89,%f28	! %f28 = 0aaf40f1 ffffff7f
!	Mem[00000000100c1410] = a472ca7c, %l6 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l6	! %l6 = 000000000000a472
!	Mem[000000001014143c] = b8796204, %l6 = 000000000000a472
	ldsha	[%i5+0x03e]%asi,%l6	! %l6 = 0000000000006204
!	%f30 = 00000000 00ff0000, Mem[00000000100c1400] = 00000000 fa776362
	stda	%f30,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000 00ff0000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 00000000, %l2 = 0000000000007fff
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_238:
!	%l6 = 0000000000006204, Mem[0000000030141410] = 0018ffff620f0062
	stxa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000006204
!	%l4 = d12a000a, %l5 = 000000ff, Mem[0000000010141400] = 6718ffff 000000ff
	stda	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = d12a000a 000000ff
!	Mem[0000000010081430] = 00000000, %l7 = 0000000000000000, %asi = 80
	swapa	[%i2+0x030]%asi,%l7	! %l7 = 0000000000000000
!	%f6  = 776060ff 00000000, Mem[0000000030101408] = 000000ff 00000000
	stda	%f6 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 776060ff 00000000
!	%f10 = 0aaf40f1 ffffff7f, %l4 = 00000000d12a000a
!	Mem[00000000300c1418] = ff617e1e674b9e0c
	add	%i3,0x018,%g1
	stda	%f10,[%g1+%l4]ASI_PST8_S ! Mem[00000000300c1418] = ff617e1eff4bff0c
!	Mem[0000000030041408] = ffffff7f, %l4 = 00000000d12a000a
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 00000000ffffff7f
!	Mem[0000000010181425] = ffa003d0, %l1 = 00000000cd7200ff
	ldstuba	[%i6+0x025]%asi,%l1	! %l1 = 000000a0000000ff
!	Mem[0000000010041406] = ffffff7f, %l0 = 0000000000000000
	ldstuba	[%i1+0x006]%asi,%l0	! %l0 = 000000ff000000ff
!	%f28 = 0aaf40f1 ffffff7f, Mem[0000000030141400] = 480ed2f5 d82b51ff
	stda	%f28,[%i5+%g0]0x81	! Mem[0000000030141400] = 0aaf40f1 ffffff7f
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff7071a6, %l6 = 0000000000006204
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = ffffffffffffffa6

p0_label_239:
!	Mem[0000000010101410] = 0018ffff 620f0062, %l0 = 000000ff, %l1 = 000000a0
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 000000000018ffff 00000000620f0062
!	%f0  = ff606077, Mem[0000000010041408] = 6db632ff
	sta	%f0 ,[%i1+%o4]0x88	! Mem[0000000010041408] = ff606077
!	Mem[0000000030181410] = ff000000, %l2 = 0000000000000000
	ldsba	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, %l5 = 00000000000000ff, %l1 = 00000000620f0062
	xnor	%l2,%l5,%l1		! %l1 = ffffffffffffff00
!	Mem[0000000030081410] = ff000000776060ff, %l2 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l2	! %l2 = ff000000776060ff
!	Mem[0000000010041400] = f140af0a, %l7 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l7	! %l7 = fffffffff140af0a
!	%f12 = 4c32b66d, %f25 = 7a53ffff, %f17 = f5d20e48
	fmuls	%f12,%f25,%f17		! %f17 = 7f800000
!	Mem[0000000030041410] = ff00b5ff, %l5 = 00000000000000ff
	lduha	[%i1+%o5]0x81,%l5	! %l5 = 000000000000ff00
!	%f9  = 00000000, %f22 = ffffffff, %f27 = 000000d0
	fsubs	%f9 ,%f22,%f27		! %f27 = ffffffff
!	Starting 10 instruction Store Burst
!	%f5  = fa776362, %f16 = ff512bd8
	fcmps	%fcc2,%f5 ,%f16		! %fcc2 = 2

p0_label_240:
!	%f26 = 7e181316 ffffffff, %l7 = fffffffff140af0a
!	Mem[0000000010081430] = 0000000000000000
	add	%i2,0x030,%g1
	stda	%f26,[%g1+%l7]ASI_PST16_P ! Mem[0000000010081430] = 7e180000ffff0000
!	Mem[0000000010041410] = ff000000, %l7 = fffffffff140af0a
	swapa	[%i1+%o5]0x80,%l7	! %l7 = 00000000ff000000
!	%l2 = ff000000776060ff, Mem[0000000010101400] = ff512bd8f5d20e48, %asi = 80
	stxa	%l2,[%i4+0x000]%asi	! Mem[0000000010101400] = ff000000776060ff
!	%f30 = 00000000, Mem[00000000300c1408] = 00000000
	sta	%f30,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000010041408] = 776060ff, %l7 = 00000000ff000000
	ldstuba	[%i1+%o4]0x80,%l7	! %l7 = 00000077000000ff
!	%l2 = ff000000776060ff, Mem[00000000300c1408] = 00000000
	stwa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 776060ff
!	%f0  = ff606077 ff800000 ff00b5ff 00000077
!	%f4  = ffff0000 fa776362 776060ff 00000000
!	%f8  = 00000f62 00000000 0aaf40f1 ffffff7f
!	%f12 = 4c32b66d 000061ff e7e33264 85eb95f9
	stda	%f0,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	Mem[0000000010141400] = 0a002ad1, %l6 = ffffffffffffffa6
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 000000d1000000ff
!	%l7 = 0000000000000077, Mem[0000000010001408] = 7fffffff
	stwa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000077
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %f24 = 00000000
	lda	[%i0+%g0]0x80,%f24	! %f24 = 00000000

p0_label_241:
!	Mem[0000000030041400] = 7fffffff f140af0a, %l6 = 000000d1, %l7 = 00000077
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 00000000f140af0a 000000007fffffff
!	Mem[00000000218000c0] = 00008436, %l4 = 00000000ffffff7f
	ldsb	[%o3+0x0c1],%l4		! %l4 = 0000000000000000
!	Mem[0000000030001410] = ff7e61ff, %l2 = ff000000776060ff
	ldsba	[%i0+%o5]0x81,%l2	! %l2 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000030101410] = ffff0000fa776362, %f16 = ff512bd8 7f800000
	ldda	[%i4+%o5]0x89,%f16	! %f16 = ffff0000 fa776362
!	Mem[0000000030101410] = 626377fa, %l0 = 000000000018ffff
	lduha	[%i4+%o5]0x81,%l0	! %l0 = 0000000000006263
!	Mem[0000000030181400] = ff000000, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030041410] = ff00b5ff, %l7 = 000000007fffffff
	ldswa	[%i1+%o5]0x81,%l7	! %l7 = ffffffffff00b5ff
!	Mem[0000000010081410] = 48e60100, %l0 = 0000000000006263
	ldsha	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000100
!	Mem[0000000010001410] = a67170fffa77ff62, %f16 = ffff0000 fa776362
	ldda	[%i0+%o5]0x80,%f16	! %f16 = a67170ff fa77ff62
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = ff000000, %l7 = ffffffffff00b5ff
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 000000ff000000ff

p0_label_242:
!	%f30 = 00000000, %f17 = fa77ff62
	fcmpes	%fcc1,%f30,%f17		! %fcc1 = 2
!	Mem[00000000100c1400] = 00000000, %l5 = 000000000000ff00
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l0 = 0000000000000100
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l6 = 00000000f140af0a, %l0 = 0000000000000000, %l5 = 0000000000000000
	add	%l6,%l0,%l5		! %l5 = 00000000f140af0a
!	Mem[0000000030101410] = 626377fa, %l6 = 00000000f140af0a
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000626377fa
!	%f20 = 0018ffff 620f0062, %l5 = 00000000f140af0a
!	Mem[0000000030141408] = 0000ff00fffff9ee
	add	%i5,0x008,%g1
	stda	%f20,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030141408] = 0000ff62fffff9ee
!	Mem[0000000010001400] = 00000000, %l5 = 00000000f140af0a
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%f4  = ffff0000 fa776362, Mem[0000000010001400] = f140af0a eba7e76f
	stda	%f4 ,[%i0+%g0]0x88	! Mem[0000000010001400] = ffff0000 fa776362
!	%f16 = a67170ff fa77ff62 eef9ffff 00ff0000
!	%f20 = 0018ffff 620f0062 ffffffff ffffffff
!	%f24 = 00000000 7a53ffff 7e181316 ffffffff
!	%f28 = 0aaf40f1 ffffff7f 00000000 00ff0000
	stda	%f16,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000077, %l7 = 00000000000000ff
	ldswa	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000077

p0_label_243:
!	Mem[00000000300c1408] = 00000000ff606077, %l1 = ffffffffffffff00
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = 00000000ff606077
!	Mem[0000000010081408] = ff000000, %l4 = 0000000000000000
	lduha	[%i2+%o4]0x80,%l4	! %l4 = 000000000000ff00
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000030041408] = 0000ff00fffff9ee, %f12 = 4c32b66d 000061ff
	ldda	[%i1+%o4]0x89,%f12	! %f12 = 0000ff00 fffff9ee
!	Mem[0000000010141410] = 0aaf40f15f064a5e, %l6 = 00000000626377fa
	ldxa	[%i5+%o5]0x80,%l6	! %l6 = 0aaf40f15f064a5e
!	%l7 = 0000000000000077, imm = fffffffffffffc39, %l3 = ffffffffffffff00
	xnor	%l7,-0x3c7,%l3		! %l3 = 00000000000003b1
!	Mem[0000000030041410] = 0018ffff, %f26 = 7e181316
	lda	[%i1+%o5]0x81,%f26	! %f26 = 0018ffff
!	Mem[0000000010081400] = 67180000, %l2 = ffffffffffffffff
	ldsba	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = ffff1b53, %l3 = 00000000000003b1
	ldsb	[%o0+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030181410] = ff000000, %l3 = ffffffffffffffff
	ldsba	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f19 = 00ff0000, Mem[0000000030041408] = eef9ffff
	sta	%f19,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ff0000

p0_label_244:
!	%f28 = 0aaf40f1 ffffff7f, Mem[0000000030181408] = 7fffffff f140af0a
	stda	%f28,[%i6+%o4]0x81	! Mem[0000000030181408] = 0aaf40f1 ffffff7f
!	%l3 = 0000000000000000, Mem[0000000030181410] = 000000ff
	stha	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff
!	%l4 = 000000000000ff00, Mem[0000000030141410] = 00006204
	stba	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00006200
!	%f26 = 0018ffff ffffffff, Mem[0000000010001410] = a67170ff fa77ff62
	std	%f26,[%i0+%o5]	! Mem[0000000010001410] = 0018ffff ffffffff
!	%l0 = 0000000000000000, Mem[0000000010041430] = 1eff61ff
	stw	%l0,[%i1+0x030]		! Mem[0000000010041430] = 00000000
!	Mem[0000000030181410] = 000000ff, %l1 = 00000000ff606077
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%f2  = ff00b5ff, Mem[0000000010081438] = d2ab68ff
	sta	%f2 ,[%i2+0x038]%asi	! Mem[0000000010081438] = ff00b5ff
!	%l5 = 0000000000000000, Mem[0000000010081400] = 00001867
	stha	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 00001867
!	%f20 = 0018ffff 620f0062, %l6 = 0aaf40f15f064a5e
!	Mem[0000000010141428] = 293e0dfb00000000
	add	%i5,0x028,%g1
	stda	%f20,[%g1+%l6]ASI_PST32_P ! Mem[0000000010141428] = 0018ffff00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00620000, %l6 = 0aaf40f15f064a5e
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000062

p0_label_245:
!	Mem[0000000030081408] = eef9ffff, %l7 = 0000000000000077
	ldsha	[%i2+%o4]0x81,%l7	! %l7 = ffffffffffffeef9
!	Mem[0000000010181438] = da82ff79fb0d3eff, %f18 = eef9ffff 00ff0000
	ldd	[%i6+0x038],%f18	! %f18 = da82ff79 fb0d3eff
!	Mem[00000000211c0000] = ff0037e1, %l2 = 0000000000000000
	ldsb	[%o2+0x001],%l2		! %l2 = 0000000000000000
!	Mem[0000000030001400] = e74227e5, %l2 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l2	! %l2 = 00000000e74227e5
!	Mem[00000000100c1400] = 0000ff00000000ff, %f28 = 0aaf40f1 ffffff7f
	ldda	[%i3+%g0]0x88,%f28	! %f28 = 0000ff00 000000ff
!	Mem[00000000211c0000] = ff0037e1, %l3 = 0000000000000000
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffff00
!	Mem[0000000010001404] = 0000ffff, %f24 = 00000000
	lda	[%i0+0x004]%asi,%f24	! %f24 = 0000ffff
!	Mem[0000000030041400] = ff7071a6, %l0 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l0	! %l0 = 00000000000071a6
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000030181400] = ff000000 0000ab74 0aaf40f1 ffffff7f
!	Mem[0000000030181410] = ff606077 6432e3e7 53b35b83 f2690d26
!	Mem[0000000030181420] = 00000000 7a00fcff 1e000000 000000ff
!	Mem[0000000030181430] = 53b35b83 00000000 03d00000 00000000
	ldda	[%i6]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030181400
!	Starting 10 instruction Store Burst
!	%l0 = 000071a6, %l1 = 000000ff, Mem[0000000010181408] = 74000000 ff76594e
	stda	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 000071a6 000000ff

p0_label_246:
!	%l2 = 00000000e74227e5, Mem[000000001010140b] = 0003a0ff
	stb	%l2,[%i4+0x00b]		! Mem[0000000010101408] = 0003a0e5
!	%l2 = 00000000e74227e5, Mem[0000000030101408] = 77000000
	stba	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = e5000000
!	%l7 = ffffffffffffeef9, immd = fffffffffffff5a6, %l5 = 0000000000000000
	udivx	%l7,-0xa5a,%l5		! %l5 = 0000000000000000
!	Mem[000000001010142c] = 000000d0, %l0 = 00000000000071a6, %asi = 80
	swapa	[%i4+0x02c]%asi,%l0	! %l0 = 00000000000000d0
!	%l4 = 000000000000ff00, Mem[0000000030101408] = e5000000
	stwa	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ff00
!	Mem[0000000010001400] = fa776362, %l7 = ffffffffffffeef9
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 00000062000000ff
!	%f0  = ff606077, Mem[0000000010041424] = 00000000
	st	%f0 ,[%i1+0x024]	! Mem[0000000010041424] = ff606077
!	Mem[0000000010041401] = 0aaf40f1, %l1 = 00000000000000ff
	ldstub	[%i1+0x001],%l1		! %l1 = 000000af000000ff
!	%f10 = 0aaf40f1 ffffff7f, %l1 = 00000000000000af
!	Mem[00000000300c1420] = ff617e1e4e5976ff
	add	%i3,0x020,%g1
	stda	%f10,[%g1+%l1]ASI_PST16_S ! Mem[00000000300c1420] = 0aaf40f1ffffff7f
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff606077000000ff, %l2 = 00000000e74227e5
	ldxa	[%i4+%g0]0x88,%l2	! %l2 = ff606077000000ff

p0_label_247:
!	Mem[0000000030181410] = ff606077, %l1 = 00000000000000af
	lduha	[%i6+%o5]0x81,%l1	! %l1 = 000000000000ff60
!	Mem[0000000010101408] = 0003a0e5, %l4 = 000000000000ff00
	lduh	[%i4+%o4],%l4		! %l4 = 0000000000000003
!	Mem[0000000010081400] = 67180000, %l2 = ff606077000000ff
	ldsba	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 00620000, %l1 = 000000000000ff60
	ldsha	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000062
!	Mem[00000000201c0000] = ffff1b53, %l1 = 0000000000000062
	ldsh	[%o0+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[00000000201c0000] = ffff1b53, %l2 = 0000000000000000
	ldub	[%o0+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = a472ca7c, %l6 = 0000000000000062
	lduwa	[%i3+%o5]0x80,%l6	! %l6 = 00000000a472ca7c
!	Mem[0000000020800000] = ff00aff8, %l2 = 00000000000000ff
	lduh	[%o1+%g0],%l2		! %l2 = 000000000000ff00
!	%l4 = 0000000000000003, Mem[00000000300c1410] = 0000ff00
	stwa	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000003
!	Starting 10 instruction Store Burst
!	%l6 = 00000000a472ca7c, %l6 = 00000000a472ca7c, %l6 = 00000000a472ca7c
	add	%l6,%l6,%l6		! %l6 = 0000000148e594f8

p0_label_248:
!	Mem[0000000020800000] = ff00aff8, %l5 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000100c1400] = 000000ff, %l1 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%l7 = 0000000000000062, Mem[0000000010181400] = cd7200ff
	stha	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = cd720062
!	%l0 = 00000000000000d0, Mem[0000000030141408] = 0000ff62
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00d0ff62
	membar	#Sync			! Added by membar checker (38)
!	%f6  = 776060ff, Mem[0000000030181400] = ff000000
	sta	%f6 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 776060ff
!	%f22 = 260d69f2 835bb353, Mem[0000000010041410] = 0aaf40f1 0000b5ff
	stda	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = 260d69f2 835bb353
!	%l6 = 0000000148e594f8, Mem[0000000010081408] = ff00000000000000
	stxa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000148e594f8
!	%l0 = 00000000000000d0, Mem[0000000010141410] = 0aaf40f15f064a5e
	stxa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000000000d0
!	Mem[0000000010041418] = 00ff00ff, %l5 = 000000ff, %l7 = 00000062
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 0000000000ff00ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff000000 00000000, %l4 = 00000003, %l5 = 000000ff
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000 00000000ff000000

p0_label_249:
!	Mem[0000000030081400] = ff03a0ff 00000000, %l2 = 0000ff00, %l3 = ffffff00
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000ff03a0ff 0000000000000000
!	Mem[0000000030101408] = ff00b5ff00ff0000, %l7 = 0000000000ff00ff
	ldxa	[%i4+%o4]0x89,%l7	! %l7 = ff00b5ff00ff0000
!	%l5 = 00000000ff000000, imm = 00000000000004ed, %l5 = 00000000ff000000
	sub	%l5,0x4ed,%l5		! %l5 = 00000000fefffb13
!	Mem[0000000010101408] = 0000ff00e5a00300, %f14 = e7e33264 85eb95f9
	ldda	[%i4+%o4]0x88,%f14	! %f14 = 0000ff00 e5a00300
!	%l2 = 00000000ff03a0ff, Mem[000000001004141c] = ff76594e, %asi = 80
	stha	%l2,[%i1+0x01c]%asi	! Mem[000000001004141c] = a0ff594e
!	Mem[0000000010141400] = 0a002aff, %l1 = 00000000000000ff
	ldsha	[%i5+%g0]0x88,%l1	! %l1 = 0000000000002aff
!	%l1 = 0000000000002aff, imm = fffffffffffff4d6, %l2 = 00000000ff03a0ff
	add	%l1,-0xb2a,%l2		! %l2 = 0000000000001fd5
!	Mem[0000000030041410] = 0018ffff, %l2 = 0000000000001fd5
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 0018ffff, %l7 = ff00b5ff00ff0000
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000018
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010001408] = 00000077 f140af0a
	stda	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 00000000

p0_label_250:
!	%l4 = 0000000000000000, Mem[0000000030081410] = ff000000776060ff
	stxa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l1 = 0000000000002aff
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%f0  = ff606077 ff800000, Mem[0000000010041408] = ff6060ff 000061ff
	stda	%f0 ,[%i1+%o4]0x80	! Mem[0000000010041408] = ff606077 ff800000
!	%f8  = 00000f62, Mem[0000000010041400] = 0aff40f1
	sta	%f8 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000f62
!	Mem[0000000010181410] = 0000ff18, %l0 = 00000000000000d0
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%f28 = 00000000 835bb353, %l3 = 0000000000000000
!	Mem[0000000010141430] = 1e7e61ffffff1867
	add	%i5,0x030,%g1
	stda	%f28,[%g1+%l3]ASI_PST16_P ! Mem[0000000010141430] = 1e7e61ffffff1867
!	%l3 = 0000000000000000, Mem[0000000010081400] = 000018670000000a
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000
!	Mem[0000000030141410] = 00006200, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 0000000000006200
!	%l4 = 0000000000000000, Mem[0000000010181410] = 18ff00ff
	stwa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	Starting 10 instruction Load Burst
!	%l5 = 00000000fefffb13, %l6 = 0000000148e594f8, %l3 = 0000000000000000
	subc	%l5,%l6,%l3		! %l3 = ffffffffb61a661b

p0_label_251:
!	Mem[0000000030181410] = ff606077, %l6 = 0000000148e594f8
	lduba	[%i6+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101410] = 0018ffff620f0062, %f26 = ff000000 0000001e
	ldda	[%i4+%o5]0x80,%f26	! %f26 = 0018ffff 620f0062
!	Mem[0000000010001410] = ffffffff ffff1800, %l4 = 00000000, %l5 = fefffb13
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 00000000ffff1800 00000000ffffffff
!	Mem[0000000030001400] = e74227e5, %l3 = ffffffffb61a661b
	lduha	[%i0+%g0]0x81,%l3	! %l3 = 000000000000e742
!	Mem[0000000010041408] = ff606077, %l2 = 0000000000006200
	ldsba	[%i1+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001408] = 0000000000000000, %l1 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = ffff1800, %l3 = 000000000000e742
	ldswa	[%i4+%o5]0x88,%l3	! %l3 = ffffffffffff1800
!	Mem[0000000010101410] = 62000f62ffff1800, %f10 = 0aaf40f1 ffffff7f
	ldda	[%i4+%o5]0x88,%f10	! %f10 = 62000f62 ffff1800
!	Mem[0000000010101410] = 0018ffff, %l3 = ffffffffffff1800
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000018
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ffff1800, %l0 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_252:
!	%l0 = 0000000000000000, Mem[0000000010081400] = 00000000
	stha	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l4 = 00000000ffff1800, Mem[00000000201c0000] = ffff1b53
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 18001b53
!	%f30 = 00000000 0000d003, Mem[0000000010141400] = ff2a000a 000000ff
	std	%f30,[%i5+%g0]	! Mem[0000000010141400] = 00000000 0000d003
!	%f10 = 62000f62 ffff1800, Mem[0000000010181438] = da82ff79 fb0d3eff
	std	%f10,[%i6+0x038]	! Mem[0000000010181438] = 62000f62 ffff1800
!	%l0 = 0000000000000000, Mem[0000000030181400] = ff606077
	stba	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = ff606000
!	%l2 = ffffffff, %l3 = 00000018, Mem[0000000010101400] = 000000ff ff606077
	stda	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffff 00000018
!	Mem[0000000010141408] = 0000abff, %l6 = 00000000000000ff
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 000000000000abff
!	%f30 = 00000000, %f20 = e7e33264, %f10 = 62000f62
	fadds	%f30,%f20,%f10		! %f10 = e7e33264
!	Mem[0000000020800041] = b66de56e, %l2 = ffffffffffffffff
	ldstub	[%o1+0x041],%l2		! %l2 = 0000006d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = b6ffe56e, %l7 = 0000000000000018
	lduh	[%o1+0x040],%l7		! %l7 = 000000000000b6ff

p0_label_253:
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000030141400] = 0aaf40f1 ffffff7f 00d0ff62 fffff9ee
!	Mem[0000000030141410] = 00000000 00000000 ffffffff ffffffff
!	Mem[0000000030141420] = ffff537a 00000000 d0000000 1613187e
!	Mem[0000000030141430] = 1e000000 4e5976ff 0000ff00 00000000
	ldda	[%i5]ASI_BLK_S,%f0	! Block Load from 0000000030141400
!	Mem[0000000010041408] = 776060ff, %l6 = 000000000000abff
	lduha	[%i1+%o4]0x88,%l6	! %l6 = 00000000000060ff
!	Mem[0000000010041404] = ffffff7f, %l0 = 0000000000000000
	ldswa	[%i1+0x004]%asi,%l0	! %l0 = ffffffffffffff7f
!	Mem[00000000201c0000] = 18001b53, %l4 = 00000000ffff1800
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = 0000000000001800
!	Mem[0000000021800180] = ffffca9e, %l4 = 0000000000001800
	lduha	[%o3+0x180]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010181410] = 00000000, %l5 = 00000000ffffffff
	ldsba	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = 0001e648ffff594e, %l0 = ffffffffffffff7f
	ldxa	[%i2+%o5]0x80,%l0	! %l0 = 0001e648ffff594e
!	Mem[0000000010181410] = 00000000, %l0 = 0001e648ffff594e
	ldsha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Code Fragment 4
p0_fragment_18:
!	%l0 = 0000000000000000
	setx	0x33133e1ffe0c7c24,%g7,%l0 ! %l0 = 33133e1ffe0c7c24
!	%l1 = 0000000000000000
	setx	0xb1db6217f54d6a43,%g7,%l1 ! %l1 = b1db6217f54d6a43
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 33133e1ffe0c7c24
	setx	0xe8cd0d504a8add71,%g7,%l0 ! %l0 = e8cd0d504a8add71
!	%l1 = b1db6217f54d6a43
	setx	0x58d308a7c5e28f72,%g7,%l1 ! %l1 = 58d308a7c5e28f72
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000018, Mem[0000000010101410] = ff18ffff
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000018

p0_label_254:
!	%f24 = fffc007a 00000000, Mem[0000000010081438] = ff00b5ff 40ff1e7d
	stda	%f24,[%i2+0x038]%asi	! Mem[0000000010081438] = fffc007a 00000000
!	%l1 = 58d308a7c5e28f72, imm = 0000000000000da9, %l1 = 58d308a7c5e28f72
	orn	%l1,0xda9,%l1		! %l1 = ffffffffffffff76
!	Mem[0000000010181408] = 000071a6, %l2 = 000000000000006d
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 000000a6000000ff
!	Mem[00000000300c1400] = 00000000, %l6 = 00000000000060ff
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l0 = e8cd0d504a8add71, Mem[0000000030041410] = 0018ffff
	stwa	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 4a8add71
!	Mem[0000000010081408] = 00000001, %l3 = 0000000000000018
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000001
!	%f30 = 00000000 0000d003, Mem[0000000010101408] = e5a00300 0000ff00
	stda	%f30,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 0000d003
!	Mem[0000000030141400] = f140af0a, %l5 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 00000000f140af0a
!	Mem[0000000010001410] = 0018ffff, %l4 = 000000000000ffff
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 71dd8a4a, %f26 = 0018ffff
	lda	[%i1+%o5]0x89,%f26	! %f26 = 71dd8a4a

p0_label_255:
!	Mem[00000000100c1400] = ff000000, %f0  = 0aaf40f1
	lda	[%i3+0x000]%asi,%f0 	! %f0 = ff000000
!	Mem[0000000010081410] = 0001e648, %l3 = 0000000000000001
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = 000000000001e648
!	Mem[0000000010181400] = cd720062, %l2 = 00000000000000a6
	ldswa	[%i6+%g0]0x88,%l2	! %l2 = ffffffffcd720062
!	Mem[0000000010041400] = 00000f62, %l5 = 00000000f140af0a
	lduba	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = 00000f62, %l0 = e8cd0d504a8add71
	lduha	[%i1+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = ffffffff, %l1 = ffffffffffffff76
	lduwa	[%i4+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030001400] = e52742e7, %l2 = ffffffffcd720062
	ldsba	[%i0+%g0]0x89,%l2	! %l2 = ffffffffffffffe7
!	Mem[0000000030001410] = ff617eff, %l1 = 00000000ffffffff
	ldsba	[%i0+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030141410] = 0000000000000000, %l4 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010141410] = d0000000000000ff
	stxa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000

p0_label_256:
!	%l4 = 0000000000000000, Mem[0000000030101408] = 00ff0000
	stwa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	Mem[0000000010141408] = 000000ff, %l0 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %l5 = 00000000, %l2 = ffffffe7
	casa	[%i5]0x80,%l5,%l2	! %l2 = 0000000000000000
!	%l6 = 00000000, %l7 = 0000b6ff, Mem[0000000030181408] = f140af0a 7fffffff
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 0000b6ff
!	%l4 = 0000000000000000, Mem[0000000030041408] = 00ff0000
	stba	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ff0000
!	%l6 = 0000000000000000, Mem[0000000010181410] = 6e2dcd7200000000
	stxa	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	%l2 = 0000000000000000, imm = fffffffffffff106, %l5 = 0000000000000000
	sub	%l2,-0xefa,%l5		! %l5 = 0000000000000efa
!	Mem[0000000010081400] = 00000000, %l3 = 000000000001e648
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[000000001014140a] = 00000000, %asi = 80
	stha	%l4,[%i5+0x00a]%asi	! Mem[0000000010141408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 4a8add71, %l0 = 00000000000000ff
	lduha	[%i1+%o5]0x81,%l0	! %l0 = 0000000000004a8a

p0_label_257:
!	%l5 = 0000000000000efa, immd = fffffffffffff38c, %l3 = 0000000000000000
	sdivx	%l5,-0xc74,%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = ffffffff, %f15 = 00000000
	lda	[%i4+%g0]0x88,%f15	! %f15 = ffffffff
!	Mem[0000000010101428] = 7e181316, %l3 = ffffffffffffffff
	ldsha	[%i4+0x028]%asi,%l3	! %l3 = 0000000000007e18
!	Mem[0000000030181400] = 006060ff, %l0 = 0000000000004a8a
	lduba	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 00000000 00000000, %l2 = 00000000, %l3 = 00007e18
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030101410] = f140af0a0000ffff, %f12 = 1e000000 4e5976ff
	ldda	[%i4+%o5]0x81,%f12	! %f12 = f140af0a 0000ffff
!	Mem[0000000030001408] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = ffff00000aaf40f1, %f20 = e7e33264 776060ff
	ldda	[%i4+%o5]0x89,%f20	! %f20 = ffff0000 0aaf40f1
!	Mem[00000000201c0000] = 18001b53, %l4 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000018
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ffa003ff, %l1 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x89,%l1	! %l1 = 000000ff000000ff

p0_label_258:
!	%l6 = 00000000, %l7 = 0000b6ff, Mem[00000000100c1430] = ff606077 ff000000
	std	%l6,[%i3+0x030]		! Mem[00000000100c1430] = 00000000 0000b6ff
!	%l5 = 0000000000000efa, Mem[0000000030001400] = e74227e5
	stwa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000efa
!	%l7 = 000000000000b6ff, Mem[0000000021800181] = ffffca9e, %asi = 80
	stba	%l7,[%o3+0x181]%asi	! Mem[0000000021800180] = ffffca9e
!	%f6  = ffffffff ffffffff, Mem[0000000010101408] = 0000d003 00000000
	stda	%f6 ,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff ffffffff
!	%f25 = 00000000, %f2  = 00d0ff62, %f15 = ffffffff
	fdivs	%f25,%f2 ,%f15		! %f15 = 00000000
!	Mem[0000000010081400] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 0000b6ff, Mem[0000000010001428] = 000000ff ffffff7f
	std	%l6,[%i0+0x028]		! Mem[0000000010001428] = 00000000 0000b6ff
!	Mem[00000000201c0001] = 18001b53, %l2 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[000000001004143a] = e52742bb, %l4 = 0000000000000018
	ldstuba	[%i1+0x03a]%asi,%l4	! %l4 = 00000042000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %l2 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000

p0_label_259:
!	Mem[0000000010101408] = ffffffff, %l3 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101400] = ff800000, %l5 = 0000000000000efa
	ldsha	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = ffff18ff, %l2 = 0000000000000000
	ldswa	[%i0+%o5]0x88,%l2	! %l2 = ffffffffffff18ff
!	Mem[0000000010101408] = ffffffffffffffff, %l3 = 00000000000000ff
	ldxa	[%i4+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	%l2 = ffffffffffff18ff, imm = 000000000000004a, %l5 = 0000000000000000
	sub	%l2,0x04a,%l5		! %l5 = ffffffffffff18b5
!	Mem[0000000010101410] = 18000000, %l2 = ffffffffffff18ff
	ldswa	[%i4+%o5]0x88,%l2	! %l2 = 0000000018000000
!	Mem[000000001018140c] = ff000000, %l6 = 0000000000000000
	lduha	[%i6+0x00e]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = 18ff1b53, %l1 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 00000000000018ff
!	Mem[00000000300c1400] = ff000000, %l5 = ffffffffffff18b5
	ldswa	[%i3+%g0]0x81,%l5	! %l5 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 620072cd, %l4 = 0000000000000042
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000620072cd

p0_label_260:
!	%l1 = 00000000000018ff, Mem[0000000010181430] = 00000000ffffff7f, %asi = 80
	stxa	%l1,[%i6+0x030]%asi	! Mem[0000000010181430] = 00000000000018ff
!	%l7 = 000000000000b6ff, imm = 0000000000000400, %l3 = ffffffffffffffff
	addc	%l7,0x400,%l3		! %l3 = 000000000000baff
!	Mem[0000000010081408] = 00000018, %l5 = ffffffffff000000
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000018
!	Mem[0000000010081410] = 0001e648, %l5 = 0000000000000018
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 000000000001e648
!	%l7 = 000000000000b6ff, Mem[0000000030001400] = 00000efa
	stba	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = ff000efa
!	Mem[0000000010041408] = ff606077, %l7 = 000000000000b6ff
	ldstuba	[%i1+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000021800040] = ff09f702, %l4 = 00000000620072cd
	ldstuba	[%o3+0x040]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000300c1410] = 00000003, %l7 = 00000000000000ff
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 0000000000000003
!	Mem[0000000010181408] = 000071ff, %l7 = 0000000000000003
	swapa	[%i6+%o4]0x88,%l7	! %l7 = 00000000000071ff
!	Starting 10 instruction Load Burst
!	%f26 = 71dd8a4a 620f0062, %l0 = 0000000000000000
!	Mem[0000000030001400] = ff000efa4ce33264
	stda	%f26,[%i0+%l0]ASI_PST32_SL ! Mem[0000000030001400] = ff000efa4ce33264

p0_label_261:
!	Mem[0000000030081400] = 00000000 ffa003ff, %l0 = 00000000, %l1 = 000018ff
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 00000000ffa003ff 0000000000000000
!	Mem[0000000030081400] = ff03a0ff, %f16 = 74ab0000
	lda	[%i2+%g0]0x81,%f16	! %f16 = ff03a0ff
!	Mem[0000000030041408] = 00ff0000, %l1 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l1	! %l1 = 0000000000ff0000
!	Mem[0000000030081400] = ffa003ff, %l2 = 0000000018000000
	lduba	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = 776060ff 00000000, %l0 = ffa003ff, %l1 = 00ff0000
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 00000000776060ff 0000000000000000
!	%l5 = 000000000001e648, immed = 00000607, %y  = 000000ff
	udiv	%l5,0x607,%l6		! %l6 = 000000002a4ea491
	mov	%l0,%y			! %y = 776060ff
!	Mem[0000000030181408] = 00000000ffb60000, %l4 = 00000000000000ff
	ldxa	[%i6+%o4]0x81,%l4	! %l4 = 00000000ffb60000
!	Mem[0000000010081434] = ffff0000, %f20 = ffff0000
	lda	[%i2+0x034]%asi,%f20	! %f20 = ffff0000
!	Mem[000000001004140c] = ff800000, %l3 = 000000000000baff
	lduba	[%i1+0x00c]%asi,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 000000002a4ea491, Mem[0000000030101408] = 00000000
	stba	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 91000000

p0_label_262:
!	%l7 = 00000000000071ff, Mem[0000000030081400] = ffa003ff
	stba	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = ffa003ff
!	Mem[0000000030141400] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l4 = ffb60000, %l5 = 0001e648, Mem[0000000010081400] = ff000000 00000000
	std	%l4,[%i2+%g0]		! Mem[0000000010081400] = ffb60000 0001e648
!	%l5 = 000000000001e648, Mem[0000000010081419] = 00007e00
	stb	%l5,[%i2+0x019]		! Mem[0000000010081418] = 00487e00
!	Code Fragment 4
p0_fragment_19:
!	%l0 = 00000000776060ff
	setx	0x34be2a480b6d5fd9,%g7,%l0 ! %l0 = 34be2a480b6d5fd9
!	%l1 = 0000000000000000
	setx	0x84f55fb009f9d4e7,%g7,%l1 ! %l1 = 84f55fb009f9d4e7
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 34be2a480b6d5fd9
	setx	0x85f0158878aae78b,%g7,%l0 ! %l0 = 85f0158878aae78b
!	%l1 = 84f55fb009f9d4e7
	setx	0xf7d2d1e02e88837e,%g7,%l1 ! %l1 = f7d2d1e02e88837e
!	%l1 = f7d2d1e02e88837e, Mem[0000000030001400] = ff000efa
	stba	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 7e000efa
!	Mem[0000000010041400] = 620f0000, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = 7e000efa, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 000000007e000efa
!	%l6 = 000000002a4ea491, Mem[0000000010101400] = ffffffff18000000
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000002a4ea491
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000ff, %f12 = f140af0a
	lda	[%i5+%g0]0x89,%f12	! %f12 = 000000ff

p0_label_263:
!	Mem[0000000030181408] = 00000000, %l3 = 000000007e000efa
	lduwa	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%l0 = 85f0158878aae78b, %l0 = 85f0158878aae78b, %y  = 776060ff
	sdiv	%l0,%l0,%l5		! %l5 = 000000007fffffff
	mov	%l0,%y			! %y = 78aae78b
!	Mem[0000000010101410] = 00000018, %l1 = f7d2d1e02e88837e
	ldub	[%i4+0x013],%l1		! %l1 = 0000000000000018
!	Mem[0000000030041400] = ff7071a6, %l2 = 00000000000000ff
	ldswa	[%i1+%g0]0x89,%l2	! %l2 = ffffffffff7071a6
!	Mem[0000000010001400] = ff6377fa, %l1 = 0000000000000018
	ldsha	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffff63
!	Mem[0000000010101410] = 00000018620f0062, %f30 = 00000000 0000d003
	ldda	[%i4+%o5]0x80,%f30	! %f30 = 00000018 620f0062
!	Mem[0000000010101400] = 00000000, %l0 = 85f0158878aae78b
	ldswa	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 000000ff, %l1 = ffffffffffffff63
	lduba	[%i5+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181408] = 00000000 ffb60000, %l2 = ff7071a6, %l3 = 00000000
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000 00000000ffb60000
!	Starting 10 instruction Store Burst
!	%f4  = 00000000, %f8  = ffff537a, %f6  = ffffffff
	fadds	%f4 ,%f8 ,%f6 		! %f6  = ffff537a

p0_label_264:
!	Mem[0000000010181410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%l3 = 00000000ffb60000, Mem[0000000030001408] = 00000000
	stwa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = ffb60000
!	%f14 = 0000ff00, Mem[0000000010081408] = ff000000
	sta	%f14,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000ff00
!	%f2  = 00d0ff62 fffff9ee, Mem[0000000030001410] = ff617eff ff000000
	stda	%f2 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 00d0ff62 fffff9ee
!	Mem[0000000010081400] = ffb60000, %l1 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ffb60000
!	%l7 = 00000000000071ff, Mem[0000000010101408] = ffffffff
	stba	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff
!	Code Fragment 3
p0_fragment_20:
!	%l0 = 0000000000000000
	setx	0x40575507cba1782c,%g7,%l0 ! %l0 = 40575507cba1782c
!	%l1 = 00000000ffb60000
	setx	0xd099751fb14ade6a,%g7,%l1 ! %l1 = d099751fb14ade6a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 40575507cba1782c
	setx	0x730c6c503df8f1a0,%g7,%l0 ! %l0 = 730c6c503df8f1a0
!	%l1 = d099751fb14ade6a
	setx	0xcdfb12a80051d147,%g7,%l1 ! %l1 = cdfb12a80051d147
!	%l4 = 00000000ffb60000, Mem[0000000030181410] = ff606077
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00606077
!	%f6  = ffff537a ffffffff, Mem[0000000030101408] = 91000000 ffb500ff
	stda	%f6 ,[%i4+%o4]0x81	! Mem[0000000030101408] = ffff537a ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff6377fa, %l6 = 000000002a4ea491
	ldswa	[%i0+%g0]0x80,%l6	! %l6 = ffffffffff6377fa

p0_label_265:
!	Mem[0000000010001420] = 00ff00ff ff76594e, %l4 = ffb60000, %l5 = 7fffffff
	ldda	[%i0+0x020]%asi,%l4	! %l4 = 0000000000ff00ff 00000000ff76594e
!	Mem[0000000010001424] = ff76594e, %l0 = 730c6c503df8f1a0
	ldsha	[%i0+0x024]%asi,%l0	! %l0 = ffffffffffffff76
!	Mem[0000000010001408] = 0000000000000000, %f14 = 0000ff00 00000000
	ldda	[%i0+%o4]0x80,%f14	! %f14 = 00000000 00000000
!	Mem[0000000020800040] = b6ffe56e, %l4 = 0000000000ff00ff
	lduha	[%o1+0x040]%asi,%l4	! %l4 = 000000000000b6ff
!	Mem[0000000030081408] = 1e7e61fffffff9ee, %f6  = ffff537a ffffffff
	ldda	[%i2+%o4]0x89,%f6 	! %f6  = 1e7e61ff fffff9ee
!	Mem[0000000010001408] = 00000000, %l6 = ffffffffff6377fa
	lduwa	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = a472ca7c, %l2 = 0000000000000000
	ldsba	[%i3+%o5]0x80,%l2	! %l2 = ffffffffffffffa4
!	Mem[0000000010041410] = 835bb353, %l2 = ffffffffffffffa4
	ldswa	[%i1+%o5]0x88,%l2	! %l2 = ffffffff835bb353
!	Mem[0000000030101400] = 000080ff, %l1 = cdfb12a80051d147
	ldsha	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = 00d0ff62 fffff9ee, Mem[0000000030001408] = 0000b6ff 00000000
	stda	%f2 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 00d0ff62 fffff9ee

p0_label_266:
!	%l1 = 0000000000000000, Mem[0000000030181408] = 00000000
	stwa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%f0  = ff000000 ffffff7f, Mem[0000000030041410] = 71dd8a4a 62000f62
	stda	%f0 ,[%i1+%o5]0x89	! Mem[0000000030041410] = ff000000 ffffff7f
!	%f2  = 00d0ff62 fffff9ee, Mem[0000000030181410] = 00606077 6432e3e7
	stda	%f2 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 00d0ff62 fffff9ee
!	%f0  = ff000000, Mem[00000000100c1408] = 00000000
	sta	%f0 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff000000
!	Mem[0000000010081438] = fffc007a, %l0 = ffffff76, %l0 = ffffff76
	add	%i2,0x38,%g1
	casa	[%g1]0x80,%l0,%l0	! %l0 = 00000000fffc007a
!	%l3 = 00000000ffb60000, Mem[0000000010041410] = 835bb353
	stba	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 835bb300
!	%l3 = 00000000ffb60000, Mem[0000000030181410] = 00d0ff62
	stwa	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = ffb60000
!	Code Fragment 4
p0_fragment_21:
!	%l0 = 00000000fffc007a
	setx	0x252f5b40172ad0e8,%g7,%l0 ! %l0 = 252f5b40172ad0e8
!	%l1 = 0000000000000000
	setx	0xc165691055b731ff,%g7,%l1 ! %l1 = c165691055b731ff
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 252f5b40172ad0e8
	setx	0x5af88c906d3d239e,%g7,%l0 ! %l0 = 5af88c906d3d239e
!	%l1 = c165691055b731ff
	setx	0x545954901fb8028e,%g7,%l1 ! %l1 = 545954901fb8028e
!	%f29 = 835bb353, %f2  = 00d0ff62, %f21 = 0aaf40f1
	fmuls	%f29,%f2 ,%f21		! %f21 = 80000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000000426718ffff, %f6  = 1e7e61ff fffff9ee
	ldda	[%i6+%g0]0x80,%f6 	! %f6  = 00000042 6718ffff

p0_label_267:
!	Mem[0000000030141400] = ff000000ffffff7f, %f18 = 7fffffff f140af0a
	ldda	[%i5+%g0]0x81,%f18	! %f18 = ff000000 ffffff7f
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000030081400] = ff03a0ff 00000000 eef9ffff ff617e1e
!	Mem[0000000030081410] = 00000000 00000000 ffffffff ed5fa07b
!	Mem[0000000030081420] = 7e181316 4e5976b4 0000006f 8c9fd8d8
!	Mem[0000000030081430] = 000000ff 00000000 ffffffff a35aa749
	ldda	[%i2]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	%f4  = 00000000, %f9  = 00000000
	fcmpes	%fcc3,%f4 ,%f9 		! %fcc3 = 0
!	Mem[0000000010041400] = 620f00ff, %f9  = 00000000
	lda	[%i1+%g0]0x88,%f9 	! %f9 = 620f00ff
!	Mem[000000001010141c] = ffffffff, %l4 = 000000000000b6ff
	ldsh	[%i4+0x01c],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010101438] = 00000000, %l1 = 545954901fb8028e
	ldsw	[%i4+0x038],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041400] = a67170ff, %f14 = 00000000
	lda	[%i1+%g0]0x81,%f14	! %f14 = a67170ff
!	Mem[0000000030141400] = ff000000, %l5 = 00000000ff76594e
	ldsha	[%i5+%g0]0x81,%l5	! %l5 = ffffffffffffff00
!	%l4 = ffffffffffffffff, %l0 = 5af88c906d3d239e, %l5 = ffffffffffffff00
	or	%l4,%l0,%l5		! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00000000, %l5 = ffffffffffffffff
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000ff

p0_label_268:
!	%l0 = 5af88c906d3d239e, Mem[00000000300c1400] = ff000000d1512bd8
	stxa	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 5af88c906d3d239e
!	%f4  = 00000000 00000000, Mem[00000000100c1400] = ff000000 00ff0000
	stda	%f4 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 00000000
!	%f15 = 00000000, Mem[0000000010141408] = 00000000
	sta	%f15,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030001400] = 00000000
	stha	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	Mem[0000000010101408] = ffffffff, %l2 = ffffffff835bb353
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 00000000ffffffff
!	%l0 = 6d3d239e, %l1 = 00000000, Mem[0000000030141408] = 00d0ff62 fffff9ee
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 6d3d239e 00000000
!	%f2  = 00d0ff62 fffff9ee, Mem[0000000010081400] = ff000000 48e60100
	stda	%f2 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 00d0ff62 fffff9ee
!	%l0 = 5af88c906d3d239e, Mem[0000000030181410] = eef9ffff0000b6ff
	stxa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 5af88c906d3d239e
!	Mem[00000000218001c1] = d9ff73ed, %l3 = 00000000ffb60000
	ldstub	[%o3+0x1c1],%l3		! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101404] = 2a4ea491, %l1 = 0000000000000000
	lduh	[%i4+0x006],%l1		! %l1 = 000000000000a491

p0_label_269:
!	Mem[0000000010081404] = 62ffd000, %f4  = 00000000
	lda	[%i2+0x004]%asi,%f4 	! %f4 = 62ffd000
!	Mem[0000000030041400] = a67170ff fa77ff62 00ff0000 00ff0000
!	Mem[0000000030041410] = 7fffffff 000000ff ffffffff ffffffff
!	Mem[0000000030041420] = 00000000 7a53ffff 7e181316 ffffffff
!	Mem[0000000030041430] = 0aaf40f1 ffffff7f 00000000 00ff0000
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000030081408] = eef9ffff, %l1 = 000000000000a491
	ldswa	[%i2+%o4]0x81,%l1	! %l1 = ffffffffeef9ffff
!	Mem[0000000030041410] = 7fffffff, %l3 = 00000000000000ff
	ldsba	[%i1+%o5]0x81,%l3	! %l3 = 000000000000007f
!	Mem[00000000100c1408] = 000000ff 000000ff, %l6 = 00000000, %l7 = 000071ff
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 00000000000000ff 00000000000000ff
!	Mem[0000000010181408] = 00000003, %f4  = 62ffd000
	lda	[%i6+%o4]0x88,%f4 	! %f4 = 00000003
!	Mem[0000000030101400] = ff606077ff800000, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x89,%l5	! %l5 = ff606077ff800000
!	Mem[00000000300c1410] = 000000ff, %l5 = ff606077ff800000
	lduwa	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = 000000ff, %f7  = 6718ffff
	lda	[%i3+0x008]%asi,%f7 	! %f7 = 000000ff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (41)
!	%f14 = a67170ff, Mem[0000000030081400] = ffa003ff
	sta	%f14,[%i2+%g0]0x89	! Mem[0000000030081400] = a67170ff

p0_label_270:
!	%l1 = ffffffffeef9ffff, Mem[0000000030041408] = 00ff0000
	stba	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = ffff0000
!	%l7 = 00000000000000ff, Mem[00000000100c1410] = 6718ffff7cca72a4
	stxa	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000000000ff
!	%l3 = 000000000000007f, Mem[0000000030141408] = 9e233d6d
	stha	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 9e23007f
!	Mem[0000000030101400] = 000080ff, %l4 = ffffffffffffffff
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 00000000000080ff
!	Mem[0000000010081407] = 62ffd000, %l0 = 5af88c906d3d239e
	ldstub	[%i2+0x007],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030001408] = 62ffd000, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%f16 = a67170ff fa77ff62 00ff0000 00ff0000
!	%f20 = 7fffffff 000000ff ffffffff ffffffff
!	%f24 = 00000000 7a53ffff 7e181316 ffffffff
!	%f28 = 0aaf40f1 ffffff7f 00000000 00ff0000
	stda	%f16,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	Mem[00000000201c0001] = 18ff1b53, %l5 = 00000000000000ff
	ldstub	[%o0+0x001],%l5		! %l5 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010101408] = 53b35b83
	stba	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = ffb35b83
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = eef9ffff, %l1 = ffffffffeef9ffff
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 00000000eef9ffff

p0_label_271:
!	Mem[0000000010181428] = 7cca72a48a27d318, %f2  = 00d0ff62 fffff9ee
	ldd	[%i6+0x028],%f2 	! %f2  = 7cca72a4 8a27d318
!	%l6 = 00000000000000ff, %l6 = 00000000000000ff, %l5 = 00000000000000ff
	sdivx	%l6,%l6,%l5		! %l5 = 0000000000000001
!	Mem[0000000030041400] = a67170fffa77ff62, %f6  = 00000042 000000ff
	ldda	[%i1+%g0]0x81,%f6 	! %f6  = a67170ff fa77ff62
!	Mem[0000000030101410] = 0aaf40f1, %l3 = 000000000000007f
	ldsha	[%i4+%o5]0x89,%l3	! %l3 = 00000000000040f1
!	Mem[0000000030081408] = fffff9ee, %l4 = 00000000000080ff
	ldsba	[%i2+%o4]0x89,%l4	! %l4 = ffffffffffffffee
!	Mem[0000000030101400] = ffffffff, %l6 = 00000000000000ff
	lduha	[%i4+%g0]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010101400] = 00000000, %l7 = 00000000000000ff
	lduha	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = ffd0ff62 fffff9ee, %l6 = 0000ffff, %l7 = 00000000
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffd0ff62 00000000fffff9ee
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000030141400] = a67170ff, %l4 = ffffffffffffffee
	ldsha	[%i5+%g0]0x81,%l4	! %l4 = ffffffffffffa671
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 00000000, %l2 = 00000000ffffffff
	swapa	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000

p0_label_272:
!	%l2 = 0000000000000000, Mem[0000000020800040] = b6ffe56e
	stb	%l2,[%o1+0x040]		! Mem[0000000020800040] = 00ffe56e
!	%l7 = 00000000fffff9ee, Mem[0000000010141400] = ffffffe7
	stwa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = fffff9ee
!	%f0  = ff000000 ffffff7f, %l6 = 00000000ffd0ff62
!	Mem[0000000010001408] = 0000000000000000
	add	%i0,0x008,%g1
	stda	%f0,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010001408] = 0000ffff00000000
!	Mem[00000000300c1410] = 000000ff, %l6 = 00000000ffd0ff62
	ldstuba	[%i3+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000030101410] = 0aaf40f1
	stba	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 0aaf4000
!	%f6  = a67170ff fa77ff62, Mem[00000000100c1400] = 00000000 00000000
	stda	%f6 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = a67170ff fa77ff62
!	%l7 = 00000000fffff9ee, Mem[000000001008142c] = ffffffff
	stw	%l7,[%i2+0x02c]		! Mem[000000001008142c] = fffff9ee
!	Mem[0000000010181400] = 42000000, %l2 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%f16 = a67170ff fa77ff62, Mem[0000000010181410] = 000000ff 00000000
	stda	%f16,[%i6+%o5]0x88	! Mem[0000000010181410] = a67170ff fa77ff62
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ffffffff, %l0 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l0	! %l0 = 000000000000ffff

p0_label_273:
!	Mem[0000000010181400] = ffff1867420000ff, %f12 = 000000ff 0000ffff
	ldda	[%i6+%g0]0x88,%f12	! %f12 = ffff1867 420000ff
!	Mem[0000000010101410] = 00000018, %l0 = 000000000000ffff
	ldsba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = 00000018, %l1 = 00000000eef9ffff
	ldsha	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800000] = ff00aff8, %l7 = 00000000fffff9ee
	ldsba	[%o1+0x001]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l4 = ffffffffffffa671
	ldsba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l2 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 0000b6ffffffffff, %l7 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l7	! %l7 = 0000b6ffffffffff
!	Mem[0000000010181408] = 03000000, %l1 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l1	! %l1 = 0000000003000000
!	Mem[00000000300c1400] = 908cf85a, %l5 = 0000000000000001
	ldsha	[%i3+%g0]0x89,%l5	! %l5 = fffffffffffff85a
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010081400] = fffff9ee
	stha	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = ffff0000

p0_label_274:
!	%f22 = ffffffff ffffffff, %l3 = 00000000000040f1
!	Mem[00000000300c1408] = 776060ff00000000
	add	%i3,0x008,%g1
	stda	%f22,[%g1+%l3]ASI_PST8_SL ! Mem[00000000300c1408] = ff6060ffffffffff
!	Mem[0000000030141408] = 00ff0000, %l7 = 0000b6ffffffffff
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081408] = fffff9ee, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 000000ee000000ff
!	%l5 = fffffffffffff85a, %l5 = fffffffffffff85a, %l2 = 0000000000000000
	and	%l5,%l5,%l2		! %l2 = fffffffffffff85a
!	Mem[0000000010181400] = 420000ff, %l1 = 0000000003000000
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[00000000300c1400] = 5af88c90
	stwa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Mem[00000000100c1408] = ff000000, %l3 = 00000000000040f1
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l2 = fffff85a, %l3 = 00000000, Mem[0000000010081400] = 0000ffff 62ffd0ff
	std	%l2,[%i2+%g0]		! Mem[0000000010081400] = fffff85a 00000000
!	Mem[0000000010001430] = 00000000, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x030]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff0037e1, %l7 = 00000000000000ee
	ldsb	[%o2+0x001],%l7		! %l7 = 0000000000000000

p0_label_275:
!	Mem[0000000010081400] = fffff85a, %l2 = fffffffffffff85a
	ldsha	[%i2+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001408] = 0000ffff, %f22 = ffffffff
	lda	[%i0+%o4]0x80,%f22	! %f22 = 0000ffff
!	Mem[0000000030081400] = ff7071a6, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181400] = ffff1867420000ff, %l5 = fffffffffffff85a
	ldxa	[%i6+%g0]0x88,%l5	! %l5 = ffff1867420000ff
!	%l4 = 00000000, %l5 = 420000ff, Mem[00000000100c1408] = ff0000ff 000000ff
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 420000ff
!	Mem[00000000300c1408] = ff6060ffffffffff, %l1 = 00000000000000ff
	ldxa	[%i3+%o4]0x81,%l1	! %l1 = ff6060ffffffffff
!	Mem[0000000010141408] = 00000000, %f24 = 00000000
	lda	[%i5+%o4]0x80,%f24	! %f24 = 00000000
!	Mem[0000000010101420] = 000000007a53ffff, %f30 = 00000000 00ff0000
	ldd	[%i4+0x020],%f30	! %f30 = 00000000 7a53ffff
!	Mem[0000000010001410] = ff18ffffffffffff, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l3	! %l3 = ff18ffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, imm = fffffffffffff6f6, %l6 = 00000000000000ff
	and	%l6,-0x90a,%l6		! %l6 = 00000000000000f6

p0_label_276:
!	%l0 = 00000000, %l1 = ffffffff, Mem[00000000100c1408] = 00000000 ff000042
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 ffffffff
!	Mem[0000000030141410] = ffffff7f, %l1 = ff6060ffffffffff
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 00000000ffffff7f
!	Mem[0000000010001408] = 0000ffff, %l7 = 00000000, %l4 = 00000000
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 000000000000ffff
!	%l3 = ff18ffffffffffff, Mem[0000000010041412] = 00b35b83
	sth	%l3,[%i1+0x012]		! Mem[0000000010041410] = 00b3ffff
!	%f22 = 0000ffff, Mem[0000000030181410] = 9e233d6d
	sta	%f22,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000ffff
!	%f16 = a67170ff fa77ff62 00ff0000 00ff0000
!	%f20 = 7fffffff 000000ff 0000ffff ffffffff
!	%f24 = 00000000 7a53ffff 7e181316 ffffffff
!	%f28 = 0aaf40f1 ffffff7f 00000000 7a53ffff
	stda	%f16,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	Mem[0000000030081410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l2 = ffffffffffffffff, Mem[0000000030141410] = ffffffff
	stwa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff
!	%f6  = a67170ff, Mem[00000000300c1400] = 00000000
	sta	%f6 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = a67170ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff6377fa, %l0 = 0000000000000000
	ldsb	[%i0+0x001],%l0		! %l0 = 0000000000000063

p0_label_277:
!	Mem[00000000300c1410] = ff000000, %l1 = 00000000ffffff7f
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[00000000100c1418] = 00ff00ffff76594e, %f6  = a67170ff fa77ff62
	ldda	[%i3+0x018]%asi,%f6 	! %f6  = 00ff00ff ff76594e
!	Mem[0000000010141400] = 03d00000 eef9ffff, %l4 = 0000ffff, %l5 = 420000ff
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 00000000eef9ffff 0000000003d00000
!	Mem[0000000030041400] = a67170ff, %l0 = 0000000000000063
	lduha	[%i1+%g0]0x81,%l0	! %l0 = 000000000000a671
!	Mem[0000000010141410] = 00000000000000ff, %f12 = ffff1867 420000ff
	ldda	[%i5+%o5]0x88,%f12	! %f12 = 00000000 000000ff
!	Mem[00000000300c1410] = 000000ff, %l4 = 00000000eef9ffff
	lduwa	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181408] = 00000003, %l7 = 0000000000000000
	lduba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000003
!	Mem[0000000030001408] = ffd0ff62, %f14 = a67170ff
	lda	[%i0+%o4]0x81,%f14	! %f14 = ffd0ff62
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000010101408] = 835bb3ff, %l2 = ffffffffffffffff
	lduwa	[%i4+%o4]0x88,%l2	! %l2 = 00000000835bb3ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1420] = 000000ffffffffff, %l7 = 0000000000000003, %l6 = 00000000000000f6
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = 000000ffffffffff

p0_label_278:
!	%l4 = 00000000000000ff, Mem[0000000030141400] = ff7071a6
	stwa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	%l0 = 0000a671, %l1 = ffffff00, Mem[0000000030081410] = ff000000 00000000
	stda	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000a671 ffffff00
!	%l1 = ffffffffffffff00, Mem[00000000300c1400] = a67170ff
	stwa	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffff00
!	Mem[0000000010141422] = ffffffff, %l1 = ffffffffffffff00
	ldstub	[%i5+0x022],%l1		! %l1 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[00000000100c1408] = ffffffff00000000
	stxa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000000000ff
!	%f12 = 00000000 000000ff, Mem[0000000010081400] = fffff85a 00000000
	stda	%f12,[%i2+0x000]%asi	! Mem[0000000010081400] = 00000000 000000ff
!	Mem[0000000030101408] = 00ff0000, %l3 = ff18ffffffffffff
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 0000000000ff0000
!	Mem[0000000030081410] = 71a60000, %l0 = 000000000000a671
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%l2 = 00000000835bb3ff, Mem[0000000010001408] = 0000ffff00000000
	stxa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000835bb3ff
!	Starting 10 instruction Load Burst
!	%f5  = 00000000, %f2  = 7cca72a4, %f24 = 00000000 7a53ffff
	fsmuld	%f5 ,%f2 ,%f24		! %f24 = 00000000 00000000

p0_label_279:
!	Mem[0000000021800040] = ff09f702, %l4 = 00000000000000ff
	ldub	[%o3+0x040],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l3 = 0000000000ff0000
	ldsha	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = 00000000 4ce33264 ffd0ff62 fffff9ee
!	Mem[0000000030001410] = eef9ffff 62ffd000 046279b8 a0f0cd14
!	Mem[0000000030001420] = 9a031f0a 626377fa 0aaf40f1 ffffff7f
!	Mem[0000000030001430] = 46a78731 a35aa749 e7e33264 85eb95f9
	ldda	[%i0]ASI_BLK_SL,%f16	! Block Load from 0000000030001400
!	Mem[0000000030181408] = ffffffffffb60000, %l2 = 00000000835bb3ff
	ldxa	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffb60000
!	Mem[0000000030101408] = ffffffff, %f4  = 00000003
	lda	[%i4+%o4]0x89,%f4 	! %f4 = ffffffff
!	Mem[0000000030041410] = ffffff7f, %l7 = 0000000000000003
	ldswa	[%i1+%o5]0x89,%l7	! %l7 = ffffffffffffff7f
!	Mem[0000000010101404] = 2a4ea491, %l0 = 0000000000000000
	lduh	[%i4+0x006],%l0		! %l0 = 000000000000a491
!	Mem[0000000010081438] = fffc007a, %l3 = 0000000000000000
	lduha	[%i2+0x038]%asi,%l3	! %l3 = 000000000000fffc
!	Mem[0000000030081408] = fff9ffff, %l2 = ffffffffffb60000
	lduba	[%i2+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ff7071a6, %l2 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l2	! %l2 = 00000000ff7071a6

p0_label_280:
!	%l5 = 0000000003d00000, Mem[0000000030081408] = fffff9ff
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 03d00000
!	%l4 = 00000000000000ff, imm = fffffffffffff6f3, %l6 = 000000ffffffffff
	xnor	%l4,-0x90d,%l6		! %l6 = 00000000000009f3
!	%f6  = 00ff00ff ff76594e, Mem[0000000010041400] = ff000f62 ffffff7f
	stda	%f6 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 00ff00ff ff76594e
!	%l1 = 00000000000000ff, Mem[000000001008140d] = 48e594f8
	stb	%l1,[%i2+0x00d]		! Mem[000000001008140c] = 48ff94f8
!	%l5 = 0000000003d00000, Mem[0000000030181400] = ff606000
	stha	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = ff600000
!	%l6 = 00000000000009f3, Mem[0000000021800081] = 6f896ccf
	stb	%l6,[%o3+0x081]		! Mem[0000000021800080] = 6ff36ccf
!	Mem[0000000010101400] = 00000000, %l2 = 00000000ff7071a6
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l0 = 000000000000a491, Mem[00000000100c143c] = 72cd2d6e
	stw	%l0,[%i3+0x03c]		! Mem[00000000100c143c] = 0000a491
!	Mem[0000000010101408] = ffb35b83, %l4 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000, %l5 = 0000000003d00000
	ldsb	[%i4+0x001],%l5		! %l5 = 0000000000000000

p0_label_281:
!	Mem[0000000010101400] = ff000000 2a4ea491, %l0 = 0000a491, %l1 = 000000ff
	ldda	[%i4+%g0]0x80,%l0	! %l0 = 00000000ff000000 000000002a4ea491
!	%l5 = 0000000000000000, imm = 00000000000000e3, %l6 = 00000000000009f3
	orn	%l5,0x0e3,%l6		! %l6 = ffffffffffffff1c
!	Mem[0000000010041408] = 776060ff, %f14 = ffd0ff62
	lda	[%i1+%o4]0x88,%f14	! %f14 = 776060ff
!	Mem[00000000201c0000] = 18ff1b53, %l0 = 00000000ff000000
	ldsh	[%o0+%g0],%l0		! %l0 = 00000000000018ff
!	Mem[0000000010001400] = fa7763ff, %l6 = ffffffffffffff1c
	lduwa	[%i0+%g0]0x88,%l6	! %l6 = 00000000fa7763ff
!	Mem[0000000010141410] = ff000000, %l7 = ffffffffffffff7f
	ldsha	[%i5+%o5]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[00000000100c1408] = 000000ff, %l4 = 00000000000000ff
	lduha	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181408] = 00000003, %l3 = 000000000000fffc
	ldsha	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000003
!	Mem[0000000030181408] = ffffffffffb60000, %f10 = d0000000 1613187e
	ldda	[%i6+%o4]0x81,%f10	! %f10 = ffffffff ffb60000
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 00000000, Mem[00000000300c1408] = ff6060ff ffffffff
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff 00000000

p0_label_282:
!	%f15 = 00000000, Mem[0000000030041400] = ff7071a6
	sta	%f15,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%f14 = 776060ff, Mem[00000000300c1400] = ffffff00
	sta	%f14,[%i3+%g0]0x89	! Mem[00000000300c1400] = 776060ff
!	%l7 = ffffffffffffff00, Mem[0000000010101400] = 91a44e2a000000ff
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffffffffff00
!	%l5 = 0000000000000000, Mem[00000000100c1410] = ff000000
	stha	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[0000000030141410] = ffffffff, %l3 = 0000000000000003
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000ffffffff
!	%f4  = ffffffff 00000000, Mem[0000000010181410] = fa77ff62 a67170ff
	stda	%f4 ,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffff 00000000
!	Mem[0000000010001434] = a35aa749, %l0 = 000018ff, %l4 = 000000ff
	add	%i0,0x34,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 00000000a35aa749
!	Mem[0000000010081408] = 0000ff00, %l0 = 00000000000018ff
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010081408] = ff00ff00
	stba	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %l4 = 00000000a35aa749
	ldsha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_283:
!	Mem[0000000010181410] = 00000000, %f5  = 00000000
	lda	[%i6+%o5]0x88,%f5 	! %f5 = 00000000
!	Mem[0000000030141410] = 03000000000000ff, %f22 = 14cdf0a0 b8796204
	ldda	[%i5+%o5]0x81,%f22	! %f22 = 03000000 000000ff
!	Mem[0000000030141400] = ff000000 fa77ff62, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 00000000ff000000 00000000fa77ff62
!	Mem[0000000030101408] = ffffffff, %l0 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030181400] = 000060ff0000ab74, %f24 = fa776362 0a1f039a
	ldda	[%i6+%g0]0x81,%f24	! %f24 = 000060ff 0000ab74
!	Mem[0000000010041410] = 260d69f2ffffb300, %f2  = 7cca72a4 8a27d318
	ldda	[%i1+%o5]0x88,%f2 	! %f2  = 260d69f2 ffffb300
!	%l2 = 0000000000000000, %l5 = 00000000fa77ff62, %l1 = 000000002a4ea491
	subc	%l2,%l5,%l1		! %l1 = ffffffff0588009e
!	Mem[0000000010101400] = 00ffffff, %l1 = ffffffff0588009e
	ldsba	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l5 = 00000000fa77ff62, %l1 = 0000000000000000, %l6 = 00000000fa7763ff
	add	%l5,%l1,%l6		! %l6 = 00000000fa77ff62
!	Starting 10 instruction Store Burst
!	%f15 = 00000000, Mem[00000000100c1410] = 00000000
	sta	%f15,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000

p0_label_284:
!	%f22 = 03000000 000000ff, Mem[0000000030181408] = ffffffff ffb60000
	stda	%f22,[%i6+%o4]0x81	! Mem[0000000030181408] = 03000000 000000ff
	membar	#Sync			! Added by membar checker (44)
!	%l6 = 00000000fa77ff62, Mem[0000000030001408] = 62ffd0ff
	stwa	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = fa77ff62
!	%l3 = 00000000ffffffff, Mem[0000000030101400] = 62ff77fa
	stwa	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffff
!	%l4 = 00000000ff000000, Mem[0000000030141410] = 00000003
	stwa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000000
!	Mem[0000000010101400] = 00ffffff, %l5 = 00000000fa77ff62
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041408] = ff606077, %l4 = 00000000ff000000
	ldstuba	[%i1+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030141410] = 000000ff, %l6 = 00000000fa77ff62
	swapa	[%i5+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = ffffff7f, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 00000000ffffff7f
!	%l6 = 00000000000000ff, Mem[0000000010101410] = 18000000
	stha	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 180000ff
!	Starting 10 instruction Load Burst
!	%f11 = ffb60000, %f11 = ffb60000
	fcmpes	%fcc2,%f11,%f11		! %fcc2 = 3

p0_label_285:
!	Mem[0000000010041428] = 293e0dfb, %l0 = 00000000ffffffff
	ldsha	[%i1+0x028]%asi,%l0	! %l0 = 000000000000293e
!	Mem[0000000010041428] = 293e0dfb 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i1+0x028]%asi,%l4	! %l4 = 00000000293e0dfb 0000000000000000
!	Mem[0000000010141410] = 000000ff, %l0 = 000000000000293e
	ldsha	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 776060ff, %l7 = ffffffffffffff00
	ldsba	[%i1+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141400] = 03d00000 eef9ffff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 00000000eef9ffff 0000000003d00000
!	Mem[0000000010081408] = 0000ff00, %l7 = ffffffffffffffff
	ldsba	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = ffffffff, %l6 = 00000000000000ff
	ldsha	[%i4+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181420] = 1e7e61ff, %l1 = 0000000003d00000
	lduwa	[%i6+0x020]%asi,%l1	! %l1 = 000000001e7e61ff
!	Mem[0000000030041410] = 00000000, %l4 = 00000000293e0dfb
	lduwa	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001428] = 00000000, %l7 = 0000000000000000
	swap	[%i0+0x028],%l7		! %l7 = 0000000000000000

p0_label_286:
!	%l0 = eef9ffff, %l1 = 1e7e61ff, Mem[0000000010141410] = ff000000 00000000
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = eef9ffff 1e7e61ff
!	Mem[0000000010181400] = ff000042, %l3 = 00000000ffffffff
	ldstuba	[%i6+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	%f24 = 000060ff 0000ab74, Mem[0000000030001400] = 00000000 4ce33264
	stda	%f24,[%i0+%g0]0x81	! Mem[0000000030001400] = 000060ff 0000ab74
!	%f4  = ffffffff 00000000, %l7 = 0000000000000000
!	Mem[0000000030141430] = 0aaf40f1ffffff7f
	add	%i5,0x030,%g1
	stda	%f4,[%g1+%l7]ASI_PST32_S ! Mem[0000000030141430] = 0aaf40f1ffffff7f
!	%l5 = 0000000000000000, Mem[0000000010041408] = 000080ff776060ff
	stxa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	%l2 = ffffff7f, %l3 = 000000ff, Mem[0000000010081410] = 00000018 ffff594e
	std	%l2,[%i2+%o5]		! Mem[0000000010081410] = ffffff7f 000000ff
!	%f14 = 776060ff 00000000, Mem[0000000010041408] = 00000000 00000000
	stda	%f14,[%i1+0x008]%asi	! Mem[0000000010041408] = 776060ff 00000000
!	Mem[0000000010041400] = ff00ff00, %l2 = 00000000ffffff7f
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030101410] = 7fffffff000000ff
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 420000ff, %l2 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff

p0_label_287:
!	Mem[0000000021800080] = 6ff36ccf, %l2 = 00000000000000ff
	ldsb	[%o3+0x080],%l2		! %l2 = 000000000000006f
!	%l3 = 00000000000000ff, %l1 = 000000001e7e61ff, %y  = 78aae78b
	sdiv	%l3,%l1,%l3		! %l3 = 000000007fffffff
	mov	%l0,%y			! %y = eef9ffff
!	Mem[0000000030001410] = 00d0ff62 fffff9ee, %l0 = eef9ffff, %l1 = 1e7e61ff
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 00000000fffff9ee 0000000000d0ff62
!	Code Fragment 4
p0_fragment_22:
!	%l0 = 00000000fffff9ee
	setx	0xdf6a2eb02e74e8fc,%g7,%l0 ! %l0 = df6a2eb02e74e8fc
!	%l1 = 0000000000d0ff62
	setx	0xf6316337da7d6fdb,%g7,%l1 ! %l1 = f6316337da7d6fdb
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = df6a2eb02e74e8fc
	setx	0xa803b2207c399a9f,%g7,%l0 ! %l0 = a803b2207c399a9f
!	%l1 = f6316337da7d6fdb
	setx	0x019105dfb44eb802,%g7,%l1 ! %l1 = 019105dfb44eb802
!	Mem[0000000010141400] = eef9ffff, %l1 = 019105dfb44eb802
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 00000000eef9ffff
!	Mem[0000000010141408] = 00000000, %f6  = 00ff00ff
	lda	[%i5+%o4]0x80,%f6 	! %f6 = 00000000
!	Mem[00000000100c1410] = 0000000000000000, %f16 = 6432e34c 00000000
	ldda	[%i3+%o5]0x88,%f16	! %f16 = 00000000 00000000
!	Mem[00000000100c1420] = 000000ffffffffff, %l6 = ffffffffffffffff
	ldxa	[%i3+0x020]%asi,%l6	! %l6 = 000000ffffffffff
!	Mem[0000000020800040] = 00ffe56e, %l1 = 00000000eef9ffff
	ldsb	[%o1+0x041],%l1		! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[0000000010181408] = 00000003
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff

p0_label_288:
!	Mem[0000000030001410] = fffff9ee, %l3 = 000000007fffffff
	swapa	[%i0+%o5]0x89,%l3	! %l3 = 00000000fffff9ee
!	%l0 = a803b2207c399a9f, Mem[0000000010141424] = fa006300, %asi = 80
	stba	%l0,[%i5+0x024]%asi	! Mem[0000000010141424] = 9f006300
!	%l3 = 00000000fffff9ee, Mem[0000000020800001] = ff00aff8, %asi = 80
	stba	%l3,[%o1+0x001]%asi	! Mem[0000000020800000] = ffeeaff8
!	%f19 = 62ffd0ff, Mem[0000000030081408] = 03d00000
	sta	%f19,[%i2+%o4]0x89	! Mem[0000000030081408] = 62ffd0ff
!	Mem[00000000201c0000] = 18ff1b53, %l6 = 000000ffffffffff
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 00000018000000ff
!	Mem[00000000100c1408] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%f30 = f995eb85 6432e3e7, %l3 = 00000000fffff9ee
!	Mem[00000000100c1438] = e52742bb0000a491
	add	%i3,0x038,%g1
	stda	%f30,[%g1+%l3]ASI_PST32_PL ! Mem[00000000100c1438] = e52742bb85eb95f9
!	Mem[0000000010041400] = ff00ffff, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l7	! %l7 = 00000000ff00ffff
!	%l3 = 00000000fffff9ee, Mem[00000000300c1408] = ff000000
	stha	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff00f9ee
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 0000ffff, %l7 = 00000000ff00ffff
	lduha	[%i5+%o4]0x89,%l7	! %l7 = 000000000000ffff

p0_label_289:
!	Mem[0000000030041410] = 00000000, %l0 = a803b2207c399a9f
	ldsha	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 00000000ffffffff, %f30 = f995eb85 6432e3e7
	ldd	[%i6+%o5],%f30		! %f30 = 00000000 ffffffff
!	Mem[0000000030141408] = ffff0000, %l7 = 000000000000ffff
	ldsha	[%i5+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101410] = 180000ff, %l2 = 000000000000006f
	lduha	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141400] = fffff9ee, %l2 = 00000000000000ff
	ldswa	[%i5+%g0]0x80,%l2	! %l2 = fffffffffffff9ee
!	Mem[0000000010081400] = 00000000 000000ff, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000030041408] = 0000ff000000ffff, %f26 = 7fffffff f140af0a
	ldda	[%i1+%o4]0x89,%f26	! %f26 = 0000ff00 0000ffff
!	Mem[0000000010081400] = 00000000000000ff, %f2  = 260d69f2 ffffb300
	ldda	[%i2+%g0]0x80,%f2 	! %f2  = 00000000 000000ff
!	Mem[0000000010041424] = ff606077, %f3  = 000000ff
	lda	[%i1+0x024]%asi,%f3 	! %f3 = ff606077
!	Starting 10 instruction Store Burst
!	Mem[00000000100c141d] = ff76594e, %l3 = 00000000fffff9ee
	ldstub	[%i3+0x01d],%l3		! %l3 = 00000076000000ff

p0_label_290:
!	%l0 = 00000000, %l1 = ffffffff, Mem[0000000010081430] = 7e180000 ffff0000
	std	%l0,[%i2+0x030]		! Mem[0000000010081430] = 00000000 ffffffff
!	%l2 = fffffffffffff9ee, Mem[0000000030081400] = ff000000
	stba	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = ff0000ee
!	%l2 = fffffffffffff9ee, Mem[0000000030141410] = fa77ff62
	stba	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = ee77ff62
!	%f0  = ff000000 ffffff7f 00000000 ff606077
!	%f4  = ffffffff 00000000 00000000 ff76594e
!	%f8  = ffff537a 620f00ff ffffffff ffb60000
!	%f12 = 00000000 000000ff 776060ff 00000000
	stda	%f0,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	Mem[0000000020800040] = 00ffe56e, %l5 = 00000000000000ff
	ldstub	[%o1+0x040],%l5		! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000030041400] = ffffff7f, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l0	! %l0 = 0000007f000000ff
!	%l2 = fffff9ee, %l3 = 00000076, Mem[0000000030041410] = 00000000 ffffffff
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = fffff9ee 00000076
!	%f26 = 0000ff00, Mem[0000000010181410] = 00000000
	sta	%f26,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000ff00
!	Mem[0000000010001420] = 00ff00ffff76594e, %l5 = 0000000000000000, %l3 = 0000000000000076
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 00ff00ffff76594e
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffeeaff8, %l2 = fffffffffffff9ee
	ldub	[%o1+%g0],%l2		! %l2 = 00000000000000ff

p0_label_291:
!	Mem[0000000030101400] = ffffffff, %l1 = ffffffffffffffff
	lduha	[%i4+%g0]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030001400] = 000060ff0000ab74, %f12 = 00000000 000000ff
	ldda	[%i0+%g0]0x81,%f12	! %f12 = 000060ff 0000ab74
!	Mem[0000000010181400] = ff0000426718ffff, %l5 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l5	! %l5 = ff0000426718ffff
!	Mem[00000000100c1410] = 00000000, %l0 = 000000000000007f
	ldswa	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = 000000ff000000ff, %f4  = ffffffff 00000000
	ldda	[%i6+%o4]0x88,%f4 	! %f4  = 000000ff 000000ff
!	Mem[0000000030081400] = 00000000ff0000ee, %l7 = ffffffffffffffff
	ldxa	[%i2+%g0]0x89,%l7	! %l7 = 00000000ff0000ee
!	Mem[0000000010041408] = 776060ff, %f8  = ffff537a
	lda	[%i1+%o4]0x80,%f8 	! %f8 = 776060ff
!	Mem[0000000010181414] = ffffffff, %l5 = ff0000426718ffff
	ldsha	[%i6+0x016]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181400] = ff000042, %f7  = ff76594e
	lda	[%i6+%g0]0x80,%f7 	! %f7 = ff000042
!	Starting 10 instruction Store Burst
!	%f24 = 000060ff 0000ab74, Mem[0000000010101410] = 180000ff 62000f62
	stda	%f24,[%i4+%o5]0x88	! Mem[0000000010101410] = 000060ff 0000ab74

p0_label_292:
!	Mem[0000000030141408] = ffff0000, %l7 = 00000000ff0000ee
	swapa	[%i5+%o4]0x81,%l7	! %l7 = 00000000ffff0000
!	%f31 = ffffffff, Mem[0000000010041408] = ff606077
	sta	%f31,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffff
!	Mem[0000000010141410] = eef9ffff, %l3 = 00ff00ffff76594e
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 00000000eef9ffff
!	%f31 = ffffffff, Mem[0000000030141400] = ff000000
	sta	%f31,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffff
!	%l4 = 0000000000000000, Mem[0000000030081400] = ff0000ee
	stha	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = ff000000
!	%l1 = 000000000000ffff, Mem[0000000030081410] = ff00a671
	stwa	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000ffff
!	Mem[0000000030101408] = ffffffff, %l3 = 00000000eef9ffff
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030081408] = 62ffd0ff, %l0 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010141400] = fffff9ee0000d003
	stxa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101428] = 7e181316, %l3 = 00000000000000ff
	ldub	[%i4+0x02b],%l3		! %l3 = 0000000000000016

p0_label_293:
!	Mem[0000000010101408] = ffb35b83, %f13 = 0000ab74
	ld	[%i4+%o4],%f13	! %f13 = ffb35b83
!	Mem[0000000010101400] = ffffffffffffffff, %l2 = 00000000000000ff
	ldxa	[%i4+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000020800000] = ffeeaff8, %l5 = ffffffffffffffff
	ldub	[%o1+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030001400] = ff600000, %l3 = 0000000000000016
	ldswa	[%i0+%g0]0x89,%l3	! %l3 = ffffffffff600000
!	Mem[0000000030081408] = ffd0ff62, %l1 = 000000000000ffff
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 00000000ffd0ff62
!	Mem[0000000010141408] = 000000ff00000000, %f10 = ffffffff ffb60000
	ldda	[%i5+%o4]0x88,%f10	! %f10 = 000000ff 00000000
!	Mem[0000000030181400] = 74ab0000ff600000, %l7 = 00000000ffff0000
	ldxa	[%i6+%g0]0x89,%l7	! %l7 = 74ab0000ff600000
!	Mem[0000000010101408] = 835bb3ff, %l7 = 74ab0000ff600000
	ldsba	[%i4+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181408] = 03000000000000ff, %f26 = 0000ff00 0000ffff
	ldda	[%i6+%o4]0x81,%f26	! %f26 = 03000000 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 000000ff, %l6 = 0000000000000018
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000000000ff

p0_label_294:
!	%l4 = 0000000000000000, Mem[0000000030101400] = ffffffff
	stha	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = ffff0000
!	%l5 = 00000000000000ff, Mem[0000000010141410] = 4e5976ff
	stha	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 4e5900ff
!	%l5 = 00000000000000ff, Mem[00000000300c1400] = 776060ff
	stba	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 776060ff
!	Mem[0000000010081410] = ffffff7f, %l7 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000300c1408] = eef900ff, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 000000ee000000ff
!	%l0 = 00000000000000ff, Mem[0000000010081410] = ffffff7f000000ff
	stxa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141408] = 00000000
	stha	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff0000
!	Mem[0000000030081410] = 0000ffff, %l7 = 00000000000000ff
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030081408] = 62ffd0ff, %l6 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffffffff 0000ff00, %l2 = ffffffff, %l3 = ff600000
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 00000000ffffffff 000000000000ff00

p0_label_295:
!	Mem[0000000030041410] = 00000076fffff9ee, %l3 = 000000000000ff00
	ldxa	[%i1+%o5]0x89,%l3	! %l3 = 00000076fffff9ee
!	Mem[0000000010081408] = 0000ff00, %l6 = 00000000000000ff
	lduba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[000000001000141c] = 00000000, %l1 = 00000000ffd0ff62
	lduh	[%i0+0x01e],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141408] = 0000ff00 ee0000ff, %l4 = 000000ee, %l5 = 000000ff
	ldda	[%i5+%o4]0x89,%l4	! %l4 = 00000000ee0000ff 000000000000ff00
!	Mem[000000001008141c] = 0932356f, %l7 = 000000000000ffff
	lduh	[%i2+0x01e],%l7		! %l7 = 000000000000356f
!	Mem[0000000030141410] = 62ff77ee, %l7 = 000000000000356f
	ldsba	[%i5+%o5]0x89,%l7	! %l7 = ffffffffffffffee
!	Mem[00000000100c1418] = 00ff00ffffff594e, %f6  = 00000000 ff000042
	ldd	[%i3+0x018],%f6 	! %f6  = 00ff00ff ffff594e
!	Mem[0000000010141408] = 0000ff00, %l4 = 00000000ee0000ff
	ldsha	[%i5+%o4]0x88,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010081410] = ff00000000000000, %f0  = ff000000 ffffff7f
	ldda	[%i2+%o5]0x88,%f0 	! %f0  = ff000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = a67170ff, %l1 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000a67170ff

p0_label_296:
!	%l7 = ffffffffffffffee, Mem[0000000010101410] = 74ab0000
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffee
!	%l2 = ffffffff, %l3 = fffff9ee, Mem[0000000010141408] = 00ff0000 ff000000
	std	%l2,[%i5+%o4]		! Mem[0000000010141408] = ffffffff fffff9ee
!	%f12 = 000060ff ffb35b83, Mem[0000000010041410] = ffffb300 260d69f2
	stda	%f12,[%i1+%o5]0x88	! Mem[0000000010041410] = 000060ff ffb35b83
!	%l1 = 00000000a67170ff, Mem[0000000030141408] = ee0000ff
	stba	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = ee0000ff
!	%f18 = eef9ffff 62ffd0ff, Mem[0000000010141400] = 00000000 ff000000
	stda	%f18,[%i5+%g0]0x88	! Mem[0000000010141400] = eef9ffff 62ffd0ff
!	Mem[00000000211c0000] = ff0037e1, %l0 = 00000000000000ff
	ldstub	[%o2+%g0],%l0		! %l0 = 000000ff000000ff
!	%f20 = 00d0ff62 fffff9ee, %l4 = ffffffffffffff00
!	Mem[0000000010001420] = 00ff00ffff76594e
	add	%i0,0x020,%g1
	stda	%f20,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010001420] = 00ff00ffff76594e
!	%f20 = 00d0ff62 fffff9ee, %l4 = ffffffffffffff00
!	Mem[0000000010141418] = 00ff00ff0aaf40f1
	add	%i5,0x018,%g1
	stda	%f20,[%g1+%l4]ASI_PST16_P ! Mem[0000000010141418] = 00ff00ff0aaf40f1
!	%f0  = ff000000 00000000, Mem[0000000010001408] = 00000000 ffb35b83
	stda	%f0 ,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffffffff, %l7 = ffffffffffffffee
	lduha	[%i1+%o4]0x88,%l7	! %l7 = 000000000000ffff

p0_label_297:
!	Mem[0000000030101408] = ffffffff, %l1 = 00000000a67170ff
	ldsba	[%i4+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000211c0000] = ff0037e1, %l6 = 0000000000000000
	lduba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081408] = 0000ff0048ff94f8, %l5 = 000000000000ff00
	ldxa	[%i2+%o4]0x80,%l5	! %l5 = 0000ff0048ff94f8
!	Mem[0000000010081408] = 0000ff0048ff94f8, %f6  = 00ff00ff ffff594e
	ldda	[%i2+%o4]0x80,%f6 	! %f6  = 0000ff00 48ff94f8
!	Mem[00000000100c1408] = ff000000, %l5 = 0000ff0048ff94f8
	lduw	[%i3+%o4],%l5		! %l5 = 00000000ff000000
!	Mem[0000000010181400] = 420000ff, %f11 = 00000000
	lda	[%i6+%g0]0x88,%f11	! %f11 = 420000ff
!	Mem[0000000030041400] = ffffffff, %l4 = ffffffffffffff00
	lduwa	[%i1+%g0]0x81,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030081410] = ff000000, %l5 = 00000000ff000000
	ldsha	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800140] = 00ffdf62, %l0 = 00000000000000ff
	ldsh	[%o3+0x140],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffffffff, Mem[0000000030001400] = 000060ff
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffff

p0_label_298:
!	Mem[0000000010001400] = ff6377fa, %l2 = 00000000ffffffff
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010001400] = fa7763ff
	stha	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = fa770000
!	%l3 = 00000076fffff9ee, Mem[0000000030101400] = 0000ffffff7071a6
	stxa	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000076fffff9ee
!	Mem[0000000010181400] = ff000042, %l2 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 00000000ff000042
!	Mem[0000000030001410] = ffffff7f, %l6 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 00000000ffffff7f
!	%f8  = 776060ff 620f00ff, Mem[0000000010041400] = 00000000 ff76594e
	stda	%f8 ,[%i1+0x000]%asi	! Mem[0000000010041400] = 776060ff 620f00ff
!	Mem[00000000300c1410] = ff000000, %l0 = 00000000000000ff
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[000000001018140c] = ff000000, %l4 = 00000000ffffffff, %asi = 80
	swapa	[%i6+0x00c]%asi,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1410] = 00000000, %l7 = 000000000000ffff
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 0000ffff, %l5 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000

p0_label_299:
!	Mem[0000000010041408] = ffffffff, %l6 = 00000000ffffff7f
	lduwa	[%i1+%o4]0x80,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010041400] = 776060ff, %f27 = 000000ff
	lda	[%i1+%g0]0x80,%f27	! %f27 = 776060ff
!	%l6 = 00000000ffffffff, imm = fffffffffffff807, %l4 = 00000000ff000000
	or	%l6,-0x7f9,%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030101410] = 00000000, %l6 = 00000000ffffffff
	lduwa	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = ff0000ee00ff0000, %f30 = 00000000 ffffffff
	ldda	[%i5+%o4]0x81,%f30	! %f30 = ff0000ee 00ff0000
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = 0000001800000000, %f10 = 000000ff 420000ff
	ldda	[%i2+%g0]0x81,%f10	! %f10 = 00000018 00000000
!	Mem[00000000201c0000] = ffff1b53, %l5 = 0000000000000000
	ldub	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010041408] = ffffffff00000000, %l6 = 0000000000000000
	ldx	[%i1+%o4],%l6		! %l6 = ffffffff00000000
!	Starting 10 instruction Store Burst
!	%f17 = 00000000, %f6  = 0000ff00, %f14 = 776060ff 00000000
	fsmuld	%f17,%f6 ,%f14		! %f14 = 00000000 00000000

p0_label_300:
!	Mem[00000000100c143b] = e52742bb, %l2 = 00000000ff000042
	ldstuba	[%i3+0x03b]%asi,%l2	! %l2 = 000000bb000000ff
!	%l4 = ffffffffffffffff, Mem[00000000211c0000] = ff0037e1, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff37e1
!	%f1  = 00000000, Mem[0000000010081410] = 00000000
	sta	%f1 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%f22 = 03000000 000000ff, %l6 = ffffffff00000000
!	Mem[0000000030101410] = 0000000000000000
	add	%i4,0x010,%g1
	stda	%f22,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030101410] = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010101428] = 7e181316 000071a6
	std	%l6,[%i4+0x028]		! Mem[0000000010101428] = 00000000 00000000
!	%l3 = 00000076fffff9ee, Mem[00000000300c1400] = 776060ff
	stwa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = fffff9ee
!	Mem[00000000300c1408] = fff900ff, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l7	! %l7 = 00000000fff900ff
!	%l0 = ff000000, %l1 = ffffffff, Mem[0000000010141408] = ffffffff fffff9ee
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = ff000000 ffffffff
!	%l6 = 00000000, %l7 = fff900ff, Mem[0000000010081410] = 00000000 000000ff
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 fff900ff
!	Starting 10 instruction Load Burst
!	Mem[000000001010142c] = 00000000, %l3 = 00000076fffff9ee
	ldsh	[%i4+0x02c],%l3		! %l3 = 0000000000000000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	and	%l3,0x2b4,%l6
	fadds	%f2,%f25,%f1
	fsubs	%f26,%f21,%f14
	subc	%l2,0x634,%l4
	orn	%l4,0x264,%l0
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000ff000000
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000000000bb
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be ffffffff00000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000fff900ff
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xeef9ffff,%g2
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
	cmp	%l0,%l1			! %f0  should be ff000000 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 ff606077
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 000000ff 000000ff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 0000ff00 48ff94f8
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 776060ff 620f00ff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000018 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 000060ff ffb35b83
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 00000000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be eef9ffff 62ffd0ff
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00d0ff62 fffff9ee
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 03000000 000000ff
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 000060ff 0000ab74
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 03000000 776060ff
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 49a75aa3 3187a746
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be ff0000ee 00ff0000
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
	mulx	%l6,-0x4cf,%l7
	sdivx	%l7,0xb3b,%l6
	orn	%l0,-0x331,%l7
	udivx	%l0,%l0,%l6
	fadds	%f15,%f9 ,%f9 
	xor	%l5,0xac2,%l0
	done

p0_trap1o:
	mulx	%l6,-0x4cf,%l7
	sdivx	%l7,0xb3b,%l6
	orn	%l0,-0x331,%l7
	udivx	%l0,%l0,%l6
	fadds	%f15,%f9 ,%f9 
	xor	%l5,0xac2,%l0
	done


p0_trap2e:
	fstoi	%f3 ,%f2 
	fsqrts	%f12,%f15
	mulx	%l7,0x942,%l1
	nop
	fcmps	%fcc3,%f11,%f11
	fadds	%f1 ,%f12,%f4 
	andn	%l7,%l6,%l2
	done

p0_trap2o:
	fstoi	%f3 ,%f2 
	fsqrts	%f12,%f15
	mulx	%l7,0x942,%l1
	nop
	fcmps	%fcc3,%f11,%f11
	fadds	%f1 ,%f12,%f4 
	andn	%l7,%l6,%l2
	done


p0_trap3e:
	andn	%l2,%l5,%l3
	and	%l2,%l0,%l7
	and	%l5,0xa6f,%l1
	addc	%l0,0x487,%l0
	subc	%l4,-0x34e,%l4
	addc	%l2,%l5,%l3
	done

p0_trap3o:
	andn	%l2,%l5,%l3
	and	%l2,%l0,%l7
	and	%l5,0xa6f,%l1
	addc	%l0,0x487,%l0
	subc	%l4,-0x34e,%l4
	addc	%l2,%l5,%l3
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
	ldx	[%g1+0x000],%l0		! %l0 = 2c3c68ba8f64fc7b
	ldx	[%g1+0x008],%l1		! %l1 = 6a81f0fc63aa7b31
	ldx	[%g1+0x010],%l2		! %l2 = 74c225ac0d750daf
	ldx	[%g1+0x018],%l3		! %l3 = ea599ffbc149c3cb
	ldx	[%g1+0x020],%l4		! %l4 = f756d882a8a1dfcf
	ldx	[%g1+0x028],%l5		! %l5 = c3c0b99e1211677a
	ldx	[%g1+0x030],%l6		! %l6 = 3649d7309243d268
	ldx	[%g1+0x038],%l7		! %l7 = f0d0a402105c0ea4

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
	mulx	%l6,-0x4cf,%l7
	sdivx	%l7,0xb3b,%l6
	orn	%l0,-0x331,%l7
	udivx	%l0,%l0,%l6
	fadds	%f15,%f9 ,%f9 
	jmpl	%o7,%g0
	sub	%l7,-0x4c0,%l2
p0_near_0_he:
	and	%l5,0xa6f,%l1
	fcmps	%fcc0,%f22,%f24
	jmpl	%o7,%g0
	mulx	%l0,%l4,%l4
near0_b2b_h:
	and	%l6,0xb9d,%l3
	mulx	%l4,%l2,%l3
	udivx	%l2,%l3,%l0
	mulx	%l3,%l1,%l5
	jmpl	%o7,%g0
	or	%l7,%l7,%l5
near0_b2b_l:
	fdivs	%f2 ,%f10,%f11
	fcmps	%fcc1,%f9 ,%f15
	xnor	%l1,0x80b,%l2
	addc	%l6,%l0,%l1
	jmpl	%o7,%g0
	fdivs	%f8 ,%f9 ,%f10
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	umul	%l6,%l0,%l2
	sub	%l3,%l2,%l1
	and	%l3,0xaa4,%l5
	jmpl	%o7,%g0
	smul	%l4,%l3,%l3
p0_near_1_he:
	sub	%l2,%l2,%l0
	sdivx	%l5,-0xa53,%l0
	add	%l5,0x837,%l3
	jmpl	%o7,%g0
	ld	[%i3+0x008],%f24	! Mem[00000000100c1408]
near1_b2b_h:
	subc	%l1,-0x805,%l1
	or	%l3,%l3,%l0
	fsubs	%f30,%f28,%f27
	addc	%l0,-0xfed,%l4
	jmpl	%o7,%g0
	sub	%l6,%l6,%l1
near1_b2b_l:
	orn	%l4,-0xa01,%l5
	fsqrts	%f14,%f5 
	addc	%l6,0x50c,%l1
	add	%l2,-0x164,%l7
	jmpl	%o7,%g0
	fcmps	%fcc0,%f13,%f8 
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	fdivs	%f13,%f4 ,%f0 
	jmpl	%o7,%g0
	fcmps	%fcc0,%f0 ,%f1 
p0_near_2_he:
	smul	%l0,%l6,%l3
	fdivs	%f23,%f23,%f18
	fadds	%f22,%f19,%f27
	xnor	%l6,-0xf78,%l4
	or	%l2,-0x715,%l7
	or	%l7,-0xfe5,%l7
	jmpl	%o7,%g0
	andn	%l0,%l3,%l4
near2_b2b_h:
	fsqrts	%f26,%f27
	udivx	%l4,%l2,%l7
	jmpl	%o7,%g0
	fdivs	%f19,%f29,%f16
near2_b2b_l:
	mulx	%l5,0x4d4,%l5
	sdivx	%l7,0x2c8,%l1
	jmpl	%o7,%g0
	add	%l5,-0x1b8,%l4
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	or	%l5,0x307,%l2
	xnor	%l5,0xc61,%l2
	fadds	%f4 ,%f10,%f12
	jmpl	%o7,%g0
	ldx	[%i3+0x020],%l1		! Mem[00000000100c1420]
p0_near_3_he:
	mulx	%l3,%l4,%l2
	fcmps	%fcc3,%f30,%f30
	jmpl	%o7,%g0
	ldd	[%i5+0x010],%f20	! Mem[0000000010141410]
near3_b2b_h:
	fmuls	%f29,%f29,%f22
	fsubs	%f30,%f20,%f18
	or	%l5,-0x92c,%l0
	orn	%l2,0xc8a,%l3
	mulx	%l7,%l3,%l1
	jmpl	%o7,%g0
	orn	%l0,%l0,%l0
near3_b2b_l:
	xor	%l7,%l1,%l2
	add	%l1,-0xf69,%l5
	smul	%l5,%l0,%l7
	umul	%l0,-0x5de,%l5
	fsubs	%f4 ,%f12,%f10
	jmpl	%o7,%g0
	or	%l6,%l4,%l7
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	stb	%l4,[%i2+0x012]		! Mem[0000000010081412]
	orn	%l0,%l4,%l6
	umul	%l7,%l2,%l1
	udivx	%l3,0xb56,%l1
	jmpl	%o7,%g0
	fmuls	%f15,%f14,%f6 
p0_far_0_lem:
	membar	#Sync
	stb	%l4,[%i2+0x012]		! Mem[0000000010081412]
	orn	%l0,%l4,%l6
	umul	%l7,%l2,%l1
	udivx	%l3,0xb56,%l1
	jmpl	%o7,%g0
	fmuls	%f15,%f14,%f6 
p0_far_0_he:
	st	%f18,[%i3+0x014]	! Mem[00000000100c1414]
	udivx	%l2,0xca6,%l0
	jmpl	%o7,%g0
	umul	%l4,-0x80a,%l6
p0_far_0_hem:
	membar	#Sync
	st	%f18,[%i3+0x014]	! Mem[00000000100c1414]
	udivx	%l2,0xca6,%l0
	jmpl	%o7,%g0
	umul	%l4,-0x80a,%l6
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	jmpl	%o7,%g0
	fdivs	%f20,%f19,%f23
	jmpl	%o7,%g0
	nop
far0_b2b_l:
	jmpl	%o7,%g0
	udivx	%l5,-0x767,%l5
	jmpl	%o7,%g0
	nop
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fcmps	%fcc2,%f8 ,%f2 
	fsqrts	%f13,%f0 
	jmpl	%o7,%g0
	udivx	%l0,%l0,%l1
p0_far_1_lem:
	fcmps	%fcc2,%f8 ,%f2 
	fsqrts	%f13,%f0 
	jmpl	%o7,%g0
	udivx	%l0,%l0,%l1
p0_far_1_he:
	smul	%l5,0xcdb,%l2
	fadds	%f27,%f17,%f26
	orn	%l3,%l4,%l5
	jmpl	%o7,%g0
	nop
p0_far_1_hem:
	smul	%l5,0xcdb,%l2
	fadds	%f27,%f17,%f26
	orn	%l3,%l4,%l5
	jmpl	%o7,%g0
	nop
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	subc	%l0,%l2,%l0
	fsubs	%f19,%f24,%f20
	udivx	%l0,%l2,%l6
	fmuls	%f21,%f22,%f18
	fsqrts	%f27,%f19
	jmpl	%o7,%g0
	fmuls	%f23,%f30,%f30
far1_b2b_l:
	and	%l1,%l3,%l0
	addc	%l1,-0x440,%l5
	add	%l5,0x744,%l3
	mulx	%l1,0x23e,%l7
	sub	%l7,%l1,%l6
	jmpl	%o7,%g0
	fsubs	%f4 ,%f6 ,%f1 
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	mulx	%l0,-0x1ac,%l7
	orn	%l3,%l4,%l0
	jmpl	%o7,%g0
	and	%l6,%l3,%l5
p0_far_2_lem:
	mulx	%l0,-0x1ac,%l7
	orn	%l3,%l4,%l0
	jmpl	%o7,%g0
	and	%l6,%l3,%l5
p0_far_2_he:
	or	%l2,0x1e5,%l2
	jmpl	%o7,%g0
	umul	%l5,0xe0b,%l6
p0_far_2_hem:
	or	%l2,0x1e5,%l2
	jmpl	%o7,%g0
	umul	%l5,0xe0b,%l6
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fmuls	%f30,%f22,%f24
	subc	%l1,0x49f,%l7
	subc	%l5,%l1,%l3
	jmpl	%o7,%g0
	sub	%l2,-0x483,%l0
far2_b2b_l:
	udivx	%l6,0x259,%l6
	fsubs	%f3 ,%f9 ,%f14
	xnor	%l4,-0xa96,%l1
	jmpl	%o7,%g0
	mulx	%l2,%l2,%l4
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	subc	%l7,-0xc4c,%l0
	fcmps	%fcc2,%f15,%f14
	jmpl	%o7,%g0
	sdivx	%l0,-0xa24,%l2
p0_far_3_lem:
	subc	%l7,-0xc4c,%l0
	fcmps	%fcc2,%f15,%f14
	jmpl	%o7,%g0
	sdivx	%l0,-0xa24,%l2
p0_far_3_he:
	andn	%l6,-0x6ca,%l3
	sub	%l6,0x2ce,%l1
	fdivs	%f25,%f20,%f20
	fsubs	%f25,%f27,%f23
	orn	%l5,0xc71,%l0
	jmpl	%o7,%g0
	sub	%l6,-0x4ec,%l0
p0_far_3_hem:
	andn	%l6,-0x6ca,%l3
	sub	%l6,0x2ce,%l1
	fdivs	%f25,%f20,%f20
	fsubs	%f25,%f27,%f23
	orn	%l5,0xc71,%l0
	jmpl	%o7,%g0
	sub	%l6,-0x4ec,%l0
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fdivs	%f24,%f26,%f25
	fcmps	%fcc3,%f31,%f25
	fsqrts	%f29,%f28
	and	%l3,0xbf4,%l1
	smul	%l5,%l2,%l1
	sdivx	%l4,%l0,%l7
	addc	%l3,-0xb6d,%l7
	jmpl	%o7,%g0
	andn	%l7,%l5,%l3
far3_b2b_l:
	andn	%l7,%l7,%l7
	fadds	%f9 ,%f1 ,%f4 
	orn	%l3,-0xf60,%l5
	addc	%l6,-0x0c2,%l1
	xor	%l2,%l3,%l7
	umul	%l0,%l3,%l7
	add	%l4,-0xd96,%l7
	jmpl	%o7,%g0
	andn	%l3,0xe6a,%l4
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	subc	%l3,%l6,%l7
	or	%l1,%l7,%l0
	add	%l2,-0xa5a,%l0
	xor	%l2,%l7,%l4
	smul	%l3,0x31b,%l6
	jmpl	%g6+8,%g0
	fdivs	%f13,%f8 ,%f2 
p0_call_0_le:
	fmuls	%f8 ,%f8 ,%f6 
	xor	%l3,0x557,%l2
	addc	%l7,-0xfac,%l5
	fdivs	%f3 ,%f3 ,%f0 
	fsubs	%f5 ,%f14,%f4 
	retl
	or	%l1,%l6,%l4
p0_jmpl_0_lo:
	subc	%l3,%l6,%l7
	or	%l1,%l7,%l0
	add	%l2,-0xa5a,%l0
	xor	%l2,%l7,%l4
	smul	%l3,0x31b,%l6
	jmpl	%g6+8,%g0
	fdivs	%f13,%f8 ,%f2 
p0_call_0_lo:
	fmuls	%f8 ,%f8 ,%f6 
	xor	%l3,0x557,%l2
	addc	%l7,-0xfac,%l5
	fdivs	%f3 ,%f3 ,%f0 
	fsubs	%f5 ,%f14,%f4 
	retl
	or	%l1,%l6,%l4
p0_jmpl_0_he:
	fmuls	%f27,%f20,%f30
	jmpl	%g6+8,%g0
	fcmps	%fcc1,%f30,%f27
p0_call_0_he:
	subc	%l7,0xada,%l0
	sdivx	%l4,0x86f,%l1
	fdivs	%f27,%f22,%f26
	fdivs	%f31,%f16,%f26
	ldstub	[%o2+0x001],%l0		! Mem[00000000211c0001]
	retl
	andn	%l5,-0x35c,%l0
p0_jmpl_0_ho:
	fmuls	%f27,%f20,%f30
	jmpl	%g6+8,%g0
	fcmps	%fcc1,%f30,%f27
p0_call_0_ho:
	subc	%l7,0xada,%l0
	sdivx	%l4,0x86f,%l1
	fdivs	%f27,%f22,%f26
	fdivs	%f31,%f16,%f26
	ldstub	[%i2+0x001],%l0		! Mem[00000000211c0001]
	retl
	andn	%l5,-0x35c,%l0
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	xnor	%l6,0xb5f,%l5
	add	%l7,%l4,%l5
	addc	%l7,0xf11,%l7
	andn	%l6,%l0,%l4
	mulx	%l2,0x1f0,%l4
	jmpl	%g6+8,%g0
	and	%l0,%l2,%l1
p0_call_1_le:
	fdivs	%f15,%f11,%f10
	retl
	or	%l7,-0x9ae,%l4
p0_jmpl_1_lo:
	xnor	%l6,0xb5f,%l5
	add	%l7,%l4,%l5
	addc	%l7,0xf11,%l7
	andn	%l6,%l0,%l4
	mulx	%l2,0x1f0,%l4
	jmpl	%g6+8,%g0
	and	%l0,%l2,%l1
p0_call_1_lo:
	fdivs	%f15,%f11,%f10
	retl
	or	%l7,-0x9ae,%l4
p0_jmpl_1_he:
	or	%l0,0x3c3,%l7
	fcmps	%fcc1,%f28,%f19
	udivx	%l3,-0x1d6,%l0
	mulx	%l0,%l0,%l1
	fsqrts	%f16,%f26
	jmpl	%g6+8,%g0
	and	%l7,0x14f,%l2
p0_call_1_he:
	sub	%l7,%l4,%l4
	sdivx	%l4,%l3,%l3
	ld	[%i2+0x004],%f16	! Mem[0000000010081404]
	retl
	fdivs	%f30,%f28,%f26
p0_jmpl_1_ho:
	or	%l0,0x3c3,%l7
	fcmps	%fcc1,%f28,%f19
	udivx	%l3,-0x1d6,%l0
	mulx	%l0,%l0,%l1
	fsqrts	%f16,%f26
	jmpl	%g6+8,%g0
	and	%l7,0x14f,%l2
p0_call_1_ho:
	sub	%l7,%l4,%l4
	sdivx	%l4,%l3,%l3
	ld	[%o2+0x004],%f16	! Mem[0000000010081404]
	retl
	fdivs	%f30,%f28,%f26
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	umul	%l1,%l0,%l5
	jmpl	%g6+8,%g0
	fdivs	%f10,%f9 ,%f15
p0_call_2_le:
	subc	%l6,%l1,%l3
	sub	%l2,-0xb4d,%l5
	and	%l0,0xda6,%l2
	smul	%l0,-0x228,%l1
	retl
	sub	%l4,%l1,%l4
p0_jmpl_2_lo:
	umul	%l1,%l0,%l5
	jmpl	%g6+8,%g0
	fdivs	%f10,%f9 ,%f15
p0_call_2_lo:
	subc	%l6,%l1,%l3
	sub	%l2,-0xb4d,%l5
	and	%l0,0xda6,%l2
	smul	%l0,-0x228,%l1
	retl
	sub	%l4,%l1,%l4
p0_jmpl_2_he:
	fdivs	%f18,%f31,%f16
	fcmps	%fcc0,%f23,%f20
	or	%l2,%l1,%l2
	fitos	%f25,%f26
	orn	%l3,%l6,%l5
	smul	%l6,0xdf9,%l2
	jmpl	%g6+8,%g0
	mulx	%l0,0xb98,%l7
p0_call_2_he:
	umul	%l6,%l7,%l4
	ldx	[%i1+0x028],%l4		! Mem[0000000010041428]
	andn	%l5,0x024,%l4
	xor	%l5,%l6,%l1
	retl
	or	%l0,%l3,%l0
p0_jmpl_2_ho:
	fdivs	%f18,%f31,%f16
	fcmps	%fcc0,%f23,%f20
	or	%l2,%l1,%l2
	fitos	%f25,%f26
	orn	%l3,%l6,%l5
	smul	%l6,0xdf9,%l2
	jmpl	%g6+8,%g0
	mulx	%l0,0xb98,%l7
p0_call_2_ho:
	umul	%l6,%l7,%l4
	ldx	[%o1+0x028],%l4		! Mem[0000000010041428]
	andn	%l5,0x024,%l4
	xor	%l5,%l6,%l1
	retl
	or	%l0,%l3,%l0
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	umul	%l2,%l6,%l5
	sub	%l2,%l0,%l3
	jmpl	%g6+8,%g0
	umul	%l4,-0x707,%l3
p0_call_3_le:
	fsubs	%f12,%f7 ,%f15
	fdtoi	%f14,%f2 
	udivx	%l1,0x8ed,%l3
	fmuls	%f14,%f2 ,%f9 
	addc	%l1,%l2,%l0
	fdivs	%f10,%f4 ,%f6 
	and	%l1,-0x48d,%l3
	retl
	xnor	%l6,%l2,%l1
p0_jmpl_3_lo:
	umul	%l2,%l6,%l5
	sub	%l2,%l0,%l3
	jmpl	%g6+8,%g0
	umul	%l4,-0x707,%l3
p0_call_3_lo:
	fsubs	%f12,%f7 ,%f15
	fdtoi	%f14,%f2 
	udivx	%l1,0x8ed,%l3
	fmuls	%f14,%f2 ,%f9 
	addc	%l1,%l2,%l0
	fdivs	%f10,%f4 ,%f6 
	and	%l1,-0x48d,%l3
	retl
	xnor	%l6,%l2,%l1
p0_jmpl_3_he:
	udivx	%l7,-0x67c,%l1
	smul	%l5,%l7,%l2
	mulx	%l7,-0x0c8,%l5
	fadds	%f28,%f24,%f21
	fmuls	%f17,%f20,%f24
	jmpl	%g6+8,%g0
	subc	%l1,%l2,%l6
p0_call_3_he:
	umul	%l2,-0x65f,%l5
	xnor	%l6,-0x9ab,%l4
	retl
	xnor	%l2,%l6,%l1
p0_jmpl_3_ho:
	udivx	%l7,-0x67c,%l1
	smul	%l5,%l7,%l2
	mulx	%l7,-0x0c8,%l5
	fadds	%f28,%f24,%f21
	fmuls	%f17,%f20,%f24
	jmpl	%g6+8,%g0
	subc	%l1,%l2,%l6
p0_call_3_ho:
	umul	%l2,-0x65f,%l5
	xnor	%l6,-0x9ab,%l4
	retl
	xnor	%l2,%l6,%l1
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
	.word	0x2c3c68ba,0x8f64fc7b		! Init value for %l0
	.word	0x6a81f0fc,0x63aa7b31		! Init value for %l1
	.word	0x74c225ac,0x0d750daf		! Init value for %l2
	.word	0xea599ffb,0xc149c3cb		! Init value for %l3
	.word	0xf756d882,0xa8a1dfcf		! Init value for %l4
	.word	0xc3c0b99e,0x1211677a		! Init value for %l5
	.word	0x3649d730,0x9243d268		! Init value for %l6
	.word	0xf0d0a402,0x105c0ea4		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xbae8ddbe,0x1e1c212c		! Init value for %f0 
	.word	0xac39f5c2,0x388d3f5c		! Init value for %f2 
	.word	0x3cf8d76e,0x085ac4d0		! Init value for %f4 
	.word	0xeebd8db3,0x95df57db		! Init value for %f6 
	.word	0x78a9ce36,0xf7a81e4a		! Init value for %f8 
	.word	0x4d9c7ba1,0xfd949712		! Init value for %f10
	.word	0x01834367,0x6faa8653		! Init value for %f12
	.word	0x75824276,0x69ae75b6		! Init value for %f14
	.word	0xbaed3071,0xc49472b3		! Init value for %f16
	.word	0xc53d9142,0xddad30d2		! Init value for %f18
	.word	0x0df09827,0x2d4ae274		! Init value for %f20
	.word	0x3d724527,0xc1286522		! Init value for %f22
	.word	0xf0de7be6,0xad4fd416		! Init value for %f24
	.word	0x31827479,0xfcef8d0a		! Init value for %f26
	.word	0x17cbdde4,0x09c878e8		! Init value for %f28
	.word	0x759380a6,0x2c8f72af		! Init value for %f30
	.word	0x43a83241,0xc1367bab		! Init value for %f32
	.word	0x1548ab92,0x67c90033		! Init value for %f34
	.word	0xb4c7c93f,0xb1cbe074		! Init value for %f36
	.word	0x48a3b397,0xb9488ce3		! Init value for %f38
	.word	0x8acd3823,0xe6f6cf45		! Init value for %f40
	.word	0x13d4c062,0x3f34423c		! Init value for %f42
	.word	0xf820c28c,0x893f27a1		! Init value for %f44
	.word	0x82ffcd63,0xca61af0a		! Init value for %f46
	.word	0x9134b412,0x412e11c8
	.word	0xfa725a92,0x9c54953e
	.word	0xded29e84,0x8c7d96f8
	.word	0xab16d108,0xbd447c39
	.word	0xe9339ff5,0xd331d5c7
	.word	0x42876e6d,0xfe346c5e
	.word	0x8be6e228,0x63d22aec
	.word	0xfb745eaf,0x45bf7550
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
	.word	0x00000000,0xff000000
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x000000bb
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x000000ff
	.word	0xffffffff,0x00000000
	.word	0x00000000,0xfff900ff
p0_expected_fp_regs:
	.word	0xff000000,0x00000000
	.word	0x00000000,0xff606077
	.word	0x000000ff,0x000000ff
	.word	0x0000ff00,0x48ff94f8
	.word	0x776060ff,0x620f00ff
	.word	0x00000018,0x00000000
	.word	0x000060ff,0xffb35b83
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xeef9ffff,0x62ffd0ff
	.word	0x00d0ff62,0xfffff9ee
	.word	0x03000000,0x000000ff
	.word	0x000060ff,0x0000ab74
	.word	0x03000000,0x776060ff
	.word	0x49a75aa3,0x3187a746
	.word	0xff0000ee,0x00ff0000
	.word	0x0000000e,0x00000c00		! %fsr = 0000000e00000c00
p0_local0_expect:
	.word	0x000077fa,0x0000ffff
	.word	0x00000000,0x000000ff
	.word	0xff18ffff,0xffffffff
	.word	0x776060ff,0x00000000
	.word	0x00ff00ff,0xff76594e
	.word	0x00000000,0x0000b6ff
	.word	0x000000ff,0xa35aa749
	.word	0xe7e33264,0x85ebe3f9
p0_local0_sec_expect:
	.word	0xffffffff,0x0000ab74
	.word	0x62ff77fa,0xfffff9ee
	.word	0x000000ff,0x62ffd000
	.word	0x046279b8,0xa0f0cd14
	.word	0x9a031f0a,0x626377fa
	.word	0x0aaf40f1,0xffffff7f
	.word	0x46a78731,0xa35aa749
	.word	0xe7e33264,0x85eb95f9
p0_local1_expect:
	.word	0x776060ff,0x620f00ff
	.word	0xffffffff,0x00000000
	.word	0x835bb3ff,0xff600000
	.word	0x00ff00ff,0xa0ff594e
	.word	0xffffffff,0xff606077
	.word	0x293e0dfb,0x00000000
	.word	0x00000000,0xffff1867
	.word	0xe527ffbb,0xb8796204
p0_local1_sec_expect:
	.word	0xffffffff,0x000000ff
	.word	0x776060ff,0x00000000
	.word	0xeef9ffff,0x76000000
	.word	0x4e5976ff,0x00000000
	.word	0xff000f62,0x7a53ffff
	.word	0x0000b6ff,0xffffffff
	.word	0xff000000,0x00000000
	.word	0x00000000,0xff606077
p0_local2_expect:
	.word	0x00000000,0x000000ff
	.word	0x0000ff00,0x48ff94f8
	.word	0x00000000,0xfff900ff
	.word	0x00487e00,0x0932356f
	.word	0x7fffffff,0x00000000
	.word	0xd3332db5,0xfffff9ee
	.word	0x00000000,0xffffffff
	.word	0xfffc007a,0x00000000
p0_local2_sec_expect:
	.word	0x00000018,0x00000000
	.word	0xffd0ff62,0xff617e1e
	.word	0x000000ff,0xffffff00
	.word	0xffffffff,0xed5fa07b
	.word	0x7e181316,0x4e5976b4
	.word	0x0000006f,0x8c9fd8d8
	.word	0x000000ff,0x00000000
	.word	0xffffffff,0xa35aa749
p0_local3_expect:
	.word	0x00000000,0xfa77ff62
	.word	0xff000000,0x00000000
	.word	0x0000ffff,0x00000000
	.word	0x00ff00ff,0xffff594e
	.word	0x000000ff,0xffffffff
	.word	0xd003a0ff,0xff617eff
	.word	0x00000000,0x0000b6ff
	.word	0xe52742ff,0x85eb95f9
p0_local3_sec_expect:
	.word	0xeef9ffff,0x6d3d239e
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x1e3fe782
	.word	0xff617e1e,0xff4bff0c
	.word	0x0aaf40f1,0xffffff7f
	.word	0x7594537a,0x8c9fd8ce
	.word	0xf140af0a,0x2bc15bce
	.word	0xfa189f8c,0x62000077
p0_local4_expect:
	.word	0xffffffff,0xffffffff
	.word	0xffb35b83,0xffffffff
	.word	0xffffffee,0xff600000
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x7a53ffff
	.word	0x00000000,0x00000000
	.word	0xff76594e,0x0000001e
	.word	0x00000000,0x00ff0000
p0_local4_sec_expect:
	.word	0x00000076,0xfffff9ee
	.word	0xffffffff,0x0000ff00
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffff0000
	.word	0xffff537a,0x00000000
	.word	0xffffffff,0x1613187e
	.word	0x7fffffff,0xf140af0a
	.word	0xffff537a,0x00000000
p0_local5_expect:
	.word	0xffd0ff62,0xfffff9ee
	.word	0xff000000,0xffffffff
	.word	0xff00594e,0x1e7e61ff
	.word	0x00ff00ff,0x0aaf40f1
	.word	0xffffffff,0x9f006300
	.word	0x0018ffff,0x00000000
	.word	0x1e7e61ff,0xffff1867
	.word	0xe52742bb,0xb8796204
p0_local5_sec_expect:
	.word	0xffffffff,0xfa77ff62
	.word	0xff0000ee,0x00ff0000
	.word	0xee77ff62,0x000000ff
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x7a53ffff
	.word	0x7e181316,0xffffffff
	.word	0x0aaf40f1,0xffffff7f
	.word	0x00000000,0x00ff0000
p0_local6_expect:
	.word	0x000000ff,0x6718ffff
	.word	0xff000000,0xffffffff
	.word	0x00ff0000,0xffffffff
	.word	0x869902ff,0x00000000
	.word	0x1e7e61ff,0xffff03d0
	.word	0x7cca72a4,0x8a27d318
	.word	0x00000000,0x000018ff
	.word	0x62000f62,0xffff1800
p0_local6_sec_expect:
	.word	0x000060ff,0x0000ab74
	.word	0x03000000,0x000000ff
	.word	0x0000ffff,0x908cf85a
	.word	0x53b35b83,0xf2690d26
	.word	0x00000000,0x7a00fcff
	.word	0x1e000000,0x000000ff
	.word	0x53b35b83,0x00000000
	.word	0x03d00000,0x00000000
share0_expect:
	.word	0xffff1b53,0x172ceeb5
	.word	0x970de8ae,0xaee92d68
	.word	0x29bbcda9,0x321d144f
	.word	0x445c7659,0x969cae92
	.word	0xdf296a51,0x7c240acf
	.word	0x062087a6,0xf60099f0
	.word	0x01a3d546,0xba08caff
	.word	0xec3d513f,0xc53b9935
share1_expect:
	.word	0xffeeaff8,0xb8bd7232
	.word	0x18eb5647,0xe1853d3d
	.word	0xca28b6b3,0x67c177d9
	.word	0xcfbc5a94,0x747814de
	.word	0x1299ca3b,0x2e2ca86f
	.word	0x426e7540,0x507dd2c5
	.word	0xa3ca22a9,0xc40d6bcf
	.word	0x786f4956,0xbba2893b
	.word	0xffffe56e,0x4ffdbf15
	.word	0xe1c549c8,0x7beac765
	.word	0x8e02e87e,0x30b653e7
	.word	0x7ae4d72a,0x4ea1c1f7
	.word	0xdd6dacd3,0xe14da547
	.word	0x38eb8ee6,0x5f780dda
	.word	0xc6624250,0x3ef114b7
	.word	0x8c07e28d,0x43044f95
share2_expect:
	.word	0xffff37e1,0x9f8b4710
	.word	0xd26a2b3c,0x7fab52a5
	.word	0x0c9821b4,0xdadc02ec
	.word	0xd83455d2,0x7bc7c003
	.word	0xc7232b4a,0x0063c118
	.word	0x8fce5a96,0x665e411f
	.word	0xc23ff0bb,0x196aae8e
	.word	0xc47fb549,0xfb07dd83
share3_expect:
	.word	0xff338e4e,0x476c42d4
	.word	0x35a19ae9,0xbd463945
	.word	0xfeb0ab45,0x81dee4db
	.word	0xd7d36475,0xe35a0abc
	.word	0x339c9ea9,0x7a7fdc4f
	.word	0x218a8967,0x628653e6
	.word	0x66b62b24,0xf298cb2b
	.word	0x4b435178,0x4328d5b8
	.word	0xff09f702,0x356d8570
	.word	0xb3fa84a5,0x73fdfca8
	.word	0x885c5c47,0xe74519c2
	.word	0x3bd7dbe2,0x98e699db
	.word	0x6279cd94,0xfca086ca
	.word	0x3b46f018,0xe523e07e
	.word	0x29bf5fa5,0x7e24fb0a
	.word	0xd5516c39,0x3934b4c3
	.word	0x6ff36ccf,0x3f9e6447
	.word	0x12e0f649,0x68954dc0
	.word	0xaa3a23d3,0x8d791d8c
	.word	0xcebcee41,0xfe340b00
	.word	0xe5ed3b91,0x617da011
	.word	0x92cef83b,0xd717c286
	.word	0x192cd799,0x7403281e
	.word	0xfa60ba13,0x3d85a6ee
	.word	0x00008436,0x0e6e67d8
	.word	0xa80465a4,0x28618c50
	.word	0x2a76a9ba,0x627091cc
	.word	0x947302a4,0x6d753391
	.word	0xca882737,0xb7f74abf
	.word	0x95dcb152,0x52b78353
	.word	0x670ac975,0xfa9c9c5e
	.word	0x8281e1f4,0x60c7a1ec
	.word	0xff181701,0x0cd5f2e9
	.word	0x04000fdc,0x452aafbd
	.word	0xbe9ba816,0x3e694232
	.word	0x8fed7656,0x7b2c5acf
	.word	0x20c08d26,0x58b4f89f
	.word	0x03d6f0b3,0xf7548c04
	.word	0x094c7645,0xee1be472
	.word	0xbf52666e,0x098bfea3
	.word	0x00ffdf62,0x6fef7194
	.word	0x77d5f646,0x9b6c0ef4
	.word	0x990de01b,0xaadd48b6
	.word	0x3745db2b,0x51dc3ffe
	.word	0x9a2c65d4,0x3e68728a
	.word	0x736c2af0,0xab919eb0
	.word	0x4bdf3eb0,0x244d1dee
	.word	0x57fa3b80,0x46c966cd
	.word	0xffffca9e,0x6bb5ace0
	.word	0xde252133,0x032b2a60
	.word	0xfc7774bc,0xbb0eaf3f
	.word	0x8e40af5b,0xbab67bb8
	.word	0x6136c3fa,0xf1de1b17
	.word	0x8bab45b0,0xc67d5940
	.word	0x8bdc1a6a,0x23a1abde
	.word	0x9d089720,0xb15e300d
	.word	0xd9ff73ed,0x9fb2f402
	.word	0x92b73bc2,0xa5cad76e
	.word	0x894530b8,0x60de2a65
	.word	0xa4aec40a,0x14259523
	.word	0x3ef681a0,0x736fab8f
	.word	0x28ca7b22,0x11be68d1
	.word	0xf706343f,0xf8cdc016
	.word	0xf70333db,0x04d1013e
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
	.word	0x389bdcbf,0xf806a300
	.word	0x00000000,0x00000002
	.word	0xcdaaf777,0x922b3d9b
	.word	0x00000000,0x00000003
	.word	0xcf1dcce0,0x19c9a5d9
	.word	0x00000000,0x00000004
	.word	0x37504ab0,0x45b9ffdc
	.word	0x00000000,0x00000005
	.word	0x21f8b79f,0x9d4e6d65
	.word	0x00000000,0x00000006
	.word	0x91cca9a0,0x685e4045
	.word	0x00000000,0x00000007
	.word	0x3bf46d4f,0xb50605b5
	.word	0x00000000,0x00000008
	.word	0xa88e65e7,0x9ada88c8
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
	.word	0xff1608c7,0xb2a88f6f,0xfc9af1a0,0xb275da05
	.word	0x51be144e,0x25625fb5,0xf0b2eb57,0xe57e6728
	.word	0xa3224195,0x56bd72e2,0x57bb84ce,0xb30a75d3
	.word	0x53b35b83,0xf2690d26,0x0c818230,0x98ccc562
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
	.word	0xfc96f4db,0x82c2da69,0x09220cee,0x67186f7c
	.word	0xc64c3929,0xba4cf66e,0x046279b8,0xa0f0cd14
	.word	0x9a031f0a,0x626377fa,0x018cf05f,0x551890a6
	.word	0x46a78731,0xa35aa749,0xe7e33264,0x85eb95f9
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
	.word	0xc3e8b55d,0x4a5adada,0x13b3afd1,0xe5ddf087
	.word	0xb0af13a7,0x01a907db,0xd387454c,0x674b9e0c
	.word	0x9e7dbfc7,0x70e87990,0xc812ebd5,0x76ecb488
	.word	0xc4b02542,0x2936aee7,0x94f6f2fd,0x16440446
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
	.word	0x50e04903,0x82039345,0x435e92b7,0x2bc15bce
	.word	0xa6c22be2,0x6a2312de,0x767d3dba,0xd3c9b966
	.word	0x0aaf40f1,0x0b8830e7,0x5ce1c8ac,0xff2daf8c
	.word	0xf1b5ec40,0x8c647f34,0x09ac1b34,0x7b1e9ff7
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
	.word	0xb21aea3b,0x8496004b,0xeeb63bc9,0x2812c170
	.word	0xbd439ce4,0x72468dba,0xd1193ab9,0x3391135f
	.word	0xa0b7e376,0x764c52f1,0xd3332db5,0x53f81b30
	.word	0x00c65d71,0xbb31ef93,0xd2ab68ff,0x40ee1e7d
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
	.word	0x7dd394a7,0x9a91b30c,0x5f896323,0x006478bb
	.word	0x308f02cb,0x8c26f645,0x14785cb6,0x0932356f
	.word	0xde9b58ca,0x30e7b50f,0xbba05b5d,0x6b54eed4
	.word	0xd4584a05,0xa287c415,0x6e2dcd72,0x1a9b537f
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
	.word	0xa671701b,0xfb0d3e29,0xcb827008,0xd5e74385
	.word	0x7594537a,0x8c9fd8d8,0xb476594e,0x1613187e
	.word	0x8c5704a7,0x320cf197,0x7ba05fed,0x20d7d574
	.word	0xa798c753,0x97a45277,0xe52742bb,0xc6617e1e
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
	.word	0x452046e1,0x24080155,0x4bd07fcc,0xdbb02ede
	.word	0x485fb885,0xff606077,0x2e49a05e,0xd795162c
	.word	0x8027dda3,0xf8fe5e6a,0xced2d5d0,0x4d1df443
	.word	0xf91629a7,0xaee130a9,0x7f453f10,0xf500ddda
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
	.word	0x232976cf,0x5d844adb,0x2ad8b0ca,0x1cee0b21
	.word	0x67a0ca50,0xb2519884,0xf7c8f7ce,0x034d07b3
	.word	0xcf9aeed4,0x5dececa2,0x7238dcfc,0xd4d23108
	.word	0x5541c53f,0x6530e007,0x221197b8,0x0deeec80
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
	.word	0x911a0ab0,0x4c739142,0x4c80d7b5,0x1da4916b
	.word	0xd7c639dd,0x291999b3,0x158e94df,0xfab48e7d
	.word	0x3ea7a425,0x9845e098,0x70f6b8c4,0x8c431565
	.word	0x697e72d1,0x906d4a52,0xeee53bad,0x41d0aa11
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
	.word	0xc7ddf38e,0x0671ddb9,0x3dc9a958,0x4da57ec9
	.word	0x61bc4813,0x19928940,0x6f8f22e4,0xcafdd486
	.word	0x3ccf9e5c,0x189c058a,0x423f2bbf,0x7e5b4503
	.word	0x1f21457c,0x9fd8fddb,0xd666fe08,0xc1115a08
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
	.word	0xde962820,0xa4e3909a,0xf03efce5,0x42cd748d
	.word	0x6de2f6a1,0x0bec4aca,0xbcaad0cb,0xeffb37ae
	.word	0x93be11d0,0xb5311b48,0x7dd05e28,0xf4ba0a80
	.word	0x5f75fa81,0x09d34e0f,0xfa8e7b68,0x7031ffe0
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
	.word	0x0384a2b8,0xe5f4aea1,0x82e73f1e,0x43a63ff5
	.word	0xb9d8d73c,0xf56ee344,0x86990270,0xe5c28370
	.word	0xf0a4f62b,0xe3a003d0,0x7cca72a4,0x8a27d318
	.word	0xd104c68c,0x918610af,0xda8c5dfe,0x8d6e885c
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
	.word	0x5dc72dca,0x1e5c3973,0xaf84108c,0x222a2b28
	.word	0x11e32b48,0x60bd6230,0x224ab3ff,0x0e5335f9
	.word	0x2a174f19,0x3f41883d,0x19150539,0x4f6224c3
	.word	0x52b9b81d,0xe367bb19,0x36b7c422,0x0f42adb2
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
	.word	0xe35b1b53,0x172ceeb5,0x970de8ae,0xaee92d68
	.word	0x29bbcda9,0x321d144f,0x445c7659,0x969cae92
	.word	0xdf296a51,0x7c240acf,0x062087a6,0xf60099f0
	.word	0x01a3d546,0xba08caff,0xec3d513f,0xc53b9935
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
	.word	0x72f9aff8,0xb8bd7232,0x18eb5647,0xe1853d3d
	.word	0xca28b6b3,0x67c177d9,0xcfbc5a94,0x747814de
	.word	0x1299ca3b,0x2e2ca86f,0x426e7540,0x507dd2c5
	.word	0xa3ca22a9,0xc40d6bcf,0x786f4956,0xbba2893b
	.word	0x4717e56e,0x4ffdbf15,0xe1c549c8,0x7beac765
	.word	0x8e02e87e,0x30b653e7,0x7ae4d72a,0x4ea1c1f7
	.word	0xdd6dacd3,0xe14da547,0x38eb8ee6,0x5f780dda
	.word	0xc6624250,0x3ef114b7,0x8c07e28d,0x43044f95
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
	.word	0xf04937e1,0x9f8b4710,0xd26a2b3c,0x7fab52a5
	.word	0x0c9821b4,0xdadc02ec,0xd83455d2,0x7bc7c003
	.word	0xc7232b4a,0x0063c118,0x8fce5a96,0x665e411f
	.word	0xc23ff0bb,0x196aae8e,0xc47fb549,0xfb07dd83
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
	.word	0x24338e4e,0x476c42d4,0x35a19ae9,0xbd463945
	.word	0xfeb0ab45,0x81dee4db,0xd7d36475,0xe35a0abc
	.word	0x339c9ea9,0x7a7fdc4f,0x218a8967,0x628653e6
	.word	0x66b62b24,0xf298cb2b,0x4b435178,0x4328d5b8
	.word	0xcf09f702,0x356d8570,0xb3fa84a5,0x73fdfca8
	.word	0x885c5c47,0xe74519c2,0x3bd7dbe2,0x98e699db
	.word	0x6279cd94,0xfca086ca,0x3b46f018,0xe523e07e
	.word	0x29bf5fa5,0x7e24fb0a,0xd5516c39,0x3934b4c3
	.word	0x6f896ccf,0x3f9e6447,0x12e0f649,0x68954dc0
	.word	0xaa3a23d3,0x8d791d8c,0xcebcee41,0xfe340b00
	.word	0xe5ed3b91,0x617da011,0x92cef83b,0xd717c286
	.word	0x192cd799,0x7403281e,0xfa60ba13,0x3d85a6ee
	.word	0x354f8436,0x0e6e67d8,0xa80465a4,0x28618c50
	.word	0x2a76a9ba,0x627091cc,0x947302a4,0x6d753391
	.word	0xca882737,0xb7f74abf,0x95dcb152,0x52b78353
	.word	0x670ac975,0xfa9c9c5e,0x8281e1f4,0x60c7a1ec
	.word	0xbd2b1701,0x0cd5f2e9,0x04000fdc,0x452aafbd
	.word	0xbe9ba816,0x3e694232,0x8fed7656,0x7b2c5acf
	.word	0x20c08d26,0x58b4f89f,0x03d6f0b3,0xf7548c04
	.word	0x094c7645,0xee1be472,0xbf52666e,0x098bfea3
	.word	0xb97adf62,0x6fef7194,0x77d5f646,0x9b6c0ef4
	.word	0x990de01b,0xaadd48b6,0x3745db2b,0x51dc3ffe
	.word	0x9a2c65d4,0x3e68728a,0x736c2af0,0xab919eb0
	.word	0x4bdf3eb0,0x244d1dee,0x57fa3b80,0x46c966cd
	.word	0x8223ca9e,0x6bb5ace0,0xde252133,0x032b2a60
	.word	0xfc7774bc,0xbb0eaf3f,0x8e40af5b,0xbab67bb8
	.word	0x6136c3fa,0xf1de1b17,0x8bab45b0,0xc67d5940
	.word	0x8bdc1a6a,0x23a1abde,0x9d089720,0xb15e300d
	.word	0xd97173ed,0x9fb2f402,0x92b73bc2,0xa5cad76e
	.word	0x894530b8,0x60de2a65,0xa4aec40a,0x14259523
	.word	0x3ef681a0,0x736fab8f,0x28ca7b22,0x11be68d1
	.word	0xf706343f,0xf8cdc016,0xf70333db,0x04d1013e
share3_end:
