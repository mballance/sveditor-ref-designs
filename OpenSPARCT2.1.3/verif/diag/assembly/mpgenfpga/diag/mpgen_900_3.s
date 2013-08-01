/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_900_3.s
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
!	Seed = 626122145
!	Riesling can be on
!	1 Thread, 900 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_900_3.s created on Jun 26, 2009 (12:21:45)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_900_3 -p 1 -l 900

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
!	%f0  = 11e1df30 233ea481 51154dee 060f0987
!	%f4  = 5da4431c 351e153d 2177563a 742d5123
!	%f8  = 4f85fac8 22d832b9 0c166046 0a687b7f
!	%f12 = 03045234 713598f5 3a871812 1d27049b
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 46ae5560 55b1a3f1 158de99e 62682877
!	%f20 = 4dd0d04c 25f66fad 192b00ea 7e1fe313
!	%f24 = 21e24ef8 3018d829 766649f6 0d52f06f
!	%f28 = 5faf1d64 57947965 6edb70c2 6bf2cc8b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 0c454790 1307af61 1605e14e 3179b367
!	%f36 = 0da0997c 26af961d 644cc79a 2046a103
!	%f40 = 13169f28 37a40999 47cf0fa6 03b9515f
!	%f44 = 7982a494 13d3a5d5 1eef6572 390e407b
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xb2c2762e00000052,%g7,%g1 ! %gsr scale = 10, align = 2
	wr	%g1,%g0,%gsr		! %gsr = b2c2762e00000052

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	%l2 = d02c3a202732bd84, Mem[0000000030101408] = b7837849de3d5d33
	stxa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = d02c3a202732bd84
!	%l4 = 68f050d5897b8b2a, Mem[00000000100c1408] = 25968ece
	stba	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 2a968ece
!	Mem[000000001004140b] = 2edb580e, %l5 = 18f04eb99fe4a015
	ldstub	[%i1+0x00b],%l5		! %l5 = 000000000000000e
!	%l1 = c30ca78c43f54ec9, imm = ffffffffffffff4c, %l6 = c730c9f0ef543d10
	and	%l1,-0x0b4,%l6		! %l6 = c30ca78c43f54e48
!	%l2 = d02c3a202732bd84, Mem[0000000010081400] = b0205357
	stwa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 2732bd84
!	%f4  = 5da4431c, Mem[0000000030101400] = a0a77f6c
	sta	%f4 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 5da4431c
!	%f2  = 51154dee 060f0987, %l3 = 7899c09d85a7cb4f
!	Mem[0000000010181428] = 444c1b4622766a7f
	add	%i6,0x028,%g1
	stda	%f2,[%g1+%l3]ASI_PST32_P ! Mem[0000000010181428] = 51154dee060f0987
!	Mem[0000000030001400] = 2006f75f, %l5 = 000000000000000e
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 000000002006f75f
!	%f26 = 766649f6 0d52f06f, %l0 = 48eda61ccfbcfc1e
!	Mem[0000000010181420] = 15995dc81ea429b9
	add	%i6,0x020,%g1
	stda	%f26,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010181420] = 1599520df6496676
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	Mem[00000000201c0000] = 17564a90, %l3 = 7899c09d85a7cb4f
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000017

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101414] = 3edaea7d, %f12 = 03045234
	ld	[%i4+0x014],%f12	! %f12 = 3edaea7d
!	Mem[0000000030181410] = 4b09834c 6cc076ad, %l6 = 43f54e48, %l7 = 91b1251b
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 000000004b09834c 000000006cc076ad
!	Mem[0000000030101408] = 2732bd84, %l5 = 000000002006f75f
	lduwa	[%i4+%o4]0x89,%l5	! %l5 = 000000002732bd84
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800000] = 157278c0, %l7 = 000000006cc076ad
	lduh	[%o1+%g0],%l7		! %l7 = 0000000000001572
!	Mem[0000000010041408] = 2edb58ff1e801727, %f10 = 0c166046 0a687b7f
	ldda	[%i1+%o4]0x80,%f10	! %f10 = 2edb58ff 1e801727
!	Mem[0000000010041404] = 3c6a5521, %l7 = 0000000000001572
	ldsw	[%i1+0x004],%l7		! %l7 = 000000003c6a5521
!	Mem[0000000010101408] = 70e6522e, %l5 = 000000002732bd84
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = 00000000000070e6
!	Mem[0000000010141400] = a1e09165d0696e52, %f16 = 46ae5560 55b1a3f1
	ldda	[%i5+%g0]0x88,%f16	! %f16 = a1e09165 d0696e52
!	Mem[00000000300c1410] = 1a67382c 2300cc0d, %l0 = cfbcfc1e, %l1 = 43f54ec9
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 000000001a67382c 000000002300cc0d
!	Mem[0000000010181400] = 3ea3623077ac3b81, %l2 = d02c3a202732bd84
	ldxa	[%i6+%g0]0x80,%l2	! %l2 = 3ea3623077ac3b81

p0_label_3:
!	Starting 10 instruction Store Burst
!	%l4 = 68f050d5897b8b2a, Mem[0000000030101410] = edd45a6e8cb64d20
	stxa	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 68f050d5897b8b2a
!	Mem[0000000010101408] = 2e52e670, %l2 = 3ea3623077ac3b81
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000070
!	Mem[0000000010181400] = 3ea3623077ac3b81, %l5 = 00000000000070e6, %l3 = 0000000000000017
	casxa	[%i6]0x80,%l5,%l3	! %l3 = 3ea3623077ac3b81
!	%l1 = 000000002300cc0d, Mem[0000000010001400] = f09fbe55
	stwa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 2300cc0d
!	%l4 = 68f050d5897b8b2a, Mem[0000000010141400] = d0696e52
	stba	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = d0696e2a
!	Mem[0000000030001400] = 0e000000 7d1219b1 4387f05e 57e6dc37
!	%f16 = a1e09165 d0696e52 158de99e 62682877
!	%f20 = 4dd0d04c 25f66fad 192b00ea 7e1fe313
!	%f24 = 21e24ef8 3018d829 766649f6 0d52f06f
!	%f28 = 5faf1d64 57947965 6edb70c2 6bf2cc8b
	stda	%f16,[%i0+%g0]ASI_BLK_S	! Block Store to 0000000030001400
!	%l2 = 00000070, %l3 = 77ac3b81, Mem[00000000300c1410] = 1a67382c 2300cc0d
	stda	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000070 77ac3b81
!	%l6 = 000000004b09834c, Mem[0000000030181410] = 4c83094b
	stha	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 4c83834c
!	Mem[0000000010081410] = 124b3c9c, %l2 = 0000000000000070
	swapa	[%i2+%o5]0x80,%l2	! %l2 = 00000000124b3c9c
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0001] = 78a74920, %l7 = 000000003c6a5521
	ldstub	[%o2+0x001],%l7		! %l7 = 00000000000000a7

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 5da4431c, %f15 = 1d27049b
	lda	[%i4+%g0]0x89,%f15	! %f15 = 5da4431c
!	Mem[00000000300c1408] = 082fc27e, %l3 = 3ea3623077ac3b81
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 00000000082fc27e
!	Mem[0000000010181410] = 4301361c, %l0 = 000000001a67382c
	ldsha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000004301
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030001408] = 9ee98d15, %l4 = 68f050d5897b8b2a
	lduwa	[%i0+%o4]0x89,%l4	! %l4 = 000000009ee98d15
!	Mem[0000000030141400] = 00a8b60c, %l0 = 0000000000004301
	lduwa	[%i5+%g0]0x89,%l0	! %l0 = 0000000000a8b60c
!	Mem[0000000030041410] = 1b510b6c 6da64a4d, %l6 = 4b09834c, %l7 = 000000a7
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 000000001b510b6c 000000006da64a4d
!	Mem[0000000030141410] = 7f9124ec, %l1 = 000000002300cc0d
	lduha	[%i5+%o5]0x81,%l1	! %l1 = 0000000000007f91
!	Mem[0000000030081400] = e076a713, %l6 = 000000001b510b6c
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 00000000e076a713
!	Mem[0000000010181432] = 50d92534, %l4 = 000000009ee98d15, %asi = 80
	ldsha	[%i6+0x032]%asi,%l4	! %l4 = 0000000000002534
!	Mem[0000000010181400] = 3ea36230 77ac3b81, %l2 = 124b3c9c, %l3 = 082fc27e
	ldd	[%i6+%g0],%l2		! %l2 = 000000003ea36230 0000000077ac3b81

p0_label_5:
!	Starting 10 instruction Store Burst
!	%f14 = 3a871812 5da4431c, Mem[0000000010081410] = 00000070 7f3f38bd
	stda	%f14,[%i2+%o5]0x80	! Mem[0000000010081410] = 3a871812 5da4431c
!	Mem[0000000030101408] = 2732bd84, %l0 = 0000000000a8b60c
	swapa	[%i4+%o4]0x89,%l0	! %l0 = 000000002732bd84
!	%l6 = 00000000e076a713, Mem[0000000030081400] = 714f6311e076a713
	stxa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000e076a713
!	%f27 = 0d52f06f, Mem[0000000030041410] = 6c0b511b
	sta	%f27,[%i1+%o5]0x89	! Mem[0000000030041410] = 0d52f06f
!	%f12 = 3edaea7d, Mem[0000000030101400] = 1c43a45d
	sta	%f12,[%i4+%g0]0x81	! Mem[0000000030101400] = 3edaea7d
!	%l7 = 000000006da64a4d, Mem[0000000030041408] = 725d1bbe
	stba	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 4d5d1bbe
!	%l6 = e076a713, %l7 = 6da64a4d, Mem[00000000100c1438] = 07e8faf2 5fe60ffb, %asi = 80
	stda	%l6,[%i3+0x038]%asi	! Mem[00000000100c1438] = e076a713 6da64a4d
!	%f2  = 51154dee, Mem[0000000010181400] = 3ea36230
	sta	%f2 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 51154dee
!	%l6 = 00000000e076a713, Mem[0000000010101408] = 2e52e6ff
	stba	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 2e52e613
!	%l4 = 00002534, %l5 = 000070e6, Mem[0000000010101400] = 315f6170 398fb5c1, %asi = 80
	stda	%l4,[%i4+0x000]%asi	! Mem[0000000010101400] = 00002534 000070e6

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = e076a713, %l0 = 000000002732bd84
	ldswa	[%i2+%g0]0x89,%l0	! %l0 = ffffffffe076a713
!	Mem[0000000010181424] = f6496676, %l2 = 000000003ea36230, %asi = 80
	lduwa	[%i6+0x024]%asi,%l2	! %l2 = 00000000f6496676
!	Mem[0000000010101400] = 34250000, %l7 = 000000006da64a4d
	ldsha	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 3a871812, %f5  = 351e153d
	lda	[%i2+%o5]0x80,%f5 	! %f5 = 3a871812
!	Mem[0000000030181400] = 60983f35, %l5 = 00000000000070e6
	ldsba	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000035
!	Mem[0000000010001400] = 0dcc0023, %f27 = 0d52f06f
	lda	[%i0+%g0]0x80,%f27	! %f27 = 0dcc0023
!	%l6 = 00000000e076a713, imm = ffffffffffffff35, %l0 = ffffffffe076a713
	add	%l6,-0x0cb,%l0		! %l0 = 00000000e076a648
!	Mem[0000000010081400] = 84bd3227, %l2 = 00000000f6496676
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000084
!	Mem[0000000030001410] = 4dd0d04c, %l5 = 0000000000000035
	ldsba	[%i0+%o5]0x81,%l5	! %l5 = 000000000000004d
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[0000000021800140] = 49c15a40, %l3 = 0000000077ac3b81
	ldub	[%o3+0x140],%l3		! %l3 = 0000000000000049

p0_label_7:
!	Starting 10 instruction Store Burst
!	%f16 = a1e09165 d0696e52, Mem[0000000030181408] = 16b8849e 710b7777
	stda	%f16,[%i6+%o4]0x81	! Mem[0000000030181408] = a1e09165 d0696e52
!	%l7 = 0000000000000000, Mem[0000000010001408] = aee43f3b
	stba	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = aee43f00
!	%f21 = 25f66fad, Mem[0000000030081400] = 13a776e0
	sta	%f21,[%i2+%g0]0x81	! Mem[0000000030081400] = 25f66fad
!	Mem[0000000030141408] = 1ad8293e, %l6 = 00000000e076a713
	swapa	[%i5+%o4]0x81,%l6	! %l6 = 000000001ad8293e
!	%l2 = 00000084, %l3 = 00000049, Mem[0000000010081400] = 84bd3227 5bf3f001, %asi = 80
	stda	%l2,[%i2+0x000]%asi	! Mem[0000000010081400] = 00000084 00000049
!	%f4  = 5da4431c, Mem[0000000010041410] = 3c161c21
	sta	%f4 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 5da4431c
!	%f2  = 51154dee, Mem[0000000010101408] = 13e6522e
	sta	%f2 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 51154dee
!	%l0 = 00000000e076a648, Mem[0000000010041418] = 12dcfa5a563750c3, %asi = 80
	stxa	%l0,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000e076a648
!	%l2 = 0000000000000084, Mem[0000000010141400] = 2a6e69d0
	stha	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 008469d0
!	%l0 = 00000000e076a648, Mem[0000000010081400] = 00000084
	stwa	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = e076a648

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 2edb58ff, %l2 = 0000000000000084
	ldsba	[%i1+%o4]0x80,%l2	! %l2 = 000000000000002e
!	Mem[0000000030141408] = 13a776e0, %l5 = 000000000000004d
	ldswa	[%i5+%o4]0x89,%l5	! %l5 = 0000000013a776e0
!	Mem[0000000010081420] = 1bf02c48, %l2 = 000000000000002e
	lduw	[%i2+0x020],%l2		! %l2 = 000000001bf02c48
!	Mem[000000001000143c] = 3a102c5b, %l5 = 0000000013a776e0
	lduh	[%i0+0x03c],%l5		! %l5 = 0000000000003a10
!	Mem[00000000100c1408] = 2a968ece, %l6 = 000000001ad8293e
	lduwa	[%i3+%o4]0x80,%l6	! %l6 = 000000002a968ece
!	Mem[0000000030081408] = f74fac7d1eb7373d, %f30 = 6edb70c2 6bf2cc8b
	ldda	[%i2+%o4]0x89,%f30	! %f30 = f74fac7d 1eb7373d
!	Mem[0000000030141400] = 0cb6a800, %l5 = 0000000000003a10
	lduha	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000cb6
!	Mem[0000000010141400] = 008469d0, %l1 = 0000000000007f91
	lduwa	[%i5+%g0]0x80,%l1	! %l1 = 00000000008469d0
!	Mem[00000000211c0000] = 78ff4920, %l3 = 0000000000000049, %asi = 80
	ldsba	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000078
!	Mem[0000000010081408] = 6e3bf05a, %l1 = 00000000008469d0
	ldswa	[%i2+%o4]0x88,%l1	! %l1 = 000000006e3bf05a

p0_label_9:
!	Starting 10 instruction Store Burst
!	%l6 = 000000002a968ece, Mem[0000000010101410] = 5c59c417
	stba	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 5c59c4ce
!	%f12 = 3edaea7d 713598f5, Mem[0000000010041430] = 25c41954 31ff4f95, %asi = 80
	stda	%f12,[%i1+0x030]%asi	! Mem[0000000010041430] = 3edaea7d 713598f5
!	%l4 = 0000000000002534, Mem[00000000300c1408] = 082fc27e
	stha	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 2534c27e
!	Mem[0000000010001410] = 5bd5dfdc, %l0 = 00000000e076a648
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 000000005bd5dfdc
!	Mem[00000000211c0000] = 78ff4920, %l1 = 000000006e3bf05a
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 0000000000000078
!	%l4 = 0000000000002534, Mem[0000000010001408] = 003fe4ae
	stba	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 343fe4ae
!	%f29 = 57947965, Mem[0000000010181400] = ee4d1551
	sta	%f29,[%i6+%g0]0x88	! Mem[0000000010181400] = 57947965
!	%l7 = 0000000000000000, immd = fffff7b8, %y  = 00000000
	sdiv	%l7,-0x848,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	%l3 = 0000000000000078, Mem[0000000010001436] = 20eee2b5, %asi = 80
	stba	%l3,[%i0+0x036]%asi	! Mem[0000000010001434] = 20ee78b5
!	Mem[00000000211c0000] = ffff4920, %l5 = 0000000000000cb6
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00002534, %f10 = 2edb58ff
	lda	[%i4+%g0]0x80,%f10	! %f10 = 00002534
!	%l1 = 0000000000000078, %l0 = 0000000000000000, %y  = 00000000
	sdiv	%l1,%l0,%l0		! Div by zero, %l0 = 0000000000000028
!	Mem[0000000010001410] = e076a6487d4046fd, %l4 = 0000000000002534
	ldx	[%i0+%o5],%l4		! %l4 = e076a6487d4046fd
!	Mem[00000000100c1410] = 9d799d0bfc523b40, %l5 = 00000000000000ff
	ldxa	[%i3+%o5]0x88,%l5	! %l5 = 9d799d0bfc523b40
!	Mem[0000000030181410] = 4c83834c, %l4 = e076a6487d4046fd
	ldswa	[%i6+%o5]0x81,%l4	! %l4 = 000000004c83834c
!	Mem[0000000010181408] = 7de228ee 07639887, %l4 = 4c83834c, %l5 = fc523b40
	ldd	[%i6+%o4],%l4		! %l4 = 000000007de228ee 0000000007639887
!	Mem[0000000030001400] = 526e69d06591e0a1, %f26 = 766649f6 0dcc0023
	ldda	[%i0+%g0]0x89,%f26	! %f26 = 526e69d0 6591e0a1
!	Mem[0000000010001400] = 0dcc0023, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l7	! %l7 = 000000000dcc0023
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010141400] = 008469d0 6591e0a1 1af7858e 31711ea7
!	Mem[0000000010141410] = 61be4fbc 576f8b5d 54329fda 1330f043
!	Mem[0000000010141420] = 0b3d2968 4ab502d9 6c4f5be6 6fbbc49f
!	Mem[0000000010141430] = 0afa42d4 5f34e315 4d8465b2 0c5217bb
	ldda	[%i5+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010141400
!	Mem[0000000010041408] = 2edb58ff, %l1 = 0000000000000078
	ldsba	[%i1+%o4]0x80,%l1	! %l1 = 000000000000002e

p0_label_11:
!	Starting 10 instruction Store Burst
!	%f10 = 6c4f5be6 6fbbc49f, Mem[0000000010181430] = 50d92534 46173ff5, %asi = 80
	stda	%f10,[%i6+0x030]%asi	! Mem[0000000010181430] = 6c4f5be6 6fbbc49f
	membar	#Sync			! Added by membar checker (3)
!	%f2  = 1af7858e, Mem[0000000010141410] = 61be4fbc
	sta	%f2 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 1af7858e
!	%f24 = 21e24ef8 3018d829, Mem[0000000030101410] = 897b8b2a 68f050d5
	stda	%f24,[%i4+%o5]0x89	! Mem[0000000030101410] = 21e24ef8 3018d829
!	%l1 = 000000000000002e, Mem[0000000030041400] = 80465608
	stwa	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000002e
!	%l4 = 000000007de228ee, Mem[00000000201c0000] = ff564a90
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 28ee4a90
!	%l3 = 0000000000000078, Mem[0000000010101434] = 4f9fb635, %asi = 80
	stwa	%l3,[%i4+0x034]%asi	! Mem[0000000010101434] = 00000078
!	%l1 = 000000000000002e, Mem[0000000010141410] = 8e85f71a
	stwa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000002e
!	Mem[0000000030001400] = a1e09165, %l0 = 0000000000000028
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 00000000a1e09165
!	%l0 = 00000000a1e09165, Mem[0000000010001410] = e076a648
	stba	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 6576a648
!	%l5 = 0000000007639887, Mem[0000000030081400] = 25f66fad
	stha	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 98876fad

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 48a676e0, %l5 = 0000000007639887
	ldsha	[%i2+%g0]0x88,%l5	! %l5 = 00000000000076e0
!	Mem[0000000010101410] = 5c59c4ce, %l5 = 00000000000076e0
	ldsha	[%i4+%o5]0x88,%l5	! %l5 = ffffffffffffc4ce
!	Mem[0000000010081400] = 48a676e0, %l7 = 000000000dcc0023
	lduha	[%i2+%g0]0x88,%l7	! %l7 = 00000000000076e0
!	Mem[0000000030141410] = 7f9124ec26c80dcd, %l3 = 0000000000000078
	ldxa	[%i5+%o5]0x81,%l3	! %l3 = 7f9124ec26c80dcd
!	Code Fragment 3, seed = 909303
p0_fragment_1:
!	%l0 = 00000000a1e09165
	setx	0x42c6dc9ada5d1f6e,%g7,%l0 ! %l0 = 42c6dc9ada5d1f6e
!	%l1 = 000000000000002e
	setx	0x76c07678e9da5119,%g7,%l1 ! %l1 = 76c07678e9da5119
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 42c6dc9ada5d1f6e
	setx	0x1cf2cecd8df26ed4,%g7,%l0 ! %l0 = 1cf2cecd8df26ed4
!	%l1 = 76c07678e9da5119
	setx	0x9dbbcee4ef2efb9f,%g7,%l1 ! %l1 = 9dbbcee4ef2efb9f
p0_fragment_1_end:
!	Mem[0000000030081410] = 2df34110cca90537, %l7 = 00000000000076e0
	ldxa	[%i2+%o5]0x89,%l7	! %l7 = 2df34110cca90537
!	Mem[0000000010001400] = 0dcc0023, %l0 = 1cf2cecd8df26ed4
	lduba	[%i0+%g0]0x80,%l0	! %l0 = 000000000000000d
!	Mem[00000000300c1410] = 00000070, %l1 = 9dbbcee4ef2efb9f
	lduwa	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000070
!	Mem[0000000010041418] = 00000000, %l7 = 2df34110cca90537
	ldub	[%i1+0x018],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101410] = cec4595c, %l7 = 0000000000000000
	ldsw	[%i4+%o5],%l7		! %l7 = ffffffffcec4595c

p0_label_13:
!	Starting 10 instruction Store Burst
!	%l2 = 000000001bf02c48, Mem[0000000020800000] = 157278c0
	sth	%l2,[%o1+%g0]		! Mem[0000000020800000] = 2c4878c0
!	Mem[0000000030081400] = ad6f8798, %l0 = 000000000000000d
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 00000000ad6f8798
!	%l7 = ffffffffcec4595c, Mem[0000000010141408] = 8e85f71a
	stha	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 8e85595c
!	%l7 = ffffffffcec4595c, Mem[0000000030041400] = 0000002e
	stha	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000595c
!	%l4 = 7de228ee, %l5 = ffffc4ce, Mem[0000000010141410] = 0000002e 5d8b6f57
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 7de228ee ffffc4ce
!	%l7 = ffffffffcec4595c, Mem[0000000030081400] = 000000000000000d
	stxa	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffffcec4595c
!	Mem[0000000030181400] = 60983f35, %l5 = ffffffffffffc4ce
	ldstuba	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000035
!	Mem[0000000030141410] = ec24917f, %l4 = 000000007de228ee
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 000000000000007f
!	%l1 = 0000000000000070, Mem[0000000010181400] = 65799457
	stha	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 00709457
!	%l4 = 000000000000007f, Mem[0000000010081427] = 0e4cae39, %asi = 80
	stba	%l4,[%i2+0x027]%asi	! Mem[0000000010081424] = 0e4cae7f

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00709457, %f21 = 25f66fad
	lda	[%i6+%g0]0x80,%f21	! %f21 = 00709457
!	Mem[00000000100c1400] = 10491e56, %l0 = 00000000ad6f8798
	lduba	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000056
!	Mem[0000000010101410] = 7deada3e5c59c4ce, %l7 = ffffffffcec4595c
	ldxa	[%i4+%o5]0x88,%l7	! %l7 = 7deada3e5c59c4ce
!	Mem[00000000100c1438] = e076a7136da64a4d, %l3 = 7f9124ec26c80dcd
	ldx	[%i3+0x038],%l3		! %l3 = e076a7136da64a4d
!	Mem[0000000030081410] = 3705a9cc, %l5 = 0000000000000035
	ldsha	[%i2+%o5]0x81,%l5	! %l5 = 0000000000003705
!	Mem[00000000300c1410] = 813bac77 70000000, %l0 = 00000056, %l1 = 00000070
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 0000000070000000 00000000813bac77
!	Mem[0000000020800041] = 19df22f0, %l5 = 0000000000003705, %asi = 80
	lduba	[%o1+0x041]%asi,%l5	! %l5 = 00000000000000df
!	%f28 = 5faf1d64 57947965, %f12 = 0afa42d4 5f34e315
	fxtod	%f28,%f12		! %f12 = 43d7ebc7 5915e51e
!	Mem[0000000030141408] = 13a776e0, %l5 = 00000000000000df
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000e0
!	Mem[0000000010041428] = 30e6be660d360d1f, %f30 = f74fac7d 1eb7373d, %asi = 80
	ldda	[%i1+0x028]%asi,%f30	! %f30 = 30e6be66 0d360d1f

p0_label_15:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00002534, %l6 = 000000002a968ece
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 0000000000002534
!	Mem[0000000010041408] = ff58db2e, %l5 = 00000000000000e0
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 00000000ff58db2e
!	Mem[00000000211c0000] = ffff4920, %l0 = 0000000070000000
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	%f28 = 5faf1d64, Mem[0000000010081400] = 48a676e0
	sta	%f28,[%i2+%g0]0x88	! Mem[0000000010081400] = 5faf1d64
!	Mem[0000000010001420] = 51733388, %l6 = 00002534, %l3 = 6da64a4d
	add	%i0,0x20,%g1
	casa	[%g1]0x80,%l6,%l3	! %l3 = 0000000051733388
!	%f2  = 1af7858e, Mem[0000000030141410] = ec2491ff
	sta	%f2 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 1af7858e
!	%l7 = 7deada3e5c59c4ce, Mem[0000000010181408] = ee28e27d
	stwa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 5c59c4ce
!	%f27 = 6591e0a1, %f20 = 4dd0d04c, %f26 = 526e69d0
	fadds	%f27,%f20,%f26		! %f26 = 6591e0a1
!	Mem[0000000030041408] = 4d5d1bbe, %l3 = 0000000051733388
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 000000000000004d
!	%l1 = 00000000813bac77, Mem[00000000100c1418] = 393eed1a, %asi = 80
	stba	%l1,[%i3+0x018]%asi	! Mem[00000000100c1418] = 773eed1a

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 6ff0520d, %l6 = 0000000000002534
	lduwa	[%i1+%o5]0x81,%l6	! %l6 = 000000006ff0520d
!	Mem[00000000201c0000] = 28ee4a90, %l1 = 00000000813bac77
	lduh	[%o0+%g0],%l1		! %l1 = 00000000000028ee
!	Mem[0000000030181408] = a1e09165 d0696e52, %l4 = 0000007f, %l5 = ff58db2e
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 00000000a1e09165 00000000d0696e52
!	Mem[0000000020800040] = 19df22f0, %l2 = 000000001bf02c48, %asi = 80
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = 00000000000019df
!	Mem[0000000010081428] = 5475bdc61cd1f2ff, %f0  = 008469d0 6591e0a1
	ldd	[%i2+0x028],%f0 	! %f0  = 5475bdc6 1cd1f2ff
!	Mem[0000000010141410] = ee28e27d, %l0 = 00000000000000ff
	lduba	[%i5+%o5]0x80,%l0	! %l0 = 00000000000000ee
!	Mem[0000000010081434] = 4c7cec75, %l3 = 000000000000004d, %asi = 80
	lduwa	[%i2+0x034]%asi,%l3	! %l3 = 000000004c7cec75
!	Mem[00000000100c1400] = 10491e56, %l4 = 00000000a1e09165
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000056
!	Mem[0000000030041400] = 5c590000, %l7 = 7deada3e5c59c4ce
	ldswa	[%i1+%g0]0x81,%l7	! %l7 = 000000005c590000
!	Mem[0000000010081430] = 77373bb44c7cec75, %f12 = 43d7ebc7 5915e51e, %asi = 80
	ldda	[%i2+0x030]%asi,%f12	! %f12 = 77373bb4 4c7cec75

p0_label_17:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ee, Mem[0000000010141400] = 008469d0
	stw	%l0,[%i5+%g0]		! Mem[0000000010141400] = 000000ee
!	Mem[0000000010041408] = e0000000, %l4 = 0000000000000056
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 00000000e0000000
!	Mem[0000000021800000] = 1f95eb50, %l7 = 000000005c590000, %asi = 80
	ldsha	[%o3+0x000]%asi,%l7	! %l7 = 0000000000001f95
!	Mem[0000000030081408] = 1eb7373d, %l2 = 00000000000019df
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 000000001eb7373d
!	%l5 = 00000000d0696e52, Mem[0000000021800041] = 46360980
	stb	%l5,[%o3+0x041]		! Mem[0000000021800040] = 46520980
!	%l5 = 00000000d0696e52, Mem[000000001018143a] = 162dc312, %asi = 80
	stba	%l5,[%i6+0x03a]%asi	! Mem[0000000010181438] = 162d5212
!	%l5 = 00000000d0696e52, Mem[0000000010081410] = 3a871812, %asi = 80
	stha	%l5,[%i2+0x010]%asi	! Mem[0000000010081410] = 6e521812
!	Mem[0000000030141410] = 1af7858e, %l1 = 00000000000028ee
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 000000001af7858e
!	%f24 = 21e24ef8 3018d829, Mem[0000000010181400] = 00709457 77ac3b81
	stda	%f24,[%i6+%g0]0x80	! Mem[0000000010181400] = 21e24ef8 3018d829
!	%l6 = 6ff0520d, %l7 = 00001f95, Mem[0000000030141410] = 000028ee cd0dc826
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 6ff0520d 00001f95

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = cec4595c3edaea7d, %l6 = 000000006ff0520d
	ldxa	[%i4+%o5]0x80,%l6	! %l6 = cec4595c3edaea7d
!	Mem[0000000021800040] = 46520980, %l0 = 00000000000000ee, %asi = 80
	lduha	[%o3+0x040]%asi,%l0	! %l0 = 0000000000004652
!	Mem[0000000010181420] = 1599520d f6496676, %l6 = 3edaea7d, %l7 = 00001f95
	ldd	[%i6+0x020],%l6		! %l6 = 000000001599520d 00000000f6496676
!	Mem[00000000201c0000] = 28ee4a90, %l4 = 00000000e0000000, %asi = 80
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 00000000000028ee
!	Mem[0000000010001410] = 48a67665, %l0 = 0000000000004652
	ldsba	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000065
!	Mem[0000000030181408] = a1e09165d0696e52, %f30 = 30e6be66 0d360d1f
	ldda	[%i6+%o4]0x81,%f30	! %f30 = a1e09165 d0696e52
!	Mem[0000000010081400] = 641daf5f, %l0 = 0000000000000065
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = 00000000641daf5f
!	Mem[0000000030181410] = 4c83834c, %f21 = 00709457
	lda	[%i6+%o5]0x89,%f21	! %f21 = 4c83834c
!	Mem[00000000300c1410] = 813bac77 70000000, %l2 = 1eb7373d, %l3 = 4c7cec75
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 0000000070000000 00000000813bac77
!	Mem[0000000010101410] = cec4595c, %l5 = 00000000d0696e52
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 000000000000cec4

p0_label_19:
!	Starting 10 instruction Store Burst
!	%l6 = 000000001599520d, Mem[0000000030141410] = 0d52f06f
	stwa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 1599520d
!	%l7 = 00000000f6496676, Mem[0000000010001408] = 343fe4ae37620d47
	stxa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000f6496676
!	%l6 = 000000001599520d, Mem[0000000010181410] = 4301361c, %asi = 80
	stwa	%l6,[%i6+0x010]%asi	! Mem[0000000010181410] = 1599520d
!	Mem[0000000010081400] = 5faf1d64, %l7 = 00000000f6496676
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 000000005faf1d64
!	Mem[0000000030001410] = 4cd0d04d, %l6 = 000000001599520d
	ldstuba	[%i0+%o5]0x89,%l6	! %l6 = 000000000000004d
!	Mem[0000000010041406] = 3c6a5521, %l1 = 000000001af7858e
	ldstuba	[%i1+0x006]%asi,%l1	! %l1 = 0000000000000055
!	%f18 = 158de99e 62682877, Mem[0000000030141400] = 0cb6a800 4b948811
	stda	%f18,[%i5+%g0]0x81	! Mem[0000000030141400] = 158de99e 62682877
!	%l6 = 000000000000004d, Mem[0000000030181408] = a1e09165
	stha	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 004d9165
!	Mem[0000000010181434] = 6fbbc49f, %l5 = 0000cec4, %l2 = 70000000
	add	%i6,0x34,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 000000006fbbc49f
!	Mem[0000000030141410] = 0d529915, %l4 = 00000000000028ee
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 000000000d529915

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 1599520d, %f19 = 62682877
	lda	[%i6+%o5]0x80,%f19	! %f19 = 1599520d
!	Mem[0000000030041410] = 0d52f06f, %l4 = 000000000d529915
	ldsba	[%i1+%o5]0x89,%l4	! %l4 = 000000000000006f
!	Mem[0000000030041410] = 6ff0520d, %l2 = 000000006fbbc49f
	lduba	[%i1+%o5]0x81,%l2	! %l2 = 000000000000006f
!	%l1 = 0000000000000055, imm = 000000000000084f, %l4 = 000000000000006f
	sub	%l1,0x84f,%l4		! %l4 = fffffffffffff806
!	Mem[0000000010081400] = 49000000 f6496676, %l6 = 0000004d, %l7 = 5faf1d64
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 00000000f6496676 0000000049000000
!	Mem[0000000010101415] = 3edaea7d, %l7 = 0000000049000000
	ldub	[%i4+0x015],%l7		! %l7 = 00000000000000da
!	Mem[0000000010041400] = 50e8a567, %f14 = 4d8465b2
	lda	[%i1+%g0]0x88,%f14	! %f14 = 50e8a567
!	Mem[0000000030141408] = e076a7131eed2597, %f8  = 0b3d2968 4ab502d9
	ldda	[%i5+%o4]0x81,%f8 	! %f8  = e076a713 1eed2597
!	Mem[0000000010141400] = ee000000, %l6 = 00000000f6496676
	ldswa	[%i5+%g0]0x88,%l6	! %l6 = ffffffffee000000
!	Mem[0000000010001400] = 41ea18272300cc0d, %f0  = 5475bdc6 1cd1f2ff
	ldda	[%i0+%g0]0x88,%f0 	! %f0  = 41ea1827 2300cc0d

p0_label_21:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000055, Mem[0000000010041410] = 5da4431c
	stha	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 5da40055
!	%l6 = ffffffffee000000, Mem[0000000010101408] = 51154dee
	stwa	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = ee000000
!	%l1 = 0000000000000055, Mem[0000000030141400] = 158de99e
	stba	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 558de99e
!	%l6 = ee000000, %l7 = 000000da, Mem[00000000100c1408] = 2a968ece 673d3ae7, %asi = 80
	stda	%l6,[%i3+0x008]%asi	! Mem[00000000100c1408] = ee000000 000000da
!	%f3  = 31711ea7, Mem[0000000030081410] = cca90537
	sta	%f3 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 31711ea7
!	%f2  = 1af7858e 31711ea7, %l3 = 00000000813bac77
!	Mem[0000000030041410] = 6ff0520d6da64a4d
	add	%i1,0x010,%g1
	stda	%f2,[%g1+%l3]ASI_PST16_S ! Mem[0000000030041410] = 6ff0858e31711ea7
!	Mem[0000000010141400] = 000000ee, %l7 = 00000000000000da
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l5 = 000000000000cec4, %l1 = 0000000000000055, %l7 = 0000000000000000
	udivx	%l5,%l1,%l7		! %l7 = 000000000000026e
!	Mem[00000000300c1408] = 2534c27e, %l7 = 000000000000026e
	swapa	[%i3+%o4]0x81,%l7	! %l7 = 000000002534c27e
!	Mem[0000000010141400] = ff0000ee, %l1 = 0000000000000055
	ldstuba	[%i5+%g0]0x80,%l1	! %l1 = 00000000000000ff

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 7deada3e, %l7 = 000000002534c27e
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = 000000007deada3e
!	%l7 = 000000007deada3e, imm = 0000000000000984, %l4 = fffffffffffff806
	subc	%l7,0x984,%l4		! %l4 = 000000007dead0ba
!	Mem[0000000030101408] = 00a8b60c, %f12 = 77373bb4
	lda	[%i4+%o4]0x89,%f12	! %f12 = 00a8b60c
!	Mem[0000000010041410] = 5500a45d, %l4 = 000000007dead0ba
	lduha	[%i1+%o5]0x80,%l4	! %l4 = 0000000000005500
!	Mem[0000000030081408] = df190000, %l3 = 00000000813bac77
	ldswa	[%i2+%o4]0x81,%l3	! %l3 = ffffffffdf190000
!	Mem[0000000030081410] = 2df3411031711ea7, %f4  = 61be4fbc 576f8b5d
	ldda	[%i2+%o5]0x89,%f4 	! %f4  = 2df34110 31711ea7
!	Mem[0000000030181400] = f1fad75f 60983fff, %l2 = 0000006f, %l3 = df190000
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 0000000060983fff 00000000f1fad75f
!	Mem[00000000100c1400] = 561e49103aadbae1, %f20 = 4dd0d04c 4c83834c
	ldd	[%i3+%g0],%f20		! %f20 = 561e4910 3aadbae1
!	Mem[0000000010101410] = cec4595c, %l0 = 00000000641daf5f
	ldswa	[%i4+%o5]0x80,%l0	! %l0 = ffffffffcec4595c
!	Mem[0000000010041400] = 50e8a567, %l3 = 00000000f1fad75f
	lduba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000067

p0_label_23:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffcec4595c, Mem[0000000010041420] = 5af3b7e85f664759
	stx	%l0,[%i1+0x020]		! Mem[0000000010041420] = ffffffffcec4595c
!	Mem[0000000030041408] = ff5d1bbe, %l4 = 0000000000005500
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001408] = 9ee98d15, %l7 = 000000007deada3e
	swapa	[%i0+%o4]0x89,%l7	! %l7 = 000000009ee98d15
!	%l3 = 0000000000000067, Mem[0000000010181408] = cec4595c, %asi = 80
	stwa	%l3,[%i6+0x008]%asi	! Mem[0000000010181408] = 00000067
!	Mem[0000000010041413] = 5500a45d, %l0 = ffffffffcec4595c
	ldstuba	[%i1+0x013]%asi,%l0	! %l0 = 000000000000005d
!	Mem[00000000211c0001] = ffff4920, %l7 = 000000009ee98d15
	ldstub	[%o2+0x001],%l7		! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010081408] = 5af03b6e798bd107
	stxa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000000000ff
!	%f12 = 00a8b60c, Mem[00000000100c1430] = 1c014e14
	sta	%f12,[%i3+0x030]%asi	! Mem[00000000100c1430] = 00a8b60c
!	Mem[0000000010101400] = ce8e962a, %l0 = 000000000000005d
	swapa	[%i4+%g0]0x88,%l0	! %l0 = 00000000ce8e962a
!	%f26 = 6591e0a1 6591e0a1, Mem[0000000030101408] = 00a8b60c d02c3a20
	stda	%f26,[%i4+%o4]0x89	! Mem[0000000030101408] = 6591e0a1 6591e0a1

p0_label_24:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010081400] = 766649f6 00000049 00000000 000000ff
!	Mem[0000000010081410] = 6e521812 5da4431c 0dc7bbba 747eb0a3
!	Mem[0000000010081420] = 1bf02c48 0e4cae7f 5475bdc6 1cd1f2ff
!	Mem[0000000010081430] = 77373bb4 4c7cec75 1dc6ed92 5444141b
	ldda	[%i2+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010081400
!	Mem[000000001018143c] = 678c239b, %l6 = ffffffffee000000, %asi = 80
	lduha	[%i6+0x03c]%asi,%l6	! %l6 = 000000000000678c
!	Mem[00000000100c1438] = e076a713 6da64a4d, %l6 = 0000678c, %l7 = 000000ff
	ldd	[%i3+0x038],%l6		! %l6 = 00000000e076a713 000000006da64a4d
!	Mem[0000000010141410] = ee28e27d, %l2 = 0000000060983fff
	lduwa	[%i5+%o5]0x80,%l2	! %l2 = 00000000ee28e27d
!	Mem[00000000300c1408] = 6e020000, %l1 = 00000000000000ff
	ldswa	[%i3+%o4]0x89,%l1	! %l1 = 000000006e020000
!	Mem[0000000010001408] = 00000000f6496676, %f22 = 192b00ea 7e1fe313
	ldda	[%i0+%o4]0x80,%f22	! %f22 = 00000000 f6496676
!	Mem[0000000030181400] = 60983fff, %l3 = 0000000000000067
	lduba	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = f84ee221, %l6 = 00000000e076a713
	ldsha	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffe221
!	Mem[0000000010081420] = 1bf02c48, %l6 = ffffffffffffe221, %asi = 80
	lduwa	[%i2+0x020]%asi,%l6	! %l6 = 000000001bf02c48
!	Mem[00000000201c0000] = 28ee4a90, %l3 = 00000000000000ff, %asi = 80
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000028ee

p0_label_25:
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 0000cec4, Mem[0000000010141410] = 7de228ee ffffc4ce
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff 0000cec4
!	%f0  = 49000000 f6496676, %l0 = 00000000ce8e962a
!	Mem[0000000010041408] = 000000561e801727
	add	%i1,0x008,%g1
	stda	%f0,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010041408] = 0000005600000049
!	Mem[0000000030101410] = 3018d829, %l6 = 000000001bf02c48
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000029
!	%l6 = 00000029, %l7 = 6da64a4d, Mem[0000000010181410] = 1599520d 7fd35c3d
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000029 6da64a4d
!	Mem[0000000030081410] = 31711ea7, %l2 = 00000000ee28e27d
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 00000000000000a7
!	%f2  = ff000000 00000000, %l2 = 00000000000000a7
!	Mem[0000000010181410] = 000000296da64a4d
	add	%i6,0x010,%g1
	stda	%f2,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010181410] = 00000000000000ff
!	Mem[0000000010041410] = ffa40055, %l4 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000055
!	Mem[0000000010081410] = 6e521812, %l0 = 00000000ce8e962a
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 000000000000006e
!	Mem[0000000030041408] = ff5d1bbe, %l3 = 00000000000028ee
	swapa	[%i1+%o4]0x81,%l3	! %l3 = 00000000ff5d1bbe
!	Mem[000000001018140c] = 07639887, %l3 = 00000000ff5d1bbe
	ldstuba	[%i6+0x00c]%asi,%l3	! %l3 = 0000000000000007

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l4 = 0000000000000055
	ldsba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 5c590000, %l4 = 0000000000000000
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = 0000000000005c59
!	Mem[0000000030101400] = 7deada3e, %l0 = 000000000000006e
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 000000007deada3e
!	Mem[0000000010001408] = 00000000, %l6 = 0000000000000029
	lduha	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001418] = 66e6a8fa 1f8ca0e3, %l0 = 7deada3e, %l1 = 6e020000
	ldd	[%i0+0x018],%l0		! %l0 = 0000000066e6a8fa 000000001f8ca0e3
!	Mem[0000000010181400] = f84ee221, %l2 = 00000000000000a7
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000021
!	Mem[0000000030181408] = 65914d00, %l0 = 0000000066e6a8fa
	ldswa	[%i6+%o4]0x89,%l0	! %l0 = 0000000065914d00
!	Mem[0000000010041414] = 474827dd, %l4 = 0000000000005c59
	ldub	[%i1+0x014],%l4		! %l4 = 0000000000000047
!	Mem[0000000010181408] = 00000067ff639887, %f28 = 5faf1d64 57947965
	ldda	[%i6+%o4]0x80,%f28	! %f28 = 00000067 ff639887
!	Mem[0000000010041410] = dd274847 ffa400ff, %l0 = 65914d00, %l1 = 1f8ca0e3
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 00000000ffa400ff 00000000dd274847

p0_label_27:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 3edaea7d 3a654531 a1e09165 a1e09165
!	%f0  = 49000000 f6496676 ff000000 00000000
!	%f4  = 1c43a45d 1218526e a3b07e74 babbc70d
!	%f8  = 7fae4c0e 482cf01b fff2d11c c6bd7554
!	%f12 = 75ec7c4c b43b3777 1b144454 92edc61d
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	%l0 = ffa400ff, %l1 = dd274847, Mem[00000000100c1418] = 773eed1a 769ac083
	std	%l0,[%i3+0x018]		! Mem[00000000100c1418] = ffa400ff dd274847
!	%l6 = 0000000000000000, Mem[0000000010041400] = 50e8a567
	stha	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 50e80000
!	%l2 = 0000000000000021, immd = 00000d2d, %y  = 00000000
	udiv	%l2,0xd2d,%l4		! %l4 = 0000000000000000
	mov	%l0,%y			! %y = ffa400ff
!	%l4 = 0000000000000000, %l1 = 00000000dd274847, %l3 = 0000000000000007
	xnor	%l4,%l1,%l3		! %l3 = ffffffff22d8b7b8
!	Mem[0000000021800000] = 1f95eb50, %l2 = 0000000000000021
	ldstub	[%o3+%g0],%l2		! %l2 = 000000000000001f
!	Mem[00000000201c0000] = 28ee4a90, %l4 = 0000000000000000
	ldstub	[%o0+%g0],%l4		! %l4 = 0000000000000028
!	%f2  = ff000000 00000000, %l6 = 0000000000000000
!	Mem[0000000010141410] = ff000000c4ce0000
	add	%i5,0x010,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_P ! Mem[0000000010141410] = ff000000c4ce0000
!	%l6 = 00000000, %l7 = 6da64a4d, Mem[0000000010181410] = 00000000 000000ff
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 6da64a4d
!	%f24 = 21e24ef8, %f18 = 158de99e, %f19 = 1599520d
	fadds	%f24,%f18,%f19		! %f19 = 21e24ef9

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[000000001014141f] = 1330f043, %l7 = 000000006da64a4d
	ldsb	[%i5+0x01f],%l7		! %l7 = 0000000000000043
!	%l0 = 00000000ffa400ff, Mem[00000000300c1400] = 40974241
	stba	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 409742ff
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000030101410] = 6e5218125da4431c, %l3 = ffffffff22d8b7b8
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = 6e5218125da4431c
!	Mem[0000000030041400] = 0000595c, %l5 = 000000000000cec4
	ldsha	[%i1+%g0]0x89,%l5	! %l5 = 000000000000595c
!	Mem[0000000030181400] = 60983fff, %l7 = 0000000000000043
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001410] = 48a67665, %l4 = 0000000000000028
	ldswa	[%i0+%o5]0x88,%l4	! %l4 = 0000000048a67665
!	Mem[0000000030001400] = 00000028 d0696e52 3edaea7d 62682877
!	Mem[0000000030001410] = ffd0d04c 25f66fad 192b00ea 7e1fe313
!	Mem[0000000030001420] = 21e24ef8 3018d829 766649f6 0d52f06f
!	Mem[0000000030001430] = 5faf1d64 57947965 6edb70c2 6bf2cc8b
	ldda	[%i0+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030001400
!	Mem[0000000010001400] = 41ea18272300cc0d, %l6 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l6	! %l6 = 41ea18272300cc0d
!	Mem[0000000030141410] = ee280000 951f0000, %l2 = 0000001f, %l3 = 5da4431c
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 00000000ee280000 00000000951f0000
!	Mem[0000000030181408] = 65914d00, %l7 = 00000000000000ff
	lduwa	[%i6+%o4]0x89,%l7	! %l7 = 0000000065914d00

p0_label_29:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (6)
!	%l1 = 00000000dd274847, Mem[0000000030001408] = 7deada3e
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = dd274847
!	%l6 = 41ea18272300cc0d, Mem[0000000010141438] = 4d8465b20c5217bb, %asi = 80
	stxa	%l6,[%i5+0x038]%asi	! Mem[0000000010141438] = 41ea18272300cc0d
!	%l6 = 41ea18272300cc0d, Mem[0000000010001438] = 2be222d2, %asi = 80
	stwa	%l6,[%i0+0x038]%asi	! Mem[0000000010001438] = 2300cc0d
!	Mem[0000000030081408] = 000019df, %l5 = 000000000000595c
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000df
!	Mem[00000000100c141c] = dd274847, %l0 = 00000000ffa400ff
	swap	[%i3+0x01c],%l0		! %l0 = 00000000dd274847
!	Mem[0000000010001424] = 23d61079, %l4 = 0000000048a67665
	ldstub	[%i0+0x024],%l4		! %l4 = 0000000000000023
!	%l6 = 41ea18272300cc0d, Mem[0000000010081400] = 766649f6
	stha	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = cc0d49f6
!	Mem[0000000010001400] = 2300cc0d, %l7 = 0000000065914d00
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 000000000000000d
!	%l5 = 00000000000000df, Mem[00000000300c1408] = 6e020000
	stha	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 6e0200df
!	%l7 = 000000000000000d, Mem[0000000030181400] = ff3f9860
	stwa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000d

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = df00026e 67f591d7, %l0 = dd274847, %l1 = dd274847
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 00000000df00026e 0000000067f591d7
!	Mem[0000000010041400] = 0000e850, %l3 = 00000000951f0000
	ldsha	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l7 = 000000000000000d
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[000000001010143c] = 3582bbdb, %l6 = 41ea18272300cc0d, %asi = 80
	ldsha	[%i4+0x03c]%asi,%l6	! %l6 = 0000000000003582
!	Mem[0000000010041408] = 00000056, %l2 = 00000000ee280000
	ldsha	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = df00026e, %l3 = 0000000000000000
	ldswa	[%i3+%o4]0x81,%l3	! %l3 = ffffffffdf00026e
!	Mem[0000000030181400] = 0000000d5fd7faf1, %f0  = 49000000 f6496676
	ldda	[%i6+%g0]0x81,%f0 	! %f0  = 0000000d 5fd7faf1
!	Mem[0000000030101408] = ff000000, %f3  = 00000000
	lda	[%i4+%o4]0x81,%f3 	! %f3 = ff000000
!	Mem[00000000100c1410] = 9d799d0bfc523b40, %f10 = fff2d11c c6bd7554
	ldda	[%i3+%o5]0x88,%f10	! %f10 = 9d799d0b fc523b40
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010141400] = ff0000ee 6591e0a1 5c59858e 31711ea7
!	Mem[0000000010141410] = ff000000 c4ce0000 54329fda 1330f043
!	Mem[0000000010141420] = 0b3d2968 4ab502d9 6c4f5be6 6fbbc49f
!	Mem[0000000010141430] = 0afa42d4 5f34e315 41ea1827 2300cc0d
	ldda	[%i5+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010141400

p0_label_31:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000100c140e] = 000000da, %asi = 80
	stha	%l7,[%i3+0x00e]%asi	! Mem[00000000100c140c] = 00000000
!	Mem[0000000030081400] = cec4595c, %l5 = 00000000000000df
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 00000000cec4595c
!	%l7 = 0000000000000000, Mem[0000000030101410] = 5da4431c
	stwa	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[00000000300c1400] = 409742ff, %l7 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l0 = 00000000df00026e, Mem[0000000030041410] = a71e71318e85f06f
	stxa	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000df00026e
!	Mem[0000000010081400] = f6490dcc, %l4 = 0000000000000023
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000cc
	membar	#Sync			! Added by membar checker (8)
!	%l2 = 0000000000000000, Mem[0000000010141400] = ff0000ee, %asi = 80
	stwa	%l2,[%i5+0x000]%asi	! Mem[0000000010141400] = 00000000
!	%l7 = 00000000000000ff, Mem[0000000030141400] = 9ee98d55
	stwa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	%l4 = 00000000000000cc, Mem[0000000030001408] = dd274847
	stwa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000cc
!	%f10 = 6c4f5be6 6fbbc49f, %l3 = ffffffffdf00026e
!	Mem[00000000100c1428] = 5f7c2d261ca188df
	add	%i3,0x028,%g1
	stda	%f10,[%g1+%l3]ASI_PST8_P ! Mem[00000000100c1428] = 5f4f5b266fbbc4df

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141414] = c4ce0000, %l1 = 0000000067f591d7
	lduh	[%i5+0x014],%l1		! %l1 = 000000000000c4ce
!	Mem[0000000030141408] = e076a713 1eed2597, %l6 = 00003582, %l7 = 000000ff
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 00000000e076a713 000000001eed2597
!	Mem[0000000010081404] = 00000049, %l6 = 00000000e076a713, %asi = 80
	lduha	[%i2+0x004]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = 4c83834c, %l2 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l2	! %l2 = 000000004c83834c
!	Mem[0000000010101410] = cec4595c, %l2 = 000000004c83834c
	ldsha	[%i4+%o5]0x80,%l2	! %l2 = ffffffffffffcec4
!	Mem[0000000021800181] = 653de470, %l2 = ffffffffffffcec4, %asi = 80
	lduba	[%o3+0x181]%asi,%l2	! %l2 = 000000000000003d
!	Mem[0000000010101410] = 7deada3e 5c59c4ce, %l4 = 000000cc, %l5 = cec4595c
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 000000005c59c4ce 000000007deada3e
!	Mem[0000000010081420] = 1bf02c48, %l3 = ffffffffdf00026e, %asi = 80
	lduha	[%i2+0x020]%asi,%l3	! %l3 = 0000000000001bf0
!	Mem[00000000300c1410] = 0000007077ac3b81, %f18 = 3edaea7d 62682877
	ldda	[%i3+%o5]0x81,%f18	! %f18 = 00000070 77ac3b81
!	Mem[0000000030001400] = 28000000, %f23 = 7e1fe313
	lda	[%i0+%g0]0x89,%f23	! %f23 = 28000000

p0_label_33:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c143d] = 6da64a4d, %l2 = 000000000000003d
	ldstuba	[%i3+0x03d]%asi,%l2	! %l2 = 00000000000000a6
!	Mem[0000000030041410] = df00026e, %l5 = 000000007deada3e
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 000000000000006e
!	Mem[0000000030101410] = 00000000, %l3 = 0000000000001bf0
	ldstuba	[%i4+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%f18 = 00000070 77ac3b81, %l7 = 000000001eed2597
!	Mem[0000000030181410] = 4c83834c6cc076ad
	add	%i6,0x010,%g1
	stda	%f18,[%g1+%l7]ASI_PST16_S ! Mem[0000000030181410] = 4c83007077ac3b81
!	%f6  = 54329fda 1330f043, Mem[0000000010001410] = 6576a648 7d4046fd
	stda	%f6 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 54329fda 1330f043
!	Mem[00000000100c1400] = 561e4910 3aadbae1 ee000000 00000000
!	%f0  = ff0000ee 6591e0a1 5c59858e 31711ea7
!	%f4  = ff000000 c4ce0000 54329fda 1330f043
!	%f8  = 0b3d2968 4ab502d9 6c4f5be6 6fbbc49f
!	%f12 = 0afa42d4 5f34e315 41ea1827 2300cc0d
	stda	%f0 ,[%i3+%g0]ASI_BLK_P	! Block Store to 00000000100c1400
!	%f17 = d0696e52, Mem[0000000030001400] = 28000000
	sta	%f17,[%i0+%g0]0x89	! Mem[0000000030001400] = d0696e52
!	Mem[0000000030181410] = 4c830070, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 000000004c830070
!	%l3 = 000000004c830070, Mem[00000000300c1400] = ff429740
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 70429740
!	Mem[0000000010081400] = ff0d49f6, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 00000000ff0d49f6

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 000028ee 19e4be17, %l6 = ff0d49f6, %l7 = 1eed2597
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 00000000000028ee 0000000019e4be17
!	Mem[0000000030141400] = 000000ff, %l7 = 0000000019e4be17
	lduha	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %f17 = d0696e52
	lda	[%i6+%o5]0x88,%f17	! %f17 = 00000000
!	Mem[0000000030001410] = 4cd0d0ff, %f16 = 00000028
	lda	[%i0+%o5]0x89,%f16	! %f16 = 4cd0d0ff
!	%f16 = 4cd0d0ff, %f17 = 00000000, %f29 = 57947965
	fsubs	%f16,%f17,%f29		! %f29 = 4cd0d0ff
!	Mem[0000000010181408] = 67000000, %l7 = 00000000000000ff
	ldsha	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800140] = 49c15a40, %l5 = 000000000000006e, %asi = 80
	ldsha	[%o3+0x140]%asi,%l5	! %l5 = 00000000000049c1
!	Mem[00000000211c0000] = ffff4920, %l6 = 00000000000028ee
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[0000000030081408] = f74fac7d 000019ff, %l4 = 5c59c4ce, %l5 = 000049c1
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 00000000000019ff 00000000f74fac7d
!	Mem[0000000010001400] = ffcc0023, %f21 = 25f66fad
	lda	[%i0+%g0]0x80,%f21	! %f21 = ffcc0023

p0_label_35:
!	Starting 10 instruction Store Burst
!	%f22 = 192b00ea 28000000, Mem[0000000010001400] = ffcc0023 2718ea41
	stda	%f22,[%i0+%g0]0x80	! Mem[0000000010001400] = 192b00ea 28000000
!	Mem[0000000010001400] = ea002b19, %l7 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000019
!	Mem[0000000030001410] = ffd0d04c, %l0 = 00000000df00026e
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l5 = 00000000f74fac7d, Mem[0000000010101410] = cec4595c
	stba	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 7dc4595c
!	Mem[0000000030181408] = 004d9165, %l3 = 000000004c830070
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = 00000049, %l5 = 00000000f74fac7d
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000049
!	%f0  = ff0000ee 6591e0a1, %l1 = 000000000000c4ce
!	Mem[0000000030041428] = 24f8d01607610a0f
	add	%i1,0x028,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_S ! Mem[0000000030041428] = ff0000ee65910a0f
!	Mem[00000000201c0000] = ffee4a90, %l2 = 00000000000000a6
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	%l7 = 0000000000000019, %l2 = 00000000000000ff, %y  = ffa400ff
	smul	%l7,%l2,%l1		! %l1 = 00000000000018e7, %y = 00000000
!	%l5 = 0000000000000049, Mem[0000000030181408] = 65914dff
	stha	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 65910049

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 19df22f0, %l1 = 00000000000018e7
	ldsb	[%o1+0x040],%l1		! %l1 = 0000000000000019
!	Mem[0000000030041408] = 000028ee, %f21 = ffcc0023
	lda	[%i1+%o4]0x81,%f21	! %f21 = 000028ee
!	Mem[0000000030001410] = ad6ff6254cd0d0ff, %l0 = 00000000000000ff
	ldxa	[%i0+%o5]0x89,%l0	! %l0 = ad6ff6254cd0d0ff
!	Mem[0000000030001408] = cc00000062682877, %f28 = 5faf1d64 4cd0d0ff
	ldda	[%i0+%o4]0x81,%f28	! %f28 = cc000000 62682877
!	Mem[00000000211c0000] = ffff4920, %l0 = ad6ff6254cd0d0ff
	ldsh	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010041408] = 56000000, %l0 = ffffffffffffffff
	ldswa	[%i1+%o4]0x88,%l0	! %l0 = 0000000056000000
!	Mem[0000000010041400] = 0000e850, %l7 = 0000000000000019
	ldswa	[%i1+%g0]0x80,%l7	! %l7 = 000000000000e850
	membar	#Sync			! Added by membar checker (9)
!	Mem[00000000100c1408] = 5c59858e31711ea7, %l3 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l3	! %l3 = 5c59858e31711ea7
!	Mem[0000000030101400] = 766649f6f74fac7d, %f14 = 41ea1827 2300cc0d
	ldda	[%i4+%g0]0x89,%f14	! %f14 = 766649f6 f74fac7d
!	Mem[0000000030001400] = 526e69d0 d0696e52, %l2 = 000000ff, %l3 = 31711ea7
	ldda	[%i0+%g0]0x89,%l2	! %l2 = 00000000d0696e52 00000000526e69d0

p0_label_37:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000056000000, Mem[00000000100c1402] = ff0000ee, %asi = 80
	stha	%l0,[%i3+0x002]%asi	! Mem[00000000100c1400] = ff000000
!	%l6 = 000000000000ffff, Mem[0000000030001410] = 4cd0d0ff
	stha	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 4cd0ffff
!	Mem[0000000010001400] = ff2b00ea, %l1 = 0000000000000019
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ff2b00ea
!	%l3 = 00000000526e69d0, Mem[0000000020800000] = 2c4878c0
	sth	%l3,[%o1+%g0]		! Mem[0000000020800000] = 69d078c0
!	%l4 = 00000000000019ff, Mem[0000000030041400] = 5c5900005fa09c91
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000000019ff
!	Mem[0000000030141410] = ee280000, %l7 = 000000000000e850
	ldstuba	[%i5+%o5]0x81,%l7	! %l7 = 00000000000000ee
!	Mem[0000000010181400] = f84ee221, %l3 = 00000000526e69d0
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 00000000f84ee221
!	Mem[0000000030001410] = ffffd04c, %l6 = 000000000000ffff
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l7 = 00000000000000ee, Mem[0000000030041400] = 00000000
	stha	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00ee0000
!	%f4  = ff000000 c4ce0000, %l4 = 00000000000019ff
!	Mem[0000000030181418] = 025c8bea1b986213
	add	%i6,0x018,%g1
	stda	%f4,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030181418] = 0000cec4000000ff

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 49009165, %l6 = 00000000000000ff
	ldsba	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000049
!	Mem[0000000010041438] = 49f750322764c83b, %l5 = 0000000000000049, %asi = 80
	ldxa	[%i1+0x038]%asi,%l5	! %l5 = 49f750322764c83b
!	Mem[0000000030101400] = 7dac4ff7, %l0 = 0000000056000000
	lduha	[%i4+%g0]0x81,%l0	! %l0 = 0000000000007dac
!	Mem[0000000030101408] = 000000ff, %f30 = 6edb70c2
	lda	[%i4+%o4]0x89,%f30	! %f30 = 000000ff
!	Mem[0000000010101418] = 32da8e7a, %l7 = 00000000000000ee
	lduw	[%i4+0x018],%l7		! %l7 = 0000000032da8e7a
!	Mem[0000000030141408] = e076a713 1eed2597, %l0 = 00007dac, %l1 = ff2b00ea
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000e076a713 000000001eed2597
!	Mem[00000000100c1410] = ff000000, %l0 = 00000000e076a713
	ldsha	[%i3+%o5]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010001410] = 54329fda, %l5 = 49f750322764c83b
	lduwa	[%i0+%o5]0x80,%l5	! %l5 = 0000000054329fda
!	Mem[0000000030141410] = 000028ff, %l6 = 0000000000000049
	ldsha	[%i5+%o5]0x89,%l6	! %l6 = 00000000000028ff
!	Mem[0000000030001410] = 4cd0ffff, %f1  = 6591e0a1
	lda	[%i0+%o5]0x89,%f1 	! %f1 = 4cd0ffff

p0_label_39:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 54329fda, %l5 = 0000000054329fda
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000054
!	Mem[0000000010041400] = 0000e850, %l0 = ffffffffffffff00
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f19 = 77ac3b81, Mem[0000000030181408] = 65910049
	sta	%f19,[%i6+%o4]0x89	! Mem[0000000030181408] = 77ac3b81
!	%f12 = 0afa42d4, Mem[00000000300c1400] = 70429740
	sta	%f12,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0afa42d4
!	Code Fragment 3, seed = 307606
p0_fragment_2:
!	%l0 = 0000000000000000
	setx	0xc661068fb8656176,%g7,%l0 ! %l0 = c661068fb8656176
!	%l1 = 000000001eed2597
	setx	0x52014636401d94a1,%g7,%l1 ! %l1 = 52014636401d94a1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c661068fb8656176
	setx	0xc0635d7ac4befbdc,%g7,%l0 ! %l0 = c0635d7ac4befbdc
!	%l1 = 52014636401d94a1
	setx	0x1c6e8f6dd1209a27,%g7,%l1 ! %l1 = 1c6e8f6dd1209a27
p0_fragment_2_end:
!	%f27 = 0d52f06f, Mem[000000001014141c] = 1330f043
	sta	%f27,[%i5+0x01c]%asi	! Mem[000000001014141c] = 0d52f06f
!	%l5 = 0000000000000054, Mem[0000000030001400] = d0696e52
	stba	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = d0696e54
!	%l5 = 0000000000000054, Mem[0000000021800141] = 49c15a40, %asi = 80
	stba	%l5,[%o3+0x141]%asi	! Mem[0000000021800140] = 49545a40
!	%f28 = cc000000, %f13 = 5f34e315, %f28 = cc000000
	fmuls	%f28,%f13,%f28		! %f28 = ebb4e315
!	Mem[0000000010101400] = 5d000000, %l0 = c0635d7ac4befbdc
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 000000000000005d

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 67000000, %l0 = 000000000000005d
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = 0000000067000000
!	%f18 = 00000070, %f4  = ff000000, %f19 = 77ac3b81
	fdivs	%f18,%f4 ,%f19		! %f19 = 80000000
!	Mem[000000001004141a] = 00000000, %l1 = 1c6e8f6dd1209a27
	ldsb	[%i1+0x01a],%l1		! %l1 = 0000000000000000
!	Mem[0000000030101400] = f74fac7d, %l1 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l1	! %l1 = 00000000f74fac7d
!	Mem[00000000300c1400] = d442fa0a, %l1 = 00000000f74fac7d
	lduha	[%i3+%g0]0x89,%l1	! %l1 = 000000000000fa0a
!	%l1 = 000000000000fa0a, imm = 0000000000000d23, %l0 = 0000000067000000
	sub	%l1,0xd23,%l0		! %l0 = 000000000000ece7
!	Mem[0000000030041408] = 000028ee19e4be17, %l4 = 00000000000019ff
	ldxa	[%i1+%o4]0x81,%l4	! %l4 = 000028ee19e4be17
!	Mem[0000000030041408] = 000028ee, %l1 = 000000000000fa0a
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181430] = 6c4f5be66fbbc49f, %l2 = 00000000d0696e52
	ldx	[%i6+0x030],%l2		! %l2 = 6c4f5be66fbbc49f
!	Mem[00000000300c1410] = 00000070, %l5 = 0000000000000054
	lduwa	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000070

p0_label_41:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 0afa42d4, %l7 = 0000000032da8e7a
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 000000000000000a
!	%f0  = ff0000ee, Mem[0000000030141408] = e076a713
	sta	%f0 ,[%i5+%o4]0x81	! Mem[0000000030141408] = ff0000ee
!	Mem[0000000030101410] = 000000ff, %l3 = 00000000f84ee221
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = df000000, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 00000000000000df
!	%l1 = 00000000000000df, Mem[0000000030001400] = 546e69d0
	stba	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = df6e69d0
!	%f28 = ebb4e315 62682877, %l7 = 000000000000000a
!	Mem[00000000300c1400] = fffa42d45d523251
	stda	%f28,[%i3+%l7]ASI_PST8_SL ! Mem[00000000300c1400] = ff2842625d523251
!	%l3 = 00000000000000ff, Mem[00000000211c0000] = ffff4920
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 00ff4920
!	%l1 = 00000000000000df, Mem[0000000010001434] = 20ee78b5
	sth	%l1,[%i0+0x034]		! Mem[0000000010001434] = 00df78b5
!	%l0 = 000000000000ece7, Mem[000000001014141e] = 0d52f06f
	sth	%l0,[%i5+0x01e]		! Mem[000000001014141c] = 0d52ece7
!	Mem[0000000010181408] = 00000067, %l3 = 00000000000000ff
	swapa	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000067

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = d0696e52, %l0 = 000000000000ece7
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = ffffffffffffd069
!	Mem[0000000030141400] = ff000000, %l0 = ffffffffffffd069
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030081410] = 31711eff, %l3 = 0000000000000067
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 0000000031711eff
!	Mem[0000000010081404] = 00000049, %l6 = 00000000000028ff, %asi = 80
	lduha	[%i2+0x004]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 766649f6 f74fac7d, %l6 = 00000000, %l7 = 0000000a
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 00000000f74fac7d 00000000766649f6
!	Mem[0000000010181408] = 000000ffff639887, %f2  = 5c59858e 31711ea7, %asi = 80
	ldda	[%i6+0x008]%asi,%f2 	! %f2  = 000000ff ff639887
!	Mem[0000000030181400] = 0000000d5fd7faf1, %f22 = 192b00ea 28000000
	ldda	[%i6+%g0]0x81,%f22	! %f22 = 0000000d 5fd7faf1
!	Mem[0000000010141400] = 00000000, %l5 = 0000000000000070
	lduwa	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101418] = 32da8e7a24c38063, %l6 = 00000000f74fac7d, %asi = 80
	ldxa	[%i4+0x018]%asi,%l6	! %l6 = 32da8e7a24c38063
!	%l0 = ffffffffff000000, imm = fffffffffffff893, %l6 = 32da8e7a24c38063
	sub	%l0,-0x76d,%l6		! %l6 = ffffffffff00076d

p0_label_43:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = ee280000, %l0 = 00000000ff000000
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 00000000ee280000
!	%l3 = 0000000031711eff, Mem[0000000010041410] = ffa400ff
	stha	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = ffa41eff
!	Mem[0000000010141401] = 00000000, %l7 = 00000000766649f6
	ldstub	[%i5+0x001],%l7		! %l7 = 0000000000000000
!	%f4  = ff000000 c4ce0000, %l4 = 000028ee19e4be17
!	Mem[0000000010081430] = 77373bb44c7cec75
	add	%i2,0x030,%g1
	stda	%f4,[%g1+%l4]ASI_PST16_P ! Mem[0000000010081430] = 77370000c4ce0000
!	Mem[0000000010181438] = 162d5212, %l5 = 00000000, %l3 = 31711eff
	add	%i6,0x38,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 00000000162d5212
!	%l7 = 0000000000000000, Mem[00000000201c0000] = ffee4a90
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00004a90
!	%l5 = 0000000000000000, Mem[00000000300c1400] = 5132525d624228ff
	stxa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	%l0 = ee280000, %l1 = 000000df, Mem[00000000100c1408] = 5c59858e 31711ea7
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = ee280000 000000df
!	Mem[0000000010081400] = 00000000, %l3 = 00000000162d5212
	swap	[%i2+%g0],%l3		! %l3 = 0000000000000000
!	%l2 = 6fbbc49f, %l3 = 00000000, Mem[0000000010001400] = 00000019 28000000
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 6fbbc49f 00000000

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081408] = f74fac7d000019ff, %f0  = ff0000ee 4cd0ffff
	ldda	[%i2+%o4]0x89,%f0 	! %f0  = f74fac7d 000019ff
!	Mem[0000000010181408] = 000000ff, %l7 = 0000000000000000
	lduha	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = ff000000, %l4 = 000028ee19e4be17
	lduha	[%i5+%g0]0x81,%l4	! %l4 = 000000000000ff00
!	%f5  = c4ce0000, %f0  = f74fac7d, %f8  = 0b3d2968
	fdivs	%f5 ,%f0 ,%f8 		! %f8  = 0cfdefcd
!	Mem[0000000010001408] = 00000000, %l1 = 00000000000000df
	lduba	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = 000000ff, %f9  = 4ab502d9
	lda	[%i2+%g0]0x89,%f9 	! %f9 = 000000ff
!	Mem[0000000010081400] = 49000000 12522d16, %l4 = 0000ff00, %l5 = 00000000
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 0000000012522d16 0000000049000000
!	Mem[0000000030141408] = ee0000ff, %l2 = 6c4f5be66fbbc49f
	lduha	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l3 = ffffffffffffffff, %asi = 80
	lduwa	[%i2+0x008]%asi,%l3	! %l3 = 0000000000000000

p0_label_45:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000049000000, Mem[0000000030081408] = f74fac7d000019ff
	stxa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000049000000
!	%l1 = 0000000000000000, Mem[000000001008142c] = 1cd1f2ff
	stw	%l1,[%i2+0x02c]		! Mem[000000001008142c] = 00000000
!	Mem[0000000030041410] = df0002ff, %l5 = 0000000049000000
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 00000000df0002ff
!	%f10 = 6c4f5be6 6fbbc49f, Mem[0000000010081400] = 162d5212 00000049
	stda	%f10,[%i2+%g0]0x80	! Mem[0000000010081400] = 6c4f5be6 6fbbc49f
!	%f14 = 766649f6, Mem[0000000010041408] = 00000056
	sta	%f14,[%i1+%o4]0x80	! Mem[0000000010041408] = 766649f6
!	Mem[0000000010141400] = 0000ff00, %l3 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%l5 = 00000000df0002ff, Mem[0000000010081427] = 0e4cae7f, %asi = 80
	stba	%l5,[%i2+0x027]%asi	! Mem[0000000010081424] = 0e4caeff
!	%l0 = ee280000, %l1 = 00000000, Mem[0000000030001400] = d0696edf 526e69d0
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = ee280000 00000000
!	%l4 = 0000000012522d16, Mem[0000000010001400] = 6fbbc49f
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 12522d16
!	%l4 = 0000000012522d16, Mem[0000000030081410] = 31711eff
	stha	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 31712d16

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00004a90, %l1 = 0000000000000000, %asi = 80
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = 00004a90, %l0 = 00000000ee280000, %asi = 80
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 813bac7700000000, %f28 = ebb4e315 62682877
	ldda	[%i6+%o5]0x89,%f28	! %f28 = 813bac77 00000000
!	Mem[0000000010141438] = 41ea1827 2300cc0d, %l4 = 12522d16, %l5 = df0002ff
	ldd	[%i5+0x038],%l4		! %l4 = 0000000041ea1827 000000002300cc0d
!	Mem[0000000010141410] = ff000000, %f13 = 5f34e315
	lda	[%i5+%o5]0x80,%f13	! %f13 = ff000000
!	Mem[0000000010081408] = 00000000, %l1 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = ff00e850, %f29 = 00000000
	lda	[%i1+%g0]0x80,%f29	! %f29 = ff00e850
!	Mem[0000000010081400] = e65b4f6c, %l4 = 0000000041ea1827
	ldswa	[%i2+%g0]0x88,%l4	! %l4 = ffffffffe65b4f6c
!	Mem[0000000030181410] = 00000000, %l4 = ffffffffe65b4f6c
	ldsha	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = 00000070, %l7 = 0000000000000000
	lduha	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_47:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010001408] = 00000000
	stba	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000
!	%l3 = 0000000000000000, Mem[0000000010101424] = 31fc0bf9
	sth	%l3,[%i4+0x024]		! Mem[0000000010101424] = 00000bf9
!	%l6 = ff00076d, %l7 = 00000000, Mem[0000000030181408] = 813bac77 d0696e52
	stda	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = ff00076d 00000000
!	%l1 = 0000000000000000, Mem[0000000010181425] = f6496676, %asi = 80
	stba	%l1,[%i6+0x025]%asi	! Mem[0000000010181424] = f6006676
!	Mem[0000000030041400] = 00ee0000, %l1 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 0000000000ee0000
!	Mem[0000000010001404] = 00000000, %l6 = ff00076d, %l2 = 000000ff
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 0000000000000000
!	%f4  = ff000000 c4ce0000, Mem[0000000030001408] = 000000cc 77286862
	stda	%f4 ,[%i0+%o4]0x89	! Mem[0000000030001408] = ff000000 c4ce0000
!	Mem[0000000010141414] = c4ce0000, %l0 = 0000000000000000
	swap	[%i5+0x014],%l0		! %l0 = 00000000c4ce0000
!	%f16 = 4cd0d0ff 00000000, Mem[0000000010181408] = ff000000 879863ff
	stda	%f16,[%i6+%o4]0x88	! Mem[0000000010181408] = 4cd0d0ff 00000000
!	Mem[00000000201c0000] = 00004a90, %l5 = 000000002300cc0d
	ldstub	[%o0+%g0],%l5		! %l5 = 0000000000000000

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 5c59c47d, %l6 = ffffffffff00076d
	lduwa	[%i4+%o5]0x88,%l6	! %l6 = 000000005c59c47d
!	Mem[0000000010081408] = ff000000 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000030101408] = ff000000, %l2 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010001410] = da9f32ff, %l6 = 000000005c59c47d
	lduwa	[%i0+%o5]0x88,%l6	! %l6 = 00000000da9f32ff
!	Mem[00000000201c0001] = ff004a90, %l3 = 00000000ff000000, %asi = 80
	lduba	[%o0+0x001]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 000028ee, %f1  = 000019ff
	lda	[%i3+%o4]0x88,%f1 	! %f1 = 000028ee
!	Mem[00000000100c1410] = 000000ff, %l2 = ffffffffff000000
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = ff19000000000000, %f30 = 000000ff 6bf2cc8b
	ldda	[%i1+%g0]0x89,%f30	! %f30 = ff190000 00000000
!	Mem[00000000201c0000] = ff004a90, %l0 = 00000000c4ce0000
	ldsh	[%o0+%g0],%l0		! %l0 = ffffffffffffff00
!	Mem[0000000030181408] = ff00076d 00000000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 00000000ff00076d 0000000000000000

p0_label_49:
!	Starting 10 instruction Store Burst
!	Mem[000000001008141c] = 747eb0a3, %l4 = 00000000, %l7 = 00000000
	add	%i2,0x1c,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 00000000747eb0a3
!	%l2 = 00000000ff00076d, Mem[0000000030041408] = 000000ff19e4be17
	stxa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000ff00076d
!	%l5 = 0000000000000000, Mem[00000000211c0000] = 00ff4920, %asi = 80
	stba	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff4920
!	%l6 = 00000000da9f32ff, Mem[0000000010101424] = 00000bf9, %asi = 80
	stba	%l6,[%i4+0x024]%asi	! Mem[0000000010101424] = ff000bf9
!	%l2 = 00000000ff00076d, Mem[0000000010181410] = 4d4aa66d00000000
	stxa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000ff00076d
!	%l5 = 0000000000000000, Mem[0000000030081400] = 000000ff
	stba	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%f22 = 0000000d 5fd7faf1, Mem[0000000010101430] = 07fa5074 00000078, %asi = 80
	stda	%f22,[%i4+0x030]%asi	! Mem[0000000010101430] = 0000000d 5fd7faf1
!	Mem[0000000010081408] = 00000000, %l7 = 00000000747eb0a3
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%l0 = ffffffffffffff00, Mem[0000000030141410] = 000028ff
	stha	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ff00
!	%l5 = 0000000000000000, Mem[0000000010181408] = 00000000
	stwa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffa41eff, %l0 = ffffffffffffff00
	ldsba	[%i1+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181400] = 0d000000, %l3 = 0000000000000000
	ldswa	[%i6+%g0]0x89,%l3	! %l3 = 000000000d000000
!	Mem[00000000100c1410] = 0000cec4 000000ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff 000000000000cec4
!	%f4  = ff000000, %f24 = 21e24ef8
	fcmpes	%fcc3,%f4 ,%f24		! %fcc3 = 1
!	Mem[00000000100c1404] = 6591e0a1, %f5  = c4ce0000
	ld	[%i3+0x004],%f5 	! %f5 = 6591e0a1
!	Mem[0000000010001428] = 3fb72f06, %l6 = 00000000da9f32ff
	ldsw	[%i0+0x028],%l6		! %l6 = 000000003fb72f06
!	%f16 = 4cd0d0ff, %f19 = 80000000
	fstoi	%f16,%f19		! %f19 = 068687f8
!	Mem[0000000010001410] = ff329fda, %l6 = 000000003fb72f06
	ldub	[%i0+%o5],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = 00ff4920, %l6 = 0000000000000000
	ldsh	[%o2+%g0],%l6		! %l6 = 00000000000000ff

p0_label_51:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000030041408] = 00000000
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	%l4 = 00000000000000ff, Mem[0000000030181410] = 00000000
	stha	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00ff0000
!	%f30 = ff190000 00000000, %l6 = 00000000000000ff
!	Mem[00000000300c1408] = df00026e67f591d7
	add	%i3,0x008,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_S ! Mem[00000000300c1408] = ff19000000000000
!	%l4 = 00000000000000ff, imm = fffffffffffff5fe, %l2 = 00000000ff00076d
	add	%l4,-0xa02,%l2		! %l2 = fffffffffffff6fd
!	Mem[0000000010081400] = 6c4f5be6 6fbbc49f 747eb0a3 000000ff
!	%f16 = 4cd0d0ff 00000000 00000070 068687f8
!	%f20 = ffd0d04c 000028ee 0000000d 5fd7faf1
!	%f24 = 21e24ef8 3018d829 766649f6 0d52f06f
!	%f28 = 813bac77 ff00e850 ff190000 00000000
	stda	%f16,[%i2+%g0]ASI_BLK_PL	! Block Store to 0000000010081400
!	Mem[0000000030001408] = c4ce0000, %l0 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%f12 = 0afa42d4 ff000000, Mem[0000000010181408] = 00000000 ffd0d04c
	stda	%f12,[%i6+%o4]0x80	! Mem[0000000010181408] = 0afa42d4 ff000000
!	%l2 = fffff6fd, %l3 = 0d000000, Mem[0000000010041410] = ff1ea4ff 474827dd
	std	%l2,[%i1+%o5]		! Mem[0000000010041410] = fffff6fd 0d000000
!	%l3 = 000000000d000000, %l7 = 0000000000000000, %y  = 00000000
	umul	%l3,%l7,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[00000000100c1400] = ff000000, %l5 = 0000cec4, %l0 = 00000000
	casa	[%i3]0x80,%l5,%l0	! %l0 = 00000000ff000000

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000ee280000, %f10 = 6c4f5be6 6fbbc49f
	ldda	[%i0+%g0]0x89,%f10	! %f10 = 00000000 ee280000
!	Mem[0000000030141410] = 0000ff00, %l7 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030041410] = 00000049, %f11 = ee280000
	lda	[%i1+%o5]0x81,%f11	! %f11 = 00000049
!	Mem[0000000010041416] = 0d000000, %l7 = ffffffffffffff00, %asi = 80
	ldsha	[%i1+0x016]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = c7544c12000000ee, %l7 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l7	! %l7 = c7544c12000000ee
!	Code Fragment 4, seed = 714137
p0_fragment_3:
!	%l0 = 00000000ff000000
	setx	0x2125b81a7a56345e,%g7,%l0 ! %l0 = 2125b81a7a56345e
!	%l1 = 0000000000ee0000
	setx	0x94ae2a60cdde1309,%g7,%l1 ! %l1 = 94ae2a60cdde1309
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2125b81a7a56345e
	setx	0xb06e47034f454dc4,%g7,%l0 ! %l0 = b06e47034f454dc4
!	%l1 = 94ae2a60cdde1309
	setx	0x17ea554790aa678f,%g7,%l1 ! %l1 = 17ea554790aa678f
p0_fragment_3_end:
!	Mem[00000000100c1430] = 0afa42d4, %l7 = c7544c12000000ee, %asi = 80
	ldsba	[%i3+0x030]%asi,%l7	! %l7 = 000000000000000a
!	Mem[000000001018142f] = 060f0987, %l4 = 0000000000000000
	ldub	[%i6+0x02f],%l4		! %l4 = 0000000000000087
!	Mem[0000000010001410] = da9f32ff, %l4 = 0000000000000087
	lduba	[%i0+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141410] = 00001f95 0000ff00, %l0 = 4f454dc4, %l1 = 90aa678f
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 000000000000ff00 0000000000001f95

p0_label_53:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010081410] = ee280000, %l4 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 00000000000000ee
!	%l4 = 00000000000000ee, Mem[0000000010101400] = ff000000000070e6
	stxa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000000000ee
!	Mem[0000000030041408] = ff000000, %l5 = 000000000000cec4
	swapa	[%i1+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	%f18 = 00000070 068687f8, Mem[0000000030181408] = 6d0700ff 00000000
	stda	%f18,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000070 068687f8
!	Mem[0000000010041400] = 50e800ff, %l2 = 00000000fffff6fd
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 0000000050e800ff
!	%f2  = 000000ff ff639887, Mem[00000000300c1400] = 00000000 00000000
	stda	%f2 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff ff639887
!	Mem[0000000010141427] = 4ab502d9, %l6 = 00000000000000ff
	ldstub	[%i5+0x027],%l6		! %l6 = 00000000000000d9
!	Mem[0000000010141410] = ff000000, %l4 = 00000000000000ee
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	%l7 = 000000000000000a, Mem[0000000030181400] = 0d000000
	stba	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 0d00000a
!	%l5 = 00000000ff000000, Mem[0000000030181400] = 0d00000a
	stha	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 0d000000

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[000000001008140f] = 70000000, %l5 = 00000000ff000000, %asi = 80
	ldsba	[%i2+0x00f]%asi,%l5	! %l5 = 0000000000000000
!	Mem[000000001014140c] = 31711ea7, %l0 = 000000000000ff00, %asi = 80
	lduwa	[%i5+0x00c]%asi,%l0	! %l0 = 0000000031711ea7
!	Mem[00000000211c0000] = 00ff4920, %l6 = 00000000000000d9, %asi = 80
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101400] = 766649f6f74fac7d, %f4  = ff000000 6591e0a1
	ldda	[%i4+%g0]0x89,%f4 	! %f4  = 766649f6 f74fac7d
!	Mem[0000000010081410] = 000028ff, %f6  = 54329fda
	lda	[%i2+%o5]0x88,%f6 	! %f6 = 000028ff
!	Mem[0000000010101434] = 5fd7faf1, %l4 = 00000000ff000000, %asi = 80
	ldswa	[%i4+0x034]%asi,%l4	! %l4 = 000000005fd7faf1
!	%l6 = 00000000000000ff, imm = ffffffffffffffed, %l5 = 0000000000000000
	sub	%l6,-0x013,%l5		! %l5 = 0000000000000112
!	Mem[0000000021800100] = 25ed4c10, %l3 = 000000000d000000
	ldsh	[%o3+0x100],%l3		! %l3 = 00000000000025ed
!	Mem[0000000020800001] = 69d078c0, %l2 = 0000000050e800ff, %asi = 80
	ldsba	[%o1+0x001]%asi,%l2	! %l2 = ffffffffffffffd0
!	Mem[0000000030041410] = 00000049, %l6 = 00000000000000ff
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_55:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 0000000a, Mem[0000000030001400] = ee280000 00000000
	stda	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 0000000a
!	Mem[0000000010041418] = 00000000, %l5 = 0000000000000112, %asi = 80
	swapa	[%i1+0x018]%asi,%l5	! %l5 = 0000000000000000
!	Code Fragment 4, seed = 538195
p0_fragment_4:
!	%l0 = 0000000031711ea7
	setx	0xca39ba4530fb888e,%g7,%l0 ! %l0 = ca39ba4530fb888e
!	%l1 = 0000000000001f95
	setx	0x834df3cead3af039,%g7,%l1 ! %l1 = 834df3cead3af039
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ca39ba4530fb888e
	setx	0xafd2d203f73763f4,%g7,%l0 ! %l0 = afd2d203f73763f4
!	%l1 = 834df3cead3af039
	setx	0x3d457b7c306066bf,%g7,%l1 ! %l1 = 3d457b7c306066bf
p0_fragment_4_end:
!	%l2 = ffffffffffffffd0, Mem[00000000100c1408] = 000028ee
	stwa	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffd0
!	Mem[0000000030001400] = 00000000, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010081410] = ff280000
	stha	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%l4 = 000000005fd7faf1, Mem[00000000201c0000] = ff004a90
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = faf14a90
!	%l1 = 3d457b7c306066bf, Mem[0000000030141408] = ee0000ff
	stha	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = ee0066bf
!	%f12 = 0afa42d4 ff000000, %l0 = afd2d203f73763f4
!	Mem[0000000030041408] = 0000cec4ff00076d
	add	%i1,0x008,%g1
	stda	%f12,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030041408] = 0000cec4ff00076d
!	%l7 = 000000000000000a, Mem[0000000030081400] = 00000000
	stha	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 000a0000

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0001] = faf14a90, %l4 = 000000005fd7faf1, %asi = 80
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = fffffffffffffff1
!	Mem[0000000030101400] = f74fac7d, %l7 = 000000000000000a
	ldsha	[%i4+%g0]0x89,%l7	! %l7 = ffffffffffffac7d
!	Mem[0000000010001410] = 43f03013da9f32ff, %f6  = 000028ff 1330f043
	ldda	[%i0+%o5]0x88,%f6 	! %f6  = 43f03013 da9f32ff
!	Mem[0000000030041410] = 49000000, %l7 = ffffffffffffac7d
	ldsha	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[000000001014140c] = 31711ea7, %l7 = 0000000000000000, %asi = 80
	lduha	[%i5+0x00c]%asi,%l7	! %l7 = 0000000000003171
!	Mem[0000000030041410] = 0000004900000000, %f26 = 766649f6 0d52f06f
	ldda	[%i1+%o5]0x81,%f26	! %f26 = 00000049 00000000
!	Mem[0000000030101400] = 766649f6f74fac7d, %f16 = 4cd0d0ff 00000000
	ldda	[%i4+%g0]0x89,%f16	! %f16 = 766649f6 f74fac7d
!	Mem[0000000010101408] = ee000000 124c54c7, %l0 = f73763f4, %l1 = 306066bf
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 00000000ee000000 00000000124c54c7
!	Mem[00000000300c1410] = 70000000, %f15 = f74fac7d
	lda	[%i3+%o5]0x89,%f15	! %f15 = 70000000
!	%l0 = 00000000ee000000, Mem[00000000211c0000] = 00ff4920, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00004920

p0_label_57:
!	Starting 10 instruction Store Burst
!	%l0 = ee000000, %l1 = 124c54c7, Mem[0000000010141410] = 000000ee 00000000
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = ee000000 124c54c7
!	%f8  = 0cfdefcd 000000ff, Mem[0000000010001400] = 12522d16 00000000
	stda	%f8 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 0cfdefcd 000000ff
!	%l1 = 00000000124c54c7, Mem[0000000010001418] = 66e6a8fa, %asi = 80
	stwa	%l1,[%i0+0x018]%asi	! Mem[0000000010001418] = 124c54c7
!	%l2 = ffffffffffffffd0, Mem[00000000201c0001] = faf14a90, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = fad04a90
!	%l0 = 00000000ee000000, Mem[0000000010181438] = 162d5212678c239b
	stx	%l0,[%i6+0x038]		! Mem[0000000010181438] = 00000000ee000000
!	%f30 = ff190000, Mem[0000000010001410] = ff329fda
	sta	%f30,[%i0+%o5]0x80	! Mem[0000000010001410] = ff190000
!	Code Fragment 3, seed = 385134
p0_fragment_5:
!	%l0 = 00000000ee000000
	setx	0xd87ff65d1ffa42b6,%g7,%l0 ! %l0 = d87ff65d1ffa42b6
!	%l1 = 00000000124c54c7
	setx	0x6883464e5e25b1e1,%g7,%l1 ! %l1 = 6883464e5e25b1e1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d87ff65d1ffa42b6
	setx	0xb7595af73c85951c,%g7,%l0 ! %l0 = b7595af73c85951c
!	%l1 = 6883464e5e25b1e1
	setx	0x176f2771350cef67,%g7,%l1 ! %l1 = 176f2771350cef67
p0_fragment_5_end:
!	Mem[0000000010001408] = ff000000, %l3 = 00000000000025ed
	swap	[%i0+%o4],%l3		! %l3 = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[000000001010143a] = 24f57852
	sth	%l3,[%i4+0x03a]		! Mem[0000000010101438] = 24f50000
!	Mem[00000000100c1420] = 0b3d2968, %l0 = b7595af73c85951c
	ldstuba	[%i3+0x020]%asi,%l0	! %l0 = 000000000000000b

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1424] = 4ab502d9, %f5  = f74fac7d
	lda	[%i3+0x024]%asi,%f5 	! %f5 = 4ab502d9
!	Mem[0000000010041408] = f6496676, %l4 = fffffffffffffff1
	ldsba	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000076
!	Mem[0000000030001408] = ff00cec4, %l0 = 000000000000000b
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030081408] = 49000000, %f6  = 43f03013
	lda	[%i2+%o4]0x89,%f6 	! %f6 = 49000000
!	Mem[00000000300c1410] = 813bac7770000000, %l4 = 0000000000000076
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = 813bac7770000000
!	Mem[0000000010141408] = 8e85595c, %f23 = 5fd7faf1
	lda	[%i5+%o4]0x88,%f23	! %f23 = 8e85595c
!	Mem[00000000211c0000] = 00004920, %l3 = 00000000ff000000
	ldsh	[%o2+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000020800000] = 69d078c0, %l1 = 176f2771350cef67, %asi = 80
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 00000000000069d0
!	Mem[0000000010181408] = 0afa42d4, %f17 = f74fac7d
	lda	[%i6+%o4]0x80,%f17	! %f17 = 0afa42d4
!	Mem[0000000010001408] = 000025edf6496676, %l1 = 00000000000069d0
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = 000025edf6496676

p0_label_59:
!	Starting 10 instruction Store Burst
!	%l1 = 000025edf6496676, Mem[0000000030141408] = bf6600ee
	stba	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 766600ee
!	%l0 = 000000000000ff00, Mem[0000000030041400] = 00000000
	stba	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	Mem[0000000010041410] = fffff6fd, %l7 = 0000000000003171
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l4 = 70000000, %l5 = 00000000, Mem[0000000010001410] = ff190000 1330f043
	stda	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 70000000 00000000
!	Mem[0000000020800040] = 19df22f0, %l4 = 813bac7770000000
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 0000000000000019
!	%l3 = 0000000000000000, Mem[00000000300c1408] = ff190000
	stwa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Mem[0000000030081408] = 00000049, %l1 = 00000000f6496676
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000049
!	%l6 = 0000000000000000, Mem[0000000030001408] = ff00cec4000000ff
	stxa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000000
!	Mem[00000000218001c0] = 5a6deaa0, %l7 = 00000000000000ff
	ldstuba	[%o3+0x1c0]%asi,%l7	! %l7 = 000000000000005a
!	Mem[00000000211c0000] = 00004920, %l0 = 000000000000ff00
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 0000000000000000

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[000000001000140b] = 000025ed, %l4 = 0000000000000019
	ldsb	[%i0+0x00b],%l4		! %l4 = ffffffffffffffed
!	Mem[00000000100c1410] = ff000000, %l7 = 000000000000005a
	lduwa	[%i3+%o5]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010141400] = a1e09165 0000ffff, %l6 = 00000000, %l7 = ff000000
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 000000000000ffff 00000000a1e09165
!	Mem[0000000030181400] = 0000000d5fd7faf1, %l2 = ffffffffffffffd0
	ldxa	[%i6+%g0]0x81,%l2	! %l2 = 0000000d5fd7faf1
!	%l0 = 0000000000000000, imm = 0000000000000224, %l3 = 0000000000000000
	andn	%l0,0x224,%l3		! %l3 = 0000000000000000
!	Mem[0000000010001410] = 70000000, %l6 = 000000000000ffff
	lduwa	[%i0+%o5]0x80,%l6	! %l6 = 0000000070000000
!	Mem[0000000010041410] = fdf6ffff, %l4 = ffffffffffffffed
	ldswa	[%i1+%o5]0x88,%l4	! %l4 = fffffffffdf6ffff
!	%l7 = 00000000a1e09165, %l7 = 00000000a1e09165, %l2 = 0000000d5fd7faf1
	or	%l7,%l7,%l2		! %l2 = 00000000a1e09165
!	Mem[0000000010141400] = 0000ffff, %l0 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030141410] = 00001f950000ff00, %l5 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l5	! %l5 = 00001f950000ff00

p0_label_61:
!	Starting 10 instruction Store Burst
!	%l4 = fdf6ffff, %l5 = 0000ff00, Mem[0000000010181410] = ff00076d 00000000
	stda	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = fdf6ffff 0000ff00
!	%l5 = 00001f950000ff00, Mem[0000000010041406] = 3c6aff21
	stb	%l5,[%i1+0x006]		! Mem[0000000010041404] = 3c6a0021
!	%l0 = ffffffffffffffff, Mem[0000000030101400] = 766649f6f74fac7d
	stxa	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffffffffffff
!	%f8  = 0cfdefcd, Mem[0000000030141400] = ff000000
	sta	%f8 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 0cfdefcd
!	%l3 = 0000000000000000, Mem[0000000010001408] = 000025ed
	stba	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 000025ed
!	%l0 = ffffffffffffffff, Mem[0000000010081410] = 00000000
	stwa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffff
!	%l0 = ffffffffffffffff, Mem[0000000010101408] = 000000ee
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff
!	%l3 = 0000000000000000, Mem[0000000030141410] = 00ff0000
	stwa	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%l7 = 00000000a1e09165, Mem[0000000010181410] = fffff6fd
	stba	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 65fff6fd
!	Mem[0000000020800040] = ffdf22f0, %l5 = 00001f950000ff00
	ldstub	[%o1+0x040],%l5		! %l5 = 00000000000000ff

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 4cd0ffff, %l3 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l3	! %l3 = 000000004cd0ffff
!	Mem[00000000300c1408] = 00000000, %f7  = da9f32ff
	lda	[%i3+%o4]0x81,%f7 	! %f7 = 00000000
!	Mem[0000000030001410] = ffffd04c, %l0 = ffffffffffffffff
	lduha	[%i0+%o5]0x81,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010101418] = 32da8e7a, %l5 = 00000000000000ff, %asi = 80
	lduha	[%i4+0x018]%asi,%l5	! %l5 = 00000000000032da
!	Mem[0000000010101410] = 5c59c47d, %l5 = 00000000000032da
	lduha	[%i4+%o5]0x88,%l5	! %l5 = 000000000000c47d
!	Mem[00000000300c1400] = 000000ffff639887, %f26 = 00000049 00000000
	ldda	[%i3+%g0]0x81,%f26	! %f26 = 000000ff ff639887
!	Mem[0000000021800140] = 49545a40, %l5 = 000000000000c47d, %asi = 80
	lduha	[%o3+0x140]%asi,%l5	! %l5 = 0000000000004954
!	Mem[0000000030101400] = ffffffff, %l1 = 0000000000000049
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000211c0001] = ff004920, %l4 = fffffffffdf6ffff
	ldub	[%o2+0x001],%l4		! %l4 = 0000000000000000
!	Mem[00000000211c0001] = ff004920, %l2 = 00000000a1e09165, %asi = 80
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = 0000000000000000

p0_label_63:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 526e69d0, %l3 = 000000004cd0ffff
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 00000000526e69d0
!	%l5 = 0000000000004954, Mem[0000000030141408] = 766600ee
	stba	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 546600ee
!	%l6 = 70000000, %l7 = a1e09165, Mem[0000000030081400] = 00000a00 ffffffff
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 70000000 a1e09165
!	%l2 = 0000000000000000, Mem[0000000030181410] = 0000ff00
	stwa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%l0 = 0000ffff, %l1 = 000000ff, Mem[0000000010141410] = ee000000 124c54c7
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000ffff 000000ff
!	Mem[0000000010001428] = 3fb72f06, %l6 = 0000000070000000
	ldstub	[%i0+0x028],%l6		! %l6 = 000000000000003f
!	Mem[00000000300c1400] = ff000000, %l6 = 000000000000003f
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%f30 = ff190000 00000000, Mem[0000000010181408] = d442fa0a 000000ff
	stda	%f30,[%i6+%o4]0x88	! Mem[0000000010181408] = ff190000 00000000
!	%f13 = ff000000, Mem[0000000010181408] = 00000000
	sta	%f13,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000000
!	Mem[00000000300c1400] = ff0000ff, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 00000000ff0000ff

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffffffff, %l2 = 0000000000000000
	ldsha	[%i2+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141410] = 0000ffff000000ff, %l1 = 00000000000000ff
	ldx	[%i5+%o5],%l1		! %l1 = 0000ffff000000ff
!	Mem[0000000030001408] = 00000000, %l5 = 0000000000004954
	lduba	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = 162d7131, %l1 = 0000ffff000000ff
	lduwa	[%i2+%o5]0x81,%l1	! %l1 = 00000000162d7131
!	Mem[0000000010041408] = f6496676, %l5 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l5	! %l5 = 00000000f6496676
!	Mem[0000000010001408] = ed250000, %l4 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = ffffffffed250000
!	%l5 = 00000000f6496676, %l6 = 00000000ff0000ff, %l2 = ffffffffffffffff
	add	%l5,%l6,%l2		! %l2 = 00000001f5496775
!	Mem[0000000030001408] = 00000000, %f18 = 00000070
	lda	[%i0+%o4]0x89,%f18	! %f18 = 00000000
!	Mem[0000000010101410] = 7deada3e 5c59c47d, %l6 = ff0000ff, %l7 = a1e09165
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 000000005c59c47d 000000007deada3e
!	Mem[0000000030141400] = cdeffd0c, %l5 = 00000000f6496676
	lduba	[%i5+%g0]0x89,%l5	! %l5 = 000000000000000c

p0_label_65:
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffed250000, Mem[0000000030001408] = 0000000000000000
	stxa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffffed250000
!	Mem[0000000010081408] = f8878606, %l5 = 000000000000000c
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000f8
!	%l0 = 000000000000ffff, Mem[0000000030081400] = 70000000
	stha	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 7000ffff
!	Mem[00000000100c1410] = ff000000, %l0 = 000000000000ffff
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	%l4 = ed250000, %l5 = 000000f8, Mem[0000000010041428] = 30e6be66 0d360d1f
	std	%l4,[%i1+0x028]		! Mem[0000000010041428] = ed250000 000000f8
!	%l0 = ff000000, %l1 = 162d7131, Mem[0000000010141400] = ffff0000 6591e0a1
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = ff000000 162d7131
!	%l3 = 00000000526e69d0, Mem[0000000010101410] = 7dc4595c
	stw	%l3,[%i4+%o5]		! Mem[0000000010101410] = 526e69d0
!	Mem[0000000010181408] = 000000ff, %l3 = 00000000526e69d0
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%f23 = 8e85595c, %f31 = 00000000, %f12 = 0afa42d4
	fadds	%f23,%f31,%f12		! %f12 = 8e85595c
!	%l6 = 000000005c59c47d, Mem[00000000211c0001] = ff004920, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff7d4920

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff7d4920, %l3 = 00000000000000ff
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ff7d
!	Mem[000000001004140e] = 00000049, %l3 = 000000000000ff7d
	lduh	[%i1+0x00e],%l3		! %l3 = 0000000000000049
!	Mem[0000000020800041] = ffdf22f0, %l7 = 000000007deada3e
	ldsb	[%o1+0x041],%l7		! %l7 = ffffffffffffffdf
!	Mem[0000000010001410] = 70000000, %l4 = ffffffffed250000
	ldsha	[%i0+%o5]0x80,%l4	! %l4 = 0000000000007000
!	%l4 = 0000000000007000, imm = 0000000000000b44, %l1 = 00000000162d7131
	or	%l4,0xb44,%l1		! %l1 = 0000000000007b44
!	Mem[0000000030141408] = 546600ee 1eed2597, %l0 = ff000000, %l1 = 00007b44
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000546600ee 000000001eed2597
!	Mem[0000000010041400] = fffff6fd, %l5 = 00000000000000f8
	lduwa	[%i1+%g0]0x88,%l5	! %l5 = 00000000fffff6fd
!	Mem[00000000100c1408] = d0ffffff, %l6 = 000000005c59c47d
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = ffffffffffffd0ff
!	Mem[0000000010001400] = cdeffd0c, %f22 = 0000000d
	lda	[%i0+%g0]0x88,%f22	! %f22 = cdeffd0c
!	Mem[0000000010141410] = ffff0000, %l2 = 00000001f5496775
	lduha	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000

p0_label_67:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000546600ee, Mem[0000000010001410] = 7000000000000000
	stxa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000546600ee
!	%f10 = 00000000 00000049, %l6 = ffffffffffffd0ff
!	Mem[0000000030041428] = ff0000ee65910a0f
	add	%i1,0x028,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030041428] = 4900000000000000
!	%f20 = ffd0d04c, Mem[0000000010141408] = 8e85595c
	sta	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = ffd0d04c
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000007000
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030141400] = 0cfdefcd
	stwa	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l5 = 00000000fffff6fd, Mem[0000000010101408] = ffffffff
	stba	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = fffffffd
!	Mem[0000000030141408] = 546600ee, %l2 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000054
!	%f14 = 766649f6 70000000, Mem[0000000010181410] = fdf6ff65 0000ff00
	stda	%f14,[%i6+%o5]0x88	! Mem[0000000010181410] = 766649f6 70000000
!	%l2 = 0000000000000054, %l4 = 0000000000000000, %l2 = 0000000000000054
	orn	%l2,%l4,%l2		! %l2 = ffffffffffffffff
!	%l2 = ffffffffffffffff, Mem[0000000021800101] = 25ed4c10
	stb	%l2,[%o3+0x101]		! Mem[0000000021800100] = 25ff4c10

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff7d4920, %l0 = 00000000546600ee
	ldsb	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030181410] = 00000000, %l0 = ffffffffffffffff
	ldsha	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800001] = 69d078c0, %l3 = 0000000000000049
	ldub	[%o1+0x001],%l3		! %l3 = 00000000000000d0
!	Mem[00000000100c1418] = 54329fda 1330f043, %l6 = ffffd0ff, %l7 = ffffffdf, %asi = 80
	ldda	[%i3+0x018]%asi,%l6	! %l6 = 0000000054329fda 000000001330f043
!	Mem[0000000010001414] = 546600ee, %l5 = 00000000fffff6fd, %asi = 80
	ldswa	[%i0+0x014]%asi,%l5	! %l5 = 00000000546600ee
!	Mem[0000000010101400] = ee00000000000000, %l6 = 0000000054329fda
	ldxa	[%i4+%g0]0x88,%l6	! %l6 = ee00000000000000
!	Mem[0000000010181400] = ffffd04c 3018d829, %l0 = 00000000, %l1 = 1eed2597
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000ffffd04c 000000003018d829
!	Mem[0000000030001400] = 000000000a000000, %f20 = ffd0d04c 000028ee
	ldda	[%i0+%g0]0x81,%f20	! %f20 = 00000000 0a000000
!	Mem[0000000030181410] = 00000000, %f26 = 000000ff
	lda	[%i6+%o5]0x81,%f26	! %f26 = 00000000
!	Mem[0000000010041430] = 3edaea7d713598f5, %f16 = 766649f6 0afa42d4, %asi = 80
	ldda	[%i1+0x030]%asi,%f16	! %f16 = 3edaea7d 713598f5

p0_label_69:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000546600ee, Mem[0000000010081400] = 4cd0d0ff000000ff
	stxa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000546600ee
!	Mem[0000000030101408] = 000000ff, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l0 = 00000000ffffd04c
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 00000000 000000ee fdffffff 124c54c7
!	%f16 = 3edaea7d 713598f5 00000000 068687f8
!	%f20 = 00000000 0a000000 cdeffd0c 8e85595c
!	%f24 = 21e24ef8 3018d829 00000000 ff639887
!	%f28 = 813bac77 ff00e850 ff190000 00000000
	stda	%f16,[%i4+%g0]ASI_BLK_PL	! Block Store to 0000000010101400
!	%f14 = 766649f6 70000000, Mem[0000000010001408] = 000025ed f6496676
	stda	%f14,[%i0+%o4]0x80	! Mem[0000000010001408] = 766649f6 70000000
!	%f2  = 000000ff ff639887, Mem[0000000010141408] = ffd0d04c a71e7131
	stda	%f2 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff ff639887
!	%l6 = ee00000000000000, Mem[0000000030181410] = 0000000077ac3b81
	stxa	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = ee00000000000000
!	%f10 = 00000000 00000049, %l3 = 00000000000000d0
!	Mem[0000000030081428] = 59e08776101fc7ef
	add	%i2,0x028,%g1
	stda	%f10,[%g1+%l3]ASI_PST16_S ! Mem[0000000030081428] = 59e08776101fc7ef
!	%l0 = 0000000000000000, Mem[0000000030001400] = 00000000
	stha	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%l0 = 00000000, %l1 = 3018d829, Mem[0000000010141408] = 879863ff ff000000
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 3018d829

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = fad04a90, %l4 = 00000000000000ff
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000fad0
!	Mem[0000000020800001] = 69d078c0, %l4 = 000000000000fad0
	ldsb	[%o1+0x001],%l4		! %l4 = ffffffffffffffd0
!	Mem[0000000010181408] = ff190000000000ff, %l4 = ffffffffffffffd0
	ldxa	[%i6+%o4]0x88,%l4	! %l4 = ff190000000000ff
!	Mem[0000000030101408] = 00000000, %l5 = 00000000546600ee
	ldswa	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l0 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181400] = ffffd04c, %f10 = 00000000
	ld	[%i6+%g0],%f10		! %f10 = ffffd04c
!	Mem[0000000010001408] = 766649f6 70000000, %l6 = 00000000, %l7 = 1330f043
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 00000000766649f6 0000000070000000
!	Mem[0000000030081400] = ffff0070, %l2 = ffffffffffffffff
	ldsha	[%i2+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001408] = ffffffff, %l2 = ffffffffffffffff
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 000000000000ffff
	membar	#Sync			! Added by membar checker (11)
!	Mem[00000000300c1400] = 00000000 ff639887 ffffd04c 00000000
!	Mem[00000000300c1410] = 00000070 77ac3b81 2616afca 27b20a73
!	Mem[00000000300c1420] = 175bbcd8 4bde6289 4f4baed6 666e35cf
!	Mem[00000000300c1430] = 0d427144 64a491c5 6af06ba2 63c98feb
	ldda	[%i3+%g0]ASI_BLK_SL,%f0 	! Block Load from 00000000300c1400

p0_label_71:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 51154dee, %l3 = 000000d0, %l2 = 0000ffff
	add	%i6,0x28,%g1
	casa	[%g1]0x80,%l3,%l2	! %l2 = 0000000051154dee
!	Mem[00000000100c1428] = 6c4f5be66fbbc49f, %l4 = ff190000000000ff, %l4 = ff190000000000ff
	add	%i3,0x28,%g1
	casxa	[%g1]0x80,%l4,%l4	! %l4 = 6c4f5be66fbbc49f
!	%l5 = 0000000000000000, Mem[0000000030081400] = 7000ffff
	stba	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 7000ff00
!	%f6  = 730ab227 caaf1626, %l7 = 0000000070000000
!	Mem[0000000010141410] = 0000ffff000000ff
	add	%i5,0x010,%g1
	stda	%f6,[%g1+%l7]ASI_PST32_P ! Mem[0000000010141410] = 0000ffff000000ff
!	%l0 = ffffffffffffffff, imm = fffffffffffffd83, %l2 = 0000000051154dee
	xnor	%l0,-0x27d,%l2		! %l2 = fffffffffffffd83
!	%f30 = ff190000 00000000, Mem[0000000010101410] = 0000000a 00000000
	stda	%f30,[%i4+%o5]0x80	! Mem[0000000010101410] = ff190000 00000000
!	Mem[000000001000140c] = 70000000, %l5 = 0000000000000000
	swap	[%i0+0x00c],%l5		! %l5 = 0000000070000000
!	Mem[0000000020800041] = ffdf22f0, %l5 = 0000000070000000
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 00000000000000df
!	Mem[0000000030041408] = 0000cec4, %l6 = 00000000766649f6
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 000000000000cec4
!	Mem[00000000201c0000] = fad04a90, %l7 = 0000000070000000
	ldstub	[%o0+%g0],%l7		! %l7 = 00000000000000fa

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 068687f8, %f21 = 0a000000
	lda	[%i6+%o4]0x89,%f21	! %f21 = 068687f8
!	Mem[0000000030101400] = ffffffff ffffffff, %l2 = fffffd83, %l3 = 000000d0
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000030181408] = f8878606, %l6 = 000000000000cec4
	lduwa	[%i6+%o4]0x81,%l6	! %l6 = 00000000f8878606
!	Mem[0000000030181408] = 00000070068687f8, %l0 = ffffffffffffffff
	ldxa	[%i6+%o4]0x89,%l0	! %l0 = 00000070068687f8
!	Mem[00000000100c1410] = 0000ffffc4ce0000, %f16 = 3edaea7d 713598f5
	ldda	[%i3+%o5]0x80,%f16	! %f16 = 0000ffff c4ce0000
!	Mem[0000000030101410] = 6e521812 f84ee221, %l6 = f8878606, %l7 = 000000fa
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 00000000f84ee221 000000006e521812
!	%l7 = 000000006e521812, %l3 = 00000000ffffffff, %y  = 00000000
	umul	%l7,%l3,%l0		! %l0 = 6e52181191ade7ee, %y = 6e521811
!	Mem[0000000010181408] = ff000000000019ff, %l6 = 00000000f84ee221
	ldx	[%i6+%o4],%l6		! %l6 = ff000000000019ff
!	Mem[0000000010001408] = 766649f6 00000000, %l0 = 91ade7ee, %l1 = 3018d829
	ldd	[%i0+%o4],%l0		! %l0 = 00000000766649f6 0000000000000000
!	Mem[0000000010001410] = 00000000, %l7 = 000000006e521812
	ldsw	[%i0+%o5],%l7		! %l7 = 0000000000000000

p0_label_73:
!	Starting 10 instruction Store Burst
!	%f22 = cdeffd0c, Mem[0000000010141410] = ffff0000
	sta	%f22,[%i5+%o5]0x88	! Mem[0000000010141410] = cdeffd0c
!	Mem[000000001014141c] = 0d52ece7, %l6 = 00000000000019ff, %asi = 80
	swapa	[%i5+0x01c]%asi,%l6	! %l6 = 000000000d52ece7
!	%l1 = 0000000000000000, Mem[0000000010041408] = f6496676
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = f6490000
!	Mem[0000000030181408] = 068687f8, %l4 = 6c4f5be66fbbc49f
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000f8
!	%f24 = 21e24ef8, Mem[0000000030081400] = 7000ff00
	sta	%f24,[%i2+%g0]0x89	! Mem[0000000030081400] = 21e24ef8
!	%l3 = 00000000ffffffff, Mem[0000000010141408] = 29d8183000000000
	stxa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000ffffffff
!	Mem[0000000010181400] = 4cd0ffff, %l3 = 00000000ffffffff
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 000000004cd0ffff
!	Mem[0000000021800180] = 653de470, %l3 = 000000004cd0ffff
	ldstub	[%o3+0x180],%l3		! %l3 = 0000000000000065
!	%l2 = 00000000ffffffff, Mem[0000000010081400] = 546600ee
	stwa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffff
!	%f19 = 068687f8, %f22 = cdeffd0c, %f24 = 21e24ef8 3018d829
	fsmuld	%f19,%f22,%f24		! %f24 = ba9f877a cd9de800

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ffffffff, %f26 = 00000000
	lda	[%i0+%o4]0x89,%f26	! %f26 = ffffffff
!	Mem[0000000030081410] = 31712d16, %f21 = 068687f8
	lda	[%i2+%o5]0x89,%f21	! %f21 = 31712d16
!	Mem[000000001004142d] = 000000f8, %l1 = 0000000000000000
	ldub	[%i1+0x02d],%l1		! %l1 = 0000000000000000
!	Mem[0000000010001410] = ee00665400000000, %l5 = 00000000000000df
	ldxa	[%i0+%o5]0x88,%l5	! %l5 = ee00665400000000
!	Mem[0000000010001400] = cdeffd0c, %l0 = 00000000766649f6
	lduba	[%i0+%g0]0x88,%l0	! %l0 = 000000000000000c
!	%l0 = 000000000000000c, imm = 0000000000000edb, %l1 = 0000000000000000
	sub	%l0,0xedb,%l1		! %l1 = fffffffffffff131
!	Mem[000000001010143c] = 000019ff, %l3 = 0000000000000065, %asi = 80
	ldsha	[%i4+0x03c]%asi,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010181400] = ffffffff 3018d829 ff000000 000019ff
!	Mem[0000000010181410] = 00000070 f6496676 32df213a 221b1023
!	Mem[0000000010181420] = 1599520d f6006676 51154dee 060f0987
!	Mem[0000000010181430] = 6c4f5be6 6fbbc49f 00000000 ee000000
	ldda	[%i6+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010181400
!	%l7 = 0000000000000000, %l6 = 000000000d52ece7, %l6 = 000000000d52ece7
	sdivx	%l7,%l6,%l6		! %l6 = 0000000000000000
!	Mem[0000000010081420] = 29d81830, %l4 = 00000000000000f8
	lduw	[%i2+0x020],%l4		! %l4 = 0000000029d81830

p0_label_75:
!	Starting 10 instruction Store Burst
!	%f4  = 00000070 f6496676, %l3 = 0000000000000000
!	Mem[0000000030001420] = 21e24ef83018d829
	add	%i0,0x020,%g1
	stda	%f4,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030001420] = 21e24ef83018d829
!	%f14 = 00000000 ee000000, Mem[0000000010041400] = fffff6fd 21006a3c
	stda	%f14,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 ee000000
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l5 = ee00665400000000, Mem[0000000010001410] = 00000000546600ee
	stxa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = ee00665400000000
!	%l0 = 000000000000000c, Mem[0000000010081408] = 068687ff
	stha	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 0686000c
!	Mem[00000000100c1400] = ff000000 6591e0a1 d0ffffff 000000df
!	%f16 = 0000ffff c4ce0000 00000000 068687f8
!	%f20 = 00000000 31712d16 cdeffd0c 8e85595c
!	%f24 = ba9f877a cd9de800 ffffffff ff639887
!	%f28 = 813bac77 ff00e850 ff190000 00000000
	stda	%f16,[%i3+%g0]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	%l0 = 000000000000000c, Mem[0000000030041400] = 00000000000019ff
	stxa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000000000000c
!	Mem[0000000010041410] = fffff6fd, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l3	! %l3 = 00000000fffff6fd
!	%l6 = 0000000000000000, Mem[00000000201c0001] = ffd04a90
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = ff004a90
!	%l4 = 0000000029d81830, imm = 0000000000000965, %l0 = 000000000000000c
	xor	%l4,0x965,%l0		! %l0 = 0000000029d81155

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l2 = 00000000ffffffff
	lduha	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 068687ff, %l1 = fffffffffffff131
	lduha	[%i6+%o4]0x89,%l1	! %l1 = 00000000000087ff
!	Mem[0000000010101400] = 713598f5, %l3 = 00000000fffff6fd
	ldsha	[%i4+%g0]0x88,%l3	! %l3 = ffffffffffff98f5
!	Mem[0000000030081400] = 21e24ef8, %l6 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = fffffffffffffff8
!	Mem[0000000010181408] = ff000000, %f7  = 221b1023
	lda	[%i6+%o4]0x80,%f7 	! %f7 = ff000000
!	Mem[0000000030181400] = 0d000000, %l5 = ee00665400000000
	lduwa	[%i6+%g0]0x89,%l5	! %l5 = 000000000d000000
!	Mem[0000000030081410] = 162d7131, %l4 = 0000000029d81830
	ldsba	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000016
!	Mem[0000000030101408] = ff000000, %l6 = fffffffffffffff8
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030081400] = f84ee221 6591e0a1, %l0 = 29d81155, %l1 = 000087ff
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 00000000f84ee221 000000006591e0a1
!	Mem[0000000010141410] = 0cfdefcd 000000ff, %l6 = ffffff00, %l7 = 00000000
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 000000000cfdefcd 00000000000000ff

p0_label_77:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000d000000, Mem[0000000010141408] = ffffffff
	stwa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 0d000000
!	%l4 = 0000000000000016, Mem[0000000030141410] = 00000000
	stba	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000016
	membar	#Sync			! Added by membar checker (13)
!	%l2 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stha	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	Mem[00000000218000c0] = 0176b9e0, %l3 = ffffffffffff98f5
	ldstub	[%o3+0x0c0],%l3		! %l3 = 0000000000000001
!	%f14 = 00000000 ee000000, %l6 = 000000000cfdefcd
!	Mem[0000000010141428] = 6c4f5be66fbbc49f
	add	%i5,0x028,%g1
	stda	%f14,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010141428] = 004f00ee6fbb0000
!	Mem[0000000010081400] = ffffffff, %l6 = 000000000cfdefcd
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l4 = 0000000000000016, Mem[00000000100c1400] = ffff0000
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffff0016
!	%l7 = 00000000000000ff, Mem[00000000100c1400] = 0000cec4ffff0016
	stxa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000000000ff
!	Mem[0000000030081400] = f84ee221, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000f84ee221
!	Mem[00000000100c1420] = ba9f877acd9de800, %l6 = 00000000f84ee221, %l6 = 00000000f84ee221
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = ba9f877acd9de800

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 6d0700ff f6496676, %l6 = cd9de800, %l7 = 000000ff
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 00000000f6496676 000000006d0700ff
!	Mem[00000000300c1400] = 00000000 ff639887 ffffd04c 00000000
!	Mem[00000000300c1410] = 00000070 77ac3b81 2616afca 27b20a73
!	Mem[00000000300c1420] = 175bbcd8 4bde6289 4f4baed6 666e35cf
!	Mem[00000000300c1430] = 0d427144 64a491c5 6af06ba2 63c98feb
	ldda	[%i3+%g0]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010141408] = 0000000d, %l6 = 00000000f6496676
	ldswa	[%i5+%o4]0x88,%l6	! %l6 = 000000000000000d
!	Mem[0000000010141410] = 0cfdefcd, %l7 = 000000006d0700ff
	lduwa	[%i5+%o5]0x80,%l7	! %l7 = 000000000cfdefcd
!	Mem[00000000300c1410] = 70000000, %l1 = 000000006591e0a1
	ldsha	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081420] = 29d81830, %l2 = 0000000000000000, %asi = 80
	lduha	[%i2+0x020]%asi,%l2	! %l2 = 00000000000029d8
!	Mem[0000000010041410] = 00000000, %l3 = 0000000000000001
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = 70000000, %l5 = 000000000d000000
	ldsba	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	%f24 = 175bbcd8, %f18 = ffffd04c, %f4  = 00000070
	fsubs	%f24,%f18,%f4 		! %f4  = ffffd04c
!	Mem[0000000030001410] = ffffd04c, %l5 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l5	! %l5 = 00000000ffffd04c

p0_label_79:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ffffffff, %l5 = 00000000ffffd04c
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081410] = ffffffff, %l7 = 000000000cfdefcd
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010081400] = ffffffff, %l7 = 00000000ffffffff
	ldstuba	[%i2+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l0 = 00000000f84ee221, Mem[0000000010141410] = cdeffd0c
	stha	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = cdefe221
!	Mem[0000000030081400] = 000000ff, %l6 = 000000000000000d
	ldstuba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = 0686000c, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 000000000686000c
!	%l4 = 00000016, %l5 = 000000ff, Mem[0000000030141410] = 16000000 951f0000
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000016 000000ff
!	%l4 = 0000000000000016, Mem[0000000030101408] = ff000000
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00160000
!	Mem[0000000030141408] = ff6600ee, %l1 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001410] = ffffd04c, %l4 = 0000000000000016
	swapa	[%i0+%o5]0x81,%l4	! %l4 = 00000000ffffd04c

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ffffffffffffffff, %l5 = 00000000000000ff
	ldxa	[%i4+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	%l4 = 00000000ffffd04c, Mem[00000000201c0000] = ff004a90
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = d04c4a90
!	Mem[0000000010141408] = 0000000d, %l5 = ffffffffffffffff
	ldswa	[%i5+%o4]0x88,%l5	! %l5 = 000000000000000d
!	Mem[0000000030101400] = ffffffff, %l4 = 00000000ffffd04c
	lduba	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001410] = 00000016, %l2 = 00000000000029d8
	ldsha	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%f19 = 00000000, %f18 = ffffd04c, %f3  = 000019ff
	fdivs	%f19,%f18,%f3 		! %f3  = ffffd04c
!	Mem[0000000010001408] = 766649f6, %l1 = 00000000000000ff
	ldsha	[%i0+%o4]0x80,%l1	! %l1 = 0000000000007666
!	Mem[0000000010181410] = 70000000, %l0 = 00000000f84ee221
	ldswa	[%i6+%o5]0x88,%l0	! %l0 = 0000000070000000
!	Mem[0000000030141400] = 00000000 62682877, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000 0000000062682877
!	Mem[00000000100c1430] = 813bac77ff00e850, %f14 = 00000000 ee000000, %asi = 80
	ldda	[%i3+0x030]%asi,%f14	! %f14 = 813bac77 ff00e850

p0_label_81:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 00000016, %l2 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = 70000000, %l7 = 0000000062682877
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030001410] = 16000000
	stha	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 16000000
!	Mem[00000000100c1408] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%l2 = 00000000, %l3 = 0686000c, Mem[0000000010001420] = 51733388 ffd61079, %asi = 80
	stda	%l2,[%i0+0x020]%asi	! Mem[0000000010001420] = 00000000 0686000c
!	%l0 = 0000000070000000, imm = 0000000000000668, %l5 = 000000000000000d
	orn	%l0,0x668,%l5		! %l5 = fffffffffffff997
!	%l4 = 0000000000000000, Mem[0000000030001408] = ffffffff
	stha	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000ffff
	membar	#Sync			! Added by membar checker (14)
!	%f12 = 6c4f5be6, Mem[00000000300c1410] = 70000000
	sta	%f12,[%i3+%o5]0x89	! Mem[00000000300c1410] = 6c4f5be6
!	%l0 = 0000000070000000, Mem[00000000201c0001] = d04c4a90, %asi = 80
	stba	%l0,[%o0+0x001]%asi	! Mem[00000000201c0000] = d0004a90
!	Mem[0000000010001400] = 0cfdefcd 000000ff 766649f6 00000000
!	%f0  = ffffffff 3018d829 ff000000 ffffd04c
!	%f4  = ffffd04c f6496676 32df213a ff000000
!	%f8  = 1599520d f6006676 51154dee 060f0987
!	%f12 = 6c4f5be6 6fbbc49f 813bac77 ff00e850
	stda	%f0 ,[%i0+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010001400

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffffffff, %l2 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1410] = 00000000, %l1 = 0000000000007666
	ldsba	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 00001600, %l2 = ffffffffffffffff
	ldsha	[%i4+%o4]0x89,%l2	! %l2 = 0000000000001600
!	Mem[0000000030001408] = 000025edffff0000, %l3 = 000000000686000c
	ldxa	[%i0+%o4]0x89,%l3	! %l3 = 000025edffff0000
!	Mem[00000000300c1408] = 000000004cd0ffff, %l3 = 000025edffff0000
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = 000000004cd0ffff
!	Mem[0000000030081408] = f6496676 00000000, %l4 = 00000000, %l5 = fffff997
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 00000000f6496676 0000000000000000
!	Mem[0000000030081408] = 766649f6, %f28 = 0d427144
	lda	[%i2+%o4]0x89,%f28	! %f28 = 766649f6
!	Mem[0000000010041413] = 00000000, %l5 = 0000000000000000
	ldub	[%i1+0x013],%l5		! %l5 = 0000000000000000
!	Mem[0000000010041408] = 000049f600000049, %f24 = 175bbcd8 4bde6289
	ldda	[%i1+%o4]0x80,%f24	! %f24 = 000049f6 00000049
!	%l6 = 0000000000000000, immd = 0000012d, %y  = 6e521811
	udiv	%l6,0x12d,%l0		! %l0 = 00000000ffffffff
	mov	%l0,%y			! %y = ffffffff

p0_label_83:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000001600, Mem[00000000100c1408] = ff000000, %asi = 80
	stba	%l2,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000
!	%l2 = 0000000000001600, Mem[0000000030181408] = ff878606
	stha	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 16008606
!	%f4  = ffffd04c f6496676, %l3 = 000000004cd0ffff
!	Mem[0000000030081400] = ff0000ff6591e0a1
	stda	%f4,[%i2+%l3]ASI_PST8_S ! Mem[0000000030081400] = ffffd04cf6496676
!	%l4 = 00000000f6496676, Mem[0000000010181408] = 000000ff
	stha	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00006676
!	Mem[000000001004142b] = ed250000, %l4 = 00000000f6496676
	ldstuba	[%i1+0x02b]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030041408] = f6496676, %l3 = 000000004cd0ffff
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 00000000f6496676
!	Mem[00000000100c1408] = 00000000, %l6 = 00000000ff000000
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = ffffd04c, %l4 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 00000000ffffd04c
!	Mem[0000000010041438] = 49f75032, %l4 = ffffd04c, %l5 = 00000000
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 0000000049f75032

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %f27 = 666e35cf
	lda	[%i2+%g0]0x89,%f27	! %f27 = 00000000
!	Mem[0000000030081408] = 766649f6, %l4 = 00000000ffffd04c
	lduwa	[%i2+%o4]0x89,%l4	! %l4 = 00000000766649f6
!	Mem[0000000010181424] = f6006676, %l4 = 00000000766649f6
	lduw	[%i6+0x024],%l4		! %l4 = 00000000f6006676
!	Mem[0000000030081400] = 766649f600000000, %l6 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l6	! %l6 = 766649f600000000
!	Mem[0000000030141408] = ff6600ee, %l1 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l1	! %l1 = 00000000ff6600ee
!	Mem[0000000010041400] = ee000000, %l5 = 0000000049f75032
	lduba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = 0000000a00000000, %f18 = ffffd04c 00000000
	ldda	[%i0+%g0]0x89,%f18	! %f18 = 0000000a 00000000
!	Mem[0000000030081400] = 00000000f6496676, %f22 = 2616afca 27b20a73
	ldda	[%i2+%g0]0x81,%f22	! %f22 = 00000000 f6496676
!	Mem[00000000218000c1] = ff76b9e0, %l4 = 00000000f6006676, %asi = 80
	lduba	[%o3+0x0c1]%asi,%l4	! %l4 = 0000000000000076
!	Mem[0000000030141400] = 00000000, %f17 = ff639887
	lda	[%i5+%g0]0x89,%f17	! %f17 = 00000000

p0_label_85:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ff6600ee, Mem[0000000010141408] = 0d00000000000000
	stxa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000ff6600ee
!	Mem[0000000010101408] = 068687f8, %l3 = 00000000f6496676
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000f8
!	%l5 = 0000000000000000, %l4 = 0000000000000076, %l5 = 0000000000000000
	sub	%l5,%l4,%l5		! %l5 = ffffffffffffff8a
!	%l0 = ffffffff, %l1 = ff6600ee, Mem[0000000010141418] = 54329fda 000019ff, %asi = 80
	stda	%l0,[%i5+0x018]%asi	! Mem[0000000010141418] = ffffffff ff6600ee
!	%f19 = 00000000, %f1  = 3018d829, %f3  = ffffd04c
	fsubs	%f19,%f1 ,%f3 		! %f3  = b018d829
!	Mem[0000000010141400] = ff000000 162d7131 00000000 ff6600ee
!	%f16 = 00000000 00000000 0000000a 00000000
!	%f20 = 00000070 77ac3b81 00000000 f6496676
!	%f24 = 000049f6 00000049 4f4baed6 00000000
!	%f28 = 766649f6 64a491c5 6af06ba2 63c98feb
	stda	%f16,[%i5+%g0]ASI_BLK_PL	! Block Store to 0000000010141400
!	%l6 = 766649f600000000, Mem[00000000100c1408] = ff000000068687f8
	stxa	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 766649f600000000
!	Mem[0000000010081400] = ffffffff, %l5 = 00000000ffffff8a
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 00000000ffffffff
!	%f12 = 6c4f5be6 6fbbc49f, Mem[0000000010141410] = 77ac3b81 00000070
	stda	%f12,[%i5+%o5]0x88	! Mem[0000000010141410] = 6c4f5be6 6fbbc49f
!	%l6 = 00000000, %l7 = 00000000, Mem[00000000300c1408] = 4cd0ffff 00000000
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 00000000

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 766649f6, %l4 = 0000000000000076
	ldsha	[%i2+%o4]0x89,%l4	! %l4 = 00000000000049f6
!	Mem[0000000030101400] = ffffffff ffffffff, %l0 = ffffffff, %l1 = ff6600ee
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 00000000ffffffff 00000000ffffffff
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010141430] = c591a464, %l7 = 0000000000000000
	lduw	[%i5+0x030],%l7		! %l7 = 00000000c591a464
!	Mem[0000000030181410] = 000000ee, %l4 = 00000000000049f6
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ee
!	Mem[00000000100c1408] = 766649f6, %l7 = 00000000c591a464
	ldsba	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000076
!	Mem[0000000030001400] = 00000000, %l0 = 00000000ffffffff
	ldsha	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = 9725ed1e ee0066ff, %l6 = 00000000, %l7 = 00000076
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 00000000ee0066ff 000000009725ed1e
!	Mem[0000000030101408] = 00160000, %l1 = 00000000ffffffff
	ldswa	[%i4+%o4]0x81,%l1	! %l1 = 0000000000160000
!	Mem[0000000030181400] = f1fad75f0d000000, %f22 = 00000000 f6496676
	ldda	[%i6+%g0]0x89,%f22	! %f22 = f1fad75f 0d000000

p0_label_87:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800101] = 25ff4c10, %l6 = 00000000ee0066ff
	ldstub	[%o3+0x101],%l6		! %l6 = 00000000000000ff
!	%l4 = 00000000000000ee, Mem[00000000100c1408] = 766649f6, %asi = 80
	stwa	%l4,[%i3+0x008]%asi	! Mem[00000000100c1408] = 000000ee
!	%l0 = 0000000000000000, Mem[0000000030081408] = f6496676
	stha	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00006676
!	%l5 = 00000000ffffffff, Mem[0000000020800040] = ffff22f0, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = ffff22f0
!	%l7 = 000000009725ed1e, Mem[0000000010041410] = 00000000
	stha	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = ed1e0000
!	Mem[0000000030141408] = ee0066ff, %l3 = 00000000000000f8
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 00000000ee0066ff
!	Mem[0000000010101408] = ff878606, %l6 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 00000000ff878606
!	%f2  = ff000000 b018d829, %l1 = 0000000000160000
!	Mem[0000000030081428] = 59e08776101fc7ef
	add	%i2,0x028,%g1
	stda	%f2,[%g1+%l1]ASI_PST8_S ! Mem[0000000030081428] = 59e08776101fc7ef
!	%l4 = 000000ee, %l5 = ffffffff, Mem[0000000010101410] = ff190000 00000000
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ee ffffffff
!	%f6  = 32df213a, Mem[0000000030081410] = 31712d16
	sta	%f6 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 32df213a

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff000070, %l3 = 00000000ee0066ff
	lduha	[%i6+%o5]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[00000000100c1400] = 00000000, %l4 = 00000000000000ee
	lduwa	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 21e24ef81218526e, %l6 = 00000000ff878606
	ldxa	[%i4+%o5]0x81,%l6	! %l6 = 21e24ef81218526e
!	%l3 = 000000000000ff00, %l6 = 21e24ef81218526e, %l5 = 00000000ffffffff
	addc	%l3,%l6,%l5		! %l5 = 21e24ef81219516e
!	Mem[0000000010041410] = 00001eed, %l0 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l0	! %l0 = 0000000000001eed
!	Mem[0000000010041400] = 000000ee, %l3 = 000000000000ff00
	lduwa	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ee
!	Mem[0000000010041410] = 00001eed, %l4 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l4	! %l4 = 0000000000001eed
!	Mem[0000000030081408] = 0000667600000000, %f4  = ffffd04c f6496676
	ldda	[%i2+%o4]0x81,%f4 	! %f4  = 00006676 00000000
!	Mem[00000000100c1406] = 00000000, %l0 = 0000000000001eed, %asi = 80
	lduha	[%i3+0x006]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = 000000ee, %l4 = 0000000000001eed
	ldswa	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000ee

p0_label_89:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 51154dee, %l4 = 000000ee, %l6 = 1218526e
	add	%i6,0x28,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 0000000051154dee
!	Mem[0000000010041412] = ed1e0000, %l5 = 21e24ef81219516e
	ldstub	[%i1+0x012],%l5		! %l5 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010181410] = 700000ff
	stba	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 70000000
!	%l7 = 000000009725ed1e, Mem[00000000300c1408] = 0000000000000000
	stxa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000009725ed1e
!	%l7 = 000000009725ed1e, imm = 00000000000004b0, %l6 = 0000000051154dee
	addc	%l7,0x4b0,%l6		! %l6 = 000000009725f1ce
!	%l2 = 0000000000001600, Mem[0000000030041408] = ffffd04c
	stba	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ffd04c
!	%l6 = 000000009725f1ce, Mem[0000000030081408] = 76660000
	stwa	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 9725f1ce
!	Mem[0000000010141410] = 9fc4bb6f, %l4 = 00000000000000ee
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 000000009fc4bb6f
!	Mem[000000001010142c] = 00000000, %l3 = 00000000000000ee, %asi = 80
	swapa	[%i4+0x02c]%asi,%l3	! %l3 = 0000000000000000
!	%f23 = 0d000000, %f21 = 77ac3b81
	fcmpes	%fcc0,%f23,%f21		! %fcc0 = 1

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000 ffffff8a, %l6 = 9725f1ce, %l7 = 9725ed1e
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 00000000ffffff8a 0000000000000000
!	Mem[0000000030181400] = 0d000000, %l3 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 49000000 f6490000, %l0 = 00000000, %l1 = 00160000
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000f6490000 0000000049000000
!	%l4 = 9fc4bb6f, %l5 = 00000000, Mem[0000000010181408] = 76660000 000019ff
	stda	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 9fc4bb6f 00000000
!	Mem[0000000010041400] = 000000ee, %l6 = 00000000ffffff8a
	lduba	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %f29 = 64a491c5
	lda	[%i4+%g0]0x81,%f29	! %f29 = ffffffff
!	Mem[00000000100c1422] = ba9f877a, %l6 = 0000000000000000
	ldsb	[%i3+0x022],%l6		! %l6 = ffffffffffffff87
!	%l7 = 0000000000000000, imm = fffffffffffffa22, %l0 = 00000000f6490000
	andn	%l7,-0x5de,%l0		! %l0 = 0000000000000000
!	Mem[0000000010101414] = ffffffff, %l4 = 000000009fc4bb6f
	ldsw	[%i4+0x014],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010181434] = 6fbbc49f, %l5 = 0000000000000000
	ldub	[%i6+0x034],%l5		! %l5 = 000000000000006f

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000000
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000049000000
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000001600
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be ffffffffffffffff
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000000000006f
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be ffffffffffffff87
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne	%xcc,p0_reg_l7_fail
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
	cmp	%l0,%l1			! %f0  should be ffffffff 3018d829
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ff000000 b018d829
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00006676 00000000
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 32df213a ff000000
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 1599520d f6006676
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 51154dee 060f0987
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 6c4f5be6 6fbbc49f
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 813bac77 ff00e850
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 0000000a 00000000
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000070 77ac3b81
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be f1fad75f 0d000000
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 000049f6 00000049
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 4f4baed6 00000000
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 766649f6 ffffffff
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 6af06ba2 63c98feb
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
	ldx	[%g1+0x000],%l0		! %l0 = 48eda61ccfbcfc1e
	ldx	[%g1+0x008],%l1		! %l1 = c30ca78c43f54ec9
	ldx	[%g1+0x010],%l2		! %l2 = d02c3a202732bd84
	ldx	[%g1+0x018],%l3		! %l3 = 7899c09d85a7cb4f
	ldx	[%g1+0x020],%l4		! %l4 = 68f050d5897b8b2a
	ldx	[%g1+0x028],%l5		! %l5 = 18f04eb99fe4a015
	ldx	[%g1+0x030],%l6		! %l6 = c730c9f0ef543d10
	ldx	[%g1+0x038],%l7		! %l7 = 87922d4f91b1251b

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
	fsqrts	%f14,%f15
	xnor	%l7,%l3,%l6
	and	%l7,0x1fb,%l7
	st	%f9 ,[%i6+%o4]		! Mem[0000000010181408]
	udivx	%l3,%l3,%l4
	jmpl	%o7,%g0
	add	%l2,-0xe07,%l5
p0_near_0_he:
	jmpl	%o7,%g0
	sdivx	%l6,%l3,%l3
	jmpl	%o7,%g0
	nop
p0_near_0_lo:
	fsqrts	%f14,%f15
	xnor	%l7,%l3,%l6
	and	%l7,0x1fb,%l7
	st	%f9 ,[%o6+%i4]		! Mem[0000000010181408]
	udivx	%l3,%l3,%l4
	jmpl	%o7,%g0
	add	%l2,-0xe07,%l5
p0_near_0_ho:
	jmpl	%o7,%g0
	sdivx	%l6,%l3,%l3
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	or	%l7,%l2,%l1
	sdivx	%l5,0xd68,%l0
	mulx	%l7,-0x486,%l7
	andn	%l0,0xbb0,%l0
	udivx	%l0,0xa33,%l2
	xor	%l2,0x5cb,%l3
	addc	%l2,-0x992,%l5
	jmpl	%o7,%g0
	xor	%l6,%l0,%l6
near0_b2b_l:
	fsubs	%f13,%f7 ,%f11
	andn	%l1,0x344,%l4
	fdtos	%f8 ,%f12
	smul	%l4,%l4,%l4
	fmuls	%f12,%f2 ,%f6 
	sub	%l1,0x549,%l2
	add	%l4,%l2,%l7
	jmpl	%o7,%g0
	add	%l6,-0x7e8,%l1
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
	mulx	%l7,%l0,%l7
	add	%l7,-0xac4,%l4
	orn	%l7,0x893,%l3
	fsqrts	%f1 ,%f1 
	fdivs	%f12,%f11,%f13
	fdtos	%f14,%f8 
	add	%l3,0x3c7,%l3
	jmpl	%o7,%g0
	sub	%l5,%l2,%l3
p0_near_1_he:
	umul	%l7,0xe08,%l4
	fdivs	%f20,%f29,%f20
	subc	%l4,0x8bb,%l7
	or	%l6,-0xa9b,%l5
	jmpl	%o7,%g0
	fmuls	%f18,%f25,%f27
p0_near_1_lo:
	mulx	%l7,%l0,%l7
	add	%l7,-0xac4,%l4
	orn	%l7,0x893,%l3
	fsqrts	%f1 ,%f1 
	fdivs	%f12,%f11,%f13
	fdtos	%f14,%f8 
	add	%l3,0x3c7,%l3
	jmpl	%o7,%g0
	sub	%l5,%l2,%l3
p0_near_1_ho:
	umul	%l7,0xe08,%l4
	fdivs	%f20,%f29,%f20
	subc	%l4,0x8bb,%l7
	or	%l6,-0xa9b,%l5
	jmpl	%o7,%g0
	fmuls	%f18,%f25,%f27
near1_b2b_h:
	xnor	%l3,%l2,%l3
	jmpl	%o7,%g0
	add	%l6,%l3,%l2
near1_b2b_l:
	smul	%l1,-0xf69,%l7
	jmpl	%o7,%g0
	fsubs	%f0 ,%f10,%f8 
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
	std	%f12,[%i4+%o4]		! Mem[0000000010101408]
	sub	%l0,0x6a3,%l5
	jmpl	%o7,%g0
	xor	%l1,-0x309,%l5
p0_near_2_he:
	and	%l3,%l5,%l2
	xor	%l6,%l1,%l0
	jmpl	%o7,%g0
	mulx	%l1,-0x83f,%l6
p0_near_2_lo:
	std	%f12,[%o4+%i4]		! Mem[0000000010101408]
	sub	%l0,0x6a3,%l5
	jmpl	%o7,%g0
	xor	%l1,-0x309,%l5
p0_near_2_ho:
	and	%l3,%l5,%l2
	xor	%l6,%l1,%l0
	jmpl	%o7,%g0
	mulx	%l1,-0x83f,%l6
near2_b2b_h:
	subc	%l5,-0x96d,%l6
	and	%l1,-0x1ed,%l1
	fadds	%f31,%f31,%f29
	add	%l6,%l6,%l5
	sub	%l2,%l4,%l0
	addc	%l4,%l7,%l3
	xnor	%l4,%l5,%l6
	jmpl	%o7,%g0
	smul	%l2,-0xa78,%l1
near2_b2b_l:
	xor	%l0,-0x6cc,%l3
	fsqrts	%f9 ,%f1 
	andn	%l2,-0xeb2,%l7
	fcmps	%fcc2,%f2 ,%f11
	subc	%l1,0x6d2,%l2
	umul	%l3,-0xdce,%l0
	fmuls	%f6 ,%f4 ,%f6 
	jmpl	%o7,%g0
	xnor	%l1,%l3,%l6
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
	fsubs	%f3 ,%f14,%f1 
	jmpl	%o7,%g0
	andn	%l1,-0xc07,%l4
p0_near_3_he:
	orn	%l5,%l3,%l4
	smul	%l4,0x4c6,%l0
	fmuls	%f26,%f17,%f21
	or	%l3,-0xed4,%l4
	sub	%l2,-0x997,%l3
	fsqrts	%f16,%f30
	orn	%l4,%l4,%l2
	jmpl	%o7,%g0
	xnor	%l2,%l3,%l0
p0_near_3_lo:
	fsubs	%f3 ,%f14,%f1 
	jmpl	%o7,%g0
	andn	%l1,-0xc07,%l4
p0_near_3_ho:
	orn	%l5,%l3,%l4
	smul	%l4,0x4c6,%l0
	fmuls	%f26,%f17,%f21
	or	%l3,-0xed4,%l4
	sub	%l2,-0x997,%l3
	fsqrts	%f16,%f30
	orn	%l4,%l4,%l2
	jmpl	%o7,%g0
	xnor	%l2,%l3,%l0
near3_b2b_h:
	fsubs	%f19,%f21,%f25
	xor	%l0,%l3,%l4
	mulx	%l1,0x647,%l4
	addc	%l0,0x459,%l6
	xnor	%l7,-0xa07,%l0
	xnor	%l1,-0x007,%l4
	jmpl	%o7,%g0
	mulx	%l0,-0xbe6,%l4
near3_b2b_l:
	umul	%l5,-0x5dc,%l5
	umul	%l3,-0xe31,%l1
	addc	%l7,%l6,%l2
	fsubs	%f9 ,%f3 ,%f8 
	umul	%l3,%l0,%l2
	umul	%l0,%l2,%l7
	jmpl	%o7,%g0
	sdivx	%l7,%l1,%l4
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
	andn	%l2,%l3,%l4
	and	%l4,0x43b,%l3
	addc	%l1,%l4,%l3
	fadds	%f11,%f0 ,%f8 
	jmpl	%o7,%g0
	fitod	%f10,%f4 
p0_far_0_he:
	addc	%l4,0x10b,%l5
	udivx	%l7,0x680,%l1
	or	%l1,-0xbd8,%l3
	andn	%l5,%l3,%l4
	jmpl	%o7,%g0
	add	%l7,%l3,%l4
p0_far_0_lo:
	andn	%l2,%l3,%l4
	and	%l4,0x43b,%l3
	addc	%l1,%l4,%l3
	fadds	%f11,%f0 ,%f8 
	jmpl	%o7,%g0
	fitod	%f10,%f4 
p0_far_0_ho:
	addc	%l4,0x10b,%l5
	udivx	%l7,0x680,%l1
	or	%l1,-0xbd8,%l3
	andn	%l5,%l3,%l4
	jmpl	%o7,%g0
	add	%l7,%l3,%l4
far0_b2b_h:
	or	%l5,%l5,%l2
	jmpl	%o7,%g0
	subc	%l7,%l0,%l6
far0_b2b_l:
	xor	%l0,0xcb4,%l0
	jmpl	%o7,%g0
	mulx	%l0,%l0,%l3
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
	sub	%l2,-0x7e6,%l6
	fmuls	%f15,%f0 ,%f13
	fsqrts	%f6 ,%f8 
	fdivs	%f3 ,%f9 ,%f14
	jmpl	%o7,%g0
	fsubs	%f0 ,%f6 ,%f2 
p0_far_1_he:
	jmpl	%o7,%g0
	subc	%l3,%l5,%l6
	jmpl	%o7,%g0
	nop
p0_far_1_lo:
	sub	%l2,-0x7e6,%l6
	fmuls	%f15,%f0 ,%f13
	fsqrts	%f6 ,%f8 
	fdivs	%f3 ,%f9 ,%f14
	jmpl	%o7,%g0
	fsubs	%f0 ,%f6 ,%f2 
p0_far_1_ho:
	jmpl	%o7,%g0
	subc	%l3,%l5,%l6
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far1_b2b_h:
	jmpl	%o7,%g0
	fsubs	%f25,%f18,%f28
	jmpl	%o7,%g0
	nop
far1_b2b_l:
	jmpl	%o7,%g0
	mulx	%l7,-0x3de,%l7
	jmpl	%o7,%g0
	nop
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
	fsqrts	%f8 ,%f9 
	fsubs	%f9 ,%f12,%f13
	smul	%l3,0x82e,%l6
	fdivs	%f10,%f14,%f4 
	addc	%l7,%l6,%l0
	stx	%l5,[%i5+0x008]		! Mem[0000000010141408]
	and	%l6,%l7,%l0
	jmpl	%o7,%g0
	sdivx	%l0,0xacf,%l3
p0_far_2_he:
	xnor	%l5,-0x16f,%l6
	fdivs	%f20,%f27,%f17
	fadds	%f22,%f30,%f31
	udivx	%l4,%l2,%l5
	andn	%l0,0x3b4,%l7
	sub	%l7,-0x657,%l1
	jmpl	%o7,%g0
	or	%l6,0xc90,%l6
p0_far_2_lo:
	fsqrts	%f8 ,%f9 
	fsubs	%f9 ,%f12,%f13
	smul	%l3,0x82e,%l6
	fdivs	%f10,%f14,%f4 
	addc	%l7,%l6,%l0
	stx	%l5,[%o5+0x008]		! Mem[0000000010141408]
	and	%l6,%l7,%l0
	jmpl	%o7,%g0
	sdivx	%l0,0xacf,%l3
p0_far_2_ho:
	xnor	%l5,-0x16f,%l6
	fdivs	%f20,%f27,%f17
	fadds	%f22,%f30,%f31
	udivx	%l4,%l2,%l5
	andn	%l0,0x3b4,%l7
	sub	%l7,-0x657,%l1
	jmpl	%o7,%g0
	or	%l6,0xc90,%l6
far2_b2b_h:
	subc	%l5,%l3,%l6
	udivx	%l3,0x1a7,%l5
	jmpl	%o7,%g0
	fsubs	%f22,%f23,%f31
far2_b2b_l:
	udivx	%l2,0x2a0,%l0
	smul	%l2,%l6,%l2
	jmpl	%o7,%g0
	smul	%l5,%l1,%l4
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
	sdivx	%l6,%l0,%l3
	fdivs	%f5 ,%f7 ,%f4 
	and	%l5,%l1,%l3
	orn	%l5,%l6,%l0
	udivx	%l0,%l4,%l0
	jmpl	%o7,%g0
	xor	%l3,%l7,%l7
p0_far_3_he:
	fcmps	%fcc0,%f30,%f17
	ldd	[%i6+0x008],%f28	! Mem[0000000010181408]
	stb	%l4,[%i1+0x00a]		! Mem[000000001004140a]
	swap	[%i1+0x02c],%l5		! Mem[000000001004142c]
	addc	%l0,%l3,%l5
	udivx	%l0,0xd32,%l2
	sub	%l4,%l0,%l3
	jmpl	%o7,%g0
	fdivs	%f17,%f16,%f19
p0_far_3_lo:
	sdivx	%l6,%l0,%l3
	fdivs	%f5 ,%f7 ,%f4 
	and	%l5,%l1,%l3
	orn	%l5,%l6,%l0
	udivx	%l0,%l4,%l0
	jmpl	%o7,%g0
	xor	%l3,%l7,%l7
p0_far_3_ho:
	fcmps	%fcc0,%f30,%f17
	ldd	[%o6+0x008],%f28	! Mem[0000000010181408]
	stb	%l4,[%o1+0x00a]		! Mem[000000001004140a]
	swap	[%o1+0x02c],%l5		! Mem[000000001004142c]
	addc	%l0,%l3,%l5
	udivx	%l0,0xd32,%l2
	sub	%l4,%l0,%l3
	jmpl	%o7,%g0
	fdivs	%f17,%f16,%f19
far3_b2b_h:
	udivx	%l2,%l3,%l2
	fdivs	%f27,%f26,%f21
	and	%l5,%l7,%l0
	sub	%l3,%l0,%l4
	xor	%l6,-0x7dd,%l5
	fcmps	%fcc0,%f23,%f21
	jmpl	%o7,%g0
	fadds	%f23,%f23,%f22
far3_b2b_l:
	fmuls	%f11,%f3 ,%f11
	xnor	%l5,%l4,%l3
	fdivs	%f7 ,%f13,%f8 
	fadds	%f11,%f13,%f11
	smul	%l2,-0xdf1,%l5
	udivx	%l5,0xb06,%l6
	jmpl	%o7,%g0
	xnor	%l1,%l1,%l0
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	fsubs	%f14,%f15,%f1 
	add	%l4,%l5,%l0
	xnor	%l3,0x9b6,%l7
	orn	%l2,0x6fa,%l0
	xnor	%l5,0x2ef,%l1
	jmpl	%g6+8,%g0
	ldsh	[%o2+0x000],%l2		! Mem[00000000211c0000]
p0_call_0_le:
	subc	%l3,-0x5fa,%l7
	fdivs	%f6 ,%f13,%f12
	fsqrts	%f15,%f1 
	retl
	umul	%l4,-0x355,%l6
p0_jmpl_0_lo:
	fsubs	%f14,%f15,%f1 
	add	%l4,%l5,%l0
	xnor	%l3,0x9b6,%l7
	orn	%l2,0x6fa,%l0
	xnor	%l5,0x2ef,%l1
	jmpl	%g6+8,%g0
	ldsh	[%i2+0x000],%l2		! Mem[00000000211c0000]
p0_call_0_lo:
	subc	%l3,-0x5fa,%l7
	fdivs	%f6 ,%f13,%f12
	fsqrts	%f15,%f1 
	retl
	umul	%l4,-0x355,%l6
p0_jmpl_0_he:
	add	%l0,%l4,%l2
	andn	%l2,-0x8d9,%l2
	orn	%l3,-0x213,%l5
	fadds	%f30,%f20,%f31
	smul	%l1,%l4,%l4
	jmpl	%g6+8,%g0
	or	%l5,-0xff2,%l1
p0_call_0_he:
	fcmps	%fcc3,%f25,%f19
	udivx	%l3,%l3,%l5
	umul	%l2,0xe85,%l0
	sub	%l0,0x0e7,%l4
	fsubs	%f21,%f22,%f20
	udivx	%l5,0xaa8,%l0
	sub	%l7,%l2,%l2
	retl
	sdivx	%l1,0x3ef,%l4
p0_jmpl_0_ho:
	add	%l0,%l4,%l2
	andn	%l2,-0x8d9,%l2
	orn	%l3,-0x213,%l5
	fadds	%f30,%f20,%f31
	smul	%l1,%l4,%l4
	jmpl	%g6+8,%g0
	or	%l5,-0xff2,%l1
p0_call_0_ho:
	fcmps	%fcc3,%f25,%f19
	udivx	%l3,%l3,%l5
	umul	%l2,0xe85,%l0
	sub	%l0,0x0e7,%l4
	fsubs	%f21,%f22,%f20
	udivx	%l5,0xaa8,%l0
	sub	%l7,%l2,%l2
	retl
	sdivx	%l1,0x3ef,%l4
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	fsqrts	%f9 ,%f8 
	smul	%l1,%l3,%l2
	fsubs	%f6 ,%f10,%f8 
	or	%l3,%l2,%l1
	add	%l3,%l4,%l5
	jmpl	%g6+8,%g0
	mulx	%l3,%l3,%l3
p0_call_1_le:
	retl
	std	%f4 ,[%i6+0x030]	! Mem[0000000010181430]
p0_jmpl_1_lo:
	fsqrts	%f9 ,%f8 
	smul	%l1,%l3,%l2
	fsubs	%f6 ,%f10,%f8 
	or	%l3,%l2,%l1
	add	%l3,%l4,%l5
	jmpl	%g6+8,%g0
	mulx	%l3,%l3,%l3
p0_call_1_lo:
	retl
	std	%f4 ,[%o6+0x030]	! Mem[0000000010181430]
p0_jmpl_1_he:
	swap	[%i2+0x01c],%l3		! Mem[000000001008141c]
	smul	%l0,-0x40f,%l0
	add	%l1,-0xeec,%l0
	mulx	%l1,%l3,%l1
	smul	%l4,%l4,%l2
	xnor	%l6,%l4,%l4
	jmpl	%g6+8,%g0
	and	%l1,%l2,%l0
p0_call_1_he:
	xnor	%l3,0xb10,%l3
	addc	%l1,-0x04b,%l0
	retl
	fsqrts	%f17,%f19
p0_jmpl_1_ho:
	swap	[%o2+0x01c],%l3		! Mem[000000001008141c]
	smul	%l0,-0x40f,%l0
	add	%l1,-0xeec,%l0
	mulx	%l1,%l3,%l1
	smul	%l4,%l4,%l2
	xnor	%l6,%l4,%l4
	jmpl	%g6+8,%g0
	and	%l1,%l2,%l0
p0_call_1_ho:
	xnor	%l3,0xb10,%l3
	addc	%l1,-0x04b,%l0
	retl
	fsqrts	%f17,%f19
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	xnor	%l7,%l2,%l2
	and	%l2,%l6,%l2
	fdivs	%f6 ,%f7 ,%f4 
	xnor	%l7,0x6ba,%l4
	fdivs	%f1 ,%f7 ,%f7 
	stx	%l7,[%i0+0x030]		! Mem[0000000010001430]
	jmpl	%g6+8,%g0
	xnor	%l7,%l6,%l6
p0_call_2_le:
	retl
	fdivs	%f3 ,%f6 ,%f8 
p0_jmpl_2_lo:
	xnor	%l7,%l2,%l2
	and	%l2,%l6,%l2
	fdivs	%f6 ,%f7 ,%f4 
	xnor	%l7,0x6ba,%l4
	fdivs	%f1 ,%f7 ,%f7 
	stx	%l7,[%o0+0x030]		! Mem[0000000010001430]
	jmpl	%g6+8,%g0
	xnor	%l7,%l6,%l6
p0_call_2_lo:
	retl
	fdivs	%f3 ,%f6 ,%f8 
p0_jmpl_2_he:
	add	%l0,%l1,%l0
	fstod	%f18,%f26
	stb	%l1,[%o3+0x100]		! Mem[0000000021800100]
	xor	%l7,-0xfb6,%l6
	fstoi	%f25,%f24
	jmpl	%g6+8,%g0
	mulx	%l7,%l3,%l5
p0_call_2_he:
	retl
	addc	%l4,%l3,%l4
p0_jmpl_2_ho:
	add	%l0,%l1,%l0
	fstod	%f18,%f26
	stb	%l1,[%i3+0x100]		! Mem[0000000021800100]
	xor	%l7,-0xfb6,%l6
	fstoi	%f25,%f24
	jmpl	%g6+8,%g0
	mulx	%l7,%l3,%l5
p0_call_2_ho:
	retl
	addc	%l4,%l3,%l4
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	sub	%l1,%l5,%l3
	fmuls	%f9 ,%f15,%f8 
	fcmps	%fcc2,%f8 ,%f1 
	jmpl	%g6+8,%g0
	udivx	%l4,%l7,%l7
p0_call_3_le:
	fmuls	%f5 ,%f15,%f3 
	retl
	sth	%l3,[%o2+0x000]		! Mem[00000000211c0000]
p0_jmpl_3_lo:
	sub	%l1,%l5,%l3
	fmuls	%f9 ,%f15,%f8 
	fcmps	%fcc2,%f8 ,%f1 
	jmpl	%g6+8,%g0
	udivx	%l4,%l7,%l7
p0_call_3_lo:
	fmuls	%f5 ,%f15,%f3 
	retl
	sth	%l3,[%i2+0x000]		! Mem[00000000211c0000]
p0_jmpl_3_he:
	xnor	%l2,-0x42b,%l4
	fdivs	%f31,%f28,%f18
	smul	%l7,%l7,%l7
	subc	%l7,%l3,%l4
	fadds	%f27,%f21,%f24
	andn	%l2,-0x94d,%l6
	xor	%l5,%l2,%l4
	jmpl	%g6+8,%g0
	fmuls	%f31,%f18,%f27
p0_call_3_he:
	udivx	%l1,0x823,%l0
	fcmps	%fcc0,%f29,%f16
	sub	%l0,0x73f,%l3
	mulx	%l7,-0x6a1,%l6
	andn	%l1,0x7de,%l3
	subc	%l2,0x706,%l6
	retl
	xor	%l6,%l5,%l4
p0_jmpl_3_ho:
	xnor	%l2,-0x42b,%l4
	fdivs	%f31,%f28,%f18
	smul	%l7,%l7,%l7
	subc	%l7,%l3,%l4
	fadds	%f27,%f21,%f24
	andn	%l2,-0x94d,%l6
	xor	%l5,%l2,%l4
	jmpl	%g6+8,%g0
	fmuls	%f31,%f18,%f27
p0_call_3_ho:
	udivx	%l1,0x823,%l0
	fcmps	%fcc0,%f29,%f16
	sub	%l0,0x73f,%l3
	mulx	%l7,-0x6a1,%l6
	andn	%l1,0x7de,%l3
	subc	%l2,0x706,%l6
	retl
	xor	%l6,%l5,%l4
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
	.word	0x48eda61c,0xcfbcfc1e		! Init value for %l0
	.word	0xc30ca78c,0x43f54ec9		! Init value for %l1
	.word	0xd02c3a20,0x2732bd84		! Init value for %l2
	.word	0x7899c09d,0x85a7cb4f		! Init value for %l3
	.word	0x68f050d5,0x897b8b2a		! Init value for %l4
	.word	0x18f04eb9,0x9fe4a015		! Init value for %l5
	.word	0xc730c9f0,0xef543d10		! Init value for %l6
	.word	0x87922d4f,0x91b1251b		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x11e1df30,0x233ea481		! Init value for %f0 
	.word	0x51154dee,0x060f0987		! Init value for %f2 
	.word	0x5da4431c,0x351e153d		! Init value for %f4 
	.word	0x2177563a,0x742d5123		! Init value for %f6 
	.word	0x4f85fac8,0x22d832b9		! Init value for %f8 
	.word	0x0c166046,0x0a687b7f		! Init value for %f10
	.word	0x03045234,0x713598f5		! Init value for %f12
	.word	0x3a871812,0x1d27049b		! Init value for %f14
	.word	0x46ae5560,0x55b1a3f1		! Init value for %f16
	.word	0x158de99e,0x62682877		! Init value for %f18
	.word	0x4dd0d04c,0x25f66fad		! Init value for %f20
	.word	0x192b00ea,0x7e1fe313		! Init value for %f22
	.word	0x21e24ef8,0x3018d829		! Init value for %f24
	.word	0x766649f6,0x0d52f06f		! Init value for %f26
	.word	0x5faf1d64,0x57947965		! Init value for %f28
	.word	0x6edb70c2,0x6bf2cc8b		! Init value for %f30
	.word	0x0c454790,0x1307af61		! Init value for %f32
	.word	0x1605e14e,0x3179b367		! Init value for %f34
	.word	0x0da0997c,0x26af961d		! Init value for %f36
	.word	0x644cc79a,0x2046a103		! Init value for %f38
	.word	0x13169f28,0x37a40999		! Init value for %f40
	.word	0x47cf0fa6,0x03b9515f		! Init value for %f42
	.word	0x7982a494,0x13d3a5d5		! Init value for %f44
	.word	0x1eef6572,0x390e407b		! Init value for %f46
	.word	0x7731b5c0,0x4abfc6d1
	.word	0x48a034fe,0x5efaaa57
	.word	0x1b8e9eac,0x72f8888d
	.word	0x366faa4a,0x68088af3
	.word	0x6e8deb58,0x3858c709
	.word	0x2c53b156,0x0bb29e4f
	.word	0x3bd9e7c4,0x0f021e45
	.word	0x1a35f622,0x5240606b
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
	.word	0x00000000,0x00000000		! %l0
	.word	0x00000000,0x49000000		! %l1
	.word	0x00000000,0x00001600		! %l2
	.word	0x00000000,0x00000000		! %l3
	.word	0xffffffff,0xffffffff		! %l4
	.word	0x00000000,0x0000006f		! %l5
	.word	0xffffffff,0xffffff87		! %l6
	.word	0x00000000,0x00000000		! %l7
p0_expected_fp_regs:
	.word	0xffffffff,0x3018d829		! %f0
	.word	0xff000000,0xb018d829		! %f2
	.word	0x00006676,0x00000000		! %f4
	.word	0x32df213a,0xff000000		! %f6
	.word	0x1599520d,0xf6006676		! %f8
	.word	0x51154dee,0x060f0987		! %f10
	.word	0x6c4f5be6,0x6fbbc49f		! %f12
	.word	0x813bac77,0xff00e850		! %f14
	.word	0x00000000,0x00000000		! %f16
	.word	0x0000000a,0x00000000		! %f18
	.word	0x00000070,0x77ac3b81		! %f20
	.word	0xf1fad75f,0x0d000000		! %f22
	.word	0x000049f6,0x00000049		! %f24
	.word	0x4f4baed6,0x00000000		! %f26
	.word	0x766649f6,0xffffffff		! %f28
	.word	0x6af06ba2,0x63c98feb		! %f30
	.word	0x00000010,0x000004a0		! %fsr
p0_local0_expect:
	.word	0x29d81830,0xffffffff,0x4cd0ffff,0x000000ff ! PA = 0000000010001400
	.word	0x766649f6,0x4cd0ffff,0x000000ff,0x3a21df32 ! PA = 0000000010001410
	.word	0x766600f6,0x0d529915,0x87090f06,0xee4d1551 ! PA = 0000000010001420
	.word	0x9fc4bb6f,0xe65b4f6c,0x50e800ff,0x77ac3b81 ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0x00000000,0x0a000000,0x0000ffff,0xed250000 ! PA = 0000000030001400
	.word	0x00000016,0x25f66fad,0x192b00ea,0x7e1fe313 ! PA = 0000000030001410
	.word	0x21e24ef8,0x3018d829,0x766649f6,0x0d52f06f ! PA = 0000000030001420
	.word	0x5faf1d64,0x57947965,0x6edb70c2,0x6bf2cc8b ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x014d953e,0x2662b58f,0xb6ba6ae2,0xb4e26bfb
	.word	0x6fd23ea6,0x1e0128c7,0x26edc98a,0xb93476f3
	.word	0xb633cc8e,0xa94ef97f,0xfadb50b2,0x009f2b6b
	.word	0xe18fe6f6,0x79341fb7,0x8187e85a,0xa7f84163
p0_local1_expect:
	.word	0x000000ee,0x00000000,0x000049f6,0x00000049 ! PA = 0000000010041400
	.word	0xed1eff00,0x0d000000,0x00000112,0xe076a648 ! PA = 0000000010041410
	.word	0xffffffff,0xcec4595c,0xed2500ff,0x000000f8 ! PA = 0000000010041420
	.word	0x3edaea7d,0x713598f5,0x49f75032,0x2764c83b ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0x00000000,0x0000000c,0x00ffd04c,0xff00076d ! PA = 0000000030041400
	.word	0x00000049,0x00000000,0x1fc24d0a,0x096beab3 ! PA = 0000000030041410
	.word	0x04a4f418,0x407734c9,0x49000000,0x00000000 ! PA = 0000000030041420
	.word	0x5eb84c84,0x7a80f805,0x078650e2,0x29b7982b ! PA = 0000000030041430
p0_local2_expect:
	.word	0x8affffff,0x00000000,0x00000000,0x70000000 ! PA = 0000000010081400
	.word	0xcdeffd0c,0x4cd0d0ff,0xf1fad75f,0x0d000000 ! PA = 0000000010081410
	.word	0x29d81830,0xf84ee221,0x6ff0520d,0xf6496676 ! PA = 0000000010081420
	.word	0x50e800ff,0x77ac3b81,0x00000000,0x000019ff ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x00000000,0xf6496676,0xcef12597,0x00000000 ! PA = 0000000030081400
	.word	0x3a21df32,0x1041f32d,0x3700466a,0x2156a293 ! PA = 0000000030081410
	.word	0x26c06078,0x0845b3a9,0x59e08776,0x101fc7ef ! PA = 0000000030081420
	.word	0x1d1be6e4,0x39822ce5,0x12ac2642,0x41513c0b ! PA = 0000000030081430
p0_local3_expect:
	.word	0x00000000,0x00000000,0x000000ee,0x00000000 ! PA = 00000000100c1400
	.word	0x00000000,0x31712d16,0xcdeffd0c,0x8e85595c ! PA = 00000000100c1410
	.word	0xba9f877a,0xcd9de800,0xffffffff,0xff639887 ! PA = 00000000100c1420
	.word	0x813bac77,0xff00e850,0xff190000,0x00000000 ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0x00000000,0xff639887,0x1eed2597,0x00000000 ! PA = 00000000300c1400
	.word	0xe65b4f6c,0x77ac3b81,0x2616afca,0x27b20a73 ! PA = 00000000300c1410
	.word	0x175bbcd8,0x4bde6289,0x4f4baed6,0x666e35cf ! PA = 00000000300c1420
	.word	0x0d427144,0x64a491c5,0x6af06ba2,0x63c98feb ! PA = 00000000300c1430
p0_local4_expect:
	.word	0xf5983571,0x7deada3e,0x000000ff,0x00000000 ! PA = 0000000010101400
	.word	0x000000ee,0xffffffff,0x5c59858e,0x0cfdefcd ! PA = 0000000010101410
	.word	0x29d81830,0xf84ee221,0x879863ff,0x000000ee ! PA = 0000000010101420
	.word	0x50e800ff,0x77ac3b81,0x00000000,0x000019ff ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0xffffffff,0xffffffff,0x00160000,0x00000000 ! PA = 0000000030101400
	.word	0x21e24ef8,0x1218526e,0xa3b07e74,0xbabbc70d ! PA = 0000000030101410
	.word	0x7fae4c0e,0x482cf01b,0xfff2d11c,0xc6bd7554 ! PA = 0000000030101420
	.word	0x75ec7c4c,0xb43b3777,0x1b144454,0x92edc61d ! PA = 0000000030101430
p0_local5_expect:
	.word	0x00000000,0x00000000,0x00000000,0x0a000000 ! PA = 0000000010141400
	.word	0x000000ee,0xe65b4f6c,0x766649f6,0x00000000 ! PA = 0000000010141410
	.word	0x49000000,0xf6490000,0x00000000,0xd6ae4b4f ! PA = 0000000010141420
	.word	0xc591a464,0xf6496676,0xeb8fc963,0xa26bf06a ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0x00000000,0x62682877,0xf8000000,0x1eed2597 ! PA = 0000000030141400
	.word	0xff000016,0x000000ff,0x362cd28a,0x049aea33 ! PA = 0000000030141410
	.word	0x49724598,0x3a4e5049,0x340c4d96,0x169a218f ! PA = 0000000030141420
	.word	0x66385604,0x392ceb85,0x29344662,0x5a3647ab ! PA = 0000000030141430
p0_local6_expect:
	.word	0xffffffff,0x3018d829,0x9fc4bb6f,0x00000000 ! PA = 0000000010181400
	.word	0x00000070,0xf6496676,0x32df213a,0x221b1023 ! PA = 0000000010181410
	.word	0x1599520d,0xf6006676,0x51154dee,0x060f0987 ! PA = 0000000010181420
	.word	0x6c4f5be6,0x6fbbc49f,0x00000000,0xee000000 ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x0000000d,0x5fd7faf1,0x16008606,0x70000000 ! PA = 0000000030181400
	.word	0xee000000,0x00000000,0x0000cec4,0x000000ff ! PA = 0000000030181410
	.word	0x439d71f8,0x0d158f29,0x7591c4f6,0x5be79f6f ! PA = 0000000030181420
	.word	0x26b7b064,0x4d82e065,0x3863dbc2,0x349aab8b ! PA = 0000000030181430
share0_expect:
	.word	0xd0004a90,0x54d6c661,0x6fbe3c4e,0x62dbc267 ! PA = 00000000201c0000
	.word	0x3c650c7c,0x4e7e5d1d,0x2078129a,0x7db9e003 ! PA = 00000000201c0010
	.word	0x19298228,0x2dc18099,0x30204aa6,0x0444c05f ! PA = 00000000201c0020
	.word	0x616ef794,0x25beccd5,0x4f899072,0x1668df7b ! PA = 00000000201c0030
share1_expect:
	.word	0x69d078c0,0x72279dd1,0x7b164ffe,0x548b7957 ! PA = 0000000020800000
	.word	0x718ed1ac,0x4cbc0f8d,0x7cc4b54a,0x21e689f3 ! PA = 0000000020800010
	.word	0x7da88e58,0x2b86fe09,0x1bfaac56,0x45a4cd4f ! PA = 0000000020800020
	.word	0x4859fac4,0x23da0545,0x6711e122,0x26bdbf6b ! PA = 0000000020800030
	.word	0xffff22f0,0x0e098141,0x42a3bfae,0x1e919c47 ! PA = 0000000020800040
	.word	0x2ac1d2dc,0x45e88dfd,0x2a9573fa,0x1e455fe3 ! PA = 0000000020800050
	.word	0x2a459688,0x24050779,0x50e3ea06,0x22dec63f ! PA = 0000000020800060
	.word	0x2093b9f4,0x0ba389b5,0x062fcdd2,0x34204b5b ! PA = 0000000020800070
share2_expect:
	.word	0xff7d4920,0x297b70b1,0x18098b5e,0x6a252b37 ! PA = 00000000211c0000
	.word	0x3df9100c,0x3f32d86d,0x10fd4eaa,0x35bd61d3 ! PA = 00000000211c0010
	.word	0x59eb9ab8,0x179a9ce9,0x065f03b6,0x6789ab2f ! PA = 00000000211c0020
	.word	0x5cf73524,0x7faa5a25,0x5fd65682,0x31d7834b ! PA = 00000000211c0030
share3_expect:
	.word	0xff95eb50,0x603c6c21,0x44aab30e,0x213d2627 ! PA = 0000000021800000
	.word	0x46ef893c,0x5489eedd,0x1acf455a,0x47f58fc3 ! PA = 0000000021800010
	.word	0x79459ae8,0x5966be59,0x43aef966,0x17fc7c1f ! PA = 0000000021800020
	.word	0x4e1f6c54,0x713d7695,0x02b87b32,0x27ea673b ! PA = 0000000021800030
	.word	0x46520980,0x58cb7391,0x39aa36be,0x5e908d17 ! PA = 0000000021800040
	.word	0x57203e6c,0x289cd14d,0x669e580a,0x4154e9b3 ! PA = 0000000021800050
	.word	0x56be9718,0x7f486bc9,0x0fd6cb16,0x614e390f ! PA = 0000000021800060
	.word	0x52675f84,0x106bdf05,0x09493be2,0x231ff72b ! PA = 0000000021800070
	.word	0x1dd2a3b0,0x34678701,0x3feb166e,0x5d966007 ! PA = 0000000021800080
	.word	0x25c62f9c,0x54da7fbd,0x76bd86ba,0x0b026fa3 ! PA = 0000000021800090
	.word	0x52818f48,0x51dea539,0x219978c6,0x0955e1ff ! PA = 00000000218000a0
	.word	0x05ea0eb4,0x3c049375,0x49bb9892,0x24ff331b ! PA = 00000000218000b0
	.word	0xff76b9e0,0x7f0fa671,0x2810521e,0x6a859ef7 ! PA = 00000000218000c0
	.word	0x3fdc5ccc,0x5971fa2d,0x613fd16a,0x7ae52193 ! PA = 00000000218000d0
	.word	0x0e798378,0x3c886aa9,0x0f7a0276,0x5eaa76ef ! PA = 00000000218000e0
	.word	0x728279e4,0x719693e5,0x06029142,0x13cf1b0b ! PA = 00000000218000f0
	.word	0x25ff4c10,0x1f82d1e1,0x7a7ce9ce,0x525549e7 ! PA = 0000000021800100
	.word	0x381dc5fc,0x0d52409d,0x7ff8381a,0x43a3ff83 ! PA = 0000000021800110
	.word	0x1e5173a8,0x3d64bc19,0x7fbb6826,0x28a2f7df ! PA = 0000000021800120
	.word	0x3fcba114,0x3d70e055,0x1bd125f2,0x2a96aefb ! PA = 0000000021800130
	.word	0x49545a40,0x47400951,0x2753dd7e,0x52bc60d7 ! PA = 0000000021800140
	.word	0x57056b2c,0x0e2a530d,0x2079baca,0x64a60973 ! PA = 0000000021800150
	.word	0x37745fd8,0x55529989,0x5860a9d6,0x175664cf ! PA = 0000000021800160
	.word	0x63208444,0x2aa278c5,0x349a56a2,0x691ceeeb ! PA = 0000000021800170
	.word	0xff3de470,0x62864cc1,0x36782d2e,0x0a31e3c7 ! PA = 0000000021800180
	.word	0x4ace4c5c,0x3069317d,0x3417597a,0x1a123f63 ! PA = 0000000021800190
	.word	0x610d4808,0x77f102f9,0x6f2cc786,0x339bbdbf ! PA = 00000000218001a0
	.word	0x4f9c2374,0x32fa5d35,0x75912352,0x03e8dadb ! PA = 00000000218001b0
	.word	0xff6deaa0,0x08549c31,0x778cd8de,0x67ecd2b7 ! PA = 00000000218001c0
	.word	0x5773698c,0x6f3ddbed,0x7fe4142a,0x4ccfa153 ! PA = 00000000218001d0
	.word	0x24072c38,0x7b9ef869,0x39a2c136,0x4f0a02af ! PA = 00000000218001e0
	.word	0x26197ea4,0x2f078da5,0x2fa88c02,0x544172cb ! PA = 00000000218001f0
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
	.word	0x55be9ff0,0x2718ea41,0x3b3fe4ae,0x37620d47	! PA = 0000000010001400
	.word	0x5bd5dfdc,0x7d4046fd,0x66e6a8fa,0x1f8ca0e3	! PA = 0000000010001410
	.word	0x51733388,0x23d61079,0x3fb72f06,0x1c15d73f	! PA = 0000000010001420
	.word	0x0fcfe6f4,0x20eee2b5,0x2be222d2,0x3a102c5b	! PA = 0000000010001430
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
	.word	0x5ff70620,0x7d1219b1,0x4387f05e,0x57e6dc37	! PA = 0000000030001400
	.word	0x48715d0c,0x5eb5d16d,0x20c4c3aa,0x3db9e2d3	! PA = 0000000030001410
	.word	0x5ab177b8,0x4e7ae5e9,0x3d7c88b6,0x7479fc2f	! PA = 0000000030001420
	.word	0x0c3fa224,0x0028f325,0x4ae6eb82,0x17c4a44b	! PA = 0000000030001430
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
	.word	0x67a5e850,0x3c6a5521,0x2edb580e,0x1e801727	! PA = 0000000010041400
	.word	0x211c163c,0x474827dd,0x12dcfa5a,0x563750c3	! PA = 0000000010041410
	.word	0x5af3b7e8,0x5f664759,0x30e6be66,0x0d360d1f	! PA = 0000000010041420
	.word	0x25c41954,0x31ff4f95,0x49f75032,0x2764c83b	! PA = 0000000010041430
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
	.word	0x08564680,0x5fa09c91,0x725d1bbe,0x19e4be17	! PA = 0000000030041400
	.word	0x1b510b6c,0x6da64a4d,0x1fc24d0a,0x096beab3	! PA = 0000000030041410
	.word	0x04a4f418,0x407734c9,0x24f8d016,0x07610a0f	! PA = 0000000030041420
	.word	0x5eb84c84,0x7a80f805,0x078650e2,0x29b7982b	! PA = 0000000030041430
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
	.word	0x575320b0,0x5bf3f001,0x5af03b6e,0x798bd107	! PA = 0000000010081400
	.word	0x124b3c9c,0x7f3f38bd,0x0dc7bbba,0x747eb0a3	! PA = 0000000010081410
	.word	0x1bf02c48,0x0e4cae39,0x5475bdc6,0x1cd1f2ff	! PA = 0000000010081420
	.word	0x77373bb4,0x4c7cec75,0x1dc6ed92,0x5444141b	! PA = 0000000010081430
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
	.word	0x13a776e0,0x11634f71,0x3d37b71e,0x7dac4ff7	! PA = 0000000030081400
	.word	0x3705a9cc,0x1041f32d,0x3700466a,0x2156a293	! PA = 0000000030081410
	.word	0x26c06078,0x0845b3a9,0x59e08776,0x101fc7ef	! PA = 0000000030081420
	.word	0x1d1be6e4,0x39822ce5,0x12ac2642,0x41513c0b	! PA = 0000000030081430
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
	.word	0x561e4910,0x3aadbae1,0x25968ece,0x673d3ae7	! PA = 00000000100c1400
	.word	0x403b52fc,0x0b9d799d,0x393eed1a,0x769ac083	! PA = 00000000100c1410
	.word	0x1cc090a8,0x00814519,0x5f7c2d26,0x1ca188df	! PA = 00000000100c1420
	.word	0x1c014e14,0x61dfb955,0x07e8faf2,0x5fe60ffb	! PA = 00000000100c1430
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
	.word	0x41429740,0x5d523251,0x082fc27e,0x67f591d7	! PA = 00000000300c1400
	.word	0x1a67382c,0x2300cc0d,0x2616afca,0x27b20a73	! PA = 00000000300c1410
	.word	0x175bbcd8,0x4bde6289,0x4f4baed6,0x666e35cf	! PA = 00000000300c1420
	.word	0x0d427144,0x64a491c5,0x6af06ba2,0x63c98feb	! PA = 00000000300c1430
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
	.word	0x315f6170,0x398fb5c1,0x70e6522e,0x124c54c7	! PA = 0000000010101400
	.word	0x17c4595c,0x3edaea7d,0x32da8e7a,0x24c38063	! PA = 0000000010101410
	.word	0x01bce508,0x31fc0bf9,0x03120c86,0x6a5ccebf	! PA = 0000000010101420
	.word	0x07fa5074,0x4f9fb635,0x24f57852,0x3582bbdb	! PA = 0000000010101430
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
	.word	0x6c7fa7a0,0x3a654531,0x335d3dde,0x497883b7	! PA = 0000000030101400
	.word	0x204db68c,0x6e5ad4ed,0x689d892a,0x0ab62253	! PA = 0000000030101410
	.word	0x48cf0938,0x5d394169,0x74524636,0x6e0453af	! PA = 0000000030101420
	.word	0x5103eba4,0x0f6026a5,0x4aeb2102,0x625893cb	! PA = 0000000030101430
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
	.word	0x526e69d0,0x6591e0a1,0x1af7858e,0x31711ea7	! PA = 0000000010141400
	.word	0x61be4fbc,0x576f8b5d,0x54329fda,0x1330f043	! PA = 0000000010141410
	.word	0x0b3d2968,0x4ab502d9,0x6c4f5be6,0x6fbbc49f	! PA = 0000000010141420
	.word	0x0afa42d4,0x5f34e315,0x4d8465b2,0x0c5217bb	! PA = 0000000010141430
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
	.word	0x0cb6a800,0x4b948811,0x1ad8293e,0x1eed2597	! PA = 0000000030141400
	.word	0x7f9124ec,0x26c80dcd,0x362cd28a,0x049aea33	! PA = 0000000030141410
	.word	0x49724598,0x3a4e5049,0x340c4d96,0x169a218f	! PA = 0000000030141420
	.word	0x66385604,0x392ceb85,0x29344662,0x5a3647ab	! PA = 0000000030141430
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
	.word	0x3ea36230,0x77ac3b81,0x7de228ee,0x07639887	! PA = 0000000010181400
	.word	0x4301361c,0x7fd35c3d,0x32df213a,0x221b1023	! PA = 0000000010181410
	.word	0x15995dc8,0x1ea429b9,0x444c1b46,0x22766a7f	! PA = 0000000010181420
	.word	0x50d92534,0x46173ff5,0x162dc312,0x678c239b	! PA = 0000000010181430
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
	.word	0x353f9860,0x5fd7faf1,0x16b8849e,0x710b7777	! PA = 0000000030181400
	.word	0x4b09834c,0x6cc076ad,0x025c8bea,0x1b986213	! PA = 0000000030181410
	.word	0x439d71f8,0x0d158f29,0x7591c4f6,0x5be79f6f	! PA = 0000000030181420
	.word	0x26b7b064,0x4d82e065,0x3863dbc2,0x349aab8b	! PA = 0000000030181430
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
	.word	0x17564a90,0x54d6c661,0x6fbe3c4e,0x62dbc267	! PA = 00000000201c0000
	.word	0x3c650c7c,0x4e7e5d1d,0x2078129a,0x7db9e003	! PA = 00000000201c0010
	.word	0x19298228,0x2dc18099,0x30204aa6,0x0444c05f	! PA = 00000000201c0020
	.word	0x616ef794,0x25beccd5,0x4f899072,0x1668df7b	! PA = 00000000201c0030
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
	.word	0x157278c0,0x72279dd1,0x7b164ffe,0x548b7957	! PA = 0000000020800000
	.word	0x718ed1ac,0x4cbc0f8d,0x7cc4b54a,0x21e689f3	! PA = 0000000020800010
	.word	0x7da88e58,0x2b86fe09,0x1bfaac56,0x45a4cd4f	! PA = 0000000020800020
	.word	0x4859fac4,0x23da0545,0x6711e122,0x26bdbf6b	! PA = 0000000020800030
	.word	0x19df22f0,0x0e098141,0x42a3bfae,0x1e919c47	! PA = 0000000020800040
	.word	0x2ac1d2dc,0x45e88dfd,0x2a9573fa,0x1e455fe3	! PA = 0000000020800050
	.word	0x2a459688,0x24050779,0x50e3ea06,0x22dec63f	! PA = 0000000020800060
	.word	0x2093b9f4,0x0ba389b5,0x062fcdd2,0x34204b5b	! PA = 0000000020800070
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
	.word	0x78a74920,0x297b70b1,0x18098b5e,0x6a252b37	! PA = 00000000211c0000
	.word	0x3df9100c,0x3f32d86d,0x10fd4eaa,0x35bd61d3	! PA = 00000000211c0010
	.word	0x59eb9ab8,0x179a9ce9,0x065f03b6,0x6789ab2f	! PA = 00000000211c0020
	.word	0x5cf73524,0x7faa5a25,0x5fd65682,0x31d7834b	! PA = 00000000211c0030
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
	.word	0x1f95eb50,0x603c6c21,0x44aab30e,0x213d2627	! PA = 0000000021800000
	.word	0x46ef893c,0x5489eedd,0x1acf455a,0x47f58fc3	! PA = 0000000021800010
	.word	0x79459ae8,0x5966be59,0x43aef966,0x17fc7c1f	! PA = 0000000021800020
	.word	0x4e1f6c54,0x713d7695,0x02b87b32,0x27ea673b	! PA = 0000000021800030
	.word	0x46360980,0x58cb7391,0x39aa36be,0x5e908d17	! PA = 0000000021800040
	.word	0x57203e6c,0x289cd14d,0x669e580a,0x4154e9b3	! PA = 0000000021800050
	.word	0x56be9718,0x7f486bc9,0x0fd6cb16,0x614e390f	! PA = 0000000021800060
	.word	0x52675f84,0x106bdf05,0x09493be2,0x231ff72b	! PA = 0000000021800070
	.word	0x1dd2a3b0,0x34678701,0x3feb166e,0x5d966007	! PA = 0000000021800080
	.word	0x25c62f9c,0x54da7fbd,0x76bd86ba,0x0b026fa3	! PA = 0000000021800090
	.word	0x52818f48,0x51dea539,0x219978c6,0x0955e1ff	! PA = 00000000218000a0
	.word	0x05ea0eb4,0x3c049375,0x49bb9892,0x24ff331b	! PA = 00000000218000b0
	.word	0x0176b9e0,0x7f0fa671,0x2810521e,0x6a859ef7	! PA = 00000000218000c0
	.word	0x3fdc5ccc,0x5971fa2d,0x613fd16a,0x7ae52193	! PA = 00000000218000d0
	.word	0x0e798378,0x3c886aa9,0x0f7a0276,0x5eaa76ef	! PA = 00000000218000e0
	.word	0x728279e4,0x719693e5,0x06029142,0x13cf1b0b	! PA = 00000000218000f0
	.word	0x25ed4c10,0x1f82d1e1,0x7a7ce9ce,0x525549e7	! PA = 0000000021800100
	.word	0x381dc5fc,0x0d52409d,0x7ff8381a,0x43a3ff83	! PA = 0000000021800110
	.word	0x1e5173a8,0x3d64bc19,0x7fbb6826,0x28a2f7df	! PA = 0000000021800120
	.word	0x3fcba114,0x3d70e055,0x1bd125f2,0x2a96aefb	! PA = 0000000021800130
	.word	0x49c15a40,0x47400951,0x2753dd7e,0x52bc60d7	! PA = 0000000021800140
	.word	0x57056b2c,0x0e2a530d,0x2079baca,0x64a60973	! PA = 0000000021800150
	.word	0x37745fd8,0x55529989,0x5860a9d6,0x175664cf	! PA = 0000000021800160
	.word	0x63208444,0x2aa278c5,0x349a56a2,0x691ceeeb	! PA = 0000000021800170
	.word	0x653de470,0x62864cc1,0x36782d2e,0x0a31e3c7	! PA = 0000000021800180
	.word	0x4ace4c5c,0x3069317d,0x3417597a,0x1a123f63	! PA = 0000000021800190
	.word	0x610d4808,0x77f102f9,0x6f2cc786,0x339bbdbf	! PA = 00000000218001a0
	.word	0x4f9c2374,0x32fa5d35,0x75912352,0x03e8dadb	! PA = 00000000218001b0
	.word	0x5a6deaa0,0x08549c31,0x778cd8de,0x67ecd2b7	! PA = 00000000218001c0
	.word	0x5773698c,0x6f3ddbed,0x7fe4142a,0x4ccfa153	! PA = 00000000218001d0
	.word	0x24072c38,0x7b9ef869,0x39a2c136,0x4f0a02af	! PA = 00000000218001e0
	.word	0x26197ea4,0x2f078da5,0x2fa88c02,0x544172cb	! PA = 00000000218001f0
share3_end:
