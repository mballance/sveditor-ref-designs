/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_100_0.s
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
!	Seed = 327141847
!	Riesling can be on
!	1 Thread, 100 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_100_0.s created on Mar 27, 2009 (14:18:47)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_100_0 -p 1 -l 100

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
!	%f0  = df20c560 84fdf5e9 777b5c07 6a61b522
!	%f4  = 6a8869a8 93d9da8d d85d76d2 f9a1e170
!	%f8  = 40733343 e05936cd 5306d237 00f9a512
!	%f12 = 90e1509e 79625649 14cadd97 149fba8a
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 5749f829 08613d44 525b2df0 0770c2dc
!	%f20 = 146f39fa fa7fe875 93ebe1e4 87a86e1b
!	%f24 = e048c1f2 58d819a8 64c3c10e dfcb6073
!	%f28 = 23bd4658 d8def832 a7ae9a5d c455ebc7
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 971a6130 7da46f97 c614c152 924474f8
!	%f36 = 903f06bc 7b85bd79 a897a373 9c740c27
!	%f40 = 6c6595dd 69fe964f bb2ac0ca 4703c3d7
!	%f44 = af42ffde 74ec3b92 8f09b226 94ce0ec2
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xc4dd404000000077,%g7,%g1 ! GSR scale = 14, align = 7
	wr	%g1,%g0,%gsr		! GSR = c4dd404000000077
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%f16 = 5749f829 08613d44, Mem[0000000010041408] = 5dcbbeb8 f4600289
	stda	%f16,[%i1+%o4]0x88	! Mem[0000000010041408] = 5749f829 08613d44
!	%f28 = 23bd4658 d8def832, Mem[0000000010001410] = f56351ca 30003c51
	stda	%f28,[%i0+0x010]%asi	! Mem[0000000010001410] = 23bd4658 d8def832
!	Mem[00000000300c1400] = dcbaf562, %l2 = 469ecf880876b754
	ldsha	[%i3+%g0]0x89,%l2	! %l2 = fffffffffffff562
!	%l5 = f2b66e7266445275, Mem[0000000030101410] = 9255f9b0
	stba	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 7555f9b0
!	Mem[000000001004141f] = 35413a53, %l6 = 68a336b21af3306b
	ldstuba	[%i1+0x01f]%asi,%l6	! %l6 = 00000053000000ff
!	%l7 = be934732256a7a34, Mem[00000000300c1408] = 135cd64e
	stwa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 256a7a34
!	Mem[0000000030041408] = 668e87d0, %f4  = 6a8869a8
	lda	[%i1+%o4]0x89,%f4 	! %f4 = 668e87d0
!	Mem[0000000030101410] = 7555f9b0, %l4 = 9c87373c31b59b80
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 00000075000000ff
!	Mem[0000000010081410] = 03864f10 2a261f28, %l6 = 00000053, %l7 = 256a7a34
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 000000002a261f28 0000000003864f10
!	Starting 10 instruction Store Burst
!	%l1 = fa7dc5c00bc4e916, Mem[0000000020800001] = 61e5c321, %asi = 80
	stba	%l1,[%o1+0x001]%asi	! Mem[0000000020800000] = 6116c321

p0_label_2:
!	%l7 = 0000000003864f10, Mem[0000000010181420] = ebca517e, %asi = 80
	stha	%l7,[%i6+0x020]%asi	! Mem[0000000010181420] = 4f10517e
!	%l7 = 0000000003864f10, Mem[0000000030081410] = 1bced4f6
	stha	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 4f10d4f6
!	Mem[0000000010101400] = 1bd509033d5e50f3, %f14 = 14cadd97 149fba8a
	ldd	[%i4+%g0],%f14		! %f14 = 1bd50903 3d5e50f3
!	%l5 = f2b66e7266445275, immd = 000000000000074c, %l1 = fa7dc5c00bc4e916
	sdivx	%l5,0x74c,%l1		! %l1 = fffe2dd50774865a
!	%l0 = 4702eea829defc40, Mem[0000000030001408] = 0cae061b0e801431
	stxa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 4702eea829defc40
!	Mem[0000000020800040] = 123299be, %l3 = baf8f7be807149ca
	ldstub	[%o1+0x040],%l3		! %l3 = 00000012000000ff
!	%f0  = df20c560, Mem[0000000030041400] = 5bd9693c
	sta	%f0 ,[%i1+%g0]0x89	! Mem[0000000030041400] = df20c560
!	Mem[0000000030041410] = 2ccf2d72, %l4 = 0000000000000075
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 00000072000000ff
!	Mem[000000001004140c] = 29f84957, %l3 = 00000012, %l3 = 00000012
	add	%i1,0x0c,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 0000000029f84957
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 1bd50903 3d5e50f3 54dd74aa f2aab844
!	Mem[0000000010101410] = 3b3c3942 8091652f 1fe04ab0 6affabb0
!	Mem[0000000010101420] = a05062ac 38c2171c b04756ea 3b895361
!	Mem[0000000010101430] = c84b6528 3a9d7a26 ec614b16 2f020f7c
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400

p0_label_3:
!	Mem[0000000010001400] = b2579d61, %l1 = fffe2dd50774865a
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 000000000000b257
!	Mem[0000000010101408] = 54dd74aa, %l0 = 4702eea829defc40
	ldsha	[%i4+%o4]0x80,%l0	! %l0 = 00000000000054dd
!	Mem[0000000030141408] = 9ece5c7b634ffaca, %l4 = 0000000000000072
	ldxa	[%i5+%o4]0x89,%l4	! %l4 = 9ece5c7b634ffaca
!	Mem[0000000030141400] = 04a76b6e, %l0 = 00000000000054dd
	ldsha	[%i5+%g0]0x81,%l0	! %l0 = 00000000000004a7
!	Mem[0000000010081410] = 03864f102a261f28, %l4 = 9ece5c7b634ffaca
	ldxa	[%i2+%o5]0x88,%l4	! %l4 = 03864f102a261f28
!	Mem[0000000020800040] = ff3299be, %l4 = 03864f102a261f28
	ldsba	[%o1+0x040]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 03864f10 2a261f28, %l0 = 000004a7, %l1 = 0000b257
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 000000002a261f28 0000000003864f10
!	Mem[00000000300c1408] = 256a7a34, %l1 = 0000000003864f10
	ldsba	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000025
!	Mem[0000000030081410] = f6d4104f, %l4 = ffffffffffffffff
	ldsba	[%i2+%o5]0x89,%l4	! %l4 = 000000000000004f
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000025, Mem[0000000010041408] = 08613d44
	stba	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 08613d25

p0_label_4:
!	Mem[0000000010081408] = e52be777, %l6 = 000000002a261f28
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 000000e5000000ff
!	%l6 = 00000000000000e5, Mem[0000000030181400] = 8c345aa6
	stha	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00e55aa6
!	%l1 = 0000000000000025, Mem[0000000010181417] = 8675702d
	stb	%l1,[%i6+0x017]		! Mem[0000000010181414] = 86757025
!	Mem[0000000010181428] = ad84988f, %l0 = 2a261f28, %l0 = 2a261f28
	add	%i6,0x28,%g1
	casa	[%g1]0x80,%l0,%l0	! %l0 = 00000000ad84988f
!	%f24 = e048c1f2 58d819a8, %l7 = 0000000003864f10
!	Mem[0000000030081410] = 4f10d4f6c35d69ab
	add	%i2,0x010,%g1
	stda	%f24,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030081410] = 4f10d4f6c35d69ab
!	%l4 = 000000000000004f, Mem[0000000010001418] = 532b4668, %asi = 80
	stha	%l4,[%i0+0x018]%asi	! Mem[0000000010001418] = 004f4668
!	%f16 = 5749f829 08613d44, %l6 = 00000000000000e5
!	Mem[0000000010041430] = 6593b2f0b5dc8926
	add	%i1,0x030,%g1
	stda	%f16,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010041430] = 443d6108b5dc8926
	membar	#Sync			! Added by membar checker (1)
!	%l2 = fffffffffffff562, Mem[000000001010140c] = f2aab844, %asi = 80
	stwa	%l2,[%i4+0x00c]%asi	! Mem[000000001010140c] = fffff562
!	%f14 = ec614b16 2f020f7c, Mem[00000000100c1408] = 6e88171d 3aa00572
	stda	%f14,[%i3+%o4]0x88	! Mem[00000000100c1408] = ec614b16 2f020f7c
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = aa74dd54, %l3 = 0000000029f84957
	ldsha	[%i4+%o4]0x88,%l3	! %l3 = ffffffffffffdd54

p0_label_5:
!	Mem[0000000010181400] = b80f615e, %l3 = ffffffffffffdd54
	ldsha	[%i6+%g0]0x88,%l3	! %l3 = 000000000000615e
!	Mem[0000000010041400] = 149d9875, %l4 = 000000000000004f
	lduha	[%i1+%g0]0x88,%l4	! %l4 = 0000000000009875
!	Mem[0000000010101410] = 2f65918042393c3b, %l6 = 00000000000000e5
	ldxa	[%i4+%o5]0x88,%l6	! %l6 = 2f65918042393c3b
!	Mem[0000000010041410] = d28fdb2bd9e9eeca, %f4  = 3b3c3942 8091652f
	ldda	[%i1+%o5]0x88,%f4 	! %f4  = d28fdb2b d9e9eeca
!	Mem[0000000010081410] = 281f262a, %l7 = 0000000003864f10
	lduha	[%i2+%o5]0x80,%l7	! %l7 = 000000000000281f
!	Mem[0000000010001420] = 27e8c49a, %l3 = 000000000000615e
	lduha	[%i0+0x020]%asi,%l3	! %l3 = 00000000000027e8
!	Mem[0000000010141410] = 26449f02, %l1 = 0000000000000025
	lduwa	[%i5+%o5]0x80,%l1	! %l1 = 0000000026449f02
!	Mem[0000000010181410] = 93b30020, %l4 = 0000000000009875
	lduba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000093
!	Mem[0000000030141400] = 04a76b6e, %l0 = 00000000ad84988f
	lduha	[%i5+%g0]0x81,%l0	! %l0 = 00000000000004a7
!	Starting 10 instruction Store Burst
!	Mem[0000000021800041] = 0185bbcd, %l7 = 000000000000281f
	ldstub	[%o3+0x041],%l7		! %l7 = 00000085000000ff

p0_label_6:
!	%l1 = 0000000026449f02, Mem[0000000030141408] = 634ffaca
	stha	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 634f9f02
!	%l0 = 00000000000004a7, Mem[0000000010001408] = 630e2eab
	stba	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = a70e2eab
!	%f10 = b04756ea 3b895361, %l3 = 00000000000027e8
!	Mem[0000000010101410] = 3b3c39428091652f
	add	%i4,0x010,%g1
	stda	%f10,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010101410] = 3b3c3942809147b0
!	%l3 = 00000000000027e8, Mem[0000000010101400] = 0309d51b
	stha	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 030927e8
!	Mem[0000000010141408] = 1758339f, %l4 = 0000000000000093
	swapa	[%i5+%o4]0x80,%l4	! %l4 = 000000001758339f
!	Mem[0000000010041410] = d9e9eeca, %l4 = 000000001758339f
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 00000000d9e9eeca
!	Mem[0000000010101408] = aa74dd54, %l1 = 0000000026449f02
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 00000054000000ff
!	Mem[00000000300c1400] = 62f5badc, %l4 = 00000000d9e9eeca
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 0000000062f5badc
!	%f20 = 146f39fa, Mem[0000000010001420] = 27e8c49a
	sta	%f20,[%i0+0x020]%asi	! Mem[0000000010001420] = 146f39fa
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = c5fcbe7d149d9875, %l7 = 0000000000000085
	ldxa	[%i1+%g0]0x88,%l7	! %l7 = c5fcbe7d149d9875

p0_label_7:
!	Mem[0000000010081410] = 2a261f28, %l0 = 00000000000004a7
	lduwa	[%i2+%o5]0x88,%l0	! %l0 = 000000002a261f28
!	Mem[0000000010001410] = 23bd4658, %l1 = 0000000000000054
	ldswa	[%i0+%o5]0x80,%l1	! %l1 = 0000000023bd4658
!	Mem[0000000010081400] = 49130bb5, %l3 = 00000000000027e8
	lduwa	[%i2+%g0]0x88,%l3	! %l3 = 0000000049130bb5
!	Mem[000000001018143c] = 29722e7f, %l1 = 0000000023bd4658
	ldsba	[%i6+0x03e]%asi,%l1	! %l1 = 000000000000002e
!	Mem[0000000030001408] = 4702eea829defc40, %f26 = 64c3c10e dfcb6073
	ldda	[%i0+%o4]0x81,%f26	! %f26 = 4702eea8 29defc40
!	Mem[0000000010181400] = 5e610fb8a4bb0373, %l5 = f2b66e7266445275
	ldxa	[%i6+%g0]0x80,%l5	! %l5 = 5e610fb8a4bb0373
!	Mem[0000000030101400] = 38327dc8, %l6 = 2f65918042393c3b
	ldsha	[%i4+%g0]0x89,%l6	! %l6 = 0000000000007dc8
!	Mem[0000000010141410] = 26449f02, %l4 = 0000000062f5badc
	ldsba	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000026
!	Mem[0000000020800040] = ff3299be, %l7 = c5fcbe7d149d9875
	ldsb	[%o1+0x040],%l7		! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = ff3299be, %l4 = 0000000000000026
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 000000ff000000ff

p0_label_8:
!	%l7 = ffffffffffffffff, Mem[0000000010141430] = b8a3154ed5567c9a
	stx	%l7,[%i5+0x030]		! Mem[0000000010141430] = ffffffffffffffff
!	Mem[000000001014141c] = 4a9551f2, %l6 = 00007dc8, %l1 = 0000002e
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 000000004a9551f2
!	Mem[0000000021800100] = ba3c07c4, %l0 = 000000002a261f28
	ldstub	[%o3+0x100],%l0		! %l0 = 000000ba000000ff
!	%l6 = 0000000000007dc8, immed = 000007cb, %y  = 00000000
	sdiv	%l6,0x7cb,%l6		! %l6 = 0000000000000010
	mov	%l0,%y			! %y = 000000ba
!	%l7 = ffffffffffffffff, Mem[00000000100c1416] = 076ed24f, %asi = 80
	stha	%l7,[%i3+0x016]%asi	! Mem[00000000100c1414] = 076effff
!	%f14 = ec614b16 2f020f7c, Mem[0000000030181410] = 54f90903 a9ebb4a7
	stda	%f14,[%i6+%o5]0x81	! Mem[0000000030181410] = ec614b16 2f020f7c
!	%l2 = fffffffffffff562, Mem[0000000010181400] = 5e610fb8
	stha	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = f5620fb8
!	%f0  = 1bd50903 3d5e50f3 54dd74aa f2aab844
!	%f4  = d28fdb2b d9e9eeca 1fe04ab0 6affabb0
!	%f8  = a05062ac 38c2171c b04756ea 3b895361
!	%f12 = c84b6528 3a9d7a26 ec614b16 2f020f7c
	stda	%f0,[%i6]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	Mem[0000000010101400] = e8270903, %l4 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l4	! %l4 = 000000e8000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = a072e511d45c3262, %f26 = 4702eea8 29defc40
	ldd	[%i3+%g0],%f26		! %f26 = a072e511 d45c3262

p0_label_9:
!	Mem[0000000010081408] = d0106dff77e72bff, %l2 = fffffffffffff562
	ldxa	[%i2+%o4]0x88,%l2	! %l2 = d0106dff77e72bff
!	Mem[0000000010041400] = 149d9875, %l0 = 00000000000000ba
	ldsha	[%i1+%g0]0x88,%l0	! %l0 = ffffffffffff9875
!	Mem[00000000201c0000] = 4770fcac, %l4 = 00000000000000e8
	ldsb	[%o0+0x001],%l4		! %l4 = 0000000000000070
!	Mem[0000000010101410] = 3b3c3942, %l1 = 000000004a9551f2
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = 000000000000003b
!	Mem[0000000030001400] = d8965e68 705bbb6d, %l0 = ffff9875, %l1 = 0000003b
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 00000000d8965e68 00000000705bbb6d
!	Mem[0000000010001438] = 95051e06, %l7 = ffffffffffffffff
	ldsba	[%i0+0x03b]%asi,%l7	! %l7 = 0000000000000006
!	Mem[0000000030041408] = d0878e66, %l6 = 0000000000000010
	lduha	[%i1+%o4]0x81,%l6	! %l6 = 000000000000d087
!	Mem[0000000021800000] = 4dae4dcc, %l2 = d0106dff77e72bff
	ldsha	[%o3+0x000]%asi,%l2	! %l2 = 0000000000004dae
!	Mem[0000000010081410] = 281f262a, %l7 = 0000000000000006
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000028
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = ff3299be, %l4 = 0000000000000070
	ldstub	[%o1+0x041],%l4		! %l4 = 00000032000000ff

p0_label_10:
!	%l4 = 00000032, %l5 = a4bb0373, Mem[0000000030001410] = 64ea19c6 6f839ecb
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000032 a4bb0373
!	Mem[0000000030041400] = 60c520df, %l2 = 0000000000004dae
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 00000060000000ff
!	Mem[0000000010041410] = 1758339f, %l4 = 0000000000000032
	lduha	[%i1+%o5]0x88,%l4	! %l4 = 000000000000339f
!	%l5 = 5e610fb8a4bb0373, Mem[0000000030141400] = 04a76b6e
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 03736b6e
!	Mem[0000000010041410] = 9f335817, %l5 = 5e610fb8a4bb0373
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 000000009f335817
!	Mem[0000000020800001] = 6116c321, %l5 = 000000009f335817
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 00000016000000ff
!	%f28 = 23bd4658, Mem[0000000010081408] = ff2be777
	sta	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = 23bd4658
!	%l4 = 000000000000339f, Mem[0000000010181400] = f3505e3d0309d51b
	stx	%l4,[%i6+%g0]		! Mem[0000000010181400] = 000000000000339f
!	Mem[00000000100c1400] = a072e511, %l0 = 00000000d8965e68
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000a072e511
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010181400] = 00000000, %l0 = 00000000a072e511
	ldsba	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	nop
	udiv	%l6,%l0,%l4
	fdivs	%f11,%f29,%f31
	ldsba	[%i1+0x027]%asi,%l0
	fmuls	%f23,%f27,%f7
	nop
	xnor	%l2,0x202,%l5
	nop
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
	cmp	%l1,%g2			! %l1 should be 00000000705bbb6d
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000060
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000049130bb5
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 000000000000339f
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000016
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000000000d087
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000028
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x000000ba,%g2
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
	cmp	%l0,%l1			! %f0  should be 1bd50903 3d5e50f3
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 54dd74aa f2aab844
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be d28fdb2b d9e9eeca
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 1fe04ab0 6affabb0
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be a05062ac 38c2171c
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be b04756ea 3b895361
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be c84b6528 3a9d7a26
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ec614b16 2f020f7c
	bne	%xcc,p0_f14_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be a072e511 d45c3262
	bne	%xcc,p0_f26_fail
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

p0_f26_fail:
	set	p0_temp,%g6
	mov	0xf26,%l0
	stx	%l0,[%g6]
	std	%f26,[%g6+8]
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
	sub	%l0,0x916,%l1
	fsqrts	%f4 ,%f15
	fdtoi	%f8 ,%f2 
	udivx	%l1,0x399,%l3
	fdivs	%f9 ,%f13,%f8 
	xor	%l1,%l0,%l7
	add	%l1,%l6,%l3
	done

p0_trap1o:
	sub	%l0,0x916,%l1
	fsqrts	%f4 ,%f15
	fdtoi	%f8 ,%f2 
	udivx	%l1,0x399,%l3
	fdivs	%f9 ,%f13,%f8 
	xor	%l1,%l0,%l7
	add	%l1,%l6,%l3
	done


p0_trap2e:
	fdivs	%f12,%f4 ,%f4 
	subc	%l4,%l1,%l4
	done

p0_trap2o:
	fdivs	%f12,%f4 ,%f4 
	subc	%l4,%l1,%l4
	done


p0_trap3e:
	subc	%l7,%l7,%l0
	subc	%l4,-0xd66,%l0
	andn	%l4,%l0,%l4
	xnor	%l7,0xe0b,%l6
	xor	%l5,%l4,%l1
	and	%l5,0x85a,%l2
	add	%l0,%l6,%l5
	done

p0_trap3o:
	subc	%l7,%l7,%l0
	subc	%l4,-0xd66,%l0
	andn	%l4,%l0,%l4
	xnor	%l7,0xe0b,%l6
	xor	%l5,%l4,%l1
	and	%l5,0x85a,%l2
	add	%l0,%l6,%l5
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
	ldx	[%g1+0x000],%l0		! %l0 = 4702eea829defc40
	ldx	[%g1+0x008],%l1		! %l1 = fa7dc5c00bc4e916
	ldx	[%g1+0x010],%l2		! %l2 = 469ecf880876b754
	ldx	[%g1+0x018],%l3		! %l3 = baf8f7be807149ca
	ldx	[%g1+0x020],%l4		! %l4 = 9c87373c31b59b80
	ldx	[%g1+0x028],%l5		! %l5 = f2b66e7266445275
	ldx	[%g1+0x030],%l6		! %l6 = 68a336b21af3306b
	ldx	[%g1+0x038],%l7		! %l7 = be934732256a7a34

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
	sub	%l0,0x916,%l1
	fsqrts	%f4 ,%f15
	sdivx	%l4,%l5,%l0
	fdivs	%f11,%f13,%f15
	jmpl	%o7,%g0
	addc	%l1,-0xed2,%l5
p0_near_0_he:
	stb	%l0,[%i2+0x018]		! Mem[0000000010081418]
	subc	%l2,0xe88,%l2
	jmpl	%o7,%g0
	or	%l2,%l1,%l0
near0_b2b_h:
	nop
	jmpl	%o7,%g0
	smul	%l7,0x895,%l3
near0_b2b_l:
	andn	%l3,0xc87,%l2
	jmpl	%o7,%g0
	addc	%l4,-0x6a5,%l6
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	or	%l6,0x3f0,%l0
	and	%l1,0xfa2,%l2
	orn	%l7,%l1,%l6
	and	%l7,0x3d6,%l3
	fdtoi	%f0 ,%f9 
	udivx	%l6,0x909,%l5
	jmpl	%o7,%g0
	ldstub	[%o1+0x040],%l3		! Mem[0000000020800040]
p0_near_1_he:
	orn	%l5,-0xd4d,%l0
	xor	%l2,0x0ce,%l1
	xnor	%l4,%l6,%l1
	fsqrts	%f27,%f20
	jmpl	%o7,%g0
	and	%l6,%l1,%l7
near1_b2b_h:
	fsqrts	%f27,%f31
	and	%l5,%l4,%l1
	jmpl	%o7,%g0
	subc	%l5,-0xf3f,%l1
near1_b2b_l:
	andn	%l3,0xfda,%l4
	fadds	%f0 ,%f7 ,%f11
	jmpl	%o7,%g0
	subc	%l7,%l3,%l1
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	or	%l4,-0xffa,%l7
	and	%l0,-0x6bd,%l1
	andn	%l0,%l0,%l1
	andn	%l3,%l0,%l5
	fsqrts	%f10,%f3 
	jmpl	%o7,%g0
	umul	%l2,%l1,%l0
p0_near_2_he:
	fcmps	%fcc3,%f22,%f23
	subc	%l7,%l3,%l2
	fsubs	%f23,%f20,%f27
	xnor	%l1,-0xf24,%l4
	fcmps	%fcc1,%f24,%f16
	jmpl	%o7,%g0
	xnor	%l3,0x580,%l1
near2_b2b_h:
	mulx	%l7,%l2,%l6
	add	%l5,%l4,%l5
	mulx	%l1,-0x976,%l5
	umul	%l1,%l3,%l5
	sub	%l1,%l5,%l6
	xor	%l6,0xfaa,%l3
	fsqrts	%f16,%f21
	jmpl	%o7,%g0
	subc	%l2,-0xb70,%l7
near2_b2b_l:
	fsubs	%f14,%f12,%f7 
	fdivs	%f15,%f14,%f2 
	fadds	%f4 ,%f0 ,%f5 
	smul	%l5,%l2,%l7
	fadds	%f7 ,%f3 ,%f11
	mulx	%l0,0xee9,%l1
	and	%l2,0x5bf,%l4
	jmpl	%o7,%g0
	subc	%l7,0xe6d,%l7
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	jmpl	%o7,%g0
	fdivs	%f10,%f14,%f9 
	jmpl	%o7,%g0
	nop
p0_near_3_he:
	jmpl	%o7,%g0
	subc	%l5,%l0,%l5
	jmpl	%o7,%g0
	nop
near3_b2b_h:
	fdivs	%f26,%f22,%f24
	sdivx	%l6,-0x21a,%l6
	jmpl	%o7,%g0
	xor	%l2,-0x1ef,%l3
near3_b2b_l:
	and	%l5,%l1,%l1
	fdivs	%f7 ,%f3 ,%f12
	jmpl	%o7,%g0
	fmuls	%f1 ,%f12,%f15
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	xnor	%l3,-0x33f,%l4
	orn	%l5,%l5,%l1
	umul	%l1,%l6,%l6
	jmpl	%o7,%g0
	smul	%l3,%l1,%l6
p0_far_0_lem:
	xnor	%l3,-0x33f,%l4
	orn	%l5,%l5,%l1
	umul	%l1,%l6,%l6
	jmpl	%o7,%g0
	smul	%l3,%l1,%l6
p0_far_0_he:
	add	%l3,%l7,%l4
	fcmps	%fcc2,%f21,%f27
	fdivs	%f30,%f22,%f28
	fdivs	%f24,%f18,%f27
	add	%l2,-0x465,%l1
	fsubs	%f23,%f29,%f19
	jmpl	%o7,%g0
	ldub	[%i5+0x038],%l5		! Mem[0000000010141438]
p0_far_0_hem:
	add	%l3,%l7,%l4
	fcmps	%fcc2,%f21,%f27
	fdivs	%f30,%f22,%f28
	fdivs	%f24,%f18,%f27
	add	%l2,-0x465,%l1
	fsubs	%f23,%f29,%f19
	membar	#Sync
	jmpl	%o7,%g0
	ldub	[%i5+0x038],%l5		! Mem[0000000010141438]
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	xnor	%l4,%l7,%l1
	add	%l1,%l1,%l1
	jmpl	%o7,%g0
	addc	%l7,%l0,%l0
far0_b2b_l:
	fdivs	%f11,%f13,%f9 
	addc	%l7,%l4,%l1
	jmpl	%o7,%g0
	or	%l0,%l5,%l0
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	jmpl	%o7,%g0
	subc	%l3,%l5,%l1
	jmpl	%o7,%g0
	nop
p0_far_1_lem:
	jmpl	%o7,%g0
	subc	%l3,%l5,%l1
	jmpl	%o7,%g0
	nop
p0_far_1_he:
	lduw	[%i6+0x018],%l1		! Mem[0000000010181418]
	and	%l6,%l6,%l2
	orn	%l5,%l5,%l6
	fsubs	%f28,%f26,%f26
	smul	%l0,0xdc6,%l2
	jmpl	%o7,%g0
	xnor	%l7,%l2,%l6
p0_far_1_hem:
	membar	#Sync
	lduw	[%i6+0x018],%l1		! Mem[0000000010181418]
	and	%l6,%l6,%l2
	orn	%l5,%l5,%l6
	fsubs	%f28,%f26,%f26
	smul	%l0,0xdc6,%l2
	jmpl	%o7,%g0
	xnor	%l7,%l2,%l6
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	addc	%l7,%l1,%l2
	fcmps	%fcc3,%f26,%f28
	jmpl	%o7,%g0
	fdivs	%f26,%f30,%f18
far1_b2b_l:
	fcmps	%fcc2,%f6 ,%f0 
	andn	%l2,-0xcec,%l1
	jmpl	%o7,%g0
	or	%l1,0xf46,%l6
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	fdivs	%f14,%f13,%f1 
	xor	%l1,%l7,%l1
	fadds	%f1 ,%f10,%f5 
	fdivs	%f11,%f13,%f11
	jmpl	%o7,%g0
	xor	%l5,-0xdf2,%l0
p0_far_2_lem:
	fdivs	%f14,%f13,%f1 
	xor	%l1,%l7,%l1
	fadds	%f1 ,%f10,%f5 
	fdivs	%f11,%f13,%f11
	jmpl	%o7,%g0
	xor	%l5,-0xdf2,%l0
p0_far_2_he:
	sub	%l4,%l3,%l0
	addc	%l4,%l3,%l2
	jmpl	%o7,%g0
	or	%l1,%l3,%l4
p0_far_2_hem:
	sub	%l4,%l3,%l0
	addc	%l4,%l3,%l2
	jmpl	%o7,%g0
	or	%l1,%l3,%l4
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	umul	%l0,0x93c,%l1
	fdivs	%f31,%f25,%f16
	udivx	%l6,%l5,%l1
	andn	%l3,-0x574,%l1
	xor	%l4,-0x29d,%l3
	orn	%l4,0x202,%l5
	andn	%l6,0x53b,%l5
	jmpl	%o7,%g0
	and	%l0,%l0,%l0
far2_b2b_l:
	fmuls	%f15,%f6 ,%f4 
	or	%l7,-0xf16,%l2
	or	%l3,%l5,%l6
	subc	%l3,%l5,%l3
	andn	%l6,0x40e,%l6
	subc	%l7,-0xe86,%l4
	fdivs	%f11,%f3 ,%f0 
	jmpl	%o7,%g0
	xnor	%l5,0x000,%l2
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	sub	%l6,%l7,%l6
	fsubs	%f6 ,%f6 ,%f12
	fcmps	%fcc2,%f5 ,%f7 
	fdivs	%f9 ,%f3 ,%f11
	fmuls	%f11,%f14,%f1 
	orn	%l7,%l4,%l6
	jmpl	%o7,%g0
	fsubs	%f9 ,%f4 ,%f3 
p0_far_3_lem:
	sub	%l6,%l7,%l6
	fsubs	%f6 ,%f6 ,%f12
	fcmps	%fcc2,%f5 ,%f7 
	fdivs	%f9 ,%f3 ,%f11
	fmuls	%f11,%f14,%f1 
	orn	%l7,%l4,%l6
	jmpl	%o7,%g0
	fsubs	%f9 ,%f4 ,%f3 
p0_far_3_he:
	sdivx	%l5,-0xfaf,%l5
	addc	%l4,0x2e3,%l4
	sub	%l0,%l3,%l5
	smul	%l2,0xdd4,%l6
	fcmps	%fcc2,%f28,%f18
	fsqrts	%f27,%f22
	jmpl	%o7,%g0
	and	%l3,%l6,%l2
p0_far_3_hem:
	sdivx	%l5,-0xfaf,%l5
	addc	%l4,0x2e3,%l4
	sub	%l0,%l3,%l5
	smul	%l2,0xdd4,%l6
	fcmps	%fcc2,%f28,%f18
	fsqrts	%f27,%f22
	jmpl	%o7,%g0
	and	%l3,%l6,%l2
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fsubs	%f23,%f20,%f24
	or	%l4,%l5,%l3
	jmpl	%o7,%g0
	fcmps	%fcc3,%f29,%f24
far3_b2b_l:
	and	%l0,-0x47e,%l1
	udivx	%l2,0x452,%l7
	jmpl	%o7,%g0
	xnor	%l5,%l5,%l5
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	fmuls	%f15,%f9 ,%f7 
	andn	%l4,%l3,%l2
	udivx	%l5,%l2,%l5
	fsubs	%f15,%f3 ,%f12
	jmpl	%g6+8,%g0
	umul	%l1,%l7,%l2
p0_call_0_le:
	ldd	[%i3+0x010],%l4		! Mem[00000000100c1410]
	retl
	fadds	%f9 ,%f5 ,%f5 
p0_jmpl_0_lo:
	fmuls	%f15,%f9 ,%f7 
	andn	%l4,%l3,%l2
	udivx	%l5,%l2,%l5
	fsubs	%f15,%f3 ,%f12
	jmpl	%g6+8,%g0
	umul	%l1,%l7,%l2
p0_call_0_lo:
	ldd	[%o3+0x010],%l4		! Mem[00000000100c1410]
	retl
	fadds	%f9 ,%f5 ,%f5 
p0_jmpl_0_he:
	andn	%l1,%l4,%l5
	jmpl	%g6+8,%g0
	mulx	%l4,0x981,%l3
p0_call_0_he:
	xor	%l1,-0x94b,%l7
	xnor	%l2,%l2,%l2
	fadds	%f19,%f27,%f18
	fcmps	%fcc2,%f23,%f20
	retl
	umul	%l7,0xb15,%l5
p0_jmpl_0_ho:
	andn	%l1,%l4,%l5
	jmpl	%g6+8,%g0
	mulx	%l4,0x981,%l3
p0_call_0_ho:
	xor	%l1,-0x94b,%l7
	xnor	%l2,%l2,%l2
	fadds	%f19,%f27,%f18
	fcmps	%fcc2,%f23,%f20
	retl
	umul	%l7,0xb15,%l5
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	fmuls	%f2 ,%f4 ,%f5 
	fsubs	%f15,%f12,%f5 
	fcmps	%fcc0,%f7 ,%f5 
	jmpl	%g6+8,%g0
	xor	%l2,-0xb40,%l2
p0_call_1_le:
	add	%l6,%l2,%l3
	retl
	xor	%l2,0xe9b,%l2
p0_jmpl_1_lo:
	fmuls	%f2 ,%f4 ,%f5 
	fsubs	%f15,%f12,%f5 
	fcmps	%fcc0,%f7 ,%f5 
	jmpl	%g6+8,%g0
	xor	%l2,-0xb40,%l2
p0_call_1_lo:
	add	%l6,%l2,%l3
	retl
	xor	%l2,0xe9b,%l2
p0_jmpl_1_he:
	smul	%l1,%l0,%l7
	xnor	%l2,%l1,%l5
	fmuls	%f22,%f20,%f18
	udivx	%l1,-0x728,%l3
	or	%l2,0x017,%l7
	udivx	%l6,-0xe76,%l0
	xor	%l5,-0xa08,%l0
	jmpl	%g6+8,%g0
	subc	%l1,%l1,%l3
p0_call_1_he:
	or	%l1,%l2,%l0
	mulx	%l7,%l5,%l2
	sub	%l6,%l4,%l4
	fadds	%f28,%f17,%f26
	xnor	%l2,%l7,%l2
	retl
	fadds	%f23,%f20,%f22
p0_jmpl_1_ho:
	smul	%l1,%l0,%l7
	xnor	%l2,%l1,%l5
	fmuls	%f22,%f20,%f18
	udivx	%l1,-0x728,%l3
	or	%l2,0x017,%l7
	udivx	%l6,-0xe76,%l0
	xor	%l5,-0xa08,%l0
	jmpl	%g6+8,%g0
	subc	%l1,%l1,%l3
p0_call_1_ho:
	or	%l1,%l2,%l0
	mulx	%l7,%l5,%l2
	sub	%l6,%l4,%l4
	fadds	%f28,%f17,%f26
	xnor	%l2,%l7,%l2
	retl
	fadds	%f23,%f20,%f22
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	xor	%l5,%l5,%l2
	jmpl	%g6+8,%g0
	smul	%l2,%l4,%l6
p0_call_2_le:
	subc	%l3,%l2,%l1
	mulx	%l2,%l7,%l2
	ld	[%i5+0x030],%f13	! Mem[0000000010141430]
	retl
	and	%l2,0x938,%l4
p0_jmpl_2_lo:
	xor	%l5,%l5,%l2
	jmpl	%g6+8,%g0
	smul	%l2,%l4,%l6
p0_call_2_lo:
	subc	%l3,%l2,%l1
	mulx	%l2,%l7,%l2
	ld	[%o5+0x030],%f13	! Mem[0000000010141430]
	retl
	and	%l2,0x938,%l4
p0_jmpl_2_he:
	jmpl	%g6+8,%g0
	or	%l7,%l7,%l3
p0_call_2_he:
	fdivs	%f19,%f26,%f28
	smul	%l7,0xfe3,%l6
	and	%l2,%l6,%l4
	addc	%l4,0x8e7,%l1
	smul	%l5,0xc78,%l7
	sub	%l5,0x06b,%l4
	fadds	%f30,%f19,%f22
	retl
	fcmps	%fcc1,%f25,%f20
p0_jmpl_2_ho:
	jmpl	%g6+8,%g0
	or	%l7,%l7,%l3
p0_call_2_ho:
	fdivs	%f19,%f26,%f28
	smul	%l7,0xfe3,%l6
	and	%l2,%l6,%l4
	addc	%l4,0x8e7,%l1
	smul	%l5,0xc78,%l7
	sub	%l5,0x06b,%l4
	fadds	%f30,%f19,%f22
	retl
	fcmps	%fcc1,%f25,%f20
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	fadds	%f4 ,%f12,%f14
	fitod	%f4 ,%f4 
	add	%l0,0xc34,%l6
	jmpl	%g6+8,%g0
	umul	%l4,%l7,%l6
p0_call_3_le:
	ldd	[%i3+0x010],%f8 	! Mem[00000000100c1410]
	mulx	%l4,0x2d8,%l2
	retl
	st	%f10,[%i5+0x038]	! Mem[0000000010141438]
p0_jmpl_3_lo:
	fadds	%f4 ,%f12,%f14
	fitod	%f4 ,%f4 
	add	%l0,0xc34,%l6
	jmpl	%g6+8,%g0
	umul	%l4,%l7,%l6
p0_call_3_lo:
	ldd	[%o3+0x010],%f8 	! Mem[00000000100c1410]
	mulx	%l4,0x2d8,%l2
	retl
	st	%f10,[%o5+0x038]	! Mem[0000000010141438]
p0_jmpl_3_he:
	orn	%l7,-0xcac,%l3
	udivx	%l6,0x64e,%l0
	smul	%l6,%l2,%l4
	sub	%l1,0x169,%l4
	and	%l5,%l5,%l6
	udivx	%l5,%l2,%l6
	jmpl	%g6+8,%g0
	stb	%l0,[%i2+0x030]		! Mem[0000000010081430]
p0_call_3_he:
	fstoi	%f31,%f17
	mulx	%l4,%l3,%l1
	retl
	stb	%l1,[%i5+0x00e]		! Mem[000000001014140e]
p0_jmpl_3_ho:
	orn	%l7,-0xcac,%l3
	udivx	%l6,0x64e,%l0
	smul	%l6,%l2,%l4
	sub	%l1,0x169,%l4
	and	%l5,%l5,%l6
	udivx	%l5,%l2,%l6
	jmpl	%g6+8,%g0
	stb	%l0,[%o2+0x030]		! Mem[0000000010081430]
p0_call_3_ho:
	fstoi	%f31,%f17
	mulx	%l4,%l3,%l1
	retl
	stb	%l1,[%o5+0x00e]		! Mem[000000001014140e]
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
	.word	0x4702eea8,0x29defc40		! Init value for %l0
	.word	0xfa7dc5c0,0x0bc4e916		! Init value for %l1
	.word	0x469ecf88,0x0876b754		! Init value for %l2
	.word	0xbaf8f7be,0x807149ca		! Init value for %l3
	.word	0x9c87373c,0x31b59b80		! Init value for %l4
	.word	0xf2b66e72,0x66445275		! Init value for %l5
	.word	0x68a336b2,0x1af3306b		! Init value for %l6
	.word	0xbe934732,0x256a7a34		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xdf20c560,0x84fdf5e9		! Init value for %f0 
	.word	0x777b5c07,0x6a61b522		! Init value for %f2 
	.word	0x6a8869a8,0x93d9da8d		! Init value for %f4 
	.word	0xd85d76d2,0xf9a1e170		! Init value for %f6 
	.word	0x40733343,0xe05936cd		! Init value for %f8 
	.word	0x5306d237,0x00f9a512		! Init value for %f10
	.word	0x90e1509e,0x79625649		! Init value for %f12
	.word	0x14cadd97,0x149fba8a		! Init value for %f14
	.word	0x5749f829,0x08613d44		! Init value for %f16
	.word	0x525b2df0,0x0770c2dc		! Init value for %f18
	.word	0x146f39fa,0xfa7fe875		! Init value for %f20
	.word	0x93ebe1e4,0x87a86e1b		! Init value for %f22
	.word	0xe048c1f2,0x58d819a8		! Init value for %f24
	.word	0x64c3c10e,0xdfcb6073		! Init value for %f26
	.word	0x23bd4658,0xd8def832		! Init value for %f28
	.word	0xa7ae9a5d,0xc455ebc7		! Init value for %f30
	.word	0x971a6130,0x7da46f97		! Init value for %f32
	.word	0xc614c152,0x924474f8		! Init value for %f34
	.word	0x903f06bc,0x7b85bd79		! Init value for %f36
	.word	0xa897a373,0x9c740c27		! Init value for %f38
	.word	0x6c6595dd,0x69fe964f		! Init value for %f40
	.word	0xbb2ac0ca,0x4703c3d7		! Init value for %f42
	.word	0xaf42ffde,0x74ec3b92		! Init value for %f44
	.word	0x8f09b226,0x94ce0ec2		! Init value for %f46
	.word	0xfc359044,0xa37f7a57
	.word	0x7b2edb2c,0x84160e43
	.word	0xe9e81ede,0xd59a2f49
	.word	0xe36cc250,0x1b56e5d7
	.word	0x7dd67360,0x2127af58
	.word	0x97ac3bc8,0x897b500d
	.word	0xc4be4eb9,0xfef00662
	.word	0xadf0f858,0x21b08316
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
	.word	0x00000000,0x705bbb6d
	.word	0x00000000,0x00000060
	.word	0x00000000,0x49130bb5
	.word	0x00000000,0x0000339f
	.word	0x00000000,0x00000016
	.word	0x00000000,0x0000d087
	.word	0x00000000,0x00000028
p0_expected_fp_regs:
	.word	0x1bd50903,0x3d5e50f3
	.word	0x54dd74aa,0xf2aab844
	.word	0xd28fdb2b,0xd9e9eeca
	.word	0x1fe04ab0,0x6affabb0
	.word	0xa05062ac,0x38c2171c
	.word	0xb04756ea,0x3b895361
	.word	0xc84b6528,0x3a9d7a26
	.word	0xec614b16,0x2f020f7c
	.word	0x5749f829,0x08613d44
	.word	0x525b2df0,0x0770c2dc
	.word	0x146f39fa,0xfa7fe875
	.word	0x93ebe1e4,0x87a86e1b
	.word	0xe048c1f2,0x58d819a8
	.word	0xa072e511,0xd45c3262
	.word	0x23bd4658,0xd8def832
	.word	0xa7ae9a5d,0xc455ebc7
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0xb2579d61,0x6986d98c
	.word	0xa70e2eab,0xb17089af
	.word	0x23bd4658,0xd8def832
	.word	0x004f4668,0x0cad1049
	.word	0x146f39fa,0x8d701288
	.word	0xbc39fc0f,0x3cc85240
	.word	0xac18afb7,0x754d67c2
	.word	0x95051e06,0x48c8274c
p0_local0_sec_expect:
	.word	0xd8965e68,0x705bbb6d
	.word	0x4702eea8,0x29defc40
	.word	0x00000032,0xa4bb0373
	.word	0xf53cdb7f,0xa4b61905
	.word	0xe17da5bd,0x5d4eaae0
	.word	0x7b47ac85,0xd45fe058
	.word	0x6035b406,0xbd918c10
	.word	0xc3940c49,0x78f60b94
p0_local1_expect:
	.word	0x75989d14,0x7dbefcc5
	.word	0x253d6108,0x29f84957
	.word	0xa4bb0373,0x2bdb8fd2
	.word	0xf0e62c73,0x35413aff
	.word	0x16c98cc6,0x292a787e
	.word	0x39acd953,0x54c07ec7
	.word	0x443d6108,0xb5dc8926
	.word	0x85691a14,0xaf2a44ab
p0_local1_sec_expect:
	.word	0xffc520df,0x25de3618
	.word	0xd0878e66,0x49f7d2bc
	.word	0xff2dcf2c,0x89a6cf39
	.word	0x3c86d4c7,0xec3ffd50
	.word	0x5f2dcd3f,0xcca0a3d8
	.word	0x9682e724,0xfa2dcb6b
	.word	0x1ef023d6,0x97c79cee
	.word	0xcaf4d56b,0xe73ef833
p0_local2_expect:
	.word	0xb50b1349,0x24ab02ff
	.word	0x23bd4658,0xff6d10d0
	.word	0x281f262a,0x104f8603
	.word	0x2c267095,0x8dd0d11e
	.word	0x617d5462,0x0407e2e6
	.word	0xa2725375,0x7d4fe95b
	.word	0x64a4e083,0x92cb0696
	.word	0x18a9c8c3,0x4c634495
p0_local2_sec_expect:
	.word	0x8213cbb4,0x56ca4bfd
	.word	0xcfcbf5af,0x0a85c18f
	.word	0x4f10d4f6,0xc35d69ab
	.word	0x5e384626,0x992f08ff
	.word	0x1d70a400,0x7570bace
	.word	0xb5419856,0xfa7d60a2
	.word	0x23c06f14,0xfc0d2fc8
	.word	0xcd948a42,0x8e283664
p0_local3_expect:
	.word	0xd8965e68,0xd45c3262
	.word	0x7c0f022f,0x164b61ec
	.word	0x917efd44,0x076effff
	.word	0x186f0490,0xc40846f2
	.word	0xf9756033,0xf4e3f7a6
	.word	0x0420c2cb,0x01f6b163
	.word	0xc8e038c1,0x23792596
	.word	0xe46f1fc8,0xc3075519
p0_local3_sec_expect:
	.word	0xd9e9eeca,0x517dc4fa
	.word	0x256a7a34,0x20983c0f
	.word	0x09b7aa1a,0x0f473a1d
	.word	0x2411e02d,0xfaa3451b
	.word	0xe1e14af0,0xd538b84b
	.word	0xf7fd8e8a,0x08600bda
	.word	0xc35b589a,0x9e9072ee
	.word	0xd5ca398c,0xfbee95fc
p0_local4_expect:
	.word	0xff270903,0x3d5e50f3
	.word	0xffdd74aa,0xfffff562
	.word	0x3b3c3942,0x809147b0
	.word	0x1fe04ab0,0x6affabb0
	.word	0xa05062ac,0x38c2171c
	.word	0xb04756ea,0x3b895361
	.word	0xc84b6528,0x3a9d7a26
	.word	0xec614b16,0x2f020f7c
p0_local4_sec_expect:
	.word	0xc87d3238,0xa1c40ecb
	.word	0xcd1e1a53,0x16c4c708
	.word	0xff55f9b0,0xb57e7584
	.word	0xc1c4b222,0xc46dca22
	.word	0x95b99870,0xda810ec4
	.word	0x5450b0d5,0x1a0ee35e
	.word	0x74640374,0x91a82411
	.word	0x5df155e7,0x8c399dc4
p0_local5_expect:
	.word	0x03e2015e,0xf1e33423
	.word	0x00000093,0x4afe7ec6
	.word	0x26449f02,0xedcdba71
	.word	0x8ee101df,0x4a9551f2
	.word	0xfa2a3ab1,0x3bf15e2a
	.word	0xd90f43fb,0x5a718ca4
	.word	0xffffffff,0xffffffff
	.word	0xf6df7484,0x483dd0b5
p0_local5_sec_expect:
	.word	0x03736b6e,0x8cf7b013
	.word	0x029f4f63,0x7b5cce9e
	.word	0xab74b903,0xf201c74a
	.word	0xff20b4c2,0x16ae5d93
	.word	0x3b6f10b3,0xf1dc6e3a
	.word	0x1317d5e6,0x73f0963e
	.word	0xb4829bd5,0x7fcb550a
	.word	0x8af225b7,0x8ca5211b
p0_local6_expect:
	.word	0x00000000,0x0000339f
	.word	0x44b8aaf2,0xaa74dd54
	.word	0xcaeee9d9,0x2bdb8fd2
	.word	0xb0abff6a,0xb04ae01f
	.word	0x1c17c238,0xac6250a0
	.word	0x6153893b,0xea5647b0
	.word	0x267a9d3a,0x28654bc8
	.word	0x7c0f022f,0x164b61ec
p0_local6_sec_expect:
	.word	0x00e55aa6,0x259aaa56
	.word	0x28a02104,0x4389e7d8
	.word	0xec614b16,0x2f020f7c
	.word	0xf10cbf46,0xa588eb49
	.word	0x828f34cd,0xcd716a48
	.word	0x18b47f7e,0xd37899e1
	.word	0x5aa17e64,0xfee3da5a
	.word	0x3f2cca97,0x05e32cc1
share0_expect:
	.word	0x4770fcac,0x9201edeb
	.word	0xefcd076f,0x80e53a74
	.word	0x34ab4969,0x74e615df
	.word	0x2b4e7098,0x281a62b3
	.word	0x0870ef5c,0x9bc05143
	.word	0x93f9639d,0x5a1d1afc
	.word	0xfdf20aa3,0x842fd208
	.word	0x4b135010,0xadaf7c19
share1_expect:
	.word	0x61ffc321,0x68d33e6c
	.word	0x94521aa8,0x7a734d03
	.word	0xdecb053c,0x9bbb3580
	.word	0x228089ea,0x2256083a
	.word	0x6bfd712e,0x0a753021
	.word	0x2dc93102,0x8953958d
	.word	0x8ecfca94,0x88c07540
	.word	0x13cf2b1f,0xf8cb8ba0
	.word	0xffff99be,0xfe55bbd1
	.word	0xf81c0cac,0x9903b097
	.word	0xfbcbf616,0x93f1eafd
	.word	0xecc75d4a,0xf7375b67
	.word	0xb053ddf5,0x4d10bf24
	.word	0xa0ba11e6,0x57bc7c1c
	.word	0xab886006,0xa107b57e
	.word	0x33eceb96,0x125af4e7
share2_expect:
	.word	0x962a1c4a,0x67e39c3a
	.word	0x0873de0d,0x799d209f
	.word	0x8effc948,0x31a839e4
	.word	0x62791f13,0x94af9ccb
	.word	0x39b5c5f3,0x5a874a7f
	.word	0xdea43700,0x6a8d62b3
	.word	0x3e12a739,0x98bef46c
	.word	0xe0491a8f,0x15cbe224
share3_expect:
	.word	0x4dae4dcc,0xb49f52b0
	.word	0xa207fbf0,0x0373867c
	.word	0x6f26dc0b,0x859fc46b
	.word	0x34d4562b,0x361d0267
	.word	0x799abe05,0xe174fa18
	.word	0x966d5e82,0x701a3ceb
	.word	0x15125f7d,0x99391a6b
	.word	0x13bdb88b,0x4c623026
	.word	0x01ffbbcd,0x1f50f110
	.word	0x550bb4c5,0x4c25ea56
	.word	0x0f04cf6d,0xa693aeef
	.word	0xc8c61957,0x7a1f64f8
	.word	0xe3155c3c,0x40252461
	.word	0xcafef2fc,0x7c5aa67a
	.word	0xc8aa50c4,0x4f7e5867
	.word	0xdbc31114,0x6f5f4567
	.word	0xb53ab584,0x027c953f
	.word	0x45d2ed25,0x6006713a
	.word	0x9f8034d6,0x398be5eb
	.word	0xb32c1c7f,0xb0628509
	.word	0xbe338374,0xa0ce723a
	.word	0x83428997,0x20ddb0ca
	.word	0x02ecdbba,0x81bd81eb
	.word	0x5222305f,0xdb121251
	.word	0x4701d94b,0xff2e9aac
	.word	0x948832a6,0x3ae0b262
	.word	0xce6a012f,0xc0ca518a
	.word	0xbe5107b1,0x84bd8c4a
	.word	0xa0725dde,0x08f08b36
	.word	0xd2b513b9,0xe7ef2030
	.word	0xfe3ccfd2,0x0ed75663
	.word	0x0a2b2aaf,0x73150814
	.word	0xff3c07c4,0x47ba0aea
	.word	0x655c0ec7,0x39d4c5e7
	.word	0x63cf463a,0x0ef420e5
	.word	0x98ea3fe4,0x1fa74011
	.word	0x36734ad3,0xc7482817
	.word	0x5b664e68,0x98e674a1
	.word	0x9228ee64,0x679b1cab
	.word	0xd9c293f8,0x2311508d
	.word	0x6f99967f,0x2a87d1a7
	.word	0xaf7cb723,0x844d667d
	.word	0x3a3edb9f,0x56c5700a
	.word	0x7d78e311,0x4b8435c6
	.word	0x80595b63,0xdebf2a11
	.word	0x7acae5a5,0xc70bee85
	.word	0x5b221bf6,0xa9196d9c
	.word	0x030e2a6f,0xd2c343ab
	.word	0x199fd0a0,0xcce54575
	.word	0x3ab56500,0x8ae42862
	.word	0xb89fe694,0x9653ed22
	.word	0x370b0807,0xc7dee3e9
	.word	0x4232b3a6,0x93cd9b55
	.word	0xd186fa8d,0x26838ed5
	.word	0xaa54a56a,0x6794a512
	.word	0x76cc331b,0x335194e8
	.word	0x129a50ef,0x8a819d7f
	.word	0x4e31948f,0x45611ece
	.word	0x3e0c830d,0xc264d9e8
	.word	0xb2c8f079,0x0c20f2bf
	.word	0x93f5acac,0x8c4a53cb
	.word	0xeeb3de8f,0x0b7a81fe
	.word	0x29fd9771,0x921ffb53
	.word	0x77da076e,0x25bcd568
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
	.word	0xb96773e8,0x27b298e7
	.word	0x00000000,0x00000002
	.word	0x240b5880,0x7501f869
	.word	0x00000000,0x00000003
	.word	0xed0b1a48,0x02dc2279
	.word	0x00000000,0x00000004
	.word	0x87d51698,0x1ae6a233
	.word	0x00000000,0x00000005
	.word	0x82d4a437,0x809f3c81
	.word	0x00000000,0x00000006
	.word	0xae65b067,0x9a073676
	.word	0x00000000,0x00000007
	.word	0xe1112168,0x2ebc04d2
	.word	0x00000000,0x00000008
	.word	0x968cf107,0xcb33b96f
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
	.word	0xb2579d61,0x6986d98c,0x630e2eab,0xb17089af
	.word	0xf56351ca,0x30003c51,0x532b4668,0x0cad1049
	.word	0x27e8c49a,0x8d701288,0xbc39fc0f,0x3cc85240
	.word	0xac18afb7,0x754d67c2,0x95051e06,0x48c8274c
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
	.word	0xd8965e68,0x705bbb6d,0x0cae061b,0x0e801431
	.word	0x64ea19c6,0x6f839ecb,0xf53cdb7f,0xa4b61905
	.word	0xe17da5bd,0x5d4eaae0,0x7b47ac85,0xd45fe058
	.word	0x6035b406,0xbd918c10,0xc3940c49,0x78f60b94
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
	.word	0x75989d14,0x7dbefcc5,0xb8becb5d,0x890260f4
	.word	0xcaeee9d9,0x2bdb8fd2,0xf0e62c73,0x35413a53
	.word	0x16c98cc6,0x292a787e,0x39acd953,0x54c07ec7
	.word	0x6593b2f0,0xb5dc8926,0x85691a14,0xaf2a44ab
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
	.word	0x3c69d95b,0x25de3618,0xd0878e66,0x49f7d2bc
	.word	0x722dcf2c,0x89a6cf39,0x3c86d4c7,0xec3ffd50
	.word	0x5f2dcd3f,0xcca0a3d8,0x9682e724,0xfa2dcb6b
	.word	0x1ef023d6,0x97c79cee,0xcaf4d56b,0xe73ef833
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
	.word	0xb50b1349,0x24ab02ff,0xe52be777,0xff6d10d0
	.word	0x281f262a,0x104f8603,0x2c267095,0x8dd0d11e
	.word	0x617d5462,0x0407e2e6,0xa2725375,0x7d4fe95b
	.word	0x64a4e083,0x92cb0696,0x18a9c8c3,0x4c634495
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
	.word	0x8213cbb4,0x56ca4bfd,0xcfcbf5af,0x0a85c18f
	.word	0x1bced4f6,0xc35d69ab,0x5e384626,0x992f08ff
	.word	0x1d70a400,0x7570bace,0xb5419856,0xfa7d60a2
	.word	0x23c06f14,0xfc0d2fc8,0xcd948a42,0x8e283664
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
	.word	0xa072e511,0xd45c3262,0x1d17886e,0x7205a03a
	.word	0x917efd44,0x076ed24f,0x186f0490,0xc40846f2
	.word	0xf9756033,0xf4e3f7a6,0x0420c2cb,0x01f6b163
	.word	0xc8e038c1,0x23792596,0xe46f1fc8,0xc3075519
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
	.word	0x62f5badc,0x517dc4fa,0x135cd64e,0x20983c0f
	.word	0x09b7aa1a,0x0f473a1d,0x2411e02d,0xfaa3451b
	.word	0xe1e14af0,0xd538b84b,0xf7fd8e8a,0x08600bda
	.word	0xc35b589a,0x9e9072ee,0xd5ca398c,0xfbee95fc
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
	.word	0x1bd50903,0x3d5e50f3,0x54dd74aa,0xf2aab844
	.word	0x3b3c3942,0x8091652f,0x1fe04ab0,0x6affabb0
	.word	0xa05062ac,0x38c2171c,0xb04756ea,0x3b895361
	.word	0xc84b6528,0x3a9d7a26,0xec614b16,0x2f020f7c
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
	.word	0xc87d3238,0xa1c40ecb,0xcd1e1a53,0x16c4c708
	.word	0x9255f9b0,0xb57e7584,0xc1c4b222,0xc46dca22
	.word	0x95b99870,0xda810ec4,0x5450b0d5,0x1a0ee35e
	.word	0x74640374,0x91a82411,0x5df155e7,0x8c399dc4
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
	.word	0x03e2015e,0xf1e33423,0x1758339f,0x4afe7ec6
	.word	0x26449f02,0xedcdba71,0x8ee101df,0x4a9551f2
	.word	0xfa2a3ab1,0x3bf15e2a,0xd90f43fb,0x5a718ca4
	.word	0xb8a3154e,0xd5567c9a,0xf6df7484,0x483dd0b5
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
	.word	0x04a76b6e,0x8cf7b013,0xcafa4f63,0x7b5cce9e
	.word	0xab74b903,0xf201c74a,0xff20b4c2,0x16ae5d93
	.word	0x3b6f10b3,0xf1dc6e3a,0x1317d5e6,0x73f0963e
	.word	0xb4829bd5,0x7fcb550a,0x8af225b7,0x8ca5211b
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
	.word	0x5e610fb8,0xa4bb0373,0xbb85c3a7,0x62dfef41
	.word	0x93b30020,0x8675702d,0x89257e09,0x2b4c3756
	.word	0xebca517e,0x1322610b,0xad84988f,0xf5fdb6f9
	.word	0x008c89a2,0x22ffc8bd,0x8d919c62,0x29722e7f
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
	.word	0x8c345aa6,0x259aaa56,0x28a02104,0x4389e7d8
	.word	0x54f90903,0xa9ebb4a7,0xf10cbf46,0xa588eb49
	.word	0x828f34cd,0xcd716a48,0x18b47f7e,0xd37899e1
	.word	0x5aa17e64,0xfee3da5a,0x3f2cca97,0x05e32cc1
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
	.word	0x4770fcac,0x9201edeb,0xefcd076f,0x80e53a74
	.word	0x34ab4969,0x74e615df,0x2b4e7098,0x281a62b3
	.word	0x0870ef5c,0x9bc05143,0x93f9639d,0x5a1d1afc
	.word	0xfdf20aa3,0x842fd208,0x4b135010,0xadaf7c19
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
	.word	0x61e5c321,0x68d33e6c,0x94521aa8,0x7a734d03
	.word	0xdecb053c,0x9bbb3580,0x228089ea,0x2256083a
	.word	0x6bfd712e,0x0a753021,0x2dc93102,0x8953958d
	.word	0x8ecfca94,0x88c07540,0x13cf2b1f,0xf8cb8ba0
	.word	0x123299be,0xfe55bbd1,0xf81c0cac,0x9903b097
	.word	0xfbcbf616,0x93f1eafd,0xecc75d4a,0xf7375b67
	.word	0xb053ddf5,0x4d10bf24,0xa0ba11e6,0x57bc7c1c
	.word	0xab886006,0xa107b57e,0x33eceb96,0x125af4e7
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
	.word	0x962a1c4a,0x67e39c3a,0x0873de0d,0x799d209f
	.word	0x8effc948,0x31a839e4,0x62791f13,0x94af9ccb
	.word	0x39b5c5f3,0x5a874a7f,0xdea43700,0x6a8d62b3
	.word	0x3e12a739,0x98bef46c,0xe0491a8f,0x15cbe224
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
	.word	0x4dae4dcc,0xb49f52b0,0xa207fbf0,0x0373867c
	.word	0x6f26dc0b,0x859fc46b,0x34d4562b,0x361d0267
	.word	0x799abe05,0xe174fa18,0x966d5e82,0x701a3ceb
	.word	0x15125f7d,0x99391a6b,0x13bdb88b,0x4c623026
	.word	0x0185bbcd,0x1f50f110,0x550bb4c5,0x4c25ea56
	.word	0x0f04cf6d,0xa693aeef,0xc8c61957,0x7a1f64f8
	.word	0xe3155c3c,0x40252461,0xcafef2fc,0x7c5aa67a
	.word	0xc8aa50c4,0x4f7e5867,0xdbc31114,0x6f5f4567
	.word	0xb53ab584,0x027c953f,0x45d2ed25,0x6006713a
	.word	0x9f8034d6,0x398be5eb,0xb32c1c7f,0xb0628509
	.word	0xbe338374,0xa0ce723a,0x83428997,0x20ddb0ca
	.word	0x02ecdbba,0x81bd81eb,0x5222305f,0xdb121251
	.word	0x4701d94b,0xff2e9aac,0x948832a6,0x3ae0b262
	.word	0xce6a012f,0xc0ca518a,0xbe5107b1,0x84bd8c4a
	.word	0xa0725dde,0x08f08b36,0xd2b513b9,0xe7ef2030
	.word	0xfe3ccfd2,0x0ed75663,0x0a2b2aaf,0x73150814
	.word	0xba3c07c4,0x47ba0aea,0x655c0ec7,0x39d4c5e7
	.word	0x63cf463a,0x0ef420e5,0x98ea3fe4,0x1fa74011
	.word	0x36734ad3,0xc7482817,0x5b664e68,0x98e674a1
	.word	0x9228ee64,0x679b1cab,0xd9c293f8,0x2311508d
	.word	0x6f99967f,0x2a87d1a7,0xaf7cb723,0x844d667d
	.word	0x3a3edb9f,0x56c5700a,0x7d78e311,0x4b8435c6
	.word	0x80595b63,0xdebf2a11,0x7acae5a5,0xc70bee85
	.word	0x5b221bf6,0xa9196d9c,0x030e2a6f,0xd2c343ab
	.word	0x199fd0a0,0xcce54575,0x3ab56500,0x8ae42862
	.word	0xb89fe694,0x9653ed22,0x370b0807,0xc7dee3e9
	.word	0x4232b3a6,0x93cd9b55,0xd186fa8d,0x26838ed5
	.word	0xaa54a56a,0x6794a512,0x76cc331b,0x335194e8
	.word	0x129a50ef,0x8a819d7f,0x4e31948f,0x45611ece
	.word	0x3e0c830d,0xc264d9e8,0xb2c8f079,0x0c20f2bf
	.word	0x93f5acac,0x8c4a53cb,0xeeb3de8f,0x0b7a81fe
	.word	0x29fd9771,0x921ffb53,0x77da076e,0x25bcd568
share3_end:
