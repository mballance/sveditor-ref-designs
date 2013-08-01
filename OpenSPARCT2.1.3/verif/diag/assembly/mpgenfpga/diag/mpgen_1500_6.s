/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_6.s
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
!	Seed = 330103131
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1500_6.s created on Mar 30, 2009 (10:31:31)
!	RC file : mar26.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar26.rc -o mpgen_1500_6 -p 1 -l 1500

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
!	%f0  = ac7ec92c e37cc357 369d37e5 6538d146
!	%f4  = ed4ff044 b075bdfb 1efe678c 75ceb7ee
!	%f8  = 4e283f11 35c51cdf 1e5aefbb 69c1d312
!	%f12 = 246b1a28 2238748d bb0912dd d9c93902
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 0c760cf9 ba6df26a 5c36fd04 bdb26398
!	%f20 = 66611fec de36977b 2b168a52 066d5eb1
!	%f24 = 3a6501ba c93e1b14 b192740c 3c5c3be9
!	%f28 = e9b71d10 8e4212ee 2bd10c67 964d48d7
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 572c40ca adbfd51f 99252452 f2143b56
!	%f36 = 1930712a ca4d1f17 ba779b9b 775494bf
!	%f40 = e5c5fdf9 20b0470b 2bdfc8fa 2d4af679
!	%f44 = ee3194ca 90e361f8 0a8a4a38 85657312
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x1dd3386f00000003,%g7,%g1 ! GSR scale =  0, align = 3
	wr	%g1,%g0,%gsr		! GSR = 1dd3386f00000003
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[00000000300c1408] = 44405fe9, %l5 = 803dcf6a3d297b57
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 0000000044405fe9
!	Mem[0000000010101408] = b8a334c0, %f10 = 1e5aefbb
	lda	[%i4+%o4]0x88,%f10	! %f10 = b8a334c0
!	%l4 = 24559198565cb6a6, Mem[0000000020800040] = 8d1c75f2
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = b6a675f2
!	Mem[0000000010101410] = 69b97530 73d7afe2, %l6 = bb94337d, %l7 = 8d5ecf94
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 0000000073d7afe2 0000000069b97530
!	%l6 = 73d7afe2, %l7 = 69b97530, Mem[0000000010001430] = e480a62a dd8db524
	std	%l6,[%i0+0x030]		! Mem[0000000010001430] = 73d7afe2 69b97530
!	%l6 = 73d7afe2, %l7 = 69b97530, Mem[0000000030141410] = decdece6 8d54af27
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 73d7afe2 69b97530
!	Mem[0000000030081408] = 2d4e1d67, %l0 = 9caf383c95cd13de
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = 0000000000002d4e
!	Mem[0000000010101410] = 73d7afe2, %l7 = 0000000069b97530
	lduwa	[%i4+%o5]0x88,%l7	! %l7 = 0000000073d7afe2
!	Mem[0000000010141400] = a9dfebea8028e6fd, %l0 = 0000000000002d4e
	ldxa	[%i5+%g0]0x88,%l0	! %l0 = a9dfebea8028e6fd
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = b78bd3df, %l7 = 0000000073d7afe2
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 000000b7000000ff

p0_label_2:
!	%f18 = 5c36fd04, Mem[0000000010181408] = e6a5e781
	st	%f18,[%i6+%o4]		! Mem[0000000010181408] = 5c36fd04
!	Mem[0000000010081420] = e517610a, %l6 = 0000000073d7afe2
	swap	[%i2+0x020],%l6		! %l6 = 00000000e517610a
!	Mem[0000000010181408] = 04fd365c, %l6 = 00000000e517610a
	swapa	[%i6+%o4]0x88,%l6	! %l6 = 0000000004fd365c
!	%f11 = 69c1d312, Mem[0000000030181408] = c644efaa
	sta	%f11,[%i6+%o4]0x89	! Mem[0000000030181408] = 69c1d312
!	%l5 = 0000000044405fe9, Mem[00000000100c1428] = 7a782d7c95d78134
	stx	%l5,[%i3+0x028]		! Mem[00000000100c1428] = 0000000044405fe9
!	Mem[0000000010141400] = fde62880, %l6 = 0000000004fd365c
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 000000fd000000ff
!	%f25 = c93e1b14, Mem[0000000010001400] = 55510c83
	sta	%f25,[%i0+%g0]0x80	! Mem[0000000010001400] = c93e1b14
!	Mem[0000000010101408] = b8a334c0, %l0 = a9dfebea8028e6fd
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 000000c0000000ff
!	Mem[000000001008143c] = 0f4a1457, %l0 = 00000000000000c0
	ldstub	[%i2+0x03c],%l0		! %l0 = 0000000f000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = d600acbcf9b38a07, %l4 = 24559198565cb6a6
	ldxa	[%i6+%g0]0x88,%l4	! %l4 = d600acbcf9b38a07

p0_label_3:
!	Mem[0000000010001408] = 1f561886, %f13 = 2238748d
	lda	[%i0+%o4]0x88,%f13	! %f13 = 1f561886
!	Mem[0000000010081400] = 62915f2a, %l5 = 0000000044405fe9
	lduba	[%i2+%g0]0x88,%l5	! %l5 = 000000000000002a
!	Mem[0000000030041400] = 194ffc26, %l3 = 1050504adfc228c4
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 00000000194ffc26
!	Mem[0000000010181410] = 30f49982, %l5 = 000000000000002a
	ldsha	[%i6+%o5]0x80,%l5	! %l5 = 00000000000030f4
!	Mem[0000000021800040] = 04743c69, %l0 = 000000000000000f
	ldub	[%o3+0x040],%l0		! %l0 = 0000000000000004
!	Mem[0000000030101410] = 4f5ba8a87cd628cf, %l3 = 00000000194ffc26
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = 4f5ba8a87cd628cf
!	Mem[00000000100c1410] = 01303666, %f17 = ba6df26a
	lda	[%i3+%o5]0x88,%f17	! %f17 = 01303666
!	Mem[0000000010041410] = e2bf01b0, %l1 = c9259657ca643574
	lduwa	[%i1+%o5]0x80,%l1	! %l1 = 00000000e2bf01b0
!	Mem[0000000010141418] = 62f61f63 ce4965b8, %l6 = 000000fd, %l7 = 000000b7
	ldd	[%i5+0x018],%l6		! %l6 = 0000000062f61f63 00000000ce4965b8
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 8a6a9354, %l6 = 0000000062f61f63
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 000000008a6a9354

p0_label_4:
!	%f12 = 246b1a28 1f561886, %l1 = 00000000e2bf01b0
!	Mem[0000000010041400] = 3620ab7471a96f98
	stda	%f12,[%i1+%l1]ASI_PST32_PL ! Mem[0000000010041400] = 3620ab7471a96f98
!	%f18 = 5c36fd04 bdb26398, Mem[0000000030041408] = 28a948b2 9ba20627
	stda	%f18,[%i1+%o4]0x89	! Mem[0000000030041408] = 5c36fd04 bdb26398
!	%l2 = dd6b16b0751c2a32, Mem[0000000010001400] = 141b3ec9
	stba	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 141b3e32
!	%f18 = 5c36fd04 bdb26398, Mem[0000000010081408] = 53f4d9a3 38a53cc3
	stda	%f18,[%i2+%o4]0x80	! Mem[0000000010081408] = 5c36fd04 bdb26398
!	%l3 = 4f5ba8a87cd628cf, Mem[0000000030181400] = 62f61f63d1072fb7
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 4f5ba8a87cd628cf
!	%f12 = 246b1a28 1f561886, Mem[0000000030141410] = 73d7afe2 69b97530
	stda	%f12,[%i5+%o5]0x81	! Mem[0000000030141410] = 246b1a28 1f561886
!	%f17 = 01303666, Mem[0000000010181410] = 30f49982
	sta	%f17,[%i6+%o5]0x80	! Mem[0000000010181410] = 01303666
!	%l4 = f9b38a07, %l5 = 000030f4, Mem[0000000010001410] = 4d8621cd 5e391914
	stda	%l4,[%i0+0x010]%asi	! Mem[0000000010001410] = f9b38a07 000030f4
!	%f8  = 4e283f11 35c51cdf, %l2 = dd6b16b0751c2a32
!	Mem[0000000030141428] = 767636faff5ffee5
	add	%i5,0x028,%g1
	stda	%f8,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030141428] = 767636fa113f284e
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 26fc4f19, %l4 = d600acbcf9b38a07
	ldswa	[%i1+%g0]0x89,%l4	! %l4 = 0000000026fc4f19

p0_label_5:
!	%l0 = 00000004, %l1 = e2bf01b0, Mem[0000000030041410] = ff8bd3df d17fef5e
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000004 e2bf01b0
!	Mem[00000000211c0000] = bde32060, %l1 = 00000000e2bf01b0
	ldub	[%o2+0x001],%l1		! %l1 = 00000000000000e3
!	Mem[0000000030001410] = 6286e4ff, %l5 = 00000000000030f4
	ldswa	[%i0+%o5]0x89,%l5	! %l5 = 000000006286e4ff
!	Mem[0000000010141408] = da1bc7ebb856b588, %l0 = 0000000000000004
	ldx	[%i5+%o4],%l0		! %l0 = da1bc7ebb856b588
!	Mem[000000001010140c] = 2fe27e4a, %l7 = 00000000ce4965b8
	ldsw	[%i4+0x00c],%l7		! %l7 = 000000002fe27e4a
!	Mem[0000000030041410] = 04000000, %l3 = 4f5ba8a87cd628cf
	ldsba	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = ffe62880, %l6 = 000000008a6a9354
	lduha	[%i5+%g0]0x80,%l6	! %l6 = 000000000000ffe6
!	Mem[0000000020800040] = b6a675f2, %l6 = 000000000000ffe6
	ldsba	[%o1+0x041]%asi,%l6	! %l6 = ffffffffffffffa6
!	Mem[0000000030181410] = 58a26dd6, %l4 = 0000000026fc4f19
	ldswa	[%i6+%o5]0x89,%l4	! %l4 = 0000000058a26dd6
!	Starting 10 instruction Store Burst
!	Mem[000000001010143d] = 7f77732d, %l2 = dd6b16b0751c2a32
	ldstuba	[%i4+0x03d]%asi,%l2	! %l2 = 00000077000000ff

p0_label_6:
!	Mem[00000000201c0001] = 0b3100a6, %l2 = 0000000000000077
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 00000031000000ff
!	Mem[00000000100c1408] = 60e86d54, %l6 = ffffffffffffffa6
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 00000060000000ff
!	%f8  = 4e283f11 35c51cdf, Mem[0000000010101408] = ff34a3b8 2fe27e4a
	stda	%f8 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 4e283f11 35c51cdf
!	Mem[00000000100c142e] = 44405fe9, %l4 = 0000000058a26dd6
	ldstub	[%i3+0x02e],%l4		! %l4 = 0000005f000000ff
!	%f26 = b192740c 3c5c3be9, %l3 = 0000000000000000
!	Mem[00000000300c1400] = 337b67bd2f08c0f8
	stda	%f26,[%i3+%l3]ASI_PST32_SL ! Mem[00000000300c1400] = 337b67bd2f08c0f8
!	%l6 = 00000060, %l7 = 2fe27e4a, Mem[0000000010001428] = 5ad3bfe8 9e0a9481
	std	%l6,[%i0+0x028]		! Mem[0000000010001428] = 00000060 2fe27e4a
!	%l7 = 000000002fe27e4a, Mem[0000000010141410] = 3c6e42ca
	stha	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 3c6e7e4a
!	%l6 = 0000000000000060, Mem[00000000300c1408] = 577b293d
	stha	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0060293d
!	%f6  = 1efe678c, Mem[00000000100c1410] = 66363001
	st	%f6 ,[%i3+%o5]		! Mem[00000000100c1410] = 1efe678c
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 1efe678c, %l4 = 000000000000005f
	ldsba	[%i3+%o5]0x80,%l4	! %l4 = 000000000000001e

p0_label_7:
!	Mem[0000000030001410] = ffe48662, %l1 = 00000000000000e3
	lduwa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ffe48662
!	Mem[0000000030001408] = c4762ade, %f6  = 1efe678c
	lda	[%i0+%o4]0x81,%f6 	! %f6 = c4762ade
!	Mem[0000000030141400] = 69dd3f80, %l1 = 00000000ffe48662
	ldsha	[%i5+%g0]0x81,%l1	! %l1 = 00000000000069dd
!	Mem[0000000030101400] = e690516e, %l2 = 0000000000000031
	ldswa	[%i4+%g0]0x81,%l2	! %l2 = ffffffffe690516e
!	Mem[000000001004142c] = 2065a59b, %l5 = 000000006286e4ff
	lduba	[%i1+0x02e]%asi,%l5	! %l5 = 00000000000000a5
!	Mem[00000000100c1400] = b711420e, %l5 = 00000000000000a5
	ldswa	[%i3+%g0]0x80,%l5	! %l5 = ffffffffb711420e
!	Mem[00000000201c0000] = 0bff00a6, %l6 = 0000000000000060
	ldub	[%o0+0x001],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010001424] = 5e200dad, %l6 = 00000000000000ff
	lduba	[%i0+0x025]%asi,%l6	! %l6 = 0000000000000020
!	Mem[0000000030041408] = bdb26398, %f20 = 66611fec
	lda	[%i1+%o4]0x89,%f20	! %f20 = bdb26398
!	Starting 10 instruction Store Burst
!	Mem[0000000010001414] = 000030f4, %l2 = ffffffffe690516e, %asi = 80
	swapa	[%i0+0x014]%asi,%l2	! %l2 = 00000000000030f4

p0_label_8:
!	Mem[0000000030181410] = d66da258, %l0 = da1bc7ebb856b588
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 000000d6000000ff
!	%f10 = b8a334c0 69c1d312, %l0 = 00000000000000d6
!	Mem[0000000010181430] = e32c2092ee57b475
	add	%i6,0x030,%g1
	stda	%f10,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010181430] = e32cc169c034b475
!	%f12 = 246b1a28 1f561886, Mem[00000000300c1410] = 7e33f606 12d3ca0e
	stda	%f12,[%i3+%o5]0x81	! Mem[00000000300c1410] = 246b1a28 1f561886
!	%l4 = 0000001e, %l5 = b711420e, Mem[0000000010001410] = 078ab3f9 6e5190e6
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000001e b711420e
!	%l6 = 0000000000000020, Mem[0000000030001410] = ffe4866272d08867
	stxa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000020
!	%l2 = 00000000000030f4, Mem[0000000010081400] = 62915f2a
	stwa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 000030f4
!	Mem[00000000100c1408] = 546de8ff, %l4 = 000000000000001e
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 00000000546de8ff
!	%f10 = b8a334c0 69c1d312, %l1 = 00000000000069dd
!	Mem[0000000030041400] = 194ffc26bbdd5e5c
	stda	%f10,[%i1+%l1]ASI_PST32_S ! Mem[0000000030041400] = 194ffc2669c1d312
!	%l6 = 0000000000000020, Mem[0000000010101410] = e2afd773
	stha	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 0020d773
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0e4211b7, %l6 = 0000000000000020
	lduba	[%i3+%g0]0x88,%l6	! %l6 = 00000000000000b7

p0_label_9:
!	Mem[0000000010101418] = 6880e6e056d7ddbc, %l0 = 00000000000000d6
	ldx	[%i4+0x018],%l0		! %l0 = 6880e6e056d7ddbc
!	Mem[0000000010001408] = 8618561f, %l4 = 00000000546de8ff
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = ffffffff8618561f
!	Mem[0000000010041400] = 74ab2036, %l2 = 00000000000030f4
	lduba	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000036
!	Mem[0000000010081408] = 04fd365c, %l0 = 6880e6e056d7ddbc
	lduha	[%i2+%o4]0x88,%l0	! %l0 = 000000000000365c
!	Mem[00000000100c1410] = 7e01d6368c67fe1e, %l5 = ffffffffb711420e
	ldxa	[%i3+%o5]0x88,%l5	! %l5 = 7e01d6368c67fe1e
!	Mem[0000000030101400] = 6e5190e6, %l4 = ffffffff8618561f
	ldsba	[%i4+%g0]0x89,%l4	! %l4 = ffffffffffffffe6
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010101400] = 15590540 1cfdb3a2 4e283f11 35c51cdf
!	Mem[0000000010101410] = 0020d773 3075b969 6880e6e0 56d7ddbc
!	Mem[0000000010101420] = 89ad5cf6 26fc9a75 6e321cde 459816d8
!	Mem[0000000010101430] = f11a25e8 420e70dc 6dab3ab6 7fff732d
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400
!	Mem[0000000030001408] = c4762ade, %l3 = 0000000000000000
	ldswa	[%i0+%o4]0x81,%l3	! %l3 = ffffffffc4762ade
!	Mem[0000000021800100] = 258d008a, %l1 = 00000000000069dd
	ldsh	[%o3+0x100],%l1		! %l1 = 000000000000258d
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (2)
!	%l1 = 000000000000258d, Mem[0000000010101408] = 4e283f11
	stwa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000258d

p0_label_10:
!	%f0  = a2b3fd1c 40055915, %l3 = ffffffffc4762ade
!	Mem[0000000030041410] = 00000004e2bf01b0
	add	%i1,0x010,%g1
	stda	%f0,[%g1+%l3]ASI_PST8_S ! Mem[0000000030041410] = a2b3001c400559b0
!	%f2  = df1cc535 113f284e, Mem[00000000100c1410] = 1efe678c 36d6017e
	stda	%f2 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = df1cc535 113f284e
!	Mem[0000000030101408] = 9a0dd11d, %l6 = 00000000000000b7
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 0000001d000000ff
!	%l1 = 000000000000258d, Mem[0000000010041410] = b001bfe2
	stba	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = b001bf8d
!	Mem[0000000030101408] = 9a0dd1ff, %l3 = ffffffffc4762ade
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 000000009a0dd1ff
!	Mem[0000000030181410] = 58a26dff, %l6 = 000000000000001d
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	%l2 = 0000000000000036, Mem[0000000010101414] = 3075b969
	sth	%l2,[%i4+0x014]		! Mem[0000000010101414] = 0036b969
!	Mem[00000000300c1408] = 3d296000, %l7 = 000000002fe27e4a
	ldstuba	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f11 = de1c326e, Mem[0000000010101408] = 0000258d
	sta	%f11,[%i4+%o4]0x80	! Mem[0000000010101408] = de1c326e
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ad9806b5e517610a, %f18 = 5c36fd04 bdb26398
	ldda	[%i6+%o4]0x88,%f18	! %f18 = ad9806b5 e517610a

p0_label_11:
!	Mem[0000000010141430] = f992df9b93ff39ac, %f0  = a2b3fd1c 40055915
	ldd	[%i5+0x030],%f0 	! %f0  = f992df9b 93ff39ac
!	Mem[0000000030181410] = ff6da258, %l2 = 0000000000000036
	ldsha	[%i6+%o5]0x81,%l2	! %l2 = ffffffffffffff6d
!	Mem[0000000010141400] = ffe62880, %l2 = ffffffffffffff6d
	lduwa	[%i5+%g0]0x80,%l2	! %l2 = 00000000ffe62880
!	Mem[0000000030081400] = 233507b1, %f17 = 01303666
	lda	[%i2+%g0]0x89,%f17	! %f17 = 233507b1
!	Mem[0000000010101408] = de1c326e, %l0 = 000000000000365c
	lduha	[%i4+%o4]0x80,%l0	! %l0 = 000000000000de1c
!	Mem[0000000010041400] = 3620ab7471a96f98, %f10 = d8169845 de1c326e
	ldda	[%i1+%g0]0x80,%f10	! %f10 = 3620ab74 71a96f98
!	Mem[0000000010141400] = a9dfebea8028e6ff, %l0 = 000000000000de1c
	ldxa	[%i5+%g0]0x88,%l0	! %l0 = a9dfebea8028e6ff
!	Mem[0000000020800040] = b6a675f2, %l1 = 000000000000258d
	ldub	[%o1+0x040],%l1		! %l1 = 00000000000000b6
!	Mem[0000000030081400] = 233507b1, %l4 = ffffffffffffffe6
	lduwa	[%i2+%g0]0x89,%l4	! %l4 = 00000000233507b1
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = dbecf7bd, %l5 = 7e01d6368c67fe1e
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 00000000dbecf7bd

p0_label_12:
!	Mem[0000000030041410] = a2b3001c, %l1 = 00000000000000b6
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 00000000a2b3001c
!	%l2 = 00000000ffe62880, Mem[0000000010181400] = 078ab3f9bcac00d6
	stxa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000ffe62880
!	%l7 = 0000000000000000, Mem[000000001010140b] = de1c326e, %asi = 80
	stba	%l7,[%i4+0x00b]%asi	! Mem[0000000010101408] = de1c3200
!	%l2 = 00000000ffe62880, Mem[0000000010181400] = 00000000
	stha	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 28800000
!	%l0 = 8028e6ff, %l1 = a2b3001c, Mem[00000000100c1408] = 0000001e 5a3743be
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 8028e6ff a2b3001c
!	Mem[0000000010081420] = 73d7afe2, %l2 = 00000000ffe62880, %asi = 80
	swapa	[%i2+0x020]%asi,%l2	! %l2 = 0000000073d7afe2
!	%f8  = 759afc26 f65cad89, %l4 = 00000000233507b1
!	Mem[0000000030101428] = b7329cc0d379c7d0
	add	%i4,0x028,%g1
	stda	%f8,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030101428] = 89ad5cf6d379c7d0
!	Mem[0000000030081400] = 233507b1, %l5 = 00000000dbecf7bd
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 000000b1000000ff
!	Mem[0000000010081410] = 1efe678c, %l2 = 0000000073d7afe2
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 000000001efe678c
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 3620ab74, %l1 = 00000000a2b3001c
	lduha	[%i1+%g0]0x80,%l1	! %l1 = 0000000000003620

p0_label_13:
!	Mem[0000000021800180] = 2d0d0fa6, %l3 = 000000009a0dd1ff
	ldsba	[%o3+0x181]%asi,%l3	! %l3 = 000000000000000d
!	Mem[0000000010041408] = f087e6a9, %l1 = 0000000000003620
	ldub	[%i1+%o4],%l1		! %l1 = 00000000000000f0
!	Mem[000000001010141c] = 56d7ddbc, %f19 = e517610a
	lda	[%i4+0x01c]%asi,%f19	! %f19 = 56d7ddbc
!	Mem[0000000010181400] = 00008028, %l1 = 00000000000000f0
	lduba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000028
!	Mem[0000000010081418] = 81c016a136fbcbd8, %l7 = 0000000000000000
	ldx	[%i2+0x018],%l7		! %l7 = 81c016a136fbcbd8
!	Mem[0000000010141414] = 706a7de5, %l2 = 000000001efe678c
	ldsba	[%i5+0x016]%asi,%l2	! %l2 = 000000000000007d
!	Mem[0000000030081400] = 233507ff, %l3 = 000000000000000d
	lduwa	[%i2+%g0]0x89,%l3	! %l3 = 00000000233507ff
!	Mem[0000000010041410] = b001bf8d, %f7  = e0e68068
	lda	[%i1+%o5]0x88,%f7 	! %f7 = b001bf8d
!	Mem[0000000030001400] = 9a018a5d, %l7 = 81c016a136fbcbd8
	ldsha	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffff9a01
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 0000001e, %l5 = 00000000000000b1
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 0000001e000000ff

p0_label_14:
!	Mem[0000000030041400] = 26fc4f19, %l7 = ffffffffffff9a01
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 0000000026fc4f19
!	Mem[00000000300c1408] = ff60293d, %l4 = 00000000233507b1
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 00000000ff60293d
!	Mem[00000000300c1400] = 337b67bd2f08c0f8, %f14 = 2d73ff7f b63aab6d
	ldda	[%i3+%g0]0x81,%f14	! %f14 = 337b67bd 2f08c0f8
!	%l4 = 00000000ff60293d, Mem[0000000010101408] = df1cc53500321cde
	stxa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000ff60293d
!	Mem[0000000030101408] = de2a76c4, %l3 = 00000000233507ff
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 00000000de2a76c4
!	Mem[0000000010041410] = 8dbf01b0, %l4 = 00000000ff60293d
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 000000008dbf01b0
!	%l4 = 000000008dbf01b0, Mem[00000000100c1410] = df1cc535
	stw	%l4,[%i3+%o5]		! Mem[00000000100c1410] = 8dbf01b0
!	%l1 = 0000000000000028, Mem[0000000010081410] = e2afd773
	stha	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 0028d773
!	Mem[0000000010041408] = f087e6a9, %l6 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 00000000f087e6a9
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 03b2d81973d72800, %l0 = a9dfebea8028e6ff
	ldxa	[%i2+%o5]0x88,%l0	! %l0 = 03b2d81973d72800

p0_label_15:
!	Mem[0000000030101408] = 233507ff, %l7 = 0000000026fc4f19
	lduha	[%i4+%o4]0x81,%l7	! %l7 = 0000000000002335
!	Mem[0000000021800040] = 04743c69, %l7 = 0000000000002335
	ldsba	[%o3+0x041]%asi,%l7	! %l7 = 0000000000000074
!	Mem[00000000211c0000] = bde32060, %l3 = 00000000de2a76c4
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffbde3
!	Mem[0000000030141408] = ac382bc5, %l3 = ffffffffffffbde3
	ldsha	[%i5+%o4]0x89,%l3	! %l3 = 0000000000002bc5
!	Mem[0000000030181408] = 12d3c169e59229bd, %f2  = df1cc535 113f284e
	ldda	[%i6+%o4]0x81,%f2 	! %f2  = 12d3c169 e59229bd
!	Mem[0000000030141410] = 246b1a28 1f561886, %l4 = 8dbf01b0, %l5 = 0000001e
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 00000000246b1a28 000000001f561886
!	Mem[00000000100c1410] = 8dbf01b0, %l3 = 0000000000002bc5
	ldsha	[%i3+%o5]0x80,%l3	! %l3 = ffffffffffff8dbf
!	Mem[0000000030001410] = 0000000000000020, %f2  = 12d3c169 e59229bd
	ldda	[%i0+%o5]0x81,%f2 	! %f2  = 00000000 00000020
!	Mem[00000000300c1400] = 337b67bd2f08c0f8, %f2  = 00000000 00000020
	ldda	[%i3+%g0]0x81,%f2 	! %f2  = 337b67bd 2f08c0f8
!	Starting 10 instruction Store Burst
!	%l4 = 00000000246b1a28, Mem[0000000030141410] = 8618561f281a6b24
	stxa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000246b1a28

p0_label_16:
!	%f12 = dc700e42 e8251af1, %l2 = 000000000000007d
!	Mem[0000000030041428] = b3c9358dcf01060a
	add	%i1,0x028,%g1
	stda	%f12,[%g1+%l2]ASI_PST8_S ! Mem[0000000030041428] = b3700e42e82506f1
!	Mem[0000000010041420] = 5cdbdbcd, %l3 = ffffffffffff8dbf, %asi = 80
	swapa	[%i1+0x020]%asi,%l3	! %l3 = 000000005cdbdbcd
!	%l4 = 246b1a28, %l5 = 1f561886, Mem[0000000010101410] = 0020d773 0036b969
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 246b1a28 1f561886
!	Mem[0000000010081408] = 04fd365c, %l2 = 000000000000007d
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 0000000004fd365c
!	%l3 = 000000005cdbdbcd, Mem[0000000030081410] = 242505e6
	stha	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 2425dbcd
!	Mem[00000000211c0001] = bde32060, %l4 = 00000000246b1a28
	ldstub	[%o2+0x001],%l4		! %l4 = 000000e3000000ff
!	%l2 = 04fd365c, %l3 = 5cdbdbcd, Mem[0000000010081400] = f4300000 e289cf0a
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 04fd365c 5cdbdbcd
!	Mem[0000000010041408] = 000000ff, %l6 = 00000000f087e6a9
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041400] = ffff9a01, %l3 = 000000005cdbdbcd
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 00000001000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 04fd365c, %l2 = 0000000004fd365c
	lduha	[%i2+%g0]0x80,%l2	! %l2 = 00000000000004fd

p0_label_17:
!	Mem[0000000010101420] = 89ad5cf626fc9a75, %f16 = 0c760cf9 233507b1
	ldd	[%i4+0x020],%f16	! %f16 = 89ad5cf6 26fc9a75
!	Mem[000000001000141c] = d74d26f5, %l5 = 000000001f561886
	ldsh	[%i0+0x01c],%l5		! %l5 = ffffffffffffd74d
!	Mem[0000000030141400] = 803fdd69, %l2 = 00000000000004fd
	ldswa	[%i5+%g0]0x89,%l2	! %l2 = ffffffff803fdd69
!	Mem[00000000300c1408] = 233507b1, %l5 = ffffffffffffd74d
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000023
!	Mem[000000001000142c] = 2fe27e4a, %l6 = 00000000000000ff
	lduh	[%i0+0x02c],%l6		! %l6 = 0000000000002fe2
!	Mem[00000000201c0000] = 0bff00a6, %l0 = 03b2d81973d72800
	lduh	[%o0+%g0],%l0		! %l0 = 0000000000000bff
!	Mem[0000000030081408] = 2d4e1d67aca1f2e9, %f4  = 69b97530 73d72000
	ldda	[%i2+%o4]0x81,%f4 	! %f4  = 2d4e1d67 aca1f2e9
!	Mem[00000000300c1410] = 281a6b24, %l0 = 0000000000000bff
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000024
!	Mem[0000000010181434] = c034b475, %f18 = ad9806b5
	ld	[%i6+0x034],%f18	! %f18 = c034b475
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = b6a675f2, %l2 = ffffffff803fdd69
	ldstub	[%o1+0x041],%l2		! %l2 = 000000a6000000ff

p0_label_18:
!	%l0 = 0000000000000024, Mem[0000000010081410] = 0028d773
	stwa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000024
!	Mem[00000000100c1425] = f47aead5, %l1 = 0000000000000028
	ldstub	[%i3+0x025],%l1		! %l1 = 0000007a000000ff
!	%l1 = 000000000000007a, Mem[00000000100c1408] = ffe62880
	stba	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 7ae62880
!	%l2 = 000000a6, %l3 = 00000001, Mem[00000000300c1408] = 233507b1 a8550329
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000a6 00000001
!	%l7 = 0000000000000074, Mem[0000000010001408] = 8618561f87d3446a
	stxa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000074
!	%f10 = 3620ab74, Mem[000000001004143c] = c2902ae5
	sta	%f10,[%i1+0x03c]%asi	! Mem[000000001004143c] = 3620ab74
!	Mem[0000000030101400] = 6e5190e6, %l4 = 00000000000000e3
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 000000e6000000ff
!	Mem[0000000030081410] = cddb2524, %l2 = 00000000000000a6
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 000000cd000000ff
!	%f20 = bdb26398 de36977b, Mem[00000000100c1408] = 7ae62880 1c00b3a2
	stda	%f20,[%i3+%o4]0x80	! Mem[00000000100c1408] = bdb26398 de36977b
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 0a6117e5, %l4 = 00000000000000e6
	lduwa	[%i6+%o4]0x80,%l4	! %l4 = 000000000a6117e5

p0_label_19:
!	Mem[0000000010181400] = 28800000, %l5 = 0000000000000023
	ldsha	[%i6+%g0]0x80,%l5	! %l5 = 0000000000002880
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010081400] = 04fd365c 5cdbdbcd 7d000000 bdb26398
!	Mem[0000000010081410] = 00000024 19d8b203 81c016a1 36fbcbd8
!	Mem[0000000010081420] = ffe62880 56811a7f 9962f259 da936a0e
!	Mem[0000000010081430] = 2030a508 8d36e38c 25b22013 ff4a1457
	ldda	[%i2]ASI_BLK_P,%f0	! Block Load from 0000000010081400
!	Mem[0000000030181408] = 69c1d312, %l7 = 0000000000000074
	lduwa	[%i6+%o4]0x89,%l7	! %l7 = 0000000069c1d312
!	Mem[0000000010001400] = 141b3e32, %l5 = 0000000000002880
	lduba	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000032
!	Mem[0000000030101400] = 6e5190ff, %l0 = 0000000000000024
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 000000006e5190ff
!	Mem[00000000100c1410] = 4e283f11b001bf8d, %l4 = 000000000a6117e5
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = 4e283f11b001bf8d
!	Mem[0000000030041410] = 000000b6, %f19 = 56d7ddbc
	lda	[%i1+%o5]0x81,%f19	! %f19 = 000000b6
!	Mem[0000000010101408] = 3d2960ff, %l2 = 00000000000000cd
	ldsba	[%i4+%o4]0x80,%l2	! %l2 = 000000000000003d
!	Mem[0000000030101400] = ff90516e0365c3ba, %l0 = 000000006e5190ff
	ldxa	[%i4+%g0]0x81,%l0	! %l0 = ff90516e0365c3ba
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = 0bff00a6, %l5 = 0000000000000032
	ldstub	[%o0+%g0],%l5		! %l5 = 0000000b000000ff

p0_label_20:
!	Mem[0000000010141434] = 93ff39ac, %l6 = 0000000000002fe2
	swap	[%i5+0x034],%l6		! %l6 = 0000000093ff39ac
!	%l0 = ff90516e0365c3ba, Mem[00000000300c1410] = 281a6b24
	stha	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 281ac3ba
!	%l0 = ff90516e0365c3ba, Mem[0000000010001408] = 00000000
	stba	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = ba000000
!	%f28 = e9b71d10 8e4212ee, %l7 = 0000000069c1d312
!	Mem[0000000010041400] = 3620ab7471a96f98
	stda	%f28,[%i1+%l7]ASI_PST8_P ! Mem[0000000010041400] = 3620ab1071a91298
!	%l4 = 4e283f11b001bf8d, Mem[0000000030041410] = b6000000
	stwa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = b001bf8d
!	%l3 = 0000000000000001, Mem[0000000030181408] = 69c1d312
	stha	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 69c10001
!	%f16 = 89ad5cf6 26fc9a75, Mem[0000000010141410] = 4a7e6e3c 706a7de5
	stda	%f16,[%i5+%o5]0x80	! Mem[0000000010141410] = 89ad5cf6 26fc9a75
!	%l6 = 93ff39ac, %l7 = 69c1d312, Mem[0000000010101408] = ff60293d 00000000
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 93ff39ac 69c1d312
!	%l7 = 0000000069c1d312, Mem[00000000300c1400] = bd677b33
	stha	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = bd67d312
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = b6ff75f2, %l2 = 000000000000003d
	lduha	[%o1+0x040]%asi,%l2	! %l2 = 000000000000b6ff

p0_label_21:
!	Mem[0000000010081400] = 5c36fd04, %l5 = 000000000000000b
	lduwa	[%i2+%g0]0x88,%l5	! %l5 = 000000005c36fd04
!	Mem[00000000218000c0] = d79056e2, %l6 = 0000000093ff39ac
	ldub	[%o3+0x0c0],%l6		! %l6 = 00000000000000d7
!	Mem[0000000030041410] = b001bf8d, %l0 = ff90516e0365c3ba
	lduha	[%i1+%o5]0x89,%l0	! %l0 = 000000000000bf8d
!	Mem[0000000030081408] = 671d4e2d, %l4 = 4e283f11b001bf8d
	lduha	[%i2+%o4]0x89,%l4	! %l4 = 0000000000004e2d
!	Mem[0000000020800000] = a42e4c7b, %l2 = 000000000000b6ff
	ldsb	[%o1+%g0],%l2		! %l2 = ffffffffffffffa4
!	Mem[0000000030081408] = 2d4e1d67, %l3 = 0000000000000001
	lduha	[%i2+%o4]0x81,%l3	! %l3 = 0000000000002d4e
!	Mem[0000000010181400] = 00008028, %l1 = 000000000000007a
	ldsha	[%i6+%g0]0x88,%l1	! %l1 = ffffffffffff8028
!	Mem[0000000010081400] = 04fd365c, %l5 = 000000005c36fd04
	ldsha	[%i2+0x002]%asi,%l5	! %l5 = 000000000000365c
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000004e2d
	ldsha	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = 3a6501ba c93e1b14, Mem[0000000010141410] = 89ad5cf6 26fc9a75
	stda	%f24,[%i5+%o5]0x80	! Mem[0000000010141410] = 3a6501ba c93e1b14

p0_label_22:
!	%l3 = 0000000000002d4e, Mem[0000000030001408] = c4762ade
	stha	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 2d4e2ade
!	%l2 = ffffffffffffffa4, Mem[0000000010141410] = ba01653a
	stba	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = ba0165a4
!	%f30 = 2bd10c67 964d48d7, Mem[0000000010041430] = cc10640a 4dd7a574
	std	%f30,[%i1+0x030]	! Mem[0000000010041430] = 2bd10c67 964d48d7
!	%l6 = 000000d7, %l7 = 69c1d312, Mem[00000000100c1408] = 9863b2bd 7b9736de
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000d7 69c1d312
!	Mem[0000000030181408] = 0100c169, %l3 = 0000000000002d4e
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 00000001000000ff
!	%l0 = 0000bf8d, %l1 = ffff8028, Mem[00000000100c1410] = 8dbf01b0 113f284e
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000bf8d ffff8028
!	Mem[0000000030101410] = cf28d67c, %l7 = 0000000069c1d312
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 000000cf000000ff
!	%l3 = 0000000000000001, Mem[0000000010181408] = 0a6117e5
	stba	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 016117e5
!	%f22 = 2b168a52 066d5eb1, %l5 = 000000000000365c
!	Mem[00000000100c1408] = d700000012d3c169
	add	%i3,0x008,%g1
	stda	%f22,[%g1+%l5]ASI_PST16_P ! Mem[00000000100c1408] = 2b168a5212d3c169
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 93ff39ac, %l3 = 0000000000000001
	ldsba	[%i4+%o4]0x88,%l3	! %l3 = ffffffffffffffac

p0_label_23:
!	%f25 = c93e1b14, Mem[0000000010141424] = da58a03f
	st	%f25,[%i5+0x024]	! Mem[0000000010141424] = c93e1b14
!	Mem[0000000010101438] = 6dab3ab6 7fff732d, %l0 = 0000bf8d, %l1 = ffff8028
	ldd	[%i4+0x038],%l0		! %l0 = 000000006dab3ab6 000000007fff732d
!	Mem[00000000300c1410] = bac31a28, %l5 = 000000000000365c
	ldswa	[%i3+%o5]0x81,%l5	! %l5 = ffffffffbac31a28
!	Mem[0000000010181400] = 8028e6ff00008028, %l0 = 000000006dab3ab6
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = 8028e6ff00008028
!	Mem[0000000030001400] = 2eba0fcc5d8a019a, %l2 = ffffffffffffffa4
	ldxa	[%i0+%g0]0x89,%l2	! %l2 = 2eba0fcc5d8a019a
!	Mem[0000000010001410] = ff000000, %f7  = 36fbcbd8
	lda	[%i0+%o5]0x80,%f7 	! %f7 = ff000000
!	Mem[00000000100c1410] = 0000bf8d ffff8028, %l6 = 000000d7, %l7 = 000000cf
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 000000000000bf8d 00000000ffff8028
!	Mem[0000000030101400] = bac365036e5190ff, %l6 = 000000000000bf8d
	ldxa	[%i4+%g0]0x89,%l6	! %l6 = bac365036e5190ff
!	Mem[0000000010001400] = 323e1b14, %f28 = e9b71d10
	lda	[%i0+%g0]0x80,%f28	! %f28 = 323e1b14
!	Starting 10 instruction Store Burst
!	%l1 = 000000007fff732d, Mem[000000001018143f] = 8e885507, %asi = 80
	stba	%l1,[%i6+0x03f]%asi	! Mem[000000001018143c] = 8e88552d

p0_label_24:
!	%l5 = ffffffffbac31a28, Mem[0000000010141410] = a46501bac93e1b14
	stxa	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffffbac31a28
!	%f19 = 000000b6, Mem[0000000010041410] = ff60293d
	sta	%f19,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000b6
!	Mem[0000000010081410] = 24000000, %l2 = 2eba0fcc5d8a019a
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = 15590540, %l3 = ffffffac, %l4 = 00000000
	casa	[%i4]0x80,%l3,%l4	! %l4 = 0000000015590540
!	%l0 = 00008028, %l1 = 7fff732d, Mem[0000000030181410] = ff6da258 a868f892
	stda	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00008028 7fff732d
!	%l2 = 0000000000000000, Mem[0000000030081408] = 671d4e2d
	stha	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 671d0000
!	%l6 = bac365036e5190ff, Mem[0000000010101420] = 89ad5cf6, %asi = 80
	stha	%l6,[%i4+0x020]%asi	! Mem[0000000010101420] = 90ff5cf6
!	Mem[0000000010141429] = 72c4c675, %l6 = bac365036e5190ff
	ldstub	[%i5+0x029],%l6		! %l6 = 000000c4000000ff
!	%f8  = ffe62880, Mem[0000000010001408] = 000000ba
	sta	%f8 ,[%i0+%o4]0x88	! Mem[0000000010001408] = ffe62880
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff000000 0e4211b7, %l2 = 00000000, %l3 = ffffffac
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 00000000ff000000 000000000e4211b7

p0_label_25:
!	Mem[0000000010081400] = 04fd365c, %l0 = 8028e6ff00008028
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = 00000000000004fd
!	Mem[0000000030001400] = 2eba0fcc5d8a019a, %f20 = bdb26398 de36977b
	ldda	[%i0+%g0]0x89,%f20	! %f20 = 2eba0fcc 5d8a019a
!	Mem[0000000010101408] = ac39ff9312d3c169, %f18 = c034b475 000000b6
	ldd	[%i4+%o4],%f18		! %f18 = ac39ff93 12d3c169
!	Mem[0000000030141410] = 246b1a28, %l4 = 0000000015590540
	ldsha	[%i5+%o5]0x89,%l4	! %l4 = 0000000000001a28
!	Mem[0000000030101400] = ff90516e0365c3ba, %l5 = ffffffffbac31a28
	ldxa	[%i4+%g0]0x81,%l5	! %l5 = ff90516e0365c3ba
!	Mem[0000000010001410] = ff000000, %l3 = 000000000e4211b7
	lduba	[%i0+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141408] = c52b38ac, %l7 = 00000000ffff8028
	lduba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000c5
!	Mem[0000000010181410] = 01303666, %f5  = 19d8b203
	ld	[%i6+%o5],%f5 	! %f5 = 01303666
!	Mem[0000000010101428] = 6e321cde 459816d8, %l4 = 00001a28, %l5 = 0365c3ba
	ldd	[%i4+0x028],%l4		! %l4 = 000000006e321cde 00000000459816d8
!	Starting 10 instruction Store Burst
!	%f5  = 01303666, Mem[0000000030101408] = 233507ff
	sta	%f5 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 01303666

p0_label_26:
!	Mem[0000000010081410] = 240000ff, %l4 = 000000006e321cde
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%l0 = 00000000000004fd, Mem[0000000010101433] = f11a25e8
	stb	%l0,[%i4+0x033]		! Mem[0000000010101430] = f11a25fd
!	Mem[0000000030141400] = 69dd3f80, %l5 = 00000000459816d8
	swapa	[%i5+%g0]0x81,%l5	! %l5 = 0000000069dd3f80
!	%f26 = b192740c 3c5c3be9, %l4 = 00000000000000ff
!	Mem[0000000010181400] = 28800000ffe62880
	stda	%f26,[%i6+%l4]ASI_PST16_PL ! Mem[0000000010181400] = e93b5c3c0c7492b1
!	%f30 = 2bd10c67, Mem[0000000030081410] = 2425dbff
	sta	%f30,[%i2+%o5]0x89	! Mem[0000000030081410] = 2bd10c67
!	%l6 = 00000000000000c4, Mem[0000000010001410] = ff000000
	stwa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000c4
!	Mem[00000000300c1400] = bd67d312, %l1 = 000000007fff732d
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 00000000bd67d312
!	%f0  = 04fd365c 5cdbdbcd, %l1 = 00000000bd67d312
!	Mem[0000000030141418] = 7779f56712d72c8c
	add	%i5,0x018,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030141418] = 7779db5c12d72c8c
!	%f30 = 2bd10c67 964d48d7, Mem[0000000010001400] = 323e1b14 a716d4b2
	stda	%f30,[%i0+%g0]0x80	! Mem[0000000010001400] = 2bd10c67 964d48d7
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff00a6, %l7 = 00000000000000c5
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff

p0_label_27:
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010181400] = e93b5c3c 0c7492b1 016117e5 b50698ad
!	Mem[0000000010181410] = 01303666 b3e1b9f1 eeeccf13 55768edf
!	Mem[0000000010181420] = 0d5d6048 46601c9b 67cbcd9f a28b8558
!	Mem[0000000010181430] = e32cc169 c034b475 b32d2359 8e88552d
	ldda	[%i6]ASI_BLK_P,%f0	! Block Load from 0000000010181400
!	Mem[0000000010181420] = 0d5d6048, %l2 = 00000000ff000000
	ldub	[%i6+0x023],%l2		! %l2 = 0000000000000048
!	Mem[0000000030181400] = 4f5ba8a8, %l2 = 0000000000000048
	ldsha	[%i6+%g0]0x81,%l2	! %l2 = 0000000000004f5b
!	Mem[0000000030001408] = 2d4e2ade 3ce7f672, %l4 = 000000ff, %l5 = 69dd3f80
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 000000002d4e2ade 000000003ce7f672
!	Mem[0000000010041400] = 3620ab10, %l0 = 00000000000004fd
	ldsba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000036
!	Mem[0000000010141410] = ffffffffbac31a28, %l6 = 00000000000000c4
	ldxa	[%i5+%o5]0x80,%l6	! %l6 = ffffffffbac31a28
!	Mem[0000000030141408] = c52b38ac, %f31 = 964d48d7
	lda	[%i5+%o4]0x81,%f31	! %f31 = c52b38ac
!	Mem[0000000010081408] = 7d000000, %l0 = 0000000000000036
	ldub	[%i2+0x00a],%l0		! %l0 = 0000000000000000
!	Mem[0000000010081410] = ff000024, %l4 = 000000002d4e2ade
	ldsha	[%i2+%o5]0x80,%l4	! %l4 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l1 = 00000000bd67d312, Mem[0000000030001408] = 2d4e2ade3ce7f672
	stxa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000bd67d312

p0_label_28:
!	%l2 = 0000000000004f5b, Mem[0000000030101408] = 66363001
	stba	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 6636305b
!	%l5 = 000000003ce7f672, Mem[0000000010041428] = 2da16c1d2065a59b, %asi = 80
	stxa	%l5,[%i1+0x028]%asi	! Mem[0000000010041428] = 000000003ce7f672
!	%l2 = 0000000000004f5b, Mem[0000000030041400] = ff9affff
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 4f5bffff
!	%l2 = 00004f5b, %l3 = 000000ff, Mem[00000000100c1400] = b711420e 758179cc
	stda	%l2,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00004f5b 000000ff
!	%l6 = ffffffffbac31a28, Mem[000000001014143e] = 79b08954
	stb	%l6,[%i5+0x03e]		! Mem[000000001014143c] = 79b02854
!	Mem[0000000030001410] = 00000000, %l1 = 00000000bd67d312
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l2 = 00004f5b, %l3 = 000000ff, Mem[0000000030181400] = a8a85b4f cf28d67c
	stda	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00004f5b 000000ff
!	Mem[0000000030141408] = c52b38ac, %l7 = ffffffffffffffff
	swapa	[%i5+%o4]0x81,%l7	! %l7 = 00000000c52b38ac
!	%f23 = 066d5eb1, Mem[0000000030141408] = ffffffff
	sta	%f23,[%i5+%o4]0x81	! Mem[0000000030141408] = 066d5eb1
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000a6 00000001, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000a6 0000000000000001

p0_label_29:
!	Mem[0000000010001410] = 000000c40e4211b7, %l3 = 00000000000000ff
	ldxa	[%i0+%o5]0x80,%l3	! %l3 = 000000c40e4211b7
!	Mem[0000000010181420] = 0d5d604846601c9b, %l4 = ffffffffffffff00
	ldx	[%i6+0x020],%l4		! %l4 = 0d5d604846601c9b
!	Mem[0000000010141410] = ffffffff, %l0 = 00000000000000a6
	lduba	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081400] = ff073523, %l7 = 00000000c52b38ac
	lduwa	[%i2+%g0]0x81,%l7	! %l7 = 00000000ff073523
!	Mem[0000000010181410] = 01303666, %l4 = 0d5d604846601c9b
	ldsba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000001
!	Mem[0000000030001400] = 5d8a019a, %l3 = 000000c40e4211b7
	lduwa	[%i0+%g0]0x89,%l3	! %l3 = 000000005d8a019a
!	Mem[000000001000142c] = 2fe27e4a, %l4 = 0000000000000001
	ldswa	[%i0+0x02c]%asi,%l4	! %l4 = 000000002fe27e4a
!	Mem[0000000010101400] = 15590540, %l1 = 0000000000000001
	ldsha	[%i4+%g0]0x80,%l1	! %l1 = 0000000000001559
!	Mem[0000000030001410] = 12d367bd00000020, %f28 = 323e1b14 8e4212ee
	ldda	[%i0+%o5]0x81,%f28	! %f28 = 12d367bd 00000020
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000004f5b, Mem[0000000010001408] = ffe62880
	stha	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = ffe64f5b

p0_label_30:
!	%l1 = 0000000000001559, Mem[00000000211c0000] = bdff2060
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 15592060
!	Mem[000000001004140c] = ff82025e, %l3 = 000000005d8a019a, %asi = 80
	swapa	[%i1+0x00c]%asi,%l3	! %l3 = 00000000ff82025e
	membar	#Sync			! Added by membar checker (5)
!	%l4 = 2fe27e4a, %l5 = 3ce7f672, Mem[0000000010181400] = e93b5c3c 0c7492b1
	stda	%l4,[%i6+0x000]%asi	! Mem[0000000010181400] = 2fe27e4a 3ce7f672
!	%f26 = b192740c 3c5c3be9, Mem[0000000010081410] = ff000024 19d8b203
	stda	%f26,[%i2+%o5]0x80	! Mem[0000000010081410] = b192740c 3c5c3be9
!	%l5 = 000000003ce7f672, Mem[0000000010041410] = b6000000
	stha	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = b600f672
!	Mem[00000000218000c1] = d79056e2, %l7 = 00000000ff073523
	ldstuba	[%o3+0x0c1]%asi,%l7	! %l7 = 00000090000000ff
!	%l0 = 000000ff, %l1 = 00001559, Mem[0000000010081400] = 5c36fd04 cddbdb5c
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff 00001559
!	%l7 = 0000000000000090, Mem[0000000010081408] = 7d000000
	stwa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000090
!	%l1 = 0000000000001559, Mem[0000000030141408] = b15e6d06
	stba	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = b15e6d59
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = e5176101, %l4 = 000000002fe27e4a
	ldswa	[%i6+%o4]0x88,%l4	! %l4 = ffffffffe5176101

p0_label_31:
!	Mem[0000000010081408] = 00000090, %l5 = 000000003ce7f672
	ldsw	[%i2+%o4],%l5		! %l5 = 0000000000000090
!	Mem[00000000100c1410] = 0000bf8d, %l4 = ffffffffe5176101
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 233507ff, %l4 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001410] = 12d367bd, %l5 = 0000000000000090
	lduha	[%i0+%o5]0x81,%l5	! %l5 = 00000000000012d3
!	Mem[00000000100c1410] = 0000bf8d, %f21 = 5d8a019a
	ld	[%i3+%o5],%f21	! %f21 = 0000bf8d
!	Mem[0000000010001400] = 2bd10c67, %l6 = ffffffffbac31a28
	ldsh	[%i0+0x002],%l6		! %l6 = 0000000000000c67
!	Mem[0000000010001400] = 2bd10c67964d48d7, %l4 = 00000000000000ff
	ldx	[%i0+%g0],%l4		! %l4 = 2bd10c67964d48d7
!	Mem[0000000010101430] = f11a25fd420e70dc, %f14 = b32d2359 8e88552d
	ldd	[%i4+0x030],%f14	! %f14 = f11a25fd 420e70dc
!	Mem[0000000030181410] = 00008028, %l6 = 0000000000000c67
	ldsha	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 281ac3ba, %l3 = 00000000ff82025e
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 000000ba000000ff

p0_label_32:
!	%l2 = 0000000000004f5b, Mem[0000000020800000] = a42e4c7b
	sth	%l2,[%o1+%g0]		! Mem[0000000020800000] = 4f5b4c7b
!	Mem[00000000100c1400] = 00004f5b, %l1 = 0000000000001559
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 0000000000004f5b
!	%f31 = c52b38ac, Mem[0000000030181408] = ff00c169
	sta	%f31,[%i6+%o4]0x81	! Mem[0000000030181408] = c52b38ac
!	Mem[0000000010041408] = f087e6a9, %l4 = 2bd10c67964d48d7
	ldstuba	[%i1+%o4]0x80,%l4	! %l4 = 000000f0000000ff
!	Mem[0000000030041400] = 4f5bffff, %l7 = 0000000000000090
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 0000004f000000ff
!	Mem[0000000010041428] = 00000000, %l3 = 000000ba, %l6 = 00000000
	add	%i1,0x28,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c143f] = 999b85c3, %l3 = 00000000000000ba
	ldstuba	[%i3+0x03f]%asi,%l3	! %l3 = 000000c3000000ff
!	Mem[0000000010101408] = 93ff39ac, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 0000000093ff39ac
!	%l4 = 00000000000000f0, Mem[0000000010081410] = e93b5c3c0c7492b1
	stxa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000000000f0
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff00000059150000, %l1 = 0000000000004f5b
	ldxa	[%i2+0x000]%asi,%l1	! %l1 = ff00000059150000

p0_label_33:
!	%l1 = ff00000059150000, Mem[0000000030101400] = ff90516e
	stha	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000516e
!	Mem[0000000030041410] = 8dbf01b0400559b0, %l0 = 00000000000000ff
	ldxa	[%i1+%o5]0x81,%l0	! %l0 = 8dbf01b0400559b0
!	Mem[0000000030001408] = 00000000, %l3 = 00000000000000c3
	lduwa	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = d8169845, %l6 = 0000000093ff39ac
	lduwa	[%i5+%g0]0x89,%l6	! %l6 = 00000000d8169845
!	Mem[0000000010181400] = 2fe27e4a3ce7f672, %l3 = 0000000000000000
	ldxa	[%i6+0x000]%asi,%l3	! %l3 = 2fe27e4a3ce7f672
!	Mem[0000000010001400] = 2bd10c67, %l4 = 00000000000000f0
	lduwa	[%i0+%g0]0x80,%l4	! %l4 = 000000002bd10c67
!	Mem[00000000300c1410] = 281ac3ff, %l6 = 00000000d8169845
	lduba	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181408] = bd2992e5 ac382bc5, %l0 = 400559b0, %l1 = 59150000
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 00000000ac382bc5 00000000bd2992e5
!	Mem[000000001010141c] = 56d7ddbc, %l2 = 0000000000004f5b
	lduha	[%i4+0x01c]%asi,%l2	! %l2 = 00000000000056d7
!	Starting 10 instruction Store Burst
!	%f14 = f11a25fd, Mem[0000000010081410] = f0000000
	sta	%f14,[%i2+%o5]0x80	! Mem[0000000010081410] = f11a25fd

p0_label_34:
!	Mem[0000000030001410] = 12d367bd, %l4 = 000000002bd10c67
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 00000012000000ff
!	Mem[0000000030081410] = 670cd12b, %l4 = 0000000000000012
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 00000000670cd12b
!	Mem[0000000010081410] = f11a25fd, %l7 = 000000000000004f
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 000000f1000000ff
!	Mem[0000000010001410] = c4000000, %l6 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000c4000000
!	%f6  = eeeccf13 55768edf, %l2 = 00000000000056d7
!	Mem[0000000010041400] = 3620ab1071a91298
	stda	%f6,[%i1+%l2]ASI_PST8_P ! Mem[0000000010041400] = eeecab1371768edf
!	Mem[0000000010041406] = 71768edf, %l0 = 00000000ac382bc5
	ldstub	[%i1+0x006],%l0		! %l0 = 0000008e000000ff
!	%f14 = f11a25fd 420e70dc, %l0 = 000000000000008e
!	Mem[00000000300c1410] = ffc31a281f561886
	add	%i3,0x010,%g1
	stda	%f14,[%g1+%l0]ASI_PST32_SL ! Mem[00000000300c1410] = ffc31a28fd251af1
!	Mem[0000000030101408] = 6636305b, %l1 = 00000000bd2992e5
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 000000006636305b
!	%f10 = 67cbcd9f a28b8558, %l0 = 000000000000008e
!	Mem[0000000030001420] = cd845856ea55ddfd
	add	%i0,0x020,%g1
	stda	%f10,[%g1+%l0]ASI_PST32_S ! Mem[0000000030001420] = 67cbcd9fea55ddfd
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 72f600b6, %l2 = 00000000000056d7
	lduwa	[%i1+0x010]%asi,%l2	! %l2 = 0000000072f600b6

p0_label_35:
!	Mem[00000000211c0000] = 15592060, %l0 = 000000000000008e
	ldub	[%o2+0x001],%l0		! %l0 = 0000000000000059
!	Mem[00000000211c0000] = 15592060, %l5 = 00000000000012d3
	ldub	[%o2+%g0],%l5		! %l5 = 0000000000000015
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030001400] = 9a018a5d cc0fba2e 00000000 bd67d312
!	Mem[0000000030001410] = ffd367bd 00000020 006b47d5 d1853e61
!	Mem[0000000030001420] = 67cbcd9f ea55ddfd b4388881 c7730867
!	Mem[0000000030001430] = 6c30d4cf b5ab8c66 0c407e7f 845bf642
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[00000000201c0000] = ffff00a6, %l4 = 00000000670cd12b
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010141400] = ffe62880, %l4 = 000000000000ffff
	lduwa	[%i5+%g0]0x80,%l4	! %l4 = 00000000ffe62880
!	Mem[0000000010041410] = b600f672, %l1 = 000000006636305b
	ldsha	[%i1+%o5]0x88,%l1	! %l1 = fffffffffffff672
!	Mem[0000000030001400] = 9a018a5d, %l7 = 00000000000000f1
	ldswa	[%i0+%g0]0x81,%l7	! %l7 = ffffffff9a018a5d
!	Mem[0000000030101410] = 7cd628ff, %l5 = 0000000000000015
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = 00000000000028ff
!	Mem[0000000030001410] = ffd367bd, %f14 = f11a25fd
	lda	[%i0+%o5]0x81,%f14	! %f14 = ffd367bd
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = c52b38ac, %l7 = ffffffff9a018a5d
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 000000c5000000ff

p0_label_36:
!	%l2 = 0000000072f600b6, Mem[0000000010101408] = 00000000
	stwa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 72f600b6
!	Mem[0000000030081400] = ff073523, %l7 = 00000000000000c5
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 00000000ff073523
!	%l0 = 0000000000000059, Mem[000000001018140a] = 016117e5, %asi = 80
	stba	%l0,[%i6+0x00a]%asi	! Mem[0000000010181408] = 016159e5
!	Mem[0000000010081403] = ff000000, %l1 = fffffffffffff672
	ldstub	[%i2+0x003],%l1		! %l1 = 00000000000000ff
!	%l4 = ffe62880, %l5 = 000028ff, Mem[00000000100c1430] = 31fefe5b 715860fc
	stda	%l4,[%i3+0x030]%asi	! Mem[00000000100c1430] = ffe62880 000028ff
!	%f5  = b3e1b9f1, Mem[00000000100c1408] = 2b168a52
	sta	%f5 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = b3e1b9f1
!	%l3 = 2fe27e4a3ce7f672, Mem[0000000010001400] = 670cd12b
	stba	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 670cd172
!	Mem[0000000030081408] = 671d0000, %l4 = 00000000ffe62880
	ldstuba	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%f0  = e93b5c3c 0c7492b1, Mem[0000000030041400] = ffff5bff 12d3c169
	stda	%f0 ,[%i1+%g0]0x89	! Mem[0000000030041400] = e93b5c3c 0c7492b1
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 8028e6ff, %l3 = 2fe27e4a3ce7f672
	lduwa	[%i5+%g0]0x88,%l3	! %l3 = 000000008028e6ff

p0_label_37:
!	Mem[0000000010041400] = eeecab13, %l2 = 0000000072f600b6
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = ffffffffffffffee
!	Mem[00000000100c1408] = 69c1d312 f1b9e1b3, %l0 = 00000059, %l1 = 00000000
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 00000000f1b9e1b3 0000000069c1d312
!	Mem[0000000010181420] = 0d5d6048, %f14 = ffd367bd
	lda	[%i6+0x020]%asi,%f14	! %f14 = 0d5d6048
!	Mem[0000000010141400] = ffe62880, %f5  = b3e1b9f1
	lda	[%i5+%g0]0x80,%f5 	! %f5 = ffe62880
!	Mem[000000001008143c] = ff4a1457, %l5 = 00000000000028ff
	ldsb	[%i2+0x03d],%l5		! %l5 = 000000000000004a
!	Mem[0000000030041408] = 9863b2bd, %l3 = 000000008028e6ff
	lduwa	[%i1+%o4]0x81,%l3	! %l3 = 000000009863b2bd
!	Mem[0000000010001408] = ffe64f5b, %l7 = 00000000ff073523
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = 000000000000005b
!	Mem[0000000030101400] = 6e510000, %l3 = 000000009863b2bd
	lduwa	[%i4+%g0]0x89,%l3	! %l3 = 000000006e510000
!	Mem[0000000010001400] = d7484d96 670cd172, %l4 = 00000000, %l5 = 0000004a
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 00000000670cd172 00000000d7484d96
!	Starting 10 instruction Store Burst
!	%l6 = 00000000c4000000, Mem[000000001014142c] = a0f133f6, %asi = 80
	stha	%l6,[%i5+0x02c]%asi	! Mem[000000001014142c] = 000033f6

p0_label_38:
!	%l0 = f1b9e1b3, %l1 = 69c1d312, Mem[0000000010101408] = b600f672 12d3c169
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = f1b9e1b3 69c1d312
!	%l0 = 00000000f1b9e1b3, Mem[0000000010141400] = ffe62880
	stwa	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = f1b9e1b3
!	%l0 = 00000000f1b9e1b3, Mem[0000000021800080] = 3a4903a0, %asi = 80
	stha	%l0,[%o3+0x080]%asi	! Mem[0000000021800080] = e1b303a0
!	%f4  = 01303666 ffe62880, Mem[0000000010081400] = ff0000ff 00001559
	stda	%f4 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 01303666 ffe62880
!	Mem[0000000030101410] = 7cd628ff, %l3 = 000000006e510000
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%f6  = eeeccf13, %f9  = 46601c9b
	fsqrts	%f6 ,%f9 		! %f9  = 7fffffff
!	%f18 = 00000000 bd67d312, %l4 = 00000000670cd172
!	Mem[0000000030101428] = 89ad5cf6d379c7d0
	add	%i4,0x028,%g1
	stda	%f18,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030101428] = 89ad67bdd379c7d0
!	Mem[00000000211c0000] = 15592060, %l6 = 00000000c4000000
	ldstub	[%o2+%g0],%l6		! %l6 = 00000015000000ff
!	%l5 = 00000000d7484d96, Mem[0000000010181410] = 66363001
	stwa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = d7484d96
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ffffffff, %l0 = 00000000f1b9e1b3
	lduba	[%i5+0x013]%asi,%l0	! %l0 = 00000000000000ff

p0_label_39:
!	Mem[0000000030041400] = 0c7492b1, %l2 = ffffffffffffffee
	lduba	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000b1
!	Mem[0000000010181408] = e5596101, %l4 = 00000000670cd172
	ldsha	[%i6+%o4]0x88,%l4	! %l4 = 0000000000006101
!	Mem[0000000030001410] = 20000000bd67d3ff, %l1 = 0000000069c1d312
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = 20000000bd67d3ff
!	Mem[0000000030141400] = d8169845, %f13 = c034b475
	lda	[%i5+%g0]0x89,%f13	! %f13 = d8169845
!	Mem[0000000010081418] = 81c016a136fbcbd8, %l5 = 00000000d7484d96
	ldxa	[%i2+0x018]%asi,%l5	! %l5 = 81c016a136fbcbd8
!	Mem[00000000300c1408] = 000000a6, %l7 = 000000000000005b
	ldswa	[%i3+%o4]0x81,%l7	! %l7 = 00000000000000a6
!	Mem[00000000300c1400] = f8c0082f7fff732d, %l7 = 00000000000000a6
	ldxa	[%i3+%g0]0x89,%l7	! %l7 = f8c0082f7fff732d
!	Mem[0000000010181400] = 72f6e73c4a7ee22f, %l6 = 0000000000000015
	ldxa	[%i6+%g0]0x88,%l6	! %l6 = 72f6e73c4a7ee22f
!	Mem[00000000211c0000] = ff592060, %l0 = 00000000000000ff
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = 0000000000000059
!	Starting 10 instruction Store Burst
!	%f2  = 016117e5 b50698ad, %l0 = 0000000000000059
!	Mem[0000000010081420] = ffe6288056811a7f
	add	%i2,0x020,%g1
	stda	%f2,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010081420] = ad98288056816101

p0_label_40:
!	%l4 = 0000000000006101, Mem[00000000300c1400] = f8c0082f7fff732d
	stxa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000006101
!	%f0  = e93b5c3c 0c7492b1, %l4 = 0000000000006101
!	Mem[0000000030101400] = 0000516e0365c3ba
	stda	%f0,[%i4+%l4]ASI_PST32_S ! Mem[0000000030101400] = 0000516e0c7492b1
!	Mem[0000000030141400] = 459816d8, %l5 = 81c016a136fbcbd8
	swapa	[%i5+%g0]0x81,%l5	! %l5 = 00000000459816d8
!	%l6 = 72f6e73c4a7ee22f, Mem[0000000010101408] = f1b9e1b369c1d312
	stxa	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 72f6e73c4a7ee22f
!	%f9  = 7fffffff, Mem[0000000010181410] = 964d48d7
	sta	%f9 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 7fffffff
!	Mem[0000000030041408] = 9863b2bd, %l2 = 00000000000000b1
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 000000009863b2bd
!	Mem[0000000010101436] = 420e70dc, %l2 = 000000009863b2bd
	ldstub	[%i4+0x036],%l2		! %l2 = 00000070000000ff
!	Mem[0000000010041408] = ff87e6a9, %l4 = 0000000000006101
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 00000000ff87e6a9
!	%f28 = 6c30d4cf b5ab8c66, Mem[0000000010041408] = 00006101 5d8a019a
	std	%f28,[%i1+%o4]	! Mem[0000000010041408] = 6c30d4cf b5ab8c66
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff001d67, %l4 = 00000000ff87e6a9
	ldsha	[%i2+%o4]0x81,%l4	! %l4 = ffffffffffffff00

p0_label_41:
!	Mem[0000000010141400] = f1b9e1b3, %l5 = 00000000459816d8
	lduwa	[%i5+%g0]0x80,%l5	! %l5 = 00000000f1b9e1b3
!	Mem[0000000030081410] = 12000000, %f18 = 00000000
	lda	[%i2+%o5]0x89,%f18	! %f18 = 12000000
!	Mem[0000000010101404] = 1cfdb3a2, %l2 = 0000000000000070
	ldub	[%i4+0x007],%l2		! %l2 = 00000000000000a2
!	Mem[0000000030181400] = 000000ff00004f5b, %l3 = 00000000000000ff
	ldxa	[%i6+%g0]0x89,%l3	! %l3 = 000000ff00004f5b
!	Mem[0000000030081408] = ff001d67, %l1 = 20000000bd67d3ff
	ldswa	[%i2+%o4]0x81,%l1	! %l1 = ffffffffff001d67
!	Mem[00000000300c1410] = f11a25fd 281ac3ff, %l6 = 4a7ee22f, %l7 = 7fff732d
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 00000000281ac3ff 00000000f11a25fd
!	Mem[00000000100c1400] = ff000000 59150000, %l2 = 000000a2, %l3 = 00004f5b
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 0000000059150000 00000000ff000000
!	Mem[00000000201c0000] = ffff00a6, %l7 = 00000000f11a25fd
	ldsba	[%o0+0x001]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %l7 = ffffffffffffffff
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffff00, Mem[0000000030181400] = 00004f5b
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00004f00

p0_label_42:
!	%l0 = 0000000000000059, Mem[0000000010181404] = 3ce7f672
	stw	%l0,[%i6+0x004]		! Mem[0000000010181404] = 00000059
!	Mem[0000000010141400] = b3e1b9f1, %l0 = 0000000000000059
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 00000000b3e1b9f1
!	%l5 = 00000000f1b9e1b3, Mem[0000000010001410] = 000000ff
	stha	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000e1b3
!	%l6 = 00000000281ac3ff, Mem[0000000010141400] = 00000059
	stwa	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 281ac3ff
!	Mem[00000000100c1408] = f1b9e1b3, %l3 = 00000000ff000000
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 000000b3000000ff
!	%f18 = 12000000 bd67d312, %l0 = 00000000b3e1b9f1
!	Mem[0000000010081418] = 81c016a136fbcbd8
	add	%i2,0x018,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010081418] = 12d367bd36fbcbd8
!	%l1 = ffffffffff001d67, Mem[0000000030141400] = d8cbfb36
	stwa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = ff001d67
!	Mem[0000000010101400] = 15590540, %l0 = 00000000b3e1b9f1
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 00000015000000ff
!	%l3 = 00000000000000b3, Mem[0000000010101400] = a2b3fd1c400559ff
	stxa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000b3
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ffffffff, %l2 = 0000000059150000
	ldswa	[%i5+%o5]0x80,%l2	! %l2 = ffffffffffffffff

p0_label_43:
!	Mem[00000000100c1414] = ffff8028, %l2 = ffffffffffffffff
	ldsh	[%i3+0x014],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010001424] = 5e200dad, %l0 = 0000000000000015
	lduwa	[%i0+0x024]%asi,%l0	! %l0 = 000000005e200dad
!	Mem[0000000010081424] = 56816101, %l5 = 00000000f1b9e1b3
	ldub	[%i2+0x027],%l5		! %l5 = 0000000000000001
!	Mem[0000000010081410] = fd251aff, %l3 = 00000000000000b3
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000bd67d312, %l7 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l7	! %l7 = 00000000bd67d312
!	Mem[0000000030181400] = 004f0000, %l6 = 00000000281ac3ff
	lduwa	[%i6+%g0]0x81,%l6	! %l6 = 00000000004f0000
!	Mem[0000000030081400] = 000000c5, %l2 = ffffffffffffffff
	ldswa	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000c5
!	Mem[0000000010001400] = 670cd172, %l2 = 00000000000000c5
	lduwa	[%i0+%g0]0x88,%l2	! %l2 = 00000000670cd172
!	Mem[0000000010141408] = da1bc7eb, %l7 = 00000000bd67d312
	lduba	[%i5+0x00b]%asi,%l7	! %l7 = 00000000000000eb
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = ac382bff, %l6 = 00000000004f0000
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 000000ff000000ff

p0_label_44:
!	Mem[00000000100c1400] = 00001559, %l5 = 0000000000000001
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 0000000000001559
!	%l7 = 00000000000000eb, Mem[0000000030081408] = ff001d67
	stha	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 00eb1d67
!	Mem[0000000010141408] = ebc71bda, %l4 = ffffffffffffff00
	ldstuba	[%i5+%o4]0x88,%l4	! %l4 = 000000da000000ff
!	%f2  = 016117e5 b50698ad, Mem[0000000010081400] = ffe62880 01303666
	stda	%f2 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 016117e5 b50698ad
!	%l6 = 00000000000000ff, Mem[0000000010081410] = fd251aff
	stha	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = fd2500ff
!	Mem[0000000010181400] = 2fe27e4a, %l3 = ffffffffffffffff, %asi = 80
	swapa	[%i6+0x000]%asi,%l3	! %l3 = 000000002fe27e4a
!	%l7 = 00000000000000eb, Mem[0000000010001410] = b3e10000
	stwa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000eb
!	%l4 = 00000000000000da, Mem[0000000030101400] = 0000516e0c7492b1
	stxa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000000000da
!	%l7 = 00000000000000eb, Mem[0000000030181410] = 00008028
	stha	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 00eb8028
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00006101, %l3 = 000000002fe27e4a
	lduwa	[%i3+%g0]0x89,%l3	! %l3 = 0000000000006101

p0_label_45:
!	Mem[00000000100c141c] = 684b1dba, %l0 = 000000005e200dad
	ldsha	[%i3+0x01c]%asi,%l0	! %l0 = 000000000000684b
!	Mem[0000000010001434] = 69b97530, %l0 = 000000000000684b
	ldswa	[%i0+0x034]%asi,%l0	! %l0 = 0000000069b97530
!	Mem[0000000030081408] = 671deb00, %f0  = e93b5c3c
	lda	[%i2+%o4]0x89,%f0 	! %f0 = 671deb00
!	Mem[0000000030101410] = ff28d67c, %l6 = 00000000000000ff
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = ffffffffff28d67c
!	Mem[0000000030041408] = 000000b1, %f1  = 0c7492b1
	lda	[%i1+%o4]0x81,%f1 	! %f1 = 000000b1
!	Mem[0000000030181410] = 00eb80287fff732d, %l4 = 00000000000000da
	ldxa	[%i6+%o5]0x81,%l4	! %l4 = 00eb80287fff732d
!	Mem[0000000010001408] = 5b4fe6ff, %l5 = 0000000000001559
	ldsba	[%i0+%o4]0x80,%l5	! %l5 = 000000000000005b
!	Mem[0000000010101400] = 000000b3, %l0 = 0000000069b97530
	ldsha	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000b3
!	Mem[0000000030101408] = e59229bd, %l3 = 0000000000006101
	ldsba	[%i4+%o4]0x81,%l3	! %l3 = ffffffffffffffe5
!	Starting 10 instruction Store Burst
!	%l4 = 00eb80287fff732d, Mem[0000000010041408] = 668cabb5cfd4306c
	stxa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00eb80287fff732d

p0_label_46:
!	Mem[0000000010141410] = ffffffff, %l2 = 00000000670cd172
	ldstuba	[%i5+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%l0 = 00000000000000b3, Mem[0000000030041408] = 000000b1
	stha	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00b300b1
!	%l1 = ffffffffff001d67, Mem[0000000030181410] = 00eb8028
	stba	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 67eb8028
	membar	#Sync			! Added by membar checker (7)
!	%l6 = ff28d67c, %l7 = 000000eb, Mem[0000000030001400] = 5d8a019a 2eba0fcc
	stda	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = ff28d67c 000000eb
!	Mem[0000000010181400] = ffffffff, %l3 = ffffffffffffffe5
	ldstuba	[%i6+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%f0  = 671deb00 000000b1 016117e5 b50698ad
!	%f4  = 01303666 ffe62880 eeeccf13 55768edf
!	%f8  = 0d5d6048 7fffffff 67cbcd9f a28b8558
!	%f12 = e32cc169 d8169845 0d5d6048 420e70dc
	stda	%f0,[%i6]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	Mem[0000000030001400] = ff28d67c, %l0 = 00000000000000b3
	ldstuba	[%i0+%g0]0x89,%l0	! %l0 = 0000007c000000ff
!	%f28 = 6c30d4cf b5ab8c66, %l2 = 00000000000000ff
!	Mem[0000000030181428] = 2a619e14aa6d29a9
	add	%i6,0x028,%g1
	stda	%f28,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030181428] = 668cabb5cfd4306c
!	%l6 = ffffffffff28d67c, Mem[0000000030041410] = b001bf8d
	stha	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = b001d67c
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000b3, %l3 = 00000000000000ff
	lduha	[%i4+%g0]0x88,%l3	! %l3 = 00000000000000b3

p0_label_47:
!	Mem[0000000010001438] = dab377f742c702ee, %l5 = 000000000000005b
	ldx	[%i0+0x038],%l5		! %l5 = dab377f742c702ee
!	Mem[0000000030181408] = ac382bff, %l2 = 00000000000000ff
	ldsha	[%i6+%o4]0x89,%l2	! %l2 = 0000000000002bff
!	Mem[0000000010101430] = f11a25fd420effdc, %l5 = dab377f742c702ee
	ldx	[%i4+0x030],%l5		! %l5 = f11a25fd420effdc
!	Mem[0000000020800040] = b6ff75f2, %l3 = 00000000000000b3
	lduh	[%o1+0x040],%l3		! %l3 = 000000000000b6ff
!	Mem[0000000030001410] = bd67d3ff, %l3 = 000000000000b6ff
	ldswa	[%i0+%o5]0x89,%l3	! %l3 = ffffffffbd67d3ff
!	Mem[0000000030101400] = 00000000000000da, %f16 = 9a018a5d cc0fba2e
	ldda	[%i4+%g0]0x81,%f16	! %f16 = 00000000 000000da
	membar	#Sync			! Added by membar checker (8)
!	Mem[000000001018143c] = 48605d0d, %l0 = 000000000000007c
	lduh	[%i6+0x03e],%l0		! %l0 = 0000000000005d0d
!	Mem[000000001018143c] = 48605d0d, %f28 = 6c30d4cf
	ld	[%i6+0x03c],%f28	! %f28 = 48605d0d
!	Mem[0000000030181400] = 000000ff00004f00, %l7 = 00000000000000eb
	ldxa	[%i6+%g0]0x89,%l7	! %l7 = 000000ff00004f00
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 000000b3, %l5 = f11a25fd420effdc
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 000000b3000000ff

p0_label_48:
!	Mem[0000000010001410] = eb000000, %l3 = ffffffffbd67d3ff
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l2 = 0000000000002bff, Mem[0000000030081408] = 671deb00
	stha	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 671d2bff
!	%l0 = 0000000000005d0d, Mem[0000000010041410] = bd6e81feb600f672
	stxa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000005d0d
!	%l6 = ff28d67c, %l7 = 00004f00, Mem[0000000010181408] = ad9806b5 e5176101
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = ff28d67c 00004f00
!	Mem[00000000100c1410] = 0000bf8d, %l1 = ffffffffff001d67
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 000000000000bf8d
!	Mem[0000000010001410] = eb0000ff, %l2 = 0000000000002bff
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010101400] = ff000000, %l6 = ffffffffff28d67c
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 00000000ff000000
!	%l7 = 000000ff00004f00, Mem[0000000030181410] = 67eb8028
	stba	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 00eb8028
!	Mem[0000000010041408] = 2d73ff7f, %l0 = 0000000000005d0d, %asi = 80
	swapa	[%i1+0x008]%asi,%l0	! %l0 = 000000002d73ff7f
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 671d00ff, %l5 = 00000000000000b3
	lduha	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000ff

p0_label_49:
!	Mem[0000000030101408] = bd2992e5, %l2 = 00000000000000ff
	lduha	[%i4+%o4]0x89,%l2	! %l2 = 00000000000092e5
!	Mem[00000000300c1408] = a6000000, %l7 = 000000ff00004f00
	ldsha	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = ff28d6ff, %l5 = 00000000000000ff
	lduha	[%i0+%g0]0x89,%l5	! %l5 = 000000000000d6ff
!	Mem[0000000010041430] = 2bd10c67964d48d7, %f20 = ffd367bd 00000020
	ldda	[%i1+0x030]%asi,%f20	! %f20 = 2bd10c67 964d48d7
!	Mem[0000000030001408] = 00000000, %f17 = 000000da
	lda	[%i0+%o4]0x89,%f17	! %f17 = 00000000
!	Mem[00000000300c1400] = 00006101, %l6 = 00000000ff000000
	ldsba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000001
!	Mem[0000000010041400] = dfff767113abecee, %f2  = 016117e5 b50698ad
	ldda	[%i1+%g0]0x88,%f2 	! %f2  = dfff7671 13abecee
!	Mem[0000000030001400] = 000000ebff28d6ff, %f0  = 671deb00 000000b1
	ldda	[%i0+%g0]0x89,%f0 	! %f0  = 000000eb ff28d6ff
!	Mem[000000001000140c] = 00000074, %l1 = 000000000000bf8d
	ldsh	[%i0+0x00c],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000d6ff, Mem[0000000030081408] = ff2b1d67
	stha	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = d6ff1d67

p0_label_50:
!	%f19 = bd67d312, Mem[0000000030141410] = 281a6b24
	sta	%f19,[%i5+%o5]0x81	! Mem[0000000030141410] = bd67d312
!	%l7 = 0000000000000000, Mem[00000000300c1408] = a6000000
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010001408] = ffe64f5b
	stba	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = ffe64f00
!	Mem[0000000010001400] = 72d10c67, %l6 = 0000000000000001
	swapa	[%i0+%g0]0x80,%l6	! %l6 = 0000000072d10c67
!	Mem[0000000010141400] = 281ac3ff, %l0 = 000000002d73ff7f
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 00000000281ac3ff
!	%l2 = 000092e5, %l3 = 00000000, Mem[0000000030141410] = 12d367bd 00000000
	stda	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 000092e5 00000000
!	Mem[0000000030141408] = 596d5eb1, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l7	! %l7 = 00000000596d5eb1
!	Mem[0000000010041428] = 000000003ce7f672, %l1 = 0000000000000000, %l0 = 00000000281ac3ff
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 000000003ce7f672
!	Mem[0000000030001410] = ffd367bd, %l5 = 000000000000d6ff
	lduba	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ac382bff, %l0 = 000000003ce7f672
	ldsha	[%i6+%o4]0x89,%l0	! %l0 = 0000000000002bff

p0_label_51:
!	Mem[00000000100c1438] = 6e2751d5, %l7 = 00000000596d5eb1
	ldswa	[%i3+0x038]%asi,%l7	! %l7 = 000000006e2751d5
!	Mem[0000000030041410] = b0590540 b001d67c, %l6 = 72d10c67, %l7 = 6e2751d5
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 00000000b001d67c 00000000b0590540
!	Mem[0000000030101400] = 00000000000000da, %f16 = 00000000 00000000
	ldda	[%i4+%g0]0x81,%f16	! %f16 = 00000000 000000da
!	Mem[0000000010001410] = ff0000eb, %l6 = 00000000b001d67c
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 00000000ff0000eb
!	Mem[0000000030181408] = ff2b38ac, %l5 = 00000000000000ff
	lduba	[%i6+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[000000001004143c] = 3620ab74, %l6 = 00000000ff0000eb
	ldsb	[%i1+0x03f],%l6		! %l6 = 0000000000000074
!	Mem[0000000010141400] = 7fff732deaebdfa9, %l4 = 00eb80287fff732d
	ldx	[%i5+%g0],%l4		! %l4 = 7fff732deaebdfa9
!	Mem[0000000021800140] = 72e68990, %l3 = 0000000000000000
	ldsba	[%o3+0x141]%asi,%l3	! %l3 = ffffffffffffffe6
!	Mem[0000000010081408] = 9863b2bd 90000000, %l0 = 00002bff, %l1 = 00000000
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 0000000090000000 000000009863b2bd
!	Starting 10 instruction Store Burst
!	%f12 = e32cc169 d8169845, Mem[0000000030141408] = 00000000 3a1f2633
	stda	%f12,[%i5+%o4]0x81	! Mem[0000000030141408] = e32cc169 d8169845

p0_label_52:
!	Mem[0000000010181409] = ff28d67c, %l6 = 0000000000000074
	ldstuba	[%i6+0x009]%asi,%l6	! %l6 = 00000028000000ff
!	%l2 = 00000000000092e5, Mem[0000000010041400] = 13abecee
	stba	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 13abece5
!	%l2 = 00000000000092e5, Mem[0000000030081408] = 671dffd6
	stwa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 000092e5
!	Mem[0000000010041410] = 0d5d0000, %l4 = 7fff732deaebdfa9
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 0000000d000000ff
!	%l2 = 000092e5, %l3 = ffffffe6, Mem[0000000010141410] = ffffffff bac31a28
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 000092e5 ffffffe6
!	%f4  = 01303666 ffe62880, Mem[00000000100c1400] = 00000001 000000ff
	stda	%f4 ,[%i3+0x000]%asi	! Mem[00000000100c1400] = 01303666 ffe62880
!	%f4  = 01303666 ffe62880, Mem[0000000010101428] = 6e321cde 459816d8
	stda	%f4 ,[%i4+0x028]%asi	! Mem[0000000010101428] = 01303666 ffe62880
!	%f12 = e32cc169 d8169845, Mem[0000000030141408] = e32cc169 d8169845
	stda	%f12,[%i5+%o4]0x81	! Mem[0000000030141408] = e32cc169 d8169845
!	%l0 = 0000000090000000, Mem[0000000030041410] = 7cd601b0
	stba	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00d601b0
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00eb8028, %l6 = 0000000000000028
	lduba	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_53:
!	Mem[0000000010041408] = 00005d0d, %l7 = 00000000b0590540
	ldswa	[%i1+%o4]0x80,%l7	! %l7 = 0000000000005d0d
!	Mem[0000000010141410] = 000092e5ffffffe6, %f24 = 67cbcd9f ea55ddfd
	ldda	[%i5+%o5]0x80,%f24	! %f24 = 000092e5 ffffffe6
!	Mem[00000000300c1400] = 00006101, %l2 = 00000000000092e5
	lduha	[%i3+%g0]0x89,%l2	! %l2 = 0000000000006101
!	Mem[0000000030041410] = 00d601b0, %l3 = ffffffffffffffe6
	lduba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = e5920000 00000000, %l2 = 00006101, %l3 = 00000000
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 00000000e5920000 0000000000000000
!	Mem[000000001008140c] = bdb26398, %l7 = 0000000000005d0d
	ldub	[%i2+0x00e],%l7		! %l7 = 0000000000000063
!	Mem[0000000010081408] = 90000000, %l6 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l6	! %l6 = ffffffff90000000
!	Mem[000000001008140c] = bdb26398, %l6 = ffffffff90000000
	ldsb	[%i2+0x00f],%l6		! %l6 = ffffffffffffff98
!	Mem[0000000030101408] = e59229bd 80c4e444, %l0 = 90000000, %l1 = 9863b2bd
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 00000000e59229bd 0000000080c4e444
!	Starting 10 instruction Store Burst
!	%l6 = ffffff98, %l7 = 00000063, Mem[0000000030001400] = ffd628ff eb000000
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffff98 00000063

p0_label_54:
!	%l4 = 000000000000000d, Mem[0000000010001408] = 004fe6ff
	stha	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 000de6ff
!	Mem[0000000010181430] = 459816d869c12ce3, %l6 = ffffffffffffff98, %l6 = ffffffffffffff98
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 459816d869c12ce3
!	%f8  = 0d5d6048 7fffffff, Mem[0000000030001410] = bd67d3ff 20000000
	stda	%f8 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 0d5d6048 7fffffff
!	%l7 = 0000000000000063, Mem[0000000030181410] = 00eb8028
	stba	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 63eb8028
!	Mem[0000000030181400] = 00004f00, %l0 = 00000000e59229bd
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 0000000000004f00
!	Mem[0000000010081424] = 56816101, %l0 = 0000000000004f00, %asi = 80
	swapa	[%i2+0x024]%asi,%l0	! %l0 = 0000000056816101
!	%l7 = 0000000000000063, Mem[0000000030041410] = b0590540b001d600
	stxa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000063
!	Mem[0000000021800140] = 72e68990, %l1 = 0000000080c4e444
	ldstub	[%o3+0x140],%l1		! %l1 = 00000072000000ff
!	%f26 = b4388881 c7730867, Mem[0000000010001408] = ffe60d00 74000000
	stda	%f26,[%i0+%o4]0x88	! Mem[0000000010001408] = b4388881 c7730867
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ad9806b5, %l5 = 00000000000000ff
	lduha	[%i2+%g0]0x80,%l5	! %l5 = 000000000000ad98

p0_label_55:
	membar	#Sync			! Added by membar checker (9)
!	Mem[00000000100c1400] = 01303666 ffe62880 ffe1b9f1 12d3c169
!	Mem[00000000100c1410] = ff001d67 ffff8028 14a418e4 684b1dba
!	Mem[00000000100c1420] = 00fa0ecc f4ffead5 00000000 4440ffe9
!	Mem[00000000100c1430] = ffe62880 000028ff 6e2751d5 999b85ff
	ldda	[%i3]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010081408] = 00000090, %l5 = 000000000000ad98
	ldswa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000090
!	Mem[0000000010081410] = ff0025fd, %l4 = 000000000000000d
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010181410] = 8028e6ff, %l2 = 00000000e5920000
	lduba	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000080
!	Mem[0000000010181410] = 8028e6ff, %l6 = 459816d869c12ce3
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000080
!	Mem[0000000010001400] = 00000001 964d48d7, %l0 = 56816101, %l1 = 00000072
	ldd	[%i0+%g0],%l0		! %l0 = 0000000000000001 00000000964d48d7
!	Mem[0000000010001408] = c7730867, %l1 = 00000000964d48d7
	ldsha	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000867
!	Mem[00000000100c1410] = 2880ffff671d00ff, %l3 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l3	! %l3 = 2880ffff671d00ff
!	Mem[0000000010081408] = 00000090, %l3 = 2880ffff671d00ff
	ldsha	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000080, %l7 = 00000063, Mem[0000000030141400] = ff001d67 06918b8d
	stda	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000080 00000063

p0_label_56:
!	%f8  = 0d5d6048 7fffffff, %l1 = 0000000000000867
!	Mem[0000000010181418] = df8e765513cfecee
	add	%i6,0x018,%g1
	stda	%f8,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010181418] = ffffff7f48605d0d
!	%l1 = 0000000000000867, Mem[0000000030181408] = ac382bff
	stwa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000867
!	%f12 = e32cc169 d8169845, %l2 = 0000000000000080
!	Mem[0000000030001408] = 00000000bd67d312
	add	%i0,0x008,%g1
	stda	%f12,[%g1+%l2]ASI_PST32_S ! Mem[0000000030001408] = 00000000bd67d312
!	%f11 = a28b8558, Mem[0000000010141400] = 7fff732d
	sta	%f11,[%i5+%g0]0x80	! Mem[0000000010141400] = a28b8558
!	%l1 = 0000000000000867, Mem[0000000010001408] = 670873c7818838b4
	stx	%l1,[%i0+%o4]		! Mem[0000000010001408] = 0000000000000867
!	Mem[0000000010001418] = 05b3d04fd74d26f5, %l2 = 0000000000000080, %l2 = 0000000000000080
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = 05b3d04fd74d26f5
!	Mem[0000000030181400] = e59229bd, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l3	! %l3 = 00000000000029bd
!	Mem[0000000021800040] = 04743c69, %l3 = 00000000000029bd
	ldstub	[%o3+0x040],%l3		! %l3 = 00000004000000ff
!	%l5 = 0000000000000090, Mem[00000000201c0000] = ffff00a6
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 009000a6
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = ffffff7f, %l5 = 0000000000000090
	lduwa	[%i6+0x018]%asi,%l5	! %l5 = 00000000ffffff7f

p0_label_57:
!	Mem[00000000211c0000] = ff592060, %l5 = 00000000ffffff7f
	ldsb	[%o2+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000300c1410] = 281ac3ff, %l6 = 0000000000000080
	ldsha	[%i3+%o5]0x89,%l6	! %l6 = ffffffffffffc3ff
!	Mem[000000001008140c] = bdb26398, %l1 = 0000000000000867
	ldswa	[%i2+0x00c]%asi,%l1	! %l1 = ffffffffbdb26398
!	Mem[0000000030081400] = 000000c5, %l1 = ffffffffbdb26398
	lduwa	[%i2+%g0]0x81,%l1	! %l1 = 00000000000000c5
!	Mem[0000000010081410] = fd2500ff, %l1 = 00000000000000c5
	ldsba	[%i2+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041400] = 0c7492b1, %l1 = ffffffffffffffff
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000b1
!	Mem[0000000010101408] = 72f6e73c, %l7 = 0000000000000063
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = 0000000072f6e73c
!	Mem[0000000010101410] = 246b1a28 1f561886, %l2 = d74d26f5, %l3 = 00000004
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 00000000246b1a28 000000001f561886
!	Mem[0000000010141400] = 58858ba2, %l1 = 00000000000000b1
	lduba	[%i5+%g0]0x88,%l1	! %l1 = 00000000000000a2
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = ffffff98, %l6 = ffffffffffffc3ff
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 000000ff000000ff

p0_label_58:
!	%l6 = 00000000000000ff, Mem[0000000030001408] = 00000000
	stba	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = ff000000
!	%l5 = ffffffffffffffff, Mem[00000000300c1400] = 00006101
	stba	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000061ff
!	Mem[00000000100c140b] = ffe1b9f1, %l4 = 000000000000ff00
	ldstuba	[%i3+0x00b]%asi,%l4	! %l4 = 000000f1000000ff
!	%f9  = 7fffffff, Mem[00000000300c1400] = 000061ff
	sta	%f9 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 7fffffff
	membar	#Sync			! Added by membar checker (10)
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = 01303666
	stha	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00ff3666
!	%l6 = 00000000000000ff, Mem[000000001018140c] = 00004f00
	stw	%l6,[%i6+0x00c]		! Mem[000000001018140c] = 000000ff
!	%l4 = 00000000000000f1, imm = 0000000000000b31, %l3 = 000000001f561886
	xnor	%l4,0xb31,%l3		! %l3 = fffffffffffff43f
!	%l4 = 00000000000000f1, Mem[0000000030081408] = 000092e5
	stba	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 000092f1
!	%l3 = fffffffffffff43f, Mem[0000000010181410] = 8028e6ff
	stba	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 3f28e6ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff0025fd, %l0 = 0000000000000001
	lduba	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff

p0_label_59:
!	Mem[0000000030141410] = 000092e5, %l7 = 0000000072f6e73c
	lduwa	[%i5+%o5]0x89,%l7	! %l7 = 00000000000092e5
!	Mem[0000000010141400] = a28b8558eaebdfa9, %l7 = 00000000000092e5
	ldx	[%i5+%g0],%l7		! %l7 = a28b8558eaebdfa9
!	Mem[0000000030181400] = 000000ffe59229bd, %f16 = 01303666 ffe62880
	ldda	[%i6+%g0]0x89,%f16	! %f16 = 000000ff e59229bd
!	Mem[00000000100c1400] = 00ff3666, %l4 = 00000000000000f1
	ldswa	[%i3+%g0]0x80,%l4	! %l4 = 0000000000ff3666
!	Mem[0000000030141408] = 459816d8 69c12ce3, %l4 = 00ff3666, %l5 = ffffffff
	ldda	[%i5+%o4]0x89,%l4	! %l4 = 0000000069c12ce3 00000000459816d8
!	Mem[0000000030101408] = bd2992e5, %l7 = a28b8558eaebdfa9
	ldsba	[%i4+%o4]0x89,%l7	! %l7 = ffffffffffffffe5
!	Mem[0000000030101400] = 00000000 000000da, %l0 = 000000ff, %l1 = 000000a2
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000 00000000000000da
!	Mem[00000000218000c0] = d7ff56e2, %l5 = 00000000459816d8
	ldsba	[%o3+0x0c1]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001410] = 7fffffff, %l3 = fffffffffffff43f
	lduwa	[%i0+%o5]0x89,%l3	! %l3 = 000000007fffffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000246b1a28, Mem[0000000030081410] = 12000000
	stwa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 246b1a28

p0_label_60:
!	Mem[0000000030081408] = f1920000, %l6 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 000000f1000000ff
!	%f0  = 000000eb ff28d6ff dfff7671 13abecee
!	%f4  = 01303666 ffe62880 eeeccf13 55768edf
!	%f8  = 0d5d6048 7fffffff 67cbcd9f a28b8558
!	%f12 = e32cc169 d8169845 0d5d6048 420e70dc
	stda	%f0,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400
!	%l5 = ffffffffffffffff, Mem[0000000030101408] = bd2992e5
	stha	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = bd29ffff
!	%f28 = ffe62880 000028ff, Mem[0000000030081410] = 281a6b24 29878819
	stda	%f28,[%i2+%o5]0x81	! Mem[0000000030081410] = ffe62880 000028ff
!	%l3 = 000000007fffffff, Mem[0000000030141408] = e32cc169
	stwa	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 7fffffff
	membar	#Sync			! Added by membar checker (11)
!	Mem[000000001004141f] = 55768edf, %l3 = 000000007fffffff
	ldstuba	[%i1+0x01f]%asi,%l3	! %l3 = 000000df000000ff
!	Mem[0000000030001408] = 000000ff, %l5 = ffffffffffffffff
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l6 = 00000000000000f1, Mem[0000000010181438] = dc700e4248605d0d
	stx	%l6,[%i6+0x038]		! Mem[0000000010181438] = 00000000000000f1
!	%l2 = 00000000246b1a28, Mem[0000000030081408] = 000092ff
	stwa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 246b1a28
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 6636ff00, %l4 = 0000000069c12ce3
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_61:
!	Mem[0000000010101410] = 246b1a28, %l5 = 00000000000000ff
	lduba	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000024
!	Mem[00000000300c1400] = ffffff7f 00000000 00000000 00000001
!	Mem[00000000300c1410] = ffc31a28 fd251af1 d44582ae 63d4034b
!	Mem[00000000300c1420] = a73a4e6c a6891397 c2b1bab3 2fbd55ab
!	Mem[00000000300c1430] = 3d07b5d4 dcc5f7ed 40f78674 e4c1710c
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010101408] = 72f6e73c4a7ee22f, %f10 = 67cbcd9f a28b8558
	ldda	[%i4+%o4]0x80,%f10	! %f10 = 72f6e73c 4a7ee22f
!	Mem[00000000100c1438] = 6e2751d5, %f11 = 4a7ee22f
	lda	[%i3+0x038]%asi,%f11	! %f11 = 6e2751d5
!	Mem[00000000100c1400] = 00ff3666, %l3 = 00000000000000df
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 00b300b104fd365c, %f2  = dfff7671 13abecee
	ldda	[%i1+%o4]0x81,%f2 	! %f2  = 00b300b1 04fd365c
!	%f5  = ffe62880, Mem[0000000010001430] = 73d7afe2
	st	%f5 ,[%i0+0x030]	! Mem[0000000010001430] = ffe62880
!	Mem[0000000030141408] = 7fffffff, %l7 = ffffffffffffffe5
	lduha	[%i5+%o4]0x81,%l7	! %l7 = 0000000000007fff
!	Mem[0000000010101400] = ff28d67c00000000, %f12 = e32cc169 d8169845
	ldda	[%i4+%g0]0x80,%f12	! %f12 = ff28d67c 00000000
!	Starting 10 instruction Store Burst
!	Mem[000000001000141e] = d74d26f5, %l5 = 0000000000000024
	ldstuba	[%i0+0x01e]%asi,%l5	! %l5 = 00000026000000ff

p0_label_62:
!	%l0 = 00000000, %l1 = 000000da, Mem[0000000010141400] = a28b8558 eaebdfa9
	stda	%l0,[%i5+0x000]%asi	! Mem[0000000010141400] = 00000000 000000da
!	Mem[00000000100c1400] = 00ff3666, %l2 = 00000000246b1a28
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000ff3666
!	%l3 = 0000000000000000, Mem[0000000030001410] = 7fffffff
	stba	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 7fffff00
!	Mem[0000000030081410] = 8028e6ff, %l4 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 000000008028e6ff
!	%l1 = 00000000000000da, Mem[0000000010001418] = 05b3d04f
	stw	%l1,[%i0+0x018]		! Mem[0000000010001418] = 000000da
!	%l4 = 000000008028e6ff, Mem[0000000030081400] = c5000000
	stba	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = c50000ff
!	%l3 = 0000000000000000, Mem[00000000100c1434] = 000028ff
	stw	%l3,[%i3+0x034]		! Mem[00000000100c1434] = 00000000
!	%f8  = 0d5d6048 7fffffff, Mem[0000000010041400] = 000000eb ff28d6ff
	stda	%f8 ,[%i1+0x000]%asi	! Mem[0000000010041400] = 0d5d6048 7fffffff
!	%f4  = 01303666 ffe62880, %l6 = 00000000000000f1
!	Mem[0000000030181430] = 742e0bad8ff3ab22
	add	%i6,0x030,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030181430] = 8028e6ff8ff3ab22
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000090, %f6  = eeeccf13
	lda	[%i2+%o4]0x80,%f6 	! %f6 = 00000090

p0_label_63:
!	Mem[0000000030141400] = 80000000, %l2 = 0000000000ff3666
	lduwa	[%i5+%g0]0x81,%l2	! %l2 = 0000000080000000
!	Mem[0000000020800040] = b6ff75f2, %l0 = 0000000000000000
	lduh	[%o1+0x040],%l0		! %l0 = 000000000000b6ff
!	Mem[0000000030041410] = 6300000000000000, %f14 = 0d5d6048 420e70dc
	ldda	[%i1+%o5]0x81,%f14	! %f14 = 63000000 00000000
!	Mem[0000000010001438] = dab377f7, %l2 = 0000000080000000
	ldsh	[%i0+0x038],%l2		! %l2 = ffffffffffffdab3
!	Mem[0000000010001408] = 00000000, %l1 = 00000000000000da
	ldsba	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = fd2500ff, %l6 = 00000000000000f1
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%l4 = 000000008028e6ff, %l3 = 0000000000000000, %y  = 00000000
	umul	%l4,%l3,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[0000000010081410] = ff0025fd, %f7  = 55768edf
	lda	[%i2+%o5]0x80,%f7 	! %f7 = ff0025fd
!	Mem[0000000010081408] = 00000090, %l4 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000090
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010041408] = 7176ffdf
	stwa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000

p0_label_64:
!	%l0 = 0000b6ff, %l1 = 00000000, Mem[0000000010101418] = 6880e6e0 56d7ddbc
	std	%l0,[%i4+0x018]		! Mem[0000000010101418] = 0000b6ff 00000000
!	%l2 = ffffffffffffdab3, Mem[00000000211c0000] = ff592060
	stb	%l2,[%o2+%g0]		! Mem[00000000211c0000] = b3592060
	membar	#Sync			! Added by membar checker (12)
!	%l0 = 000000000000b6ff, Mem[00000000300c1408] = 00000000
	stha	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = b6ff0000
!	Mem[0000000030041400] = b192740c, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 000000b1000000ff
!	Mem[00000000211c0000] = b3592060, %l6 = 00000000000000ff
	ldstub	[%o2+%g0],%l6		! %l6 = 000000b3000000ff
!	%l0 = 000000000000b6ff, Mem[0000000030001410] = 00ffff7f
	stha	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = b6ffff7f
!	%f14 = 63000000 00000000, Mem[0000000010101410] = 281a6b24 8618561f
	stda	%f14,[%i4+%o5]0x88	! Mem[0000000010101410] = 63000000 00000000
!	%l6 = 000000b3, %l7 = 00007fff, Mem[0000000030141400] = 80000000 63000000
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000b3 00007fff
!	%l5 = 0000000000000026, Mem[0000000010141408] = 88b556b8ebc71bff
	stxa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000026
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 01303666ffe62880, %l2 = ffffffffffffdab3
	ldxa	[%i1+%o5]0x80,%l2	! %l2 = 01303666ffe62880

p0_label_65:
!	Mem[0000000030101408] = bd29ffff, %l1 = 0000000000000000
	lduha	[%i4+%o4]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010001408] = 00000000, %l0 = 000000000000b6ff
	lduba	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = bd2992e500000867, %f4  = 01303666 ffe62880
	ldda	[%i6+%o4]0x89,%f4 	! %f4  = bd2992e5 00000867
!	Mem[0000000010101400] = ff28d67c, %l3 = 00000000000000b1
	lduha	[%i4+%g0]0x80,%l3	! %l3 = 000000000000ff28
!	Mem[0000000030041410] = 00000063, %l2 = 01303666ffe62880
	lduba	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000063
!	Mem[0000000010001430] = ffe62880, %l7 = 0000000000007fff
	ldsw	[%i0+0x030],%l7		! %l7 = ffffffffffe62880
!	Mem[0000000010001410] = b001d67c, %l7 = ffffffffffe62880
	ldsba	[%i0+%o5]0x80,%l7	! %l7 = ffffffffffffffb0
!	Mem[0000000030101400] = 00000000, %l3 = 000000000000ff28
	ldswa	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081414] = 00000000, %l3 = 0000000000000000
	lduwa	[%i2+0x014]%asi,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = b001d67c, %l4 = 0000000000000090
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 000000b0000000ff

p0_label_66:
!	%f6  = 00000090 ff0025fd, %l4 = 00000000000000b0
!	Mem[0000000030001428] = b4388881c7730867
	add	%i0,0x028,%g1
	stda	%f6,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030001428] = b438888190000800
!	%l4 = 000000b0, %l5 = 00000026, Mem[0000000010041410] = 66363001 8028e6ff
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000b0 00000026
!	%l0 = 00000000, %l1 = 0000ffff, Mem[0000000010141400] = 00000000 000000da
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 0000ffff
!	%f14 = 63000000, Mem[0000000010041400] = 0d5d6048
	sta	%f14,[%i1+%g0]0x80	! Mem[0000000010041400] = 63000000
!	%l7 = ffffffffffffffb0, Mem[0000000010081400] = b50698ad
	stha	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = b506ffb0
!	Mem[0000000010001410] = 7cd601ff, %l1 = 000000000000ffff
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 000000007cd601ff
!	%f13 = 00000000, %f0  = 000000eb, %f26 = c2b1bab3
	fdivs	%f13,%f0 ,%f26		! %f26 = 00000000
!	%f22 = d44582ae 63d4034b, Mem[0000000010101438] = 6dab3ab6 7fff732d
	std	%f22,[%i4+0x038]	! Mem[0000000010101438] = d44582ae 63d4034b
!	%l5 = 0000000000000026, Mem[00000000211c0000] = ff592060
	stb	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 26592060
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 72f6e73c, %l2 = 0000000000000063
	ldswa	[%i4+%o4]0x80,%l2	! %l2 = 0000000072f6e73c

p0_label_67:
!	Mem[0000000010001418] = 000000da d74dfff5, %l6 = 000000b3, %l7 = ffffffb0
	ldda	[%i0+0x018]%asi,%l6	! %l6 = 00000000000000da 00000000d74dfff5
!	Mem[0000000030181410] = 63eb80287fff732d, %l5 = 0000000000000026
	ldxa	[%i6+%o5]0x81,%l5	! %l5 = 63eb80287fff732d
!	Mem[0000000010141408] = 00000026, %l4 = 00000000000000b0
	lduba	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000026
!	Mem[0000000030041400] = e93b5c3c0c7492ff, %f30 = 40f78674 e4c1710c
	ldda	[%i1+%g0]0x89,%f30	! %f30 = e93b5c3c 0c7492ff
!	Mem[0000000030101400] = 00000000 000000da, %l0 = 00000000, %l1 = 7cd601ff
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000 00000000000000da
!	Mem[0000000010001400] = 01000000, %l4 = 0000000000000026
	lduba	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 7cd6ffff, %l0 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101410] = 7cd628ff, %f13 = 00000000
	lda	[%i4+%o5]0x89,%f13	! %f13 = 7cd628ff
!	Mem[0000000010041438] = 0d5d6048 420e70dc, %l2 = 72f6e73c, %l3 = 00000000
	ldd	[%i1+0x038],%l2		! %l2 = 000000000d5d6048 00000000420e70dc
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = ffffffff, %l2 = 000000000d5d6048
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 00000000ffffffff

p0_label_68:
!	%l3 = 00000000420e70dc, Mem[00000000211c0000] = 26592060, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 70dc2060
!	%f18 = 00000000 00000001, %l2 = 00000000ffffffff
!	Mem[0000000010181410] = 3f28e6ff66363001
	add	%i6,0x010,%g1
	stda	%f18,[%g1+%l2]ASI_PST8_P ! Mem[0000000010181410] = 0000000000000001
!	Mem[0000000020800001] = 4f5b4c7b, %l0 = ffffffffffffffff
	ldstub	[%o1+0x001],%l0		! %l0 = 0000005b000000ff
!	%l3 = 00000000420e70dc, Mem[00000000100c1410] = 2880ffff671d00ff
	stxa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000420e70dc
!	%l0 = 0000005b, %l1 = 000000da, Mem[0000000010141410] = e5920000 e6ffffff
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000005b 000000da
!	Mem[000000001000140d] = 00000867, %l6 = 00000000000000da
	ldstub	[%i0+0x00d],%l6		! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = 009000a6, %l1 = 00000000000000da
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	%l3 = 00000000420e70dc, Mem[0000000010081410] = ff0025fd
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 420e70dc
!	%l1 = 0000000000000000, Mem[0000000030001408] = 0d5d6048bd67d312
	stxa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff9000a6, %l6 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff

p0_label_69:
!	Mem[00000000300c1408] = b6ff0000, %l5 = 63eb80287fff732d
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = ffffffffb6ff0000
!	Mem[0000000010041400] = ffffff7f 00000063, %l4 = 00000000, %l5 = b6ff0000
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000063 00000000ffffff7f
!	Mem[00000000100c1400] = 281a6b24, %l6 = 00000000000000ff
	lduba	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000024
!	Mem[0000000010101400] = 000000007cd628ff, %f12 = ff28d67c 7cd628ff
	ldda	[%i4+%g0]0x88,%f12	! %f12 = 00000000 7cd628ff
!	Mem[00000000100c1438] = 6e2751d5, %l2 = 00000000ffffffff
	ldswa	[%i3+0x038]%asi,%l2	! %l2 = 000000006e2751d5
!	Mem[0000000030001410] = b6ffff7f 48605d0d, %l4 = 00000063, %l5 = ffffff7f
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 00000000b6ffff7f 0000000048605d0d
!	Mem[0000000010101400] = ff28d67c, %l3 = 00000000420e70dc
	lduwa	[%i4+%g0]0x80,%l3	! %l3 = 00000000ff28d67c
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000010041400] = 63000000 7fffffff 00000000 13abecee
!	Mem[0000000010041410] = b0000000 26000000 eeeccf13 55768eff
!	Mem[0000000010041420] = 0d5d6048 7fffffff 67cbcd9f a28b8558
!	Mem[0000000010041430] = e32cc169 d8169845 0d5d6048 420e70dc
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000030001408] = 00000000, %f15 = 00000000
	lda	[%i0+%o4]0x81,%f15	! %f15 = 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000024, %l7 = d74dfff5, Mem[0000000030101410] = 7cd628ff 4f5ba8a8
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000024 d74dfff5

p0_label_70:
!	Mem[0000000010141430] = f992df9b00002fe2, %l6 = 0000000000000024, %l1 = 0000000000000000
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = f992df9b00002fe2
!	%l2 = 000000006e2751d5, Mem[0000000010081410] = 420e70dc
	stha	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 51d570dc
!	%l5 = 0000000048605d0d, Mem[0000000030001410] = 7fffffb6
	stba	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 7fffff0d
!	%l6 = 00000024, %l7 = d74dfff5, Mem[0000000010081408] = 00000090 bdb26398
	std	%l6,[%i2+%o4]		! Mem[0000000010081408] = 00000024 d74dfff5
!	%f12 = 00000000 7cd628ff, %l4 = 00000000b6ffff7f
!	Mem[00000000100c1438] = 6e2751d5999b85ff
	add	%i3,0x038,%g1
	stda	%f12,[%g1+%l4]ASI_PST8_PL ! Mem[00000000100c1438] = ff28d67c000000ff
!	Mem[0000000010001428] = 000000602fe27e4a, %l6 = 0000000000000024, %l1 = f992df9b00002fe2
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 000000602fe27e4a
!	%f8  = 0d5d6048, Mem[0000000030001408] = 00000000
	sta	%f8 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 0d5d6048
!	%l0 = 000000000000005b, Mem[0000000021800180] = 2d0d0fa6
	stb	%l0,[%o3+0x180]		! Mem[0000000021800180] = 5b0d0fa6
!	Mem[0000000021800100] = 258d008a, %l2 = 000000006e2751d5
	ldstuba	[%o3+0x100]%asi,%l2	! %l2 = 00000025000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = bd2992e500000867, %l5 = 0000000048605d0d
	ldxa	[%i6+%o4]0x89,%l5	! %l5 = bd2992e500000867

p0_label_71:
!	Mem[00000000300c1410] = 281ac3ff, %f5  = 00000867
	lda	[%i3+%o5]0x89,%f5 	! %f5 = 281ac3ff
!	Mem[0000000010041400] = 63000000, %f3  = 04fd365c
	ld	[%i1+%g0],%f3 	! %f3 = 63000000
!	Mem[0000000030001408] = 48605d0d, %l4 = 00000000b6ffff7f
	ldsba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000048
!	Mem[0000000030181410] = 2880eb63, %l4 = 0000000000000048
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 000000000000eb63
!	Mem[0000000010101410] = 00000000, %l0 = 000000000000005b
	lduwa	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041404] = 7fffffff, %l3 = 00000000ff28d67c
	lduwa	[%i1+0x004]%asi,%l3	! %l3 = 000000007fffffff
!	Mem[0000000010181410] = 00000000, %l0 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = 00000024 d74dfff5, %l6 = 00000024, %l7 = d74dfff5
	ldd	[%i2+%o4],%l6		! %l6 = 0000000000000024 00000000d74dfff5
!	Mem[0000000030081408] = 281a6b24, %l0 = 0000000000000000
	lduba	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000028
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = bd29ffff, %l1 = 000000602fe27e4a
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 000000ff000000ff

p0_label_72:
	membar	#Sync			! Added by membar checker (14)
!	%f0  = 000000eb ff28d6ff, %l7 = 00000000d74dfff5
!	Mem[0000000010041430] = e32cc169d8169845
	add	%i1,0x030,%g1
	stda	%f0,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010041430] = ff2c2869eb000000
!	%l7 = 00000000d74dfff5, Mem[0000000010081400] = b0ff06b5
	stha	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = fff506b5
!	%f7  = ff0025fd, Mem[0000000010001410] = 0000ffff
	sta	%f7 ,[%i0+%o5]0x88	! Mem[0000000010001410] = ff0025fd
!	%f2  = 00b300b1 63000000, Mem[0000000010001400] = 01000000 d7484d96
	stda	%f2 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 00b300b1 63000000
!	%f10 = 72f6e73c 6e2751d5, Mem[00000000300c1400] = 7fffffff 00000000
	stda	%f10,[%i3+%g0]0x89	! Mem[00000000300c1400] = 72f6e73c 6e2751d5
!	%l2 = 0000000000000025, Mem[0000000030101400] = 00000000
	stba	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000025
!	Mem[0000000030001410] = 0d5d60487fffff0d, %f6  = 00000090 ff0025fd
	ldda	[%i0+%o5]0x89,%f6 	! %f6  = 0d5d6048 7fffff0d
!	Mem[000000001018140c] = 000000ff, %l1 = 00000000000000ff
	swap	[%i6+0x00c],%l1		! %l1 = 00000000000000ff
!	%f4  = bd2992e5 281ac3ff, %l7 = 00000000d74dfff5
!	Mem[0000000010141428] = 72ffc675000033f6
	add	%i5,0x028,%g1
	stda	%f4,[%g1+%l7]ASI_PST16_P ! Mem[0000000010141428] = 72ff92e50000c3ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 6e2751d5, %l1 = 00000000000000ff
	lduwa	[%i3+%g0]0x89,%l1	! %l1 = 000000006e2751d5

p0_label_73:
!	Mem[0000000030181408] = 00000867, %l2 = 0000000000000025
	lduba	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000067
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010081400] = fff506b5 e5176101 00000024 d74dfff5
!	Mem[0000000010081410] = 51d570dc 00000000 12d367bd 36fbcbd8
!	Mem[0000000010081420] = ad982880 00004f00 9962f259 da936a0e
!	Mem[0000000010081430] = 2030a508 8d36e38c 25b22013 ff4a1457
	ldda	[%i2]ASI_BLK_AIUP,%f16	! Block Load from 0000000010081400
!	Mem[0000000010141400] = 00000000, %f9  = 7fffffff
	lda	[%i5+%g0]0x80,%f9 	! %f9 = 00000000
!	Mem[0000000010141400] = 00000000 0000ffff 26000000 00000000
!	Mem[0000000010141410] = 5b000000 da000000 62f61f63 ce4965b8
!	Mem[0000000010141420] = 21780b8e c93e1b14 72ff92e5 0000c3ff
!	Mem[0000000010141430] = f992df9b 00002fe2 6c12c98b 79b02854
	ldda	[%i5]ASI_BLK_PL,%f0	! Block Load from 0000000010141400
!	Mem[0000000030181408] = 67080000, %l2 = 0000000000000067
	lduba	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000067
!	Mem[0000000010081414] = 00000000, %f21 = 00000000
	ld	[%i2+0x014],%f21	! %f21 = 00000000
!	Mem[0000000030081410] = 00000000 000028ff, %l0 = 00000028, %l1 = 6e2751d5
	ldda	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000 00000000000028ff
!	Mem[0000000030141408] = ffffff7f, %l4 = 000000000000eb63
	ldswa	[%i5+%o4]0x89,%l4	! %l4 = ffffffffffffff7f
!	Mem[000000001018141c] = 48605d0d, %l2 = 0000000000000067
	lduh	[%i6+0x01c],%l2		! %l2 = 0000000000004860
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = ffffff98, %l3 = 000000007fffffff
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 00000000ffffff98

p0_label_74:
!	Mem[00000000300c1410] = 281ac3ff, %l2 = 0000000000004860
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 00000000281ac3ff
!	Mem[0000000030101408] = bd29ffff, %l3 = 00000000ffffff98
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 00000000bd29ffff
!	%f18 = 00000024 d74dfff5, Mem[00000000100c1400] = 281a6b24 8028e6ff
	stda	%f18,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000024 d74dfff5
	membar	#Sync			! Added by membar checker (16)
!	%f28 = 2030a508, Mem[0000000010141408] = 26000000
	sta	%f28,[%i5+%o4]0x80	! Mem[0000000010141408] = 2030a508
!	%l7 = 00000000d74dfff5, Mem[0000000030041410] = 6300000000000000
	stxa	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000d74dfff5
!	Mem[000000001014140c] = 00000000, %l6 = 00000024, %l7 = d74dfff5
	add	%i5,0x0c,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = 4fff4c7b, %l2 = 00000000281ac3ff
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 0000004f000000ff
!	%l0 = 00000000, %l1 = 000028ff, Mem[0000000030001408] = 0d5d6048 00000000
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 000028ff
!	Mem[0000000010101430] = f11a25fd, %l6 = 0000000000000024, %asi = 80
	swapa	[%i4+0x030]%asi,%l6	! %l6 = 00000000f11a25fd
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 7fffffffd8169845, %f0  = ffff0000 00000000
	ldda	[%i5+%o4]0x81,%f0 	! %f0  = 7fffffff d8169845

p0_label_75:
!	Mem[00000000100c1400] = d74dfff5, %l6 = 00000000f11a25fd
	lduwa	[%i3+%g0]0x88,%l6	! %l6 = 00000000d74dfff5
!	Mem[0000000010101400] = 7cd628ff, %l2 = 000000000000004f
	ldsha	[%i4+%g0]0x88,%l2	! %l2 = 00000000000028ff
!	Mem[0000000030181400] = bd2992e5, %l3 = 00000000bd29ffff
	ldswa	[%i6+%g0]0x81,%l3	! %l3 = ffffffffbd2992e5
!	Mem[0000000010081408] = 00000024, %l3 = ffffffffbd2992e5
	ldsba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 0000005b, %l6 = 00000000d74dfff5
	lduha	[%i5+%o5]0x88,%l6	! %l6 = 000000000000005b
!	Mem[0000000030101400] = 25000000000000da, %f6  = b86549ce 631ff662
	ldda	[%i4+%g0]0x81,%f6 	! %f6  = 25000000 000000da
!	Mem[0000000010001400] = 00000063, %l4 = ffffffffffffff7f
	ldsba	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = 5c36fd04 b100b300, %l6 = 0000005b, %l7 = 00000000
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 00000000b100b300 000000005c36fd04
!	Mem[0000000030001410] = 7fffff0d, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = 000000000000000d
!	Starting 10 instruction Store Burst
!	%l5 = bd2992e500000867, Mem[00000000300c1408] = 0000ffb6
	stwa	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000867

p0_label_76:
!	Mem[0000000030181410] = 63eb8028, %l2 = 00000000000028ff
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 0000000063eb8028
!	%l2 = 0000000063eb8028, Mem[00000000300c1408] = 6708000000000001
	stxa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000063eb8028
!	%l0 = 0000000000000000, Mem[00000000201c0001] = ff9000a6, %asi = 80
	stba	%l0,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff0000a6
!	%f28 = 2030a508 8d36e38c, Mem[0000000010041410] = 000000b0 00000026
	stda	%f28,[%i1+%o5]0x88	! Mem[0000000010041410] = 2030a508 8d36e38c
!	Mem[0000000010001410] = fd2500ff, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 000000fd000000ff
!	%l6 = 00000000b100b300, Mem[0000000030181400] = bd2992e5ff000000
	stxa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000b100b300
!	%l4 = 000000fd, %l5 = 00000867, Mem[0000000010041400] = 63000000 7fffffff
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000fd 00000867
!	%f26 = 9962f259 da936a0e, %l4 = 00000000000000fd
!	Mem[0000000010181420] = ffffff7f48605d0d
	add	%i6,0x020,%g1
	stda	%f26,[%g1+%l4]ASI_PST32_P ! Mem[0000000010181420] = ffffff7fda936a0e
!	Mem[0000000010001408] = 00000000, %l5 = bd2992e500000867
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 51d570dc, %l6 = 00000000b100b300
	ldswa	[%i2+%o5]0x80,%l6	! %l6 = 0000000051d570dc

p0_label_77:
!	Mem[00000000100c1410] = dc700e4200000000, %l0 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l0	! %l0 = dc700e4200000000
!	Mem[00000000300c1410] = 00004860, %l4 = 00000000000000fd
	ldsha	[%i3+%o5]0x89,%l4	! %l4 = 0000000000004860
!	Mem[0000000030101410] = 24000000, %l6 = 0000000051d570dc
	lduba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000024
!	Mem[0000000010141410] = 0000005b, %l4 = 0000000000004860
	ldsba	[%i5+%o5]0x88,%l4	! %l4 = 000000000000005b
!	Mem[0000000030141410] = 000092e5, %f15 = 8bc9126c
	lda	[%i5+%o5]0x89,%f15	! %f15 = 000092e5
!	Mem[00000000100c1428] = 000000004440ffe9, %l5 = 0000000000000000
	ldx	[%i3+0x028],%l5		! %l5 = 000000004440ffe9
!	Mem[0000000010181408] = ffffd67c, %l5 = 000000004440ffe9
	ldsba	[%i6+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181400] = 00000000, %l5 = ffffffffffffffff
	ldsba	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = ff000000, %l0 = dc700e4200000000
	ldsb	[%i0+0x00a],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 420e70dc, %l6 = 0000000000000024
	ldstuba	[%i3+%o5]0x88,%l6	! %l6 = 000000dc000000ff

p0_label_78:
!	Mem[0000000010181425] = da936a0e, %l5 = 0000000000000000
	ldstub	[%i6+0x025],%l5		! %l5 = 00000093000000ff
!	Mem[0000000010101418] = 0000b6ff, %l4 = 0000005b, %l5 = 00000093
	add	%i4,0x18,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 000000000000b6ff
!	%l5 = 000000000000b6ff, Mem[0000000010101410] = 6300000000000000
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000000000b6ff
!	Mem[0000000010101430] = 00000024, %l7 = 5c36fd04, %l1 = 000028ff
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 0000000000000024
!	Mem[00000000300c1410] = 60480000, %l0 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 0000000060480000
!	%l3 = 000000000000000d, Mem[0000000030181400] = 00000000
	stha	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 000d0000
!	%f16 = fff506b5, Mem[0000000010081408] = 24000000
	sta	%f16,[%i2+%o4]0x88	! Mem[0000000010081408] = fff506b5
!	Mem[0000000021800080] = e1b303a0, %l5 = 000000000000b6ff
	ldsb	[%o3+0x081],%l5		! %l5 = ffffffffffffffb3
!	%l1 = 0000000000000024, Mem[0000000010001400] = 63000000
	stha	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 63000024
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffb60000, %f1  = d8169845
	lda	[%i4+%o5]0x80,%f1 	! %f1 = ffb60000

p0_label_79:
!	Mem[00000000211c0000] = 70dc2060, %l2 = 0000000063eb8028
	lduh	[%o2+%g0],%l2		! %l2 = 00000000000070dc
!	Mem[0000000030141410] = 00000000 000092e5, %l2 = 000070dc, %l3 = 0000000d
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 00000000000092e5 0000000000000000
!	Mem[0000000030081410] = 00000000, %l2 = 00000000000092e5
	ldsha	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = b506f5ffd74dfff5, %f6  = 25000000 000000da
	ldda	[%i2+%o4]0x80,%f6 	! %f6  = b506f5ff d74dfff5
!	Mem[0000000010141410] = 5b000000, %l1 = 0000000000000024
	lduha	[%i5+0x010]%asi,%l1	! %l1 = 0000000000005b00
!	Mem[0000000010181434] = 69c12ce3, %l3 = 0000000000000000
	ldswa	[%i6+0x034]%asi,%l3	! %l3 = 0000000069c12ce3
!	Mem[0000000010141420] = 21780b8e, %l5 = ffffffffffffffb3
	lduw	[%i5+0x020],%l5		! %l5 = 0000000021780b8e
!	Mem[0000000010041400] = 000000fd00000867, %l4 = 000000000000005b
	ldx	[%i1+%g0],%l4		! %l4 = 000000fd00000867
!	Mem[0000000010041400] = fd000000, %l0 = 0000000060480000
	ldsba	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = 70dc2060, %l1 = 0000000000005b00
	ldstub	[%o2+%g0],%l1		! %l1 = 00000070000000ff

p0_label_80:
!	Mem[0000000030141408] = 7fffffff, %l6 = 00000000000000dc
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 0000007f000000ff
!	%l2 = 0000000000000000, Mem[0000000010141408] = 0000000008a53020
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l4 = 000000fd00000867
	swapa	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%f0  = 7fffffff ffb60000, Mem[0000000030141400] = b3000000 ff7f0000
	stda	%f0 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 7fffffff ffb60000
!	%l1 = 0000000000000070, Mem[0000000030101408] = 98ffffff
	stba	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 70ffffff
!	%l6 = 000000000000007f, Mem[0000000010081408] = fff506b5
	stwa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000007f
!	Mem[0000000010041400] = 000000fd, %l6 = 000000000000007f
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000fd
!	%l7 = 000000005c36fd04, Mem[00000000300c1408] = 00000000
	stba	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000004
!	%f7  = d74dfff5, Mem[00000000100c1408] = ffe1b9ff
	sta	%f7 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = d74dfff5
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 7fffff0d, %l1 = 0000000000000070
	ldswa	[%i0+%o5]0x89,%l1	! %l1 = 000000007fffff0d

p0_label_81:
!	Mem[0000000010101410] = ffb60000, %l6 = 00000000000000fd
	lduha	[%i4+%o5]0x80,%l6	! %l6 = 000000000000ffb6
!	Mem[0000000030081408] = 281a6b24, %l7 = 000000005c36fd04
	ldsha	[%i2+%o4]0x81,%l7	! %l7 = 000000000000281a
!	Mem[00000000100c1400] = f5ff4dd7 24000000, %l4 = 00000000, %l5 = 21780b8e
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000f5ff4dd7 0000000024000000
!	Mem[0000000010001408] = 000000ff, %f14 = 5428b079
	lda	[%i0+%o4]0x88,%f14	! %f14 = 000000ff
!	Mem[0000000030001400] = ffffff7f, %l7 = 000000000000281a
	ldsha	[%i0+%g0]0x89,%l7	! %l7 = ffffffffffffff7f
!	Mem[0000000010001408] = ff000000, %l7 = ffffffffffffff7f
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141420] = 21780b8e, %f0  = 7fffffff
	ld	[%i5+0x020],%f0 	! %f0 = 21780b8e
!	Mem[0000000010001410] = ff0025ff, %l3 = 0000000069c12ce3
	lduba	[%i0+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = ff0000c5 45d7bc20 281a6b24 aca1f2e9
!	Mem[0000000030081410] = 00000000 000028ff 13ac7a67 01148667
!	Mem[0000000030081420] = bd06a19c 8a911fe9 ad6e94f0 b8517bbd
!	Mem[0000000030081430] = ade93ea6 9ce5dcb4 4c1d2862 c5e5bb50
	ldda	[%i2]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030081400
!	Starting 10 instruction Store Burst
!	%l6 = 0000ffb6, %l7 = ffffffff, Mem[0000000010101410] = ffb60000 00000000
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000ffb6 ffffffff

p0_label_82:
!	%l3 = 00000000000000ff, Mem[0000000030041400] = 0c7492ff
	stha	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 0c7400ff
!	Mem[0000000030181400] = 000d0000, %l2 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l2	! %l2 = 00000000000d0000
!	%f4  = 000000da 0000005b, Mem[0000000030181410] = ff280000 2d73ff7f
	stda	%f4 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000da 0000005b
!	%f11 = e592ff72, Mem[0000000010001408] = ff000000
	sta	%f11,[%i0+%o4]0x80	! Mem[0000000010001408] = e592ff72
	membar	#Sync			! Added by membar checker (17)
!	%f12 = e22f0000 9bdf92f9, Mem[0000000030081408] = 281a6b24 aca1f2e9
	stda	%f12,[%i2+%o4]0x81	! Mem[0000000030081408] = e22f0000 9bdf92f9
!	%l7 = ffffffffffffffff, Mem[0000000010141424] = c93e1b14
	sth	%l7,[%i5+0x024]		! Mem[0000000010141424] = ffff1b14
!	Mem[00000000300c1400] = 6e2751d5, %l6 = 000000000000ffb6
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 000000d5000000ff
!	Mem[0000000020800000] = ffff4c7b, %l5 = 0000000024000000
	ldstuba	[%o1+0x000]%asi,%l5	! %l5 = 000000ff000000ff
!	%f21 = 00000000, Mem[0000000030041400] = ff00740c
	sta	%f21,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 24000063, %l3 = 00000000000000ff
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 0000000000002400

p0_label_83:
!	Mem[00000000100c1400] = f5ff4dd7 24000000 d74dfff5 12d3c169
!	Mem[00000000100c1410] = ff700e42 00000000 14a418e4 684b1dba
!	Mem[00000000100c1420] = 00fa0ecc f4ffead5 00000000 4440ffe9
!	Mem[00000000100c1430] = ffe62880 00000000 ff28d67c 000000ff
	ldda	[%i3]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010081400] = 016117e5 b506f5ff, %l6 = 000000d5, %l7 = ffffffff
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 00000000b506f5ff 00000000016117e5
!	Mem[0000000030081408] = 00002fe2, %l1 = 000000007fffff0d
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = ffffffffffffffe2
!	Mem[0000000010101410] = ffffffffb6ff0000, %l4 = 00000000f5ff4dd7
	ldxa	[%i4+%o5]0x88,%l4	! %l4 = ffffffffb6ff0000
!	Mem[0000000030001410] = 0dffff7f, %f9  = 8e0b7821
	lda	[%i0+%o5]0x81,%f9 	! %f9 = 0dffff7f
!	Mem[000000001004141c] = 55768eff, %l5 = 00000000000000ff
	ldsba	[%i1+0x01c]%asi,%l5	! %l5 = 0000000000000055
!	Mem[0000000010181408] = ffffd67c, %f2  = 00000000
	lda	[%i6+%o4]0x80,%f2 	! %f2 = ffffd67c
!	%l1 = ffffffffffffffe2, %l3 = 0000000000002400, %l7 = 00000000016117e5
	or	%l1,%l3,%l7		! %l7 = ffffffffffffffe2
!	Mem[0000000010101410] = 0000ffb6, %l6 = 00000000b506f5ff
	lduha	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffe2, Mem[000000001018140c] = 000000ff
	stw	%l1,[%i6+0x00c]		! Mem[000000001018140c] = ffffffe2

p0_label_84:
!	%l6 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stwa	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%f1  = ffb60000, Mem[0000000010081410] = 51d570dc
	sta	%f1 ,[%i2+%o5]0x80	! Mem[0000000010081410] = ffb60000
!	%l7 = ffffffffffffffe2, Mem[0000000030141410] = 000092e5
	stha	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ffe2
!	%f3  = 00000026, Mem[0000000010001408] = e592ff72
	sta	%f3 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000026
!	%l2 = 000d0000, %l3 = 00002400, Mem[0000000030081410] = 00000000 ff280000
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 000d0000 00002400
!	Mem[0000000030081400] = ff0000c5, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff0000c5
!	Mem[00000000100c1424] = f4ffead5, %l6 = 0000000000000000, %asi = 80
	swapa	[%i3+0x024]%asi,%l6	! %l6 = 00000000f4ffead5
!	%f16 = 00000024 d74dfff5 69c1d312 f5ff4dd7
!	%f20 = 00000000 420e70ff ba1d4b68 e418a414
!	%f24 = d5eafff4 cc0efa00 e9ff4044 00000000
!	%f28 = 00000000 8028e6ff ff000000 7cd628ff
	stda	%f16,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	Mem[0000000010141414] = da000000, %l3 = 00002400, %l5 = 00000055
	add	%i5,0x14,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 00000000da000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = d74dfff512d3c169, %f6  = b506f5ff d74dfff5
	ldda	[%i3+0x008]%asi,%f6 	! %f6  = d74dfff5 12d3c169

p0_label_85:
!	Mem[0000000010081410] = 0000b6ff, %l2 = 00000000000d0000
	ldsha	[%i2+%o5]0x88,%l2	! %l2 = ffffffffffffb6ff
!	Mem[0000000010081424] = 00004f00, %l7 = ffffffffffffffe2
	ldsw	[%i2+0x024],%l7		! %l7 = 0000000000004f00
!	Mem[0000000010101410] = b6ff0000, %l3 = 0000000000002400
	lduba	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010001400] = 24000000, %l6 = 00000000f4ffead5
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = 0000000024000000
!	Mem[0000000020800000] = ffff4c7b, %l1 = ffffffffffffffe2
	ldub	[%o1+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030181408] = 67080000e59229bd, %f6  = d74dfff5 12d3c169
	ldda	[%i6+%o4]0x81,%f6 	! %f6  = 67080000 e59229bd
!	Mem[0000000020800040] = b6ff75f2, %l0 = 00000000ff0000c5
	lduh	[%o1+0x040],%l0		! %l0 = 000000000000b6ff
!	Mem[0000000010081408] = 0000007f, %l3 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 000000000000007f
!	Mem[0000000030041410] = 00000000, %l5 = 00000000da000000
	ldsba	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 21780b8e ffb60000 ffffd67c 00000026
!	%f4  = 000000da 0000005b 67080000 e59229bd
!	%f8  = 141b3ec9 0dffff7f ffc30000 e592ff72
!	%f12 = e22f0000 9bdf92f9 000000ff 000092e5
	stda	%f0,[%i6]ASI_BLK_P	! Block Store to 0000000010181400

p0_label_86:
!	Mem[00000000100c1400] = f5ff4dd7, %l2 = ffffffffffffb6ff
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 000000f5000000ff
!	%f18 = 69c1d312 f5ff4dd7, %l1 = 00000000000000ff
!	Mem[0000000030141400] = 0000b6ffffffff7f
	stda	%f18,[%i5+%l1]ASI_PST32_S ! Mem[0000000030141400] = 69c1d312f5ff4dd7
!	%f21 = 420e70ff, Mem[0000000010081400] = b506f5ff
	sta	%f21,[%i2+%g0]0x88	! Mem[0000000010081400] = 420e70ff
!	%f0  = 21780b8e ffb60000 ffffd67c 00000026
!	%f4  = 000000da 0000005b 67080000 e59229bd
!	%f8  = 141b3ec9 0dffff7f ffc30000 e592ff72
!	%f12 = e22f0000 9bdf92f9 000000ff 000092e5
	stda	%f0,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	%f24 = d5eafff4 cc0efa00, Mem[0000000010101400] = 7cd628ff 00000000
	stda	%f24,[%i4+%g0]0x88	! Mem[0000000010101400] = d5eafff4 cc0efa00
!	%f28 = 00000000 8028e6ff, Mem[0000000030181400] = 00000000 b100b300
	stda	%f28,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 8028e6ff
!	%l6 = 24000000, %l7 = 00004f00, Mem[0000000030181408] = 00000867 bd2992e5
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 24000000 00004f00
!	%l6 = 0000000024000000, Mem[0000000030081400] = 0000000045d7bc20
	stxa	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000024000000
!	%l0 = 000000000000b6ff, Mem[0000000010181408] = ffffd67c
	stwa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000b6ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010181408] = 0000b6ff00000026, %l3 = 000000000000007f
	ldxa	[%i6+%o4]0x80,%l3	! %l3 = 0000b6ff00000026

p0_label_87:
!	Mem[00000000300c1410] = 00000000, %l3 = 0000b6ff00000026
	lduha	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = ffdc2060, %l2 = 00000000000000f5
	ldsb	[%o2+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010081410] = 0000b6ff, %l1 = 00000000000000ff
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 000000000000b6ff
!	Mem[0000000030101410] = 00000024, %l6 = 0000000024000000
	lduwa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000024
!	Mem[0000000010081430] = 2030a5088d36e38c, %f24 = d5eafff4 cc0efa00
	ldd	[%i2+0x030],%f24	! %f24 = 2030a508 8d36e38c
!	Mem[0000000030141410] = e2ff0000, %l1 = 000000000000b6ff
	ldsha	[%i5+%o5]0x81,%l1	! %l1 = ffffffffffffe2ff
!	Mem[0000000010181400] = 21780b8e, %l2 = ffffffffffffffff
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 0000000021780b8e
!	Mem[0000000010101420] = 90ff5cf6 26fc9a75, %l0 = 0000b6ff, %l1 = ffffe2ff
	ldda	[%i4+0x020]%asi,%l0	! %l0 = 0000000090ff5cf6 0000000026fc9a75
!	Mem[0000000010001408] = d74dfff512d3c169, %l3 = 0000000000000000
	ldxa	[%i0+%o4]0x88,%l3	! %l3 = d74dfff512d3c169
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 8ce3368d, %l0 = 0000000090ff5cf6
	swapa	[%i1+%o5]0x80,%l0	! %l0 = 000000008ce3368d

p0_label_88:
!	%l0 = 8ce3368d, %l1 = 26fc9a75, Mem[0000000030041410] = da000000 5b000000
	stda	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 8ce3368d 26fc9a75
!	%f29 = 8028e6ff, Mem[0000000010081410] = 000000ff
	sta	%f29,[%i2+%o5]0x88	! Mem[0000000010081410] = 8028e6ff
!	%f2  = ffffd67c 00000026, %l2 = 0000000021780b8e
!	Mem[00000000100c1428] = 000000004440ffe9
	add	%i3,0x028,%g1
	stda	%f2,[%g1+%l2]ASI_PST16_P ! Mem[00000000100c1428] = ffffd67c0000ffe9
!	%l2 = 0000000021780b8e, Mem[0000000010101400] = 00fa0ecc
	stha	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 0b8e0ecc
!	%l5 = 0000000000000000, Mem[00000000100c1408] = d74dfff512d3c169
	stxa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	Mem[00000000100c1406] = 24000000, %l4 = ffffffffb6ff0000
	ldstub	[%i3+0x006],%l4		! %l4 = 00000000000000ff
!	%l7 = 0000000000004f00, Mem[0000000010181422] = 141b3ec9
	sth	%l7,[%i6+0x022]		! Mem[0000000010181420] = 141b4f00
!	Mem[00000000100c1410] = ff700e42, %l2 = 0000000021780b8e
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%f14 = 000000ff 000092e5, %l2 = 00000000000000ff
!	Mem[0000000030101438] = 68569e755ad0beec
	add	%i4,0x038,%g1
	stda	%f14,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030101438] = e5920000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000008028e6ff, %l2 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l2	! %l2 = 000000008028e6ff

p0_label_89:
!	Mem[0000000010041418] = eeeccf13 55768eff, %l2 = 8028e6ff, %l3 = 12d3c169
	ldd	[%i1+0x018],%l2		! %l2 = 00000000eeeccf13 0000000055768eff
!	%f30 = ff000000, Mem[0000000010181428] = ffc30000
	st	%f30,[%i6+0x028]	! Mem[0000000010181428] = ff000000
!	Mem[00000000201c0000] = ff0000a6, %l4 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010101400] = 0b8e0ecc f4ffead5 72f6e73c 4a7ee22f
!	Mem[0000000010101410] = 0000ffb6 ffffffff 0000b6ff 00000000
!	Mem[0000000010101420] = 90ff5cf6 26fc9a75 01303666 ffe62880
!	Mem[0000000010101430] = 00000024 420effdc d44582ae 63d4034b
	ldda	[%i4]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400
!	Mem[00000000100c1410] = ff700e42, %l0 = 000000008ce3368d
	ldsha	[%i3+0x010]%asi,%l0	! %l0 = ffffffffffffff70
!	Mem[0000000010141410] = 5b000000 da000000, %l6 = 00000024, %l7 = 00004f00
	ldd	[%i5+%o5],%l6		! %l6 = 000000005b000000 00000000da000000
!	Mem[0000000030101408] = 70ffffff, %f14 = 000000ff
	lda	[%i4+%o4]0x81,%f14	! %f14 = 70ffffff
!	Mem[0000000030141400] = 12d3c169, %l2 = 00000000eeeccf13
	lduha	[%i5+%g0]0x89,%l2	! %l2 = 000000000000c169
!	Mem[0000000030081400] = 00000000, %l7 = 00000000da000000
	ldswa	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030141410] = 0000ffe2
	stha	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000

p0_label_90:
!	Mem[0000000010081428] = 9962f259, %l1 = 26fc9a75, %l0 = ffffff70
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 000000009962f259
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010001400] = 00000024d74dfff5
	stxa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000
!	Mem[0000000010141426] = ffff1b14, %l6 = 000000005b000000
	ldstub	[%i5+0x026],%l6		! %l6 = 0000001b000000ff
!	Mem[0000000010141410] = 5b000000, %l2 = 000000000000c169
	swap	[%i5+%o5],%l2		! %l2 = 000000005b000000
!	%f4  = 000000da 0000005b, Mem[00000000100c1410] = ff700e42 00000000
	stda	%f4 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000da 0000005b
!	%l7 = 0000000000000000, Mem[0000000030141408] = ffffffff
	stba	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffff00
!	%l2 = 000000005b000000, Mem[0000000010041408] = ff00000013abecee, %asi = 80
	stxa	%l2,[%i1+0x008]%asi	! Mem[0000000010041408] = 000000005b000000
!	%l2 = 000000005b000000, Mem[0000000010001400] = 00000000
	stba	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 0000ffb6, %f9  = 0dffff7f
	lda	[%i4+%o5]0x80,%f9 	! %f9 = 0000ffb6

p0_label_91:
!	Mem[0000000030081410] = 00000d00, %f0  = 21780b8e
	lda	[%i2+%o5]0x81,%f0 	! %f0 = 00000d00
!	Mem[0000000010041428] = 67cbcd9f, %l5 = 0000000000000000
	lduba	[%i1+0x02a]%asi,%l5	! %l5 = 00000000000000cd
!	Mem[0000000030001400] = ffffff7f, %l7 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l7	! %l7 = 000000000000ff7f
!	Mem[0000000030001410] = 0dffff7f, %l7 = 000000000000ff7f
	ldswa	[%i0+%o5]0x81,%l7	! %l7 = 000000000dffff7f
!	Mem[0000000010081408] = 0000007f, %l1 = 0000000026fc9a75
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 000000000000007f
!	Mem[00000000211c0000] = ffdc2060, %l4 = ffffffffffffffff
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000ffdc
!	Mem[00000000100c1400] = ffff4dd7, %l2 = 000000005b000000
	lduha	[%i3+%g0]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[00000000100c1400] = d74dffff, %f6  = 67080000
	lda	[%i3+%g0]0x88,%f6 	! %f6 = d74dffff
!	Mem[0000000030081408] = f992df9b 00002fe2, %l6 = 0000001b, %l7 = 0dffff7f
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 0000000000002fe2 00000000f992df9b
!	Starting 10 instruction Store Burst
!	%f12 = e22f0000 9bdf92f9, %l6 = 0000000000002fe2
!	Mem[0000000010181428] = ff000000e592ff72
	add	%i6,0x028,%g1
	stda	%f12,[%g1+%l6]ASI_PST16_P ! Mem[0000000010181428] = ff0000009bdfff72

p0_label_92:
!	%l5 = 00000000000000cd, Mem[0000000010081408] = 7f000000
	stwa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000cd
!	%l6 = 0000000000002fe2, Mem[0000000030141408] = 00ffffff
	stha	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 2fe2ffff
!	Mem[0000000030041400] = 8e0b7821, %l6 = 0000000000002fe2
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 00000021000000ff
!	%l6 = 00000021, %l7 = f992df9b, Mem[00000000300c1400] = ff51276e 3ce7f672
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000021 f992df9b
!	Mem[00000000218001c0] = 36b2afb2, %l5 = 00000000000000cd
	ldstub	[%o3+0x1c0],%l5		! %l5 = 00000036000000ff
!	%f2  = ffffd67c, Mem[00000000100c1410] = 000000da
	sta	%f2 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffd67c
!	%l7 = 00000000f992df9b, Mem[0000000010041400] = 0000007f
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = df9b007f
!	%l4 = 000000000000ffdc, Mem[0000000030081408] = f992df9b00002fe2
	stxa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000000000ffdc
!	Mem[0000000021800100] = ff8d008a, %l5 = 0000000000000036
	ldstub	[%o3+0x100],%l5		! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 72f6e73c 4a7ee22f, %l2 = 0000ffff, %l3 = 55768eff
	ldda	[%i4+%o4]0x80,%l2	! %l2 = 0000000072f6e73c 000000004a7ee22f

p0_label_93:
!	Mem[0000000020800000] = ffff4c7b, %l2 = 0000000072f6e73c
	ldub	[%o1+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010081410] = ffe6288000000000, %l3 = 000000004a7ee22f
	ldxa	[%i2+0x010]%asi,%l3	! %l3 = ffe6288000000000
!	Mem[0000000030101408] = ffffff70, %l4 = 000000000000ffdc
	lduba	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000070
!	Mem[0000000010181410] = 000000da0000005b, %l3 = ffe6288000000000
	ldxa	[%i6+%o5]0x80,%l3	! %l3 = 000000da0000005b
!	Mem[0000000010101400] = 0b8e0ecc f4ffead5, %l2 = 000000ff, %l3 = 0000005b
	ldd	[%i4+%g0],%l2		! %l2 = 000000000b8e0ecc 00000000f4ffead5
!	Mem[0000000030041410] = 26fc9a758ce3368d, %l5 = 00000000000000ff
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = 26fc9a758ce3368d
!	Mem[0000000030181410] = 5b000000, %l3 = 00000000f4ffead5
	ldswa	[%i6+%o5]0x81,%l3	! %l3 = 000000005b000000
!	Mem[0000000010041410] = 90ff5cf608a53020, %f4  = 000000da 0000005b
	ldda	[%i1+%o5]0x80,%f4 	! %f4  = 90ff5cf6 08a53020
!	Mem[0000000010041410] = 2030a508 f65cff90, %l0 = 9962f259, %l1 = 0000007f
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 00000000f65cff90 000000002030a508
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 00000000, %l1 = 000000002030a508
	swapa	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000

p0_label_94:
!	%l5 = 26fc9a758ce3368d, Mem[0000000010001400] = 0000000000000000
	stxa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 26fc9a758ce3368d
!	Mem[000000001010140e] = 4a7ee22f, %l4 = 0000000000000070
	ldstub	[%i4+0x00e],%l4		! %l4 = 000000e2000000ff
!	Mem[0000000030001400] = ffffff7f, %l0 = 00000000f65cff90
	ldstuba	[%i0+%g0]0x89,%l0	! %l0 = 0000007f000000ff
!	%l4 = 000000e2, %l5 = 8ce3368d, Mem[0000000030181400] = 00000000 ffe62880
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000e2 8ce3368d
!	%l2 = 0b8e0ecc, %l3 = 5b000000, Mem[0000000030081400] = 00000000 24000000
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 0b8e0ecc 5b000000
!	%l3 = 000000005b000000, Mem[0000000010181410] = 000000da
	stba	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000da
!	%l6 = 0000000000000021, Mem[000000001014140a] = 00000000
	sth	%l6,[%i5+0x00a]		! Mem[0000000010141408] = 00000021
!	%l0 = 000000000000007f, Mem[00000000100c1410] = ffffd67c
	stba	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 7fffd67c
!	Mem[0000000010081408] = cd000000, %l2 = 000000000b8e0ecc
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff700e42 e5176101, %l4 = 000000e2, %l5 = 8ce3368d
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff700e42 00000000e5176101

p0_label_95:
!	Mem[0000000010141428] = 72ff92e5, %l6 = 0000000000000021
	ldub	[%i5+0x029],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181400] = 0000b6ff8e0b7821, %f18 = 72f6e73c 4a7ee22f
	ldda	[%i6+%g0]0x88,%f18	! %f18 = 0000b6ff 8e0b7821
!	Mem[0000000030141410] = 00000000, %l0 = 000000000000007f
	ldswa	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001428] = e9ff4044, %l1 = 0000000000000000
	lduh	[%i0+0x02a],%l1		! %l1 = 0000000000004044
!	Mem[0000000030141408] = 2fe2ffff, %l0 = 0000000000000000
	lduba	[%i5+%o4]0x81,%l0	! %l0 = 000000000000002f
!	Mem[00000000300c1410] = f11a25fd00000000, %l1 = 0000000000004044
	ldxa	[%i3+%o5]0x89,%l1	! %l1 = f11a25fd00000000
!	Mem[0000000010081410] = ffe62880, %l6 = 00000000000000ff
	ldswa	[%i2+%o5]0x80,%l6	! %l6 = ffffffffffe62880
!	Mem[0000000010181410] = da000000, %f8  = 141b3ec9
	lda	[%i6+%o5]0x88,%f8 	! %f8 = da000000
!	Mem[0000000030181408] = 24000000, %l4 = 00000000ff700e42
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = 0000000024000000
!	Starting 10 instruction Store Burst
!	%f19 = 8e0b7821, Mem[0000000030141410] = 00000000
	sta	%f19,[%i5+%o5]0x81	! Mem[0000000030141410] = 8e0b7821

p0_label_96:
!	Mem[0000000030101408] = ffffff70, %l3 = 000000005b000000
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 00000000ffffff70
!	Mem[0000000010001400] = 8d36e38c, %l7 = 00000000f992df9b
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 0000008d000000ff
!	%f13 = 9bdf92f9, Mem[0000000010141414] = da000000
	st	%f13,[%i5+0x014]	! Mem[0000000010141414] = 9bdf92f9
!	Mem[0000000010181424] = 0dffff7f, %l1 = 00000000, %l1 = 00000000
	add	%i6,0x24,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 000000000dffff7f
!	%f0  = 00000d00 ffb60000 ffffd67c 00000026
!	%f4  = 90ff5cf6 08a53020 d74dffff e59229bd
!	%f8  = da000000 0000ffb6 ffc30000 e592ff72
!	%f12 = e22f0000 9bdf92f9 70ffffff 000092e5
	stda	%f0,[%i2]ASI_BLK_S	! Block Store to 0000000030081400
!	%l2 = 00000000, %l3 = ffffff70, Mem[00000000100c1408] = 00000000 00000000
	stda	%l2,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000 ffffff70
!	Mem[0000000010181428] = ff0000009bdfff72, %l1 = 000000000dffff7f, %l4 = 0000000024000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = ff0000009bdfff72
!	%l0 = 000000000000002f, Mem[0000000030041408] = ffffd67c
	stba	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 2fffd67c
!	Mem[0000000010141430] = f992df9b, %l7 = 000000000000008d
	swap	[%i5+0x030],%l7		! %l7 = 00000000f992df9b
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000030081408] = ffffd67c, %f17 = f4ffead5
	lda	[%i2+%o4]0x81,%f17	! %f17 = ffffd67c

p0_label_97:
!	Mem[0000000010101400] = 0b8e0ecc f4ffead5, %l0 = 0000002f, %l1 = 0dffff7f
	ldda	[%i4+%g0]0x80,%l0	! %l0 = 000000000b8e0ecc 00000000f4ffead5
!	Mem[0000000030181410] = 0000005b, %l3 = 00000000ffffff70
	lduba	[%i6+%o5]0x89,%l3	! %l3 = 000000000000005b
!	Mem[00000000211c0000] = ffdc2060, %l3 = 000000000000005b
	lduba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000dc
!	Mem[0000000010041438] = 0d5d6048, %l6 = ffffffffffe62880
	lduha	[%i1+0x038]%asi,%l6	! %l6 = 0000000000000d5d
!	Mem[0000000010001410] = 00000000, %f8  = da000000
	lda	[%i0+%o5]0x88,%f8 	! %f8 = 00000000
!	Mem[0000000010001400] = ff36e38c, %l7 = 00000000f992df9b
	ldsb	[%i0+0x003],%l7		! %l7 = ffffffffffffff8c
!	Mem[00000000100c1400] = d74dffff, %l4 = ff0000009bdfff72
	lduba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = 8d36e38c 759afc26, %l2 = 00000000, %l3 = 000000dc
	ldda	[%i1+%o5]0x81,%l2	! %l2 = 000000008d36e38c 00000000759afc26
!	Mem[0000000010001418] = ba1d4b68, %l6 = 0000000000000d5d
	ldswa	[%i0+0x018]%asi,%l6	! %l6 = ffffffffba1d4b68
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 0b8e0ecc, %l2 = 8d36e38c, %l5 = e5176101
	casa	[%i4]0x80,%l2,%l5	! %l5 = 000000000b8e0ecc

p0_label_98:
!	%f0  = 00000d00 ffb60000 ffffd67c 00000026
!	%f4  = 90ff5cf6 08a53020 d74dffff e59229bd
!	%f8  = 00000000 0000ffb6 ffc30000 e592ff72
!	%f12 = e22f0000 9bdf92f9 70ffffff 000092e5
	stda	%f0,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	%l2 = 000000008d36e38c, Mem[0000000030181400] = 8ce3368d000000e2
	stxa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000008d36e38c
!	%l4 = 00000000000000ff, Mem[0000000010041410] = f65cff90
	stwa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	%l3 = 00000000759afc26, Mem[00000000100c1408] = 70ffffff00000000
	stxa	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000759afc26
!	%f0  = 00000d00 ffb60000 ffffd67c 00000026
!	%f4  = 90ff5cf6 08a53020 d74dffff e59229bd
!	%f8  = 00000000 0000ffb6 ffc30000 e592ff72
!	%f12 = e22f0000 9bdf92f9 70ffffff 000092e5
	stda	%f0,[%i6]ASI_COMMIT_P	! Block Store to 0000000010181400
!	%l7 = ffffffffffffff8c, Mem[0000000030101400] = 00000025
	stha	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ff8c
!	%l2 = 8d36e38c, %l3 = 759afc26, Mem[0000000010101400] = cc0e8e0b d5eafff4
	stda	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 8d36e38c 759afc26
!	%l0 = 000000000b8e0ecc, Mem[0000000010141400] = 00000000
	stha	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000ecc
!	%f16 = 0b8e0ecc ffffd67c, Mem[0000000030001400] = ffffffff 63000000
	stda	%f16,[%i0+%g0]0x89	! Mem[0000000030001400] = 0b8e0ecc ffffd67c
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = df9b007f, %l3 = 00000000759afc26
	ldsha	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffdf9b

p0_label_99:
!	Mem[0000000030141410] = 21780b8e, %f16 = 0b8e0ecc
	lda	[%i5+%o5]0x89,%f16	! %f16 = 21780b8e
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010101400] = 8ce3368d 26fc9a75 72f6e73c 4a7eff2f
!	Mem[0000000010101410] = 0000ffb6 ffffffff 0000b6ff 00000000
!	Mem[0000000010101420] = 90ff5cf6 26fc9a75 01303666 ffe62880
!	Mem[0000000010101430] = 00000024 420effdc d44582ae 63d4034b
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000010081400] = 000d0000, %l0 = 000000000b8e0ecc
	lduha	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 0000ff8c, %l7 = ffffffffffffff8c
	lduha	[%i4+%g0]0x89,%l7	! %l7 = 000000000000ff8c
!	Mem[0000000010181410] = 90ff5cf6, %l5 = 000000000b8e0ecc
	ldswa	[%i6+%o5]0x80,%l5	! %l5 = ffffffff90ff5cf6
!	Mem[0000000010181400] = 00000d00, %l6 = ffffffffba1d4b68
	ldsha	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 8ce3368d26fc9a75, %f4  = 90ff5cf6 08a53020
	ldda	[%i4+0x000]%asi,%f4 	! %f4  = 8ce3368d 26fc9a75
!	Mem[0000000030181410] = 5b000000da000000, %f10 = ffc30000 e592ff72
	ldda	[%i6+%o5]0x81,%f10	! %f10 = 5b000000 da000000
!	Mem[0000000010141408] = 0000000021000000, %l2 = 000000008d36e38c
	ldxa	[%i5+%o4]0x88,%l2	! %l2 = 0000000021000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ffffd67c, %l2 = 0000000021000000
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 00000000ffffd67c

p0_label_100:
	membar	#Sync			! Added by membar checker (23)
!	%f4  = 8ce3368d, Mem[0000000010101400] = 8ce3368d
	sta	%f4 ,[%i4+0x000]%asi	! Mem[0000000010101400] = 8ce3368d
!	%f2  = ffffd67c 00000026, Mem[00000000100c1400] = ffff4dd7 2400ff00
	stda	%f2 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffd67c 00000026
!	%l5 = ffffffff90ff5cf6, Mem[0000000030141410] = 8e0b7821
	stba	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = f60b7821
!	%l7 = 000000000000ff8c, Mem[00000000300c1410] = 00000000
	stwa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000ff8c
!	%f0  = 00000d00 ffb60000, Mem[0000000010181400] = 00000d00 ffb60000
	stda	%f0 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000d00 ffb60000
!	%l3 = ffffffffffffdf9b, Mem[0000000030141400] = 69c1d312
	stba	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 9bc1d312
!	Mem[0000000010001408] = 69c1d312, %l2 = 00000000ffffd67c
	swapa	[%i0+%o4]0x80,%l2	! %l2 = 0000000069c1d312
!	Mem[0000000030001400] = 7cd6ffff, %l2 = 0000000069c1d312
	swapa	[%i0+%g0]0x81,%l2	! %l2 = 000000007cd6ffff
!	%l7 = 000000000000ff8c, immed = 00000aa1, %y  = 00000000
	smul	%l7,0xaa1,%l3		! %l3 = 000000000a9c2f0c, %y = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = f65cff90, %l4 = 00000000000000ff
	lduwa	[%i2+%o5]0x89,%l4	! %l4 = 00000000f65cff90

p0_label_101:
!	Mem[0000000030141410] = f60b782100000000, %l7 = 000000000000ff8c
	ldxa	[%i5+%o5]0x81,%l7	! %l7 = f60b782100000000
!	Mem[0000000010081420] = 000000000000ffb6, %l7 = f60b782100000000
	ldx	[%i2+0x020],%l7		! %l7 = 000000000000ffb6
!	Mem[0000000030001400] = 12d3c169, %l0 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 0000000012d3c169
!	Mem[0000000010181400] = 000d0000, %l6 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 000d0000, %l2 = 000000007cd6ffff
	ldswa	[%i2+%g0]0x88,%l2	! %l2 = 00000000000d0000
!	Mem[0000000030081410] = f65cff90, %l5 = ffffffff90ff5cf6
	ldsba	[%i2+%o5]0x89,%l5	! %l5 = ffffffffffffff90
!	Mem[0000000010041408] = 08a53020, %l2 = 00000000000d0000
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 0000000000003020
!	Mem[0000000030081408] = ffffd67c, %l6 = 0000000000000000
	lduba	[%i2+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101410] = 00000024, %l6 = 00000000000000ff
	ldsba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000024
!	Starting 10 instruction Store Burst
!	%f9  = 0000ffb6, Mem[0000000030101410] = 00000024
	sta	%f9 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000ffb6

p0_label_102:
!	%l0 = 0000000012d3c169, Mem[0000000010181438] = 70ffffff000092e5
	stx	%l0,[%i6+0x038]		! Mem[0000000010181438] = 0000000012d3c169
!	Mem[00000000201c0001] = ff0000a6, %l1 = 00000000f4ffead5
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181400] = 00000d00, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000d00
!	Mem[0000000030101408] = 5b000000, %l2 = 0000000000003020
	ldstuba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001408] = ffffd67c, %l7 = 000000000000ffb6
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010101400] = 8ce3368d
	stwa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff
!	Mem[00000000100c1400] = 7cd6ffff, %l1 = 0000000000000d00
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 000000007cd6ffff
!	%l3 = 000000000a9c2f0c, Mem[00000000300c1410] = 0000ff8c
	stha	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 2f0cff8c
!	%f27 = ffe62880, Mem[0000000030181408] = 24000000
	sta	%f27,[%i6+%o4]0x89	! Mem[0000000030181408] = ffe62880
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = f65cff90, %f3  = 00000026
	lda	[%i6+%o5]0x88,%f3 	! %f3 = f65cff90

p0_label_103:
!	Mem[0000000030141410] = 21780bf6, %l7 = 00000000000000ff
	ldsba	[%i5+%o5]0x89,%l7	! %l7 = fffffffffffffff6
!	Mem[0000000020800000] = ffff4c7b, %l2 = 0000000000000000
	ldsha	[%o1+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041400] = ff780b8e ffb60000 2fffd67c 00000026
!	Mem[0000000030041410] = 8d36e38c 759afc26 67080000 e59229bd
!	Mem[0000000030041420] = 141b3ec9 0dffff7f ffc30000 e592ff72
!	Mem[0000000030041430] = e22f0000 9bdf92f9 000000ff 000092e5
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000030041400] = ff780b8e, %l5 = ffffffffffffff90
	lduwa	[%i1+%g0]0x81,%l5	! %l5 = 00000000ff780b8e
!	Mem[0000000010001408] = ffffd67cf5ff4dd7, %f2  = ffffd67c f65cff90
	ldda	[%i0+%o4]0x80,%f2 	! %f2  = ffffd67c f5ff4dd7
!	Mem[00000000100c1410] = 7cd6ff7f, %l4 = 00000000f65cff90
	lduba	[%i3+%o5]0x88,%l4	! %l4 = 000000000000007f
!	Mem[0000000010181410] = f65cff90, %l2 = ffffffffffffffff
	lduba	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000090
!	Mem[0000000030101408] = 5b0000ff, %l0 = 0000000012d3c169
	lduwa	[%i4+%o4]0x89,%l0	! %l0 = 000000005b0000ff
!	Mem[0000000030001410] = 7fffff0d, %l6 = 0000000000000024
	ldswa	[%i0+%o5]0x89,%l6	! %l6 = 000000007fffff0d
!	Starting 10 instruction Store Burst
!	%l4 = 0000007f, %l5 = ff780b8e, Mem[00000000300c1410] = 8cff0c2f f11a25fd
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000007f ff780b8e

p0_label_104:
!	%l3 = 000000000a9c2f0c, Mem[00000000100c1400] = 000d000000000026
	stxa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000000a9c2f0c
!	%l5 = 00000000ff780b8e, Mem[0000000030141410] = 0000000021780bf6
	stxa	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000ff780b8e
!	Mem[00000000100c1400] = 00000000, %l1 = 000000007cd6ffff
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c141f] = 684b1dba, %l3 = 000000000a9c2f0c
	ldstub	[%i3+0x01f],%l3		! %l3 = 000000ba000000ff
!	%l6 = 7fffff0d, %l7 = fffffff6, Mem[0000000010141400] = 00000ecc ffff0000
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 7fffff0d fffffff6
!	Mem[0000000010041420] = 0d5d60487fffffff, %l6 = 000000007fffff0d, %l0 = 000000005b0000ff
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = 0d5d60487fffffff
!	%f14 = 70ffffff 000092e5, %l6 = 000000007fffff0d
!	Mem[00000000100c1410] = 7fffd67c0000005b
	add	%i3,0x010,%g1
	stda	%f14,[%g1+%l6]ASI_PST8_P ! Mem[00000000100c1410] = 7fffd67c000000e5
!	%l1 = 0000000000000000, Mem[0000000010181404] = ffb60000, %asi = 80
	stwa	%l1,[%i6+0x004]%asi	! Mem[0000000010181404] = 00000000
!	%f9  = 0000ffb6, Mem[0000000010101408] = 72f6e73c
	sta	%f9 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000ffb6
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000ff 26fc9a75, %l4 = 0000007f, %l5 = ff780b8e
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 00000000000000ff 0000000026fc9a75

p0_label_105:
!	Mem[0000000030181408] = ffe62880, %l7 = fffffffffffffff6
	ldsha	[%i6+%o4]0x89,%l7	! %l7 = 0000000000002880
!	Mem[0000000010101400] = 000000ff 26fc9a75, %l6 = 7fffff0d, %l7 = 00002880
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000000000ff 0000000026fc9a75
!	Mem[0000000010101408] = 0000ffb6, %f2  = ffffd67c
	lda	[%i4+%o4]0x80,%f2 	! %f2 = 0000ffb6
!	Mem[0000000010181408] = 7cd6ffff, %l5 = 0000000026fc9a75
	ldsha	[%i6+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1410] = 7fffd67c000000e5, %l0 = 0d5d60487fffffff
	ldxa	[%i3+0x010]%asi,%l0	! %l0 = 7fffd67c000000e5
!	Mem[00000000100c1410] = 7fffd67c, %f6  = d74dffff
	lda	[%i3+%o5]0x80,%f6 	! %f6 = 7fffd67c
!	Mem[00000000100c1400] = ffffd67c, %l4 = 00000000000000ff
	lduwa	[%i3+%g0]0x80,%l4	! %l4 = 00000000ffffd67c
!	Mem[0000000020800000] = ffff4c7b, %l1 = 0000000000000000
	lduba	[%o1+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081408] = 00000021, %l6 = 00000000000000ff
	ldsba	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000021
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ffffd67c, %l5 = ffffffffffffffff
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 00000000ffffd67c

p0_label_106:
!	%f0  = 00000d00 ffb60000, %l0 = 7fffd67c000000e5
!	Mem[0000000010181438] = 0000000012d3c169
	add	%i6,0x038,%g1
	stda	%f0,[%g1+%l0]ASI_PST32_P ! Mem[0000000010181438] = 00000000ffb60000
!	%f0  = 00000d00 ffb60000, Mem[0000000010141408] = 21000000 00000000
	stda	%f0 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000d00 ffb60000
!	Mem[0000000030181410] = 5b000000, %l5 = 00000000ffffd67c
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 000000005b000000
!	%l1 = 00000000000000ff, Mem[0000000030081408] = 7cd6ffff
	stha	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 7cd600ff
!	Mem[0000000030101408] = ff00005b, %l3 = 00000000000000ba
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	%l4 = 00000000ffffd67c, Mem[0000000030101410] = b6ff0000f5ff4dd7
	stxa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000ffffd67c
!	%l7 = 0000000026fc9a75, Mem[00000000100c1430] = ffe62880
	stb	%l7,[%i3+0x030]		! Mem[00000000100c1430] = 75e62880
	membar	#Sync			! Added by membar checker (24)
!	%l0 = 7fffd67c000000e5, Mem[0000000030041408] = 7cd6ff2f
	stwa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000e5
!	%l1 = 00000000000000ff, Mem[0000000010041410] = ff000000
	stha	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff00d67c, %f8  = 00000000
	lda	[%i2+%o4]0x81,%f8 	! %f8 = ff00d67c

p0_label_107:
!	Mem[00000000300c1408] = 04000000, %f7  = e59229bd
	lda	[%i3+%o4]0x81,%f7 	! %f7 = 04000000
!	Mem[0000000030081410] = 90ff5cf6, %l6 = 0000000000000021
	ldswa	[%i2+%o5]0x81,%l6	! %l6 = ffffffff90ff5cf6
!	Mem[0000000030181410] = 7cd6ffff, %l0 = 7fffd67c000000e5
	ldsha	[%i6+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101408] = 0000ffb6, %l5 = 000000005b000000
	ldswa	[%i4+%o4]0x80,%l5	! %l5 = 000000000000ffb6
!	Mem[0000000010101410] = b6ff0000, %l0 = ffffffffffffffff
	ldsba	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 00000d00 ffb60000, %l6 = 90ff5cf6, %l7 = 26fc9a75
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 00000000ffb60000 0000000000000d00
!	Mem[0000000030001410] = 7fffff0d, %l3 = 00000000000000ff
	lduha	[%i0+%o5]0x89,%l3	! %l3 = 000000000000ff0d
!	Mem[0000000010181438] = 00000000ffb60000, %f8  = ff00d67c 0000ffb6
	ldd	[%i6+0x038],%f8 	! %f8  = 00000000 ffb60000
!	Mem[0000000010181434] = 9bdf92f9, %l1 = 00000000000000ff
	lduh	[%i6+0x034],%l1		! %l1 = 0000000000009bdf
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000d00, Mem[0000000030141400] = 12d3c19b
	stwa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000d00

p0_label_108:
!	%l6 = ffb60000, %l7 = 00000d00, Mem[0000000010001410] = 00000000 ff700e42
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = ffb60000 00000d00
!	%l6 = 00000000ffb60000, Mem[0000000030001408] = 00000867
	stwa	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = ffb60000
!	%f24 = 141b3ec9, Mem[0000000010001420] = d5eafff4
	st	%f24,[%i0+0x020]	! Mem[0000000010001420] = 141b3ec9
!	%f16 = ff780b8e, Mem[0000000010101414] = ffffffff
	st	%f16,[%i4+0x014]	! Mem[0000000010101414] = ff780b8e
!	%f30 = 000000ff 000092e5, %l4 = 00000000ffffd67c
!	Mem[0000000010041428] = 67cbcd9fa28b8558
	add	%i1,0x028,%g1
	stda	%f30,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010041428] = 67cbcd9fff000000
!	Mem[0000000030081400] = 000d0000, %l6 = 00000000ffb60000
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 00000000000d0000
!	%l2 = 0000000000000090, Mem[00000000201c0001] = ffff00a6, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff9000a6
!	%l3 = 000000000000ff0d, immd = 0000000000000272, %l6  = 00000000000d0000
	mulx	%l3,0x272,%l6		! %l6 = 00000000026fadca
!	%f18 = 2fffd67c 00000026, %l3 = 000000000000ff0d
!	Mem[0000000030001418] = 006b47d5d1853e61
	add	%i0,0x018,%g1
	stda	%f18,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030001418] = 266b0000d1853e61
!	Starting 10 instruction Load Burst
!	Mem[0000000010041424] = 7fffffff, %l7 = 0000000000000d00
	lduba	[%i1+0x027]%asi,%l7	! %l7 = 00000000000000ff

p0_label_109:
!	Mem[0000000030141400] = 000d0000, %l4 = 00000000ffffd67c
	ldsha	[%i5+%g0]0x81,%l4	! %l4 = 000000000000000d
!	Mem[00000000201c0000] = ff9000a6, %l1 = 0000000000009bdf
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081400] = 00000d00 ffb60000 21000000 00000026
!	Mem[0000000010081410] = 90ff5cf6 08a53020 d74dffff e59229bd
!	Mem[0000000010081420] = 00000000 0000ffb6 ffc30000 e592ff72
!	Mem[0000000010081430] = e22f0000 9bdf92f9 70ffffff 000092e5
	ldda	[%i2]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[0000000030141400] = 000d0000, %l2 = 0000000000000090
	lduba	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 90ff5cf6, %l0 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l0	! %l0 = ffffffffffffff90
!	Mem[00000000100c1410] = 7fffd67c, %l4 = 000000000000000d
	lduw	[%i3+%o5],%l4		! %l4 = 000000007fffd67c
!	Mem[0000000030041408] = e5000000, %l6 = 00000000026fadca
	lduba	[%i1+%o4]0x81,%l6	! %l6 = 00000000000000e5
!	Mem[0000000010041418] = eeeccf13 55768eff, %l6 = 000000e5, %l7 = 000000ff
	ldda	[%i1+0x018]%asi,%l6	! %l6 = 00000000eeeccf13 0000000055768eff
!	Mem[0000000030141400] = 000d0000, %l7 = 0000000055768eff
	lduba	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010101410] = 0000ffb6
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000

p0_label_110:
!	%l4 = 7fffd67c, %l5 = 0000ffb6, Mem[0000000030181400] = 8d36e38c 00000000
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 7fffd67c 0000ffb6
!	%l5 = 000000000000ffb6, Mem[00000000201c0000] = ff9000a6, %asi = 80
	stba	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = b69000a6
!	%l1 = 00000000000000ff, Mem[0000000020800040] = b6ff75f2
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 00ff75f2
!	%l2 = 0000000000000000, Mem[0000000030141410] = 00000000ff780b8e
	stxa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	%f12 = e22f0000 9bdf92f9, Mem[0000000010181408] = 7cd6ffff 26000000
	stda	%f12,[%i6+%o4]0x88	! Mem[0000000010181408] = e22f0000 9bdf92f9
!	Mem[0000000010181400] = 00000000, %l3 = 000000000000ff0d
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = 0000b6ff, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l3	! %l3 = 000000000000b6ff
!	%l2 = 00000000, %l3 = 0000b6ff, Mem[0000000010001410] = 0000b6ff 000d0000
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 0000b6ff
!	%l4 = 000000007fffd67c, Mem[0000000030181410] = ffffd67c
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 7cffd67c
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 0000c169, %l3 = 000000000000b6ff
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = 000000000000c169

p0_label_111:
!	Mem[0000000030101408] = ff00005b, %l5 = 000000000000ffb6
	lduha	[%i4+%o4]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030181400] = 7fffd67c, %l2 = 0000000000000000
	ldsba	[%i6+%g0]0x89,%l2	! %l2 = 000000000000007c
!	Mem[00000000300c1410] = 0000007f, %l0 = ffffffffffffff90
	ldswa	[%i3+%o5]0x89,%l0	! %l0 = 000000000000007f
!	Mem[0000000010001410] = 00000000, %l2 = 000000000000007c
	lduba	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 00000021, %l7 = 0000000000000000
	ldsha	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = ff00005b, %l4 = 000000007fffd67c
	lduwa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ff00005b
!	Mem[0000000010181408] = f992df9b, %l2 = 0000000000000000
	ldsh	[%i6+%o4],%l2		! %l2 = fffffffffffff992
!	Mem[000000001014143c] = 79b02854, %l3 = 000000000000c169
	ldswa	[%i5+0x03c]%asi,%l3	! %l3 = 0000000079b02854
!	Mem[0000000010001408] = ffffffff, %l7 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ffffffff, %l4 = 00000000ff00005b
	swapa	[%i0+%o4]0x80,%l4	! %l4 = 00000000ffffffff

p0_label_112:
!	Mem[0000000010141410] = 0000c169, %l0 = 000000000000007f
	ldstuba	[%i5+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l3 = 0000000079b02854, Mem[0000000010181410] = 90ff5cf608a53020, %asi = 80
	stxa	%l3,[%i6+0x010]%asi	! Mem[0000000010181410] = 0000000079b02854
!	Mem[0000000030001408] = 0000b6ff, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%l7 = ffffffffffffffff, Mem[0000000010041410] = 00ff0000
	stha	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = ffff0000
!	%l4 = 00000000ffffffff, Mem[0000000030001400] = 0b8e0ecc12d3c169
	stxa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000ffffffff
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010101410] = 00000000 ff780b8e
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 000000ff
!	Mem[0000000010141408] = ffb60000, %l0 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (25)
!	%l1 = 00000000000000ff, Mem[0000000010081408] = 21000000
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000
!	Mem[0000000010041408] = 08a53020, %l2 = fffffffffffff992
	swapa	[%i1+%o4]0x88,%l2	! %l2 = 0000000008a53020
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = f65cff90, %l6 = 00000000eeeccf13
	lduwa	[%i2+%o5]0x88,%l6	! %l6 = 00000000f65cff90

p0_label_113:
!	Mem[00000000100c1408] = 00000000759afc26, %l5 = 000000000000ff00
	ldxa	[%i3+%o4]0x88,%l5	! %l5 = 00000000759afc26
!	Mem[0000000030181410] = 7cffd67c da000000, %l4 = ffffffff, %l5 = 759afc26
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 000000007cffd67c 00000000da000000
!	Mem[00000000300c1408] = 00000004, %l3 = 0000000079b02854
	lduha	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000004
!	Mem[0000000010141410] = ff00c169, %l4 = 000000007cffd67c
	lduwa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ff00c169
!	Mem[0000000030101400] = 0000ff8c, %l6 = 00000000f65cff90
	ldsba	[%i4+%g0]0x89,%l6	! %l6 = ffffffffffffff8c
!	Mem[0000000030141410] = 00000000 00000000, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000030101400] = 0000ff8c, %l2 = 0000000008a53020
	ldsha	[%i4+%g0]0x89,%l2	! %l2 = ffffffffffffff8c
!	Mem[0000000010001400] = ff36e38c 759afc26, %l6 = ffffff8c, %l7 = ffffffff
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000ff36e38c 00000000759afc26
!	Mem[0000000010141410] = ff00c169, %l1 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = ffffffffff00c169
!	Starting 10 instruction Store Burst
!	Mem[0000000010141404] = f6ffffff, %l3 = 0000000000000004
	swap	[%i5+0x004],%l3		! %l3 = 00000000f6ffffff

p0_label_114:
!	%f6  = 7fffd67c 04000000, %f7  = 04000000
	fdtoi	%f6 ,%f7 		! %f7  = 7fffffff
!	%f29 = 00002fe2, Mem[00000000100c1400] = ffffd67c
	sta	%f29,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00002fe2
!	Mem[00000000211c0000] = ffdc2060, %l5 = 00000000da000000
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000100c1404] = 0a9c2f0c, %l7 = 00000000759afc26
	ldstuba	[%i3+0x004]%asi,%l7	! %l7 = 0000000a000000ff
!	%f6  = 7fffd67c 7fffffff, Mem[0000000010081438] = 70ffffff 000092e5
	std	%f6 ,[%i2+0x038]	! Mem[0000000010081438] = 7fffd67c 7fffffff
!	%f2  = 0000ffb6, %f21 = f65cff90, %f8  = 00000000
	fsubs	%f2 ,%f21,%f8 		! %l0 = 0000000000000022, Unfinished, %fsr = 0000000000
!	%l3 = 00000000f6ffffff, Mem[0000000010041404] = 00000867, %asi = 80
	stwa	%l3,[%i1+0x004]%asi	! Mem[0000000010041404] = f6ffffff
!	%f16 = 0000b6ff, Mem[0000000010001408] = ff00005b
	sta	%f16,[%i0+0x008]%asi	! Mem[0000000010001408] = 0000b6ff
!	Mem[0000000030101408] = ff00005b, %l4 = 00000000ff00c169
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ff00005b
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = ff000000 7cd628ff, %l2 = ffffff8c, %l3 = f6ffffff
	ldd	[%i0+0x038],%l2		! %l2 = 00000000ff000000 000000007cd628ff

p0_label_115:
!	Mem[0000000030101400] = 8cff0000, %l2 = 00000000ff000000
	lduha	[%i4+%g0]0x81,%l2	! %l2 = 0000000000008cff
!	Mem[0000000010181400] = 0dff0000, %l7 = 000000000000000a
	ldsb	[%i6+%g0],%l7		! %l7 = 000000000000000d
!	Mem[00000000300c1400] = 21000000, %l7 = 000000000000000d
	lduba	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 7f000000, %l4 = 00000000ff00005b
	ldswa	[%i3+%o5]0x81,%l4	! %l4 = 000000007f000000
!	Mem[0000000030181410] = 7cffd67c, %l7 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l7	! %l7 = 000000007cffd67c
!	Mem[0000000010081408] = 000000ff, %l5 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = 7fffff0d, %l2 = 0000000000008cff
	lduha	[%i5+%g0]0x88,%l2	! %l2 = 000000000000ff0d
!	Mem[00000000100c1408] = 26fc9a75, %l4 = 000000007f000000
	ldsha	[%i3+%o4]0x80,%l4	! %l4 = 00000000000026fc
!	Mem[0000000010081400] = 00000d00 ffb60000, %l4 = 000026fc, %l5 = 000000ff
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000d00 00000000ffb60000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000000, %l4 = 0000000000000d00
	swapa	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000

p0_label_116:
!	Mem[0000000010081408] = 000000ff, %l0 = 0000000000000022
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030041408] = e5000000, %l1 = ffffffffff00c169
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 00000000e5000000
!	%l2 = 000000000000ff0d, Mem[00000000201c0000] = b69000a6, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = ff0d00a6
!	%l0 = 000000ff, %l1 = e5000000, Mem[00000000100c1410] = 7fffd67c 000000e5
	stda	%l0,[%i3+0x010]%asi	! Mem[00000000100c1410] = 000000ff e5000000
!	%l2 = 000000000000ff0d, Mem[0000000030081408] = 7cd600ff
	stba	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 7cd6000d
!	Mem[0000000010041408] = 92f9ffff5b000000, %l0 = 00000000000000ff, %l3 = 000000007cd628ff
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = 92f9ffff5b000000
!	%f14 = 70ffffff 000092e5, Mem[00000000100c1408] = 759afc26 00000000
	stda	%f14,[%i3+%o4]0x88	! Mem[00000000100c1408] = 70ffffff 000092e5
!	Mem[0000000030141408] = ffffe22f, %l6 = 00000000ff36e38c
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 0000002f000000ff
!	%l1 = 00000000e5000000, Mem[0000000010081408] = 000000ff
	stha	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 92f9ffff5b000000, %l6 = 000000000000002f
	ldxa	[%i1+%o4]0x80,%l6	! %l6 = 92f9ffff5b000000

p0_label_117:
!	Mem[0000000030041410] = 8ce3368d, %l7 = 000000007cffd67c
	ldsba	[%i1+%o5]0x89,%l7	! %l7 = ffffffffffffff8d
!	Mem[0000000030101400] = 8cff0000, %l3 = 92f9ffff5b000000
	ldsha	[%i4+%g0]0x81,%l3	! %l3 = ffffffffffff8cff
!	Mem[00000000300c1410] = 7f000000, %l5 = 00000000ffb60000
	lduha	[%i3+%o5]0x81,%l5	! %l5 = 0000000000007f00
!	Mem[0000000010101410] = 00000000000000ff, %l2 = 000000000000ff0d
	ldx	[%i4+%o5],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010181410] = 000d0000 79b02854, %l6 = 5b000000, %l7 = ffffff8d
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 00000000000d0000 0000000079b02854
!	Mem[0000000010181400] = 000000000000ff0d, %f16 = 0000b6ff 000d0000
	ldda	[%i6+%g0]0x88,%f16	! %f16 = 00000000 0000ff0d
!	Mem[0000000010081408] = 00000000, %l7 = 0000000079b02854
	ldsba	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l4 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101424] = 26fc9a75, %f26 = 72ff92e5
	ld	[%i4+0x024],%f26	! %f26 = 26fc9a75
!	Starting 10 instruction Store Burst
!	%l1 = 00000000e5000000, Mem[0000000010141400] = 0dffff7f
	stha	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000ff7f

p0_label_118:
!	Mem[0000000010041408] = fffff992, %l6 = 00000000000d0000
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000092000000ff
!	Mem[0000000030101408] = 69c100ff, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 0000000069c100ff
!	Mem[00000000100c1410] = 000000ff, %l5 = 0000000000007f00
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030141410] = 00000000
	stwa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%l5 = 0000000000000000, Mem[00000000100c1404] = ff9c2f0c
	sth	%l5,[%i3+0x004]		! Mem[00000000100c1404] = 00002f0c
!	Mem[00000000100c1400] = e22f0000, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000e22f0000
!	Mem[0000000030041400] = 8e0b78ff, %l2 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%l4 = 69c100ff, %l5 = 00000000, Mem[0000000030181410] = 7cd6ff7c 000000da
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 69c100ff 00000000
!	%f7  = 7fffffff, Mem[0000000030101408] = 00000000
	sta	%f7 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 7fffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l1 = 00000000e5000000
	lduha	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000

p0_label_119:
!	Mem[0000000030041410] = 8d36e38c, %l2 = 00000000000000ff
	ldswa	[%i1+%o5]0x81,%l2	! %l2 = ffffffff8d36e38c
!	Mem[0000000010041410] = ffff0000, %l6 = 0000000000000092
	ldswa	[%i1+%o5]0x80,%l6	! %l6 = ffffffffffff0000
!	Mem[0000000030141410] = 00000000, %l3 = ffffffffffff8cff
	ldswa	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 000000ff26fc9a75, %l0 = 00000000000000ff
	ldxa	[%i4+%g0]0x80,%l0	! %l0 = 000000ff26fc9a75
!	Mem[0000000010081408] = 00000000, %l1 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = ffffe2ff, %f25 = 00000000
	lda	[%i5+%o4]0x89,%f25	! %f25 = ffffe2ff
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000030081400] = 00000000 ffb60000 0d00d67c 00000026
!	Mem[0000000030081410] = 90ff5cf6 08a53020 d74dffff e59229bd
!	Mem[0000000030081420] = da000000 0000ffb6 ffc30000 e592ff72
!	Mem[0000000030081430] = e22f0000 9bdf92f9 70ffffff 000092e5
	ldda	[%i2]ASI_BLK_SL,%f0	! Block Load from 0000000030081400
!	Mem[00000000218000c0] = d7ff56e2, %l6 = ffffffffffff0000
	lduh	[%o3+0x0c0],%l6		! %l6 = 000000000000d7ff
!	Mem[0000000030181410] = 69c100ff, %l6 = 000000000000d7ff
	lduha	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010041422] = 0d5d6048, %asi = 80
	stha	%l6,[%i1+0x022]%asi	! Mem[0000000010041420] = 0d5d00ff

p0_label_120:
!	%l2 = ffffffff8d36e38c, Mem[0000000030141410] = 00000000
	stha	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = e38c0000
!	Mem[0000000010181408] = f992df9b, %l3 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l3	! %l3 = 00000000f992df9b
!	Mem[0000000010101427] = 26fc9a75, %l3 = 00000000f992df9b
	ldstuba	[%i4+0x027]%asi,%l3	! %l3 = 00000075000000ff
!	Mem[00000000100c1408] = e5920000, %f26 = 26fc9a75
	lda	[%i3+%o4]0x80,%f26	! %f26 = e5920000
!	Mem[0000000010001408] = 0000b6ff, %l1 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001400] = ff36e38c, %l2 = ffffffff8d36e38c
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010001400] = ff36e38c 759afc26 ff00b6ff f5ff4dd7
!	Mem[0000000010001410] = 00000000 0000b6ff ba1d4b68 e418a414
!	Mem[0000000010001420] = 141b3ec9 cc0efa00 e9ff4044 00000000
!	Mem[0000000010001430] = 00000000 8028e6ff ff000000 7cd628ff
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000010141408] = ff00b6ff, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000010101410] = 00000000
	stw	%l1,[%i4+%o5]		! Mem[0000000010101410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %f9  = 000000da
	lda	[%i0+%o5]0x88,%f9 	! %f9 = 00000000

p0_label_121:
!	Mem[0000000030101408] = 7fffffff, %l1 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l1	! %l1 = 0000000000007fff
!	Mem[0000000010081400] = 0000b6ff 000d0000, %l6 = 000000ff, %l7 = e22f0000
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 00000000000d0000 000000000000b6ff
!	Mem[0000000010181408] = 00000000, %l1 = 0000000000007fff
	ldswa	[%i6+0x008]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l3 = 0000000000000075
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800040] = 00ff75f2, %l5 = 00000000000000ff
	ldub	[%o1+0x040],%l5		! %l5 = 0000000000000000
!	Mem[0000000030001410] = 0d5d60487fffff0d, %f6  = bd2992e5 ffff4dd7
	ldda	[%i0+%o5]0x89,%f6 	! %f6  = 0d5d6048 7fffff0d
!	Mem[0000000010141400] = 7fff0000, %l3 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081408] = 26000000 7cd6000d, %l4 = 69c100ff, %l5 = 00000000
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 000000007cd6000d 0000000026000000
!	Mem[00000000300c1408] = 00000004, %l2 = 00000000000000ff
	ldsha	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000004
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000004, Mem[0000000010041410] = 0000ffff
	stwa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000004

p0_label_122:
!	Mem[0000000030001400] = ffffffff, %l2 = 0000000000000004
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%f15 = ffffff70, %f10 = 72ff92e5, %f2  = 26000000
	fadds	%f15,%f10,%f2 		! %f2  = ffffff70
!	%f14 = e5920000 ffffff70, Mem[0000000030001408] = ffb600ff 000028ff
	stda	%f14,[%i0+%o4]0x89	! Mem[0000000030001408] = e5920000 ffffff70
!	%l7 = 000000000000b6ff, Mem[000000001014143a] = 6c12c98b
	sth	%l7,[%i5+0x03a]		! Mem[0000000010141438] = 6c12b6ff
!	%l1 = 0000000000000000, Mem[0000000030181408] = 8028e6ff
	stha	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000e6ff
!	Mem[00000000201c0001] = ff0d00a6, %l6 = 00000000000d0000
	ldstub	[%o0+0x001],%l6		! %l6 = 0000000d000000ff
!	Mem[0000000010001400] = 8ce336ff, %l1 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 000000008ce336ff
!	Mem[00000000211c0001] = ffdc2060, %l7 = 000000000000b6ff
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 000000dc000000ff
!	%f4  = 2030a508, Mem[0000000030041400] = ff780b8e
	sta	%f4 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 2030a508
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 90ff5cf6, %l2 = 00000000000000ff
	ldsba	[%i2+%o5]0x81,%l2	! %l2 = ffffffffffffff90

p0_label_123:
!	Mem[0000000030181400] = 7cd6ff7f, %l0 = 000000ff26fc9a75
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = 000000000000007c
!	Mem[0000000010101408] = 2fff7e4ab6ff0000, %f6  = 0d5d6048 7fffff0d
	ldda	[%i4+%o4]0x88,%f6 	! %f6  = 2fff7e4a b6ff0000
!	Mem[0000000030041408] = 69c100ff, %f0  = 0000b6ff
	lda	[%i1+%o4]0x89,%f0 	! %f0 = 69c100ff
!	Mem[0000000010041430] = ff2c2869eb000000, %l0 = 000000000000007c
	ldxa	[%i1+0x030]%asi,%l0	! %l0 = ff2c2869eb000000
!	Mem[0000000021800040] = ff743c69, %l7 = 00000000000000dc
	lduha	[%o3+0x040]%asi,%l7	! %l7 = 000000000000ff74
!	Mem[0000000030101408] = 7fffffff, %l1 = 000000008ce336ff
	ldsha	[%i4+%o4]0x81,%l1	! %l1 = 0000000000007fff
!	Mem[0000000030141400] = d74dfff5 00000d00, %l2 = ffffff90, %l3 = 00000000
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000d00 00000000d74dfff5
!	Mem[0000000010101428] = 01303666, %l2 = 0000000000000d00
	ldsw	[%i4+0x028],%l2		! %l2 = 0000000001303666
!	Mem[0000000010141410] = 69c100ff, %l5 = 0000000026000000
	ldsba	[%i5+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (28)
!	%l0 = eb000000, %l1 = 00007fff, Mem[0000000010001400] = 00000000 759afc26
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = eb000000 00007fff

p0_label_124:
!	%l2 = 01303666, %l3 = d74dfff5, Mem[0000000030001400] = ffffffff 00000000
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 01303666 d74dfff5
!	%l7 = 000000000000ff74, Mem[00000000201c0000] = ffff00a6, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = ff7400a6
!	Mem[0000000010041410] = 04000000, %l7 = 000000000000ff74, %asi = 80
	swapa	[%i1+0x010]%asi,%l7	! %l7 = 0000000004000000
!	%l0 = ff2c2869eb000000, Mem[00000000211c0000] = ffff2060, %asi = 80
	stba	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff2060
!	%l5 = ffffffffffffffff, Mem[0000000010181408] = e22f000000000000
	stxa	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffffffffffff
!	Mem[0000000030001408] = ffffff70, %l1 = 0000000000007fff
	swapa	[%i0+%o4]0x89,%l1	! %l1 = 00000000ffffff70
!	%l7 = 0000000004000000, Mem[0000000010181410] = 000d0000
	stba	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 000d0000
!	%l5 = ffffffffffffffff, Mem[00000000201c0000] = ff7400a6
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = ffff00a6
!	Mem[0000000030081410] = f65cff90, %l0 = ff2c2869eb000000
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 00000090000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = 75e62880 00000000, %l2 = 01303666, %l3 = d74dfff5
	ldd	[%i3+0x030],%l2		! %l2 = 0000000075e62880 0000000000000000

p0_label_125:
!	Mem[0000000010001410] = 00000000, %l7 = 0000000004000000
	lduba	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 7f000000, %l4 = 000000007cd6000d
	lduba	[%i3+%o5]0x81,%l4	! %l4 = 000000000000007f
!	Mem[0000000030181410] = 69c100ff, %f4  = 2030a508
	lda	[%i6+%o5]0x89,%f4 	! %f4 = 69c100ff
!	Mem[0000000010181428] = ffc30000 e592ff72, %l4 = 0000007f, %l5 = ffffffff
	ldd	[%i6+0x028],%l4		! %l4 = 00000000ffc30000 00000000e592ff72
!	Mem[00000000300c1410] = 7f0000008e0b78ff, %l7 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = 7f0000008e0b78ff
!	Mem[0000000010081408] = 26000000 00000000, %l6 = 0000000d, %l7 = 8e0b78ff
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000 0000000026000000
!	Mem[0000000030081410] = ffff5cf6, %l6 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181410] = 000d0000, %l2 = 0000000075e62880
	ldsba	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = 0d5d6048 7fffff0d, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 000000007fffff0d 000000000d5d6048
!	Starting 10 instruction Store Burst
!	%f16 = ff36e38c 759afc26, Mem[00000000300c1400] = 00000021 f992df9b
	stda	%f16,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff36e38c 759afc26

p0_label_126:
!	%f16 = ff36e38c 759afc26, Mem[0000000030141408] = ffffe2ff 459816d8
	stda	%f16,[%i5+%o4]0x89	! Mem[0000000030141408] = ff36e38c 759afc26
!	Mem[0000000021800181] = 5b0d0fa6, %l5 = 00000000e592ff72
	ldstuba	[%o3+0x181]%asi,%l5	! %l5 = 0000000d000000ff
!	%l2 = 7fffff0d, %l3 = 0d5d6048, Mem[0000000010141410] = ff00c169 9bdf92f9
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 7fffff0d 0d5d6048
!	%l5 = 000000000000000d, Mem[0000000030101400] = 8cff0000
	stwa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000d
!	%f14 = e5920000, Mem[00000000100c143c] = 000000ff
	st	%f14,[%i3+0x03c]	! Mem[00000000100c143c] = e5920000
!	%l7 = 0000000026000000, Mem[00000000100c1410] = ff0000ff
	stwa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 26000000
!	Mem[0000000010141420] = 21780b8effffff14, %l3 = 000000000d5d6048, %l2 = 000000007fffff0d
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = 21780b8effffff14
!	Mem[0000000010081410] = 90ff5cf608a53020, %l1 = 00000000ffffff70, %l1 = 00000000ffffff70
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = 90ff5cf608a53020
!	Mem[0000000030181408] = 0000e6ff, %l7 = 0000000026000000
	swapa	[%i6+%o4]0x81,%l7	! %l7 = 000000000000e6ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001414] = 0000b6ff, %l4 = 00000000ffc30000
	ldswa	[%i0+0x014]%asi,%l4	! %l4 = 000000000000b6ff

p0_label_127:
!	Mem[0000000020800000] = ffff4c7b, %l5 = 000000000000000d
	ldsh	[%o1+%g0],%l5		! %l5 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010141400] = 0000ff7f 00000004 ff00b6ff 000d0000
!	Mem[0000000010141410] = 7fffff0d 0d5d6048 62f61f63 ce4965b8
!	Mem[0000000010141420] = 21780b8e ffffff14 72ff92e5 0000c3ff
!	Mem[0000000010141430] = 0000008d 00002fe2 6c12b6ff 79b02854
	ldda	[%i5]ASI_BLK_P,%f0	! Block Load from 0000000010141400
!	Mem[00000000211c0000] = 00ff2060, %l7 = 000000000000e6ff
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181410] = 00000d00, %l1 = 90ff5cf608a53020
	lduha	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000d00
!	Mem[00000000300c1400] = 8ce336ff, %l7 = 00000000000000ff
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 000000008ce336ff
!	Mem[0000000010181400] = 0dff0000, %l3 = 000000000d5d6048
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000dff
!	Mem[0000000010041410] = 2030a50874ff0000, %l2 = 21780b8effffff14
	ldxa	[%i1+%o5]0x88,%l2	! %l2 = 2030a50874ff0000
!	Mem[0000000010141438] = 6c12b6ff 79b02854, %l6 = ffffffff, %l7 = 8ce336ff
	ldd	[%i5+0x038],%l6		! %l6 = 000000006c12b6ff 0000000079b02854
!	Mem[0000000030141410] = e38c0000, %l2 = 2030a50874ff0000
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = ffffffffffffe38c
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000dff, Mem[0000000030081410] = 2030a508f65cffff
	stxa	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000dff

p0_label_128:
	membar	#Sync			! Added by membar checker (30)
!	%l0 = 0000000000000090, Mem[0000000010141434] = 00002fe2
	sth	%l0,[%i5+0x034]		! Mem[0000000010141434] = 00902fe2
!	%f30 = ff000000, Mem[0000000010081410] = f65cff90
	sta	%f30,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000
!	%l1 = 0000000000000d00, Mem[0000000030141400] = 000d0000
	stwa	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000d00
!	%f8  = 21780b8e ffffff14, Mem[0000000010081410] = 000000ff 08a53020
	stda	%f8 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 21780b8e ffffff14
!	%l6 = 000000006c12b6ff, Mem[0000000010141408] = ffb600ff
	stba	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = ffb600ff
!	%l2 = ffffe38c, %l3 = 00000dff, Mem[00000000300c1408] = 04000000 63eb8028
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffe38c 00000dff
!	%l6 = 000000006c12b6ff, Mem[0000000010041430] = ff2c2869
	stb	%l6,[%i1+0x030]		! Mem[0000000010041430] = ff2c2869
!	%f4  = 7fffff0d 0d5d6048, %f31 = 7cd628ff
	fxtos	%f4 ,%f31		! %f31 = 5efffffe
!	%l5 = ffffffffffffffff, Mem[0000000010041400] = df9b007f
	stwa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = 3ac0c83b, %l0 = 0000000000000090
	ldsb	[%o3+%g0],%l0		! %l0 = 000000000000003a

p0_label_129:
!	Mem[0000000010081428] = ffc30000 e592ff72, %l6 = 6c12b6ff, %l7 = 79b02854
	ldd	[%i2+0x028],%l6		! %l6 = 00000000ffc30000 00000000e592ff72
!	Mem[0000000030081400] = 0000b6ff00000000, %f4  = 7fffff0d 0d5d6048
	ldda	[%i2+%g0]0x89,%f4 	! %f4  = 0000b6ff 00000000
!	Mem[0000000030081410] = ff0d0000, %l1 = 0000000000000d00
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181410] = ff00c16900000000, %l4 = 000000000000b6ff
	ldxa	[%i6+%o5]0x81,%l4	! %l4 = ff00c16900000000
!	Mem[0000000010181400] = 0dff0000 00000000, %l2 = ffffe38c, %l3 = 00000dff
	ldda	[%i6+0x000]%asi,%l2	! %l2 = 000000000dff0000 0000000000000000
!	Mem[0000000030101400] = 0d000000, %l6 = 00000000ffc30000
	lduha	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = 0dffff7f, %l4 = ff00c16900000000
	ldswa	[%i0+%o5]0x81,%l4	! %l4 = 000000000dffff7f
!	Mem[00000000300c1408] = ffffe38c00000dff, %f16 = ff36e38c 759afc26
	ldda	[%i3+%o4]0x81,%f16	! %f16 = ffffe38c 00000dff
!	Mem[00000000300c1400] = 26fc9a758ce336ff, %f20 = 00000000 0000b6ff
	ldda	[%i3+%g0]0x89,%f20	! %f20 = 26fc9a75 8ce336ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000e592ff72, %l5 = ffffffffffffffff, %l6 = 0000000000000000
	xnor	%l7,%l5,%l6		! %l6 = 00000000e592ff72

p0_label_130:
!	Mem[0000000030081410] = ff0d0000, %l2 = 000000000dff0000
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	%l6 = 00000000e592ff72, Mem[0000000010001410] = 00000000
	stwa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = e592ff72
!	Mem[0000000030101410] = 00000000, %l0 = 000000000000003a
	swapa	[%i4+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0001] = ffff00a6, %l3 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	%f9  = ffffff14, Mem[0000000010141408] = ff00b6ff
	st	%f9 ,[%i5+%o4]		! Mem[0000000010141408] = ffffff14
!	%l2 = 00000000000000ff, Mem[0000000010101400] = ff000000
	stha	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = ff0000ff
!	Mem[00000000300c1400] = ff36e38c, %l7 = 00000000e592ff72
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 00000000ff36e38c
!	Mem[0000000030041408] = ff00c169, %l4 = 000000000dffff7f
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010081437] = 9bdf92f9, %l2 = 00000000000000ff
	ldstuba	[%i2+0x037]%asi,%l2	! %l2 = 000000f9000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 000000eb, %l6 = 00000000e592ff72
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000eb

p0_label_131:
!	Mem[0000000010101410] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = ffff00a6, %l0 = 0000000000000000
	lduh	[%o0+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030041410] = 8ce3368d, %l6 = 00000000000000eb
	ldswa	[%i1+%o5]0x89,%l6	! %l6 = ffffffff8ce3368d
!	Mem[0000000030081400] = 00000000, %f2  = ff00b6ff
	lda	[%i2+%g0]0x81,%f2 	! %f2 = 00000000
!	Mem[0000000010001434] = 8028e6ff, %l3 = 00000000000000ff
	ldswa	[%i0+0x034]%asi,%l3	! %l3 = ffffffff8028e6ff
!	Mem[0000000010101408] = 0000ffb6, %l2 = 00000000000000f9
	ldsba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 0000ff7f, %l0 = 000000000000ffff
	lduha	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = 00ff2060, %l3 = ffffffff8028e6ff
	lduba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101414] = 000000ff, %l1 = 0000000000000000
	ldsb	[%i4+0x014],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 7fffd67c, %l7 = 00000000ff36e38c
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 0000007c000000ff

p0_label_132:
!	Mem[0000000030141400] = 00000d00, %l4 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000d00
!	%l7 = 000000000000007c, Mem[0000000030001400] = 01303666
	stwa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000007c
!	%l2 = 0000000000000000, Mem[0000000030041410] = 8ce3368d
	stha	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 8ce30000
!	Mem[0000000010081410] = 21780b8e, %l7 = 000000000000007c
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 0000000021780b8e
!	%f8  = 21780b8e ffffff14, Mem[0000000010181400] = 0dff0000 00000000
	stda	%f8 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 21780b8e ffffff14
!	%f31 = 5efffffe, Mem[0000000030141408] = 26fc9a75
	sta	%f31,[%i5+%o4]0x81	! Mem[0000000030141408] = 5efffffe
!	%l2 = 0000000000000000, Mem[00000000100c1400] = 0000000000002f0c
	stxa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000000
!	Mem[0000000030101410] = 3a000000, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101400] = 0000000d, %l5 = ffffffffffffffff
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 000000000000000d
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffffff, %l1 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l1	! %l1 = ffffffffffffffff

p0_label_133:
!	Mem[00000000300c1400] = e592ff72, %l6 = ffffffff8ce3368d
	lduba	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000e5
!	Mem[00000000201c0000] = ffff00a6, %l3 = 00000000000000ff
	ldsh	[%o0+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[00000000100c1434] = 00000000, %l6 = 00000000000000e5
	ldsba	[%i3+0x036]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 70ffffff 000092e5, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 00000000000092e5 0000000070ffffff
!	Mem[0000000030001408] = 00007fff, %l1 = 0000000070ffffff
	ldsha	[%i0+%o4]0x89,%l1	! %l1 = 0000000000007fff
!	Mem[0000000010041400] = ffffffff f6ffffff, %l6 = 00000000, %l7 = 21780b8e
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ffffffff 00000000f6ffffff
!	Mem[0000000010141410] = 48605d0d0dffff7f, %l2 = 0000000000000000
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = 48605d0d0dffff7f
!	Mem[00000000211c0000] = 00ff2060, %l1 = 0000000000007fff
	ldsh	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010181434] = 9bdf92f9, %f3  = 000d0000
	ld	[%i6+0x034],%f3 	! %f3 = 9bdf92f9
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010001438] = ff0000007cd628ff
	stx	%l3,[%i0+0x038]		! Mem[0000000010001438] = ffffffffffffffff

p0_label_134:
!	%l2 = 0dffff7f, %l3 = ffffffff, Mem[0000000030081400] = 00000000 0000b6ff
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 0dffff7f ffffffff
!	Mem[000000001010143c] = 63d4034b, %l3 = ffffffffffffffff, %asi = 80
	swapa	[%i4+0x03c]%asi,%l3	! %l3 = 0000000063d4034b
!	%l2 = 48605d0d0dffff7f, Mem[0000000030141400] = 000000ff
	stwa	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 0dffff7f
!	Mem[0000000010081400] = 000d0000, %l6 = 00000000ffffffff
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141408] = ffffff14, %l2 = 48605d0d0dffff7f
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 00000000ffffff14
!	%f26 = e9ff4044 00000000, Mem[0000000030181410] = 69c100ff 00000000
	stda	%f26,[%i6+%o5]0x89	! Mem[0000000030181410] = e9ff4044 00000000
!	%l5 = 000000000000000d, Mem[0000000030101408] = 7fffffff
	stha	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 000dffff
!	Mem[00000000300c1408] = ffffe38c, %l4 = 0000000000000d00
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 00000000ffffe38c
!	%l6 = 0000000000000000, Mem[0000000030101400] = ffffffff
	stba	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00ffffff
!	Starting 10 instruction Load Burst
!	Mem[000000001014140c] = 000d0000, %f24 = 141b3ec9
	lda	[%i5+0x00c]%asi,%f24	! %f24 = 000d0000

p0_label_135:
!	Mem[0000000030141408] = ff36e38cfeffff5e, %l6 = 0000000000000000
	ldxa	[%i5+%o4]0x89,%l6	! %l6 = ff36e38cfeffff5e
!	Mem[00000000300c1400] = 26fc9a75 72ff92e5, %l4 = ffffe38c, %l5 = 0000000d
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 0000000072ff92e5 0000000026fc9a75
!	%f11 = 0000c3ff, %f5  = 00000000
	fstoi	%f11,%f5 		! %l0 = 0000000000009307, Unfinished, %fsr = 0000000000
!	Mem[0000000030001408] = 00007fff, %l4 = 0000000072ff92e5
	lduha	[%i0+%o4]0x89,%l4	! %l4 = 0000000000007fff
!	Mem[0000000010181408] = ffffffff, %l7 = 00000000f6ffffff
	lduba	[%i6+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081400] = ff000d00ffb60000, %l3 = 0000000063d4034b
	ldxa	[%i2+%g0]0x80,%l3	! %l3 = ff000d00ffb60000
!	Mem[0000000010141400] = 0000ff7f, %l6 = ff36e38cfeffff5e
	ldsba	[%i5+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181434] = 9bdf92f9, %l7 = 00000000000000ff
	ldsh	[%i6+0x036],%l7		! %l7 = ffffffffffff92f9
!	Mem[00000000300c1400] = 72ff92e5, %l5 = 0000000026fc9a75
	ldsha	[%i3+%g0]0x89,%l5	! %l5 = ffffffffffff92e5
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000009307, Mem[0000000030101400] = ffffff00
	stwa	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 00009307

p0_label_136:
!	%f2  = 00000000 9bdf92f9, %l5 = ffffffffffff92e5
!	Mem[0000000010041430] = ff2c2869eb000000
	add	%i1,0x030,%g1
	stda	%f2,[%g1+%l5]ASI_PST16_P ! Mem[0000000010041430] = ff2c0000eb0092f9
!	%f0  = 0000ff7f 00000004 00000000 9bdf92f9
!	%f4  = 0000b6ff 00000000 62f61f63 ce4965b8
!	%f8  = 21780b8e ffffff14 72ff92e5 0000c3ff
!	%f12 = 0000008d 00002fe2 6c12b6ff 79b02854
	stda	%f0,[%i2]ASI_BLK_S	! Block Store to 0000000030081400
!	%l6 = 00000000, %l7 = ffff92f9, Mem[0000000010141408] = 0dffff7f 000d0000
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 ffff92f9
!	%l3 = ff000d00ffb60000, Mem[0000000010141410] = 7fffff0d0d5d6048
	stxa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000d00ffb60000
!	%l5 = ffffffffffff92e5, Mem[0000000010041408] = fffff9ff
	stha	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff92e5
!	Mem[0000000020800040] = 00ff75f2, %l5 = ffffffffffff92e5
	ldstuba	[%o1+0x040]%asi,%l5	! %l5 = 00000000000000ff
!	%f20 = 26fc9a75, Mem[0000000030141408] = 5efffffe
	sta	%f20,[%i5+%o4]0x81	! Mem[0000000030141408] = 26fc9a75
!	%l2 = 00000000ffffff14, Mem[0000000010001408] = ff00b6fff5ff4dd7
	stxa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000ffffff14
!	%l3 = ff000d00ffb60000, Mem[0000000030001400] = 7c000000
	stwa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = ffb60000
!	Starting 10 instruction Load Burst
!	Mem[000000001004142c] = ff000000, %l7 = ffffffffffff92f9
	ldub	[%i1+0x02d],%l7		! %l7 = 0000000000000000

p0_label_137:
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010001400] = eb000000 00007fff 00000000 ffffff14
!	Mem[0000000010001410] = e592ff72 0000b6ff ba1d4b68 e418a414
!	Mem[0000000010001420] = 141b3ec9 cc0efa00 e9ff4044 00000000
!	Mem[0000000010001430] = 00000000 8028e6ff ffffffff ffffffff
	ldda	[%i0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010001400
!	Mem[0000000010001408] = 00000000, %l0 = 0000000000009307
	ldsha	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 7f000000, %l1 = 00000000000000ff
	lduba	[%i3+%o5]0x81,%l1	! %l1 = 000000000000007f
!	Mem[0000000010041408] = e592ffff, %f7  = ce4965b8
	lda	[%i1+%o4]0x80,%f7 	! %f7 = e592ffff
!	Mem[0000000030041410] = 0000e38c, %l3 = ff000d00ffb60000
	lduba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 72ff92e5, %l4 = 0000000000007fff
	lduha	[%i3+%g0]0x89,%l4	! %l4 = 00000000000092e5
!	Mem[0000000010141400] = 0000ff7f00000004, %f12 = 0000008d 00002fe2
	ldda	[%i5+%g0]0x80,%f12	! %f12 = 0000ff7f 00000004
!	Mem[0000000030141410] = e38c000000000000, %f0  = 0000ff7f 00000004
	ldda	[%i5+%o5]0x81,%f0 	! %f0  = e38c0000 00000000
!	Mem[0000000010101408] = b6ff0000, %l2 = 00000000ffffff14
	lduha	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = 00000000 9bdf92f9, %l3 = 0000000000000000
!	Mem[00000000100c1418] = 14a418e4684b1dff
	add	%i3,0x018,%g1
	stda	%f2,[%g1+%l3]ASI_PST32_PL ! Mem[00000000100c1418] = 14a418e4684b1dff

p0_label_138:
!	%l0 = 0000000000000000, imm = fffffffffffff3c3, %l4 = 00000000000092e5
	or	%l0,-0xc3d,%l4		! %l4 = fffffffffffff3c3
	membar	#Sync			! Added by membar checker (32)
!	%l0 = 0000000000000000, Mem[0000000010001408] = 00000000
	stwa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010141408] = 00000000
	stha	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010181420] = 00000000
	sth	%l6,[%i6+0x020]		! Mem[0000000010181420] = 00000000
!	Mem[0000000010001437] = 8028e6ff, %l0 = 0000000000000000
	ldstuba	[%i0+0x037]%asi,%l0	! %l0 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000010141408] = f992ffff00000000
	stxa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%l4 = fffffffffffff3c3, Mem[0000000030041408] = ff00c16900000026
	stxa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = fffffffffffff3c3
!	Mem[0000000010101434] = 420effdc, %l0 = 000000ff, %l5 = 00000000
	add	%i4,0x34,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000420effdc
!	%l2 = 0000000000000000, Mem[0000000010001400] = eb00000000007fff
	stxa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000 4440ffe9, %l4 = fffff3c3, %l5 = 420effdc
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000000 000000004440ffe9

p0_label_139:
!	Mem[0000000030001410] = 0d5d60487fffff0d, %l2 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l2	! %l2 = 0d5d60487fffff0d
!	Mem[0000000010181404] = ffffff14, %l7 = 0000000000000000
	ldub	[%i6+0x005],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 7fffff0d, %l5 = 000000004440ffe9
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = ffffffffffffff0d
!	Mem[0000000030001408] = ff7f0000, %l2 = 0d5d60487fffff0d
	ldsba	[%i0+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041410] = 74ff0000, %l3 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l3	! %l3 = 0000000074ff0000
!	Mem[000000001000140c] = ffffff14, %l7 = 00000000000000ff
	ldsba	[%i0+0x00c]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1408] = 00000d00, %l7 = ffffffffffffffff
	lduwa	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000d00
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010001400] = 00000000 00000000 00000000 ffffff14
!	Mem[0000000010001410] = e592ff72 0000b6ff ba1d4b68 e418a414
!	Mem[0000000010001420] = 141b3ec9 cc0efa00 e9ff4044 00000000
!	Mem[0000000010001430] = 00000000 8028e6ff ffffffff ffffffff
	ldda	[%i0]ASI_BLK_AIUP,%f0	! Block Load from 0000000010001400
!	Mem[0000000030101408] = 000dffff, %l2 = ffffffffffffffff
	ldsba	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 74ff0000, Mem[00000000300c1400] = 72ff92e5 26fc9a75
	stda	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 74ff0000

p0_label_140:
!	Mem[0000000010101404] = 26fc9a75, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x004]%asi,%l0	! %l0 = 0000000026fc9a75
!	%l4 = 0000000000000000, Mem[000000001014140e] = 00000000, %asi = 80
	stha	%l4,[%i5+0x00e]%asi	! Mem[000000001014140c] = 00000000
!	%l0 = 0000000026fc9a75, Mem[000000001004140e] = 5b000000
	sth	%l0,[%i1+0x00e]		! Mem[000000001004140c] = 5b009a75
!	%l6 = 0000000000000000, Mem[0000000010141408] = 0000000000000000
	stx	%l6,[%i5+%o4]		! Mem[0000000010141408] = 0000000000000000
!	%l0 = 0000000026fc9a75, Mem[0000000010041400] = fffffffff6ffffff
	stx	%l0,[%i1+%g0]		! Mem[0000000010041400] = 0000000026fc9a75
!	%f17 = 00007fff, Mem[0000000010081408] = 00000000
	sta	%f17,[%i2+%o4]0x80	! Mem[0000000010081408] = 00007fff
!	%l4 = 0000000000000000, Mem[0000000010081410] = 7c000000
	stwa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	Mem[0000000030101408] = ffff0d00, %l0 = 0000000026fc9a75
	swapa	[%i4+%o4]0x89,%l0	! %l0 = 00000000ffff0d00
!	Mem[00000000300c1408] = 000d0000, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffb60000, %f24 = 141b3ec9
	lda	[%i2+%o5]0x89,%f24	! %f24 = ffb60000

p0_label_141:
!	Mem[00000000300c1400] = 00000000, %l5 = ffffffffffffff0d
	lduwa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = 14ffffff 00000000, %l0 = ffff0d00, %l1 = 0000007f
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000 0000000014ffffff
!	Mem[0000000030141410] = e38c0000, %l0 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l0	! %l0 = ffffffffffffe38c
!	Mem[0000000030041400] = 0000b6ff08a53020, %f18 = 00000000 ffffff14
	ldda	[%i1+%g0]0x89,%f18	! %f18 = 0000b6ff 08a53020
!	Mem[0000000010001400] = 00000000, %l0 = ffffffffffffe38c
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l4 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 0000ff7f, %f24 = ffb60000
	ld	[%i5+%g0],%f24	! %f24 = 0000ff7f
!	Mem[0000000010101408] = 0000ffb6, %f21 = 0000b6ff
	lda	[%i4+%o4]0x80,%f21	! %f21 = 0000ffb6
!	Mem[0000000030081410] = ffb60000, %l6 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030081410] = 0000b6ff
	stwa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000

p0_label_142:
!	Mem[0000000030101410] = ff00003a, %l7 = 0000000000000d00
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000ff00003a
!	%f25 = cc0efa00, Mem[0000000010101400] = ff0000ff
	sta	%f25,[%i4+%g0]0x88	! Mem[0000000010101400] = cc0efa00
!	Mem[0000000030041408] = ffffffff, %l6 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030041400] = 08a53020, %l6 = 00000000ffffffff
	swapa	[%i1+%g0]0x89,%l6	! %l6 = 0000000008a53020
!	Mem[0000000010141410] = ff000d00ffb60000, %l1 = 0000000014ffffff, %l2 = 0000000000000000
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = ff000d00ffb60000
!	Mem[0000000010081428] = ffc30000, %l2 = ff000d00ffb60000
	swap	[%i2+0x028],%l2		! %l2 = 00000000ffc30000
!	Mem[00000000201c0001] = ffff00a6, %l6 = 0000000008a53020
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000010181400] = 8e0b7821
	stwa	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%l1 = 0000000014ffffff, Mem[00000000211c0000] = 00ff2060, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff2060
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l7 = 00000000ff00003a
	ldswa	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_143:
!	Mem[0000000010101410] = ff000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000000 00000000ff000000
!	Mem[0000000010081410] = 00000000, %l5 = 00000000ff000000
	lduba	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = 0000b6ff, %l7 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l7	! %l7 = 000000000000b6ff
!	Mem[0000000010041408] = ffff92e5, %l3 = 0000000074ff0000
	lduwa	[%i1+%o4]0x88,%l3	! %l3 = 00000000ffff92e5
!	Mem[0000000030081410] = 0000000000000000, %f18 = 0000b6ff 08a53020
	ldda	[%i2+%o5]0x89,%f18	! %f18 = 00000000 00000000
!	Mem[0000000010141434] = 00902fe2, %l1 = 0000000014ffffff
	ldub	[%i5+0x034],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141408] = 26fc9a758ce336ff, %f6  = ba1d4b68 e418a414
	ldda	[%i5+%o4]0x81,%f6 	! %f6  = 26fc9a75 8ce336ff
!	Mem[00000000201c0000] = ffff00a6, %l6 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101400] = cc0efa00, %l6 = ffffffffffffffff
	ldsha	[%i4+%g0]0x88,%l6	! %l6 = fffffffffffffa00
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030181410] = 00000000 e9ff4044
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 00000000

p0_label_144:
!	%l0 = 0000000000000000, Mem[0000000030041410] = 0000e38c
	stba	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000e38c
!	%l4 = 0000000000000000, Mem[0000000030181408] = 26000000
	stba	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%f10 = e9ff4044 00000000, %l6 = fffffffffffffa00
!	Mem[0000000010141400] = 0000ff7f00000004
	stda	%f10,[%i5+%l6]ASI_PST8_P ! Mem[0000000010141400] = 0000ff7f00000004
!	Mem[0000000030081408] = 00000000, %l3 = 00000000ffff92e5
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l7 = 000000000000b6ff, Mem[0000000021800081] = e1b303a0, %asi = 80
	stba	%l7,[%o3+0x081]%asi	! Mem[0000000021800080] = e1ff03a0
	membar	#Sync			! Added by membar checker (34)
!	%f0  = 00000000, Mem[0000000010001408] = 00000000
	sta	%f0 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Mem[00000000300c1408] = ff000d00, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ff000d00
!	%l0 = 0000000000000000, Mem[0000000010141410] = ff000d00
	stwa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%l6 = fffffffffffffa00, Mem[0000000010041400] = 00000000
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = fa000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00fa0ecc000000ff, %f20 = e592ff72 0000ffb6
	ldda	[%i4+%g0]0x80,%f20	! %f20 = 00fa0ecc 000000ff

p0_label_145:
!	Mem[0000000030041400] = 0000b6ffffffffff, %f26 = e9ff4044 00000000
	ldda	[%i1+%g0]0x89,%f26	! %f26 = 0000b6ff ffffffff
!	Mem[00000000300c1408] = 00000000 00000dff, %l0 = 00000000, %l1 = ff000d00
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000 0000000000000dff
!	Mem[0000000030101410] = 000d0000, %l6 = fffffffffffffa00
	ldsba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = ffff92e5, %f12 = 00000000
	lda	[%i1+%o4]0x88,%f12	! %f12 = ffff92e5
!	Mem[0000000010001408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = ff00000000000000, %f28 = 00000000 8028e6ff
	ldda	[%i4+%o5]0x88,%f28	! %f28 = ff000000 00000000
!	Mem[0000000020800000] = ffff4c7b, %l3 = 0000000000000000
	ldsba	[%o1+0x001]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081410] = 00000000, %l0 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 00000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%f8  = 141b3ec9 cc0efa00, %l7 = 000000000000b6ff
!	Mem[0000000030141408] = 26fc9a758ce336ff
	add	%i5,0x008,%g1
	stda	%f8,[%g1+%l7]ASI_PST8_S ! Mem[0000000030141408] = 141b3ec9cc0efa00

p0_label_146:
!	%l2 = 00000000ffc30000, Mem[0000000010181413] = 000d0000, %asi = 80
	stba	%l2,[%i6+0x013]%asi	! Mem[0000000010181410] = 000d0000
!	%l4 = 0000000000000000, Mem[0000000030001410] = 0dffff7f48605d0d
	stxa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030141410] = 00008ce3
	stha	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010081424] = 0000ffb6
	stw	%l0,[%i2+0x024]		! Mem[0000000010081424] = 00000000
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 0000000000000000
	setx	0x961c8d005ae6b3cb,%g7,%l0 ! %l0 = 961c8d005ae6b3cb
!	%l1 = 0000000000000dff
	setx	0x82add6c86d69e72a,%g7,%l1 ! %l1 = 82add6c86d69e72a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 961c8d005ae6b3cb
	setx	0x6a5cdbff830d5a3c,%g7,%l0 ! %l0 = 6a5cdbff830d5a3c
!	%l1 = 82add6c86d69e72a
	setx	0x9b7627b85f783d83,%g7,%l1 ! %l1 = 9b7627b85f783d83
!	%l1 = 9b7627b85f783d83, Mem[0000000010141408] = 00000000
	stwa	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 5f783d83
!	Mem[0000000010181430] = e22f00009bdf92f9, %l1 = 9b7627b85f783d83, %l2 = 00000000ffc30000
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = e22f00009bdf92f9
!	%l6 = 00000000, %l7 = 0000b6ff, Mem[0000000030001408] = 00007fff e5920000
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 0000b6ff
!	%l2 = e22f00009bdf92f9, Mem[0000000030041400] = ffffffffffb60000
	stxa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = e22f00009bdf92f9
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 0000ff7f 00000004 ff000000 9bdf92f9
!	Mem[0000000030081410] = 00000000 00000000 62f61f63 ce4965b8
!	Mem[0000000030081420] = 21780b8e ffffff14 72ff92e5 0000c3ff
!	Mem[0000000030081430] = 0000008d 00002fe2 6c12b6ff 79b02854
	ldda	[%i2]ASI_BLK_AIUS,%f0	! Block Load from 0000000030081400

p0_label_147:
!	Mem[00000000201c0000] = ffff00a6, %l6 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141400] = 0000ff7f 00000004, %l6 = 000000ff, %l7 = 0000b6ff
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 000000000000ff7f 0000000000000004
!	Mem[0000000030101410] = 000d0000, %l4 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010081400] = ff000d00 ffb60000 00007fff 00000026
!	Mem[0000000010081410] = 00000000 ffffff14 d74dffff e59229bd
!	Mem[0000000010081420] = 00000000 00000000 ffb60000 e592ff72
!	Mem[0000000010081430] = e22f0000 9bdf92ff 7fffd67c 7fffffff
	ldda	[%i2]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[00000000100c1410] = 00000026, %l6 = 000000000000ff7f
	lduwa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000026
!	Mem[0000000030141410] = 00000000, %l2 = e22f00009bdf92f9
	lduha	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l3 = ffffffffffffffff
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = 000d0000, %l7 = 0000000000000004
	lduba	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = ffffffff, %l0 = 6a5cdbff830d5a3c
	ldsha	[%i6+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f0  = 0000ff7f 00000004, Mem[0000000030001408] = 00000000 0000b6ff
	stda	%f0 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000ff7f 00000004

p0_label_148:
!	%l2 = 00000000, %l3 = 00000000, Mem[00000000100c1410] = 26000000 e5000000
	stda	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 00000000
!	Mem[0000000010041408] = ffff92e5, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 000000e5000000ff
!	Mem[00000000100c1408] = e5920000, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 000000e5000000ff
!	%l7 = 00000000000000e5, Mem[0000000010001408] = 00000000
	stha	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 00e50000
!	%l0 = ffffffff, %l1 = 5f783d83, Mem[0000000030141410] = 00000000 00000000
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff 5f783d83
!	%l0 = ffffffffffffffff, Mem[00000000100c1408] = ff920000ffffff70
	stxa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffffffffffffff
!	%f2  = ff000000 9bdf92f9, Mem[0000000030181408] = 00000000 00004f00
	stda	%f2 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000 9bdf92f9
!	Mem[0000000010001400] = 00000000, %l7 = 00000000000000e5
	ldstuba	[%i0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081410] = 00000000, %l2 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 0000e38c, %l7 = 0000000000000000
	lduba	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_149:
!	Mem[0000000010081408] = 00007fff, %l5 = 0000000000000000
	ldsha	[%i2+0x008]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = 00fa0ecc, %l5 = 0000000000000000
	ldswa	[%i4+%g0]0x80,%l5	! %l5 = 0000000000fa0ecc
!	Mem[0000000010081410] = 00000000, %l0 = ffffffffffffffff
	ldsb	[%i2+0x011],%l0		! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (36)
!	Mem[00000000100c1400] = 00000000 00000000 ffffffff ffffffff
!	Mem[00000000100c1410] = 00000000 00000000 14a418e4 684b1dff
!	Mem[00000000100c1420] = 00fa0ecc 00000000 ffffd67c 0000ffe9
!	Mem[00000000100c1430] = 75e62880 00000000 ff28d67c e5920000
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000030001400] = ffb60000 f5ff4dd7 04000000 7fff0000
!	Mem[0000000030001410] = 00000000 00000000 266b0000 d1853e61
!	Mem[0000000030001420] = 67cbcd9f ea55ddfd b4388881 90000800
!	Mem[0000000030001430] = 6c30d4cf b5ab8c66 0c407e7f 845bf642
	ldda	[%i0]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030001400
!	Mem[00000000300c1408] = 00000000, %l3 = 00000000000000e5
	ldsba	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = e592ff72, %l1 = 9b7627b85f783d83
	ldswa	[%i0+%o5]0x80,%l1	! %l1 = ffffffffe592ff72
!	Mem[0000000010041410] = 74ff0000, %l1 = ffffffffe592ff72
	ldsba	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = 0000000000000000, %l6 = 0000000000000026
	ldxa	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 7f0000008e0b78ff
	stxa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000000000

p0_label_150:
!	%f23 = ffff4dd7, Mem[0000000030081400] = 7fff0000
	sta	%f23,[%i2+%g0]0x89	! Mem[0000000030081400] = ffff4dd7
!	%f22 = bd2992e5, Mem[000000001008141c] = e59229bd
	sta	%f22,[%i2+0x01c]%asi	! Mem[000000001008141c] = bd2992e5
!	Mem[00000000100c1408] = ffffffff, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 00000000ffffffff
!	%l4 = 0000000000000000, Mem[0000000010001420] = 141b3ec9cc0efa00, %asi = 80
	stxa	%l4,[%i0+0x020]%asi	! Mem[0000000010001420] = 0000000000000000
	membar	#Sync			! Added by membar checker (37)
!	%l6 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%f9  = 9fcdcb67, Mem[00000000300c1408] = 00000000
	sta	%f9 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 9fcdcb67
!	%l7 = 0000000000000000, Mem[0000000010081408] = 00007fff
	stba	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 00007fff
!	Mem[0000000010101400] = cc0efa00, %l2 = 00000000ffffffff
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 00000000cc0efa00
!	%f18 = 26000000, Mem[0000000010181420] = 00000000
	sta	%f18,[%i6+0x020]%asi	! Mem[0000000010181420] = 26000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff00a6, %l5 = 0000000000fa0ecc
	ldsb	[%o0+0x001],%l5		! %l5 = ffffffffffffffff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	ld	[%i6+0x02c],%l0
	stba	%l2,[%i4+0x015]%asi
	lduwa	[%i4+0x020]%asi,%l6
	ldxa	[%i1+0x018]%asi,%l0
	ldswa	[%i2+0x018]%asi,%l0
	lda	[%i6+0x028]%asi,%l6
	lduba	[%i1+0x035]%asi,%l6
	stwa	%l0,[%i1+0x024]%asi
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
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000cc0efa00
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be d74dfff5 0000b6ff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 0000ff7f 00000004
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 00000000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 613e85d1 00006b26
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be fddd55ea 9fcdcb67
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00080090 818838b4
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 668cabb5 cfd4306c
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 42f65b84 7f7e400c
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 0000b6ff 000d00ff
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 26000000 ff7f0000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 14ffffff 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be bd2992e5 ffff4dd7
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 00000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 72ff92e5 0000b6ff
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ff92df9b 00002fe2
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be ffffff7f 7cd6ff7f
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
	fcmps	%fcc1,%f6 ,%f6 
	add	%l7,%l5,%l3
	ldsba	[%i6+%g0]ASI_AS_IF_USER_PRIMARY,%l2	! Mem[0000000010181400]
	smul	%l6,-0xae5,%l0
	done

p0_trap1o:
	fcmps	%fcc1,%f6 ,%f6 
	add	%l7,%l5,%l3
	ldsba	[%o6+%g0]ASI_AS_IF_USER_PRIMARY,%l2	! Mem[0000000010181400]
	smul	%l6,-0xae5,%l0
	done


p0_trap2e:
	ldswa	[%i2+%o4]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010081408]
	xor	%l2,%l0,%l1
	sdivx	%l7,%l1,%l0
	and	%l6,-0x319,%l5
	nop
	fsqrts	%f9 ,%f6 
	subc	%l7,%l5,%l1
	done

p0_trap2o:
	ldswa	[%o2+%i4]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010081408]
	xor	%l2,%l0,%l1
	sdivx	%l7,%l1,%l0
	and	%l6,-0x319,%l5
	nop
	fsqrts	%f9 ,%f6 
	subc	%l7,%l5,%l1
	done


p0_trap3e:
	sub	%l6,0x16a,%l4
	done

p0_trap3o:
	sub	%l6,0x16a,%l4
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
	ldx	[%g1+0x000],%l0		! %l0 = 9caf383c95cd13de
	ldx	[%g1+0x008],%l1		! %l1 = c9259657ca643574
	ldx	[%g1+0x010],%l2		! %l2 = dd6b16b0751c2a32
	ldx	[%g1+0x018],%l3		! %l3 = 1050504adfc228c4
	ldx	[%g1+0x020],%l4		! %l4 = 24559198565cb6a6
	ldx	[%g1+0x028],%l5		! %l5 = 803dcf6a3d297b57
	ldx	[%g1+0x030],%l6		! %l6 = 4ded7dbebb94337d
	ldx	[%g1+0x038],%l7		! %l7 = 37ff0a528d5ecf94

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
	orn	%l4,%l6,%l5
	st	%f8 ,[%i3+0x02c]	! Mem[00000000100c142c]
	std	%f0 ,[%i4+0x028]	! Mem[0000000010101428]
	stx	%l0,[%i2+0x008]		! Mem[0000000010081408]
	addc	%l7,0x646,%l5
	ldd	[%i4+0x038],%l4		! Mem[0000000010101438]
	jmpl	%o7,%g0
	fitos	%f7 ,%f15
p0_near_0_he:
	ldd	[%i6+0x008],%f30	! Mem[0000000010181408]
	std	%l0,[%i6+0x000]		! Mem[0000000010181400]
	udivx	%l7,-0x4cd,%l5
	ld	[%i0+0x01c],%f19	! Mem[000000001000141c]
	jmpl	%o7,%g0
	fdtos	%f16,%f25
near0_b2b_h:
	jmpl	%o7,%g0
	or	%l2,0x52f,%l5
	jmpl	%o7,%g0
	nop
near0_b2b_l:
	jmpl	%o7,%g0
	udivx	%l5,-0x50e,%l1
	jmpl	%o7,%g0
	nop
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	jmpl	%o7,%g0
	andn	%l3,%l7,%l6
	jmpl	%o7,%g0
	nop
p0_near_1_he:
	std	%f16,[%i0+0x008]	! Mem[0000000010001408]
	ldstub	[%o3+0x001],%l3		! Mem[0000000021800001]
	xnor	%l6,0x46d,%l0
	subc	%l2,%l2,%l2
	std	%l6,[%i0+0x000]		! Mem[0000000010001400]
	swap	[%i0+0x024],%l7		! Mem[0000000010001424]
	subc	%l2,%l4,%l4
	jmpl	%o7,%g0
	ld	[%i1+0x004],%f26	! Mem[0000000010041404]
near1_b2b_h:
	sdivx	%l2,-0xa8d,%l3
	xnor	%l4,-0xa98,%l5
	fmuls	%f27,%f30,%f27
	jmpl	%o7,%g0
	addc	%l0,%l5,%l1
near1_b2b_l:
	subc	%l6,-0x79e,%l3
	umul	%l5,0xf1c,%l2
	fcmps	%fcc2,%f13,%f3 
	jmpl	%o7,%g0
	and	%l4,-0x4c8,%l1
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	xnor	%l0,-0x9b3,%l7
	ld	[%i1+0x00c],%f6 	! Mem[000000001004140c]
	smul	%l1,0xed4,%l5
	ldstub	[%o2+0x001],%l6		! Mem[00000000211c0001]
	fsubs	%f1 ,%f3 ,%f7 
	ldsh	[%i1+0x010],%l7		! Mem[0000000010041410]
	fsubs	%f8 ,%f14,%f10
	jmpl	%o7,%g0
	ldd	[%i2+0x018],%l4		! Mem[0000000010081418]
p0_near_2_he:
	add	%l5,0xa18,%l7
	xnor	%l2,0xbb4,%l1
	umul	%l5,0x4e3,%l4
	jmpl	%o7,%g0
	ldstub	[%i4+0x017],%l6		! Mem[0000000010101417]
near2_b2b_h:
	fstod	%f28,%f24
	fitod	%f22,%f30
	fadds	%f19,%f16,%f25
	udivx	%l7,-0xb59,%l6
	fdivs	%f25,%f18,%f29
	jmpl	%o7,%g0
	addc	%l5,%l2,%l7
near2_b2b_l:
	fmuls	%f5 ,%f5 ,%f9 
	fstoi	%f7 ,%f3 
	xnor	%l0,-0x857,%l7
	smul	%l0,-0xc53,%l1
	mulx	%l0,0x4c8,%l0
	jmpl	%o7,%g0
	orn	%l6,0x92e,%l6
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	orn	%l2,%l6,%l5
	ldsw	[%i1+0x018],%l6		! Mem[0000000010041418]
	fstod	%f6 ,%f0 
	fsqrts	%f13,%f6 
	fsubs	%f8 ,%f15,%f3 
	ldd	[%i2+0x000],%l0		! Mem[0000000010081400]
	addc	%l4,%l1,%l6
	jmpl	%o7,%g0
	add	%l1,0xc3e,%l1
p0_near_3_he:
	orn	%l6,%l2,%l4
	std	%l6,[%i6+0x018]		! Mem[0000000010181418]
	jmpl	%o7,%g0
	ldd	[%i4+0x038],%l0		! Mem[0000000010101438]
near3_b2b_h:
	and	%l2,%l2,%l6
	jmpl	%o7,%g0
	addc	%l0,%l7,%l4
near3_b2b_l:
	add	%l0,%l4,%l5
	jmpl	%o7,%g0
	fmuls	%f6 ,%f7 ,%f3 
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fdtoi	%f10,%f5 
	xnor	%l7,%l4,%l5
	std	%l4,[%i3+0x028]		! Mem[00000000100c1428]
	std	%l4,[%i6+0x038]		! Mem[0000000010181438]
	xor	%l3,%l4,%l5
	jmpl	%o7,%g0
	stb	%l1,[%i0+0x03b]		! Mem[000000001000143b]
p0_far_0_lem:
	fdtoi	%f10,%f5 
	xnor	%l7,%l4,%l5
	membar	#Sync
	std	%l4,[%i3+0x028]		! Mem[00000000100c1428]
	std	%l4,[%i6+0x038]		! Mem[0000000010181438]
	xor	%l3,%l4,%l5
	membar	#Sync
	jmpl	%o7,%g0
	stb	%l1,[%i0+0x03b]		! Mem[000000001000143b]
p0_far_0_he:
	ld	[%i0+0x028],%f26	! Mem[0000000010001428]
	fitod	%f18,%f16
	sth	%l4,[%i6+0x03e]		! Mem[000000001018143e]
	ldstub	[%o0+0x000],%l7		! Mem[00000000201c0000]
	lduh	[%i4+0x018],%l3		! Mem[0000000010101418]
	swap	[%i5+0x020],%l3		! Mem[0000000010141420]
	jmpl	%o7,%g0
	ldub	[%i5+0x016],%l5		! Mem[0000000010141416]
p0_far_0_hem:
	membar	#Sync
	ld	[%i0+0x028],%f26	! Mem[0000000010001428]
	fitod	%f18,%f16
	sth	%l4,[%i6+0x03e]		! Mem[000000001018143e]
	ldstub	[%o0+0x000],%l7		! Mem[00000000201c0000]
	lduh	[%i4+0x018],%l3		! Mem[0000000010101418]
	swap	[%i5+0x020],%l3		! Mem[0000000010141420]
	membar	#Sync
	jmpl	%o7,%g0
	ldub	[%i5+0x016],%l5		! Mem[0000000010141416]
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	xnor	%l1,%l2,%l0
	sdivx	%l3,%l0,%l2
	or	%l7,-0xf35,%l0
	umul	%l2,-0x982,%l6
	jmpl	%o7,%g0
	fcmps	%fcc0,%f28,%f17
far0_b2b_l:
	subc	%l3,%l7,%l1
	fdivs	%f2 ,%f15,%f7 
	addc	%l6,%l4,%l1
	xor	%l7,%l2,%l7
	jmpl	%o7,%g0
	fmuls	%f8 ,%f6 ,%f4 
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	lduw	[%i6+0x030],%l2		! Mem[0000000010181430]
	ldstub	[%i2+0x013],%l3		! Mem[0000000010081413]
	jmpl	%o7,%g0
	mulx	%l0,%l3,%l3
p0_far_1_lem:
	membar	#Sync
	lduw	[%i6+0x030],%l2		! Mem[0000000010181430]
	ldstub	[%i2+0x013],%l3		! Mem[0000000010081413]
	jmpl	%o7,%g0
	mulx	%l0,%l3,%l3
p0_far_1_he:
	and	%l5,%l2,%l1
	ldub	[%i1+0x00a],%l2		! Mem[000000001004140a]
	fstod	%f23,%f26
	swap	[%i1+0x02c],%l4		! Mem[000000001004142c]
	fdivs	%f27,%f20,%f16
	swap	[%i3+0x020],%l4		! Mem[00000000100c1420]
	andn	%l2,%l6,%l1
	jmpl	%o7,%g0
	ldstub	[%o0+0x001],%l2		! Mem[00000000201c0001]
p0_far_1_hem:
	and	%l5,%l2,%l1
	membar	#Sync
	ldub	[%i1+0x00a],%l2		! Mem[000000001004140a]
	fstod	%f23,%f26
	swap	[%i1+0x02c],%l4		! Mem[000000001004142c]
	fdivs	%f27,%f20,%f16
	swap	[%i3+0x020],%l4		! Mem[00000000100c1420]
	andn	%l2,%l6,%l1
	jmpl	%o7,%g0
	ldstub	[%o0+0x001],%l2		! Mem[00000000201c0001]
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	sdivx	%l0,%l5,%l6
	umul	%l2,%l5,%l7
	jmpl	%o7,%g0
	fitod	%f29,%f20
far1_b2b_l:
	fdtoi	%f10,%f7 
	subc	%l1,-0x592,%l7
	jmpl	%o7,%g0
	orn	%l5,-0xe6f,%l2
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	sub	%l4,%l7,%l5
	fsqrts	%f11,%f1 
	fsqrts	%f7 ,%f9 
	sub	%l5,%l4,%l3
	fitos	%f5 ,%f5 
	jmpl	%o7,%g0
	xor	%l7,-0x0da,%l5
p0_far_2_lem:
	sub	%l4,%l7,%l5
	fsqrts	%f11,%f1 
	fsqrts	%f7 ,%f9 
	sub	%l5,%l4,%l3
	fitos	%f5 ,%f5 
	jmpl	%o7,%g0
	xor	%l7,-0x0da,%l5
p0_far_2_he:
	or	%l7,-0x5c5,%l0
	jmpl	%o7,%g0
	fdtoi	%f24,%f23
p0_far_2_hem:
	or	%l7,-0x5c5,%l0
	jmpl	%o7,%g0
	fdtoi	%f24,%f23
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fcmps	%fcc1,%f19,%f21
	andn	%l4,%l0,%l7
	udivx	%l7,-0x940,%l1
	fmuls	%f17,%f16,%f20
	and	%l1,%l7,%l4
	umul	%l0,%l2,%l0
	jmpl	%o7,%g0
	addc	%l1,0x9b3,%l1
far2_b2b_l:
	addc	%l4,-0x10c,%l6
	add	%l2,%l2,%l1
	fitos	%f11,%f4 
	sdivx	%l3,-0x494,%l7
	fadds	%f3 ,%f4 ,%f0 
	mulx	%l5,0x470,%l4
	jmpl	%o7,%g0
	fsubs	%f15,%f11,%f2 
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	jmpl	%o7,%g0
	ldd	[%i1+0x000],%f2 	! Mem[0000000010041400]
	jmpl	%o7,%g0
	nop
p0_far_3_lem:
	membar	#Sync
	jmpl	%o7,%g0
	ldd	[%i1+0x000],%f2 	! Mem[0000000010041400]
	jmpl	%o7,%g0
	nop
p0_far_3_he:
	nop
	ldub	[%i2+0x026],%l6		! Mem[0000000010081426]
	and	%l2,-0x17d,%l0
	jmpl	%o7,%g0
	andn	%l6,-0xe28,%l3
p0_far_3_hem:
	nop
	membar	#Sync
	ldub	[%i2+0x026],%l6		! Mem[0000000010081426]
	and	%l2,-0x17d,%l0
	jmpl	%o7,%g0
	andn	%l6,-0xe28,%l3
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	andn	%l2,-0xd5b,%l1
	fadds	%f22,%f22,%f16
	fcmps	%fcc2,%f25,%f30
	fcmps	%fcc3,%f29,%f28
	fitos	%f31,%f27
	fadds	%f31,%f25,%f27
	fmuls	%f25,%f27,%f25
	jmpl	%o7,%g0
	fdivs	%f22,%f31,%f25
far3_b2b_l:
	fitod	%f11,%f8 
	subc	%l6,-0x9c3,%l1
	fstod	%f12,%f14
	udivx	%l5,%l2,%l7
	nop
	udivx	%l0,0x898,%l1
	umul	%l0,%l2,%l7
	jmpl	%o7,%g0
	fsubs	%f9 ,%f1 ,%f7 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	fcmps	%fcc1,%f9 ,%f2 
	ldd	[%i4+0x010],%l2		! Mem[0000000010101410]
	stb	%l5,[%i5+0x00b]		! Mem[000000001014140b]
	add	%l1,-0x995,%l7
	ldub	[%i2+0x00a],%l5		! Mem[000000001008140a]
	ldstub	[%i3+0x028],%l6		! Mem[00000000100c1428]
	jmpl	%g6+8,%g0
	ld	[%i0+0x034],%f9 	! Mem[0000000010001434]
p0_call_0_le:
	umul	%l1,%l1,%l3
	udivx	%l1,-0x267,%l4
	or	%l2,%l4,%l0
	retl
	fitos	%f9 ,%f4 
p0_jmpl_0_lo:
	fcmps	%fcc1,%f9 ,%f2 
	ldd	[%o4+0x010],%l2		! Mem[0000000010101410]
	stb	%l5,[%o5+0x00b]		! Mem[000000001014140b]
	add	%l1,-0x995,%l7
	ldub	[%o2+0x00a],%l5		! Mem[000000001008140a]
	ldstub	[%o3+0x028],%l6		! Mem[00000000100c1428]
	jmpl	%g6+8,%g0
	ld	[%o0+0x034],%f9 	! Mem[0000000010001434]
p0_call_0_lo:
	umul	%l1,%l1,%l3
	udivx	%l1,-0x267,%l4
	or	%l2,%l4,%l0
	retl
	fitos	%f9 ,%f4 
p0_jmpl_0_he:
	ldx	[%i0+0x010],%l5		! Mem[0000000010001410]
	jmpl	%g6+8,%g0
	fcmps	%fcc2,%f19,%f25
p0_call_0_he:
	orn	%l6,-0x151,%l3
	stx	%l3,[%i2+0x038]		! Mem[0000000010081438]
	stx	%l6,[%i4+0x000]		! Mem[0000000010101400]
	swap	[%i4+0x01c],%l6		! Mem[000000001010141c]
	umul	%l1,%l5,%l1
	fstod	%f22,%f20
	retl
	stx	%l4,[%i3+0x010]		! Mem[00000000100c1410]
p0_jmpl_0_ho:
	ldx	[%o0+0x010],%l5		! Mem[0000000010001410]
	jmpl	%g6+8,%g0
	fcmps	%fcc2,%f19,%f25
p0_call_0_ho:
	orn	%l6,-0x151,%l3
	stx	%l3,[%o2+0x038]		! Mem[0000000010081438]
	stx	%l6,[%o4+0x000]		! Mem[0000000010101400]
	swap	[%o4+0x01c],%l6		! Mem[000000001010141c]
	umul	%l1,%l5,%l1
	fstod	%f22,%f20
	retl
	stx	%l4,[%o3+0x010]		! Mem[00000000100c1410]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	and	%l0,%l2,%l0
	add	%l7,%l1,%l4
	fdtos	%f8 ,%f11
	ldstub	[%o3+0x1c1],%l6		! Mem[00000000218001c1]
	mulx	%l2,0xcd8,%l0
	xor	%l7,%l5,%l3
	jmpl	%g6+8,%g0
	fsubs	%f13,%f12,%f5 
p0_call_1_le:
	ldd	[%i6+0x020],%l4		! Mem[0000000010181420]
	ldsh	[%i0+0x03c],%l1		! Mem[000000001000143c]
	retl
	fstod	%f9 ,%f14
p0_jmpl_1_lo:
	and	%l0,%l2,%l0
	add	%l7,%l1,%l4
	fdtos	%f8 ,%f11
	ldstub	[%i3+0x1c1],%l6		! Mem[00000000218001c1]
	mulx	%l2,0xcd8,%l0
	xor	%l7,%l5,%l3
	jmpl	%g6+8,%g0
	fsubs	%f13,%f12,%f5 
p0_call_1_lo:
	ldd	[%o6+0x020],%l4		! Mem[0000000010181420]
	ldsh	[%o0+0x03c],%l1		! Mem[000000001000143c]
	retl
	fstod	%f9 ,%f14
p0_jmpl_1_he:
	ldub	[%i2+0x03f],%l0		! Mem[000000001008143f]
	and	%l5,-0xa37,%l2
	jmpl	%g6+8,%g0
	stx	%l2,[%i5+0x018]		! Mem[0000000010141418]
p0_call_1_he:
	fdivs	%f22,%f22,%f18
	fitos	%f26,%f17
	umul	%l5,0xd5b,%l6
	ldsh	[%i5+0x032],%l4		! Mem[0000000010141432]
	ldsb	[%i2+0x033],%l6		! Mem[0000000010081433]
	swap	[%i2+0x038],%l2		! Mem[0000000010081438]
	retl
	fadds	%f18,%f28,%f23
p0_jmpl_1_ho:
	ldub	[%o2+0x03f],%l0		! Mem[000000001008143f]
	and	%l5,-0xa37,%l2
	jmpl	%g6+8,%g0
	stx	%l2,[%o5+0x018]		! Mem[0000000010141418]
p0_call_1_ho:
	fdivs	%f22,%f22,%f18
	fitos	%f26,%f17
	umul	%l5,0xd5b,%l6
	ldsh	[%o5+0x032],%l4		! Mem[0000000010141432]
	ldsb	[%o2+0x033],%l6		! Mem[0000000010081433]
	swap	[%o2+0x038],%l2		! Mem[0000000010081438]
	retl
	fadds	%f18,%f28,%f23
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	fmuls	%f1 ,%f0 ,%f11
	fsubs	%f3 ,%f2 ,%f9 
	jmpl	%g6+8,%g0
	fcmps	%fcc0,%f1 ,%f6 
p0_call_2_le:
	umul	%l4,-0x73c,%l6
	stw	%l6,[%i4+0x004]		! Mem[0000000010101404]
	sth	%l0,[%i0+0x03e]		! Mem[000000001000143e]
	st	%f7 ,[%i3+0x010]	! Mem[00000000100c1410]
	fdtoi	%f6 ,%f8 
	stb	%l6,[%i4+0x014]		! Mem[0000000010101414]
	retl
	fsqrts	%f10,%f5 
p0_jmpl_2_lo:
	fmuls	%f1 ,%f0 ,%f11
	fsubs	%f3 ,%f2 ,%f9 
	jmpl	%g6+8,%g0
	fcmps	%fcc0,%f1 ,%f6 
p0_call_2_lo:
	umul	%l4,-0x73c,%l6
	stw	%l6,[%o4+0x004]		! Mem[0000000010101404]
	sth	%l0,[%o0+0x03e]		! Mem[000000001000143e]
	st	%f7 ,[%o3+0x010]	! Mem[00000000100c1410]
	fdtoi	%f6 ,%f8 
	stb	%l6,[%o4+0x014]		! Mem[0000000010101414]
	retl
	fsqrts	%f10,%f5 
p0_jmpl_2_he:
	jmpl	%g6+8,%g0
	ldsh	[%i1+0x00c],%l4		! Mem[000000001004140c]
p0_call_2_he:
	ldsh	[%i6+0x00e],%l7		! Mem[000000001018140e]
	or	%l5,-0xb5d,%l3
	ld	[%i6+0x034],%f31	! Mem[0000000010181434]
	add	%l7,0xfd5,%l1
	xor	%l3,-0xeb8,%l7
	fcmps	%fcc3,%f25,%f30
	retl
	xnor	%l7,0x23b,%l5
p0_jmpl_2_ho:
	jmpl	%g6+8,%g0
	ldsh	[%o1+0x00c],%l4		! Mem[000000001004140c]
p0_call_2_ho:
	ldsh	[%o6+0x00e],%l7		! Mem[000000001018140e]
	or	%l5,-0xb5d,%l3
	ld	[%o6+0x034],%f31	! Mem[0000000010181434]
	add	%l7,0xfd5,%l1
	xor	%l3,-0xeb8,%l7
	fcmps	%fcc3,%f25,%f30
	retl
	xnor	%l7,0x23b,%l5
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	jmpl	%g6+8,%g0
	std	%f4 ,[%i1+0x038]	! Mem[0000000010041438]
p0_call_3_le:
	udivx	%l5,0x7b0,%l7
	ldstub	[%i2+0x006],%l4		! Mem[0000000010081406]
	ldstub	[%i6+0x02e],%l1		! Mem[000000001018142e]
	std	%f6 ,[%i4+0x000]	! Mem[0000000010101400]
	andn	%l5,%l1,%l3
	retl
	subc	%l0,-0xf15,%l6
p0_jmpl_3_lo:
	jmpl	%g6+8,%g0
	std	%f4 ,[%o1+0x038]	! Mem[0000000010041438]
p0_call_3_lo:
	udivx	%l5,0x7b0,%l7
	ldstub	[%o2+0x006],%l4		! Mem[0000000010081406]
	ldstub	[%o6+0x02e],%l1		! Mem[000000001018142e]
	std	%f6 ,[%o4+0x000]	! Mem[0000000010101400]
	andn	%l5,%l1,%l3
	retl
	subc	%l0,-0xf15,%l6
p0_jmpl_3_he:
	std	%f30,[%i3+0x020]	! Mem[00000000100c1420]
	xor	%l1,0x14d,%l1
	ldd	[%i3+0x028],%l4		! Mem[00000000100c1428]
	jmpl	%g6+8,%g0
	stb	%l2,[%i3+0x01b]		! Mem[00000000100c141b]
p0_call_3_he:
	retl
	ld	[%i2+0x014],%f25	! Mem[0000000010081414]
p0_jmpl_3_ho:
	std	%f30,[%o3+0x020]	! Mem[00000000100c1420]
	xor	%l1,0x14d,%l1
	ldd	[%o3+0x028],%l4		! Mem[00000000100c1428]
	jmpl	%g6+8,%g0
	stb	%l2,[%o3+0x01b]		! Mem[00000000100c141b]
p0_call_3_ho:
	retl
	ld	[%o2+0x014],%f25	! Mem[0000000010081414]
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
	.word	0x9caf383c,0x95cd13de		! Init value for %l0
	.word	0xc9259657,0xca643574		! Init value for %l1
	.word	0xdd6b16b0,0x751c2a32		! Init value for %l2
	.word	0x1050504a,0xdfc228c4		! Init value for %l3
	.word	0x24559198,0x565cb6a6		! Init value for %l4
	.word	0x803dcf6a,0x3d297b57		! Init value for %l5
	.word	0x4ded7dbe,0xbb94337d		! Init value for %l6
	.word	0x37ff0a52,0x8d5ecf94		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xac7ec92c,0xe37cc357		! Init value for %f0 
	.word	0x369d37e5,0x6538d146		! Init value for %f2 
	.word	0xed4ff044,0xb075bdfb		! Init value for %f4 
	.word	0x1efe678c,0x75ceb7ee		! Init value for %f6 
	.word	0x4e283f11,0x35c51cdf		! Init value for %f8 
	.word	0x1e5aefbb,0x69c1d312		! Init value for %f10
	.word	0x246b1a28,0x2238748d		! Init value for %f12
	.word	0xbb0912dd,0xd9c93902		! Init value for %f14
	.word	0x0c760cf9,0xba6df26a		! Init value for %f16
	.word	0x5c36fd04,0xbdb26398		! Init value for %f18
	.word	0x66611fec,0xde36977b		! Init value for %f20
	.word	0x2b168a52,0x066d5eb1		! Init value for %f22
	.word	0x3a6501ba,0xc93e1b14		! Init value for %f24
	.word	0xb192740c,0x3c5c3be9		! Init value for %f26
	.word	0xe9b71d10,0x8e4212ee		! Init value for %f28
	.word	0x2bd10c67,0x964d48d7		! Init value for %f30
	.word	0x572c40ca,0xadbfd51f		! Init value for %f32
	.word	0x99252452,0xf2143b56		! Init value for %f34
	.word	0x1930712a,0xca4d1f17		! Init value for %f36
	.word	0xba779b9b,0x775494bf		! Init value for %f38
	.word	0xe5c5fdf9,0x20b0470b		! Init value for %f40
	.word	0x2bdfc8fa,0x2d4af679		! Init value for %f42
	.word	0xee3194ca,0x90e361f8		! Init value for %f44
	.word	0x0a8a4a38,0x85657312		! Init value for %f46
	.word	0xf1b14030,0x057adef1
	.word	0xa1174b48,0x89c63f61
	.word	0x7aee8f3a,0x33a4712f
	.word	0x973b5e00,0x4714668b
	.word	0xe05091e2,0xa2c00b3e
	.word	0x9dbb02ea,0xec681de7
	.word	0xfca9b69f,0x4ff4dda6
	.word	0x5ad8e2ce,0xea82fafa
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
	.word	0x00000000,0x00000000
	.word	0x00000000,0xcc0efa00
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0xd74dfff5,0x0000b6ff
	.word	0x0000ff7f,0x00000004
	.word	0x00000000,0x00000000
	.word	0x613e85d1,0x00006b26
	.word	0xfddd55ea,0x9fcdcb67
	.word	0x00080090,0x818838b4
	.word	0x668cabb5,0xcfd4306c
	.word	0x42f65b84,0x7f7e400c
	.word	0x0000b6ff,0x000d00ff
	.word	0x26000000,0xff7f0000
	.word	0x14ffffff,0x00000000
	.word	0xbd2992e5,0xffff4dd7
	.word	0x00000000,0x00000000
	.word	0x72ff92e5,0x0000b6ff
	.word	0xff92df9b,0x00002fe2
	.word	0xffffff7f,0x7cd6ff7f
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0xff000000,0x00000000
	.word	0x00e50000,0xffffff14
	.word	0xe592ff72,0x0000b6ff
	.word	0xba1d4b68,0xe418a414
	.word	0x00000000,0x00000000
	.word	0xe9ff4044,0x00000000
	.word	0x00000000,0x8028e6ff
	.word	0xffffffff,0xffffffff
p0_local0_sec_expect:
	.word	0xffb60000,0xf5ff4dd7
	.word	0x04000000,0x7fff0000
	.word	0x00000000,0x00000000
	.word	0x266b0000,0xd1853e61
	.word	0x67cbcd9f,0xea55ddfd
	.word	0xb4388881,0x90000800
	.word	0x6c30d4cf,0xb5ab8c66
	.word	0x0c407e7f,0x845bf642
p0_local1_expect:
	.word	0xfa000000,0x26fc9a75
	.word	0xff92ffff,0x5b009a75
	.word	0x0000ff74,0x08a53020
	.word	0xeeeccf13,0x55768eff
	.word	0x0d5d00ff,0x7fffffff
	.word	0x67cbcd9f,0xff000000
	.word	0xff2c0000,0xeb0092f9
	.word	0x0d5d6048,0x420e70dc
p0_local1_sec_expect:
	.word	0xe22f0000,0x9bdf92f9
	.word	0x00000000,0xfffff3c3
	.word	0x0000e38c,0x759afc26
	.word	0x67080000,0xe59229bd
	.word	0x141b3ec9,0x0dffff7f
	.word	0xffc30000,0xe592ff72
	.word	0xe22f0000,0x9bdf92f9
	.word	0x000000ff,0x000092e5
p0_local2_expect:
	.word	0xff000d00,0xffb60000
	.word	0x00007fff,0x00000026
	.word	0x00000000,0xffffff14
	.word	0xd74dffff,0xbd2992e5
	.word	0x00000000,0x00000000
	.word	0xffb60000,0xe592ff72
	.word	0xe22f0000,0x9bdf92ff
	.word	0x7fffd67c,0x7fffffff
p0_local2_sec_expect:
	.word	0xd74dffff,0x00000004
	.word	0xff000000,0x9bdf92f9
	.word	0x00000000,0x00000000
	.word	0x62f61f63,0xce4965b8
	.word	0x21780b8e,0xffffff14
	.word	0x72ff92e5,0x0000c3ff
	.word	0x0000008d,0x00002fe2
	.word	0x6c12b6ff,0x79b02854
p0_local3_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0xffffffff
	.word	0x00000000,0x00000000
	.word	0x14a418e4,0x684b1dff
	.word	0x00fa0ecc,0x00000000
	.word	0xffffd67c,0x0000ffe9
	.word	0x75e62880,0x00000000
	.word	0xff28d67c,0xe5920000
p0_local3_sec_expect:
	.word	0x00000000,0x0000ff74
	.word	0x67cbcd9f,0x00000dff
	.word	0x00000000,0x00000000
	.word	0xd44582ae,0x63d4034b
	.word	0xa73a4e6c,0xa6891397
	.word	0xc2b1bab3,0x2fbd55ab
	.word	0x3d07b5d4,0xdcc5f7ed
	.word	0x40f78674,0xe4c1710c
p0_local4_expect:
	.word	0xffffffff,0x000000ff
	.word	0x0000ffb6,0x4a7eff2f
	.word	0x00000000,0x000000ff
	.word	0x0000b6ff,0x00000000
	.word	0x90ff5cf6,0x26fc9aff
	.word	0x01303666,0xffe62880
	.word	0x00000024,0x420effdc
	.word	0xd44582ae,0xffffffff
p0_local4_sec_expect:
	.word	0x07930000,0x000000da
	.word	0x759afc26,0x80c4e444
	.word	0x00000d00,0xffffd67c
	.word	0xc1a62c43,0x88f5170a
	.word	0x3b887b5e,0xabb629a2
	.word	0x89ad67bd,0xd379c7d0
	.word	0x9e64c200,0xd9064c44
	.word	0xe5920000,0xff000000
p0_local5_expect:
	.word	0x0000ff7f,0x00000004
	.word	0x833d785f,0x00000000
	.word	0x00000000,0xffb60000
	.word	0x62f61f63,0xce4965b8
	.word	0x21780b8e,0xffffff14
	.word	0x72ff92e5,0x0000c3ff
	.word	0x0000008d,0x00902fe2
	.word	0x6c12b6ff,0x79b02854
p0_local5_sec_expect:
	.word	0x0dffff7f,0xf5ff4dd7
	.word	0x141b3ec9,0xcc0efa00
	.word	0xffffffff,0x833d785f
	.word	0x7779db5c,0x12d72c8c
	.word	0x95b80dd9,0x19aa3e44
	.word	0x767636fa,0x113f284e
	.word	0xa1c2b7b5,0xfe9314a6
	.word	0xf4ccbc0a,0xc88b6a2c
p0_local6_expect:
	.word	0x00000000,0xffffff14
	.word	0xffffffff,0xffffffff
	.word	0x000d0000,0x79b02854
	.word	0xd74dffff,0xe59229bd
	.word	0x26000000,0x0000ffb6
	.word	0xffc30000,0xe592ff72
	.word	0xe22f0000,0x9bdf92f9
	.word	0x00000000,0xffb60000
p0_local6_sec_expect:
	.word	0xffd6ff7f,0xb6ff0000
	.word	0xf992df9b,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x12a7eeec,0x18c510f8
	.word	0x68a2d1f5,0xf9823c57
	.word	0x668cabb5,0xcfd4306c
	.word	0x8028e6ff,0x8ff3ab22
	.word	0xcbede5e0,0xf622bef9
share0_expect:
	.word	0xffff00a6,0xd93d586a
	.word	0xd71fe035,0x9755f0d5
	.word	0x35c4edf6,0x69a59299
	.word	0x15f0c819,0xcdd75336
	.word	0x704cb985,0x56ae9083
	.word	0xc4bdf5fc,0x467d8aff
	.word	0x3a7ab02a,0xe9121eb1
	.word	0xc0bb8beb,0x86eb79c0
share1_expect:
	.word	0xffff4c7b,0x078655be
	.word	0x305ce072,0x1f40b25f
	.word	0xba34abbb,0xd998b54a
	.word	0x0cdbc62a,0xeb153ae3
	.word	0x27b02f4e,0x6a605908
	.word	0x0c3f1032,0x021bc734
	.word	0xe513a628,0xf127cde7
	.word	0xa62b96b0,0xdb5ef425
	.word	0xffff75f2,0x00ea037c
	.word	0xcb6a3a77,0x99a3420c
	.word	0x61f7b134,0xb7e77a07
	.word	0x9fa70cd6,0xf79ee5ad
	.word	0x71ed0b30,0x1b4211ef
	.word	0xc6f44fbc,0x04e58b9f
	.word	0x1b998d09,0xdcc60518
	.word	0x35746c2e,0x90d56a24
share2_expect:
	.word	0xffff2060,0xa2db72a4
	.word	0xfddaaf9c,0x958f630b
	.word	0x7b60c1a6,0xc6d64dae
	.word	0xb6e55afd,0xf20a43e1
	.word	0xaa4ad630,0x8ee26c50
	.word	0x96de2773,0x81d100d1
	.word	0xff9df815,0xa7ecbbf5
	.word	0xa019a5c6,0xbca95d03
share3_expect:
	.word	0x3ac0c83b,0x178199be
	.word	0x262bd257,0x00dcd4a8
	.word	0x7434439c,0x3e5a7dda
	.word	0x7f222d72,0x42f56586
	.word	0x850ff72b,0xbd68cbaf
	.word	0xdfe2f845,0x7b4866db
	.word	0x7f0c4ec9,0x16b27fbe
	.word	0x855e4bea,0xce77e515
	.word	0xff743c69,0x6117ae1d
	.word	0x06fcb53d,0x3b7d997e
	.word	0xee3488bb,0x9848bc12
	.word	0x8bbc6133,0xd21674f0
	.word	0xfd4498ef,0xe9396dbd
	.word	0xe50eb97f,0xba0262d0
	.word	0x6ffdbbe8,0x2f6b4d17
	.word	0xa974b1f0,0x11951278
	.word	0xe1ff03a0,0x3b8c5b7b
	.word	0xd5e6dd7a,0xe21a2c77
	.word	0x74ee9272,0x34358903
	.word	0x30ba90c3,0xa4665f24
	.word	0xbbe9bb12,0x4d374e67
	.word	0x8a9882f9,0xb21f5459
	.word	0x9086f786,0x5c4b2eb4
	.word	0xbaef537d,0xe8a05e30
	.word	0xd7ff56e2,0x0c8661fb
	.word	0x258fc285,0x74379033
	.word	0x98039cbd,0xfbed99dc
	.word	0x86929aaa,0xfc2cf252
	.word	0x9f03af81,0xe7acd66e
	.word	0x14c1a3f1,0x06b3587c
	.word	0xdb9c2598,0xbfc6ad8e
	.word	0x7398935d,0xa3154012
	.word	0xff8d008a,0x7954aefd
	.word	0x6a532d81,0x0fdd0986
	.word	0x9c5c13e6,0x4526c93e
	.word	0x614bf503,0xe43be8cd
	.word	0x504234ea,0x46fa8cbf
	.word	0x393ed062,0xf85c5a13
	.word	0x978e728b,0xa40928af
	.word	0x9bfac900,0x672f8749
	.word	0xffe68990,0xceeef699
	.word	0x601419f6,0x721ac80f
	.word	0xd4c5ff01,0x3a01a76d
	.word	0xa819ddbd,0x2fdd1dc9
	.word	0xb5504095,0xaf7343c4
	.word	0x94f29403,0xb5e80a32
	.word	0x7916d4f9,0x9d8a8857
	.word	0x0aa6eae3,0x03c8fa03
	.word	0x5bff0fa6,0x72d29844
	.word	0x8d9171bb,0x8b48d7f9
	.word	0xb7c5cea0,0xd5cd7e81
	.word	0x318f01c0,0x2e17d146
	.word	0xdee13192,0x1422f04c
	.word	0x34aef9a1,0xb0b6e903
	.word	0x8bdc4c00,0x0fe20af3
	.word	0x0c9b06db,0x3b641957
	.word	0xffb2afb2,0x0684c97e
	.word	0xd9c842af,0xa4b5320a
	.word	0xe20af5fd,0xb5c983ed
	.word	0xe47a9455,0x505b2bd2
	.word	0x45fd61bd,0x2d6f4edc
	.word	0x37bbd37d,0xfd31c379
	.word	0x11c7989a,0xadb17541
	.word	0xfe129f03,0x25f38178
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
	.word	0xcdd0f24f,0x836b3096
	.word	0x00000000,0x00000002
	.word	0x75453d7f,0x87f5b775
	.word	0x00000000,0x00000003
	.word	0x3bd82177,0xa8e80869
	.word	0x00000000,0x00000004
	.word	0xe042c11f,0xaf767de4
	.word	0x00000000,0x00000005
	.word	0xf84468af,0x914564ec
	.word	0x00000000,0x00000006
	.word	0x5c620e87,0x89c06135
	.word	0x00000000,0x00000007
	.word	0x0482978f,0xabd5d382
	.word	0x00000000,0x00000008
	.word	0x9b5ab32f,0xff76c79e
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
	.word	0x55510c83,0xa716d4b2,0x8618561f,0x87d3446a
	.word	0x4d8621cd,0x5e391914,0x05b3d04f,0xd74d26f5
	.word	0xe5edfc48,0x5e200dad,0x5ad3bfe8,0x9e0a9481
	.word	0xe480a62a,0xdd8db524,0xdab377f7,0x42c702ee
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
	.word	0x9a018a5d,0xcc0fba2e,0xc4762ade,0x3ce7f672
	.word	0xffe48662,0x72d08867,0x006b47d5,0xd1853e61
	.word	0xcd845856,0xea55ddfd,0xb4388881,0xc7730867
	.word	0x6c30d4cf,0xb5ab8c66,0x0c407e7f,0x845bf642
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
	.word	0x3620ab74,0x71a96f98,0xf087e6a9,0xff82025e
	.word	0xe2bf01b0,0xfe816ebd,0x3cb43f21,0x873774c2
	.word	0x5cdbdbcd,0xf40508b6,0x2da16c1d,0x2065a59b
	.word	0xcc10640a,0x4dd7a574,0x169ba395,0xc2902ae5
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
	.word	0x194ffc26,0xbbdd5e5c,0xb248a928,0x2706a29b
	.word	0xb78bd3df,0xd17fef5e,0xd7fd7bf6,0x48a4e3d8
	.word	0x5a70f200,0x98e8b133,0xb3c9358d,0xcf01060a
	.word	0xb5a7d98f,0xb29ab7e0,0x5efdb3b4,0x93a8c16d
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
	.word	0x2a5f9162,0xe289cf0a,0x53f4d9a3,0x38a53cc3
	.word	0xdbecf7bd,0x19d8b203,0x81c016a1,0x36fbcbd8
	.word	0xe517610a,0x56811a7f,0x9962f259,0xda936a0e
	.word	0x2030a508,0x8d36e38c,0x25b22013,0x0f4a1457
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
	.word	0xb1073523,0x45d7bc20,0x2d4e1d67,0xaca1f2e9
	.word	0xe6052524,0x29878819,0x13ac7a67,0x01148667
	.word	0xbd06a19c,0x8a911fe9,0xad6e94f0,0xb8517bbd
	.word	0xade93ea6,0x9ce5dcb4,0x4c1d2862,0xc5e5bb50
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
	.word	0xb711420e,0x758179cc,0x60e86d54,0xbe43375a
	.word	0x66363001,0x36d6017e,0x14a418e4,0x684b1dba
	.word	0x00fa0ecc,0xf47aead5,0x7a782d7c,0x95d78134
	.word	0x31fefe5b,0x715860fc,0x6e2751d5,0x999b85c3
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
	.word	0x337b67bd,0x2f08c0f8,0xe95f4044,0xa8550329
	.word	0x7e33f606,0x12d3ca0e,0xd44582ae,0x63d4034b
	.word	0xa73a4e6c,0xa6891397,0xc2b1bab3,0x2fbd55ab
	.word	0x3d07b5d4,0xdcc5f7ed,0x40f78674,0xe4c1710c
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
	.word	0x15590540,0x1cfdb3a2,0xc034a3b8,0x2fe27e4a
	.word	0xe2afd773,0x3075b969,0x6880e6e0,0x56d7ddbc
	.word	0x89ad5cf6,0x26fc9a75,0x6e321cde,0x459816d8
	.word	0xf11a25e8,0x420e70dc,0x6dab3ab6,0x7f77732d
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
	.word	0xe690516e,0x0365c3ba,0x1dd10d9a,0x80c4e444
	.word	0xcf28d67c,0xa8a85b4f,0xc1a62c43,0x88f5170a
	.word	0x3b887b5e,0xabb629a2,0xb7329cc0,0xd379c7d0
	.word	0x9e64c200,0xd9064c44,0x68569e75,0x5ad0beec
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
	.word	0xfde62880,0xeaebdfa9,0xda1bc7eb,0xb856b588
	.word	0xca426e3c,0x706a7de5,0x62f61f63,0xce4965b8
	.word	0x21780b8e,0xda58a03f,0x72c4c675,0xa0f133f6
	.word	0xf992df9b,0x93ff39ac,0x6c12c98b,0x79b08954
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
	.word	0x69dd3f80,0x8d8b9106,0xc52b38ac,0x3a1f2633
	.word	0xdecdece6,0x8d54af27,0x7779f567,0x12d72c8c
	.word	0x95b80dd9,0x19aa3e44,0x767636fa,0xff5ffee5
	.word	0xa1c2b7b5,0xfe9314a6,0xf4ccbc0a,0xc88b6a2c
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
	.word	0x078ab3f9,0xbcac00d6,0xe6a5e781,0xb50698ad
	.word	0x30f49982,0xb3e1b9f1,0xeeeccf13,0x55768edf
	.word	0x0d5d6048,0x46601c9b,0x67cbcd9f,0xa28b8558
	.word	0xe32c2092,0xee57b475,0xb32d2359,0x8e885507
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
	.word	0x8a6a9354,0xd1072fb7,0xaaef44c6,0xe59229bd
	.word	0xd66da258,0xa868f892,0x12a7eeec,0x18c510f8
	.word	0x68a2d1f5,0xf9823c57,0x2a619e14,0xaa6d29a9
	.word	0x742e0bad,0x8ff3ab22,0xcbede5e0,0xf622bef9
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
	.word	0x0b3100a6,0xd93d586a,0xd71fe035,0x9755f0d5
	.word	0x35c4edf6,0x69a59299,0x15f0c819,0xcdd75336
	.word	0x704cb985,0x56ae9083,0xc4bdf5fc,0x467d8aff
	.word	0x3a7ab02a,0xe9121eb1,0xc0bb8beb,0x86eb79c0
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
	.word	0xa42e4c7b,0x078655be,0x305ce072,0x1f40b25f
	.word	0xba34abbb,0xd998b54a,0x0cdbc62a,0xeb153ae3
	.word	0x27b02f4e,0x6a605908,0x0c3f1032,0x021bc734
	.word	0xe513a628,0xf127cde7,0xa62b96b0,0xdb5ef425
	.word	0x8d1c75f2,0x00ea037c,0xcb6a3a77,0x99a3420c
	.word	0x61f7b134,0xb7e77a07,0x9fa70cd6,0xf79ee5ad
	.word	0x71ed0b30,0x1b4211ef,0xc6f44fbc,0x04e58b9f
	.word	0x1b998d09,0xdcc60518,0x35746c2e,0x90d56a24
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
	.word	0xbde32060,0xa2db72a4,0xfddaaf9c,0x958f630b
	.word	0x7b60c1a6,0xc6d64dae,0xb6e55afd,0xf20a43e1
	.word	0xaa4ad630,0x8ee26c50,0x96de2773,0x81d100d1
	.word	0xff9df815,0xa7ecbbf5,0xa019a5c6,0xbca95d03
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
	.word	0x3ac0c83b,0x178199be,0x262bd257,0x00dcd4a8
	.word	0x7434439c,0x3e5a7dda,0x7f222d72,0x42f56586
	.word	0x850ff72b,0xbd68cbaf,0xdfe2f845,0x7b4866db
	.word	0x7f0c4ec9,0x16b27fbe,0x855e4bea,0xce77e515
	.word	0x04743c69,0x6117ae1d,0x06fcb53d,0x3b7d997e
	.word	0xee3488bb,0x9848bc12,0x8bbc6133,0xd21674f0
	.word	0xfd4498ef,0xe9396dbd,0xe50eb97f,0xba0262d0
	.word	0x6ffdbbe8,0x2f6b4d17,0xa974b1f0,0x11951278
	.word	0x3a4903a0,0x3b8c5b7b,0xd5e6dd7a,0xe21a2c77
	.word	0x74ee9272,0x34358903,0x30ba90c3,0xa4665f24
	.word	0xbbe9bb12,0x4d374e67,0x8a9882f9,0xb21f5459
	.word	0x9086f786,0x5c4b2eb4,0xbaef537d,0xe8a05e30
	.word	0xd79056e2,0x0c8661fb,0x258fc285,0x74379033
	.word	0x98039cbd,0xfbed99dc,0x86929aaa,0xfc2cf252
	.word	0x9f03af81,0xe7acd66e,0x14c1a3f1,0x06b3587c
	.word	0xdb9c2598,0xbfc6ad8e,0x7398935d,0xa3154012
	.word	0x258d008a,0x7954aefd,0x6a532d81,0x0fdd0986
	.word	0x9c5c13e6,0x4526c93e,0x614bf503,0xe43be8cd
	.word	0x504234ea,0x46fa8cbf,0x393ed062,0xf85c5a13
	.word	0x978e728b,0xa40928af,0x9bfac900,0x672f8749
	.word	0x72e68990,0xceeef699,0x601419f6,0x721ac80f
	.word	0xd4c5ff01,0x3a01a76d,0xa819ddbd,0x2fdd1dc9
	.word	0xb5504095,0xaf7343c4,0x94f29403,0xb5e80a32
	.word	0x7916d4f9,0x9d8a8857,0x0aa6eae3,0x03c8fa03
	.word	0x2d0d0fa6,0x72d29844,0x8d9171bb,0x8b48d7f9
	.word	0xb7c5cea0,0xd5cd7e81,0x318f01c0,0x2e17d146
	.word	0xdee13192,0x1422f04c,0x34aef9a1,0xb0b6e903
	.word	0x8bdc4c00,0x0fe20af3,0x0c9b06db,0x3b641957
	.word	0x36b2afb2,0x0684c97e,0xd9c842af,0xa4b5320a
	.word	0xe20af5fd,0xb5c983ed,0xe47a9455,0x505b2bd2
	.word	0x45fd61bd,0x2d6f4edc,0x37bbd37d,0xfd31c379
	.word	0x11c7989a,0xadb17541,0xfe129f03,0x25f38178
share3_end:
