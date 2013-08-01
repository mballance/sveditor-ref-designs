/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000l_2.s
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
!	Seed = 326163539
!	Riesling can be on
!	1 Thread, 5000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_5000l_2.s created on Mar 26, 2009 (16:35:39)
!	RC file : mar26.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar26.rc -o mpgen_5000l_2 -p 1 -l 5000

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
!	%f0  = fe605994 83907f7b fb3301a9 2b457afe
!	%f4  = 4bdf338c bf34f91f ee902518 96c8ddf2
!	%f8  = 7f52c8b5 600799bb 884d86b3 2e2caf12
!	%f12 = 835097d4 81738105 7f36f251 fcea6812
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = dff53b19 f544865e 9341ab5c 74920f20
!	%f20 = 9731d508 e62b4f6f 5ed2be76 38a608c5
!	%f24 = 7aa9252a f837a63c e2c63710 f3bb23fd
!	%f28 = c6b20ca0 b4be2176 8c959c93 b6b008f7
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = b8c21196 6898be0f cdac2352 4921b39a
!	%f36 = 413915ce 0e52aa5b b319c64b 7e90c78f
!	%f40 = 15165701 07e38693 c8bf70da 504f8d35
!	%f44 = 258448f2 9b6ede2c b1d1f714 e483d4b2
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xea8c9f0f0000006b,%g7,%g1 ! GSR scale = 13, align = 3
	wr	%g1,%g0,%gsr		! GSR = ea8c9f0f0000006b
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000030001410] = d9947db6, %l1 = 629541283d3c8bb8
	ldsba	[%i0+%o5]0x89,%l1	! %l1 = ffffffffffffffb6
!	Mem[0000000010141400] = 5d938f61, %l3 = 3e216532d66e27d0
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 000000000000005d
!	%l7 = 069d14127ddcd4d4, Mem[0000000030141400] = ff10b434
	stha	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = ff10d4d4
!	%f0  = fe605994 83907f7b fb3301a9 2b457afe
!	%f4  = 4bdf338c bf34f91f ee902518 96c8ddf2
!	%f8  = 7f52c8b5 600799bb 884d86b3 2e2caf12
!	%f12 = 835097d4 81738105 7f36f251 fcea6812
	stda	%f0,[%i2]ASI_COMMIT_P	! Block Store to 0000000010081400
!	Mem[0000000020800040] = b88a9e9b, %l3 = 000000000000005d
	ldsha	[%o1+0x040]%asi,%l3	! %l3 = ffffffffffffb88a
!	%f23 = 38a608c5, Mem[0000000010041418] = c8e6ca0b
	st	%f23,[%i1+0x018]	! Mem[0000000010041418] = 38a608c5
!	%l7 = 069d14127ddcd4d4, Mem[0000000010101408] = 3ba0cb0c
	stw	%l7,[%i4+%o4]		! Mem[0000000010101408] = 7ddcd4d4
!	%f29 = b4be2176, Mem[00000000100c1408] = da3f84ba
	st	%f29,[%i3+%o4]		! Mem[00000000100c1408] = b4be2176
!	Mem[00000000300c1410] = 1fee1ae36cbf0ba7, %f18 = 9341ab5c 74920f20
	ldda	[%i3+%o5]0x81,%f18	! %f18 = 1fee1ae3 6cbf0ba7
!	Starting 10 instruction Store Burst
!	%f20 = 9731d508 e62b4f6f, Mem[0000000030041410] = ae4dd83f fc954f01
	stda	%f20,[%i1+%o5]0x81	! Mem[0000000030041410] = 9731d508 e62b4f6f

p0_label_2:
!	%l3 = ffffffffffffb88a, Mem[0000000010041410] = d1ca1ceea7f1e1c9
	stxa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffffffffb88a
!	Mem[0000000010101410] = 7a5188e9, %l1 = ffffffffffffffb6
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 0000007a000000ff
!	%l6 = 8838f659, %l7 = 7ddcd4d4, Mem[0000000010101410] = e98851ff 024dde05
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 8838f659 7ddcd4d4
!	Mem[0000000030101410] = 736ef266, %l5 = 2dd2897a290ada93
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 00000000736ef266
!	Mem[0000000010141408] = 14537362, %l5 = 00000000736ef266
	swapa	[%i5+%o4]0x88,%l5	! %l5 = 0000000014537362
!	%f30 = 8c959c93 b6b008f7, Mem[0000000030101408] = 06522e0b 820e9f17
	stda	%f30,[%i4+%o4]0x89	! Mem[0000000030101408] = 8c959c93 b6b008f7
!	Mem[000000001000140c] = f1ecc94c, %l6 = 8838f659, %l6 = 8838f659
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 00000000f1ecc94c
!	Mem[000000001004143c] = 6ce66ed7, %l0 = 5c9bef14a0b573a2
	ldstub	[%i1+0x03c],%l0		! %l0 = 0000006c000000ff
!	%f28 = c6b20ca0 b4be2176, %l1 = 000000000000007a
!	Mem[0000000030001430] = bc8119887d4fe669
	add	%i0,0x030,%g1
	stda	%f28,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030001430] = bc811988a00cb2c6
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = e4380ce1, %l2 = 54b71c60cf8b7376
	lduba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000e4

p0_label_3:
!	Mem[00000000300c1410] = e31aee1f, %l2 = 00000000000000e4
	ldswa	[%i3+%o5]0x89,%l2	! %l2 = ffffffffe31aee1f
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010081404] = 83907f7b, %l6 = 00000000f1ecc94c
	lduh	[%i2+0x006],%l6		! %l6 = 0000000000007f7b
!	Mem[0000000010041400] = 0db8cbc9, %l6 = 0000000000007f7b
	ldsba	[%i1+%g0]0x88,%l6	! %l6 = ffffffffffffffc9
!	Mem[0000000010041400] = c9cbb80d, %l0 = 000000000000006c
	lduba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000c9
!	Mem[0000000010141408] = f6f72e34736ef266, %f22 = 5ed2be76 38a608c5
	ldda	[%i5+%o4]0x88,%f22	! %f22 = f6f72e34 736ef266
!	Mem[0000000010081400] = fe605994, %l2 = ffffffffe31aee1f
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 00000000000000fe
!	Mem[0000000030001410] = b67d94d9, %l3 = ffffffffffffb88a
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = ffffffffffffffb6
!	Mem[0000000010141400] = 5d938f61, %l1 = 000000000000007a
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = 000000000000005d
!	Mem[0000000030141408] = 883d5970, %l1 = 000000000000005d
	lduha	[%i5+%o4]0x81,%l1	! %l1 = 000000000000883d
!	Starting 10 instruction Store Burst
!	Mem[00000000218001c0] = 05bc4fd1, %l6 = ffffffffffffffc9
	ldstub	[%o3+0x1c0],%l6		! %l6 = 00000005000000ff

p0_label_4:
!	Mem[0000000021800100] = aece6996, %l2 = 00000000000000fe
	ldstub	[%o3+0x100],%l2		! %l2 = 000000ae000000ff
!	%l1 = 000000000000883d, Mem[0000000010001410] = e84cb58a75d65de5
	stxa	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000000000883d
!	Mem[0000000020800040] = b88a9e9b, %l5 = 0000000014537362
	ldstub	[%o1+0x040],%l5		! %l5 = 000000b8000000ff
!	%f14 = 7f36f251 fcea6812, %l3 = ffffffffffffffb6
!	Mem[0000000030041438] = 861da463dd585855
	add	%i1,0x038,%g1
	stda	%f14,[%g1+%l3]ASI_PST32_S ! Mem[0000000030041438] = 7f36f251dd585855
!	%l4 = 67eb8ae084b1d35a, Mem[0000000010041410] = ffffffff
	stba	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffff5a
!	Mem[000000001004143c] = ffe66ed7, %l4 = 67eb8ae084b1d35a, %asi = 80
	swapa	[%i1+0x03c]%asi,%l4	! %l4 = 00000000ffe66ed7
!	Mem[00000000100c1415] = 82c96da4, %l7 = 069d14127ddcd4d4
	ldstub	[%i3+0x015],%l7		! %l7 = 000000c9000000ff
!	Mem[00000000300c1400] = 171acbe6, %l3 = ffffffffffffffb6
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 00000017000000ff
!	%l6 = 00000005, %l7 = 000000c9, Mem[00000000100c1410] = 5edf84c9 82ff6da4
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000005 000000c9
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = fe605994 83907f7b fb3301a9 2b457afe
!	Mem[0000000010081410] = 4bdf338c bf34f91f ee902518 96c8ddf2
!	Mem[0000000010081420] = 7f52c8b5 600799bb 884d86b3 2e2caf12
!	Mem[0000000010081430] = 835097d4 81738105 7f36f251 fcea6812
	ldda	[%i2]ASI_BLK_AIUP,%f16	! Block Load from 0000000010081400

p0_label_5:
!	Mem[0000000010141430] = 5a2c562e, %l3 = 0000000000000017
	lduw	[%i5+0x030],%l3		! %l3 = 000000005a2c562e
!	Mem[0000000030181400] = 1a3ea039, %l7 = 00000000000000c9
	ldswa	[%i6+%g0]0x89,%l7	! %l7 = 000000001a3ea039
!	Mem[0000000030081400] = e10c38e4, %l7 = 000000001a3ea039
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 00000000000038e4
!	Mem[0000000010001408] = 603e9969, %l0 = 00000000000000c9
	ldsha	[%i0+0x00a]%asi,%l0	! %l0 = ffffffffffff9969
!	Mem[0000000030001400] = c9443073, %l0 = ffffffffffff9969
	lduha	[%i0+%g0]0x81,%l0	! %l0 = 000000000000c944
!	Mem[0000000030081400] = e4380ce1, %f5  = bf34f91f
	lda	[%i2+%g0]0x81,%f5 	! %f5 = e4380ce1
!	Mem[0000000010001408] = 69993e60, %l6 = 0000000000000005
	lduwa	[%i0+%o4]0x88,%l6	! %l6 = 0000000069993e60
!	Mem[0000000010081408] = fb3301a9, %l4 = 00000000ffe66ed7
	ldsha	[%i2+%o4]0x80,%l4	! %l4 = fffffffffffffb33
!	Mem[0000000030001408] = 76637fdb0162d4cd, %l5 = 00000000000000b8
	ldxa	[%i0+%o4]0x89,%l5	! %l5 = 76637fdb0162d4cd
!	Starting 10 instruction Store Burst
!	%l6 = 0000000069993e60, Mem[0000000030141408] = 883d5970
	stha	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 3e605970

p0_label_6:
!	%f8  = 7f52c8b5, Mem[0000000030041410] = 9731d508
	sta	%f8 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 7f52c8b5
!	%l3 = 000000005a2c562e, Mem[0000000010181408] = e33c1d33
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = e33c562e
!	%l7 = 00000000000038e4, Mem[0000000010141410] = 0668c6a3
	stwa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 000038e4
!	Mem[00000000100c1424] = ddda8cc1, %l7 = 00000000000038e4
	ldstuba	[%i3+0x024]%asi,%l7	! %l7 = 000000dd000000ff
!	%l2 = 00000000000000ae, Mem[00000000300c1410] = e31aee1f
	stwa	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ae
!	%l2 = 00000000000000ae, Mem[000000001014140e] = 342ef7f6, %asi = 80
	stba	%l2,[%i5+0x00e]%asi	! Mem[000000001014140c] = 342eaef6
!	%f16 = fe605994 83907f7b fb3301a9 2b457afe
!	%f20 = 4bdf338c bf34f91f ee902518 96c8ddf2
!	%f24 = 7f52c8b5 600799bb 884d86b3 2e2caf12
!	%f28 = 835097d4 81738105 7f36f251 fcea6812
	stda	%f16,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
!	%f0  = fe605994 83907f7b fb3301a9 2b457afe
!	%f4  = 4bdf338c e4380ce1 ee902518 96c8ddf2
!	%f8  = 7f52c8b5 600799bb 884d86b3 2e2caf12
!	%f12 = 835097d4 81738105 7f36f251 fcea6812
	stda	%f0,[%i0]ASI_BLK_AIUS	! Block Store to 0000000030001400
!	%l2 = 00000000000000ae, Mem[00000000211c0000] = ab780b46
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 00ae0b46
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010001410] = 3d880000, %l1 = 000000000000883d
	ldsba	[%i0+%o5]0x80,%l1	! %l1 = 000000000000003d

p0_label_7:
!	Mem[0000000030101408] = b6b008f7, %l5 = 76637fdb0162d4cd
	ldsba	[%i4+%o4]0x89,%l5	! %l5 = fffffffffffffff7
!	Mem[0000000010101408] = 2b457afe, %l6 = 0000000069993e60
	lduwa	[%i4+%o4]0x88,%l6	! %l6 = 000000002b457afe
!	Mem[00000000201c0000] = b501367d, %l1 = 000000000000003d
	ldsh	[%o0+%g0],%l1		! %l1 = ffffffffffffb501
!	Mem[00000000201c0000] = b501367d, %l2 = 00000000000000ae
	lduh	[%o0+%g0],%l2		! %l2 = 000000000000b501
!	Mem[0000000010181410] = 12a5bcbf17e451f3, %f14 = 7f36f251 fcea6812
	ldda	[%i6+%o5]0x80,%f14	! %f14 = 12a5bcbf 17e451f3
!	Mem[00000000300c1400] = ee7b3130 e6cb1aff, %l2 = 0000b501, %l3 = 5a2c562e
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 00000000e6cb1aff 00000000ee7b3130
!	Mem[0000000010041400] = 0db8cbc9, %l2 = 00000000e6cb1aff
	ldsba	[%i1+%g0]0x88,%l2	! %l2 = ffffffffffffffc9
!	Mem[0000000030141410] = eee25150, %l4 = fffffffffffffb33
	ldswa	[%i5+%o5]0x81,%l4	! %l4 = ffffffffeee25150
!	Mem[00000000201c0000] = b501367d, %l5 = fffffffffffffff7
	ldsh	[%o0+%g0],%l5		! %l5 = ffffffffffffb501
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000c944, Mem[0000000010081410] = 4bdf338c
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = c944338c

p0_label_8:
!	%l4 = ffffffffeee25150, Mem[00000000201c0000] = b501367d
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 5001367d
!	Mem[0000000030101410] = 290ada93, %l6 = 000000002b457afe
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000290ada93
!	Mem[0000000021800000] = 112d0c06, %l6 = 00000000290ada93
	ldstuba	[%o3+0x000]%asi,%l6	! %l6 = 00000011000000ff
!	%l2 = ffffffffffffffc9, Mem[0000000030101400] = 47b306ef
	stha	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 47b3ffc9
!	%l7 = 00000000000000dd, Mem[0000000030001400] = 945960fe
	stha	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 945900dd
!	Mem[0000000010101408] = 2b457afe, %l0 = 000000000000c944
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 000000fe000000ff
!	Mem[0000000020800041] = ff8a9e9b, %l0 = 00000000000000fe
	ldstuba	[%o1+0x041]%asi,%l0	! %l0 = 0000008a000000ff
!	Mem[0000000030181400] = 39a03e1a, %l0 = 000000000000008a
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 0000000039a03e1a
!	Mem[0000000010041438] = 260726bb, %l1 = ffffb501, %l2 = ffffffc9
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 00000000260726bb
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = 78587da8a6823d2b, %l3 = 00000000ee7b3130
	ldx	[%i5+0x020],%l3		! %l3 = 78587da8a6823d2b

p0_label_9:
!	Mem[000000001008141c] = 96c8ddf2, %l4 = ffffffffeee25150
	ldsb	[%i2+0x01d],%l4		! %l4 = ffffffffffffffc8
!	Mem[0000000010081400] = 945960fe, %l1 = ffffffffffffb501
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 00000000000060fe
!	Mem[000000001010140c] = a90133fb, %l0 = 0000000039a03e1a
	lduba	[%i4+0x00e]%asi,%l0	! %l0 = 0000000000000033
!	Mem[0000000010001408] = 4cc9ecf169993e60, %f4  = 4bdf338c e4380ce1
	ldda	[%i0+%o4]0x88,%f4 	! %f4  = 4cc9ecf1 69993e60
!	Mem[0000000010041408] = a625d17a, %l6 = 0000000000000011
	lduha	[%i1+%o4]0x88,%l6	! %l6 = 000000000000d17a
!	Mem[0000000030181408] = b570b438, %l6 = 000000000000d17a
	ldswa	[%i6+%o4]0x81,%l6	! %l6 = ffffffffb570b438
!	Mem[0000000010101408] = ff7a452b, %l6 = ffffffffb570b438
	ldswa	[%i4+%o4]0x80,%l6	! %l6 = ffffffffff7a452b
!	Mem[0000000030081400] = e4380ce1, %l3 = 78587da8a6823d2b
	lduwa	[%i2+%g0]0x81,%l3	! %l3 = 00000000e4380ce1
!	Mem[0000000010181420] = 932b6321, %l6 = ffffffffff7a452b
	ldsh	[%i6+0x022],%l6		! %l6 = 0000000000006321
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000006321, Mem[00000000100c1408] = b4be2176
	stba	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 21be2176

p0_label_10:
!	%l2 = 00000000260726bb, Mem[0000000030101408] = b6b008f7
	stha	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = b6b026bb
!	Mem[000000001008142e] = 2e2caf12, %l2 = 00000000260726bb
	ldstuba	[%i2+0x02e]%asi,%l2	! %l2 = 000000af000000ff
!	Mem[0000000030041408] = 8c0d13a0, %l5 = ffffffffffffb501
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 0000008c000000ff
!	%l1 = 00000000000060fe, Mem[0000000010141400] = 5d938f61
	stwa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 000060fe
!	%l6 = 0000000000006321, Mem[00000000211c0000] = 00ae0b46, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 21ae0b46
!	Mem[00000000100c1424] = ffda8cc1, %l3 = 00000000e4380ce1, %asi = 80
	swapa	[%i3+0x024]%asi,%l3	! %l3 = 00000000ffda8cc1
!	Mem[0000000030181400] = 0000008a, %l1 = 00000000000060fe
	swapa	[%i6+%g0]0x81,%l1	! %l1 = 000000000000008a
!	Mem[0000000010041410] = 5affffff, %l2 = 00000000000000af
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 000000005affffff
!	%l2 = 000000005affffff, Mem[0000000030141410] = eee25150
	stba	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = ffe25150
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff7a452ba90133fb, %f22 = ee902518 96c8ddf2
	ldda	[%i4+%o4]0x80,%f22	! %f22 = ff7a452b a90133fb

p0_label_11:
!	Mem[00000000201c0000] = 5001367d, %l2 = 000000005affffff
	ldsb	[%o0+%g0],%l2		! %l2 = 0000000000000050
!	Mem[0000000030001400] = 945900dd, %f10 = 884d86b3
	lda	[%i0+%g0]0x89,%f10	! %f10 = 945900dd
!	Mem[0000000030041400] = d29f0c03, %l4 = ffffffffffffffc8
	lduwa	[%i1+%g0]0x89,%l4	! %l4 = 00000000d29f0c03
!	Mem[0000000020800000] = 3a96188e, %l3 = 00000000ffda8cc1
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 0000000000003a96
!	Mem[0000000010081410] = 8c3344c9, %l5 = 000000000000008c
	lduwa	[%i2+%o5]0x88,%l5	! %l5 = 000000008c3344c9
!	Mem[0000000030101400] = c9ffb347, %l0 = 0000000000000033
	lduwa	[%i4+%g0]0x81,%l0	! %l0 = 00000000c9ffb347
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010141400] = 000060fe 68cb889b 66f26e73 342eaef6
!	Mem[0000000010141410] = 000038e4 a627f149 6c8c7dee 80ac7047
!	Mem[0000000010141420] = 78587da8 a6823d2b ac635fb4 4751511c
!	Mem[0000000010141430] = 5a2c562e bd83059c 17e5d837 e8f1dbf6
	ldda	[%i5]ASI_BLK_PL,%f16	! Block Load from 0000000010141400
!	Mem[0000000010081400] = fe60599483907f7b, %l5 = 000000008c3344c9
	ldxa	[%i2+%g0]0x80,%l5	! %l5 = fe60599483907f7b
!	Mem[0000000010041410] = 000000af, %l5 = fe60599483907f7b
	lduh	[%i1+0x012],%l5		! %l5 = 00000000000000af
!	Starting 10 instruction Store Burst
!	%l4 = d29f0c03, %l5 = 000000af, Mem[00000000300c1410] = ae000000 6cbf0ba7
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = d29f0c03 000000af

p0_label_12:
!	Mem[0000000010181408] = e33c562e, %l5 = 00000000000000af
	swapa	[%i6+%o4]0x88,%l5	! %l5 = 00000000e33c562e
!	%l0 = 00000000c9ffb347, Mem[0000000010001400] = e0d1a404
	stba	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 47d1a404
!	%l7 = 00000000000000dd, Mem[0000000030101408] = b6b026bb
	stha	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = b6b000dd
!	Mem[0000000010101410] = bf34f91f, %l6 = 0000000000006321
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 0000001f000000ff
!	%f14 = 12a5bcbf 17e451f3, %l1 = 000000000000008a
!	Mem[00000000300c1400] = ff1acbe630317bee
	stda	%f14,[%i3+%l1]ASI_PST8_SL ! Mem[00000000300c1400] = ff51cb1730317b12
	membar	#Sync			! Added by membar checker (4)
!	%f2  = fb3301a9 2b457afe, Mem[0000000010141400] = 000060fe 68cb889b
	stda	%f2 ,[%i5+0x000]%asi	! Mem[0000000010141400] = fb3301a9 2b457afe
!	Mem[0000000010081413] = c944338c, %l7 = 00000000000000dd
	ldstuba	[%i2+0x013]%asi,%l7	! %l7 = 0000008c000000ff
!	%f18 = f6ae2e34 736ef266, %l0 = 00000000c9ffb347
!	Mem[0000000010181410] = 12a5bcbf17e451f3
	add	%i6,0x010,%g1
	stda	%f18,[%g1+%l0]ASI_PST8_P ! Mem[0000000010181410] = 12aebcbf176ef266
!	Mem[00000000201c0001] = 5001367d, %l0 = 00000000c9ffb347
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 00000001000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = b5c8527f, %l2 = 0000000000000050
	lduwa	[%i1+%o5]0x89,%l2	! %l2 = 00000000b5c8527f

p0_label_13:
!	Mem[00000000300c1408] = af54fcd3 131e9dc8, %l2 = b5c8527f, %l3 = 00003a96
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 00000000af54fcd3 00000000131e9dc8
!	Mem[0000000010141400] = fb3301a92b457afe, %l0 = 0000000000000001
	ldxa	[%i5+%g0]0x80,%l0	! %l0 = fb3301a92b457afe
!	Mem[0000000010081400] = 7b7f9083945960fe, %l6 = 000000000000001f
	ldxa	[%i2+%g0]0x88,%l6	! %l6 = 7b7f9083945960fe
!	Mem[0000000010141400] = fb3301a9, %l7 = 000000000000008c
	ldsha	[%i5+%g0]0x80,%l7	! %l7 = fffffffffffffb33
!	Mem[0000000030181400] = 000060fe4a7f245c, %f22 = 4770ac80 ee7d8c6c
	ldda	[%i6+%g0]0x81,%f22	! %f22 = 000060fe 4a7f245c
!	Mem[0000000010001408] = 603e9969, %l3 = 00000000131e9dc8
	ldsba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000060
!	Mem[0000000030041400] = 030c9fd2, %l5 = 00000000e33c562e
	lduwa	[%i1+%g0]0x81,%l5	! %l5 = 00000000030c9fd2
!	Mem[00000000100c1400] = b5fb5286a19b16f8, %f28 = 9c0583bd 2e562c5a
	ldda	[%i3+%g0]0x80,%f28	! %f28 = b5fb5286 a19b16f8
!	Mem[0000000010001410] = 0000883d, %l3 = 0000000000000060
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = 000000000000883d
!	Starting 10 instruction Store Burst
!	Mem[0000000010141438] = 17e5d837e8f1dbf6, %l4 = 00000000d29f0c03, %l0 = fb3301a92b457afe
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = 17e5d837e8f1dbf6

p0_label_14:
!	%l7 = fffffffffffffb33, Mem[00000000218000c0] = 60f7bf7c, %asi = 80
	stba	%l7,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 33f7bf7c
!	Mem[0000000030001410] = 8c33df4b, %l3 = 000000000000883d
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 0000004b000000ff
!	%f6  = ee902518, Mem[0000000030041400] = 030c9fd2
	sta	%f6 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ee902518
!	%l7 = fffffffffffffb33, Mem[00000000100c1408] = 7621be21
	stwa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = fffffb33
!	%l5 = 00000000030c9fd2, Mem[0000000030001408] = a90133fb
	stha	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = a9019fd2
!	%l0 = 17e5d837e8f1dbf6, Mem[0000000010101430] = 05817381d4975083
	stx	%l0,[%i4+0x030]		! Mem[0000000010101430] = 17e5d837e8f1dbf6
!	Mem[0000000010181434] = d5a201be, %l2 = 00000000af54fcd3
	swap	[%i6+0x034],%l2		! %l2 = 00000000d5a201be
!	Mem[00000000100c1408] = 33fbffff, %l0 = 17e5d837e8f1dbf6
	swapa	[%i3+%o4]0x80,%l0	! %l0 = 0000000033fbffff
!	Mem[00000000201c0000] = 50ff367d, %l3 = 000000000000004b
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 00000050000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001008142c] = 2e2cff12, %f13 = 81738105
	lda	[%i2+0x02c]%asi,%f13	! %f13 = 2e2cff12

p0_label_15:
!	Mem[0000000010141410] = 000038e4, %l6 = 7b7f9083945960fe
	ldsba	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%l7 = fffffffffffffb33, Mem[0000000010081410] = c94433ffbf34f91f
	stx	%l7,[%i2+%o5]		! Mem[0000000010081410] = fffffffffffffb33
!	Mem[0000000010141408] = 66f26e73 342eaef6, %l6 = 00000000, %l7 = fffffb33
	ldd	[%i5+%o4],%l6		! %l6 = 0000000066f26e73 00000000342eaef6
!	Mem[00000000100c1400] = b5fb5286a19b16f8, %f2  = fb3301a9 2b457afe
	ldda	[%i3+%g0]0x80,%f2 	! %f2  = b5fb5286 a19b16f8
!	Mem[0000000010181410] = 12aebcbf, %l0 = 0000000033fbffff
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = 0000000012aebcbf
!	Mem[0000000010141408] = 66f26e73342eaef6, %f30 = f6dbf1e8 37d8e517
	ldda	[%i5+%o4]0x80,%f30	! %f30 = 66f26e73 342eaef6
!	Mem[0000000030041410] = b5c8527f, %l3 = 0000000000000050
	ldsha	[%i1+%o5]0x89,%l3	! %l3 = 000000000000527f
!	Mem[0000000030181400] = 000060fe4a7f245c, %l6 = 0000000066f26e73
	ldxa	[%i6+%g0]0x81,%l6	! %l6 = 000060fe4a7f245c
!	Mem[0000000010081400] = fe605994, %l3 = 000000000000527f
	ldsha	[%i2+%g0]0x80,%l3	! %l3 = fffffffffffffe60
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = d3fc54af, %l4 = 00000000d29f0c03
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 000000af000000ff

p0_label_16:
!	%f0  = fe605994 83907f7b b5fb5286 a19b16f8
!	%f4  = 4cc9ecf1 69993e60 ee902518 96c8ddf2
!	%f8  = 7f52c8b5 600799bb 945900dd 2e2caf12
!	%f12 = 835097d4 2e2cff12 12a5bcbf 17e451f3
	stda	%f0,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%l2 = 00000000d5a201be, Mem[0000000010041410] = af000000
	stwa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = d5a201be
!	%l6 = 000060fe4a7f245c, Mem[0000000010181408] = 000000af
	stha	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000245c
!	%f30 = 66f26e73, Mem[00000000100c1410] = 05000000
	sta	%f30,[%i3+%o5]0x88	! Mem[00000000100c1410] = 66f26e73
!	Mem[0000000030001410] = ffdf338c, %l4 = 00000000000000af
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010101410] = f1ecc94c, %l4 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 00000000f1ecc94c
!	Mem[0000000010181400] = 18d0b9f5, %l2 = 00000000d5a201be
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 00000018000000ff
!	Mem[0000000030001408] = a9019fd2, %l4 = 00000000f1ecc94c
	swapa	[%i0+%o4]0x89,%l4	! %l4 = 00000000a9019fd2
!	Mem[0000000030001408] = f1ecc94c, %l0 = 0000000012aebcbf
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 00000000f1ecc94c
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = c9cbb80d, %l0 = 00000000f1ecc94c
	lduw	[%i1+%g0],%l0		! %l0 = 00000000c9cbb80d

p0_label_17:
!	Mem[0000000030081410] = 70f9546d, %l4 = 00000000a9019fd2
	ldswa	[%i2+%o5]0x81,%l4	! %l4 = 0000000070f9546d
!	Mem[0000000010001400] = 47d1a404 13015707 603e9969 f1ecc94c
!	Mem[0000000010001410] = 3d880000 00000000 63d79011 1e58394a
!	Mem[0000000010001420] = 8af06e6c 0cf436a7 54e6acd2 2b3b5811
!	Mem[0000000010001430] = 927d2856 75852a2e d5a8c226 087cb36e
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000030001410] = 8c33dfff, %l0 = 00000000c9cbb80d
	lduha	[%i0+%o5]0x89,%l0	! %l0 = 000000000000dfff
!	Mem[0000000010101408] = 8652fbb5, %l2 = 0000000000000018
	lduba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000b5
!	Mem[0000000030001410] = 8c33dfff, %l4 = 0000000070f9546d
	ldsha	[%i0+%o5]0x89,%l4	! %l4 = ffffffffffffdfff
!	Mem[0000000010041408] = a625d17a, %l2 = 00000000000000b5
	lduwa	[%i1+%o4]0x88,%l2	! %l2 = 00000000a625d17a
!	Mem[00000000211c0000] = 21ae0b46, %l0 = 000000000000dfff
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = 00000000000021ae
!	Randomly selected nop
	nop
!	Mem[0000000010101400] = fe605994, %l5 = 00000000030c9fd2
	ldswa	[%i4+%g0]0x80,%l5	! %l5 = fffffffffe605994
!	Starting 10 instruction Store Burst
!	%l6 = 4a7f245c, %l7 = 342eaef6, Mem[0000000010081400] = fe605994 83907f7b
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 4a7f245c 342eaef6

p0_label_18:
!	%f9  = 600799bb, Mem[0000000030001400] = dd005994
	sta	%f9 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 600799bb
!	Mem[000000001000140c] = f1ecc94c, %l6 = 000060fe4a7f245c
	swap	[%i0+0x00c],%l6		! %l6 = 00000000f1ecc94c
!	Mem[00000000300c1408] = ff54fcd3, %l3 = fffffffffffffe60
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 00000000ff54fcd3
!	Mem[0000000030141400] = ff10d4d4, %l4 = ffffffffffffdfff
	ldstuba	[%i5+%g0]0x89,%l4	! %l4 = 000000d4000000ff
!	Mem[0000000010001410] = 3d880000, %l0 = 00000000000021ae
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 000000003d880000
!	%f6  = ee902518, %f14 = 12a5bcbf
	fcmpes	%fcc2,%f6 ,%f14		! %fcc2 = 1
!	%l0 = 000000003d880000, Mem[0000000030101408] = dd00b0b6
	stha	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000b0b6
!	%f10 = 945900dd 2e2caf12, Mem[0000000030081410] = 6d54f970 1c7d99cd
	stda	%f10,[%i2+%o5]0x89	! Mem[0000000030081410] = 945900dd 2e2caf12
!	%f8  = 7f52c8b5 600799bb, Mem[0000000010181420] = 932b6321 03b8c9c5
	std	%f8 ,[%i6+0x020]	! Mem[0000000010181420] = 7f52c8b5 600799bb
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = b6b00000, %l4 = 00000000000000d4
	ldsba	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_19:
!	Mem[0000000030181408] = b570b438, %l4 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l4	! %l4 = ffffffffffffb570
!	Mem[00000000300c1410] = d29f0c03 000000af, %l2 = a625d17a, %l3 = ff54fcd3
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000d29f0c03 00000000000000af
!	Mem[0000000010141420] = 78587da8a6823d2b, %l2 = 00000000d29f0c03
	ldxa	[%i5+0x020]%asi,%l2	! %l2 = 78587da8a6823d2b
!	Mem[00000000100c1400] = b5fb5286a19b16f8, %f12 = 835097d4 2e2cff12
	ldda	[%i3+%g0]0x80,%f12	! %f12 = b5fb5286 a19b16f8
!	Mem[0000000010041410] = 8ab8ffffd5a201be, %f8  = 7f52c8b5 600799bb
	ldda	[%i1+%o5]0x88,%f8 	! %f8  = 8ab8ffff d5a201be
!	Mem[0000000010141410] = 000038e4 a627f149, %l6 = f1ecc94c, %l7 = 342eaef6
	ldd	[%i5+%o5],%l6		! %l6 = 00000000000038e4 00000000a627f149
!	Mem[0000000030141408] = 3e6059707430f9ad, %f0  = fe605994 83907f7b
	ldda	[%i5+%o4]0x81,%f0 	! %f0  = 3e605970 7430f9ad
!	Mem[00000000300c1410] = af000000030c9fd2, %l2 = 78587da8a6823d2b
	ldxa	[%i3+%o5]0x89,%l2	! %l2 = af000000030c9fd2
!	Mem[00000000201c0000] = ffff367d, %l0 = 000000003d880000
	ldstub	[%o0+%g0],%l0		! %l0 = 000000ff000000ff
!	Starting 10 instruction Store Burst
!	Mem[000000001000141c] = 1e58394a, %l7 = 00000000a627f149
	swap	[%i0+0x01c],%l7		! %l7 = 000000001e58394a

p0_label_20:
!	%f16 = 47d1a404 13015707 603e9969 f1ecc94c
!	%f20 = 3d880000 00000000 63d79011 1e58394a
!	%f24 = 8af06e6c 0cf436a7 54e6acd2 2b3b5811
!	%f28 = 927d2856 75852a2e d5a8c226 087cb36e
	stda	%f16,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	Mem[0000000020800001] = 3a96188e, %l2 = af000000030c9fd2
	ldstuba	[%o1+0x001]%asi,%l2	! %l2 = 00000096000000ff
!	Mem[0000000010101408] = 8652fbb5, %l5 = fffffffffe605994
	swapa	[%i4+%o4]0x88,%l5	! %l5 = 000000008652fbb5
!	Mem[0000000010101400] = 945960fe, %l5 = 000000008652fbb5
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 000000fe000000ff
!	%l6 = 000038e4, %l7 = 1e58394a, Mem[0000000010081408] = a90133fb fe7a452b
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 000038e4 1e58394a
!	Mem[0000000030041408] = ff0d13a0, %l0 = 00000000000000ff
	ldstuba	[%i1+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%f6  = ee902518 96c8ddf2, %l3 = 00000000000000af
!	Mem[0000000010101400] = ff60599483907f7b
	stda	%f6,[%i4+%l3]ASI_PST8_P ! Mem[0000000010101400] = ee60259496c8ddf2
!	%l2 = 0000000000000096, Mem[0000000030101410] = fe7a452b
	stba	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = fe7a4596
!	%l6 = 00000000000038e4, Mem[0000000010081400] = 5c247f4a
	stha	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 5c2438e4
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff367d, %l0 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff

p0_label_21:
!	Mem[00000000300c1408] = fffffe60131e9dc8, %l6 = 00000000000038e4
	ldxa	[%i3+%o4]0x81,%l6	! %l6 = fffffe60131e9dc8
	membar	#Sync			! Added by membar checker (6)
!	Mem[00000000100c1408] = 603e9969f1ecc94c, %f10 = 945900dd 2e2caf12
	ldda	[%i3+%o4]0x80,%f10	! %f10 = 603e9969 f1ecc94c
!	Mem[0000000010081410] = fffffffffffffb33, %f6  = ee902518 96c8ddf2
	ldda	[%i2+0x010]%asi,%f6 	! %f6  = ffffffff fffffb33
!	Mem[0000000010001400] = 47d1a40413015707, %f24 = 8af06e6c 0cf436a7
	ldda	[%i0+%g0]0x80,%f24	! %f24 = 47d1a404 13015707
!	Mem[0000000010001408] = 603e9969, %l0 = ffffffffffffffff
	lduba	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000060
!	Mem[0000000030001400] = bb990760, %l2 = 0000000000000096
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000760
!	Mem[0000000010101430] = 835097d4, %l2 = 0000000000000760
	ldsba	[%i4+0x033]%asi,%l2	! %l2 = ffffffffffffffd4
!	%f16 = 47d1a404, %f26 = 54e6acd2 2b3b5811
	fstox	%f16,%f26		! %f26 = 00000000 0001a348
!	Mem[0000000030181400] = 000060fe, %l3 = 00000000000000af
	ldsba	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 47d1a404 13015707 603e9969 f1ecc94c
!	%f20 = 3d880000 00000000 63d79011 1e58394a
!	%f24 = 47d1a404 13015707 00000000 0001a348
!	%f28 = 927d2856 75852a2e d5a8c226 087cb36e
	stda	%f16,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400

p0_label_22:
!	%l0 = 00000060, %l1 = 0000008a, Mem[0000000010141408] = 66f26e73 342eaef6
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000060 0000008a
!	%f10 = 603e9969 f1ecc94c, Mem[0000000010141400] = a90133fb fe7a452b
	stda	%f10,[%i5+%g0]0x88	! Mem[0000000010141400] = 603e9969 f1ecc94c
!	%l6 = fffffe60131e9dc8, Mem[0000000010081408] = e43800004a39581e
	stx	%l6,[%i2+%o4]		! Mem[0000000010081408] = fffffe60131e9dc8
!	%l6 = 131e9dc8, %l7 = 1e58394a, Mem[00000000100c1408] = 603e9969 f1ecc94c
	stda	%l6,[%i3+0x008]%asi	! Mem[00000000100c1408] = 131e9dc8 1e58394a
!	Mem[0000000010101408] = 945960fe, %l1 = 000000000000008a
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 00000094000000ff
!	Mem[0000000010001407] = 13015707, %l6 = fffffe60131e9dc8
	ldstuba	[%i0+0x007]%asi,%l6	! %l6 = 00000007000000ff
!	Mem[0000000030141400] = ffd410ff, %l6 = 0000000000000007
	swapa	[%i5+%g0]0x81,%l6	! %l6 = 00000000ffd410ff
!	Mem[0000000010081410] = ffffffff, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l3	! %l3 = 00000000ffffffff
!	%l0 = 00000060, %l1 = 00000094, Mem[0000000030101400] = 47b3ffc9 a3f90626
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000060 00000094
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 37498e58, %l1 = 0000000000000094
	lduwa	[%i2+%o4]0x89,%l1	! %l1 = 0000000037498e58

p0_label_23:
!	Mem[0000000030101408] = 8c959c93 b6b00000, %l0 = 00000060, %l1 = 37498e58
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 00000000b6b00000 000000008c959c93
!	Mem[0000000030141400] = 00000007, %l3 = 00000000ffffffff
	ldsba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 47d1a404, %f12 = b5fb5286
	lda	[%i3+%g0]0x80,%f12	! %f12 = 47d1a404
!	Mem[00000000100c1408] = c89d1e13, %l2 = ffffffffffffffd4
	ldsha	[%i3+%o4]0x88,%l2	! %l2 = 0000000000001e13
!	Mem[0000000010141400] = 4cc9ecf1, %l7 = 000000001e58394a
	ldsha	[%i5+%g0]0x80,%l7	! %l7 = 0000000000004cc9
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010041410] = be01a2d5, %l3 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l3	! %l3 = 000000000000be01
!	Mem[00000000100c1410] = 3d880000, %f2  = b5fb5286
	lda	[%i3+%o5]0x80,%f2 	! %f2 = 3d880000
!	Mem[0000000030041400] = 07570113, %l2 = 0000000000001e13
	lduba	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000007
!	Mem[0000000010081430] = 835097d4, %l3 = 000000000000be01
	lduha	[%i2+0x030]%asi,%l3	! %l3 = 0000000000008350
!	Starting 10 instruction Store Burst
!	%l0 = 00000000b6b00000, Mem[00000000100c1400] = 04a4d147
	stwa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = b6b00000

p0_label_24:
!	Mem[00000000201c0000] = ffff367d, %l6 = 00000000ffd410ff
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	%l0 = 00000000b6b00000, Mem[0000000010141408] = 00000060
	sth	%l0,[%i5+%o4]		! Mem[0000000010141408] = 00000060
!	%f16 = 47d1a404, Mem[0000000030001410] = 8c33dfff
	sta	%f16,[%i0+%o5]0x89	! Mem[0000000030001410] = 47d1a404
!	%l1 = 000000008c959c93, Mem[0000000030001400] = 600799bb
	stha	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 9c9399bb
!	Mem[0000000010181410] = 12aebcbf, %l5 = 00000000000000fe
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 0000000012aebcbf
!	%l5 = 0000000012aebcbf, Mem[00000000300c1408] = fffffe60
	stba	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = bffffe60
!	Mem[0000000030081400] = e10c38e4, %l3 = 0000000000008350
	swapa	[%i2+%g0]0x89,%l3	! %l3 = 00000000e10c38e4
!	Mem[00000000100c1410] = 3d88000000000000, %l3 = 00000000e10c38e4, %l4 = ffffffffffffb570
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 3d88000000000000
!	%f4  = 4cc9ecf1 69993e60, Mem[0000000030101400] = 00000060 00000094
	stda	%f4 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 4cc9ecf1 69993e60
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 588e493710fd8ad0, %l6 = 00000000000000ff
	ldxa	[%i2+%o4]0x81,%l6	! %l6 = 588e493710fd8ad0

p0_label_25:
!	Mem[0000000010101410] = 000000ff, %l3 = 00000000e10c38e4
	ldswa	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1400] = 17cb51ff, %f17 = 13015707
	lda	[%i3+%g0]0x89,%f17	! %f17 = 17cb51ff
!	Mem[0000000010141418] = 6c8c7dee 80ac7047, %l0 = b6b00000, %l1 = 8c959c93
	ldd	[%i5+0x018],%l0		! %l0 = 000000006c8c7dee 0000000080ac7047
!	Mem[0000000030081408] = 588e4937, %l1 = 0000000080ac7047
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 00000000588e4937
!	Mem[0000000010041400] = 0db8cbc9, %l6 = 588e493710fd8ad0
	lduwa	[%i1+%g0]0x88,%l6	! %l6 = 000000000db8cbc9
!	Mem[0000000030081410] = 12af2c2e, %f19 = f1ecc94c
	lda	[%i2+%o5]0x81,%f19	! %f19 = 12af2c2e
!	Mem[0000000030001400] = bb99939c, %f5  = 69993e60
	lda	[%i0+%g0]0x89,%f5 	! %f5 = bb99939c
!	Mem[0000000010181408] = f815fe8e0000245c, %l0 = 000000006c8c7dee
	ldxa	[%i6+%o4]0x88,%l0	! %l0 = f815fe8e0000245c
!	Mem[0000000010101434] = 2e2cff12, %l1 = 00000000588e4937
	ldsba	[%i4+0x034]%asi,%l1	! %l1 = 000000000000002e
!	Starting 10 instruction Store Burst
!	%f31 = 087cb36e, Mem[0000000030181400] = fe600000
	sta	%f31,[%i6+%g0]0x89	! Mem[0000000030181400] = 087cb36e

p0_label_26:
!	%l1 = 000000000000002e, Mem[0000000010081410] = 33fbffff00000000
	stxa	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000000000002e
!	%f8  = 8ab8ffff d5a201be, Mem[00000000300c1410] = 030c9fd2 af000000
	stda	%f8 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 8ab8ffff d5a201be
!	%l4 = 3d88000000000000, Mem[0000000010101410] = 000000ff
	stha	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%l7 = 0000000000004cc9, Mem[00000000211c0000] = 21ae0b46, %asi = 80
	stba	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = c9ae0b46
!	Mem[0000000010141410] = 000038e4, %l7 = 0000000000004cc9
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l4 = 3d88000000000000, Mem[00000000201c0000] = ffff367d, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000367d
!	%f10 = 603e9969 f1ecc94c, Mem[00000000100c1410] = 3d880000 00000000
	std	%f10,[%i3+%o5]	! Mem[00000000100c1410] = 603e9969 f1ecc94c
!	Mem[0000000010181408] = 5c240000, %l2 = 0000000000000007
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 000000005c240000
!	Mem[0000000010141400] = 4cc9ecf1, %l5 = 0000000012aebcbf
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 0000004c000000ff
!	Starting 10 instruction Load Burst
!	%l5 = 000000000000004c, imm = fffffffffffffed6, %l3 = 00000000000000ff
	addc	%l5,-0x12a,%l3		! %l3 = ffffffffffffff22

p0_label_27:
!	Mem[0000000030041408] = 4cc9ecf1, %l3 = ffffffffffffff22
	lduba	[%i1+%o4]0x81,%l3	! %l3 = 000000000000004c
!	Mem[0000000021800140] = 6a3ae6e1, %l5 = 000000000000004c
	ldsb	[%o3+0x140],%l5		! %l5 = 000000000000006a
!	Mem[0000000030001410] = e10c38e447d1a404, %l2 = 000000005c240000
	ldxa	[%i0+%o5]0x89,%l2	! %l2 = e10c38e447d1a404
!	Mem[0000000010141408] = 60000000, %l7 = 0000000000000000
	ldsha	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 131e9dc81e58394a, %f6  = ffffffff fffffb33
	ldda	[%i3+%o4]0x80,%f6 	! %f6  = 131e9dc8 1e58394a
!	Mem[0000000010001400] = 04a4d147, %l3 = 000000000000004c
	lduba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000047
!	%f2  = 3d880000 a19b16f8, %l4 = 3d88000000000000
!	Mem[0000000030181410] = 3981bf37fd7d3778
	add	%i6,0x010,%g1
	stda	%f2,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030181410] = 3981bf37fd7d3778
!	Mem[00000000100c1400] = 0000b0b613015707, %f20 = 3d880000 00000000
	ldda	[%i3+%g0]0x80,%f20	! %f20 = 0000b0b6 13015707
!	Mem[0000000030041400] = 07570113 04a4d147 4cc9ecf1 69993e60
!	Mem[0000000030041410] = 00000000 0000883d 4a39581e 1190d763
!	Mem[0000000030041420] = 07570113 04a4d147 48a30100 00000000
!	Mem[0000000030041430] = 2e2a8575 56287d92 6eb37c08 26c2a8d5
	ldda	[%i1]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030041400
!	Starting 10 instruction Store Burst
!	Mem[0000000010181402] = ffd0b9f5, %l2 = e10c38e447d1a404
	ldstub	[%i6+0x002],%l2		! %l2 = 000000b9000000ff

p0_label_28:
!	Mem[0000000010001438] = d5a8c226087cb36e, %l5 = 000000000000006a, %l1 = 000000000000002e
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = d5a8c226087cb36e
!	%l2 = 00000000000000b9, Mem[0000000030141410] = ca40b42d5051e2ff
	stxa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000000000b9
!	%l2 = 00000000000000b9, Mem[0000000030081410] = 2e2caf12
	stwa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000b9
!	Mem[0000000020800000] = 3aff188e, %l7 = 0000000000000000
	ldstub	[%o1+%g0],%l7		! %l7 = 0000003a000000ff
!	%l5 = 000000000000006a, Mem[0000000010181408] = 00000007
	stba	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 6a000007
!	%l7 = 000000000000003a, Mem[0000000010081400] = 5c2438e4
	stba	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 5c24383a
!	Mem[0000000010181410] = 000000fe176ef266, %l7 = 000000000000003a, %l4 = 3d88000000000000
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l7,%l4	! %l4 = 000000fe176ef266
!	%l0 = 0000245c, %l1 = 087cb36e, Mem[0000000010101408] = fe6059ff f8169ba1
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000245c 087cb36e
!	Mem[0000000030001410] = 04a4d147, %l0 = f815fe8e0000245c
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 00000004000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = bfbcae12, %l6 = 000000000db8cbc9
	lduba	[%i0+%o4]0x81,%l6	! %l6 = 00000000000000bf

p0_label_29:
!	Mem[0000000030101408] = b6b00000, %l5 = 000000000000006a
	ldsba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800140] = 6a3ae6e1, %l7 = 000000000000003a
	ldsha	[%o3+0x140]%asi,%l7	! %l7 = 0000000000006a3a
!	Mem[0000000010141430] = 5a2c562e bd83059c, %l0 = 00000004, %l1 = 087cb36e
	ldda	[%i5+0x030]%asi,%l0	! %l0 = 000000005a2c562e 00000000bd83059c
!	Mem[0000000010101408] = 087cb36e 0000245c, %l2 = 000000b9, %l3 = 00000047
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 000000000000245c 00000000087cb36e
!	Mem[0000000010181408] = 6a000007 8efe15f8, %l4 = 176ef266, %l5 = 00000000
	ldda	[%i6+%o4]0x80,%l4	! %l4 = 000000006a000007 000000008efe15f8
!	Mem[0000000010181434] = af54fcd3, %l4 = 000000006a000007
	lduwa	[%i6+0x034]%asi,%l4	! %l4 = 00000000af54fcd3
!	Mem[0000000010081438] = 7f36f251, %f27 = 0001a348
	ld	[%i2+0x038],%f27	! %f27 = 7f36f251
!	Mem[0000000030141410] = b900000000000000, %f30 = d5a8c226 087cb36e
	ldda	[%i5+%o5]0x81,%f30	! %f30 = b9000000 00000000
!	Mem[0000000030141410] = b9000000 00000000, %l2 = 0000245c, %l3 = 087cb36e
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 00000000b9000000 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 4cc9ecf1, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 0000004c000000ff

p0_label_30:
!	%f18 = 603e9969 12af2c2e, Mem[0000000030081410] = 000000b9 945900dd
	stda	%f18,[%i2+%o5]0x89	! Mem[0000000030081410] = 603e9969 12af2c2e
!	%l2 = b9000000, %l3 = 0000004c, Mem[0000000030001408] = 12aebcbf fe7a452b
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = b9000000 0000004c
!	%f24 = 47d1a404 13015707, %l7 = 0000000000006a3a
!	Mem[0000000010001410] = 000021ae00000000
	add	%i0,0x010,%g1
	stda	%f24,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010001410] = 000001130000d147
!	%l7 = 0000000000006a3a, Mem[00000000211c0001] = c9ae0b46
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = c93a0b46
!	Mem[0000000010101400] = ee602594, %l5 = 000000008efe15f8
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 00000000ee602594
!	%l3 = 000000000000004c, Mem[000000001014142c] = 4751511c, %asi = 80
	stba	%l3,[%i5+0x02c]%asi	! Mem[000000001014142c] = 4c51511c
!	%l2 = 00000000b9000000, Mem[00000000300c1408] = bffffe60
	stwa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = b9000000
!	Mem[0000000010081430] = 835097d481738105, %l5 = 00000000ee602594, %l6 = 00000000000000bf
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 835097d481738105
	membar	#Sync			! Added by membar checker (8)
!	%l0 = 000000005a2c562e, Mem[0000000030041410] = 00000000
	stba	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 2e000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 37bf8139, %l7 = 0000000000006a3a
	ldsba	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000039

p0_label_31:
!	Mem[0000000030041408] = f1ecc9ff, %f26 = 00000000
	lda	[%i1+%o4]0x89,%f26	! %f26 = f1ecc9ff
!	Mem[0000000010001408] = 603e9969 4a7f245c, %l4 = af54fcd3, %l5 = ee602594
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 00000000603e9969 000000004a7f245c
!	Mem[0000000030081410] = 12af2c2e, %l7 = 0000000000000039
	lduha	[%i2+%o5]0x89,%l7	! %l7 = 0000000000002c2e
!	Mem[0000000030101410] = 96457afe, %l5 = 000000004a7f245c
	ldswa	[%i4+%o5]0x81,%l5	! %l5 = ffffffff96457afe
!	%l6 = 81738105, %l7 = 00002c2e, Mem[00000000300c1408] = 000000b9 c89d1e13
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 81738105 00002c2e
!	Mem[00000000100c1408] = c89d1e13, %f2  = 603e9969
	lda	[%i3+%o4]0x88,%f2 	! %f2 = c89d1e13
!	Mem[00000000300c1408] = 00002c2e 81738105, %l4 = 603e9969, %l5 = 96457afe
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 0000000081738105 0000000000002c2e
!	Mem[00000000300c1408] = 00002c2e81738105, %f26 = f1ecc9ff 7f36f251
	ldda	[%i3+%o4]0x89,%f26	! %f26 = 00002c2e 81738105
!	Mem[0000000010001410] = 000001130000d147, %l5 = 0000000000002c2e
	ldxa	[%i0+%o5]0x80,%l5	! %l5 = 000001130000d147
!	Starting 10 instruction Store Burst
!	Mem[000000001000142c] = 2b3b5811, %l4 = 81738105, %l7 = 00002c2e
	add	%i0,0x2c,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 000000002b3b5811

p0_label_32:
!	%l7 = 000000002b3b5811, Mem[0000000030141400] = 5f81b92707000000
	stxa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000002b3b5811
!	%l5 = 000001130000d147, Mem[0000000010141407] = 69993e60
	stb	%l5,[%i5+0x007]		! Mem[0000000010141404] = 69993e47
!	%l5 = 000001130000d147, Mem[0000000030181408] = b570b438
	stba	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 4770b438
!	%f19 = 12af2c2e, Mem[0000000010181408] = 0700006a
	sta	%f19,[%i6+%o4]0x88	! Mem[0000000010181408] = 12af2c2e
!	%l2 = b9000000, %l3 = 0000004c, Mem[0000000010041400] = c9cbb80d affa04d9
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = b9000000 0000004c
!	Mem[0000000030141410] = 000000b9, %l7 = 000000002b3b5811
	ldstuba	[%i5+%o5]0x89,%l7	! %l7 = 000000b9000000ff
!	%f20 = 0000b0b6 13015707, Mem[0000000010141410] = e43800ff 49f127a6
	stda	%f20,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000b0b6 13015707
!	Mem[0000000030101400] = 69993e60, %l3 = 000000000000004c
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 00000060000000ff
!	%f6  = 63d79011 1e58394a, %l2 = 00000000b9000000
!	Mem[0000000010141408] = 000000600000008a
	add	%i5,0x008,%g1
	stda	%f6,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010141408] = 000000600000008a
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000000 0000002e, %l2 = b9000000, %l3 = 00000060
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 000000000000002e 0000000000000000

p0_label_33:
!	Mem[0000000030081410] = 2e2caf12, %l5 = 000001130000d147
	lduba	[%i2+%o5]0x81,%l5	! %l5 = 000000000000002e
!	Mem[0000000010101410] = 00000000, %l5 = 000000000000002e
	ldswa	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = b9000000, %l7 = 00000000000000b9
	ldsha	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffb900
!	Mem[0000000010181400] = ffd0fff593a23cfb, %l3 = 0000000000000000
	ldx	[%i6+%g0],%l3		! %l3 = ffd0fff593a23cfb
!	Mem[0000000010141410] = 07570113, %l3 = ffd0fff593a23cfb
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = 0000000007570113
!	Mem[0000000010081408] = 60feffff, %l4 = 0000000081738105
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000100c1400] = 0000b0b6, %l2 = 000000000000002e
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 000000000000b0b6
!	Mem[0000000020800040] = ffff9e9b, %l7 = ffffffffffffb900
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181408] = 2e2caf12, %l7 = ffffffffffffffff
	ldsha	[%i6+%o4]0x80,%l7	! %l7 = 0000000000002e2c
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = fffffe60, %l1 = 00000000bd83059c
	swapa	[%i2+%o4]0x80,%l1	! %l1 = 00000000fffffe60

p0_label_34:
!	%f6  = 63d79011 1e58394a, %l0 = 000000005a2c562e
!	Mem[0000000010001430] = 927d285675852a2e
	add	%i0,0x030,%g1
	stda	%f6,[%g1+%l0]ASI_PST8_P ! Mem[0000000010001430] = 927d90561e58392e
!	Mem[0000000030041410] = 2e000000, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 0000002e000000ff
!	%f22 = 63d79011, Mem[00000000100c1434] = 75852a2e
	st	%f22,[%i3+0x034]	! Mem[00000000100c1434] = 63d79011
!	%l6 = 835097d481738105, Mem[0000000010001400] = 47d1a404
	stha	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 8105a404
!	%l4 = 00000000000000ff, Mem[00000000300c1408] = 05817381
	stba	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff817381
!	Mem[0000000010181400] = fb3ca293 f5ffd0ff, %l4 = 000000ff, %l5 = 0000002e
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 00000000f5ffd0ff 00000000fb3ca293
!	%l3 = 0000000007570113, Mem[0000000030101400] = 4cc9ecf169993eff
	stxa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000007570113
!	Mem[0000000010041400] = 000000b9, %l3 = 0000000007570113
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 000000b9000000ff
!	Mem[0000000010081408] = 9c0583bd, %l3 = 00000000000000b9
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 000000009c0583bd
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffff188e, %l4 = 00000000f5ffd0ff
	lduba	[%o1+0x000]%asi,%l4	! %l4 = 00000000000000ff

p0_label_35:
!	Mem[0000000030081400] = 508300004488bbf7, %f18 = 603e9969 12af2c2e
	ldda	[%i2+%g0]0x81,%f18	! %f18 = 50830000 4488bbf7
!	Mem[0000000030101408] = 0000b0b6, %l3 = 000000009c0583bd
	ldsha	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 7ad125a6, %l0 = 000000005a2c562e
	ldswa	[%i1+%o4]0x80,%l0	! %l0 = 000000007ad125a6
	membar	#Sync			! Added by membar checker (9)
!	Mem[00000000100c1400] = 0000b0b6 13015707 131e9dc8 1e58394a
!	Mem[00000000100c1410] = 603e9969 f1ecc94c 63d79011 1e58394a
!	Mem[00000000100c1420] = 8af06e6c 0cf436a7 54e6acd2 2b3b5811
!	Mem[00000000100c1430] = 927d2856 63d79011 d5a8c226 087cb36e
	ldda	[%i3]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000030181410] = 37bf8139, %l3 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l3	! %l3 = 0000000037bf8139
!	Mem[0000000010141408] = 60000000, %l4 = 00000000000000ff
	ldsba	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = 5c240000, %l2 = 000000000000b0b6
	lduha	[%i4+%o4]0x80,%l2	! %l2 = 0000000000005c24
!	Mem[0000000030001410] = 47d1a4ff, %l2 = 0000000000005c24
	lduha	[%i0+%o5]0x89,%l2	! %l2 = 000000000000a4ff
!	Mem[00000000100c1410] = 603e9969, %l0 = 000000007ad125a6
	ldsba	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000060
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 13015707, %l5 = 00000000fb3ca293
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 00000007000000ff

p0_label_36:
!	%l4 = 00000000, %l5 = 00000007, Mem[0000000010081410] = 0000002e 00000000
	stda	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 00000007
!	Mem[00000000218001c1] = ffbc4fd1, %l2 = 000000000000a4ff
	ldstuba	[%o3+0x1c1]%asi,%l2	! %l2 = 000000bc000000ff
	membar	#Sync			! Added by membar checker (10)
!	%l4 = 00000000, %l5 = 00000007, Mem[00000000100c1410] = 69993e60 4cc9ecf1
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 00000007
!	%f18 = 4a39581e c89d1e13, Mem[0000000010101400] = f815fe8e f2ddc896
	stda	%f18,[%i4+%g0]0x88	! Mem[0000000010101400] = 4a39581e c89d1e13
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 0000000000000060
	setx	0x4b7e4ac7d5029432,%g7,%l0 ! %l0 = 4b7e4ac7d5029432
!	%l1 = 00000000fffffe60
	setx	0x4f911428794c77f1,%g7,%l1 ! %l1 = 4f911428794c77f1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4b7e4ac7d5029432
	setx	0xea4769383a0721ba,%g7,%l0 ! %l0 = ea4769383a0721ba
!	%l1 = 4f911428794c77f1
	setx	0x87af006795e3f997,%g7,%l1 ! %l1 = 87af006795e3f997
!	%f2  = c89d1e13 f1ecc94c, %l3 = 0000000037bf8139
!	Mem[0000000010181438] = d4d3ad41c044bcf4
	add	%i6,0x038,%g1
	stda	%f2,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010181438] = 4cd3adf1131ebcf4
!	%l2 = 000000bc, %l3 = 37bf8139, Mem[0000000010141408] = 00000060 0000008a
	stda	%l2,[%i5+0x008]%asi	! Mem[0000000010141408] = 000000bc 37bf8139
!	%l4 = 00000000, %l5 = 00000007, Mem[0000000030001400] = 9c9399bb 83907f7b
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 00000007
!	%l3 = 0000000037bf8139, Mem[0000000010041422] = d2536d48
	stb	%l3,[%i1+0x022]		! Mem[0000000010041420] = d2533948
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 4a39581e c89d1e13, %l4 = 00000000, %l5 = 00000007
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000c89d1e13 000000004a39581e

p0_label_37:
!	Mem[0000000010001430] = 927d90561e58392e, %f22 = 4a39581e 1190d763
	ldda	[%i0+0x030]%asi,%f22	! %f22 = 927d9056 1e58392e
!	Mem[0000000030041400] = ff570113, %l7 = 0000000000002e2c
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001410] = 00000113, %l7 = 00000000000000ff
	ldub	[%i0+%o5],%l7		! %l7 = 0000000000000000
!	Mem[0000000010001408] = 603e9969, %l7 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000060
!	Mem[00000000100c1410] = 00000000, %f19 = c89d1e13
	lda	[%i3+%o5]0x88,%f19	! %f19 = 00000000
!	Mem[0000000010101410] = 00000000, %l1 = 87af006795e3f997
	lduba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800040] = ffff9e9b, %l7 = 0000000000000060
	ldsb	[%o1+0x040],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010141410] = 07570113, %l1 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000757
!	Mem[0000000010101408] = 087cb36e 0000245c, %l0 = 3a0721ba, %l1 = 00000757
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 000000000000245c 00000000087cb36e
!	Starting 10 instruction Store Burst
!	%f24 = a736f40c, Mem[0000000010181414] = 176ef266
	sta	%f24,[%i6+0x014]%asi	! Mem[0000000010181414] = a736f40c

p0_label_38:
!	Mem[0000000030181400] = 087cb36e, %l2 = 00000000000000bc
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 0000006e000000ff
!	%l3 = 0000000037bf8139, Mem[0000000010041408] = a625d17a
	stwa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 37bf8139
!	%l2 = 000000000000006e, Mem[0000000010001420] = 8af06e6c, %asi = 80
	stba	%l2,[%i0+0x020]%asi	! Mem[0000000010001420] = 6ef06e6c
!	Mem[0000000010041408] = 37bf8139, %l7 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 00000039000000ff
!	Mem[000000001010140c] = 6eb37c08, %l2 = 000000000000006e, %asi = 80
	swapa	[%i4+0x00c]%asi,%l2	! %l2 = 000000006eb37c08
!	%f16 = 07570113, %f8  = 47d1a404
	fitos	%f16,%f8 		! %f8  = 4ceae022
!	%l4 = 00000000c89d1e13, Mem[0000000030101408] = 0000b0b6
	stwa	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = c89d1e13
!	%l5 = 000000004a39581e, Mem[0000000030101400] = 07570113
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 0757011e
!	Mem[0000000010101408] = 0000245c, %l7 = 0000000000000039
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 000000000000245c
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = 0cf436a7, %l6 = 835097d481738105
	ldub	[%i0+0x024],%l6		! %l6 = 000000000000000c

p0_label_39:
!	Mem[00000000211c0000] = c93a0b46, %l6 = 000000000000000c
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffc93a
!	Mem[0000000010101428] = 945900dd, %l3 = 0000000037bf8139
	lduwa	[%i4+0x028]%asi,%l3	! %l3 = 00000000945900dd
!	Mem[0000000020800000] = ffff188e, %l1 = 00000000087cb36e
	ldsba	[%o1+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1408] = ff817381, %l3 = 00000000945900dd
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 000000000000ff81
!	Mem[0000000010001420] = 6ef06e6c, %l5 = 000000004a39581e
	ldsw	[%i0+0x020],%l5		! %l5 = 000000006ef06e6c
!	Mem[0000000010181428] = 9cdef36b, %l1 = ffffffffffffffff
	ldsb	[%i6+0x029],%l1		! %l1 = ffffffffffffffde
!	Mem[0000000030081408] = 588e4937, %l4 = 00000000c89d1e13
	ldsba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000058
!	Mem[0000000010181408] = 2e2caf12, %l7 = 000000000000245c
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 000000002e2caf12
!	Mem[0000000021800180] = 53b935e9, %l3 = 000000000000ff81
	lduba	[%o3+0x180]%asi,%l3	! %l3 = 0000000000000053
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ff51cb17, %l4 = 0000000000000058
	ldstuba	[%i3+%g0]0x81,%l4	! %l4 = 000000ff000000ff

p0_label_40:
!	%f16 = 07570113, %f7  = 1e58394a, %f30 = 6eb37c08
	fdivs	%f16,%f7 ,%f30		! %f30 = 287e8e5a
!	Mem[0000000030101400] = 0757011e, %l1 = ffffffffffffffde
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 000000000757011e
!	Mem[0000000010001400] = 8105a404, %l5 = 000000006ef06e6c
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 00000081000000ff
!	%l0 = 000000000000245c, Mem[0000000010041417] = ffffb88a
	stb	%l0,[%i1+0x017]		! Mem[0000000010041414] = ffffb85c
!	Mem[0000000030101400] = ffffffde, %l3 = 0000000000000053
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 000000de000000ff
!	%f14 = d5a8c226 087cb36e, %l1 = 000000000757011e
!	Mem[0000000030041408] = ffc9ecf169993e60
	add	%i1,0x008,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_S ! Mem[0000000030041408] = d5a8c22669993e60
!	Mem[0000000030081410] = 12af2c2e, %l0 = 000000000000245c
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 0000002e000000ff
!	%f6  = 63d79011 1e58394a, Mem[0000000030101410] = 96457afe 86ee9f04
	stda	%f6 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 63d79011 1e58394a
!	%f12 = 927d2856 75852a2e, Mem[0000000010001408] = 603e9969 4a7f245c
	std	%f12,[%i0+%o4]	! Mem[0000000010001408] = 927d2856 75852a2e
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 13010000, %l7 = 000000002e2caf12
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_41:
!	Mem[0000000010101408] = 00000039, %l0 = 000000000000002e
	ldsha	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000039
!	Mem[0000000010181408] = 2e2caf12, %l2 = 000000006eb37c08
	lduwa	[%i6+%o4]0x80,%l2	! %l2 = 000000002e2caf12
!	Mem[0000000030101400] = ffffffff, %l4 = 00000000000000ff
	ldswa	[%i4+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041408] = d5a8c226, %l2 = 000000002e2caf12
	lduha	[%i1+%o4]0x81,%l2	! %l2 = 000000000000d5a8
!	Mem[0000000010101400] = 131e9dc8, %f0  = 47d1a404
	lda	[%i4+%g0]0x80,%f0 	! %f0 = 131e9dc8
!	Mem[0000000010081408] = b9000000131e9dc8, %f4  = 3d880000 00000000
	ldda	[%i2+%o4]0x80,%f4 	! %f4  = b9000000 131e9dc8
!	Mem[0000000030141400] = 2b3b5811, %l3 = 00000000000000de
	ldsha	[%i5+%g0]0x89,%l3	! %l3 = 0000000000005811
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010141400] = ffc9ecf1 69993e47 000000bc 37bf8139
!	Mem[0000000010141410] = 07570113 b6b00000 6c8c7dee 80ac7047
!	Mem[0000000010141420] = 78587da8 a6823d2b ac635fb4 4c51511c
!	Mem[0000000010141430] = 5a2c562e bd83059c 17e5d837 e8f1dbf6
	ldda	[%i5]ASI_BLK_PL,%f16	! Block Load from 0000000010141400
!	Mem[0000000030001400] = 00000000, %l4 = ffffffffffffffff
	ldsba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 000000000757011e, Mem[0000000030001400] = 00000000
	stwa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 0757011e

p0_label_42:
!	%f14 = d5a8c226 087cb36e, %l3 = 0000000000005811
!	Mem[0000000030001438] = 7f36f251fcea6812
	add	%i0,0x038,%g1
	stda	%f14,[%g1+%l3]ASI_PST8_S ! Mem[0000000030001438] = 7f36f226fcea686e
!	Mem[0000000030181400] = ffb37c08, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 00000000ffb37c08
!	%l1 = 000000000757011e, Mem[0000000030001410] = 47d1a4ff
	stha	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 47d1011e
!	%l2 = 000000000000d5a8, Mem[0000000010101410] = 00000000
	stba	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000a8
!	Mem[0000000010001438] = d5a8c226, %l6 = ffffc93a, %l7 = ffb37c08
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 00000000d5a8c226
!	Mem[0000000030081408] = 37498e58, %l3 = 0000000000005811
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 00000058000000ff
!	Mem[0000000010041410] = d5a201be, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 000000be000000ff
!	%l7 = 00000000d5a8c226, Mem[0000000010081400] = 5c24383a
	stba	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 5c243826
!	%f5  = 131e9dc8, Mem[0000000030181410] = 3981bf37
	sta	%f5 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 131e9dc8
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 53b935e9, %l5 = 0000000000000081
	lduha	[%o3+0x180]%asi,%l5	! %l5 = 00000000000053b9

p0_label_43:
!	Mem[0000000030101408] = 8c959c93 131e9dc8, %l4 = 000000be, %l5 = 000053b9
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000131e9dc8 000000008c959c93
!	Mem[0000000010001408] = 927d2856, %l5 = 000000008c959c93
	ldsha	[%i0+%o4]0x80,%l5	! %l5 = ffffffffffff927d
!	Mem[0000000010041410] = ff01a2d5, %l5 = ffffffffffff927d
	ldsba	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101410] = 1190d763, %l6 = ffffffffffffc93a
	lduha	[%i4+%o5]0x89,%l6	! %l6 = 000000000000d763
!	Mem[0000000010001400] = ff570113 04a405ff, %l2 = 0000d5a8, %l3 = 00000058
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 0000000004a405ff 00000000ff570113
!	Mem[0000000010001408] = 56287d92, %l5 = ffffffffffffffff
	ldsha	[%i0+%o4]0x88,%l5	! %l5 = 0000000000007d92
!	Mem[00000000300c1408] = ff817381, %l3 = 00000000ff570113
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 000000000000ff81
!	Mem[0000000030181400] = 000000004a7f245c, %l0 = 0000000000000039
	ldxa	[%i6+%g0]0x81,%l0	! %l0 = 000000004a7f245c
!	Mem[0000000030081400] = 50830000, %l1 = 000000000757011e
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000050
!	Starting 10 instruction Store Burst
!	Mem[000000001010141c] = 96c8ddf2, %l5 = 0000000000007d92
	ldstub	[%i4+0x01c],%l5		! %l5 = 00000096000000ff

p0_label_44:
	membar	#Sync			! Added by membar checker (12)
!	%l4 = 00000000131e9dc8, Mem[0000000010141400] = ffc9ecf169993e47
	stxa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000131e9dc8
!	%l2 = 0000000004a405ff, Mem[0000000010001434] = 1e58392e, %asi = 80
	stha	%l2,[%i0+0x034]%asi	! Mem[0000000010001434] = 05ff392e
!	%l4 = 00000000131e9dc8, Mem[0000000030041408] = 26c2a8d5
	stwa	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 131e9dc8
!	%l1 = 0000000000000050, Mem[0000000010081413] = 00000000
	stb	%l1,[%i2+0x013]		! Mem[0000000010081410] = 00000050
!	%l2 = 04a405ff, %l3 = 0000ff81, Mem[0000000010141400] = 00000000 131e9dc8
	stda	%l2,[%i5+0x000]%asi	! Mem[0000000010141400] = 04a405ff 0000ff81
!	%f21 = 13015707, Mem[0000000010041400] = ff000000
	sta	%f21,[%i1+%g0]0x80	! Mem[0000000010041400] = 13015707
!	Mem[00000000300c1410] = d5a201be, %l0 = 000000004a7f245c
	ldstuba	[%i3+%o5]0x89,%l0	! %l0 = 000000be000000ff
!	%l4 = 131e9dc8, %l5 = 00000096, Mem[0000000030081400] = 50830000 4488bbf7
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 131e9dc8 00000096
!	%f4  = b9000000 131e9dc8, Mem[0000000010141408] = 000000bc 37bf8139
	stda	%f4 ,[%i5+0x008]%asi	! Mem[0000000010141408] = b9000000 131e9dc8
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 78377dfdc89d1e13, %f0  = 131e9dc8 13015707
	ldda	[%i6+%o5]0x89,%f0 	! %f0  = 78377dfd c89d1e13

p0_label_45:
!	Mem[0000000030001408] = 0000004cb9000000, %l5 = 0000000000000096
	ldxa	[%i0+%o4]0x89,%l5	! %l5 = 0000004cb9000000
!	Mem[0000000010101438] = 12a5bcbf17e451f3, %f12 = 927d2856 75852a2e
	ldd	[%i4+0x038],%f12	! %f12 = 12a5bcbf 17e451f3
!	Mem[0000000030081410] = 603e996912af2cff, %l2 = 0000000004a405ff
	ldxa	[%i2+%o5]0x89,%l2	! %l2 = 603e996912af2cff
!	Mem[0000000010041410] = 5cb8ffff d5a201ff, %l4 = 131e9dc8, %l5 = b9000000
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 00000000d5a201ff 000000005cb8ffff
!	Mem[0000000030001408] = b9000000, %l0 = 00000000000000be
	ldsha	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081428] = 884d86b32e2cff12, %l6 = 000000000000d763
	ldxa	[%i2+0x028]%asi,%l6	! %l6 = 884d86b32e2cff12
!	Mem[0000000010081400] = 2638245c342eaef6, %l4 = 00000000d5a201ff
	ldx	[%i2+%g0],%l4		! %l4 = 2638245c342eaef6
!	Mem[0000000010001400] = ff05a404, %l7 = 00000000d5a8c226
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1408] = ff817381, %l5 = 000000005cb8ffff
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffff81
!	Starting 10 instruction Store Burst
!	%f2  = c89d1e13 f1ecc94c, %l3 = 000000000000ff81
!	Mem[0000000010141420] = 78587da8a6823d2b
	add	%i5,0x020,%g1
	stda	%f2,[%g1+%l3]ASI_PST8_P ! Mem[0000000010141420] = c8587da8a6823d4c

p0_label_46:
!	%l6 = 884d86b32e2cff12, Mem[0000000010101434] = 2e2cff12, %asi = 80
	stha	%l6,[%i4+0x034]%asi	! Mem[0000000010101434] = ff12ff12
!	%f1  = c89d1e13, Mem[0000000030041408] = c89d1e13
	sta	%f1 ,[%i1+%o4]0x81	! Mem[0000000030041408] = c89d1e13
!	Mem[0000000030001408] = 000000b9, %l7 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000b9
!	%l5 = ffffffffffffff81, Mem[0000000030181408] = 4770b438
	stba	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 8170b438
!	%l1 = 0000000000000050, Mem[0000000020800040] = ffff9e9b
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 00509e9b
!	Mem[0000000030181408] = 38b47081, %l0 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 00000081000000ff
!	%l4 = 2638245c342eaef6, Mem[0000000030181400] = 000000004a7f245c
	stxa	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 2638245c342eaef6
!	%l6 = 884d86b32e2cff12, Mem[0000000010101400] = 131e9dc8
	stha	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = ff129dc8
!	Mem[0000000010081434] = 81738105, %l5 = ffffff81, %l3 = 0000ff81
	add	%i2,0x34,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 0000000081738105
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = 4cd3adf1, %l5 = ffffffffffffff81
	lduwa	[%i6+0x038]%asi,%l5	! %l5 = 000000004cd3adf1

p0_label_47:
!	Mem[0000000010141408] = b9000000 131e9dc8, %l2 = 12af2cff, %l3 = 81738105
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 00000000b9000000 00000000131e9dc8
!	Mem[0000000030101410] = 63d79011, %l2 = 00000000b9000000
	lduha	[%i4+%o5]0x81,%l2	! %l2 = 00000000000063d7
!	Mem[0000000030181400] = 5c243826, %l4 = 2638245c342eaef6
	lduha	[%i6+%g0]0x89,%l4	! %l4 = 0000000000003826
!	Mem[0000000030181408] = 38b470ff, %l5 = 000000004cd3adf1
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101430] = 835097d4, %l1 = 0000000000000050
	ldsh	[%i4+0x030],%l1		! %l1 = ffffffffffff8350
!	Mem[0000000030101400] = ffffffff, %l4 = 0000000000003826
	ldsba	[%i4+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081400] = 2638245c, %f27 = b45f63ac
	lda	[%i2+%g0]0x80,%f27	! %f27 = 2638245c
!	Mem[0000000010141408] = 000000b9, %l6 = 884d86b32e2cff12
	ldsba	[%i5+%o4]0x88,%l6	! %l6 = ffffffffffffffb9
!	Mem[0000000010141400] = ff05a404, %l0 = 0000000000000081
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 00000000ff05a404
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 000000ff, %l3 = 00000000131e9dc8
	ldstuba	[%i0+%o4]0x81,%l3	! %l3 = 00000000000000ff

p0_label_48:
!	Mem[0000000010001410] = 13010000, %l1 = ffffffffffff8350
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l4 = ffffffffffffffff, Mem[0000000010101410] = a800000069993e60
	stx	%l4,[%i4+%o5]		! Mem[0000000010101410] = ffffffffffffffff
!	%l0 = 00000000ff05a404, Mem[0000000030141410] = ff000000
	stha	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = a4040000
!	%f18 = 3981bf37 bc000000, Mem[0000000030141410] = a4040000 00000000
	stda	%f18,[%i5+%o5]0x81	! Mem[0000000030141410] = 3981bf37 bc000000
!	%l0 = ff05a404, %l1 = 00000000, Mem[0000000010001410] = ff000113 0000d147
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = ff05a404 00000000
!	%f3  = f1ecc94c, Mem[00000000100c1410] = 00000000
	sta	%f3 ,[%i3+0x010]%asi	! Mem[00000000100c1410] = f1ecc94c
!	%l4 = ffffffffffffffff, Mem[0000000030141410] = 3981bf37
	stba	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = ff81bf37
!	%f8  = 4ceae022, Mem[000000001010143c] = 17e451f3
	sta	%f8 ,[%i4+0x03c]%asi	! Mem[000000001010143c] = 4ceae022
!	Mem[00000000300c1400] = 17cb51ff, %l2 = 00000000000063d7
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 0000000017cb51ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 00509e9b, %l1 = 0000000000000000
	ldsba	[%o1+0x040]%asi,%l1	! %l1 = 0000000000000000

p0_label_49:
!	Mem[0000000030181400] = 5c243826, %l2 = 0000000017cb51ff
	lduha	[%i6+%g0]0x89,%l2	! %l2 = 0000000000003826
!	Mem[0000000010181400] = ffd0fff5 93a23cfb 2e2caf12 8efe15f8
!	Mem[0000000010181410] = 000000fe a736f40c 7a23e254 c2e9196a
!	Mem[0000000010181420] = 7f52c8b5 600799bb 9cdef36b 332e64f0
!	Mem[0000000010181430] = abb4ff83 af54fcd3 4cd3adf1 131ebcf4
	ldda	[%i6]ASI_BLK_AIUP,%f0	! Block Load from 0000000010181400
!	Mem[00000000300c1400] = d7630000, %l5 = ffffffffffffffff
	ldsha	[%i3+%g0]0x81,%l5	! %l5 = ffffffffffffd763
!	Mem[0000000030081410] = ff2caf12, %l6 = ffffffffffffffb9
	ldsba	[%i2+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141410] = ff81bf37, %l5 = ffffffffffffd763
	lduwa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ff81bf37
!	Mem[000000001004141c] = 7a4a8882, %l1 = 0000000000000000
	ldsb	[%i1+0x01d],%l1		! %l1 = 000000000000004a
!	Mem[00000000100c1400] = 0000b0b613015707, %f24 = 2b3d82a6 a87d5878
	ldda	[%i3+%g0]0x80,%f24	! %f24 = 0000b0b6 13015707
!	%f18 = 3981bf37 bc000000, %f20 = 0000b0b6
	fxtos	%f18,%f20		! %f20 = 5e6606fd
!	Mem[00000000100c1408] = 131e9dc8, %f21 = 13015707
	lda	[%i3+0x008]%asi,%f21	! %f21 = 131e9dc8
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ff81bf37, %l6 = ffffffffffffffff
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 00000000ff81bf37

p0_label_50:
!	%l7 = 00000000000000b9, Mem[0000000030001400] = 1e01570700000007
	stxa	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000b9
!	%l7 = 00000000000000b9, Mem[0000000010001408] = 927d285675852a2e
	stxa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000000000b9
!	Mem[0000000030081410] = ff2caf12, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 00000000ff2caf12
!	%l3 = 00000000ff2caf12, Mem[0000000010101410] = ffffffffffffffff
	stxa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000ff2caf12
!	Mem[00000000100c1410] = 4cc9ecf1, %l4 = ffffffffffffffff
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 000000004cc9ecf1
!	%l3 = 00000000ff2caf12, Mem[0000000010141400] = 81ff0000ff05a404
	stxa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000ff2caf12
!	Mem[0000000010001410] = ff05a404, %l4 = 000000004cc9ecf1
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff05a404
!	%f20 = 5e6606fd 131e9dc8, Mem[0000000030081408] = ff8e4937 10fd8ad0
	stda	%f20,[%i2+%o4]0x81	! Mem[0000000030081408] = 5e6606fd 131e9dc8
!	Mem[0000000030001400] = 00000000, %l2 = 0000000000003826
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 63d790111e58394a, %f28 = 9c0583bd 2e562c5a
	ldda	[%i4+%o5]0x81,%f28	! %f28 = 63d79011 1e58394a

p0_label_51:
!	Mem[00000000300c1408] = ff8173812e2c0000, %f30 = f6dbf1e8 37d8e517
	ldda	[%i3+%o4]0x81,%f30	! %f30 = ff817381 2e2c0000
!	Mem[0000000030141408] = 7059603e, %l2 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l2	! %l2 = 000000007059603e
!	Mem[00000000201c0000] = 0000367d, %l6 = 00000000ff81bf37
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = ff129dc8 1e58394a, %l2 = 7059603e, %l3 = ff2caf12
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 00000000ff129dc8 000000001e58394a
!	Mem[0000000010101400] = c89d12ff, %l0 = 00000000ff05a404
	lduwa	[%i4+%g0]0x88,%l0	! %l0 = 00000000c89d12ff
!	Mem[00000000300c1410] = ff01a2d5ffffb88a, %l0 = 00000000c89d12ff
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = ff01a2d5ffffb88a
!	Mem[0000000030141408] = 7059603e, %l4 = 00000000ff05a404
	ldsba	[%i5+%o4]0x89,%l4	! %l4 = 000000000000003e
!	Mem[0000000021800080] = 05ad32fb, %l1 = 000000000000004a
	ldsba	[%o3+0x080]%asi,%l1	! %l1 = 0000000000000005
!	Mem[0000000010141410] = 07570113b6b00000, %l2 = 00000000ff129dc8
	ldxa	[%i5+0x010]%asi,%l2	! %l2 = 07570113b6b00000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = d5a201ff, %l2 = 07570113b6b00000
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 00000000d5a201ff

p0_label_52:
!	%l2 = 00000000d5a201ff, Mem[0000000010101414] = ff2caf12, %asi = 80
	stwa	%l2,[%i4+0x014]%asi	! Mem[0000000010101414] = d5a201ff
!	%f16 = 473e9969 f1ecc9ff 3981bf37 bc000000
!	%f20 = 5e6606fd 131e9dc8 4770ac80 ee7d8c6c
!	%f24 = 0000b0b6 13015707 1c51514c 2638245c
!	%f28 = 63d79011 1e58394a ff817381 2e2c0000
	stda	%f16,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	Mem[00000000300c1400] = d7630000, %l5 = 00000000ff81bf37
	swapa	[%i3+%g0]0x81,%l5	! %l5 = 00000000d7630000
!	Mem[0000000010081420] = 7f52c8b5, %l3 = 1e58394a, %l3 = 1e58394a
	add	%i2,0x20,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 000000007f52c8b5
!	Mem[0000000010181400] = ffd0fff5, %l3 = 000000007f52c8b5
	swap	[%i6+%g0],%l3		! %l3 = 00000000ffd0fff5
!	%f16 = 473e9969 f1ecc9ff 3981bf37 bc000000
!	%f20 = 5e6606fd 131e9dc8 4770ac80 ee7d8c6c
!	%f24 = 0000b0b6 13015707 1c51514c 2638245c
!	%f28 = 63d79011 1e58394a ff817381 2e2c0000
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	Mem[00000000218001c0] = ffff4fd1, %l3 = 00000000ffd0fff5
	ldstub	[%o3+0x1c0],%l3		! %l3 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (13)
!	Mem[00000000100c1435] = 1e58394a, %l4 = 000000000000003e
	ldstuba	[%i3+0x035]%asi,%l4	! %l4 = 00000058000000ff
!	Mem[0000000010081410] = 50000000, %l2 = 00000000d5a201ff
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 5e6606fd131e9dc8, %l0 = ff01a2d5ffffb88a
	ldxa	[%i2+%o5]0x81,%l0	! %l0 = 5e6606fd131e9dc8

p0_label_53:
!	Mem[00000000218000c0] = 33f7bf7c, %l6 = 0000000000000000
	ldub	[%o3+0x0c0],%l6		! %l6 = 0000000000000033
!	%f10 = 9cdef36b 332e64f0, %l6 = 0000000000000033
!	Mem[00000000300c1430] = 12fffb3abc85e660
	add	%i3,0x030,%g1
	stda	%f10,[%g1+%l6]ASI_PST32_S ! Mem[00000000300c1430] = 9cdef36b332e64f0
!	Mem[0000000010001400] = ff05a404 130157ff, %l6 = 00000033, %l7 = 000000b9
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000ff05a404 00000000130157ff
!	Mem[0000000030101400] = ffffffff, %l3 = 00000000000000ff
	lduwa	[%i4+%g0]0x81,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030081410] = fd06665e, %f15 = 131ebcf4
	lda	[%i2+%o5]0x89,%f15	! %f15 = fd06665e
!	Mem[0000000010141410] = 13015707, %l1 = 0000000000000005
	ldsha	[%i5+%o5]0x88,%l1	! %l1 = 0000000000005707
!	Mem[0000000010041408] = ffffffff, %l2 = 0000000000000000
	ldsba	[%i1+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001410] = f1ecc94c, %l0 = 5e6606fd131e9dc8
	lduba	[%i0+%o5]0x88,%l0	! %l0 = 000000000000004c
!	Mem[0000000010181400] = 7f52c8b5, %l2 = ffffffffffffffff
	ldub	[%i6+%g0],%l2		! %l2 = 000000000000007f
!	Starting 10 instruction Store Burst
!	Mem[0000000010081418] = ee90251896c8ddf2, %l2 = 000000000000007f, %l4 = 0000000000000058
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l2,%l4	! %l4 = ee90251896c8ddf2

p0_label_54:
!	%f20 = 5e6606fd 131e9dc8, Mem[0000000010081410] = ff000050 07000000
	stda	%f20,[%i2+%o5]0x80	! Mem[0000000010081410] = 5e6606fd 131e9dc8
!	%f12 = abb4ff83, Mem[00000000100c1400] = 473e9969
	sta	%f12,[%i3+%g0]0x80	! Mem[00000000100c1400] = abb4ff83
!	Mem[0000000010001414] = 00000000, %l4 = ee90251896c8ddf2
	ldstuba	[%i0+0x014]%asi,%l4	! %l4 = 00000000000000ff
!	%f26 = 1c51514c 2638245c, Mem[0000000010101420] = 7f52c8b5 600799bb
	stda	%f26,[%i4+0x020]%asi	! Mem[0000000010101420] = 1c51514c 2638245c
!	Mem[0000000020800041] = 00509e9b, %l7 = 00000000130157ff
	ldstub	[%o1+0x041],%l7		! %l7 = 00000050000000ff
!	%l6 = 00000000ff05a404, Mem[00000000100c1400] = abb4ff83f1ecc9ff
	stxa	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000ff05a404
!	%f6  = 7a23e254, Mem[00000000100c1410] = fd06665e
	sta	%f6 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 7a23e254
!	%l5 = 00000000d7630000, Mem[0000000030001408] = ff0000ff
	stha	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff
!	Mem[0000000010041400] = 13015707, %l4 = 0000000000000000
	ldstub	[%i1+%g0],%l4		! %l4 = 00000013000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081424] = 600799bb, %l1 = 0000000000005707
	ldsh	[%i2+0x024],%l1		! %l1 = 0000000000006007

p0_label_55:
!	Mem[0000000010141400] = 12af2cff 00000000, %l2 = 0000007f, %l3 = ffffffff
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 0000000012af2cff 0000000000000000
!	Mem[0000000010001404] = 130157ff, %l7 = 0000000000000050
	lduwa	[%i0+0x004]%asi,%l7	! %l7 = 00000000130157ff
!	Mem[0000000010001410] = 4cc9ecf1, %l7 = 00000000130157ff
	lduha	[%i0+%o5]0x80,%l7	! %l7 = 0000000000004cc9
!	Mem[0000000010101400] = ff129dc8, %l6 = 00000000ff05a404
	ldswa	[%i4+%g0]0x80,%l6	! %l6 = ffffffffff129dc8
!	Mem[00000000211c0000] = c93a0b46, %l1 = 0000000000006007
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000c93a
!	Mem[0000000010141410] = 07570113 b6b00000, %l0 = 0000004c, %l1 = 0000c93a
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 0000000007570113 00000000b6b00000
!	Mem[0000000010001400] = ff05a404, %l4 = 0000000000000013
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = ffffffffff05a404
!	Mem[0000000010181420] = 7f52c8b5, %l2 = 0000000012af2cff
	lduh	[%i6+0x020],%l2		! %l2 = 0000000000007f52
!	Mem[00000000100c1400] = 00000000, %l5 = 00000000d7630000
	lduha	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000004cc9, Mem[00000000100c1426] = 13015707, %asi = 80
	stha	%l7,[%i3+0x026]%asi	! Mem[00000000100c1424] = 13014cc9

p0_label_56:
!	%l2 = 0000000000007f52, Mem[00000000100c1400] = 00000000
	stha	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 7f520000
!	Mem[0000000010141424] = a6823d4c, %l6 = ff129dc8, %l2 = 00007f52
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 00000000a6823d4c
!	Mem[000000001014141c] = 80ac7047, %l4 = ffffffffff05a404, %asi = 80
	swapa	[%i5+0x01c]%asi,%l4	! %l4 = 0000000080ac7047
!	Mem[00000000300c1400] = ff81bf37, %l0 = 0000000007570113
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff81bf37
!	Mem[00000000300c1400] = 07570113, %l6 = ffffffffff129dc8
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 00000007000000ff
!	Mem[0000000010181408] = 2e2caf12, %l4 = 0000000080ac7047
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 000000002e2caf12
!	Mem[0000000030141400] = 2b3b5811, %l1 = 00000000b6b00000
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 000000002b3b5811
!	%f8  = 7f52c8b5 600799bb, %l7 = 0000000000004cc9
!	Mem[0000000030181420] = 1fbbbcee72e0e3dc
	add	%i6,0x020,%g1
	stda	%f8,[%g1+%l7]ASI_PST8_S ! Mem[0000000030181420] = 7f52bcee60e0e3bb
!	Mem[00000000100c142c] = 2638245c, %l2 = 00000000a6823d4c, %asi = 80
	swapa	[%i3+0x02c]%asi,%l2	! %l2 = 000000002638245c
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = fb3ca293b5c8527f, %l1 = 000000002b3b5811
	ldxa	[%i6+%g0]0x88,%l1	! %l1 = fb3ca293b5c8527f

p0_label_57:
!	Mem[0000000010001410] = f1ecc94c, %f6  = 7a23e254
	lda	[%i0+%o5]0x88,%f6 	! %f6 = f1ecc94c
!	Mem[0000000030101410] = 63d79011 1e58394a, %l6 = 00000007, %l7 = 00004cc9
	ldda	[%i4+%o5]0x81,%l6	! %l6 = 0000000063d79011 000000001e58394a
!	Mem[0000000030041408] = c89d1e1369993e60, %f20 = 5e6606fd 131e9dc8
	ldda	[%i1+%o4]0x81,%f20	! %f20 = c89d1e13 69993e60
!	%f30 = ff817381 2e2c0000, %l3 = 0000000000000000
!	Mem[0000000010001410] = 4cc9ecf1ff000000
	add	%i0,0x010,%g1
	stda	%f30,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010001410] = 4cc9ecf1ff000000
!	Mem[0000000010081410] = 5e6606fd, %f1  = 93a23cfb
	lda	[%i2+%o5]0x80,%f1 	! %f1 = 5e6606fd
!	Mem[0000000010141408] = b9000000, %l4 = 000000002e2caf12
	ldsh	[%i5+%o4],%l4		! %l4 = ffffffffffffb900
!	Mem[00000000100c1414] = 131e9dc8, %l0 = 00000000ff81bf37
	lduwa	[%i3+0x014]%asi,%l0	! %l0 = 00000000131e9dc8
!	Mem[0000000010041410] = 5cb8ffffd5a201ff, %f22 = 4770ac80 ee7d8c6c
	ldda	[%i1+%o5]0x88,%f22	! %f22 = 5cb8ffff d5a201ff
!	Mem[0000000030101410] = 63d79011, %l6 = 0000000063d79011
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = 0000000063d79011
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = 0000367d, %l5 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff

p0_label_58:
!	%f30 = ff817381 2e2c0000, %l3 = 0000000000000000
!	Mem[00000000100c1410] = 54e2237a131e9dc8
	add	%i3,0x010,%g1
	stda	%f30,[%g1+%l3]ASI_PST16_PL ! Mem[00000000100c1410] = 54e2237a131e9dc8
!	%l5 = 0000000000000000, Mem[0000000030101400] = ffffffff00000000
	stxa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	Mem[0000000030001408] = 000000ff, %l0 = 00000000131e9dc8
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%f14 = 4cd3adf1 fd06665e, Mem[0000000010041400] = ff015707 0000004c
	stda	%f14,[%i1+%g0]0x80	! Mem[0000000010041400] = 4cd3adf1 fd06665e
!	%l7 = 000000001e58394a, Mem[0000000030141408] = 7059603e
	stwa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 1e58394a
!	Mem[00000000100c1400] = 7f520000, %l4 = ffffffffffffb900
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 0000007f000000ff
!	%l2 = 2638245c, %l3 = 00000000, Mem[0000000010141408] = b9000000 131e9dc8
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 2638245c 00000000
!	Mem[0000000010181400] = 7f52c8b5, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 0000007f000000ff
!	%l2 = 000000002638245c, Mem[0000000030041400] = ff570113
	stba	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 5c570113
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 131e9dc8, %l1 = fb3ca293b5c8527f
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = 00000000131e9dc8

p0_label_59:
!	Mem[0000000010101410] = 00000000, %l6 = 0000000063d79011
	ldsha	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = fe000000, %l0 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l0	! %l0 = 00000000fe000000
!	Mem[0000000030101408] = c89d1e13 939c958c, %l0 = fe000000, %l1 = 131e9dc8
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 00000000c89d1e13 00000000939c958c
!	Mem[0000000030041410] = ff000000, %l7 = 000000001e58394a
	ldswa	[%i1+%o5]0x81,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010181400] = ff52c8b5, %l1 = 00000000939c958c
	lduwa	[%i6+%g0]0x80,%l1	! %l1 = 00000000ff52c8b5
!	Mem[0000000021800080] = 05ad32fb, %l5 = 000000000000007f
	ldub	[%o3+0x081],%l5		! %l5 = 00000000000000ad
!	Mem[0000000010141410] = 0000b0b613015707, %l5 = 00000000000000ad
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = 0000b0b613015707
!	Mem[0000000010181400] = ff52c8b5, %l3 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l3	! %l3 = ffffffffff52c8b5
!	Mem[0000000010141410] = 07570113, %l3 = ffffffffff52c8b5
	lduwa	[%i5+%o5]0x80,%l3	! %l3 = 0000000007570113
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ff52c8b5, Mem[00000000100c1410] = 54e2237a
	stha	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = c8b5237a

p0_label_60:
!	%l6 = 0000000000000000, Mem[0000000010141410] = 07570113
	stba	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00570113
!	Mem[0000000010181424] = 600799bb, %l4 = 000000000000007f, %asi = 80
	swapa	[%i6+0x024]%asi,%l4	! %l4 = 00000000600799bb
!	%l4 = 00000000600799bb, Mem[0000000010181414] = a736f40c
	sth	%l4,[%i6+0x014]		! Mem[0000000010181414] = 99bbf40c
!	%f14 = 4cd3adf1, Mem[0000000010141418] = 6c8c7dee
	st	%f14,[%i5+0x018]	! Mem[0000000010141418] = 4cd3adf1
!	%l4 = 00000000600799bb, Mem[0000000030181400] = 5c243826
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 5c2438bb
!	%l4 = 00000000600799bb, Mem[0000000010181400] = ff52c8b593a23cfb
	stxa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000600799bb
!	%l2 = 000000002638245c, Mem[0000000010001415] = ff000000
	stb	%l2,[%i0+0x015]		! Mem[0000000010001414] = ff5c0000
!	%f8  = 7f52c8b5 600799bb, Mem[0000000030041410] = 000000ff 3d880000
	stda	%f8 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 7f52c8b5 600799bb
!	Mem[0000000030181408] = 38b470ff, %l5 = 0000b0b613015707
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff57011304a405ff, %l7 = ffffffffff000000
	ldxa	[%i0+%g0]0x88,%l7	! %l7 = ff57011304a405ff

p0_label_61:
!	Mem[0000000010141418] = 4cd3adf1, %l1 = 00000000ff52c8b5
	lduba	[%i5+0x01b]%asi,%l1	! %l1 = 00000000000000f1
!	Mem[0000000030041400] = 1301575c, %l0 = 00000000c89d1e13
	ldswa	[%i1+%g0]0x89,%l0	! %l0 = 000000001301575c
!	Mem[0000000020800040] = 00ff9e9b, %l0 = 000000001301575c
	ldsh	[%o1+0x040],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010041428] = 313b9c29 389824ba, %l2 = 2638245c, %l3 = 07570113
	ldd	[%i1+0x028],%l2		! %l2 = 00000000313b9c29 00000000389824ba
!	Mem[0000000010141410] = 00570113 b6b00000, %l2 = 313b9c29, %l3 = 389824ba
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 0000000000570113 00000000b6b00000
!	Mem[0000000030041400] = 5c570113, %f27 = 2638245c
	lda	[%i1+%g0]0x81,%f27	! %f27 = 5c570113
!	Mem[00000000300c1410] = 0000b0b6, %l5 = 00000000000000ff
	ldsba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = ff000000000000b9, %l2 = 0000000000570113
	ldxa	[%i0+%g0]0x81,%l2	! %l2 = ff000000000000b9
!	Mem[0000000030181410] = 131e9dc8fd7d3778, %f28 = 63d79011 1e58394a
	ldda	[%i6+%o5]0x81,%f28	! %f28 = 131e9dc8 fd7d3778
!	Starting 10 instruction Store Burst
!	%f18 = 3981bf37 bc000000, %l3 = 00000000b6b00000
!	Mem[0000000010001400] = ff05a404130157ff
	stda	%f18,[%i0+%l3]ASI_PST8_P ! Mem[0000000010001400] = ff05a404130157ff

p0_label_62:
!	%f16 = 473e9969, Mem[0000000010001410] = f1ecc94c
	sta	%f16,[%i0+%o5]0x88	! Mem[0000000010001410] = 473e9969
!	%f6  = f1ecc94c c2e9196a, Mem[0000000030141410] = ff81bf37 bc000000
	stda	%f6 ,[%i5+%o5]0x81	! Mem[0000000030141410] = f1ecc94c c2e9196a
!	%l6 = 00000000, %l7 = 04a405ff, Mem[00000000300c1408] = 817381ff 00002c2e
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 04a405ff
!	Mem[0000000010001428] = 54e6acd2, %l6 = 0000000000000000, %asi = 80
	swapa	[%i0+0x028]%asi,%l6	! %l6 = 0000000054e6acd2
!	%f10 = 9cdef36b 332e64f0, Mem[0000000010081430] = 835097d4 81738105
	std	%f10,[%i2+0x030]	! Mem[0000000010081430] = 9cdef36b 332e64f0
!	%l1 = 00000000000000f1, Mem[0000000010141400] = 00000000ff2caf12
	stxa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000000000f1
!	Mem[0000000030181400] = 5c2438bb, %f14 = 4cd3adf1
	lda	[%i6+%g0]0x89,%f14	! %f14 = 5c2438bb
!	%f24 = 0000b0b6 13015707, Mem[0000000030081410] = 5e6606fd 131e9dc8
	stda	%f24,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000b0b6 13015707
!	%l2 = ff000000000000b9, Mem[0000000010041408] = ffffffff
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000b9
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 6a3ae6e1, %l3 = 00000000b6b00000
	lduh	[%o3+0x140],%l3		! %l3 = 0000000000006a3a

p0_label_63:
!	Mem[0000000010101408] = 39000000, %f5  = a736f40c
	lda	[%i4+%o4]0x80,%f5 	! %f5 = 39000000
!	Mem[0000000030041408] = c89d1e13, %l4 = 00000000600799bb
	lduha	[%i1+%o4]0x81,%l4	! %l4 = 000000000000c89d
!	Mem[0000000010081400] = 5c243826, %f22 = 5cb8ffff
	lda	[%i2+%g0]0x88,%f22	! %f22 = 5c243826
!	Mem[0000000030141400] = 0000b0b6, %f28 = 131e9dc8
	lda	[%i5+%g0]0x81,%f28	! %f28 = 0000b0b6
!	Mem[00000000100c1410] = c8b5237a, %l0 = 00000000000000ff
	lduwa	[%i3+%o5]0x80,%l0	! %l0 = 00000000c8b5237a
!	Mem[0000000010181434] = af54fcd3, %l3 = 0000000000006a3a
	ldswa	[%i6+0x034]%asi,%l3	! %l3 = ffffffffaf54fcd3
!	Mem[0000000010101400] = c89d12ff, %l4 = 000000000000c89d
	lduwa	[%i4+%g0]0x88,%l4	! %l4 = 00000000c89d12ff
!	Mem[0000000010101410] = ff01a2d500000000, %l1 = 00000000000000f1
	ldxa	[%i4+%o5]0x88,%l1	! %l1 = ff01a2d500000000
!	Mem[0000000030101410] = 63d79011, %l1 = ff01a2d500000000
	ldsha	[%i4+%o5]0x81,%l1	! %l1 = 00000000000063d7
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 00000000, %l6 = 0000000054e6acd2
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_64:
!	%l3 = ffffffffaf54fcd3, Mem[0000000030041400] = 1301575c
	stwa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = af54fcd3
!	Mem[0000000010141408] = 5c243826, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 00000026000000ff
!	Mem[0000000010141401] = f1000000, %l6 = 0000000000000026
	ldstuba	[%i5+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l0 = 00000000c8b5237a
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l1 = 00000000000063d7, Mem[0000000010181400] = 7a23b5c8
	stha	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 63d7b5c8
!	%l3 = ffffffffaf54fcd3, Mem[0000000030181400] = f6ae2e345c2438bb
	stxa	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffffaf54fcd3
!	Mem[0000000010041432] = 9a51c6b0, %l0 = 0000000000000000
	ldstub	[%i1+0x032],%l0		! %l0 = 000000c6000000ff
!	Mem[0000000030001410] = 47d1011e, %l3 = ffffffffaf54fcd3
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 0000001e000000ff
!	%l2 = ff000000000000b9, Mem[0000000010001428] = 000000002b3b5811, %asi = 80
	stxa	%l2,[%i0+0x028]%asi	! Mem[0000000010001428] = ff000000000000b9
!	Starting 10 instruction Load Burst
!	Mem[0000000010181404] = 600799bb, %l7 = ff57011304a405ff
	lduw	[%i6+0x004],%l7		! %l7 = 00000000600799bb

p0_label_65:
!	Mem[0000000010041414] = ffffb85c, %f22 = 5c243826
	ld	[%i1+0x014],%f22	! %f22 = ffffb85c
!	Mem[0000000030141400] = 00000000 b6b00000, %l6 = 00000000, %l7 = 600799bb
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 00000000b6b00000 0000000000000000
!	Mem[0000000030181410] = 131e9dc8, %f23 = d5a201ff
	lda	[%i6+%o5]0x81,%f23	! %f23 = 131e9dc8
!	Mem[0000000010141400] = f1ff0000, %l7 = 0000000000000000
	ldsh	[%i5+%g0],%l7		! %l7 = fffffffffffff1ff
!	Mem[0000000010101400] = ff129dc8, %l6 = 00000000b6b00000
	lduwa	[%i4+%g0]0x80,%l6	! %l6 = 00000000ff129dc8
!	Mem[0000000010041408] = 000000b9, %l3 = 000000000000001e
	ldsha	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = b6b00000, %l5 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 131e9dc8, %l3 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l3	! %l3 = 00000000131e9dc8
!	Mem[000000001014142c] = 4c51511c, %f9  = 600799bb
	ld	[%i5+0x02c],%f9 	! %f9 = 4c51511c
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030181400] = af54fcd3
	stha	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = af540000

p0_label_66:
!	%l5 = 0000000000000000, Mem[0000000030101400] = 0000000000000000
	stxa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	%f22 = ffffb85c 131e9dc8, Mem[0000000030001400] = 000000ff b9000000
	stda	%f22,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffb85c 131e9dc8
!	Mem[0000000010041409] = 000000b9, %l6 = 00000000ff129dc8
	ldstuba	[%i1+0x009]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = 5e6606fd, %l7 = fffffffffffff1ff
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 000000005e6606fd
!	%f31 = 2e2c0000, Mem[000000001008142c] = 2e2cff12
	sta	%f31,[%i2+0x02c]%asi	! Mem[000000001008142c] = 2e2c0000
!	Mem[0000000010001408] = 54e6acd2, %l7 = 000000005e6606fd
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 00000054000000ff
!	%f14 = 5c2438bb fd06665e, Mem[0000000030101410] = 1190d763 4a39581e
	stda	%f14,[%i4+%o5]0x89	! Mem[0000000030101410] = 5c2438bb fd06665e
!	%l6 = 0000000000000000, Mem[0000000030001400] = 131e9dc8
	stha	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 131e0000
!	%l3 = 00000000131e9dc8, Mem[0000000010181410] = fe000000
	stba	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = fe0000c8
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = 63d790111eff394a, %l0 = 00000000000000c6
	ldx	[%i3+0x030],%l0		! %l0 = 63d790111eff394a

p0_label_67:
!	Mem[0000000010181410] = c80000fe, %l3 = 00000000131e9dc8
	lduha	[%i6+%o5]0x80,%l3	! %l3 = 000000000000c800
!	Mem[0000000010001410] = 00005cff473e9969, %l6 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l6	! %l6 = 00005cff473e9969
!	Mem[0000000030181400] = af540000, %l3 = 000000000000c800
	ldswa	[%i6+%g0]0x89,%l3	! %l3 = ffffffffaf540000
!	%l7 = 0000000000000054, %l6 = 00005cff473e9969, %y  = 00000000
	smul	%l7,%l6,%l1		! %l1 = 00000017608a5674, %y = 00000017
!	Mem[0000000010101408] = 00000039, %l1 = 00000017608a5674
	lduha	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000039
!	Mem[0000000010001400] = ff05a404, %f15 = fd06665e
	lda	[%i0+%g0]0x80,%f15	! %f15 = ff05a404
!	Mem[0000000010181410] = 0cf4bb99fe0000c8, %l3 = ffffffffaf540000
	ldxa	[%i6+%o5]0x88,%l3	! %l3 = 0cf4bb99fe0000c8
!	Mem[0000000030001410] = ff01d147, %l0 = 63d790111eff394a
	lduha	[%i0+%o5]0x81,%l0	! %l0 = 000000000000ff01
!	Mem[000000001004141c] = 7a4a8882, %l0 = 000000000000ff01
	ldswa	[%i1+0x01c]%asi,%l0	! %l0 = 000000007a4a8882
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = ff38245c, %l0 = 000000007a4a8882
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 00000000ff38245c

p0_label_68:
!	%l6 = 00005cff473e9969, Mem[0000000010101400] = c89d12ff
	stwa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 473e9969
!	Mem[0000000010041410] = ff01a2d5, %l4 = 00000000c89d12ff
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ff01a2d5
!	%f20 = c89d1e13 69993e60, Mem[0000000010041400] = 4cd3adf1 fd06665e
	std	%f20,[%i1+%g0]	! Mem[0000000010041400] = c89d1e13 69993e60
!	Mem[0000000030101408] = 131e9dc8, %l0 = 00000000ff38245c
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 000000c8000000ff
!	Mem[00000000100c1408] = 3981bf37, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 000000003981bf37
!	Mem[0000000010141400] = f1ff000000000000, %l0 = 00000000000000c8, %l0 = 00000000000000c8
	casxa	[%i5]0x80,%l0,%l0	! %l0 = f1ff000000000000
!	Mem[0000000030041408] = c89d1e13, %l6 = 00005cff473e9969
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 00000000c89d1e13
!	Mem[0000000010001410] = 69993e47, %l5 = 000000003981bf37
	ldsh	[%i0+0x012],%l5		! %l5 = 0000000000003e47
!	%l6 = c89d1e13, %l7 = 00000054, Mem[00000000100c1430] = 63d79011 1eff394a
	std	%l6,[%i3+0x030]		! Mem[00000000100c1430] = c89d1e13 00000054
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 04a405ff, %l7 = 0000000000000054
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 0000000004a405ff

p0_label_69:
!	Mem[0000000010041408] = e5850284b900ff00, %f26 = 1c51514c 5c570113
	ldda	[%i1+%o4]0x88,%f26	! %f26 = e5850284 b900ff00
!	Mem[00000000300c1410] = b6b00000, %l7 = 0000000004a405ff
	lduha	[%i3+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041430] = 9a51ffb056848fc0, %f22 = ffffb85c 131e9dc8
	ldd	[%i1+0x030],%f22	! %f22 = 9a51ffb0 56848fc0
!	Mem[0000000030101408] = 131e9dff, %l7 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l7	! %l7 = 00000000131e9dff
!	Mem[0000000030141410] = f1ecc94c, %l6 = 00000000c89d1e13
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 000000000000f1ec
!	Mem[00000000300c1400] = 130157ff, %l2 = ff000000000000b9
	ldsha	[%i3+%g0]0x89,%l2	! %l2 = 00000000000057ff
!	Mem[0000000030001400] = 131e0000, %l5 = 0000000000003e47
	ldsba	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = c8b5237a, %l0 = f1ff000000000000
	lduba	[%i3+%o5]0x80,%l0	! %l0 = 00000000000000c8
!	Mem[0000000010101410] = ff01a2d500000000, %f16 = 473e9969 f1ecc9ff
	ldda	[%i4+%o5]0x88,%f16	! %f16 = ff01a2d5 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00000000, %l4 = 00000000ff01a2d5
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_70:
!	%l2 = 00000000000057ff, Mem[0000000030181400] = af540000
	stha	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = af5457ff
!	Mem[0000000010081410] = fffff1ff131e9dc8, %l6 = 000000000000f1ec, %l5 = 0000000000000000
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l6,%l5	! %l5 = fffff1ff131e9dc8
!	%l6 = 000000000000f1ec, Mem[0000000010001408] = ffe6acd2
	stha	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = f1ecacd2
!	Mem[0000000010181424] = 0000007f, %l7 = 00000000131e9dff
	swap	[%i6+0x024],%l7		! %l7 = 000000000000007f
!	%f14 = 5c2438bb ff05a404, Mem[0000000010141430] = 5a2c562e bd83059c
	std	%f14,[%i5+0x030]	! Mem[0000000010141430] = 5c2438bb ff05a404
!	%l4 = 0000000000000000, Mem[000000001008141c] = 96c8ddf2, %asi = 80
	stha	%l4,[%i2+0x01c]%asi	! Mem[000000001008141c] = 0000ddf2
!	%l3 = 0cf4bb99fe0000c8, Mem[0000000030141410] = 6a19e9c24cc9ecf1
	stxa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 0cf4bb99fe0000c8
!	%l6 = 0000f1ec, %l7 = 0000007f, Mem[0000000010181410] = c80000fe 99bbf40c
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000f1ec 0000007f
!	%l0 = 00000000000000c8, Mem[0000000010081410] = fffff1ff
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 00c8f1ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 6e000000 00000039, %l6 = 0000f1ec, %l7 = 0000007f
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000039 000000006e000000

p0_label_71:
!	Mem[00000000211c0000] = c93a0b46, %l7 = 000000006e000000
	ldsba	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffc9
!	Mem[0000000030141410] = c80000fe, %l3 = 0cf4bb99fe0000c8
	ldswa	[%i5+%o5]0x81,%l3	! %l3 = ffffffffc80000fe
!	Mem[0000000030001408] = ff0000ff, %f27 = b900ff00
	lda	[%i0+%o4]0x89,%f27	! %f27 = ff0000ff
!	Mem[0000000030141400] = 0000b0b6, %l0 = 00000000000000c8
	ldsha	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 7f000000ecf10000, %f22 = 9a51ffb0 56848fc0
	ldda	[%i6+%o5]0x88,%f22	! %f22 = 7f000000 ecf10000
!	Mem[0000000020800040] = 00ff9e9b, %l3 = ffffffffc80000fe
	ldub	[%o1+0x041],%l3		! %l3 = 00000000000000ff
!	Mem[0000000020800040] = 00ff9e9b, %l5 = fffff1ff131e9dc8
	ldsha	[%o1+0x040]%asi,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010041400] = c89d1e13 69993e60 00ff00b9 840285e5
!	Mem[0000000010041410] = c89d12ff ffffb85c 38a608c5 7a4a8882
!	Mem[0000000010041420] = d2533948 5ae85f11 313b9c29 389824ba
!	Mem[0000000010041430] = 9a51ffb0 56848fc0 260726bb 84b1d35a
	ldda	[%i1]ASI_BLK_AIUP,%f16	! Block Load from 0000000010041400
!	Mem[0000000010181410] = 0000f1ec, %l4 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f7  = c2e9196a, Mem[0000000010101430] = 835097d4
	st	%f7 ,[%i4+0x030]	! Mem[0000000010101430] = c2e9196a

p0_label_72:
!	%f4  = 000000fe 39000000, %l6 = 0000000000000039
!	Mem[0000000030181418] = 5ea0dce974bb756d
	add	%i6,0x018,%g1
	stda	%f4,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030181418] = 0000dce974bb0000
!	%l2 = 00000000000057ff, Mem[0000000030101408] = 131e9dff
	stha	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 131e57ff
!	%l2 = 00000000000057ff, Mem[0000000010001400] = 04a405ff
	stha	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 04a457ff
!	Mem[0000000030081400] = 473e9969, %l6 = 0000000000000039
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000473e9969
!	%l7 = ffffffffffffffc9, Mem[00000000100c1410] = 7a23b5c8
	stwa	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffffc9
!	Mem[0000000030001410] = ff01d147, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000030081408] = 000000bc37bf8139
	stxa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000ff
!	%l2 = 00000000000057ff, Mem[0000000030181410] = c89d1e13
	stba	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = c89d1eff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[00000000100c1410] = ffffffc9 c89d1e13
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 69993e47ff5c0000, %l4 = 00000000000000ff
	ldxa	[%i0+%o5]0x80,%l4	! %l4 = 69993e47ff5c0000

p0_label_73:
!	Mem[0000000010181410] = 0000f1ec, %l6 = 00000000473e9969
	lduha	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 80ac70478efe15f8, %f12 = abb4ff83 af54fcd3
	ldd	[%i6+%o4],%f12		! %f12 = 80ac7047 8efe15f8
!	Mem[0000000030081400] = 00000039, %l7 = ffffffffffffffc9
	lduba	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = fd06665e, %l3 = 00000000000000ff
	ldsba	[%i4+%o5]0x89,%l3	! %l3 = 000000000000005e
!	Mem[0000000030181400] = ffffffffaf5457ff, %f6  = f1ecc94c c2e9196a
	ldda	[%i6+%g0]0x89,%f6 	! %f6  = ffffffff af5457ff
!	Mem[0000000030181410] = c89d1eff, %l2 = 00000000000057ff
	ldsha	[%i6+%o5]0x89,%l2	! %l2 = 0000000000001eff
!	Mem[0000000010181408] = 4770ac80, %f1  = 5e6606fd
	lda	[%i6+%o4]0x88,%f1 	! %f1 = 4770ac80
!	Mem[00000000211c0000] = c93a0b46, %l6 = 0000000000000000
	ldsb	[%o2+0x001],%l6		! %l6 = 000000000000003a
!	Mem[0000000020800040] = 00ff9e9b, %l3 = 000000000000005e
	lduh	[%o1+0x040],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = b6b00000, %l0 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000ff

p0_label_74:
!	%l3 = 00000000000000ff, Mem[0000000010001410] = 69993e47ff5c0000
	stxa	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000000000ff
!	Mem[0000000010101400] = 473e9969, %l4 = 69993e47ff5c0000
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 00000000473e9969
!	%f10 = 9cdef36b 332e64f0, Mem[0000000010101438] = 12a5bcbf 4ceae022
	std	%f10,[%i4+0x038]	! Mem[0000000010101438] = 9cdef36b 332e64f0
!	%l7 = 0000000000000000, Mem[00000000100c1408] = 000000bc00000000
	stxa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000000
!	%f11 = 332e64f0, Mem[000000001010142c] = 2e2caf12
	st	%f11,[%i4+0x02c]	! Mem[000000001010142c] = 332e64f0
!	%l6 = 000000000000003a, Mem[00000000100c1410] = ff000000
	stwa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000003a
!	%l5 = 00000000000000ff, Mem[000000001010141e] = ffc8ddf2
	sth	%l5,[%i4+0x01e]		! Mem[000000001010141c] = ffc800ff
!	Mem[00000000300c1400] = ff570113, %l5 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l5	! %l5 = 00000000ff570113
!	%f4  = 000000fe 39000000, Mem[0000000030181408] = ff70b438 25e48611
	stda	%f4 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000fe 39000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0000b0b6 00000000 4a39581e 7430f9ad
!	Mem[0000000030141410] = c80000fe 99bbf40c 65a90401 66cc7bb1
!	Mem[0000000030141420] = be3d0f8e b4dd3e42 075a8510 9ca25231
!	Mem[0000000030141430] = 4618ccbe 8d0eaead e83973c9 99ec69ae
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400

p0_label_75:
!	Mem[00000000100c1424] = 13014cc9, %l5 = 00000000ff570113
	lduh	[%i3+0x026],%l5		! %l5 = 0000000000004cc9
!	%f0  = ffd0fff5 4770ac80, %f2  = 2e2caf12
	fdtoi	%f0 ,%f2 		! %f2  = 80000000
!	Mem[00000000218000c0] = 33f7bf7c, %l2 = 0000000000001eff
	ldsb	[%o3+0x0c0],%l2		! %l2 = 0000000000000033
!	Mem[0000000010141410] = 0000b0b6 13015700, %l4 = 473e9969, %l5 = 00004cc9
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 0000000013015700 000000000000b0b6
!	Mem[0000000010001408] = f1ecacd2, %l2 = 0000000000000033
	ldswa	[%i0+%o4]0x80,%l2	! %l2 = fffffffff1ecacd2
!	Mem[0000000030141400] = 00000000 b6b00000, %l2 = f1ecacd2, %l3 = 000000ff
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 00000000b6b00000 0000000000000000
!	Mem[0000000010181400] = c8b5d763, %f13 = 8efe15f8
	lda	[%i6+%g0]0x88,%f13	! %f13 = c8b5d763
!	Mem[0000000010101418] = ee902518 ffc800ff, %l2 = b6b00000, %l3 = 00000000
	ldda	[%i4+0x018]%asi,%l2	! %l2 = 00000000ee902518 00000000ffc800ff
!	Mem[0000000030181400] = af5457ff, %l3 = 00000000ffc800ff
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 000000ff, %l6 = 000000000000003a
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000ff

p0_label_76:
!	Mem[0000000010141414] = b6b00000, %l2 = ee902518, %l1 = 00000039
	add	%i5,0x14,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 00000000b6b00000
!	%l1 = 00000000b6b00000, Mem[0000000010001408] = f1ecacd2000000b9
	stxa	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000b6b00000
!	%f6  = ffffffff af5457ff, %l6 = 0000000000000000
!	Mem[0000000030001400] = 00001e135cb8ffff
	stda	%f6,[%i0+%l6]ASI_PST16_S ! Mem[0000000030001400] = 00001e135cb8ffff
	membar	#Sync			! Added by membar checker (15)
!	%f3  = 8efe15f8, Mem[0000000010041410] = ff129dc8
	sta	%f3 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 8efe15f8
!	%f13 = c8b5d763, Mem[0000000030001410] = 47d101ff
	sta	%f13,[%i0+%o5]0x89	! Mem[0000000030001410] = c8b5d763
!	Mem[0000000010141410] = 00570113, %l1 = 00000000b6b00000, %asi = 80
	swapa	[%i5+0x010]%asi,%l1	! %l1 = 0000000000570113
!	%f24 = be3d0f8e, Mem[0000000030041400] = af54fcd3
	sta	%f24,[%i1+%g0]0x89	! Mem[0000000030041400] = be3d0f8e
!	%f16 = 0000b0b6 00000000 4a39581e 7430f9ad
!	%f20 = c80000fe 99bbf40c 65a90401 66cc7bb1
!	%f24 = be3d0f8e b4dd3e42 075a8510 9ca25231
!	%f28 = 4618ccbe 8d0eaead e83973c9 99ec69ae
	stda	%f16,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	%l7 = 0000000000000000, Mem[0000000010141420] = c8587da8a6823d4c, %asi = 80
	stxa	%l7,[%i5+0x020]%asi	! Mem[0000000010141420] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 131e0000, %l7 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000

p0_label_77:
!	Mem[0000000010001408] = 00000000, %l2 = 00000000ee902518
	ldswa	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = 0000000000000000, %l3 = ffffffffffffffff
	ldxa	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = ff00b0b6, %l1 = 0000000000570113
	lduha	[%i3+%o5]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010181408] = 80ac7047, %f13 = c8b5d763
	lda	[%i6+%o4]0x80,%f13	! %f13 = 80ac7047
!	Mem[0000000030041408] = 473e9969, %l5 = 000000000000b0b6
	lduha	[%i1+%o4]0x81,%l5	! %l5 = 000000000000473e
!	Mem[00000000201c0000] = ff00367d, %l2 = 0000000000000000
	ldsh	[%o0+%g0],%l2		! %l2 = ffffffffffffff00
!	Mem[0000000030041400] = 8e0f3dbe04a4d147, %f0  = ffd0fff5 4770ac80
	ldda	[%i1+%g0]0x81,%f0 	! %f0  = 8e0f3dbe 04a4d147
!	Mem[0000000030181410] = ff1e9dc8, %l5 = 000000000000473e
	lduba	[%i6+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = 000052ff, %l0 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f10 = 9cdef36b 332e64f0, Mem[0000000010181410] = ecf10000 7f000000
	stda	%f10,[%i6+%o5]0x88	! Mem[0000000010181410] = 9cdef36b 332e64f0

p0_label_78:
!	Mem[0000000030181408] = 000000fe, %l5 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181408] = fe0000ff, %l4 = 0000000013015700
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000030101410] = fd06665e
	stha	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = fd0600ff
!	Mem[0000000021800040] = 1855a30e, %l4 = 00000000000000ff
	ldstuba	[%o3+0x040]%asi,%l4	! %l4 = 00000018000000ff
!	Mem[0000000010081408] = b9000000, %l4 = 0000000000000018
	swapa	[%i2+%o4]0x80,%l4	! %l4 = 00000000b9000000
!	%l2 = ffffffffffffff00, Mem[0000000030141410] = 0cf4bb99fe0000c8
	stxa	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffffffffff00
!	%l1 = 000000000000ff00, Mem[0000000030041400] = be3d0f8e
	stba	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = be3d0f00
!	Mem[0000000010181425] = 131e9dff, %l4 = 00000000b9000000
	ldstub	[%i6+0x025],%l4		! %l4 = 0000001e000000ff
!	Mem[0000000030081408] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff57a404, %l3 = 0000000000000000
	lduha	[%i0+0x002]%asi,%l3	! %l3 = 000000000000a404

p0_label_79:
!	Mem[00000000300c1410] = b6b000ff, %l7 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = 131e57ff, %l1 = 000000000000ff00
	lduba	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = 332e64f0, %l3 = 000000000000a404
	ldswa	[%i6+%o5]0x88,%l3	! %l3 = 00000000332e64f0
!	Mem[00000000300c1410] = ff00b0b6, %f8  = 7f52c8b5
	lda	[%i3+%o5]0x81,%f8 	! %f8 = ff00b0b6
!	Mem[0000000010101400] = ff5c0000, %l0 = 00000000000000ff
	ldsba	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000030141408] = 7430f9ad, %l6 = 00000000000000ff
	lduwa	[%i5+%o4]0x89,%l6	! %l6 = 000000007430f9ad
!	Mem[0000000020800040] = 00ff9e9b, %l3 = 00000000332e64f0
	ldsb	[%o1+0x041],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010001408] = 00000000, %l1 = 00000000000000ff
	lduha	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 80ac7047, %l6 = 000000007430f9ad
	ldsba	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffffff80
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[00000000201c0000] = ff00367d
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = ffff367d

p0_label_80:
!	Mem[00000000100c1410] = 0000003a, %l0 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 000000000000003a
!	%l3 = ffffffffffffffff, Mem[00000000100c1408] = 00000000
	stha	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffff0000
!	%l1 = 0000000000000000, Mem[0000000010001422] = 6ef06e6c
	sth	%l1,[%i0+0x022]		! Mem[0000000010001420] = 6ef00000
!	%f20 = c80000fe, Mem[0000000010101400] = 00005cff
	sta	%f20,[%i4+%g0]0x80	! Mem[0000000010101400] = c80000fe
!	%l4 = 000000000000001e, Mem[0000000010101430] = c2e9196a
	stw	%l4,[%i4+0x030]		! Mem[0000000010101430] = 0000001e
!	%l0 = 000000000000003a, Mem[0000000010101410] = 00000000d5a201ff, %asi = 80
	stxa	%l0,[%i4+0x010]%asi	! Mem[0000000010101410] = 000000000000003a
!	Mem[0000000010101400] = fe0000c8, %l4 = 000000000000001e
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 00000000fe0000c8
!	%l5 = 0000000000000000, Mem[0000000030001408] = ff0000ff
	stha	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = ff000000
!	Mem[0000000010041410] = f815fe8e, %l0 = 000000000000003a
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 000000f8000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = c89d1e13 18000000, %l2 = ffffff00, %l3 = ffffffff
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 0000000018000000 00000000c89d1e13

p0_label_81:
!	Mem[0000000010041408] = e5850284b900ff00, %f0  = 8e0f3dbe 04a4d147
	ldda	[%i1+%o4]0x88,%f0 	! %f0  = e5850284 b900ff00
!	Mem[0000000010041410] = ff15fe8e, %l2 = 0000000018000000
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffff15
!	Mem[0000000010081410] = c89d1e13 fff1c800, %l2 = ffffff15, %l3 = c89d1e13
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000fff1c800 00000000c89d1e13
!	Mem[0000000010141410] = b6b00000, %f13 = 80ac7047
	lda	[%i5+%o5]0x80,%f13	! %f13 = b6b00000
!	Mem[0000000010041400] = 131e9dc8, %l2 = 00000000fff1c800
	lduba	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000c8
!	Mem[0000000020800000] = ffff188e, %l1 = 0000000000000000
	ldsba	[%o1+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081400] = 2638245c342eaef6, %l4 = 00000000fe0000c8
	ldxa	[%i2+%g0]0x80,%l4	! %l4 = 2638245c342eaef6
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010101400] = 1e000000 1e58394a 39000000 0000006e
!	Mem[0000000010101410] = 00000000 0000003a ee902518 ffc800ff
!	Mem[0000000010101420] = 1c51514c 2638245c 945900dd 332e64f0
!	Mem[0000000010101430] = 0000001e ff12ff12 9cdef36b 332e64f0
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400
!	Mem[0000000010181414] = 6bf3de9c, %f31 = 99ec69ae
	ld	[%i6+0x014],%f31	! %f31 = 6bf3de9c
!	Starting 10 instruction Store Burst
!	%l0 = 000000f8, %l1 = ffffffff, Mem[0000000030141410] = ffffffff ffffff00
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000f8 ffffffff

p0_label_82:
!	%l0 = 00000000000000f8, Mem[0000000030141410] = f8000000
	stha	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = f80000f8
!	%l4 = 2638245c342eaef6, Mem[0000000030001400] = 00001e13
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 342eaef6
!	%f20 = c80000fe 99bbf40c, Mem[0000000030041408] = 473e9969 69993e60
	stda	%f20,[%i1+%o4]0x81	! Mem[0000000030041408] = c80000fe 99bbf40c
!	Mem[0000000010181400] = 63d7b5c8, %l1 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x80,%l1	! %l1 = 00000063000000ff
!	%l3 = 00000000c89d1e13, Mem[00000000201c0000] = ffff367d
	stb	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 13ff367d
!	%l3 = 00000000c89d1e13, Mem[00000000100c1408] = ffff0000
	stba	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 13ff0000
!	Mem[0000000030081410] = 0000b0b6, %l5 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 000000000000b0b6
!	%f24 = be3d0f8e b4dd3e42, Mem[0000000030101400] = 00000000 00000000
	stda	%f24,[%i4+%g0]0x81	! Mem[0000000030101400] = be3d0f8e b4dd3e42
!	%l2 = 000000c8, %l3 = c89d1e13, Mem[00000000100c1408] = 0000ff13 00000000
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000c8 c89d1e13
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 4770ac80, %l0 = 00000000000000f8
	lduba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000080

p0_label_83:
!	Mem[0000000030081410] = 0000000013015707, %l5 = 000000000000b0b6
	ldxa	[%i2+%o5]0x81,%l5	! %l5 = 0000000013015707
!	Mem[000000001010140c] = 0000006e, %l1 = 0000000000000063
	lduba	[%i4+0x00e]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = ff1e9dc8, %l0 = 0000000000000080
	lduha	[%i6+%o5]0x81,%l0	! %l0 = 000000000000ff1e
!	Mem[0000000010081410] = c89d1e13fff1c800, %l5 = 0000000013015707
	ldxa	[%i2+%o5]0x88,%l5	! %l5 = c89d1e13fff1c800
!	Mem[00000000211c0000] = c93a0b46, %l0 = 000000000000ff1e
	ldsb	[%o2+%g0],%l0		! %l0 = ffffffffffffffc9
!	Mem[00000000100c1408] = 000000c8, %l1 = 0000000000000000
	ldsha	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000c8
!	Mem[00000000300c1408] = ff01a2d5, %l6 = ffffffffffffff80
	lduwa	[%i3+%o4]0x89,%l6	! %l6 = 00000000ff01a2d5
!	Mem[0000000010181410] = 332e64f0, %l3 = 00000000c89d1e13
	lduha	[%i6+%o5]0x88,%l3	! %l3 = 00000000000064f0
!	Mem[0000000010141408] = 7a4a888200000000, %l3 = 00000000000064f0
	ldxa	[%i5+%o4]0x80,%l3	! %l3 = 7a4a888200000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 00000039, %l2 = 00000000000000c8
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff

p0_label_84:
!	%l5 = c89d1e13fff1c800, Mem[00000000100c1408] = 000000c8
	stha	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000c800
!	Mem[00000000100c1410] = 00000000, %l5 = c89d1e13fff1c800
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 80ac7047, %l1 = 00000000000000c8
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 0000000080ac7047
!	Mem[0000000030141400] = 00000000, %l3 = 7a4a888200000000
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = c8b5d7ff, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 00000000c8b5d7ff
!	%f20 = c80000fe 99bbf40c, %l3 = 0000000000000000
!	Mem[0000000010001418] = 63d79011a627f149
	add	%i0,0x018,%g1
	stda	%f20,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010001418] = 63d79011a627f149
!	Mem[00000000300c1400] = ff0000ff, %l5 = 00000000c8b5d7ff
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%l0 = ffffffffffffffc9, Mem[0000000010081410] = 00c8f1ff
	stba	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = c9c8f1ff
!	Mem[0000000030181400] = af5457ff, %l2 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 342eaef6, %f25 = b4dd3e42
	lda	[%i0+%g0]0x81,%f25	! %f25 = 342eaef6

p0_label_85:
!	Mem[0000000030081410] = 0757011300000000, %f0  = 4a39581e 0000001e
	ldda	[%i2+%o5]0x89,%f0 	! %f0  = 07570113 00000000
!	Mem[0000000030001410] = c8b5d763, %f24 = be3d0f8e
	lda	[%i0+%o5]0x89,%f24	! %f24 = c8b5d763
!	Mem[0000000010081408] = 00000018, %l6 = 00000000ff01a2d5
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000018
!	Mem[0000000010181410] = f0642e33, %f21 = 99bbf40c
	lda	[%i6+%o5]0x80,%f21	! %f21 = f0642e33
!	Mem[0000000030181400] = af5457ff, %f30 = e83973c9
	lda	[%i6+%g0]0x89,%f30	! %f30 = af5457ff
!	Mem[0000000030141400] = 00000000, %l2 = 00000000000000ff
	lduwa	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = ff000039, %l1 = 0000000080ac7047
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081408] = c89d1e1318000000, %f4  = 3a000000 00000000
	ldda	[%i2+%o4]0x88,%f4 	! %f4  = c89d1e13 18000000
!	Mem[0000000010141408] = 82884a7a, %l6 = 0000000000000018
	ldswa	[%i5+%o4]0x88,%l6	! %l6 = ffffffff82884a7a
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = c93a0b46, %l2 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 000000c9000000ff

p0_label_86:
!	%f8  = 5c243826, Mem[0000000010141410] = b6b00000
	sta	%f8 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 5c243826
!	%l6 = ffffffff82884a7a, Mem[0000000030181400] = ffffffffaf5457ff
	stxa	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff82884a7a
!	%f0  = 07570113 00000000 6e000000 00000039
!	%f4  = c89d1e13 18000000 ff00c8ff 182590ee
!	%f8  = 5c243826 4c51511c f0642e33 dd005994
!	%f12 = 12ff12ff 1e000000 f0642e33 6bf3de9c
	stda	%f0,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
!	Mem[0000000030181410] = ff1e9dc8, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	%l0 = ffffffffffffffc9, Mem[0000000030041400] = be3d0f00
	stha	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = be3dffc9
	membar	#Sync			! Added by membar checker (18)
!	%l6 = ffffffff82884a7a, Mem[0000000010141410] = 00000018131e9dc8
	stxa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffff82884a7a
!	%l5 = 00000000000000ff, Mem[0000000010101400] = 1e000000, %asi = 80
	stwa	%l5,[%i4+0x000]%asi	! Mem[0000000010101400] = 000000ff
!	Mem[0000000010101418] = ee902518ffc800ff, %l0 = ffffffffffffffc9, %l4 = 2638245c342eaef6
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = ee902518ffc800ff
!	%l4 = ee902518ffc800ff, Mem[0000000010041408] = b900ff00
	stba	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = b900ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = c9ff3dbe, %l4 = ee902518ffc800ff
	lduha	[%i1+%g0]0x81,%l4	! %l4 = 000000000000c9ff

p0_label_87:
!	Mem[0000000010101438] = 9cdef36b332e64f0, %f26 = 075a8510 9ca25231
	ldd	[%i4+0x038],%f26	! %f26 = 9cdef36b 332e64f0
!	Mem[0000000010141408] = 6e000000, %l2 = 00000000000000c9
	lduba	[%i5+%o4]0x80,%l2	! %l2 = 000000000000006e
!	Mem[0000000010041438] = 260726bb, %l5 = 00000000000000ff
	lduba	[%i1+0x039]%asi,%l5	! %l5 = 0000000000000007
!	Mem[0000000030101408] = 131e57ff, %l0 = ffffffffffffffc9
	lduba	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101408] = ff571e13939c958c, %l2 = 000000000000006e
	ldxa	[%i4+%o4]0x81,%l2	! %l2 = ff571e13939c958c
!	Mem[0000000030141408] = adf930741e58394a, %l5 = 0000000000000007
	ldxa	[%i5+%o4]0x81,%l5	! %l5 = adf930741e58394a
!	Mem[0000000010081400] = 2638245c, %l5 = adf930741e58394a
	ldsba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000026
!	Mem[00000000100c1400] = ff520000 ff05a404, %l2 = 939c958c, %l3 = 000000ff
	ldda	[%i3+0x000]%asi,%l2	! %l2 = 00000000ff520000 00000000ff05a404
!	Mem[0000000010101408] = 39000000, %l3 = 00000000ff05a404
	ldsba	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000039
!	Starting 10 instruction Store Burst
!	%f25 = 342eaef6, Mem[0000000010081410] = c9c8f1ff
	sta	%f25,[%i2+%o5]0x80	! Mem[0000000010081410] = 342eaef6

p0_label_88:
!	Mem[0000000010081410] = 342eaef6, %l7 = 00000000000000ff
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 00000000342eaef6
!	%l2 = ff520000, %l3 = 00000039, Mem[0000000030001410] = c8b5d763 e10c38e4
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = ff520000 00000039
!	Mem[0000000010181432] = abb4ff83, %l2 = 00000000ff520000
	ldstuba	[%i6+0x032]%asi,%l2	! %l2 = 000000ff000000ff
!	%l3 = 0000000000000039, Mem[0000000010101408] = 00000039
	stba	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000039
!	%l2 = 00000000000000ff, Mem[0000000030041410] = 600799bb
	stba	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 600799ff
!	%l4 = 000000000000c9ff, Mem[0000000010101400] = ff000000
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = ff00c9ff
!	%l6 = ffffffff82884a7a, Mem[0000000010041408] = b900ffff
	stwa	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 82884a7a
!	%l6 = ffffffff82884a7a, Mem[00000000100c1408] = 00c80000
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 4a7a0000
!	Mem[00000000300c1408] = ff01a2d5, %l7 = 00000000342eaef6
	swapa	[%i3+%o4]0x89,%l7	! %l7 = 00000000ff01a2d5
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000006e, %l7 = 00000000ff01a2d5
	ldswa	[%i5+%o4]0x88,%l7	! %l7 = 000000000000006e

p0_label_89:
!	Mem[0000000030141410] = f80000f8 ffffffff, %l0 = 000000ff, %l1 = 000000ff
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 00000000f80000f8 00000000ffffffff
!	Mem[000000001010143c] = 332e64f0, %f28 = 4618ccbe
	ld	[%i4+0x03c],%f28	! %f28 = 332e64f0
!	Mem[0000000030001410] = 000052ff39000000, %f18 = 4a39581e 7430f9ad
	ldda	[%i0+%o5]0x81,%f18	! %f18 = 000052ff 39000000
!	Mem[0000000010181408] = 000000c8, %l6 = ffffffff82884a7a
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 00000000000000c8
!	Mem[0000000010081414] = 131e9dc8, %l4 = 000000000000c9ff
	lduba	[%i2+0x017]%asi,%l4	! %l4 = 00000000000000c8
!	Mem[0000000030081410] = 00000000, %l2 = 00000000000000ff
	lduba	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = b6b000ff, %l1 = 00000000ffffffff
	ldsha	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081408] = 00000018, %f1  = 00000000
	lda	[%i2+%o4]0x80,%f1 	! %f1 = 00000018
!	Mem[0000000010181400] = 00000000, %f10 = f0642e33
	lda	[%i6+%g0]0x80,%f10	! %f10 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 600799ff, %l6 = 00000000000000c8
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 00000000600799ff

p0_label_90:
!	Mem[0000000010041400] = c89d1e13, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000c89d1e13
!	Mem[0000000030081410] = 00000000, %l4 = 00000000000000c8
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1410] = b6b000ff, %l4 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%l0 = f80000f8, %l1 = 000000ff, Mem[0000000010081408] = 18000000 c89d1e13
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = f80000f8 000000ff
!	Mem[00000000100c1410] = 00c8f1ff, %l6 = 00000000600799ff
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 0000000000c8f1ff
!	%l2 = 00000000c89d1e13, Mem[0000000030181410] = 78377dfdc89d1eff
	stxa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000c89d1e13
!	Mem[0000000030081400] = ff000039, %l7 = 000000000000006e
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030141410] = f80000f8, %l3 = 0000000000000039
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 00000000f80000f8
!	Mem[0000000030001408] = 000000ff, %l0 = 00000000f80000f8
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00007a4a, %f13 = 1e000000
	lda	[%i3+%o4]0x88,%f13	! %f13 = 00007a4a

p0_label_91:
!	Mem[0000000010141430] = 12ff12ff, %f23 = 66cc7bb1
	ld	[%i5+0x030],%f23	! %f23 = 12ff12ff
!	Mem[000000001010141c] = ffc800ff, %l0 = 0000000000000000
	ldsha	[%i4+0x01e]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001400] = 342eaef65cb8ffff, %l4 = 00000000000000ff
	ldxa	[%i0+%g0]0x81,%l4	! %l4 = 342eaef65cb8ffff
!	Mem[0000000010081400] = 2638245c, %l2 = 00000000c89d1e13
	lduba	[%i2+0x002]%asi,%l2	! %l2 = 0000000000000024
!	Mem[00000000201c0000] = 13ff367d, %l0 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = 00000000000013ff
!	Mem[0000000030101400] = be3d0f8e b4dd3e42 ff571e13 939c958c
!	Mem[0000000030101410] = ff0006fd bb38245c 305122b4 14eb7ae0
!	Mem[0000000030101420] = 5c92e244 121321b5 28512d10 6bb30828
!	Mem[0000000030101430] = f6b3e679 c0a561e3 6c275400 15b72d80
	ldda	[%i4]ASI_BLK_SL,%f0	! Block Load from 0000000030101400
!	Mem[0000000010041408] = 7a4a8882, %l1 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l1	! %l1 = 0000000000007a4a
!	Mem[0000000030141410] = 39000000, %f18 = 000052ff
	lda	[%i5+%o5]0x89,%f18	! %f18 = 39000000
!	Mem[0000000010101408] = 00000039, %f18 = 39000000
	lda	[%i4+%o4]0x88,%f18	! %f18 = 00000039
!	Starting 10 instruction Store Burst
!	%f23 = 12ff12ff, Mem[0000000010181434] = af54fcd3
	sta	%f23,[%i6+0x034]%asi	! Mem[0000000010181434] = 12ff12ff

p0_label_92:
!	Mem[00000000201c0001] = 13ff367d, %l4 = 342eaef65cb8ffff
	ldstub	[%o0+0x001],%l4		! %l4 = 000000ff000000ff
!	%l1 = 0000000000007a4a, Mem[000000001000140d] = b6b00000, %asi = 80
	stba	%l1,[%i0+0x00d]%asi	! Mem[000000001000140c] = b64a0000
!	%l2 = 00000024, %l3 = f80000f8, Mem[0000000010181418] = 7a23e254 c2e9196a
	std	%l2,[%i6+0x018]		! Mem[0000000010181418] = 00000024 f80000f8
!	%l6 = 00c8f1ff, %l7 = 000000ff, Mem[0000000010141408] = 6e000000 00000039
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00c8f1ff 000000ff
!	Mem[00000000211c0000] = ff3a0b46, %l3 = 00000000f80000f8
	ldstub	[%o2+%g0],%l3		! %l3 = 000000ff000000ff
!	Mem[0000000030041400] = c9ff3dbe, %l6 = 0000000000c8f1ff
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 00000000c9ff3dbe
!	Mem[0000000010101408] = 00000039, %l6 = 00000000c9ff3dbe
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000039
!	%f31 = 6bf3de9c, Mem[0000000010101408] = be3dffc9
	sta	%f31,[%i4+%o4]0x80	! Mem[0000000010101408] = 6bf3de9c
!	%f26 = 9cdef36b 332e64f0, Mem[0000000010101420] = 1c51514c 2638245c
	std	%f26,[%i4+0x020]	! Mem[0000000010101420] = 9cdef36b 332e64f0
!	Starting 10 instruction Load Burst
!	Mem[000000001000141c] = a627f149, %l3 = 00000000000000ff
	ldsh	[%i0+0x01e],%l3		! %l3 = fffffffffffff149

p0_label_93:
!	Mem[00000000100c1400] = ff520000, %l1 = 0000000000007a4a
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081400] = ffc9ecf1390000ff, %l2 = 0000000000000024
	ldxa	[%i2+%g0]0x89,%l2	! %l2 = ffc9ecf1390000ff
!	Mem[0000000030181408] = fe0000ff, %l4 = 00000000000000ff
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 00000000fe0000ff
!	Mem[0000000010081410] = 000000ff, %f18 = 00000039
	lda	[%i2+%o5]0x80,%f18	! %f18 = 000000ff
!	Mem[0000000030181400] = ffffffff 82884a7a, %l4 = fe0000ff, %l5 = 00000026
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 0000000082884a7a 00000000ffffffff
!	Mem[00000000100c1430] = c89d1e13 00000054, %l2 = 390000ff, %l3 = fffff149
	ldd	[%i3+0x030],%l2		! %l2 = 00000000c89d1e13 0000000000000054
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000054
	lduha	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800000] = ffff188e, %l7 = 00000000000000ff
	ldub	[%o1+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010181408] = 000000c8, %l1 = 00000000000000ff
	lduha	[%i6+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030001408] = ff0000ff
	stba	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff

p0_label_94:
!	Mem[00000000300c1408] = 342eaef6, %l4 = 0000000082884a7a
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 00000000342eaef6
!	Mem[0000000010141408] = 00c8f1ff, %l3 = 0000000000000000, %asi = 80
	swapa	[%i5+0x008]%asi,%l3	! %l3 = 0000000000c8f1ff
!	%l4 = 00000000342eaef6, Mem[0000000010181408] = 000000c8
	stba	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = f60000c8
!	Mem[000000001004141c] = 7a4a8882, %l7 = 00000000000000ff
	swap	[%i1+0x01c],%l7		! %l7 = 000000007a4a8882
!	%f22 = 65a90401 12ff12ff, Mem[0000000030141400] = 00000000 b6b00000
	stda	%f22,[%i5+%g0]0x81	! Mem[0000000030141400] = 65a90401 12ff12ff
!	Mem[0000000010101410] = 00000000, %l6 = 0000000000000039
	swapa	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l2 = c89d1e13, %l3 = 00c8f1ff, Mem[0000000030141408] = adf93074 1e58394a
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = c89d1e13 00c8f1ff
	membar	#Sync			! Added by membar checker (19)
!	%l7 = 000000007a4a8882, Mem[0000000030101408] = 131e57ff
	stba	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 131e5782
!	Mem[0000000030181400] = 82884a7a, %l7 = 000000007a4a8882
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 0000007a000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000000, %l0 = 00000000000013ff
	ldswa	[%i2+%o5]0x88,%l0	! %l0 = ffffffffff000000

p0_label_95:
!	Mem[00000000100c1430] = c89d1e13, %l2 = 00000000c89d1e13
	ldswa	[%i3+0x030]%asi,%l2	! %l2 = ffffffffc89d1e13
!	Mem[0000000030081400] = ff000039, %l5 = 00000000ffffffff
	ldswa	[%i2+%g0]0x81,%l5	! %l5 = ffffffffff000039
!	Mem[0000000020800000] = ffff188e, %l4 = 00000000342eaef6
	ldub	[%o1+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l1 = 0000000000000000
	lduha	[%i5+0x00a]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141428] = f0642e33 dd005994, %l6 = 00000000, %l7 = 0000007a
	ldda	[%i5+0x028]%asi,%l6	! %l6 = 00000000f0642e33 00000000dd005994
!	Mem[0000000010101408] = 6bf3de9c0000006e, %l4 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l4	! %l4 = 6bf3de9c0000006e
!	Mem[0000000030141410] = 00000039 ffffffff, %l4 = 0000006e, %l5 = ff000039
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000039 00000000ffffffff
!	Mem[0000000010001400] = 04a457ff, %f23 = 12ff12ff
	lda	[%i0+%g0]0x88,%f23	! %f23 = 04a457ff
!	Mem[0000000010101430] = 0000001e, %l0 = ffffffffff000000
	ldswa	[%i4+0x030]%asi,%l0	! %l0 = 000000000000001e
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ffffffff, Mem[0000000010181408] = c80000f6
	stba	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = c80000ff

p0_label_96:
!	Mem[0000000010001433] = 927d9056, %l0 = 000000000000001e
	ldstuba	[%i0+0x033]%asi,%l0	! %l0 = 00000056000000ff
!	Mem[00000000100c1408] = 00007a4a, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l1	! %l1 = 0000000000007a4a
!	Mem[0000000030001410] = ff520000, %l6 = 00000000f0642e33
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 00000000ff520000
!	Mem[0000000030181400] = 82884aff, %l3 = 0000000000c8f1ff
	swapa	[%i6+%g0]0x89,%l3	! %l3 = 0000000082884aff
!	%l5 = 00000000ffffffff, Mem[0000000030041408] = c80000fe
	stba	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = ff0000fe
!	%f2  = 8c959c93 131e57ff, Mem[0000000030041408] = ff0000fe 99bbf40c
	stda	%f2 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 8c959c93 131e57ff
!	%f4  = 5c2438bb, Mem[00000000300c1408] = 82884a7a
	sta	%f4 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 5c2438bb
!	%l7 = 00000000dd005994, Mem[0000000021800000] = ff2d0c06
	sth	%l7,[%o3+%g0]		! Mem[0000000021800000] = 59940c06
!	Mem[0000000030081408] = ff000000, %l7 = 00000000dd005994
	lduba	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001014142c] = dd005994, %l3 = 0000000082884aff
	ldswa	[%i5+0x02c]%asi,%l3	! %l3 = ffffffffdd005994

p0_label_97:
!	Mem[0000000010141410] = 82884a7a, %l0 = 0000000000000056
	ldswa	[%i5+%o5]0x88,%l0	! %l0 = ffffffff82884a7a
!	Mem[000000001010143c] = 332e64f0, %l2 = ffffffffc89d1e13
	ldsh	[%i4+0x03c],%l2		! %l2 = 000000000000332e
!	Mem[00000000300c1408] = 5c2438bb, %l4 = 0000000000000039
	lduwa	[%i3+%o4]0x89,%l4	! %l4 = 000000005c2438bb
!	Mem[00000000300c1408] = 5c2438bb, %f9  = 44e2925c
	lda	[%i3+%o4]0x89,%f9 	! %f9 = 5c2438bb
!	Mem[00000000300c1408] = 5c2438bb, %f3  = 131e57ff
	lda	[%i3+%o4]0x89,%f3 	! %f3 = 5c2438bb
!	Mem[0000000030081408] = ff000000, %l6 = 00000000ff520000
	ldsha	[%i2+%o4]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[00000000100c1410] = 600799ff, %l1 = 0000000000007a4a
	lduha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000006007
!	Mem[0000000010141401] = 07570113, %l3 = ffffffffdd005994
	ldstub	[%i5+0x001],%l3		! %l3 = 00000057000000ff
!	Mem[0000000010141410] = 7a4a8882, %l4 = 000000005c2438bb
	ldsha	[%i5+%o5]0x80,%l4	! %l4 = 0000000000007a4a
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 939c958c, %l6 = ffffffffffffff00
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 0000008c000000ff

p0_label_98:
!	Mem[0000000010101408] = 6bf3de9c, %l4 = 0000000000007a4a
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 000000006bf3de9c
!	Mem[0000000010181406] = 600799bb, %l3 = 0000000000000057
	ldstub	[%i6+0x006],%l3		! %l3 = 00000099000000ff
!	%l2 = 000000000000332e, Mem[0000000010181408] = ff0000c8
	stha	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 332e00c8
!	Mem[00000000201c0001] = 13ff367d, %l0 = ffffffff82884a7a
	ldstub	[%o0+0x001],%l0		! %l0 = 000000ff000000ff
!	%l4 = 000000006bf3de9c, Mem[0000000030141400] = 0104a965
	stwa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 6bf3de9c
!	Mem[00000000211c0001] = ff3a0b46, %l5 = 00000000ffffffff
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 0000003a000000ff
!	%l5 = 000000000000003a, Mem[0000000010101402] = ffc900ff, %asi = 80
	stba	%l5,[%i4+0x002]%asi	! Mem[0000000010101400] = ffc93aff
!	%l4 = 000000006bf3de9c, Mem[00000000100c142c] = a6823d4c, %asi = 80
	stha	%l4,[%i3+0x02c]%asi	! Mem[00000000100c142c] = de9c3d4c
!	Mem[0000000030081408] = 000000ff, %l7 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1414] = ff000000, %l4 = 000000006bf3de9c
	ldsb	[%i3+0x015],%l4		! %l4 = 0000000000000000

p0_label_99:
!	Mem[0000000030041408] = ff571e13939c95ff, %f18 = 000000ff 39000000
	ldda	[%i1+%o4]0x89,%f18	! %f18 = ff571e13 939c95ff
!	Mem[0000000010041410] = 8efe15ff, %l3 = 0000000000000099
	lduwa	[%i1+%o5]0x88,%l3	! %l3 = 000000008efe15ff
!	Mem[0000000020800000] = ffff188e, %l2 = 000000000000332e
	lduh	[%o1+%g0],%l2		! %l2 = 000000000000ffff
!	Mem[00000000211c0000] = ffff0b46, %l3 = 000000008efe15ff
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[00000000100c1434] = 00000054, %l2 = 000000000000ffff
	ldsha	[%i3+0x036]%asi,%l2	! %l2 = 0000000000000054
!	Mem[00000000201c0000] = 13ff367d, %l2 = 0000000000000054
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = 82884a7a, %l3 = 000000000000ffff
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000004a7a
!	Mem[0000000010101418] = ee902518, %l2 = 00000000000000ff
	lduha	[%i4+0x01a]%asi,%l2	! %l2 = 0000000000002518
!	Mem[0000000010081410] = 000000ff, %l5 = 000000000000003a
	ldswa	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f12 = e361a5c0 79e6b3f6, Mem[0000000010101410] = 39000000 0000003a
	std	%f12,[%i4+%o5]	! Mem[0000000010101410] = e361a5c0 79e6b3f6

p0_label_100:
!	Mem[0000000010141438] = f0642e336bf3de9c, %l5 = 00000000000000ff, %l5 = 00000000000000ff
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = f0642e336bf3de9c
!	%l7 = 00000000000000ff, Mem[0000000010041400] = 00000000
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00ff0000
!	Mem[0000000010001400] = 04a457ff, %l2 = 0000000000002518
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 0000000004a457ff
!	Mem[00000000211c0000] = ffff0b46, %l3 = 0000000000004a7a
	ldstub	[%o2+%g0],%l3		! %l3 = 000000ff000000ff
!	%l5 = f0642e336bf3de9c, Mem[0000000030041410] = 000000c8
	stha	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000de9c
!	%l6 = 0000008c, %l7 = 000000ff, Mem[0000000010141408] = 00000000 000000ff
	stda	%l6,[%i5+0x008]%asi	! Mem[0000000010141408] = 0000008c 000000ff
!	Mem[00000000201c0000] = 13ff367d, %l1 = 0000000000006007
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 00000013000000ff
!	%f6  = e07aeb14 b4225130, Mem[0000000030001400] = 342eaef6 5cb8ffff
	stda	%f6 ,[%i0+%g0]0x81	! Mem[0000000030001400] = e07aeb14 b4225130
!	%l0 = 000000ff, %l1 = 00000013, Mem[0000000010081428] = 884d86b3 2e2c0000
	stda	%l0,[%i2+0x028]%asi	! Mem[0000000010081428] = 000000ff 00000013
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = 927d90ff 05ff392e, %l0 = 000000ff, %l1 = 00000013
	ldda	[%i0+0x030]%asi,%l0	! %l0 = 00000000927d90ff 0000000005ff392e

p0_label_101:
!	Mem[0000000010001400] = 18250000, %l5 = f0642e336bf3de9c
	ldsha	[%i0+%g0]0x80,%l5	! %l5 = 0000000000001825
	membar	#Sync			! Added by membar checker (20)
!	Mem[00000000300c1400] = ff0000ff 30317b12 bb38245c ff05a404
!	Mem[00000000300c1410] = ff00b0b6 ffffb88a fe1adf4b 8941ad0c
!	Mem[00000000300c1420] = af0c15a9 f9c39c20 a9e52ba8 e9803f34
!	Mem[00000000300c1430] = 9cdef36b 332e64f0 61c6426e 204e5d13
	ldda	[%i3]ASI_BLK_SL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010101400] = 4a39581eff3ac9ff, %l4 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l4	! %l4 = 4a39581eff3ac9ff
!	Mem[00000000300c1400] = ff0000ff30317b12, %f14 = 802db715 0054276c
	ldda	[%i3+%g0]0x81,%f14	! %f14 = ff0000ff 30317b12
!	Mem[0000000010041410] = ff15fe8e, %l4 = 4a39581eff3ac9ff
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1410] = ff00b0b6, %f3  = 5c2438bb
	lda	[%i3+%o5]0x81,%f3 	! %f3 = ff00b0b6
!	Mem[0000000030141400] = 9cdef36b, %l7 = 00000000000000ff
	lduwa	[%i5+%g0]0x81,%l7	! %l7 = 000000009cdef36b
!	Mem[0000000030101400] = be3d0f8e, %l0 = 00000000927d90ff
	ldswa	[%i4+%g0]0x81,%l0	! %l0 = ffffffffbe3d0f8e
!	Mem[00000000300c1400] = ff0000ff, %l6 = 000000000000008c
	ldsba	[%i3+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f10 = 2808b36b, Mem[0000000010181408] = 332e00c8
	sta	%f10,[%i6+%o4]0x80	! Mem[0000000010181408] = 2808b36b

p0_label_102:
!	%l1 = 0000000005ff392e, Mem[0000000010041410] = 5cb8ffff8efe15ff
	stxa	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000005ff392e
!	%l2 = 04a457ff, %l3 = 000000ff, Mem[0000000010141410] = 7a4a8882 ffffffff
	std	%l2,[%i5+%o5]		! Mem[0000000010141410] = 04a457ff 000000ff
!	%l5 = 0000000000001825, Mem[0000000030101410] = ff0006fd
	stba	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 250006fd
!	%l0 = ffffffffbe3d0f8e, Mem[0000000010001410] = ff00000000000000
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffffbe3d0f8e
!	%l2 = 0000000004a457ff, Mem[0000000010141408] = 0000008c
	stwa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 04a457ff
!	Mem[0000000030041400] = fff1c800, %l5 = 0000000000001825
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 00000000fff1c800
!	Mem[0000000010141428] = f0642e33dd005994, %l1 = 0000000005ff392e, %l1 = 0000000005ff392e
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = f0642e33dd005994
!	%l3 = 00000000000000ff, Mem[0000000030001408] = 000000ff
	stba	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = ff0000ff
!	%l6 = ffffffffffffffff, Mem[00000000201c0000] = ffff367d
	stb	%l6,[%o0+%g0]		! Mem[00000000201c0000] = ffff367d
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00002518, %l5 = 00000000fff1c800
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 00000018000000ff

p0_label_103:
!	Mem[0000000010081408] = f80000f8, %l5 = 0000000000000018
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000f8
!	Mem[0000000030181400] = 00c8f1ff, %l0 = ffffffffbe3d0f8e
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = fffffffffffff1ff
!	Mem[0000000010181408] = 2808b36b, %f13 = 79e6b3f6
	ld	[%i6+%o4],%f13	! %f13 = 2808b36b
!	Mem[0000000010001408] = 00000000b64a0000, %l0 = fffffffffffff1ff
	ldxa	[%i0+%o4]0x80,%l0	! %l0 = 00000000b64a0000
!	Mem[0000000010001430] = 927d90ff05ff392e, %l0 = 00000000b64a0000
	ldx	[%i0+0x030],%l0		! %l0 = 927d90ff05ff392e
!	Mem[0000000010001404] = 130157ff, %l1 = f0642e33dd005994
	ldsha	[%i0+0x006]%asi,%l1	! %l1 = 00000000000057ff
!	Mem[0000000010181410] = f0642e33, %l6 = ffffffffffffffff
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000f0
!	Mem[0000000010081400] = 2638245c342eaef6, %f14 = ff0000ff 30317b12
	ldd	[%i2+%g0],%f14		! %f14 = 2638245c 342eaef6
!	Mem[0000000010101400] = ffc93aff1e58394a, %f14 = 2638245c 342eaef6
	ldda	[%i4+%g0]0x80,%f14	! %f14 = ffc93aff 1e58394a
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 00001825, %l3 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l3	! %l3 = 0000000000001825

p0_label_104:
!	Mem[0000000010141400] = 1301ff07, %l3 = 0000000000001825
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 000000001301ff07
!	%f1  = 8e0f3dbe, Mem[0000000010141410] = 04a457ff
	sta	%f1 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 8e0f3dbe
!	Mem[0000000030141408] = c89d1e13, %l1 = 00000000000057ff
	swapa	[%i5+%o4]0x81,%l1	! %l1 = 00000000c89d1e13
!	Mem[0000000030041400] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000000000f0, Mem[0000000010081408] = f80000f8ff000000
	stxa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000000000f0
!	%f9  = 5c2438bb, Mem[0000000030101410] = 250006fd
	sta	%f9 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 5c2438bb
!	%f12 = e361a5c0 2808b36b, %l2 = 0000000004a457ff
!	Mem[0000000030001438] = 7f36f226fcea686e
	add	%i0,0x038,%g1
	stda	%f12,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030001438] = 6bb30828c0a561e3
!	%l4 = 000000ff, %l5 = 000000f8, Mem[00000000100c1410] = ff990760 000000ff
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff 000000f8
!	Mem[0000000010001400] = ff250000, %l2 = 0000000004a457ff
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff00b0b6ffffb88a, %l6 = 00000000000000f0
	ldxa	[%i3+%o5]0x81,%l6	! %l6 = ff00b0b6ffffb88a

p0_label_105:
!	Mem[0000000010001410] = be3d0f8e, %l5 = 00000000000000f8
	lduba	[%i0+%o5]0x88,%l5	! %l5 = 000000000000008e
!	Mem[00000000300c1410] = b6b000ff, %l1 = 00000000c89d1e13
	lduwa	[%i3+%o5]0x89,%l1	! %l1 = 00000000b6b000ff
!	Mem[00000000300c1410] = b6b000ff, %f27 = a82be5a9
	lda	[%i3+%o5]0x89,%f27	! %f27 = b6b000ff
!	Mem[0000000020800040] = 00ff9e9b, %l4 = 00000000000000ff
	ldsba	[%o1+0x041]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001400] = ff250000130157ff, %f8  = b5211312 5c2438bb
	ldda	[%i0+0x000]%asi,%f8 	! %f8  = ff250000 130157ff
!	Mem[000000001014141c] = 182590ee, %l4 = ffffffffffffffff
	lduba	[%i5+0x01c]%asi,%l4	! %l4 = 0000000000000018
!	Mem[0000000010101418] = ee902518, %l7 = 000000009cdef36b
	lduwa	[%i4+0x018]%asi,%l7	! %l7 = 00000000ee902518
!	Mem[00000000300c1410] = ff00b0b6, %l2 = 00000000000000ff
	lduwa	[%i3+%o5]0x81,%l2	! %l2 = 00000000ff00b0b6
!	Mem[00000000100c1410] = 000000ff, %f13 = 2808b36b
	lda	[%i3+%o5]0x88,%f13	! %f13 = 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 332e64f0, %l5 = 000000000000008e
	swapa	[%i0+%o5]0x81,%l5	! %l5 = 00000000332e64f0

p0_label_106:
!	Mem[0000000010141438] = f0642e33, %l3 = 000000001301ff07
	swap	[%i5+0x038],%l3		! %l3 = 00000000f0642e33
!	%l6 = ff00b0b6ffffb88a, Mem[0000000030001410] = 8e000000
	stha	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 8e00b88a
!	Mem[0000000010001410] = 8e0f3dbe, %l6 = ff00b0b6ffffb88a
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 000000008e0f3dbe
!	%f16 = 127b3130 ff0000ff 04a405ff 5c2438bb
!	%f20 = 8ab8ffff b6b000ff 0cad4189 4bdf1afe
!	%f24 = 209cc3f9 a9150caf 343f80e9 b6b000ff
!	%f28 = f0642e33 6bf3de9c 135d4e20 6e42c661
	stda	%f16,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	Mem[0000000030141408] = ff570000, %l2 = 00000000ff00b0b6
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000ff570000
!	Mem[0000000010141408] = 04a457ff, %l3 = 00000000f0642e33
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 0000000004a457ff
!	Mem[000000001018141c] = f80000f8, %l4 = 00000018, %l3 = 04a457ff
	add	%i6,0x1c,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 00000000f80000f8
!	%l3 = 00000000f80000f8, Mem[0000000020800040] = 00ff9e9b, %asi = 80
	stha	%l3,[%o1+0x040]%asi	! Mem[0000000020800040] = 00f89e9b
!	%l7 = 00000000ee902518, Mem[00000000201c0000] = ffff367d
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 2518367d
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 05ff392e, %l7 = 00000000ee902518
	ldsba	[%i1+%o5]0x88,%l7	! %l7 = 000000000000002e

p0_label_107:
!	Mem[00000000100c1400] = ff520000ff05a404, %f12 = e361a5c0 000000ff
	ldda	[%i3+%g0]0x80,%f12	! %f12 = ff520000 ff05a404
!	Mem[0000000030001400] = e07aeb14, %l1 = 00000000b6b000ff
	ldswa	[%i0+%g0]0x81,%l1	! %l1 = ffffffffe07aeb14
!	Mem[0000000020800000] = ffff188e, %l4 = 0000000000000018
	ldsba	[%o1+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101408] = 82571e13, %f8  = ff250000
	lda	[%i4+%o4]0x81,%f8 	! %f8 = 82571e13
!	Mem[00000000100c1408] = 00000000, %f1  = 8e0f3dbe
	lda	[%i3+%o4]0x80,%f1 	! %f1 = 00000000
!	Mem[00000000100c1408] = 00000000, %l0 = 927d90ff05ff392e
	lduwa	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l7 = 000000000000002e
	ldswa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[000000001004142c] = 389824ba, %l4 = ffffffffffffffff
	ldsba	[%i1+0x02c]%asi,%l4	! %l4 = 0000000000000038
!	Mem[0000000010101400] = ffc93aff, %l1 = ffffffffe07aeb14
	lduwa	[%i4+%g0]0x80,%l1	! %l1 = 00000000ffc93aff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = ff000000, %l6 = 000000008e0f3dbe
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 00000000ff000000

p0_label_108:
!	Mem[0000000030181408] = fe0000ff, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	%f4  = 5c2438bb fd0600ff, Mem[0000000010141410] = 8e0f3dbe 000000ff
	stda	%f4 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 5c2438bb fd0600ff
!	%l3 = 00000000f80000f8, Mem[0000000010001408] = bb38245c
	stwa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = f80000f8
!	Mem[0000000010141408] = 332e64f0, %l5 = 00000000332e64f0
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 000000f0000000ff
!	%l0 = 0000000000000000, Mem[0000000010181426] = 13ff9dff
	sth	%l0,[%i6+0x026]		! Mem[0000000010181424] = 13ff0000
!	Mem[0000000010101410] = e361a5c079e6b3f6, %l7 = 00000000000000ff, %l2 = 00000000ff570000
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = e361a5c079e6b3f6
!	Mem[0000000020800000] = ffff188e, %l5 = 00000000000000f0
	ldstub	[%o1+%g0],%l5		! %l5 = 000000ff000000ff
!	%l4 = 00000038, %l5 = 000000ff, Mem[0000000010181410] = 332e64f0 9cdef36b
	stda	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000038 000000ff
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010001408] = f80000f8, %l7 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 00000000f80000f8
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff3ac9ff, %l2 = e361a5c079e6b3f6
	lduha	[%i4+%g0]0x88,%l2	! %l2 = 000000000000c9ff

p0_label_109:
!	Mem[0000000010001400] = ff0000ff, %l3 = 00000000f80000f8
	lduwa	[%i0+%g0]0x88,%l3	! %l3 = 00000000ff0000ff
!	Mem[0000000010101400] = ffc93aff 1e58394a, %l6 = ff000000, %l7 = f80000f8
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000ffc93aff 000000001e58394a
!	Mem[0000000030041400] = 47d1a404000000ff, %f18 = 04a405ff 5c2438bb
	ldda	[%i1+%g0]0x89,%f18	! %f18 = 47d1a404 000000ff
!	Mem[0000000030101408] = 82571e13, %l4 = 0000000000000038
	ldswa	[%i4+%o4]0x81,%l4	! %l4 = ffffffff82571e13
!	Mem[0000000010001410] = ff00b0b6, %l2 = 000000000000c9ff
	lduha	[%i0+0x012]%asi,%l2	! %l2 = 000000000000b0b6
!	Mem[000000001000143c] = 204e5d13, %l4 = ffffffff82571e13
	lduw	[%i0+0x03c],%l4		! %l4 = 00000000204e5d13
!	Mem[0000000030181410] = 131e9dc8, %l5 = 00000000000000ff
	lduwa	[%i6+%o5]0x81,%l5	! %l5 = 00000000131e9dc8
!	Mem[0000000010101408] = 00007a4a0000006e, %l3 = 00000000ff0000ff
	ldx	[%i4+%o4],%l3		! %l3 = 00007a4a0000006e
!	Mem[0000000030141408] = b6b000ff, %l6 = 00000000ffc93aff
	lduwa	[%i5+%o4]0x81,%l6	! %l6 = 00000000b6b000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000204e5d13, Mem[0000000010081400] = 5c243826
	stwa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 204e5d13

p0_label_110:
!	%l3 = 00007a4a0000006e, Mem[0000000010181400] = 00000000
	stwa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000006e
!	Mem[0000000010041410] = 05ff392e, %l3 = 00007a4a0000006e
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 0000000005ff392e
!	%l0 = 00000000, %l1 = ffc93aff, Mem[0000000010041418] = 38a608c5 000000ff
	stda	%l0,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000 ffc93aff
!	Mem[0000000030041408] = 939c95ff, %l1 = 00000000ffc93aff
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%l6 = 00000000b6b000ff, Mem[0000000010141416] = fd0600ff, %asi = 80
	stha	%l6,[%i5+0x016]%asi	! Mem[0000000010141414] = fd0600ff
!	Mem[0000000030181410] = c89d1e13, %l7 = 000000001e58394a
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 00000000c89d1e13
!	Mem[0000000030041400] = 000000ff, %l5 = 00000000131e9dc8
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%l7 = 00000000c89d1e13, Mem[00000000100c1408] = 00000000131e9dc8
	stx	%l7,[%i3+%o4]		! Mem[00000000100c1408] = 00000000c89d1e13
!	Mem[0000000030141400] = 6bf3de9c, %l0 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l0	! %l0 = 000000006bf3de9c
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 000000ff, %f14 = ffc93aff
	lda	[%i2+%o5]0x89,%f14	! %f14 = 000000ff

p0_label_111:
!	Mem[0000000010101400] = ff3ac9ff, %f31 = 6e42c661
	lda	[%i4+%g0]0x88,%f31	! %f31 = ff3ac9ff
!	Mem[00000000100c1410] = be3d0f8e, %l2 = 000000000000b0b6
	lduba	[%i3+%o5]0x88,%l2	! %l2 = 000000000000008e
!	Mem[0000000021800040] = ff55a30e, %l0 = 000000006bf3de9c
	ldub	[%o3+0x041],%l0		! %l0 = 0000000000000055
!	Mem[0000000021800080] = 05ad32fb, %l2 = 000000000000008e
	ldsh	[%o3+0x080],%l2		! %l2 = 00000000000005ad
!	Mem[0000000030101400] = be3d0f8e, %l6 = 00000000b6b000ff
	lduwa	[%i4+%g0]0x81,%l6	! %l6 = 00000000be3d0f8e
!	Mem[00000000201c0000] = 2518367d, %l6 = 00000000be3d0f8e
	lduh	[%o0+%g0],%l6		! %l6 = 0000000000002518
!	Mem[00000000211c0000] = ffff0b46, %l1 = 00000000000000ff
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000ffff
!	Mem[0000000030041400] = ff000000, %l0 = 0000000000000055
	ldswa	[%i1+%g0]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030081408] = 00000000000000ff, %f28 = f0642e33 6bf3de9c
	ldda	[%i2+%o4]0x89,%f28	! %f28 = 00000000 000000ff
!	Starting 10 instruction Store Burst
!	%f28 = 00000000 000000ff, %l1 = 000000000000ffff
!	Mem[0000000030041420] = 0757011304a4d147
	add	%i1,0x020,%g1
	stda	%f28,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030041420] = ff00000000000000

p0_label_112:
!	%l2 = 00000000000005ad, Mem[00000000300c1408] = bb38245c
	stwa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000005ad
!	%l3 = 0000000005ff392e, Mem[0000000030101400] = 8e0f3dbe
	stwa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 05ff392e
!	%f28 = 00000000 000000ff, %l3 = 0000000005ff392e
!	Mem[0000000010141438] = 1301ff076bf3de9c
	add	%i5,0x038,%g1
	stda	%f28,[%g1+%l3]ASI_PST16_P ! Mem[0000000010141438] = 000000000000de9c
!	%f10 = 2808b36b 102d5128, Mem[0000000030081410] = 000000ff 07570113
	stda	%f10,[%i2+%o5]0x89	! Mem[0000000030081410] = 2808b36b 102d5128
!	%f16 = 127b3130 ff0000ff 47d1a404 000000ff
!	%f20 = 8ab8ffff b6b000ff 0cad4189 4bdf1afe
!	%f24 = 209cc3f9 a9150caf 343f80e9 b6b000ff
!	%f28 = 00000000 000000ff 135d4e20 ff3ac9ff
	stda	%f16,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	%f0  = 423eddb4 00000000 8c959c93 ff00b0b6
!	%f4  = 5c2438bb fd0600ff e07aeb14 b4225130
!	%f8  = 82571e13 130157ff 2808b36b 102d5128
!	%f12 = ff520000 ff05a404 000000ff 1e58394a
	stda	%f0,[%i2]ASI_BLK_AIUPL	! Block Store to 0000000010081400
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000030041408] = 47d1a404, %l2 = 00000000000005ad
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 00000047000000ff
!	%f16 = 127b3130 ff0000ff, %l7 = 00000000c89d1e13
!	Mem[0000000030041438] = 135d4e20ff3ac9ff
	add	%i1,0x038,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030041438] = ff004e20303ac9ff
!	%l0 = ffffffffff000000, Mem[0000000030181408] = fe0000ff
	stba	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = fe000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = bb38245c, %l2 = 0000000000000047
	lduha	[%i5+%o5]0x88,%l2	! %l2 = 000000000000245c

p0_label_113:
!	Mem[00000000100c1408] = 00000000, %l0 = ffffffffff000000
	ldsba	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 00c8f1ff, %f0  = 423eddb4
	lda	[%i6+%g0]0x89,%f0 	! %f0 = 00c8f1ff
!	Mem[0000000030001410] = 8ab8008e, %l3 = 0000000005ff392e
	lduwa	[%i0+%o5]0x81,%l3	! %l3 = 000000008ab8008e
!	Mem[0000000010101410] = e361a5c0, %l6 = 0000000000002518
	ldswa	[%i4+%o5]0x80,%l6	! %l6 = ffffffffe361a5c0
!	Mem[0000000030081400] = 390000ff, %f17 = ff0000ff
	lda	[%i2+%g0]0x89,%f17	! %f17 = 390000ff
!	Mem[0000000010001408] = 04a405ffff000000, %l6 = ffffffffe361a5c0
	ldxa	[%i0+%o4]0x88,%l6	! %l6 = 04a405ffff000000
!	Mem[0000000010001400] = ff0000ff, %l1 = 000000000000ffff
	lduba	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041400] = 603e99690000ff00, %l4 = 00000000204e5d13
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = 603e99690000ff00
!	Mem[0000000010041438] = 260726bb, %l5 = 00000000000000ff
	ldsba	[%i1+0x03a]%asi,%l5	! %l5 = 0000000000000026
!	Starting 10 instruction Store Burst
!	%f24 = 209cc3f9 a9150caf, %l6 = 04a405ffff000000
!	Mem[0000000030181420] = 7f52bcee60e0e3bb
	add	%i6,0x020,%g1
	stda	%f24,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030181420] = 7f52bcee60e0e3bb

p0_label_114:
!	%f0  = 00c8f1ff, Mem[0000000010001434] = 332e64f0
	sta	%f0 ,[%i0+0x034]%asi	! Mem[0000000010001434] = 00c8f1ff
!	%l2 = 000000000000245c, Mem[0000000030081408] = ff000000
	stha	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 245c0000
!	%l3 = 000000008ab8008e, Mem[00000000201c0000] = 2518367d, %asi = 80
	stba	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 8e18367d
!	Mem[0000000010141424] = 4c51511c, %l2 = 000000000000245c
	ldstuba	[%i5+0x024]%asi,%l2	! %l2 = 0000004c000000ff
!	%l3 = 000000008ab8008e, Mem[0000000030081410] = 28512d10
	stha	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 008e2d10
!	Mem[00000000201c0001] = 8e18367d, %l2 = 000000000000004c
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 00000018000000ff
!	%l1 = 00000000000000ff, Mem[0000000030101410] = 5c2438bb
	stwa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff
!	%l4 = 603e99690000ff00, Mem[0000000010041400] = 0000ff00
	stha	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000ff00
!	Mem[00000000100c1410] = 8e0f3dbe, %l0 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 000000008e0f3dbe
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = c0a561e3, %f12 = ff520000
	lda	[%i4+%o5]0x88,%f12	! %f12 = c0a561e3

p0_label_115:
!	Mem[0000000030141400] = 00000000, %f31 = ff3ac9ff
	lda	[%i5+%g0]0x89,%f31	! %f31 = 00000000
!	Mem[0000000030041408] = ffd1a404, %l7 = 00000000c89d1e13
	lduha	[%i1+%o4]0x81,%l7	! %l7 = 000000000000ffd1
!	Mem[0000000010081400] = 00000000, %l0 = 000000008e0f3dbe
	lduba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = e07aeb14 b4225130 ff0000ff 4c000000
!	Mem[0000000030001410] = 8ab8008e 39000000 ee902518 96c8ddf2
!	Mem[0000000030001420] = 7f52c8b5 600799bb 884d86b3 2e2caf12
!	Mem[0000000030001430] = 835097d4 81738105 6bb30828 c0a561e3
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000010141408] = ff642e33, %l1 = 00000000000000ff
	lduha	[%i5+%o4]0x80,%l1	! %l1 = 000000000000ff64
!	Mem[0000000030101400] = 05ff392e, %l7 = 000000000000ffd1
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = 0000000005ff392e
!	Mem[00000000300c1400] = ff0000ff 30317b12 000005ad ff05a404
!	Mem[00000000300c1410] = ff00b0b6 ffffb88a fe1adf4b 8941ad0c
!	Mem[00000000300c1420] = af0c15a9 f9c39c20 a9e52ba8 e9803f34
!	Mem[00000000300c1430] = 9cdef36b 332e64f0 61c6426e 204e5d13
	ldda	[%i3]ASI_BLK_SL,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030141410] = 00000039, %f28 = 835097d4
	lda	[%i5+%o5]0x81,%f28	! %f28 = 00000039
!	Mem[0000000030141408] = b6b000ff, %f26 = 884d86b3
	lda	[%i5+%o4]0x81,%f26	! %f26 = b6b000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 008e2d10, %l5 = 0000000000000026
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 00000000008e2d10

p0_label_116:
!	%l7 = 0000000005ff392e, %l5 = 00000000008e2d10, %l4 = 603e99690000ff00
	xor	%l7,%l5,%l4		! %l4 = 000000000571143e
!	%l7 = 0000000005ff392e, Mem[0000000030101400] = 2e39ff05
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 05ff392e
!	Mem[0000000010041410] = 6e000000, %l5 = 00000000008e2d10
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 000000006e000000
!	%f25 = 600799bb, Mem[00000000100c1420] = 0000b0b6
	sta	%f25,[%i3+0x020]%asi	! Mem[00000000100c1420] = 600799bb
!	%l0 = 00000000, %l1 = 0000ff64, Mem[0000000010001428] = ff00b0b6 e9803f34
	stda	%l0,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000 0000ff64
!	Mem[0000000010081408] = ff00b0b6, %l6 = 04a405ffff000000
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 000000b6000000ff
!	%f24 = 7f52c8b5 600799bb, Mem[0000000010001430] = 9cdef36b 00c8f1ff
	std	%f24,[%i0+0x030]	! Mem[0000000010001430] = 7f52c8b5 600799bb
!	%l6 = 00000000000000b6, Mem[0000000030041408] = ffd1a404000000ff
	stxa	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000000b6
!	Mem[0000000010081410] = fd0600ff, %l3 = 000000008ab8008e
	swapa	[%i2+%o5]0x88,%l3	! %l3 = 00000000fd0600ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff12ff12 00000000, %l6 = 000000b6, %l7 = 05ff392e
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000 00000000ff12ff12

p0_label_117:
!	Mem[000000001000142c] = 0000ff64, %l6 = 0000000000000000
	ldsha	[%i0+0x02c]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = ff0000ff, %l5 = 000000006e000000
	ldsha	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141410] = 5c2438bb, %l6 = 0000000000000000
	lduwa	[%i5+%o5]0x80,%l6	! %l6 = 000000005c2438bb
!	Mem[00000000211c0000] = ffff0b46, %l2 = 0000000000000018
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000201c0000] = 8eff367d, %l1 = 000000000000ff64
	ldsb	[%o0+0x001],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010101428] = 945900dd 332e64f0, %l6 = 5c2438bb, %l7 = ff12ff12
	ldd	[%i4+0x028],%l6		! %l6 = 00000000945900dd 00000000332e64f0
!	Mem[000000001010142c] = 332e64f0, %f21 = 39000000
	lda	[%i4+0x02c]%asi,%f21	! %f21 = 332e64f0
!	Mem[00000000211c0000] = ffff0b46, %l5 = 00000000000000ff
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1400] = ff520000, %l5 = ffffffffffffffff
	ldswa	[%i3+%g0]0x80,%l5	! %l5 = ffffffffff520000
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[00000000100c142b] = 1c51514c, %asi = 80
	stba	%l1,[%i3+0x02b]%asi	! Mem[00000000100c1428] = 1c5151ff

p0_label_118:
!	Mem[0000000010081430] = 04a405ff000052ff, %l0 = 0000000000000000, %l4 = 000000000571143e
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = 04a405ff000052ff
!	Mem[0000000010101410] = e361a5c0, %l2 = ffffffffffffffff
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 00000000e361a5c0
!	%l3 = 00000000fd0600ff, Mem[00000000100c1400] = ff520000
	stwa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = fd0600ff
!	%f20 = 8ab8008e 332e64f0, Mem[0000000030181410] = 4a39581e 00000000
	stda	%f20,[%i6+%o5]0x81	! Mem[0000000030181410] = 8ab8008e 332e64f0
!	%l6 = 00000000945900dd, Mem[0000000010001408] = 04a405ffff000000
	stxa	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000945900dd
!	%f18 = ff0000ff 4c000000, Mem[0000000010081400] = 00000000 b4dd3e42
	stda	%f18,[%i2+%g0]0x80	! Mem[0000000010081400] = ff0000ff 4c000000
!	%l3 = 00000000fd0600ff, Mem[0000000010181430] = abb4ff83
	sth	%l3,[%i6+0x030]		! Mem[0000000010181430] = 00ffff83
!	%f30 = 6bb30828, Mem[0000000030141408] = b6b000ff
	sta	%f30,[%i5+%o4]0x81	! Mem[0000000030141408] = 6bb30828
!	Mem[0000000020800001] = ffff188e, %l7 = 00000000332e64f0
	ldstub	[%o1+0x001],%l7		! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 000000fe, %l0 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_119:
!	Mem[00000000201c0000] = 8eff367d, %l3 = 00000000fd0600ff
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000008eff
!	Mem[0000000030041400] = 127b3130ff0000ff, %l1 = ffffffffffffffff
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = 127b3130ff0000ff
!	Mem[00000000201c0000] = 8eff367d, %l1 = 127b3130ff0000ff
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffff8eff
!	Mem[00000000100c1400] = ff0006fd, %l4 = 04a405ff000052ff
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = fffffffffffffffd
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000008eff
	ldsha	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = ff0000ff, %l0 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010101410] = ffffffff, %l7 = 00000000000000ff
	ldswa	[%i4+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101408] = 00007a4a, %l4 = fffffffffffffffd
	lduha	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = ffffffff, %f24 = 7f52c8b5
	lda	[%i4+%o5]0x80,%f24	! %f24 = ffffffff
!	Starting 10 instruction Store Burst
!	%f27 = 2e2caf12, Mem[0000000030041400] = 127b3130
	sta	%f27,[%i1+%g0]0x81	! Mem[0000000030041400] = 2e2caf12

p0_label_120:
!	%l6 = 00000000945900dd, Mem[0000000010101408] = 4a7a0000
	stwa	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 945900dd
!	Mem[0000000010041410] = 008e2d10, %l2 = 00000000e361a5c0
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 00000000008e2d10
!	%f28 = 00000039 81738105, Mem[0000000010041410] = c0a561e3 00000000
	stda	%f28,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000039 81738105
!	%l3 = 0000000000000000, Mem[0000000010141408] = ff642e33
	stha	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 00002e33
!	Mem[0000000010141430] = 12ff12ff, %l4 = 0000000000000000
	swap	[%i5+0x030],%l4		! %l4 = 0000000012ff12ff
!	%f6  = 0cad4189 4bdf1afe, %l3 = 0000000000000000
!	Mem[0000000030101408] = 82571e13939c958c
	add	%i4,0x008,%g1
	stda	%f6,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030101408] = 82571e13939c958c
!	%f10 = 343f80e9 a82be5a9, %l6 = 00000000945900dd
!	Mem[0000000010181408] = 2808b36b8efe15f8
	add	%i6,0x008,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010181408] = a9082ba8e9fe3f34
!	%f8  = 209cc3f9 a9150caf, %l5 = ffffffffff520000
!	Mem[0000000010141420] = 5c243826ff51511c
	add	%i5,0x020,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_P ! Mem[0000000010141420] = 5c243826ff51511c
!	%l7 = ffffffffffffffff, Mem[0000000030041408] = 00000000
	stba	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = fff1c800, %f26 = b6b000ff
	lda	[%i6+%g0]0x81,%f26	! %f26 = fff1c800

p0_label_121:
!	Mem[0000000030181400] = fff1c800, %l5 = ffffffffff520000
	lduwa	[%i6+%g0]0x81,%l5	! %l5 = 00000000fff1c800
!	Mem[0000000030081408] = 245c0000 00000000, %l0 = 0000ff00, %l1 = ffff8eff
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 00000000245c0000 0000000000000000
!	Mem[0000000010001408] = dd00599400000000, %l7 = ffffffffffffffff
	ldxa	[%i0+%o4]0x80,%l7	! %l7 = dd00599400000000
!	Mem[0000000030181408] = 000000fe, %l5 = 00000000fff1c800
	ldswa	[%i6+%o4]0x81,%l5	! %l5 = 00000000000000fe
!	Mem[00000000211c0000] = ffff0b46, %l2 = 00000000008e2d10
	ldsb	[%o2+0x001],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030141410] = 39000000, %f22 = ee902518
	lda	[%i5+%o5]0x89,%f22	! %f22 = 39000000
!	Mem[0000000030141408] = 6bb30828, %f2  = 04a405ff
	lda	[%i5+%o4]0x81,%f2 	! %f2 = 6bb30828
!	Mem[0000000030101408] = 131e5782, %l3 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l3	! %l3 = 00000000131e5782
!	Mem[0000000030081400] = 390000ff, %f3  = ad050000
	lda	[%i2+%g0]0x89,%f3 	! %f3 = 390000ff
!	Starting 10 instruction Store Burst
!	%f31 = c0a561e3, Mem[0000000030181408] = 000000fe
	sta	%f31,[%i6+%o4]0x81	! Mem[0000000030181408] = c0a561e3

p0_label_122:
!	%l4 = 0000000012ff12ff, Mem[0000000010001410] = ff00b0b6ffffb88a
	stx	%l4,[%i0+%o5]		! Mem[0000000010001410] = 0000000012ff12ff
!	Mem[00000000100c1400] = ff0006fd, %l4 = 0000000012ff12ff
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 000000fd000000ff
!	Mem[000000001000141c] = 8941ad0c, %l0 = 00000000245c0000
	swap	[%i0+0x01c],%l0		! %l0 = 000000008941ad0c
!	Mem[0000000030001410] = 8e00b88a, %l6 = 00000000945900dd
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 000000008e00b88a
!	Mem[00000000201c0000] = 8eff367d, %l6 = 000000008e00b88a
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 0000008e000000ff
!	%l5 = 00000000000000fe, Mem[0000000030041408] = ff000000
	stha	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 00fe0000
!	%f8  = 209cc3f9, Mem[0000000010081408] = ffb000ff
	sta	%f8 ,[%i2+0x008]%asi	! Mem[0000000010081408] = 209cc3f9
!	Mem[0000000030141410] = 39000000, %l5 = 00000000000000fe
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 0000000039000000
	membar	#Sync			! Added by membar checker (23)
!	%f16 = e07aeb14 b4225130, %l1 = 0000000000000000
!	Mem[00000000300c1410] = ff00b0b6ffffb88a
	add	%i3,0x010,%g1
	stda	%f16,[%g1+%l1]ASI_PST32_S ! Mem[00000000300c1410] = ff00b0b6ffffb88a
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 12af2c2e, %l4 = 00000000000000fd
	ldswa	[%i1+%g0]0x89,%l4	! %l4 = 0000000012af2c2e

p0_label_123:
!	Mem[0000000030101410] = ff000000, %l3 = 00000000131e5782
	ldsha	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = 000000ff, %l5 = 0000000039000000
	lduwa	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101400] = 4a39581e ff3ac9ff, %l6 = 0000008e, %l7 = 00000000
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 00000000ff3ac9ff 000000004a39581e
!	Mem[0000000010001404] = 30317b12, %f16 = e07aeb14
	lda	[%i0+0x004]%asi,%f16	! %f16 = 30317b12
!	Mem[0000000030081410] = 26000000, %l4 = 0000000012af2c2e
	lduba	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 000000ff 00000038, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000038 00000000000000ff
!	Mem[00000000100c1404] = ff05a404, %l4 = 0000000000000000
	lduwa	[%i3+0x004]%asi,%l4	! %l4 = 00000000ff05a404
!	Mem[0000000010101400] = 4a39581eff3ac9ff, %l7 = 000000004a39581e
	ldxa	[%i4+%g0]0x88,%l7	! %l7 = 4a39581eff3ac9ff
!	Mem[0000000010101414] = 79e6b3f6, %l1 = 0000000000000000
	ldsw	[%i4+0x014],%l1		! %l1 = 0000000079e6b3f6
!	Starting 10 instruction Store Burst
!	Mem[000000001008141c] = 14eb7ae0, %l3 = 000000ff, %l3 = 000000ff
	add	%i2,0x1c,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 0000000014eb7ae0

p0_label_124:
!	%l3 = 0000000014eb7ae0, Mem[0000000010101408] = 945900dd
	stha	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 94597ae0
!	%l2 = 0000000000000038, Mem[0000000010141428] = f0642e33
	stb	%l2,[%i5+0x028]		! Mem[0000000010141428] = 38642e33
!	%l2 = 00000038, %l3 = 14eb7ae0, Mem[0000000030041410] = 8ab8ffff b6b000ff
	stda	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000038 14eb7ae0
!	%f9  = a9150caf, Mem[0000000010141400] = 00001825
	sta	%f9 ,[%i5+%g0]0x88	! Mem[0000000010141400] = a9150caf
!	Mem[0000000030041408] = 00fe0000, %l2 = 0000000000000038
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 0000000000fe0000
!	%l5 = 00000000000000ff, Mem[0000000030001408] = ff0000ff
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = ff0000ff
!	Mem[00000000300c1408] = ad050000, %l2 = 0000000000fe0000
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001400] = ff0000ff, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000020800000] = ffff188e
	stb	%l5,[%o1+%g0]		! Mem[0000000020800000] = ffff188e
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = e07aeb14, %f25 = 600799bb
	lda	[%i0+%g0]0x81,%f25	! %f25 = e07aeb14

p0_label_125:
!	Mem[00000000211c0000] = ffff0b46, %l3 = 0000000014eb7ae0
	ldsb	[%o2+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000020800000] = ffff188e, %l7 = 4a39581eff3ac9ff
	ldsha	[%o1+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041438] = 260726bb84b1d35a, %l3 = ffffffffffffffff
	ldx	[%i1+0x038],%l3		! %l3 = 260726bb84b1d35a
!	Mem[0000000010001400] = ff0000ff, %l5 = 00000000000000ff
	lduha	[%i0+%g0]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[00000000300c1400] = ff0000ff, %l2 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141410] = bb38245c, %l7 = ffffffffffffffff
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 0000005c000000ff
!	Mem[00000000100c1400] = ff0600ff, %f13 = 6bf3de9c
	lda	[%i3+%g0]0x80,%f13	! %f13 = ff0600ff
!	Mem[0000000030001408] = 0000004cff0000ff, %l3 = 260726bb84b1d35a
	ldxa	[%i0+%o4]0x89,%l3	! %l3 = 0000004cff0000ff
!	Mem[0000000030001400] = e07aeb14b4225130, %f16 = 30317b12 b4225130
	ldda	[%i0+%g0]0x81,%f16	! %f16 = e07aeb14 b4225130
!	Starting 10 instruction Store Burst
!	%f7  = 4bdf1afe, Mem[0000000010101408] = e07a5994
	sta	%f7 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 4bdf1afe

p0_label_126:
!	Mem[0000000020800040] = 00f89e9b, %l6 = 00000000ff3ac9ff
	lduh	[%o1+0x040],%l6		! %l6 = 00000000000000f8
!	Mem[0000000030081400] = ff000039, %l0 = 000000008941ad0c
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff000039
!	%l0 = ff000039, %l1 = 79e6b3f6, Mem[0000000010081410] = 8e00b88a bb38245c
	std	%l0,[%i2+%o5]		! Mem[0000000010081410] = ff000039 79e6b3f6
!	%l0 = 00000000ff000039, Mem[000000001004141b] = 00000000, %asi = 80
	stba	%l0,[%i1+0x01b]%asi	! Mem[0000000010041418] = 00000039
!	%l3 = 0000004cff0000ff, Mem[0000000010141404] = 00000000, %asi = 80
	stwa	%l3,[%i5+0x004]%asi	! Mem[0000000010141404] = ff0000ff
!	%l6 = 000000f8, %l7 = 0000005c, Mem[0000000030181410] = 8e00b88a f0642e33
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000f8 0000005c
!	Mem[0000000010041410] = 05817381, %l2 = 00000000000000ff
	ldstuba	[%i1+%o5]0x80,%l2	! %l2 = 00000005000000ff
!	%f19 = 4c000000, Mem[0000000010081410] = ff000039
	sta	%f19,[%i2+%o5]0x80	! Mem[0000000010081410] = 4c000000
!	Mem[0000000010041410] = 817381ff, %l4 = 00000000ff05a404
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = c0a561e3, %l4 = 00000000000000ff
	lduha	[%i6+%o4]0x81,%l4	! %l4 = 000000000000c0a5

p0_label_127:
!	Mem[0000000021800180] = 53b935e9, %l1 = 0000000079e6b3f6
	ldsha	[%o3+0x180]%asi,%l1	! %l1 = 00000000000053b9
!	Mem[0000000030101408] = 8c959c93131e5782, %f18 = ff0000ff 4c000000
	ldda	[%i4+%o4]0x89,%f18	! %f18 = 8c959c93 131e5782
!	Mem[0000000010041408] = e5850284 82884a7a, %l2 = 00000005, %l3 = ff0000ff
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 0000000082884a7a 00000000e5850284
!	Mem[00000000100c1400] = ff0006ff, %l2 = 0000000082884a7a
	ldswa	[%i3+%g0]0x88,%l2	! %l2 = ffffffffff0006ff
!	Mem[0000000010181410] = 38000000 ff000000, %l0 = ff000039, %l1 = 000053b9
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 0000000038000000 00000000ff000000
!	Mem[0000000010041410] = ff817381, %l3 = 00000000e5850284
	ldswa	[%i1+%o5]0x80,%l3	! %l3 = ffffffffff817381
!	Mem[0000000030181400] = fff1c800, %l6 = 00000000000000f8
	ldsha	[%i6+%g0]0x81,%l6	! %l6 = fffffffffffffff1
!	Mem[0000000010141400] = ff0000ff a9150caf, %l2 = ff0006ff, %l3 = ff817381
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 00000000a9150caf 00000000ff0000ff
!	Mem[0000000010101400] = ffc93aff, %l5 = 000000000000ff00
	ldsba	[%i4+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = ff0005ad, %l2 = 00000000a9150caf
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 00000000ff0005ad

p0_label_128:
!	%l0 = 38000000, %l1 = ff000000, Mem[0000000010101400] = ff3ac9ff 4a39581e
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 38000000 ff000000
!	Mem[0000000030181400] = fff1c800, %l3 = 00000000ff0000ff
	ldstuba	[%i6+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	%l1 = 00000000ff000000, Mem[0000000010181410] = 00000038
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = ff000000
!	%f16 = e07aeb14 b4225130 8c959c93 131e5782
!	%f20 = 8ab8008e 332e64f0 39000000 96c8ddf2
!	%f24 = ffffffff e07aeb14 fff1c800 2e2caf12
!	%f28 = 00000039 81738105 6bb30828 c0a561e3
	stda	%f16,[%i0]ASI_BLK_SL	! Block Store to 0000000030001400
!	%l0 = 0000000038000000, Mem[00000000100c1423] = 600799bb
	stb	%l0,[%i3+0x023]		! Mem[00000000100c1420] = 60079900
!	%l4 = 000000000000c0a5, Mem[0000000021800101] = ffce6996, %asi = 80
	stba	%l4,[%o3+0x101]%asi	! Mem[0000000021800100] = ffa56996
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000030001408] = 82571e13, %l7 = 000000000000005c
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 00000082000000ff
!	%l1 = 00000000ff000000, Mem[000000001004141c] = ffc93aff
	sth	%l1,[%i1+0x01c]		! Mem[000000001004141c] = 00003aff
!	Mem[0000000030001408] = ff571e13, %l3 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 00000000ff571e13
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = f0642e33, %l0 = 0000000038000000
	ldsha	[%i0+%o5]0x81,%l0	! %l0 = fffffffffffff064

p0_label_129:
!	Mem[0000000010101410] = ffffffff 79e6b3f6, %l0 = fffff064, %l1 = ff000000
	ldda	[%i4+0x010]%asi,%l0	! %l0 = 00000000ffffffff 0000000079e6b3f6
!	Mem[0000000021800040] = ff55a30e, %l4 = 000000000000c0a5
	ldsb	[%o3+0x040],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010181428] = 9cdef36b332e64f0, %f20 = 8ab8008e 332e64f0
	ldda	[%i6+0x028]%asi,%f20	! %f20 = 9cdef36b 332e64f0
!	Mem[0000000010081408] = 209cc3f9939c958c, %l0 = 00000000ffffffff
	ldxa	[%i2+%o4]0x80,%l0	! %l0 = 209cc3f9939c958c
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000ff571e13
	lduha	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = ffff0b46, %l3 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010181408] = a9082ba8, %l4 = ffffffffffffffff
	lduha	[%i6+%o4]0x80,%l4	! %l4 = 000000000000a908
!	Mem[0000000030181410] = f8000000, %l4 = 000000000000a908
	lduha	[%i6+%o5]0x81,%l4	! %l4 = 000000000000f800
!	Mem[00000000201c0000] = ffff367d, %l2 = 00000000ff0005ad
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = dd005994, %l5 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x80,%l5	! %l5 = 000000dd000000ff

p0_label_130:
!	Mem[0000000030101400] = 05ff392e, %l5 = 00000000000000dd
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 0000000005ff392e
!	%f0  = 127b3130 ff0000ff 6bb30828 390000ff
!	%f4  = 8ab8ffff b6b000ff 0cad4189 4bdf1afe
!	%f8  = 209cc3f9 a9150caf 343f80e9 a82be5a9
!	%f12 = f0642e33 ff0600ff 135d4e20 6e42c661
	stda	%f0,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	Mem[00000000218001c0] = ffff4fd1, %l1 = 0000000079e6b3f6
	ldstuba	[%o3+0x1c0]%asi,%l1	! %l1 = 000000ff000000ff
!	%l0 = 209cc3f9939c958c, Mem[0000000030041408] = 00000038000000b6
	stxa	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 209cc3f9939c958c
!	%f26 = fff1c800 2e2caf12, Mem[0000000010141400] = a9150caf ff0000ff
	stda	%f26,[%i5+%g0]0x88	! Mem[0000000010141400] = fff1c800 2e2caf12
!	%l3 = 000000000000ffff, Mem[0000000010101428] = 945900dd332e64f0, %asi = 80
	stxa	%l3,[%i4+0x028]%asi	! Mem[0000000010101428] = 000000000000ffff
!	Mem[0000000010001422] = af0c15a9, %l3 = 000000000000ffff
	ldstuba	[%i0+0x022]%asi,%l3	! %l3 = 00000015000000ff
!	%l7 = 0000000000000082, Mem[0000000010141408] = 00002e33, %asi = 80
	stha	%l7,[%i5+0x008]%asi	! Mem[0000000010141408] = 00822e33
!	%l4 = 000000000000f800, Mem[0000000010181410] = 000000ffff000000
	stxa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000000000f800
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 00f89e9b, %l7 = 0000000000000082
	ldsb	[%o1+0x041],%l7		! %l7 = fffffffffffffff8

p0_label_131:
!	Mem[0000000010101410] = ffffffff, %l5 = 0000000005ff392e
	ldsba	[%i4+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081400] = 8941ad0cf1ecc9ff, %l0 = 209cc3f9939c958c
	ldxa	[%i2+%g0]0x81,%l0	! %l0 = 8941ad0cf1ecc9ff
!	Mem[0000000010041408] = 7a4a8882, %f22 = 39000000
	lda	[%i1+%o4]0x80,%f22	! %f22 = 7a4a8882
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010141400] = 12af2c2e, %l1 = 00000000000000ff
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000012
!	Mem[0000000030081410] = 00000026, %l7 = fffffffffffffff8
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = ff0000ff, %l5 = ffffffffffffffff
	lduwa	[%i5+%g0]0x81,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000010081410] = 0000004c, %l0 = 8941ad0cf1ecc9ff
	ldswa	[%i2+%o5]0x88,%l0	! %l0 = 000000000000004c
!	Mem[0000000010181408] = a9082ba8e9fe3f34, %f28 = 00000039 81738105
	ldda	[%i6+%o4]0x80,%f28	! %f28 = a9082ba8 e9fe3f34
!	Mem[00000000211c0000] = ffff0b46, %l5 = 00000000ff0000ff
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ffff367d, %l7 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 000000ff000000ff

p0_label_132:
!	Mem[0000000030001400] = b4225130, %l5 = 000000000000ffff
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 00000000b4225130
!	%l2 = ffffffffffffffff, Mem[00000000211c0000] = ffff0b46, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff0b46
!	%f14 = 135d4e20, Mem[0000000010041428] = 313b9c29
	sta	%f14,[%i1+0x028]%asi	! Mem[0000000010041428] = 135d4e20
!	%l2 = ffffffffffffffff, Mem[0000000010041428] = 135d4e20, %asi = 80
	stha	%l2,[%i1+0x028]%asi	! Mem[0000000010041428] = ffff4e20
!	%l2 = ffffffffffffffff, Mem[0000000010081400] = 0000004cff0000ff
	stxa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffffffffffff
!	Mem[0000000010001400] = ff0000ff, %l0 = 000000000000004c
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	%f6  = 0cad4189 4bdf1afe, %l6 = fffffffffffffff1
!	Mem[0000000010141430] = 000000001e000000
	add	%i5,0x030,%g1
	stda	%f6,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010141430] = fe1adf4b1e000000
!	%l4 = 000000000000f800, %l5 = 00000000b4225130, %y  = 00000017
	smul	%l4,%l5,%l6		! %l6 = ffffb6813ea68000, %y = ffffb681
!	%l6 = 3ea68000, %l7 = 000000ff, Mem[00000000300c1410] = b6b000ff 8ab8ffff
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 3ea68000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = 05ad32fb, %l7 = 00000000000000ff
	lduh	[%o3+0x080],%l7		! %l7 = 00000000000005ad

p0_label_133:
!	Mem[0000000010001410] = ff12ff1200000000, %l3 = 0000000000000015
	ldxa	[%i0+%o5]0x88,%l3	! %l3 = ff12ff1200000000
!	Mem[00000000201c0000] = ffff367d, %l6 = ffffb6813ea68000
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[0000000020800040] = 00f89e9b, %l4 = 000000000000f800
	ldsb	[%o1+0x041],%l4		! %l4 = fffffffffffffff8
!	Mem[0000000010041408] = 7a4a8882, %l5 = 00000000b4225130
	lduwa	[%i1+%o4]0x80,%l5	! %l5 = 000000007a4a8882
!	Mem[0000000010081408] = 8c959c93f9c39c20, %l5 = 000000007a4a8882
	ldxa	[%i2+%o4]0x88,%l5	! %l5 = 8c959c93f9c39c20
!	Mem[0000000010041400] = 00ff0000, %l1 = 0000000000000012
	lduha	[%i1+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041420] = d2533948, %l5 = 8c959c93f9c39c20
	lduwa	[%i1+0x020]%asi,%l5	! %l5 = 00000000d2533948
!	Mem[0000000010001410] = ff12ff1200000000, %l3 = ff12ff1200000000
	ldxa	[%i0+%o5]0x88,%l3	! %l3 = ff12ff1200000000
!	Mem[0000000010141400] = 12af2c2e00c8f1ff, %l0 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l0	! %l0 = 12af2c2e00c8f1ff
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000010101400] = 00000038
	stha	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = ffff0038

p0_label_134:
!	%l2 = ffffffffffffffff, Mem[0000000010141430] = fe1adf4b
	stw	%l2,[%i5+0x030]		! Mem[0000000010141430] = ffffffff
!	%f24 = ffffffff e07aeb14, %l1 = 00000000000000ff
!	Mem[0000000010001400] = ff0000ff30317b12
	stda	%f24,[%i0+%l1]ASI_PST32_PL ! Mem[0000000010001400] = 14eb7ae0ffffffff
!	%f18 = 8c959c93 131e5782, Mem[0000000010181408] = a9082ba8 e9fe3f34
	stda	%f18,[%i6+%o4]0x80	! Mem[0000000010181408] = 8c959c93 131e5782
!	%l6 = 0000ffff, %l7 = 000005ad, Mem[0000000010141400] = 2e2caf12 fff1c800
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000ffff 000005ad
!	%l0 = 12af2c2e00c8f1ff, Mem[0000000010081408] = 209cc3f9
	stwa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 00c8f1ff
!	%l0 = 12af2c2e00c8f1ff, Mem[0000000030101408] = 131e5782
	stwa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 00c8f1ff
!	Mem[0000000021800041] = ff55a30e, %l6 = 000000000000ffff
	ldstuba	[%o3+0x041]%asi,%l6	! %l6 = 00000055000000ff
!	%f8  = 209cc3f9 a9150caf, %l7 = 00000000000005ad
!	Mem[0000000010181400] = 0000006e6007ffbb
	stda	%f8,[%i6+%l7]ASI_PST16_P ! Mem[0000000010181400] = 209cc3f960070caf
!	%f0  = 127b3130 ff0000ff, Mem[0000000030041400] = 2e2caf12 ff0000ff
	stda	%f0 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 127b3130 ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 3ea68000, %l3 = ff12ff1200000000
	lduha	[%i3+%o5]0x89,%l3	! %l3 = 0000000000008000

p0_label_135:
!	Mem[0000000030041410] = 38000000, %l1 = 00000000000000ff
	ldswa	[%i1+%o5]0x89,%l1	! %l1 = 0000000038000000
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000008000
	ldsba	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = e361a5c0, %l1 = 0000000038000000
	ldswa	[%i6+%o4]0x89,%l1	! %l1 = ffffffffe361a5c0
!	Mem[00000000201c0000] = ffff367d, %l1 = ffffffffe361a5c0
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041400] = 603e9969 0000ff00, %l4 = fffffff8, %l5 = d2533948
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 000000000000ff00 00000000603e9969
!	Mem[00000000300c1410] = 0080a63e, %l5 = 00000000603e9969
	ldsha	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000080
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000030101400] = 000000dd b4dd3e42 fff1c800 939c958c
!	Mem[0000000030101410] = 000000ff bb38245c 305122b4 14eb7ae0
!	Mem[0000000030101420] = 5c92e244 121321b5 28512d10 6bb30828
!	Mem[0000000030101430] = f6b3e679 c0a561e3 6c275400 15b72d80
	ldda	[%i4]ASI_BLK_SL,%f0	! Block Load from 0000000030101400
!	Mem[0000000010101438] = 9cdef36b, %l0 = 12af2c2e00c8f1ff
	lduba	[%i4+0x03a]%asi,%l0	! %l0 = 00000000000000f3
!	Mem[0000000030081410] = 00000026, %l2 = ffffffffffffffff
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000026
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000055, Mem[0000000010001408] = ff00599400000000, %asi = 80
	stxa	%l6,[%i0+0x008]%asi	! Mem[0000000010001408] = 0000000000000055

p0_label_136:
!	%f26 = fff1c800 2e2caf12, %l6 = 0000000000000055
!	Mem[0000000030001408] = 000000ff939c958c
	add	%i0,0x008,%g1
	stda	%f26,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030001408] = 12af2c2e939c958c
!	Mem[0000000010041408] = 82884a7a, %l0 = 00000000000000f3
	ldstuba	[%i1+%o4]0x88,%l0	! %l0 = 0000007a000000ff
!	Mem[00000000100c1400] = ff0600ff, %l1 = ffffffffffffffff
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ff0600ff
!	Mem[0000000010141410] = ff2438bb, %l2 = 0000000000000026
	ldstuba	[%i5+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%l7 = 00000000000005ad, Mem[0000000010001438] = 61c6426e204e5d13
	stx	%l7,[%i0+0x038]		! Mem[0000000010001438] = 00000000000005ad
!	%l4 = 000000000000ff00, Mem[0000000030081408] = 00005c24
	stha	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ff00
!	%l0 = 000000000000007a, Mem[000000001010143c] = 332e64f0
	stw	%l0,[%i4+0x03c]		! Mem[000000001010143c] = 0000007a
!	%l6 = 00000055, %l7 = 000005ad, Mem[00000000300c1410] = 0080a63e ff000000
	stda	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000055 000005ad
!	%l5 = 0000000000000080, Mem[00000000300c1408] = 04a405ffaf0c15a9
	stxa	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000080
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ffff0000, %l2 = 00000000000000ff
	lduba	[%i5+0x003]%asi,%l2	! %l2 = 0000000000000000

p0_label_137:
!	Mem[0000000030141400] = ff0000ff, %l3 = 0000000000000000
	ldswa	[%i5+%g0]0x81,%l3	! %l3 = ffffffffff0000ff
!	Mem[0000000030101408] = 00c8f1ff, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l1 = 00000000ff0600ff, %l7 = 00000000000005ad, %l7 = 00000000000005ad
	and	%l1,%l7,%l7		! %l7 = 00000000000000ad
!	Mem[0000000030081400] = 0cad4189, %l3 = ffffffffff0000ff
	lduha	[%i2+%g0]0x89,%l3	! %l3 = 0000000000004189
!	Mem[0000000030081410] = 000000266bb30828, %f30 = 6bb30828 c0a561e3
	ldda	[%i2+%o5]0x81,%f30	! %f30 = 00000026 6bb30828
!	Mem[0000000010081418] = 305122b4 14eb7ae0, %l2 = 000000ff, %l3 = 00004189
	ldd	[%i2+0x018],%l2		! %l2 = 00000000305122b4 0000000014eb7ae0
!	Mem[0000000030141400] = ff0000ff, %l3 = 0000000014eb7ae0
	lduba	[%i5+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[000000001000141c] = 245c0000, %l2 = 00000000305122b4
	ldub	[%i0+0x01c],%l2		! %l2 = 0000000000000024
!	Mem[0000000010081420] = ff570113, %l6 = 0000000000000055
	lduba	[%i2+0x023]%asi,%l6	! %l6 = 0000000000000013
!	Starting 10 instruction Store Burst
!	%f21 = 332e64f0, Mem[0000000010141410] = bb3824ff
	sta	%f21,[%i5+%o5]0x88	! Mem[0000000010141410] = 332e64f0

p0_label_138:
!	Mem[00000000201c0000] = ffff367d, %l2 = 0000000000000024
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101410] = f6b3e679ffffffff
	stxa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000000000ff
!	%f26 = fff1c800 2e2caf12, Mem[0000000010141408] = 00822e33 000000ff
	stda	%f26,[%i5+%o4]0x80	! Mem[0000000010141408] = fff1c800 2e2caf12
!	%l7 = 00000000000000ad, Mem[0000000030081400] = 8941ad0c
	stha	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 00adad0c
!	Mem[0000000030181400] = 00c8f1ff, %l2 = 00000000000000ff
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%l4 = 0000ff00, %l5 = 00000080, Mem[0000000010141410] = 332e64f0 ff0006fd
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000ff00 00000080
	membar	#Sync			! Added by membar checker (27)
!	%l0 = 000000000000007a, Mem[0000000030101410] = ff000000
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000007a
!	%l4 = 000000000000ff00, Mem[0000000030181400] = 00c8f1ff
	stha	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00c8ff00
!	Mem[0000000030141410] = ff00b0b6, %l6 = 0000000000000013
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff817381, %l1 = 00000000ff0600ff
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = ffffffffff817381

p0_label_139:
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000080
	ldsba	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081420] = ff570113131e5782, %l5 = 0000000000000000
	ldxa	[%i2+0x020]%asi,%l5	! %l5 = ff570113131e5782
!	Mem[0000000030001400] = 0000ffff, %l3 = 00000000000000ff
	lduba	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041408] = ff4a8882, %l2 = 00000000000000ff
	ldsha	[%i1+%o4]0x80,%l2	! %l2 = ffffffffffffff4a
!	Mem[0000000020800000] = ffff188e, %l5 = ff570113131e5782
	ldsba	[%o1+0x001]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[000000001014142c] = dd005994, %f12 = e361a5c0
	ld	[%i5+0x02c],%f12	! %f12 = dd005994
!	Mem[0000000030141410] = 8ab8ffffb6b000ff, %f20 = 9cdef36b 332e64f0
	ldda	[%i5+%o5]0x89,%f20	! %f20 = 8ab8ffff b6b000ff
!	Mem[0000000010181400] = f9c39c20, %l3 = 00000000000000ff
	lduha	[%i6+%g0]0x88,%l3	! %l3 = 0000000000009c20
!	Mem[0000000010141400] = 000005ad 0000ffff, %l4 = 0000ff00, %l5 = ffffffff
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 000000000000ffff 00000000000005ad
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010101400] = ff0000003800ffff
	stxa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000ff

p0_label_140:
!	Mem[0000000010081408] = 00c8f1ff, %l4 = 000000000000ffff
	swapa	[%i2+%o4]0x80,%l4	! %l4 = 0000000000c8f1ff
!	Mem[0000000030001410] = f0642e33, %l7 = 00000000000000ad
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 00000000f0642e33
!	Mem[0000000030001410] = ad000000, %l4 = 0000000000c8f1ff
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 00000000ad000000
!	Mem[00000000100c1400] = ffffffff, %l0 = 000000000000007a
	ldstuba	[%i3+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101410] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030081400] = 00adad0c, %l5 = 00000000000005ad
	swapa	[%i2+%g0]0x81,%l5	! %l5 = 0000000000adad0c
!	Mem[0000000010101429] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i4+0x029]%asi,%l6	! %l6 = 00000000000000ff
!	%l3 = 0000000000009c20, Mem[0000000030181410] = 000000f8
	stwa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 00009c20
!	Mem[0000000010041418] = 0000003900003aff, %l3 = 0000000000009c20, %l2 = ffffffffffffff4a
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = 0000003900003aff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 0000003814eb7ae0, %f0  = 423eddb4 dd000000
	ldda	[%i1+%o5]0x81,%f0 	! %f0  = 00000038 14eb7ae0

p0_label_141:
!	Mem[0000000010001400] = e07aeb14, %f10 = 2808b36b
	lda	[%i0+%g0]0x88,%f10	! %f10 = e07aeb14
!	Mem[0000000030181410] = 209c0000, %l2 = 0000003900003aff
	lduba	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000020
!	Mem[0000000010081400] = ffffffffffffffff, %f20 = 8ab8ffff b6b000ff
	ldda	[%i2+%g0]0x88,%f20	! %f20 = ffffffff ffffffff
!	Mem[0000000030081408] = 00ff0000, %l5 = 0000000000adad0c
	ldsha	[%i2+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1434] = 00000054, %l5 = 00000000000000ff
	ldub	[%i3+0x035],%l5		! %l5 = 0000000000000000
!	Mem[00000000100c1428] = 1c5151ff de9c3d4c, %l0 = 000000ff, %l1 = ff817381
	ldda	[%i3+0x028]%asi,%l0	! %l0 = 000000001c5151ff 00000000de9c3d4c
!	Mem[0000000030081410] = 2808b36b26000000, %l1 = 00000000de9c3d4c
	ldxa	[%i2+%o5]0x89,%l1	! %l1 = 2808b36b26000000
!	Mem[0000000030041410] = 00000038, %l7 = 00000000f0642e33
	ldswa	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000038
!	Mem[0000000030101410] = 5c2438bb 0000007a, %l2 = 00000020, %l3 = 00009c20
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 000000000000007a 000000005c2438bb
!	Starting 10 instruction Store Burst
!	%l0 = 000000001c5151ff, Mem[0000000010101400] = 000000ff
	stha	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 000051ff

p0_label_142:
!	%l6 = 00000000, %l7 = 00000038, Mem[0000000010001400] = e07aeb14 ffffffff
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 00000038
!	%l5 = 0000000000000000, Mem[0000000010001425] = f9c39c20
	stb	%l5,[%i0+0x025]		! Mem[0000000010001424] = f9009c20
!	Mem[0000000010081410] = 0000004c, %l4 = 00000000ad000000
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 0000004c000000ff
!	Mem[0000000010101418] = ee902518, %l6 = 0000000000000000, %asi = 80
	swapa	[%i4+0x018]%asi,%l6	! %l6 = 00000000ee902518
!	Mem[0000000010101408] = 4bdf1afe, %l7 = 0000000000000038
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 000000004bdf1afe
!	%f11 = 102d5128, %f17 = b4225130
	fitos	%f11,%f17		! %f17 = 4d816a89
!	Mem[00000000100c1400] = ffffffff, %l4 = 000000000000004c
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	%f30 = 00000026 6bb30828, Mem[0000000010001408] = 00000000 00000055
	stda	%f30,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000026 6bb30828
!	Mem[000000001008140c] = 939c958c, %l6 = ee902518, %l5 = 00000000
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 00000000939c958c
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 0000ff00, %l6 = 00000000ee902518
	lduba	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000

p0_label_143:
!	Mem[0000000030041408] = f9c39c20, %l5 = 00000000939c958c
	ldsha	[%i1+%o4]0x89,%l5	! %l5 = ffffffffffff9c20
!	Mem[0000000010101420] = 9cdef36b, %l6 = 0000000000000000
	lduw	[%i4+0x020],%l6		! %l6 = 000000009cdef36b
!	Mem[0000000030141410] = ff00b0b6, %l6 = 000000009cdef36b
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010181410] = 00f80000, %l3 = 000000005c2438bb
	ldsha	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000f8
!	Mem[0000000010181428] = 9cdef36b332e64f0, %f20 = ffffffff ffffffff
	ldd	[%i6+0x028],%f20	! %f20 = 9cdef36b 332e64f0
!	Mem[0000000030081400] = ad050000, %l4 = 00000000000000ff
	ldsba	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %f18 = 8c959c93
	lda	[%i3+%o4]0x88,%f18	! %f18 = 00000000
!	Mem[0000000010041408] = ff4a8882, %l2 = 000000000000007a
	ldsba	[%i1+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041400] = 00ff0000 69993e60, %l0 = 1c5151ff, %l1 = 26000000
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 0000000000ff0000 0000000069993e60
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000f8, Mem[0000000010001408] = 00000026
	stba	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = f8000026

p0_label_144:
!	%l2 = ffffffffffffffff, Mem[00000000100c1400] = ffffffff
	stha	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffff
!	%l6 = 0000ff00, %l7 = 4bdf1afe, Mem[0000000030181410] = 209c0000 5c000000
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000ff00 4bdf1afe
!	Mem[000000001000140c] = 6bb30828, %l5 = ffff9c20, %l1 = 69993e60
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 000000006bb30828
!	%l1 = 000000006bb30828, Mem[0000000010141418] = ff00c8ff
	stw	%l1,[%i5+0x018]		! Mem[0000000010141418] = 6bb30828
!	%l4 = 00000000, %l5 = ffff9c20, Mem[00000000300c1408] = 80000000 00000000
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 ffff9c20
!	%f23 = 96c8ddf2, Mem[0000000010001430] = 7f52c8b5
	st	%f23,[%i0+0x030]	! Mem[0000000010001430] = 96c8ddf2
!	%l2 = ffffffffffffffff, Mem[0000000010041400] = 603e99690000ff00
	stxa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffffffffffff
!	%f3  = 00c8f1ff, Mem[0000000010001410] = 00000000
	sta	%f3 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 00c8f1ff
!	Mem[0000000030141400] = ff0000ff, %l1 = 000000006bb30828
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001004141c] = 00003aff, %l5 = ffffffffffff9c20
	ldsb	[%i1+0x01c],%l5		! %l5 = 0000000000000000

p0_label_145:
!	Mem[00000000211c0000] = ffff0b46, %l5 = 0000000000000000
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010141400] = ffff0000, %l4 = 0000000000000000
	ldsba	[%i5+0x002]%asi,%l4	! %l4 = 0000000000000000
!	%l0 = 0000000000ff0000, Mem[0000000010181410] = 0000f800
	stha	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	Mem[000000001004141c] = 00003aff, %l2 = ffffffffffffffff
	ldub	[%i1+0x01f],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030141400] = 6bb30828, %l4 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000028
!	Mem[00000000100c1408] = 00000000, %l3 = 00000000000000f8
	lduba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 939c958c, %l3 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l3	! %l3 = ffffffffffff958c
!	Mem[0000000030101410] = 7a000000, %l0 = 0000000000ff0000
	lduba	[%i4+%o5]0x81,%l0	! %l0 = 000000000000007a
!	Mem[0000000010181408] = 939c958c, %l1 = 00000000ff0000ff
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 00000000939c958c
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 82884aff, %l6 = 000000000000ff00
	swapa	[%i1+%o4]0x88,%l6	! %l6 = 0000000082884aff

p0_label_146:
!	%l3 = ffffffffffff958c, Mem[0000000010181410] = 00000000
	stwa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = ffff958c
!	%l6 = 0000000082884aff, Mem[0000000010101410] = 00000000000000ff
	stxa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000082884aff
!	Mem[0000000010041418] = 00000039, %l7 = 4bdf1afe, %l6 = 82884aff
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 0000000000000039
!	%l6 = 0000000000000039, Mem[00000000100c1408] = 131e9dc800000000
	stxa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000039
!	%l4 = 0000000000000028, Mem[00000000211c0001] = ffff0b46, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff280b46
!	Mem[0000000030041400] = 127b3130, %l4 = 0000000000000028
	swapa	[%i1+%g0]0x81,%l4	! %l4 = 00000000127b3130
!	%f8  = b5211312 44e2925c, Mem[0000000010081410] = ff000000 79e6b3f6
	stda	%f8 ,[%i2+%o5]0x80	! Mem[0000000010081410] = b5211312 44e2925c
!	Mem[0000000010181408] = 939c958c, %l7 = 000000004bdf1afe
	swapa	[%i6+%o4]0x88,%l7	! %l7 = 00000000939c958c
!	%l2 = 000000ff, %l3 = ffff958c, Mem[0000000030101400] = dd000000 423eddb4
	stda	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff ffff958c
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %f9  = 44e2925c
	lda	[%i3+%o4]0x81,%f9 	! %f9 = 00000000

p0_label_147:
!	Mem[00000000100c1414] = f8000000, %f8  = b5211312
	ld	[%i3+0x014],%f8 	! %f8 = f8000000
!	Mem[0000000010181410] = 8c95ffff 00000000, %l0 = 0000007a, %l1 = 939c958c
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 000000008c95ffff 0000000000000000
!	Mem[000000001014143c] = 0000de9c, %l0 = 000000008c95ffff
	lduwa	[%i5+0x03c]%asi,%l0	! %l0 = 000000000000de9c
!	Mem[0000000030081410] = 00000026, %l2 = 00000000000000ff
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000026
!	Mem[0000000030101408] = 8c959c93 00c8f1ff, %l6 = 00000039, %l7 = 939c958c
	ldda	[%i4+%o4]0x89,%l6	! %l6 = 0000000000c8f1ff 000000008c959c93
!	Mem[00000000100c1400] = 04a405ffffffffff, %l2 = 0000000000000026
	ldxa	[%i3+%g0]0x88,%l2	! %l2 = 04a405ffffffffff
!	Mem[00000000300c1408] = 209cffff00000000, %l5 = 000000000000ffff
	ldxa	[%i3+%o4]0x89,%l5	! %l5 = 209cffff00000000
!	Mem[0000000030081408] = 0000ff00, %l2 = 04a405ffffffffff
	ldsha	[%i2+%o4]0x89,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010101400] = ff510000, %l4 = 00000000127b3130
	ldsha	[%i4+%g0]0x80,%l4	! %l4 = ffffffffffffff51
!	Starting 10 instruction Store Burst
!	%l0 = 0000de9c, %l1 = 00000000, Mem[0000000030001410] = fff1c800 8e00b88a
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000de9c 00000000

p0_label_148:
!	%l0 = 000000000000de9c, Mem[00000000300c1408] = 00000000ffff9c20
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000000000de9c
!	Mem[0000000010141400] = ffff0000, %l6 = 0000000000c8f1ff
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 00000000ffff0000
!	%l4 = ffffffffffffff51, Mem[0000000010001400] = 0000000038000000
	stxa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffffffffff51
!	%l2 = ffffffffffffff00, Mem[00000000300c1400] = ff0000ff
	stwa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffff00
!	%l6 = ffff0000, %l7 = 8c959c93, Mem[0000000010081410] = b5211312 44e2925c
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = ffff0000 8c959c93
!	Mem[0000000010101408] = 00000038, %l7 = 000000008c959c93
	swap	[%i4+%o4],%l7		! %l7 = 0000000000000038
!	%l1 = 0000000000000000, Mem[0000000010141410] = 00ff000080000000
	stxa	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	%l6 = 00000000ffff0000, Mem[0000000010041400] = ffffffff
	stwa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = ffff0000
!	%f20 = 9cdef36b 332e64f0, Mem[00000000300c1410] = 55000000 ad050000
	stda	%f20,[%i3+%o5]0x89	! Mem[00000000300c1410] = 9cdef36b 332e64f0
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffffffff, %l1 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffffff

p0_label_149:
!	Mem[0000000010101430] = 0000001e, %l1 = ffffffffffffffff
	ldswa	[%i4+0x030]%asi,%l1	! %l1 = 000000000000001e
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 000000000000de9c
	setx	0x2a03c4f859172f24,%g7,%l0 ! %l0 = 2a03c4f859172f24
!	%l1 = 000000000000001e
	setx	0x33e753af99b31f81,%g7,%l1 ! %l1 = 33e753af99b31f81
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2a03c4f859172f24
	setx	0x2e617b67a474ad4e,%g7,%l0 ! %l0 = 2e617b67a474ad4e
!	%l1 = 33e753af99b31f81
	setx	0x96267ea7d4ab78bc,%g7,%l1 ! %l1 = 96267ea7d4ab78bc
!	Mem[0000000010041428] = ffff4e20 389824ba, %l4 = ffffff51, %l5 = 00000000
	ldd	[%i1+0x028],%l4		! %l4 = 00000000ffff4e20 00000000389824ba
!	Mem[0000000030181408] = e361a5c0, %l1 = 96267ea7d4ab78bc
	ldsha	[%i6+%o4]0x89,%l1	! %l1 = ffffffffffffa5c0
!	Mem[0000000030041410] = 00000038, %l6 = 00000000ffff0000
	lduha	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = f8000026 6bb30828, %l0 = a474ad4e, %l1 = ffffa5c0
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 00000000f8000026 000000006bb30828
!	Mem[0000000010081430] = 04a405ff, %l3 = ffffffffffff958c
	ldsb	[%i2+0x033],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030041410] = 00000038, %l3 = ffffffffffffffff
	lduha	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 939c958c, %l3 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l3	! %l3 = ffffffffffffff8c
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffff00, Mem[0000000030181410] = 00ff0000
	stba	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00ff0000

p0_label_150:
!	Mem[0000000021800001] = 59940c06, %l7 = 0000000000000038
	ldstub	[%o3+0x001],%l7		! %l7 = 00000094000000ff
!	Mem[0000000030181400] = 00c8ff00, %l4 = 00000000ffff4e20
	ldstuba	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000000000000094, Mem[0000000030101408] = fff1c800
	stha	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 0094c800
!	%f30 = 00000026 6bb30828, Mem[0000000030101408] = 0094c800 939c958c
	stda	%f30,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000026 6bb30828
!	%l0 = 00000000f8000026, Mem[0000000010041406] = ffffffff, %asi = 80
	stha	%l0,[%i1+0x006]%asi	! Mem[0000000010041404] = ffff0026
!	Randomly selected nop
	nop
!	Mem[0000000030101400] = 000000ff, %l7 = 0000000000000094
	ldstuba	[%i4+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010141405] = ad050000, %l3 = ffffffffffffff8c
	ldstuba	[%i5+0x005]%asi,%l3	! %l3 = 00000005000000ff
!	Mem[0000000010041400] = 0000ffff, %l1 = 000000006bb30828
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 000000000000ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000039, %l6 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000039

p0_label_151:
!	Mem[0000000010081430] = 04a405ff000052ff, %f2  = 8c959c93 00c8f1ff
	ldda	[%i2+0x030]%asi,%f2 	! %f2  = 04a405ff 000052ff
!	Mem[0000000010101408] = 8c959c93, %l7 = 00000000000000ff
	ldsha	[%i4+%o4]0x80,%l7	! %l7 = ffffffffffff8c95
!	Mem[0000000010001400] = ffffffff, %l7 = ffffffffffff8c95
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 00000000ffffffff
!	Mem[00000000100c142c] = de9c3d4c, %l6 = 0000000000000039
	ldsw	[%i3+0x02c],%l6		! %l6 = ffffffffde9c3d4c
!	%f8  = f8000000, %f23 = 96c8ddf2
	fsqrts	%f8 ,%f23		! %f23 = 7fffffff
!	Mem[00000000100c1428] = 1c5151ffde9c3d4c, %l0 = 00000000f8000026
	ldx	[%i3+0x028],%l0		! %l0 = 1c5151ffde9c3d4c
!	Mem[0000000010001408] = 2808b36b 260000f8, %l2 = ffffff00, %l3 = 00000005
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 00000000260000f8 000000002808b36b
!	Mem[0000000010001410] = fff1c80012ff12ff, %f12 = dd005994 79e6b3f6
	ldda	[%i0+%o5]0x80,%f12	! %f12 = fff1c800 12ff12ff
!	Mem[0000000030041410] = 38000000, %l0 = 1c5151ffde9c3d4c
	ldsba	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = b6b000ff, %l4 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 000000ff000000ff

p0_label_152:
!	%f18 = 00000000 131e5782, Mem[00000000100c1408] = 39000000 00000000
	stda	%f18,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 131e5782
!	Mem[0000000030081408] = 00ff0000, %l4 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[000000001010142c] = 0000ffff, %l3 = 000000002808b36b, %asi = 80
	swapa	[%i4+0x02c]%asi,%l3	! %l3 = 000000000000ffff
!	%l3 = 000000000000ffff, Mem[0000000030081408] = ffff0000
	stba	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = ffff0000
!	%l3 = 000000000000ffff, Mem[0000000010141422] = 5c243826
	sth	%l3,[%i5+0x022]		! Mem[0000000010141420] = 5c24ffff
!	Mem[0000000010181410] = ffff958c, %l2 = 00000000260000f8
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 0000008c000000ff
!	Mem[00000000201c0001] = ffff367d, %l0 = 0000000000000000
	ldstub	[%o0+0x001],%l0		! %l0 = 000000ff000000ff
!	%l1 = 000000000000ffff, Mem[0000000010081414] = 8c959c93, %asi = 80
	stha	%l1,[%i2+0x014]%asi	! Mem[0000000010081414] = ffff9c93
!	%l1 = 000000000000ffff, Mem[00000000211c0000] = ff280b46
	stb	%l1,[%o2+%g0]		! Mem[00000000211c0000] = ff280b46
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 0000ff00, %l2 = 000000000000008c
	lduwa	[%i6+%o5]0x81,%l2	! %l2 = 000000000000ff00

p0_label_153:
!	Mem[0000000030041408] = 8c959c93 f9c39c20, %l2 = 0000ff00, %l3 = 0000ffff
	ldda	[%i1+%o4]0x89,%l2	! %l2 = 00000000f9c39c20 000000008c959c93
!	Mem[00000000100c1410] = 000000f800000000, %f24 = ffffffff e07aeb14
	ldda	[%i3+%o5]0x88,%f24	! %f24 = 000000f8 00000000
!	Mem[0000000010081410] = 0000ffff, %l6 = ffffffffde9c3d4c
	ldsha	[%i2+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101408] = 26000000, %l4 = 0000000000000000
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = ffffffff, %l5 = 00000000389824ba
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 000000000000ffff
!	Mem[0000000020800040] = 00f89e9b, %l5 = 000000000000ffff
	lduh	[%o1+0x040],%l5		! %l5 = 00000000000000f8
!	Mem[0000000030101400] = ff000000, %l7 = 00000000ffffffff
	ldswa	[%i4+%g0]0x81,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010181410] = ff95ffff, %l4 = 0000000000000000
	ldsb	[%i6+0x012],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010041410] = ff817381, %l3 = 000000008c959c93
	lduba	[%i1+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 8c959c93, %l7 = ffffffffff000000
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 000000008c959c93

p0_label_154:
!	%l2 = 00000000f9c39c20, Mem[00000000100c1408] = 82571e1300000000
	stxa	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000f9c39c20
!	%l0 = 000000ff, %l1 = 0000ffff, Mem[0000000030181410] = 0000ff00 4bdf1afe
	stda	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff 0000ffff
!	Mem[0000000030001410] = 0000de9c, %l0 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l2 = 00000000f9c39c20, Mem[000000001008140e] = 939c958c, %asi = 80
	stha	%l2,[%i2+0x00e]%asi	! Mem[000000001008140c] = 939c9c20
!	%l6 = ffffffff, %l7 = 8c959c93, Mem[0000000010181418] = 00000024 f80000f8
	std	%l6,[%i6+0x018]		! Mem[0000000010181418] = ffffffff 8c959c93
!	Mem[00000000211c0000] = ff280b46, %l6 = ffffffffffffffff
	ldstub	[%o2+%g0],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000010141408] = fff1c800, %l7 = 000000008c959c93
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	%l5 = 00000000000000f8, Mem[0000000010041410] = 817381ff
	stba	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 817381f8
!	%l3 = 00000000000000ff, Mem[0000000030001400] = e07aeb140000ffff
	stxa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff280b46, %l6 = 00000000000000ff
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000ff28

p0_label_155:
!	Mem[00000000211c0000] = ff280b46, %l6 = 000000000000ff28
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000ff28
!	Mem[0000000010001410] = fff1c800, %l4 = ffffffffffffffff
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = fffffffffff1c800
!	Mem[0000000030181410] = ffff0000 ff000000, %l2 = f9c39c20, %l3 = 000000ff
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000ff000000 00000000ffff0000
!	Mem[0000000010101438] = 9cdef36b0000007a, %l7 = 00000000000000ff
	ldxa	[%i4+0x038]%asi,%l7	! %l7 = 9cdef36b0000007a
!	Mem[0000000030041400] = 28000000, %f21 = 332e64f0
	lda	[%i1+%g0]0x89,%f21	! %f21 = 28000000
!	Mem[0000000010181400] = 209cc3f9, %l7 = 9cdef36b0000007a
	ldsha	[%i6+%g0]0x80,%l7	! %l7 = 000000000000209c
!	Mem[0000000010041408] = e58502840000ff00, %f28 = a9082ba8 e9fe3f34
	ldda	[%i1+%o4]0x88,%f28	! %f28 = e5850284 0000ff00
!	Mem[0000000010101408] = 000000ff, %l7 = 000000000000209c
	ldsha	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1400] = ffffff00, %f14 = 802db715
	lda	[%i3+%g0]0x89,%f14	! %f14 = ffffff00
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000f8, Mem[0000000010141408] = fff1c8002e2caf12
	stxa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000f8

p0_label_156:
!	Mem[0000000010101438] = 9cdef36b, %l2 = 00000000ff000000
	swap	[%i4+0x038],%l2		! %l2 = 000000009cdef36b
!	%l2 = 000000009cdef36b, Mem[0000000030041400] = 00000028
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = f36b0028
!	Mem[0000000010081400] = ffffffff, %l3 = 00000000ffff0000
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ffffffff
!	%l0 = 0000000000000000, Mem[0000000010181430] = 00ffff83
	stw	%l0,[%i6+0x030]		! Mem[0000000010181430] = 00000000
!	%f10 = e07aeb14 102d5128, %l1 = 000000000000ffff
!	Mem[0000000010101438] = ff0000000000007a
	add	%i4,0x038,%g1
	stda	%f10,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010101438] = 28512d1014eb7ae0
!	Mem[00000000100c1400] = ffffffff, %l2 = 000000009cdef36b
	swapa	[%i3+%g0]0x88,%l2	! %l2 = 00000000ffffffff
!	%l7 = 00000000000000ff, Mem[00000000300c1408] = 00000000
	stha	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ff0000
!	Mem[0000000030181400] = ffffc800, %l4 = fffffffffff1c800
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000010141428] = 38642e33, %asi = 80
	stha	%l0,[%i5+0x028]%asi	! Mem[0000000010141428] = 00002e33
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = 33f7bf7c, %l3 = 00000000ffffffff
	lduh	[%o3+0x0c0],%l3		! %l3 = 00000000000033f7

p0_label_157:
!	Mem[0000000030041410] = 38000000, %l4 = 00000000000000ff
	lduha	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141424] = ff51511c, %l0 = 0000000000000000
	ldsb	[%i5+0x027],%l0		! %l0 = 000000000000001c
!	Mem[00000000100c1408] = f9c39c20, %l2 = 00000000ffffffff
	lduba	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000020
!	Mem[0000000030041408] = 209cc3f9939c958c, %l7 = 00000000000000ff
	ldxa	[%i1+%o4]0x81,%l7	! %l7 = 209cc3f9939c958c
!	Mem[0000000010041430] = 9a51ffb0, %l4 = 0000000000000000
	ldsha	[%i1+0x032]%asi,%l4	! %l4 = ffffffffffffffb0
!	Mem[0000000010041410] = 817381f8, %l0 = 000000000000001c
	lduba	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000f8
!	Mem[0000000010101408] = ff000000, %l7 = 209cc3f9939c958c
	ldsha	[%i4+%o4]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010001424] = f9009c20, %l5 = 00000000000000f8
	ldswa	[%i0+0x024]%asi,%l5	! %l5 = fffffffff9009c20
!	%f14 = ffffff00, Mem[0000000030181408] = e361a5c0
	sta	%f14,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffff00
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000020, Mem[0000000030081408] = ffff0000
	stwa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000020

p0_label_158:
!	Mem[00000000100c1410] = 00000000, %l5 = fffffffff9009c20
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%l4 = ffffffffffffffb0, Mem[000000001014140f] = 000000f8, %asi = 80
	stba	%l4,[%i5+0x00f]%asi	! Mem[000000001014140c] = 000000b0
!	Mem[0000000030101410] = 0000007a, %l1 = 000000000000ffff
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 0000007a000000ff
!	%l2 = 0000000000000020, Mem[00000000100c1412] = f9009c20, %asi = 80
	stha	%l2,[%i3+0x012]%asi	! Mem[00000000100c1410] = f9000020
!	%l1 = 000000000000007a, Mem[0000000010181400] = f9c39c20
	stwa	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000007a
!	%l2 = 0000000000000020, Mem[0000000010181428] = 9cdef36b332e64f0, %asi = 80
	stxa	%l2,[%i6+0x028]%asi	! Mem[0000000010181428] = 0000000000000020
!	%f0  = 00000038, Mem[0000000030001400] = 000000ff
	sta	%f0 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000038
!	%l2 = 0000000000000020, Mem[0000000010181433] = 00000000
	stb	%l2,[%i6+0x033]		! Mem[0000000010181430] = 00000020
!	Mem[00000000100c1410] = f9000020, %l4 = ffffffffffffffb0
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 00000000f9000020
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_159:
!	Mem[0000000010101408] = ff000000, %f17 = 4d816a89
	lda	[%i4+%o4]0x80,%f17	! %f17 = ff000000
!	Mem[0000000030141408] = ff000039, %l4 = 00000000f9000020
	lduha	[%i5+%o4]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010081430] = 04a405ff, %f19 = 131e5782
	ld	[%i2+0x030],%f19	! %f19 = 04a405ff
!	Mem[0000000010181408] = fe1adf4b, %l2 = 0000000000000020
	lduba	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000fe
!	Mem[0000000010001408] = f8000026, %l7 = ffffffffffffff00
	lduh	[%i0+%o4],%l7		! %l7 = 000000000000f800
!	Mem[0000000030001410] = ff00de9c, %l0 = 00000000000000f8
	ldswa	[%i0+%o5]0x81,%l0	! %l0 = ffffffffff00de9c
!	Mem[00000000100c1400] = 6bf3de9c, %l6 = 000000000000ff28
	ldsba	[%i3+%g0]0x80,%l6	! %l6 = 000000000000006b
!	Mem[0000000010101408] = ff000000, %l2 = 00000000000000fe
	ldswa	[%i4+%o4]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010081408] = 0000ffff, %l0 = ffffffffff00de9c
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 0000ffff, %l6 = 000000000000006b
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 00000000000000ff

p0_label_160:
!	%l4 = 0000ff00, %l5 = 00000000, Mem[0000000030101410] = 000000ff 5c2438bb
	stda	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000ff00 00000000
!	%l4 = 000000000000ff00, Mem[0000000010141408] = 00000000
	stba	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%f4  = 5c2438bb ff000000, Mem[0000000010101410] = 82884aff 00000000
	stda	%f4 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 5c2438bb ff000000
!	%f26 = fff1c800 2e2caf12, Mem[0000000010001430] = 96c8ddf2 600799bb
	std	%f26,[%i0+0x030]	! Mem[0000000010001430] = fff1c800 2e2caf12
!	%l3 = 00000000000033f7, Mem[00000000300c1408] = 00ff0000
	stwa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000033f7
!	%l4 = 000000000000ff00, Mem[0000000030141400] = 2808b36b30317b12
	stxa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000000000ff00
!	%l2 = ffffffffff000000, Mem[0000000010081408] = ff00ffff939c9c20
	stxa	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffffff000000
!	Mem[0000000030001408] = 12af2c2e, %l6 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 0000000012af2c2e
!	Mem[0000000010001400] = ffffffff, %l3 = 00000000000033f7
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000020, %l4 = 000000000000ff00
	ldsha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000

p0_label_161:
!	Mem[0000000010041410] = f881738139000000, %l0 = 000000000000ffff
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = f881738139000000
!	Code Fragment 4
p0_fragment_3:
!	%l0 = f881738139000000
	setx	0x26ff47306440b029,%g7,%l0 ! %l0 = 26ff47306440b029
!	%l1 = 000000000000007a
	setx	0x97e503dfe71b59ad,%g7,%l1 ! %l1 = 97e503dfe71b59ad
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 26ff47306440b029
	setx	0x19cfdf2f8eb58090,%g7,%l0 ! %l0 = 19cfdf2f8eb58090
!	%l1 = 97e503dfe71b59ad
	setx	0xd319ff2016959084,%g7,%l1 ! %l1 = d319ff2016959084
!	Mem[0000000010141438] = 00000000, %l2 = ffffffffff000000
	ldsw	[%i5+0x038],%l2		! %l2 = 0000000000000000
!	Mem[00000000201c0000] = ffff367d, %l7 = 000000000000f800
	ldsh	[%o0+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030181410] = ff000000, %l1 = d319ff2016959084
	ldsha	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = f9c39c20, %l6 = 0000000012af2c2e
	ldswa	[%i1+%o4]0x89,%l6	! %l6 = fffffffff9c39c20
!	Mem[0000000010041410] = 817381f8, %l4 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l4	! %l4 = 00000000000081f8
!	Mem[0000000010141410] = 00000000, %l3 = 00000000000000ff
	ldswa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181438] = 4cd3adf1, %f23 = 7fffffff
	lda	[%i6+0x038]%asi,%f23	! %f23 = 4cd3adf1
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ff95ffff, %l5 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 00000000ff95ffff

p0_label_162:
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030141410] = ff00b0b6 ffffb88a
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 00000000
!	%l4 = 00000000000081f8, Mem[00000000100c1410] = b0ffffff
	stba	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = b0fffff8
!	%f0  = 00000038 14eb7ae0 04a405ff 000052ff
!	%f4  = 5c2438bb ff000000 e07aeb14 b4225130
!	%f8  = f8000000 00000000 e07aeb14 102d5128
!	%f12 = fff1c800 12ff12ff ffffff00 0054276c
	stda	%f0,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	%f30 = 00000026 6bb30828, %l5 = 00000000ff95ffff
!	Mem[0000000030001438] = e361a5c02808b36b
	add	%i0,0x038,%g1
	stda	%f30,[%g1+%l5]ASI_PST32_S ! Mem[0000000030001438] = 000000266bb30828
!	%f18 = 00000000 04a405ff, Mem[0000000010181410] = 00000000 00000000
	stda	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 04a405ff
!	%l5 = 00000000ff95ffff, Mem[0000000030081410] = 00000026
	stha	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = ffff0026
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 38000000, %l3 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[000000001010141c] = ffc800ff, %l1 = 0000000000000000
	ldstuba	[%i4+0x01c]%asi,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff510000, %f11 = 102d5128
	lda	[%i4+%g0]0x80,%f11	! %f11 = ff510000

p0_label_163:
!	Mem[0000000030141410] = 5c2438bb, %l2 = 0000000000000000
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 000000000000005c
!	Mem[0000000030041410] = 00000038, %l6 = fffffffff9c39c20
	lduha	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 00c8f1ff, %l3 = 0000000000000000
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = 0000000000c8f1ff
!	Mem[0000000030041410] = 38000000, %l4 = 00000000000081f8
	ldsha	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = fff1c800, %l4 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l4	! %l4 = 00000000fff1c800
!	Mem[0000000021800040] = ffffa30e, %l4 = 00000000fff1c800
	ldsh	[%o3+0x040],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010081400] = ffff0000, %l1 = 00000000000000ff
	ldswa	[%i2+0x000]%asi,%l1	! %l1 = ffffffffffff0000
!	Mem[0000000030141408] = ff05a404, %l0 = 19cfdf2f8eb58090
	lduha	[%i5+%o4]0x89,%l0	! %l0 = 000000000000a404
!	Mem[0000000010041408] = 00ff0000840285e5, %f18 = 00000000 04a405ff
	ldda	[%i1+0x008]%asi,%f18	! %f18 = 00ff0000 840285e5
!	Starting 10 instruction Store Burst
!	%f26 = fff1c800 2e2caf12, %l4 = ffffffffffffffff
!	Mem[0000000010081408] = ffffffffff000000
	add	%i2,0x008,%g1
	stda	%f26,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010081408] = 12af2c2e00c8f1ff

p0_label_164:
!	%f10 = e07aeb14 ff510000, Mem[0000000030041408] = 209cc3f9 939c958c
	stda	%f10,[%i1+%o4]0x81	! Mem[0000000030041408] = e07aeb14 ff510000
!	%f26 = fff1c800 2e2caf12, Mem[0000000030181408] = 00ffffff 39000000
	stda	%f26,[%i6+%o4]0x81	! Mem[0000000030181408] = fff1c800 2e2caf12
!	Mem[0000000030001408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%f30 = 00000026 6bb30828, Mem[0000000030001408] = 000000ff 8c959c93
	stda	%f30,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000026 6bb30828
!	Mem[0000000010141410] = 00000000, %l2 = 000000000000005c
	ldstuba	[%i5+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%f22 = 7a4a8882 4cd3adf1, %l2 = 0000000000000000
!	Mem[0000000030001438] = 000000266bb30828
	add	%i0,0x038,%g1
	stda	%f22,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030001438] = 000000266bb30828
!	Mem[0000000030181410] = 000000ff, %l0 = 000000000000a404
	swapa	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001410] = 00c8f1ff, %l2 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 0000000000c8f1ff
!	Mem[00000000100c1428] = 1c5151ffde9c3d4c, %l6 = 0000000000000000, %l6 = 0000000000000000
	add	%i3,0x28,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 1c5151ffde9c3d4c
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = f9c39c20, %l3 = 0000000000c8f1ff
	ldsha	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffff9c20

p0_label_165:
!	Mem[0000000010141400] = 00c8f1ff, %l5 = 00000000ff95ffff
	lduwa	[%i5+%g0]0x80,%l5	! %l5 = 0000000000c8f1ff
!	Mem[0000000010081410] = ffff0000ffff9c93, %l1 = ffffffffffff0000
	ldxa	[%i2+%o5]0x80,%l1	! %l1 = ffff0000ffff9c93
!	Mem[0000000010141400] = 00c8f1ffadff0000, %l0 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l0	! %l0 = 00c8f1ffadff0000
!	Mem[0000000010041408] = 00ff0000, %l4 = ffffffffffffffff
	lduha	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181410] = 04a405ff, %f14 = ffffff00
	lda	[%i6+%o5]0x88,%f14	! %f14 = 04a405ff
!	Mem[0000000021800040] = ffffa30e, %l5 = 0000000000c8f1ff
	ldsb	[%o3+0x041],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000100c1400] = 9cdef36b, %l5 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 0000006b000000ff
!	Mem[0000000030041410] = 00000038, %f29 = 0000ff00
	lda	[%i1+%o5]0x81,%f29	! %f29 = 00000038
!	Mem[00000000100c1410] = f8ffffb0, %f26 = fff1c800
	lda	[%i3+%o5]0x80,%f26	! %f26 = f8ffffb0
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 04a405ff, %l2 = 0000000000c8f1ff
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 000000ff000000ff

p0_label_166:
!	%f4  = 5c2438bb, Mem[0000000030041400] = f36b0028
	sta	%f4 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 5c2438bb
!	%f6  = e07aeb14 b4225130, %l0 = 00c8f1ffadff0000
!	Mem[0000000010081408] = 12af2c2e00c8f1ff
	add	%i2,0x008,%g1
	stda	%f6,[%g1+%l0]ASI_PST16_P ! Mem[0000000010081408] = 12af2c2e00c8f1ff
!	%f2  = 04a405ff 000052ff, Mem[0000000030081408] = 00000020 00000000
	stda	%f2 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 04a405ff 000052ff
!	Mem[0000000010141408] = 00000000, %l5 = 000000000000006b
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000010101400] = 000051ff
	stwa	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	Mem[0000000030141400] = 380000ff, %l1 = ffff0000ffff9c93
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 00000000380000ff
!	%l0 = 00c8f1ffadff0000, Mem[0000000010141408] = 0000006b000000b0
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00c8f1ffadff0000
!	Mem[000000001004141c] = 00003aff, %l7 = ffffffff, %l0 = adff0000
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 0000000000003aff
!	Mem[00000000211c0001] = ff280b46, %l6 = 1c5151ffde9c3d4c
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 00000028000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000, %l1 = 00000000380000ff
	ldsha	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_167:
!	Mem[0000000030141400] = e07aeb14 ffff9c93, %l6 = 00000028, %l7 = ffffffff
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 00000000ffff9c93 00000000e07aeb14
!	Mem[0000000030041410] = 38000000, %l2 = 00000000000000ff
	lduha	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101430] = 0000001eff12ff12, %l0 = 0000000000003aff
	ldxa	[%i4+0x030]%asi,%l0	! %l0 = 0000001eff12ff12
!	Mem[00000000201c0000] = ffff367d, %l4 = 00000000000000ff
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = 00c8f1ff, %l0 = 0000001eff12ff12
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000c8f1ff
!	Mem[0000000010001418] = fe1adf4b, %l2 = 0000000000000000
	lduba	[%i0+0x01b]%asi,%l2	! %l2 = 000000000000004b
!	Mem[0000000010141400] = 00c8f1ff, %l6 = 00000000ffff9c93
	lduwa	[%i5+%g0]0x80,%l6	! %l6 = 0000000000c8f1ff
!	Mem[0000000010081420] = ff570113 131e5782, %l0 = 00c8f1ff, %l1 = 00000000
	ldda	[%i2+0x020]%asi,%l0	! %l0 = 00000000ff570113 00000000131e5782
!	Mem[0000000030001410] = ff00de9c, %l1 = 00000000131e5782
	ldswa	[%i0+%o5]0x81,%l1	! %l1 = ffffffffff00de9c
!	Starting 10 instruction Store Burst
!	%l0 = ff570113, %l1 = ff00de9c, Mem[0000000030081400] = ad050000 ffc9ecf1
	stda	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = ff570113 ff00de9c

p0_label_168:
!	Mem[000000001004142b] = ffff4e20, %l1 = ffffffffff00de9c
	ldstuba	[%i1+0x02b]%asi,%l1	! %l1 = 00000020000000ff
!	%f3  = 000052ff, Mem[0000000030001408] = 2808b36b
	sta	%f3 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 000052ff
!	%l0 = 00000000ff570113, Mem[0000000020800040] = 00f89e9b
	sth	%l0,[%o1+0x040]		! Mem[0000000020800040] = 01139e9b
!	%l6 = 0000000000c8f1ff, Mem[0000000030041408] = e07aeb14
	stwa	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00c8f1ff
!	Mem[0000000010141408] = 00c8f1ff, %l2 = 000000000000004b
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030181408] = fff1c800
	stwa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	Mem[00000000211c0001] = ffff0b46, %l2 = 0000000000000000
	ldstub	[%o2+0x001],%l2		! %l2 = 000000ff000000ff
!	%l2 = 000000ff, %l3 = ffff9c20, Mem[0000000030181410] = 04a40000 ffff0000
	stda	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff ffff9c20
!	%l6 = 0000000000c8f1ff, Mem[0000000010041408] = e58502840000ff00
	stxa	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000c8f1ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 000000ff, %l4 = ffffffffffffffff
	lduwa	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff

p0_label_169:
!	Mem[0000000010141418] = 6bb30828, %l0 = 00000000ff570113
	ldsba	[%i5+0x01a]%asi,%l0	! %l0 = 0000000000000008
!	Mem[000000001018143c] = 131ebcf4, %l5 = 0000000000000000
	lduha	[%i6+0x03e]%asi,%l5	! %l5 = 000000000000bcf4
!	Mem[0000000010001400] = ffffffff, %l0 = 0000000000000008
	lduha	[%i0+%g0]0x88,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010141410] = ff000000, %l3 = ffffffffffff9c20
	lduha	[%i5+%o5]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010041410] = f8817381, %l6 = 0000000000c8f1ff
	lduha	[%i1+0x012]%asi,%l6	! %l6 = 0000000000007381
!	Mem[00000000100c1400] = fff3de9cff05a404, %l5 = 000000000000bcf4
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = fff3de9cff05a404
!	Mem[0000000030081410] = ffff0026, %l0 = 000000000000ffff
	lduwa	[%i2+%o5]0x81,%l0	! %l0 = 00000000ffff0026
!	Mem[0000000010041408] = 00c8f1ff, %f30 = 00000026
	lda	[%i1+%o4]0x88,%f30	! %f30 = 00c8f1ff
!	Mem[0000000030001410] = 9cde00ff, %l1 = 0000000000000020
	lduba	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101430] = 0000001e, %l1 = 000000ff, %l2 = 000000ff
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 000000000000001e

p0_label_170:
!	%f9  = 00000000, Mem[0000000010141408] = fff1c8ff
	sta	%f9 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l0 = 00000000ffff0026, Mem[00000000100c1400] = 9cdef3ff
	stha	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 9cde0026
!	Mem[00000000300c1400] = ffffff00, %l4 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 00000000ffffff00
!	%l4 = ffffff00, %l5 = ff05a404, Mem[0000000010041410] = f8817381 39000000
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffff00 ff05a404
!	%f3  = 000052ff, Mem[0000000010101430] = 0000001e
	st	%f3 ,[%i4+0x030]	! Mem[0000000010101430] = 000052ff
!	%l5 = fff3de9cff05a404, Mem[0000000030001400] = 0000000000000038
	stxa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = fff3de9cff05a404
!	%l0 = ffff0026, %l1 = 000000ff, Mem[00000000100c1408] = 209cc3f9 00000000
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffff0026 000000ff
!	%f18 = 00ff0000 840285e5, Mem[0000000010141418] = 6bb30828 182590ee
	std	%f18,[%i5+0x018]	! Mem[0000000010141418] = 00ff0000 840285e5
!	Mem[0000000010081428] = 28512d10, %l1 = 00000000000000ff
	swap	[%i2+0x028],%l1		! %l1 = 0000000028512d10
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0000ffff, %l1 = 0000000028512d10
	lduba	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000ff

p0_label_171:
!	Mem[0000000020800000] = ffff188e, %l7 = 00000000e07aeb14
	ldsba	[%o1+0x001]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001400] = ffffffff ffffff51, %l4 = ffffff00, %l5 = ff05a404
	ldd	[%i0+%g0],%l4		! %l4 = 00000000ffffffff 00000000ffffff51
!	Mem[00000000300c1400] = 000000ff, %l4 = 00000000ffffffff
	lduha	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = 38000000, %l3 = 000000000000ff00
	ldsha	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l7 = ffffffffffffffff
	lduha	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = 00000000 2e2caf12, %l2 = 0000001e, %l3 = 00000000
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000 000000002e2caf12
!	Mem[0000000030041408] = 00c8f1ff ff510000, %l0 = ffff0026, %l1 = 000000ff
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 0000000000c8f1ff 00000000ff510000
!	Mem[0000000030101400] = 000000ff, %l5 = 00000000ffffff51
	lduwa	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181410] = 04a405ff, %l1 = 00000000ff510000
	lduba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f29 = 00000038, Mem[0000000030181400] = 00c8ffff
	sta	%f29,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000038

p0_label_172:
!	Mem[0000000010001418] = fe1adf4b245c0000, %l5 = 00000000000000ff, %l2 = 0000000000000000
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = fe1adf4b245c0000
!	Mem[0000000030101400] = ff000000, %l5 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	%l2 = 245c0000, %l3 = 2e2caf12, Mem[00000000300c1408] = 000033f7 0000de9c
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 245c0000 2e2caf12
!	%l2 = fe1adf4b245c0000, Mem[0000000010001400] = ffffffff
	stha	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000ffff
!	Mem[0000000030041408] = 00c8f1ff, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 0000000000c8f1ff
!	%l0 = 0000000000c8f1ff, Mem[0000000010101408] = 000000ff
	stha	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000f1ff
!	Mem[0000000030081400] = 130157ff, %l3 = 000000002e2caf12
	ldstuba	[%i2+%g0]0x81,%l3	! %l3 = 00000013000000ff
!	Mem[0000000030141410] = 5c2438bb, %l1 = 00000000000000ff
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 0000005c000000ff
!	%l4 = 00000000000000ff, Mem[0000000030141410] = ff2438bbff000000
	stxa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 2600ffff, %l5 = 00000000ff000000
	ldsha	[%i3+%o4]0x88,%l5	! %l5 = ffffffffffffffff

p0_label_173:
!	Mem[0000000030081410] = 2808b36b2600ffff, %l4 = 00000000000000ff
	ldxa	[%i2+%o5]0x89,%l4	! %l4 = 2808b36b2600ffff
!	Mem[0000000010081400] = ffff0000, %l4 = 2808b36b2600ffff
	lduba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041400] = bb38245c, %l4 = 00000000000000ff
	ldswa	[%i1+%g0]0x89,%l4	! %l4 = ffffffffbb38245c
!	Mem[0000000010081410] = 0000ffff, %f1  = 14eb7ae0
	lda	[%i2+%o5]0x88,%f1 	! %f1 = 0000ffff
!	Mem[0000000021800180] = 53b935e9, %l4 = ffffffffbb38245c
	ldsb	[%o3+0x181],%l4		! %l4 = ffffffffffffffb9
!	Mem[0000000030041408] = 00000000, %l4 = ffffffffffffffb9
	lduwa	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181418] = ffffffff 8c959c93, %l6 = 00007381, %l7 = 00c8f1ff
	ldd	[%i6+0x018],%l6		! %l6 = 00000000ffffffff 000000008c959c93
!	Mem[000000001014140c] = adff0000, %f11 = ff510000
	ld	[%i5+0x00c],%f11	! %f11 = adff0000
!	Mem[00000000211c0000] = ffff0b46, %l6 = 00000000ffffffff
	ldsb	[%o2+%g0],%l6		! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 0000ffff, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 000000000000ffff

p0_label_174:
!	Mem[00000000300c1410] = f0642e33, %l6 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 000000f0000000ff
!	Mem[0000000010141414] = 00000000, %l4 = 0000ffff, %l2 = 245c0000
	add	%i5,0x14,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 0000000000000000
!	%f11 = adff0000, Mem[0000000030141408] = 04a405ff
	sta	%f11,[%i5+%o4]0x81	! Mem[0000000030141408] = adff0000
!	%f2  = 04a405ff, Mem[0000000010141410] = ff000000
	sta	%f2 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 04a405ff
!	Mem[000000001004143c] = 84b1d35a, %l3 = 0000000000000013
	lduwa	[%i1+0x03c]%asi,%l3	! %l3 = 0000000084b1d35a
!	Mem[0000000030101410] = 0000ff00, %l6 = 00000000000000f0
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l4 = 0000ffff, %l5 = ffffffff, Mem[0000000030001408] = 000052ff 26000000
	stda	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000ffff ffffffff
!	%l3 = 0000000084b1d35a, Mem[0000000030181410] = 000000ff
	stba	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000005a
!	%l2 = 00000000, %l3 = 84b1d35a, Mem[0000000030101400] = ff000000 ffff958c
	stda	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 84b1d35a
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0000ffff, %l6 = 0000000000000000
	ldsha	[%i2+%o5]0x88,%l6	! %l6 = ffffffffffffffff

p0_label_175:
!	Mem[0000000030001410] = ff00de9c, %f8  = f8000000
	lda	[%i0+%o5]0x81,%f8 	! %f8 = ff00de9c
!	Mem[00000000300c1410] = 332e64ff, %l3 = 0000000084b1d35a
	lduba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141400] = fff1c800, %f8  = ff00de9c
	lda	[%i5+%g0]0x88,%f8 	! %f8 = fff1c800
!	Mem[0000000010041408] = 0000000000c8f1ff, %f26 = f8ffffb0 2e2caf12
	ldda	[%i1+%o4]0x88,%f26	! %f26 = 00000000 00c8f1ff
!	Mem[0000000010181410] = 04a405ff, %f24 = 000000f8
	lda	[%i6+%o5]0x88,%f24	! %f24 = 04a405ff
!	Mem[0000000030181410] = 5a000000, %l6 = ffffffffffffffff
	ldsha	[%i6+%o5]0x81,%l6	! %l6 = 0000000000005a00
!	Mem[0000000010001400] = 51ffffff00000000, %f30 = 00c8f1ff 6bb30828
	ldda	[%i0+%g0]0x88,%f30	! %f30 = 51ffffff 00000000
!	Mem[0000000030081410] = 2600ffff, %l1 = 000000000000005c
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030001410] = ff00de9c, %l3 = 00000000000000ff
	ldswa	[%i0+%o5]0x81,%l3	! %l3 = ffffffffff00de9c
!	Starting 10 instruction Store Burst
!	%f28 = e5850284 00000038, Mem[0000000010001400] = 00000000 51ffffff
	stda	%f28,[%i0+%g0]0x88	! Mem[0000000010001400] = e5850284 00000038

p0_label_176:
!	%f22 = 7a4a8882 4cd3adf1, Mem[0000000010141408] = 00000000 adff0000
	stda	%f22,[%i5+%o4]0x80	! Mem[0000000010141408] = 7a4a8882 4cd3adf1
!	%l3 = ffffffffff00de9c, Mem[0000000010141410] = ff05a404
	stba	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = ff05a49c
!	Mem[0000000010041400] = 2808b36b, %l7 = 000000008c959c93
	swapa	[%i1+%g0]0x88,%l7	! %l7 = 000000002808b36b
!	Mem[00000000100c143c] = 2e2c0000, %l4 = 000000000000ffff
	ldstuba	[%i3+0x03c]%asi,%l4	! %l4 = 0000002e000000ff
!	%l5 = ffffffffffffffff, Mem[00000000300c1410] = 332e64ff
	stwa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffff
!	Mem[0000000030181408] = 00000000, %l4 = 000000000000002e
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%f15 = 0054276c, Mem[0000000010041400] = 8c959c93
	sta	%f15,[%i1+%g0]0x88	! Mem[0000000010041400] = 0054276c
!	Mem[00000000100c142c] = de9c3d4c, %l3 = ff00de9c, %l3 = ff00de9c
	add	%i3,0x2c,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 00000000de9c3d4c
!	Mem[000000001008140c] = 00c8f1ff, %l7 = 2808b36b, %l6 = 00005a00
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 0000000000c8f1ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000, %l5 = ffffffffffffffff
	ldsba	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_177:
!	Mem[0000000010101408] = fff100000000006e, %l5 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l5	! %l5 = fff100000000006e
!	Mem[0000000010181414] = 00000000, %l1 = 00000000000000ff
	ldsw	[%i6+0x014],%l1		! %l1 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l7 = 000000002808b36b
	lduwa	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 7a4a8882, %f21 = 28000000
	lda	[%i5+%o4]0x80,%f21	! %f21 = 7a4a8882
!	Mem[0000000010041410] = 04a405ff00ffffff, %f10 = e07aeb14 adff0000
	ldda	[%i1+%o5]0x88,%f10	! %f10 = 04a405ff 00ffffff
!	Mem[0000000010181408] = fe1adf4b, %l4 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 00000000000000fe
!	Mem[00000000300c1400] = 000000ff, %l3 = 00000000de9c3d4c
	ldswa	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141408] = adff0000, %l3 = 00000000000000ff
	ldsba	[%i5+%o4]0x81,%l3	! %l3 = ffffffffffffffad
!	Mem[0000000010181410] = 04a405ff, %f17 = ff000000
	lda	[%i6+%o5]0x88,%f17	! %f17 = 04a405ff
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffad, Mem[0000000030001410] = ff00de9c
	stwa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffad

p0_label_178:
!	Mem[0000000010081408] = 2e2caf12, %l5 = fff100000000006e
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 00000012000000ff
!	Mem[0000000030181400] = 00000038, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 00000038000000ff
!	Mem[00000000211c0001] = ffff0b46, %l0 = 0000000000c8f1ff
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030101408] = 26000000, %l7 = 0000000000000038
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 0000000026000000
!	%f12 = fff1c800, %f2  = 04a405ff 000052ff
	fitod	%f12,%f2 		! %f2  = c12c7000 00000000
!	%f8  = fff1c800 00000000, Mem[0000000010041438] = 260726bb 84b1d35a
	std	%f8 ,[%i1+0x038]	! Mem[0000000010041438] = fff1c800 00000000
!	%l4 = 00000000000000fe, Mem[0000000010101410] = ff000000
	stba	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = ff0000fe
!	Mem[00000000100c142e] = de9c3d4c, %l1 = 0000000000000000
	ldstub	[%i3+0x02e],%l1		! %l1 = 0000003d000000ff
!	Mem[0000000030181408] = 0000002e, %l7 = 0000000026000000
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 6a3ae6e1, %l7 = 0000000000000000
	ldsha	[%o3+0x140]%asi,%l7	! %l7 = 0000000000006a3a

p0_label_179:
!	Mem[0000000030181408] = 12af2c2e2e0000ff, %f12 = fff1c800 12ff12ff
	ldda	[%i6+%o4]0x89,%f12	! %f12 = 12af2c2e 2e0000ff
!	Mem[0000000010041410] = 00ffffff, %l7 = 0000000000006a3a
	ldswa	[%i1+%o5]0x88,%l7	! %l7 = 0000000000ffffff
!	Mem[0000000030181408] = ff00002e2e2caf12, %f4  = 5c2438bb ff000000
	ldda	[%i6+%o4]0x81,%f4 	! %f4  = ff00002e 2e2caf12
!	Mem[0000000030001400] = ff05a404, %l1 = 000000000000003d
	lduha	[%i0+%g0]0x89,%l1	! %l1 = 000000000000a404
!	Mem[0000000010081408] = ffaf2c2e, %l6 = 0000000000c8f1ff
	ldsba	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = ff05a404, %l0 = 00000000000000ff
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = ffffffffff05a404
!	Mem[0000000030041408] = 00000000ff510000, %f26 = 00000000 00c8f1ff
	ldda	[%i1+%o4]0x81,%f26	! %f26 = 00000000 ff510000
!	Mem[0000000030081408] = ff05a404, %l6 = ffffffffffffffff
	lduwa	[%i2+%o4]0x89,%l6	! %l6 = 00000000ff05a404
!	Mem[0000000010081400] = ffff0000, %l3 = ffffffffffffffad
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = ffffffffffff0000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = fff1c800, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 000000ff000000ff

p0_label_180:
!	%f20 = 9cdef36b 7a4a8882, Mem[0000000030141400] = ffff9c93 e07aeb14
	stda	%f20,[%i5+%g0]0x89	! Mem[0000000030141400] = 9cdef36b 7a4a8882
!	%l3 = ffffffffffff0000, Mem[00000000300c1400] = ff000000
	stha	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l5 = 0000000000000012, Mem[00000000201c0000] = ffff367d
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 0012367d
!	Mem[00000000100c1420] = 60079900, %l1 = 000000000000a404
	swap	[%i3+0x020],%l1		! %l1 = 0000000060079900
!	%l1 = 0000000060079900, Mem[00000000201c0001] = 0012367d
	stb	%l1,[%o0+0x001]		! Mem[00000000201c0000] = 0000367d
!	%f24 = 04a405ff 00000000, %l5 = 0000000000000012
!	Mem[0000000010081438] = 4a39581eff000000
	add	%i2,0x038,%g1
	stda	%f24,[%g1+%l5]ASI_PST8_P ! Mem[0000000010081438] = 4a3958ffff000000
!	Mem[0000000010081408] = ffaf2c2e, %l0 = ffffffffff05a404
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000300c1410] = ffffffff, %l2 = 00000000000000ff
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 00000000ffffffff
!	%l4 = 00000000000000fe, Mem[0000000030101400] = 84b1d35a00000000
	stxa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000000000fe
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 7a000000, %l1 = 0000000060079900
	lduwa	[%i6+%g0]0x80,%l1	! %l1 = 000000007a000000

p0_label_181:
!	Mem[00000000100c1408] = 2600ffff, %l4 = 00000000000000fe
	lduba	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101404] = 00000000, %l4 = 000000ff, %l4 = 000000ff
	add	%i4,0x04,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = ff000000, %l2 = 00000000ffffffff
	lduba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = 000000ff, %l1 = 000000007a000000
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081400] = ff0157ff, %l4 = 0000000000000000
	ldsba	[%i2+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041428] = ffff4eff389824ba, %l5 = 0000000000000012
	ldxa	[%i1+0x028]%asi,%l5	! %l5 = ffff4eff389824ba
!	Mem[0000000030041408] = 00000000, %l6 = 00000000ff05a404
	lduwa	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = 5a000000 209cffff, %l2 = 000000ff, %l3 = ffff0000
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 000000005a000000 00000000209cffff
!	Mem[0000000030041400] = bb38245c, %l1 = 00000000000000ff
	ldswa	[%i1+%g0]0x89,%l1	! %l1 = ffffffffbb38245c
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 5c2438bb, %l0 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l0	! %l0 = 000000005c2438bb

p0_label_182:
!	%f26 = 00000000 ff510000, Mem[0000000010081400] = ffff0000 ffffffff
	stda	%f26,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 ff510000
!	%l2 = 000000005a000000, Mem[0000000030041400] = 000000ff
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	%f26 = 00000000, Mem[0000000010001400] = 38000000
	sta	%f26,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l4 = ffffffffffffffff, Mem[0000000010001408] = f8000026
	stwa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff
!	%l4 = ffffffffffffffff, Mem[0000000010181408] = 82571e134bdf1afe
	stxa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffffffffffff
!	Mem[0000000030081408] = 04a405ff, %l0 = 000000005c2438bb
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 00000004000000ff
!	Mem[0000000021800181] = 53b935e9, %l6 = 0000000000000000
	ldstuba	[%o3+0x181]%asi,%l6	! %l6 = 000000b9000000ff
!	Mem[0000000010181410] = ff05a404, %l6 = 00000000000000b9
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff05a404
!	Mem[00000000201c0001] = 0000367d, %l6 = 00000000ff05a404
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%f26 = 00000000 ff510000, Mem[0000000010101408] = fff10000 0000006e
	stda	%f26,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 ff510000

p0_label_183:
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010101400] = ff000000 00000000 00000000 ff510000
!	Mem[0000000010101410] = fe0000ff bb38245c 00000000 ffc800ff
!	Mem[0000000010101420] = 9cdef36b 332e64f0 00ff0000 2808b36b
!	Mem[0000000010101430] = 000052ff ff12ff12 28512d10 14eb7ae0
	ldda	[%i4]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400
!	Mem[0000000010041424] = 5ae85f11, %l2 = 000000005a000000
	ldsb	[%i1+0x025],%l2		! %l2 = ffffffffffffffe8
!	Mem[000000001004141c] = 00003aff, %l4 = ffffffffffffffff
	ldsba	[%i1+0x01d]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %l5 = ffff4eff389824ba
	ldswa	[%i4+%g0]0x80,%l5	! %l5 = ffffffffff000000
!	Mem[00000000300c1410] = ff000000, %l5 = ffffffffff000000
	lduba	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = 2e2cafff, %l5 = 0000000000000000
	ldsba	[%i2+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101410] = 0000ffff, %l0 = 0000000000000004
	ldsba	[%i4+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041410] = 00000038, %f0  = 00000038
	lda	[%i1+%o5]0x81,%f0 	! %f0 = 00000038
!	Mem[0000000030101408] = 38000000, %f14 = 04a405ff
	lda	[%i4+%o4]0x81,%f14	! %f14 = 38000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010141430] = ffffffff, %asi = 80
	stwa	%l4,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000000

p0_label_184:
!	%l2 = ffffffe8, %l3 = 209cffff, Mem[0000000010041408] = 00c8f1ff 00000000
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffe8 209cffff
!	%f14 = 38000000 0054276c, Mem[0000000010141400] = 00c8f1ff adff0000
	stda	%f14,[%i5+%g0]0x80	! Mem[0000000010141400] = 38000000 0054276c
!	%l0 = ffffffffffffffff, Mem[0000000010041410] = ffffff00
	stha	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffff00
!	%f9  = 00000000, Mem[0000000030101408] = 38000000
	sta	%f9 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[0000000010041425] = 5ae85f11, %l4 = 0000000000000000
	ldstuba	[%i1+0x025]%asi,%l4	! %l4 = 000000e8000000ff
!	%f13 = 2e0000ff, Mem[000000001000141c] = 245c0000
	sta	%f13,[%i0+0x01c]%asi	! Mem[000000001000141c] = 2e0000ff
!	Mem[0000000030001400] = ff05a404, %l0 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x89,%l0	! %l0 = 00000004000000ff
!	%l5 = ffffffffffffffff, Mem[0000000030001400] = ffa405ff
	stba	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = ffa405ff
	membar	#Sync			! Added by membar checker (30)
!	%f11 = 00ffffff, Mem[0000000010101410] = ff0000fe
	sta	%f11,[%i4+%o5]0x88	! Mem[0000000010101410] = 00ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = af0c07600000007a, %l3 = 00000000209cffff
	ldxa	[%i6+%g0]0x88,%l3	! %l3 = af0c07600000007a

p0_label_185:
!	Mem[0000000010001400] = 00000000, %l2 = ffffffffffffffe8
	ldswa	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081434] = 000052ff, %l7 = 0000000000ffffff
	lduw	[%i2+0x034],%l7		! %l7 = 00000000000052ff
!	Mem[0000000010081418] = 305122b414eb7ae0, %f28 = 000052ff ff12ff12
	ldda	[%i2+0x018]%asi,%f28	! %f28 = 305122b4 14eb7ae0
!	Mem[0000000010141428] = 00002e33, %l5 = ffffffffffffffff
	lduwa	[%i5+0x028]%asi,%l5	! %l5 = 0000000000002e33
!	Mem[0000000030141408] = adff0000, %f3  = 00000000
	lda	[%i5+%o4]0x81,%f3 	! %f3 = adff0000
!	Mem[0000000010041408] = e8ffffff, %l3 = af0c07600000007a
	ldsba	[%i1+%o4]0x80,%l3	! %l3 = ffffffffffffffe8
!	Mem[00000000211c0000] = ffff0b46, %l0 = 0000000000000004
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = 0000007a, %l5 = 0000000000002e33
	ldsha	[%i6+%g0]0x88,%l5	! %l5 = 000000000000007a
!	Mem[0000000030041408] = 00000000, %l0 = 00000000000000ff
	lduwa	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 2600ffff, %l1 = ffffffffbb38245c
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 000000002600ffff

p0_label_186:
!	%l1 = 000000002600ffff, Mem[0000000010041408] = ffffffe8
	stwa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 2600ffff
!	%f30 = 28512d10, Mem[00000000100c140c] = 000000ff
	st	%f30,[%i3+0x00c]	! Mem[00000000100c140c] = 28512d10
!	Mem[0000000010081421] = ff570113, %l2 = 0000000000000000
	ldstuba	[%i2+0x021]%asi,%l2	! %l2 = 00000057000000ff
!	Mem[0000000021800100] = ffa56996, %l6 = 0000000000000000
	ldstuba	[%o3+0x100]%asi,%l6	! %l6 = 000000ff000000ff
!	%l2 = 0000000000000057, Mem[00000000100c1408] = 2600ffff
	stba	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 2600ff57
!	Mem[0000000030081408] = ff05a4ff, %l1 = 000000002600ffff
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010101408] = 00000000, %l1 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081435] = 000052ff, %l1 = 0000000000000000
	ldstub	[%i2+0x035],%l1		! %l1 = 00000000000000ff
!	%f6  = e07aeb14 b4225130, Mem[0000000030081400] = ff0157ff 9cde00ff
	stda	%f6 ,[%i2+%g0]0x81	! Mem[0000000030081400] = e07aeb14 b4225130
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 000000ff, %l3 = ffffffffffffffe8
	lduha	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff

p0_label_187:
!	Mem[00000000300c1408] = 245c0000, %l3 = 00000000000000ff
	lduba	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000024
!	Mem[0000000010001434] = 2e2caf12, %l6 = 00000000000000ff
	lduw	[%i0+0x034],%l6		! %l6 = 000000002e2caf12
!	Mem[00000000211c0000] = ffff0b46, %l2 = 0000000000000057
	lduh	[%o2+%g0],%l2		! %l2 = 000000000000ffff
!	Mem[00000000300c1400] = 00000000, %l6 = 000000002e2caf12
	lduwa	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %f21 = bb38245c
	lda	[%i3+%g0]0x81,%f21	! %f21 = 00000000
!	Mem[0000000030141408] = adff0000000052ff, %f18 = 00000000 ff510000
	ldda	[%i5+%o4]0x81,%f18	! %f18 = adff0000 000052ff
!	Mem[0000000030141408] = adff0000, %l7 = 00000000000052ff
	lduba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ad
!	Mem[0000000010001438] = 00000000000005ad, %l2 = 000000000000ffff
	ldx	[%i0+0x038],%l2		! %l2 = 00000000000005ad
!	Mem[0000000010181400] = 0000007a, %l3 = 0000000000000024
	lduba	[%i6+%g0]0x88,%l3	! %l3 = 000000000000007a
!	Starting 10 instruction Store Burst
!	%f24 = 9cdef36b 332e64f0, Mem[0000000010101408] = 000000ff 000051ff
	stda	%f24,[%i4+%o4]0x88	! Mem[0000000010101408] = 9cdef36b 332e64f0

p0_label_188:
!	%f2  = c12c7000 adff0000, %l6 = 0000000000000000
!	Mem[0000000010081418] = 305122b414eb7ae0
	add	%i2,0x018,%g1
	stda	%f2,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010081418] = 305122b414eb7ae0
!	Mem[00000000100c1408] = 2600ff57, %l5 = 000000000000007a
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 000000002600ff57
!	%l5 = 000000002600ff57, Mem[000000001018142a] = 00000000
	stb	%l5,[%i6+0x02a]		! Mem[0000000010181428] = 00005700
!	%l1 = 0000000000000000, Mem[0000000030101410] = ffff0000
	stba	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ff0000
!	%f31 = 14eb7ae0, Mem[00000000100c1438] = ff817381
	sta	%f31,[%i3+0x038]%asi	! Mem[00000000100c1438] = 14eb7ae0
!	%l1 = 0000000000000000, Mem[0000000021800180] = 53ff35e9, %asi = 80
	stha	%l1,[%o3+0x180]%asi	! Mem[0000000021800180] = 000035e9
!	Mem[0000000030081400] = e07aeb14, %l5 = 000000002600ff57
	swapa	[%i2+%g0]0x81,%l5	! %l5 = 00000000e07aeb14
!	Mem[0000000010141410] = ff05a49c, %l2 = 00000000000005ad
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 00000000ff05a49c
!	Mem[0000000030001408] = ffff0000, %l7 = 00000000000000ad
	swapa	[%i0+%o4]0x89,%l7	! %l7 = 00000000ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 000005ad, %l5 = 00000000e07aeb14
	ldsba	[%i5+%o5]0x88,%l5	! %l5 = ffffffffffffffad

p0_label_189:
!	Mem[00000000100c1408] = 0000007a, %l3 = 000000000000007a
	lduba	[%i3+%o4]0x88,%l3	! %l3 = 000000000000007a
!	Mem[0000000030141410] = ff00000000000000, %f18 = adff0000 000052ff
	ldda	[%i5+%o5]0x89,%f18	! %f18 = ff000000 00000000
!	Mem[00000000100c1400] = 2600de9c, %l0 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000026
!	Mem[0000000021800080] = 05ad32fb, %l4 = 00000000000000e8
	lduha	[%o3+0x080]%asi,%l4	! %l4 = 00000000000005ad
!	Mem[0000000030181410] = 5a000000, %l0 = 0000000000000026
	ldswa	[%i6+%o5]0x81,%l0	! %l0 = 000000005a000000
!	Mem[0000000010041404] = ffff0026, %l1 = 0000000000000000
	ldsw	[%i1+0x004],%l1		! %l1 = ffffffffffff0026
!	Mem[00000000100c1430] = c89d1e13, %l5 = ffffffffffffffad
	ldub	[%i3+0x030],%l5		! %l5 = 00000000000000c8
!	Mem[00000000300c1408] = 00005c24, %l4 = 00000000000005ad
	lduwa	[%i3+%o4]0x89,%l4	! %l4 = 0000000000005c24
!	Mem[0000000010141400] = 6c275400 00000038, %l2 = ff05a49c, %l3 = 0000007a
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000038 000000006c275400
!	Starting 10 instruction Store Burst
!	%l0 = 000000005a000000, Mem[0000000010081400] = 00000000ff510000
	stx	%l0,[%i2+%g0]		! Mem[0000000010081400] = 000000005a000000

p0_label_190:
!	Mem[0000000010101400] = ff000000, %l0 = 000000005a000000
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000201c0000] = 00ff367d, %l5 = 00000000000000c8
	ldstub	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030001410] = adffffff
	stha	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = adff0000
!	%f20 = fe0000ff 00000000, Mem[0000000010081408] = ffaf2c2e 00c8f1ff
	stda	%f20,[%i2+%o4]0x80	! Mem[0000000010081408] = fe0000ff 00000000
!	%l4 = 0000000000005c24, Mem[0000000030041410] = 00000038
	stwa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00005c24
!	Mem[0000000030001410] = adff0000, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%l0 = 000000ff, %l1 = ffff0026, Mem[0000000010141400] = 38000000 0054276c
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff ffff0026
!	%l3 = 000000006c275400, Mem[0000000010001410] = 0000000012ff12ff
	stxa	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000006c275400
!	%l1 = ffffffffffff0026, Mem[0000000030141400] = 9cdef36b7a4a8882
	stxa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffffffff0026
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 127b3130 00000000, %l2 = 00000038, %l3 = 6c275400
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000 00000000127b3130

p0_label_191:
!	Mem[00000000100c1408] = 7a000000, %l4 = 0000000000005c24
	lduha	[%i3+%o4]0x80,%l4	! %l4 = 0000000000007a00
!	Mem[00000000100c1408] = 0000007a, %f21 = 00000000
	lda	[%i3+%o4]0x88,%f21	! %f21 = 0000007a
!	Mem[0000000010001400] = 00000000, %l4 = 0000000000007a00
	lduba	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[000000001018141c] = 8c959c93, %l0 = 00000000000000ff
	ldswa	[%i6+0x01c]%asi,%l0	! %l0 = ffffffff8c959c93
!	Mem[0000000010041410] = 00ffffff, %l6 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l6	! %l6 = 0000000000ffffff
!	Mem[0000000030141400] = 2600ffffffffffff, %l4 = 0000000000000000
	ldxa	[%i5+%g0]0x81,%l4	! %l4 = 2600ffffffffffff
!	Mem[0000000030101400] = fe000000, %f21 = 0000007a
	lda	[%i4+%g0]0x81,%f21	! %f21 = fe000000
!	Mem[0000000010141410] = 000005ad, %l0 = ffffffff8c959c93
	lduha	[%i5+%o5]0x88,%l0	! %l0 = 00000000000005ad
!	Mem[00000000100c1424] = 13014cc9, %l1 = ffffffffffff0026
	ldswa	[%i3+0x024]%asi,%l1	! %l1 = 0000000013014cc9
!	Starting 10 instruction Store Burst
!	Mem[00000000100c140c] = 28512d10, %l6 = 0000000000ffffff
	ldstuba	[%i3+0x00c]%asi,%l6	! %l6 = 00000028000000ff

p0_label_192:
!	%l5 = 0000000000000000, Mem[00000000201c0000] = ffff367d, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000367d
!	%l0 = 000005ad, %l1 = 13014cc9, Mem[0000000030141410] = 00000000 000000ff
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 000005ad 13014cc9
!	%l2 = 0000000000000000, Mem[0000000030041408] = 00000000
	stba	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000010041438] = fff1c800 00000000
	std	%l4,[%i1+0x038]		! Mem[0000000010041438] = ffffffff 00000000
!	Mem[0000000030001400] = ff05a4ff, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 00000000ff05a4ff
!	%l7 = 00000000ffff0000, Mem[0000000010181410] = 000000b900000000
	stxa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000ffff0000
!	%l0 = 00000000000005ad, Mem[0000000030141400] = ffffffffffff0026
	stxa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000000005ad
!	%f23 = ffc800ff, Mem[0000000010141400] = 000000ff
	sta	%f23,[%i5+%g0]0x80	! Mem[0000000010141400] = ffc800ff
!	%l7 = 00000000ffff0000, Mem[000000001004143e] = 00000000, %asi = 80
	stha	%l7,[%i1+0x03e]%asi	! Mem[000000001004143c] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ad000000ffffffff, %l2 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l2	! %l2 = ad000000ffffffff

p0_label_193:
!	Mem[0000000030041400] = ff000000, %l6 = 0000000000000028
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030081410] = 2808b36bbb38245c, %l2 = ad000000ffffffff
	ldxa	[%i2+%o5]0x89,%l2	! %l2 = 2808b36bbb38245c
!	Mem[0000000030141400] = ad050000, %f22 = 00000000
	lda	[%i5+%g0]0x81,%f22	! %f22 = ad050000
!	Mem[00000000100c1400] = 9cde0026, %l6 = ffffffffff000000
	ldsha	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000026
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 00000000000005ad
	setx	0x417580e7c6425057,%g7,%l0 ! %l0 = 417580e7c6425057
!	%l1 = 0000000013014cc9
	setx	0xa77bcb1ff113517a,%g7,%l1 ! %l1 = a77bcb1ff113517a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 417580e7c6425057
	setx	0xfc55e810768c3dd7,%g7,%l0 ! %l0 = fc55e810768c3dd7
!	%l1 = a77bcb1ff113517a
	setx	0x8d6e1157a7bc33bd,%g7,%l1 ! %l1 = 8d6e1157a7bc33bd
!	Mem[0000000010041408] = 209cffff2600ffff, %f30 = 28512d10 14eb7ae0
	ldda	[%i1+%o4]0x88,%f30	! %f30 = 209cffff 2600ffff
!	Mem[0000000010001408] = ffffffff, %l4 = 2600ffffffffffff
	ldsw	[%i0+%o4],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030081400] = 2600ff57b4225130, %f2  = c12c7000 adff0000
	ldda	[%i2+%g0]0x81,%f2 	! %f2  = 2600ff57 b4225130
!	Mem[0000000030001408] = ad000000, %l2 = 2808b36bbb38245c
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = ffffffffad000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000026, Mem[00000000201c0000] = 0000367d
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 0026367d

p0_label_194:
!	Mem[0000000010181400] = 7a000000, %l2 = ffffffffad000000, %asi = 80
	swapa	[%i6+0x000]%asi,%l2	! %l2 = 000000007a000000
!	%l3 = 00000000127b3130, Mem[0000000010081410] = 0000ffff
	stwa	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 127b3130
!	%f16 = ff000000 00000000, Mem[0000000030181410] = 0000005a ffff9c20
	stda	%f16,[%i6+%o5]0x89	! Mem[0000000030181410] = ff000000 00000000
!	%f14 = 38000000 0054276c, %l2 = 000000007a000000
!	Mem[0000000030181428] = fe747889f8dd2622
	add	%i6,0x028,%g1
	stda	%f14,[%g1+%l2]ASI_PST8_S ! Mem[0000000030181428] = fe747889f8dd2622
!	%l3 = 00000000127b3130, Mem[00000000100c1400] = 9cde0026
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 127b3130
!	Mem[0000000030181408] = ff00002e, %l5 = 00000000ff05a4ff
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010081410] = 127b3130, %l4 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 00000030000000ff
!	%l5 = 00000000000000ff, Mem[00000000100c1408] = 7a000000
	stba	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff000000
!	%l3 = 00000000127b3130, Mem[0000000010081400] = 00000000, %asi = 80
	stba	%l3,[%i2+0x000]%asi	! Mem[0000000010081400] = 30000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ffc800ff, %l2 = 000000007a000000
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = ffffffffffffffff

p0_label_195:
!	Mem[0000000030081410] = 5c2438bb6bb30828, %f24 = 9cdef36b 332e64f0
	ldda	[%i2+%o5]0x81,%f24	! %f24 = 5c2438bb 6bb30828
!	Mem[00000000300c1400] = 00000000, %l5 = 00000000000000ff
	lduha	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 00005c24, %f25 = 6bb30828
	lda	[%i1+%o5]0x81,%f25	! %f25 = 00005c24
!	Mem[0000000030081400] = 57ff0026, %l7 = 00000000ffff0000
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000026
!	Mem[0000000030001400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l5 = 0000000000000000
	ldsba	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 0026367d, %l2 = ffffffffffffffff
	ldub	[%o0+0x001],%l2		! %l2 = 0000000000000026
!	Mem[0000000020800040] = 01139e9b, %l3 = 00000000127b3130
	lduba	[%o1+0x041]%asi,%l3	! %l3 = 0000000000000013
!	Mem[0000000010081408] = fe0000ff, %l7 = 0000000000000026
	ldsha	[%i2+%o4]0x80,%l7	! %l7 = fffffffffffffe00
!	Starting 10 instruction Store Burst
!	%l4 = 00000030, %l5 = 00000000, Mem[0000000010101408] = f0642e33 6bf3de9c
	std	%l4,[%i4+%o4]		! Mem[0000000010101408] = 00000030 00000000

p0_label_196:
!	%l7 = fffffffffffffe00, Mem[0000000010101400] = 000000ff
	stha	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000fe00
!	%l2 = 00000026, %l3 = 00000013, Mem[0000000030181400] = 000000ff ffffffff
	stda	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000026 00000013
!	Mem[0000000010001410] = 00000000, %l7 = fffffffffffffe00
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l4 = 00000030, %l5 = 00000000, Mem[0000000030181410] = 00000000 ff000000
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000030 00000000
!	%l0 = 768c3dd7, %l1 = a7bc33bd, Mem[00000000100c1410] = f8ffffb0 f8000000
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 768c3dd7 a7bc33bd
!	%f16 = ff000000 00000000 ff000000 00000000
!	%f20 = fe0000ff fe000000 ad050000 ffc800ff
!	%f24 = 5c2438bb 00005c24 00ff0000 2808b36b
!	%f28 = 305122b4 14eb7ae0 209cffff 2600ffff
	stda	%f16,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
!	%l4 = 0000000000000030, Mem[000000001004140e] = ffff9c20, %asi = 80
	stha	%l4,[%i1+0x00e]%asi	! Mem[000000001004140c] = ffff0030
!	Mem[0000000010181410] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041424] = 5aff5f11, %l6 = 00000026, %l1 = a7bc33bd
	add	%i1,0x24,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 000000005aff5f11
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 0054276c, %l6 = 0000000000000026
	lduha	[%i1+%g0]0x88,%l6	! %l6 = 000000000000276c

p0_label_197:
!	Mem[00000000100c1410] = d73d8c76, %f8  = fff1c800
	lda	[%i3+%o5]0x88,%f8 	! %f8 = d73d8c76
!	Mem[00000000100c1400] = 30317b12, %l1 = 000000005aff5f11
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 0000000030317b12
!	Mem[00000000100c1410] = d73d8c76, %f7  = b4225130
	lda	[%i3+%o5]0x88,%f7 	! %f7 = d73d8c76
!	Mem[0000000010141408] = 7a4a88824cd3adf1, %l4 = 0000000000000030
	ldx	[%i5+%o4],%l4		! %l4 = 7a4a88824cd3adf1
!	Mem[0000000030001408] = 000000ad, %l4 = 7a4a88824cd3adf1
	lduwa	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ad
!	Mem[0000000010041410] = ffffff00 ff05a404, %l0 = 768c3dd7, %l1 = 30317b12
	ldd	[%i1+%o5],%l0		! %l0 = 00000000ffffff00 00000000ff05a404
!	Mem[0000000030181410] = 0000000000000030, %f4  = ff00002e 2e2caf12
	ldda	[%i6+%o5]0x89,%f4 	! %f4  = 00000000 00000030
!	Mem[00000000100c1408] = 102d51ff000000ff, %f6  = e07aeb14 d73d8c76
	ldda	[%i3+%o4]0x88,%f6 	! %f6  = 102d51ff 000000ff
!	Mem[0000000010041408] = 2600ffff, %l6 = 000000000000276c
	ldsba	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f10 = 04a405ff 00ffffff, Mem[0000000010181400] = ad000000 60070caf
	stda	%f10,[%i6+0x000]%asi	! Mem[0000000010181400] = 04a405ff 00ffffff

p0_label_198:
!	%l2 = 00000026, %l3 = 00000013, Mem[0000000030041408] = 00000000 ff510000
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000026 00000013
!	%l7 = 0000000000000000, Mem[0000000030001410] = adff00ff
	stwa	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%f14 = 38000000 0054276c, Mem[0000000010001410] = fffffe00 0054276c
	stda	%f14,[%i0+%o5]0x88	! Mem[0000000010001410] = 38000000 0054276c
!	%f2  = 2600ff57, Mem[0000000010101400] = 00fe0000
	sta	%f2 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 2600ff57
!	Mem[0000000030001410] = 00000000, %l7 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 000000ff, %l5 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = fe000000, %l0 = 00000000ffffff00
	swapa	[%i4+%g0]0x81,%l0	! %l0 = 00000000fe000000
!	Mem[0000000010101410] = 00ffffff, %l6 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%f7  = 000000ff, Mem[0000000010101400] = 57ff0026
	sta	%f7 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00ff000000000000, %l7 = 0000000000000000
	ldxa	[%i4+%o5]0x81,%l7	! %l7 = 00ff000000000000

p0_label_199:
!	Mem[0000000030041410] = 00005c24, %l0 = 00000000fe000000
	lduwa	[%i1+%o5]0x81,%l0	! %l0 = 0000000000005c24
!	Mem[0000000020800000] = ffff188e, %l2 = 0000000000000026
	lduba	[%o1+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141414] = 00000000, %l0 = 0000000000005c24
	lduw	[%i5+0x014],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181410] = 00000000 ffff0000, %l4 = 000000ad, %l5 = 000000ff
	ldd	[%i6+%o5],%l4		! %l4 = 0000000000000000 00000000ffff0000
!	Mem[0000000030041408] = 00000026, %l6 = 00000000000000ff
	ldsha	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = 2600ff57 b4225130, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 000000002600ff57 00000000b4225130
!	%f15 = 0054276c, Mem[0000000010141420] = 5c24ffff
	st	%f15,[%i5+0x020]	! Mem[0000000010141420] = 0054276c
!	Mem[0000000030041408] = 26000000, %l3 = 0000000000000013
	ldsha	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = adff0000, %l1 = 00000000ff05a404
	lduwa	[%i5+%o4]0x81,%l1	! %l1 = 00000000adff0000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101428] = 00ff00002808b36b, %l3 = 0000000000000000, %l1 = 00000000adff0000
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = 00ff00002808b36b

p0_label_200:
!	%f8  = d73d8c76, Mem[0000000010141410] = 000005ad
	sta	%f8 ,[%i5+%o5]0x88	! Mem[0000000010141410] = d73d8c76
!	%l6 = 000000002600ff57, Mem[0000000030141408] = 0000ffad
	stha	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000ff57
!	%l4 = 00000000, %l5 = ffff0000, Mem[00000000300c1408] = 00005c24 12af2c2e
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 ffff0000
!	%l3 = 0000000000000000, Mem[0000000030181408] = ff00002e
	stha	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000002e
!	Mem[00000000300c1410] = 00000000, %l5 = 00000000ffff0000
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%f0  = 00000038 0000ffff 2600ff57 b4225130
!	%f4  = 00000000 00000030 102d51ff 000000ff
!	%f8  = d73d8c76 00000000 04a405ff 00ffffff
!	%f12 = 12af2c2e 2e0000ff 38000000 0054276c
	stda	%f0,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	%l6 = 000000002600ff57, Mem[0000000010081410] = fe0000fffe000000
	stxa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000002600ff57
!	%f18 = ff000000, Mem[00000000100c1400] = 00000038
	sta	%f18,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff000000
!	Mem[0000000010001408] = ffffffff, %l4 = 0000000000000000, %asi = 80
	swapa	[%i0+0x008]%asi,%l4	! %l4 = 00000000ffffffff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (31)
!	Mem[00000000100c1438] = 38000000, %l2 = 00000000000000ff
	ldsw	[%i3+0x038],%l2		! %l2 = 0000000038000000

p0_label_201:
!	Mem[0000000010001400] = 00000000, %f24 = 5c2438bb
	lda	[%i0+%g0]0x80,%f24	! %f24 = 00000000
!	Mem[0000000030001400] = 00000000, %l0 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 26000000, %l0 = 0000000000000000
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000026
!	Mem[0000000010081428] = 6bb30828, %l4 = 00000000ffffffff
	lduw	[%i2+0x028],%l4		! %l4 = 000000006bb30828
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 0000000000000026
	setx	0x954c2bdfd2ba52d3,%g7,%l0 ! %l0 = 954c2bdfd2ba52d3
!	%l1 = 00ff00002808b36b
	setx	0x945cc167ce1ee002,%g7,%l1 ! %l1 = 945cc167ce1ee002
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 954c2bdfd2ba52d3
	setx	0xc70bc30fbb2816cc,%g7,%l0 ! %l0 = c70bc30fbb2816cc
!	%l1 = 945cc167ce1ee002
	setx	0x9683ca7029e41984,%g7,%l1 ! %l1 = 9683ca7029e41984
!	Mem[0000000030141400] = ad050000, %l0 = c70bc30fbb2816cc
	ldsha	[%i5+%g0]0x81,%l0	! %l0 = ffffffffffffad05
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000000000
	ldsba	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l7 = 00000000b4225130
	ldsba	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 000000ff000000ff

p0_label_202:
!	Mem[00000000100c141d] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i3+0x01d]%asi,%l3	! %l3 = 00000000000000ff
!	%l0 = ffffad05, %l1 = 29e41984, Mem[0000000010081410] = 57ff0026 00000000
	stda	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffad05 29e41984
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 82884a7a, %l1 = 9683ca7029e41984
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 0000000082884a7a
!	Mem[000000001008142e] = 0000ff00, %l4 = 000000006bb30828
	ldstub	[%i2+0x02e],%l4		! %l4 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[0000000010041410] = ffffff00
	stwa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	Mem[0000000010141434] = 1e000000, %l4 = 00000000000000ff
	ldstub	[%i5+0x034],%l4		! %l4 = 0000001e000000ff
!	Mem[00000000300c1408] = 00000000, %l6 = 000000002600ff57
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010041428] = ffff4eff389824ba, %asi = 80
	stxa	%l5,[%i1+0x028]%asi	! Mem[0000000010041428] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 000000ff ff0000ff 00000026 00000013
!	Mem[0000000030041410] = 00005c24 14eb7ae0 0cad4189 4bdf1afe
!	Mem[0000000030041420] = 209cc3f9 a9150caf 343f80e9 b6b000ff
!	Mem[0000000030041430] = 00000000 000000ff ff004e20 303ac9ff
	ldda	[%i1]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030041400

p0_label_203:
!	Mem[0000000010181408] = ffffffffffffffff, %l1 = 0000000082884a7a
	ldx	[%i6+%o4],%l1		! %l1 = ffffffffffffffff
!	Mem[00000000300c1400] = 00000000, %l4 = 000000000000001e
	lduba	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %l4 = 0000000000000000
	ldsba	[%i4+0x001]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = 9cdef36b000000ff, %l0 = ffffffffffffad05
	ldxa	[%i3+%o5]0x89,%l0	! %l0 = 9cdef36b000000ff
!	Mem[0000000030101400] = 0000000000ffffff, %f18 = ff000000 00000000
	ldda	[%i4+%g0]0x89,%f18	! %f18 = 00000000 00ffffff
!	Mem[0000000030141410] = c94c0113 ad050000, %l0 = 000000ff, %l1 = ffffffff
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 00000000ad050000 00000000c94c0113
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 00000000ad050000
	setx	0x9482850802043bac,%g7,%l0 ! %l0 = 9482850802043bac
!	%l1 = 00000000c94c0113
	setx	0xbddd970fb479f31a,%g7,%l1 ! %l1 = bddd970fb479f31a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9482850802043bac
	setx	0xc38369902ab37ef2,%g7,%l0 ! %l0 = c38369902ab37ef2
!	%l1 = bddd970fb479f31a
	setx	0x13f579805a1e1026,%g7,%l1 ! %l1 = 13f579805a1e1026
!	Mem[0000000030101408] = 00000000 6bb30828, %l2 = 38000000, %l3 = 00000000
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000 000000006bb30828
!	Mem[00000000211c0000] = ffff0b46, %l0 = c38369902ab37ef2
	ldsh	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (32)
!	%l2 = 00000000, %l3 = 6bb30828, Mem[0000000030041408] = 00000026 00000013
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 6bb30828

p0_label_204:
!	%l4 = 0000000000000000, Mem[0000000020800000] = ffff188e, %asi = 80
	stha	%l4,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000188e
!	%l3 = 000000006bb30828, Mem[0000000010101410] = 5c2438bb00ffffff
	stxa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000006bb30828
!	Mem[0000000030181408] = 2e000000, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 000000002e000000
!	Mem[0000000030041400] = 000000ff, %l0 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%f0  = ff0000ff ff000000, Mem[0000000030041408] = 00000000 6bb30828
	stda	%f0 ,[%i1+%o4]0x81	! Mem[0000000030041408] = ff0000ff ff000000
!	Mem[0000000030101400] = 00ffffff, %l0 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 0000000000ffffff
!	%f16 = ff000000 00000000, %l6 = 0000000000000000
!	Mem[0000000010101430] = 000052ffff12ff12
	add	%i4,0x030,%g1
	stda	%f16,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010101430] = 000052ffff12ff12
!	%f23 = ffc800ff, Mem[0000000010101408] = 30000000
	sta	%f23,[%i4+%o4]0x88	! Mem[0000000010101408] = ffc800ff
!	%f28 = 305122b4 14eb7ae0, Mem[0000000010101410] = 2808b36b 00000000
	stda	%f28,[%i4+%o5]0x80	! Mem[0000000010101410] = 305122b4 14eb7ae0
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = ffa56996, %l6 = 0000000000000000
	ldub	[%o3+0x101],%l6		! %l6 = 00000000000000a5

p0_label_205:
!	Mem[0000000010101410] = b4225130, %f8  = af0c15a9
	lda	[%i4+%o5]0x88,%f8 	! %f8 = b4225130
!	Mem[00000000100c1410] = 00000000, %f23 = ffc800ff
	lda	[%i3+%o5]0x88,%f23	! %f23 = 00000000
!	Mem[0000000030001400] = 00000000, %l5 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = 6c275400, %l7 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l7	! %l7 = 000000006c275400
!	Mem[0000000030001408] = ad000000, %l2 = 0000000000000000
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = ffffffffad000000
!	Mem[0000000030181408] = 00000000, %f18 = 00000000
	lda	[%i6+%o4]0x89,%f18	! %f18 = 00000000
!	Mem[0000000030141400] = ad050000, %l6 = 00000000000000a5
	lduwa	[%i5+%g0]0x81,%l6	! %l6 = 00000000ad050000
!	Mem[0000000030141408] = 57ff0000, %l3 = 000000006bb30828
	ldsha	[%i5+%o4]0x81,%l3	! %l3 = 00000000000057ff
!	Mem[00000000100c1410] = 3000000000000000, %f4  = e07aeb14 245c0000
	ldda	[%i3+%o5]0x88,%f4 	! %f4  = 30000000 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ad050000, Mem[0000000010081400] = 00000000
	stw	%l6,[%i2+%g0]		! Mem[0000000010081400] = ad050000

p0_label_206:
!	%l7 = 000000006c275400, Mem[0000000030141410] = ad050000
	stwa	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 6c275400
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000000057ff
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = ffc800ff, %l0 = 0000000000ffffff
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 00000000ffc800ff
!	%f28 = 305122b4, Mem[0000000010001424] = f9009c20
	st	%f28,[%i0+0x024]	! Mem[0000000010001424] = 305122b4
!	%l7 = 000000006c275400, Mem[00000000100c1408] = 2600ff57
	stba	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000ff57
!	Mem[0000000010001430] = fff1c800, %l5 = 0000000000000000, %asi = 80
	swapa	[%i0+0x030]%asi,%l5	! %l5 = 00000000fff1c800
!	%l7 = 000000006c275400, Mem[00000000100c1408] = 57ff0000
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 57ff0000
!	%l5 = 00000000fff1c800, Mem[0000000010181410] = 00000000
	stba	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%l1 = 13f579805a1e1026, Mem[0000000010101400] = ff00000000000000
	stxa	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 13f579805a1e1026
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000, %l4 = 000000002e000000
	ldsha	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_207:
!	Mem[0000000010041408] = ffff0026, %l1 = 13f579805a1e1026
	lduwa	[%i1+%o4]0x80,%l1	! %l1 = 00000000ffff0026
!	Mem[0000000030081410] = 2808b36bbb38245c, %l3 = 0000000000000000
	ldxa	[%i2+%o5]0x89,%l3	! %l3 = 2808b36bbb38245c
!	Mem[0000000030001410] = 00000000, %f18 = 00000000
	lda	[%i0+%o5]0x81,%f18	! %f18 = 00000000
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = ffc800ff, %l3 = 2808b36bbb38245c
	ldsba	[%i5+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081410] = 05adffff, %l3 = ffffffffffffffff
	ldsha	[%i2+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001408] = 00000000, %l4 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041410] = e07aeb14245c0000, %l2 = ffffffffad000000
	ldxa	[%i1+%o5]0x89,%l2	! %l2 = e07aeb14245c0000
!	Mem[0000000010181400] = ff05a404, %l3 = ffffffffffffffff
	lduba	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000004
!	Starting 10 instruction Store Burst
!	%f13 = 00000000, Mem[0000000010101410] = 305122b4
	st	%f13,[%i4+%o5]		! Mem[0000000010101410] = 00000000

p0_label_208:
!	%l7 = 000000006c275400, Mem[0000000010101410] = 0000000014eb7ae0
	stxa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000006c275400
!	%f16 = ff000000 00000000 00000000 00ffffff
!	%f20 = fe0000ff fe000000 ad050000 00000000
!	%f24 = 00000000 00005c24 00ff0000 2808b36b
!	%f28 = 305122b4 14eb7ae0 209cffff 2600ffff
	stda	%f16,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	Mem[00000000201c0000] = 0026367d, %l1 = 00000000ffff0026
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[00000000300c1410] = ff000000
	stwa	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%l0 = ffc800ff, %l1 = 00000000, Mem[0000000010101438] = 28512d10 14eb7ae0
	std	%l0,[%i4+0x038]		! Mem[0000000010101438] = ffc800ff 00000000
!	%f4  = 30000000, Mem[0000000030181400] = 00000026
	sta	%f4 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 30000000
!	%f14 = ffc93a30 204e00ff, %l1 = 0000000000000000
!	Mem[0000000030041408] = ff0000ffff000000
	add	%i1,0x008,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_S ! Mem[0000000030041408] = ff0000ffff000000
!	%f16 = ff000000 00000000 00000000 00ffffff
!	%f20 = fe0000ff fe000000 ad050000 00000000
!	%f24 = 00000000 00005c24 00ff0000 2808b36b
!	%f28 = 305122b4 14eb7ae0 209cffff 2600ffff
	stda	%f16,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	%f0  = ff0000ff, Mem[0000000030041400] = ff0000ff
	sta	%f0 ,[%i1+%g0]0x89	! Mem[0000000030041400] = ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 2600ff57, %l5 = 00000000fff1c800
	lduwa	[%i3+%o4]0x81,%l5	! %l5 = 000000002600ff57

p0_label_209:
!	Mem[0000000010181408] = ffffffff, %l1 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010041400] = 6c275400, %l7 = 000000006c275400
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = 000000000000006c
!	Mem[0000000030181400] = 30000000, %l2 = e07aeb14245c0000
	ldsba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000218000c0] = 33f7bf7c, %l0 = 00000000ffc800ff
	lduha	[%o3+0x0c0]%asi,%l0	! %l0 = 00000000000033f7
!	Mem[0000000010101418] = 00000000, %f4  = 30000000
	ld	[%i4+0x018],%f4 	! %f4 = 00000000
!	%f8  = b4225130, %f4  = 00000000
	fitos	%f8 ,%f4 		! %f4  = ce97bb5e
!	Mem[0000000010181400] = 04a405ff, %l3 = 0000000000000004
	ldsw	[%i6+%g0],%l3		! %l3 = 0000000004a405ff
!	Mem[0000000030001408] = ad000000, %l4 = 0000000000000000
	ldswa	[%i0+%o4]0x81,%l4	! %l4 = ffffffffad000000
!	Mem[00000000201c0000] = ff26367d, %l3 = 0000000004a405ff
	ldsba	[%o0+0x001]%asi,%l3	! %l3 = 0000000000000026
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 00000000, %l1 = 000000000000ffff
	swapa	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_210:
	membar	#Sync			! Added by membar checker (33)
!	Mem[00000000100c1400] = ff000000, %l0 = 00000000000033f7
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	%l6 = 00000000ad050000, Mem[000000001018143c] = 131ebcf4
	stw	%l6,[%i6+0x03c]		! Mem[000000001018143c] = ad050000
!	%f10 = ff00b0b6 e9803f34, Mem[0000000030141410] = fe000000 fe0000ff
	stda	%f10,[%i5+%o5]0x89	! Mem[0000000030141410] = ff00b0b6 e9803f34
!	Mem[0000000010181410] = 00000000, %l2 = 0000000000000000
	swap	[%i6+%o5],%l2		! %l2 = 0000000000000000
!	%f14 = ffc93a30 204e00ff, %l3 = 0000000000000026
!	Mem[0000000030101408] = 000000006bb30828
	add	%i4,0x008,%g1
	stda	%f14,[%g1+%l3]ASI_PST16_S ! Mem[0000000030101408] = 00003a30204e0828
!	%f5  = 00000000, Mem[0000000010081408] = 00000000
	st	%f5 ,[%i2+%o4]		! Mem[0000000010081408] = 00000000
!	Mem[0000000010101400] = 13f579805a1e1026, %l7 = 000000000000006c, %l6 = 00000000ad050000
	casxa	[%i4]0x80,%l7,%l6	! %l6 = 13f579805a1e1026
!	%f20 = fe0000ff fe000000, %l3 = 0000000000000026
!	Mem[0000000010101438] = ffc800ff00000000
	add	%i4,0x038,%g1
	stda	%f20,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010101438] = ff0000ff00000000
!	Mem[0000000030141400] = 00000000, %l6 = 13f579805a1e1026
	swapa	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffff0000, %f22 = ad050000
	ld	[%i0+%o4],%f22	! %f22 = ffff0000

p0_label_211:
!	Mem[0000000030001410] = 00000000, %l5 = 000000002600ff57
	ldswa	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = ffff0000, %l7 = 000000000000006c
	lduwa	[%i0+%o4]0x80,%l7	! %l7 = 00000000ffff0000
!	Mem[0000000010181408] = ffffffff, %l5 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041410] = 00000000 ff05a404, %l2 = 00000000, %l3 = 00000026
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000 00000000ff05a404
!	Mem[0000000010081410] = ffffad0529e41984, %f14 = ffc93a30 204e00ff
	ldda	[%i2+%o5]0x80,%f14	! %f14 = ffffad05 29e41984
!	Mem[0000000030181408] = 00000000, %l4 = ffffffffad000000
	ldsba	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = bb38245c, %l0 = 00000000ff000000
	lduwa	[%i2+%o5]0x89,%l0	! %l0 = 00000000bb38245c
!	Mem[0000000030081410] = 5c2438bb, %l0 = 00000000bb38245c
	lduba	[%i2+%o5]0x81,%l0	! %l0 = 000000000000005c
!	Mem[0000000010041410] = 00000000, %l7 = 00000000ffff0000
	lduha	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = 13000000, Mem[0000000010001408] = 0000ffff
	sta	%f2 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 13000000

p0_label_212:
!	Mem[0000000010081400] = ad050000, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 000000ad000000ff
!	%l5 = ffffffffffffffff, Mem[0000000010101400] = 8079f513
	stba	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 8079f5ff
!	%f6  = fe1adf4b 8941ad0c, Mem[0000000010141410] = 768c3dd7 00000000
	stda	%f6 ,[%i5+%o5]0x80	! Mem[0000000010141410] = fe1adf4b 8941ad0c
!	%f16 = ff000000 00000000 00000000 00ffffff
!	%f20 = fe0000ff fe000000 ffff0000 00000000
!	%f24 = 00000000 00005c24 00ff0000 2808b36b
!	%f28 = 305122b4 14eb7ae0 209cffff 2600ffff
	stda	%f16,[%i3]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	%f14 = ffffad05 29e41984, Mem[0000000030101400] = 00000000 00000000
	stda	%f14,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffad05 29e41984
!	Mem[0000000010181408] = ffffffff, %l3 = 00000000ff05a404
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030001400] = 00000000 fff3de9c
	stda	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 00000000
!	Mem[0000000020800000] = 0000188e, %l0 = 000000000000005c
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181424] = 13ff0000, %l3 = 00000000000000ff
	swap	[%i6+0x024],%l3		! %l3 = 0000000013ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00003a30, %l2 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = 0000000000003a30

p0_label_213:
!	Mem[0000000030181400] = 00000030, %l0 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (34)
!	Mem[00000000100c1408] = ffffff00, %l4 = 00000000000000ad
	ldsha	[%i3+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = 2600ffffff00c8ff, %f12 = ff000000 00000000
	ldda	[%i5+%g0]0x88,%f12	! %f12 = 2600ffff ff00c8ff
!	Mem[00000000201c0000] = ff26367d, %l6 = 0000000000000000
	ldsb	[%o0+0x001],%l6		! %l6 = 0000000000000026
!	Mem[0000000030081400] = 2600ff57b4225130, %f14 = ffffad05 29e41984
	ldda	[%i2+%g0]0x81,%f14	! %f14 = 2600ff57 b4225130
!	Mem[0000000030181400] = 00000030 13000000 00000000 2e2caf12
!	Mem[0000000030181410] = 30000000 00000000 0000dce9 74bb0000
!	Mem[0000000030181420] = 7f52bcee 60e0e3bb fe747889 f8dd2622
!	Mem[0000000030181430] = 4cad7c8a 0926e279 274afced 7b635a62
	ldda	[%i6]ASI_BLK_S,%f0	! Block Load from 0000000030181400
!	Mem[0000000030181400] = 00000030 13000000 00000000 2e2caf12
!	Mem[0000000030181410] = 30000000 00000000 0000dce9 74bb0000
!	Mem[0000000030181420] = 7f52bcee 60e0e3bb fe747889 f8dd2622
!	Mem[0000000030181430] = 4cad7c8a 0926e279 274afced 7b635a62
	ldda	[%i6]ASI_BLK_SL,%f0	! Block Load from 0000000030181400
!	Mem[0000000010101410] = 00000000, %l3 = 0000000013ff0000
	lduba	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l4 = ffffffffffffffff
	ldsba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010181408] = ffffffff
	stha	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000ffff

p0_label_214:
!	Mem[00000000211c0000] = ffff0b46, %l1 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c1408] = ffffff00, %l3 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%f17 = 00000000, Mem[00000000100c1424] = 00000000
	st	%f17,[%i3+0x024]	! Mem[00000000100c1424] = 00000000
!	Mem[0000000010141410] = fe1adf4b, %l5 = ffffffffffffffff
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 00000000fe1adf4b
!	%f16 = ff000000 00000000, Mem[0000000030001410] = 00000000 00000000
	stda	%f16,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000 00000000
!	%l5 = 00000000fe1adf4b, Mem[00000000300c1408] = 2600ff57
	stba	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 4b00ff57
!	%l2 = 0000000000003a30, Mem[0000000030101400] = 8419e42905adffff
	stxa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000003a30
!	Mem[00000000201c0000] = ff26367d, %l1 = 00000000000000ff
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010101410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00ffffff, %l7 = 0000000000000000
	lduba	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff

p0_label_215:
!	Mem[0000000010081410] = ffffad05, %f24 = 00000000
	lda	[%i2+%o5]0x80,%f24	! %f24 = ffffad05
!	Mem[0000000010181400] = 04a405ff, %l7 = 00000000000000ff
	lduba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000004
!	Mem[0000000010041410] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 5c2438bb 6bb30828, %l4 = 00000000, %l5 = fe1adf4b
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 000000005c2438bb 000000006bb30828
!	Mem[0000000010181408] = ffff0000, %l5 = 000000006bb30828
	lduba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 8419e4294cd3adf1, %l3 = 00000000000000ff
	ldxa	[%i5+0x008]%asi,%l3	! %l3 = 8419e4294cd3adf1
!	%f18 = 00000000 00ffffff, Mem[0000000010101400] = fff57980 5a1e1026
	stda	%f18,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 00ffffff
!	Mem[0000000021800080] = 05ad32fb, %l6 = 0000000000000026
	ldub	[%o3+0x080],%l6		! %l6 = 0000000000000005
!	Mem[0000000030181400] = 30000000, %l3 = 8419e4294cd3adf1
	ldswa	[%i6+%g0]0x89,%l3	! %l3 = 0000000030000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010141400] = ff00c8ff
	stwa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000

p0_label_216:
!	Mem[0000000010001410] = 0054276c, %l3 = 0000000030000000
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 000000000054276c
!	Mem[0000000010141408] = 8419e429, %l3 = 000000000054276c
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 00000084000000ff
!	%f28 = 305122b4 14eb7ae0, %l6 = 0000000000000005
!	Mem[00000000100c1418] = 000000000000ffff
	add	%i3,0x018,%g1
	stda	%f28,[%g1+%l6]ASI_PST8_P ! Mem[00000000100c1418] = 0000000000ebffe0
!	%f16 = ff000000 00000000, Mem[0000000030141400] = 5a1e1026 000000ff
	stda	%f16,[%i5+%g0]0x81	! Mem[0000000030141400] = ff000000 00000000
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000084, %asi = 80
	swapa	[%i3+0x000]%asi,%l3	! %l3 = 0000000000000000
!	%f28 = 305122b4, Mem[0000000030101400] = 00000000
	sta	%f28,[%i4+%g0]0x81	! Mem[0000000030101400] = 305122b4
	membar	#Sync			! Added by membar checker (35)
!	%f18 = 00000000 00ffffff, Mem[0000000030181400] = 30000000 00000013
	stda	%f18,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 00ffffff
!	%l2 = 00003a30, %l3 = 00000000, Mem[0000000030081408] = ffa405ff 000052ff
	stda	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00003a30 00000000
!	Mem[00000000100c1414] = ff0000fe, %l4 = 000000005c2438bb, %asi = 80
	swapa	[%i3+0x014]%asi,%l4	! %l4 = 00000000ff0000fe
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00ffffff, %f21 = fe000000
	lda	[%i5+%o4]0x89,%f21	! %f21 = 00ffffff

p0_label_217:
!	Mem[00000000100c1400] = ff00000084000000, %l0 = 0000000000000000
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = ff00000084000000
!	Mem[0000000010101408] = ffffff00, %l4 = 00000000ff0000fe
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 30000000, %l6 = 0000000000000005
	lduwa	[%i6+%o5]0x81,%l6	! %l6 = 0000000030000000
!	Mem[00000000201c0000] = ff26367d, %l0 = ff00000084000000
	ldsh	[%o0+%g0],%l0		! %l0 = ffffffffffffff26
!	Mem[0000000010081410] = 05adffff, %l1 = 0000000000000000
	lduwa	[%i2+%o5]0x88,%l1	! %l1 = 0000000005adffff
!	Mem[0000000030081408] = 00000000303a0000, %f0  = 00000013 30000000
	ldda	[%i2+%o4]0x89,%f0 	! %f0  = 00000000 303a0000
!	%l0 = ffffffffffffff26, Mem[0000000010181410] = 00000000
	stwa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffff26
!	Mem[00000000300c1400] = 00000000, %f9  = eebc527f
	lda	[%i3+%g0]0x81,%f9 	! %f9 = 00000000
!	Starting 10 instruction Store Burst
!	%f28 = 305122b4, Mem[0000000010101414] = 6c275400
	sta	%f28,[%i4+0x014]%asi	! Mem[0000000010101414] = 305122b4

p0_label_218:
!	Mem[0000000010141400] = 00000000, %l0 = ffffffffffffff26
	ldstuba	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l1 = 0000000005adffff, Mem[00000000201c0000] = ff26367d
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = ffff367d
!	%l6 = 0000000030000000, Mem[0000000010181410] = ffffff26
	stha	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000ff26
!	%l1 = 0000000005adffff, Mem[000000001004141b] = 00000039
	stb	%l1,[%i1+0x01b]		! Mem[0000000010041418] = 000000ff
!	%l0 = 0000000000000000, Mem[0000000010141408] = ff19e4294cd3adf1
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000000
!	%f2  = 12af2c2e 00000000, %l3 = 0000000000000000
!	Mem[0000000010041418] = 000000ff00003aff
	add	%i1,0x018,%g1
	stda	%f2,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010041418] = 000000ff00003aff
!	%l4 = ffffffffffffffff, Mem[00000000100c1400] = 84000000
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 840000ff
!	%f31 = 2600ffff, Mem[0000000010081428] = 6bb30828
	sta	%f31,[%i2+0x028]%asi	! Mem[0000000010081428] = 2600ffff
!	Mem[0000000030101408] = 303a0000, %l5 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff0000ff, %l0 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l0	! %l0 = 000000000000ff00

p0_label_219:
!	Mem[0000000010041408] = ffff0026, %f18 = 00000000
	ld	[%i1+%o4],%f18	! %f18 = ffff0026
!	Mem[0000000030001400] = 0000000000000000, %l2 = 0000000000003a30
	ldxa	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141408] = ffffff00, %l6 = 0000000030000000
	lduha	[%i5+%o4]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[00000000100c1410] = 000000fe, %f3  = 00000000
	lda	[%i3+%o5]0x80,%f3 	! %f3 = 000000fe
!	Mem[0000000010041400] = 0054276c, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 000000000054276c
!	Mem[00000000100c1408] = 00ffffff, %l5 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010181428] = 00005700, %l0 = 000000000000ff00
	ldsh	[%i6+0x02a],%l0		! %l0 = 0000000000005700
!	Mem[000000001018143c] = ad050000, %l0 = 0000000000005700
	ldsb	[%i6+0x03e],%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l7 = 0000000000000004
	lduwa	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 05adffff, Mem[0000000030001408] = 000000ad ffffffff
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 05adffff

p0_label_220:
!	%l7 = 0000000000000000, Mem[00000000100c1428] = 6bb30828
	stw	%l7,[%i3+0x028]		! Mem[00000000100c1428] = 00000000
!	Mem[0000000010081400] = 000005ff, %l1 = 0000000005adffff
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 00000000000005ff
!	Mem[0000000010101400] = 0000000000ffffff, %l7 = 0000000000000000, %l0 = 0000000000000000
	casxa	[%i4]0x80,%l7,%l0	! %l0 = 0000000000ffffff
!	Mem[00000000100c1400] = 840000ff, %l6 = 000000000000ffff
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[00000000201c0000] = ffff367d, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000367d
!	%f16 = ff000000 00000000, Mem[0000000030001400] = 00000000 00000000
	stda	%f16,[%i0+%g0]0x81	! Mem[0000000030001400] = ff000000 00000000
!	%f18 = ffff0026 00ffffff, %l5 = 000000000000ffff
!	Mem[0000000010041420] = d25339485aff5f11
	add	%i1,0x020,%g1
	stda	%f18,[%g1+%l5]ASI_PST32_P ! Mem[0000000010041420] = ffff002600ffffff
!	Mem[0000000010181410] = 26ff0000, %l4 = ffffffffffffffff
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 0000000000ffffff
	setx	0x5d40aea048f09a75,%g7,%l0 ! %l0 = 5d40aea048f09a75
!	%l1 = 00000000000005ff
	setx	0x86978b8829278ebf,%g7,%l1 ! %l1 = 86978b8829278ebf
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5d40aea048f09a75
	setx	0xcbeb702803569118,%g7,%l0 ! %l0 = cbeb702803569118
!	%l1 = 86978b8829278ebf
	setx	0x3cb87657a82f3c3b,%g7,%l1 ! %l1 = 3cb87657a82f3c3b
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000030, %l5 = 000000000000ffff
	lduwa	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000030

p0_label_221:
!	Mem[0000000030081408] = 303a0000, %l1 = 3cb87657a82f3c3b
	ldswa	[%i2+%o4]0x89,%l1	! %l1 = 00000000303a0000
!	Mem[00000000100c1408] = ffffff00, %l5 = 0000000000000030
	lduha	[%i3+%o4]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030081400] = 57ff0026, %l0 = cbeb702803569118
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000026
!	Mem[0000000010001408] = 00000013, %l0 = 0000000000000026
	ldsha	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101414] = 305122b4, %l4 = 0000000000000000
	ldswa	[%i4+0x014]%asi,%l4	! %l4 = 00000000305122b4
!	Mem[00000000201c0000] = 0000367d, %l0 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 00ffffff, %l6 = 00000000000000ff
	lduwa	[%i4+%o4]0x88,%l6	! %l6 = 0000000000ffffff
!	Mem[0000000010141400] = 000000ff, %l6 = 0000000000ffffff
	lduha	[%i5+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041408] = 2600ffff, %l6 = 00000000000000ff
	ldsha	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ffffff00, %l2 = 000000000054276c
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 000000ff000000ff

p0_label_222:
!	Mem[0000000010181423] = 7f52c8b5, %l6 = ffffffffffffffff
	ldstuba	[%i6+0x023]%asi,%l6	! %l6 = 000000b5000000ff
!	%f16 = ff000000 00000000, Mem[0000000030001400] = ff000000 00000000
	stda	%f16,[%i0+%g0]0x81	! Mem[0000000030001400] = ff000000 00000000
!	%l6 = 00000000000000b5, Mem[0000000030081400] = 2600ff57
	stha	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 00b5ff57
!	%f16 = ff000000, Mem[0000000030181410] = 30000000
	sta	%f16,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000
!	%l3 = 0000000000000000, Mem[0000000010181400] = 04a405ff
	stwa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Mem[00000000100c1414] = 5c2438bb, %l1 = 303a0000, %l0 = 00000000
	add	%i3,0x14,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 000000005c2438bb
!	Mem[00000000100c1408] = 00ffffff, %l4 = 00000000305122b4
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%f10 = 2226ddf8, Mem[0000000010041410] = 00000000
	sta	%f10,[%i1+%o5]0x88	! Mem[0000000010041410] = 2226ddf8
!	%l6 = 00000000000000b5, Mem[0000000010041408] = ffff0026
	stba	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = b5ff0026
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 343f80e9, %l1 = 00000000303a0000
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000034

p0_label_223:
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 000000005c2438bb
	setx	0x2495367845603222,%g7,%l0 ! %l0 = 2495367845603222
!	%l1 = 0000000000000034
	setx	0x3f63d6dfb070296c,%g7,%l1 ! %l1 = 3f63d6dfb070296c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2495367845603222
	setx	0xadcd99e0182963d7,%g7,%l0 ! %l0 = adcd99e0182963d7
!	%l1 = 3f63d6dfb070296c
	setx	0xae7bfdcfc1f811d2,%g7,%l1 ! %l1 = ae7bfdcfc1f811d2
!	Mem[0000000010001414] = 00000038, %f25 = 00005c24
	ld	[%i0+0x014],%f25	! %f25 = 00000038
!	Mem[00000000100c1408] = 00ffffff, %l5 = 000000000000ffff
	ldswa	[%i3+%o4]0x88,%l5	! %l5 = 0000000000ffffff
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = ff0000ff, %l2 = 00000000000000ff
	ldswa	[%i1+%g0]0x89,%l2	! %l2 = ffffffffff0000ff
!	Mem[0000000010101418] = 00000000ffc800ff, %l4 = 0000000000000000
	ldxa	[%i4+0x018]%asi,%l4	! %l4 = 00000000ffc800ff
!	Mem[0000000010181408] = 0000ffff, %f21 = 00ffffff
	lda	[%i6+%o4]0x80,%f21	! %f21 = 0000ffff
!	Mem[0000000010001424] = 305122b4, %l5 = 0000000000ffffff
	lduw	[%i0+0x024],%l5		! %l5 = 00000000305122b4
!	Mem[0000000030001400] = ff00000000000000, %f8  = bbe3e060 00000000
	ldda	[%i0+%g0]0x81,%f8 	! %f8  = ff000000 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000b5, Mem[0000000010141400] = ff000000
	stha	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00b50000

p0_label_224:
!	Mem[00000000100c1400] = ff000084, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ff000084
!	%f12 = 79e22609, Mem[00000000300c1410] = 00000000
	sta	%f12,[%i3+%o5]0x89	! Mem[00000000300c1410] = 79e22609
!	Mem[0000000030101400] = b4225130, %l7 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l7	! %l7 = 00000030000000ff
!	%l1 = ae7bfdcfc1f811d2, Mem[0000000010181400] = 00000000
	stwa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = c1f811d2
!	Mem[0000000010001438] = 00000000, %l3 = 00000000ff000084
	swap	[%i0+0x038],%l3		! %l3 = 0000000000000000
!	%l0 = adcd99e0182963d7, Mem[00000000300c1400] = 00000000
	stwa	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 182963d7
!	Mem[00000000300c1410] = 79e22609, %l5 = 00000000305122b4
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 00000009000000ff
!	Mem[0000000030001400] = ff000000, %l6 = 00000000000000b5
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%l7 = 0000000000000030, Mem[0000000010041430] = 9a51ffb056848fc0
	stx	%l7,[%i1+0x030]		! Mem[0000000010041430] = 0000000000000030
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff26e279, %l5 = 0000000000000009
	ldsha	[%i3+%o5]0x81,%l5	! %l5 = ffffffffffffff26

p0_label_225:
!	Mem[0000000030081410] = 5c2438bb, %l2 = ffffffffff0000ff
	lduba	[%i2+%o5]0x81,%l2	! %l2 = 000000000000005c
!	Mem[0000000010041408] = b5ff0026, %f29 = 14eb7ae0
	ld	[%i1+%o4],%f29	! %f29 = b5ff0026
!	Mem[0000000010081430] = e07aeb14, %l1 = ae7bfdcfc1f811d2
	ldsb	[%i2+0x031],%l1		! %l1 = 000000000000007a
!	Mem[0000000010081410] = ffffad05, %l6 = 00000000000000ff
	ldsha	[%i2+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030181410] = 000000ff, %f29 = b5ff0026
	lda	[%i6+%o5]0x89,%f29	! %f29 = 000000ff
!	Mem[0000000010101408] = 00ffffff, %l1 = 000000000000007a
	ldsba	[%i4+%o4]0x88,%l1	! %l1 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010041400] = 6c275400 ffff0026 b5ff0026 ffff0030
!	Mem[0000000010041410] = f8dd2622 ff05a404 000000ff 00003aff
!	Mem[0000000010041420] = ffff0026 00ffffff 00000000 00000000
!	Mem[0000000010041430] = 00000000 00000030 ffffffff 00000000
	ldda	[%i1]ASI_BLK_AIUP,%f16	! Block Load from 0000000010041400
!	Mem[0000000030181410] = ff000000 00000000, %l2 = 0000005c, %l3 = 00000000
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010001420] = af0cffa9, %l0 = adcd99e0182963d7
	ldsw	[%i0+0x020],%l0		! %l0 = ffffffffaf0cffa9
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 00000000, %l1 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff

p0_label_226:
!	%f14 = 625a637b edfc4a27, Mem[0000000030081408] = 00003a30 00000000
	stda	%f14,[%i2+%o4]0x81	! Mem[0000000030081408] = 625a637b edfc4a27
!	Mem[0000000030181400] = 00ffffff, %l6 = ffffffffffffffff
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 0000000000ffffff
!	Mem[0000000010141434] = ff000000, %l7 = 0000000000000030, %asi = 80
	swapa	[%i5+0x034]%asi,%l7	! %l7 = 00000000ff000000
!	%f0  = 00000000 303a0000, %l0 = ffffffffaf0cffa9
!	Mem[00000000100c1420] = 245c000000000000
	add	%i3,0x020,%g1
	stda	%f0,[%g1+%l0]ASI_PST32_PL ! Mem[00000000100c1420] = 00003a3000000000
!	%l3 = 0000000000000000, Mem[0000000030041410] = 245c0000
	stha	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 245c0000
!	Mem[0000000010081400] = 05adffff, %l0 = ffffffffaf0cffa9
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030001400] = 000000ff, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = 000000ff, %l0 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f4  = 00000000, Mem[0000000030081410] = 5c2438bb
	sta	%f4 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff0000ff, %l6 = 0000000000ffffff
	lduwa	[%i1+%g0]0x81,%l6	! %l6 = 00000000ff0000ff

p0_label_227:
!	Mem[0000000030181408] = 00000000, %l2 = 00000000ff000000
	lduha	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = ffffffff 8941ad0c, %l6 = ff0000ff, %l7 = ff000000
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 00000000ffffffff 000000008941ad0c
!	Mem[0000000010141410] = ffffffff, %f5  = 00000030
	lda	[%i5+%o5]0x88,%f5 	! %f5 = ffffffff
!	Mem[0000000010141400] = 0000b500, %l2 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l2	! %l2 = 000000000000b500
!	Mem[00000000100c1400] = 00000000, %l2 = 000000000000b500
	lduba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = c1f811d200ffffff, %l7 = 000000008941ad0c
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = c1f811d200ffffff
!	Mem[0000000030001400] = 00000000, %l5 = ffffffffffffff26
	lduba	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = 79e226ff, %l7 = c1f811d200ffffff
	lduha	[%i3+%o5]0x89,%l7	! %l7 = 00000000000026ff
!	Mem[0000000010081400] = ffffad05, %l7 = 00000000000026ff
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffffad05
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (37)
!	%l4 = ffc800ff, %l5 = 00000000, Mem[0000000010041408] = b5ff0026 ffff0030
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = ffc800ff 00000000

p0_label_228:
!	%l4 = 00000000ffc800ff, Mem[0000000010081410] = ffffad05
	stha	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ffad05
!	Mem[00000000300c1408] = 57ff004b, %l6 = 00000000ffffffff
	ldstuba	[%i3+%o4]0x89,%l6	! %l6 = 0000004b000000ff
!	%l3 = 00000000000000ff, Mem[0000000021800081] = 05ad32fb
	stb	%l3,[%o3+0x081]		! Mem[0000000021800080] = 05ff32fb
!	%l1 = 0000000000000000, Mem[0000000010181410] = 0000ffff26ff00ff
	stxa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	Mem[0000000010141414] = 8941ad0c, %l3 = 000000ff, %l4 = ffc800ff
	add	%i5,0x14,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 000000008941ad0c
!	%f14 = 625a637b edfc4a27, %l5 = 0000000000000000
!	Mem[0000000010101418] = 00000000ffc800ff
	add	%i4,0x018,%g1
	stda	%f14,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010101418] = 00000000ffc800ff
!	%l5 = 0000000000000000, Mem[0000000030041410] = 00005c24
	stwa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%f14 = 625a637b edfc4a27, Mem[0000000010001400] = 000000ff e5850284
	stda	%f14,[%i0+%g0]0x88	! Mem[0000000010001400] = 625a637b edfc4a27
!	%l4 = 000000008941ad0c, Mem[0000000010141400] = 2600ffff0000b500
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000008941ad0c
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff00000000000000, %l7 = ffffffffffffad05
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = ff00000000000000

p0_label_229:
!	Mem[0000000010081410] = 00ffad05, %l7 = ff00000000000000
	ldswa	[%i2+%o5]0x80,%l7	! %l7 = 0000000000ffad05
!	Mem[0000000010101410] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = ff0000ffff0000ff, %f28 = 00000000 00000030
	ldda	[%i1+%g0]0x89,%f28	! %f28 = ff0000ff ff0000ff
!	Mem[00000000100c1434] = b4225130, %l5 = 0000000000000000
	lduha	[%i3+0x036]%asi,%l5	! %l5 = 0000000000005130
!	Mem[000000001008141c] = 000005ad, %l1 = 0000000000000000
	lduha	[%i2+0x01e]%asi,%l1	! %l1 = 00000000000005ad
!	Mem[0000000030181408] = 00000000, %l6 = 000000000000004b
	lduba	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 8941ad0c, %l7 = 0000000000ffad05
	lduha	[%i5+%g0]0x88,%l7	! %l7 = 000000000000ad0c
!	Mem[0000000030001400] = 00000000, %l5 = 0000000000005130
	ldsba	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 182963d730317b12, %l3 = 00000000000000ff
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = 182963d730317b12
!	Starting 10 instruction Store Burst
!	%f12 = 79e22609 8a7cad4c, Mem[0000000010181428] = 00005700 00000020
	stda	%f12,[%i6+0x028]%asi	! Mem[0000000010181428] = 79e22609 8a7cad4c

p0_label_230:
!	%f12 = 79e22609 8a7cad4c, Mem[0000000010001428] = 00000000 0000ff64
	std	%f12,[%i0+0x028]	! Mem[0000000010001428] = 79e22609 8a7cad4c
!	%l6 = 0000000000000000, Mem[0000000010181420] = 7f52c8ff, %asi = 80
	stha	%l6,[%i6+0x020]%asi	! Mem[0000000010181420] = 0000c8ff
!	%f1  = 303a0000, Mem[0000000030041410] = 00000000
	sta	%f1 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 303a0000
!	%f19 = ffff0030, Mem[0000000010181410] = 00000000
	sta	%f19,[%i6+%o5]0x80	! Mem[0000000010181410] = ffff0030
!	%l4 = 8941ad0c, %l5 = 00000000, Mem[0000000010141410] = ffffffff 8941ad0c
	std	%l4,[%i5+%o5]		! Mem[0000000010141410] = 8941ad0c 00000000
!	%l6 = 0000000000000000, Mem[0000000030101400] = ff5122b4
	stha	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 000022b4
!	%l0 = 000000ff, %l1 = 000005ad, Mem[0000000010181428] = 79e22609 8a7cad4c
	stda	%l0,[%i6+0x028]%asi	! Mem[0000000010181428] = 000000ff 000005ad
!	Mem[0000000010181410] = 3000ffff, %l4 = 000000008941ad0c
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%l1 = 00000000000005ad, Mem[00000000300c1408] = 57ff00ff
	stwa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000005ad
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 6c275400, %f4  = 00000000
	lda	[%i1+%g0]0x80,%f4 	! %f4 = 6c275400

p0_label_231:
!	Mem[00000000300c1408] = ad050000, %l3 = 182963d730317b12
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 000000000000ad05
!	Mem[0000000010041408] = ff00c8ff, %l0 = 00000000000000ff
	ldsba	[%i1+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[000000001008140c] = 000000ff, %l4 = 00000000000000ff
	lduha	[%i2+0x00e]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000020800040] = 01139e9b, %l2 = 00000000000000ff
	lduba	[%o1+0x040]%asi,%l2	! %l2 = 0000000000000001
!	Mem[00000000201c0000] = 0000367d, %l5 = 0000000000000000
	ldub	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[00000000100c1408] = 0000000000ffffff, %f8  = ff000000 00000000
	ldda	[%i3+%o4]0x88,%f8 	! %f8  = 00000000 00ffffff
!	Mem[0000000030181410] = ff000000 00000000, %l0 = ffffffff, %l1 = 000005ad
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000030101408] = 303a0000, %l3 = 000000000000ad05
	ldsha	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = ff0000ff, %l0 = 00000000ff000000
	ldsha	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ff000000, %l2 = 0000000000000001
	swapa	[%i0+%o5]0x81,%l2	! %l2 = 00000000ff000000

p0_label_232:
!	Mem[0000000010041408] = ffc800ff, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030101410] = 00ff0000, %l7 = 000000000000ad0c
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 0000000000ff0000
!	%l6 = 0000000000000000, Mem[0000000010081420] = 245c0000, %asi = 80
	stwa	%l6,[%i2+0x020]%asi	! Mem[0000000010081420] = 00000000
!	Mem[00000000100c1400] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%f17 = ffff0026, Mem[0000000030101408] = 00003a30
	sta	%f17,[%i4+%o4]0x81	! Mem[0000000030101408] = ffff0026
!	%l6 = 0000000000000000, Mem[00000000100c1410] = 000000fe5c2438bb
	stxa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l2 = 00000000ff000000
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%l3 = 0000000000000000, imm = ffffffffffffff66, %l3 = 0000000000000000
	or	%l3,-0x09a,%l3		! %l3 = ffffffffffffff66
!	%l2 = 0000000000000000, Mem[0000000010181414] = 00000000, %asi = 80
	stwa	%l2,[%i6+0x014]%asi	! Mem[0000000010181414] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = ffa56996, %l5 = 0000000000000000
	ldsh	[%o3+0x100],%l5		! %l5 = ffffffffffffffa5

p0_label_233:
!	Mem[00000000100c141c] = 00ebffe0, %l2 = 0000000000000000
	ldsw	[%i3+0x01c],%l2		! %l2 = 0000000000ebffe0
!	Mem[0000000010081400] = ffffad05, %l5 = ffffffffffffffa5
	lduha	[%i2+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010041400] = 0054276c, %l1 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l1	! %l1 = 000000000054276c
!	Mem[0000000010001408] = 13000000, %l7 = 0000000000ff0000
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = 0000000013000000
!	Mem[0000000030181408] = ff000000, %l0 = 00000000000000ff
	ldswa	[%i6+%o4]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[00000000100c140c] = 00000000, %l5 = 000000000000ffff
	lduba	[%i3+0x00f]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l1 = 000000000054276c
	ldsba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %f31 = 00000000
	lda	[%i3+%g0]0x80,%f31	! %f31 = ff000000
!	Mem[0000000030081408] = 7b635a62, %l1 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l1	! %l1 = 0000000000005a62
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 303a0000, %l3 = ffffffffffffff66
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 00000000303a0000

p0_label_234:
!	%l5 = 0000000000000000, Mem[0000000030181400] = ffffffff
	stba	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 00ffffff
!	%f22 = 000000ff, Mem[0000000010081428] = 2600ffff
	st	%f22,[%i2+0x028]	! Mem[0000000010081428] = 000000ff
!	Mem[00000000100c1412] = 00000000, %l4 = 00000000000000ff
	ldstub	[%i3+0x012],%l4		! %l4 = 00000000000000ff
!	%f21 = ff05a404, Mem[0000000010001400] = edfc4a27
	sta	%f21,[%i0+%g0]0x88	! Mem[0000000010001400] = ff05a404
!	%l3 = 00000000303a0000, Mem[0000000010041408] = ffc800ff
	stw	%l3,[%i1+%o4]		! Mem[0000000010041408] = 303a0000
!	Mem[0000000010181418] = ffffffff, %l1 = 00005a62, %l5 = 00000000
	add	%i6,0x18,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010101410] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030141410] = e9803f34, %l2 = 0000000000ebffe0
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 00000034000000ff
!	%l4 = 0000000000000000, Mem[00000000100c1408] = ffffff00
	stwa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = e9803fff, %l5 = 00000000ffffffff
	lduwa	[%i5+%o5]0x89,%l5	! %l5 = 00000000e9803fff

p0_label_235:
!	Mem[0000000010101408] = 00000000 00ffffff, %l6 = 000000ff, %l7 = 13000000
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 0000000000ffffff 0000000000000000
!	Mem[0000000030041408] = ff0000ff, %l7 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010141408] = 00000000, %l5 = 00000000e9803fff
	lduha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = ad050000, %f27 = 00000000
	lda	[%i3+%o4]0x81,%f27	! %f27 = ad050000
!	Mem[0000000030001400] = 00000000, %l5 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 182963d7, %f12 = 79e22609
	lda	[%i3+%g0]0x81,%f12	! %f12 = 182963d7
!	Mem[00000000100c1410] = 0000ff00, %l1 = 0000000000005a62
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010041410] = 2226ddf8 04a405ff
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 00000000
!	Mem[0000000010141418] = 00ff0000 840285e5, %l6 = 00ffffff, %l7 = 0000ff00
	ldda	[%i5+0x018]%asi,%l6	! %l6 = 0000000000ff0000 00000000840285e5
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030141400] = ff000000
	stha	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000

p0_label_236:
!	%l7 = 00000000840285e5, Mem[0000000010181410] = 000000003000ffff
	stxa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000840285e5
!	%l1 = 0000000000000000, Mem[0000000010041400] = 6c275400
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Mem[0000000030141408] = 00ffffff, %l3 = 00000000303a0000
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 0000000000ffffff
!	%l5 = 0000000000000000, Mem[0000000010001408] = 13000000
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	%f22 = 000000ff 00003aff, %l2 = 0000000000000034
!	Mem[0000000010101418] = 00000000ffc800ff
	add	%i4,0x018,%g1
	stda	%f22,[%g1+%l2]ASI_PST32_P ! Mem[0000000010101418] = 00000000ffc800ff
!	%f8  = 00000000 00ffffff, Mem[0000000030141410] = e9803fff ff00b0b6
	stda	%f8 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 00ffffff
!	Mem[0000000010141400] = 8941ad0c, %l2 = 0000000000000034
	ldstuba	[%i5+%g0]0x88,%l2	! %l2 = 0000000c000000ff
!	Mem[0000000030141400] = 00000000, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%l6 = 0000000000ff0000, Mem[0000000030041410] = 66ffffff
	stha	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 66ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181404] = 00ffffff, %l7 = 00000000840285e5
	ldub	[%i6+0x006],%l7		! %l7 = 00000000000000ff

p0_label_237:
!	Mem[0000000030041410] = 66ff0000, %l2 = 000000000000000c
	lduba	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l6 = 0000000000ff0000
	lduwa	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800040] = 01139e9b, %l7 = 00000000000000ff
	lduh	[%o1+0x040],%l7		! %l7 = 0000000000000113
!	Mem[0000000010141434] = 00000030, %l6 = 0000000000000000
	ldsba	[%i5+0x037]%asi,%l6	! %l6 = 0000000000000030
!	Mem[0000000010001400] = ff05a404, %l1 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l1	! %l1 = 000000000000a404
!	Mem[0000000030001400] = 00000000, %f2  = 12af2c2e
	lda	[%i0+%g0]0x89,%f2 	! %f2 = 00000000
!	Mem[0000000020800040] = 01139e9b, %l3 = 0000000000ffffff
	ldsh	[%o1+0x040],%l3		! %l3 = 0000000000000113
!	Mem[0000000010181400] = d211f8c1, %l2 = 0000000000000000
	ldsha	[%i6+%g0]0x88,%l2	! %l2 = fffffffffffff8c1
!	Mem[0000000010001408] = 00000000, %f30 = ffffffff
	lda	[%i0+%o4]0x88,%f30	! %f30 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 182963d7, %l3 = 0000000000000113
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 00000018000000ff

p0_label_238:
!	Mem[00000000201c0001] = 0000367d, %l0 = ffffffffff000000
	ldstub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	%f4  = 6c275400 ffffffff, Mem[0000000030081400] = 00b5ff57 b4225130
	stda	%f4 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 6c275400 ffffffff
!	Mem[0000000010101400] = 00000000, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%l0 = 0000000000000000, Mem[00000000218001c0] = ffff4fd1, %asi = 80
	stha	%l0,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 00004fd1
!	%l2 = fffff8c1, %l3 = 00000018, Mem[00000000300c1408] = 000005ad ffff0000
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = fffff8c1 00000018
!	Mem[0000000030101410] = 0000ad0c, %l3 = 0000000000000018
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 000000000000ad0c
!	%l4 = 0000000000000000, Mem[0000000030001408] = 00000000
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%f10 = 2226ddf8 897874fe, Mem[00000000300c1400] = ff2963d7 30317b12
	stda	%f10,[%i3+%g0]0x81	! Mem[00000000300c1400] = 2226ddf8 897874fe
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000 0000000000000000

p0_label_239:
!	Mem[0000000030041410] = 66ff0000, %l6 = 0000000000000030
	ldswa	[%i1+%o5]0x89,%l6	! %l6 = 0000000066ff0000
!	Mem[0000000030181410] = 00000000000000ff, %f22 = 000000ff 00003aff
	ldda	[%i6+%o5]0x89,%f22	! %f22 = 00000000 000000ff
!	Mem[0000000010141410] = 8941ad0c, %f4  = 6c275400
	lda	[%i5+%o5]0x80,%f4 	! %f4 = 8941ad0c
!	Mem[0000000010141400] = 000000008941adff, %l2 = fffffffffffff8c1
	ldxa	[%i5+%g0]0x88,%l2	! %l2 = 000000008941adff
!	Mem[00000000100c1408] = 00000000, %l2 = 000000008941adff
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l2 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = ffffad05, %l3 = 000000000000ad0c
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = ffffffffffffad05
!	Mem[0000000010001408] = 00000000, %l1 = 000000000000a404
	lduha	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[000000001018140c] = ffffffff, %l5 = 0000000000000000
	ldsh	[%i6+0x00c],%l5		! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f6  = 0000bb74, %f25 = 00ffffff
	fstoi	%f6 ,%f25		! %l0 = 0000000000000022, Unfinished, %fsr = 0400000000

p0_label_240:
!	%l3 = ffffffffffffad05, Mem[00000000100c1400] = 000000ff
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffad05
!	%f12 = 182963d7 8a7cad4c, Mem[00000000100c1410] = 00ff0000 00000000
	stda	%f12,[%i3+%o5]0x88	! Mem[00000000100c1410] = 182963d7 8a7cad4c
!	%l2 = 0000000000000000, Mem[0000000010181408] = ffff0000
	stha	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = ffff0000
!	Mem[00000000201c0001] = 00ff367d, %l6 = 0000000066ff0000
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000010181410] = e5850284, %l7 = 0000000000000113
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 00000000e5850284
!	Mem[0000000030041408] = ff0000ff, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	%f14 = 625a637b, Mem[00000000100c1400] = 05adffff
	sta	%f14,[%i3+%g0]0x80	! Mem[00000000100c1400] = 625a637b
!	Mem[0000000030181410] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%f7  = e9dc0000, Mem[0000000010041408] = 303a0000
	sta	%f7 ,[%i1+%o4]0x80	! Mem[0000000010041408] = e9dc0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000ff, %f1  = 303a0000
	lda	[%i4+%o5]0x88,%f1 	! %f1 = 000000ff

p0_label_241:
!	Mem[0000000010101410] = ff000000305122b4, %f18 = b5ff0026 ffff0030
	ldda	[%i4+%o5]0x80,%f18	! %f18 = ff000000 305122b4
!	Mem[0000000030001410] = 00000001, %l6 = 00000000000000ff
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = ffad418900000000, %l3 = ffffffffffffad05
	ldxa	[%i5+0x000]%asi,%l3	! %l3 = ffad418900000000
!	Mem[0000000010181400] = c1f811d2, %f6  = 0000bb74
	ld	[%i6+%g0],%f6 	! %f6 = c1f811d2
!	Mem[0000000030181410] = ff00000000000000, %l0 = 0000000000000022
	ldxa	[%i6+%o5]0x81,%l0	! %l0 = ff00000000000000
!	Mem[0000000010041430] = 0000000000000030, %f6  = c1f811d2 e9dc0000
	ldd	[%i1+0x030],%f6 	! %f6  = 00000000 00000030
!	Mem[0000000030101400] = b4220000, %l6 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 000022b4 00003a30, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 00000000000022b4 0000000000003a30
!	Mem[0000000030081410] = 00000000, %f13 = 8a7cad4c
	lda	[%i2+%o5]0x81,%f13	! %f13 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 000000ff, %l7 = 00000000e5850284
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff

p0_label_242:
!	%l2 = 00000000, %l3 = 00000000, Mem[00000000300c1400] = f8dd2622 fe747889
	stda	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 00000000
!	%f24 = ffff0026, Mem[0000000010141400] = 8941adff
	sta	%f24,[%i5+%g0]0x88	! Mem[0000000010141400] = ffff0026
!	%f28 = ff0000ff, Mem[0000000010081410] = 00ffad05
	sta	%f28,[%i2+%o5]0x80	! Mem[0000000010081410] = ff0000ff
!	%l2 = 0000000000000000, Mem[00000000300c1410] = 79e226ff
	stha	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 79e20000
!	%l0 = 00000000000022b4, Mem[0000000010101420] = 9cdef36b, %asi = 80
	stha	%l0,[%i4+0x020]%asi	! Mem[0000000010101420] = 22b4f36b
!	Mem[0000000010081410] = ff0000ff, %l3 = ffad418900000000
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010181408] = 0000ffff ffffffff
	std	%l6,[%i6+%o4]		! Mem[0000000010181408] = 00000000 000000ff
!	%f6  = 00000000 00000030, Mem[0000000030141400] = 00000000 00000000
	stda	%f6 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 00000030
!	%l6 = 0000000000000000, Mem[00000000300c1408] = 00000018fffff8c1
	stxa	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffff0000000000, %f6  = 00000000 00000030
	ldda	[%i4+%g0]0x88,%f6 	! %f6  = ffffff00 00000000

p0_label_243:
!	Mem[0000000030101408] = 2600ffff, %l3 = 00000000000000ff
	lduwa	[%i4+%o4]0x89,%l3	! %l3 = 000000002600ffff
!	Mem[0000000010001408] = 00000000, %l1 = 0000000000003a30
	ldsha	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = 8941ad0c, %l2 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l2	! %l2 = ffffffff8941ad0c
!	Mem[0000000010001410] = 00000030, %f14 = 625a637b
	lda	[%i0+%o5]0x80,%f14	! %f14 = 00000030
!	Mem[0000000010141410] = 8941ad0c00000000, %l0 = 00000000000022b4
	ldxa	[%i5+%o5]0x80,%l0	! %l0 = 8941ad0c00000000
!	Mem[0000000010181410] = 0000000013010000, %l6 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l6	! %l6 = 0000000013010000
!	Mem[00000000100c1428] = 00000000 0000ff00, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i3+0x028]%asi,%l4	! %l4 = 0000000000000000 000000000000ff00
!	Mem[0000000030141408] = 303a0000, %l2 = ffffffff8941ad0c
	lduba	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = ffff0b46, %l2 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000020800000] = 0000188e, %asi = 80
	stha	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000188e

p0_label_244:
!	Mem[0000000030101400] = 000022b4, %l1 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 00000000000022b4
!	%l2 = 000000000000ffff, Mem[0000000010041408] = 000000000000dce9
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000000000ffff
!	Mem[0000000010181400] = c1f811d2, %l2 = 000000000000ffff
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 00000000c1f811d2
!	Mem[00000000300c1408] = 00000000, %l2 = 00000000c1f811d2
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l3 = 000000002600ffff, Mem[0000000030101410] = 00000018
	stwa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 2600ffff
!	%f26 = 00000000 ad050000, Mem[0000000010181408] = 00000000 ff000000
	stda	%f26,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 ad050000
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 8941ad0c00000000
	setx	0xcf09b6f87cc99225,%g7,%l0 ! %l0 = cf09b6f87cc99225
!	%l1 = 00000000000022b4
	setx	0x8ca47a37cfe673f3,%g7,%l1 ! %l1 = 8ca47a37cfe673f3
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = cf09b6f87cc99225
	setx	0x48a2fa4ff54604a9,%g7,%l0 ! %l0 = 48a2fa4ff54604a9
!	%l1 = 8ca47a37cfe673f3
	setx	0xc9480317ccc2cc06,%g7,%l1 ! %l1 = c9480317ccc2cc06
!	%f22 = 00000000 000000ff, Mem[0000000010181408] = ad050000 00000000
	stda	%f22,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 000000ff
!	%f20 = f8dd2622 ff05a404, Mem[0000000010001410] = 00000030 00000038
	stda	%f20,[%i0+%o5]0x80	! Mem[0000000010001410] = f8dd2622 ff05a404
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = 79e22609, %l4 = 0000000000000000
	ldsba	[%i0+0x02a]%asi,%l4	! %l4 = 0000000000000026

p0_label_245:
!	Mem[0000000010081424] = bb38245c, %l4 = 0000000000000026
	lduw	[%i2+0x024],%l4		! %l4 = 00000000bb38245c
!	Mem[0000000010081408] = 00000000, %l1 = c9480317ccc2cc06
	lduwa	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l0 = 48a2fa4ff54604a9
	ldsba	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = 000000ff, %l6 = 0000000013010000
	ldswa	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081410] = 2808b36b 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000 000000002808b36b
!	Mem[00000000100c1410] = 4cad7c8a, %l5 = 000000000000ff00
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 000000004cad7c8a
!	Mem[000000001018141c] = 8c959c93, %l7 = 00000000000000ff
	ldsh	[%i6+0x01e],%l7		! %l7 = ffffffffffff9c93
!	Mem[0000000010041400] = 00000000 ffff0026, %l0 = 00000000, %l1 = 2808b36b
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000 00000000ffff0026
!	Mem[0000000010181424] = 000000ff, %f12 = 182963d7
	ld	[%i6+0x024],%f12	! %f12 = 000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 000000004cad7c8a, Mem[0000000010141400] = ffff0026
	stha	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = ffff7c8a

p0_label_246:
!	%l0 = 0000000000000000, Mem[00000000300c1400] = 00000000
	stwa	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Mem[0000000020800041] = 01139e9b, %l7 = ffffffffffff9c93
	ldstuba	[%o1+0x041]%asi,%l7	! %l7 = 00000013000000ff
!	Mem[00000000211c0000] = ffff0b46, %l1 = 00000000ffff0026
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	%l7 = 0000000000000013, Mem[0000000030141408] = 303a0000
	stha	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 303a0013
!	%l1 = 00000000000000ff, Mem[00000000300c1408] = c1f811d2
	stba	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = c1f811ff
!	Mem[0000000030141410] = ffffff00, %l4 = 00000000bb38245c
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l2 = 00000000, %l3 = 2600ffff, Mem[0000000010141408] = 00000000 00000000
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 2600ffff
!	%l1 = 00000000000000ff, Mem[0000000030001400] = 00000000
	stba	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = ff000000
!	Mem[000000001018143c] = ad050000, %l0 = 0000000000000000, %asi = 80
	swapa	[%i6+0x03c]%asi,%l0	! %l0 = 00000000ad050000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l5 = 000000004cad7c8a
	lduba	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000000

p0_label_247:
!	Mem[0000000030101408] = 2600ffff, %l5 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = 840285e5, %l7 = 0000000000000013
	lduha	[%i4+%o5]0x80,%l7	! %l7 = 0000000000008402
!	Mem[0000000030141400] = 30000000, %l7 = 0000000000008402
	ldsba	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000030
!	Mem[0000000030101410] = 2600ffff, %l6 = 00000000000000ff
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = 000000002600ffff
!	Mem[00000000211c0000] = ffff0b46, %l1 = 00000000000000ff
	ldsba	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001438] = ff000084000005ad, %f28 = ff0000ff ff0000ff
	ldd	[%i0+0x038],%f28	! %f28 = ff000084 000005ad
!	Mem[00000000201c0000] = 00ff367d, %l3 = 000000002600ffff
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041410] = 00000000, %l1 = ffffffffffffffff
	ldsha	[%i1+0x012]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %l3 = 00000000000000ff
	lduba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 000000ff, Mem[0000000010181410] = 00000113 00000000
	stda	%f0 ,[%i6+0x010]%asi	! Mem[0000000010181410] = 00000000 000000ff

p0_label_248:
!	Mem[00000000100c1408] = 8941adff, %l5 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 00000089000000ff
!	%l1 = 0000000000000000, Mem[00000000300c1408] = c1f811ff
	stha	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = c1f80000
!	%l3 = 00000000000000ff, Mem[0000000010001430] = 00000000, %asi = 80
	stwa	%l3,[%i0+0x030]%asi	! Mem[0000000010001430] = 000000ff
!	Mem[0000000010181400] = ffff0000, %l3 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 00000000ffff0000
!	%f30 = 00000000 ff000000, %l0 = 00000000ad050000
!	Mem[00000000300c1418] = fe1adf4b8941ad0c
	add	%i3,0x018,%g1
	stda	%f30,[%g1+%l0]ASI_PST32_SL ! Mem[00000000300c1418] = fe1adf4b8941ad0c
!	Mem[0000000010001408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f30 = 00000000 ff000000, %l0 = 00000000ad050000
!	Mem[00000000300c1408] = 0000f8c100000000
	add	%i3,0x008,%g1
	stda	%f30,[%g1+%l0]ASI_PST32_S ! Mem[00000000300c1408] = 0000f8c100000000
!	%l2 = 0000000000000000, Mem[0000000010041410] = 00000000
	stba	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	Mem[0000000030001410] = 01000000, %l4 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 0000000001000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000030081400] = 6c275400 ffffffff 625a637b edfc4a27
!	Mem[0000000030081410] = 00000000 6bb30828 4770ac80 ee7d8c6c
!	Mem[0000000030081420] = 0000b0b6 13015707 1c51514c 2638245c
!	Mem[0000000030081430] = 63d79011 1e58394a ff817381 2e2c0000
	ldda	[%i2]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400

p0_label_249:
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000089
	ldswa	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l3 = 00000000ffff0000
	lduwa	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = ffff0b46, %l7 = 0000000000000030
	ldsh	[%o2+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010181400] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = 6c275400, %l0 = 00000000ad050000
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 000000006c275400
!	Mem[0000000010181400] = ffffff00 000000ff, %l4 = 01000000, %l5 = 00000000
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff 00000000ffffff00
!	Mem[0000000010081410] = ff0000ff, %f5  = ffffffff
	lda	[%i2+0x010]%asi,%f5 	! %f5 = ff0000ff
!	Mem[0000000010181408] = 000000ff, %l7 = ffffffffffffffff
	lduwa	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 00000000 000000ff, %l4 = 000000ff, %l5 = ffffff00
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010141400] = ffff7c8a 00000000
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff 00000000

p0_label_250:
!	Mem[00000000201c0000] = 00ff367d, %l2 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[000000001018142c] = 000005ad, %l6 = 2600ffff, %l4 = 000000ff
	add	%i6,0x2c,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000000005ad
!	%f8  = 00000000 00ffffff, Mem[0000000030041400] = ff0000ff ff0000ff
	stda	%f8 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 00ffffff
!	Mem[00000000100c1430] = e07aeb14 b4225130, %l6 = 2600ffff, %l7 = 000000ff
	ldda	[%i3+0x030]%asi,%l6	! %l6 = 00000000e07aeb14 00000000b4225130
!	Mem[0000000030041408] = ff0000ff, %l5 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%f8  = 00000000, Mem[0000000030001408] = 00000000
	sta	%f8 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Mem[0000000010041408] = ffff0000, %l4 = 00000000000005ad, %asi = 80
	swapa	[%i1+0x008]%asi,%l4	! %l4 = 00000000ffff0000
!	Mem[0000000010081408] = 00000000, %f12 = 000000ff
	lda	[%i2+%o4]0x80,%f12	! %f12 = 00000000
!	%l7 = 00000000b4225130, Mem[00000000211c0000] = ffff0b46
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 51300b46
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 30000000, %f2  = 00000000
	lda	[%i5+%g0]0x81,%f2 	! %f2 = 30000000

p0_label_251:
!	Mem[0000000030181400] = 00000000ffffff00, %f10 = 2226ddf8 897874fe
	ldda	[%i6+%g0]0x89,%f10	! %f10 = 00000000 ffffff00
!	Mem[0000000010041410] = 00000000, %l3 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800000] = 0000188e, %l7 = 00000000b4225130
	ldsba	[%o1+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = ffffff00000000ff, %l6 = 00000000e07aeb14
	ldxa	[%i6+%g0]0x88,%l6	! %l6 = ffffff00000000ff
!	Mem[0000000010001410] = 04a405ff2226ddf8, %l2 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l2	! %l2 = 04a405ff2226ddf8
!	Mem[0000000010001410] = 2226ddf8, %l5 = 00000000000000ff
	ldswa	[%i0+%o5]0x88,%l5	! %l5 = 000000002226ddf8
!	Mem[0000000030101400] = 00000000, %l2 = 04a405ff2226ddf8
	ldsha	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = ffffff00 00000000, %l4 = ffff0000, %l5 = 2226ddf8
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000 00000000ffffff00
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f10 = 00000000 ffffff00, %l0 = 000000006c275400
!	Mem[00000000100c1408] = ff41adff00000000
	add	%i3,0x008,%g1
	stda	%f10,[%g1+%l0]ASI_PST16_PL ! Mem[00000000100c1408] = ff41adff00000000

p0_label_252:
!	Mem[00000000100c1410] = 4cad7c8ad7632918, %l2 = 0000000000000000
	ldxa	[%i3+0x010]%asi,%l2	! %l2 = 4cad7c8ad7632918
!	%l4 = 0000000000000000, Mem[0000000010141410] = 8941ad0c
	stba	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 0041ad0c
!	Code Fragment 4
p0_fragment_10:
!	%l0 = 000000006c275400
	setx	0xdd5e28c7ea06b3da,%g7,%l0 ! %l0 = dd5e28c7ea06b3da
!	%l1 = 0000000000000000
	setx	0x1ef6008fd95bc49b,%g7,%l1 ! %l1 = 1ef6008fd95bc49b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = dd5e28c7ea06b3da
	setx	0x09fd9d17e1addee3,%g7,%l0 ! %l0 = 09fd9d17e1addee3
!	%l1 = 1ef6008fd95bc49b
	setx	0x3b0ca9887570038f,%g7,%l1 ! %l1 = 3b0ca9887570038f
	membar	#Sync			! Added by membar checker (39)
!	%f15 = edfc4a27, Mem[0000000030081410] = 00000000
	sta	%f15,[%i2+%o5]0x89	! Mem[0000000030081410] = edfc4a27
!	Mem[0000000030041408] = ff0000ff, %l0 = 09fd9d17e1addee3
	ldstuba	[%i1+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030141408] = 13003a30, %l3 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l3	! %l3 = 0000000013003a30
!	%l3 = 0000000013003a30, Mem[0000000010141408] = 00000000
	stwa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 13003a30
!	%l7 = 0000000000000000, Mem[0000000010081408] = 00000000000000ff
	stxa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	%l1 = 3b0ca9887570038f, Mem[0000000030041410] = 66ff0000
	stba	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 66ff008f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l1 = 3b0ca9887570038f
	lduha	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_253:
!	Mem[00000000211c0000] = 51300b46, %l0 = 00000000000000ff
	ldub	[%o2+%g0],%l0		! %l0 = 0000000000000051
!	Mem[0000000030081400] = 0054276c, %f14 = 00000030
	lda	[%i2+%g0]0x89,%f14	! %f14 = 0054276c
!	Mem[000000001010143c] = 00000000, %l1 = 0000000000000000
	lduba	[%i4+0x03c]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 00000030, %l5 = 00000000ffffff00
	ldsba	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000030
!	Mem[0000000030041408] = ff0000ffff000000, %l2 = 4cad7c8ad7632918
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = ff0000ffff000000
!	Mem[0000000010081410] = ff0000ff, %f29 = 1e58394a
	lda	[%i2+%o5]0x80,%f29	! %f29 = ff0000ff
!	Mem[0000000030141408] = 0000000000000000, %f28 = 63d79011 ff0000ff
	ldda	[%i5+%o4]0x89,%f28	! %f28 = 00000000 00000000
!	Mem[0000000030101408] = 2600ffff, %l2 = ff0000ffff000000
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = ff000000, %l3 = 0000000013003a30
	lduwa	[%i6+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%f15 = edfc4a27, Mem[0000000010081400] = ffffad05
	sta	%f15,[%i2+%g0]0x80	! Mem[0000000010081400] = edfc4a27

p0_label_254:
!	%l3 = 00000000ff000000, Mem[0000000010141400] = 000000ff
	stha	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%l7 = 0000000000000000, Mem[00000000100c1408] = ffad41ff
	stha	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffad0000
!	Mem[0000000010141414] = 00000000, %l0 = 0000000000000051
	swap	[%i5+0x014],%l0		! %l0 = 0000000000000000
!	%f2  = 30000000 000000fe, Mem[00000000300c1410] = 0000e279 6bf3de9c
	stda	%f2 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 30000000 000000fe
!	Mem[0000000030001410] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030101400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%f5  = ff0000ff, Mem[00000000300c1410] = 00000030
	sta	%f5 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff0000ff
!	%l4 = 0000000000000000, Mem[0000000010081414] = 29e41984, %asi = 80
	stha	%l4,[%i2+0x014]%asi	! Mem[0000000010081414] = 00001984
!	Mem[0000000010101410] = e5850284, %l6 = ffffff00000000ff
	swapa	[%i4+%o5]0x88,%l6	! %l6 = 00000000e5850284
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000 ffff0026 000005ad 00000000
!	Mem[0000000010041410] = 00000000 00000000 000000ff 00003aff
!	Mem[0000000010041420] = ffff0026 00ffffff 00000000 00000000
!	Mem[0000000010041430] = 00000000 00000030 ffffffff 00000000
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400

p0_label_255:
!	Mem[00000000100c1400] = 7b635a62, %f17 = ffffffff
	lda	[%i3+%g0]0x88,%f17	! %f17 = 7b635a62
!	Mem[0000000010181408] = ff000000, %l5 = 0000000000000030
	lduba	[%i6+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141408] = 13003a30, %l6 = 00000000e5850284
	lduha	[%i5+0x008]%asi,%l6	! %l6 = 0000000000001300
!	Mem[0000000010141410] = 0041ad0c, %l1 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000041
!	Mem[00000000201c0000] = ffff367d, %l6 = 0000000000001300
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141408] = 303a0013, %l5 = 00000000000000ff
	lduha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000013
!	Mem[0000000010181410] = 00000000, %l3 = 00000000ff000000
	lduba	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 00000000ffffad05, %f26 = 1c51514c 2638245c
	ldda	[%i0+%o4]0x81,%f26	! %f26 = 00000000 ffffad05
!	Mem[00000000100c1408] = 0000adff, %l3 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = ff817381, Mem[0000000010101410] = 000000ff
	sta	%f30,[%i4+%o5]0x88	! Mem[0000000010101410] = ff817381

p0_label_256:
!	Mem[00000000100c1420] = 00003a30, %l6 = ffffffffffffffff
	swap	[%i3+0x020],%l6		! %l6 = 0000000000003a30
!	Mem[0000000030001408] = 00000000, %l1 = 0000000000000041
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (40)
!	%f18 = 625a637b edfc4a27, Mem[0000000010041408] = 000005ad 00000000
	stda	%f18,[%i1+%o4]0x80	! Mem[0000000010041408] = 625a637b edfc4a27
!	Mem[0000000030181400] = ffffff00, %l2 = 00000000000000ff
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%f30 = ff817381 2e2c0000, Mem[0000000010181410] = 00000000 ff000000
	stda	%f30,[%i6+%o5]0x88	! Mem[0000000010181410] = ff817381 2e2c0000
!	%l0 = 00000000000000ff, Mem[0000000010141410] = 0cad4100
	stba	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0cad41ff
!	%l4 = 0000000000000000, Mem[0000000010181400] = ff000000
	stha	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%f2  = 000005ad 00000000, Mem[0000000030181408] = 000000ff 12af2c2e
	stda	%f2 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 000005ad 00000000
!	%f18 = 625a637b edfc4a27, %l7 = 0000000000000000
!	Mem[0000000030041438] = ff004e20303ac9ff
	add	%i1,0x038,%g1
	stda	%f18,[%g1+%l7]ASI_PST16_S ! Mem[0000000030041438] = ff004e20303ac9ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 7b635a62, %l7 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l7	! %l7 = 000000007b635a62

p0_label_257:
!	Mem[0000000030141410] = 0000000000ffffff, %f4  = 00000000 00000000
	ldda	[%i5+%o5]0x89,%f4 	! %f4  = 00000000 00ffffff
!	Mem[0000000010041400] = 00000000, %f7  = 00003aff
	lda	[%i1+%g0]0x88,%f7 	! %f7 = 00000000
!	Mem[0000000030041400] = 0000000000ffffff, %f18 = 625a637b edfc4a27
	ldda	[%i1+%g0]0x81,%f18	! %f18 = 00000000 00ffffff
!	Mem[0000000010001418] = fe1adf4b2e0000ff, %l6 = 0000000000003a30
	ldx	[%i0+0x018],%l6		! %l6 = fe1adf4b2e0000ff
!	Mem[0000000030041400] = ffffff0000000000, %l2 = 0000000000000000
	ldxa	[%i1+%g0]0x89,%l2	! %l2 = ffffff0000000000
!	Mem[0000000030001410] = 00000000000000ff, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001400] = 000000ff, %l0 = 00000000000000ff
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = 00ffffff, %l1 = 00000000000000ff
	ldswa	[%i5+%o5]0x89,%l1	! %l1 = 0000000000ffffff
!	Mem[0000000010141408] = 13003a30, %l7 = 000000007b635a62
	ldswa	[%i5+%o4]0x80,%l7	! %l7 = 0000000013003a30
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 13003a30, %l6 = fe1adf4b2e0000ff
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 00000013000000ff

p0_label_258:
!	%l2 = ffffff0000000000, Mem[0000000010001410] = 2226ddf8
	stha	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 22260000
!	%f11 = 00000000, Mem[0000000030141408] = 00000000
	sta	%f11,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Mem[000000001000142c] = 8a7cad4c, %l6 = 0000000000000013
	swap	[%i0+0x02c],%l6		! %l6 = 000000008a7cad4c
!	Mem[0000000010141400] = 00000000, %l7 = 0000000013003a30
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = 000000ff, %l1 = 0000000000ffffff
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[0000000010041410] = 00000000
	stha	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	Mem[0000000010181410] = 2e2c0000, %l5 = 0000000000000013
	swapa	[%i6+%o5]0x88,%l5	! %l5 = 000000002e2c0000
!	%f6  = 000000ff 00000000, %l2 = ffffff0000000000
!	Mem[0000000030181418] = 0000dce974bb0000
	add	%i6,0x018,%g1
	stda	%f6,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030181418] = 0000dce974bb0000
!	%l5 = 000000002e2c0000, Mem[00000000201c0000] = ffff367d, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000367d
!	Starting 10 instruction Load Burst
!	Mem[000000001008141c] = 000005ad, %l0 = 00000000000000ff
	ldsh	[%i2+0x01e],%l0		! %l0 = 00000000000005ad

p0_label_259:
!	Mem[0000000010141408] = ff003a30, %l7 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030001410] = 000000ff, %f11 = 00000000
	lda	[%i0+%o5]0x89,%f11	! %f11 = 000000ff
!	Mem[0000000010041410] = 0000000000000000, %f22 = 4770ac80 ee7d8c6c
	ldda	[%i1+%o5]0x80,%f22	! %f22 = 00000000 00000000
!	Mem[0000000010001410] = 00002622ff05a404, %l1 = 00000000000000ff
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = 00002622ff05a404
!	Mem[0000000030041408] = ff0000ffff000000, %l2 = ffffff0000000000
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = ff0000ffff000000
!	Mem[0000000030081400] = 6c275400ffffffff, %l0 = 00000000000005ad
	ldxa	[%i2+%g0]0x81,%l0	! %l0 = 6c275400ffffffff
!	Mem[0000000030181408] = 00000000, %f23 = 00000000
	lda	[%i6+%o4]0x81,%f23	! %f23 = 00000000
!	Mem[00000000218001c0] = 00004fd1, %l7 = ffffffffffffff00
	lduha	[%o3+0x1c0]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = ff41ad0c, %l2 = ff0000ffff000000
	ldswa	[%i5+%o5]0x80,%l2	! %l2 = ffffffffff41ad0c
!	Starting 10 instruction Store Burst
!	Mem[00000000100c142c] = 0000ff00, %l5 = 2e2c0000, %l6 = 8a7cad4c
	add	%i3,0x2c,%g1
	casa	[%g1]0x80,%l5,%l6	! %l6 = 000000000000ff00

p0_label_260:
!	%l5 = 000000002e2c0000, Mem[0000000010081400] = 274afced
	stwa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 2e2c0000
!	%l4 = 00000000, %l5 = 2e2c0000, Mem[0000000030041410] = 8f00ff66 14eb7ae0
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 2e2c0000
!	%l0 = 6c275400ffffffff, Mem[0000000030081408] = 7b635a62
	stba	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 7b635aff
!	%l0 = 6c275400ffffffff, Mem[0000000021800001] = 59ff0c06
	stb	%l0,[%o3+0x001]		! Mem[0000000021800000] = 59ff0c06
!	%l3 = 0000000000000000, Mem[0000000030041410] = 00000000
	stba	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	Mem[00000000100c1408] = 0000adff, %l2 = ffffffffff41ad0c
	swap	[%i3+%o4],%l2		! %l2 = 000000000000adff
!	%f22 = 00000000 00000000, %l3 = 0000000000000000
!	Mem[0000000030041420] = 209cc3f9a9150caf
	add	%i1,0x020,%g1
	stda	%f22,[%g1+%l3]ASI_PST8_S ! Mem[0000000030041420] = 209cc3f9a9150caf
!	%l3 = 0000000000000000, Mem[00000000300c1410] = ff0000ff
	stha	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff
!	%l5 = 000000002e2c0000, Mem[0000000010181400] = ffffff0000000000
	stxa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000002e2c0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141404] = 00000000, %l4 = 0000000000000000
	lduwa	[%i5+0x004]%asi,%l4	! %l4 = 0000000000000000

p0_label_261:
!	Mem[0000000010141400] = 000000ff, %l6 = 000000000000ff00
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = 4cad7c8a, %l5 = 000000002e2c0000
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = 000000000000004c
!	Mem[00000000201c0000] = 0000367d, %l5 = 000000000000004c
	lduh	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010001408] = ff000000 6bb30828, %l0 = ffffffff, %l1 = ff05a404
	ldda	[%i0+0x008]%asi,%l0	! %l0 = 00000000ff000000 000000006bb30828
!	Mem[0000000030081408] = 7b635aff, %l7 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l7	! %l7 = 0000000000005aff
!	Mem[0000000010141410] = 0cad41ff, %f6  = 000000ff
	lda	[%i5+%o5]0x88,%f6 	! %f6 = 0cad41ff
!	Mem[0000000010001434] = 2e2caf12, %l4 = 0000000000000000
	ldsb	[%i0+0x036],%l4		! %l4 = ffffffffffffffaf
!	Mem[0000000030101400] = 000000ff, %l3 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0000] = 51300b46, %l2 = 000000000000adff
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = 0000000000000030
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ff41ad0c, %l3 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 00000000ff41ad0c

p0_label_262:
!	%f16 = 6c275400, Mem[0000000030181400] = ffffffff
	sta	%f16,[%i6+%g0]0x89	! Mem[0000000030181400] = 6c275400
!	%l4 = ffffffffffffffaf, Mem[00000000100c1427] = 00000000, %asi = 80
	stba	%l4,[%i3+0x027]%asi	! Mem[00000000100c1424] = 000000af
!	Mem[0000000030101408] = ffff0026, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 00000000ffff0026
!	%l2 = 00000030, %l3 = ff41ad0c, Mem[0000000010101400] = 00000000 ffffff00
	stda	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000030 ff41ad0c
!	Mem[0000000030101408] = 00000000, %l0 = 00000000ff000000
	swapa	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010041408] = 625a637b
	stwa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l5 = 00000000ffff0026, Mem[0000000020800040] = 01ff9e9b, %asi = 80
	stba	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = 26ff9e9b
!	Mem[0000000030181408] = 00000000, %l4 = ffffffffffffffaf
	ldstuba	[%i6+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%f31 = 2e2c0000, Mem[00000000300c1400] = 00000000
	sta	%f31,[%i3+%g0]0x89	! Mem[00000000300c1400] = 2e2c0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 05adffff000000ff, %l1 = 000000006bb30828
	ldxa	[%i0+%o4]0x89,%l1	! %l1 = 05adffff000000ff

p0_label_263:
!	Mem[0000000030141410] = 00ffffff, %l1 = 05adffff000000ff
	ldsba	[%i5+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101418] = 00000000, %l6 = 00000000000000ff
	ldub	[%i4+0x01b],%l6		! %l6 = 0000000000000000
!	Mem[0000000020800000] = 0000188e, %l6 = 0000000000000000
	lduh	[%o1+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041410] = 000000002e2c0000, %f22 = 00000000 00000000
	ldda	[%i1+%o5]0x81,%f22	! %f22 = 00000000 2e2c0000
!	Mem[00000000201c0000] = 0000367d, %l0 = 0000000000000000
	ldsba	[%o0+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l6 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = ff0000ff00001984, %l1 = ffffffffffffffff
	ldxa	[%i2+%o5]0x80,%l1	! %l1 = ff0000ff00001984
!	Mem[0000000030001410] = 000000ff, %l0 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 274afced00000000, %f4  = 00000000 00ffffff
	ldda	[%i1+%o4]0x88,%f4 	! %f4  = 274afced 00000000
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ff41ad0c, Mem[0000000030041408] = ff0000ff
	stba	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = ff00000c

p0_label_264:
!	Mem[0000000010141400] = 000000ff, %l1 = ff0000ff00001984
	ldstuba	[%i5+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%f28 = 00000000 00000000, Mem[0000000010041428] = 00000000 00000000
	stda	%f28,[%i1+0x028]%asi	! Mem[0000000010041428] = 00000000 00000000
!	%l0 = 00000000000000ff, Mem[0000000010141410] = 510000000cad41ff
	stxa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000000ff
!	Mem[0000000010141410] = 000000ff, %l0 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000021800141] = 6a3ae6e1, %l3 = 00000000ff41ad0c
	ldstuba	[%o3+0x141]%asi,%l3	! %l3 = 0000003a000000ff
!	%f0  = 00000000 ffff0026, Mem[0000000010141408] = 303a00ff 2600ffff
	stda	%f0 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 ffff0026
!	%f3  = 00000000, Mem[0000000010041410] = 00000000
	sta	%f3 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l7 = 0000000000005aff, Mem[0000000010141400] = ff00000000000000
	stxa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000005aff
!	Mem[00000000300c1400] = 00002c2e, %l5 = 00000000ffff0026
	swapa	[%i3+%g0]0x81,%l5	! %l5 = 0000000000002c2e
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l1 = 00000000000000ff
	lduha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_265:
!	Mem[00000000300c1408] = 0000f8c100000000, %l3 = 000000000000003a
	ldxa	[%i3+%o4]0x81,%l3	! %l3 = 0000f8c100000000
!	Mem[0000000010001430] = 000000ff2e2caf12, %f10 = 00000000 000000ff
	ldda	[%i0+0x030]%asi,%f10	! %f10 = 000000ff 2e2caf12
!	Mem[0000000010001408] = ff000000, %l1 = 0000000000000000
	lduba	[%i0+0x009]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = ff5a637b, %l1 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l1	! %l1 = ffffffffff5a637b
!	Mem[0000000030041408] = 0c0000ff, %l0 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = 000000000000000c
!	Mem[0000000030101410] = 00000000ffff0026, %l0 = 000000000000000c
	ldxa	[%i4+%o5]0x89,%l0	! %l0 = 00000000ffff0026
!	Mem[0000000030141408] = 00000000, %l7 = 0000000000005aff
	ldswa	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[000000001014143c] = 0000de9c, %l2 = 0000000000000030
	ldswa	[%i5+0x03c]%asi,%l2	! %l2 = 000000000000de9c
!	Mem[0000000010041400] = 00000000, %l7 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ff000000, %l5 = 0000000000002c2e
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 000000ff000000ff

p0_label_266:
!	%f22 = 00000000 2e2c0000, %l3 = 0000f8c100000000
!	Mem[0000000010101410] = 817381ff305122b4
	add	%i4,0x010,%g1
	stda	%f22,[%g1+%l3]ASI_PST16_P ! Mem[0000000010101410] = 817381ff305122b4
!	Mem[00000000100c1422] = ffffffff, %l0 = 00000000ffff0026
	ldstuba	[%i3+0x022]%asi,%l0	! %l0 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[00000000100c1408] = 000000ff00000000
	stxa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	%f30 = ff817381 2e2c0000, %l1 = ffffffffff5a637b
!	Mem[00000000300c1430] = 9cdef36b332e64f0
	add	%i3,0x030,%g1
	stda	%f30,[%g1+%l1]ASI_PST32_S ! Mem[00000000300c1430] = ff8173812e2c0000
!	%f25 = 13015707, Mem[000000001018141c] = 8c959c93
	st	%f25,[%i6+0x01c]	! Mem[000000001018141c] = 13015707
!	Mem[0000000010001408] = 000000ff, %l1 = ffffffffff5a637b
	swapa	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = 00000013, %l0 = 00000000000000ff
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000013
!	%l6 = 00000000000000ff, Mem[00000000300c1410] = 000000ff000000fe
	stxa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000000000ff
!	%l0 = 0000000000000013, Mem[0000000030001408] = ff000000
	stba	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 13000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 0054276c, %l2 = 000000000000de9c
	lduwa	[%i2+%g0]0x89,%l2	! %l2 = 000000000054276c

p0_label_267:
!	Mem[00000000300c1408] = c1f80000, %l1 = 00000000000000ff
	lduba	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 22260000, %l1 = 0000000000000000
	ldsha	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = ff5a637b, %l3 = 0000f8c100000000
	lduba	[%i2+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101410] = 00000000 ffff0026, %l2 = 0054276c, %l3 = 000000ff
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 00000000ffff0026 0000000000000000
!	Mem[0000000010181408] = ff000000, %f13 = 00000030
	lda	[%i6+%o4]0x80,%f13	! %f13 = ff000000
!	Mem[0000000030041400] = ffffff0000000000, %f18 = 00000000 00ffffff
	ldda	[%i1+%g0]0x89,%f18	! %f18 = ffffff00 00000000
!	Mem[0000000030101400] = ff000000, %l3 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030001408] = 13000000, %l6 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000013
!	Mem[0000000010181400] = 00002c2e, %l7 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000021800100] = ffa56996, %asi = 80
	stha	%l5,[%o3+0x100]%asi	! Mem[0000000021800100] = 00ff6996

p0_label_268:
!	Mem[000000001018140a] = ff000000, %l5 = 00000000000000ff
	ldstub	[%i6+0x00a],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030001410] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000010181408] = ff00ff00
	stba	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = ff00ff00
!	Mem[0000000010081410] = ff0000ff, %l6 = 0000000000000013
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000030101400] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	%f3  = 00000000, Mem[0000000010041408] = 00000000
	sta	%f3 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[00000000300c1400] = 2600ffff, %l2 = 00000000ffff0026
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 000000002600ffff
!	%l2 = 000000002600ffff, Mem[00000000201c0000] = 0000367d
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = ffff367d
!	%f2  = 000005ad 00000000, Mem[0000000010141438] = 00000000 0000de9c
	stda	%f2 ,[%i5+0x038]%asi	! Mem[0000000010141438] = 000005ad 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 0000000000000000, %f30 = ff817381 2e2c0000
	ldda	[%i1+%o5]0x88,%f30	! %f30 = 00000000 00000000

p0_label_269:
!	Mem[00000000201c0000] = ffff367d, %l7 = 00000000000000ff
	lduba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101410] = 2600ffff, %l7 = 00000000000000ff
	ldsba	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000026
!	Mem[0000000010101410] = 817381ff, %f25 = 13015707
	lda	[%i4+%o5]0x80,%f25	! %f25 = 817381ff
!	Mem[0000000030101400] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101428] = 00ff0000 2808b36b, %l6 = ff0000ff, %l7 = 00000026
	ldd	[%i4+0x028],%l6		! %l6 = 0000000000ff0000 000000002808b36b
!	Mem[0000000010141404] = 00005aff, %l1 = ffffffffffffffff
	ldsha	[%i5+0x004]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %f5  = 00000000
	lda	[%i1+%o5]0x88,%f5 	! %f5 = 00000000
!	Mem[0000000030041400] = ffffff00 00000000, %l0 = 00000013, %l1 = 00000000
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000 00000000ffffff00
!	Mem[0000000010041420] = ffff0026 00ffffff, %l0 = 00000000, %l1 = ffffff00
	ldda	[%i1+0x020]%asi,%l0	! %l0 = 00000000ffff0026 0000000000ffffff
!	Starting 10 instruction Store Burst
!	%l0 = ffff0026, %l1 = 00ffffff, Mem[0000000010041408] = 00000000 274afced
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff0026 00ffffff

p0_label_270:
!	%f16 = 6c275400 7b635a62, Mem[0000000010101400] = 30000000 0cad41ff
	stda	%f16,[%i4+0x000]%asi	! Mem[0000000010101400] = 6c275400 7b635a62
!	%f31 = 00000000, Mem[0000000010081410] = 13000000
	sta	%f31,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%l6 = 00ff0000, %l7 = 2808b36b, Mem[0000000030081408] = 7b635aff 274afced
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 00ff0000 2808b36b
!	%l4 = 00000000000000ff, Mem[0000000010101408] = 0000000000ffffff
	stxa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000000000ff
!	%l3 = ffffffffff000000, Mem[0000000010081422] = 00000000, %asi = 80
	stha	%l3,[%i2+0x022]%asi	! Mem[0000000010081420] = 00000000
!	%f14 = ffffffff 00000000, %l7 = 000000002808b36b
!	Mem[0000000030181400] = 0054276c00000000
	stda	%f14,[%i6+%l7]ASI_PST32_SL ! Mem[0000000030181400] = 00000000ffffffff
!	%f0  = 00000000 ffff0026 000005ad 00000000
!	%f4  = 274afced 00000000 0cad41ff 00000000
!	%f8  = ffff0026 00ffffff 000000ff 2e2caf12
!	%f12 = 00000000 ff000000 ffffffff 00000000
	stda	%f0,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%l0 = 00000000ffff0026, Mem[0000000030101408] = 000000ff
	stba	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 260000ff
!	%l2 = 2600ffff, %l3 = ff000000, Mem[0000000010081408] = 00000000 00000000
	stda	%l2,[%i2+0x008]%asi	! Mem[0000000010081408] = 2600ffff ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = b4225130ff817381, %l1 = 0000000000ffffff
	ldxa	[%i4+%o5]0x88,%l1	! %l1 = b4225130ff817381

p0_label_271:
!	Mem[00000000211c0000] = 51300b46, %l7 = 000000002808b36b
	ldsh	[%o2+%g0],%l7		! %l7 = 0000000000005130
!	Mem[0000000030181410] = 000000ff, %l0 = 00000000ffff0026
	ldswa	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = 00000000ffff0026, %f26 = 00000000 ffffad05
	ldda	[%i5+%o4]0x88,%f26	! %f26 = 00000000 ffff0026
!	Mem[0000000030181410] = ff000000, %l0 = 00000000000000ff
	ldsha	[%i6+%o5]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010141420] = 0054276c ff51511c, %l0 = ffffff00, %l1 = ff817381
	ldda	[%i5+0x020]%asi,%l0	! %l0 = 000000000054276c 00000000ff51511c
!	Mem[0000000030141400] = 00000030, %l3 = ffffffffff000000
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000030
!	Mem[0000000010181408] = 00ff00ff, %l1 = 00000000ff51511c
	ldsba	[%i6+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000ffff0026, %l2 = 000000002600ffff
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = 00000000ffff0026
!	Mem[0000000010101414] = 305122b4, %l1 = ffffffffffffffff
	ldsha	[%i4+0x016]%asi,%l1	! %l1 = 00000000000022b4
!	Starting 10 instruction Store Burst
!	%f22 = 00000000 2e2c0000, %l5 = 0000000000000000
!	Mem[0000000010141430] = 0000000000000030
	add	%i5,0x030,%g1
	stda	%f22,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010141430] = 0000000000000030

p0_label_272:
!	Mem[0000000010181410] = ff000000, %l6 = 0000000000ff0000
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010141410] = ff00000000000000
	stxa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	Mem[0000000030101400] = ff000000, %l6 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%f24 = 0000b0b6 817381ff, %l2 = 00000000ffff0026
!	Mem[0000000030141428] = 6bb308280000ff00
	add	%i5,0x028,%g1
	stda	%f24,[%g1+%l2]ASI_PST32_S ! Mem[0000000030141428] = 0000b0b60000ff00
!	%l7 = 0000000000005130, Mem[00000000100c1408] = 0000000000000000
	stx	%l7,[%i3+%o4]		! Mem[00000000100c1408] = 0000000000005130
!	%f22 = 00000000, Mem[0000000010101408] = ff000000
	sta	%f22,[%i4+0x008]%asi	! Mem[0000000010101408] = 00000000
!	Mem[0000000010041408] = 2600ffff, %l2 = 00000000ffff0026
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 000000002600ffff
!	%f16 = 6c275400, Mem[0000000010081408] = 2600ffff
	sta	%f16,[%i2+%o4]0x80	! Mem[0000000010081408] = 6c275400
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000030081400] = 2600ffff, %l6 = 00000000000000ff
	ldstuba	[%i2+%g0]0x81,%l6	! %l6 = 00000026000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00002c2e 000000ff, %l6 = 00000026, %l7 = 00005130
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 0000000000002c2e 00000000000000ff

p0_label_273:
!	Mem[0000000030101410] = 2600ffff, %f31 = 00000000
	lda	[%i4+%o5]0x81,%f31	! %f31 = 2600ffff
!	Mem[0000000010001408] = 7b635aff, %l0 = 000000000054276c
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = 000000000000007b
!	Mem[00000000300c1400] = 2600ffff, %f31 = 2600ffff
	lda	[%i3+%g0]0x81,%f31	! %f31 = 2600ffff
!	Mem[0000000010181408] = 00ff00ff, %l2 = 000000002600ffff
	lduwa	[%i6+%o4]0x88,%l2	! %l2 = 0000000000ff00ff
!	Mem[0000000010081400] = 2e2c0000, %l3 = 0000000000000030
	ldswa	[%i2+%g0]0x88,%l3	! %l3 = 000000002e2c0000
!	Mem[0000000030101410] = 2600ffff00000000, %f18 = ffffff00 00000000
	ldda	[%i4+%o5]0x81,%f18	! %f18 = 2600ffff 00000000
!	Mem[0000000030041400] = 00000000, %l3 = 000000002e2c0000
	ldswa	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 7b635aff, %l2 = 0000000000ff00ff
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 000000007b635aff
!	Mem[0000000010001408] = 7b635aff6bb30828, %f20 = 00000000 6bb30828
	ldda	[%i0+%o4]0x80,%f20	! %f20 = 7b635aff 6bb30828
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000030141408] = 00000000
	stba	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000

p0_label_274:
!	%l6 = 00002c2e, %l7 = 000000ff, Mem[0000000030041408] = ff00000c 000000ff
	stda	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00002c2e 000000ff
!	Mem[00000000201c0001] = ffff367d, %l5 = 0000000000000000
	ldstub	[%o0+0x001],%l5		! %l5 = 000000ff000000ff
!	Mem[0000000020800000] = 0000188e, %l1 = 00000000000022b4
	ldstub	[%o1+%g0],%l1		! %l1 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000030041408] = 2e2c0000ff000000
	stxa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000000ff
!	%f30 = 00000000, Mem[0000000010101410] = 817381ff
	sta	%f30,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%f16 = 6c275400 7b635a62, %l2 = 000000007b635aff
!	Mem[0000000030081428] = 12af2c2eff000000
	add	%i2,0x028,%g1
	stda	%f16,[%g1+%l2]ASI_PST8_S ! Mem[0000000030081428] = 6c2754007b635a62
!	%l1 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stwa	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010101408] = 00000000, %l0 = 000000000000007b
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[00000000300c1400] = 00000000ffff0026
	stxa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101424] = 332e64f0, %l7 = 00000000000000ff
	lduh	[%i4+0x024],%l7		! %l7 = 000000000000332e

p0_label_275:
!	Mem[00000000300c1410] = 00000000, %f27 = ffff0026
	lda	[%i3+%o5]0x89,%f27	! %f27 = 00000000
!	Mem[0000000010141408] = ffff0026, %f6  = 0cad41ff
	lda	[%i5+%o4]0x88,%f6 	! %f6 = ffff0026
!	%f1  = ffff0026, %f9  = 00ffffff
	fsqrts	%f1 ,%f9 		! %f9  = ffff0026
!	Mem[0000000030141408] = ff000000, %l5 = 00000000000000ff
	ldswa	[%i5+%o4]0x81,%l5	! %l5 = ffffffffff000000
!	Mem[0000000020800040] = 26ff9e9b, %l4 = 00000000000000ff
	ldub	[%o1+0x040],%l4		! %l4 = 0000000000000026
!	Mem[0000000030101410] = 2600ffff, %l6 = 0000000000002c2e
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000026
!	Mem[0000000010141418] = 00ff0000, %l1 = 0000000000000000
	lduba	[%i5+0x01b]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 00000000ffff0026, %l0 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = 00000000ffff0026
!	Mem[0000000010141408] = 2600ffff00000000, %f24 = 0000b0b6 817381ff
	ldda	[%i5+%o4]0x80,%f24	! %f24 = 2600ffff 00000000
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffff000000, Mem[00000000300c1408] = 0000f8c1
	stwa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000

p0_label_276:
!	%f1  = ffff0026, Mem[0000000030181400] = 00000000
	sta	%f1 ,[%i6+%g0]0x81	! Mem[0000000030181400] = ffff0026
!	%f26 = 00000000 00000000, Mem[0000000010141408] = ffff0026 00000000
	stda	%f26,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 00000000
!	%l1 = 0000000000000000, Mem[00000000100c1412] = 4cad7c8a, %asi = 80
	stha	%l1,[%i3+0x012]%asi	! Mem[00000000100c1410] = 4cad0000
!	%f26 = 00000000, Mem[0000000010041400] = 00000000
	sta	%f26,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%l4 = 0000000000000026, Mem[0000000030081410] = 00000000
	stha	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00260000
!	%f28 = 00000000 00000000, %l0 = 00000000ffff0026
!	Mem[0000000010141418] = 00ff0000840285e5
	add	%i5,0x018,%g1
	stda	%f28,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010141418] = 00000000840085e5
!	Mem[00000000300c1400] = ff000000, %l5 = ffffffffff000000
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	%f26 = 00000000 00000000, %l4 = 0000000000000026
!	Mem[0000000030041410] = 000000002e2c0000
	add	%i1,0x010,%g1
	stda	%f26,[%g1+%l4]ASI_PST16_S ! Mem[0000000030041410] = 0000000000000000
!	Mem[0000000010101408] = 0000007b, %l4 = 0000000000000026
	ldstuba	[%i4+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000

p0_label_277:
!	Mem[0000000010041410] = 00000000, %f23 = 2e2c0000
	lda	[%i1+%o5]0x88,%f23	! %f23 = 00000000
!	Mem[0000000010081424] = bb38245c, %l7 = 000000000000332e
	ldsh	[%i2+0x026],%l7		! %l7 = 000000000000245c
!	Mem[0000000010101428] = 00ff0000 2808b36b, %l2 = 7b635aff, %l3 = 00000000
	ldd	[%i4+0x028],%l2		! %l2 = 0000000000ff0000 000000002808b36b
!	Mem[0000000030041410] = 00000000 00000000, %l0 = ffff0026, %l1 = 00000000
	ldda	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000000000
	lduba	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 0054276c, %l0 = 0000000000000000
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 000000000000006c
!	Mem[0000000010081400] = 2e2c0000, %l5 = 00000000000000ff
	ldsba	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = ffff0026, %l4 = 0000000000000000
	ldswa	[%i6+%g0]0x81,%l4	! %l4 = ffffffffffff0026
!	Mem[0000000030001400] = 000000ff, %l6 = 0000000000000026
	ldswa	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010141410] = 00000000
	stba	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000

p0_label_278:
!	Mem[0000000010081410] = 00000000, %l4 = ffff0026, %l2 = 00ff0000
	add	%i2,0x10,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 0000000000000000
!	%f28 = 00000000, Mem[0000000030041410] = 00000000
	sta	%f28,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	Mem[000000001000141a] = fe1adf4b, %l0 = 000000000000006c
	ldstuba	[%i0+0x01a]%asi,%l0	! %l0 = 000000df000000ff
!	%f26 = 00000000 00000000, Mem[0000000030101408] = ff000026 28084e20
	stda	%f26,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 00000000
!	%f21 = 6bb30828, Mem[0000000010181400] = 2e2c0000
	sta	%f21,[%i6+%g0]0x88	! Mem[0000000010181400] = 6bb30828
!	%l6 = 00000000000000ff, Mem[0000000010081410] = 00000000
	stwa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	%l0 = 00000000000000df, Mem[00000000100c1418] = 00000000, %asi = 80
	stwa	%l0,[%i3+0x018]%asi	! Mem[00000000100c1418] = 000000df
!	%f0  = 00000000 ffff0026 000005ad 00000000
!	%f4  = 274afced 00000000 ffff0026 00000000
!	%f8  = ffff0026 ffff0026 000000ff 2e2caf12
!	%f12 = 00000000 ff000000 ffffffff 00000000
	stda	%f0,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%l4 = ffff0026, %l5 = 00000000, Mem[0000000030141400] = 00000030 00000000
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = ffff0026 00000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000010001400] = ffff0026, %l3 = 000000002808b36b
	ldswa	[%i0+%g0]0x88,%l3	! %l3 = ffffffffffff0026

p0_label_279:
!	%l2 = 0000000000000000, imm = fffffffffffff24e, %l3 = ffffffffffff0026
	addc	%l2,-0xdb2,%l3		! %l3 = fffffffffffff24e
!	Mem[0000000030181400] = ffff0026, %l4 = ffffffffffff0026
	lduha	[%i6+%g0]0x81,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030041410] = 00000000, %l0 = 00000000000000df
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 000005ad00000000, %l1 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l1	! %l1 = 000005ad00000000
!	Mem[0000000030001400] = ff00000000000000, %l5 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l5	! %l5 = ff00000000000000
!	Mem[000000001008140c] = ff000000, %l3 = fffffffffffff24e
	ldsba	[%i2+0x00f]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = b422513000000000, %l7 = 000000000000245c
	ldxa	[%i4+%o5]0x88,%l7	! %l7 = b422513000000000
!	Mem[0000000030181408] = ff000000, %l7 = b422513000000000
	lduba	[%i6+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = 2808b36b00000000, %f0  = 00000000 ffff0026
	ldda	[%i6+%g0]0x80,%f0 	! %f0  = 2808b36b 00000000
!	Starting 10 instruction Store Burst
!	%f30 = 00000000, Mem[0000000030181408] = 000000ff
	sta	%f30,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000

p0_label_280:
!	%l5 = ff00000000000000, Mem[00000000100c1400] = 7b635a62
	stba	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 7b635a00
!	%f4  = 274afced, Mem[0000000010001410] = 00000000
	sta	%f4 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 274afced
!	%l0 = 0000000000000000, Mem[0000000010001410] = 274afcededfc4a27
	stxa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	%l1 = 000005ad00000000, Mem[00000000201c0001] = ffff367d
	stb	%l1,[%o0+0x001]		! Mem[00000000201c0000] = ff00367d
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = 005a637b
	stha	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00ff637b
!	Mem[0000000010001410] = 00000000, %l6 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l4 = 000000000000ffff, Mem[0000000010041408] = 00ffffff2600ffff
	stxa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000000000ffff
!	Mem[0000000021800101] = 00ff6996, %l5 = ff00000000000000
	ldstuba	[%o3+0x101]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030001408] = 00000013, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 00000013000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ff000000, %l1 = 000005ad00000000
	lduha	[%i0+%g0]0x81,%l1	! %l1 = 000000000000ff00

p0_label_281:
!	Mem[0000000030001400] = 000000ff, %f14 = ffffffff
	lda	[%i0+%g0]0x89,%f14	! %f14 = 000000ff
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000030181400] = ffff0026 ffffffff 00000000 ad050000
!	Mem[0000000030181410] = ff000000 00000000 0000dce9 74bb0000
!	Mem[0000000030181420] = 7f52bcee 60e0e3bb fe747889 f8dd2622
!	Mem[0000000030181430] = 4cad7c8a 0926e279 274afced 7b635a62
	ldda	[%i6]ASI_BLK_SL,%f16	! Block Load from 0000000030181400
!	Mem[0000000030081410] = 00002600, %l2 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l2	! %l2 = 0000000000002600
!	Mem[0000000010001430] = 000000ff, %l6 = 0000000000000000
	ldub	[%i0+0x031],%l6		! %l6 = 0000000000000000
!	Mem[0000000030081410] = 274afced00002600, %f14 = 000000ff 00000000
	ldda	[%i2+%o5]0x89,%f14	! %f14 = 274afced 00002600
!	Mem[00000000100c1400] = 7b63ff00, %l0 = 0000000000000013
	lduwa	[%i3+%g0]0x88,%l0	! %l0 = 000000007b63ff00
!	Mem[0000000030001408] = 000000ff, %l4 = 000000000000ffff
	lduha	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = 000000ff, %l0 = 000000007b63ff00
	lduha	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001408] = 000005ad00000000, %f6  = ffff0026 00000000
	ldda	[%i0+%o4]0x88,%f6 	! %f6  = 000005ad 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 7b0000ff, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 000000ff000000ff

p0_label_282:
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%f10 = 000000ff 2e2caf12, Mem[0000000010041408] = ffff0000 00000000
	stda	%f10,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff 2e2caf12
!	%f0  = 2808b36b, Mem[0000000010001434] = 00000000
	st	%f0 ,[%i0+0x034]	! Mem[0000000010001434] = 2808b36b
!	%l4 = 00000000000000ff, Mem[0000000030041400] = 00000000
	stba	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	Mem[0000000010081400] = 00002c2e, %l4 = 00000000000000ff
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%l1 = 000000000000ff00, Mem[0000000030041400] = ff000000
	stba	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%l1 = 000000000000ff00, Mem[0000000010181400] = 000000006bb30828
	stxa	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000000000ff00
!	Mem[00000000211c0000] = 51300b46, %l2 = 0000000000002600
	ldstub	[%o2+%g0],%l2		! %l2 = 00000051000000ff
!	%l0 = 00000000000000ff, Mem[0000000030001410] = 00000000000000ff
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_283:
!	Mem[0000000010141410] = 00000000 00000000, %l0 = 000000ff, %l1 = 0000ff00
	ldd	[%i5+%o5],%l0		! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800100] = 00ff6996, %l7 = 00000000000000ff
	ldub	[%o3+0x100],%l7		! %l7 = 0000000000000000
!	Mem[0000000020800040] = 26ff9e9b, %l5 = 00000000000000ff
	lduh	[%o1+0x040],%l5		! %l5 = 00000000000026ff
!	Mem[0000000010001400] = 00000000 ffff0026, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 00000000ffff0026 0000000000000000
!	Mem[0000000010181408] = ff00ff00, %l0 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i5+%o4]0x80,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000030101400] = ff000000 00003a30 00000000 00000000
!	Mem[0000000030101410] = 2600ffff 00000000 305122b4 14eb7ae0
!	Mem[0000000030101420] = 5c92e244 121321b5 28512d10 6bb30828
!	Mem[0000000030101430] = f6b3e679 c0a561e3 6c275400 15b72d80
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[0000000020800040] = 26ff9e9b, %l6 = 00000000ffff0026
	lduh	[%o1+0x040],%l6		! %l6 = 00000000000026ff
!	Starting 10 instruction Store Burst
!	Mem[000000001008141a] = ff00c8ff, %l0 = ffffffffffffffff
	ldstuba	[%i2+0x01a]%asi,%l0	! %l0 = 000000c8000000ff

p0_label_284:
!	%l5 = 00000000000026ff, Mem[0000000010001421] = 2600ffff
	stb	%l5,[%i0+0x021]		! Mem[0000000010001420] = 26ffffff
!	Mem[0000000010001408] = 00000000, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181410] = 000000ff, %l2 = 0000000000000051
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	%f30 = 625a637b edfc4a27, Mem[0000000010101410] = 00000000 305122b4
	stda	%f30,[%i4+%o5]0x80	! Mem[0000000010101410] = 625a637b edfc4a27
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000030081400] = ffff00ff 00000000
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff 00000000
!	%l0 = 000000c8, %l1 = 00000000, Mem[0000000010001408] = 00000000 000005ad
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000c8 00000000
!	%f18 = 000005ad 00000000, Mem[0000000030181400] = ffff0026 ffffffff
	stda	%f18,[%i6+%g0]0x81	! Mem[0000000030181400] = 000005ad 00000000
!	%f24 = bbe3e060 eebc527f, Mem[0000000010101410] = 625a637b edfc4a27
	stda	%f24,[%i4+0x010]%asi	! Mem[0000000010101410] = bbe3e060 eebc527f
!	Mem[0000000010101410] = 60e0e3bb, %l4 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 0000000060e0e3bb
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000000, %l2 = 00000000000000ff
	ldswa	[%i2+%o5]0x80,%l2	! %l2 = ffffffffff000000

p0_label_285:
!	Mem[00000000100c1410] = 0000ad4c, %l5 = 00000000000026ff
	ldswa	[%i3+%o5]0x88,%l5	! %l5 = 000000000000ad4c
!	Mem[00000000300c1408] = ff000000 00000000, %l6 = 000026ff, %l7 = 00000000
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%f31 = edfc4a27, Mem[0000000010141410] = 00000000
	sta	%f31,[%i5+%o5]0x80	! Mem[0000000010141410] = edfc4a27
!	%f17 = 2600ffff, %f24 = bbe3e060 eebc527f
	fstod	%f17,%f24		! %f24 = 3cc01fff e0000000
!	Mem[0000000030141410] = ffffff00, %l0 = 00000000000000c8
	ldswa	[%i5+%o5]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[00000000218001c0] = 00004fd1, %l6 = 00000000ff000000
	ldub	[%o3+0x1c0],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c141c] = 00ebffe0, %l6 = 0000000000000000
	lduw	[%i3+0x01c],%l6		! %l6 = 0000000000ebffe0
!	Mem[0000000010181400] = 00ff0000, %l4 = 0000000060e0e3bb
	ldsba	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff

p0_label_286:
!	Mem[000000001010143c] = 00000000, %l6 = 0000000000ebffe0
	swap	[%i4+0x03c],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010101408] = ff00007b
	stha	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000007b
!	Mem[0000000010141426] = ff51511c, %l3 = 0000000000000000
	ldstuba	[%i5+0x026]%asi,%l3	! %l3 = 00000051000000ff
!	%l1 = 0000000000000000, Mem[0000000030181408] = 00000000
	stha	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	Mem[0000000020800000] = ff00188e, %l4 = 0000000000000000
	ldstub	[%o1+%g0],%l4		! %l4 = 000000ff000000ff
!	Mem[00000000100c1410] = 0000ad4c, %l1 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 0000004c000000ff
!	Mem[0000000010101410] = 00000000, %l2 = ffffffffff000000
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = c8000000, %l3 = 0000000000000051
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 00000000c8000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = 000000002600ffff, %f22 = 0000bb74 e9dc0000
	ldda	[%i0+0x018]%asi,%f22	! %f22 = 00000000 2600ffff

p0_label_287:
!	Mem[0000000030141408] = ff000000, %l7 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030041400] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001438] = 00000000, %l1 = 000000000000004c
	lduha	[%i0+0x038]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 00ffffff, %l1 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010081424] = bb38245c, %f26 = 2226ddf8
	lda	[%i2+0x024]%asi,%f26	! %f26 = bb38245c
!	Mem[00000000100c1408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 0000007b, %l0 = ffffffffffffff00
	ldswa	[%i4+%o4]0x80,%l0	! %l0 = 000000000000007b
!	Mem[00000000300c1400] = 000000ff, %l2 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001408] = 000000ff, %l7 = 00000000ff000000
	ldsha	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f2  = 00000000, Mem[0000000010001428] = 12af2c2e
	st	%f2 ,[%i0+0x028]	! Mem[0000000010001428] = 00000000

p0_label_288:
!	%f2  = 00000000 00000000, Mem[0000000010101410] = 000000ff 7f52bcee
	stda	%f2 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 00000000
!	Mem[0000000010001400] = ffff0026, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l6	! %l6 = 00000000ffff0026
!	Mem[00000000100c1408] = 00000000, %l1 = 000000000000ffff
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l3 = 00000000c8000000, Mem[0000000010181408] = 00ff00ff
	stba	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 00ff0000
!	%f0  = ff000000 00003a30 00000000 00000000
!	%f4  = 2600ffff 00000000 305122b4 14eb7ae0
!	%f8  = 5c92e244 121321b5 28512d10 6bb30828
!	%f12 = f6b3e679 c0a561e3 6c275400 15b72d80
	stda	%f0,[%i0]ASI_BLK_S	! Block Store to 0000000030001400
!	Mem[0000000030101408] = 00000000, %l6 = 00000000ffff0026
	swapa	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l4 = 00000000, %l5 = 0000ad4c, Mem[0000000010001418] = 00000000 2600ffff
	std	%l4,[%i0+0x018]		! Mem[0000000010001418] = 00000000 0000ad4c
!	%l0 = 000000000000007b, Mem[0000000010001408] = 0000005100000000, %asi = 80
	stxa	%l0,[%i0+0x008]%asi	! Mem[0000000010001408] = 000000000000007b
!	Mem[0000000010141400] = 00000000, %l3 = 00000000c8000000
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000 000000ff, %l0 = 0000007b, %l1 = 00000000
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff 0000000000000000

p0_label_289:
!	Mem[00000000300c1400] = ff000000, %l4 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030181400] = 000005ad, %l7 = 00000000000000ff
	lduwa	[%i6+%g0]0x81,%l7	! %l7 = 00000000000005ad
!	Mem[0000000021800100] = 00ff6996, %l1 = 0000000000000000
	lduba	[%o3+0x101]%asi,%l1	! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000010001438] = 00000000, %l0 = 00000000000000ff
	lduwa	[%i0+0x038]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = ffffff00, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101400] = 625a637b 0054276c, %l4 = 0000ff00, %l5 = 0000ad4c
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 000000000054276c 00000000625a637b
!	Mem[0000000030081410] = 274afced00002600, %f22 = 00000000 2600ffff
	ldda	[%i2+%o5]0x89,%f22	! %f22 = 274afced 00002600
!	Mem[00000000300c1408] = ff000000, %l6 = ffffffffffffffff
	lduba	[%i3+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081400] = ff002c2e, %l3 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f26 = bb38245c, Mem[00000000100c1400] = 7b63ff00
	sta	%f26,[%i3+%g0]0x88	! Mem[00000000100c1400] = bb38245c

p0_label_290:
!	%f26 = bb38245c 897874fe, Mem[0000000010101408] = 7b000000 00000000
	stda	%f26,[%i4+%o4]0x88	! Mem[0000000010101408] = bb38245c 897874fe
!	%f30 = 625a637b edfc4a27, Mem[0000000010081410] = 000000ff 84190000
	stda	%f30,[%i2+%o5]0x88	! Mem[0000000010081410] = 625a637b edfc4a27
!	Mem[0000000030181408] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%f30 = 625a637b edfc4a27, Mem[0000000010001410] = 000000ff 00000000
	stda	%f30,[%i0+%o5]0x88	! Mem[0000000010001410] = 625a637b edfc4a27
!	Mem[00000000100c1418] = 000000df, %l5 = 00000000625a637b, %asi = 80
	swapa	[%i3+0x018]%asi,%l5	! %l5 = 00000000000000df
!	%l4 = 000000000054276c, Mem[0000000030181408] = 000000ff
	stba	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000006c
!	%f16 = ffffffff, Mem[0000000030041400] = 00000000
	sta	%f16,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff
!	%f28 = 79e22609, Mem[0000000030181410] = 000000ff
	sta	%f28,[%i6+%o5]0x89	! Mem[0000000030181410] = 79e22609
!	%l0 = 0000000000000000, Mem[00000000300c1400] = 000000ff
	stha	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff00188e, %l2 = 00000000000000ff
	ldub	[%o1+%g0],%l2		! %l2 = 00000000000000ff

p0_label_291:
!	Mem[0000000030041410] = 00000000 00000000, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010141414] = 00000000, %l7 = 00000000000005ad
	lduha	[%i5+0x016]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = 0000000000000000, %l5 = 00000000000000df
	ldxa	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 000000000000ff00, %f10 = 28512d10 6bb30828
	ldda	[%i6+%g0]0x88,%f10	! %f10 = 00000000 0000ff00
!	Mem[00000000300c1400] = 00000000, %f16 = ffffffff
	lda	[%i3+%g0]0x81,%f16	! %f16 = 00000000
!	Mem[0000000030181408] = 6c000000, %l7 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000006c00
!	Mem[0000000010141408] = 00000000 00000000, %l6 = 000000ff, %l7 = 00006c00
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030181400] = 00000000 ad050000, %l4 = 0054276c, %l5 = 00000000
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 00000000ad050000 0000000000000000
!	Mem[0000000010081410] = 274afced, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l1	! %l1 = 00000000274afced
!	Starting 10 instruction Store Burst
!	Mem[0000000021800180] = 000035e9, %l3 = 0000000000000000
	ldstub	[%o3+0x180],%l3		! %l3 = 00000000000000ff

p0_label_292:
!	%l4 = 00000000ad050000, Mem[0000000010101426] = 332e64f0, %asi = 80
	stba	%l4,[%i4+0x026]%asi	! Mem[0000000010101424] = 332e00f0
!	%f22 = 274afced, Mem[0000000030041408] = 00000000
	sta	%f22,[%i1+%o4]0x89	! Mem[0000000030041408] = 274afced
!	%l7 = 0000000000000000, Mem[0000000030001408] = 0000000000000000
	stxa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000000000000
!	Mem[0000000010141400] = 000000c8, %l4 = 00000000ad050000
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 00000000000000c8
!	%f13 = c0a561e3, Mem[0000000010081400] = 2e2c00ff
	sta	%f13,[%i2+%g0]0x88	! Mem[0000000010081400] = c0a561e3
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010041410] = 00000000 00000000
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 00000000
!	%l3 = 0000000000000000, Mem[00000000100c1410] = ffad0000d7632918
	stxa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010001408] = 00000000
	stwa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Mem[0000000010001408] = 00000000, %l4 = 00000000000000c8
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l5 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_293:
!	Mem[0000000010001400] = 00000000, %l5 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 5c2438bb, %f7  = 14eb7ae0
	lda	[%i3+0x000]%asi,%f7 	! %f7 = 5c2438bb
!	Mem[000000001014142c] = dd005994, %l5 = 0000000000000000
	lduha	[%i5+0x02e]%asi,%l5	! %l5 = 0000000000005994
!	%l0 = 00000000, %l1 = 274afced, Mem[0000000010001408] = ff000000 0000007b
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 274afced
!	Mem[00000000300c1408] = ff000000, %l4 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141408] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081410] = 274afced, %l5 = 0000000000005994
	lduba	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000027
!	Mem[0000000010141400] = ad05000000005aff, %l6 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l6	! %l6 = ad05000000005aff
!	Mem[0000000010081418] = ff00ffff, %l1 = 00000000274afced
	ldsha	[%i2+0x018]%asi,%l1	! %l1 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 2600ffff, %l3 = 0000000000000000
!	Mem[0000000030001428] = 28512d106bb30828
	add	%i0,0x028,%g1
	stda	%f16,[%g1+%l3]ASI_PST32_S ! Mem[0000000030001428] = 28512d106bb30828

p0_label_294:
!	%l7 = 0000000000000000, Mem[0000000030001410] = ffff0026
	stha	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = ffff0000
!	%f4  = 2600ffff, Mem[0000000010141410] = edfc4a27
	sta	%f4 ,[%i5+0x010]%asi	! Mem[0000000010141410] = 2600ffff
!	%f10 = 00000000 0000ff00, %l2 = 00000000000000ff
!	Mem[0000000010101400] = 6c2754007b635a62
	stda	%f10,[%i4+%l2]ASI_PST8_P ! Mem[0000000010101400] = 000000000000ff00
!	%l0 = 00000000, %l1 = ffffff00, Mem[0000000010181428] = 000000ff 000005ad
	stda	%l0,[%i6+0x028]%asi	! Mem[0000000010181428] = 00000000 ffffff00
!	%l4 = 000000ff, %l5 = 00000027, Mem[00000000100c1430] = e07aeb14 b4225130
	stda	%l4,[%i3+0x030]%asi	! Mem[00000000100c1430] = 000000ff 00000027
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141408] = 0000000000000000, %l4 = 00000000000000ff, %l0 = 0000000000000000
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l5 = 0000000000000027
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[00000000100c1400] = 5c2438bb000000ff
	stxa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000000000000000, %f0  = ff000000 00003a30
	ldda	[%i5+%o4]0x88,%f0 	! %f0  = 00000000 00000000

p0_label_295:
!	Mem[0000000010001418] = 000000000000ad4c, %l3 = 0000000000000000
	ldxa	[%i0+0x018]%asi,%l3	! %l3 = 000000000000ad4c
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %f17 = 2600ffff
	lda	[%i4+%g0]0x80,%f17	! %f17 = 00000000
!	Mem[0000000010141400] = 000005ad, %l6 = ad05000000005aff
	lduha	[%i5+%g0]0x88,%l6	! %l6 = 00000000000005ad
!	Mem[0000000010081418] = ff00ffff, %l3 = 000000000000ad4c
	ldub	[%i2+0x01a],%l3		! %l3 = 00000000000000ff
!	Mem[00000000300c1408] = ff000000, %f4  = 2600ffff
	lda	[%i3+%o4]0x81,%f4 	! %f4 = ff000000
!	Mem[0000000010141408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = edfc4a27 000000ff, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000edfc4a27 00000000000000ff
!	Mem[0000000010001410] = edfc4a27, %l2 = 00000000edfc4a27
	ldswa	[%i0+%o5]0x88,%l2	! %l2 = ffffffffedfc4a27
!	Starting 10 instruction Store Burst
!	%f7  = 5c2438bb, Mem[0000000030101410] = 2600ffff
	sta	%f7 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 5c2438bb

p0_label_296:
!	%f0  = 00000000 00000000 00000000 00000000
!	%f4  = ff000000 00000000 305122b4 5c2438bb
!	%f8  = 5c92e244 121321b5 00000000 0000ff00
!	%f12 = f6b3e679 c0a561e3 6c275400 15b72d80
	stda	%f0,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	%l5 = 0000000000000000, Mem[0000000010081410] = edfc4a27
	stba	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = edfc4a00
!	Mem[00000000201c0001] = ff00367d, %l3 = 00000000000000ff
	ldstub	[%o0+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010041410] = 00000000
	stha	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000030081408] = 00000000
	stha	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ff0000
!	%l4 = 00000000000000ff, Mem[0000000030081408] = 00ff0000
	stha	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ff0000
!	%f24 = 3cc01fff, Mem[0000000030181410] = 0926e279
	sta	%f24,[%i6+%o5]0x81	! Mem[0000000030181410] = 3cc01fff
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stha	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l6 = 00000000000005ad
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_297:
!	Mem[0000000010141408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = ffff0026, %l0 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1410] = 000000ff, %l4 = 00000000000000ff
	lduha	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = ff000000, %l4 = 00000000000000ff
	lduha	[%i2+%g0]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010041400] = 00000000 ffff0026, %l0 = ffffffff, %l1 = ffffff00
	ldd	[%i1+%g0],%l0		! %l0 = 0000000000000000 00000000ffff0026
!	Mem[0000000010041408] = 000000ff, %l6 = 0000000000000000
	lduwa	[%i1+0x008]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1400] = ff000000, %l5 = 0000000000000000
	ldswa	[%i3+%g0]0x81,%l5	! %l5 = ffffffffff000000
!	Mem[00000000100c1414] = 00000000, %l6 = 00000000000000ff
	lduwa	[%i3+0x014]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = 000000ff, %l6 = 0000000000000000
	lduha	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffff0026, Mem[0000000010081400] = e361a5c0
	stha	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 0026a5c0

p0_label_298:
!	Mem[0000000030081410] = 00002600, %l5 = ffffffffff000000
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 0000000000002600
!	Mem[0000000010041424] = 00ffffff, %l6 = 00000000000000ff
	swap	[%i1+0x024],%l6		! %l6 = 0000000000ffffff
!	%l4 = 0000ff00, %l5 = 00002600, Mem[0000000010141410] = 2600ffff 00000000
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000ff00 00002600
!	%f29 = 8a7cad4c, Mem[0000000030001410] = 0000ffff
	sta	%f29,[%i0+%o5]0x81	! Mem[0000000030001410] = 8a7cad4c
!	%f19 = 00000000, Mem[0000000010041408] = ff000000
	sta	%f19,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[00000000100c1408] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	Code Fragment 4
p0_fragment_11:
!	%l0 = 0000000000000000
	setx	0x0675ea57a11d72db,%g7,%l0 ! %l0 = 0675ea57a11d72db
!	%l1 = 00000000ffff0026
	setx	0x069a4fe0098e3453,%g7,%l1 ! %l1 = 069a4fe0098e3453
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0675ea57a11d72db
	setx	0x721cda278871c802,%g7,%l0 ! %l0 = 721cda278871c802
!	%l1 = 069a4fe0098e3453
	setx	0x7a6b843857ea4b6e,%g7,%l1 ! %l1 = 7a6b843857ea4b6e
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010181408] = 00000000, %l0 = 721cda278871c802
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l7 = 00000000000000ff, Mem[00000000100c1424] = 000000af, %asi = 80
	stha	%l7,[%i3+0x024]%asi	! Mem[00000000100c1424] = 00ff00af
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l1 = 7a6b843857ea4b6e
	ldsw	[%i4+%o5],%l1		! %l1 = 0000000000000000

p0_label_299:
!	Mem[0000000030001408] = ff000000, %l3 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141410] = 0000ff00 00002600, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+0x010]%asi,%l0	! %l0 = 000000000000ff00 0000000000002600
!	Mem[0000000010001400] = 00000000, %l1 = 0000000000002600
	ldswa	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = ad050000, %f20 = 00000000
	lda	[%i6+%g0]0x89,%f20	! %f20 = ad050000
!	Mem[0000000010141408] = 00000000, %l1 = 0000000000000000
	ldsha	[%i5+0x00a]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 000000002e2caf12, %l3 = 00000000000000ff
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = 000000002e2caf12
!	Mem[0000000010181410] = ff000000, %l6 = 0000000000ffffff
	ldsha	[%i6+%o5]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030041410] = 0000000000000000, %l5 = 0000000000002600
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = 0000000000ffffff, %l5 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l5	! %l5 = 0000000000ffffff
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000ff00, Mem[0000000030041410] = 00000000
	stba	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000

p0_label_300:
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l6 = ffffff00, %l7 = 00000000, Mem[0000000010101410] = 00000000 00000000
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffff00 00000000
!	%f4  = ff000000 00000000, Mem[0000000030001400] = 000000ff 303a0000
	stda	%f4 ,[%i0+%g0]0x89	! Mem[0000000030001400] = ff000000 00000000
!	Mem[0000000010181410] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010141408] = 00000000, %l0 = 000000000000ff00
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%l5 = 0000000000ffffff, Mem[0000000010041434] = 00000030
	stw	%l5,[%i1+0x034]		! Mem[0000000010041434] = 00ffffff
!	%l6 = ffffffffffffff00, Mem[0000000030081410] = 000000ff
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = ff0000ff
!	Mem[0000000030101408] = ffff0026, %l5 = 0000000000ffffff
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%l6 = ffffffffffffff00, Mem[0000000010141400] = ad050000
	stwa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0026a5c0000000ff, %l2 = ffffffffedfc4a27
	ldxa	[%i2+%g0]0x80,%l2	! %l2 = 0026a5c0000000ff

p0_label_301:
!	Mem[0000000010181428] = 00000000, %l2 = 0026a5c0000000ff
	lduw	[%i6+0x028],%l2		! %l2 = 0000000000000000
!	Mem[0000000030001410] = 8a7cad4c, %f20 = ad050000
	lda	[%i0+%o5]0x81,%f20	! %f20 = 8a7cad4c
!	Mem[0000000010101400] = 00000000, %l2 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l4 = 000000000000ff00
	ldsba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = ff000000 00000000 ff000000 00000000
!	Mem[00000000300c1410] = ff000000 000000ff fe1adf4b 8941ad0c
!	Mem[00000000300c1420] = af0c15a9 f9c39c20 a9e52ba8 e9803f34
!	Mem[00000000300c1430] = ff817381 2e2c0000 61c6426e 204e5d13
	ldda	[%i3]ASI_BLK_AIUSL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010181410] = 000000ff, %l1 = 00000000000000ff
	lduba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l4 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = 8a7cad4c, %l7 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l7	! %l7 = 0000000000008a7c
!	Mem[0000000030181410] = 3cc01fff00000000, %f8  = 5c92e244 121321b5
	ldda	[%i6+%o5]0x81,%f8 	! %f8  = 3cc01fff 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = edfc4a27, %l3 = 000000002e2caf12
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 00000000edfc4a27

p0_label_302:
!	%f8  = 3cc01fff 00000000, Mem[0000000030001410] = 4cad7c8a 00000000
	stda	%f8 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 3cc01fff 00000000
!	Mem[0000000030101400] = 000000ff, %l1 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l6 = ffffff00, %l7 = 00008a7c, Mem[0000000030141408] = 000000ff 00000000
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffff00 00008a7c
!	Mem[0000000010141400] = 00ffffff, %l4 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	%f4  = ff000000 00000000, Mem[0000000010141400] = ffffff00 00005aff
	stda	%f4 ,[%i5+%g0]0x80	! Mem[0000000010141400] = ff000000 00000000
!	Mem[00000000100c1400] = ff000000, %l3 = 00000000edfc4a27
	lduha	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%f12 = f6b3e679 c0a561e3, %l2 = 0000000000000000
!	Mem[0000000010041408] = 000000002e2caf12
	add	%i1,0x008,%g1
	stda	%f12,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010041408] = 000000002e2caf12
!	%l6 = ffffffffffffff00, Mem[0000000010141410] = 00ff0000
	stha	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00ffff00
!	Mem[0000000010001408] = 00000000, %l6 = ffffffffffffff00
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000030101400] = ff000000 00003a30 ffff0026 00000000
!	Mem[0000000030101410] = 5c2438bb 00000000 305122b4 14eb7ae0
!	Mem[0000000030101420] = 5c92e244 121321b5 28512d10 6bb30828
!	Mem[0000000030101430] = f6b3e679 c0a561e3 6c275400 15b72d80
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400

p0_label_303:
!	Mem[0000000010181400] = 00000000 00000000, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000020800000] = ff00188e, %l2 = 0000000000000000
	ldsh	[%o1+%g0],%l2		! %l2 = ffffffffffffff00
!	Mem[0000000010141420] = 0054276c ff51ff1c, %l2 = ffffff00, %l3 = 00000000
	ldda	[%i5+0x020]%asi,%l2	! %l2 = 000000000054276c 00000000ff51ff1c
!	Mem[0000000020800000] = ff00188e, %l4 = 0000000000000000
	lduh	[%o1+%g0],%l4		! %l4 = 000000000000ff00
!	Mem[0000000030141408] = 00008a7cffffff00, %l1 = 00000000000000ff
	ldxa	[%i5+%o4]0x89,%l1	! %l1 = 00008a7cffffff00
!	Mem[00000000300c1400] = ff00000000000000, %f30 = 135d4e20 6e42c661
	ldda	[%i3+%g0]0x81,%f30	! %f30 = ff000000 00000000
!	Mem[0000000021800040] = ffffa30e, %l2 = 000000000054276c
	lduba	[%o3+0x041]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l1 = 00008a7cffffff00
	ldsha	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l3 = 00000000ff51ff1c
	lduwa	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181425] = 121321b5, %l5 = 0000000000000000
	ldstuba	[%i6+0x025]%asi,%l5	! %l5 = 00000013000000ff

p0_label_304:
!	Mem[0000000010081410] = edfc4a00, %l5 = 0000000000000013
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 00000000edfc4a00
!	%f25 = a9150caf, Mem[0000000010101418] = 00000000
	st	%f25,[%i4+0x018]	! Mem[0000000010101418] = a9150caf
!	Mem[00000000100c140c] = 00005130, %l2 = 00000000000000ff
	swap	[%i3+0x00c],%l2		! %l2 = 0000000000005130
!	%l2 = 0000000000005130, Mem[0000000030041410] = 00000000
	stba	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 30000000
!	%l0 = 00000000, %l1 = 00000000, Mem[00000000300c1400] = 000000ff 00000000
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 00000000
!	%f26 = 343f80e9 a82be5a9, Mem[0000000030181408] = 6c000000 ad050000
	stda	%f26,[%i6+%o4]0x81	! Mem[0000000030181408] = 343f80e9 a82be5a9
!	Mem[0000000030181400] = 000005ad, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%l2 = 00005130, %l3 = 00000000, Mem[0000000010001410] = 12af2c2e 7b635a62
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 00005130 00000000
!	%f24 = 209cc3f9 a9150caf, Mem[0000000010141410] = 00ffff00 00002600
	stda	%f24,[%i5+%o5]0x80	! Mem[0000000010141410] = 209cc3f9 a9150caf
!	Starting 10 instruction Load Burst
!	Mem[0000000010181420] = 5c92e244 12ff21b5, %l0 = 00000000, %l1 = 00000000
	ldda	[%i6+0x020]%asi,%l0	! %l0 = 000000005c92e244 0000000012ff21b5

p0_label_305:
!	Mem[0000000030101400] = ff000000, %l4 = 000000000000ff00
	lduha	[%i4+%g0]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030041400] = ffffffff, %l2 = 0000000000005130
	ldsba	[%i1+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1408] = ff000000 00000000, %l4 = 0000ff00, %l5 = edfc4a00
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[00000000100c1400] = ff000000, %l0 = 000000005c92e244
	ldswa	[%i3+%g0]0x88,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030041410] = 00000030, %l5 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000030
!	Mem[00000000201c0000] = ffff367d, %l4 = 00000000ff000000
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181408] = 343f80e9, %l3 = 0000000000000000
	lduba	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000034
!	Mem[0000000020800000] = ff00188e, %l3 = 0000000000000034
	ldsba	[%o1+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081400] = 0026a5c0, %l0 = ffffffffff000000
	ldsba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 00000000000000ff

p0_label_306:
!	%f21 = 000000ff, Mem[0000000010081438] = ffff0026
	st	%f21,[%i2+0x038]	! Mem[0000000010081438] = 000000ff
!	%f18 = 00000000 000000ff, Mem[0000000030041408] = edfc4a27 000000ff
	stda	%f18,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 000000ff
!	%f20 = ff000000 000000ff, Mem[0000000030141408] = ffffff00 00008a7c
	stda	%f20,[%i5+%o4]0x89	! Mem[0000000030141408] = ff000000 000000ff
!	%f30 = ff000000 00000000, %l5 = 0000000000000030
!	Mem[0000000030081410] = ff0000ffedfc4a27
	add	%i2,0x010,%g1
	stda	%f30,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030081410] = ff0000ffedfc4a27
!	%f30 = ff000000, Mem[0000000030001408] = ff000000
	sta	%f30,[%i0+%o4]0x81	! Mem[0000000030001408] = ff000000
!	%f6  = 305122b4 14eb7ae0, Mem[00000000100c1400] = 000000ff 000000ff
	stda	%f6 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 305122b4 14eb7ae0
!	Mem[00000000100c1400] = 305122b4, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 00000030000000ff
!	%l4 = ffffffff, %l5 = 00000030, Mem[00000000100c1410] = 000000ff 00000000
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffffff 00000030
!	Mem[0000000010001400] = 00000000, %l7 = 0000000000008a7c
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = e07aeb14b42251ff, %f4  = 5c2438bb 00000000
	ldda	[%i3+%g0]0x88,%f4 	! %f4  = e07aeb14 b42251ff

p0_label_307:
!	%f5  = b42251ff, %f17 = 000000ff, %f6  = 305122b4
	fmuls	%f5 ,%f17,%f6 		! %l0 = 0000000000000022, Unfinished, %fsr = 0400000000
!	Mem[0000000010001424] = 2600ffff, %l6 = 0000000000000030
	lduba	[%i0+0x024]%asi,%l6	! %l6 = 0000000000000026
!	Mem[0000000010181438] = 6c275400, %l3 = ffffffffffffffff
	ldsha	[%i6+0x038]%asi,%l3	! %l3 = 0000000000006c27
!	Mem[0000000030101400] = ff000000, %l0 = 0000000000000022
	lduha	[%i4+%g0]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030001410] = 3cc01fff00000000, %f20 = ff000000 000000ff
	ldda	[%i0+%o5]0x89,%f20	! %f20 = 3cc01fff 00000000
!	Mem[0000000030141400] = 2600ffff, %l0 = 000000000000ff00
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = 000000002600ffff
!	Mem[0000000030141400] = ffff0026, %l1 = 0000000012ff21b5
	lduha	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000026
!	Mem[00000000100c1408] = ff000000, %l7 = 0000000000000000
	lduw	[%i3+%o4],%l7		! %l7 = 00000000ff000000
!	Mem[00000000300c1410] = ff000000, %l4 = ffffffffffffffff
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l4 = ff000000, %l5 = 00000030, Mem[0000000030001400] = 000000ff ff000000
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = ff000000 00000030

p0_label_308:
!	%l4 = ff000000, %l5 = 00000030, Mem[0000000030141410] = 00ffffff 00000000
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000000 00000030
!	Mem[00000000100c1410] = ffffffff, %l5 = 0000000000000030
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (48)
!	%l6 = 0000000000000026, Mem[0000000030101410] = bb38245c
	stha	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = bb380026
!	%f0  = ff000000 00003a30 ffff0026 00000000
!	%f4  = e07aeb14 b42251ff 305122b4 14eb7ae0
!	%f8  = 5c92e244 121321b5 28512d10 6bb30828
!	%f12 = f6b3e679 c0a561e3 6c275400 15b72d80
	stda	%f0,[%i0]ASI_BLK_SL	! Block Store to 0000000030001400
!	%l0 = 000000002600ffff, Mem[00000000100c1410] = ffffffff30000000
	stxa	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000002600ffff
!	%l6 = 00000026, %l7 = ff000000, Mem[0000000030101400] = ff000000 00003a30
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000026 ff000000
!	Mem[0000000010141418] = 00000000840085e5, %l4 = 00000000ff000000, %l2 = ffffffffffffffff
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 00000000840085e5
!	Mem[0000000010141400] = ff000000, %l6 = 0000000000000026
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000020800001] = ff00188e, %l2 = 00000000840085e5
	ldstuba	[%o1+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000, %l1 = 0000000000000026
	lduha	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_309:
!	Mem[0000000010041418] = 000000ff00003aff, %l3 = 0000000000006c27
	ldxa	[%i1+0x018]%asi,%l3	! %l3 = 000000ff00003aff
!	Mem[0000000030041400] = ffffffff00ffffff, %f16 = 00000000 000000ff
	ldda	[%i1+%g0]0x81,%f16	! %f16 = ffffffff 00ffffff
!	Mem[0000000030141410] = 000000ff, %l1 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = ff000000, %l0 = 000000002600ffff
	ldsha	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041401] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i1+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 00000000, %l0 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 00ffffff, %f24 = 209cc3f9
	lda	[%i4+0x010]%asi,%f24	! %f24 = 00ffffff
!	Mem[0000000010141410] = f9c39c20, %l3 = 000000ff00003aff
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 0000000000009c20
!	Mem[00000000201c0000] = ffff367d, %l3 = 0000000000009c20
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[00000000218000c1] = 33f7bf7c, %l5 = 00000000000000ff
	ldstuba	[%o3+0x0c1]%asi,%l5	! %l5 = 000000f7000000ff

p0_label_310:
!	%f31 = 00000000, Mem[00000000300c1400] = 00000000
	sta	%f31,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l5 = 00000000000000f7, Mem[0000000010001410] = 0000000030510000
	stxa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000000000f7
!	Mem[0000000010181408] = 8871c802, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 000000008871c802
!	%l2 = 8871c802, %l3 = 0000ffff, Mem[0000000030141400] = ffff0026 00000000
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 8871c802 0000ffff
!	%f30 = ff000000 00000000, %l5 = 00000000000000f7
!	Mem[0000000030081410] = ff0000ffedfc4a27
	add	%i2,0x010,%g1
	stda	%f30,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030081410] = 000000ff000000ff
!	%f26 = 343f80e9 a82be5a9, Mem[0000000030041400] = ffffffff 00ffffff
	stda	%f26,[%i1+%g0]0x81	! Mem[0000000030041400] = 343f80e9 a82be5a9
!	%f31 = 00000000, Mem[00000000100c1408] = ff000000
	sta	%f31,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010141410] = f9c39c20, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 00000020000000ff
!	Mem[0000000010181410] = 000000ff, %l1 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 000000ff, %l3 = 000000000000ffff
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 00000000000000ff

p0_label_311:
!	Mem[0000000030101400] = 000000ff26000000, %f28 = 00002c2e 817381ff
	ldda	[%i4+%g0]0x89,%f28	! %f28 = 000000ff 26000000
!	Mem[0000000010101408] = 897874fe, %l7 = 00000000ff000000
	lduba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000fe
!	Mem[0000000010101408] = fe747889, %l6 = 00000000ff000000
	ldsb	[%i4+0x00b],%l6		! %l6 = ffffffffffffff89
!	Mem[00000000100c1400] = ff5122b4 14eb7ae0, %l2 = 8871c802, %l3 = 000000ff
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000ff5122b4 0000000014eb7ae0
!	Mem[0000000030181408] = 343f80e9, %f20 = 3cc01fff
	lda	[%i6+%o4]0x81,%f20	! %f20 = 343f80e9
!	Mem[0000000030101410] = 260038bb, %l6 = ffffffffffffff89
	lduwa	[%i4+%o5]0x81,%l6	! %l6 = 00000000260038bb
!	Mem[0000000010081404] = 000000ff, %l3 = 0000000014eb7ae0
	ldub	[%i2+0x006],%l3		! %l3 = 0000000000000000
!	Mem[00000000300c1410] = ff000000, %l1 = 00000000000000ff
	ldsba	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081408] = 000005ad0000ff00, %l7 = 00000000000000fe
	ldxa	[%i2+%o4]0x89,%l7	! %l7 = 000005ad0000ff00
!	Starting 10 instruction Store Burst
!	%l0 = 00000020, %l1 = ffffffff, Mem[0000000030181410] = ff1fc03c 00000000
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000020 ffffffff

p0_label_312:
!	Mem[0000000030101410] = 260038bb, %l6 = 00000000260038bb
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 00000026000000ff
!	%l5 = 00000000000000f7, Mem[00000000100c1400] = b42251ff
	stba	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = b42251f7
!	Mem[00000000100c1400] = b42251f7, %l6 = 0000000000000026
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 000000f7000000ff
!	%f3  = 00000000, Mem[000000001000141c] = 0000ad4c
	sta	%f3 ,[%i0+0x01c]%asi	! Mem[000000001000141c] = 00000000
!	%f17 = 00ffffff, Mem[0000000010041400] = 0000ff00
	sta	%f17,[%i1+%g0]0x88	! Mem[0000000010041400] = 00ffffff
!	%l7 = 000005ad0000ff00, Mem[0000000030041400] = e9803f34
	stha	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = e980ff00
!	%f8  = 5c92e244 121321b5, Mem[0000000030181400] = ff0005ad 00000000
	stda	%f8 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 5c92e244 121321b5
!	%l0 = 0000000000000020, Mem[0000000010081418] = ff00ffff
	stb	%l0,[%i2+0x018]		! Mem[0000000010081418] = 2000ffff
!	Mem[0000000010041408] = 00000000, %l0 = 0000000000000020
	swapa	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 02c87188ffff0000, %l1 = ffffffffffffffff
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = 02c87188ffff0000

p0_label_313:
!	Mem[0000000010181408] = 0000000000000000, %l5 = 00000000000000f7
	ldxa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = 00ffffff, %l2 = 00000000ff5122b4
	ldsha	[%i1+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1410] = 000000002600ffff, %l6 = 00000000000000f7
	ldxa	[%i3+%o5]0x80,%l6	! %l6 = 000000002600ffff
!	Mem[0000000010041418] = 000000ff, %l1 = 02c87188ffff0000
	lduha	[%i1+0x01a]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000020800040] = 26ff9e9b, %l3 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l3	! %l3 = 00000000000026ff
	membar	#Sync			! Added by membar checker (49)
!	Mem[0000000010001410] = f700000000000000, %f4  = e07aeb14 b42251ff
	ldda	[%i0+%o5]0x80,%f4 	! %f4  = f7000000 00000000
!	Mem[0000000010001400] = 7c8a0000, %l2 = ffffffffffffffff
	lduwa	[%i0+%g0]0x88,%l2	! %l2 = 000000007c8a0000
!	Mem[0000000030001408] = 00000000, %l0 = 0000000000000000
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = fe747889, %l6 = 000000002600ffff
	lduba	[%i4+%o4]0x80,%l6	! %l6 = 00000000000000fe
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 00000000000000ff

p0_label_314:
!	Mem[00000000300c1400] = ff000000, %l3 = 00000000000026ff
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	%f8  = 5c92e244 121321b5, %l6 = 00000000000000fe
!	Mem[0000000030141438] = ffff0026ffff9c20
	add	%i5,0x038,%g1
	stda	%f8,[%g1+%l6]ASI_PST32_S ! Mem[0000000030141438] = 5c92e244ffff9c20
!	Mem[0000000030141400] = 8871c802, %l6 = 00000000000000fe
	ldstuba	[%i5+%g0]0x89,%l6	! %l6 = 00000002000000ff
!	Mem[0000000010101400] = 00000000, %l2 = 000000007c8a0000
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l3 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%f20 = 343f80e9, Mem[0000000030181410] = 00000020
	sta	%f20,[%i6+%o5]0x89	! Mem[0000000030181410] = 343f80e9
!	Mem[0000000010141408] = 0000ff00, %l1 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l7 = 000005ad0000ff00, Mem[0000000010041408] = 20000000
	stwa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff00000000000000, %f30 = ff000000 00000000
	ldda	[%i3+%o4]0x81,%f30	! %f30 = ff000000 00000000

p0_label_315:
!	Mem[0000000010181400] = 0000000000000000, %f30 = ff000000 00000000
	ldda	[%i6+%g0]0x80,%f30	! %f30 = 00000000 00000000
!	Mem[0000000030141410] = ff000000, %l0 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030101408] = 000000002600ffff, %l0 = 00000000ff000000
	ldxa	[%i4+%o4]0x89,%l0	! %l0 = 000000002600ffff
!	Mem[0000000030081410] = ff000000 ff000000, %l4 = ff000000, %l5 = 00000000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000ff000000 00000000ff000000
!	%f22 = 0cad4189 4bdf1afe, %l2 = 0000000000000000
!	Mem[0000000010181430] = f6b3e679c0a561e3
	add	%i6,0x030,%g1
	stda	%f22,[%g1+%l2]ASI_PST16_P ! Mem[0000000010181430] = f6b3e679c0a561e3
!	Mem[0000000010101400] = 7c8a0000, %l5 = 00000000ff000000
	ldsha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 00000026, %l7 = 000005ad0000ff00
	ldsha	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141408] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141408] = ff000000, %l7 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l7	! %l7 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030181410] = e9803f34
	stha	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 00003f34

p0_label_316:
!	%l7 = ffffffffff000000, Mem[0000000010041400] = 00ffffff
	stha	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 00ff0000
!	%l0 = 000000002600ffff, Mem[0000000010141408] = ffff0000
	stwa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 2600ffff
!	Mem[0000000010041400] = 0000ff00, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030141400] = ffc87188, %l7 = ffffffffff000000
	ldstuba	[%i5+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	%l0 = 2600ffff, %l1 = 00000000, Mem[0000000030081410] = 000000ff 000000ff
	stda	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 2600ffff 00000000
!	%f24 = 00ffffff a9150caf, Mem[0000000030041400] = e980ff00 a9e52ba8
	stda	%f24,[%i1+%g0]0x89	! Mem[0000000030041400] = 00ffffff a9150caf
!	Mem[000000001008143e] = ffff9c20, %l3 = 0000000000000000
	ldstuba	[%i2+0x03e]%asi,%l3	! %l3 = 0000009c000000ff
!	%f0  = ff000000 00003a30, Mem[0000000030041408] = 00000000 ff000000
	stda	%f0 ,[%i1+%o4]0x89	! Mem[0000000030041408] = ff000000 00003a30
!	%l4 = 00000000ff000000, Mem[0000000030041408] = 303a0000
	stha	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00ff0000, %l2 = 00000000000000ff
	ldsha	[%i2+%o4]0x81,%l2	! %l2 = 00000000000000ff

p0_label_317:
!	Mem[0000000010101400] = 00008a7c, %l7 = 00000000000000ff
	lduha	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = b521131244e2925c, %l3 = 000000000000009c
	ldxa	[%i6+%g0]0x89,%l3	! %l3 = b521131244e2925c
!	Mem[00000000211c0000] = ff300b46, %l3 = b521131244e2925c
	ldsb	[%o2+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030001410] = b42251ff, %l6 = 0000000000000002
	lduwa	[%i0+%o5]0x89,%l6	! %l6 = 00000000b42251ff
!	Mem[0000000010141410] = af0c15a9 f9c39cff, %l4 = ff000000, %l5 = 0000ff00
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 00000000f9c39cff 00000000af0c15a9
!	Mem[000000001004140c] = 2e2caf12, %l6 = 00000000b42251ff
	lduwa	[%i1+0x00c]%asi,%l6	! %l6 = 000000002e2caf12
!	Mem[000000001010142c] = 2808b36b, %f7  = 14eb7ae0
	lda	[%i4+0x02c]%asi,%f7 	! %f7 = 2808b36b
!	Mem[0000000021800040] = ffffa30e, %l6 = 000000002e2caf12
	ldub	[%o3+0x040],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010141400] = 00000026, %l3 = ffffffffffffffff
	lduha	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000030081410] = 2600ffff
	stwa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff

p0_label_318:
!	%l4 = f9c39cff, %l5 = af0c15a9, Mem[0000000010001430] = 000000ff 2808b36b
	stda	%l4,[%i0+0x030]%asi	! Mem[0000000010001430] = f9c39cff af0c15a9
!	%f12 = f6b3e679 c0a561e3, %l5 = 00000000af0c15a9
!	Mem[0000000010181428] = 000000000000ff00
	add	%i6,0x028,%g1
	stda	%f12,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010181428] = e36100000000b3f6
!	%f6  = 305122b4 2808b36b, %l2 = 00000000000000ff
!	Mem[0000000010101400] = 00008a7c0000ff00
	stda	%f6,[%i4+%l2]ASI_PST16_P ! Mem[0000000010101400] = 305122b42808b36b
!	Mem[0000000010101410] = 00ffffff, %l5 = 00000000af0c15a9
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010101418] = a9150cafffc800ff, %asi = 80
	stxa	%l3,[%i4+0x018]%asi	! Mem[0000000010101418] = 0000000000000000
!	%l2 = 00000000000000ff, Mem[00000000300c1410] = ff000000000000ff
	stxa	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000000000ff
!	Mem[0000000030141400] = ffc87188, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 00000000ffc87188
!	Mem[0000000010001400] = 00008a7c, %l6 = 00000000000000ff
	swapa	[%i0+%g0]0x80,%l6	! %l6 = 0000000000008a7c
!	Mem[0000000030081410] = 000000ff, %l6 = 0000000000008a7c
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000026 ff000000, %l0 = 2600ffff, %l1 = ffc87188
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000026 00000000ff000000

p0_label_319:
!	Mem[0000000010101410] = ffffffff, %l1 = 00000000ff000000
	lduwa	[%i4+%o5]0x88,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030001410] = ff5122b4 14eb7ae0, %l4 = f9c39cff, %l5 = 00000000
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 00000000ff5122b4 0000000014eb7ae0
!	Mem[0000000030101410] = ff0038bb, %l4 = 00000000ff5122b4
	ldswa	[%i4+%o5]0x81,%l4	! %l4 = ffffffffff0038bb
!	Mem[0000000010001410] = f700000000000000, %l4 = ffffffffff0038bb
	ldxa	[%i0+%o5]0x80,%l4	! %l4 = f700000000000000
!	Mem[0000000030041408] = 00000000, %l0 = 0000000000000026
	ldsba	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%l4 = f700000000000000, %l6 = 00000000000000ff, %l7 = 0000000000000000
	subc	%l4,%l6,%l7		! %l7 = f6ffffffffffff01
!	Mem[0000000030001408] = ffff002600000000, %l5 = 0000000014eb7ae0
	ldxa	[%i0+%o4]0x89,%l5	! %l5 = ffff002600000000
!	Mem[0000000030141400] = 00000000, %l7 = f6ffffffffffff01
	ldswa	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 897874fe, %l3 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l3	! %l3 = 00000000000074fe
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 00003f34, %l1 = 00000000ffffffff
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000ff

p0_label_320:
!	%l7 = 0000000000000000, Mem[0000000010081418] = 2000ffff, %asi = 80
	stwa	%l7,[%i2+0x018]%asi	! Mem[0000000010081418] = 00000000
!	Mem[0000000030141408] = ff000000, %l3 = 00000000000074fe
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010001428] = 00000000ff000000
	stx	%l2,[%i0+0x028]		! Mem[0000000010001428] = 00000000000000ff
!	%f12 = f6b3e679, Mem[0000000010181400] = 00000000
	sta	%f12,[%i6+0x000]%asi	! Mem[0000000010181400] = f6b3e679
!	Mem[0000000010141410] = ff9cc3f9, %l0 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l0	! %l0 = 00000000ff9cc3f9
!	%f0  = ff000000 00003a30 ffff0026 00000000
!	%f4  = f7000000 00000000 305122b4 2808b36b
!	%f8  = 5c92e244 121321b5 28512d10 6bb30828
!	%f12 = f6b3e679 c0a561e3 6c275400 15b72d80
	stda	%f0,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
!	%f26 = 343f80e9 a82be5a9, Mem[0000000030141410] = 000000ff 30000000
	stda	%f26,[%i5+%o5]0x81	! Mem[0000000030141410] = 343f80e9 a82be5a9
!	%l1 = 0000000000000000, Mem[0000000010101400] = 6bb30828b4225130
	stxa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000000
!	Mem[0000000010181400] = f6b3e679, %l3 = 00000000000000ff
	ldswa	[%i6+%g0]0x80,%l3	! %l3 = fffffffff6b3e679
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000000000ff, %f16 = ffffffff 00ffffff
	ldda	[%i3+%o5]0x89,%f16	! %f16 = 00000000 000000ff

p0_label_321:
!	Mem[0000000030001400] = 303a0000, %l1 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000030
!	Mem[0000000010081410] = 13000000, %l3 = fffffffff6b3e679
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000013
!	Mem[0000000030041410] = 30000000, %l3 = 0000000000000013
	lduba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000030
!	Mem[0000000030181408] = 343f80e9, %l7 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l7	! %l7 = 00000000343f80e9
!	Mem[0000000030141410] = 343f80e9, %l1 = 0000000000000030
	ldswa	[%i5+%o5]0x81,%l1	! %l1 = 00000000343f80e9
!	Mem[0000000021800080] = 05ff32fb, %l0 = 00000000ff9cc3f9
	ldsb	[%o3+0x081],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030041410] = 3000000000000000, %f22 = 0cad4189 4bdf1afe
	ldda	[%i1+%o5]0x81,%f22	! %f22 = 30000000 00000000
!	Mem[0000000030181400] = 44e2925c, %l0 = ffffffffffffffff
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = ffffffffffff925c
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000010141400] = ff000000, %l1 = 00000000343f80e9
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000343f80e9, Mem[0000000010101410] = ffffffff
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 343f80e9

p0_label_322:
!	Mem[00000000201c0001] = ffff367d, %l2 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010101410] = 343f80e9, %l7 = 00000000343f80e9
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 00000034000000ff
!	%f2  = ffff0026 00000000, %l0 = ffffffffffff925c
!	Mem[0000000010141420] = 5c92e244121321b5
	add	%i5,0x020,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_P ! Mem[0000000010141420] = 5c92e244121321b5
!	Mem[0000000010081400] = c0a52600, %l5 = ffff002600000000
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101408] = fe747889, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l5	! %l5 = 00000000fe747889
!	%l7 = 0000000000000034, Mem[0000000030181400] = b521131244e2925c
	stxa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000034
!	Mem[0000000010101400] = 00000000, %l4 = f700000000000000
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000021800140] = 6affe6e1, %asi = 80
	stba	%l4,[%o3+0x140]%asi	! Mem[0000000021800140] = 00ffe6e1
!	Mem[0000000010141431] = f6b3e679, %l6 = 00000000000000ff
	ldstuba	[%i5+0x031]%asi,%l6	! %l6 = 000000b3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = f9c39cff, %f1  = 00003a30
	ld	[%i0+0x030],%f1 	! %f1 = f9c39cff

p0_label_323:
!	Mem[0000000010081408] = 0054276c, %f10 = 28512d10
	lda	[%i2+%o4]0x88,%f10	! %f10 = 0054276c
!	Mem[0000000010181400] = f6b3e679, %l3 = 0000000000000030
	lduwa	[%i6+%g0]0x80,%l3	! %l3 = 00000000f6b3e679
!	Mem[0000000030041410] = 00000030, %f12 = f6b3e679
	lda	[%i1+%o5]0x89,%f12	! %f12 = 00000030
!	Mem[0000000010181408] = 000000ff, %l0 = ffffffffffff925c
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = ffff0026, %l5 = 00000000fe747889
	ldsba	[%i5+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041408] = 00000000, %f25 = a9150caf
	lda	[%i1+%o4]0x89,%f25	! %f25 = 00000000
!	Mem[0000000030081410] = 00008a7c, %l3 = 00000000f6b3e679
	lduwa	[%i2+%o5]0x81,%l3	! %l3 = 0000000000008a7c
!	Mem[0000000010081408] = 0054276c, %l7 = 0000000000000034
	lduwa	[%i2+%o4]0x88,%l7	! %l7 = 000000000054276c
!	Mem[0000000010081408] = 0054276c, %l3 = 0000000000008a7c
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 000000000054276c
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00000000, %l7 = 000000000054276c
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000

p0_label_324:
!	%l3 = 000000000054276c, Mem[0000000010001434] = af0c15a9, %asi = 80
	stba	%l3,[%i0+0x034]%asi	! Mem[0000000010001434] = 6c0c15a9
!	Mem[0000000010141410] = 000000f7, %l3 = 000000000054276c
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000f7
!	%l1 = 00000000000000ff, Mem[0000000010101410] = ff3f80e9
	stha	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ff80e9
!	%l4 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stha	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%l5 = ffffffffffffffff, Mem[0000000010181400] = 79e6b3f6
	stba	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 79e6b3ff
!	%l3 = 00000000000000f7, Mem[0000000010141428] = 28512d106bb30828, %asi = 80
	stxa	%l3,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000000000000f7
!	%l3 = 00000000000000f7, Mem[0000000010141400] = 303a0000000000ff
	stxa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000000000f7
!	%l3 = 00000000000000f7, Mem[0000000010181418] = 305122b45c2438bb, %asi = 80
	stxa	%l3,[%i6+0x018]%asi	! Mem[0000000010181418] = 00000000000000f7
!	Mem[0000000010041400] = 00000000, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l1 = 00000000000000ff
	ldswa	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_325:
!	Mem[0000000010141400] = 000000f7, %f19 = 000000ff
	lda	[%i5+%g0]0x88,%f19	! %f19 = 000000f7
!	Mem[0000000030001408] = ffff0026 00000000, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000 00000000ffff0026
!	Mem[00000000100c1410] = 00000000, %l4 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 6c275400, %l4 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l4	! %l4 = 000000000000006c
!	Mem[0000000010001400] = ff000000, %l6 = 00000000000000b3
	ldsha	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 0000ff00, %l1 = 0000000000000000
	lduba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 000000ff0054276c, %l7 = 0000000000000000
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = 000000ff0054276c
!	%l1 = 0000000000000000, %l3 = 00000000000000f7, %l0 = 00000000000000ff
	andn	%l1,%l3,%l0		! %l0 = 0000000000000000
!	Mem[0000000010001410] = f7000000, %l4 = 000000000000006c
	ldsha	[%i0+%o5]0x80,%l4	! %l4 = fffffffffffff700
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 000000f7, %l4 = fffffffffffff700
	ldstuba	[%i0+%o5]0x88,%l4	! %l4 = 000000f7000000ff

p0_label_326:
!	%l6 = 0000000000000000, Mem[0000000010001410] = ff00000000000000, %asi = 80
	stxa	%l6,[%i0+0x010]%asi	! Mem[0000000010001410] = 0000000000000000
!	%f0  = ff000000 f9c39cff ffff0026 00000000
!	%f4  = f7000000 00000000 305122b4 2808b36b
!	%f8  = 5c92e244 121321b5 0054276c 6bb30828
!	%f12 = 00000030 c0a561e3 6c275400 15b72d80
	stda	%f0,[%i3]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	Mem[0000000010181434] = c0a561e3, %l3 = 00000000000000f7
	swap	[%i6+0x034],%l3		! %l3 = 00000000c0a561e3
!	Mem[0000000030041410] = 00000030, %l2 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000030
!	%l7 = 000000ff0054276c, Mem[0000000030141408] = ff000000
	stha	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 276c0000
!	Mem[0000000010141400] = f7000000, %l3 = 00000000c0a561e3, %asi = 80
	swapa	[%i5+0x000]%asi,%l3	! %l3 = 00000000f7000000
!	%l2 = 0000000000000030, Mem[0000000010081400] = ff000000c0a526ff
	stxa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000030
!	%f30 = 00000000 00000000, Mem[0000000010001400] = 000000ff 00000000
	stda	%f30,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 00000000
!	Mem[0000000010081408] = 0054276c, %l3 = 00000000f7000000
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 0000006c000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141434] = c0a561e3, %f30 = 00000000
	lda	[%i5+0x034]%asi,%f30	! %f30 = c0a561e3

p0_label_327:
!	Mem[0000000030141408] = ff00000000006c27, %l0 = 0000000000000000
	ldxa	[%i5+%o4]0x89,%l0	! %l0 = ff00000000006c27
!	Mem[0000000010001410] = 00000000, %l7 = 000000ff0054276c
	lduba	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 0000000000000000, %f22 = 30000000 00000000
	ldda	[%i0+%o5]0x80,%f22	! %f22 = 00000000 00000000
!	Mem[0000000010101408] = 00000000, %l1 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = 00000000000000ff, %l3 = 000000000000006c
	ldxa	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141408] = 276c0000, %f29 = 26000000
	lda	[%i5+%o4]0x81,%f29	! %f29 = 276c0000
!	Mem[000000001004143c] = 00000000, %l6 = 0000000000000000
	ldsba	[%i1+0x03e]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141410] = 343f80e9a82be5a9, %f16 = 00000000 000000ff
	ldda	[%i5+%o5]0x81,%f16	! %f16 = 343f80e9 a82be5a9
	membar	#Sync			! Added by membar checker (51)
!	Mem[00000000300c1408] = 2600ffff, %f17 = a82be5a9
	lda	[%i3+%o4]0x89,%f17	! %f17 = 2600ffff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000010141400] = e361a5c0
	stba	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = e361a5ff

p0_label_328:
!	Mem[0000000030101408] = 2600ffff, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 000000002600ffff
!	%f26 = 343f80e9 a82be5a9, Mem[0000000010081400] = 30000000 00000000
	stda	%f26,[%i2+0x000]%asi	! Mem[0000000010081400] = 343f80e9 a82be5a9
!	%l4 = 00000000000000f7, Mem[0000000030141408] = 276c0000
	stba	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = f76c0000
!	Mem[0000000010001414] = 00000000, %l5 = ffff0026, %l4 = 000000f7
	add	%i0,0x14,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = 343f80e9, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 00000034000000ff
!	%l5 = 00000000ffff0026, Mem[00000000100c1408] = 000000ff
	stwa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffff0026
!	%f22 = 00000000 00000000, Mem[0000000010181400] = 79e6b3ff 00000000
	stda	%f22,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 00000000
!	%f14 = 6c275400 15b72d80, Mem[0000000030041408] = 00000000 000000ff
	stda	%f14,[%i1+%o4]0x81	! Mem[0000000030041408] = 6c275400 15b72d80
!	Mem[00000000218001c0] = 00004fd1, %l6 = 0000000000000034
	ldstuba	[%o3+0x1c0]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 305122b4, %l1 = 000000002600ffff
	ldsh	[%i5+0x01a],%l1		! %l1 = 00000000000022b4

p0_label_329:
!	Mem[000000001018143c] = 15b72d80, %l2 = 0000000000000030
	ldsb	[%i6+0x03c],%l2		! %l2 = 0000000000000015
!	Mem[0000000010001400] = 0000000000000000, %f16 = 343f80e9 2600ffff
	ldda	[%i0+%g0]0x88,%f16	! %f16 = 00000000 00000000
!	Mem[0000000010141400] = 00000000e361a5ff, %f30 = c0a561e3 00000000
	ldda	[%i5+%g0]0x88,%f30	! %f30 = 00000000 e361a5ff
!	Mem[0000000010041410] = 00000000 00000000, %l0 = 00006c27, %l1 = 000022b4
	ldda	[%i1+0x010]%asi,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l6 = 0000000000000000
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010181408] = 00000000000000ff, %f30 = 00000000 e361a5ff
	ldda	[%i6+%o4]0x88,%f30	! %f30 = 00000000 000000ff
!	Mem[00000000300c1410] = f7000000, %l0 = 0000000000000000
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = fffffffff7000000
!	Mem[0000000030181400] = 00000034, %l5 = 00000000ffff0026
	lduba	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000034
!	Mem[00000000201c0000] = ffff367d, %l2 = 0000000000000015
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 00000000, %l0 = fffffffff7000000
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000

p0_label_330:
!	%l7 = 0000000000000000, Mem[0000000010081410] = 00000013
	stha	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	%l0 = 0000000000000000, Mem[00000000211c0000] = ff300b46, %asi = 80
	stba	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00300b46
!	Mem[00000000300c1408] = 2600ffff, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[0000000021800180] = ff0035e9
	stb	%l7,[%o3+0x180]		! Mem[0000000021800180] = 000035e9
!	Mem[0000000030101408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000300c1410] = f7000000
	stwa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff
!	Mem[0000000021800081] = 05ff32fb, %l2 = ffffffffffffffff
	ldstub	[%o3+0x081],%l2		! %l2 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = 00000034, Mem[0000000010101400] = 0054276c 00000000
	stda	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff 00000034
!	Mem[0000000021800180] = 000035e9, %l5 = 0000000000000034
	ldstuba	[%o3+0x180]%asi,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0000ff00, %l6 = ffffffffff000000
	lduwa	[%i2+%o4]0x89,%l6	! %l6 = 000000000000ff00

p0_label_331:
!	Mem[0000000010041408] = 0000ff00, %l4 = 00000000000000ff
	ldswa	[%i1+%o4]0x88,%l4	! %l4 = 000000000000ff00
!	Mem[00000000300c1408] = ffff0026, %l2 = 00000000000000ff
	lduba	[%i3+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %f17 = 00000000
	ld	[%i6+%g0],%f17	! %f17 = 00000000
!	Mem[0000000010041410] = f7000000, %l4 = 000000000000ff00
	ldsha	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %l4 = 0000000000000000
	lduba	[%i4+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 343f80e9, %l1 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000034
!	Mem[0000000010181434] = 000000f7, %f7  = 2808b36b
	ld	[%i6+0x034],%f7 	! %f7 = 000000f7
!	Mem[0000000010081418] = 00000000, %l2 = 00000000000000ff
	ldswa	[%i2+0x018]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = ff00000000000000, %f6  = 305122b4 000000f7
	ldda	[%i1+%o5]0x81,%f6 	! %f6  = ff000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 000000ff000000ff

p0_label_332:
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000030181410] = 343f00ff ffffffff
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff 00000000
!	%l4 = 00000000000000ff, Mem[00000000300c1400] = 000000ff
	stwa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	Mem[0000000030141400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%f2  = ffff0026, Mem[0000000030041410] = 000000ff
	sta	%f2 ,[%i1+%o5]0x89	! Mem[0000000030041410] = ffff0026
!	Mem[0000000010101405] = 34000000, %l2 = 0000000000000000
	ldstuba	[%i4+0x005]%asi,%l2	! %l2 = 00000000000000ff
!	%f4  = f7000000, Mem[0000000030101410] = bb3800ff
	sta	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = f7000000
!	Mem[00000000211c0001] = 00300b46, %l7 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 00000030000000ff
!	%l4 = 00000000000000ff, Mem[0000000010041410] = f7000000
	stwa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	Mem[00000000100c1433] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i3+0x033]%asi,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 000000ff00000000, %f8  = 5c92e244 121321b5
	ldda	[%i3+%o5]0x81,%f8 	! %f8  = 000000ff 00000000

p0_label_333:
!	Mem[0000000021800140] = 00ffe6e1, %l6 = 000000000000ff00
	ldsb	[%o3+0x140],%l6		! %l6 = 0000000000000000
!	Mem[0000000010141400] = 00000000e361a5ff, %f12 = 00000030 c0a561e3
	ldda	[%i5+%g0]0x88,%f12	! %f12 = 00000000 e361a5ff
!	Mem[00000000211c0000] = 00ff0b46, %l7 = 0000000000000030
	ldsba	[%o2+0x001]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1410] = 00000000, %l1 = 0000000000000034
	ldsba	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = 6c275400, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l6	! %l6 = 0000000000006c27
!	Mem[0000000030081400] = ff000000, %l5 = 0000000000000000
	ldswa	[%i2+%g0]0x81,%l5	! %l5 = ffffffffff000000
!	Mem[0000000030001408] = 00000000, %f31 = 000000ff
	lda	[%i0+%o4]0x81,%f31	! %f31 = 00000000
!	Mem[0000000030081408] = 00ff0000, %f9  = 00000000
	lda	[%i2+%o4]0x81,%f9 	! %f9 = 00ff0000
!	Mem[0000000010141400] = e361a5ff, %l0 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 00000000e361a5ff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000006c27, Mem[00000000100c1408] = 2600ffff
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00006c27

p0_label_334:
!	Mem[0000000021800181] = ff0035e9, %l2 = 0000000000000000
	ldstub	[%o3+0x181],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030081410] = 00008a7c, %l2 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 0000000000008a7c
!	%l4 = 000000ff, %l5 = ff000000, Mem[00000000100c1408] = 276c0000 000000ff
	std	%l4,[%i3+%o4]		! Mem[00000000100c1408] = 000000ff ff000000
!	%l1 = 0000000000000000, Mem[0000000010101410] = e980ff00
	stwa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000030041400] = af0c15a9, %l7 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 000000af000000ff
!	Mem[0000000010041408] = 00ff0000, %l0 = e361a5ff, %l1 = 00000000
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 0000000000ff0000
!	%f26 = 343f80e9, Mem[0000000030041408] = 0054276c
	sta	%f26,[%i1+%o4]0x89	! Mem[0000000030041408] = 343f80e9
!	%l2 = 00008a7c, %l3 = 000000ff, Mem[0000000010181408] = ff000000 00000000
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 00008a7c 000000ff
!	%l5 = ffffffffff000000, Mem[0000000010001408] = ff000000
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = bb38245c 00000000, %l2 = 00008a7c, %l3 = 000000ff
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000 00000000bb38245c

p0_label_335:
!	Mem[0000000010041408] = 00ff0000, %f29 = 276c0000
	lda	[%i1+%o4]0x80,%f29	! %f29 = 00ff0000
!	Mem[0000000030181408] = ff3f80e9, %l7 = 00000000000000af
	ldswa	[%i6+%o4]0x81,%l7	! %l7 = ffffffffff3f80e9
!	Mem[00000000300c1400] = 000000ff, %l7 = ffffffffff3f80e9
	lduba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101408] = bb38245c00000000, %f26 = 343f80e9 a82be5a9
	ldda	[%i4+%o4]0x88,%f26	! %f26 = bb38245c 00000000
!	Mem[0000000030181410] = ff000000, %l2 = 0000000000000000
	ldsha	[%i6+%o5]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030041410] = 00000000ffff0026, %l5 = ffffffffff000000
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = 00000000ffff0026
!	Mem[0000000010081408] = 000000ff 005427ff, %l2 = ffffff00, %l3 = bb38245c
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 00000000005427ff 00000000000000ff
!	Mem[0000000020800000] = ffff188e, %l6 = 0000000000006c27
	lduba	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00000000, %l1 = 0000000000ff0000
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 00000000000000ff

p0_label_336:
!	Mem[0000000030081410] = 00000000, %l5 = 00000000ffff0026
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001400] = 00000000, %l1 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000300c1400] = 000000ff, %l6 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = 000000ff, %l2 = 00000000005427ff
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081410] = ff000000, %l1 = 00000000000000ff
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	%l5 = 0000000000000000, Mem[0000000010041410] = ff000000
	stba	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%f4  = f7000000, Mem[0000000010081408] = ff275400
	sta	%f4 ,[%i2+%o4]0x80	! Mem[0000000010081408] = f7000000
!	Mem[0000000030001410] = b42251ff, %l0 = 00000000e361a5ff
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 00000000b42251ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000ff, %l4 = 00000000000000ff
	ldswa	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff

p0_label_337:
!	Mem[0000000030001408] = 000000002600ffff, %l0 = 00000000b42251ff
	ldxa	[%i0+%o4]0x81,%l0	! %l0 = 000000002600ffff
!	Code Fragment 3
p0_fragment_12:
!	%l0 = 000000002600ffff
	setx	0x4b02fa27f4df1172,%g7,%l0 ! %l0 = 4b02fa27f4df1172
!	%l1 = 00000000ff000000
	setx	0xc1dd3dd850c5acb2,%g7,%l1 ! %l1 = c1dd3dd850c5acb2
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4b02fa27f4df1172
	setx	0x0dfedd07911bc22c,%g7,%l0 ! %l0 = 0dfedd07911bc22c
!	%l1 = c1dd3dd850c5acb2
	setx	0x09b5844fe623ffb6,%g7,%l1 ! %l1 = 09b5844fe623ffb6
!	Mem[0000000010001408] = 00000000, %l0 = 0dfedd07911bc22c
	ldsw	[%i0+%o4],%l0		! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (52)
!	Mem[00000000100c1400] = ff5122b4 14eb7ae0 000000ff ff000000
!	Mem[00000000100c1410] = 00000000 2600ffff 625a637b 00ebffe0
!	Mem[00000000100c1420] = ffffffff 00ff00af 00000000 0000ff00
!	Mem[00000000100c1430] = 000000ff 00000027 ffff0026 ffff9c20
	ldda	[%i3]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010001438] = 00000000, %f6  = ff000000
	ld	[%i0+0x038],%f6 	! %f6 = 00000000
!	Mem[00000000300c1408] = 2600ffff, %l1 = 09b5844fe623ffb6
	ldsha	[%i3+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101410] = 00000000, %l1 = ffffffffffffffff
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = 00000000 5c2438bb, %l0 = 00000000, %l1 = 00000000
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000 000000005c2438bb
!	Mem[00000000300c1410] = 000000ff, %l3 = 00000000000000ff
	lduwa	[%i3+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000

p0_label_338:
	membar	#Sync			! Added by membar checker (53)
!	%l7 = 0000000000000000, Mem[00000000100c1400] = ff5122b4
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Mem[00000000201c0001] = ffff367d, %l0 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000201c0001] = ffff367d, %l0 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010081415] = 7b635a62, %l6 = 0000000000000000
	ldstub	[%i2+0x015],%l6		! %l6 = 00000063000000ff
!	Mem[00000000300c1408] = ffff0026, %l7 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	%l5 = 0000000000000000, Mem[0000000010141408] = 000000002600ffff
	stxa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%f24 = ffffffff, Mem[0000000030181400] = 00000034
	sta	%f24,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff
!	Mem[0000000030081400] = 000000ff, %l7 = ffffffffffffffff
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l0 = 000000ff, %l1 = 5c2438bb, Mem[0000000010101408] = 00000000 5c2438bb
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff 5c2438bb
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l1 = 000000005c2438bb
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_339:
!	Mem[0000000020800000] = ffff188e, %l3 = 00000000000000ff
	ldub	[%o1+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010101438] = ff0000ff 00ebffe0, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i4+0x038]%asi,%l2	! %l2 = 00000000ff0000ff 0000000000ebffe0
!	Mem[0000000021800040] = ffffa30e, %l2 = 00000000ff0000ff
	ldsha	[%o3+0x040]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081418] = 00000000 000005ad, %l0 = 000000ff, %l1 = 00000000
	ldd	[%i2+0x018],%l0		! %l0 = 0000000000000000 00000000000005ad
!	Mem[0000000030081410] = ff000000, %l1 = 00000000000005ad
	lduba	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = ff000000, %l2 = ffffffffffffffff
	ldswa	[%i3+%o4]0x88,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010001414] = 00000000, %l5 = 0000000000000000
	ldsha	[%i0+0x016]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l6 = 0000000000000063
	lduwa	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181438] = 6c275400, %l5 = 0000000000000000
	ldswa	[%i6+0x038]%asi,%l5	! %l5 = 000000006c275400
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 000000ff, %l3 = 0000000000ebffe0
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 00000000000000ff

p0_label_340:
!	%l3 = 00000000000000ff, Mem[0000000030181408] = e9803fff
	stba	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = e9803fff
!	Mem[0000000010101400] = 005427ff, %l4 = 00000000000000ff
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 00000000005427ff
!	%f0  = ff000000 f9c39cff, Mem[00000000300c1408] = 2600ffff 00000000
	stda	%f0 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff000000 f9c39cff
!	%l5 = 000000006c275400, Mem[00000000300c1410] = 00ebffe0
	stba	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ebffe0
!	%l4 = 005427ff, %l5 = 6c275400, Mem[0000000030081410] = ff000000 00000000
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 005427ff 6c275400
!	%f18 = 000000ff ff000000, Mem[0000000010181408] = 7c8a0000 ff000000
	stda	%f18,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff ff000000
!	%l0 = 0000000000000000, Mem[0000000010041408] = 0000ff00
	stba	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000ff00
!	Mem[00000000300c1408] = ff9cc3f9, %l4 = 00000000005427ff
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 00000000ff9cc3f9
!	%l7 = 00000000000000ff, Mem[0000000010101418] = 00000000, %asi = 80
	stwa	%l7,[%i4+0x018]%asi	! Mem[0000000010101418] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = ffff35e9, %l1 = 0000000000000000
	lduh	[%o3+0x180],%l1		! %l1 = 000000000000ffff

p0_label_341:
!	Mem[0000000030141400] = ff000000ffff0000, %l3 = 00000000000000ff
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = ff000000ffff0000
!	Mem[0000000010081410] = 000000ff, %f5  = 00000000
	lda	[%i2+%o5]0x88,%f5 	! %f5 = 000000ff
!	Mem[0000000030081408] = 00ff0000, %l4 = 00000000ff9cc3f9
	lduwa	[%i2+%o4]0x81,%l4	! %l4 = 0000000000ff0000
!	Mem[0000000010141400] = ffa561e3 00000000, %l2 = ff000000, %l3 = ffff0000
	ldd	[%i5+%g0],%l2		! %l2 = 00000000ffa561e3 0000000000000000
!	Mem[00000000100c1408] = 000000ff, %l3 = 00000000, %l2 = ffa561e3
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l3,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181410] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i6+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181420] = 5c92e244, %l3 = ffffffffffffffff
	ldub	[%i6+0x023],%l3		! %l3 = 0000000000000044
!	Mem[00000000100c1438] = ffff0026ffff9c20, %f4  = f7000000 000000ff
	ldd	[%i3+0x038],%f4 	! %f4  = ffff0026 ffff9c20
!	Mem[0000000010181408] = 000000ff, %l3 = 0000000000000044
	lduha	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff000000, %l7 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff

p0_label_342:
!	%f0  = ff000000 f9c39cff, Mem[0000000030041410] = 2600ffff 00000000
	stda	%f0 ,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000 f9c39cff
!	%l0 = 0000000000000000, Mem[000000001014141a] = 305122b4
	sth	%l0,[%i5+0x01a]		! Mem[0000000010141418] = 30510000
!	%l1 = 000000000000ffff, Mem[0000000030001410] = e361a5ff
	stba	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = e361a5ff
!	Mem[0000000030041400] = a9150cff, %l1 = 000000000000ffff
	swapa	[%i1+%g0]0x89,%l1	! %l1 = 00000000a9150cff
!	Mem[0000000010141410] = 000000000054276c, %f0  = ff000000 f9c39cff
	ldda	[%i5+%o5]0x88,%f0 	! %f0  = 00000000 0054276c
!	%f18 = 000000ff ff000000, Mem[0000000010001410] = 00000000 00000000
	stda	%f18,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff ff000000
!	%f0  = 00000000 0054276c ffff0026 00000000
!	%f4  = ffff0026 ffff9c20 00000000 00000000
!	%f8  = 000000ff 00ff0000 0054276c 6bb30828
!	%f12 = 00000000 e361a5ff 6c275400 15b72d80
	stda	%f0,[%i2]ASI_BLK_AIUS	! Block Store to 0000000030081400
!	%l7 = 0000000000000000, Mem[0000000010081400] = 343f80e9
	stba	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 003f80e9
!	%f22 = 625a637b 00ebffe0, Mem[0000000010141408] = 00000000 00000000
	stda	%f22,[%i5+%o4]0x88	! Mem[0000000010141408] = 625a637b 00ebffe0
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = edfc4a2700000000, %l2 = 00000000000000ff
	ldxa	[%i0+%o4]0x88,%l2	! %l2 = edfc4a2700000000

p0_label_343:
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000010081410] = ff0000007bff5a62, %l1 = 00000000a9150cff
	ldxa	[%i2+%o5]0x80,%l1	! %l1 = ff0000007bff5a62
!	Mem[0000000030081410] = ffff0026, %l4 = 0000000000ff0000
	ldswa	[%i2+%o5]0x81,%l4	! %l4 = ffffffffffff0026
!	Mem[0000000030001400] = 303a0000, %l5 = 000000006c275400
	lduwa	[%i0+%g0]0x81,%l5	! %l5 = 00000000303a0000
!	Mem[0000000010181408] = 000000ffff000000, %f22 = 625a637b 00ebffe0
	ldda	[%i6+%o4]0x80,%f22	! %f22 = 000000ff ff000000
!	Mem[0000000030081408] = ffff0026, %l7 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001400] = 303a0000, %l7 = ffffffffffffffff
	lduba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000030
!	Mem[0000000010001408] = 00000000, %l4 = ffffffffffff0026
	lduw	[%i0+%o4],%l4		! %l4 = 0000000000000000
!	Mem[0000000030001410] = e361a5ff, %l1 = ff0000007bff5a62
	lduwa	[%i0+%o5]0x89,%l1	! %l1 = 00000000e361a5ff
!	Mem[0000000030041400] = 00ffffff0000ffff, %f20 = 00000000 2600ffff
	ldda	[%i1+%g0]0x89,%f20	! %f20 = 00ffffff 0000ffff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = e361a5ff, Mem[0000000010001408] = 00000000 274afced
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 e361a5ff

p0_label_344:
!	%l0 = 0000000000000000, Mem[0000000010041408] = 00ff0000
	stha	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%f27 = 0000ff00, Mem[0000000010001408] = 00000000
	st	%f27,[%i0+%o4]		! Mem[0000000010001408] = 0000ff00
!	%l1 = 00000000e361a5ff, Mem[0000000030101408] = 00000000000000ff
	stxa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000e361a5ff
!	%l7 = 0000000000000030, Mem[0000000010001408] = 0000ff00
	stha	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 0030ff00
!	Mem[0000000010041400] = 00000000, %l2 = edfc4a2700000000
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%f10 = 0054276c 6bb30828, Mem[0000000010181408] = ff000000 000000ff
	stda	%f10,[%i6+%o4]0x88	! Mem[0000000010181408] = 0054276c 6bb30828
!	Mem[0000000010001408] = 0030ff00, %l7 = 0000000000000030
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%f24 = ffffffff 00ff00af, Mem[0000000030141410] = e9803f34 a9e52ba8
	stda	%f24,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff 00ff00af
!	Mem[00000000100c141b] = 625a637b, %l3 = 0000000000000000
	ldstub	[%i3+0x01b],%l3		! %l3 = 0000007b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = af00ff00, %l0 = 0000000000000000
	lduha	[%i5+%o5]0x81,%l0	! %l0 = 000000000000af00

p0_label_345:
!	Mem[0000000010041400] = 00000000, %l4 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 000000f7, %l7 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000f7
!	Mem[0000000010081400] = a9e52ba8e9803f00, %l2 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l2	! %l2 = a9e52ba8e9803f00
!	Mem[000000001014141c] = 2808b36b, %l7 = 00000000000000f7
	ldsw	[%i5+0x01c],%l7		! %l7 = 000000002808b36b
!	Mem[00000000211c0000] = 00ff0b46, %l4 = 0000000000000000
	ldsba	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[000000001004140c] = 2e2caf12, %l2 = a9e52ba8e9803f00
	ldsba	[%i1+0x00c]%asi,%l2	! %l2 = 000000000000002e
!	Mem[00000000100c1408] = ff000000, %l7 = 000000002808b36b
	ldsha	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 00000000 00000000, %l2 = 0000002e, %l3 = 0000007b
	ldda	[%i4+0x010]%asi,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030141400] = 000000ff, %l1 = 00000000e361a5ff
	lduha	[%i5+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = f7000000, %l5 = 00000000303a0000
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 00000000f7000000

p0_label_346:
!	%l7 = 0000000000000000, Mem[0000000010081410] = ff000000
	stwa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Mem[00000000201c0000] = ffff367d, %l6 = 0000000000000000
	ldstub	[%o0+%g0],%l6		! %l6 = 000000ff000000ff
!	%l5 = 00000000f7000000, Mem[0000000030041410] = ff9cc3f9000000ff
	stxa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000f7000000
!	%f6  = 00000000 00000000, Mem[0000000010101400] = 000000ff 0000ff34
	stda	%f6 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 00000000
!	%f7  = 00000000, Mem[00000000300c1408] = 005427ff
	sta	%f7 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Mem[0000000010081410] = 000000007bff5a62, %l0 = 000000000000af00, %l6 = 00000000000000ff
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = 000000007bff5a62
!	%l3 = 0000000000000000, Mem[0000000030001410] = ffa561e3
	stwa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%f15 = 15b72d80, Mem[00000000300c1410] = 00ebffe0
	sta	%f15,[%i3+%o5]0x81	! Mem[00000000300c1410] = 15b72d80
!	%l2 = 0000000000000000, Mem[0000000010001400] = 0000000000000000
	stxa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 30510000, %l6 = 000000007bff5a62
	lduha	[%i5+0x018]%asi,%l6	! %l6 = 0000000000003051

p0_label_347:
!	Mem[0000000010041404] = ffff0026, %l7 = 0000000000000000
	ldsh	[%i1+0x006],%l7		! %l7 = 0000000000000026
!	Mem[0000000030181408] = e9803fff, %l0 = 000000000000af00
	lduha	[%i6+%o4]0x89,%l0	! %l0 = 0000000000003fff
!	Mem[0000000030101410] = 00003a30, %l4 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l4	! %l4 = 0000000000003a30
!	Mem[0000000030101410] = 00003a30, %l5 = 00000000f7000000
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = 00000026ff000000, %f14 = 6c275400 15b72d80
	ldda	[%i4+%g0]0x81,%f14	! %f14 = 00000026 ff000000
!	Mem[0000000010141408] = e0ffeb00, %l7 = 0000000000000026
	ldswa	[%i5+%o4]0x80,%l7	! %l7 = ffffffffe0ffeb00
!	Mem[0000000030081408] = ffff0026, %l0 = 0000000000003fff
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181408] = 0054276c6bb30828, %f20 = 00ffffff 0000ffff
	ldda	[%i6+%o4]0x88,%f20	! %f20 = 0054276c 6bb30828
!	Mem[0000000030081408] = ffff0026, %l6 = 0000000000003051
	ldsha	[%i2+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff0000ff, %l1 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 000000ff000000ff

p0_label_348:
!	%f0  = 00000000 0054276c ffff0026 00000000
!	%f4  = ffff0026 ffff9c20 00000000 00000000
!	%f8  = 000000ff 00ff0000 0054276c 6bb30828
!	%f12 = 00000000 e361a5ff 00000026 ff000000
	stda	%f0,[%i2]ASI_BLK_S	! Block Store to 0000000030081400
!	%l4 = 0000000000003a30, Mem[0000000030181410] = 000000ff
	stba	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000030
!	%l7 = ffffffffe0ffeb00, Mem[0000000010041410] = 00000000
	stwa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = e0ffeb00
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000010081438] = 000000ff, %l3 = 0000000000000000, %asi = 80
	swapa	[%i2+0x038]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = e9803fff, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%f10 = 0054276c 6bb30828, %l0 = ffffffffffffffff
!	Mem[0000000010081428] = 000000ff0000ff00
	add	%i2,0x028,%g1
	stda	%f10,[%g1+%l0]ASI_PST32_P ! Mem[0000000010081428] = 0054276c6bb30828
!	%l0 = ffffffffffffffff, Mem[0000000010181400] = 00000000
	stwa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffffff
!	Mem[0000000010141428] = 00000000, %l5 = 0000000000000000
	swap	[%i5+0x028],%l5		! %l5 = 0000000000000000
!	%l4 = 0000000000003a30, Mem[0000000030041410] = 000000f7
	stha	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 3a3000f7
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00003a30, %l1 = 00000000000000ff
	lduba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000030

p0_label_349:
!	Mem[0000000030141410] = 00ff00af, %l3 = 00000000000000ff
	lduwa	[%i5+%o5]0x89,%l3	! %l3 = 0000000000ff00af
!	Mem[0000000030141410] = af00ff00, %l5 = 0000000000000000
	lduba	[%i5+%o5]0x81,%l5	! %l5 = 00000000000000af
!	Mem[0000000030041400] = ffff0000 ffffff00, %l4 = 00003a30, %l5 = 000000af
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 00000000ffff0000 00000000ffffff00
!	Mem[00000000300c1410] = 802db715, %l3 = 0000000000ff00af
	lduha	[%i3+%o5]0x89,%l3	! %l3 = 000000000000b715
!	Mem[0000000030181400] = ffffffff, %l1 = 0000000000000030
	ldsba	[%i6+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Code Fragment 3
p0_fragment_13:
!	%l0 = ffffffffffffffff
	setx	0xaf91f967c2668ea7,%g7,%l0 ! %l0 = af91f967c2668ea7
!	%l1 = ffffffffffffffff
	setx	0x4e640dd01648789f,%g7,%l1 ! %l1 = 4e640dd01648789f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = af91f967c2668ea7
	setx	0xc72e0df050c89c2d,%g7,%l0 ! %l0 = c72e0df050c89c2d
!	%l1 = 4e640dd01648789f
	setx	0xb53fe1a797454796,%g7,%l1 ! %l1 = b53fe1a797454796
!	Mem[0000000010041414] = 00000000, %l7 = ffffffffe0ffeb00
	ldsba	[%i1+0x015]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = ffffffff00000000, %f12 = 00000000 e361a5ff
	ldda	[%i6+%g0]0x80,%f12	! %f12 = ffffffff 00000000
!	Mem[00000000211c0000] = 00ff0b46, %l0 = c72e0df050c89c2d
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ffffff00, Mem[0000000030181400] = ffffffff
	stha	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffff00

p0_label_350:
!	Mem[00000000300c1408] = 00000000, %l2 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l6 = ffffffffffffffff, Mem[0000000021800080] = 05ff32fb
	sth	%l6,[%o3+0x080]		! Mem[0000000021800080] = ffff32fb
!	Mem[00000000100c1408] = ff000000, %l6 = ffffffffffffffff
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 00000000ff000000
!	%l4 = ffff0000, %l5 = ffffff00, Mem[0000000010041400] = 00000000 2600ffff
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = ffff0000 ffffff00
!	%l4 = 00000000ffff0000, Mem[0000000030041400] = 0000ffff
	stba	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000ff00
!	%l1 = b53fe1a797454796, Mem[00000000218000c0] = 33ffbf7c, %asi = 80
	stha	%l1,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 4796bf7c
!	Mem[0000000010081400] = 003f80e9, %l3 = 000000000000b715
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000003f80e9
!	%l3 = 00000000003f80e9, Mem[0000000020800040] = 26ff9e9b, %asi = 80
	stha	%l3,[%o1+0x040]%asi	! Mem[0000000020800040] = 80e99e9b
!	Mem[0000000030181408] = ff3f80e9, %l1 = b53fe1a797454796
	swapa	[%i6+%o4]0x81,%l1	! %l1 = 00000000ff3f80e9
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ffff002600000000, %f26 = 00000000 0000ff00
	ldda	[%i0+%o4]0x89,%f26	! %f26 = ffff0026 00000000

p0_label_351:
!	Mem[0000000010181410] = 0000000000000000, %l6 = 00000000ff000000
	ldxa	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l1 = 00000000ff3f80e9
	ldsba	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = ffff367d, %l3 = 00000000003f80e9
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = 0000000000000000, %f20 = 0054276c 6bb30828
	ldda	[%i4+%g0]0x80,%f20	! %f20 = 00000000 00000000
!	Mem[00000000100c1410] = 00000000, %f24 = ffffffff
	lda	[%i3+%o5]0x80,%f24	! %f24 = 00000000
!	Mem[00000000300c1400] = 000000ff, %l0 = 00000000000000ff
	ldswa	[%i3+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000021800040] = ffffa30e, %l5 = 00000000ffffff00
	ldsh	[%o3+0x040],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000211c0000] = 00ff0b46, %l7 = 0000000000000000
	lduh	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[00000000300c1400] = ff000000, %l1 = 0000000000000000
	lduwa	[%i3+%g0]0x81,%l1	! %l1 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010101410] = 00000000
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffff

p0_label_352:
!	Mem[0000000030001400] = 00003a30, %l1 = 00000000ff000000
	swapa	[%i0+%g0]0x89,%l1	! %l1 = 0000000000003a30
!	%f10 = 0054276c, Mem[0000000010081400] = 15b70000
	sta	%f10,[%i2+%g0]0x88	! Mem[0000000010081400] = 0054276c
!	%l5 = ffffffffffffffff, Mem[0000000010101400] = 0000000000000000
	stxa	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffffffffffff
!	%l4 = ffff0000, %l5 = ffffffff, Mem[0000000030041400] = 00ff0000 ffffff00
	stda	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = ffff0000 ffffffff
!	%l1 = 0000000000003a30, Mem[0000000010001408] = 00ff30ff
	stwa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 00003a30
!	Mem[0000000010181418] = 00000000000000f7, %l3 = ffffffffffffffff, %l7 = 00000000000000ff
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = 00000000000000f7
!	Mem[0000000030001408] = 00000000, %l2 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%f8  = 000000ff 00ff0000, Mem[0000000030001400] = ff000000 ff000000
	stda	%f8 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff 00ff0000
!	Mem[0000000010001400] = 00000000, %l0 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 000000ff, %l5 = ffffffffffffffff
	ldsha	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff

p0_label_353:
!	Mem[00000000100c1400] = 00000000, %l3 = ffffffffffffffff
	ldswa	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 00ff0b46, %l1 = 0000000000003a30
	ldsh	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010101408] = ff0000ff, %l2 = 0000000000000000
	lduha	[%i4+%o4]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010181400] = 00000000ffffffff, %l2 = 000000000000ff00
	ldxa	[%i6+%g0]0x88,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010181408] = 2808b36b, %l7 = 00000000000000f7
	ldsba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000028
!	Mem[0000000030041400] = 0000ffff, %l2 = 00000000ffffffff
	lduba	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = ffffffff, %l7 = 0000000000000028
	ldsha	[%i3+0x00a]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101438] = ff0000ff00ebffe0, %l7 = ffffffffffffffff
	ldx	[%i4+0x038],%l7		! %l7 = ff0000ff00ebffe0
!	Mem[00000000300c1408] = ff000000 000000ff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 00000000ff000000 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f25 = 00ff00af, Mem[00000000100c1410] = 00000000
	sta	%f25,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00ff00af

p0_label_354:
!	%l4 = 00000000ffff0000, Mem[0000000030041408] = e9803f34
	stwa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = ffff0000
!	Mem[0000000020800000] = ffff188e, %l3 = 00000000000000ff
	ldstuba	[%o1+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	%l2 = 00000000ff000000, Mem[0000000030141410] = af00ff00
	stba	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000ff00
!	%l2 = ff000000, %l3 = 000000ff, Mem[0000000010101410] = ffffffff 00000000
	stda	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = ff000000 000000ff
!	%l6 = 0000000000000000, Mem[0000000030041408] = 0000ffff
	stba	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000ff00
!	Code Fragment 4
p0_fragment_14:
!	%l0 = 0000000000000000
	setx	0xfdfdf30862588e39,%g7,%l0 ! %l0 = fdfdf30862588e39
!	%l1 = 00000000000000ff
	setx	0x0b8bb4382897a560,%g7,%l1 ! %l1 = 0b8bb4382897a560
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fdfdf30862588e39
	setx	0xf7361d682adf991b,%g7,%l0 ! %l0 = f7361d682adf991b
!	%l1 = 0b8bb4382897a560
	setx	0x8da20f2f92d8185d,%g7,%l1 ! %l1 = 8da20f2f92d8185d
!	Mem[0000000020800040] = 80e99e9b, %l3 = 00000000000000ff
	ldstub	[%o1+0x040],%l3		! %l3 = 00000080000000ff
!	%l4 = ffff0000, %l5 = 000000ff, Mem[00000000300c1410] = 802db715 00000000
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffff0000 000000ff
!	%l6 = 0000000000000000, Mem[0000000030141400] = ff000000
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 0054276c, %f12 = ffffffff
	lda	[%i5+%o5]0x88,%f12	! %f12 = 0054276c

p0_label_355:
!	Mem[0000000030181400] = 00ffffff, %l5 = 00000000000000ff
	ldsha	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = 2600ffff, %l2 = 00000000ff000000
	ldsba	[%i2+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181408] = 2808b36b, %f6  = 00000000
	lda	[%i6+%o4]0x80,%f6 	! %f6 = 2808b36b
!	Mem[0000000030181400] = 00ffffff, %l7 = ff0000ff00ebffe0
	lduba	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l0 = f7361d682adf991b
	lduba	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = ffff188e, %l6 = 0000000000000000
	ldsh	[%o1+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000300c1410] = 0000ffff, %l7 = 0000000000000000
	ldswa	[%i3+%o5]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030141408] = f76c0000000000ff, %f20 = 00000000 00000000
	ldda	[%i5+%o4]0x81,%f20	! %f20 = f76c0000 000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[00000000300c1400] = ff000000
	stwa	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff

p0_label_356:
!	Mem[0000000010181410] = 00000000, %l2 = ffffffffffffffff
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141436] = c0a561e3, %l0 = 00000000000000ff
	ldstub	[%i5+0x036],%l0		! %l0 = 00000061000000ff
!	Mem[0000000010041424] = 000000ff, %l5 = 00000000000000ff
	swap	[%i1+0x024],%l5		! %l5 = 00000000000000ff
!	Mem[00000000201c0001] = ffff367d, %l1 = 8da20f2f92d8185d
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030081410] = ffff0026, %l5 = 00000000000000ff
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%f12 = 0054276c 00000000, Mem[00000000100c1408] = ffffffff ff000000
	stda	%f12,[%i3+0x008]%asi	! Mem[00000000100c1408] = 0054276c 00000000
!	%l5 = 00000000000000ff, Mem[0000000010081400] = 6c275400a82be5a9
	stx	%l5,[%i2+%g0]		! Mem[0000000010081400] = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000080
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%l5 = 00000000000000ff, Mem[000000001008142c] = 6bb30828
	sth	%l5,[%i2+0x02c]		! Mem[000000001008142c] = 00ff0828
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000007bff5a62, %l5 = 00000000000000ff
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = 000000007bff5a62

p0_label_357:
!	Mem[0000000010001400] = ff000000, %l6 = ffffffffffffffff
	ldsh	[%i0+0x002],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1428] = 00000000 0000ff00, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+0x028]%asi,%l2	! %l2 = 0000000000000000 000000000000ff00
!	Mem[0000000030041408] = 0000ff00, %f10 = 0054276c
	lda	[%i1+%o4]0x89,%f10	! %f10 = 0000ff00
!	Mem[0000000030101408] = 00000000e361a5ff, %l7 = 000000000000ffff
	ldxa	[%i4+%o4]0x89,%l7	! %l7 = 00000000e361a5ff
!	Mem[0000000010001410] = 000000ffff000000, %l7 = 00000000e361a5ff
	ldxa	[%i0+%o5]0x80,%l7	! %l7 = 000000ffff000000
!	Mem[0000000010141400] = ffa561e3, %f10 = 0000ff00
	lda	[%i5+%g0]0x80,%f10	! %f10 = ffa561e3
!	Mem[0000000010081418] = 00000000 000005ad, %l6 = 00000000, %l7 = ff000000
	ldd	[%i2+0x018],%l6		! %l6 = 0000000000000000 00000000000005ad
!	Mem[0000000010081408] = 000000f7, %l2 = 0000000000000000
	ldsba	[%i2+%o4]0x88,%l2	! %l2 = fffffffffffffff7
!	Mem[0000000010041410] = 00000000e0ffeb00, %l7 = 00000000000005ad
	ldxa	[%i1+%o5]0x88,%l7	! %l7 = 00000000e0ffeb00
!	Starting 10 instruction Store Burst
!	%f8  = 000000ff 00ff0000, Mem[00000000100c1410] = 00ff00af 2600ffff
	std	%f8 ,[%i3+%o5]	! Mem[00000000100c1410] = 000000ff 00ff0000

p0_label_358:
!	Mem[0000000010101410] = ff000000, %l3 = 000000000000ff00
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	%l6 = 0000000000000000, Mem[00000000300c1410] = ffff0000
	stha	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffff0000
!	%f16 = ff5122b4 14eb7ae0, %l3 = 00000000ff000000
!	Mem[0000000010181438] = 6c27540015b72d80
	add	%i6,0x038,%g1
	stda	%f16,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010181438] = 6c27540015b72d80
!	%f8  = 000000ff 00ff0000, Mem[0000000030101400] = 26000000 000000ff
	stda	%f8 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff 00ff0000
!	%f18 = 000000ff, Mem[0000000010001410] = 000000ff
	sta	%f18,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff
!	%l4 = ffff0000, %l5 = 7bff5a62, Mem[0000000010141408] = 00ebffe0 625a637b
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = ffff0000 7bff5a62
!	%l5 = 000000007bff5a62, Mem[0000000030081408] = 000000002600ffff
	stxa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000007bff5a62
!	%f16 = ff5122b4, Mem[0000000030101408] = e361a5ff
	sta	%f16,[%i4+%o4]0x89	! Mem[0000000030101408] = ff5122b4
!	%l2 = fffffff7, %l3 = ff000000, Mem[00000000300c1408] = ff000000 000000ff
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = fffffff7 ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 6bb30828, %l2 = fffffffffffffff7
	lduwa	[%i6+%o4]0x88,%l2	! %l2 = 000000006bb30828

p0_label_359:
!	Mem[00000000201c0000] = ffff367d, %l4 = 00000000ffff0000
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010081400] = 00000000, %l7 = 00000000e0ffeb00
	ldswa	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = ffff188e, %l6 = 0000000000000000
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030041410] = f700303a, %l5 = 000000007bff5a62
	ldsba	[%i1+%o5]0x89,%l5	! %l5 = 000000000000003a
!	Mem[0000000010141410] = 0054276c, %l2 = 000000006bb30828
	ldsba	[%i5+%o5]0x88,%l2	! %l2 = 000000000000006c
!	Mem[0000000010141428] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i5+0x02b]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800040] = ffffa30e, %l2 = 000000000000006c
	lduha	[%o3+0x040]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[00000000100c1418] = 625a63ff, %l7 = 0000000000000000
	lduwa	[%i3+0x018]%asi,%l7	! %l7 = 00000000625a63ff
!	Mem[0000000030001408] = 00000000, %l4 = ffffffffffffffff
	ldswa	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081418] = 00000000, %l4 = 0000000000000000, %asi = 80
	swapa	[%i2+0x018]%asi,%l4	! %l4 = 0000000000000000

p0_label_360:
!	%l6 = ffffffffffffffff, Mem[0000000010001410] = ff000000
	stwa	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff
!	%f12 = 0054276c 00000000, Mem[0000000030041400] = ffff0000 ffffffff
	stda	%f12,[%i1+%g0]0x81	! Mem[0000000030041400] = 0054276c 00000000
!	%f3  = 00000000, Mem[0000000030041410] = f700303a
	sta	%f3 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010101436] = ff12ff12, %asi = 80
	stha	%l4,[%i4+0x036]%asi	! Mem[0000000010101434] = ff120000
!	%l2 = 000000000000ffff, Mem[0000000010181408] = 2808b36b
	stwa	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000ffff
!	%l5 = 000000000000003a, Mem[000000001008140c] = ff000000
	stw	%l5,[%i2+0x00c]		! Mem[000000001008140c] = 0000003a
!	%l1 = 0000000000000000, Mem[0000000010081434] = b4225130, %asi = 80
	stha	%l1,[%i2+0x034]%asi	! Mem[0000000010081434] = 00005130
!	%f18 = 000000ff ff000000, Mem[00000000300c1400] = 000000ff f9c39cff
	stda	%f18,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff ff000000
!	Mem[0000000010141400] = ffa561e300000000, %l3 = 00000000ff000000, %l2 = 000000000000ffff
	casxa	[%i5]0x80,%l3,%l2	! %l2 = ffa561e300000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 0054276c, %l6 = ffffffffffffffff
	ldsba	[%i5+%o5]0x88,%l6	! %l6 = 000000000000006c

p0_label_361:
!	Mem[000000001008141c] = 000005ad, %l0 = 0000000000000061
	ldsw	[%i2+0x01c],%l0		! %l0 = 00000000000005ad
!	Mem[0000000010141410] = 6c275400 00000000, %l4 = 00000000, %l5 = 0000003a
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 000000006c275400 0000000000000000
!	Mem[0000000010181400] = ffffffff 00000000, %l2 = 00000000, %l3 = ff000000
	ldda	[%i6+%g0]0x80,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[00000000201c0000] = ffff367d, %l1 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[000000001000142c] = 000000ff, %l1 = 000000000000ffff
	ldsb	[%i0+0x02c],%l1		! %l1 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l7 = 00000000625a63ff
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 00000000 e361a5ff, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 00000000e361a5ff 0000000000000000
!	Mem[0000000010101408] = ff0000ff, %f2  = ffff0026
	lda	[%i4+%o4]0x80,%f2 	! %f2 = ff0000ff
!	Mem[0000000020800000] = ffff188e, %l1 = 0000000000000000
	ldub	[%o1+%g0],%l1		! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 000000ff, %l6 = 000000000000006c
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000ff

p0_label_362:
!	%l2 = 00000000e361a5ff, Mem[0000000030101400] = 0000ff00
	stba	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = ff00ff00
!	Mem[0000000010081408] = f7000000, %l4 = 000000006c275400
	swapa	[%i2+%o4]0x80,%l4	! %l4 = 00000000f7000000
!	Mem[0000000010181408] = ffff0000, %l3 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l3	! %l3 = 00000000ffff0000
!	%f22 = 000000ff ff000000, %l0 = 00000000000005ad
!	Mem[0000000030081420] = 000000ff00ff0000
	add	%i2,0x020,%g1
	stda	%f22,[%g1+%l0]ASI_PST16_S ! Mem[0000000030081420] = 000000ff00ff0000
!	%l6 = 0000000000000000, Mem[0000000010041410] = 00ebffe0
	stba	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 00ebffe0
!	%l7 = 0000000000000000, Mem[0000000010001410] = ffffffffff000000
	stxa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	Mem[0000000030081410] = 2600ffff, %l1 = 00000000000000ff
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	%f2  = ff0000ff 00000000, Mem[0000000010041400] = 0000ffff 00ffffff
	std	%f2 ,[%i1+%g0]	! Mem[0000000010041400] = ff0000ff 00000000
!	Mem[0000000010141408] = 0000ffff, %l6 = 0000000000000000
	swap	[%i5+%o4],%l6		! %l6 = 000000000000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = 5c92e244 121321b5, %l4 = f7000000, %l5 = 00000000
	ldda	[%i5+0x020]%asi,%l4	! %l4 = 000000005c92e244 00000000121321b5

p0_label_363:
!	Mem[0000000010081430] = e07aeb14, %l2 = 00000000e361a5ff
	ldsba	[%i2+0x032]%asi,%l2	! %l2 = ffffffffffffffeb
!	Mem[0000000030101410] = ff003a3000000000, %l7 = 0000000000000000
	ldxa	[%i4+%o5]0x81,%l7	! %l7 = ff003a3000000000
!	Mem[0000000030101400] = ff00ff00ff000000, %l2 = ffffffffffffffeb
	ldxa	[%i4+%g0]0x81,%l2	! %l2 = ff00ff00ff000000
!	Mem[00000000100c1400] = e07aeb14 80000000, %l2 = ff000000, %l3 = ffff0000
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 0000000080000000 00000000e07aeb14
!	Mem[0000000010141408] = 00000000, %f8  = 000000ff
	lda	[%i5+%o4]0x88,%f8 	! %f8 = 00000000
!	Mem[0000000010041408] = 00000000, %l4 = 000000005c92e244
	ldsba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ffff367d, %l6 = 000000000000ffff
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1430] = 000000ff, %l2 = 0000000080000000
	lduba	[%i3+0x030]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = 0054276c, %l0 = 00000000000005ad
	lduha	[%i5+%o5]0x88,%l0	! %l0 = 000000000000276c
!	Starting 10 instruction Store Burst
!	%l5 = 00000000121321b5, Mem[0000000030101408] = 00000000ff5122b4
	stxa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000121321b5

p0_label_364:
!	%l2 = 0000000000000000, Mem[0000000030041400] = 000000006c275400
	stxa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000021800080] = ffff32fb
	sth	%l2,[%o3+0x080]		! Mem[0000000021800080] = 000032fb
!	%l1 = 00000000000000ff, Mem[0000000030181410] = 00000030
	stwa	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	%f21 = 000000ff, Mem[0000000010081400] = 00000000
	sta	%f21,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff
!	Mem[0000000020800041] = ffe99e9b, %l7 = ff003a3000000000
	ldstub	[%o1+0x041],%l7		! %l7 = 000000e9000000ff
!	Mem[0000000030041400] = 00000000, %l7 = 00000000000000e9
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l6 = ffffffffffffffff, Mem[0000000030041408] = 0000ff00
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000ffff
!	%l4 = 0000000000000000, Mem[0000000030141400] = 00000000
	stwa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%f26 = ffff0026, Mem[0000000030081408] = 625aff7b
	sta	%f26,[%i2+%o4]0x81	! Mem[0000000030081408] = ffff0026
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ff0b46, %l1 = 00000000000000ff
	ldsh	[%o2+%g0],%l1		! %l1 = 00000000000000ff

p0_label_365:
!	Mem[0000000010141400] = ffa561e3, %l6 = ffffffffffffffff
	lduwa	[%i5+%g0]0x80,%l6	! %l6 = 00000000ffa561e3
!	Mem[00000000100c1400] = 0000008014eb7ae0, %l0 = 000000000000276c
	ldxa	[%i3+%g0]0x80,%l0	! %l0 = 0000008014eb7ae0
!	Mem[0000000010081410] = 00000000 7bff5a62, %l0 = 14eb7ae0, %l1 = 000000ff
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000 000000007bff5a62
!	Mem[00000000100c1410] = 000000ff00ff0000, %f24 = 00000000 00ff00af
	ldda	[%i3+%o5]0x80,%f24	! %f24 = 000000ff 00ff0000
!	Mem[0000000030041410] = 00000000, %l5 = 00000000121321b5
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 00000000ffffffff, %l7 = 0000000000000000
	ldxa	[%i6+%g0]0x88,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010141430] = f6ffe679c0a5ffe3, %f2  = ff0000ff 00000000
	ldd	[%i5+0x030],%f2 	! %f2  = f6ffe679 c0a5ffe3
!	Mem[0000000030141410] = ffffffff 00ff0000, %l0 = 00000000, %l1 = 7bff5a62
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 0000000000ff0000 00000000ffffffff
!	Mem[0000000010141414] = 00000000, %l3 = 00000000e07aeb14
	ldsw	[%i5+0x014],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 303a0000e361a5ff, %l3 = 0000000000000000, %l1 = 00000000ffffffff
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = 303a0000e361a5ff

p0_label_366:
!	Mem[0000000030081408] = ffff0026, %l7 = 00000000ffffffff
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 00000000ffff0026
!	Mem[0000000010181400] = ffffffff, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000ffffffff
!	%f14 = 00000026 ff000000, Mem[0000000010001400] = ff000000 00000000
	stda	%f14,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000026 ff000000
!	Mem[00000000100c1420] = ffffffff00ff00af, %l1 = 303a0000e361a5ff, %l4 = 00000000ffffffff
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = ffffffff00ff00af
!	%l5 = 0000000000000000, Mem[0000000010141400] = ffa561e3
	stha	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 000061e3
!	%l6 = 00000000ffa561e3, Mem[0000000030041400] = 000000e9
	stha	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 000061e3
!	%f10 = ffa561e3 6bb30828, %l6 = 00000000ffa561e3
!	Mem[0000000030141420] = 245c000000000000
	add	%i5,0x020,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030141420] = 2808b36b00000000
!	%f8  = 00000000 00ff0000, %l3 = 0000000000000000
!	Mem[0000000010101418] = 000000ff00000000
	add	%i4,0x018,%g1
	stda	%f8,[%g1+%l3]ASI_PST32_P ! Mem[0000000010101418] = 000000ff00000000
!	%l6 = ffa561e3, %l7 = ffff0026, Mem[0000000030081400] = 00000000 0054276c
	stda	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = ffa561e3 ffff0026
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff367d, %l1 = 303a0000e361a5ff
	lduh	[%o0+%g0],%l1		! %l1 = 000000000000ffff

p0_label_367:
!	Mem[0000000030081410] = 2600ffff, %l2 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001400] = 0000ff00ff000000, %l0 = 0000000000ff0000
	ldxa	[%i0+%g0]0x81,%l0	! %l0 = 0000ff00ff000000
!	Mem[00000000211c0000] = 00ff0b46, %l0 = 0000ff00ff000000
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l1 = 000000000000ffff
	lduba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800080] = 000032fb, %l3 = 0000000000000000
	ldsh	[%o3+0x080],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000 625aff7b, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000 00000000625aff7b
!	%l7 = 00000000ffff0026, Mem[0000000030101400] = 00ff00ff
	stwa	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = ffff0026
!	Mem[00000000100c1400] = 00000080, %l1 = 00000000625aff7b
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000080
!	Mem[0000000010001408] = 303a0000, %l3 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l3	! %l3 = 00000000303a0000
!	Starting 10 instruction Store Burst
!	%l6 = ffa561e3, %l7 = ffff0026, Mem[00000000100c1400] = 00000080 14eb7ae0
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffa561e3 ffff0026

p0_label_368:
!	%f18 = 000000ff ff000000, Mem[0000000010181400] = 00000000 00000000
	stda	%f18,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff ff000000
!	%l4 = ffffffff00ff00af, Mem[0000000030041400] = 00000000000061e3
	stxa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff00ff00af
!	%l7 = 00000000ffff0026, Mem[000000001010141c] = 00000000
	stw	%l7,[%i4+0x01c]		! Mem[000000001010141c] = ffff0026
!	Mem[0000000010181410] = ffffffff, %l6 = 00000000ffa561e3
	swapa	[%i6+%o5]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030081408] = ffffffff, %l7 = 00000000ffff0026
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030041408] = 0000ffff, %l6 = 00000000ffffffff
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	%f12 = 0054276c 00000000, Mem[00000000100c1408] = 0054276c 00000000
	std	%f12,[%i3+%o4]	! Mem[00000000100c1408] = 0054276c 00000000
!	Mem[0000000010181400] = ff000000, %l1 = 0000000000000080
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 00000000ff000000
!	Mem[000000001000143c] = ffffffff, %l1 = ff000000, %l6 = 000000ff
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 625a63ff 00ebffe0, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i3+0x018]%asi,%l6	! %l6 = 00000000625a63ff 0000000000ebffe0

p0_label_369:
!	Mem[0000000010181400] = 80000000ff000000, %f18 = 000000ff ff000000
	ldda	[%i6+%g0]0x80,%f18	! %f18 = 80000000 ff000000
!	Mem[0000000030181408] = 96474597, %l6 = 00000000625a63ff
	lduha	[%i6+%o4]0x89,%l6	! %l6 = 0000000000004597
!	Mem[0000000030141410] = 00ff0000, %l2 = ffffffffffffffff
	lduha	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 0000ff00ffffffff, %l3 = 00000000303a0000
	ldxa	[%i5+%o5]0x81,%l3	! %l3 = 0000ff00ffffffff
!	Mem[0000000020800000] = ffff188e, %l3 = 0000ff00ffffffff
	ldsba	[%o1+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081410] = 00000000, %l1 = 00000000ff000000
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 00ff0000, %l3 = ffffffffffffffff
	ldsba	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = a9e52ba896474597, %l7 = 0000000000ebffe0
	ldxa	[%i6+%o4]0x89,%l7	! %l7 = a9e52ba896474597
!	Mem[0000000030041408] = 0000ffff, %f14 = 00000026
	lda	[%i1+%o4]0x89,%f14	! %f14 = 0000ffff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000004597, Mem[0000000010041410] = 00ebffe000000000
	stxa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000004597

p0_label_370:
!	%l3 = 0000000000000000, Mem[0000000010041430] = 00000000
	stw	%l3,[%i1+0x030]		! Mem[0000000010041430] = 00000000
!	%l2 = 0000000000000000, Mem[0000000030041410] = 00000000
	stba	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%f12 = 0054276c, Mem[0000000010181400] = 80000000
	sta	%f12,[%i6+%g0]0x80	! Mem[0000000010181400] = 0054276c
!	%l4 = ffffffff00ff00af, Mem[0000000030041400] = 00ff00af
	stha	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00ff00af
!	%l5 = 0000000000000000, Mem[0000000010101400] = ffffffff, %asi = 80
	stwa	%l5,[%i4+0x000]%asi	! Mem[0000000010101400] = 00000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010181400] = 6c275400 000000ff
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 00000000
!	%f24 = 000000ff 00ff0000, Mem[0000000010081400] = 000000ff 000000ff
	stda	%f24,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff 00ff0000
!	Mem[0000000010081400] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010141428] = 00000000
	sth	%l0,[%i5+0x028]		! Mem[0000000010141428] = 00000000
!	Starting 10 instruction Load Burst
!	%l3 = 0000000000000000, Mem[0000000030081408] = ffffffff00000000
	stxa	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000

p0_label_371:
!	Mem[0000000010041408] = 00000000 2e2caf12, %l0 = 00000000, %l1 = 00000000
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000 000000002e2caf12
	membar	#Sync			! Added by membar checker (56)
!	Mem[0000000030081400] = ffa561e3 ffff0026 00000000 00000000
!	Mem[0000000030081410] = ffff0026 ffff9c20 00000000 00000000
!	Mem[0000000030081420] = 000000ff 00ff0000 0054276c 6bb30828
!	Mem[0000000030081430] = 00000000 e361a5ff 00000026 ff000000
	ldda	[%i2]ASI_BLK_S,%f0	! Block Load from 0000000030081400
!	Mem[0000000010141408] = 00000000, %f20 = f76c0000
	lda	[%i5+%o4]0x80,%f20	! %f20 = 00000000
!	Mem[0000000010101400] = 00000000, %l3 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 0054276c, %l4 = ffffffff00ff00af
	ldsba	[%i5+%o5]0x88,%l4	! %l4 = 000000000000006c
!	Mem[0000000030001400] = 00ff0000, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 303a0000 e361a5ff, %l4 = 0000006c, %l5 = 00000000
	ldda	[%i0+0x008]%asi,%l4	! %l4 = 00000000303a0000 00000000e361a5ff
!	Mem[0000000030041400] = 00ff00af, %f27 = 00000000
	lda	[%i1+%g0]0x89,%f27	! %f27 = 00ff00af
!	Mem[0000000030081408] = 0000000000000000, %f18 = 80000000 ff000000
	ldda	[%i2+%o4]0x81,%f18	! %f18 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 2e2caf12, Mem[0000000030141408] = 00006cf7 ff000000
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 2e2caf12

p0_label_372:
!	%l0 = 0000000000000000, Mem[00000000100c1410] = ff000000
	stba	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff000000
!	Mem[0000000030181408] = 97454796, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 00000097000000ff
!	%l4 = 303a0000, %l5 = e361a5ff, Mem[0000000030141408] = 00000000 2e2caf12
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 303a0000 e361a5ff
!	%l4 = 303a0000, %l5 = e361a5ff, Mem[0000000030101408] = b5211312 00000000
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 303a0000 e361a5ff
!	%l5 = 00000000e361a5ff, Mem[0000000030001410] = 00000000
	stha	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = a5ff0000
!	%l1 = 000000002e2caf12, Mem[0000000030181410] = ff000000
	stwa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 2e2caf12
!	%l4 = 00000000303a0000, Mem[0000000030181400] = 00000000ffffff00
	stxa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000303a0000
!	%f18 = 00000000 00000000, %l3 = 0000000000000097
!	Mem[0000000010181418] = 00000000000000f7
	add	%i6,0x018,%g1
	stda	%f18,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010181418] = 00000000000000f7
	membar	#Sync			! Added by membar checker (57)
!	%l5 = 00000000e361a5ff, Mem[0000000030081400] = ffa561e3ffff0026
	stxa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000e361a5ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041414] = 00004597, %l0 = 0000000000000000
	ldsb	[%i1+0x015],%l0		! %l0 = 0000000000000000

p0_label_373:
!	Mem[0000000020800040] = ffff9e9b, %l7 = a9e52ba896474597
	ldsh	[%o1+0x040],%l7		! %l7 = ffffffffffffffff
!	Mem[00000000211c0000] = 00ff0b46, %l7 = ffffffffffffffff
	lduh	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030001410] = a5ff0000, %l0 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000a5
!	Mem[0000000010001408] = ffa561e300003a30, %l0 = 00000000000000a5
	ldxa	[%i0+%o4]0x88,%l0	! %l0 = ffa561e300003a30
!	Mem[0000000021800080] = 000032fb, %l7 = 00000000000000ff
	ldsh	[%o3+0x080],%l7		! %l7 = 0000000000000000
!	Mem[0000000030181408] = ff454796, %l6 = 0000000000004597
	ldsha	[%i6+%o4]0x81,%l6	! %l6 = ffffffffffffff45
!	Mem[0000000030101410] = 00000000 303a00ff, %l0 = 00003a30, %l1 = 2e2caf12
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 00000000303a00ff 0000000000000000
!	Mem[0000000010141408] = 7bff5a6200000000, %l0 = 00000000303a00ff
	ldxa	[%i5+%o4]0x88,%l0	! %l0 = 7bff5a6200000000
!	Mem[0000000030141408] = e361a5ff303a0000, %f8  = 000000ff 00ff0000
	ldda	[%i5+%o4]0x89,%f8 	! %f8  = e361a5ff 303a0000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ffff367d, %l7 = 0000000000000000
	ldstub	[%o0+%g0],%l7		! %l7 = 000000ff000000ff

p0_label_374:
!	%l5 = 00000000e361a5ff, Mem[0000000010141410] = 6c275400
	stba	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = ff275400
!	%l2 = 0000000000000000, Mem[0000000030101408] = 00003a30
	stba	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00003a00
!	%f14 = 00000026 ff000000, Mem[00000000100c1410] = 000000ff 00ff0000
	stda	%f14,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000026 ff000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030181408] = 964745ff a9e52ba8
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 00000000
!	%f25 = 00ff0000, Mem[0000000010101400] = 00000000
	sta	%f25,[%i4+%g0]0x88	! Mem[0000000010101400] = 00ff0000
!	%l7 = 00000000000000ff, Mem[0000000030081400] = 00000000
	stwa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff
!	%l3 = 0000000000000097, Mem[0000000010041438] = ffffffff00000000, %asi = 80
	stxa	%l3,[%i1+0x038]%asi	! Mem[0000000010041438] = 0000000000000097
!	%f12 = 00000000 e361a5ff, Mem[00000000100c1400] = e361a5ff 2600ffff
	stda	%f12,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 e361a5ff
!	%f4  = ffff0026, Mem[00000000300c1408] = f7ffffff
	sta	%f4 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffff0026
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %f13 = e361a5ff
	lda	[%i1+%o5]0x88,%f13	! %f13 = 00000000

p0_label_375:
!	Mem[00000000100c1408] = 000000006c275400, %l0 = 7bff5a6200000000
	ldxa	[%i3+%o4]0x88,%l0	! %l0 = 000000006c275400
!	Mem[0000000030041408] = ffff0000, %f17 = 14eb7ae0
	lda	[%i1+%o4]0x81,%f17	! %f17 = ffff0000
!	Mem[0000000010081408] = 0054276c, %l5 = 00000000e361a5ff
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 000000000054276c
!	Mem[0000000010041404] = 00000000, %l6 = ffffffffffffff45
	lduwa	[%i1+0x004]%asi,%l6	! %l6 = 0000000000000000
!	Mem[000000001008141c] = 000005ad, %l1 = 0000000000000000
	ldsb	[%i2+0x01f],%l1		! %l1 = ffffffffffffffad
!	Mem[0000000030181400] = 303a0000, %f14 = 00000026
	lda	[%i6+%g0]0x89,%f14	! %f14 = 303a0000
!	Mem[0000000030081410] = ffff0026, %l1 = ffffffffffffffad
	ldsha	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041438] = 0000000000000097, %f22 = 000000ff ff000000
	ldda	[%i1+0x038]%asi,%f22	! %f22 = 00000000 00000097
!	Mem[0000000010081434] = 00005130, %l5 = 000000000054276c
	lduha	[%i2+0x034]%asi,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000303a0000, Mem[0000000010101408] = ff0000ff
	stba	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000

p0_label_376:
!	%l1 = ffffffffffffffff, Mem[00000000100c1408] = 0054276c
	stwa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffffff
!	%l2 = 0000000000000000, Mem[0000000010081408] = 6c275400
	stwa	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	Mem[0000000030081410] = 2600ffff, %l2 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l2	! %l2 = 000000002600ffff
!	%l3 = 0000000000000097, Mem[0000000030041410] = 0000000000000000
	stxa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000097
!	%l3 = 0000000000000097, Mem[0000000010141400] = e3610000
	stha	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = e3610097
!	%l6 = 0000000000000000, Mem[0000000010141408] = 7bff5a6200000000
	stxa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%f6  = 00000000 00000000, Mem[00000000300c1410] = 0000ffff ff000000
	stda	%f6 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 00000000
!	Mem[0000000030081410] = 00000000, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l3 = 0000000000000097, Mem[00000000300c1410] = 00000000
	stwa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000097
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l3 = 0000000000000097
	lduha	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000

p0_label_377:
!	Mem[0000000030101408] = 00003a00, %l7 = 00000000000000ff
	lduwa	[%i4+%o4]0x89,%l7	! %l7 = 0000000000003a00
!	Mem[0000000021800140] = 00ffe6e1, %l4 = 00000000303a0000
	lduh	[%o3+0x140],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010101400] = 0000ff00, %l2 = 000000002600ffff
	ldsba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %f31 = ffff9c20
	lda	[%i2+%o5]0x81,%f31	! %f31 = 00000000
!	Mem[0000000030001400] = 00ff0000, %l6 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %f23 = 00000097
	lda	[%i0+%o4]0x81,%f23	! %f23 = 00000000
!	Mem[0000000030001408] = 00000000, %l6 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = e361a5ff303a0000, %l0 = 000000006c275400
	ldxa	[%i5+%o4]0x89,%l0	! %l0 = e361a5ff303a0000
!	Mem[0000000030081408] = 00000000, %l3 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l4	! %l4 = 00000000000000ff

p0_label_378:
!	%l4 = 0000000000000000, Mem[0000000010041400] = ff0000ff
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	%l6 = 0000000000000000, Mem[0000000030101410] = ff003a30
	stba	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00003a30
!	%f22 = 00000000 00000000, %l6 = 0000000000000000
!	Mem[0000000010101420] = 22b4f36b332e00f0
	add	%i4,0x020,%g1
	stda	%f22,[%g1+%l6]ASI_PST8_P ! Mem[0000000010101420] = 22b4f36b332e00f0
!	%l1 = ffffffffffffffff, Mem[0000000010081410] = 00000000
	stwa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffff
!	Mem[00000000201c0001] = ffff367d, %l1 = ffffffffffffffff
	ldstub	[%o0+0x001],%l1		! %l1 = 000000ff000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010041408] = 00000000 12af2c2e
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 00000000
!	Mem[0000000010001424] = 2600ffff, %l0 = 303a0000, %l6 = 00000000
	add	%i0,0x24,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 000000002600ffff
!	Mem[00000000300c1410] = 00000097, %l5 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 00000097000000ff
!	%l4 = 0000000000000000, Mem[0000000030101400] = ffff0026
	stba	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 303a0000e361a5ff, %l3 = 0000000000000000
	ldxa	[%i0+0x008]%asi,%l3	! %l3 = 303a0000e361a5ff

p0_label_379:
!	Mem[00000000300c1408] = 000000ffffff0026, %l3 = 303a0000e361a5ff
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = 000000ffffff0026
!	Mem[0000000030181400] = 303a0000, %l3 = 000000ffffff0026
	lduwa	[%i6+%g0]0x89,%l3	! %l3 = 00000000303a0000
!	Mem[0000000010141418] = 30510000, %l5 = 0000000000000097
	lduh	[%i5+0x01a],%l5		! %l5 = 0000000000000000
!	Mem[0000000030041400] = 00ff00af, %l6 = 000000002600ffff
	lduha	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000af
!	Mem[00000000300c1400] = ff0000ff, %l7 = 0000000000003a00
	lduba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = ffa561e3, %l6 = 00000000000000af
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffffffa5
!	Mem[0000000010141424] = 121321b5, %l0 = e361a5ff303a0000
	ldsw	[%i5+0x024],%l0		! %l0 = 00000000121321b5
!	Mem[0000000010001400] = 00000026, %l2 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (58)
!	Mem[0000000030101400] = 0000ffff ff000000 003a0000 e361a5ff
!	Mem[0000000030101410] = 00003a30 00000000 305122b4 14eb7ae0
!	Mem[0000000030101420] = 5c92e244 121321b5 28512d10 6bb30828
!	Mem[0000000030101430] = f6b3e679 c0a561e3 6c275400 15b72d80
	ldda	[%i4]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030101400
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 0000000000004597, %l0 = 00000000121321b5, %l1 = 00000000000000ff
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 0000000000004597

p0_label_380:
!	%f6  = 00000000 00000000, Mem[0000000010041410] = 00000000 00004597
	stda	%f6 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 00000000
!	%l0 = 00000000121321b5, Mem[0000000030181408] = 00000000
	stba	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000b5
!	%l4 = 0000000000000000, Mem[0000000010041400] = 000000ff
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	Mem[0000000010001408] = 303a0000, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 00000000303a0000
!	%f10 = 0054276c 6bb30828, Mem[0000000010001410] = 00000000 00000000
	std	%f10,[%i0+%o5]	! Mem[0000000010001410] = 0054276c 6bb30828
!	Mem[0000000030081408] = 00000000, %l6 = ffffffffffffffa5
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001400] = 00000026, %l6 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101410] = 0000ff00, %l3 = 00000000303a0000
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010041400] = ff000000 00000000
	stda	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 0054276c, %l3 = 0000000000000000
	lduba	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_381:
!	Mem[0000000010181408] = 0054276c00000000, %f0  = ffa561e3 ffff0026
	ldda	[%i6+%o4]0x88,%f0 	! %f0  = 0054276c 00000000
!	Code Fragment 4
p0_fragment_15:
!	%l0 = 00000000121321b5
	setx	0x4ce9d90fd29fc0b1,%g7,%l0 ! %l0 = 4ce9d90fd29fc0b1
!	%l1 = 0000000000004597
	setx	0x6b20a2efe3516410,%g7,%l1 ! %l1 = 6b20a2efe3516410
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4ce9d90fd29fc0b1
	setx	0x15fc315ff13ac17e,%g7,%l0 ! %l0 = 15fc315ff13ac17e
!	%l1 = 6b20a2efe3516410
	setx	0x444a201ff7098ca1,%g7,%l1 ! %l1 = 444a201ff7098ca1
!	Mem[0000000010101400] = 0000ff00, %f11 = 6bb30828
	lda	[%i4+%g0]0x80,%f11	! %f11 = 0000ff00
!	Mem[0000000010181424] = 12ff21b5, %l0 = 15fc315ff13ac17e
	ldsb	[%i6+0x026],%l0		! %l0 = 0000000000000021
!	Mem[00000000211c0000] = 00ff0b46, %l3 = 0000000000000000
	lduh	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %f12 = 00000000
	lda	[%i5+%o4]0x80,%f12	! %f12 = 00000000
!	Mem[0000000030141408] = 00003a30ffa561e3, %l3 = 00000000000000ff
	ldxa	[%i5+%o4]0x81,%l3	! %l3 = 00003a30ffa561e3
!	Mem[0000000030001400] = 0000ff00 ff000000 00000000 2600ffff
!	Mem[0000000030001410] = a5ff0000 14eb7ae0 e07aeb14 b4225130
!	Mem[0000000030001420] = b5211312 44e2925c 2808b36b 102d5128
!	Mem[0000000030001430] = e361a5c0 79e6b3f6 802db715 0054276c
	ldda	[%i0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030001400
!	Mem[0000000030081408] = 000000ff, %l4 = 0000000000000000
	lduha	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ff0000ff, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 000000ff000000ff

p0_label_382:
	membar	#Sync			! Added by membar checker (59)
!	%l5 = 00000000303a0000, Mem[0000000030001400] = 00ff0000
	stha	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 00ff0000
!	Mem[0000000010101414] = 000000ff, %l0 = 0000000000000021, %asi = 80
	swapa	[%i4+0x014]%asi,%l0	! %l0 = 00000000000000ff
!	%f0  = 0054276c 00000000, Mem[0000000010141400] = 970061e3 00000000
	stda	%f0 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 0054276c 00000000
!	%l1 = 444a201ff7098ca1, Mem[0000000030081400] = 000000ffe361a5ff
	stxa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 444a201ff7098ca1
!	%l1 = 444a201ff7098ca1, Mem[0000000010041408] = 00000000
	stba	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = a1000000
!	Mem[000000001008141c] = 000005ad, %l5 = 00000000303a0000
	ldstub	[%i2+0x01c],%l5		! %l5 = 00000000000000ff
!	Mem[0000000021800001] = 59ff0c06, %l4 = 00000000000000ff
	ldstuba	[%o3+0x001]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000021800000] = 59ff0c06, %l0 = 00000000000000ff
	ldstub	[%o3+%g0],%l0		! %l0 = 00000059000000ff
!	Mem[00000000100c1408] = ffffffff, %l1 = 444a201ff7098ca1
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 003a0000, %l1 = 00000000ffffffff
	lduba	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000000

p0_label_383:
!	Mem[0000000010081408] = 00000000, %l3 = 00003a30ffa561e3
	ldswa	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = ff0000ff 00ff0000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i2+0x000]%asi,%l2	! %l2 = 00000000ff0000ff 0000000000ff0000
!	Mem[0000000010081420] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i2+0x020]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = 0000ff00ffffffff, %l3 = 0000000000ff0000
	ldxa	[%i5+%o5]0x81,%l3	! %l3 = 0000ff00ffffffff
!	Mem[0000000030081408] = 000000ff, %l3 = 0000ff00ffffffff
	ldswa	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1410] = 00000026, %l2 = 00000000ff0000ff
	lduba	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l1 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l4 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = e361a5ff, %f20 = a5ff0000
	ld	[%i6+%o5],%f20	! %f20 = e361a5ff
!	Starting 10 instruction Store Burst
!	%f8  = e361a5ff 303a0000, %l5 = 0000000000000000
!	Mem[0000000030141418] = 00000000000005ad
	add	%i5,0x018,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_S ! Mem[0000000030141418] = 00000000000005ad

p0_label_384:
!	Mem[0000000030141410] = 00ff0000, %l3 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010101410] = ff00ff0000000021, %asi = 80
	stxa	%l1,[%i4+0x010]%asi	! Mem[0000000010101410] = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010181400] = 00000000
	stwa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%f2  = 00000000 00000000, %l6 = 0000000000000000
!	Mem[0000000030081410] = 00000000ffff9c20
	add	%i2,0x010,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030081410] = 00000000ffff9c20
!	%f0  = 0054276c 00000000 00000000 00000000
!	%f4  = ffff0026 ffff9c20 00000000 00000000
!	%f8  = e361a5ff 303a0000 0054276c 0000ff00
!	%f12 = 00000000 00000000 303a0000 ff000000
	stda	%f0,[%i0]ASI_BLK_P	! Block Store to 0000000010001400
!	%l7 = 00000000000000ff, Mem[0000000010141400] = 0054276c
	stwa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff
!	Mem[0000000010141439] = 6c275400, %l0 = 0000000000000059
	ldstuba	[%i5+0x039]%asi,%l0	! %l0 = 00000027000000ff
!	Mem[0000000030041410] = 00000000, %l7 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%l0 = 0000000000000027, Mem[0000000010141410] = 005427ff
	stba	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00542727
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 444a201ff7098ca1, %f26 = 2808b36b 102d5128
	ldda	[%i2+%g0]0x81,%f26	! %f26 = 444a201f f7098ca1

p0_label_385:
!	Mem[0000000010041410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = 00542727, %l7 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l7	! %l7 = 0000000000002727
!	Mem[0000000030001400] = 000000ff00ff0000, %f18 = 00000000 2600ffff
	ldda	[%i0+%g0]0x89,%f18	! %f18 = 000000ff 00ff0000
!	Mem[0000000010101408] = ff0000ff, %l1 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181434] = 000000f7, %l1 = 00000000000000ff
	ldsw	[%i6+0x034],%l1		! %l1 = 00000000000000f7
	membar	#Sync			! Added by membar checker (60)
!	Mem[0000000010001400] = 0054276c, %l0 = 0000000000000027
	lduba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001010142c] = 2808b36b, %l0 = 0000000000000000
	ldsha	[%i4+0x02c]%asi,%l0	! %l0 = 0000000000002808
!	Mem[00000000201c0000] = ffff367d, %l2 = 0000000000000000
	ldsb	[%o0+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010101410] = 0000000000000000, %f12 = 00000000 00000000
	ldda	[%i4+%o5]0x88,%f12	! %f12 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00003a30, %l6 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l6	! %l6 = 0000000000003a30

p0_label_386:
!	%l0 = 0000000000002808, Mem[000000001018140c] = 6c275400, %asi = 80
	stwa	%l0,[%i6+0x00c]%asi	! Mem[000000001018140c] = 00002808
!	%f4  = ffff0026 ffff9c20, Mem[0000000010041408] = 000000a1 00000000
	stda	%f4 ,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff0026 ffff9c20
!	%l7 = 0000000000002727, Mem[00000000100c1408] = f7098ca1
	stba	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 27098ca1
!	%l4 = 0000000000000000, Mem[0000000010001410] = 2600ffff
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[0000000030101400] = 0000ffff, %l6 = 0000000000003a30
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 000000000000ffff
!	%l0 = 0000000000002808, Mem[00000000100c1404] = 00000000
	sth	%l0,[%i3+0x004]		! Mem[00000000100c1404] = 28080000
!	%l1 = 00000000000000f7, Mem[0000000021800040] = ffffa30e, %asi = 80
	stha	%l1,[%o3+0x040]%asi	! Mem[0000000021800040] = 00f7a30e
!	%f10 = 0054276c 0000ff00, %l5 = 0000000000000000
!	Mem[0000000010101400] = 0000ff00ffffffff
	stda	%f10,[%i4+%l5]ASI_PST16_PL ! Mem[0000000010101400] = 0000ff00ffffffff
!	Mem[0000000010101400] = 00ff0000, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 0000000000ff0000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c141c] = 00ebffe0, %l1 = 00000000000000f7
	lduh	[%i3+0x01e],%l1		! %l1 = 000000000000ffe0

p0_label_387:
!	Mem[00000000300c1410] = 00000000000000ff, %f26 = 444a201f f7098ca1
	ldda	[%i3+%o5]0x89,%f26	! %f26 = 00000000 000000ff
!	Mem[0000000010181410] = e361a5ff, %l6 = 000000000000ffff
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000e3
!	Mem[0000000010041428] = 00000000, %l5 = 0000000000ff0000
	ldub	[%i1+0x028],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 0000000000000000, %f30 = 802db715 0054276c
	ldda	[%i1+0x010]%asi,%f30	! %f30 = 00000000 00000000
!	Mem[0000000030041408] = ffff0000, %l0 = 0000000000002808
	lduha	[%i1+%o4]0x81,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010041410] = 0000000000000000, %f28 = e361a5c0 79e6b3f6
	ldda	[%i1+%o5]0x80,%f28	! %f28 = 00000000 00000000
!	Mem[0000000010101420] = 22b4f36b, %l5 = 0000000000000000
	ldswa	[%i4+0x020]%asi,%l5	! %l5 = 0000000022b4f36b
!	Mem[0000000030101410] = 00003a3000000000, %l5 = 0000000022b4f36b
	ldxa	[%i4+%o5]0x81,%l5	! %l5 = 00003a3000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 444a201f, %l1 = 000000000000ffe0
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 00000044000000ff

p0_label_388:
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010001418] = 00000000 00000000
	stda	%l4,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000000 00000000
!	%l6 = 00000000000000e3, Mem[0000000010041408] = ffff9c20
	stha	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff00e3
!	Mem[00000000201c0000] = ffff367d, %l0 = 000000000000ffff
	lduba	[%o0+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141400] = 00000000, %l6 = 00000000000000e3
	swapa	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%f18 = 000000ff, Mem[0000000030001408] = 00000000
	sta	%f18,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff
!	Mem[000000001018141c] = 000000f7, %l2 = ffffffff, %l1 = 00000044
	add	%i6,0x1c,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 00000000000000f7
!	Mem[00000000218000c0] = 4796bf7c, %l2 = ffffffffffffffff
	ldstuba	[%o3+0x0c0]%asi,%l2	! %l2 = 00000047000000ff
!	Mem[0000000010141400] = 000000ff, %l7 = 0000000000002727
	swapa	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l1 = 00000000000000f7, Mem[0000000030081400] = ff4a201f
	stba	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = f74a201f
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = f6ffe679c0a5ffe3, %f22 = e07aeb14 b4225130
	ldda	[%i5+0x030]%asi,%f22	! %f22 = f6ffe679 c0a5ffe3

p0_label_389:
!	Mem[0000000030141410] = 00ff00ff, %l2 = 0000000000000047
	ldsha	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = ffff00e3, %l2 = 00000000000000ff
	lduba	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000e3
!	Mem[00000000100c1408] = a18c0927, %l4 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000927
!	Mem[0000000010081410] = 625aff7bffffffff, %l6 = 0000000000000000
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = 625aff7bffffffff
!	Mem[00000000100c1400] = ffa561e328080000, %l5 = 00003a3000000000
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = ffa561e328080000
!	Mem[0000000010181414] = 00000000, %l2 = 00000000000000e3
	ldsh	[%i6+0x016],%l2		! %l2 = 0000000000000000
!	Mem[0000000030001410] = a5ff0000, %l1 = 00000000000000f7
	ldsba	[%i0+%o5]0x81,%l1	! %l1 = ffffffffffffffa5
!	Mem[0000000010101400] = 00000000, %l4 = 0000000000000927
	ldswa	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 12af2c2e, %l1 = ffffffffffffffa5
	lduwa	[%i6+%o5]0x89,%l1	! %l1 = 0000000012af2c2e
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000026, %l7 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000026

p0_label_390:
!	Mem[0000000010101419] = 000000ff, %l0 = 00000000000000ff
	ldstub	[%i4+0x019],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030001400] = 00ff0000, %l6 = 625aff7bffffffff
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 0000000000ff0000
!	%f24 = b5211312, Mem[0000000010141400] = 00002727
	sta	%f24,[%i5+0x000]%asi	! Mem[0000000010141400] = b5211312
!	%l1 = 0000000012af2c2e, Mem[00000000300c1408] = 2600ffff
	stba	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 2e00ffff
!	Mem[0000000030041410] = 000000ff, %l7 = 0000000000000026
	swapa	[%i1+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0000] = ffff367d, %l3 = 0000000000000000
	ldstub	[%o0+%g0],%l3		! %l3 = 000000ff000000ff
!	%l1 = 0000000012af2c2e, Mem[00000000100c1408] = 27098ca100000000
	stxa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000012af2c2e
!	%l3 = 00000000000000ff, Mem[0000000030141410] = ff00ff00
	stha	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00ffff00
!	Mem[0000000010101400] = 00000000, %l2 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffffffff, %l3 = 00000000000000ff
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 00000000000000ff

p0_label_391:
!	Mem[0000000010141410] = 00542727, %l4 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000027
!	Mem[0000000030081408] = ff000000, %l0 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010101410] = 00000000, %f22 = f6ffe679
	lda	[%i4+%o5]0x80,%f22	! %f22 = 00000000
!	Mem[0000000030141410] = 00ffff00, %l2 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l2	! %l2 = 0000000000ffff00
!	Mem[0000000010081410] = 625aff7bffffffff, %l7 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l7	! %l7 = 625aff7bffffffff
!	Mem[0000000010141410] = 27275400 00000000, %l0 = ffffff00, %l1 = 12af2c2e
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 0000000027275400 0000000000000000
!	Mem[0000000010081400] = 0000ff00ff0000ff, %f0  = 0054276c 00000000
	ldda	[%i2+%g0]0x88,%f0 	! %f0  = 0000ff00 ff0000ff
!	Code Fragment 3
p0_fragment_16:
!	%l0 = 0000000027275400
	setx	0xce035948262e8d7c,%g7,%l0 ! %l0 = ce035948262e8d7c
!	%l1 = 0000000000000000
	setx	0x6576113029ecb96a,%g7,%l1 ! %l1 = 6576113029ecb96a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ce035948262e8d7c
	setx	0x3654d2e78439c26c,%g7,%l0 ! %l0 = 3654d2e78439c26c
!	%l1 = 6576113029ecb96a
	setx	0xfc4613f7e8b14c34,%g7,%l1 ! %l1 = fc4613f7e8b14c34
!	Mem[0000000010001400] = 000000006c275400, %f4  = ffff0026 ffff9c20
	ldda	[%i0+%g0]0x88,%f4 	! %f4  = 00000000 6c275400
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 00000000, %l7 = 625aff7bffffffff
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000

p0_label_392:
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%f12 = 00000000 00000000, %l0 = 3654d2e78439c26c
!	Mem[0000000030041400] = af00ff00ffffffff
	stda	%f12,[%i1+%l0]ASI_PST16_S ! Mem[0000000030041400] = 00000000ffffffff
!	Mem[0000000021800001] = ffff0c06, %l6 = 0000000000ff0000
	ldstub	[%o3+0x001],%l6		! %l6 = 000000ff000000ff
!	%l4 = 0000000000000027, Mem[00000000300c1400] = ff0000ff
	stba	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff000027
!	%f28 = 00000000 00000000, Mem[0000000010081408] = 00000000 0000003a
	stda	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 00000000
!	Mem[0000000030081400] = 1f204af7, %l5 = ffa561e328080000
	ldswa	[%i2+%g0]0x89,%l5	! %l5 = 000000001f204af7
!	%l3 = 00000000000000ff, Mem[0000000030041408] = ffff0000
	stwa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff
!	%f3  = 00000000, Mem[00000000300c1400] = ff000027
	sta	%f3 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Mem[0000000030041400] = 00000000, %l5 = 000000001f204af7
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000

p0_label_393:
!	Mem[00000000211c0000] = 00ff0b46, %l2 = 0000000000ffff00
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081434] = 00005130, %f26 = 00000000
	ld	[%i2+0x034],%f26	! %f26 = 00005130
!	Mem[0000000010141400] = 121321b5, %l2 = 00000000000000ff
	ldsba	[%i5+%g0]0x88,%l2	! %l2 = ffffffffffffffb5
!	Mem[0000000010181408] = ffffffff, %f15 = ff000000
	lda	[%i6+%o4]0x80,%f15	! %f15 = ffffffff
!	Mem[0000000030041408] = 000000ff, %l3 = 00000000000000ff
	lduba	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l2 = ffffffffffffffb5
	lduwa	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l1 = fc4613f7e8b14c34
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = ffff367d, %l6 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010141408] = 00000000 00000000, %l6 = 0000ffff, %l7 = 00000000
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = b5211312 44e2925c, %l3 = 0000000000000000
!	Mem[0000000030001400] = ffffffffff000000
	stda	%f24,[%i0+%l3]ASI_PST16_SL ! Mem[0000000030001400] = ffffffffff000000

p0_label_394:
!	Mem[0000000030041410] = 00000026, %l7 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l7	! %l7 = 00000026000000ff
!	%f22 = 00000000 c0a5ffe3, Mem[0000000010101410] = 00000000 00000000
	stda	%f22,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 c0a5ffe3
!	%f25 = 44e2925c, Mem[0000000010181410] = e361a5ff
	sta	%f25,[%i6+%o5]0x80	! Mem[0000000010181410] = 44e2925c
!	%f8  = e361a5ff 303a0000, Mem[00000000100c1410] = ff000000 000000ff
	stda	%f8 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = e361a5ff 303a0000
!	Mem[0000000030101400] = 303a0000, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 00000000303a0000
!	%l1 = 0000000000000000, Mem[000000001014143e] = 15b72d80, %asi = 80
	stha	%l1,[%i5+0x03e]%asi	! Mem[000000001014143c] = 15b70000
!	%l5 = 00000000303a0000, Mem[0000000030141408] = 00000000
	stwa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 303a0000
!	%f26 = 00005130 000000ff, %l4 = 0000000000000027
!	Mem[0000000030001408] = 000000ff2600ffff
	add	%i0,0x008,%g1
	stda	%f26,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030001408] = ff0000ff2651ffff
!	%f14 = 303a0000 ffffffff, %l3 = 0000000000000000
!	Mem[0000000010141420] = 5c92e244121321b5
	add	%i5,0x020,%g1
	stda	%f14,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010141420] = 5c92e244121321b5
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 802db715ff000000, %f10 = 0054276c 0000ff00
	ldda	[%i1+%o4]0x89,%f10	! %f10 = 802db715 ff000000

p0_label_395:
!	Mem[0000000030101410] = 00003a3000000000, %l5 = 00000000303a0000
	ldxa	[%i4+%o5]0x81,%l5	! %l5 = 00003a3000000000
!	Mem[0000000010081410] = ffffffff, %l5 = 00003a3000000000
	ldsha	[%i2+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001410] = 00000000ffff9c20, %f14 = 303a0000 ffffffff
	ldda	[%i0+0x010]%asi,%f14	! %f14 = 00000000 ffff9c20
!	Mem[0000000010041408] = e300ffff 2600ffff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 00000000e300ffff 000000002600ffff
!	Mem[00000000300c1410] = 00000000000000ff, %f4  = 00000000 6c275400
	ldda	[%i3+%o5]0x89,%f4 	! %f4  = 00000000 000000ff
!	Mem[00000000300c1410] = 00000000000000ff, %f24 = b5211312 44e2925c
	ldda	[%i3+%o5]0x89,%f24	! %f24 = 00000000 000000ff
!	Mem[0000000030141400] = e3000000, %l2 = 00000000e300ffff
	ldsha	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l3 = 000000002600ffff
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 303a0000, %l6 = 0000000000000000
	lduha	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800100] = 00ff6996, %l6 = 0000000000000000
	ldstuba	[%o3+0x100]%asi,%l6	! %l6 = 00000000000000ff

p0_label_396:
!	%l0 = 3654d2e78439c26c, Mem[0000000030081410] = 00000000
	stha	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000c26c
!	%l2 = 0000000000000000, Mem[0000000030081400] = f74a201f
	stwa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l7 = 0000000000000026, Mem[0000000021800180] = ffff35e9, %asi = 80
	stha	%l7,[%o3+0x180]%asi	! Mem[0000000021800180] = 002635e9
!	%f6  = 00000000 00000000, %l0 = 3654d2e78439c26c
!	Mem[0000000030041408] = 000000ff15b72d80
	add	%i1,0x008,%g1
	stda	%f6,[%g1+%l0]ASI_PST32_S ! Mem[0000000030041408] = 000000ff15b72d80
!	%f20 = e361a5ff 14eb7ae0, Mem[0000000030041410] = 000000ff 97000000
	stda	%f20,[%i1+%o5]0x89	! Mem[0000000030041410] = e361a5ff 14eb7ae0
!	Mem[000000001010141c] = ffff0026, %l2 = 0000000000000000
	ldstuba	[%i4+0x01c]%asi,%l2	! %l2 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000010041408] = ffff00e3
	stba	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff0000
!	%l1 = 0000000000000000, Mem[00000000300c1408] = ffff002e
	stba	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffff0000
!	Mem[00000000211c0001] = 00ff0b46, %l5 = ffffffffffffffff
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00003a30 ffa561e3, %l4 = 00000027, %l5 = 000000ff
	ldd	[%i3+%o5],%l4		! %l4 = 0000000000003a30 00000000ffa561e3

p0_label_397:
!	Mem[0000000010001410] = 00000000, %l7 = 0000000000000026
	lduha	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	%f12 = 00000000 00000000, Mem[0000000030041410] = e07aeb14 ffa561e3
	stda	%f12,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 00000000
!	Mem[0000000010041408] = 0000ffff2600ffff, %f18 = 000000ff 00ff0000
	ldda	[%i1+%o4]0x80,%f18	! %f18 = 0000ffff 2600ffff
!	Mem[0000000030001400] = 000000ffffffffff, %f0  = 0000ff00 ff0000ff
	ldda	[%i0+%g0]0x89,%f0 	! %f0  = 000000ff ffffffff
!	Mem[0000000030181400] = 303a0000, %l0 = 3654d2e78439c26c
	lduba	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = ffffffff, %l4 = 0000000000003a30
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030101410] = 00003a30, %l4 = 000000000000ffff
	ldswa	[%i4+%o5]0x81,%l4	! %l4 = 0000000000003a30
!	Mem[0000000010041400] = 000000ff00000000, %f16 = 0000ff00 ff000000
	ldda	[%i1+%g0]0x88,%f16	! %f16 = 000000ff 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = a5ff0000, %l0 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 00000000a5ff0000

p0_label_398:
!	%l6 = 0000000000000000, Mem[0000000010041400] = 00000000
	stwa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Mem[0000000010181408] = ffffffff, %l0 = 00000000a5ff0000
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 00000000ffffffff
!	Mem[000000001014142c] = 000000f7, %l0 = 00000000ffffffff
	swap	[%i5+0x02c],%l0		! %l0 = 00000000000000f7
!	Mem[0000000030081400] = 00000000, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010001410] = 00000000ffff9c20
	stxa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	%l4 = 0000000000003a30, Mem[00000000100c1400] = 00000828e361a5ff
	stxa	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000003a30
!	%f18 = 0000ffff, Mem[00000000100c1410] = 00003a30
	st	%f18,[%i3+%o5]		! Mem[00000000100c1410] = 0000ffff
!	%f2  = 00000000 00000000, Mem[0000000010041410] = 00000000 00000000
	stda	%f2 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 00000000
!	Mem[0000000010181400] = 0000000000000000, %f24 = 00000000 000000ff
	ldda	[%i6+%g0]0x88,%f24	! %f24 = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffff0000, %l0 = 00000000000000f7
	ldsba	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000000

p0_label_399:
!	Mem[0000000010041410] = 00000000, %l2 = 00000000000000ff
	lduh	[%i1+%o5],%l2		! %l2 = 0000000000000000
!	Mem[0000000030141410] = 00ffff00, %l1 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = ffffffffffffff00
!	Mem[000000001000143c] = ff000000, %f23 = c0a5ffe3
	ld	[%i0+0x03c],%f23	! %f23 = ff000000
!	Mem[00000000300c1410] = 000000ff, %l4 = 0000000000003a30
	ldsha	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101410] = 00003a3000000000, %f24 = 00000000 00000000
	ldda	[%i4+%o5]0x81,%f24	! %f24 = 00003a30 00000000
!	Mem[0000000010141400] = b521131200000000, %l3 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l3	! %l3 = b521131200000000
!	%l6 = 0000000000000000, Mem[0000000010181424] = 12ff21b5
	stw	%l6,[%i6+0x024]		! Mem[0000000010181424] = 00000000
!	Mem[00000000100c1400] = 00003a30, %f18 = 0000ffff
	lda	[%i3+%g0]0x88,%f18	! %f18 = 00003a30
!	Mem[0000000030101408] = 003a0000e361a5ff, %f16 = 000000ff 00000000
	ldda	[%i4+%o4]0x81,%f16	! %f16 = 003a0000 e361a5ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ffa561e3, Mem[0000000010001408] = 00000000
	stba	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000e3

p0_label_400:
!	Mem[0000000010101400] = 00000000, %l7 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030101400] = 00000000
	stwa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%f24 = 00003a30, Mem[00000000100c142c] = 0000ff00
	st	%f24,[%i3+0x02c]	! Mem[00000000100c142c] = 00003a30
!	Mem[0000000021800180] = 002635e9, %l3 = b521131200000000
	ldstub	[%o3+0x180],%l3		! %l3 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[00000000300c1400] = 000000ff00000000
	stxa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	%l4 = 00000000000000ff, Mem[00000000300c1410] = ff00000000000000
	stxa	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030141410] = ffffffff00ffff00
	stxa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i2+0x008]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001434] = 00000000, %l7 = 0000000000000000
	ldsw	[%i0+0x034],%l7		! %l7 = 0000000000000000

p0_label_401:
!	Mem[00000000100c1420] = ffffffff 00ff00af, %l2 = 00000000, %l3 = 00000000
	ldd	[%i3+0x020],%l2		! %l2 = 00000000ffffffff 0000000000ff00af
!	Mem[0000000030141408] = 303a0000, %l1 = ffffffffffffff00
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = 00000000303a0000
!	Mem[0000000030001410] = e07aeb1400000000, %f26 = 00005130 000000ff
	ldda	[%i0+%o5]0x89,%f26	! %f26 = e07aeb14 00000000
!	Mem[0000000021800040] = 00f7a30e, %l6 = 0000000000000000
	ldsba	[%o3+0x040]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = 00ff0b46, %l7 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181408] = 0000ffa5, %l1 = 00000000303a0000
	lduba	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000a5
!	Mem[0000000030141400] = 000000e3, %f15 = ffff9c20
	lda	[%i5+%g0]0x81,%f15	! %f15 = 000000e3
!	Mem[0000000030141410] = 00000000, %f30 = 00000000
	lda	[%i5+%o5]0x89,%f30	! %f30 = 00000000
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000ff00af
	lduha	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = a5ff0000, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 000000a5000000ff

p0_label_402:
!	%l2 = 00000000ffffffff, Mem[0000000010101400] = 00000000
	stba	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000
!	Mem[0000000010181408] = 0000ffff, %l4 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%l5 = 00000000ffa561e3, Mem[000000001018143c] = 15b72d80, %asi = 80
	stwa	%l5,[%i6+0x03c]%asi	! Mem[000000001018143c] = ffa561e3
!	%l4 = 00000000000000ff, Mem[0000000020800000] = ffff188e
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = 00ff188e
!	%l4 = 00000000000000ff, Mem[0000000030141400] = e3000000
	stba	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = e30000ff
!	Mem[0000000010081408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%f25 = 00000000, Mem[00000000100c1400] = 00003a30
	sta	%f25,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%f23 = ff000000, Mem[0000000030081410] = 0000c26c
	sta	%f23,[%i2+%o5]0x89	! Mem[0000000030081410] = ff000000
!	%l1 = 00000000000000a5, Mem[0000000010101408] = ff0000ff
	stwa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000a5
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 0000000000000000
	setx	0xc7579bf842b1f31e,%g7,%l0 ! %l0 = c7579bf842b1f31e
!	%l1 = 00000000000000a5
	setx	0xf5657840716c4abb,%g7,%l1 ! %l1 = f5657840716c4abb
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c7579bf842b1f31e
	setx	0x4791c9e7f337fed7,%g7,%l0 ! %l0 = 4791c9e7f337fed7
!	%l1 = f5657840716c4abb
	setx	0x8b43753f95c47ef5,%g7,%l1 ! %l1 = 8b43753f95c47ef5

p0_label_403:
!	Mem[0000000030001400] = ffffffffff000000, %l1 = 8b43753f95c47ef5
	ldxa	[%i0+%g0]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010081408] = ff000000, %l4 = 00000000000000ff
	lduwa	[%i2+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030041408] = 000000ff, %f22 = 00000000
	lda	[%i1+%o4]0x81,%f22	! %f22 = 000000ff
!	Mem[00000000100c1410] = e361a5ffffff0000, %l6 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l6	! %l6 = e361a5ffffff0000
!	Mem[0000000030101408] = 003a0000, %l6 = e361a5ffffff0000
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = 000000000000003a
!	Mem[0000000010181438] = 6c275400ffa561e3, %f26 = e07aeb14 00000000
	ldd	[%i6+0x038],%f26	! %f26 = 6c275400 ffa561e3
!	Mem[00000000100c1400] = 00000000, %f26 = 6c275400
	lda	[%i3+%g0]0x88,%f26	! %f26 = 00000000
!	Mem[000000001014142c] = ffffffff, %l3 = 00000000000000a5
	lduba	[%i5+0x02e]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101410] = 00000000 303a0000, %l6 = 0000003a, %l7 = 000000ff
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 00000000303a0000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ffffffff, Mem[00000000300c1400] = 00000000
	stba	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff

p0_label_404:
!	Mem[0000000030141400] = e30000ff, %f21 = 14eb7ae0
	lda	[%i5+%g0]0x89,%f21	! %f21 = e30000ff
!	Mem[0000000010141410] = 27275400, %l0 = 4791c9e7f337fed7
	ldstuba	[%i5+%o5]0x80,%l0	! %l0 = 00000027000000ff
!	Mem[0000000020800000] = 00ff188e, %l5 = 00000000ffa561e3
	ldstub	[%o1+%g0],%l5		! %l5 = 00000000000000ff
!	%f21 = e30000ff, Mem[0000000010101420] = 22b4f36b
	st	%f21,[%i4+0x020]	! Mem[0000000010101420] = e30000ff
!	Mem[0000000010181410] = 5c92e244, %l2 = 00000000ffffffff
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 000000005c92e244
!	Mem[00000000300c1408] = 0000ffff, %l3 = 00000000000000ff
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030141400] = ff0000e3, %l1 = ffffffffff000000
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%l6 = 00000000303a0000, Mem[00000000100c1430] = 000000ff00000027, %asi = 80
	stxa	%l6,[%i3+0x030]%asi	! Mem[00000000100c1430] = 00000000303a0000
!	%l4 = 00000000ff000000, Mem[00000000300c1400] = ff000000
	stha	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[000000001018141c] = 000000f7, %l4 = 00000000ff000000
	lduh	[%i6+0x01e],%l4		! %l4 = 00000000000000f7

p0_label_405:
!	Mem[0000000010181400] = 00000000, %l4 = 00000000000000f7
	lduba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = 0000000000000000, %f18 = 00003a30 2600ffff
	ldda	[%i5+%o4]0x88,%f18	! %f18 = 00000000 00000000
!	Mem[0000000010101400] = ff000000ffffffff, %l4 = 0000000000000000
	ldxa	[%i4+0x000]%asi,%l4	! %l4 = ff000000ffffffff
!	Mem[0000000010081400] = ff0000ff, %f6  = 00000000
	lda	[%i2+%g0]0x88,%f6 	! %f6 = ff0000ff
!	Mem[0000000020800040] = ffff9e9b, %l0 = 0000000000000027
	ldsb	[%o1+0x041],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030101410] = 303a0000, %f2  = 00000000
	lda	[%i4+%o5]0x89,%f2 	! %f2 = 303a0000
!	Mem[0000000030001400] = ffffffffff000000, %l7 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010081400] = 0000ff00 ff0000ff, %l2 = 5c92e244, %l3 = 0000ffff
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000ff0000ff 000000000000ff00
!	Mem[0000000021800100] = ffff6996, %l0 = ffffffffffffffff
	ldsba	[%o3+0x100]%asi,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f12 = 00000000 00000000, Mem[0000000030041400] = 000000ff ffffffff
	stda	%f12,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 00000000

p0_label_406:
!	%l2 = 00000000ff0000ff, Mem[0000000010101408] = 000000a5
	stha	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00ff00a5
!	Mem[0000000010081400] = ff0000ff, %l5 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010101410] = 00000000, %l6 = 00000000303a0000
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = ff000000, %l4 = ff000000ffffffff
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 00000000ff000000
!	%l0 = ffffffff, %l1 = 000000ff, Mem[0000000010081400] = ff0000ff 00ff0000
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff 000000ff
!	%l2 = 00000000ff0000ff, Mem[0000000010001410] = 00000000
	stha	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 00ff0000
!	%f0  = 000000ff ffffffff, %l3 = 000000000000ff00
!	Mem[0000000010041428] = 0000000000000000
	add	%i1,0x028,%g1
	stda	%f0,[%g1+%l3]ASI_PST16_P ! Mem[0000000010041428] = 0000000000000000
!	Mem[0000000010041408] = 0000ffff, %l7 = ffffffffff000000
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010141408] = 00000000, %l0 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l7 = 000000000000ffff
	lduwa	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_407:
!	Mem[0000000010081400] = ffffffff 000000ff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 00000000ffffffff 00000000000000ff
!	Mem[0000000010141438] = 6cff5400, %l6 = 0000000000000000
	ldsha	[%i5+0x038]%asi,%l6	! %l6 = 0000000000006cff
!	Mem[00000000300c1400] = 00000000, %l1 = 00000000000000ff
	lduha	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l1 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = 00ff00a5, %l5 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081430] = e07aeb14 00005130, %l6 = 00006cff, %l7 = 00000000
	ldd	[%i2+0x030],%l6		! %l6 = 00000000e07aeb14 0000000000005130
!	Mem[0000000020800040] = ffff9e9b, %l0 = 00000000ffffffff
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010141404] = 00000000, %l4 = 00000000ff000000
	ldsba	[%i5+0x005]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101418] = 00ff00ff, %l0 = 000000000000ffff
	ldsw	[%i4+0x018],%l0		! %l0 = 0000000000ff00ff
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000ff00, Mem[0000000030141408] = 00003a30
	stba	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 00003a30

p0_label_408:
!	Mem[0000000010081408] = 000000ff, %l0 = 0000000000ff00ff
	ldsba	[%i2+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	%f8  = e361a5ff 303a0000, %l1 = 0000000000000000
!	Mem[0000000030041400] = 0000000000000000
	stda	%f8,[%i1+%l1]ASI_PST32_SL ! Mem[0000000030041400] = 0000000000000000
!	%f0  = 000000ff ffffffff 303a0000 00000000
!	%f4  = 00000000 000000ff ff0000ff 00000000
!	%f8  = e361a5ff 303a0000 802db715 ff000000
!	%f12 = 00000000 00000000 00000000 000000e3
	stda	%f0,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	%f28 = 00000000 00000000, Mem[00000000100c1408] = ff000000 12af2c2e
	stda	%f28,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000 00000000
!	%l2 = 00000000ff0000ff, Mem[00000000100c1408] = 0000000000000000
	stxa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000ff0000ff
!	%f16 = 003a0000 e361a5ff 00000000 00000000
!	%f20 = e361a5ff e30000ff 000000ff ff000000
!	%f24 = 00003a30 00000000 00000000 ffa561e3
!	%f28 = 00000000 00000000 00000000 00000000
	stda	%f16,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	%l1 = 0000000000000000, Mem[0000000030001400] = ffffffff
	stwa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	Mem[0000000030081408] = ff000000, %l0 = ffffffffffffffff
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	%f9  = 303a0000, Mem[0000000010081408] = ff000000
	sta	%f9 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 303a0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffa561e3 00003a00, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 0000000000003a00 00000000ffa561e3

p0_label_409:
!	Mem[0000000010081428] = 0054276c, %l0 = 00000000ff000000
	lduba	[%i2+0x02b]%asi,%l0	! %l0 = 000000000000006c
!	Mem[0000000030001400] = 00000000, %l6 = 00000000e07aeb14
	lduha	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (61)
!	Mem[0000000010041400] = 00000000, %f4  = 00000000
	lda	[%i1+%g0]0x88,%f4 	! %f4 = 00000000
!	Mem[0000000010001410] = 0000ff00, %l5 = 00000000ffa561e3
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 000000000000ff00
!	%f8  = e361a5ff, %f2  = 303a0000
	fitos	%f8 ,%f2 		! %f2  = cde4f2d0
!	Mem[0000000010101414] = c0a5ffe3, %l0 = 000000000000006c
	lduh	[%i4+0x014],%l0		! %l0 = 000000000000c0a5
!	Mem[0000000010081400] = ffffffff, %l7 = 0000000000005130
	ldsba	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101410] = 00003a30 00000000, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i4+%o5]0x81,%l6	! %l6 = 0000000000003a30 0000000000000000
!	Mem[0000000030181400] = 303a0000, %l5 = 000000000000ff00
	lduwa	[%i6+%g0]0x89,%l5	! %l5 = 00000000303a0000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stba	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000

p0_label_410:
!	Mem[0000000010081418] = 00000000ff0005ad, %l4 = 0000000000003a00, %l4 = 0000000000003a00
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l4,%l4	! %l4 = 00000000ff0005ad
!	%f24 = 00003a30 00000000, %l1 = 0000000000000000
!	Mem[0000000030141420] = 2808b36b00000000
	add	%i5,0x020,%g1
	stda	%f24,[%g1+%l1]ASI_PST16_S ! Mem[0000000030141420] = 2808b36b00000000
!	%l3 = 000000000000ff00, Mem[00000000300c1400] = 000000ff
	stha	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff0000ff
!	Mem[0000000030081410] = 000000ff, %l6 = 0000000000003a30
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l4 = ff0005ad, %l5 = 303a0000, Mem[0000000030141408] = 303a0000 e361a5ff
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = ff0005ad 303a0000
!	Mem[0000000030181400] = 00003a30, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 0000000000003a30
!	%f18 = 00000000 00000000, Mem[0000000010001410] = 0000ff00 00000000
	stda	%f18,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 00000000
!	%l2 = 00000000ff0000ff, Mem[00000000201c0001] = ffff367d
	stb	%l2,[%o0+0x001]		! Mem[00000000201c0000] = ffff367d
!	Mem[00000000300c1400] = ff0000ff, %l5 = 00000000303a0000
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 005427ff, %l7 = 0000000000003a30
	ldsha	[%i5+%o5]0x88,%l7	! %l7 = 00000000000027ff

p0_label_411:
!	Mem[0000000030181400] = 00000000, %l0 = 000000000000c0a5
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 0000000012af2c2e, %l1 = 0000000000000000
	ldxa	[%i6+%o5]0x89,%l1	! %l1 = 0000000012af2c2e
!	Mem[0000000010101410] = e3ffa5c0000000ff, %f24 = 00003a30 00000000
	ldda	[%i4+%o5]0x88,%f24	! %f24 = e3ffa5c0 000000ff
!	Mem[0000000030141408] = ad0500ff, %f25 = 000000ff
	lda	[%i5+%o4]0x81,%f25	! %f25 = ad0500ff
!	Mem[0000000030081410] = 209cffff 303a0000, %l6 = 000000ff, %l7 = 000027ff
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 00000000303a0000 00000000209cffff
!	Mem[00000000100c1400] = 00000000, %l2 = 00000000ff0000ff
	ldub	[%i3+0x003],%l2		! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (62)
!	Mem[0000000030081400] = 00000000 f7098ca1 ffffffff 00000000
!	Mem[0000000030081410] = 00003a30 ffff9c20 00000000 00000000
!	Mem[0000000030081420] = 000000ff 00ff0000 0054276c 6bb30828
!	Mem[0000000030081430] = 00000000 e361a5ff 00000026 ff000000
	ldda	[%i2]ASI_BLK_AIUS,%f0	! Block Load from 0000000030081400
!	Mem[0000000010081410] = 625aff7b ffffffff, %l2 = 00000000, %l3 = 0000ff00
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000ffffffff 00000000625aff7b
!	Mem[0000000010141408] = ff000000, %l1 = 0000000012af2c2e
	lduha	[%i5+%o4]0x80,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 0000ffff, %l5 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 000000000000ffff

p0_label_412:
!	%l0 = 0000000000000000, Mem[0000000020800000] = ffff188e
	sth	%l0,[%o1+%g0]		! Mem[0000000020800000] = 0000188e
	membar	#Sync			! Added by membar checker (63)
!	%l6 = 303a0000, %l7 = 209cffff, Mem[0000000030081408] = ffffffff 00000000
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 303a0000 209cffff
!	%l7 = 00000000209cffff, Mem[0000000010101408] = a500ff00
	stha	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = a500ffff
!	%f8  = 000000ff 00ff0000, Mem[0000000010181408] = 0000ffff 08280000
	stda	%f8 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff 00ff0000
!	Mem[0000000030041410] = ff0000e3, %l4 = 00000000ff0005ad
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000021800101] = ffff6996, %l7 = 00000000209cffff
	ldstub	[%o3+0x101],%l7		! %l7 = 000000ff000000ff
!	Mem[0000000010101410] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l1 = 000000000000ff00
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%f16 = 003a0000 e361a5ff 00000000 00000000
!	%f20 = e361a5ff e30000ff 000000ff ff000000
!	%f24 = e3ffa5c0 ad0500ff 00000000 ffa561e3
!	%f28 = 00000000 00000000 00000000 00000000
	stda	%f16,[%i5]ASI_BLK_AIUPL	! Block Store to 0000000010141400
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 303a0000, %l4 = 00000000000000ff
	lduha	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000

p0_label_413:
!	Mem[0000000030081408] = 303a0000, %l6 = 00000000303a0000
	ldsha	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = ff0000ff, %l7 = 00000000000000ff
	ldswa	[%i0+%o4]0x89,%l7	! %l7 = ffffffffff0000ff
!	Mem[0000000010181410] = ffffffff, %l2 = 00000000ffffffff
	lduwa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010041408] = ffff0026 000000ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff 00000000ffff0026
!	Mem[0000000030081400] = 00ff0000, %l1 = 00000000ffff0026
	ldsba	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l7 = ffffffffff0000ff
	ldsba	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 303a0000, %l1 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l1	! %l1 = 000000000000303a
!	Mem[0000000030041408] = 00000000, %l7 = 0000000000000000
	ldsba	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %f2  = ffffffff
	lda	[%i1+%o4]0x81,%f2 	! %f2 = 00000000
!	Starting 10 instruction Store Burst
!	%f12 = 00000000 e361a5ff, Mem[0000000030081408] = 00003a30 ffff9c20
	stda	%f12,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 e361a5ff

p0_label_414:
!	Mem[0000000010101418] = 00ff00ff, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x018]%asi,%l0	! %l0 = 0000000000ff00ff
!	%l5 = 000000000000ffff, Mem[00000000300c1410] = 00000000000000ff
	stxa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000000000ffff
!	Mem[0000000030101400] = 00000000, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l1 = 000000000000303a, Mem[0000000010041400] = 000000ff00000000
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000000303a
!	Mem[00000000211c0000] = 00ff0b46, %l1 = 000000000000303a
	ldstub	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030081400] = 0000ff00f7098ca1
	stxa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000000000000
!	Mem[0000000030141400] = e30000ff, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000201c0000] = ffff367d, %l1 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[000000001010140c] = 5c2438bb, %l4 = 00000000, %l4 = 00000000
	add	%i4,0x0c,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 000000005c2438bb
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = e361a5ff, %l1 = 00000000000000ff
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff

p0_label_415:
!	Mem[0000000030001408] = ff0000ff 2651ffff, %l2 = ffffffff, %l3 = 625aff7b
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 00000000ff0000ff 000000002651ffff
!	Mem[0000000010081410] = ffffffff, %l2 = 00000000ff0000ff
	lduha	[%i2+0x010]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010041400] = 0000303a, %l1 = 00000000000000ff
	lduba	[%i1+%g0]0x88,%l1	! %l1 = 000000000000003a
!	Mem[0000000030181400] = 0000000000000000, %l3 = 000000002651ffff
	ldxa	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l6 = 0000000000000000
	ldsha	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l4 = 000000005c2438bb
	lduwa	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (64)
!	Mem[0000000010141414] = ffa561e3, %l3 = 0000000000000000
	lduh	[%i5+0x014],%l3		! %l3 = 000000000000ffa5
!	Mem[00000000100c1418] = 625a63ff, %l7 = 00000000000000ff
	lduw	[%i3+0x018],%l7		! %l7 = 00000000625a63ff
!	Mem[0000000010041400] = 0000303a, %l2 = 000000000000ffff
	ldsba	[%i1+%g0]0x88,%l2	! %l2 = 000000000000003a
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000003a, Mem[00000000300c1408] = 303a0000
	stha	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 003a0000

p0_label_416:
!	%f0  = 00000000 f7098ca1, Mem[00000000100c1408] = 00000000 ff0000ff
	stda	%f0 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 f7098ca1
!	Mem[0000000030041410] = e30000ff, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%f26 = 00000000 ffa561e3, Mem[0000000010001400] = 0054276c 00000000
	stda	%f26,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 ffa561e3
!	Mem[000000001004141e] = 00003aff, %l5 = 000000000000ffff
	ldstub	[%i1+0x01e],%l5		! %l5 = 0000003a000000ff
!	%f14 = 00000026 ff000000, Mem[0000000030001410] = 00000000 14eb7ae0
	stda	%f14,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000026 ff000000
!	%l7 = 00000000625a63ff, Mem[0000000010101410] = 000000ff
	stba	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	%l4 = 000000ff, %l5 = 0000003a, Mem[0000000030041410] = ff0000e3 ffa561e3
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff 0000003a
!	%l0 = 00ff00ff, %l1 = 0000003a, Mem[0000000010141410] = e30000ff e361a5ff
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00ff00ff 0000003a
!	%l5 = 000000000000003a, Mem[0000000020800040] = ffff9e9b, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = 003a9e9b
!	Starting 10 instruction Load Burst
!	Mem[000000001000140c] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i0+0x00c]%asi,%l4	! %l4 = 0000000000000000

p0_label_417:
!	Mem[00000000100c1410] = ff000000, %f4  = 00003a30
	lda	[%i3+%o5]0x88,%f4 	! %f4 = ff000000
!	Mem[00000000300c1400] = ff0000ff, %f10 = 0054276c
	lda	[%i3+%g0]0x81,%f10	! %f10 = ff0000ff
!	Mem[0000000010181408] = 00ff0000, %l2 = 000000000000003a
	ldsha	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = b5000000, %l4 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l4	! %l4 = ffffffffffffb500
!	Mem[0000000010001410] = 0000000000000000, %f8  = 000000ff 00ff0000
	ldda	[%i0+%o5]0x88,%f8 	! %f8  = 00000000 00000000
!	Mem[00000000100c1410] = 000000ff, %f21 = e30000ff
	lda	[%i3+%o5]0x80,%f21	! %f21 = 000000ff
!	Mem[00000000100c1430] = 00000000, %l1 = 000000000000003a
	lduw	[%i3+0x030],%l1		! %l1 = 0000000000000000
!	Mem[0000000030101410] = 00003a30, %l6 = 0000000000000000
	ldsha	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = ffff000000000000, %f28 = 00000000 00000000
	ldda	[%i3+%o5]0x89,%f28	! %f28 = ffff0000 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ffff367d, %l5 = 000000000000003a
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 000000ff000000ff

p0_label_418:
!	%f28 = ffff0000 00000000, Mem[0000000010081428] = 0054276c 00ff0828
	stda	%f28,[%i2+0x028]%asi	! Mem[0000000010081428] = ffff0000 00000000
!	Mem[0000000030081410] = 303a0000, %l0 = 0000000000ff00ff
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1410] = ff000000, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010001410] = 00000000, %l4 = ffffffffffffb500
	ldstuba	[%i0+0x010]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Code Fragment 4
p0_fragment_18:
!	%l0 = 0000000000000000
	setx	0x017110e078162113,%g7,%l0 ! %l0 = 017110e078162113
!	%l1 = 00000000ff000000
	setx	0x041d1cd7904f0ca3,%g7,%l1 ! %l1 = 041d1cd7904f0ca3
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 017110e078162113
	setx	0xc77f81086fed8f64,%g7,%l0 ! %l0 = c77f81086fed8f64
!	%l1 = 041d1cd7904f0ca3
	setx	0x8507db27ab817a9c,%g7,%l1 ! %l1 = 8507db27ab817a9c
!	Mem[0000000010181408] = 0000ff00, %l1 = 8507db27ab817a9c
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l7 = 00000000625a63ff, Mem[0000000030181408] = 00000000000000b5
	stxa	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000625a63ff
!	%f22 = 000000ff ff000000, %l0 = c77f81086fed8f64
!	Mem[0000000010081438] = 00000000ffffff20
	add	%i2,0x038,%g1
	stda	%f22,[%g1+%l0]ASI_PST16_P ! Mem[0000000010081438] = 000000ffffffff20
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = a18c09f700000000, %l6 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l6	! %l6 = a18c09f700000000

p0_label_419:
!	Mem[00000000300c1400] = ffffffffff0000ff, %f18 = 00000000 00000000
	ldda	[%i3+%g0]0x89,%f18	! %f18 = ffffffff ff0000ff
!	Mem[0000000030001400] = 00000000, %l0 = c77f81086fed8f64
	lduha	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = ff0000002600ffff, %f2  = 00000000 00000000
	ldda	[%i1+%o4]0x80,%f2 	! %f2  = ff000000 2600ffff
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = ffffffff, %l1 = 0000000000000000
	lduwa	[%i4+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[00000000100c1408] = f7098ca1, %l1 = 00000000ffffffff
	lduha	[%i3+%o4]0x88,%l1	! %l1 = 0000000000008ca1
!	Mem[000000001010141c] = ffff0026, %l0 = 0000000000000000
	ldsha	[%i4+0x01c]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141408] = 00000000 00000000, %l2 = 00000000, %l3 = 0000ffa5
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010141410] = ff00ff00, %l1 = 0000000000008ca1
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = ffffffffff00ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00000000, %l6 = a18c09f700000000
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_420:
!	%l1 = ffffffffff00ff00, Mem[0000000030041408] = 00000000
	stba	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	Mem[0000000010081408] = 00003a30, %l7 = 00000000625a63ff
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 00000030000000ff
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000030101408] = 003a0000
	stwa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	%l5 = 00000000000000ff, imm = fffffffffffff47a, %l2 = 0000000000000000
	add	%l5,-0xb86,%l2		! %l2 = fffffffffffff579
!	Mem[0000000030181410] = 12af2c2e, %l2 = fffffffffffff579
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 0000002e000000ff
!	Mem[0000000010081410] = ffffffff, %l1 = ffffffffff00ff00
	ldstuba	[%i2+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010181418] = 00000000, %l2 = 000000000000002e
	swap	[%i6+0x018],%l2		! %l2 = 0000000000000000
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010141408] = 00000000 00000000
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 303a0000ff0005ad, %l1 = 00000000000000ff
	ldxa	[%i5+%o4]0x89,%l1	! %l1 = 303a0000ff0005ad

p0_label_421:
!	Mem[0000000010141400] = ffa561e300003a00, %l6 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l6	! %l6 = ffa561e300003a00
!	Mem[00000000300c1410] = 00000000, %l6 = ffa561e300003a00
	ldsha	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 3a000000ff000000, %f16 = 003a0000 e361a5ff
	ldda	[%i1+%o5]0x89,%f16	! %f16 = 3a000000 ff000000
!	Mem[00000000100c1410] = 00000000, %l1 = 303a0000ff0005ad
	lduba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = ff3a000000000000, %f16 = 3a000000 ff000000
	ldda	[%i2+%o4]0x80,%f16	! %f16 = ff3a0000 00000000
!	Mem[0000000010041410] = 0000000000000000, %f26 = 00000000 ffa561e3
	ldda	[%i1+%o5]0x80,%f26	! %f26 = 00000000 00000000
!	Mem[000000001000141c] = 00000000, %l2 = 0000000000000000
	lduw	[%i0+0x01c],%l2		! %l2 = 0000000000000000
!	Mem[0000000010141408] = 000000ff 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000030141400] = ff0000e3, %l1 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[000000001004141c] = 0000ffff, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i1+0x01c]%asi,%l3	! %l3 = 000000000000ffff

p0_label_422:
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030001408] = ff0000ff2651ffff
	stxa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000000
!	Mem[00000000300c1400] = ff0000ff, %l1 = 000000000000ff00
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 000000ff000000ff
!	%l0 = ffffffffffffffff, Mem[0000000010181400] = 00000000
	stha	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000ffff
!	Mem[0000000010041400] = 3a300000, %l2 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 0000003a000000ff
!	%f0  = 00000000 f7098ca1, %l7 = 0000000000000030
!	Mem[0000000030141430] = e07aeb14b4225130
	add	%i5,0x030,%g1
	stda	%f0,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030141430] = e07aeb1400005130
!	%f21 = 000000ff, Mem[0000000010181410] = ffffffff
	sta	%f21,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	%l2 = 000000000000003a, Mem[00000000100c1400] = 00000000
	stwa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000003a
!	Mem[0000000030001410] = 00000026, %l2 = 000000000000003a
	swapa	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000026
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000625a63ff, %f18 = ffffffff ff0000ff
	ldda	[%i6+%o4]0x89,%f18	! %f18 = 00000000 625a63ff

p0_label_423:
!	Mem[0000000010081408] = 00003aff, %l1 = 00000000000000ff
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 0000000000003aff
!	Mem[0000000010001400] = 00000000, %l0 = ffffffffffffffff
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l6 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800180] = ff2635e9, %l5 = 00000000000000ff
	ldub	[%o3+0x180],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030181408] = 00000000625a63ff, %f8  = 00000000 00000000
	ldda	[%i6+%o4]0x89,%f8 	! %f8  = 00000000 625a63ff
!	Mem[0000000010181408] = ff00ff00, %l3 = 000000000000ffff
	ldsha	[%i6+%o4]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030181408] = ff635a62, %l1 = 0000000000003aff
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %f29 = 00000000
	lda	[%i5+%o5]0x89,%f29	! %f29 = 00000000
!	Mem[0000000010101410] = ff000000, %l0 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l0	! %l0 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[000000001004141a] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i1+0x01a]%asi,%l5	! %l5 = 00000000000000ff

p0_label_424:
!	%l2 = 00000026, %l3 = ffffff00, Mem[0000000030041400] = ffa561e3 00003a00
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000026 ffffff00
!	%l0 = 0000ff00, %l1 = 000000ff, Mem[00000000100c1400] = 0000003a 00000000
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000ff00 000000ff
!	%f4  = ff000000 ffff9c20, Mem[0000000030101400] = 00000000 000000ff
	stda	%f4 ,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000000 ffff9c20
!	Mem[0000000030101410] = 00003a30, %l3 = ffffffffffffff00
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 0000000000003a30
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000030
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 00000000ff000000
!	%l6 = 0000000000000000, Mem[0000000030101410] = ffffff00
	stwa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%f0  = 00000000 f7098ca1, Mem[0000000030141410] = 00000000 00000000
	stda	%f0 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 f7098ca1
!	Mem[0000000010041400] = ff300000, %l3 = 0000000000003a30
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000ff300000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = 000000ff, %l4 = 0000000000000000
	ldsh	[%i2+0x03a],%l4		! %l4 = 00000000000000ff

p0_label_425:
!	Mem[0000000010001408] = 000000e3, %l3 = 00000000ff300000
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 00000000000000e3
!	Mem[0000000010081430] = e07aeb14, %l0 = 000000000000ff00
	lduha	[%i2+0x032]%asi,%l0	! %l0 = 000000000000eb14
!	Mem[0000000030181408] = 625a63ff, %l3 = 00000000000000e3
	ldsha	[%i6+%o4]0x89,%l3	! %l3 = 00000000000063ff
!	Mem[0000000030141410] = 00000000, %l4 = 00000000000000ff
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141414] = 3a000000, %l7 = 00000000ff000000
	ldub	[%i5+0x015],%l7		! %l7 = 0000000000000000
!	Mem[0000000030001410] = 000000ff 3a000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 000000003a000000 00000000000000ff
!	Mem[0000000030141400] = ff0000e3, %l4 = 000000003a000000
	lduwa	[%i5+%g0]0x81,%l4	! %l4 = 00000000ff0000e3
!	Mem[0000000010041408] = 000000002600ffff, %f4  = ff000000 ffff9c20
	ldda	[%i1+%o4]0x80,%f4 	! %f4  = 00000000 2600ffff
!	Mem[000000001018142c] = 0000b3f6, %l0 = 000000000000eb14
	ldsha	[%i6+0x02e]%asi,%l0	! %l0 = ffffffffffffb3f6
!	Starting 10 instruction Store Burst
!	Mem[0000000021800101] = ffff6996, %l1 = 00000000000000ff
	ldstuba	[%o3+0x101]%asi,%l1	! %l1 = 000000ff000000ff

p0_label_426:
!	%l6 = 0000000000000000, Mem[00000000201c0000] = ffff367d
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 0000367d
!	%l2 = 0000000000000026, Mem[0000000030181408] = 625a63ff
	stha	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 625a0026
!	%l0 = ffffffffffffb3f6, Mem[0000000010101410] = ff000000
	stba	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = f6000000
!	Mem[0000000010181410] = 000000ff, %l3 = 00000000000063ff
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010101400] = ffffffff, %l0 = ffffffffffffb3f6
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101410] = 000000f6, %l1 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 000000f6000000ff
!	%l0 = 00000000000000ff, Mem[0000000010041428] = 0000000000000000, %asi = 80
	stxa	%l0,[%i1+0x028]%asi	! Mem[0000000010041428] = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030081400] = 00000000
	stha	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%f0  = 00000000 f7098ca1, Mem[0000000010001410] = 000000ff 00000000
	stda	%f0 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 f7098ca1
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = a500ffff, %l3 = 00000000000000ff
	lduha	[%i4+%o4]0x88,%l3	! %l3 = 000000000000ffff

p0_label_427:
!	Mem[0000000010101410] = ff000000, %f27 = 00000000
	lda	[%i4+%o5]0x80,%f27	! %f27 = ff000000
!	Mem[0000000030081410] = 303a00ff, %l4 = 00000000ff0000e3
	ldsha	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = 00003a00, %f23 = ff000000
	lda	[%i3+%o4]0x89,%f23	! %f23 = 00003a00
!	Mem[00000000100c140c] = 00000000, %l6 = 0000000000000000
	lduha	[%i3+0x00e]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = ffffffff ffffffff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010081408] = 00003aff, %l2 = 0000000000000026
	ldswa	[%i2+%o4]0x88,%l2	! %l2 = 0000000000003aff
!	Mem[0000000030041400] = 00000026, %f19 = 625a63ff
	lda	[%i1+%g0]0x81,%f19	! %f19 = 00000026
!	Mem[0000000010181410] = ff000000, %l6 = 00000000ffffffff
	lduwa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030081400] = 00000000, %l1 = 00000000000000f6
	lduwa	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000ff000000
	ldstuba	[%i3+%o5]0x80,%l6	! %l6 = 00000000000000ff

p0_label_428:
!	%f20 = e361a5ff 000000ff, Mem[0000000010041408] = 00000000 2600ffff
	stda	%f20,[%i1+%o4]0x80	! Mem[0000000010041408] = e361a5ff 000000ff
!	%l0 = 00000000000000ff, Mem[0000000030001408] = 00000000
	stba	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
!	%f16 = ff3a0000, Mem[0000000030081408] = 00000000
	sta	%f16,[%i2+%o4]0x89	! Mem[0000000030081408] = ff3a0000
!	Mem[0000000030041408] = ff000000, %l7 = 00000000ffffffff
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030081400] = 00000000, %l7 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%f26 = 00000000 ff000000, %l3 = 000000000000ffff
!	Mem[0000000030101430] = f6b3e679c0a561e3
	add	%i4,0x030,%g1
	stda	%f26,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030101430] = 000000ff00000000
!	Mem[00000000100c1408] = a18c09f7, %l3 = 000000000000ffff
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 000000a1000000ff
!	%l3 = 00000000000000a1, Mem[0000000030181410] = ff2caf12
	stha	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 00a1af12
!	%l2 = 0000000000003aff, Mem[0000000030041408] = ff000000
	stha	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 3aff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00ff00ff, %l7 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000ff

p0_label_429:
!	Mem[0000000030181400] = 00000000, %f18 = 00000000
	lda	[%i6+%g0]0x81,%f18	! %f18 = 00000000
!	Mem[0000000030001410] = 0000003aff000000, %f24 = e3ffa5c0 ad0500ff
	ldda	[%i0+%o5]0x81,%f24	! %f24 = 0000003a ff000000
!	Mem[0000000030081400] = ff000000, %l2 = 0000000000003aff
	lduha	[%i2+%g0]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030081408] = 00003aff, %l2 = 000000000000ff00
	ldsba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %f24 = 0000003a
	lda	[%i6+%g0]0x89,%f24	! %f24 = 00000000
!	Mem[0000000010001410] = a18c09f7, %f8  = 00000000
	lda	[%i0+0x010]%asi,%f8 	! %f8 = a18c09f7
!	Mem[0000000010081410] = ffffffff, %l6 = 0000000000000000
	ldsba	[%i2+0x013]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101420] = e30000ff, %l5 = 00000000000000ff
	lduw	[%i4+0x020],%l5		! %l5 = 00000000e30000ff
!	Mem[0000000010101400] = ffffffff ffffffff, %l2 = 00000000, %l3 = 000000a1
	ldd	[%i4+%g0],%l2		! %l2 = 00000000ffffffff 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 f7098ca1 ff000000 2600ffff
!	%f4  = 00000000 2600ffff 00000000 00000000
!	%f8  = a18c09f7 625a63ff ff0000ff 6bb30828
!	%f12 = 00000000 e361a5ff 00000026 ff000000
	stda	%f0,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400

p0_label_430:
!	Mem[00000000100c1410] = ff000000, %l6 = ffffffff, %l4 = 000000ff
	add	%i3,0x10,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000ff000000
!	Mem[0000000020800041] = 003a9e9b, %l2 = 00000000ffffffff
	ldstub	[%o1+0x041],%l2		! %l2 = 0000003a000000ff
!	%l5 = 00000000e30000ff, Mem[00000000300c1400] = ff0000ff
	stha	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff0000ff
!	Mem[0000000010041400] = 303a0000, %l4 = 00000000ff000000
	ldstuba	[%i1+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l6 = ffffffffffffffff, Mem[00000000100c1415] = ffa561e3
	stb	%l6,[%i3+0x015]		! Mem[00000000100c1414] = ffff61e3
!	%l5 = 00000000e30000ff, Mem[0000000010001410] = f7098ca1
	stha	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = f70900ff
!	Mem[0000000010101408] = ffff00a5, %l7 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000100c1408] = f7098cff, %l2 = 000000000000003a
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030141410] = 00000000, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 003a0000, %l5 = 00000000e30000ff
	lduba	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_431:
!	Mem[0000000010041400] = ff003a30, %l2 = 00000000000000ff
	ldsha	[%i1+%g0]0x80,%l2	! %l2 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (65)
!	Mem[0000000010081408] = 000000ff, %l7 = 00000000000000ff
	ldswa	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = ffffffff, %l0 = 00000000000000ff
	lduh	[%i4+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000010181410] = 000000ff, %l1 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181410] = 12afa100, %l1 = 00000000000000ff
	ldswa	[%i6+%o5]0x89,%l1	! %l1 = 0000000012afa100
!	Mem[0000000010141400] = e361a5ff, %l5 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l5	! %l5 = 000000000000a5ff
!	Mem[0000000010101400] = ffffffff ffffffff, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010001438] = 303a0000, %l7 = 00000000ffffffff
	ldub	[%i0+0x03a],%l7		! %l7 = 0000000000000000
!	Mem[0000000030041408] = 3aff0000, %l7 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l7	! %l7 = 0000000000003aff
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000a5ff, Mem[000000001008143e] = ff000000
	sth	%l5,[%i2+0x03e]		! Mem[000000001008143c] = ff00a5ff

p0_label_432:
!	%l4 = 0000000000000000, Mem[0000000010001400] = 00000000
	sth	%l4,[%i0+%g0]		! Mem[0000000010001400] = 00000000
!	Mem[0000000030141410] = 00000000, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%f20 = e361a5ff 000000ff, Mem[0000000010141408] = 00000030 ff000000
	stda	%f20,[%i5+0x008]%asi	! Mem[0000000010141408] = e361a5ff 000000ff
!	%f30 = 00000000, Mem[00000000100c1414] = ffff61e3
	st	%f30,[%i3+0x014]	! Mem[00000000100c1414] = 00000000
!	%l0 = 000000000000ffff, Mem[0000000010081410] = 00000000
	stwa	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000ffff
!	Mem[0000000030081400] = 000000ff, %l3 = 00000000ffffffff
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%l5 = 000000000000a5ff, Mem[0000000010001410] = f70900ff
	stha	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = f709a5ff
!	Code Fragment 3
p0_fragment_19:
!	%l0 = 000000000000ffff
	setx	0xf059b87fccc535bb,%g7,%l0 ! %l0 = f059b87fccc535bb
!	%l1 = 0000000012afa100
	setx	0x021efff838446dbb,%g7,%l1 ! %l1 = 021efff838446dbb
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f059b87fccc535bb
	setx	0x43655ca0001c7045,%g7,%l0 ! %l0 = 43655ca0001c7045
!	%l1 = 021efff838446dbb
	setx	0xbc429bafe11e0e3b,%g7,%l1 ! %l1 = bc429bafe11e0e3b
!	Mem[0000000030181400] = 00000000, %l1 = bc429bafe11e0e3b
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = e361a5ff, %l1 = 0000000000000000
	ldsba	[%i0+0x020]%asi,%l1	! %l1 = ffffffffffffffe3

p0_label_433:
!	Mem[0000000010041400] = ff003a30, %l7 = 0000000000003aff
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001410] = ffa509f7 00000000, %l0 = 001c7045, %l1 = ffffffe3
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 00000000ffa509f7 0000000000000000
!	Mem[0000000030001400] = 00000000, %f18 = 00000000
	lda	[%i0+%g0]0x81,%f18	! %f18 = 00000000
!	Mem[0000000010101400] = ffffffff ffffffff ffff00a5 5c2438bb
!	Mem[0000000010101410] = ff000000 c0a5ffe3 000000ff ffff0026
!	Mem[0000000010101420] = e30000ff 332e00f0 00ff0000 2808b36b
!	Mem[0000000010101430] = 000052ff ff120000 ff0000ff 00ebffe0
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Mem[00000000300c1410] = 00000000, %l5 = 000000000000a5ff
	ldsba	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141438] = 00000000, %l2 = ffffffffffffff00
	lduwa	[%i5+0x038]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = ff000000 00000000, %l0 = ffa509f7, %l1 = 00000000
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000030041408] = 3aff000000000000, %l2 = 0000000000000000
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = 3aff000000000000
!	Mem[0000000010181408] = ff00ff00, %l7 = ffffffffffffffff
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 00000000ff00ff00
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030141400] = ff0000e3
	stwa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000

p0_label_434:
	membar	#Sync			! Added by membar checker (66)
!	%f24 = 00000000 ff000000, Mem[0000000010101430] = 000052ff ff120000
	stda	%f24,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000 ff000000
!	%l6 = 00000000ffffffff, Mem[0000000010001400] = 00000000
	stba	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	%l2 = 3aff000000000000, Mem[000000001018140c] = ff000000, %asi = 80
	stba	%l2,[%i6+0x00c]%asi	! Mem[000000001018140c] = 00000000
!	Mem[0000000010101431] = 00000000, %l0 = 00000000ff000000
	ldstub	[%i4+0x031],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030041408] = 3aff0000, %l6 = 00000000ffffffff
	ldstuba	[%i1+%o4]0x81,%l6	! %l6 = 0000003a000000ff
!	Mem[00000000211c0001] = ffff0b46, %l5 = 0000000000000000
	ldstub	[%o2+0x001],%l5		! %l5 = 000000ff000000ff
!	Mem[00000000100c1400] = 00ff0000, %l2 = 3aff000000000000
	swapa	[%i3+%g0]0x88,%l2	! %l2 = 0000000000ff0000
!	Mem[00000000211c0000] = ffff0b46, %l3 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010141428] = e361a5ff, %l0 = 0000000000000000, %asi = 80
	swapa	[%i5+0x028]%asi,%l0	! %l0 = 00000000e361a5ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = e3ffa5c0000000ff, %f22 = 000000ff 00003a00
	ldda	[%i4+%o5]0x88,%f22	! %f22 = e3ffa5c0 000000ff

p0_label_435:
!	Mem[00000000100c1410] = ff00000000000000, %l2 = 0000000000ff0000
	ldxa	[%i3+%o5]0x80,%l2	! %l2 = ff00000000000000
!	Mem[0000000010081408] = ff000000, %l0 = 00000000e361a5ff
	ldswa	[%i2+%o4]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010141428] = 00000000 00000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i5+0x028]%asi,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010081400] = 00000000, %l7 = 00000000ff00ff00
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = ff000000, %l7 = 0000000000000000
	ldsba	[%i3+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001408] = e3000000, %l5 = 00000000000000ff
	lduwa	[%i0+%o4]0x80,%l5	! %l5 = 00000000e3000000
!	Mem[0000000030141400] = 00000000 ffff0000, %l4 = 00000000, %l5 = e3000000
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000 00000000ffff0000
!	Mem[0000000010101418] = 000000ff, %l6 = 000000000000003a
	ldsw	[%i4+0x018],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030081410] = ff003a30ffff9c20, %f10 = 00ff0000 2808b36b
	ldda	[%i2+%o5]0x81,%f10	! %f10 = ff003a30 ffff9c20
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010141400] = e361a5ff
	stha	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = e3610000

p0_label_436:
!	%f20 = e361a5ff, Mem[0000000010101410] = ff000000
	st	%f20,[%i4+%o5]		! Mem[0000000010101410] = e361a5ff
!	%l1 = 0000000000000000, Mem[00000000100c1410] = ff000000
	stba	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[0000000030001408] = ff000000, %l5 = 00000000ffff0000
	swapa	[%i0+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	%f4  = ff000000 c0a5ffe3, Mem[0000000030101410] = 00000000 00000000
	stda	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000 c0a5ffe3
!	%l4 = 0000000000000000, Mem[0000000010101406] = ffffffff
	sth	%l4,[%i4+0x006]		! Mem[0000000010101404] = ffff0000
!	%l0 = ffffffffff000000, Mem[0000000030141410] = a18c09f700000000
	stxa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffffff000000
!	%l5 = 00000000ff000000, Mem[0000000030141410] = 000000ff
	stha	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff
!	Mem[0000000030041410] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030001410] = 3a000000
	stwa	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff3a0000, %l3 = 0000000000000000
	lduha	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000

p0_label_437:
!	Mem[00000000100c1408] = ff8c09f7, %l2 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l2	! %l2 = 00000000ff8c09f7
!	Mem[0000000020800040] = 00ff9e9b, %l1 = 0000000000000000
	lduha	[%o1+0x040]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001420] = e361a5ff, %f9  = 332e00f0
	lda	[%i0+0x020]%asi,%f9 	! %f9 = e361a5ff
!	Mem[0000000010001410] = ffa509f7, %l1 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001400] = ff000000, %l4 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[0000000030101400] = ff000000 ffff9c20, %l0 = ff000000, %l1 = ffffffff
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 00000000ffff9c20 00000000ff000000
!	%l7 = ffffffffffffffff, imm = fffffffffffffa93, %l6 = 00000000000000ff
	xor	%l7,-0x56d,%l6		! %l6 = 000000000000056c
!	Mem[0000000030081410] = ff003a30ffff9c20, %f8  = e30000ff e361a5ff
	ldda	[%i2+%o5]0x81,%f8 	! %f8  = ff003a30 ffff9c20
!	Mem[0000000030001400] = 00000000, %l5 = 00000000ff000000
	lduwa	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffff9c20, Mem[0000000030001400] = 000000ff00000000
	stxa	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000ffff9c20

p0_label_438:
!	%f7  = ffff0026, Mem[0000000010081414] = 2600ffff
	st	%f7 ,[%i2+0x014]	! Mem[0000000010081414] = ffff0026
!	Mem[00000000211c0001] = ffff0b46, %l3 = 0000000000000000
	ldstub	[%o2+0x001],%l3		! %l3 = 000000ff000000ff
!	Mem[0000000030181408] = 26005a62, %l4 = ffffffffff000000
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 0000000026005a62
!	%l3 = 00000000000000ff, Mem[0000000010101418] = 000000ff, %asi = 80
	stwa	%l3,[%i4+0x018]%asi	! Mem[0000000010101418] = 000000ff
!	%l1 = 00000000ff000000, Mem[0000000010001438] = 303a0000ff000000, %asi = 80
	stxa	%l1,[%i0+0x038]%asi	! Mem[0000000010001438] = 00000000ff000000
!	%f27 = ff000000, Mem[0000000010081428] = ff0000ff
	st	%f27,[%i2+0x028]	! Mem[0000000010081428] = ff000000
!	%l1 = 00000000ff000000, Mem[0000000010041410] = 00000000
	stwa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = ff000000
!	%l6 = 0000056c, %l7 = ffffffff, Mem[00000000300c1400] = ff0000ff ffffffff
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000056c ffffffff
!	%l1 = 00000000ff000000, Mem[0000000030101400] = ffff9c20
	stha	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff0005ad, %l0 = 00000000ffff9c20
	ldsba	[%i5+%o4]0x89,%l0	! %l0 = ffffffffffffffad

p0_label_439:
!	Mem[000000001004140c] = 000000ff, %l5 = 0000000000000000
	ldsb	[%i1+0x00f],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030001400] = ffff9c20, %l5 = ffffffffffffffff
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 00000000ffff9c20
!	Mem[0000000010101408] = ffff00a5, %l2 = 00000000ff8c09f7
	ldswa	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffff00a5
!	Mem[0000000030041400] = 00000026, %l4 = 0000000026005a62
	lduwa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000026
!	Mem[0000000010041408] = ffa561e3, %l4 = 0000000000000026
	lduba	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000e3
!	Mem[0000000030101408] = ff000000, %l0 = ffffffffffffffad
	lduwa	[%i4+%o4]0x89,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010081400] = 00000000, %l1 = 00000000ff000000
	ldswa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800040] = 00ff9e9b, %l7 = ffffffffffffffff
	ldsba	[%o1+0x041]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001434] = 00000000, %l4 = 00000000000000e3
	ldsba	[%i0+0x035]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1434] = 303a0000, %l5 = ffff9c20, %l1 = 00000000
	add	%i3,0x34,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 00000000303a0000

p0_label_440:
!	%f6  = 000000ff ffff0026, Mem[00000000300c1400] = 6c050000 ffffffff
	stda	%f6 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff ffff0026
!	Mem[0000000010081420] = a18c09f7, %l2 = ffffffffffff00a5
	ldstuba	[%i2+0x020]%asi,%l2	! %l2 = 000000a1000000ff
!	%l4 = 00000000, %l5 = ffff9c20, Mem[0000000010001408] = 000000e3 00000000
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 ffff9c20
!	%l4 = 0000000000000000, Mem[0000000010141400] = 000061e3
	stba	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 000061e3
!	%l6 = 000000000000056c, Mem[0000000010181408] = ff00ff0000000000
	stxa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000000000056c
!	Mem[0000000020800000] = 0000188e, %l3 = 00000000000000ff
	ldstub	[%o1+%g0],%l3		! %l3 = 00000000000000ff
!	%l6 = 000000000000056c, Mem[0000000030001410] = 00000000ff000000
	stxa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000000000056c
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%f10 = ff003a30 ffff9c20, Mem[0000000030101408] = 000000ff e361a5ff
	stda	%f10,[%i4+%o4]0x81	! Mem[0000000030101408] = ff003a30 ffff9c20
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffffffffff0000, %f10 = ff003a30 ffff9c20
	ldda	[%i4+%g0]0x80,%f10	! %f10 = ffffffff ffff0000

p0_label_441:
!	Mem[000000001010143c] = 00ebffe0, %l5 = 00000000ffff9c20
	ldsb	[%i4+0x03f],%l5		! %l5 = ffffffffffffffe0
!	Mem[0000000010001400] = ff000000 ffa561e3, %l0 = ff000000, %l1 = 303a0000
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000ff000000 00000000ffa561e3
!	Mem[0000000030081410] = ff003a30, %l5 = ffffffffffffffe0
	ldsba	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1408] = 003a000000000000, %f26 = 00000000 ff000000
	ldda	[%i3+%o4]0x81,%f26	! %f26 = 003a0000 00000000
!	Mem[0000000030141408] = ff0005ad, %l1 = 00000000ffa561e3
	lduwa	[%i5+%o4]0x89,%l1	! %l1 = 00000000ff0005ad
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = ffffffffff000000, %f2  = ffff00a5 5c2438bb
	ldda	[%i5+%o5]0x89,%f2 	! %f2  = ffffffff ff000000
!	Mem[00000000100c1408] = ff8c09f7, %l7 = ffffffffffffffff
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = ffffffffff8c09f7
!	Mem[0000000010101400] = 0000ffffffffffff, %f8  = ff003a30 ffff9c20
	ldda	[%i4+%g0]0x88,%f8 	! %f8  = 0000ffff ffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000056c, Mem[0000000020800000] = ff00188e, %asi = 80
	stha	%l6,[%o1+0x000]%asi	! Mem[0000000020800000] = 056c188e

p0_label_442:
!	Mem[0000000010001400] = ff000000, %l7 = ffffffffff8c09f7
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	%f0  = ffffffff ffffffff, %l7 = 00000000ff000000
!	Mem[0000000010181400] = ffff000000000000
	stda	%f0,[%i6+%l7]ASI_PST16_P ! Mem[0000000010181400] = ffff000000000000
!	%l6 = 000000000000056c, Mem[0000000010141410] = ff00ff003a000000
	stxa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000000000056c
!	%f11 = ffff0000, Mem[0000000010141410] = 00000000
	sta	%f11,[%i5+%o5]0x80	! Mem[0000000010141410] = ffff0000
!	%l4 = 0000000000000000, Mem[0000000030041410] = ff0000ff
	stha	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = ff000000
!	Mem[0000000010101408] = a500ffff, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010101428] = 00ff00002808b36b, %l0 = 00000000ff000000, %l1 = 00000000ff0005ad
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 00ff00002808b36b
!	%l5 = ffffffffffffffff, Mem[0000000030181408] = ff00000000000000
	stxa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffffffffffff
!	Mem[0000000030041408] = ffff0000, %l5 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00003aff, %l2 = 00000000000000a1
	ldswa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000003aff

p0_label_443:
!	Mem[0000000010001434] = 00000000, %l6 = 000000000000056c
	lduha	[%i0+0x036]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = 303a0000 ff0005ad, %l0 = ff000000, %l1 = 2808b36b
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 00000000ff0005ad 00000000303a0000
!	Mem[00000000300c1408] = 003a000000000000, %f28 = ffff0000 00000000
	ldda	[%i3+%o4]0x81,%f28	! %f28 = 003a0000 00000000
!	Mem[0000000030181400] = 000000ff, %l1 = 00000000303a0000
	lduha	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101400] = 0000ffff, %l1 = 00000000000000ff
	lduha	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = ffff0000ffff0026, %f30 = 00000000 00000000
	ldda	[%i2+%o5]0x80,%f30	! %f30 = ffff0000 ffff0026
!	Mem[0000000030141410] = 000000ff, %l2 = 0000000000003aff
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181420] = 5c92e244, %l0 = 00000000ff0005ad
	ldswa	[%i6+0x020]%asi,%l0	! %l0 = 000000005c92e244
!	Mem[0000000010181410] = 00000000000000ff, %l0 = 000000005c92e244
	ldxa	[%i6+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = ff000000, Mem[0000000030041400] = 26000000 00ffffff
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 ff000000

p0_label_444:
!	Mem[0000000030081408] = ff3a0000, %l0 = 00000000000000ff
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 00000000ff3a0000
!	Mem[0000000010181408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081404] = f7098ca1, %l0 = 00000000ff3a0000
	ldstuba	[%i2+0x004]%asi,%l0	! %l0 = 000000f7000000ff
!	%l2 = 0000000000000000, Mem[0000000030001410] = 000000000000056c
	stxa	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000
!	Mem[0000000010141400] = 000061e3, %l3 = 00000000000000ff
	ldswa	[%i5+%g0]0x80,%l3	! %l3 = 00000000000061e3
!	%f4  = ff000000, Mem[0000000030141408] = ff0005ad
	sta	%f4 ,[%i5+%o4]0x89	! Mem[0000000030141408] = ff000000
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000021800040] = 00f7a30e
	sth	%l4,[%o3+0x040]		! Mem[0000000021800040] = 0000a30e
!	Mem[0000000030181400] = 000000ff, %l0 = 00000000000000f7
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffa509f7, %l0 = 00000000000000ff
	lduba	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000ff

p0_label_445:
!	Mem[0000000010181408] = ff000000, %l0 = 00000000000000ff
	lduha	[%i6+%o4]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010101410] = e361a5ff, %l4 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000e3
!	Mem[0000000010041408] = e361a5ff, %l4 = 00000000000000e3
	ldsha	[%i1+%o4]0x80,%l4	! %l4 = ffffffffffffe361
!	Mem[00000000100c140c] = 00000000, %l0 = 000000000000ff00
	lduh	[%i3+0x00c],%l0		! %l0 = 0000000000000000
!	Mem[0000000030041408] = 00000000 0000ffff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 000000000000ffff 0000000000000000
!	Mem[0000000010081408] = 000000ff, %l1 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101408] = 303a00ff, %l0 = 000000000000ffff
	lduwa	[%i4+%o4]0x89,%l0	! %l0 = 00000000303a00ff
!	Mem[0000000030041400] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = f7098cff, %l2 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[000000001000141c] = 00000000
	sth	%l6,[%i0+0x01c]		! Mem[000000001000141c] = 00000000

p0_label_446:
!	Mem[0000000010081410] = ffff0000, %l0 = 303a00ff, %l5 = 00000000
	add	%i2,0x10,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000ffff0000
!	Mem[000000001000140e] = 209cffff, %l1 = 00000000000000ff
	ldstuba	[%i0+0x00e]%asi,%l1	! %l1 = 000000ff000000ff
!	%f16 = ff3a0000 00000000, %l6 = 0000000000000000
!	Mem[0000000010001418] = 0000000000000000
	add	%i0,0x018,%g1
	stda	%f16,[%g1+%l6]ASI_PST16_P ! Mem[0000000010001418] = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l0 = 00000000303a00ff
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%f21 = 000000ff, Mem[0000000010141410] = 0000ffff
	sta	%f21,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%l0 = 0000000000000000, Mem[0000000010141410] = 000000ff
	stwa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%l7 = 00000000ff000000, Mem[00000000100c1400] = ff00000000000000
	stxa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000ff000000
!	%f12 = 000052ff ff120000, %l1 = 00000000000000ff
!	Mem[0000000030001400] = 209cffff00000000
	stda	%f12,[%i0+%l1]ASI_PST16_SL ! Mem[0000000030001400] = 000012ffff520000
!	%f8  = 0000ffff, Mem[00000000300c1410] = 00000000
	sta	%f8 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff000000, %l0 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l0	! %l0 = 00000000000000ff

p0_label_447:
!	Mem[0000000030001410] = ff000000, %f22 = e3ffa5c0
	lda	[%i0+%o5]0x81,%f22	! %f22 = ff000000
!	Mem[0000000030141410] = ff0000ff, %l4 = ffffffffffffe361
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l1 = 00000000000000ff
	lduba	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = ff0000ff, %l0 = 00000000000000ff
	ldswa	[%i5+%o5]0x89,%l0	! %l0 = ffffffffff0000ff
!	Mem[00000000300c1408] = 003a0000, %l4 = 00000000000000ff
	lduha	[%i3+%o4]0x81,%l4	! %l4 = 000000000000003a
!	Mem[0000000030101410] = e3ffa5c0, %f31 = ffff0026
	lda	[%i4+%o5]0x81,%f31	! %f31 = e3ffa5c0
!	Mem[00000000300c1400] = 000000ff, %l3 = 00000000000061e3
	ldswa	[%i3+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001408] = ffff0000 00000000, %l6 = 00000000, %l7 = ff000000
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffff0000 0000000000000000
!	Mem[0000000010141408] = ffa561e3, %l7 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l7	! %l7 = ffffffffffa561e3
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000201c0000] = 0000367d
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 0000367d

p0_label_448:
!	Mem[0000000020800001] = 056c188e, %l5 = 00000000ffff0000
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 0000006c000000ff
!	%l2 = ffffffffffffffff, Mem[0000000020800000] = 05ff188e, %asi = 80
	stba	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = ffff188e
!	%l3 = 00000000000000ff, Mem[00000000201c0000] = 0000367d, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff367d
!	%l3 = 00000000000000ff, Mem[000000001008142e] = 6bb30828
	sth	%l3,[%i2+0x02e]		! Mem[000000001008142c] = 6bb300ff
!	%l2 = ffffffffffffffff, Mem[0000000010141438] = 00000000
	stw	%l2,[%i5+0x038]		! Mem[0000000010141438] = ffffffff
!	%f0  = ffffffff ffffffff ffffffff ff000000
!	%f4  = ff000000 c0a5ffe3 000000ff ffff0026
!	%f8  = 0000ffff ffffffff ffffffff ffff0000
!	%f12 = 000052ff ff120000 ff0000ff 00ebffe0
	stda	%f0,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	%l6 = 00000000ffff0000, Mem[0000000030081400] = 000000ff
	stwa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = ffff0000
!	%l6 = 00000000ffff0000, Mem[0000000010181410] = 000000ff
	stba	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%f30 = ffff0000, Mem[0000000030001408] = ffff0000
	sta	%f30,[%i0+%o4]0x81	! Mem[0000000030001408] = ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = c0a5ffe3, %l5 = 000000000000006c
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = ffffffffc0a5ffe3

p0_label_449:
!	Mem[0000000030141400] = 00000000ffff0000, %f30 = ffff0000 e3ffa5c0
	ldda	[%i5+%g0]0x81,%f30	! %f30 = 00000000 ffff0000
!	Mem[0000000030181408] = ffffffffffffffff, %l2 = ffffffffffffffff
	ldxa	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101410] = e361a5ff, %l6 = 00000000ffff0000
	lduba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000e3
!	Mem[0000000010141408] = ff000000ffa561e3, %l3 = 00000000000000ff
	ldxa	[%i5+%o4]0x88,%l3	! %l3 = ff000000ffa561e3
!	Mem[0000000010041408] = ff000000 ffa561e3, %l2 = ffffffff, %l3 = ffa561e3
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 00000000ffa561e3 00000000ff000000
!	Mem[000000001004140c] = 000000ff, %l5 = ffffffffc0a5ffe3
	lduh	[%i1+0x00e],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010141400] = 003a0000e3610000, %f28 = 003a0000 00000000
	ldda	[%i5+%g0]0x88,%f28	! %f28 = 003a0000 e3610000
	membar	#Sync			! Added by membar checker (67)
!	Mem[0000000010181410] = 00000000, %l0 = ffffffffff0000ff
	ldsba	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = e361a5ffc0a5ffe3, %l5 = 00000000000000ff
	ldxa	[%i4+%o5]0x80,%l5	! %l5 = e361a5ffc0a5ffe3
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000e3, Mem[0000000030101400] = ffff0000
	stwa	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000e3

p0_label_450:
!	%l0 = 0000000000000000, Mem[0000000010001408] = 00000000209cffff
	stxa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000000
!	Mem[0000000010101408] = a500ffff, %l3 = 00000000ff000000
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%f14 = ff0000ff 00ebffe0, Mem[0000000010141408] = ffa561e3 ff000000
	stda	%f14,[%i5+%o4]0x88	! Mem[0000000010141408] = ff0000ff 00ebffe0
!	%l4 = 0000003a, %l5 = c0a5ffe3, Mem[0000000030081400] = 0000ffff 00000000
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000003a c0a5ffe3
!	Mem[0000000010101400] = ffffffff, %l7 = ffffffffffa561e3
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000030101408] = ff003a30, %l6 = 00000000000000e3
	swapa	[%i4+%o4]0x81,%l6	! %l6 = 00000000ff003a30
!	%l7 = 00000000ffffffff, Mem[0000000010041410] = ff000000
	stba	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = ff000000
!	Mem[0000000030101408] = e3000000, %l7 = 00000000ffffffff
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 00000000e3000000
!	Mem[00000000100c1408] = ff8c09f7, %l4 = 000000000000003a
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 00000000ff8c09f7
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = a18c09ff00000000, %l4 = 00000000ff8c09f7
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = a18c09ff00000000

p0_label_451:
!	Mem[0000000010101410] = e361a5ff c0a5ffe3, %l2 = ffa561e3, %l3 = 000000ff
	ldda	[%i4+0x010]%asi,%l2	! %l2 = 00000000e361a5ff 00000000c0a5ffe3
!	Mem[0000000030141408] = 000000ff, %f0  = ffffffff
	lda	[%i5+%o4]0x81,%f0 	! %f0 = 000000ff
!	Mem[0000000030141408] = 000000ff, %l0 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %f9  = ffffffff
	lda	[%i2+%g0]0x88,%f9 	! %f9 = 00000000
!	Mem[00000000100c1400] = 000000ff, %l0 = 00000000000000ff
	ldsba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 0000003a, %l7 = 00000000e3000000
	ldswa	[%i2+%g0]0x81,%l7	! %l7 = 000000000000003a
!	Mem[0000000030101410] = ff000000 c0a5ffe3, %l0 = 00000000, %l1 = 00000000
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 00000000c0a5ffe3 00000000ff000000
!	Mem[0000000010101428] = 00ff00002808b36b, %l4 = a18c09ff00000000
	ldxa	[%i4+0x028]%asi,%l4	! %l4 = 00ff00002808b36b
!	Mem[0000000010081410] = ffff0000, %l6 = 00000000ff003a30
	ldsba	[%i2+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1435] = 303a0000, %l6 = ffffffffffffffff
	ldstuba	[%i3+0x035]%asi,%l6	! %l6 = 0000003a000000ff

p0_label_452:
!	%f10 = ffffffff, Mem[0000000010141400] = e3610000
	sta	%f10,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffff
!	Mem[00000000300c1400] = 000000ff, %l7 = 000000000000003a
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141400] = 00000000, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[000000001000143c] = ff000000, %l2 = e361a5ff, %l2 = e361a5ff
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l2,%l2	! %l2 = 00000000ff000000
!	%f10 = ffffffff ffff0000, %l2 = 00000000ff000000
!	Mem[00000000300c1430] = 0000000000000000
	add	%i3,0x030,%g1
	stda	%f10,[%g1+%l2]ASI_PST8_S ! Mem[00000000300c1430] = 0000000000000000
!	%f8  = 0000ffff 00000000, %l4 = 00ff00002808b36b
!	Mem[0000000010141400] = ffffffff00003a00
	stda	%f8,[%i5+%l4]ASI_PST8_PL ! Mem[0000000010141400] = 0000ff0000ff0000
!	Mem[0000000010001408] = 00000000, %l5 = c0a5ffe3, %l2 = ff000000
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 0000000000000000
!	%f14 = ff0000ff 00ebffe0, Mem[0000000010181408] = ffffffff 000000ff
	stda	%f14,[%i6+%o4]0x88	! Mem[0000000010181408] = ff0000ff 00ebffe0
!	Mem[0000000010041428] = 00000000, %l6 = 000000000000003a
	ldstuba	[%i1+0x028]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff0b46, %l2 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffffff

p0_label_453:
!	Mem[0000000010101410] = ffa561e3, %l1 = 00000000ff000000
	ldsha	[%i4+%o5]0x88,%l1	! %l1 = 00000000000061e3
!	Mem[0000000030081408] = ff000000, %l2 = ffffffffffffffff
	ldsha	[%i2+%o4]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010041400] = ff003a30, %f25 = ff000000
	lda	[%i1+%g0]0x80,%f25	! %f25 = ff003a30
!	Mem[00000000218001c0] = ff004fd1, %l3 = 00000000c0a5ffe3
	ldub	[%o3+0x1c1],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041418] = 0000ffff, %l5 = e361a5ffc0a5ffe3
	ldsha	[%i1+0x018]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 00ff367d, %l7 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081404] = ff098ca1, %l7 = 0000000000000000
	ldsb	[%i2+0x006],%l7		! %l7 = ffffffffffffff8c
!	Mem[0000000010181400] = ffffffff, %l1 = 00000000000061e3
	lduba	[%i6+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041420] = ffff0026, %l2 = ffffffffffffff00
	lduwa	[%i1+0x020]%asi,%l2	! %l2 = 00000000ffff0026
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010001408] = 00000000
	stha	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000

p0_label_454:
!	Mem[0000000010181408] = e0ffeb00, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 000000e0000000ff
!	%f0  = 000000ff ffffffff ffffffff ff000000
!	%f4  = ff000000 c0a5ffe3 000000ff ffff0026
!	%f8  = 0000ffff 00000000 ffffffff ffff0000
!	%f12 = 000052ff ff120000 ff0000ff 00ebffe0
	stda	%f0,[%i6]ASI_BLK_SL	! Block Store to 0000000030181400
!	%l2 = 00000000ffff0026, Mem[0000000030101410] = e3ffa5c0000000ff
	stxa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000ffff0026
!	%l5 = 0000000000000000, Mem[0000000010101410] = e3ffa5c0ffa561e3
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	%f27 = 00000000, Mem[0000000010041410] = ff000000
	sta	%f27,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010141410] = 00000000
	stha	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%f30 = 00000000 ffff0000, Mem[0000000030041408] = ffff0000 00000000
	stda	%f30,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 ffff0000
!	%l4 = 00ff00002808b36b, Mem[0000000010181426] = ffffffff, %asi = 80
	stha	%l4,[%i6+0x026]%asi	! Mem[0000000010181424] = ffffb36b
!	Mem[0000000010101408] = a500ffff, %l0 = 00000000c0a5ffe3
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 0000003a, %l1 = 00000000000000ff
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_455:
!	Mem[0000000010101428] = 00ff00002808b36b, %f28 = 003a0000 e3610000
	ldda	[%i4+0x028]%asi,%f28	! %f28 = 00ff0000 2808b36b
!	Mem[0000000030041408] = 00000000, %l6 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 00000000000000ff, %l1 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (68)
!	Mem[0000000010181400] = ffffffffffffffff, %f26 = 003a0000 00000000
	ldda	[%i6+%g0]0x88,%f26	! %f26 = ffffffff ffffffff
!	Mem[0000000010001408] = 00000000, %l4 = 00ff00002808b36b
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = ff8c09f7, %l6 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l6	! %l6 = ffffffffff8c09f7
!	Mem[00000000300c1410] = ffff0000, %l6 = ffffffffff8c09f7
	ldswa	[%i3+%o5]0x81,%l6	! %l6 = ffffffffffff0000
!	Mem[0000000030081400] = e3ffa5c0 3a000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 000000003a000000 00000000e3ffa5c0
!	Mem[0000000010001400] = ff8c09f7, %l6 = ffffffffffff0000
	ldsba	[%i0+0x002]%asi,%l6	! %l6 = 0000000000000009
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = ffffffff, %l4 = 000000003a000000
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000ffffffff

p0_label_456:
!	%l1 = 00000000000000ff, Mem[0000000030041400] = 00000000
	stha	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	Mem[00000000100c1430] = 00000000, %l5 = 00000000e3ffa5c0, %asi = 80
	swapa	[%i3+0x030]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = e3000000, %l4 = 00000000ffffffff
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 000000e3000000ff
!	Mem[0000000010001400] = ff8c09f7, %l2 = 00000000ffff0026
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 00000000ff8c09f7
!	Mem[0000000030181408] = 000000ff, %l0 = 00000000000000ff
	swapa	[%i6+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101408] = a500ffff, %l6 = 0000000000000009
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 00000000a500ffff
!	%l2 = 00000000ff8c09f7, Mem[0000000030081408] = 000000ff
	stha	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 000009f7
!	%l6 = 00000000a500ffff, Mem[0000000030181408] = ff000000
	stwa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = a500ffff
!	Mem[00000000300c1408] = 003a0000, %l1 = 00000000000000ff
	ldstuba	[%i3+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ffffffffff000000, %l2 = 00000000ff8c09f7
	ldxa	[%i6+%g0]0x81,%l2	! %l2 = ffffffffff000000

p0_label_457:
!	Mem[00000000211c0000] = ffff0b46, %l1 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[00000000300c1408] = ff3a0000, %l2 = ffffffffff000000
	lduha	[%i3+%o4]0x81,%l2	! %l2 = 000000000000ff3a
!	Mem[0000000010101410] = 0000000000000000, %f18 = 00000000 00000026
	ldd	[%i4+%o5],%f18		! %f18 = 00000000 00000000
!	Mem[0000000010041408] = e361a5ff, %f24 = 00000000
	ld	[%i1+%o4],%f24	! %f24 = e361a5ff
!	Mem[0000000010001408] = 00000000, %l3 = 00000000000000e0
	lduba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l7 = ffffffffffffff8c
	ldswa	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001420] = e361a5ff, %l0 = 00000000000000ff
	lduh	[%i0+0x022],%l0		! %l0 = 000000000000a5ff
!	Mem[0000000010181410] = 00000000, %l1 = 000000000000ffff
	lduba	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f6  = 000000ff ffff0026, Mem[00000000300c1400] = ff0000ff ffff0026
	stda	%f6 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff ffff0026

p0_label_458:
!	%l3 = 0000000000000000, Mem[0000000010001410] = ffa509f7, %asi = 80
	stwa	%l3,[%i0+0x010]%asi	! Mem[0000000010001410] = 00000000
!	%f10 = ffffffff ffff0000, %l2 = 000000000000ff3a
!	Mem[0000000030141420] = 2808b36b00000000
	add	%i5,0x020,%g1
	stda	%f10,[%g1+%l2]ASI_PST16_S ! Mem[0000000030141420] = ffffb36bffff0000
!	%l4 = 000000e3, %l5 = 00000000, Mem[0000000030001400] = ff120000 000052ff
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000e3 00000000
!	Mem[00000000300c1410] = ffff0000, %l6 = 00000000a500ffff
	swapa	[%i3+%o5]0x81,%l6	! %l6 = 00000000ffff0000
!	%l7 = 0000000000000000, Mem[0000000020800041] = 00ff9e9b, %asi = 80
	stba	%l7,[%o1+0x041]%asi	! Mem[0000000020800040] = 00009e9b
!	Mem[0000000030141408] = ff000000, %l4 = 00000000000000e3
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010101410] = 00000000, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l4 = 00000000ff000000
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%f15 = 00ebffe0, Mem[0000000030101408] = ffffffff
	sta	%f15,[%i4+%o4]0x89	! Mem[0000000030101408] = 00ebffe0
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000c0a5ffe3, %l7 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l7	! %l7 = 00000000c0a5ffe3

p0_label_459:
!	Mem[0000000010141428] = 0000000000000000, %f22 = ff000000 000000ff
	ldda	[%i5+0x028]%asi,%f22	! %f22 = 00000000 00000000
!	Mem[00000000211c0000] = ffff0b46, %l3 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141408] = 303a0000000000e3, %f20 = e361a5ff 000000ff
	ldda	[%i5+%o4]0x89,%f20	! %f20 = 303a0000 000000e3
!	Mem[0000000030141400] = 0000ffff 00000000, %l2 = 0000ff3a, %l3 = 000000ff
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000 000000000000ffff
!	Mem[0000000010081408] = ff000000, %f31 = ffff0000
	lda	[%i2+%o4]0x80,%f31	! %f31 = ff000000
!	Mem[00000000100c1408] = 0000003a, %l1 = 0000000000000000
	ldsha	[%i3+0x00a]%asi,%l1	! %l1 = 000000000000003a
!	Mem[0000000010041410] = 00000000 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030081410] = ff003a30, %l1 = 000000000000003a
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001438] = 00000000ff000000, %l2 = 0000000000000000
	ldx	[%i0+0x038],%l2		! %l2 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l6 = ffff0000, %l7 = c0a5ffe3, Mem[0000000010041408] = e361a5ff 000000ff
	stda	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = ffff0000 c0a5ffe3

p0_label_460:
!	Mem[000000001010142c] = 2808b36b, %l7 = 00000000c0a5ffe3, %asi = 80
	swapa	[%i4+0x02c]%asi,%l7	! %l7 = 000000002808b36b
!	Mem[0000000030081408] = 000009f7, %l0 = 000000000000a5ff
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 00000000000009f7
!	Mem[00000000100c143d] = ffff9c20, %l6 = 00000000ffff0000
	ldstuba	[%i3+0x03d]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030081400] = 3a000000, %l6 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000000ff000000, Mem[00000000100c1400] = ff000000
	stba	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff000000
!	%l5 = 0000000000000000, Mem[0000000010041408] = ffff0000
	stha	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l3 = 000000000000ffff, Mem[0000000010181408] = ffffeb00
	stha	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffeb00
!	%l2 = 00000000ff000000, Mem[0000000030101408] = e0ffeb00
	stba	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00ffeb00
!	%f2  = ffffffff ff000000, Mem[0000000010141400] = 00ff0000 0000ff00
	stda	%f2 ,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffff ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000

p0_label_461:
!	Mem[00000000100c1410] = 00000000, %l7 = 000000002808b36b
	ldsha	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l0 = 00000000000009f7
	lduha	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (69)
!	Mem[0000000030041400] = ff000000 000000ff 00000000 ffff0000
!	Mem[0000000030041410] = 000000ff 0000003a 000000ff ff000000
!	Mem[0000000030041420] = 00000000 303a0000 e361a5ff 00000000
!	Mem[0000000030041430] = 00000000 00000000 00000000 00000000
	ldda	[%i1]ASI_BLK_AIUS,%f16	! Block Load from 0000000030041400
!	Mem[00000000300c1408] = ff3a000000000000, %l7 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l7	! %l7 = ff3a000000000000
!	Mem[0000000010101410] = 00000000, %l1 = ffffffffffffffff
	lduba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 000000ff00000000, %f6  = 000000ff ffff0026
	ldda	[%i3+0x000]%asi,%f6 	! %f6  = 000000ff 00000000
!	Mem[0000000030041408] = 00000000, %l3 = 000000000000ffff
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = ffff00a5, %l3 = 0000000000000000
	lduba	[%i6+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = c0a5ffe3, %l3 = 00000000000000ff
	ldsha	[%i6+%o5]0x89,%l3	! %l3 = ffffffffffffffe3
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff000000, Mem[0000000010001408] = 00000000
	stha	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000

p0_label_462:
!	Mem[0000000030181400] = ffffffff, %l3 = ffffffffffffffe3
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	swap	[%i2+%g0],%l1		! %l1 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010041438] = 00000000
	stb	%l1,[%i1+0x038]		! Mem[0000000010041438] = 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010041430] = 00000000 00ffffff
	std	%l4,[%i1+0x030]		! Mem[0000000010041430] = 00000000 00000000
!	Mem[0000000010041437] = 00000000, %l4 = 0000000000000000
	ldstub	[%i1+0x037],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030001410] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[00000000218000c1] = ff96bf7c
	stb	%l5,[%o3+0x0c1]		! Mem[00000000218000c0] = ff00bf7c
!	Mem[0000000010141410] = 00000000, %l3 = 00000000ffffffff
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000ff000000, Mem[0000000010041439] = 00000000
	stb	%l2,[%i1+0x039]		! Mem[0000000010041438] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = 00000000, %l0 = 0000000000000000
	lduwa	[%i3+0x028]%asi,%l0	! %l0 = 0000000000000000

p0_label_463:
!	Mem[0000000010081410] = ffff0000, %l4 = 0000000000000000
	ldsha	[%i2+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141418] = 000000ffff000000, %l7 = ff3a000000000000
	ldx	[%i5+0x018],%l7		! %l7 = 000000ffff000000
!	Mem[0000000010141410] = ff000000, %l3 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141410] = 000000ff, %f15 = 00ebffe0
	lda	[%i5+%o5]0x88,%f15	! %f15 = 000000ff
!	Mem[0000000030141408] = 000000e3, %l2 = 00000000ff000000
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000e3
!	Mem[0000000010141410] = ff000000, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c141c] = 00ebffe0, %l2 = 00000000000000e3
	lduwa	[%i3+0x01c]%asi,%l2	! %l2 = 0000000000ebffe0
!	Mem[0000000010001428] = 0054276c0000ff00, %f14 = ff0000ff 000000ff
	ldda	[%i0+0x028]%asi,%f14	! %f14 = 0054276c 0000ff00
!	Mem[0000000010081438] = 00000026, %f0  = 000000ff
	ld	[%i2+0x038],%f0 	! %f0 = 00000026
!	Starting 10 instruction Store Burst
!	%l7 = 000000ffff000000, Mem[0000000010001408] = 00000000
	stha	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000

p0_label_464:
!	%l5 = ffffffffffffffff, Mem[0000000010141410] = ff000000
	stwa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff
!	%l2 = 0000000000ebffe0, Mem[00000000100c1400] = 000000ff
	stha	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffe000ff
!	%f10 = ffffffff ffff0000, Mem[0000000010141408] = 00ebffe0 ff0000ff
	stda	%f10,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffff ffff0000
!	%l6 = 00000000, %l7 = ff000000, Mem[0000000030141410] = ff0000ff ffffffff
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 ff000000
!	%l6 = 0000000000000000, Mem[0000000010081410] = 2600ffff0000ffff
	stxa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000000
!	Mem[0000000030181400] = ffffffe3, %l2 = 0000000000ebffe0
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030001410] = ff0000ff, %l4 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000030001400] = 000000e3
	stwa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	Mem[00000000100c1410] = 00000000, %l7 = 000000ffff000000
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l0 = 0000000000000000
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_465:
!	Mem[0000000010101400] = ffa561e3, %l6 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l6	! %l6 = ffffffffffffffe3
!	Mem[0000000030101410] = 00000000, %f4  = ff000000
	lda	[%i4+%o5]0x81,%f4 	! %f4 = 00000000
!	Mem[0000000010001408] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = ff0000ff, %l0 = 0000000000000000
	ldsha	[%i0+%o5]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[00000000100c1400] = 00000000ff00e0ff, %l5 = ffffffffffffffff
	ldxa	[%i3+%g0]0x88,%l5	! %l5 = 00000000ff00e0ff
!	Mem[0000000030181408] = ffff00a5ffffffff, %f10 = ffffffff ffff0000
	ldda	[%i6+%o4]0x81,%f10	! %f10 = ffff00a5 ffffffff
!	Mem[0000000030181408] = ffff00a5, %l3 = 00000000000000ff
	ldsha	[%i6+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141408] = e3000000, %l5 = 00000000ff00e0ff
	ldsba	[%i5+%o4]0x81,%l5	! %l5 = ffffffffffffffe3
!	Mem[00000000100c1410] = 000000ff, %l3 = ffffffffffffffff
	ldsba	[%i3+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1401] = ffe000ff, %l0 = ffffffffffffff00
	ldstub	[%i3+0x001],%l0		! %l0 = 000000e0000000ff

p0_label_466:
!	Mem[0000000010101410] = 00000000, %l1 = 00000000, %l6 = ffffffe3
	add	%i4,0x10,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 0000000000000000
!	%f15 = 0000ff00, Mem[0000000030081400] = 3a0000ff
	sta	%f15,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000ff00
!	%l6 = 0000000000000000, Mem[0000000010101400] = 0000ffffffa561e3
	stxa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l0 = 00000000000000e0
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = ff003a30, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 00000000ff003a30
!	Mem[0000000010081400] = 00000000, %l5 = ffffffffffffffe3
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000010081434] = e361a5ff
	sth	%l2,[%i2+0x034]		! Mem[0000000010081434] = 00ffa5ff
!	%l4 = 00000000ff003a30, Mem[0000000010041410] = 00000000
	stwa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = ff003a30
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ffffffff, %l2 = 00000000000000ff
	ldsha	[%i5+%o5]0x80,%l2	! %l2 = ffffffffffffffff

p0_label_467:
!	Mem[0000000010101420] = e30000ff, %l0 = 0000000000000000
	ldsw	[%i4+0x020],%l0		! %l0 = ffffffffe30000ff
!	Mem[0000000030081410] = ff003a30, %f0  = 00000026
	lda	[%i2+%o5]0x81,%f0 	! %f0 = ff003a30
!	Mem[0000000010041430] = 00000000000000ff, %l5 = 0000000000000000
	ldx	[%i1+0x030],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030001410] = ff0000ff, %l3 = ffffffffffffffff
	lduwa	[%i0+%o5]0x89,%l3	! %l3 = 00000000ff0000ff
!	Mem[0000000030001410] = ff0000ff, %l7 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = ff0000ff, %l3 = 00000000ff0000ff
	lduba	[%i0+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %f25 = 303a0000
	lda	[%i2+%g0]0x80,%f25	! %f25 = ff000000
!	Mem[0000000010181408] = 00ebffff, %l4 = 00000000ff003a30
	ldsha	[%i6+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = ffff0000, %l2 = ffffffffffffffff
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = ffffffffffff0000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010141408] = ffff0000
	stwa	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000

p0_label_468:
!	%l3 = 00000000000000ff, Mem[0000000030181410] = c0a5ffe3
	stha	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = c0a500ff
!	%f5  = c0a5ffe3, Mem[00000000300c1408] = ff3a0000
	sta	%f5 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = c0a5ffe3
!	%l7 = 00000000000000ff, Mem[0000000010081408] = ff000000
	stha	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ff0000
!	Mem[0000000030041408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%f14 = 0054276c, Mem[0000000010001418] = 00000000
	st	%f14,[%i0+0x018]	! Mem[0000000010001418] = 0054276c
!	%l2 = ffff0000, %l3 = 000000ff, Mem[0000000030181408] = ffff00a5 ffffffff
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffff0000 000000ff
!	Mem[0000000010181400] = 3a000000, %l4 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x80,%l4	! %l4 = 0000003a000000ff
!	%l0 = ffffffffe30000ff, Mem[0000000010001408] = 00000000
	stba	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000
!	%l3 = 00000000000000ff, Mem[0000000010181408] = 00ebffff
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 00eb00ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 2600ffffff000000, %l3 = 00000000000000ff
	ldxa	[%i3+%g0]0x89,%l3	! %l3 = 2600ffffff000000

p0_label_469:
!	Mem[0000000030181408] = 0000ffff, %l6 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001400] = 2600ffff, %l3 = 2600ffffff000000
	lduwa	[%i0+%g0]0x88,%l3	! %l3 = 000000002600ffff
!	Mem[0000000030141408] = e3000000, %l3 = 000000002600ffff
	lduwa	[%i5+%o4]0x81,%l3	! %l3 = 00000000e3000000
!	Mem[00000000201c0000] = 00ff367d, %l7 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = 000000e3, %l7 = 00000000000000ff
	ldsba	[%i5+%o4]0x89,%l7	! %l7 = ffffffffffffffe3
!	Mem[00000000201c0000] = 00ff367d, %l6 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000 3a000000, %l2 = ffff0000, %l3 = e3000000
	ldda	[%i3+%o4]0x88,%l2	! %l2 = 000000003a000000 0000000000000000
!	Mem[0000000020800000] = ffff188e, %l3 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010181410] = ff000000 c0a5ffe3, %l2 = 3a000000, %l3 = 0000ffff
	ldda	[%i6+0x010]%asi,%l2	! %l2 = 00000000ff000000 00000000c0a5ffe3
!	Starting 10 instruction Store Burst
!	%f20 = 000000ff 0000003a, Mem[0000000010101430] = 00ff0000 ff000000
	std	%f20,[%i4+0x030]	! Mem[0000000010101430] = 000000ff 0000003a

p0_label_470:
!	Mem[0000000010001400] = 2600ffff, %l2 = 00000000ff000000
	ldstuba	[%i0+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[000000001018142e] = ffff0000
	sth	%l1,[%i6+0x02e]		! Mem[000000001018142c] = ffff0000
!	%l3 = 00000000c0a5ffe3, Mem[0000000030181408] = ffff0000
	stha	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = ffe30000
!	%f28 = 00000000 00000000, Mem[0000000010141410] = ffffffff 6c050000
	stda	%f28,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 00000000
!	Mem[0000000010001408] = ff000000, %l4 = 000000000000003a
	swapa	[%i0+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030181408] = ffe30000, %l2 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010181438] = ff0000ff, %l2 = 000000ff, %l2 = 000000ff
	add	%i6,0x38,%g1
	casa	[%g1]0x80,%l2,%l2	! %l2 = 00000000ff0000ff
!	%l5 = 00000000000000ff, Mem[0000000010041428] = ff000000
	stw	%l5,[%i1+0x028]		! Mem[0000000010041428] = 000000ff
!	%l5 = 00000000000000ff, Mem[0000000021800100] = ffff6996, %asi = 80
	stha	%l5,[%o3+0x100]%asi	! Mem[0000000021800100] = 00ff6996
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = c0a5ffe3, %l0 = ffffffffe30000ff
	lduba	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000c0

p0_label_471:
!	Mem[0000000010141400] = 000000ff, %l0 = 00000000000000c0
	lduha	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 0000ff00, %l2 = 00000000ff0000ff
	lduwa	[%i2+%g0]0x89,%l2	! %l2 = 000000000000ff00
!	Mem[0000000020800000] = ffff188e, %l3 = 00000000c0a5ffe3
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[00000000100c1408] = 0000003a, %l5 = 00000000000000ff
	ldsba	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l3 = 000000000000ffff
	lduba	[%i1+0x009]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = ff000000, %l5 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141408] = e3000000, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffe300
!	Mem[0000000030001408] = 0000ffff, %l7 = ffffffffffffffe3
	lduha	[%i0+%o4]0x89,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030001410] = ff0000ff, %l1 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00000000, %l5 = 00000000000000ff
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_472:
!	%l5 = 0000000000000000, Mem[00000000300c1410] = ffff0000ffff00a5
	stxa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	%f12 = 000052ff ff120000, Mem[0000000010081400] = 000000ff a18c09ff
	stda	%f12,[%i2+%g0]0x88	! Mem[0000000010081400] = 000052ff ff120000
!	%l4 = 00000000ff000000, Mem[0000000030001400] = ff000000
	stba	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%f12 = 000052ff ff120000, Mem[0000000010081400] = ff120000 000052ff
	stda	%f12,[%i2+%g0]0x88	! Mem[0000000010081400] = 000052ff ff120000
!	Mem[0000000010181408] = ff00eb00, %l7 = 000000000000ffff
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 00000000ff00eb00
!	%l0 = ffffe300, %l1 = ff0000ff, Mem[0000000030141400] = 00000000 ffff0000
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffe300 ff0000ff
!	%f22 = 000000ff ff000000, %l1 = 00000000ff0000ff
!	Mem[00000000100c1428] = 0000000000003a30
	add	%i3,0x028,%g1
	stda	%f22,[%g1+%l1]ASI_PST16_PL ! Mem[00000000100c1428] = 000000ffff000000
!	Mem[0000000010141438] = ffffffff, %l3 = 0000000000000000
	swap	[%i5+0x038],%l3		! %l3 = 00000000ffffffff
!	%f28 = 00000000 00000000, Mem[0000000010001400] = ffff0026 ffa561e3
	stda	%f28,[%i0+0x000]%asi	! Mem[0000000010001400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = 000000ffffff0026, %l2 = 000000000000ff00
	ldxa	[%i4+0x018]%asi,%l2	! %l2 = 000000ffffff0026

p0_label_473:
!	Mem[0000000010001404] = 00000000, %l4 = 00000000ff000000
	lduba	[%i0+0x007]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = ffffffff 000000ff, %l2 = ffff0026, %l3 = ffffffff
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff 00000000ffffffff
!	Mem[0000000010101408] = 00000009, %l0 = ffffffffffffe300
	lduba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000009
!	Mem[00000000100c141c] = 00ebffe0, %l1 = 00000000ff0000ff
	lduha	[%i3+0x01e]%asi,%l1	! %l1 = 000000000000ffe0
!	Mem[0000000010041410] = ff003a30, %l2 = 00000000000000ff
	lduba	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000030
!	Mem[0000000010041410] = ff003a30, %l6 = 00000000000000ff
	ldsha	[%i1+%o5]0x88,%l6	! %l6 = 0000000000003a30
!	Mem[00000000300c1400] = 000000ff, %f30 = 00000000
	lda	[%i3+%g0]0x81,%f30	! %f30 = 000000ff
!	Mem[0000000030001400] = 00000000, %l6 = 0000000000003a30
	ldsba	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = ffe30000 000000ff, %l6 = 00000000, %l7 = ff00eb00
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 00000000ffe30000 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 00000000, %l6 = 00000000ffe30000
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff

p0_label_474:
!	%f12 = 000052ff ff120000, Mem[0000000010101408] = 00000009 bb38245c
	stda	%f12,[%i4+%o4]0x88	! Mem[0000000010101408] = 000052ff ff120000
!	%l0 = 0000000000000009, Mem[0000000010001408] = 0000003a
	stwa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000009
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010181410] = ff000000 c0a5ffe3
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 000000ff
!	%l3 = 00000000ffffffff, Mem[0000000030101410] = 00000000
	stba	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	Mem[0000000010001400] = 00000000, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010001400] = 0000000000000000
	stxa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000010001400] = 00000000
	stha	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	%f16 = ff000000 000000ff, %l4 = 0000000000000000
!	Mem[0000000030141400] = ffffe300ff0000ff
	stda	%f16,[%i5+%l4]ASI_PST16_SL ! Mem[0000000030141400] = ffffe300ff0000ff
!	%l2 = 0000000000000030, Mem[0000000010081410] = 00000000
	stba	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000030
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 0000ff00, %l6 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l6	! %l6 = 000000000000ff00

p0_label_475:
!	Mem[0000000030081410] = ff003a30, %l2 = 0000000000000030
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff003a30
!	Mem[0000000020800000] = ffff188e, %l2 = 00000000ff003a30
	lduba	[%o1+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = ff000000 00000000, %l6 = 0000ff00, %l7 = 000000ff
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[00000000201c0000] = 00ff367d, %l5 = 0000000000000000
	lduh	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010081410] = 30000000, %f15 = 0000ff00
	lda	[%i2+%o5]0x80,%f15	! %f15 = 30000000
!	Mem[0000000030041400] = 000000ff, %l6 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141418] = 000000ff ff000000, %l0 = 00000009, %l1 = 0000ffe0
	ldd	[%i5+0x018],%l0		! %l0 = 00000000000000ff 00000000ff000000
!	Mem[0000000010041400] = 00000000, %f21 = 0000003a
	lda	[%i1+%g0]0x88,%f21	! %f21 = 00000000
!	Mem[0000000010041410] = 303a00ff, %l7 = 00000000ff000000
	lduha	[%i1+%o5]0x80,%l7	! %l7 = 000000000000303a
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[00000000211c0001] = ffff0b46, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffff0b46

p0_label_476:
!	%l6 = 000000ff, %l7 = 0000303a, Mem[0000000010181400] = 000000ff ffffffff
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff 0000303a
!	Mem[0000000030181400] = ffffffe3, %l1 = 00000000ff000000
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%f4  = 00000000 c0a5ffe3, %l1 = 00000000000000ff
!	Mem[0000000030141418] = 00000000000005ad
	add	%i5,0x018,%g1
	stda	%f4,[%g1+%l1]ASI_PST16_S ! Mem[0000000030141418] = 00000000c0a5ffe3
!	%l0 = 00000000000000ff, Mem[0000000030101400] = ff000000
	stwa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	%f2  = ffffffff ff000000, Mem[0000000010001408] = 00000009 00000000
	stda	%f2 ,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff ff000000
!	Mem[00000000211c0000] = ffff0b46, %l1 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030141400] = ffffe300, %l0 = 00000000000000ff
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000030081410] = 303a00ff
	stba	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 303a00ff
	membar	#Sync			! Added by membar checker (70)
!	%f20 = 000000ff 00000000, Mem[0000000030041400] = ff000000 000000ff
	stda	%f20,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = ff004fd1, %l6 = 00000000000000ff
	ldsh	[%o3+0x1c0],%l6		! %l6 = ffffffffffffff00

p0_label_477:
!	Mem[0000000030101400] = 000000ff, %l5 = 00000000000000ff
	ldsha	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 209cffff00ebff00, %f12 = 000052ff ff120000
	ldda	[%i4+%o4]0x89,%f12	! %f12 = 209cffff 00ebff00
!	Mem[0000000010101434] = 0000003a, %l6 = ffffffffffffff00
	lduw	[%i4+0x034],%l6		! %l6 = 000000000000003a
!	Mem[0000000030001410] = ff0000ff, %l3 = 00000000ffffffff
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101410] = e3ffffff, %l4 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l4	! %l4 = ffffffffe3ffffff
!	%f1  = ffffffff, Mem[0000000030041400] = 000000ff
	sta	%f1 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff
!	Mem[0000000030041408] = ff000000, %l5 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030041400] = ffffffff, %l5 = 00000000ff000000
	lduha	[%i1+%g0]0x81,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030081400] = 00ff0000, %l1 = 00000000000000ff
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = e3ffffff, %l5 = 000000000000ffff
	swapa	[%i4+%o5]0x88,%l5	! %l5 = 00000000e3ffffff

p0_label_478:
!	%f14 = 0054276c, Mem[0000000030081410] = 303a00ff
	sta	%f14,[%i2+%o5]0x89	! Mem[0000000030081410] = 0054276c
!	%l4 = ffffffffe3ffffff, Mem[0000000030041408] = ff000000
	stba	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = ff000000
!	%f28 = 00000000 00000000, %l7 = 000000000000303a
!	Mem[0000000010101400] = 0000000000000000
	stda	%f28,[%i4+%l7]ASI_PST32_PL ! Mem[0000000010101400] = 0000000000000000
!	Mem[0000000010081434] = 00ffa5ff, %l4 = ffffffffe3ffffff
	swap	[%i2+0x034],%l4		! %l4 = 0000000000ffa5ff
!	%l1 = 0000000000000000, Mem[00000000201c0000] = 00ff367d
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 0000367d
!	%l4 = 0000000000ffa5ff, Mem[0000000010141408] = 00000000
	stha	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000a5ff
!	Mem[0000000010041408] = 000000ff, %l7 = 000000000000303a
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%f4  = 00000000, Mem[0000000010081404] = ff520000
	st	%f4 ,[%i2+0x004]	! Mem[0000000010081404] = 00000000
!	%f0  = ff003a30, Mem[00000000300c1408] = e3ffa5c0
	sta	%f0 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff003a30
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000000000ff, %f30 = 000000ff 00000000
	ldda	[%i0+%g0]0x88,%f30	! %f30 = 00000000 000000ff

p0_label_479:
!	Mem[0000000010041410] = 303a00ff, %l2 = 00000000000000ff
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = 000000000000303a
!	Mem[00000000100c1438] = ffff0026, %f28 = 00000000
	lda	[%i3+0x038]%asi,%f28	! %f28 = ffff0026
!	Mem[0000000010141410] = 0000000000000000, %l3 = ffffffffffffffff
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = ffff0000, %l4 = 0000000000ffa5ff
	ldsba	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = ff000000, %l3 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = ffffffff, %l6 = 000000000000003a
	ldsba	[%i0+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001408] = ffffffff, %l4 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010141408] = ffa50000, %l1 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l1	! %l1 = 00000000ffa50000
!	Mem[0000000030041410] = 000000ff0000003a, %f4  = 00000000 c0a5ffe3
	ldda	[%i1+%o5]0x81,%f4 	! %f4  = 000000ff 0000003a
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = 00009e9b, %l0 = 00000000000000ff
	ldstub	[%o1+0x041],%l0		! %l0 = 00000000000000ff

p0_label_480:
!	Mem[0000000030001410] = ff0000ff, %l6 = ffffffffffffffff
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 00000000ff0000ff
!	%l1 = 00000000ffa50000, Mem[0000000010041408] = 3a300000
	stwa	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = ffa50000
!	Mem[00000000300c1400] = 000000ff, %l2 = 000000000000303a
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%f0  = ff003a30 ffffffff ffffffff ff000000
!	%f4  = 000000ff 0000003a 000000ff 00000000
!	%f8  = 0000ffff 00000000 ffff00a5 ffffffff
!	%f12 = 209cffff 00ebff00 0054276c 30000000
	stda	%f0,[%i0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	%l4 = 000000000000ffff, Mem[00000000211c0000] = ffff0b46, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff0b46
!	%l6 = ff0000ff, %l7 = 000000ff, Mem[00000000100c1410] = ff000000 00000000
	stda	%l6,[%i3+0x010]%asi	! Mem[00000000100c1410] = ff0000ff 000000ff
!	%l4 = 0000ffff, %l5 = e3ffffff, Mem[0000000030081400] = 00ff0000 c0a5ffe3
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000ffff e3ffffff
!	%l7 = 00000000000000ff, Mem[00000000300c1410] = 00000000
	stba	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff000000
	membar	#Sync			! Added by membar checker (71)
!	Mem[0000000010001410] = ff000000, %l6 = 00000000ff0000ff
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ffffffff, %l2 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l2	! %l2 = ffffffffffffffff

p0_label_481:
!	Mem[00000000211c0000] = ffff0b46, %l5 = 00000000e3ffffff
	ldsh	[%o2+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000100c1414] = 000000ff, %l7 = 00000000000000ff
	lduwa	[%i3+0x014]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = 000000ff, %l7 = 00000000000000ff
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041428] = 000000ff, %f24 = 00000000
	ld	[%i1+0x028],%f24	! %f24 = 000000ff
!	Mem[0000000030081400] = ffff0000, %l0 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l0	! %l0 = ffffffffffff0000
!	Mem[00000000100c1400] = ffff00ff, %l1 = 00000000ffa50000
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 000000000000ffff
!	Mem[0000000020800000] = ffff188e, %l7 = 00000000000000ff
	ldsba	[%o1+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001408] = ffff0000, %l6 = 00000000ff000000
	lduha	[%i0+%o4]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010181400] = ff000000, %l2 = ffffffffffffffff
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f16 = ff000000 000000ff, %l2 = ffffffffffffffff
!	Mem[0000000030001400] = 0000000000000000
	stda	%f16,[%i0+%l2]ASI_PST8_SL ! Mem[0000000030001400] = ff000000000000ff

p0_label_482:
!	%f26 = e361a5ff 00000000, Mem[0000000030101410] = 000000ff 2600ffff
	stda	%f26,[%i4+%o5]0x89	! Mem[0000000030101410] = e361a5ff 00000000
!	%l4 = 000000000000ffff, Mem[0000000030001408] = ffff0000
	stha	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = ffff0000
!	%l4 = 0000ffff, %l5 = ffffffff, Mem[0000000010001428] = ffff00a5 ffffffff
	std	%l4,[%i0+0x028]		! Mem[0000000010001428] = 0000ffff ffffffff
!	Mem[00000000100c1408] = 0000003a, %l0 = ffff0000, %l1 = 0000ffff
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 000000000000003a
!	%l2 = ffffffffffffffff, Mem[000000001000143a] = 0054276c, %asi = 80
	stha	%l2,[%i0+0x03a]%asi	! Mem[0000000010001438] = 0054ffff
!	%f12 = 209cffff 00ebff00, %l4 = 000000000000ffff
!	Mem[0000000030001408] = ffff000000000000
	add	%i0,0x008,%g1
	stda	%f12,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030001408] = 00ffeb00ffff9c20
!	%f12 = 209cffff 00ebff00, %l7 = ffffffffffffffff
!	Mem[0000000010141428] = 0000000000000000
	add	%i5,0x028,%g1
	stda	%f12,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010141428] = 00ffeb00ffff9c20
!	Mem[00000000100c1400] = ffff00ff, %l5 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%l1 = 000000000000003a, Mem[00000000300c1410] = ff000000
	stha	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 003a0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 6c275400, %l2 = ffffffffffffffff
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 0000000000006c27

p0_label_483:
!	Mem[0000000030141410] = 00000000, %l5 = 00000000000000ff
	ldsha	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = 00e3ffff, %l3 = 0000000000000000
	ldswa	[%i5+%g0]0x89,%l3	! %l3 = 0000000000e3ffff
!	Mem[0000000030081400] = 0000ffff, %l5 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 0000303a000000ff, %l0 = ffffffffffff0000
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = 0000303a000000ff
!	Mem[0000000010141410] = 00000000, %l2 = 0000000000006c27
	ldswa	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 000012ff, %l1 = 000000000000003a
	ldsb	[%i2+0x002],%l1		! %l1 = 0000000000000012
!	Mem[0000000010101410] = 0000ffff, %l2 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = 0000367d, %l2 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181420] = 0000ffffffffb36b, %l4 = 000000000000ffff
	ldxa	[%i6+0x020]%asi,%l4	! %l4 = 0000ffffffffb36b
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000e3ffff, Mem[0000000010041428] = 000000ff000000ff
	stx	%l3,[%i1+0x028]		! Mem[0000000010041428] = 0000000000e3ffff

p0_label_484:
!	Mem[0000000010081428] = ff000000, %l5 = 00000000, %l7 = ffffffff
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 00000000ff000000
!	%f2  = ffffffff ff000000, %l2 = 0000000000000000
!	Mem[0000000010081430] = 00000000e3ffffff
	add	%i2,0x030,%g1
	stda	%f2,[%g1+%l2]ASI_PST32_P ! Mem[0000000010081430] = 00000000e3ffffff
!	Mem[0000000010041408] = 0000a5ff, %l7 = 00000000ff000000
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 000000000000a5ff
!	Mem[0000000030041410] = ff000000, %l3 = 0000000000e3ffff
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 00000000ff000000
!	%f24 = 000000ff ff000000, Mem[0000000010081430] = 00000000 e3ffffff
	std	%f24,[%i2+0x030]	! Mem[0000000010081430] = 000000ff ff000000
!	Mem[00000000100c1408] = 0000003a, %l3 = ff000000, %l3 = ff000000
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 000000000000003a
!	Mem[0000000010101408] = ff120000, %l4 = 0000ffffffffb36b
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000ff120000
!	%l2 = 0000000000000000, Mem[0000000010081408] = 0000ff00
	stha	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%f18 = 00000000 ffff0000, %l0 = 0000303a000000ff
!	Mem[0000000030081410] = 6c275400ffff9c20
	add	%i2,0x010,%g1
	stda	%f18,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030081410] = 0000ffff00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l4 = 00000000ff120000
	ldswa	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000

p0_label_485:
!	Mem[0000000010141400] = ff000000, %l3 = 000000000000003a
	lduba	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l6 = 000000000000ffff
	lduwa	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = ff0000ff, %l1 = 0000000000000012
	lduwa	[%i3+%o5]0x80,%l1	! %l1 = 00000000ff0000ff
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = 000000ff, %l0 = 0000303a000000ff
	lduha	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000020800000] = ffff188e, %l6 = 0000000000000000
	ldsb	[%o1+0x001],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010101408] = 6bb3ffff ff520000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 000000006bb3ffff 00000000ff520000
	membar	#Sync			! Added by membar checker (72)
!	Mem[0000000010101400] = 00000000 00000000 6bb3ffff ff520000
!	Mem[0000000010101410] = ffff0000 00000000 000000ff ffff0026
!	Mem[0000000010101420] = e30000ff 332e00f0 00ff0000 c0a5ffe3
!	Mem[0000000010101430] = 000000ff 0000003a ff0000ff 00ebffe0
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400
!	Mem[0000000010081418] = 00000000, %l2 = 0000000000000000
	ldub	[%i2+0x019],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = ff0000ff, Mem[0000000010181428] = ffffffff ffff0000
	std	%l0,[%i6+0x028]		! Mem[0000000010181428] = 000000ff ff0000ff

p0_label_486:
!	Mem[0000000030081400] = 0000ffff, %l5 = 00000000ff520000
	ldstuba	[%i2+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%f23 = ff000000, Mem[0000000010081410] = 30000000
	sta	%f23,[%i2+%o5]0x80	! Mem[0000000010081410] = ff000000
!	%f30 = 00000000 000000ff, Mem[0000000030101408] = 00ffeb00 ffff9c20
	stda	%f30,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 000000ff
!	%f16 = ff000000 000000ff 00000000 ffff0000
!	%f20 = 000000ff 00000000 000000ff ff000000
!	%f24 = 000000ff ff000000 e361a5ff 00000000
!	%f28 = ffff0026 00000000 00000000 000000ff
	stda	%f16,[%i6]ASI_COMMIT_S	! Block Store to 0000000030181400
!	Mem[0000000010001408] = ffffffff, %l7 = 0000a5ff, %l3 = 00000000
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000ffffffff
!	%l4 = 000000006bb3ffff, Mem[0000000010141416] = 00000000, %asi = 80
	stha	%l4,[%i5+0x016]%asi	! Mem[0000000010141414] = 0000ffff
!	Mem[0000000030141408] = e3000000, %l5 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 00000000e3000000
	membar	#Sync			! Added by membar checker (73)
!	%l1 = 00000000ff0000ff, Mem[0000000010101400] = 00000000
	stw	%l1,[%i4+%g0]		! Mem[0000000010101400] = ff0000ff
!	Mem[00000000100c1408] = 3a000000, %l7 = 000000000000a5ff
	ldstuba	[%i3+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 303a00ff, %l3 = 00000000ffffffff
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = ffffffffffffffff

p0_label_487:
!	Mem[0000000030181410] = 000000ff, %l7 = 0000000000000000
	lduha	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141420] = ff0005ad, %l3 = ffffffffffffffff
	lduha	[%i5+0x020]%asi,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010181400] = ff000000, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000020800000] = ffff188e, %l4 = 000000006bb3ffff
	lduba	[%o1+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101420] = e30000ff 332e00f0, %l4 = 000000ff, %l5 = e3000000
	ldda	[%i4+0x020]%asi,%l4	! %l4 = 00000000e30000ff 00000000332e00f0
!	Mem[0000000010041410] = 303a00ff, %l1 = 00000000ff0000ff
	lduw	[%i1+%o5],%l1		! %l1 = 00000000303a00ff
!	Mem[0000000010041408] = 000000ff, %l5 = 00000000332e00f0
	lduba	[%i1+0x009]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = ff000000, %l0 = 00000000000000ff
	lduha	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = 000000ff, %l5 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 00000000, %l3 = 000000000000ff00
	ldstuba	[%i4+%o5]0x81,%l3	! %l3 = 00000000000000ff

p0_label_488:
!	%l6 = ffffffff, %l7 = 00000000, Mem[0000000010101408] = 6bb3ffff ff520000
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffff 00000000
!	%l7 = 0000000000000000, Mem[0000000030181400] = ff000000000000ff
	stxa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000000
!	Mem[0000000030001408] = 00ffeb00, %l7 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = ffff00ff, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 00000000ffff00ff
!	%l3 = 0000000000000000, Mem[0000000010181404] = 3a300000, %asi = 80
	stwa	%l3,[%i6+0x004]%asi	! Mem[0000000010181404] = 00000000
!	%f16 = ff000000 000000ff, %l1 = 00000000303a00ff
!	Mem[0000000030101408] = 00000000000000ff
	add	%i4,0x008,%g1
	stda	%f16,[%g1+%l1]ASI_PST8_S ! Mem[0000000030101408] = ff000000000000ff
!	%l4 = 00000000e30000ff, Mem[0000000030101410] = ff000000ffa561e3
	stxa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000e30000ff
!	%l6 = ffffffffffffffff, Mem[0000000030181400] = 00000000
	stwa	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff
!	%f20 = 000000ff, Mem[0000000010141438] = 00000000
	sta	%f20,[%i5+0x038]%asi	! Mem[0000000010141438] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 0000367d, %l2 = 00000000ff000000
	ldsb	[%o0+0x001],%l2		! %l2 = 0000000000000000

p0_label_489:
!	Mem[0000000010081400] = 000012ff00000000, %f28 = ffff0026 00000000
	ldda	[%i2+%g0]0x80,%f28	! %f28 = 000012ff 00000000
!	Mem[0000000010181410] = 00000000, %f12 = 3a000000
	ld	[%i6+%o5],%f12	! %f12 = 00000000
!	Mem[0000000030181408] = 00000000, %l4 = 00000000e30000ff
	ldsba	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1428] = 000000ff, %l7 = 00000000ffff00ff
	lduba	[%i3+0x028]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = 00000000 ffff0000, %l0 = 00000000, %l1 = 303a00ff
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000 00000000ffff0000
!	Mem[000000001004142c] = 00e3ffff, %f15 = ff0000ff
	lda	[%i1+0x02c]%asi,%f15	! %f15 = 00e3ffff
!	Mem[0000000030181408] = 00000000, %l0 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = 0000ffff, %l0 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001000140c] = ff000000, %l3 = 0000000000000000
	ldswa	[%i0+0x00c]%asi,%l3	! %l3 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010101420] = e30000ff332e00f0
	stx	%l2,[%i4+0x020]		! Mem[0000000010101420] = 0000000000000000

p0_label_490:
!	Mem[0000000030041400] = ffffffff, %l6 = ffffffffffffffff
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030041400] = ffffffff, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 00000000ffffffff
!	%f22 = 000000ff, Mem[0000000010181428] = 000000ff
	st	%f22,[%i6+0x028]	! Mem[0000000010181428] = 000000ff
!	%f10 = e3ffa5c0 0000ff00, %l7 = 00000000ffffffff
!	Mem[0000000010041408] = 000000ffc0a5ffe3
	add	%i1,0x008,%g1
	stda	%f10,[%g1+%l7]ASI_PST32_P ! Mem[0000000010041408] = e3ffa5c00000ff00
!	%f12 = 00000000 ff000000, Mem[0000000030041400] = 00000000 00000000
	stda	%f12,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 ff000000
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030081410] = 0000ffff 00000000
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 000000ff
!	Code Fragment 4
p0_fragment_20:
!	%l0 = 0000000000000000
	setx	0xfd2eb3f7b3ccc5fd,%g7,%l0 ! %l0 = fd2eb3f7b3ccc5fd
!	%l1 = 00000000ffff0000
	setx	0x63dc684816113ded,%g7,%l1 ! %l1 = 63dc684816113ded
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fd2eb3f7b3ccc5fd
	setx	0x9b43e89f9a5c9a4a,%g7,%l0 ! %l0 = 9b43e89f9a5c9a4a
!	%l1 = 63dc684816113ded
	setx	0x3c64d5c8497d6134,%g7,%l1 ! %l1 = 3c64d5c8497d6134
!	Mem[000000001008143c] = ff00a5ff, %l6 = 00000000ffffffff, %asi = 80
	swapa	[%i2+0x03c]%asi,%l6	! %l6 = 00000000ff00a5ff
!	%l3 = ffffffffff000000, Mem[0000000030181410] = ff000000
	stha	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00003a00, %l5 = 00000000000000ff
	ldsba	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000

p0_label_491:
!	Mem[0000000030181400] = ffffffff, %f22 = 000000ff
	lda	[%i6+%g0]0x89,%f22	! %f22 = ffffffff
!	Mem[0000000010001400] = 303a00ff, %l0 = 9b43e89f9a5c9a4a
	lduha	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141400] = ffffe300ff0000ff, %f30 = 00000000 000000ff
	ldda	[%i5+%g0]0x81,%f30	! %f30 = ffffe300 ff0000ff
!	Mem[0000000010181408] = 0000ffff, %l6 = 00000000ff00a5ff
	lduba	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = ff000000, %l6 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 3a0000ff, %l2 = 0000000000000000
	ldsha	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101408] = ffffffff, %l6 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = ff0000ff000000ff, %f22 = ffffffff ff000000
	ldda	[%i3+%o5]0x80,%f22	! %f22 = ff0000ff 000000ff
!	Mem[00000000201c0000] = 0000367d, %l3 = ffffffffff000000
	ldsba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = 00ff9e9b, %l5 = 0000000000000000
	ldstub	[%o1+0x040],%l5		! %l5 = 00000000000000ff

p0_label_492:
!	%l2 = 00000000000000ff, Mem[0000000010001420] = 0000ffff
	sth	%l2,[%i0+0x020]		! Mem[0000000010001420] = 00ffffff
!	%l2 = 00000000000000ff, Mem[0000000010081410] = 000000ff
	stba	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	%l6 = 000000ff, %l7 = ffffffff, Mem[0000000030001408] = ffffeb00 ffff9c20
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff ffffffff
!	%l7 = 00000000ffffffff, Mem[0000000030081408] = ffa50000
	stha	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = ffff0000
!	Mem[0000000030181410] = 000000ff, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = 000000ff, %l3 = 00000000000000ff
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010181400] = ff000000
	stba	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000000
!	%f24 = 000000ff ff000000, %l4 = 0000000000000000
!	Mem[0000000010041410] = 303a00ff00000000
	add	%i1,0x010,%g1
	stda	%f24,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010041410] = 303a00ff00000000
!	%l4 = 0000000000000000, Mem[0000000010081410] = 000000ff
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000

p0_label_493:
!	Mem[0000000010141408] = 0000a5ff, %l6 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l6	! %l6 = 000000000000a5ff
!	Mem[0000000010181408] = ffff0000, %l7 = 00000000ffffffff
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = ff0000ff 0000003a, %l0 = 000000ff, %l1 = 497d6134
	ldd	[%i0+%o5],%l0		! %l0 = 00000000ff0000ff 000000000000003a
!	Mem[00000000100c1434] = 30ff0000, %l3 = 00000000000000ff
	ldsba	[%i3+0x036]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l2 = 00000000000000ff
	lduwa	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1428] = 000000ff, %l7 = 0000000000000000
	ldsb	[%i3+0x028],%l7		! %l7 = 0000000000000000
!	Mem[0000000010001408] = ffffffff, %l7 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101400] = ff0000ff, %l2 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181434] = ff120000, %l0 = 00000000ff0000ff
	ldswa	[%i6+0x034]%asi,%l0	! %l0 = ffffffffff120000
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000003a, Mem[000000001018142c] = ff0000ff
	stw	%l1,[%i6+0x02c]		! Mem[000000001018142c] = 0000003a

p0_label_494:
!	%f3  = ffffb36b, Mem[00000000100c141c] = 00ebffe0
	st	%f3 ,[%i3+0x01c]	! Mem[00000000100c141c] = ffffb36b
!	%f16 = ff000000 000000ff 00000000 ffff0000
!	%f20 = 000000ff 00000000 ff0000ff 000000ff
!	%f24 = 000000ff ff000000 e361a5ff 00000000
!	%f28 = 000012ff 00000000 ffffe300 ff0000ff
	stda	%f16,[%i0]ASI_BLK_SL	! Block Store to 0000000030001400
!	Mem[0000000030141410] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (74)
!	%f0  = 00000000 00000000 000052ff ffffb36b
!	%f4  = 00000000 0000ffff 2600ffff ff000000
!	%f8  = f0002e33 ff0000e3 e3ffa5c0 0000ff00
!	%f12 = 00000000 ff000000 e0ffeb00 00e3ffff
	stda	%f0,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	Mem[0000000020800001] = ffff188e, %l2 = 0000000000000000
	ldstub	[%o1+0x001],%l2		! %l2 = 000000ff000000ff
!	%f18 = 00000000 ffff0000, Mem[0000000030141410] = 000000ff ff000000
	stda	%f18,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 ffff0000
!	%l4 = 0000000000000000, Mem[0000000030001410] = 0000ffff
	stwa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	Mem[0000000010141408] = ffa50000, %l7 = ffffffffffffffff
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 00000000ffa50000
!	%l3 = 0000000000000000, Mem[0000000030001408] = 000052ffffffb36b
	stxa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000000000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000010001400] = 303a00ff, %f30 = ffffe300
	lda	[%i0+%g0]0x88,%f30	! %f30 = 303a00ff

p0_label_495:
!	Mem[0000000030181410] = 00000000, %l5 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[000000001018140c] = ff0000ff, %l2 = 00000000000000ff
	lduwa	[%i6+0x00c]%asi,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000030081410] = 00000000, %l7 = 00000000ffa50000
	ldsha	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081424] = 625a63ff, %f11 = 0000ff00
	ld	[%i2+0x024],%f11	! %f11 = 625a63ff
!	Mem[0000000010141410] = 00000000, %f23 = 000000ff
	lda	[%i5+%o5]0x80,%f23	! %f23 = 00000000
!	Mem[0000000010181410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i6+0x010]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = ffffe300, %l0 = ffffffffff120000
	lduba	[%i1+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041410] = ffffe300, %l3 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030081408] = ffff0000, %f11 = 625a63ff
	lda	[%i2+%o4]0x81,%f11	! %f11 = ffff0000
!	Starting 10 instruction Store Burst
!	%f20 = 000000ff 00000000, Mem[0000000010101408] = ffffffff 00000000
	stda	%f20,[%i4+0x008]%asi	! Mem[0000000010101408] = 000000ff 00000000

p0_label_496:
!	%l2 = ff0000ff, %l3 = 0000ffff, Mem[0000000030081408] = ffff0000 e361a5ff
	stda	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = ff0000ff 0000ffff
!	Mem[000000001008143c] = ffffffff, %l7 = 00000000, %l0 = 000000ff
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 00000000ffffffff
!	%l6 = 000000000000a5ff, Mem[00000000100c1400] = 00000000
	stba	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	Mem[00000000100c1410] = ff0000ff, %l3 = 000000000000ffff
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 00000000ff0000ff
!	%l7 = 0000000000000000, Mem[0000000030081408] = ff0000ff
	stha	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000000
!	%l0 = ffffffff, %l1 = 0000003a, Mem[0000000010001438] = 0054ffff 30000000
	std	%l0,[%i0+0x038]		! Mem[0000000010001438] = ffffffff 0000003a
!	%l6 = 000000000000a5ff, Mem[0000000010041410] = ff003a30
	stwa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000a5ff
!	%l7 = 0000000000000000, Mem[0000000010181410] = ff00000000000000
	stxa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	%l6 = 000000000000a5ff, Mem[0000000010181410] = 00000000
	stba	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 000000ff, %l6 = 000000000000a5ff
	lduwa	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_497:
!	Mem[00000000100c1400] = 00000000000000ff, %f8  = f0002e33 ff0000e3
	ldda	[%i3+%g0]0x88,%f8 	! %f8  = 00000000 000000ff
!	Mem[00000000211c0000] = ffff0b46, %l1 = 000000000000003a
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030101400] = 000000ff, %l0 = 00000000ffffffff
	ldsha	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l5 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101414] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i4+0x016]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001418] = 000000ff, %l3 = 00000000ff0000ff
	ldsha	[%i0+0x01a]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000201c0000] = 0000367d, %l4 = 0000000000000000
	lduh	[%o0+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010101420] = 00000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldd	[%i4+0x020],%l4		! %l4 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[0000000030001410] = 00000000
	stwa	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffffff

p0_label_498:
!	Mem[0000000010041438] = 0000000000000097, %l3 = 00000000000000ff, %l6 = 0000000000000000
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = 0000000000000097
!	%l2 = 00000000ff0000ff, Mem[0000000030101400] = ff000000
	stwa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = ff0000ff
!	%l6 = 0000000000000097, Mem[000000001014142c] = ffff9c20
	stw	%l6,[%i5+0x02c]		! Mem[000000001014142c] = 00000097
!	%l5 = 0000000000000000, Mem[0000000030141408] = 303a000000000000
	stxa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000
!	Mem[00000000100c1418] = 625a63ff, %l5 = 0000000000000000
	ldstub	[%i3+0x018],%l5		! %l5 = 00000062000000ff
!	%l2 = ff0000ff, %l3 = 000000ff, Mem[0000000030001400] = 00000000 00000000
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ff0000ff 000000ff
!	Mem[0000000030101408] = 000000ff, %l1 = ffffffffffffffff
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l6 = 0000000000000097, Mem[0000000010141434] = 00000000, %asi = 80
	stba	%l6,[%i5+0x034]%asi	! Mem[0000000010141434] = 97000000
!	%l2 = 00000000ff0000ff, Mem[00000000100c1408] = 3a0000ff
	stha	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 3a0000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (76)
!	Mem[0000000010001400] = ff003a30 ffffffff ffffffff ff000000
!	Mem[0000000010001410] = ff0000ff 0000003a 000000ff 00000000
!	Mem[0000000010001420] = 00ffffff 00000000 0000ffff ffffffff
!	Mem[0000000010001430] = 209cffff 00ebff00 ffffffff 0000003a
	ldda	[%i0]ASI_BLK_PL,%f0	! Block Load from 0000000010001400

p0_label_499:
!	Mem[00000000100c1400] = ff00000000000000, %l7 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l7	! %l7 = ff00000000000000
!	Mem[0000000010001400] = 303a00ff, %l6 = 0000000000000097
	ldsha	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141400] = 00e3ffff, %l5 = 0000000000000062
	lduba	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001410] = ff0000ff, %l3 = 00000000000000ff
	lduha	[%i0+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081408] = 000000002600ffff, %l0 = 0000000000000000
	ldxa	[%i2+%o4]0x80,%l0	! %l0 = 000000002600ffff
!	Mem[00000000300c1408] = ff003a30, %l7 = ff00000000000000
	ldswa	[%i3+%o4]0x89,%l7	! %l7 = ffffffffff003a30
!	Mem[00000000218000c0] = ff00bf7c, %l7 = ffffffffff003a30
	lduba	[%o3+0x0c0]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081400] = 000012ff00000000, %f24 = 000000ff ff000000
	ldd	[%i2+%g0],%f24		! %f24 = 000012ff 00000000
!	Mem[0000000030041410] = ffffe300, %l2 = 00000000ff0000ff
	lduba	[%i1+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (77)
!	%f18 = 00000000 ffff0000, Mem[0000000010001418] = 000000ff 00000000
	std	%f18,[%i0+0x018]	! Mem[0000000010001418] = 00000000 ffff0000

p0_label_500:
!	%l6 = 00000000000000ff, Mem[0000000010101428] = 00ff0000c0a5ffe3, %asi = 80
	stxa	%l6,[%i4+0x028]%asi	! Mem[0000000010101428] = 00000000000000ff
!	Mem[00000000100c1435] = 30ff0000, %l5 = 00000000000000ff
	ldstuba	[%i3+0x035]%asi,%l5	! %l5 = 000000ff000000ff
!	%f27 = 00000000, Mem[0000000010141434] = 97000000
	sta	%f27,[%i5+0x034]%asi	! Mem[0000000010141434] = 00000000
!	%l3 = 00000000000000ff, Mem[00000000100c1400] = 000000ff
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	%f8  = 00000000 ffffff00, %l7 = 00000000000000ff
!	Mem[0000000030001400] = ff0000ff000000ff
	stda	%f8,[%i0+%l7]ASI_PST32_S ! Mem[0000000030001400] = 00000000ffffff00
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010141410] = 00000000 ffff0000
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff 000000ff
!	Mem[0000000010041410] = ffa50000, %l2 = 00000000000000ff
	ldstuba	[%i1+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030101410] = 00000000, %l7 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%f12 = 00ffeb00 ffff9c20, %l0 = 000000002600ffff
!	Mem[00000000100c1410] = ffff0000000000ff
	add	%i3,0x010,%g1
	stda	%f12,[%g1+%l0]ASI_PST32_PL ! Mem[00000000100c1410] = 209cffff00ebff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000ff, %f4  = 3a000000
	ld	[%i5+%g0],%f4 	! %f4 = 000000ff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	ldsba	[%i1+0x031]%asi,%l4
	nop
	lduwa	[%i4+0x010]%asi,%l6
	fsqrts	%f21,%f31
	lda	[%i2+0x028]%asi,%l2
	umul	%l2,%l6,%l6
	nop
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000002600ffff
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
	cmp	%l3,%g2			! %l3 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xffffb681,%g2
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
	cmp	%l0,%l1			! %f0  should be ffffffff 303a00ff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 000000ff ffffffff
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 000000ff ff0000ff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 ff000000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 ffffff00
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be ffffffff ffff0000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00ffeb00 ffff9c20
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 3a000000 ffffffff
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ff000000 000000ff
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 ffff0000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 000000ff 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ff0000ff 00000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 000012ff 00000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be e361a5ff 00000000
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 000012ff 00000000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 303a00ff ff0000ff
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
	subc	%l0,%l2,%l6
	nop
	mulx	%l0,0x7d7,%l7
	nop
	done

p0_trap1o:
	subc	%l0,%l2,%l6
	nop
	mulx	%l0,0x7d7,%l7
	nop
	done


p0_trap2e:
	stba	%l2,[%i4+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010101400]
	fdivs	%f2 ,%f13,%f8 
	or	%l6,-0x731,%l5
	stba	%l5,[%i5+%o5]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010141410]
	sdivx	%l6,0x2fa,%l2
	addc	%l5,0x89b,%l4
	andn	%l5,%l6,%l6
	done

p0_trap2o:
	stba	%l2,[%o4+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010101400]
	fdivs	%f2 ,%f13,%f8 
	or	%l6,-0x731,%l5
	stba	%l5,[%o5+%i5]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010141410]
	sdivx	%l6,0x2fa,%l2
	addc	%l5,0x89b,%l4
	andn	%l5,%l6,%l6
	done


p0_trap3e:
	sub	%l5,-0x353,%l1
	subc	%l6,-0xa2d,%l7
	orn	%l2,0x57e,%l1
	or	%l0,-0xc6b,%l3
	done

p0_trap3o:
	sub	%l5,-0x353,%l1
	subc	%l6,-0xa2d,%l7
	orn	%l2,0x57e,%l1
	or	%l0,-0xc6b,%l3
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
	ldx	[%g1+0x000],%l0		! %l0 = 5c9bef14a0b573a2
	ldx	[%g1+0x008],%l1		! %l1 = 629541283d3c8bb8
	ldx	[%g1+0x010],%l2		! %l2 = 54b71c60cf8b7376
	ldx	[%g1+0x018],%l3		! %l3 = 3e216532d66e27d0
	ldx	[%g1+0x020],%l4		! %l4 = 67eb8ae084b1d35a
	ldx	[%g1+0x028],%l5		! %l5 = 2dd2897a290ada93
	ldx	[%g1+0x030],%l6		! %l6 = 7adff5a68838f659
	ldx	[%g1+0x038],%l7		! %l7 = 069d14127ddcd4d4

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
	or	%l2,%l1,%l2
	or	%l6,%l7,%l5
	jmpl	%o7,%g0
	stb	%l4,[%i6+0x03d]		! Mem[000000001018143d]
p0_near_0_he:
	ld	[%i1+0x01c],%f18	! Mem[000000001004141c]
	mulx	%l5,%l6,%l0
	fstoi	%f28,%f26
	addc	%l3,%l1,%l2
	udivx	%l1,0x3ad,%l7
	mulx	%l5,0xd37,%l6
	jmpl	%o7,%g0
	fdtos	%f16,%f19
near0_b2b_h:
	fitod	%f17,%f26
	umul	%l3,%l7,%l3
	xor	%l7,-0x5ca,%l2
	add	%l6,-0x78d,%l2
	fstod	%f28,%f28
	jmpl	%o7,%g0
	fcmps	%fcc3,%f31,%f18
near0_b2b_l:
	sub	%l6,%l2,%l4
	fdtoi	%f8 ,%f2 
	fdivs	%f4 ,%f14,%f8 
	fstoi	%f10,%f5 
	add	%l4,%l1,%l3
	jmpl	%o7,%g0
	mulx	%l3,0xa2b,%l1
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	ldx	[%i3+0x010],%l1		! Mem[00000000100c1410]
	fsubs	%f0 ,%f3 ,%f7 
	xnor	%l1,0x6e1,%l2
	fadds	%f6 ,%f8 ,%f12
	stw	%l6,[%i2+0x030]		! Mem[0000000010081430]
	xor	%l3,%l5,%l6
	fsqrts	%f4 ,%f14
	jmpl	%o7,%g0
	swap	[%i1+0x01c],%l4		! Mem[000000001004141c]
p0_near_1_he:
	ldsw	[%i6+0x018],%l7		! Mem[0000000010181418]
	addc	%l2,0x121,%l7
	ldx	[%i5+0x018],%l5		! Mem[0000000010141418]
	st	%f19,[%i2+0x000]	! Mem[0000000010081400]
	and	%l3,%l6,%l2
	jmpl	%o7,%g0
	xor	%l0,%l5,%l4
near1_b2b_h:
	fadds	%f21,%f27,%f16
	fdtos	%f18,%f25
	jmpl	%o7,%g0
	udivx	%l7,%l1,%l6
near1_b2b_l:
	sub	%l7,0x81b,%l1
	subc	%l4,0x57f,%l1
	jmpl	%o7,%g0
	fdtos	%f10,%f4 
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	st	%f13,[%i1+0x008]	! Mem[0000000010041408]
	jmpl	%o7,%g0
	lduh	[%i2+0x012],%l7		! Mem[0000000010081412]
p0_near_2_he:
	fadds	%f31,%f24,%f19
	lduh	[%i0+0x024],%l7		! Mem[0000000010001424]
	jmpl	%o7,%g0
	smul	%l3,-0xbd8,%l5
near2_b2b_h:
	sdivx	%l2,%l5,%l3
	fdivs	%f27,%f21,%f29
	jmpl	%o7,%g0
	fitos	%f30,%f29
near2_b2b_l:
	fitod	%f3 ,%f0 
	addc	%l2,%l0,%l6
	jmpl	%o7,%g0
	or	%l7,%l6,%l7
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	fsubs	%f8 ,%f7 ,%f4 
	jmpl	%o7,%g0
	std	%f8 ,[%i5+0x030]	! Mem[0000000010141430]
p0_near_3_he:
	sdivx	%l1,-0x8f3,%l4
	jmpl	%o7,%g0
	sub	%l0,%l4,%l5
near3_b2b_h:
	fsubs	%f25,%f22,%f18
	fadds	%f22,%f24,%f21
	fcmps	%fcc2,%f20,%f30
	xor	%l5,%l6,%l0
	addc	%l3,-0x483,%l7
	addc	%l1,0x132,%l3
	fsqrts	%f23,%f20
	jmpl	%o7,%g0
	fmuls	%f28,%f24,%f25
near3_b2b_l:
	fadds	%f0 ,%f13,%f3 
	sdivx	%l6,0x8b7,%l1
	smul	%l4,%l4,%l0
	fdtos	%f12,%f15
	orn	%l0,%l1,%l3
	fstod	%f7 ,%f8 
	subc	%l2,%l1,%l6
	jmpl	%o7,%g0
	fcmps	%fcc0,%f0 ,%f6 
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	subc	%l5,%l6,%l5
	jmpl	%o7,%g0
	ldub	[%i3+0x00f],%l1		! Mem[00000000100c140f]
p0_far_0_lem:
	subc	%l5,%l6,%l5
	membar	#Sync
	jmpl	%o7,%g0
	ldub	[%i3+0x00f],%l1		! Mem[00000000100c140f]
p0_far_0_he:
	andn	%l6,0x523,%l6
	andn	%l0,%l4,%l3
	stw	%l4,[%i5+0x000]		! Mem[0000000010141400]
	ld	[%i5+0x03c],%f17	! Mem[000000001014143c]
	jmpl	%o7,%g0
	fdivs	%f22,%f22,%f25
p0_far_0_hem:
	andn	%l6,0x523,%l6
	andn	%l0,%l4,%l3
	membar	#Sync
	stw	%l4,[%i5+0x000]		! Mem[0000000010141400]
	ld	[%i5+0x03c],%f17	! Mem[000000001014143c]
	jmpl	%o7,%g0
	fdivs	%f22,%f22,%f25
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	xor	%l3,%l7,%l0
	fdivs	%f26,%f22,%f28
	fadds	%f25,%f30,%f26
	fstod	%f22,%f30
	fdtoi	%f18,%f23
	andn	%l3,-0x5e2,%l5
	nop
	jmpl	%o7,%g0
	xnor	%l4,%l0,%l2
far0_b2b_l:
	sub	%l5,-0x916,%l1
	fsqrts	%f11,%f1 
	fdtos	%f0 ,%f8 
	fdtoi	%f8 ,%f15
	smul	%l0,-0x1dd,%l4
	fadds	%f4 ,%f6 ,%f12
	fdivs	%f10,%f13,%f1 
	jmpl	%o7,%g0
	fstoi	%f12,%f1 
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fitod	%f11,%f0 
	ldsw	[%i0+0x034],%l1		! Mem[0000000010001434]
	st	%f8 ,[%i0+0x028]	! Mem[0000000010001428]
	ldsb	[%i3+0x023],%l7		! Mem[00000000100c1423]
	ldsb	[%i0+0x03e],%l5		! Mem[000000001000143e]
	ldsw	[%i1+0x038],%l0		! Mem[0000000010041438]
	jmpl	%o7,%g0
	udivx	%l1,0x63b,%l0
p0_far_1_lem:
	fitod	%f11,%f0 
	membar	#Sync
	ldsw	[%i0+0x034],%l1		! Mem[0000000010001434]
	st	%f8 ,[%i0+0x028]	! Mem[0000000010001428]
	ldsb	[%i3+0x023],%l7		! Mem[00000000100c1423]
	ldsb	[%i0+0x03e],%l5		! Mem[000000001000143e]
	ldsw	[%i1+0x038],%l0		! Mem[0000000010041438]
	jmpl	%o7,%g0
	udivx	%l1,0x63b,%l0
p0_far_1_he:
	swap	[%i3+0x01c],%l4		! Mem[00000000100c141c]
	or	%l3,%l3,%l2
	jmpl	%o7,%g0
	fdtos	%f20,%f28
p0_far_1_hem:
	membar	#Sync
	swap	[%i3+0x01c],%l4		! Mem[00000000100c141c]
	or	%l3,%l3,%l2
	jmpl	%o7,%g0
	fdtos	%f20,%f28
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	jmpl	%o7,%g0
	fmuls	%f31,%f27,%f23
	jmpl	%o7,%g0
	nop
far1_b2b_l:
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	fstod	%f15,%f4 
	smul	%l4,-0x828,%l1
	jmpl	%o7,%g0
	ldstub	[%o1+0x001],%l3		! Mem[0000000020800001]
p0_far_2_lem:
	fstod	%f15,%f4 
	smul	%l4,-0x828,%l1
	jmpl	%o7,%g0
	ldstub	[%o1+0x001],%l3		! Mem[0000000020800001]
p0_far_2_he:
	stb	%l1,[%i1+0x017]		! Mem[0000000010041417]
	fdtos	%f26,%f19
	smul	%l0,0xdf8,%l1
	ldx	[%i2+0x008],%l5		! Mem[0000000010081408]
	st	%f20,[%i3+0x02c]	! Mem[00000000100c142c]
	jmpl	%o7,%g0
	fitos	%f31,%f25
p0_far_2_hem:
	membar	#Sync
	stb	%l1,[%i1+0x017]		! Mem[0000000010041417]
	fdtos	%f26,%f19
	smul	%l0,0xdf8,%l1
	ldx	[%i2+0x008],%l5		! Mem[0000000010081408]
	st	%f20,[%i3+0x02c]	! Mem[00000000100c142c]
	jmpl	%o7,%g0
	fitos	%f31,%f25
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fitos	%f20,%f21
	fsubs	%f28,%f23,%f18
	add	%l2,-0xa78,%l2
	addc	%l7,0xe37,%l2
	jmpl	%o7,%g0
	smul	%l2,%l1,%l3
far2_b2b_l:
	smul	%l6,0xa13,%l5
	addc	%l0,-0xc0a,%l0
	andn	%l4,%l1,%l7
	fitos	%f13,%f15
	jmpl	%o7,%g0
	fadds	%f0 ,%f15,%f12
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	ld	[%i0+0x028],%f1 	! Mem[0000000010001428]
	lduh	[%i6+0x016],%l4		! Mem[0000000010181416]
	subc	%l7,0x337,%l7
	fdtoi	%f6 ,%f7 
	ldsh	[%i1+0x016],%l1		! Mem[0000000010041416]
	xnor	%l0,0x220,%l6
	jmpl	%o7,%g0
	xor	%l3,%l7,%l5
p0_far_3_lem:
	membar	#Sync
	ld	[%i0+0x028],%f1 	! Mem[0000000010001428]
	lduh	[%i6+0x016],%l4		! Mem[0000000010181416]
	subc	%l7,0x337,%l7
	fdtoi	%f6 ,%f7 
	ldsh	[%i1+0x016],%l1		! Mem[0000000010041416]
	xnor	%l0,0x220,%l6
	jmpl	%o7,%g0
	xor	%l3,%l7,%l5
p0_far_3_he:
	fdtoi	%f28,%f16
	jmpl	%o7,%g0
	ldsh	[%i0+0x000],%l1		! Mem[0000000010001400]
p0_far_3_hem:
	fdtoi	%f28,%f16
	membar	#Sync
	jmpl	%o7,%g0
	ldsh	[%i0+0x000],%l1		! Mem[0000000010001400]
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	jmpl	%o7,%g0
	fitos	%f31,%f21
	jmpl	%o7,%g0
	nop
far3_b2b_l:
	jmpl	%o7,%g0
	sdivx	%l6,-0xcce,%l7
	jmpl	%o7,%g0
	nop
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	or	%l4,%l0,%l5
	stx	%l1,[%i2+0x020]		! Mem[0000000010081420]
	jmpl	%g6+8,%g0
	stb	%l2,[%i0+0x021]		! Mem[0000000010001421]
p0_call_0_le:
	retl
	stb	%l4,[%i3+0x014]		! Mem[00000000100c1414]
p0_jmpl_0_lo:
	or	%l4,%l0,%l5
	stx	%l1,[%o2+0x020]		! Mem[0000000010081420]
	jmpl	%g6+8,%g0
	stb	%l2,[%o0+0x021]		! Mem[0000000010001421]
p0_call_0_lo:
	retl
	stb	%l4,[%o3+0x014]		! Mem[00000000100c1414]
p0_jmpl_0_he:
	jmpl	%g6+8,%g0
	andn	%l7,%l2,%l3
p0_call_0_he:
	retl
	lduw	[%i2+0x000],%l1		! Mem[0000000010081400]
p0_jmpl_0_ho:
	jmpl	%g6+8,%g0
	andn	%l7,%l2,%l3
p0_call_0_ho:
	retl
	lduw	[%o2+0x000],%l1		! Mem[0000000010081400]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	mulx	%l4,%l4,%l5
	smul	%l0,%l4,%l2
	std	%f8 ,[%i5+0x030]	! Mem[0000000010141430]
	stb	%l6,[%i2+0x03d]		! Mem[000000001008143d]
	jmpl	%g6+8,%g0
	andn	%l7,%l1,%l3
p0_call_1_le:
	fmuls	%f5 ,%f11,%f6 
	fdtos	%f2 ,%f5 
	retl
	andn	%l2,-0x048,%l6
p0_jmpl_1_lo:
	mulx	%l4,%l4,%l5
	smul	%l0,%l4,%l2
	std	%f8 ,[%o5+0x030]	! Mem[0000000010141430]
	stb	%l6,[%o2+0x03d]		! Mem[000000001008143d]
	jmpl	%g6+8,%g0
	andn	%l7,%l1,%l3
p0_call_1_lo:
	fmuls	%f5 ,%f11,%f6 
	fdtos	%f2 ,%f5 
	retl
	andn	%l2,-0x048,%l6
p0_jmpl_1_he:
	sdivx	%l7,%l4,%l0
	xnor	%l5,-0x76a,%l7
	ldsb	[%i1+0x02b],%l5		! Mem[000000001004142b]
	stb	%l1,[%i5+0x026]		! Mem[0000000010141426]
	fstoi	%f18,%f28
	std	%l4,[%i0+0x010]		! Mem[0000000010001410]
	fitos	%f24,%f18
	jmpl	%g6+8,%g0
	ldsw	[%i4+0x02c],%l4		! Mem[000000001010142c]
p0_call_1_he:
	retl
	udivx	%l0,-0xfc1,%l0
p0_jmpl_1_ho:
	sdivx	%l7,%l4,%l0
	xnor	%l5,-0x76a,%l7
	ldsb	[%o1+0x02b],%l5		! Mem[000000001004142b]
	stb	%l1,[%o5+0x026]		! Mem[0000000010141426]
	fstoi	%f18,%f28
	std	%l4,[%o0+0x010]		! Mem[0000000010001410]
	fitos	%f24,%f18
	jmpl	%g6+8,%g0
	ldsw	[%o4+0x02c],%l4		! Mem[000000001010142c]
p0_call_1_ho:
	retl
	udivx	%l0,-0xfc1,%l0
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	smul	%l3,%l1,%l6
	jmpl	%g6+8,%g0
	swap	[%i6+0x014],%l4		! Mem[0000000010181414]
p0_call_2_le:
	st	%f4 ,[%i2+0x030]	! Mem[0000000010081430]
	retl
	ldsw	[%i6+0x018],%l5		! Mem[0000000010181418]
p0_jmpl_2_lo:
	smul	%l3,%l1,%l6
	jmpl	%g6+8,%g0
	swap	[%o6+0x014],%l4		! Mem[0000000010181414]
p0_call_2_lo:
	st	%f4 ,[%o2+0x030]	! Mem[0000000010081430]
	retl
	ldsw	[%o6+0x018],%l5		! Mem[0000000010181418]
p0_jmpl_2_he:
	swap	[%i1+0x018],%l1		! Mem[0000000010041418]
	nop
	ldx	[%i3+0x008],%l0		! Mem[00000000100c1408]
	std	%f28,[%i0+0x000]	! Mem[0000000010001400]
	swap	[%i4+0x030],%l6		! Mem[0000000010101430]
	fcmps	%fcc3,%f27,%f27
	jmpl	%g6+8,%g0
	ldstub	[%o2+0x001],%l4		! Mem[00000000211c0001]
p0_call_2_he:
	subc	%l0,%l3,%l4
	sub	%l3,-0x4d9,%l2
	mulx	%l7,0x399,%l5
	fmuls	%f23,%f28,%f29
	add	%l5,-0x2e2,%l0
	retl
	sdivx	%l6,-0x8db,%l4
p0_jmpl_2_ho:
	swap	[%o1+0x018],%l1		! Mem[0000000010041418]
	nop
	ldx	[%o3+0x008],%l0		! Mem[00000000100c1408]
	std	%f28,[%o0+0x000]	! Mem[0000000010001400]
	swap	[%o4+0x030],%l6		! Mem[0000000010101430]
	fcmps	%fcc3,%f27,%f27
	jmpl	%g6+8,%g0
	ldstub	[%i2+0x001],%l4		! Mem[00000000211c0001]
p0_call_2_ho:
	subc	%l0,%l3,%l4
	sub	%l3,-0x4d9,%l2
	mulx	%l7,0x399,%l5
	fmuls	%f23,%f28,%f29
	add	%l5,-0x2e2,%l0
	retl
	sdivx	%l6,-0x8db,%l4
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	lduh	[%i4+0x018],%l5		! Mem[0000000010101418]
	ldx	[%i0+0x008],%l6		! Mem[0000000010001408]
	st	%f9 ,[%i0+0x018]	! Mem[0000000010001418]
	swap	[%i6+0x038],%l4		! Mem[0000000010181438]
	jmpl	%g6+8,%g0
	ld	[%i6+0x024],%f1 	! Mem[0000000010181424]
p0_call_3_le:
	swap	[%i0+0x020],%l1		! Mem[0000000010001420]
	retl
	orn	%l7,%l4,%l0
p0_jmpl_3_lo:
	lduh	[%o4+0x018],%l5		! Mem[0000000010101418]
	ldx	[%o0+0x008],%l6		! Mem[0000000010001408]
	st	%f9 ,[%o0+0x018]	! Mem[0000000010001418]
	swap	[%o6+0x038],%l4		! Mem[0000000010181438]
	jmpl	%g6+8,%g0
	ld	[%o6+0x024],%f1 	! Mem[0000000010181424]
p0_call_3_lo:
	swap	[%o0+0x020],%l1		! Mem[0000000010001420]
	retl
	orn	%l7,%l4,%l0
p0_jmpl_3_he:
	ld	[%i3+0x00c],%f29	! Mem[00000000100c140c]
	fstoi	%f27,%f29
	fcmps	%fcc0,%f24,%f23
	jmpl	%g6+8,%g0
	ldstub	[%o2+0x000],%l5		! Mem[00000000211c0000]
p0_call_3_he:
	sub	%l0,%l4,%l5
	and	%l6,0xfbd,%l2
	ld	[%i0+0x034],%f22	! Mem[0000000010001434]
	ldsh	[%i4+0x022],%l3		! Mem[0000000010101422]
	ldsw	[%i1+0x020],%l5		! Mem[0000000010041420]
	ldsb	[%i2+0x019],%l2		! Mem[0000000010081419]
	retl
	fitod	%f19,%f26
p0_jmpl_3_ho:
	ld	[%o3+0x00c],%f29	! Mem[00000000100c140c]
	fstoi	%f27,%f29
	fcmps	%fcc0,%f24,%f23
	jmpl	%g6+8,%g0
	ldstub	[%i2+0x000],%l5		! Mem[00000000211c0000]
p0_call_3_ho:
	sub	%l0,%l4,%l5
	and	%l6,0xfbd,%l2
	ld	[%o0+0x034],%f22	! Mem[0000000010001434]
	ldsh	[%o4+0x022],%l3		! Mem[0000000010101422]
	ldsw	[%o1+0x020],%l5		! Mem[0000000010041420]
	ldsb	[%o2+0x019],%l2		! Mem[0000000010081419]
	retl
	fitod	%f19,%f26
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
	.word	0x5c9bef14,0xa0b573a2		! Init value for %l0
	.word	0x62954128,0x3d3c8bb8		! Init value for %l1
	.word	0x54b71c60,0xcf8b7376		! Init value for %l2
	.word	0x3e216532,0xd66e27d0		! Init value for %l3
	.word	0x67eb8ae0,0x84b1d35a		! Init value for %l4
	.word	0x2dd2897a,0x290ada93		! Init value for %l5
	.word	0x7adff5a6,0x8838f659		! Init value for %l6
	.word	0x069d1412,0x7ddcd4d4		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xfe605994,0x83907f7b		! Init value for %f0 
	.word	0xfb3301a9,0x2b457afe		! Init value for %f2 
	.word	0x4bdf338c,0xbf34f91f		! Init value for %f4 
	.word	0xee902518,0x96c8ddf2		! Init value for %f6 
	.word	0x7f52c8b5,0x600799bb		! Init value for %f8 
	.word	0x884d86b3,0x2e2caf12		! Init value for %f10
	.word	0x835097d4,0x81738105		! Init value for %f12
	.word	0x7f36f251,0xfcea6812		! Init value for %f14
	.word	0xdff53b19,0xf544865e		! Init value for %f16
	.word	0x9341ab5c,0x74920f20		! Init value for %f18
	.word	0x9731d508,0xe62b4f6f		! Init value for %f20
	.word	0x5ed2be76,0x38a608c5		! Init value for %f22
	.word	0x7aa9252a,0xf837a63c		! Init value for %f24
	.word	0xe2c63710,0xf3bb23fd		! Init value for %f26
	.word	0xc6b20ca0,0xb4be2176		! Init value for %f28
	.word	0x8c959c93,0xb6b008f7		! Init value for %f30
	.word	0xb8c21196,0x6898be0f		! Init value for %f32
	.word	0xcdac2352,0x4921b39a		! Init value for %f34
	.word	0x413915ce,0x0e52aa5b		! Init value for %f36
	.word	0xb319c64b,0x7e90c78f		! Init value for %f38
	.word	0x15165701,0x07e38693		! Init value for %f40
	.word	0xc8bf70da,0x504f8d35		! Init value for %f42
	.word	0x258448f2,0x9b6ede2c		! Init value for %f44
	.word	0xb1d1f714,0xe483d4b2		! Init value for %f46
	.word	0xe0dacf98,0xce8c673d
	.word	0xc3406390,0xff744a25
	.word	0xcbce5f42,0x81c54663
	.word	0x43f1ede0,0xdfe508e3
	.word	0x6652539e,0x4c7156f2
	.word	0x6a556ba6,0x8a561933
	.word	0x28adb4d3,0xae260d5e
	.word	0xfbae76a2,0x73f961b2
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
	.word	0x00000000,0x2600ffff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0xffffffff,0x303a00ff
	.word	0x000000ff,0xffffffff
	.word	0x000000ff,0xff0000ff
	.word	0x00000000,0xff000000
	.word	0x00000000,0xffffff00
	.word	0xffffffff,0xffff0000
	.word	0x00ffeb00,0xffff9c20
	.word	0x3a000000,0xffffffff
	.word	0xff000000,0x000000ff
	.word	0x00000000,0xffff0000
	.word	0x000000ff,0x00000000
	.word	0xff0000ff,0x00000000
	.word	0x000012ff,0x00000000
	.word	0xe361a5ff,0x00000000
	.word	0x000012ff,0x00000000
	.word	0x303a00ff,0xff0000ff
	.word	0x00000004,0x00000000		! %fsr = 0000000400000000
p0_local0_expect:
	.word	0xff003a30,0xffffffff
	.word	0xffffffff,0xff000000
	.word	0xff0000ff,0x0000003a
	.word	0x00000000,0xffff0000
	.word	0x00ffffff,0x00000000
	.word	0x0000ffff,0xffffffff
	.word	0x209cffff,0x00ebff00
	.word	0xffffffff,0x0000003a
p0_local0_sec_expect:
	.word	0x00000000,0xffffff00
	.word	0x00000000,0x00000000
	.word	0xffffffff,0x00000000
	.word	0x000000ff,0xffff0026
	.word	0xe30000ff,0x332e00f0
	.word	0x00ff0000,0xc0a5ffe3
	.word	0x000000ff,0x00000000
	.word	0xffffe300,0x00ebffe0
p0_local1_expect:
	.word	0x00000000,0x00000000
	.word	0xe3ffa5c0,0x0000ff00
	.word	0xffa50000,0x00000000
	.word	0x0000ffff,0x000000ff
	.word	0xffff0026,0x000000ff
	.word	0x00000000,0x00e3ffff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000097
p0_local1_sec_expect:
	.word	0x00000000,0xff000000
	.word	0xff000000,0xffff0000
	.word	0xffffe300,0x0000003a
	.word	0x000000ff,0xff000000
	.word	0x00000000,0x303a0000
	.word	0xe361a5ff,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p0_local2_expect:
	.word	0x000012ff,0x00000000
	.word	0x00000000,0x2600ffff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xff8c09f7,0x625a63ff
	.word	0xff000000,0x6bb300ff
	.word	0x000000ff,0xff000000
	.word	0x00000026,0xffffffff
p0_local2_sec_expect:
	.word	0xff00ffff,0xe3ffffff
	.word	0x000000ff,0x0000ffff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x00ff0000
	.word	0x0054276c,0x6bb30828
	.word	0x00000000,0xe361a5ff
	.word	0x00000026,0xff000000
p0_local3_expect:
	.word	0xff000000,0x00000000
	.word	0xff00003a,0x00000000
	.word	0x209cffff,0x00ebff00
	.word	0xff5a63ff,0xffffb36b
	.word	0xffffffff,0x00ff00af
	.word	0x000000ff,0xff000000
	.word	0xe3ffa5c0,0x30ff0000
	.word	0xffff0026,0xffff9c20
p0_local3_sec_expect:
	.word	0xff0000ff,0xffff0026
	.word	0x303a00ff,0x00000000
	.word	0x003a0000,0x00000000
	.word	0xff0000ff,0x00000000
	.word	0xe361a5ff,0x303a0000
	.word	0x802db715,0xff000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000e3
p0_local4_expect:
	.word	0xff0000ff,0x00000000
	.word	0x000000ff,0x00000000
	.word	0xffff0000,0x00000000
	.word	0x000000ff,0xffff0026
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x000000ff,0x0000003a
	.word	0xff0000ff,0x00ebffe0
p0_local4_sec_expect:
	.word	0xff0000ff,0x000000ff
	.word	0xffffffff,0x000000ff
	.word	0xff000000,0xe30000ff
	.word	0x305122b4,0x14eb7ae0
	.word	0x5c92e244,0x121321b5
	.word	0x28512d10,0x6bb30828
	.word	0x000000ff,0x00000000
	.word	0x6c275400,0x15b72d80
p0_local5_expect:
	.word	0x000000ff,0xffffffff
	.word	0xffffffff,0xffffffff
	.word	0xff000000,0xff000000
	.word	0x000000ff,0xff000000
	.word	0xff0005ad,0xc0a5ffe3
	.word	0x00ffeb00,0x00000097
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x00000000
p0_local5_sec_expect:
	.word	0xffffe300,0xff0000ff
	.word	0x00000000,0x00000000
	.word	0x0000ffff,0x00000000
	.word	0x00000000,0xc0a5ffe3
	.word	0xffffb36b,0xffff0000
	.word	0x0000b0b6,0x0000ff00
	.word	0xe07aeb14,0x00005130
	.word	0x5c92e244,0xffff9c20
p0_local6_expect:
	.word	0xff000000,0x00000000
	.word	0x0000ffff,0xff0000ff
	.word	0xff000000,0x00000000
	.word	0x000000ff,0xffff0026
	.word	0x0000ffff,0xffffb36b
	.word	0x000000ff,0x0000003a
	.word	0x000052ff,0xff120000
	.word	0xff0000ff,0x00ebffe0
p0_local6_sec_expect:
	.word	0xffffffff,0x00000000
	.word	0x00000000,0xffff0000
	.word	0x00000000,0x00000000
	.word	0x000000ff,0xff000000
	.word	0x000000ff,0xff000000
	.word	0xe361a5ff,0x00000000
	.word	0xffff0026,0x00000000
	.word	0x00000000,0x000000ff
share0_expect:
	.word	0x0000367d,0xef15a445
	.word	0x8f436ab2,0x03017ecd
	.word	0x43de5b7b,0x42e4deb4
	.word	0x64bb1167,0x027f348e
	.word	0xaa82d215,0x57934b0f
	.word	0xaa4e11b8,0x6bc2ec8b
	.word	0xebeb83d2,0x564f912e
	.word	0xe9ca64d3,0xb432a587
share1_expect:
	.word	0xffff188e,0x4af42c26
	.word	0x5dd4a723,0x529962ea
	.word	0x5fd46a78,0x20114aa2
	.word	0xc90a2a00,0x41cf8534
	.word	0x3901f21b,0x41cc0a94
	.word	0x647935f5,0x872ab936
	.word	0x0bae5e44,0xe5ed88c7
	.word	0xc090ff74,0xae2acf08
	.word	0xffff9e9b,0xe1a33b02
	.word	0xd275f181,0x946a0efc
	.word	0x008dcecb,0x474fdc58
	.word	0xd6ce8e6f,0x981adfe1
	.word	0x932a9130,0x8a1b785e
	.word	0xb770d654,0xe3bc3dac
	.word	0xd63da918,0x92326390
	.word	0x5ce6eac3,0x25f84cee
share2_expect:
	.word	0xffff0b46,0x71a06a1d
	.word	0x8cd5051d,0xcf51d9e0
	.word	0x199f5978,0x558dd0b3
	.word	0x69050dc5,0x8d1971d1
	.word	0x071ed5c9,0xa585687a
	.word	0x8ebaafe3,0x5a6d5737
	.word	0x44017f5a,0x2ae78ac7
	.word	0x68704ea0,0x6ddab73c
share3_expect:
	.word	0xffff0c06,0x14feb76e
	.word	0x0f1d8d32,0x35cacb6b
	.word	0x6cbca427,0x1824de91
	.word	0x55d139f3,0x86901441
	.word	0x9823b572,0x186ab95a
	.word	0xafcda841,0xc71f7751
	.word	0x7a1decb9,0x3167b519
	.word	0xf676be8e,0x01a63f1f
	.word	0x0000a30e,0x0cbd5097
	.word	0x4f3fad3c,0x9700c0eb
	.word	0x2fb95221,0x7b0f96af
	.word	0xe2604c20,0xcb7a9c90
	.word	0x0e6078ab,0x3ff605c8
	.word	0x8ed78b7c,0x6ada5768
	.word	0x1db8ef13,0xf2d9722e
	.word	0xe7d2fa17,0xe9ffdc16
	.word	0x000032fb,0x0e992707
	.word	0xc40d4c10,0x5b70a39a
	.word	0x9bcaf36f,0xc203cec5
	.word	0xf208e1f9,0xd57d9722
	.word	0x5ba777c0,0xd385b931
	.word	0xab0083e4,0xa0ca3352
	.word	0xafd2d41b,0xf7a60d79
	.word	0x04edc56f,0x032d6119
	.word	0xff00bf7c,0x44091ca2
	.word	0x8dbfeb72,0xdd88a9dd
	.word	0xc3d32d26,0x313a5c71
	.word	0x1261e758,0x4da29ee4
	.word	0x9a371cde,0xd8928095
	.word	0xbd8cb1ce,0x57e7c31a
	.word	0x87cc8cc9,0x29ebcfdd
	.word	0x695b01a2,0x83d57b22
	.word	0x00ff6996,0xad1bb68b
	.word	0xc65b6001,0xb672688a
	.word	0x4ed90a4b,0x8b789866
	.word	0x606b8b0f,0x4fb8e21b
	.word	0xf29814ff,0x514ac150
	.word	0x3d7e11f9,0xb4456238
	.word	0x712448bd,0x3a79ccfa
	.word	0x96fae80b,0x22c2abfd
	.word	0x00ffe6e1,0xd41b9e89
	.word	0x358da6b1,0x70afc4a9
	.word	0x98221d50,0x2964751f
	.word	0x5955299a,0x326ceacd
	.word	0xeef9cacb,0x291e0167
	.word	0xa4f09a07,0x7bf3a006
	.word	0x393d97f4,0xa7c71b23
	.word	0x06ae019d,0x3fbae5a0
	.word	0xff2635e9,0x10b43440
	.word	0x0d7ab57e,0x28bb7396
	.word	0xea6a2cf8,0x1d552ded
	.word	0x73c9864f,0xdaf47ccc
	.word	0x622caeb7,0x0f586a7f
	.word	0x549f7353,0xcba1bf22
	.word	0x0387daa6,0xe8d683c7
	.word	0x19658ac6,0x7ded7ee1
	.word	0xff004fd1,0x94f975c9
	.word	0x5210ebca,0xdd6d229d
	.word	0xca081434,0xe79bf675
	.word	0x5cb4c5c5,0xd913de7e
	.word	0xb72db355,0x5b0f041b
	.word	0xf9528384,0xab2f424f
	.word	0x73088783,0x127d4f4e
	.word	0x4c1b20de,0x7228a7d8
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
	.word	0x8e50de87,0xd6e1ec21
	.word	0x00000000,0x00000002
	.word	0xa8145d18,0x1a46eda3
	.word	0x00000000,0x00000003
	.word	0xc681f447,0x81c6af35
	.word	0x00000000,0x00000004
	.word	0xa6fbeb08,0x52001e8e
	.word	0x00000000,0x00000005
	.word	0x2ca0f598,0x1429de8d
	.word	0x00000000,0x00000006
	.word	0x5d291b7f,0x87ccf482
	.word	0x00000000,0x00000007
	.word	0x517ac360,0x52037342
	.word	0x00000000,0x00000008
	.word	0x5b378a17,0x8282bda7
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
	.word	0xe0d1a404,0x13015707,0x603e9969,0xf1ecc94c
	.word	0xe55dd675,0x8ab54ce8,0x63d79011,0x1e58394a
	.word	0x8af06e6c,0x0cf436a7,0x54e6acd2,0x2b3b5811
	.word	0x927d2856,0x75852a2e,0xd5a8c226,0x087cb36e
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
	.word	0xc9443073,0x76d79aa1,0xcdd46201,0xdb7f6376
	.word	0xb67d94d9,0x7cbec4fd,0xa8164d23,0x3f49f4ab
	.word	0x6774b15a,0x76c63acb,0xf39b0d6e,0x3b06be98
	.word	0xbc811988,0x7d4fe669,0x1e3337ca,0xfd20c978
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
	.word	0xc9cbb80d,0xaffa04d9,0x7ad125a6,0x840285e5
	.word	0xd1ca1cee,0xa7f1e1c9,0xc8e6ca0b,0x7a4a8882
	.word	0xd2536d48,0x5ae85f11,0x313b9c29,0x389824ba
	.word	0x9a51c6b0,0x56848fc0,0x260726bb,0x6ce66ed7
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
	.word	0x030c9fd2,0xbe7690d6,0x8c0d13a0,0x0278ba58
	.word	0xae4dd83f,0xfc954f01,0x3cc48f96,0x440575af
	.word	0xf546fbd0,0xebdbfb94,0x58eaf769,0x84159f0a
	.word	0xa375be52,0x3ff38a33,0x861da463,0xdd585855
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
	.word	0xcda9f5bb,0x16c5e24d,0xd6d451c8,0xdc7b2bca
	.word	0xd51a91c7,0xcafff7d1,0x06d8006e,0xe95f20bc
	.word	0x292a92c0,0xf94214d7,0x787ccc5f,0x20094a63
	.word	0x212b420c,0xf7f3149f,0xd27c7301,0xbdbf3404
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
	.word	0xe4380ce1,0x4488bbf7,0x588e4937,0x10fd8ad0
	.word	0x70f9546d,0xcd997d1c,0x5996b641,0x27c5605a
	.word	0xb372fa68,0xcd5a924a,0x1cd52ef4,0x1aead71a
	.word	0xd6389bc4,0x532ff970,0xcb44842e,0xb3687e21
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
	.word	0xb5fb5286,0xa19b16f8,0xda3f84ba,0x8634d1bc
	.word	0x5edf84c9,0x82c96da4,0x8e4beab0,0xa0bbc18b
	.word	0x2e1ef710,0xddda8cc1,0x8e5a1c03,0x32a5eb05
	.word	0x4c2a1934,0xb45d244c,0x21c2c7c9,0xde5917f2
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
	.word	0x171acbe6,0x30317bee,0xaf54fcd3,0x131e9dc8
	.word	0x1fee1ae3,0x6cbf0ba7,0xfe1adf4b,0x8941ad0c
	.word	0xaf0c15a9,0xf9c39c20,0xa9e52ba8,0xe9803f34
	.word	0x12fffb3a,0xbc85e660,0x61c6426e,0x204e5d13
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
	.word	0x0b4d9e7d,0xb12eb574,0x3ba0cb0c,0xe3fb5fce
	.word	0x7a5188e9,0x05de4d02,0xe9057988,0x2bb48670
	.word	0xbe92965c,0x0523771e,0xece49255,0x186754e2
	.word	0x9cba3ed2,0x168dfb92,0x7d453db4,0xb20d69f4
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
	.word	0xef06b347,0x2606f9a3,0x0b2e5206,0x179f0e82
	.word	0x736ef266,0x86ee9f04,0x305122b4,0x14eb7ae0
	.word	0x5c92e244,0x121321b5,0x28512d10,0x6bb30828
	.word	0xf6b3e679,0xc0a561e3,0x6c275400,0x15b72d80
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
	.word	0x5d938f61,0x68cb889b,0x62735314,0x342ef7f6
	.word	0x0668c6a3,0xa627f149,0x6c8c7dee,0x80ac7047
	.word	0x78587da8,0xa6823d2b,0xac635fb4,0x4751511c
	.word	0x5a2c562e,0xbd83059c,0x17e5d837,0xe8f1dbf6
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
	.word	0x34b410ff,0x27b9815f,0x883d5970,0x7430f9ad
	.word	0xeee25150,0x2db440ca,0x65a90401,0x66cc7bb1
	.word	0xbe3d0f8e,0xb4dd3e42,0x075a8510,0x9ca25231
	.word	0x4618ccbe,0x8d0eaead,0xe83973c9,0x99ec69ae
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
	.word	0x18d0b9f5,0x93a23cfb,0x331d3ce3,0x8efe15f8
	.word	0x12a5bcbf,0x17e451f3,0x7a23e254,0xc2e9196a
	.word	0x932b6321,0x03b8c9c5,0x9cdef36b,0x332e64f0
	.word	0xabb4ff83,0xd5a201be,0xd4d3ad41,0xc044bcf4
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
	.word	0x39a03e1a,0x4a7f245c,0xb570b438,0x25e48611
	.word	0x3981bf37,0xfd7d3778,0x5ea0dce9,0x74bb756d
	.word	0x1fbbbcee,0x72e0e3dc,0xfe747889,0xf8dd2622
	.word	0x4cad7c8a,0x0926e279,0x274afced,0x7b635a62
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
	.word	0xb501367d,0xef15a445,0x8f436ab2,0x03017ecd
	.word	0x43de5b7b,0x42e4deb4,0x64bb1167,0x027f348e
	.word	0xaa82d215,0x57934b0f,0xaa4e11b8,0x6bc2ec8b
	.word	0xebeb83d2,0x564f912e,0xe9ca64d3,0xb432a587
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
	.word	0x3a96188e,0x4af42c26,0x5dd4a723,0x529962ea
	.word	0x5fd46a78,0x20114aa2,0xc90a2a00,0x41cf8534
	.word	0x3901f21b,0x41cc0a94,0x647935f5,0x872ab936
	.word	0x0bae5e44,0xe5ed88c7,0xc090ff74,0xae2acf08
	.word	0xb88a9e9b,0xe1a33b02,0xd275f181,0x946a0efc
	.word	0x008dcecb,0x474fdc58,0xd6ce8e6f,0x981adfe1
	.word	0x932a9130,0x8a1b785e,0xb770d654,0xe3bc3dac
	.word	0xd63da918,0x92326390,0x5ce6eac3,0x25f84cee
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
	.word	0xab780b46,0x71a06a1d,0x8cd5051d,0xcf51d9e0
	.word	0x199f5978,0x558dd0b3,0x69050dc5,0x8d1971d1
	.word	0x071ed5c9,0xa585687a,0x8ebaafe3,0x5a6d5737
	.word	0x44017f5a,0x2ae78ac7,0x68704ea0,0x6ddab73c
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
	.word	0x112d0c06,0x14feb76e,0x0f1d8d32,0x35cacb6b
	.word	0x6cbca427,0x1824de91,0x55d139f3,0x86901441
	.word	0x9823b572,0x186ab95a,0xafcda841,0xc71f7751
	.word	0x7a1decb9,0x3167b519,0xf676be8e,0x01a63f1f
	.word	0x1855a30e,0x0cbd5097,0x4f3fad3c,0x9700c0eb
	.word	0x2fb95221,0x7b0f96af,0xe2604c20,0xcb7a9c90
	.word	0x0e6078ab,0x3ff605c8,0x8ed78b7c,0x6ada5768
	.word	0x1db8ef13,0xf2d9722e,0xe7d2fa17,0xe9ffdc16
	.word	0x05ad32fb,0x0e992707,0xc40d4c10,0x5b70a39a
	.word	0x9bcaf36f,0xc203cec5,0xf208e1f9,0xd57d9722
	.word	0x5ba777c0,0xd385b931,0xab0083e4,0xa0ca3352
	.word	0xafd2d41b,0xf7a60d79,0x04edc56f,0x032d6119
	.word	0x60f7bf7c,0x44091ca2,0x8dbfeb72,0xdd88a9dd
	.word	0xc3d32d26,0x313a5c71,0x1261e758,0x4da29ee4
	.word	0x9a371cde,0xd8928095,0xbd8cb1ce,0x57e7c31a
	.word	0x87cc8cc9,0x29ebcfdd,0x695b01a2,0x83d57b22
	.word	0xaece6996,0xad1bb68b,0xc65b6001,0xb672688a
	.word	0x4ed90a4b,0x8b789866,0x606b8b0f,0x4fb8e21b
	.word	0xf29814ff,0x514ac150,0x3d7e11f9,0xb4456238
	.word	0x712448bd,0x3a79ccfa,0x96fae80b,0x22c2abfd
	.word	0x6a3ae6e1,0xd41b9e89,0x358da6b1,0x70afc4a9
	.word	0x98221d50,0x2964751f,0x5955299a,0x326ceacd
	.word	0xeef9cacb,0x291e0167,0xa4f09a07,0x7bf3a006
	.word	0x393d97f4,0xa7c71b23,0x06ae019d,0x3fbae5a0
	.word	0x53b935e9,0x10b43440,0x0d7ab57e,0x28bb7396
	.word	0xea6a2cf8,0x1d552ded,0x73c9864f,0xdaf47ccc
	.word	0x622caeb7,0x0f586a7f,0x549f7353,0xcba1bf22
	.word	0x0387daa6,0xe8d683c7,0x19658ac6,0x7ded7ee1
	.word	0x05bc4fd1,0x94f975c9,0x5210ebca,0xdd6d229d
	.word	0xca081434,0xe79bf675,0x5cb4c5c5,0xd913de7e
	.word	0xb72db355,0x5b0f041b,0xf9528384,0xab2f424f
	.word	0x73088783,0x127d4f4e,0x4c1b20de,0x7228a7d8
share3_end:
