/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000_16.s
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
!	Seed = 327144536
!	Riesling can be on
!	1 Thread, 5000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_5000_16.s created on Mar 27, 2009 (14:45:36)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_5000_16 -p 1 -l 5000

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
!	%f0  = 7558aaf3 acb28974 a00cb89f 0cad9f9b
!	%f4  = 957a622f 22180119 572706c0 6025b43f
!	%f8  = 9156ec16 6b0274a1 a1af2138 6bb4af02
!	%f12 = 4696fa70 c5bab51a d1f9c738 4796c528
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 10f6f28d 0bb66c3e 73e42445 38f2a07b
!	%f20 = cb6d4a47 1a2dbfb7 0557252f 8442eba1
!	%f24 = 03d56844 f16762e3 98e65ffd ac181400
!	%f28 = 36ab3346 2b1c4351 3be5a330 7d9bf8cb
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 4fbec217 8a5448e9 59d972e2 212b1990
!	%f36 = fb210878 f6cdc970 0d14523d bd50ea0d
!	%f40 = 8c449174 931d007e bff6c7f6 321222ff
!	%f44 = 8be08379 cb96b41b 0c8bf40b 72a93966
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x046ad1670000003a,%g7,%g1 ! GSR scale =  7, align = 2
	wr	%g1,%g0,%gsr		! GSR = 046ad1670000003a
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000010181410] = da42588b, %l4 = 1c840a3242d10b39
	lduha	[%i6+%o5]0x88,%l4	! %l4 = 000000000000588b
!	%f26 = 98e65ffd ac181400, Mem[0000000010101408] = a887ed38 42cc16c6
	stda	%f26,[%i4+%o4]0x88	! Mem[0000000010101408] = 98e65ffd ac181400
!	Mem[0000000030081408] = 2e1171cd, %l5 = 4154c970b7afb8fd
	swapa	[%i2+%o4]0x81,%l5	! %l5 = 000000002e1171cd
!	Mem[0000000010081400] = aba834668d7a8ee0, %l0 = 1ef21a2e18c4b9d8, %l6 = 256f185480377cff
	casxa	[%i2]0x80,%l0,%l6	! %l6 = aba834668d7a8ee0
!	%l3 = fe7199c0c7ac7d98, Mem[0000000010081410] = 3f026c62
	stha	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 7d986c62
!	Mem[0000000010041400] = 30e227fb, %f11 = 6bb4af02
	ld	[%i1+%g0],%f11	! %f11 = 30e227fb
!	%l3 = fe7199c0c7ac7d98, Mem[0000000030181408] = 60a17d013e15c2ab
	stxa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = fe7199c0c7ac7d98
!	Mem[0000000020800001] = e5028ed8, %l3 = fe7199c0c7ac7d98
	ldstub	[%o1+0x001],%l3		! %l3 = 00000002000000ff
!	%l7 = fe4ec4fa7269168c, Mem[0000000010181410] = da42588b
	stwa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 7269168c
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000002, Mem[0000000010101400] = 56c5d56f
	stha	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 0002d56f

p0_label_2:
!	Mem[0000000010001420] = 6c0d1d7eed9f2dbf, %l2 = 4d983392d9e32dbc, %l1 = 3677fda659dc91dd
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 6c0d1d7eed9f2dbf
!	%l2 = 4d983392d9e32dbc, Mem[0000000030141400] = a4962afc
	stha	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 2dbc2afc
!	Mem[00000000100c143e] = 56aa808d, %l1 = 6c0d1d7eed9f2dbf
	ldstub	[%i3+0x03e],%l1		! %l1 = 00000080000000ff
!	%l0 = 1ef21a2e18c4b9d8, Mem[00000000100c1400] = 1904bec9fd50c241
	stxa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 1ef21a2e18c4b9d8
!	%l4 = 0000588b, %l5 = 2e1171cd, Mem[0000000030181408] = 987dacc7 c09971fe
	stda	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000588b 2e1171cd
!	%l4 = 0000588b, %l5 = 2e1171cd, Mem[0000000010081410] = 7d986c62 217b8aa2
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000588b 2e1171cd
!	%l1 = 0000000000000080, Mem[0000000030141410] = da6b08c9
	stha	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 008008c9
!	Mem[0000000030101410] = 6768845c, %l4 = 000000000000588b
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 00000067000000ff
!	Mem[0000000010141408] = d8b76590, %l6 = aba834668d7a8ee0
	swap	[%i5+%o4],%l6		! %l6 = 00000000d8b76590
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 41f463d3d8750de5, %l2 = 4d983392d9e32dbc
	ldxa	[%i6+%g0]0x81,%l2	! %l2 = 41f463d3d8750de5

p0_label_3:
!	Mem[0000000010001408] = f9664594f27ac1d1, %f0  = 7558aaf3 acb28974
	ldda	[%i0+%o4]0x80,%f0 	! %f0  = f9664594 f27ac1d1
!	Mem[0000000010101400] = 6fd50200, %l4 = 0000000000000067
	lduwa	[%i4+%g0]0x88,%l4	! %l4 = 000000006fd50200
!	Mem[00000000218001c0] = 43b737e3, %l4 = 000000006fd50200
	ldsh	[%o3+0x1c0],%l4		! %l4 = 00000000000043b7
!	Mem[0000000010141420] = c0aec14cf79dc35b, %f2  = a00cb89f 0cad9f9b
	ldd	[%i5+0x020],%f2 	! %f2  = c0aec14c f79dc35b
!	Mem[0000000030001408] = 3816da89, %l0 = 1ef21a2e18c4b9d8
	ldsha	[%i0+%o4]0x81,%l0	! %l0 = 0000000000003816
!	Mem[0000000030181410] = d0cf2ceb, %f15 = 4796c528
	lda	[%i6+%o5]0x89,%f15	! %f15 = d0cf2ceb
!	Mem[0000000020800040] = 5bafcbdb, %l4 = 00000000000043b7
	ldsba	[%o1+0x041]%asi,%l4	! %l4 = ffffffffffffffaf
!	Mem[0000000030101408] = 87e3de3f, %l6 = 00000000d8b76590
	lduba	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000087
!	Mem[00000000211c0000] = 7e657001, %l2 = 41f463d3d8750de5
	ldsb	[%o2+%g0],%l2		! %l2 = 000000000000007e
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000007e, Mem[0000000030041400] = ca3a189cb1151059
	stxa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000000000007e

p0_label_4:
!	%f24 = 03d56844 f16762e3, %l5 = 000000002e1171cd
!	Mem[0000000010141418] = 8f014185d307c793
	add	%i5,0x018,%g1
	stda	%f24,[%g1+%l5]ASI_PST8_P ! Mem[0000000010141418] = 03d54185f167c7e3
!	Mem[0000000010101410] = cba5243f, %l6 = 0000000000000087
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 000000cb000000ff
!	Mem[000000001010142c] = ee5f39e4, %l4 = ffffffffffffffaf, %asi = 80
	swapa	[%i4+0x02c]%asi,%l4	! %l4 = 00000000ee5f39e4
!	%f14 = d1f9c738 d0cf2ceb, Mem[0000000010181400] = fadc6b03 7336f526
	stda	%f14,[%i6+%g0]0x88	! Mem[0000000010181400] = d1f9c738 d0cf2ceb
!	%l2 = 000000000000007e, imm = fffffffffffffa3f, %l6 = 00000000000000cb
	andn	%l2,-0x5c1,%l6		! %l6 = 0000000000000040
!	Mem[0000000030181408] = 8b580000, %l7 = fe4ec4fa7269168c
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l2 = 000000000000007e, Mem[0000000010081412] = 0000588b
	sth	%l2,[%i2+0x012]		! Mem[0000000010081410] = 0000007e
!	%l2 = 000000000000007e, Mem[0000000010101408] = ac181400
	stha	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ac18007e
!	%f6  = 572706c0 6025b43f, %l2 = 000000000000007e
!	Mem[0000000030141400] = 2dbc2afce49dd978
	stda	%f6,[%i5+%l2]ASI_PST16_SL ! Mem[0000000030141400] = 2dbc2560c0062757
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000003816, imm = fffffffffffff820, %l4 = 00000000ee5f39e4
	subc	%l0,-0x7e0,%l4		! %l4 = 0000000000003ff6

p0_label_5:
!	Mem[0000000030101400] = 6329e949 4363913c, %l2 = 0000007e, %l3 = 00000002
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 000000006329e949 000000004363913c
!	Mem[0000000010141410] = 15a11b00, %l1 = 0000000000000080
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 0000000000001b00
!	Mem[0000000010001410] = 894a1af2, %l0 = 0000000000003816
	ldsba	[%i0+%o5]0x88,%l0	! %l0 = fffffffffffffff2
!	Mem[0000000020800040] = 5bafcbdb, %l5 = 000000002e1171cd
	lduha	[%o1+0x040]%asi,%l5	! %l5 = 0000000000005baf
!	Mem[0000000030101408] = d8ad60573fdee387, %l3 = 000000004363913c
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = d8ad60573fdee387
!	Mem[0000000030001400] = c069fdb7, %f30 = 3be5a330
	lda	[%i0+%g0]0x81,%f30	! %f30 = c069fdb7
!	Mem[00000000100c1410] = 905eab26bf54bcd1, %l6 = 0000000000000040
	ldxa	[%i3+0x010]%asi,%l6	! %l6 = 905eab26bf54bcd1
!	Mem[0000000030081408] = fdb8afb7, %l7 = 0000000000000000
	lduwa	[%i2+%o4]0x89,%l7	! %l7 = 00000000fdb8afb7
!	Mem[0000000010141408] = e08e7a8d, %l0 = fffffffffffffff2
	lduwa	[%i5+%o4]0x88,%l0	! %l0 = 00000000e08e7a8d
!	Starting 10 instruction Store Burst
!	%f25 = f16762e3, %f6  = 572706c0 6025b43f
	fitod	%f25,%f6 		! %f6  = c1ad313a 3a000000

p0_label_6:
!	%l7 = 00000000fdb8afb7, Mem[00000000100c1400] = d8b9c418
	stba	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = b7b9c418
!	%l1 = 0000000000001b00, Mem[0000000030181410] = d0cf2ceb
	stba	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = d0cf2c00
!	Mem[0000000030141410] = 008008c9, %l4 = 0000000000003ff6
	swapa	[%i5+%o5]0x81,%l4	! %l4 = 00000000008008c9
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030141400] = 2dbc2560 c0062757 93018f04 ec480d19
!	Mem[0000000030141410] = 00003ff6 7abaad19 16f02ac0 3e608a57
!	Mem[0000000030141420] = f4b0d034 a5f349f5 e3c0f0cf e630f32a
!	Mem[0000000030141430] = 44b30f0e 73352ded f0e1cbc9 9863bf2f
	ldda	[%i5]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030141400
!	%f0  = f9664594 f27ac1d1 c0aec14c f79dc35b
!	%f4  = 957a622f 22180119 c1ad313a 3a000000
!	%f8  = 9156ec16 6b0274a1 a1af2138 30e227fb
!	%f12 = 4696fa70 c5bab51a d1f9c738 d0cf2ceb
	stda	%f0,[%i3]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	Mem[0000000030101408] = 3fdee387, %l5 = 0000000000005baf
	ldstuba	[%i4+%o4]0x89,%l5	! %l5 = 00000087000000ff
!	%l5 = 0000000000000087, imm = 0000000000000e80, %l5 = 0000000000000087
	or	%l5,0xe80,%l5		! %l5 = 0000000000000e87
!	%f0  = f9664594 f27ac1d1 c0aec14c f79dc35b
!	%f4  = 957a622f 22180119 c1ad313a 3a000000
!	%f8  = 9156ec16 6b0274a1 a1af2138 30e227fb
!	%f12 = 4696fa70 c5bab51a d1f9c738 d0cf2ceb
	stda	%f0,[%i6]ASI_COMMIT_P	! Block Store to 0000000010181400
!	%l3 = d8ad60573fdee387, Mem[0000000010001408] = f9664594
	stba	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 87664594
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 001ba115, %l2 = 000000006329e949
	ldsha	[%i5+%o5]0x80,%l2	! %l2 = 000000000000001b

p0_label_7:
!	Mem[0000000030081410] = 3ac8ceaf, %l1 = 0000000000001b00
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 000000000000003a
!	Mem[0000000010081420] = 4d52c53b96a1271f, %l2 = 000000000000001b, %l0 = 00000000e08e7a8d
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = 4d52c53b96a1271f
!	Mem[0000000030181400] = e50d75d8d363f441, %f28 = ed2d3573 0e0fb344
	ldda	[%i6+%g0]0x89,%f28	! %f28 = e50d75d8 d363f441
!	Mem[0000000030101400] = 49e92963, %l2 = 000000000000001b
	lduwa	[%i4+%g0]0x89,%l2	! %l2 = 0000000049e92963
!	Mem[0000000030041408] = ca4bcae7, %l7 = 00000000fdb8afb7
	ldsha	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffffcae7
!	Mem[0000000030081408] = fdb8afb7, %l5 = 0000000000000e87
	ldsba	[%i2+%o4]0x89,%l5	! %l5 = ffffffffffffffb7
!	Mem[0000000010081408] = 9296b240, %l2 = 0000000049e92963
	lduha	[%i2+%o4]0x88,%l2	! %l2 = 000000000000b240
!	Mem[0000000030001410] = 89d18beab529e417, %l4 = 00000000008008c9
	ldxa	[%i0+%o5]0x81,%l4	! %l4 = 89d18beab529e417
!	Mem[0000000030181410] = d0cf2c00, %l3 = d8ad60573fdee387
	lduba	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = e5ff8ed8, %l0 = 4d52c53b96a1271f
	ldstub	[%o1+0x001],%l0		! %l0 = 000000ff000000ff

p0_label_8:
!	%f30 = 2fbf6398 c9cbe1f0, Mem[00000000100c1400] = d1c17af2 944566f9
	stda	%f30,[%i3+%g0]0x80	! Mem[00000000100c1400] = 2fbf6398 c9cbe1f0
!	Mem[0000000010141410] = 15a11b00, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 0000000015a11b00
!	%l6 = 905eab26bf54bcd1, Mem[0000000010041408] = 20aac52e
	stwa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = bf54bcd1
!	%l4 = b529e417, %l5 = ffffffb7, Mem[0000000010001408] = 94456687 d1c17af2
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = b529e417 ffffffb7
!	Mem[00000000211c0001] = 7e657001, %l5 = ffffffffffffffb7
	ldstub	[%o2+0x001],%l5		! %l5 = 00000065000000ff
!	Mem[0000000030141400] = 2dbc2560, %l3 = 0000000015a11b00
	ldstuba	[%i5+%g0]0x81,%l3	! %l3 = 0000002d000000ff
!	%l1 = 000000000000003a, Mem[0000000030001408] = 89da1638
	stba	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 89da163a
!	%f29 = d363f441, %f20 = 19adba7a, %f16 = 572706c0
	fdivs	%f29,%f20,%f16		! %f16 = f927f3d8
!	%l6 = 905eab26bf54bcd1, Mem[0000000010081408] = 40b29692
	stwa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = bf54bcd1
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = e08e7a8d, %l3 = 000000000000002d
	ldswa	[%i5+%o4]0x88,%l3	! %l3 = ffffffffe08e7a8d

p0_label_9:
!	Mem[0000000030001410] = 89d18bea, %l6 = 905eab26bf54bcd1
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffff89d1
!	Mem[0000000010081408] = 52f7846f d1bc54bf, %l4 = b529e417, %l5 = 00000065
	ldda	[%i2+%o4]0x88,%l4	! %l4 = 00000000d1bc54bf 0000000052f7846f
!	Mem[0000000010001410] = 28b0b9d4894a1af2, %f24 = f549f3a5 34d0b0f4
	ldda	[%i0+%o5]0x88,%f24	! %f24 = 28b0b9d4 894a1af2
!	Mem[0000000010001408] = ffffffb7 b529e417, %l4 = d1bc54bf, %l5 = 52f7846f
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 00000000b529e417 00000000ffffffb7
!	Mem[0000000010141410] = 00000000, %l2 = 000000000000b240
	lduba	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = ea8bd189, %l2 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l2	! %l2 = ffffffffffffff89
!	Mem[0000000030041400] = 00000000 0000007e e7ca4bca 920c38e3
!	Mem[0000000030041410] = 6759f701 92f6c887 28a0e338 698fa81f
!	Mem[0000000030041420] = 96332b33 c52d079a d6e1b298 51cb272c
!	Mem[0000000030041430] = d24d69b9 199a9ee5 68b52f59 9128b367
	ldda	[%i1]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030041400
!	Mem[0000000010001408] = 17e429b5, %l5 = 00000000ffffffb7
	lduwa	[%i0+%o4]0x80,%l5	! %l5 = 0000000017e429b5
!	Mem[0000000021800080] = a3f2944f, %l1 = 000000000000003a
	lduba	[%o3+0x081]%asi,%l1	! %l1 = 00000000000000f2
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000f2, Mem[0000000010101408] = ac18007e
	stwa	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000f2

p0_label_10:
!	%l5 = 0000000017e429b5, Mem[000000001010140e] = fd5fe698, %asi = 80
	stha	%l5,[%i4+0x00e]%asi	! Mem[000000001010140c] = fd5f29b5
!	%l0 = 000000ff, %l1 = 000000f2, Mem[0000000030001408] = 3a16da89 9ac9f33d
	stda	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff 000000f2
!	%l4 = 00000000b529e417, Mem[00000000211c0000] = 7eff7001, %asi = 80
	stba	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 17ff7001
!	Mem[0000000010101420] = bfdb958b, %l3 = ffffffffe08e7a8d
	swap	[%i4+0x020],%l3		! %l3 = 00000000bfdb958b
!	%l1 = 00000000000000f2, Mem[0000000030001410] = 17e429b5ea8bd189
	stxa	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000000000f2
!	%f16 = f927f3d8 6025bc2d, %l0 = 00000000000000ff
!	Mem[0000000030181418] = dba784a94e9f0ae1
	add	%i6,0x018,%g1
	stda	%f16,[%g1+%l0]ASI_PST16_S ! Mem[0000000030181418] = f927f3d86025bc2d
!	%l1 = 00000000000000f2, Mem[0000000010081401] = aba83466, %asi = 80
	stba	%l1,[%i2+0x001]%asi	! Mem[0000000010081400] = abf23466
!	%l4 = 00000000b529e417, Mem[000000001008143e] = ee30470a, %asi = 80
	stha	%l4,[%i2+0x03e]%asi	! Mem[000000001008143c] = ee30e417
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010181408] = c0aec14c, %l1 = 00000000000000f2
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 000000c0000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 3fdee3ff, %l6 = ffffffffffff89d1
	lduha	[%i4+%o4]0x89,%l6	! %l6 = 000000000000e3ff

p0_label_11:
!	Mem[0000000010101400] = 0002d56f, %l4 = 00000000b529e417
	ldsba	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 7610888b, %l4 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l4	! %l4 = 000000000000888b
!	Mem[00000000300c1408] = 5c3d9c36, %l0 = 00000000000000ff
	ldswa	[%i3+%o4]0x81,%l0	! %l0 = 000000005c3d9c36
!	Mem[0000000030041410] = 6759f701, %f17 = 6025bc2d
	lda	[%i1+%o5]0x81,%f17	! %f17 = 6759f701
!	Mem[0000000010101438] = 79b1bd27, %l1 = 00000000000000c0
	lduwa	[%i4+0x038]%asi,%l1	! %l1 = 0000000079b1bd27
!	Mem[0000000030081400] = 105bf65d, %l4 = 000000000000888b
	ldsba	[%i2+%g0]0x89,%l4	! %l4 = 000000000000005d
!	Mem[0000000010141418] = 03d54185, %l5 = 0000000017e429b5
	ldsh	[%i5+0x01a],%l5		! %l5 = 0000000000004185
!	Mem[0000000010101434] = cd1bbf6b, %l3 = 00000000bfdb958b
	ldsw	[%i4+0x034],%l3		! %l3 = ffffffffcd1bbf6b
!	Mem[0000000030001408] = ff000000, %f19 = 048f0193
	lda	[%i0+%o4]0x89,%f19	! %f19 = ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001409] = 17e429b5, %l4 = 000000000000005d
	ldstub	[%i0+0x009],%l4		! %l4 = 000000e4000000ff

p0_label_12:
!	%l5 = 0000000000004185, Mem[0000000030181408] = 8b5800ff
	stba	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 8b580085
!	%l7 = ffffffffffffcae7, Mem[0000000030181410] = d0cf2c00
	stha	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = d0cfcae7
!	%f18 = 190d48ec, Mem[0000000030141410] = 00003ff6
	sta	%f18,[%i5+%o5]0x81	! Mem[0000000030141410] = 190d48ec
!	%l6 = 000000000000e3ff, Mem[00000000300c1408] = 369c3d5c
	stha	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 369ce3ff
!	%l3 = ffffffffcd1bbf6b, Mem[00000000300c1410] = df938122
	stha	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = df93bf6b
!	Mem[0000000010001400] = 030b95bc, %l2 = ffffffffffffff89
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000003000000ff
!	Mem[00000000218001c0] = 43b737e3, %l7 = ffffffffffffcae7
	ldstub	[%o3+0x1c0],%l7		! %l7 = 00000043000000ff
!	Mem[00000000211c0000] = 17ff7001, %l1 = 0000000079b1bd27
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 00000017000000ff
!	%f31 = c9cbe1f0, %f20 = 19adba7a
	fcmpes	%fcc3,%f31,%f20		! %fcc3 = 1
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010001400] = ff0b95bc ae4a49ae 17ff29b5 b7ffffff
!	Mem[0000000010001410] = f21a4a89 d4b9b028 8cd29078 f45c1c07
!	Mem[0000000010001420] = 6c0d1d7e ed9f2dbf d3844c69 4f1a260b
!	Mem[0000000010001430] = f5d1c380 4cb9a60d 186ce9bc c1cabd15
	ldda	[%i0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400

p0_label_13:
!	Mem[0000000030101408] = d8ad60573fdee3ff, %f2  = e3380c92 ca4bcae7
	ldda	[%i4+%o4]0x89,%f2 	! %f2  = d8ad6057 3fdee3ff
!	Mem[0000000030101410] = ff68845cb9ad60ec, %l2 = 0000000000000003
	ldxa	[%i4+%o5]0x81,%l2	! %l2 = ff68845cb9ad60ec
!	Mem[00000000100c140c] = 4cc1aec0, %l2 = ff68845cb9ad60ec
	lduwa	[%i3+0x00c]%asi,%l2	! %l2 = 000000004cc1aec0
!	Mem[0000000010001418] = 8cd29078f45c1c07, %f4  = 87c8f692 01f75967
	ldd	[%i0+0x018],%f4 	! %f4  = 8cd29078 f45c1c07
!	Mem[0000000030181408] = 8500588b, %l0 = 000000005c3d9c36
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000085
!	Mem[0000000030141400] = ffbc2560 c0062757 93018f04 ec480d19
!	Mem[0000000030141410] = 190d48ec 7abaad19 16f02ac0 3e608a57
!	Mem[0000000030141420] = f4b0d034 a5f349f5 e3c0f0cf e630f32a
!	Mem[0000000030141430] = 44b30f0e 73352ded f0e1cbc9 9863bf2f
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000010001410] = 28b0b9d4894a1af2, %l7 = 0000000000000043
	ldxa	[%i0+%o5]0x88,%l7	! %l7 = 28b0b9d4894a1af2
!	Mem[0000000010081410] = 0000007e, %l3 = ffffffffcd1bbf6b
	lduha	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = 8500588b2e1171cd, %f14 = 67b32891 592fb568
	ldda	[%i6+%o4]0x81,%f14	! %f14 = 8500588b 2e1171cd
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000004185, Mem[0000000010141430] = a6cc5dcad27d0755, %asi = 80
	stxa	%l5,[%i5+0x030]%asi	! Mem[0000000010141430] = 0000000000004185

p0_label_14:
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 0000000000000085
	setx	0x5d95ecc7dd0091c4,%g7,%l0 ! %l0 = 5d95ecc7dd0091c4
!	%l1 = 0000000000000017
	setx	0xf59635c802bd5f95,%g7,%l1 ! %l1 = f59635c802bd5f95
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5d95ecc7dd0091c4
	setx	0x003c7f37fefc57ea,%g7,%l0 ! %l0 = 003c7f37fefc57ea
!	%l1 = f59635c802bd5f95
	setx	0x47afa9679a5bb092,%g7,%l1 ! %l1 = 47afa9679a5bb092
!	%f2  = d8ad6057, %f2  = d8ad6057, %f3  = 3fdee3ff
	fsubs	%f2 ,%f2 ,%f3 		! %f3  = 00000000
!	%l3 = 0000000000000000, Mem[00000000100c1410] = 22180119
	stwa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l5 = 0000000000004185, Mem[0000000010081410] = 0000007e
	stba	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 8500007e
	membar	#Sync			! Added by membar checker (4)
!	%l6 = 000000000000e3ff, Mem[0000000030141400] = ffbc2560c0062757
	stxa	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000000000e3ff
!	Mem[00000000100c1408] = 5bc39df74cc1aec0, %l3 = 0000000000000000, %l4 = 00000000000000e4
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 5bc39df74cc1aec0
!	Mem[0000000010181438] = d1f9c738, %l7 = 28b0b9d4894a1af2
	swap	[%i6+0x038],%l7		! %l7 = 00000000d1f9c738
!	Mem[0000000030181400] = 41f463d3, %l4 = 5bc39df74cc1aec0
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 00000041000000ff
!	%f18 = 93018f04 ec480d19, %l1 = 47afa9679a5bb092
!	Mem[00000000100c1430] = 1ab5bac570fa9646
	add	%i3,0x030,%g1
	stda	%f18,[%g1+%l1]ASI_PST32_PL ! Mem[00000000100c1430] = 1ab5bac5048f0193
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = f21a4a89 d4b9b028, %l6 = 0000e3ff, %l7 = d1f9c738
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 00000000f21a4a89 00000000d4b9b028

p0_label_15:
!	Mem[00000000300c1410] = 9bf6daa7 df93bf6b, %l2 = 4cc1aec0, %l3 = 00000000
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 00000000df93bf6b 000000009bf6daa7
!	Mem[00000000211c0000] = ffff7001, %l2 = 00000000df93bf6b
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181400] = e50d75d8d363f4ff, %f8  = 9a072dc5 332b3396
	ldda	[%i6+%g0]0x89,%f8 	! %f8  = e50d75d8 d363f4ff
!	Mem[0000000010101414] = ca3e5f61, %l4 = 0000000000000041
	ldsh	[%i4+0x014],%l4		! %l4 = ffffffffffffca3e
!	Mem[00000000201c0000] = f842826e, %l5 = 0000000000004185
	ldub	[%o0+0x001],%l5		! %l5 = 0000000000000042
!	Mem[0000000010001418] = 8cd29078, %l1 = 47afa9679a5bb092
	lduba	[%i0+0x019]%asi,%l1	! %l1 = 00000000000000d2
!	Mem[0000000020800000] = e5ff8ed8, %l7 = 00000000d4b9b028
	lduha	[%o1+0x000]%asi,%l7	! %l7 = 000000000000e5ff
!	%l7 = 000000000000e5ff, immed = fffffe67, %y  = 00000000
	smul	%l7,-0x199,%l5		! %l5 = fffffffffe908b99, %y = ffffffff
!	Mem[0000000030081400] = 105bf65d, %l0 = 003c7f37fefc57ea
	ldsba	[%i2+%g0]0x89,%l0	! %l0 = 000000000000005d
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 6fd50200, %l7 = 000000000000e5ff
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 000000006fd50200

p0_label_16:
!	Mem[0000000010181410] = 2f627a95, %l4 = ffffffffffffca3e
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 00000095000000ff
!	Mem[0000000010141434] = 00004185, %l6 = 00000000f21a4a89
	swap	[%i5+0x034],%l6		! %l6 = 0000000000004185
!	Mem[00000000300c1408] = 369ce3ff, %l3 = 000000009bf6daa7
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030081400] = 105bf65d, %l6 = 0000000000004185
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 00000000105bf65d
!	%l1 = 00000000000000d2, Mem[00000000100c1410] = 00000000
	stwa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000d2
!	%l7 = 000000006fd50200, Mem[0000000020800041] = 5bafcbdb
	stb	%l7,[%o1+0x041]		! Mem[0000000020800040] = 5b00cbdb
!	%l5 = fffffffffe908b99, Mem[0000000010101410] = 3f24a5ff
	stwa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = fe908b99
!	%l3 = 00000000000000ff, Mem[0000000010001410] = 894a1af2
	stba	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 894a1aff
!	Mem[00000000100c1410] = 000000d2, %l0 = 000000000000005d
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000d2
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 4cc1aeff, %f28 = 44b30f0e
	lda	[%i6+%o4]0x88,%f28	! %f28 = 4cc1aeff

p0_label_17:
!	Mem[0000000030141410] = ec480d19, %l1 = 00000000000000d2
	lduba	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000019
!	Mem[0000000010081400] = abf23466, %l6 = 00000000105bf65d
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = ffffffffffffabf2
!	Mem[0000000021800140] = 05761f70, %l6 = ffffffffffffabf2
	lduba	[%o3+0x140]%asi,%l6	! %l6 = 0000000000000005
!	%l6 = 0000000000000005, imm = fffffffffffff22a, %l6 = 0000000000000005
	or	%l6,-0xdd6,%l6		! %l6 = fffffffffffff22f
!	Mem[0000000030101400] = 6329e9494363913c, %f8  = e50d75d8 d363f4ff
	ldda	[%i4+%g0]0x81,%f8 	! %f8  = 6329e949 4363913c
!	%f9  = 4363913c, %f20 = 190d48ec
	fcmpes	%fcc1,%f9 ,%f20		! %fcc1 = 2
!	Mem[00000000211c0000] = ffff7001, %l3 = 00000000000000ff
	ldsb	[%o2+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030181408] = 8b580085, %l6 = fffffffffffff22f
	lduwa	[%i6+%o4]0x89,%l6	! %l6 = 000000008b580085
!	Mem[0000000010181410] = ff7a622f, %l2 = ffffffffffffffff
	lduwa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ff7a622f
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 00000000000000d2
	setx	0x0bc3baafcbb331c2,%g7,%l0 ! %l0 = 0bc3baafcbb331c2
!	%l1 = 0000000000000019
	setx	0xf9ce8ba82654324b,%g7,%l1 ! %l1 = f9ce8ba82654324b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0bc3baafcbb331c2
	setx	0x5aaa7ab7d17f8721,%g7,%l0 ! %l0 = 5aaa7ab7d17f8721
!	%l1 = f9ce8ba82654324b
	setx	0xf0f8cc8817eefe2d,%g7,%l1 ! %l1 = f0f8cc8817eefe2d

p0_label_18:
!	%l6 = 8b580085, %l7 = 6fd50200, Mem[0000000030101410] = ff68845c b9ad60ec
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 8b580085 6fd50200
!	Mem[0000000010181400] = f9664594, %l3 = ffffffffffffffff
	swapa	[%i6+%g0]0x80,%l3	! %l3 = 00000000f9664594
!	%l0 = d17f8721, %l1 = 17eefe2d, Mem[0000000030141408] = 93018f04 ec480d19
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = d17f8721 17eefe2d
!	Mem[0000000030041400] = 00000000, %l6 = 000000008b580085
	ldstuba	[%i1+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%f2  = d8ad6057 00000000, %l5 = fffffffffe908b99
!	Mem[0000000010141428] = cfd6109f1075e9e0
	add	%i5,0x028,%g1
	stda	%f2,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010141428] = 0000109f1075add8
!	%l2 = ff7a622f, %l3 = f9664594, Mem[0000000010141430] = 00000000 f21a4a89
	std	%l2,[%i5+0x030]		! Mem[0000000010141430] = ff7a622f f9664594
!	Mem[0000000010181432] = 4696fa70, %l0 = 5aaa7ab7d17f8721
	ldstub	[%i6+0x032],%l0		! %l0 = 000000fa000000ff
!	%l5 = fffffffffe908b99, Mem[000000001018142e] = 30e227fb, %asi = 80
	stha	%l5,[%i6+0x02e]%asi	! Mem[000000001018142c] = 30e28b99
!	Mem[0000000030181400] = d363f4ff, %l5 = fffffffffe908b99
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 00000000d363f4ff
!	Starting 10 instruction Load Burst
!	%f28 = 4cc1aeff, %f27 = e630f32a, %f2  = d8ad6057 00000000
	fsmuld	%f28,%f27,%f2 		! %f2  = c670bc09 06585ac0

p0_label_19:
!	Mem[00000000100c1400] = 2fbf6398, %l5 = 00000000d363f4ff
	lduwa	[%i3+%g0]0x80,%l5	! %l5 = 000000002fbf6398
!	Mem[0000000010041400] = 30e227fb9a4fddb3, %l1 = f0f8cc8817eefe2d
	ldxa	[%i1+%g0]0x80,%l1	! %l1 = 30e227fb9a4fddb3
!	%l6 = 0000000000000000, imm = fffffffffffffa61, %l2 = 00000000ff7a622f
	xor	%l6,-0x59f,%l2		! %l2 = fffffffffffffa61
!	Mem[0000000030141400] = ffe3000000000000, %f16 = ffbc2560 c0062757
	ldda	[%i5+%g0]0x89,%f16	! %f16 = ffe30000 00000000
!	%l6 = 0000000000000000, %l1 = 30e227fb9a4fddb3, %l2 = fffffffffffffa61
	andn	%l6,%l1,%l2		! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 5d000000, %l5 = 000000002fbf6398
	lduha	[%i3+%o5]0x80,%l5	! %l5 = 0000000000005d00
!	Mem[0000000021800000] = c120fa80, %l3 = 00000000f9664594
	lduba	[%o3+0x001]%asi,%l3	! %l3 = 0000000000000020
!	Mem[00000000100c141e] = 3a31adc1, %l7 = 000000006fd50200
	ldstub	[%i3+0x01e],%l7		! %l7 = 000000ad000000ff
!	Mem[0000000010001410] = 894a1aff, %l5 = 0000000000005d00
	ldsha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000001aff
!	Starting 10 instruction Store Burst
!	%l1 = 30e227fb9a4fddb3, Mem[00000000300c1400] = 37748897
	stba	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 377488b3

p0_label_20:
!	%l1 = 30e227fb9a4fddb3, Mem[0000000010041400] = fb27e230
	stba	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = fb27e2b3
!	Mem[00000000100c142c] = 3821afa1, %l2 = 0000000000000000, %asi = 80
	swapa	[%i3+0x02c]%asi,%l2	! %l2 = 000000003821afa1
!	%l5 = 0000000000001aff, Mem[0000000010101408] = 000000f2
	stwa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 00001aff
!	%l3 = 0000000000000020, Mem[0000000010081408] = d1bc54bf
	stwa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000020
!	%l5 = 0000000000001aff, Mem[00000000300c1408] = 369ce3ff
	stwa	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00001aff
!	Mem[0000000030141400] = 00000000, %l0 = 00000000000000fa
	swapa	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%f25 = a5f349f5, Mem[0000000030101408] = ffe3de3f
	sta	%f25,[%i4+%o4]0x81	! Mem[0000000030101408] = a5f349f5
!	Mem[0000000030181400] = 998b90fe, %l3 = 0000000000000020
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 00000000998b90fe
!	%f9  = 4363913c, Mem[0000000010181400] = ffffffff
	sta	%f9 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 4363913c
!	Starting 10 instruction Load Burst
!	Mem[0000000010181420] = 9156ec166b0274a1, %l7 = 00000000000000ad
	ldx	[%i6+0x020],%l7		! %l7 = 9156ec166b0274a1

p0_label_21:
!	Mem[0000000030081410] = 3ac8ceaf, %f19 = ec480d19
	lda	[%i2+%o5]0x81,%f19	! %f19 = 3ac8ceaf
!	Mem[0000000030081410] = 3ac8ceaf, %l4 = 0000000000000095
	ldsha	[%i2+%o5]0x81,%l4	! %l4 = 0000000000003ac8
!	Mem[00000000300c1408] = ff1a0000 b7969efe, %l2 = 3821afa1, %l3 = 998b90fe
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 00000000ff1a0000 00000000b7969efe
!	%f8  = 6329e949, %f19 = 3ac8ceaf, %f6  = 1fa88f69 38e3a028
	fsmuld	%f8 ,%f19,%f6 		! %f6  = 43d0a8ed dce6dce0
!	Mem[0000000030001400] = c069fdb7, %l3 = 00000000b7969efe
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 00000000c069fdb7
!	Mem[0000000030101408] = a5f349f55760add8, %f20 = 190d48ec 7abaad19
	ldda	[%i4+%o4]0x81,%f20	! %f20 = a5f349f5 5760add8
!	Mem[0000000030141410] = 190d48ec, %l6 = 0000000000000000
	lduwa	[%i5+%o5]0x81,%l6	! %l6 = 00000000190d48ec
!	Mem[0000000010141408] = 8d7a8ee0, %l7 = 9156ec166b0274a1
	lduha	[%i5+%o4]0x80,%l7	! %l7 = 0000000000008d7a
!	Mem[0000000030081410] = 3ac8ceaf dd75568b, %l4 = 00003ac8, %l5 = 00001aff
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 000000003ac8ceaf 00000000dd75568b
!	Starting 10 instruction Store Burst
!	%l4 = 000000003ac8ceaf, Mem[0000000030101408] = a5f349f5
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = ceaf49f5

p0_label_22:
!	Mem[0000000010081408] = 20000000, %l3 = 00000000c069fdb7
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 00000020000000ff
!	%f5  = f45c1c07, Mem[0000000010001408] = b529ff17
	sta	%f5 ,[%i0+%o4]0x88	! Mem[0000000010001408] = f45c1c07
!	Mem[0000000030181410] = e7cacfd0, %l7 = 0000000000008d7a
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 00000000e7cacfd0
!	%l3 = 0000000000000020, Mem[0000000010181408] = ffaec14c
	stba	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 20aec14c
!	%l6 = 00000000190d48ec, Mem[0000000010001410] = 894a1aff
	stba	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 894a1aec
!	%f8  = 6329e949 4363913c, Mem[00000000100c1408] = f79dc35b c0aec14c
	stda	%f8 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 6329e949 4363913c
!	Mem[0000000010141413] = 00000000, %l0 = 0000000000000000
	ldstub	[%i5+0x013],%l0		! %l0 = 00000000000000ff
!	%l6 = 00000000190d48ec, Mem[0000000020800040] = 5b00cbdb
	sth	%l6,[%o1+0x040]		! Mem[0000000020800040] = 48eccbdb
!	%l5 = 00000000dd75568b, immd = 0000000000000ccf, %l6  = 00000000190d48ec
	mulx	%l5,0xccf,%l6		! %l6 = 00000b1491ef7e65
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = f842826e, %l3 = 0000000000000020
	ldsh	[%o0+%g0],%l3		! %l3 = fffffffffffff842

p0_label_23:
!	Mem[0000000010181400] = 3c916343f27ac1d1, %l2 = 00000000ff1a0000
	ldxa	[%i6+%g0]0x80,%l2	! %l2 = 3c916343f27ac1d1
!	%f30 = f0e1cbc9, %f20 = a5f349f5
	fcmps	%fcc1,%f30,%f20		! %fcc1 = 1
!	Mem[0000000030001410] = f2000000, %l6 = 00000b1491ef7e65
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 00000000f2000000
!	Mem[0000000030181408] = 8b580085, %l2 = 3c916343f27ac1d1
	lduwa	[%i6+%o4]0x89,%l2	! %l2 = 000000008b580085
!	Mem[00000000100c1410] = 0000005d, %f22 = 16f02ac0
	lda	[%i3+%o5]0x88,%f22	! %f22 = 0000005d
!	Mem[0000000030141410] = 190d48ec7abaad19, %f8  = 6329e949 4363913c
	ldda	[%i5+%o5]0x81,%f8 	! %f8  = 190d48ec 7abaad19
!	Mem[0000000030041410] = 6759f701, %l5 = 00000000dd75568b
	ldswa	[%i1+%o5]0x81,%l5	! %l5 = 000000006759f701
!	Mem[00000000100c1400] = 2fbf6398, %f6  = 43d0a8ed
	lda	[%i3+%g0]0x80,%f6 	! %f6 = 2fbf6398
!	Mem[0000000010101408] = 00001aff, %l0 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l0	! %l0 = 0000000000001aff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000001aff, Mem[00000000211c0000] = ffff7001, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 1aff7001

p0_label_24:
!	%l1 = 30e227fb9a4fddb3, Mem[0000000030101408] = ceaf49f5
	stha	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = ddb349f5
!	%l4 = 000000003ac8ceaf, Mem[0000000010141410] = 000000ffda2da1b4
	stxa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000003ac8ceaf
!	%l1 = 30e227fb9a4fddb3, Mem[0000000010041410] = 7610888b
	stha	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 7610ddb3
!	%l6 = 00000000f2000000, Mem[0000000020800040] = 48eccbdb, %asi = 80
	stba	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 00eccbdb
!	%l2 = 8b580085, %l3 = fffff842, Mem[0000000030181410] = 7a8d0000 33f5aec3
	stda	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 8b580085 fffff842
!	Mem[0000000010081408] = ff000000, %l7 = 00000000e7cacfd0
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030081400] = 85410000, %l4 = 000000003ac8ceaf
	ldstuba	[%i2+%g0]0x81,%l4	! %l4 = 00000085000000ff
!	Mem[0000000010141410] = 00000000, %l0 = 0000000000001aff
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = fb27e2b3, %l2 = 000000008b580085
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 00000000fb27e2b3
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 0002d56f8500588b, %f0  = 7e000000 00000000
	ldda	[%i4+%o5]0x89,%f0 	! %f0  = 0002d56f 8500588b

p0_label_25:
!	Mem[00000000211c0000] = 1aff7001, %l5 = 000000006759f701
	lduh	[%o2+%g0],%l5		! %l5 = 0000000000001aff
!	Mem[0000000010141410] = ff1a0000 3ac8ceaf, %l2 = fb27e2b3, %l3 = fffff842
	ldda	[%i5+0x010]%asi,%l2	! %l2 = 00000000ff1a0000 000000003ac8ceaf
!	Mem[0000000010001408] = 071c5cf4, %l4 = 0000000000000085
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = 00000000071c5cf4
!	Mem[00000000218001c0] = ffb737e3, %l3 = 000000003ac8ceaf
	lduba	[%o3+0x1c0]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081408] = e7cacfd0, %l4 = 00000000071c5cf4
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = ffffffffe7cacfd0
!	Mem[0000000010101428] = a07505ad, %f4  = 8cd29078
	lda	[%i4+0x028]%asi,%f4 	! %f4 = a07505ad
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010101400] = ffe50000 9adda571 ff1a0000 fd5f29b5
!	Mem[0000000010101410] = 998b90fe ca3e5f61 ac1fbdec 01e3452a
!	Mem[0000000010101420] = e08e7a8d 615241bc a07505ad ffffffaf
!	Mem[0000000010101430] = 27468419 cd1bbf6b 79b1bd27 05e68fbe
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000010081410] = 8500007e2e1171cd, %f0  = 0002d56f 8500588b
	ldd	[%i2+%o5],%f0 		! %f0  = 8500007e 2e1171cd
!	%f1  = 2e1171cd, %f5  = f45c1c07, %f4  = a07505ad
	fsubs	%f1 ,%f5 ,%f4 		! %f4  = 745c1c07
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 9a4fddb3, Mem[0000000010181400] = 3c916343 f27ac1d1
	stda	%l0,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000 9a4fddb3

p0_label_26:
!	%f14 = 8500588b 2e1171cd, Mem[0000000010041420] = 7566a737 aaa9259b
	std	%f14,[%i1+0x020]	! Mem[0000000010041420] = 8500588b 2e1171cd
!	%f14 = 8500588b 2e1171cd, Mem[0000000010081400] = abf23466 8d7a8ee0
	stda	%f14,[%i2+%g0]0x80	! Mem[0000000010081400] = 8500588b 2e1171cd
!	%f6  = 2fbf6398, Mem[0000000030081408] = fdb8afb7
	sta	%f6 ,[%i2+%o4]0x89	! Mem[0000000030081408] = 2fbf6398
!	Mem[00000000100c1408] = 3c916343, %l0 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l0	! %l0 = 0000000000003c91
!	Mem[000000001000141d] = f45c1c07, %l5 = 0000000000001aff
	ldstub	[%i0+0x01d],%l5		! %l5 = 0000005c000000ff
!	%f0  = 8500007e 2e1171cd c670bc09 06585ac0
!	%f4  = 745c1c07 f45c1c07 2fbf6398 dce6dce0
!	%f8  = 190d48ec 7abaad19 2c27cb51 98b2e1d6
!	%f12 = e59e9a19 b9694dd2 8500588b 2e1171cd
	stda	%f0,[%i4]ASI_COMMIT_S	! Block Store to 0000000030101400
!	%l7 = 00000000ff000000, Mem[00000000300c1408] = ff1a0000
	stha	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%l6 = f2000000, %l7 = ff000000, Mem[0000000010081410] = 8500007e 2e1171cd
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = f2000000 ff000000
!	Mem[0000000030041408] = ca4bcae7, %l5 = 000000000000005c
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 00000000ca4bcae7
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = c1ad313a, %l3 = 00000000000000ff
	ldswa	[%i6+0x018]%asi,%l3	! %l3 = ffffffffc1ad313a

p0_label_27:
!	Mem[0000000030141400] = fa000000 0000e3ff d17f8721 17eefe2d
!	Mem[0000000030141410] = 190d48ec 7abaad19 16f02ac0 3e608a57
!	Mem[0000000030141420] = f4b0d034 a5f349f5 e3c0f0cf e630f32a
!	Mem[0000000030141430] = 44b30f0e 73352ded f0e1cbc9 9863bf2f
	ldda	[%i5]ASI_BLK_SL,%f16	! Block Load from 0000000030141400
!	Mem[000000001018140c] = f79dc35b, %l3 = ffffffffc1ad313a
	lduh	[%i6+0x00c],%l3		! %l3 = 000000000000f79d
!	Mem[0000000010141410] = ff1a0000, %l0 = 0000000000003c91
	lduba	[%i5+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000000000ff, %l7 = 00000000ff000000, %l1 = 30e227fb9a4fddb3
	sdivx	%l0,%l7,%l1		! %l1 = 0000000000000000
!	Mem[0000000010041400] = 8500588b 9a4fddb3, %l6 = f2000000, %l7 = ff000000
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 000000008500588b 000000009a4fddb3
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010101400] = 0000e5ff, %l7 = 000000009a4fddb3
	ldsba	[%i4+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181410] = 8b580085, %l6 = 000000008500588b
	ldsha	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000085
!	Mem[0000000010101400] = ffe50000, %l4 = ffffffffe7cacfd0
	lduwa	[%i4+%g0]0x80,%l4	! %l4 = 00000000ffe50000
!	Mem[0000000010001410] = ec1a4a89, %f22 = 578a603e
	lda	[%i0+%o5]0x80,%f22	! %f22 = ec1a4a89
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ca4bcae7, Mem[0000000030101408] = 09bc70c6
	stwa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = ca4bcae7

p0_label_28:
!	Mem[0000000010141410] = ff1a0000, %l3 = 000000000000f79d
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = ffffffffff1a0000
!	%l4 = 00000000ffe50000, Mem[0000000010141420] = c0aec14cf79dc35b, %asi = 80
	stxa	%l4,[%i5+0x020]%asi	! Mem[0000000010141420] = 00000000ffe50000
!	Mem[00000000100c1408] = 3c916343, %l3 = ffffffffff1a0000
	swap	[%i3+%o4],%l3		! %l3 = 000000003c916343
!	Mem[0000000030041410] = 01f75967, %l6 = 0000000000000085
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 00000067000000ff
!	Mem[0000000021800001] = c120fa80, %l6 = 0000000000000067
	ldstuba	[%o3+0x001]%asi,%l6	! %l6 = 00000020000000ff
!	%l1 = 0000000000000000, Mem[0000000010081410] = 000000f2
	stwa	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	Mem[00000000300c1410] = df93bf6b, %l0 = 00000000000000ff
	ldstuba	[%i3+%o5]0x89,%l0	! %l0 = 0000006b000000ff
!	%l6 = 00000020, %l7 = ffffffff, Mem[0000000030001400] = c069fdb7 7307d2eb
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000020 ffffffff
!	%l0 = 0000006b, %l1 = 00000000, Mem[0000000010081400] = 8500588b 2e1171cd
	stda	%l0,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000006b 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000000020
	ldswa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000

p0_label_29:
!	Mem[0000000010101408] = 00001aff, %l0 = 000000000000006b
	ldswa	[%i4+%o4]0x88,%l0	! %l0 = 0000000000001aff
!	Mem[0000000010041410] = 7610ddb3, %l1 = 0000000000000000
	ldsha	[%i1+%o5]0x88,%l1	! %l1 = ffffffffffffddb3
!	Mem[0000000030101400] = 7e000085, %l0 = 0000000000001aff
	lduha	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000085
!	Mem[00000000100c1428] = fb27e230 00000000, %l4 = ffe50000, %l5 = ca4bcae7
	ldd	[%i3+0x028],%l4		! %l4 = 00000000fb27e230 0000000000000000
!	Mem[0000000021800000] = c1fffa80, %l1 = ffffffffffffddb3
	ldsh	[%o3+%g0],%l1		! %l1 = ffffffffffffc1ff
!	Mem[00000000100c1408] = 00001aff, %l2 = 00000000ff1a0000
	lduba	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l0 = 0000000000000085, %l6 = 0000000000000000, %l2 = 00000000000000ff
	addc	%l0,%l6,%l2		! %l2 = 0000000000000085
!	Mem[0000000010181410] = ff7a622f, %l4 = 00000000fb27e230
	ldsha	[%i6+%o5]0x80,%l4	! %l4 = ffffffffffffff7a
!	Mem[0000000030041408] = 5c000000, %l3 = 000000003c916343
	ldsha	[%i1+%o4]0x81,%l3	! %l3 = 0000000000005c00
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffff, Mem[0000000010001410] = ec1a4a89
	stha	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = ffff4a89

p0_label_30:
!	%l4 = ffffffffffffff7a, Mem[0000000010181408] = 20aec14c
	stba	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 7aaec14c
!	%l1 = ffffffffffffc1ff, Mem[0000000030001400] = 20000000
	stwa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffc1ff
!	Mem[00000000100c1418] = 0000003a, %l1 = ffffffffffffc1ff
	swap	[%i3+0x018],%l1		! %l1 = 000000000000003a
!	%l5 = 0000000000000000, Mem[0000000030101408] = e7ca4bca06585ac0
	stxa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000
!	%l0 = 0000000000000085, Mem[000000001004141a] = 20f9364e
	stb	%l0,[%i1+0x01a]		! Mem[0000000010041418] = 20f9854e
!	Mem[0000000010181400] = 00000000, %l2 = 0000000000000085
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181434] = c5bab51a, %l5 = 00000000, %l1 = 0000003a
	add	%i6,0x34,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 00000000c5bab51a
!	Mem[0000000010081410] = 00000000, %l4 = ffffffffffffff7a
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141410] = 190d48ec, %l7 = ffffffffffffffff
	ldstuba	[%i5+%o5]0x81,%l7	! %l7 = 00000019000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 87c8f692 01f759ff, %l6 = 00000000, %l7 = 00000019
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 0000000001f759ff 0000000087c8f692

p0_label_31:
!	Mem[0000000010001400] = ff0b95bc ae4a49ae, %l2 = 00000000, %l3 = 00005c00
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ff0b95bc 00000000ae4a49ae
!	Mem[0000000030041400] = 000000ff, %l7 = 0000000087c8f692
	ldswa	[%i1+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1400] = 377488b3, %l2 = 00000000ff0b95bc
	ldsha	[%i3+%g0]0x89,%l2	! %l2 = ffffffffffff88b3
!	Mem[0000000010181408] = 5bc39df7 4cc1ae7a, %l0 = 00000085, %l1 = c5bab51a
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 000000004cc1ae7a 000000005bc39df7
!	Mem[0000000030141410] = ff0d48ec, %f12 = e59e9a19
	lda	[%i5+%o5]0x81,%f12	! %f12 = ff0d48ec
!	Mem[0000000010041400] = 8500588b9a4fddb3, %f6  = 2fbf6398 dce6dce0
	ldda	[%i1+%g0]0x80,%f6 	! %f6  = 8500588b 9a4fddb3
!	Mem[0000000030041408] = e3380c92 0000005c, %l4 = 00000000, %l5 = 00000000
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 000000000000005c 00000000e3380c92
!	Mem[0000000010141408] = 22c01df2 e08e7a8d, %l0 = 4cc1ae7a, %l1 = 5bc39df7
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 00000000e08e7a8d 0000000022c01df2
!	Mem[0000000030141400] = fa0000000000e3ff, %l3 = 00000000ae4a49ae
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = fa0000000000e3ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000e3380c92, immed = 00000be7, %y  = ffffffff
	sdiv	%l5,0xbe7,%l5		! %l5 = fffffffffffd94f8
	mov	%l0,%y			! %y = e08e7a8d

p0_label_32:
!	%l1 = 0000000022c01df2, imm = 0000000000000ba4, %l6 = 0000000001f759ff
	sub	%l1,0xba4,%l6		! %l6 = 0000000022c0124e
!	Mem[0000000030141400] = 000000fa, %l4 = 000000000000005c
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000fa
!	%l0 = 00000000e08e7a8d, Mem[0000000010181408] = 4cc1ae7a
	stha	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 4cc17a8d
!	Mem[0000000010081400] = 6b000000, %l7 = 00000000000000ff
	ldstuba	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l0 = 00000000e08e7a8d, Mem[0000000030041410] = 01f759ff
	stba	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 01f7598d
!	%l1 = 0000000022c01df2, imm = 0000000000000870, %l5 = fffffffffffd94f8
	xnor	%l1,0x870,%l5		! %l5 = ffffffffdd3fea7d
!	%l2 = ffffffffffff88b3, Mem[0000000010181410] = 190118222f627aff
	stxa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffffffff88b3
!	Mem[00000000100c1408] = ff1a0000, %l5 = ffffffffdd3fea7d
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000100c1408] = ff1a0000, %l4 = 00000000000000fa
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 00000000ff1a0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 21877fd1, %l6 = 0000000022c0124e
	lduwa	[%i5+%o4]0x89,%l6	! %l6 = 0000000021877fd1

p0_label_33:
!	Mem[0000000030181408] = 8500588b, %l1 = 0000000022c01df2
	lduha	[%i6+%o4]0x81,%l1	! %l1 = 0000000000008500
!	Mem[0000000030141400] = ffe300000000005c, %l7 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l7	! %l7 = ffe300000000005c
!	Mem[00000000300c1410] = ffbf93df, %l6 = 0000000021877fd1
	lduba	[%i3+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001400] = ffc1ffff, %l2 = ffffffffffff88b3
	ldsha	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffffffc1
!	Mem[0000000030141400] = ffe300000000005c, %f30 = 2fbf6398 c9cbe1f0
	ldda	[%i5+%g0]0x89,%f30	! %f30 = ffe30000 0000005c
!	Mem[00000000201c0000] = f842826e, %l2 = ffffffffffffffc1
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 000000000000f842
!	Mem[0000000010141410] = 00001aff, %l7 = ffe300000000005c
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = 0000000000001aff
!	Mem[0000000010141408] = e08e7a8d, %l6 = 00000000000000ff
	ldsba	[%i5+%o4]0x88,%l6	! %l6 = ffffffffffffff8d
!	Mem[0000000030101408] = 00000000, %f19 = 21877fd1
	lda	[%i4+%o4]0x81,%f19	! %f19 = 00000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000008500, Mem[0000000030181408] = 8b580085
	stba	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 8b580000

p0_label_34:
!	%l6 = ffffff8d, %l7 = 00001aff, Mem[0000000030081408] = 2fbf6398 356fed0b
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffff8d 00001aff
!	Mem[0000000010081410] = 000000ff, %l0 = 00000000e08e7a8d
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l2 = 0000f842, %l3 = 0000e3ff, Mem[0000000010041418] = 20f9854e a0494af5
	stda	%l2,[%i1+0x018]%asi	! Mem[0000000010041418] = 0000f842 0000e3ff
!	%l2 = 000000000000f842, Mem[0000000010041408] = d1bc54bf
	stwa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000f842
!	%f22 = ec1a4a89 c02af016, %l7 = 0000000000001aff
!	Mem[0000000030041420] = 96332b33c52d079a
	add	%i1,0x020,%g1
	stda	%f22,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030041420] = 16f02ac0894a1aec
!	%l7 = 0000000000001aff, Mem[0000000030001408] = f2000000ff000000
	stxa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000000001aff
!	%f14 = 8500588b 2e1171cd, %l4 = 00000000ff1a0000
!	Mem[0000000030101410] = 745c1c07f45c1c07
	add	%i4,0x010,%g1
	stda	%f14,[%g1+%l4]ASI_PST16_S ! Mem[0000000030101410] = 745c1c07f45c1c07
!	Mem[0000000010001400] = ff0b95bc, %l2 = 000000000000f842
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%f16 = ffe30000 000000fa, Mem[0000000010101408] = ff1a0000 fd5f29b5
	std	%f16,[%i4+%o4]	! Mem[0000000010101408] = ffe30000 000000fa
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff0b95bc, %l6 = ffffffffffffff8d
	ldsha	[%i0+%g0]0x80,%l6	! %l6 = ffffffffffffff0b

p0_label_35:
!	Mem[00000000100c1410] = 5d0000002f627a95, %f4  = 745c1c07 f45c1c07
	ldda	[%i3+%o5]0x80,%f4 	! %f4  = 5d000000 2f627a95
!	Mem[0000000010181400] = 000000ff, %l1 = 0000000000008500
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = b388ffff, %f0  = 8500007e
	lda	[%i6+%o5]0x80,%f0 	! %f0 = b388ffff
!	Mem[0000000010041428] = bedae363, %l1 = 00000000000000ff
	ldswa	[%i1+0x028]%asi,%l1	! %l1 = ffffffffbedae363
!	Mem[0000000030041400] = ff000000 0000007e, %l0 = 000000ff, %l1 = bedae363
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 00000000ff000000 000000000000007e
!	Mem[0000000030001408] = 00001aff, %l6 = ffffffffffffff0b
	lduha	[%i0+%o4]0x89,%l6	! %l6 = 0000000000001aff
!	Mem[0000000010041408] = 0000f842, %f18 = 2dfeee17
	lda	[%i1+%o4]0x88,%f18	! %f18 = 0000f842
!	Mem[0000000010081438] = e159344cee30e417, %l6 = 0000000000001aff
	ldxa	[%i2+0x038]%asi,%l6	! %l6 = e159344cee30e417
!	%f31 = 0000005c, %f27 = cff0c0e3, %f2  = c670bc09 06585ac0
	fsmuld	%f31,%f27,%f2 		! %l0 = 00000000ff000022, Unfinished, %fsr = 1100000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010081408] = d0cfcae7
	stha	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = d0cf00ff

p0_label_36:
!	%l3 = fa0000000000e3ff, Mem[0000000010081408] = d0cf00ff
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = d0cf00ff
!	Mem[00000000100c142c] = 00000000, %l0 = 00000000ff000022
	ldstub	[%i3+0x02c],%l0		! %l0 = 00000000000000ff
!	Mem[00000000218001c1] = ffb737e3, %l1 = 000000000000007e
	ldstub	[%o3+0x1c1],%l1		! %l1 = 000000b7000000ff
!	%l2 = 00000000000000ff, Mem[00000000100c1400] = 9863bf2f
	stwa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	%l2 = 00000000000000ff, imm = 0000000000000861, %l4 = 00000000ff1a0000
	addc	%l2,0x861,%l4		! %l4 = 0000000000000960
!	%l2 = 00000000000000ff, Mem[0000000010081400] = ff00006b
	stha	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00ff006b
!	%l4 = 00000960, %l5 = 000000ff, Mem[0000000030001410] = f2000000 00000000
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000960 000000ff
!	%l4 = 00000960, %l5 = 000000ff, Mem[0000000030101410] = 745c1c07 f45c1c07
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000960 000000ff
!	Mem[0000000010081408] = d0cf00ff, %l2 = 00000000000000ff
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c143c] = 38c7f9d1, %f23 = c02af016
	ld	[%i3+0x03c],%f23	! %f23 = 38c7f9d1

p0_label_37:
!	Mem[00000000201c0000] = f842826e, %l4 = 0000000000000960
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = 0000000000000042
!	Mem[0000000030181400] = 00000020, %l3 = fa0000000000e3ff
	ldswa	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000020
!	Mem[00000000100c141c] = 3a31ffc1, %l2 = 00000000000000ff
	ldsb	[%i3+0x01c],%l2		! %l2 = 000000000000003a
!	Mem[0000000030141400] = 0000005c, %l7 = 0000000000001aff
	lduha	[%i5+%g0]0x89,%l7	! %l7 = 000000000000005c
!	Mem[0000000010041400] = b3dd4f9a8b580085, %l6 = e159344cee30e417
	ldxa	[%i1+%g0]0x88,%l6	! %l6 = b3dd4f9a8b580085
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010041400] = 8500588b 9a4fddb3 42f80000 35f02198
!	Mem[0000000010041410] = b3dd1076 d632e47b 0000f842 0000e3ff
!	Mem[0000000010041420] = 8500588b 2e1171cd bedae363 380ea27e
!	Mem[0000000010041430] = a775ccae a404cce3 ea47eed9 d71c70a7
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[000000001010142c] = ffffffaf, %l0 = 0000000000000000
	lduw	[%i4+0x02c],%l0		! %l0 = 00000000ffffffaf
!	Mem[0000000030141408] = d17f872117eefe2d, %f28 = ed2d3573 0e0fb344
	ldda	[%i5+%o4]0x81,%f28	! %f28 = d17f8721 17eefe2d
!	Mem[0000000010041410] = b3dd1076, %l7 = 000000000000005c
	ldswa	[%i1+%o5]0x80,%l7	! %l7 = ffffffffb3dd1076
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (8)
!	%l6 = 8b580085, %l7 = b3dd1076, Mem[0000000010041400] = 8500588b 9a4fddb3
	stda	%l6,[%i1+0x000]%asi	! Mem[0000000010041400] = 8b580085 b3dd1076

p0_label_38:
!	Mem[0000000010001408] = f45c1c07, %l4 = 0000000000000042
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 00000007000000ff
!	%f24 = f549f3a5, %f26 = 2af330e6
	fcmpes	%fcc3,%f24,%f26		! %fcc3 = 1
!	%f0  = 8500588b 9a4fddb3, Mem[0000000030001410] = 60090000 ff000000
	stda	%f0 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 8500588b 9a4fddb3
!	%l5 = 00000000000000ff, Mem[0000000010141410] = 00001aff
	stba	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 00001aff
!	Mem[0000000030181400] = 00000020, %l7 = ffffffffb3dd1076
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000020
!	%l5 = 00000000000000ff, Mem[0000000030181408] = cd71112e8b580000
	stxa	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000ff
!	Mem[0000000030101400] = 7e000085, %l1 = 00000000000000b7
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 000000007e000085
!	%l7 = 0000000000000020, Mem[0000000010141408] = 8d7a8ee0
	stwa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000020
!	Mem[00000000211c0001] = 1aff7001, %l5 = 00000000000000ff
	ldstub	[%o2+0x001],%l5		! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = d0cf00ff, %l6 = b3dd4f9a8b580085
	lduba	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000ff

p0_label_39:
!	Mem[00000000300c1400] = 377488b3, %l1 = 000000007e000085
	ldswa	[%i3+%g0]0x89,%l1	! %l1 = 00000000377488b3
!	Mem[0000000010081408] = d0cf00ff, %l6 = 00000000000000ff
	lduba	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181408] = 8d7ac14c f79dc35b, %l4 = 00000007, %l5 = 000000ff
	ldda	[%i6+%o4]0x80,%l4	! %l4 = 000000008d7ac14c 00000000f79dc35b
!	Mem[00000000100c1408] = fa000000, %l7 = 0000000000000020
	ldsba	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 000000ff, %l4 = 000000008d7ac14c
	lduha	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141410] = ff0d48ec, %f17 = 000000fa
	lda	[%i5+%o5]0x81,%f17	! %f17 = ff0d48ec
!	Mem[0000000021800000] = c1fffa80, %l3 = 0000000000000020
	ldsb	[%o3+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010081408] = 52f7846fd0cf00ff, %f26 = 2af330e6 cff0c0e3
	ldda	[%i2+%o4]0x88,%f26	! %f26 = 52f7846f d0cf00ff
!	Mem[0000000030081408] = 8dffffffff1a0000, %f4  = b3dd1076 d632e47b
	ldda	[%i2+%o4]0x81,%f4 	! %f4  = 8dffffff ff1a0000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 00000960, %l6 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000960

p0_label_40:
!	%l6 = 0000000000000960, Mem[000000001014143b] = f0e4752e, %asi = 80
	stba	%l6,[%i5+0x03b]%asi	! Mem[0000000010141438] = f0e47560
!	%f2  = 42f80000 35f02198, Mem[0000000030041400] = 000000ff 7e000000
	stda	%f2 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 42f80000 35f02198
!	%l4 = 00000000000000ff, immed = fffffd96, %y  = e08e7a8d
	umul	%l4,-0x26a,%l6		! %l6 = 000000fefffd986a, %y = 000000fe
!	%l1 = 00000000377488b3, Mem[0000000010001408] = ff1c5cf4
	stha	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 88b35cf4
!	%l6 = 000000fefffd986a, Mem[00000000300c1400] = b3887437
	stba	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 6a887437
!	%f28 = d17f8721, Mem[0000000010181428] = a1af2138
	sta	%f28,[%i6+0x028]%asi	! Mem[0000000010181428] = d17f8721
!	%l4 = 00000000000000ff, Mem[0000000010081400] = 00ff006b
	stha	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00ff006b
!	%l3 = ffffffffffffffff, Mem[0000000010181438] = 894a1af2d0cf2ceb
	stx	%l3,[%i6+0x038]		! Mem[0000000010181438] = ffffffffffffffff
!	%f4  = 8dffffff, Mem[0000000010041410] = b3dd1076
	sta	%f4 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 8dffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 00eccbdb, %l3 = ffffffffffffffff
	ldsba	[%o1+0x040]%asi,%l3	! %l3 = 0000000000000000

p0_label_41:
!	Mem[0000000010101410] = 615f3ecafe908b99, %l5 = 00000000f79dc35b
	ldxa	[%i4+%o5]0x88,%l5	! %l5 = 615f3ecafe908b99
!	Mem[00000000100c1430] = 1ab5bac5 048f0193, %l2 = 0000003a, %l3 = 00000000
	ldd	[%i3+0x030],%l2		! %l2 = 000000001ab5bac5 00000000048f0193
!	Mem[0000000030141408] = 21877fd1, %l4 = 00000000000000ff
	lduba	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000d1
!	Mem[0000000010181408] = 8d7ac14c f79dc35b, %l6 = fffd986a, %l7 = 00000000
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 000000008d7ac14c 00000000f79dc35b
!	Mem[00000000100c1408] = fa000000, %l0 = 00000000ffffffaf
	ldswa	[%i3+%o4]0x88,%l0	! %l0 = fffffffffa000000
!	Mem[0000000010041408] = 0000f842, %l3 = 00000000048f0193
	lduba	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000042
!	Mem[0000000030081410] = afcec83a, %l0 = fffffffffa000000
	lduwa	[%i2+%o5]0x89,%l0	! %l0 = 00000000afcec83a
!	%l6 = 000000008d7ac14c, immed = fffff2f4, %y  = 000000fe
	sdiv	%l6,-0xd0c,%l0		! %l0 = ffffffffec7d47d7
	mov	%l0,%y			! %y = ec7d47d7
!	Mem[00000000100c1418] = ffffc1ff, %l2 = 000000001ab5bac5
	ldsb	[%i3+0x01a],%l2		! %l2 = ffffffffffffffc1
!	Starting 10 instruction Store Burst
!	%l6 = 8d7ac14c, %l7 = f79dc35b, Mem[0000000010181408] = 4cc17a8d 5bc39df7
	stda	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 8d7ac14c f79dc35b

p0_label_42:
!	Mem[0000000030001410] = b3dd4f9a, %l3 = 0000000000000042
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 00000000b3dd4f9a
!	Mem[000000001014143d] = e8a4b005, %l2 = ffffffffffffffc1
	ldstuba	[%i5+0x03d]%asi,%l2	! %l2 = 000000a4000000ff
!	Mem[0000000030041400] = 9821f035, %l5 = 615f3ecafe908b99
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 000000009821f035
!	%l6 = 000000008d7ac14c, Mem[0000000010141408] = 20000000
	stwa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 8d7ac14c
!	%l6 = 000000008d7ac14c, Mem[0000000010041408] = 42f80000
	stha	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = c14c0000
!	%l4 = 00000000000000d1, Mem[0000000010001408] = 88b35cf4, %asi = 80
	stwa	%l4,[%i0+0x008]%asi	! Mem[0000000010001408] = 000000d1
!	%l7 = 00000000f79dc35b, imm = fffffffffffff4d5, %l1 = 00000000377488b3
	xor	%l7,-0xb2b,%l1		! %l1 = ffffffff0862378e
!	%l6 = 000000008d7ac14c, Mem[0000000010181400] = b3dd4f9a000000ff
	stxa	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000008d7ac14c
!	Mem[0000000010141428] = 0000109f, %l1 = ffffffff0862378e, %asi = 80
	swapa	[%i5+0x028]%asi,%l1	! %l1 = 000000000000109f
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 8dffffff, %f26 = 52f7846f
	lda	[%i2+%o4]0x81,%f26	! %f26 = 8dffffff

p0_label_43:
!	Mem[0000000030101410] = ff000000, %l0 = ffffffffec7d47d7
	lduba	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = b388ffff, %f16 = ffe30000
	ld	[%i6+%o5],%f16	! %f16 = b388ffff
!	%l1 = 000000000000109f, imm = 000000000000068c, %l6 = 000000008d7ac14c
	addc	%l1,0x68c,%l6		! %l6 = 000000000000172b
!	Mem[00000000201c0000] = f842826e, %l4 = 00000000000000d1
	ldub	[%o0+%g0],%l4		! %l4 = 00000000000000f8
!	Mem[0000000010101408] = ffe30000000000fa, %f0  = 8500588b 9a4fddb3
	ldd	[%i4+%o4],%f0 		! %f0  = ffe30000 000000fa
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 0000000000000000
	setx	0x9004adc81d9b5231,%g7,%l0 ! %l0 = 9004adc81d9b5231
!	%l1 = 000000000000109f
	setx	0xe5ec722806118003,%g7,%l1 ! %l1 = e5ec722806118003
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9004adc81d9b5231
	setx	0x5e2afd082f140600,%g7,%l0 ! %l0 = 5e2afd082f140600
!	%l1 = e5ec722806118003
	setx	0x613e7d8ff5846645,%g7,%l1 ! %l1 = 613e7d8ff5846645
!	Mem[0000000030081400] = ff410000, %l3 = 00000000b3dd4f9a
	ldsha	[%i2+%g0]0x81,%l3	! %l3 = ffffffffffffff41
!	Mem[0000000010141408] = 22c01df28d7ac14c, %f2  = 42f80000 35f02198
	ldda	[%i5+%o4]0x88,%f2 	! %f2  = 22c01df2 8d7ac14c
!	Mem[0000000030181400] = 7610ddb3, %l4 = 00000000000000f8
	lduha	[%i6+%g0]0x89,%l4	! %l4 = 000000000000ddb3
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000a4, Mem[0000000010081420] = 4d52c53b96a1271f, %asi = 80
	stxa	%l2,[%i2+0x020]%asi	! Mem[0000000010081420] = 00000000000000a4

p0_label_44:
!	Mem[00000000201c0000] = f842826e, %l7 = 00000000f79dc35b
	ldstub	[%o0+%g0],%l7		! %l7 = 000000f8000000ff
!	%f7  = 0000e3ff, Mem[0000000030041400] = fe908b99
	sta	%f7 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000e3ff
!	%l1 = 613e7d8ff5846645, Mem[00000000201c0000] = ff42826e
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 4542826e
!	Mem[0000000010081408] = d0cf00ff, %l3 = ffffffffffffff41
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%l4 = 000000000000ddb3, Mem[0000000010101400] = 0000e5ff
	stwa	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000ddb3
!	%l3 = 00000000000000ff, imm = 0000000000000e04, %l0 = 5e2afd082f140600
	or	%l3,0xe04,%l0		! %l0 = 0000000000000eff
!	%l6 = 000000000000172b, Mem[0000000010181408] = 4cc17a8d
	stba	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 2bc17a8d
!	%f29 = 17eefe2d, Mem[0000000010081400] = 00ff006b
	sta	%f29,[%i2+%g0]0x80	! Mem[0000000010081400] = 17eefe2d
!	Mem[0000000010101408] = 0000e3ff, %l6 = 000000000000172b
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 8b580085, %l4 = 000000000000ddb3
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffff8b58

p0_label_45:
!	Mem[00000000300c1410] = ffbf93df, %f15 = d71c70a7
	lda	[%i3+%o5]0x81,%f15	! %f15 = ffbf93df
!	Mem[0000000030141410] = ff0d48ec7abaad19, %l7 = 00000000000000f8
	ldxa	[%i5+%o5]0x81,%l7	! %l7 = ff0d48ec7abaad19
!	Mem[0000000030101410] = 000000ff, %l6 = 00000000000000ff
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = 000000ff, %l5 = 000000009821f035
	lduwa	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141408] = d17f8721 17eefe2d, %l2 = 000000a4, %l3 = 000000ff
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 00000000d17f8721 0000000017eefe2d
!	Mem[0000000010181410] = ffffffffffff88b3, %f12 = a775ccae a404cce3
	ldda	[%i6+%o5]0x88,%f12	! %f12 = ffffffff ffff88b3
!	Mem[0000000030141408] = 21877fd1, %l7 = ff0d48ec7abaad19
	lduha	[%i5+%o4]0x89,%l7	! %l7 = 0000000000007fd1
!	Mem[00000000100c1424] = 16ec5691, %l5 = 00000000000000ff
	ldsh	[%i3+0x026],%l5		! %l5 = 0000000000005691
!	Mem[0000000010181408] = f79dc35b8d7ac12b, %f14 = ea47eed9 ffbf93df
	ldda	[%i6+%o4]0x88,%f14	! %f14 = f79dc35b 8d7ac12b
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 3ac8ceaf, %l4 = ffffffffffff8b58
	ldstuba	[%i2+%o5]0x81,%l4	! %l4 = 0000003a000000ff

p0_label_46:
!	%l2 = 00000000d17f8721, Mem[0000000010081410] = 000000ff
	stha	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 00008721
!	%f20 = 19adba7a, Mem[0000000030101400] = 000000b7
	sta	%f20,[%i4+%g0]0x89	! Mem[0000000030101400] = 19adba7a
!	%l6 = 00000000000000ff, %l4 = 000000000000003a, %l1 = 613e7d8ff5846645
	andn	%l6,%l4,%l1		! %l1 = 00000000000000c5
!	Mem[0000000030181410] = 8500588b, %l5 = 0000000000005691
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 000000008500588b
!	%f8  = 8500588b, Mem[0000000010001408] = 000000d1
	sta	%f8 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 8500588b
!	%f4  = 8dffffff, Mem[0000000030041408] = 5c000000
	sta	%f4 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 8dffffff
!	%l2 = d17f8721, %l3 = 17eefe2d, Mem[0000000010181400] = 4cc17a8d 00000000
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = d17f8721 17eefe2d
!	%l1 = 00000000000000c5, Mem[0000000010041410] = 8dffffff
	stwa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000c5
!	%l1 = 00000000000000c5, Mem[0000000030041400] = ffe30000
	stwa	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000c5
!	Starting 10 instruction Load Burst
!	%l4 = 000000000000003a, %l1 = 00000000000000c5, %l0 = 0000000000000eff
	sub	%l4,%l1,%l0		! %l0 = ffffffffffffff75

p0_label_47:
!	Mem[0000000010101428] = a07505adffffffaf, %l2 = 00000000d17f8721
	ldxa	[%i4+0x028]%asi,%l2	! %l2 = a07505adffffffaf
!	Mem[0000000010041418] = 0000f8420000e3ff, %l6 = 00000000000000ff
	ldxa	[%i1+0x018]%asi,%l6	! %l6 = 0000f8420000e3ff
!	Mem[0000000010101408] = ffe30000, %l5 = 000000008500588b
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = ffffffffffffffe3
!	Mem[0000000030181410] = 91560000, %l2 = a07505adffffffaf
	ldswa	[%i6+%o5]0x89,%l2	! %l2 = ffffffff91560000
!	Mem[00000000218000c0] = ee75de47, %l0 = ffffffffffffff75
	lduh	[%o3+0x0c0],%l0		! %l0 = 000000000000ee75
!	Mem[0000000030141410] = ff0d48ec, %l4 = 000000000000003a
	lduha	[%i5+%o5]0x81,%l4	! %l4 = 000000000000ff0d
!	Mem[0000000010181438] = ffffffffffffffff, %l2 = ffffffff91560000
	ldxa	[%i6+0x038]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141410] = 00001aff, %l0 = 000000000000ee75
	ldsba	[%i5+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[000000001000141c] = f4ff1c07, %l3 = 0000000017eefe2d
	ldsb	[%i0+0x01e],%l3		! %l3 = 000000000000001c
!	Starting 10 instruction Store Burst
!	%f3  = 8d7ac14c, Mem[0000000010181408] = 2bc17a8d
	sta	%f3 ,[%i6+0x008]%asi	! Mem[0000000010181408] = 8d7ac14c

p0_label_48:
!	Mem[0000000021800041] = 033534f9, %l0 = ffffffffffffffff
	ldstub	[%o3+0x041],%l0		! %l0 = 00000035000000ff
!	Mem[0000000030141408] = d17f8721, %l7 = 0000000000007fd1
	swapa	[%i5+%o4]0x81,%l7	! %l7 = 00000000d17f8721
!	%l7 = 00000000d17f8721, Mem[0000000010101400] = b3dd00009adda571, %asi = 80
	stxa	%l7,[%i4+0x000]%asi	! Mem[0000000010101400] = 00000000d17f8721
!	%l2 = ffffffffffffffff, Mem[0000000030001410] = 42000000
	stha	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 4200ffff
!	Mem[00000000211c0000] = 1aff7001, %l3 = 000000000000001c
	ldstub	[%o2+%g0],%l3		! %l3 = 0000001a000000ff
!	%l5 = ffffffffffffffe3, Mem[0000000020800000] = e5ff8ed8
	sth	%l5,[%o1+%g0]		! Mem[0000000020800000] = ffe38ed8
!	Mem[00000000100c1438] = eb2ccfd0, %l1 = 00000000000000c5
	swap	[%i3+0x038],%l1		! %l1 = 00000000eb2ccfd0
!	Mem[0000000010141410] = 00001aff, %l7 = 00000000d17f8721
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	%f26 = 8dffffff d0cf00ff, %l7 = 00000000000000ff
!	Mem[0000000030141430] = 44b30f0e73352ded
	add	%i5,0x030,%g1
	stda	%f26,[%g1+%l7]ASI_PST8_S ! Mem[0000000030141430] = 8dffffffd0cf00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff1a0000, %l1 = 00000000eb2ccfd0
	lduwa	[%i0+%o4]0x81,%l1	! %l1 = 00000000ff1a0000

p0_label_49:
!	Mem[0000000010141408] = 4cc17a8d, %l6 = 0000f8420000e3ff
	lduwa	[%i5+%o4]0x80,%l6	! %l6 = 000000004cc17a8d
!	Mem[000000001014142c] = 1075add8, %l3 = 000000000000001a
	ldsh	[%i5+0x02e],%l3		! %l3 = ffffffffffffadd8
!	Mem[0000000010141408] = 4cc17a8d, %l3 = ffffffffffffadd8
	lduha	[%i5+%o4]0x80,%l3	! %l3 = 0000000000004cc1
!	Mem[000000001010142c] = ffffffaf, %f4  = 8dffffff
	lda	[%i4+0x02c]%asi,%f4 	! %f4 = ffffffaf
!	Mem[0000000010101400] = 00000000d17f8721, %f16 = b388ffff ff0d48ec
	ldda	[%i4+0x000]%asi,%f16	! %f16 = 00000000 d17f8721
!	Mem[0000000010181408] = 4cc17a8d, %l0 = 0000000000000035
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = 000000004cc17a8d
!	Mem[0000000010101408] = ffe30000, %l2 = ffffffffffffffff
	ldsha	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffffffe3
!	Mem[0000000030081400] = ff410000, %f2  = 22c01df2
	lda	[%i2+%g0]0x81,%f2 	! %f2 = ff410000
!	Mem[0000000030141410] = ec480dff, %l1 = 00000000ff1a0000
	ldswa	[%i5+%o5]0x89,%l1	! %l1 = ffffffffec480dff
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000ff0d, Mem[00000000300c1408] = 00000000
	stha	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff0d0000

p0_label_50:
!	%l6 = 4cc17a8d, %l7 = 000000ff, Mem[0000000010041418] = 0000f842 0000e3ff
	std	%l6,[%i1+0x018]		! Mem[0000000010041418] = 4cc17a8d 000000ff
!	%f14 = f79dc35b, Mem[0000000030001408] = ff1a0000
	sta	%f14,[%i0+%o4]0x81	! Mem[0000000030001408] = f79dc35b
!	Mem[0000000010041415] = d632e47b, %l1 = ffffffffec480dff
	ldstuba	[%i1+0x015]%asi,%l1	! %l1 = 00000032000000ff
!	Mem[000000001018143c] = ffffffff, %l1 = 0000000000000032
	swap	[%i6+0x03c],%l1		! %l1 = 00000000ffffffff
!	%f4  = ffffffaf, %f11 = 380ea27e
	fsqrts	%f4 ,%f11		! %f11 = ffffffaf
!	Mem[00000000300c1410] = ffbf93df, %l3 = 0000000000004cc1
	ldstuba	[%i3+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	%l4 = 0000ff0d, %l5 = ffffffe3, Mem[00000000100c1438] = 000000c5 38c7f9d1
	std	%l4,[%i3+0x038]		! Mem[00000000100c1438] = 0000ff0d ffffffe3
!	%l0 = 4cc17a8d, %l1 = ffffffff, Mem[00000000100c1408] = fa000000 6329e949
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 4cc17a8d ffffffff
!	Mem[0000000010141408] = 4cc17a8d, %l3 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 0000004c000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffc8ceaf, %l5 = ffffffffffffffe3
	ldsha	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffffc8

p0_label_51:
!	Mem[0000000030141400] = 0000005c, %f8  = 8500588b
	lda	[%i5+%g0]0x89,%f8 	! %f8 = 0000005c
!	%l4 = 0000ff0d, %l5 = ffffffc8, Mem[0000000030141400] = 5c000000 0000e3ff
	stda	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000ff0d ffffffc8
!	Mem[0000000010041434] = a404cce3, %f2  = ff410000
	lda	[%i1+0x034]%asi,%f2 	! %f2 = a404cce3
!	Mem[0000000010001400] = ff0b95bc, %l5 = ffffffffffffffc8
	lduha	[%i0+%g0]0x80,%l5	! %l5 = 000000000000ff0b
!	Mem[0000000030181410] = 91560000, %l7 = 00000000000000ff
	lduba	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181434] = c5bab51a, %l0 = 000000004cc17a8d
	lduwa	[%i6+0x034]%asi,%l0	! %l0 = 00000000c5bab51a
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010181400] = d17f8721 17eefe2d 8d7ac14c 5bc39df7
!	Mem[0000000010181410] = b388ffff ffffffff c1ad313a 3a000000
!	Mem[0000000010181420] = 9156ec16 6b0274a1 d17f8721 30e28b99
!	Mem[0000000010181430] = 4696ff70 c5bab51a ffffffff 00000032
	ldda	[%i6]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010181400
!	Mem[0000000030181408] = 00000000000000ff, %l3 = 000000000000004c
	ldxa	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%f26 = 8dffffff, %f30 = ffe30000, %f31 = 0000005c
	fsubs	%f26,%f30,%f31		! %f31 = ffe30000
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffe3, %l3 = 00000000000000ff, %l5 = 000000000000ff0b
	andn	%l2,%l3,%l5		! %l5 = ffffffffffffff00

p0_label_52:
!	Mem[00000000300c1400] = 3774886a, %l4 = 000000000000ff0d
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 0000006a000000ff
!	%f20 = 19adba7a ec480d19, Mem[0000000010101410] = 998b90fe ca3e5f61
	stda	%f20,[%i4+%o5]0x80	! Mem[0000000010101410] = 19adba7a ec480d19
	membar	#Sync			! Added by membar checker (10)
!	%f16 = 00000000 d17f8721, Mem[0000000010181410] = b388ffff ffffffff
	stda	%f16,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 d17f8721
!	Mem[0000000010141408] = ffc17a8d, %l1 = 00000000ffffffff
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 00000000ffc17a8d
!	%l0 = 00000000c5bab51a, Mem[00000000300c1408] = ff0d0000b7969efe
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000c5bab51a
!	%l0 = 00000000c5bab51a, Mem[0000000010101424] = 615241bc, %asi = 80
	stwa	%l0,[%i4+0x024]%asi	! Mem[0000000010101424] = c5bab51a
!	%l0 = 00000000c5bab51a, Mem[0000000010081400] = 2dfeee17
	stha	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 2dfeb51a
!	Mem[0000000010041410] = 000000c5, %l1 = 00000000ffc17a8d
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000c5
!	Mem[0000000030081400] = ff410000, %l1 = 00000000000000c5
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = c5000000, %l2 = ffffffffffffffe3
	lduha	[%i1+%g0]0x81,%l2	! %l2 = 000000000000c500

p0_label_53:
!	Mem[0000000010141400] = 9cbb80c56dc321e3, %f16 = 00000000 d17f8721
	ldda	[%i5+%g0]0x80,%f16	! %f16 = 9cbb80c5 6dc321e3
!	Mem[0000000030001408] = 00000000 5bc39df7, %l0 = c5bab51a, %l1 = 000000ff
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 000000005bc39df7 0000000000000000
!	Mem[0000000010081400] = 1ab5fe2d, %f29 = 17eefe2d
	lda	[%i2+%g0]0x80,%f29	! %f29 = 1ab5fe2d
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 000000005bc39df7
	setx	0x94b6b7606e3bdf1f,%g7,%l0 ! %l0 = 94b6b7606e3bdf1f
!	%l1 = 0000000000000000
	setx	0xc2e2bcc011734ed9,%g7,%l1 ! %l1 = c2e2bcc011734ed9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 94b6b7606e3bdf1f
	setx	0x6c5e6377be7c1598,%g7,%l0 ! %l0 = 6c5e6377be7c1598
!	%l1 = c2e2bcc011734ed9
	setx	0xb4c6534818b95f3f,%g7,%l1 ! %l1 = b4c6534818b95f3f
!	Mem[0000000010141410] = ff1a0000, %l2 = 000000000000c500
	lduwa	[%i5+%o5]0x80,%l2	! %l2 = 00000000ff1a0000
!	Mem[00000000300c1400] = ff887437, %l7 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041410] = 8d59f701, %l7 = ffffffffffffffff
	lduwa	[%i1+%o5]0x81,%l7	! %l7 = 000000008d59f701
!	Mem[0000000010081400] = 1ab5fe2d, %f10 = 998be230
	lda	[%i2+%g0]0x80,%f10	! %f10 = 1ab5fe2d
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000030081400] = ff410000 b1538fa4 8dffffff ff1a0000
!	Mem[0000000030081410] = ffc8ceaf dd75568b d7596038 3d7b2d8e
!	Mem[0000000030081420] = aaf25d9a 0a1de4e8 58cc5479 b70a210d
!	Mem[0000000030081430] = 21710f62 6e17dfe9 277f04a6 498d9022
	ldda	[%i2]ASI_BLK_SL,%f0	! Block Load from 0000000030081400
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 4cc17a8d, %l0 = 6c5e6377be7c1598
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 0000008d000000ff

p0_label_54:
!	%l4 = 000000000000006a, Mem[0000000010081408] = d0cf00ff
	stba	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = d0cf006a
!	%l4 = 0000006a, %l5 = ffffff00, Mem[0000000010001408] = 8500588b b7ffffff
	stda	%l4,[%i0+0x008]%asi	! Mem[0000000010001408] = 0000006a ffffff00
!	Mem[0000000010041410] = ffc17a8d, %l4 = 000000000000006a
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ffc17a8d
!	Mem[0000000030041410] = 01f7598d, %l6 = 000000004cc17a8d
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = ffffffffffffff8d
!	%l3 = 00000000000000ff, Mem[0000000010101410] = 190d48ec7abaad19
	stxa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000000000ff
!	%f16 = 9cbb80c5 6dc321e3, Mem[0000000010001400] = bc950bff ae494aae
	stda	%f16,[%i0+%g0]0x88	! Mem[0000000010001400] = 9cbb80c5 6dc321e3
!	%l2 = 00000000ff1a0000, Mem[0000000030181400] = e50d75d87610ddb3
	stxa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000ff1a0000
!	%f0  = a48f53b1 000041ff 00001aff ffffff8d
!	%f4  = 8b5675dd afcec8ff 8e2d7b3d 386059d7
!	%f8  = e8e41d0a 9a5df2aa 0d210ab7 7954cc58
!	%f12 = e9df176e 620f7121 22908d49 a6047f27
	stda	%f0,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
	membar	#Sync			! Added by membar checker (12)
!	%f20 = 19adba7a, Mem[0000000030081410] = ffc8ceaf
	sta	%f20,[%i2+%o5]0x81	! Mem[0000000030081410] = 19adba7a
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 2dfeb51a, %f4  = 8b5675dd
	lda	[%i2+%g0]0x88,%f4 	! %f4 = 2dfeb51a

p0_label_55:
!	Mem[000000001004141c] = 000000ff, %l0 = 000000000000008d
	lduba	[%i1+0x01e]%asi,%l0	! %l0 = 0000000000000000
!	Mem[000000001018141c] = 3a000000, %l4 = 00000000ffc17a8d
	ldswa	[%i6+0x01c]%asi,%l4	! %l4 = 000000003a000000
!	Mem[00000000100c1400] = ff000000, %l1 = b4c6534818b95f3f
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010041400] = 7610ddb38500588b, %l1 = ffffffffff000000
	ldxa	[%i1+%g0]0x88,%l1	! %l1 = 7610ddb38500588b
!	Mem[0000000010081400] = 1ab5fe2d, %l5 = ffffffffffffff00
	lduwa	[%i2+%g0]0x80,%l5	! %l5 = 000000001ab5fe2d
!	Mem[0000000010101408] = ffffff8d, %l7 = 000000008d59f701
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 00000000ffffff8d
!	Mem[00000000100c1408] = ff7ac14c, %l4 = 000000003a000000
	ldsba	[%i3+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1400] = ff000000, %l2 = 00000000ff1a0000
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141410] = 00001aff, %f11 = 7954cc58
	lda	[%i5+%o5]0x88,%f11	! %f11 = 00001aff
!	Starting 10 instruction Store Burst
!	%f18 = 0000f842 00000000, Mem[0000000030081408] = 8dffffff ff1a0000
	stda	%f18,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000f842 00000000

p0_label_56:
!	Mem[00000000100c1408] = ff7ac14cffffffff, %l7 = 00000000ffffff8d, %l5 = 000000001ab5fe2d
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = ff7ac14cffffffff
!	%l3 = 00000000000000ff, Mem[0000000030101410] = 000000ff
	stwa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff
!	%f28 = d17f8721 1ab5fe2d, Mem[0000000030001408] = f79dc35b 00000000
	stda	%f28,[%i0+%o4]0x81	! Mem[0000000030001408] = d17f8721 1ab5fe2d
!	%l7 = 00000000ffffff8d, Mem[00000000201c0000] = 4542826e, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = ff8d826e
!	Mem[00000000100c1400] = 000000ff, %l2 = ffffffffffffffff
	swapa	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l4 = ffffffffffffffff, Mem[0000000010041410] = 0000006a
	stha	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = ffff006a
!	%l5 = ff7ac14cffffffff, Mem[0000000030081400] = ff410000b1538fa4
	stxa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = ff7ac14cffffffff
!	%l0 = 0000000000000000, Mem[000000001000142c] = 4f1a260b, %asi = 80
	stwa	%l0,[%i0+0x02c]%asi	! Mem[000000001000142c] = 00000000
!	%l1 = 7610ddb38500588b, Mem[00000000300c1400] = 377488ff
	stha	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 3774588b
!	Starting 10 instruction Load Burst
!	Mem[00000000100c142c] = ff000000, %l1 = 7610ddb38500588b
	lduw	[%i3+0x02c],%l1		! %l1 = 00000000ff000000

p0_label_57:
!	Mem[0000000010001430] = f5d1c3804cb9a60d, %l4 = ffffffffffffffff
	ldx	[%i0+0x030],%l4		! %l4 = f5d1c3804cb9a60d
!	Mem[0000000010181408] = 4cc17a8d, %l2 = 00000000000000ff
	ldsba	[%i6+%o4]0x88,%l2	! %l2 = ffffffffffffff8d
!	Mem[0000000010041408] = c14c0000, %l6 = ffffffffffffff8d
	ldsba	[%i1+%o4]0x80,%l6	! %l6 = ffffffffffffffc1
!	Mem[0000000030081410] = 19adba7a, %l0 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l0	! %l0 = 0000000019adba7a
!	Mem[0000000030101400] = 7abaad192e1171cd, %f2  = 00001aff ffffff8d
	ldda	[%i4+%g0]0x81,%f2 	! %f2  = 7abaad19 2e1171cd
!	Mem[00000000201c0000] = ff8d826e, %l1 = 00000000ff000000
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 000000000000ff8d
!	Mem[0000000010001408] = 0000006a, %l7 = 00000000ffffff8d
	lduwa	[%i0+%o4]0x80,%l7	! %l7 = 000000000000006a
!	Mem[0000000010141400] = 9cbb80c56dc321e3, %f28 = d17f8721 1ab5fe2d
	ldda	[%i5+%g0]0x80,%f28	! %f28 = 9cbb80c5 6dc321e3
!	Mem[0000000030181400] = ff1a0000, %f10 = 0d210ab7
	lda	[%i6+%g0]0x89,%f10	! %f10 = ff1a0000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ffffffff, %l3 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ffffffff

p0_label_58:
!	Mem[00000000201c0000] = ff8d826e, %l2 = ffffffffffffff8d
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%f14 = 22908d49, Mem[0000000030041400] = 000000c5
	sta	%f14,[%i1+%g0]0x89	! Mem[0000000030041400] = 22908d49
!	%l5 = ff7ac14cffffffff, Mem[0000000030141400] = 0dff0000
	stwa	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffff
!	Mem[0000000010081408] = d0cf006a, %l1 = 000000000000ff8d
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 00000000d0cf006a
!	%l5 = ff7ac14cffffffff, Mem[000000001000140d] = ffffff00
	stb	%l5,[%i0+0x00d]		! Mem[000000001000140c] = ffffff00
!	Mem[0000000010001418] = 8cd29078, %l6 = ffffffffffffffc1
	swap	[%i0+0x018],%l6		! %l6 = 000000008cd29078
!	Mem[0000000010181410] = 00000000, %l0 = 0000000019adba7a
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%f0  = a48f53b1 000041ff, %l7 = 000000000000006a
!	Mem[0000000030041410] = 8d59f70192f6c887
	add	%i1,0x010,%g1
	stda	%f0,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030041410] = 8d41f70092538f87
!	%l4 = f5d1c3804cb9a60d, Mem[0000000030141408] = 00007fd117eefe2d
	stxa	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = f5d1c3804cb9a60d
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 7abaad19, %l3 = 00000000ffffffff
	lduba	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000019

p0_label_59:
!	Mem[0000000010001408] = 6a000000, %l2 = 00000000000000ff
	lduwa	[%i0+%o4]0x88,%l2	! %l2 = 000000006a000000
!	Mem[0000000010141408] = ffffffff, %l3 = 0000000000000019
	ldsba	[%i5+0x00a]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081408] = 52f7846f 0000ff8d, %l4 = 4cb9a60d, %l5 = ffffffff
	ldda	[%i2+%o4]0x88,%l4	! %l4 = 000000000000ff8d 0000000052f7846f
!	Mem[00000000100c1408] = ff7ac14c, %l6 = 000000008cd29078
	ldsba	[%i3+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1410] = 0000005d, %l0 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l0	! %l0 = 000000000000005d
!	Mem[0000000030001400] = ffffc1ff, %l0 = 000000000000005d
	ldsba	[%i0+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	%f18 = 0000f842, %f7  = 386059d7, %f1  = 000041ff
	fdivs	%f18,%f7 ,%f1 		! %l0 = 0000000000000021, Unfinished, %fsr = 1100000000
!	Mem[0000000020800040] = 00eccbdb, %l6 = ffffffffffffffff
	ldsh	[%o1+0x040],%l6		! %l6 = 00000000000000ec
!	Mem[0000000030001410] = 8500588b4200ffff, %l5 = 0000000052f7846f
	ldxa	[%i0+%o5]0x89,%l5	! %l5 = 8500588b4200ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = ffffc1ff, %l5 = 8500588b4200ffff
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 00000000ffffc1ff

p0_label_60:
!	%f0  = a48f53b1 000041ff 7abaad19 2e1171cd
!	%f4  = 2dfeb51a afcec8ff 8e2d7b3d 386059d7
!	%f8  = e8e41d0a 9a5df2aa ff1a0000 00001aff
!	%f12 = e9df176e 620f7121 22908d49 a6047f27
	stda	%f0,[%i6]ASI_BLK_P	! Block Store to 0000000010181400
!	%l4 = 0000ff8d, %l5 = ffffc1ff, Mem[0000000010001400] = 6dc321e3 9cbb80c5
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000ff8d ffffc1ff
!	Mem[0000000010101438] = 277f04a6, %l7 = 0000006a, %l6 = 000000ec
	add	%i4,0x38,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 00000000277f04a6
!	Mem[0000000010081408] = 8dff0000, %l2 = 000000006a000000
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 0000008d000000ff
!	Mem[0000000030141408] = 80c3d1f5, %l2 = 000000000000008d
	ldstuba	[%i5+%o4]0x89,%l2	! %l2 = 000000f5000000ff
!	Mem[0000000010101428] = 58cc5479b70a210d, %l6 = 00000000277f04a6, %l7 = 000000000000006a
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = 58cc5479b70a210d
!	%l4 = 0000ff8d, %l5 = ffffc1ff, Mem[0000000030001410] = 4200ffff 8500588b
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000ff8d ffffc1ff
!	Mem[00000000100c1414] = 2f627a95, %l0 = 0000000000000021
	ldstub	[%i3+0x014],%l0		! %l0 = 0000002f000000ff
!	%f16 = 9cbb80c5 6dc321e3, %l6 = 00000000277f04a6
!	Mem[0000000010181410] = 2dfeb51aafcec8ff
	add	%i6,0x010,%g1
	stda	%f16,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010181410] = 2dfeb51ac580bb9c
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00001aff 00000000 ff000000 00000000
!	Mem[0000000030181410] = 00005691 42f8ffff f927f3d8 6025bc2d
!	Mem[0000000030181420] = b4e5a795 5a64ed3f cef18dd7 28a88367
!	Mem[0000000030181430] = 9ae99a45 0ff7373e 39307cef cc174fb6
	ldda	[%i6]ASI_BLK_S,%f0	! Block Load from 0000000030181400

p0_label_61:
!	%f29 = 6dc321e3, %f27 = d0cf00ff, %f22 = ec1a4a89
	fmuls	%f29,%f27,%f22		! %f22 = ff1dc929
!	Mem[0000000030081400] = ff7ac14c, %l2 = 00000000000000f5
	ldsha	[%i2+%g0]0x81,%l2	! %l2 = ffffffffffffff7a
!	Mem[00000000100c1408] = 4cc17aff, %l3 = ffffffffffffffff
	lduha	[%i3+%o4]0x88,%l3	! %l3 = 0000000000007aff
	membar	#Sync			! Added by membar checker (13)
!	Mem[000000001018140c] = 2e1171cd, %l4 = 000000000000ff8d
	ldub	[%i6+0x00f],%l4		! %l4 = 00000000000000cd
!	Mem[0000000010041410] = ffff006a, %l4 = 00000000000000cd
	ldswa	[%i1+%o5]0x80,%l4	! %l4 = ffffffffffff006a
!	Mem[00000000211c0000] = ffff7001, %l1 = 00000000d0cf006a
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010001410] = ffff4a89d4b9b028, %f14 = 39307cef cc174fb6
	ldda	[%i0+%o5]0x80,%f14	! %f14 = ffff4a89 d4b9b028
!	Mem[0000000030141408] = ffd1c3804cb9a60d, %l5 = 00000000ffffc1ff
	ldxa	[%i5+%o4]0x81,%l5	! %l5 = ffd1c3804cb9a60d
!	Mem[0000000030101400] = 7abaad19 2e1171cd 00000000 00000000
!	Mem[0000000030101410] = 000000ff 000000ff 2fbf6398 dce6dce0
!	Mem[0000000030101420] = 190d48ec 7abaad19 2c27cb51 98b2e1d6
!	Mem[0000000030101430] = e59e9a19 b9694dd2 8500588b 2e1171cd
	ldda	[%i4]ASI_BLK_AIUS,%f16	! Block Load from 0000000030101400
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00000000, %l5 = ffd1c3804cb9a60d
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_62:
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 000000000000002f
	setx	0x308bd07f824005e0,%g7,%l0 ! %l0 = 308bd07f824005e0
!	%l1 = ffffffffffffffff
	setx	0x9d5652e7d1847e97,%g7,%l1 ! %l1 = 9d5652e7d1847e97
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 308bd07f824005e0
	setx	0xc1e6c310390de95f,%g7,%l0 ! %l0 = c1e6c310390de95f
!	%l1 = 9d5652e7d1847e97
	setx	0xa688cd0fddb9d2df,%g7,%l1 ! %l1 = a688cd0fddb9d2df
!	Mem[0000000030001410] = 0000ff8d, %l4 = ffffffffffff006a
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 000000000000ff8d
!	%l1 = a688cd0fddb9d2df, Mem[0000000010181400] = b1538fa4
	stha	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = b153d2df
!	Mem[0000000030101410] = 000000ff, %l6 = 00000000277f04a6
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l2 = ffffffffffffff7a, Mem[0000000010001410] = ffff4a89d4b9b028
	stxa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffffffffff7a
!	%f8  = b4e5a795 5a64ed3f, Mem[0000000010001410] = ffffffff ffffff7a
	stda	%f8 ,[%i0+%o5]0x80	! Mem[0000000010001410] = b4e5a795 5a64ed3f
!	%l4 = 0000ff8d, %l5 = 00000000, Mem[00000000100c1418] = ffffc1ff 3a31ffc1
	stda	%l4,[%i3+0x018]%asi	! Mem[00000000100c1418] = 0000ff8d 00000000
!	%f4  = 00005691 42f8ffff, Mem[0000000030181410] = 91560000 fffff842
	stda	%f4 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 00005691 42f8ffff
!	%l0 = c1e6c310390de95f, Mem[00000000300c1400] = 3774588b
	stba	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 3774585f
!	Starting 10 instruction Load Burst
!	Mem[000000001000141c] = f4ff1c07, %l2 = ffffffffffffff7a
	lduw	[%i0+0x01c],%l2		! %l2 = 00000000f4ff1c07

p0_label_63:
!	Mem[00000000300c1400] = 5f587437, %l1 = a688cd0fddb9d2df
	lduba	[%i3+%g0]0x81,%l1	! %l1 = 000000000000005f
!	Mem[0000000010141410] = afcec83a 00001aff, %l6 = 000000ff, %l7 = b70a210d
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 0000000000001aff 00000000afcec83a
!	Mem[000000001018141c] = 386059d7, %l7 = 00000000afcec83a
	lduha	[%i6+0x01c]%asi,%l7	! %l7 = 0000000000003860
!	Mem[0000000010101410] = ffc8ceaf, %f11 = 28a88367
	lda	[%i4+%o5]0x80,%f11	! %f11 = ffc8ceaf
!	Mem[0000000010001400] = 8dff0000, %l2 = 00000000f4ff1c07
	ldsba	[%i0+%g0]0x80,%l2	! %l2 = ffffffffffffff8d
!	Mem[0000000030141410] = 19adba7aec480dff, %f14 = ffff4a89 d4b9b028
	ldda	[%i5+%o5]0x89,%f14	! %f14 = 19adba7a ec480dff
!	Mem[0000000010081410] = 21870000, %l1 = 000000000000005f
	ldsba	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000021
!	Mem[000000001018141c] = 386059d7, %f14 = 19adba7a
	ld	[%i6+0x01c],%f14	! %f14 = 386059d7
!	%l6 = 0000000000001aff, %l5 = 0000000000000000, %l1 = 0000000000000021
	xnor	%l6,%l5,%l1		! %l1 = ffffffffffffe500
!	Starting 10 instruction Store Burst
!	%l4 = 0000ff8d, %l5 = 00000000, Mem[0000000010081400] = 1ab5fe2d 00000000
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000ff8d 00000000

p0_label_64:
!	%l4 = 000000000000ff8d, Mem[0000000030041408] = ffffff8d
	stba	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffff8d
!	%f8  = b4e5a795 5a64ed3f, %l3 = 0000000000007aff
!	Mem[0000000010081428] = ed5c96dd39066bba
	add	%i2,0x028,%g1
	stda	%f8,[%g1+%l3]ASI_PST16_P ! Mem[0000000010081428] = b4e5a7955a64ed3f
!	%f0  = 00001aff 00000000, Mem[0000000030081408] = 0000f842 00000000
	stda	%f0 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 00001aff 00000000
!	Mem[0000000030181400] = ff1a0000, %l3 = 0000000000007aff
	swapa	[%i6+%g0]0x89,%l3	! %l3 = 00000000ff1a0000
!	%l5 = 0000000000000000, Mem[00000000300c1410] = 9bf6daa7df93bfff
	stxa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	Mem[000000001010140c] = ff1a0000, %l2 = ffffffffffffff8d
	ldstub	[%i4+0x00c],%l2		! %l2 = 000000ff000000ff
!	%f30 = 8500588b 2e1171cd, %l3 = 00000000ff1a0000
!	Mem[0000000010081410] = 21870000ff000000
	add	%i2,0x010,%g1
	stda	%f30,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010081410] = 21870000ff000000
!	%f0  = 00001aff 00000000 ff000000 00000000
!	%f4  = 00005691 42f8ffff f927f3d8 6025bc2d
!	%f8  = b4e5a795 5a64ed3f cef18dd7 ffc8ceaf
!	%f12 = 9ae99a45 0ff7373e 386059d7 ec480dff
	stda	%f0,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%l1 = ffffffffffffe500, Mem[00000000100c1408] = ff7ac14cffffffff
	stxa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffffffffffe500
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000001aff, %l7 = 0000000000003860, %l7 = 0000000000003860
	addc	%l6,%l7,%l7		! %l7 = 000000000000535f

p0_label_65:
!	Mem[0000000030041410] = 00f7418d, %l2 = 00000000000000ff
	lduwa	[%i1+%o5]0x89,%l2	! %l2 = 0000000000f7418d
!	Mem[00000000211c0000] = ffff7001, %l5 = 0000000000000000
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[0000000030181400] = 00007aff, %l3 = 00000000ff1a0000
	ldsha	[%i6+%g0]0x89,%l3	! %l3 = 0000000000007aff
!	Mem[0000000010181400] = dfd253b1, %l4 = 000000000000ff8d
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 000000000000dfd2
!	Mem[0000000010101428] = 58cc5479b70a210d, %f28 = e59e9a19 b9694dd2
	ldda	[%i4+0x028]%asi,%f28	! %f28 = 58cc5479 b70a210d
!	%f19 = 00000000, %f26 = 2c27cb51, %f18 = 00000000 00000000
	fsmuld	%f19,%f26,%f18		! %f18 = 00000000 00000000
!	Mem[0000000020800000] = ffe38ed8, %l1 = ffffffffffffe500
	lduba	[%o1+0x001]%asi,%l1	! %l1 = 00000000000000e3
!	Mem[0000000010101410] = ffc8ceaf, %l6 = 0000000000001aff
	ldsha	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffffffc8
!	Mem[0000000030041408] = ffffff8d, %l4 = 000000000000dfd2
	lduwa	[%i1+%o4]0x89,%l4	! %l4 = 00000000ffffff8d
!	Starting 10 instruction Store Burst
!	%l4 = ffffff8d, %l5 = 0000ffff, Mem[0000000030041408] = 8dffffff 920c38e3
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffff8d 0000ffff

p0_label_66:
!	Mem[000000001014142c] = 1075add8, %l4 = 00000000ffffff8d, %asi = 80
	swapa	[%i5+0x02c]%asi,%l4	! %l4 = 000000001075add8
!	%f29 = b70a210d, %f22 = 2fbf6398, %f18 = 00000000
	fdivs	%f29,%f22,%f18		! %f18 = c6b8c294
!	Mem[0000000010101428] = 58cc5479b70a210d, %l6 = ffffffffffffffc8, %l2 = 0000000000f7418d
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = 58cc5479b70a210d
	membar	#Sync			! Added by membar checker (14)
!	%f24 = 190d48ec 7abaad19, Mem[0000000030101410] = a6047f27 ff000000
	stda	%f24,[%i4+%o5]0x89	! Mem[0000000030101410] = 190d48ec 7abaad19
!	%l6 = ffffffffffffffc8, Mem[0000000010001421] = 6c0d1d7e
	stb	%l6,[%i0+0x021]		! Mem[0000000010001420] = 6cc81d7e
!	Code Fragment 4
p0_fragment_6:
!	%l0 = c1e6c310390de95f
	setx	0xf8e7c847a62dfc40,%g7,%l0 ! %l0 = f8e7c847a62dfc40
!	%l1 = 00000000000000e3
	setx	0x1c6251700e3698d6,%g7,%l1 ! %l1 = 1c6251700e3698d6
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f8e7c847a62dfc40
	setx	0x88e5c557bbb5b66b,%g7,%l0 ! %l0 = 88e5c557bbb5b66b
!	%l1 = 1c6251700e3698d6
	setx	0x20511417b949291a,%g7,%l1 ! %l1 = 20511417b949291a
!	%l4 = 000000001075add8, %l0 = 88e5c557bbb5b66b, %l6 = ffffffffffffffc8
	sub	%l4,%l0,%l6		! %l6 = 771a3aa854bff76d
!	Mem[0000000010181408] = 7abaad19, %l0 = 88e5c557bbb5b66b
	lduwa	[%i6+0x008]%asi,%l0	! %l0 = 000000007abaad19
!	Mem[0000000010081410] = 00008721, %l3 = 0000000000007aff
	swapa	[%i2+%o5]0x88,%l3	! %l3 = 0000000000008721
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = fffff84291560000, %l1 = 20511417b949291a
	ldxa	[%i3+%o5]0x81,%l1	! %l1 = fffff84291560000

p0_label_67:
!	Mem[0000000030081400] = ff7ac14c, %l5 = 000000000000ffff
	ldsba	[%i2+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1400] = ff000000, %l1 = fffff84291560000
	lduha	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1410] = 42f8ffff, %l7 = 000000000000535f
	ldsba	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081404] = 00000000, %f21 = 000000ff
	ld	[%i2+0x004],%f21	! %f21 = 00000000
!	Mem[0000000010081428] = b4e5a795, %f1  = 00000000
	ld	[%i2+0x028],%f1 	! %f1 = b4e5a795
!	Mem[0000000030041410] = 8d41f70092538f87, %l6 = 771a3aa854bff76d
	ldxa	[%i1+%o5]0x81,%l6	! %l6 = 8d41f70092538f87
!	Mem[0000000010041400] = 8b580085, %l2 = 58cc5479b70a210d
	lduba	[%i1+%g0]0x80,%l2	! %l2 = 000000000000008b
!	Mem[0000000030001408] = d17f8721, %l7 = ffffffffffffffff
	lduha	[%i0+%o4]0x81,%l7	! %l7 = 000000000000d17f
!	Mem[00000000300c1408] = ff00000000000000, %f18 = c6b8c294 00000000
	ldda	[%i3+%o4]0x89,%f18	! %f18 = ff000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800140] = 05761f70, %l7 = 000000000000d17f
	ldstuba	[%o3+0x140]%asi,%l7	! %l7 = 00000005000000ff

p0_label_68:
!	%f6  = f927f3d8, Mem[00000000100c1410] = 5d000000
	sta	%f6 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = f927f3d8
!	%l5 = ffffffffffffffff, Mem[0000000010001408] = 6a000000
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff
!	%l2 = 000000000000008b, Mem[0000000030001400] = ffffffff4200ffff
	stxa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000000000008b
!	Mem[0000000010001408] = ffffffff, %l1 = 0000000000000000
	swap	[%i0+%o4],%l1		! %l1 = 00000000ffffffff
!	%l0 = 000000007abaad19, immed = fffff671, %y  = ec7d47d7
	smul	%l0,-0x98f,%l2		! %l2 = fffffb6ae1a36e09, %y = fffffb6a
!	%l1 = 00000000ffffffff, Mem[0000000030181400] = 00007aff
	stha	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000ffff
!	%l0 = 000000007abaad19, Mem[0000000010141400] = c580bb9c
	stwa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 7abaad19
!	Mem[000000001014143b] = f0e47560, %l6 = 8d41f70092538f87
	ldstub	[%i5+0x03b],%l6		! %l6 = 00000060000000ff
!	Mem[000000001008142c] = 5a64ed3f, %l0 = 000000007abaad19, %asi = 80
	swapa	[%i2+0x02c]%asi,%l0	! %l0 = 000000005a64ed3f
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = c14c0000, %l5 = ffffffffffffffff
	ldswa	[%i1+%o4]0x80,%l5	! %l5 = ffffffffc14c0000

p0_label_69:
!	Mem[00000000300c1410] = 42f8ffff, %l1 = 00000000ffffffff
	ldsha	[%i3+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081410] = 00007aff, %l7 = 0000000000000005
	ldsha	[%i2+%o5]0x88,%l7	! %l7 = 0000000000007aff
!	Mem[00000000300c1410] = fffff842, %l1 = ffffffffffffffff
	lduba	[%i3+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141410] = afcec83a00001aff, %l4 = 000000001075add8
	ldxa	[%i5+%o5]0x88,%l4	! %l4 = afcec83a00001aff
!	Mem[00000000300c1400] = 00001aff00000000, %l6 = 0000000000000060
	ldxa	[%i3+%g0]0x89,%l6	! %l6 = 00001aff00000000
!	Mem[0000000030141400] = c8ffffffffffffff, %l1 = 00000000000000ff
	ldxa	[%i5+%g0]0x89,%l1	! %l1 = c8ffffffffffffff
!	Mem[0000000030081408] = ff1a0000, %l4 = afcec83a00001aff
	lduha	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = ff7ac14c ffffffff 00001aff 00000000
!	Mem[0000000030081410] = 19adba7a dd75568b d7596038 3d7b2d8e
!	Mem[0000000030081420] = aaf25d9a 0a1de4e8 58cc5479 b70a210d
!	Mem[0000000030081430] = 21710f62 6e17dfe9 277f04a6 498d9022
	ldda	[%i2]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030081400
!	Mem[0000000030101408] = 00000000, %f17 = 2e1171cd
	lda	[%i4+%o4]0x81,%f17	! %f17 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ff8d826e, %l3 = 0000000000008721
	ldstub	[%o0+%g0],%l3		! %l3 = 000000ff000000ff

p0_label_70:
!	Mem[0000000030181408] = ff000000, %l3 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010181410] = 1ab5fe2d, %l1 = c8ffffffffffffff
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 000000001ab5fe2d
!	Mem[0000000010041408] = 00004cc1, %l5 = ffffffffc14c0000
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 0000000000004cc1
!	%l5 = 0000000000004cc1, Mem[0000000010181401] = dfd253b1
	stb	%l5,[%i6+0x001]		! Mem[0000000010181400] = dfc153b1
!	%f18 = ff000000 00000000, %l7 = 0000000000007aff
!	Mem[0000000030181408] = ff00000000000000
	add	%i6,0x008,%g1
	stda	%f18,[%g1+%l7]ASI_PST16_S ! Mem[0000000030181408] = ff00000000000000
!	%l5 = 0000000000004cc1, Mem[0000000030101400] = cd71112e19adba7a
	stxa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000004cc1
!	Mem[0000000010101400] = ff410000b1538fa4, %l2 = fffffb6ae1a36e09, %l7 = 0000000000007aff
	casxa	[%i4]0x80,%l2,%l7	! %l7 = ff410000b1538fa4
!	%f25 = 7abaad19, %f19 = 00000000, %f21 = 00000000
	fadds	%f25,%f19,%f21		! %f21 = 7abaad19
!	%l0 = 000000005a64ed3f, Mem[0000000010101410] = ffc8ceafdd75568b
	stxa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000005a64ed3f
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 42f8ffff, %l7 = ff410000b1538fa4
	lduha	[%i6+%o5]0x89,%l7	! %l7 = 000000000000ffff

p0_label_71:
!	Mem[0000000021800000] = c1fffa80, %l6 = 00001aff00000000
	ldub	[%o3+%g0],%l6		! %l6 = 00000000000000c1
!	Mem[0000000030181408] = 00000000000000ff, %f16 = 7abaad19 00000000
	ldda	[%i6+%o4]0x89,%f16	! %f16 = 00000000 000000ff
!	Mem[00000000100c1438] = 0000ff0d, %l4 = 0000000000000000
	ldsh	[%i3+0x03a],%l4		! %l4 = ffffffffffffff0d
!	Mem[0000000010001400] = 8dff0000, %l2 = fffffb6ae1a36e09
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 000000000000008d
!	Mem[0000000010101408] = ffffff8d, %l6 = 00000000000000c1
	ldswa	[%i4+%o4]0x88,%l6	! %l6 = ffffffffffffff8d
!	Mem[00000000201c0000] = ff8d826e, %l2 = 000000000000008d
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 000000000000ff8d
!	Mem[0000000030141400] = ffffffff, %l5 = 0000000000004cc1
	ldsha	[%i5+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041408] = c14c0000, %l1 = 000000001ab5fe2d
	lduha	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 000000000000008b, %f18 = ff000000 00000000
	ldda	[%i0+%g0]0x89,%f18	! %f18 = 00000000 0000008b
!	Starting 10 instruction Store Burst
!	%f18 = 00000000 0000008b, Mem[0000000030181408] = 000000ff 00000000
	stda	%f18,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 0000008b

p0_label_72:
!	Mem[00000000100c1438] = 0000ff0d, %l2 = 000000000000ff8d, %asi = 80
	swapa	[%i3+0x038]%asi,%l2	! %l2 = 000000000000ff0d
!	Mem[0000000010181428] = ff1a0000, %l3 = 00000000000000ff
	swap	[%i6+0x028],%l3		! %l3 = 00000000ff1a0000
!	%l5 = ffffffffffffffff, Mem[0000000030041400] = 498d9022
	stba	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = ff8d9022
!	%l7 = 000000000000ffff, imm = fffffffffffff13c, %l7 = 000000000000ffff
	add	%l7,-0xec4,%l7		! %l7 = 000000000000f13b
!	%l2 = 000000000000ff0d, Mem[00000000100c1400] = ff000000
	stha	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff00ff0d
!	%l0 = 000000005a64ed3f, Mem[0000000010001410] = b4e5a795
	stba	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 3fe5a795
!	Mem[0000000010181400] = dfc153b1, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 00000000dfc153b1
!	%l1 = 00000000dfc153b1, Mem[0000000030001408] = 21877fd1
	stha	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 218753b1
!	%f26 = 2c27cb51 98b2e1d6, Mem[0000000010101400] = ff410000 b1538fa4
	stda	%f26,[%i4+%g0]0x80	! Mem[0000000010101400] = 2c27cb51 98b2e1d6
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00004cc1, %l6 = ffffffffffffff8d
	ldswa	[%i1+%o4]0x80,%l6	! %l6 = 0000000000004cc1

p0_label_73:
!	Mem[0000000010141400] = 19adba7a, %l7 = 000000000000f13b
	lduwa	[%i5+%g0]0x80,%l7	! %l7 = 0000000019adba7a
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000030181400] = ffff0000 00000000 8b000000 00000000
!	Mem[0000000030181410] = fffff842 91560000 f927f3d8 6025bc2d
!	Mem[0000000030181420] = b4e5a795 5a64ed3f cef18dd7 28a88367
!	Mem[0000000030181430] = 9ae99a45 0ff7373e 39307cef cc174fb6
	ldda	[%i6]ASI_BLK_S,%f0	! Block Load from 0000000030181400
!	Mem[0000000030041408] = 8dffffff, %l5 = ffffffffffffffff
	ldsba	[%i1+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = 00000000, %l4 = ffffffffffffff0d
	lduba	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 19adba7a6dc321e3, %l1 = 00000000dfc153b1
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = 19adba7a6dc321e3
!	Mem[00000000100c1408] = ffffffff, %l2 = 000000000000ff0d
	ldswa	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041400] = 8500588b, %l0 = 000000005a64ed3f
	ldsha	[%i1+%g0]0x88,%l0	! %l0 = 000000000000588b
!	Mem[0000000030101410] = 19adba7a, %l1 = 19adba7a6dc321e3
	ldsha	[%i4+%o5]0x81,%l1	! %l1 = 00000000000019ad
!	%f20 = 000000ff, %f25 = 7abaad19, %f25 = 7abaad19
	fsubs	%f20,%f25,%f25		! %l0 = 00000000000058ad, Unfinished, %fsr = 1100000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030081408] = 00001aff
	stha	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00001aff

p0_label_74:
!	Mem[0000000010001400] = 0000ff8d, %l1 = 00000000000019ad
	ldsba	[%i0+%g0]0x88,%l1	! %l1 = ffffffffffffff8d
!	Mem[0000000010001418] = ffffffc1f4ff1c07, %l2 = ffffffffffffffff, %l1 = ffffffffffffff8d
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = ffffffc1f4ff1c07
!	Mem[0000000010081400] = 0000ff8d, %l0 = 00000000000058ad
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1424] = 16ec5691, %l6 = 0000000000004cc1
	ldstuba	[%i3+0x024]%asi,%l6	! %l6 = 00000016000000ff
!	%l3 = 00000000ff1a0000, Mem[0000000030141400] = c8ffffffffffffff
	stxa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000ff1a0000
!	%f24 = 190d48ec 7abaad19, Mem[0000000010001400] = 8dff0000 ffc1ffff
	stda	%f24,[%i0+%g0]0x80	! Mem[0000000010001400] = 190d48ec 7abaad19
!	Mem[0000000010141400] = 19adba7a, %l3 = 00000000ff1a0000
	swapa	[%i5+%g0]0x80,%l3	! %l3 = 0000000019adba7a
!	%f29 = b70a210d, Mem[0000000010041438] = ea47eed9
	st	%f29,[%i1+0x038]	! Mem[0000000010041438] = b70a210d
!	%f26 = 2c27cb51, Mem[0000000010181418] = 8e2d7b3d
	sta	%f26,[%i6+0x018]%asi	! Mem[0000000010181418] = 2c27cb51
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = ffff37e3, %l6 = 0000000000000016
	ldsb	[%o3+0x1c0],%l6		! %l6 = ffffffffffffffff

p0_label_75:
!	Mem[0000000030041410] = 00f7418d, %l1 = ffffffc1f4ff1c07
	ldsha	[%i1+%o5]0x89,%l1	! %l1 = 000000000000418d
!	Mem[0000000010141400] = e321c36d00001aff, %f24 = 190d48ec 7abaad19
	ldda	[%i5+%g0]0x88,%f24	! %f24 = e321c36d 00001aff
!	Mem[00000000100c141c] = 00000000, %l4 = 0000000000000000
	ldswa	[%i3+0x01c]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 00001aff, %l2 = ffffffffffffffff
	lduwa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000001aff
!	Mem[0000000030081400] = 4cc17aff, %l6 = ffffffffffffffff
	ldswa	[%i2+%g0]0x89,%l6	! %l6 = 000000004cc17aff
!	%l5 = ffffffffffffffff, %l5 = ffffffffffffffff, %y  = fffffb6a
	smul	%l5,%l5,%l2		! %l2 = 0000000000000001, %y = 00000000
!	Mem[0000000010001408] = 00000000, %l1 = 000000000000418d
	ldswa	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 8500588b, %f27 = 98b2e1d6
	lda	[%i1+%g0]0x88,%f27	! %f27 = 8500588b
!	Mem[0000000010081410] = 00007aff, %l7 = 0000000019adba7a
	lduha	[%i2+%o5]0x88,%l7	! %l7 = 0000000000007aff
!	Starting 10 instruction Store Burst
!	Mem[000000001008143a] = e159344c, %l4 = 0000000000000000
	ldstuba	[%i2+0x03a]%asi,%l4	! %l4 = 00000034000000ff

p0_label_76:
!	Mem[00000000300c1408] = 00000000, %l5 = ffffffffffffffff
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1420] = a174026bffec5691, %l5 = 0000000000000000, %l7 = 0000000000007aff
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = a174026bffec5691
!	Mem[0000000030001408] = 218753b1, %l4 = 0000000000000034
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 000000b1000000ff
!	%f18 = 00000000 0000008b, Mem[0000000010141400] = ff1a0000 6dc321e3
	stda	%f18,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 0000008b
!	Mem[0000000010001400] = 190d48ec, %l7 = a174026bffec5691
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000190d48ec
!	%f3  = 00000000, Mem[00000000100c1420] = a174026b
	sta	%f3 ,[%i3+0x020]%asi	! Mem[00000000100c1420] = 00000000
!	Mem[00000000300c1410] = fffff842, %l3 = 0000000019adba7a
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 00000000fffff842
!	%l6 = 000000004cc17aff, Mem[0000000010081400] = ff00ff8d
	stwa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 4cc17aff
!	Mem[0000000010041400] = 8b580085, %l6 = 000000004cc17aff
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 000000008b580085
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000, %f19 = 0000008b
	lda	[%i4+%o4]0x81,%f19	! %f19 = 00000000

p0_label_77:
!	Mem[0000000010181400] = 00000000, %l1 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 00001aff 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000 0000000000001aff
!	Mem[0000000010141400] = 00000000, %l1 = 0000000000001aff
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041430] = a775ccae, %f0  = ffff0000
	ld	[%i1+0x030],%f0 	! %f0 = a775ccae
!	Mem[00000000100c1428] = fb27e230, %l7 = 00000000190d48ec
	ldsha	[%i3+0x02a]%asi,%l7	! %l7 = ffffffffffffe230
!	Mem[0000000010041438] = b70a210d, %f2  = 8b000000
	lda	[%i1+0x038]%asi,%f2 	! %f2 = b70a210d
!	Mem[0000000010141400] = 8b000000 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000 000000008b000000
!	Mem[0000000030081408] = 00001aff, %l1 = 000000008b000000
	lduha	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = ff7a0000, %l7 = ffffffffffffe230
	lduha	[%i2+%o5]0x80,%l7	! %l7 = 000000000000ff7a
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000021800000] = c1fffa80, %asi = 80
	stha	%l1,[%o3+0x000]%asi	! Mem[0000000021800000] = 0000fa80

p0_label_78:
!	%l0 = 0000000000000000, imm = 000000000000070e, %l7 = 000000000000ff7a
	sub	%l0,0x70e,%l7		! %l7 = fffffffffffff8f2
!	%l1 = 0000000000000000, Mem[000000001004143c] = d71c70a7, %asi = 80
	stwa	%l1,[%i1+0x03c]%asi	! Mem[000000001004143c] = 00000000
!	Mem[0000000030141410] = ec480dff, %l2 = 0000000000000001
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 00000000ec480dff
!	%f16 = 00000000 000000ff, Mem[00000000300c1400] = 00000000 00001aff
	stda	%f16,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 000000ff
!	%f11 = 28a88367, Mem[0000000010041408] = 00004cc1
	sta	%f11,[%i1+%o4]0x80	! Mem[0000000010041408] = 28a88367
!	Mem[0000000030181410] = fffff842, %l7 = fffffffffffff8f2
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000010141400] = 00000000
	stha	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%l0 = 0000000000000000, Mem[00000000100c1408] = ffffffff
	stba	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffff00
!	%l0 = 0000000000000000, Mem[00000000100c1410] = d8f327f9
	stba	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = d8f32700
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 8d41f700, %l3 = 00000000fffff842
	lduba	[%i1+%o5]0x81,%l3	! %l3 = 000000000000008d

p0_label_79:
!	Mem[0000000010081420] = 00000000 000000a4, %l6 = 8b580085, %l7 = 000000ff
	ldda	[%i2+0x020]%asi,%l6	! %l6 = 0000000000000000 00000000000000a4
!	Mem[0000000030001408] = ff538721, %l5 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000218001c0] = ffff37e3, %l6 = 0000000000000000
	ldsha	[%o3+0x1c0]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101410] = 19adba7a ec480d19, %l6 = ffffffff, %l7 = 000000a4
	ldda	[%i4+%o5]0x81,%l6	! %l6 = 0000000019adba7a 00000000ec480d19
!	Mem[0000000010101400] = 51cb272c, %l6 = 0000000019adba7a
	ldsha	[%i4+%g0]0x88,%l6	! %l6 = 000000000000272c
!	Mem[0000000030081410] = 19adba7a, %l2 = 00000000ec480dff
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 0000000019adba7a
!	Mem[0000000030101408] = 00000000 00000000, %l4 = 000000b1, %l5 = 000000ff
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010141400] = 8b00000000000000, %f20 = 000000ff 7abaad19
	ldda	[%i5+%g0]0x88,%f20	! %f20 = 8b000000 00000000
!	Mem[0000000030141408] = 0da6b94c 80c3d1ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%o4]0x89,%l4	! %l4 = 0000000080c3d1ff 000000000da6b94c
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 000000ff, Mem[0000000010141410] = 00001aff afcec83a
	stda	%f16,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 000000ff

p0_label_80:
!	%f10 = cef18dd7 28a88367, Mem[00000000300c1408] = ffffffff 000000ff
	stda	%f10,[%i3+%o4]0x81	! Mem[00000000300c1408] = cef18dd7 28a88367
!	Mem[0000000010141408] = ffffffff, %l5 = 000000000da6b94c
	swapa	[%i5+%o4]0x88,%l5	! %l5 = 00000000ffffffff
!	%l2 = 0000000019adba7a, Mem[00000000300c1400] = 000000ff
	stba	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000007a
!	Mem[0000000010041410] = ffff006a, %l3 = 000000000000008d
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030081400] = ff7ac14c, %l6 = 000000000000272c
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff7ac14c
!	%l4 = 0000000080c3d1ff, Mem[0000000010181400] = 00000000
	stba	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	Mem[00000000100c1408] = ffffff00, %l2 = 0000000019adba7a
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 00000000ffffff00
!	%f14 = 39307cef, Mem[0000000010041400] = ff7ac14c
	sta	%f14,[%i1+%g0]0x88	! Mem[0000000010041400] = 39307cef
!	%f19 = 00000000, Mem[00000000100c1424] = ffec5691
	sta	%f19,[%i3+0x024]%asi	! Mem[00000000100c1424] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 00eccbdb, %l3 = 00000000000000ff
	ldsba	[%o1+0x040]%asi,%l3	! %l3 = 0000000000000000

p0_label_81:
!	Mem[0000000010141410] = ff000000, %f22 = 2fbf6398
	lda	[%i5+%o5]0x80,%f22	! %f22 = ff000000
!	%f24 = e321c36d, %f25 = 00001aff, %f0  = a775ccae 00000000
	fsmuld	%f24,%f25,%f0 		! %l0 = 0000000000000022, Unfinished, %fsr = 1100000000
!	Mem[0000000021800080] = a3f2944f, %l7 = 00000000ec480d19
	lduha	[%o3+0x080]%asi,%l7	! %l7 = 000000000000a3f2
!	Mem[0000000030181400] = ffff0000 00000000, %l4 = 80c3d1ff, %l5 = ffffffff
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 00000000ffff0000 0000000000000000
!	Mem[0000000030181410] = fffff842, %f26 = 2c27cb51
	lda	[%i6+%o5]0x81,%f26	! %f26 = fffff842
!	Mem[0000000030101410] = 19adba7a, %l2 = 00000000ffffff00
	lduwa	[%i4+%o5]0x81,%l2	! %l2 = 0000000019adba7a
!	Mem[0000000010141410] = 00000000000000ff, %l1 = 0000000000000000
	ldxa	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%f1  = 00000000, %f28 = 58cc5479, %f26 = fffff842
	fsubs	%f1 ,%f28,%f26		! %f26 = d8cc5479
!	Mem[0000000010041408] = 6783a828, %f28 = 58cc5479
	lda	[%i1+%o4]0x88,%f28	! %f28 = 6783a828
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010041400] = ef7c3039
	stwa	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000

p0_label_82:
!	%l3 = 0000000000000000, imm = 0000000000000511, %l5 = 0000000000000000
	add	%l3,0x511,%l5		! %l5 = 0000000000000511
!	%f0  = a775ccae 00000000 b70a210d 00000000
!	%f4  = fffff842 91560000 f927f3d8 6025bc2d
!	%f8  = b4e5a795 5a64ed3f cef18dd7 28a88367
!	%f12 = 9ae99a45 0ff7373e 39307cef cc174fb6
	stda	%f0,[%i5]ASI_COMMIT_S	! Block Store to 0000000030141400
!	%l5 = 0000000000000511, Mem[0000000010001410] = 3fe5a795
	stba	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 11e5a795
!	%f24 = e321c36d 00001aff, %l3 = 0000000000000000
!	Mem[0000000030101420] = 190d48ec7abaad19
	add	%i4,0x020,%g1
	stda	%f24,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030101420] = 190d48ec7abaad19
!	Mem[0000000030001400] = 8b000000, %l5 = 0000000000000511
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 0000008b000000ff
!	%l3 = 0000000000000000, Mem[0000000010181400] = 000000ff
	stba	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[0000000010101430] = 21710f62, %l5 = 000000000000008b, %asi = 80
	swapa	[%i4+0x030]%asi,%l5	! %l5 = 0000000021710f62
!	%f22 = ff000000 dce6dce0, Mem[0000000030041408] = 8dffffff ffff0000
	stda	%f22,[%i1+%o4]0x89	! Mem[0000000030041408] = ff000000 dce6dce0
!	%l4 = 00000000ffff0000, Mem[0000000021800101] = 5e284cdd
	stb	%l4,[%o3+0x101]		! Mem[0000000021800100] = 5e004cdd
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 95a7e511, %l1 = 00000000000000ff
	lduha	[%i0+%o5]0x88,%l1	! %l1 = 000000000000e511

p0_label_83:
!	Mem[0000000010101410] = 00000000, %l3 = 0000000000000000
	ldsb	[%i4+0x013],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l7 = 000000000000a3f2
	ldstuba	[%i1+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1410] = 000056917abaad19, %f20 = 8b000000 00000000
	ldda	[%i3+%o5]0x89,%f20	! %f20 = 00005691 7abaad19
!	Mem[0000000010181424] = 9a5df2aa, %l1 = 000000000000e511
	ldswa	[%i6+0x024]%asi,%l1	! %l1 = ffffffff9a5df2aa
!	Mem[00000000100c1400] = f0e1cbc9ff00ff0d, %f28 = 6783a828 b70a210d
	ldda	[%i3+%g0]0x88,%f28	! %f28 = f0e1cbc9 ff00ff0d
!	Mem[0000000010181408] = 7abaad19, %f23 = dce6dce0
	lda	[%i6+0x008]%asi,%f23	! %f23 = 7abaad19
!	Mem[0000000010041408] = 6783a828, %l5 = 0000000021710f62
	lduba	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000028
!	Mem[0000000030101400] = c14c000000000000, %f28 = f0e1cbc9 ff00ff0d
	ldda	[%i4+%g0]0x81,%f28	! %f28 = c14c0000 00000000
!	Mem[00000000300c1400] = 0000007a, %f26 = d8cc5479
	lda	[%i3+%g0]0x89,%f26	! %f26 = 0000007a
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000ff

p0_label_84:
!	%l4 = 00000000ffff0000, %l0 = 0000000000000022, %l1 = ffffffff9a5df2aa
	xor	%l4,%l0,%l1		! %l1 = 00000000ffff0022
!	%l5 = 0000000000000028, Mem[0000000020800040] = 00eccbdb, %asi = 80
	stba	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = 28eccbdb
	membar	#Sync			! Added by membar checker (16)
!	Mem[000000001014140c] = f21dc022, %l1 = 00000000ffff0022
	ldstub	[%i5+0x00c],%l1		! %l1 = 000000f2000000ff
!	%f28 = c14c0000, Mem[00000000300c1400] = 0000007a
	sta	%f28,[%i3+%g0]0x89	! Mem[00000000300c1400] = c14c0000
!	%f30 = 8500588b 2e1171cd, %l0 = 0000000000000022
!	Mem[0000000010141438] = f0e475ffe8ffb005
	add	%i5,0x038,%g1
	stda	%f30,[%g1+%l0]ASI_PST8_P ! Mem[0000000010141438] = f0e458ffe8ff7105
!	%l3 = 0000000000000000, Mem[0000000010041410] = 6a00ffff
	stwa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l0 = 0000000000000022, Mem[0000000010101428] = 58cc5479b70a210d, %asi = 80
	stxa	%l0,[%i4+0x028]%asi	! Mem[0000000010101428] = 0000000000000022
!	%l1 = 00000000000000f2, Mem[0000000010181420] = e8e41d0a9a5df2aa
	stx	%l1,[%i6+0x020]		! Mem[0000000010181420] = 00000000000000f2
!	%l5 = 0000000000000028, Mem[00000000100c1408] = 7abaad19
	stba	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 28baad19
!	Starting 10 instruction Load Burst
!	Mem[0000000010081434] = e0ee5c89, %f14 = 39307cef
	lda	[%i2+0x034]%asi,%f14	! %f14 = e0ee5c89

p0_label_85:
!	Mem[0000000030081408] = ff1a0000, %l3 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l3	! %l3 = ffffffffff1a0000
!	Mem[0000000030181410] = fffff842, %f26 = 0000007a
	lda	[%i6+%o5]0x81,%f26	! %f26 = fffff842
!	Mem[0000000010001408] = 00000000, %l4 = 00000000ffff0000
	lduwa	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 28baad19, %l5 = 0000000000000028
	ldsha	[%i3+%o4]0x80,%l5	! %l5 = 00000000000028ba
!	Mem[0000000010101410] = 00000000 5a64ed3f, %l6 = ff7ac14c, %l7 = 00000000
	ldd	[%i4+%o5],%l6		! %l6 = 0000000000000000 000000005a64ed3f
!	%l3 = ffffffffff1a0000, %l3 = ffffffffff1a0000, %l5 = 00000000000028ba
	sdivx	%l3,%l3,%l5		! %l5 = 0000000000000001
!	Mem[0000000030101408] = 00000000, %l3 = ffffffffff1a0000
	lduha	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800000] = ffe38ed8, %l1 = 00000000000000f2
	ldsb	[%o1+0x001],%l1		! %l1 = ffffffffffffffe3
!	Mem[0000000010181410] = ffffffff, %l5 = 0000000000000001
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 28a88367, %l4 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 0000000028a88367

p0_label_86:
!	Mem[00000000100c1410] = 0027f3d8ff627a95, %l6 = 0000000000000000, %l7 = 000000005a64ed3f
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = 0027f3d8ff627a95
!	Mem[0000000010081400] = 4cc17aff, %l6 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 0000004c000000ff
!	%l1 = ffffffffffffffe3, immd = 0000000000000e7b, %l3 = 0000000000000000
	sdivx	%l1,0xe7b,%l3		! %l3 = 0000000000000000
!	%f5  = 91560000, Mem[0000000030001400] = ff000000
	sta	%f5 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 91560000
!	Mem[0000000030081408] = ff1a0000, %l7 = 0027f3d8ff627a95
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141400] = aecc75a7, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l7	! %l7 = 00000000aecc75a7
!	%l4 = 28a88367, %l5 = ffffffff, Mem[00000000100c1418] = 0000ff8d 00000000
	stda	%l4,[%i3+0x018]%asi	! Mem[00000000100c1418] = 28a88367 ffffffff
!	%f22 = ff000000, Mem[0000000010001410] = 95a7e511
	sta	%f22,[%i0+%o5]0x88	! Mem[0000000010001410] = ff000000
!	%l4 = 0000000028a88367, Mem[0000000010041400] = 000000ff
	stwa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 28a88367
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = f0e1cbc9ff00ff0d, %f6  = f927f3d8 6025bc2d
	ldda	[%i3+%g0]0x88,%f6 	! %f6  = f0e1cbc9 ff00ff0d

p0_label_87:
!	Mem[0000000010081420] = 00000000, %l4 = 0000000028a88367
	ldsba	[%i2+0x022]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l0 = 0000000000000022
	lduwa	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081430] = 1364a27be0ee5c89, %f30 = 8500588b 2e1171cd
	ldd	[%i2+0x030],%f30	! %f30 = 1364a27b e0ee5c89
!	Mem[00000000100c141c] = ffffffff, %l6 = 000000000000004c
	lduw	[%i3+0x01c],%l6		! %l6 = 00000000ffffffff
!	Mem[0000000030181410] = 42f8ffff, %f15 = cc174fb6
	lda	[%i6+%o5]0x89,%f15	! %f15 = 42f8ffff
!	Mem[0000000010041408] = 00000000, %l1 = ffffffffffffffe3
	ldswa	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = 7abaad19, %l4 = 0000000000000000
	ldswa	[%i4+%o5]0x89,%l4	! %l4 = 000000007abaad19
!	Mem[0000000010041400] = 28a88367, %l4 = 000000007abaad19
	lduha	[%i1+%g0]0x88,%l4	! %l4 = 0000000000008367
!	Mem[0000000010141410] = ff00000000000000, %l0 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l0	! %l0 = ff00000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010001400] = ffec56917abaad19, %asi = 80
	stxa	%l1,[%i0+0x000]%asi	! Mem[0000000010001400] = 0000000000000000

p0_label_88:
!	%f31 = e0ee5c89, Mem[00000000100c1414] = ff627a95
	sta	%f31,[%i3+0x014]%asi	! Mem[00000000100c1414] = e0ee5c89
!	Mem[0000000010041410] = 00000000, %l6 = 00000000ffffffff
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[000000001018142b] = 000000ff, %asi = 80
	stba	%l6,[%i6+0x02b]%asi	! Mem[0000000010181428] = 00000000
!	%f4  = fffff842, Mem[0000000030041400] = 22908dff
	sta	%f4 ,[%i1+%g0]0x89	! Mem[0000000030041400] = fffff842
!	Mem[0000000030001408] = ff538721, %l6 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 00000000ff538721
!	%l2 = 19adba7a, %l3 = 00000000, Mem[0000000010141410] = ff000000 00000000
	std	%l2,[%i5+%o5]		! Mem[0000000010141410] = 19adba7a 00000000
!	%f9  = 5a64ed3f, Mem[000000001014140c] = ff1dc022
	st	%f9 ,[%i5+0x00c]	! Mem[000000001014140c] = 5a64ed3f
!	%l1 = 0000000000000000, Mem[0000000030041400] = 42f80000fffff842
	stxa	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	Mem[00000000211c0000] = ffff7001, %l4 = 0000000000008367
	ldstub	[%o2+%g0],%l4		! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0027f3d8, %l6 = 00000000ff538721
	ldub	[%i3+0x013],%l6		! %l6 = 00000000000000d8

p0_label_89:
!	Mem[00000000300c1408] = cef18dd728a88367, %f22 = ff000000 7abaad19
	ldda	[%i3+%o4]0x81,%f22	! %f22 = cef18dd7 28a88367
!	Mem[0000000030101400] = c14c0000 00000000, %l2 = 19adba7a, %l3 = 00000000
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 00000000c14c0000 0000000000000000
!	Mem[0000000030041408] = e0dce6dc000000ff, %f24 = e321c36d 00001aff
	ldda	[%i1+%o4]0x81,%f24	! %f24 = e0dce6dc 000000ff
!	Mem[0000000021800040] = 03ff34f9, %l4 = 00000000000000ff
	ldsha	[%o3+0x040]%asi,%l4	! %l4 = 00000000000003ff
!	Mem[0000000030081410] = 19adba7a dd75568b, %l4 = 000003ff, %l5 = ffffffff
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 0000000019adba7a 00000000dd75568b
!	Mem[0000000030001408] = 00000000, %f7  = ff00ff0d
	lda	[%i0+%o4]0x81,%f7 	! %f7 = 00000000
!	Mem[0000000010181404] = 000041ff, %f12 = 9ae99a45
	ld	[%i6+0x004],%f12	! %f12 = 000041ff
!	Mem[00000000300c1400] = 00004cc1, %l5 = 00000000dd75568b
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 0027f3d8e0ee5c89, %l6 = 00000000000000d8
	ldxa	[%i3+%o5]0x80,%l6	! %l6 = 0027f3d8e0ee5c89
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010181400] = ff000000
	stha	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000

p0_label_90:
!	%l4 = 0000000019adba7a, Mem[0000000010001408] = 00ffffff00000000
	stxa	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000019adba7a
!	%f13 = 0ff7373e, Mem[0000000010181408] = 19adba7a
	sta	%f13,[%i6+%o4]0x88	! Mem[0000000010181408] = 0ff7373e
!	%f0  = a775ccae 00000000 b70a210d 00000000
!	%f4  = fffff842 91560000 f0e1cbc9 00000000
!	%f8  = b4e5a795 5a64ed3f cef18dd7 28a88367
!	%f12 = 000041ff 0ff7373e e0ee5c89 42f8ffff
	stda	%f0,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%l2 = 00000000c14c0000, %l7 = 00000000aecc75a7, %l7  = 00000000aecc75a7
	mulx	%l2,%l7,%l7		! %l7 = 83fc0965d4940000
!	%l7 = 83fc0965d4940000, Mem[0000000030101400] = 00000000aecc75a7
	stxa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 83fc0965d4940000
!	%f16 = 00000000 000000ff, %l1 = 0000000000000000
!	Mem[0000000030041400] = 0000000000000000
	stda	%f16,[%i1+%l1]ASI_PST32_SL ! Mem[0000000030041400] = 0000000000000000
!	Mem[0000000030041408] = dce6dce0, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 000000e0000000ff
!	%l3 = 0000000000000000, %l4 = 0000000019adba7a, %l6 = 0027f3d8e0ee5c89
	xor	%l3,%l4,%l6		! %l6 = 0000000019adba7a
!	%l1 = 00000000000000e0, Mem[0000000010181400] = ff41000000000000
	stxa	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000000000e0
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = dce6dcff, %l5 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_91:
!	Mem[0000000010081400] = ffc17aff, %l2 = 00000000c14c0000
	ldsba	[%i2+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	%l0 = ff00000000000000, immd = 0000000000000fb6, %l7 = 83fc0965d4940000
	sdivx	%l0,0xfb6,%l7		! %l7 = ffffefb4a373f85d
!	Mem[0000000030041408] = dce6dcff, %l5 = 00000000000000ff
	ldswa	[%i1+%o4]0x89,%l5	! %l5 = ffffffffdce6dcff
!	Mem[00000000300c1408] = cef18dd7, %l0 = ff00000000000000
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = ffffffffffffcef1
!	Mem[00000000300c1410] = 00005691 7abaad19, %l4 = 19adba7a, %l5 = dce6dcff
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 000000007abaad19 0000000000005691
!	Mem[00000000300c1400] = c14c0000, %l5 = 0000000000005691
	lduwa	[%i3+%g0]0x89,%l5	! %l5 = 00000000c14c0000
!	Mem[0000000010081430] = 1364a27b, %f23 = 28a88367
	ld	[%i2+0x030],%f23	! %f23 = 1364a27b
!	Mem[0000000030001410] = 6a00ffffffc1ffff, %f20 = 00005691 7abaad19
	ldda	[%i0+%o5]0x81,%f20	! %f20 = 6a00ffff ffc1ffff
!	Mem[00000000100c1408] = 19adba28, %l7 = ffffefb4a373f85d
	ldsba	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000028
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 6a00ffff, %l0 = ffffffffffffcef1
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 000000006a00ffff

p0_label_92:
!	%l0 = 6a00ffff, %l1 = 000000e0, Mem[0000000010141400] = 00000000 0000008b
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 6a00ffff 000000e0
!	Mem[0000000010141400] = 6a00ffff, %l4 = 000000007abaad19
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 0000006a000000ff
!	%l5 = 00000000c14c0000, Mem[0000000010041410] = ffffffff
	stba	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 00ffffff
!	%l1 = 00000000000000e0, Mem[0000000030101400] = 6509fc83
	stwa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000e0
!	%l6 = 19adba7a, %l7 = 00000028, Mem[0000000010141400] = ff00ffff 000000e0
	std	%l6,[%i5+%g0]		! Mem[0000000010141400] = 19adba7a 00000028
!	%l3 = 0000000000000000, Mem[0000000030181408] = 0000008b
	stwa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%f22 = cef18dd7, Mem[0000000010081400] = ffc17aff
	sta	%f22,[%i2+%g0]0x80	! Mem[0000000010081400] = cef18dd7
!	Mem[0000000010001408] = 19adba7a, %l0 = 000000006a00ffff
	ldstuba	[%i0+%o4]0x88,%l0	! %l0 = 0000007a000000ff
!	%f25 = 000000ff, %f31 = e0ee5c89, %f17 = 000000ff
	fsubs	%f25,%f31,%f17		! %l0 = 000000000000009c, Unfinished, %fsr = 1100000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 7abaad19, %l6 = 0000000019adba7a
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = ffffffffffffad19

p0_label_93:
!	Mem[0000000010081400] = cef18dd700000000, %l4 = 000000000000006a
	ldxa	[%i2+0x000]%asi,%l4	! %l4 = cef18dd700000000
!	Mem[0000000010041410] = ffffff00, %f22 = cef18dd7
	lda	[%i1+%o5]0x88,%f22	! %f22 = ffffff00
!	Mem[0000000010081410] = ff7a0000, %f17 = 000000ff
	lda	[%i2+%o5]0x80,%f17	! %f17 = ff7a0000
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010101400] = 51cb272c, %l7 = 0000000000000028
	lduha	[%i4+%g0]0x88,%l7	! %l7 = 000000000000272c
!	Mem[0000000010081408] = ffff0000 6f84f752, %l4 = 00000000, %l5 = c14c0000
	ldd	[%i2+%o4],%l4		! %l4 = 00000000ffff0000 000000006f84f752
!	Mem[0000000010081400] = d78df1ce, %l2 = ffffffffffffffff
	ldswa	[%i2+%g0]0x88,%l2	! %l2 = ffffffffd78df1ce
!	Mem[000000001004143c] = 00000000, %l2 = ffffffffd78df1ce
	lduwa	[%i1+0x03c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = 0000ffff, %l0 = 000000000000009c
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000020800000] = ffe38ed8, %l3 = 0000000000000000
	ldsh	[%o1+%g0],%l3		! %l3 = ffffffffffffffe3
!	Starting 10 instruction Store Burst
!	Mem[000000001018142c] = 00001aff, %l1 = 000000e0, %l4 = ffff0000
	add	%i6,0x2c,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 0000000000001aff

p0_label_94:
!	Mem[00000000300c1410] = 19adba7a, %l1 = 00000000000000e0
	swapa	[%i3+%o5]0x81,%l1	! %l1 = 0000000019adba7a
!	%l3 = ffffffffffffffe3, immed = 00000311, %y  = 00000000
	sdiv	%l3,0x311,%l0		! %l0 = 0000000000537c3f
	mov	%l0,%y			! %y = 00537c3f
!	Mem[0000000010041400] = 6783a828, %l0 = 0000000000537c3f
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 00000067000000ff
!	%l4 = 0000000000001aff, Mem[0000000010181400] = e0000000
	stwa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00001aff
!	%l0 = 00000067, %l1 = 19adba7a, Mem[0000000010001400] = 00000000 00000000
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000067 19adba7a
!	%f16 = 00000000, Mem[000000001000141c] = f4ff1c07
	st	%f16,[%i0+0x01c]	! Mem[000000001000141c] = 00000000
!	Mem[0000000030181410] = fffff842, %l7 = 000000000000272c
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 00000000fffff842
!	%l2 = 0000000000000000, Mem[0000000030081410] = 7abaad19
	stwa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[0000000010001408] = ffbaad19, %l0 = 0000000000000067
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00004cc1, %l0 = 00000000000000ff
	ldsha	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_95:
!	Mem[0000000010081434] = e0ee5c89, %l4 = 0000000000001aff
	lduba	[%i2+0x036]%asi,%l4	! %l4 = 000000000000005c
!	Mem[00000000100c1410] = 0027f3d8, %l4 = 000000000000005c
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000027
!	Mem[0000000010001410] = 000000ff, %l7 = 00000000fffff842
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l6 = ffffffffffffad19
	lduwa	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = 00005691e0000000, %l4 = 0000000000000027
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = 00005691e0000000
!	Mem[0000000010041410] = 00ffffff, %l1 = 0000000019adba7a
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = 0000000000ffffff
!	Mem[0000000010101408] = ffffff8d, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l2	! %l2 = 000000000000008d
!	Mem[0000000010181438] = 22908d49a6047f27, %l3 = ffffffffffffffe3
	ldxa	[%i6+0x038]%asi,%l3	! %l3 = 22908d49a6047f27
!	%l7 = 0000000000000000, %l7 = 0000000000000000, %l5 = 000000006f84f752
	sub	%l7,%l7,%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010101414] = 5a64ed3f
	sth	%l0,[%i4+0x014]		! Mem[0000000010101414] = 0000ed3f

p0_label_96:
!	Code Fragment 4
p0_fragment_7:
!	%l0 = 0000000000000000
	setx	0x54d9448fd92f9177,%g7,%l0 ! %l0 = 54d9448fd92f9177
!	%l1 = 0000000000ffffff
	setx	0x13d82de7ecf6e110,%g7,%l1 ! %l1 = 13d82de7ecf6e110
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 54d9448fd92f9177
	setx	0xd5342fb7d4d9b3a9,%g7,%l0 ! %l0 = d5342fb7d4d9b3a9
!	%l1 = 13d82de7ecf6e110
	setx	0xa561842863fd4a26,%g7,%l1 ! %l1 = a561842863fd4a26
!	%l1 = a561842863fd4a26, Mem[0000000030041400] = 00000000
	stba	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000026
!	%l4 = 00005691e0000000, Mem[0000000030141400] = 00000000
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l4 = e0000000, %l5 = 00000000, Mem[0000000010001430] = f5d1c380 4cb9a60d
	stda	%l4,[%i0+0x030]%asi	! Mem[0000000010001430] = e0000000 00000000
!	Mem[0000000010101410] = 00000000, %l2 = 000000000000008d
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f28 = c14c0000 00000000, %l0 = d5342fb7d4d9b3a9
!	Mem[0000000030181400] = ffff000000000000
	stda	%f28,[%i6+%l0]ASI_PST8_SL ! Mem[0000000030181400] = 00ff0000000000c1
!	Mem[0000000010101410] = ff0000000000ed3f, %l4 = 00005691e0000000, %l0 = d5342fb7d4d9b3a9
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = ff0000000000ed3f
!	%f16 = 00000000 ff7a0000, Mem[0000000010141410] = 19adba7a 00000000
	stda	%f16,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 ff7a0000
!	Mem[0000000030141410] = 42f8ffff, %l3 = 22908d49a6047f27
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 0000000042f8ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 28a883ff, %l4 = 00005691e0000000
	lduba	[%i1+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_97:
!	%l5 = 0000000000000000, %l6 = 0000000000000000, %y  = 00537c3f
	smul	%l5,%l6,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[0000000010041408] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = c14c0000, %l4 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1438] = 0000ff8d, %l7 = 0000000000000000
	ldsb	[%i3+0x03a],%l7		! %l7 = ffffffffffffffff
!	Mem[00000000201c0000] = ff8d826e, %l7 = ffffffffffffffff
	ldub	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030041400] = 26000000, %l6 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = 0000000026000000
!	Mem[00000000100c1424] = 00000000, %l3 = 0000000000000000
	ldsh	[%i3+0x024],%l3		! %l3 = 0000000000000000
!	Mem[0000000010001400] = 67000000, %l4 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000067
!	%l0 = ff0000000000ed3f, immd = 00000000000009ba, %l5  = 0000000000000000
	mulx	%l0,0x9ba,%l5		! %l5 = 46000000090396c6
!	Starting 10 instruction Store Burst
!	%l4 = 00000067, %l5 = 090396c6, Mem[0000000030181400] = 0000ff00 c1000000
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000067 090396c6

p0_label_98:
!	%f24 = e0dce6dc 000000ff, %l5 = 46000000090396c6
!	Mem[00000000100c1430] = 1ab5bac5048f0193
	add	%i3,0x030,%g1
	stda	%f24,[%g1+%l5]ASI_PST16_P ! Mem[00000000100c1430] = 1ab5e6dc00000193
!	Mem[0000000021800181] = 2a07ac10, %l1 = a561842863fd4a26
	ldstuba	[%o3+0x181]%asi,%l1	! %l1 = 00000007000000ff
!	Mem[0000000010101400] = 51cb272c, %l6 = 0000000026000000
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 0000000051cb272c
!	%l1 = 0000000000000007, Mem[00000000100c1410] = d8f32700
	stwa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000007
!	Mem[0000000030181408] = 00000000, %l7 = 00000000000000ff
	swapa	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 00000026, %l5 = 46000000090396c6
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001400] = 00000067, %l1 = 0000000000000007
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 00000067000000ff
!	%l6 = 0000000051cb272c, Mem[0000000030001410] = ffffcef1ffc1ffff
	stxa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000051cb272c
!	%l6 = 0000000051cb272c, imm = fffffffffffff9af, %l3 = 0000000000000000
	sub	%l6,-0x651,%l3		! %l3 = 0000000051cb2d7d
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 8dffffff, %l0 = ff0000000000ed3f
	ldswa	[%i4+%o4]0x80,%l0	! %l0 = ffffffff8dffffff

p0_label_99:
!	Mem[0000000010081424] = 000000a4, %l3 = 0000000051cb2d7d
	ldsw	[%i2+0x024],%l3		! %l3 = 00000000000000a4
!	Mem[0000000010041420] = 8500588b, %f16 = 00000000
	ld	[%i1+0x020],%f16	! %f16 = 8500588b
!	Mem[00000000100c1414] = e0ee5c89, %l0 = ffffffff8dffffff
	ldsha	[%i3+0x014]%asi,%l0	! %l0 = ffffffffffffe0ee
!	Mem[0000000010181410] = ffffffff, %f24 = e0dce6dc
	lda	[%i6+%o5]0x80,%f24	! %f24 = ffffffff
!	Mem[0000000010041410] = ffffff00, %l5 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800040] = 03ff34f9, %l5 = 0000000000000000
	ldsh	[%o3+0x040],%l5		! %l5 = 00000000000003ff
!	Mem[0000000010081410] = 000000ff00007aff, %f8  = b4e5a795 5a64ed3f
	ldda	[%i2+%o5]0x88,%f8 	! %f8  = 000000ff 00007aff
!	%f7  = 00000000, %f0  = a775ccae
	fsqrts	%f7 ,%f0 		! %f0  = 00000000
!	Mem[0000000010081400] = d78df1ce, %l6 = 0000000051cb272c
	lduha	[%i2+%g0]0x88,%l6	! %l6 = 000000000000f1ce
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000067, Mem[0000000021800140] = ff761f70
	sth	%l4,[%o3+0x140]		! Mem[0000000021800140] = 00671f70

p0_label_100:
!	%l4 = 0000000000000067, Mem[0000000010181434] = 620f7121
	sth	%l4,[%i6+0x034]		! Mem[0000000010181434] = 00677121
!	Mem[000000001004140c] = 35f02198, %l2 = 00000000, %l3 = 000000a4
	add	%i1,0x0c,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 0000000035f02198
!	%l6 = 0000f1ce, %l7 = 00000000, Mem[0000000010081410] = ff7a0000 ff000000
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000f1ce 00000000
!	%f12 = 000041ff 0ff7373e, Mem[0000000030001400] = 91560000 00000000
	stda	%f12,[%i0+%g0]0x81	! Mem[0000000030001400] = 000041ff 0ff7373e
!	%f18 = 00000000 00000000, Mem[0000000010181408] = 3e37f70f 2e1171cd
	stda	%f18,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 00000000
!	%l0 = ffffe0ee, %l1 = 00000067, Mem[00000000300c1400] = 00004cc1 00000000
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffe0ee 00000067
!	Mem[00000000100c1420] = 00000000, %l5 = 00000000000003ff
	swap	[%i3+0x020],%l5		! %l5 = 0000000000000000
!	%l0 = ffffe0ee, %l1 = 00000067, Mem[0000000030001410] = 00000000 51cb272c
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffe0ee 00000067
!	%l4 = 0000000000000067, Mem[00000000300c1400] = ffffe0ee
	stwa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000067
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 000000e0, %l3 = 0000000035f02198
	ldsha	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_101:
!	Mem[0000000030001408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = 00005691 a6047f27, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 00000000a6047f27 0000000000005691
!	Mem[0000000010141408] = 3fed645a0da6b94c, %l1 = 0000000000000067
	ldxa	[%i5+%o4]0x88,%l1	! %l1 = 3fed645a0da6b94c
!	Mem[00000000300c1410] = 000000e0 91560000, %l0 = ffffe0ee, %l1 = 0da6b94c
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000e0 0000000091560000
!	Mem[0000000010101408] = 8dffffff ff1a0000, %l0 = 000000e0, %l1 = 91560000
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 000000008dffffff 00000000ff1a0000
!	Mem[0000000010181418] = 2c27cb51, %l7 = 0000000000000000
	lduba	[%i6+0x018]%asi,%l7	! %l7 = 000000000000002c
!	Mem[00000000100c1418] = 28a88367ffffffff, %f26 = fffff842 8500588b
	ldd	[%i3+0x018],%f26	! %f26 = 28a88367 ffffffff
!	Mem[00000000300c1408] = cef18dd7, %l7 = 000000000000002c
	ldsba	[%i3+%o4]0x81,%l7	! %l7 = ffffffffffffffce
!	Mem[0000000030081408] = ff1a00ff, %l0 = 000000008dffffff
	lduwa	[%i2+%o4]0x89,%l0	! %l0 = 00000000ff1a00ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = cef18dd700000000, %l3 = 0000000000005691, %l5 = 0000000000000000
	casxa	[%i2]0x80,%l3,%l5	! %l5 = cef18dd700000000

p0_label_102:
!	Mem[0000000030141400] = 00000000, %l7 = ffffffffffffffce
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%l5 = cef18dd700000000, immed = fffffed0, %y  = 00000000
	udiv	%l5,-0x130,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = ff1a00ff
!	%l1 = 00000000ff1a0000, Mem[0000000010041408] = 0000000035f02198, %asi = 80
	stxa	%l1,[%i1+0x008]%asi	! Mem[0000000010041408] = 00000000ff1a0000
!	%l7 = 0000000000000000, Mem[0000000030081408] = ff1a00ff
	stwa	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%f27 = ffffffff, Mem[0000000010001408] = 19adbaff
	sta	%f27,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 00000000ff1a00ff
	setx	0xa1ab77f78a7cfd93,%g7,%l0 ! %l0 = a1ab77f78a7cfd93
!	%l1 = 00000000ff1a0000
	setx	0x671f14e0130e42ae,%g7,%l1 ! %l1 = 671f14e0130e42ae
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a1ab77f78a7cfd93
	setx	0xe8450ae7aaae9793,%g7,%l0 ! %l0 = e8450ae7aaae9793
!	%l1 = 671f14e0130e42ae
	setx	0xd9a4e5483d8fc71b,%g7,%l1 ! %l1 = d9a4e5483d8fc71b
!	%l1 = d9a4e5483d8fc71b, Mem[0000000030081408] = 00000000
	stha	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000c71b
!	%l0 = e8450ae7aaae9793, Mem[0000000030041400] = 26000000
	stwa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = aaae9793
!	%l3 = 0000000000005691, Mem[00000000201c0000] = ff8d826e
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 5691826e
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_9:
!	%l0 = e8450ae7aaae9793
	setx	0x46faf3780272000d,%g7,%l0 ! %l0 = 46faf3780272000d
!	%l1 = d9a4e5483d8fc71b
	setx	0xf07f4f97bed9e6a7,%g7,%l1 ! %l1 = f07f4f97bed9e6a7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 46faf3780272000d
	setx	0x92ac5d60711a579b,%g7,%l0 ! %l0 = 92ac5d60711a579b
!	%l1 = f07f4f97bed9e6a7
	setx	0x2b381c8f81e0bef7,%g7,%l1 ! %l1 = 2b381c8f81e0bef7

p0_label_103:
!	Mem[0000000030081408] = 1bc70000, %l3 = 0000000000005691
	lduwa	[%i2+%o4]0x81,%l3	! %l3 = 000000001bc70000
!	Mem[0000000030001410] = eee0ffff, %l2 = 00000000a6047f27
	ldsba	[%i0+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1410] = e0000000, %f6  = f0e1cbc9
	lda	[%i3+%o5]0x89,%f6 	! %f6 = e0000000
!	Mem[0000000010041408] = 00000000, %l0 = 92ac5d60711a579b
	lduwa	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = 0000f1ce, %l0 = 0000000000000000
	lduha	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101434] = 6e17dfe9, %f13 = 0ff7373e
	lda	[%i4+0x034]%asi,%f13	! %f13 = 6e17dfe9
!	Mem[0000000010041400] = ff83a828 b3dd1076, %l2 = ffffffff, %l3 = 1bc70000
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff83a828 00000000b3dd1076
!	Mem[0000000010181400] = 00001aff, %l5 = cef18dd700000000
	lduha	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081430] = 1364a27be0ee5c89, %l2 = 00000000ff83a828
	ldxa	[%i2+0x030]%asi,%l2	! %l2 = 1364a27be0ee5c89
!	Starting 10 instruction Store Burst
!	%f30 = 1364a27b e0ee5c89, Mem[0000000030141410] = 277f04a6 91560000
	stda	%f30,[%i5+%o5]0x81	! Mem[0000000030141410] = 1364a27b e0ee5c89

p0_label_104:
!	Mem[0000000010041410] = 00ffffff, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 0000000000ffffff
!	%l4 = 0000000000000067, Mem[00000000211c0000] = ffff7001
	stb	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 67ff7001
!	%f31 = e0ee5c89, Mem[0000000010001414] = 5a64ed3f
	st	%f31,[%i0+0x014]	! Mem[0000000010001414] = e0ee5c89
!	%l3 = 00000000b3dd1076, Mem[0000000030081400] = 2c270000
	stba	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 2c270076
!	Mem[0000000010101408] = 8dffffff, %l1 = 2b381c8f81e0bef7
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 0000008d000000ff
!	%l5 = 0000000000ffffff, Mem[0000000030081410] = 00000000
	stba	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	Mem[0000000010001410] = 000000ff, %l1 = 000000000000008d
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f13 = 6e17dfe9, Mem[000000001008141c] = 5f2478ca
	st	%f13,[%i2+0x01c]	! Mem[000000001008141c] = 6e17dfe9
!	%l0 = 0000000000000000, Mem[0000000010001438] = 186ce9bcc1cabd15, %asi = 80
	stxa	%l0,[%i0+0x038]%asi	! Mem[0000000010001438] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 8d41f700, %f10 = cef18dd7
	lda	[%i1+%o5]0x81,%f10	! %f10 = 8d41f700

p0_label_105:
!	Mem[0000000020800040] = 28eccbdb, %l3 = 00000000b3dd1076
	ldub	[%o1+0x041],%l3		! %l3 = 00000000000000ec
!	Mem[00000000211c0000] = 67ff7001, %l3 = 00000000000000ec
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 00000000000067ff
!	Mem[0000000010141410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 0dff00ff c9cbe1f0, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 000000000dff00ff 00000000c9cbe1f0
!	Mem[0000000030101410] = 91560000, %l5 = 0000000000ffffff
	ldsba	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = ffffffff, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010001408] = ffffffff 00000000, %l4 = 00000067, %l5 = ffffffff
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Mem[0000000010181408] = 00000000, %l4 = 00000000ffffffff
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = 000000001ab5fe2d, %f24 = ffffffff 000000ff
	ldda	[%i0+%o4]0x81,%f24	! %f24 = 00000000 1ab5fe2d
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 4cb9a60d, %l0 = 000000000dff00ff
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 000000004cb9a60d

p0_label_106:
!	%f20 = 6a00ffff, Mem[0000000010181400] = ff1a0000
	sta	%f20,[%i6+%g0]0x88	! Mem[0000000010181400] = 6a00ffff
!	%l6 = 0000000000000000, Mem[0000000030001410] = eee0ffff
	stwa	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%f19 = 00000000, Mem[00000000300c1410] = e0000000
	sta	%f19,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010041404] = b3dd1076, %l4 = 00000000, %l0 = 4cb9a60d
	add	%i1,0x04,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 00000000b3dd1076
!	Mem[000000001004140c] = ff1a0000, %l6 = 0000000000000000, %asi = 80
	swapa	[%i1+0x00c]%asi,%l6	! %l6 = 00000000ff1a0000
!	Mem[0000000030081410] = ff000000, %l3 = 00000000000067ff
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010181408] = 00000000
	stha	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	Mem[0000000010181410] = ffffffff, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010041410] = 00000000, %l1 = 00000000c9cbe1f0
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %l3 = 00000000000000ff
	ldsb	[%i5+0x013],%l3		! %l3 = 0000000000000000

p0_label_107:
!	Mem[0000000030101410] = 00005691, %l7 = 00000000ffffffff
	lduha	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = ffff006a, %l7 = 0000000000000000
	lduha	[%i6+%g0]0x80,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030081400] = 2c270076, %f16 = 8500588b
	lda	[%i2+%g0]0x89,%f16	! %f16 = 2c270076
!	Mem[0000000030001410] = 00000000 00000067, %l6 = ff1a0000, %l7 = 0000ffff
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000 0000000000000067
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 6700000067000000, %f10 = 8d41f700 28a88367
	ldda	[%i3+%g0]0x89,%f10	! %f10 = 67000000 67000000
!	Mem[0000000010041418] = 4cc17a8d, %l0 = 00000000b3dd1076
	lduh	[%i1+0x01a],%l0		! %l0 = 0000000000007a8d
!	Mem[00000000100c1408] = 00e5ffff19adba28, %l5 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l5	! %l5 = 00e5ffff19adba28
!	Mem[00000000300c1410] = 00000000, %f23 = 1364a27b
	lda	[%i3+%o5]0x89,%f23	! %f23 = 00000000
!	Starting 10 instruction Store Burst
!	%f6  = e0000000 00000000, %f0  = 00000000 00000000
	fdtox	%f6 ,%f0 		! %f0  = 80000000 00000000

p0_label_108:
!	%f4  = fffff842 91560000, %l5 = 00e5ffff19adba28
!	Mem[0000000030141428] = cef18dd728a88367
	add	%i5,0x028,%g1
	stda	%f4,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030141428] = cef18dd728a88367
!	%l5 = 00e5ffff19adba28, Mem[0000000030001400] = ff410000
	stwa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 19adba28
!	Mem[0000000030181408] = ff000000, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010001410] = 0000008d, %l0 = 0000000000007a8d
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 000000000000008d
!	Mem[0000000010181410] = 00000000, %l2 = 1364a27be0ee5c89
	lduha	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l6 = ff000000, %l7 = 00000067, Mem[00000000100c1410] = 07000000 e0ee5c89
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000 00000067
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030081410] = 000000ff 8b5675dd
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 00000000
!	%l6 = 00000000ff000000, Mem[00000000100c1425] = 00000000, %asi = 80
	stba	%l6,[%i3+0x025]%asi	! Mem[00000000100c1424] = 00000000
!	%l6 = ff000000, %l7 = 00000067, Mem[0000000010181400] = 6a00ffff 00000000
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000000 00000067
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l4 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000

p0_label_109:
!	Mem[0000000030001400] = 3e37f70f19adba28, %l2 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l2	! %l2 = 3e37f70f19adba28
!	Mem[0000000010081410] = cef10000, %f7  = 00000000
	lda	[%i2+%o5]0x88,%f7 	! %f7 = cef10000
!	Mem[0000000010081404] = 00000000, %l0 = 000000000000008d
	ldsh	[%i2+0x004],%l0		! %l0 = 0000000000000000
!	Mem[0000000030181400] = 00000067, %l7 = 0000000000000067
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000067
!	Mem[0000000021800080] = a3f2944f, %l2 = 3e37f70f19adba28
	ldub	[%o3+0x081],%l2		! %l2 = 00000000000000f2
!	Mem[0000000010181410] = 00000000c580bb9c, %l2 = 00000000000000f2
	ldxa	[%i6+%o5]0x80,%l2	! %l2 = 00000000c580bb9c
!	Mem[0000000021800000] = 0000fa80, %l6 = 00000000ff000000
	lduh	[%o3+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041410] = 8d41f700, %l7 = 0000000000000067
	ldsba	[%i1+%o5]0x81,%l7	! %l7 = ffffffffffffff8d
!	Mem[0000000010181400] = 00000067ff000000, %l2 = 00000000c580bb9c
	ldxa	[%i6+%g0]0x88,%l2	! %l2 = 00000067ff000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff00ff0d, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l6	! %l6 = 00000000ff00ff0d

p0_label_110:
!	%l1 = 0000000000000000, Mem[0000000010081408] = 0000ffff
	stba	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000ff00
!	%l6 = 00000000ff00ff0d, Mem[0000000030041408] = ff000000dce6dcff
	stxa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000ff00ff0d
!	%f4  = fffff842 91560000, Mem[0000000010081438] = e159ff4c ee30e417
	stda	%f4 ,[%i2+0x038]%asi	! Mem[0000000010081438] = fffff842 91560000
!	%f10 = 67000000, Mem[0000000010181400] = 000000ff
	sta	%f10,[%i6+%g0]0x80	! Mem[0000000010181400] = 67000000
!	Mem[0000000020800040] = 28eccbdb, %l1 = 0000000000000000
	ldstub	[%o1+0x040],%l1		! %l1 = 00000028000000ff
!	Mem[00000000300c1410] = 00000000, %l7 = ffffffffffffff8d
	ldstuba	[%i3+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000211c0000] = 67ff7001, %l1 = 0000000000000028
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 00000067000000ff
!	%f24 = 00000000 1ab5fe2d, Mem[0000000010181408] = 00000000 00000000
	stda	%f24,[%i6+0x008]%asi	! Mem[0000000010181408] = 00000000 1ab5fe2d
!	Mem[0000000010101408] = 00000000, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l7 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_111:
!	Mem[00000000300c1408] = d78df1ce, %l2 = 00000067ff000000
	ldsha	[%i3+%o4]0x89,%l2	! %l2 = fffffffffffff1ce
!	Mem[0000000010101410] = ff000000 0000ed3f, %l4 = 00000000, %l5 = 19adba28
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 00000000ff000000 000000000000ed3f
!	Mem[0000000010141410] = 00000000, %l2 = fffffffffffff1ce
	lduba	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l0 = 0000000000000000, %l7 = 0000000000000000, %y  = ff1a00ff
	sdiv	%l0,%l7,%l5		! Div by zero, %l0 = 0000000000000050
	mov	%l0,%y			! %y = 00000028
!	Mem[0000000010081408] = 00ff0000, %l0 = 0000000000000028
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 0000000000ff0000
!	%l7 = 0000000000000000, immd = 0000000000000f20, %l4 = 00000000ff000000
	udivx	%l7,0xf20,%l4		! %l4 = 0000000000000000
!	Mem[0000000010081410] = 0000f1ce00000000, %l0 = 0000000000ff0000
	ldx	[%i2+%o5],%l0		! %l0 = 0000f1ce00000000
!	Mem[0000000010001410] = 8d7a0000, %l3 = 0000000000000000
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = ffffffff8d7a0000
!	Mem[0000000010001408] = ffffffff, %l7 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l3 = ffffffff8d7a0000, %l1 = 0000000000000067, %l1 = 0000000000000067
	andn	%l3,%l1,%l1		! %l1 = ffffffff8d7a0000

p0_label_112:
!	%l3 = ffffffff8d7a0000, Mem[00000000300c1408] = cef18dd7
	stha	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00008dd7
!	Mem[0000000010001400] = ff0000007abaad19, %l2 = 0000000000000000, %l4 = 0000000000000000
	casxa	[%i0]0x80,%l2,%l4	! %l4 = ff0000007abaad19
!	Mem[000000001000143d] = 00000000, %l0 = 0000f1ce00000000
	ldstub	[%i0+0x03d],%l0		! %l0 = 00000000000000ff
!	%l6 = ff00ff0d, %l7 = ffffffff, Mem[0000000010041438] = b70a210d 00000000
	stda	%l6,[%i1+0x038]%asi	! Mem[0000000010041438] = ff00ff0d ffffffff
!	Mem[0000000010081424] = 000000a4, %l2 = 0000000000000000
	swap	[%i2+0x024],%l2		! %l2 = 00000000000000a4
!	%l5 = 000000000000ed3f, Mem[0000000030041408] = 0dff00ff00000000
	stxa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000000000ed3f
!	%l0 = 00000000, %l1 = 8d7a0000, Mem[0000000030141400] = ceffffff 00000000
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 8d7a0000
!	%l2 = 00000000000000a4, Mem[0000000030041408] = 00000000
	stba	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = a4000000
!	%f29 = 00000000, %f8  = 000000ff
	fcmpes	%fcc0,%f29,%f8 		! %fcc0 = 1
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l6 = 00000000ff00ff0d
	ldub	[%i4+%o4],%l6		! %l6 = 0000000000000000

p0_label_113:
!	Mem[0000000010181408] = 00000000, %l7 = ffffffffffffffff
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l2 = 00000000000000a4
	lduwa	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000030001400] = 28baad19 0ff7373e 00000000 1ab5fe2d
!	Mem[0000000030001410] = 00000000 00000067 f9254e70 9f89571e
!	Mem[0000000030001420] = dfee3ea2 c4910c61 4317e2f3 0c377fa2
!	Mem[0000000030001430] = 431e4b92 4bc52f22 7f14b351 5097a866
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000010041410] = c9cbe1f0, %f4  = fffff842
	lda	[%i1+%o5]0x88,%f4 	! %f4 = c9cbe1f0
!	%f10 = 67000000, %f5  = 91560000
	fsqrts	%f10,%f5 		! %f5  = 533504f3
!	Mem[0000000010081410] = 0000f1ce, %l6 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l6	! %l6 = 000000000000f1ce
!	Mem[0000000030041400] = aaae9793, %l3 = ffffffff8d7a0000
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 00000000aaae9793
!	Mem[0000000030141408] = b70a210d00000000, %l4 = ff0000007abaad19
	ldxa	[%i5+%o4]0x81,%l4	! %l4 = b70a210d00000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000f1ce, %l7 = 00000000, Mem[00000000100c1428] = fb27e230 ff000000
	stda	%l6,[%i3+0x028]%asi	! Mem[00000000100c1428] = 0000f1ce 00000000

p0_label_114:
!	%f8  = 000000ff 00007aff, Mem[0000000030101410] = 91560000 fffff842
	stda	%f8 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff 00007aff
!	%l4 = b70a210d00000000, Mem[0000000010181408] = 00000000
	stha	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	Mem[0000000020800001] = ffe38ed8, %l3 = 00000000aaae9793
	ldstuba	[%o1+0x001]%asi,%l3	! %l3 = 000000e3000000ff
!	%l5 = 000000000000ed3f, Mem[0000000021800001] = 0000fa80, %asi = 80
	stba	%l5,[%o3+0x001]%asi	! Mem[0000000021800000] = 003ffa80
!	Mem[00000000100c142c] = 00000000, %l1 = ffffffff8d7a0000, %asi = 80
	swapa	[%i3+0x02c]%asi,%l1	! %l1 = 0000000000000000
!	%f14 = e0ee5c89 42f8ffff, Mem[00000000300c1408] = d78d0000 6783a828
	stda	%f14,[%i3+%o4]0x89	! Mem[00000000300c1408] = e0ee5c89 42f8ffff
!	%f7  = cef10000, Mem[0000000010101410] = ff000000
	sta	%f7 ,[%i4+%o5]0x80	! Mem[0000000010101410] = cef10000
!	Mem[0000000010081408] = 00ff0000, %l6 = 000000000000f1ce
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000ff0000
!	%l4 = 00000000, %l5 = 0000ed3f, Mem[0000000030181410] = 0000272c 91560000
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 0000ed3f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 000000a4, %l7 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l7	! %l7 = 00000000000000a4

p0_label_115:
!	Mem[0000000030101410] = ff7a0000, %l4 = b70a210d00000000
	lduba	[%i4+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081424] = 00000000, %l7 = 00000000000000a4
	lduh	[%i2+0x026],%l7		! %l7 = 0000000000000000
!	%l3 = 00000000000000e3, %l6 = 0000000000ff0000, %l3 = 00000000000000e3
	xor	%l3,%l6,%l3		! %l3 = 0000000000ff00e3
!	Mem[0000000010041418] = 4cc17a8d, %l1 = 0000000000000000
	lduh	[%i1+0x01a],%l1		! %l1 = 0000000000007a8d
!	Mem[0000000010181410] = 00000000, %l2 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = 8d41f700 92538f87, %l0 = 00000000, %l1 = 00007a8d
	ldda	[%i1+%o5]0x81,%l0	! %l0 = 000000008d41f700 0000000092538f87
!	Mem[0000000030101410] = 00007aff, %l0 = 000000008d41f700
	lduba	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101410] = ff7a0000ff000000, %l0 = 00000000000000ff
	ldxa	[%i4+%o5]0x81,%l0	! %l0 = ff7a0000ff000000
!	Mem[0000000030101410] = ff7a0000 ff000000, %l4 = 000000ff, %l5 = 0000ed3f
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 00000000ff7a0000 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000ff00e3, Mem[0000000030181408] = 0000000000000000
	stxa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000ff00e3

p0_label_116:
!	%f10 = 67000000, Mem[0000000010101438] = 277f04a6
	st	%f10,[%i4+0x038]	! Mem[0000000010101438] = 67000000
!	Mem[0000000030181400] = 67000000, %l0 = ff7a0000ff000000
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 0000000067000000
!	%f4  = c9cbe1f0, %f4  = c9cbe1f0, %f14 = e0ee5c89
	fdivs	%f4 ,%f4 ,%f14		! %f14 = 3f800000
!	%l4 = 00000000ff7a0000, Mem[0000000030041400] = 000000009397aeaa
	stxa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000ff7a0000
!	%l0 = 0000000067000000, Mem[0000000030041410] = 00f7418d
	stwa	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 67000000
!	%f13 = 6e17dfe9, Mem[0000000010181408] = 00000000
	sta	%f13,[%i6+%o4]0x88	! Mem[0000000010181408] = 6e17dfe9
!	Mem[0000000010001400] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1434] = 00000193, %l4 = 00000000ff7a0000
	swap	[%i3+0x034],%l4		! %l4 = 0000000000000193
!	%l0 = 0000000067000000, Mem[0000000030081400] = 7600272cffffffff
	stxa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000067000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000026 98b2e1d6, %l4 = 00000193, %l5 = ff000000
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 00000000ff000026 0000000098b2e1d6

p0_label_117:
!	Mem[0000000021800100] = 5e004cdd, %l7 = 0000000000000000
	ldub	[%o3+0x101],%l7		! %l7 = 0000000000000000
!	%f24 = dfee3ea2, %f3  = 00000000, %f26 = 4317e2f3
	fdivs	%f24,%f3 ,%f26		! %f26 = ff800000
!	Mem[00000000300c1410] = 000000ff, %l3 = 0000000000ff00e3
	ldswa	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = 28a883ff, %l1 = 0000000092538f87
	lduba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101410] = cef10000, %l3 = 00000000000000ff
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 000000000000cef1
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 67000000, %l1 = 00000000000000ff
	lduha	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l6 = 0000000000ff0000
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l2 = 00000000000000ff
	lduba	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = ff000026, %l5 = 98b2e1d6, Mem[0000000010041400] = 28a883ff 7610ddb3
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000026 98b2e1d6

p0_label_118:
!	Mem[0000000010081410] = cef10000, %l3 = 000000000000cef1
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f2  = b70a210d 00000000, %l1 = 0000000000000000
!	Mem[0000000010181420] = 00000000000000f2
	add	%i6,0x020,%g1
	stda	%f2,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010181420] = 00000000000000f2
!	Mem[0000000010041408] = 00000000, %l0 = 0000000067000000
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101428] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i4+0x028]%asi,%l0	! %l0 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030041400] = 00007aff
	stwa	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%l4 = ff000026, %l5 = 98b2e1d6, Mem[0000000030141410] = 1364a27b e0ee5c89
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000026 98b2e1d6
!	%l0 = 0000000000000000, Mem[0000000030141408] = 000000000d210ab7
	stxa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000
!	Mem[0000000020800000] = ffff8ed8, %l2 = 0000000000000000
	ldstub	[%o1+%g0],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000010141408] = 0dff00ff, %l7 = 0000000000000000
	ldsba	[%i5+%o4]0x80,%l7	! %l7 = 000000000000000d
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 52f7846fcef10000, %l7 = 000000000000000d
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = 52f7846fcef10000

p0_label_119:
!	Mem[0000000010081410] = ff00f1ce 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000ff00f1ce 0000000000000000
!	Mem[0000000010181408] = e9df176e, %l0 = 00000000ff00f1ce
	lduba	[%i6+%o4]0x80,%l0	! %l0 = 00000000000000e9
!	Mem[0000000030081410] = 00000000, %l0 = 00000000000000e9
	lduba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%f9  = 00007aff, %f16 = 28baad19
	fsqrts	%f9 ,%f16		! %l0 = 0000000000000022, Unfinished, %fsr = 1100000400
!	%f30 = 7f14b351, %f10 = 67000000, %f13 = 6e17dfe9
	fdivs	%f30,%f10,%f13		! %f13 = 5794b351
!	Mem[00000000300c1410] = ff000000, %l2 = 00000000000000ff
	lduha	[%i3+%o5]0x81,%l2	! %l2 = 000000000000ff00
!	%l0 = 0000000000000022, %l1 = 0000000000000000, %y  = 00000028
	sdiv	%l0,%l1,%l2		! Div by zero, %l0 = 0000000000000072
	mov	%l0,%y			! %y = 0000004a
!	Mem[0000000010081410] = ff00f1ce, %l2 = 000000000000ff00
	ldswa	[%i2+%o5]0x80,%l2	! %l2 = ffffffffff00f1ce
!	Mem[0000000010001410] = 8d7a0000, %l7 = 52f7846fcef10000
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000004a, Mem[0000000010141419] = 03d54185, %asi = 80
	stba	%l0,[%i5+0x019]%asi	! Mem[0000000010141418] = 034a4185

p0_label_120:
!	Mem[0000000030041408] = a4000000, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l1	! %l1 = 000000a4000000ff
!	%l1 = 00000000000000a4, Mem[0000000010041408] = 67000000
	stba	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 670000a4
!	%l2 = ffffffffff00f1ce, immed = fffffa0d, %y  = 0000004a
	smul	%l2,-0x5f3,%l6		! %l6 = 00000005ed617376, %y = 00000005
!	Mem[0000000020800000] = ffff8ed8, %l1 = 00000000000000a4
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000300c1408] = 42f8ffff, %l2 = ffffffffff00f1ce
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 0000000042f8ffff
!	%f22 = f9254e70, Mem[0000000010141408] = 0dff00ff
	sta	%f22,[%i5+%o4]0x80	! Mem[0000000010141408] = f9254e70
!	%l0 = 0000004a, %l1 = 000000ff, Mem[00000000300c1400] = 00000067 00000067
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000004a 000000ff
!	Mem[000000001014143d] = e8ff7105, %l7 = 0000000000000000
	ldstub	[%i5+0x03d],%l7		! %l7 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (19)
!	%l0 = 000000000000004a, Mem[0000000030001410] = 00000000
	stwa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000004a
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000 67000000, %l2 = 42f8ffff, %l3 = 00000000
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000 0000000067000000

p0_label_121:
!	Mem[0000000010141410] = 00000000, %l4 = 00000000ff000026
	lduba	[%i5+0x012]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 00000000 c9cbe1f0 28baad19 ffffe500
!	Mem[00000000100c1410] = ff000000 00000067 28a88367 ffffffff
!	Mem[00000000100c1420] = 000003ff 00000000 0000f1ce 8d7a0000
!	Mem[00000000100c1430] = 1ab5e6dc ff7a0000 0000ff8d ffffffe3
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000030101400] = e0000000d4940000, %f28 = 431e4b92 4bc52f22
	ldda	[%i4+%g0]0x81,%f28	! %f28 = e0000000 d4940000
!	Mem[0000000010101410] = cef10000, %l7 = 00000000000000ff
	lduwa	[%i4+%o5]0x80,%l7	! %l7 = 00000000cef10000
!	Mem[00000000300c1400] = 0000004a000000ff, %l5 = 0000000098b2e1d6
	ldxa	[%i3+%g0]0x81,%l5	! %l5 = 0000004a000000ff
!	Mem[00000000300c1410] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000cef10000
	lduba	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 00007a8d e0ee5c89, %l2 = 000000ff, %l3 = 67000000
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 0000000000007a8d 00000000e0ee5c89
!	Mem[00000000300c1408] = ff00f1ce, %l4 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l4	! %l4 = ffffffffffffffce
!	Starting 10 instruction Store Burst
!	%l3 = 00000000e0ee5c89, imm = 0000000000000013, %l0 = 000000000000004a
	addc	%l3,0x013,%l0		! %l0 = 00000000e0ee5c9c

p0_label_122:
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 00000000e0ee5c9c
	setx	0x5390b1884710289a,%g7,%l0 ! %l0 = 5390b1884710289a
!	%l1 = 00000000000000ff
	setx	0xb851332ff0a28043,%g7,%l1 ! %l1 = b851332ff0a28043
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5390b1884710289a
	setx	0x3a55fcb07e3f5579,%g7,%l0 ! %l0 = 3a55fcb07e3f5579
!	%l1 = b851332ff0a28043
	setx	0xb75acce852a7d599,%g7,%l1 ! %l1 = b75acce852a7d599
!	Mem[00000000100c1421] = 000003ff, %l7 = 0000000000000000
	ldstub	[%i3+0x021],%l7		! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010081400] = cef18dd7
	stba	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 00f18dd7
!	Mem[0000000030001408] = 00000000, %l4 = ffffffffffffffce
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000020800000] = ffff8ed8, %l7 = 0000000000000000
	ldstub	[%o1+%g0],%l7		! %l7 = 000000ff000000ff
!	%l5 = 0000004a000000ff, Mem[0000000030081410] = 00000000
	stwa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff
!	%l2 = 00007a8d, %l3 = e0ee5c89, Mem[0000000010101408] = 00000000 00001aff
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 00007a8d e0ee5c89
!	%l5 = 0000004a000000ff, Mem[0000000030181400] = 000000ff
	stwa	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	%l4 = 0000000000000000, Mem[0000000010101408] = 00007a8d
	stha	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l6 = 00000005ed617376
	ldswa	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000

p0_label_123:
!	Mem[0000000030081408] = 1bc7000000000000, %l4 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l4	! %l4 = 1bc7000000000000
!	Mem[0000000030101400] = 000094d4000000e0, %l1 = b75acce852a7d599
	ldxa	[%i4+%g0]0x89,%l1	! %l1 = 000094d4000000e0
!	Mem[00000000300c1408] = cef100ff, %l3 = 00000000e0ee5c89
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 000000ce000000ff
!	Mem[0000000030181410] = 00000000, %l2 = 0000000000007a8d
	lduba	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = 6700000067000000, %f2  = 28baad19 ffffe500
	ldda	[%i6+%g0]0x80,%f2 	! %f2  = 67000000 67000000
!	Mem[0000000030101400] = e0000000, %l6 = 0000000000000000
	ldsha	[%i4+%g0]0x81,%l6	! %l6 = ffffffffffffe000
!	Mem[0000000030141408] = 0000000000000000, %f26 = ff800000 0c377fa2
	ldda	[%i5+%o4]0x89,%f26	! %f26 = 00000000 00000000
!	Mem[0000000030041410] = 00000067, %l3 = 00000000000000ce
	ldsba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %f2  = 67000000
	lda	[%i6+%o5]0x89,%f2 	! %f2 = 00000000
!	Starting 10 instruction Store Burst
!	%l1 = 000094d4000000e0, Mem[0000000030141408] = 0000000000000000
	stxa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 000094d4000000e0

p0_label_124:
!	Mem[0000000010081400] = 00f18dd7, %l7 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000f18dd7
!	Mem[0000000030081410] = ff000000, %l7 = 0000000000f18dd7
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%f2  = 00000000 67000000, %l2 = 0000000000000000
!	Mem[0000000010141430] = ff7a622ff9664594
	add	%i5,0x030,%g1
	stda	%f2,[%g1+%l2]ASI_PST16_P ! Mem[0000000010141430] = ff7a622ff9664594
!	%f16 = 28baad19 0ff7373e 00000000 1ab5fe2d
!	%f20 = 00000000 00000067 f9254e70 9f89571e
!	%f24 = dfee3ea2 c4910c61 00000000 00000000
!	%f28 = e0000000 d4940000 7f14b351 5097a866
	stda	%f16,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
	membar	#Sync			! Added by membar checker (20)
!	%l1 = 000094d4000000e0, Mem[00000000100c1410] = 000000ff
	stha	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000e0
!	%l5 = 0000004a000000ff, Mem[0000000030181408] = 00000000
	stwa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ff
!	%f24 = dfee3ea2, Mem[00000000100c1408] = 28baad19
	sta	%f24,[%i3+%o4]0x80	! Mem[00000000100c1408] = dfee3ea2
!	Mem[0000000010001408] = ffffffff, %l4 = 1bc7000000000000
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%l5 = 0000004a000000ff, Mem[0000000030141410] = 260000ff
	stba	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 260000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 3e37f70f, %l5 = 0000004a000000ff
	ldswa	[%i1+%g0]0x81,%l5	! %l5 = 000000003e37f70f

p0_label_125:
!	Mem[00000000100c1410] = 67000000 000000e0, %l0 = 7e3f5579, %l1 = 000000e0
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000e0 0000000067000000
!	Mem[00000000300c1400] = 0000004a, %l2 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041438] = ff00ff0d, %f19 = 1ab5fe2d
	ld	[%i1+0x038],%f19	! %f19 = ff00ff0d
!	Mem[0000000010041410] = f0e1cbc9 d6ffe47b, %l4 = 000000ff, %l5 = 3e37f70f
	ldda	[%i1+%o5]0x80,%l4	! %l4 = 00000000f0e1cbc9 00000000d6ffe47b
!	Mem[00000000201c0000] = 5691826e, %l6 = ffffffffffffe000
	ldsh	[%o0+%g0],%l6		! %l6 = 0000000000005691
!	Mem[000000001008142c] = 7abaad19, %l7 = 0000000000000000
	ldsha	[%i2+0x02c]%asi,%l7	! %l7 = 0000000000007aba
!	Mem[0000000010001410] = 00007a8de0ee5c89, %f6  = 28a88367 ffffffff
	ldda	[%i0+%o5]0x80,%f6 	! %f6  = 00007a8d e0ee5c89
!	Mem[0000000010141400] = 7abaad19, %l1 = 0000000067000000
	lduba	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000019
!	Mem[0000000030181400] = 000000ff, %l4 = 00000000f0e1cbc9
	ldsha	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f14 = 0000ff8d ffffffe3, Mem[00000000100c1408] = dfee3ea2 ffffe500
	stda	%f14,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000ff8d ffffffe3

p0_label_126:
!	Mem[00000000300c1400] = 0000004a, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 000000000000004a
!	%l6 = 00005691, %l7 = 00007aba, Mem[00000000300c1408] = ff00f1ff e0ee5c89
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00005691 00007aba
!	Mem[0000000030041408] = 1ab5fe2d, %l1 = 0000000000000019
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 0000002d000000ff
!	%l7 = 0000000000007aba, Mem[0000000010041400] = 260000ff
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = ba0000ff
!	%l7 = 0000000000007aba, Mem[00000000300c1408] = 91560000
	stha	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 7aba0000
!	%f4  = ff000000, Mem[0000000010081400] = 000000ff
	sta	%f4 ,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000
!	%l6 = 0000000000005691, Mem[00000000100c1408] = 8dff0000
	stha	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 8dff5691
!	Mem[0000000030101400] = e0000000, %l1 = 000000000000002d
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 000000e0000000ff
!	Mem[0000000010181420] = 00000000, %l1 = 00000000000000e0, %asi = 80
	swapa	[%i6+0x020]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 3e37f70f, %l3 = 000000000000004a
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 000000003e37f70f

p0_label_127:
!	Mem[0000000010001408] = ffffffff, %l5 = 00000000d6ffe47b
	lduba	[%i0+0x009]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001410] = 4a000000, %l2 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l2	! %l2 = 000000000000004a
!	Mem[0000000030081400] = 00000000, %l7 = 0000000000007aba
	ldsba	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = 0ff7373e, %l7 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l7	! %l7 = 000000000000003e
!	Mem[0000000030181410] = 00000000, %l4 = 00000000000000ff
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l5 = 00000000000000ff
	lduba	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = f0e1cbc9, %l4 = 0000000000000000
	ldsba	[%i1+0x010]%asi,%l4	! %l4 = fffffffffffffff0
!	Mem[00000000100c1408] = 8dff5691, %l2 = 000000000000004a
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffff91
!	Mem[0000000010041400] = ba0000ff, %f28 = e0000000
	lda	[%i1+%g0]0x80,%f28	! %f28 = ba0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = ff000026, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 00000000ff000026

p0_label_128:
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 00000000000000e0
	setx	0x04cd291784ff0394,%g7,%l0 ! %l0 = 04cd291784ff0394
!	%l1 = 0000000000000000
	setx	0xd4fe4d0020972cde,%g7,%l1 ! %l1 = d4fe4d0020972cde
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 04cd291784ff0394
	setx	0x6092bf8fbcab64e5,%g7,%l0 ! %l0 = 6092bf8fbcab64e5
!	%l1 = d4fe4d0020972cde
	setx	0x1ae19747b403bdaa,%g7,%l1 ! %l1 = 1ae19747b403bdaa
!	%l1 = 1ae19747b403bdaa, Mem[0000000010181408] = 6e17dfe9
	stha	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 6e17bdaa
!	%f7  = e0ee5c89, Mem[0000000030081408] = 1bc70000
	sta	%f7 ,[%i2+%o4]0x81	! Mem[0000000030081408] = e0ee5c89
!	%l2 = ffffffffffffff91, immed = 000000ef, %y  = 00000005
	umul	%l2,0x0ef,%l7		! %l7 = 000000eeffff985f, %y = 000000ee
!	%l3 = 000000003e37f70f, Mem[0000000030141410] = 260000ff
	stwa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 3e37f70f
!	%f23 = 9f89571e, Mem[00000000300c1400] = 00000000
	sta	%f23,[%i3+%g0]0x81	! Mem[00000000300c1400] = 9f89571e
!	%l2 = ffffffffffffff91, Mem[0000000010001400] = 19adba7a000000ff
	stxa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffffffffff91
!	%f25 = c4910c61, Mem[00000000300c1408] = 0000ba7a
	sta	%f25,[%i3+%o4]0x89	! Mem[00000000300c1408] = c4910c61
!	%f27 = 00000000, Mem[0000000010141410] = 00000000
	sta	%f27,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ba0000ff, %l5 = 00000000ff000026
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffba00

p0_label_129:
!	Mem[0000000010001410] = 00007a8de0ee5c89, %l7 = 000000eeffff985f
	ldxa	[%i0+0x010]%asi,%l7	! %l7 = 00007a8de0ee5c89
!	Mem[0000000010181410] = 00000000 c580bb9c, %l6 = 00005691, %l7 = e0ee5c89
	ldda	[%i6+0x010]%asi,%l6	! %l6 = 0000000000000000 00000000c580bb9c
!	Mem[00000000300c1400] = 1e57899f, %l0 = 6092bf8fbcab64e5
	ldsba	[%i3+%g0]0x89,%l0	! %l0 = ffffffffffffff9f
!	Mem[0000000030181400] = ff000000, %l7 = 00000000c580bb9c
	lduha	[%i6+%g0]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030181400] = ff000000, %l6 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l6	! %l6 = 000000000000ff00
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010181400] = 67000000 67000000 aabd176e 1ab5fe2d
!	Mem[0000000010181410] = 00000000 c580bb9c 2c27cb51 386059d7
!	Mem[0000000010181420] = 000000e0 000000f2 00000000 00001aff
!	Mem[0000000010181430] = e9df176e 00677121 22908d49 a6047f27
	ldda	[%i6]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010181400
!	Mem[0000000030001400] = 28baad19, %l0 = ffffffffffffff9f
	ldsba	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000028
!	Mem[0000000010081410] = ff00f1ce 00000000, %l0 = 00000028, %l1 = b403bdaa
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000ff00f1ce 0000000000000000
!	Mem[00000000211c0000] = ffff7001, %l3 = 000000003e37f70f
	ldub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 91ffffffffffffff, %l2 = ffffffffffffff91, %l5 = ffffffffffffba00
	casxa	[%i0]0x80,%l2,%l5	! %l5 = 91ffffffffffffff

p0_label_130:
!	%f16 = 28baad19 0ff7373e, Mem[0000000030101410] = ff7a0000 ff000000
	stda	%f16,[%i4+%o5]0x81	! Mem[0000000030101410] = 28baad19 0ff7373e
!	%f26 = 00000000 00000000, Mem[0000000010101438] = 67000000 498d9022
	std	%f26,[%i4+0x038]	! Mem[0000000010101438] = 00000000 00000000
!	Mem[0000000010181410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = ba0000ff, %l7 = 000000000000ff00
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 000000ba000000ff
!	%f26 = 00000000, Mem[0000000010081408] = cef10000
	sta	%f26,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%l2 = ffffff91, %l3 = 00000000, Mem[0000000010001408] = ffffffff 00000000
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffff91 00000000
!	%l3 = 0000000000000000, Mem[0000000030181410] = 3fed000000000000
	stxa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000000
!	Mem[0000000010001410] = 8d7a0000, %l0 = 00000000ff00f1ce
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = 67000000, %l5 = 91ffffffffffffff
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000067000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l4 = fffffffffffffff0
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_131:
!	Mem[0000000030041410] = 00000067, %f27 = 00000000
	lda	[%i1+%o5]0x89,%f27	! %f27 = 00000067
!	Mem[00000000211c0000] = ffff7001, %l1 = 0000000000000000
	ldub	[%o2+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010001428] = d3844c6900000000, %l5 = 0000000000000067
	ldx	[%i0+0x028],%l5		! %l5 = d3844c6900000000
!	Mem[0000000010181400] = ff00000067000000, %l3 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l3	! %l3 = ff00000067000000
!	Mem[0000000010181410] = ff000000, %l6 = 000000000000ff00
	lduwa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010001418] = ffffffc1, %l7 = 00000000000000ba
	ldub	[%i0+0x019],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030181400] = ff000000c6960309, %l2 = ffffffffffffff91
	ldxa	[%i6+%g0]0x81,%l2	! %l2 = ff000000c6960309
!	Mem[0000000010141410] = 00000000, %l2 = ff000000c6960309
	ldsha	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = ff000000, %l3 = ff00000067000000
	ldswa	[%i6+%g0]0x81,%l3	! %l3 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = f0e1cbc9, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 00000000f0e1cbc9

p0_label_132:
	membar	#Sync			! Added by membar checker (22)
!	%l7 = 00000000000000ff, Mem[0000000010181421] = 000000e0, %asi = 80
	stba	%l7,[%i6+0x021]%asi	! Mem[0000000010181420] = 00ff00e0
!	%f18 = 00000000 ff00ff0d, Mem[00000000300c1408] = c4910c61 00007aba
	stda	%f18,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 ff00ff0d
!	Mem[0000000030081408] = e0ee5c89, %l1 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 000000e0000000ff
!	%l0 = 0000000000000000, Mem[0000000030101400] = ff000000
	stha	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%l0 = 00000000, %l1 = 000000e0, Mem[0000000030041408] = fffeb51a 00000000
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 000000e0
!	Mem[0000000010001410] = ff007a8d, %l5 = d3844c6900000000
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 00000000ff007a8d
!	Mem[0000000030101400] = 00000000, %l3 = ffffffffff000000
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%f20 = 00000000 00000067, Mem[0000000030181408] = 000000ff 00ff00e3
	stda	%f20,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 00000067
!	Mem[00000000100c1408] = 8dff5691, %l5 = 00000000ff007a8d
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 00000091000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff000000c580bb9c, %l2 = 00000000f0e1cbc9
	ldxa	[%i6+%o5]0x80,%l2	! %l2 = ff000000c580bb9c

p0_label_133:
!	Mem[0000000030081400] = 00000000, %l2 = ff000000c580bb9c
	lduha	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l2 = 0000000000000000
	lduha	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = ffffff91, %l0 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000091
!	Mem[0000000030001400] = 28baad19 0ff7373e, %l4 = 00000000, %l5 = 00000091
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 0000000028baad19 000000000ff7373e
!	Mem[0000000020800040] = ffeccbdb, %l6 = 00000000ff000000
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = ffffffffffffffec
!	Mem[0000000010001410] = 00000000, %l3 = 0000000000000000
	lduha	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001420] = 6cc81d7e, %l3 = 0000000000000000
	ldsw	[%i0+0x020],%l3		! %l3 = 000000006cc81d7e
!	Mem[00000000201c0000] = 5691826e, %l1 = 00000000000000e0
	ldsb	[%o0+0x001],%l1		! %l1 = ffffffffffffff91
!	%l3 = 000000006cc81d7e, Mem[0000000030001410] = 4a000000
	stba	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 7e000000
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffffec, Mem[00000000201c0000] = 5691826e, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffec826e

p0_label_134:
!	%f27 = 00000067, Mem[0000000030041410] = 67000000
	sta	%f27,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000067
!	%l2 = 00000000, %l3 = 6cc81d7e, Mem[0000000010101408] = 00000000 895ceee0
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 6cc81d7e
!	Mem[0000000010101400] = 00000000, %l1 = ffffffffffffff91
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = 67000000, %l0 = 0000000000000091
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 0000000067000000
!	Mem[0000000030141410] = 0ff7373e, %l0 = 0000000067000000
	swapa	[%i5+%o5]0x81,%l0	! %l0 = 000000000ff7373e
!	Mem[0000000030141408] = 000000e0, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000e0
!	%f18 = 00000000 ff00ff0d, Mem[00000000300c1410] = 000000ff 00005691
	stda	%f18,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 ff00ff0d
!	Mem[0000000030001408] = 000000ff, %l6 = ffffffffffffffec
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041410] = 00000000, %l3 = 000000006cc81d7e, %asi = 80
	swapa	[%i1+0x010]%asi,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141428] = 0862378e, %l4 = 0000000028baad19
	ldsb	[%i5+0x029],%l4		! %l4 = 0000000000000062

p0_label_135:
!	Mem[0000000030101408] = b70a210d 00000000, %l4 = 00000062, %l5 = 0ff7373e
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000 00000000b70a210d
!	Mem[00000000100c141c] = ffffffff, %l0 = 000000000ff7373e
	lduh	[%i3+0x01c],%l0		! %l0 = 000000000000ffff
!	Mem[00000000100c1430] = 1ab5e6dc ff7a0000, %l2 = 000000e0, %l3 = 00000000
	ldd	[%i3+0x030],%l2		! %l2 = 000000001ab5e6dc 00000000ff7a0000
!	Mem[00000000100c1400] = 00000000, %l0 = 000000000000ffff
	ldsba	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = ff0000ff, %l1 = 0000000000000000
	ldsha	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffff00
!	Code Fragment 3
p0_fragment_12:
!	%l0 = 0000000000000000
	setx	0x4c42ef6f99a77564,%g7,%l0 ! %l0 = 4c42ef6f99a77564
!	%l1 = ffffffffffffff00
	setx	0x0c6cc4387fd782c2,%g7,%l1 ! %l1 = 0c6cc4387fd782c2
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4c42ef6f99a77564
	setx	0xda3b20d7efc080e0,%g7,%l0 ! %l0 = da3b20d7efc080e0
!	%l1 = 0c6cc4387fd782c2
	setx	0xc4653fefef53a248,%g7,%l1 ! %l1 = c4653fefef53a248
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010181400] = ff000000 67000000 aabd176e 1ab5fe2d
!	Mem[0000000010181410] = ff000000 c580bb9c 2c27cb51 386059d7
!	Mem[0000000010181420] = 00ff00e0 000000f2 00000000 00001aff
!	Mem[0000000010181430] = e9df176e 00677121 22908d49 a6047f27
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[0000000010001410] = 00000000 e0ee5c89, %l2 = 1ab5e6dc, %l3 = ff7a0000
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000 00000000e0ee5c89
!	Mem[0000000010181410] = ff000000, %l3 = 00000000e0ee5c89
	lduw	[%i6+%o5],%l3		! %l3 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%f4  = 9cbb80c5, Mem[0000000030141408] = 00000000
	sta	%f4 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 9cbb80c5

p0_label_136:
!	Mem[0000000020800040] = ffeccbdb, %l0 = da3b20d7efc080e0
	ldstub	[%o1+0x040],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000030181408] = 00000000, %l6 = 00000000000000ff
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010041410] = 6cc81d7ed6ffe47b
	stxa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000000
!	%l1 = c4653fefef53a248, imm = fffffffffffff8b4, %l6 = 0000000000000000
	xnor	%l1,-0x74c,%l6		! %l6 = c4653fefef53a503
	membar	#Sync			! Added by membar checker (24)
!	%l1 = c4653fefef53a248, Mem[0000000010181400] = 000000ff
	stha	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000a248
!	%l0 = 000000ff, %l1 = ef53a248, Mem[0000000030101408] = 00000000 0d210ab7
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff ef53a248
!	%f26 = 00000000, Mem[00000000100c1410] = 000000e0
	sta	%f26,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l4 = 0000000000000000, %l0 = 00000000000000ff, %l1 = c4653fefef53a248
	subc	%l4,%l0,%l1		! %l1 = ffffffffffffff01
!	Mem[0000000030101400] = 000000ff, %l1 = ffffffffffffff01
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 91000000 00000000, %l4 = 00000000, %l5 = b70a210d
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 0000000091000000 0000000000000000

p0_label_137:
!	Mem[0000000030101400] = 000094d4 ffffff01, %l6 = ef53a503, %l7 = 000000ff
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 00000000ffffff01 00000000000094d4
!	Mem[0000000010041428] = bedae363380ea27e, %l5 = 0000000000000000
	ldxa	[%i1+0x028]%asi,%l5	! %l5 = bedae363380ea27e
!	Mem[000000001014141c] = f167c7e3, %l4 = 0000000091000000
	lduwa	[%i5+0x01c]%asi,%l4	! %l4 = 00000000f167c7e3
!	Mem[0000000030141410] = 00000067, %l5 = bedae363380ea27e
	lduha	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000067
!	Mem[0000000010041418] = 4cc17a8d, %f13 = 6e17dfe9
	ld	[%i1+0x018],%f13	! %f13 = 4cc17a8d
!	Mem[0000000010141410] = 00000000, %l3 = 00000000ff000000
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 00000000 ff00ff0d, %l6 = ffffff01, %l7 = 000094d4
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 00000000ff00ff0d 0000000000000000
!	Mem[0000000030141408] = 9cbb80c5, %l5 = 0000000000000067
	ldswa	[%i5+%o4]0x81,%l5	! %l5 = ffffffff9cbb80c5
!	%f29 = 00677121, %f20 = ff000000
	fcmps	%fcc1,%f29,%f20		! %fcc1 = 2
!	Starting 10 instruction Store Burst
!	%f21 = c580bb9c, Mem[00000000100c1408] = 8dff56ff
	sta	%f21,[%i3+%o4]0x88	! Mem[00000000100c1408] = c580bb9c

p0_label_138:
!	%l1 = 00000000000000ff, Mem[0000000010001422] = 6cc81d7e, %asi = 80
	stba	%l1,[%i0+0x022]%asi	! Mem[0000000010001420] = 6cc8ff7e
!	%l6 = 00000000ff00ff0d, Mem[0000000010001400] = 91ffffff
	stba	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 0dffffff
!	Mem[0000000010141408] = f9254e70, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x008]%asi,%l0	! %l0 = 00000000f9254e70
!	%l3 = 0000000000000000, Mem[00000000300c1408] = 0dff00ff
	stwa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%l6 = 00000000ff00ff0d, Mem[0000000010041410] = 0000000000000000
	stxa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000ff00ff0d
!	%l3 = 0000000000000000, %l7 = 0000000000000000, %l4 = 00000000f167c7e3
	orn	%l3,%l7,%l4		! %l4 = ffffffffffffffff
!	%l0 = f9254e70, %l1 = 000000ff, Mem[00000000100c1410] = 00000000 00000067
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = f9254e70 000000ff
!	%f24 = 00ff00e0 000000f2, %l2 = 0000000000000000
!	Mem[0000000030141418] = f927f3d86025bc2d
	add	%i5,0x018,%g1
	stda	%f24,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030141418] = f927f3d86025bc2d
!	%l0 = 00000000f9254e70, Mem[0000000030001400] = 28baad19
	stba	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 70baad19
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff0000001e57899f, %f14 = 277f04a6 498d9022
	ldda	[%i3+%g0]0x89,%f14	! %f14 = ff000000 1e57899f

p0_label_139:
!	Mem[00000000300c1400] = 9f89571e, %l7 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l7	! %l7 = 0000000000009f89
!	Mem[0000000021800040] = 03ff34f9, %l6 = 00000000ff00ff0d
	ldsba	[%o3+0x040]%asi,%l6	! %l6 = 0000000000000003
!	Mem[0000000030001408] = ecffffff, %f0  = 00000067
	lda	[%i0+%o4]0x81,%f0 	! %f0 = ecffffff
!	Mem[0000000030081400] = 00000067 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000 0000000000000067
!	Mem[0000000010141400] = 19adba7a, %l5 = ffffffff9cbb80c5
	lduh	[%i5+%g0],%l5		! %l5 = 00000000000019ad
!	%l4 = ffffffffffffffff, imm = 0000000000000f80, %l3 = 0000000000000067
	xor	%l4,0xf80,%l3		! %l3 = fffffffffffff07f
!	Mem[00000000100c1408] = 9cbb80c5, %l0 = 00000000f9254e70
	lduha	[%i3+%o4]0x80,%l0	! %l0 = 0000000000009cbb
!	Mem[0000000010041408] = a4000067, %l7 = 0000000000009f89
	lduha	[%i1+%o4]0x80,%l7	! %l7 = 000000000000a400
!	Mem[0000000010101408] = 00000000, %l7 = 000000000000a400
	lduha	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 000000ff, %l5 = 00000000000019ad
	swapa	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff

p0_label_140:
!	Mem[0000000030181410] = 00000000, %l4 = ffffffffffffffff
	swapa	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l7 = 0000000000000000, Mem[000000001010143c] = 00000000, %asi = 80
	stha	%l7,[%i4+0x03c]%asi	! Mem[000000001010143c] = 00000000
!	%f29 = 00677121, Mem[0000000010001408] = ffffff91
	sta	%f29,[%i0+%o4]0x88	! Mem[0000000010001408] = 00677121
!	%l0 = 0000000000009cbb, Mem[0000000010041424] = 2e1171cd
	sth	%l0,[%i1+0x024]		! Mem[0000000010041424] = 9cbb71cd
!	%l4 = 0000000000000000, Mem[0000000030041410] = 91000000
	stha	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%l1 = 00000000000000ff, Mem[0000000030141410] = 6700000098b2e1d6
	stxa	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000000000ff
!	%l0 = 00009cbb, %l1 = 000000ff, Mem[0000000010141438] = f0e458ff e8ff7105
	stda	%l0,[%i5+0x038]%asi	! Mem[0000000010141438] = 00009cbb 000000ff
!	%f24 = 00ff00e0 000000f2, Mem[0000000030081400] = 00000000 67000000
	stda	%f24,[%i2+%g0]0x81	! Mem[0000000030081400] = 00ff00e0 000000f2
!	%l4 = 0000000000000000, Mem[0000000030181400] = 000000ff
	stha	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000ff, %l0 = 0000000000009cbb
	ldswa	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000ff

p0_label_141:
!	Mem[0000000030141408] = 9cbb80c5, %f9  = e0000000
	lda	[%i5+%o4]0x81,%f9 	! %f9 = 9cbb80c5
!	%f17 = 67000000, %f11 = 00000000
	fcmpes	%fcc0,%f17,%f11		! %fcc0 = 2
!	Mem[00000000201c0000] = ffec826e, %l1 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffec
!	Mem[0000000030041400] = 0ff7373e, %l7 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l7	! %l7 = 000000000000003e
!	Mem[0000000010181408] = 2dfeb51a 6e17bdaa, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 000000006e17bdaa 000000002dfeb51a
!	Mem[0000000010041410] = ff00ff0d, %l3 = fffffffffffff07f
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = 000000000000000d
!	Mem[0000000030041410] = 00000000, %l1 = ffffffffffffffec
	lduwa	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c140c] = ffffffe3, %l4 = 000000006e17bdaa
	lduw	[%i3+0x00c],%l4		! %l4 = 00000000ffffffe3
!	Mem[0000000010001410] = 00000000, %l2 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f20 = ff000000, Mem[0000000010001408] = 21716700
	sta	%f20,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000

p0_label_142:
!	%l0 = 00000000000000ff, Mem[0000000010101410] = cef10000
	stba	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = fff10000
!	%l5 = 000000002dfeb51a, Mem[0000000010181400] = 48a20000
	stba	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 1aa20000
!	%f5  = 00000000, Mem[0000000010141410] = 00000000
	sta	%f5 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%l1 = 0000000000000000, Mem[00000000100c1412] = f9254e70, %asi = 80
	stba	%l1,[%i3+0x012]%asi	! Mem[00000000100c1410] = f9250070
!	%f12 = 21716700, Mem[0000000030181410] = ffffffff
	sta	%f12,[%i6+%o5]0x81	! Mem[0000000030181410] = 21716700
!	%l2 = 0000000000000000, Mem[0000000030001410] = 7e000000
	stwa	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%f9  = 9cbb80c5, Mem[00000000300c1400] = 1e57899f
	sta	%f9 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 9cbb80c5
!	%l5 = 000000002dfeb51a, Mem[00000000100c1400] = 00000000
	stba	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000001a
!	Mem[0000000030001400] = 19adba70, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 00000070000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = aaf25d9a, %l1 = 0000000000000000
	ldsb	[%i4+0x022],%l1		! %l1 = 000000000000005d

p0_label_143:
!	Mem[0000000010101400] = 91ffffff, %l2 = 0000000000000070
	ldsha	[%i4+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101408] = 000000006cc81d7e, %f8  = f2000000 9cbb80c5
	ldda	[%i4+%o4]0x80,%f8 	! %f8  = 00000000 6cc81d7e
!	%l3 = 000000000000000d, imm = 0000000000000a20, %l1 = 000000000000005d
	sub	%l3,0xa20,%l1		! %l1 = fffffffffffff5ed
!	Mem[0000000010101408] = 00000000, %l7 = 000000000000003e
	lduba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 700025f9, %l3 = 000000000000000d
	lduha	[%i3+%o5]0x88,%l3	! %l3 = 00000000000025f9
!	Mem[00000000100c1410] = f9250070, %l0 = 00000000000000ff
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = fffffffff9250070
!	Mem[0000000030181410] = 21716700, %l1 = fffffffffffff5ed
	ldsha	[%i6+%o5]0x81,%l1	! %l1 = 0000000000002171
!	Mem[0000000010001410] = 00000000, %l7 = 0000000000000000
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%l3 = 00000000000025f9, Mem[0000000020800040] = ffeccbdb
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 25f9cbdb
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000030181408] = ff00000000000067
	stxa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffffffffffff

p0_label_144:
!	Mem[0000000021800141] = 00671f70, %l5 = 000000002dfeb51a
	ldstuba	[%o3+0x141]%asi,%l5	! %l5 = 00000067000000ff
!	Mem[000000001018143c] = a6047f27, %l7 = 0000000000000000
	swap	[%i6+0x03c],%l7		! %l7 = 00000000a6047f27
!	%l4 = ffffffe3, %l5 = 00000067, Mem[0000000010001400] = 0dffffff ffffffff
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffe3 00000067
!	Mem[0000000010141410] = 00000000, %l2 = ffffffffffffffff
	swap	[%i5+%o5],%l2		! %l2 = 0000000000000000
!	%l6 = 0000000000000003, Mem[0000000010001400] = 67000000e3ffffff
	stxa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000003
!	Mem[0000000030081410] = ff0000ff, %l5 = 0000000000000067
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%l0 = fffffffff9250070, Mem[0000000010081404] = 00000000
	sth	%l0,[%i2+0x004]		! Mem[0000000010081404] = 00700000
!	Mem[0000000030181400] = 00000000, %l6 = 0000000000000003
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000010181408] = aabd176e
	stba	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = ffbd176e
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 48a253efff000000, %f28 = e9df176e 00677121
	ldda	[%i4+%o4]0x89,%f28	! %f28 = 48a253ef ff000000

p0_label_145:
!	Mem[0000000010181410] = ad190000, %f3  = 6e17bdaa
	lda	[%i6+%o5]0x80,%f3 	! %f3 = ad190000
!	Mem[0000000030101410] = 28baad190ff7373e, %f0  = ecffffff 00000067
	ldda	[%i4+%o5]0x81,%f0 	! %f0  = 28baad19 0ff7373e
!	%l2 = 0000000000000000, imm = 000000000000031b, %l6 = 0000000000000000
	xor	%l2,0x31b,%l6		! %l6 = 000000000000031b
!	Mem[00000000100c1400] = 1a000000, %l6 = 000000000000031b
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = 0000000000001a00
!	Mem[0000000030141400] = 00000000, %l6 = 0000000000001a00
	ldsha	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = ffffffff, %l4 = 00000000ffffffe3
	ldsh	[%i5+0x012],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030101410] = 28baad19 0ff7373e, %l2 = 00000000, %l3 = 000025f9
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 0000000028baad19 000000000ff7373e
!	Mem[000000001014143c] = 000000ff, %l0 = fffffffff9250070
	ldsb	[%i5+0x03f],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010101408] = 00000000, %f3  = ad190000
	lda	[%i4+%o4]0x80,%f3 	! %f3 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = ffffffff, %l0 = ffffffffffffffff
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 000000ff000000ff

p0_label_146:
!	%l6 = 00000000, %l7 = a6047f27, Mem[0000000010141408] = 000000ff 5a64ed3f
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 a6047f27
!	%l6 = 0000000000000000, Mem[0000000030041400] = 3e37f70f
	stba	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 0037f70f
!	%l7 = 00000000a6047f27, Mem[0000000030181410] = 21716700
	stha	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 7f276700
!	%l3 = 000000000ff7373e, Mem[0000000010001408] = ff000000
	stba	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 3e000000
!	Mem[0000000010101410] = 0000f1ff, %l7 = 00000000a6047f27
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 000000000000f1ff
!	%l5 = 00000000000000ff, Mem[0000000030001400] = ffbaad190ff7373e
	stxa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000ff
!	Mem[0000000021800001] = 003ffa80, %l7 = 000000000000f1ff
	ldstub	[%o3+0x001],%l7		! %l7 = 0000003f000000ff
!	Mem[0000000030001408] = ecffffff, %l0 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 000000ec000000ff
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000030081400] = 00ff00e0 000000f2
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffffffff, %l0 = 00000000000000ec
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = ffffffffffffffff

p0_label_147:
!	Mem[0000000010181400] = 000000670000a21a, %f16 = ff000000 67000000
	ldda	[%i6+%g0]0x88,%f16	! %f16 = 00000067 0000a21a
!	Mem[0000000010101400] = 91ffffff, %l3 = 000000000ff7373e
	lduwa	[%i4+%g0]0x88,%l3	! %l3 = 0000000091ffffff
!	Mem[0000000010041400] = ff0000ff, %f27 = 00001aff
	lda	[%i1+%g0]0x88,%f27	! %f27 = ff0000ff
!	Mem[0000000010141400] = 19adba7a00000028, %f30 = 22908d49 a6047f27
	ldda	[%i5+%g0]0x80,%f30	! %f30 = 19adba7a 00000028
!	Mem[0000000030101410] = 19adba28, %l1 = 0000000000002171
	ldsba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000028
!	Mem[0000000030081410] = ff0000ff00000000, %l5 = 00000000000000ff
	ldxa	[%i2+%o5]0x81,%l5	! %l5 = ff0000ff00000000
!	Mem[0000000030141400] = 00000000, %l5 = ff0000ff00000000
	ldswa	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = ff0000ff, %l5 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000030041400] = 0037f70f 19adba28 00000000 000000e0
!	Mem[0000000030041410] = 00000000 00000000 1e57899f 704e25f9
!	Mem[0000000030041420] = 610c91c4 a23eeedf 00000000 00000000
!	Mem[0000000030041430] = 000094d4 000000e0 66a89750 51b3147f
	ldda	[%i1]ASI_BLK_SL,%f16	! Block Load from 0000000030041400
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (26)
!	%l1 = 0000000000000028, Mem[0000000030041408] = 00000000
	stwa	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000028

p0_label_148:
!	%l5 = 00000000000000ff, Mem[0000000030141400] = 00000000
	stwa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff
!	Mem[0000000030041410] = 00000000, %l0 = ffffffffffffffff
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%f12 = 21716700 4cc17a8d, Mem[0000000030181408] = ffffffff ffffffff
	stda	%f12,[%i6+%o4]0x81	! Mem[0000000030181408] = 21716700 4cc17a8d
!	%l2 = 0000000028baad19, Mem[0000000010041410] = ff00ff0d
	stba	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ff00ff19
!	Mem[0000000010141410] = ffffffff, %l0 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010001400] = 00000003, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000003
!	%l5 = 00000000000000ff, Mem[0000000010101408] = 00000000
	stba	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000
!	%l7 = 000000000000003f, Mem[00000000300c1410] = 0dff00ff
	stwa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000003f
!	%f16 = 28baad19 0ff73700, %l2 = 0000000028baad19
!	Mem[0000000010181408] = ffbd176e1ab5fe2d
	add	%i6,0x008,%g1
	stda	%f16,[%g1+%l2]ASI_PST32_P ! Mem[0000000010181408] = ffbd176e0ff73700
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 0037f70f, %l7 = 000000000000003f
	ldsba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000

p0_label_149:
!	%l0 = 00000000ffffffff, imm = 000000000000089c, %l4 = ffffffffffffffff
	add	%l0,0x89c,%l4		! %l4 = 000000010000089b
!	Mem[0000000030181400] = 000000ff, %l6 = 0000000000000003
	lduwa	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041418] = 4cc17a8d, %l0 = 00000000ffffffff
	lduba	[%i1+0x018]%asi,%l0	! %l0 = 000000000000004c
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000030181400] = ff000000 c6960309 21716700 4cc17a8d
!	Mem[0000000030181410] = 7f276700 00000000 f927f3d8 6025bc2d
!	Mem[0000000030181420] = b4e5a795 5a64ed3f cef18dd7 28a88367
!	Mem[0000000030181430] = 9ae99a45 0ff7373e 39307cef cc174fb6
	ldda	[%i6]ASI_BLK_SL,%f0	! Block Load from 0000000030181400
!	Mem[0000000030081408] = 895ceeff, %l7 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l7	! %l7 = ffffffffffffeeff
!	Mem[0000000030001410] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800000] = 00fffa80, %l6 = 00000000000000ff
	lduba	[%o3+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = ffffffff, %l4 = 000000010000089b
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010041408] = 670000a4, %l6 = 00000000000000ff
	ldswa	[%i1+%o4]0x88,%l6	! %l6 = 00000000670000a4
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (28)
!	%l4 = 000000000000ffff, Mem[0000000030181410] = 7f276700
	stwa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000ffff

p0_label_150:
!	Mem[0000000030041408] = 00000028, %l4 = 000000000000ffff
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 00000028000000ff
!	%l0 = 000000000000004c, Mem[0000000030001408] = ffffffff
	stwa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000004c
!	%f30 = 7f14b351 5097a866, Mem[0000000010181438] = 22908d49 00000000
	std	%f30,[%i6+0x038]	! Mem[0000000010181438] = 7f14b351 5097a866
!	%l2 = 0000000028baad19, %l3 = 0000000091ffffff, %l4 = 0000000000000028
	xnor	%l2,%l3,%l4		! %l4 = ffffffff46baad19
!	%l2 = 0000000028baad19, Mem[0000000010001410] = 00000000
	stba	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000019
!	%f24 = dfee3ea2 c4910c61, Mem[0000000010001408] = 3e000000 00000000
	stda	%f24,[%i0+%o4]0x80	! Mem[0000000010001408] = dfee3ea2 c4910c61
!	%l0 = 000000000000004c, Mem[00000000100c1400] = 1a000000
	stwa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000004c
!	%l0 = 000000000000004c, Mem[00000000201c0000] = ffec826e
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 4cec826e
!	Mem[0000000030181410] = ffff0000, %l3 = 0000000091ffffff
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000, %l6 = 00000000670000a4
	lduha	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_151:
!	%l0 = 000000000000004c, %l1 = 0000000000000028, %y  = 000000ee
	sdiv	%l0,%l1,%l0		! %l0 = 000000007fffffff
	mov	%l0,%y			! %y = 7fffffff
!	Mem[00000000100c1400] = 0000004c, %l6 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = ffffffff, %l2 = 0000000028baad19
	ldsba	[%i1+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181400] = 000000ff, %f3  = 00677121
	lda	[%i6+%g0]0x89,%f3 	! %f3 = 000000ff
!	Mem[0000000030101400] = 000094d4ffffff01, %l4 = ffffffff46baad19
	ldxa	[%i4+%g0]0x89,%l4	! %l4 = 000094d4ffffff01
!	Mem[0000000010001428] = d3844c69, %l3 = 0000000000000000
	ldsb	[%i0+0x02a],%l3		! %l3 = 000000000000004c
!	Mem[0000000021800080] = a3f2944f, %l0 = 000000007fffffff
	ldsha	[%o3+0x080]%asi,%l0	! %l0 = ffffffffffffa3f2
!	%l1 = 0000000000000028, %l6 = 0000000000000000, %l6 = 0000000000000000
	xnor	%l1,%l6,%l6		! %l6 = ffffffffffffffd7
!	Mem[0000000010001410] = 19000000, %l1 = 0000000000000028
	ldsba	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000019
!	Starting 10 instruction Store Burst
!	%f29 = d4940000, Mem[0000000010141400] = 7abaad19
	sta	%f29,[%i5+%g0]0x88	! Mem[0000000010141400] = d4940000

p0_label_152:
!	%l0 = ffffffffffffa3f2, Mem[0000000010101427] = 0a1de4e8
	stb	%l0,[%i4+0x027]		! Mem[0000000010101424] = 0a1de4f2
!	Mem[0000000030141410] = ff00000000000000, %l6 = ffffffffffffffd7
	ldxa	[%i5+%o5]0x89,%l6	! %l6 = ff00000000000000
!	Mem[0000000010001410] = 19000000, %l7 = ffffffffffffeeff
	swapa	[%i0+%o5]0x80,%l7	! %l7 = 0000000019000000
!	%l4 = ffffff01, %l5 = 00000000, Mem[0000000030001410] = 00000000 67000000
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffff01 00000000
!	%l0 = ffffa3f2, %l1 = 00000019, Mem[0000000010181410] = ad190000 c580bb9c
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffa3f2 00000019
!	Mem[0000000010081410] = ff00f1ce, %l7 = 0000000019000000
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030081408] = ffee5c89, %l6 = ff00000000000000
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 00000000ffee5c89
!	%l7 = 00000000000000ff, Mem[0000000010081400] = ff000000, %asi = 80
	stha	%l7,[%i2+0x000]%asi	! Mem[0000000010081400] = 00ff0000
!	Mem[00000000300c1400] = c580bb9c, %l7 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 00000000c580bb9c
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffff8ed8, %l6 = 00000000ffee5c89
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffffff

p0_label_153:
!	Mem[000000001004141c] = 000000ff, %l3 = 000000000000004c
	ldsw	[%i1+0x01c],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l6 = ffffffffffffffff
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = ffffffff, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081438] = fffff842 91560000, %l2 = ffffffff, %l3 = 000000ff
	ldda	[%i2+0x038]%asi,%l2	! %l2 = 00000000fffff842 0000000091560000
!	Mem[0000000030101410] = 28baad19, %l2 = 00000000fffff842
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000028
!	Mem[00000000100c1410] = f9250070, %l5 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 00000000f9250070
!	Mem[0000000010001400] = 0000000000000000, %l1 = 0000000000000019
	ldxa	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = dfee3ea2c4910c61, %f0  = 090396c6 000000ff
	ldda	[%i0+0x008]%asi,%f0 	! %f0  = dfee3ea2 c4910c61
!	Mem[00000000300c1400] = ff000000ff000000, %f0  = dfee3ea2 c4910c61
	ldda	[%i3+%g0]0x89,%f0 	! %f0  = ff000000 ff000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000091560000, Mem[00000000218001c1] = ffff37e3, %asi = 80
	stba	%l3,[%o3+0x1c1]%asi	! Mem[00000000218001c0] = ff0037e3

p0_label_154:
!	%l2 = 0000000000000028, Mem[0000000030141400] = ff000000
	stha	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ff000028
!	%f17 = 0ff73700, Mem[0000000010001410] = ffeeffff
	sta	%f17,[%i0+%o5]0x88	! Mem[0000000010001410] = 0ff73700
!	%l2 = 00000028, %l3 = 91560000, Mem[0000000030041408] = 000000ff e0000000
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000028 91560000
!	%l1 = 0000000000000000, Mem[0000000021800140] = 00ff1f70
	sth	%l1,[%o3+0x140]		! Mem[0000000021800140] = 00001f70
!	Mem[0000000030101400] = 01ffffff, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 0000000001ffffff
!	%f16 = 28baad19 0ff73700 e0000000 00000000
!	%f20 = 00000000 00000000 f9254e70 9f89571e
!	%f24 = dfee3ea2 c4910c61 00000000 00000000
!	%f28 = e0000000 d4940000 7f14b351 5097a866
	stda	%f16,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
!	%f12 = 3e37f70f 459ae99a, Mem[0000000010081400] = 0000ff00 00007000
	stda	%f12,[%i2+%g0]0x88	! Mem[0000000010081400] = 3e37f70f 459ae99a
!	Mem[0000000010081423] = 00000000, %l0 = ffffffffffffa3f2
	ldstub	[%i2+0x023],%l0		! %l0 = 00000000000000ff
!	%l5 = 00000000f9250070, Mem[00000000300c1408] = 00000000
	stwa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = f9250070
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000094d400000028, %l0 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l0	! %l0 = 000094d400000028

p0_label_155:
!	Mem[0000000030041408] = 28000000, %l1 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l1	! %l1 = 0000000028000000
!	Mem[0000000030041410] = ffffffff, %f4  = 00000000
	lda	[%i1+%o5]0x89,%f4 	! %f4 = ffffffff
!	Mem[0000000010081428] = b4e5a7957abaad19, %l6 = 0000000001ffffff
	ldxa	[%i2+0x028]%asi,%l6	! %l6 = b4e5a7957abaad19
!	Mem[0000000010081410] = cef100ff, %l3 = 0000000091560000
	ldsha	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081408] = 000000006f84f752, %f10 = 6783a828 d78df1ce
	ldda	[%i2+%o4]0x80,%f10	! %f10 = 00000000 6f84f752
!	Mem[0000000010141408] = 00000000, %l1 = 0000000028000000
	ldsba	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%f13 = 459ae99a, %f7  = d8f327f9, %f11 = 6f84f752
	fmuls	%f13,%f7 ,%f11		! %f11 = df1323ed
!	Mem[0000000010081400] = 3e37f70f459ae99a, %f2  = 8d7ac14c 000000ff
	ldda	[%i2+%g0]0x88,%f2 	! %f2  = 3e37f70f 459ae99a
!	Mem[0000000030101400] = 000000ff, %f4  = ffffffff
	lda	[%i4+%g0]0x81,%f4 	! %f4 = 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001434] = 00000000, %l1 = 00000000, %l6 = 7abaad19
	add	%i0,0x34,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 0000000000000000

p0_label_156:
!	%l5 = 00000000f9250070, Mem[00000000100c1400] = 4c000000
	stba	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 4c000070
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010101400] = 0037f70f, %l5 = 00000000f9250070
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 000000000037f70f
!	%l6 = 0000000000000000, Mem[0000000030141410] = 00000000000000ff
	stxa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000000
!	%f2  = 3e37f70f 459ae99a, Mem[0000000030001410] = ffffff01 00000000
	stda	%f2 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 3e37f70f 459ae99a
!	%l2 = 00000028, %l3 = 000000ff, Mem[0000000030081400] = ffffffff 000000ff
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000028 000000ff
!	%l0 = 000094d400000028, imm = 0000000000000f02, %l0 = 000094d400000028
	andn	%l0,0xf02,%l0		! %l0 = 000094d400000028
!	Mem[0000000010181400] = 0000a21a, %l2 = 0000000000000028
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 000000000000a21a
!	%l4 = 000094d4ffffff01, Mem[0000000010001410] = 0ff73700
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffff01
!	%f23 = 9f89571e, Mem[0000000030101408] = ff000000
	sta	%f23,[%i4+%o4]0x89	! Mem[0000000030101408] = 9f89571e
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = 6cc8ff7e, %l2 = 000000000000a21a
	lduw	[%i0+0x020],%l2		! %l2 = 000000006cc8ff7e

p0_label_157:
!	Mem[0000000030041400] = 0037f70f, %l6 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = 000000000037f70f
!	Mem[00000000211c0000] = ffff7001, %l6 = 000000000037f70f
	ldsb	[%o2+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030081400] = 28000000, %l4 = 000094d4ffffff01
	lduha	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 7000004c c9cbe1f0 9cbb80c5 ffffffe3
!	Mem[00000000100c1410] = 00000000 000000ff 28a88367 ffffffff
!	Mem[00000000100c1420] = 00ff03ff 00000000 0000f1ce 8d7a0000
!	Mem[00000000100c1430] = 1ab5e6dc ff7a0000 0000ff8d ffffffe3
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000010041408] = a4000067, %l5 = 000000000037f70f
	lduwa	[%i1+%o4]0x80,%l5	! %l5 = 00000000a4000067
!	Mem[0000000030041408] = 2800000000005691, %f22 = f9254e70 9f89571e
	ldda	[%i1+%o4]0x81,%f22	! %f22 = 28000000 00005691
!	Mem[0000000010041400] = 98b2e1d6ff0000ff, %l5 = 00000000a4000067
	ldxa	[%i1+%g0]0x88,%l5	! %l5 = 98b2e1d6ff0000ff
!	%l3 = 00000000000000ff, immed = 00000a2d, %y  = 7fffffff
	sdiv	%l3,0xa2d,%l0		! %l0 = 000000007fffffff
	mov	%l0,%y			! %y = 7fffffff
!	Mem[000000001018143c] = 5097a866, %l5 = 98b2e1d6ff0000ff
	ldsh	[%i6+0x03c],%l5		! %l5 = 0000000000005097
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (30)
!	%f18 = e0000000, Mem[00000000100c1408] = 9cbb80c5
	st	%f18,[%i3+%o4]		! Mem[00000000100c1408] = e0000000

p0_label_158:
!	%f8  = 00ff03ff 00000000, Mem[0000000010141430] = ff7a622f f9664594
	std	%f8 ,[%i5+0x030]	! Mem[0000000010141430] = 00ff03ff 00000000
!	%l2 = 6cc8ff7e, %l3 = 000000ff, Mem[0000000010001400] = 00000000 00000000
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 6cc8ff7e 000000ff
!	%l1 = 0000000000000000, Mem[0000000010181400] = 00000028
	stba	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%f16 = 28baad19 0ff73700 e0000000 00000000
!	%f20 = 00000000 00000000 28000000 00005691
!	%f24 = dfee3ea2 c4910c61 00000000 00000000
!	%f28 = e0000000 d4940000 7f14b351 5097a866
	stda	%f16,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%l4 = 0000000000000000, Mem[0000000010101410] = 00000000
	stha	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%l0 = 000000007fffffff, Mem[0000000030181410] = ffff00ff
	stwa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 7fffffff
!	%f2  = 9cbb80c5 ffffffe3, Mem[0000000030041400] = 0ff73700 28baad19
	stda	%f2 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 9cbb80c5 ffffffe3
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010001410] = 00000000, %l7 = 00000000c580bb9c
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000010181410] = f2a3ffff
	stba	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = f2a3ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = 1e57899f 704e25f9, %l4 = 00000000, %l5 = 00005097
	ldda	[%i4+0x018]%asi,%l4	! %l4 = 000000001e57899f 00000000704e25f9

p0_label_159:
!	Mem[00000000100c1400] = 7000004c, %l0 = 000000007fffffff
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 0000000000007000
!	Mem[0000000030001400] = 00000000, %l2 = 000000006cc8ff7e
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = ffffffff, %l4 = 000000001e57899f
	lduwa	[%i1+%o5]0x89,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030141400] = ff000028, %l5 = 00000000704e25f9
	ldsba	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000028
!	Mem[0000000010081410] = ff00f1ce, %l4 = 00000000ffffffff
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030181410] = ffffff7f, %l4 = 000000000000ff00
	ldsha	[%i6+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1410] = 00000000, %l1 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = 0000000000000000, %f4  = 00000000 000000ff
	ldda	[%i2+%o4]0x89,%f4 	! %f4  = 00000000 00000000
!	Mem[00000000100c1404] = c9cbe1f0, %l3 = 00000000000000ff
	ldsb	[%i3+0x006],%l3		! %l3 = ffffffffffffffe1
!	Starting 10 instruction Store Burst
!	Mem[00000000100c141f] = ffffffff, %l0 = 0000000000007000
	ldstub	[%i3+0x01f],%l0		! %l0 = 000000ff000000ff

p0_label_160:
!	%l1 = 0000000000000000, Mem[000000001018143c] = 5097a866
	stw	%l1,[%i6+0x03c]		! Mem[000000001018143c] = 00000000
!	%l3 = ffffffffffffffe1, Mem[0000000010181408] = 0037f70f6e17bdff
	stxa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffffffffffe1
!	Mem[0000000030001410] = 9ae99a45, %l2 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l2	! %l2 = 000000009ae99a45
!	%l7 = 0000000000000000, Mem[0000000030141410] = 00000000
	stba	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%l4 = ffffffffffffffff, Mem[0000000010001408] = 000000e0
	stwa	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff
!	%l2 = 000000009ae99a45, Mem[0000000030101400] = ff000000
	stba	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000045
!	%l6 = ffffffffffffffff, Mem[0000000030141408] = c580bb9c
	stba	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = c580bbff
!	%l1 = 0000000000000000, Mem[0000000030101408] = 9f89571e
	stha	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 9f890000
!	Mem[0000000010181438] = 7f14b351, %l1 = 00000000, %l6 = ffffffff
	add	%i6,0x38,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 000000007f14b351
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 700025f9, %l1 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l1	! %l1 = 00000000700025f9

p0_label_161:
!	%l1 = 00000000700025f9, immd = fffffffffffff3cb, %l2  = 000000009ae99a45
	mulx	%l1,-0xc35,%l2		! %l2 = fffffaa8ce307773
!	Mem[0000000030041410] = 00000000ffffffff, %l4 = ffffffffffffffff
	ldxa	[%i1+%o5]0x89,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010181418] = 2c27cb51, %l2 = fffffaa8ce307773
	lduh	[%i6+0x01a],%l2		! %l2 = 000000000000cb51
!	Mem[0000000030101408] = 9f890000, %l0 = 00000000000000ff
	ldswa	[%i4+%o4]0x89,%l0	! %l0 = ffffffff9f890000
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000000
	lduha	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 0000003f, %l2 = 000000000000cb51
	lduwa	[%i3+%o5]0x81,%l2	! %l2 = 000000000000003f
!	Mem[00000000300c1410] = 0000003f00000000, %f0  = 7000004c c9cbe1f0
	ldda	[%i3+%o5]0x81,%f0 	! %f0  = 0000003f 00000000
!	Mem[0000000030181400] = ff000000 c6960309, %l4 = ffffffff, %l5 = 00000028
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 00000000ff000000 00000000c6960309
!	Mem[00000000300c1410] = 0000003f, %l7 = 0000000000000000
	lduwa	[%i3+%o5]0x81,%l7	! %l7 = 000000000000003f
!	Starting 10 instruction Store Burst
!	%l0 = ffffffff9f890000, Mem[0000000010041438] = ff00ff0d, %asi = 80
	stha	%l0,[%i1+0x038]%asi	! Mem[0000000010041438] = 0000ff0d

p0_label_162:
!	%l2 = 000000000000003f, Mem[00000000201c0000] = 4cec826e
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 003f826e
!	Mem[0000000010141420] = 00000000, %l3 = ffffffe1, %l6 = 7f14b351
	add	%i5,0x20,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800001] = ffff8ed8, %l6 = 0000000000000000
	ldstub	[%o1+0x001],%l6		! %l6 = 000000ff000000ff
!	%l3 = ffffffffffffffe1, Mem[0000000010001438] = 7f14b351, %asi = 80
	stwa	%l3,[%i0+0x038]%asi	! Mem[0000000010001438] = ffffffe1
!	Mem[00000000100c1400] = 7000004c, %l7 = 000000000000003f
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 00000070000000ff
!	%l6 = 00000000000000ff, Mem[00000000300c1408] = f925007000000000
	stxa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000ff
!	%l1 = 00000000700025f9, Mem[0000000010101400] = 700025f9
	stwa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 700025f9
!	%l0 = 9f890000, %l1 = 700025f9, Mem[0000000010081410] = ff00f1ce 00000000
	stda	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 9f890000 700025f9
!	%f20 = 00000000, %f20 = 00000000
	fcmpes	%fcc2,%f20,%f20		! %fcc2 = 0
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 25f9cbdb, %l1 = 00000000700025f9
	ldsha	[%o1+0x040]%asi,%l1	! %l1 = 00000000000025f9

p0_label_163:
!	Mem[0000000010041400] = ff0000ff, %l0 = ffffffff9f890000
	lduwa	[%i1+%g0]0x88,%l0	! %l0 = 00000000ff0000ff
!	Mem[00000000300c1400] = 000000ff000000ff, %l3 = ffffffffffffffe1
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030041400] = ffffffe3, %l4 = 00000000ff000000
	ldsba	[%i1+%g0]0x89,%l4	! %l4 = ffffffffffffffe3
!	Mem[0000000030141410] = 00000000, %l2 = 000000000000003f
	ldsba	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = 19adba28, %l0 = 00000000ff0000ff
	ldswa	[%i4+%o5]0x89,%l0	! %l0 = 0000000019adba28
!	Mem[0000000030181410] = 7fffffff, %l1 = 00000000000025f9
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010001410] = 9cbb80c500000000, %l3 = 000000ff000000ff
	ldxa	[%i0+%o5]0x80,%l3	! %l3 = 9cbb80c500000000
!	Mem[00000000211c0000] = ffff7001, %l0 = 0000000019adba28
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = ff00004c, %l5 = 00000000c6960309
	lduha	[%i3+%g0]0x80,%l5	! %l5 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ffffa3f2, %l4 = ffffffffffffffe3
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 000000ff000000ff

p0_label_164:
!	%f30 = 7f14b351 5097a866, Mem[0000000010141430] = 00ff03ff 00000000
	stda	%f30,[%i5+0x030]%asi	! Mem[0000000010141430] = 7f14b351 5097a866
!	%l6 = 00000000000000ff, Mem[000000001008143d] = 91560000
	stb	%l6,[%i2+0x03d]		! Mem[000000001008143c] = 91ff0000
!	%l6 = 00000000000000ff, imm = fffffffffffff34f, %l5 = 000000000000ff00
	orn	%l6,-0xcb1,%l5		! %l5 = 0000000000000cff
!	%l1 = 000000000000ffff, Mem[0000000010041410] = 19ff00ff
	stba	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = ffff00ff
!	%l6 = 00000000000000ff, Mem[0000000030141410] = 00000000
	stwa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff
!	Mem[0000000030141410] = ff000000, %l6 = 00000000000000ff
	swapa	[%i5+%o5]0x89,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030081410] = ff0000ff, %l0 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010141400] = 000094d4, %l1 = 000000000000ffff
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 00000000000094d4
!	%l4 = 00000000000000ff, Mem[0000000010181426] = 000000f2, %asi = 80
	stha	%l4,[%i6+0x026]%asi	! Mem[0000000010181424] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff0000ff, %l7 = 0000000000000070
	lduba	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000ff

p0_label_165:
!	Mem[00000000300c1408] = ff00000000000000, %f6  = 28a88367 ffffffff
	ldda	[%i3+%o4]0x89,%f6 	! %f6  = ff000000 00000000
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000030101400] = 450000ff d4940000 0000899f ef53a248
!	Mem[0000000030101410] = 28baad19 0ff7373e 00000000 c9cbe1f0
!	Mem[0000000030101420] = 3fed645a 95a7e5b4 6783a828 d78df1ce
!	Mem[0000000030101430] = 3e37f70f ff410000 fffff842 895ceee0
	ldda	[%i4]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030101400
!	Mem[0000000010141410] = 00000000, %l2 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = ff00000000000000, %f8  = 00ff03ff 00000000
	ldda	[%i5+%o5]0x81,%f8 	! %f8  = ff000000 00000000
!	Mem[0000000010081408] = 00000000, %l3 = 9cbb80c500000000
	lduha	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = ff0000ff, %l0 = 00000000000000ff
	ldswa	[%i1+%g0]0x88,%l0	! %l0 = ffffffffff0000ff
!	Mem[0000000010041404] = d6e1b298, %l3 = 0000000000000000
	lduh	[%i1+0x006],%l3		! %l3 = 000000000000b298
!	%f8  = ff000000, %f15 = ffffffe3, %f13 = ff7a0000
	fsubs	%f8 ,%f15,%f13		! %f13 = ffffffe3
!	Mem[0000000030001408] = 2dfeb51a4c000000, %f2  = 9cbb80c5 ffffffe3
	ldda	[%i0+%o4]0x89,%f2 	! %f2  = 2dfeb51a 4c000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000cff, Mem[00000000100c1410] = 00000000000000ff
	stxa	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000cff

p0_label_166:
!	%l4 = 00000000000000ff, Mem[0000000030081408] = 00000000
	stwa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000ff
!	Mem[00000000100c1430] = 1ab5e6dc, %l7 = 00000000000000ff
	swap	[%i3+0x030],%l7		! %l7 = 000000001ab5e6dc
!	Mem[0000000010001408] = ffffffff, %l1 = 00000000000094d4
	ldstuba	[%i0+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010141410] = 00000000, %l4 = 00000000000000ff
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010181410] = ffffa3f2
	stha	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000a3f2
!	%f7  = 00000000, Mem[0000000010001410] = c580bb9c
	sta	%f7 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[0000000010041408] = a4000067, %l1 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l1	! %l1 = 000000a4000000ff
!	%l5 = 0000000000000cff, %l6 = 00000000ff000000, %l4 = 0000000000000000
	xnor	%l5,%l6,%l4		! %l4 = ffffffff00fff300
!	Mem[0000000010081434] = e0ee5c89, %l2 = 0000000000000000, %asi = 80
	swapa	[%i2+0x034]%asi,%l2	! %l2 = 00000000e0ee5c89
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 0000a3f200000019, %f0  = 0000003f 00000000
	ldda	[%i6+%o5]0x80,%f0 	! %f0  = 0000a3f2 00000019

p0_label_167:
!	Mem[0000000010141430] = 7f14b351 5097a866, %l4 = 00fff300, %l5 = 00000cff
	ldda	[%i5+0x030]%asi,%l4	! %l4 = 000000007f14b351 000000005097a866
!	Mem[0000000030041408] = 2800000000005691, %l0 = ffffffffff0000ff
	ldxa	[%i1+%o4]0x81,%l0	! %l0 = 2800000000005691
!	Mem[0000000030001410] = 3e37f70f00000000, %l5 = 000000005097a866
	ldxa	[%i0+%o5]0x89,%l5	! %l5 = 3e37f70f00000000
!	Mem[0000000010141400] = 28000000ffff0000, %l7 = 000000001ab5e6dc
	ldxa	[%i5+%g0]0x88,%l7	! %l7 = 28000000ffff0000
!	Mem[0000000030041400] = e3ffffff, %l3 = 000000000000b298
	lduba	[%i1+%g0]0x81,%l3	! %l3 = 00000000000000e3
!	Mem[0000000010101410] = 00000000, %l2 = 00000000e0ee5c89
	ldsba	[%i4+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 0000003f, %f15 = ffffffe3
	lda	[%i3+%o5]0x81,%f15	! %f15 = 0000003f
!	Mem[00000000300c1400] = ff000000 ff000000, %l6 = ff000000, %l7 = ffff0000
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 00000000ff000000 00000000ff000000
!	Mem[0000000010001400] = 28baad190ff73700, %l5 = 3e37f70f00000000
	ldxa	[%i0+%g0]0x80,%l5	! %l5 = 28baad190ff73700
!	Starting 10 instruction Store Burst
!	%l5 = 28baad190ff73700, Mem[00000000211c0001] = ffff7001, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff007001

p0_label_168:
!	Mem[0000000030041408] = 28000000, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 00000028000000ff
!	Mem[0000000010181408] = ffffffe1, %l7 = 00000000ff000000
	swapa	[%i6+%o4]0x88,%l7	! %l7 = 00000000ffffffe1
!	%l2 = 0000000000000028, Mem[0000000010141400] = 0000ffff00000028
	stxa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000028
!	Mem[0000000010041408] = 670000ff, %l2 = 0000000000000028
	swapa	[%i1+%o4]0x88,%l2	! %l2 = 00000000670000ff
!	Mem[0000000010081400] = 9ae99a45, %l4 = 000000007f14b351
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 000000009ae99a45
!	%l7 = 00000000ffffffe1, Mem[0000000010141400] = 00000000
	stwa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffe1
!	%l5 = 28baad190ff73700, Mem[00000000100c1427] = 00000000
	stb	%l5,[%i3+0x027]		! Mem[00000000100c1424] = 00000000
!	Mem[00000000211c0001] = ff007001, %l7 = 00000000ffffffe1
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	%l3 = 00000000000000e3, Mem[00000000211c0001] = ffff7001, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffe37001
!	Starting 10 instruction Load Burst
!	Mem[000000001004140c] = 00000000, %l4 = 000000009ae99a45
	ldsh	[%i1+0x00c],%l4		! %l4 = 0000000000000000

p0_label_169:
!	Mem[0000000010141408] = 00000000, %l0 = 2800000000005691
	lduha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 450000ff, %f12 = 1ab5e6dc
	lda	[%i4+%g0]0x81,%f12	! %f12 = 450000ff
!	Mem[0000000030141410] = ff000000 00000000, %l2 = 670000ff, %l3 = 000000e3
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 00000000ff000000 0000000000000000
!	%l0 = 00000000, %l1 = 000000a4, Mem[0000000010001408] = ffffffff 00000000
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 000000a4
!	%f3  = 4c000000, %f21 = 19adba28
	fsqrts	%f3 ,%f21		! %f21 = 45b504f3
!	Mem[0000000030001400] = 00000000, %f17 = ff000045
	lda	[%i0+%g0]0x81,%f17	! %f17 = 00000000
!	Mem[0000000030181400] = 000000ff, %l2 = 00000000ff000000
	ldsha	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = 003f826e, %l1 = 00000000000000a4
	ldsba	[%o0+0x001]%asi,%l1	! %l1 = 000000000000003f
!	Mem[0000000010041400] = ff0000ff d6e1b298, %l4 = 00000000, %l5 = 0ff73700
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 00000000ff0000ff 00000000d6e1b298
!	Starting 10 instruction Store Burst
!	Mem[0000000010081420] = 000000ff, %l7 = 0000000000000000
	swap	[%i2+0x020],%l7		! %l7 = 00000000000000ff

p0_label_170:
!	Mem[0000000010001410] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[000000001010140e] = 000000e0, %l6 = 00000000ff000000
	ldstub	[%i4+0x00e],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010041408] = 00000028, %l2 = 00000000000000ff
	ldstuba	[%i1+%o4]0x88,%l2	! %l2 = 00000028000000ff
!	Mem[0000000010101410] = 00000000, %l1 = 000000000000003f
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%f17 = 00000000, Mem[0000000030001400] = 00000000
	sta	%f17,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%l0 = 0000000000000000, Mem[0000000030181408] = 8d7ac14c00677121
	stxa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010141408] = 00000000 277f04a6
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 00000000
!	%l4 = ff0000ff, %l5 = d6e1b298, Mem[00000000300c1408] = 00000000 000000ff
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff0000ff d6e1b298
!	%l1 = 0000000000000000, Mem[0000000010141408] = 00000000
	stba	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = c580bbff, %f10 = 0000f1ce
	lda	[%i5+%o4]0x89,%f10	! %f10 = c580bbff

p0_label_171:
!	Mem[0000000010141420] = 00000000 ffe50000, %l2 = 00000028, %l3 = 00000000
	ldd	[%i5+0x020],%l2		! %l2 = 0000000000000000 00000000ffe50000
!	%l2 = 0000000000000000, %l1 = 0000000000000000, %l5 = 00000000d6e1b298
	xnor	%l2,%l1,%l5		! %l5 = ffffffffffffffff
!	Mem[00000000100c1408] = e0000000 ffffffe3, %l4 = ff0000ff, %l5 = ffffffff
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 00000000e0000000 00000000ffffffe3
!	Mem[0000000030081408] = 000000ff00000000, %f10 = c580bbff 8d7a0000
	ldda	[%i2+%o4]0x81,%f10	! %f10 = 000000ff 00000000
!	Mem[00000000211c0000] = ffe37001, %l0 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = ffffffffffffffe3
!	Mem[0000000030001408] = 4c000000, %l1 = 0000000000000000
	ldswa	[%i0+%o4]0x89,%l1	! %l1 = 000000004c000000
!	Mem[00000000100c1408] = 000000e0, %f14 = 0000ff8d
	lda	[%i3+%o4]0x88,%f14	! %f14 = 000000e0
!	Mem[0000000010041414] = 00000000, %l1 = 000000004c000000
	lduh	[%i1+0x016],%l1		! %l1 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l5 = 00000000ffffffe3
	lduha	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 0000a3f2 00000019, %l0 = ffffffffffffffe3
!	Mem[0000000030081408] = 000000ff00000000
	add	%i2,0x008,%g1
	stda	%f0,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030081408] = 19000000f2a30000

p0_label_172:
!	%f10 = 000000ff, Mem[0000000010181400] = 00000000
	sta	%f10,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	%l6 = 0000000000000000, Mem[0000000010141410] = ff000000
	stha	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = ff000000
!	%f6  = ff000000 00000000, Mem[0000000010141410] = 000000ff ff7a0000
	stda	%f6 ,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000000 00000000
!	%l3 = 00000000ffe50000, %l3 = 00000000ffe50000, %l3 = 00000000ffe50000
	and	%l3,%l3,%l3		! %l3 = 00000000ffe50000
!	%l5 = 0000000000000000, Mem[00000000211c0000] = ffe37001
	stb	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00e37001
!	%l5 = 0000000000000000, Mem[0000000030081400] = 00000028000000ff
	stxa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000000000000
!	Mem[0000000010141400] = ffffffe1, %l3 = 00000000ffe50000
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 00000000ffffffe1
!	%l0 = ffffffffffffffe3, Mem[0000000010041408] = 000000ff
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000ffe3
!	%f2  = 2dfeb51a 4c000000, Mem[0000000010041400] = ff0000ff d6e1b298
	stda	%f2 ,[%i1+0x000]%asi	! Mem[0000000010041400] = 2dfeb51a 4c000000
!	Starting 10 instruction Load Burst
!	Mem[000000001004141c] = 000000ff, %l7 = 00000000000000ff
	ldswa	[%i1+0x01c]%asi,%l7	! %l7 = 00000000000000ff

p0_label_173:
!	Mem[0000000010101400] = 700025f9, %f3  = 4c000000
	lda	[%i4+%g0]0x88,%f3 	! %f3 = 700025f9
!	Mem[0000000010041430] = a775ccae, %l4 = 00000000e0000000
	ldsb	[%i1+0x030],%l4		! %l4 = ffffffffffffffa7
!	Mem[0000000010081400] = 51b3147f, %f21 = 45b504f3
	lda	[%i2+%g0]0x88,%f21	! %f21 = 51b3147f
!	Mem[0000000010181408] = ff000000, %l5 = 0000000000000000
	lduwa	[%i6+%o4]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010081418] = f368d4b6 6e17dfe9, %l0 = ffffffe3, %l1 = 00000000
	ldd	[%i2+0x018],%l0		! %l0 = 00000000f368d4b6 000000006e17dfe9
!	Mem[0000000030001410] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141420] = 00000000, %l4 = ffffffffffffffa7
	lduw	[%i5+0x020],%l4		! %l4 = 0000000000000000
!	Mem[0000000010101410] = 00000000 000000ff, %l0 = f368d4b6, %l1 = 6e17dfe9
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000020800000] = ffff8ed8, %l6 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (33)
!	%f10 = 000000ff 00000000, Mem[0000000030101410] = 19adba28 3e37f70f
	stda	%f10,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff 00000000

p0_label_174:
!	%l0 = 00000000000000ff, Mem[0000000030181410] = ffffff7f00000000
	stxa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000000000ff
!	Mem[0000000010041428] = bedae363380ea27e, %l5 = 00000000ff000000, %l3 = 00000000ffffffe1
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = bedae363380ea27e
!	%l5 = 00000000ff000000, Mem[0000000030101400] = ff000045
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000000
!	Mem[0000000010101408] = 00000000, %l6 = 000000000000ffff
	lduba	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%l2 = 0000000000000000, imm = fffffffffffff51a, %l5 = 00000000ff000000
	or	%l2,-0xae6,%l5		! %l5 = fffffffffffff51a
!	%l7 = 0000000000000000, Mem[00000000201c0000] = 003f826e, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 003f826e
!	%f8  = ff000000 00000000, %l0 = 00000000000000ff
!	Mem[0000000010101438] = 66a8975051b3147f
	add	%i4,0x038,%g1
	stda	%f8,[%g1+%l0]ASI_PST16_P ! Mem[0000000010101438] = ff00000000000000
!	%f2  = 2dfeb51a 700025f9, %l0 = 00000000000000ff
!	Mem[0000000030181400] = ff000000c6960309
	stda	%f2,[%i6+%l0]ASI_PST16_S ! Mem[0000000030181400] = 2dfeb51a700025f9
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 2dfeb51a700025f9, %l3 = bedae363380ea27e
	ldxa	[%i6+%g0]0x81,%l3	! %l3 = 2dfeb51a700025f9

p0_label_175:
!	Mem[00000000300c1400] = 000000ff, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l7 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = e0000000, %l4 = 0000000000000000
	ldsba	[%i3+%o4]0x80,%l4	! %l4 = ffffffffffffffe0
!	Mem[00000000201c0000] = 003f826e, %l2 = 0000000000000000
	ldub	[%o0+%g0],%l2		! %l2 = 0000000000000000
!	Mem[000000001000142c] = 00000000, %l5 = fffffffffffff51a
	lduwa	[%i0+0x02c]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = 0000000000000000, %l3 = 2dfeb51a700025f9
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l4 = ffffffffffffffe0
	lduba	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = 000000ff, %f7  = 00000000
	lda	[%i1+%o4]0x89,%f7 	! %f7 = 000000ff
!	Mem[00000000100c1400] = ff00004c, %l7 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, %l6 = 00000000000000ff, %y  = 7fffffff
	sdiv	%l0,%l6,%l3		! %l3 = 000000007fffffff
	mov	%l0,%y			! %y = 000000ff

p0_label_176:
!	%f10 = 000000ff 00000000, Mem[0000000010081408] = 00000000 52f7846f
	stda	%f10,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff 00000000
!	%l7 = 000000000000ff00, Mem[0000000010001408] = 00000000
	stwa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000ff00
!	Mem[0000000030081400] = 00000000, %l0 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000030101400] = 000000ff
	stha	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	Mem[0000000010081408] = 00000000, %l3 = 000000007fffffff
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041410] = ff00ffff, %l0 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000030081408] = 19000000
	stha	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ff0000
!	%f0  = 0000a3f2 00000019 2dfeb51a 700025f9
!	%f4  = 00000000 00000000 ff000000 000000ff
!	%f8  = ff000000 00000000 000000ff 00000000
!	%f12 = 450000ff ffffffe3 000000e0 0000003f
	stda	%f0,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	%l3 = 0000000000000000, Mem[0000000030101410] = 00000000
	stba	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l7 = 000000000000ff00
	ldswa	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_177:
!	Mem[0000000010181418] = 2c27cb51, %f16 = 000094d4
	lda	[%i6+0x018]%asi,%f16	! %f16 = 2c27cb51
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010041410] = ffff00ff, %f23 = 00000000
	lda	[%i1+%o5]0x80,%f23	! %f23 = ffff00ff
!	Mem[0000000030081410] = ff0000ff, %l3 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l3	! %l3 = ffffffffff0000ff
!	Mem[0000000010101400] = f9250070 19adba28 00000000 0000ffe0
!	Mem[0000000010101410] = ff000000 00000000 1e57899f 704e25f9
!	Mem[0000000010101420] = 610c91c4 a23eeedf 00000000 00000000
!	Mem[0000000010101430] = 000094d4 000000e0 ff000000 00000000
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Mem[0000000030081400] = 000000ff, %f24 = b4e5a795
	lda	[%i2+%g0]0x81,%f24	! %f24 = 000000ff
!	Mem[0000000030101400] = 000000ff d4940000 0000899f ef53a248
!	Mem[0000000030101410] = 00000000 ff000000 00000000 c9cbe1f0
!	Mem[0000000030101420] = 3fed645a 95a7e5b4 6783a828 d78df1ce
!	Mem[0000000030101430] = 3e37f70f ff410000 fffff842 895ceee0
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000010141408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = f9250070 19adba28, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000f9250070 0000000019adba28
!	Mem[0000000030101408] = 48a253ef 9f890000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 000000009f890000 0000000048a253ef
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[000000001000141a] = 28000000, %asi = 80
	stba	%l0,[%i0+0x01a]%asi	! Mem[0000000010001418] = 2800ff00

p0_label_178:
!	%l6 = 00000000f9250070, Mem[0000000010001438] = ffffffe1, %asi = 80
	stwa	%l6,[%i0+0x038]%asi	! Mem[0000000010001438] = f9250070
!	%f9  = a23eeedf, Mem[0000000010001410] = 000000ff
	sta	%f9 ,[%i0+%o5]0x88	! Mem[0000000010001410] = a23eeedf
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010181400] = 000000ff 67000000
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff 00000000
!	%l2 = 0000000000000000, Mem[0000000021800001] = 00fffa80, %asi = 80
	stba	%l2,[%o3+0x001]%asi	! Mem[0000000021800000] = 0000fa80
!	Mem[0000000030001410] = 00000000, %l6 = 00000000f9250070
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010001400] = 28baad19
	stwa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Mem[0000000030001400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%f14 = ff000000, Mem[0000000030041410] = 00000000
	sta	%f14,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000
!	Mem[0000000020800001] = ffff8ed8, %l6 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000 ff00ffff, %l2 = 00000000, %l3 = ff0000ff
	ldda	[%i1+%o5]0x88,%l2	! %l2 = 00000000ff00ffff 0000000000000000

p0_label_179:
!	Mem[0000000010101408] = 00000000, %l7 = 0000000019adba28
	lduha	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 2dfeb51a, %l7 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 000000000000002d
!	Mem[0000000010081410] = 9f890000, %l7 = 000000000000002d
	ldsha	[%i2+0x012]%asi,%l7	! %l7 = 0000000000000000
!	%f12 = 000094d4, %f5  = 00000000, %f3  = 0000ffe0
	fdivs	%f12,%f5 ,%f3 		! %f3  = 7f800000
!	Mem[0000000010101400] = f9250070 19adba28 00000000 0000ffe0
!	Mem[0000000010101410] = ff000000 00000000 1e57899f 704e25f9
!	Mem[0000000010101420] = 610c91c4 a23eeedf 00000000 00000000
!	Mem[0000000010101430] = 000094d4 000000e0 ff000000 00000000
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400
!	Mem[0000000010081408] = ff000000, %l2 = 00000000ff00ffff
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030141408] = 000094d4 c580bbff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 00000000c580bbff 00000000000094d4
!	Mem[0000000010041400] = 2dfeb51a, %l4 = 000000009f890000
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = 0000000000002dfe
!	%f24 = 3fed645a, %f19 = ef53a248
	fcmps	%fcc1,%f24,%f19		! %fcc1 = 2
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000094d4, Mem[00000000300c1410] = 3f000000
	stba	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 3f0000d4

p0_label_180:
!	%f27 = d78df1ce, Mem[0000000030081408] = 0000ff00
	sta	%f27,[%i2+%o4]0x89	! Mem[0000000030081408] = d78df1ce
	membar	#Sync			! Added by membar checker (35)
!	%l1 = 00000000000094d4, Mem[0000000030101400] = 000094d4ff000000
	stxa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000000094d4
!	%l5 = 0000000048a253ef, Mem[00000000300c1408] = ff0000ff
	stba	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff0000ef
!	%l0 = 00000000c580bbff, Mem[0000000010001400] = 00000000
	stwa	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = c580bbff
!	Mem[0000000010001410] = a23eeedf, %l2 = 00000000ff000000
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 00000000a23eeedf
!	Mem[00000000300c1400] = 000000ff, %l2 = 00000000a23eeedf
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = 1ab5fe2d, %l0 = 00000000c580bbff
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 000000001ab5fe2d
!	%l4 = 0000000000002dfe, Mem[0000000030041400] = f2a30000
	stha	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = f2a32dfe
!	Mem[0000000010181408] = ff000000, %l1 = 00000000000094d4
	swapa	[%i6+%o4]0x88,%l1	! %l1 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101424] = a23eeedf, %l3 = 0000000000000000
	ldsb	[%i4+0x026],%l3		! %l3 = ffffffffffffffee

p0_label_181:
!	Mem[0000000030001400] = ff000000 000000ff, %l4 = 00002dfe, %l5 = 48a253ef
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff 00000000ff000000
!	Mem[0000000010001400] = c580bbff0ff73700, %l7 = 0000000000000000
	ldxa	[%i0+%g0]0x80,%l7	! %l7 = c580bbff0ff73700
!	Mem[0000000010041400] = 2dfeb51a, %l6 = 00000000000000ff
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = 000000002dfeb51a
!	Mem[0000000010001434] = d4940000, %l7 = c580bbff0ff73700
	lduw	[%i0+0x034],%l7		! %l7 = 00000000d4940000
!	Mem[0000000030141410] = 000000ff, %l0 = 000000001ab5fe2d
	lduwa	[%i5+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = 700025f9, %l5 = 00000000ff000000
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 00000000000025f9
!	Mem[0000000010181410] = 0000a3f2, %l2 = 0000000000000000
	ldsba	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = 000000ff, %l6 = 000000002dfeb51a
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l0 = 00000000000000ff
	lduha	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800000] = 0000fa80, %l5 = 00000000000025f9
	ldstub	[%o3+%g0],%l5		! %l5 = 00000000000000ff

p0_label_182:
!	%l3 = ffffffffffffffee, Mem[0000000010141410] = ff00000000000000
	stx	%l3,[%i5+%o5]		! Mem[0000000010141410] = ffffffffffffffee
!	Mem[000000001018140c] = ffffffff, %l3 = ffffffffffffffee, %asi = 80
	swapa	[%i6+0x00c]%asi,%l3	! %l3 = 00000000ffffffff
!	%l5 = 0000000000000000, Mem[00000000300c1410] = 3f0000d4
	stha	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 3f000000
!	%l5 = 0000000000000000, Mem[0000000030101408] = 0000899f
	stha	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000899f
!	%l7 = 00000000d4940000, Mem[0000000010181408] = 000094d4
	stwa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = d4940000
!	Mem[0000000021800080] = a3f2944f, %l5 = 0000000000000000
	ldstub	[%o3+0x080],%l5		! %l5 = 000000a3000000ff
!	%l5 = 00000000000000a3, imm = 0000000000000bf7, %l1 = 00000000ff000000
	xor	%l5,0xbf7,%l1		! %l1 = 0000000000000b54
!	%l4 = 00000000000000ff, Mem[0000000010041408] = 0000ffe3
	stba	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000ffff
!	%l6 = 00000000000000ff, Mem[0000000010181424] = 000000ff, %asi = 80
	stwa	%l6,[%i6+0x024]%asi	! Mem[0000000010181424] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 2dfeb51a, %l3 = 00000000ffffffff
	ldswa	[%i1+%g0]0x80,%l3	! %l3 = 000000002dfeb51a

p0_label_183:
!	Mem[0000000010181410] = f2a30000, %l3 = 000000002dfeb51a
	ldswa	[%i6+%o5]0x88,%l3	! %l3 = fffffffff2a30000
!	Mem[0000000010001400] = ffbb80c5, %l6 = 00000000000000ff
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = ffffffffffbb80c5
!	Mem[000000001018141c] = 386059d7, %l0 = 0000000000000000
	ldswa	[%i6+0x01c]%asi,%l0	! %l0 = 00000000386059d7
!	Mem[0000000030181408] = 00000000, %l0 = 00000000386059d7
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 51b3147f, %f11 = 00000000
	lda	[%i2+%g0]0x88,%f11	! %f11 = 51b3147f
!	Mem[0000000010181400] = 00000000ff000000, %l6 = ffffffffffbb80c5
	ldxa	[%i6+%g0]0x88,%l6	! %l6 = 00000000ff000000
!	Mem[00000000201c0000] = 003f826e, %l4 = 00000000000000ff
	lduba	[%o0+0x001]%asi,%l4	! %l4 = 000000000000003f
!	Mem[00000000100c1408] = 000000e0, %l7 = 00000000d4940000
	ldsba	[%i3+%o4]0x88,%l7	! %l7 = ffffffffffffffe0
!	Mem[0000000010001410] = 00000000ff000000, %l3 = fffffffff2a30000
	ldxa	[%i0+%o5]0x88,%l3	! %l3 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030081408] = cef18dd7
	stba	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00f18dd7

p0_label_184:
!	Mem[0000000030101408] = 9f890000, %l7 = ffffffffffffffe0
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 000000009f890000
!	Mem[0000000010141410] = ffffffff, %l1 = 0000000000000b54
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 00000000ffffffff
!	%l1 = 00000000ffffffff, %l4 = 000000000000003f, %l5 = 00000000000000a3
	udivx	%l1,%l4,%l5		! %l5 = 0000000004104104
!	Mem[00000000100c1408] = 000000e0, %l6 = 00000000ff000000
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 000000e0000000ff
!	%f30 = fffff842, Mem[00000000300c1400] = ff0000ff
	sta	%f30,[%i3+%g0]0x89	! Mem[00000000300c1400] = fffff842
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000ff000000
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l7 = 000000009f890000, Mem[0000000030001400] = 000000ff
	stba	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[0000000030041408] = 1ab5fe2d, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l3	! %l3 = 0000002d000000ff
!	Mem[0000000021800081] = fff2944f, %l2 = 0000000000000000
	ldstuba	[%o3+0x081]%asi,%l2	! %l2 = 000000f2000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff00ffff, %f7  = 9f89571e
	lda	[%i1+%o5]0x88,%f7 	! %f7 = ff00ffff

p0_label_185:
!	Mem[0000000030001410] = 000000ff, %l1 = 00000000ffffffff
	lduwa	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1414] = 00000cff, %l0 = 0000000000000000
	lduha	[%i3+0x014]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = f2a30000, %l2 = 00000000000000f2
	ldsha	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 000000ff00000000, %l3 = 000000000000002d
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = 000000ff00000000
!	%f22 = 00000000, %f0  = 28baad19, %f22 = 00000000 c9cbe1f0
	fsmuld	%f22,%f0 ,%f22		! %f22 = 00000000 00000000
!	%f5  = 000000ff, %f8  = dfee3ea2
	fcmpes	%fcc1,%f5 ,%f8 		! %fcc1 = 2
!	Mem[00000000100c1408] = ff000000, %l5 = 0000000004104104
	lduha	[%i3+%o4]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030041410] = ff000000, %l2 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010081408] = ff00ffff, %l0 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f20 = 00000000 ff000000, Mem[0000000010001400] = c580bbff 0ff73700
	stda	%f20,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 ff000000

p0_label_186:
!	Mem[0000000010141408] = 00000000, %l3 = 000000ff00000000
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = ff000000, %l5 = 000000000000ff00
	ldstuba	[%i5+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[0000000010141400] = 0000e5ff
	stha	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 00ffe5ff
!	Mem[000000001010141d] = 704e25f9, %l5 = 00000000000000ff
	ldstuba	[%i4+0x01d]%asi,%l5	! %l5 = 0000004e000000ff
!	Mem[0000000010081408] = ff00ffff, %l6 = 00000000000000e0
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 00000000ff00ffff
!	Mem[0000000010181408] = d4940000, %l2 = 000000000000ff00
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 00000000d4940000
!	Mem[0000000010141428] = 0862378effffff8d, %l6 = 00000000ff00ffff, %l2 = 00000000d4940000
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = 0862378effffff8d
!	%l2 = ffffff8d, %l3 = 00000000, Mem[0000000030181408] = 00000000 00000000
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffff8d 00000000
!	Mem[0000000030101408] = e0ffffff, %l3 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l3	! %l3 = 000000000000e0ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffff00ff00000000, %f6  = f9254e70 ff00ffff
	ldda	[%i1+0x010]%asi,%f6 	! %f6  = ffff00ff 00000000

p0_label_187:
!	Mem[0000000010141410] = 00000b54ffffffee, %l6 = 00000000ff00ffff
	ldxa	[%i5+%o5]0x80,%l6	! %l6 = 00000b54ffffffee
!	Mem[0000000010081400] = 51b3147f, %l3 = 000000000000e0ff
	ldswa	[%i2+%g0]0x88,%l3	! %l3 = 0000000051b3147f
!	Mem[0000000030141408] = c580bbff, %l3 = 0000000051b3147f
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 00000000c580bbff
!	Mem[0000000010181400] = 000000ff, %l2 = 0862378effffff8d
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041438] = 0000ff0d, %l3 = 00000000c580bbff
	ldswa	[%i1+0x038]%asi,%l3	! %l3 = 000000000000ff0d
!	Mem[00000000211c0000] = 00e37001, %l7 = 000000009f890000
	lduba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l5 = 000000000000004e
	ldsh	[%i0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010001400] = 00000000ff000000, %l4 = 000000000000003f
	ldxa	[%i0+0x000]%asi,%l4	! %l4 = 00000000ff000000
!	Mem[0000000021800100] = 5e004cdd, %l4 = 00000000ff000000
	ldsha	[%o3+0x100]%asi,%l4	! %l4 = 0000000000005e00
!	Starting 10 instruction Store Burst
!	%f18 = 0000899f ef53a248, %l4 = 0000000000005e00
!	Mem[0000000010081410] = 9f890000700025f9
	add	%i2,0x010,%g1
	stda	%f18,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010081410] = 9f890000700025f9

p0_label_188:
!	%l3 = 000000000000ff0d, Mem[00000000100c1410] = ff0c0000000000ff
	stxa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000000000ff0d
!	Mem[0000000010041410] = ff00ffff, %l3 = 000000000000ff0d
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 00000000ff00ffff
!	%f12 = e0000000, %f5  = 000000ff, %f20 = 00000000
	fdivs	%f12,%f5 ,%f20		! %f20 = ff800000
!	Mem[0000000030141410] = 000000ff, %l4 = 0000000000005e00
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081408] = d78df100, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f1  = 700025f9, Mem[00000000100c1410] = 0dff0000
	sta	%f1 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 700025f9
!	Mem[0000000010001400] = 00000000, %l0 = ffffffffffffffff
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f4  = 00000000 000000ff, Mem[0000000030181408] = ffffff8d 00000000
	stda	%f4 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 000000ff
!	%f22 = 00000000, Mem[0000000010041410] = 0dff0000
	sta	%f22,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[000000001008140c] = ff000000, %l0 = 0000000000000000
	ldub	[%i2+0x00f],%l0		! %l0 = 0000000000000000

p0_label_189:
!	Mem[0000000030181410] = ff00000000000000, %f30 = fffff842 895ceee0
	ldda	[%i6+%o5]0x89,%f30	! %f30 = ff000000 00000000
!	Mem[0000000030001410] = 000000ff, %l0 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[000000001000143c] = 5097a866, %f25 = 95a7e5b4
	lda	[%i0+0x03c]%asi,%f25	! %f25 = 5097a866
!	Mem[0000000010081408] = 000000ff e0000000, %l0 = 000000ff, %l1 = 000000ff
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000e0000000 00000000000000ff
!	Mem[00000000300c1408] = 98b2e1d6ff0000ef, %l4 = 00000000000000ff
	ldxa	[%i3+%o4]0x89,%l4	! %l4 = 98b2e1d6ff0000ef
!	Mem[0000000010041408] = 0000ffff, %l4 = 98b2e1d6ff0000ef
	ldsha	[%i1+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181410] = 19000000f2a30000, %l0 = 00000000e0000000
	ldxa	[%i6+%o5]0x88,%l0	! %l0 = 19000000f2a30000
!	Mem[0000000010081410] = 0000899f, %l1 = 00000000000000ff
	lduwa	[%i2+%o5]0x88,%l1	! %l1 = 000000000000899f
!	Mem[0000000010101400] = 700025f9, %l5 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l5	! %l5 = 00000000700025f9
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[00000000211c0000] = 00e37001, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff7001

p0_label_190:
!	%l2 = 000000ff, %l3 = ff00ffff, Mem[0000000010141420] = 00000000 ffe50000
	stda	%l2,[%i5+0x020]%asi	! Mem[0000000010141420] = 000000ff ff00ffff
!	%f15 = 000000ff, %f31 = 00000000, %f10 = 00000000
	fadds	%f15,%f31,%f10		! %l0 = 19000000f2a30022, Unfinished, %fsr = 1200000800
!	Mem[00000000211c0001] = ffff7001, %l3 = 00000000ff00ffff
	ldstub	[%o2+0x001],%l3		! %l3 = 000000ff000000ff
!	%f24 = 3fed645a 5097a866, Mem[0000000010181400] = 000000ff 00000000
	stda	%f24,[%i6+%g0]0x80	! Mem[0000000010181400] = 3fed645a 5097a866
!	Mem[0000000010141408] = 00000000, %l1 = 000000000000899f
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l0 = 19000000f2a30022
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Code Fragment 4
p0_fragment_13:
!	%l0 = 00000000000000ff
	setx	0x80cd1198347d4959,%g7,%l0 ! %l0 = 80cd1198347d4959
!	%l1 = 0000000000000000
	setx	0x2f282b406bd1667d,%g7,%l1 ! %l1 = 2f282b406bd1667d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 80cd1198347d4959
	setx	0xca4baea87712b122,%g7,%l0 ! %l0 = ca4baea87712b122
!	%l1 = 2f282b406bd1667d
	setx	0xe8a80bb873ca06ad,%g7,%l1 ! %l1 = e8a80bb873ca06ad
!	%l0 = ca4baea87712b122, Mem[0000000010001410] = 000000ff
	stwa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 7712b122
!	Mem[0000000030081408] = d78df1ff, %l1 = e8a80bb873ca06ad
	swapa	[%i2+%o4]0x89,%l1	! %l1 = 00000000d78df1ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = f9250070, %l4 = ffffffffffffffff
	ldsba	[%i4+%g0]0x80,%l4	! %l4 = fffffffffffffff9

p0_label_191:
!	Mem[0000000030101410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, %l3 = 00000000000000ff, %l6 = 00000b54ffffffee
	sub	%l7,%l3,%l6		! %l6 = ffffffffffffff01
!	Mem[0000000010041408] = ffff0000, %f7  = 00000000
	lda	[%i1+%o4]0x80,%f7 	! %f7 = ffff0000
!	Mem[00000000100c1400] = ff00004c, %f3  = 00000000
	lda	[%i3+%g0]0x80,%f3 	! %f3 = ff00004c
!	Mem[0000000030141410] = 00005e00, %l0 = ca4baea87712b122
	ldsba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = ffbb80c5, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffffbb
!	Mem[0000000010101400] = 28baad19700025f9, %l2 = 00000000000000ff
	ldxa	[%i4+%g0]0x88,%l2	! %l2 = 28baad19700025f9
!	Mem[00000000100c1400] = ff00004cc9cbe1f0, %f8  = dfee3ea2 c4910c61
	ldda	[%i3+%g0]0x80,%f8 	! %f8  = ff00004c c9cbe1f0
!	Mem[0000000030141410] = 005e0000, %f30 = ff000000
	lda	[%i5+%o5]0x81,%f30	! %f30 = 005e0000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 0000003f, %l2 = 28baad19700025f9
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 000000000000003f

p0_label_192:
!	%l3 = 00000000000000ff, Mem[0000000010081408] = 000000e0ff000000
	stxa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000000000ff
!	Mem[0000000010181407] = 5097a866, %l0 = ffffffffffffffbb
	ldstub	[%i6+0x007],%l0		! %l0 = 00000066000000ff
!	%l2 = 0000003f, %l3 = 000000ff, Mem[0000000010001410] = 22b11277 00000000
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000003f 000000ff
!	Mem[0000000030141400] = 280000ff, %l0 = 0000000000000066
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 00000028000000ff
!	%l6 = ffffffffffffff01, Mem[0000000030141408] = 000094d4c580bbff
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffffffffff01
!	%f2  = e0ff0000, Mem[0000000010041400] = 1ab5fe2d
	sta	%f2 ,[%i1+%g0]0x88	! Mem[0000000010041400] = e0ff0000
!	%f0  = 28baad19 700025f9 e0ff0000 ff00004c
!	%f4  = 00000000 000000ff ffff00ff ffff0000
!	%f8  = ff00004c c9cbe1f0 00000000 51b3147f
!	%f12 = e0000000 d4940000 00000000 000000ff
	stda	%f0,[%i5]ASI_BLK_AIUP	! Block Store to 0000000010141400
!	Mem[0000000010081404] = 0ff7373e, %l0 = 0000000000000028
	ldstuba	[%i2+0x004]%asi,%l0	! %l0 = 0000000f000000ff
!	%f18 = 0000899f ef53a248, %l1 = 00000000d78df1ff
!	Mem[0000000030101438] = fffff842895ceee0
	add	%i4,0x038,%g1
	stda	%f18,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030101438] = 48a253ef9f890000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 1ab5feff, %l3 = 00000000000000ff
	lduwa	[%i1+%o4]0x89,%l3	! %l3 = 000000001ab5feff

p0_label_193:
!	Mem[0000000030081400] = 00000000ff000000, %l0 = 000000000000000f
	ldxa	[%i2+%g0]0x89,%l0	! %l0 = 00000000ff000000
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010141410] = 00000000, %f31 = 00000000
	lda	[%i5+%o5]0x88,%f31	! %f31 = 00000000
!	Mem[0000000020800000] = ffff8ed8, %l1 = 00000000d78df1ff
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030041410] = ff00000000000000, %f30 = 005e0000 00000000
	ldda	[%i1+%o5]0x81,%f30	! %f30 = ff000000 00000000
!	Mem[0000000010141400] = 19adba28, %l2 = 000000000000003f
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = ffffffffffffba28
!	Mem[0000000010001400] = ffffffff, %l0 = 00000000ff000000
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010101410] = ff000000, %l4 = fffffffffffffff9
	lduba	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %f28 = 3e37f70f
	lda	[%i2+%o4]0x88,%f28	! %f28 = 00000000
!	Mem[0000000010081400] = 51b3147f, %f11 = 51b3147f
	lda	[%i2+%g0]0x88,%f11	! %f11 = 51b3147f
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 0000ff00, %l2 = ffffffffffffba28
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff

p0_label_194:
!	Mem[0000000010041417] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+0x017]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181401] = 3fed645a, %l2 = 0000000000000000
	ldstuba	[%i6+0x001]%asi,%l2	! %l2 = 000000ed000000ff
!	%f15 = 000000ff, %f6  = ffff00ff
	fitos	%f15,%f6 		! %f6  = 437f0000
!	%l7 = 0000000000000000, Mem[000000001000143f] = 5097a866, %asi = 80
	stba	%l7,[%i0+0x03f]%asi	! Mem[000000001000143c] = 5097a800
!	%l2 = 000000ed, %l3 = 1ab5feff, Mem[0000000030181408] = 00000000 000000ff
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ed 1ab5feff
!	%l6 = ffffffffffffff01, imm = 0000000000000241, %l6 = ffffffffffffff01
	xor	%l6,0x241,%l6		! %l6 = fffffffffffffd40
!	Mem[0000000010041408] = ffff0000, %l1 = 000000000000ffff
	ldsba	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	%l2 = 00000000000000ed, %l0 = 00000000ffffffff, %l0 = 00000000ffffffff
	subc	%l2,%l0,%l0		! %l0 = ffffffff000000ee
!	%l0 = ffffffff000000ee, Mem[00000000300c1408] = ff0000ef
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff0000ee
!	Starting 10 instruction Load Burst
!	Mem[000000001010143c] = 00000000, %l2 = 00000000000000ed
	lduha	[%i4+0x03c]%asi,%l2	! %l2 = 0000000000000000

p0_label_195:
!	Mem[0000000010141400] = 28baad19, %l0 = ffffffff000000ee
	ldsba	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000028
!	Mem[0000000010001430] = e0000000, %l1 = ffffffffffffffff
	ldsw	[%i0+0x030],%l1		! %l1 = ffffffffe0000000
!	Mem[00000000300c1400] = 42f8ffff, %l1 = ffffffffe0000000
	lduba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000042
!	Mem[00000000300c1400] = 42f8ffff, %l0 = 0000000000000028
	ldsha	[%i3+%g0]0x81,%l0	! %l0 = 00000000000042f8
!	Mem[0000000010041408] = ffff0000, %l3 = 000000001ab5feff
	lduba	[%i1+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001410] = 3f000000ff000000, %l4 = 00000000000000ff
	ldxa	[%i0+%o5]0x80,%l4	! %l4 = 3f000000ff000000
!	Mem[000000001018141c] = 386059d7, %l0 = 00000000000042f8
	ldsw	[%i6+0x01c],%l0		! %l0 = 00000000386059d7
!	Mem[00000000100c1434] = ff7a0000, %l3 = 00000000000000ff
	lduwa	[%i3+0x034]%asi,%l3	! %l3 = 00000000ff7a0000
!	Mem[00000000201c0000] = 003f826e, %l7 = 0000000000000000
	lduh	[%o0+%g0],%l7		! %l7 = 000000000000003f
!	Starting 10 instruction Store Burst
!	%f11 = 51b3147f, Mem[00000000100c1410] = 700025f9
	sta	%f11,[%i3+%o5]0x80	! Mem[00000000100c1410] = 51b3147f

p0_label_196:
!	%l6 = fffffffffffffd40, %l2 = 0000000000000000, %l2  = 0000000000000000
	mulx	%l6,%l2,%l2		! %l2 = 0000000000000000
!	%f0  = 28baad19 700025f9 e0ff0000 ff00004c
!	%f4  = 00000000 000000ff 437f0000 ffff0000
!	%f8  = ff00004c c9cbe1f0 00000000 51b3147f
!	%f12 = e0000000 d4940000 00000000 000000ff
	stda	%f0,[%i0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	%f27 = d78df1ce, Mem[0000000010141400] = 19adba28
	sta	%f27,[%i5+%g0]0x88	! Mem[0000000010141400] = d78df1ce
!	Mem[0000000030001408] = 0000004c, %l0 = 00000000386059d7
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141400] = d78df1ce, %l7 = 000000000000003f
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 00000000d78df1ce
!	%l4 = ff000000, %l5 = 700025f9, Mem[0000000010001420] = ff00004c c9cbe1f0
	std	%l4,[%i0+0x020]		! Mem[0000000010001420] = ff000000 700025f9
!	Mem[0000000030141400] = ff0000ff, %l3 = 00000000ff7a0000
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000ff0000ff
!	%l1 = 0000000000000042, %l2 = 0000000000000000, %l3 = 00000000ff0000ff
	sub	%l1,%l2,%l3		! %l3 = 0000000000000042
!	%l7 = 00000000d78df1ce, Mem[00000000201c0000] = 003f826e
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = f1ce826e
!	Starting 10 instruction Load Burst
!	Mem[0000000010141404] = 700025f9, %l7 = 00000000d78df1ce
	lduba	[%i5+0x006]%asi,%l7	! %l7 = 0000000000000025

p0_label_197:
!	%l2 = 0000000000000000, %l4 = 3f000000ff000000, %l6 = fffffffffffffd40
	sdivx	%l2,%l4,%l6		! %l6 = 0000000000000000
!	Mem[0000000010181400] = 3fff645a, %l1 = 0000000000000042
	ldswa	[%i6+%g0]0x80,%l1	! %l1 = 000000003fff645a
!	Mem[0000000010181400] = 5a64ff3f, %l3 = 0000000000000042
	lduwa	[%i6+%g0]0x88,%l3	! %l3 = 000000005a64ff3f
!	Mem[00000000201c0000] = f1ce826e, %l2 = 0000000000000000
	ldsh	[%o0+%g0],%l2		! %l2 = fffffffffffff1ce
!	Mem[00000000300c1400] = fffff842, %l7 = 0000000000000025
	ldsha	[%i3+%g0]0x89,%l7	! %l7 = fffffffffffff842
!	Mem[000000001004142c] = 380ea27e, %l3 = 000000005a64ff3f
	ldsh	[%i1+0x02c],%l3		! %l3 = 000000000000380e
!	%l7 = fffffffffffff842, Mem[0000000010041420] = 8500588b9cbb71cd, %asi = 80
	stxa	%l7,[%i1+0x020]%asi	! Mem[0000000010041420] = fffffffffffff842
!	Mem[0000000030081408] = ad06ca73, %l7 = fffffffffffff842
	ldswa	[%i2+%o4]0x81,%l7	! %l7 = ffffffffad06ca73
!	%l2 = fffffffffffff1ce, %l3 = 000000000000380e, %l3 = 000000000000380e
	andn	%l2,%l3,%l3		! %l3 = ffffffffffffc1c0
!	Starting 10 instruction Store Burst
!	%l5 = 00000000700025f9, Mem[0000000010041400] = 0000ffe0
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 25f9ffe0

p0_label_198:
!	Mem[0000000030181410] = 00000000, %l4 = 3f000000ff000000
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030181410] = 000000ff
	stba	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010001410] = 00000000
	stha	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%f29 = ff410000, Mem[0000000010181420] = 00ff00e0
	sta	%f29,[%i6+0x020]%asi	! Mem[0000000010181420] = ff410000
!	Mem[0000000010041408] = ffff0000, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, imm = fffffffffffff956, %l5 = 00000000700025f9
	and	%l6,-0x6aa,%l5		! %l5 = 0000000000000056
!	Mem[0000000030041410] = 000000ff, %l5 = 0000000000000056
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010141414] = 000000ff, %asi = 80
	stwa	%l4,[%i5+0x014]%asi	! Mem[0000000010141414] = 00000000
!	Mem[00000000218001c1] = ff0037e3, %l4 = 0000000000000000
	ldstuba	[%o3+0x1c1]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00007aff, %l5 = 00000000000000ff
	ldsba	[%i5+%g0]0x89,%l5	! %l5 = ffffffffffffffff

p0_label_199:
!	%l0 = 0000000000000000, imm = 0000000000000572, %l4 = 0000000000000000
	addc	%l0,0x572,%l4		! %l4 = 0000000000000572
!	Mem[0000000010141410] = 00000000 00000000, %l2 = fffff1ce, %l3 = ffffc1c0
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030141410] = 005e0000, %l7 = ffffffffad06ca73
	ldswa	[%i5+%o5]0x81,%l7	! %l7 = 00000000005e0000
!	Mem[0000000010101400] = 700025f9, %l1 = 000000003fff645a
	ldswa	[%i4+%g0]0x88,%l1	! %l1 = 00000000700025f9
!	Mem[0000000010041408] = 0000ffff, %f20 = ff800000
	lda	[%i1+%o4]0x88,%f20	! %f20 = 0000ffff
!	Mem[0000000030081400] = 000000ff, %l3 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = f2a30000, %l0 = 0000000000000000
	ldsba	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l6 = 00000000000000ff
	lduha	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l4 = 0000000000000572, imm = 0000000000000cd7, %l2 = 0000000000000000
	or	%l4,0xcd7,%l2		! %l2 = 0000000000000df7
!	Starting 10 instruction Store Burst
!	Mem[000000001014141b] = ffff00ff, %l3 = 0000000000000000
	ldstuba	[%i5+0x01b]%asi,%l3	! %l3 = 000000ff000000ff

p0_label_200:
!	%l1 = 00000000700025f9, Mem[0000000010141410] = 0000000000000000
	stxa	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000700025f9
!	%f21 = ff000000, Mem[0000000010041400] = 25f9ffe0
	sta	%f21,[%i1+%g0]0x80	! Mem[0000000010041400] = ff000000
!	%l5 = ffffffffffffffff, Mem[00000000100c1410] = 51b3147f
	stha	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffff147f
!	Mem[0000000010101408] = 00000000, %l2 = 0000000000000df7
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 700025f9, %l5 = ffffffffffffffff
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 00000000700025f9
!	Mem[0000000010101410] = 000000ff, %l0 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l5 = 00000000700025f9, Mem[0000000030001408] = ff00004c
	stba	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = f900004c
!	%l0 = 000000ff, %l1 = 700025f9, Mem[0000000010141410] = 00000000 700025f9
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff 700025f9
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000010001406] = 700025f9, %l6 = 0000000000000000
	ldstub	[%i0+0x006],%l6		! %l6 = 00000025000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 01ffffff, %l4 = 0000000000000572
	ldsba	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000001

p0_label_201:
!	Mem[00000000100c1410] = 000000007f14ffff, %f6  = 437f0000 ffff0000
	ldda	[%i3+%o5]0x88,%f6 	! %f6  = 00000000 7f14ffff
!	Mem[0000000030181400] = ffbb80c5, %l0 = 00000000000000ff
	lduha	[%i6+%g0]0x81,%l0	! %l0 = 000000000000ffbb
!	%f24 = 3fed645a, %f30 = ff000000
	fitos	%f24,%f30		! %f30 = 4e7fb591
!	Mem[00000000300c1410] = f9250070, %l4 = 0000000000000001
	ldswa	[%i3+%o5]0x89,%l4	! %l4 = fffffffff9250070
!	Mem[0000000010081428] = b4e5a795 7abaad19, %l4 = f9250070, %l5 = 700025f9
	ldda	[%i2+0x028]%asi,%l4	! %l4 = 00000000b4e5a795 000000007abaad19
!	Mem[0000000030001408] = 4c0000f9, %f0  = 28baad19
	lda	[%i0+%o4]0x89,%f0 	! %f0 = 4c0000f9
!	Mem[0000000030081410] = ff0000ff, %l0 = 000000000000ffbb
	ldswa	[%i2+%o5]0x81,%l0	! %l0 = ffffffffff0000ff
!	Mem[0000000030001408] = 4c0000f9, %f4  = 00000000
	lda	[%i0+%o4]0x89,%f4 	! %f4 = 4c0000f9
!	Mem[0000000010101428] = 00000000, %l2 = 0000000000000000
	ldsba	[%i4+0x029]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f6  = 00000000 7f14ffff, %l0 = ffffffffff0000ff
!	Mem[0000000030081400] = 000000ff00000000
	stda	%f6,[%i2+%l0]ASI_PST32_SL ! Mem[0000000030081400] = ffff147f00000000

p0_label_202:
!	Mem[0000000010101428] = 00000000, %l5 = 000000007abaad19, %asi = 80
	swapa	[%i4+0x028]%asi,%l5	! %l5 = 0000000000000000
!	%f8  = ff00004c c9cbe1f0, Mem[0000000010141410] = ff000000 f9250070
	stda	%f8 ,[%i5+%o5]0x88	! Mem[0000000010141410] = ff00004c c9cbe1f0
!	Mem[0000000010141400] = 3f000000, %l5 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 0000003f000000ff
!	%f28 = 00000000 ff410000, Mem[0000000030141400] = ff7a0000 00007a8d
	stda	%f28,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 ff410000
!	Mem[0000000030081400] = 7f14ffff, %l4 = 00000000b4e5a795
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 000000007f14ffff
!	%l5 = 000000000000003f, Mem[0000000030001408] = f900004c1ab5fe2d
	stxa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000000000003f
!	Mem[0000000010141408] = e0ff0000, %l4 = 000000007f14ffff
	ldstuba	[%i5+%o4]0x80,%l4	! %l4 = 000000e0000000ff
!	%l4 = 00000000000000e0, Mem[0000000010041408] = ffff000000000000, %asi = 80
	stxa	%l4,[%i1+0x008]%asi	! Mem[0000000010041408] = 00000000000000e0
!	%l3 = 00000000000000ff, Mem[0000000030001408] = 3f00000000000000
	stxa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 7f14ffff, %l7 = 00000000005e0000
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 000000000000ffff

p0_label_203:
!	Mem[00000000100c1418] = 28a88367, %l0 = ffffffffff0000ff
	ldsh	[%i3+0x018],%l0		! %l0 = 00000000000028a8
!	Mem[0000000030041408] = fffeb51a, %l3 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041400] = ff000000, %l5 = 000000000000003f
	ldsba	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001410] = 00000000, %l2 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = d4940000, %l5 = ffffffffffffffff
	ldsba	[%i4+%g0]0x81,%l5	! %l5 = ffffffffffffffd4
!	Mem[0000000010001400] = f9ff007019adba28, %l5 = ffffffffffffffd4
	ldxa	[%i0+%g0]0x88,%l5	! %l5 = f9ff007019adba28
!	Mem[0000000010001430] = e0000000, %l1 = 00000000700025f9
	ldsha	[%i0+0x032]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141438] = 00000000000000ff, %f0  = 4c0000f9 700025f9
	ldda	[%i5+0x038]%asi,%f0 	! %f0  = 00000000 000000ff
!	Mem[0000000010001408] = e0ff0000, %l0 = 00000000000028a8
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffffffe0
!	Starting 10 instruction Store Burst
!	%l5 = f9ff007019adba28, Mem[0000000030041408] = 1ab5feff
	stwa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 19adba28

p0_label_204:
!	Mem[0000000030001400] = 00000000, %l2 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000010081410] = 0000899f f9250070
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 ffffffff
!	Mem[0000000010081408] = 00000000, %l0 = ffffffffffffffe0
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l4 = 00000000000000e0, Mem[0000000010081426] = 00000000, %asi = 80
	stha	%l4,[%i2+0x026]%asi	! Mem[0000000010081424] = 000000e0
!	Mem[0000000010101408] = f70d0000, %l7 = 000000000000ffff
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010101400] = ffffffff
	stwa	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Mem[0000000030081400] = 95a7e5b4, %l7 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 00000095000000ff
!	%f14 = 00000000 000000ff, Mem[0000000030141408] = ffffff01 ffffffff
	stda	%f14,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 000000ff
!	%l0 = 0000000000000000, Mem[0000000010081400] = 3e37f7ff51b3147f
	stxa	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_14:
!	%l0 = 0000000000000000
	setx	0xad83a250111d585f,%g7,%l0 ! %l0 = ad83a250111d585f
!	%l1 = 0000000000000000
	setx	0xed29247faed2ac75,%g7,%l1 ! %l1 = ed29247faed2ac75
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ad83a250111d585f
	setx	0x5d8d62107ce003a3,%g7,%l0 ! %l0 = 5d8d62107ce003a3
!	%l1 = ed29247faed2ac75
	setx	0x54acc1b01885623a,%g7,%l1 ! %l1 = 54acc1b01885623a

p0_label_205:
!	%l7 = 0000000000000095, imm = fffffffffffffa1a, %l2 = 0000000000000000
	and	%l7,-0x5e6,%l2		! %l2 = 0000000000000010
!	Mem[0000000030101408] = e0ffffff, %f6  = 00000000
	lda	[%i4+%o4]0x81,%f6 	! %f6 = e0ffffff
!	Mem[0000000030041408] = f925007019adba28, %f0  = 00000000 000000ff
	ldda	[%i1+%o4]0x89,%f0 	! %f0  = f9250070 19adba28
!	Mem[00000000201c0000] = f1ce826e, %l5 = f9ff007019adba28
	ldsh	[%o0+%g0],%l5		! %l5 = fffffffffffff1ce
!	Mem[00000000100c1410] = 000000007f14ffff, %f6  = e0ffffff 7f14ffff
	ldda	[%i3+%o5]0x88,%f6 	! %f6  = 00000000 7f14ffff
!	Mem[0000000010181400] = 3fff645a5097a8ff, %l4 = 00000000000000e0
	ldxa	[%i6+%g0]0x80,%l4	! %l4 = 3fff645a5097a8ff
!	Mem[0000000010141400] = ff000000, %f0  = f9250070
	lda	[%i5+%g0]0x80,%f0 	! %f0 = ff000000
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010041400] = ff000000 4c000000 00000000 000000e0
!	Mem[0000000010041410] = 00000000 000000ff 4cc17a8d 000000ff
!	Mem[0000000010041420] = ffffffff fffff842 bedae363 380ea27e
!	Mem[0000000010041430] = a775ccae a404cce3 0000ff0d ffffffff
	ldda	[%i1]ASI_BLK_PL,%f0	! Block Load from 0000000010041400
!	Mem[0000000010141410] = f0e1cbc9, %l4 = 3fff645a5097a8ff
	ldsha	[%i5+%o5]0x80,%l4	! %l4 = fffffffffffff0e1
!	Starting 10 instruction Store Burst
!	%l0 = 5d8d62107ce003a3, Mem[0000000010101434] = 000000e0, %asi = 80
	stwa	%l0,[%i4+0x034]%asi	! Mem[0000000010101434] = 7ce003a3

p0_label_206:
!	%l2 = 0000000000000010, Mem[00000000100c1400] = ff00004cc9cbe1f0
	stxa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000010
!	Mem[0000000030181408] = ed000000, %l2 = 0000000000000010
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%f26 = 6783a828 d78df1ce, Mem[00000000300c1408] = ee0000ff d6e1b298
	stda	%f26,[%i3+%o4]0x81	! Mem[00000000300c1408] = 6783a828 d78df1ce
!	%l4 = fffff0e1, %l5 = fffff1ce, Mem[0000000030101408] = ffffffe0 48a253ef
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = fffff0e1 fffff1ce
!	Mem[0000000010041410] = 00000000, %l3 = ffffffffffffffff
	swapa	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 42f8ffff, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 0000000042f8ffff
!	%l2 = 0000000000000000, Mem[0000000010181408] = ffff0000ffffffee
	stxa	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	Mem[00000000201c0001] = f1ce826e, %l6 = 0000000000000025
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ce000000ff
!	%l6 = 00000000000000ce, imm = fffffffffffff9ab, %l7 = 0000000000000095
	xnor	%l6,-0x655,%l7		! %l7 = 000000000000069a
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = 00000000000000ff, %f20 = 0000ffff ff000000
	ldd	[%i5+0x038],%f20	! %f20 = 00000000 000000ff

p0_label_207:
!	Mem[0000000010001420] = ff000000, %l2 = 0000000000000000
	lduw	[%i0+0x020],%l2		! %l2 = 00000000ff000000
!	Mem[0000000030001400] = 00000000 000000ff ff000000 00000000
!	Mem[0000000030001410] = 2200a3f2 0ff7373e f9254e70 9f89571e
!	Mem[0000000030001420] = dfee3ea2 c4910c61 4317e2f3 0c377fa2
!	Mem[0000000030001430] = 431e4b92 4bc52f22 7f14b351 5097a866
	ldda	[%i0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030001400
!	Mem[0000000010001400] = 28baad19, %l0 = 5d8d62107ce003a3
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000028
!	Mem[0000000030001408] = ff000000, %l7 = 000000000000069a
	ldsba	[%i0+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181410] = ff000000 00000000, %l6 = 000000ce, %l7 = ffffffff
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[00000000100c1410] = 7f14ffff, %l6 = 0000000000000000
	lduwa	[%i3+%o5]0x88,%l6	! %l6 = 000000007f14ffff
!	Mem[0000000030141408] = 000000ff, %l2 = 00000000ff000000
	lduwa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081408] = ad06ca73 f2a30000, %l6 = 7f14ffff, %l7 = ff000000
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 00000000ad06ca73 00000000f2a30000
!	Mem[0000000010101410] = 00000000, %l7 = 00000000f2a30000
	ldsba	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f10 = 7ea20e38 63e3dabe, Mem[0000000010181438] = 7f14b351 00000000
	stda	%f10,[%i6+0x038]%asi	! Mem[0000000010181438] = 7ea20e38 63e3dabe

p0_label_208:
!	%f11 = 63e3dabe, Mem[0000000030081400] = ffa7e5b4
	sta	%f11,[%i2+%g0]0x81	! Mem[0000000030081400] = 63e3dabe
!	%l6 = 00000000ad06ca73, Mem[00000000211c0001] = ffff7001, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff737001
!	%l1 = 54acc1b01885623a, Mem[00000000100c1439] = 0000ff8d, %asi = 80
	stba	%l1,[%i3+0x039]%asi	! Mem[00000000100c1438] = 003aff8d
!	%l6 = 00000000ad06ca73, Mem[00000000100c1406] = 00000010
	sth	%l6,[%i3+0x006]		! Mem[00000000100c1404] = 0000ca73
!	%l6 = 00000000ad06ca73, Mem[0000000010181410] = 0000a3f2
	stw	%l6,[%i6+%o5]		! Mem[0000000010181410] = ad06ca73
!	%f2  = e0000000 00000000, Mem[0000000010081410] = 00000000 ffffffff
	stda	%f2 ,[%i2+%o5]0x80	! Mem[0000000010081410] = e0000000 00000000
!	%f8  = 42f8ffff ffffffff, Mem[0000000030081400] = bedae363 00000000
	stda	%f8 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 42f8ffff ffffffff
	membar	#Sync			! Added by membar checker (39)
!	%l3 = 0000000042f8ffff, Mem[0000000010041410] = ffffffff
	stba	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff
!	%l5 = fffffffffffff1ce, Mem[00000000100c1414] = 00000000, %asi = 80
	stwa	%l5,[%i3+0x014]%asi	! Mem[00000000100c1414] = fffff1ce
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ffff147f, %f27 = f3e21743
	lda	[%i3+%o5]0x80,%f27	! %f27 = ffff147f

p0_label_209:
!	Mem[00000000100c1408] = ff000000 ffffffe3, %l6 = ad06ca73, %l7 = 00000000
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 00000000ff000000 00000000ffffffe3
!	Mem[0000000010101414] = 00000000, %f27 = ffff147f
	lda	[%i4+0x014]%asi,%f27	! %f27 = 00000000
!	Mem[0000000010001438] = 00000000 000000ff, %l0 = 00000028, %l1 = 1885623a
	ldda	[%i0+0x038]%asi,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[0000000030001408] = ff00000000000000, %l3 = 0000000042f8ffff
	ldxa	[%i0+%o4]0x81,%l3	! %l3 = ff00000000000000
!	Mem[0000000020800000] = ffff8ed8, %l6 = 00000000ff000000
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	%l0 = 0000000000000000, immd = fffffffffffffb64, %l4 = fffffffffffff0e1
	udivx	%l0,-0x49c,%l4		! %l4 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l5 = fffffffffffff1ce
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[000000001010143c] = 00000000, %l3 = ff00000000000000
	ldsh	[%i4+0x03e],%l3		! %l3 = 0000000000000000
!	Mem[0000000010181408] = 0000000000000000, %f2  = e0000000 00000000
	ldda	[%i6+0x008]%asi,%f2 	! %f2  = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030181408] = ff0000ed
	stba	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ed

p0_label_210:
!	Mem[0000000010081418] = f368d4b6, %l5 = 0000000000000000
	swap	[%i2+0x018],%l5		! %l5 = 00000000f368d4b6
!	Mem[000000001008143e] = 91ff0000, %l5 = 00000000f368d4b6
	ldstuba	[%i2+0x03e]%asi,%l5	! %l5 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stha	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000010001410] = 00000000, %l6 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001410] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, %l6 = 0000000000000000, %l5 = 00000000000000ff
	subc	%l5,%l6,%l5		! %l5 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030041400] = fe2da3f2
	stwa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	%f8  = 42f8ffff, %f18 = 00000000, %f0  = 0000004c 000000ff
	fsmuld	%f8 ,%f18,%f0 		! %f0  = 00000000 00000000
!	%f16 = ff000000 00000000, Mem[0000000010001400] = 19adba28 f9ff0070
	stda	%f16,[%i0+%g0]0x88	! Mem[0000000010001400] = ff000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000f9250070, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = 00000000f9250070

p0_label_211:
!	Mem[0000000020800000] = ffff8ed8, %l5 = 00000000000000ff
	ldsba	[%o1+0x001]%asi,%l5	! %l5 = ffffffffffffffff
!	%l5 = ffffffffffffffff, %l7 = 00000000ffffffe3, %y  = 000000ff
	udiv	%l5,%l7,%l2		! %l2 = 0000000000000100
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030181410] = 00000000000000ff, %l6 = 0000000000000000
	ldxa	[%i6+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1408] = 000000ff, %l2 = 0000000000000100
	ldswa	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081410] = 000000e0, %l7 = 00000000ffffffe3
	ldsha	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000e0
!	%f29 = 924b1e43, %f24 = 610c91c4
	fcmpes	%fcc3,%f29,%f24		! %fcc3 = 1
!	Mem[0000000030181400] = ffbb80c5 700025f9, %l4 = f9250070, %l5 = ffffffff
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 00000000ffbb80c5 00000000700025f9
!	Mem[0000000030141410] = 005e0000, %l6 = 00000000000000ff
	ldsba	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = ff000000, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff000df7, %l0 = ffffffffffffff00
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 000000ff000000ff

p0_label_212:
!	%l2 = 00000000000000ff, Mem[0000000010101430] = 000094d47ce003a3, %asi = 80
	stxa	%l2,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000010181404] = 5097a8ff, %asi = 80
	stwa	%l2,[%i6+0x004]%asi	! Mem[0000000010181404] = 000000ff
!	%l4 = ffbb80c5, %l5 = 700025f9, Mem[0000000010101408] = f70d00ff e0ff0000
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = ffbb80c5 700025f9
!	Mem[00000000201c0000] = f1ff826e, %l1 = 00000000000000ff
	ldstub	[%o0+%g0],%l1		! %l1 = 000000f1000000ff
!	%l3 = 0000000000000000, Mem[0000000010001400] = 00000000
	stha	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%f28 = 222fc54b, Mem[0000000010001408] = 0000ffe0
	sta	%f28,[%i0+%o4]0x88	! Mem[0000000010001408] = 222fc54b
!	%l4 = 00000000ffbb80c5, Mem[0000000010101400] = 28baad1900000000
	stxa	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000ffbb80c5
!	%l6 = 0000000000000000, Mem[00000000100c1410] = 7f14ffff
	stwa	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030041400] = ff000000
	stba	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %f10 = 7ea20e38
	lda	[%i3+%g0]0x80,%f10	! %f10 = 00000000

p0_label_213:
!	Code Fragment 3
p0_fragment_15:
!	%l0 = 00000000000000ff
	setx	0x81c71eb7aa403b68,%g7,%l0 ! %l0 = 81c71eb7aa403b68
!	%l1 = 00000000000000f1
	setx	0xe9649287ca8883ae,%g7,%l1 ! %l1 = e9649287ca8883ae
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 81c71eb7aa403b68
	setx	0x6d434a2fe310622f,%g7,%l0 ! %l0 = 6d434a2fe310622f
!	%l1 = e9649287ca8883ae
	setx	0xf674e4883890da32,%g7,%l1 ! %l1 = f674e4883890da32
!	Mem[0000000010181400] = 5a64ff3f, %l1 = f674e4883890da32
	lduwa	[%i6+%g0]0x88,%l1	! %l1 = 000000005a64ff3f
!	Mem[0000000010101408] = c580bbff, %l6 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l6	! %l6 = 00000000000000c5
!	Mem[00000000201c0000] = ffff826e, %l6 = 00000000000000c5
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = 56000000 00000000, %l4 = ffbb80c5, %l5 = 700025f9
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 0000000056000000 0000000000000000
!	Mem[0000000030001408] = ff000000, %l4 = 0000000056000000
	lduha	[%i0+%o4]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010141400] = 00000000, %l2 = 00000000000000ff
	lduwa	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (40)
!	Mem[00000000100c1400] = 00000000 0000ca73 ff000000 ffffffe3
!	Mem[00000000100c1410] = 00000000 fffff1ce 28a88367 ffffffff
!	Mem[00000000100c1420] = 00ff03ff 00000000 0000f1ce 8d7a0000
!	Mem[00000000100c1430] = 000000ff ff7a0000 003aff8d ffffffe3
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[00000000300c1400] = 00000000 000000ff, %l6 = 000000ff, %l7 = 000000e0
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 0000ff00, %l5 = 00000000, Mem[0000000010001400] = 00000000 000000ff
	std	%l4,[%i0+%g0]		! Mem[0000000010001400] = 0000ff00 00000000

p0_label_214:
!	%l2 = 0000000000000000, Mem[0000000010001410] = 000000ff
	stwa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[0000000010001409] = 4bc52f22, %l5 = 0000000000000000
	ldstub	[%i0+0x009],%l5		! %l5 = 000000c5000000ff
!	Mem[00000000100c1400] = 00000000, %l0 = 6d434a2fe310622f
	ldstuba	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%f28 = 222fc54b 924b1e43, Mem[0000000010141418] = ffff00ff ffff0000
	std	%f28,[%i5+0x018]	! Mem[0000000010141418] = 222fc54b 924b1e43
!	Mem[0000000030101410] = 00000000, %l7 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%f17 = 00000000, Mem[0000000010081404] = 00000000
	st	%f17,[%i2+0x004]	! Mem[0000000010081404] = 00000000
!	Mem[0000000010181418] = 2c27cb51, %l6 = 0000000000000000
	swap	[%i6+0x018],%l6		! %l6 = 000000002c27cb51
!	Mem[0000000030101408] = fffff0e1, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 00000000fffff0e1
!	%f20 = 3e37f70f f2a30022, %l6 = 000000002c27cb51
!	Mem[0000000030001438] = 7f14b3515097a866
	add	%i0,0x038,%g1
	stda	%f20,[%g1+%l6]ASI_PST16_S ! Mem[0000000030001438] = 7f14b35150970022
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 0000000000005e00, %f22 = 1e57899f 704e25f9
	ldda	[%i5+%o5]0x89,%f22	! %f22 = 00000000 00005e00

p0_label_215:
!	Mem[00000000218000c0] = ee75de47, %l3 = 0000000000000000
	ldsha	[%o3+0x0c0]%asi,%l3	! %l3 = ffffffffffffee75
!	Mem[00000000201c0000] = ffff826e, %l5 = 00000000000000c5
	ldsb	[%o0+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030141400] = 00000000, %l2 = 00000000fffff0e1
	ldsba	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = f2a30022, %l4 = 000000000000ff00
	ldswa	[%i0+%o5]0x89,%l4	! %l4 = fffffffff2a30022
!	Mem[0000000010041428] = bedae363, %l5 = ffffffffffffffff
	lduba	[%i1+0x02a]%asi,%l5	! %l5 = 00000000000000e3
!	Mem[0000000010081414] = 00000000, %l5 = 00000000000000e3
	lduw	[%i2+0x014],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141430] = e0000000 d4940000, %l6 = 2c27cb51, %l7 = 00000000
	ldda	[%i5+0x030]%asi,%l6	! %l6 = 00000000e0000000 00000000d4940000
!	%f22 = 00000000, %f27 = 00000000, %f24 = 610c91c4 a23eeedf
	fsmuld	%f22,%f27,%f24		! %f24 = 00000000 00000000
!	Mem[0000000030101400] = d494000000000000, %l1 = 000000005a64ff3f
	ldxa	[%i4+%g0]0x81,%l1	! %l1 = d494000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 000000ff000000ff

p0_label_216:
!	%l4 = fffffffff2a30022, Mem[0000000010101400] = c580bbff00000000
	stx	%l4,[%i4+%g0]		! Mem[0000000010101400] = fffffffff2a30022
!	Mem[000000001014141a] = 222fc54b, %l4 = fffffffff2a30022
	ldstub	[%i5+0x01a],%l4		! %l4 = 000000c5000000ff
!	%l0 = 0000000000000000, Mem[00000000300c1400] = 00000000
	stba	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010141406] = 700025f9
	sth	%l5,[%i5+0x006]		! Mem[0000000010141404] = 70000000
!	%f25 = 00000000, Mem[00000000300c1410] = f9250070
	sta	%f25,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010181420] = ff410000, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x020]%asi,%l2	! %l2 = 00000000ff410000
!	%l6 = 00000000e0000000, Mem[0000000030141410] = 00005e00
	stba	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00005e00
!	Mem[0000000010001418] = 437f0000, %l7 = 00000000d4940000
	ldstuba	[%i0+0x018]%asi,%l7	! %l7 = 00000043000000ff
!	%l3 = ffffffffffffee75, Mem[0000000010101400] = ffffffff
	stha	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = ee75ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffffffff, %l4 = 00000000000000c5
	lduba	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000ff

p0_label_217:
!	Mem[0000000030041410] = 56000000, %f20 = 3e37f70f
	lda	[%i1+%o5]0x81,%f20	! %f20 = 56000000
!	Mem[0000000010141410] = c9cbe1f0, %l6 = 00000000e0000000
	lduba	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000f0
!	Mem[0000000010001400] = 0000ff00, %l0 = 0000000000000000
	lduba	[%i0+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Code Fragment 4
p0_fragment_16:
!	%l0 = 0000000000000000
	setx	0x9b2bd8cfa8a3bca4,%g7,%l0 ! %l0 = 9b2bd8cfa8a3bca4
!	%l1 = d494000000000000
	setx	0x1397a52009e76740,%g7,%l1 ! %l1 = 1397a52009e76740
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9b2bd8cfa8a3bca4
	setx	0x98d9fa487f879b53,%g7,%l0 ! %l0 = 98d9fa487f879b53
!	%l1 = 1397a52009e76740
	setx	0x077e9100030a2523,%g7,%l1 ! %l1 = 077e9100030a2523
!	Mem[0000000010001400] = 0000ff00 00000000, %l0 = 7f879b53, %l1 = 030a2523
	ldd	[%i0+%g0],%l0		! %l0 = 000000000000ff00 0000000000000000
!	Mem[00000000300c1408] = 28a88367, %l7 = 0000000000000043
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000067
!	Mem[0000000010001400] = 0000000000ff0000, %f0  = 00000000 0000ca73
	ldda	[%i0+%g0]0x88,%f0 	! %f0  = 00000000 00ff0000
!	Mem[0000000030081400] = ffffffff, %l4 = 00000000000000ff
	ldsba	[%i2+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = ffff0000, %l3 = ffffffffffffee75
	lduwa	[%i5+%o4]0x80,%l3	! %l3 = 00000000ffff0000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141434] = d4940000, %l7 = 0000000000000067
	swap	[%i5+0x034],%l7		! %l7 = 00000000d4940000

p0_label_218:
!	%f14 = 003aff8d ffffffe3, Mem[00000000300c1400] = 00000000 ff000000
	stda	%f14,[%i3+%g0]0x89	! Mem[00000000300c1400] = 003aff8d ffffffe3
!	%l4 = ffffffffffffffff, Mem[00000000211c0001] = ff737001, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffff7001
!	%f29 = 924b1e43, Mem[0000000030141400] = 00000000
	sta	%f29,[%i5+%g0]0x81	! Mem[0000000030141400] = 924b1e43
!	Mem[0000000021800001] = ff00fa80, %l4 = ffffffffffffffff
	ldstuba	[%o3+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081408] = ffffffe0, %l6 = 00000000000000f0
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 00000000ffffffe0
!	%l4 = 0000000000000000, Mem[0000000010181428] = 00000000, %asi = 80
	stba	%l4,[%i6+0x028]%asi	! Mem[0000000010181428] = 00000000
!	%l2 = ff410000, %l3 = ffff0000, Mem[0000000030041408] = 19adba28 f9250070
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = ff410000 ffff0000
!	%l2 = 00000000ff410000, Mem[0000000030141400] = 924b1e43
	stba	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 004b1e43
!	Mem[00000000201c0000] = ffff826e, %l4 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000, %l4 = 00000000000000ff
	lduw	[%i5+%g0],%l4		! %l4 = 0000000000000000

p0_label_219:
!	Mem[0000000010181400] = 3fff645a, %f9  = 00000000
	lda	[%i6+%g0]0x80,%f9 	! %f9 = 3fff645a
!	Mem[0000000010001408] = 4bff2f22, %l5 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l5	! %l5 = 000000004bff2f22
!	Mem[0000000030181410] = 00000000, %l7 = 00000000d4940000
	lduha	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800040] = 25f9cbdb, %l7 = 0000000000000000
	ldsh	[%o1+0x040],%l7		! %l7 = 00000000000025f9
!	Mem[0000000010181414] = 00000019, %l4 = 0000000000000000
	ldsw	[%i6+0x014],%l4		! %l4 = 0000000000000019
!	Mem[0000000010081420] = 00000000, %l2 = 00000000ff410000
	ldsha	[%i2+0x020]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00000000000000e0, %l5 = 000000004bff2f22
	ldxa	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000e0
!	Mem[0000000010101408] = 700025f9ffbb80c5, %f8  = 00ff03ff 3fff645a
	ldda	[%i4+%o4]0x88,%f8 	! %f8  = 700025f9 ffbb80c5
!	Mem[0000000030141400] = 431e4b00, %l1 = 0000000000000000
	ldswa	[%i5+%g0]0x89,%l1	! %l1 = 00000000431e4b00
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000e0, Mem[0000000030041408] = ff410000
	stha	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = ff4100e0

p0_label_220:
!	Mem[00000000300c1410] = 00000000, %l0 = 000000000000ff00
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000ffffffe0, Mem[0000000010041408] = 00000000
	stba	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000e0
!	Mem[00000000100c1400] = ff000000, %l5 = 00000000000000e0
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%l3 = 00000000ffff0000, Mem[0000000010041400] = ff000000
	stha	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Mem[0000000030001410] = 2200a3f2, %l5 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 00000022000000ff
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000021800040] = 03ff34f9, %l5 = 0000000000000022
	ldstub	[%o3+0x040],%l5		! %l5 = 00000003000000ff
!	Mem[0000000010081400] = 00000000, %l6 = 00000000ffffffe0
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%f10 = 0000f1ce 8d7a0000, %l7 = 00000000000025f9
!	Mem[0000000030001410] = ff00a3f20ff7373e
	add	%i0,0x010,%g1
	stda	%f10,[%g1+%l7]ASI_PST8_S ! Mem[0000000030001410] = 0000f1ce8df73700
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 0000ff00, %l1 = 00000000431e4b00
	lduba	[%i0+0x002]%asi,%l1	! %l1 = 00000000000000ff

p0_label_221:
!	Mem[0000000010101408] = 700025f9 ffbb80c5, %l6 = 00000000, %l7 = 000025f9
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 00000000ffbb80c5 00000000700025f9
!	Mem[0000000030041400] = 000000ff, %l3 = 00000000ffff0000
	ldsha	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 6783a828d78df1ce, %f28 = 222fc54b 924b1e43
	ldda	[%i3+%o4]0x81,%f28	! %f28 = 6783a828 d78df1ce
!	%f4  = 00000000, %f24 = 00000000, %f25 = 00000000
	fdivs	%f4 ,%f24,%f25		! %f25 = 7fffffff
!	Mem[0000000030001410] = 0000f1ce 8df73700, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 000000000000f1ce 000000008df73700
!	Mem[0000000030181400] = ffbb80c5 700025f9 000000ed 1ab5feff
!	Mem[0000000030181410] = 00000000 000000ff f927f3d8 6025bc2d
!	Mem[0000000030181420] = b4e5a795 5a64ed3f cef18dd7 28a88367
!	Mem[0000000030181430] = 9ae99a45 0ff7373e 39307cef cc174fb6
	ldda	[%i6]ASI_BLK_S,%f0	! Block Load from 0000000030181400
!	Mem[00000000100c1420] = 00ff03ff00000000, %f30 = 66a89750 51b3147f
	ldd	[%i3+0x020],%f30	! %f30 = 00ff03ff 00000000
!	Mem[0000000030181400] = c580bbff, %l6 = 00000000ffbb80c5
	lduha	[%i6+%g0]0x89,%l6	! %l6 = 000000000000bbff
!	Mem[00000000100c1400] = 000000ff, %l6 = 000000000000bbff
	lduwa	[%i3+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f24 = 00000000, Mem[0000000030081408] = 73ca06ad
	sta	%f24,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000

p0_label_222:
!	%f17 = 00000000, Mem[0000000030101408] = 000000ff
	sta	%f17,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
	membar	#Sync			! Added by membar checker (41)
!	%l4 = 0000000000000019, Mem[0000000030181410] = 00000000000000ff
	stxa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000019
!	Mem[0000000030041400] = ff000000, %l6 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181410] = ad06ca73, %l1 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 000000ad000000ff
!	%f20 = 56000000 f2a30022, Mem[0000000010141408] = 0000ffff 4c0000ff
	stda	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = 56000000 f2a30022
!	%f17 = 00000000, Mem[00000000100c1410] = 00000000
	sta	%f17,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	Mem[0000000010041400] = 00000000, %l0 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%f7  = 6025bc2d, Mem[0000000030181408] = ed000000
	sta	%f7 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 6025bc2d
!	%l4 = 00000019, %l5 = 00000003, Mem[0000000030141408] = 000000ff 00000000
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000019 00000003
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l7 = 00000000700025f9
	lduwa	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000

p0_label_223:
!	Mem[0000000010001400] = 0000ff0000000000, %l2 = 000000000000f1ce
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = 0000ff0000000000
!	Mem[0000000010041400] = 00000000, %l2 = 0000ff0000000000
	ldsba	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l5 = 0000000000000003
	ldswa	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = 0000ff00, %l3 = 000000008df73700
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l4 = 0000000000000019
	ldsba	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ffff826e, %l6 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041414] = 000000ff, %l1 = 00000000000000ad
	ldsba	[%i1+0x016]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 3fff645a, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 000000003fff645a
!	Mem[0000000010101400] = ee75ffff f2a30022, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+0x000]%asi,%l4	! %l4 = 00000000ee75ffff 00000000f2a30022
!	Starting 10 instruction Store Burst
!	Mem[00000000100c140c] = ffffffe3, %l6 = 00000000000000ff
	ldstub	[%i3+0x00c],%l6		! %l6 = 000000ff000000ff

p0_label_224:
!	Mem[0000000030181410] = 00000000, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%f8  = b4e5a795 5a64ed3f, Mem[0000000010101418] = 1e57899f 70ff25f9
	stda	%f8 ,[%i4+0x018]%asi	! Mem[0000000010101418] = b4e5a795 5a64ed3f
!	%l7 = 0000000000000000, Mem[00000000100c1408] = ff000000
	stba	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%f16 = ff000000 00000000 00000000 000000ff
!	%f20 = 56000000 f2a30022 00000000 00005e00
!	%f24 = 00000000 7fffffff a27f370c 00000000
!	%f28 = 6783a828 d78df1ce 00ff03ff 00000000
	stda	%f16,[%i6]ASI_BLK_P	! Block Store to 0000000010181400
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%f9  = 5a64ed3f, %f11 = 28a88367
	fcmps	%fcc3,%f9 ,%f11		! %fcc3 = 2
!	Mem[0000000030181410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041430] = a775ccae, %l4 = ee75ffff, %l2 = 3fff645a
	add	%i1,0x30,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000a775ccae
!	%f14 = 39307cef cc174fb6, Mem[0000000030001408] = 000000ff 00000000
	stda	%f14,[%i0+%o4]0x89	! Mem[0000000030001408] = 39307cef cc174fb6
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff0000ff 00000019, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 00000000ff0000ff 0000000000000019

p0_label_225:
!	Mem[0000000030141410] = 00005e00, %l4 = 00000000ee75ffff
	ldsba	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (42)
!	Mem[000000001018142c] = 00000000, %l4 = 0000000000000000
	lduba	[%i6+0x02f]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l2 = 00000000a775ccae
	lduwa	[%i4+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = 0000000000ff0000, %l4 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l4	! %l4 = 0000000000ff0000
!	Mem[0000000030041408] = e00041ff, %l6 = 00000000ff0000ff
	ldsba	[%i1+%o4]0x81,%l6	! %l6 = ffffffffffffffe0
!	Mem[0000000030141410] = 00005e00, %f16 = ff000000
	lda	[%i5+%o5]0x89,%f16	! %f16 = 00005e00
!	Mem[0000000010181408] = 00000000, %l0 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 003aff8dffffffe3, %f12 = 9ae99a45 0ff7373e
	ldda	[%i3+%g0]0x89,%f12	! %f12 = 003aff8d ffffffe3
!	Mem[0000000010041410] = ffffffff000000ff, %f22 = 00000000 00005e00
	ldda	[%i1+%o5]0x80,%f22	! %f22 = ffffffff 000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000ff0000, Mem[0000000010181420] = 000000007fffffff, %asi = 80
	stxa	%l4,[%i6+0x020]%asi	! Mem[0000000010181420] = 0000000000ff0000

p0_label_226:
!	Mem[0000000010101400] = ffff75ee, %l3 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l3	! %l3 = 00000000ffff75ee
!	%l0 = 0000000000000000, Mem[000000001014143d] = 000000ff, %asi = 80
	stba	%l0,[%i5+0x03d]%asi	! Mem[000000001014143c] = 000000ff
!	%l7 = 0000000000000019, Mem[00000000100c1400] = 000000ff
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000019
!	%l5 = 00000000f2a30022, Mem[0000000030001408] = cc174fb6
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = cc174f22
!	Mem[0000000030041400] = ff0000ff, %l4 = 0000000000ff0000
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	%f8  = b4e5a795 5a64ed3f, Mem[00000000100c1408] = 00000000 ffffffe3
	stda	%f8 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = b4e5a795 5a64ed3f
!	%l3 = 00000000ffff75ee, Mem[0000000030001408] = 224f17ccef7c3039
	stxa	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000ffff75ee
!	%l7 = 0000000000000019, Mem[0000000010141434] = 00000067
	stw	%l7,[%i5+0x034]		! Mem[0000000010141434] = 00000019
!	%l4 = 00000000000000ff, Mem[0000000020800000] = ffff8ed8
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = 00ff8ed8
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 0000ff0000000000, %f12 = 003aff8d ffffffe3
	ldda	[%i0+0x000]%asi,%f12	! %f12 = 0000ff00 00000000

p0_label_227:
!	Mem[0000000010141410] = ff00004cc9cbe1f0, %l6 = ffffffffffffffe0
	ldxa	[%i5+%o5]0x88,%l6	! %l6 = ff00004cc9cbe1f0
!	Mem[0000000010041400] = 0000004c00000000, %l5 = 00000000f2a30022
	ldxa	[%i1+%g0]0x88,%l5	! %l5 = 0000004c00000000
!	%l3 = 00000000ffff75ee, Mem[0000000030141408] = 00000019
	stba	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ee
!	%f9  = 5a64ed3f, %f21 = f2a30022, %f3  = 1ab5feff
	fmuls	%f9 ,%f21,%f3 		! %f3  = ff800000
!	Mem[0000000010101410] = 00000000, %f3  = ff800000
	lda	[%i4+%o5]0x80,%f3 	! %f3 = 00000000
!	Mem[0000000010041408] = 000000e0, %l4 = 00000000000000ff
	lduba	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000e0
!	Mem[0000000030081400] = ffffffff, %l3 = 00000000ffff75ee
	ldsba	[%i2+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[000000001010143c] = 00000000, %f29 = d78df1ce
	lda	[%i4+0x03c]%asi,%f29	! %f29 = 00000000
!	Mem[00000000300c1400] = e3ffffff, %l3 = ffffffffffffffff
	lduha	[%i3+%g0]0x81,%l3	! %l3 = 000000000000e3ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00000000, %l3 = 000000000000e3ff
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_228:
!	Mem[0000000030181410] = 000000ff, %l5 = 0000004c00000000
	ldstuba	[%i6+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%l6 = ff00004cc9cbe1f0, Mem[0000000010101411] = 00000000
	stb	%l6,[%i4+0x011]		! Mem[0000000010101410] = 00f00000
!	%l0 = 0000000000000000, Mem[0000000030181410] = ff00000000000019
	stxa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000000
!	%f12 = 0000ff00, Mem[0000000010101400] = 00000000
	sta	%f12,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000ff00
!	Mem[0000000010101400] = 00ff0000, %l1 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%f14 = 39307cef, Mem[0000000010101438] = ff000000
	st	%f14,[%i4+0x038]	! Mem[0000000010101438] = 39307cef
!	%l7 = 0000000000000019, Mem[0000000010001408] = 222fff4b
	stwa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000019
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010101400] = 00ff00ff 2200a3f2
	stda	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 00000000
!	%f15 = cc174fb6, Mem[0000000030101410] = ff000000
	sta	%f15,[%i4+%o5]0x81	! Mem[0000000030101410] = cc174fb6
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ffffffe0, %l0 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffffffe0

p0_label_229:
!	Mem[0000000030001410] = cef10000, %l6 = ff00004cc9cbe1f0
	lduha	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 6783a828, %l2 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l2	! %l2 = 0000000000006783
!	Mem[000000001008143c] = 91ffff00, %l7 = 0000000000000019
	lduha	[%i2+0x03e]%asi,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010001400] = 0000ff00, %l0 = ffffffffffffffe0
	lduha	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = 00000056, %l7 = 000000000000ff00
	lduba	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000056
!	Mem[0000000010181420] = 00000000, %l3 = 0000000000000000
	lduha	[%i6+0x022]%asi,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000030101400] = d4940000 00000000 00000000 cef1ffff
!	Mem[0000000030101410] = cc174fb6 ff000000 00000000 c9cbe1f0
!	Mem[0000000030101420] = 3fed645a 95a7e5b4 6783a828 d78df1ce
!	Mem[0000000030101430] = 3e37f70f ff410000 48a253ef 9f890000
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[0000000010081400] = e0ffffff, %l7 = 0000000000000056
	ldsha	[%i2+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001408] = 19000000ff00004c, %l0 = 0000000000000000
	ldx	[%i0+%o4],%l0		! %l0 = 19000000ff00004c
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = ff4100e0, %l1 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 00000000ff4100e0

p0_label_230:
!	%l1 = 00000000ff4100e0, Mem[0000000010101410] = 00f00000
	stba	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = e0f00000
!	%l0 = 19000000ff00004c, Mem[0000000030041410] = 5600000000000000
	stxa	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 19000000ff00004c
!	Mem[0000000010041400] = 00000000, %l6 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141414] = 4c0000ff, %l7 = ffffffffffffffff, %asi = 80
	swapa	[%i5+0x014]%asi,%l7	! %l7 = 000000004c0000ff
!	Mem[0000000030001400] = 00000000, %l0 = 19000000ff00004c
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = cc174fb6, %l5 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 000000cc000000ff
	membar	#Sync			! Added by membar checker (44)
!	%l2 = 0000000000006783, Mem[0000000030101400] = 000094d4
	stha	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00006783
!	%f0  = d4940000 00000000 00000000 cef1ffff
!	%f4  = cc174fb6 ff000000 00000000 c9cbe1f0
!	%f8  = 3fed645a 95a7e5b4 6783a828 d78df1ce
!	%f12 = 3e37f70f ff410000 48a253ef 9f890000
	stda	%f0,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	%l3 = 0000000000000000, Mem[0000000010181410] = 2200a3f200000056
	stxa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000003000000ee, %f24 = 00000000 7fffffff
	ldda	[%i5+%o4]0x89,%f24	! %f24 = 00000003 000000ee

p0_label_231:
!	Mem[0000000010001400] = 0000ff00, %l5 = 00000000000000cc
	lduw	[%i0+%g0],%l5		! %l5 = 000000000000ff00
!	Mem[0000000010141400] = 00000000, %l4 = 00000000000000e0
	lduwa	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = e0f00000 00000000, %l6 = 00000000, %l7 = 4c0000ff
	ldda	[%i4+0x010]%asi,%l6	! %l6 = 00000000e0f00000 0000000000000000
!	Mem[0000000010081408] = 000000f0000000ff, %l6 = 00000000e0f00000
	ldxa	[%i2+%o4]0x80,%l6	! %l6 = 000000f0000000ff
!	Mem[0000000010101410] = 000000000000f0e0, %f20 = 56000000 f2a30022
	ldda	[%i4+%o5]0x88,%f20	! %f20 = 00000000 0000f0e0
!	Mem[0000000030081410] = ff0000ff00000000, %f30 = 00ff03ff 00000000
	ldda	[%i2+%o5]0x81,%f30	! %f30 = ff0000ff 00000000
!	Mem[0000000010101410] = 0000f0e0, %l7 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l7	! %l7 = ffffffffffffffe0
!	Mem[00000000300c1410] = 0000ff00, %l2 = 0000000000006783
	ldsha	[%i3+%o5]0x89,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030101400] = 00006783, %l0 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l0	! %l0 = 0000000000006783
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000006783, %l4 = 0000000000000000, %l2  = ffffffffffffff00
	mulx	%l0,%l4,%l2		! %l2 = 0000000000000000

p0_label_232:
!	%f0  = d4940000 00000000 00000000 cef1ffff
!	%f4  = cc174fb6 ff000000 00000000 c9cbe1f0
!	%f8  = 3fed645a 95a7e5b4 6783a828 d78df1ce
!	%f12 = 3e37f70f ff410000 48a253ef 9f890000
	stda	%f0,[%i5]ASI_BLK_P	! Block Store to 0000000010141400
!	Mem[0000000030001400] = 4c0000ff, %l5 = 000000000000ff00
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 000000004c0000ff
!	Mem[0000000030001400] = 00ff0000, %l6 = 000000f0000000ff
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000ff0000
!	Mem[0000000010001408] = 19000000, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l3	! %l3 = 00000019000000ff
	membar	#Sync			! Added by membar checker (45)
!	%l7 = ffffffffffffffe0, Mem[00000000100c1408] = 00000000
	stwa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffe0
!	Mem[0000000010081430] = 1364a27b, %l2 = 0000000000000000
	swap	[%i2+0x030],%l2		! %l2 = 000000001364a27b
!	%f8  = 3fed645a 95a7e5b4, Mem[0000000010181408] = 00000000 000000ff
	stda	%f8 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 3fed645a 95a7e5b4
!	Mem[0000000021800080] = ffff944f, %l7 = ffffffffffffffe0
	ldstub	[%o3+0x080],%l7		! %l7 = 000000ff000000ff
!	%l0 = 0000000000006783, Mem[0000000030101408] = 00000000
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000083
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 2dbc2560 1ab5feff, %l2 = 1364a27b, %l3 = 00000019
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 000000002dbc2560 000000001ab5feff

p0_label_233:
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000ff0000
	ldsh	[%i6+%o5],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1410] = cc174fb6, %l5 = 000000004c0000ff
	lduwa	[%i3+0x010]%asi,%l5	! %l5 = 00000000cc174fb6
!	Mem[0000000010081408] = f0000000, %l6 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = 000000f0, %f22 = ffffffff
	lda	[%i2+0x008]%asi,%f22	! %f22 = 000000f0
!	Mem[00000000100c142c] = d78df1ce, %l6 = 0000000000000000
	lduw	[%i3+0x02c],%l6		! %l6 = 00000000d78df1ce
!	Mem[0000000010101410] = e0f00000, %l5 = 00000000cc174fb6
	lduwa	[%i4+%o5]0x80,%l5	! %l5 = 00000000e0f00000
!	Mem[0000000030101408] = fffff1ce00000083, %l6 = 00000000d78df1ce
	ldxa	[%i4+%o4]0x89,%l6	! %l6 = fffff1ce00000083
!	Mem[0000000010181400] = ff000000, %l4 = 0000000000000000
	ldsha	[%i6+%g0]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010081408] = f0000000, %f9  = 95a7e5b4
	lda	[%i2+%o4]0x88,%f9 	! %f9 = f0000000
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_17:
!	%l0 = 0000000000006783
	setx	0x6397389031ed43d4,%g7,%l0 ! %l0 = 6397389031ed43d4
!	%l1 = 00000000ff4100e0
	setx	0x35f6a0b80931075a,%g7,%l1 ! %l1 = 35f6a0b80931075a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6397389031ed43d4
	setx	0xacdda8a03996967c,%g7,%l0 ! %l0 = acdda8a03996967c
!	%l1 = 35f6a0b80931075a
	setx	0x8d7e5d3fd3d863b9,%g7,%l1 ! %l1 = 8d7e5d3fd3d863b9

p0_label_234:
!	%l1 = 8d7e5d3fd3d863b9, Mem[0000000010041408] = 000000e0
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 000063b9
!	%f21 = 0000f0e0, Mem[0000000030141400] = 004b1e43
	sta	%f21,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000f0e0
!	%f16 = 00005e00 00000000 00000000 000000ff
!	%f20 = 00000000 0000f0e0 000000f0 000000ff
!	%f24 = 00000003 000000ee a27f370c 00000000
!	%f28 = 6783a828 00000000 ff0000ff 00000000
	stda	%f16,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	%l6 = fffff1ce00000083, Mem[0000000010001410] = ff000000ffe30000
	stxa	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = fffff1ce00000083
!	%f0  = d4940000 00000000, %l5 = 00000000e0f00000
!	Mem[0000000030041430] = 450000ffffffffe3
	add	%i1,0x030,%g1
	stda	%f0,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030041430] = 450000ffffffffe3
!	Mem[0000000030141410] = 00005e00, %l4 = ffffffffffffff00
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000005e00
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010101404] = 00000000, %l5 = 00000000e0f00000
	ldstuba	[%i4+0x004]%asi,%l5	! %l5 = 00000000000000ff
!	%l6 = 00000083, %l7 = 000000ff, Mem[0000000010001408] = ff000000 ff00004c
	stda	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000083 000000ff
!	Mem[0000000010041408] = b9630000, %l3 = 000000001ab5feff
	swapa	[%i1+%o4]0x80,%l3	! %l3 = 00000000b9630000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 0000000000000000, %l3 = 00000000b9630000
	ldx	[%i6+%o5],%l3		! %l3 = 0000000000000000

p0_label_235:
!	Mem[0000000010141418] = 00000000 c9cbe1f0, %l4 = 00005e00, %l5 = 00000000
	ldd	[%i5+0x018],%l4		! %l4 = 0000000000000000 00000000c9cbe1f0
!	Mem[0000000030141408] = 000000ee, %f29 = 00000000
	lda	[%i5+%o4]0x89,%f29	! %f29 = 000000ee
!	Mem[0000000010101408] = 00000000, %l1 = 8d7e5d3fd3d863b9
	ldsha	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 000041ffe0f00000, %l1 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l1	! %l1 = 000041ffe0f00000
!	Mem[0000000010001410] = 83000000, %l3 = 0000000000000000
	ldsba	[%i0+0x012]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l2 = 000000002dbc2560
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 00000000 ff0000ff, %l4 = 00000000, %l5 = c9cbe1f0
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000ff0000ff 0000000000000000
!	Mem[0000000010041410] = ffffffff, %l0 = acdda8a03996967c
	lduwa	[%i1+%o5]0x80,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010001400] = 00ff0000, %l7 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ffff826e, %l4 = 00000000ff0000ff
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff

p0_label_236:
!	%l7 = 0000000000000000, Mem[000000001000143c] = 000000ff
	stw	%l7,[%i0+0x03c]		! Mem[000000001000143c] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010101400] = 005e0000
	stba	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 005e0000
!	Mem[00000000300c1408] = 6783a828, %l0 = 00000000ffffffff
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 00000067000000ff
!	%l4 = 00000000000000ff, Mem[0000000030181408] = 6025bc2d
	stwa	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	Mem[00000000100c1407] = 00000000, %l1 = 000041ffe0f00000
	ldstuba	[%i3+0x007]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001408] = 00000083, %l6 = fffff1ce00000083
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000083
!	Mem[00000000100c1430] = 3e37f70f, %l7 = 00000000, %l6 = 00000083
	add	%i3,0x30,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 000000003e37f70f
!	Mem[00000000100c1410] = cc174fb6, %l4 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 000000cc000000ff
!	%l7 = 0000000000000000, Mem[0000000010001400] = 0000000000ff0000
	stxa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff0000ff, %f0  = d4940000
	lda	[%i2+%o5]0x81,%f0 	! %f0 = ff0000ff

p0_label_237:
!	Mem[0000000010001400] = 00000000, %l6 = 000000003e37f70f
	lduba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = f9250070c580bbff, %f22 = 000000f0 000000ff
	ldda	[%i6+%g0]0x89,%f22	! %f22 = f9250070 c580bbff
!	Mem[0000000010101408] = 00000000, %l4 = 00000000000000cc
	ldswa	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l5 = 0000000000000000
	lduba	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = b64f17ff, %l0 = 0000000000000067
	lduba	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181408] = 3fed645a95a7e5b4, %f14 = 48a253ef 9f890000
	ldd	[%i6+%o4],%f14		! %f14 = 3fed645a 95a7e5b4
!	Mem[0000000010181400] = ff000000, %l0 = 00000000000000ff
	ldsba	[%i6+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041408] = fffeb51a, %l7 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l7	! %l7 = 00000000fffeb51a
!	Mem[00000000201c0000] = ffff826e, %l7 = 00000000fffeb51a
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1434] = ff410000, %l1 = 0000000000000000, %asi = 80
	swapa	[%i3+0x034]%asi,%l1	! %l1 = 00000000ff410000

p0_label_238:
!	%f18 = 00000000 000000ff, %l4 = 0000000000000000
!	Mem[00000000300c1418] = 2dbc2560d8f327f9
	add	%i3,0x018,%g1
	stda	%f18,[%g1+%l4]ASI_PST32_SL ! Mem[00000000300c1418] = 2dbc2560d8f327f9
!	Mem[0000000030001400] = 000000ff, %l5 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041406] = 4c000000, %l4 = 0000000000000000
	ldstuba	[%i1+0x006]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081410] = e0000000, %l2 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l2	! %l2 = 00000000e0000000
!	%l0 = ffffffffffffffff, Mem[000000001018141c] = 00005e00, %asi = 80
	stba	%l0,[%i6+0x01c]%asi	! Mem[000000001018141c] = ff005e00
!	%l2 = 00000000e0000000, Mem[00000000100c1408] = e0ffffff
	stwa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = e0000000
!	%f30 = ff0000ff 00000000, Mem[00000000300c1408] = 28a883ff cef18dd7
	stda	%f30,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff0000ff 00000000
!	Mem[0000000010181420] = 00000000, %l4 = 0000000000000000
	ldstub	[%i6+0x020],%l4		! %l4 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[00000000100c1410] = b64f17ff
	stba	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = b64f17ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ffbb80c5, %l2 = 00000000e0000000
	ldswa	[%i6+%g0]0x81,%l2	! %l2 = ffffffffffbb80c5

p0_label_239:
!	Mem[0000000021800100] = 5e004cdd, %l0 = ffffffffffffffff
	ldsb	[%o3+0x101],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181410] = 00000000 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030001400] = ff000000, %f1  = 00000000
	lda	[%i0+%g0]0x89,%f1 	! %f1 = ff000000
!	Mem[0000000010181408] = 3fed645a, %l0 = 0000000000000000
	lduha	[%i6+%o4]0x80,%l0	! %l0 = 0000000000003fed
!	Mem[0000000030181410] = 00000000, %l2 = ffffffffffbb80c5
	lduha	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041430] = a775ccaea404cce3, %l6 = 0000000000000000
	ldx	[%i1+0x030],%l6		! %l6 = a775ccaea404cce3
!	Mem[0000000010141400] = d4940000 00000000 00000000 cef1ffff
!	Mem[0000000010141410] = cc174fb6 ff000000 00000000 c9cbe1f0
!	Mem[0000000010141420] = 3fed645a 95a7e5b4 6783a828 d78df1ce
!	Mem[0000000010141430] = 3e37f70f ff410000 48a253ef 9f890000
	ldda	[%i5]ASI_BLK_P,%f0	! Block Load from 0000000010141400
!	Mem[0000000010141410] = cc174fb6, %f29 = 000000ee
	lda	[%i5+%o5]0x80,%f29	! %f29 = cc174fb6
!	Mem[00000000211c0000] = ffff7001, %l3 = 0000000000000000
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = a404cce3, %l7 = 000000ff, Mem[00000000300c1408] = 00000000 ff0000ff
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = a404cce3 000000ff

p0_label_240:
!	%l7 = 00000000000000ff, %l1 = 00000000ff410000, %l6 = a775ccaea404cce3
	sub	%l7,%l1,%l6		! %l6 = ffffffff00bf00ff
!	%l3 = ffffffffffffffff, Mem[0000000010001400] = 0000000000000000
	stxa	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffffffffffff
!	Mem[00000000100c1430] = 3e37f70f, %l2 = 0000000000000000
	swap	[%i3+0x030],%l2		! %l2 = 000000003e37f70f
	membar	#Sync			! Added by membar checker (47)
!	%f26 = a27f370c 00000000, Mem[0000000010141410] = b64f17cc 000000ff
	stda	%f26,[%i5+%o5]0x88	! Mem[0000000010141410] = a27f370c 00000000
!	%f19 = 000000ff, Mem[0000000010141400] = 000094d4
	sta	%f19,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	%l4 = 0000000000000000, Mem[0000000010081410] = 00000000
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	%f16 = 00005e00 00000000 00000000 000000ff
!	%f20 = 00000000 0000f0e0 f9250070 c580bbff
!	%f24 = 00000003 000000ee a27f370c 00000000
!	%f28 = 6783a828 cc174fb6 ff0000ff 00000000
	stda	%f16,[%i5]ASI_COMMIT_S	! Block Store to 0000000030141400
!	%f14 = 48a253ef 9f890000, %l6 = ffffffff00bf00ff
!	Mem[0000000030041430] = 450000ffffffffe3
	add	%i1,0x030,%g1
	stda	%f14,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030041430] = 0000899fef53a248
!	%l0 = 0000000000003fed, Mem[00000000300c1410] = 00ff000000000000
	stxa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000003fed
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = e0000000cef1ffff, %l0 = 0000000000003fed
	ldxa	[%i3+0x008]%asi,%l0	! %l0 = e0000000cef1ffff

p0_label_241:
!	Mem[0000000030041408] = 00000000, %l7 = 00000000000000ff
	lduba	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000030141400] = 00005e00 00000000 00000000 000000ff
!	Mem[0000000030141410] = 00000000 0000f0e0 f9250070 c580bbff
!	Mem[0000000030141420] = 00000003 000000ee a27f370c 00000000
!	Mem[0000000030141430] = 6783a828 cc174fb6 ff0000ff 00000000
	ldda	[%i5]ASI_BLK_SL,%f0	! Block Load from 0000000030141400
!	Mem[00000000300c1410] = 00000000, %l3 = ffffffffffffffff
	ldsba	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %f20 = 00000000
	lda	[%i6+%o4]0x81,%f20	! %f20 = ff000000
!	Mem[0000000030141400] = 00005e00, %l2 = 000000003e37f70f
	ldsba	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 83000000, %l3 = 0000000000000000
	lduba	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000083
!	Mem[0000000010141410] = 00000000, %l6 = ffffffff00bf00ff
	lduwa	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = 000000f0, %l3 = 0000000000000083
	ldswa	[%i2+%o4]0x80,%l3	! %l3 = 00000000000000f0
!	Mem[0000000010081410] = 00000000, %l1 = 00000000ff410000
	lduha	[%i2+0x010]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010101410] = 00000000
	stba	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000

p0_label_242:
!	Mem[00000000300c1408] = e3cc04a4, %l1 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l1	! %l1 = 000000e3000000ff
!	%l3 = 00000000000000f0, Mem[00000000100c1408] = 000000e0
	stba	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000f0
!	%f26 = a27f370c, Mem[000000001004140c] = 000000e0
	st	%f26,[%i1+0x00c]	! Mem[000000001004140c] = a27f370c
!	%l0 = e0000000cef1ffff, Mem[00000000100c1410] = b64f17ff
	stba	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = b64f17ff
!	%f22 = f9250070 c580bbff, Mem[0000000010001428] = 00000000 51b3147f
	std	%f22,[%i0+0x028]	! Mem[0000000010001428] = f9250070 c580bbff
!	%l2 = 0000000000000000, imm = 000000000000076d, %l1 = 00000000000000e3
	sub	%l2,0x76d,%l1		! %l1 = fffffffffffff893
!	%l7 = 0000000000000000, Mem[0000000010141431] = 3e37f70f
	stb	%l7,[%i5+0x031]		! Mem[0000000010141430] = 3e00f70f
!	%l2 = 0000000000000000, %l7 = 0000000000000000, %y  = 00000000
	umul	%l2,%l7,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[00000000100c1408] = f0000000, %l3 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 00000000f0000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 19000000 ff00004c, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 0000000019000000 00000000ff00004c

p0_label_243:
!	Mem[0000000010101408] = 00000000, %l0 = e0000000cef1ffff
	ldswa	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 00000000 000000ff, %l0 = 00000000, %l1 = fffff893
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[0000000010181408] = b4e5a795 5a64ed3f, %l6 = 19000000, %l7 = ff00004c
	ldda	[%i6+%o4]0x88,%l6	! %l6 = 000000005a64ed3f 00000000b4e5a795
!	Mem[0000000030141408] = 00000000, %l4 = 0000000000000000
	ldsba	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181404] = 00000000, %l1 = 00000000000000ff
	ldub	[%i6+0x006],%l1		! %l1 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l0 = 0000000000000000
	ldsha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = ff00000000000000, %l4 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l4	! %l4 = ff00000000000000
!	Mem[0000000020800000] = 00ff8ed8, %l1 = 0000000000000000
	ldsha	[%o1+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101400] = 000000ff005e0000, %l4 = ff00000000000000
	ldxa	[%i4+%g0]0x88,%l4	! %l4 = 000000ff005e0000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (49)
!	%f25 = 000000ee, Mem[0000000030141408] = 00000000
	sta	%f25,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ee

p0_label_244:
!	%l0 = 0000000000000000, Mem[0000000030081408] = 00000000f2a30000
	stxa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	Mem[00000000100c1400] = d4940000, %l6 = 000000005a64ed3f
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 00000000d4940000
!	%l0 = 0000000000000000, Mem[0000000020800040] = 25f9cbdb, %asi = 80
	stba	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = 00f9cbdb
!	%l2 = 0000000000000000, Mem[00000000100c1400] = 5a64ed3f
	stha	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000ed3f
!	Mem[0000000030141400] = 00005e00, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l4 = 000000ff005e0000, Mem[0000000030081410] = ff0000ff
	stwa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 005e0000
!	Mem[0000000030101410] = ff174fb6, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%f18 = 00000000, Mem[0000000010101400] = 00005e00
	sta	%f18,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l4 = 000000ff005e0000, Mem[0000000010101408] = 00000000
	stba	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %l7 = 00000000b4e5a795
	ldsha	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000

p0_label_245:
!	Mem[0000000030001410] = 0000f1ce8df73700, %l3 = 00000000f0000000
	ldxa	[%i0+%o5]0x81,%l3	! %l3 = 0000f1ce8df73700
!	%l4 = 000000ff005e0000, immd = fffffffffffff6c4, %l4 = 000000ff005e0000
	udivx	%l4,-0x93c,%l4		! %l4 = 0000000000000000
!	Mem[0000000030181400] = ffbb80c5 700025f9 ff000000 1ab5feff
!	Mem[0000000030181410] = 00000000 00000000 f927f3d8 6025bc2d
!	Mem[0000000030181420] = b4e5a795 5a64ed3f cef18dd7 28a88367
!	Mem[0000000030181430] = 9ae99a45 0ff7373e 39307cef cc174fb6
	ldda	[%i6]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030181400
!	Mem[0000000010041418] = 4cc17a8d, %f13 = 28a88367
	ld	[%i1+0x018],%f13	! %f13 = 4cc17a8d
!	Mem[00000000300c1408] = ffcc04a4, %l6 = 00000000d4940000
	lduha	[%i3+%o4]0x81,%l6	! %l6 = 000000000000ffcc
!	Mem[0000000030101400] = 83670000, %l2 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l2	! %l2 = 0000000000008367
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = ff005e00 00000000, %l6 = 0000ffcc, %l7 = 00000000
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000ff005e00 0000000000000000
!	Mem[0000000010041410] = ffffffff, %l5 = 00000000000000ff
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, imm = 0000000000000f85, %l4 = 0000000000000000
	sub	%l0,0xf85,%l4		! %l4 = fffffffffffff07b

p0_label_246:
!	%l0 = 0000000000000000, Mem[0000000010101400] = 00000000
	stwa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	%f16 = f9250070 c580bbff fffeb51a 000000ff
!	%f20 = 00000000 00000000 2dbc2560 d8f327f9
!	%f24 = 3fed645a 95a7e5b4 6783a828 d78df1ce
!	%f28 = 3e37f70f 459ae99a b64f17cc ef7c3039
	stda	%f16,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	Mem[0000000030001408] = 00000000, %l6 = 00000000ff005e00
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800140] = 00001f70, %l2 = 0000000000008367
	ldstuba	[%o3+0x140]%asi,%l2	! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (50)
!	%l5 = ffffffffffffffff, Mem[00000000100c1406] = c580bbff
	sth	%l5,[%i3+0x006]		! Mem[00000000100c1404] = c580ffff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010181400] = 000000ff 00000000
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 00000000
!	Mem[0000000030001408] = 005e00ff, %l3 = 0000f1ce8df73700
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010181410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010141400] = ff00000000000000
	stxa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000, %l0 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_247:
!	%l1 = 00000000000000ff, imm = 0000000000000f82, %l6 = 0000000000000000
	add	%l1,0xf82,%l6		! %l6 = 0000000000001081
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i3+0x010]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = 0000f1ce, %l3 = 0000000000000000
	ldsha	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 19000000ff0000ff, %l5 = ffffffffffffffff
	ldxa	[%i1+%g0]0x89,%l5	! %l5 = 19000000ff0000ff
!	Mem[0000000030081400] = ffffffff fffff842, %l4 = fffff07b, %l5 = ff0000ff
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 00000000ffffffff 00000000fffff842
!	%f7  = 700025f9, %f22 = 2dbc2560, %f16 = f9250070
	fmuls	%f7 ,%f22,%f16		! %f16 = 5e3c5d31
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000001081
	lduha	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = ffff7001, %l4 = 00000000ffffffff
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = ffffffff, %l7 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 000000ff000000ff

p0_label_248:
!	Mem[0000000030141410] = 00000000, %l5 = 00000000fffff842
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%f6  = ffbb80c5 700025f9, Mem[0000000030081410] = 00005e00 00000000
	stda	%f6 ,[%i2+%o5]0x81	! Mem[0000000030081410] = ffbb80c5 700025f9
!	%l2 = 0000000000000000, Mem[00000000211c0000] = ffff7001
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 00007001
!	%l0 = 0000000000000000, Mem[00000000211c0001] = 00007001
	stb	%l0,[%o2+0x001]		! Mem[00000000211c0000] = 00007001
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010141410] = 00000000 a27f370c
	stda	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 00000000
!	%f2  = ff000000, Mem[0000000030101408] = 00000083
	sta	%f2 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000
!	%l6 = 0000000000000000, Mem[00000000211c0000] = 00007001
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 00007001
!	Mem[0000000020800041] = 00f9cbdb, %l1 = 00000000000000ff
	ldstub	[%o1+0x041],%l1		! %l1 = 000000f9000000ff
!	%l5 = 0000000000000000, Mem[0000000030001410] = 0000f1ce
	stwa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 000000f0000000ff, %f8  = ee000000 03000000
	ldda	[%i2+0x008]%asi,%f8 	! %f8  = 000000f0 000000ff

p0_label_249:
!	%l4 = 000000000000ffff, %l2 = 0000000000000000, %l4 = 000000000000ffff
	sdivx	%l4,%l2,%l4		! Div by zero, %l0 = 0000000000000050
!	Mem[00000000100c1414] = 00000000, %l3 = 0000000000000000
	ldsha	[%i3+0x016]%asi,%l3	! %l3 = 0000000000000000
!	%l4 = 000000000000ffff, %l3 = 0000000000000000, %y  = 00000000
	smul	%l4,%l3,%l5		! %l5 = 0000000000000000, %y = 00000000
!	Mem[0000000030141400] = 005e00ff, %l2 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l2	! %l2 = 00000000005e00ff
!	Mem[0000000030181408] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = ff0000ff00000019, %f4  = e0f00000 00000000
	ldda	[%i1+%g0]0x81,%f4 	! %f4  = ff0000ff 00000019
!	Mem[0000000021800180] = 2affac10, %l7 = 00000000000000ff
	ldsh	[%o3+0x180],%l7		! %l7 = 0000000000002aff
!	Mem[0000000010001400] = ffffffff, %l7 = 0000000000002aff
	ldswa	[%i0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1400] = e3ffffff, %f26 = 6783a828
	lda	[%i3+%g0]0x81,%f26	! %f26 = e3ffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081418] = 00000000, %l5 = 0000000000000000
	swap	[%i2+0x018],%l5		! %l5 = 0000000000000000

p0_label_250:
!	%l7 = ffffffffffffffff, Mem[0000000020800000] = 00ff8ed8, %asi = 80
	stha	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = ffff8ed8
!	%f31 = ef7c3039, Mem[0000000010001410] = 83000000
	sta	%f31,[%i0+%o5]0x80	! Mem[0000000010001410] = ef7c3039
!	%l3 = 00000000000000ff, Mem[0000000010001400] = ffffffff
	stba	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffff
!	%l1 = 00000000000000f9, Mem[0000000010101408] = 00000000
	stwa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000f9
!	%l2 = 00000000005e00ff, Mem[0000000021800181] = 2affac10, %asi = 80
	stba	%l2,[%o3+0x181]%asi	! Mem[0000000021800180] = 2affac10
!	%l0 = 0000000000000028, Mem[0000000021800080] = ffff944f
	stb	%l0,[%o3+0x080]		! Mem[0000000021800080] = 28ff944f
!	%l0 = 0000000000000028, Mem[0000000030141410] = e0f0000042f8ffff
	stxa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000028
!	Mem[0000000030141400] = ff005e00, %l5 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	%l0 = 0000000000000028, Mem[0000000030141408] = ee000000000000ff
	stxa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000028
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %f24 = 3fed645a
	lda	[%i1+%g0]0x80,%f24	! %f24 = 00000000

p0_label_251:
!	%l3 = 00000000000000ff, immd = fffffffffffffa41, %l3 = 00000000000000ff
	sdivx	%l3,-0x5bf,%l3		! %l3 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l2 = 00000000005e00ff
	ldswa	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = f9250070c580bbff, %l0 = 0000000000000028
	ldxa	[%i2+%o5]0x89,%l0	! %l0 = f9250070c580bbff
!	%f9  = 000000ff, %f13 = 4cc17a8d
	fsqrts	%f9 ,%f13		! %l0 = f9250070c580bc21, Unfinished, %fsr = 2200000800
!	%l2 = 0000000000000000, immd = fffffffffffff32f, %l5 = 00000000000000ff
	udivx	%l2,-0xcd1,%l5		! %l5 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l6 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = fffeb51a, %l1 = 00000000000000f9
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = ffffffffffffb51a
!	Mem[0000000010081408] = ff000000f0000000, %l3 = 0000000000000000
	ldxa	[%i2+%o4]0x88,%l3	! %l3 = ff000000f0000000
!	Mem[0000000010181410] = 000000ff, %l5 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffff, Mem[000000001004143a] = 0000ff0d
	sth	%l7,[%i1+0x03a]		! Mem[0000000010041438] = 0000ffff

p0_label_252:
!	Mem[00000000100c1400] = 700025f9, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 000000f9000000ff
!	Mem[0000000030101408] = 000000ff, %l4 = 000000000000ffff
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l2 = 00000000000000f9, Mem[0000000030181400] = ffbb80c5
	stha	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00f980c5
!	%l1 = ffffffffffffb51a, Mem[00000000100c1400] = ff250070c580ffff
	stx	%l1,[%i3+%g0]		! Mem[00000000100c1400] = ffffffffffffb51a
!	%f16 = 5e3c5d31 c580bbff, Mem[0000000010081408] = f0000000 ff000000
	stda	%f16,[%i2+%o4]0x88	! Mem[0000000010081408] = 5e3c5d31 c580bbff
!	%f20 = 00000000 00000000, Mem[0000000010081400] = e0ffffff 00000000
	stda	%f20,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 00000000
!	%l5 = 00000000000000ff, Mem[0000000030041410] = 19000000ff00004c
	stxa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000000000ff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000030001408] = ff005e00 ffff75ee
	stda	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff 000000ff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010141408] = 00000000 fffff1ce
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ffcc04a4 ff000000, %l2 = 000000f9, %l3 = f0000000
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 00000000ffcc04a4 00000000ff000000

p0_label_253:
!	Mem[0000000010001400] = ffffffff, %l7 = ffffffffffffffff
	ldswa	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1410] = 00000000, %l1 = ffffffffffffb51a
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 005e00ff, %l3 = 00000000ff000000
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181400] = 00000000, %l5 = 00000000000000ff
	lduha	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%f7  = 700025f9, %f6  = ffbb80c5, %f14 = 00000000 ff0000ff
	fsmuld	%f7 ,%f6 ,%f14		! %f14 = ffff7018 a0000000
!	Mem[000000001004142c] = 380ea27e, %l5 = 0000000000000000
	ldswa	[%i1+0x02c]%asi,%l5	! %l5 = 00000000380ea27e
!	Mem[0000000030041400] = ff0000ff, %l1 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1400] = 1ab5ffff ffffffff, %l4 = 000000ff, %l5 = 380ea27e
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 00000000ffffffff 000000001ab5ffff
!	Mem[00000000100c1434] = 459ae99a, %l3 = ffffffff, %l5 = 1ab5ffff
	add	%i3,0x34,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 00000000459ae99a
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = ffffffff, %l2 = 00000000ffcc04a4
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 00000000ffffffff

p0_label_254:
!	%f0  = 00000000 005e0000 ff000000 00000000
!	%f4  = ff0000ff 00000019 ffbb80c5 700025f9
!	%f8  = 000000f0 000000ff 00000000 0c377fa2
!	%f12 = b64f17cc 4cc17a8d ffff7018 a0000000
	stda	%f0,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	%l2 = ffffffff, %l3 = ffffffff, Mem[0000000010101410] = 00000000 e0f00000
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff ffffffff
!	%l4 = 00000000ffffffff, Mem[0000000010181400] = 0000000000000000
	stxa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000ffffffff
!	%f22 = 2dbc2560 d8f327f9, Mem[0000000030041410] = 19000000 ff0000ff
	stda	%f22,[%i1+%o5]0x81	! Mem[0000000030041410] = 2dbc2560 d8f327f9
!	%l3 = ffffffffffffffff, Mem[0000000010101400] = 00000000
	stba	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000
!	%l2 = 00000000ffffffff, Mem[0000000030141408] = 00000000
	stha	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000ffff
!	%f0  = 00000000 005e0000 ff000000 00000000
!	%f4  = ff0000ff 00000019 ffbb80c5 700025f9
!	%f8  = 000000f0 000000ff 00000000 0c377fa2
!	%f12 = b64f17cc 4cc17a8d ffff7018 a0000000
	stda	%f0,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	%f20 = 00000000 00000000, %l2 = 00000000ffffffff
!	Mem[0000000010181430] = 6783a828d78df1ce
	add	%i6,0x030,%g1
	stda	%f20,[%g1+%l2]ASI_PST8_P ! Mem[0000000010181430] = 0000000000000000
!	%l3 = ffffffffffffffff, Mem[00000000100c1410] = 0000000000000000
	stxa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = a404ccff, %l3 = ffffffffffffffff
	lduha	[%i3+%o4]0x89,%l3	! %l3 = 000000000000ccff

p0_label_255:
!	Mem[0000000030141400] = ff005e00 00000000, %l2 = ffffffff, %l3 = 0000ccff
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000ff005e00 0000000000000000
!	Mem[0000000010141408] = 000000ff, %l1 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141428] = 6783a828, %l6 = 0000000000000000
	ldsh	[%i5+0x02a],%l6		! %l6 = ffffffffffffa828
	membar	#Sync			! Added by membar checker (51)
!	Mem[0000000010001410] = ef7c3039cef1ffff, %l5 = 00000000459ae99a
	ldxa	[%i0+%o5]0x80,%l5	! %l5 = ef7c3039cef1ffff
!	Mem[0000000010181410] = 000000ff, %l2 = 00000000ff005e00
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010181400] = 00000000, %l6 = ffffffffffffa828
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = 0000ffff, %l4 = 00000000ffffffff
	ldsha	[%i5+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 0000000000000000, %l2 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181430] = 00000000, %l7 = ffffffffffffffff
	lduh	[%i6+0x030],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 00000000, %l5 = ef7c3039cef1ffff
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_256:
!	Mem[0000000010141410] = 00000000, %l6 = 0000000000000000
	swap	[%i5+%o5],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l0 = f9250070c580bc21
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%f25 = 95a7e5b4, Mem[0000000030181410] = 00000000
	sta	%f25,[%i6+%o5]0x81	! Mem[0000000030181410] = 95a7e5b4
!	%l7 = 0000000000000000, Mem[0000000010001408] = 00000083
	stwa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%f0  = 00000000 005e0000 ff000000 00000000
!	%f4  = ff0000ff 00000019 ffbb80c5 700025f9
!	%f8  = 000000f0 000000ff 00000000 0c377fa2
!	%f12 = b64f17cc 4cc17a8d ffff7018 a0000000
	stda	%f0,[%i4]ASI_BLK_AIUPL	! Block Store to 0000000010101400
!	%l7 = 0000000000000000, immd = fffffffffffff0e9, %l0 = 0000000000000000
	sdivx	%l7,-0xf17,%l0		! %l0 = 0000000000000000
!	Mem[0000000030001410] = ff0000ff, %l5 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l5	! %l5 = 00000000ff0000ff
!	%l7 = 0000000000000000, imm = 000000000000042f, %l0 = 0000000000000000
	addc	%l7,0x42f,%l0		! %l0 = 000000000000042f
!	Mem[0000000030001408] = ff000000, %l4 = ffffffffffffffff
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffffffff, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l3	! %l3 = 00000000ffffffff

p0_label_257:
!	Mem[0000000010041408] = fffeb51a, %f19 = 000000ff
	lda	[%i1+%o4]0x88,%f19	! %f19 = fffeb51a
!	Mem[0000000010041438] = 0000ffffffffffff, %l3 = 00000000ffffffff
	ldx	[%i1+0x038],%l3		! %l3 = 0000ffffffffffff
!	%l5 = 00000000ff0000ff, %l1 = 00000000000000ff, %l1 = 00000000000000ff
	xnor	%l5,%l1,%l1		! %l1 = ffffffff00ffffff
!	%l0 = 000000000000042f, %l0 = 000000000000042f, %y  = 00000000
	umul	%l0,%l0,%l0		! %l0 = 00000000001180a1, %y = 00000000
!	Mem[0000000030081400] = 00000000, %l0 = 00000000001180a1
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 0000ffff, %l1 = ffffffff00ffffff
	lduwa	[%i4+%o4]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010081408] = ffbb80c5, %l0 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141408] = 0000ffff, %f16 = 5e3c5d31
	lda	[%i5+%o4]0x89,%f16	! %f16 = 0000ffff
!	Mem[0000000010141420] = 3fed645a95a7e5b4, %l5 = 00000000ff0000ff
	ldx	[%i5+0x020],%l5		! %l5 = 3fed645a95a7e5b4
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_18:
!	%l0 = 00000000000000ff
	setx	0x4915c877a109cde4,%g7,%l0 ! %l0 = 4915c877a109cde4
!	%l1 = 000000000000ffff
	setx	0x4cb15aa81e8d736e,%g7,%l1 ! %l1 = 4cb15aa81e8d736e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4915c877a109cde4
	setx	0xd078400077c27844,%g7,%l0 ! %l0 = d078400077c27844
!	%l1 = 4cb15aa81e8d736e
	setx	0xbe75d108297dfa00,%g7,%l1 ! %l1 = be75d108297dfa00

p0_label_258:
!	%l5 = 3fed645a95a7e5b4, Mem[00000000201c0000] = ffff826e
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = e5b4826e
!	%l2 = 00000000, %l3 = ffffffff, Mem[00000000300c1400] = e3ffffff 8dff3a00
	stda	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 ffffffff
!	%l3 = 0000ffffffffffff, Mem[00000000211c0000] = 00007001
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = ffff7001
!	Mem[0000000010001410] = ef7c3039cef1ffff, %l1 = be75d108297dfa00, %l0 = d078400077c27844
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = ef7c3039cef1ffff
	membar	#Sync			! Added by membar checker (52)
!	Mem[0000000010101430] = 8d7ac14c, %l6 = 0000000000000000
	ldstuba	[%i4+0x030]%asi,%l6	! %l6 = 0000008d000000ff
!	Mem[0000000010101400] = 00005e00, %l6 = 000000000000008d
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l4 = 00000000ff000000
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%f12 = b64f17cc 4cc17a8d, Mem[0000000010081400] = 00000000 00000000
	stda	%f12,[%i2+%g0]0x88	! Mem[0000000010081400] = b64f17cc 4cc17a8d
!	%f6  = ffbb80c5, Mem[0000000010181408] = 3fed645a
	sta	%f6 ,[%i6+%o4]0x80	! Mem[0000000010181408] = ffbb80c5
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffff8ed8, %l3 = 0000ffffffffffff
	ldub	[%o1+%g0],%l3		! %l3 = 00000000000000ff

p0_label_259:
!	%l4 = 0000000000000000, immed = fffffd8e, %y  = 00000000
	umul	%l4,-0x272,%l5		! %l5 = 0000000000000000, %y = 00000000
!	Mem[0000000030181408] = 000000ff, %l7 = 0000000000000000
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141410] = 28000000, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = 0000000000002800
!	Mem[0000000010081438] = fffff842, %l7 = ffffffffffffffff
	ldsb	[%i2+0x038],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010101408] = 00000000, %f20 = 00000000
	lda	[%i4+%o4]0x88,%f20	! %f20 = 00000000
!	Mem[00000000211c0000] = ffff7001, %l6 = 0000000000002800
	ldub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = ffffffff, %l0 = ef7c3039cef1ffff
	ldsha	[%i3+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141400] = 00000000 fffff1ce, %l0 = ffffffff, %l1 = 297dfa00
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 00000000fffff1ce 0000000000000000
!	Mem[00000000100c1420] = 3fed645a95a7e5b4, %f16 = 0000ffff c580bbff
	ldd	[%i3+0x020],%f16	! %f16 = 3fed645a 95a7e5b4
!	Starting 10 instruction Store Burst
!	Mem[000000001018143b] = 00ff03ff, %l3 = 00000000000000ff
	ldstub	[%i6+0x03b],%l3		! %l3 = 000000ff000000ff

p0_label_260:
!	%f22 = 2dbc2560 d8f327f9, %l7 = ffffffffffffffff
!	Mem[0000000030141400] = ff005e0000000000
	stda	%f22,[%i5+%l7]ASI_PST32_S ! Mem[0000000030141400] = 2dbc2560d8f327f9
!	%l4 = 0000000000000000, Mem[0000000030141410] = 0000000000000028
	stxa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	%f0  = 00000000 005e0000, %l5 = 0000000000000000
!	Mem[00000000100c1420] = 3fed645a95a7e5b4
	add	%i3,0x020,%g1
	stda	%f0,[%g1+%l5]ASI_PST8_PL ! Mem[00000000100c1420] = 3fed645a95a7e5b4
!	Mem[00000000300c1410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l4 = 0000000000000000, %l4 = 0000000000000000, %l4 = 0000000000000000
	orn	%l4,%l4,%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030041410] = 2dbc2560, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 000000002dbc2560
!	%l5 = 000000002dbc2560, Mem[0000000010101408] = 00000000
	stha	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 25600000
!	%f16 = 3fed645a 95a7e5b4 fffeb51a fffeb51a
!	%f20 = 00000000 00000000 2dbc2560 d8f327f9
!	%f24 = 00000000 95a7e5b4 e3ffffff d78df1ce
!	%f28 = 3e37f70f 459ae99a b64f17cc ef7c3039
	stda	%f16,[%i3]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	%l7 = ffffffffffffffff, Mem[00000000201c0000] = e5b4826e, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff826e
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (53)
!	Mem[00000000100c1438] = 39307cefcc174fb6, %l2 = 0000000000000000
	ldx	[%i3+0x038],%l2		! %l2 = 39307cefcc174fb6

p0_label_261:
!	Mem[0000000010101408] = 25600000, %l5 = 000000002dbc2560
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = 0000000000002560
!	Mem[0000000010041410] = ffffffff, %l7 = ffffffffffffffff
	lduwa	[%i1+%o5]0x88,%l7	! %l7 = 00000000ffffffff
!	%l0 = 00000000fffff1ce, imm = fffffffffffff7bc, %l5 = 0000000000002560
	and	%l0,-0x844,%l5		! %l5 = 00000000fffff18c
!	Mem[0000000030181408] = 000000ff, %l3 = 00000000000000ff
	lduha	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181400] = 00f980c5 700025f9 ff000000 1ab5feff
!	Mem[0000000030181410] = 95a7e5b4 00000000 f927f3d8 6025bc2d
!	Mem[0000000030181420] = b4e5a795 5a64ed3f cef18dd7 28a88367
!	Mem[0000000030181430] = 9ae99a45 0ff7373e 39307cef cc174fb6
	ldda	[%i6]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030181400
!	Mem[0000000030001410] = 000000ff, %f29 = 459ae99a
	lda	[%i0+%o5]0x81,%f29	! %f29 = 000000ff
!	Mem[00000000201c0000] = ffff826e, %l4 = ffffffffffffffff
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030101410] = ff174fb6, %f27 = d78df1ce
	lda	[%i4+%o5]0x81,%f27	! %f27 = ff174fb6
!	Mem[0000000010181408] = c580bbff, %l5 = 00000000fffff18c
	ldswa	[%i6+%o4]0x88,%l5	! %l5 = ffffffffc580bbff
!	Starting 10 instruction Store Burst
!	%f30 = b64f17cc ef7c3039, %l6 = 00000000000000ff
!	Mem[0000000030101408] = 0000ffffcef1ffff
	add	%i4,0x008,%g1
	stda	%f30,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030101408] = 39307cefcc174fb6

p0_label_262:
!	Mem[0000000010181408] = ffbb80c5, %l6 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%l5 = ffffffffc580bbff, immed = 00000be5, %y  = 00000000
	umul	%l5,0xbe5,%l4		! %l4 = 0000092d343c201b, %y = 0000092d
!	%f0  = f9250070 c580f900 fffeb51a 000000ff
!	%f4  = 00000000 b4e5a795 2dbc2560 d8f327f9
!	%f8  = 3fed645a 95a7e5b4 6783a828 d78df1ce
!	%f12 = 3e37f70f 459ae99a b64f17cc ef7c3039
	stda	%f0,[%i5]ASI_BLK_PL	! Block Store to 0000000010141400
!	Mem[00000000100c1424] = 00000000, %l7 = ffffffff, %l0 = fffff1ce
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 0000000000000000
!	Mem[000000001008141c] = 6e17dfe9, %l4 = 343c201b, %l1 = 00000000
	add	%i2,0x1c,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 000000006e17dfe9
!	Mem[0000000030101400] = 83670000, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 00000083000000ff
!	Mem[0000000010041407] = 4c00ff00, %l0 = 0000000000000083
	ldstub	[%i1+0x007],%l0		! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[00000000300c1410] = 000000ff
	stba	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l5 = ffffffffc580bbff, Mem[0000000010001408] = 00000000
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l0 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_263:
!	%f20 = 00000000, %f22 = 2dbc2560, %f27 = ff174fb6
	fdivs	%f20,%f22,%f27		! %f27 = 00000000
!	Mem[0000000010101430] = ff7ac14c cc174fb6, %l4 = 343c201b, %l5 = c580bbff
	ldda	[%i4+0x030]%asi,%l4	! %l4 = 00000000ff7ac14c 00000000cc174fb6
!	Mem[00000000201c0000] = ffff826e, %l7 = 00000000ffffffff
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181410] = 00000000b4e5a795, %l1 = 000000006e17dfe9
	ldxa	[%i6+%o5]0x89,%l1	! %l1 = 00000000b4e5a795
!	Mem[0000000010041410] = ff000000ffffffff, %f16 = 3fed645a 95a7e5b4
	ldda	[%i1+%o5]0x88,%f16	! %f16 = ff000000 ffffffff
!	Mem[000000001008140c] = 315d3c5e, %f20 = 00000000
	ld	[%i2+0x00c],%f20	! %f20 = 315d3c5e
!	Mem[0000000010181408] = ffbb80c5, %l1 = 00000000b4e5a795
	ldswa	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffbb80c5
!	%f18 = fffeb51a, %f17 = ffffffff
	fcmpes	%fcc2,%f18,%f17		! %fcc2 = 3
!	Mem[00000000100c1414] = 00000000, %l0 = 0000000000000000
	ldsw	[%i3+0x014],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ff7ac14c, Mem[0000000010081410] = 00000000
	stwa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = ff7ac14c

p0_label_264:
!	Mem[00000000100c1409] = 1ab5feff, %l1 = ffffffffffbb80c5
	ldstuba	[%i3+0x009]%asi,%l1	! %l1 = 000000b5000000ff
!	Mem[0000000020800001] = ffff8ed8, %l2 = 39307cefcc174fb6
	ldstuba	[%o1+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	%f22 = 2dbc2560, Mem[0000000010081410] = ff7ac14c
	sta	%f22,[%i2+%o5]0x88	! Mem[0000000010081410] = 2dbc2560
!	Mem[0000000010081418] = 00000000, %l1 = 000000b5, %l3 = 000000ff
	add	%i2,0x18,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000010141414] = 00000000, %l7 = ffffffff, %l3 = 00000000
	add	%i5,0x14,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 0000000000000000
!	%f9  = 95a7e5b4, Mem[0000000010101400] = ff005e00
	sta	%f9 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 95a7e5b4
!	%f30 = b64f17cc ef7c3039, Mem[00000000100c1418] = f927f3d8 6025bc2d
	std	%f30,[%i3+0x018]	! Mem[00000000100c1418] = b64f17cc ef7c3039
!	%l0 = 0000000000000000, Mem[0000000010101408] = 00006025
	stha	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[0000000010141400] = 00f980c5, %l3 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000, %l0 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000

p0_label_265:
!	Mem[0000000030101408] = ef7c3039, %l4 = 00000000ff7ac14c
	ldsha	[%i4+%o4]0x89,%l4	! %l4 = 0000000000003039
!	Mem[0000000010081408] = ffbb80c5, %l4 = 0000000000003039
	lduwa	[%i2+%o4]0x80,%l4	! %l4 = 00000000ffbb80c5
!	Mem[0000000010141410] = b4e5a795, %l6 = 00000000000000ff
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 00000000b4e5a795
!	Mem[0000000010041420] = ffffffff fffff842, %l0 = 00000000, %l1 = 000000b5
	ldd	[%i1+0x020],%l0		! %l0 = 00000000ffffffff 00000000fffff842
!	Mem[0000000010141404] = 700025f9, %l5 = 00000000cc174fb6
	lduwa	[%i5+0x004]%asi,%l5	! %l5 = 00000000700025f9
!	Mem[00000000300c1410] = 00000000, %l2 = 00000000000000ff
	ldswa	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041430] = a775ccae, %f16 = ff000000
	lda	[%i1+0x030]%asi,%f16	! %f16 = a775ccae
!	%l4 = 00000000ffbb80c5, immed = 00000be1, %y  = 0000092d
	smul	%l4,0xbe1,%l3		! %l3 = fffffffcd254a425, %y = fffffffc
!	Mem[0000000010041400] = 00000000 4c00ffff, %l4 = ffbb80c5, %l5 = 700025f9
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000 000000004c00ffff
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffff, Mem[0000000010041410] = ffffffff
	stwa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff

p0_label_266:
!	Mem[00000000201c0000] = ffff826e, %l1 = 00000000fffff842
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000300c1408] = ffcc04a4, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000010041408] = 0c377fa2fffeb51a
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	%f18 = fffeb51a fffeb51a, Mem[00000000100c1430] = 9ae99a45 0ff7373e
	std	%f18,[%i3+0x030]	! Mem[00000000100c1430] = fffeb51a fffeb51a
!	Mem[00000000201c0001] = ffff826e, %l5 = 000000004c00ffff
	ldstub	[%o0+0x001],%l5		! %l5 = 000000ff000000ff
!	%l7 = ffffffffffffffff, Mem[0000000010001410] = fffff1ce39307cef
	stxa	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffffffffffff
!	Mem[0000000010081400] = 8d7ac14c, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x000]%asi,%l4	! %l4 = 000000008d7ac14c
!	Mem[0000000030101410] = b64f17ff, %l7 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	%f20 = 315d3c5e 00000000, Mem[00000000300c1400] = 00000000 ffffffff
	stda	%f20,[%i3+%g0]0x89	! Mem[00000000300c1400] = 315d3c5e 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = ffffffff, %l3 = fffffffcd254a425
	ldsb	[%i1+0x020],%l3		! %l3 = ffffffffffffffff

p0_label_267:
!	Mem[0000000030101408] = 39307cef, %l0 = 00000000ffffffff
	ldswa	[%i4+%o4]0x81,%l0	! %l0 = 0000000039307cef
!	Mem[0000000010101408] = ff00000000000000, %f18 = fffeb51a fffeb51a
	ldda	[%i4+%o4]0x88,%f18	! %f18 = ff000000 00000000
!	Mem[0000000010001408] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %f29 = 000000ff
	lda	[%i1+%o5]0x89,%f29	! %f29 = 00000000
!	Mem[0000000010181410] = 00000000 000000ff, %l6 = b4e5a795, %l7 = 000000ff
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000010001428] = f9250070, %l1 = 00000000000000ff
	lduha	[%i0+0x028]%asi,%l1	! %l1 = 000000000000f925
!	Mem[000000001018142c] = 00000000, %f2  = fffeb51a
	ld	[%i6+0x02c],%f2 	! %f2 = 00000000
!	Mem[0000000020800040] = 00ffcbdb, %l6 = 00000000000000ff
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1408] = fffeff1a, %f5  = b4e5a795
	lda	[%i3+%o4]0x88,%f5 	! %f5 = fffeff1a
!	Starting 10 instruction Store Burst
!	%f20 = 315d3c5e 00000000, Mem[0000000030181410] = 95a7e5b4 00000000
	stda	%f20,[%i6+%o5]0x81	! Mem[0000000030181410] = 315d3c5e 00000000

p0_label_268:
!	Mem[0000000030041400] = 00005e00, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 0000000000005e00
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000010141400] = c580f900 f9250070
	stda	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff ffffffff
!	Mem[0000000010081400] = ff000000, %l0 = 0000000039307cef
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 00000000ff000000
!	%l0 = 00000000ff000000, Mem[0000000010041408] = 00000000
	stha	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%f27 = 00000000, Mem[0000000010001400] = a404ccff
	sta	%f27,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Mem[0000000010001416] = ffffffff, %l0 = 00000000ff000000
	ldstub	[%i0+0x016],%l0		! %l0 = 000000ff000000ff
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000030181400] = 00f980c5 700025f9
	stda	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff ffffffff
!	Mem[00000000100c1413] = 00000000, %l1 = 000000000000f925
	ldstub	[%i3+0x013],%l1		! %l1 = 00000000000000ff
!	%f30 = b64f17cc ef7c3039, Mem[0000000010141408] = 000000ff fffeb51a
	stda	%f30,[%i5+%o4]0x88	! Mem[0000000010141408] = b64f17cc ef7c3039
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000 5e3c5d31, %l2 = 000000ff, %l3 = ffffffff
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 000000005e3c5d31 0000000000000000

p0_label_269:
!	Mem[00000000300c1410] = 0000000000003fed, %f0  = f9250070 c580f900
	ldda	[%i3+%o5]0x81,%f0 	! %f0  = 00000000 00003fed
!	Mem[0000000010041400] = 000000004c00ffff, %f12 = 3e37f70f 459ae99a
	ldda	[%i1+0x000]%asi,%f12	! %f12 = 00000000 4c00ffff
!	Mem[0000000010081410] = 2dbc2560, %l2 = 000000005e3c5d31
	lduha	[%i2+%o5]0x88,%l2	! %l2 = 0000000000002560
!	Mem[0000000010181410] = ff00000000000000, %f2  = 00000000 000000ff
	ldda	[%i6+%o5]0x80,%f2 	! %f2  = ff000000 00000000
!	Mem[0000000030101408] = ef7c3039, %f0  = 00000000
	lda	[%i4+%o4]0x89,%f0 	! %f0 = ef7c3039
!	Mem[00000000100c1400] = 95a7e5b4, %l4 = 000000008d7ac14c
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = ffffffffffffffb4
!	Mem[0000000010041410] = ffffffff, %l1 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1400] = b4e5a795, %l4 = ffffffffffffffb4
	ldsha	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffb4e5
!	Mem[00000000100c1414] = 00000000, %l2 = 0000000000002560
	ldswa	[%i3+0x014]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f10 = 6783a828, Mem[00000000100c1410] = 000000ff
	sta	%f10,[%i3+%o5]0x80	! Mem[00000000100c1410] = 6783a828

p0_label_270:
!	%l4 = ffffffffffffb4e5, Mem[0000000010001410] = ffffffff
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffb4e5
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000005e00
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010181408] = ffbb80c595a7e5b4
	stxa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	Mem[00000000300c1408] = a404ccff, %l6 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 00000000a404ccff
!	%l5 = 00000000000000ff, Mem[00000000211c0000] = ffff7001, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff7001
!	%l3 = 0000000000000000, Mem[00000000201c0000] = ffff826e, %asi = 80
	stba	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff826e
!	Mem[0000000030101408] = ef7c3039, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 00000039000000ff
!	%f28 = 3e37f70f 00000000, %l0 = 00000000000000ff
!	Mem[0000000030081408] = 0000000000000000
	add	%i2,0x008,%g1
	stda	%f28,[%g1+%l0]ASI_PST8_S ! Mem[0000000030081408] = 3e37f70f00000000
!	%l3 = 0000000000000039, Mem[0000000010141408] = ef7c3039
	stba	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = ef7c3039
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = 00ff03ff00000000, %f8  = 3fed645a 95a7e5b4
	ldda	[%i6+0x038]%asi,%f8 	! %f8  = 00ff03ff 00000000

p0_label_271:
!	Mem[0000000010041410] = ff000000ffffffff, %l4 = ffffffffffffb4e5
	ldxa	[%i1+%o5]0x88,%l4	! %l4 = ff000000ffffffff
!	Mem[00000000300c1410] = 00000000, %l3 = 0000000000000039
	ldsha	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l4 = ff000000ffffffff
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141418] = f927f3d8, %l1 = ffffffffffffffff
	ldsw	[%i5+0x018],%l1		! %l1 = fffffffff927f3d8
!	Mem[0000000030041410] = 00000000, %l4 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = ffffffff, %l5 = 00000000000000ff
	ldsha	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141410] = 95a7e5b4, %l0 = 00000000000000ff
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = ffffffffffffff95
!	Mem[0000000010181408] = 00000000, %f11 = d78df1ce
	lda	[%i6+%o4]0x80,%f11	! %f11 = 00000000
!	Code Fragment 4
p0_fragment_19:
!	%l0 = ffffffffffffff95
	setx	0x379c8f17bfa29ad3,%g7,%l0 ! %l0 = 379c8f17bfa29ad3
!	%l1 = fffffffff927f3d8
	setx	0x05e683a0241d64ee,%g7,%l1 ! %l1 = 05e683a0241d64ee
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 379c8f17bfa29ad3
	setx	0x4d7b55ffe1609741,%g7,%l0 ! %l0 = 4d7b55ffe1609741
!	%l1 = 05e683a0241d64ee
	setx	0x1b3ffcd04b2bd9a7,%g7,%l1 ! %l1 = 1b3ffcd04b2bd9a7
!	Starting 10 instruction Store Burst
!	%l1 = 1b3ffcd04b2bd9a7, Mem[000000001018141c] = ff005e00
	sth	%l1,[%i6+0x01c]		! Mem[000000001018141c] = d9a75e00

p0_label_272:
!	%l1 = 1b3ffcd04b2bd9a7, Mem[0000000010181408] = 0000000000000000
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 1b3ffcd04b2bd9a7
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010081410] = 6025bc2d 00000000
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 00000000
!	%l1 = 1b3ffcd04b2bd9a7, Mem[0000000010081410] = 00000000
	stha	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000d9a7
!	%l0 = 4d7b55ffe1609741, Mem[0000000030041408] = 21bc80c5
	stha	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 974180c5
!	%l6 = a404ccff, %l7 = 00000000, Mem[0000000030001410] = 000000ff 00000019
	stda	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = a404ccff 00000000
!	%f29 = 00000000, Mem[0000000030001408] = ffffffff
	sta	%f29,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Mem[00000000300c1408] = 000000ff, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181408] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = ffffffff, Mem[00000000100c1410] = 6783a828 00000000
	stda	%l4,[%i3+0x010]%asi	! Mem[00000000100c1410] = 000000ff ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 19000000ff0000ff, %f6  = 2dbc2560 d8f327f9
	ldda	[%i4+%o5]0x80,%f6 	! %f6  = 19000000 ff0000ff

p0_label_273:
!	Mem[0000000030041408] = 974180c5 000000ff, %l6 = a404ccff, %l7 = 00000000
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 00000000974180c5 00000000000000ff
!	%f0  = ef7c3039 00003fed ff000000 00000000
!	%f4  = 00000000 fffeff1a 19000000 ff0000ff
!	%f8  = 00ff03ff 00000000 6783a828 00000000
!	%f12 = 00000000 4c00ffff b64f17cc ef7c3039
	stda	%f0,[%i5]ASI_BLK_AIUS	! Block Store to 0000000030141400
!	Mem[0000000010041420] = ffffffff, %l2 = 0000000000000000
	lduh	[%i1+0x022],%l2		! %l2 = 000000000000ffff
!	Mem[0000000010181400] = 00000000ffffffff, %l2 = 000000000000ffff
	ldxa	[%i6+0x000]%asi,%l2	! %l2 = 00000000ffffffff
!	Mem[00000000300c1410] = 00000000, %l6 = 00000000974180c5
	ldsba	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 1b3ffcd0, %l3 = 0000000000000000
	lduwa	[%i6+0x008]%asi,%l3	! %l3 = 000000001b3ffcd0
!	Mem[0000000010101408] = ff000000, %l0 = 4d7b55ffe1609741
	ldsba	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000010141410] = 95a7e5b4, %l0 = ffffffffffffffff
	ldsha	[%i5+%o5]0x80,%l0	! %l0 = ffffffffffff95a7
!	Mem[0000000010041400] = 00000000, %f25 = 95a7e5b4
	lda	[%i1+%g0]0x80,%f25	! %f25 = 00000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ffffffff, Mem[0000000010041408] = 00000000
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffff

p0_label_274:
!	Mem[0000000010001418] = ff7f0000, %l6 = 0000000000000000
	ldswa	[%i0+0x018]%asi,%l6	! %l6 = ffffffffff7f0000
!	%l5 = ffffffffffffffff, %l5 = ffffffffffffffff, %l4 = 00000000000000ff
	xnor	%l5,%l5,%l4		! %l4 = ffffffffffffffff
!	%l0 = ffff95a7, %l1 = 4b2bd9a7, Mem[0000000030101408] = ff307cef cc174fb6
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = ffff95a7 4b2bd9a7
!	%f10 = 6783a828 00000000, Mem[0000000030001410] = a404ccff 00000000
	stda	%f10,[%i0+%o5]0x81	! Mem[0000000030001410] = 6783a828 00000000
!	%f10 = 6783a828, Mem[0000000010041418] = 4cc17a8d
	sta	%f10,[%i1+0x018]%asi	! Mem[0000000010041418] = 6783a828
!	%l3 = 000000001b3ffcd0, Mem[0000000030101408] = a7d92b4ba795ffff
	stxa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000001b3ffcd0
!	Mem[00000000100c1400] = 95a7e5b4, %l1 = 1b3ffcd04b2bd9a7
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 000000b4000000ff
!	%f21 = 00000000, Mem[000000001014140c] = cc174fb6
	sta	%f21,[%i5+0x00c]%asi	! Mem[000000001014140c] = 00000000
!	%l3 = 000000001b3ffcd0, Mem[0000000030001408] = 00000000
	stba	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = d0000000
!	Starting 10 instruction Load Burst
!	%f1  = 00003fed, %f10 = 6783a828, %f6  = 19000000 ff0000ff
	fsmuld	%f1 ,%f10,%f6 		! %l0 = ffffffffffff95c9, Unfinished, %fsr = 2e00000800

p0_label_275:
!	Mem[00000000100c1410] = ff000000, %l5 = ffffffffffffffff
	lduba	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l0 = ffffffffffff95c9
	ldswa	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001400] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = c5804197, %l0 = 00000000000000ff
	lduha	[%i1+%o4]0x89,%l0	! %l0 = 0000000000004197
!	Mem[00000000300c1410] = 00000000, %l3 = 000000001b3ffcd0
	ldsba	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = ff670000, %l1 = 00000000000000b4
	ldsha	[%i4+%g0]0x81,%l1	! %l1 = ffffffffffffff67
!	Mem[00000000100c1400] = ffe5a795, %f23 = d8f327f9
	lda	[%i3+%g0]0x80,%f23	! %f23 = ffe5a795
!	Mem[00000000300c1400] = 00000000, %l2 = 00000000ffffffff
	ldswa	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%f12 = 00000000, %f18 = ff000000, %f9  = 00000000
	fdivs	%f12,%f18,%f9 		! %f9  = 80000000
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000030081408] = 0ff7373e
	stwa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffff

p0_label_276:
!	%l6 = ffffffffff7f0000, Mem[0000000030041410] = 00000000
	stwa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = ff7f0000
!	%l7 = 0000000000000000, Mem[0000000010141410] = b4e5a795
	stba	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = b4e5a700
!	%l7 = 0000000000000000, Mem[00000000100c1410] = 000000ff
	stba	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	Mem[000000001014140c] = 00000000, %l6 = ffffffffff7f0000
	swap	[%i5+0x00c],%l6		! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030181400] = ff000000
	stba	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = ff000000
!	%l4 = ffffffffffffffff, Mem[0000000030101410] = ff174fb6
	stwa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffff
!	%l6 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stwa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%l1 = ffffffffffffff67, Mem[0000000010001436] = d4940000, %asi = 80
	stha	%l1,[%i0+0x036]%asi	! Mem[0000000010001434] = d494ff67
!	%l6 = 0000000000000000, Mem[0000000010141424] = 5a64ed3f, %asi = 80
	stwa	%l6,[%i5+0x024]%asi	! Mem[0000000010141424] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 5e3c5d31, %l6 = 0000000000000000
	lduwa	[%i6+%o5]0x89,%l6	! %l6 = 000000005e3c5d31

p0_label_277:
!	Mem[0000000010101400] = 95a7e5b400000000, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l5	! %l5 = 95a7e5b400000000
!	Mem[00000000100c1408] = fffeff1a, %l4 = ffffffffffffffff
	ldsha	[%i3+%o4]0x88,%l4	! %l4 = ffffffffffffff1a
!	%l6 = 000000005e3c5d31, %l1 = ffffffffffffff67, %l1  = ffffffffffffff67
	mulx	%l6,%l1,%l1		! %l1 = ffffffc7adec4db7
!	Mem[0000000020800040] = 00ffcbdb, %l5 = 95a7e5b400000000
	ldub	[%o1+0x041],%l5		! %l5 = 00000000000000ff
!	Code Fragment 3
p0_fragment_20:
!	%l0 = 0000000000004197
	setx	0x9fcc4eafa4966870,%g7,%l0 ! %l0 = 9fcc4eafa4966870
!	%l1 = ffffffc7adec4db7
	setx	0x3f8075a78c2f6752,%g7,%l1 ! %l1 = 3f8075a78c2f6752
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9fcc4eafa4966870
	setx	0xc4f24fb82e8884f3,%g7,%l0 ! %l0 = c4f24fb82e8884f3
!	%l1 = 3f8075a78c2f6752
	setx	0x855990079c61c6aa,%g7,%l1 ! %l1 = 855990079c61c6aa
!	Mem[0000000010081400] = ef7c3039 cc174fb6 ffbb80c5 315d3c5e
!	Mem[0000000010081410] = a7d90000 00000000 00000000 6e17dfe9
!	Mem[0000000010081420] = 00000000 000000e0 b4e5a795 7abaad19
!	Mem[0000000010081430] = 00000000 00000000 fffff842 91ffff00
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000030141400] = ed3f000039307cef, %l1 = 855990079c61c6aa
	ldxa	[%i5+%g0]0x89,%l1	! %l1 = ed3f000039307cef
!	Mem[0000000030101408] = 000000001b3ffcd0, %f6  = 19000000 ff0000ff
	ldda	[%i4+%o4]0x89,%f6 	! %f6  = 00000000 1b3ffcd0
	membar	#Sync			! Added by membar checker (56)
!	Mem[0000000010001400] = 00000000 ffffffff ff000000 000000ff
!	Mem[0000000010001410] = e5b4ffff ffffffff ff7f0000 ffff0000
!	Mem[0000000010001420] = ff000000 700025f9 f9250070 c580bbff
!	Mem[0000000010001430] = e0000000 d494ff67 00000000 00000000
	ldda	[%i0]ASI_BLK_AIUP,%f0	! Block Load from 0000000010001400
!	Starting 10 instruction Store Burst
!	%f31 = 91ffff00, Mem[0000000010041410] = ffffffff
	sta	%f31,[%i1+%o5]0x88	! Mem[0000000010041410] = 91ffff00

p0_label_278:
!	%l3 = 0000000000000000, %l0 = c4f24fb82e8884f3, %l7 = 0000000000000000
	sub	%l3,%l0,%l7		! %l7 = 3b0db047d1777b0d
!	%l2 = 0000000000000000, Mem[0000000010041400] = 00000000
	stwa	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Mem[000000001008141b] = 00000000, %l1 = ed3f000039307cef
	ldstub	[%i2+0x01b],%l1		! %l1 = 00000000000000ff
!	%f24 = 00000000 000000e0, Mem[0000000010101400] = 95a7e5b4 00000000
	std	%f24,[%i4+%g0]	! Mem[0000000010101400] = 00000000 000000e0
!	%l7 = 3b0db047d1777b0d, immd = fffffffffffffe0d, %l7 = 3b0db047d1777b0d
	sdivx	%l7,-0x1f3,%l7		! %l7 = ffe1b43b5dfa1e06
!	%l0 = c4f24fb82e8884f3, imm = 00000000000004f3, %l5 = 00000000000000ff
	subc	%l0,0x4f3,%l5		! %l5 = c4f24fb82e888000
!	%l4 = ffffff1a, %l5 = 2e888000, Mem[0000000030181408] = 000000ff fffeb51a
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffff1a 2e888000
!	%l5 = c4f24fb82e888000, Mem[0000000010101410] = 19000000ff0000ff
	stxa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = c4f24fb82e888000
!	Mem[0000000010101410] = c4f24fb8, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 00000000c4f24fb8
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000, %l3 = 00000000c4f24fb8
	lduwa	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_279:
!	Mem[0000000030081408] = ffffffff, %l1 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081408] = ffffffff, %f29 = 00000000
	lda	[%i2+%o4]0x89,%f29	! %f29 = ffffffff
!	Mem[00000000201c0000] = 00ff826e, %l5 = c4f24fb82e888000
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = fffeff1a, %l0 = c4f24fb82e8884f3
	lduba	[%i3+%o4]0x88,%l0	! %l0 = 000000000000001a
!	Mem[0000000010041408] = ffffffff, %l3 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000211c0000] = 00ff7001, %l4 = ffffffffffffff1a
	ldsb	[%o2+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010101404] = 000000e0, %f23 = 6e17dfe9
	ld	[%i4+0x004],%f23	! %f23 = 000000e0
!	Mem[0000000030081410] = f9250070c580bbff, %l5 = 00000000000000ff
	ldxa	[%i2+%o5]0x89,%l5	! %l5 = f9250070c580bbff
!	Mem[00000000100c1400] = 95a7e5ff, %l0 = 000000000000001a
	ldsha	[%i3+%g0]0x88,%l0	! %l0 = ffffffffffffe5ff
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000010081410] = a7d9000000000000
	stxa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffffffffffff

p0_label_280:
!	%l5 = f9250070c580bbff, Mem[0000000010141400] = 000000ff
	stwa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = c580bbff
!	Mem[0000000010181408] = 1b3ffcd0, %l1 = ffffffffffffffff, %asi = 80
	swapa	[%i6+0x008]%asi,%l1	! %l1 = 000000001b3ffcd0
!	%l0 = ffffffffffffe5ff, Mem[0000000021800100] = 5e004cdd, %asi = 80
	stha	%l0,[%o3+0x100]%asi	! Mem[0000000021800100] = e5ff4cdd
!	%l4 = ffffffffffffffff, Mem[00000000211c0001] = 00ff7001, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00ff7001
!	Mem[0000000010081410] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010141400] = ffbb80c5, %l0 = ffffffffffffe5ff
	swap	[%i5+%g0],%l0		! %l0 = 00000000ffbb80c5
!	%f18 = ffbb80c5 315d3c5e, Mem[0000000030101410] = ffffffff ff000000
	stda	%f18,[%i4+%o5]0x81	! Mem[0000000030101410] = ffbb80c5 315d3c5e
!	%f18 = ffbb80c5, Mem[0000000010041400] = 00000000
	sta	%f18,[%i1+%g0]0x88	! Mem[0000000010041400] = ffbb80c5
!	%l3 = ffffffffffffffff, Mem[0000000030141410] = 1afffeff00000000
	stxa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 39307cef ff7f0000, %l6 = 5e3c5d31, %l7 = 5dfa1e06
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 0000000039307cef 00000000ff7f0000

p0_label_281:
!	%f26 = b4e5a795, %f23 = 000000e0, %f23 = 000000e0
	fsubs	%f26,%f23,%f23		! %l0 = 00000000ffbb80e7, Unfinished, %fsr = 2e00000800
!	Mem[0000000030081400] = 00000000, %l0 = 00000000ffbb80e7
	lduha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = ff000000, %l0 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l5 = f9250070c580bbff
	ldswa	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141424] = 00000000, %l3 = ffffffffffffffff
	ldswa	[%i5+0x024]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101438] = 000000a01870ffff, %l0 = 0000000000000000
	ldxa	[%i4+0x038]%asi,%l0	! %l0 = 000000a01870ffff
!	Mem[0000000010141414] = 00000000, %l4 = ffffffffffffffff
	lduw	[%i5+0x014],%l4		! %l4 = 0000000000000000
!	Mem[000000001000141c] = ffff0000, %l0 = 000000a01870ffff
	ldsba	[%i0+0x01d]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000 000000d0, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000d0 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 000000001b3ffcd0, Mem[0000000010141408] = 39307cef
	stba	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = d0307cef

p0_label_282:
!	%l2 = 00000000000000d0, Mem[0000000010101400] = 00000000
	stha	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00d00000
!	%l4 = 0000000000000000, Mem[0000000010041408] = ffffffff
	stha	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff0000
!	Mem[000000001014143f] = cc174fb6, %l3 = 0000000000000000
	ldstub	[%i5+0x03f],%l3		! %l3 = 000000b6000000ff
!	Mem[00000000100c142a] = cef18dd7, %l2 = 00000000000000d0
	ldstuba	[%i3+0x02a]%asi,%l2	! %l2 = 0000008d000000ff
	membar	#Sync			! Added by membar checker (57)
!	%f24 = 00000000 000000e0, Mem[0000000010001410] = e5b4ffff ffffffff
	stda	%f24,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 000000e0
!	Mem[0000000010101408] = ff000000, %l2 = 000000000000008d
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1400] = ffe5a795, %l3 = 00000000000000b6
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ffe5a795
!	%f5  = ffffffff, Mem[0000000010141410] = b4e5a700
	sta	%f5 ,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffff
!	%f17 = cc174fb6, Mem[0000000030101410] = ffbb80c5
	sta	%f17,[%i4+%o5]0x81	! Mem[0000000030101410] = cc174fb6
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = ff001f70, %l1 = 000000001b3ffcd0
	ldsh	[%o3+0x140],%l1		! %l1 = ffffffffffffff00

p0_label_283:
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141438] = 39307cefcc174fff, %l5 = 0000000000000000
	ldx	[%i5+0x038],%l5		! %l5 = 39307cefcc174fff
!	Mem[0000000010001410] = e0000000 00000000, %l6 = 39307cef, %l7 = ff7f0000
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000 00000000e0000000
!	Mem[0000000010041408] = 0000ffff, %l1 = ffffffffffffff00
	ldsba	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%l4 = 0000000000000000, imm = fffffffffffffc9a, %l0 = ffffffffffffffff
	add	%l4,-0x366,%l0		! %l0 = fffffffffffffc9a
!	Mem[0000000030101400] = ff670000, %l3 = 00000000ffe5a795
	ldsba	[%i4+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141400] = ed3f000039307cef, %l2 = 00000000000000ff
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = ed3f000039307cef
!	%f19 = 315d3c5e, %f5  = ffffffff, %f8  = ff000000
	fsubs	%f19,%f5 ,%f8 		! %f8  = ffffffff
!	Mem[0000000010101410] = 00000000, %l3 = ffffffffffffffff
	ldsba	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ffffffff, %l2 = ed3f000039307cef
	swapa	[%i2+%o5]0x80,%l2	! %l2 = 00000000ffffffff

p0_label_284:
!	%l7 = 00000000e0000000, Mem[0000000030001400] = 00000000
	stba	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l0 = fffffffffffffc9a, imm = fffffffffffff84e, %l5 = 39307cefcc174fff
	subc	%l0,-0x7b2,%l5		! %l5 = 000000000000044c
!	%l1 = 0000000000000000, Mem[0000000010041400] = c580bbff
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%f16 = ef7c3039 cc174fb6, %l0 = fffffffffffffc9a
!	Mem[0000000030081400] = 00000000fffff842
	stda	%f16,[%i2+%l0]ASI_PST16_S ! Mem[0000000030081400] = ef7c0000cc17f842
!	%l7 = 00000000e0000000, Mem[00000000100c1400] = b6000000
	stha	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = b6000000
!	%l4 = 0000000000000000, Mem[0000000010141400] = ffe5ffff
	stwa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%l6 = 00000000, %l7 = e0000000, Mem[0000000010081418] = 000000ff 6e17dfe9
	std	%l6,[%i2+0x018]		! Mem[0000000010081418] = 00000000 e0000000
!	Mem[000000001004140c] = 00000000, %l4 = 0000000000000000, %asi = 80
	swapa	[%i1+0x00c]%asi,%l4	! %l4 = 0000000000000000
!	%f0  = 00000000 ffffffff, Mem[00000000100c1408] = 1afffeff 1ab5feff
	stda	%f0 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff7f0000, %l2 = 00000000ffffffff
	ldsha	[%i1+%o5]0x81,%l2	! %l2 = ffffffffffffff7f

p0_label_285:
!	Mem[0000000030141408] = ff00000000000000, %f20 = a7d90000 00000000
	ldda	[%i5+%o4]0x81,%f20	! %f20 = ff000000 00000000
!	Mem[0000000030001410] = 6783a828, %l4 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l4	! %l4 = 000000006783a828
!	Mem[0000000030001408] = d0000000 00000000, %l0 = fffffc9a, %l1 = 00000000
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 00000000d0000000 0000000000000000
!	Mem[0000000030001410] = 6783a828, %l7 = 00000000e0000000
	ldsba	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000067
!	Mem[0000000030041408] = ff000000c5804197, %f26 = b4e5a795 7abaad19
	ldda	[%i1+%o4]0x89,%f26	! %f26 = ff000000 c5804197
!	Mem[00000000300c1408] = 00000000, %l5 = 000000000000044c
	ldswa	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Code Fragment 3
p0_fragment_21:
!	%l0 = 00000000d0000000
	setx	0x1ba6f6cfcf908e02,%g7,%l0 ! %l0 = 1ba6f6cfcf908e02
!	%l1 = 0000000000000000
	setx	0x6d8d83685c9ad3c7,%g7,%l1 ! %l1 = 6d8d83685c9ad3c7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1ba6f6cfcf908e02
	setx	0x1920f1f87f1acd8c,%g7,%l0 ! %l0 = 1920f1f87f1acd8c
!	%l1 = 6d8d83685c9ad3c7
	setx	0x0d21fcbff587fed7,%g7,%l1 ! %l1 = 0d21fcbff587fed7
!	Mem[00000000100c1400] = b6000000, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = 00ff7001, %l7 = 0000000000000067
	ldsb	[%o2+0x001],%l7		! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00000000, %l1 = 0d21fcbff587fed7
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 00000000000000ff

p0_label_286:
!	%f8  = ffffffff 700025f9, %l2 = ffffffffffffff7f
!	Mem[0000000030181418] = f927f3d86025bc2d
	add	%i6,0x018,%g1
	stda	%f8,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030181418] = f9250070ffffff2d
!	Mem[0000000030141408] = 000000ff, %l4 = 000000006783a828
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%f12 = e0000000 d494ff67, Mem[0000000010001408] = ff000000 000000ff
	stda	%f12,[%i0+%o4]0x80	! Mem[0000000010001408] = e0000000 d494ff67
!	Mem[0000000010001410] = 000000ff, %l0 = 1920f1f87f1acd8c
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000030101410] = cc174fb6315d3c5e
	stxa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000000
!	%l2 = ffffffffffffff7f, Mem[0000000030081410] = ffbb80c5
	stha	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = ff7f80c5
!	Mem[000000001004140e] = 00000000, %l2 = ffffffffffffff7f
	ldstuba	[%i1+0x00e]%asi,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010181408] = ffffffff
	stha	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00ffffff
!	%l3 = 0000000000000000, Mem[0000000010141408] = d0307cef
	stwa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = 00000000e0000000, %l0 = 00000000000000ff
	ldx	[%i2+0x018],%l0		! %l0 = 00000000e0000000

p0_label_287:
!	Mem[00000000100c1420] = b4e5a795, %l6 = 0000000000000000
	ldsw	[%i3+0x020],%l6		! %l6 = ffffffffb4e5a795
!	Mem[0000000010001400] = 00000000, %l3 = 0000000000000000
	lduba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 1b3ffcd0, %l1 = 0000000000000000
	lduha	[%i4+%o4]0x89,%l1	! %l1 = 000000000000fcd0
!	Mem[0000000021800100] = e5ff4cdd, %l3 = 0000000000000000
	lduh	[%o3+0x100],%l3		! %l3 = 000000000000e5ff
!	Mem[0000000010081400] = 39307cef, %l6 = ffffffffb4e5a795
	lduha	[%i2+%g0]0x88,%l6	! %l6 = 0000000000007cef
!	Mem[0000000010181400] = 00000000, %l1 = 000000000000fcd0
	lduba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = 00007fff, %f8  = ffffffff
	lda	[%i1+%o5]0x89,%f8 	! %f8 = 00007fff
!	%l7 = ffffffffffffffff, %l6 = 0000000000007cef, %y  = fffffffc
	smul	%l7,%l6,%l5		! %l5 = ffffffffffff8311, %y = ffffffff
!	Mem[0000000010001400] = 00000000, %l7 = ffffffffffffffff
	ldsba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000e5ff, Mem[0000000010101432] = ff7ac14c, %asi = 80
	stha	%l3,[%i4+0x032]%asi	! Mem[0000000010101430] = ff7ae5ff

p0_label_288:
!	%f26 = ff000000 c5804197, %l1 = 0000000000000000
!	Mem[0000000010181420] = ff00000000ff0000
	add	%i6,0x020,%g1
	stda	%f26,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010181420] = ff00000000ff0000
!	Mem[00000000100c1408] = 00000000, %l5 = ffffffffffff8311
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%l0 = 00000000e0000000, Mem[00000000211c0001] = 00ff7001
	stb	%l0,[%o2+0x001]		! Mem[00000000211c0000] = 00007001
!	%f24 = 00000000 000000e0, Mem[0000000010101400] = 00d00000 000000e0
	std	%f24,[%i4+%g0]	! Mem[0000000010101400] = 00000000 000000e0
!	%f9  = 700025f9, Mem[0000000010001400] = 00000000
	sta	%f9 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 700025f9
!	%l2 = 00000000, %l3 = 0000e5ff, Mem[0000000030001400] = 00000000 005e0000
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 0000e5ff
!	Mem[0000000010001400] = f9250070, %l7 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 000000f9000000ff
!	Mem[0000000030181410] = 315d3c5e, %l5 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 00000031000000ff
!	%l3 = 000000000000e5ff, Mem[00000000100c1410] = ff000000
	stba	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 42f817cc00007cef, %l5 = 0000000000000031
	ldxa	[%i2+%g0]0x89,%l5	! %l5 = 42f817cc00007cef

p0_label_289:
!	Mem[00000000300c1410] = 00000000, %l2 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = c580bbff, %l5 = 42f817cc00007cef
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = ffffffffffffbbff
	membar	#Sync			! Added by membar checker (58)
!	Mem[0000000010141400] = 00000000 ffffffff 00000000 ff7f0000
!	Mem[0000000010141410] = ffffffff 00000000 f927f3d8 6025bc2d
!	Mem[0000000010141420] = b4e5a795 00000000 cef18dd7 28a88367
!	Mem[0000000010141430] = 9ae99a45 0ff7373e 39307cef cc174fff
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000010001410] = ff000000, %l4 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081400] = ef7c3039, %l5 = ffffffffffffbbff
	lduha	[%i2+%g0]0x80,%l5	! %l5 = 000000000000ef7c
!	Mem[0000000010101400] = 00000000 000000e0, %l2 = 00000000, %l3 = 0000e5ff
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000 00000000000000e0
!	Mem[0000000030181410] = ff5d3c5e00000000, %l3 = 00000000000000e0
	ldxa	[%i6+%o5]0x81,%l3	! %l3 = ff5d3c5e00000000
!	Mem[0000000010141400] = 00000000, %l6 = 0000000000007cef
	lduwa	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141418] = f927f3d8 6025bc2d, %l6 = 00000000, %l7 = 000000f9
	ldd	[%i5+0x018],%l6		! %l6 = 00000000f927f3d8 000000006025bc2d
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = ffff8ed8, %l3 = ff5d3c5e00000000
	ldstub	[%o1+%g0],%l3		! %l3 = 000000ff000000ff

p0_label_290:
!	%l6 = 00000000f927f3d8, Mem[00000000100c1428] = cef1ffd7
	stb	%l6,[%i3+0x028]		! Mem[00000000100c1428] = d8f1ffd7
	membar	#Sync			! Added by membar checker (59)
!	%l7 = 000000006025bc2d, Mem[0000000010141403] = 00000000, %asi = 80
	stba	%l7,[%i5+0x003]%asi	! Mem[0000000010141400] = 0000002d
!	%l2 = 0000000000000000, Mem[0000000030001400] = 000000000000e5ff
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	%l4 = ffffffffffffffff, Mem[0000000010101410] = 00000000
	stba	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	%f22 = f927f3d8 6025bc2d, %l6 = 00000000f927f3d8
!	Mem[0000000030101408] = d0fc3f1b00000000
	add	%i4,0x008,%g1
	stda	%f22,[%g1+%l6]ASI_PST32_S ! Mem[0000000030101408] = d0fc3f1b00000000
!	Mem[0000000010181408] = ffffff00, %l3 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l6 = 00000000f927f3d8, Mem[0000000010181408] = ffffffff
	stba	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = d8ffffff
!	Mem[00000000218000c1] = ee75de47, %l3 = 0000000000000000
	ldstub	[%o3+0x0c1],%l3		! %l3 = 00000075000000ff
!	%f13 = d494ff67, Mem[0000000030141410] = ffffffff
	sta	%f13,[%i5+%o5]0x89	! Mem[0000000030141410] = d494ff67
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = c580bbff, %l7 = 000000006025bc2d
	lduba	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ff

p0_label_291:
!	Mem[0000000010001408] = e0000000, %l3 = 0000000000000075
	ldswa	[%i0+%o4]0x80,%l3	! %l3 = ffffffffe0000000
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	lduba	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041434] = a404cce3, %l6 = 00000000f927f3d8
	ldsh	[%i1+0x034],%l6		! %l6 = ffffffffffffa404
!	Mem[0000000030081408] = ffffffff00000000, %l3 = ffffffffe0000000
	ldxa	[%i2+%o4]0x81,%l3	! %l3 = ffffffff00000000
!	Mem[0000000010041418] = 6783a828, %l1 = 0000000000000000
	ldub	[%i1+0x01b],%l1		! %l1 = 0000000000000028
!	Mem[0000000030101410] = 0000000000000000, %l1 = 0000000000000028
	ldxa	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = d0000000, %l6 = ffffffffffffa404
	ldsba	[%i0+%o4]0x81,%l6	! %l6 = ffffffffffffffd0
!	Mem[0000000010081408] = ffbb80c5, %l7 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081410] = ef7c3039, %f21 = 00000000
	lda	[%i2+%o5]0x88,%f21	! %f21 = ef7c3039
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffff, Mem[0000000030001400] = 00000000
	stwa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffff

p0_label_292:
!	%l7 = ffffffffffffffff, Mem[0000000010081408] = ffbb80c5
	stwa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff
!	Mem[0000000030041410] = ff7f0000, %l7 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	%l5 = 000000000000ef7c, Mem[0000000030181408] = 1affffff0080882e
	stxa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000000000ef7c
!	Code Fragment 3
p0_fragment_22:
!	%l0 = 00000000e0000000
	setx	0xe093c3ef957a1b77,%g7,%l0 ! %l0 = e093c3ef957a1b77
!	%l1 = 0000000000000000
	setx	0x0d017dafdf02e823,%g7,%l1 ! %l1 = 0d017dafdf02e823
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e093c3ef957a1b77
	setx	0x8448e3f00e450b4f,%g7,%l0 ! %l0 = 8448e3f00e450b4f
!	%l1 = 0d017dafdf02e823
	setx	0x296a4bafecb4c380,%g7,%l1 ! %l1 = 296a4bafecb4c380
!	%f29 = 0ff7373e, Mem[00000000300c1410] = 00000000
	sta	%f29,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0ff7373e
!	%l0 = 8448e3f00e450b4f, Mem[0000000010181410] = 000000ff
	stwa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 0e450b4f
!	%l7 = 00000000000000ff, Mem[0000000010081438] = fffff84291ffff00, %asi = 80
	stxa	%l7,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000000000000ff
!	%l6 = ffffffffffffffd0, Mem[0000000010041410] = 00ffff91000000ff, %asi = 80
	stxa	%l6,[%i1+0x010]%asi	! Mem[0000000010041410] = ffffffffffffffd0
!	Mem[0000000010001410] = ff000000, %l5 = 000000000000ef7c
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 0000ffff 0000ff00, %l6 = ffffffd0, %l7 = 000000ff
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 000000000000ffff 000000000000ff00

p0_label_293:
!	Mem[0000000030141408] = 000000ff, %l0 = 8448e3f00e450b4f
	lduwa	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181400] = ff000000, %l2 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = ffffffff, %l5 = 00000000ff000000
	ldswa	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101408] = ff000000000000ff, %l6 = 000000000000ffff
	ldxa	[%i4+%o4]0x80,%l6	! %l6 = ff000000000000ff
!	Mem[00000000100c1430] = fffeb51afffeb51a, %f2  = ff000000 000000ff
	ldd	[%i3+0x030],%f2 	! %f2  = fffeb51a fffeb51a
!	Mem[00000000211c0000] = 00007001, %l2 = 0000000000000000
	ldsh	[%o2+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %f28 = 9ae99a45
	lda	[%i4+%o5]0x81,%f28	! %f28 = 00000000
!	Mem[0000000030181408] = 00000000, %l1 = 296a4bafecb4c380
	lduha	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000000
!	%l0 = 00000000000000ff, imm = fffffffffffffc7f, %l5 = ffffffffffffffff
	orn	%l0,-0x381,%l5		! %l5 = 00000000000003ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ffffffff, %l0 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 000000ff000000ff

p0_label_294:
!	%f12 = e0000000 d494ff67, Mem[0000000010041410] = ffffffff ffffffd0
	stda	%f12,[%i1+%o5]0x80	! Mem[0000000010041410] = e0000000 d494ff67
!	%f7  = ffff0000, %f7  = ffff0000
	fcmpes	%fcc0,%f7 ,%f7 		! %fcc0 = 3
!	Mem[00000000100c1410] = ff0000ff, %l4 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000010081410] = 39307cef
	stwa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	%l2 = 0000000000000000, Mem[000000001018140d] = 4b2bd9a7
	stb	%l2,[%i6+0x00d]		! Mem[000000001018140c] = 4b00d9a7
!	Mem[0000000010081408] = ffffffff, %l5 = 00000000000003ff
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 00000000ffffffff
!	%l7 = 000000000000ff00, Mem[0000000010041410] = e0000000d494ff67
	stxa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000000000ff00
!	Mem[0000000010081400] = 39307cef, %l6 = ff000000000000ff
	swapa	[%i2+%g0]0x88,%l6	! %l6 = 0000000039307cef
!	%l7 = 000000000000ff00, Mem[0000000010141408] = 00000000
	stwa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = c5807fff, %l5 = 00000000ffffffff
	ldswa	[%i2+%o5]0x89,%l5	! %l5 = ffffffffc5807fff

p0_label_295:
!	Mem[00000000300c1410] = 0ff7373e, %l7 = 000000000000ff00
	lduha	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000ff7
!	Mem[0000000030141400] = 39307cef, %l7 = 0000000000000ff7
	ldswa	[%i5+%g0]0x89,%l7	! %l7 = 0000000039307cef
!	Mem[0000000030101410] = 00000000, %l6 = 0000000039307cef
	ldswa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = 000000ff, %f12 = e0000000
	lda	[%i2+%o5]0x80,%f12	! %f12 = 000000ff
!	Mem[00000000211c0000] = 00007001, %l6 = 0000000000000000
	ldub	[%o2+0x001],%l6		! %l6 = 0000000000000000
!	Mem[000000001014143c] = cc174fff, %l5 = ffffffffc5807fff
	lduwa	[%i5+0x03c]%asi,%l5	! %l5 = 00000000cc174fff
!	Mem[0000000030081400] = 42f817cc 00007cef, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 0000000000007cef 0000000042f817cc
	membar	#Sync			! Added by membar checker (60)
!	Mem[00000000100c1400] = 000000b6 5a64ed3f 1183ffff ffffffff
!	Mem[00000000100c1410] = ff0000ff ffffffff b64f17cc ef7c3039
!	Mem[00000000100c1420] = b4e5a795 00000000 d8f1ffd7 ffffffe3
!	Mem[00000000100c1430] = fffeb51a fffeb51a 39307cef cc174fb6
	ldda	[%i3]ASI_BLK_AIUP,%f0	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 39307cef, Mem[0000000010141408] = 0000ff00 00007fff
	stda	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 39307cef

p0_label_296:
!	%f16 = 00000000 ffffffff, %l1 = 0000000000000000
!	Mem[0000000030181418] = f9250070ffffff2d
	add	%i6,0x018,%g1
	stda	%f16,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030181418] = f9250070ffffff2d
!	%l3 = 0000000042f817cc, immd = 000000000000093c, %l5 = 00000000cc174fff
	sdivx	%l3,0x93c,%l5		! %l5 = 000000000007408d
!	Mem[00000000300c1410] = 3e37f70f, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 000000003e37f70f
!	%l6 = 0000000000000000, Mem[0000000010041410] = 00000000
	stha	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l4 = 000000ff, %l5 = 0007408d, Mem[0000000010101400] = 00000000 000000e0
	stda	%l4,[%i4+0x000]%asi	! Mem[0000000010101400] = 000000ff 0007408d
!	%f24 = b4e5a795, Mem[0000000010041410] = 00000000
	sta	%f24,[%i1+%o5]0x88	! Mem[0000000010041410] = b4e5a795
!	%l4 = 00000000000000ff, Mem[0000000010141408] = 39307cef00000000
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000000000ff
!	%l7 = 0000000039307cef, Mem[0000000030101400] = 000067ff
	stba	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 000067ef
!	%l6 = 0000000000000000, Mem[0000000010081400] = ff000000cc174fb6
	stxa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000ffffffffff, %f24 = b4e5a795 00000000
	ldda	[%i2+%o5]0x80,%f24	! %f24 = 000000ff ffffffff

p0_label_297:
!	Mem[0000000030081410] = c5807fff, %f31 = cc174fff
	lda	[%i2+%o5]0x89,%f31	! %f31 = c5807fff
!	Mem[0000000010081408] = 000003ff315d3c5e, %f20 = ffffffff ef7c3039
	ldda	[%i2+%o4]0x80,%f20	! %f20 = 000003ff 315d3c5e
!	Mem[0000000030001410] = 28a88367, %f19 = ff7f0000
	lda	[%i0+%o5]0x89,%f19	! %f19 = 28a88367
!	Mem[0000000030081400] = 42f817cc 00007cef, %l0 = 000000ff, %l1 = 3e37f70f
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 0000000000007cef 0000000042f817cc
!	Mem[0000000010141400] = 0000002d, %l5 = 000000000007408d
	ldswa	[%i5+%g0]0x80,%l5	! %l5 = 000000000000002d
!	Mem[0000000010141400] = 0000002d, %l3 = 0000000042f817cc
	lduwa	[%i5+%g0]0x80,%l3	! %l3 = 000000000000002d
!	Mem[000000001000140c] = d494ff67, %f16 = 00000000
	ld	[%i0+0x00c],%f16	! %f16 = d494ff67
!	Mem[0000000030041400] = 00000000 00000000, %l6 = 00000000, %l7 = 39307cef
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[00000000100c1408] = ffff8311, %l6 = 0000000000000000
	ldsha	[%i3+%o4]0x88,%l6	! %l6 = ffffffffffff8311
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (61)
!	%l4 = 000000ff, %l5 = 0000002d, Mem[00000000100c1408] = ffff8311 ffffffff
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff 0000002d

p0_label_298:
!	%l0 = 0000000000007cef, Mem[0000000010181408] = d8ffffff
	stba	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = efffffff
!	%l0 = 00007cef, %l1 = 42f817cc, Mem[0000000010041408] = 0000ffff 0000ff00
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00007cef 42f817cc
!	%f5  = ffffffff, Mem[0000000010141408] = 000000ff
	sta	%f5 ,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffff
!	Mem[0000000010081410] = 000000ff, %l5 = 000000000000002d
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%f6  = b64f17cc, Mem[00000000100c1408] = 000000ff
	sta	%f6 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = b64f17cc
!	%f22 = f927f3d8 6025bc2d, %l4 = 00000000000000ff
!	Mem[0000000010041438] = 0000ffffffffffff
	add	%i1,0x038,%g1
	stda	%f22,[%g1+%l4]ASI_PST16_P ! Mem[0000000010041438] = f927f3d86025bc2d
!	%l2 = 0000000000007cef, Mem[0000000010101438] = 000000a0, %asi = 80
	stha	%l2,[%i4+0x038]%asi	! Mem[0000000010101438] = 7cef00a0
!	%l4 = 00000000000000ff, Mem[00000000211c0000] = 00007001
	stb	%l4,[%o2+%g0]		! Mem[00000000211c0000] = ff007001
!	%f22 = f927f3d8 6025bc2d, Mem[0000000010041408] = 00007cef 42f817cc
	stda	%f22,[%i1+%o4]0x80	! Mem[0000000010041408] = f927f3d8 6025bc2d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff0000ff, %l5 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l5	! %l5 = ffffffffff0000ff

p0_label_299:
!	Mem[0000000010141438] = 39307cef, %l3 = 000000000000002d
	lduh	[%i5+0x038],%l3		! %l3 = 0000000000003930
!	Mem[00000000100c1410] = ff0000ff, %l4 = 00000000000000ff
	ldsha	[%i3+%o5]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010141418] = f927f3d86025bc2d, %l2 = 0000000000007cef
	ldxa	[%i5+0x018]%asi,%l2	! %l2 = f927f3d86025bc2d
!	Mem[0000000010001410] = 7cef0000, %l5 = ffffffffff0000ff
	lduba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = ffffffff, %l2 = f927f3d86025bc2d
	lduh	[%i5+0x00a],%l2		! %l2 = 000000000000ffff
!	Mem[0000000010141410] = ffffffff, %l2 = 000000000000ffff
	ldsha	[%i5+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141400] = ef7c3039, %l1 = 0000000042f817cc
	ldsba	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffffffef
!	%l4 = ffffffffffffff00, %l1 = ffffffffffffffef, %l2 = ffffffffffffffff
	addc	%l4,%l1,%l2		! %l2 = fffffffffffffeef
!	Mem[0000000021800180] = 2affac10, %l0 = 0000000000007cef
	ldsh	[%o3+0x180],%l0		! %l0 = 0000000000002aff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000003930, Mem[0000000010101408] = ff000000
	stba	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 30000000

p0_label_300:
!	Mem[0000000010041410] = 95a7e5b4, %l6 = ffffffffffff8311
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 00000095000000ff
!	Mem[00000000211c0001] = ff007001, %l4 = ffffffffffffff00
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181420] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i6+0x020]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030181408] = 00000000, %l4 = 00000000000000ff
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141426] = 00000000, %l0 = 0000000000002aff
	ldstuba	[%i5+0x026]%asi,%l0	! %l0 = 00000000000000ff
!	%f24 = 000000ff ffffffff, Mem[0000000010101408] = 30000000 000000ff
	std	%f24,[%i4+%o4]	! Mem[0000000010101408] = 000000ff ffffffff
!	%l2 = fffffeef, %l3 = 00003930, Mem[0000000010181438] = 00ff03ff 00000000
	std	%l2,[%i6+0x038]		! Mem[0000000010181438] = fffffeef 00003930
!	%f17 = ffffffff, Mem[0000000030001408] = d0000000
	sta	%f17,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff
!	Mem[0000000010041400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 000003ff, %l4 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_301:
!	Mem[0000000030041408] = 974180c5, %l1 = ffffffffffffffef
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffff97
!	Mem[0000000010181430] = 00000000, %l1 = ffffff97, %l2 = fffffeef
	add	%i6,0x30,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l7 = 0000000000000000
	lduba	[%i2+0x002]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l3 = 0000000000003930
	ldsha	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %f16 = d494ff67
	lda	[%i2+%g0]0x80,%f16	! %f16 = 00000000
!	Mem[000000001014141c] = 6025bc2d, %l0 = 0000000000000000
	ldsb	[%i5+0x01d],%l0		! %l0 = 0000000000000025
!	Mem[0000000030081400] = ef7c0000, %l0 = 0000000000000025
	lduha	[%i2+%g0]0x81,%l0	! %l0 = 000000000000ef7c
!	Mem[0000000030001408] = ffffffff, %l5 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l5	! %l5 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081428] = b4e5a795, %l2 = 0000000000000000, %asi = 80
	swapa	[%i2+0x028]%asi,%l2	! %l2 = 00000000b4e5a795

p0_label_302:
!	%f12 = fffeb51a, Mem[00000000100c1400] = 000000b6
	sta	%f12,[%i3+%g0]0x80	! Mem[00000000100c1400] = fffeb51a
!	%l3 = 0000000000000000, Mem[0000000010141408] = ffffffff
	stha	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000ffff
!	%l6 = 0000000000000095, Mem[0000000010141410] = ffffffff
	stwa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000095
!	Mem[00000000201c0000] = 00ff826e, %l4 = 0000000000000000
	ldstub	[%o0+%g0],%l4		! %l4 = 00000000000000ff
!	%l5 = 00000000ffffffff, %l6 = 0000000000000095, %l5 = 00000000ffffffff
	or	%l5,%l6,%l5		! %l5 = 00000000ffffffff
!	Mem[0000000010081410] = ff0000ff, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	%l6 = 00000095, %l7 = 00000000, Mem[0000000010141408] = 0000ffff 00000000
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000095 00000000
!	%f24 = 000000ff ffffffff, Mem[0000000010181428] = a27f370c 00000000
	stda	%f24,[%i6+0x028]%asi	! Mem[0000000010181428] = 000000ff ffffffff
!	%l2 = 00000000b4e5a795, Mem[00000000100c1400] = fffeb51a
	sth	%l2,[%i3+%g0]		! Mem[00000000100c1400] = a795b51a
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l1 = ffffffffffffff97
	lduba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_303:
!	Mem[0000000030101400] = ef670000, %l0 = 000000000000ef7c
	ldsba	[%i4+%g0]0x81,%l0	! %l0 = ffffffffffffffef
!	Mem[0000000030141410] = 67ff94d4, %l5 = 00000000ffffffff
	lduha	[%i5+%o5]0x81,%l5	! %l5 = 00000000000067ff
!	Mem[00000000201c0000] = ffff826e, %l6 = 0000000000000095
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030181410] = ff5d3c5e, %l1 = 0000000000000000
	lduha	[%i6+%o5]0x81,%l1	! %l1 = 000000000000ff5d
!	Mem[0000000030101410] = 00000000, %l3 = 00000000000000ff
	lduha	[%i4+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 1ab595a7, %l6 = 000000000000ffff
	lduba	[%i3+%g0]0x88,%l6	! %l6 = 00000000000000a7
!	Mem[0000000030001400] = ffffffff, %l0 = ffffffffffffffef
	lduwa	[%i0+%g0]0x81,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030001410] = 0000000028a88367, %l4 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = 0000000028a88367
!	Mem[0000000010081400] = 00000000, %l2 = 00000000b4e5a795
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030041400] = 00000000
	stba	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000

p0_label_304:
!	Mem[0000000030081410] = c5807fff, %l2 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l2	! %l2 = 00000000c5807fff
!	%l0 = 00000000ffffffff, Mem[0000000010141430] = 9ae99a45
	sth	%l0,[%i5+0x030]		! Mem[0000000010141430] = ffff9a45
!	Mem[0000000010141430] = ffff9a45, %l5 = 00000000000067ff
	swap	[%i5+0x030],%l5		! %l5 = 00000000ffff9a45
!	%l1 = 000000000000ff5d, Mem[0000000010181408] = efffffff
	stha	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = ff5dffff
!	%f5  = ffffffff, Mem[0000000010001408] = 000000e0
	sta	%f5 ,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff
!	%l0 = 00000000ffffffff, Mem[0000000030041400] = 00000000
	stha	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = ffff0000
!	Mem[0000000030181408] = ff000000, %l2 = 00000000c5807fff
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 00000000ff000000
!	%l1 = 000000000000ff5d, Mem[0000000030101408] = d0fc3f1b
	stwa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ff5d
!	%f22 = f927f3d8, Mem[0000000010081400] = 00000000
	sta	%f22,[%i2+%g0]0x80	! Mem[0000000010081400] = f927f3d8
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = f927f3d86025bc2d, %l1 = 000000000000ff5d
	ldx	[%i1+%o4],%l1		! %l1 = f927f3d86025bc2d

p0_label_305:
!	Mem[0000000010141428] = cef18dd7 28a88367, %l6 = 000000a7, %l7 = 00000000
	ldda	[%i5+0x028]%asi,%l6	! %l6 = 00000000cef18dd7 0000000028a88367
!	Mem[0000000030181408] = 7cef0000ff7f80c5, %l7 = 0000000028a88367
	ldxa	[%i6+%o4]0x89,%l7	! %l7 = 7cef0000ff7f80c5
!	Mem[0000000010141408] = 95000000, %l6 = 00000000cef18dd7
	ldsha	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ffff7001, %l3 = 0000000000000000
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010181410] = 4f0b450e, %l2 = 00000000ff000000
	ldsw	[%i6+%o5],%l2		! %l2 = 000000004f0b450e
!	Mem[00000000211c0000] = ffff7001, %l2 = 000000004f0b450e
	ldsb	[%o2+0x001],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010081408] = 000003ff 315d3c5e, %l6 = 00000000, %l7 = ff7f80c5
	ldda	[%i2+0x008]%asi,%l6	! %l6 = 00000000000003ff 00000000315d3c5e
!	Mem[0000000010141434] = 0ff7373e, %l1 = f927f3d86025bc2d
	lduw	[%i5+0x034],%l1		! %l1 = 000000000ff7373e
!	%f1  = 5a64ed3f, %f20 = 000003ff, %f31 = c5807fff
	fsubs	%f1 ,%f20,%f31		! %l0 = 0000000100000021, Unfinished, %fsr = 2e00000c00
!	Starting 10 instruction Store Burst
!	%l7 = 00000000315d3c5e, Mem[0000000010081410] = ff0000ffffffffff
	stx	%l7,[%i2+%o5]		! Mem[0000000010081410] = 00000000315d3c5e

p0_label_306:
!	Mem[0000000010141408] = 00000095, %l6 = 00000000000003ff
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000095
!	%f0  = 000000b6 5a64ed3f, %l2 = ffffffffffffffff
!	Mem[0000000010141428] = cef18dd728a88367
	add	%i5,0x028,%g1
	stda	%f0,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010141428] = 3fed645ab6000000
!	Mem[0000000030181400] = 000000ff, %l2 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l4 = 0000000028a88367, immed = 00000441, %y  = ffffffff
	umul	%l4,0x441,%l2		! %l2 = 000000acf4d6f927, %y = 000000ac
!	%l7 = 00000000315d3c5e, Mem[0000000030081400] = ef7c0000
	stha	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 3c5e0000
!	Mem[0000000010081410] = 00000000, %l3 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%f28 = 00000000 0ff7373e, Mem[0000000010181400] = 00000000 ffffffff
	stda	%f28,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 0ff7373e
!	%f0  = 000000b6, Mem[0000000010101404] = 0007408d
	sta	%f0 ,[%i4+0x004]%asi	! Mem[0000000010101404] = 000000b6
!	%f18 = 00000000, Mem[0000000030081410] = 00000000
	sta	%f18,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000ff, %f14 = 39307cef
	lda	[%i4+%o5]0x88,%f14	! %f14 = 000000ff

p0_label_307:
!	Mem[0000000020800040] = 00ffcbdb, %l0 = 0000000100000021
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141410] = 00000095, %l6 = 0000000000000095
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000095
!	Mem[0000000010181408] = ff5dffff, %l1 = 000000000ff7373e
	ldswa	[%i6+0x008]%asi,%l1	! %l1 = ffffffffff5dffff
!	Mem[0000000030101408] = 0000ff5d, %l7 = 00000000315d3c5e
	ldsha	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = ff250070 ffffffff, %l2 = f4d6f927, %l3 = 00000000
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ff250070 00000000ffffffff
!	Mem[00000000100c1400] = a795b51a, %l4 = 0000000028a88367
	ldsha	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffa795
!	%l3 = 00000000ffffffff, immd = fffffffffffff49a, %l5 = 00000000ffff9a45
	udivx	%l3,-0xb66,%l5		! %l5 = 0000000000000000
!	%f7  = ef7c3039, %f19 = 28a88367, %f15 = cc174fb6
	fdivs	%f7 ,%f19,%f15		! %f15 = ff800000
!	Mem[0000000010101410] = 000000ff, %l2 = 00000000ff250070
	lduwa	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010081408] = ff030000
	stha	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = ff0300ff

p0_label_308:
!	%l6 = 0000000000000095, Mem[0000000010041410] = ffa7e5b40000ff00
	stxa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000095
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stha	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010101400] = 000000ff, %l7 = 00000000, %l2 = 000000ff
	casa	[%i4]0x80,%l7,%l2	! %l2 = 00000000000000ff
!	%f31 = c5807fff, Mem[0000000030001408] = ffffffff
	sta	%f31,[%i0+%o4]0x89	! Mem[0000000030001408] = c5807fff
!	Mem[00000000100c1410] = ff0000ff, %l3 = 00000000ffffffff
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 00000000ff0000ff
!	%l2 = 00000000000000ff, Mem[00000000100c143c] = cc174fb6, %asi = 80
	stwa	%l2,[%i3+0x03c]%asi	! Mem[00000000100c143c] = 000000ff
!	Mem[000000001004143c] = 6025bc2d, %l3 = 00000000ff0000ff, %asi = 80
	swapa	[%i1+0x03c]%asi,%l3	! %l3 = 000000006025bc2d
!	%l4 = ffffffffffffa795, Mem[0000000010041408] = f927f3d8
	stw	%l4,[%i1+%o4]		! Mem[0000000010041408] = ffffa795
!	Mem[0000000010041400] = ff000000, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[000000001018142c] = ffffffff, %l3 = 000000006025bc2d
	lduha	[%i6+0x02c]%asi,%l3	! %l3 = 000000000000ffff

p0_label_309:
!	Mem[0000000030041400] = 0000ffff, %f31 = c5807fff
	lda	[%i1+%g0]0x89,%f31	! %f31 = 0000ffff
!	Mem[0000000010141400] = 2d000000, %l0 = 00000000000000ff
	ldswa	[%i5+%g0]0x88,%l0	! %l0 = 000000002d000000
!	Mem[0000000030141408] = ff000000, %l2 = 00000000ff000000
	ldswa	[%i5+%o4]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010041410] = 00000000, %l3 = 000000000000ffff
	lduba	[%i1+0x012]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = ffffffff d494ff67, %l6 = 00000095, %l7 = 00000000
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 00000000ffffffff 00000000d494ff67
!	Mem[0000000030101410] = 00000000, %f20 = 000003ff
	lda	[%i4+%o5]0x81,%f20	! %f20 = 00000000
!	Mem[0000000010141408] = ff030000, %l4 = ffffffffffffa795
	lduha	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = 6783a828, %l6 = 00000000ffffffff
	ldswa	[%i0+%o5]0x81,%l6	! %l6 = 000000006783a828
!	Mem[0000000030181410] = 000000005e3c5dff, %f16 = 00000000 ffffffff
	ldda	[%i6+%o5]0x89,%f16	! %f16 = 00000000 5e3c5dff
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = ffff7001, %l7 = 00000000d494ff67
	ldstub	[%o2+%g0],%l7		! %l7 = 000000ff000000ff

p0_label_310:
!	%l3 = 0000000000000000, Mem[0000000010141410] = 9500000000000000
	stxa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	%l6 = 6783a828, %l7 = 000000ff, Mem[0000000030081400] = 00005e3c 42f817cc
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 6783a828 000000ff
!	%l3 = 0000000000000000, Mem[0000000030141410] = d494ff67
	stwa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010041408] = ffffa7956025bc2d
	stxa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000000
!	Mem[000000001004143c] = ff0000ff, %l2 = ffffffffff000000, %asi = 80
	swapa	[%i1+0x03c]%asi,%l2	! %l2 = 00000000ff0000ff
!	%f17 = 5e3c5dff, Mem[0000000010141404] = ffffffff
	st	%f17,[%i5+0x004]	! Mem[0000000010141404] = 5e3c5dff
!	%l2 = 00000000ff0000ff, Mem[0000000030181400] = ff0000ffffffffff
	stxa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000ff0000ff
!	Mem[0000000010101413] = ff000000, %l4 = 0000000000000000
	ldstub	[%i4+0x013],%l4		! %l4 = 00000000000000ff
!	Mem[0000000021800001] = fffffa80, %l5 = 0000000000000000
	ldstub	[%o3+0x001],%l5		! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = c5807fff, %l6 = 000000006783a828
	ldsba	[%i0+%o4]0x89,%l6	! %l6 = ffffffffffffffff

p0_label_311:
!	Mem[0000000030141400] = 39307cef, %l6 = ffffffffffffffff
	lduwa	[%i5+%g0]0x89,%l6	! %l6 = 0000000039307cef
!	Mem[00000000201c0000] = ffff826e, %l6 = 0000000039307cef
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[00000000201c0000] = ffff826e, %l1 = ffffffffff5dffff
	lduba	[%o0+0x001]%asi,%l1	! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (62)
!	Mem[0000000010081400] = f927f3d8 00000000 ff0003ff 315d3c5e
!	Mem[0000000010081410] = ff000000 315d3c5e 00000000 e0000000
!	Mem[0000000010081420] = 00000000 000000e0 00000000 7abaad19
!	Mem[0000000010081430] = 00000000 00000000 00000000 000000ff
	ldda	[%i2]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Mem[0000000010041428] = bedae363380ea27e, %f10 = d8f1ffd7 ffffffe3
	ldd	[%i1+0x028],%f10	! %f10 = bedae363 380ea27e
!	Mem[0000000030001400] = ffffffff00000000, %f6  = b64f17cc ef7c3039
	ldda	[%i0+%g0]0x81,%f6 	! %f6  = ffffffff 00000000
!	Mem[0000000010001400] = 700025ff, %l3 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l3	! %l3 = 00000000000025ff
!	Mem[0000000010041400] = ff000000, %l1 = 00000000000000ff
	lduha	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000010181414] = 00000000
	sth	%l7,[%i6+0x014]		! Mem[0000000010181414] = 00ff0000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030041410] = 00007fff
	stwa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000

p0_label_312:
!	%l0 = 000000002d000000, Mem[00000000100c1410] = ffffffff
	stwa	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 2d000000
!	%l0 = 2d000000, %l1 = 00000000, Mem[0000000010181428] = 000000ff ffffffff
	std	%l0,[%i6+0x028]		! Mem[0000000010181428] = 2d000000 00000000
!	%l6 = 000000000000ffff, Mem[00000000100c1427] = 00000000, %asi = 80
	stba	%l6,[%i3+0x027]%asi	! Mem[00000000100c1424] = 000000ff
!	%l4 = 0000000000000000, Mem[00000000300c1408] = 000000ff00000000
	stxa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l0 = 000000002d000000
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f10 = bedae363, Mem[0000000010181424] = 00ff0000
	sta	%f10,[%i6+0x024]%asi	! Mem[0000000010181424] = bedae363
!	%l7 = 00000000000000ff, Mem[00000000218001c0] = ffff37e3
	sth	%l7,[%o3+0x1c0]		! Mem[00000000218001c0] = 00ff37e3
!	%l4 = 0000000000000000, Mem[0000000010101410] = ff0000ff
	stha	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff
!	Mem[00000000100c1408] = cc174fb6, %l2 = 00000000ff0000ff
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 000000cc000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ef670000, %l1 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000ef

p0_label_313:
!	Mem[0000000010081408] = ff0300ff, %l3 = 00000000000025ff
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 00000000ff0300ff
!	Mem[00000000300c1408] = 00000000, %f5  = ffffffff
	lda	[%i3+%o4]0x89,%f5 	! %f5 = 00000000
!	Mem[0000000010101400] = b6000000ff000000, %f0  = 000000b6 5a64ed3f
	ldda	[%i4+%g0]0x88,%f0 	! %f0  = b6000000 ff000000
!	Mem[00000000100c1408] = b64f17ff, %l1 = 00000000000000ef
	lduha	[%i3+%o4]0x88,%l1	! %l1 = 00000000000017ff
!	Mem[0000000010081400] = 00000000d8f327f9, %l7 = 00000000000000ff
	ldxa	[%i2+%g0]0x88,%l7	! %l7 = 00000000d8f327f9
!	Mem[0000000030081410] = 00000000, %l1 = 00000000000017ff
	ldsha	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = ffffffff 0000002d, %l6 = 0000ffff, %l7 = d8f327f9
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 000000000000002d 00000000ffffffff
!	Mem[00000000300c1408] = 0000000000000000, %l6 = 000000000000002d
	ldxa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 2d000000, %f10 = bedae363
	lda	[%i5+%g0]0x88,%f10	! %f10 = 2d000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010101408] = ff000000
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000

p0_label_314:
!	%l5 = 00000000000000ff, Mem[00000000100c1410] = 2d000000ffffffff
	stxa	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000000000ff
!	%f4  = ff0000ff 00000000, Mem[0000000030001400] = ffffffff 00000000
	stda	%f4 ,[%i0+%g0]0x81	! Mem[0000000030001400] = ff0000ff 00000000
!	%l2 = 00000000000000cc, Mem[00000000211c0000] = ffff7001
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 00cc7001
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000010141410] = 00000000 00000000
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 ffffffff
!	Mem[00000000201c0000] = ffff826e, %l0 = 0000000000000000
	ldstub	[%o0+%g0],%l0		! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000030041408] = 974180c5
	stha	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ff80c5
!	%l0 = 00000000000000ff, Mem[0000000010181400] = 00000000
	stha	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000010181430] = 00000000 00000000
	std	%l6,[%i6+0x030]		! Mem[0000000010181430] = 00000000 ffffffff
!	Mem[000000001000143c] = 00000000, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x03c]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ef7c3039, %l7 = 00000000ffffffff
	ldsba	[%i5+%g0]0x81,%l7	! %l7 = ffffffffffffffef

p0_label_315:
!	Mem[0000000010001410] = 0000ef7c, %l7 = ffffffffffffffef
	lduba	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001420] = ff000000700025f9, %f8  = b4e5a795 00000000
	ldda	[%i0+0x020]%asi,%f8 	! %f8  = ff000000 700025f9
!	Mem[0000000030081400] = 6783a828, %f5  = 00000000
	lda	[%i2+%g0]0x89,%f5 	! %f5 = 6783a828
!	Mem[0000000030181408] = ff7f80c5, %l3 = 00000000ff0300ff
	ldsha	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffff80c5
!	Mem[0000000010001420] = ff000000700025f9, %f8  = ff000000 700025f9
	ldda	[%i0+0x020]%asi,%f8 	! %f8  = ff000000 700025f9
!	Mem[00000000300c1400] = 00000000, %l5 = 00000000000000ff
	lduha	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = ff0003ff, %l6 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 00000000ff0003ff
!	Mem[0000000010001408] = ffffffffd494ff67, %l3 = ffffffffffff80c5
	ldxa	[%i0+%o4]0x80,%l3	! %l3 = ffffffffd494ff67
!	Mem[0000000010141408] = 000003ff, %f4  = ff0000ff
	lda	[%i5+%o4]0x80,%f4 	! %f4 = 000003ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ffff0000, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l4	! %l4 = 00000000ffff0000

p0_label_316:
!	Mem[0000000010181420] = ff000000bedae363, %l0 = 0000000000000000, %l0 = 0000000000000000
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l0,%l0	! %l0 = ff000000bedae363
!	%l6 = ff0003ff, %l7 = 00000000, Mem[0000000030041410] = 000000ff f927f3d8
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = ff0003ff 00000000
!	%l1 = 0000000000000000, Mem[0000000030181408] = c5807fff
	stha	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 00007fff
!	%l2 = 00000000000000cc, Mem[00000000100c1408] = ff174fb62d000000
	stx	%l2,[%i3+%o4]		! Mem[00000000100c1408] = 00000000000000cc
!	%f6  = ffffffff 00000000, Mem[00000000300c1410] = 00000000 00003fed
	stda	%f6 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffff 00000000
!	%l0 = bedae363, %l1 = 00000000, Mem[00000000100c1400] = a795b51a 5a64ed3f
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = bedae363 00000000
!	%f28 = 00000000, %f26 = 19adba7a
	fcmpes	%fcc3,%f28,%f26		! %fcc3 = 1
!	Mem[0000000030141408] = 000000ff, %l2 = 00000000000000cc
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010001410] = 7cef0000
	stwa	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ef7c3039, %f31 = 00000000
	lda	[%i5+%g0]0x81,%f31	! %f31 = ef7c3039

p0_label_317:
!	Mem[0000000010041400] = 000000ff, %l5 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000ff0003ff
	ldsha	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1428] = d8f1ffd7ffffffe3, %f10 = 2d000000 380ea27e
	ldd	[%i3+0x028],%f10	! %f10 = d8f1ffd7 ffffffe3
!	Mem[00000000218001c0] = 00ff37e3, %l2 = 00000000000000ff
	ldub	[%o3+0x1c0],%l2		! %l2 = 0000000000000000
!	Mem[0000000010181418] = 00000000d9a75e00, %l3 = ffffffffd494ff67, %l0 = ff000000bedae363
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = 00000000d9a75e00
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000000
	lduha	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = 00000000 ff0000ff, %l0 = d9a75e00, %l1 = 00000000
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 00000000ff0000ff 0000000000000000
!	Mem[00000000201c0000] = ffff826e, %l1 = 0000000000000000
	ldub	[%o0+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030081410] = 00000000700025f9, %l7 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l7	! %l7 = 00000000700025f9
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 d8f327f9, %f4  = 000003ff 6783a828
	fxtod	%f16,%f4 		! %f4  = 41eb1e64 ff200000

p0_label_318:
!	Mem[0000000010001410] = 00000000, %l3 = ffffffffd494ff67
	ldstuba	[%i0+0x010]%asi,%l3	! %l3 = 00000000000000ff
!	%f24 = e0000000 00000000, Mem[0000000010181400] = ff000000 0ff7373e
	stda	%f24,[%i6+%g0]0x80	! Mem[0000000010181400] = e0000000 00000000
!	%f21 = 000000ff, Mem[0000000010001430] = e0000000
	sta	%f21,[%i0+0x030]%asi	! Mem[0000000010001430] = 000000ff
!	%f0  = b6000000 ff000000 1183ffff ffffffff
!	%f4  = 41eb1e64 ff200000 ffffffff 00000000
!	%f8  = ff000000 700025f9 d8f1ffd7 ffffffe3
!	%f12 = fffeb51a fffeb51a 000000ff ff800000
	stda	%f0,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	%f24 = e0000000 00000000, Mem[0000000030101410] = 00000000 00000000
	stda	%f24,[%i4+%o5]0x81	! Mem[0000000030101410] = e0000000 00000000
!	%l3 = 0000000000000000, Mem[0000000020800040] = 00ffcbdb
	stb	%l3,[%o1+0x040]		! Mem[0000000020800040] = 00ffcbdb
!	%f16 = 00000000, Mem[0000000010041408] = 00000000
	sta	%f16,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%f26 = 19adba7a, %f26 = 19adba7a
	fsqrts	%f26,%f26		! %f26 = 2c951f1e
!	%l4 = ffff0000, %l5 = 00000000, Mem[0000000010181418] = ffffffff 00000000
	stda	%l4,[%i6+0x018]%asi	! Mem[0000000010181418] = ffff0000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff0003ff, %l7 = 00000000700025f9
	ldsha	[%i1+%o5]0x89,%l7	! %l7 = 00000000000003ff

p0_label_319:
!	Mem[0000000020800000] = ffff8ed8, %l3 = 0000000000000000
	ldub	[%o1+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l3 = 00000000000000ff
	lduha	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	%l7 = 00000000000003ff, imm = 00000000000008ec, %l2 = 0000000000000000
	addc	%l7,0x8ec,%l2		! %l2 = 0000000000000ceb
	membar	#Sync			! Added by membar checker (63)
!	Mem[0000000010181410] = 641eeb41, %l4 = 00000000ffff0000
	lduwa	[%i6+%o5]0x88,%l4	! %l4 = 00000000641eeb41
!	Mem[0000000030181410] = ff5d3c5e00000000, %l2 = 0000000000000ceb
	ldxa	[%i6+%o5]0x81,%l2	! %l2 = ff5d3c5e00000000
!	Mem[0000000010041410] = 00000000 00000095, %l0 = ff0000ff, %l1 = 000000ff
	ldd	[%i1+%o5],%l0		! %l0 = 0000000000000000 0000000000000095
!	Mem[0000000010081408] = ff0300ff, %l2 = ff5d3c5e00000000
	lduba	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081420] = 00000000, %l1 = 0000000000000095
	lduw	[%i2+0x020],%l1		! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f21 = 000000ff, Mem[0000000010141408] = 000003ff
	sta	%f21,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff

p0_label_320:
!	%l2 = 00000000000000ff, Mem[0000000030101408] = 0000ff5d
	stwa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	%l4 = 00000000641eeb41, Mem[0000000030001408] = ff7f80c500000000
	stxa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000641eeb41
!	Mem[0000000020800001] = ffff8ed8, %l2 = 00000000000000ff
	ldstub	[%o1+0x001],%l2		! %l2 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 000003ff, Mem[0000000010101408] = 00000000 ffffffff
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 000003ff
!	%l0 = 0000000000000000, Mem[0000000010181410] = 41eb1e64
	stba	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00eb1e64
!	%f26 = 2c951f1e, Mem[0000000010141408] = ff000000
	sta	%f26,[%i5+%o4]0x88	! Mem[0000000010141408] = 2c951f1e
!	%f20 = 5e3c5d31 000000ff, %l6 = 0000000000000000
!	Mem[00000000100c1430] = fffeb51afffeb51a
	add	%i3,0x030,%g1
	stda	%f20,[%g1+%l6]ASI_PST32_P ! Mem[00000000100c1430] = fffeb51afffeb51a
!	%l3 = 0000000000000000, Mem[0000000010001408] = ffffffff
	stwa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Mem[0000000010101410] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffff8ed8, %l3 = 0000000000000000
	ldsha	[%o1+0x000]%asi,%l3	! %l3 = ffffffffffffffff

p0_label_321:
!	Mem[0000000030181410] = 5e3c5dff, %l5 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l5	! %l5 = 000000005e3c5dff
!	Mem[0000000021800140] = ff001f70, %l7 = 00000000000003ff
	ldub	[%o3+0x140],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010081408] = 5e3c5d31 ff0300ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000ff0300ff 000000005e3c5d31
!	Mem[0000000030141400] = 39307cef, %l4 = 00000000641eeb41
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ef
!	Mem[0000000030141410] = 00000000, %f13 = fffeb51a
	lda	[%i5+%o5]0x89,%f13	! %f13 = 00000000
!	Mem[0000000030141400] = ef7c3039, %l6 = 0000000000000000
	ldswa	[%i5+%g0]0x81,%l6	! %l6 = ffffffffef7c3039
!	Mem[0000000021800000] = fffffa80, %l7 = 00000000000000ff
	ldub	[%o3+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030101410] = 000000e0, %l4 = 00000000000000ef
	lduwa	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000e0
!	Mem[0000000010141400] = 0000002d, %l4 = 00000000000000e0
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 d8f327f9 5e3c5d31 ff0300ff
!	%f20 = 5e3c5d31 000000ff 000000e0 00000000
!	%f24 = e0000000 00000000 2c951f1e 00000000
!	%f28 = 00000000 00000000 ff000000 ef7c3039
	stda	%f16,[%i3]ASI_BLK_AIUSL	! Block Store to 00000000300c1400

p0_label_322:
!	%l0 = 00000000ff0300ff, Mem[0000000010041430] = a775ccae
	stw	%l0,[%i1+0x030]		! Mem[0000000010041430] = ff0300ff
!	Mem[0000000010041400] = ff000000, %l0 = 00000000ff0300ff
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 00000000ff000000
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000010081410] = 000000ff 5e3c5d31
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff ffffffff
!	%l7 = 00000000000000ff, Mem[000000001010141c] = c580bbff
	sth	%l7,[%i4+0x01c]		! Mem[000000001010141c] = 00ffbbff
!	Mem[0000000030101408] = ff000000, %l2 = 00000000000000ff
	lduha	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l5 = 000000005e3c5dff, Mem[00000000100c1400] = bedae363
	stba	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffdae363
!	%l2 = 0000000000000000, Mem[000000001018143c] = ff800000
	stw	%l2,[%i6+0x03c]		! Mem[000000001018143c] = 00000000
!	%l7 = 00000000000000ff, Mem[00000000100c1408] = cc00000000000000
	stxa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000000000ff
!	Mem[0000000030001410] = 6783a828, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l4	! %l4 = 000000006783a828
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = f925007000000000, %l4 = 000000006783a828
	ldxa	[%i2+%o5]0x89,%l4	! %l4 = f925007000000000

p0_label_323:
!	Mem[0000000030081410] = 00000000, %f4  = 41eb1e64
	lda	[%i2+%o5]0x89,%f4 	! %f4 = 00000000
!	Mem[0000000010001400] = ff250070, %f8  = ff000000
	lda	[%i0+%g0]0x80,%f8 	! %f8 = ff250070
!	Mem[0000000030001410] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 00000000700025f9, %l2 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l2	! %l2 = 00000000700025f9
!	Mem[0000000030081410] = 00000000700025f9, %l3 = ffffffffffffffff
	ldxa	[%i2+%o5]0x81,%l3	! %l3 = 00000000700025f9
!	Mem[0000000010041408] = 00000000, %l4 = f925007000000000
	lduw	[%i1+%o4],%l4		! %l4 = 0000000000000000
!	Mem[0000000010181428] = d8f1ffd7ffffffe3, %l4 = 0000000000000000
	ldx	[%i6+0x028],%l4		! %l4 = d8f1ffd7ffffffe3
!	Mem[0000000010041400] = ff0003ff 4c00ffff, %l4 = ffffffe3, %l5 = 5e3c5dff
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 00000000ff0003ff 000000004c00ffff
!	Mem[000000001014140c] = 00000000, %l1 = 000000005e3c5d31
	ldub	[%i5+0x00d],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f11 = ffffffe3, Mem[0000000010041408] = 00000000
	sta	%f11,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffe3

p0_label_324:
!	%l4 = 00000000ff0003ff, Mem[0000000030041410] = ff0300ff
	stba	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = ff0300ff
!	%l6 = ffffffffef7c3039, Mem[0000000030181408] = ff7f0000
	stwa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = ef7c3039
!	%f14 = 000000ff ff800000, Mem[0000000010141400] = 2d000000 ff5d3c5e
	stda	%f14,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff ff800000
	membar	#Sync			! Added by membar checker (64)
!	Mem[00000000300c1400] = d8f327f9, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l7	! %l7 = 00000000d8f327f9
!	Mem[0000000010101427] = f0000000, %l3 = 00000000700025f9
	ldstub	[%i4+0x027],%l3		! %l3 = 00000000000000ff
!	%l6 = ffffffffef7c3039, Mem[0000000030001400] = 00000000ff0000ff
	stxa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffffef7c3039
!	%l6 = ffffffffef7c3039, Mem[0000000010001432] = 000000ff, %asi = 80
	stha	%l6,[%i0+0x032]%asi	! Mem[0000000010001430] = 00003039
!	Mem[0000000010041430] = ff0300ff, %l3 = 0000000000000000
	swap	[%i1+0x030],%l3		! %l3 = 00000000ff0300ff
!	%l1 = 0000000000000000, Mem[0000000010041410] = 9500000000000000
	stxa	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = cc000000, %l7 = 00000000d8f327f9
	lduha	[%i5+%o4]0x81,%l7	! %l7 = 000000000000cc00

p0_label_325:
!	Mem[0000000010181400] = 000000ff 000000b6, %l0 = ff000000, %l1 = 00000000
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000b6 00000000000000ff
!	Mem[00000000201c0000] = ffff826e, %l2 = 00000000700025f9
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1420] = b4e5a795, %l7 = 000000000000cc00
	ldsw	[%i3+0x020],%l7		! %l7 = ffffffffb4e5a795
!	Mem[00000000300c1400] = 00000000, %l1 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = 67ff94d400000000, %l6 = ffffffffef7c3039
	ldxa	[%i0+%o4]0x88,%l6	! %l6 = 67ff94d400000000
!	Mem[0000000010101408] = 00000000, %l5 = 000000004c00ffff
	ldsba	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = ff250070 ffffffff, %l2 = 000000ff, %l3 = ff0300ff
	ldd	[%i0+%g0],%l2		! %l2 = 00000000ff250070 00000000ffffffff
!	Mem[0000000030001410] = 00000000 00000000, %l4 = ff0003ff, %l5 = 00000000
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%f14 = 000000ff ff800000, %l1 = 0000000000000000
!	Mem[0000000010181420] = ff000000700025f9
	add	%i6,0x020,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010181420] = ff000000700025f9

p0_label_326:
!	%l7 = ffffffffb4e5a795, Mem[0000000010141430] = 000067ff
	stw	%l7,[%i5+0x030]		! Mem[0000000010141430] = b4e5a795
!	Mem[0000000021800100] = e5ff4cdd, %l0 = 00000000000000b6
	ldstuba	[%o3+0x100]%asi,%l0	! %l0 = 000000e5000000ff
!	%l4 = 0000000000000000, Mem[00000000100c1410] = ff00000000000000
	stxa	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000000
!	Mem[0000000010141400] = 000080ff, %l5 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 00000000000080ff
!	%l5 = 00000000000080ff, Mem[00000000100c1410] = 0000000000000000
	stxa	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000000080ff
!	%l0 = 00000000000000e5, Mem[0000000010081410] = ffffffff000000ff
	stxa	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000000000e5
!	%l4 = 0000000000000000, Mem[00000000100c1408] = ff000000
	stwa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010041434] = a404cce3, %l3 = 00000000ffffffff, %asi = 80
	swapa	[%i1+0x034]%asi,%l3	! %l3 = 00000000a404cce3
!	%l2 = 00000000ff250070, Mem[0000000010181408] = 1183ffff
	stha	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 0070ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l2 = 00000000ff250070
	ldsha	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_327:
!	Mem[0000000021800080] = 28ff944f, %l7 = ffffffffb4e5a795
	ldsba	[%o3+0x080]%asi,%l7	! %l7 = 0000000000000028
!	Mem[0000000030141408] = 000000cc, %l5 = 00000000000080ff
	ldswa	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000cc
!	Mem[0000000030181408] = ef7c3039, %l7 = 0000000000000028
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000039
!	Mem[0000000030001400] = ffffffffef7c3039, %l1 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l1	! %l1 = ffffffffef7c3039
!	Mem[0000000030101408] = ff000000, %l5 = 00000000000000cc
	lduha	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = f927f3d8, %l4 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000f9
!	Mem[0000000030001410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l0 = 00000000000000e5
	lduha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (65)
!	Mem[0000000030001400] = 39307cef ffffffff 00000000 641eeb41
!	Mem[0000000030001410] = 00000000 00000000 ffbb80c5 700025f9
!	Mem[0000000030001420] = 000000f0 000000ff 00000000 0c377fa2
!	Mem[0000000030001430] = b64f17cc 4cc17a8d ffff7018 a0000000
	ldda	[%i0]ASI_BLK_AIUS,%f0	! Block Load from 0000000030001400
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000039, Mem[00000000300c1400] = 00000000
	stha	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000039

p0_label_328:
!	Mem[0000000021800000] = fffffa80, %l2 = 0000000000000000
	ldstuba	[%o3+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%f31 = ef7c3039, Mem[0000000030081400] = 28a88367
	sta	%f31,[%i2+%g0]0x81	! Mem[0000000030081400] = ef7c3039
!	%l7 = 0000000000000039, Mem[0000000030041400] = 0000000000000000
	stxa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000039
!	Mem[0000000030081400] = 39307cef, %l4 = 00000000000000f9
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 0000000039307cef
!	%f22 = 000000e0, Mem[0000000010141428] = 3fed645a
	st	%f22,[%i5+0x028]	! Mem[0000000010141428] = 000000e0
!	%l4 = 39307cef, %l5 = 00000000, Mem[0000000030101408] = 000000ff 00000000
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 39307cef 00000000
!	Code Fragment 3
p0_fragment_23:
!	%l0 = 0000000000000000
	setx	0x5b65ba2fa6445b7c,%g7,%l0 ! %l0 = 5b65ba2fa6445b7c
!	%l1 = ffffffffef7c3039
	setx	0x898c71c805612652,%g7,%l1 ! %l1 = 898c71c805612652
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5b65ba2fa6445b7c
	setx	0x13eeb11066336d3e,%g7,%l0 ! %l0 = 13eeb11066336d3e
!	%l1 = 898c71c805612652
	setx	0xc170355fea366caf,%g7,%l1 ! %l1 = c170355fea366caf
!	Mem[0000000010001400] = ff250070, %l0 = 13eeb11066336d3e
	ldstub	[%i0+%g0],%l0		! %l0 = 000000ff000000ff
!	%l1 = c170355fea366caf, Mem[0000000010141400] = 00000000
	stwa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = ea366caf
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l0 = 00000000000000ff
	ldsha	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_329:
!	Mem[0000000010041408] = ffffffe3, %l3 = 00000000a404cce3
	lduw	[%i1+%o4],%l3		! %l3 = 00000000ffffffe3
!	Mem[0000000021800100] = ffff4cdd, %l5 = 0000000000000000
	ldsb	[%o3+0x100],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000300c1400] = 00000039, %f16 = 00000000
	lda	[%i3+%g0]0x89,%f16	! %f16 = 00000039
!	Mem[0000000010101410] = ff0000ff, %l2 = 00000000000000ff
	ldsha	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l6 = 67ff94d400000000
	lduwa	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800180] = 2affac10, %l5 = ffffffffffffffff
	ldsb	[%o3+0x181],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000100c1400] = ffdae363, %l7 = 0000000000000039
	lduwa	[%i3+%g0]0x80,%l7	! %l7 = 00000000ffdae363
!	Mem[0000000030101400] = ef670000, %l5 = ffffffffffffffff
	lduba	[%i4+%g0]0x81,%l5	! %l5 = 00000000000000ef
!	Mem[0000000010041408] = e3ffffff, %l5 = 00000000000000ef
	lduha	[%i1+%o4]0x88,%l5	! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = ff0300ff, %l1 = c170355fea366caf
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 00000000ff0300ff

p0_label_330:
!	Mem[0000000010081410] = 000000e5, %l6 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l6	! %l6 = 000000e5000000ff
!	%f0  = 39307cef ffffffff, Mem[0000000030101410] = e0000000 00000000
	stda	%f0 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 39307cef ffffffff
!	Mem[0000000010141418] = f927f3d8, %l3 = 00000000ffffffe3, %asi = 80
	swapa	[%i5+0x018]%asi,%l3	! %l3 = 00000000f927f3d8
!	%f7  = 700025f9, %f0  = 39307cef, %f20 = 5e3c5d31 000000ff
	fsmuld	%f7 ,%f0 ,%f20		! %f20 = 45361629 4e03ddc0
	membar	#Sync			! Added by membar checker (66)
!	%l6 = 00000000000000e5, Mem[0000000030001410] = 00000000
	stha	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00e50000
!	%l3 = 00000000f927f3d8, Mem[0000000010081410] = ff000000
	stha	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = f3d80000
!	%l0 = 0000000000000000, Mem[0000000010101400] = 000000ff
	stwa	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l7 = 00000000ffdae363, Mem[0000000010181400] = 000000b6
	stha	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000e363
!	%l7 = 00000000ffdae363, Mem[00000000201c0000] = ffff826e
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 63ff826e
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 0000000000000000, %f12 = b64f17cc 4cc17a8d
	ldda	[%i1+%o5]0x80,%f12	! %f12 = 00000000 00000000

p0_label_331:
!	Mem[0000000010101410] = ff0000ff, %l7 = 00000000ffdae363
	lduw	[%i4+%o5],%l7		! %l7 = 00000000ff0000ff
!	Mem[00000000300c1408] = ff0003ff315d3c5e, %l4 = 0000000039307cef
	ldxa	[%i3+%o4]0x81,%l4	! %l4 = ff0003ff315d3c5e
!	Mem[0000000030101410] = 39307cef, %l7 = 00000000ff0000ff
	ldsba	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000039
!	Mem[0000000010081410] = 000000000000d8f3, %l1 = 00000000ff0300ff
	ldxa	[%i2+%o5]0x88,%l1	! %l1 = 000000000000d8f3
!	Mem[0000000030041410] = ea366caf00000000, %f14 = ffff7018 a0000000
	ldda	[%i1+%o5]0x81,%f14	! %f14 = ea366caf 00000000
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001430] = 00003039, %l7 = 0000000000000039
	ldsha	[%i0+0x032]%asi,%l7	! %l7 = 0000000000003039
	membar	#Sync			! Added by membar checker (67)
!	Mem[0000000010081400] = f927f3d8 00000000 ff0003ff 315d3c5e
!	Mem[0000000010081410] = f3d80000 00000000 00000000 e0000000
!	Mem[0000000010081420] = 00000000 000000e0 00000000 7abaad19
!	Mem[0000000010081430] = 00000000 00000000 00000000 000000ff
	ldda	[%i2]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Mem[0000000010001400] = ff250070 ffffffff 00000000 d494ff67
!	Mem[0000000010001410] = ff000000 000000e0 ff7f0000 ffff0000
!	Mem[0000000010001420] = ff000000 700025f9 f9250070 c580bbff
!	Mem[0000000010001430] = 00003039 d494ff67 00000000 000000ff
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (68)
!	%l5 = 000000000000ffff, Mem[000000001008141a] = 00000000, %asi = 80
	stba	%l5,[%i2+0x01a]%asi	! Mem[0000000010081418] = 0000ff00

p0_label_332:
!	%l3 = 00000000f927f3d8, Mem[0000000010141400] = ea366caf
	stwa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = f927f3d8
!	%f6  = ff7f0000, Mem[0000000010101408] = 00000000
	sta	%f6 ,[%i4+%o4]0x80	! Mem[0000000010101408] = ff7f0000
!	%l6 = 00000000000000e5, immd = fffffffffffff663, %l7 = 0000000000003039
	sdivx	%l6,-0x99d,%l7		! %l7 = 0000000000000000
!	%l2 = 00000000000000ff, Mem[0000000010001410] = 000000ff
	stha	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff
!	%l5 = 000000000000ffff, Mem[000000001014143c] = cc174fff, %asi = 80
	stwa	%l5,[%i5+0x03c]%asi	! Mem[000000001014143c] = 0000ffff
!	%l1 = 000000000000d8f3, Mem[0000000030101410] = ef7c3039
	stha	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = ef7cd8f3
!	%f12 = 00003039 d494ff67, Mem[0000000010081430] = 00000000 00000000
	std	%f12,[%i2+0x030]	! Mem[0000000010081430] = 00003039 d494ff67
!	Mem[0000000010181420] = ff000000700025f9, %l5 = 000000000000ffff, %l7 = 0000000000000000
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = ff000000700025f9
!	Mem[0000000030181408] = ef7c3039, %l1 = 000000000000d8f3
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 00000000ef7c3039
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = c580ff00, %l3 = 00000000f927f3d8
	ldsba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000

p0_label_333:
!	Mem[0000000010101410] = ff0000ff, %l4 = ff0003ff315d3c5e
	ldswa	[%i4+0x010]%asi,%l4	! %l4 = ffffffffff0000ff
!	Mem[0000000030081400] = f9000000, %f26 = 19adba7a
	lda	[%i2+%g0]0x81,%f26	! %f26 = f9000000
!	Mem[000000001000141c] = ffff0000, %l4 = ffffffffff0000ff
	lduha	[%i0+0x01e]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = 1e1f952c00000000, %l5 = 000000000000ffff
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = 1e1f952c00000000
!	Mem[0000000030001400] = ef7c3039, %f18 = 5e3c5d31
	lda	[%i0+%g0]0x89,%f18	! %f18 = ef7c3039
!	Mem[0000000010101410] = ff0000ff, %l4 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041400] = ff0003ff 4c00ffff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff0003ff 000000004c00ffff
!	Mem[0000000010101410] = ff0000ff, %f2  = 00000000
	lda	[%i4+%o5]0x80,%f2 	! %f2 = ff0000ff
!	Mem[0000000030081408] = ffffffff, %l7 = ff000000700025f9
	lduwa	[%i2+%o4]0x81,%l7	! %l7 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%f15 = 000000ff, Mem[0000000010001408] = 00000000
	sta	%f15,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff

p0_label_334:
!	Mem[0000000030081400] = 000000f9, %l3 = 000000004c00ffff
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 000000f9000000ff
!	%l7 = 00000000ffffffff, Mem[0000000010081410] = 0000d8f3
	stwa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffff
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000010081400] = f927f3d8 00000000
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff 00000000
!	%l7 = 00000000ffffffff, Mem[0000000020800040] = 00ffcbdb, %asi = 80
	stba	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = ffffcbdb
!	Mem[0000000010141420] = b4e5a795, %l3 = 00000000000000f9
	swap	[%i5+0x020],%l3		! %l3 = 00000000b4e5a795
!	%f12 = 00003039 d494ff67, Mem[0000000030081410] = 00000000 f9250070
	stda	%f12,[%i2+%o5]0x89	! Mem[0000000030081410] = 00003039 d494ff67
!	Mem[0000000021800100] = ffff4cdd, %l1 = 00000000ef7c3039
	ldstub	[%o3+0x100],%l1		! %l1 = 000000ff000000ff
!	%l2 = ff0003ff, %l3 = b4e5a795, Mem[0000000010001410] = 000000ff e0000000
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = ff0003ff b4e5a795
!	%l4 = ffffffffffffffff, Mem[0000000030141408] = cc000000
	stwa	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffffffe3, %l3 = 00000000b4e5a795
	ldswa	[%i1+0x008]%asi,%l3	! %l3 = ffffffffffffffe3

p0_label_335:
!	Mem[0000000010181408] = 0070ffff, %l4 = ffffffffffffffff
	ldsb	[%i6+0x00b],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030041400] = 00000000 00000039 00ff80c5 000000ff
!	Mem[0000000030041410] = ea366caf 00000000 f9250070 c580bbff
!	Mem[0000000030041420] = ff000000 f0000000 a27f370c 00000000
!	Mem[0000000030041430] = 8d7ac14c cc174fb6 000000a0 1870ffff
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000010001400] = ff250070, %l0 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 00000000ff250070
!	Mem[0000000010001410] = b4e5a795ff0003ff, %f8  = ff000000 700025f9
	ldda	[%i0+%o5]0x88,%f8 	! %f8  = b4e5a795 ff0003ff
!	Mem[0000000020800040] = ffffcbdb, %l3 = ffffffffffffffe3
	ldsb	[%o1+0x041],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010141410] = ffffffff00000000, %l1 = 00000000000000ff
	ldxa	[%i5+%o5]0x88,%l1	! %l1 = ffffffff00000000
!	Mem[0000000010041410] = 0000000000000000, %l6 = 00000000000000e5
	ldxa	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = ff000000315d3c5e, %l5 = 1e1f952c00000000
	ldxa	[%i3+%o5]0x81,%l5	! %l5 = ff000000315d3c5e
!	Mem[00000000100c1400] = 63e3daff, %l4 = ffffffffffffffff
	ldsha	[%i3+%g0]0x88,%l4	! %l4 = ffffffffffffdaff
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffdaff, Mem[0000000030181410] = 000000005e3c5dff
	stxa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffffffffdaff

p0_label_336:
	membar	#Sync			! Added by membar checker (69)
!	%l6 = 0000000000000000, Mem[0000000030041400] = 00000000
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%l3 = ffffffffffffffff, Mem[00000000100c1408] = 00000000
	stwa	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffff
!	%f13 = d494ff67, Mem[0000000030001400] = ef7c3039
	sta	%f13,[%i0+%g0]0x89	! Mem[0000000030001400] = d494ff67
!	Mem[0000000010101438] = 7cef00a01870ffff, %l7 = 00000000ffffffff, %l3 = ffffffffffffffff
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l7,%l3	! %l3 = 7cef00a01870ffff
!	Mem[0000000010001400] = ff250070, %l6 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	%l1 = ffffffff00000000, Mem[0000000030101400] = 000067ef
	stwa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%l0 = 00000000ff250070, Mem[0000000030141408] = ffffffff00000000
	stxa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000ff250070
!	%l5 = ff000000315d3c5e, Mem[0000000030041400] = 00000000
	stwa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 315d3c5e
!	Mem[00000000300c1410] = ff000000, %l5 = ff000000315d3c5e
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ffffffff ffffdaff, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 00000000ffffdaff 00000000ffffffff

p0_label_337:
!	Mem[0000000010181410] = 641eeb00, %l2 = 00000000ff0003ff
	lduba	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = ff7f0000, %l0 = 00000000ff250070
	ldsha	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffffff7f
!	Mem[0000000010181410] = 00eb1e64 ff200000, %l0 = ffffff7f, %l1 = 00000000
	ldd	[%i6+%o5],%l0		! %l0 = 0000000000eb1e64 00000000ff200000
!	Mem[0000000010081418] = 0000ff00 e0000000, %l6 = ffffdaff, %l7 = ffffffff
	ldda	[%i2+0x018]%asi,%l6	! %l6 = 000000000000ff00 00000000e0000000
!	Mem[0000000021800080] = 28ff944f, %l5 = 00000000000000ff
	ldsha	[%o3+0x080]%asi,%l5	! %l5 = 00000000000028ff
!	Mem[00000000100c1408] = ffffffff, %l3 = 7cef00a01870ffff
	lduba	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101400] = 0000000000000000, %f20 = ea366caf 00000000
	ldda	[%i4+%g0]0x81,%f20	! %f20 = 00000000 00000000
!	Mem[00000000300c1408] = ff0003ff, %l3 = 00000000000000ff
	ldsba	[%i3+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081400] = 000000ff, %f26 = a27f370c
	lda	[%i2+%g0]0x89,%f26	! %f26 = 000000ff
!	Starting 10 instruction Store Burst
!	%f18 = 00ff80c5 000000ff, Mem[0000000030181410] = ffdaffff ffffffff
	stda	%f18,[%i6+%o5]0x81	! Mem[0000000030181410] = 00ff80c5 000000ff

p0_label_338:
!	%l4 = ffffffffffffdaff, %l3 = ffffffffffffffff, %y  = 000000ac
	umul	%l4,%l3,%l5		! %l5 = ffffdafe00002501, %y = ffffdafe
!	Mem[0000000010041410] = 00000000, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 5e3c5d31, %l1 = 00000000ff200000
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 000000005e3c5d31
!	%l5 = ffffdafe00002501, Mem[0000000010041400] = ff0003ff
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 250103ff
!	%f10 = f9250070, Mem[0000000030081410] = d494ff67
	sta	%f10,[%i2+%o5]0x89	! Mem[0000000030081410] = f9250070
!	%f2  = ff0000ff, Mem[0000000010001400] = 700025ff
	sta	%f2 ,[%i0+%g0]0x88	! Mem[0000000010001400] = ff0000ff
!	Mem[0000000021800100] = ffff4cdd, %l6 = 000000000000ff00
	ldstuba	[%o3+0x100]%asi,%l6	! %l6 = 000000ff000000ff
!	%l1 = 000000005e3c5d31, Mem[0000000030181400] = 00000000
	stba	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 31000000
!	%l7 = 00000000e0000000, Mem[00000000201c0000] = 63ff826e
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 0000826e
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ffffffff, %l2 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffffff

p0_label_339:
!	Mem[0000000010101418] = f9250070, %l1 = 000000005e3c5d31
	ldsha	[%i4+0x018]%asi,%l1	! %l1 = fffffffffffff925
!	%l5 = ffffdafe00002501, %l0 = 0000000000eb1e64, %l3 = ffffffffffffffff
	subc	%l5,%l0,%l3		! %l3 = ffffdafdff15069d
!	Mem[0000000010181408] = 0070ffff, %l4 = ffffffffffffdaff
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = 000000000070ffff
!	Mem[0000000010081414] = 00000000, %f31 = 1870ffff
	ld	[%i2+0x014],%f31	! %f31 = 00000000
!	Mem[0000000010101400] = 00000000000000b6, %l7 = 00000000e0000000
	ldxa	[%i4+%g0]0x80,%l7	! %l7 = 00000000000000b6
!	Mem[0000000010141420] = 000000f90000ff00, %l4 = 000000000070ffff
	ldx	[%i5+0x020],%l4		! %l4 = 000000f90000ff00
!	Mem[0000000010081410] = ffffffff, %l1 = fffffffffffff925
	lduwa	[%i2+%o5]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030181410] = c580ff00, %l4 = 000000f90000ff00
	ldswa	[%i6+%o5]0x89,%l4	! %l4 = ffffffffc580ff00
!	Mem[0000000010081410] = ffffffff, %f15 = 000000ff
	lda	[%i2+%o5]0x80,%f15	! %f15 = ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000021800000] = fffffa80, %l0 = 0000000000eb1e64
	ldstuba	[%o3+0x000]%asi,%l0	! %l0 = 000000ff000000ff

p0_label_340:
!	%l2 = ffffffffffffffff, %l7 = 00000000000000b6, %l4 = ffffffffc580ff00
	and	%l2,%l7,%l4		! %l4 = 00000000000000b6
!	%l7 = 00000000000000b6, Mem[00000000100c1410] = 000080ff
	stha	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000b6
!	Mem[00000000100c1430] = fffeb51afffeb51a, %l1 = 00000000ffffffff, %l7 = 00000000000000b6
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = fffeb51afffeb51a
!	%l6 = 000000ff, %l7 = fffeb51a, Mem[0000000030181408] = 0000d8f3 7cef0000
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff fffeb51a
!	%l3 = ffffdafdff15069d, Mem[0000000010081410] = 00000000ffffffff
	stxa	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffdafdff15069d
!	Mem[0000000010181400] = 63e30000, %l5 = ffffdafe00002501
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000063000000ff
!	Mem[0000000010041408] = ffffffe3, %l6 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%l3 = ffffdafdff15069d, Mem[0000000030001400] = 67ff94d4
	stwa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = ff15069d
!	%l3 = ffffdafdff15069d, Mem[0000000010101400] = 00000000
	stba	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000009d
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = ff000000 f00000ff, %l4 = 000000b6, %l5 = 00000063
	ldda	[%i4+0x020]%asi,%l4	! %l4 = 00000000ff000000 00000000f00000ff

p0_label_341:
!	Mem[0000000020800040] = ffffcbdb, %l2 = ffffffffffffffff
	ldsba	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081410] = f9250070, %l7 = fffeb51afffeb51a
	ldswa	[%i2+%o5]0x89,%l7	! %l7 = fffffffff9250070
!	Mem[0000000010081400] = ffffffff, %l4 = 00000000ff000000
	ldsba	[%i2+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041408] = ffffffe300000000, %l0 = 00000000000000ff
	ldxa	[%i1+%o4]0x80,%l0	! %l0 = ffffffe300000000
!	Mem[0000000010041408] = e3ffffff, %f14 = 00000000
	lda	[%i1+%o4]0x88,%f14	! %f14 = e3ffffff
!	Mem[0000000010001410] = ff0300ff, %l4 = ffffffffffffffff
	lduwa	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff0300ff
!	Mem[0000000030081408] = ffffffff, %l2 = ffffffffffffffff
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = ff0300ff95a7e5b4, %f14 = e3ffffff ffffffff
	ldda	[%i0+%o5]0x80,%f14	! %f14 = ff0300ff 95a7e5b4
!	Mem[000000001000143c] = 000000ff, %l0 = ffffffe300000000
	lduh	[%i0+0x03c],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001004141c] = 000000ff, %l1 = 00000000ffffffff, %asi = 80
	swapa	[%i1+0x01c]%asi,%l1	! %l1 = 00000000000000ff

p0_label_342:
!	%l0 = 0000000000000000, Mem[0000000030181408] = 000000ff
	stba	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%l2 = 00000000000000ff, Mem[0000000030181410] = ff000000c580ff00
	stxa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000000ff
!	%f30 = 000000a0 00000000, Mem[0000000010041430] = 00000000 ffffffff
	std	%f30,[%i1+0x030]	! Mem[0000000010041430] = 000000a0 00000000
!	%f10 = f9250070 c580bbff, Mem[00000000100c1400] = ffdae363 00000000
	stda	%f10,[%i3+0x000]%asi	! Mem[00000000100c1400] = f9250070 c580bbff
!	%l6 = 000000ff, %l7 = f9250070, Mem[0000000010141428] = 000000e0 b6000000
	std	%l6,[%i5+0x028]		! Mem[0000000010141428] = 000000ff f9250070
!	Mem[0000000010001410] = ff0300ff95a7e5b4, %l7 = fffffffff9250070, %l7 = fffffffff9250070
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = ff0300ff95a7e5b4
!	%l0 = 0000000000000000, Mem[0000000010101408] = 00007fff
	stba	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00007f00
!	%f18 = 00ff80c5 000000ff, Mem[0000000030041410] = af6c36ea 00000000
	stda	%f18,[%i1+%o5]0x89	! Mem[0000000030041410] = 00ff80c5 000000ff
!	Mem[000000001018143d] = 00000000, %l5 = 00000000f00000ff
	ldstub	[%i6+0x03d],%l5		! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff000000, %l1 = 00000000000000ff
	lduha	[%i1+%o5]0x81,%l1	! %l1 = 000000000000ff00

p0_label_343:
!	Mem[0000000010041400] = ff030125, %l1 = 000000000000ff00
	ldswa	[%i1+%g0]0x88,%l1	! %l1 = ffffffffff030125
!	Mem[0000000030181400] = 00000031, %f1  = ffffffff
	lda	[%i6+%g0]0x89,%f1 	! %f1 = 00000031
!	Mem[0000000010101408] = 007f0000, %f13 = d494ff67
	ld	[%i4+%o4],%f13	! %f13 = 007f0000
!	Mem[0000000010081400] = ffffffff00000000, %f16 = 00000000 00000039
	ldda	[%i2+%g0]0x80,%f16	! %f16 = ffffffff 00000000
!	Mem[0000000030141410] = ffffffff00000000, %l4 = 00000000ff0300ff
	ldxa	[%i5+%o5]0x89,%l4	! %l4 = ffffffff00000000
!	%f16 = ffffffff 00000000, %f14 = ff0300ff 95a7e5b4
	fxtod	%f16,%f14		! %f14 = c1f00000 00000000
!	Mem[0000000010041404] = 4c00ffff, %l6 = 00000000000000ff
	lduha	[%i1+0x006]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010101408] = 007f0000, %l0 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001008140c] = 315d3c5e, %l5 = 0000000000000000
	lduha	[%i2+0x00e]%asi,%l5	! %l5 = 0000000000003c5e
!	Starting 10 instruction Store Burst
!	Mem[0000000010141414] = ffffffff, %l6 = 000000000000ffff
	swap	[%i5+0x014],%l6		! %l6 = 00000000ffffffff

p0_label_344:
!	%f20 = 00000000, Mem[0000000010081438] = 00000000
	sta	%f20,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000000
!	Mem[0000000010081410] = 9d0615ff, %l6 = 00000000ffffffff
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 0000009d000000ff
!	%f12 = 00003039, Mem[0000000010141438] = 39307cef
	sta	%f12,[%i5+0x038]%asi	! Mem[0000000010141438] = 00003039
!	%f2  = ff0000ff d494ff67, %l1 = ffffffffff030125
!	Mem[0000000030181408] = 000000001ab5feff
	add	%i6,0x008,%g1
	stda	%f2,[%g1+%l1]ASI_PST8_S ! Mem[0000000030181408] = 000000001a94fe67
!	%f12 = 00003039, Mem[0000000010001410] = ff0300ff
	sta	%f12,[%i0+%o5]0x80	! Mem[0000000010001410] = 00003039
!	%f4  = ff000000 000000e0, Mem[0000000010001400] = ff0000ff ffffffff
	stda	%f4 ,[%i0+%g0]0x88	! Mem[0000000010001400] = ff000000 000000e0
!	Mem[0000000010001408] = ff000000, %l6 = 000000000000009d
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 00000000ff000000
!	%l0 = 00000000, %l1 = ff030125, Mem[0000000010081430] = 00003039 d494ff67
	std	%l0,[%i2+0x030]		! Mem[0000000010081430] = 00000000 ff030125
!	%l0 = 0000000000000000, Mem[000000001004143a] = f927f3d8, %asi = 80
	stba	%l0,[%i1+0x03a]%asi	! Mem[0000000010041438] = f92700d8
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 1e1f952c, %l0 = 0000000000000000
	ldswa	[%i5+%o4]0x80,%l0	! %l0 = 000000001e1f952c

p0_label_345:
!	Mem[0000000010001408] = 0000009d, %l4 = ffffffff00000000
	ldsha	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = ffffffff 00000000, %l4 = 00000000, %l5 = 00003c5e
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000 00000000ffffffff
!	Mem[0000000030181400] = 31000000, %f17 = 00000000
	lda	[%i6+%g0]0x81,%f17	! %f17 = 31000000
!	Mem[0000000010101410] = 0080882eff0000ff, %f30 = 000000a0 00000000
	ldda	[%i4+%o5]0x88,%f30	! %f30 = 0080882e ff0000ff
!	Mem[00000000300c1410] = ff000000 315d3c5e, %l0 = 1e1f952c, %l1 = ff030125
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 00000000ff000000 00000000315d3c5e
!	Mem[00000000201c0000] = 0000826e, %l5 = 00000000ffffffff
	ldsh	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	%l1 = 00000000315d3c5e, %l4 = 0000000000000000, %l4 = 0000000000000000
	or	%l1,%l4,%l4		! %l4 = 00000000315d3c5e
!	Mem[0000000010141418] = ffffffe36025bc2d, %f24 = ff000000 f0000000
	ldd	[%i5+0x018],%f24	! %f24 = ffffffe3 6025bc2d
!	Mem[0000000030041410] = ff000000, %l6 = 00000000ff000000
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 0000e500, %l0 = 00000000ff000000
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 000000000000e500

p0_label_346:
!	%l7 = ff0300ff95a7e5b4, Mem[0000000010101408] = 00007f00
	stwa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 95a7e5b4
!	Mem[0000000010001410] = 00003039, %l5 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 0000000000003039
!	Mem[0000000010181408] = ffff7000, %l1 = 00000000315d3c5e
	ldstuba	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l7 = ff0300ff95a7e5b4, Mem[00000000100c1408] = ffffffff
	stha	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = e5b4ffff
!	Mem[0000000020800001] = ffff8ed8, %l4 = 00000000315d3c5e
	ldstub	[%o1+0x001],%l4		! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, %l4 = 00000000000000ff, %l7 = ff0300ff95a7e5b4
	add	%l4,%l4,%l7		! %l7 = 00000000000001fe
!	%f4  = ff000000 000000e0, %l3 = ffffdafdff15069d
!	Mem[0000000030001420] = 000000f0000000ff
	add	%i0,0x020,%g1
	stda	%f4,[%g1+%l3]ASI_PST8_S ! Mem[0000000030001420] = ff000000000000e0
!	%l1 = 0000000000000000, Mem[0000000010081400] = ffffffff00000000, %asi = 80
	stxa	%l1,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000000000000000
!	%l3 = ffffdafdff15069d, Mem[0000000030181410] = 00000000000000ff
	stxa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffdafdff15069d
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000, %l7 = 00000000000001fe
	lduwa	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000

p0_label_347:
!	Mem[0000000030101410] = f3d87cef, %l5 = 0000000000003039
	lduba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000f3
!	Mem[0000000030101408] = 39307cef, %l0 = 000000000000e500
	lduba	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000039
!	Mem[00000000201c0000] = 0000826e, %l1 = 0000000000000000
	ldsh	[%o0+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l6 = 00000000000000ff
	ldsba	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001414] = 95a7e5b4, %l3 = ffffdafdff15069d
	ldsha	[%i0+0x014]%asi,%l3	! %l3 = ffffffffffff95a7
!	Mem[0000000010141408] = 1e1f952c, %l4 = 00000000000000ff
	ldsba	[%i5+%o4]0x80,%l4	! %l4 = 000000000000001e
!	Mem[00000000300c1408] = 5e3c5d31ff0300ff, %l6 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l6	! %l6 = 5e3c5d31ff0300ff
!	Mem[0000000010041410] = 00000000 00000000, %l6 = ff0300ff, %l7 = 00000000
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010081410] = ff0615ff fddaffff, %l0 = 00000039, %l1 = 00000000
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000ff0615ff 00000000fddaffff
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 0000826e, %l1 = 00000000fddaffff
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 00000000000000ff

p0_label_348:
!	Mem[00000000300c1400] = 00000039, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000039
!	%l6 = 0000000000000039, Mem[00000000100c1408] = e5b4ffff
	stwa	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000039
!	%l3 = ffffffffffff95a7, Mem[00000000100c1400] = 700025f9
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffff95a7
!	%f6  = ff7f0000 ffff0000, Mem[0000000010101400] = 9d000000 000000b6
	stda	%f6 ,[%i4+%g0]0x80	! Mem[0000000010101400] = ff7f0000 ffff0000
!	Mem[0000000030001408] = 00000000, %l1 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800041] = ffffcbdb, %l1 = 0000000000000000
	ldstub	[%o1+0x041],%l1		! %l1 = 000000ff000000ff
!	%l4 = 0000001e, %l5 = 000000f3, Mem[00000000100c1400] = a795ffff c580bbff
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000001e 000000f3
!	%l4 = 000000000000001e, Mem[0000000030041400] = 000020ff
	stwa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000001e
!	Mem[00000000211c0001] = 00cc7001, %l1 = 00000000000000ff
	ldstub	[%o2+0x001],%l1		! %l1 = 000000cc000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0000001e000000f3, %f22 = f9250070 c580bbff
	ldda	[%i3+%g0]0x80,%f22	! %f22 = 0000001e 000000f3

p0_label_349:
!	%l4 = 000000000000001e, Mem[0000000010041410] = 00000000
	stha	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 001e0000
!	Mem[0000000030141408] = 00000000ff250070, %f10 = f9250070 c580bbff
	ldda	[%i5+%o4]0x81,%f10	! %f10 = 00000000 ff250070
!	Mem[0000000020800000] = ffff8ed8, %l0 = 00000000ff0615ff
	lduh	[%o1+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000010141400] = 000000ffd8f327f9, %l0 = 000000000000ffff
	ldxa	[%i5+%g0]0x88,%l0	! %l0 = 000000ffd8f327f9
!	Mem[0000000030001410] = 00000000 ff000000, %l6 = 00000039, %l7 = 00000000
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000010141410] = 00000000, %l0 = 000000ffd8f327f9
	ldswa	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = b600000000000000, %l4 = 000000000000001e
	ldxa	[%i3+0x010]%asi,%l4	! %l4 = b600000000000000
!	Mem[0000000010081420] = 00000000, %l4 = b600000000000000
	ldsw	[%i2+0x020],%l4		! %l4 = 0000000000000000
!	Mem[0000000030081410] = f9250070, %f28 = 8d7ac14c
	lda	[%i2+%o5]0x89,%f28	! %f28 = f9250070
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 00000039, %l2 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000ff

p0_label_350:
!	%f0  = ff250070 00000031, Mem[0000000010001410] = 00000000 95a7e5b4
	std	%f0 ,[%i0+%o5]	! Mem[0000000010001410] = ff250070 00000031
!	Mem[0000000010001400] = 000000e0, %l1 = 00000000000000cc
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 000000e0000000ff
!	%f2  = ff0000ff, %f2  = ff0000ff
	fcmps	%fcc3,%f2 ,%f2 		! %fcc3 = 0
!	Mem[0000000010081408] = ff0300ff, %l4 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l4	! %l4 = 00000000ff0300ff
!	%f8  = b4e5a795 ff0003ff, %l4 = 00000000ff0300ff
!	Mem[0000000010081420] = 00000000000000e0
	add	%i2,0x020,%g1
	stda	%f8,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010081420] = ff0300ff95a7e5b4
!	Mem[0000000030181410] = 9d0615ff, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 0000009d000000ff
!	%l0 = 0000000000000000, Mem[0000000010101410] = ff0000ff2e888000
	stxa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	%f25 = 6025bc2d, %f3  = d494ff67, %f8  = b4e5a795
	fadds	%f25,%f3 ,%f8 		! %f8  = 6025bc2c
!	Mem[0000000010181438] = 000000ff00ff0000, %l7 = 0000000000000000, %l2 = 000000000000009d
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = 000000ff00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 000020ff641eeb00, %l7 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l7	! %l7 = 000020ff641eeb00

p0_label_351:
!	Mem[0000000010181408] = ff70ffffffffffff, %f24 = ffffffe3 6025bc2d
	ldda	[%i6+%o4]0x80,%f24	! %f24 = ff70ffff ffffffff
!	Mem[0000000010041400] = 250103ff4c00ffff, %f28 = f9250070 cc174fb6
	ldda	[%i1+%g0]0x80,%f28	! %f28 = 250103ff 4c00ffff
!	Mem[0000000030101400] = 00000000, %l2 = 000000ff00ff0000
	lduba	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, %l3 = ffffffffffff95a7, %l3 = ffffffffffff95a7
	andn	%l2,%l3,%l3		! %l3 = 0000000000000000
!	Mem[0000000030001400] = ff15069d, %l7 = 000020ff641eeb00
	lduba	[%i0+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff7001, %l7 = 00000000000000ff
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = 00000000 0000ffff, %l4 = ff0300ff, %l5 = 000000f3
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000000 000000000000ffff
!	Mem[0000000030001400] = ff15069dffffffff, %l4 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l4	! %l4 = ff15069dffffffff
!	Mem[0000000030141400] = 39307cef, %l0 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l0	! %l0 = 0000000039307cef
!	Starting 10 instruction Store Burst
!	%f14 = c1f00000, Mem[0000000010081408] = 00000000
	sta	%f14,[%i2+%o4]0x88	! Mem[0000000010081408] = c1f00000

p0_label_352:
!	%l1 = 00000000000000e0, Mem[0000000030041410] = 00ff80c5000000ff
	stxa	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000000000e0
!	%f14 = c1f00000, Mem[0000000030081410] = f9250070
	sta	%f14,[%i2+%o5]0x89	! Mem[0000000030081410] = c1f00000
!	Mem[0000000030181408] = 00000000, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l0 = 39307cef, %l1 = 000000e0, Mem[0000000030001410] = 000000ff 00000000
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 39307cef 000000e0
!	%l6 = ff000000, %l7 = 000000ff, Mem[00000000300c1400] = 00000000 00000000
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff000000 000000ff
!	%l2 = 0000000000000000, Mem[00000000100c1408] = ff000039
	stwa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Mem[0000000030141400] = 39307cef, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 000000ef000000ff
!	Mem[0000000010101408] = 95a7e5b4, %l2 = 00000000000000ef
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 000000b4000000ff
!	%f16 = ffffffff 31000000, %l7 = 00000000000000ff
!	Mem[0000000030101418] = 00000000c9cbe1f0
	add	%i4,0x018,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030101418] = 00000031ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0000000000000000, %f30 = 0080882e ff0000ff
	ldda	[%i4+%g0]0x81,%f30	! %f30 = 00000000 00000000

p0_label_353:
!	Mem[0000000010101400] = 0000ffff 00007fff, %l2 = 000000b4, %l3 = 00000000
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 0000000000007fff 000000000000ffff
!	Mem[0000000010181408] = ff70ffff, %l4 = ff15069dffffffff
	ldsha	[%i6+0x008]%asi,%l4	! %l4 = ffffffffffffff70
!	Mem[0000000030041408] = c580ff00, %l3 = 000000000000ffff
	ldsba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (70)
!	Mem[0000000010081400] = 00000000 00000000 0000f0c1 315d3c5e
!	Mem[0000000010081410] = ff0615ff fddaffff 0000ff00 e0000000
!	Mem[0000000010081420] = ff0300ff 95a7e5b4 00000000 7abaad19
!	Mem[0000000010081430] = 00000000 ff030125 00000000 000000ff
	ldda	[%i2]ASI_BLK_P,%f0	! Block Load from 0000000010081400
!	Mem[0000000021800040] = ffff34f9, %l1 = 00000000000000e0
	ldsha	[%o3+0x040]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001400] = ff15069d, %l3 = 0000000000000000
	ldsha	[%i0+%g0]0x81,%l3	! %l3 = ffffffffffffff15
!	Mem[0000000030001408] = 00000000, %l1 = ffffffffffffffff
	ldswa	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 39307cff, %l6 = 00000000ff000000
	ldsha	[%i5+%g0]0x89,%l6	! %l6 = 0000000000007cff
!	Mem[00000000100c1408] = 0000000000000000, %l3 = ffffffffffffff15
	ldxa	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 250103ff, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 00000025000000ff

p0_label_354:
!	%f20 = 00000000 00000000, Mem[0000000030181408] = 00000000 67fe941a
	stda	%f20,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 00000000
!	Mem[0000000030081410] = 0000f0c1, %l6 = 0000000000007cff
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%f31 = 00000000, %f31 = 00000000
	fcmps	%fcc3,%f31,%f31		! %fcc3 = 0
!	%l1 = 0000000000000025, Mem[0000000010101400] = 00007fff
	stha	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000025
!	Mem[0000000030141410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1408] = ff0003ff, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000010001400] = 000000ff
	stha	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%l0 = 39307cef, %l1 = 00000025, Mem[0000000030001400] = 9d0615ff ffffffff
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 39307cef 00000025
!	Mem[0000000030041408] = c580ff00, %l7 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%f23 = 000000f3, %f26 = 000000ff, %f20 = 00000000
	fsubs	%f23,%f26,%f20		! %l0 = 0000000039307d11, Unfinished, %fsr = 0e00000c00

p0_label_355:
!	Mem[0000000020800040] = ffffcbdb, %l7 = 0000000000000000
	lduba	[%o1+0x041]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141400] = ff7c3039, %l0 = 0000000039307d11
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = ffffffffff7c3039
!	Mem[0000000030101410] = f3d87cef, %l4 = ffffffffffffff70
	lduba	[%i4+%o5]0x81,%l4	! %l4 = 00000000000000f3
!	Mem[0000000010101438] = 7cef00a01870ffff, %l0 = ffffffffff7c3039
	ldxa	[%i4+0x038]%asi,%l0	! %l0 = 7cef00a01870ffff
!	Mem[0000000030181408] = 00000000, %f19 = 000000ff
	lda	[%i6+%o4]0x89,%f19	! %f19 = 00000000
!	Mem[0000000030181400] = ff0000ff00000031, %l3 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l3	! %l3 = ff0000ff00000031
!	Mem[0000000010181430] = fffeb51a, %f24 = ff70ffff
	ld	[%i6+0x030],%f24	! %f24 = fffeb51a
!	%f19 = 00000000, %f20 = 00000000, %f28 = 250103ff 4c00ffff
	fsmuld	%f19,%f20,%f28		! %f28 = 00000000 00000000
!	Mem[0000000010041400] = ff0103ff 4c00ffff, %l0 = 1870ffff, %l1 = 00000025
	ldd	[%i1+%g0],%l0		! %l0 = 00000000ff0103ff 000000004c00ffff
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_24:
!	%l0 = 00000000ff0103ff
	setx	0x658ceff005acc63b,%g7,%l0 ! %l0 = 658ceff005acc63b
!	%l1 = 000000004c00ffff
	setx	0x58d837f00734e7ae,%g7,%l1 ! %l1 = 58d837f00734e7ae
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 658ceff005acc63b
	setx	0x5185f65ff1d9ef49,%g7,%l0 ! %l0 = 5185f65ff1d9ef49
!	%l1 = 58d837f00734e7ae
	setx	0x50ded740195b3509,%g7,%l1 ! %l1 = 50ded740195b3509

p0_label_356:
!	%l1 = 50ded740195b3509, Mem[0000000030041408] = c580ffff
	stha	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = c5803509
!	%l4 = 00000000000000f3, Mem[0000000030101408] = 39307cef00000000
	stxa	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000000000f3
!	%l7 = 00000000000000ff, Mem[000000001010140e] = ff030000
	sth	%l7,[%i4+0x00e]		! Mem[000000001010140c] = ff0300ff
!	%l4 = 000000f3, %l5 = 0000ffff, Mem[0000000030081400] = ff000000 ff000000
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000f3 0000ffff
!	%f22 = 0000001e, Mem[0000000010141408] = 2c951f1e
	sta	%f22,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000001e
!	%f12 = 00000000 ff030125, %l3 = ff0000ff00000031
!	Mem[0000000010041418] = 6783a828ffffffff
	add	%i1,0x018,%g1
	stda	%f12,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010041418] = 2583a8280000ffff
!	Mem[0000000010001408] = 0000009dd494ff67, %l7 = 00000000000000ff, %l0 = 5185f65ff1d9ef49
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 0000009dd494ff67
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010101408] = ffe5a795 ff0300ff
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff 000000ff
!	Mem[0000000030181408] = 00000000, %l6 = 00000000000000ff
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff70ffff, %l3 = ff0000ff00000031
	ldsba	[%i6+%o4]0x80,%l3	! %l3 = ffffffffffffffff

p0_label_357:
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = e3ffffff, %l0 = 0000009dd494ff67
	ldsha	[%i1+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181410] = 00eb1e64ff200000, %f22 = 0000001e 000000f3
	ldda	[%i6+%o5]0x80,%f22	! %f22 = 00eb1e64 ff200000
!	Mem[00000000201c0000] = 00ff826e, %l0 = ffffffffffffffff
	ldub	[%o0+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181408] = ff70ffff, %l3 = ffffffffffffffff
	lduba	[%i6+0x00b]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141430] = b4e5a7950ff7373e, %l0 = 0000000000000000
	ldxa	[%i5+0x030]%asi,%l0	! %l0 = b4e5a7950ff7373e
!	Mem[0000000030041410] = 00000000000000e0, %f14 = 00000000 000000ff
	ldda	[%i1+%o5]0x89,%f14	! %f14 = 00000000 000000e0
!	Mem[0000000030101410] = ffffffffef7cd8f3, %f20 = 00000000 00000000
	ldda	[%i4+%o5]0x89,%f20	! %f20 = ffffffff ef7cd8f3
!	%l7 = 00000000000000ff, %l6 = 0000000000000000, %y  = ffffdafe
	sdiv	%l7,%l6,%l2		! Div by zero, %l0 = b4e5a7950ff7378e
	mov	%l0,%y			! %y = 0ff73766
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000f3, Mem[0000000010141410] = ffff000000000000
	stxa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000000f3

p0_label_358:
!	%l0 = 0ff73766, %l1 = 195b3509, Mem[0000000030041410] = e0000000 00000000
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 0ff73766 195b3509
!	%l1 = 50ded740195b3509, Mem[00000000201c0000] = 00ff826e
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 09ff826e
!	%f12 = 00000000 ff030125, Mem[0000000030141410] = ff000000 ffffffff
	stda	%f12,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 ff030125
!	Mem[0000000010181400] = ffe30000, %l5 = 000000000000ffff
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%l6 = 0000000000000000, %l3 = 00000000000000ff, %l3 = 00000000000000ff
	addc	%l6,%l3,%l3		! %l3 = 00000000000000ff
!	%f30 = 00000000 00000000, %l6 = 0000000000000000
!	Mem[0000000010141438] = 000030390000ffff
	add	%i5,0x038,%g1
	stda	%f30,[%g1+%l6]ASI_PST16_P ! Mem[0000000010141438] = 000030390000ffff
!	Mem[0000000010041408] = ffffffe3, %l3 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010141400] = d8f327f9
	stha	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = d8f300ff
!	%l6 = 0000000000000000, Mem[0000000010141400] = ff00f3d8
	stwa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_25:
!	%l0 = b4e5a7950ff73766
	setx	0xd8ecd3c80697eb2f,%g7,%l0 ! %l0 = d8ecd3c80697eb2f
!	%l1 = 50ded740195b3509
	setx	0x586aa74797356a2a,%g7,%l1 ! %l1 = 586aa74797356a2a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d8ecd3c80697eb2f
	setx	0xe9dd15f0405140a9,%g7,%l0 ! %l0 = e9dd15f0405140a9
!	%l1 = 586aa74797356a2a
	setx	0x6ebaf86fb0bd83d7,%g7,%l1 ! %l1 = 6ebaf86fb0bd83d7

p0_label_359:
!	Mem[00000000300c1410] = 000000ff, %l3 = 00000000000000ff
	ldswa	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000 00000000, %l0 = 405140a9, %l1 = b0bd83d7
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010101410] = 00000000 00000000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030001400] = 39307cef, %l5 = 00000000000000ff
	ldsba	[%i0+%g0]0x89,%l5	! %l5 = ffffffffffffffef
!	Mem[0000000010001408] = 0000009d, %l2 = 0000000000007fff
	ldswa	[%i0+%o4]0x80,%l2	! %l2 = 000000000000009d
!	Mem[0000000030081408] = ffffffff 00000000, %l2 = 0000009d, %l3 = 000000ff
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[0000000010141408] = 1e00000000000000, %l2 = 00000000ffffffff
	ldxa	[%i5+%o4]0x80,%l2	! %l2 = 1e00000000000000
!	Mem[0000000030001400] = ef7c3039, %l5 = ffffffffffffffef
	lduwa	[%i0+%g0]0x81,%l5	! %l5 = 00000000ef7c3039
	membar	#Sync			! Added by membar checker (71)
!	Mem[0000000030141400] = ff7c3039 00003fed 00000000 ff250070
!	Mem[0000000030141410] = 00000000 ff030125 19000000 ff0000ff
!	Mem[0000000030141420] = 00ff03ff 00000000 6783a828 00000000
!	Mem[0000000030141430] = 00000000 4c00ffff b64f17cc ef7c3039
	ldda	[%i5]ASI_BLK_AIUS,%f0	! Block Load from 0000000030141400
!	Starting 10 instruction Store Burst
!	%f30 = 00000000 00000000, Mem[0000000010101410] = 00000000 00000000
	stda	%f30,[%i4+0x010]%asi	! Mem[0000000010101410] = 00000000 00000000

p0_label_360:
!	%l5 = 00000000ef7c3039, Mem[0000000010081428] = 00000000, %asi = 80
	stwa	%l5,[%i2+0x028]%asi	! Mem[0000000010081428] = ef7c3039
!	%l2 = 1e00000000000000, Mem[0000000030101408] = 00000000
	stba	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
	membar	#Sync			! Added by membar checker (72)
!	%f23 = ff200000, Mem[0000000030141410] = 00000000
	sta	%f23,[%i5+%o5]0x89	! Mem[0000000030141410] = ff200000
!	%l1 = 0000000000000000, Mem[00000000100c1410] = b600000000000000
	stxa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	Mem[0000000030081400] = 000000f3, %l4 = 00000000000000f3
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000f3
!	Mem[0000000010101408] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l2 = 1e00000000000000, Mem[0000000010141410] = 00000000000000f3
	stxa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 1e00000000000000
!	%f0  = ff7c3039 00003fed, Mem[0000000030181410] = ff1506ff ffffdafd
	stda	%f0 ,[%i6+%o5]0x89	! Mem[0000000030181410] = ff7c3039 00003fed
!	%l1 = 0000000000000000, Mem[0000000010081410] = ff1506ff
	stwa	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001404] = 000000ff, %l5 = 00000000ef7c3039
	lduwa	[%i0+0x004]%asi,%l5	! %l5 = 00000000000000ff

p0_label_361:
!	Mem[0000000010181418] = ffff0000 00000000, %l4 = 000000f3, %l5 = 000000ff
	ldd	[%i6+0x018],%l4		! %l4 = 00000000ffff0000 0000000000000000
!	Mem[0000000010001400] = 00000000, %l2 = 1e00000000000000
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 25000000ffff0000, %f24 = fffeb51a ffffffff
	ldda	[%i4+%g0]0x80,%f24	! %f24 = 25000000 ffff0000
!	Mem[0000000010141408] = 1e00000000000000, %l0 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = 1e00000000000000
!	Mem[00000000100c1430] = fffeb51a, %l4 = 00000000ffff0000
	ldsba	[%i3+0x032]%asi,%l4	! %l4 = ffffffffffffffb5
!	Mem[0000000010181410] = 641eeb00, %l0 = 1e00000000000000
	ldswa	[%i6+%o5]0x88,%l0	! %l0 = 00000000641eeb00
!	Mem[0000000010001408] = 9d000000, %l0 = 00000000641eeb00
	ldsba	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (73)
!	Mem[0000000010101400] = 25000000 ffff0000 ff0000ff 000000ff
!	Mem[0000000010101410] = 00000000 00000000 f9250070 00ffbbff
!	Mem[0000000010101420] = ff000000 f00000ff a27f370c 00000000
!	Mem[0000000010101430] = ff7ae5ff cc174fb6 7cef00a0 1870ffff
	ldda	[%i4]ASI_BLK_AIUP,%f0	! Block Load from 0000000010101400
!	Mem[0000000010041408] = ffffffe3, %l0 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffffe3
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010141400] = 000000ff00000000
	stxa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000000

p0_label_362:
!	%f0  = 25000000 ffff0000 ff0000ff 000000ff
!	%f4  = 00000000 00000000 f9250070 00ffbbff
!	%f8  = ff000000 f00000ff a27f370c 00000000
!	%f12 = ff7ae5ff cc174fb6 7cef00a0 1870ffff
	stda	%f0,[%i5]ASI_BLK_PL	! Block Store to 0000000010141400
	membar	#Sync			! Added by membar checker (74)
!	%l3 = 0000000000000000, Mem[0000000010101408] = ff0000ff000000ff
	stxa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000000
!	%l4 = ffffffffffffffb5, Mem[0000000030001400] = 39307cef
	stwa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffb5
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181410] = 00eb1e64, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f4  = 00000000 00000000, Mem[0000000010041400] = ff0103ff 4c00ffff
	stda	%f4 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 00000000
!	Mem[0000000010001410] = ff250070, %l7 = 00000000, %l1 = 00000000
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 00000000ff250070
!	%l4 = ffffffffffffffb5, Mem[0000000030141408] = 00000000
	stha	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = ffb50000
!	Mem[0000000010181400] = ffe30000, %l2 = 0000000000000000
	ldstub	[%i6+%g0],%l2		! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = ff001f70, %l4 = ffffffffffffffb5
	lduh	[%o3+0x140],%l4		! %l4 = 000000000000ff00

p0_label_363:
!	Mem[0000000010001408] = 9d000000, %l4 = 000000000000ff00
	ldsba	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = ffff70ff, %l7 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l7	! %l7 = 00000000000070ff
!	Mem[0000000010141400] = ffff0000, %l2 = 00000000000000ff
	ldsba	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141408] = ff000000, %l4 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030181408] = ff000000, %l7 = 00000000000070ff
	lduha	[%i6+%o4]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010041410] = 0000000000001e00, %l7 = 000000000000ff00
	ldxa	[%i1+%o5]0x88,%l7	! %l7 = 0000000000001e00
!	Mem[0000000010041400] = 00000000 00000000, %l6 = 00000000, %l7 = 00001e00
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030101400] = 0000000000000000, %f6  = f9250070 00ffbbff
	ldda	[%i4+%g0]0x89,%f6 	! %f6  = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141418] = ffbbff00 700025f9
	stda	%l6,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000 00000000

p0_label_364:
!	Mem[0000000030141410] = 000020ff, %l0 = ffffffffffffffe3
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l4 = 000000000000ff00, Mem[0000000030181408] = 000000ff
	stba	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%l3 = 0000000000000000, Mem[0000000030101400] = 00000000
	stba	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%f27 = 00000000, Mem[00000000100c1400] = 0000001e
	sta	%f27,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Mem[0000000030081408] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stha	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%f0  = 25000000 ffff0000 ff0000ff 000000ff
!	%f4  = 00000000 00000000 00000000 00000000
!	%f8  = ff000000 f00000ff a27f370c 00000000
!	%f12 = ff7ae5ff cc174fb6 7cef00a0 1870ffff
	stda	%f0,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%l4 = 0000ff00, %l5 = 000000ff, Mem[0000000010081410] = 00000000 fddaffff
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000ff00 000000ff
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000030141410] = ff2000ff 250103ff
	stda	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff 00000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000010101410] = 0000000000000000, %f22 = 00eb1e64 ff200000
	ldda	[%i4+%o5]0x80,%f22	! %f22 = 00000000 00000000

p0_label_365:
!	Mem[0000000010041404] = 00000000, %l6 = 0000000000000000
	ldsha	[%i1+0x006]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041430] = 000000a0, %l3 = 0000000000000000
	ldsha	[%i1+0x030]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = 0000b5ff, %l1 = 00000000ff250070
	lduha	[%i5+%o4]0x89,%l1	! %l1 = 000000000000b5ff
!	Mem[0000000010041410] = 001e0000, %l3 = 0000000000000000
	ldub	[%i1+%o5],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041410] = 001e0000, %l4 = 000000000000ff00
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = ef7c3039, %l7 = 0000000000000000
	ldsha	[%i0+%o5]0x89,%l7	! %l7 = 0000000000003039
!	Mem[0000000030101400] = 25000000 ffff0000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 0000000025000000 00000000ffff0000
!	Mem[00000000201c0000] = 09ff826e, %l0 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = 00000000000009ff
!	Mem[0000000010001410] = ff25007000000031, %f0  = 25000000 ffff0000
	ldda	[%i0+%o5]0x80,%f0 	! %f0  = ff250070 00000031
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 39307cef, %l4 = 0000000025000000
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 00000039000000ff

p0_label_366:
!	%l0 = 00000000000009ff, Mem[0000000030041400] = 0000001e
	stha	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 000009ff
!	Mem[0000000030181410] = ed3f0000, %l2 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 00000000ed3f0000
!	Mem[0000000010141400] = ffff0000, %l2 = 00000000ed3f0000
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 00000000ffff0000
!	%f17 = 31000000, %f29 = 00000000, %f1  = 00000031
	fadds	%f17,%f29,%f1 		! %f1  = 31000000
!	%f9  = f00000ff, %f5  = 00000000
	fcmpes	%fcc1,%f9 ,%f5 		! %fcc1 = 1
!	%l0 = 000009ff, %l1 = 0000b5ff, Mem[00000000100c1410] = 00000000 00000000
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000009ff 0000b5ff
!	Mem[000000001008143f] = 000000ff, %l0 = 00000000000009ff
	ldstuba	[%i2+0x03f]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010001408] = 0000009dd494ff67, %l7 = 0000000000003039, %l5 = 00000000ffff0000
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = 0000009dd494ff67
!	Mem[00000000211c0001] = 00ff7001, %l1 = 000000000000b5ff
	ldstub	[%o2+0x001],%l1		! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000ff, %l2 = 00000000ffff0000
	lduwa	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff

p0_label_367:
!	Mem[0000000010041410] = 00001e00, %l0 = 00000000000000ff
	lduwa	[%i1+%o5]0x88,%l0	! %l0 = 0000000000001e00
!	Mem[00000000201c0000] = 09ff826e, %l2 = 00000000000000ff
	ldsb	[%o0+0x001],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030181408] = 00000000, %l6 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l4 = 0000000000000039, Mem[0000000030081408] = ffffffff
	stwa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000039
!	Mem[0000000010101418] = f925007000ffbbff, %l3 = 0000000000000000
	ldx	[%i4+0x018],%l3		! %l3 = f925007000ffbbff
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000001e00
	lduha	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = ff7c3039ff000000, %f16 = ffffffff 31000000
	ldda	[%i6+%o5]0x89,%f16	! %f16 = ff7c3039 ff000000
!	Mem[0000000030001400] = b5ffffff, %f15 = 1870ffff
	lda	[%i0+%g0]0x81,%f15	! %f15 = b5ffffff
!	Mem[0000000010001400] = ff000000000000ff, %f14 = 7cef00a0 b5ffffff
	ldda	[%i0+%g0]0x88,%f14	! %f14 = ff000000 000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000039, Mem[000000001004143c] = ff000000
	stw	%l4,[%i1+0x03c]		! Mem[000000001004143c] = 00000039

p0_label_368:
!	Mem[00000000100c1438] = 39307cef, %l7 = 0000000000003039, %asi = 80
	swapa	[%i3+0x038]%asi,%l7	! %l7 = 0000000039307cef
!	Mem[00000000100c1400] = 00000000, %l3 = f925007000ffbbff
	ldstuba	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l4 = 0000000000000039
	swapa	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 0000f0c1, %l4 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010081408] = ff00f0c1
	stha	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000f0c1
!	%l6 = 0000000000000000, Mem[0000000030141400] = ed3f000039307cff
	stxa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	Mem[0000000020800040] = ffffcbdb, %l2 = ffffffffffffffff
	ldstub	[%o1+0x040],%l2		! %l2 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 39307cef, Mem[0000000030181408] = 00000000 00000000
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 39307cef
!	Mem[0000000020800000] = ffff8ed8, %l4 = 0000000000000000
	ldstub	[%o1+%g0],%l4		! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff250070 00000031, %l6 = 00000000, %l7 = 39307cef
	ldda	[%i0+0x010]%asi,%l6	! %l6 = 00000000ff250070 0000000000000031

p0_label_369:
!	Mem[0000000030001410] = ef7c30ff, %l3 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l3	! %l3 = 00000000ef7c30ff
!	Mem[0000000030181408] = 39307cef00000000, %f30 = 00000000 00000000
	ldda	[%i6+%o4]0x89,%f30	! %f30 = 39307cef 00000000
!	Mem[0000000030141410] = 00000000000000ff, %l4 = 00000000000000ff
	ldxa	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[000000001008142c] = 7abaad19, %f3  = 000000ff
	ld	[%i2+0x02c],%f3 	! %f3 = 7abaad19
!	Mem[00000000300c1400] = 000000ff, %f8  = ff000000
	lda	[%i3+%g0]0x81,%f8 	! %f8 = 000000ff
!	Mem[0000000030101408] = ff0000ff, %l3 = 00000000ef7c30ff
	lduba	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = 000000ff, %l1 = 00000000000000ff
	lduha	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[000000001004140c] = 00000000, %f29 = 00000000
	ld	[%i1+0x00c],%f29	! %f29 = 00000000
!	Mem[0000000010081418] = 0000ff00, %l3 = 00000000000000ff
	ldsb	[%i2+0x01b],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000009dd494ff67, Mem[00000000100c1410] = ff090000, %asi = 80
	stwa	%l5,[%i3+0x010]%asi	! Mem[00000000100c1410] = d494ff67

p0_label_370:
!	%f25 = ffff0000, %f26 = 000000ff 00000000
	fstox	%f25,%f26		! %f26 = 80000000 00000000
!	%l5 = 0000009dd494ff67, Mem[0000000010081410] = 00ff0000
	stha	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 00ffff67
!	Mem[0000000010181408] = ffff70ff, %l5 = 0000009dd494ff67
	swapa	[%i6+%o4]0x88,%l5	! %l5 = 00000000ffff70ff
!	%f2  = ff0000ff 7abaad19, %l4 = 00000000000000ff
!	Mem[0000000030141410] = ff00000000000000
	add	%i5,0x010,%g1
	stda	%f2,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030141410] = 19adba7aff0000ff
!	%f19 = 00000000, %f22 = 00000000, %f20 = ffffffff ef7cd8f3
	fsmuld	%f19,%f22,%f20		! %f20 = 00000000 00000000
!	%l2 = 00000000000000ff, Mem[0000000010001438] = 00000000000000ff
	stx	%l2,[%i0+0x038]		! Mem[0000000010001438] = 00000000000000ff
!	%l6 = ff250070, %l7 = 00000031, Mem[0000000010181400] = ffe30000 ff000000
	stda	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = ff250070 00000031
!	%f4  = 00000000 00000000, %l0 = 0000000000000000
!	Mem[00000000100c1418] = b64f17ccef7c3039
	add	%i3,0x018,%g1
	stda	%f4,[%g1+%l0]ASI_PST8_P ! Mem[00000000100c1418] = b64f17ccef7c3039
!	%l7 = 0000000000000031, Mem[0000000010081400] = 00000000
	stwa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000031
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 09ff826e, %l5 = 00000000ffff70ff
	ldub	[%o0+0x001],%l5		! %l5 = 00000000000000ff

p0_label_371:
!	Mem[0000000010101410] = 39000000, %l2 = 00000000000000ff
	lduwa	[%i4+%o5]0x88,%l2	! %l2 = 0000000039000000
!	Mem[0000000021800040] = ffff34f9, %l4 = 00000000000000ff
	ldub	[%o3+0x040],%l4		! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i3+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff7001, %l3 = 00000000000000ff
	ldub	[%o2+%g0],%l3		! %l3 = 0000000000000000
!	Mem[000000001018140c] = ffffffff, %l6 = 00000000ff250070
	lduha	[%i6+0x00e]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[00000000100c1404] = 000000f3, %l7 = 0000000000000031
	ldsw	[%i3+0x004],%l7		! %l7 = 00000000000000f3
!	Mem[0000000010041420] = ffffffff, %l2 = 0000000039000000
	ldsha	[%i1+0x022]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081410] = 67ffff00, %l2 = ffffffffffffffff
	ldsha	[%i2+%o5]0x80,%l2	! %l2 = 00000000000067ff
!	Mem[0000000010101408] = 00000000, %f20 = 00000000
	lda	[%i4+%o4]0x88,%f20	! %f20 = 00000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000067ff, Mem[0000000010001400] = ff000000
	stha	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 67ff0000

p0_label_372:
!	Mem[0000000010181408] = d494ff67, %l1 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l1	! %l1 = 00000067000000ff
!	Mem[0000000010081411] = 67ffff00, %l1 = 0000000000000067
	ldstub	[%i2+0x011],%l1		! %l1 = 000000ff000000ff
!	%f11 = 00000000, Mem[0000000010041408] = ffffffe3
	sta	%f11,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%f16 = ff7c3039 ff000000 00ff80c5 00000000
!	%f20 = 00000000 00000000 00000000 00000000
!	%f24 = 25000000 ffff0000 80000000 00000000
!	%f28 = 00000000 00000000 39307cef 00000000
	stda	%f16,[%i6]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	%l1 = 00000000000000ff, immed = 00000626, %y  = 0ff73766
	udiv	%l1,0x626,%l4		! %l4 = 00000000ffffffff
	mov	%l0,%y			! %y = 00000000
!	%f16 = ff7c3039 ff000000 00ff80c5 00000000
!	%f20 = 00000000 00000000 00000000 00000000
!	%f24 = 25000000 ffff0000 80000000 00000000
!	%f28 = 00000000 00000000 39307cef 00000000
	stda	%f16,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	%f12 = ff7ae5ff cc174fb6, %l0 = 0000000000000000
!	Mem[0000000030181400] = ff7c3039ff000000
	stda	%f12,[%i6+%l0]ASI_PST32_S ! Mem[0000000030181400] = ff7c3039ff000000
!	%l3 = 0000000000000000, Mem[0000000010081426] = 95a7e5b4
	stb	%l3,[%i2+0x026]		! Mem[0000000010081424] = 95a700b4
!	%l7 = 00000000000000f3, Mem[000000001018142f] = ffffffe3, %asi = 80
	stba	%l7,[%i6+0x02f]%asi	! Mem[000000001018142c] = fffffff3
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 25000000 ed3f0000, %l2 = 000067ff, %l3 = 00000000
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 00000000ed3f0000 0000000025000000

p0_label_373:
!	Mem[0000000010081430] = 00000000, %l6 = 000000000000ffff
	lduh	[%i2+0x030],%l6		! %l6 = 0000000000000000
!	Mem[0000000030101408] = ff000000ff0000ff, %f12 = ff7ae5ff cc174fb6
	ldda	[%i4+%o4]0x89,%f12	! %f12 = ff000000 ff0000ff
!	Mem[00000000100c1410] = 67ff94d4, %l7 = 00000000000000f3
	lduba	[%i3+%o5]0x88,%l7	! %l7 = 00000000000000d4
!	Mem[0000000030001400] = 00000025 ffffffb5, %l4 = ffffffff, %l5 = 000000ff
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000ffffffb5 0000000000000025
	membar	#Sync			! Added by membar checker (76)
!	Mem[0000000010041408] = 00000000, %l7 = 00000000000000d4
	ldswa	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 00003fed00000025, %f20 = 00000000 00000000
	ldd	[%i5+%g0],%f20		! %f20 = 00003fed 00000025
!	%l3 = 0000000025000000, immd = fffffffffffffd7e, %l7 = 0000000000000000
	sdivx	%l3,-0x282,%l7		! %l7 = fffffffffff13f01
!	Mem[0000000010041400] = 0000000000000000, %l4 = 00000000ffffffb5
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001004142c] = 380ea27e, %l1 = 00000000000000ff
	lduha	[%i1+0x02e]%asi,%l1	! %l1 = 000000000000a27e
!	Starting 10 instruction Store Burst
!	%l2 = ed3f0000, %l3 = 25000000, Mem[0000000010081400] = 31000000 00000000
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = ed3f0000 25000000

p0_label_374:
!	%l1 = 000000000000a27e, Mem[000000001010143c] = 1870ffff, %asi = 80
	stwa	%l1,[%i4+0x03c]%asi	! Mem[000000001010143c] = 0000a27e
!	%f26 = 80000000, Mem[0000000030141408] = 0000b5ff
	sta	%f26,[%i5+%o4]0x89	! Mem[0000000030141408] = 80000000
!	Mem[0000000010081404] = 25000000, %l5 = 0000000000000025
	ldstuba	[%i2+0x004]%asi,%l5	! %l5 = 00000025000000ff
!	%l3 = 0000000025000000, Mem[0000000010181410] = ffeb1e64ff200000
	stxa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000025000000
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0001] = 09ff826e, %l3 = 0000000025000000
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	%f0  = ff250070, Mem[0000000010041400] = 00000000
	sta	%f0 ,[%i1+%g0]0x80	! Mem[0000000010041400] = ff250070
!	%f24 = 25000000 ffff0000, Mem[00000000100c1410] = d494ff67 ffb50000
	stda	%f24,[%i3+%o5]0x80	! Mem[00000000100c1410] = 25000000 ffff0000
!	%f26 = 80000000 00000000, Mem[00000000100c1408] = 00000000 00000000
	stda	%f26,[%i3+%o4]0x80	! Mem[00000000100c1408] = 80000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff0300ff, %l1 = 000000000000a27e
	lduwa	[%i3+%o4]0x89,%l1	! %l1 = 00000000ff0300ff

p0_label_375:
!	Mem[0000000010001410] = 700025ff, %f20 = 00003fed
	lda	[%i0+%o5]0x88,%f20	! %f20 = 700025ff
!	Mem[0000000021800080] = 28ff944f, %l2 = 00000000ed3f0000
	lduha	[%o3+0x080]%asi,%l2	! %l2 = 00000000000028ff
!	Mem[0000000010001400] = 0000ff67, %l7 = fffffffffff13f01
	lduba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000067
!	Mem[0000000010001408] = 67ff94d4 9d000000, %l6 = 00000000, %l7 = 00000067
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 000000009d000000 0000000067ff94d4
!	Mem[0000000030041408] = 00ff80c5, %l3 = 00000000000000ff
	lduwa	[%i1+%o4]0x81,%l3	! %l3 = 0000000000ff80c5
!	Mem[0000000010101400] = 25000000, %l0 = 0000000000000000
	lduha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000002500
!	Mem[0000000010001408] = 67ff94d49d000000, %l0 = 0000000000002500
	ldxa	[%i0+%o4]0x88,%l0	! %l0 = 67ff94d49d000000
!	Mem[00000000100c1408] = 80000000, %l6 = 000000009d000000
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 00000080000000ff
!	Mem[0000000010041410] = 00001e00, %l6 = 0000000000000080
	lduwa	[%i1+%o5]0x88,%l6	! %l6 = 0000000000001e00
!	Starting 10 instruction Store Burst
!	%f4  = 00000000 00000000, %l0 = 67ff94d49d000000
!	Mem[0000000010001420] = ff000000700025f9
	add	%i0,0x020,%g1
	stda	%f4,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010001420] = ff000000700025f9

p0_label_376:
!	%l6 = 00001e00, %l7 = 67ff94d4, Mem[0000000010001410] = ff250070 00000031
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00001e00 67ff94d4
!	Mem[0000000030141410] = 7abaad19, %l5 = 0000000000000025
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 00000019000000ff
!	Mem[0000000010001400] = 67ff0000, %l6 = 0000000000001e00
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 00000067000000ff
!	Mem[00000000100c143c] = 000000ff, %l0 = 67ff94d49d000000
	swap	[%i3+0x03c],%l0		! %l0 = 00000000000000ff
!	%l6 = 0000000000000067, Mem[0000000010001434] = d494ff67, %asi = 80
	stwa	%l6,[%i0+0x034]%asi	! Mem[0000000010001434] = 00000067
!	%f4  = 00000000, %f8  = 000000ff
	fcmpes	%fcc2,%f4 ,%f8 		! %fcc2 = 1
!	Mem[00000000100c1400] = 000000ff, %l1 = 00000000ff0300ff
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%f26 = 80000000 00000000, Mem[0000000010041410] = 00001e00 00000000
	stda	%f26,[%i1+%o5]0x88	! Mem[0000000010041410] = 80000000 00000000
!	%f30 = 39307cef 00000000, %l6 = 0000000000000067
!	Mem[0000000030041430] = 0000000000000000
	add	%i1,0x030,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_S ! Mem[0000000030041430] = 39307cef00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000039 00000000, %l6 = 00000067, %l7 = 67ff94d4
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000039 0000000000000000

p0_label_377:
!	Mem[0000000010081400] = ed3f0000 ff000000, %l0 = 000000ff, %l1 = 000000ff
	ldd	[%i2+%g0],%l0		! %l0 = 00000000ed3f0000 00000000ff000000
!	Mem[00000000100c1438] = 00003039, %l1 = 00000000ff000000
	ldswa	[%i3+0x038]%asi,%l1	! %l1 = 0000000000003039
!	Mem[0000000030081400] = f3000000, %l4 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101430] = ff7ae5ffcc174fb6, %f16 = ff7c3039 ff000000
	ldd	[%i4+0x030],%f16	! %f16 = ff7ae5ff cc174fb6
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000039
	lduwa	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 00ff80c5, %l2 = 00000000000028ff
	ldsba	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800140] = ff001f70, %l6 = 0000000000000000
	ldub	[%o3+0x140],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %f29 = 00000000
	lda	[%i6+%o5]0x80,%f29	! %f29 = 00000000
!	Mem[0000000010101408] = 0000000000000000, %f6  = 00000000 00000000
	ldda	[%i4+%o4]0x80,%f6 	! %f6  = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000019, Mem[0000000010001428] = f9250070c580bbff, %asi = 80
	stxa	%l5,[%i0+0x028]%asi	! Mem[0000000010001428] = 0000000000000019

p0_label_378:
!	Mem[0000000010101410] = 39000000, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = 7abaadff, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 000000007abaadff
!	Mem[0000000010101420] = ff000000, %l0 = ed3f0000, %l2 = 7abaadff
	add	%i4,0x20,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010041400] = 700025ff, %l2 = 00000000ff000000
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%f0  = ff250070 31000000, %l7 = 0000000000000000
!	Mem[0000000010181430] = fffeb51afffeb51a
	add	%i6,0x030,%g1
	stda	%f0,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010181430] = fffeb51afffeb51a
!	%l5 = 0000000000000019, Mem[0000000030181410] = 0000000000000000
	stxa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000019
!	%l5 = 0000000000000019, Mem[00000000300c1400] = ff000000
	stwa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000019
!	%l1 = 0000000000003039, imm = 0000000000000c04, %l6 = 00000000000000ff
	addc	%l1,0xc04,%l6		! %l6 = 0000000000003c3d
!	%l4 = 00000000, %l5 = 00000019, Mem[0000000010181400] = ff250070 00000031
	std	%l4,[%i6+%g0]		! Mem[0000000010181400] = 00000000 00000019
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 39000000, %l5 = 0000000000000019
	lduha	[%i2+%o4]0x81,%l5	! %l5 = 0000000000003900

p0_label_379:
!	Mem[00000000300c1410] = ff000000, %l3 = 0000000000ff80c5
	lduba	[%i3+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041408] = 0000000000000000, %f6  = 00000000 00000000
	ldda	[%i1+%o4]0x88,%f6 	! %f6  = 00000000 00000000
!	Mem[0000000010041410] = 00000000, %f24 = 25000000
	ld	[%i1+%o5],%f24	! %f24 = 00000000
!	Mem[00000000201c0000] = 09ff826e, %l6 = 0000000000003c3d
	ldub	[%o0+%g0],%l6		! %l6 = 0000000000000009
!	Mem[0000000030181410] = 00000019, %l6 = 0000000000000009
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000019
!	Mem[0000000010141418] = 00000000, %l6 = 0000000000000019
	lduwa	[%i5+0x018]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 0000f0c1, %l2 = 00000000000000ff
	ldsw	[%i2+%o4],%l2		! %l2 = 000000000000f0c1
!	Mem[0000000030041408] = 00ff80c500000000, %f18 = 00ff80c5 00000000
	ldda	[%i1+%o4]0x81,%f18	! %f18 = 00ff80c5 00000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00003900, Mem[0000000010001400] = ffff0000 000000ff
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 00003900

p0_label_380:
!	%l0 = ed3f0000, %l1 = 00003039, Mem[0000000030181400] = ff7c3039 ff000000
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = ed3f0000 00003039
!	Mem[0000000030001408] = 00000000, %l2 = 000000000000f0c1
	swapa	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010081408] = c1f00000 5e3c5d31
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 000000ff
!	Mem[000000001014140b] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i5+0x00b]%asi,%l7	! %l7 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010041415] = 00000080, %asi = 80
	stba	%l3,[%i1+0x015]%asi	! Mem[0000000010041414] = 00ff0080
!	%l4 = 0000000000000000, %l2 = 0000000000000000, %y  = 00000000
	umul	%l4,%l2,%l4		! %l4 = 0000000000000000, %y = 00000000
!	%f28 = 00000000 00000000, Mem[0000000030041408] = c580ff00 00000000
	stda	%f28,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 00000000
!	%f19 = 00000000, %f4  = 00000000, %f10 = a27f370c
	fdivs	%f19,%f4 ,%f10		! %f10 = 7fffffff
!	Code Fragment 4
p0_fragment_26:
!	%l0 = 00000000ed3f0000
	setx	0xc4183b8fb36ad492,%g7,%l0 ! %l0 = c4183b8fb36ad492
!	%l1 = 0000000000003039
	setx	0x8e985c1feb014a2e,%g7,%l1 ! %l1 = 8e985c1feb014a2e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c4183b8fb36ad492
	setx	0xa8811ea79bebdf14,%g7,%l0 ! %l0 = a8811ea79bebdf14
!	%l1 = 8e985c1feb014a2e
	setx	0x0215ed67e4368b16,%g7,%l1 ! %l1 = 0215ed67e4368b16
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 000000a0, %l0 = a8811ea79bebdf14
	lduha	[%i1+0x032]%asi,%l0	! %l0 = 00000000000000a0

p0_label_381:
!	Mem[00000000100c1420] = b4e5a795000000ff, %l4 = 0000000000000000
	ldxa	[%i3+0x020]%asi,%l4	! %l4 = b4e5a795000000ff
!	Mem[000000001008140c] = ff000000, %l3 = 00000000000000ff
	ldsha	[%i2+0x00c]%asi,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030041400] = 39307cff, %f21 = 00000025
	lda	[%i1+%g0]0x89,%f21	! %f21 = 39307cff
!	Mem[0000000030081408] = 00000039, %l4 = b4e5a795000000ff
	ldswa	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000039
!	Code Fragment 4
p0_fragment_27:
!	%l0 = 00000000000000a0
	setx	0x9cbcd85fc4b4ed4d,%g7,%l0 ! %l0 = 9cbcd85fc4b4ed4d
!	%l1 = 0215ed67e4368b16
	setx	0xc47088a81b26f06d,%g7,%l1 ! %l1 = c47088a81b26f06d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9cbcd85fc4b4ed4d
	setx	0x65c51e47900900fa,%g7,%l0 ! %l0 = 65c51e47900900fa
!	%l1 = c47088a81b26f06d
	setx	0x0cb4750fa6bbadea,%g7,%l1 ! %l1 = 0cb4750fa6bbadea
!	Mem[0000000010101400] = 00000025, %l1 = 0cb4750fa6bbadea
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000025
!	Mem[00000000100c1408] = ff000000, %l6 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010181400] = 00000000, %f21 = 39307cff
	lda	[%i6+%g0]0x88,%f21	! %f21 = 00000000
!	Mem[000000001008143c] = 000000ff, %f3  = 7abaad19
	lda	[%i2+0x03c]%asi,%f3 	! %f3 = 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 00003fed, %l2 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l2	! %l2 = 0000000000003fed

p0_label_382:
!	%f8  = 000000ff f00000ff, Mem[0000000010041430] = 000000a0 00000000
	stda	%f8 ,[%i1+0x030]%asi	! Mem[0000000010041430] = 000000ff f00000ff
!	%l4 = 00000039, %l5 = 00003900, Mem[0000000030101400] = 00000025 0000ffff
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000039 00003900
!	Mem[0000000010081410] = 67ffff00, %l0 = 65c51e47900900fa, %asi = 80
	swapa	[%i2+0x010]%asi,%l0	! %l0 = 0000000067ffff00
!	Mem[0000000010181410] = 00000000, %l3 = ffffffffffffff00
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l6 = 0000ff00, %l7 = 00000000, Mem[0000000010101400] = 00000025 0000ffff
	stda	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000ff00 00000000
!	%f4  = 00000000 00000000, Mem[00000000300c1400] = 00000019 000000ff
	stda	%f4 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 00000000
!	Mem[0000000010141400] = 00003fed, %l0 = 0000000067ffff00
	ldstuba	[%i5+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%f30 = 39307cef 00000000, %l6 = 000000000000ff00
!	Mem[00000000100c1400] = ff0003ff000000f3
	stda	%f30,[%i3+%l6]ASI_PST8_P ! Mem[00000000100c1400] = ff0003ff000000f3
!	%f20 = 700025ff 00000000, Mem[0000000030081408] = 00000039 00000000
	stda	%f20,[%i2+%o4]0x89	! Mem[0000000030081408] = 700025ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = fffffa80, %l4 = 0000000000000039
	lduba	[%o3+0x000]%asi,%l4	! %l4 = 00000000000000ff

p0_label_383:
!	Mem[00000000300c1410] = ff000000, %l3 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1400] = f3000000 ff0300ff, %l0 = 00000000, %l1 = 00000025
	ldda	[%i3+%g0]0x88,%l0	! %l0 = 00000000ff0300ff 00000000f3000000
	membar	#Sync			! Added by membar checker (77)
!	Mem[00000000100c1400] = ff0003ff 000000f3 ff000000 00000000
!	Mem[00000000100c1410] = 25000000 ffff0000 b64f17cc ef7c3039
!	Mem[00000000100c1420] = b4e5a795 000000ff d8f1ffd7 ffffffe3
!	Mem[00000000100c1430] = fffeb51a fffeb51a 00003039 9d000000
	ldda	[%i3]ASI_BLK_AIUP,%f0	! Block Load from 00000000100c1400
!	Mem[0000000010001410] = 00001e00, %l3 = 00000000000000ff
	lduha	[%i0+0x012]%asi,%l3	! %l3 = 0000000000001e00
!	Mem[0000000010181438] = 000000ff, %l2 = 0000000000003fed
	ldsb	[%i6+0x039],%l2		! %l2 = 0000000000000000
!	%l7 = 0000000000000000, imm = 00000000000006bf, %l7 = 0000000000000000
	addc	%l7,0x6bf,%l7		! %l7 = 00000000000006bf
!	Mem[0000000030141400] = 00000000, %l0 = 00000000ff0300ff
	ldsha	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = c1f000ff, %l5 = 0000000000003900
	ldsha	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041400] = 000000ff 39307cff, %l2 = 00000000, %l3 = 00001e00
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 0000000039307cff 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ff000000, %l3 = 00000000000000ff
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 00000000ff000000

p0_label_384:
!	%f18 = 00ff80c5 00000000, Mem[0000000010141400] = ed3f00ff 25000000
	stda	%f18,[%i5+%g0]0x88	! Mem[0000000010141400] = 00ff80c5 00000000
!	%l5 = 00000000000000ff, Mem[0000000010181408] = d494ffff
	stha	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = d49400ff
!	%l6 = 000000000000ff00, Mem[0000000030141410] = 00000000
	stwa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000ff00
!	Mem[0000000010101408] = 00000000, %l3 = 00000000ff000000
	swap	[%i4+%o4],%l3		! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 00ff7001, %l7 = 00000000000006bf
	ldstub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010001430] = 0000303900000067, %l4 = 00000000000000ff, %l0 = 0000000000000000
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = 0000303900000067
!	%f20 = 700025ff 00000000, Mem[00000000300c1408] = ff0300ff 5e3c5d31
	stda	%f20,[%i3+%o4]0x89	! Mem[00000000300c1408] = 700025ff 00000000
!	%f22 = 00000000 00000000, Mem[0000000030141400] = 00000000 00000000
	stda	%f22,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 00000000
	membar	#Sync			! Added by membar checker (78)
!	%l6 = 0000ff00, %l7 = 00000000, Mem[00000000100c1400] = ff0003ff 000000f3
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000ff00 00000000
!	Starting 10 instruction Load Burst
!	%l2 = 0000000039307cff, %l3 = 0000000000000000, %y  = 00000000
	umul	%l2,%l3,%l7		! %l7 = 0000000000000000, %y = 00000000

p0_label_385:
!	Mem[0000000030141400] = 00000000, %l3 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = ffff7001, %l5 = 00000000000000ff
	ldsb	[%o2+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010101408] = ff00000000000000, %f24 = 00000000 ffff0000
	ldd	[%i4+%o4],%f24		! %f24 = ff000000 00000000
!	Mem[00000000100c1430] = fffeb51a fffeb51a, %l4 = 000000ff, %l5 = ffffffff
	ldd	[%i3+0x030],%l4		! %l4 = 00000000fffeb51a 00000000fffeb51a
!	Mem[0000000010141424] = 000000ff, %l5 = 00000000fffeb51a
	lduwa	[%i5+0x024]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = 09ff826e, %l5 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 00000000000009ff
!	Mem[00000000201c0000] = 09ff826e, %l6 = 000000000000ff00
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000009
!	Mem[0000000010081400] = 00003fed, %f4  = 25000000
	lda	[%i2+%g0]0x88,%f4 	! %f4 = 00003fed
!	Mem[0000000010001410] = 00001e00, %l7 = 0000000000000000
	lduba	[%i0+0x013]%asi,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000009, Mem[00000000100c1410] = 00000025
	stha	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000009

p0_label_386:
!	Mem[0000000030041400] = 39307cff, %l6 = 0000000000000009
	swapa	[%i1+%g0]0x89,%l6	! %l6 = 0000000039307cff
!	Mem[0000000010101408] = ff000000, %l4 = 00000000fffeb51a
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	%f26 = 80000000 00000000, %l3 = 0000000000000000
!	Mem[0000000010101410] = ff00003900000000
	add	%i4,0x010,%g1
	stda	%f26,[%g1+%l3]ASI_PST8_P ! Mem[0000000010101410] = ff00003900000000
!	%l3 = 0000000000000000, Mem[0000000030141410] = 0000ff00
	stwa	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%f8  = b4e5a795 000000ff, Mem[0000000010001410] = 00001e00 67ff94d4
	std	%f8 ,[%i0+%o5]	! Mem[0000000010001410] = b4e5a795 000000ff
!	Mem[0000000030141410] = 00000000, %l1 = 00000000f3000000
	swapa	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010141408] = ff0000ff
	stwa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%l4 = ff000000, %l5 = 000009ff, Mem[0000000010141400] = 00000000 c580ff00
	stda	%l4,[%i5+0x000]%asi	! Mem[0000000010141400] = ff000000 000009ff
!	%l7 = 0000000000000000, imm = 0000000000000c38, %l6 = 0000000039307cff
	add	%l7,0xc38,%l6		! %l6 = 0000000000000c38
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 09ff826e, %l0 = 0000303900000067
	ldsh	[%o0+%g0],%l0		! %l0 = 00000000000009ff

p0_label_387:
!	Mem[0000000010181410] = ff000000, %l4 = 00000000ff000000
	lduwa	[%i6+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1408] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = 00000019, %l6 = 0000000000000c38
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000019
!	Mem[0000000030101408] = ff0000ff, %l6 = 0000000000000019
	ldswa	[%i4+%o4]0x89,%l6	! %l6 = ffffffffff0000ff
!	Mem[00000000100c1428] = d8f1ffd7 ffffffe3, %l0 = 000009ff, %l1 = 00000000
	ldda	[%i3+0x028]%asi,%l0	! %l0 = 00000000d8f1ffd7 00000000ffffffe3
!	Mem[0000000030101408] = ff0000ff, %l2 = 0000000039307cff
	ldsba	[%i4+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181428] = d8f1ffd7, %f12 = fffeb51a
	lda	[%i6+0x028]%asi,%f12	! %f12 = d8f1ffd7
!	Mem[0000000010001424] = 700025f9, %l4 = 00000000ff000000
	ldswa	[%i0+0x024]%asi,%l4	! %l4 = 00000000700025f9
!	Mem[00000000100c1400] = 0000ff00, %l0 = 00000000d8f1ffd7
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000010181410] = ff000000
	stha	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = ffff0000

p0_label_388:
!	Mem[0000000010101400] = 00ff000000000000, %l2 = ffffffffffffffff, %l4 = 00000000700025f9
	casxa	[%i4]0x80,%l2,%l4	! %l4 = 00ff000000000000
!	%l7 = 0000000000000000, Mem[0000000030181410] = 0000000000000019
	stxa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000000
!	Mem[0000000010101408] = fffeb51a00000000, %l7 = 0000000000000000, %l6 = ffffffffff0000ff
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = fffeb51a00000000
!	Mem[0000000010101428] = a27f370c, %l7 = 0000000000000000
	swap	[%i4+0x028],%l7		! %l7 = 00000000a27f370c
!	Mem[00000000300c1408] = 00000000, %l2 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%f1  = 000000f3, Mem[0000000030101400] = 00000039
	sta	%f1 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000f3
!	%l3 = 00000000000000ff, Mem[0000000020800040] = ffffcbdb
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 00ffcbdb
!	%l2 = 0000000000000000, Mem[0000000030101410] = 00000000
	stwa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%f18 = 00ff80c5 00000000, Mem[00000000300c1408] = ff000000 ff250070
	stda	%f18,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ff80c5 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000c580ff00, %l3 = 00000000000000ff
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = 00000000c580ff00

p0_label_389:
!	%f16 = ff7ae5ff, %f20 = 700025ff
	fcmps	%fcc2,%f16,%f20		! %fcc2 = 1
!	Mem[0000000030041408] = 00000000, %l0 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%l6 = fffeb51a00000000, %l7 = 00000000a27f370c, %l4 = 00ff000000000000
	subc	%l6,%l7,%l4		! %l4 = fffeb5195d80c8f4
!	Mem[0000000030041408] = 00000000, %l4 = fffeb5195d80c8f4
	ldsba	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = ffffffb5, %l4 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l4	! %l4 = ffffffffffffffb5
!	Mem[0000000030081408] = 00000000, %l0 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = c580ff00, %l0 = 0000000000000000
	ldsha	[%i6+%o4]0x89,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030081408] = 00000000, %l3 = 00000000c580ff00
	lduba	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = ff0094d4, %l5 = 00000000000009ff
	lduh	[%i6+%o4],%l5		! %l5 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00000000, %l0 = ffffffffffffff00
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_390:
!	%l1 = 00000000ffffffe3, Mem[0000000030141400] = 00000000
	stwa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffe3
!	Mem[0000000010001400] = 00000000, %l1 = 00000000ffffffe3
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081425] = 95a700b4, %l4 = ffffffffffffffb5
	ldstuba	[%i2+0x025]%asi,%l4	! %l4 = 000000a7000000ff
!	%f11 = ffffffe3, %f10 = d8f1ffd7, %f12 = d8f1ffd7
	fmuls	%f11,%f10,%f12		! %f12 = ffffffe3
!	Mem[00000000211c0001] = ffff7001, %l5 = 000000000000ff00
	ldstub	[%o2+0x001],%l5		! %l5 = 000000ff000000ff
!	%f24 = ff000000 00000000, %l1 = 0000000000000000
!	Mem[0000000030101438] = 7cef00a01870ffff
	add	%i4,0x038,%g1
	stda	%f24,[%g1+%l1]ASI_PST8_S ! Mem[0000000030101438] = 7cef00a01870ffff
!	%f18 = 00ff80c5 00000000, Mem[0000000010141408] = 00000000 ff0000ff
	stda	%f18,[%i5+%o4]0x88	! Mem[0000000010141408] = 00ff80c5 00000000
!	Mem[0000000030101408] = ff0000ff, %l7 = 00000000a27f370c
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l4 = 00000000000000a7, Mem[0000000010081410] = 900900fa
	stwa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000a7
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000009, %l0 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000009

p0_label_391:
!	Mem[0000000010141424] = 000000ff, %l0 = 0000000000000009
	lduba	[%i5+0x024]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = ff000000000009ff, %f2  = ff000000 00000000
	ldda	[%i5+%g0]0x80,%f2 	! %f2  = ff000000 000009ff
!	Mem[0000000030181408] = 00ff80c5, %l1 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101400] = f3000000, %l7 = 00000000000000ff
	ldsba	[%i4+%g0]0x81,%l7	! %l7 = fffffffffffffff3
!	Mem[0000000030001408] = 0000f0c1, %l2 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l2	! %l2 = 000000000000f0c1
!	Mem[00000000100c140c] = 00000000, %l4 = 00000000000000a7
	ldsh	[%i3+0x00c],%l4		! %l4 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l4 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = ffff0000, %l7 = fffffffffffffff3
	lduha	[%i6+%o5]0x80,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010101400] = 0000ff00, %l4 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l7 = 000000000000ffff
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_392:
!	%l3 = 0000000000000000, Mem[0000000020800001] = ffff8ed8
	stb	%l3,[%o1+0x001]		! Mem[0000000020800000] = ff008ed8
!	Mem[00000000300c1410] = ff000000, %l1 = 00000000000000ff
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 00000000ff000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010041410] = 00000000 8000ff00
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 00000000
!	%l4 = 000000000000ff00, Mem[0000000030141400] = 00000000ffffffe3
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000000000ff00
!	Mem[0000000010181410] = 0000ffff, %l5 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000100c1438] = 000030399d000000, %l7 = 0000000000000000, %l0 = 0000000000000000
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 000030399d000000
!	Mem[0000000010181408] = ff0094d4, %l5 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010001400] = ffffffe3
	stwa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff
!	%l1 = 00000000ff000000, Mem[0000000010101430] = ff7ae5ff, %asi = 80
	stwa	%l1,[%i4+0x030]%asi	! Mem[0000000010101430] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = 0000ff00 e0000000, %l6 = 00000000, %l7 = 00000000
	ldd	[%i2+0x018],%l6		! %l6 = 000000000000ff00 00000000e0000000

p0_label_393:
!	Mem[0000000030081410] = ff00f0c139300000, %l0 = 000030399d000000
	ldxa	[%i2+%o5]0x81,%l0	! %l0 = ff00f0c139300000
!	Mem[000000001014143c] = a000ef7c, %l6 = 000000000000ff00
	lduba	[%i5+0x03d]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 000000ff00003900, %l4 = 000000000000ff00
	ldxa	[%i0+%g0]0x80,%l4	! %l4 = 000000ff00003900
!	Mem[0000000020800040] = 00ffcbdb, %l7 = 00000000e0000000
	ldsba	[%o1+0x040]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %f7  = ef7c3039
	lda	[%i2+%o4]0x88,%f7 	! %f7 = 00000000
!	Mem[0000000010001400] = ff000000, %l1 = 00000000ff000000
	lduba	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = ff000039, %l5 = 00000000000000ff
	ldswa	[%i4+%o5]0x80,%l5	! %l5 = ffffffffff000039
!	Mem[00000000100c1408] = 000000ff, %l0 = ff00f0c139300000
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081408] = 700025ff 00000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000 00000000700025ff
!	Starting 10 instruction Store Burst
!	%f9  = 000000ff, Mem[0000000030041410] = 00000000
	sta	%f9 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff

p0_label_394:
!	Mem[0000000010101400] = 00ff0000, %l1 = 00000000700025ff
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 0000000000ff0000
!	Mem[00000000300c1408] = c580ff00, %l3 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l1 = 0000000000ff0000
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081400] = 00003fed, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 0000000000003fed
!	%l5 = ffffffffff000039, Mem[0000000010081400] = 00000000
	stwa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000039
!	%f27 = 00000000, %f2  = ff000000, %f8  = b4e5a795
	fmuls	%f27,%f2 ,%f8 		! %f8  = 80000000
!	%f30 = 39307cef 00000000, Mem[0000000010141400] = ff000000 000009ff
	stda	%f30,[%i5+%g0]0x80	! Mem[0000000010141400] = 39307cef 00000000
!	%l7 = 0000000000000000, Mem[0000000010181400] = 0000000000000019
	stx	%l7,[%i6+%g0]		! Mem[0000000010181400] = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030101408] = ff0000ff
	stha	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00ff0000, %l3 = 0000000000003fed
	lduba	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_395:
!	Mem[00000000100c1410] = 09000000ffff0000, %l1 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = 09000000ffff0000
!	Mem[0000000010041408] = 00000000, %l6 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = ef7c3039, %l2 = 000000000000f0c1
	lduba	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000039
!	Mem[0000000030141408] = 00000080, %l3 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000080
!	Mem[0000000010041408] = 00000000, %l1 = 09000000ffff0000
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 00ff80c5, %f14 = 00003039
	lda	[%i6+%o4]0x81,%f14	! %f14 = 00ff80c5
!	Mem[00000000100c1408] = 000000ff, %l2 = 0000000000000039
	lduha	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = ff250070, %l7 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000070
!	Mem[0000000010101410] = ff000039, %l3 = 0000000000000080
	lduba	[%i4+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f6  = b64f17cc 00000000, Mem[00000000100c1410] = 00000009 0000ffff
	stda	%f6 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = b64f17cc 00000000

p0_label_396:
!	%l3 = 00000000000000ff, Mem[00000000211c0000] = ffff7001, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff7001
!	%f20 = 700025ff, Mem[0000000010101410] = ff000039
	st	%f20,[%i4+%o5]		! Mem[0000000010101410] = 700025ff
!	%f11 = ffffffe3, Mem[0000000030041408] = 00000000
	sta	%f11,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffe3
!	%f21 = 00000000, Mem[0000000010101408] = fffeb51a
	sta	%f21,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%f7  = 00000000, Mem[0000000010001410] = b4e5a795
	sta	%f7 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	Mem[0000000010041438] = f92700d8, %l5 = ff000039, %l3 = 000000ff
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 00000000f92700d8
!	%l0 = 0000000000000000, Mem[0000000010001420] = ff000000700025f9
	stx	%l0,[%i0+0x020]		! Mem[0000000010001420] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010101408] = 00000000
	stha	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%f18 = 00ff80c5, Mem[0000000030001410] = ef7c30ff
	sta	%f18,[%i0+%o5]0x89	! Mem[0000000030001410] = 00ff80c5
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = 00000000, %l4 = 000000ff00003900
	ldsba	[%i0+0x03a]%asi,%l4	! %l4 = 0000000000000000

p0_label_397:
!	Mem[0000000010181408] = d49400ff, %l0 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001400] = ffffffb5, %l5 = ffffffffff000039
	ldswa	[%i0+%g0]0x89,%l5	! %l5 = ffffffffffffffb5
!	Mem[0000000010101400] = ff250070, %f3  = 000009ff
	lda	[%i4+%g0]0x88,%f3 	! %f3 = ff250070
!	Mem[0000000010041410] = 0000000000000000, %l7 = 0000000000000070
	ldxa	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1434] = fffeb51a, %l4 = 0000000000000000
	ldsb	[%i3+0x037],%l4		! %l4 = 000000000000001a
!	Mem[0000000010181408] = d49400ff, %l6 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001428] = 00000000, %l6 = ffffffffffffffff
	lduwa	[%i0+0x028]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 00000000000000ff, %f20 = 700025ff 00000000
	ldda	[%i3+%g0]0x89,%f20	! %f20 = 00000000 000000ff
!	Mem[0000000010001410] = 00000000, %l3 = 00000000f92700d8
	ldsha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = ffffffe3 fffeb51a, Mem[0000000010181408] = ff0094d4 ffffffff
	stda	%f12,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffe3 fffeb51a

p0_label_398:
!	%l7 = 0000000000000000, Mem[0000000010081400] = ff000039ff000000
	stxa	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000
!	Mem[000000001008143c] = 000000ff, %l5 = ffffffb5, %l3 = 00000000
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 00000000000000ff
!	%f13 = fffeb51a, Mem[0000000010141424] = 000000ff
	sta	%f13,[%i5+0x024]%asi	! Mem[0000000010141424] = fffeb51a
!	Mem[0000000010041408] = 00000000, %l2 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010081408] = 00000000 ff000000
	std	%l6,[%i2+%o4]		! Mem[0000000010081408] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000010101400] = ff250070
	stba	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = ff250000
!	Mem[0000000010101434] = cc174fb6, %l1 = 00000000, %l4 = 0000001a
	add	%i4,0x34,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000cc174fb6
!	%l0 = ffffffffffffffff, Mem[00000000100c1408] = ff000000
	stha	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffff0000
!	%l7 = 0000000000000000, Mem[0000000010181429] = d8f1ffd7
	stb	%l7,[%i6+0x029]		! Mem[0000000010181428] = d800ffd7
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00ff80c5, %f31 = 00000000
	lda	[%i6+%o4]0x81,%f31	! %f31 = 00ff80c5

p0_label_399:
!	Code Fragment 4
p0_fragment_28:
!	%l0 = ffffffffffffffff
	setx	0x929598d0561cfdb3,%g7,%l0 ! %l0 = 929598d0561cfdb3
!	%l1 = 0000000000000000
	setx	0x708b29905b75e57e,%g7,%l1 ! %l1 = 708b29905b75e57e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 929598d0561cfdb3
	setx	0x785b55e78bc576c6,%g7,%l0 ! %l0 = 785b55e78bc576c6
!	%l1 = 708b29905b75e57e
	setx	0xdd9d0e6008336b68,%g7,%l1 ! %l1 = dd9d0e6008336b68
!	Mem[000000001014142c] = 0c377fa2, %f17 = cc174fb6
	ld	[%i5+0x02c],%f17	! %f17 = 0c377fa2
!	Mem[000000001014143c] = a000ef7c, %l5 = ffffffffffffffb5
	ldsh	[%i5+0x03c],%l5		! %l5 = ffffffffffffa000
!	%l5 = ffffffffffffa000, imm = 0000000000000f53, %l1 = dd9d0e6008336b68
	orn	%l5,0xf53,%l1		! %l1 = fffffffffffff0ac
!	Mem[0000000010081410] = a7000000, %l4 = 00000000cc174fb6
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = e3ffffff, %f27 = 00000000
	lda	[%i1+%o4]0x89,%f27	! %f27 = e3ffffff
!	Code Fragment 3
p0_fragment_29:
!	%l0 = 785b55e78bc576c6
	setx	0x8b1dab483201a05f,%g7,%l0 ! %l0 = 8b1dab483201a05f
!	%l1 = fffffffffffff0ac
	setx	0x3ada66283cb62c8f,%g7,%l1 ! %l1 = 3ada66283cb62c8f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8b1dab483201a05f
	setx	0x2fdbf64f9fc8f4e4,%g7,%l0 ! %l0 = 2fdbf64f9fc8f4e4
!	%l1 = 3ada66283cb62c8f
	setx	0x30dfa2806cd8a9f9,%g7,%l1 ! %l1 = 30dfa2806cd8a9f9
!	Mem[0000000010141400] = ef7c3039, %l1 = 30dfa2806cd8a9f9
	lduha	[%i5+%g0]0x88,%l1	! %l1 = 0000000000003039
!	Mem[0000000010041400] = 700025ff, %l2 = 0000000000000000
	ldsha	[%i1+%g0]0x88,%l2	! %l2 = 00000000000025ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = ff250070, %l5 = ffffffffffffa000
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ff250070

p0_label_400:
!	Mem[00000000201c0001] = 09ff826e, %l2 = 00000000000025ff
	ldstub	[%o0+0x001],%l2		! %l2 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[00000000100c142e] = ffffffe3, %asi = 80
	stha	%l7,[%i3+0x02e]%asi	! Mem[00000000100c142c] = ffff0000
!	Mem[0000000030181410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%f0  = ff0003ff 000000f3 ff000000 ff250070
!	%f4  = 00003fed ffff0000 b64f17cc 00000000
!	%f8  = 80000000 000000ff d8f1ffd7 ffffffe3
!	%f12 = ffffffe3 fffeb51a 00ff80c5 9d000000
	stda	%f0,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	%f22 = 00000000 00000000, %l6 = 0000000000000000
!	Mem[00000000100c1418] = b64f17ccef7c3039
	add	%i3,0x018,%g1
	stda	%f22,[%g1+%l6]ASI_PST16_P ! Mem[00000000100c1418] = b64f17ccef7c3039
!	%l7 = 0000000000000000, Mem[0000000030101400] = f3000000
	stha	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%f18 = 00ff80c5 00000000, Mem[0000000010141410] = ff000000 00000000
	stda	%f18,[%i5+%o5]0x80	! Mem[0000000010141410] = 00ff80c5 00000000
!	Mem[0000000010001410] = 00000000, %l5 = 00000000ff250070
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101420] = ff000000, %l7 = 0000000000000000
	ldstub	[%i4+0x020],%l7		! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = b5ffffff25000000, %l3 = 00000000000000ff
	ldxa	[%i0+%g0]0x81,%l3	! %l3 = b5ffffff25000000

p0_label_401:
!	Mem[0000000010101428] = 00000000, %l3 = b5ffffff25000000
	ldsha	[%i4+0x028]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = ff00f0c139300000, %f30 = 39307cef 00ff80c5
	ldda	[%i2+%o5]0x81,%f30	! %f30 = ff00f0c1 39300000
!	Mem[0000000030181410] = 000000ff, %l0 = 2fdbf64f9fc8f4e4
	lduba	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181410] = 0000ffff, %l1 = 0000000000003039
	lduba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101438] = 7cef00a00000a27e, %f24 = ff000000 00000000
	ldd	[%i4+0x038],%f24	! %f24 = 7cef00a0 0000a27e
!	Mem[0000000010101400] = ff250000, %l7 = 00000000000000ff
	ldswa	[%i4+%g0]0x88,%l7	! %l7 = ffffffffff250000
!	Mem[00000000100c1408] = ffff0000, %l2 = 00000000000000ff
	ldswa	[%i3+%o4]0x80,%l2	! %l2 = ffffffffffff0000
!	Mem[0000000010041400] = 00a0ffff, %l1 = 00000000000000ff
	lduwa	[%i1+%g0]0x88,%l1	! %l1 = 0000000000a0ffff
!	Mem[0000000030181410] = ff00000000000000, %f16 = ff7ae5ff 0c377fa2
	ldda	[%i6+%o5]0x81,%f16	! %f16 = ff000000 00000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (79)
!	Mem[0000000010141400] = ef7c3039, %l0 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l0	! %l0 = 00000039000000ff

p0_label_402:
!	%l2 = ffffffffffff0000, imm = 00000000000002e7, %l7 = ffffffffff250000
	sub	%l2,0x2e7,%l7		! %l7 = fffffffffffefd19
!	%l3 = 0000000000000000, Mem[0000000030041410] = ff000000
	stba	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	Mem[0000000010141400] = ef7c30ff, %l4 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l4	! %l4 = 00000000ef7c30ff
!	%l0 = 0000000000000039, Mem[0000000010081423] = ff0300ff, %asi = 80
	stba	%l0,[%i2+0x023]%asi	! Mem[0000000010081420] = ff030039
!	Mem[0000000020800041] = 00ffcbdb, %l4 = 00000000ef7c30ff
	ldstub	[%o1+0x041],%l4		! %l4 = 000000ff000000ff
!	Mem[000000001000141c] = ffff0000, %l2 = ffffffffffff0000
	swap	[%i0+0x01c],%l2		! %l2 = 00000000ffff0000
!	Mem[0000000030081408] = 00000000, %l1 = 0000000000a0ffff
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010041400] = 0000000000a0ffff
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000
!	%l4 = 00000000000000ff, imm = 00000000000000ab, %l2 = 00000000ffff0000
	and	%l4,0x0ab,%l2		! %l2 = 00000000000000ab
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %f8  = 80000000
	lda	[%i3+%o5]0x88,%f8 	! %f8 = 00000000

p0_label_403:
!	Mem[0000000030101410] = 000000ff, %l3 = 0000000000000000
	lduha	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001400] = ff000000, %l6 = 0000000000000000
	lduwa	[%i0+%g0]0x88,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030141408] = 000000ff, %l2 = 00000000000000ab
	lduwa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = ff000000, %l6 = 00000000ff000000
	ldsba	[%i3+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Code Fragment 3
p0_fragment_30:
!	%l0 = 0000000000000039
	setx	0xfc9f6de841a22ef5,%g7,%l0 ! %l0 = fc9f6de841a22ef5
!	%l1 = 0000000000000000
	setx	0xb9981ad01f442bda,%g7,%l1 ! %l1 = b9981ad01f442bda
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fc9f6de841a22ef5
	setx	0x8a5c3da7bb62a578,%g7,%l0 ! %l0 = 8a5c3da7bb62a578
!	%l1 = b9981ad01f442bda
	setx	0xd9501fafadac04ce,%g7,%l1 ! %l1 = d9501fafadac04ce
!	Mem[0000000010181408] = ffffffe3fffeb51a, %l1 = d9501fafadac04ce
	ldxa	[%i6+%o4]0x80,%l1	! %l1 = ffffffe3fffeb51a
!	Mem[0000000030141408] = 000000ff, %l4 = 00000000000000ff
	ldswa	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181410] = 000000250000ffff, %f12 = ffffffe3 fffeb51a
	ldda	[%i6+%o5]0x88,%f12	! %f12 = 00000025 0000ffff
!	%l5 = 0000000000000000, imm = 000000000000040a, %l5 = 0000000000000000
	orn	%l5,0x40a,%l5		! %l5 = fffffffffffffbf5
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[00000000201c0000] = 09ff826e
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 00ff826e

p0_label_404:
!	%f18 = 00ff80c5 00000000, %l3 = 00000000000000ff
!	Mem[0000000030001418] = ffbb80c5700025f9
	add	%i0,0x018,%g1
	stda	%f18,[%g1+%l3]ASI_PST16_S ! Mem[0000000030001418] = 00ff80c500000000
!	%l7 = fffffffffffefd19, Mem[0000000030101410] = 000000ff
	stha	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000fd19
!	%l4 = 00000000000000ff, Mem[0000000010181410] = 0000ffff
	stba	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000ffff
!	%f28 = 00000000 00000000, %l2 = 00000000000000ff
!	Mem[0000000030001418] = 00ff80c500000000
	add	%i0,0x018,%g1
	stda	%f28,[%g1+%l2]ASI_PST32_S ! Mem[0000000030001418] = 0000000000000000
!	%f31 = 39300000, Mem[0000000010081408] = 00000000
	sta	%f31,[%i2+%o4]0x88	! Mem[0000000010081408] = 39300000
!	Mem[0000000030181410] = ff000000, %l0 = 8a5c3da7bb62a578
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%l2 = 00000000000000ff, %l4 = 00000000000000ff, %l3 = 00000000000000ff
	udivx	%l2,%l4,%l3		! %l3 = 0000000000000001
!	%l1 = ffffffe3fffeb51a, Mem[0000000030001408] = c1f00000
	stha	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = b51a0000
!	Mem[00000000300c1408] = c580ffff, %l0 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %l6 = ffffffffffffffff
	ldswa	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_405:
!	Mem[000000001018140c] = fffeb51a, %l7 = fffffffffffefd19
	ldsb	[%i6+0x00e],%l7		! %l7 = ffffffffffffffb5
!	Mem[00000000100c1408] = ffff000000000000, %f26 = 80000000 e3ffffff
	ldda	[%i3+%o4]0x80,%f26	! %f26 = ffff0000 00000000
!	Mem[0000000010101410] = 700025ff, %l4 = 00000000000000ff
	lduwa	[%i4+%o5]0x80,%l4	! %l4 = 00000000700025ff
!	Mem[0000000010041408] = 00000000ff000000, %l2 = 00000000000000ff
	ldxa	[%i1+%o4]0x88,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030081410] = ff00f0c1, %l2 = 00000000ff000000
	ldsba	[%i2+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141408] = 00000000, %l7 = ffffffffffffffb5
	lduha	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800040] = ffff34f9, %l4 = 00000000700025ff
	lduba	[%o3+0x040]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001418] = ff7f0000ffff0000, %l6 = 0000000000000000
	ldx	[%i0+0x018],%l6		! %l6 = ff7f0000ffff0000
!	Mem[00000000100c1400] = 0000ff00 00000000 ffff0000 00000000
!	Mem[00000000100c1410] = 00000000 cc174fb6 b64f17cc ef7c3039
!	Mem[00000000100c1420] = b4e5a795 000000ff d8f1ffd7 ffff0000
!	Mem[00000000100c1430] = fffeb51a fffeb51a 00003039 9d000000
	ldda	[%i3]ASI_BLK_AIUPL,%f16	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	%f2  = ff000000 ff250070, Mem[0000000010181410] = ffff0000 25000000
	stda	%f2 ,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000 ff250070

p0_label_406:
!	%l0 = 000000ff, %l1 = fffeb51a, Mem[0000000010001408] = 0000009d d494ff67
	stda	%l0,[%i0+0x008]%asi	! Mem[0000000010001408] = 000000ff fffeb51a
!	Mem[00000000300c1400] = 000000ff, %l2 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%l1 = ffffffe3fffeb51a, Mem[0000000010141410] = 00000000c580ff00
	stxa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffe3fffeb51a
!	Mem[00000000100c1410] = 00000000, %l1 = ffffffe3fffeb51a
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1414] = cc174fb6, %l2 = 000000ff, %l1 = 00000000
	add	%i3,0x14,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 00000000cc174fb6
!	%l6 = ff7f0000ffff0000, Mem[00000000211c0000] = 00ff7001, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff7001
!	%f2  = ff000000 ff250070, %l5 = fffffffffffffbf5
!	Mem[0000000030101408] = 000000ff000000ff
	add	%i4,0x008,%g1
	stda	%f2,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030101408] = 700025ff000000ff
!	%l5 = fffffffffffffbf5, Mem[0000000030101400] = 00000000
	stwa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = fffffbf5
!	Mem[0000000020800041] = 00ffcbdb, %l7 = 0000000000000000
	ldstub	[%o1+0x041],%l7		! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff000000ff250070, %f2  = ff000000 ff250070
	ldda	[%i4+%o4]0x89,%f2 	! %f2  = ff000000 ff250070

p0_label_407:
!	Mem[0000000010001408] = 000000ff, %l3 = 0000000000000001
	ldsba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 700025ff00000000, %l1 = 00000000cc174fb6
	ldxa	[%i4+%o5]0x80,%l1	! %l1 = 700025ff00000000
!	Mem[000000001010143c] = 0000a27e, %l3 = 0000000000000000
	ldswa	[%i4+0x03c]%asi,%l3	! %l3 = 000000000000a27e
!	Mem[0000000010101400] = ff250000, %l4 = 00000000000000ff
	lduwa	[%i4+%g0]0x88,%l4	! %l4 = 00000000ff250000
!	Mem[0000000010141424] = fffeb51a, %l4 = 00000000ff250000
	lduw	[%i5+0x024],%l4		! %l4 = 00000000fffeb51a
!	Mem[0000000010081408] = 0000303900000000, %f6  = b64f17cc 00000000
	ldda	[%i2+0x008]%asi,%f6 	! %f6  = 00003039 00000000
!	Mem[0000000030001408] = b51a0000641eeb41, %l6 = ff7f0000ffff0000
	ldxa	[%i0+%o4]0x81,%l6	! %l6 = b51a0000641eeb41
!	%l7 = 00000000000000ff, immd = 00000000000009f8, %l6  = b51a0000641eeb41
	mulx	%l7,0x9f8,%l6		! %l6 = 000000000009ee08
!	Mem[0000000010001400] = 000000ff, %l5 = fffffffffffffbf5
	lduha	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f1  = 000000f3, %f14 = 00ff80c5, %f3  = ff250070
	fadds	%f1 ,%f14,%f3 		! %l0 = 0000000000000121, Unfinished, %fsr = 0500000c00

p0_label_408:
!	%l5 = 0000000000000000, Mem[0000000010081408] = 00003039
	stba	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 00003039
!	Mem[00000000100c1410] = ff000000, %l2 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010181403] = 00000000, %l1 = 700025ff00000000
	ldstub	[%i6+0x003],%l1		! %l1 = 00000000000000ff
!	%l6 = 0009ee08, %l7 = 000000ff, Mem[0000000030101400] = f5fbffff 00390000
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 0009ee08 000000ff
!	Mem[0000000010181400] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[000000001010143e] = 0000a27e, %l7 = 00000000000000ff
	ldstub	[%i4+0x03e],%l7		! %l7 = 000000a2000000ff
!	Mem[00000000211c0000] = 00ff7001, %l7 = 00000000000000a2
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	%l3 = 000000000000a27e, Mem[0000000010101400] = 00000000ff250000
	stxa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000000000a27e
!	%l5 = 0000000000000000, Mem[0000000010001410] = 00000000
	stwa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000121, imm = fffffffffffff42a, %l7 = 0000000000000000
	addc	%l0,-0xbd6,%l7		! %l7 = fffffffffffff54b

p0_label_409:
!	%l6 = 000000000009ee08, %l6 = 000000000009ee08, %l5 = 0000000000000000
	orn	%l6,%l6,%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030081400] = f3000000, %l7 = fffffffffffff54b
	ldsba	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = ff000000 cc174fb6, %l2 = 000000ff, %l3 = 0000a27e
	ldd	[%i3+%o5],%l2		! %l2 = 00000000ff000000 00000000cc174fb6
!	Mem[0000000010181408] = ffffffe3fffeb51a, %l7 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l7	! %l7 = ffffffe3fffeb51a
!	Mem[0000000030181410] = ff000000, %f8  = 00000000
	lda	[%i6+%o5]0x81,%f8 	! %f8 = ff000000
!	Mem[0000000010101424] = f00000ff, %f8  = ff000000
	lda	[%i4+0x024]%asi,%f8 	! %f8 = f00000ff
!	Mem[0000000010081420] = ff030039 95ff00b4, %l2 = ff000000, %l3 = cc174fb6
	ldda	[%i2+0x020]%asi,%l2	! %l2 = 00000000ff030039 0000000095ff00b4
!	Mem[0000000030181400] = 00000000, %l6 = 000000000009ee08
	lduha	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = ffffffe3 fffeb51a, %l0 = 00000121, %l1 = 00000000
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 00000000ffffffe3 00000000fffeb51a
!	Starting 10 instruction Store Burst
!	%f24 = ff000000 95a7e5b4, Mem[0000000030181408] = 00ff80c5 00000000
	stda	%f24,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000 95a7e5b4

p0_label_410:
!	Mem[0000000030081410] = c1f000ff, %l7 = ffffffe3fffeb51a
	swapa	[%i2+%o5]0x89,%l7	! %l7 = 00000000c1f000ff
!	%l2 = 00000000ff030039, Mem[0000000030041410] = 0000000000000000
	stxa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000ff030039
!	%l0 = 00000000ffffffe3, Mem[0000000021800040] = ffff34f9, %asi = 80
	stba	%l0,[%o3+0x040]%asi	! Mem[0000000021800040] = e3ff34f9
!	Mem[00000000211c0001] = ffff7001, %l1 = 00000000fffeb51a
	ldstub	[%o2+0x001],%l1		! %l1 = 000000ff000000ff
!	Mem[0000000030141408] = ff000000, %l0 = 00000000ffffffe3
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[00000000100c141f] = ef7c3039, %l0 = 00000000ff000000
	ldstuba	[%i3+0x01f]%asi,%l0	! %l0 = 00000039000000ff
!	Mem[00000000100c142d] = ffff0000, %l1 = 00000000000000ff
	ldstub	[%i3+0x02d],%l1		! %l1 = 000000ff000000ff
!	%l4 = 00000000fffeb51a, Mem[0000000030001408] = 00001ab5
	stha	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000b51a
!	Mem[0000000030001410] = c580ff00, %l1 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 00000000c580ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffffffe3, %l3 = 0000000095ff00b4
	lduwa	[%i5+%o4]0x81,%l3	! %l3 = 00000000ffffffe3

p0_label_411:
!	Mem[000000001014143c] = a000ef7c, %f7  = 00000000
	ld	[%i5+0x03c],%f7 	! %f7 = a000ef7c
!	Mem[0000000030041408] = ffffffe300000000, %f30 = 0000009d 39300000
	ldda	[%i1+%o4]0x81,%f30	! %f30 = ffffffe3 00000000
!	Mem[0000000010001400] = 00390000ff000000, %f4  = 00003fed ffff0000
	ldda	[%i0+%g0]0x88,%f4 	! %f4  = 00390000 ff000000
!	Mem[0000000030141410] = ed3f0000, %l7 = 00000000c1f000ff
	lduba	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = ff0000ff, %l5 = ffffffffffffffff
	lduba	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181408] = 000000ff, %l0 = 0000000000000039
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081410] = a7000000, %f3  = ff250070
	lda	[%i2+%o5]0x88,%f3 	! %f3 = a7000000
!	Mem[00000000100c1428] = d8f1ffd7ffff0000, %l5 = 00000000000000ff
	ldxa	[%i3+0x028]%asi,%l5	! %l5 = d8f1ffd7ffff0000
	membar	#Sync			! Added by membar checker (80)
!	Mem[00000000300c1400] = ff000000 00000000 ffff80c5 00000000
!	Mem[00000000300c1410] = ff000000 315d3c5e 00000000 e0000000
!	Mem[00000000300c1420] = 00000000 000000e0 00000000 1e1f952c
!	Mem[00000000300c1430] = 00000000 00000000 39307cef 000000ff
	ldda	[%i3]ASI_BLK_SL,%f0	! Block Load from 00000000300c1400
!	Starting 10 instruction Store Burst
!	Mem[0000000021800101] = ffff4cdd, %l5 = d8f1ffd7ffff0000
	ldstub	[%o3+0x101],%l5		! %l5 = 000000ff000000ff

p0_label_412:
!	Mem[000000001004141f] = 0000ffff, %l4 = 00000000fffeb51a
	ldstuba	[%i1+0x01f]%asi,%l4	! %l4 = 000000ff000000ff
!	%f16 = 00000000, Mem[0000000010001408] = 000000ff
	st	%f16,[%i0+%o4]		! Mem[0000000010001408] = 00000000
!	%l2 = ff030039, %l3 = ffffffe3, Mem[0000000010141400] = 00000000 00000000
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = ff030039 ffffffe3
!	Mem[0000000030041400] = 00000009, %l3 = 00000000ffffffe3
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 00000009000000ff
!	%f27 = d7fff1d8, Mem[0000000010081408] = 00003039
	sta	%f27,[%i2+%o4]0x80	! Mem[0000000010081408] = d7fff1d8
!	Mem[0000000030001410] = ff000000, %l4 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 00000000ff000000
!	%l6 = 0000000000000000, immed = fffff612, %y  = 00000000
	udiv	%l6,-0x9ee,%l2		! %l2 = 0000000000000000
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000030081410] = fffeb51a, %l7 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l7	! %l7 = 00000000fffeb51a
!	%f28 = 1ab5feff 1ab5feff, Mem[0000000030141400] = ff0003ff 000000f3
	stda	%f28,[%i5+%g0]0x81	! Mem[0000000030141400] = 1ab5feff 1ab5feff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 700025ff, %l5 = 00000000000000ff
	lduha	[%i4+%o4]0x81,%l5	! %l5 = 0000000000007000

p0_label_413:
!	Mem[0000000010181408] = ffffffe3, %l4 = 00000000ff000000
	lduha	[%i6+%o4]0x80,%l4	! %l4 = 000000000000ffff
!	%l3 = 0000000000000009, %l5 = 0000000000007000, %l0 = 00000000000000ff
	sub	%l3,%l5,%l0		! %l0 = ffffffffffff9009
!	Mem[0000000010101410] = 700025ff, %l3 = 0000000000000009
	lduha	[%i4+0x010]%asi,%l3	! %l3 = 0000000000007000
!	Mem[0000000010081430] = 00000000, %l0 = ffffffffffff9009
	lduw	[%i2+0x030],%l0		! %l0 = 0000000000000000
!	%f16 = 00000000, %f16 = 00000000, %f26 = 0000ffff d7fff1d8
	fsmuld	%f16,%f16,%f26		! %f26 = 00000000 00000000
!	Mem[0000000030081410] = 00000000, %l0 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1438] = 00003039, %l5 = 0000000000007000
	lduha	[%i3+0x03a]%asi,%l5	! %l5 = 0000000000003039
!	Mem[0000000030081410] = 00000000, %l0 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = 000000a7, %l3 = 0000000000007000
	lduha	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = e3ffffff, %l4 = 000000000000ffff
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 00000000e3ffffff

p0_label_414:
!	Mem[0000000030141408] = 0000ffff, %l0 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%f22 = 39307cef cc174fb6, Mem[0000000030001408] = 0000b51a 41eb1e64
	stda	%f22,[%i0+%o4]0x89	! Mem[0000000030001408] = 39307cef cc174fb6
!	%l0 = 00000000000000ff, %l5 = 0000000000003039, %l5 = 0000000000003039
	subc	%l0,%l5,%l5		! %l5 = ffffffffffffd0c6
!	%l6 = 0000000000000000, Mem[0000000010081400] = 00000000
	stwa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%f27 = 00000000, Mem[0000000010001410] = 00000000
	sta	%f27,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[000000001008141c] = e0000000, %l5 = ffffffffffffd0c6, %asi = 80
	swapa	[%i2+0x01c]%asi,%l5	! %l5 = 00000000e0000000
!	%l4 = 00000000e3ffffff, Mem[0000000030141408] = ffff0000
	stwa	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = e3ffffff
!	%l3 = 0000000000000000, Mem[0000000030081408] = ff000000
	stha	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l4 = 00000000e3ffffff, Mem[0000000010001400] = ff000000
	stba	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000000000000000, %l7 = 00000000fffeb51a
	ldxa	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000

p0_label_415:
!	Mem[0000000030141410] = 0000ffffed3f0000, %l4 = 00000000e3ffffff
	ldxa	[%i5+%o5]0x89,%l4	! %l4 = 0000ffffed3f0000
!	Mem[0000000030141410] = ed3f0000, %l1 = 00000000c580ff00
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l2 = 0000000000000000, %l7 = 0000000000000000, %l7 = 0000000000000000
	addc	%l2,%l7,%l7		! %l7 = 0000000000000000
!	Mem[0000000010101400] = 7ea20000 00000000 00000000 00000000
!	Mem[0000000010101410] = 700025ff 00000000 f9250070 00ffbbff
!	Mem[0000000010101420] = ff000000 f00000ff 00000000 00000000
!	Mem[0000000010101430] = ff000000 cc174fb6 7cef00a0 0000ff7e
	ldda	[%i4]ASI_BLK_AIUP,%f0	! Block Load from 0000000010101400
!	Mem[0000000030101400] = 08ee0900, %l2 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l2	! %l2 = 0000000008ee0900
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	lduha	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff, %l7 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181410] = 000000ff, %l4 = 0000ffffed3f0000
	ldswa	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010141400] = ff030039ffffffe3
	stxa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000

p0_label_416:
!	Mem[0000000020800000] = ff008ed8, %l0 = 00000000000000ff
	ldstuba	[%o1+0x000]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010141428] = 000000000c377fa2, %l4 = 00000000000000ff, %l5 = 00000000e0000000
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l4,%l5	! %l5 = 000000000c377fa2
!	%f16 = 00000000 00ff0000 00000000 0000ffff
!	%f20 = b64f17cc 00000000 39307cef cc174fb6
!	%f24 = ff000000 95a7e5b4 00000000 00000000
!	%f28 = 1ab5feff 1ab5feff ffffffe3 00000000
	stda	%f16,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400
!	Mem[0000000010101400] = 7ea20000, %l1 = 0000000000000000
	ldstuba	[%i4+0x000]%asi,%l1	! %l1 = 0000007e000000ff
!	%l3 = 0000000000000000, Mem[000000001000140e] = fffeb51a
	stb	%l3,[%i0+0x00e]		! Mem[000000001000140c] = fffe001a
!	Mem[0000000030141410] = ed3f0000, %l4 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000010141408] = 00000000 c580ff00
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 ffffffff
!	Mem[0000000030041400] = ff000000, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	%f11 = 00000000, Mem[0000000030181408] = 00000039
	sta	%f11,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l1 = 000000000000007e
	ldswa	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_417:
!	Mem[0000000010181428] = d800ffd7, %l5 = 000000000c377fa2
	lduw	[%i6+0x028],%l5		! %l5 = 00000000d800ffd7
!	Mem[0000000030001410] = 000000ff, %f14 = 7cef00a0
	lda	[%i0+%o5]0x89,%f14	! %f14 = 000000ff
!	Mem[00000000201c0000] = 00ff826e, %l2 = 0000000008ee0900
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141410] = fffeb51a, %l0 = 00000000000000ff
	lduha	[%i5+%o5]0x88,%l0	! %l0 = 000000000000b51a
!	%l0 = 000000000000b51a, Mem[0000000020800040] = 00ffcbdb
	stb	%l0,[%o1+0x040]		! Mem[0000000020800040] = 1affcbdb
	membar	#Sync			! Added by membar checker (81)
!	Mem[0000000010041400] = 00000000, %l5 = 00000000d800ffd7
	lduwa	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 0000ff00 00000000, %l4 = ff000000, %l5 = 00000000
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 000000000000ff00 0000000000000000
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000000
	ldsba	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 700025ff, %f9  = f00000ff
	lda	[%i4+%o4]0x81,%f9 	! %f9 = 700025ff
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010181400] = ff0000ff 00000000
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff 00000000

p0_label_418:
!	%l1 = 0000000000000000, Mem[00000000300c1408] = 00000000c580ffff
	stxa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	%l4 = 000000000000ff00, Mem[0000000010181400] = ff000000
	stw	%l4,[%i6+%g0]		! Mem[0000000010181400] = 0000ff00
!	%l6 = 0000000000000000, imm = fffffffffffff59d, %l7 = ffffffffffffffff
	addc	%l6,-0xa63,%l7		! %l7 = fffffffffffff59d
!	Mem[0000000010101410] = 700025ff, %l1 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 00000000700025ff
!	%f28 = 1ab5feff 1ab5feff, %l1 = 00000000700025ff
!	Mem[0000000030181400] = 0000000000003039
	stda	%f28,[%i6+%l1]ASI_PST32_SL ! Mem[0000000030181400] = fffeb51afffeb51a
!	Mem[0000000030001408] = b64f17cc, %l1 = 00000000700025ff
	ldstuba	[%i0+%o4]0x81,%l1	! %l1 = 000000b6000000ff
!	%l0 = 000000000000b51a, Mem[00000000211c0001] = ffff7001, %asi = 80
	stba	%l0,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff1a7001
!	%l2 = 00000000000000ff, Mem[00000000100c1428] = d8f1ffd7
	stw	%l2,[%i3+0x028]		! Mem[00000000100c1428] = 000000ff
!	%f7  = 00ffbbff, Mem[0000000010041408] = 00000000
	sta	%f7 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ffbbff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00ffbbff, %l7 = fffffffffffff59d
	ldsba	[%i1+0x009]%asi,%l7	! %l7 = ffffffffffffffff

p0_label_419:
!	Mem[0000000010081408] = 00000000 d8f1ffd7, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 00000000d8f1ffd7 0000000000000000
!	Mem[00000000211c0000] = ff1a7001, %l6 = 0000000000000000
	ldub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030141410] = ed3f00ff, %l3 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l3	! %l3 = 00000000ed3f00ff
!	Mem[0000000010181438] = 000000ff, %l6 = 00000000000000ff
	ldsha	[%i6+0x03a]%asi,%l6	! %l6 = 00000000000000ff
!	Code Fragment 4
p0_fragment_31:
!	%l0 = 000000000000b51a
	setx	0x38906e8805cbd0ac,%g7,%l0 ! %l0 = 38906e8805cbd0ac
!	%l1 = 00000000000000b6
	setx	0xe14bc5900e1e68bd,%g7,%l1 ! %l1 = e14bc5900e1e68bd
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 38906e8805cbd0ac
	setx	0x111a0aefb877303b,%g7,%l0 ! %l0 = 111a0aefb877303b
!	%l1 = e14bc5900e1e68bd
	setx	0x9524e7783431122a,%g7,%l1 ! %l1 = 9524e7783431122a
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = ff000000, %l4 = 000000000000ff00
	ldsba	[%i6+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = ff000000a7000000, %l5 = 0000000000000000
	ldxa	[%i2+%o5]0x88,%l5	! %l5 = ff000000a7000000
!	Mem[00000000100c1410] = 000000ff, %l0 = 111a0aefb877303b
	lduba	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = ff008ed8, %l7 = ffffffffffffffff
	lduh	[%o1+%g0],%l7		! %l7 = 000000000000ff00

p0_label_420:
!	%l7 = 000000000000ff00, Mem[0000000030001408] = cc174fff
	stba	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = cc174f00
!	%l1 = 9524e7783431122a, Mem[0000000030101410] = 19fd000000000000
	stxa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 9524e7783431122a
!	Mem[00000000100c1410] = 000000ff, %l5 = ff000000a7000000
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%f4  = 700025ff 00000000, Mem[0000000030101400] = 0009ee08 000000ff
	stda	%f4 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 700025ff 00000000
!	%f16 = 00000000 00ff0000, Mem[0000000010081410] = 000000a7 000000ff
	stda	%f16,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 00ff0000
!	Mem[0000000030041410] = 390003ff, %l2 = 00000000d8f1ffd7
	ldstuba	[%i1+%o5]0x81,%l2	! %l2 = 00000039000000ff
!	%l5 = 00000000000000ff, Mem[0000000030141410] = ff003fed
	stwa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff
!	%f12 = ff000000 cc174fb6, %l1 = 9524e7783431122a
!	Mem[0000000030041428] = 8000000000000000
	add	%i1,0x028,%g1
	stda	%f12,[%g1+%l1]ASI_PST16_S ! Mem[0000000030041428] = ff000000cc170000
!	%l4 = ffffffffffffffff, %l6 = 00000000000000ff, %l7 = 000000000000ff00
	or	%l4,%l6,%l7		! %l7 = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 000000ff, %l6 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_421:
!	Mem[0000000010041400] = 00000000, %l4 = ffffffffffffffff
	lduba	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181418] = ffff0000 00000000, %l6 = 000000ff, %l7 = ffffffff
	ldd	[%i6+0x018],%l6		! %l6 = 00000000ffff0000 0000000000000000
	membar	#Sync			! Added by membar checker (82)
!	Mem[0000000010181400] = 0000ff00 00000000 ffffffe3 fffeb51a
!	Mem[0000000010181410] = ff000000 ff250070 ffff0000 00000000
!	Mem[0000000010181420] = ff000000 700025f9 d800ffd7 fffffff3
!	Mem[0000000010181430] = fffeb51a fffeb51a 000000ff 00ff0000
	ldda	[%i6]ASI_BLK_PL,%f16	! Block Load from 0000000010181400
!	%l2 = 0000000000000039, immed = fffff5d7, %y  = 000000ff
	sdiv	%l2,-0xa29,%l7		! %l7 = ffffffffe6e6e6e7
	mov	%l0,%y			! %y = 000000ff
!	Mem[00000000100c1408] = 0000ffff, %l7 = ffffffffe6e6e6e7
	ldsha	[%i3+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1410] = a7000000, %l2 = 0000000000000039
	ldswa	[%i3+%o5]0x88,%l2	! %l2 = ffffffffa7000000
!	%f2  = 00000000, %f15 = 0000ff7e
	fcmpes	%fcc1,%f2 ,%f15		! %fcc1 = 1
!	Mem[0000000020800040] = 1affcbdb, %l6 = 00000000ffff0000
	ldsb	[%o1+0x041],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010181408] = ffffffe3, %f0  = 7ea20000
	lda	[%i6+%o4]0x80,%f0 	! %f0 = ffffffe3
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffff, Mem[0000000030001408] = 004f17ccef7c3039
	stxa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffffffffffff

p0_label_422:
!	Mem[0000000030001408] = ffffffff, %l6 = ffffffffffffffff
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030001400] = b5ffffff, %l7 = ffffffffffffffff
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 00000000b5ffffff
!	Mem[0000000010101400] = 0000a2ff, %l7 = 00000000b5ffffff
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 000000000000a2ff
!	%l1 = 9524e7783431122a, Mem[00000000100c1400] = 0000ff00
	stha	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 122aff00
!	Mem[0000000010101400] = ffffffb5, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 00000000ffffffb5
!	%l4 = ffffffb5, %l5 = 000000ff, Mem[00000000100c1418] = b64f17cc ef7c30ff
	std	%l4,[%i3+0x018]		! Mem[00000000100c1418] = ffffffb5 000000ff
!	%l6 = 00000000ffffffff, Mem[00000000300c1408] = 00000000
	stwa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffff
!	%f14 = 000000ff 0000ff7e, Mem[0000000010141428] = 00000000 0c377fa2
	stda	%f14,[%i5+0x028]%asi	! Mem[0000000010141428] = 000000ff 0000ff7e
!	Mem[0000000030041400] = 00000000, %l4 = 00000000ffffffb5
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000ff, %l1 = 9524e7783431122a
	lduwa	[%i5+%o5]0x81,%l1	! %l1 = 00000000000000ff

p0_label_423:
!	Mem[0000000010001400] = ff0000ff, %l7 = 000000000000a2ff
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 00000000ff0000ff
!	Mem[0000000030141408] = e3ffffff, %l0 = 00000000000000ff
	ldsba	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffffe3
!	Mem[00000000211c0000] = ff1a7001, %l2 = ffffffffa7000000
	ldub	[%o2+0x001],%l2		! %l2 = 000000000000001a
!	Mem[0000000010041410] = cc174fb6, %f5  = 00000000
	lda	[%i1+%o5]0x88,%f5 	! %f5 = cc174fb6
!	Mem[0000000010181408] = e3ffffff, %l5 = 00000000000000ff
	ldswa	[%i6+%o4]0x88,%l5	! %l5 = ffffffffe3ffffff
!	Mem[0000000010141408] = 00000000 ffffffff, %l6 = ffffffff, %l7 = ff0000ff
	ldda	[%i5+0x008]%asi,%l6	! %l6 = 0000000000000000 00000000ffffffff
!	Mem[0000000030081408] = 00000000ff250070, %l2 = 000000000000001a
	ldxa	[%i2+%o4]0x81,%l2	! %l2 = 00000000ff250070
!	Mem[0000000010081400] = 00000000, %l7 = 00000000ffffffff
	lduwa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = ffffffb5, %l6 = 0000000000000000
	lduwa	[%i1+%g0]0x89,%l6	! %l6 = 00000000ffffffb5
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffffffb5, Mem[00000000100c1408] = 0000ffff
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffb5

p0_label_424:
!	Mem[0000000030041400] = b5ffffff, %l5 = ffffffffe3ffffff
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 000000b5000000ff
!	%l6 = 00000000ffffffb5, Mem[0000000010001438] = 00000000, %asi = 80
	stha	%l6,[%i0+0x038]%asi	! Mem[0000000010001438] = ffb50000
!	%l4 = 0000000000000000, Mem[00000000300c1408] = ffffffff00000000
	stxa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	%f2  = 00000000 00000000, %l2 = 00000000ff250070
!	Mem[0000000010101408] = 0000000000000000
	add	%i4,0x008,%g1
	stda	%f2,[%g1+%l2]ASI_PST32_P ! Mem[0000000010101408] = 0000000000000000
!	%l4 = 00000000, %l5 = 000000b5, Mem[0000000030141410] = ff000000 0000ffff
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 000000b5
!	Mem[0000000010081400] = 00000000, %l6 = 00000000ffffffb5
	swapa	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030041408] = ffffffe3
	stwa	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 0000000000ff2a12
	stxa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000
!	%l4 = 00000000, %l5 = 000000b5, Mem[0000000030141400] = fffeb51a fffeb51a
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 000000b5
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 700025ffffffffe3, %l2 = 00000000ff250070
	ldxa	[%i5+%o4]0x89,%l2	! %l2 = 700025ffffffffe3

p0_label_425:
!	Mem[0000000010041408] = 00ffbbff, %l3 = 00000000ed3f00ff
	lduha	[%i1+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = 00ff0000, %l2 = 700025ffffffffe3
	ldsha	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = ff0000ff, %l7 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001400] = ff0000ff, %l0 = ffffffffffffffe3
	ldsba	[%i0+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181408] = 0000000095a7e5b4, %l1 = 00000000000000ff
	ldxa	[%i6+%o4]0x81,%l1	! %l1 = 0000000095a7e5b4
!	Mem[0000000030001400] = ffffffff, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = ffffffff, %f19 = e3ffffff
	lda	[%i1+%g0]0x81,%f19	! %f19 = ffffffff
!	Mem[0000000010141414] = e3ffffff, %f6  = f9250070
	ld	[%i5+0x014],%f6 	! %f6 = e3ffffff
!	Mem[0000000030181410] = ff000000, %l7 = 00000000000000ff
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000030181408] = 00000000
	stba	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff

p0_label_426:
	membar	#Sync			! Added by membar checker (83)
!	%f10 = 00000000 00000000, Mem[0000000010181408] = ffffffe3 fffeb51a
	stda	%f10,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 00000000
!	Mem[0000000030081410] = 00000000, %l5 = 00000000000000b5
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = ffffffb5, %l5 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 000000b5000000ff
!	%l4 = 0000000000000000, Mem[0000000030081400] = f3000000
	stha	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = f3000000
!	%l3 = 00000000000000ff, Mem[0000000010001400] = ff0000ff
	stba	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = ff0000ff
!	Mem[0000000010141420] = ff0000f0, %l0 = ffffffffffffffff
	swap	[%i5+0x020],%l0		! %l0 = 00000000ff0000f0
!	%f4  = 700025ff, Mem[0000000030181408] = 000000ff
	sta	%f4 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 700025ff
!	%l7 = 00000000000000ff, Mem[00000000100c1428] = 000000ffffff0000
	stx	%l7,[%i3+0x028]		! Mem[00000000100c1428] = 00000000000000ff
!	Mem[00000000201c0001] = 00ff826e, %l4 = 0000000000000000
	ldstub	[%o0+0x001],%l4		! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 000000a7cc174fb6, %l7 = 00000000000000ff
	ldxa	[%i3+%o5]0x80,%l7	! %l7 = 000000a7cc174fb6

p0_label_427:
!	Mem[000000001000143c] = 000000ff, %l4 = 00000000000000ff
	lduha	[%i0+0x03e]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = ff0300ff, %l0 = 00000000ff0000f0
	ldswa	[%i1+%o5]0x89,%l0	! %l0 = ffffffffff0300ff
!	Mem[00000000100c1400] = 0000000000000000, %l5 = 00000000000000b5
	ldx	[%i3+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000030081408] = 00000000ff250070, %f22 = 00000000 0000ffff
	ldda	[%i2+%o4]0x81,%f22	! %f22 = 00000000 ff250070
!	Mem[0000000010041400] = 00000000, %l2 = 00000000000000ff
	lduba	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = ff0003ff00000000, %f4  = 700025ff cc174fb6
	ldda	[%i1+%o5]0x81,%f4 	! %f4  = ff0003ff 00000000
!	%f2  = 00000000, %f16 = 00000000
	fcmps	%fcc1,%f2 ,%f16		! %fcc1 = 0
!	Mem[0000000030001410] = ff000000, %l1 = 0000000095a7e5b4
	lduwa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[00000000100c1438] = 000030399d000000, %l3 = 00000000000000ff
	ldxa	[%i3+0x038]%asi,%l3	! %l3 = 000030399d000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[00000000100c1408] = ffffffff00000000
	stxa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000

p0_label_428:
!	Mem[0000000030181408] = 700025ff, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 00000000700025ff
!	%l3 = 000030399d000000, Mem[0000000030001400] = ffffffff
	stba	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ffffff
!	%l7 = 000000a7cc174fb6, Mem[0000000010041408] = 00ffbbff0000ffff
	stxa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000a7cc174fb6
!	%l5 = 0000000000000000, Mem[0000000030081410] = ff000000
	stwa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%f12 = ff000000 cc174fb6, Mem[0000000030181400] = fffeb51a fffeb51a
	stda	%f12,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000 cc174fb6
!	%l6 = 00000000700025ff, Mem[000000001018141c] = 00000000
	stw	%l6,[%i6+0x01c]		! Mem[000000001018141c] = 700025ff
!	%l5 = 0000000000000000, Mem[0000000010101400] = 00000000
	stha	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%f24 = f9250070, Mem[0000000010081408] = d7fff1d8
	sta	%f24,[%i2+%o4]0x80	! Mem[0000000010081408] = f9250070
!	%f10 = 00000000 00000000, %l5 = 0000000000000000
!	Mem[0000000030141428] = d8f1ffd7ffffffe3
	add	%i5,0x028,%g1
	stda	%f10,[%g1+%l5]ASI_PST32_S ! Mem[0000000030141428] = d8f1ffd7ffffffe3
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = ff000000f00000ff, %l4 = 00000000000000ff
	ldxa	[%i4+0x020]%asi,%l4	! %l4 = ff000000f00000ff

p0_label_429:
!	Mem[0000000010041400] = 00000000, %l0 = ffffffffff0300ff
	lduwa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l7 = 000000a7cc174fb6
	lduha	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101404] = 00000000, %f8  = ff000000
	lda	[%i4+0x004]%asi,%f8 	! %f8 = 00000000
!	Mem[0000000030041400] = ffffffff, %l0 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1408] = 0000000000000000, %l1 = 00000000ff000000
	ldxa	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = ff0000ff, %l7 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081418] = 0000ff00, %l3 = 000030399d000000
	ldswa	[%i2+0x018]%asi,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010001430] = 00003039, %l7 = 00000000000000ff
	lduba	[%i0+0x032]%asi,%l7	! %l7 = 0000000000000030
!	Mem[0000000030141400] = 00000000, %l5 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000700025ff, Mem[0000000010041410] = b64f17cc
	stba	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = ff4f17cc

p0_label_430:
!	%l6 = 00000000700025ff, Mem[00000000100c1408] = 00000000
	sth	%l6,[%i3+%o4]		! Mem[00000000100c1408] = 25ff0000
!	%l5 = 0000000000000000, Mem[0000000030101408] = 700025ff
	stba	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 000025ff
!	Mem[00000000300c1400] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000030041408] = 0000000000000000
	stxa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	%l6 = 00000000700025ff, Mem[0000000010081418] = 0000ff00ffffd0c6, %asi = 80
	stxa	%l6,[%i2+0x018]%asi	! Mem[0000000010081418] = 00000000700025ff
!	%l0 = 000000ff, %l1 = 000000ff, Mem[00000000100c1400] = 00000000 00000000
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff 000000ff
!	Mem[00000000100c1420] = b4e5a795000000ff, %f8  = 00000000 700025ff
	ldda	[%i3+0x020]%asi,%f8 	! %f8  = b4e5a795 000000ff
!	%l6 = 00000000700025ff, Mem[0000000010001408] = 00000000
	stha	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 25ff0000
!	Mem[0000000030141400] = 00000000, %l1 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000 000000ff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000000000ff

p0_label_431:
!	Mem[0000000010001400] = 00390000 ff0000ff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 00000000ff0000ff 0000000000390000
!	Mem[0000000010101410] = 00000000 00000000, %l0 = ff0000ff, %l1 = 00390000
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000030041410] = ff0300ff, %l0 = 0000000000000000
	lduha	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1410] = 000000ff, %l7 = 0000000000000030
	ldswa	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = ff000000, %l0 = 00000000000000ff
	ldsha	[%i0+%o5]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010001408] = 0000ff25, %l2 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l2	! %l2 = 000000000000ff25
!	Mem[0000000010101410] = 00000000, %l2 = 000000000000ff25
	lduwa	[%i4+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l0 = ffffffffffffff00
	lduba	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101418] = f9250070, %l0 = 0000000000000000
	lduw	[%i4+0x018],%l0		! %l0 = 00000000f9250070
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = f3000000, %l5 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 00000000f3000000

p0_label_432:
!	%l4 = ff000000f00000ff, Mem[0000000010101400] = 00000000
	stba	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000
!	%l2 = 00000000, %l3 = 0000ff00, Mem[00000000100c1408] = 0000ff25 00000000
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 0000ff00
!	%l0 = 00000000f9250070, Mem[0000000010101410] = 00000000
	stba	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 70000000
!	%l3 = 000000000000ff00, Mem[000000001018141d] = 700025ff, %asi = 80
	stba	%l3,[%i6+0x01d]%asi	! Mem[000000001018141c] = 700025ff
!	%l7 = 00000000000000ff, Mem[0000000030101408] = ff000000ff250000
	stxa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000000000ff
!	%l3 = 000000000000ff00, Mem[00000000100c1400] = ff000000ff000000
	stxa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000000000ff00
!	Mem[0000000010181400] = 0000ff0000000000, %l3 = 000000000000ff00, %l3 = 000000000000ff00
	casxa	[%i6]0x80,%l3,%l3	! %l3 = 0000ff0000000000
!	%l2 = 0000000000000000, Mem[0000000030041410] = ff0003ff
	stha	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 000003ff
!	%l6 = 00000000700025ff, Mem[0000000030081410] = 00000000
	stba	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff826e, %l3 = 0000ff0000000000
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff

p0_label_433:
!	Mem[0000000030181400] = 000000ff, %l1 = 0000000000000000
	lduwa	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081410] = ff00000039300000, %l3 = 00000000000000ff
	ldxa	[%i2+%o5]0x81,%l3	! %l3 = ff00000039300000
!	Mem[0000000010041400] = 00000000, %l4 = ff000000f00000ff
	lduwa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 0000ff00 00000000, %l4 = 00000000, %l5 = f3000000
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000 000000000000ff00
!	Mem[000000001000140c] = fffe001a, %l6 = 00000000700025ff
	lduwa	[%i0+0x00c]%asi,%l6	! %l6 = 00000000fffe001a
!	Mem[0000000010101400] = 000000ff, %l4 = 0000000000000000
	lduba	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%f26 = f3ffffff, %f13 = cc174fb6, %f20 = 700025ff
	fsubs	%f26,%f13,%f20		! %f20 = f3ffffff
!	Mem[00000000100c1410] = a7000000, %l4 = 00000000000000ff
	ldsba	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001014143c] = a000ef7c, %l0 = 00000000f9250070
	lduha	[%i5+0x03e]%asi,%l0	! %l0 = 000000000000ef7c
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[00000000300c1410] = 000000ff
	stha	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff

p0_label_434:
!	%l5 = 000000000000ff00, immed = fffff838, %y  = 000000ff
	udiv	%l5,-0x7c8,%l1		! %l1 = 00000000000000ff
	mov	%l0,%y			! %y = 0000ef7c
!	%l6 = 00000000fffe001a, Mem[0000000010081410] = 00000000
	stwa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = fffe001a
!	%l3 = ff00000039300000, Mem[0000000010141409] = 00000000
	stb	%l3,[%i5+0x009]		! Mem[0000000010141408] = 00000000
!	%l6 = 00000000fffe001a, Mem[00000000201c0000] = 00ff826e
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 001a826e
!	%l7 = 00000000000000ff, Mem[0000000010081408] = f925007000000000
	stx	%l7,[%i2+%o4]		! Mem[0000000010081408] = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030001408] = ffffffff
	stha	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = ffff0000
!	Mem[0000000010001408] = 25ff0000, %l4 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = 0000000025ff0000
!	%f30 = 0000ff00 ff000000, Mem[0000000030181410] = 000000ff 00000000
	stda	%f30,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ff00 ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 0000ffff, %l6 = 00000000fffe001a
	ldswa	[%i0+%o4]0x81,%l6	! %l6 = 000000000000ffff

p0_label_435:
!	Mem[00000000211c0000] = ff1a7001, %l5 = 000000000000ff00
	ldsb	[%o2+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = 001a826e, %l7 = 00000000000000ff
	ldub	[%o0+0x001],%l7		! %l7 = 000000000000001a
!	%l3 = ff00000039300000, imm = 0000000000000807, %l0 = 000000000000ef7c
	addc	%l3,0x807,%l0		! %l0 = ff00000039300807
!	%l3 = ff00000039300000, immed = fffff89b, %y  = 0000ef7c
	sdiv	%l3,-0x765,%l5		! %l5 = ffffffff80000000
	mov	%l0,%y			! %y = 39300807
!	Mem[0000000030141400] = 000000ffb5000000, %f30 = 0000ff00 ff000000
	ldda	[%i5+%g0]0x81,%f30	! %f30 = 000000ff b5000000
!	Mem[0000000010041438] = ffffffe3, %l0 = ff00000039300807
	lduw	[%i1+0x038],%l0		! %l0 = 00000000ffffffe3
!	Mem[0000000010101414] = 00000000, %l1 = 0000000000000000
	ldsb	[%i4+0x017],%l1		! %l1 = 0000000000000000
!	Mem[0000000010041410] = cc174fff, %l7 = 000000000000001a
	ldswa	[%i1+%o5]0x88,%l7	! %l7 = ffffffffcc174fff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 0000000000000000, %l6 = 000000000000ffff, %l4 = 0000000025ff0000
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = 0000000000000000

p0_label_436:
!	Mem[0000000030181408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l7 = ffffffffcc174fff, immd = 0000000000000ce1, %l3  = ff00000039300000
	mulx	%l7,0xce1,%l3		! %l3 = fffffd63783d431f
!	%f21 = 000000ff, Mem[0000000030181408] = 000000ff
	sta	%f21,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	Mem[0000000010181410] = ff000000ff250070, %l0 = 00000000ffffffe3, %l3 = fffffd63783d431f
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = ff000000ff250070
!	Mem[00000000100c1400] = 00000000, %l3 = ff000000ff250070
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%f28 = 1ab5feff, Mem[0000000010101418] = f9250070
	st	%f28,[%i4+0x018]	! Mem[0000000010101418] = 1ab5feff
!	%l4 = 0000000000000000, Mem[00000000100c1400] = 700025ff
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%f4  = ff0003ff 00000000, Mem[0000000010101410] = 70000000 00000000
	stda	%f4 ,[%i4+%o5]0x80	! Mem[0000000010101410] = ff0003ff 00000000
!	%f14 = 000000ff, %f17 = 00ff0000, %f19 = ffffffff
	fadds	%f14,%f17,%f19		! %l0 = 0000000100000005, Unfinished, %fsr = 0400000c00
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000 00000000, %l6 = 0000ffff, %l7 = cc174fff
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000000 0000000000000000

p0_label_437:
!	%l2 = 0000000000000000, %l5 = ffffffff80000000, %y  = 39300807
	sdiv	%l2,%l5,%l5		! %l5 = ffffffff8d9feff2
	mov	%l0,%y			! %y = 00000005
!	Mem[0000000030081400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = ff0003ff, %f20 = f3ffffff
	lda	[%i4+%o5]0x80,%f20	! %f20 = ff0003ff
!	Mem[0000000010181410] = 700025ff000000ff, %l7 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l7	! %l7 = 700025ff000000ff
!	Mem[0000000030181410] = 000000ff 00ff0000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 00000000000000ff 0000000000ff0000
!	Mem[0000000010101410] = 00000000ff0300ff, %l7 = 0000000000ff0000
	ldxa	[%i4+%o5]0x88,%l7	! %l7 = 00000000ff0300ff
!	Mem[00000000300c1410] = ff000000, %l3 = 0000000000000000
	lduwa	[%i3+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	%l5 = ffffffff8d9feff2, %l4 = 0000000000000000, %l4 = 0000000000000000
	sdivx	%l5,%l4,%l4		! Div by zero, %l0 = 0000000100000055
!	Mem[0000000010001410] = 00000000, %l7 = 00000000ff0300ff
	lduha	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101438] = 7cef00a0, %l0 = 0000002d, %l3 = ff000000
	add	%i4,0x38,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 000000007cef00a0

p0_label_438:
!	%l3 = 000000007cef00a0, Mem[00000000100c1400] = 000000000000ff00
	stxa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000007cef00a0
!	Mem[0000000010001400] = ff0000ff, %l5 = ffffffff8d9feff2
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030101410] = 78e72495, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 0000000078e72495
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%l0 = 0000002d, %l1 = 00000000, Mem[0000000030141408] = ffffffe3 700025ff
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000002d 00000000
!	%f6  = e3ffffff 00ffbbff, Mem[0000000030141408] = 2d000000 00000000
	stda	%f6 ,[%i5+%o4]0x81	! Mem[0000000030141408] = e3ffffff 00ffbbff
!	%l6 = 000000ff, %l7 = 78e72495, Mem[00000000300c1410] = ff000000 315d3c5e
	stda	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff 78e72495
!	%l2 = 00000000, %l3 = 7cef00a0, Mem[0000000030181408] = 000000ff b4e5a795
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 7cef00a0
!	%l2 = 00000000, %l3 = 7cef00a0, Mem[0000000010181410] = 000000ff 700025ff
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 7cef00a0
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 000000ff, %l0 = 000000010000002d
	lduwa	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff

p0_label_439:
!	Mem[0000000010001410] = 00000000, %f31 = b5000000
	lda	[%i0+%o5]0x80,%f31	! %f31 = 00000000
!	Mem[00000000201c0000] = 001a826e, %l5 = 00000000000000ff
	lduba	[%o0+0x001]%asi,%l5	! %l5 = 000000000000001a
!	Mem[0000000010101400] = 00000000 000000ff, %l4 = 00000000, %l5 = 0000001a
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[0000000010081418] = 00000000700025ff, %l0 = 00000000000000ff
	ldx	[%i2+0x018],%l0		! %l0 = 00000000700025ff
!	Mem[0000000010101408] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = 1ab5feff, %l3 = 000000007cef00a0
	ldsba	[%i5+%o5]0x80,%l3	! %l3 = 000000000000001a
!	Mem[00000000100c142c] = 000000ff, %l3 = 000000000000001a
	ldsb	[%i3+0x02f],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010141408] = ff000000ffffffff, %l7 = 0000000078e72495
	ldxa	[%i5+%o4]0x80,%l7	! %l7 = ff000000ffffffff
!	Mem[0000000030001400] = 00ffffff, %l7 = ff000000ffffffff
	lduba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f18 = 1ab5feff ffffffff, Mem[0000000030101410] = 00000000 3431122a
	stda	%f18,[%i4+%o5]0x81	! Mem[0000000030101410] = 1ab5feff ffffffff

p0_label_440:
!	Mem[00000000300c1400] = 000000ff, %l0 = 00000000700025ff
	ldstuba	[%i3+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010081410] = fffe001a, %l0 = 00000000000000ff
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 0000001a000000ff
!	%l6 = 0000000000000000, %l1 = 0000000000000000, %y  = 00000005
	sdiv	%l6,%l1,%l7		! Div by zero, %l0 = 000000000000006a
	mov	%l0,%y			! %y = 00000042
!	%l3 = ffffffffffffffff, Mem[0000000030081410] = 000000ff
	stba	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	%l1 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stwa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%l4 = 00000000000000ff, Mem[00000000100c1400] = 00000000
	stha	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00ff0000
!	Mem[0000000030181408] = 00000000, %l1 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010041400] = 00000000 0000ff00
	stda	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 700025ff00000000, %f28 = 1ab5feff 1ab5feff
	ldda	[%i4+%g0]0x81,%f28	! %f28 = 700025ff 00000000

p0_label_441:
!	Mem[0000000030181410] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181408] = 0000000000000000, %l0 = 0000000000000042
	ldxa	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 0000ff25, %f18 = 1ab5feff
	lda	[%i0+%o4]0x88,%f18	! %f18 = 0000ff25
!	Mem[00000000100c1410] = 000000a7cc174fb6, %f24 = f9250070 000000ff
	ldda	[%i3+%o5]0x80,%f24	! %f24 = 000000a7 cc174fb6
!	Mem[0000000010001410] = ff00000000000000, %f10 = 00000000 00000000
	ldda	[%i0+%o5]0x88,%f10	! %f10 = ff000000 00000000
!	%l3 = ffffffffffffffff, imm = fffffffffffff630, %l3 = ffffffffffffffff
	and	%l3,-0x9d0,%l3		! %l3 = fffffffffffff630
!	Mem[0000000030081408] = 00000000, %l4 = 00000000000000ff
	lduha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = 001a826e, %l0 = 0000000000000000
	lduh	[%o0+%g0],%l0		! %l0 = 000000000000001a
!	Mem[0000000010181408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800081] = 28ff944f, %l7 = 0000000000000000
	ldstuba	[%o3+0x081]%asi,%l7	! %l7 = 000000ff000000ff

p0_label_442:
!	Mem[0000000010081436] = ff030125, %l6 = 0000000000000000
	ldstuba	[%i2+0x036]%asi,%l6	! %l6 = 00000001000000ff
!	Mem[0000000030101410] = 1ab5feff, %l6 = 0000000000000001
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 0000001a000000ff
!	Mem[0000000010101410] = ff0003ff, %l6 = 000000000000001a
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 00000000ff0003ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010081418] = 00000000 700025ff
	std	%l4,[%i2+0x018]		! Mem[0000000010081418] = 00000000 00000000
!	%l2 = 000000ff, %l3 = fffff630, Mem[0000000030081400] = 00000000 ffff0000
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff fffff630
!	%f16 = 00000000 00ff0000 0000ff25 ffffffff
!	%f20 = ff0003ff 000000ff 00000000 ff250070
!	%f24 = 000000a7 cc174fb6 f3ffffff d7ff00d8
!	%f28 = 700025ff 00000000 000000ff 00000000
	stda	%f16,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	%l6 = 00000000ff0003ff, Mem[0000000030101410] = ffb5feff
	stwa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = ff0003ff
!	%l4 = 0000000000000000, Mem[00000000100c1400] = 00ff0000
	stba	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00ff0000
!	%f4  = ff0003ff, Mem[0000000010181400] = 0000ff00
	st	%f4 ,[%i6+%g0]		! Mem[0000000010181400] = ff0003ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (84)
!	Mem[0000000030041408] = ffffffff 25ff0000, %l2 = 000000ff, %l3 = fffff630
	ldda	[%i1+%o4]0x89,%l2	! %l2 = 0000000025ff0000 00000000ffffffff

p0_label_443:
!	Mem[00000000100c1410] = b64f17cc a7000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 00000000a7000000 00000000b64f17cc
!	Mem[0000000010081410] = ff00feff00ff0000, %f18 = 0000ff25 ffffffff
	ldda	[%i2+%o5]0x80,%f18	! %f18 = ff00feff 00ff0000
!	Mem[0000000010041400] = 00000000, %f23 = ff250070
	lda	[%i1+%g0]0x80,%f23	! %f23 = 00000000
!	Mem[00000000100c1408] = 00000000, %l4 = 00000000a7000000
	ldsha	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l4 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 000000ff, %l6 = 00000000ff0003ff
	ldswa	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141408] = ff000000, %l3 = 00000000ffffffff
	ldsha	[%i5+%o4]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010081410] = ff00feff00ff0000, %f20 = ff0003ff 000000ff
	ldda	[%i2+%o5]0x80,%f20	! %f20 = ff00feff 00ff0000
!	Mem[0000000030181410] = 000000ff00ff0000, %l3 = ffffffffffffff00
	ldxa	[%i6+%o5]0x81,%l3	! %l3 = 000000ff00ff0000
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000001a, Mem[0000000010181400] = ff0300ff
	stha	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = ff03001a

p0_label_444:
!	%l4 = 0000000000000000, Mem[0000000030001410] = ff000000
	stba	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010001400] = ff0000ff
	stwa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l0 = 000000000000001a, Mem[0000000030041400] = 00000000
	stwa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000001a
!	Mem[0000000030181400] = ff000000, %l7 = 00000000000000ff
	ldstuba	[%i6+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	%l2 = 0000000025ff0000, Mem[0000000030001410] = e000000000000000
	stxa	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000025ff0000
!	%l5 = 00000000b64f17cc, Mem[0000000010081410] = ff00feff00ff0000, %asi = 80
	stxa	%l5,[%i2+0x010]%asi	! Mem[0000000010081410] = 00000000b64f17cc
!	%l0 = 0000001a, %l1 = 00000000, Mem[00000000100c1408] = 00000000 00ff0000
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000001a 00000000
!	%l3 = 000000ff00ff0000, Mem[0000000010181400] = ff03001a
	stha	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = ff030000
!	%l2 = 25ff0000, %l3 = 00ff0000, Mem[0000000010181408] = 00000000 00000000
	stda	%l2,[%i6+0x008]%asi	! Mem[0000000010181408] = 25ff0000 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = ffff4cdd, %l2 = 0000000025ff0000
	ldub	[%o3+0x100],%l2		! %l2 = 00000000000000ff

p0_label_445:
!	Mem[0000000010101400] = ff000000, %l2 = 00000000000000ff
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010041408] = 000000a7, %l4 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000a7
!	Mem[0000000020800040] = 1affcbdb, %l6 = 00000000000000ff
	lduba	[%o1+0x041]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = 001a826e, %l2 = 000000000000ff00
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 000000000000001a
!	Mem[0000000010101410] = 0000001a, %l5 = 00000000b64f17cc
	ldsha	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 000000ff, %l5 = 0000000000000000
	lduha	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181408] = 25ff0000, %l5 = 00000000000000ff
	lduba	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000025
!	Mem[0000000010041410] = cc174fff, %l6 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l6	! %l6 = 0000000000004fff
!	Mem[0000000010001408] = 25ff0000, %l7 = 00000000000000ff
	ldswa	[%i0+%o4]0x80,%l7	! %l7 = 0000000025ff0000
!	Starting 10 instruction Store Burst
!	%f12 = ff000000 cc174fb6, %l0 = 000000000000001a
!	Mem[0000000010041428] = 0000000000000000
	add	%i1,0x028,%g1
	stda	%f12,[%g1+%l0]ASI_PST32_P ! Mem[0000000010041428] = ff00000000000000

p0_label_446:
!	%l4 = 00000000000000a7, Mem[0000000010181408] = 0000ff25
	stwa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000a7
!	Mem[0000000030081400] = ff000000, %l0 = 000000000000001a
	ldstuba	[%i2+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%l5 = 0000000000000025, Mem[0000000030001408] = 0000ffff
	stwa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000025
!	%f11 = 00000000, Mem[0000000030041400] = 0000001a
	sta	%f11,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Mem[0000000030081410] = 000000ff, %l5 = 0000000000000025
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010081410] = 00000000
	stha	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	%l5 = 00000000000000ff, Mem[0000000010001410] = 00000000
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff
!	%f0  = ffffffe3 00000000 00000000 00000000
!	%f4  = ff0003ff 00000000 e3ffffff 00ffbbff
!	%f8  = b4e5a795 000000ff ff000000 00000000
!	%f12 = ff000000 cc174fb6 000000ff 0000ff7e
	stda	%f0,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	Mem[000000001000143c] = 000000ff, %l1 = 0000000000000000, %asi = 80
	swapa	[%i0+0x03c]%asi,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 0000001a00000000, %f28 = 700025ff 00000000
	ldda	[%i3+%o4]0x80,%f28	! %f28 = 0000001a 00000000

p0_label_447:
!	Mem[0000000010141400] = 00000000, %f24 = 000000a7
	lda	[%i5+%g0]0x88,%f24	! %f24 = 00000000
!	Mem[0000000010141400] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = ff000000, %l2 = 000000000000001a
	ldsb	[%i0+0x013],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = ff000000, %l4 = 00000000000000a7
	lduba	[%i6+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %f22 = 00000000
	lda	[%i2+%o4]0x88,%f22	! %f22 = 00000000
!	%l5 = 00000000000000ff, %l5 = 00000000000000ff, %l3 = 000000ff00ff0000
	or	%l5,%l5,%l3		! %l3 = 00000000000000ff
!	Mem[0000000010181408] = a7000000, %l2 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000a7
!	Mem[0000000020800000] = ff008ed8, %l0 = 0000000000000000
	lduh	[%o1+%g0],%l0		! %l0 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010081404] = 00000000, %l7 = 0000000025ff0000
	swap	[%i2+0x004],%l7		! %l7 = 0000000000000000

p0_label_448:
!	Mem[0000000030001400] = 00ffffff, %l0 = 000000000000ff00
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1410] = 000000a7, %l2 = 00000000000000a7
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%f29 = 00000000, %f19 = 00ff0000
	fcmpes	%fcc2,%f29,%f19		! %fcc2 = 1
!	Mem[0000000010181410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = ff000000, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x010]%asi,%l3	! %l3 = 00000000ff000000
!	Mem[00000000100c1408] = 1a000000, %l3 = 00000000ff000000
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010001408] = 25ff0000fffe001a
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000000
!	%l3 = 0000000000000000, Mem[00000000300c1410] = 000000ff
	stwa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010001400] = 00000000 00390000
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0000ff00, %l7 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l7	! %l7 = 000000000000ff00

p0_label_449:
!	Mem[0000000010001400] = ff000000ff000000, %f26 = f3ffffff d7ff00d8
	ldda	[%i0+%g0]0x80,%f26	! %f26 = ff000000 ff000000
!	Mem[0000000030181400] = ff000000, %l5 = 00000000000000ff
	lduha	[%i6+%g0]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010001408] = 0000000000000000, %l6 = 0000000000004fff
	ldxa	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (85)
!	Mem[0000000010101400] = ff000000, %l7 = 000000000000ff00
	lduha	[%i4+%g0]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000020800040] = 1affcbdb, %l1 = 00000000000000ff
	ldsba	[%o1+0x040]%asi,%l1	! %l1 = 000000000000001a
!	Mem[0000000010041408] = 000000a7, %l4 = 00000000000000ff
	ldswa	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000a7
!	Mem[0000000030101400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 00000025, %l4 = 00000000000000a7
	ldswa	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000025
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ff000000, %l1 = 000000000000001a
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 00000000ff000000

p0_label_450:
!	%l3 = 0000000000000000, %l5 = 000000000000ff00, %y  = 00000042
	sdiv	%l3,%l5,%l7		! %l7 = 0000000000424242
	mov	%l0,%y			! %y = 00000000
!	%l6 = 0000000000000000, Mem[0000000030181408] = 00000000
	stwa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%l5 = 000000000000ff00, Mem[0000000020800001] = ff008ed8
	stb	%l5,[%o1+0x001]		! Mem[0000000020800000] = ff008ed8
!	%l1 = 00000000ff000000, imm = fffffffffffff439, %l0 = 0000000000000000
	andn	%l1,-0xbc7,%l0		! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 001a826e, %l1 = 00000000ff000000
	ldstub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010081433] = 00000000, %l4 = 0000000000000025
	ldstub	[%i2+0x033],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030141408] = e3ffffff, %l7 = 0000000000424242
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000e3000000ff
!	%l5 = 000000000000ff00, Mem[00000000100c1434] = fffeb51a, %asi = 80
	stha	%l5,[%i3+0x034]%asi	! Mem[00000000100c1434] = ff00b51a
!	Mem[0000000010101414] = 00000000, %l7 = 00000000000000e3
	lduba	[%i4+0x014]%asi,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = b64f17cc 000000ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff 00000000b64f17cc

p0_label_451:
!	Mem[0000000010141400] = 00000000, %l6 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = 000003ff, %l5 = 000000000000ff00
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 00000000000003ff
!	Mem[00000000300c1410] = 00000000, %l3 = 00000000b64f17cc
	ldswa	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %f3  = 00000000
	lda	[%i1+%g0]0x81,%f3 	! %f3 = 00000000
!	Mem[0000000010141400] = 00000000, %l0 = 0000000000000000
	lduba	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = 7cef00a0 00000000, %l4 = 00000000, %l5 = 000003ff
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000 000000007cef00a0
!	%l6 = 0000000000000000, imm = fffffffffffff816, %l7 = 0000000000000000
	xor	%l6,-0x7ea,%l7		! %l7 = fffffffffffff816
!	Mem[0000000030081408] = 00000000, %l3 = 0000000000000000
	lduba	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = ff1a826e, %l2 = 00000000000000ff
	ldsh	[%o0+%g0],%l2		! %l2 = ffffffffffffff1a
!	Starting 10 instruction Store Burst
!	%f0  = ffffffe3, Mem[0000000010101420] = ff000000
	st	%f0 ,[%i4+0x020]	! Mem[0000000010101420] = ffffffe3

p0_label_452:
!	%l6 = 0000000000000000, Mem[0000000030081408] = 00000000
	stba	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	Mem[00000000100c1424] = 000000ff, %l2 = ffffffffffffff1a
	ldstuba	[%i3+0x024]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[000000001014141d] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i5+0x01d]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[00000000300c1400] = 0000001a
	stba	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000001a
!	%l5 = 000000007cef00a0, Mem[0000000030081400] = ff00000030f6ffff
	stxa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000007cef00a0
!	%f18 = ff00feff 00ff0000, Mem[0000000010001410] = 000000ff 000000ff
	std	%f18,[%i0+%o5]	! Mem[0000000010001410] = ff00feff 00ff0000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010181408] = a7000000 00ff0000
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 00000000
!	%l3 = 0000000000000000, Mem[0000000010141404] = 00000000
	stw	%l3,[%i5+0x004]		! Mem[0000000010141404] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000 000000ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000 00000000000000ff

p0_label_453:
!	Mem[0000000010041410] = ff4f17cc, %l4 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1410] = 00000000, %l4 = ffffffffffffffff
	lduha	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %f29 = 00000000
	lda	[%i4+%o5]0x89,%f29	! %f29 = 00000000
!	Mem[0000000010001418] = ff7f0000, %l4 = 0000000000000000
	ldsb	[%i0+0x018],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010081418] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i2+0x019]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 0000001a, %l5 = 000000007cef00a0
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = 00000025 ffffffff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000025 00000000ffffffff
!	Mem[00000000100c1410] = ff0000a7, %l3 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l3	! %l3 = 00000000ff0000a7
!	Mem[0000000010041400] = 0000000000000000, %l0 = 0000000000000025
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 000000ff, %l5 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff

p0_label_454:
!	%f10 = ff000000 00000000, Mem[0000000010081408] = 00000000 ff000000
	stda	%f10,[%i2+%o4]0x88	! Mem[0000000010081408] = ff000000 00000000
!	Mem[0000000030141408] = ffffffff, %l3 = 00000000ff0000a7
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000030181400] = b64f17cc000000ff
	stxa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000000
!	%l3 = 00000000000000ff, %l6 = 0000000000000000, %y  = 00000000
	umul	%l3,%l6,%l5		! %l5 = 0000000000000000, %y = 00000000
!	%l0 = 0000000000000000, Mem[0000000030081410] = 000000ff
	stha	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%f12 = ff000000 cc174fb6, %l5 = 0000000000000000
!	Mem[0000000010101428] = 0000000000000000
	add	%i4,0x028,%g1
	stda	%f12,[%g1+%l5]ASI_PST16_P ! Mem[0000000010101428] = 0000000000000000
!	Mem[0000000010101410] = 1a000000, %l7 = fffffffffffff816
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 000000001a000000
!	%f0  = ffffffe3 00000000 00000000 00000000
!	%f4  = ff0003ff 00000000 e3ffffff 00ffbbff
!	%f8  = b4e5a795 000000ff ff000000 00000000
!	%f12 = ff000000 cc174fb6 000000ff 0000ff7e
	stda	%f0,[%i0]ASI_BLK_S	! Block Store to 0000000030001400
!	%l6 = 00000000, %l7 = 1a000000, Mem[0000000010181410] = 00000000 7cef00a0
	stda	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 1a000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l7 = 000000001a000000
	ldsha	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000

p0_label_455:
!	Mem[0000000010041400] = 00000000, %f18 = ff00feff
	lda	[%i1+%g0]0x88,%f18	! %f18 = 00000000
!	Mem[0000000010101410] = 16f8ffff, %l1 = 00000000ffffffff
	ldsha	[%i4+%o5]0x80,%l1	! %l1 = 00000000000016f8
!	Mem[000000001014141c] = 00ff0000, %f19 = 00ff0000
	ld	[%i5+0x01c],%f19	! %f19 = 00ff0000
!	Mem[0000000010081410] = ff000000, %l1 = 00000000000016f8
	ldsba	[%i2+%o5]0x80,%l1	! %l1 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (86)
!	Mem[0000000010081400] = b5ffffff 25ff0000 00000000 000000ff
!	Mem[0000000010081410] = ff000000 b64f17cc 00000000 00000000
!	Mem[0000000010081420] = ff030039 95ff00b4 ef7c3039 7abaad19
!	Mem[0000000010081430] = 000000ff ff03ff25 00000000 000000ff
	ldda	[%i2]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[0000000030101400] = 00000000, %f12 = ff000000
	lda	[%i4+%g0]0x89,%f12	! %f12 = 00000000
!	%f5  = 00000000, %f14 = 000000ff, %f5  = 00000000
	fdivs	%f5 ,%f14,%f5 		! %f5  = 00000000
!	Mem[0000000010041408] = 000000a7cc174fb6, %f8  = b4e5a795 000000ff
	ldda	[%i1+%o4]0x80,%f8 	! %f8  = 000000a7 cc174fb6
!	Mem[0000000010041400] = 00000000, %l3 = 00000000000000ff
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff

p0_label_456:
!	Mem[0000000030081410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041428] = ff000000, %l3 = 00000000, %l0 = 00000000
	add	%i1,0x28,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 00000000ff000000
!	%l4 = ffffffffffffffff, Mem[0000000010001408] = 00000000
	stba	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stha	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%f8  = 000000a7 cc174fb6, %l7 = 0000000000000000
!	Mem[0000000030101408] = ff00000000000000
	add	%i4,0x008,%g1
	stda	%f8,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030101408] = ff00000000000000
!	%f16 = 0000ff25 ffffffb5 ff000000 00000000
!	%f20 = cc174fb6 000000ff 00000000 00000000
!	%f24 = b400ff95 390003ff 19adba7a 39307cef
!	%f28 = 25ff03ff ff000000 ff000000 00000000
	stda	%f16,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400
!	%l0 = 00000000ff000000, Mem[0000000010181400] = 000003ff, %asi = 80
	stba	%l0,[%i6+0x000]%asi	! Mem[0000000010181400] = 000003ff
!	Mem[0000000010141408] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c1410] = ff0000a7, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 00000000ff0000a7
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000, %l2 = 00000000ff0000a7
	ldsha	[%i4+%g0]0x80,%l2	! %l2 = ffffffffffffff00

p0_label_457:
	membar	#Sync			! Added by membar checker (87)
!	Mem[0000000030081400] = b5ffffff 25ff0000 00000000 000000ff
!	Mem[0000000030081410] = ff000000 b64f17cc 00000000 00000000
!	Mem[0000000030081420] = ff030039 95ff00b4 ef7c3039 7abaad19
!	Mem[0000000030081430] = 000000ff ff03ff25 00000000 000000ff
	ldda	[%i2]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	Mem[00000000300c1410] = 00000000, %l2 = ffffffffffffff00
	ldswa	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = ffffffb5, %l3 = 00000000000000ff
	lduwa	[%i2+%g0]0x89,%l3	! %l3 = 00000000ffffffb5
!	Mem[0000000010081410] = 000000ff, %l7 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%f1  = 00000000, %f12 = 00000000
	fcmpes	%fcc0,%f1 ,%f12		! %fcc0 = 0
!	%l1 = ffffffffffffffff, %l1 = ffffffffffffffff, %y  = 00000000
	sdiv	%l1,%l1,%l1		! %l1 = ffffffff80000000
	mov	%l0,%y			! %y = ff000000
!	Mem[00000000300c1408] = 0000000000000000, %l7 = 00000000000000ff
	ldxa	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l4 = ffffffffffffffff
	lduwa	[%i5+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l3 = 00000000ffffffb5
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000201c0000] = ff1a826e, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000826e

p0_label_458:
!	%l4 = 0000000000000000, Mem[0000000010181408] = 0000000000000000
	stxa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030041408] = 25ff0000
	stha	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 25ff0000
!	%l5 = 0000000000000000, Mem[0000000010041412] = ff4f17cc
	sth	%l5,[%i1+0x012]		! Mem[0000000010041410] = ff4f0000
!	%l5 = 0000000000000000, Mem[000000001000140c] = 00000000
	sth	%l5,[%i0+0x00c]		! Mem[000000001000140c] = 00000000
!	%f16 = b5ffffff 25ff0000 00000000 000000ff
!	%f20 = ff000000 b64f17cc 00000000 00000000
!	%f24 = ff030039 95ff00b4 ef7c3039 7abaad19
!	%f28 = 000000ff ff03ff25 00000000 000000ff
	stda	%f16,[%i0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	%l1 = ffffffff80000000, Mem[0000000020800040] = 1affcbdb
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 0000cbdb
!	%l3 = 0000000000000000, Mem[00000000100c1426] = ff0000ff
	stb	%l3,[%i3+0x026]		! Mem[00000000100c1424] = ff0000ff
!	Mem[0000000010041400] = 00000000, %l0 = 00000000ff000000
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010141400] = 00000000
	stha	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 0000cbdb, %l0 = 0000000000000000
	lduba	[%o1+0x040]%asi,%l0	! %l0 = 0000000000000000

p0_label_459:
!	Mem[0000000030101410] = 00000000ff0300ff, %l1 = ffffffff80000000
	ldxa	[%i4+%o5]0x81,%l1	! %l1 = 00000000ff0300ff
!	Mem[0000000030181408] = 7cef00a000000000, %l4 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l4	! %l4 = 7cef00a000000000
!	%f9  = cc174fb6, %f13 = cc174fb6, %f5  = 00000000
	fdivs	%f9 ,%f13,%f5 		! %f5  = 3f800000
!	Mem[0000000010141408] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001400] = ffffffe3, %f6  = e3ffffff
	lda	[%i0+%g0]0x81,%f6 	! %f6 = ffffffe3
!	Mem[0000000030081400] = b5ffffff, %l7 = 0000000000000000
	ldsba	[%i2+%g0]0x81,%l7	! %l7 = ffffffffffffffb5
!	Mem[0000000010141408] = 000000ff, %l7 = ffffffffffffffb5
	ldsha	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (88)
!	Mem[0000000010001410] = ff000000b64f17cc, %f10 = ff000000 00000000
	ldda	[%i0+%o5]0x80,%f10	! %f10 = ff000000 b64f17cc
!	Mem[0000000030141410] = 00000000 b5000000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000 00000000b5000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 000000ff000000ff

p0_label_460:
!	%f26 = ef7c3039 7abaad19, %l4 = 7cef00a000000000
!	Mem[0000000010041400] = ff00000000000000
	stda	%f26,[%i1+%l4]ASI_PST16_PL ! Mem[0000000010041400] = ff00000000000000
!	%l5 = ffffffffffffffff, Mem[0000000010041408] = a7000000
	stha	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = a700ffff
!	Mem[0000000030001408] = 00000000, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = ffffffb5, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 00000000ffffffb5
!	Mem[0000000030081410] = ff000000, %l7 = 00000000b5000000
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010081410] = ff000000, %l6 = 00000000, %l6 = 00000000
	add	%i2,0x10,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010041410] = ff4f0000, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 00000000ff4f0000
!	Mem[000000001014141a] = 00000000, %l7 = 00000000000000ff
	ldstub	[%i5+0x01a],%l7		! %l7 = 00000000000000ff
!	%l4 = 7cef00a000000000, Mem[0000000030141410] = 00000000
	stwa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l1 = 00000000ff0300ff
	lduha	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_461:
!	Mem[0000000010041408] = b64f17cca700ffff, %l6 = 00000000ff000000
	ldxa	[%i1+%o4]0x88,%l6	! %l6 = b64f17cca700ffff
!	Mem[0000000030181410] = 000000ff00ff0000, %l0 = 00000000000000ff
	ldxa	[%i6+%o5]0x81,%l0	! %l0 = 000000ff00ff0000
!	Mem[0000000010081410] = cc174fb6000000ff, %f12 = 00000000 cc174fb6
	ldda	[%i2+%o5]0x88,%f12	! %f12 = cc174fb6 000000ff
!	Mem[0000000010041410] = 00000000, %f19 = 000000ff
	lda	[%i1+%o5]0x88,%f19	! %f19 = 00000000
!	Mem[0000000030181408] = 7cef00a000000000, %l3 = 00000000ffffffb5
	ldxa	[%i6+%o4]0x89,%l3	! %l3 = 7cef00a000000000
!	Mem[0000000010081408] = 00000000, %l5 = ffffffffffffffff
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 0000826e, %l3 = 7cef00a000000000
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = ff000000 b64f17cc, %l6 = a700ffff, %l7 = 00000000
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000ff000000 00000000b64f17cc
!	Mem[0000000030101410] = 00000000, %l4 = 7cef00a000000000
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 1a000000, %l1 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 000000001a000000

p0_label_462:
!	%l7 = 00000000b64f17cc, Mem[00000000300c1400] = 00000000
	stha	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 17cc0000
!	%l7 = 00000000b64f17cc, Mem[0000000030181410] = 000000ff
	stha	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 17cc00ff
!	%l4 = 0000000000000000, Mem[0000000010001410] = 000000ff
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	%l0 = 000000ff00ff0000, Mem[00000000300c1408] = 00000000
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000010041408] = a700ffff, %l4 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 00000000a700ffff
!	%l4 = 00000000a700ffff, Mem[0000000021800040] = e3ff34f9
	stb	%l4,[%o3+0x040]		! Mem[0000000021800040] = ffff34f9
!	%l3 = 0000000000000000, Mem[0000000010141400] = 00000000
	stba	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%l4 = a700ffff, %l5 = 00000000, Mem[0000000010081418] = 00000000 00000000
	std	%l4,[%i2+0x018]		! Mem[0000000010081418] = a700ffff 00000000
!	%f6  = ffffffe3 00ffbbff, Mem[0000000010041410] = 00000000 00000000
	stda	%f6 ,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffe3 00ffbbff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l4 = 00000000a700ffff
	ldswa	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000

p0_label_463:
!	Mem[0000000010041400] = ff000000, %f23 = 00000000
	lda	[%i1+0x000]%asi,%f23	! %f23 = ff000000
!	Mem[0000000030001408] = 00000000, %l2 = 00000000ff4f0000
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = 25ff0000, %l2 = 0000000000000000
	lduwa	[%i1+%o4]0x89,%l2	! %l2 = 0000000025ff0000
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = ff1a7001, %l3 = 0000000000000000
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ff1a
!	Mem[00000000300c1410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l2 = 0000000025ff0000
	lduha	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l0 = 000000ff00ff0000
	lduba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 00000000 fffff816, %l2 = 00000000, %l3 = 0000ff1a
	ldda	[%i4+%o5]0x88,%l2	! %l2 = 00000000fffff816 0000000000000000
!	Starting 10 instruction Store Burst
!	%f6  = ffffffe3 00ffbbff, %l0 = 0000000000000000
!	Mem[0000000010101430] = ff000000cc174fb6
	add	%i4,0x030,%g1
	stda	%f6,[%g1+%l0]ASI_PST16_P ! Mem[0000000010101430] = ff000000cc174fb6

p0_label_464:
!	Mem[0000000030141408] = ffffffff, %l1 = 000000001a000000
	swapa	[%i5+%o4]0x81,%l1	! %l1 = 00000000ffffffff
!	Code Fragment 4
p0_fragment_32:
!	%l0 = 0000000000000000
	setx	0x7d1ace98368afb9b,%g7,%l0 ! %l0 = 7d1ace98368afb9b
!	%l1 = 00000000ffffffff
	setx	0x64a63e079b88987e,%g7,%l1 ! %l1 = 64a63e079b88987e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7d1ace98368afb9b
	setx	0x63665407c17d5630,%g7,%l0 ! %l0 = 63665407c17d5630
!	%l1 = 64a63e079b88987e
	setx	0xbe00127862c15d37,%g7,%l1 ! %l1 = be00127862c15d37
!	Mem[000000001008141c] = 00000000, %l3 = 0000000000000000
	swap	[%i2+0x01c],%l3		! %l3 = 0000000000000000
!	Code Fragment 4
p0_fragment_33:
!	%l0 = 63665407c17d5630
	setx	0xed555c605e977501,%g7,%l0 ! %l0 = ed555c605e977501
!	%l1 = be00127862c15d37
	setx	0x55cf55d7a0de62db,%g7,%l1 ! %l1 = 55cf55d7a0de62db
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ed555c605e977501
	setx	0xfe78d607c721e313,%g7,%l0 ! %l0 = fe78d607c721e313
!	%l1 = 55cf55d7a0de62db
	setx	0xea1316e0065f2a09,%g7,%l1 ! %l1 = ea1316e0065f2a09
!	%l6 = 00000000ff000000, Mem[0000000030141408] = 1a00000000ffbbff
	stxa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000ff000000
!	%l5 = 0000000000000000, Mem[0000000030001408] = 00000000
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%f4  = ff0003ff, Mem[0000000030181400] = 00000000
	sta	%f4 ,[%i6+%g0]0x89	! Mem[0000000030181400] = ff0003ff
!	Mem[0000000010101414] = 00000000, %l5 = 0000000000000000
	swap	[%i4+0x014],%l5		! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030081400] = b5ffffff
	stba	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 00ffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff1a7001, %l7 = 00000000b64f17cc
	ldsb	[%o2+%g0],%l7		! %l7 = ffffffffffffffff

p0_label_465:
!	Mem[0000000010041408] = 00000000 cc174fb6, %l6 = ff000000, %l7 = ffffffff
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000 00000000cc174fb6
!	Mem[0000000010101408] = 00000000, %l4 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 1ab5feff, %l6 = 0000000000000000
	lduha	[%i5+%o5]0x80,%l6	! %l6 = 0000000000001ab5
!	Mem[0000000010001408] = 00000000 000000ff, %l2 = fffff816, %l3 = 00000000
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l7 = 00000000cc174fb6
	lduha	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (89)
!	Mem[0000000010141400] = 00000000 00000000 ff000000 ffffffff
!	Mem[0000000010141410] = 1ab5feff e3ffffff 0000ff00 00ff0000
!	Mem[0000000010141420] = ffffffff fffeb51a 000000ff 0000ff7e
!	Mem[0000000010141430] = b64f17cc ffe57aff ffff7018 a000ef7c
	ldda	[%i5]ASI_BLK_AIUP,%f0	! Block Load from 0000000010141400
!	Mem[00000000100c1400] = 0000ff00, %l0 = fe78d607c721e313
	ldswa	[%i3+%g0]0x88,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010081420] = ff030039, %l0 = 000000000000ff00
	ldsw	[%i2+0x020],%l0		! %l0 = ffffffffff030039
!	Mem[0000000010041420] = ff00000095a7e5b4, %f22 = 00000000 ff000000
	ldd	[%i1+0x020],%f22	! %f22 = ff000000 95a7e5b4
!	Starting 10 instruction Store Burst
!	%f18 = 00000000 00000000, %l7 = 0000000000000000
!	Mem[0000000030101430] = b64f17cc000000ff
	add	%i4,0x030,%g1
	stda	%f18,[%g1+%l7]ASI_PST32_S ! Mem[0000000030101430] = b64f17cc000000ff

p0_label_466:
!	%f24 = ff030039 95ff00b4, Mem[0000000010041408] = 00000000 b64f17cc
	stda	%f24,[%i1+%o4]0x88	! Mem[0000000010041408] = ff030039 95ff00b4
!	%l4 = 0000000000000000, Mem[0000000030081400] = 00ffffff
	stwa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%f30 = 00000000 000000ff, Mem[0000000030001410] = ff0300ff 00000000
	stda	%f30,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 000000ff
!	%l1 = ea1316e0065f2a09, Mem[0000000010101400] = ff00000000000000, %asi = 80
	stxa	%l1,[%i4+0x000]%asi	! Mem[0000000010101400] = ea1316e0065f2a09
!	%l2 = 0000000000000000, Mem[0000000010081408] = 00000000
	stwa	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010081400] = b5ffffff
	stha	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000ffff
!	%l0 = ff030039, %l1 = 065f2a09, Mem[00000000100c1430] = fffeb51a ff00b51a
	stda	%l0,[%i3+0x030]%asi	! Mem[00000000100c1430] = ff030039 065f2a09
!	%l4 = 0000000000000000, Mem[0000000010001410] = 00000000
	stha	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	Mem[0000000030141400] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff0003ff000000ff, %f18 = 00000000 00000000
	ldda	[%i1+%o5]0x81,%f18	! %f18 = ff0003ff 000000ff

p0_label_467:
!	Mem[0000000030181400] = ff0300ff, %l0 = ffffffffff030039
	lduha	[%i6+%g0]0x81,%l0	! %l0 = 000000000000ff03
!	Mem[000000001004141c] = cc174fb6, %l2 = 0000000000000000
	ldsba	[%i1+0x01f]%asi,%l2	! %l2 = ffffffffffffffb6
!	Mem[0000000030101400] = ff000000e3ffffff, %l4 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l4	! %l4 = ff000000e3ffffff
!	Mem[00000000211c0000] = ff1a7001, %l3 = 00000000000000ff
	ldsba	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041410] = e3ffffff, %l3 = ffffffffffffffff
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000020800000] = ff008ed8, %l2 = ffffffffffffffb6
	ldsba	[%o1+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041410] = ff0003ff, %l3 = ffffffffffffffff
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff0003ff
!	Mem[0000000010081430] = 000000ff, %l1 = ea1316e0065f2a09
	lduba	[%i2+0x031]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ff1a7001, %l6 = 0000000000001ab5
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000ff1a
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010101408] = 00000000
	stwa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000

p0_label_468:
!	Mem[0000000030141408] = 00000000, %l3 = 00000000ff0003ff
	swapa	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%l6 = 000000000000ff1a, Mem[0000000010081428] = ef7c3039
	stb	%l6,[%i2+0x028]		! Mem[0000000010081428] = 1a7c3039
!	Mem[0000000010081410] = ff000000, %l2 = ffffffffffffffff
	swapa	[%i2+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	%f26 = ef7c3039 7abaad19, Mem[0000000030081408] = 00000000 ff000000
	stda	%f26,[%i2+%o4]0x89	! Mem[0000000030081408] = ef7c3039 7abaad19
!	%l4 = e3ffffff, %l5 = 00000000, Mem[0000000030001410] = 000000ff 00000000
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = e3ffffff 00000000
!	Mem[0000000010001418] = 00000000, %l6 = 000000000000ff1a
	swap	[%i0+0x018],%l6		! %l6 = 0000000000000000
!	%f28 = 000000ff ff03ff25, %l1 = 0000000000000000
!	Mem[0000000030101400] = ff000000e3ffffff
	stda	%f28,[%i4+%l1]ASI_PST8_S ! Mem[0000000030101400] = ff000000e3ffffff
!	%l2 = ff000000, %l3 = 00000000, Mem[0000000030141400] = ff0000ff 000000b5
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ff000000 00000000
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 19adba7a, %l0 = 000000000000ff03
	ldswa	[%i2+%o4]0x81,%l0	! %l0 = 0000000019adba7a

p0_label_469:
!	Mem[0000000010101410] = 16f8ffff, %l6 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l6	! %l6 = 0000000016f8ffff
!	%l6 = 0000000016f8ffff, immd = 0000000000000328, %l6  = 0000000016f8ffff
	mulx	%l6,0x328,%l6		! %l6 = 0000004881e7fcd8
!	Mem[00000000218001c0] = 00ff37e3, %l6 = 0000004881e7fcd8
	ldub	[%o3+0x1c0],%l6		! %l6 = 0000000000000000
!	Mem[00000000300c1410] = 0000000078e72495, %f2  = ff000000 ffffffff
	ldda	[%i3+%o5]0x81,%f2 	! %f2  = 00000000 78e72495
!	Mem[0000000010041430] = 1ab5feff, %l4 = ff000000e3ffffff
	lduw	[%i1+0x030],%l4		! %l4 = 000000001ab5feff
!	Mem[0000000010101408] = 0000000000000000, %f4  = 1ab5feff e3ffffff
	ldda	[%i4+0x008]%asi,%f4 	! %f4  = 00000000 00000000
!	Mem[0000000030181400] = ff0003ff, %l2 = 00000000ff000000
	lduha	[%i6+%g0]0x89,%l2	! %l2 = 00000000000003ff
!	Mem[0000000010081400] = 0000ff25ffff0000, %l5 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l5	! %l5 = 0000ff25ffff0000
!	Mem[0000000030041408] = 0000ff25, %l4 = 000000001ab5feff
	lduba	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030001410] = e3ffffff
	stha	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = e3ff0000

p0_label_470:
!	Mem[0000000030101400] = 000000ff, %l6 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%f16 = b5ffffff 25ff0000, %l0 = 0000000019adba7a
!	Mem[0000000010081418] = a700ffff00000000
	add	%i2,0x018,%g1
	stda	%f16,[%g1+%l0]ASI_PST8_P ! Mem[0000000010081418] = a7ffffff25000000
!	%l7 = 0000000000000000, Mem[0000000010181410] = 00000000
	stha	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%l5 = 0000ff25ffff0000, Mem[000000001018141c] = 700025ff
	stw	%l5,[%i6+0x01c]		! Mem[000000001018141c] = ffff0000
!	%f5  = 00000000, Mem[00000000100c142c] = 000000ff
	st	%f5 ,[%i3+0x02c]	! Mem[00000000100c142c] = 00000000
!	Mem[00000000201c0000] = 0000826e, %l5 = 0000ff25ffff0000
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	%f0  = 00000000 00000000, %l1 = 0000000000000000
!	Mem[00000000300c1410] = 0000000078e72495
	add	%i3,0x010,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_SL ! Mem[00000000300c1410] = 0000000078e72495
!	%l2 = 00000000000003ff, %l2 = 00000000000003ff, %l5 = 0000000000000000
	sdivx	%l2,%l2,%l5		! %l5 = 0000000000000001
!	Mem[0000000010181400] = 000003ff, %l6 = 00000000000000ff
	swap	[%i6+%g0],%l6		! %l6 = 00000000000003ff
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000001, imm = 0000000000000f92, %l4 = 0000000000000000
	xor	%l5,0xf92,%l4		! %l4 = 0000000000000f93

p0_label_471:
!	Mem[0000000010041400] = ff000000, %l5 = 0000000000000001
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[00000000201c0000] = ff00826e, %l1 = 0000000000000000
	lduh	[%o0+%g0],%l1		! %l1 = 000000000000ff00
!	Mem[0000000010181410] = 00000000, %l1 = 000000000000ff00
	ldsba	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101438] = 7cef00a0, %l6 = 00000000000003ff
	ldsha	[%i4+0x038]%asi,%l6	! %l6 = 0000000000007cef
!	Mem[0000000020800040] = 0000cbdb, %l6 = 0000000000007cef
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 0000ff0000000000, %l0 = 0000000019adba7a
	ldxa	[%i1+%g0]0x89,%l0	! %l0 = 0000ff0000000000
!	Mem[0000000030081408] = 7abaad19, %l5 = 00000000ff000000
	lduba	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000019
!	Mem[0000000030141410] = 00000000, %l2 = 00000000000003ff
	ldswa	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = ff00001a, %l3 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l3	! %l3 = ffffffffff00001a
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ff00826e, %l4 = 0000000000000f93
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff

p0_label_472:
!	Mem[0000000010041400] = 000000ff, %l3 = ffffffffff00001a
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[00000000201c0000] = ff00826e, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000826e
!	%f26 = ef7c3039, Mem[00000000100c1408] = ff00001a
	sta	%f26,[%i3+0x008]%asi	! Mem[00000000100c1408] = ef7c3039
!	Mem[0000000030041400] = 00000000, %l3 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (90)
!	%l4 = 00000000000000ff, Mem[0000000010141408] = 000000ff
	stha	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[00000000100c1408] = 39307cef 00000000
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 00000000
!	Mem[0000000010081439] = 00000000, %l0 = 0000ff0000000000
	ldstuba	[%i2+0x039]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0001] = 0000826e, %l7 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	%l4 = 00000000000000ff, imm = fffffffffffffb6b, %l0 = 0000000000000000
	xor	%l4,-0x495,%l0		! %l0 = fffffffffffffb94
!	Starting 10 instruction Load Burst
!	Mem[0000000010081404] = 25ff0000, %l6 = 0000000000000000
	lduh	[%i2+0x004],%l6		! %l6 = 00000000000025ff

p0_label_473:
!	Mem[0000000010141410] = 1ab5feff, %l2 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l2	! %l2 = 000000001ab5feff
!	Mem[000000001014142c] = 0000ff7e, %l4 = 00000000000000ff
	lduh	[%i5+0x02c],%l4		! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l1 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l2 = 000000001ab5feff
	ldsha	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 0000000000000000, %l5 = 0000000000000019
	ldxa	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l0 = fffffffffffffb94
	ldsha	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141400] = 000000ff, %l0 = 00000000000000ff
	ldsba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l2 = 0000000000000000
	ldswa	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 00000000 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000300c1410] = 00000000 9524e778
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 00000000

p0_label_474:
!	%l6 = 00000000000025ff, Mem[00000000100c1410] = 00000000
	stha	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 25ff0000
!	Mem[0000000010041408] = b400ff95, %l6 = 00000000000025ff
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 00000000b400ff95
!	Mem[0000000030101410] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%f15 = a000ef7c, %f11 = 0000ff7e, %f6  = 0000ff00
	fmuls	%f15,%f11,%f6 		! %f6  = 80000000
!	%f29 = ff03ff25, %f19 = 000000ff
	fsqrts	%f29,%f19		! %f19 = 7fffffff
!	%f24 = ff030039 95ff00b4, Mem[0000000010041438] = ffffffe3 00000000
	stda	%f24,[%i1+0x038]%asi	! Mem[0000000010041438] = ff030039 95ff00b4
!	Mem[0000000030001408] = ff000000, %l1 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010081410] = ffffffff, %l0 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030041410] = ff0300ff, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l2 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_475:
!	Mem[0000000030081410] = ff000000b64f17cc, %f12 = b64f17cc ffe57aff
	ldda	[%i2+%o5]0x81,%f12	! %f12 = ff000000 b64f17cc
!	Mem[0000000030101408] = 000000ff, %l1 = 00000000ff000000
	ldswa	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181420] = ff000000700025f9, %f16 = b5ffffff 25ff0000
	ldd	[%i6+0x020],%f16	! %f16 = ff000000 700025f9
!	Mem[0000000010041400] = ff000000, %l5 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030181408] = 7cef00a000000000, %l6 = 00000000b400ff95
	ldxa	[%i6+%o4]0x89,%l6	! %l6 = 7cef00a000000000
!	Mem[00000000100c1410] = 25ff0000, %l0 = 00000000000000ff
	lduwa	[%i3+%o5]0x80,%l0	! %l0 = 0000000025ff0000
!	Mem[0000000030041400] = ff00000000ff0000, %l2 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l2	! %l2 = ff00000000ff0000
!	Mem[0000000030041410] = ff000000ff0300ff, %f4  = 00000000 00000000
	ldda	[%i1+%o5]0x89,%f4 	! %f4  = ff000000 ff0300ff
	membar	#Sync			! Added by membar checker (91)
!	Mem[0000000030101400] = 00000000 e3ffffff ff000000 00000000
!	Mem[0000000030101410] = ff000000 ff0300ff ffbbff00 ffffffe3
!	Mem[0000000030101420] = ff000000 95a7e5b4 00000000 000000ff
!	Mem[0000000030101430] = b64f17cc 000000ff 7eff0000 ff000000
	ldda	[%i4]ASI_BLK_SL,%f16	! Block Load from 0000000030101400
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (92)
!	%f0  = 00000000 00000000, %l2 = ff00000000ff0000
!	Mem[0000000030101420] = ff00000095a7e5b4
	add	%i4,0x020,%g1
	stda	%f0,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030101420] = ff00000095a7e5b4

p0_label_476:
!	%l6 = 7cef00a000000000, Mem[0000000010101400] = ea1316e0
	stha	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 000016e0
!	%f3  = 78e72495, Mem[0000000010081400] = 0000ffff
	sta	%f3 ,[%i2+0x000]%asi	! Mem[0000000010081400] = 78e72495
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l6 = 7cef00a000000000, Mem[0000000030141410] = 00000000
	stwa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	Mem[0000000010181400] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000010141410] = fffeb51a
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = fffeb5ff
!	Mem[00000000211c0000] = ff1a7001, %l0 = 0000000025ff0000
	ldstub	[%o2+%g0],%l0		! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l5 = 00000000ff000000
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000

p0_label_477:
!	Mem[0000000010041410] = ffffffe300ffbbff, %f8  = ffffffff fffeb51a
	ldda	[%i1+%o5]0x80,%f8 	! %f8  = ffffffe3 00ffbbff
!	Mem[0000000010181408] = 00000000, %l6 = 7cef00a000000000
	lduba	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l2 = ff00000000ff0000
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1420] = b4e5a795, %l6 = 0000000000000000
	ldswa	[%i3+0x020]%asi,%l6	! %l6 = ffffffffb4e5a795
!	Mem[00000000300c1400] = 00000000 0000cc17, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 000000000000cc17 0000000000000000
!	Mem[0000000010041400] = 00000000000000ff, %l2 = 000000000000cc17
	ldxa	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = 0000000000000000, %l3 = 0000000000000000
	ldx	[%i3+%o4],%l3		! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 0000ff25, %l5 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000025
!	Mem[00000000100c1400] = a000ef7c0000ff00, %f2  = 00000000 78e72495
	ldda	[%i3+%g0]0x88,%f2 	! %f2  = a000ef7c 0000ff00
!	Starting 10 instruction Store Burst
!	%f20 = ff0003ff, Mem[0000000030041410] = ff0003ff
	sta	%f20,[%i1+%o5]0x81	! Mem[0000000030041410] = ff0003ff

p0_label_478:
!	Mem[0000000021800140] = ff001f70, %l4 = 00000000000000ff
	ldstuba	[%o3+0x140]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030041408] = 0000ff25, %l6 = ffffffffb4e5a795
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 000000000000ff25
!	Mem[0000000010081428] = 1a7c30397abaad19, %l1 = 0000000000000000, %l3 = 0000000000000000
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l1,%l3	! %l3 = 1a7c30397abaad19
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010101410] = 16f8ffff 00000000
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff 00000000
!	%f14 = ffff7018 a000ef7c, Mem[0000000010081400] = 9524e778 0000ff25
	stda	%f14,[%i2+%g0]0x88	! Mem[0000000010081400] = ffff7018 a000ef7c
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010141410] = ffb5feff e3ffffff
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff 00000000
!	%f16 = ffffffe3 00000000 00000000 000000ff
!	%f20 = ff0003ff 000000ff e3ffffff 00ffbbff
!	%f24 = b4e5a795 000000ff ff000000 00000000
!	%f28 = ff000000 cc174fb6 000000ff 0000ff7e
	stda	%f16,[%i4]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	%l2 = 000000ff, %l3 = 7abaad19, Mem[0000000010181410] = 00000000 1a000000
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff 7abaad19
	membar	#Sync			! Added by membar checker (93)
!	Mem[0000000010101408] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000, %l4 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l4	! %l4 = 000000000000ff00

p0_label_479:
!	Mem[00000000100c1430] = ff030039, %l7 = 0000000000000000
	ldswa	[%i3+0x030]%asi,%l7	! %l7 = ffffffffff030039
!	Mem[0000000010081408] = 00000000, %l4 = 000000000000ff00
	lduba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = 00000000 00000000, %l4 = 00000000, %l5 = 00000025
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010001408] = ff00000000000000, %f20 = ff0003ff 000000ff
	ldda	[%i0+%o4]0x88,%f20	! %f20 = ff000000 00000000
!	Mem[00000000211c0000] = ff1a7001, %l5 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = 000000000000001a
!	Mem[00000000201c0000] = 00ff826e, %l0 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l1 = 0000000000000000
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = 00000000000000ff, %f22 = e3ffffff 00ffbbff
	ldda	[%i4+%o4]0x88,%f22	! %f22 = 00000000 000000ff
!	Mem[0000000030041410] = ff0003ff000000ff, %l4 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l4	! %l4 = ff0003ff000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 1a7c30397abaad19, Mem[0000000010001406] = 25ff0000, %asi = 80
	stba	%l3,[%i0+0x006]%asi	! Mem[0000000010001404] = 25ff1900

p0_label_480:
!	%f10 = 000000ff 0000ff7e, %l3 = 1a7c30397abaad19
!	Mem[0000000030001428] = ff00000000000000
	add	%i0,0x028,%g1
	stda	%f10,[%g1+%l3]ASI_PST8_S ! Mem[0000000030001428] = ff0000ff0000007e
!	%l4 = ff0003ff000000ff, Mem[0000000010141428] = 000000ff, %asi = 80
	stwa	%l4,[%i5+0x028]%asi	! Mem[0000000010141428] = 000000ff
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000030181400] = ff0003ff 00000000
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff 00000000
!	%l7 = ffffffffff030039, Mem[0000000010041404] = 00000000
	stw	%l7,[%i1+0x004]		! Mem[0000000010041404] = ff030039
!	Mem[0000000010181417] = 19adba7a, %l0 = 00000000000000ff
	ldstub	[%i6+0x017],%l0		! %l0 = 0000007a000000ff
!	%l2 = 00000000000000ff, Mem[0000000030001408] = 00000000
	stba	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
!	Mem[0000000010181400] = ff0000ff, %l4 = ff0003ff000000ff
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000ff0000ff
!	%f2  = a000ef7c 0000ff00, %l6 = 000000000000ff25
!	Mem[0000000010001430] = 000000ffff03ff25
	add	%i0,0x030,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_P ! Mem[0000000010001430] = 000000ff0000ff00
!	%l7 = ffffffffff030039, Mem[0000000010141408] = ff000000
	stha	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 00390000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000000000ff, %f10 = 000000ff 0000ff7e
	ldda	[%i0+%o4]0x80,%f10	! %f10 = 00000000 000000ff

p0_label_481:
!	Mem[00000000100c1410] = 25ff0000, %l2 = 00000000000000ff
	ldsba	[%i3+0x011]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1408] = 00000000, %l4 = 00000000ff0000ff
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = ff000000, %l2 = ffffffffffffffff
	lduha	[%i4+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 00000000000000ff, %f28 = ff000000 cc174fb6
	ldda	[%i4+%o4]0x81,%f28	! %f28 = 00000000 000000ff
!	Mem[0000000030141400] = 000000ff 00000000, %l4 = 00000000, %l5 = 0000001a
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff 0000000000000000
!	%f26 = ff000000, %f27 = 00000000
	fcmps	%fcc3,%f26,%f27		! %fcc3 = 1
!	Mem[0000000030181408] = 00000000, %l3 = 1a7c30397abaad19
	lduwa	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041418] = 39307cef cc174fb6, %l0 = 0000007a, %l1 = 00000000
	ldda	[%i1+0x018]%asi,%l0	! %l0 = 0000000039307cef 00000000cc174fb6
!	Mem[00000000300c1408] = 00000000 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000039307cef, Mem[0000000030081410] = cc174fb6000000ff
	stxa	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000039307cef

p0_label_482:
!	Mem[0000000030101400] = ffffffe3, %l0 = 0000000039307cef
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%f22 = 00000000 000000ff, Mem[0000000010141400] = 00000000 00000000
	stda	%f22,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 000000ff
!	Mem[00000000201c0001] = 00ff826e, %l7 = ffffffffff030039
	ldstub	[%o0+0x001],%l7		! %l7 = 000000ff000000ff
!	%l1 = 00000000cc174fb6, immd = fffffffffffff3a1, %l3  = 0000000000000000
	mulx	%l1,-0xc5f,%l3		! %l3 = fffff6232b9ce376
!	%l3 = fffff6232b9ce376, Mem[00000000211c0001] = ff1a7001, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff767001
!	%f6  = 80000000 00ff0000, Mem[0000000010081408] = 00000000 ff000000
	stda	%f6 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 80000000 00ff0000
!	Mem[0000000010081410] = ffffffff, %l7 = 00000000000000ff
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 00000000ffffffff
!	%l7 = 00000000ffffffff, Mem[00000000211c0000] = ff767001
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = ffff7001
!	%l0 = 00000000000000ff, Mem[0000000010181410] = 000000ff
	stwa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff7001, %l3 = fffff6232b9ce376
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ffff

p0_label_483:
!	Mem[0000000030101408] = 00000000000000ff, %l6 = 000000000000ff25
	ldxa	[%i4+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = ff00000000000000, %f18 = 00000000 000000ff
	ldda	[%i4+%o4]0x89,%f18	! %f18 = ff000000 00000000
!	Mem[0000000010141410] = ff000000, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Code Fragment 3
p0_fragment_34:
!	%l0 = 00000000000000ff
	setx	0x0d32afd00c59028c,%g7,%l0 ! %l0 = 0d32afd00c59028c
!	%l1 = 00000000cc174fb6
	setx	0x37b9bdefba1949df,%g7,%l1 ! %l1 = 37b9bdefba1949df
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0d32afd00c59028c
	setx	0x36cb4db80a81a6d0,%g7,%l0 ! %l0 = 36cb4db80a81a6d0
!	%l1 = 37b9bdefba1949df
	setx	0x3cfb4a9007a2e3d4,%g7,%l1 ! %l1 = 3cfb4a9007a2e3d4
!	Mem[0000000030001400] = ffffffe3 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 00000000ffffffe3 0000000000000000
!	Mem[0000000010101408] = 00000000000000ff, %l1 = 3cfb4a9007a2e3d4
	ldxa	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001408] = ff000000, %l5 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[00000000100c1410] = 25ff0000cc174fb6, %l6 = 00000000000000ff
	ldxa	[%i3+%o5]0x80,%l6	! %l6 = 25ff0000cc174fb6
!	Mem[0000000010041408] = 000025ff, %l7 = 00000000ffffffff
	ldswa	[%i1+%o4]0x80,%l7	! %l7 = 00000000000025ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 000000ff000000ff

p0_label_484:
!	Mem[000000001008143e] = 000000ff, %l3 = 000000000000ffff
	ldstuba	[%i2+0x03e]%asi,%l3	! %l3 = 00000000000000ff
!	%f24 = b4e5a795, %f9  = 00ffbbff, %f10 = 00000000
	fadds	%f24,%f9 ,%f10		! %f10 = b4e5a795
!	Mem[0000000010081400] = a000ef7c, %l5 = 00000000ff000000
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 0000007c000000ff
!	%l0 = 36cb4db80a81a6d0, Mem[00000000100c1400] = 0000ff00
	stwa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0a81a6d0
!	Mem[0000000030141408] = ff0003ff, %l5 = 000000000000007c
	ldstuba	[%i5+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%l4 = ffffffe3, %l5 = 000000ff, Mem[0000000010041428] = ff000000 00000000
	std	%l4,[%i1+0x028]		! Mem[0000000010041428] = ffffffe3 000000ff
!	%l4 = 00000000ffffffe3, Mem[0000000030041410] = ff0003ff
	stwa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffe3
!	%f8  = ffffffe3, Mem[0000000010181410] = ff000000
	sta	%f8 ,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffe3
!	%l4 = ffffffe3, %l5 = 000000ff, Mem[0000000010041400] = 000000ff 390003ff
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffe3 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffe3, %l4 = 00000000ffffffe3
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000ff

p0_label_485:
!	Mem[00000000100c1400] = 0a81a6d0, %l6 = 25ff0000cc174fb6
	ldsha	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffffa6d0
!	%l1 = 00000000000000ff, Mem[0000000030181408] = 00000000a000ef7c
	stxa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000000000ff
!	Mem[00000000218001c0] = 00ff37e3, %l4 = 00000000000000ff
	ldsba	[%o3+0x1c1]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041430] = 1ab5feff, %l6 = ffffffffffffa6d0
	ldsb	[%i1+0x033],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = ffff7001, %l2 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010081408] = 0000ff0000000080, %f4  = ff000000 ff0300ff
	ldd	[%i2+%o4],%f4 		! %f4  = 0000ff00 00000080
!	Mem[0000000010181408] = 00000000, %f8  = ffffffe3
	lda	[%i6+%o4]0x80,%f8 	! %f8 = 00000000
!	Mem[0000000010041400] = 000000ff ffffffe3, %l2 = 0000ffff, %l3 = 00000000
	ldda	[%i1+%g0]0x88,%l2	! %l2 = 00000000ffffffe3 00000000000000ff
!	Mem[00000000201c0000] = 00ff826e, %l3 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f16 = ffffffe3 00000000 ff000000 00000000
!	%f20 = ff000000 00000000 00000000 000000ff
!	%f24 = b4e5a795 000000ff ff000000 00000000
!	%f28 = 00000000 000000ff 000000ff 0000ff7e
	stda	%f16,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400

p0_label_486:
!	%f0  = 00000000 00000000, %l5 = 00000000000000ff
!	Mem[0000000030141438] = 00ff80c59d000000
	add	%i5,0x038,%g1
	stda	%f0,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030141438] = 0000000000000000
!	%l4 = ffffffffffffffff, Mem[0000000030001410] = e3ff0000
	stha	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = e3ffffff
!	Mem[0000000010041430] = 1ab5feff1ab5feff, %l0 = 36cb4db80a81a6d0, %l7 = 00000000000025ff
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = 1ab5feff1ab5feff
!	%l0 = 36cb4db80a81a6d0, Mem[0000000010001410] = 00000000
	stwa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 0a81a6d0
!	%f0  = 00000000 00000000, %l7 = 1ab5feff1ab5feff
!	Mem[0000000010181420] = ff000000700025f9
	add	%i6,0x020,%g1
	stda	%f0,[%g1+%l7]ASI_PST16_P ! Mem[0000000010181420] = 0000000000000000
!	%f10 = b4e5a795, Mem[000000001010143c] = 0000ff7e
	st	%f10,[%i4+0x03c]	! Mem[000000001010143c] = b4e5a795
!	%f11 = 000000ff, %f11 = 000000ff, %f12 = ff000000
	fsubs	%f11,%f11,%f12		! %l0 = 36cb4db80a81a6f2, Unfinished, %fsr = 1400000000
!	%l1 = 00000000000000ff, Mem[0000000010181410] = ffffffe3
	stha	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 00ffffe3
!	Mem[00000000100c1400] = d0a6810a, %l7 = 1ab5feff1ab5feff
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 00000000d0a6810a
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_487:
!	Mem[0000000010041410] = ffffffe3 00ffbbff, %l0 = 0a81a6f2, %l1 = 000000ff
	ldda	[%i1+%o5]0x80,%l0	! %l0 = 00000000ffffffe3 0000000000ffbbff
!	Mem[0000000030081408] = 19adba7a 39307cef, %l0 = ffffffe3, %l1 = 00ffbbff
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 0000000019adba7a 0000000039307cef
!	Mem[0000000010081408] = 0000ff00, %l5 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1434] = 065f2a09, %l4 = ffffffffffffffff
	ldsw	[%i3+0x034],%l4		! %l4 = 00000000065f2a09
!	Mem[0000000010141420] = ffffffff, %l0 = 0000000019adba7a
	lduh	[%i5+0x022],%l0		! %l0 = 000000000000ffff
!	Mem[000000001010142c] = 00000000, %l4 = 00000000065f2a09
	ldsh	[%i4+0x02c],%l4		! %l4 = 0000000000000000
!	Mem[000000001010142c] = 00000000, %f7  = 00ff0000
	lda	[%i4+0x02c]%asi,%f7 	! %f7 = 00000000
!	Mem[0000000030101408] = 00000000, %l7 = 00000000d0a6810a
	lduha	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141430] = b64f17ccffe57aff, %f0  = 00000000 00000000
	ldda	[%i5+0x030]%asi,%f0 	! %f0  = b64f17cc ffe57aff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (94)
!	Mem[0000000030181400] = 00000000, %l0 = 000000000000ffff
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000

p0_label_488:
!	%l6 = ffffffffffffffff, Mem[0000000010001418] = 0000ff1a00000000
	stx	%l6,[%i0+0x018]		! Mem[0000000010001418] = ffffffffffffffff
!	%l2 = 00000000ffffffe3, Mem[0000000030081400] = 00000000
	stha	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = ffe30000
!	%l7 = 0000000000000000, Mem[0000000030181408] = 00000000
	stba	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	Mem[0000000030101410] = ff0300ff, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	%l6 = ffffffffffffffff, Mem[0000000030141400] = 000000ff
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = ffff00ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010101430] = ff000000 cc174fb6
	std	%l4,[%i4+0x030]		! Mem[0000000010101430] = 00000000 00000000
!	%l6 = ffffffffffffffff, %l5 = 0000000000000000, %y  = ff000000
	udiv	%l6,%l5,%l1		! Div by zero, %l0 = 0000000000000050
	mov	%l0,%y			! %y = 00000028
!	%l7 = 00000000000000ff, Mem[0000000030081400] = 0000e3ff
	stha	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	Mem[0000000030001410] = ffffffe3, %l0 = 0000000000000028
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 00000000ffffffe3
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff000000, %l7 = 00000000000000ff
	lduba	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff

p0_label_489:
!	Mem[00000000211c0000] = ffff7001, %l3 = 00000000000000ff
	ldsba	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030001400] = e3ffffff, %l2 = 00000000ffffffe3
	lduba	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = ffef00a0, %l5 = 0000000000000000
	ldsha	[%i2+0x002]%asi,%l5	! %l5 = 00000000000000a0
!	Mem[0000000010081404] = 1870ffff, %l4 = 0000000000000000
	lduw	[%i2+0x004],%l4		! %l4 = 000000001870ffff
!	Mem[0000000021800080] = 28ff944f, %l6 = ffffffffffffffff
	lduba	[%o3+0x081]%asi,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (95)
!	Mem[0000000030001400] = ffffffe3 00000000 ff000000 00000000
!	Mem[0000000030001410] = 00000028 00000000 e3ffffff 00ffbbff
!	Mem[0000000030001420] = b4e5a795 000000ff ff0000ff 0000007e
!	Mem[0000000030001430] = ff000000 cc174fb6 000000ff 0000ff7e
	ldda	[%i0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030001400
!	Code Fragment 4
p0_fragment_35:
!	%l0 = 00000000ffffffe3
	setx	0x6d49fd17ec5b7ddf,%g7,%l0 ! %l0 = 6d49fd17ec5b7ddf
!	%l1 = 0000000039307cef
	setx	0xc2f0fc07b507fbfd,%g7,%l1 ! %l1 = c2f0fc07b507fbfd
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6d49fd17ec5b7ddf
	setx	0x2beb2a605ba80247,%g7,%l0 ! %l0 = 2beb2a605ba80247
!	%l1 = c2f0fc07b507fbfd
	setx	0x74691bb848edfcf0,%g7,%l1 ! %l1 = 74691bb848edfcf0
!	Mem[00000000211c0000] = ffff7001, %l6 = 00000000000000ff
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[0000000030001410] = 00000000 28000000, %l4 = 1870ffff, %l5 = 000000a0
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 0000000028000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = ff000000 b64f17cc, Mem[00000000300c1408] = 00000000 00000000
	stda	%f12,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000 b64f17cc

p0_label_490:
!	%f4  = 0000ff00 00000080, Mem[0000000030101408] = 00000000 ff000000
	stda	%f4 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000ff00 00000080
!	%f4  = 0000ff00 00000080, Mem[0000000010101400] = e0160000 092a5f06
	stda	%f4 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000ff00 00000080
!	Mem[0000000030181408] = 00000000, %l6 = 000000000000ffff
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l3 = ffffffffffffffff, Mem[00000000211c0001] = ffff7001
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = ffff7001
!	%f8  = 00000000, %f0  = b64f17cc, %f4  = 0000ff00
	fdivs	%f8 ,%f0 ,%f4 		! %f4  = 80000000
!	Mem[0000000010181408] = 00000000, %l3 = ffffffffffffffff
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010041400] = e3ffffff, %asi = 80
	stba	%l5,[%i1+0x000]%asi	! Mem[0000000010041400] = 00ffffff
!	%f10 = b4e5a795 000000ff, Mem[0000000010181400] = ff000000 00000000
	stda	%f10,[%i6+0x000]%asi	! Mem[0000000010181400] = b4e5a795 000000ff
!	%f14 = ffff7018, Mem[0000000030141410] = 00000000
	sta	%f14,[%i5+%o5]0x89	! Mem[0000000030141410] = ffff7018
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 25ff0000, %l2 = 00000000000000ff
	ldsha	[%i3+%o5]0x80,%l2	! %l2 = 00000000000025ff

p0_label_491:
!	Mem[00000000100c1420] = b4e5a795 ff0000ff, %l4 = 28000000, %l5 = 00000000
	ldd	[%i3+0x020],%l4		! %l4 = 00000000b4e5a795 00000000ff0000ff
	membar	#Sync			! Added by membar checker (96)
!	Mem[0000000030181400] = ffff0000 e3ffffff 0000ffff 000000ff
!	Mem[0000000030181410] = 00000000 000000ff ff000000 00000000
!	Mem[0000000030181420] = ff000000 95a7e5b4 00000000 000000ff
!	Mem[0000000030181430] = ff000000 00000000 7eff0000 ff000000
	ldda	[%i6]ASI_BLK_AIUS,%f0	! Block Load from 0000000030181400
!	Mem[0000000010041404] = ff000000, %l2 = 00000000000025ff
	ldub	[%i1+0x007],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081408] = 0000ff00, %l3 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010101438] = 7cef00a0, %f24 = b4e5a795
	lda	[%i4+0x038]%asi,%f24	! %f24 = 7cef00a0
!	%f26 = ff0000ff, %f27 = 0000007e, %f21 = 00000000
	fmuls	%f26,%f27,%f21		! %l0 = 2beb2a605ba80269, Unfinished, %fsr = 1400000000
!	Mem[0000000010001400] = 00000000, %l3 = 000000000000ff00
	lduba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%l4 = 00000000b4e5a795, imm = 000000000000072b, %l5 = 00000000ff0000ff
	addc	%l4,0x72b,%l5		! %l5 = 00000000b4e5aec0
!	Mem[00000000201c0000] = 00ff826e, %l0 = 2beb2a605ba80269
	ldub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000030001410] = 28000000
	stwa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff

p0_label_492:
!	%l6 = 0000000000000000, Mem[000000001018143f] = 00ff0000, %asi = 80
	stba	%l6,[%i6+0x03f]%asi	! Mem[000000001018143c] = 00ff0000
!	Mem[0000000010101408] = 000000ff, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l4 = 00000000b4e5a795, Mem[00000000211c0001] = ffff7001, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff957001
!	%l5 = 00000000b4e5aec0, Mem[00000000300c1410] = 0000000000000000
	stxa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000b4e5aec0
!	Mem[0000000030181400] = ffff0000, %l4 = 00000000b4e5a795
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	%f30 = 000000ff, Mem[00000000100c1400] = 1ab5feff
	sta	%f30,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	%l0 = 000000ff, %l1 = 48edfcf0, Mem[0000000010101410] = 000000ff 00000000
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff 48edfcf0
!	%f25 = 000000ff, Mem[0000000010081408] = 0000ff00
	sta	%f25,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff
!	%l2 = 0000000000000000, Mem[0000000030001408] = 000000ff
	stba	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ffff00ff, %l0 = 00000000000000ff
	lduwa	[%i5+%g0]0x81,%l0	! %l0 = 00000000ffff00ff

p0_label_493:
!	Mem[0000000020800040] = 0000cbdb, %l0 = 00000000ffff00ff
	ldub	[%o1+0x041],%l0		! %l0 = 0000000000000000
!	Mem[00000000211c0000] = ff957001, %l7 = 00000000000000ff
	ldub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010181400] = b4e5a795, %l4 = 00000000000000ff
	ldswa	[%i6+%g0]0x80,%l4	! %l4 = ffffffffb4e5a795
!	Mem[00000000100c1400] = ff000000, %l1 = 74691bb848edfcf0
	lduha	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001010142c] = 00000000, %l0 = 0000000000000000
	ldsha	[%i4+0x02c]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 0000ff25, %l6 = 0000000000000000
	ldswa	[%i3+%o5]0x88,%l6	! %l6 = 000000000000ff25
!	%l4 = ffffffffb4e5a795, imm = 0000000000000959, %l4 = ffffffffb4e5a795
	xnor	%l4,0x959,%l4		! %l4 = 000000004b1a5133
!	Mem[0000000030081410] = ef7c3039, %l5 = 00000000b4e5aec0
	lduha	[%i2+%o5]0x81,%l5	! %l5 = 000000000000ef7c
!	Mem[0000000030141400] = ffff00ff00000000, %f22 = e3ffffff 00ffbbff
	ldda	[%i5+%g0]0x81,%f22	! %f22 = ffff00ff 00000000
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[00000000100c1410] = 25ff0000cc174fb6, %asi = 80
	stxa	%l3,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00000000000000ff

p0_label_494:
!	Mem[0000000010081400] = ffef00a0, %l7 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ffef00a0
!	%l1 = 0000000000000000, Mem[000000001000143f] = 000000ff, %asi = 80
	stba	%l1,[%i0+0x03f]%asi	! Mem[000000001000143c] = 00000000
!	Mem[0000000030101408] = 80000000, %l4 = 000000004b1a5133
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 0000000080000000
!	%f26 = ff0000ff 0000007e, Mem[00000000100c1400] = ff000000 a000ef7c
	stda	%f26,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff0000ff 0000007e
!	%f16 = ffffffe3, Mem[0000000010081408] = ff000000
	sta	%f16,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffe3
!	%l3 = 00000000000000ff, Mem[0000000030101400] = 00000000e3ffffff
	stxa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030001400] = ffffffe300000000
	stxa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	Code Fragment 4
p0_fragment_36:
!	%l0 = 0000000000000000
	setx	0xf60f58a028a8876a,%g7,%l0 ! %l0 = f60f58a028a8876a
!	%l1 = 0000000000000000
	setx	0x0933eef7ce9fd628,%g7,%l1 ! %l1 = 0933eef7ce9fd628
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f60f58a028a8876a
	setx	0x91b8a66fbee7f393,%g7,%l0 ! %l0 = 91b8a66fbee7f393
!	%l1 = 0933eef7ce9fd628
	setx	0xe14b0147f1e0b17f,%g7,%l1 ! %l1 = e14b0147f1e0b17f
!	%l3 = 00000000000000ff, Mem[0000000030001410] = ff000000
	stha	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ff0000
!	Starting 10 instruction Load Burst
!	%f10 = 00000000, %f10 = 00000000
	fcmpes	%fcc2,%f10,%f10		! %fcc2 = 0

p0_label_495:
!	Mem[0000000010001438] = 00000000 00000000, %l6 = 0000ff25, %l7 = ffef00a0
	ldda	[%i0+0x038]%asi,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030101408] = 4b1a513300ff0000, %f22 = ffff00ff 00000000
	ldda	[%i4+%o4]0x81,%f22	! %f22 = 4b1a5133 00ff0000
!	Mem[000000001010143c] = b4e5a795, %l2 = 0000000000000000
	lduh	[%i4+0x03e],%l2		! %l2 = 000000000000a795
!	Mem[0000000030081400] = ff000000, %l0 = 91b8a66fbee7f393
	ldswa	[%i2+%g0]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010001410] = d0a6810a, %l7 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 000000000000000a
!	Mem[0000000010081400] = ff000000, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 0000ff0000000080, %l7 = 000000000000000a
	ldxa	[%i4+%g0]0x88,%l7	! %l7 = 0000ff0000000080
!	Mem[00000000100c1410] = 00000000 000000ff, %l6 = 00000000, %l7 = 00000080
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000 00000000000000ff
!	Mem[0000000010181404] = 000000ff, %l3 = 00000000000000ff
	lduha	[%i6+0x004]%asi,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[00000000300c1400] = 17cc0000
	stwa	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000

p0_label_496:
!	%l2 = 000000000000a795, Mem[0000000010141410] = ff000000
	stba	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = ff000095
!	Mem[0000000030081410] = ef7c3039, %l7 = 00000000000000ff
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 00000000ef7c3039
!	Mem[0000000030141400] = ff00ffff, %l4 = 0000000080000000
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 00000000ff00ffff
!	Mem[00000000211c0001] = ff957001, %l3 = 0000000000000000
	ldstub	[%o2+0x001],%l3		! %l3 = 00000095000000ff
!	Mem[0000000010041400] = ffffff00, %l2 = 000000000000a795
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 00000000ffffff00
!	Mem[0000000030181400] = ffff0000, %l1 = e14b0147f1e0b17f
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%l2 = 00000000ffffff00, Mem[0000000010141400] = 000000ff
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%f2  = 0000ffff 000000ff, Mem[0000000010081410] = ff000000 b64f17cc
	stda	%f2 ,[%i2+0x010]%asi	! Mem[0000000010081410] = 0000ffff 000000ff
!	%l0 = ffffffffff000000, Mem[0000000010001410] = 0a81a6d0
	stba	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 0081a6d0
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 0000000000000000, %l5 = 000000000000ef7c
	ldxa	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000

p0_label_497:
!	Mem[0000000010141430] = b64f17cc ffe57aff, %l2 = ffffff00, %l3 = 00000095
	ldda	[%i5+0x030]%asi,%l2	! %l2 = 00000000b64f17cc 00000000ffe57aff
!	Mem[0000000030081408] = 19adba7a, %l6 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000019
!	Mem[0000000010101408] = 00000000, %l1 = 00000000000000ff
	lduba	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000019
	lduha	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l4 = 00000000ff00ffff, %l1 = 0000000000000000, %l3 = 00000000ffe57aff
	xor	%l4,%l1,%l3		! %l3 = 00000000ff00ffff
!	Mem[00000000211c0000] = ffff7001, %l2 = 00000000b64f17cc
	ldub	[%o2+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030041408] = 95a7e5b4, %l3 = 00000000ff00ffff
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = ffffffff95a7e5b4
!	Mem[0000000030141400] = 0000000080000000, %l6 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l6	! %l6 = 0000000080000000
!	Mem[0000000010181408] = ff000000 00000000, %l0 = ff000000, %l1 = 00000000
	ldda	[%i6+0x008]%asi,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%f10 = 00000000 000000ff, Mem[0000000030001408] = 00000000 00000000
	stda	%f10,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 000000ff

p0_label_498:
!	%l5 = 0000000000000000, Mem[0000000010001424] = 95ff00b4, %asi = 80
	stha	%l5,[%i0+0x024]%asi	! Mem[0000000010001424] = 000000b4
!	%l0 = ff000000, %l1 = 00000000, Mem[0000000010081408] = e3ffffff 00000080
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000 00000000
!	%f26 = ff0000ff 0000007e, %l5 = 0000000000000000
!	Mem[0000000010081430] = 000000ffff03ff25
	add	%i2,0x030,%g1
	stda	%f26,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010081430] = 000000ffff03ff25
!	Mem[0000000030181408] = 0000ffff, %l3 = ffffffff95a7e5b4
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Code Fragment 3
p0_fragment_37:
!	%l0 = 00000000ff000000
	setx	0x1866ab8f864ef9c9,%g7,%l0 ! %l0 = 1866ab8f864ef9c9
!	%l1 = 0000000000000000
	setx	0x56a0360f9fd058a9,%g7,%l1 ! %l1 = 56a0360f9fd058a9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1866ab8f864ef9c9
	setx	0x6cbb7af80823eb0e,%g7,%l0 ! %l0 = 6cbb7af80823eb0e
!	%l1 = 56a0360f9fd058a9
	setx	0x212ff567a0146f15,%g7,%l1 ! %l1 = 212ff567a0146f15
!	%f20 = 00000028 00000000, Mem[0000000010141430] = b64f17cc ffe57aff
	stda	%f20,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000028 00000000
!	%l7 = 00000000ef7c3039, %l5 = 0000000000000000, %l5 = 0000000000000000
	xnor	%l7,%l5,%l5		! %l5 = ffffffff1083cfc6
!	%l2 = 00000000000000ff, Mem[0000000010141438] = ffff7018
	sth	%l2,[%i5+0x038]		! Mem[0000000010141438] = 00ff7018
!	Mem[0000000010181408] = ff000000, %l1 = 212ff567a0146f15
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	%f6  = ff000000, %f29 = cc174fb6
	fcmpes	%fcc2,%f6 ,%f29		! %fcc2 = 1

p0_label_499:
!	Mem[0000000030041408] = ffffffff95a7e5b4, %l3 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l3	! %l3 = ffffffff95a7e5b4
!	Mem[0000000020800040] = 0000cbdb, %l5 = ffffffff1083cfc6
	ldsha	[%o1+0x040]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000ef7c3039
	ldsha	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%l1 = 00000000000000ff, immed = 0000056a, %y  = 00000028
	smul	%l1,0x56a,%l7		! %l7 = 0000000000056496, %y = 00000000
!	Mem[00000000300c1400] = 00000000, %l0 = 6cbb7af80823eb0e
	ldsba	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = 00000000000000ff, %f2  = 0000ffff 000000ff
	ldda	[%i0+%o4]0x81,%f2 	! %f2  = 00000000 000000ff
!	%l6 = 0000000080000000, Mem[00000000211c0000] = ffff7001, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff7001
!	Mem[0000000030041400] = ff00000000ff0000, %l6 = 0000000080000000
	ldxa	[%i1+%g0]0x81,%l6	! %l6 = ff00000000ff0000
!	Mem[0000000030001410] = 0000ff00, %f0  = ffff0000
	lda	[%i0+%o5]0x89,%f0 	! %f0 = 0000ff00
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010141434] = 00000000, %asi = 80
	stwa	%l2,[%i5+0x034]%asi	! Mem[0000000010141434] = 000000ff

p0_label_500:
!	Mem[0000000010181428] = d800ffd7, %l3 = ffffffff95a7e5b4, %asi = 80
	swapa	[%i6+0x028]%asi,%l3	! %l3 = 00000000d800ffd7
!	%l1 = 00000000000000ff, Mem[0000000030101410] = ff0003ff
	stha	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ff03ff
	membar	#Sync			! Added by membar checker (97)
!	%l0 = 0000000000000000, Mem[0000000030181410] = 00000000
	stha	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010081416] = 000000ff, %asi = 80
	stha	%l5,[%i2+0x016]%asi	! Mem[0000000010081414] = 00000000
!	Mem[0000000030101400] = ff000000, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010141408] = 00390000, %l7 = 0000000000056496
	swap	[%i5+%o4],%l7		! %l7 = 0000000000390000
!	%l5 = 00000000ff000000, Mem[0000000030041408] = b4e5a795
	stba	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 00e5a795
!	%l2 = 000000ff, %l3 = d800ffd7, Mem[0000000010101418] = 1ab5feff 00ffbbff
	stda	%l2,[%i4+0x018]%asi	! Mem[0000000010101418] = 000000ff d800ffd7
!	%l1 = 00000000000000ff, Mem[0000000030141408] = 000000ffff0300ff
	stxa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = cc174fb6 d0a68100, %l4 = ff00ffff, %l5 = ff000000
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 00000000d0a68100 00000000cc174fb6

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	udiv	%l1,0xda7,%l5
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000d800ffd7
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000d0a68100
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000cc174fb6
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be ff00000000ff0000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000390000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 0000ff00 e3ffffff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 000000ff
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 000000ff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ff000000 00000000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be ff000000 95a7e5b4
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 000000ff
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be ff000000 00000000
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 7eff0000 ff000000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ffffffe3 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ff000000 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000028 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 4b1a5133 00ff0000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 7cef00a0 000000ff
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ff0000ff 0000007e
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ff000000 cc174fb6
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 000000ff 0000ff7e
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
	fsqrts	%f8 ,%f9 
	ldstuba	[%i4+%g0]ASI_AS_IF_USER_PRIMARY,%l5	! Mem[0000000010101400]
	or	%l7,%l7,%l5
	orn	%l1,0x5bc,%l6
	done

p0_trap1o:
	fsqrts	%f8 ,%f9 
	ldstuba	[%o4+%g0]ASI_AS_IF_USER_PRIMARY,%l5	! Mem[0000000010101400]
	or	%l7,%l7,%l5
	orn	%l1,0x5bc,%l6
	done


p0_trap2e:
	subc	%l3,%l1,%l0
	done

p0_trap2o:
	subc	%l3,%l1,%l0
	done


p0_trap3e:
	and	%l7,0x0fd,%l4
	add	%l4,0x41d,%l7
	sub	%l1,0xdb1,%l7
	sub	%l3,%l2,%l2
	andn	%l0,%l7,%l1
	done

p0_trap3o:
	and	%l7,0x0fd,%l4
	add	%l4,0x41d,%l7
	sub	%l1,0xdb1,%l7
	sub	%l3,%l2,%l2
	andn	%l0,%l7,%l1
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
	ldx	[%g1+0x000],%l0		! %l0 = 1ef21a2e18c4b9d8
	ldx	[%g1+0x008],%l1		! %l1 = 3677fda659dc91dd
	ldx	[%g1+0x010],%l2		! %l2 = 4d983392d9e32dbc
	ldx	[%g1+0x018],%l3		! %l3 = fe7199c0c7ac7d98
	ldx	[%g1+0x020],%l4		! %l4 = 1c840a3242d10b39
	ldx	[%g1+0x028],%l5		! %l5 = 4154c970b7afb8fd
	ldx	[%g1+0x030],%l6		! %l6 = 256f185480377cff
	ldx	[%g1+0x038],%l7		! %l7 = fe4ec4fa7269168c

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
	ldsh	[%i2+0x038],%l5		! Mem[0000000010081438]
	xor	%l2,%l5,%l7
	or	%l5,0x329,%l7
	sdivx	%l4,%l1,%l0
	fdivs	%f4 ,%f0 ,%f14
	smul	%l6,%l4,%l7
	fitod	%f11,%f8 
	jmpl	%o7,%g0
	add	%l0,%l1,%l2
p0_near_0_he:
	jmpl	%o7,%g0
	subc	%l6,-0xd28,%l0
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	fadds	%f29,%f16,%f16
	addc	%l5,%l3,%l2
	jmpl	%o7,%g0
	smul	%l7,%l3,%l2
near0_b2b_l:
	fdivs	%f3 ,%f0 ,%f0 
	udivx	%l4,0x3f2,%l5
	jmpl	%o7,%g0
	fadds	%f14,%f2 ,%f10
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	addc	%l1,-0x442,%l4
	jmpl	%o7,%g0
	fdivs	%f12,%f15,%f5 
p0_near_1_he:
	fadds	%f22,%f17,%f28
	jmpl	%o7,%g0
	subc	%l7,0x935,%l7
near1_b2b_h:
	sub	%l5,%l4,%l0
	jmpl	%o7,%g0
	sub	%l0,%l7,%l4
near1_b2b_l:
	subc	%l7,%l1,%l0
	jmpl	%o7,%g0
	andn	%l5,%l0,%l0
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	fmuls	%f4 ,%f4 ,%f0 
	umul	%l2,-0xbd1,%l6
	fcmps	%fcc1,%f4 ,%f12
	andn	%l7,-0x294,%l6
	subc	%l0,-0x5a2,%l3
	jmpl	%o7,%g0
	sub	%l2,%l0,%l5
p0_near_2_he:
	fmuls	%f21,%f26,%f30
	fsqrts	%f30,%f20
	jmpl	%o7,%g0
	fmuls	%f23,%f18,%f21
near2_b2b_h:
	orn	%l2,0xf29,%l6
	smul	%l0,0x014,%l2
	jmpl	%o7,%g0
	fsqrts	%f22,%f21
near2_b2b_l:
	smul	%l6,-0x70c,%l5
	andn	%l5,-0x662,%l4
	jmpl	%o7,%g0
	smul	%l5,0xd97,%l3
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	smul	%l3,%l0,%l3
	and	%l4,-0xa78,%l6
	andn	%l2,%l6,%l5
	xnor	%l3,%l7,%l0
	fdivs	%f14,%f11,%f5 
	add	%l1,0x188,%l1
	xnor	%l3,0x96d,%l7
	jmpl	%o7,%g0
	xnor	%l1,0xd80,%l4
p0_near_3_he:
	udivx	%l2,0x459,%l4
	std	%l4,[%i3+0x020]		! Mem[00000000100c1420]
	fadds	%f17,%f30,%f21
	udivx	%l0,0xbc2,%l6
	xnor	%l5,%l0,%l2
	sdivx	%l6,%l2,%l4
	jmpl	%o7,%g0
	subc	%l4,0x62c,%l6
near3_b2b_h:
	fdtos	%f30,%f26
	fadds	%f17,%f24,%f22
	fcmps	%fcc2,%f20,%f25
	fadds	%f20,%f20,%f18
	fsubs	%f28,%f29,%f25
	umul	%l4,0xaec,%l4
	jmpl	%o7,%g0
	fdivs	%f30,%f16,%f27
near3_b2b_l:
	fsqrts	%f8 ,%f10
	or	%l2,-0x4fd,%l4
	fmuls	%f5 ,%f6 ,%f10
	xor	%l1,%l4,%l1
	subc	%l2,0x4c1,%l5
	fadds	%f15,%f6 ,%f11
	jmpl	%o7,%g0
	smul	%l1,%l4,%l4
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	xor	%l6,%l1,%l7
	fsqrts	%f3 ,%f9 
	umul	%l1,0x333,%l1
	fcmps	%fcc1,%f4 ,%f11
	or	%l5,%l0,%l1
	jmpl	%o7,%g0
	sdivx	%l6,%l3,%l3
p0_far_0_lem:
	xor	%l6,%l1,%l7
	fsqrts	%f3 ,%f9 
	umul	%l1,0x333,%l1
	fcmps	%fcc1,%f4 ,%f11
	or	%l5,%l0,%l1
	jmpl	%o7,%g0
	sdivx	%l6,%l3,%l3
p0_far_0_he:
	mulx	%l7,%l7,%l4
	fsqrts	%f25,%f26
	xor	%l5,%l3,%l7
	smul	%l0,%l5,%l0
	fadds	%f28,%f20,%f20
	fcmps	%fcc1,%f30,%f27
	umul	%l4,%l1,%l0
	jmpl	%o7,%g0
	sdivx	%l4,%l0,%l5
p0_far_0_hem:
	mulx	%l7,%l7,%l4
	fsqrts	%f25,%f26
	xor	%l5,%l3,%l7
	smul	%l0,%l5,%l0
	fadds	%f28,%f20,%f20
	fcmps	%fcc1,%f30,%f27
	umul	%l4,%l1,%l0
	jmpl	%o7,%g0
	sdivx	%l4,%l0,%l5
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	sub	%l5,%l4,%l3
	mulx	%l0,0x6f5,%l4
	andn	%l0,%l2,%l7
	orn	%l0,%l6,%l6
	jmpl	%o7,%g0
	sub	%l2,0xc20,%l6
far0_b2b_l:
	fadds	%f13,%f6 ,%f7 
	sdivx	%l1,-0x730,%l4
	mulx	%l5,-0xcb3,%l5
	or	%l7,0x18c,%l0
	jmpl	%o7,%g0
	sdivx	%l2,0x523,%l6
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fcmps	%fcc2,%f9 ,%f3 
	fdivs	%f2 ,%f9 ,%f9 
	udivx	%l1,%l2,%l1
	xnor	%l6,0x3c4,%l0
	jmpl	%o7,%g0
	umul	%l7,%l4,%l0
p0_far_1_lem:
	fcmps	%fcc2,%f9 ,%f3 
	fdivs	%f2 ,%f9 ,%f9 
	udivx	%l1,%l2,%l1
	xnor	%l6,0x3c4,%l0
	jmpl	%o7,%g0
	umul	%l7,%l4,%l0
p0_far_1_he:
	sdivx	%l4,-0x6f1,%l5
	umul	%l4,%l1,%l6
	sub	%l5,0xd17,%l4
	andn	%l0,0x7be,%l5
	add	%l0,%l7,%l4
	mulx	%l4,%l3,%l3
	jmpl	%o7,%g0
	umul	%l6,%l6,%l7
p0_far_1_hem:
	sdivx	%l4,-0x6f1,%l5
	umul	%l4,%l1,%l6
	sub	%l5,0xd17,%l4
	andn	%l0,0x7be,%l5
	add	%l0,%l7,%l4
	mulx	%l4,%l3,%l3
	jmpl	%o7,%g0
	umul	%l6,%l6,%l7
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	xnor	%l7,%l2,%l7
	smul	%l2,-0x226,%l0
	xor	%l6,%l5,%l0
	jmpl	%o7,%g0
	subc	%l4,-0x5f2,%l5
far1_b2b_l:
	smul	%l2,0x03d,%l3
	xnor	%l4,%l2,%l5
	mulx	%l7,-0x942,%l6
	jmpl	%o7,%g0
	fsubs	%f8 ,%f12,%f8 
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	xor	%l0,%l2,%l5
	orn	%l2,%l4,%l7
	mulx	%l3,%l1,%l1
	jmpl	%o7,%g0
	addc	%l2,-0x79d,%l6
p0_far_2_lem:
	xor	%l0,%l2,%l5
	orn	%l2,%l4,%l7
	mulx	%l3,%l1,%l1
	jmpl	%o7,%g0
	addc	%l2,-0x79d,%l6
p0_far_2_he:
	addc	%l5,%l3,%l6
	jmpl	%o7,%g0
	mulx	%l1,-0x54b,%l2
p0_far_2_hem:
	addc	%l5,%l3,%l6
	jmpl	%o7,%g0
	mulx	%l1,-0x54b,%l2
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	udivx	%l1,%l3,%l1
	fsqrts	%f23,%f21
	xor	%l2,%l0,%l4
	jmpl	%o7,%g0
	smul	%l7,%l4,%l4
far2_b2b_l:
	smul	%l1,%l4,%l1
	addc	%l2,-0x2f2,%l7
	xor	%l6,-0xed5,%l3
	jmpl	%o7,%g0
	fcmps	%fcc1,%f2 ,%f10
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	xnor	%l0,0x74e,%l2
	jmpl	%o7,%g0
	smul	%l7,0x733,%l0
p0_far_3_lem:
	xnor	%l0,0x74e,%l2
	jmpl	%o7,%g0
	smul	%l7,0x733,%l0
p0_far_3_he:
	fdivs	%f27,%f25,%f29
	sdivx	%l0,-0xe93,%l4
	fmuls	%f26,%f24,%f28
	fadds	%f24,%f19,%f21
	fdivs	%f20,%f18,%f25
	mulx	%l4,0xc9a,%l1
	fcmps	%fcc0,%f24,%f25
	jmpl	%o7,%g0
	xor	%l0,%l0,%l6
p0_far_3_hem:
	fdivs	%f27,%f25,%f29
	sdivx	%l0,-0xe93,%l4
	fmuls	%f26,%f24,%f28
	fadds	%f24,%f19,%f21
	fdivs	%f20,%f18,%f25
	mulx	%l4,0xc9a,%l1
	fcmps	%fcc0,%f24,%f25
	jmpl	%o7,%g0
	xor	%l0,%l0,%l6
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	udivx	%l3,%l7,%l4
	jmpl	%o7,%g0
	fadds	%f19,%f16,%f27
far3_b2b_l:
	udivx	%l4,%l7,%l5
	jmpl	%o7,%g0
	fdivs	%f12,%f0 ,%f10
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	fdivs	%f3 ,%f4 ,%f13
	fsubs	%f1 ,%f9 ,%f8 
	umul	%l2,-0x4b1,%l2
	umul	%l4,%l3,%l0
	sub	%l1,0xb0c,%l6
	sdivx	%l4,-0xaf0,%l3
	xnor	%l7,%l7,%l7
	jmpl	%g6+8,%g0
	fdivs	%f2 ,%f6 ,%f12
p0_call_0_le:
	fsubs	%f10,%f6 ,%f13
	fadds	%f10,%f11,%f5 
	addc	%l2,%l0,%l4
	fmuls	%f1 ,%f2 ,%f2 
	xnor	%l1,-0x4c6,%l3
	fsubs	%f5 ,%f9 ,%f1 
	fdivs	%f8 ,%f0 ,%f5 
	retl
	mulx	%l4,%l5,%l1
p0_jmpl_0_lo:
	fdivs	%f3 ,%f4 ,%f13
	fsubs	%f1 ,%f9 ,%f8 
	umul	%l2,-0x4b1,%l2
	umul	%l4,%l3,%l0
	sub	%l1,0xb0c,%l6
	sdivx	%l4,-0xaf0,%l3
	xnor	%l7,%l7,%l7
	jmpl	%g6+8,%g0
	fdivs	%f2 ,%f6 ,%f12
p0_call_0_lo:
	fsubs	%f10,%f6 ,%f13
	fadds	%f10,%f11,%f5 
	addc	%l2,%l0,%l4
	fmuls	%f1 ,%f2 ,%f2 
	xnor	%l1,-0x4c6,%l3
	fsubs	%f5 ,%f9 ,%f1 
	fdivs	%f8 ,%f0 ,%f5 
	retl
	mulx	%l4,%l5,%l1
p0_jmpl_0_he:
	addc	%l5,-0xcc3,%l7
	smul	%l3,0xdbf,%l3
	mulx	%l3,-0xefb,%l1
	mulx	%l7,%l6,%l4
	fdivs	%f25,%f24,%f28
	smul	%l7,0xb26,%l6
	jmpl	%g6+8,%g0
	xor	%l7,%l6,%l5
p0_call_0_he:
	xnor	%l0,-0xf57,%l3
	sub	%l2,%l2,%l1
	fcmps	%fcc3,%f22,%f28
	orn	%l2,%l3,%l6
	orn	%l2,%l6,%l7
	retl
	fsqrts	%f17,%f31
p0_jmpl_0_ho:
	addc	%l5,-0xcc3,%l7
	smul	%l3,0xdbf,%l3
	mulx	%l3,-0xefb,%l1
	mulx	%l7,%l6,%l4
	fdivs	%f25,%f24,%f28
	smul	%l7,0xb26,%l6
	jmpl	%g6+8,%g0
	xor	%l7,%l6,%l5
p0_call_0_ho:
	xnor	%l0,-0xf57,%l3
	sub	%l2,%l2,%l1
	fcmps	%fcc3,%f22,%f28
	orn	%l2,%l3,%l6
	orn	%l2,%l6,%l7
	retl
	fsqrts	%f17,%f31
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	mulx	%l6,-0xee0,%l0
	ldstub	[%i5+0x02c],%l6		! Mem[000000001014142c]
	jmpl	%g6+8,%g0
	sub	%l2,%l5,%l7
p0_call_1_le:
	retl
	mulx	%l6,-0x1de,%l2
p0_jmpl_1_lo:
	mulx	%l6,-0xee0,%l0
	ldstub	[%o5+0x02c],%l6		! Mem[000000001014142c]
	jmpl	%g6+8,%g0
	sub	%l2,%l5,%l7
p0_call_1_lo:
	retl
	mulx	%l6,-0x1de,%l2
p0_jmpl_1_he:
	and	%l3,-0xe5a,%l2
	fdivs	%f27,%f31,%f31
	orn	%l3,%l3,%l3
	sdivx	%l6,%l3,%l5
	jmpl	%g6+8,%g0
	fadds	%f17,%f30,%f16
p0_call_1_he:
	fcmps	%fcc0,%f24,%f16
	subc	%l0,%l0,%l3
	addc	%l5,-0xa8a,%l4
	and	%l4,%l3,%l0
	xnor	%l3,-0x940,%l2
	add	%l4,-0x4b2,%l0
	and	%l7,%l1,%l0
	retl
	sub	%l1,%l4,%l6
p0_jmpl_1_ho:
	and	%l3,-0xe5a,%l2
	fdivs	%f27,%f31,%f31
	orn	%l3,%l3,%l3
	sdivx	%l6,%l3,%l5
	jmpl	%g6+8,%g0
	fadds	%f17,%f30,%f16
p0_call_1_ho:
	fcmps	%fcc0,%f24,%f16
	subc	%l0,%l0,%l3
	addc	%l5,-0xa8a,%l4
	and	%l4,%l3,%l0
	xnor	%l3,-0x940,%l2
	add	%l4,-0x4b2,%l0
	and	%l7,%l1,%l0
	retl
	sub	%l1,%l4,%l6
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	fmuls	%f10,%f14,%f9 
	and	%l6,%l4,%l5
	and	%l2,%l1,%l2
	ld	[%i0+0x034],%f14	! Mem[0000000010001434]
	stb	%l7,[%i0+0x037]		! Mem[0000000010001437]
	jmpl	%g6+8,%g0
	fsubs	%f7 ,%f11,%f13
p0_call_2_le:
	fsqrts	%f8 ,%f11
	andn	%l1,0x97c,%l5
	xnor	%l1,%l2,%l6
	orn	%l7,0x93e,%l4
	subc	%l5,0x162,%l4
	retl
	smul	%l0,0x3ae,%l6
p0_jmpl_2_lo:
	fmuls	%f10,%f14,%f9 
	and	%l6,%l4,%l5
	and	%l2,%l1,%l2
	ld	[%o0+0x034],%f14	! Mem[0000000010001434]
	stb	%l7,[%o0+0x037]		! Mem[0000000010001437]
	jmpl	%g6+8,%g0
	fsubs	%f7 ,%f11,%f13
p0_call_2_lo:
	fsqrts	%f8 ,%f11
	andn	%l1,0x97c,%l5
	xnor	%l1,%l2,%l6
	orn	%l7,0x93e,%l4
	subc	%l5,0x162,%l4
	retl
	smul	%l0,0x3ae,%l6
p0_jmpl_2_he:
	jmpl	%g6+8,%g0
	fmuls	%f19,%f31,%f29
p0_call_2_he:
	fadds	%f24,%f18,%f20
	fcmps	%fcc1,%f27,%f26
	retl
	fmuls	%f16,%f17,%f26
p0_jmpl_2_ho:
	jmpl	%g6+8,%g0
	fmuls	%f19,%f31,%f29
p0_call_2_ho:
	fadds	%f24,%f18,%f20
	fcmps	%fcc1,%f27,%f26
	retl
	fmuls	%f16,%f17,%f26
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	ld	[%i3+0x01c],%f4 	! Mem[00000000100c141c]
	fsubs	%f13,%f11,%f6 
	and	%l4,%l1,%l7
	sdivx	%l0,0xc08,%l5
	fadds	%f4 ,%f10,%f0 
	jmpl	%g6+8,%g0
	addc	%l4,-0xd6c,%l2
p0_call_3_le:
	retl
	fmuls	%f8 ,%f4 ,%f15
p0_jmpl_3_lo:
	ld	[%o3+0x01c],%f4 	! Mem[00000000100c141c]
	fsubs	%f13,%f11,%f6 
	and	%l4,%l1,%l7
	sdivx	%l0,0xc08,%l5
	fadds	%f4 ,%f10,%f0 
	jmpl	%g6+8,%g0
	addc	%l4,-0xd6c,%l2
p0_call_3_lo:
	retl
	fmuls	%f8 ,%f4 ,%f15
p0_jmpl_3_he:
	smul	%l2,%l0,%l0
	andn	%l0,-0x0c0,%l2
	sub	%l2,%l4,%l4
	xnor	%l0,%l4,%l0
	orn	%l5,%l5,%l2
	fadds	%f20,%f20,%f24
	jmpl	%g6+8,%g0
	fsubs	%f17,%f28,%f19
p0_call_3_he:
	udivx	%l4,%l5,%l7
	fcmps	%fcc2,%f17,%f21
	fdivs	%f22,%f27,%f17
	mulx	%l6,0x719,%l7
	xor	%l1,0x4d5,%l5
	retl
	xor	%l0,0x563,%l7
p0_jmpl_3_ho:
	smul	%l2,%l0,%l0
	andn	%l0,-0x0c0,%l2
	sub	%l2,%l4,%l4
	xnor	%l0,%l4,%l0
	orn	%l5,%l5,%l2
	fadds	%f20,%f20,%f24
	jmpl	%g6+8,%g0
	fsubs	%f17,%f28,%f19
p0_call_3_ho:
	udivx	%l4,%l5,%l7
	fcmps	%fcc2,%f17,%f21
	fdivs	%f22,%f27,%f17
	mulx	%l6,0x719,%l7
	xor	%l1,0x4d5,%l5
	retl
	xor	%l0,0x563,%l7
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
	.word	0x1ef21a2e,0x18c4b9d8		! Init value for %l0
	.word	0x3677fda6,0x59dc91dd		! Init value for %l1
	.word	0x4d983392,0xd9e32dbc		! Init value for %l2
	.word	0xfe7199c0,0xc7ac7d98		! Init value for %l3
	.word	0x1c840a32,0x42d10b39		! Init value for %l4
	.word	0x4154c970,0xb7afb8fd		! Init value for %l5
	.word	0x256f1854,0x80377cff		! Init value for %l6
	.word	0xfe4ec4fa,0x7269168c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x7558aaf3,0xacb28974		! Init value for %f0 
	.word	0xa00cb89f,0x0cad9f9b		! Init value for %f2 
	.word	0x957a622f,0x22180119		! Init value for %f4 
	.word	0x572706c0,0x6025b43f		! Init value for %f6 
	.word	0x9156ec16,0x6b0274a1		! Init value for %f8 
	.word	0xa1af2138,0x6bb4af02		! Init value for %f10
	.word	0x4696fa70,0xc5bab51a		! Init value for %f12
	.word	0xd1f9c738,0x4796c528		! Init value for %f14
	.word	0x10f6f28d,0x0bb66c3e		! Init value for %f16
	.word	0x73e42445,0x38f2a07b		! Init value for %f18
	.word	0xcb6d4a47,0x1a2dbfb7		! Init value for %f20
	.word	0x0557252f,0x8442eba1		! Init value for %f22
	.word	0x03d56844,0xf16762e3		! Init value for %f24
	.word	0x98e65ffd,0xac181400		! Init value for %f26
	.word	0x36ab3346,0x2b1c4351		! Init value for %f28
	.word	0x3be5a330,0x7d9bf8cb		! Init value for %f30
	.word	0x4fbec217,0x8a5448e9		! Init value for %f32
	.word	0x59d972e2,0x212b1990		! Init value for %f34
	.word	0xfb210878,0xf6cdc970		! Init value for %f36
	.word	0x0d14523d,0xbd50ea0d		! Init value for %f38
	.word	0x8c449174,0x931d007e		! Init value for %f40
	.word	0xbff6c7f6,0x321222ff		! Init value for %f42
	.word	0x8be08379,0xcb96b41b		! Init value for %f44
	.word	0x0c8bf40b,0x72a93966		! Init value for %f46
	.word	0xba0750af,0x924237be
	.word	0x2af70eb3,0xb36cadba
	.word	0xcbf430d5,0x7b2c6873
	.word	0x7e77aebc,0x30b1ebf4
	.word	0x00ed8a11,0x2110ba62
	.word	0x265fd170,0xcdac3663
	.word	0xe038bf92,0x819617b3
	.word	0x937021e5,0x00887d9f
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
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xd800ffd7
	.word	0x00000000,0xd0a68100
	.word	0x00000000,0xcc174fb6
	.word	0xff000000,0x00ff0000
	.word	0x00000000,0x00390000
p0_expected_fp_regs:
	.word	0x0000ff00,0xe3ffffff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x00000000
	.word	0xff000000,0x95a7e5b4
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x00000000
	.word	0x7eff0000,0xff000000
	.word	0xffffffe3,0x00000000
	.word	0xff000000,0x00000000
	.word	0x00000028,0x00000000
	.word	0x4b1a5133,0x00ff0000
	.word	0x7cef00a0,0x000000ff
	.word	0xff0000ff,0x0000007e
	.word	0xff000000,0xcc174fb6
	.word	0x000000ff,0x0000ff7e
	.word	0x00000014,0x00000000		! %fsr = 0000001400000000
p0_local0_expect:
	.word	0x00000000,0x25ff1900
	.word	0x00000000,0x000000ff
	.word	0x0081a6d0,0xb64f17cc
	.word	0xffffffff,0xffffffff
	.word	0xff030039,0x000000b4
	.word	0xef7c3039,0x7abaad19
	.word	0x000000ff,0x0000ff00
	.word	0x00000000,0x00000000
p0_local0_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00ff0000,0x00000000
	.word	0xe3ffffff,0x00ffbbff
	.word	0xb4e5a795,0x000000ff
	.word	0xff0000ff,0x0000007e
	.word	0xff000000,0xcc174fb6
	.word	0x000000ff,0x0000ff7e
p0_local1_expect:
	.word	0x95a70000,0xff000000
	.word	0x000025ff,0x390003ff
	.word	0xffffffe3,0x00ffbbff
	.word	0x39307cef,0xcc174fb6
	.word	0xff000000,0x95a7e5b4
	.word	0xffffffe3,0x000000ff
	.word	0x1ab5feff,0x1ab5feff
	.word	0xff030039,0x95ff00b4
p0_local1_sec_expect:
	.word	0xff000000,0x00ff0000
	.word	0x00e5a795,0xffffffff
	.word	0xffffffe3,0x000000ff
	.word	0x00000000,0xff250070
	.word	0x000000a7,0xcc174fb6
	.word	0xf3ffffff,0xd7ff00d8
	.word	0x700025ff,0x00000000
	.word	0x000000ff,0x00000000
p0_local2_expect:
	.word	0x000000ff,0x1870ffff
	.word	0xff000000,0x00000000
	.word	0x0000ffff,0x00000000
	.word	0xa7ffffff,0x25000000
	.word	0xff030039,0x95ff00b4
	.word	0x1a7c3039,0x7abaad19
	.word	0x000000ff,0xff03ff25
	.word	0x00ff0000,0x0000ffff
p0_local2_sec_expect:
	.word	0xff000000,0x25ff0000
	.word	0x19adba7a,0x39307cef
	.word	0x000000ff,0x00000000
	.word	0x00000000,0x00000000
	.word	0xff030039,0x95ff00b4
	.word	0xef7c3039,0x7abaad19
	.word	0x000000ff,0xff03ff25
	.word	0x00000000,0x000000ff
p0_local3_expect:
	.word	0x7e000000,0xff0000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0xffffffb5,0x000000ff
	.word	0xb4e5a795,0xff0000ff
	.word	0x00000000,0x00000000
	.word	0xff030039,0x065f2a09
	.word	0x00003039,0x9d000000
p0_local3_sec_expect:
	.word	0x00000000,0x00000000
	.word	0xff000000,0xb64f17cc
	.word	0x00000000,0xb4e5aec0
	.word	0x00000000,0xe0000000
	.word	0x00000000,0x000000e0
	.word	0x00000000,0x1e1f952c
	.word	0x00000000,0x00000000
	.word	0x39307cef,0x000000ff
p0_local4_expect:
	.word	0x80000000,0x00ff0000
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x48edfcf0
	.word	0x000000ff,0xd800ffd7
	.word	0xffffffe3,0xf00000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x7cef00a0,0xb4e5a795
p0_local4_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x4b1a5133,0x00ff0000
	.word	0x00ff03ff,0x000000ff
	.word	0xe3ffffff,0x00ffbbff
	.word	0xb4e5a795,0x000000ff
	.word	0xff000000,0x00000000
	.word	0xff000000,0xcc174fb6
	.word	0x000000ff,0x0000ff7e
p0_local5_expect:
	.word	0x00000000,0x00000000
	.word	0x00056496,0xffffffff
	.word	0x950000ff,0x00000000
	.word	0x0000ff00,0x00ff0000
	.word	0xffffffff,0xfffeb51a
	.word	0x000000ff,0x0000ff7e
	.word	0x00000028,0x000000ff
	.word	0x00ff7018,0xa000ef7c
p0_local5_sec_expect:
	.word	0x00000080,0x00000000
	.word	0xff000000,0x00000000
	.word	0x1870ffff,0xb5000000
	.word	0xb64f17cc,0x00000000
	.word	0x80000000,0x000000ff
	.word	0xd8f1ffd7,0xffffffe3
	.word	0xffffffe3,0xfffeb51a
	.word	0x00000000,0x00000000
p0_local6_expect:
	.word	0xb4e5a795,0x000000ff
	.word	0xff000000,0x00000000
	.word	0x00ffffe3,0x19adbaff
	.word	0xffff0000,0xffff0000
	.word	0x00000000,0x00000000
	.word	0x95a7e5b4,0xfffffff3
	.word	0xfffeb51a,0xfffeb51a
	.word	0x000000ff,0x00ff0000
p0_local6_sec_expect:
	.word	0xffff0000,0xe3ffffff
	.word	0xff00ffff,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x00000000
	.word	0xff000000,0x95a7e5b4
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x00000000
	.word	0x7eff0000,0xff000000
share0_expect:
	.word	0x00ff826e,0x76c41477
	.word	0xe9467839,0x0be513c5
	.word	0xe3249af0,0x545247f8
	.word	0xdafe8851,0x09b3bea6
	.word	0xbfc2d7a0,0xf62ec7ce
	.word	0x3c42ce70,0x96e8f25d
	.word	0x34b4e599,0x6d76e126
	.word	0x1d074a78,0x462177aa
share1_expect:
	.word	0xff008ed8,0xeeba2353
	.word	0x26bdcad8,0x47aaf17b
	.word	0x1b5e52d0,0xf1147862
	.word	0xb3c3da6c,0x8a0a29c9
	.word	0x0a17cb6d,0x7b073703
	.word	0x42993a0d,0x2f285693
	.word	0xfee5669b,0xbef7e42f
	.word	0x7872ddb5,0x3421bcdb
	.word	0x0000cbdb,0xd9aa789f
	.word	0xeebaf927,0xc8d5677c
	.word	0xf4fd11ad,0xb2741979
	.word	0xef0e9ee6,0x1ec2baa5
	.word	0x10132dda,0x879bd931
	.word	0xfde4a7a8,0x209236ce
	.word	0x256253fd,0x1d3a2477
	.word	0xdd1172d8,0x161e0600
share2_expect:
	.word	0x00ff7001,0x1c849967
	.word	0x61b0c079,0x7a7ed5ff
	.word	0x75ec61c2,0x7208b51f
	.word	0x30c5fa9b,0x7c5d67fc
	.word	0xd08e974c,0xf10e857d
	.word	0x10346cf1,0x895a6f97
	.word	0x326e8d49,0xd6add101
	.word	0x41a92221,0x4c582015
share3_expect:
	.word	0xfffffa80,0xe1df95ea
	.word	0x1b8772a0,0x139985bf
	.word	0x45256c43,0x7f3f7e8c
	.word	0xda74d3a2,0x7381a654
	.word	0x09c7a9b6,0x7b96a1a2
	.word	0x8e3653bc,0xfad62fd6
	.word	0x750031e8,0x91c0ebe7
	.word	0x75dab3b8,0x0cd44c0c
	.word	0xffff34f9,0x561bfb11
	.word	0x711652c1,0x2dde39fc
	.word	0xeb232aae,0x5fdbb0e2
	.word	0xace28c11,0x6803121e
	.word	0x3de8d987,0x07f6e56e
	.word	0x32381659,0x4de4382a
	.word	0x4557307b,0xf631990c
	.word	0x054cfc8e,0xbe4103eb
	.word	0x28ff944f,0xbeeec3e0
	.word	0x0a178bcc,0x415d0b34
	.word	0x52e3fee5,0x8664186a
	.word	0x0df5856d,0xe0e0733d
	.word	0x5037c568,0xe54f6059
	.word	0x91128650,0xe15882c4
	.word	0x925699b4,0x7856b37f
	.word	0x43f678c8,0x68004769
	.word	0xeeffde47,0xf5d36688
	.word	0xb03ac047,0x05791cae
	.word	0xd0284b54,0x38953703
	.word	0x22c42921,0x051cfb96
	.word	0xec84334c,0xb446fa8c
	.word	0xbf4ad452,0x85a83c69
	.word	0x43c92f00,0x832fee49
	.word	0x36d5eb53,0x6fd007c0
	.word	0xffff4cdd,0xe0241f8f
	.word	0x06935546,0x20b9b150
	.word	0xe3962416,0xe8d6657b
	.word	0x30c4a674,0x1a38c762
	.word	0x9fb2fc21,0xadc2425d
	.word	0xa6cb101e,0x7273ccfb
	.word	0xa917162f,0xbab8f666
	.word	0x93db3497,0x6a028f3d
	.word	0xff001f70,0x81210e98
	.word	0x59dd6a8a,0x40e8a170
	.word	0x566e851c,0x8f3eee98
	.word	0x9d58f41d,0x76d0d551
	.word	0xcd593a48,0x2379a393
	.word	0x4f7c9375,0xcf1e9f04
	.word	0x3d2c7692,0xe2278086
	.word	0x508b5772,0x324643fe
	.word	0x2affac10,0xa2adf938
	.word	0x30bcd3e0,0xc9331d3b
	.word	0xd9e04413,0x9c43562d
	.word	0x8af6876e,0x2b6c0030
	.word	0xbc60cecc,0xbe00775d
	.word	0x771afcf1,0x7382e145
	.word	0x93443fcc,0xe152ac4d
	.word	0x205c16d0,0xd3b7af80
	.word	0x00ff37e3,0x540c22fb
	.word	0x303aae60,0x0f2d48ff
	.word	0xff377ce9,0xcc429ac5
	.word	0xe190d20a,0x174ec80e
	.word	0xe405e798,0xe17a5dd8
	.word	0x5660b2cc,0x3b4506ec
	.word	0xa650aa4a,0x693c9237
	.word	0x36e20306,0x072934da
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
	.word	0x26034148,0x2a4d75d5
	.word	0x00000000,0x00000002
	.word	0x77fb7180,0x08c2ee4b
	.word	0x00000000,0x00000003
	.word	0xa205a388,0x65fc644a
	.word	0x00000000,0x00000004
	.word	0xee7dbb4f,0xd88d8f77
	.word	0x00000000,0x00000005
	.word	0xef927d47,0xcc36ece5
	.word	0x00000000,0x00000006
	.word	0x8f3d78c0,0x376aa8a0
	.word	0x00000000,0x00000007
	.word	0x3e070308,0x04ebff9c
	.word	0x00000000,0x00000008
	.word	0xe7c30977,0xbd521f2c
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
	.word	0x030b95bc,0xae4a49ae,0xf9664594,0xf27ac1d1
	.word	0xf21a4a89,0xd4b9b028,0x8cd29078,0xf45c1c07
	.word	0x6c0d1d7e,0xed9f2dbf,0xd3844c69,0x4f1a260b
	.word	0xf5d1c380,0x4cb9a60d,0x186ce9bc,0xc1cabd15
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
	.word	0xc069fdb7,0x7307d2eb,0x3816da89,0x9ac9f33d
	.word	0x89d18bea,0xb529e417,0xf9254e70,0x9f89571e
	.word	0xdfee3ea2,0xc4910c61,0x4317e2f3,0x0c377fa2
	.word	0x431e4b92,0x4bc52f22,0x7f14b351,0x5097a866
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
	.word	0x30e227fb,0x9a4fddb3,0x20aac52e,0x35f02198
	.word	0x8b881076,0xd632e47b,0x20f9364e,0xa0494af5
	.word	0x7566a737,0xaaa9259b,0xbedae363,0x380ea27e
	.word	0xa775ccae,0xa404cce3,0xea47eed9,0xd71c70a7
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
	.word	0xca3a189c,0xb1151059,0xe7ca4bca,0x920c38e3
	.word	0x6759f701,0x92f6c887,0x28a0e338,0x698fa81f
	.word	0x96332b33,0xc52d079a,0xd6e1b298,0x51cb272c
	.word	0xd24d69b9,0x199a9ee5,0x68b52f59,0x9128b367
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
	.word	0xaba83466,0x8d7a8ee0,0x40b29692,0x6f84f752
	.word	0x3f026c62,0x217b8aa2,0xf368d4b6,0x5f2478ca
	.word	0x4d52c53b,0x96a1271f,0xed5c96dd,0x39066bba
	.word	0x1364a27b,0xe0ee5c89,0xe159344c,0xee30470a
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
	.word	0x5df65b10,0xb1538fa4,0x2e1171cd,0x0bed6f35
	.word	0x3ac8ceaf,0xdd75568b,0xd7596038,0x3d7b2d8e
	.word	0xaaf25d9a,0x0a1de4e8,0x58cc5479,0xb70a210d
	.word	0x21710f62,0x6e17dfe9,0x277f04a6,0x498d9022
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
	.word	0x41c250fd,0xc9be0419,0xccad0a7c,0x5ee2deda
	.word	0x905eab26,0xbf54bcd1,0xe2a70f1b,0xddf0b473
	.word	0x5b79f4cd,0xe61f14ec,0xea79f45d,0xaac51f7b
	.word	0xe1dbf2b0,0xf8ec9fcf,0xf4840977,0x56aa808d
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
	.word	0x97887437,0xa818c99f,0x5c3d9c36,0xb7969efe
	.word	0x228193df,0xa7daf69b,0xfa840aaf,0x742094af
	.word	0xad7f8049,0x8cd5d603,0xa3138d34,0x280e2cc7
	.word	0x54cd27c3,0x0ee332bb,0x60d28f67,0x361d49cf
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
	.word	0x56c5d56f,0x9adda571,0x38ed87a8,0xc616cc42
	.word	0xcba5243f,0xca3e5f61,0xac1fbdec,0x01e3452a
	.word	0xbfdb958b,0x615241bc,0xa07505ad,0xee5f39e4
	.word	0x27468419,0xcd1bbf6b,0x79b1bd27,0x05e68fbe
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
	.word	0x6329e949,0x4363913c,0x87e3de3f,0x5760add8
	.word	0x6768845c,0xb9ad60ec,0x66ac2809,0x9ec3317d
	.word	0x76cc0d04,0xcb084274,0xf46091fd,0x8e6b2062
	.word	0xfd236257,0x012a15b7,0x55dd9e88,0x29c9cf75
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
	.word	0x9cbb80c5,0x6dc321e3,0xd8b76590,0xf21dc022
	.word	0x001ba115,0xda2da1b4,0x8f014185,0xd307c793
	.word	0xc0aec14c,0xf79dc35b,0xcfd6109f,0x1075e9e0
	.word	0xa6cc5dca,0xd27d0755,0xf0e4752e,0xe8a4b005
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
	.word	0xa4962afc,0xe49dd978,0x93018f04,0xec480d19
	.word	0xda6b08c9,0x7abaad19,0x16f02ac0,0x3e608a57
	.word	0xf4b0d034,0xa5f349f5,0xe3c0f0cf,0xe630f32a
	.word	0x44b30f0e,0x73352ded,0xf0e1cbc9,0x9863bf2f
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
	.word	0x036bdcfa,0x26f53673,0x13ed8de2,0x64ab7799
	.word	0x8b5842da,0x2d197939,0x3d6dc2de,0x261a7426
	.word	0xb1c6e0a3,0xb38e1146,0xcc32ad92,0xfe0c4d4c
	.word	0xf6c216ef,0x543d249c,0xe40ec7ab,0xd411b17e
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
	.word	0x41f463d3,0xd8750de5,0xabc2153e,0x017da160
	.word	0xeb2ccfd0,0xc3aef533,0xdba784a9,0x4e9f0ae1
	.word	0xb4e5a795,0x5a64ed3f,0xcef18dd7,0x28a88367
	.word	0x9ae99a45,0x0ff7373e,0x39307cef,0xcc174fb6
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
	.word	0xf842826e,0x76c41477,0xe9467839,0x0be513c5
	.word	0xe3249af0,0x545247f8,0xdafe8851,0x09b3bea6
	.word	0xbfc2d7a0,0xf62ec7ce,0x3c42ce70,0x96e8f25d
	.word	0x34b4e599,0x6d76e126,0x1d074a78,0x462177aa
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
	.word	0xe5028ed8,0xeeba2353,0x26bdcad8,0x47aaf17b
	.word	0x1b5e52d0,0xf1147862,0xb3c3da6c,0x8a0a29c9
	.word	0x0a17cb6d,0x7b073703,0x42993a0d,0x2f285693
	.word	0xfee5669b,0xbef7e42f,0x7872ddb5,0x3421bcdb
	.word	0x5bafcbdb,0xd9aa789f,0xeebaf927,0xc8d5677c
	.word	0xf4fd11ad,0xb2741979,0xef0e9ee6,0x1ec2baa5
	.word	0x10132dda,0x879bd931,0xfde4a7a8,0x209236ce
	.word	0x256253fd,0x1d3a2477,0xdd1172d8,0x161e0600
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
	.word	0x7e657001,0x1c849967,0x61b0c079,0x7a7ed5ff
	.word	0x75ec61c2,0x7208b51f,0x30c5fa9b,0x7c5d67fc
	.word	0xd08e974c,0xf10e857d,0x10346cf1,0x895a6f97
	.word	0x326e8d49,0xd6add101,0x41a92221,0x4c582015
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
	.word	0xc120fa80,0xe1df95ea,0x1b8772a0,0x139985bf
	.word	0x45256c43,0x7f3f7e8c,0xda74d3a2,0x7381a654
	.word	0x09c7a9b6,0x7b96a1a2,0x8e3653bc,0xfad62fd6
	.word	0x750031e8,0x91c0ebe7,0x75dab3b8,0x0cd44c0c
	.word	0x033534f9,0x561bfb11,0x711652c1,0x2dde39fc
	.word	0xeb232aae,0x5fdbb0e2,0xace28c11,0x6803121e
	.word	0x3de8d987,0x07f6e56e,0x32381659,0x4de4382a
	.word	0x4557307b,0xf631990c,0x054cfc8e,0xbe4103eb
	.word	0xa3f2944f,0xbeeec3e0,0x0a178bcc,0x415d0b34
	.word	0x52e3fee5,0x8664186a,0x0df5856d,0xe0e0733d
	.word	0x5037c568,0xe54f6059,0x91128650,0xe15882c4
	.word	0x925699b4,0x7856b37f,0x43f678c8,0x68004769
	.word	0xee75de47,0xf5d36688,0xb03ac047,0x05791cae
	.word	0xd0284b54,0x38953703,0x22c42921,0x051cfb96
	.word	0xec84334c,0xb446fa8c,0xbf4ad452,0x85a83c69
	.word	0x43c92f00,0x832fee49,0x36d5eb53,0x6fd007c0
	.word	0x5e284cdd,0xe0241f8f,0x06935546,0x20b9b150
	.word	0xe3962416,0xe8d6657b,0x30c4a674,0x1a38c762
	.word	0x9fb2fc21,0xadc2425d,0xa6cb101e,0x7273ccfb
	.word	0xa917162f,0xbab8f666,0x93db3497,0x6a028f3d
	.word	0x05761f70,0x81210e98,0x59dd6a8a,0x40e8a170
	.word	0x566e851c,0x8f3eee98,0x9d58f41d,0x76d0d551
	.word	0xcd593a48,0x2379a393,0x4f7c9375,0xcf1e9f04
	.word	0x3d2c7692,0xe2278086,0x508b5772,0x324643fe
	.word	0x2a07ac10,0xa2adf938,0x30bcd3e0,0xc9331d3b
	.word	0xd9e04413,0x9c43562d,0x8af6876e,0x2b6c0030
	.word	0xbc60cecc,0xbe00775d,0x771afcf1,0x7382e145
	.word	0x93443fcc,0xe152ac4d,0x205c16d0,0xd3b7af80
	.word	0x43b737e3,0x540c22fb,0x303aae60,0x0f2d48ff
	.word	0xff377ce9,0xcc429ac5,0xe190d20a,0x174ec80e
	.word	0xe405e798,0xe17a5dd8,0x5660b2cc,0x3b4506ec
	.word	0xa650aa4a,0x693c9237,0x36e20306,0x072934da
share3_end:
