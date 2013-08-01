/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_4.s
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
!	Seed = 626172951
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_1500l_13.s created on Jun 26, 2009 (17:29:51)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_1500l_13 -p 1 -l 1500

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

!	Initialize the input and output registers

!	Random code for Thread 0

thread_0:
	ta	T_CHANGE_PRIV		! Trap to Supervisor Mode
	set	p0_fsr,%g3
	ldx	[%g3],%fsr		! Set %fsr to 0000000000
	wrpr	%g0,7,%cleanwin
	call	p0_init_memory_pointers
	wr	%g0,0x80,%asi		! Setting default %asi to 80

!	Initialize the floating point registers for processor 0

	wr	%g0,0x4,%fprs		! Make sure fef is 1
	set	p0_init_freg,%g1
!	%f0  = 639aab40 2a2d7651 01c3767e 4559f5d7
!	%f4  = 0a2b8c2c 56ef500d 0568a3ca 47f3ae73
!	%f8  = 734050d8 4a442689 7bafe2d6 6f1119cf
!	%f12 = 223b4544 1e2595c5 5bfadfa2 2191b3eb
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 4ea07570 300ff9c1 226b062e 1d3db8c7
!	%f20 = 22c1ad5c 497e6e7d 58ed827a 44222463
!	%f24 = 4a2a7908 0126cff9 7e074086 38acb2bf
!	%f28 = 5bcc2474 30f5ba35 3560ec52 0487dfdb
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 6be9bba0 1cca8931 6e12f1de 4636e7b7
!	%f36 = 51c40a8c 25f358ed 6ab17d2a 2171c653
!	%f40 = 6d059d38 27690569 57187a36 6e4137af
!	%f44 = 76eebfa4 56cb2aa5 57f79502 62dab7cb
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x4d5dc26800000038,%g7,%g1 ! %gsr scale =  7, align = 0
	wr	%g1,%g0,%gsr		! %gsr = 4d5dc26800000038

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	%f16 = 4ea07570, Mem[00000000100c1408] = 09473f5e
	sta	%f16,[%i3+%o4]0x80	! Mem[00000000100c1408] = 4ea07570
!	%l0 = ad30c18520d51e6e, Mem[00000000100c1400] = 0e595d20
	stha	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 1e6e5d20
!	%l7 = 86e174162830206b, Mem[00000000100c1400] = 1e6e5d203c08b4b1
	stxa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 86e174162830206b
!	%l2 = 0bf759d758390dd4, Mem[0000000010041408] = 62b2389e1f7ddb77
	stxa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 0bf759d758390dd4
!	%f8  = 734050d8 4a442689, Mem[00000000100c1408] = 4ea07570 0e4b8f37
	std	%f8 ,[%i3+%o4]		! Mem[00000000100c1408] = 734050d8 4a442689
!	%l0 = 20d51e6e, %l1 = c5fe2019, Mem[00000000100c1438] = 6eeaca82 4741a74b
	std	%l0,[%i3+0x038]		! Mem[00000000100c1438] = 20d51e6e c5fe2019
!	Mem[0000000010081400] = d1e12a4bc08c125a, %l3 = 20be8747225f6a9f
	ldxa	[%i2+%g0]0x88,%l3	! %l3 = d1e12a4bc08c125a
!	%f16 = 4ea07570 300ff9c1, Mem[0000000030081400] = f0366853 41c5b162
	stda	%f16,[%i2+%g0]0x89	! Mem[0000000030081400] = 4ea07570 300ff9c1
!	%l5 = 661a4f47dc464d65, Mem[0000000030101400] = 01cb232eb0b77f53
	stxa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 661a4f47dc464d65
!	Mem[0000000030141408] = 7e6f9dce, %l3 = d1e12a4bc08c125a
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 000000000000007e

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 0bf759d7, %l7 = 86e174162830206b, %asi = 80
	ldswa	[%i1+0x008]%asi,%l7	! %l7 = 000000000bf759d7
!	Mem[0000000010141410] = 6c7eb0cc, %l7 = 000000000bf759d7
	lduwa	[%i5+%o5]0x80,%l7	! %l7 = 000000006c7eb0cc
!	Mem[00000000300c1408] = 6a59670e, %f23 = 44222463
	lda	[%i3+%o4]0x81,%f23	! %f23 = 6a59670e
!	Mem[0000000030081408] = 60b073ae, %l4 = 0c7ecd14988f497a
	ldswa	[%i2+%o4]0x81,%l4	! %l4 = 0000000060b073ae
!	%l7 = 000000006c7eb0cc, %l6 = 54b0af2b618ca960, %y  = 00000000
	smul	%l7,%l6,%l1		! %l1 = 29579e0e4dc8f880, %y = 29579e0e
!	Mem[0000000030041408] = 67265b084ef0284b, %f2  = 01c3767e 4559f5d7
	ldda	[%i1+%o4]0x89,%f2 	! %f2  = 67265b08 4ef0284b
!	Mem[0000000030001410] = 4b628a1c63cae03d, %f14 = 5bfadfa2 2191b3eb
	ldda	[%i0+%o5]0x81,%f14	! %f14 = 4b628a1c 63cae03d
!	Mem[0000000030041410] = 7c60f806, %l2 = 0bf759d758390dd4
	ldsba	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000006
!	Mem[00000000100c1438] = 20d51e6ec5fe2019, %f10 = 7bafe2d6 6f1119cf
	ldd	[%i3+0x038],%f10	! %f10 = 20d51e6e c5fe2019
!	Mem[0000000010081400] = c08c125a, %l2 = 0000000000000006
	lduwa	[%i2+%g0]0x88,%l2	! %l2 = 00000000c08c125a

p0_label_3:
!	Starting 10 instruction Store Burst
!	%l0 = ad30c18520d51e6e, Mem[0000000030001408] = 5baadcee
	stwa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 20d51e6e
!	%l1 = 29579e0e4dc8f880, Mem[0000000010181438] = 51b4caa2, %asi = 80
	stwa	%l1,[%i6+0x038]%asi	! Mem[0000000010181438] = 4dc8f880
!	%f12 = 223b4544, %f14 = 4b628a1c
	fcmpes	%fcc0,%f12,%f14		! %fcc0 = 1
!	%f18 = 226b062e 1d3db8c7, Mem[0000000030141410] = fc19794d 9dc41b66
	stda	%f18,[%i5+%o5]0x89	! Mem[0000000030141410] = 226b062e 1d3db8c7
!	Mem[0000000010181408] = 35f7917e, %l4 = 0000000060b073ae
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000035
!	%f26 = 7e074086 38acb2bf, %l6 = 54b0af2b618ca960
!	Mem[0000000030181408] = 110ce12e2ff347c7
	add	%i6,0x008,%g1
	stda	%f26,[%g1+%l6]ASI_PST16_S ! Mem[0000000030181408] = 110ce12e2ff347c7
!	%l2 = 00000000c08c125a, Mem[0000000010081408] = fe033217
	stha	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = fe03125a
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	%l4 = 0000000000000035, Mem[00000000201c0000] = 5667fea0, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 3567fea0
!	%l3 = 000000000000007e, Mem[0000000030081410] = dc268764
	stwa	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000007e
!	Mem[0000000010041408] = d759f70b, %l4 = 0000000000000035
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 000000000000000b

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 2d7e0634ccb07e6c, %l7 = 000000006c7eb0cc
	ldxa	[%i5+%o5]0x88,%l7	! %l7 = 2d7e0634ccb07e6c
!	Mem[0000000030181400] = 70f80e0b, %l2 = 00000000c08c125a
	ldsba	[%i6+%g0]0x89,%l2	! %l2 = 000000000000000b
!	Mem[0000000010101410] = 3410926c, %l3 = 000000000000007e
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000003410
!	Mem[0000000030001408] = 6e1ed520, %l4 = 000000000000000b
	ldsha	[%i0+%o4]0x89,%l4	! %l4 = ffffffffffffd520
!	%l3 = 0000000000003410, %l5 = 661a4f47dc464d65, %l2 = 000000000000000b
	or	%l3,%l5,%l2		! %l2 = 661a4f47dc467d75
!	%l4 = ffffffffffffd520, %l2 = 661a4f47dc467d75, %l0 = ad30c18520d51e6e
	udivx	%l4,%l2,%l0		! %l0 = 0000000000000002
!	Mem[00000000100c1408] = 734050d8, %l3 = 0000000000003410
	ldswa	[%i3+%o4]0x80,%l3	! %l3 = 00000000734050d8
!	%f2  = 67265b08, %f18 = 226b062e
	fcmps	%fcc2,%f2 ,%f18		! %fcc2 = 2
!	Mem[00000000100c1400] = 1674e186, %l0 = 0000000000000002
	ldsba	[%i3+%g0]0x88,%l0	! %l0 = ffffffffffffff86
!	Mem[0000000010141410] = ccb07e6c, %l1 = 29579e0e4dc8f880
	ldswa	[%i5+%o5]0x88,%l1	! %l1 = ffffffffccb07e6c

p0_label_5:
!	Starting 10 instruction Store Burst
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0001] = 54d5f930, %l3 = 00000000734050d8
	ldstub	[%o2+0x001],%l3		! %l3 = 00000000000000d5
!	Mem[0000000010041408] = fff759d7, %l5 = 00000000dc464d65
	swapa	[%i1+%o4]0x80,%l5	! %l5 = 00000000fff759d7
!	Mem[0000000010181410] = 4059bf2c, %l3 = 00000000000000d5
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 000000004059bf2c
!	Mem[0000000030041410] = 06f8607c, %l7 = 00000000ccb07e6c
	swapa	[%i1+%o5]0x81,%l7	! %l7 = 0000000006f8607c
!	Mem[0000000010001420] = 32fad99839481449, %l6 = 54b0af2b618ca960, %l4 = ffffffffffffd520
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = 32fad99839481449
!	%f23 = 6a59670e, Mem[0000000010141410] = ccb07e6c
	sta	%f23,[%i5+%o5]0x88	! Mem[0000000010141410] = 6a59670e
!	Mem[0000000010081410] = 761b25ac, %l4 = 32fad99839481449
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000076
!	%l0 = ffffffffffffff86, Mem[0000000030101408] = 323bca6e36a3c407
	stxa	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffffffffffff86
!	%l5 = 00000000fff759d7, Mem[0000000010141408] = 1e069252
	stwa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = fff759d7
!	%l3 = 000000004059bf2c, Mem[000000001018141c] = 54b7ad73
	sth	%l3,[%i6+0x01c]		! Mem[000000001018141c] = bf2cad73

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 1ce6dd3c, %l7 = 0000000006f8607c
	lduha	[%i3+%o5]0x81,%l7	! %l7 = 0000000000001ce6
!	Mem[0000000010141408] = fff759d7, %l0 = ffffffffffffff86
	ldswa	[%i5+%o4]0x88,%l0	! %l0 = fffffffffff759d7
!	Mem[000000001010141c] = 17728db3, %l0 = fffffffffff759d7, %asi = 80
	lduba	[%i4+0x01c]%asi,%l0	! %l0 = 0000000000000017
!	Mem[0000000010041408] = 654d46dc, %f1  = 2a2d7651
	lda	[%i1+%o4]0x88,%f1 	! %f1 = 654d46dc
!	Mem[0000000030101410] = 44ef839c, %l7 = 0000000000001ce6
	lduba	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000044
!	Mem[0000000010101410] = 4d5587696c921034, %l7 = 0000000000000044
	ldxa	[%i4+%o5]0x88,%l7	! %l7 = 4d5587696c921034
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800040] = 28e07f00, %l7 = 4d5587696c921034
	lduh	[%o1+0x040],%l7		! %l7 = 00000000000028e0
!	Mem[0000000010181400] = 406ea900, %l0 = 0000000000000017
	ldsba	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = c7b83d1d 2e066b22, %l0 = 00000000, %l1 = ccb07e6c
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 00000000c7b83d1d 000000002e066b22
!	Mem[0000000010141408] = d759f7ff, %f14 = 4b628a1c
	lda	[%i5+%o4]0x80,%f14	! %f14 = d759f7ff

p0_label_7:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = ff6f9dce, %l5 = 00000000fff759d7
	ldstuba	[%i5+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081425] = 4f14c209, %l1 = 000000002e066b22
	ldstub	[%i2+0x025],%l1		! %l1 = 0000000000000014
!	Mem[0000000010001428] = 72348196, %l1 = 0000000000000014, %asi = 80
	swapa	[%i0+0x028]%asi,%l1	! %l1 = 0000000072348196
!	%l0 = 00000000c7b83d1d, Mem[000000001010143c] = 40441b2b, %asi = 80
	stba	%l0,[%i4+0x03c]%asi	! Mem[000000001010143c] = 1d441b2b
!	%f10 = 20d51e6e c5fe2019, %l6 = 54b0af2b618ca960
!	Mem[00000000100c1438] = 20d51e6ec5fe2019
	add	%i3,0x038,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_PL ! Mem[00000000100c1438] = 20d51e6ec5fe2019
!	Mem[0000000010101408] = 0509eabe, %l7 = 00000000000028e0
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000005
!	%f12 = 223b4544 1e2595c5, Mem[0000000010041408] = 654d46dc d40d3958
	stda	%f12,[%i1+%o4]0x88	! Mem[0000000010041408] = 223b4544 1e2595c5
!	%f12 = 223b4544 1e2595c5, Mem[0000000010001410] = 5fb978ec 7b0a91cd
	stda	%f12,[%i0+%o5]0x80	! Mem[0000000010001410] = 223b4544 1e2595c5
!	Mem[0000000010001400] = 4632bc00, %l3 = 000000004059bf2c
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000046
!	Mem[0000000030141400] = 10602c45, %l0 = 00000000c7b83d1d
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000045

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 05cdac60, %l7 = 0000000000000005
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000005
!	Mem[0000000010081408] = 5a1203fe 1557dd57, %l6 = 618ca960, %l7 = 00000005
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 000000005a1203fe 000000001557dd57
!	Mem[0000000020800040] = 28e07f00, %l3 = 0000000000000046
	lduh	[%o1+0x040],%l3		! %l3 = 00000000000028e0
!	Mem[00000000100c1438] = 20d51e6e, %f6  = 0568a3ca
	ld	[%i3+0x038],%f6 	! %f6 = 20d51e6e
!	Mem[0000000030081410] = 7e000000, %l7 = 000000001557dd57
	ldswa	[%i2+%o5]0x81,%l7	! %l7 = 000000007e000000
!	Mem[0000000030101400] = 654d46dc474f1a66, %f10 = 20d51e6e c5fe2019
	ldda	[%i4+%g0]0x81,%f10	! %f10 = 654d46dc 474f1a66
!	Mem[0000000010041408] = 1e2595c5, %l2 = 661a4f47dc467d75
	ldswa	[%i1+%o4]0x88,%l2	! %l2 = 000000001e2595c5
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030181400] = 0b0ef870 255690c1 110ce12e 2ff347c7
!	Mem[0000000030181410] = 035ba05c 785cb57d 103a4d7a 0d40e363
!	Mem[0000000030181420] = 0c0adc08 456bc6f9 3d31fb86 5ebba1bf
!	Mem[0000000030181430] = 4afdf774 23a06135 060c9752 08bdfedb
	ldda	[%i6+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030181400
!	Mem[0000000030081408] = 4700eb6e ae73b060, %l0 = 00000045, %l1 = 72348196
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 00000000ae73b060 000000004700eb6e
!	Mem[0000000030101410] = 9c83ef44, %l4 = 0000000000000076
	ldsba	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000044

p0_label_9:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141428] = 418c3676, %l5 = 00000000000000ff
	swap	[%i5+0x028],%l5		! %l5 = 00000000418c3676
!	%f5  = 785cb57d, Mem[0000000030041400] = 3e4d5e90
	sta	%f5 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 785cb57d
!	%l7 = 000000007e000000, Mem[0000000030041400] = 7db55c78
	stba	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 7db55c00
!	%l6 = 5a1203fe, %l7 = 7e000000, Mem[0000000010181408] = fff7917e 06f0c4d7
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 5a1203fe 7e000000
!	%l0 = 00000000ae73b060, Mem[00000000100c1400] = 86e17416
	stba	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 60e17416
!	%l1 = 000000004700eb6e, Mem[00000000100c1410] = 3837640c7f735c6d
	stx	%l1,[%i3+%o5]		! Mem[00000000100c1410] = 000000004700eb6e
!	%f4  = 035ba05c 785cb57d, Mem[0000000010081430] = 6f1acec4 6b030945
	std	%f4 ,[%i2+0x030]	! Mem[0000000010081430] = 035ba05c 785cb57d
!	Mem[000000001018140a] = 5a1203fe, %l0 = 00000000ae73b060
	ldstub	[%i6+0x00a],%l0		! %l0 = 0000000000000003
!	%f22 = 58ed827a, Mem[0000000010041400] = 05cdac60
	sta	%f22,[%i1+%g0]0x80	! Mem[0000000010041400] = 58ed827a
!	Mem[0000000010181400] = 406ea900, %l0 = 0000000000000003
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 00000000406ea900

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 5a1203fe, %l6 = 000000005a1203fe
	lduha	[%i2+%o4]0x80,%l6	! %l6 = 0000000000005a12
!	Mem[00000000300c1408] = 6a59670e, %l6 = 0000000000005a12
	ldswa	[%i3+%o4]0x81,%l6	! %l6 = 000000006a59670e
!	Mem[0000000030081410] = 0000007e, %f16 = 4ea07570
	lda	[%i2+%o5]0x89,%f16	! %f16 = 0000007e
!	Mem[00000000211c0001] = 54fff930, %l1 = 000000004700eb6e, %asi = 80
	ldsba	[%o2+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030141410] = c7b83d1d, %l2 = 000000001e2595c5
	lduwa	[%i5+%o5]0x81,%l2	! %l2 = 00000000c7b83d1d
!	Mem[0000000010041400] = 58ed827a48513ef1, %l2 = 00000000c7b83d1d
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = 58ed827a48513ef1
!	Mem[0000000010141428] = 000000ff, %l6 = 000000006a59670e
	ldsb	[%i5+0x028],%l6		! %l6 = 0000000000000000
!	Mem[0000000010081423] = 68d52258, %l5 = 00000000418c3676
	ldsb	[%i2+0x023],%l5		! %l5 = 0000000000000058
!	Mem[0000000010001410] = 223b4544, %l0 = 00000000406ea900
	ldsba	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000022
!	Mem[00000000100c1408] = d8504073, %f27 = 38acb2bf
	lda	[%i3+%o4]0x88,%f27	! %f27 = d8504073

p0_label_11:
!	Starting 10 instruction Store Burst
!	%l7 = 000000007e000000, imm = 0000000000000244, %l1 = ffffffffffffffff
	subc	%l7,0x244,%l1		! %l1 = 000000007dfffdbc
!	%l6 = 00000000, %l7 = 7e000000, Mem[0000000010001410] = 44453b22 c595251e
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 7e000000
!	Mem[0000000030001408] = 20d51e6e, %l0 = 0000000000000022
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 0000000020d51e6e
!	Mem[00000000201c0001] = 3567fea0, %l0 = 0000000020d51e6e
	ldstub	[%o0+0x001],%l0		! %l0 = 0000000000000067
!	Mem[0000000010041410] = 46e3d74c, %l2 = 0000000048513ef1
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 0000000046e3d74c
!	%l5 = 0000000000000058, immd = 00000000000002d5, %l108 = 0000000000000004
	udivx	%l5,0x2d5,%l4		! %l4 = 0000000000000000
!	%l0 = 0000000000000067, Mem[0000000030141400] = 10602cff
	stwa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000067
!	Mem[0000000010141430] = 0f194de4, %l4 = 0000000000000000
	swap	[%i5+0x030],%l4		! %l4 = 000000000f194de4
!	%l4 = 000000000f194de4, Mem[00000000201c0001] = 35fffea0
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = 35e4fea0
!	%l5 = 0000000000000058, Mem[0000000010081410] = ff1b25ac
	stha	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 005825ac

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000022, %l2 = 0000000046e3d74c
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000030041400] = 005cb57d 24750a61 4b28f04e 085b2667
!	Mem[0000000030041410] = ccb07e6c 649fe11d 5d51069a 65068403
!	Mem[0000000030041420] = 3d0d1628 48ca4499 44bb7ea6 45e2a45f
!	Mem[0000000030041430] = 7296cb94 0152d0d5 727b0472 621c037b
	ldda	[%i1+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030041400
!	Mem[0000000030081410] = 0000007e, %f31 = 0487dfdb
	lda	[%i2+%o5]0x89,%f31	! %f31 = 0000007e
!	Mem[0000000010001409] = 1bafdd3e, %l0 = 0000000000000067
	ldub	[%i0+0x009],%l0		! %l0 = 00000000000000af
!	Mem[0000000030181400] = 0b0ef870, %l3 = 00000000000028e0
	lduha	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000b0e
!	Mem[0000000030001400] = 70087630, %l4 = 000000000f194de4
	ldsha	[%i0+%g0]0x81,%l4	! %l4 = 0000000000007008
!	Mem[0000000030041410] = ccb07e6c 649fe11d, %l4 = 00007008, %l5 = 00000058
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 00000000ccb07e6c 00000000649fe11d
!	Mem[0000000030141408] = ff6f9dce, %l0 = 00000000000000af
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = ffffffffff6f9dce
!	%l6 = 0000000000000000, %l6 = 0000000000000000, %y  = 29579e0e
	smul	%l6,%l6,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[00000000300c1408] = 6a59670e, %l3 = 0000000000000b0e
	ldswa	[%i3+%o4]0x81,%l3	! %l3 = 000000006a59670e

p0_label_13:
!	Starting 10 instruction Store Burst
!	%l7 = 000000007e000000, Mem[0000000030001410] = 1c8a624b
	stha	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 1c8a0000
!	Mem[0000000030081408] = 60b073ae, %l1 = 000000007dfffdbc
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 0000000060b073ae
!	%l0 = ffffffffff6f9dce, Mem[0000000030141410] = c7b83d1d2e066b22
	stxa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffffff6f9dce
!	Mem[0000000030181408] = 110ce12e, %l1 = 0000000060b073ae
	swapa	[%i6+%o4]0x81,%l1	! %l1 = 00000000110ce12e
!	%f25 = 0126cff9, Mem[0000000010001410] = 00000000
	sta	%f25,[%i0+%o5]0x88	! Mem[0000000010001410] = 0126cff9
!	%f16 = 0000007e 300ff9c1, %l2 = 0000000000000000
!	Mem[00000000100c1420] = 016a2eb82af260e9
	add	%i3,0x020,%g1
	stda	%f16,[%g1+%l2]ASI_PST32_P ! Mem[00000000100c1420] = 016a2eb82af260e9
!	%l4 = 00000000ccb07e6c, Mem[0000000030001408] = 000000221308fc87
	stxa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000ccb07e6c
!	Mem[0000000030101400] = 654d46dc, %l4 = 00000000ccb07e6c
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000065
	membar	#Sync			! Added by membar checker (3)
!	%f10 = 44bb7ea6, Mem[0000000030041408] = 4b28f04e
	sta	%f10,[%i1+%o4]0x81	! Mem[0000000030041408] = 44bb7ea6
!	Mem[0000000010181400] = 03000000 3c6b4d51 5a12fffe 7e000000
!	%f0  = 005cb57d 24750a61 4b28f04e 085b2667
!	%f4  = ccb07e6c 649fe11d 5d51069a 65068403
!	%f8  = 3d0d1628 48ca4499 44bb7ea6 45e2a45f
!	%f12 = 7296cb94 0152d0d5 727b0472 621c037b
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010181400

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = dc464dff, %l7 = 000000007e000000
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = ffffffffdc464dff
!	Mem[0000000030141400] = e115493900000067, %l2 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = e115493900000067
!	Mem[0000000030041400] = 610a7524 7db55c00, %l2 = 00000067, %l3 = 6a59670e
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 000000007db55c00 00000000610a7524
!	%l6 = 0000000000000000, imm = 000000000000077d, %l6 = 0000000000000000
	andn	%l6,0x77d,%l6		! %l6 = 0000000000000000
!	Mem[0000000010041408] = 223b45441e2595c5, %f16 = 0000007e 300ff9c1
	ldda	[%i1+%o4]0x88,%f16	! %f16 = 223b4544 1e2595c5
!	Mem[00000000300c1408] = 0e67596a, %f28 = 5bcc2474
	lda	[%i3+%o4]0x89,%f28	! %f28 = 0e67596a
!	Mem[00000000201c0000] = 35e4fea0, %l4 = 0000000000000065
	ldsh	[%o0+%g0],%l4		! %l4 = 00000000000035e4
!	Mem[0000000010081420] = 68d52258, %l0 = ffffffffff6f9dce
	lduh	[%i2+0x020],%l0		! %l0 = 00000000000068d5
!	Mem[0000000010081400] = c08c125a, %l6 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l6	! %l6 = 000000000000125a
!	Mem[00000000300c1408] = 0e67596a, %f21 = 497e6e7d
	lda	[%i3+%o4]0x89,%f21	! %f21 = 0e67596a

p0_label_15:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = a67ebb44, %l7 = 00000000dc464dff
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 00000000a67ebb44
!	%f24 = 4a2a7908 0126cff9, Mem[0000000030141408] = ff6f9dce 093cade7
	stda	%f24,[%i5+%o4]0x81	! Mem[0000000030141408] = 4a2a7908 0126cff9
!	%f8  = 3d0d1628 48ca4499, %l1 = 00000000110ce12e
!	Mem[0000000030081428] = 0d611e061796aa3f
	add	%i2,0x028,%g1
	stda	%f8,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030081428] = 0d44ca481716aa3f
!	%l6 = 000000000000125a, immd = fffffffffffff1e1, %l108 = 0000000000000006
	sdivx	%l6,-0xe1f,%l6		! %l6 = ffffffffffffffff
!	%l2 = 000000007db55c00, Mem[000000001018141c] = 9a06515d, %asi = 80
	stwa	%l2,[%i6+0x01c]%asi	! Mem[000000001018141c] = 7db55c00
!	%f14 = 727b0472, %f23 = 6a59670e, %f30 = 3560ec52
	fmuls	%f14,%f23,%f30		! %f30 = 7f800000
!	%l2 = 000000007db55c00, Mem[0000000010081400] = 5a128cc0
	stha	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 5c008cc0
!	%l0 = 000068d5, %l1 = 110ce12e, Mem[0000000010141410] = 0e67596a 34067e2d
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 000068d5 110ce12e
!	Mem[00000000300c1408] = 6a59670e, %l1 = 00000000110ce12e
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 000000006a59670e
!	%f28 = 0e67596a 30f5ba35, Mem[0000000030181410] = 035ba05c 785cb57d
	stda	%f28,[%i6+%o5]0x81	! Mem[0000000030181410] = 0e67596a 30f5ba35

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffffffff, %l0 = 00000000000068d5
	ldsba	[%i4+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001410] = 00008a1c, %l3 = 00000000610a7524
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = dd72ff593cdde61c, %l5 = 00000000649fe11d
	ldxa	[%i3+%o5]0x89,%l5	! %l5 = dd72ff593cdde61c
!	Mem[0000000010141420] = 259c17786a742ea9, %l7 = 00000000a67ebb44
	ldx	[%i5+0x020],%l7		! %l7 = 259c17786a742ea9
!	Mem[0000000020800040] = 28e07f00, %l2 = 000000007db55c00
	lduh	[%o1+0x040],%l2		! %l2 = 00000000000028e0
!	Mem[0000000010101400] = 09fa1d80, %l4 = 00000000000035e4
	ldswa	[%i4+%g0]0x80,%l4	! %l4 = 0000000009fa1d80
!	Mem[0000000030001410] = 00008a1c, %l3 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000008a1c
!	Mem[0000000030041400] = 610a7524 7db55c00, %l4 = 09fa1d80, %l5 = 3cdde61c
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 000000007db55c00 00000000610a7524
!	Mem[0000000010101400] = 09fa1d80 6de2b791 ff09eabe 3710f117
!	Mem[0000000010101410] = 3410926c 6987554d 517c4c0a 17728db3
!	Mem[0000000010101420] = 378f2b18 6b6a2fc9 2d86ff16 568d1d0f
!	Mem[0000000010101430] = 100c3384 7468e305 3d5fafe2 1d441b2b
	ldda	[%i4+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010101400
!	Mem[0000000030181408] = 60b073ae, %l7 = 259c17786a742ea9
	lduba	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000060

p0_label_17:
!	Starting 10 instruction Store Burst
!	%f14 = 3d5fafe2, Mem[0000000030081410] = 0000007e
	sta	%f14,[%i2+%o5]0x89	! Mem[0000000030081410] = 3d5fafe2
!	%l6 = ffffffffffffffff, %l0 = ffffffffffffffff, %l4 = 000000007db55c00
	xor	%l6,%l0,%l4		! %l4 = 0000000000000000
!	%l3 = 0000000000008a1c, Mem[0000000020800040] = 28e07f00
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 8a1c7f00
!	%l3 = 0000000000008a1c, Mem[0000000030181400] = 70f80e0b
	stba	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 70f80e1c
!	%l1 = 000000006a59670e, Mem[0000000030181408] = 60b073ae
	stha	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 670e73ae
!	%f2  = ff09eabe 3710f117, Mem[00000000100c1408] = d8504073 8926444a
	stda	%f2 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff09eabe 3710f117
!	%f10 = 2d86ff16 568d1d0f, %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = 60e174162830206b
	stda	%f10,[%i3+%l0]ASI_PST8_PL ! Mem[00000000100c1400] = 0f1d8d5616ff862d
!	Mem[0000000010141418] = 6cdfc56a, %l1 = 6a59670e, %l3 = 00008a1c
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 000000006cdfc56a
!	%l1 = 000000006a59670e, Mem[0000000010041405] = 48513ef1
	stb	%l1,[%i1+0x005]		! Mem[0000000010041404] = 480e3ef1
!	%f20 = 22c1ad5c, Mem[0000000030181400] = 1c0ef870
	sta	%f20,[%i6+%g0]0x81	! Mem[0000000030181400] = 22c1ad5c

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 661a4f47dc464dff, %f18 = 226b062e 1d3db8c7
	ldda	[%i4+%g0]0x89,%f18	! %f18 = 661a4f47 dc464dff
!	Mem[0000000030041410] = ccb07e6c, %l7 = 0000000000000060
	ldswa	[%i1+%o5]0x81,%l7	! %l7 = ffffffffccb07e6c
!	Mem[00000000201c0000] = 35e4fea0, %l7 = ffffffffccb07e6c, %asi = 80
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000035
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010181408] = 67265b08, %l1 = 000000006a59670e
	lduba	[%i6+%o4]0x80,%l1	! %l1 = 0000000000000067
!	Mem[0000000010001400] = ff32bc00, %l5 = 00000000610a7524
	ldsba	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Code Fragment 3, seed = 725335
p0_fragment_1:
!	%l0 = ffffffffffffffff
	setx	0x1218cbe66942f46e,%g7,%l0 ! %l0 = 1218cbe66942f46e
!	%l1 = 0000000000000067
	setx	0xff99d645983c1619,%g7,%l1 ! %l1 = ff99d645983c1619
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1218cbe66942f46e
	setx	0x51e3a563e5cd23d4,%g7,%l0 ! %l0 = 51e3a563e5cd23d4
!	%l1 = ff99d645983c1619
	setx	0x3189626cddefa09f,%g7,%l1 ! %l1 = 3189626cddefa09f
p0_fragment_1_end:
!	Mem[0000000010001410] = 0126cff9, %l0 = 51e3a563e5cd23d4
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = 000000000126cff9
!	Mem[00000000300c1410] = 3cdde61c, %l7 = 0000000000000035
	lduba	[%i3+%o5]0x89,%l7	! %l7 = 000000000000001c
!	Mem[0000000030181400] = 22c1ad5c 255690c1 670e73ae 2ff347c7
!	Mem[0000000030181410] = 0e67596a 30f5ba35 103a4d7a 0d40e363
!	Mem[0000000030181420] = 0c0adc08 456bc6f9 3d31fb86 5ebba1bf
!	Mem[0000000030181430] = 4afdf774 23a06135 060c9752 08bdfedb
	ldda	[%i6+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030181400
!	Mem[000000001008141c] = 62102df3, %l0 = 000000000126cff9
	ldsb	[%i2+0x01c],%l0		! %l0 = 0000000000000062

p0_label_19:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000100c1410] = 000000004700eb6e
	stxa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	Mem[0000000010181408] = 085b2667, %l0 = 0000000000000062
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 00000000085b2667
!	Mem[0000000020800040] = 8a1c7f00, %l0 = 00000000085b2667
	ldstub	[%o1+0x040],%l0		! %l0 = 000000000000008a
!	Mem[00000000300c1408] = 2ee10c11, %l1 = 3189626cddefa09f
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000011
!	Mem[0000000030141408] = 08792a4a, %l3 = 000000006cdfc56a
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 0000000008792a4a
!	Mem[0000000010141408] = fff759d7, %l7 = 000000000000001c
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 00000000fff759d7
!	Mem[00000000211c0000] = 54fff930, %l4 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000054
!	Mem[0000000010101400] = 09fa1d80, %l2 = 00000000000028e0
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 0000000009fa1d80
!	%f12 = 4afdf774, Mem[000000001004141c] = 02480613
	st	%f12,[%i1+0x01c]	! Mem[000000001004141c] = 4afdf774
!	%l5 = ffffffffffffffff, Mem[00000000201c0000] = 35e4fea0
	stb	%l5,[%o0+%g0]		! Mem[00000000201c0000] = ffe4fea0

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181428] = 5fa4e245, %l2 = 0000000009fa1d80
	lduw	[%i6+0x028],%l2		! %l2 = 000000005fa4e245
!	Mem[0000000030081410] = e2af5f3d, %l7 = 00000000fff759d7
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffffffe2
!	Mem[0000000010081410] = 005825ac, %l5 = ffffffffffffffff
	ldswa	[%i2+%o5]0x80,%l5	! %l5 = 00000000005825ac
!	Mem[0000000010141400] = e0cd4c50, %l7 = ffffffffffffffe2
	ldsha	[%i5+%g0]0x88,%l7	! %l7 = 0000000000004c50
!	Mem[0000000030141408] = 6cdfc56a, %l2 = 000000005fa4e245
	ldsba	[%i5+%o4]0x89,%l2	! %l2 = 000000000000006a
!	Mem[00000000300c1408] = ff0ce12e, %l3 = 0000000008792a4a
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 00000000ff0ce12e
!	Mem[0000000010101408] = ff09eabe, %l2 = 000000000000006a, %asi = 80
	ldsha	[%i4+0x008]%asi,%l2	! %l2 = ffffffffffffff09
!	Mem[0000000030141408] = 6cdfc56a, %l4 = 0000000000000054
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 000000000000006a
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[00000000218000c0] = 4b94b9f0, %l0 = 000000000000008a, %asi = 80
	ldsha	[%o3+0x0c0]%asi,%l0	! %l0 = 0000000000004b94
!	Mem[0000000010001408] = 3eddaf1b, %l7 = 0000000000004c50
	lduha	[%i0+%o4]0x88,%l7	! %l7 = 000000000000af1b

p0_label_21:
!	Starting 10 instruction Store Burst
!	Mem[000000001004142e] = 1e58836f, %l5 = 00000000005825ac
	ldstub	[%i1+0x02e],%l5		! %l5 = 0000000000000083
!	%f28 = 0e67596a, Mem[0000000010001400] = ff32bc00
	sta	%f28,[%i0+0x000]%asi	! Mem[0000000010001400] = 0e67596a
!	%l5 = 0000000000000083, Mem[00000000100c1408] = 3710f117
	stba	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 3710f183
!	Mem[0000000010001408] = 3eddaf1b, %l4 = 000000000000006a
	swapa	[%i0+%o4]0x88,%l4	! %l4 = 000000003eddaf1b
!	%l6 = ffffffff, %l7 = 0000af1b, Mem[0000000010081400] = c08c005c d1e12a4b
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffff 0000af1b
!	%l2 = ffffffffffffff09, Mem[00000000100c1410] = 0000000000000000
	stxa	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffffffffff09
!	%l5 = 0000000000000083, Mem[0000000030081400] = c1f90f30
	stwa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000083
!	%l0 = 0000000000004b94, Mem[0000000010081404] = 1baf0000, %asi = 80
	stwa	%l0,[%i2+0x004]%asi	! Mem[0000000010081404] = 00004b94
!	Mem[0000000030101400] = ff4d46dc, %l2 = 00000000ffffff09
	swapa	[%i4+%g0]0x81,%l2	! %l2 = 00000000ff4d46dc
!	%f14 = 060c9752 08bdfedb, %l2 = 00000000ff4d46dc
!	Mem[0000000010041430] = 158684645bc1e465
	add	%i1,0x030,%g1
	stda	%f14,[%g1+%l2]ASI_PST32_P ! Mem[0000000010041430] = 158684645bc1e465

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ffffffffffffff09, %l2 = 00000000ff4d46dc
	ldxa	[%i3+%o5]0x80,%l2	! %l2 = ffffffffffffff09
!	Mem[0000000010181408] = 4b28f04e00000062, %f20 = 22c1ad5c 0e67596a
	ldda	[%i6+%o4]0x88,%f20	! %f20 = 4b28f04e 00000062
!	Mem[0000000021800080] = 2d5f4fc0, %l6 = ffffffffffffffff
	lduh	[%o3+0x080],%l6		! %l6 = 0000000000002d5f
!	Mem[00000000300c1400] = 08b0ff5042eeb021, %f26 = 7e074086 d8504073
	ldda	[%i3+%g0]0x81,%f26	! %f26 = 08b0ff50 42eeb021
!	Mem[0000000010001438] = 0742ba62, %l6 = 0000000000002d5f
	lduw	[%i0+0x038],%l6		! %l6 = 000000000742ba62
!	Mem[0000000010181410] = 649fe11d, %f17 = 1e2595c5
	lda	[%i6+%o5]0x88,%f17	! %f17 = 649fe11d
!	Mem[0000000030141410] = ffffffff, %l3 = 00000000ff0ce12e
	ldsba	[%i5+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181408] = 62000000, %l0 = 0000000000004b94
	lduwa	[%i6+%o4]0x80,%l0	! %l0 = 0000000062000000
!	Mem[00000000300c1410] = 1ce6dd3c, %l6 = 000000000742ba62
	lduba	[%i3+%o5]0x81,%l6	! %l6 = 000000000000001c
!	Mem[0000000010141400] = 504ccde0, %f28 = 0e67596a
	lda	[%i5+%g0]0x80,%f28	! %f28 = 504ccde0

p0_label_23:
!	Starting 10 instruction Store Burst
!	%l6 = 0000001c, %l7 = 0000af1b, Mem[0000000030081410] = e2af5f3d 673411fd
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000001c 0000af1b
!	Mem[00000000100c140c] = beea09ff, %l4 = 3eddaf1b, %l4 = 3eddaf1b
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 00000000beea09ff
!	%l3 = ffffffffffffffff, Mem[0000000030081410] = 1c000000
	stba	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 1c0000ff
!	Mem[0000000010141408] = 1c000000, %l6 = 000000000000001c
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 000000001c000000
!	%l0 = 0000000062000000, Mem[00000000100c1408] = 83f11037
	stha	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00001037
!	%l6 = 000000001c000000, %l2 = ffffffffffffff09, %y  = 00000000
	sdiv	%l6,%l2,%l3		! %l3 = ffffffffffe2fad2
	mov	%l0,%y			! %y = 62000000
!	%f22 = 58ed827a, Mem[0000000010101400] = e0280000
	sta	%f22,[%i4+%g0]0x88	! Mem[0000000010101400] = 58ed827a
!	Mem[0000000030181410] = 0e67596a, %l2 = 00000000ffffff09
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 000000000e67596a
!	Mem[0000000030141410] = ffffffff, %l4 = 00000000beea09ff
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%l5 = 0000000000000083, Mem[0000000030081408] = bcfdff7d
	stba	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = bcfdff83

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff00001c, %l1 = 0000000000000011
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041434] = 5bc1e465, %l1 = ffffffffffffffff
	ldsw	[%i1+0x034],%l1		! %l1 = 000000005bc1e465
!	Mem[000000001018141e] = 7db55c00, %l7 = 000000000000af1b
	lduh	[%i6+0x01e],%l7		! %l7 = 0000000000005c00
!	Mem[0000000030101400] = ffffff09, %l7 = 0000000000005c00
	lduha	[%i4+%g0]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030181410] = 09ffffff, %l5 = 0000000000000083
	ldsba	[%i6+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Code Fragment 4, seed = 493847
p0_fragment_2:
!	%l0 = 0000000062000000
	setx	0xbf26f099ee22f66e,%g7,%l0 ! %l0 = bf26f099ee22f66e
!	%l1 = 000000005bc1e465
	setx	0xd5b386ab88c47819,%g7,%l1 ! %l1 = d5b386ab88c47819
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bf26f099ee22f66e
	setx	0x92e2d417e10fe5d4,%g7,%l0 ! %l0 = 92e2d417e10fe5d4
!	%l1 = d5b386ab88c47819
	setx	0xf50e5ef33e5ec29f,%g7,%l1 ! %l1 = f50e5ef33e5ec29f
p0_fragment_2_end:
!	Mem[0000000030041408] = dc464dff, %l3 = ffffffffffe2fad2
	ldsha	[%i1+%o4]0x89,%l3	! %l3 = 0000000000004dff
!	Mem[0000000010081408] = fe03125a, %l0 = 92e2d417e10fe5d4
	ldswa	[%i2+%o4]0x88,%l0	! %l0 = fffffffffe03125a
!	Mem[0000000030001408] = 00000000, %l3 = 0000000000004dff
	lduba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = ff09eabe 3710f117, %l0 = fe03125a, %l1 = 3e5ec29f
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 00000000ff09eabe 000000003710f117

p0_label_25:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030081400] = 00000083
	stha	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000083
!	%f30 = 7f800000, Mem[0000000030001400] = 70087630
	sta	%f30,[%i0+%g0]0x81	! Mem[0000000030001400] = 7f800000
!	%l1 = 000000003710f117, Mem[0000000010141408] = 1c000000
	stba	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 1c000017
!	%l3 = 0000000000000000, Mem[0000000030001408] = 00000000
	stha	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%l6 = 000000001c000000, Mem[0000000030101408] = ffffffff
	stwa	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 1c000000
!	%l6 = 1c000000, %l7 = 0000ffff, Mem[0000000030041408] = ff4d46dc 085b2667
	stda	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 1c000000 0000ffff
!	Mem[0000000030001400] = 0000807f, %l1 = 000000003710f117
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 000000000000007f
!	Mem[0000000030001410] = 00008a1c, %l5 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%f13 = 23a06135, Mem[0000000010101410] = 6c921034
	sta	%f13,[%i4+%o5]0x88	! Mem[0000000010101410] = 23a06135
!	%l2 = 000000000e67596a, Mem[0000000010141400] = 71eab05fe0cd4c50
	stxa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000000e67596a

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 09ffffff ffffffff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 00000000ffffffff 0000000009ffffff
!	Mem[0000000030081410] = ff00001c, %l3 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l3	! %l3 = ffffffffff00001c
!	Mem[0000000010141420] = 259c1778, %f31 = 0000007e
	ld	[%i5+0x020],%f31	! %f31 = 259c1778
!	Mem[0000000010081410] = 8d935225 ac255800, %l2 = 0e67596a, %l3 = ff00001c
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000ac255800 000000008d935225
!	Mem[0000000030101410] = 44ef839c, %l1 = 000000000000007f
	ldswa	[%i4+%o5]0x81,%l1	! %l1 = 0000000044ef839c
!	Code Fragment 3, seed = 283277
p0_fragment_3:
!	%l0 = 00000000ff09eabe
	setx	0xf4112f4da9ce00be,%g7,%l0 ! %l0 = f4112f4da9ce00be
!	%l1 = 0000000044ef839c
	setx	0xf2765e7c190bb169,%g7,%l1 ! %l1 = f2765e7c190bb169
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f4112f4da9ce00be
	setx	0x6ee6da7e7a281e24,%g7,%l0 ! %l0 = 6ee6da7e7a281e24
!	%l1 = f2765e7c190bb169
	setx	0x67208f5e9aa3c9ef,%g7,%l1 ! %l1 = 67208f5e9aa3c9ef
p0_fragment_3_end:
!	Mem[0000000030041410] = ccb07e6c, %l6 = 000000001c000000
	lduba	[%i1+%o5]0x81,%l6	! %l6 = 00000000000000cc
!	Mem[0000000010041408] = 1e2595c5, %f1  = 255690c1
	lda	[%i1+%o4]0x88,%f1 	! %f1 = 1e2595c5
!	Mem[0000000030101410] = 9c83ef44, %l1 = 67208f5e9aa3c9ef
	lduba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000044
!	Mem[0000000030141408] = ffc5df6c 0126cff9, %l2 = ac255800, %l3 = 8d935225
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 00000000ffc5df6c 000000000126cff9

p0_label_27:
!	Starting 10 instruction Store Burst
!	%f30 = 7f800000 259c1778, Mem[0000000010001408] = 0000006a 9789050c
	stda	%f30,[%i0+%o4]0x88	! Mem[0000000010001408] = 7f800000 259c1778
!	%l4 = 00000000ffffffff, Mem[0000000010001400] = 6a59670e
	stwa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffff
	membar	#Sync			! Added by membar checker (5)
!	%l1 = 0000000000000044, Mem[0000000030181410] = ffffff09
	stwa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000044
!	Mem[0000000030001408] = 00000000, %l4 = 00000000ffffffff
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%f26 = 08b0ff50 42eeb021, Mem[0000000030001410] = ff008a1c 63cae03d
	stda	%f26,[%i0+%o5]0x81	! Mem[0000000030001410] = 08b0ff50 42eeb021
!	%f22 = 58ed827a, Mem[0000000010101410] = 3561a023
	sta	%f22,[%i4+%o5]0x80	! Mem[0000000010101410] = 58ed827a
!	Mem[0000000010081410] = 005825ac, %l7 = 000000000000ffff
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 00000000005825ac
!	Mem[0000000010181408] = 00000062, %l0 = 000000007a281e24
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000062
!	%l5 = 0000000009ffffff, Mem[0000000030001408] = 000000ff
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
!	%l0 = 0000000000000062, Mem[0000000010101414] = 6987554d, %asi = 80
	stba	%l0,[%i4+0x014]%asi	! Mem[0000000010101414] = 6287554d

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ffffffffffffff09, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l4	! %l4 = ffffffffffffff09
!	Mem[0000000030181410] = 44000000, %l1 = 0000000000000044
	ldsba	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 610a7524, %l7 = 00000000005825ac
	lduba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000061
!	Mem[0000000010141400] = 6a59670e, %l2 = 00000000ffc5df6c
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 000000000000006a
!	Mem[0000000010041408] = c595251e, %l5 = 0000000009ffffff
	lduwa	[%i1+%o4]0x80,%l5	! %l5 = 00000000c595251e
!	Mem[0000000010001410] = f9cf2601, %l6 = 00000000000000cc
	lduha	[%i0+%o5]0x80,%l6	! %l6 = 000000000000f9cf
!	Mem[0000000010101400] = 58ed827a, %l0 = 0000000000000062
	lduwa	[%i4+%g0]0x88,%l0	! %l0 = 0000000058ed827a
!	Mem[0000000010081410] = ffff0000, %l1 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 1700001c 486002f7, %l2 = 0000006a, %l3 = 0126cff9
	ldd	[%i5+%o4],%l2		! %l2 = 000000001700001c 00000000486002f7
!	Mem[0000000010101408] = ff09eabe, %f31 = 259c1778
	lda	[%i4+%o4]0x80,%f31	! %f31 = ff09eabe

p0_label_29:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = ffffffff 00004b94 5a1203fe 1557dd57
!	%f16 = 223b4544 649fe11d 661a4f47 dc464dff
!	%f20 = 4b28f04e 00000062 58ed827a 6a59670e
!	%f24 = 4a2a7908 0126cff9 08b0ff50 42eeb021
!	%f28 = 504ccde0 30f5ba35 7f800000 ff09eabe
	stda	%f16,[%i2+%g0]ASI_COMMIT_P	! Block Store to 0000000010081400
!	%l2 = 000000001700001c, Mem[0000000030141410] = ffffffff
	stha	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 001cffff
!	%l5 = 00000000c595251e, Mem[00000000100c1410] = ffffffff
	stba	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffff1e
!	%l4 = ffffff09, %l5 = c595251e, Mem[0000000010041408] = 1e2595c5 223b4544
	stda	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffff09 c595251e
!	Mem[0000000030141400] = 00000067, %l2 = 000000001700001c
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000067
!	%l4 = ffffffffffffff09, Mem[0000000010041408] = ffffff09
	stwa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffff09
!	%l2 = 00000067, %l3 = 486002f7, Mem[0000000030081408] = bcfdff83 4700eb6e
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000067 486002f7
!	%f15 = 08bdfedb, Mem[000000001004141c] = 4afdf774
	st	%f15,[%i1+0x01c]	! Mem[000000001004141c] = 08bdfedb
!	Mem[0000000030001410] = 50ffb008, %l3 = 00000000486002f7
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000008
!	Code Fragment 4, seed = 21458
p0_fragment_4:
!	%l0 = 0000000058ed827a
	setx	0xe05d3014116b4b96,%g7,%l0 ! %l0 = e05d3014116b4b96
!	%l1 = 0000000000000000
	setx	0x1da6d2443021e4c1,%g7,%l1 ! %l1 = 1da6d2443021e4c1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e05d3014116b4b96
	setx	0xd30eb6e947ecd1fc,%g7,%l0 ! %l0 = d30eb6e947ecd1fc
!	%l1 = 1da6d2443021e4c1
	setx	0x954a3236e2391647,%g7,%l1 ! %l1 = 954a3236e2391647
p0_fragment_4_end:

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ae730e67, %l7 = 0000000000000061
	lduba	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000067
!	Mem[0000000030041400] = 610a75247db55c00, %l4 = ffffffffffffff09
	ldxa	[%i1+%g0]0x89,%l4	! %l4 = 610a75247db55c00
!	Mem[00000000100c1410] = 1effffffffffff09, %f12 = 4afdf774 23a06135
	ldd	[%i3+%o5],%f12		! %f12 = 1effffff ffffff09
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010081408] = 661a4f47, %l6 = 000000000000f9cf
	lduba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000066
!	Mem[0000000010181428] = 5fa4e245a67ebb44, %f26 = 08b0ff50 42eeb021, %asi = 80
	ldda	[%i6+0x028]%asi,%f26	! %f26 = 5fa4e245 a67ebb44
!	Mem[0000000010141408] = 1700001c, %l5 = 00000000c595251e
	ldsha	[%i5+%o4]0x80,%l5	! %l5 = 0000000000001700
!	Mem[0000000020800000] = 6e7f80d0, %l2 = 0000000000000067, %asi = 80
	ldsha	[%o1+0x000]%asi,%l2	! %l2 = 0000000000006e7f
!	Mem[0000000010141410] = 000068d5, %l5 = 0000000000001700
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = ffffff09, %l0 = d30eb6e947ecd1fc
	lduba	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000009
!	Mem[00000000100c1400] = 0f1d8d56, %l2 = 0000000000006e7f
	ldswa	[%i3+%g0]0x80,%l2	! %l2 = 000000000f1d8d56

p0_label_31:
!	Starting 10 instruction Store Burst
!	%l4 = 7db55c00, %l5 = 00000000, Mem[0000000010041410] = 48513ef1 76acfaad
	std	%l4,[%i1+%o5]		! Mem[0000000010041410] = 7db55c00 00000000
!	Mem[00000000100c142a] = 34ad37b6, %l5 = 0000000000000000
	ldstub	[%i3+0x02a],%l5		! %l5 = 0000000000000037
!	Mem[0000000030081400] = 83000000, %l4 = 000000007db55c00
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 0000000083000000
!	%f23 = 6a59670e, %f16 = 223b4544
	fcmpes	%fcc2,%f23,%f16		! %fcc2 = 2
!	%l0 = 0000000000000009, Mem[0000000030041400] = 610a75247db55c00
	stxa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000009
!	%l1 = 954a3236e2391647, Mem[0000000010101400] = 58ed827a
	stha	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 58ed1647
!	%l1 = 954a3236e2391647, Mem[0000000010041410] = 005cb57d
	stha	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 005c1647
!	Mem[0000000010181410] = 1de19f64, %l3 = 0000000000000008
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 000000001de19f64
!	%f4  = 0e67596a 30f5ba35, Mem[0000000010081408] = 474f1a66 ff4d46dc
	stda	%f4 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 0e67596a 30f5ba35
!	%l2 = 000000000f1d8d56, Mem[0000000030101408] = 1c000000
	stwa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 0f1d8d56

p0_label_32:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010101400] = 4716ed58 6de2b791 ff09eabe 3710f117
!	Mem[0000000010101410] = 58ed827a 6287554d 517c4c0a 17728db3
!	Mem[0000000010101420] = 378f2b18 6b6a2fc9 2d86ff16 568d1d0f
!	Mem[0000000010101430] = 100c3384 7468e305 3d5fafe2 1d441b2b
	ldda	[%i4+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010101400
!	Mem[000000001010143c] = 1d441b2b, %l6 = 0000000000000066, %asi = 80
	ldswa	[%i4+0x03c]%asi,%l6	! %l6 = 000000001d441b2b
!	Mem[0000000010001408] = 259c1778, %l6 = 000000001d441b2b
	lduha	[%i0+%o4]0x88,%l6	! %l6 = 0000000000001778
!	Mem[00000000300c1400] = 21b0ee42 50ffb008, %l4 = 83000000, %l5 = 00000037
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 0000000050ffb008 0000000021b0ee42
!	Mem[0000000030001410] = 50ffb0ff, %l5 = 0000000021b0ee42
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = ffffffffffffb0ff
!	%f15 = e2af5f3d, %f20 = 4b28f04e
	fsqrts	%f15,%f20		! %f20 = 7fffffff
!	%l5 = ffffffffffffb0ff, %l7 = 0000000000000067, %y  = 62000000
	udiv	%l5,%l7,%l1		! %l1 = 00000000ffffffff
	mov	%l0,%y			! %y = 00000009
!	Mem[0000000030081400] = 005cb57d, %f24 = 4a2a7908
	lda	[%i2+%g0]0x81,%f24	! %f24 = 005cb57d
!	Mem[0000000010141408] = 1700001c, %l6 = 0000000000001778
	lduha	[%i5+%o4]0x80,%l6	! %l6 = 0000000000001700
!	Mem[00000000300c1410] = 1ce6dd3c59ff72dd, %l5 = ffffffffffffb0ff
	ldxa	[%i3+%o5]0x81,%l5	! %l5 = 1ce6dd3c59ff72dd

p0_label_33:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 0f1d8d56, %l5 = 1ce6dd3c59ff72dd
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 000000000000000f
!	Mem[0000000020800041] = ff1c7f00, %l7 = 0000000000000067
	ldstuba	[%o1+0x041]%asi,%l7	! %l7 = 000000000000001c
!	%l4 = 0000000050ffb008, Mem[00000000211c0000] = fffff930, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = b008f930
!	Mem[0000000030141400] = 000000ff, %l0 = 0000000000000009
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (8)
!	%l5 = 000000000000000f, Mem[0000000010101410] = 7a82ed58
	stba	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 7a82ed0f
!	Mem[0000000010101400] = 4716ed58 6de2b791 ff09eabe 3710f117
!	%f0  = 91b7e26d 58ed1647 17f11037 beea09ff
!	%f4  = 4d558762 7a82ed58 b38d7217 0a4c7c51
!	%f8  = c92f6a6b 182b8f37 0f1d8d56 16ff862d
!	%f12 = 05e36874 84330c10 2b1b441d e2af5f3d
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010101400
!	%l5 = 000000000000000f, %l5 = 000000000000000f, %y  = 00000009
	umul	%l5,%l5,%l1		! %l1 = 00000000000000e1, %y = 00000000
!	Mem[0000000030041400] = 09000000, %l6 = 0000000000001700
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 0000000009000000
!	%f30 = 7f800000 ff09eabe, Mem[0000000010001408] = 78179c25 0000807f
	stda	%f30,[%i0+%o4]0x80	! Mem[0000000010001408] = 7f800000 ff09eabe
!	Mem[00000000300c1408] = ff0ce12e, %l0 = 00000000000000ff
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000ff

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 620000004ef0284b, %f28 = 504ccde0 30f5ba35
	ldda	[%i2+%o5]0x88,%f28	! %f28 = 62000000 4ef0284b
!	%f20 = 7fffffff, %f17 = 649fe11d, %f30 = 7f800000
	fsubs	%f20,%f17,%f30		! %f30 = 7fffffff
!	Mem[0000000030081410] = 1c0000ff, %l1 = 00000000000000e1
	lduha	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001408] = 7f800000, %l4 = 0000000050ffb008
	lduh	[%i0+%o4],%l4		! %l4 = 0000000000007f80
!	Mem[0000000030101408] = 0f1d8d56, %l0 = 00000000000000ff
	ldswa	[%i4+%o4]0x81,%l0	! %l0 = 000000000f1d8d56
!	Mem[00000000201c0000] = ffe4fea0, %l7 = 000000000000001c
	ldsh	[%o0+%g0],%l7		! %l7 = ffffffffffffffe4
!	Mem[0000000020800041] = ffff7f00, %l2 = 000000000f1d8d56, %asi = 80
	lduba	[%o1+0x041]%asi,%l2	! %l2 = 00000000000000ff
!	%f20 = 7fffffff, %f5  = 7a82ed58, %f27 = a67ebb44
	fsubs	%f20,%f5 ,%f27		! %f27 = 7fffffff
!	Mem[000000001008143c] = ff09eabe, %l0 = 000000000f1d8d56
	lduh	[%i2+0x03c],%l0		! %l0 = 000000000000ff09
!	Mem[0000000030181408] = 670e73ae, %l5 = 000000000000000f
	ldsba	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000067

p0_label_35:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[00000000100c1418] = 701942aa706105d3
	stx	%l2,[%i3+0x018]		! Mem[00000000100c1418] = 00000000000000ff
!	%l7 = ffffffffffffffe4, Mem[0000000030141400] = 000000ff
	stba	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000e4
!	%l7 = ffffffffffffffe4, %l0 = 000000000000ff09, %l3 = 000000001de19f64
	andn	%l7,%l0,%l3		! %l3 = ffffffffffff00e4
!	%l3 = ffffffffffff00e4, Mem[0000000030001400] = 817f404b000080ff
	stxa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffffffff00e4
!	%l5 = 0000000000000067, Mem[00000000300c1408] = ff0ce12e
	stha	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0067e12e
!	%l7 = ffffffffffffffe4, Mem[0000000030181410] = 0000004430f5ba35
	stxa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffffffffffe4
!	%l0 = 000000000000ff09, Mem[0000000030141408] = ffc5df6c0126cff9
	stxa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000000000ff09
!	Mem[0000000030081400] = 005cb57d, %l3 = 00000000ffff00e4
	swapa	[%i2+%g0]0x81,%l3	! %l3 = 00000000005cb57d
!	%f31 = ff09eabe, Mem[0000000030181408] = ae730e67
	sta	%f31,[%i6+%o4]0x89	! Mem[0000000030181408] = ff09eabe
!	%l4 = 0000000000007f80, Mem[00000000300c1408] = 0067e12e
	stba	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 8067e12e

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 8067e12e, %l6 = 0000000009000000
	ldsha	[%i3+%o4]0x81,%l6	! %l6 = ffffffffffff8067
!	Mem[0000000010041400] = 58ed827a480e3ef1, %l7 = ffffffffffffffe4
	ldxa	[%i1+%g0]0x80,%l7	! %l7 = 58ed827a480e3ef1
!	%l3 = 00000000005cb57d, imm = fffffffffffff6f8, %l6 = ffffffffffff8067
	xnor	%l3,-0x908,%l6		! %l6 = 00000000005cbc7a
!	Mem[0000000010081430] = 504ccde030f5ba35, %l5 = 0000000000000067
	ldx	[%i2+0x030],%l5		! %l5 = 504ccde030f5ba35
!	Mem[0000000030181408] = ff09eabe, %l6 = 00000000005cbc7a
	ldsba	[%i6+%o4]0x89,%l6	! %l6 = ffffffffffffffbe
!	Mem[0000000010041400] = 58ed827a 480e3ef1, %l6 = ffffffbe, %l7 = 480e3ef1
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 0000000058ed827a 00000000480e3ef1
!	%l0 = 000000000000ff09, %l6 = 0000000058ed827a, %y  = 00000000
	udiv	%l0,%l6,%l7		! %l7 = 0000000000000000
	mov	%l0,%y			! %y = 0000ff09
!	Mem[00000000211c0000] = b008f930, %l1 = 00000000000000ff
	ldub	[%o2+%g0],%l1		! %l1 = 00000000000000b0
!	%l7 = 0000000000000000, %l3 = 00000000005cb57d, %l7 = 0000000000000000
	subc	%l7,%l3,%l7		! %l7 = ffffffffffa34a83
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010101408] = 17f11037beea09ff, %f18 = 661a4f47 dc464dff
	ldda	[%i4+%o4]0x88,%f18	! %f18 = 17f11037 beea09ff

p0_label_37:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000005cb57d, Mem[0000000030001400] = e400ffff
	stwa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 005cb57d
!	Mem[00000000218000c1] = 4b94b9f0, %l7 = ffffffffffa34a83
	ldstub	[%o3+0x0c1],%l7		! %l7 = 0000000000000094
!	%l7 = 0000000000000094, Mem[0000000021800100] = 1a15a020, %asi = 80
	stha	%l7,[%o3+0x100]%asi	! Mem[0000000021800100] = 0094a020
!	Mem[0000000030001410] = ffb0ff50, %l1 = 00000000000000b0
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ffb0ff50
!	%l4 = 00007f80, %l5 = 30f5ba35, Mem[0000000010081420] = 4a2a7908 0126cff9, %asi = 80
	stda	%l4,[%i2+0x020]%asi	! Mem[0000000010081420] = 00007f80 30f5ba35
!	%l0 = 0000ff09, %l1 = ffb0ff50, Mem[0000000030141408] = 00000000 0000ff09
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000ff09 ffb0ff50
!	%f22 = 58ed827a, %f7  = 0a4c7c51, %f13 = 84330c10
	fadds	%f22,%f7 ,%f13		! %f13 = 58ed827a
!	%l4 = 0000000000007f80, Mem[0000000010141400] = 0e67596a
	stha	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 0e677f80
!	%l4 = 0000000000007f80, Mem[00000000300c1400] = 50ffb008
	stha	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 50ff7f80
!	%l6 = 0000000058ed827a, Mem[0000000010141408] = 1700001c486002f7
	stxa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000058ed827a

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 568d1d0f, %l6 = 0000000058ed827a
	lduha	[%i4+%o4]0x89,%l6	! %l6 = 0000000000001d0f
!	%l4 = 0000000000007f80, %l1 = 00000000ffb0ff50, %l7 = 0000000000000094
	subc	%l4,%l1,%l7		! %l7 = ffffffff004f8030
!	Mem[0000000010141410] = 000068d5, %f7  = 0a4c7c51
	lda	[%i5+%o5]0x80,%f7 	! %f7 = 000068d5
!	Mem[00000000300c1400] = 807fff50, %f27 = 7fffffff
	lda	[%i3+%g0]0x81,%f27	! %f27 = 807fff50
!	Mem[0000000030001410] = 000000b0, %l1 = 00000000ffb0ff50
	ldsba	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = b008f930, %l1 = 0000000000000000, %asi = 80
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffb008
!	Mem[0000000010181400] = 24750a61, %l5 = 504ccde030f5ba35
	lduha	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000a61
!	Mem[0000000030101400] = ffffff09, %f4  = 4d558762
	lda	[%i4+%g0]0x81,%f4 	! %f4 = ffffff09
!	Mem[00000000100c1408] = 00001037, %l0 = 000000000000ff09
	lduwa	[%i3+%o4]0x80,%l0	! %l0 = 0000000000001037
!	%f22 = 58ed827a, %f12 = 05e36874, %f25 = 0126cff9
	fadds	%f22,%f12,%f25		! %f25 = 58ed827a

p0_label_39:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 005cb57d, %l7 = 00000000004f8030
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 00000000005cb57d
!	Mem[00000000100c1410] = ffffff1e, %l6 = 0000000000001d0f
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 00000000ffffff1e
!	%f0  = 91b7e26d 58ed1647, %l6 = 00000000ffffff1e
!	Mem[0000000010041410] = 47165c0000000000
	add	%i1,0x010,%g1
	stda	%f0,[%g1+%l6]ASI_PST16_P ! Mem[0000000010041410] = 91b7e26d58ed0000
!	Mem[000000001004142d] = 1e58ff6f, %l1 = ffffffffffffb008
	ldstuba	[%i1+0x02d]%asi,%l1	! %l1 = 0000000000000058
!	%f27 = 807fff50, Mem[0000000010101408] = ff09eabe
	sta	%f27,[%i4+%o4]0x80	! Mem[0000000010101408] = 807fff50
!	%f24 = 005cb57d, Mem[0000000010101400] = 4716ed58
	sta	%f24,[%i4+%g0]0x80	! Mem[0000000010101400] = 005cb57d
!	%f8  = c92f6a6b 182b8f37, Mem[0000000030181400] = 22c1ad5c 255690c1
	stda	%f8 ,[%i6+%g0]0x81	! Mem[0000000030181400] = c92f6a6b 182b8f37
!	Mem[0000000030181410] = ffffffff, %l2 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101410] = 58ed827a, %l1 = 0000000000000058
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000058
!	%l7 = 00000000005cb57d, Mem[0000000030081400] = ffff00e4
	stha	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = b57d00e4

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000807f, %l0 = 0000000000001037
	ldswa	[%i0+%o4]0x88,%l0	! %l0 = 000000000000807f
!	Mem[00000000100c1410] = 09ffffff00001d0f, %l3 = 00000000005cb57d
	ldxa	[%i3+%o5]0x88,%l3	! %l3 = 09ffffff00001d0f
!	Mem[0000000010081400] = 223b4544 649fe11d, %l4 = 00007f80, %l5 = 00000a61, %asi = 80
	ldda	[%i2+0x000]%asi,%l4	! %l4 = 00000000223b4544 00000000649fe11d
!	Mem[0000000010181412] = 00000008, %l7 = 00000000005cb57d, %asi = 80
	lduha	[%i6+0x012]%asi,%l7	! %l7 = 0000000000000008
!	Mem[0000000010181403] = 610a7524, %l7 = 0000000000000008
	ldsb	[%i6+0x003],%l7		! %l7 = 0000000000000024
!	Mem[0000000010041400] = 58ed827a 480e3ef1, %l0 = 0000807f, %l1 = 00000058, %asi = 80
	ldda	[%i1+0x000]%asi,%l0	! %l0 = 0000000058ed827a 00000000480e3ef1
!	Mem[0000000030041408] = ffff00000000001c, %l6 = 00000000ffffff1e
	ldxa	[%i1+%o4]0x89,%l6	! %l6 = ffff00000000001c
!	Mem[00000000100c143a] = 20d51e6e, %l2 = 00000000000000ff, %asi = 80
	ldsha	[%i3+0x03a]%asi,%l2	! %l2 = 0000000000001e6e
!	Mem[0000000030101400] = ffffff09 474f1a66 0f1d8d56 ffffff86
!	Mem[0000000030101410] = 44ef839c 177a03bd 475c7aba 233d13a3
!	Mem[0000000030101420] = 76db2348 29c56939 5cdaacc6 7741c5ff
!	Mem[0000000030101430] = 0967e2b4 52d69775 1c330c92 7660571b
	ldda	[%i4+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000030041408] = 0000001c, %l4 = 00000000223b4544
	ldswa	[%i1+%o4]0x89,%l4	! %l4 = 000000000000001c

p0_label_41:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000480e3ef1, Mem[0000000010141400] = 807f670e00000000
	stxa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000480e3ef1
!	Mem[0000000010081400] = 223b4544, %l2 = 0000000000001e6e
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000223b4544
!	%l6 = ffff00000000001c, Mem[00000000100c1400] = ff1d8d56
	stwa	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000001c
!	Mem[0000000010141408] = 00000000, %l3 = 09ffffff00001d0f
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 000000ff, %l2 = 00000000223b4544
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f28 = 0967e2b4 52d69775, Mem[0000000010141410] = 000068d5 110ce12e
	stda	%f28,[%i5+%o5]0x80	! Mem[0000000010141410] = 0967e2b4 52d69775
!	Mem[0000000010141400] = 00000000, %l7 = 0000000000000024
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l5 = 00000000649fe11d, Mem[0000000030181400] = 6b6a2fc9
	stba	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 6b6a2f1d
!	%f4  = ffffff09, %f19 = ffffff86, %f7  = 000068d5
	fdivs	%f4 ,%f19,%f7 		! %f7  = ffffff86
!	Mem[0000000010181400] = 610a7524, %l3 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000061

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 09ffffff, %f3  = beea09ff
	lda	[%i4+%g0]0x89,%f3 	! %f3 = 09ffffff
!	Mem[0000000010001430] = 2a152a04, %l3 = 0000000000000061
	ldsh	[%i0+0x030],%l3		! %l3 = 0000000000002a15
!	Mem[0000000030001408] = ff000000, %l7 = 0000000000000000
	lduha	[%i0+%o4]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[00000000100c1400] = 0000001c, %l2 = 00000000000000ff
	lduba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 000000e4, %l5 = 00000000649fe11d
	lduwa	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000e4
!	Mem[0000000010041410] = 91b7e26d, %l7 = 000000000000ff00
	ldsha	[%i1+%o5]0x80,%l7	! %l7 = ffffffffffff91b7
!	Mem[00000000100c1438] = 20d51e6ec5fe2019, %l0 = 0000000058ed827a, %asi = 80
	ldxa	[%i3+0x038]%asi,%l0	! %l0 = 20d51e6ec5fe2019
!	Mem[0000000010101410] = ffed827a6287554d, %f14 = 2b1b441d e2af5f3d
	ldda	[%i4+%o5]0x80,%f14	! %f14 = ffed827a 6287554d
!	%l1 = 00000000480e3ef1, %l5 = 00000000000000e4, %l2 = 0000000000000000
	addc	%l1,%l5,%l2		! %l2 = 00000000480e3fd5
!	Mem[0000000030001400] = ffffffff30804f00, %l2 = 00000000480e3fd5
	ldxa	[%i0+%g0]0x89,%l2	! %l2 = ffffffff30804f00

p0_label_43:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000002a15, Mem[0000000010141408] = 44453b2258ed827a, %asi = 80
	stxa	%l3,[%i5+0x008]%asi	! Mem[0000000010141408] = 0000000000002a15
!	%l3 = 0000000000002a15, Mem[0000000010081408] = 0e67596a30f5ba35
	stxa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000000000002a15
!	%f26 = 5cdaacc6 7741c5ff, Mem[0000000010041428] = 341bf8f6 1effff6f, %asi = 80
	stda	%f26,[%i1+0x028]%asi	! Mem[0000000010041428] = 5cdaacc6 7741c5ff
!	%l1 = 00000000480e3ef1, Mem[0000000030081410] = ff00001c
	stwa	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 480e3ef1
!	%f31 = 7660571b, Mem[0000000010001408] = 7f800000
	sta	%f31,[%i0+%o4]0x80	! Mem[0000000010001408] = 7660571b
!	Mem[0000000010041400] = 7a82ed58, %l5 = 00000000000000e4
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 000000007a82ed58
!	%f22 = 475c7aba 233d13a3, %l4 = 000000000000001c
!	Mem[0000000030141438] = 12ca99f25531d2fb
	add	%i5,0x038,%g1
	stda	%f22,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030141438] = 12ca99f25531d2fb
!	Mem[00000000300c1410] = 3cdde61c, %l5 = 000000007a82ed58
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 000000000000001c
!	%l3 = 0000000000002a15, Mem[0000000010101400] = 005cb57d
	stwa	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 00002a15
!	Mem[0000000030041400] = 00001700 00000000 1c000000 0000ffff
!	%f0  = 91b7e26d 58ed1647 17f11037 09ffffff
!	%f4  = ffffff09 7a82ed58 b38d7217 ffffff86
!	%f8  = c92f6a6b 182b8f37 0f1d8d56 16ff862d
!	%f12 = 05e36874 58ed827a ffed827a 6287554d
	stda	%f0 ,[%i1+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030041400

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00001e6e 649fe11d, %l4 = 0000001c, %l5 = 0000001c, %asi = 80
	ldda	[%i2+0x000]%asi,%l4	! %l4 = 0000000000001e6e 00000000649fe11d
!	Mem[0000000030001408] = 000000ff, %l1 = 00000000480e3ef1
	ldsba	[%i0+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181410] = 000000086c7eb0cc, %l1 = ffffffffffffffff
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = 000000086c7eb0cc
!	Mem[0000000010181410] = 08000000, %l5 = 00000000649fe11d
	lduha	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101426] = 6b6a2fc9, %l4 = 0000000000001e6e, %asi = 80
	ldsha	[%i4+0x026]%asi,%l4	! %l4 = 0000000000002fc9
!	Mem[0000000030101410] = 44ef839c, %l5 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000044
!	Mem[00000000300c1410] = 3cdde6ff, %l4 = 0000000000002fc9
	lduba	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181408] = beea09ff2ff347c7, %l0 = 20d51e6ec5fe2019
	ldxa	[%i6+%o4]0x81,%l0	! %l0 = beea09ff2ff347c7
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010041408] = ffffff09, %l2 = ffffffff30804f00
	ldsha	[%i1+%o4]0x88,%l2	! %l2 = ffffffffffffff09
!	Mem[00000000211c0000] = b008f930, %l4 = 00000000000000ff, %asi = 80
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000b008

p0_label_45:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000002a15, Mem[0000000010081410] = 4b28f04e
	stba	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 1528f04e
!	%l4 = 0000b008, %l5 = 00000044, Mem[00000000300c1408] = 8067e12e 2d708a27
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000b008 00000044
!	%f27 = 7741c5ff, Mem[0000000030101410] = 44ef839c
	sta	%f27,[%i4+%o5]0x81	! Mem[0000000030101410] = 7741c5ff
!	%f30 = 1c330c92, %f16 = ffffff09, %f26 = 5cdaacc6
	fadds	%f30,%f16,%f26		! %f26 = ffffff09
!	Mem[00000000201c0001] = ffe4fea0, %l6 = ffff00000000001c
	ldstub	[%o0+0x001],%l6		! %l6 = 00000000000000e4
!	%f21 = 177a03bd, Mem[0000000010001410] = f9cf2601
	sta	%f21,[%i0+%o5]0x80	! Mem[0000000010001410] = 177a03bd
!	%l1 = 000000086c7eb0cc, Mem[0000000030001400] = 004f8030
	stba	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = cc4f8030
!	%l6 = 00000000000000e4, Mem[0000000010081410] = 1528f04e00000062
	stxa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000000000e4
!	%l7 = ffffffffffff91b7, Mem[00000000300c1408] = 0000b008
	stba	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = b700b008
!	%l5 = 0000000000000044, Mem[0000000010081408] = 152a0000
	stba	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 442a0000

p0_label_46:
!	Starting 10 instruction Load Burst
!	%l7 = ffffffffffff91b7, %l6 = 00000000000000e4, %l1 = 000000086c7eb0cc
	addc	%l7,%l6,%l1		! %l1 = ffffffffffff929b
!	Mem[0000000030081400] = b57d00e4, %l0 = beea09ff2ff347c7
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 00000000b57d00e4
!	Mem[000000001000141e] = 32d08e33, %l6 = 00000000000000e4
	ldsh	[%i0+0x01e],%l6		! %l6 = ffffffffffff8e33
!	Mem[00000000100c1428] = 34adffb6302e8f2f, %f30 = 1c330c92 7660571b
	ldd	[%i3+0x028],%f30	! %f30 = 34adffb6 302e8f2f
!	%f11 = 16ff862d, Mem[0000000030041408] = 09ffffff
	sta	%f11,[%i1+%o4]0x89	! Mem[0000000030041408] = 16ff862d
!	Mem[0000000010181438] = 7b031c62, %l2 = ffffffffffffff09, %asi = 80
	ldsha	[%i6+0x038]%asi,%l2	! %l2 = 0000000000007b03
!	Mem[0000000010041400] = e4000000480e3ef1, %f20 = 44ef839c 177a03bd, %asi = 80
	ldda	[%i1+0x000]%asi,%f20	! %f20 = e4000000 480e3ef1
!	Mem[0000000010001408] = 1b576076, %l1 = ffffffffffff929b
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000076
!	Mem[0000000010041410] = 91b7e26d, %l6 = ffffffffffff8e33
	lduha	[%i1+%o5]0x80,%l6	! %l6 = 00000000000091b7
!	Mem[0000000010181400] = ff0a75247db55c00, %l5 = 0000000000000044
	ldxa	[%i6+%g0]0x80,%l5	! %l5 = ff0a75247db55c00

p0_label_47:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181418] = 038406657db55c00, %l5 = ff0a75247db55c00, %l5 = ff0a75247db55c00
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = 038406657db55c00
!	%l3 = 0000000000002a15, Mem[0000000030041400] = 58ed1647
	stwa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 00002a15
!	%l7 = ffffffffffff91b7, Mem[0000000030181410] = ffffffffffffffe4
	stxa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffffffff91b7
!	Mem[0000000010001400] = ffffffff, %l0 = 00000000b57d00e4
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000007b03, Mem[0000000010081410] = 00000000
	stba	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 03000000
!	%l6 = 000091b7, %l7 = ffff91b7, Mem[0000000010181430] = d5d05201 94cb9672
	std	%l6,[%i6+0x030]		! Mem[0000000010181430] = 000091b7 ffff91b7
!	Mem[0000000030101410] = 7741c5ff, %l7 = 00000000ffff91b7
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 000000007741c5ff
!	%f31 = 302e8f2f, Mem[0000000030081410] = f13e0e48
	sta	%f31,[%i2+%o5]0x89	! Mem[0000000030081410] = 302e8f2f
!	Mem[0000000030101410] = b791ffff, %l0 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 00000000b791ffff
!	Mem[0000000010101420] = 378f2b18, %l1 = 0000000000000076, %asi = 80
	swapa	[%i4+0x020]%asi,%l1	! %l1 = 00000000378f2b18

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = f13e0e48000000ff, %f14 = ffed827a 6287554d
	ldda	[%i5+%g0]0x88,%f14	! %f14 = f13e0e48 000000ff
!	Mem[00000000300c1410] = dd72ff59 3cdde6ff, %l6 = 000091b7, %l7 = 7741c5ff
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 000000003cdde6ff 00000000dd72ff59
!	Mem[0000000030101410] = 000000ff, %l5 = 038406657db55c00
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141408] = 00000000 00002a15, %l2 = 00007b03, %l3 = 00002a15
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000 0000000000002a15
!	Mem[0000000010141400] = ff000000 480e3ef1 00000000 00002a15
!	Mem[0000000010141410] = 0967e2b4 52d69775 6cdfc56a 0d7cc593
!	Mem[0000000010141420] = 259c1778 6a742ea9 000000ff 71835aef
!	Mem[0000000010141430] = 00000000 397d97e5 141b0542 79ad3f0b
	ldda	[%i5+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010141400
!	Mem[0000000030181408] = ff09eabe, %l0 = 00000000b791ffff
	lduba	[%i6+%o4]0x89,%l0	! %l0 = 00000000000000be
!	Mem[0000000010001408] = beea09ff 1b576076, %l2 = 00000000, %l3 = 00002a15
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 000000001b576076 00000000beea09ff
!	Mem[00000000201c0000] = fffffea0, %l0 = 00000000000000be, %asi = 80
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1408] = 00001037, %l6 = 000000003cdde6ff
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = ff000000ccb07e6c, %f2  = 17f11037 09ffffff
	ldda	[%i0+%o4]0x81,%f2 	! %f2  = ff000000 ccb07e6c

p0_label_49:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141403] = ff000000, %l0 = ffffffffffffffff
	ldstub	[%i5+0x003],%l0		! %l0 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030101400] = ffffff09474f1a66
	stxa	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	Mem[0000000030101408] = 0f1d8d56, %l1 = 00000000378f2b18
	ldstuba	[%i4+%o4]0x81,%l1	! %l1 = 000000000000000f
!	Mem[0000000030001410] = 000000b0, %l0 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000b0
!	Mem[0000000030041400] = 152a0000, %l2 = 000000001b576076
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000015
!	%f3  = ccb07e6c, Mem[0000000030041400] = ff2a0000
	sta	%f3 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ccb07e6c
!	%l6 = 0000000000000000, Mem[0000000010101410] = ffed827a6287554d
	stxa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	%f27 = ff000000, Mem[00000000100c1410] = 00001d0f
	sta	%f27,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff000000
!	%l0 = 000000b0, %l1 = 0000000f, Mem[0000000030101410] = 000000ff bd037a17
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000b0 0000000f
!	Mem[00000000100c1400] = 0000001c, %l3 = 00000000beea09ff, %asi = 80
	swapa	[%i3+0x000]%asi,%l3	! %l3 = 000000000000001c

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001419] = 7002c68a, %l6 = 0000000000000000
	ldsb	[%i0+0x019],%l6		! %l6 = 0000000000000002
!	Mem[0000000010041400] = 000000e4, %l0 = 00000000000000b0
	lduha	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000e4
!	Mem[0000000010081400] = 6e1e0000, %l7 = 00000000dd72ff59
	lduha	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 0000000000000000, %l6 = 0000000000000002
	ldxa	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = b57d00e4, %l7 = 0000000000000000
	ldswa	[%i2+%g0]0x81,%l7	! %l7 = ffffffffb57d00e4
!	Mem[0000000010181408] = 241e287a4ef0284b, %f8  = c92f6a6b 182b8f37, %asi = 80
	ldda	[%i6+0x008]%asi,%f8 	! %f8  = 241e287a 4ef0284b
!	Mem[0000000030181400] = 1d2f6a6b, %l5 = 00000000000000ff
	lduwa	[%i6+%g0]0x81,%l5	! %l5 = 000000001d2f6a6b
!	Mem[0000000010141408] = 00000000, %l1 = 000000000000000f
	lduba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = 2d86ff16, %l3 = 000000000000001c
	lduha	[%i1+%o4]0x81,%l3	! %l3 = 0000000000002d86
!	Mem[0000000030141400] = e1154939 000000e4, %l4 = 0000b008, %l5 = 1d2f6a6b
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000e4 00000000e1154939

p0_label_51:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[00000000300c1410] = 3cdde6ff
	stha	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 3cdd0000
	membar	#Sync			! Added by membar checker (11)
!	%f30 = 0b3fad79 42051b14, Mem[0000000010141408] = 00000000 152a0000
	stda	%f30,[%i5+%o4]0x88	! Mem[0000000010141408] = 0b3fad79 42051b14
!	%l2 = 0000000000000015, Mem[0000000010081410] = e400000000000003
	stxa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000015
!	Mem[0000000010001410] = 177a03bd, %l2 = 0000000000000015
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 00000000177a03bd
!	%l4 = 00000000000000e4, Mem[0000000030181408] = ff09eabe
	stha	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = ff0900e4
!	%f26 = ef5a8371 ff000000, %l3 = 0000000000002d86
!	Mem[0000000010101428] = 2d86ff16568d1d0f
	add	%i4,0x028,%g1
	stda	%f26,[%g1+%l3]ASI_PST16_P ! Mem[0000000010101428] = 2d868371ff001d0f
!	%l2 = 00000000177a03bd, Mem[0000000030041410] = ffffff097a82ed58
	stxa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000177a03bd
!	%f0  = 91b7e26d 58ed1647, %l1 = 0000000000000000
!	Mem[0000000010101410] = 0000000000000000
	add	%i4,0x010,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010101410] = 0000000000000000
!	Mem[0000000030001400] = cc4f8030, %l5 = 00000000e1154939
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000cc
!	%l2 = 00000000177a03bd, Mem[0000000010041400] = e4000000
	stwa	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 177a03bd

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[000000001014142d] = 71835aef, %l3 = 0000000000002d86, %asi = 80
	lduba	[%i5+0x02d]%asi,%l3	! %l3 = 0000000000000083
!	Mem[0000000030141408] = 09ff0000, %l7 = ffffffffb57d00e4
	ldswa	[%i5+%o4]0x89,%l7	! %l7 = 0000000009ff0000
!	Mem[0000000010001410] = 15000000, %l2 = 00000000177a03bd
	lduwa	[%i0+%o5]0x88,%l2	! %l2 = 0000000015000000
!	Mem[0000000030141400] = e4000000, %l4 = 00000000000000e4
	lduwa	[%i5+%g0]0x81,%l4	! %l4 = 00000000e4000000
!	Mem[0000000030081400] = e4007db5, %l0 = 00000000000000e4
	ldswa	[%i2+%g0]0x89,%l0	! %l0 = ffffffffe4007db5
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010001400] = ffffffff 0c83cc11 7660571b ff09eabe
!	Mem[0000000010001410] = 00000015 0000007e 7002c68a 32d08e33
!	Mem[0000000010001420] = 32fad998 39481449 00000014 7f71058f
!	Mem[0000000010001430] = 2a152a04 4781ef85 0742ba62 5e726bab
	ldda	[%i0+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010001400
!	Mem[00000000100c1400] = 2d86ff16ff09eabe, %l0 = ffffffffe4007db5
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = 2d86ff16ff09eabe
!	Mem[00000000211c0001] = b008f930, %l5 = 00000000000000cc
	ldsb	[%o2+0x001],%l5		! %l5 = 0000000000000008
!	%l6 = 0000000000000000, %l0 = 2d86ff16ff09eabe, %l2 = 0000000015000000
	sdivx	%l6,%l0,%l2		! %l2 = 0000000000000000
!	Mem[0000000010081408] = 442a0000, %l6 = 0000000000000000
	lduha	[%i2+%o4]0x80,%l6	! %l6 = 000000000000442a

p0_label_53:
!	Starting 10 instruction Store Burst
!	%l0 = 2d86ff16ff09eabe, Mem[0000000010141400] = ff0000ff
	stha	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = eabe00ff
!	%f4  = 00000015 0000007e, Mem[00000000100c1400] = ff09eabe 2d86ff16
	stda	%f4 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000015 0000007e
!	%l4 = e4000000, %l5 = 00000008, Mem[0000000010041408] = 09ffffff 1e2595c5
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = e4000000 00000008
!	%f12 = 2a152a04 4781ef85, Mem[00000000100c1400] = 0000007e 00000015
	stda	%f12,[%i3+%g0]0x88	! Mem[00000000100c1400] = 2a152a04 4781ef85
!	%l2 = 0000000000000000, imm = fffffffffffffe8a, %l4 = 00000000e4000000
	andn	%l2,-0x176,%l4		! %l4 = 0000000000000000
!	Mem[0000000030141400] = 000000e4, %l0 = 00000000ff09eabe
	swapa	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000e4
!	%l2 = 0000000000000000, Mem[0000000021800180] = 78e5e080
	sth	%l2,[%o3+0x180]		! Mem[0000000021800180] = 0000e080
!	Mem[0000000030001400] = ff4f8030, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 00000000ff4f8030
!	Mem[0000000010001410] = 00000015, %l3 = 0000000000000083
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l5 = 0000000000000008, Mem[0000000010081410] = 1500000000000000
	stx	%l5,[%i2+%o5]		! Mem[0000000010081410] = 0000000000000008

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = eabe00ff, %f26 = ef5a8371
	lda	[%i5+%g0]0x80,%f26	! %f26 = eabe00ff
!	Mem[0000000030001400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = e4007db5, %l7 = 0000000009ff0000
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 0000000000007db5
!	Mem[0000000010181410] = ccb07e6c08000000, %l0 = 00000000000000e4
	ldxa	[%i6+%o5]0x88,%l0	! %l0 = ccb07e6c08000000
!	Mem[0000000030101400] = 00000000, %l0 = ccb07e6c08000000
	lduha	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff ffffff09, %l6 = 0000442a, %l7 = 00007db5
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 00000000000000ff 00000000ffffff09
!	Mem[00000000300c1400] = 807fff5042eeb021, %f22 = 93c57c0d 6ac5df6c
	ldda	[%i3+%g0]0x81,%f22	! %f22 = 807fff50 42eeb021
!	Mem[0000000010181400] = ff0a7524, %l4 = 00000000ff4f8030, %asi = 80
	lduha	[%i6+0x000]%asi,%l4	! %l4 = 000000000000ff0a
!	Mem[0000000010081400] = 6e1e0000, %l5 = 0000000000000008
	lduba	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = beea09ff394915e1, %f22 = 807fff50 42eeb021
	ldda	[%i5+%g0]0x81,%f22	! %f22 = beea09ff 394915e1

p0_label_55:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041428] = 5cdaacc6 7741c5ff, %l0 = 00000000, %l1 = 00000000, %asi = 80
	ldda	[%i1+0x028]%asi,%l0	! %l0 = 000000005cdaacc6 000000007741c5ff
!	%f4  = 00000015 0000007e, %l3 = 0000000000000000
!	Mem[0000000030081418] = 43b067fa5f8c03e3
	add	%i2,0x018,%g1
	stda	%f4,[%g1+%l3]ASI_PST16_S ! Mem[0000000030081418] = 43b067fa5f8c03e3
!	%l0 = 000000005cdaacc6, %l4 = 000000000000ff0a, %l0 = 000000005cdaacc6
	subc	%l0,%l4,%l0		! %l0 = 000000005cd9adbc
!	Mem[0000000010181400] = ff0a7524 7db55c00 241e287a 4ef0284b
!	%f0  = ffffffff 0c83cc11 7660571b ff09eabe
!	%f4  = 00000015 0000007e 7002c68a 32d08e33
!	%f8  = 32fad998 39481449 00000014 7f71058f
!	%f12 = 2a152a04 4781ef85 0742ba62 5e726bab
	stda	%f0 ,[%i6+%g0]ASI_BLK_P	! Block Store to 0000000010181400
!	%l2 = 0000000000000000, Mem[00000000300c1408] = 08b000b7
	stha	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 08b00000
!	Mem[0000000030181410] = ffffffff, %l6 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030181408] = ff0900e4, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000e4
!	Mem[0000000010101424] = 6b6a2fc9, %l6 = 00000000ffffffff
	swap	[%i4+0x024],%l6		! %l6 = 000000006b6a2fc9
!	%l4 = 000000000000ff0a, Mem[0000000030181400] = 378f2b186b6a2f1d
	stxa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000000000ff0a
!	%f22 = beea09ff, Mem[0000000010101410] = 00000000
	sta	%f22,[%i4+%o5]0x88	! Mem[0000000010101410] = beea09ff

p0_label_56:
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, imm = fffffffffffff982, %l3 = 0000000000000000
	orn	%l5,-0x67e,%l3		! %l3 = 000000000000067d
!	Mem[0000000010141428] = 000000ff, %l1 = 000000007741c5ff, %asi = 80
	ldsha	[%i5+0x028]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800041] = ffff7f00, %l1 = 0000000000000000, %asi = 80
	ldsba	[%o1+0x041]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101410] = 0000000f 000000b0, %l0 = 5cd9adbc, %l1 = ffffffff
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000b0 000000000000000f
!	Mem[0000000030081408] = 00000067, %l3 = 000000000000067d
	lduha	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000067
!	Mem[0000000010141408] = 141b0542 79ad3f0b, %l6 = 6b6a2fc9, %l7 = ffffff09
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 00000000141b0542 0000000079ad3f0b
!	Mem[0000000030001408] = ff000000, %l4 = 000000000000ff0a
	ldsha	[%i0+%o4]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030081410] = 1baf0000 302e8f2f, %l4 = ffffff00, %l5 = 00000000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000302e8f2f 000000001baf0000
!	Mem[0000000030001400] = 00000000, %l3 = 0000000000000067
	ldswa	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = ff09eabe, %l0 = 00000000000000b0
	ldsha	[%i5+%g0]0x89,%l0	! %l0 = ffffffffffffeabe

p0_label_57:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 609757
p0_fragment_5:
!	%l0 = ffffffffffffeabe
	setx	0xb3d50d711e12763e,%g7,%l0 ! %l0 = b3d50d711e12763e
!	%l1 = 000000000000000f
	setx	0xdae93f8e0b742ee9,%g7,%l1 ! %l1 = dae93f8e0b742ee9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b3d50d711e12763e
	setx	0x0f46cbac681623a4,%g7,%l0 ! %l0 = 0f46cbac681623a4
!	%l1 = dae93f8e0b742ee9
	setx	0x8d37c23241c0d76f,%g7,%l1 ! %l1 = 8d37c23241c0d76f
p0_fragment_5_end:
!	%l0 = 0f46cbac681623a4, Mem[0000000021800180] = 0000e080
	sth	%l0,[%o3+0x180]		! Mem[0000000021800180] = 23a4e080
!	%l4 = 00000000302e8f2f, Mem[0000000010101400] = 152a0000
	stba	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 152a002f
!	%l4 = 302e8f2f, %l5 = 1baf0000, Mem[00000000100c1408] = 37100000 ff09eabe
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 302e8f2f 1baf0000
!	%f26 = eabe00ff, %f7  = 32d08e33, %f2  = 7660571b
	fdivs	%f26,%f7 ,%f2 		! %f2  = f7693a65
!	%l2 = 00000000000000e4, Mem[0000000030081408] = 00000067
	stha	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000e4
!	%l6 = 00000000141b0542, Mem[0000000010101408] = 807fff503710f117, %asi = 80
	stxa	%l6,[%i4+0x008]%asi	! Mem[0000000010101408] = 00000000141b0542
!	Mem[0000000030001400] = 00000000, %l0 = 00000000681623a4
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030081400] = b57d00e4
	stha	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000e4
!	%l4 = 00000000302e8f2f, Mem[0000000010141410] = b4e26709
	stwa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 302e8f2f

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = 6b6aef60, %l0 = 0000000000000000
	lduh	[%o3+%g0],%l0		! %l0 = 0000000000006b6a
!	Mem[00000000211c0001] = b008f930, %l2 = 00000000000000e4, %asi = 80
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = 0000000000000008
!	Mem[0000000010101410] = ff09eabe 00000000, %l0 = 00006b6a, %l1 = 41c0d76f
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 00000000ff09eabe 0000000000000000
!	Mem[0000000030101400] = 00000000 00000000, %l6 = 141b0542, %l7 = 79ad3f0b
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030081400] = 000000e4, %l4 = 00000000302e8f2f
	ldswa	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000e4
!	Mem[0000000010041400] = f13e0e48bd037a17, %f16 = f13e0e48 000000ff
	ldda	[%i1+%g0]0x88,%f16	! %f16 = f13e0e48 bd037a17
!	%f26 = eabe00ff, %f20 = 7597d652
	fcmps	%fcc0,%f26,%f20		! %fcc0 = 1
!	Mem[0000000030101408] = 568d1dff, %l5 = 000000001baf0000
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l4 = 00000000000000e4, %l0 = 00000000ff09eabe, %l4 = 00000000000000e4
	or	%l4,%l0,%l4		! %l4 = 00000000ff09eafe
!	Mem[0000000030181410] = ff000000, %l5 = 00000000000000ff
	ldsba	[%i6+%o5]0x81,%l5	! %l5 = ffffffffffffffff

p0_label_59:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081428] = 08b0ff5042eeb021, %l3 = 0000000000000000, %l7 = 0000000000000000
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = 08b0ff5042eeb021
!	%l2 = 0000000000000008, Mem[0000000020800040] = ffff7f00
	sth	%l2,[%o1+0x040]		! Mem[0000000020800040] = 00087f00
!	%f26 = eabe00ff ff000000, %l4 = 00000000ff09eafe
!	Mem[0000000030081410] = 2f8f2e300000af1b
	add	%i2,0x010,%g1
	stda	%f26,[%g1+%l4]ASI_PST32_S ! Mem[0000000030081410] = eabe00ff0000af1b
!	%l2 = 0000000000000008, Mem[0000000030001408] = 000000ff
	stwa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000008
	membar	#Sync			! Added by membar checker (13)
!	%f0  = ffffffff 0c83cc11, %l2 = 0000000000000008
!	Mem[0000000010001400] = ffffffff0c83cc11
	stda	%f0,[%i0+%l2]ASI_PST16_PL ! Mem[0000000010001400] = ffffffff0c83ffff
!	Mem[0000000010181438] = 0742ba625e726bab, %l2 = 0000000000000008, %l3 = 0000000000000000
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 0742ba625e726bab
!	%l2 = 00000008, %l3 = 5e726bab, Mem[0000000030181408] = ff0900ff c747f32f
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000008 5e726bab
!	%l3 = 0742ba625e726bab, Mem[0000000010081408] = 00002a44
	stwa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 5e726bab
!	Mem[0000000020800001] = 6e7f80d0, %l5 = ffffffffffffffff
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 000000000000007f
!	%l0 = 00000000ff09eabe, Mem[0000000010001408] = 7660571bff09eabe
	stxa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000ff09eabe

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141411] = 2f8f2e30, %l3 = 0742ba625e726bab, %asi = 80
	lduba	[%i5+0x011]%asi,%l3	! %l3 = 000000000000008f
!	Mem[0000000030041410] = bd037a17, %l5 = 000000000000007f
	ldsha	[%i1+%o5]0x81,%l5	! %l5 = ffffffffffffbd03
!	Mem[0000000030041410] = bd037a17, %f7  = 32d08e33
	lda	[%i1+%o5]0x81,%f7 	! %f7 = bd037a17
!	Mem[0000000010141400] = eabe00ff 480e3ef1, %l2 = 00000008, %l3 = 0000008f, %asi = 80
	ldda	[%i5+0x000]%asi,%l2	! %l2 = 00000000eabe00ff 00000000480e3ef1
!	Mem[0000000010141400] = eabe00ff 480e3ef1 141b0542 79ad3f0b
!	Mem[0000000010141410] = 2f8f2e30 52d69775 6cdfc56a 0d7cc593
!	Mem[0000000010141420] = 259c1778 6a742ea9 000000ff 71835aef
!	Mem[0000000010141430] = 00000000 397d97e5 141b0542 79ad3f0b
	ldda	[%i5+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010141400
!	Code Fragment 4, seed = 431370
p0_fragment_6:
!	%l0 = 00000000ff09eabe
	setx	0x488a5ffeda57f9d6,%g7,%l0 ! %l0 = 488a5ffeda57f9d6
!	%l1 = 0000000000000000
	setx	0x79fb6c98a5bc3f01,%g7,%l1 ! %l1 = 79fb6c98a5bc3f01
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 488a5ffeda57f9d6
	setx	0x8f0e32779d35183c,%g7,%l0 ! %l0 = 8f0e32779d35183c
!	%l1 = 79fb6c98a5bc3f01
	setx	0x2382b7150f3b8887,%g7,%l1 ! %l1 = 2382b7150f3b8887
p0_fragment_6_end:
!	Mem[00000000100c1400] = 85ef8147, %l5 = ffffffffffffbd03
	ldsw	[%i3+%g0],%l5		! %l5 = ffffffff85ef8147
!	Mem[0000000010101400] = 2f002a15 6de2b791, %l0 = 9d35183c, %l1 = 0f3b8887
	ldda	[%i4+%g0]0x80,%l0	! %l0 = 000000002f002a15 000000006de2b791
!	Mem[0000000030041400] = 6c7eb0cc, %l0 = 000000002f002a15
	lduha	[%i1+%g0]0x89,%l0	! %l0 = 000000000000b0cc
!	Mem[0000000030081400] = e4000000, %l5 = ffffffff85ef8147
	ldsha	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_61:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000eabe00ff, Mem[0000000010081410] = 00000000
	stha	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	%f0  = ffffffff, Mem[0000000010081430] = 504ccde0
	st	%f0 ,[%i2+0x030]	! Mem[0000000010081430] = ffffffff
!	%f6  = 7002c68a bd037a17, Mem[0000000010041408] = 000000e4 08000000
	stda	%f6 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 7002c68a bd037a17
!	%l7 = 08b0ff5042eeb021, Mem[00000000211c0001] = b008f930
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = b021f930
!	Mem[0000000030001408] = 08000000, %l2 = 00000000eabe00ff
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 0000000008000000
!	Mem[0000000010041408] = 177a03bd, %l0 = 000000000000b0cc
	swapa	[%i1+%o4]0x80,%l0	! %l0 = 00000000177a03bd
!	Mem[0000000010141424] = 6a742ea9, %l5 = 00000000, %l2 = 08000000
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 000000006a742ea9
!	Mem[00000000300c1410] = 3cdd0000, %l0 = 00000000177a03bd
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 000000003cdd0000
!	%l7 = 08b0ff5042eeb021, imm = fffffffffffff93a, %l4 = 00000000ff09eafe
	sub	%l7,-0x6c6,%l4		! %l4 = 08b0ff5042eeb6e7
!	%l4 = 08b0ff5042eeb6e7, Mem[0000000030041410] = 177a03bd
	stba	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 177a03e7

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 16ff862d, %f2  = f7693a65
	lda	[%i1+%o4]0x89,%f2 	! %f2 = 16ff862d
!	Mem[0000000010001400] = ffffffff0c83ffff, %l1 = 000000006de2b791
	ldx	[%i0+%g0],%l1		! %l1 = ffffffff0c83ffff
!	%l3 = 00000000480e3ef1, imm = fffffffffffff35b, %l2 = 000000006a742ea9
	andn	%l3,-0xca5,%l2		! %l2 = 0000000000000ca0
!	Mem[0000000010101408] = 00000000, %l1 = ffffffff0c83ffff
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = 2f8f2e30, %l0 = 000000003cdd0000
	lduha	[%i5+%o5]0x80,%l0	! %l0 = 0000000000002f8f
!	%l4 = 08b0ff5042eeb6e7, immd = fffffb6f, %y  = 0000ff09
	sdiv	%l4,-0x491,%l6		! %l6 = ffffffff80000000
	mov	%l0,%y			! %y = 00002f8f
!	Mem[0000000010081400] = 00001e6e, %l6 = ffffffff80000000
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 0000ed586de2b791, %f14 = 0742ba62 5e726bab
	ldda	[%i1+%o5]0x88,%f14	! %f14 = 0000ed58 6de2b791
!	Mem[00000000201c0000] = fffffea0, %l2 = 0000000000000ca0, %asi = 80
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1408] = 1baf0000302e8f2f, %l5 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l5	! %l5 = 1baf0000302e8f2f

p0_label_63:
!	Starting 10 instruction Store Burst
!	%l5 = 1baf0000302e8f2f, Mem[00000000218000c1] = 4bffb9f0
	stb	%l5,[%o3+0x0c1]		! Mem[00000000218000c0] = 4b2fb9f0
!	%l0 = 0000000000002f8f, Mem[0000000010001408] = 00000000ff09eabe, %asi = 80
	stxa	%l0,[%i0+0x008]%asi	! Mem[0000000010001408] = 0000000000002f8f
	membar	#Sync			! Added by membar checker (14)
!	%f6  = 7002c68a bd037a17, Mem[0000000010141408] = 141b0542 79ad3f0b, %asi = 80
	stda	%f6 ,[%i5+0x008]%asi	! Mem[0000000010141408] = 7002c68a bd037a17
!	%f30 = 0b3fad79, Mem[0000000010041410] = 91b7e26d
	sta	%f30,[%i1+%o5]0x80	! Mem[0000000010041410] = 0b3fad79
!	%l0 = 00002f8f, %l1 = 00000000, Mem[0000000010101410] = beea09ff 00000000
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00002f8f 00000000
!	Mem[0000000030101410] = 000000b0, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000b0
!	%l4 = 08b0ff5042eeb6e7, Mem[0000000030101400] = 00000000
	stwa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 42eeb6e7
!	Mem[0000000020800040] = 00087f00, %l0 = 0000000000002f8f
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 0000000000000000
!	%l6 = 000000b0, %l7 = 42eeb021, Mem[00000000100c1410] = ff000000 09ffffff
	stda	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000b0 42eeb021
!	%l0 = 0000000000000000, %l6 = 00000000000000b0, %l3 = 00000000480e3ef1
	addc	%l0,%l6,%l3		! %l3 = 00000000000000b0

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 00007f80, %l5 = 1baf0000302e8f2f
	ldsw	[%i2+0x020],%l5		! %l5 = 0000000000007f80
!	Mem[0000000030081400] = 000000e4, %l2 = ffffffffffffffff
	ldswa	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000e4
!	Mem[00000000100c1400] = 85ef8147, %l5 = 0000000000007f80
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000085
!	Mem[0000000010141410] = 2f8f2e3052d69775, %f2  = 16ff862d ff09eabe
	ldda	[%i5+%o5]0x80,%f2 	! %f2  = 2f8f2e30 52d69775
!	Mem[0000000030141408] = 09ff0000, %l5 = 0000000000000085
	ldswa	[%i5+%o4]0x89,%l5	! %l5 = 0000000009ff0000
!	Mem[0000000030081400] = 4ea07570 e4000000, %l6 = 000000b0, %l7 = 42eeb021
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 00000000e4000000 000000004ea07570
!	Mem[0000000010141408] = 177a03bd 8ac60270, %l6 = e4000000, %l7 = 4ea07570
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 000000008ac60270 00000000177a03bd
!	Mem[000000001004142c] = 7741c5ff, %l4 = 08b0ff5042eeb6e7, %asi = 80
	ldsha	[%i1+0x02c]%asi,%l4	! %l4 = 0000000000007741
!	Mem[0000000030001408] = 6c7eb0cc ff00beea, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000ff00beea 000000006c7eb0cc
!	Mem[0000000010181414] = 0000007e, %l5 = 0000000009ff0000
	ldsw	[%i6+0x014],%l5		! %l5 = 000000000000007e

p0_label_65:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000007e, Mem[0000000010101400] = 2f002a15
	stwa	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000007e
!	%f26 = ef5a8371 ff000000, Mem[0000000010001400] = ffffffff 0c83ffff
	stda	%f26,[%i0+%g0]0x80	! Mem[0000000010001400] = ef5a8371 ff000000
!	%f30 = 0b3fad79, %f10 = 00000014, %f8  = 32fad998
	fdivs	%f30,%f10,%f8 		! tt=0x22, %l0 = 00000000ff00bf0c
!	%l2 = 00000000000000e4, Mem[0000000010101436] = 7468e305
	sth	%l2,[%i4+0x036]		! Mem[0000000010101434] = 746800e4
!	Mem[0000000010081408] = 5e726bab, %l6 = 000000008ac60270
	swapa	[%i2+%o4]0x88,%l6	! %l6 = 000000005e726bab
!	%l6 = 000000005e726bab, Mem[00000000218000c0] = 4b2fb9f0
	sth	%l6,[%o3+0x0c0]		! Mem[00000000218000c0] = 6babb9f0
!	Mem[0000000010081408] = 7002c68a, %l3 = 00000000000000b0
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000070
!	%l6 = 000000005e726bab, Mem[00000000100c1400] = 4781ef85
	stba	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 4781efab
!	%l5 = 000000000000007e, %l5 = 000000000000007e, %y  = 00002f8f
	udiv	%l5,%l5,%l6		! %l6 = 00000000ffffffff
	mov	%l0,%y			! %y = ff00bf0c
!	%f21 = 302e8f2f, Mem[0000000010101420] = 00000076
	st	%f21,[%i4+0x020]	! Mem[0000000010101420] = 302e8f2f

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 21b0ee4200000000, %f8  = 32fad998 39481449
	ldda	[%i0+%o5]0x89,%f8 	! %f8  = 21b0ee42 00000000
!	%f3  = 52d69775, %f16 = f13e0e48
	fcmps	%fcc3,%f3 ,%f16		! %fcc3 = 2
!	Mem[0000000010101408] = 42051b14000000ff, %f6  = 7002c68a bd037a17
	ldda	[%i4+%o4]0x88,%f6 	! %f6  = 42051b14 000000ff
!	Mem[0000000030101400] = 42eeb6e700000000, %l6 = 00000000ffffffff
	ldxa	[%i4+%g0]0x81,%l6	! %l6 = 42eeb6e700000000
!	Mem[0000000030141400] = ff09eabe, %l0 = 00000000ff00bf0c
	ldsha	[%i5+%g0]0x89,%l0	! %l0 = ffffffffffffeabe
!	Mem[00000000100c1404] = 042a152a, %l1 = 000000006c7eb0cc, %asi = 80
	ldswa	[%i3+0x004]%asi,%l1	! %l1 = 00000000042a152a
!	Mem[0000000030001400] = a4231668, %l3 = 0000000000000070
	lduha	[%i0+%g0]0x81,%l3	! %l3 = 000000000000a423
!	Mem[0000000010041400] = bd037a17, %l7 = 00000000177a03bd
	lduba	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000017
!	Mem[00000000211c0000] = b021f930, %l0 = ffffffffffffeabe
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000b021
!	%f14 = 0000ed58, %f9  = 00000000
	fcmpes	%fcc0,%f14,%f9 		! %fcc0 = 2

p0_label_67:
!	Starting 10 instruction Store Burst
!	%f14 = 0000ed58 6de2b791, %l1 = 00000000042a152a
!	Mem[0000000010101410] = 8f2f000000000000
	add	%i4,0x010,%g1
	stda	%f14,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010101410] = 8f2fe26d00000000
!	Mem[0000000020800041] = ff087f00, %l7 = 0000000000000017
	ldstub	[%o1+0x041],%l7		! %l7 = 0000000000000008
!	%l4 = 0000000000007741, Mem[0000000010101408] = ff000000
	stba	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 41000000
!	%f4  = 00000015 0000007e, %l0 = 000000000000b021
!	Mem[0000000030141438] = 12ca99f25531d2fb
	add	%i5,0x038,%g1
	stda	%f4,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030141438] = 7eca99f25500d2fb
!	%f4  = 00000015, Mem[0000000010101414] = 00000000
	sta	%f4 ,[%i4+0x014]%asi	! Mem[0000000010101414] = 00000015
!	Mem[0000000010141400] = eabe00ff, %l7 = 0000000000000008
	swapa	[%i5+%g0]0x80,%l7	! %l7 = 00000000eabe00ff
!	%f28 = e5977d39, Mem[00000000100c1410] = b0000000
	sta	%f28,[%i3+%o5]0x80	! Mem[00000000100c1410] = e5977d39
!	%l6 = 42eeb6e700000000, Mem[0000000010081400] = 6e1e0000
	stba	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 6e1e0000
!	Mem[0000000030001400] = 681623a4, %l0 = 000000000000b021
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 00000000681623a4
!	Mem[0000000030001408] = eabe00ff, %l1 = 00000000042a152a
	ldstuba	[%i0+%o4]0x81,%l1	! %l1 = 00000000000000ea

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 08000000, %l1 = 00000000000000ea
	ldsba	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000008
!	Mem[0000000030041400] = ccb07e6c, %l6 = 42eeb6e700000000
	ldsba	[%i1+%g0]0x81,%l6	! %l6 = ffffffffffffffcc
!	Mem[0000000010141410] = 302e8f2f, %l1 = 0000000000000008
	ldsba	[%i5+%o5]0x88,%l1	! %l1 = 000000000000002f
!	Mem[0000000030001408] = ffbe00ff, %f4  = 00000015
	lda	[%i0+%o4]0x81,%f4 	! %f4 = ffbe00ff
!	Mem[00000000100c1410] = 397d97e5, %l2 = 00000000000000e4
	ldswa	[%i3+%o5]0x88,%l2	! %l2 = 00000000397d97e5
!	%l5 = 000000000000007e, imm = 0000000000000c1f, %l7 = 00000000eabe00ff
	addc	%l5,0xc1f,%l7		! %l7 = 0000000000000c9d
!	Mem[0000000010041400] = 177a03bd 480e3ef1, %l4 = 00007741, %l5 = 0000007e
	ldd	[%i1+%g0],%l4		! %l4 = 00000000177a03bd 00000000480e3ef1
!	%f16 = f13e0e48, %f29 = 00000000, %f9  = 00000000
	fadds	%f16,%f29,%f9 		! %f9  = f13e0e48
!	Mem[0000000030001400] = 21b00000, %f3  = 52d69775
	lda	[%i0+%g0]0x81,%f3 	! %f3 = 21b00000
!	%l6 = ffffffffffffffcc, imm = fffffffffffffd89, %l2 = 00000000397d97e5
	addc	%l6,-0x277,%l2		! %l2 = fffffffffffffd55

p0_label_69:
!	Starting 10 instruction Store Burst
!	%f29 = 00000000, Mem[0000000010081400] = 6e1e0000
	sta	%f29,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l4 = 00000000177a03bd, Mem[0000000010041400] = 177a03bd
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = bd7a03bd
!	Mem[00000000100c1410] = 397d97e5, %l2 = fffffffffffffd55
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000e5
!	%l4 = 177a03bd, %l5 = 480e3ef1, Mem[0000000010041400] = bd7a03bd 480e3ef1
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 177a03bd 480e3ef1
!	%f10 = 00000014 7f71058f, Mem[0000000030101400] = 42eeb6e7 00000000
	stda	%f10,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000014 7f71058f
!	%f24 = a92e746a 78179c25, %l7 = 0000000000000c9d
!	Mem[0000000010141430] = 00000000397d97e5
	add	%i5,0x030,%g1
	stda	%f24,[%g1+%l7]ASI_PST32_P ! Mem[0000000010141430] = 0000000078179c25
!	%l2 = 000000e5, %l3 = 0000a423, Mem[0000000030181408] = 00000008 5e726bab
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000e5 0000a423
!	%l6 = ffffffffffffffcc, Mem[0000000010141418] = 6cdfc56a0d7cc593, %asi = 80
	stxa	%l6,[%i5+0x018]%asi	! Mem[0000000010141418] = ffffffffffffffcc
!	%l0 = 00000000681623a4, immd = fffffc16, %y  = ff00bf0c
	umul	%l0,-0x3ea,%l4		! %l4 = 6816220c99588018, %y = 6816220c
!	%f16 = f13e0e48 ff00beea, Mem[0000000010181408] = 7660571b ff09eabe
	stda	%f16,[%i6+%o4]0x80	! Mem[0000000010181408] = f13e0e48 ff00beea

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ccb07e6c, %l2 = 00000000000000e5
	ldsba	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffffcc
!	Mem[0000000020800040] = ffff7f00, %l2 = ffffffffffffffcc
	ldsb	[%o1+0x040],%l2		! %l2 = ffffffffffffffff
!	Mem[00000000211c0001] = b021f930, %l4 = 6816220c99588018, %asi = 80
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 0000000000000021
!	Mem[0000000030181400] = 000000000000ff0a, %l5 = 00000000480e3ef1
	ldxa	[%i6+%g0]0x89,%l5	! %l5 = 000000000000ff0a
!	Mem[0000000010101428] = 2d868371, %l1 = 000000000000002f, %asi = 80
	ldsha	[%i4+0x028]%asi,%l1	! %l1 = 0000000000002d86
!	Mem[00000000100c1408] = 2f8f2e30, %f13 = 4781ef85
	ld	[%i3+%o4],%f13		! %f13 = 2f8f2e30
!	Mem[0000000010081408] = 000000008ac602ff, %l7 = 0000000000000c9d
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = 000000008ac602ff
!	Mem[000000001014141a] = ffffffff, %l2 = ffffffffffffffff
	lduh	[%i5+0x01a],%l2		! %l2 = 000000000000ffff
!	Mem[0000000010041408] = ccb00000, %l1 = 0000000000002d86
	lduwa	[%i1+%o4]0x88,%l1	! %l1 = 00000000ccb00000
!	Mem[0000000010141426] = 6a742ea9, %l3 = 000000000000a423, %asi = 80
	lduha	[%i5+0x026]%asi,%l3	! %l3 = 0000000000002ea9

p0_label_71:
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000ffff, Mem[0000000010181400] = ffffffff
	stwa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000ffff
!	%f9  = f13e0e48, Mem[00000000300c1400] = 50ff7f80
	sta	%f9 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = f13e0e48
!	%f12 = 2a152a04, %f16 = f13e0e48
	fcmps	%fcc0,%f12,%f16		! %fcc0 = 2
!	%l0 = 00000000681623a4, Mem[0000000020800040] = ffff7f00
	sth	%l0,[%o1+0x040]		! Mem[0000000020800040] = 23a47f00
!	%l5 = 000000000000ff0a, Mem[0000000010001400] = 71835aef
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 71835a0a
!	%l3 = 0000000000002ea9, Mem[0000000030081410] = eabe00ff
	stwa	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00002ea9
!	Mem[0000000010181418] = 7002c68a, %l7 = 000000008ac602ff
	swap	[%i6+0x018],%l7		! %l7 = 000000007002c68a
!	Mem[0000000010041411] = 0b3fad79, %l5 = 000000000000ff0a
	ldstub	[%i1+0x011],%l5		! %l5 = 000000000000003f
!	%l4 = 0000000000000021, Mem[0000000010041400] = bd037a17
	stwa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000021
!	%f18 = 0b3fad79 42051b14, Mem[00000000100c1400] = 4781efab 2a152a04
	stda	%f18,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0b3fad79 42051b14

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = bd037a17, %l6 = ffffffffffffffcc
	ldswa	[%i3+%o5]0x81,%l6	! %l6 = ffffffffbd037a17
!	Mem[0000000030081410] = 1baf0000 a92e0000, %l6 = bd037a17, %l7 = 7002c68a
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 00000000a92e0000 000000001baf0000
!	Mem[0000000030041408] = 2d86ff16, %l0 = 00000000681623a4
	lduwa	[%i1+%o4]0x81,%l0	! %l0 = 000000002d86ff16
!	Mem[0000000010081400] = 00000000, %f2  = 2f8f2e30
	lda	[%i2+%g0]0x88,%f2 	! %f2 = 00000000
!	Mem[000000001008141d] = 6a59670e, %l5 = 000000000000003f, %asi = 80
	lduba	[%i2+0x01d]%asi,%l5	! %l5 = 0000000000000059
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010041400] = 21000000 480e3ef1 0000b0cc 8ac60270
!	Mem[0000000010041410] = 0bffad79 58ed0000 08f47fea 08bdfedb
!	Mem[0000000010041420] = 6f7805f8 29d95329 5cdaacc6 7741c5ff
!	Mem[0000000010041430] = 15868464 5bc1e465 1c744fc2 7d90cf8b
	ldda	[%i1+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010041400
!	Mem[0000000010041410] = 0bffad79, %l2 = 000000000000ffff
	lduwa	[%i1+%o5]0x80,%l2	! %l2 = 000000000bffad79
!	Mem[0000000010041400] = 21000000, %l6 = 00000000a92e0000
	lduba	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000021
!	Mem[0000000030001400] = 21b00000ffffffff, %f16 = f13e0e48 ff00beea
	ldda	[%i0+%g0]0x81,%f16	! %f16 = 21b00000 ffffffff
!	%f18 = 0b3fad79 42051b14, %f23 = 6ac5df6c
	fdtoi	%f18,%f23		! %f23 = 00000000

p0_label_73:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (16)
!	%l4 = 0000000000000021, Mem[0000000010041410] = 0bffad79
	stba	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 21ffad79
!	Mem[00000000100c1418] = 00000000000000ff, %l6 = 0000000000000021, %l5 = 0000000000000059
	add	%i3,0x18,%g1
	casxa	[%g1]0x80,%l6,%l5	! %l5 = 00000000000000ff
!	%l2 = 000000000bffad79, Mem[0000000010001400] = 71835a0a
	stha	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 7183ad79
!	%l6 = 00000021, %l7 = 1baf0000, Mem[00000000100c1400] = 141b0542 79ad3f0b
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000021 1baf0000
!	%f23 = 00000000, %f16 = 21b00000, %f26 = ef5a8371
	fdivs	%f23,%f16,%f26		! %f26 = 00000000
!	%l4 = 0000000000000021, Mem[0000000010181400] = 11cc830cffff0000
	stxa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000021
!	%l6 = 0000000000000021, Mem[0000000010141410] = 2f8f2e30
	stwa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000021
!	%l1 = 00000000ccb00000, %l3 = 0000000000002ea9, %l4  = 0000000000000021
	mulx	%l1,%l3,%l4		! %l4 = 0000254ec0300000
!	Mem[0000000010101400] = 0000007e 6de2b791 41000000 141b0542
!	%f16 = 21b00000 ffffffff 0b3fad79 42051b14
!	%f20 = 7597d652 302e8f2f 93c57c0d 00000000
!	%f24 = a92e746a 78179c25 00000000 ff000000
!	%f28 = e5977d39 00000000 0b3fad79 42051b14
	stda	%f16,[%i4+%g0]ASI_COMMIT_P	! Block Store to 0000000010101400
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010101400] = 21b00000, %l1 = 00000000ccb00000
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 0000000021b00000

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[000000001010143c] = 42051b14, %l1 = 0000000021b00000, %asi = 80
	ldsha	[%i4+0x03c]%asi,%l1	! %l1 = 0000000000004205
!	Mem[00000000100c1432] = 48aa0924, %l3 = 0000000000002ea9, %asi = 80
	lduha	[%i3+0x032]%asi,%l3	! %l3 = 0000000000000924
!	Mem[0000000030101400] = 8f05717f14000000, %f0  = f13e0e48 00000021
	ldda	[%i4+%g0]0x89,%f0 	! %f0  = 8f05717f 14000000
!	Mem[0000000010101420] = a92e746a 78179c25, %l4 = c0300000, %l5 = 000000ff, %asi = 80
	ldda	[%i4+0x020]%asi,%l4	! %l4 = 00000000a92e746a 0000000078179c25
!	Mem[0000000030041410] = e7037a17, %l2 = 000000000bffad79
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = ffffffffffffffe7
!	Mem[0000000021800101] = 0094a020, %l4 = 00000000a92e746a
	ldub	[%o3+0x101],%l4		! %l4 = 0000000000000094
!	Mem[00000000300c1410] = 177a03bd, %f16 = 21b00000
	lda	[%i3+%o5]0x89,%f16	! %f16 = 177a03bd
!	Mem[00000000211c0000] = b021f930, %l2 = ffffffffffffffe7, %asi = 80
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffb021
!	Mem[0000000010101408] = 79ad3f0b, %l4 = 0000000000000094
	ldswa	[%i4+%o4]0x88,%l4	! %l4 = 0000000079ad3f0b
!	Mem[00000000100c1400] = 00000021, %l1 = 0000000000004205
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_75:
!	Starting 10 instruction Store Burst
!	%l0 = 000000002d86ff16, Mem[0000000010181400] = 00000021
	stwa	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 2d86ff16
!	%l2 = ffffffffffffb021, Mem[0000000010141400] = 00000008
	stba	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 21000008
!	%l5 = 0000000078179c25, Mem[0000000020800000] = 6eff80d0, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 9c2580d0
!	Mem[000000001008140c] = 00000000, %l7 = 000000001baf0000
	swap	[%i2+0x00c],%l7		! %l7 = 0000000000000000
!	%l6 = 0000000000000021, Mem[000000001014142c] = 71835aef
	stw	%l6,[%i5+0x02c]		! Mem[000000001014142c] = 00000021
!	%f18 = 0b3fad79 42051b14, %l2 = ffffffffffffb021
!	Mem[0000000010041410] = 21ffad7958ed0000
	add	%i1,0x010,%g1
	stda	%f18,[%g1+%l2]ASI_PST32_P ! Mem[0000000010041410] = 21ffad7942051b14
!	Mem[00000000201c0000] = fffffea0, %l5 = 0000000078179c25
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	%l4 = 0000000079ad3f0b, Mem[00000000300c1410] = bd037a1759ff72dd
	stxa	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000079ad3f0b
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 0b3fad7900000000
	stxa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	%f14 = 8bcf907d, Mem[0000000010101430] = e5977d39
	st	%f14,[%i4+0x030]	! Mem[0000000010101430] = 8bcf907d

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff000000, %f31 = 42051b14
	lda	[%i4+%o5]0x81,%f31	! %f31 = ff000000
!	Mem[0000000010041410] = 21ffad79, %l6 = 0000000000000021
	lduba	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000021
!	Mem[0000000030041408] = 17f1103716ff862d, %l4 = 0000000079ad3f0b
	ldxa	[%i1+%o4]0x89,%l4	! %l4 = 17f1103716ff862d
!	Mem[0000000010101420] = a92e746a78179c25, %f14 = 8bcf907d c24f741c
	ldd	[%i4+0x020],%f14	! %f14 = a92e746a 78179c25
!	%l4 = 17f1103716ff862d, Mem[0000000030101400] = 00000014
	stba	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 2d000014
!	Mem[0000000030181410] = ff000000ffff91b7, %f30 = 0b3fad79 ff000000
	ldda	[%i6+%o5]0x81,%f30	! %f30 = ff000000 ffff91b7
!	Mem[0000000010101400] = ccb00000ffffffff, %f2  = 7002c68a ccb00000
	ldda	[%i4+%g0]0x80,%f2 	! %f2  = ccb00000 ffffffff
!	Mem[0000000010001408] = 00000000, %l4 = 17f1103716ff862d
	lduba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 0000b008, %l5 = 00000000000000ff
	lduwa	[%i3+%o4]0x81,%l5	! %l5 = 000000000000b008
!	Mem[0000000030181400] = 0aff000000000000, %f8  = 2953d929 f805786f
	ldda	[%i6+%g0]0x81,%f8 	! %f8  = 0aff0000 00000000

p0_label_77:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = f13e0e48, %l0 = 000000002d86ff16
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 00000000000000f1
!	%l7 = 0000000000000000, Mem[0000000010181408] = eabe00ff480e3eff
	stxa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000000000000
!	%l6 = 0000000000000021, Mem[0000000010181410] = 00000015
	stba	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 21000015
!	%l4 = 00000000, %l5 = 0000b008, Mem[0000000030001400] = 0000b021 ffffffff
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 0000b008
!	Mem[0000000010001438] = 0742ba625e726bab, %l1 = 0000000000000000, %l4 = 0000000000000000
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = 0742ba625e726bab
!	Mem[0000000010181400] = 16ff862d, %l2 = ffffffffffffb021
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000016
!	%f5  = 79adff0b, %f27 = ff000000
	fsqrts	%f5 ,%f27		! %f27 = 5c953c89
!	%l6 = 00000021, %l7 = 00000000, Mem[0000000030041400] = ccb07e6c 6de2b791
	stda	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000021 00000000
!	%f2  = ccb00000, Mem[0000000010081424] = 30f5ba35
	st	%f2 ,[%i2+0x024]	! Mem[0000000010081424] = ccb00000
!	%l2 = 00000016, %l3 = 00000924, Mem[0000000030001410] = 00000000 42eeb021
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000016 00000924

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = beea09ff 394915e1 0000ff09 ffb0ff50
!	Mem[0000000030141410] = 001cffff ff6f9dce 2bd92c1a 58d8a383
!	Mem[0000000030141420] = 677d07a8 7b958019 11de9c26 5ca8dbdf
!	Mem[0000000030141430] = 58bb7514 04ace455 7eca99f2 5500d2fb
	ldda	[%i5+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000030181400] = 0aff0000 00000000 e5000000 23a40000
!	Mem[0000000030181410] = ff000000 ffff91b7 103a4d7a 0d40e363
!	Mem[0000000030181420] = 0c0adc08 456bc6f9 3d31fb86 5ebba1bf
!	Mem[0000000030181430] = 4afdf774 23a06135 060c9752 08bdfedb
	ldda	[%i6+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030181400
!	Mem[0000000010001400] = 79ad8371, %l6 = 0000000000000021, %asi = 80
	ldsha	[%i0+0x000]%asi,%l6	! %l6 = 00000000000079ad
!	Mem[0000000020800000] = 9c2580d0, %l7 = 0000000000000000, %asi = 80
	lduha	[%o1+0x000]%asi,%l7	! %l7 = 0000000000009c25
!	%l4 = 0742ba625e726bab, %l6 = 00000000000079ad, %l7 = 0000000000009c25
	add	%l4,%l6,%l7		! %l7 = 0742ba625e72e558
!	Mem[0000000030081400] = 000000e4, %l3 = 0000000000000924
	ldswa	[%i2+%g0]0x81,%l3	! %l3 = 00000000000000e4
!	%l6 = 00000000000079ad, immd = fffff30e, %y  = 6816220c
	smul	%l6,-0xcf2,%l5		! %l5 = fffffffff9d8de76, %y = ffffffff
!	Mem[0000000010041424] = 29d95329, %l4 = 0742ba625e726bab, %asi = 80
	lduwa	[%i1+0x024]%asi,%l4	! %l4 = 0000000029d95329
!	Mem[0000000010041420] = 6f7805f8, %l3 = 00000000000000e4
	ldsh	[%i1+0x020],%l3		! %l3 = 0000000000006f78
!	Mem[0000000030181408] = 000000e5, %l1 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000e5

p0_label_79:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 79adff21, %l4 = 0000000029d95329
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 0000000079adff21
!	Mem[0000000010001400] = 79ad8371, %l1 = 00000000000000e5
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 0000000079ad8371
!	%l5 = fffffffff9d8de76, Mem[0000000010181408] = 0000000000000000
	stx	%l5,[%i6+%o4]		! Mem[0000000010181408] = fffffffff9d8de76
!	%l1 = 0000000079ad8371, immd = fffffffffffff420, %l108 = 0000000000000003
	udivx	%l1,-0xbe0,%l3		! %l3 = 0000000000000000
!	Mem[0000000021800140] = 32ad0250, %l6 = 00000000000079ad
	ldstub	[%o3+0x140],%l6		! %l6 = 0000000000000032
!	Mem[0000000010081408] = 8ac602ff, %l2 = 0000000000000016
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = 00000021, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000021
!	Mem[0000000030141408] = 09ff0000, %l4 = 0000000079adff21
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%l7 = 0742ba625e72e558, Mem[0000000010041400] = f13e0e4800000021
	stxa	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 0742ba625e72e558
!	Mem[0000000030141400] = beea09ff, %l3 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000beea09ff

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000000000002f8f, %l0 = 00000000000000f1
	ldxa	[%i0+%o4]0x80,%l0	! %l0 = 0000000000002f8f
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010001400] = 000000e5 ff000000 00000000 00002f8f
!	Mem[0000000010001410] = ff000015 0000007e 7002c68a 32d08e33
!	Mem[0000000010001420] = 32fad998 39481449 00000014 7f71058f
!	Mem[0000000010001430] = 2a152a04 4781ef85 0742ba62 5e726bab
	ldda	[%i0+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000010041410] = 2953d929, %l7 = 0742ba625e72e558
	ldsba	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000029
!	Mem[0000000010101400] = 0000b0cc, %l4 = 0000000000000000
	lduwa	[%i4+%g0]0x88,%l4	! %l4 = 000000000000b0cc
!	Mem[0000000030041410] = e7037a1700000000, %l6 = 0000000000000032
	ldxa	[%i1+%o5]0x81,%l6	! %l6 = e7037a1700000000
!	Mem[0000000010001408] = 00000000, %l0 = 0000000000002f8f
	lduba	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = 0000a423000000e5, %f8  = 0c0adc08 456bc6f9
	ldda	[%i6+%o4]0x89,%f8 	! %f8  = 0000a423 000000e5
!	Mem[0000000030141410] = 001cffffff6f9dce, %f2  = e5000000 23a40000
	ldda	[%i5+%o5]0x81,%f2 	! %f2  = 001cffff ff6f9dce
!	Mem[0000000030101400] = 2d000014 7f71058f, %l0 = 00000000, %l1 = 79ad8371
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 000000002d000014 000000007f71058f
!	Mem[0000000010041410] = 2953d92942051b14, %l7 = 0000000000000029, %asi = 80
	ldxa	[%i1+0x010]%asi,%l7	! %l7 = 2953d92942051b14

p0_label_81:
!	Starting 10 instruction Store Burst
!	%f22 = 7002c68a, Mem[0000000030041400] = ff000000
	sta	%f22,[%i1+%g0]0x89	! Mem[0000000030041400] = 7002c68a
	membar	#Sync			! Added by membar checker (19)
!	%f3  = ff6f9dce, Mem[0000000010001400] = e5000000
	sta	%f3 ,[%i0+%g0]0x88	! Mem[0000000010001400] = ff6f9dce
!	Mem[0000000030001408] = ff00beff, %l7 = 0000000042051b14
	swapa	[%i0+%o4]0x89,%l7	! %l7 = 00000000ff00beff
!	Mem[0000000010081410] = ff000000, %l0 = 000000002d000014
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l1 = 000000007f71058f, Mem[00000000201c0000] = fffffea0, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 058ffea0
!	%l3 = 00000000beea09ff, Mem[0000000010101438] = 0b3fad7942051b14, %asi = 80
	stxa	%l3,[%i4+0x038]%asi	! Mem[0000000010101438] = 00000000beea09ff
!	%l1 = 000000007f71058f, %l3 = 00000000beea09ff, %l0 = 00000000000000ff
	xnor	%l1,%l3,%l0		! %l0 = ffffffff3e64f38f
!	%l0 = ffffffff3e64f38f, Mem[0000000020800040] = 23a47f00
	sth	%l0,[%o1+0x040]		! Mem[0000000020800040] = f38f7f00
!	Mem[0000000010001431] = 2a152a04, %l2 = 0000000000000021
	ldstuba	[%i0+0x031]%asi,%l2	! %l2 = 0000000000000015
!	%f30 = 0742ba62 5e726bab, Mem[00000000300c1400] = 480e3ef1 42eeb021
	stda	%f30,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0742ba62 5e726bab

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[000000001018140a] = ffffffff, %l2 = 0000000000000015
	ldsb	[%i6+0x00a],%l2		! %l2 = ffffffffffffffff
!	%l1 = 000000007f71058f, Mem[0000000010181436] = 4781ef85
	stb	%l1,[%i6+0x036]		! Mem[0000000010181434] = 47818f85
!	Mem[0000000010141400] = 21000008, %l5 = fffffffff9d8de76
	ldsha	[%i5+%g0]0x80,%l5	! %l5 = 0000000000002100
!	Mem[0000000021800101] = 0094a020, %l0 = ffffffff3e64f38f
	ldub	[%o3+0x101],%l0		! %l0 = 0000000000000094
!	%f28 = 2a152a04, %f16 = 000000e5
	fcmpes	%fcc1,%f28,%f16		! %fcc1 = 2
!	Mem[0000000010141400] = 21000008480e3ef1, %f30 = 0742ba62 5e726bab
	ldda	[%i5+%g0]0x80,%f30	! %f30 = 21000008 480e3ef1
!	Mem[0000000030181408] = e5000000, %l3 = 00000000beea09ff
	lduwa	[%i6+%o4]0x81,%l3	! %l3 = 00000000e5000000
!	Mem[0000000010041410] = 29d95329, %l1 = 000000007f71058f
	ldsba	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000029
!	Mem[0000000030001410] = 00000016, %l0 = 0000000000000094
	lduwa	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000016
!	Mem[0000000030101400] = 2d000014 7f71058f ff1d8d56 ffffff86
!	Mem[0000000030101410] = ff000000 0f000000 475c7aba 233d13a3
!	Mem[0000000030101420] = 76db2348 29c56939 5cdaacc6 7741c5ff
!	Mem[0000000030101430] = 0967e2b4 52d69775 1c330c92 7660571b
	ldda	[%i4+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030101400

p0_label_83:
!	Starting 10 instruction Store Burst
!	%f12 = 4afdf774 23a06135, Mem[0000000030081400] = 000000e4 7075a04e
	stda	%f12,[%i2+%g0]0x81	! Mem[0000000030081400] = 4afdf774 23a06135
!	%f18 = ff1d8d56 ffffff86, %l2 = ffffffffffffffff
!	Mem[0000000030041410] = e7037a1700000000
	add	%i1,0x010,%g1
	stda	%f18,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030041410] = 86ffffff568d1dff
!	%l3 = 00000000e5000000, Mem[0000000030041410] = 86ffffff
	stwa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = e5000000
!	%l4 = 000000000000b0cc, Mem[00000000100c1410] = ff977d39
	stw	%l4,[%i3+%o5]		! Mem[00000000100c1410] = 0000b0cc
!	Mem[00000000300c1400] = 0742ba62, %l3 = 00000000e5000000
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 000000000742ba62
!	Mem[0000000010141410] = 00000021, %l5 = 0000000000002100
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000021
!	%l7 = 00000000ff00beff, Mem[0000000010101408] = 0b3fad79
	stwa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = ff00beff
!	%f0  = 0aff0000 00000000, Mem[0000000010001410] = 150000ff 7e000000
	stda	%f0 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 0aff0000 00000000
!	%l4 = 0000b0cc, %l5 = 00000021, Mem[0000000010181408] = ffffffff 76ded8f9
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000b0cc 00000021
!	Mem[0000000010001433] = 2aff2a04, %l0 = 0000000000000016
	ldstub	[%i0+0x033],%l0		! %l0 = 0000000000000004

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000000, %l5 = 0000000000000021, %asi = 80
	ldswa	[%i2+0x010]%asi,%l5	! %l5 = ffffffffff000000
!	Mem[0000000030041410] = 000000e5, %l2 = ffffffffffffffff
	lduba	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000e5
!	Mem[00000000100c1410] = ccb00000, %l6 = e7037a1700000000
	lduwa	[%i3+%o5]0x88,%l6	! %l6 = 00000000ccb00000
!	Mem[0000000010001400] = ff6f9dce, %l5 = ffffffffff000000
	lduha	[%i0+%g0]0x88,%l5	! %l5 = 0000000000009dce
!	Mem[0000000030101408] = ff1d8d56, %l0 = 0000000000000004
	ldswa	[%i4+%o4]0x81,%l0	! %l0 = ffffffffff1d8d56
!	Mem[0000000030101408] = ff1d8d56, %l2 = 00000000000000e5
	ldsba	[%i4+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141400] = 00000000, %l1 = 0000000000000029
	lduha	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 2953d92942051b14, %l0 = ffffffffff1d8d56
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = 2953d92942051b14
!	Mem[00000000100c1408] = 2f8f2e30, %l3 = 000000000742ba62
	ldswa	[%i3+%o4]0x80,%l3	! %l3 = 000000002f8f2e30
!	Mem[00000000201c0000] = 058ffea0, %l0 = 2953d92942051b14
	ldsh	[%o0+%g0],%l0		! %l0 = 000000000000058f

p0_label_85:
!	Starting 10 instruction Store Burst
!	%f30 = 1c330c92 7660571b, %l1 = 0000000000000000
!	Mem[0000000010181430] = 2a152a0447818f85
	add	%i6,0x030,%g1
	stda	%f30,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010181430] = 2a152a0447818f85
!	%f0  = 0aff0000, Mem[000000001014141c] = ffffffcc
	st	%f0 ,[%i5+0x01c]	! Mem[000000001014141c] = 0aff0000
!	%l5 = 0000000000009dce, Mem[0000000010101404] = ffffffff, %asi = 80
	stha	%l5,[%i4+0x004]%asi	! Mem[0000000010101404] = 9dceffff
!	%l5 = 0000000000009dce, Mem[0000000030141400] = 00000000
	stwa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00009dce
!	%f4  = ff000000, Mem[0000000030181400] = 0000ff0a
	sta	%f4 ,[%i6+%g0]0x89	! Mem[0000000030181400] = ff000000
!	Mem[0000000010001400] = ce9d6fff ff000000 00000000 00002f8f
!	%f0  = 0aff0000 00000000 001cffff ff6f9dce
!	%f4  = ff000000 ffff91b7 103a4d7a 0d40e363
!	%f8  = 0000a423 000000e5 3d31fb86 5ebba1bf
!	%f12 = 4afdf774 23a06135 060c9752 08bdfedb
	stda	%f0 ,[%i0+%g0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%l0 = 000000000000058f, Mem[0000000010001410] = ffff91b7
	stba	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = ffff918f
!	%l1 = 0000000000000000, Mem[0000000010081408] = ff02c68a
	stha	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000c68a
!	Mem[0000000030041408] = 2d86ff16, %l7 = 00000000ff00beff
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 000000002d86ff16
!	Mem[0000000030141408] = ff00ff09, %l7 = 000000002d86ff16
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ff

p0_label_86:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010001408] = ce9d6fff, %l1 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l1	! %l1 = 000000000000ce9d
!	Mem[0000000010001410] = 8f91ffff, %l3 = 000000002f8f2e30
	lduwa	[%i0+%o5]0x80,%l3	! %l3 = 000000008f91ffff
!	Mem[0000000010001408] = ce9d6fffffff1c00, %f0  = 0aff0000 00000000
	ldda	[%i0+%o4]0x80,%f0 	! %f0  = ce9d6fff ffff1c00
!	Mem[0000000010081407] = 649fe11d, %l4 = 000000000000b0cc, %asi = 80
	lduba	[%i2+0x007]%asi,%l4	! %l4 = 000000000000001d
!	Mem[0000000030081400] = 74f7fd4a, %l4 = 000000000000001d
	ldsha	[%i2+%g0]0x89,%l4	! %l4 = fffffffffffffd4a
!	Mem[0000000010101412] = 7597d652, %l4 = fffffffffffffd4a
	lduh	[%i4+0x012],%l4		! %l4 = 000000000000d652
!	Mem[0000000010101410] = 7597d652 302e8f2f, %l0 = 0000058f, %l1 = 0000ce9d
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 000000007597d652 00000000302e8f2f
!	Mem[0000000030001408] = 141b0542ccb07e6c, %f14 = 060c9752 08bdfedb
	ldda	[%i0+%o4]0x81,%f14	! %f14 = 141b0542 ccb07e6c
!	Mem[0000000030101408] = ff1d8d56, %l3 = 000000008f91ffff
	lduha	[%i4+%o4]0x81,%l3	! %l3 = 000000000000ff1d
!	Mem[0000000010181400] = 000000002d86ffff, %l2 = ffffffffffffffff
	ldxa	[%i6+%g0]0x88,%l2	! %l2 = 000000002d86ffff

p0_label_87:
!	Starting 10 instruction Store Burst
!	%f2  = 001cffff, Mem[0000000030001410] = 16000000
	sta	%f2 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 001cffff
!	Mem[0000000010001408] = ce9d6fff, %l0 = 000000007597d652
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 00000000000000ce
!	Mem[00000000100c1400] = 00000021, %l7 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = 7002c68a, %l4 = 000000000000d652
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 000000007002c68a
!	Mem[00000000100c142c] = 302e8f2f, %l1 = 302e8f2f, %l4 = 7002c68a
	add	%i3,0x2c,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000302e8f2f
!	%l4 = 00000000302e8f2f, Mem[0000000030081400] = 4afdf774
	stwa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 302e8f2f
!	Mem[0000000010081410] = 000000ff, %l6 = 00000000ccb00000
	ldstuba	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1400] = 000000e5, %l1 = 00000000302e8f2f
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000e5
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 0000000000000000
	stxa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000000000
!	%l6 = 000000ff, %l7 = 00000000, Mem[00000000100c1400] = ff000021 1baf0000
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff 00000000

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ccb00000, %l1 = 00000000000000e5
	ldsha	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = ccb000009dceffff, %f2  = 001cffff ff6f9dce
	ldda	[%i4+%g0]0x80,%f2 	! %f2  = ccb00000 9dceffff
!	Mem[0000000010181410] = 21000015, %l4 = 00000000302e8f2f
	lduba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000021
!	Mem[0000000030081408] = e4000000, %f0  = ce9d6fff
	lda	[%i2+%o4]0x81,%f0 	! %f0 = e4000000
!	Mem[00000000211c0000] = b021f930, %l2 = 000000002d86ffff, %asi = 80
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000b021
!	Mem[0000000010101408] = ff00beff42051b14, %l6 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l6	! %l6 = ff00beff42051b14
!	Mem[0000000010041410] = 29d95329, %l4 = 0000000000000021
	ldswa	[%i1+%o5]0x88,%l4	! %l4 = 0000000029d95329
!	Mem[0000000030141400] = ce9d0000, %l5 = 0000000000009dce
	ldswa	[%i5+%g0]0x89,%l5	! %l5 = ffffffffce9d0000
!	%l5 = ffffffffce9d0000, %l1 = 0000000000000000, %y  = ffffffff
	smul	%l5,%l1,%l0		! %l0 = 0000000000000000, %y = 00000000
!	Mem[0000000021800000] = 6b6aef60, %l1 = 0000000000000000, %asi = 80
	ldsba	[%o3+0x000]%asi,%l1	! %l1 = 000000000000006b

p0_label_89:
!	Starting 10 instruction Store Burst
!	%f8  = 0000a423 000000e5, Mem[0000000010181410] = 21000015 0000007e
	stda	%f8 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000a423 000000e5
!	Mem[0000000010001400] = 00000000, %l2 = 000000000000b021
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l6 = ff00beff42051b14, Mem[0000000010141417] = 52d69775, %asi = 80
	stba	%l6,[%i5+0x017]%asi	! Mem[0000000010141414] = 52d69714
!	Mem[0000000010041400] = 5e72e558, %l3 = 000000000000ff1d
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 000000005e72e558
!	%f2  = ccb00000, Mem[00000000100c1410] = ccb00000
	sta	%f2 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = ccb00000
!	%l3 = 000000005e72e558, Mem[0000000010041414] = 42051b14, %asi = 80
	stha	%l3,[%i1+0x014]%asi	! Mem[0000000010041414] = e5581b14
!	%l3 = 000000005e72e558, Mem[0000000010081418] = 58ed827a6a59670e
	stx	%l3,[%i2+0x018]		! Mem[0000000010081418] = 000000005e72e558
!	Mem[0000000030081410] = 00002ea9, %l3 = 000000005e72e558
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%l0 = 0000000000000000, immd = fffffffffffffbe7, %l108 = 0000000000000001
	sdivx	%l0,-0x419,%l1		! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 0000b008, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 000000000000b008

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff000000, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x89,%l2	! %l2 = 00000000ff000000
!	%l5 = ffffffffce9d0000, immd = fffff853, %y  = 00000000
	smul	%l5,-0x7ad,%l6		! %l6 = 0000017b14e70000, %y = 0000017b
!	Mem[0000000010181400] = 2d86ffff, %f1  = ffff1c00
	lda	[%i6+%g0]0x88,%f1 	! %f1 = 2d86ffff
!	Mem[000000001004140c] = 8ac60270, %l2 = 00000000ff000000, %asi = 80
	ldsha	[%i1+0x00c]%asi,%l2	! %l2 = ffffffffffff8ac6
!	Mem[00000000100c1400] = 000000ff, %l5 = ffffffffce9d0000
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l4 = 0000000029d95329
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[000000001014141a] = ffffffff, %l4 = 0000000000000000
	lduh	[%i5+0x01a],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030101400] = 8f05717f 1400002d, %l0 = 00000000, %l1 = 0000b008
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 000000001400002d 000000008f05717f
!	Mem[0000000010181408] = 0000b0cc, %l5 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l5	! %l5 = ffffffffffffffcc
!	Mem[00000000300c1408] = 00000000, %l6 = 0000017b14e70000
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000

p0_label_91:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = ff002ea9, %l0 = 000000001400002d
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l0 = 000000ff, %l1 = 8f05717f, Mem[0000000030081408] = 000000e4 486002f7
	stda	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff 8f05717f
!	Mem[0000000010041400] = 0000ff1d, %l6 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l6	! %l6 = 000000000000ff1d
!	Mem[0000000010141426] = 6a742ea9, %l0 = 00000000000000ff
	ldstub	[%i5+0x026],%l0		! %l0 = 000000000000002e
!	%f31 = 7660571b, Mem[0000000010181410] = 23a40000
	sta	%f31,[%i6+%o5]0x88	! Mem[0000000010181410] = 7660571b
!	Mem[0000000030001408] = 141b0542, %l5 = ffffffffffffffcc
	ldsha	[%i0+%o4]0x81,%l5	! %l5 = 000000000000141b
!	%l3 = 0000000000000000, Mem[0000000030141400] = ce9d0000
	stha	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = ce9d0000
!	%f12 = 4afdf774 23a06135, Mem[0000000030181408] = 000000e5 0000a423
	stda	%f12,[%i6+%o4]0x89	! Mem[0000000030181408] = 4afdf774 23a06135
!	Mem[0000000010141434] = 78179c25, %l7 = 00000000, %l4 = 0000ffff
	add	%i5,0x34,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 0000000078179c25
!	Mem[0000000010141400] = 21000008 480e3ef1 7002c68a bd037a17
!	%f0  = e4000000 2d86ffff ccb00000 9dceffff
!	%f4  = ff000000 ffff91b7 103a4d7a 0d40e363
!	%f8  = 0000a423 000000e5 3d31fb86 5ebba1bf
!	%f12 = 4afdf774 23a06135 141b0542 ccb07e6c
	stda	%f0 ,[%i5+%g0]ASI_BLK_PL	! Block Store to 0000000010141400

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 1b576076, %l4 = 0000000078179c25
	ldsha	[%i6+%o5]0x80,%l4	! %l4 = 0000000000001b57
!	Mem[0000000030141410] = ce9d6fffffff1c00, %l5 = 000000000000141b
	ldxa	[%i5+%o5]0x89,%l5	! %l5 = ce9d6fffffff1c00
!	Mem[0000000010101410] = 7597d652 302e8f2f, %l0 = 0000002e, %l1 = 8f05717f
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 000000007597d652 00000000302e8f2f
!	%f26 = 5cdaacc6, %f30 = 1c330c92, %f18 = ff1d8d56
	fsubs	%f26,%f30,%f18		! %f18 = 5cdaacc6
!	Mem[0000000010181413] = 1b576076, %l4 = 0000000000001b57, %asi = 80
	ldsba	[%i6+0x013]%asi,%l4	! %l4 = 0000000000000076
!	Mem[0000000010001400] = 000000ff, %l0 = 000000007597d652
	lduha	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181408] = 3561a023, %f24 = 76db2348
	lda	[%i6+%o4]0x81,%f24	! %f24 = 3561a023
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010141410] = b791ffff, %l3 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = ffffffffb791ffff
!	Mem[0000000030141400] = e1154939ce9d0000, %f14 = 141b0542 ccb07e6c
	ldda	[%i5+%g0]0x89,%f14	! %f14 = e1154939 ce9d0000
!	Mem[0000000030101410] = ff000000, %l3 = ffffffffb791ffff
	lduha	[%i4+%o5]0x81,%l3	! %l3 = 000000000000ff00

p0_label_93:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffff8ac6, Mem[0000000030001408] = 6c7eb0cc42051b14
	stxa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffffffff8ac6
!	Mem[0000000010081400] = 00000000649fe11d, %l2 = ffffffffffff8ac6, %l7 = 0000000000000000
	casxa	[%i2]0x80,%l2,%l7	! %l7 = 00000000649fe11d
!	Mem[0000000030141400] = 00009dce, %l4 = 0000000000000076
	ldstuba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l7 = 00000000649fe11d, Mem[00000000300c1408] = 00000000
	stha	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = e11d0000
!	%f17 = 7f71058f, Mem[0000000030181408] = 3561a023
	sta	%f17,[%i6+%o4]0x81	! Mem[0000000030181408] = 7f71058f
!	%f22 = 475c7aba 233d13a3, Mem[00000000100c1400] = 000000ff 00000000
	std	%f22,[%i3+%g0]		! Mem[00000000100c1400] = 475c7aba 233d13a3
!	%l4 = 0000000000000000, Mem[00000000201c0000] = 058ffea0, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000fea0
!	%l1 = 00000000302e8f2f, Mem[00000000100c1400] = ba7a5c47
	stba	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = ba7a5c2f
!	%l6 = 000000000000ff1d, Mem[0000000010081408] = 0000af1b8ac60000
	stxa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000000000ff1d
!	%f0  = e4000000, %f28 = 0967e2b4, %f6  = 103a4d7a 0d40e363
	fsmuld	%f0 ,%f28,%f6 		! %f6  = bdbcfc56 80000000

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff009dce, %l2 = ffffffffffff8ac6
	lduha	[%i5+%g0]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[00000000100c1410] = 0000b0cc 21b0ee42, %l4 = 00000000, %l5 = ffff1c00
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 000000000000b0cc 0000000021b0ee42
!	Mem[0000000030181408] = 7f71058f74f7fd4a, %l0 = 00000000000000ff
	ldxa	[%i6+%o4]0x81,%l0	! %l0 = 7f71058f74f7fd4a
!	Mem[0000000010101400] = ccb00000 9dceffff, %l6 = 0000ff1d, %l7 = 649fe11d
	ldd	[%i4+%g0],%l6		! %l6 = 00000000ccb00000 000000009dceffff
!	%f4  = ff000000, %f23 = 233d13a3
	fcmpes	%fcc0,%f4 ,%f23		! %fcc0 = 1
!	Mem[0000000010081400] = 00000000, %l4 = 000000000000b0cc
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (22)
!	Mem[00000000300c1400] = ff000000 5e726bab e11d0000 00000044
!	Mem[00000000300c1410] = 00000000 00000000 652c395a 443633c3
!	Mem[00000000300c1420] = 35cd2ee8 74038259 0d0e2d66 70ce601f
!	Mem[00000000300c1430] = 092b4054 50a57a95 25adef32 21118b3b
	ldda	[%i3+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010181408] = ccb0000021000000, %f12 = 4afdf774 23a06135
	ldda	[%i6+%o4]0x80,%f12	! %f12 = ccb00000 21000000
!	Mem[000000001008142c] = 42eeb021, %l6 = 00000000ccb00000, %asi = 80
	lduwa	[%i2+0x02c]%asi,%l6	! %l6 = 0000000042eeb021
!	Mem[0000000010081400] = 00000000, %l0 = 7f71058f74f7fd4a
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_95:
!	Starting 10 instruction Store Burst
!	%f2  = ccb00000 9dceffff, Mem[0000000030101400] = 1400002d 8f05717f
	stda	%f2 ,[%i4+%g0]0x89	! Mem[0000000030101400] = ccb00000 9dceffff
!	%l6 = 0000000042eeb021, imm = 00000000000002e7, %l5 = 0000000021b0ee42
	addc	%l6,0x2e7,%l5		! %l5 = 0000000042eeb308
!	%f20 = 00000000 00000000, Mem[0000000010101400] = ccb00000 9dceffff, %asi = 80
	stda	%f20,[%i4+0x000]%asi	! Mem[0000000010101400] = 00000000 00000000
!	%l1 = 00000000302e8f2f, imm = 0000000000000de7, %l3 = 000000000000ff00
	andn	%l1,0xde7,%l3		! %l3 = 00000000302e8208
!	%l7 = 000000009dceffff, imm = fffffffffffff84f, %l7 = 000000009dceffff
	or	%l7,-0x7b1,%l7		! %l7 = ffffffffffffffff
!	%f0  = e4000000 2d86ffff, Mem[0000000030101410] = ff000000 0f000000
	stda	%f0 ,[%i4+%o5]0x81	! Mem[0000000030101410] = e4000000 2d86ffff
!	Mem[0000000010141400] = ffff862d, %l2 = 000000000000ff00
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%l1 = 00000000302e8f2f, Mem[0000000030001408] = c68affff
	stha	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 8f2fffff
!	%f28 = 957aa550 54402b09, Mem[0000000010101418] = 93c57c0d 00000000
	std	%f28,[%i4+0x018]	! Mem[0000000010101418] = 957aa550 54402b09
!	%l3 = 00000000302e8208, Mem[0000000010081408] = 0000ff1d
	stha	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 00008208

p0_label_96:
!	Starting 10 instruction Load Burst
!	%f13 = 21000000, %f28 = 957aa550, %f0  = e4000000
	fdivs	%f13,%f28,%f0 		! %f0  = cb02bbfc
!	%f25 = e82ecd35, %f0  = cb02bbfc, %f2  = ccb00000 9dceffff
	fsmuld	%f25,%f0 ,%f2 		! %f2  = 46765124 386dcb00
!	Mem[0000000030141400] = ff009dce394915e1, %l7 = ffffffffffffffff
	ldxa	[%i5+%g0]0x81,%l7	! %l7 = ff009dce394915e1
!	Mem[0000000010141400] = 2d86ffff, %l5 = 0000000042eeb308
	lduha	[%i5+%g0]0x88,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010001408] = ff9d6fff, %f10 = 3d31fb86
	lda	[%i0+%o4]0x80,%f10	! %f10 = ff9d6fff
!	Mem[0000000030181410] = b791ffff000000ff, %l7 = ff009dce394915e1
	ldxa	[%i6+%o5]0x89,%l7	! %l7 = b791ffff000000ff
!	Mem[00000000300c1410] = 0000000000000000, %f10 = ff9d6fff 5ebba1bf
	ldda	[%i3+%o5]0x89,%f10	! %f10 = 00000000 00000000
!	Mem[0000000030081408] = ff000000, %l4 = 0000000000000000
	lduba	[%i2+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001408] = ff9d6fffffff1c00, %l2 = 00000000000000ff
	ldxa	[%i0+%o4]0x80,%l2	! %l2 = ff9d6fffffff1c00
!	Mem[0000000030181410] = 000000ff, %l1 = 00000000302e8f2f
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 00000000000000ff

p0_label_97:
!	Starting 10 instruction Store Burst
!	%f31 = 32efad25, Mem[000000001010140c] = 42051b14
	st	%f31,[%i4+0x00c]	! Mem[000000001010140c] = 32efad25
!	Mem[0000000021800080] = 2d5f4fc0, %l6 = 0000000042eeb021
	ldstub	[%o3+0x080],%l6		! %l6 = 000000000000002d
!	%f16 = ab6b725e 000000ff, %l4 = 00000000000000ff
!	Mem[0000000030081428] = 0d44ca481716aa3f
	add	%i2,0x028,%g1
	stda	%f16,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030081428] = ff0000005e726bab
!	%l6 = 000000000000002d, Mem[0000000030081410] = a92e00ff
	stwa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000002d
!	%f12 = ccb00000 21000000, Mem[0000000030041408] = ff00beff 3710f117
	stda	%f12,[%i1+%o4]0x81	! Mem[0000000030041408] = ccb00000 21000000
!	%l4 = 00000000000000ff, Mem[0000000010181408] = ccb00000
	stba	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = ffb00000
!	%f20 = 00000000, Mem[000000001008143c] = ff09eabe
	st	%f20,[%i2+0x03c]	! Mem[000000001008143c] = 00000000
!	%l6 = 000000000000002d, Mem[0000000010101408] = 25adef32ffbe00ff
	stxa	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000000000002d
!	%l0 = 0000000000000000, Mem[0000000030081410] = 2d000000
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Mem[0000000010081410] = ff000000, %l1 = 00000000000000ff
	ldstub	[%i2+%o5],%l1		! %l1 = 00000000000000ff

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 0000002d, %f2  = 46765124
	lda	[%i4+%o4]0x88,%f2 	! %f2 = 0000002d
!	Mem[0000000010101410] = 7597d652, %l0 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = 0000000000007597
!	Mem[0000000010081410] = ff00000000000008, %f0  = cb02bbfc 2d86ffff
	ldda	[%i2+%o5]0x80,%f0 	! %f0  = ff000000 00000008
!	Mem[0000000010001430] = 3561a023, %l0 = 0000000000007597, %asi = 80
	ldsba	[%i0+0x030]%asi,%l0	! %l0 = 0000000000000035
!	Mem[00000000100c1408] = 2f8f2e30 0000af1b, %l2 = ffff1c00, %l3 = 302e8208, %asi = 80
	ldda	[%i3+0x008]%asi,%l2	! %l2 = 000000002f8f2e30 000000000000af1b
!	Mem[00000000100c1414] = 21b0ee42, %f17 = 000000ff
	ld	[%i3+0x014],%f17	! %f17 = 21b0ee42
!	Mem[00000000300c1400] = ff000000, %f25 = e82ecd35
	lda	[%i3+%g0]0x81,%f25	! %f25 = ff000000
!	Mem[00000000100c1424] = 2af260e9, %l1 = 00000000000000ff, %asi = 80
	ldswa	[%i3+0x024]%asi,%l1	! %l1 = 000000002af260e9
!	Mem[0000000030181408] = 7f71058f, %l4 = 00000000000000ff
	ldsba	[%i6+%o4]0x81,%l4	! %l4 = 000000000000007f
!	Mem[00000000300c1410] = 0000000000000000, %l1 = 000000002af260e9
	ldxa	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_99:
!	Starting 10 instruction Store Burst
!	%l4 = 0000007f, %l5 = 0000ffff, Mem[0000000010101408] = 0000002d 00000000
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000007f 0000ffff
!	Mem[0000000010001410] = 8f91ffff, %l2 = 000000002f8f2e30
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 000000008f91ffff
!	Mem[0000000010181410] = 1b576076, %l0 = 00000035, %l3 = 0000af1b
	add	%i6,0x10,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 000000001b576076
!	%l6 = 000000000000002d, Mem[0000000030041410] = 000000e5
	stha	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000002d
!	%l2 = 000000008f91ffff, Mem[0000000010081408] = 08820000
	stwa	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 8f91ffff
!	Mem[0000000030181410] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%l2 = 8f91ffff, %l3 = 1b576076, Mem[0000000030041410] = 0000002d ff1d8d56
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 8f91ffff 1b576076
!	Mem[0000000010041400] = 00000000, %l6 = 0000002d, %l0 = 00000035
	casa	[%i1]0x80,%l6,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800001] = 9c2580d0, %l0 = 0000000000000000
	ldstub	[%o1+0x001],%l0		! %l0 = 0000000000000025
!	%f8  = 0000a423, Mem[0000000010101400] = 00000000
	sta	%f8 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000a423

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = e11d0000 00000044, %l4 = 0000007f, %l5 = 0000ffff
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 00000000e11d0000 0000000000000044
!	Mem[0000000030041410] = ffff918f, %l5 = 0000000000000044
	lduwa	[%i1+%o5]0x81,%l5	! %l5 = 00000000ffff918f
!	Mem[0000000010001430] = 3561a023, %l2 = 000000008f91ffff
	ldsb	[%i0+0x030],%l2		! %l2 = 0000000000000035
!	Mem[0000000010041408] = 7002c68accb00000, %l0 = 0000000000000025
	ldxa	[%i1+%o4]0x88,%l0	! %l0 = 7002c68accb00000
!	Mem[00000000211c0000] = b021f930, %l5 = 00000000ffff918f
	ldub	[%o2+%g0],%l5		! %l5 = 00000000000000b0
!	%l5 = 00000000000000b0, immd = 000009e7, %y  = 0000017b
	sdiv	%l5,0x9e7,%l2		! %l2 = 000000002646159c
	mov	%l0,%y			! %y = ccb00000
!	Mem[0000000010101408] = 0000007f, %l0 = 7002c68accb00000
	lduba	[%i4+%o4]0x88,%l0	! %l0 = 000000000000007f
!	Mem[0000000010081408] = 8f91ffff, %l0 = 000000000000007f
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 000000008f91ffff
!	Mem[0000000030101408] = ff1d8d56, %l0 = 000000008f91ffff
	lduha	[%i4+%o4]0x81,%l0	! %l0 = 000000000000ff1d
!	Mem[0000000030081410] = 00000000, %f5  = ffff91b7
	lda	[%i2+%o5]0x89,%f5 	! %f5 = 00000000

p0_label_101:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081424] = ccb00000, %l3 = 000000001b576076
	swap	[%i2+0x024],%l3		! %l3 = 00000000ccb00000
!	%l5 = 00000000000000b0, Mem[0000000030081408] = 8f05717f000000ff
	stxa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000b0
!	%l2 = 000000002646159c, Mem[0000000010001410] = 2f8f2e30
	stha	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 159c2e30
!	Mem[00000000201c0001] = 0000fea0, %l2 = 000000002646159c, %asi = 80
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000000
!	%f30 = 3b8b1121 32efad25, %l5 = 00000000000000b0
!	Mem[0000000010181400] = ffff862d00000000
	stda	%f30,[%i6+%l5]ASI_PST8_P ! Mem[0000000010181400] = 3bff112100000000
!	%l6 = 000000000000002d, Mem[0000000030001410] = 001cffff
	stwa	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000002d
!	%f12 = ccb00000 21000000, Mem[0000000030181400] = 000000ff 00000000
	stda	%f12,[%i6+%g0]0x81	! Mem[0000000030181400] = ccb00000 21000000
!	Mem[0000000010101408] = 0000007f, %l4 = 00000000e11d0000
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 000000000000007f
!	Mem[0000000010181410] = 7660571b, %l4 = 000000000000007f
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 000000000000001b
!	%l4 = 000000000000001b, Mem[0000000010001410] = 159c2e30
	stba	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 1b9c2e30

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 7f71058f 74f7fd4a, %l6 = 0000002d, %l7 = 000000ff
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 000000007f71058f 0000000074f7fd4a
!	Mem[0000000010081410] = 000000ff, %l7 = 0000000074f7fd4a
	lduba	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181434] = 47818f85, %l1 = 00000000000000ff
	ldsb	[%i6+0x034],%l1		! %l1 = 0000000000000047
!	Mem[0000000010101410] = 52d69775, %l2 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l2	! %l2 = 0000000052d69775
!	Mem[0000000010141400] = e4000000 2d86ffff, %l4 = 0000001b, %l5 = 000000b0
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 000000002d86ffff 00000000e4000000
!	%l6 = 000000007f71058f, %l0 = 000000000000ff1d, %l4 = 000000002d86ffff
	subc	%l6,%l0,%l4		! %l4 = 000000007f700672
!	Mem[0000000010041408] = 0000b0cc 8ac60270, %l2 = 52d69775, %l3 = ccb00000
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 000000000000b0cc 000000008ac60270
!	Mem[0000000010181408] = 0000b0ff, %l0 = 000000000000ff1d
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = 000000000000b0ff
!	Mem[00000000100c1410] = ccb00000, %l2 = 000000000000b0cc
	lduwa	[%i3+%o5]0x88,%l2	! %l2 = 00000000ccb00000
!	Mem[0000000010101408] = 0000ffffe11d0000, %l0 = 000000000000b0ff
	ldxa	[%i4+%o4]0x88,%l0	! %l0 = 0000ffffe11d0000

p0_label_103:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141435] = 74f7fd4a, %l7 = 00000000000000ff
	ldstub	[%i5+0x035],%l7		! %l7 = 00000000000000f7
!	%f8  = 0000a423, Mem[0000000010101400] = 0000a423
	sta	%f8 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000a423
!	Mem[00000000211c0001] = b021f930, %l1 = 0000000000000047
	ldstub	[%o2+0x001],%l1		! %l1 = 0000000000000021
!	%l5 = 00000000e4000000, Mem[0000000010141400] = 2d86ffff
	stwa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = e4000000
!	Mem[0000000010181410] = 766057ff, %l0 = 0000ffffe11d0000
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101410] = 52d69775, %l0 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000075
!	%l0 = 0000000000000075, Mem[0000000010101400] = 23a40000
	stwa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000075
!	%f0  = ff000000, Mem[00000000100c1434] = 38bd5e25
	st	%f0 ,[%i3+0x034]	! Mem[00000000100c1434] = ff000000
!	%l1 = 0000000000000021, Mem[00000000201c0000] = 0000fea0
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 0021fea0
!	Mem[0000000010041410] = 29d95329, %l3 = 000000008ac60270
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 0000000029d95329

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = b0000000 00000000, %l4 = 7f700672, %l5 = e4000000
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 00000000b0000000 0000000000000000
!	Mem[0000000010081410] = 000000ff, %l3 = 0000000029d95329
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041410] = 7002c68a, %l5 = 0000000000000000
	lduh	[%i1+%o5],%l5		! %l5 = 0000000000007002
!	Mem[00000000300c1408] = e11d0000, %l0 = 0000000000000075
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = ffffffffffffe11d
!	Mem[0000000030041400] = 0000d652, %l7 = 00000000000000f7
	ldsba	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000052
!	Mem[0000000010081408] = 8f91ffff00000000, %l0 = ffffffffffffe11d
	ldx	[%i2+%o4],%l0		! %l0 = 8f91ffff00000000
!	%l2 = 00000000ccb00000, %l6 = 000000007f71058f, %l6  = 000000007f71058f
	mulx	%l2,%l6,%l6		! %l6 = 65e5ae21c6500000
!	Mem[00000000211c0000] = b0fff930, %l2 = 00000000ccb00000
	lduh	[%o2+%g0],%l2		! %l2 = 000000000000b0ff
!	Mem[0000000030081408] = 000000b0, %l3 = ffffffffffffffff
	lduha	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000b0
!	Mem[0000000010141410] = ff000000ffff91b7, %f16 = ab6b725e 21b0ee42
	ldda	[%i5+%o5]0x88,%f16	! %f16 = ff000000 ffff91b7

p0_label_105:
!	Starting 10 instruction Store Burst
!	%f20 = 00000000 00000000, %l4 = 00000000b0000000
!	Mem[0000000030041438] = 4d5587627a82edff
	add	%i1,0x038,%g1
	stda	%f20,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030041438] = 4d5587627a82edff
!	Mem[0000000010141410] = b791ffff, %l4 = 00000000b0000000
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000b7
	membar	#Sync			! Added by membar checker (23)
!	%f2  = 0000002d, Mem[00000000300c1410] = 00000000
	sta	%f2 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000002d
!	%l2 = 000000000000b0ff, Mem[00000000218001c0] = 4a0b3ab0
	sth	%l2,[%o3+0x1c0]		! Mem[00000000218001c0] = b0ff3ab0
!	%l2 = 000000000000b0ff, Mem[0000000010181408] = 000000210000b0ff
	stxa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000000000b0ff
!	%l3 = 00000000000000b0, Mem[00000000300c1410] = 0000002d
	stwa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000b0
!	Mem[0000000010181400] = 3bff1121 00000000 ffb00000 00000000
!	%f16 = ff000000 ffff91b7 44000000 00001de1
!	%f20 = 00000000 00000000 c3333644 5a392c65
!	%f24 = 59820374 ff000000 1f60ce70 662d0e0d
!	%f28 = 957aa550 54402b09 3b8b1121 32efad25
	stda	%f16,[%i6+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	%f24 = 59820374 ff000000, Mem[00000000100c1408] = 302e8f2f 1baf0000
	stda	%f24,[%i3+%o4]0x88	! Mem[00000000100c1408] = 59820374 ff000000
!	%f22 = c3333644 5a392c65, %l4 = 00000000000000b7
!	Mem[0000000030081418] = 43b067fa5f8c03e3
	add	%i2,0x018,%g1
	stda	%f22,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030081418] = 652c39fa443603c3
!	%f9  = 000000e5, Mem[0000000010041434] = 5bc1e465
	sta	%f9 ,[%i1+0x034]%asi	! Mem[0000000010041434] = 000000e5

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 000000e4, %l2 = 000000000000b0ff
	ldswa	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000e4
!	Mem[00000000201c0001] = 0021fea0, %l0 = 8f91ffff00000000, %asi = 80
	lduba	[%o0+0x001]%asi,%l0	! %l0 = 0000000000000021
!	Mem[0000000030141400] = ff009dce, %l6 = 65e5ae21c6500000
	lduwa	[%i5+%g0]0x81,%l6	! %l6 = 00000000ff009dce
!	Mem[0000000030181400] = ccb00000, %l0 = 0000000000000021
	lduha	[%i6+%g0]0x81,%l0	! %l0 = 000000000000ccb0
!	Mem[00000000100c1408] = ff000000, %l6 = 00000000ff009dce
	lduha	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 75000000 00000000 00001de1 ffff0000
!	Mem[0000000010101410] = ff97d652 302e8f2f 957aa550 54402b09
!	Mem[0000000010101420] = a92e746a 78179c25 00000000 ff000000
!	Mem[0000000010101430] = 8bcf907d 00000000 00000000 beea09ff
	ldda	[%i4+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010101400
!	Mem[0000000010141418] = 63e3400d7a4d3a10, %l3 = 00000000000000b0, %asi = 80
	ldxa	[%i5+0x018]%asi,%l3	! %l3 = 63e3400d7a4d3a10
!	Mem[0000000010141400] = e4000000e4000000, %f14 = e1154939 ce9d0000
	ldda	[%i5+%g0]0x88,%f14	! %f14 = e4000000 e4000000
!	Mem[00000000100c142e] = 7002c68a, %l1 = 0000000000000021, %asi = 80
	lduha	[%i3+0x02e]%asi,%l1	! %l1 = 000000000000c68a
!	Mem[0000000030101410] = 000000e4, %l2 = 00000000000000e4
	ldsha	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000e4

p0_label_107:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000007002, Mem[0000000030041410] = 8f91ffff
	stba	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 8f91ff02
!	Mem[00000000211c0000] = b0fff930, %l7 = 0000000000000052
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000b0
!	%f24 = 259c1778 6a742ea9, %l4 = 00000000000000b7
!	Mem[0000000010181410] = 0000000000000000
	add	%i6,0x010,%g1
	stda	%f24,[%g1+%l4]ASI_PST32_P ! Mem[0000000010181410] = 259c17786a742ea9
!	Mem[0000000010041419] = 08f47fea, %l0 = 000000000000ccb0
	ldstuba	[%i1+0x019]%asi,%l0	! %l0 = 00000000000000f4
!	%l2 = 00000000000000e4, Mem[0000000030041400] = 52d60000
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00e40000
!	Mem[0000000030041408] = 0000b0cc, %l2 = 00000000000000e4
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000cc
!	%f15 = e4000000, Mem[0000000010181410] = 78179c25
	sta	%f15,[%i6+%o5]0x88	! Mem[0000000010181410] = e4000000
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010181410] = 000000e4, %l4 = 00000000000000b7
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 00000000000000e4
!	%f8  = 0000a423 000000e5, Mem[0000000010101428] = 00000000 ff000000, %asi = 80
	stda	%f8 ,[%i4+0x028]%asi	! Mem[0000000010101428] = 0000a423 000000e5
!	%l5 = 0000000000007002, Mem[0000000010001400] = ff000000
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 70020000

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = 3f6a6190, %l5 = 0000000000007002
	ldub	[%o3+0x040],%l5		! %l5 = 000000000000003f
!	Mem[0000000030101410] = 000000e4, %l2 = 00000000000000cc
	ldswa	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000e4
!	Mem[0000000030141408] = 50ffb0ff09ff00ff, %f10 = 00000000 00000000
	ldda	[%i5+%o4]0x89,%f10	! %f10 = 50ffb0ff 09ff00ff
!	Mem[00000000100c1428] = 34adffb6, %l5 = 000000000000003f, %asi = 80
	ldswa	[%i3+0x028]%asi,%l5	! %l5 = 0000000034adffb6
!	Mem[0000000030001400] = 00000000 08b00000 8f2fffff ffffffff
!	Mem[0000000030001410] = 2d000000 00000924 6876153a 106db423
!	Mem[0000000030001420] = 08aaf1c8 7762edb9 16054f46 61fa4e7f
!	Mem[0000000030001430] = 008ef934 554143f5 689d3712 5e05479b
	ldda	[%i0+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030001400
!	Mem[0000000010081410] = ff000000, %l5 = 0000000034adffb6
	lduha	[%i2+%o5]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030001400] = 00000000, %l7 = 00000000000000b0
	lduwa	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l3 = 63e3400d7a4d3a10, %l1 = 000000000000c68a, %y  = ccb00000
	umul	%l3,%l1,%l1		! %l1 = 00005ed9a889aca0, %y = 00005ed9
!	Mem[00000000300c1410] = b0000000, %l0 = 00000000000000f4
	ldsha	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = 09ff00ff, %l5 = 000000000000ff00
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_109:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800001] = 6b6aef60, %l4 = 00000000000000e4
	ldstub	[%o3+0x001],%l4		! %l4 = 000000000000006a
!	Mem[0000000010141400] = 000000e4, %l3 = 63e3400d7a4d3a10
	ldstuba	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%f28 = 00000000, Mem[0000000010181410] = b7000000
	sta	%f28,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%f16 = 00000000 00000075, Mem[0000000010181410] = 00000000 6a742ea9
	stda	%f16,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 00000075
!	Mem[0000000030141400] = ce9d00ff, %l2 = 00000000000000e4
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101410] = ff97d652, %l0 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 00000000ff97d652
!	Mem[0000000010101404] = 00000000, %l0 = 00000000ff97d652, %asi = 80
	swapa	[%i4+0x004]%asi,%l0	! %l0 = 0000000000000000
!	%f31 = 00000000, Mem[0000000030081400] = 302e8f2f
	sta	%f31,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[00000000201c0001] = 0021fea0, %l2 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000021
!	%l6 = 0000000000000000, Mem[0000000010001410] = 1b9c2e30
	stba	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 009c2e30

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 70020000, %l7 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000070
!	Mem[0000000030181400] = 000000210000b0cc, %l1 = 00005ed9a889aca0
	ldxa	[%i6+%g0]0x89,%l1	! %l1 = 000000210000b0cc
!	Mem[0000000010181408] = 00001de1, %l0 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l0	! %l0 = 0000000000001de1
!	Mem[0000000010081408] = 00000000 ffff918f, %l2 = 00000021, %l3 = 00000000
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 00000000ffff918f 0000000000000000
!	Mem[0000000021800140] = ffad0250, %l2 = 00000000ffff918f, %asi = 80
	ldsba	[%o3+0x140]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141410] = 001cffff, %l7 = 0000000000000070
	ldsha	[%i5+%o5]0x81,%l7	! %l7 = 000000000000001c
!	Mem[00000000100c1408] = 000000ff, %l3 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c140c] = 74038259, %f27 = 00000000
	lda	[%i3+0x00c]%asi,%f27	! %f27 = 74038259
!	Mem[0000000010141400] = ff0000e4, %l2 = ffffffffffffffff
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041421] = 6f7805f8, %l5 = 00000000000000ff
	ldub	[%i1+0x021],%l5		! %l5 = 0000000000000078

p0_label_111:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000001de1, Mem[0000000010001400] = 00000270
	stba	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 000002e1
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000030081400] = 00000000 23a06135
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff 00000000
!	Mem[0000000010041410] = 7002c68a, %l4 = 000000000000006a
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 000000007002c68a
!	%l3 = 0000000000000000, Mem[0000000030081410] = 00000000
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Mem[00000000100c1434] = ff000000, %l7 = 000000000000001c, %asi = 80
	swapa	[%i3+0x034]%asi,%l7	! %l7 = 00000000ff000000
!	%l7 = 00000000ff000000, Mem[00000000300c1408] = e11d0000
	stwa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000
!	Mem[0000000030041408] = 0000b0ff, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000100c1408] = ff000000
	stwa	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	%l6 = 00000000, %l7 = ff000000, Mem[0000000010101400] = 75000000 ff97d652
	stda	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 ff000000
!	%f6  = 6876153a 106db423, %l0 = 0000000000001de1
!	Mem[0000000010141438] = 6c7eb0cc42051b14
	add	%i5,0x038,%g1
	stda	%f6,[%g1+%l0]ASI_PST16_P ! Mem[0000000010141438] = 6c7eb0cc4205b423

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = dbfebd0852970c06, %f18 = 0000ffff e11d0000
	ldd	[%i0+0x038],%f18	! %f18 = dbfebd08 52970c06
!	Mem[0000000030081410] = 00000000, %l4 = 000000007002c68a
	lduba	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1438] = 20d51e6e, %l5 = 0000000000000078, %asi = 80
	lduha	[%i3+0x038]%asi,%l5	! %l5 = 00000000000020d5
!	Mem[0000000030101400] = 9dceffff, %l4 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000020800001] = 9cff80d0, %l0 = 0000000000001de1
	ldsb	[%o1+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000, %f21 = 52d697ff
	lda	[%i1+%g0]0x88,%f21	! %f21 = 00000000
!	Mem[0000000030001408] = 8f2fffff, %l5 = 00000000000020d5
	ldswa	[%i0+%o4]0x81,%l5	! %l5 = ffffffff8f2fffff
!	Mem[00000000300c1410] = 000000b000000000, %l4 = ffffffffffffffff
	ldxa	[%i3+%o5]0x81,%l4	! %l4 = 000000b000000000
!	Mem[0000000010081400] = 00000000, %l0 = ffffffffffffffff
	ldsba	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = ff000000, %l4 = 000000b000000000
	lduha	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000

p0_label_113:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010041408] = ccb00000
	stha	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ccb00000
!	%f16 = 00000000 00000075, Mem[00000000300c1410] = 000000b0 00000000
	stda	%f16,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 00000075
!	%l7 = 00000000ff000000, Mem[0000000010181408] = 00001de1
	stba	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 00001d00
!	Code Fragment 4, seed = 708348
p0_fragment_7:
!	%l0 = 0000000000000000
	setx	0x498cce87830cbc46,%g7,%l0 ! %l0 = 498cce87830cbc46
!	%l1 = 000000210000b0cc
	setx	0xaefbc076a15a3671,%g7,%l1 ! %l1 = aefbc076a15a3671
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 498cce87830cbc46
	setx	0xf9921453975a34ac,%g7,%l0 ! %l0 = f9921453975a34ac
!	%l1 = aefbc076a15a3671
	setx	0xbdcb1d56abe2b9f7,%g7,%l1 ! %l1 = bdcb1d56abe2b9f7
p0_fragment_7_end:
!	Mem[0000000010141420] = e500000023a40000, %l5 = ffffffff8f2fffff, %l2 = 00000000000000ff
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = e500000023a40000
!	Mem[00000000300c1400] = 000000ff, %l7 = 00000000ff000000
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081408] = ffff918f, %l6 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l6	! %l6 = 00000000ffff918f
!	%f10 = 16054f46 61fa4e7f, Mem[0000000010101400] = 00000000 ff000000, %asi = 80
	stda	%f10,[%i4+0x000]%asi	! Mem[0000000010101400] = 16054f46 61fa4e7f
!	%l7 = 00000000000000ff, Mem[000000001010143b] = 00000000
	stb	%l7,[%i4+0x03b]		! Mem[0000000010101438] = 000000ff
!	%l3 = 00000000000000ff, Mem[00000000300c1400] = 000000ff
	stba	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00001de1ffff0000, %f12 = 008ef934 554143f5
	ldd	[%i4+%o4],%f12		! %f12 = 00001de1 ffff0000
!	Mem[0000000030141400] = ff009dce394915e1, %l7 = 00000000000000ff
	ldxa	[%i5+%g0]0x81,%l7	! %l7 = ff009dce394915e1
!	Mem[0000000030041408] = 0000b0ff, %f23 = 50a57a95
	lda	[%i1+%o4]0x89,%f23	! %f23 = 0000b0ff
!	Mem[0000000010181400] = b791ffff, %l4 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l4	! %l4 = ffffffffb791ffff
!	Mem[0000000010101408] = 00001de1, %l4 = ffffffffb791ffff
	ldswa	[%i4+%o4]0x80,%l4	! %l4 = 0000000000001de1
!	Mem[0000000020800000] = 9cff80d0, %l6 = 00000000ffff918f, %asi = 80
	ldsba	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffff9c
!	Mem[0000000010181438] = 25adef3221118b3b, %f28 = 00000000 7d90cf8b, %asi = 80
	ldda	[%i6+0x038]%asi,%f28	! %f28 = 25adef32 21118b3b
!	Mem[0000000030081408] = b0000000 00000000, %l4 = 00001de1, %l5 = 8f2fffff
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 00000000b0000000 0000000000000000
!	Mem[000000001018142c] = 70ce601f, %f0  = 00000000
	lda	[%i6+0x02c]%asi,%f0 	! %f0 = 70ce601f
!	Mem[0000000030081400] = 000000ff00000000, %l4 = 00000000b0000000
	ldxa	[%i2+%g0]0x81,%l4	! %l4 = 000000ff00000000

p0_label_115:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141418] = 63e3400d7a4d3a10, %l2 = e500000023a40000, %l3 = 00000000000000ff
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 63e3400d7a4d3a10
!	Mem[000000001010141c] = 54402b09, %l7 = 00000000394915e1, %asi = 80
	swapa	[%i4+0x01c]%asi,%l7	! %l7 = 0000000054402b09
!	%l4 = 000000ff00000000, Mem[0000000010141408] = 9dceffff
	stwa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
	membar	#Sync			! Added by membar checker (25)
!	%f26 = 000000ff 74038259, Mem[0000000030001410] = 2d000000 00000924
	stda	%f26,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff 74038259
!	%f9  = 7762edb9, %f10 = 16054f46
	fsqrts	%f9 ,%f10		! %f10 = 5b7106c2
!	%l6 = ffffffffffffff9c, immd = fffffaa8, %y  = 00005ed9
	udiv	%l6,-0x558,%l4		! %l4 = 0000000000005eda
	mov	%l0,%y			! %y = 975a34ac
!	%l4 = 0000000000005eda, Mem[0000000010141400] = ff0000e4
	stwa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00005eda
!	%l7 = 0000000054402b09, Mem[0000000010141422] = e5000000, %asi = 80
	stha	%l7,[%i5+0x022]%asi	! Mem[0000000010141420] = e5002b09
!	Mem[00000000300c1408] = ff000000, %l3 = 63e3400d7a4d3a10
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l1 = bdcb1d56abe2b9f7, Mem[0000000010181410] = 7500000000000000
	stxa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = bdcb1d56abe2b9f7

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081404] = 649fe11d, %f0  = 70ce601f
	ld	[%i2+0x004],%f0 	! %f0 = 649fe11d
!	Mem[0000000010101438] = 000000ff, %l7 = 0000000054402b09, %asi = 80
	lduwa	[%i4+0x038]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = ffffce9d 0000b0cc ff1d8d56 ffffff86
!	%f0  = 649fe11d 08b00000 8f2fffff ffffffff
!	%f4  = 2d000000 00000924 6876153a 106db423
!	%f8  = 08aaf1c8 7762edb9 5b7106c2 61fa4e7f
!	%f12 = 00001de1 ffff0000 689d3712 5e05479b
	stda	%f0 ,[%i4+%g0]ASI_BLK_S	! Block Store to 0000000030101400
!	Mem[00000000100c1400] = 2f5c7aba233d13a3, %f16 = 00000000 00000075
	ldda	[%i3+%g0]0x80,%f16	! %f16 = 2f5c7aba 233d13a3
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010101400] = 464f0516, %f23 = 0000b0ff
	lda	[%i4+%g0]0x88,%f23	! %f23 = 464f0516
!	Mem[0000000010101408] = 0000ffff e11d0000, %l2 = 23a40000, %l3 = 000000ff
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 00000000e11d0000 000000000000ffff
!	Mem[0000000030081410] = 00000000, %l6 = ffffffffffffff9c
	lduba	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[000000001008142c] = 42eeb021, %l7 = 00000000000000ff, %asi = 80
	ldswa	[%i2+0x02c]%asi,%l7	! %l7 = 0000000042eeb021
!	Mem[00000000100c1438] = 20d51e6ec5fe2019, %f26 = 000000ff 74038259
	ldd	[%i3+0x038],%f26	! %f26 = 20d51e6e c5fe2019
!	Mem[00000000218000c1] = 6babb9f0, %l3 = 000000000000ffff, %asi = 80
	ldsba	[%o3+0x0c1]%asi,%l3	! %l3 = ffffffffffffffab

p0_label_117:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000042eeb021, Mem[00000000100c1400] = ba7a5c2f
	stba	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = ba7a5c21
!	Mem[0000000010101411] = 00000000, %l7 = 0000000042eeb021
	ldstub	[%i4+0x011],%l7		! %l7 = 0000000000000000
!	%f5  = 00000924, Mem[00000000100c1408] = 000000ff
	sta	%f5 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000924
!	Mem[00000000100c1400] = a3133d23ba7a5c21, %f10 = 5b7106c2 61fa4e7f
	ldda	[%i3+%g0]0x88,%f10	! %f10 = a3133d23 ba7a5c21
!	%f20 = 2f8f2e30 00000000, Mem[00000000300c1408] = ff000000 00000044
	stda	%f20,[%i3+%o4]0x81	! Mem[00000000300c1408] = 2f8f2e30 00000000
!	Mem[00000000218000c0] = 6babb9f0, %l1 = bdcb1d56abe2b9f7
	ldstub	[%o3+0x0c0],%l1		! %l1 = 000000000000006b
!	Mem[0000000030101410] = 0000002d, %l0 = f9921453975a34ac
	ldstuba	[%i4+%o5]0x89,%l0	! %l0 = 000000000000002d
!	%l4 = 00005eda, %l5 = 00000000, Mem[0000000010081408] = 00000000 00000000
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00005eda 00000000
!	Mem[0000000030081400] = 000000ff 00000000 b0000000 00000000
!	%f0  = 649fe11d 08b00000 8f2fffff ffffffff
!	%f4  = 2d000000 00000924 6876153a 106db423
!	%f8  = 08aaf1c8 7762edb9 a3133d23 ba7a5c21
!	%f12 = 00001de1 ffff0000 689d3712 5e05479b
	stda	%f0 ,[%i2+%g0]ASI_COMMIT_S	! Block Store to 0000000030081400
!	%l0 = 000000000000002d, Mem[00000000201c0001] = 00fffea0
	stb	%l0,[%o0+0x001]		! Mem[00000000201c0000] = 002dfea0

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000b0cc21b0ee42, %f24 = 259c1778 6a742ea9
	ldda	[%i3+%o5]0x80,%f24	! %f24 = 0000b0cc 21b0ee42
!	Mem[0000000010001411] = 009c2e30, %l2 = 00000000e11d0000, %asi = 80
	ldsba	[%i0+0x011]%asi,%l2	! %l2 = ffffffffffffff9c
!	Mem[000000001014140c] = 0000b0cc, %l4 = 0000000000005eda, %asi = 80
	lduha	[%i5+0x00c]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = a3133d23 ba7a5c21, %l2 = ffffff9c, %l3 = ffffffab
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 00000000ba7a5c21 00000000a3133d23
!	Mem[00000000201c0000] = 002dfea0, %l2 = 00000000ba7a5c21, %asi = 80
	lduba	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l3 = 00000000a3133d23
	ldswa	[%i3+%g0]0x81,%l3	! %l3 = ffffffffff000000
!	Mem[00000000300c1410] = 00000000, %l3 = ffffffffff000000
	lduwa	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 8f2fffff, %l6 = 0000000000000000
	lduha	[%i0+%o4]0x81,%l6	! %l6 = 0000000000008f2f
!	Mem[0000000030001410] = ff000000, %f26 = 20d51e6e
	lda	[%i0+%o5]0x89,%f26	! %f26 = ff000000
!	Mem[00000000300c1410] = 0000000000000075, %f26 = ff000000 c5fe2019
	ldda	[%i3+%o5]0x81,%f26	! %f26 = 00000000 00000075

p0_label_119:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000030081410] = 2d000000, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 000000002d000000
!	%l6 = 0000000000008f2f, Mem[0000000010181400] = ffff91b7
	stwa	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00008f2f
!	%l2 = 0000000000000000, Mem[0000000010041408] = 0000b0cc
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l1 = 000000000000006b, Mem[0000000010141410] = ff91ffff000000ff
	stxa	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000000000006b
!	Mem[0000000010081410] = 000000ff, %l0 = 000000000000002d
	swapa	[%i2+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000021800100] = 0094a020
	sth	%l2,[%o3+0x100]		! Mem[0000000021800100] = 0000a020
!	Mem[00000000100c141f] = 000000ff, %l1 = 000000000000006b
	ldstuba	[%i3+0x01f]%asi,%l1	! %l1 = 00000000000000ff
!	%f2  = 8f2fffff, Mem[0000000030141408] = ff00ff09
	sta	%f2 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 8f2fffff
!	%l3 = 000000002d000000, Mem[00000000201c0000] = 002dfea0
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 0000fea0
!	%l5 = 0000000000000000, Mem[0000000010041410] = 6a000000
	stwa	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff9d6fff, %l3 = 000000002d000000
	ldswa	[%i0+%o4]0x80,%l3	! %l3 = ffffffffff9d6fff
!	Mem[00000000100c1400] = 215c7aba, %f2  = 8f2fffff
	lda	[%i3+%g0]0x80,%f2 	! %f2 = 215c7aba
!	%l6 = 0000000000008f2f, %l1 = 00000000000000ff, %l2 = 0000000000000000
	sdivx	%l6,%l1,%l2		! %l2 = 000000000000008f
!	Mem[0000000010101408] = 00001de1, %f6  = 6876153a
	ld	[%i4+%o4],%f6 		! %f6 = 00001de1
!	%l0 = 00000000000000ff, immd = fffffc6c, %y  = 975a34ac
	umul	%l0,-0x394,%l6		! %l6 = 000000fefffc6f94, %y = 000000fe
!	Mem[0000000010041408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181428] = 0d0e2d66, %l6 = 000000fefffc6f94
	ldsh	[%i6+0x028],%l6		! %l6 = 0000000000000d0e
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	ldsh	[%i1+%o5],%l4		! %l4 = 0000000000000000
!	Mem[0000000010181410] = f7b9e2ab561dcbbd, %f22 = 092b4054 464f0516
	ldda	[%i6+%o5]0x80,%f22	! %f22 = f7b9e2ab 561dcbbd
!	%l3 = ffffffffff9d6fff, %l5 = 0000000000000000, %l3 = ffffffffff9d6fff
	andn	%l3,%l5,%l3		! %l3 = ffffffffff9d6fff

p0_label_121:
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000030001408] = ffff2f8f ffffffff
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff 000000ff
!	Code Fragment 4, seed = 681504
p0_fragment_8:
!	%l0 = 00000000000000ff
	setx	0x2f9edef53d846726,%g7,%l0 ! %l0 = 2f9edef53d846726
!	%l1 = 00000000000000ff
	setx	0xae0bc3e26bc36b51,%g7,%l1 ! %l1 = ae0bc3e26bc36b51
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2f9edef53d846726
	setx	0x0e77ff947546d38c,%g7,%l0 ! %l0 = 0e77ff947546d38c
!	%l1 = ae0bc3e26bc36b51
	setx	0x249edc8919bea2d7,%g7,%l1 ! %l1 = 249edc8919bea2d7
p0_fragment_8_end:
!	Mem[0000000010041410] = 00000000e5581b14, %l7 = 0000000000000000, %l3 = ffffffffff9d6fff
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l7,%l3	! %l3 = 00000000e5581b14
!	%f16 = 2f5c7aba 233d13a3, Mem[0000000030081408] = 8f2fffff ffffffff
	stda	%f16,[%i2+%o4]0x81	! Mem[0000000030081408] = 2f5c7aba 233d13a3
!	Mem[0000000010081410] = 2d000000, %l0 = 000000007546d38c
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 000000002d000000
!	%l7 = 0000000000000000, Mem[0000000010081400] = 00000000
	stha	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%f0  = 649fe11d 08b00000, Mem[0000000030041400] = 00e40000 00000000
	stda	%f0 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 649fe11d 08b00000
!	%l1 = 249edc8919bea2d7, Mem[0000000030181410] = 000000ff
	stwa	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 19bea2d7
!	%l2 = 000000000000008f, Mem[00000000300c1400] = ff000000
	stha	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 008f0000
!	%f22 = f7b9e2ab 561dcbbd, Mem[0000000010141410] = 00000000 6b000000
	stda	%f22,[%i5+%o5]0x88	! Mem[0000000010141410] = f7b9e2ab 561dcbbd

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff009dce, %l5 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081400] = 649fe11d, %l0 = 000000002d000000
	ldswa	[%i2+%g0]0x81,%l0	! %l0 = 00000000649fe11d
!	Mem[0000000030101408] = 8f2fffff, %f7  = 106db423
	lda	[%i4+%o4]0x81,%f7 	! %f7 = 8f2fffff
!	Mem[0000000010001410] = 009c2e30, %l7 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l7	! %l7 = 00000000009c2e30
!	%l0 = 00000000649fe11d, %l5 = 00000000000000ff, %l6 = 0000000000000d0e
	xnor	%l0,%l5,%l6		! %l6 = ffffffff9b601e1d
!	Mem[00000000300c1408] = 2f8f2e30, %l0 = 00000000649fe11d
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = 0000000000002f8f
!	Mem[0000000010181410] = f7b9e2ab, %l1 = 249edc8919bea2d7
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = fffffffffffffff7
!	Mem[0000000030041408] = 0000b0ff, %l7 = 00000000009c2e30
	ldsha	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffffb0ff
!	Mem[0000000030001400] = 00000000, %f7  = 8f2fffff
	lda	[%i0+%g0]0x89,%f7 	! %f7 = 00000000
!	Mem[0000000021800140] = ffad0250, %l0 = 0000000000002f8f, %asi = 80
	ldsba	[%o3+0x140]%asi,%l0	! %l0 = ffffffffffffffff

p0_label_123:
!	Starting 10 instruction Store Burst
!	%l6 = ffffffff9b601e1d, Mem[0000000010101410] = 2f8f2e300000ff00
	stxa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff9b601e1d
!	%f31 = 00000000, %f9  = 7762edb9, %f28 = 25adef32 21118b3b
	fsmuld	%f31,%f9 ,%f28		! %f28 = 00000000 00000000
!	%l0 = ffffffffffffffff, Mem[0000000030181408] = 7f71058f
	stwa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff
!	Mem[0000000010081410] = 8cd34675, %l6 = 000000009b601e1d
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 000000008cd34675
!	%l1 = fffffffffffffff7, Mem[0000000030001400] = 00000000
	stha	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = fff70000
!	Mem[0000000010101410] = 1d1e609b, %l1 = 00000000fffffff7
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 000000001d1e609b
!	%l6 = 8cd34675, %l7 = ffffb0ff, Mem[0000000030181408] = ffffffff 74f7fd4a
	stda	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 8cd34675 ffffb0ff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030081408] = ba7a5c2f a3133d23
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 000000ff
!	Mem[00000000211c0000] = fffff930, %l7 = ffffffffffffb0ff
	ldstub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	%f16 = 2f5c7aba 233d13a3, Mem[0000000010181408] = 00001d00 44000000
	stda	%f16,[%i6+%o4]0x88	! Mem[0000000010181408] = 2f5c7aba 233d13a3

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041434] = 000000e5, %l4 = 0000000000000000, %asi = 80
	lduba	[%i1+0x034]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = 009c2e30, %f8  = 08aaf1c8
	lda	[%i0+%o5]0x80,%f8 	! %f8 = 009c2e30
!	Mem[00000000211c0000] = fffff930, %l6 = 000000008cd34675, %asi = 80
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Code Fragment 4, seed = 867549
p0_fragment_9:
!	%l0 = ffffffffffffffff
	setx	0x185290db3011fe3e,%g7,%l0 ! %l0 = 185290db3011fe3e
!	%l1 = 000000001d1e609b
	setx	0x07c33dc319fd36e9,%g7,%l1 ! %l1 = 07c33dc319fd36e9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 185290db3011fe3e
	setx	0x2b8463ddaaf0aba4,%g7,%l0 ! %l0 = 2b8463ddaaf0aba4
!	%l1 = 07c33dc319fd36e9
	setx	0xf70aaefd0634df6f,%g7,%l1 ! %l1 = f70aaefd0634df6f
p0_fragment_9_end:
!	Mem[0000000010141400] = 00005eda, %l0 = 2b8463ddaaf0aba4
	ldsha	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 0aff0000 000002e1, %l2 = 0000008f, %l3 = e5581b14
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 00000000000002e1 000000000aff0000
!	Mem[0000000010101400] = 464f0516, %l0 = 0000000000000000
	lduwa	[%i4+%g0]0x88,%l0	! %l0 = 00000000464f0516
!	Mem[0000000030001408] = 000000ff000000ff, %l3 = 000000000aff0000
	ldxa	[%i0+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010181438] = 25adef32 21118b3b, %l6 = 0000ffff, %l7 = 000000ff, %asi = 80
	ldda	[%i6+0x038]%asi,%l6	! %l6 = 0000000025adef32 0000000021118b3b
!	Mem[0000000010041408] = 00000000 8ac60270, %l0 = 464f0516, %l1 = 0634df6f
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000 000000008ac60270

p0_label_125:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 000002e1, %l2 = 00000000000002e1
	ldstuba	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000e1
!	Mem[0000000030001410] = ff000000, %l1 = 000000008ac60270
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l6 = 0000000025adef32, Mem[00000000300c1410] = 0000000000000075
	stxa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000025adef32
!	%l2 = 00000000000000e1, Mem[00000000300c1408] = 302e8f2f
	stwa	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000e1
!	Mem[0000000030181408] = 7546d38c, %l7 = 0000000021118b3b
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 000000000000008c
!	%f8  = 009c2e30 7762edb9, Mem[0000000010101410] = f7ffffff ffffffff
	stda	%f8 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 009c2e30 7762edb9
!	%l7 = 000000000000008c, Mem[000000001014141d] = 7a4d3a10, %asi = 80
	stba	%l7,[%i5+0x01d]%asi	! Mem[000000001014141c] = 7a8c3a10
!	%f17 = 233d13a3, Mem[00000000100c1404] = 233d13a3
	st	%f17,[%i3+0x004]	! Mem[00000000100c1404] = 233d13a3
!	Mem[0000000010041410] = 00000000, %l7 = 000000000000008c
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%l3 = 000000ff000000ff, Mem[00000000100c1408] = 00000924
	stba	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000009ff

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = a3133d23ba7a5c2f, %l3 = 000000ff000000ff
	ldxa	[%i6+%o4]0x80,%l3	! %l3 = a3133d23ba7a5c2f
!	Mem[0000000030001408] = 000000ff, %l3 = a3133d23ba7a5c2f
	ldsba	[%i0+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081410] = 1d1e609b, %l7 = 0000000000000000, %asi = 80
	ldswa	[%i2+0x010]%asi,%l7	! %l7 = 000000001d1e609b
!	Mem[0000000010181400] = 2f8f0000 000000ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 000000002f8f0000 00000000000000ff
!	Mem[0000000010141400] = da5e0000, %l4 = 0000000000000000
	lduba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = ffff1c00, %l0 = 000000002f8f0000
	ldsba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 0000fea0, %l4 = 0000000000000000, %asi = 80
	lduba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081428] = 08b0ff50, %l5 = 00000000000000ff
	lduw	[%i2+0x028],%l5		! %l5 = 0000000008b0ff50
!	Mem[0000000010001420] = e5000000 23a40000, %l0 = 00000000, %l1 = 000000ff
	ldd	[%i0+0x020],%l0		! %l0 = 00000000e5000000 0000000023a40000
!	Mem[0000000030141408] = 8f2fffff, %l3 = ffffffffffffffff
	lduha	[%i5+%o4]0x81,%l3	! %l3 = 0000000000008f2f

p0_label_127:
!	Starting 10 instruction Store Burst
!	%l6 = 25adef32, %l7 = 1d1e609b, Mem[0000000010101410] = b9ed6277 302e9c00, %asi = 80
	stda	%l6,[%i4+0x010]%asi	! Mem[0000000010101410] = 25adef32 1d1e609b
!	%f30 = ff09eabe 00000000, %l0 = 00000000e5000000
!	Mem[0000000030001418] = 6876153a106db423
	add	%i0,0x018,%g1
	stda	%f30,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030001418] = 6876153a106db423
!	%l4 = 0000000000000000, Mem[0000000010041410] = 000000ff
	stha	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l4 = 0000000000000000, imm = fffffffffffff5e3, %l7 = 000000001d1e609b
	xor	%l4,-0xa1d,%l7		! %l7 = fffffffffffff5e3
!	Mem[0000000010041420] = 6f7805f8, %l4 = 00000000, %l6 = 25adef32
	add	%i1,0x20,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 000000006f7805f8
!	Mem[0000000030001410] = ff0000ff, %l0 = 00000000e5000000
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 00000000ff0000ff
!	Mem[00000000300c1400] = 00008f00, %l5 = 0000000008b0ff50
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%f28 = 00000000, Mem[00000000100c1408] = ff090000
	sta	%f28,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l2 = 000000e1, %l3 = 00008f2f, Mem[0000000010181410] = f7b9e2ab 561dcbbd
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000e1 00008f2f
!	%l1 = 0000000023a40000, Mem[0000000010001410] = 009c2e30
	stwa	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = 23a40000

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000000000e1, %l0 = 00000000ff0000ff
	ldxa	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000e1
!	Mem[0000000020800000] = 9cff80d0, %l7 = fffffffffffff5e3
	lduh	[%o1+%g0],%l7		! %l7 = 0000000000009cff
!	Mem[0000000030181400] = 0000b0cc, %l1 = 0000000023a40000
	lduha	[%i6+%g0]0x89,%l1	! %l1 = 000000000000b0cc
!	Mem[0000000010141410] = bdcb1d56, %l6 = 000000006f7805f8
	lduha	[%i5+%o5]0x80,%l6	! %l6 = 000000000000bdcb
!	Mem[0000000010141400] = 00005eda000000e4, %l6 = 000000000000bdcb
	ldxa	[%i5+%g0]0x80,%l6	! %l6 = 00005eda000000e4
!	Mem[00000000300c1410] = 32efad2500000000, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = 32efad2500000000
!	Mem[0000000010081408] = 00005eda, %l0 = 00000000000000e1
	lduha	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 00001de1ffff0000, %f22 = f7b9e2ab 561dcbbd
	ldda	[%i4+%o4]0x80,%f22	! %f22 = 00001de1 ffff0000
!	Mem[0000000030081410] = 00000000, %l2 = 00000000000000e1
	ldswa	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[000000001008141c] = 5e72e558, %l0 = 0000000000000000
	ldsw	[%i2+0x01c],%l0		! %l0 = 000000005e72e558

p0_label_129:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 16054f46, %l3 = 0000000000008f2f
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 0000000016054f46
!	%l2 = 00000000, %l3 = 16054f46, Mem[00000000100c1410] = 0000b0cc 21b0ee42, %asi = 80
	stda	%l2,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00000000 16054f46
!	%l1 = 000000000000b0cc, Mem[0000000010001410] = 23a40000
	stha	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = b0cc0000
!	%l4 = 32efad2500000000, Mem[0000000010001400] = ff020000
	stha	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%f2  = 215c7aba ffffffff, Mem[0000000010041408] = 00000000 8ac60270
	stda	%f2 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 215c7aba ffffffff
!	Mem[00000000211c0001] = fffff930, %l3 = 0000000016054f46
	ldstub	[%o2+0x001],%l3		! %l3 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stwa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010141408] = 00000000
	stba	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[0000000010101419] = 957aa550, %l4 = 32efad2500000000
	ldstub	[%i4+0x019],%l4		! %l4 = 000000000000007a
!	%l4 = 000000000000007a, Mem[0000000010101408] = e11d0000
	stha	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = e11d007a

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l1 = 000000000000b0cc
	lduha	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = 1d1e609b, %l7 = 0000000000009cff
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = 000000000000001d
!	Mem[0000000030041410] = 8f91ff02, %f1  = 08b00000
	lda	[%i1+%o5]0x89,%f1 	! %f1 = 8f91ff02
!	Mem[0000000010001400] = 00000000, %l4 = 000000000000007a
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[000000001010141c] = 394915e1, %f14 = 689d3712
	lda	[%i4+0x01c]%asi,%f14	! %f14 = 394915e1
!	Mem[0000000030141408] = ffff2f8f, %l2 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l2	! %l2 = 00000000ffff2f8f
!	Mem[0000000030141410] = 001cffff, %l5 = 0000000000000000
	lduba	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Randomly selected nop
	nop
!	Mem[0000000010141400] = 00005eda000000e4, %f8  = 009c2e30 7762edb9
	ldda	[%i5+%g0]0x80,%f8 	! %f8  = 00005eda 000000e4
!	Mem[00000000100c1410] = 464f051600000000, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = 464f051600000000

p0_label_131:
!	Starting 10 instruction Store Burst
!	%f28 = 00000000 00000000, Mem[0000000010081400] = 00000000 1de19f64
	stda	%f28,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 00000000
!	%f8  = 00005eda 000000e4, Mem[00000000300c1410] = 00000000 32efad25
	stda	%f8 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00005eda 000000e4
!	Mem[0000000010141410] = bdcb1d56, %l2 = 00000000ffff2f8f
	ldstuba	[%i5+%o5]0x80,%l2	! %l2 = 00000000000000bd
!	%l5 = 0000000000000000, Mem[0000000010141400] = 00005eda000000e4
	stx	%l5,[%i5+%g0]		! Mem[0000000010141400] = 0000000000000000
!	%l6 = 00005eda000000e4, Mem[0000000030181400] = ccb00000
	stwa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000e4
!	%l6 = 00005eda000000e4, Mem[0000000030041408] = ffb00000
	stba	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = e4b00000
!	%f1  = 8f91ff02, Mem[0000000030181410] = 19bea2d7
	sta	%f1 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 8f91ff02
!	%f25 = 21b0ee42, Mem[0000000030141410] = ffff1c00
	sta	%f25,[%i5+%o5]0x89	! Mem[0000000030141410] = 21b0ee42
!	%l4 = 464f051600000000, Mem[0000000030101400] = 649fe11d
	stba	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 009fe11d
!	%f6  = 00001de1, Mem[0000000030181408] = 7546d3ff
	sta	%f6 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 00001de1

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 32efad25, %l2 = 00000000000000bd
	ldswa	[%i4+%o5]0x88,%l2	! %l2 = 0000000032efad25
!	Mem[0000000010081408] = da5e0000, %l0 = 000000005e72e558
	ldswa	[%i2+%o4]0x88,%l0	! %l0 = ffffffffda5e0000
!	Mem[0000000010181420] = 000000ff, %l3 = 00000000000000ff
	ldsh	[%i6+0x020],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041400] = 0000000062ba4207, %f28 = 00000000 00000000, %asi = 80
	ldda	[%i1+0x000]%asi,%f28	! %f28 = 00000000 62ba4207
!	Mem[0000000010101408] = e11d007a, %l1 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l1	! %l1 = 000000000000007a
!	Mem[000000001000140c] = ffff1c00, %l4 = 464f051600000000, %asi = 80
	lduwa	[%i0+0x00c]%asi,%l4	! %l4 = 00000000ffff1c00
!	Mem[0000000010101408] = e11d007a, %l7 = 000000000000001d
	ldsha	[%i4+%o4]0x88,%l7	! %l7 = 000000000000007a
!	Mem[0000000010081408] = da5e0000, %l4 = 00000000ffff1c00
	lduwa	[%i2+%o4]0x88,%l4	! %l4 = 00000000da5e0000
!	Mem[0000000010101410] = 25adef32, %l2 = 0000000032efad25
	lduba	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000025
!	Mem[0000000010101438] = 000000ff, %f11 = ba7a5c21
	lda	[%i4+0x038]%asi,%f11	! %f11 = 000000ff

p0_label_133:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010101410] = 32efad25
	stha	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 32ef0000
!	Mem[0000000010141438] = 6c7eb0cc, %l0 = da5e0000, %l7 = 0000007a
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 000000006c7eb0cc
!	Mem[0000000030101400] = 0000b008 1de19f00, %l2 = 00000025, %l3 = 00000000
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 000000001de19f00 000000000000b008
!	%l5 = 0000000000000000, Mem[00000000100c1400] = 215c7aba
	stha	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00007aba
!	%f6  = 00001de1 00000000, Mem[0000000010181400] = 00008f2f ff000000
	stda	%f6 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 00001de1 00000000
!	Mem[0000000030101400] = 009fe11d, %l1 = 000000000000007a
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%f2  = 215c7aba ffffffff, %l1 = 0000000000000000
!	Mem[0000000010001418] = 63e3400d7a4d3a10
	add	%i0,0x018,%g1
	stda	%f2,[%g1+%l1]ASI_PST32_P ! Mem[0000000010001418] = 63e3400d7a4d3a10
!	%f28 = 00000000 62ba4207, Mem[0000000010101408] = e11d007a 0000ffff
	stda	%f28,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 62ba4207
!	%l4 = 00000000da5e0000, Mem[0000000021800180] = 23a4e080, %asi = 80
	stha	%l4,[%o3+0x180]%asi	! Mem[0000000021800180] = 0000e080

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = fffff930, %l7 = 000000006c7eb0cc, %asi = 80
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010101410] = 32ef0000, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 0000f7ff, %f23 = ffff0000
	lda	[%i0+%g0]0x89,%f23	! %f23 = 0000f7ff
!	Mem[0000000030141410] = 21b0ee42, %l3 = 000000000000b008
	lduwa	[%i5+%o5]0x89,%l3	! %l3 = 0000000021b0ee42
!	Mem[0000000010081408] = 00000000da5e0000, %l0 = ffffffffda5e0000
	ldxa	[%i2+%o4]0x88,%l0	! %l0 = 00000000da5e0000
!	%l6 = 00005eda000000e4, %l6 = 00005eda000000e4, %l7 = 000000000000ffff
	orn	%l6,%l6,%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030081408] = 00000000, %l7 = ffffffffffffffff
	lduwa	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 0000b0e4, %l4 = 00000000da5e0000
	ldswa	[%i1+%o4]0x89,%l4	! %l4 = 000000000000b0e4
!	Mem[0000000010181408] = a3133d23, %f2  = 215c7aba
	lda	[%i6+%o4]0x80,%f2 	! %f2 = a3133d23
!	Mem[0000000030001410] = 000000e5, %l1 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_135:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030001408] = ff000000ff000000
	stxa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010101400] = 00008f2f61fa4e7f
	stx	%l5,[%i4+%g0]		! Mem[0000000010101400] = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%f13 = ffff0000, Mem[00000000100c1408] = 00000000
	sta	%f13,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffff0000
!	%l1 = 0000000000000000, Mem[00000000300c1410] = 000000e4
	stba	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l1 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stha	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	%f27 = 00000075, Mem[00000000100c1414] = 16054f46
	sta	%f27,[%i3+0x014]%asi	! Mem[00000000100c1414] = 00000075
!	Mem[0000000010181438] = 25adef3221118b3b, %l5 = 0000000000000000, %l1 = 0000000000000000
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 25adef3221118b3b
!	Mem[0000000010041400] = 00000000 62ba4207 215c7aba ffffffff
!	%f0  = 649fe11d 8f91ff02 a3133d23 ffffffff
!	%f4  = 2d000000 00000924 00001de1 00000000
!	%f8  = 00005eda 000000e4 a3133d23 000000ff
!	%f12 = 00001de1 ffff0000 394915e1 5e05479b
	stda	%f0 ,[%i1+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	Mem[00000000211c0000] = fffff930, %l3 = 0000000021b0ee42
	ldstub	[%o2+%g0],%l3		! %l3 = 00000000000000ff

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 0000f7ff, %l3 = 00000000000000ff
	lduha	[%i0+%g0]0x89,%l3	! %l3 = 000000000000f7ff
!	%l0 = 00000000da5e0000, imm = fffffffffffffb05, %l7 = 0000000000000000
	add	%l0,-0x4fb,%l7		! %l7 = 00000000da5dfb05
!	Mem[0000000010101408] = 62ba4207, %l0 = 00000000da5e0000
	lduha	[%i4+%o4]0x88,%l0	! %l0 = 0000000000004207
!	Mem[0000000030081400] = 649fe11d08b00000, %f16 = 2f5c7aba 233d13a3
	ldda	[%i2+%g0]0x81,%f16	! %f16 = 649fe11d 08b00000
!	Mem[0000000010141408] = 00000000, %l7 = 00000000da5dfb05
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = a3133d23, %l1 = 25adef3221118b3b
	lduha	[%i6+%o4]0x80,%l1	! %l1 = 000000000000a313
!	Mem[0000000021800001] = 6bffef60, %l2 = 000000001de19f00
	ldub	[%o3+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010101408] = 62ba4207, %l2 = 00000000000000ff
	ldsha	[%i4+%o4]0x88,%l2	! %l2 = 0000000000004207
!	%f1  = 8f91ff02, %f8  = 00005eda, %f25 = 21b0ee42
	fadds	%f1 ,%f8 ,%f25		! tt=0x22, %l0 = 0000000000004229
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010041408] = ffffffff, %l0 = 0000000000004229
	ldsha	[%i1+%o4]0x88,%l0	! %l0 = ffffffffffffffff

p0_label_137:
!	Starting 10 instruction Store Burst
!	%f18 = dbfebd08, Mem[0000000010001408] = ff9d6fff
	sta	%f18,[%i0+%o4]0x80	! Mem[0000000010001408] = dbfebd08
!	%f4  = 2d000000 00000924, Mem[0000000030081400] = 649fe11d 08b00000
	stda	%f4 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 2d000000 00000924
!	%l2 = 0000000000004207, immd = 000007be, %y  = 000000fe
	sdiv	%l2,0x7be,%l7		! %l7 = 0000000020cea8fa
	mov	%l0,%y			! %y = ffffffff
!	Mem[0000000030101400] = ff9fe11d, %l2 = 0000000000004207
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 0000f7ff, Mem[00000000300c1400] = 00008fff ab6b725e
	stda	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff 0000f7ff
!	%l7 = 0000000020cea8fa, Mem[0000000010001408] = dbfebd08
	stha	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = a8fabd08
!	%f16 = 649fe11d 08b00000, %l3 = 000000000000f7ff
!	Mem[0000000030001418] = 6876153a106db423
	add	%i0,0x018,%g1
	stda	%f16,[%g1+%l3]ASI_PST32_S ! Mem[0000000030001418] = 649fe11d08b00000
!	%l5 = 0000000000000000, Mem[0000000010041400] = 02ff918f1de19f64
	stxa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000
!	%f14 = 394915e1 5e05479b, Mem[0000000010141400] = 00000000 00000000
	stda	%f14,[%i5+%g0]0x80	! Mem[0000000010141400] = 394915e1 5e05479b
!	Mem[0000000030141410] = 21b0ee42, %l0 = ffffffffffffffff
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000042

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 0000000000000000, %l2 = 00000000000000ff, %asi = 80
	ldxa	[%i1+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 00007aba, %l6 = 00005eda000000e4
	ldswa	[%i3+%g0]0x80,%l6	! %l6 = 0000000000007aba
!	Mem[0000000020800000] = 9cff80d0, %l2 = 0000000000000000, %asi = 80
	ldsba	[%o1+0x000]%asi,%l2	! %l2 = ffffffffffffff9c
!	Mem[0000000010041414] = 0000002d, %l7 = 0000000020cea8fa, %asi = 80
	ldswa	[%i1+0x014]%asi,%l7	! %l7 = 000000000000002d
!	Mem[00000000211c0000] = fffff930, %l5 = 0000000000000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010041400] = 00000000, %l4 = 000000000000b0e4
	lduwa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = e1154939, %l2 = ffffffffffffff9c
	ldsba	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000039
!	Mem[0000000010081410] = 9b601e1d, %l0 = 0000000000000042
	ldsha	[%i2+%o5]0x88,%l0	! %l0 = 0000000000001e1d
!	Mem[0000000010181410] = 2f8f0000e1000000, %f30 = ff09eabe 00000000
	ldda	[%i6+%o5]0x88,%f30	! %f30 = 2f8f0000 e1000000
!	Mem[00000000300c1400] = ff000000, %l7 = 000000000000002d
	lduha	[%i3+%g0]0x81,%l7	! %l7 = 000000000000ff00

p0_label_139:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000007aba, Mem[0000000010101404] = 00000000
	stb	%l6,[%i4+0x004]		! Mem[0000000010101404] = ba000000
!	%f30 = 2f8f0000, Mem[0000000030001408] = 00000000
	sta	%f30,[%i0+%o4]0x81	! Mem[0000000030001408] = 2f8f0000
!	%l6 = 00007aba, %l7 = 0000ff00, Mem[0000000010181400] = 00000000 e11d0000
	std	%l6,[%i6+%g0]		! Mem[0000000010181400] = 00007aba 0000ff00
!	%l4 = 00000000, %l5 = 0000ffff, Mem[0000000030001400] = 0000f7ff 0000b008
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 0000ffff
!	%f22 = 00001de1, Mem[0000000010001408] = a8fabd08
	st	%f22,[%i0+%o4]		! Mem[0000000010001408] = 00001de1
!	%l1 = 000000000000a313, Mem[0000000010081408] = 00005eda
	stha	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = a3135eda
!	%f22 = 00001de1, Mem[0000000010041410] = 24090000
	sta	%f22,[%i1+%o5]0x80	! Mem[0000000010041410] = 00001de1
!	Mem[0000000030141400] = ff009dce, %l1 = 000000000000a313
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 00000000ff009dce
!	Mem[0000000030101410] = ff000000, %l5 = 000000000000ffff
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	%l0 = 00001e1d, %l1 = ff009dce, Mem[00000000100c1410] = 00000000 75000000
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00001e1d ff009dce

p0_label_140:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 000000e5, %l4 = 0000000000000000
	ldsba	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 00007aba 233d13a3, %l4 = 00000000, %l5 = ff000000
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 0000000000007aba 00000000233d13a3
!	Mem[0000000010081408] = a3135eda, %f5  = 00000924
	lda	[%i2+%o4]0x80,%f5 	! %f5 = a3135eda
!	%f13 = ffff0000, %f25 = 21b0ee42, %f10 = a3133d23
	fsubs	%f13,%f25,%f10		! %f10 = ffff0000
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000030101400] = ff9fe11d 08b00000 8f2fffff ffffffff
!	Mem[0000000030101410] = 0000ffff 00000924 6876153a 106db423
!	Mem[0000000030101420] = 08aaf1c8 7762edb9 5b7106c2 61fa4e7f
!	Mem[0000000030101430] = 00001de1 ffff0000 689d3712 5e05479b
	ldda	[%i4+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000010041400] = 00000000 00000000 ffffffff 233d13a3
!	Mem[0000000010041410] = 00001de1 0000002d 00000000 e11d0000
!	Mem[0000000010041420] = e4000000 da5e0000 ff000000 233d13a3
!	Mem[0000000010041430] = 0000ffff e11d0000 9b47055e e1154939
	ldda	[%i1+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010041400
!	Mem[00000000211c0000] = fffff930, %l5 = 00000000233d13a3, %asi = 80
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030141410] = 21b0eeff, %l0 = 0000000000001e1d
	ldsha	[%i5+%o5]0x89,%l0	! %l0 = ffffffffffffeeff
!	Mem[0000000021800040] = 3f6a6190, %l4 = 0000000000007aba
	ldub	[%o3+0x040],%l4		! %l4 = 000000000000003f
!	Mem[0000000030001400] = 00000000, %l4 = 000000000000003f
	lduwa	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000

p0_label_141:
!	Starting 10 instruction Store Burst
!	%f16 = 00000000, %f9  = 000000e4, %f3  = ffffffff
	fmuls	%f16,%f9 ,%f3 		! %f3  = 00000000
!	%f18 = ffffffff, Mem[0000000010181418] = 652c395a
	sta	%f18,[%i6+0x018]%asi	! Mem[0000000010181418] = ffffffff
!	%l6 = 0000000000007aba, Mem[0000000030001400] = 00000000
	stha	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00007aba
!	Mem[0000000030041400] = 1de19f64, %l6 = 0000000000007aba
	swapa	[%i1+%g0]0x89,%l6	! %l6 = 000000001de19f64
!	%l0 = ffffffffffffeeff, Mem[0000000030141410] = 21b0eeff
	stba	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 21b0eeff
!	Mem[0000000010101410] = 32ef0000, %l0 = ffffffffffffeeff
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = e1154939, %l7 = 000000000000ff00
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 00000000e1154939
!	%l6 = 000000001de19f64, Mem[0000000030141410] = ce9d6fff21b0eeff
	stxa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000001de19f64
!	%l3 = 000000000000f7ff, Mem[00000000211c0001] = fffff930, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = fffff930
!	Mem[000000001000141c] = 7a4d3a10, %l4 = 0000000000000000
	swap	[%i0+0x01c],%l4		! %l4 = 000000007a4d3a10

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 8f91ff02, %l7 = 00000000e1154939
	lduwa	[%i1+%o5]0x89,%l7	! %l7 = 000000008f91ff02
!	Mem[0000000010181408] = 2f5c7aba233d13a3, %f4  = 2d000000 a3135eda
	ldda	[%i6+%o4]0x88,%f4 	! %f4  = 2f5c7aba 233d13a3
!	Mem[0000000010101403] = 00000000, %l7 = 000000008f91ff02, %asi = 80
	lduba	[%i4+0x003]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = e11d0000, %l1 = 00000000ff009dce
	ldswa	[%i6+%o4]0x81,%l1	! %l1 = ffffffffe11d0000
!	Mem[0000000030081410] = 00000000, %l4 = 000000007a4d3a10
	lduwa	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181428] = 0d0e2d6670ce601f, %f12 = 00001de1 ffff0000
	ldd	[%i6+0x028],%f12	! %f12 = 0d0e2d66 70ce601f
!	Mem[0000000030001408] = 0000000000008f2f, %l2 = 0000000000000039
	ldxa	[%i0+%o4]0x89,%l2	! %l2 = 0000000000008f2f
!	Mem[00000000300c1408] = 000000e1, %l5 = 000000000000ffff
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 00000000000000e1
!	Mem[0000000020800000] = 9cff80d0, %l7 = 0000000000000000
	ldub	[%o1+%g0],%l7		! %l7 = 000000000000009c
!	Mem[0000000010041402] = 00000000, %l5 = 00000000000000e1
	ldsh	[%i1+0x002],%l5		! %l5 = 0000000000000000

p0_label_143:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 00000000, %l6 = 000000001de19f64
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%l2 = 0000000000008f2f, Mem[0000000030141410] = 000000001de19f64
	stxa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000008f2f
!	Code Fragment 4, seed = 220413
p0_fragment_10:
!	%l0 = 0000000000000000
	setx	0x0231a86f5d1b1d3e,%g7,%l0 ! %l0 = 0231a86f5d1b1d3e
!	%l1 = ffffffffe11d0000
	setx	0x8afd766b466825e9,%g7,%l1 ! %l1 = 8afd766b466825e9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0231a86f5d1b1d3e
	setx	0x809480d6b9546aa4,%g7,%l0 ! %l0 = 809480d6b9546aa4
!	%l1 = 8afd766b466825e9
	setx	0x971e7a9361786e6f,%g7,%l1 ! %l1 = 971e7a9361786e6f
p0_fragment_10_end:
!	Mem[0000000030041410] = 02ff918f, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000002
!	%l6 = 0000000000000002, Mem[0000000020800040] = f38f7f00, %asi = 80
	stha	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 00027f00
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l6 = 0000000000000002
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000000, Mem[00000000211c0000] = fffff930, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000f930
!	Mem[0000000030041410] = ffff918f, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 00000000ffff918f
!	%l0 = 809480d6b9546aa4, Mem[0000000010081408] = a3135eda
	stwa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = b9546aa4

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff000000 fff70000 e1000000 00000000
!	Mem[00000000300c1410] = 00000000 da5e0000 652c395a 443633c3
!	Mem[00000000300c1420] = 35cd2ee8 74038259 0d0e2d66 70ce601f
!	Mem[00000000300c1430] = 092b4054 50a57a95 25adef32 21118b3b
	ldda	[%i3+%g0]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010001400] = 000000000000ff0a, %f0  = 649fe11d 8f91ff02
	ldda	[%i0+%g0]0x80,%f0 	! %f0  = 00000000 0000ff0a
!	Mem[0000000030041400] = ba7a0000, %l4 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffffffba
!	Mem[0000000010101400] = 000000ff, %l5 = 00000000ffff918f
	ldswa	[%i4+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l0 = 809480d6b9546aa4, imm = 000000000000000f, %l0 = 809480d6b9546aa4
	sub	%l0,0x00f,%l0		! %l0 = 809480d6b9546a95
!	Mem[0000000030001400] = ba7a0000, %l7 = 000000000000009c
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffffffba
!	Mem[0000000030041400] = 00007aba, %l5 = 00000000000000ff
	ldsha	[%i1+%g0]0x89,%l5	! %l5 = 0000000000007aba
!	Mem[00000000300c1410] = 00000000, %l5 = 0000000000007aba
	lduwa	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	%l3 = 000000000000f7ff, %l7 = ffffffffffffffba, %y  = ffffffff
	sdiv	%l3,%l7,%l2		! %l2 = 0000000003a836f8
	mov	%l0,%y			! %y = b9546a95
!	Mem[0000000030041410] = 00000000, %l7 = ffffffffffffffba
	lduba	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_145:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 00007aba, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ba
!	Mem[00000000100c142d] = 7002c68a, %l0 = 809480d6b9546a95
	ldstub	[%i3+0x02d],%l0		! %l0 = 0000000000000002
!	Mem[0000000010101418] = 95ffa550, %l2 = 0000000003a836f8
	ldstub	[%i4+0x018],%l2		! %l2 = 0000000000000095
!	%l4 = ffffffba, %l5 = 000000ba, Mem[0000000010101400] = 000000ff 000000ba
	stda	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffba 000000ba
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010101430] = 8bcf907d 00000000
	std	%l6,[%i4+0x030]		! Mem[0000000010101430] = 00000000 00000000
!	Code Fragment 4, seed = 536918
p0_fragment_11:
!	%l0 = 0000000000000002
	setx	0x25235ed71a952376,%g7,%l0 ! %l0 = 25235ed71a952376
!	%l1 = 971e7a9361786e6f
	setx	0x664f492f97e9b6a1,%g7,%l1 ! %l1 = 664f492f97e9b6a1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 25235ed71a952376
	setx	0x3dc86be99ef97ddc,%g7,%l0 ! %l0 = 3dc86be99ef97ddc
!	%l1 = 664f492f97e9b6a1
	setx	0xccba1f5e09fb7c27,%g7,%l1 ! %l1 = ccba1f5e09fb7c27
p0_fragment_11_end:
!	%f23 = 443633c3, Mem[0000000030041400] = ff7a0000
	sta	%f23,[%i1+%g0]0x81	! Mem[0000000030041400] = 443633c3
	membar	#Sync			! Added by membar checker (30)
!	%l3 = 000000000000f7ff, Mem[00000000300c1400] = ff000000
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000
!	Mem[0000000010081403] = 00000000, %l1 = ccba1f5e09fb7c27
	ldstuba	[%i2+0x003]%asi,%l1	! %l1 = 0000000000000000
!	%f7  = 00000000, Mem[00000000100c1408] = ffff0000
	sta	%f7 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffffffff, %l5 = 00000000000000ba, %asi = 80
	ldswa	[%i1+0x008]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1438] = 20d51e6e, %l0 = 3dc86be99ef97ddc, %asi = 80
	lduwa	[%i3+0x038]%asi,%l0	! %l0 = 0000000020d51e6e
!	Mem[0000000030181408] = e11d0000, %l5 = ffffffffffffffff
	lduha	[%i6+%o4]0x81,%l5	! %l5 = 000000000000e11d
!	Mem[0000000030041400] = 443633c3, %l6 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = 00000000443633c3
!	Mem[0000000030081408] = ff000000, %l4 = ffffffffffffffba
	ldswa	[%i2+%o4]0x81,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010041400] = 00000000, %l0 = 0000000020d51e6e
	ldsba	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l3 = 000000000000f7ff
	ldswa	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0001] = 0000f930, %l3 = 0000000000000000
	ldsb	[%o2+0x001],%l3		! %l3 = 0000000000000000
!	Mem[0000000030141400] = 0000a313, %l7 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = c3333644, %f7  = 00000000
	lda	[%i1+%g0]0x89,%f7 	! %f7 = c3333644

p0_label_147:
!	Starting 10 instruction Store Burst
!	%f20 = 00000000 da5e0000, Mem[0000000030041400] = 443633c3 08b00000
	stda	%f20,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 da5e0000
!	%f6  = 00001de1, %f9  = 000000e4
	fcmpes	%fcc0,%f6 ,%f9 		! %fcc0 = 2
!	Mem[000000001018140c] = ba7a5c2f, %l3 = 0000000000000000
	swap	[%i6+0x00c],%l3		! %l3 = 00000000ba7a5c2f
!	Mem[0000000010081400] = 000000ff 00000000 b9546aa4 00000000
!	%f16 = ff000000 fff70000 e1000000 00000000
!	%f20 = 00000000 da5e0000 652c395a 443633c3
!	%f24 = 35cd2ee8 74038259 0d0e2d66 70ce601f
!	%f28 = 092b4054 50a57a95 25adef32 21118b3b
	stda	%f16,[%i2+%g0]ASI_BLK_PL	! Block Store to 0000000010081400
!	%l7 = 0000000000000000, Mem[0000000030101408] = 8f2fffff
	stha	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ffff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030001400] = ba7a0000 ffff0000
	stda	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000010041410] = e11d0000
	stha	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = e11d0000
!	%l4 = ff000000, %l5 = 0000e11d, Mem[0000000030141400] = 0000a313 394915e1
	stda	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = ff000000 0000e11d
!	Code Fragment 3, seed = 95479
p0_fragment_12:
!	%l0 = 0000000000000000
	setx	0xa87e6f4e6b65776e,%g7,%l0 ! %l0 = a87e6f4e6b65776e
!	%l1 = 0000000000000000
	setx	0xf4603ef295532919,%g7,%l1 ! %l1 = f4603ef295532919
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a87e6f4e6b65776e
	setx	0x7a8cf01772f3c6d4,%g7,%l0 ! %l0 = 7a8cf01772f3c6d4
!	%l1 = f4603ef295532919
	setx	0x2bcd5faee150d39f,%g7,%l1 ! %l1 = 2bcd5faee150d39f
p0_fragment_12_end:
!	Mem[0000000030081410] = 000000ff, %l5 = 000000000000e11d
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[000000001014142c] = 86fb313d, %l5 = 00000000000000ff, %asi = 80
	ldsha	[%i5+0x02c]%asi,%l5	! %l5 = ffffffffffff86fb
!	Mem[0000000010001408] = 001cffffe11d0000, %f6  = 00001de1 c3333644
	ldda	[%i0+%o4]0x88,%f6 	! %f6  = 001cffff e11d0000
!	Mem[0000000010141410] = 561dcbff, %l2 = 0000000000000095
	ldsha	[%i5+%o5]0x88,%l2	! %l2 = ffffffffffffcbff
!	Mem[0000000030001410] = 000000e5, %l5 = ffffffffffff86fb
	ldsha	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = 000000e1, %l4 = ffffffffff000000
	ldsba	[%i3+%o4]0x89,%l4	! %l4 = ffffffffffffffe1
!	Mem[0000000010101428] = 0000a423, %l4 = ffffffffffffffe1
	ldub	[%i4+0x028],%l4		! %l4 = 0000000000000000
!	Mem[0000000010101410] = 9b601e1d 32ef00ff, %l6 = 443633c3, %l7 = 00000000
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 0000000032ef00ff 000000009b601e1d
!	Mem[0000000030101400] = ff9fe11d, %l5 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010081428] = 1f60ce70 662d0e0d, %l6 = 32ef00ff, %l7 = 9b601e1d, %asi = 80
	ldda	[%i2+0x028]%asi,%l6	! %l6 = 000000001f60ce70 00000000662d0e0d
!	Mem[0000000021800141] = ffad0250, %l3 = 00000000ba7a5c2f, %asi = 80
	lduba	[%o3+0x141]%asi,%l3	! %l3 = 00000000000000ad

p0_label_149:
!	Starting 10 instruction Store Burst
!	%f19 = 00000000, Mem[0000000030081410] = 1de10000
	sta	%f19,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l2 = ffffffffffffcbff, Mem[0000000030081410] = 00000000
	stba	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	%l2 = ffffffffffffcbff, Mem[00000000100c140c] = 74038259
	sth	%l2,[%i3+0x00c]		! Mem[00000000100c140c] = cbff8259
!	Mem[00000000100c1400] = 00007aba, %l7 = 00000000662d0e0d
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 0000000000007aba
!	Mem[0000000030141410] = 2f8f0000, %l2 = 00000000ffffcbff
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 000000002f8f0000
!	%l6 = 000000001f60ce70, Mem[0000000010041410] = 00001de1
	stwa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 1f60ce70
!	Mem[0000000030141408] = ffff2f8f, %l5 = 00000000000000ff
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 000000000000008f
!	%l2 = 000000002f8f0000, Mem[0000000010081410] = da5e0000
	stha	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = da5e0000
!	%l6 = 000000001f60ce70, Mem[0000000010001408] = e11d0000
	stba	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = e11d0070
!	%l2 = 000000002f8f0000, Mem[0000000030041408] = e4b00000
	stha	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = 6bffef60, %l1 = 2bcd5faee150d39f, %asi = 80
	ldsha	[%o3+0x000]%asi,%l1	! %l1 = 0000000000006bff
!	Mem[0000000030101410] = 0000ffff00000924, %l7 = 0000000000007aba
	ldxa	[%i4+%o5]0x81,%l7	! %l7 = 0000ffff00000924
!	Mem[0000000030181408] = 00001de1, %l7 = 0000ffff00000924
	ldsha	[%i6+%o4]0x89,%l7	! %l7 = 0000000000001de1
!	Mem[00000000201c0000] = 0000fea0, %l1 = 0000000000006bff
	lduh	[%o0+%g0],%l1		! %l1 = 0000000000000000
!	%l5 = 000000000000008f, %l6 = 000000001f60ce70, %l4 = 0000000000000000
	sdivx	%l5,%l6,%l4		! %l4 = 0000000000000000
!	Mem[0000000010041408] = ffffffff, %l4 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	%l1 = 0000000000000000, %l3 = 00000000000000ad, %y  = b9546a95
	umul	%l1,%l3,%l7		! %l7 = 0000000000000000, %y = 00000000
!	Mem[0000000010001408] = e11d0070, %l4 = ffffffffffffffff
	ldsba	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000070
!	Mem[00000000100c1420] = 016a2eb8 2af260e9, %l0 = 72f3c6d4, %l1 = 00000000
	ldd	[%i3+0x020],%l0		! %l0 = 00000000016a2eb8 000000002af260e9
!	Mem[0000000010001420] = e5000000, %l4 = 0000000000000070
	lduw	[%i0+0x020],%l4		! %l4 = 00000000e5000000

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000016a2eb8
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 000000002af260e9
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 000000002f8f0000
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000000000ad
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000e5000000
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000000000008f
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000001f60ce70
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne	%xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00000000,%g2
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
	cmp	%l0,%l1			! %f0  should be 00000000 0000ff0a
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be a3133d23 00000000
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 2f5c7aba 233d13a3
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 001cffff e11d0000
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00005eda 000000e4
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be ffff0000 000000ff
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 0d0e2d66 70ce601f
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 394915e1 5e05479b
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ff000000 fff70000
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be e1000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 da5e0000
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 652c395a 443633c3
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 35cd2ee8 74038259
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 0d0e2d66 70ce601f
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 092b4054 50a57a95
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 25adef32 21118b3b
	bne	%xcc,p0_freg_fail
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
p0_freg_fail:
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

inst_access_handler:
	done 

	.align	256
data_access_handler:
1:	done

check_critical_timed_out:
	ta	BAD_TRAP


get_thread_mask:
	retl
	mov	3,%i7

get_park_semaphore:
	set	park_semaphore,%g6
	mov	100,%g5
1:	ldstub	[%g6],%g7
	cmp	%g7,0
	bne	1b
	nop
	retl
	nop

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
	ldx	[%g1+0x000],%l0		! %l0 = ad30c18520d51e6e
	ldx	[%g1+0x008],%l1		! %l1 = 869749abc5fe2019
	ldx	[%g1+0x010],%l2		! %l2 = 0bf759d758390dd4
	ldx	[%g1+0x018],%l3		! %l3 = 20be8747225f6a9f
	ldx	[%g1+0x020],%l4		! %l4 = 0c7ecd14988f497a
	ldx	[%g1+0x028],%l5		! %l5 = 661a4f47dc464d65
	ldx	[%g1+0x030],%l6		! %l6 = 54b0af2b618ca960
	ldx	[%g1+0x038],%l7		! %l7 = 86e174162830206b

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
	.global	p0_near_0_le,p0_near_0_he
	.global	p0_near_0_lo,p0_near_0_ho
	.global	near0_b2b_l,near0_b2b_h
	.global	far0_b2b_l,far0_b2b_h
	.global	far1_b2b_l,far1_b2b_h
	.global	far2_b2b_l,far2_b2b_h
	.global	far3_b2b_l,far3_b2b_h
user_near0_start:
p0_near_0_le:
	fstoi	%f12,%f4 
	umul	%l7,0x088,%l2
	sdivx	%l6,%l3,%l2
	fsubs	%f12,%f2 ,%f15
	jmpl	%o7,%g0
	ldstub	[%i2+0x010],%l3		! Mem[0000000010081410]
p0_near_0_he:
	andn	%l2,%l5,%l7
	udivx	%l3,0x81e,%l3
	umul	%l1,-0x487,%l7
	ld	[%i2+0x038],%f20	! Mem[0000000010081438]
	orn	%l4,0x8a7,%l2
	lduw	[%i5+0x010],%l1		! Mem[0000000010141410]
	and	%l0,%l4,%l0
	jmpl	%o7,%g0
	smul	%l4,%l4,%l2
p0_near_0_lo:
	fstoi	%f12,%f4 
	umul	%l7,0x088,%l2
	sdivx	%l6,%l3,%l2
	fsubs	%f12,%f2 ,%f15
	jmpl	%o7,%g0
	ldstub	[%o2+0x010],%l3		! Mem[0000000010081410]
p0_near_0_ho:
	andn	%l2,%l5,%l7
	udivx	%l3,0x81e,%l3
	umul	%l1,-0x487,%l7
	ld	[%o2+0x038],%f20	! Mem[0000000010081438]
	orn	%l4,0x8a7,%l2
	lduw	[%o5+0x010],%l1		! Mem[0000000010141410]
	and	%l0,%l4,%l0
	jmpl	%o7,%g0
	smul	%l4,%l4,%l2
near0_b2b_h:
	fmuls	%f22,%f18,%f17
	subc	%l4,-0x598,%l7
	mulx	%l6,-0xdb7,%l3
	udivx	%l1,%l5,%l5
	jmpl	%o7,%g0
	fitos	%f27,%f21
near0_b2b_l:
	fadds	%f8 ,%f0 ,%f11
	udivx	%l2,0x9df,%l1
	fsubs	%f8 ,%f9 ,%f5 
	smul	%l3,%l4,%l1
	jmpl	%o7,%g0
	xnor	%l3,0xbd4,%l2
user_near0_end:
	.seg	"text"
	.align	0x2000
	.global	p0_near_1_le,p0_near_1_he
	.global	p0_near_1_lo,p0_near_1_ho
	.global	near1_b2b_l,near1_b2b_h
	.global	far0_b2b_l,far0_b2b_h
	.global	far1_b2b_l,far1_b2b_h
	.global	far2_b2b_l,far2_b2b_h
	.global	far3_b2b_l,far3_b2b_h
user_near1_start:
p0_near_1_le:
	mulx	%l2,0x519,%l0
	umul	%l1,-0x89b,%l7
	jmpl	%o7,%g0
	umul	%l2,%l2,%l2
p0_near_1_he:
	sdivx	%l3,%l6,%l2
	fmuls	%f20,%f18,%f19
	xor	%l5,-0x4b1,%l3
	umul	%l7,%l3,%l6
	fsqrts	%f20,%f21
	fmuls	%f31,%f28,%f21
	sub	%l1,-0xf0b,%l7
	jmpl	%o7,%g0
	fadds	%f23,%f22,%f21
p0_near_1_lo:
	mulx	%l2,0x519,%l0
	umul	%l1,-0x89b,%l7
	jmpl	%o7,%g0
	umul	%l2,%l2,%l2
p0_near_1_ho:
	sdivx	%l3,%l6,%l2
	fmuls	%f20,%f18,%f19
	xor	%l5,-0x4b1,%l3
	umul	%l7,%l3,%l6
	fsqrts	%f20,%f21
	fmuls	%f31,%f28,%f21
	sub	%l1,-0xf0b,%l7
	jmpl	%o7,%g0
	fadds	%f23,%f22,%f21
near1_b2b_h:
	mulx	%l1,%l1,%l7
	fmuls	%f21,%f22,%f18
	fmuls	%f22,%f31,%f29
	smul	%l4,-0xa5d,%l6
	fsqrts	%f26,%f20
	subc	%l1,%l3,%l4
	jmpl	%o7,%g0
	sdivx	%l3,0x317,%l0
near1_b2b_l:
	xnor	%l7,%l5,%l6
	umul	%l7,%l3,%l2
	fcmps	%fcc3,%f8 ,%f7 
	fsubs	%f5 ,%f2 ,%f6 
	fsubs	%f7 ,%f2 ,%f11
	orn	%l3,%l4,%l6
	jmpl	%o7,%g0
	orn	%l7,0x62c,%l1
user_near1_end:
	.seg	"text"
	.align	0x2000
	.global	p0_near_2_le,p0_near_2_he
	.global	p0_near_2_lo,p0_near_2_ho
	.global	near2_b2b_l,near2_b2b_h
	.global	far0_b2b_l,far0_b2b_h
	.global	far1_b2b_l,far1_b2b_h
	.global	far2_b2b_l,far2_b2b_h
	.global	far3_b2b_l,far3_b2b_h
user_near2_start:
p0_near_2_le:
	fadds	%f14,%f10,%f11
	xnor	%l0,0xcf8,%l2
	fdivs	%f2 ,%f0 ,%f1 
	fmuls	%f2 ,%f3 ,%f13
	fdivs	%f4 ,%f10,%f3 
	xor	%l2,0xdb9,%l0
	jmpl	%o7,%g0
	sdivx	%l6,%l3,%l7
p0_near_2_he:
	jmpl	%o7,%g0
	fsubs	%f17,%f16,%f24
	jmpl	%o7,%g0
	nop
p0_near_2_lo:
	fadds	%f14,%f10,%f11
	xnor	%l0,0xcf8,%l2
	fdivs	%f2 ,%f0 ,%f1 
	fmuls	%f2 ,%f3 ,%f13
	fdivs	%f4 ,%f10,%f3 
	xor	%l2,0xdb9,%l0
	jmpl	%o7,%g0
	sdivx	%l6,%l3,%l7
p0_near_2_ho:
	jmpl	%o7,%g0
	fsubs	%f17,%f16,%f24
	jmpl	%o7,%g0
	nop
near2_b2b_h:
	xnor	%l3,%l2,%l2
	fcmps	%fcc0,%f30,%f17
	xnor	%l0,%l0,%l0
	fsubs	%f18,%f21,%f23
	fadds	%f17,%f28,%f28
	xor	%l5,0xe11,%l5
	fdivs	%f31,%f20,%f20
	jmpl	%o7,%g0
	fcmps	%fcc2,%f26,%f30
near2_b2b_l:
	fsubs	%f2 ,%f13,%f11
	addc	%l5,%l4,%l6
	mulx	%l3,%l7,%l3
	subc	%l2,%l6,%l1
	fadds	%f5 ,%f11,%f13
	sdivx	%l5,%l7,%l6
	subc	%l5,%l7,%l3
	jmpl	%o7,%g0
	mulx	%l4,%l1,%l3
user_near2_end:
	.seg	"text"
	.align	0x2000
	.global	p0_near_3_le,p0_near_3_he
	.global	p0_near_3_lo,p0_near_3_ho
	.global	near3_b2b_l,near3_b2b_h
	.global	far0_b2b_l,far0_b2b_h
	.global	far1_b2b_l,far1_b2b_h
	.global	far2_b2b_l,far2_b2b_h
	.global	far3_b2b_l,far3_b2b_h
user_near3_start:
p0_near_3_le:
	xor	%l3,-0x973,%l0
	umul	%l4,-0x4a7,%l2
	jmpl	%o7,%g0
	xnor	%l1,%l6,%l7
p0_near_3_he:
	swap	[%i3+0x00c],%l7		! Mem[00000000100c140c]
	jmpl	%o7,%g0
	xnor	%l6,0x906,%l1
p0_near_3_lo:
	xor	%l3,-0x973,%l0
	umul	%l4,-0x4a7,%l2
	jmpl	%o7,%g0
	xnor	%l1,%l6,%l7
p0_near_3_ho:
	swap	[%o3+0x00c],%l7		! Mem[00000000100c140c]
	jmpl	%o7,%g0
	xnor	%l6,0x906,%l1
near3_b2b_h:
	udivx	%l5,%l2,%l5
	mulx	%l6,%l6,%l0
	or	%l2,%l4,%l6
	addc	%l2,%l7,%l2
	and	%l7,%l7,%l3
	jmpl	%o7,%g0
	add	%l7,0xbe6,%l4
near3_b2b_l:
	and	%l2,-0x27e,%l2
	orn	%l0,%l2,%l7
	fadds	%f12,%f1 ,%f10
	subc	%l7,-0x94a,%l4
	fmuls	%f6 ,%f8 ,%f1 
	jmpl	%o7,%g0
	umul	%l6,0xb6e,%l6
user_near3_end:
	.seg	"text"
	.align	0x2000
	.global	p0_far_0_le,p0_far_0_he
	.global	p0_far_0_lo,p0_far_0_ho
	.global	far0_b2b_l,far0_b2b_h
	.global	near0_b2b_l,near0_b2b_h
	.global	near1_b2b_l,near1_b2b_h
	.global	near2_b2b_l,near2_b2b_h
	.global	near3_b2b_l,near3_b2b_h
user_far0_start:
p0_far_0_le:
	orn	%l5,0x77b,%l4
	xnor	%l5,-0x41e,%l7
	smul	%l3,%l4,%l5
	jmpl	%o7,%g0
	fcmps	%fcc3,%f4 ,%f6 
p0_far_0_he:
	subc	%l3,-0x7d4,%l5
	sub	%l6,0x9ff,%l7
	jmpl	%o7,%g0
	sdivx	%l1,%l4,%l0
p0_far_0_lo:
	orn	%l5,0x77b,%l4
	xnor	%l5,-0x41e,%l7
	smul	%l3,%l4,%l5
	jmpl	%o7,%g0
	fcmps	%fcc3,%f4 ,%f6 
p0_far_0_ho:
	subc	%l3,-0x7d4,%l5
	sub	%l6,0x9ff,%l7
	jmpl	%o7,%g0
	sdivx	%l1,%l4,%l0
far0_b2b_h:
	umul	%l0,-0x572,%l5
	fcmps	%fcc2,%f27,%f24
	fmuls	%f16,%f22,%f22
	jmpl	%o7,%g0
	andn	%l4,0xae4,%l2
far0_b2b_l:
	subc	%l2,%l3,%l3
	fadds	%f13,%f12,%f14
	sdivx	%l5,%l7,%l3
	jmpl	%o7,%g0
	orn	%l7,%l1,%l6
user_far0_end:
	.seg	"text"
	.align	0x2000
	.global	p0_far_1_le,p0_far_1_he
	.global	p0_far_1_lo,p0_far_1_ho
	.global	far1_b2b_l,far1_b2b_h
	.global	near0_b2b_l,near0_b2b_h
	.global	near1_b2b_l,near1_b2b_h
	.global	near2_b2b_l,near2_b2b_h
	.global	near3_b2b_l,near3_b2b_h
user_far1_start:
p0_far_1_le:
	add	%l6,0x6e6,%l1
	or	%l4,%l1,%l5
	xnor	%l2,-0x760,%l4
	jmpl	%o7,%g0
	fsubs	%f12,%f0 ,%f14
p0_far_1_he:
	fcmps	%fcc0,%f25,%f18
	xnor	%l1,%l2,%l4
	lduh	[%i2+0x01e],%l0		! Mem[000000001008141e]
	and	%l5,%l2,%l3
	jmpl	%o7,%g0
	fsubs	%f27,%f16,%f22
p0_far_1_lo:
	add	%l6,0x6e6,%l1
	or	%l4,%l1,%l5
	xnor	%l2,-0x760,%l4
	jmpl	%o7,%g0
	fsubs	%f12,%f0 ,%f14
p0_far_1_ho:
	fcmps	%fcc0,%f25,%f18
	xnor	%l1,%l2,%l4
	lduh	[%o2+0x01e],%l0		! Mem[000000001008141e]
	and	%l5,%l2,%l3
	jmpl	%o7,%g0
	fsubs	%f27,%f16,%f22
far1_b2b_h:
	addc	%l0,%l0,%l6
	fsubs	%f17,%f30,%f18
	fdivs	%f25,%f30,%f30
	add	%l0,0x00c,%l6
	fdivs	%f23,%f25,%f20
	jmpl	%o7,%g0
	fmuls	%f25,%f28,%f21
far1_b2b_l:
	fdivs	%f8 ,%f11,%f12
	xnor	%l1,%l5,%l2
	addc	%l5,%l1,%l5
	smul	%l3,%l1,%l4
	orn	%l4,%l5,%l6
	jmpl	%o7,%g0
	smul	%l1,-0xbc0,%l6
user_far1_end:
	.seg	"text"
	.align	0x2000
	.global	p0_far_2_le,p0_far_2_he
	.global	p0_far_2_lo,p0_far_2_ho
	.global	far2_b2b_l,far2_b2b_h
	.global	near0_b2b_l,near0_b2b_h
	.global	near1_b2b_l,near1_b2b_h
	.global	near2_b2b_l,near2_b2b_h
	.global	near3_b2b_l,near3_b2b_h
user_far2_start:
p0_far_2_le:
	subc	%l5,%l6,%l6
	and	%l7,%l0,%l0
	jmpl	%o7,%g0
	xor	%l0,%l0,%l3
p0_far_2_he:
	addc	%l6,%l7,%l4
	jmpl	%o7,%g0
	fmuls	%f27,%f28,%f16
p0_far_2_lo:
	subc	%l5,%l6,%l6
	and	%l7,%l0,%l0
	jmpl	%o7,%g0
	xor	%l0,%l0,%l3
p0_far_2_ho:
	addc	%l6,%l7,%l4
	jmpl	%o7,%g0
	fmuls	%f27,%f28,%f16
far2_b2b_h:
	jmpl	%o7,%g0
	subc	%l1,-0xe64,%l7
	jmpl	%o7,%g0
	nop
far2_b2b_l:
	jmpl	%o7,%g0
	umul	%l2,-0xbeb,%l4
	jmpl	%o7,%g0
	nop
user_far2_end:
	.seg	"text"
	.align	0x2000
	.global	p0_far_3_le,p0_far_3_he
	.global	p0_far_3_lo,p0_far_3_ho
	.global	far3_b2b_l,far3_b2b_h
	.global	near0_b2b_l,near0_b2b_h
	.global	near1_b2b_l,near1_b2b_h
	.global	near2_b2b_l,near2_b2b_h
	.global	near3_b2b_l,near3_b2b_h
user_far3_start:
p0_far_3_le:
	smul	%l0,-0x9b2,%l0
	fcmps	%fcc0,%f4 ,%f7 
	addc	%l7,0xd3c,%l2
	or	%l1,%l7,%l6
	xor	%l5,%l6,%l3
	subc	%l0,%l3,%l6
	smul	%l0,%l3,%l3
	jmpl	%o7,%g0
	sdivx	%l6,0x320,%l0
p0_far_3_he:
	jmpl	%o7,%g0
	andn	%l1,%l6,%l6
	jmpl	%o7,%g0
	nop
p0_far_3_lo:
	smul	%l0,-0x9b2,%l0
	fcmps	%fcc0,%f4 ,%f7 
	addc	%l7,0xd3c,%l2
	or	%l1,%l7,%l6
	xor	%l5,%l6,%l3
	subc	%l0,%l3,%l6
	smul	%l0,%l3,%l3
	jmpl	%o7,%g0
	sdivx	%l6,0x320,%l0
p0_far_3_ho:
	jmpl	%o7,%g0
	andn	%l1,%l6,%l6
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far3_b2b_h:
	subc	%l7,0xca8,%l2
	addc	%l3,0x24e,%l3
	fsqrts	%f23,%f27
	xor	%l6,%l4,%l0
	addc	%l7,%l4,%l3
	andn	%l1,0xe6f,%l0
	jmpl	%o7,%g0
	orn	%l0,%l3,%l5
far3_b2b_l:
	xnor	%l1,%l3,%l3
	smul	%l6,%l6,%l7
	smul	%l5,-0xce8,%l7
	add	%l3,%l7,%l5
	andn	%l6,%l5,%l3
	addc	%l5,%l4,%l4
	jmpl	%o7,%g0
	andn	%l2,%l4,%l6
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	mulx	%l0,-0x2da,%l1
	fsubs	%f4 ,%f15,%f12
	xnor	%l2,0x159,%l0
	ldstub	[%o3+0x0c1],%l4		! Mem[00000000218000c1]
	jmpl	%g6+8,%g0
	fadds	%f9 ,%f7 ,%f7 
p0_call_0_le:
	andn	%l3,%l4,%l0
	fdivs	%f2 ,%f10,%f0 
	andn	%l5,%l1,%l2
	sdivx	%l1,0xe27,%l6
	retl
	smul	%l7,%l3,%l1
p0_jmpl_0_lo:
	mulx	%l0,-0x2da,%l1
	fsubs	%f4 ,%f15,%f12
	xnor	%l2,0x159,%l0
	ldstub	[%i3+0x0c1],%l4		! Mem[00000000218000c1]
	jmpl	%g6+8,%g0
	fadds	%f9 ,%f7 ,%f7 
p0_call_0_lo:
	andn	%l3,%l4,%l0
	fdivs	%f2 ,%f10,%f0 
	andn	%l5,%l1,%l2
	sdivx	%l1,0xe27,%l6
	retl
	smul	%l7,%l3,%l1
p0_jmpl_0_he:
	xor	%l6,0xd38,%l4
	andn	%l4,%l3,%l5
	fsubs	%f24,%f24,%f25
	fdivs	%f28,%f24,%f28
	jmpl	%g6+8,%g0
	ldd	[%i1+0x030],%f18	! Mem[0000000010041430]
p0_call_0_he:
	umul	%l3,%l7,%l4
	fmuls	%f18,%f30,%f24
	fsubs	%f25,%f30,%f18
	udivx	%l3,0xde6,%l0
	sdivx	%l4,%l6,%l0
	xnor	%l5,%l2,%l4
	retl
	fitos	%f26,%f24
p0_jmpl_0_ho:
	xor	%l6,0xd38,%l4
	andn	%l4,%l3,%l5
	fsubs	%f24,%f24,%f25
	fdivs	%f28,%f24,%f28
	jmpl	%g6+8,%g0
	ldd	[%o1+0x030],%f18	! Mem[0000000010041430]
p0_call_0_ho:
	umul	%l3,%l7,%l4
	fmuls	%f18,%f30,%f24
	fsubs	%f25,%f30,%f18
	udivx	%l3,0xde6,%l0
	sdivx	%l4,%l6,%l0
	xnor	%l5,%l2,%l4
	retl
	fitos	%f26,%f24
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	jmpl	%g6+8,%g0
	smul	%l6,-0xe0c,%l2
p0_call_1_le:
	xnor	%l0,-0x362,%l4
	xor	%l5,-0xc85,%l5
	smul	%l0,-0xdf1,%l6
	add	%l5,%l6,%l5
	sdivx	%l6,0xc46,%l4
	retl
	ldsb	[%i3+0x010],%l0		! Mem[00000000100c1410]
p0_jmpl_1_lo:
	jmpl	%g6+8,%g0
	smul	%l6,-0xe0c,%l2
p0_call_1_lo:
	xnor	%l0,-0x362,%l4
	xor	%l5,-0xc85,%l5
	smul	%l0,-0xdf1,%l6
	add	%l5,%l6,%l5
	sdivx	%l6,0xc46,%l4
	retl
	ldsb	[%o3+0x010],%l0		! Mem[00000000100c1410]
p0_jmpl_1_he:
	jmpl	%g6+8,%g0
	fstoi	%f26,%f18
p0_call_1_he:
	orn	%l2,%l3,%l6
	umul	%l1,%l0,%l2
	sub	%l7,0xc5c,%l0
	retl
	fcmps	%fcc1,%f18,%f28
p0_jmpl_1_ho:
	jmpl	%g6+8,%g0
	fstoi	%f26,%f18
p0_call_1_ho:
	orn	%l2,%l3,%l6
	umul	%l1,%l0,%l2
	sub	%l7,0xc5c,%l0
	retl
	fcmps	%fcc1,%f18,%f28
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	andn	%l1,%l1,%l4
	smul	%l3,%l6,%l1
	sub	%l2,0x3bf,%l6
	sub	%l5,%l1,%l7
	and	%l0,%l2,%l7
	fcmps	%fcc3,%f0 ,%f1 
	mulx	%l2,%l5,%l5
	jmpl	%g6+8,%g0
	add	%l2,-0x969,%l1
p0_call_2_le:
	retl
	sub	%l1,%l1,%l1
p0_jmpl_2_lo:
	andn	%l1,%l1,%l4
	smul	%l3,%l6,%l1
	sub	%l2,0x3bf,%l6
	sub	%l5,%l1,%l7
	and	%l0,%l2,%l7
	fcmps	%fcc3,%f0 ,%f1 
	mulx	%l2,%l5,%l5
	jmpl	%g6+8,%g0
	add	%l2,-0x969,%l1
p0_call_2_lo:
	retl
	sub	%l1,%l1,%l1
p0_jmpl_2_he:
	or	%l7,%l3,%l2
	fdivs	%f16,%f18,%f27
	subc	%l6,%l1,%l5
	or	%l2,-0x5c0,%l7
	fadds	%f17,%f24,%f22
	smul	%l6,-0x4ff,%l2
	jmpl	%g6+8,%g0
	xnor	%l5,%l3,%l2
p0_call_2_he:
	fmuls	%f30,%f23,%f25
	or	%l3,%l7,%l3
	xor	%l7,-0xc0b,%l3
	fdivs	%f19,%f18,%f16
	retl
	fadds	%f25,%f30,%f17
p0_jmpl_2_ho:
	or	%l7,%l3,%l2
	fdivs	%f16,%f18,%f27
	subc	%l6,%l1,%l5
	or	%l2,-0x5c0,%l7
	fadds	%f17,%f24,%f22
	smul	%l6,-0x4ff,%l2
	jmpl	%g6+8,%g0
	xnor	%l5,%l3,%l2
p0_call_2_ho:
	fmuls	%f30,%f23,%f25
	or	%l3,%l7,%l3
	xor	%l7,-0xc0b,%l3
	fdivs	%f19,%f18,%f16
	retl
	fadds	%f25,%f30,%f17
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	and	%l7,%l3,%l7
	sdivx	%l3,%l0,%l5
	ldd	[%i1+0x010],%l4		! Mem[0000000010041410]
	jmpl	%g6+8,%g0
	sub	%l3,%l2,%l0
p0_call_3_le:
	fdivs	%f8 ,%f5 ,%f4 
	retl
	xnor	%l6,0x955,%l4
p0_jmpl_3_lo:
	and	%l7,%l3,%l7
	sdivx	%l3,%l0,%l5
	ldd	[%o1+0x010],%l4		! Mem[0000000010041410]
	jmpl	%g6+8,%g0
	sub	%l3,%l2,%l0
p0_call_3_lo:
	fdivs	%f8 ,%f5 ,%f4 
	retl
	xnor	%l6,0x955,%l4
p0_jmpl_3_he:
	mulx	%l7,0x27d,%l0
	sdivx	%l2,0xa09,%l4
	and	%l1,%l2,%l4
	fmuls	%f31,%f24,%f25
	ldsb	[%o0+0x001],%l6		! Mem[00000000201c0001]
	umul	%l3,-0x9b3,%l4
	jmpl	%g6+8,%g0
	umul	%l2,0x3f0,%l2
p0_call_3_he:
	umul	%l4,-0x5dc,%l3
	retl
	addc	%l5,-0x99a,%l6
p0_jmpl_3_ho:
	mulx	%l7,0x27d,%l0
	sdivx	%l2,0xa09,%l4
	and	%l1,%l2,%l4
	fmuls	%f31,%f24,%f25
	ldsb	[%i0+0x001],%l6		! Mem[00000000201c0001]
	umul	%l3,-0x9b3,%l4
	jmpl	%g6+8,%g0
	umul	%l2,0x3f0,%l2
p0_call_3_ho:
	umul	%l4,-0x5dc,%l3
	retl
	addc	%l5,-0x99a,%l6
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
	.align	64
Finish_Flag:
	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.align	8
num_processors:
	.word	1
v8_binary:
	.word	0
no_fpu:
	.word	0
max_ireg:
	.word	8,0
max_freg:
	.word	32,0
	.align	8
park_semaphore:
	.word	0,0
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
	.word	0xad30c185,0x20d51e6e		! Init value for %l0
	.word	0x869749ab,0xc5fe2019		! Init value for %l1
	.word	0x0bf759d7,0x58390dd4		! Init value for %l2
	.word	0x20be8747,0x225f6a9f		! Init value for %l3
	.word	0x0c7ecd14,0x988f497a		! Init value for %l4
	.word	0x661a4f47,0xdc464d65		! Init value for %l5
	.word	0x54b0af2b,0x618ca960		! Init value for %l6
	.word	0x86e17416,0x2830206b		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x639aab40,0x2a2d7651		! Init value for %f0 
	.word	0x01c3767e,0x4559f5d7		! Init value for %f2 
	.word	0x0a2b8c2c,0x56ef500d		! Init value for %f4 
	.word	0x0568a3ca,0x47f3ae73		! Init value for %f6 
	.word	0x734050d8,0x4a442689		! Init value for %f8 
	.word	0x7bafe2d6,0x6f1119cf		! Init value for %f10
	.word	0x223b4544,0x1e2595c5		! Init value for %f12
	.word	0x5bfadfa2,0x2191b3eb		! Init value for %f14
	.word	0x4ea07570,0x300ff9c1		! Init value for %f16
	.word	0x226b062e,0x1d3db8c7		! Init value for %f18
	.word	0x22c1ad5c,0x497e6e7d		! Init value for %f20
	.word	0x58ed827a,0x44222463		! Init value for %f22
	.word	0x4a2a7908,0x0126cff9		! Init value for %f24
	.word	0x7e074086,0x38acb2bf		! Init value for %f26
	.word	0x5bcc2474,0x30f5ba35		! Init value for %f28
	.word	0x3560ec52,0x0487dfdb		! Init value for %f30
	.word	0x6be9bba0,0x1cca8931		! Init value for %f32
	.word	0x6e12f1de,0x4636e7b7		! Init value for %f34
	.word	0x51c40a8c,0x25f358ed		! Init value for %f36
	.word	0x6ab17d2a,0x2171c653		! Init value for %f38
	.word	0x6d059d38,0x27690569		! Init value for %f40
	.word	0x57187a36,0x6e4137af		! Init value for %f42
	.word	0x76eebfa4,0x56cb2aa5		! Init value for %f44
	.word	0x57f79502,0x62dab7cb		! Init value for %f46
	.word	0x2b417dd0,0x461c24a1
	.word	0x401e398e,0x343c82a7
	.word	0x54eda3bc,0x623d0f5d
	.word	0x578793da,0x69899443
	.word	0x0a7cbd68,0x0a29c6d9
	.word	0x60268fe6,0x5e25a89f
	.word	0x263e16d4,0x1af4e715
	.word	0x4471d9b2,0x2e913bbb
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
	.word	0x00000000,0x016a2eb8		! %l0
	.word	0x00000000,0x2af260e9		! %l1
	.word	0x00000000,0x2f8f0000		! %l2
	.word	0x00000000,0x000000ad		! %l3
	.word	0x00000000,0xe5000000		! %l4
	.word	0x00000000,0x0000008f		! %l5
	.word	0x00000000,0x1f60ce70		! %l6
	.word	0x00000000,0x00000000		! %l7
p0_expected_fp_regs:
	.word	0x00000000,0x0000ff0a		! %f0
	.word	0xa3133d23,0x00000000		! %f2
	.word	0x2f5c7aba,0x233d13a3		! %f4
	.word	0x001cffff,0xe11d0000		! %f6
	.word	0x00005eda,0x000000e4		! %f8
	.word	0xffff0000,0x000000ff		! %f10
	.word	0x0d0e2d66,0x70ce601f		! %f12
	.word	0x394915e1,0x5e05479b		! %f14
	.word	0xff000000,0xfff70000		! %f16
	.word	0xe1000000,0x00000000		! %f18
	.word	0x00000000,0xda5e0000		! %f20
	.word	0x652c395a,0x443633c3		! %f22
	.word	0x35cd2ee8,0x74038259		! %f24
	.word	0x0d0e2d66,0x70ce601f		! %f26
	.word	0x092b4054,0x50a57a95		! %f28
	.word	0x25adef32,0x21118b3b		! %f30
	.word	0x0000002a,0x00000b20		! %fsr
p0_local0_expect:
	.word	0x00000000,0x0000ff0a,0x70001de1,0xffff1c00 ! PA = 0000000010001400
	.word	0xb0cc0000,0x000000ff,0x63e3400d,0x00000000 ! PA = 0000000010001410
	.word	0xe5000000,0x23a40000,0xbfa1bb5e,0x86fb313d ! PA = 0000000010001420
	.word	0x3561a023,0x74f7fd4a,0xdbfebd08,0x52970c06 ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0x00000000,0x00000000,0x2f8f0000,0x00000000 ! PA = 0000000030001400
	.word	0x000000e5,0x74038259,0x649fe11d,0x08b00000 ! PA = 0000000030001410
	.word	0x08aaf1c8,0x7762edb9,0x16054f46,0x61fa4e7f ! PA = 0000000030001420
	.word	0x008ef934,0x554143f5,0x689d3712,0x5e05479b ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x9fcb7d2e,0xa4ee075f,0xc5e6ee52,0x0ab0e04b
	.word	0x6e0c1996,0xb8dd7397,0x561097fa,0x7373ec43
	.word	0x83770a7e,0xdf0e8d4f,0xb3695a22,0x202871bb
	.word	0x7794f7e6,0x41ca4c87,0xb3791cca,0x344d28b3
p0_local1_expect:
	.word	0x00000000,0x00000000,0xffffffff,0x233d13a3 ! PA = 0000000010041400
	.word	0x1f60ce70,0x0000002d,0x00000000,0xe11d0000 ! PA = 0000000010041410
	.word	0xe4000000,0xda5e0000,0xff000000,0x233d13a3 ! PA = 0000000010041420
	.word	0x0000ffff,0xe11d0000,0x9b47055e,0xe1154939 ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0x00000000,0xda5e0000,0x00000000,0x21000000 ! PA = 0000000030041400
	.word	0x00000000,0x7660571b,0x86ffffff,0x17728db3 ! PA = 0000000030041410
	.word	0x378f2b18,0x6b6a2fc9,0x2d86ff16,0x568d1d0f ! PA = 0000000030041420
	.word	0x7a82ed58,0x7468e305,0x4d558762,0x7a82edff ! PA = 0000000030041430
p0_local2_expect:
	.word	0x0000f7ff,0x000000ff,0x00000000,0x000000e1 ! PA = 0000000010081400
	.word	0x00005eda,0x00000000,0xc3333644,0x5a392c65 ! PA = 0000000010081410
	.word	0x59820374,0xe82ecd35,0x1f60ce70,0x662d0e0d ! PA = 0000000010081420
	.word	0x957aa550,0x54402b09,0x3b8b1121,0x32efad25 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x2d000000,0x00000924,0xff000000,0xff000000 ! PA = 0000000030081400
	.word	0xff000000,0x00000924,0x6876153a,0x106db423 ! PA = 0000000030081410
	.word	0x08aaf1c8,0x7762edb9,0xa3133d23,0xba7a5c21 ! PA = 0000000030081420
	.word	0x00001de1,0xffff0000,0x689d3712,0x5e05479b ! PA = 0000000030081430
p0_local3_expect:
	.word	0x662d0e0d,0x233d13a3,0x00000000,0xcbff8259 ! PA = 00000000100c1400
	.word	0x1d1e0000,0xce9d00ff,0x00000000,0x000000ff ! PA = 00000000100c1410
	.word	0x016a2eb8,0x2af260e9,0x34adffb6,0x70ffc68a ! PA = 00000000100c1420
	.word	0x48aa0924,0x0000001c,0x20d51e6e,0xc5fe2019 ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0xff000000,0xfff70000,0xe1000000,0x00000000 ! PA = 00000000300c1400
	.word	0x00000000,0xda5e0000,0x652c395a,0x443633c3 ! PA = 00000000300c1410
	.word	0x35cd2ee8,0x74038259,0x0d0e2d66,0x70ce601f ! PA = 00000000300c1420
	.word	0x092b4054,0x50a57a95,0x25adef32,0x21118b3b ! PA = 00000000300c1430
p0_local4_expect:
	.word	0xbaffffff,0xba000000,0x0742ba62,0x00000000 ! PA = 0000000010101400
	.word	0xff00ef32,0x1d1e609b,0xffffa550,0x394915e1 ! PA = 0000000010101410
	.word	0xa92e746a,0x78179c25,0x0000a423,0x000000e5 ! PA = 0000000010101420
	.word	0x00000000,0x00000000,0x000000ff,0xbeea09ff ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0xff9fe11d,0x08b00000,0x0000ffff,0xffffffff ! PA = 0000000030101400
	.word	0x0000ffff,0x00000924,0x6876153a,0x106db423 ! PA = 0000000030101410
	.word	0x08aaf1c8,0x7762edb9,0x5b7106c2,0x61fa4e7f ! PA = 0000000030101420
	.word	0x00001de1,0xffff0000,0x689d3712,0x5e05479b ! PA = 0000000030101430
p0_local5_expect:
	.word	0x00ff0000,0x5e05479b,0x00000000,0x0000b0cc ! PA = 0000000010141400
	.word	0xffcb1d56,0xabe2b9f7,0x63e3400d,0x7a8c3a10 ! PA = 0000000010141410
	.word	0xe5002b09,0x23a40000,0xbfa1bb5e,0x86fb313d ! PA = 0000000010141420
	.word	0x3561a023,0x74fffd4a,0x6c7eb0cc,0x4205b423 ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0xff000000,0x0000e11d,0xff2fffff,0xffb0ff50 ! PA = 0000000030141400
	.word	0xffffcbff,0x00000000,0x2bd92c1a,0x58d8a383 ! PA = 0000000030141410
	.word	0x677d07a8,0x7b958019,0x11de9c26,0x5ca8dbdf ! PA = 0000000030141420
	.word	0x58bb7514,0x04ace455,0x7eca99f2,0x5500d2fb ! PA = 0000000030141430
p0_local6_expect:
	.word	0x00007aba,0x0000ff00,0xa3133d23,0x00000000 ! PA = 0000000010181400
	.word	0x000000e1,0x00008f2f,0xffffffff,0x443633c3 ! PA = 0000000010181410
	.word	0x000000ff,0x74038259,0x0d0e2d66,0x70ce601f ! PA = 0000000010181420
	.word	0x092b4054,0x50a57a95,0x25adef32,0x21118b3b ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x000000e4,0x21000000,0xe11d0000,0xffffb0ff ! PA = 0000000030181400
	.word	0x02ff918f,0xffff91b7,0x103a4d7a,0x0d40e363 ! PA = 0000000030181410
	.word	0x0c0adc08,0x456bc6f9,0x3d31fb86,0x5ebba1bf ! PA = 0000000030181420
	.word	0x4afdf774,0x23a06135,0x060c9752,0x08bdfedb ! PA = 0000000030181430
share0_expect:
	.word	0x0000fea0,0x5b09e031,0x6f528cde,0x437b36b7 ! PA = 00000000201c0000
	.word	0x6a79bd8c,0x48265fed,0x0c08082a,0x3b5b4553 ! PA = 00000000201c0010
	.word	0x1ecdc038,0x681ebc69,0x0378f536,0x7016e6af ! PA = 00000000201c0020
	.word	0x279452a4,0x69c291a5,0x10c50002,0x0e9396cb ! PA = 00000000201c0030
share1_expect:
	.word	0x9cff80d0,0x5f443ba1,0x282b948e,0x417f91a7 ! PA = 0000000020800000
	.word	0x0f6f16bc,0x6cb4d65d,0x2e17deda,0x34add343 ! PA = 0000000020800010
	.word	0x04dca068,0x0f403dd9,0x6beccae6,0x4732179f ! PA = 0000000020800020
	.word	0x100769d4,0x59290e15,0x2e9104b2,0x283cdabb ! PA = 0000000020800030
	.word	0x00027f00,0x3e84a311,0x3abaf83e,0x5ab75897 ! PA = 0000000020800040
	.word	0x01b6abec,0x4eb718cd,0x02fcd18a,0x5b9f8d33 ! PA = 0000000020800050
	.word	0x6aa27c98,0x76af4b49,0x4b907c96,0x6724348f ! PA = 0000000020800060
	.word	0x20b23d04,0x27e2d685,0x27e3a562,0x1880caab ! PA = 0000000020800070
share2_expect:
	.word	0x0000f930,0x000a1681,0x7de3b7ee,0x60998b87 ! PA = 00000000211c0000
	.word	0x768b7d1c,0x4d9c273d,0x7b09e03a,0x0f577323 ! PA = 00000000211c0010
	.word	0x0e4a54c8,0x0d0ae4b9,0x27270a46,0x6bc43d7f ! PA = 00000000211c0020
	.word	0x33afcc34,0x3abeeaf5,0x00efe212,0x16e6669b ! PA = 00000000211c0030
share3_expect:
	.word	0x6bffef60,0x15d395f1,0x5048d39e,0x355d2a77 ! PA = 0000000021800000
	.word	0x78e88a4c,0x2f9301ad,0x1a520aea,0x1bbc8513 ! PA = 0000000021800010
	.word	0x6fbf28f8,0x63b20a29,0x633373f6,0x79a9326f ! PA = 0000000021800020
	.word	0x10db1764,0x154c4b65,0x29a8bac2,0x3fb4ae8b ! PA = 0000000021800030
	.word	0x3f6a6190,0x4ca02161,0x484d4b4e,0x3bf93567 ! PA = 0000000021800040
	.word	0x1988d37c,0x118aa81d,0x28a8519a,0x2975c303 ! PA = 0000000021800050
	.word	0x00abf928,0x1ec3bb99,0x73f8b9a6,0x2e2a135f ! PA = 0000000021800060
	.word	0x1dcf1e94,0x49d9f7d5,0x2dc12f72,0x03f2a27b ! PA = 0000000021800070
	.word	0xff5f4fc0,0x3beeb8d1,0x64141efe,0x4824ac57 ! PA = 0000000021800080
	.word	0x1ee758ac,0x57321a8d,0x619fb44a,0x2dea2cf3 ! PA = 0000000021800090
	.word	0x547bc558,0x651ef909,0x0d79db56,0x0f5de04f ! PA = 00000000218000a0
	.word	0x0de6e1c4,0x6976f045,0x64ac4022,0x1967426b ! PA = 00000000218000b0
	.word	0xffabb9f0,0x35fe5c41,0x39804eae,0x0e568f47 ! PA = 00000000218000c0
	.word	0x353f19dc,0x1af858fd,0x248b32fa,0x5b40c2e3 ! PA = 00000000218000d0
	.word	0x50598d88,0x5062c279,0x5379d906,0x7c1b993f ! PA = 00000000218000e0
	.word	0x123d60f4,0x73f234b5,0x219cecd2,0x6a998e5b ! PA = 00000000218000f0
	.word	0x0000a020,0x37ce0bb1,0x2634da5e,0x13c5de37 ! PA = 0000000021800100
	.word	0x1e8b170c,0x1e0c636d,0x247dcdaa,0x106084d3 ! PA = 0000000021800110
	.word	0x5b3051b8,0x5cee17e9,0x097bb2b6,0x1bfa3e2f ! PA = 0000000021800120
	.word	0x09ad9c24,0x47dac525,0x63863582,0x06d0864b ! PA = 0000000021800130
	.word	0xffad0250,0x591cc721,0x7f94c20e,0x1e699927 ! PA = 0000000021800140
	.word	0x6286503c,0x385d39dd,0x184a845a,0x48f072c3 ! PA = 0000000021800150
	.word	0x0dab11e8,0x59dff959,0x42c26866,0x4f50cf1f ! PA = 0000000021800160
	.word	0x30d29354,0x127fa195,0x051b1a32,0x12132a3b ! PA = 0000000021800170
	.word	0x0000e080,0x3c698e91,0x42c305be,0x24f8c017 ! PA = 0000000021800180
	.word	0x7eabc56c,0x4899dc4d,0x6a84570a,0x0d578cb3 ! PA = 0000000021800190
	.word	0x6234ce18,0x591766c9,0x1250fa16,0x1f364c0f ! PA = 00000000218001a0
	.word	0x52074684,0x3fefca05,0x6cce9ae2,0x35287a2b ! PA = 00000000218001b0
	.word	0xb0ff3ab0,0x7ef36201,0x44a2a56e,0x3eea5307 ! PA = 00000000218001c0
	.word	0x1636769c,0x24314abd,0x697e45ba,0x62bcd2a3 ! PA = 00000000218001d0
	.word	0x64f88648,0x1f336039,0x3aea67c6,0x2d81b4ff ! PA = 00000000218001e0
	.word	0x7566b5b4,0x6afa3e75,0x3cd3b792,0x0d97761b ! PA = 00000000218001f0
p0_invalidate_semaphore:
	.word	0,0
user_data_end:


SECTION	.p0_local0	DATA_VA=0x000800000

attr_data {
	Name = .p0_local0,
	VA = 0x0000000000800000,
	RA = ra2pa(0x0000000010000000,0),
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
	.word	0x4632bc00,0x0c83cc11,0x1bafdd3e,0x0c058997	! PA = 0000000010001400
	.word	0x5fb978ec,0x7b0a91cd,0x7002c68a,0x32d08e33	! PA = 0000000010001410
	.word	0x32fad998,0x39481449,0x72348196,0x7f71058f	! PA = 0000000010001420
	.word	0x2a152a04,0x4781ef85,0x0742ba62,0x5e726bab	! PA = 0000000010001430
p0_local0_end:

SECTION	.p0_local0_sec	DATA_VA=0x000800000

attr_data {
	Name = .p0_local0_sec,
	VA = 0x0000000000800000,
	RA = ra2pa(0x0000000030000000,0),
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
	.word	0x70087630,0x4b407f81,0x5baadcee,0x1308fc87	! PA = 0000000030001400
	.word	0x4b628a1c,0x63cae03d,0x6876153a,0x106db423	! PA = 0000000030001410
	.word	0x08aaf1c8,0x7762edb9,0x16054f46,0x61fa4e7f	! PA = 0000000030001420
	.word	0x008ef934,0x554143f5,0x689d3712,0x5e05479b	! PA = 0000000030001430
p0_local0_sec_end:

SECTION	.p0_local1	DATA_VA=0x000802000

attr_data {
	Name = .p0_local1,
	VA = 0x0000000000802000,
	RA = ra2pa(0x0000000010040000,0),
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
	.word	0x05cdac60,0x48513ef1,0x62b2389e,0x1f7ddb77	! PA = 0000000010041400
	.word	0x46e3d74c,0x76acfaad,0x08f47fea,0x02480613	! PA = 0000000010041410
	.word	0x6f7805f8,0x29d95329,0x341bf8f6,0x1e58836f	! PA = 0000000010041420
	.word	0x15868464,0x5bc1e465,0x1c744fc2,0x7d90cf8b	! PA = 0000000010041430
p0_local1_end:

SECTION	.p0_local1_sec	DATA_VA=0x000802000

attr_data {
	Name = .p0_local1_sec,
	VA = 0x0000000000802000,
	RA = ra2pa(0x0000000030040000,0),
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
	.word	0x3e4d5e90,0x24750a61,0x4b28f04e,0x085b2667	! PA = 0000000030041400
	.word	0x06f8607c,0x649fe11d,0x5d51069a,0x65068403	! PA = 0000000030041410
	.word	0x3d0d1628,0x48ca4499,0x44bb7ea6,0x45e2a45f	! PA = 0000000030041420
	.word	0x7296cb94,0x0152d0d5,0x727b0472,0x621c037b	! PA = 0000000030041430
p0_local1_sec_end:

SECTION	.p0_local2	DATA_VA=0x000804000

attr_data {
	Name = .p0_local2,
	VA = 0x0000000000804000,
	RA = ra2pa(0x0000000010080000,0),
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
	.word	0x5a128cc0,0x4b2ae1d1,0x173203fe,0x1557dd57	! PA = 0000000010081400
	.word	0x761b25ac,0x2552938d,0x651ea94a,0x62102df3	! PA = 0000000010081410
	.word	0x68d52258,0x4f14c209,0x7fe6e056,0x52afb14f	! PA = 0000000010081420
	.word	0x6f1acec4,0x6b030945,0x06245522,0x756de36b	! PA = 0000000010081430
p0_local2_end:

SECTION	.p0_local2_sec	DATA_VA=0x000804000

attr_data {
	Name = .p0_local2_sec,
	VA = 0x0000000000804000,
	RA = ra2pa(0x0000000030080000,0),
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
	.word	0x536836f0,0x62b1c541,0x60b073ae,0x6eeb0047	! PA = 0000000030081400
	.word	0x648726dc,0x673411fd,0x43b067fa,0x5f8c03e3	! PA = 0000000030081410
	.word	0x3bfb2a88,0x2a57cb79,0x0d611e06,0x1796aa3f	! PA = 0000000030081420
	.word	0x602d8df4,0x2ca18db5,0x6ea341d2,0x560d6f5b	! PA = 0000000030081430
p0_local2_sec_end:

SECTION	.p0_local3	DATA_VA=0x000806000

attr_data {
	Name = .p0_local3,
	VA = 0x0000000000806000,
	RA = ra2pa(0x00000000100c0000,0),
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
	.word	0x0e595d20,0x3c08b4b1,0x09473f5e,0x0e4b8f37	! PA = 00000000100c1400
	.word	0x3837640c,0x7f735c6d,0x701942aa,0x706105d3	! PA = 00000000100c1410
	.word	0x016a2eb8,0x2af260e9,0x34ad37b6,0x302e8f2f	! PA = 00000000100c1420
	.word	0x48aa0924,0x38bd5e25,0x6eeaca82,0x4741a74b	! PA = 00000000100c1430
p0_local3_end:

SECTION	.p0_local3_sec	DATA_VA=0x000806000

attr_data {
	Name = .p0_local3_sec,
	VA = 0x0000000000806000,
	RA = ra2pa(0x00000000300c0000,0),
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
	.word	0x08b0ff50,0x42eeb021,0x6a59670e,0x2d708a27	! PA = 00000000300c1400
	.word	0x1ce6dd3c,0x59ff72dd,0x652c395a,0x443633c3	! PA = 00000000300c1410
	.word	0x35cd2ee8,0x74038259,0x0d0e2d66,0x70ce601f	! PA = 00000000300c1420
	.word	0x092b4054,0x50a57a95,0x25adef32,0x21118b3b	! PA = 00000000300c1430
p0_local3_sec_end:

SECTION	.p0_local4	DATA_VA=0x000808000

attr_data {
	Name = .p0_local4,
	VA = 0x0000000000808000,
	RA = ra2pa(0x0000000010100000,0),
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
	.word	0x09fa1d80,0x6de2b791,0x0509eabe,0x3710f117	! PA = 0000000010101400
	.word	0x3410926c,0x6987554d,0x517c4c0a,0x17728db3	! PA = 0000000010101410
	.word	0x378f2b18,0x6b6a2fc9,0x2d86ff16,0x568d1d0f	! PA = 0000000010101420
	.word	0x100c3384,0x7468e305,0x3d5fafe2,0x40441b2b	! PA = 0000000010101430
p0_local4_end:

SECTION	.p0_local4_sec	DATA_VA=0x000808000

attr_data {
	Name = .p0_local4_sec,
	VA = 0x0000000000808000,
	RA = ra2pa(0x0000000030100000,0),
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
	.word	0x537fb7b0,0x2e23cb01,0x323bca6e,0x36a3c407	! PA = 0000000030101400
	.word	0x44ef839c,0x177a03bd,0x475c7aba,0x233d13a3	! PA = 0000000030101410
	.word	0x76db2348,0x29c56939,0x5cdaacc6,0x7741c5ff	! PA = 0000000030101420
	.word	0x0967e2b4,0x52d69775,0x1c330c92,0x7660571b	! PA = 0000000030101430
p0_local4_sec_end:

SECTION	.p0_local5	DATA_VA=0x00080a000

attr_data {
	Name = .p0_local5,
	VA = 0x000000000080a000,
	RA = ra2pa(0x0000000010140000,0),
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
	.word	0x504ccde0,0x5fb0ea71,0x5292061e,0x486002f7	! PA = 0000000010141400
	.word	0x6c7eb0cc,0x34067e2d,0x6cdfc56a,0x0d7cc593	! PA = 0000000010141410
	.word	0x259c1778,0x6a742ea9,0x418c3676,0x71835aef	! PA = 0000000010141420
	.word	0x0f194de4,0x397d97e5,0x141b0542,0x79ad3f0b	! PA = 0000000010141430
p0_local5_end:

SECTION	.p0_local5_sec	DATA_VA=0x00080a000

attr_data {
	Name = .p0_local5_sec,
	VA = 0x000000000080a000,
	RA = ra2pa(0x0000000030140000,0),
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
	.word	0x452c6010,0x394915e1,0x7e6f9dce,0x093cade7	! PA = 0000000030141400
	.word	0x4d7919fc,0x661bc49d,0x2bd92c1a,0x58d8a383	! PA = 0000000030141410
	.word	0x677d07a8,0x7b958019,0x11de9c26,0x5ca8dbdf	! PA = 0000000030141420
	.word	0x58bb7514,0x04ace455,0x12ca99f2,0x5531d2fb	! PA = 0000000030141430
p0_local5_sec_end:

SECTION	.p0_local6	DATA_VA=0x00080c000

attr_data {
	Name = .p0_local6,
	VA = 0x000000000080c000,
	RA = ra2pa(0x0000000010180000,0),
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
	.word	0x00a96e40,0x3c6b4d51,0x35f7917e,0x06f0c4d7	! PA = 0000000010181400
	.word	0x4059bf2c,0x1b68d70d,0x61dbaeca,0x54b7ad73	! PA = 0000000010181410
	.word	0x01e8f3d8,0x2e085d89,0x43d4ddd6,0x38c948cf	! PA = 0000000010181420
	.word	0x6ba95844,0x0f737cc5,0x51b4caa2,0x58b512eb	! PA = 0000000010181430
p0_local6_end:

SECTION	.p0_local6_sec	DATA_VA=0x00080c000

attr_data {
	Name = .p0_local6_sec,
	VA = 0x000000000080c000,
	RA = ra2pa(0x0000000030180000,0),
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
	.word	0x0b0ef870,0x255690c1,0x110ce12e,0x2ff347c7	! PA = 0000000030181400
	.word	0x035ba05c,0x785cb57d,0x103a4d7a,0x0d40e363	! PA = 0000000030181410
	.word	0x0c0adc08,0x456bc6f9,0x3d31fb86,0x5ebba1bf	! PA = 0000000030181420
	.word	0x4afdf774,0x23a06135,0x060c9752,0x08bdfedb	! PA = 0000000030181430
p0_local6_sec_end:

SECTION	.share0	DATA_VA=0x00080e000

attr_data {
	Name = .share0,
	VA = 0x000000000080e000,
	RA = ra2pa(0x00000000201c0000,0),
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
	.word	0x5667fea0,0x5b09e031,0x6f528cde,0x437b36b7	! PA = 00000000201c0000
	.word	0x6a79bd8c,0x48265fed,0x0c08082a,0x3b5b4553	! PA = 00000000201c0010
	.word	0x1ecdc038,0x681ebc69,0x0378f536,0x7016e6af	! PA = 00000000201c0020
	.word	0x279452a4,0x69c291a5,0x10c50002,0x0e9396cb	! PA = 00000000201c0030
share0_end:

SECTION	.share1	DATA_VA=0x000810000

attr_data {
	Name = .share1,
	VA = 0x0000000000810000,
	RA = ra2pa(0x0000000020800000,0),
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
	.word	0x6e7f80d0,0x5f443ba1,0x282b948e,0x417f91a7	! PA = 0000000020800000
	.word	0x0f6f16bc,0x6cb4d65d,0x2e17deda,0x34add343	! PA = 0000000020800010
	.word	0x04dca068,0x0f403dd9,0x6beccae6,0x4732179f	! PA = 0000000020800020
	.word	0x100769d4,0x59290e15,0x2e9104b2,0x283cdabb	! PA = 0000000020800030
	.word	0x28e07f00,0x3e84a311,0x3abaf83e,0x5ab75897	! PA = 0000000020800040
	.word	0x01b6abec,0x4eb718cd,0x02fcd18a,0x5b9f8d33	! PA = 0000000020800050
	.word	0x6aa27c98,0x76af4b49,0x4b907c96,0x6724348f	! PA = 0000000020800060
	.word	0x20b23d04,0x27e2d685,0x27e3a562,0x1880caab	! PA = 0000000020800070
share1_end:

SECTION	.share2	DATA_VA=0x000812000

attr_data {
	Name = .share2,
	VA = 0x0000000000812000,
	RA = ra2pa(0x00000000211c0000,0),
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
	.word	0x54d5f930,0x000a1681,0x7de3b7ee,0x60998b87	! PA = 00000000211c0000
	.word	0x768b7d1c,0x4d9c273d,0x7b09e03a,0x0f577323	! PA = 00000000211c0010
	.word	0x0e4a54c8,0x0d0ae4b9,0x27270a46,0x6bc43d7f	! PA = 00000000211c0020
	.word	0x33afcc34,0x3abeeaf5,0x00efe212,0x16e6669b	! PA = 00000000211c0030
share2_end:

SECTION	.share3	DATA_VA=0x000814000

attr_data {
	Name = .share3,
	VA = 0x0000000000814000,
	RA = ra2pa(0x0000000021800000,0),
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
	.word	0x6b6aef60,0x15d395f1,0x5048d39e,0x355d2a77	! PA = 0000000021800000
	.word	0x78e88a4c,0x2f9301ad,0x1a520aea,0x1bbc8513	! PA = 0000000021800010
	.word	0x6fbf28f8,0x63b20a29,0x633373f6,0x79a9326f	! PA = 0000000021800020
	.word	0x10db1764,0x154c4b65,0x29a8bac2,0x3fb4ae8b	! PA = 0000000021800030
	.word	0x3f6a6190,0x4ca02161,0x484d4b4e,0x3bf93567	! PA = 0000000021800040
	.word	0x1988d37c,0x118aa81d,0x28a8519a,0x2975c303	! PA = 0000000021800050
	.word	0x00abf928,0x1ec3bb99,0x73f8b9a6,0x2e2a135f	! PA = 0000000021800060
	.word	0x1dcf1e94,0x49d9f7d5,0x2dc12f72,0x03f2a27b	! PA = 0000000021800070
	.word	0x2d5f4fc0,0x3beeb8d1,0x64141efe,0x4824ac57	! PA = 0000000021800080
	.word	0x1ee758ac,0x57321a8d,0x619fb44a,0x2dea2cf3	! PA = 0000000021800090
	.word	0x547bc558,0x651ef909,0x0d79db56,0x0f5de04f	! PA = 00000000218000a0
	.word	0x0de6e1c4,0x6976f045,0x64ac4022,0x1967426b	! PA = 00000000218000b0
	.word	0x4b94b9f0,0x35fe5c41,0x39804eae,0x0e568f47	! PA = 00000000218000c0
	.word	0x353f19dc,0x1af858fd,0x248b32fa,0x5b40c2e3	! PA = 00000000218000d0
	.word	0x50598d88,0x5062c279,0x5379d906,0x7c1b993f	! PA = 00000000218000e0
	.word	0x123d60f4,0x73f234b5,0x219cecd2,0x6a998e5b	! PA = 00000000218000f0
	.word	0x1a15a020,0x37ce0bb1,0x2634da5e,0x13c5de37	! PA = 0000000021800100
	.word	0x1e8b170c,0x1e0c636d,0x247dcdaa,0x106084d3	! PA = 0000000021800110
	.word	0x5b3051b8,0x5cee17e9,0x097bb2b6,0x1bfa3e2f	! PA = 0000000021800120
	.word	0x09ad9c24,0x47dac525,0x63863582,0x06d0864b	! PA = 0000000021800130
	.word	0x32ad0250,0x591cc721,0x7f94c20e,0x1e699927	! PA = 0000000021800140
	.word	0x6286503c,0x385d39dd,0x184a845a,0x48f072c3	! PA = 0000000021800150
	.word	0x0dab11e8,0x59dff959,0x42c26866,0x4f50cf1f	! PA = 0000000021800160
	.word	0x30d29354,0x127fa195,0x051b1a32,0x12132a3b	! PA = 0000000021800170
	.word	0x78e5e080,0x3c698e91,0x42c305be,0x24f8c017	! PA = 0000000021800180
	.word	0x7eabc56c,0x4899dc4d,0x6a84570a,0x0d578cb3	! PA = 0000000021800190
	.word	0x6234ce18,0x591766c9,0x1250fa16,0x1f364c0f	! PA = 00000000218001a0
	.word	0x52074684,0x3fefca05,0x6cce9ae2,0x35287a2b	! PA = 00000000218001b0
	.word	0x4a0b3ab0,0x7ef36201,0x44a2a56e,0x3eea5307	! PA = 00000000218001c0
	.word	0x1636769c,0x24314abd,0x697e45ba,0x62bcd2a3	! PA = 00000000218001d0
	.word	0x64f88648,0x1f336039,0x3aea67c6,0x2d81b4ff	! PA = 00000000218001e0
	.word	0x7566b5b4,0x6afa3e75,0x3cd3b792,0x0d97761b	! PA = 00000000218001f0
share3_end:
