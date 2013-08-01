/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_3.s
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
!	Seed = 327144516
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1500_3.s created on Mar 27, 2009 (14:45:16)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_1500_3 -p 1 -l 1500

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
!	%f0  = fdb1b977 e8e0918e d2a2d449 24d1c567
!	%f4  = 384cb463 5b246f33 2833495e 6d076649
!	%f8  = ae2dd250 a10cbcc7 e9975724 d5d4cb02
!	%f12 = 211421be 638525c6 e58fcdda dbeeda90
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = e9d55bfd b93cb2c0 f985f7e1 545dc48f
!	%f20 = 11d3f94d 3e9acad9 602d1509 56a38f33
!	%f24 = 9d9154dc e8a2b647 69374947 6d447e32
!	%f28 = 5e634c2e 57b8f365 4f09357e 671a267b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 2ae5b055 5832f201 7501f6e2 7754f8ba
!	%f36 = 8a463fd2 7e301dda f131e5f5 8dcea415
!	%f40 = a1e6b8a8 af2ac7d2 6ea00b86 5149b595
!	%f44 = d836d95d 8d1be51d d51a70b1 2211d956
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xb73378080000007e,%g7,%g1 ! GSR scale = 15, align = 6
	wr	%g1,%g0,%gsr		! GSR = b73378080000007e
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000030001408] = 95b8669a, %l0 = 4be4cdca962eb102
	lduwa	[%i0+%o4]0x89,%l0	! %l0 = 0000000095b8669a
!	Mem[00000000100c1438] = 953a7c04b63ebb65, %l6 = 8d222d981580d265
	ldxa	[%i3+0x038]%asi,%l6	! %l6 = 953a7c04b63ebb65
!	%l6 = 953a7c04b63ebb65, %l5 = 64d409989c912f53, %l3 = cb9467843c875676
	subc	%l6,%l5,%l3		! %l3 = 3066726c19ad8c12
!	%f18 = f985f7e1, Mem[0000000010001408] = 60acc302
	sta	%f18,[%i0+%o4]0x88	! Mem[0000000010001408] = f985f7e1
!	%l7 = d12f015a54cd0fac, Mem[0000000030081410] = 198e1a35
	stha	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 0fac1a35
!	Mem[0000000030141400] = a6ac48cd, %l6 = 953a7c04b63ebb65
	ldstuba	[%i5+%g0]0x89,%l6	! %l6 = 000000cd000000ff
!	Mem[0000000030081410] = 0fac1a35, %l7 = d12f015a54cd0fac
	lduha	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000fac
!	Mem[0000000030041410] = afbbe7fa, %l1 = 63b84badb5dd8947
	lduba	[%i1+%o5]0x81,%l1	! %l1 = 00000000000000af
!	%l7 = 0000000000000fac, Mem[0000000010101408] = 3f77b3a6
	stha	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 3f770fac
!	Starting 10 instruction Store Burst
!	%l3 = 3066726c19ad8c12, Mem[0000000010041400] = 922cbcf1
	stba	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 122cbcf1

p0_label_2:
!	Mem[00000000300c1410] = e9a28956, %l2 = 910a96cab8d154a6
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 000000e9000000ff
!	Mem[0000000030081410] = 0fac1a35, %l5 = 64d409989c912f53
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 000000000fac1a35
!	%l6 = 00000000000000cd, Mem[000000001014143c] = 502cbcb9
	stw	%l6,[%i5+0x03c]		! Mem[000000001014143c] = 000000cd
!	%l7 = 0000000000000fac, Mem[0000000030141410] = 6edd74b0
	stba	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = acdd74b0
!	Mem[00000000300c1408] = 254a7205, %l1 = 00000000000000af
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 00000005000000ff
!	%l1 = 0000000000000005, Mem[00000000300c1410] = 5689a2ff
	stwa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000005
!	%f17 = b93cb2c0, Mem[0000000010001408] = f985f7e1
	sta	%f17,[%i0+%o4]0x88	! Mem[0000000010001408] = b93cb2c0
!	%l1 = 0000000000000005, Mem[00000000211c0001] = 4d9a217a
	stb	%l1,[%o2+0x001]		! Mem[00000000211c0000] = 4d05217a
!	Mem[0000000030181400] = f7ff58d5, %l1 = 0000000000000005
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 00000000f7ff58d5
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = c414c3cf, %f28 = 5e634c2e
	lda	[%i0+%g0]0x88,%f28	! %f28 = c414c3cf

p0_label_3:
!	Mem[0000000010001410] = b99d3b60, %l7 = 0000000000000fac
	lduha	[%i0+%o5]0x80,%l7	! %l7 = 000000000000b99d
!	Mem[0000000030041410] = fae7bbaf, %l1 = 00000000f7ff58d5
	lduba	[%i1+%o5]0x89,%l1	! %l1 = 00000000000000af
!	Mem[00000000100c140c] = ba1cf28d, %l3 = 3066726c19ad8c12
	ldsha	[%i3+0x00c]%asi,%l3	! %l3 = ffffffffffffba1c
!	Mem[0000000030181410] = 00555a56f6efbfed, %f26 = 69374947 6d447e32
	ldda	[%i6+%o5]0x89,%f26	! %f26 = 00555a56 f6efbfed
!	Mem[0000000010141408] = 2f1f2005, %l2 = 00000000000000e9
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000002005
!	Mem[00000000100c1408] = b390858d, %l6 = 00000000000000cd
	lduha	[%i3+%o4]0x80,%l6	! %l6 = 000000000000b390
!	Mem[0000000030141410] = b074ddac, %l2 = 0000000000002005
	lduha	[%i5+%o5]0x89,%l2	! %l2 = 000000000000ddac
!	Mem[00000000300c1410] = 00000005, %l0 = 0000000095b8669a
	ldsha	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000005
!	Mem[0000000030181410] = f6efbfed, %l2 = 000000000000ddac
	ldsha	[%i6+%o5]0x89,%l2	! %l2 = ffffffffffffbfed
!	Starting 10 instruction Store Burst
!	%f14 = e58fcdda, Mem[00000000100c1408] = b390858d
	sta	%f14,[%i3+%o4]0x80	! Mem[00000000100c1408] = e58fcdda

p0_label_4:
!	%f2  = d2a2d449 24d1c567, Mem[0000000010081408] = 14aa5d22 d40e858c
	stda	%f2 ,[%i2+%o4]0x80	! Mem[0000000010081408] = d2a2d449 24d1c567
!	%l0 = 00000005, %l1 = 000000af, Mem[0000000010001408] = b93cb2c0 068e8ee6
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000005 000000af
!	%l4 = 33d72ce6424efbbb, %l0 = 0000000000000005, %y  = 00000000
	smul	%l4,%l0,%l3		! %l3 = 000000014b8aeaa7, %y = 00000001
!	Mem[0000000010181410] = 46c0880c, %l7 = 000000000000b99d
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 0000000c000000ff
!	%l2 = ffffffffffffbfed, Mem[0000000030041408] = bbdbae878825f435
	stxa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffffffffbfed
!	%l1 = 00000000000000af, %l0 = 0000000000000005, %l4 = 33d72ce6424efbbb
	xnor	%l1,%l0,%l4		! %l4 = ffffffffffffff55
!	%l6 = 000000000000b390, Mem[0000000010081400] = 0c9100c1
	stba	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 909100c1
!	Mem[0000000030001408] = 95b8669a, %l6 = 000000000000b390
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 0000009a000000ff
!	Mem[0000000010141408] = 05201f2f, %l1 = 00000000000000af
	ldstuba	[%i5+%o4]0x80,%l1	! %l1 = 00000005000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff724a25, %l0 = 0000000000000005
	ldsba	[%i3+%o4]0x81,%l0	! %l0 = ffffffffffffffff

p0_label_5:
!	Mem[0000000030141410] = b3eeb920b074ddac, %f16 = e9d55bfd b93cb2c0
	ldda	[%i5+%o5]0x89,%f16	! %f16 = b3eeb920 b074ddac
!	Mem[0000000030001400] = c4813d84, %l5 = 000000000fac1a35
	lduba	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000c4
!	Mem[0000000010001410] = 603b9db9, %l0 = ffffffffffffffff
	lduwa	[%i0+%o5]0x88,%l0	! %l0 = 00000000603b9db9
!	Mem[0000000010181400] = 5519c24857cf5305, %l6 = 000000000000009a
	ldxa	[%i6+%g0]0x88,%l6	! %l6 = 5519c24857cf5305
!	Mem[0000000020800040] = 66bbd1fd, %l1 = 0000000000000005
	lduh	[%o1+0x040],%l1		! %l1 = 00000000000066bb
!	Mem[0000000030001400] = 177bec6e 843d81c4, %l0 = 603b9db9, %l1 = 000066bb
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 00000000843d81c4 00000000177bec6e
!	Mem[00000000300c1410] = 00000005, %l5 = 00000000000000c4
	ldsha	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000005
!	Mem[0000000010081400] = c1009190, %l1 = 00000000177bec6e
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000009190
!	Mem[0000000010081408] = 49d4a2d2, %l3 = 000000014b8aeaa7
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 0000000049d4a2d2
!	Starting 10 instruction Store Burst
!	%f0  = fdb1b977 e8e0918e, %l4 = ffffffffffffff55
!	Mem[0000000010081420] = 6528f8e29224fa1a
	add	%i2,0x020,%g1
	stda	%f0,[%g1+%l4]ASI_PST32_P ! Mem[0000000010081420] = 6528f8e2e8e0918e

p0_label_6:
!	%f22 = 602d1509 56a38f33, Mem[0000000030081410] = 9c912f53 6af4ea3d
	stda	%f22,[%i2+%o5]0x81	! Mem[0000000030081410] = 602d1509 56a38f33
!	%f18 = f985f7e1 545dc48f, Mem[00000000100c1410] = 669c866e 7b86a95a
	stda	%f18,[%i3+0x010]%asi	! Mem[00000000100c1410] = f985f7e1 545dc48f
!	Mem[00000000211c0000] = 4d05217a, %l6 = 5519c24857cf5305
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 0000004d000000ff
!	Mem[0000000010081410] = 808edd0b, %l5 = 0000000000000005
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 0000000b000000ff
!	%l5 = 000000000000000b, Mem[0000000010181414] = f37c68c3, %asi = 80
	stha	%l5,[%i6+0x014]%asi	! Mem[0000000010181414] = 000b68c3
!	Mem[0000000030141410] = acdd74b0, %l5 = 000000000000000b
	ldstuba	[%i5+%o5]0x81,%l5	! %l5 = 000000ac000000ff
!	%l7 = 000000000000000c, Mem[0000000010001408] = 00000005
	stba	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000c
!	%l1 = 0000000000009190, immed = fffff028, %y  = 00000001
	smul	%l1,-0xfd8,%l0		! %l0 = fffffffff6fdbe80, %y = ffffffff
!	%f4  = 384cb463 5b246f33, Mem[0000000010001408] = 0c000000 af000000
	stda	%f4 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 384cb463 5b246f33
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = c414c3cf, %l1 = 0000000000009190
	lduwa	[%i0+%g0]0x88,%l1	! %l1 = 00000000c414c3cf

p0_label_7:
!	Mem[0000000021800000] = 958541b9, %l6 = 000000000000004d
	ldsh	[%o3+%g0],%l6		! %l6 = ffffffffffff9585
!	Mem[0000000021800100] = 89f9d1b9, %l6 = ffffffffffff9585
	lduha	[%o3+0x100]%asi,%l6	! %l6 = 00000000000089f9
!	Mem[0000000030141410] = ffdd74b0, %l5 = 00000000000000ac
	ldsha	[%i5+%o5]0x81,%l5	! %l5 = ffffffffffffffdd
!	Mem[0000000010081408] = d2a2d449, %l6 = 00000000000089f9
	ldsba	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffffd2
!	Mem[0000000010041400] = 122cbcf1f96ffbb4, %l4 = ffffffffffffff55
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = 122cbcf1f96ffbb4
!	Mem[0000000010041438] = cf7378e023e59b95, %f24 = 9d9154dc e8a2b647
	ldda	[%i1+0x038]%asi,%f24	! %f24 = cf7378e0 23e59b95
!	Mem[00000000100c1400] = 4ceee28f, %l1 = 00000000c414c3cf
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 0000008f000000ff
!	Mem[0000000010101400] = 8a842b4b5e68c349, %f12 = 211421be 638525c6
	ldda	[%i4+%g0]0x80,%f12	! %f12 = 8a842b4b 5e68c349
!	Mem[0000000030141400] = a6ac48ff, %l7 = 000000000000000c
	lduwa	[%i5+%g0]0x89,%l7	! %l7 = 00000000a6ac48ff
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000008f, Mem[00000000201c0000] = cebc86d9, %asi = 80
	stba	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 8fbc86d9

p0_label_8:
!	%f10 = e9975724, Mem[0000000030081410] = 602d1509
	sta	%f10,[%i2+%o5]0x81	! Mem[0000000030081410] = e9975724
!	Mem[0000000010141410] = fffb737c, %l3 = 0000000049d4a2d2
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	%f0  = fdb1b977, Mem[0000000030001408] = ff66b895
	sta	%f0 ,[%i0+%o4]0x81	! Mem[0000000030001408] = fdb1b977
!	Mem[000000001008142c] = 5f0250a1, %l0 = f6fdbe80, %l0 = f6fdbe80
	add	%i2,0x2c,%g1
	casa	[%g1]0x80,%l0,%l0	! %l0 = 000000005f0250a1
!	Mem[00000000300c1410] = 05000000, %l7 = 00000000a6ac48ff
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 0000000005000000
!	Mem[0000000010001408] = 63b44c38, %l6 = ffffffffffffffd2
	swapa	[%i0+%o4]0x88,%l6	! %l6 = 0000000063b44c38
!	%f10 = e9975724 d5d4cb02, %l5 = ffffffffffffffdd
!	Mem[00000000300c1410] = a6ac48ffdd59af12
	add	%i3,0x010,%g1
	stda	%f10,[%g1+%l5]ASI_PST8_SL ! Mem[00000000300c1410] = 02acd4d5245997e9
!	%f16 = b3eeb920 b074ddac, %l4 = 122cbcf1f96ffbb4
!	Mem[0000000030041420] = a43558dae9b0323d
	add	%i1,0x020,%g1
	stda	%f16,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030041420] = a43574da20b932b3
!	%l4 = 122cbcf1f96ffbb4, Mem[0000000010141428] = 0a78d3ba
	sth	%l4,[%i5+0x028]		! Mem[0000000010141428] = fbb4d3ba
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 015a2374, %l1 = 000000000000008f
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = 00000000015a2374

p0_label_9:
!	Mem[0000000010101400] = 8a842b4b, %l2 = ffffffffffffbfed
	lduwa	[%i4+%g0]0x80,%l2	! %l2 = 000000008a842b4b
!	Mem[00000000300c1400] = 15015a8b25720dbd, %l4 = 122cbcf1f96ffbb4
	ldxa	[%i3+%g0]0x81,%l4	! %l4 = 15015a8b25720dbd
!	Mem[0000000010041408] = ecfe91af, %f25 = 23e59b95
	lda	[%i1+%o4]0x80,%f25	! %f25 = ecfe91af
!	Mem[0000000020800000] = 3ff7348e, %l3 = 00000000000000ff
	ldsha	[%o1+0x000]%asi,%l3	! %l3 = 0000000000003ff7
!	Mem[00000000300c1400] = 15015a8b, %l0 = 000000005f0250a1
	lduha	[%i3+%g0]0x81,%l0	! %l0 = 0000000000001501
!	%l5 = ffffffffffffffdd, %l6 = 0000000063b44c38, %l2  = 000000008a842b4b
	mulx	%l5,%l6,%l2		! %l2 = fffffff25e599458
!	Mem[0000000030181410] = f6efbfed, %l7 = 0000000005000000
	ldsba	[%i6+%o5]0x89,%l7	! %l7 = ffffffffffffffed
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030141400] = ff48aca6 7944e74f 017feea4 bdf25794
!	Mem[0000000030141410] = ffdd74b0 20b9eeb3 93113a5b 7839e277
!	Mem[0000000030141420] = bfb9b1e8 aa3dc13d 7fda7d6a fad84a59
!	Mem[0000000030141430] = 0fc0385b ae103944 c977175a 37af2871
	ldda	[%i5]ASI_BLK_S,%f0	! Block Load from 0000000030141400
!	Mem[0000000010001410] = b99d3b609a3693b3, %l1 = 00000000015a2374
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = b99d3b609a3693b3
!	Starting 10 instruction Store Burst
!	%l6 = 0000000063b44c38, Mem[0000000010181400] = 0553cf57
	stba	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 3853cf57

p0_label_10:
!	Mem[0000000030101410] = f40ec84f, %l7 = ffffffffffffffed
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 000000f4000000ff
!	%l4 = 25720dbd, %l5 = ffffffdd, Mem[00000000100c1400] = ffe2ee4c 543b7014
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 25720dbd ffffffdd
!	%f26 = 00555a56 f6efbfed, Mem[0000000030081400] = 97e45698 fb4c0da6
	stda	%f26,[%i2+%g0]0x81	! Mem[0000000030081400] = 00555a56 f6efbfed
!	Mem[0000000010081400] = 909100c1, %l4 = 15015a8b25720dbd
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 00000000909100c1
!	%l4 = 00000000909100c1, Mem[0000000030181408] = 99585ef2
	stha	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 995800c1
!	Mem[0000000030181400] = 05000000, %l6 = 0000000063b44c38
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 0000000005000000
!	%l5 = ffffffffffffffdd, Mem[0000000010001404] = 389dc6bd
	sth	%l5,[%i0+0x004]		! Mem[0000000010001404] = ffddc6bd
!	%l2 = fffffff25e599458, Mem[0000000010181408] = 7bc5bd08a356b93d
	stxa	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = fffffff25e599458
	membar	#Sync			! Added by membar checker (2)
!	%l0 = 0000000000001501, Mem[0000000030141408] = 017feea4
	stwa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00001501
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = f2ffffff, %l3 = 0000000000003ff7
	ldsba	[%i6+%o4]0x88,%l3	! %l3 = ffffffffffffffff

p0_label_11:
!	Mem[0000000030001408] = 77b9b1fd, %l3 = ffffffffffffffff
	ldsba	[%i0+%o4]0x89,%l3	! %l3 = fffffffffffffffd
!	Mem[0000000010001400] = bdc6ddffc414c3cf, %l0 = 0000000000001501
	ldxa	[%i0+%g0]0x88,%l0	! %l0 = bdc6ddffc414c3cf
!	Mem[0000000010101418] = ad02b0fb209ca183, %f18 = f985f7e1 545dc48f
	ldda	[%i4+0x018]%asi,%f18	! %f18 = ad02b0fb 209ca183
!	Mem[0000000010181410] = 46c088ff, %l4 = 00000000909100c1
	lduha	[%i6+%o5]0x88,%l4	! %l4 = 00000000000088ff
!	Mem[00000000100c1408] = e58fcdda, %l2 = fffffff25e599458
	ldswa	[%i3+%o4]0x80,%l2	! %l2 = ffffffffe58fcdda
!	Mem[0000000030181400] = 384cb463, %l6 = 0000000005000000
	ldsba	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000063
!	Mem[00000000100c1410] = f985f7e1, %l1 = b99d3b609a3693b3
	ldswa	[%i3+%o5]0x80,%l1	! %l1 = fffffffff985f7e1
!	Mem[0000000030181408] = c1005899, %l6 = 0000000000000063
	lduha	[%i6+%o4]0x81,%l6	! %l6 = 000000000000c100
!	Code Fragment 3
p0_fragment_1:
!	%l0 = bdc6ddffc414c3cf
	setx	0x3702b89036e2993d,%g7,%l0 ! %l0 = 3702b89036e2993d
!	%l1 = fffffffff985f7e1
	setx	0x604735afc6098c63,%g7,%l1 ! %l1 = 604735afc6098c63
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3702b89036e2993d
	setx	0xbcf6301824657acc,%g7,%l0 ! %l0 = bcf6301824657acc
!	%l1 = 604735afc6098c63
	setx	0x8ed97a6807e9d593,%g7,%l1 ! %l1 = 8ed97a6807e9d593
!	Starting 10 instruction Store Burst
!	Mem[0000000010141431] = a2e3de0f, %l3 = fffffffffffffffd
	ldstuba	[%i5+0x031]%asi,%l3	! %l3 = 000000e3000000ff

p0_label_12:
!	Mem[0000000010001410] = 603b9db9, %l1 = 8ed97a6807e9d593
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 00000000603b9db9
!	Mem[0000000010041408] = af91feec, %l5 = ffffffffffffffdd
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 00000000af91feec
!	Mem[00000000100c1400] = 25720dbd, %l4 = 00000000000088ff
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 0000000025720dbd
!	Mem[0000000010041400] = 122cbcf1, %l3 = 00000000000000e3
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 00000012000000ff
!	%f12 = 0fc0385b ae103944, Mem[0000000010001430] = 2202d061 fa798525
	std	%f12,[%i0+0x030]	! Mem[0000000010001430] = 0fc0385b ae103944
!	Mem[0000000030141410] = b074ddff, %l0 = bcf6301824657acc
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	%l2 = ffffffffe58fcdda, Mem[0000000030101400] = 1636cb8b13d7981b
	stxa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffffe58fcdda
!	%l7 = 00000000000000f4, Mem[0000000030041400] = 1d9760f5
	stha	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00f460f5
!	%l2 = ffffffffe58fcdda, Mem[0000000030041410] = afbbe7fa
	stba	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = dabbe7fa
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = fdb1b977, %l2 = ffffffffe58fcdda
	ldsba	[%i0+%o4]0x81,%l2	! %l2 = fffffffffffffffd

p0_label_13:
!	Mem[0000000020800040] = 66bbd1fd, %l4 = 0000000025720dbd
	ldub	[%o1+0x041],%l4		! %l4 = 00000000000000bb
!	Mem[0000000030141408] = 9457f2bd01150000, %l5 = 00000000af91feec
	ldxa	[%i5+%o4]0x89,%l5	! %l5 = 9457f2bd01150000
!	Mem[0000000010181408] = fffffff25e599458, %f8  = bfb9b1e8 aa3dc13d
	ldda	[%i6+%o4]0x80,%f8 	! %f8  = fffffff2 5e599458
!	Mem[0000000010081400] = 25720dbd, %l6 = 000000000000c100
	lduba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000025
!	Mem[0000000010141410] = fffb737c9bd905e8, %l3 = 0000000000000012
	ldxa	[%i5+%o5]0x80,%l3	! %l3 = fffb737c9bd905e8
!	Mem[0000000010141400] = 015a2374, %l1 = 00000000603b9db9
	lduwa	[%i5+%g0]0x80,%l1	! %l1 = 00000000015a2374
!	Mem[0000000010081408] = d2a2d449 24d1c567, %l0 = 000000ff, %l1 = 015a2374
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000d2a2d449 0000000024d1c567
!	Mem[00000000211c0000] = ff05217a, %l4 = 00000000000000bb
	ldsba	[%o2+0x001]%asi,%l4	! %l4 = 0000000000000005
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 00000000d2a2d449
	setx	0x983554905dbc9e91,%g7,%l0 ! %l0 = 983554905dbc9e91
!	%l1 = 0000000024d1c567
	setx	0xda6a785febb44073,%g7,%l1 ! %l1 = da6a785febb44073
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 983554905dbc9e91
	setx	0x03dd039782a2b537,%g7,%l0 ! %l0 = 03dd039782a2b537
!	%l1 = da6a785febb44073
	setx	0xa008191f8fc1c4d0,%g7,%l1 ! %l1 = a008191f8fc1c4d0
!	Starting 10 instruction Store Burst
!	%f10 = 7fda7d6a fad84a59, %l7 = 00000000000000f4
!	Mem[0000000010041408] = ddfffffff53cf11b
	add	%i1,0x008,%g1
	stda	%f10,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010041408] = ddfffffff53cf11b

p0_label_14:
!	%l7 = 00000000000000f4, Mem[0000000010041410] = 468045da
	stwa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000f4
!	%l2 = fffffffd, %l3 = 9bd905e8, Mem[0000000030001400] = c4813d84 6eec7b17
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = fffffffd 9bd905e8
!	Mem[0000000010141410] = fffb737c, %l7 = 00000000000000f4
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000100c1408] = dacd8fe5, %l5 = 9457f2bd01150000
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 00000000dacd8fe5
!	Mem[0000000010181400] = 3853cf57, %l1 = 8fc1c4d0, %l5 = dacd8fe5
	casa	[%i6]0x80,%l1,%l5	! %l5 = 000000003853cf57
!	%l0 = 82a2b537, %l1 = 8fc1c4d0, Mem[0000000010141410] = 7c73fbff e805d99b
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 82a2b537 8fc1c4d0
!	%f22 = 602d1509 56a38f33, %l3 = fffb737c9bd905e8
!	Mem[0000000010041410] = 000000f4d089bfd2
	add	%i1,0x010,%g1
	stda	%f22,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010041410] = 00000056d0152d60
!	%l6 = 0000000000000025, Mem[0000000021800140] = e2128361
	sth	%l6,[%o3+0x140]		! Mem[0000000021800140] = 00258361
!	%l1 = a008191f8fc1c4d0, Mem[0000000030141400] = ff48aca67944e74f
	stxa	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = a008191f8fc1c4d0
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 8fc45d54 e1f785f9, %l6 = 00000025, %l7 = 000000ff
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 00000000e1f785f9 000000008fc45d54

p0_label_15:
!	Mem[0000000010141418] = 24ac1d59, %f7  = 7839e277
	ld	[%i5+0x018],%f7 	! %f7 = 24ac1d59
!	Mem[0000000010001400] = c414c3cf, %l0 = 03dd039782a2b537
	ldsba	[%i0+%g0]0x88,%l0	! %l0 = ffffffffffffffcf
!	Mem[0000000010141400] = 015a2374, %l7 = 000000008fc45d54
	lduba	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000001
!	%l4 = 0000000000000005, imm = 0000000000000a1c, %l1 = a008191f8fc1c4d0
	or	%l4,0xa1c,%l1		! %l1 = 0000000000000a1d
!	Mem[0000000030101400] = e58fcdda, %l6 = 00000000e1f785f9
	lduha	[%i4+%g0]0x89,%l6	! %l6 = 000000000000cdda
!	Mem[0000000010041410] = 56000000, %l5 = 000000003853cf57
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 15015a8b 25720dbd ff724a25 4cabee7b
!	Mem[00000000300c1410] = 02acd4d5 245997e9 fa29ab85 c3956639
!	Mem[00000000300c1420] = 79f03651 6769f01f b638dc95 7f9ac159
!	Mem[00000000300c1430] = e03e18a2 9ed0d98d d89af845 b706eeb7
	ldda	[%i3]ASI_BLK_AIUSL,%f0	! Block Load from 00000000300c1400
!	Mem[00000000300c1408] = ff724a254cabee7b, %f26 = 00555a56 f6efbfed
	ldda	[%i3+%o4]0x81,%f26	! %f26 = ff724a25 4cabee7b
!	Mem[0000000030181410] = 00555a56 f6efbfed, %l4 = 00000005, %l5 = 00000000
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 00000000f6efbfed 0000000000555a56
!	Starting 10 instruction Store Burst
!	%f31 = 671a267b, Mem[0000000030101410] = ff0ec84f
	sta	%f31,[%i4+%o5]0x81	! Mem[0000000030101410] = 671a267b

p0_label_16:
!	Mem[0000000030141410] = ffdd74b0, %l7 = 0000000000000001
	ldstuba	[%i5+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	%f16 = b3eeb920, Mem[00000000100c1410] = f985f7e1
	sta	%f16,[%i3+%o5]0x80	! Mem[00000000100c1410] = b3eeb920
!	%l1 = 0000000000000a1d, Mem[0000000010141400] = 74235a01
	stha	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 74230a1d
!	%l3 = fffb737c9bd905e8, Mem[0000000010001408] = ffffffd2
	stba	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffe8
!	Mem[0000000010041435] = 878769a8, %l6 = 000000000000cdda
	ldstub	[%i1+0x035],%l6		! %l6 = 00000087000000ff
!	Mem[0000000030001408] = fdb1b977, %l6 = 0000000000000087
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 000000fd000000ff
!	%f29 = 57b8f365, Mem[0000000010041400] = f1bc2cff
	sta	%f29,[%i1+%g0]0x88	! Mem[0000000010041400] = 57b8f365
!	%f22 = 602d1509 56a38f33, Mem[0000000010041410] = 00000056 d0152d60
	std	%f22,[%i1+%o5]	! Mem[0000000010041410] = 602d1509 56a38f33
!	Mem[0000000030081400] = 565a5500, %l7 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 8b5a0115, %f25 = ecfe91af
	lda	[%i3+%g0]0x89,%f25	! %f25 = 8b5a0115

p0_label_17:
!	Mem[0000000030041400] = f560f400, %l6 = 00000000000000fd
	ldsha	[%i1+%g0]0x89,%l6	! %l6 = fffffffffffff400
!	Mem[0000000010001408] = ffffffe8, %l4 = 00000000f6efbfed
	ldsha	[%i0+%o4]0x88,%l4	! %l4 = ffffffffffffffe8
!	Mem[00000000100c1438] = 953a7c04, %l6 = fffffffffffff400
	ldsh	[%i3+0x038],%l6		! %l6 = ffffffffffff953a
!	Mem[0000000030081400] = edbfeff6565a55ff, %f24 = cf7378e0 8b5a0115
	ldda	[%i2+%g0]0x89,%f24	! %f24 = edbfeff6 565a55ff
!	Mem[0000000030141410] = b074ddff, %l3 = fffb737c9bd905e8
	ldswa	[%i5+%o5]0x89,%l3	! %l3 = ffffffffb074ddff
!	Mem[0000000030101408] = bc897bb5, %l3 = ffffffffb074ddff
	lduba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000bc
!	Mem[0000000010101400] = 8a842b4b5e68c349, %l6 = ffffffffffff953a
	ldxa	[%i4+%g0]0x80,%l6	! %l6 = 8a842b4b5e68c349
!	Mem[00000000300c1400] = 15015a8b, %l6 = 8a842b4b5e68c349
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = 0000000015015a8b
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010141400] = 1d0a2374 5764ab21 ff201f2f 062283d9
!	Mem[0000000010141410] = 37b5a282 d0c4c18f 24ac1d59 70c6a1ee
!	Mem[0000000010141420] = 038c7157 d81e8e7f fbb4d3ba e31fe211
!	Mem[0000000010141430] = a2ffde0f 88e7b230 67089990 000000cd
	ldda	[%i5]ASI_BLK_AIUP,%f16	! Block Load from 0000000010141400
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010001408] = e8ffffff
	stha	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000ffff

p0_label_18:
!	Mem[0000000030101410] = 7b261a67, %l4 = ffffffffffffffe8
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 00000067000000ff
!	Mem[0000000030081410] = e9975724, %l1 = 0000000000000a1d
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 00000000e9975724
!	Code Fragment 3
p0_fragment_3:
!	%l0 = ffffffffffffffcf
	setx	0x3640024fed22552d,%g7,%l0 ! %l0 = 3640024fed22552d
!	%l1 = 00000000e9975724
	setx	0xfc4f9bc82782a46e,%g7,%l1 ! %l1 = fc4f9bc82782a46e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3640024fed22552d
	setx	0x87d309c7aac79868,%g7,%l0 ! %l0 = 87d309c7aac79868
!	%l1 = fc4f9bc82782a46e
	setx	0x0333269ff71a3f5e,%g7,%l1 ! %l1 = 0333269ff71a3f5e
!	Mem[0000000030041410] = fae7bbda, %l2 = fffffffffffffffd
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 00000000fae7bbda
!	%l5 = 0000000000555a56, Mem[0000000010001410] = 93d5e907
	stba	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 56d5e907
!	Mem[0000000010141400] = 1d0a2374, %l5 = 0000000000555a56
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 0000001d000000ff
!	Mem[0000000010181438] = 49abb0b56cd979ba, %l4 = 0000000000000067, %l7 = 0000000000000000
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 49abb0b56cd979ba
!	%l3 = 00000000000000bc, Mem[0000000010001400] = cfc314c4ffddc6bd
	stxa	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000000000bc
!	Mem[0000000010181410] = 46c088ff, %l6 = 0000000015015a8b
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = b074ddff, %f6  = 396695c3
	lda	[%i5+%o5]0x89,%f6 	! %f6 = b074ddff

p0_label_19:
!	Mem[0000000010141400] = ff0a23745764ab21, %f2  = 7beeab4c 254a72ff
	ldda	[%i5+0x000]%asi,%f2 	! %f2  = ff0a2374 5764ab21
!	Mem[00000000100c1410] = 20b9eeb3, %l1 = 0333269ff71a3f5e
	ldsha	[%i3+%o5]0x88,%l1	! %l1 = ffffffffffffeeb3
!	Mem[0000000010001408] = 0000ffff, %l1 = ffffffffffffeeb3
	lduha	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 00000000 000000bc, %l0 = aac79868, %l1 = 00000000
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000 00000000000000bc
!	Mem[0000000030081410] = 1d0a0000, %f4  = e9975924
	lda	[%i2+%o5]0x89,%f4 	! %f4 = 1d0a0000
!	Mem[0000000030181400] = 48934bcd384cb463, %l2 = 00000000fae7bbda
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = 48934bcd384cb463
!	Mem[00000000100c1410] = b3eeb920, %l2 = 48934bcd384cb463
	lduw	[%i3+%o5],%l2		! %l2 = 00000000b3eeb920
!	Mem[0000000010101408] = 3f770fac, %l3 = 00000000000000bc
	lduha	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000fac
!	Mem[000000001000140c] = 5b246f33, %f3  = 5764ab21
	lda	[%i0+0x00c]%asi,%f3 	! %f3 = 5b246f33
!	Starting 10 instruction Store Burst
!	Mem[0000000010141438] = 67089990, %l5 = 000000000000001d
	ldstub	[%i5+0x038],%l5		! %l5 = 00000067000000ff

p0_label_20:
!	Mem[0000000010101400] = 4b2b848a, %l2 = 00000000b3eeb920
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 000000004b2b848a
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 0000000000000000
	setx	0xf1f2b8dfab574c25,%g7,%l0 ! %l0 = f1f2b8dfab574c25
!	%l1 = 00000000000000bc
	setx	0xeea4d1efdaacb2f0,%g7,%l1 ! %l1 = eea4d1efdaacb2f0
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f1f2b8dfab574c25
	setx	0x0ca18e2f8935584b,%g7,%l0 ! %l0 = 0ca18e2f8935584b
!	%l1 = eea4d1efdaacb2f0
	setx	0x4cd735282a4da6b0,%g7,%l1 ! %l1 = 4cd735282a4da6b0
!	%l2 = 000000004b2b848a, Mem[0000000010181400] = 5519c24857cf5338
	stxa	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000004b2b848a
!	%f12 = 8dd9d09e a2183ee0, Mem[0000000010081410] = ffdd8e80 346c516a
	stda	%f12,[%i2+%o5]0x80	! Mem[0000000010081410] = 8dd9d09e a2183ee0
!	Mem[0000000030081408] = 5fc38d20, %l1 = 4cd735282a4da6b0
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 0000005f000000ff
!	%l6 = 00000000000000ff, Mem[000000001008142e] = 5f0250a1, %asi = 80
	stba	%l6,[%i2+0x02e]%asi	! Mem[000000001008142c] = 5f02ffa1
!	%l7 = 49abb0b56cd979ba, Mem[00000000300c1408] = 254a72ff
	stba	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 254a72ba
!	%l7 = 49abb0b56cd979ba, Mem[0000000020800001] = 3ff7348e
	stb	%l7,[%o1+0x001]		! Mem[0000000020800000] = 3fba348e
!	%f11 = 95dc38b6, %f5  = d5d4ac02
	fsqrts	%f11,%f5 		! %f5  = 7fffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 4d2406d9, %l7 = 49abb0b56cd979ba
	ldsw	[%i1+0x030],%l7		! %l7 = 000000004d2406d9

p0_label_21:
!	Mem[0000000010181400] = 8a842b4b00000000, %l1 = 000000000000005f
	ldxa	[%i6+%g0]0x80,%l1	! %l1 = 8a842b4b00000000
!	Mem[00000000300c1408] = ba724a25, %l7 = 000000004d2406d9
	ldsba	[%i3+%o4]0x81,%l7	! %l7 = ffffffffffffffba
!	Mem[00000000300c1408] = ba724a25 4cabee7b, %l2 = 4b2b848a, %l3 = 00000fac
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 00000000ba724a25 000000004cabee7b
!	Mem[0000000010081408] = d2a2d449, %l7 = ffffffffffffffba
	lduha	[%i2+%o4]0x80,%l7	! %l7 = 000000000000d2a2
!	Mem[00000000201c0000] = 8fbc86d9, %l1 = 8a842b4b00000000
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000008fbc
!	Mem[0000000010141404] = 5764ab21, %l5 = 0000000000000067
	ldsba	[%i5+0x005]%asi,%l5	! %l5 = 0000000000000064
!	Mem[0000000030041410] = fffffffd, %f20 = 37b5a282
	lda	[%i1+%o5]0x89,%f20	! %f20 = fffffffd
!	Mem[00000000218001c0] = 3c33a92c, %l2 = 00000000ba724a25
	ldub	[%o3+0x1c0],%l2		! %l2 = 000000000000003c
!	Mem[0000000010041438] = cf7378e023e59b95, %l7 = 000000000000d2a2
	ldxa	[%i1+0x038]%asi,%l7	! %l7 = cf7378e023e59b95
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (4)
!	%l5 = 0000000000000064, Mem[0000000010141414] = d0c4c18f, %asi = 80
	stwa	%l5,[%i5+0x014]%asi	! Mem[0000000010141414] = 00000064

p0_label_22:
!	%f28 = a2ffde0f 88e7b230, Mem[0000000030081410] = 1d0a0000 338fa356
	stda	%f28,[%i2+%o5]0x89	! Mem[0000000030081410] = a2ffde0f 88e7b230
!	%l7 = cf7378e023e59b95, Mem[0000000010101410] = fe3a0e9a
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 9b950e9a
!	Mem[0000000010181418] = 97024892, %l6 = 000000ff, %l5 = 00000064
	add	%i6,0x18,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 0000000097024892
!	%l5 = 0000000097024892, Mem[0000000020800040] = 66bbd1fd
	stb	%l5,[%o1+0x040]		! Mem[0000000020800040] = 92bbd1fd
!	%f22 = 24ac1d59 70c6a1ee, %l3 = 000000004cabee7b
!	Mem[00000000100c1430] = b99981ab369a945b
	add	%i3,0x030,%g1
	stda	%f22,[%g1+%l3]ASI_PST16_P ! Mem[00000000100c1430] = 24ac81ab70c6a1ee
!	%l2 = 000000000000003c, Mem[0000000030181408] = c10058998260e8b9
	stxa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000000000003c
!	%l3 = 000000004cabee7b, Mem[0000000010141408] = ff201f2f
	stba	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 7b201f2f
!	Mem[0000000030081408] = ffc38d20, %l6 = 00000000000000ff
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 00000000ffc38d20
!	Mem[0000000010181400] = 4b2b848a, %l0 = 0ca18e2f8935584b
	ldstuba	[%i6+%g0]0x88,%l0	! %l0 = 0000008a000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = 2bb57afb, %l6 = 00000000ffc38d20
	lduba	[%i4+0x03a]%asi,%l6	! %l6 = 000000000000007a

p0_label_23:
!	Mem[0000000010041408] = ffffffdd, %l6 = 000000000000007a
	ldsha	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffffffdd
!	Mem[0000000030181408] = 3c00000000000000, %l0 = 000000000000008a
	ldxa	[%i6+%o4]0x89,%l0	! %l0 = 3c00000000000000
!	Mem[0000000010041400] = 57b8f365, %l4 = 0000000000000067
	ldswa	[%i1+%g0]0x88,%l4	! %l4 = 0000000057b8f365
!	Mem[00000000100c1410] = 20b9eeb3, %l7 = cf7378e023e59b95
	ldswa	[%i3+%o5]0x88,%l7	! %l7 = 0000000020b9eeb3
!	Mem[00000000300c1408] = ba724a25, %l7 = 0000000020b9eeb3
	lduwa	[%i3+%o4]0x81,%l7	! %l7 = 00000000ba724a25
!	Mem[0000000030041400] = f560f400, %f17 = 5764ab21
	lda	[%i1+%g0]0x89,%f17	! %f17 = f560f400
!	Mem[00000000100c1400] = 000088ff ffffffdd, %l0 = 00000000, %l1 = 00008fbc
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 00000000000088ff 00000000ffffffdd
!	Mem[0000000010141408] = d9832206 2f1f207b, %l0 = 000088ff, %l1 = ffffffdd
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 000000002f1f207b 00000000d9832206
!	Mem[0000000010141410] = 82a2b537, %l4 = 0000000057b8f365
	ldsha	[%i5+%o5]0x88,%l4	! %l4 = ffffffffffffb537
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 00000000, %l6 = ffffffffffffffdd
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_24:
!	Mem[0000000010141410] = 37b5a282, %l5 = 0000000097024892
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 0000000037b5a282
!	Mem[0000000010081420] = 6528f8e2e8e0918e, %l2 = 000000000000003c, %l1 = 00000000d9832206
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 6528f8e2e8e0918e
!	Mem[0000000030181400] = 384cb463, %l0 = 000000002f1f207b
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 00000063000000ff
!	%l1 = 6528f8e2e8e0918e, Mem[00000000300c1410] = 02acd4d5
	stba	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 8eacd4d5
!	%l7 = 00000000ba724a25, Mem[0000000010041410] = 602d150956a38f33
	stxa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000ba724a25
!	Mem[0000000030081410] = 88e7b230, %l3 = 000000004cabee7b
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 00000030000000ff
!	%l2 = 000000000000003c, Mem[0000000010181410] = ff88c046
	stha	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 003cc046
!	%l2 = 000000000000003c, Mem[000000001004142c] = e1404b8d
	stw	%l2,[%i1+0x02c]		! Mem[000000001004142c] = 0000003c
!	%l2 = 0000003c, %l3 = 00000030, Mem[0000000030001410] = 2fa6eae7 9a82d04d
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000003c 00000030
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l3 = 0000000000000030
	lduwa	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000

p0_label_25:
!	Mem[0000000010081410] = 8dd9d09e, %f5  = 7fffffff
	lda	[%i2+%o5]0x80,%f5 	! %f5 = 8dd9d09e
!	Mem[0000000010001400] = 00000000, %l7 = 00000000ba724a25
	ldsba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = ac0f773f, %l3 = 0000000000000000
	ldsh	[%i4+%o4],%l3		! %l3 = ffffffffffffac0f
!	Mem[0000000010181410] = c3680b0046c03c00, %f2  = ff0a2374 5b246f33
	ldda	[%i6+%o5]0x88,%f2 	! %f2  = c3680b00 46c03c00
!	Mem[0000000010181408] = 5894595ef2ffffff, %l4 = ffffffffffffb537
	ldxa	[%i6+%o4]0x88,%l4	! %l4 = 5894595ef2ffffff
!	Mem[0000000030181410] = edbfeff6565a5500, %l4 = 5894595ef2ffffff
	ldxa	[%i6+%o5]0x81,%l4	! %l4 = edbfeff6565a5500
!	Mem[0000000010181410] = 46c03c00, %l1 = 6528f8e2e8e0918e
	ldswa	[%i6+%o5]0x88,%l1	! %l1 = 0000000046c03c00
!	Mem[0000000010141400] = 74230aff, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l7	! %l7 = 0000000074230aff
!	Mem[0000000030141410] = ffdd74b0, %l3 = ffffffffffffac0f
	lduba	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000074230aff, Mem[0000000010041408] = ddfffffff53cf11b
	stxa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000074230aff

p0_label_26:
!	Mem[00000000201c0001] = 8fbc86d9, %l1 = 0000000046c03c00
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 000000bc000000ff
!	%l2 = 000000000000003c, Mem[0000000010001408] = ffff0000
	stwa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000003c
!	%l4 = 565a5500, %l5 = 37b5a282, Mem[00000000100c1410] = b3eeb920 545dc48f
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 565a5500 37b5a282
!	Mem[0000000030001400] = fdffffff, %l2 = 000000000000003c
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000030001400] = fffffffd
	stwa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	%f2  = c3680b00 46c03c00, %l2 = 00000000000000ff
!	Mem[0000000030041420] = a43574da20b932b3
	add	%i1,0x020,%g1
	stda	%f2,[%g1+%l2]ASI_PST16_S ! Mem[0000000030041420] = c3680b0046c03c00
!	Mem[0000000030081408] = ff000000, %l3 = 00000000000000ff
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 00000000ff000000
!	%f26 = fbb4d3ba e31fe211, Mem[0000000030101410] = 7b261aff 0eb16b23
	stda	%f26,[%i4+%o5]0x89	! Mem[0000000030101410] = fbb4d3ba e31fe211
!	%f26 = fbb4d3ba e31fe211, Mem[0000000010101408] = ac0f773f 741c1163
	stda	%f26,[%i4+0x008]%asi	! Mem[0000000010101408] = fbb4d3ba e31fe211
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 3fba348e, %l6 = 0000000000000000
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = 0000000000003fba

p0_label_27:
!	Mem[00000000100c1400] = 000088ffffffffdd, %l3 = 00000000ff000000
	ldxa	[%i3+%g0]0x80,%l3	! %l3 = 000088ffffffffdd
!	Mem[0000000010101400] = 49c3685eb3eeb920, %l0 = 0000000000000063
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = 49c3685eb3eeb920
!	Mem[0000000030041410] = fdffffff, %f21 = d0c4c18f
	lda	[%i1+%o5]0x81,%f21	! %f21 = fdffffff
!	Mem[0000000010081400] = bd0d7225, %l1 = 00000000000000bc
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000007225
!	Mem[0000000030181400] = 48934bcd384cb4ff, %f18 = ff201f2f 062283d9
	ldda	[%i6+%g0]0x89,%f18	! %f18 = 48934bcd 384cb4ff
!	Mem[0000000030101400] = ffffffff e58fcdda, %l0 = b3eeb920, %l1 = 00007225
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 00000000e58fcdda 00000000ffffffff
!	Mem[00000000211c0000] = ff05217a, %l4 = edbfeff6565a5500
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffff05
!	Mem[0000000030101410] = 11e21fe3, %l0 = 00000000e58fcdda
	lduba	[%i4+%o5]0x81,%l0	! %l0 = 0000000000000011
!	Mem[00000000211c0000] = ff05217a, %l5 = 0000000037b5a282
	ldub	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f14 = b7ee06b7 45f89ad8, %l1 = 00000000ffffffff
!	Mem[0000000010141410] = 9702489200000064
	add	%i5,0x010,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010141410] = d89af845b706eeb7

p0_label_28:
!	%f8  = 1ff06967 5136f079, Mem[0000000010181430] = 2c43dee0 7c4205c6
	std	%f8 ,[%i6+0x030]	! Mem[0000000010181430] = 1ff06967 5136f079
!	Mem[0000000030041400] = 00f460f5, %l1 = 00000000ffffffff
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 0000000000f460f5
!	Mem[0000000030001410] = 3c000000, %l2 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l2	! %l2 = 000000003c000000
!	%l0 = 00000011, %l1 = 00f460f5, Mem[0000000030081410] = 88e7b2ff a2ffde0f
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000011 00f460f5
!	Mem[00000000100c1400] = ff880000, %l7 = 0000000074230aff
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%f16 = 1d0a2374 f560f400 48934bcd 384cb4ff
!	%f20 = fffffffd fdffffff 24ac1d59 70c6a1ee
!	%f24 = 038c7157 d81e8e7f fbb4d3ba e31fe211
!	%f28 = a2ffde0f 88e7b230 67089990 000000cd
	stda	%f16,[%i5]ASI_BLK_P	! Block Store to 0000000010141400
!	%f4  = 1d0a0000 8dd9d09e, Mem[0000000010101410] = 9b950e9a 19b1d96a
	stda	%f4 ,[%i4+0x010]%asi	! Mem[0000000010101410] = 1d0a0000 8dd9d09e
!	%f4  = 1d0a0000 8dd9d09e, %l4 = ffffffffffffff05
!	Mem[00000000300c1428] = b638dc957f9ac159
	add	%i3,0x028,%g1
	stda	%f4,[%g1+%l4]ASI_PST16_SL ! Mem[00000000300c1428] = 9ed0dc950000c159
!	Mem[0000000010001419] = f61c27d3, %l1 = 0000000000f460f5
	ldstub	[%i0+0x019],%l1		! %l1 = 0000001c000000ff
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000011, %l2 = 000000003c000000, %l3 = 000088ffffffffdd
	xor	%l0,%l2,%l3		! %l3 = 000000003c000011

p0_label_29:
!	Mem[0000000030141400] = 1f1908a0, %l3 = 000000003c000011
	ldswa	[%i5+%g0]0x89,%l3	! %l3 = 000000001f1908a0
!	Mem[0000000010181434] = 5136f079, %l3 = 000000001f1908a0
	ldsha	[%i6+0x036]%asi,%l3	! %l3 = fffffffffffff079
!	Mem[0000000010081418] = 6a0e5802, %l7 = 0000000000000000
	ldub	[%i2+0x01b],%l7		! %l7 = 0000000000000002
!	Mem[0000000010001424] = 34c014ef, %l5 = 00000000000000ff
	ldsw	[%i0+0x024],%l5		! %l5 = 0000000034c014ef
!	Mem[0000000030181410] = f6efbfed, %l7 = 0000000000000002
	lduba	[%i6+%o5]0x89,%l7	! %l7 = 00000000000000ed
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 0000000000000011
	setx	0x3af4466fbd682e96,%g7,%l0 ! %l0 = 3af4466fbd682e96
!	%l1 = 000000000000001c
	setx	0x4b1ab28fd43897ba,%g7,%l1 ! %l1 = 4b1ab28fd43897ba
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3af4466fbd682e96
	setx	0xc67d73f0592e481e,%g7,%l0 ! %l0 = c67d73f0592e481e
!	%l1 = 4b1ab28fd43897ba
	setx	0x1cd5026fe9ab1d26,%g7,%l1 ! %l1 = 1cd5026fe9ab1d26
!	Mem[000000001010140c] = e31fe211, %f9  = 5136f079
	lda	[%i4+0x00c]%asi,%f9 	! %f9 = e31fe211
!	%l0 = c67d73f0592e481e, imm = 000000000000011a, %l2 = 000000003c000000
	or	%l0,0x11a,%l2		! %l2 = c67d73f0592e491e
!	Mem[0000000010181434] = 5136f079, %l1 = 1cd5026fe9ab1d26
	ldsha	[%i6+0x034]%asi,%l1	! %l1 = 0000000000005136
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffff05, Mem[0000000010141434] = 88e7b230
	sth	%l4,[%i5+0x034]		! Mem[0000000010141434] = ff05b230

p0_label_30:
!	Mem[0000000030001410] = ff000000, %l0 = c67d73f0592e481e
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030101400] = dacd8fe5, %l2 = c67d73f0592e491e
	swapa	[%i4+%g0]0x81,%l2	! %l2 = 00000000dacd8fe5
!	Mem[0000000010001408] = 0000003c, %l3 = fffffffffffff079
	swapa	[%i0+%o4]0x88,%l3	! %l3 = 000000000000003c
!	%f10 = 59c19a7f 95dc38b6, Mem[0000000010101400] = 20b9eeb3 5e68c349
	stda	%f10,[%i4+0x000]%asi	! Mem[0000000010101400] = 59c19a7f 95dc38b6
!	Mem[0000000010081439] = 54a2cedb, %l5 = 0000000034c014ef
	ldstuba	[%i2+0x039]%asi,%l5	! %l5 = 000000a2000000ff
!	Mem[0000000020800000] = 3fba348e, %l7 = 00000000000000ed
	ldstuba	[%o1+0x000]%asi,%l7	! %l7 = 0000003f000000ff
!	%l2 = dacd8fe5, %l3 = 0000003c, Mem[00000000300c1400] = 8b5a0115 bd0d7225
	stda	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = dacd8fe5 0000003c
!	%l4 = ffffffffffffff05, Mem[0000000010081410] = 8dd9d09e
	stwa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffff05
!	Mem[0000000030181408] = 000000ff, %l2 = 00000000dacd8fe5
	swapa	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 11e21fe3 bad3b4fb, %l4 = ffffff05, %l5 = 000000a2
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 0000000011e21fe3 00000000bad3b4fb

p0_label_31:
!	Mem[0000000010181410] = 003cc046, %l2 = 00000000000000ff
	lduwa	[%i6+%o5]0x80,%l2	! %l2 = 00000000003cc046
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010141400] = 1d0a2374, %f20 = fffffffd
	lda	[%i5+%g0]0x80,%f20	! %f20 = 1d0a2374
!	Mem[0000000010081410] = e03e18a205ffffff, %l4 = 0000000011e21fe3
	ldxa	[%i2+%o5]0x88,%l4	! %l4 = e03e18a205ffffff
!	Mem[00000000100c1424] = c3bb6069, %f1  = 8b5a0115
	lda	[%i3+0x024]%asi,%f1 	! %f1 = c3bb6069
!	Mem[0000000010001410] = 07e9d556, %l0 = 00000000ff000000
	lduha	[%i0+%o5]0x88,%l0	! %l0 = 000000000000d556
!	Mem[0000000030001408] = 77b9b1ff, %l4 = e03e18a205ffffff
	ldsba	[%i0+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000020800000] = ffba348e, %l2 = 00000000003cc046
	ldsha	[%o1+0x000]%asi,%l2	! %l2 = ffffffffffffffba
!	%l7 = 000000000000003f, immed = fffff01f, %y  = ffffffff
	smul	%l7,-0xfe1,%l4		! %l4 = fffffffffffc17a1, %y = ffffffff
!	Mem[00000000211c0000] = ff05217a, %l1 = 0000000000005136
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000ff05
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000d556, Mem[00000000100c1400] = ff0088ffffffffdd
	stxa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000000000d556

p0_label_32:
!	%l3 = 000000000000003c, Mem[0000000010141428] = fbb4d3ba, %asi = 80
	stwa	%l3,[%i5+0x028]%asi	! Mem[0000000010141428] = 0000003c
!	%f2  = c3680b00 46c03c00, %l6 = 0000000000003fba
!	Mem[0000000030181408] = e58fcdda0000003c
	add	%i6,0x008,%g1
	stda	%f2,[%g1+%l6]ASI_PST16_S ! Mem[0000000030181408] = c368cdda46c0003c
!	%l2 = ffffffffffffffba, Mem[0000000030141400] = a008191f
	stba	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = ba08191f
!	%l0 = 0000d556, %l1 = 0000ff05, Mem[0000000010181438] = 49abb0b5 6cd979ba
	stda	%l0,[%i6+0x038]%asi	! Mem[0000000010181438] = 0000d556 0000ff05
!	%f16 = 1d0a2374 f560f400 48934bcd 384cb4ff
!	%f20 = 1d0a2374 fdffffff 24ac1d59 70c6a1ee
!	%f24 = 038c7157 d81e8e7f fbb4d3ba e31fe211
!	%f28 = a2ffde0f 88e7b230 67089990 000000cd
	stda	%f16,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	%l1 = 000000000000ff05, imm = 0000000000000325, %l0 = 000000000000d556
	addc	%l1,0x325,%l0		! %l0 = 000000000001022a
!	Mem[0000000030041408] = ffffbfed, %l4 = fffffffffffc17a1
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 000000ed000000ff
	membar	#Sync			! Added by membar checker (6)
!	%f16 = 1d0a2374 f560f400 48934bcd 384cb4ff
!	%f20 = 1d0a2374 fdffffff 24ac1d59 70c6a1ee
!	%f24 = 038c7157 d81e8e7f fbb4d3ba e31fe211
!	%f28 = a2ffde0f 88e7b230 67089990 000000cd
	stda	%f16,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	Mem[00000000300c1410] = 8eacd4d5, %l4 = 00000000000000ed
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 000000008eacd4d5
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 59c19a7f95dc38b6, %f0  = bd0d7225 c3bb6069
	ldda	[%i4+%g0]0x80,%f0 	! %f0  = 59c19a7f 95dc38b6

p0_label_33:
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010001408] = cd4b9348, %l5 = 00000000bad3b4fb
	ldswa	[%i0+%o4]0x88,%l5	! %l5 = ffffffffcd4b9348
!	Mem[00000000100c1430] = 24ac81ab, %l1 = 000000000000ff05
	lduha	[%i3+0x032]%asi,%l1	! %l1 = 00000000000081ab
!	Mem[0000000010001410] = fffffffd74230a1d, %l4 = 000000008eacd4d5
	ldxa	[%i0+%o5]0x88,%l4	! %l4 = fffffffd74230a1d
!	Mem[0000000030081408] = ff000000, %l3 = 000000000000003c
	lduha	[%i2+%o4]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010001410] = 74230a1d, %l4 = fffffffd74230a1d
	lduwa	[%i0+%o5]0x88,%l4	! %l4 = 0000000074230a1d
!	Mem[0000000010141408] = cd4b9348, %f7  = 85ab29fa
	lda	[%i5+%o4]0x88,%f7 	! %f7 = cd4b9348
!	Mem[00000000100c1410] = 565a5500, %l5 = ffffffffcd4b9348
	lduha	[%i3+%o5]0x80,%l5	! %l5 = 000000000000565a
!	Mem[0000000030101408] = bc897bb5, %l2 = ffffffffffffffba
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = ffffffffbc897bb5
!	Mem[0000000010181400] = ff842b4b, %l1 = 00000000000081ab
	lduwa	[%i6+%g0]0x80,%l1	! %l1 = 00000000ff842b4b
!	Starting 10 instruction Store Burst
!	%f14 = b7ee06b7 45f89ad8, Mem[0000000010041410] = 00000000 ba724a25
	stda	%f14,[%i1+%o5]0x80	! Mem[0000000010041410] = b7ee06b7 45f89ad8

p0_label_34:
!	%l1 = 00000000ff842b4b, Mem[0000000010041408] = 00000000
	stha	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 2b4b0000
!	Mem[0000000010041408] = 00004b2b, %l1 = 00000000ff842b4b
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 0000000000004b2b
!	Mem[0000000020800001] = ffba348e, %l2 = ffffffffbc897bb5
	ldstuba	[%o1+0x001]%asi,%l2	! %l2 = 000000ba000000ff
!	%l3 = 000000000000ff00, Mem[00000000300c1400] = e58fcdda
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 008fcdda
!	%l0 = 0001022a, %l1 = 00004b2b, Mem[0000000030001408] = 384cb4ff 48934bcd
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 0001022a 00004b2b
!	Mem[0000000030041410] = fffffffd, %l4 = 0000000074230a1d
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 00000000fffffffd
!	%f5  = 8dd9d09e, Mem[0000000030101400] = 1e492e59
	sta	%f5 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 8dd9d09e
!	%l5 = 000000000000565a, Mem[0000000010041408] = 4b2b84ff
	stwa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000565a
!	%l5 = 000000000000565a, immed = fffffc6e, %y  = ffffffff
	umul	%l5,-0x392,%l7		! %l7 = 00005659fecbb2ac, %y = 00005659
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = d0c4c18f1f1908ba, %l4 = 00000000fffffffd
	ldxa	[%i5+%g0]0x89,%l4	! %l4 = d0c4c18f1f1908ba

p0_label_35:
!	Mem[0000000010041428] = 74186c63, %l1 = 0000000000004b2b
	ldsb	[%i1+0x029],%l1		! %l1 = 0000000000000018
!	Mem[0000000010101400] = 59c19a7f, %l4 = d0c4c18f1f1908ba
	ldsha	[%i4+%g0]0x80,%l4	! %l4 = 00000000000059c1
!	Mem[0000000030001400] = f560f400, %l7 = 00005659fecbb2ac
	lduha	[%i0+%g0]0x89,%l7	! %l7 = 000000000000f400
!	Mem[0000000010041410] = b706eeb7, %l3 = 000000000000ff00
	lduwa	[%i1+%o5]0x88,%l3	! %l3 = 00000000b706eeb7
!	Mem[00000000100c1418] = f71c8bfe76b4c833, %f28 = a2ffde0f 88e7b230
	ldda	[%i3+0x018]%asi,%f28	! %f28 = f71c8bfe 76b4c833
!	Mem[00000000201c0000] = 8fff86d9, %l0 = 000000000001022a
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffff8fff
!	Mem[0000000010081410] = e03e18a205ffffff, %f8  = 1ff06967 e31fe211
	ldda	[%i2+%o5]0x88,%f8 	! %f8  = e03e18a2 05ffffff
!	Mem[0000000010001408] = cd4b9348, %l0 = ffffffffffff8fff
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = ffffffffffff9348
!	Mem[00000000100c1400] = 00000000, %l0 = ffffffffffff9348
	ldswa	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ba, Mem[0000000021800140] = 00258361, %asi = 80
	stha	%l2,[%o3+0x140]%asi	! Mem[0000000021800140] = 00ba8361

p0_label_36:
!	%l4 = 00000000000059c1, Mem[00000000100c1410] = 565a5500
	stha	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 59c15500
!	%l6 = 00003fba, %l7 = 0000f400, Mem[0000000030141408] = 01150000 9457f2bd
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00003fba 0000f400
!	%f8  = e03e18a2 05ffffff, Mem[0000000010001410] = 74230a1d fffffffd
	stda	%f8 ,[%i0+%o5]0x88	! Mem[0000000010001410] = e03e18a2 05ffffff
!	%f8  = e03e18a2 05ffffff, Mem[00000000100c1400] = 00000000 56d50000
	stda	%f8 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = e03e18a2 05ffffff
!	%f6  = b074ddff cd4b9348, %l2 = 00000000000000ba
!	Mem[00000000100c1410] = 59c1550037b5a282
	add	%i3,0x010,%g1
	stda	%f6,[%g1+%l2]ASI_PST32_PL ! Mem[00000000100c1410] = 59c15500ffdd74b0
!	Mem[0000000030081400] = ff555a56, %l7 = 000000000000f400
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 00000000ff555a56
!	%l4 = 00000000000059c1, Mem[00000000211c0000] = ff05217a
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 59c1217a
!	Mem[0000000010041408] = 0000565a, %l1 = 0000000000000018
	swapa	[%i1+%o4]0x80,%l1	! %l1 = 000000000000565a
!	Mem[0000000010141400] = 74230a1d, %l0 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 0000000074230a1d
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 7f9ac159, %l7 = 00000000ff555a56
	ldswa	[%i4+%g0]0x88,%l7	! %l7 = 000000007f9ac159

p0_label_37:
!	%f22 = 24ac1d59, %f28 = f71c8bfe
	fcmpes	%fcc2,%f22,%f28		! %fcc2 = 2
!	Mem[00000000300c1400] = dacd8f00, %l2 = 00000000000000ba
	ldsha	[%i3+%g0]0x89,%l2	! %l2 = ffffffffffff8f00
!	Mem[0000000010181410] = 003cc046, %l4 = 00000000000059c1
	ldsba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = bd0d7225, %l5 = 000000000000565a
	ldswa	[%i2+%g0]0x88,%l5	! %l5 = ffffffffbd0d7225
!	Mem[0000000010181430] = 1ff069675136f079, %f4  = 1d0a0000 8dd9d09e
	ldda	[%i6+0x030]%asi,%f4 	! %f4  = 1ff06967 5136f079
!	Mem[0000000030141408] = 00003fba, %l5 = ffffffffbd0d7225
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ba
!	Mem[0000000010041400] = b4fb6ff957b8f365, %l0 = 0000000074230a1d
	ldxa	[%i1+%g0]0x88,%l0	! %l0 = b4fb6ff957b8f365
!	Mem[0000000010101400] = 7f9ac159, %l4 = 0000000000000000
	lduha	[%i4+%g0]0x88,%l4	! %l4 = 000000000000c159
!	Mem[0000000030001400] = 00f460f574230a1d, %f16 = 1d0a2374 f560f400
	ldda	[%i0+%g0]0x81,%f16	! %f16 = 00f460f5 74230a1d
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = e31fe211, %l1 = 000000000000565a
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 00000011000000ff

p0_label_38:
!	Mem[0000000010001408] = 48934bcd, %l3 = 00000000b706eeb7
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 0000000048934bcd
!	%l5 = 00000000000000ba, Mem[00000000100c1410] = 0055c159
	stha	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 005500ba
!	%l7 = 000000007f9ac159, Mem[00000000300c1410] = ed000000
	stba	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = ed000059
!	%f30 = 67089990, Mem[0000000010081410] = 05ffffff
	sta	%f30,[%i2+%o5]0x88	! Mem[0000000010081410] = 67089990
!	%l1 = 0000000000000011, Mem[0000000010041410] = b7ee06b7
	stba	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 11ee06b7
!	Mem[0000000010041418] = 3c53bb328cb27a87, %l6 = 0000000000003fba, %l6 = 0000000000003fba
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 3c53bb328cb27a87
!	Mem[00000000300c1400] = 008fcdda, %l0 = b4fb6ff957b8f365
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000008fcdda
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 00000000008fcdda
	setx	0x5894fe77a123a2a2,%g7,%l0 ! %l0 = 5894fe77a123a2a2
!	%l1 = 0000000000000011
	setx	0x777d2b6786df7986,%g7,%l1 ! %l1 = 777d2b6786df7986
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5894fe77a123a2a2
	setx	0x36e3a87fe0d599d3,%g7,%l0 ! %l0 = 36e3a87fe0d599d3
!	%l1 = 777d2b6786df7986
	setx	0xd253c28fad0efe4b,%g7,%l1 ! %l1 = d253c28fad0efe4b
!	Mem[0000000030141410] = b074ddff, %l7 = 000000007f9ac159
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 00000000b074ddff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 1d0a2374, %l3 = 0000000048934bcd
	ldsba	[%i1+%o5]0x81,%l3	! %l3 = 000000000000001d

p0_label_39:
!	Mem[0000000010101400] = 59c19a7f, %l2 = ffffffffffff8f00
	ldsba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000059
!	Mem[00000000300c1408] = 254a72ba, %l6 = 3c53bb328cb27a87
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ba
!	Mem[0000000030001400] = 00f460f5, %l5 = 00000000000000ba
	lduba	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = ba08191f, %l7 = 00000000b074ddff
	ldswa	[%i5+%g0]0x81,%l7	! %l7 = ffffffffba08191f
!	Mem[0000000010101408] = fbb4d3ba e31fe211, %l4 = 0000c159, %l5 = 00000000
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 00000000fbb4d3ba 00000000e31fe211
!	Mem[00000000100c1400] = ffffff05, %l5 = 00000000e31fe211
	ldsha	[%i3+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181400] = 384cb4ff, %l5 = ffffffffffffffff
	lduha	[%i6+%g0]0x89,%l5	! %l5 = 000000000000b4ff
!	Mem[00000000211c0000] = 59c1217a, %l5 = 000000000000b4ff
	ldsh	[%o2+%g0],%l5		! %l5 = 00000000000059c1
!	Mem[0000000010081418] = 6a0e5802, %l1 = d253c28fad0efe4b
	ldswa	[%i2+0x018]%asi,%l1	! %l1 = 000000006a0e5802
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = ff842b4b, %l5 = 00000000000059c1
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 000000ff000000ff

p0_label_40:
!	Mem[0000000010141408] = 48934bcd, %l5 = 00000000000000ff
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 0000000048934bcd
!	Mem[0000000030181400] = 384cb4ff, %l4 = 00000000fbb4d3ba
	ldstuba	[%i6+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	%l0 = e0d599d3, %l1 = 6a0e5802, Mem[0000000030001410] = fdffffff 1d0a2374
	stda	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = e0d599d3 6a0e5802
!	%l0 = 36e3a87fe0d599d3, Mem[00000000300c1408] = 254a72ba
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = e0d599d3
!	%l6 = 00000000000000ba, Mem[0000000010081408] = 49d4a2d2
	stha	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 49d400ba
!	%l6 = 00000000000000ba, Mem[0000000010001408] = ffb44c38b7ee06b7
	stxa	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000000000ba
!	%f28 = f71c8bfe 76b4c833, %l7 = ffffffffba08191f
!	Mem[00000000300c1400] = 57b8f3653c000000
	stda	%f28,[%i3+%l7]ASI_PST32_SL ! Mem[00000000300c1400] = 33c8b476fe8b1cf7
!	%l5 = 0000000048934bcd, Mem[0000000030141410] = 59c19a7f
	stwa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 48934bcd
!	%f16 = 00f460f5 74230a1d 48934bcd 384cb4ff
!	%f20 = 1d0a2374 fdffffff 24ac1d59 70c6a1ee
!	%f24 = 038c7157 d81e8e7f fbb4d3ba e31fe211
!	%f28 = f71c8bfe 76b4c833 67089990 000000cd
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = fbb4d3bae31fe211, %l1 = 000000006a0e5802
	ldxa	[%i0+0x028]%asi,%l1	! %l1 = fbb4d3bae31fe211

p0_label_41:
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030081400] = f560f400, %l7 = ffffffffba08191f
	ldsba	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 74230a1d, %f13 = a2183ee0
	lda	[%i2+%o5]0x89,%f13	! %f13 = 74230a1d
!	Mem[00000000201c0000] = 8fff86d9, %l5 = 0000000048934bcd
	ldsb	[%o0+0x001],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010041430] = 4d2406d9 87ff69a8, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i1+0x030]%asi,%l4	! %l4 = 000000004d2406d9 0000000087ff69a8
!	Mem[0000000010101410] = 00000a1d, %l3 = 000000000000001d
	ldsba	[%i4+%o5]0x88,%l3	! %l3 = 000000000000001d
!	Mem[0000000030041408] = ffffbfff, %l0 = 36e3a87fe0d599d3
	lduba	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = ff000000, %l2 = 0000000000000059
	lduwa	[%i5+%o4]0x88,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030141400] = ba08191f, %l0 = 00000000000000ff
	ldsba	[%i5+%g0]0x81,%l0	! %l0 = ffffffffffffffba
!	%l2 = 00000000ff000000, %l0 = ffffffffffffffba, %y  = 00005659
	sdiv	%l2,%l0,%l3		! %l3 = ffffffff80000000
	mov	%l0,%y			! %y = ffffffba
!	Starting 10 instruction Store Burst
!	%f16 = 00f460f5 74230a1d, Mem[0000000010101410] = 1d0a0000 8dd9d09e
	stda	%f16,[%i4+%o5]0x80	! Mem[0000000010101410] = 00f460f5 74230a1d

p0_label_42:
!	%l4 = 000000004d2406d9, Mem[0000000010141404] = f560f400
	stw	%l4,[%i5+0x004]		! Mem[0000000010141404] = 4d2406d9
!	%l4 = 000000004d2406d9, Mem[00000000211c0000] = 59c1217a
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 06d9217a
!	Mem[0000000030101410] = ffe21fe3, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000ffe21fe3
!	%f18 = 48934bcd 384cb4ff, Mem[0000000030041410] = 1d0a2374 e9ff3f97
	stda	%f18,[%i1+%o5]0x81	! Mem[0000000030041410] = 48934bcd 384cb4ff
!	Mem[0000000021800080] = 13070550, %l1 = fbb4d3bae31fe211
	ldstuba	[%o3+0x080]%asi,%l1	! %l1 = 00000013000000ff
!	%l4 = 4d2406d9, %l5 = 87ff69a8, Mem[00000000100c1400] = ffffff05 a2183ee0
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 4d2406d9 87ff69a8
!	%l0 = ffffffba, %l1 = 00000013, Mem[0000000030101400] = 9ed0d98d ffffffff
	stda	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffba 00000013
!	%f31 = 000000cd, Mem[0000000010001400] = 1d0a2374
	sta	%f31,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000cd
!	Mem[000000001018142c] = d4e4f3f4, %l0 = ffffffffffffffba, %asi = 80
	swapa	[%i6+0x02c]%asi,%l0	! %l0 = 00000000d4e4f3f4
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff842b4b, %l1 = 0000000000000013
	lduba	[%i6+%g0]0x80,%l1	! %l1 = 00000000000000ff

p0_label_43:
!	%l4 = 000000004d2406d9, %l1 = 00000000000000ff, %y  = ffffffba
	umul	%l4,%l1,%l3		! %l3 = 0000004cd6e2d227, %y = 0000004c
!	Mem[00000000300c1408] = d399d5e0, %l1 = 00000000000000ff
	lduha	[%i3+%o4]0x81,%l1	! %l1 = 000000000000d399
!	Mem[0000000010081400] = bd0d7225, %l6 = 00000000000000ba
	ldswa	[%i2+%g0]0x88,%l6	! %l6 = ffffffffbd0d7225
!	Mem[0000000010081424] = e8e0918e, %l2 = 00000000ff000000
	lduha	[%i2+0x026]%asi,%l2	! %l2 = 000000000000918e
!	Mem[0000000010081410] = e03e18a2 67089990, %l6 = bd0d7225, %l7 = ffe21fe3
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 0000000067089990 00000000e03e18a2
!	%f30 = 67089990, %f26 = fbb4d3ba
	fcmps	%fcc1,%f30,%f26		! %fcc1 = 2
!	Mem[0000000010181408] = f2ffffff, %f0  = 59c19a7f
	lda	[%i6+%o4]0x88,%f0 	! %f0 = f2ffffff
!	Mem[00000000100c1418] = f71c8bfe, %l1 = 000000000000d399
	lduwa	[%i3+0x018]%asi,%l1	! %l1 = 00000000f71c8bfe
!	Mem[00000000300c1410] = e9975924ed000059, %l7 = 00000000e03e18a2
	ldxa	[%i3+%o5]0x89,%l7	! %l7 = e9975924ed000059
!	Starting 10 instruction Store Burst
!	%l0 = 00000000d4e4f3f4, Mem[0000000010001410] = ffffff05
	stha	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = f3f4ff05

p0_label_44:
!	%l1 = 00000000f71c8bfe, Mem[0000000030041400] = ffffffff6968cb77
	stxa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000f71c8bfe
!	Mem[0000000010141408] = 000000ff, %l0 = 00000000d4e4f3f4
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181400] = ffb44c38, %l0 = 00000000000000ff
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 00000000ffb44c38
!	%f1  = 95dc38b6, Mem[0000000010041400] = 57b8f365
	sta	%f1 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 95dc38b6
!	Mem[0000000010141410] = fdffffff, %l3 = 0000004cd6e2d227
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 000000000000ffff
!	%l6 = 0000000067089990, Mem[00000000211c0000] = 06d9217a, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 9990217a
!	Mem[00000000100c1400] = d906244d, %l5 = 0000000087ff69a8
	swapa	[%i3+%g0]0x88,%l5	! %l5 = 00000000d906244d
!	%l3 = 000000000000ffff, Mem[0000000010181408] = f2ffffff
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = f2ffffff
!	%f8  = e03e18a2, Mem[0000000010101410] = 00f460f5
	sta	%f8 ,[%i4+%o5]0x80	! Mem[0000000010101410] = e03e18a2
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 9990217a, %l0 = 00000000ffb44c38
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = ffffffffffffff90

p0_label_45:
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000030101400] = ffffffba 00000013 bc897bb5 fb5052a8
!	Mem[0000000030101410] = 00000000 bad3b4fb facee6f6 11317c96
!	Mem[0000000030101420] = bd23ccf3 0cae2517 582a48b4 b0d443f4
!	Mem[0000000030101430] = 97f0269d 99d0c51c c763fbdb a3b2087f
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[00000000218000c0] = 5907fc4a, %l2 = 000000000000918e
	ldsb	[%o3+0x0c1],%l2		! %l2 = 0000000000000007
!	Mem[0000000010101400] = 7f9ac159, %f4  = 1ff06967
	lda	[%i4+%g0]0x88,%f4 	! %f4 = 7f9ac159
!	Mem[0000000010181410] = 003cc046000b68c3, %f14 = b7ee06b7 45f89ad8
	ldd	[%i6+%o5],%f14		! %f14 = 003cc046 000b68c3
!	Mem[0000000010101404] = 95dc38b6, %l3 = 000000000000ffff
	ldsh	[%i4+0x006],%l3		! %l3 = 00000000000038b6
!	Mem[0000000010041400] = b4fb6ff995dc38b6, %l7 = e9975924ed000059
	ldxa	[%i1+%g0]0x88,%l7	! %l7 = b4fb6ff995dc38b6
!	Mem[00000000300c1410] = ed000059, %l5 = 00000000d906244d
	ldsba	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000059
!	Mem[0000000010001400] = 00f460f5 cd000000, %l2 = 00000007, %l3 = 000038b6
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 00000000cd000000 0000000000f460f5
!	Mem[0000000010041410] = 11ee06b7, %l6 = 0000000067089990
	ldswa	[%i1+0x010]%asi,%l6	! %l6 = 0000000011ee06b7
!	Starting 10 instruction Store Burst
!	%l2 = 00000000cd000000, Mem[0000000010081401] = 25720dbd
	stb	%l2,[%i2+0x001]		! Mem[0000000010081400] = 25000dbd

p0_label_46:
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000000059
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 005500ba, %l1 = 00000000f71c8bfe
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 000000ba000000ff
!	Mem[0000000010181410] = 003cc046, %l0 = ffffffffffffff90
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l5 = 0000000000000000, immed = fffff1e3, %y  = 0000004c
	smul	%l5,-0xe1d,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000010181434] = 5136f079, %l2 = 00000000, %l7 = 95dc38b6
	add	%i6,0x34,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 000000005136f079
!	%l6 = 0000000011ee06b7, Mem[0000000030081400] = f560f400
	stwa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 11ee06b7
!	%l0 = 0000000000000000, Mem[0000000010081408] = ba00d44924d1c567
	stxa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	Mem[00000000100c1438] = 953a7c04, %l1 = 00000000000000ba
	swap	[%i3+0x038],%l1		! %l1 = 00000000953a7c04
!	%l0 = 0000000000000000, %l0 = 0000000000000000, %y  = 00000000
	smul	%l0,%l0,%l5		! %l5 = 0000000000000000, %y = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff842b4b, %l6 = 0000000011ee06b7
	ldsha	[%i6+%g0]0x80,%l6	! %l6 = ffffffffffffff84

p0_label_47:
!	Mem[0000000010101428] = b675f7dfd63973fc, %l4 = 000000004d2406d9
	ldx	[%i4+0x028],%l4		! %l4 = b675f7dfd63973fc
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000030101400] = ffffffba 00000013 bc897bb5 fb5052a8
!	Mem[0000000030101410] = 59000000 bad3b4fb facee6f6 11317c96
!	Mem[0000000030101420] = bd23ccf3 0cae2517 582a48b4 b0d443f4
!	Mem[0000000030101430] = 97f0269d 99d0c51c c763fbdb a3b2087f
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 0000000000000000
	setx	0x86ad27a07ed0d52f,%g7,%l0 ! %l0 = 86ad27a07ed0d52f
!	%l1 = 00000000953a7c04
	setx	0x5d9cf3d7a7c8a073,%g7,%l1 ! %l1 = 5d9cf3d7a7c8a073
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 86ad27a07ed0d52f
	setx	0xa168e2b02d562c4b,%g7,%l0 ! %l0 = a168e2b02d562c4b
!	%l1 = 5d9cf3d7a7c8a073
	setx	0x4343b2881f165f6c,%g7,%l1 ! %l1 = 4343b2881f165f6c
!	%l4 = b675f7dfd63973fc, immd = fffffffffffff040, %l3 = 0000000000f460f5
	udivx	%l4,-0xfc0,%l3		! %l3 = 0000000000000000
!	%f20 = 00000000, %f23 = 11317c96, %f26 = 582a48b4 b0d443f4
	fsmuld	%f20,%f23,%f26		! %f26 = 00000000 00000000
!	%l3 = 0000000000000000, Mem[0000000010101434] = b7cd2668
	sth	%l3,[%i4+0x034]		! Mem[0000000010101434] = 00002668
!	Mem[0000000010081410] = 90990867, %f23 = 11317c96
	lda	[%i2+0x010]%asi,%f23	! %f23 = 90990867
!	Mem[00000000100c1408] = 8df21cba01150000, %l0 = a168e2b02d562c4b
	ldxa	[%i3+%o4]0x88,%l0	! %l0 = 8df21cba01150000
!	Mem[0000000030081408] = 48934bcd, %l7 = 000000005136f079
	lduba	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000048
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030081408] = cd4b9348
	stha	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = cd4b0000

p0_label_48:
!	Mem[00000000100c1430] = 24ac81ab70c6a1ee, %l1 = 4343b2881f165f6c, %l1 = 4343b2881f165f6c
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = 24ac81ab70c6a1ee
!	%f16 = ffffffba 00000013 bc897bb5 fb5052a8
!	%f20 = 00000000 bad3b4fb facee6f6 90990867
!	%f24 = bd23ccf3 0cae2517 00000000 00000000
!	%f28 = 97f0269d 99d0c51c c763fbdb a3b2087f
	stda	%f16,[%i0]ASI_BLK_S	! Block Store to 0000000030001400
!	%l4 = b675f7dfd63973fc, Mem[0000000010101408] = bad3b4fb
	stwa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = d63973fc
!	Mem[0000000021800101] = 89f9d1b9, %l3 = 0000000000000000
	ldstuba	[%o3+0x101]%asi,%l3	! %l3 = 000000f9000000ff
!	%f14 = c763fbdb a3b2087f, Mem[00000000100c1400] = a869ff87 87ff69a8
	stda	%f14,[%i3+%g0]0x80	! Mem[00000000100c1400] = c763fbdb a3b2087f
!	%f2  = bc897bb5 fb5052a8, %l6 = ffffffffffffff84
!	Mem[0000000010001430] = a2ffde0f88e7b230
	add	%i0,0x030,%g1
	stda	%f2,[%g1+%l6]ASI_PST16_P ! Mem[0000000010001430] = a2ff7bb588e7b230
!	%l6 = ffffffffffffff84, Mem[00000000300c1410] = ed000059
	stha	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = ed00ff84
	membar	#Sync			! Added by membar checker (11)
!	%f8  = bd23ccf3 0cae2517, Mem[0000000030101400] = ffffffba 00000013
	stda	%f8 ,[%i4+%g0]0x81	! Mem[0000000030101400] = bd23ccf3 0cae2517
!	Mem[0000000030081400] = 11ee06b7, %l0 = 8df21cba01150000
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 0000000011ee06b7
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ba08191f 8fc1c4d0 ba3f0000 00f40000
!	Mem[0000000030141410] = 48934bcd 20b9eeb3 93113a5b 7839e277
!	Mem[0000000030141420] = bfb9b1e8 aa3dc13d 7fda7d6a fad84a59
!	Mem[0000000030141430] = 0fc0385b ae103944 c977175a 37af2871
	ldda	[%i5]ASI_BLK_S,%f0	! Block Load from 0000000030141400

p0_label_49:
!	Mem[0000000010181400] = ff842b4b, %l4 = b675f7dfd63973fc
	lduwa	[%i6+%g0]0x80,%l4	! %l4 = 00000000ff842b4b
!	%l6 = ffffffffffffff84, %l7 = 0000000000000048, %l0 = 0000000011ee06b7
	udivx	%l6,%l7,%l0		! %l0 = 038e38e38e38e38c
!	Mem[0000000010001420] = 038c7157d81e8e7f, %l2 = 0000000000000000
	ldxa	[%i0+0x020]%asi,%l2	! %l2 = 038c7157d81e8e7f
!	Mem[0000000010001410] = 05fff4f3, %l5 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l5	! %l5 = 00000000000000f3
!	Mem[0000000010081410] = 90990867, %l1 = 24ac81ab70c6a1ee
	ldsba	[%i2+%o5]0x80,%l1	! %l1 = ffffffffffffff90
!	Mem[0000000030181410] = f6efbfed, %l2 = 038c7157d81e8e7f
	lduba	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ed
!	Mem[0000000030081410] = 1d0a2374, %l4 = 00000000ff842b4b
	lduwa	[%i2+%o5]0x81,%l4	! %l4 = 000000001d0a2374
!	Mem[0000000010041400] = b638dc95, %l2 = 00000000000000ed
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 000000000000b638
!	Mem[0000000010001400] = 00f460f5 cd000000, %l2 = 0000b638, %l3 = 000000f9
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 00000000cd000000 0000000000f460f5
!	Starting 10 instruction Store Burst
!	%f16 = ffffffba, Mem[0000000030081410] = 1d0a2374
	sta	%f16,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffba

p0_label_50:
!	Mem[0000000030141410] = 48934bcd, %l4 = 000000001d0a2374
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 00000048000000ff
!	%l3 = 0000000000f460f5, Mem[0000000030001408] = bc897bb5
	stha	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 60f57bb5
!	Mem[00000000211c0000] = 9990217a, %l1 = ffffffffffffff90
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffff9990
!	%l4 = 0000000000000048, Mem[0000000010181410] = ff3cc046000b68c3, %asi = 80
	stxa	%l4,[%i6+0x010]%asi	! Mem[0000000010181410] = 0000000000000048
!	Mem[0000000010081410] = 90990867, %l1 = ffffffffffff9990
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 0000000090990867
!	Mem[00000000218001c1] = 3c33a92c, %l7 = 0000000000000048
	ldstuba	[%o3+0x1c1]%asi,%l7	! %l7 = 00000033000000ff
!	%l3 = 0000000000f460f5, Mem[0000000030041410] = cd4b9348
	stwa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 00f460f5
!	%f22 = facee6f6 90990867, Mem[0000000030001410] = 00000000 bad3b4fb
	stda	%f22,[%i0+%o5]0x81	! Mem[0000000030001410] = facee6f6 90990867
!	Mem[0000000030181400] = ff000000, %l0 = 038e38e38e38e38c
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = d81e8e7f, %l1 = 0000000090990867
	lduba	[%i0+0x026]%asi,%l1	! %l1 = 000000000000008e

p0_label_51:
!	Mem[0000000010141400] = 00000000 4d2406d9, %l4 = 00000048, %l5 = 000000f3
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000 000000004d2406d9
!	Mem[00000000100c1430] = 24ac81ab, %l0 = 0000000000000000, %asi = 80
	swapa	[%i3+0x030]%asi,%l0	! %l0 = 0000000024ac81ab
!	Mem[0000000030181400] = 48934bcd ff0000ff, %l2 = cd000000, %l3 = 00f460f5
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 00000000ff0000ff 0000000048934bcd
!	Mem[0000000030081410] = ffffffba, %l6 = ffffffffffffff84
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101410] = fbb4d3ba00000059, %l3 = 0000000048934bcd
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = fbb4d3ba00000059
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 0000000024ac81ab
	setx	0x69744937e5194141,%g7,%l0 ! %l0 = 69744937e5194141
!	%l1 = 000000000000008e
	setx	0x20ee8127cf1e5e69,%g7,%l1 ! %l1 = 20ee8127cf1e5e69
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 69744937e5194141
	setx	0x5221f5f865e41233,%g7,%l0 ! %l0 = 5221f5f865e41233
!	%l1 = 20ee8127cf1e5e69
	setx	0xae2328a01be00eb4,%g7,%l1 ! %l1 = ae2328a01be00eb4
!	Mem[0000000030141408] = ba3f0000, %l7 = 0000000000000033
	lduha	[%i5+%o4]0x81,%l7	! %l7 = 000000000000ba3f
!	%f10 = 7fda7d6a, %f17 = 00000013
	fcmps	%fcc1,%f10,%f17		! %fcc1 = 3
!	Mem[00000000201c0000] = 8fff86d9, %l3 = fbb4d3ba00000059
	lduh	[%o0+%g0],%l3		! %l3 = 0000000000008fff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[000000001000141a] = 24ac1d59, %asi = 80
	stha	%l6,[%i0+0x01a]%asi	! Mem[0000000010001418] = 24ac00ff

p0_label_52:
!	Mem[0000000020800000] = ffff348e, %l3 = 0000000000008fff
	ldstub	[%o1+%g0],%l3		! %l3 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (12)
!	%l4 = 0000000000000000, Mem[0000000030141410] = ff934bcd
	stha	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00004bcd
!	%f26 = 00000000 00000000, Mem[0000000010001400] = 000000cd f560f400
	stda	%f26,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 00000000
!	Mem[00000000100c1400] = c763fbdb, %l5 = 000000004d2406d9
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 000000c7000000ff
!	%l1 = ae2328a01be00eb4, Mem[0000000010101400] = 59c19a7f
	stwa	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 1be00eb4
!	%l2 = 00000000ff0000ff, Mem[0000000030101408] = bc897bb5fb5052a8
	stxa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000ff0000ff
!	%l6 = 00000000000000ff, Mem[0000000010081400] = 25000dbd, %asi = 80
	stwa	%l6,[%i2+0x000]%asi	! Mem[0000000010081400] = 000000ff
!	%f1  = 8fc1c4d0, Mem[0000000030101410] = 00000059
	sta	%f1 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 8fc1c4d0
!	%l3 = 00000000000000ff, Mem[0000000010041400] = 95dc38b6
	stha	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 95dc00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 1be00eb4, %f30 = c763fbdb
	lda	[%i4+%g0]0x80,%f30	! %f30 = 1be00eb4

p0_label_53:
!	Mem[00000000201c0000] = 8fff86d9, %l4 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l4	! %l4 = 000000000000008f
!	Mem[0000000030101410] = d0c4c18f, %f1  = 8fc1c4d0
	lda	[%i4+%o5]0x81,%f1 	! %f1 = d0c4c18f
!	Mem[00000000211c0000] = 9990217a, %l3 = 00000000000000ff
	lduba	[%o2+0x001]%asi,%l3	! %l3 = 0000000000000090
!	Mem[00000000300c1410] = ed00ff84, %l0 = 5221f5f865e41233
	ldswa	[%i3+%o5]0x89,%l0	! %l0 = ffffffffed00ff84
!	Mem[00000000201c0000] = 8fff86d9, %l7 = 000000000000ba3f
	ldub	[%o0+%g0],%l7		! %l7 = 000000000000008f
!	Mem[00000000100c1408] = 00001501ba1cf28d, %l4 = 000000000000008f
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = 00001501ba1cf28d
!	Mem[0000000010141400] = 00000000, %l1 = ae2328a01be00eb4
	ldsha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 005500ff, %l6 = 00000000000000ff
	ldsba	[%i3+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001408] = 60f57bb5, %l6 = ffffffffffffffff
	lduba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000060
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 005500ff, %l4 = 00001501ba1cf28d
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 000000ff000000ff

p0_label_54:
!	%l7 = 000000000000008f, Mem[0000000010001408] = 000000ba
	stba	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000008f
!	%l0 = ed00ff84, %l1 = 00000000, Mem[0000000010141408] = f4f3e4d4 ffb44c38
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = ed00ff84 00000000
!	%l2 = 00000000ff0000ff, Mem[0000000030041408] = ffffbfff
	stba	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffbfff
!	%l4 = 000000ff, %l5 = 000000c7, Mem[0000000010041420] = b3ef4dfc ad12f4cd
	std	%l4,[%i1+0x020]		! Mem[0000000010041420] = 000000ff 000000c7
!	%f26 = 00000000 00000000, Mem[0000000010141410] = fdffffff fffffffd
	stda	%f26,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 00000000
!	%l5 = 00000000000000c7, imm = 000000000000018b, %l2 = 00000000ff0000ff
	and	%l5,0x18b,%l2		! %l2 = 0000000000000083
!	%l6 = 0000000000000060, Mem[0000000030081400] = 01150000
	stwa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000060
!	Mem[00000000211c0001] = 9990217a, %l4 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 00000090000000ff
!	%l1 = 0000000000000000, Mem[0000000030001410] = facee6f6
	stwa	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081428] = 6630a23d 5f02ffa1, %l2 = 00000083, %l3 = 00000090
	ldda	[%i2+0x028]%asi,%l2	! %l2 = 000000006630a23d 000000005f02ffa1

p0_label_55:
!	Mem[0000000010141410] = 00000000, %l7 = 000000000000008f
	ldsba	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000090
	lduha	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 0000000000000000, %f22 = facee6f6 90990867
	ldda	[%i5+%o5]0x80,%f22	! %f22 = 00000000 00000000
!	Mem[0000000030001408] = b57bf560, %l3 = 000000005f02ffa1
	ldswa	[%i0+%o4]0x89,%l3	! %l3 = ffffffffb57bf560
!	Mem[0000000030101410] = d0c4c18fbad3b4fb, %l4 = 0000000000000000
	ldxa	[%i4+%o5]0x81,%l4	! %l4 = d0c4c18fbad3b4fb
!	Mem[0000000030181410] = edbfeff6, %l7 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l7	! %l7 = ffffffffffffffed
!	Mem[0000000010141438] = 67089990000000cd, %l6 = 0000000000000060
	ldxa	[%i5+0x038]%asi,%l6	! %l6 = 67089990000000cd
!	Mem[000000001010140c] = e31fe211, %l6 = 67089990000000cd
	lduw	[%i4+0x00c],%l6		! %l6 = 00000000e31fe211
!	Mem[000000001014140c] = 00000000, %l1 = 0000000000000000
	ldsh	[%i5+0x00e],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffed00ff84, Mem[0000000010001408] = 0000008f
	stba	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000084

p0_label_56:
!	%f12 = 0fc0385b, Mem[000000001008140c] = 00000000
	sta	%f12,[%i2+0x00c]%asi	! Mem[000000001008140c] = 0fc0385b
!	%f22 = 00000000 00000000, Mem[0000000030101410] = 8fc1c4d0 fbb4d3ba
	stda	%f22,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 00000000
!	Mem[0000000030081408] = 00004bcd, %l7 = ffffffffffffffed
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%l2 = 000000006630a23d, Mem[0000000030141400] = d0c4c18f1f1908ba
	stxa	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000006630a23d
!	%l2 = 000000006630a23d, Mem[0000000010041408] = ff0a237418000000
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000006630a23d
!	Mem[0000000030181410] = edbfeff6, %l7 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 000000ed000000ff
!	%l4 = d0c4c18fbad3b4fb, Mem[0000000030181410] = f6efbfff
	stba	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = f6efbffb
!	%l5 = 00000000000000c7, Mem[0000000010181400] = ff842b4b
	stba	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = c7842b4b
!	Mem[0000000030101400] = f3cc23bd, %l6 = 00000000e31fe211
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 00000000f3cc23bd
!	Starting 10 instruction Load Burst
!	Mem[0000000010181424] = 00e8fcdc, %l7 = 00000000000000ed
	ldub	[%i6+0x025],%l7		! %l7 = 00000000000000e8

p0_label_57:
!	Mem[00000000100c143c] = b63ebb65, %l7 = 00000000000000e8
	ldsb	[%i3+0x03d],%l7		! %l7 = 000000000000003e
!	Mem[0000000010181410] = 00000000, %l3 = ffffffffb57bf560
	lduba	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 57c4ad74ff000000, %f6  = 93113a5b 7839e277
	ldda	[%i2+%g0]0x88,%f6 	! %f6  = 57c4ad74 ff000000
!	Mem[0000000010081404] = 74adc457, %l2 = 000000006630a23d
	ldswa	[%i2+0x004]%asi,%l2	! %l2 = 0000000074adc457
!	Mem[00000000100c1420] = bfa0033fc3bb6069, %l1 = 0000000000000000
	ldx	[%i3+0x020],%l1		! %l1 = bfa0033fc3bb6069
!	Mem[0000000030041408] = ffbfffff, %l2 = 0000000074adc457
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = ffffffffffffffbf
!	Mem[0000000010141410] = 0000000000000000, %l6 = 00000000f3cc23bd
	ldxa	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101420] = 79415f869a6afae2, %f16 = ffffffba 00000013
	ldda	[%i4+0x020]%asi,%f16	! %f16 = 79415f86 9a6afae2
!	Mem[00000000100c1408] = 00001501 ba1cf28d, %l2 = ffffffbf, %l3 = 00000000
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 0000000000001501 00000000ba1cf28d
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000001501, Mem[0000000030101410] = 0000000000000000
	stxa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000001501

p0_label_58:
!	%f6  = 57c4ad74 ff000000, Mem[0000000030181408] = c368cdda 46c0003c
	stda	%f6 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 57c4ad74 ff000000
!	Mem[0000000010101410] = e03e18a2, %l4 = d0c4c18fbad3b4fb
	lduw	[%i4+%o5],%l4		! %l4 = 00000000e03e18a2
!	%f22 = 00000000 00000000, %l5 = 00000000000000c7
!	Mem[0000000030081400] = 6000000074230a1d
	stda	%f22,[%i2+%l5]ASI_PST32_SL ! Mem[0000000030081400] = 0000000000000000
!	%l0 = ffffffffed00ff84, Mem[0000000010041410] = b706ee11
	stha	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = b706ff84
!	Mem[0000000010001400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%f9  = aa3dc13d, Mem[0000000010041404] = f96ffbb4
	st	%f9 ,[%i1+0x004]	! Mem[0000000010041404] = aa3dc13d
!	Mem[0000000030001400] = ffffffba, %l2 = 0000000000001501
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	%l1 = bfa0033fc3bb6069, Mem[0000000010041400] = ff00dc95aa3dc13d
	stxa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = bfa0033fc3bb6069
!	%l0 = ffffffffed00ff84, Mem[00000000201c0000] = 8fff86d9, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = ff8486d9
!	Starting 10 instruction Load Burst
!	%l0 = ffffffffed00ff84, %l6 = 0000000000000000, %l2 = 00000000000000ff
	andn	%l0,%l6,%l2		! %l2 = ffffffffed00ff84

p0_label_59:
!	Mem[00000000100c1408] = 8df21cba01150000, %l4 = 00000000e03e18a2
	ldxa	[%i3+%o4]0x88,%l4	! %l4 = 8df21cba01150000
!	Mem[0000000010181410] = 4800000000000000, %f18 = bc897bb5 fb5052a8
	ldda	[%i6+%o5]0x88,%f18	! %f18 = 48000000 00000000
!	Mem[0000000010141418] = 24ac1d5970c6a1ee, %f10 = 7fda7d6a fad84a59
	ldda	[%i5+0x018]%asi,%f10	! %f10 = 24ac1d59 70c6a1ee
!	Mem[0000000010001418] = 24ac00ff70c6a1ee, %f24 = bd23ccf3 0cae2517
	ldd	[%i0+0x018],%f24	! %f24 = 24ac00ff 70c6a1ee
!	Mem[0000000010041438] = cf7378e0 23e59b95, %l4 = 01150000, %l5 = 000000c7
	ldda	[%i1+0x038]%asi,%l4	! %l4 = 00000000cf7378e0 0000000023e59b95
!	Mem[0000000010141430] = a2ffde0f, %l4 = 00000000cf7378e0
	ldsha	[%i5+0x032]%asi,%l4	! %l4 = ffffffffffffde0f
!	Mem[000000001008140c] = 0fc0385b, %l1 = bfa0033fc3bb6069
	ldsh	[%i2+0x00e],%l1		! %l1 = 000000000000385b
!	Mem[000000001000143c] = 000000cd, %l2 = ffffffffed00ff84
	ldsha	[%i0+0x03e]%asi,%l2	! %l2 = 00000000000000cd
!	Mem[0000000010181400] = 4b2b84c7, %l5 = 0000000023e59b95
	lduba	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000c7
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_60:
!	%f11 = 70c6a1ee, Mem[0000000030101400] = 11e21fe3
	sta	%f11,[%i4+%g0]0x81	! Mem[0000000030101400] = 70c6a1ee
!	Mem[0000000010041438] = cf7378e0, %l0 = ffffffffed00ff84, %asi = 80
	swapa	[%i1+0x038]%asi,%l0	! %l0 = 00000000cf7378e0
!	%f0  = ba08191f, %f12 = 0fc0385b, %f30 = 1be00eb4
	fadds	%f0 ,%f12,%f30		! %f30 = ba08191f
!	%l0 = 00000000cf7378e0, Mem[0000000030181410] = fbbfeff6
	stha	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 78e0eff6
!	%f26 = 00000000 00000000, %l4 = ffffffffffffde0f
!	Mem[0000000030001438] = c763fbdba3b2087f
	add	%i0,0x038,%g1
	stda	%f26,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030001438] = 00000000a3b2087f
!	Mem[0000000030101400] = 70c6a1ee, %l4 = ffffffffffffde0f
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 00000070000000ff
!	%l3 = 00000000ba1cf28d, Mem[0000000030041400] = 00000000
	stba	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000008d
!	%f30 = ba08191f a3b2087f, Mem[0000000010181410] = 00000000 48000000
	stda	%f30,[%i6+%o5]0x88	! Mem[0000000010181410] = ba08191f a3b2087f
!	%l1 = 000000000000385b, Mem[0000000010041400] = bfa0033fc3bb6069, %asi = 80
	stxa	%l1,[%i1+0x000]%asi	! Mem[0000000010041400] = 000000000000385b
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = b3eeb920cd4b0000, %f28 = 97f0269d 99d0c51c
	ldda	[%i5+%o5]0x89,%f28	! %f28 = b3eeb920 cd4b0000

p0_label_61:
!	Mem[0000000010041400] = 00000000, %f29 = cd4b0000
	lda	[%i1+%g0]0x88,%f29	! %f29 = 00000000
!	Mem[00000000201c0000] = ff8486d9, %l4 = 0000000000000070
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ff84
!	Mem[0000000010181400] = 000000004b2b84c7, %f18 = 48000000 00000000
	ldda	[%i6+%g0]0x88,%f18	! %f18 = 00000000 4b2b84c7
!	Mem[0000000030001400] = 13000000 baffffff, %l2 = 000000cd, %l3 = ba1cf28d
	ldda	[%i0+%g0]0x89,%l2	! %l2 = 00000000baffffff 0000000013000000
!	Mem[0000000030001408] = b57bf560, %f7  = ff000000
	lda	[%i0+%o4]0x89,%f7 	! %f7 = b57bf560
!	Mem[0000000030001410] = 0000000090990867, %l5 = 00000000000000c7
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = 0000000090990867
!	Mem[0000000030101408] = 00000000, %f4  = 48934bcd
	lda	[%i4+%o4]0x89,%f4 	! %f4 = 00000000
!	Mem[0000000010001408] = 00000084, %l4 = 000000000000ff84
	lduba	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000084
!	Mem[0000000020800040] = 92bbd1fd, %l3 = 0000000013000000
	lduha	[%o1+0x040]%asi,%l3	! %l3 = 00000000000092bb
!	Starting 10 instruction Store Burst
!	%f31 = a3b2087f, Mem[0000000030041400] = 8d000000
	sta	%f31,[%i1+%g0]0x81	! Mem[0000000030041400] = a3b2087f

p0_label_62:
!	%f8  = bfb9b1e8 aa3dc13d, %l6 = 0000000000000000
!	Mem[00000000100c1430] = 0000000070c6a1ee
	add	%i3,0x030,%g1
	stda	%f8,[%g1+%l6]ASI_PST16_PL ! Mem[00000000100c1430] = 0000000070c6a1ee
!	Mem[0000000010081430] = 17fb3e878cae450e, %l3 = 00000000000092bb, %l6 = 0000000000000000
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = 17fb3e878cae450e
!	Mem[00000000100c1408] = 00001501, %l3 = 00000000000092bb
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%f14 = c977175a 37af2871, %l6 = 17fb3e878cae450e
!	Mem[0000000010141438] = 67089990000000cd
	add	%i5,0x038,%g1
	stda	%f14,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010141438] = 670899905a1777c9
!	%l0 = 00000000cf7378e0, Mem[0000000021800100] = 89ffd1b9
	sth	%l0,[%o3+0x100]		! Mem[0000000021800100] = 78e0d1b9
!	%l0 = 00000000cf7378e0, Mem[0000000030041410] = f560f400
	stba	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = e060f400
!	%l1 = 000000000000385b, Mem[000000001014141c] = 70c6a1ee, %asi = 80
	stwa	%l1,[%i5+0x01c]%asi	! Mem[000000001014141c] = 0000385b
!	%l0 = 00000000cf7378e0, Mem[0000000010041430] = 4d2406d9, %asi = 80
	stwa	%l0,[%i1+0x030]%asi	! Mem[0000000010041430] = cf7378e0
!	Mem[0000000030081410] = baffffff, %l0 = 00000000cf7378e0
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 00000000baffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff00000000000000, %f12 = 0fc0385b ae103944
	ldda	[%i0+%g0]0x80,%f12	! %f12 = ff000000 00000000

p0_label_63:
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 00000000baffffff
	setx	0xf55008b077e9d6c7,%g7,%l0 ! %l0 = f55008b077e9d6c7
!	%l1 = 000000000000385b
	setx	0x478f7f987874c5d0,%g7,%l1 ! %l1 = 478f7f987874c5d0
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f55008b077e9d6c7
	setx	0xa7f9de502bae4ac4,%g7,%l0 ! %l0 = a7f9de502bae4ac4
!	%l1 = 478f7f987874c5d0
	setx	0xdc66cd4846e991f6,%g7,%l1 ! %l1 = dc66cd4846e991f6
!	Mem[0000000010141434] = ff05b230, %l1 = dc66cd4846e991f6
	ldswa	[%i5+0x034]%asi,%l1	! %l1 = ffffffffff05b230
!	Mem[000000001014143c] = 5a1777c9, %l4 = 0000000000000084
	lduwa	[%i5+0x03c]%asi,%l4	! %l4 = 000000005a1777c9
!	Mem[00000000300c1410] = 84ff00ed, %l5 = 0000000090990867
	ldswa	[%i3+%o5]0x81,%l5	! %l5 = ffffffff84ff00ed
!	Mem[0000000010181410] = a3b2087f, %l1 = ffffffffff05b230
	ldsha	[%i6+%o5]0x88,%l1	! %l1 = 000000000000087f
!	Mem[0000000030081410] = e07873cf, %l1 = 000000000000087f
	lduwa	[%i2+%o5]0x81,%l1	! %l1 = 00000000e07873cf
!	Mem[0000000030181408] = 57c4ad74, %l4 = 000000005a1777c9
	ldsha	[%i6+%o4]0x81,%l4	! %l4 = 00000000000057c4
!	Mem[0000000030141410] = 00004bcd, %l5 = ffffffff84ff00ed
	lduba	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 000000006630a23d, %l6 = 17fb3e878cae450e
	ldxa	[%i1+%o4]0x88,%l6	! %l6 = 000000006630a23d
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 005500ff, %l2 = 00000000baffffff
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 00000000005500ff

p0_label_64:
!	%l2 = 00000000005500ff, Mem[00000000218001c0] = 3cffa92c, %asi = 80
	stba	%l2,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = ffffa92c
!	%l2 = 00000000005500ff, Mem[0000000030141408] = 0000f40000003fba
	stxa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000005500ff
!	%f16 = 79415f86 9a6afae2, Mem[0000000030041408] = ffbfffff ffffffff
	stda	%f16,[%i1+%o4]0x81	! Mem[0000000030041408] = 79415f86 9a6afae2
!	%l0 = 2bae4ac4, %l1 = e07873cf, Mem[0000000010001400] = 000000ff 00000000
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 2bae4ac4 e07873cf
!	Mem[0000000010141424] = d81e8e7f, %l6 = 000000006630a23d
	swap	[%i5+0x024],%l6		! %l6 = 00000000d81e8e7f
!	%f2  = ba3f0000 00f40000, Mem[0000000030141400] = 3da23066 00000000
	stda	%f2 ,[%i5+%g0]0x81	! Mem[0000000030141400] = ba3f0000 00f40000
!	%l2 = 00000000005500ff, Mem[0000000010181410] = 7f08b2a31f1908ba
	stxa	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000005500ff
!	%l3 = 0000000000000000, Mem[0000000010081424] = e8e0918e
	stw	%l3,[%i2+0x024]		! Mem[0000000010081424] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010041410] = b706ff84
	stwa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ed00ff84, %l2 = 00000000005500ff
	lduha	[%i3+%o5]0x89,%l2	! %l2 = 000000000000ff84

p0_label_65:
!	Mem[000000001004140c] = 00000000, %l1 = 00000000e07873cf
	lduha	[%i1+0x00e]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800140] = 00ba8361, %l2 = 000000000000ff84
	ldsb	[%o3+0x140],%l2		! %l2 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l3 = 0000000000000000
	lduha	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 76b4c833, %l6 = 00000000d81e8e7f
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = ffffffffffffc833
!	Mem[0000000020800000] = ffff348e, %l6 = ffffffffffffc833
	ldub	[%o1+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = ffffffbaffdd74b0, %l0 = a7f9de502bae4ac4
	ldxa	[%i3+%o5]0x80,%l0	! %l0 = ffffffbaffdd74b0
!	Mem[0000000010181418] = 97024892 6621fdd3, %l0 = ffdd74b0, %l1 = 00000000
	ldda	[%i6+0x018]%asi,%l0	! %l0 = 0000000097024892 000000006621fdd3
!	Mem[0000000010181428] = d2d5e5bfffffffba, %f10 = 24ac1d59 70c6a1ee
	ldd	[%i6+0x028],%f10	! %f10 = d2d5e5bf ffffffba
!	Mem[0000000010081438] = 54ffcedb, %l4 = 00000000000057c4
	lduh	[%i2+0x03a],%l4		! %l4 = 000000000000cedb
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ff8486d9, %l4 = 000000000000cedb
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 00000084000000ff

p0_label_66:
!	%l0 = 97024892, %l1 = 6621fdd3, Mem[0000000010101410] = a2183ee0 1d0a2374
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 97024892 6621fdd3
!	%l7 = 000000000000003e, Mem[0000000030181408] = 000000ff74adc457
	stxa	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000000000003e
!	%l7 = 000000000000003e, Mem[0000000030001408] = 60f57bb5
	stwa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000003e
!	Mem[0000000010141400] = 00000000, %l2 = 0000000000000000, %asi = 80
	swapa	[%i5+0x000]%asi,%l2	! %l2 = 0000000000000000
!	%f28 = b3eeb920 00000000, Mem[0000000010001428] = fbb4d3ba e31fe211
	std	%f28,[%i0+0x028]	! Mem[0000000010001428] = b3eeb920 00000000
!	%l7 = 000000000000003e, Mem[0000000010041400] = 5b38000000000000
	stxa	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000000003e
!	%l4 = 0000000000000084, Mem[0000000010141408] = ed00ff84
	stwa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000084
!	%l2 = 0000000000000000, Mem[0000000010141410] = 00000000
	stwa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%f24 = 24ac00ff, %f22 = 00000000
	fitos	%f24,%f22		! %f22 = 4e12b004
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 3da2306600000000, %f18 = 00000000 4b2b84c7
	ldda	[%i1+%o4]0x80,%f18	! %f18 = 3da23066 00000000

p0_label_67:
!	Mem[0000000010081408] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	%l1 = 000000006621fdd3, immd = fffffffffffff156, %l1 = 000000006621fdd3
	sdivx	%l1,-0xeaa,%l1		! %l1 = fffffffffff90901
!	Mem[0000000030181408] = 3e000000, %l7 = 000000000000003e
	ldsba	[%i6+%o4]0x81,%l7	! %l7 = 000000000000003e
!	Mem[0000000021800000] = 958541b9, %l6 = 0000000000000000
	ldub	[%o3+%g0],%l6		! %l6 = 0000000000000095
!	Mem[0000000030041408] = 79415f86, %l2 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = 0000000000007941
!	Mem[0000000030041410] = e060f400, %l4 = 0000000000000084
	lduba	[%i1+%o5]0x81,%l4	! %l4 = 00000000000000e0
!	Mem[0000000010181424] = 00e8fcdc, %l5 = 0000000000000000
	ldswa	[%i6+0x024]%asi,%l5	! %l5 = 0000000000e8fcdc
!	Mem[0000000010001410] = e03e18a205fff4f3, %f30 = ba08191f a3b2087f
	ldda	[%i0+%o5]0x88,%f30	! %f30 = e03e18a2 05fff4f3
!	Mem[0000000010041400] = 0000003e, %l1 = fffffffffff90901
	lduba	[%i1+%g0]0x88,%l1	! %l1 = 000000000000003e
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 84000000, %l5 = 00e8fcdc, %l3 = 00000000
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 0000000084000000

p0_label_68:
!	Mem[0000000030141410] = cd4b0000, %l0 = 0000000097024892
	lduba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%f26 = 00000000 00000000, %l1 = 000000000000003e
!	Mem[0000000030081410] = e07873cffdffffff
	add	%i2,0x010,%g1
	stda	%f26,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030081410] = e07873cf00000000
!	Mem[0000000010101400] = 1be00eb4, %l7 = 000000000000003e
	swapa	[%i4+%g0]0x80,%l7	! %l7 = 000000001be00eb4
!	Mem[000000001014143e] = 5a1777c9, %l3 = 0000000084000000
	ldstub	[%i5+0x03e],%l3		! %l3 = 00000077000000ff
!	Mem[0000000010001408] = 84000000, %l3 = 0000000000000077
	ldstuba	[%i0+%o4]0x80,%l3	! %l3 = 00000084000000ff
!	%f20 = 00000000 bad3b4fb, Mem[00000000300c1410] = ed00ff84 e9975924
	stda	%f20,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 bad3b4fb
!	%f26 = 00000000 00000000, Mem[0000000010001408] = ff000000 00000000
	stda	%f26,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 00000000
!	%l0 = 0000000000000000, Mem[0000000010181400] = 4b2b84c7
	stwa	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ffc6a1ee, %l5 = 0000000000e8fcdc
	lduwa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ffc6a1ee

p0_label_69:
!	Mem[0000000030081410] = e07873cf, %l7 = 000000001be00eb4
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffffffe0
!	Mem[00000000100c1410] = ffffffba, %l1 = 000000000000003e
	lduba	[%i3+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101408] = d63973fc, %f30 = e03e18a2
	lda	[%i4+%o4]0x88,%f30	! %f30 = d63973fc
!	Mem[0000000021800140] = 00ba8361, %l7 = ffffffffffffffe0
	ldsba	[%o3+0x141]%asi,%l7	! %l7 = ffffffffffffffba
!	Mem[0000000030041400] = fe8b1cf7 7f08b2a3, %l2 = 00007941, %l3 = 00000084
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 000000007f08b2a3 00000000fe8b1cf7
!	Mem[0000000030041410] = e060f400, %l2 = 000000007f08b2a3
	ldswa	[%i1+%o5]0x81,%l2	! %l2 = ffffffffe060f400
!	Mem[0000000010181410] = ff000000, %l4 = 00000000000000e0
	ldsba	[%i6+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	%l7 = ffffffffffffffba, immd = fffffffffffff463, %l7 = ffffffffffffffba
	udivx	%l7,-0xb9d,%l7		! %l7 = 0000000000000001
!	Mem[0000000030181410] = f6efe078, %l4 = ffffffffffffffff
	ldswa	[%i6+%o5]0x89,%l4	! %l4 = fffffffff6efe078
!	Starting 10 instruction Store Burst
!	%f30 = d63973fc, %f25 = 70c6a1ee, %f6  = 57c4ad74 b57bf560
	fsmuld	%f30,%f25,%f6 		! %f6  = c8f1fca0 686a0900

p0_label_70:
!	%f2  = ba3f0000 00f40000, Mem[0000000010141410] = 00000000 00000000
	stda	%f2 ,[%i5+%o5]0x80	! Mem[0000000010141410] = ba3f0000 00f40000
!	%l2 = e060f400, %l3 = fe8b1cf7, Mem[0000000010181408] = fffffff2 5e599458
	std	%l2,[%i6+%o4]		! Mem[0000000010181408] = e060f400 fe8b1cf7
!	%l5 = 00000000ffc6a1ee, Mem[0000000030081408] = ff004bcd
	stba	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = ee004bcd
!	Mem[0000000010181438] = 0000d5560000ff05, %l5 = 00000000ffc6a1ee, %l6 = 0000000000000095
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 0000d5560000ff05
!	Mem[0000000030101408] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030181400] = ff0000ff
	stha	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff
!	%f24 = 24ac00ff 70c6a1ee, Mem[0000000010181428] = d2d5e5bf ffffffba
	stda	%f24,[%i6+0x028]%asi	! Mem[0000000010181428] = 24ac00ff 70c6a1ee
!	%f3  = 00f40000, %f13 = 00000000, %f8  = bfb9b1e8
	fmuls	%f3 ,%f13,%f8 		! %f8  = 00000000
!	%l2 = e060f400, %l3 = fe8b1cf7, Mem[0000000010081410] = 9099ffff e03e18a2
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = e060f400 fe8b1cf7
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffff348e, %l4 = fffffffff6efe078
	ldsh	[%o1+%g0],%l4		! %l4 = ffffffffffffffff

p0_label_71:
!	Mem[0000000010041400] = 0000003e, %l2 = ffffffffe060f400
	ldswa	[%i1+%g0]0x88,%l2	! %l2 = 000000000000003e
!	Mem[0000000030001408] = 3e000000, %l7 = 0000000000000001
	lduha	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141408] = ff00550000000000, %f0  = ba08191f d0c4c18f
	ldda	[%i5+%o4]0x81,%f0 	! %f0  = ff005500 00000000
!	Mem[0000000030141408] = 005500ff, %l7 = 0000000000000000
	lduba	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f28 = b3eeb920, %f10 = d2d5e5bf, %f27 = 00000000
	fmuls	%f28,%f10,%f27		! %f27 = 47477645
!	Mem[0000000030041410] = e060f400, %l4 = ffffffffffffffff
	lduba	[%i1+%o5]0x81,%l4	! %l4 = 00000000000000e0
!	Mem[00000000100c143c] = b63ebb65, %l6 = 0000d5560000ff05
	ldswa	[%i3+0x03c]%asi,%l6	! %l6 = ffffffffb63ebb65
!	Mem[0000000010041410] = d89af845 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000 00000000d89af845
!	Mem[0000000010001400] = c44aae2b, %l6 = ffffffffb63ebb65
	ldswa	[%i0+%g0]0x80,%l6	! %l6 = ffffffffc44aae2b
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000000, %l4 = 00000000000000e0
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_72:
!	%l4 = 0000000000000000, Mem[0000000030101400] = eea1c6ff
	stha	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = eea10000
!	%f6  = c8f1fca0 686a0900, Mem[0000000010141400] = 00000000 4d2406d9
	stda	%f6 ,[%i5+%g0]0x80	! Mem[0000000010141400] = c8f1fca0 686a0900
!	Mem[00000000300c1408] = d399d5e0, %l0 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 00000000d399d5e0
!	%l2 = 000000000000003e, Mem[0000000030001408] = 3e000000
	stha	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 3e00003e
!	Mem[00000000100c1424] = c3bb6069, %l3 = fe8b1cf7, %l1 = d89af845
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 00000000c3bb6069
!	%f29 = 00000000, Mem[00000000100c1438] = 000000ba
	st	%f29,[%i3+0x038]	! Mem[00000000100c1438] = 00000000
!	Mem[0000000030101408] = 000000ff, %l2 = 000000000000003e
	ldstuba	[%i4+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010141400] = c8f1fca0
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff
!	Mem[0000000010081428] = 6630a23d, %l5 = 00000000ffc6a1ee
	ldstub	[%i2+0x028],%l5		! %l5 = 00000066000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = fbb4d3ba, %l7 = 00000000000000ff
	ldswa	[%i3+%o5]0x81,%l7	! %l7 = fffffffffbb4d3ba

p0_label_73:
!	%l0 = 00000000d399d5e0, %l5 = 0000000000000066, %l5 = 0000000000000066
	or	%l0,%l5,%l5		! %l5 = 00000000d399d5e6
!	Mem[0000000010081410] = fe8b1cf7e060f400, %f14 = c977175a 37af2871
	ldda	[%i2+%o5]0x88,%f14	! %f14 = fe8b1cf7 e060f400
!	Mem[0000000010181400] = e0000000, %l3 = 00000000fe8b1cf7
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffe000
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000030101400] = 0000a1ee 0cae2517 ff000000 ff0000ff
!	Mem[0000000030101410] = 00000000 00001501 facee6f6 11317c96
!	Mem[0000000030101420] = bd23ccf3 0cae2517 582a48b4 b0d443f4
!	Mem[0000000030101430] = 97f0269d 99d0c51c c763fbdb a3b2087f
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[0000000030141408] = 005500ff, %l0 = 00000000d399d5e0
	lduba	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041400] = 3e000000, %l5 = 00000000d399d5e6
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000003e00
!	Mem[0000000010001400] = e07873cf2bae4ac4, %f22 = 4e12b004 00000000
	ldda	[%i0+%g0]0x88,%f22	! %f22 = e07873cf 2bae4ac4
!	Mem[0000000010081410] = 00f460e0, %l1 = 00000000c3bb6069
	ldsha	[%i2+%o5]0x80,%l1	! %l1 = 00000000000000f4
!	Mem[00000000300c1410] = bad3b4fb, %l5 = 0000000000003e00
	ldswa	[%i3+%o5]0x89,%l5	! %l5 = ffffffffbad3b4fb
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = e07873cf, %l1 = 00000000000000f4
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 000000e0000000ff

p0_label_74:
!	%f26 = 00000000 47477645, Mem[0000000030141410] = 00004bcd 20b9eeb3
	stda	%f26,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 47477645
!	%f22 = e07873cf 2bae4ac4, Mem[0000000010001428] = b3eeb920 00000000
	std	%f22,[%i0+0x028]	! Mem[0000000010001428] = e07873cf 2bae4ac4
!	%l1 = 00000000000000e0, Mem[0000000030181408] = 3e00000000000000
	stxa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000000000e0
!	%f20 = 00000000, Mem[00000000100c1400] = dbfb63ff
	sta	%f20,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%l6 = ffffffffc44aae2b, Mem[0000000030141410] = 00000000
	stwa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = c44aae2b
!	Mem[0000000030101410] = 00000000, %l6 = ffffffffc44aae2b
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081438] = 54ffcedb, %l3 = ffffffffffffe000, %asi = 80
	swapa	[%i2+0x038]%asi,%l3	! %l3 = 0000000054ffcedb
!	Mem[0000000010081400] = 000000ff, %l7 = fffffffffbb4d3ba
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l5 = ffffffffbad3b4fb, Mem[0000000010041408] = 6630a23d
	stba	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 6630a2fb
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00f460e0, %f28 = b3eeb920
	lda	[%i6+%o4]0x88,%f28	! %f28 = 00f460e0

p0_label_75:
!	Mem[0000000021800040] = f1679f3e, %l3 = 0000000054ffcedb
	ldsha	[%o3+0x040]%asi,%l3	! %l3 = fffffffffffff167
!	Mem[0000000030141408] = 005500ff, %l6 = 0000000000000000
	lduba	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l1 = 00000000000000e0, %l6 = 00000000000000ff, %l0 = 00000000000000ff
	xnor	%l1,%l6,%l0		! %l0 = ffffffffffffffe0
!	Mem[0000000010001400] = c44aae2b, %l7 = 00000000000000ff
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000c4
!	Mem[00000000100c1400] = 00000000a3b2087f, %f28 = 00f460e0 00000000
	ldda	[%i3+%g0]0x80,%f28	! %f28 = 00000000 a3b2087f
!	Mem[0000000030101400] = 0000a1ee, %f16 = 79415f86
	lda	[%i4+%g0]0x81,%f16	! %f16 = 0000a1ee
!	Mem[0000000030141400] = ba3f0000, %l6 = 00000000000000ff
	ldswa	[%i5+%g0]0x81,%l6	! %l6 = ffffffffba3f0000
!	Mem[0000000010001408] = 00000000, %l6 = ffffffffba3f0000
	ldswa	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 00003fba, %l7 = 00000000000000c4
	lduba	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ba
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010181400] = e0000000
	stha	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00ff0000

p0_label_76:
!	Mem[0000000030041410] = e060f400, %l1 = 00000000000000e0
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 000000e0000000ff
!	Mem[0000000030041410] = ff60f400, %l7 = 00000000000000ba
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[00000000300c1400] = 33c8b476
	stha	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00ffb476
!	%l0 = ffffffffffffffe0, Mem[0000000010141410] = ba3f0000
	stw	%l0,[%i5+%o5]		! Mem[0000000010141410] = ffffffe0
!	%f16 = 0000a1ee 9a6afae2, %l6 = 0000000000000000
!	Mem[00000000100c1430] = 0000000070c6a1ee
	add	%i3,0x030,%g1
	stda	%f16,[%g1+%l6]ASI_PST16_P ! Mem[00000000100c1430] = 0000000070c6a1ee
!	%l5 = ffffffffbad3b4fb, Mem[0000000030001408] = 3e00003e
	stwa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = bad3b4fb
!	Mem[00000000300c1400] = 00ffb476, %l2 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 0000000000ffb476
!	%f24 = 24ac00ff, Mem[0000000010041428] = 74186c63
	sta	%f24,[%i1+0x028]%asi	! Mem[0000000010041428] = 24ac00ff
!	%l4 = 00000000, %l5 = bad3b4fb, Mem[0000000010081400] = bad3b4fb 57c4ad74
	stda	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 bad3b4fb
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000030181400] = 000000ff cd4b9348 00000000 000000e0
!	Mem[0000000030181410] = 78e0eff6 565a5500 0023dad6 5cc25743
!	Mem[0000000030181420] = a84e0b63 1d1dc301 69d9ce35 1290ffbd
!	Mem[0000000030181430] = 5ae411ed 4b5320ef 1d946a3b d5f95bae
	ldda	[%i6]ASI_BLK_S,%f0	! Block Load from 0000000030181400

p0_label_77:
!	Mem[00000000100c1408] = ff001501, %l5 = ffffffffbad3b4fb
	ldsha	[%i3+%o4]0x80,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010001400] = 2bae4ac4, %l3 = fffffffffffff167
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = ffffffffffffffc4
!	Mem[0000000030181410] = f6efe078, %l2 = 0000000000ffb476
	lduwa	[%i6+%o5]0x89,%l2	! %l2 = 00000000f6efe078
!	Mem[0000000010181410] = ff005500000000ff, %f30 = d63973fc 05fff4f3
	ldda	[%i6+%o5]0x88,%f30	! %f30 = ff005500 000000ff
!	Mem[0000000010101408] = fc7339d6, %l3 = ffffffffffffffc4
	ldsha	[%i4+%o4]0x80,%l3	! %l3 = fffffffffffffc73
!	Mem[00000000100c1410] = baffffff, %l0 = ffffffffffffffe0
	lduba	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041408] = 865f4179, %f19 = 00000000
	lda	[%i1+%o4]0x89,%f19	! %f19 = 865f4179
!	Mem[0000000010081410] = e060f400, %l4 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 000000000000f400
!	Mem[0000000030081400] = 00000000, %l4 = 000000000000f400
	ldswa	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 00000000, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000

p0_label_78:
!	%l7 = 00000000000000ff, Mem[00000000211c0000] = 99ff217a, %asi = 80
	stba	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff217a
!	%l1 = 00000000000000e0, Mem[0000000030081400] = 00000000
	stha	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000e0
!	%f28 = 00000000 a3b2087f, Mem[00000000300c1400] = 000000ff fe8b1cf7
	stda	%f28,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 a3b2087f
	membar	#Sync			! Added by membar checker (15)
!	%l2 = 00000000f6efe078, Mem[0000000030181400] = ff000000
	stba	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = ff000078
!	Mem[0000000030141400] = 00003fba, %l4 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 0000000000003fba
!	Mem[0000000030081410] = cf7378ff, %l4 = 0000000000003fba
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[00000000100c1410] = ffffffbaffdd74b0
	stxa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000000000ff
!	%f0  = 000000ff cd4b9348 00000000 000000e0
!	%f4  = 78e0eff6 565a5500 0023dad6 5cc25743
!	%f8  = a84e0b63 1d1dc301 69d9ce35 1290ffbd
!	%f12 = 5ae411ed 4b5320ef 1d946a3b d5f95bae
	stda	%f0,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = d63973fc, %l5 = ffffffffffffff00
	lduwa	[%i4+%o4]0x88,%l5	! %l5 = 00000000d63973fc

p0_label_79:
!	Mem[0000000010141400] = 00096a68ff000000, %l7 = 00000000000000ff
	ldxa	[%i5+%g0]0x88,%l7	! %l7 = 00096a68ff000000
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000030181400] = 000000ff, %f29 = a3b2087f
	lda	[%i6+%g0]0x81,%f29	! %f29 = 000000ff
!	Mem[00000000201c0000] = ffff86d9, %l4 = 00000000000000ff
	ldsh	[%o0+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010001410] = f3f4ff05 a2183ee0, %l0 = 000000ff, %l1 = 000000e0
	ldd	[%i0+%o5],%l0		! %l0 = 00000000f3f4ff05 00000000a2183ee0
!	Mem[0000000010181400] = 0000ff00, %l7 = 00096a68ff000000
	ldsha	[%i6+%g0]0x88,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030181408] = 00000000 000000e0, %l2 = f6efe078, %l3 = fffffc73
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000 00000000000000e0
!	Mem[0000000030081408] = ee004bcd, %l2 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l2	! %l2 = 000000000000ee00
!	Mem[0000000030101400] = 0000a1ee, %f14 = 1d946a3b
	lda	[%i4+%g0]0x81,%f14	! %f14 = 0000a1ee
!	Mem[0000000030041410] = 00f460ff, %l5 = 00000000d63973fc
	ldsha	[%i1+%o5]0x89,%l5	! %l5 = 00000000000060ff
!	Starting 10 instruction Store Burst
!	%f21 = bad3b4fb, Mem[000000001008143c] = edcc3a97
	sta	%f21,[%i2+0x03c]%asi	! Mem[000000001008143c] = bad3b4fb

p0_label_80:
!	%l5 = 00000000000060ff, Mem[0000000010181400] = 00ff0000
	stwa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 000060ff
!	Mem[00000000100c1400] = 00000000, %l0 = 00000000f3f4ff05
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[00000000100c1400] = ff000000a3b2087f
	stxa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000000
!	%l5 = 00000000000060ff, Mem[0000000010001408] = 00000000
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000
!	%l1 = 00000000a2183ee0, Mem[0000000020800000] = ffff348e
	sth	%l1,[%o1+%g0]		! Mem[0000000020800000] = 3ee0348e
!	%f8  = a84e0b63, Mem[0000000030141400] = 00000000
	sta	%f8 ,[%i5+%g0]0x89	! Mem[0000000030141400] = a84e0b63
!	%l3 = 00000000000000e0, Mem[0000000010041410] = 00000000
	stba	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000e0
!	Mem[000000001014143c] = 5a17ffc9, %l3 = 00000000000000e0, %asi = 80
	swapa	[%i5+0x03c]%asi,%l3	! %l3 = 000000005a17ffc9
!	%l4 = ffffffff, %l5 = 000060ff, Mem[0000000010001408] = ff000000 00000000
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff 000060ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = e000000000000000, %f6  = 0023dad6 5cc25743
	ldda	[%i6+%o4]0x89,%f6 	! %f6  = e0000000 00000000

p0_label_81:
!	Mem[0000000030141408] = ff005500, %l2 = 000000000000ee00
	ldsha	[%i5+%o4]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010001408] = ff600000ffffffff, %f6  = e0000000 00000000
	ldda	[%i0+%o4]0x88,%f6 	! %f6  = ff600000 ffffffff
!	Mem[00000000201c0000] = ffff86d9, %l5 = 00000000000060ff
	lduba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081400] = 00000000fbb4d3ba, %l0 = 0000000000000000
	ldxa	[%i2+0x000]%asi,%l0	! %l0 = 00000000fbb4d3ba
!	Mem[0000000010101400] = 3e000000, %l6 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l2 = ffffffffffffff00
	ldswa	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	lduha	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = f3f4ff05 a2183ee0, %l0 = fbb4d3ba, %l1 = a2183ee0
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 00000000f3f4ff05 00000000a2183ee0
!	Mem[0000000010041434] = 87ff69a8, %l6 = 0000000000000000
	ldsw	[%i1+0x034],%l6		! %l6 = ffffffff87ff69a8
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 00000000f3f4ff05
	setx	0x4f074407c10bf054,%g7,%l0 ! %l0 = 4f074407c10bf054
!	%l1 = 00000000a2183ee0
	setx	0xa6e6f1c7bbe8f128,%g7,%l1 ! %l1 = a6e6f1c7bbe8f128
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4f074407c10bf054
	setx	0xe2db7c4f92461f9c,%g7,%l0 ! %l0 = e2db7c4f92461f9c
!	%l1 = a6e6f1c7bbe8f128
	setx	0x324d4d2062d75077,%g7,%l1 ! %l1 = 324d4d2062d75077

p0_label_82:
!	Mem[0000000010081404] = fbb4d3ba, %l7 = ffffff00, %l6 = 87ff69a8
	add	%i2,0x04,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 00000000fbb4d3ba
!	Mem[0000000010081400] = 00000000, %l0 = e2db7c4f92461f9c
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000fbb4d3ba, Mem[0000000010141408] = 00000084
	stba	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ba
!	%l7 = ffffffffffffff00, Mem[0000000030081400] = 000000e0
	stba	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = 3e000000, %l5 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l6 = fbb4d3ba, %l7 = ffffff00, Mem[0000000010081420] = 6528f8e2 00000000
	stda	%l6,[%i2+0x020]%asi	! Mem[0000000010081420] = fbb4d3ba ffffff00
!	%f26 = 00000000 47477645, %l3 = 000000005a17ffc9
!	Mem[0000000030181430] = 5ae411ed4b5320ef
	add	%i6,0x030,%g1
	stda	%f26,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030181430] = 457647474b5320ef
!	%f28 = 00000000 000000ff, %l7 = ffffffffffffff00
!	Mem[00000000100c1408] = ff001501ba1cf28d
	add	%i3,0x008,%g1
	stda	%f28,[%g1+%l7]ASI_PST16_PL ! Mem[00000000100c1408] = ff001501ba1cf28d
!	Starting 10 instruction Load Burst
!	Mem[0000000010041424] = 000000c7, %l2 = 0000000000000000
	ldsh	[%i1+0x026],%l2		! %l2 = 00000000000000c7

p0_label_83:
!	Mem[0000000010141400] = 000000ff686a0900, %f18 = 3da23066 865f4179
	ldda	[%i5+%g0]0x80,%f18	! %f18 = 000000ff 686a0900
!	Mem[0000000010001408] = ff600000 ffffffff, %l2 = 000000c7, %l3 = 5a17ffc9
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 00000000ffffffff 00000000ff600000
!	Mem[0000000030081410] = ff7873cf, %l1 = 324d4d2062d75077
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 000000000000ff78
!	Mem[00000000100c1408] = 011500ff, %l4 = ffffffffffffffff
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 00000000011500ff
!	Mem[00000000300c1410] = fbb4d3ba 00000000, %l6 = fbb4d3ba, %l7 = ffffff00
	ldda	[%i3+%o5]0x81,%l6	! %l6 = 00000000fbb4d3ba 0000000000000000
!	Mem[0000000030041400] = a3b2087f, %f10 = 69d9ce35
	lda	[%i1+%g0]0x81,%f10	! %f10 = a3b2087f
!	Mem[0000000010141410] = ffffffe000f40000, %f10 = a3b2087f 1290ffbd
	ldda	[%i5+%o5]0x80,%f10	! %f10 = ffffffe0 00f40000
!	Mem[0000000030041400] = a3b2087f, %l3 = 00000000ff600000
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 00000000a3b2087f
!	Mem[0000000010181414] = 005500ff, %f10 = ffffffe0
	lda	[%i6+0x014]%asi,%f10	! %f10 = 005500ff
!	Starting 10 instruction Store Burst
!	%f29 = 000000ff, Mem[0000000030141400] = 630b4ea8
	sta	%f29,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff

p0_label_84:
!	%f14 = 0000a1ee d5f95bae, Mem[0000000030141400] = ff000000 0000f400
	stda	%f14,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000a1ee d5f95bae
!	%f22 = e07873cf 2bae4ac4, Mem[0000000030001400] = baffffff 13000000
	stda	%f22,[%i0+%g0]0x89	! Mem[0000000030001400] = e07873cf 2bae4ac4
!	%l3 = 00000000a3b2087f, Mem[0000000010081410] = 00f460e0
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = a3b2087f
!	%l2 = 00000000ffffffff, Mem[0000000030141410] = c44aae2b
	stwa	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff
!	%l5 = 0000000000000000, %l0 = 0000000000000000, %l5 = 0000000000000000
	udivx	%l5,%l0,%l5		! %l5 = 0000000000000000
!	%l1 = 000000000000ff78, Mem[0000000030001408] = bad3b4fb
	stwa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000ff78
!	%l7 = 0000000000000000, Mem[0000000010041408] = 000000006630a2fb
	stxa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	%f26 = 00000000, Mem[0000000030041400] = 7f08b2a3
	sta	%f26,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	Mem[0000000010181400] = ff600000, %l6 = 00000000fbb4d3ba
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 00000000ff600000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff000000, %f29 = 000000ff
	lda	[%i6+%o5]0x80,%f29	! %f29 = ff000000

p0_label_85:
!	Mem[0000000010181418] = 970248926621fdd3, %f24 = 24ac00ff 70c6a1ee
	ldda	[%i6+0x018]%asi,%f24	! %f24 = 97024892 6621fdd3
!	Mem[0000000030081408] = cd4b00ee, %l6 = 00000000ff600000
	lduha	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ee
!	Mem[000000001018142c] = 70c6a1ee, %l0 = 0000000000000028
	lduw	[%i6+0x02c],%l0		! %l0 = 0000000070c6a1ee
!	Mem[0000000030101410] = ff000000, %l1 = 000000000000ff78
	lduha	[%i4+%o5]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000030181400] = 48934bcdff000000, %l7 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l7	! %l7 = 48934bcdff000000
!	Mem[00000000300c1400] = 000000ff, %l6 = 00000000000000ee
	ldsba	[%i3+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030041400] = 00000000, %f2  = 00000000
	lda	[%i1+%g0]0x89,%f2 	! %f2 = 00000000
!	Mem[000000001004143c] = 23e59b95, %l3 = 00000000a3b2087f
	ldswa	[%i1+0x03c]%asi,%l3	! %l3 = 0000000023e59b95
!	%l0 = 0000000070c6a1ee, immd = fffffffffffff7dc, %l0 = 0000000070c6a1ee
	sdivx	%l0,-0x824,%l0		! %l0 = fffffffffff22583
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ffffffff, Mem[0000000030041400] = 00000000
	stwa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff

p0_label_86:
!	Mem[0000000030001410] = 00000000, %l7 = 48934bcdff000000
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%l2 = 00000000ffffffff, Mem[0000000010001400] = 2bae4ac4
	stwa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffff
!	Mem[0000000030041410] = ff60f400, %l7 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030041410] = ff60f400, %l0 = fffffffffff22583
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%l2 = 00000000ffffffff, Mem[0000000030101408] = 000000ff
	stba	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff
!	Mem[0000000010101410] = 97024892, %l5 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l5	! %l5 = 0000000097024892
!	%l5 = 0000000097024892, Mem[0000000021800181] = c6d0c576, %asi = 80
	stba	%l5,[%o3+0x181]%asi	! Mem[0000000021800180] = c692c576
!	%f14 = 0000a1ee d5f95bae, Mem[0000000030081410] = ff7873cf 00000000
	stda	%f14,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000a1ee d5f95bae
!	%l5 = 0000000097024892, Mem[0000000030141408] = ff005500
	stha	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 48925500
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000ff, %l7 = 00000000000000ff
	ldsha	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff

p0_label_87:
!	Mem[000000001014140c] = 00000000, %l6 = ffffffffffffffff
	lduh	[%i5+0x00c],%l6		! %l6 = 0000000000000000
!	Mem[00000000201c0000] = ffff86d9, %l6 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101414] = d3fd2166, %l4 = 00000000011500ff
	lduh	[%i4+0x016],%l4		! %l4 = 0000000000002166
!	Mem[00000000300c1408] = 00000000, %l6 = 00000000000000ff
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000097024892
	ldsha	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = 00000000 000000e0, %l2 = ffffffff, %l3 = 23e59b95
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000 00000000000000e0
!	Mem[00000000300c1410] = 00000000 bad3b4fb, %l0 = 000000ff, %l1 = 0000ff00
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 00000000bad3b4fb 0000000000000000
!	%f28 = 00000000, %f7  = ffffffff
	fcmpes	%fcc1,%f28,%f7 		! %fcc1 = 3
!	Mem[0000000030001408] = 0000ff78, %l0 = 00000000bad3b4fb
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 000000ff, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000ff

p0_label_88:
!	%l7 = 00000000000000ff, Mem[000000001008140e] = 0fc0385b, %asi = 80
	stba	%l7,[%i2+0x00e]%asi	! Mem[000000001008140c] = 0fc0ff5b
!	%l5 = 00000000000000ff, Mem[0000000010141408] = ba000000, %asi = 80
	stba	%l5,[%i5+0x008]%asi	! Mem[0000000010141408] = ff000000
!	%f0  = 000000ff cd4b9348, %l1 = 0000000000000000
!	Mem[0000000010081400] = 92461f9cfbb4d3ba
	stda	%f0,[%i2+%l1]ASI_PST16_P ! Mem[0000000010081400] = 92461f9cfbb4d3ba
!	Mem[0000000010181420] = 4de7eeb000e8fcdc, %l1 = 0000000000000000, %l0 = 0000000000000000
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 4de7eeb000e8fcdc
!	%l7 = 00000000000000ff, Mem[0000000010001435] = 88e7b230, %asi = 80
	stba	%l7,[%i0+0x035]%asi	! Mem[0000000010001434] = 88ffb230
!	%f30 = ff005500 000000ff, Mem[0000000010041400] = 0000003e 00000000
	stda	%f30,[%i1+%g0]0x88	! Mem[0000000010041400] = ff005500 000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010081438] = ffffe000 bad3b4fb
	stda	%l6,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000000 000000ff
!	%l5 = 00000000000000ff, Mem[0000000010101408] = fc7339d6
	stwa	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff
!	%f6  = ff600000 ffffffff, %l7 = 00000000000000ff
!	Mem[00000000300c1430] = e03e18a29ed0d98d
	add	%i3,0x030,%g1
	stda	%f6,[%g1+%l7]ASI_PST16_SL ! Mem[00000000300c1430] = ffffffff000060ff
!	Starting 10 instruction Load Burst
!	%l7 = 00000000000000ff, %l0 = 4de7eeb000e8fcdc, %l0 = 4de7eeb000e8fcdc
	udivx	%l7,%l0,%l0		! Div by zero, %l0 = 0000000000000028

p0_label_89:
!	Mem[0000000010101410] = 00000000d3fd2166, %l0 = 0000000000000000
	ldxa	[%i4+0x010]%asi,%l0	! %l0 = 00000000d3fd2166
!	Mem[0000000010141400] = 000000ff, %l5 = 00000000000000ff
	lduh	[%i5+0x002],%l5		! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = ff001501, %l6 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	%l6 = 000000000000ff00, immed = fffffba7, %y  = 00000000
	smul	%l6,-0x459,%l7		! %l7 = fffffffffbab5900, %y = ffffffff
!	Mem[0000000020800040] = 92bbd1fd, %l7 = fffffffffbab5900
	lduba	[%o1+0x041]%asi,%l7	! %l7 = 00000000000000bb
!	Mem[00000000100c1408] = ff001501, %l5 = 00000000000000ff
	lduha	[%i3+%o4]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[00000000100c1414] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i3+0x017]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000020800040] = 92bbd1fd, %l0 = 00000000d3fd2166
	ldsba	[%o1+0x041]%asi,%l0	! %l0 = ffffffffffffffbb
!	Mem[0000000010101408] = 000000ff e31fe211, %l4 = 00002166, %l5 = 0000ff00
	ldd	[%i4+%o4],%l4		! %l4 = 00000000000000ff 00000000e31fe211
!	Starting 10 instruction Store Burst
!	Mem[0000000010001439] = 67089990, %l4 = 00000000000000ff
	ldstub	[%i0+0x039],%l4		! %l4 = 00000008000000ff

p0_label_90:
!	Mem[000000001014140c] = 00000000, %l0 = ffffffbb, %l1 = ffffffff
	add	%i5,0x0c,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l4 = 0000000000000008
	swap	[%i4+%o5],%l4		! %l4 = 0000000000000000
!	%f31 = 000000ff, Mem[0000000010101400] = 3e0000ff
	sta	%f31,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	%f4  = 78e0eff6 565a5500, Mem[0000000030181410] = 78e0eff6 565a5500
	stda	%f4 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 78e0eff6 565a5500
!	%l0 = ffffffffffffffbb, Mem[0000000030081408] = ee004bcd
	stha	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = ffbb4bcd
!	%l1 = 0000000000000000, Mem[0000000010081408] = 00000000, %asi = 80
	stwa	%l1,[%i2+0x008]%asi	! Mem[0000000010081408] = 00000000
!	Mem[0000000030001408] = 78ff0000, %l4 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%f20 = 00000000 bad3b4fb, Mem[0000000030141400] = d5f95bae 0000a1ee
	stda	%f20,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 bad3b4fb
!	%f13 = 4b5320ef, Mem[0000000010141410] = ffffffe0
	sta	%f13,[%i5+%o5]0x80	! Mem[0000000010141410] = 4b5320ef
!	Starting 10 instruction Load Burst
!	%l0 = ffffffffffffffbb, imm = 00000000000005ae, %l5 = 00000000e31fe211
	orn	%l0,0x5ae,%l5		! %l5 = fffffffffffffffb

p0_label_91:
!	Mem[00000000100c1410] = 00000000, %l5 = fffffffffffffffb
	ldsba	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 78e0eff6, %l7 = 00000000000000bb
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000078
!	Mem[0000000030001408] = 78ff00ff, %l1 = 0000000000000000
	lduba	[%i0+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101410] = 00000008, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000008
!	Mem[0000000030081400] = 0000000000000000, %f16 = 0000a1ee 9a6afae2
	ldda	[%i2+%g0]0x89,%f16	! %f16 = 00000000 00000000
!	Mem[0000000010081408] = 00000000, %l4 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041434] = 87ff69a8, %l3 = 00000000000000e0
	ldsb	[%i1+0x034],%l3		! %l3 = ffffffffffffff87
!	Mem[0000000010141410] = ef20534b, %l1 = 00000000000000ff
	ldsba	[%i5+%o5]0x88,%l1	! %l1 = 000000000000004b
!	Mem[0000000010101420] = 79415f86, %l4 = 0000000000000000
	ldsh	[%i4+0x020],%l4		! %l4 = 0000000000007941
!	Starting 10 instruction Store Burst
!	%f3  = 000000e0, %f9  = 1d1dc301, %f8  = a84e0b63
	fadds	%f3 ,%f9 ,%f8 		! %l0 = ffffffffffffffdd, Unfinished, %fsr = 0b00000000

p0_label_92:
!	%l1 = 000000000000004b, Mem[0000000030041400] = ffffffff
	stwa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000004b
!	%l6 = 000000000000ff00, Mem[0000000010141400] = 000000ff
	stha	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = ff0000ff
!	%l0 = ffffffdd, %l1 = 0000004b, Mem[0000000010081408] = 00000000 5bffc00f
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffdd 0000004b
!	%f24 = 97024892 6621fdd3, Mem[0000000010041408] = 00000000 00000000
	stda	%f24,[%i1+%o4]0x88	! Mem[0000000010041408] = 97024892 6621fdd3
!	%l3 = ffffffffffffff87, Mem[0000000010041408] = d3fd2166
	stwa	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffff87
!	Mem[0000000010141410] = 4b5320ef, %l3 = ffffffffffffff87
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 0000004b000000ff
!	%l1 = 000000000000004b, Mem[000000001014143e] = 000000e0, %asi = 80
	stha	%l1,[%i5+0x03e]%asi	! Mem[000000001014143c] = 0000004b
!	Mem[0000000010181408] = e060f400, %l3 = 000000000000004b
	swapa	[%i6+%o4]0x80,%l3	! %l3 = 00000000e060f400
!	Mem[0000000010101400] = ff000000, %l3 = 00000000e060f400
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 92461f9c, %f23 = 2bae4ac4
	lda	[%i2+%g0]0x80,%f23	! %f23 = 92461f9c

p0_label_93:
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000000000008
	ldswa	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	%f14 = 0000a1ee, %f4  = 78e0eff6, %f25 = 6621fdd3
	fadds	%f14,%f4 ,%f25		! %l0 = ffffffffffffffff, Unfinished, %fsr = 0b00000000
!	Mem[0000000030181408] = 00000000, %l3 = 00000000ff000000
	ldsba	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041410] = 00f460ff, %l5 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = 0000000000f460ff
!	Mem[0000000030141410] = ffffffff47477645, %f10 = 005500ff 00f40000
	ldda	[%i5+%o5]0x81,%f10	! %f10 = ffffffff 47477645
!	Mem[00000000100c1434] = 70c6a1ee, %l0 = ffffffffffffffff
	lduba	[%i3+0x036]%asi,%l0	! %l0 = 00000000000000a1
!	%l4 = 0000000000007941, %l2 = 0000000000000000, %l5 = 0000000000f460ff
	udivx	%l4,%l2,%l5		! Div by zero, %l0 = 00000000000000f1
!	Mem[00000000211c0000] = ffff217a, %l5 = 0000000000f460ff
	ldsba	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000020800040] = 92bbd1fd, %l5 = ffffffffffffffff
	ldsh	[%o1+0x040],%l5		! %l5 = ffffffffffff92bb
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = f3f4ff05, %l1 = 000000000000004b
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 000000f3000000ff

p0_label_94:
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 00000000000000c9
	setx	0xd0fb04a0452edd1a,%g7,%l0 ! %l0 = d0fb04a0452edd1a
!	%l1 = 00000000000000f3
	setx	0x2012574868897f5a,%g7,%l1 ! %l1 = 2012574868897f5a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d0fb04a0452edd1a
	setx	0x853c56605735593e,%g7,%l0 ! %l0 = 853c56605735593e
!	%l1 = 2012574868897f5a
	setx	0xcaa83617ec8fe869,%g7,%l1 ! %l1 = caa83617ec8fe869
!	Mem[0000000030081408] = cd4bbbff, %l2 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 00000000cd4bbbff
!	%f16 = 00000000, Mem[00000000100c1434] = 70c6a1ee
	sta	%f16,[%i3+0x034]%asi	! Mem[00000000100c1434] = 00000000
!	%l4 = 00007941, %l5 = ffff92bb, Mem[0000000010141400] = ff0000ff 686a0900
	stda	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00007941 ffff92bb
!	%l1 = caa83617ec8fe869, Mem[0000000010081408] = 0000004bffffffdd
	stxa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = caa83617ec8fe869
!	%l1 = caa83617ec8fe869, Mem[0000000010081436] = 8cae450e
	stb	%l1,[%i2+0x036]		! Mem[0000000010081434] = 8cae690e
!	Mem[0000000010141408] = ff000000, %l3 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	%l6 = 0000ff00, %l7 = 00000078, Mem[0000000010181410] = ff000000 005500ff
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000ff00 00000078
!	%l4 = 0000000000007941, Mem[0000000030081400] = 00000000
	stba	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000041
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 05fff4ff, %f20 = 00000000
	lda	[%i0+%o5]0x88,%f20	! %f20 = 05fff4ff

p0_label_95:
!	Mem[0000000020800040] = 92bbd1fd, %l0 = 853c56605735593e
	ldsh	[%o1+0x040],%l0		! %l0 = ffffffffffff92bb
!	Mem[0000000010001410] = 05fff4ff, %l6 = 000000000000ff00
	lduha	[%i0+%o5]0x88,%l6	! %l6 = 000000000000f4ff
!	Mem[0000000030001408] = a85250fb 78ff00ff, %l0 = ffff92bb, %l1 = ec8fe869
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 0000000078ff00ff 00000000a85250fb
!	Mem[0000000010081410] = a3b2087f, %l7 = 0000000000000078
	lduwa	[%i2+%o5]0x80,%l7	! %l7 = 00000000a3b2087f
!	Mem[0000000030001408] = ff00ff78, %f13 = 4b5320ef
	lda	[%i0+%o4]0x81,%f13	! %f13 = ff00ff78
!	Mem[0000000021800000] = 958541b9, %l5 = ffffffffffff92bb
	lduha	[%o3+0x000]%asi,%l5	! %l5 = 0000000000009585
!	Mem[0000000020800040] = 92bbd1fd, %l5 = 0000000000009585
	ldsha	[%o1+0x040]%asi,%l5	! %l5 = ffffffffffff92bb
!	Mem[0000000010101400] = e060f400, %l2 = 00000000cd4bbbff
	ldswa	[%i4+%g0]0x80,%l2	! %l2 = ffffffffe060f400
!	Mem[000000001010140c] = e31fe211, %l2 = ffffffffe060f400
	ldub	[%i4+0x00c],%l2		! %l2 = 00000000000000e3
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 0000a1ee, %l1 = 00000000a85250fb
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000ff

p0_label_96:
!	Mem[0000000030181400] = 00000000, %l6 = 000000000000f4ff
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030001410] = 000000ff
	stha	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l4 = 0000000000007941, Mem[0000000030001400] = c44aae2bcf7378e0
	stxa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000007941
!	Mem[0000000010041400] = ff000000, %l4 = 0000000000007941
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 00000000ff000000
!	%l2 = 000000e3, %l3 = ff000000, Mem[0000000010181400] = fbb4d3ba 00000000
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000e3 ff000000
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000ff000000
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 00000008, %l4 = 00000000ff000000
	swap	[%i4+%o5],%l4		! %l4 = 0000000000000008
!	%l2 = 000000e3, %l3 = 00000000, Mem[0000000010001400] = ffffffff e07873cf
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000e3 00000000
!	%l2 = 00000000000000e3, Mem[0000000010101408] = 000000ffe31fe211
	stxa	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000000000e3
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff000000, %l7 = 00000000a3b2087f
	ldsba	[%i3+%g0]0x81,%l7	! %l7 = ffffffffffffffff

p0_label_97:
!	Mem[0000000010041400] = 00007941, %f8  = a84e0b63
	lda	[%i1+%g0]0x80,%f8 	! %f8 = 00007941
!	Mem[0000000010081400] = 9c1f4692, %l5 = ffffffffffff92bb
	ldsba	[%i2+%g0]0x88,%l5	! %l5 = ffffffffffffff92
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000000000008
	ldsba	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 41000000, %l5 = ffffffffffffff92
	ldsba	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000041
!	Mem[0000000030001408] = ff00ff78, %l6 = 0000000000000000
	lduha	[%i0+%o4]0x81,%l6	! %l6 = 000000000000ff00
!	%l4 = 0000000000000000, %l6 = 000000000000ff00, %l4 = 0000000000000000
	xnor	%l4,%l6,%l4		! %l4 = ffffffffffff00ff
!	Mem[00000000100c1400] = 000000ff, %f4  = 78e0eff6
	lda	[%i3+%g0]0x88,%f4 	! %f4 = 000000ff
!	Mem[00000000201c0000] = ffff86d9, %l0 = 0000000078ff00ff
	lduba	[%o0+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 97024892 87ffffff, %l4 = ffff00ff, %l5 = 00000041
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 0000000087ffffff 0000000097024892
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000e3, Mem[0000000021800140] = 00ba8361
	sth	%l2,[%o3+0x140]		! Mem[0000000021800140] = 00e38361

p0_label_98:
!	%l6 = 0000ff00, %l7 = ffffffff, Mem[0000000030041400] = 4b000000 fe8b1cf7
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000ff00 ffffffff
!	%f6  = ff600000, Mem[0000000010081400] = 92461f9c
	sta	%f6 ,[%i2+%g0]0x80	! Mem[0000000010081400] = ff600000
!	%f0  = 000000ff cd4b9348, %l5 = 0000000097024892
!	Mem[0000000030141418] = 93113a5b7839e277
	add	%i5,0x018,%g1
	stda	%f0,[%g1+%l5]ASI_PST32_S ! Mem[0000000030141418] = 000000ff7839e277
!	%f18 = 000000ff 686a0900, Mem[0000000030141400] = bad3b4fb 00000000
	stda	%f18,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff 686a0900
!	Mem[0000000030081408] = 00000000, %l7 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141400] = 686a0900, %l0 = 00000000000000ff
	swapa	[%i5+%g0]0x89,%l0	! %l0 = 00000000686a0900
!	%l0 = 00000000686a0900, Mem[0000000030081410] = 0000a1ee
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000a1ee
!	%f0  = 000000ff cd4b9348, Mem[0000000010101400] = e060f400 95dc38b6
	stda	%f0 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff cd4b9348
!	Mem[0000000030081408] = ff000000, %l2 = 00000000000000e3
	lduha	[%i2+%o4]0x81,%l2	! %l2 = 000000000000ff00
!	Starting 10 instruction Load Burst
!	%f10 = ffffffff, %f20 = 05fff4ff
	fcmpes	%fcc0,%f10,%f20		! %fcc0 = 3

p0_label_99:
!	%l0 = 00000000686a0900, %l2 = 000000000000ff00, %l5 = 0000000097024892
	and	%l0,%l2,%l5		! %l5 = 0000000000000900
!	Mem[0000000030181400] = 000000ff, %l5 = 0000000000000900
	lduha	[%i6+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = 011500ff, %l6 = 000000000000ff00
	lduwa	[%i3+%o4]0x88,%l6	! %l6 = 00000000011500ff
!	Mem[00000000201c0000] = ffff86d9, %l4 = 0000000087ffffff
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041418] = 3c53bb328cb27a87, %l7 = 0000000000000000
	ldxa	[%i1+0x018]%asi,%l7	! %l7 = 3c53bb328cb27a87
!	Mem[0000000010181410] = 0000ff00, %f14 = 0000a1ee
	lda	[%i6+%o5]0x80,%f14	! %f14 = 0000ff00
!	Mem[0000000030141410] = ffffffff, %l3 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1408] = 00000000, %l6 = 00000000011500ff
	lduwa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = ff000000cd4b9348, %f12 = 5ae411ed ff00ff78
	ldda	[%i6+%g0]0x81,%f12	! %f12 = ff000000 cd4b9348
!	Starting 10 instruction Store Burst
!	%f0  = 000000ff cd4b9348, %l1 = 0000000000000000
!	Mem[0000000010081428] = ff30a23d5f02ffa1
	add	%i2,0x028,%g1
	stda	%f0,[%g1+%l1]ASI_PST32_P ! Mem[0000000010081428] = ff30a23d5f02ffa1

p0_label_100:
!	%l3 = ffffffffffffffff, Mem[0000000030181400] = ff000000
	stwa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffff
!	Mem[0000000010141400] = 41790000, %l5 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l2 = 000000000000ff00, Mem[0000000030081410] = eea10000
	stha	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = eea1ff00
!	%l2 = 000000000000ff00, Mem[0000000010081408] = 69e88fec
	stha	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ff008fec
!	%f16 = 00000000 00000000, Mem[0000000030181400] = ffffffff cd4b9348
	stda	%f16,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 00000000
!	Mem[0000000010041400] = 41790000, %l2 = 000000000000ff00
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1430] = 00000000, %l4 = ffffffff, %l2 = 00000000
	add	%i3,0x30,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010181400] = e3000000
	stba	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%l1 = 0000000000000000, Mem[0000000030181410] = 78e0eff6
	stha	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000eff6
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff217a, %l1 = 0000000000000000
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000ffff

p0_label_101:
!	Mem[0000000030101410] = ff000000, %l0 = 00000000686a0900
	ldswa	[%i4+%o5]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010141408] = 0000000000000000, %f14 = 0000ff00 d5f95bae
	ldda	[%i5+%o4]0x80,%f14	! %f14 = 00000000 00000000
!	Mem[0000000030001408] = a85250fb 78ff00ff, %l0 = ff000000, %l1 = 0000ffff
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 0000000078ff00ff 00000000a85250fb
!	%l3 = ffffffffffffffff, Mem[00000000300c1400] = ff000000
	stwa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff
!	Mem[0000000010081400] = 000060ff, %l0 = 0000000078ff00ff
	lduha	[%i2+%g0]0x88,%l0	! %l0 = 00000000000060ff
!	Mem[0000000010001408] = ffffffff, %f20 = 05fff4ff
	lda	[%i0+%o4]0x88,%f20	! %f20 = ffffffff
!	Mem[0000000030101400] = 1725ae0ceea100ff, %l6 = 0000000000000000
	ldxa	[%i4+%g0]0x89,%l6	! %l6 = 1725ae0ceea100ff
!	Mem[0000000010181438] = 0000d556, %l6 = 1725ae0ceea100ff
	ldswa	[%i6+0x038]%asi,%l6	! %l6 = 000000000000d556
!	Mem[00000000201c0000] = ffff86d9, %l7 = 3c53bb328cb27a87
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f4  = 000000ff, Mem[0000000030081400] = 41000000
	sta	%f4 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff

p0_label_102:
!	%f0  = 000000ff cd4b9348, %l7 = 00000000000000ff
!	Mem[0000000030101430] = 97f0269d99d0c51c
	add	%i4,0x030,%g1
	stda	%f0,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030101430] = 48934bcdff000000
!	Mem[0000000020800041] = 92bbd1fd, %l7 = 00000000000000ff
	ldstuba	[%o1+0x041]%asi,%l7	! %l7 = 000000bb000000ff
!	Mem[0000000010101410] = 000000ff, %l4 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030041410] = ff60f400, %l0 = 00000000000060ff
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001434] = 88ffb230, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x034]%asi,%l4	! %l4 = 0000000088ffb230
!	Mem[0000000010181404] = 000000ff, %l3 = ffffffffffffffff
	swap	[%i6+0x004],%l3		! %l3 = 00000000000000ff
!	%f16 = 00000000 00000000, Mem[0000000030081410] = eea1ff00 ae5bf9d5
	stda	%f16,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 00000000
!	%f18 = 000000ff, Mem[0000000010141410] = ef2053ff
	sta	%f18,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff217a, %l7 = 00000000000000bb
	lduh	[%o2+%g0],%l7		! %l7 = 000000000000ffff

p0_label_103:
!	Mem[00000000300c1410] = bad3b4fb, %l0 = 00000000000000ff
	lduwa	[%i3+%o5]0x89,%l0	! %l0 = 00000000bad3b4fb
!	Mem[0000000010041408] = ffffff87 92480297, %l6 = 0000d556, %l7 = 0000ffff
	ldd	[%i1+%o4],%l6		! %l6 = 00000000ffffff87 0000000092480297
!	Mem[0000000010001408] = ffffffff, %l3 = 00000000000000ff
	ldswa	[%i0+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141400] = ff007941, %f28 = 00000000
	lda	[%i5+%g0]0x80,%f28	! %f28 = ff007941
!	%l4 = 0000000088ffb230, imm = fffffffffffff0da, %l2 = 0000000000000000
	add	%l4,-0xf26,%l2		! %l2 = 0000000088ffa30a
!	Mem[0000000010081408] = ff008fec 1736a8ca, %l6 = ffffff87, %l7 = 92480297
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000ff008fec 000000001736a8ca
!	Mem[0000000030181408] = 00000000, %l7 = 000000001736a8ca
	lduwa	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 00000000bad3b4fb
	setx	0xd64cbd27a2d324b3,%g7,%l0 ! %l0 = d64cbd27a2d324b3
!	%l1 = 00000000a85250fb
	setx	0x17074f17f70de48b,%g7,%l1 ! %l1 = 17074f17f70de48b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d64cbd27a2d324b3
	setx	0x90308e30019c928d,%g7,%l0 ! %l0 = 90308e30019c928d
!	%l1 = 17074f17f70de48b
	setx	0xe4285e181e378dc4,%g7,%l1 ! %l1 = e4285e181e378dc4
!	Starting 10 instruction Store Burst
!	%f0  = 000000ff cd4b9348 00000000 000000e0
!	%f4  = 000000ff 565a5500 ff600000 ffffffff
!	%f8  = 00007941 1d1dc301 ffffffff 47477645
!	%f12 = ff000000 cd4b9348 00000000 00000000
	stda	%f0,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400

p0_label_104:
!	Mem[0000000010041400] = ff007941, %l2 = 0000000088ffa30a
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff007941
!	%l7 = 00000000000000ff, Mem[0000000010141410] = 000000ff
	stba	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	Mem[0000000010141408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l2 = 00000000ff007941, Mem[0000000030101410] = 000000ff
	stwa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = ff007941
!	%l0 = 019c928d, %l1 = 1e378dc4, Mem[0000000010081418] = 6a0e5802 9813d1f6
	std	%l0,[%i2+0x018]		! Mem[0000000010081418] = 019c928d 1e378dc4
!	Mem[0000000030101408] = ff000000, %l4 = 0000000088ffb230
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030041410] = 00f460ff, %l2 = 00000000ff007941
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	%l4 = 00000000ff000000, %l1 = e4285e181e378dc4, %l3  = ffffffffffffffff
	mulx	%l4,%l1,%l3		! %l3 = 061956363c000000
!	Mem[0000000030181408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000 00000000, %l0 = 019c928d, %l1 = 1e378dc4
	ldda	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000 0000000000000000

p0_label_105:
!	Mem[0000000010081410] = 7f08b2a3, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = 000000007f08b2a3
!	Mem[0000000010081400] = ff600000fbb4d3ba, %f24 = 97024892 6621fdd3
	ldda	[%i2+%g0]0x80,%f24	! %f24 = ff600000 fbb4d3ba
!	Mem[0000000030001400] = 00000000, %f28 = ff007941
	lda	[%i0+%g0]0x89,%f28	! %f28 = 00000000
!	Mem[00000000100c1410] = ff000000000000ff, %f26 = 00000000 47477645
	ldda	[%i3+%o5]0x80,%f26	! %f26 = ff000000 000000ff
!	Mem[0000000010081410] = a3b2087ff71c8bfe, %l4 = 00000000ff000000
	ldxa	[%i2+%o5]0x80,%l4	! %l4 = a3b2087ff71c8bfe
!	Code Fragment 3
p0_fragment_13:
!	%l0 = 0000000000000000
	setx	0xa0e336c0674f8284,%g7,%l0 ! %l0 = a0e336c0674f8284
!	%l1 = 000000007f08b2a3
	setx	0xb80602501d4ec410,%g7,%l1 ! %l1 = b80602501d4ec410
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a0e336c0674f8284
	setx	0x619567007c07dcea,%g7,%l0 ! %l0 = 619567007c07dcea
!	%l1 = b80602501d4ec410
	setx	0xc221bfd7a874ca8a,%g7,%l1 ! %l1 = c221bfd7a874ca8a
!	Mem[0000000030041400] = 00ff0000, %l5 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000ff0000
!	Mem[0000000030041408] = 79415f86, %l2 = 00000000000000ff
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = 0000000000007941
!	Mem[0000000030181410] = f6ef0000, %l6 = 00000000ff008fec
	ldswa	[%i6+%o5]0x89,%l6	! %l6 = fffffffff6ef0000
!	Starting 10 instruction Store Burst
!	%l6 = fffffffff6ef0000, imm = 00000000000005e6, %l4 = a3b2087ff71c8bfe
	add	%l6,0x5e6,%l4		! %l4 = fffffffff6ef05e6

p0_label_106:
!	%f24 = ff600000 fbb4d3ba, Mem[0000000010181410] = 00ff0000 78000000
	stda	%f24,[%i6+%o5]0x88	! Mem[0000000010181410] = ff600000 fbb4d3ba
!	Mem[0000000030041410] = 00f460ff, %l7 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	%l6 = fffffffff6ef0000, %l1 = c221bfd7a874ca8a, %l3 = 061956363c000000
	subc	%l6,%l1,%l3		! %l3 = 3dde40284e7a3576
!	Mem[0000000030101410] = ff007941, %l0 = 619567007c07dcea
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 00000000ff007941
!	Mem[000000001010143c] = cef31cc7, %l5 = 00ff0000, %l6 = f6ef0000
	add	%i4,0x3c,%g1
	casa	[%g1]0x80,%l5,%l6	! %l6 = 00000000cef31cc7
!	%f19 = 686a0900, Mem[00000000300c1408] = 000000ff
	sta	%f19,[%i3+%o4]0x89	! Mem[00000000300c1408] = 686a0900
!	Mem[0000000010141400] = ff007941, %l0 = ff007941, %l5 = 00ff0000
	casa	[%i5]0x80,%l0,%l5	! %l5 = 00000000ff007941
!	%l4 = fffffffff6ef05e6, %l0 = 00000000ff007941, %l6 = 00000000cef31cc7
	udivx	%l4,%l0,%l6		! %l6 = 00000001010086cc
!	Mem[00000000100c143d] = b63ebb65, %l3 = 3dde40284e7a3576
	ldstub	[%i3+0x03d],%l3		! %l3 = 0000003e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00ff0000, %l7 = 00000000000000ff
	lduha	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff

p0_label_107:
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010001400] = 000000ff, %f27 = 000000ff
	lda	[%i0+%g0]0x80,%f27	! %f27 = 000000ff
!	Mem[0000000030141408] = 00559248, %l0 = 00000000ff007941
	lduwa	[%i5+%o4]0x89,%l0	! %l0 = 0000000000559248
!	Mem[0000000030081400] = 000000ff, %l2 = 0000000000007941
	lduwa	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = ff000000, %l6 = 00000001010086cc
	lduha	[%i3+%g0]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[00000000300c1400] = ffffffff a3b2087f 00096a68 4cabee7b
!	Mem[00000000300c1410] = fbb4d3ba 00000000 fa29ab85 c3956639
!	Mem[00000000300c1420] = 79f03651 6769f01f 9ed0dc95 0000c159
!	Mem[00000000300c1430] = ffffffff 000060ff d89af845 b706eeb7
	ldda	[%i3]ASI_BLK_AIUSL,%f0	! Block Load from 00000000300c1400
!	%f30 = ff005500, %f27 = 000000ff, %f26 = ff000000 000000ff
	fsmuld	%f30,%f27,%f26		! %l0 = 000000000055926a, Unfinished, %fsr = 0b00000c00
!	Mem[0000000010101410] = ff000000, %l1 = c221bfd7a874ca8a
	ldsha	[%i4+%o5]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010081410] = a3b2087f, %l4 = fffffffff6ef05e6
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 000000000000a3b2
!	Mem[00000000201c0000] = ffff86d9, %l6 = 000000000000ff00
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f28 = 00000000, %f16 = 00000000 00000000
	fstod	%f28,%f16		! %f16 = 00000000 00000000

p0_label_108:
!	Code Fragment 4
p0_fragment_14:
!	%l0 = 000000000055926a
	setx	0x8b9e414fb13264a4,%g7,%l0 ! %l0 = 8b9e414fb13264a4
!	%l1 = ffffffffffffff00
	setx	0x749ec8603c0e0338,%g7,%l1 ! %l1 = 749ec8603c0e0338
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8b9e414fb13264a4
	setx	0x248ef2207329bd80,%g7,%l0 ! %l0 = 248ef2207329bd80
!	%l1 = 749ec8603c0e0338
	setx	0x25f8839846d33543,%g7,%l1 ! %l1 = 25f8839846d33543
!	%f22 = e07873cf, Mem[00000000100c1410] = 000000ff
	sta	%f22,[%i3+%o5]0x88	! Mem[00000000100c1410] = e07873cf
!	%f17 = 00000000, Mem[0000000030041410] = ff60f400
	sta	%f17,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%f22 = e07873cf 92461f9c, %l5 = 00000000ff007941
!	Mem[0000000030041438] = 13c1aa3dde933e59
	add	%i1,0x038,%g1
	stda	%f22,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030041438] = 9cc1aa3dde937859
!	Mem[0000000010041410] = 000000e0, %l4 = 000000000000a3b2
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000e0
!	%l7 = 00000000000000ff, %l5 = 00000000ff007941, %l0 = 248ef2207329bd80
	and	%l7,%l5,%l0		! %l0 = 0000000000000041
!	Mem[0000000010101410] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1400] = 000000ff, %l5 = 00000000ff007941
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010041410] = 0000a3b2, %l6 = 000000000000ffff
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 000000000000a3b2
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff000000, %f20 = ffffffff
	lda	[%i0+%o5]0x88,%f20	! %f20 = ff000000

p0_label_109:
!	Mem[00000000201c0000] = ffff86d9, %l0 = 0000000000000041
	ldub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[00000000300c1400] = ffffffff, %l7 = 00000000000000ff
	ldswa	[%i3+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000211c0000] = ffff217a, %l3 = 000000000000003e
	lduba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1400] = ff00000000000000, %f16 = 00000000 00000000
	ldda	[%i3+%g0]0x80,%f16	! %f16 = ff000000 00000000
!	Mem[0000000010181410] = fbb4d3ba, %l2 = 00000000000000ff
	lduba	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ba
!	Mem[0000000010041418] = 3c53bb32 8cb27a87, %l2 = 000000ba, %l3 = 000000ff
	ldd	[%i1+0x018],%l2		! %l2 = 000000003c53bb32 000000008cb27a87
!	Mem[0000000010181400] = 00000000, %l5 = 00000000000000ff
	ldsha	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = 00000000bad3b4fb, %f4  = 00000000 bad3b4fb
	ldda	[%i3+%o5]0x89,%f4 	! %f4  = 00000000 bad3b4fb
!	%f6  = 396695c3, %f16 = ff000000, %f21 = bad3b4fb
	fadds	%f6 ,%f16,%f21		! %f21 = ff000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, immd = 0000000000000438, %l4 = 00000000000000e0
	sdivx	%l5,0x438,%l4		! %l4 = 0000000000000000

p0_label_110:
!	%l6 = 000000000000a3b2, Mem[0000000030101410] = 7c07dcea
	stba	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 7c07dcb2
!	%f0  = 7f08b2a3 ffffffff 7beeab4c 686a0900
!	%f4  = 00000000 bad3b4fb 396695c3 85ab29fa
!	%f8  = 1ff06967 5136f079 59c10000 95dcd09e
!	%f12 = ff600000 ffffffff b7ee06b7 45f89ad8
	stda	%f0,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
!	%l6 = 0000a3b2, %l7 = ffffffff, Mem[0000000030001410] = 00000000 67089990
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000a3b2 ffffffff
!	Mem[0000000010141428] = 0000003c, %l5 = 00000000, %l1 = 46d33543
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 000000000000003c
!	Mem[0000000010141408] = ff000000, %l7 = ffffffff, %l3 = 8cb27a87
	add	%i5,0x08,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000ff000000
!	%l1 = 000000000000003c, Mem[00000000100c1410] = e07873cf
	stwa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000003c
!	%l4 = 0000000000000000, Mem[0000000030041408] = 865f4179
	stha	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 865f0000
!	%f30 = ff005500 000000ff, Mem[0000000030141410] = ffffffff 45764747
	stda	%f30,[%i5+%o5]0x89	! Mem[0000000030141410] = ff005500 000000ff
!	%l6 = 000000000000a3b2, Mem[0000000010041408] = ffffff87
	stha	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = a3b2ff87
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = ad02b0fb, %l0 = 00000000000000ff
	ldsba	[%i4+0x019]%asi,%l0	! %l0 = 0000000000000002

p0_label_111:
!	Mem[0000000030181400] = 00000000, %l7 = ffffffffffffffff
	ldswa	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = ffff217a, %l6 = 000000000000a3b2
	ldub	[%o2+0x001],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030041400] = 0000ff00, %f16 = ff000000
	lda	[%i1+%g0]0x89,%f16	! %f16 = 0000ff00
!	Mem[0000000021800040] = f1679f3e, %l3 = 00000000ff000000
	ldsba	[%o3+0x040]%asi,%l3	! %l3 = fffffffffffffff1
!	Mem[0000000010181400] = 00000000ffffffff, %l3 = fffffffffffffff1
	ldxa	[%i6+0x000]%asi,%l3	! %l3 = 00000000ffffffff
!	Mem[00000000100c1400] = 000000ff, %l7 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l7	! %l7 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (18)
!	Mem[000000001008140c] = 4cabee7b, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x00c]%asi,%l6	! %l6 = 000000004cabee7b
!	Mem[0000000010101400] = 000000ff, %l6 = 000000004cabee7b
	ldsba	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = fbb4d3ba00000000, %l2 = 000000003c53bb32
	ldxa	[%i2+%o5]0x80,%l2	! %l2 = fbb4d3ba00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = ffff0000, %l1 = 000000000000003c
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000ffff0000

p0_label_112:
!	%l2 = fbb4d3ba00000000, Mem[0000000030001408] = ff00ff78fb5052a8
	stxa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = fbb4d3ba00000000
!	Mem[00000000201c0000] = ffff86d9, %l4 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%f30 = ff005500 000000ff, %l4 = 00000000000000ff
!	Mem[0000000030141418] = 000000ff7839e277
	add	%i5,0x018,%g1
	stda	%f30,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030141418] = ff000000005500ff
!	%l4 = 00000000000000ff, Mem[0000000010101400] = 000000ffcd4b9348
	stx	%l4,[%i4+%g0]		! Mem[0000000010101400] = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000002
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l3 = 00000000ffffffff, imm = 0000000000000110, %l7 = ffffffffffffffff
	add	%l3,0x110,%l7		! %l7 = 000000010000010f
!	%l6 = 0000000000000000, Mem[0000000030101408] = 30b2ff88
	stba	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 30b2ff00
!	Mem[0000000010141408] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	%f12 = ff600000, Mem[0000000010041400] = 88ffa30a
	sta	%f12,[%i1+%g0]0x80	! Mem[0000000010041400] = ff600000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000

p0_label_113:
!	Mem[00000000300c1410] = fbb4d3ba, %l0 = 00000000000000ff
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = fffffffffbb4d3ba
!	Mem[00000000201c0000] = ffff86d9, %l1 = 00000000ffff0000
	lduh	[%o0+%g0],%l1		! %l1 = 000000000000ffff
!	Mem[0000000030181410] = 0000eff6, %l1 = 000000000000ffff
	ldsha	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l4 = 00000000000000ff, %l3 = 00000000ffffffff, %y  = ffffffff
	umul	%l4,%l3,%l0		! %l0 = 000000feffffff01, %y = 000000fe
!	Mem[00000000300c1410] = bad3b4fb, %l6 = 0000000000000000
	ldswa	[%i3+%o5]0x89,%l6	! %l6 = ffffffffbad3b4fb
!	Mem[0000000030001410] = b2a30000, %f4  = 00000000
	lda	[%i0+%o5]0x81,%f4 	! %f4 = b2a30000
!	Mem[0000000030141408] = 4892550000000000, %l3 = 00000000ffffffff
	ldxa	[%i5+%o4]0x81,%l3	! %l3 = 4892550000000000
!	Mem[0000000030101408] = 00ffb230, %f23 = 92461f9c
	lda	[%i4+%o4]0x81,%f23	! %f23 = 00ffb230
!	Mem[0000000030101410] = b2dc077c, %l5 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000b2
!	Starting 10 instruction Store Burst
!	%f14 = b7ee06b7, %f10 = 59c10000, %f0  = 7f08b2a3
	fadds	%f14,%f10,%f0 		! %f0  = 59c10000

p0_label_114:
!	Mem[0000000010181410] = fbb4d3ba, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 000000ba000000ff
!	%l0 = 000000feffffff01, Mem[0000000030001400] = 00000000
	stwa	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffff01
!	Mem[0000000030101400] = ff00a1ee, %l5 = 00000000000000b2
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ff00a1ee
!	%f30 = ff005500 000000ff, Mem[0000000010041408] = a3b2ff87 92480297
	stda	%f30,[%i1+%o4]0x80	! Mem[0000000010041408] = ff005500 000000ff
!	%l3 = 4892550000000000, Mem[0000000030141400] = ff000000
	stha	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[0000000030181400] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%f2  = 7beeab4c, Mem[0000000030001410] = b2a30000
	sta	%f2 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 7beeab4c
!	Mem[0000000010141408] = 000000ff, %l1 = 00000000000000ba
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000300c1400] = ffffffff, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff86d9, %l5 = 00000000ff00a1ee
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000ffff

p0_label_115:
!	Mem[0000000010141410] = 000000ff, %l6 = ffffffffbad3b4fb
	lduba	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101410] = ff000000d3fd2166, %f22 = e07873cf 00ffb230
	ldda	[%i4+0x010]%asi,%f22	! %f22 = ff000000 d3fd2166
!	Mem[0000000020800000] = 3ee0348e, %l0 = 000000feffffff01
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 0000000000003ee0
!	%l0 = 0000000000003ee0, %l6 = 00000000000000ff, %l6 = 00000000000000ff
	udivx	%l0,%l6,%l6		! %l6 = 000000000000003f
!	Mem[0000000030001408] = fbb4d3ba00000000, %l1 = 00000000000000ff
	ldxa	[%i0+%o4]0x81,%l1	! %l1 = fbb4d3ba00000000
!	Mem[0000000020800000] = 3ee0348e, %l3 = 4892550000000000
	lduba	[%o1+0x000]%asi,%l3	! %l3 = 000000000000003e
!	%l6 = 000000000000003f, imm = 0000000000000474, %l1 = fbb4d3ba00000000
	andn	%l6,0x474,%l1		! %l1 = 000000000000000b
!	Mem[00000000100c1410] = 0000003c, %l4 = 00000000000000ff
	lduba	[%i3+%o5]0x88,%l4	! %l4 = 000000000000003c
!	Mem[0000000010001410] = ff000000, %l1 = 000000000000000b
	lduwa	[%i0+%o5]0x88,%l1	! %l1 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = b2000000, %l7 = 000000010000010f
	swapa	[%i4+%g0]0x89,%l7	! %l7 = 00000000b2000000

p0_label_116:
!	%l7 = 00000000b2000000, Mem[00000000100c1408] = 011500ff
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 01150000
!	%f27 = 000000ff, Mem[00000000100c1400] = 000000ff
	sta	%f27,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	%l7 = 00000000b2000000, Mem[0000000010101400] = 00000000000000ff
	stxa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000b2000000
!	%f21 = ff000000, Mem[00000000100c1410] = 0000003c
	sta	%f21,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff000000
!	%l3 = 000000000000003e, Mem[0000000010181428] = 24ac00ff70c6a1ee, %asi = 80
	stxa	%l3,[%i6+0x028]%asi	! Mem[0000000010181428] = 000000000000003e
!	%l0 = 0000000000003ee0, Mem[0000000010181432] = 1ff06967
	sth	%l0,[%i6+0x032]		! Mem[0000000010181430] = 1ff03ee0
!	Mem[0000000030041400] = 00ff0000, %l1 = 00000000ff000000
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141410] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%f22 = ff000000 d3fd2166, %f2  = 7beeab4c 686a0900
	fxtod	%f22,%f2 		! %f2  = c36fffff e5805bd3
!	Starting 10 instruction Load Burst
!	%f11 = 95dcd09e, Mem[00000000100c1408] = 01150000
	sta	%f11,[%i3+%o4]0x88	! Mem[00000000100c1408] = 95dcd09e

p0_label_117:
!	Mem[0000000030041400] = ffffffff 0000ffff, %l4 = 0000003c, %l5 = 0000ffff
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 000000000000ffff 00000000ffffffff
!	Mem[0000000010141434] = ff05b230, %l1 = 00000000000000ff
	ldswa	[%i5+0x034]%asi,%l1	! %l1 = ffffffffff05b230
!	Mem[0000000010141410] = ff000000 00f40000, %l6 = 0000003f, %l7 = b2000000
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 00000000ff000000 0000000000f40000
!	Mem[0000000030001400] = 01ffffff00007941, %l7 = 0000000000f40000
	ldxa	[%i0+%g0]0x81,%l7	! %l7 = 01ffffff00007941
!	Mem[0000000010141408] = ff000000, %l3 = 000000000000003e
	ldswa	[%i5+%o4]0x80,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010141410] = 0000f400000000ff, %f8  = 1ff06967 5136f079
	ldda	[%i5+%o5]0x88,%f8 	! %f8  = 0000f400 000000ff
!	Mem[0000000010181414] = 000060ff, %l5 = 00000000ffffffff
	ldub	[%i6+0x017],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030041400] = 0000ffff, %l6 = 00000000ff000000
	ldsha	[%i1+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	%l4 = 000000000000ffff, %l0 = 0000000000003ee0, %y  = 000000fe
	sdiv	%l4,%l0,%l1		! %l1 = 00000000040a2dd2
	mov	%l0,%y			! %y = 00003ee0
!	Starting 10 instruction Store Burst
!	%l1 = 00000000040a2dd2, Mem[00000000100c1408] = 9ed0dc95
	stha	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 2dd2dc95

p0_label_118:
!	%f0  = 59c10000 ffffffff, %l6 = ffffffffffffffff
!	Mem[0000000010101400] = 00000000b2000000
	stda	%f0,[%i4+%l6]ASI_PST16_P ! Mem[0000000010101400] = 59c10000ffffffff
!	%f10 = 59c10000, Mem[00000000100c1418] = f71c8bfe
	st	%f10,[%i3+0x018]	! Mem[00000000100c1418] = 59c10000
!	%l3 = ffffffffff000000, Mem[0000000010041408] = 005500ff
	stba	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 00550000
!	Mem[000000001000142e] = 47477645, %l1 = 00000000040a2dd2
	ldstub	[%i0+0x02e],%l1		! %l1 = 00000076000000ff
!	%f12 = ff600000 ffffffff, %l2 = fbb4d3ba00000000
!	Mem[0000000030081430] = f71c8bfe76b4c833
	add	%i2,0x030,%g1
	stda	%f12,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030081430] = f71c8bfe76b4c833
!	%l4 = 000000000000ffff, Mem[0000000010001400] = 48934bcdff000000
	stxa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000000000ffff
!	Mem[0000000010041410] = 0000003c, %l0 = 0000000000003ee0
	swapa	[%i1+%o5]0x80,%l0	! %l0 = 000000000000003c
!	Mem[00000000300c1408] = 686a0900, %l1 = 0000000000000076
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 00000000686a0900
!	%l0 = 000000000000003c, Mem[0000000010181428] = 000000000000003e
	stx	%l0,[%i6+0x028]		! Mem[0000000010181428] = 000000000000003c
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff00000000000000, %l2 = fbb4d3ba00000000
	ldxa	[%i3+%g0]0x80,%l2	! %l2 = ff00000000000000

p0_label_119:
!	Mem[0000000010041428] = 24ac00ff0000003c, %f2  = c36fffff e5805bd3
	ldd	[%i1+0x028],%f2 	! %f2  = 24ac00ff 0000003c
!	Mem[0000000030041410] = ffb44c38 00000000, %l2 = 00000000, %l3 = ff000000
	ldda	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000 00000000ffb44c38
!	%f2  = 24ac00ff, %f14 = b7ee06b7, %f21 = ff000000
	fsubs	%f2 ,%f14,%f21		! %f21 = 37ee06b7
!	Mem[0000000021800080] = ff070550, %l7 = 01ffffff00007941
	ldub	[%o3+0x080],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030081400] = ff000000, %l7 = 00000000000000ff
	ldsha	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, immd = fffffffffffff9c1, %l6 = ffffffffffffffff
	sdivx	%l7,-0x63f,%l6		! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00000002, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000002
!	Mem[0000000010101410] = ff000000, %l7 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[000000001008140c] = 000000ff, %f14 = b7ee06b7
	ld	[%i2+0x00c],%f14	! %f14 = 000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ffb44c38, Mem[0000000030081408] = ffb44c38000000ff
	stxa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000ffb44c38

p0_label_120:
!	Mem[000000001010140c] = 000000e3, %l1 = 00000000686a0900
	ldstuba	[%i4+0x00c]%asi,%l1	! %l1 = 00000000000000ff
!	%l7 = ffffffffffffff00, Mem[0000000010181410] = fbb4d3ff
	stha	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = fbb4ff00
!	%l1 = 0000000000000000, imm = 00000000000002b2, %l5 = 00000000000000ff
	addc	%l1,0x2b2,%l5		! %l5 = 00000000000002b2
!	%l0 = 0000003c, %l1 = 00000000, Mem[0000000010041408] = 00550000 ff000000
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000003c 00000000
!	%f31 = 000000ff, Mem[0000000010001410] = 000000ff
	sta	%f31,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff
!	Mem[0000000021800081] = ff070550, %l0 = 000000000000003c
	ldstuba	[%o3+0x081]%asi,%l0	! %l0 = 00000007000000ff
!	%l0 = 0000000000000007, Mem[00000000201c0000] = ffff86d9
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 000786d9
!	Mem[0000000010041410] = e03e0000, %l5 = 00000000000002b2
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%f28 = 00000000 ff000000, %l7 = ffffffffffffff00
!	Mem[00000000100c1430] = 0000000000000000
	add	%i3,0x030,%g1
	stda	%f28,[%g1+%l7]ASI_PST8_PL ! Mem[00000000100c1430] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00096a68, %l1 = 0000000000000000
	ldsb	[%i2+0x009],%l1		! %l1 = 0000000000000009

p0_label_121:
!	Mem[00000000100c1420] = bfa0033fc3bb6069, %f22 = ff000000 d3fd2166
	ldd	[%i3+0x020],%f22	! %f22 = bfa0033f c3bb6069
!	Mem[0000000010001400] = ffff0000, %l3 = 00000000ffb44c38
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081400] = 000000ff00000000, %l4 = 000000000000ffff
	ldxa	[%i2+%g0]0x81,%l4	! %l4 = 000000ff00000000
!	Mem[0000000020800000] = 3ee0348e, %l6 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 0000000000003ee0
!	Mem[0000000010181414] = 000060ff, %l1 = 0000000000000009
	ldsb	[%i6+0x015],%l1		! %l1 = 0000000000000000
!	Mem[0000000030181410] = 0000eff6 565a5500, %l2 = 00000002, %l3 = ffffffff
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 000000000000eff6 00000000565a5500
!	Mem[0000000030141408] = 48925500, %l1 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l1	! %l1 = 0000000000004892
!	Mem[0000000010101410] = 000000ff, %l0 = 0000000000000007
	lduba	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[000000001004142c] = 0000003c, %l2 = 000000000000eff6
	ldsba	[%i1+0x02f]%asi,%l2	! %l2 = 000000000000003c
!	Starting 10 instruction Store Burst
!	%l3 = 00000000565a5500, Mem[0000000010101420] = 79415f869a6afae2
	stx	%l3,[%i4+0x020]		! Mem[0000000010101420] = 00000000565a5500

p0_label_122:
!	Mem[0000000010081400] = ffffffff, %l3 = 00000000565a5500
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[00000000300c1400] = ffffffff, %l4 = 000000ff00000000
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010101410] = ff000000, %l3 = 00000000ffffffff
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c1408] = 95dcd22d, %l3 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 0000002d000000ff
!	Mem[0000000010001433] = ff000000, %l3 = 000000000000002d
	ldstuba	[%i0+0x033]%asi,%l3	! %l3 = 00000000000000ff
!	%f14 = 000000ff, Mem[0000000010101410] = 000000ff
	sta	%f14,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	Mem[0000000010101410] = ff000000, %l5 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	%l7 = ffffffffffffff00, Mem[0000000020800000] = 3ee0348e
	stb	%l7,[%o1+%g0]		! Mem[0000000020800000] = 00e0348e
!	%l1 = 0000000000004892, Mem[0000000010101410] = 00000000
	stha	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 48920000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l5 = 00000000ff000000
	ldswa	[%i4+0x008]%asi,%l5	! %l5 = 0000000000000000

p0_label_123:
!	Mem[0000000010141408] = 000000ff, %l7 = ffffffffffffff00
	ldsba	[%i5+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041400] = ff005500 000060ff, %l6 = 00003ee0, %l7 = ffffffff
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 00000000000060ff 00000000ff005500
!	Mem[0000000010181410] = 00ffb4fb 000060ff, %l2 = 0000003c, %l3 = 00000000
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 0000000000ffb4fb 00000000000060ff
!	Mem[0000000030101400] = 0000010f, %l3 = 00000000000060ff
	lduha	[%i4+%g0]0x89,%l3	! %l3 = 000000000000010f
!	Mem[0000000030181408] = e0000000000000ff, %l6 = 00000000000060ff
	ldxa	[%i6+%o4]0x89,%l6	! %l6 = e0000000000000ff
!	Mem[0000000021800040] = f1679f3e, %l1 = 0000000000004892
	lduba	[%o3+0x041]%asi,%l1	! %l1 = 0000000000000067
!	Mem[0000000010041420] = 000000ff000000c7, %f28 = 00000000 ff000000
	ldda	[%i1+0x020]%asi,%f28	! %f28 = 000000ff 000000c7
!	Mem[0000000021800140] = 00e38361, %l6 = e0000000000000ff
	ldsb	[%o3+0x140],%l6		! %l6 = 0000000000000000
!	Mem[0000000010041410] = ff003ee045f89ad8, %f0  = 59c10000 ffffffff
	ldda	[%i1+%o5]0x80,%f0 	! %f0  = ff003ee0 45f89ad8
!	Starting 10 instruction Store Burst
!	%f8  = 0000f400 000000ff, Mem[0000000030041410] = 00000000 384cb4ff
	stda	%f8 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000f400 000000ff

p0_label_124:
!	Mem[00000000100c1418] = 59c10000, %l3 = 000000000000010f
	ldstuba	[%i3+0x018]%asi,%l3	! %l3 = 00000059000000ff
!	%l0 = 000000ff, %l1 = 00000067, Mem[0000000010001400] = ffff0000 00000000
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff 00000067
!	%l2 = 00ffb4fb, %l3 = 00000059, Mem[0000000030181400] = ff000000 00000000
	stda	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00ffb4fb 00000059
!	%f28 = 000000ff 000000c7, Mem[0000000010141410] = 000000ff 0000f400
	stda	%f28,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff 000000c7
!	%f2  = 24ac00ff 0000003c, Mem[0000000030181400] = 00ffb4fb 00000059
	stda	%f2 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 24ac00ff 0000003c
!	%f25 = fbb4d3ba, %f3  = 0000003c, %f9  = 000000ff
	fsubs	%f25,%f3 ,%f9 		! %l0 = 0000000000000121, Unfinished, %fsr = 0b00000c00
!	Mem[0000000030181410] = 0000eff6, %l4 = 00000000ffffffff
	swapa	[%i6+%o5]0x81,%l4	! %l4 = 000000000000eff6
!	%l3 = 0000000000000059, Mem[0000000030081410] = 00000000
	stwa	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000059
!	Mem[0000000010181418] = 97024892, %l4 = 000000000000eff6, %asi = 80
	swapa	[%i6+0x018]%asi,%l4	! %l4 = 0000000097024892
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %l7 = 00000000ff005500
	ldswa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000

p0_label_125:
!	Mem[0000000030041408] = 00005f86, %l0 = 0000000000000121
	ldsha	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = bad3b4fb, %l0 = 0000000000000000
	ldsha	[%i3+%o5]0x89,%l0	! %l0 = ffffffffffffb4fb
!	Mem[0000000010001410] = 00555a56ff000000, %l5 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l5	! %l5 = 00555a56ff000000
!	Mem[0000000030001400] = ffffff01, %l4 = 0000000097024892
	ldsba	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000001
!	Mem[00000000100c1410] = 000000ff, %l4 = 0000000000000001
	lduw	[%i3+%o5],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030101408] = 30b2ff00, %f26 = ff000000
	lda	[%i4+%o4]0x89,%f26	! %f26 = 30b2ff00
!	Mem[0000000030041408] = e2fa6a9a 865f0000, %l0 = ffffb4fb, %l1 = 00000067
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 00000000865f0000 00000000e2fa6a9a
!	Mem[000000001000142c] = 4747ff45, %l2 = 0000000000ffb4fb
	lduba	[%i0+0x02c]%asi,%l2	! %l2 = 0000000000000047
!	Mem[0000000010041400] = ff005500000060ff, %f12 = ff600000 ffffffff
	ldda	[%i1+%g0]0x88,%f12	! %f12 = ff005500 000060ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000047, %l3 = 00000059, Mem[0000000010041408] = 0000003c 00000000
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000047 00000059

p0_label_126:
!	%l0 = 00000000865f0000, Mem[0000000030041408] = 00005f86
	stha	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00005f86
!	%l5 = 00555a56ff000000, Mem[000000001010141e] = 209ca183, %asi = 80
	stha	%l5,[%i4+0x01e]%asi	! Mem[000000001010141c] = 209c0000
!	%f14 = 000000ff 45f89ad8, Mem[0000000010101410] = 00009248 6621fdd3
	stda	%f14,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff 45f89ad8
!	Mem[0000000030181410] = ffffffff, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 00000000ffffffff
!	%f22 = bfa0033f c3bb6069, %l6 = 0000000000000000
!	Mem[0000000030141420] = bfb9b1e8aa3dc13d
	add	%i5,0x020,%g1
	stda	%f22,[%g1+%l6]ASI_PST8_S ! Mem[0000000030141420] = bfb9b1e8aa3dc13d
!	%l4 = 00000000000000ff, Mem[0000000030041410] = 00f40000
	stwa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	%f16 = 0000ff00 00000000, %l7 = 00000000ffffffff
!	Mem[00000000300c1430] = ffffffff000060ff
	add	%i3,0x030,%g1
	stda	%f16,[%g1+%l7]ASI_PST16_S ! Mem[00000000300c1430] = 0000ff0000000000
!	%f26 = 30b2ff00 000000ff, %l1 = 00000000e2fa6a9a
!	Mem[0000000010101410] = d89af845ff000000
	add	%i4,0x010,%g1
	stda	%f26,[%g1+%l1]ASI_PST16_P ! Mem[0000000010101410] = 30b2f84500000000
!	Mem[0000000010141400] = 0000ff00, %l3 = 0000000000000059
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181428] = 00000000, %l2 = 0000000000000047
	ldsba	[%i6+0x029]%asi,%l2	! %l2 = 0000000000000000

p0_label_127:
!	Mem[0000000010001400] = 000000ff, %l0 = 00000000865f0000
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 01ffffff, %l1 = 00000000e2fa6a9a
	ldsba	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000001
!	Mem[0000000030041408] = 00005f86, %l0 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l7 = 00000000ffffffff
	ldsha	[%i6+%o4]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010041410] = e03e00ff, %l5 = 00555a56ff000000
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 00000000e03e00ff
!	Mem[0000000010101400] = 59c10000ffffffff, %l3 = 0000000000000000
	ldx	[%i4+%g0],%l3		! %l3 = 59c10000ffffffff
!	Mem[0000000020800000] = 00e0348e, %l6 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000e0
!	Mem[0000000010041400] = ff600000, %l4 = 00000000000000ff
	ldsba	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1408] = 95dcd2ff, %f8  = 0000f400
	lda	[%i3+%o4]0x88,%f8 	! %f8 = 95dcd2ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 59000000, %l0 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 0000000059000000

p0_label_128:
!	%l2 = 0000000000000000, Mem[0000000030141400] = 00000000
	stwa	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l4 = ffffffffffffffff, Mem[00000000100c1408] = 8df21cba95dcd2ff
	stxa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffffffffffff
!	Mem[0000000010101410] = 45f8b230, %l6 = 00000000000000e0
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 00000030000000ff
!	%l1 = 0000000000000001, Mem[0000000010001410] = 000000ff565a5500
	stx	%l1,[%i0+%o5]		! Mem[0000000010001410] = 0000000000000001
!	Mem[0000000030101410] = 7c07dcb2, %l0 = 0000000059000000
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 000000007c07dcb2
!	%f20 = ff000000 37ee06b7, Mem[0000000030001410] = 4cabee7b ffffffff
	stda	%f20,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000000 37ee06b7
!	%l4 = ffffffff, %l5 = e03e00ff, Mem[0000000010181408] = 4b000000 f71c8bfe
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffff e03e00ff
!	%f16 = 0000ff00 00000000, %l2 = 0000000000000000
!	Mem[00000000300c1408] = 760000004cabee7b
	add	%i3,0x008,%g1
	stda	%f16,[%g1+%l2]ASI_PST8_SL ! Mem[00000000300c1408] = 760000004cabee7b
!	%l3 = 59c10000ffffffff, Mem[0000000010001428] = ffffffff4747ff45, %asi = 80
	stxa	%l3,[%i0+0x028]%asi	! Mem[0000000010001428] = 59c10000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000ff000000, %f10 = 59c10000 95dcd09e
	ldda	[%i2+%g0]0x89,%f10	! %f10 = 00000000 ff000000

p0_label_129:
!	Mem[000000001010141c] = 209c0000, %l1 = 0000000000000001
	ldub	[%i4+0x01c],%l1		! %l1 = 0000000000000020
!	Mem[0000000010001400] = 000000ff, %l3 = 59c10000ffffffff
	lduwa	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001408] = bad3b4fb, %l2 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l2	! %l2 = 00000000bad3b4fb
!	Mem[0000000010181400] = 00000002ffffffff, %l4 = ffffffffffffffff
	ldxa	[%i6+0x000]%asi,%l4	! %l4 = 00000002ffffffff
!	Mem[00000000211c0000] = ffff217a, %l0 = 000000007c07dcb2
	ldsb	[%o2+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000201c0000] = 000786d9, %l3 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000007
!	Mem[00000000100c1420] = bfa0033fc3bb6069, %l0 = ffffffffffffffff
	ldx	[%i3+0x020],%l0		! %l0 = bfa0033fc3bb6069
!	Mem[0000000010041404] = 005500ff, %l1 = 0000000000000020
	ldsh	[%i1+0x004],%l1		! %l1 = 0000000000000055
!	Mem[0000000030101400] = 0f010000, %l2 = 00000000bad3b4fb
	lduwa	[%i4+%g0]0x81,%l2	! %l2 = 000000000f010000
!	Starting 10 instruction Store Burst
!	%f30 = ff005500, Mem[0000000030181410] = 00000000
	sta	%f30,[%i6+%o5]0x81	! Mem[0000000030181410] = ff005500

p0_label_130:
!	%l5 = 00000000e03e00ff, Mem[0000000021800040] = f1679f3e
	stb	%l5,[%o3+0x040]		! Mem[0000000021800040] = ff679f3e
!	%l3 = 0000000000000007, Mem[0000000010141438] = 67089990
	stw	%l3,[%i5+0x038]		! Mem[0000000010141438] = 00000007
!	%f6  = 396695c3 85ab29fa, Mem[0000000010181410] = 00ffb4fb 000060ff
	stda	%f6 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 396695c3 85ab29fa
!	Mem[0000000030101400] = 0f010000, %l7 = ffffffffffffff00
	swapa	[%i4+%g0]0x81,%l7	! %l7 = 000000000f010000
!	%l7 = 000000000f010000, imm = fffffffffffffa3d, %l2 = 000000000f010000
	and	%l7,-0x5c3,%l2		! %l2 = 000000000f010000
!	Mem[0000000030041408] = 865f0000, %l0 = bfa0033fc3bb6069
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 00000000865f0000
!	%f16 = 0000ff00 00000000, Mem[0000000010041400] = ff600000 005500ff
	stda	%f16,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000ff00 00000000
!	Mem[0000000010141400] = ffff0000, %l2 = 000000000f010000
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[000000001008141c] = c3956639, %l1 = 0000000000000055
	ldstuba	[%i2+0x01c]%asi,%l1	! %l1 = 000000c3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 45f8b2ff, %l4 = 00000002ffffffff
	ldsba	[%i4+%o5]0x88,%l4	! %l4 = ffffffffffffffff

p0_label_131:
!	Mem[0000000030001408] = fbb4d3ba00000000, %f2  = 24ac00ff 0000003c
	ldda	[%i0+%o4]0x81,%f2 	! %f2  = fbb4d3ba 00000000
!	Mem[0000000010001400] = 67000000 ff000000, %l0 = 865f0000, %l1 = 000000c3
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 00000000ff000000 0000000067000000
!	%f20 = ff000000, %f26 = 30b2ff00, %f30 = ff005500 000000ff
	fsmuld	%f20,%f26,%f30		! %f30 = c6065fe0 00000000
!	Mem[0000000030081408] = 384cb4ff, %l3 = 0000000000000007
	lduba	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000038
!	Mem[0000000030081408] = 384cb4ff 00000000, %l6 = 00000030, %l7 = 0f010000
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 00000000384cb4ff 0000000000000000
!	Mem[0000000021800040] = ff679f3e, %l7 = 0000000000000000
	ldub	[%o3+0x040],%l7		! %l7 = 00000000000000ff
!	Code Fragment 3
p0_fragment_15:
!	%l0 = 00000000ff000000
	setx	0xaddda057fcdffdfc,%g7,%l0 ! %l0 = addda057fcdffdfc
!	%l1 = 0000000067000000
	setx	0x257896d8358059de,%g7,%l1 ! %l1 = 257896d8358059de
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = addda057fcdffdfc
	setx	0xf1b2485067a25beb,%g7,%l0 ! %l0 = f1b2485067a25beb
!	%l1 = 257896d8358059de
	setx	0x2e08cab05cb93e28,%g7,%l1 ! %l1 = 2e08cab05cb93e28
!	Mem[0000000030081410] = 00000000, %f10 = 00000000
	lda	[%i2+%o5]0x89,%f10	! %f10 = 00000000
!	Mem[0000000010141438] = 00000007, %l5 = 00000000e03e00ff
	ldsw	[%i5+0x038],%l5		! %l5 = 0000000000000007
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 00000038, Mem[0000000010081420] = 79f03651 6769f01f
	stda	%l2,[%i2+0x020]%asi	! Mem[0000000010081420] = 000000ff 00000038

p0_label_132:
!	Mem[00000000300c1410] = fbb4d3ba, %l3 = 0000000000000038
	ldstuba	[%i3+%o5]0x81,%l3	! %l3 = 000000fb000000ff
!	Mem[00000000300c1400] = 00000000, %l6 = 00000000384cb4ff
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 30b2ff00, %l3 = 00000000000000fb
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 0000000030b2ff00
!	Mem[0000000020800000] = 00e0348e, %l2 = 00000000000000ff
	ldstub	[%o1+%g0],%l2		! %l2 = 00000000000000ff
!	%l3 = 0000000030b2ff00, Mem[0000000010081400] = 565a5500
	stwa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 30b2ff00
!	%f10 = 00000000 ff000000, Mem[0000000010181410] = 396695c3 85ab29fa
	std	%f10,[%i6+%o5]	! Mem[0000000010181410] = 00000000 ff000000
!	Mem[0000000030181408] = ff000000, %l5 = 0000000000000007
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%l4 = ffffffffffffffff, Mem[0000000030041408] = 6960bbc3
	stha	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffbbc3
!	Mem[0000000010081418] = fa29ab85ff956639, %l5 = 00000000000000ff, %l4 = ffffffffffffffff
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = fa29ab85ff956639
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = b706ee37 000000ff, %l2 = 00000000, %l3 = 30b2ff00
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 00000000b706ee37 00000000000000ff

p0_label_133:
!	Mem[00000000100c1410] = ff000000, %l1 = 2e08cab05cb93e28
	lduba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%f28 = 000000ff, %f16 = 0000ff00, %f24 = ff600000
	fdivs	%f28,%f16,%f24		! %l0 = f1b2485067a25c0d, Unfinished, %fsr = 0b00000c00
!	Mem[000000001008141c] = ff956639, %f16 = 0000ff00
	lda	[%i2+0x01c]%asi,%f16	! %f16 = ff956639
!	Mem[0000000010001408] = 00000000, %l0 = f1b2485067a25c0d
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l5 = 00000000000000ff
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 00ffb230, %l0 = 0000000000000000
	ldsha	[%i2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101428] = b675f7df, %l3 = 00000000000000ff
	ldsw	[%i4+0x028],%l3		! %l3 = ffffffffb675f7df
!	Code Fragment 4
p0_fragment_16:
!	%l0 = 00000000000000ff
	setx	0x9acc8477cbbff8b8,%g7,%l0 ! %l0 = 9acc8477cbbff8b8
!	%l1 = 0000000000000000
	setx	0x354aa68824ae0428,%g7,%l1 ! %l1 = 354aa68824ae0428
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9acc8477cbbff8b8
	setx	0x12d4c630322094ee,%g7,%l0 ! %l0 = 12d4c630322094ee
!	%l1 = 354aa68824ae0428
	setx	0x5b56b50f815533a5,%g7,%l1 ! %l1 = 5b56b50f815533a5
!	Mem[0000000010001400] = ff000000, %l5 = 0000000000000000
	ldsba	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000000, %l3 = ffffffffb675f7df
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000

p0_label_134:
!	%l1 = 5b56b50f815533a5, Mem[0000000021800040] = ff679f3e, %asi = 80
	stha	%l1,[%o3+0x040]%asi	! Mem[0000000021800040] = 33a59f3e
!	%l4 = fa29ab85ff956639, Mem[0000000010041400] = 0000ff00
	stha	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 6639ff00
!	%f21 = 37ee06b7, Mem[0000000030141410] = ff000000
	sta	%f21,[%i5+%o5]0x81	! Mem[0000000030141410] = 37ee06b7
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010181410] = b675f7df 000000ff
	stda	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 000000ff
!	%f20 = ff000000 37ee06b7, %l2 = 00000000b706ee37
!	Mem[0000000010101410] = ffb2f84500000000
	add	%i4,0x010,%g1
	stda	%f20,[%g1+%l2]ASI_PST8_P ! Mem[0000000010101410] = ffb2000000ee06b7
!	%l1 = 5b56b50f815533a5, Mem[0000000030181410] = 005500ff
	stwa	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 815533a5
!	%l4 = ff956639, %l5 = 00000000, Mem[0000000010001408] = 00000000 000000e0
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = ff956639 00000000
!	%f19 = 686a0900, Mem[0000000010081410] = fbb4d3ba
	sta	%f19,[%i2+%o5]0x80	! Mem[0000000010081410] = 686a0900
!	%l2 = 00000000b706ee37, Mem[0000000010101400] = 59c10000ffffffff
	stxa	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000b706ee37
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffb4d3ba, %l1 = 5b56b50f815533a5
	lduwa	[%i3+%o5]0x81,%l1	! %l1 = 00000000ffb4d3ba

p0_label_135:
!	Mem[0000000030081410] = 00000000, %l5 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001414] = 00000001, %l5 = 0000000000000000
	ldsw	[%i0+0x014],%l5		! %l5 = 0000000000000001
!	Mem[00000000100c1408] = ffffffff, %l5 = 0000000000000001
	lduha	[%i3+%o4]0x88,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010101410] = 0000b2ff, %l5 = 000000000000ffff
	ldswa	[%i4+%o5]0x88,%l5	! %l5 = 000000000000b2ff
!	Mem[0000000010041400] = 6639ff00, %f3  = 00000000
	ld	[%i1+%g0],%f3 	! %f3 = 6639ff00
!	Mem[00000000100c1408] = ffffffff ffffffff, %l4 = ff956639, %l5 = 0000b2ff
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010181408] = ffffffff, %l1 = 00000000ffb4d3ba
	ldsba	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001400] = ffffff01, %l6 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = ffffffffffffff01
!	Mem[00000000100c1408] = ffffffff, %l1 = ffffffffffffffff
	ldsba	[%i3+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f0  = ff003ee0, Mem[0000000010001404] = 00000067
	sta	%f0 ,[%i0+0x004]%asi	! Mem[0000000010001404] = ff003ee0

p0_label_136:
!	%f16 = ff956639 00000000 000000ff 686a0900
!	%f20 = ff000000 37ee06b7 bfa0033f c3bb6069
!	%f24 = ff600000 fbb4d3ba 30b2ff00 000000ff
!	%f28 = 000000ff 000000c7 c6065fe0 00000000
	stda	%f16,[%i6]ASI_BLK_P	! Block Store to 0000000010181400
!	%l0 = 12d4c630322094ee, Mem[00000000100c1408] = ffffffff
	stba	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = eeffffff
!	%l4 = 00000000ffffffff, Mem[0000000010141438] = 000000070000004b
	stx	%l4,[%i5+0x038]		! Mem[0000000010141438] = 00000000ffffffff
!	%f0  = ff003ee0 45f89ad8, Mem[0000000030081408] = ffb44c38 00000000
	stda	%f0 ,[%i2+%o4]0x89	! Mem[0000000030081408] = ff003ee0 45f89ad8
!	Mem[0000000030101400] = 00ffffff, %l7 = 00000000000000ff
	ldstuba	[%i4+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	%f8  = 95dcd2ff 000000ff, %l2 = 00000000b706ee37
!	Mem[0000000030001428] = 0000000000000000
	add	%i0,0x028,%g1
	stda	%f8,[%g1+%l2]ASI_PST32_S ! Mem[0000000030001428] = 95dcd2ff000000ff
!	%l0 = 322094ee, %l1 = ffffffff, Mem[0000000010101408] = 00000000 e30000ff
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 322094ee ffffffff
!	%l1 = ffffffffffffffff, Mem[00000000201c0000] = 000786d9
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = ffff86d9
!	%l2 = 00000000b706ee37, Mem[0000000030101410] = 0000005900001501
	stxa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000b706ee37
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = e03e00ff, %l5 = 00000000ffffffff
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 00000000e03e00ff

p0_label_137:
!	Mem[00000000100c1408] = ffffffee, %l2 = 00000000b706ee37
	lduwa	[%i3+%o4]0x88,%l2	! %l2 = 00000000ffffffee
!	Mem[0000000010041400] = 0000000000ff3966, %f8  = 95dcd2ff 000000ff
	ldda	[%i1+%g0]0x88,%f8 	! %f8  = 00000000 00ff3966
!	Mem[0000000030041400] = 0000ffff, %l5 = 00000000e03e00ff
	lduba	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 00000000bad3b4ff, %f4  = b2a30000 bad3b4fb
	ldda	[%i3+%o5]0x89,%f4 	! %f4  = 00000000 bad3b4ff
!	Mem[00000000300c1400] = 7f08b2a3384cb4ff, %l4 = 00000000ffffffff
	ldxa	[%i3+%g0]0x89,%l4	! %l4 = 7f08b2a3384cb4ff
!	Mem[00000000100c1410] = 000000ff 000000ff, %l6 = ffffff01, %l7 = 000000ff
	ldda	[%i3+0x010]%asi,%l6	! %l6 = 00000000000000ff 00000000000000ff
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010181408] = 000000ff, %l4 = 7f08b2a3384cb4ff
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = ffffbbc3, %f10 = 00000000
	lda	[%i1+%o4]0x81,%f10	! %f10 = ffffbbc3
!	Mem[0000000010081408] = 00096a68, %f4  = 00000000
	lda	[%i2+%o4]0x80,%f4 	! %f4 = 00096a68
!	Starting 10 instruction Store Burst
!	%l0 = 322094ee, %l1 = ffffffff, Mem[0000000010001408] = 396695ff 00000000
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 322094ee ffffffff

p0_label_138:
!	Mem[0000000010041400] = 00ff3966, %l2 = 00000000ffffffee
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 00000066000000ff
!	Mem[000000001004143a] = ed00ff84, %l7 = 00000000000000ff
	ldstuba	[%i1+0x03a]%asi,%l7	! %l7 = 000000ff000000ff
!	%l1 = ffffffffffffffff, Mem[0000000010081408] = 00096a68000000ff
	stxa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffffffffffff
!	Mem[00000000211c0000] = ffff217a, %l2 = 0000000000000066
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%l6 = 00000000000000ff, %l6 = 00000000000000ff, %l5 = 00000000000000ff
	xor	%l6,%l6,%l5		! %l5 = 0000000000000000
!	Mem[0000000030001400] = 01ffffff, %l6 = 00000000000000ff
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 00000001000000ff
!	%f14 = 000000ff, Mem[0000000010181410] = ff000000
	sta	%f14,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff
!	%l5 = 0000000000000000, Mem[000000001014141e] = 0000385b
	stb	%l5,[%i5+0x01e]		! Mem[000000001014141c] = 0000005b
!	%f0  = ff003ee0 45f89ad8 fbb4d3ba 6639ff00
!	%f4  = 00096a68 bad3b4ff 396695c3 85ab29fa
!	%f8  = 00000000 00ff3966 ffffbbc3 ff000000
!	%f12 = ff005500 000060ff 000000ff 45f89ad8
	stda	%f0,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = c7000000, %l4 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000c7

p0_label_139:
!	Mem[0000000010141408] = 00000000000000ff, %l3 = 0000000000000000
	ldxa	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101408] = fb000000, %l6 = 0000000000000001
	lduba	[%i4+%o4]0x81,%l6	! %l6 = 00000000000000fb
!	Mem[0000000030001400] = ffffffff00007941, %l1 = ffffffffffffffff
	ldxa	[%i0+%g0]0x81,%l1	! %l1 = ffffffff00007941
!	Mem[0000000030181408] = 000000ff, %l1 = ffffffff00007941
	ldsha	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010001410] = 00096a68, %l2 = 00000000000000ff
	ldsha	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000009
!	Mem[00000000201c0000] = ffff86d9, %l1 = 00000000000000ff
	ldub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030081410] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 000000ff, %l6 = 00000000000000fb
	lduba	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l0 = 12d4c630322094ee
	lduha	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = ff003ee0 45f89ad8, %l1 = 00000000000000ff
!	Mem[0000000030101418] = facee6f611317c96
	add	%i4,0x018,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030101418] = d89af845e03e00ff

p0_label_140:
!	Mem[0000000010001408] = fbb4d3ba, %l4 = 00000000000000c7
	swapa	[%i0+%o4]0x80,%l4	! %l4 = 00000000fbb4d3ba
!	%l3 = 0000000000000000, Mem[0000000030101400] = ffffff000cae2517
	stxa	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	%f12 = ff005500 000060ff, %l5 = 0000000000000000
!	Mem[0000000030101410] = 00000000b706ee37
	add	%i4,0x010,%g1
	stda	%f12,[%g1+%l5]ASI_PST16_S ! Mem[0000000030101410] = 00000000b706ee37
!	%l1 = 00000000000000ff, Mem[0000000030101400] = 00000000
	stha	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 00ff0000
!	%f10 = ffffbbc3, Mem[0000000030181410] = 815533a5
	sta	%f10,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffbbc3
!	%f30 = c6065fe0 00000000, Mem[0000000030181400] = ff00ac24 3c000000
	stda	%f30,[%i6+%g0]0x89	! Mem[0000000030181400] = c6065fe0 00000000
!	%f11 = ff000000, Mem[0000000010141400] = ffff0000
	sta	%f11,[%i5+%g0]0x80	! Mem[0000000010141400] = ff000000
!	Mem[00000000100c141c] = 76b4c833, %l1 = 000000ff, %l1 = 000000ff
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 0000000076b4c833
!	%l2 = 0000000000000009, Mem[0000000010041410] = ff003ee0
	stwa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000009
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff86d9, %l4 = 00000000fbb4d3ba
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffff

p0_label_141:
!	%l7 = 00000000000000ff, Mem[00000000100c1410] = ff000000
	stha	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff0000ff
!	Mem[0000000030101410] = 00000000 b706ee37, %l2 = 00000009, %l3 = 00000000
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000 00000000b706ee37
!	Mem[0000000010141410] = c7000000ff000000, %f12 = ff005500 000060ff
	ldda	[%i5+%o5]0x80,%f12	! %f12 = c7000000 ff000000
!	Mem[0000000030041410] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181400] = 00000000, %l3 = 00000000b706ee37
	lduha	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = 37ee06b7 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000 0000000037ee06b7
!	Mem[0000000010081400] = 30b2ff00, %f14 = 000000ff
	lda	[%i2+%g0]0x88,%f14	! %f14 = 30b2ff00
!	Mem[0000000030001400] = ffffffff, %l7 = 00000000000000ff
	lduba	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001400] = ffffffff, %f28 = 000000ff
	lda	[%i0+%g0]0x89,%f28	! %f28 = ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 000000ff000000ff

p0_label_142:
!	%l7 = 00000000000000ff, Mem[0000000010181410] = ff000000
	stha	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = ff0000ff
!	%l7 = 00000000000000ff, Mem[0000000010181410] = ff0000ff
	stha	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 00ff00ff
!	Mem[0000000030041408] = ffffbbc3, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 00000000ffffbbc3
!	%f14 = 30b2ff00, Mem[0000000010101408] = 322094ee
	sta	%f14,[%i4+%o4]0x88	! Mem[0000000010101408] = 30b2ff00
!	%f20 = ff000000 37ee06b7, %l5 = 0000000000000000
!	Mem[0000000010081410] = 686a090000000000
	add	%i2,0x010,%g1
	stda	%f20,[%g1+%l5]ASI_PST16_P ! Mem[0000000010081410] = 686a090000000000
!	%f16 = ff956639, Mem[0000000010041410] = 09000000
	sta	%f16,[%i1+%o5]0x88	! Mem[0000000010041410] = ff956639
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010001400] = e03e00ff d89af845
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff 000000ff
!	%f14 = 30b2ff00 45f89ad8, Mem[0000000030081410] = 00000000 00000000
	stda	%f14,[%i2+%o5]0x89	! Mem[0000000030081410] = 30b2ff00 45f89ad8
!	Mem[00000000300c1400] = 384cb4ff, %l2 = 00000000ffffbbc3
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffffffff 00007941 fbb4d3ba 00000000
!	Mem[0000000030001410] = b706ee37 000000ff facee6f6 90990867
!	Mem[0000000030001420] = bd23ccf3 0cae2517 95dcd2ff 000000ff
!	Mem[0000000030001430] = 97f0269d 99d0c51c 00000000 a3b2087f
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400

p0_label_143:
!	Mem[00000000100c1408] = eeffffff, %l4 = ffffffffffffffff
	ldsb	[%i3+0x00b],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010101410] = 0000b2ff, %l0 = ffffffffffffffff
	ldswa	[%i4+%o5]0x88,%l0	! %l0 = 000000000000b2ff
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010101400] = 00000000 b706ee37 00ffb230 ffffffff
!	Mem[0000000010101410] = ffb20000 00ee06b7 ad02b0fb 209c0000
!	Mem[0000000010101420] = 00000000 565a5500 b675f7df d63973fc
!	Mem[0000000010101430] = 54a78db1 00002668 2bb57afb cef31cc7
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Mem[0000000030001400] = ffffffff, %l2 = 00000000000000ff
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030181400] = 00000000, %l0 = 000000000000b2ff
	lduwa	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 45f89ad8, %l7 = 00000000000000ff
	ldswa	[%i2+%o4]0x89,%l7	! %l7 = 0000000045f89ad8
!	Mem[0000000010081410] = 686a0900, %l1 = 0000000076b4c833
	lduba	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000068
!	Mem[00000000300c1400] = 7f08b2a3384cb4ff, %l2 = 000000000000ffff
	ldxa	[%i3+%g0]0x89,%l2	! %l2 = 7f08b2a3384cb4ff
!	Mem[0000000010081408] = ffffffff ffffffff, %l0 = 00000000, %l1 = 00000068
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000ffffffff 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ffff86d9, %l1 = 00000000ffffffff
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 000000ff000000ff

p0_label_144:
!	Mem[0000000010101438] = 2bb57afbcef31cc7, %l3 = 0000000037ee06b7
	ldxa	[%i4+0x038]%asi,%l3	! %l3 = 2bb57afbcef31cc7
!	Mem[0000000030141410] = 37ee06b7, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 0000000037ee06b7
!	Mem[00000000218001c1] = ffffa92c, %l7 = 0000000045f89ad8
	ldstuba	[%o3+0x1c1]%asi,%l7	! %l7 = 000000ff000000ff
!	%f28 = 97f0269d, Mem[0000000010041438] = ed00ff84
	sta	%f28,[%i1+0x038]%asi	! Mem[0000000010041438] = 97f0269d
!	Mem[000000001004142c] = 0000003c, %l1 = 000000ff, %l4 = ffffffff
	add	%i1,0x2c,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 000000000000003c
!	%l6 = 00000000000000ff, Mem[0000000030081400] = 000000ff
	stha	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 00ff00ff
!	%l2 = 7f08b2a3384cb4ff, Mem[00000000201c0001] = ffff86d9
	stb	%l2,[%o0+0x001]		! Mem[00000000201c0000] = ffff86d9
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010041430] = cf7378e0 87ff69a8
	std	%l6,[%i1+0x030]		! Mem[0000000010041430] = 000000ff 000000ff
!	%f30 = 00000000 a3b2087f, %l6 = 00000000000000ff
!	Mem[00000000300c1430] = 0000ff0000000000
	add	%i3,0x030,%g1
	stda	%f30,[%g1+%l6]ASI_PST8_S ! Mem[00000000300c1430] = 00000000a3b2087f
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000, %l1 = 00000000000000ff
	lduba	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_145:
!	Mem[00000000300c1408] = 76000000, %l3 = 2bb57afbcef31cc7
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 0000000000007600
!	Mem[0000000030081408] = 45f89ad8, %l2 = 7f08b2a3384cb4ff
	ldswa	[%i2+%o4]0x89,%l2	! %l2 = 0000000045f89ad8
!	Mem[0000000010101428] = b675f7df, %l7 = 00000000000000ff
	lduw	[%i4+0x028],%l7		! %l7 = 00000000b675f7df
!	Mem[0000000010101400] = 00000000, %l0 = 00000000ffffffff
	lduha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = 30b2ff00 45f89ad8, %l6 = 000000ff, %l7 = b675f7df
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 0000000045f89ad8 0000000030b2ff00
!	Mem[0000000010001410] = ffb4d3ba686a0900, %f26 = 95dcd2ff 000000ff
	ldda	[%i0+%o5]0x88,%f26	! %f26 = ffb4d3ba 686a0900
!	Mem[0000000021800100] = 78e0d1b9, %l0 = 0000000000000000
	lduba	[%o3+0x100]%asi,%l0	! %l0 = 0000000000000078
!	Mem[0000000010101408] = 00ffb230, %l1 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 000000ff, %l5 = 0000000037ee06b7
	lduwa	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 396695ff, %l4 = 000000000000003c, %asi = 80
	swapa	[%i1+0x010]%asi,%l4	! %l4 = 00000000396695ff

p0_label_146:
!	%l1 = 0000000000000000, Mem[0000000030101410] = 00000000
	stha	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l6 = 0000000045f89ad8, Mem[0000000030181410] = c3bbffff565a5500
	stxa	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000045f89ad8
!	%l2 = 0000000045f89ad8, Mem[0000000020800041] = 92ffd1fd
	stb	%l2,[%o1+0x041]		! Mem[0000000020800040] = 92d8d1fd
!	%l1 = 0000000000000000, Mem[00000000300c1408] = 00000076
	stba	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l0 = 0000000000000078, Mem[0000000030101410] = 37ee06b700000000
	stxa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000078
!	%f22 = facee6f6, Mem[0000000010181408] = 000000ff
	sta	%f22,[%i6+0x008]%asi	! Mem[0000000010181408] = facee6f6
!	Mem[0000000010041400] = ff39ff00, %l7 = 0000000030b2ff00
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 00000000ff39ff00
!	%l3 = 0000000000007600, Mem[0000000030001410] = b706ee37000000ff
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000007600
!	Mem[0000000010001408] = 000000c7, %l0 = 00000078, %l5 = 000000ff
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000000000c7
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000 b706ee37, %l6 = 45f89ad8, %l7 = ff39ff00
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000 00000000b706ee37

p0_label_147:
!	%l7 = 00000000b706ee37, %l7 = 00000000b706ee37, %l4 = 00000000396695ff
	orn	%l7,%l7,%l4		! %l4 = ffffffffffffffff
!	Mem[00000000300c1400] = 7f08b2a3384cb4ff, %f16 = ffffffff 00007941
	ldda	[%i3+%g0]0x89,%f16	! %f16 = 7f08b2a3 384cb4ff
!	Mem[0000000010141410] = c7000000ff000000, %l1 = 0000000000000000
	ldx	[%i5+%o5],%l1		! %l1 = c7000000ff000000
!	Mem[00000000201c0000] = ffff86d9, %l3 = 0000000000007600
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181434] = 000000c7, %l7 = 00000000b706ee37
	ldsw	[%i6+0x034],%l7		! %l7 = 00000000000000c7
!	Mem[0000000010041400] = 30b2ff0000000000, %l4 = ffffffffffffffff
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = 30b2ff0000000000
!	Mem[00000000300c1400] = 384cb4ff, %l6 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l6	! %l6 = 000000000000b4ff
!	Mem[0000000010041408] = 47000000, %l5 = 00000000000000c7
	lduwa	[%i1+%o4]0x80,%l5	! %l5 = 0000000047000000
!	Mem[00000000100c1408] = eeffffff, %l1 = c7000000ff000000
	ldub	[%i3+%o4],%l1		! %l1 = 00000000000000ee
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = d89af845, %l7 = 00000000000000c7
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 00000000d89af845

p0_label_148:
!	%l1 = 00000000000000ee, Mem[0000000010041408] = 47000000
	stba	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = ee000000
!	%l0 = 0000000000000078, Mem[0000000030181408] = 000000ff
	stwa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000078
!	%l4 = 00000000, %l5 = 47000000, Mem[0000000030101400] = 0000ff00 00000000
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 47000000
!	%l2 = 0000000045f89ad8, immd = 0000000000000126, %l5 = 0000000047000000
	sdivx	%l2,0x126,%l5		! %l5 = 00000000003ced5e
!	%f6  = ad02b0fb 209c0000, Mem[0000000030181408] = 78000000 000000e0
	stda	%f6 ,[%i6+%o4]0x81	! Mem[0000000030181408] = ad02b0fb 209c0000
!	%l3 = ffffffffffffffff, Mem[00000000100c1407] = 00000000
	stb	%l3,[%i3+0x007]		! Mem[00000000100c1404] = 000000ff
!	Mem[0000000030041400] = 0000ffff, %l4 = 30b2ff0000000000
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (22)
!	%f14 = 2bb57afb cef31cc7, Mem[0000000010101408] = 00ffb230 ffffffff
	stda	%f14,[%i4+%o4]0x80	! Mem[0000000010101408] = 2bb57afb cef31cc7
!	Mem[000000001000142f] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i0+0x02f]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l3 = ffffffffffffffff
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000

p0_label_149:
!	Mem[0000000030041408] = 00000000, %f27 = 686a0900
	lda	[%i1+%o4]0x81,%f27	! %f27 = 00000000
!	Mem[0000000010081400] = 30b2ff00, %l5 = 00000000003ced5e
	ldswa	[%i2+%g0]0x88,%l5	! %l5 = 0000000030b2ff00
!	Mem[0000000010181438] = c6065fe0, %l6 = 000000000000b4ff
	lduwa	[%i6+0x038]%asi,%l6	! %l6 = 00000000c6065fe0
!	Mem[0000000030041408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = ff956639, %l1 = 00000000000000ee
	lduwa	[%i6+0x000]%asi,%l1	! %l1 = 00000000ff956639
!	Mem[0000000010181428] = 30b2ff00, %f13 = 00002668
	lda	[%i6+0x028]%asi,%f13	! %f13 = 30b2ff00
!	Mem[0000000010001410] = 00096a68 bad3b4ff, %l4 = 00000000, %l5 = 30b2ff00
	ldda	[%i0+0x010]%asi,%l4	! %l4 = 0000000000096a68 00000000bad3b4ff
!	Mem[00000000300c1400] = ffb44c38, %l7 = 00000000d89af845
	lduwa	[%i3+%g0]0x81,%l7	! %l7 = 00000000ffb44c38
!	Mem[0000000010141400] = 000000ff, %f14 = 2bb57afb
	lda	[%i5+%g0]0x88,%f14	! %f14 = 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081428] = 9ed0dc95, %l6 = c6065fe0, %l0 = 00000078
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l6,%l0	! %l0 = 000000009ed0dc95

p0_label_150:
!	%l7 = 00000000ffb44c38, Mem[0000000030181400] = 00000000e05f06c6
	stxa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000ffb44c38
!	%l7 = 00000000ffb44c38, Mem[00000000201c0000] = ffff86d9, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 4c3886d9
!	Mem[0000000010181400] = ff956639, %l1 = 00000000ff956639
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 00000000ff956639
!	%l0 = 9ed0dc95, %l1 = ff956639, Mem[0000000010081400] = 00ffb230 a3b2087f
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 9ed0dc95 ff956639
!	%l5 = 00000000bad3b4ff, Mem[0000000010081438] = d89af845b706eeb7, %asi = 80
	stxa	%l5,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000000bad3b4ff
!	%l2 = 0000000045f89ad8, Mem[0000000030101410] = 78000000
	stba	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = d8000000
!	Mem[0000000020800000] = ffe0348e, %l1 = 00000000ff956639
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	%f1  = b706ee37, Mem[0000000010141410] = c7000000
	sta	%f1 ,[%i5+%o5]0x80	! Mem[0000000010141410] = b706ee37
!	%l1 = 00000000000000ff, Mem[0000000030001400] = ffffffff00007941
	stxa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = fb7ab52b, %l2 = 0000000045f89ad8
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 000000000000002b

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	nop
	xor	%l3,%l4,%l0
	nop
	fsqrts	%f6,%f8
	ldda	[%i6+0x018]%asi,%l0
	addc	%l0,%l6,%l7
	nop
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000009ed0dc95
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 000000000000002b
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000096a68
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000bad3b4ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000c6065fe0
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000ffb44c38
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x00003ee0,%g2
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
	cmp	%l0,%l1			! %f0  should be 00000000 b706ee37
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00ffb230 ffffffff
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ffb20000 00ee06b7
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ad02b0fb 209c0000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 565a5500
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be b675f7df d63973fc
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 54a78db1 30b2ff00
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 000000ff cef31cc7
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 7f08b2a3 384cb4ff
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be fbb4d3ba 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be b706ee37 000000ff
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be facee6f6 90990867
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be bd23ccf3 0cae2517
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ffb4d3ba 00000000
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 97f0269d 99d0c51c
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 a3b2087f
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
	xnor	%l7,%l7,%l0
	subc	%l4,0xf53,%l3
	and	%l5,%l3,%l5
	umul	%l3,%l4,%l5
	done

p0_trap1o:
	xnor	%l7,%l7,%l0
	subc	%l4,0xf53,%l3
	and	%l5,%l3,%l5
	umul	%l3,%l4,%l5
	done


p0_trap2e:
	xnor	%l2,0xc44,%l3
	orn	%l3,%l0,%l7
	done

p0_trap2o:
	xnor	%l2,0xc44,%l3
	orn	%l3,%l0,%l7
	done


p0_trap3e:
	and	%l1,0xbb7,%l0
	done

p0_trap3o:
	and	%l1,0xbb7,%l0
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
	ldx	[%g1+0x000],%l0		! %l0 = 4be4cdca962eb102
	ldx	[%g1+0x008],%l1		! %l1 = 63b84badb5dd8947
	ldx	[%g1+0x010],%l2		! %l2 = 910a96cab8d154a6
	ldx	[%g1+0x018],%l3		! %l3 = cb9467843c875676
	ldx	[%g1+0x020],%l4		! %l4 = 33d72ce6424efbbb
	ldx	[%g1+0x028],%l5		! %l5 = 64d409989c912f53
	ldx	[%g1+0x030],%l6		! %l6 = 8d222d981580d265
	ldx	[%g1+0x038],%l7		! %l7 = d12f015a54cd0fac

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
	xnor	%l7,%l7,%l0
	umul	%l3,0xb0c,%l6
	smul	%l7,%l5,%l5
	add	%l3,%l4,%l1
	sdivx	%l5,0xb8e,%l3
	jmpl	%o7,%g0
	addc	%l5,0xa10,%l0
p0_near_0_he:
	swap	[%i4+0x024],%l5		! Mem[0000000010101424]
	andn	%l0,%l1,%l5
	fsubs	%f26,%f28,%f26
	std	%f24,[%i3+0x010]	! Mem[00000000100c1410]
	jmpl	%o7,%g0
	xnor	%l5,%l4,%l4
near0_b2b_h:
	xnor	%l4,%l5,%l5
	xor	%l0,%l3,%l4
	add	%l0,0x2b8,%l5
	andn	%l6,-0x1a9,%l5
	jmpl	%o7,%g0
	smul	%l5,-0x1ef,%l5
near0_b2b_l:
	fdivs	%f14,%f14,%f13
	xor	%l6,%l7,%l4
	umul	%l6,%l3,%l1
	fdivs	%f3 ,%f10,%f13
	jmpl	%o7,%g0
	xnor	%l1,0xde0,%l0
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	umul	%l2,%l4,%l4
	fcmps	%fcc3,%f3 ,%f1 
	subc	%l1,0xf1e,%l1
	mulx	%l2,%l4,%l7
	xnor	%l2,%l5,%l5
	andn	%l2,-0x959,%l2
	jmpl	%o7,%g0
	andn	%l1,%l0,%l1
p0_near_1_he:
	smul	%l1,0x8bc,%l0
	jmpl	%o7,%g0
	fadds	%f23,%f30,%f30
near1_b2b_h:
	subc	%l6,0x793,%l1
	jmpl	%o7,%g0
	subc	%l4,%l6,%l4
near1_b2b_l:
	sub	%l1,%l2,%l3
	jmpl	%o7,%g0
	xnor	%l3,%l7,%l4
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	or	%l5,%l4,%l7
	add	%l1,-0x78c,%l1
	fcmps	%fcc2,%f2 ,%f15
	xnor	%l0,-0x6c5,%l3
	xnor	%l4,0x7fb,%l3
	jmpl	%o7,%g0
	sub	%l1,%l1,%l1
p0_near_2_he:
	umul	%l0,%l6,%l5
	fcmps	%fcc1,%f16,%f16
	fsubs	%f16,%f17,%f30
	fstoi	%f30,%f19
	smul	%l6,0xf81,%l2
	fcmps	%fcc2,%f25,%f25
	subc	%l2,%l2,%l4
	jmpl	%o7,%g0
	fsubs	%f21,%f29,%f29
near2_b2b_h:
	and	%l1,0x3e4,%l4
	jmpl	%o7,%g0
	udivx	%l5,%l0,%l3
near2_b2b_l:
	umul	%l7,0xb90,%l6
	jmpl	%o7,%g0
	sub	%l2,-0x49e,%l7
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	jmpl	%o7,%g0
	and	%l5,0xda1,%l4
	jmpl	%o7,%g0
	nop
p0_near_3_he:
	jmpl	%o7,%g0
	fdivs	%f30,%f18,%f29
	jmpl	%o7,%g0
	nop
near3_b2b_h:
	xnor	%l3,%l6,%l5
	fsubs	%f18,%f23,%f23
	xnor	%l4,%l4,%l5
	or	%l2,0x1b0,%l4
	jmpl	%o7,%g0
	orn	%l0,-0xbd1,%l0
near3_b2b_l:
	fadds	%f0 ,%f2 ,%f1 
	fcmps	%fcc2,%f11,%f8 
	fdivs	%f8 ,%f0 ,%f11
	fadds	%f2 ,%f2 ,%f13
	jmpl	%o7,%g0
	and	%l7,%l6,%l4
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	xor	%l6,%l7,%l0
	and	%l5,%l1,%l2
	andn	%l5,-0xd39,%l7
	jmpl	%o7,%g0
	mulx	%l4,%l2,%l6
p0_far_0_lem:
	xor	%l6,%l7,%l0
	and	%l5,%l1,%l2
	andn	%l5,-0xd39,%l7
	jmpl	%o7,%g0
	mulx	%l4,%l2,%l6
p0_far_0_he:
	smul	%l7,-0x013,%l3
	subc	%l2,-0xa58,%l2
	sdivx	%l0,%l1,%l0
	xor	%l3,-0x24f,%l6
	fsqrts	%f30,%f29
	subc	%l2,%l0,%l4
	jmpl	%o7,%g0
	subc	%l6,-0x769,%l3
p0_far_0_hem:
	smul	%l7,-0x013,%l3
	subc	%l2,-0xa58,%l2
	sdivx	%l0,%l1,%l0
	xor	%l3,-0x24f,%l6
	fsqrts	%f30,%f29
	subc	%l2,%l0,%l4
	jmpl	%o7,%g0
	subc	%l6,-0x769,%l3
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	jmpl	%o7,%g0
	fmuls	%f17,%f29,%f31
	jmpl	%o7,%g0
	nop
far0_b2b_l:
	jmpl	%o7,%g0
	udivx	%l6,%l4,%l6
	jmpl	%o7,%g0
	nop
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	sub	%l0,0x333,%l4
	jmpl	%o7,%g0
	xnor	%l7,%l3,%l0
p0_far_1_lem:
	sub	%l0,0x333,%l4
	jmpl	%o7,%g0
	xnor	%l7,%l3,%l0
p0_far_1_he:
	addc	%l3,%l5,%l4
	or	%l2,%l7,%l6
	addc	%l6,%l2,%l6
	jmpl	%o7,%g0
	subc	%l6,0x381,%l7
p0_far_1_hem:
	addc	%l3,%l5,%l4
	or	%l2,%l7,%l6
	addc	%l6,%l2,%l6
	jmpl	%o7,%g0
	subc	%l6,0x381,%l7
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	fdivs	%f31,%f23,%f21
	sdivx	%l4,0x306,%l2
	xor	%l6,-0x6e4,%l3
	jmpl	%o7,%g0
	xor	%l6,%l2,%l0
far1_b2b_l:
	xnor	%l6,0x0f0,%l5
	umul	%l5,%l3,%l2
	smul	%l5,%l2,%l7
	jmpl	%o7,%g0
	umul	%l2,-0x052,%l4
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	mulx	%l4,%l3,%l3
	jmpl	%o7,%g0
	udivx	%l5,%l2,%l4
p0_far_2_lem:
	mulx	%l4,%l3,%l3
	jmpl	%o7,%g0
	udivx	%l5,%l2,%l4
p0_far_2_he:
	jmpl	%o7,%g0
	sdivx	%l0,%l2,%l7
	jmpl	%o7,%g0
	nop
p0_far_2_hem:
	jmpl	%o7,%g0
	sdivx	%l0,%l2,%l7
	jmpl	%o7,%g0
	nop
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	jmpl	%o7,%g0
	xnor	%l7,%l7,%l3
	jmpl	%o7,%g0
	nop
far2_b2b_l:
	jmpl	%o7,%g0
	umul	%l7,%l7,%l6
	jmpl	%o7,%g0
	nop
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	ldstub	[%o0+0x000],%l7		! Mem[00000000201c0000]
	fadds	%f14,%f4 ,%f10
	umul	%l0,-0x2e7,%l5
	sdivx	%l4,%l1,%l1
	fcmps	%fcc3,%f14,%f1 
	fdivs	%f7 ,%f4 ,%f6 
	jmpl	%o7,%g0
	and	%l1,%l2,%l1
p0_far_3_lem:
	ldstub	[%o0+0x000],%l7		! Mem[00000000201c0000]
	fadds	%f14,%f4 ,%f10
	umul	%l0,-0x2e7,%l5
	sdivx	%l4,%l1,%l1
	fcmps	%fcc3,%f14,%f1 
	fdivs	%f7 ,%f4 ,%f6 
	jmpl	%o7,%g0
	and	%l1,%l2,%l1
p0_far_3_he:
	jmpl	%o7,%g0
	umul	%l7,-0x91b,%l2
	jmpl	%o7,%g0
	nop
p0_far_3_hem:
	jmpl	%o7,%g0
	umul	%l7,-0x91b,%l2
	jmpl	%o7,%g0
	nop
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fdtos	%f26,%f30
	addc	%l0,0x2d2,%l1
	and	%l0,%l2,%l0
	addc	%l2,0x1f4,%l2
	jmpl	%o7,%g0
	fsqrts	%f19,%f25
far3_b2b_l:
	xnor	%l7,%l4,%l7
	smul	%l0,-0x8cc,%l1
	umul	%l3,%l3,%l6
	smul	%l5,-0xa02,%l6
	jmpl	%o7,%g0
	smul	%l2,0xb15,%l3
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	add	%l0,0x585,%l7
	sub	%l7,-0xddd,%l6
	and	%l3,-0x5c4,%l3
	fcmps	%fcc0,%f3 ,%f13
	or	%l5,0x9df,%l7
	jmpl	%g6+8,%g0
	fmuls	%f0 ,%f2 ,%f9 
p0_call_0_le:
	addc	%l3,%l0,%l1
	fcmps	%fcc0,%f10,%f2 
	and	%l1,-0x84b,%l7
	smul	%l7,-0x70c,%l3
	fdivs	%f5 ,%f6 ,%f15
	retl
	andn	%l3,%l1,%l5
p0_jmpl_0_lo:
	add	%l0,0x585,%l7
	sub	%l7,-0xddd,%l6
	and	%l3,-0x5c4,%l3
	fcmps	%fcc0,%f3 ,%f13
	or	%l5,0x9df,%l7
	jmpl	%g6+8,%g0
	fmuls	%f0 ,%f2 ,%f9 
p0_call_0_lo:
	addc	%l3,%l0,%l1
	fcmps	%fcc0,%f10,%f2 
	and	%l1,-0x84b,%l7
	smul	%l7,-0x70c,%l3
	fdivs	%f5 ,%f6 ,%f15
	retl
	andn	%l3,%l1,%l5
p0_jmpl_0_he:
	and	%l1,-0x2b2,%l6
	fdivs	%f29,%f16,%f18
	jmpl	%g6+8,%g0
	xor	%l7,%l5,%l5
p0_call_0_he:
	xnor	%l2,-0x7bd,%l5
	umul	%l6,%l7,%l2
	retl
	or	%l3,0xb1e,%l7
p0_jmpl_0_ho:
	and	%l1,-0x2b2,%l6
	fdivs	%f29,%f16,%f18
	jmpl	%g6+8,%g0
	xor	%l7,%l5,%l5
p0_call_0_ho:
	xnor	%l2,-0x7bd,%l5
	umul	%l6,%l7,%l2
	retl
	or	%l3,0xb1e,%l7
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	fadds	%f14,%f12,%f7 
	sdivx	%l2,%l7,%l0
	fadds	%f15,%f15,%f11
	smul	%l6,-0x040,%l2
	udivx	%l1,%l3,%l2
	jmpl	%g6+8,%g0
	and	%l4,0xf69,%l5
p0_call_1_le:
	udivx	%l0,%l2,%l3
	xor	%l2,%l4,%l2
	mulx	%l3,0x743,%l2
	retl
	or	%l2,%l4,%l3
p0_jmpl_1_lo:
	fadds	%f14,%f12,%f7 
	sdivx	%l2,%l7,%l0
	fadds	%f15,%f15,%f11
	smul	%l6,-0x040,%l2
	udivx	%l1,%l3,%l2
	jmpl	%g6+8,%g0
	and	%l4,0xf69,%l5
p0_call_1_lo:
	udivx	%l0,%l2,%l3
	xor	%l2,%l4,%l2
	mulx	%l3,0x743,%l2
	retl
	or	%l2,%l4,%l3
p0_jmpl_1_he:
	addc	%l1,0x814,%l6
	mulx	%l1,-0xb53,%l6
	or	%l4,%l2,%l6
	fdivs	%f24,%f18,%f24
	fadds	%f16,%f26,%f27
	orn	%l1,0xbcc,%l2
	umul	%l6,%l5,%l5
	jmpl	%g6+8,%g0
	addc	%l7,0x9e2,%l2
p0_call_1_he:
	xor	%l3,0x809,%l4
	xor	%l4,%l6,%l1
	fadds	%f25,%f30,%f23
	fcmps	%fcc2,%f19,%f19
	add	%l2,-0x938,%l0
	xnor	%l2,%l4,%l7
	subc	%l7,%l4,%l7
	retl
	fsubs	%f18,%f22,%f19
p0_jmpl_1_ho:
	addc	%l1,0x814,%l6
	mulx	%l1,-0xb53,%l6
	or	%l4,%l2,%l6
	fdivs	%f24,%f18,%f24
	fadds	%f16,%f26,%f27
	orn	%l1,0xbcc,%l2
	umul	%l6,%l5,%l5
	jmpl	%g6+8,%g0
	addc	%l7,0x9e2,%l2
p0_call_1_ho:
	xor	%l3,0x809,%l4
	xor	%l4,%l6,%l1
	fadds	%f25,%f30,%f23
	fcmps	%fcc2,%f19,%f19
	add	%l2,-0x938,%l0
	xnor	%l2,%l4,%l7
	subc	%l7,%l4,%l7
	retl
	fsubs	%f18,%f22,%f19
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	sub	%l5,%l7,%l0
	sth	%l4,[%i0+0x030]		! Mem[0000000010001430]
	orn	%l2,0x7e5,%l2
	jmpl	%g6+8,%g0
	xor	%l4,%l5,%l2
p0_call_2_le:
	retl
	smul	%l5,0x5ff,%l6
p0_jmpl_2_lo:
	sub	%l5,%l7,%l0
	sth	%l4,[%o0+0x030]		! Mem[0000000010001430]
	orn	%l2,0x7e5,%l2
	jmpl	%g6+8,%g0
	xor	%l4,%l5,%l2
p0_call_2_lo:
	retl
	smul	%l5,0x5ff,%l6
p0_jmpl_2_he:
	jmpl	%g6+8,%g0
	and	%l7,0xed8,%l1
p0_call_2_he:
	xnor	%l6,-0x97a,%l4
	fadds	%f24,%f22,%f26
	retl
	add	%l2,0x874,%l2
p0_jmpl_2_ho:
	jmpl	%g6+8,%g0
	and	%l7,0xed8,%l1
p0_call_2_ho:
	xnor	%l6,-0x97a,%l4
	fadds	%f24,%f22,%f26
	retl
	add	%l2,0x874,%l2
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	lduh	[%i2+0x034],%l6		! Mem[0000000010081434]
	fcmps	%fcc3,%f2 ,%f7 
	xnor	%l7,-0xa79,%l5
	smul	%l4,-0xb39,%l6
	umul	%l3,%l0,%l6
	xor	%l2,0xb8f,%l3
	jmpl	%g6+8,%g0
	fdivs	%f10,%f10,%f12
p0_call_3_le:
	ldstub	[%o0+0x000],%l4		! Mem[00000000201c0000]
	std	%l4,[%i6+0x038]		! Mem[0000000010181438]
	retl
	fsqrts	%f14,%f6 
p0_jmpl_3_lo:
	lduh	[%o2+0x034],%l6		! Mem[0000000010081434]
	fcmps	%fcc3,%f2 ,%f7 
	xnor	%l7,-0xa79,%l5
	smul	%l4,-0xb39,%l6
	umul	%l3,%l0,%l6
	xor	%l2,0xb8f,%l3
	jmpl	%g6+8,%g0
	fdivs	%f10,%f10,%f12
p0_call_3_lo:
	ldstub	[%i0+0x000],%l4		! Mem[00000000201c0000]
	std	%l4,[%o6+0x038]		! Mem[0000000010181438]
	retl
	fsqrts	%f14,%f6 
p0_jmpl_3_he:
	jmpl	%g6+8,%g0
	xor	%l1,0x6df,%l3
p0_call_3_he:
	sub	%l7,%l2,%l4
	sdivx	%l2,0x209,%l5
	smul	%l0,-0x84e,%l3
	umul	%l5,%l6,%l2
	or	%l6,%l1,%l1
	xnor	%l7,%l5,%l7
	retl
	add	%l6,%l0,%l7
p0_jmpl_3_ho:
	jmpl	%g6+8,%g0
	xor	%l1,0x6df,%l3
p0_call_3_ho:
	sub	%l7,%l2,%l4
	sdivx	%l2,0x209,%l5
	smul	%l0,-0x84e,%l3
	umul	%l5,%l6,%l2
	or	%l6,%l1,%l1
	xnor	%l7,%l5,%l7
	retl
	add	%l6,%l0,%l7
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
	.word	0x4be4cdca,0x962eb102		! Init value for %l0
	.word	0x63b84bad,0xb5dd8947		! Init value for %l1
	.word	0x910a96ca,0xb8d154a6		! Init value for %l2
	.word	0xcb946784,0x3c875676		! Init value for %l3
	.word	0x33d72ce6,0x424efbbb		! Init value for %l4
	.word	0x64d40998,0x9c912f53		! Init value for %l5
	.word	0x8d222d98,0x1580d265		! Init value for %l6
	.word	0xd12f015a,0x54cd0fac		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xfdb1b977,0xe8e0918e		! Init value for %f0 
	.word	0xd2a2d449,0x24d1c567		! Init value for %f2 
	.word	0x384cb463,0x5b246f33		! Init value for %f4 
	.word	0x2833495e,0x6d076649		! Init value for %f6 
	.word	0xae2dd250,0xa10cbcc7		! Init value for %f8 
	.word	0xe9975724,0xd5d4cb02		! Init value for %f10
	.word	0x211421be,0x638525c6		! Init value for %f12
	.word	0xe58fcdda,0xdbeeda90		! Init value for %f14
	.word	0xe9d55bfd,0xb93cb2c0		! Init value for %f16
	.word	0xf985f7e1,0x545dc48f		! Init value for %f18
	.word	0x11d3f94d,0x3e9acad9		! Init value for %f20
	.word	0x602d1509,0x56a38f33		! Init value for %f22
	.word	0x9d9154dc,0xe8a2b647		! Init value for %f24
	.word	0x69374947,0x6d447e32		! Init value for %f26
	.word	0x5e634c2e,0x57b8f365		! Init value for %f28
	.word	0x4f09357e,0x671a267b		! Init value for %f30
	.word	0x2ae5b055,0x5832f201		! Init value for %f32
	.word	0x7501f6e2,0x7754f8ba		! Init value for %f34
	.word	0x8a463fd2,0x7e301dda		! Init value for %f36
	.word	0xf131e5f5,0x8dcea415		! Init value for %f38
	.word	0xa1e6b8a8,0xaf2ac7d2		! Init value for %f40
	.word	0x6ea00b86,0x5149b595		! Init value for %f42
	.word	0xd836d95d,0x8d1be51d		! Init value for %f44
	.word	0xd51a70b1,0x2211d956		! Init value for %f46
	.word	0x1e59a5d3,0x25740bbc
	.word	0x6385fb27,0xac8a31e4
	.word	0xe60b3e49,0x163ed5b5
	.word	0xc6c535cc,0xf0066f70
	.word	0xe6767c47,0xa7db0424
	.word	0x5130bc46,0x747897a1
	.word	0x52ff3a54,0xebec0e1f
	.word	0xf0816a97,0x831d6f6b
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
	.word	0x00000000,0x9ed0dc95
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x0000002b
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00096a68
	.word	0x00000000,0xbad3b4ff
	.word	0x00000000,0xc6065fe0
	.word	0x00000000,0xffb44c38
p0_expected_fp_regs:
	.word	0x00000000,0xb706ee37
	.word	0x00ffb230,0xffffffff
	.word	0xffb20000,0x00ee06b7
	.word	0xad02b0fb,0x209c0000
	.word	0x00000000,0x565a5500
	.word	0xb675f7df,0xd63973fc
	.word	0x54a78db1,0x30b2ff00
	.word	0x000000ff,0xcef31cc7
	.word	0x7f08b2a3,0x384cb4ff
	.word	0xfbb4d3ba,0x00000000
	.word	0xb706ee37,0x000000ff
	.word	0xfacee6f6,0x90990867
	.word	0xbd23ccf3,0x0cae2517
	.word	0xffb4d3ba,0x00000000
	.word	0x97f0269d,0x99d0c51c
	.word	0x00000000,0xa3b2087f
	.word	0x0000000b,0x00000c00		! %fsr = 0000000b00000c00
p0_local0_expect:
	.word	0xff000000,0xff000000
	.word	0x000000c7,0x6639ff00
	.word	0x00096a68,0xbad3b4ff
	.word	0x396695c3,0x85ab29fa
	.word	0x00000000,0x00ff3966
	.word	0xffffbbc3,0xff0000ff
	.word	0xff005500,0x000060ff
	.word	0x000000ff,0x45f89ad8
p0_local0_sec_expect:
	.word	0x00000000,0x000000ff
	.word	0xfbb4d3ba,0x00000000
	.word	0x00000000,0x00007600
	.word	0xfacee6f6,0x90990867
	.word	0xbd23ccf3,0x0cae2517
	.word	0x95dcd2ff,0x000000ff
	.word	0x97f0269d,0x99d0c51c
	.word	0x00000000,0xa3b2087f
p0_local1_expect:
	.word	0x30b2ff00,0x00000000
	.word	0xee000000,0x59000000
	.word	0x0000003c,0x45f89ad8
	.word	0x3c53bb32,0x8cb27a87
	.word	0x000000ff,0x000000c7
	.word	0x24ac00ff,0x0000003c
	.word	0x000000ff,0x000000ff
	.word	0x97f0269d,0x23e59b95
p0_local1_sec_expect:
	.word	0xffff0000,0xffffffff
	.word	0x00000000,0x9a6afae2
	.word	0xff000000,0x000000ff
	.word	0x824b1c5d,0x51392ea5
	.word	0xc3680b00,0x46c03c00
	.word	0xe98bed63,0x10f824f2
	.word	0xca6dcac8,0x51a0b7e2
	.word	0x9cc1aa3d,0xde937859
p0_local2_expect:
	.word	0x9ed0dc95,0xff956639
	.word	0xffffffff,0xffffffff
	.word	0x686a0900,0x00000000
	.word	0xfa29ab85,0xff956639
	.word	0x000000ff,0x00000038
	.word	0x9ed0dc95,0x0000c159
	.word	0xffffffff,0x000060ff
	.word	0x00000000,0xbad3b4ff
p0_local2_sec_expect:
	.word	0x00ff00ff,0x00000000
	.word	0x000000c7,0xe03e00ff
	.word	0xd89af845,0x00ffb230
	.word	0x24ac1d59,0x70c6a1ee
	.word	0x038c7157,0xd81e8e7f
	.word	0xfbb4d3ba,0xe31fe211
	.word	0xf71c8bfe,0x76b4c833
	.word	0x67089990,0x000000cd
p0_local3_expect:
	.word	0xff000000,0x000000ff
	.word	0xeeffffff,0xffffffff
	.word	0xff0000ff,0x000000ff
	.word	0xffc10000,0x76b4c833
	.word	0xbfa0033f,0xc3bb6069
	.word	0xb7142285,0x1132d07e
	.word	0x00000000,0x00000000
	.word	0x00000000,0xb6ffbb65
p0_local3_sec_expect:
	.word	0xffb44c38,0xa3b2087f
	.word	0x00000000,0x4cabee7b
	.word	0xffb4d3ba,0x00000000
	.word	0xfa29ab85,0xc3956639
	.word	0x79f03651,0x6769f01f
	.word	0x9ed0dc95,0x0000c159
	.word	0x00000000,0xa3b2087f
	.word	0xd89af845,0xb706eeb7
p0_local4_expect:
	.word	0x00000000,0xb706ee37
	.word	0x2bb57afb,0xcef31cc7
	.word	0xffb20000,0x00ee06b7
	.word	0xad02b0fb,0x209c0000
	.word	0x00000000,0x565a5500
	.word	0xb675f7df,0xd63973fc
	.word	0x54a78db1,0x00002668
	.word	0x2bb57afb,0xcef31cc7
p0_local4_sec_expect:
	.word	0x00000000,0x00000047
	.word	0xfb000000,0xff0000ff
	.word	0xd8000000,0x00000000
	.word	0xd89af845,0xe03e00ff
	.word	0xbd23ccf3,0x0cae2517
	.word	0x582a48b4,0xb0d443f4
	.word	0x48934bcd,0xff000000
	.word	0xc763fbdb,0xa3b2087f
p0_local5_expect:
	.word	0xff000000,0xffff92bb
	.word	0xff000000,0x00000000
	.word	0xb706ee37,0xff000000
	.word	0x24ac1d59,0x0000005b
	.word	0x038c7157,0x6630a23d
	.word	0x0000003c,0xe31fe211
	.word	0xa2ffde0f,0xff05b230
	.word	0x00000000,0xffffffff
p0_local5_sec_expect:
	.word	0x00000000,0xff000000
	.word	0x48925500,0x00000000
	.word	0x00000000,0x005500ff
	.word	0xff000000,0x005500ff
	.word	0xbfb9b1e8,0xaa3dc13d
	.word	0x7fda7d6a,0xfad84a59
	.word	0x0fc0385b,0xae103944
	.word	0xc977175a,0x37af2871
p0_local6_expect:
	.word	0xff956639,0x00000000
	.word	0xfacee6f6,0x686a0900
	.word	0x00ff00ff,0x37ee06b7
	.word	0xbfa0033f,0xc3bb6069
	.word	0xff600000,0xfbb4d3ba
	.word	0x30b2ff00,0x000000ff
	.word	0x000000ff,0x000000c7
	.word	0xc6065fe0,0x00000000
p0_local6_sec_expect:
	.word	0x00000000,0xffb44c38
	.word	0xad02b0fb,0x209c0000
	.word	0x00000000,0x45f89ad8
	.word	0x0023dad6,0x5cc25743
	.word	0xa84e0b63,0x1d1dc301
	.word	0x69d9ce35,0x1290ffbd
	.word	0x45764747,0x4b5320ef
	.word	0x1d946a3b,0xd5f95bae
share0_expect:
	.word	0x4c3886d9,0xaca2a312
	.word	0x4c34d1bc,0x2aaeec51
	.word	0xf52e2aa7,0x760b46fb
	.word	0x89b1bb64,0x127fa944
	.word	0xa569c51d,0xebb077aa
	.word	0x0d24431a,0x15bd9468
	.word	0x9db6a0ea,0xb5841709
	.word	0x4b8225a1,0x7c620198
share1_expect:
	.word	0xffe0348e,0x4883b38c
	.word	0x3e1ef616,0x0b08787d
	.word	0x7b8a0c0e,0x5401321b
	.word	0xbe4350f6,0x20b7e73a
	.word	0x34431984,0x0355f1a7
	.word	0x580f07cb,0x6dfa88a5
	.word	0x61be0867,0x3e19d35b
	.word	0xfe59b2c5,0x94194f03
	.word	0x92d8d1fd,0x610fd57f
	.word	0xa3af264d,0x4a8984d1
	.word	0x4b076f95,0xf902b9ce
	.word	0x6f54096b,0x64333e7f
	.word	0x466098ec,0xcfea2f4d
	.word	0x78b0e4b6,0xe2005b6d
	.word	0x31b14980,0xaf1529e6
	.word	0xed9e497b,0xeb7540f9
share2_expect:
	.word	0xffff217a,0x9e874f4c
	.word	0xa4546c75,0x4da7f123
	.word	0x54917949,0x6c0de535
	.word	0x414a7d7a,0xe9d8c583
	.word	0x08d0a37b,0xf583ac1e
	.word	0xb3f271a2,0x48a0726f
	.word	0x9ce8c353,0x59251107
	.word	0x02dc57ff,0x7c6d9e67
share3_expect:
	.word	0x958541b9,0x2a8d0501
	.word	0x974e97f0,0x82fbe758
	.word	0xab535796,0xc9f8f38d
	.word	0x83c36063,0x2ac6a7b8
	.word	0xc20d37e0,0x04f13910
	.word	0xd2494b62,0x527fcea4
	.word	0xc9670c74,0x419a2a44
	.word	0xd971dccc,0x363b44ad
	.word	0x33a59f3e,0xe6ff41d4
	.word	0x917eded3,0xe6b329c7
	.word	0x3221221b,0x66c2eafa
	.word	0xc2a58be4,0x80be0d1c
	.word	0x06dec289,0x533eee66
	.word	0xd3f14b6b,0xee891a20
	.word	0xe168ba15,0xfa5e9d74
	.word	0x33d1d3af,0xe7f08168
	.word	0xffff0550,0xc425719b
	.word	0xa4f49d29,0xbbf1ef8c
	.word	0xc0cb0db6,0x076fc2e2
	.word	0x1e3ae939,0x0137da7e
	.word	0x061eb4cb,0xbd79252d
	.word	0x9635cc4e,0x59cb6ab7
	.word	0x41335312,0x56994446
	.word	0xc2ada16c,0x984fc2af
	.word	0x5907fc4a,0xec42ef7f
	.word	0xffddba8d,0x374ce818
	.word	0xcca132b3,0x0f9e05fe
	.word	0x586d217a,0x2338ee8f
	.word	0x4cecd561,0x071ab79c
	.word	0x47c0ddea,0xc1f03b54
	.word	0x9f1abf5e,0xedbb01bf
	.word	0xc7b651a8,0x74ed2187
	.word	0x78e0d1b9,0xee5cfd46
	.word	0xe5b1e8b3,0xc75376ab
	.word	0xf774f61a,0x1a9ca212
	.word	0xcfcf8aa6,0x04b83979
	.word	0x32d47a3e,0x5bc87498
	.word	0x482ebc09,0xd3ef4b25
	.word	0x96c114e6,0x7099f8b3
	.word	0x97d435d3,0x4a603000
	.word	0x00e38361,0xe3b81cf3
	.word	0xec9c9ea6,0x5790467a
	.word	0xaca8f948,0x3df86774
	.word	0x0950388e,0x1e7adaf6
	.word	0x1f624023,0xab39c275
	.word	0xd799089a,0x0f889ff5
	.word	0xf8c4d3ff,0x38a300ce
	.word	0x8d54db22,0x49231dfe
	.word	0xc692c576,0xcda9c138
	.word	0xb8808e10,0x21d5437c
	.word	0x18035920,0x48788e47
	.word	0x4aebfddd,0x2869805b
	.word	0xea45b16c,0x7c17fa6e
	.word	0x52954eca,0xf03abdc7
	.word	0xa0ab432b,0x9b5e80bb
	.word	0xaad77924,0x247270f1
	.word	0xffffa92c,0x43cb4dd6
	.word	0x4af04bdd,0xd6ba2c95
	.word	0x75b8a202,0x5fc72e6b
	.word	0xd9a0e2b9,0xfb426341
	.word	0x2a1aad36,0x9673b76c
	.word	0x6ba73932,0xd680a7ca
	.word	0xc53af808,0x5fe8d24a
	.word	0x0903bfa0,0x5e2ad527
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
	.word	0x7e2d0360,0x2beb3b3e
	.word	0x00000000,0x00000002
	.word	0x0ca73eb8,0x07971bf2
	.word	0x00000000,0x00000003
	.word	0x1845ab48,0x04bb625f
	.word	0x00000000,0x00000004
	.word	0x965d58d0,0x3696966d
	.word	0x00000000,0x00000005
	.word	0x38342b38,0x7bace1f8
	.word	0x00000000,0x00000006
	.word	0xbd6cfcd8,0x71c4a102
	.word	0x00000000,0x00000007
	.word	0xed6dad37,0xb839aff6
	.word	0x00000000,0x00000008
	.word	0xd3ff5e80,0x1866358f
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
	.word	0xcfc314c4,0x389dc6bd,0x02c3ac60,0xe68e8e06
	.word	0xb99d3b60,0x9a3693b3,0xf61c27d3,0xe58498dc
	.word	0x81076ef8,0x34c014ef,0x14b1456e,0x738a20f3
	.word	0x2202d061,0xfa798525,0xed025d42,0x7979f731
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
	.word	0xc4813d84,0x6eec7b17,0x9a66b895,0xeec3a689
	.word	0x2fa6eae7,0x9a82d04d,0x3deab1da,0x9ff93b1d
	.word	0x19488c26,0x523fdb74,0x7a2c6608,0x32e30ac3
	.word	0x1d46a2d1,0xdbbd4890,0x703f37ac,0x0c0038fa
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
	.word	0x922cbcf1,0xf96ffbb4,0xecfe91af,0xf53cf11b
	.word	0x468045da,0xd089bfd2,0x3c53bb32,0x8cb27a87
	.word	0xb3ef4dfc,0xad12f4cd,0x74186c63,0xe1404b8d
	.word	0x4d2406d9,0x878769a8,0xcf7378e0,0x23e59b95
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
	.word	0x1d9760f5,0x6968cb77,0x35f42588,0x87aedbbb
	.word	0xafbbe7fa,0xe9ff3f97,0x824b1c5d,0x51392ea5
	.word	0xa43558da,0xe9b0323d,0xe98bed63,0x10f824f2
	.word	0xca6dcac8,0x51a0b7e2,0x13c1aa3d,0xde933e59
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
	.word	0x0c9100c1,0x74adc457,0x14aa5d22,0xd40e858c
	.word	0x0bdd8e80,0x346c516a,0x6a0e5802,0x9813d1f6
	.word	0x6528f8e2,0x9224fa1a,0x6630a23d,0x5f0250a1
	.word	0x17fb3e87,0x8cae450e,0x54a2cedb,0xedcc3a97
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
	.word	0x97e45698,0xfb4c0da6,0x5fc38d20,0x71339298
	.word	0x198e1a35,0x6af4ea3d,0xaa9c6f31,0x80876715
	.word	0x42c3dd46,0x48c15c98,0x9abdd49c,0xabd772ea
	.word	0x0aed8c3d,0xecb068e7,0x2a999e40,0xd1d11055
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
	.word	0x8fe2ee4c,0x543b7014,0xb390858d,0xba1cf28d
	.word	0x669c866e,0x7b86a95a,0xf71c8bfe,0x76b4c833
	.word	0xbfa0033f,0xc3bb6069,0xb7142285,0x1132d07e
	.word	0xb99981ab,0x369a945b,0x953a7c04,0xb63ebb65
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
	.word	0x15015a8b,0x25720dbd,0x05724a25,0x4cabee7b
	.word	0xe9a28956,0xdd59af12,0xfa29ab85,0xc3956639
	.word	0x79f03651,0x6769f01f,0xb638dc95,0x7f9ac159
	.word	0xe03e18a2,0x9ed0d98d,0xd89af845,0xb706eeb7
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
	.word	0x8a842b4b,0x5e68c349,0xa6b3773f,0x741c1163
	.word	0xfe3a0e9a,0x19b1d96a,0xad02b0fb,0x209ca183
	.word	0x79415f86,0x9a6afae2,0xb675f7df,0xd63973fc
	.word	0x54a78db1,0xb7cd2668,0x2bb57afb,0xcef31cc7
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
	.word	0x1b98d713,0x8bcb3616,0xbc897bb5,0xfb5052a8
	.word	0xf40ec84f,0x236bb10e,0xfacee6f6,0x11317c96
	.word	0xbd23ccf3,0x0cae2517,0x582a48b4,0xb0d443f4
	.word	0x97f0269d,0x99d0c51c,0xc763fbdb,0xa3b2087f
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
	.word	0x015a2374,0x5764ab21,0x05201f2f,0x062283d9
	.word	0xfffb737c,0x9bd905e8,0x24ac1d59,0x70c6a1ee
	.word	0x038c7157,0xd81e8e7f,0x0a78d3ba,0xe31fe211
	.word	0xa2e3de0f,0x88e7b230,0x67089990,0x502cbcb9
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
	.word	0xcd48aca6,0x7944e74f,0x017feea4,0xbdf25794
	.word	0x6edd74b0,0x20b9eeb3,0x93113a5b,0x7839e277
	.word	0xbfb9b1e8,0xaa3dc13d,0x7fda7d6a,0xfad84a59
	.word	0x0fc0385b,0xae103944,0xc977175a,0x37af2871
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
	.word	0x0553cf57,0x48c21955,0x7bc5bd08,0xa356b93d
	.word	0x0c88c046,0xf37c68c3,0x97024892,0x6621fdd3
	.word	0x4de7eeb0,0x00e8fcdc,0xd2d5e5bf,0xd4e4f3f4
	.word	0x2c43dee0,0x7c4205c6,0x49abb0b5,0x6cd979ba
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
	.word	0xd558fff7,0xcd4b9348,0xf25e5899,0x8260e8b9
	.word	0xedbfeff6,0x565a5500,0x0023dad6,0x5cc25743
	.word	0xa84e0b63,0x1d1dc301,0x69d9ce35,0x1290ffbd
	.word	0x5ae411ed,0x4b5320ef,0x1d946a3b,0xd5f95bae
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
	.word	0xcebc86d9,0xaca2a312,0x4c34d1bc,0x2aaeec51
	.word	0xf52e2aa7,0x760b46fb,0x89b1bb64,0x127fa944
	.word	0xa569c51d,0xebb077aa,0x0d24431a,0x15bd9468
	.word	0x9db6a0ea,0xb5841709,0x4b8225a1,0x7c620198
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
	.word	0x3ff7348e,0x4883b38c,0x3e1ef616,0x0b08787d
	.word	0x7b8a0c0e,0x5401321b,0xbe4350f6,0x20b7e73a
	.word	0x34431984,0x0355f1a7,0x580f07cb,0x6dfa88a5
	.word	0x61be0867,0x3e19d35b,0xfe59b2c5,0x94194f03
	.word	0x66bbd1fd,0x610fd57f,0xa3af264d,0x4a8984d1
	.word	0x4b076f95,0xf902b9ce,0x6f54096b,0x64333e7f
	.word	0x466098ec,0xcfea2f4d,0x78b0e4b6,0xe2005b6d
	.word	0x31b14980,0xaf1529e6,0xed9e497b,0xeb7540f9
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
	.word	0x4d9a217a,0x9e874f4c,0xa4546c75,0x4da7f123
	.word	0x54917949,0x6c0de535,0x414a7d7a,0xe9d8c583
	.word	0x08d0a37b,0xf583ac1e,0xb3f271a2,0x48a0726f
	.word	0x9ce8c353,0x59251107,0x02dc57ff,0x7c6d9e67
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
	.word	0x958541b9,0x2a8d0501,0x974e97f0,0x82fbe758
	.word	0xab535796,0xc9f8f38d,0x83c36063,0x2ac6a7b8
	.word	0xc20d37e0,0x04f13910,0xd2494b62,0x527fcea4
	.word	0xc9670c74,0x419a2a44,0xd971dccc,0x363b44ad
	.word	0xf1679f3e,0xe6ff41d4,0x917eded3,0xe6b329c7
	.word	0x3221221b,0x66c2eafa,0xc2a58be4,0x80be0d1c
	.word	0x06dec289,0x533eee66,0xd3f14b6b,0xee891a20
	.word	0xe168ba15,0xfa5e9d74,0x33d1d3af,0xe7f08168
	.word	0x13070550,0xc425719b,0xa4f49d29,0xbbf1ef8c
	.word	0xc0cb0db6,0x076fc2e2,0x1e3ae939,0x0137da7e
	.word	0x061eb4cb,0xbd79252d,0x9635cc4e,0x59cb6ab7
	.word	0x41335312,0x56994446,0xc2ada16c,0x984fc2af
	.word	0x5907fc4a,0xec42ef7f,0xffddba8d,0x374ce818
	.word	0xcca132b3,0x0f9e05fe,0x586d217a,0x2338ee8f
	.word	0x4cecd561,0x071ab79c,0x47c0ddea,0xc1f03b54
	.word	0x9f1abf5e,0xedbb01bf,0xc7b651a8,0x74ed2187
	.word	0x89f9d1b9,0xee5cfd46,0xe5b1e8b3,0xc75376ab
	.word	0xf774f61a,0x1a9ca212,0xcfcf8aa6,0x04b83979
	.word	0x32d47a3e,0x5bc87498,0x482ebc09,0xd3ef4b25
	.word	0x96c114e6,0x7099f8b3,0x97d435d3,0x4a603000
	.word	0xe2128361,0xe3b81cf3,0xec9c9ea6,0x5790467a
	.word	0xaca8f948,0x3df86774,0x0950388e,0x1e7adaf6
	.word	0x1f624023,0xab39c275,0xd799089a,0x0f889ff5
	.word	0xf8c4d3ff,0x38a300ce,0x8d54db22,0x49231dfe
	.word	0xc6d0c576,0xcda9c138,0xb8808e10,0x21d5437c
	.word	0x18035920,0x48788e47,0x4aebfddd,0x2869805b
	.word	0xea45b16c,0x7c17fa6e,0x52954eca,0xf03abdc7
	.word	0xa0ab432b,0x9b5e80bb,0xaad77924,0x247270f1
	.word	0x3c33a92c,0x43cb4dd6,0x4af04bdd,0xd6ba2c95
	.word	0x75b8a202,0x5fc72e6b,0xd9a0e2b9,0xfb426341
	.word	0x2a1aad36,0x9673b76c,0x6ba73932,0xd680a7ca
	.word	0xc53af808,0x5fe8d24a,0x0903bfa0,0x5e2ad527
share3_end:
