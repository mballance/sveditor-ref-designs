/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_2000_17.s
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
!	Seed = 330103943
!	Riesling can be on
!	1 Thread, 2000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_2000_17.s created on Mar 30, 2009 (10:39:43)
!	RC file : mar26.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar26.rc -o mpgen_2000_17 -p 1 -l 2000

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
!	%f0  = 1ea54470 a5d74ed1 d5e4c16f 79dccb52
!	%f4  = 17a825f8 1bab6075 2478b2ca dba80498
!	%f8  = ca877beb df38bfe5 1831a4e7 51db2712
!	%f12 = daa75d56 3f1f6cf9 f3760b9f fab9676a
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 88f2bc69 777f6acc 4c6e2360 5045b4ac
!	%f20 = 1bf85f92 5cb2437d 26e57ecc fa192923
!	%f24 = c1151992 2a6bee38 a69efaf6 39fc283b
!	%f28 = dcdbd6f8 d0f61b82 9f499795 176bb887
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = e118bca8 a89bb937 482d5152 1553a3a0
!	%f36 = 85b301a4 04b3a421 ff903a53 9ebe2647
!	%f40 = a3b827ed eb792c1f 143b2f8a 123b7f2f
!	%f44 = acda706e 1beae61a 1a4c1d3e e03c4082
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xdf20ddff00000007,%g7,%g1 ! GSR scale =  0, align = 7
	wr	%g1,%g0,%gsr		! GSR = df20ddff00000007
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000010101408] = e9d011e27dce599e, %l6 = 755384c274f2db83
	ldxa	[%i4+0x008]%asi,%l6	! %l6 = e9d011e27dce599e
!	%f6  = 2478b2ca dba80498, Mem[0000000010041408] = ee59e3a7 f09f4261
	stda	%f6 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 2478b2ca dba80498
!	Mem[0000000010081400] = 8f355064, %l5 = 78a90911a3ce1d4d, %asi = 80
	swapa	[%i2+0x000]%asi,%l5	! %l5 = 000000008f355064
!	%l4 = 51639208, %l5 = 8f355064, Mem[00000000100c1408] = f433680c 73ae1e78
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 51639208 8f355064
!	Mem[0000000030101400] = dd6041fa, %l6 = e9d011e27dce599e
	ldswa	[%i4+%g0]0x81,%l6	! %l6 = ffffffffdd6041fa
!	Mem[00000000100c1400] = 91805266, %l7 = c66f10b2bf83e6b4
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000091
!	Mem[00000000100c1408] = 51639208, %l1 = 9bf2cfe03309c53e
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 0000000051639208
!	Mem[0000000010001400] = 61a6c4bb, %l5 = 000000008f355064
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 00000061000000ff
!	Mem[0000000010101400] = 42501220, %l4 = 7159770c51639208
	ldsba	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000020
!	Starting 10 instruction Store Burst
!	%f28 = dcdbd6f8 d0f61b82, Mem[0000000010041400] = ea08d2bd ea3aa890
	std	%f28,[%i1+%g0]	! Mem[0000000010041400] = dcdbd6f8 d0f61b82

p0_label_2:
!	%l5 = 0000000000000061, Mem[0000000030101400] = 71346c3bfa4160dd
	stxa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000061
!	%f21 = 5cb2437d, Mem[0000000010181400] = d6c6f46b
	sta	%f21,[%i6+%g0]0x88	! Mem[0000000010181400] = 5cb2437d
!	%l4 = 00000020, %l5 = 00000061, Mem[0000000010181408] = aa752d05 2901741a
	stda	%l4,[%i6+0x008]%asi	! Mem[0000000010181408] = 00000020 00000061
!	Mem[0000000020800000] = c5ca5a05, %l4 = 0000000000000020
	ldstuba	[%o1+0x000]%asi,%l4	! %l4 = 000000c5000000ff
!	%l2 = c4ad5a68cd57317c, Mem[0000000010081410] = a18c0a8b
	stwa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = cd57317c
!	%l0 = 18654768, %l1 = 51639208, Mem[0000000030041410] = 84c2be28 6b2ea0fe
	stda	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 18654768 51639208
!	%l4 = 00000000000000c5, Mem[0000000010001408] = 363537eb5b4e7b99
	stxa	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000000000c5
!	Mem[0000000010101400] = 42501220, %l0 = 1564bc1818654768
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 00000020000000ff
!	Mem[0000000010181410] = 6f37531d, %l2 = c4ad5a68cd57317c
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 000000006f37531d
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 9804a8dbcab27824, %l0 = 0000000000000020
	ldxa	[%i1+%o4]0x80,%l0	! %l0 = 9804a8dbcab27824

p0_label_3:
!	Mem[0000000010081408] = 26b2c014, %l1 = 0000000051639208
	lduha	[%i2+%o4]0x88,%l1	! %l1 = 000000000000c014
!	Mem[0000000030101410] = 8232d2c6, %l3 = 87cb47ce0aa690c2
	lduwa	[%i4+%o5]0x81,%l3	! %l3 = 000000008232d2c6
!	Mem[0000000010041400] = f8d6dbdc, %l3 = 000000008232d2c6
	lduwa	[%i1+%g0]0x88,%l3	! %l3 = 00000000f8d6dbdc
!	Mem[0000000030081410] = f398207e, %l4 = 00000000000000c5
	lduha	[%i2+%o5]0x89,%l4	! %l4 = 000000000000207e
!	Mem[0000000010141400] = 21ab3855, %l2 = 000000006f37531d
	ldsba	[%i5+0x002]%asi,%l2	! %l2 = 0000000000000038
!	Mem[0000000030001408] = 8c5ddd3f1f369552, %l5 = 0000000000000061
	ldxa	[%i0+%o4]0x81,%l5	! %l5 = 8c5ddd3f1f369552
!	Mem[0000000010141408] = af5dc644, %l7 = 0000000000000091
	lduba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000af
!	Mem[0000000030041410] = 68476518, %l4 = 000000000000207e
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000006847
!	Mem[0000000030181408] = 6e0b7f3a 39d135b5, %l6 = dd6041fa, %l7 = 000000af
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 000000006e0b7f3a 0000000039d135b5
!	Starting 10 instruction Store Burst
!	%l0 = cab27824, %l1 = 0000c014, Mem[0000000010141408] = 44c65daf 715dc466
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = cab27824 0000c014

p0_label_4:
!	%f10 = 1831a4e7 51db2712, Mem[0000000010181400] = 7d43b25c 24182526
	stda	%f10,[%i6+%g0]0x80	! Mem[0000000010181400] = 1831a4e7 51db2712
!	%l0 = 9804a8dbcab27824, Mem[00000000201c0000] = 85944c16, %asi = 80
	stba	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 24944c16
!	%l4 = 00006847, %l5 = 1f369552, Mem[00000000300c1408] = 94b52a91 597041ae
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00006847 1f369552
!	%f4  = 17a825f8, Mem[0000000030041408] = ce22a038
	sta	%f4 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 17a825f8
!	%l0 = cab27824, %l1 = 0000c014, Mem[00000000100c1410] = 5a499e5f acecd116
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = cab27824 0000c014
!	Mem[0000000030041408] = f825a817, %l5 = 8c5ddd3f1f369552
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 00000017000000ff
!	%f22 = 26e57ecc fa192923, %l4 = 0000000000006847
!	Mem[0000000010181428] = 65d72f00001c6d15
	add	%i6,0x028,%g1
	stda	%f22,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010181428] = 232919facc7e6d15
!	%l2 = 00000038, %l3 = f8d6dbdc, Mem[0000000010101408] = e9d011e2 7dce599e
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000038 f8d6dbdc
!	%l3 = 00000000f8d6dbdc, Mem[00000000300c1400] = 03e82aa3
	stwa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = f8d6dbdc
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000020, %l5 = 0000000000000017
	ldsba	[%i6+0x00b]%asi,%l5	! %l5 = 0000000000000020

p0_label_5:
!	Mem[0000000030001410] = 7a718f26 2922c2d4, %l0 = cab27824, %l1 = 0000c014
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 000000007a718f26 000000002922c2d4
!	Mem[0000000030181410] = 277b28e3520c5628, %l3 = 00000000f8d6dbdc
	ldxa	[%i6+%o5]0x89,%l3	! %l3 = 277b28e3520c5628
!	Mem[0000000030001408] = 5295361f3fdd5d8c, %f28 = dcdbd6f8 d0f61b82
	ldda	[%i0+%o4]0x89,%f28	! %f28 = 5295361f 3fdd5d8c
!	Mem[000000001000140c] = 00000000, %f16 = 88f2bc69
	ld	[%i0+0x00c],%f16	! %f16 = 00000000
!	Mem[0000000030181410] = 28560c52, %l4 = 0000000000006847
	lduba	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000028
!	Mem[0000000010101400] = ff125042, %l1 = 000000002922c2d4
	ldsba	[%i4+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1408] = 3ec50933, %l5 = 0000000000000020
	lduwa	[%i3+%o4]0x88,%l5	! %l5 = 000000003ec50933
!	Mem[0000000020800040] = bcc7e22a, %l2 = 0000000000000038
	lduh	[%o1+0x040],%l2		! %l2 = 000000000000bcc7
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 000000007a718f26
	setx	0x928a84286d4df32b,%g7,%l0 ! %l0 = 928a84286d4df32b
!	%l1 = ffffffffffffffff
	setx	0xb11f91dfe94ddca7,%g7,%l1 ! %l1 = b11f91dfe94ddca7
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 928a84286d4df32b
	setx	0x902a7f9843821c6e,%g7,%l0 ! %l0 = 902a7f9843821c6e
!	%l1 = b11f91dfe94ddca7
	setx	0x827ee767dddef13d,%g7,%l1 ! %l1 = 827ee767dddef13d
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 20000000, %l4 = 0000000000000028
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 0000000020000000

p0_label_6:
!	Mem[00000000300c1408] = 00006847, %l1 = 827ee767dddef13d
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 0000000000006847
!	%l0 = 43821c6e, %l1 = 00006847, Mem[00000000100c1408] = 3ec50933 6450358f
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 43821c6e 00006847
!	%f13 = 3f1f6cf9, Mem[0000000010041408] = dba80498
	sta	%f13,[%i1+%o4]0x88	! Mem[0000000010041408] = 3f1f6cf9
!	Mem[00000000211c0001] = 2cff6986, %l3 = 277b28e3520c5628
	ldstub	[%o2+0x001],%l3		! %l3 = 000000ff000000ff
!	%l1 = 0000000000006847, Mem[0000000010041408] = f96c1f3f
	stha	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 68471f3f
!	%l2 = 000000000000bcc7, Mem[0000000010001436] = a625cae9
	sth	%l2,[%i0+0x036]		! Mem[0000000010001434] = a625bcc7
!	%l6 = 000000006e0b7f3a, Mem[0000000010081430] = ce964045e94226de, %asi = 80
	stxa	%l6,[%i2+0x030]%asi	! Mem[0000000010081430] = 000000006e0b7f3a
!	%f12 = daa75d56 3f1f6cf9, Mem[0000000010181400] = e7a43118 1227db51
	stda	%f12,[%i6+%g0]0x88	! Mem[0000000010181400] = daa75d56 3f1f6cf9
!	%f6  = 2478b2ca dba80498, Mem[0000000010101408] = 00000038 f8d6dbdc
	stda	%f6 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 2478b2ca dba80498
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ef2fc1fdebdc8968, %l4 = 0000000020000000
	ldxa	[%i1+%g0]0x89,%l4	! %l4 = ef2fc1fdebdc8968

p0_label_7:
!	Mem[000000001010143c] = 3d04de1c, %l3 = 00000000000000ff
	lduw	[%i4+0x03c],%l3		! %l3 = 000000003d04de1c
!	Mem[0000000010101414] = 4bf7ed64, %l1 = 0000000000006847
	ldsh	[%i4+0x014],%l1		! %l1 = 0000000000004bf7
!	Mem[0000000010101410] = 76a25b1c4bf7ed64, %l6 = 000000006e0b7f3a
	ldx	[%i4+%o5],%l6		! %l6 = 76a25b1c4bf7ed64
!	Mem[0000000010001400] = ffa6c4bb, %l1 = 0000000000004bf7
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ffa6c4bb
!	Mem[0000000010001414] = 11c45f74, %l7 = 0000000039d135b5
	ldsha	[%i0+0x016]%asi,%l7	! %l7 = 0000000000005f74
!	Mem[0000000010141400] = 21ab3855640041c6, %f24 = c1151992 2a6bee38
	ldda	[%i5+0x000]%asi,%f24	! %f24 = 21ab3855 640041c6
!	Mem[0000000010001438] = bad062da e18eb258, %l4 = ebdc8968, %l5 = 3ec50933
	ldda	[%i0+0x038]%asi,%l4	! %l4 = 00000000bad062da 00000000e18eb258
!	Mem[0000000030101408] = cb983130, %l0 = 902a7f9843821c6e
	lduwa	[%i4+%o4]0x81,%l0	! %l0 = 00000000cb983130
!	%l6 = 76a25b1c4bf7ed64, %l0 = 00000000cb983130, %l4 = 00000000bad062da
	sub	%l6,%l0,%l4		! %l4 = 76a25b1b805fbc34
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 00000028, %l0 = 00000000cb983130
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000028

p0_label_8:
!	%f27 = 39fc283b, Mem[0000000010041400] = f8d6dbdc
	sta	%f27,[%i1+%g0]0x88	! Mem[0000000010041400] = 39fc283b
!	%l0 = 0000000000000028, Mem[0000000010041408] = 68471f3f
	stba	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 28471f3f
!	Mem[0000000010141400] = 21ab3855, %l0 = 0000000000000028
	ldstuba	[%i5+%g0]0x80,%l0	! %l0 = 00000021000000ff
!	%l0 = 00000021, %l1 = ffa6c4bb, Mem[0000000030101410] = 8232d2c6 844e71dc
	stda	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000021 ffa6c4bb
!	%l5 = 00000000e18eb258, Mem[00000000100c1410] = cab27824
	stha	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = cab2b258
!	%f20 = 1bf85f92 5cb2437d, %l7 = 0000000000005f74
!	Mem[0000000010181418] = da008c70e37b3d9b
	add	%i6,0x018,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010181418] = da00b270925ff89b
!	Mem[0000000010141408] = cab27824, %l6 = 76a25b1c4bf7ed64
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 00000024000000ff
!	Mem[0000000010181408] = 303198cb, %l1 = 00000000ffa6c4bb
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 00000030000000ff
!	%f19 = 5045b4ac, Mem[0000000030001408] = 3fdd5d8c
	sta	%f19,[%i0+%o4]0x89	! Mem[0000000030001408] = 5045b4ac
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = 000000006e0b7f3a, %f4  = 17a825f8 1bab6075
	ldda	[%i2+0x030]%asi,%f4 	! %f4  = 00000000 6e0b7f3a

p0_label_9:
!	Mem[0000000010141400] = ffab3855640041c6, %f28 = 5295361f 3fdd5d8c
	ldd	[%i5+%g0],%f28		! %f28 = ffab3855 640041c6
!	Mem[0000000010101410] = 76a25b1c4bf7ed64, %l1 = 0000000000000030
	ldxa	[%i4+%o5]0x80,%l1	! %l1 = 76a25b1c4bf7ed64
!	Mem[0000000010181408] = ff3198cb00000061, %f6  = 2478b2ca dba80498
	ldd	[%i6+%o4],%f6 		! %f6  = ff3198cb 00000061
!	Mem[0000000030041400] = ebdc8968, %l0 = 0000000000000021
	lduba	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000068
!	Mem[0000000030181410] = 28560c52, %l5 = 00000000e18eb258
	ldsha	[%i6+%o5]0x81,%l5	! %l5 = 0000000000002856
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 0000000000000068
	setx	0x7d1be907d3beab13,%g7,%l0 ! %l0 = 7d1be907d3beab13
!	%l1 = 76a25b1c4bf7ed64
	setx	0xf982a9e006bdecdd,%g7,%l1 ! %l1 = f982a9e006bdecdd
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7d1be907d3beab13
	setx	0x4854ed3f8166b84a,%g7,%l0 ! %l0 = 4854ed3f8166b84a
!	%l1 = f982a9e006bdecdd
	setx	0x3a76d3ffb8937e03,%g7,%l1 ! %l1 = 3a76d3ffb8937e03
!	Mem[0000000010181408] = cb9831ff, %l2 = 000000000000bcc7
	ldsha	[%i6+%o4]0x88,%l2	! %l2 = 00000000000031ff
!	Mem[0000000030181408] = b535d139 3a7f0b6e, %l6 = 00000024, %l7 = 00005f74
	ldda	[%i6+%o4]0x89,%l6	! %l6 = 000000003a7f0b6e 00000000b535d139
!	Mem[0000000010101400] = ff125042 d2be1b72, %l0 = 8166b84a, %l1 = b8937e03
	ldda	[%i4+%g0]0x80,%l0	! %l0 = 00000000ff125042 00000000d2be1b72
!	Starting 10 instruction Store Burst
!	%l1 = 00000000d2be1b72, Mem[00000000100c1408] = 6e1c8243
	stba	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 721c8243

p0_label_10:
!	Mem[00000000100c143c] = 2fa3d66e, %l4 = 76a25b1b805fbc34
	ldstub	[%i3+0x03c],%l4		! %l4 = 0000002f000000ff
!	Mem[0000000010041408] = 3f1f4728, %l4 = 000000000000002f
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 000000003f1f4728
!	Mem[0000000010001400] = ffa6c4bb, %l2 = 000031ff, %l7 = b535d139
	casa	[%i0]0x80,%l2,%l7	! %l7 = 00000000ffa6c4bb
!	%f24 = 21ab3855 640041c6, %l5 = 0000000000002856
!	Mem[0000000030081408] = b1d6ef0377e4b6ce
	add	%i2,0x008,%g1
	stda	%f24,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030081408] = b1d600645538b6ce
!	%l5 = 0000000000002856, Mem[0000000010141420] = 60099c4f, %asi = 80
	stwa	%l5,[%i5+0x020]%asi	! Mem[0000000010141420] = 00002856
!	%f24 = 21ab3855, Mem[0000000030041408] = f825a8ff
	sta	%f24,[%i1+%o4]0x89	! Mem[0000000030041408] = 21ab3855
!	%l1 = 00000000d2be1b72, Mem[0000000010081410] = 7c3157cd
	stba	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 7c315772
!	%f20 = 1bf85f92 5cb2437d, Mem[0000000010001410] = bfd3f035 11c45f74
	stda	%f20,[%i0+%o5]0x80	! Mem[0000000010001410] = 1bf85f92 5cb2437d
!	Mem[0000000030141400] = 3bdc34b5, %l3 = 000000003d04de1c
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 000000003bdc34b5
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 7257317c, %f0  = 1ea54470
	lda	[%i2+%o5]0x80,%f0 	! %f0 = 7257317c

p0_label_11:
!	%l1 = 00000000d2be1b72, Mem[0000000030001408] = 5045b4ac
	stba	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 5045b472
!	Mem[0000000030041410] = 6847651808926351, %l3 = 000000003bdc34b5
	ldxa	[%i1+%o5]0x81,%l3	! %l3 = 6847651808926351
!	Mem[0000000030001410] = 268f717a, %l0 = 00000000ff125042
	ldsha	[%i0+%o5]0x89,%l0	! %l0 = 000000000000717a
!	Mem[00000000211c0000] = 2cff6986, %l3 = 6847651808926351
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 0000000000002cff
!	Mem[0000000010081408] = 14c0b226, %l5 = 0000000000002856
	lduwa	[%i2+%o4]0x80,%l5	! %l5 = 0000000014c0b226
!	Mem[00000000100c1408] = 721c8243, %f29 = 640041c6
	lda	[%i3+%o4]0x80,%f29	! %f29 = 721c8243
!	Mem[0000000010041408] = 2f000000 cab27824, %l2 = 000031ff, %l3 = 00002cff
	ldd	[%i1+%o4],%l2		! %l2 = 000000002f000000 00000000cab27824
!	Mem[0000000030041408] = 5538ab21, %l2 = 000000002f000000
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = 0000000000005538
!	Mem[0000000010181408] = cb9831ff, %f30 = 9f499795
	lda	[%i6+%o4]0x88,%f30	! %f30 = cb9831ff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000cab27824, Mem[0000000010141400] = ffab3855
	stha	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 78243855

p0_label_12:
!	%l0 = 0000717a, %l1 = d2be1b72, Mem[00000000100c1410] = cab2b258 0000c014
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000717a d2be1b72
!	%l0 = 0000717a, %l1 = d2be1b72, Mem[0000000010141408] = ff78b2ca 14c00000
	std	%l0,[%i5+%o4]		! Mem[0000000010141408] = 0000717a d2be1b72
!	%l5 = 0000000014c0b226, Mem[0000000030001400] = bfbfa66f
	stba	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 26bfa66f
!	%l3 = 00000000cab27824, Mem[0000000010081438] = ea9ec5ea, %asi = 80
	stba	%l3,[%i2+0x038]%asi	! Mem[0000000010081438] = 249ec5ea
!	%l2 = 0000000000005538, Mem[0000000030101408] = d634d724303198cb
	stxa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000005538
!	%l4 = 3f1f4728, %l5 = 14c0b226, Mem[0000000030001408] = 72b44550 1f369552
	stda	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 3f1f4728 14c0b226
!	%l6 = 000000003a7f0b6e, Mem[0000000030041410] = 6847651808926351
	stxa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000003a7f0b6e
!	%f6  = ff3198cb 00000061, %l4 = 000000003f1f4728
!	Mem[0000000010101418] = afbf4c43e04b8abb
	add	%i4,0x018,%g1
	stda	%f6,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010101418] = afbf4c43e04b31ff
!	%l2 = 0000000000005538, Mem[0000000021800140] = 2873e548
	sth	%l2,[%o3+0x140]		! Mem[0000000021800140] = 5538e548
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = bcc7e22a, %l0 = 000000000000717a
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = ffffffffffffbcc7

p0_label_13:
!	Mem[0000000010001408] = 000000c5, %l7 = 00000000ffa6c4bb
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000c5
!	Mem[0000000010181408] = cb9831ff, %f16 = 00000000
	lda	[%i6+%o4]0x88,%f16	! %f16 = cb9831ff
!	Mem[0000000010181410] = cd57317c, %l4 = 000000003f1f4728
	lduha	[%i6+%o5]0x88,%l4	! %l4 = 000000000000317c
!	Mem[0000000010001438] = bad062da, %l4 = 000000000000317c
	lduha	[%i0+0x038]%asi,%l4	! %l4 = 000000000000bad0
	membar	#Sync			! Added by membar checker (1)
!	Mem[00000000100c1400] = 91805266 15bd4a8a 721c8243 47680000
!	Mem[00000000100c1410] = 7a710000 721bbed2 003981d1 477af332
!	Mem[00000000100c1420] = bb8cf8b6 8b3cfe3a 19b359a4 e6038157
!	Mem[00000000100c1430] = 26959520 7847714a 5f5e9b13 ffa3d66e
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000030001400] = 682d60616fa6bf26, %f30 = cb9831ff 176bb887
	ldda	[%i0+%g0]0x89,%f30	! %f30 = 682d6061 6fa6bf26
!	Mem[0000000010041418] = c1821f24 2c4f74a5, %l0 = ffffbcc7, %l1 = d2be1b72
	ldd	[%i1+0x018],%l0		! %l0 = 00000000c1821f24 000000002c4f74a5
!	Mem[00000000100c1430] = 26959520 7847714a, %l6 = 3a7f0b6e, %l7 = 000000c5
	ldd	[%i3+0x030],%l6		! %l6 = 0000000026959520 000000007847714a
!	Mem[0000000010001408] = 00000000 000000c5, %l0 = c1821f24, %l1 = 2c4f74a5
	ldda	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000c5 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = 682d6061 6fa6bf26, %l1 = 0000000000000000
!	Mem[0000000030141410] = f02afca4377f2edd
	add	%i5,0x010,%g1
	stda	%f30,[%g1+%l1]ASI_PST8_S ! Mem[0000000030141410] = f02afca4377f2edd

p0_label_14:
!	%l4 = 0000bad0, %l5 = 14c0b226, Mem[0000000030001400] = 6fa6bf26 682d6061
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000bad0 14c0b226
!	%l4 = 0000bad0, %l5 = 14c0b226, Mem[0000000030041410] = 00000000 3a7f0b6e
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000bad0 14c0b226
!	Mem[0000000010181400] = 3f1f6cf9, %l7 = 000000007847714a
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 000000003f1f6cf9
!	Mem[00000000300c1408] = 3df1dedd, %l0 = 00000000000000c5
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 000000003df1dedd
!	%f28 = ffab3855 721c8243, Mem[0000000030181408] = 6e0b7f3a 39d135b5
	stda	%f28,[%i6+%o4]0x81	! Mem[0000000030181408] = ffab3855 721c8243
!	Mem[0000000030181408] = ffab3855, %l2 = 0000000000005538
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 00000000ffab3855
!	%l7 = 000000003f1f6cf9, Mem[0000000020800000] = ffca5a05, %asi = 80
	stha	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = 6cf95a05
!	%l7 = 000000003f1f6cf9, Mem[0000000010101404] = d2be1b72
	sth	%l7,[%i4+0x004]		! Mem[0000000010101404] = 6cf91b72
!	%l5 = 0000000014c0b226, Mem[0000000030101408] = 38550000
	stba	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 26550000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 4a714778565da7da, %f24 = 21ab3855 640041c6
	ldda	[%i6+%g0]0x80,%f24	! %f24 = 4a714778 565da7da

p0_label_15:
!	Mem[0000000030181400] = 472ac0dc, %l7 = 000000003f1f6cf9
	ldsba	[%i6+%g0]0x89,%l7	! %l7 = ffffffffffffffdc
!	Mem[0000000010081400] = 4d1dcea3, %l2 = 00000000ffab3855
	lduha	[%i2+%g0]0x88,%l2	! %l2 = 000000000000cea3
!	Mem[0000000030141400] = 3d04de1c, %l5 = 0000000014c0b226
	ldsha	[%i5+%g0]0x89,%l5	! %l5 = ffffffffffffde1c
!	Mem[0000000010081410] = f3e1f5617c315772, %f18 = 4c6e2360 5045b4ac
	ldda	[%i2+%o5]0x88,%f18	! %f18 = f3e1f561 7c315772
!	Mem[00000000300c1410] = 59d5d64298526bf0, %l2 = 000000000000cea3
	ldxa	[%i3+%o5]0x89,%l2	! %l2 = 59d5d64298526bf0
!	Mem[0000000030041408] = 5538ab21, %l6 = 0000000026959520
	ldsha	[%i1+%o4]0x81,%l6	! %l6 = 0000000000005538
!	Mem[0000000010041438] = 4791ccb6, %l5 = ffffffffffffde1c
	lduba	[%i1+0x039]%asi,%l5	! %l5 = 0000000000000091
!	Mem[0000000010101410] = 76a25b1c, %l2 = 59d5d64298526bf0
	lduwa	[%i4+%o5]0x80,%l2	! %l2 = 0000000076a25b1c
!	Mem[0000000010101408] = 2478b2cadba80498, %l5 = 0000000000000091
	ldxa	[%i4+%o4]0x80,%l5	! %l5 = 2478b2cadba80498
!	Starting 10 instruction Store Burst
!	%l2 = 0000000076a25b1c, Mem[00000000300c1410] = 59d5d64298526bf0
	stxa	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000076a25b1c

p0_label_16:
!	%l7 = ffffffffffffffdc, Mem[0000000020800000] = 6cf95a05
	stb	%l7,[%o1+%g0]		! Mem[0000000020800000] = dcf95a05
!	%f16 = cb9831ff 777f6acc, %l6 = 0000000000005538
!	Mem[0000000010041420] = 258da68d8c559f5c
	add	%i1,0x020,%g1
	stda	%f16,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010041420] = 258da68d8c5598cb
!	%f31 = 6fa6bf26, Mem[0000000010001408] = 000000c5
	sta	%f31,[%i0+%o4]0x88	! Mem[0000000010001408] = 6fa6bf26
!	Mem[0000000010041408] = 2f000000, %l3 = 00000000cab27824
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 0000002f000000ff
!	%l2 = 0000000076a25b1c, Mem[0000000010181408] = 61000000cb9831ff
	stxa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000076a25b1c
!	%l4 = 000000000000bad0, Mem[0000000010101408] = 2478b2ca, %asi = 80
	stwa	%l4,[%i4+0x008]%asi	! Mem[0000000010101408] = 0000bad0
!	Mem[0000000030081410] = 7e2098f3, %l2 = 0000000076a25b1c
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 000000007e2098f3
!	Mem[0000000010041408] = 000000ff, %l1 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%f26 = a69efaf6 39fc283b, %l7 = ffffffffffffffdc
!	Mem[0000000010101430] = 190d7dd85f466c90
	add	%i4,0x030,%g1
	stda	%f26,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010101430] = 190d7dd85f466c90
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 6fa6bf26, %l1 = 00000000000000ff
	lduwa	[%i0+%o4]0x88,%l1	! %l1 = 000000006fa6bf26

p0_label_17:
!	Mem[000000001014142c] = 9efa5dd9, %l3 = 000000000000002f
	ldsha	[%i5+0x02e]%asi,%l3	! %l3 = 0000000000005dd9
!	Mem[0000000010081428] = 239ff9aa ac026253, %l4 = 0000bad0, %l5 = dba80498
	ldda	[%i2+0x028]%asi,%l4	! %l4 = 00000000239ff9aa 00000000ac026253
!	Mem[0000000030181400] = dcc02a47 210acd61, %l6 = 00005538, %l7 = ffffffdc
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 00000000dcc02a47 00000000210acd61
!	Mem[00000000300c1410] = 1c5ba276 00000000, %l2 = 7e2098f3, %l3 = 00005dd9
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 000000001c5ba276 0000000000000000
!	Mem[0000000030141410] = dd2e7f37a4fc2af0, %l7 = 00000000210acd61
	ldxa	[%i5+%o5]0x89,%l7	! %l7 = dd2e7f37a4fc2af0
!	Mem[0000000010001400] = ffa6c4bb, %l7 = dd2e7f37a4fc2af0
	ldswa	[%i0+0x000]%asi,%l7	! %l7 = ffffffffffa6c4bb
!	Mem[00000000100c1400] = 66528091, %l3 = 0000000000000000
	lduha	[%i3+%g0]0x88,%l3	! %l3 = 0000000000008091
!	Mem[0000000010181400] = 7847714a, %l1 = 000000006fa6bf26
	lduba	[%i6+%g0]0x88,%l1	! %l1 = 000000000000004a
!	Mem[0000000010001400] = ffa6c4bb, %l0 = 000000003df1dedd
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = ffffffffffffffa6
!	Starting 10 instruction Store Burst
!	%l6 = 00000000dcc02a47, Mem[00000000201c0000] = 24944c16
	stb	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 47944c16

p0_label_18:
!	Mem[0000000030041410] = 0000bad0, %l7 = ffffffffffa6c4bb
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030101410] = 00000021
	stha	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000021
!	Mem[0000000010181410] = cd57317c, %l4 = 00000000239ff9aa
	swapa	[%i6+%o5]0x88,%l4	! %l4 = 00000000cd57317c
!	%l7 = 0000000000000000, Mem[0000000030081410] = 1c5ba276
	stba	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 1c5ba200
!	%l3 = 0000000000008091, Mem[000000001000142e] = 2c089fa1, %asi = 80
	stha	%l3,[%i0+0x02e]%asi	! Mem[000000001000142c] = 2c088091
!	%l4 = 00000000cd57317c, Mem[00000000201c0001] = 47944c16, %asi = 80
	stba	%l4,[%o0+0x001]%asi	! Mem[00000000201c0000] = 477c4c16
!	Mem[0000000030101410] = 00000021, %l6 = 00000000dcc02a47
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000021
!	%l0 = ffffffffffffffa6, Mem[0000000010041408] = 00000000
	stba	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000a6
!	%f10 = 19b359a4, Mem[0000000010041400] = 39fc283b
	sta	%f10,[%i1+%g0]0x88	! Mem[0000000010041400] = 19b359a4
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 26bfa66f, %l1 = 000000000000004a
	ldsha	[%i0+0x00a]%asi,%l1	! %l1 = ffffffffffffa66f

p0_label_19:
!	Mem[000000001010142c] = 62051537, %l4 = 00000000cd57317c
	ldsh	[%i4+0x02e],%l4		! %l4 = 0000000000001537
!	Mem[0000000030001408] = 3f1f4728, %l5 = 00000000ac026253
	lduwa	[%i0+%o4]0x81,%l5	! %l5 = 000000003f1f4728
!	Mem[0000000030181400] = 472ac0dc, %l7 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l7	! %l7 = ffffffffffffc0dc
!	Mem[0000000010001414] = 5cb2437d, %l0 = ffffffffffffffa6
	ldsba	[%i0+0x015]%asi,%l0	! %l0 = ffffffffffffffb2
!	Mem[0000000030101408] = 0000000000005526, %l7 = ffffffffffffc0dc
	ldxa	[%i4+%o4]0x89,%l7	! %l7 = 0000000000005526
!	Mem[0000000010081418] = c21fd5b9, %l7 = 0000000000005526
	lduwa	[%i2+0x018]%asi,%l7	! %l7 = 00000000c21fd5b9
!	Mem[00000000100c1408] = 43821c72, %f5  = 721bbed2
	lda	[%i3+%o4]0x88,%f5 	! %f5 = 43821c72
!	Mem[0000000010081400] = 4d1dcea3, %l5 = 000000003f1f4728
	ldswa	[%i2+%g0]0x88,%l5	! %l5 = 000000004d1dcea3
!	Mem[0000000030041410] = ff00bad0, %f29 = 721c8243
	lda	[%i1+%o5]0x81,%f29	! %f29 = ff00bad0
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = 477c4c16, %l1 = ffffffffffffa66f
	ldstub	[%o0+%g0],%l1		! %l1 = 00000047000000ff

p0_label_20:
	membar	#Sync			! Added by membar checker (2)
!	%l0 = ffffffffffffffb2, Mem[00000000100c143a] = 5f5e9b13
	stb	%l0,[%i3+0x03a]		! Mem[00000000100c1438] = 5f5eb213
!	%l0 = ffffffb2, %l1 = 00000047, Mem[0000000030001408] = 28471f3f 26b2c014
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffb2 00000047
!	Mem[0000000030041400] = 6889dceb, %l5 = 000000004d1dcea3
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 000000006889dceb
!	Mem[0000000010001430] = e114fa68, %l2 = 000000001c5ba276, %asi = 80
	swapa	[%i0+0x030]%asi,%l2	! %l2 = 00000000e114fa68
!	%l0 = ffffffffffffffb2, Mem[00000000300c1400] = f8d6dbdc
	stwa	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffb2
!	Mem[0000000010141400] = 55382478, %l0 = ffffffffffffffb2
	ldstuba	[%i5+%g0]0x88,%l0	! %l0 = 00000078000000ff
!	%l5 = 000000006889dceb, Mem[00000000300c1400] = e36581e9ffffffb2
	stxa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000006889dceb
!	%l6 = 00000021, %l7 = c21fd5b9, Mem[00000000300c1400] = 6889dceb 00000000
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000021 c21fd5b9
!	%l2 = e114fa68, %l3 = 00008091, Mem[0000000010041410] = c9a52fbd 4c3108f6
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = e114fa68 00008091
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = b1d60064, %l7 = 00000000c21fd5b9
	ldsba	[%i2+%o4]0x81,%l7	! %l7 = ffffffffffffffb1

p0_label_21:
!	Mem[0000000010081430] = 000000006e0b7f3a, %l0 = 0000000000000078
	ldx	[%i2+0x030],%l0		! %l0 = 000000006e0b7f3a
!	Mem[000000001014141c] = bc71357b, %l6 = 0000000000000021
	lduwa	[%i5+0x01c]%asi,%l6	! %l6 = 00000000bc71357b
!	Mem[000000001004140c] = cab27824, %l0 = 000000006e0b7f3a
	lduba	[%i1+0x00d]%asi,%l0	! %l0 = 00000000000000b2
!	Mem[0000000010101400] = 425012ff, %f12 = 26959520
	lda	[%i4+%g0]0x88,%f12	! %f12 = 425012ff
!	Mem[0000000010081410] = f3e1f561 7c315772, %l0 = 000000b2, %l1 = 00000047
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 000000007c315772 00000000f3e1f561
!	Mem[0000000010181408] = 1c5ba276, %l7 = ffffffffffffffb1
	lduha	[%i6+%o4]0x80,%l7	! %l7 = 0000000000001c5b
!	Mem[0000000010141410] = 1744e424, %l6 = 00000000bc71357b
	ldswa	[%i5+%o5]0x88,%l6	! %l6 = 000000001744e424
!	Mem[0000000030141400] = 1cde043d, %l6 = 000000001744e424
	lduba	[%i5+%g0]0x81,%l6	! %l6 = 000000000000001c
!	Mem[0000000010081430] = 000000006e0b7f3a, %l4 = 0000000000001537
	ldx	[%i2+0x030],%l4		! %l4 = 000000006e0b7f3a
!	Starting 10 instruction Store Burst
!	%f6  = 003981d1, Mem[0000000030081400] = 7e00701d
	sta	%f6 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 003981d1

p0_label_22:
!	Mem[000000001010141c] = e04b31ff, %l5 = 000000006889dceb
	swap	[%i4+0x01c],%l5		! %l5 = 00000000e04b31ff
!	Mem[000000001008142c] = ac026253, %l4 = 000000006e0b7f3a
	swap	[%i2+0x02c],%l4		! %l4 = 00000000ac026253
!	%l0 = 7c315772, %l1 = f3e1f561, Mem[0000000030141408] = a60a6cf5 2a06a4d9
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 7c315772 f3e1f561
!	%l0 = 000000007c315772, Mem[0000000010181408] = 1c5ba27600000000
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000007c315772
!	%l0 = 7c315772, %l1 = f3e1f561, Mem[00000000100c1410] = 7a710000 721bbed2
	stda	%l0,[%i3+0x010]%asi	! Mem[00000000100c1410] = 7c315772 f3e1f561
!	Mem[0000000010181412] = aaf99f23, %l4 = 00000000ac026253
	ldstub	[%i6+0x012],%l4		! %l4 = 0000009f000000ff
!	%l6 = 000000000000001c, Mem[0000000030101408] = 26550000
	stwa	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000001c
!	Mem[0000000010101408] = d0ba0000, %l3 = 0000000000008091
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 00000000d0ba0000
!	%l0 = 7c315772, %l1 = f3e1f561, Mem[0000000010041400] = a459b319 d0f61b82
	stda	%l0,[%i1+0x000]%asi	! Mem[0000000010041400] = 7c315772 f3e1f561
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 05aad2661c5ba200, %f12 = 425012ff 7847714a
	ldda	[%i2+%o5]0x89,%f12	! %f12 = 05aad266 1c5ba200

p0_label_23:
!	Mem[0000000030181408] = 00005538721c8243, %f26 = a69efaf6 39fc283b
	ldda	[%i6+%o4]0x81,%f26	! %f26 = 00005538 721c8243
!	Mem[0000000030101408] = 1c000000, %f19 = 7c315772
	lda	[%i4+%o4]0x89,%f19	! %f19 = 1c000000
!	Mem[0000000010141400] = ff243855, %l1 = 00000000f3e1f561
	lduh	[%i5+%g0],%l1		! %l1 = 000000000000ff24
!	Mem[00000000300c1400] = c21fd5b900000021, %l7 = 0000000000001c5b
	ldxa	[%i3+%g0]0x89,%l7	! %l7 = c21fd5b900000021
!	Mem[00000000300c1408] = c5000000, %l0 = 000000007c315772
	lduwa	[%i3+%o4]0x81,%l0	! %l0 = 00000000c5000000
!	Mem[0000000010141410] = 74ce53e81744e424, %l5 = 00000000e04b31ff
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = 74ce53e81744e424
!	Mem[0000000010041408] = 000000a6, %l7 = c21fd5b900000021
	lduba	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000a6
!	Mem[0000000010001400] = 0e7157cfbbc4a6ff, %l2 = 00000000e114fa68
	ldxa	[%i0+%g0]0x88,%l2	! %l2 = 0e7157cfbbc4a6ff
!	Mem[00000000300c1400] = c21fd5b900000021, %f22 = 26e57ecc fa192923
	ldda	[%i3+%g0]0x89,%f22	! %f22 = c21fd5b9 00000021
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000009f, Mem[0000000010001408] = 26bfa66f
	stba	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 9fbfa66f

p0_label_24:
!	Mem[0000000010101400] = 425012ff, %l0 = 00000000c5000000
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000021800181] = 5db8ca0d, %l2 = 0e7157cfbbc4a6ff
	ldstuba	[%o3+0x181]%asi,%l2	! %l2 = 000000b8000000ff
!	%l4 = 000000000000009f, Mem[0000000021800140] = 5538e548, %asi = 80
	stba	%l4,[%o3+0x140]%asi	! Mem[0000000021800140] = 9f38e548
!	%l6 = 000000000000001c, Mem[0000000030141408] = f3e1f5617c315772
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000000000001c
!	%l4 = 0000009f, %l5 = 1744e424, Mem[0000000010001408] = 9fbfa66f 00000000
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000009f 1744e424
!	Mem[000000001018142c] = cc7e6d15, %l5 = 74ce53e81744e424
	ldswa	[%i6+0x02c]%asi,%l5	! %l5 = ffffffffcc7e6d15
!	%f18 = f3e1f561 1c000000, %l2 = 00000000000000b8
!	Mem[0000000010001410] = 1bf85f925cb2437d
	add	%i0,0x010,%g1
	stda	%f18,[%g1+%l2]ASI_PST16_P ! Mem[0000000010001410] = f3e15f925cb2437d
!	%f14 = 5f5e9b13, Mem[0000000010141410] = 24e44417
	sta	%f14,[%i5+%o5]0x80	! Mem[0000000010141410] = 5f5e9b13
!	Mem[0000000030101408] = 1c000000, %l3 = 00000000d0ba0000
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 000000001c000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041404] = f3e1f561, %l7 = 00000000000000a6
	ldsb	[%i1+0x005],%l7		! %l7 = ffffffffffffffe1

p0_label_25:
!	Mem[0000000030181400] = dcc02a47, %l0 = 00000000000000ff
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = ffffffffffffffdc
!	Mem[0000000010141408] = 0000717a, %l7 = ffffffffffffffe1
	ldswa	[%i5+%o4]0x80,%l7	! %l7 = 000000000000717a
!	Mem[0000000030001400] = 0000bad0, %l1 = 000000000000ff24
	ldswa	[%i0+%g0]0x89,%l1	! %l1 = 000000000000bad0
!	Mem[0000000030001408] = ffffffb2, %l3 = 000000001c000000
	ldsha	[%i0+%o4]0x89,%l3	! %l3 = ffffffffffffffb2
!	Mem[0000000010141408] = 0000717a d2be1b72, %l6 = 0000001c, %l7 = 0000717a
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 000000000000717a 00000000d2be1b72
!	Mem[00000000300c1410] = 1c5ba276, %l1 = 000000000000bad0
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = 0000000000001c5b
!	Mem[0000000030041400] = a3ce1d4d, %l5 = ffffffffcc7e6d15
	lduwa	[%i1+%g0]0x89,%l5	! %l5 = 00000000a3ce1d4d
!	Mem[0000000010041400] = 7c315772, %f4  = 7a710000
	lda	[%i1+%g0]0x80,%f4 	! %f4 = 7c315772
!	Mem[0000000030101410] = 472ac0dc, %l5 = 00000000a3ce1d4d
	lduba	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000dc
!	Starting 10 instruction Store Burst
!	%f12 = 05aad266 1c5ba200, Mem[0000000030181408] = 38550000 43821c72
	stda	%f12,[%i6+%o4]0x89	! Mem[0000000030181408] = 05aad266 1c5ba200

p0_label_26:
!	%l7 = 00000000d2be1b72, Mem[000000001010142f] = 62051537, %asi = 80
	stba	%l7,[%i4+0x02f]%asi	! Mem[000000001010142c] = 62051572
!	%f10 = 19b359a4, Mem[0000000030001408] = b2ffffff
	sta	%f10,[%i0+%o4]0x81	! Mem[0000000030001408] = 19b359a4
!	%l7 = 00000000d2be1b72, Mem[0000000030141408] = 000000000000001c
	stxa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000d2be1b72
!	Mem[00000000211c0000] = 2cff6986, %l7 = 00000000d2be1b72
	ldstub	[%o2+%g0],%l7		! %l7 = 0000002c000000ff
!	Mem[0000000030001408] = 19b359a4, %l5 = 00000000000000dc
	swapa	[%i0+%o4]0x81,%l5	! %l5 = 0000000019b359a4
!	Mem[0000000020800001] = dcf95a05, %l5 = 0000000019b359a4
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 000000f9000000ff
!	%f2  = 721c8243, Mem[00000000100c141c] = 477af332
	sta	%f2 ,[%i3+0x01c]%asi	! Mem[00000000100c141c] = 721c8243
!	%l4 = 000000000000009f, Mem[00000000100c1408] = 721c824347680000
	stx	%l4,[%i3+%o4]		! Mem[00000000100c1408] = 000000000000009f
!	%l6 = 000000000000717a, Mem[0000000030041410] = d0ba00ff
	stwa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000717a
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = e114fa68, %l2 = 00000000000000b8
	ldsba	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000068

p0_label_27:
!	Mem[0000000030141410] = a4fc2af0, %l1 = 0000000000001c5b
	lduba	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000f0
!	Mem[0000000010081410] = 7257317c, %l2 = 0000000000000068
	lduba	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000072
!	Mem[0000000010181408] = 00000000, %l5 = 00000000000000f9
	ldsha	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = 1c5ba200, %l4 = 000000000000009f
	lduwa	[%i2+%o5]0x89,%l4	! %l4 = 000000001c5ba200
!	Mem[0000000030181400] = dcc02a47210acd61, %l0 = ffffffffffffffdc
	ldxa	[%i6+%g0]0x81,%l0	! %l0 = dcc02a47210acd61
!	Mem[0000000010181400] = 7847714a, %l1 = 00000000000000f0
	ldsba	[%i6+%g0]0x88,%l1	! %l1 = 000000000000004a
!	Mem[0000000010041400] = 7257317c, %l2 = 0000000000000072
	lduba	[%i1+%g0]0x88,%l2	! %l2 = 000000000000007c
!	Mem[0000000010001400] = ffa6c4bb, %l6 = 000000000000717a
	ldswa	[%i0+0x000]%asi,%l6	! %l6 = ffffffffffa6c4bb
!	Mem[0000000010101424] = c443b9a4, %l4 = 000000001c5ba200
	ldswa	[%i4+0x024]%asi,%l4	! %l4 = ffffffffc443b9a4
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000002c, Mem[0000000010101408] = 91800000
	stw	%l7,[%i4+%o4]		! Mem[0000000010101408] = 0000002c

p0_label_28:
!	%l4 = c443b9a4, %l5 = 00000000, Mem[00000000100c1400] = 66528091 8a4abd15
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = c443b9a4 00000000
!	%l2 = 000000000000007c, Mem[0000000010181408] = 00000000
	stwa	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000007c
!	Mem[0000000010001400] = bbc4a6ff, %l3 = ffffffffffffffb2
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 00000000bbc4a6ff
!	Mem[0000000010101408] = 0000002c, %l3 = 00000000bbc4a6ff
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181416] = cf0722f3, %l2 = 000000000000007c
	ldstuba	[%i6+0x016]%asi,%l2	! %l2 = 00000022000000ff
!	%l3 = 0000000000000000, Mem[00000000201c0000] = ff7c4c16, %asi = 80
	stba	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 007c4c16
!	%l2 = 0000000000000022, Mem[00000000300c1400] = 00000021
	stba	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000022
!	Mem[0000000010081438] = 249ec5eabaecbc6e, %l4 = ffffffffc443b9a4, %l4 = ffffffffc443b9a4
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l4,%l4	! %l4 = 249ec5eabaecbc6e
!	Mem[0000000010081438] = 249ec5ea, %l5 = 00000000, %l0 = 210acd61
	add	%i2,0x38,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 00000000249ec5ea
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000030101400] = 61000000 00000000 0000bad0 00000000
!	Mem[0000000030101410] = dcc02a47 ffa6c4bb d0fdec68 8bde857b
!	Mem[0000000030101420] = caba3b13 3ac60ea0 488fdd58 e8080f6c
!	Mem[0000000030101430] = 2a76800a 89361fca 8d8f53b0 a62b4ec4
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400

p0_label_29:
!	Mem[00000000100c1438] = 5f5eb213, %l6 = ffffffffffa6c4bb
	ldsw	[%i3+0x038],%l6		! %l6 = 000000005f5eb213
!	Mem[0000000010181400] = 7847714a, %l0 = 00000000249ec5ea
	lduha	[%i6+%g0]0x88,%l0	! %l0 = 000000000000714a
!	Mem[00000000300c1408] = 000000c5, %l6 = 000000005f5eb213
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000c5
!	Mem[0000000010141408] = 0000717a, %l6 = 00000000000000c5
	ldsha	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = 520c5628, %l5 = 0000000000000000
	lduha	[%i6+%o5]0x89,%l5	! %l5 = 0000000000005628
!	Mem[00000000100c1400] = 00000000c443b9a4, %l1 = 000000000000004a
	ldxa	[%i3+%g0]0x88,%l1	! %l1 = 00000000c443b9a4
!	Mem[0000000010041408] = 000000a6, %l3 = 0000000000000000
	lduba	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000a6
!	Mem[00000000100c1410] = 7257317c, %l7 = 000000000000002c
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 000000000000317c
!	Mem[0000000010001400] = b2ffffff, %l7 = 000000000000317c
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000b2ffffff
!	Starting 10 instruction Store Burst
!	%l4 = baecbc6e, %l5 = 00005628, Mem[0000000030181410] = 28560c52 e3287b27
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = baecbc6e 00005628

p0_label_30:
!	%f20 = 1bf85f92, Mem[0000000010101408] = ff00002c
	sta	%f20,[%i4+%o4]0x80	! Mem[0000000010101408] = 1bf85f92
!	Mem[0000000010041410] = e114fa68, %l6 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 00000000e114fa68
!	Mem[0000000010101434] = 5f466c90, %l1 = 00000000c443b9a4
	swap	[%i4+0x034],%l1		! %l1 = 000000005f466c90
!	%l2 = 0000000000000022, Mem[0000000010101400] = ff1250426cf91b72
	stxa	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000000022
!	%l6 = 00000000e114fa68, Mem[0000000030041400] = a3ce1d4d
	stba	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = a3ce1d68
!	%f16 = cb9831ff 777f6acc f3e1f561 1c000000
!	%f20 = 1bf85f92 5cb2437d c21fd5b9 00000021
!	%f24 = 4a714778 565da7da 00005538 721c8243
!	%f28 = ffab3855 ff00bad0 682d6061 6fa6bf26
	stda	%f16,[%i3]ASI_BLK_AIUSL	! Block Store to 00000000300c1400
!	%l6 = 00000000e114fa68, Mem[00000000100c1410] = 7c315772f3e1f561
	stx	%l6,[%i3+%o5]		! Mem[00000000100c1410] = 00000000e114fa68
!	Mem[0000000010001400] = 7c310000, %l7 = 00000000b2ffffff
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 000000007c310000
!	Mem[0000000010081407] = c013d703, %l0 = 000000000000714a
	ldstub	[%i2+0x007],%l0		! %l0 = 00000003000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = dd2e7f37a4fc2af0, %f4  = dcc02a47 ffa6c4bb
	ldda	[%i5+%o5]0x89,%f4 	! %f4  = dd2e7f37 a4fc2af0

p0_label_31:
!	Mem[0000000010141420] = 00002856, %l3 = 00000000000000a6
	ldub	[%i5+0x021],%l3		! %l3 = 0000000000000000
!	Mem[0000000010081400] = a3ce1d4dc013d7ff, %l4 = 249ec5eabaecbc6e
	ldxa	[%i2+%g0]0x80,%l4	! %l4 = a3ce1d4dc013d7ff
!	Mem[0000000030101410] = 472ac0dc, %l2 = 0000000000000022
	lduwa	[%i4+%o5]0x89,%l2	! %l2 = 00000000472ac0dc
!	Mem[0000000010141410] = 5f5e9b13, %l5 = 0000000000005628
	lduwa	[%i5+%o5]0x80,%l5	! %l5 = 000000005f5e9b13
!	Mem[0000000030081400] = 003981d1 92a2c4eb, %l2 = 472ac0dc, %l3 = 00000000
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000003981d1 0000000092a2c4eb
	membar	#Sync			! Added by membar checker (4)
!	Mem[00000000100c1410] = 00000000, %l1 = 000000005f466c90
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 0000001c, %l6 = 00000000e114fa68
	lduha	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 7c000000, %l4 = a3ce1d4dc013d7ff
	ldsha	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001014143c] = 9f339182, %l5 = 000000005f5e9b13
	lduba	[%i5+0x03e]%asi,%l5	! %l5 = 0000000000000091
!	Starting 10 instruction Store Burst
!	%f14 = 8d8f53b0 a62b4ec4, Mem[0000000010181438] = 1788c5ee 5ea30b43
	stda	%f14,[%i6+0x038]%asi	! Mem[0000000010181438] = 8d8f53b0 a62b4ec4

p0_label_32:
!	Mem[00000000100c142e] = e6038157, %l0 = 0000000000000003
	ldstuba	[%i3+0x02e]%asi,%l0	! %l0 = 00000081000000ff
!	%l2 = 003981d1, %l3 = 92a2c4eb, Mem[0000000010001420] = 335d699b 17cc87b7
	stda	%l2,[%i0+0x020]%asi	! Mem[0000000010001420] = 003981d1 92a2c4eb
!	%l5 = 0000000000000091, Mem[00000000100c1410] = 00000000
	stw	%l5,[%i3+%o5]		! Mem[00000000100c1410] = 00000091
!	%l3 = 0000000092a2c4eb, Mem[0000000030041408] = 5538ab21
	stba	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = eb38ab21
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000091
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[000000001004140c] = cab27824, %l0 = 0000000000000081, %asi = 80
	swapa	[%i1+0x00c]%asi,%l0	! %l0 = 00000000cab27824
!	%f4  = dd2e7f37 a4fc2af0, Mem[0000000030001410] = 268f717a d4c22229
	stda	%f4 ,[%i0+%o5]0x89	! Mem[0000000030001410] = dd2e7f37 a4fc2af0
!	Mem[0000000010041408] = 000000a6, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 000000a6000000ff
!	%l3 = 0000000092a2c4eb, Mem[0000000030101408] = d0ba0000
	stba	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = d0ba00eb
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000000dc, %l0 = 00000000cab27824
	ldsba	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_33:
!	Mem[0000000030181400] = 472ac0dc, %f17 = 777f6acc
	lda	[%i6+%g0]0x89,%f17	! %f17 = 472ac0dc
!	Mem[0000000010001410] = 925fe1f3, %l6 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l6	! %l6 = 00000000925fe1f3
!	Mem[0000000030081400] = d1813900, %l0 = 0000000000000000
	lduwa	[%i2+%g0]0x89,%l0	! %l0 = 00000000d1813900
!	Mem[0000000010041408] = ff000000, %l6 = 00000000925fe1f3
	lduha	[%i1+0x00a]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = 6ebcecba, %l2 = 00000000003981d1
	ldsha	[%i6+%o5]0x89,%l2	! %l2 = ffffffffffffecba
!	Mem[0000000010181418] = da00b270, %l4 = 0000000000000000
	lduha	[%i6+0x01a]%asi,%l4	! %l4 = 000000000000b270
!	Mem[0000000010181430] = 3266d851138ecbae, %f8  = caba3b13 3ac60ea0
	ldda	[%i6+0x030]%asi,%f8 	! %f8  = 3266d851 138ecbae
!	Mem[000000001008141c] = e531402f, %l1 = 00000000000000a6
	lduha	[%i2+0x01c]%asi,%l1	! %l1 = 000000000000e531
!	Mem[0000000010101408] = 925ff81b, %l7 = 000000007c310000
	lduha	[%i4+%o4]0x88,%l7	! %l7 = 000000000000f81b
!	Starting 10 instruction Store Burst
!	%f30 = 682d6061, Mem[00000000300c1410] = 7d43b25c
	sta	%f30,[%i3+%o5]0x81	! Mem[00000000300c1410] = 682d6061

p0_label_34:
!	%l2 = ffffffffffffecba, Mem[0000000030181410] = baecbc6e
	stba	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = baecbc6e
!	%f22 = c21fd5b9 00000021, Mem[0000000030181410] = 6ebcecba 28560000
	stda	%f22,[%i6+%o5]0x89	! Mem[0000000030181410] = c21fd5b9 00000021
!	%l4 = 0000b270, %l5 = 00000000, Mem[0000000030001408] = dc000000 00000047
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000b270 00000000
!	%f10 = 488fdd58 e8080f6c, Mem[0000000030141408] = 721bbed2 00000000
	stda	%f10,[%i5+%o4]0x81	! Mem[0000000030141408] = 488fdd58 e8080f6c
!	%l1 = 000000000000e531, Mem[00000000300c1410] = 682d6061
	stwa	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000e531
!	%l0 = 00000000d1813900, Mem[0000000030181408] = 1c5ba200
	stha	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 1c5b3900
!	Mem[0000000030041400] = a3ce1d68, %l2 = ffffffffffffecba
	swapa	[%i1+%g0]0x89,%l2	! %l2 = 00000000a3ce1d68
!	Mem[0000000010041410] = 00000000, %l7 = 000000000000f81b
	ldstuba	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010081408] = 26b2c014
	stha	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 26b20000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101414] = 4bf7ed64, %l5 = 0000000000000000
	lduha	[%i4+0x016]%asi,%l5	! %l5 = 000000000000ed64

p0_label_35:
!	Mem[0000000010181410] = aaf9ff23, %l0 = 00000000d1813900
	lduwa	[%i6+%o5]0x80,%l0	! %l0 = 00000000aaf9ff23
!	Mem[0000000030181408] = 00395b1c66d2aa05, %f24 = 4a714778 565da7da
	ldda	[%i6+%o4]0x81,%f24	! %f24 = 00395b1c 66d2aa05
!	Mem[0000000010041408] = 81000000 000000ff, %l0 = aaf9ff23, %l1 = 0000e531
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff 0000000081000000
!	Mem[0000000010041408] = 000000ff, %f23 = 00000021
	lda	[%i1+%o4]0x88,%f23	! %f23 = 000000ff
!	Mem[0000000030141408] = 488fdd58, %l5 = 000000000000ed64
	lduha	[%i5+%o4]0x81,%l5	! %l5 = 000000000000488f
!	Mem[0000000010001410] = f3e15f92, %l2 = 00000000a3ce1d68
	ldsba	[%i0+%o5]0x80,%l2	! %l2 = fffffffffffffff3
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000030001400] = d0ba0000 26b2c014 70b20000 00000000
!	Mem[0000000030001410] = f02afca4 377f2edd 4e4e5160 9aec8665
!	Mem[0000000030001420] = 1d3aae13 76da8471 ee098e86 8770a023
!	Mem[0000000030001430] = 6d39ecd7 e6c2e4dd 08b82755 4d942fe8
	ldda	[%i0]ASI_BLK_SL,%f0	! Block Load from 0000000030001400
!	Mem[0000000030101410] = dcc02a47, %l1 = 0000000081000000
	ldsha	[%i4+%o5]0x81,%l1	! %l1 = ffffffffffffdcc0
!	Mem[0000000021800100] = 979502e9, %l7 = 0000000000000000
	lduha	[%o3+0x100]%asi,%l7	! %l7 = 0000000000009795
!	Starting 10 instruction Store Burst
!	%f22 = c21fd5b9 000000ff, Mem[0000000010181408] = 7c000000 7257317c
	stda	%f22,[%i6+%o4]0x88	! Mem[0000000010181408] = c21fd5b9 000000ff

p0_label_36:
!	%l5 = 000000000000488f, Mem[0000000010081410] = 7257317c, %asi = 80
	stwa	%l5,[%i2+0x010]%asi	! Mem[0000000010081410] = 0000488f
!	%f24 = 00395b1c 66d2aa05, %l5 = 000000000000488f
!	Mem[0000000010001410] = f3e15f925cb2437d
	add	%i0,0x010,%g1
	stda	%f24,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010001410] = 05aad2665cb24300
!	%l0 = 000000ff, %l1 = ffffdcc0, Mem[00000000100c1400] = a4b943c4 00000000
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff ffffdcc0
!	Mem[00000000211c0000] = ffff6986, %l3 = 0000000092a2c4eb
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	%f22 = c21fd5b9 000000ff, Mem[0000000010081410] = 8f480000 f3e1f561
	stda	%f22,[%i2+%o5]0x88	! Mem[0000000010081410] = c21fd5b9 000000ff
!	%l7 = 0000000000009795, Mem[0000000010101400] = 00000000
	stha	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 97950000
!	%f22 = c21fd5b9 000000ff, %l3 = 00000000000000ff
!	Mem[0000000010181420] = 3c80cf37c4ea72a9
	add	%i6,0x020,%g1
	stda	%f22,[%g1+%l3]ASI_PST32_P ! Mem[0000000010181420] = c21fd5b9000000ff
!	%f30 = 682d6061 6fa6bf26, %l0 = 00000000000000ff
!	Mem[00000000100c1430] = 269595207847714a
	add	%i3,0x030,%g1
	stda	%f30,[%g1+%l0]ASI_PST16_PL ! Mem[00000000100c1430] = 26bfa66f61602d68
!	Mem[0000000010181410] = aaf9ff23cf07fff3, %l4 = 000000000000b270, %l7 = 0000000000009795
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = aaf9ff23cf07fff3
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000717ad2be1b72, %f30 = 682d6061 6fa6bf26
	ldda	[%i5+%o4]0x80,%f30	! %f30 = 0000717a d2be1b72

p0_label_37:
!	Mem[0000000010041420] = 258da68d8c5598cb, %f24 = 00395b1c 66d2aa05
	ldda	[%i1+0x020]%asi,%f24	! %f24 = 258da68d 8c5598cb
!	Mem[0000000030101400] = 00000061, %l1 = ffffffffffffdcc0
	lduwa	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000061
!	Mem[0000000010141408] = 7a710000, %l4 = 000000000000b270
	lduha	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181428] = 232919fa, %l6 = 0000000000000000
	ldsba	[%i6+0x02a]%asi,%l6	! %l6 = 0000000000000019
!	Mem[0000000010001408] = 0000009f 1744e424, %l4 = 00000000, %l5 = 0000488f
	ldda	[%i0+0x008]%asi,%l4	! %l4 = 000000000000009f 000000001744e424
!	Mem[0000000010041400] = 7c315772 f3e1f561, %l6 = 00000019, %l7 = cf07fff3
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 000000007c315772 00000000f3e1f561
!	Mem[0000000010001408] = 0000009f, %l2 = fffffffffffffff3
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 000000000000009f
!	Mem[00000000100c1420] = bb8cf8b68b3cfe3a, %l6 = 000000007c315772
	ldx	[%i3+0x020],%l6		! %l6 = bb8cf8b68b3cfe3a
!	Mem[0000000010041400] = 7257317c, %f28 = ffab3855
	lda	[%i1+%g0]0x88,%f28	! %f28 = 7257317c
!	Starting 10 instruction Store Burst
!	%l6 = bb8cf8b68b3cfe3a, Mem[0000000010101410] = 1c5ba276
	stwa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 8b3cfe3a

p0_label_38:
!	%f20 = 1bf85f92, Mem[0000000030101400] = 61000000
	sta	%f20,[%i4+%g0]0x81	! Mem[0000000030101400] = 1bf85f92
!	%l5 = 000000001744e424, Mem[0000000010141408] = 0000717a, %asi = 80
	stwa	%l5,[%i5+0x008]%asi	! Mem[0000000010141408] = 1744e424
!	%l5 = 000000001744e424, Mem[0000000010181410] = f3ff07cf23fff9aa
	stxa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000001744e424
!	%l4 = 000000000000009f, Mem[0000000010101400] = 97950000
	stwa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000009f
!	%f31 = d2be1b72, Mem[0000000010101418] = afbf4c43
	sta	%f31,[%i4+0x018]%asi	! Mem[0000000010101418] = d2be1b72
!	Mem[00000000100c1410] = 91000000, %l4 = 000000000000009f
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l6 = bb8cf8b68b3cfe3a, Mem[0000000010041408] = ff000000
	stwa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 8b3cfe3a
!	Mem[0000000010041430] = 156a04ab61c2e2b3, %l3 = 00000000000000ff, %l4 = 0000000000000000
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 156a04ab61c2e2b3
!	%f28 = 7257317c ff00bad0, Mem[0000000010001420] = 003981d1 92a2c4eb
	std	%f28,[%i0+0x020]	! Mem[0000000010001420] = 7257317c ff00bad0
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = bcc7e22a, %l0 = 00000000000000ff
	ldub	[%o1+0x041],%l0		! %l0 = 00000000000000c7

p0_label_39:
!	Mem[00000000300c1410] = 0000e531, %l3 = 00000000000000ff
	ldsha	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181428] = 232919fa, %f21 = 5cb2437d
	lda	[%i6+0x028]%asi,%f21	! %f21 = 232919fa
!	Mem[0000000030141410] = f02afca4377f2edd, %f30 = 0000717a d2be1b72
	ldda	[%i5+%o5]0x81,%f30	! %f30 = f02afca4 377f2edd
!	Mem[0000000010001400] = ffffffb2, %l6 = bb8cf8b68b3cfe3a
	lduba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081408] = 26b20000, %l3 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081420] = ac60e6af6e13e270, %l5 = 000000001744e424
	ldxa	[%i2+0x020]%asi,%l5	! %l5 = ac60e6af6e13e270
!	Mem[0000000010181430] = 3266d851 138ecbae, %l4 = 61c2e2b3, %l5 = 6e13e270
	ldda	[%i6+0x030]%asi,%l4	! %l4 = 000000003266d851 00000000138ecbae
!	Mem[00000000100c1410] = ff000091, %l3 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l3	! %l3 = 000000000000ff00
	membar	#Sync			! Added by membar checker (6)
!	Mem[00000000100c1400] = 000000ff ffffdcc0 ff000000 0000009f
!	Mem[00000000100c1410] = ff000091 e114fa68 003981d1 721c8243
!	Mem[00000000100c1420] = bb8cf8b6 8b3cfe3a 19b359a4 e603ff57
!	Mem[00000000100c1430] = 26bfa66f 61602d68 5f5eb213 ffa3d66e
	ldda	[%i3]ASI_BLK_PL,%f0	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	%l4 = 3266d851, %l5 = 138ecbae, Mem[0000000010101410] = 3afe3c8b 4bf7ed64
	stda	%l4,[%i4+0x010]%asi	! Mem[0000000010101410] = 3266d851 138ecbae

p0_label_40:
!	%l6 = 00000000000000ff, Mem[0000000030041400] = ffffecba
	stba	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffecff
!	Mem[0000000030101410] = dcc02a47, %l5 = 00000000138ecbae
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 00000000dcc02a47
!	Mem[0000000030001400] = 0000bad0, %l6 = 00000000000000ff
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 000000000000bad0
!	%l1 = 0000000000000061, Mem[0000000030141400] = 1cde043ddaadbfe4
	stxa	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000061
!	%l3 = 000000000000ff00, Mem[0000000030181410] = 00000021
	stha	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ff00
!	%l5 = 00000000dcc02a47, Mem[0000000030001410] = a4fc2af0
	stba	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = a4fc2a47
!	%l0 = 000000c7, %l1 = 00000061, Mem[0000000030101408] = d0ba00eb 00000000
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000c7 00000061
!	Mem[0000000010181410] = 24e44417, %l1 = 0000000000000061, %asi = 80
	swapa	[%i6+0x010]%asi,%l1	! %l1 = 0000000024e44417
!	%l4 = 000000003266d851, Mem[0000000030081410] = 1c5ba200
	stwa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 3266d851
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = daa75d56 7847714a, %l0 = 000000c7, %l1 = 24e44417
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 000000007847714a 00000000daa75d56

p0_label_41:
!	Mem[00000000211c0000] = ffff6986, %l4 = 000000003266d851
	lduh	[%o2+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000010101408] = 1bf85f92, %l3 = 000000000000ff00
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 000000000000001b
!	Mem[0000000010001408] = 0000009f1744e424, %l3 = 000000000000001b
	ldxa	[%i0+%o4]0x80,%l3	! %l3 = 0000009f1744e424
!	Mem[0000000010001410] = 05aad266, %l1 = 00000000daa75d56
	ldswa	[%i0+%o5]0x80,%l1	! %l1 = 0000000005aad266
!	Mem[0000000030181400] = dcc02a47, %l6 = 000000000000bad0
	lduwa	[%i6+%g0]0x81,%l6	! %l6 = 00000000dcc02a47
!	Mem[00000000201c0000] = 007c4c16, %l0 = 000000007847714a
	ldub	[%o0+%g0],%l0		! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000030181400] = dcc02a47 210acd61 00395b1c 66d2aa05
!	Mem[0000000030181410] = 00ff0000 b9d51fc2 f6113d3e 7905ea26
!	Mem[0000000030181420] = 6f273e24 f86a4d58 0a1dbb9b acfd61e7
!	Mem[0000000030181430] = 0f36a7ae 7fd1bbc9 cd54064d ec8e78c0
	ldda	[%i6]ASI_BLK_S,%f16	! Block Load from 0000000030181400
!	Mem[0000000010101410] = 3266d851 138ecbae, %l2 = 0000009f, %l3 = 1744e424
	ldda	[%i4+0x010]%asi,%l2	! %l2 = 000000003266d851 00000000138ecbae
!	Mem[0000000010041410] = 000000ff, %l3 = 00000000138ecbae
	lduha	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f2  = 9f000000 000000ff, %l0 = 0000000000000000
!	Mem[0000000030041400] = ffecfffffdc12fef
	stda	%f2,[%i1+%l0]ASI_PST16_SL ! Mem[0000000030041400] = ffecfffffdc12fef

p0_label_42:
!	%f4  = 68fa14e1 910000ff, Mem[0000000030101408] = 000000c7 00000061
	stda	%f4 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 68fa14e1 910000ff
!	%f14 = 6ed6a3ff 13b25e5f, Mem[0000000030081408] = b1d60064 5538b6ce
	stda	%f14,[%i2+%o4]0x81	! Mem[0000000030081408] = 6ed6a3ff 13b25e5f
!	Mem[000000001018140c] = b9d51fc2, %l2 = 3266d851, %l7 = f3e1f561
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 00000000b9d51fc2
!	Mem[0000000010181430] = 3266d851, %l4 = 000000000000ffff
	ldstub	[%i6+0x030],%l4		! %l4 = 00000032000000ff
!	%l4 = 0000000000000032, Mem[00000000201c0000] = 007c4c16, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 327c4c16
!	Mem[0000000010001410] = 05aad266, %l6 = 00000000dcc02a47
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 0000000005aad266
!	Mem[0000000010041408] = 8b3cfe3a, %l5 = 00000000dcc02a47
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 0000008b000000ff
!	%f5  = 910000ff, Mem[0000000010001410] = 472ac0dc
	sta	%f5 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 910000ff
!	%l2 = 3266d851, %l3 = 000000ff, Mem[0000000010141400] = 553824ff c6410064
	stda	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 3266d851 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = bbc4a6ff aecb8e13, %l6 = 05aad266, %l7 = b9d51fc2
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 00000000aecb8e13 00000000bbc4a6ff

p0_label_43:
!	Mem[00000000300c1408] = 0000001c, %l4 = 0000000000000032
	ldsha	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = 00395b1c66d2aa05, %f4  = 68fa14e1 910000ff
	ldda	[%i6+%o4]0x81,%f4 	! %f4  = 00395b1c 66d2aa05
!	Mem[0000000030081400] = 003981d192a2c4eb, %f2  = 9f000000 000000ff
	ldda	[%i2+%g0]0x81,%f2 	! %f2  = 003981d1 92a2c4eb
!	Mem[0000000010141434] = c2208e22, %l7 = 00000000bbc4a6ff
	ldsba	[%i5+0x037]%asi,%l7	! %l7 = 0000000000000022
!	Mem[0000000030101408] = 910000ff, %f8  = 3afe3c8b
	lda	[%i4+%o4]0x89,%f8 	! %f8 = 910000ff
!	Mem[0000000030141408] = 488fdd58, %l6 = 00000000aecb8e13
	lduha	[%i5+%o4]0x81,%l6	! %l6 = 000000000000488f
!	Mem[00000000201c0000] = 327c4c16, %l6 = 000000000000488f
	ldub	[%o0+%g0],%l6		! %l6 = 0000000000000032
!	Mem[0000000030101408] = ff000091, %l3 = 00000000000000ff
	lduba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[00000000201c0000] = 327c4c16, %l4 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000327c
!	Starting 10 instruction Store Burst
!	%f16 = dcc02a47 210acd61 00395b1c 66d2aa05
!	%f20 = 00ff0000 b9d51fc2 f6113d3e 7905ea26
!	%f24 = 6f273e24 f86a4d58 0a1dbb9b acfd61e7
!	%f28 = 0f36a7ae 7fd1bbc9 cd54064d ec8e78c0
	stda	%f16,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400

p0_label_44:
!	%l1 = 0000000005aad266, Mem[0000000010141408] = 24e44417
	stwa	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 05aad266
!	%l7 = 0000000000000022, Mem[0000000030081400] = 003981d1
	stba	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 223981d1
!	%l2 = 3266d851, %l3 = 000000ff, Mem[00000000300c1400] = cc6a7f77 ff3198cb
	stda	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 3266d851 000000ff
!	Mem[0000000010101419] = d2be1b72, %l2 = 000000003266d851
	ldstub	[%i4+0x019],%l2		! %l2 = 000000be000000ff
!	%f2  = 003981d1 92a2c4eb, Mem[0000000010001410] = 910000ff 0043b25c
	stda	%f2 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 003981d1 92a2c4eb
!	%l3 = 00000000000000ff, Mem[0000000030001410] = b9d51fc2
	stwa	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	%f8  = 910000ff, Mem[0000000030081410] = 51d86632
	sta	%f8 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 910000ff
!	%f0  = c0dcffff ff000000, %l3 = 00000000000000ff
!	Mem[0000000010181430] = ff66d851138ecbae
	add	%i6,0x030,%g1
	stda	%f0,[%g1+%l3]ASI_PST32_P ! Mem[0000000010181430] = c0dcffffff000000
!	%l0 = 00000000, %l1 = 05aad266, Mem[0000000010001410] = 92a2c4eb 003981d1
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 05aad266
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff000091, %l0 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000091

p0_label_45:
!	Mem[0000000010041408] = ff3cfe3a, %f0  = c0dcffff
	lda	[%i1+%o4]0x80,%f0 	! %f0 = ff3cfe3a
!	Mem[0000000010041400] = 7c315772, %l3 = 00000000000000ff
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 000000000000007c
!	Mem[0000000010141400] = 51d86632, %l5 = 000000000000008b
	ldsha	[%i5+%g0]0x80,%l5	! %l5 = 00000000000051d8
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010001408] = 9f000000, %l5 = 00000000000051d8
	lduwa	[%i0+%o4]0x88,%l5	! %l5 = 000000009f000000
!	Mem[0000000010101408] = 1bf85f92, %l7 = 0000000000000022
	ldsba	[%i4+%o4]0x80,%l7	! %l7 = 000000000000001b
!	Mem[0000000010001430] = 1c5ba276, %l3 = 000000000000007c
	lduha	[%i0+0x030]%asi,%l3	! %l3 = 0000000000001c5b
!	Mem[00000000211c0000] = ffff6986, %l3 = 0000000000001c5b
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010101410] = 51d86632, %l4 = 000000000000327c
	ldswa	[%i4+%o5]0x88,%l4	! %l4 = 0000000051d86632
!	Mem[0000000030001400] = 61cd0a21, %l2 = 00000000000000be
	lduba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000061
!	Starting 10 instruction Store Burst
!	%f21 = b9d51fc2, Mem[0000000010101400] = 9f000000
	sta	%f21,[%i4+%g0]0x88	! Mem[0000000010101400] = b9d51fc2

p0_label_46:
!	Mem[0000000010001410] = 00000000, %l2 = 0000000000000061
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 925ff81b, %l6 = 0000000000000032
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 0000001b000000ff
!	Mem[0000000010101400] = c21fd5b9, %l4 = 0000000051d86632
	ldstuba	[%i4+%g0]0x80,%l4	! %l4 = 000000c2000000ff
!	Mem[00000000100c1438] = 5f5eb213, %l5 = 000000009f000000, %asi = 80
	swapa	[%i3+0x038]%asi,%l5	! %l5 = 000000005f5eb213
!	Mem[0000000030101408] = ff000091, %l1 = 0000000005aad266
	swapa	[%i4+%o4]0x81,%l1	! %l1 = 00000000ff000091
!	Mem[0000000010001408] = 0000009f, %l5 = 000000005f5eb213
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 000000000000009f
!	%l4 = 00000000000000c2, Mem[0000000030101410] = aecb8e13
	stba	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = aecb8ec2
!	%f12 = 682d6061, Mem[0000000010101400] = ff1fd5b9
	sta	%f12,[%i4+%g0]0x80	! Mem[0000000010101400] = 682d6061
!	Mem[0000000010101410] = 51d86632, %l4 = 00000000000000c2
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 0000000051d86632
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = c9c7befc 3d04de1c, %l2 = 00000000, %l3 = ffffffff
	ldd	[%i4+0x038],%l2		! %l2 = 00000000c9c7befc 000000003d04de1c

p0_label_47:
!	Mem[0000000010101408] = fff85f92dba80498, %f4  = 00395b1c 66d2aa05
	ldda	[%i4+%o4]0x80,%f4 	! %f4  = fff85f92 dba80498
!	Mem[0000000010141410] = 139b5e5f, %l5 = 000000000000009f
	ldsba	[%i5+%o5]0x88,%l5	! %l5 = 000000000000005f
!	Mem[0000000010081404] = c013d7ff, %l3 = 000000003d04de1c
	lduha	[%i2+0x004]%asi,%l3	! %l3 = 000000000000c013
!	Mem[0000000030041408] = ee7adbda21ab38eb, %f10 = 57ff03e6 a459b319
	ldda	[%i1+%o4]0x89,%f10	! %f10 = ee7adbda 21ab38eb
!	Mem[00000000300c1408] = 1c000000, %l6 = 000000000000001b
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 05aad26661000000, %f14 = 6ed6a3ff 13b25e5f
	ldda	[%i0+%o5]0x88,%f14	! %f14 = 05aad266 61000000
!	Mem[0000000010001400] = ffffffb2 cf57710e, %l4 = 51d86632, %l5 = 0000005f
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 00000000ffffffb2 00000000cf57710e
!	Mem[0000000030081408] = 5f5eb213ffa3d66e, %l4 = 00000000ffffffb2
	ldxa	[%i2+%o4]0x89,%l4	! %l4 = 5f5eb213ffa3d66e
!	Mem[0000000010101430] = 190d7dd8, %l3 = 000000000000c013
	ldsb	[%i4+0x031],%l3		! %l3 = 000000000000000d
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 66d2aa05d2be1b72, %l3 = 000000000000000d, %l4 = 5f5eb213ffa3d66e
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 66d2aa05d2be1b72

p0_label_48:
!	%f20 = 00ff0000 b9d51fc2, Mem[0000000010141410] = 139b5e5f 74ce53e8
	stda	%f20,[%i5+%o5]0x88	! Mem[0000000010141410] = 00ff0000 b9d51fc2
!	Mem[00000000201c0001] = 327c4c16, %l4 = 66d2aa05d2be1b72
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 0000007c000000ff
!	%f18 = 00395b1c 66d2aa05, Mem[0000000030101408] = 05aad266 e114fa68
	stda	%f18,[%i4+%o4]0x81	! Mem[0000000030101408] = 00395b1c 66d2aa05
!	Mem[0000000020800041] = bcc7e22a, %l1 = 00000000ff000091
	ldstuba	[%o1+0x041]%asi,%l1	! %l1 = 000000c7000000ff
!	Mem[0000000010081424] = 6e13e270, %l2 = 00000000c9c7befc
	swap	[%i2+0x024],%l2		! %l2 = 000000006e13e270
!	%l6 = 0000000000000000, Mem[0000000030101410] = aecb8ec2
	stwa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%f24 = 6f273e24 f86a4d58, Mem[0000000010181410] = 61000000 00000000
	stda	%f24,[%i6+%o5]0x88	! Mem[0000000010181410] = 6f273e24 f86a4d58
!	%f24 = 6f273e24 f86a4d58, %l5 = 00000000cf57710e
!	Mem[0000000010181430] = c0dcffffff000000
	add	%i6,0x030,%g1
	stda	%f24,[%g1+%l5]ASI_PST16_P ! Mem[0000000010181430] = 6f273e24f86a0000
!	%f10 = ee7adbda 21ab38eb, %l0 = 0000000000000091
!	Mem[0000000030141430] = 14f66b22555c9ceb
	add	%i5,0x030,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_S ! Mem[0000000030141430] = eef66bda555c9ceb
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 7847714a, %f21 = b9d51fc2
	lda	[%i6+%g0]0x88,%f21	! %f21 = 7847714a

p0_label_49:
!	Mem[00000000300c1410] = 0000e531, %f7  = d1813900
	lda	[%i3+%o5]0x81,%f7 	! %f7 = 0000e531
!	Mem[0000000030001400] = 61cd0a21 472ac0dc 05aad266 1c5b3900
!	Mem[0000000030001410] = ff000000 0000ff00 26ea0579 3e3d11f6
!	Mem[0000000030001420] = 584d6af8 243e276f e761fdac 9bbb1d0a
!	Mem[0000000030001430] = c9bbd17f aea7360f c0788eec 4d0654cd
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[0000000010041400] = 7c315772, %l7 = 000000000000001b
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 000000000000007c
!	Mem[0000000010001410] = 00000061, %l0 = 0000000000000091
	lduwa	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000061
!	Mem[0000000010101400] = 682d6061, %l0 = 0000000000000061
	lduw	[%i4+%g0],%l0		! %l0 = 00000000682d6061
!	Mem[00000000100c1424] = 8b3cfe3a, %l0 = 00000000682d6061
	ldsh	[%i3+0x024],%l0		! %l0 = ffffffffffff8b3c
!	Mem[0000000010101408] = fff85f92, %l3 = 000000000000000d
	ldsba	[%i4+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001410] = 00000061, %l2 = 000000006e13e270
	ldswa	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000061
!	Mem[0000000010001410] = 00000061, %l5 = 00000000cf57710e
	lduba	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141428] = bc3a65129efa5dd9, %l6 = 0000000000000000, %l3 = ffffffffffffffff
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = bc3a65129efa5dd9

p0_label_50:
!	Mem[000000001004140c] = 00000081, %l7 = 000000000000007c
	swap	[%i1+0x00c],%l7		! %l7 = 0000000000000081
!	Mem[00000000300c1400] = 51d86632, %l4 = 000000000000007c
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 0000000051d86632
!	%l7 = 0000000000000081, Mem[0000000010001410] = 61000000
	stha	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 61000081
!	Mem[0000000010101428] = bfa28d7262051572, %l5 = 0000000000000000, %l6 = 0000000000000000
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = bfa28d7262051572
!	%l2 = 00000061, %l3 = 9efa5dd9, Mem[0000000010001408] = 5f5eb213 1744e424
	stda	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000061 9efa5dd9
!	Mem[0000000010001419] = a7463bf1, %l2 = 0000000000000061
	ldstub	[%i0+0x019],%l2		! %l2 = 00000046000000ff
!	%f26 = 0a1dbb9b acfd61e7, %l7 = 0000000000000081
!	Mem[0000000010001428] = b05dde722c088091
	add	%i0,0x028,%g1
	stda	%f26,[%g1+%l7]ASI_PST8_P ! Mem[0000000010001428] = 0a5dde722c0880e7
!	%l7 = 0000000000000081, Mem[0000000020800040] = bcffe22a
	stb	%l7,[%o1+0x040]		! Mem[0000000020800040] = 81ffe22a
!	%l2 = 0000000000000046, Mem[0000000030081408] = 6ed6a3ff
	stba	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 46d6a3ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1414] = e114fa68, %l3 = bc3a65129efa5dd9
	ldub	[%i3+0x017],%l3		! %l3 = 0000000000000068

p0_label_51:
!	Mem[0000000010081410] = ff000000, %l1 = 00000000000000c7
	ldsba	[%i2+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001400] = ffffffb2, %l1 = ffffffffffffffff
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ffffffb2
!	Mem[0000000030081410] = 05aad266ff000091, %f20 = 00ff0000 7847714a
	ldda	[%i2+%o5]0x89,%f20	! %f20 = 05aad266 ff000091
!	Mem[0000000030101408] = 1c5b3900, %f20 = 05aad266
	lda	[%i4+%o4]0x89,%f20	! %f20 = 1c5b3900
!	Mem[0000000010041400] = 7257317c, %l4 = 0000000051d86632
	ldsba	[%i1+%g0]0x88,%l4	! %l4 = 000000000000007c
!	Mem[0000000010101408] = 925ff8ff, %l1 = 00000000ffffffb2
	lduwa	[%i4+%o4]0x88,%l1	! %l1 = 00000000925ff8ff
!	Mem[00000000218000c0] = 3a0fcd1f, %l5 = 0000000000000000
	lduh	[%o3+0x0c0],%l5		! %l5 = 0000000000003a0f
!	Mem[0000000010181400] = 7847714a, %l6 = bfa28d7262051572
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = 000000000000004a
!	Mem[00000000100c1400] = 000000ff, %l1 = 00000000925ff8ff
	ldsba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f20 = 1c5b3900 ff000091, %l1 = 0000000000000000
!	Mem[0000000030081430] = 3588f09ecb454f27
	add	%i2,0x030,%g1
	stda	%f20,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030081430] = 3588f09ecb454f27

p0_label_52:
!	Mem[0000000030181408] = 00395b1c, %l0 = ffffffffffff8b3c
	swapa	[%i6+%o4]0x81,%l0	! %l0 = 0000000000395b1c
!	Mem[0000000030141408] = 58dd8f48, %l4 = 000000000000007c
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 0000000058dd8f48
!	%l6 = 000000000000004a, Mem[0000000030081410] = 910000ff
	stwa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000004a
!	%f24 = 6f273e24 f86a4d58, Mem[0000000030081400] = d1813922 ebc4a292
	stda	%f24,[%i2+%g0]0x89	! Mem[0000000030081400] = 6f273e24 f86a4d58
!	%l1 = 0000000000000000, Mem[0000000010141431] = 113fb3a7
	stb	%l1,[%i5+0x031]		! Mem[0000000010141430] = 1100b3a7
!	%f30 = cd54064d, Mem[00000000300c1400] = 0000007c
	sta	%f30,[%i3+%g0]0x89	! Mem[00000000300c1400] = cd54064d
!	%l5 = 0000000000003a0f, Mem[0000000030101410] = 00000000
	stha	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 00003a0f
!	%l2 = 00000046, %l3 = 00000068, Mem[0000000010041408] = 3afe3cff 7c000000
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000046 00000068
!	Mem[00000000201c0000] = 32ff4c16, %l4 = 0000000058dd8f48
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 00000032000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 61602d68, %f0  = 61cd0a21
	lda	[%i4+%g0]0x88,%f0 	! %f0 = 61602d68

p0_label_53:
!	Mem[0000000010181410] = 584d6af8243e276f, %l5 = 0000000000003a0f
	ldxa	[%i6+%o5]0x80,%l5	! %l5 = 584d6af8243e276f
!	Mem[00000000300c1408] = 0000001c, %l3 = 0000000000000068
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = a4fc2af0, %l0 = 0000000000395b1c
	lduba	[%i5+%o5]0x89,%l0	! %l0 = 00000000000000f0
!	Mem[0000000010181414] = 243e276f, %l6 = 000000000000004a
	lduha	[%i6+0x016]%asi,%l6	! %l6 = 000000000000276f
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010001400] = ffffffb2 cf57710e 00000061 9efa5dd9
!	Mem[0000000010001410] = 81000061 66d2aa05 a7ff3bf1 d204d56c
!	Mem[0000000010001420] = 7257317c ff00bad0 0a5dde72 2c0880e7
!	Mem[0000000010001430] = 1c5ba276 a625bcc7 bad062da e18eb258
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000030041410] = 0000717a, %l6 = 000000000000276f
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = 000000000000007a
!	Mem[0000000030101400] = 925ff81b, %l0 = 00000000000000f0
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 00000000925ff81b
!	Mem[00000000300c1410] = 31e50000, %l0 = 00000000925ff81b
	lduwa	[%i3+%o5]0x89,%l0	! %l0 = 0000000031e50000
!	Mem[0000000030181408] = ffff8b3c, %l4 = 0000000000000032
	ldswa	[%i6+%o4]0x81,%l4	! %l4 = ffffffffffff8b3c
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 000000ff, %l5 = 584d6af8243e276f
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 000000ff000000ff

p0_label_54:
!	Mem[0000000010141400] = 51d86632, %l2 = 0000000000000046
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 00000051000000ff
!	%l1 = 0000000000000000, Mem[0000000010041400] = 7c315772
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%l4 = ffffffffffff8b3c, Mem[0000000030001400] = 61cd0a21472ac0dc
	stxa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffffffff8b3c
!	%l0 = 0000000031e50000, Mem[0000000030141410] = f02afca4377f2edd
	stxa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000031e50000
!	%l3 = 0000000000000000, Mem[0000000030001408] = 05aad266
	stba	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 00aad266
!	%l4 = ffffffffffff8b3c, Mem[0000000010081400] = ffd713c04d1dcea3
	stxa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffffffff8b3c
!	Mem[00000000300c1410] = 0000e531, %l3 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%f12 = c9bbd17f, Mem[00000000100c1424] = 8b3cfe3a
	sta	%f12,[%i3+0x024]%asi	! Mem[00000000100c1424] = c9bbd17f
!	%f8  = 584d6af8 243e276f, Mem[00000000100c1408] = 000000ff 9f000000
	stda	%f8 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 584d6af8 243e276f
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ffa3d646, %l4 = ffffffffffff8b3c
	ldsha	[%i2+%o4]0x89,%l4	! %l4 = ffffffffffffd646

p0_label_55:
!	Mem[00000000100c1400] = 000000ff, %l4 = ffffffffffffd646
	lduba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 68fa14e1 910000ff, %l0 = 31e50000, %l1 = 00000000
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 00000000910000ff 0000000068fa14e1
!	Mem[000000001008142c] = 6e0b7f3a, %l6 = 000000000000007a
	ldsha	[%i2+0x02c]%asi,%l6	! %l6 = 0000000000006e0b
!	Mem[0000000010141400] = 3266d8ff, %l6 = 0000000000006e0b
	ldswa	[%i5+%g0]0x88,%l6	! %l6 = 000000003266d8ff
!	Mem[0000000030141400] = 0000000000000061, %l2 = 0000000000000051
	ldxa	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000061
!	Mem[0000000010101400] = 682d6061 00000022, %l2 = 00000061, %l3 = 00000000
	ldd	[%i4+%g0],%l2		! %l2 = 00000000682d6061 0000000000000022
!	Mem[0000000010081400] = ffff8b3c, %l4 = 0000000000000000
	ldsba	[%i2+%g0]0x88,%l4	! %l4 = 000000000000003c
!	Mem[0000000030081408] = 46d6a3ff, %l0 = 00000000910000ff
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = 00000000000046d6
!	Mem[00000000211c0000] = ffff6986, %l3 = 0000000000000022
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f14 = c0788eec 4d0654cd, Mem[0000000010041430] = 156a04ab 61c2e2b3
	stda	%f14,[%i1+0x030]%asi	! Mem[0000000010041430] = c0788eec 4d0654cd

p0_label_56:
!	Mem[0000000010181400] = 4a714778, %l0 = 00000000000046d6
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 0000004a000000ff
!	%l4 = 000000000000003c, Mem[0000000030181410] = 0000ff00
	stba	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ff3c
	membar	#Sync			! Added by membar checker (10)
!	%f10 = e761fdac 9bbb1d0a, Mem[0000000010001410] = 81000061 66d2aa05
	stda	%f10,[%i0+%o5]0x80	! Mem[0000000010001410] = e761fdac 9bbb1d0a
!	%f10 = e761fdac 9bbb1d0a, Mem[0000000030181410] = 0000ff3c c21fd5b9
	stda	%f10,[%i6+%o5]0x89	! Mem[0000000030181410] = e761fdac 9bbb1d0a
!	Mem[00000000211c0001] = ffff6986, %l7 = 0000000000000081
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	%l1 = 0000000068fa14e1, Mem[0000000010001410] = e761fdac
	stba	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = e161fdac
!	Mem[0000000010141400] = ffd86632, %l4 = 000000000000003c
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 00000000ffd86632
!	%f24 = 7257317c ff00bad0, Mem[00000000100c1410] = ff000091 e114fa68
	stda	%f24,[%i3+%o5]0x80	! Mem[00000000100c1410] = 7257317c ff00bad0
!	%l7 = 00000000000000ff, Mem[0000000010141408] = 05aad266
	stha	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 05aa00ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 4d0654cd000000ff, %l7 = 00000000000000ff
	ldxa	[%i3+%g0]0x81,%l7	! %l7 = 4d0654cd000000ff

p0_label_57:
!	Mem[00000000211c0000] = ffff6986, %l5 = 00000000000000ff
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010101408] = 9804a8db925ff8ff, %f18 = 00000061 9efa5dd9
	ldda	[%i4+%o4]0x88,%f18	! %f18 = 9804a8db 925ff8ff
!	Mem[0000000030081400] = f86a4d58, %l1 = 0000000068fa14e1
	lduwa	[%i2+%g0]0x89,%l1	! %l1 = 00000000f86a4d58
!	%l3 = ffffffffffffffff, %l2 = 00000000682d6061, %y  = 00000000
	sdiv	%l3,%l2,%l3		! %l3 = 0000000000000002
	mov	%l0,%y			! %y = 0000004a
!	Mem[00000000100c1408] = 243e276f, %l0 = 000000000000004a
	lduha	[%i3+%o4]0x88,%l0	! %l0 = 000000000000276f
!	Mem[0000000010141408] = 721bbed205aa00ff, %l4 = 00000000ffd86632
	ldxa	[%i5+%o4]0x88,%l4	! %l4 = 721bbed205aa00ff
!	Mem[0000000010081408] = 26b20000, %l3 = 0000000000000002
	lduha	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 3c8bffffffffffff, %f6  = 26ea0579 3e3d11f6
	ldda	[%i2+%g0]0x80,%f6 	! %f6  = 3c8bffff ffffffff
!	Mem[0000000030001400] = ffffffffffff8b3c, %f0  = 61602d68 472ac0dc
	ldda	[%i0+%g0]0x81,%f0 	! %f0  = ffffffff ffff8b3c
!	Starting 10 instruction Store Burst
!	%l7 = 4d0654cd000000ff, Mem[0000000021800080] = c62464ec, %asi = 80
	stha	%l7,[%o3+0x080]%asi	! Mem[0000000021800080] = 00ff64ec

p0_label_58:
!	Mem[000000001010140e] = dba80498, %l7 = 4d0654cd000000ff
	ldstub	[%i4+0x00e],%l7		! %l7 = 00000004000000ff
!	%l3 = 0000000000000000, Mem[0000000010141400] = 0000003cff000000
	stxa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000
!	%l2 = 00000000682d6061, Mem[00000000201c0000] = ffff4c16, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 60614c16
!	%f12 = c9bbd17f aea7360f, Mem[00000000300c1410] = 31e500ff 1bf85f92
	stda	%f12,[%i3+%o5]0x89	! Mem[00000000300c1410] = c9bbd17f aea7360f
!	%f18 = 9804a8db 925ff8ff, Mem[0000000030041400] = ffecffff fdc12fef
	stda	%f18,[%i1+%g0]0x81	! Mem[0000000030041400] = 9804a8db 925ff8ff
!	%f21 = 66d2aa05, Mem[0000000010081408] = 0000b226
	sta	%f21,[%i2+%o4]0x80	! Mem[0000000010081408] = 66d2aa05
!	%l6 = 3266d8ff, %l7 = 00000004, Mem[0000000010101408] = fff85f92 dba8ff98
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 3266d8ff 00000004
!	%f16 = ffffffb2 cf57710e, %l7 = 0000000000000004
!	Mem[0000000030141408] = 7c000000e8080f6c
	add	%i5,0x008,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_S ! Mem[0000000030141408] = 7c000000e8570f6c
!	%f18 = 9804a8db 925ff8ff, Mem[0000000010181408] = ff000000 b9d51fc2
	stda	%f18,[%i6+%o4]0x80	! Mem[0000000010181408] = 9804a8db 925ff8ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 6f273e24 f86a4d58, %l0 = 0000276f, %l1 = f86a4d58
	ldda	[%i6+%o5]0x88,%l0	! %l0 = 00000000f86a4d58 000000006f273e24

p0_label_59:
!	Mem[000000001014141c] = bc71357b, %l4 = 721bbed205aa00ff
	ldsba	[%i5+0x01d]%asi,%l4	! %l4 = 0000000000000071
!	Mem[0000000030181408] = 3c8bffff, %f8  = 584d6af8
	lda	[%i6+%o4]0x89,%f8 	! %f8 = 3c8bffff
!	Mem[00000000201c0000] = 60614c16, %l3 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000006061
!	Mem[0000000030081408] = ffa3d646, %l4 = 0000000000000071
	ldsba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000046
!	Mem[0000000010141404] = 00000000, %l1 = 000000006f273e24
	ldsba	[%i5+0x004]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = 3266d8ff 00000004, %l6 = 3266d8ff, %l7 = 00000004
	ldda	[%i4+%o4]0x80,%l6	! %l6 = 000000003266d8ff 0000000000000004
!	Mem[00000000300c1410] = aea7360f, %l5 = 000000000000ffff
	ldswa	[%i3+%o5]0x89,%l5	! %l5 = ffffffffaea7360f
!	Mem[0000000010181408] = dba80498, %l0 = 00000000f86a4d58
	ldsha	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000498
!	%l0 = 0000000000000498, imm = 0000000000000e8c, %l5 = ffffffffaea7360f
	orn	%l0,0xe8c,%l5		! %l5 = fffffffffffff5fb
!	Starting 10 instruction Store Burst
!	%l4 = 00000046, %l5 = fffff5fb, Mem[0000000030041400] = 9804a8db 925ff8ff
	stda	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000046 fffff5fb

p0_label_60:
!	Mem[0000000010141410] = c21fd5b9, %l6 = 000000003266d8ff
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 000000c2000000ff
!	%l3 = 0000000000006061, Mem[0000000010041432] = c0788eec
	stb	%l3,[%i1+0x032]		! Mem[0000000010041430] = c07861ec
!	%l5 = fffffffffffff5fb, Mem[00000000100c1408] = 6f273e24
	stwa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = fffff5fb
!	Mem[00000000100c1428] = 19b359a4e603ff57, %l1 = 0000000000000000, %l5 = fffffffffffff5fb
	add	%i3,0x28,%g1
	casxa	[%g1]0x80,%l1,%l5	! %l5 = 19b359a4e603ff57
!	%l3 = 0000000000006061, Mem[00000000300c1408] = f3e1f5611c000000
	stxa	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000006061
!	Mem[00000000300c1410] = 0f36a7ae, %l1 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 0000000f000000ff
!	%l0 = 0000000000000498, Mem[0000000020800000] = dcff5a05, %asi = 80
	stba	%l0,[%o1+0x000]%asi	! Mem[0000000020800000] = 98ff5a05
!	%l4 = 00000046, %l5 = e603ff57, Mem[0000000030181410] = 0a1dbb9b acfd61e7
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000046 e603ff57
!	Mem[0000000010181418] = da00b270925ff89b, %l0 = 0000000000000498, %l1 = 000000000000000f
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = da00b270925ff89b
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000046, %f16 = ffffffb2
	lda	[%i1+%g0]0x81,%f16	! %f16 = 00000046

p0_label_61:
!	Mem[00000000100c1410] = d0ba00ff7c315772, %l6 = 00000000000000c2
	ldxa	[%i3+%o5]0x88,%l6	! %l6 = d0ba00ff7c315772
!	Mem[00000000300c1410] = c9bbd17faea736ff, %l4 = 0000000000000046
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = c9bbd17faea736ff
!	Mem[0000000010101410] = c2000000, %l1 = da00b270925ff89b
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = ffffffffffffffc2
!	Mem[0000000010141418] = 4926f386, %l6 = d0ba00ff7c315772
	lduba	[%i5+0x01a]%asi,%l6	! %l6 = 00000000000000f3
!	Mem[0000000021800040] = 02564da2, %l7 = 0000000000000004
	ldsba	[%o3+0x041]%asi,%l7	! %l7 = 0000000000000056
!	Mem[0000000030101408] = 00395b1c66d2aa05, %l0 = 0000000000000498
	ldxa	[%i4+%o4]0x81,%l0	! %l0 = 00395b1c66d2aa05
!	Mem[00000000100c1408] = fffff5fb, %l0 = 00395b1c66d2aa05
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1418] = 003981d1721c8243, %f12 = c9bbd17f aea7360f
	ldda	[%i3+0x018]%asi,%f12	! %f12 = 003981d1 721c8243
!	Mem[00000000300c1408] = 61600000 00000000, %l6 = 000000f3, %l7 = 00000056
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 0000000061600000 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 05aad266, %l2 = 00000000682d6061
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 0000000005aad266

p0_label_62:
!	%f19 = 925ff8ff, Mem[0000000030181410] = 46000000
	sta	%f19,[%i6+%o5]0x89	! Mem[0000000030181410] = 925ff8ff
!	Mem[000000001000141c] = d204d56c, %l7 = 0000000000000000, %asi = 80
	swapa	[%i0+0x01c]%asi,%l7	! %l7 = 00000000d204d56c
!	Mem[00000000100c1408] = fbf5ffff, %l4 = c9bbd17faea736ff
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 00000000fbf5ffff
!	Mem[00000000100c1400] = 000000ff, %l5 = 19b359a4e603ff57
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l2 = 0000000005aad266, Mem[00000000100c142b] = 19b359a4, %asi = 80
	stba	%l2,[%i3+0x02b]%asi	! Mem[00000000100c1428] = 19b35966
!	%l4 = 00000000fbf5ffff, Mem[00000000100c1400] = ff0000ff
	stha	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffff00ff
!	Mem[000000001010141c] = 6889dceb, %l5 = 00000000, %l6 = 61600000
	add	%i4,0x1c,%g1
	casa	[%g1]0x80,%l5,%l6	! %l6 = 000000006889dceb
!	%f14 = c0788eec 4d0654cd, %l5 = 0000000000000000
!	Mem[0000000010181410] = 584d6af8243e276f
	add	%i6,0x010,%g1
	stda	%f14,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010181410] = 584d6af8243e276f
!	Mem[0000000010001410] = e161fdac, %l2 = 0000000005aad266
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 00000000e161fdac
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff00ffff, %l7 = 00000000d204d56c
	ldswa	[%i3+%g0]0x88,%l7	! %l7 = ffffffffff00ffff

p0_label_63:
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 00000000000000ff
	setx	0x22c44fe04d577674,%g7,%l0 ! %l0 = 22c44fe04d577674
!	%l1 = ffffffffffffffc2
	setx	0xc62991ffb5eca014,%g7,%l1 ! %l1 = c62991ffb5eca014
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 22c44fe04d577674
	setx	0xd796bb17f36861a1,%g7,%l0 ! %l0 = d796bb17f36861a1
!	%l1 = c62991ffb5eca014
	setx	0x965505a0277cd30f,%g7,%l1 ! %l1 = 965505a0277cd30f
!	Mem[0000000030141408] = 6c0f57e80000007c, %f6  = 3c8bffff ffffffff
	ldda	[%i5+%o4]0x89,%f6 	! %f6  = 6c0f57e8 0000007c
!	Mem[00000000100c1410] = 7257317c, %l0 = d796bb17f36861a1
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = 000000007257317c
!	Mem[0000000010141400] = 00000000, %l0 = 000000007257317c
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = 21ab38eb, %l7 = ffffffffff00ffff
	ldsha	[%i1+%o4]0x89,%l7	! %l7 = 00000000000038eb
!	Mem[0000000010081408] = 61602d68, %f18 = 9804a8db
	lda	[%i2+%o4]0x80,%f18	! %f18 = 61602d68
!	Mem[0000000010141430] = 1100b3a7, %l3 = 0000000000006061
	lduh	[%i5+0x030],%l3		! %l3 = 0000000000001100
!	Mem[0000000030141410] = 00000000, %l0 = 0000000000000000
	lduwa	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%l2 = 00000000e161fdac, %l7 = 00000000000038eb, %l2 = 00000000e161fdac
	or	%l2,%l7,%l2		! %l2 = 00000000e161fdef
!	Starting 10 instruction Store Burst
!	%f29 = a625bcc7, Mem[00000000100c143c] = ffa3d66e
	st	%f29,[%i3+0x03c]	! Mem[00000000100c143c] = a625bcc7

p0_label_64:
!	%l2 = e161fdef, %l3 = 00001100, Mem[0000000010141400] = 00000000 00000000
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = e161fdef 00001100
!	Mem[00000000201c0000] = 60614c16, %l0 = 0000000000000000
	ldstub	[%o0+%g0],%l0		! %l0 = 00000060000000ff
!	%l3 = 0000000000001100, Mem[0000000010181410] = 584d6af8
	stwa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 00001100
!	%l3 = 0000000000001100, Mem[0000000010101410] = c2000000
	stba	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	Mem[0000000021800180] = 5dffca0d, %l5 = 0000000000000000
	ldstuba	[%o3+0x180]%asi,%l5	! %l5 = 0000005d000000ff
!	%f22 = a7ff3bf1 d204d56c, %l4 = 00000000fbf5ffff
!	Mem[00000000300c1400] = 4d0654cd000000ff
	stda	%f22,[%i3+%l4]ASI_PST32_S ! Mem[00000000300c1400] = a7ff3bf1d204d56c
!	Mem[0000000030141408] = 7c000000, %l7 = 00000000000038eb
	swapa	[%i5+%o4]0x81,%l7	! %l7 = 000000007c000000
!	%l4 = 00000000fbf5ffff, Mem[0000000030001400] = ffffffff
	stwa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = fbf5ffff
!	%f21 = 66d2aa05, Mem[00000000100c1408] = aea736ff
	sta	%f21,[%i3+%o4]0x88	! Mem[00000000100c1408] = 66d2aa05
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 61602d68, %l4 = 00000000fbf5ffff
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = 0000000061602d68

p0_label_65:
!	Mem[00000000100c1400] = ffff00ffffffdcc0, %l1 = 965505a0277cd30f
	ldx	[%i3+%g0],%l1		! %l1 = ffff00ffffffdcc0
!	Mem[0000000030141408] = 000038eb, %f4  = ff000000
	lda	[%i5+%o4]0x81,%f4 	! %f4 = 000038eb
!	Mem[0000000010141410] = 00ff0000 b9d51fff, %l0 = 00000060, %l1 = ffffdcc0
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 00000000b9d51fff 0000000000ff0000
!	Mem[0000000010041410] = ff000000 91800000, %l6 = 6889dceb, %l7 = 7c000000
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff000000 0000000091800000
!	Mem[00000000100c1434] = 61602d68, %l2 = 00000000e161fdef
	ldsh	[%i3+0x036],%l2		! %l2 = 0000000000002d68
!	Mem[0000000010141420] = 000028561cede55e, %f0  = ffffffff ffff8b3c
	ldd	[%i5+0x020],%f0 	! %f0  = 00002856 1cede55e
!	Mem[0000000010181410] = 00001100, %l6 = 00000000ff000000
	lduwa	[%i6+%o5]0x80,%l6	! %l6 = 0000000000001100
!	Mem[0000000030081400] = 584d6af8 243e276f, %l2 = 00002d68, %l3 = 00001100
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000584d6af8 00000000243e276f
!	%f16 = 00000046 cf57710e, Mem[0000000010101400] = 682d6061 00000022
	stda	%f16,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000046 cf57710e
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 7c315772, %l6 = 0000000000001100
	ldstuba	[%i3+%o5]0x88,%l6	! %l6 = 00000072000000ff

p0_label_66:
!	%l4 = 61602d68, %l5 = 0000005d, Mem[00000000300c1408] = 61600000 00000000
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 61602d68 0000005d
!	Mem[0000000030141410] = 00000000, %l0 = 00000000b9d51fff
	swapa	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = e161fdef00001100, %l2 = 00000000584d6af8, %l5 = 000000000000005d
	casxa	[%i5]0x80,%l2,%l5	! %l5 = e161fdef00001100
!	Mem[0000000010041410] = ff000000, %l7 = 0000000091800000
	swapa	[%i1+%o5]0x80,%l7	! %l7 = 00000000ff000000
!	%f29 = a625bcc7, Mem[0000000030101410] = 0f3a0000
	sta	%f29,[%i4+%o5]0x81	! Mem[0000000030101410] = a625bcc7
!	%f28 = 1c5ba276 a625bcc7, %f6  = 6c0f57e8 0000007c
	fxtod	%f28,%f6 		! %f6  = 43bc5ba2 76a625bd
!	Mem[0000000010101412] = 00000000, %l4 = 0000000061602d68
	ldstub	[%i4+0x012],%l4		! %l4 = 00000000000000ff
!	%l5 = e161fdef00001100, Mem[0000000010081408] = 682d6061
	stha	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 682d1100
!	Mem[0000000030141400] = 00000000, %l3 = 00000000243e276f
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff000000, %l4 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000ff

p0_label_67:
!	Mem[0000000010181424] = 000000ff, %f6  = 43bc5ba2
	lda	[%i6+0x024]%asi,%f6 	! %f6 = 000000ff
!	Mem[0000000010041410] = 00008091, %l1 = 0000000000ff0000
	ldsha	[%i1+%o5]0x88,%l1	! %l1 = ffffffffffff8091
!	Mem[00000000211c0000] = ffff6986, %l2 = 00000000584d6af8
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081408] = 00112d68, %l3 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 0000ff00, %l1 = ffffffffffff8091
	ldsha	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 46000000, %l1 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = ffff00ffffffdcc0, %l1 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l1	! %l1 = ffff00ffffffdcc0
!	Mem[0000000010081410] = c21fd5b9 000000ff, %l4 = 000000ff, %l5 = 00001100
	ldda	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff 00000000c21fd5b9
!	Mem[0000000030181408] = ffff8b3c, %f15 = 4d0654cd
	lda	[%i6+%o4]0x81,%f15	! %f15 = ffff8b3c
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[00000000100c1400] = ffff00ff
	stba	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffff00ff

p0_label_68:
!	Mem[0000000030001400] = fffff5fb, %l4 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 00000000fffff5fb
!	Mem[0000000010081408] = 00112d68e892acbe, %l0 = 0000000000000000, %l5 = 00000000c21fd5b9
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = 00112d68e892acbe
!	%l5 = 00112d68e892acbe, Mem[0000000010001400] = 0e7157cfb2ffffff
	stxa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 00112d68e892acbe
!	%l0 = 0000000000000000, Mem[0000000030101400] = 1bf85f92
	stba	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00f85f92
!	Mem[0000000010101400] = 00000046, %l5 = 00112d68e892acbe
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000046
!	%l7 = 00000000ff000000, Mem[00000000100c1400] = ff00ffff
	stba	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff00ff00
!	%l7 = 00000000ff000000, Mem[0000000010101400] = 0e7157cfbeac92e8
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000ff000000
!	Mem[0000000010041408] = 46000000, %l3 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l3	! %l3 = 0000000046000000
!	Mem[000000001008141b] = c21fd5b9, %l2 = ffffffffffffffff
	ldstub	[%i2+0x01b],%l2		! %l2 = 000000b9000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00008091, %l2 = 00000000000000b9
	lduba	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000091

p0_label_69:
	membar	#Sync			! Added by membar checker (11)
!	Mem[00000000100c1400] = 00ff00ff ffffdcc0 05aad266 f86a4d58
!	Mem[00000000100c1410] = ff57317c ff00bad0 003981d1 721c8243
!	Mem[00000000100c1420] = bb8cf8b6 c9bbd17f 19b35966 e603ff57
!	Mem[00000000100c1430] = 26bfa66f 61602d68 9f000000 a625bcc7
	ldda	[%i3]ASI_BLK_AIUPL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010181400] = ff714778, %l2 = 0000000000000091
	lduha	[%i6+%g0]0x80,%l2	! %l2 = 000000000000ff71
!	Mem[0000000010001400] = e892acbe, %l6 = 0000000000000072
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = ffffffffe892acbe
!	Mem[00000000211c0000] = ffff6986, %l3 = 0000000046000000
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001400] = e892acbe, %l5 = 0000000000000046
	lduba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000be
!	Mem[0000000010001408] = 61000000, %l4 = 00000000fffff5fb
	ldsha	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 00110000, %l4 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 9804a8db, %l1 = ffff00ffffffdcc0
	ldsba	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffffff98
!	Mem[0000000010081408] = 00112d68, %l2 = 000000000000ff71
	lduha	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000011
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 000000be, Mem[0000000030141410] = b9d51fff 31e50000
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 000000be

p0_label_70:
!	%l1 = ffffffffffffff98, Mem[0000000030041410] = 7a710000
	stwa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffff98
!	%l1 = ffffffffffffff98, Mem[0000000010181408] = 9804a8db, %asi = 80
	stwa	%l1,[%i6+0x008]%asi	! Mem[0000000010181408] = ffffff98
!	Mem[0000000010001400] = e892acbe, %l6 = ffffffffe892acbe
	swapa	[%i0+%g0]0x88,%l6	! %l6 = 00000000e892acbe
!	%l3 = ffffffffffffffff, Mem[0000000010081438] = 249ec5ea, %asi = 80
	stba	%l3,[%i2+0x038]%asi	! Mem[0000000010081438] = ff9ec5ea
!	Mem[00000000300c1410] = aea736ff, %l7 = 00000000ff000000
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 00000000aea736ff
!	%l6 = 00000000e892acbe, Mem[00000000300c1400] = f13bffa7
	stba	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = f13bffbe
!	%l1 = ffffffffffffff98, Mem[0000000030001408] = 66d2aa00
	stha	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 66d2ff98
!	Mem[0000000030181400] = dcc02a47, %l6 = 00000000e892acbe
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 000000dc000000ff
!	%l2 = 0000000000000011, Mem[0000000010181410] = 00001100243e276f, %asi = 80
	stxa	%l2,[%i6+0x010]%asi	! Mem[0000000010181410] = 0000000000000011
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 0000809100008091, %f12 = 003981d1 721c8243
	ldda	[%i1+%o5]0x88,%f12	! %f12 = 00008091 00008091

p0_label_71:
!	Mem[0000000030041410] = 98ffffff, %l3 = ffffffffffffffff
	ldswa	[%i1+%o5]0x89,%l3	! %l3 = ffffffff98ffffff
!	Mem[0000000010101400] = 000000ff 00000000 3266d8ff 00000004
!	Mem[0000000010101410] = 0000ff00 138ecbae d2ff1b72 6889dceb
!	Mem[0000000010101420] = 3b7829f2 c443b9a4 bfa28d72 62051572
!	Mem[0000000010101430] = 190d7dd8 c443b9a4 c9c7befc 3d04de1c
	ldda	[%i4]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400
!	Mem[0000000020800040] = 81ffe22a, %l4 = 0000000000000000
	ldsba	[%o1+0x040]%asi,%l4	! %l4 = ffffffffffffff81
!	Mem[00000000300c1410] = ff000000, %l3 = ffffffff98ffffff
	lduwa	[%i3+%o5]0x89,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030001400] = ff000000, %l6 = 00000000000000dc
	ldsba	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 05aad2664a000000, %l7 = 00000000aea736ff
	ldxa	[%i2+%o5]0x89,%l7	! %l7 = 05aad2664a000000
!	Mem[0000000010101410] = 0000ff00, %l4 = ffffffffffffff81
	lduba	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = 000038eb, %l6 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l6	! %l6 = 00000000000038eb
!	Mem[0000000010141408] = 05aa00ff, %l4 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 05aad2664a000000, Mem[0000000030181410] = 925ff8ff
	stha	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 925f0000

p0_label_72:
!	%l7 = 05aad2664a000000, Mem[0000000010141410] = b9d51fff
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 4a000000
!	%f11 = 9bbb1d0a, Mem[0000000010001410] = 05aad266
	sta	%f11,[%i0+%o5]0x80	! Mem[0000000010001410] = 9bbb1d0a
!	%l5 = 00000000000000be, Mem[000000001014140c] = d2be1b72, %asi = 80
	stwa	%l5,[%i5+0x00c]%asi	! Mem[000000001014140c] = 000000be
!	Mem[000000001010141c] = 6889dceb, %l3 = ff000000, %l2 = 00000011
	add	%i4,0x1c,%g1
	casa	[%g1]0x80,%l3,%l2	! %l2 = 000000006889dceb
!	%l2 = 000000006889dceb, Mem[00000000300c1400] = f13bffbe
	stha	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = f13bdceb
!	%f6  = 000000ff 76a625bd, Mem[0000000030041410] = ffffff98 14c0b226
	stda	%f6 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff 76a625bd
!	Mem[0000000030081408] = 46d6a3ff, %l1 = ffffffffffffff98
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 0000000046d6a3ff
!	Mem[0000000030001408] = 66d2ff98, %l3 = 00000000ff000000
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 00000098000000ff
!	Mem[00000000100c1400] = ff00ff00, %l7 = 05aad2664a000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000ff00ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 3c8bffff, %l7 = 00000000ff00ff00
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 000000000000003c

p0_label_73:
!	Mem[0000000010101410] = 0000ff00 138ecbae, %l4 = ffffffff, %l5 = 000000be
	ldd	[%i4+%o5],%l4		! %l4 = 000000000000ff00 00000000138ecbae
!	Mem[00000000100c1400] = 4a000000, %l2 = 000000006889dceb
	lduwa	[%i3+%g0]0x88,%l2	! %l2 = 000000004a000000
!	Mem[0000000010181410] = 00000000, %f3  = 1c5b3900
	lda	[%i6+%o5]0x88,%f3 	! %f3 = 00000000
!	Mem[0000000010081400] = 3c8bffff ffffffff, %l6 = 000038eb, %l7 = 0000003c
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 000000003c8bffff 00000000ffffffff
!	Mem[0000000010181410] = 00000000, %l7 = 00000000ffffffff
	lduh	[%i6+%o5],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101410] = 00ff0000, %l1 = 0000000046d6a3ff
	lduha	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = 000038ebe8570f6c, %l0 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l0	! %l0 = 000038ebe8570f6c
!	Mem[0000000010001410] = 0a1dbb9b, %f6  = 000000ff
	lda	[%i0+%o5]0x88,%f6 	! %f6 = 0a1dbb9b
!	Mem[0000000030041408] = ee7adbda21ab38eb, %f8  = 3c8bffff 243e276f
	ldda	[%i1+%o4]0x89,%f8 	! %f8  = ee7adbda 21ab38eb
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010141400] = effd61e1
	stwa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000

p0_label_74:
!	Mem[0000000010001408] = 00000061, %l4 = 000000000000ff00
	ldstuba	[%i0+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%f0  = 00002856 1cede55e, Mem[0000000010001410] = 0a1dbb9b 0a1dbb9b
	stda	%f0 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 00002856 1cede55e
!	Mem[0000000010101410] = 0000ff00, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%f7  = 76a625bd, Mem[0000000010081410] = 000000ff
	sta	%f7 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 76a625bd
	membar	#Sync			! Added by membar checker (12)
!	%f4  = 000038eb 0000ff00, %l2 = 000000004a000000
!	Mem[00000000100c1418] = 003981d1721c8243
	add	%i3,0x018,%g1
	stda	%f4,[%g1+%l2]ASI_PST32_PL ! Mem[00000000100c1418] = 003981d1721c8243
!	%f28 = 190d7dd8, Mem[0000000010181408] = ffffff98
	sta	%f28,[%i6+%o4]0x80	! Mem[0000000010181408] = 190d7dd8
!	%f16 = 000000ff 00000000, Mem[0000000030181400] = ffc02a47 210acd61
	stda	%f16,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff 00000000
!	Mem[0000000010041408] = 0000006800000046, %l7 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l7	! %l7 = 0000006800000046
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000000ff, %l2 = 000000004a000000
	ldsha	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000

p0_label_75:
!	Mem[0000000030001408] = 00395b1c 66d2ffff, %l4 = 00000000, %l5 = 138ecbae
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 0000000066d2ffff 0000000000395b1c
!	Mem[0000000010101408] = 3266d8ff, %l2 = 0000000000000000
	lduha	[%i4+%o4]0x80,%l2	! %l2 = 0000000000003266
!	Mem[0000000020800000] = 98ff5a05, %l3 = 0000000000000098
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 00000000000098ff
!	Mem[0000000010041420] = 258da68d, %l1 = 0000000000000000
	ldsw	[%i1+0x020],%l1		! %l1 = 00000000258da68d
!	Mem[0000000030041408] = 21ab38eb, %l5 = 0000000000395b1c
	ldsba	[%i1+%o4]0x89,%l5	! %l5 = ffffffffffffffeb
!	Mem[0000000010101410] = 00ff00ff, %l3 = 00000000000098ff
	lduha	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141408] = ff00aa05, %l6 = 000000003c8bffff
	ldswa	[%i5+%o4]0x80,%l6	! %l6 = ffffffffff00aa05
!	Mem[0000000010041410] = 91800000 91800000, %l6 = ff00aa05, %l7 = 00000046
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 0000000091800000 0000000091800000
!	Mem[00000000211c0000] = ffff6986, %l1 = 00000000258da68d
	ldsb	[%o2+0x001],%l1		! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 0000004a, %l7 = 0000000091800000
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 000000000000004a

p0_label_76:
!	%l7 = 000000000000004a, Mem[0000000010181408] = fff85f92d87d0d19
	stxa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000000000004a
!	Mem[0000000030101400] = 925ff800, %l2 = 0000000000003266
	ldstuba	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081434] = 6e0b7f3a, %l2 = 00000000, %l4 = 66d2ffff
	add	%i2,0x34,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 000000006e0b7f3a
!	%f14 = c0788eec ffff8b3c, %l7 = 000000000000004a
!	Mem[0000000030141410] = 00000000000000be
	add	%i5,0x010,%g1
	stda	%f14,[%g1+%l7]ASI_PST16_S ! Mem[0000000030141410] = c0780000ffff00be
!	%l2 = 0000000000000000, Mem[0000000010101400] = ff000000
	stwa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	%l6 = 91800000, %l7 = 0000004a, Mem[0000000010081408] = 00112d68 e892acbe
	stda	%l6,[%i2+0x008]%asi	! Mem[0000000010081408] = 91800000 0000004a
!	%f22 = d2ff1b72 6889dceb, Mem[0000000030181408] = ffff8b3c 66d2aa05
	stda	%f22,[%i6+%o4]0x81	! Mem[0000000030181408] = d2ff1b72 6889dceb
!	%l5 = ffffffffffffffeb, Mem[00000000100c1400] = 91800000ffffdcc0
	stxa	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffffffffffeb
!	%l2 = 0000000000000000, Mem[0000000010181408] = 4a00000000000000
	stxa	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 3266d8ff, %l1 = ffffffffffffffff
	ldsha	[%i4+%o4]0x80,%l1	! %l1 = 0000000000003266

p0_label_77:
!	Mem[0000000010001410] = 5ee5ed1c, %l5 = ffffffffffffffeb
	lduha	[%i0+0x012]%asi,%l5	! %l5 = 000000000000ed1c
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000030141400] = ff000000 00000061 000038eb e8570f6c
!	Mem[0000000030141410] = c0780000 ffff00be 9ec3138e 27920983
!	Mem[0000000030141420] = 65528a93 8a570786 f54cc84b 399c4442
!	Mem[0000000030141430] = eef66bda 555c9ceb c965974b f7fdaf8a
	ldda	[%i5]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030141400
!	Mem[0000000010141410] = 0000004a, %l5 = 000000000000ed1c
	ldsba	[%i5+0x013]%asi,%l5	! %l5 = 000000000000004a
!	Mem[0000000010041410] = 91800000 91800000, %l6 = 91800000, %l7 = 0000004a
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 0000000091800000 0000000091800000
!	Mem[0000000030181410] = 57ff03e6 925f0000, %l0 = e8570f6c, %l1 = 00003266
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000925f0000 0000000057ff03e6
!	Mem[0000000010141410] = 0000004a, %l5 = 000000000000004a
	ldub	[%i5+0x011],%l5		! %l5 = 0000000000000000
!	Mem[0000000030141400] = ff000000 00000061 000038eb e8570f6c
!	Mem[0000000030141410] = c0780000 ffff00be 9ec3138e 27920983
!	Mem[0000000030141420] = 65528a93 8a570786 f54cc84b 399c4442
!	Mem[0000000030141430] = eef66bda 555c9ceb c965974b f7fdaf8a
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000010041408] = 00000046, %l7 = 0000000091800000
	ldswa	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000046
!	Mem[0000000010081410] = bd25a676b9d51fc2, %f4  = be00ffff 000078c0
	ldda	[%i2+%o5]0x80,%f4 	! %f4  = bd25a676 b9d51fc2
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010001400] = beac92e8
	stha	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 000092e8

p0_label_78:
!	%l1 = 0000000057ff03e6, Mem[00000000100c1400] = ffffffff
	stba	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = e6ffffff
!	%f12 = eb9c5c55 da6bf6ee, Mem[0000000010081410] = 76a625bd c21fd5b9
	stda	%f12,[%i2+%o5]0x88	! Mem[0000000010081410] = eb9c5c55 da6bf6ee
!	%f8  = 8607578a 938a5265, %l0 = 00000000925f0000
!	Mem[0000000010181410] = 0000000000000011
	add	%i6,0x010,%g1
	stda	%f8,[%g1+%l0]ASI_PST16_P ! Mem[0000000010181410] = 0000000000000011
!	%f13 = da6bf6ee, Mem[0000000010101410] = ff00ff00
	sta	%f13,[%i4+%o5]0x80	! Mem[0000000010101410] = da6bf6ee
!	%l6 = 0000000091800000, Mem[0000000010181400] = ff714778
	stwa	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 91800000
!	Mem[00000000100c1400] = e6ffffff, %l3 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000e6ffffff
!	%l3 = 00000000e6ffffff, Mem[0000000020800041] = 81ffe22a
	stb	%l3,[%o1+0x041]		! Mem[0000000020800040] = 81ffe22a
!	Mem[0000000010041430] = c07861ec, %l7 = 0000000000000046
	ldstub	[%i1+0x030],%l7		! %l7 = 000000c0000000ff
!	%l6 = 91800000, %l7 = 000000c0, Mem[0000000030001410] = ff000000 0000ff00
	stda	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 91800000 000000c0
!	Starting 10 instruction Load Burst
!	Mem[0000000010141424] = 1cede55e, %l6 = 0000000091800000
	ldub	[%i5+0x027],%l6		! %l6 = 000000000000005e

p0_label_79:
!	Mem[00000000300c1400] = ebdc3bf1, %l7 = 00000000000000c0
	lduha	[%i3+%g0]0x81,%l7	! %l7 = 000000000000ebdc
!	Mem[0000000010181418] = da00b270, %l2 = 0000000000000000
	ldswa	[%i6+0x018]%asi,%l2	! %l2 = ffffffffda00b270
!	Mem[0000000030181408] = 721bffd2, %l3 = 00000000e6ffffff
	lduba	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000d2
!	Mem[0000000010141400] = 00000000, %l0 = 00000000925f0000
	ldswa	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010101400] = 00000000 00000000 3266d8ff 00000004
!	Mem[0000000010101410] = da6bf6ee 138ecbae d2ff1b72 6889dceb
!	Mem[0000000010101420] = 3b7829f2 c443b9a4 bfa28d72 62051572
!	Mem[0000000010101430] = 190d7dd8 c443b9a4 c9c7befc 3d04de1c
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000010001410] = 5ee5ed1c, %l3 = 00000000000000d2
	ldsba	[%i0+%o5]0x80,%l3	! %l3 = 000000000000005e
!	Mem[0000000030081408] = ffffff98, %l0 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001400] = e8920000, %l4 = 000000006e0b7f3a
	lduwa	[%i0+%g0]0x88,%l4	! %l4 = 00000000e8920000
!	Mem[00000000100c1400] = 000000ff, %f5  = b9d51fc2
	lda	[%i3+%g0]0x80,%f5 	! %f5 = 000000ff
!	Starting 10 instruction Store Burst
!	%l0 = ffffffff, %l1 = 57ff03e6, Mem[0000000010001408] = 610000ff d95dfa9e
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff 57ff03e6

p0_label_80:
!	%f10 = 42449c39 4bc84cf5, Mem[00000000100c1408] = 66d2aa05 584d6af8
	stda	%f10,[%i3+%o4]0x88	! Mem[00000000100c1408] = 42449c39 4bc84cf5
!	Mem[0000000030081408] = ffffff98, %l4 = 00000000e8920000
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 00000000ffffff98
!	%f10 = 42449c39 4bc84cf5, Mem[00000000100c1410] = ff57317c ff00bad0
	stda	%f10,[%i3+%o5]0x80	! Mem[00000000100c1410] = 42449c39 4bc84cf5
!	%f0  = 61000000 000000ff, Mem[0000000030101410] = a625bcc7 ffa6c4bb
	stda	%f0 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 61000000 000000ff
!	%l6 = 000000000000005e, Mem[0000000010181409] = 00000000, %asi = 80
	stba	%l6,[%i6+0x009]%asi	! Mem[0000000010181408] = 005e0000
!	%f10 = 42449c39 4bc84cf5, Mem[0000000010001438] = bad062da e18eb258
	std	%f10,[%i0+0x038]	! Mem[0000000010001438] = 42449c39 4bc84cf5
!	Code Fragment 3
p0_fragment_4:
!	%l0 = ffffffffffffffff
	setx	0xf1f7e80817be66eb,%g7,%l0 ! %l0 = f1f7e80817be66eb
!	%l1 = 0000000057ff03e6
	setx	0x328d17906856b1ce,%g7,%l1 ! %l1 = 328d17906856b1ce
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f1f7e80817be66eb
	setx	0xb86b0dbff6dd49dc,%g7,%l0 ! %l0 = b86b0dbff6dd49dc
!	%l1 = 328d17906856b1ce
	setx	0xbee9cf786eec2c6d,%g7,%l1 ! %l1 = bee9cf786eec2c6d
!	%l5 = 0000000000000000, Mem[0000000030001400] = ff000000
	stwa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%f8  = 8607578a 938a5265, Mem[00000000300c1408] = 682d6061 5d000000
	stda	%f8 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 8607578a 938a5265
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = d2ff1b72, %l6 = 000000000000005e
	ldsba	[%i6+%o4]0x81,%l6	! %l6 = ffffffffffffffd2

p0_label_81:
!	Mem[0000000021800140] = 9f38e548, %l5 = 0000000000000000
	ldsha	[%o3+0x140]%asi,%l5	! %l5 = ffffffffffff9f38
!	Mem[0000000010001420] = 7257317c, %l1 = bee9cf786eec2c6d
	ldsh	[%i0+0x020],%l1		! %l1 = 0000000000007257
!	Mem[0000000030081410] = 05aad266 4a000000, %l4 = ffffff98, %l5 = ffff9f38
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 000000004a000000 0000000005aad266
!	Mem[0000000010181400] = 91800000, %l3 = 000000000000005e
	ldswa	[%i6+%g0]0x80,%l3	! %l3 = ffffffff91800000
!	Code Fragment 3
p0_fragment_5:
!	%l0 = b86b0dbff6dd49dc
	setx	0x95eb0c67abc9d484,%g7,%l0 ! %l0 = 95eb0c67abc9d484
!	%l1 = 0000000000007257
	setx	0x31f523df96bc4de5,%g7,%l1 ! %l1 = 31f523df96bc4de5
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 95eb0c67abc9d484
	setx	0x2697aaffdabdb2e5,%g7,%l0 ! %l0 = 2697aaffdabdb2e5
!	%l1 = 31f523df96bc4de5
	setx	0x512004e7e4917b9a,%g7,%l1 ! %l1 = 512004e7e4917b9a
!	Mem[0000000030101408] = 1c5b3900, %l6 = ffffffffffffffd2
	lduwa	[%i4+%o4]0x89,%l6	! %l6 = 000000001c5b3900
!	Mem[0000000030081408] = e8920000, %f14 = 8aaffdf7
	lda	[%i2+%o4]0x81,%f14	! %f14 = e8920000
!	Mem[0000000030001410] = c000000000008091, %l5 = 0000000005aad266
	ldxa	[%i0+%o5]0x89,%l5	! %l5 = c000000000008091
!	Mem[00000000300c1410] = ff0000ff, %f4  = bd25a676
	lda	[%i3+%o5]0x81,%f4 	! %f4 = ff0000ff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (15)
!	%l0 = dabdb2e5, %l1 = e4917b9a, Mem[0000000010101410] = da6bf6ee 138ecbae
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = dabdb2e5 e4917b9a

p0_label_82:
!	%l7 = 000000000000ebdc, Mem[0000000020800041] = 81ffe22a, %asi = 80
	stba	%l7,[%o1+0x041]%asi	! Mem[0000000020800040] = 81dce22a
!	%f8  = 8607578a 938a5265, Mem[0000000010101400] = 00000000 00000000
	stda	%f8 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 8607578a 938a5265
!	%l0 = 2697aaffdabdb2e5, Mem[00000000100c1410] = 42449c39
	stba	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = e5449c39
!	Mem[0000000030001408] = ffffd266, %l7 = 000000000000ebdc
	swapa	[%i0+%o4]0x81,%l7	! %l7 = 00000000ffffd266
!	Mem[00000000100c1408] = 4bc84cf5, %l3 = ffffffff91800000
	swapa	[%i3+%o4]0x88,%l3	! %l3 = 000000004bc84cf5
!	Mem[00000000201c0001] = ff614c16, %l2 = ffffffffda00b270
	ldstub	[%o0+0x001],%l2		! %l2 = 00000061000000ff
!	%l1 = 512004e7e4917b9a, Mem[0000000020800000] = 98ff5a05
	stb	%l1,[%o1+%g0]		! Mem[0000000020800000] = 9aff5a05
!	%l3 = 000000004bc84cf5, Mem[0000000030041408] = eb38ab21
	stba	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = f538ab21
!	Mem[00000000300c1408] = 938a5265, %l3 = 000000004bc84cf5
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 00000065000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00008091, %l7 = 00000000ffffd266
	lduba	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000091

p0_label_83:
!	Mem[0000000010181438] = 8d8f53b0 a62b4ec4, %l0 = dabdb2e5, %l1 = e4917b9a
	ldda	[%i6+0x038]%asi,%l0	! %l0 = 000000008d8f53b0 00000000a62b4ec4
!	Mem[00000000300c1400] = f13bdceb, %l2 = 0000000000000061
	ldswa	[%i3+%g0]0x89,%l2	! %l2 = fffffffff13bdceb
!	Mem[0000000030141410] = c0780000, %l2 = fffffffff13bdceb
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000c0
!	Mem[0000000010041400] = 00000000, %f8  = 8607578a
	lda	[%i1+%g0]0x88,%f8 	! %f8 = 00000000
!	Mem[0000000030041410] = bd25a676 ff000000, %l6 = 1c5b3900, %l7 = 00000091
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 00000000ff000000 00000000bd25a676
!	Mem[00000000218000c0] = 3a0fcd1f, %l6 = 00000000ff000000
	ldsb	[%o3+0x0c1],%l6		! %l6 = 000000000000000f
!	Mem[0000000030181408] = d2ff1b72, %f26 = bfa28d72
	lda	[%i6+%o4]0x81,%f26	! %f26 = d2ff1b72
!	Mem[0000000030001408] = 00395b1c dceb0000, %l6 = 0000000f, %l7 = bd25a676
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000dceb0000 0000000000395b1c
!	Mem[00000000100c1408] = 91800000, %l0 = 000000008d8f53b0
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000c0, Mem[0000000030141410] = 000078c0
	stwa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000c0

p0_label_84:
!	%f0  = 61000000, Mem[0000000010181408] = 00005e00
	sta	%f0 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 61000000
!	Mem[00000000100c1410] = e5449c39, %l2 = 00000000000000c0
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 00000000e5449c39
!	%l1 = 00000000a62b4ec4, Mem[0000000010041400] = 61f5e1f300000000
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000a62b4ec4
!	Mem[00000000300c1400] = ebdc3bf1, %l3 = 0000000000000065
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 00000000ebdc3bf1
!	Mem[0000000010081404] = ffffffff, %l0 = 0000000000000000, %asi = 80
	swapa	[%i2+0x004]%asi,%l0	! %l0 = 00000000ffffffff
!	%l2 = e5449c39, %l3 = ebdc3bf1, Mem[0000000010001430] = 1c5ba276 a625bcc7
	stda	%l2,[%i0+0x030]%asi	! Mem[0000000010001430] = e5449c39 ebdc3bf1
!	Mem[0000000030141408] = eb380000, %l1 = 00000000a62b4ec4
	swapa	[%i5+%o4]0x89,%l1	! %l1 = 00000000eb380000
!	%f24 = 3b7829f2, Mem[0000000030081400] = 584d6af8
	sta	%f24,[%i2+%g0]0x81	! Mem[0000000030081400] = 3b7829f2
!	%f2  = 6c0f57e8 eb380000, Mem[0000000030141408] = a62b4ec4 6c0f57e8
	stda	%f2 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 6c0f57e8 eb380000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 05aa00ff, %l1 = 00000000eb380000
	lduha	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff

p0_label_85:
!	Mem[0000000030141400] = 000000ff, %l7 = 0000000000395b1c
	lduha	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041408] = f538ab21dadb7aee, %l5 = c000000000008091
	ldxa	[%i1+%o4]0x81,%l5	! %l5 = f538ab21dadb7aee
!	Mem[0000000010181400] = 91800000, %l0 = 00000000ffffffff
	ldsb	[%i6+0x002],%l0		! %l0 = 0000000000000000
!	Mem[0000000010101400] = 8607578a938a5265, %f0  = 61000000 000000ff
	ldda	[%i4+%g0]0x88,%f0 	! %f0  = 8607578a 938a5265
!	Mem[0000000010101410] = 9a7b91e4e5b2bdda, %l5 = f538ab21dadb7aee
	ldxa	[%i4+%o5]0x88,%l5	! %l5 = 9a7b91e4e5b2bdda
!	Mem[000000001000143c] = 4bc84cf5, %l4 = 000000004a000000
	lduw	[%i0+0x03c],%l4		! %l4 = 000000004bc84cf5
!	Mem[0000000030041400] = 00000046, %l1 = 00000000000000ff
	ldsha	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 65528a938a570786, %f20 = da6bf6ee 138ecbae
	ldd	[%i4+%g0],%f20		! %f20 = 65528a93 8a570786
!	Mem[0000000021800140] = 9f38e548, %l3 = 00000000ebdc3bf1
	ldsb	[%o3+0x141],%l3		! %l3 = 0000000000000038
!	Starting 10 instruction Store Burst
!	%l6 = 00000000dceb0000, Mem[0000000010041408] = 4600000068000000
	stxa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000dceb0000

p0_label_86:
!	%l0 = 0000000000000000, Mem[0000000030181408] = d2ff1b72
	stba	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00ff1b72
!	Mem[0000000010141400] = 00000000, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 00ff1b72, %l3 = 0000000000000038
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 0000000000ff1b72
!	%l6 = dceb0000, %l7 = 000000ff, Mem[0000000030001400] = 00000000 3c8bffff
	stda	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = dceb0000 000000ff
!	%l2 = 00000000e5449c39, Mem[0000000010181408] = 00000061
	stha	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 9c390061
!	Mem[0000000010041404] = 00000000, %l5 = e5b2bdda, %l4 = 4bc84cf5
	add	%i1,0x04,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 0000000000000000
!	%f26 = d2ff1b72 62051572, Mem[0000000010181420] = c21fd5b9 000000ff
	stda	%f26,[%i6+0x020]%asi	! Mem[0000000010181420] = d2ff1b72 62051572
!	Mem[0000000030181410] = 00005f92, %l7 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181418] = da00b270, %l0 = 00000000, %l1 = 00000000
	add	%i6,0x18,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 00000000da00b270
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 1c5b3900, %f30 = c9c7befc
	lda	[%i4+%o4]0x89,%f30	! %f30 = 1c5b3900

p0_label_87:
!	Mem[00000000300c1408] = 8607578a938a52ff, %f4  = ff0000ff 000000ff
	ldda	[%i3+%o4]0x89,%f4 	! %f4  = 8607578a 938a52ff
!	Mem[0000000010101424] = c443b9a4, %l3 = 0000000000ff1b72
	ldsba	[%i4+0x024]%asi,%l3	! %l3 = ffffffffffffffc4
!	Mem[0000000030081400] = 3b7829f2 243e276f, %l2 = e5449c39, %l3 = ffffffc4
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 000000003b7829f2 00000000243e276f
!	Mem[0000000010141438] = b366fae99f339182, %f16 = 00000000 00000000
	ldd	[%i5+0x038],%f16	! %f16 = b366fae9 9f339182
!	Mem[00000000201c0000] = ffff4c16, %l7 = 0000000000000000
	ldsba	[%o0+0x001]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041408] = 00000000, %l0 = 0000000000000000
	ldsba	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141414] = 0000ff00, %l1 = 00000000da00b270
	ldsw	[%i5+0x014],%l1		! %l1 = 000000000000ff00
!	Mem[0000000030181400] = 000000ff, %f23 = 6889dceb
	lda	[%i6+%g0]0x81,%f23	! %f23 = 000000ff
!	Mem[0000000020800000] = 9aff5a05, %l2 = 000000003b7829f2
	lduha	[%o1+0x000]%asi,%l2	! %l2 = 0000000000009aff
!	Starting 10 instruction Store Burst
!	%f24 = 3b7829f2 c443b9a4, Mem[0000000010081408] = 00008091 4a000000
	stda	%f24,[%i2+%o4]0x88	! Mem[0000000010081408] = 3b7829f2 c443b9a4

p0_label_88:
!	Mem[0000000010001410] = 5ee5ed1c, %l6 = 00000000dceb0000
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 0000005e000000ff
!	Mem[0000000030041408] = f538ab21, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 000000f5000000ff
!	Mem[00000000300c1410] = ff0000ff, %l1 = 000000000000ff00
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010181428] = 232919fa, %l6 = 000000000000005e
	swap	[%i6+0x028],%l6		! %l6 = 00000000232919fa
!	Mem[0000000010141410] = 4a000000, %l7 = ffffffffffffffff
	swapa	[%i5+%o5]0x88,%l7	! %l7 = 000000004a000000
!	Mem[0000000030081400] = f229783b, %l6 = 00000000232919fa
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 00000000f229783b
!	Mem[0000000030041400] = 46000000, %l7 = 000000004a000000
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 0000000046000000
!	Mem[00000000300c1408] = ff528a93, %l1 = 00000000000000ff
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ff528a93
!	%f10 = 42449c39, Mem[0000000030041400] = 0000004a
	sta	%f10,[%i1+%g0]0x81	! Mem[0000000030041400] = 42449c39
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffffffff, %l1 = 00000000ff528a93
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffffffff

p0_label_89:
!	Mem[0000000010101400] = 65528a93, %f21 = 8a570786
	lda	[%i4+%g0]0x80,%f21	! %f21 = 65528a93
!	Mem[0000000010101400] = 8607578a938a5265, %l4 = 00000000000000f5
	ldxa	[%i4+%g0]0x88,%l4	! %l4 = 8607578a938a5265
!	Mem[0000000030001400] = 0000ebdc, %l4 = 8607578a938a5265
	lduba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 0000000000001100, %f10 = 42449c39 4bc84cf5
	ldda	[%i5+%g0]0x80,%f10	! %f10 = 00000000 00001100
!	Mem[0000000010001400] = 000092e8, %l7 = 0000000046000000
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = ffff8b3c, %l3 = 00000000243e276f
	ldswa	[%i2+%g0]0x88,%l3	! %l3 = ffffffffffff8b3c
!	Mem[0000000030041400] = 399c4442, %l6 = 00000000f229783b
	lduba	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000042
!	Mem[0000000010101410] = e5b2bdda, %l1 = ffffffffffffffff
	ldsha	[%i4+%o5]0x88,%l1	! %l1 = ffffffffffffbdda
!	Mem[000000001000141c] = 00000000, %l7 = 0000000000000000
	lduwa	[%i0+0x01c]%asi,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 9a7b91e4e5b2bdda, Mem[0000000010181412] = 00000000, %asi = 80
	stha	%l5,[%i6+0x012]%asi	! Mem[0000000010181410] = 0000bdda

p0_label_90:
!	Mem[00000000211c0000] = ffff6986, %l2 = 0000000000009aff
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010101410] = e5b2bdda, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 00000000e5b2bdda
!	%f12 = eb9c5c55 da6bf6ee, %l4 = 0000000000000000
!	Mem[0000000030041410] = 000000ff76a625bd
	add	%i1,0x010,%g1
	stda	%f12,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030041410] = 000000ff76a625bd
!	Mem[0000000030081400] = 232919fa, %l6 = 0000000000000042
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 00000000232919fa
!	%l6 = 00000000232919fa, Mem[0000000010001410] = 000028561cede5ff
	stxa	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000232919fa
!	%l5 = 9a7b91e4e5b2bdda, Mem[00000000201c0000] = ffff4c16
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = bdda4c16
!	%l2 = 000000ff, %l3 = ffff8b3c, Mem[0000000030181408] = 00000038 6889dceb
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ff ffff8b3c
!	%l5 = 9a7b91e4e5b2bdda, Mem[0000000010101400] = 8607578a938a5265
	stxa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 9a7b91e4e5b2bdda
!	%l0 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 11000000dabd0000, %f14 = e8920000 4b9765c9
	ldda	[%i6+%o5]0x88,%f14	! %f14 = 11000000 dabd0000

p0_label_91:
!	Mem[0000000010001410] = 00000000232919fa, %f22 = d2ff1b72 000000ff
	ldda	[%i0+%o5]0x88,%f22	! %f22 = 00000000 232919fa
!	Mem[0000000010141400] = 00000000 00001100, %l0 = 00000000, %l1 = ffffbdda
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000 0000000000001100
!	Mem[0000000010181408] = 9c390061, %l2 = 00000000000000ff
	ldub	[%i6+%o4],%l2		! %l2 = 000000000000009c
!	Mem[00000000100c1408] = 42449c3991800000, %l4 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l4	! %l4 = 42449c3991800000
!	Mem[0000000010001414] = 00000000, %l2 = 000000000000009c
	lduwa	[%i0+0x014]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = 00008091, %l4 = 42449c3991800000
	lduha	[%i0+%o5]0x89,%l4	! %l4 = 0000000000008091
!	Mem[0000000010181408] = 9c390061, %l1 = 0000000000001100
	ldsba	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffffff9c
!	Mem[00000000211c0000] = ffff6986, %l6 = 00000000232919fa
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000020800000] = 9aff5a05, %l6 = 000000000000ffff
	lduh	[%o1+%g0],%l6		! %l6 = 0000000000009aff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 0000ebdc, %l4 = 0000000000008091
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 000000000000ebdc

p0_label_92:
!	Mem[0000000030081410] = 4a000000, %l3 = ffffffffffff8b3c
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%f27 = 62051572, Mem[0000000010041420] = 258da68d
	sta	%f27,[%i1+0x020]%asi	! Mem[0000000010041420] = 62051572
!	%f30 = 1c5b3900 3d04de1c, Mem[0000000010041400] = c44e2ba6 00000000
	stda	%f30,[%i1+%g0]0x80	! Mem[0000000010041400] = 1c5b3900 3d04de1c
!	%l7 = 00000000e5b2bdda, Mem[0000000010001410] = 232919fa
	stha	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 2329bdda
!	Mem[00000000100c1420] = bb8cf8b6, %l6 = 0000000000009aff, %asi = 80
	swapa	[%i3+0x020]%asi,%l6	! %l6 = 00000000bb8cf8b6
!	%f9  = 938a5265, Mem[0000000010101400] = e5b2bdda
	sta	%f9 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 938a5265
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030141410] = c0000000 ffff00be
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 00000000
!	Mem[0000000030041400] = 399c4442, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l2	! %l2 = 00000000399c4442
!	%l2 = 399c4442, %l3 = 00000000, Mem[0000000030041410] = ff000000 bd25a676
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 399c4442 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00395b1c91800000, %f4  = 8607578a 938a52ff
	ldda	[%i0+%o4]0x89,%f4 	! %f4  = 00395b1c 91800000

p0_label_93:
!	Mem[0000000010041400] = 1c5b3900, %l7 = 00000000e5b2bdda
	lduwa	[%i1+%g0]0x80,%l7	! %l7 = 000000001c5b3900
!	Mem[0000000030081410] = ff00004a, %l2 = 00000000399c4442
	lduba	[%i2+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = 65528a93, %l3 = 0000000000000000
	lduha	[%i4+%g0]0x80,%l3	! %l3 = 0000000000006552
!	Mem[0000000010181400] = 91800000, %l4 = 000000000000ebdc
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 0000000000009180
!	Mem[0000000021800180] = ffffca0d, %l6 = 00000000bb8cf8b6
	lduha	[%o3+0x180]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010041408] = 00000000, %l1 = ffffffffffffff9c
	ldsha	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 05aa00ff, %l7 = 000000001c5b3900
	ldsba	[%i5+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081400] = ffff8b3c, %l2 = 00000000000000ff
	ldswa	[%i2+%g0]0x88,%l2	! %l2 = ffffffffffff8b3c
!	Mem[0000000010041408] = 00000000, %f4  = 00395b1c
	lda	[%i1+%o4]0x80,%f4 	! %f4 = 00000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030141408] = 000038eb e8570f6c
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000 00000000

p0_label_94:
!	Mem[0000000030081400] = 00000042, %l2 = ffffffffffff8b3c
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 00000042000000ff
!	%f24 = 3b7829f2 c443b9a4, Mem[0000000030101400] = 925ff8ff 00000000
	stda	%f24,[%i4+%g0]0x89	! Mem[0000000030101400] = 3b7829f2 c443b9a4
!	Mem[00000000100c1408] = 00008091, %l4 = 0000000000009180
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l7 = ffffffffffffffff, Mem[0000000010041410] = 91800000, %asi = 80
	stha	%l7,[%i1+0x010]%asi	! Mem[0000000010041410] = ffff0000
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 0000000000000000
	setx	0xd7be9f300e6f2628,%g7,%l0 ! %l0 = d7be9f300e6f2628
!	%l1 = 0000000000000000
	setx	0x3cd1173012d15197,%g7,%l1 ! %l1 = 3cd1173012d15197
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d7be9f300e6f2628
	setx	0x040cfddfac42c1b0,%g7,%l0 ! %l0 = 040cfddfac42c1b0
!	%l1 = 3cd1173012d15197
	setx	0xc8780f505b2b0569,%g7,%l1 ! %l1 = c8780f505b2b0569
!	%f8  = 00000000 938a5265, %l2 = 0000000000000042
!	Mem[0000000010141438] = b366fae99f339182
	add	%i5,0x038,%g1
	stda	%f8,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010141438] = b366fae900000000
!	%l4 = 0000000000000000, Mem[0000000010101415] = e4917b9a
	stb	%l4,[%i4+0x015]		! Mem[0000000010101414] = e4007b9a
!	Mem[0000000010081400] = ffff8b3c, %l5 = 9a7b91e4e5b2bdda
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 00000000ffff8b3c
!	Mem[0000000030081408] = e8920000, %l6 = 000000000000ffff
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 00000000e8920000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffffffff e603ff57, %l4 = 00000000, %l5 = ffff8b3c
	ldd	[%i0+%o4],%l4		! %l4 = 00000000ffffffff 00000000e603ff57

p0_label_95:
!	Mem[00000000300c1400] = 65000000, %l2 = 0000000000000042
	ldsha	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = ff0000ff, %l6 = 00000000e8920000
	ldsha	[%i3+%o5]0x81,%l6	! %l6 = ffffffffffffff00
!	%l3 = 0000000000006552, immd = 0000000000000913, %l4 = 00000000ffffffff
	udivx	%l3,0x913,%l4		! %l4 = 000000000000000b
!	Mem[0000000010141408] = 05aa00ff, %l1 = c8780f505b2b0569
	lduwa	[%i5+%o4]0x88,%l1	! %l1 = 0000000005aa00ff
!	Mem[0000000030081408] = 0000ffff, %l3 = 0000000000006552
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 42449c39918000ff, %f26 = d2ff1b72 62051572
	ldda	[%i3+%o4]0x88,%f26	! %f26 = 42449c39 918000ff
!	Mem[0000000010101438] = c9c7befc, %f4  = 00000000
	ld	[%i4+0x038],%f4 	! %f4 = c9c7befc
!	Mem[0000000010001400] = e8920000, %f5  = 91800000
	lda	[%i0+%g0]0x88,%f5 	! %f5 = e8920000
!	Mem[0000000030041410] = 399c4442, %l4 = 000000000000000b
	lduba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000042
!	Starting 10 instruction Store Burst
!	%l4 = 00000042, %l5 = e603ff57, Mem[0000000030101400] = a4b943c4 f229783b
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000042 e603ff57

p0_label_96:
!	Mem[0000000021800040] = 02564da2, %l5 = 00000000e603ff57
	ldstuba	[%o3+0x040]%asi,%l5	! %l5 = 00000002000000ff
!	%l6 = ffffffffffffff00, Mem[0000000030001408] = 00008091
	stwa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffff00
!	%l5 = 0000000000000002, Mem[0000000020800040] = 81dce22a
	stb	%l5,[%o1+0x040]		! Mem[0000000020800040] = 02dce22a
!	Mem[0000000010101410] = 00000000, %l0 = 040cfddfac42c1b0
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%f13 = da6bf6ee, Mem[0000000010041410] = ffff0000
	sta	%f13,[%i1+0x010]%asi	! Mem[0000000010041410] = da6bf6ee
!	%l0 = 0000000000000000, Mem[0000000010181400] = 91800000565da7da
	stxa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000000
!	%l5 = 0000000000000002, Mem[0000000030001410] = 91800000
	stha	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00020000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010081410] = eef66bda 555c9ceb
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 00000000
!	%l0 = 0000000000000000, Mem[000000001004142c] = df72ad82
	stb	%l0,[%i1+0x02c]		! Mem[000000001004142c] = 0072ad82
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 05aa00ff, %l2 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = ffffffffffffffff

p0_label_97:
!	Mem[00000000201c0000] = bdda4c16, %l2 = ffffffffffffffff
	ldsh	[%o0+%g0],%l2		! %l2 = ffffffffffffbdda
!	Mem[0000000030101410] = 00000061, %l2 = ffffffffffffbdda
	ldsba	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000061
!	Mem[0000000021800080] = 00ff64ec, %l7 = ffffffffffffffff
	lduh	[%o3+0x080],%l7		! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010001400] = 000092e8 682d1100 ffffffff e603ff57
!	Mem[0000000010001410] = dabd2923 00000000 a7ff3bf1 00000000
!	Mem[0000000010001420] = 7257317c ff00bad0 0a5dde72 2c0880e7
!	Mem[0000000010001430] = e5449c39 ebdc3bf1 42449c39 4bc84cf5
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Mem[0000000021800080] = 00ff64ec, %l5 = 0000000000000002
	lduba	[%o3+0x081]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1408] = 8607578aff000000, %f24 = 3b7829f2 c443b9a4
	ldda	[%i3+%o4]0x89,%f24	! %f24 = 8607578a ff000000
!	Mem[0000000030041408] = 21ab38ff, %l7 = 00000000000000ff
	ldsba	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101400] = 00000042 e603ff57 00395b1c 66d2aa05
!	Mem[0000000030101410] = 61000000 000000ff d0fdec68 8bde857b
!	Mem[0000000030101420] = caba3b13 3ac60ea0 488fdd58 e8080f6c
!	Mem[0000000030101430] = 2a76800a 89361fca 8d8f53b0 a62b4ec4
	ldda	[%i4]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030101400
!	Mem[0000000030181408] = 000000ffffff8b3c, %l5 = 00000000000000ff
	ldxa	[%i6+%o4]0x81,%l5	! %l5 = 000000ffffff8b3c
!	Starting 10 instruction Store Burst
!	Mem[0000000010101430] = 190d7dd8, %l2 = 0000000000000061, %asi = 80
	swapa	[%i4+0x030]%asi,%l2	! %l2 = 00000000190d7dd8

p0_label_98:
!	Mem[00000000100c1408] = 918000ff, %l4 = 0000000000000042
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%f2  = ffffffff e603ff57, %l7 = ffffffffffffffff
!	Mem[0000000030081400] = ff000000243e276f
	stda	%f2,[%i2+%l7]ASI_PST8_SL ! Mem[0000000030081400] = 57ff03e6ffffffff
!	Mem[0000000030041410] = 399c4442, %l1 = 0000000005aa00ff
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 00000000399c4442
!	Mem[0000000030041400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010081400] = 00000000e5b2bdda
	stxa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000000
!	Mem[00000000100c1408] = ff008091, %l3 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010081400] = 00000000
	stwa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	Mem[0000000010141408] = ff00aa05000000be, %l4 = 00000000000000ff, %l6 = ffffffffffffff00
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = ff00aa05000000be
!	%l6 = ff00aa05000000be, Mem[00000000100c1410] = 000000c04bc84cf5
	stxa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff00aa05000000be
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010101400] = 65528a93 e4917b9a 3266d8ff 00000004
!	Mem[0000000010101410] = ff000000 e4007b9a d2ff1b72 6889dceb
!	Mem[0000000010101420] = 3b7829f2 c443b9a4 bfa28d72 62051572
!	Mem[0000000010101430] = 00000061 c443b9a4 c9c7befc 3d04de1c
	ldda	[%i4]ASI_BLK_AIUP,%f0	! Block Load from 0000000010101400

p0_label_99:
!	Mem[0000000030001408] = 00ffffff, %l7 = ffffffffffffffff
	ldswa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000ffffff
!	Mem[0000000030041408] = ff38ab21, %l6 = ff00aa05000000be
	ldsba	[%i1+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041408] = 00000000, %l1 = 00000000399c4442
	ldswa	[%i1+0x008]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 1c5b3900 3d04de1c 00000000 dceb0000
!	Mem[0000000010041410] = da6bf6ee 91800000 c1821f24 2c4f74a5
!	Mem[0000000010041420] = 62051572 8c5598cb 8b034fc9 0072ad82
!	Mem[0000000010041430] = ff7861ec 4d0654cd 4791ccb6 87452406
	ldda	[%i1]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010041400
!	Mem[0000000030141400] = 61000000000000ff, %f20 = ff000000 00000061
	ldda	[%i5+%g0]0x89,%f20	! %f20 = 61000000 000000ff
!	%l6 = ffffffffffffffff, %l2 = 00000000190d7dd8, %l0 = 0000000000000000
	sub	%l6,%l2,%l0		! %l0 = ffffffffe6f28227
!	Mem[0000000030081400] = 57ff03e6, %l1 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l1	! %l1 = 0000000057ff03e6
!	Mem[0000000010101428] = bfa28d72, %l2 = 00000000190d7dd8
	lduh	[%i4+0x02a],%l2		! %l2 = 0000000000008d72
!	Mem[0000000010141410] = ffffffff, %l2 = 0000000000008d72
	lduha	[%i5+%o5]0x88,%l2	! %l2 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f20 = 61000000, Mem[0000000030101408] = 00395b1c
	sta	%f20,[%i4+%o4]0x81	! Mem[0000000030101408] = 61000000

p0_label_100:
!	%f30 = c44e2ba6 b0538f8d, %l1 = 0000000057ff03e6
!	Mem[0000000030181400] = 000000ff00000000
	stda	%f30,[%i6+%l1]ASI_PST8_S ! Mem[0000000030181400] = c44e2bff00538f00
!	%l4 = 00000000000000ff, Mem[0000000010141408] = 05aa00ff
	stha	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 05aa00ff
!	%l5 = 000000ffffff8b3c, Mem[0000000010001408] = ffffffff
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = ffff8b3c
!	%l0 = ffffffffe6f28227, Mem[0000000030101408] = 61000000
	stha	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 82270000
!	%f30 = c44e2ba6, Mem[0000000010081400] = 000000ff
	sta	%f30,[%i2+%g0]0x88	! Mem[0000000010081400] = c44e2ba6
!	%f18 = 05aad266, Mem[0000000030141408] = 00000000
	sta	%f18,[%i5+%o4]0x89	! Mem[0000000030141408] = 05aad266
!	Mem[0000000010041400] = 00395b1c, %l5 = 000000ffffff8b3c
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 0000000000395b1c
!	Mem[0000000010001404] = 682d1100, %l4 = 00000000000000ff
	swap	[%i0+0x004],%l4		! %l4 = 00000000682d1100
!	%l6 = ffffffffffffffff, Mem[0000000010081400] = a62b4ec400000000
	stxa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141424] = 1cede55e, %l5 = 0000000000395b1c
	lduwa	[%i5+0x024]%asi,%l5	! %l5 = 000000001cede55e

p0_label_101:
!	Mem[000000001014141c] = bc71357b, %l0 = ffffffffe6f28227
	ldsw	[%i5+0x01c],%l0		! %l0 = ffffffffbc71357b
!	Mem[0000000030041408] = ee7adbda21ab38ff, %l4 = 00000000682d1100
	ldxa	[%i1+%o4]0x89,%l4	! %l4 = ee7adbda21ab38ff
!	Mem[0000000010181418] = da00b270, %l6 = ffffffffffffffff
	lduw	[%i6+0x018],%l6		! %l6 = 00000000da00b270
!	Mem[0000000030081408] = 0000ffff, %l3 = 00000000000000ff
	lduwa	[%i2+%o4]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030001410] = c000000000000200, %f26 = 6c0f08e8 58dd8f48
	ldda	[%i0+%o5]0x89,%f26	! %f26 = c0000000 00000200
!	Mem[0000000010081438] = ff9ec5ea baecbc6e, %l0 = bc71357b, %l1 = 57ff03e6
	ldd	[%i2+0x038],%l0		! %l0 = 00000000ff9ec5ea 00000000baecbc6e
!	Mem[0000000030081408] = 5f5eb213ffff0000, %l2 = 000000000000ffff
	ldxa	[%i2+%o4]0x89,%l2	! %l2 = 5f5eb213ffff0000
!	Mem[00000000201c0000] = bdda4c16, %l2 = 5f5eb213ffff0000
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000da
!	Mem[0000000010181410] = 11000000dabd0000, %l2 = 00000000000000da
	ldxa	[%i6+%o5]0x88,%l2	! %l2 = 11000000dabd0000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 6100399c, %l7 = 0000000000ffffff
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 0000009c000000ff

p0_label_102:
!	%f28 = ca1f3689 0a80762a, Mem[0000000030081410] = ff00004a 66d2aa05
	stda	%f28,[%i2+%o5]0x81	! Mem[0000000030081410] = ca1f3689 0a80762a
!	Mem[0000000030101410] = 00000061, %l3 = 000000000000ffff
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000061
!	%l0 = ff9ec5ea, %l1 = baecbc6e, Mem[0000000010001408] = ffff8b3c 57ff03e6
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = ff9ec5ea baecbc6e
!	Mem[0000000030101410] = 0000ffff, %l6 = 00000000da00b270
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000211c0001] = ffff6986, %l4 = ee7adbda21ab38ff
	ldstub	[%o2+0x001],%l4		! %l4 = 000000ff000000ff
!	Mem[0000000010181408] = ff390061, %l3 = 0000000000000061
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030181408] = ff000000, %l2 = 11000000dabd0000
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%f16 = 57ff03e6, Mem[0000000030141410] = 00000000
	sta	%f16,[%i5+%o5]0x81	! Mem[0000000030141410] = 57ff03e6
!	Mem[0000000010041400] = 3c8bffff, %l2 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 0000003c000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = 979502e9, %l0 = 00000000ff9ec5ea
	ldsba	[%o3+0x100]%asi,%l0	! %l0 = ffffffffffffff97

p0_label_103:
!	Mem[0000000010101400] = 938a5265, %l3 = 00000000000000ff
	lduha	[%i4+%g0]0x88,%l3	! %l3 = 0000000000005265
!	Mem[0000000010041408] = 00000000 dceb0000, %l4 = 000000ff, %l5 = 1cede55e
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000 00000000dceb0000
!	Code Fragment 4
p0_fragment_7:
!	%l0 = ffffffffffffff97
	setx	0x27e21f286c99f439,%g7,%l0 ! %l0 = 27e21f286c99f439
!	%l1 = 00000000baecbc6e
	setx	0x93a891683ffe7f77,%g7,%l1 ! %l1 = 93a891683ffe7f77
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 27e21f286c99f439
	setx	0xea77f527cc50d491,%g7,%l0 ! %l0 = ea77f527cc50d491
!	%l1 = 93a891683ffe7f77
	setx	0xb68fa5700a2bce1c,%g7,%l1 ! %l1 = b68fa5700a2bce1c
!	Mem[0000000010141408] = be00000005aa00ff, %f8  = cb98558c 72150562
	ldda	[%i5+%o4]0x88,%f8 	! %f8  = be000000 05aa00ff
!	Mem[0000000010181428] = 0000005ecc7e6d15, %l1 = b68fa5700a2bce1c
	ldx	[%i6+0x028],%l1		! %l1 = 0000005ecc7e6d15
!	Mem[000000001008142c] = 6e0b7f3a, %f26 = c0000000
	ld	[%i2+0x02c],%f26	! %f26 = 6e0b7f3a
!	Mem[0000000010041410] = da6bf6ee91800000, %f24 = a00ec63a 133bbaca
	ldda	[%i1+%o5]0x80,%f24	! %f24 = da6bf6ee 91800000
!	Mem[0000000010041408] = 00000000dceb0000, %l1 = 0000005ecc7e6d15
	ldx	[%i1+%o4],%l1		! %l1 = 00000000dceb0000
!	Mem[0000000010001408] = eac59eff 6ebcecba, %l2 = 0000003c, %l3 = 00005265
	ldd	[%i0+%o4],%l2		! %l2 = 00000000eac59eff 000000006ebcecba
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 65528a93, %l0 = ea77f527cc50d491
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 00000065000000ff

p0_label_104:
!	%l6 = 00000000000000ff, Mem[00000000100c1410] = ff00aa05
	stba	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff00aa05
!	%f20 = 61000000, Mem[0000000010001414] = 00000000
	sta	%f20,[%i0+0x014]%asi	! Mem[0000000010001414] = 61000000
!	%l3 = 000000006ebcecba, Mem[0000000010141404] = 00001100
	stw	%l3,[%i5+0x004]		! Mem[0000000010141404] = 6ebcecba
!	Mem[0000000010141408] = 05aa00ff, %l4 = 0000000000000000
	lduha	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000030041410] = 05aa00ff
	stha	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 05aa00ff
	membar	#Sync			! Added by membar checker (18)
!	%f14 = 06244587 b6cc9147, Mem[0000000010101410] = ff000000 e4007b9a
	stda	%f14,[%i4+%o5]0x80	! Mem[0000000010101410] = 06244587 b6cc9147
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = 000000ff
	stha	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00ff00ff
!	%l6 = 00000000000000ff, Mem[0000000010181400] = 00000000
	stha	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	%l0 = 0000000000000065, Mem[0000000010041418] = c1821f242c4f74a5
	stx	%l0,[%i1+0x018]		! Mem[0000000010041418] = 0000000000000065
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 0000ffff, %l0 = 0000000000000065
	lduba	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff

p0_label_105:
!	Mem[0000000010001408] = eac59eff6ebcecba, %l5 = 00000000dceb0000
	ldx	[%i0+%o4],%l5		! %l5 = eac59eff6ebcecba
!	Mem[0000000010001400] = e8920000, %l0 = 00000000000000ff
	ldsba	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = fbf5ffff 000000ff, %l2 = eac59eff, %l3 = 6ebcecba
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff 00000000fbf5ffff
!	Mem[00000000100c1408] = ff008091, %l2 = 00000000000000ff
	lduba	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 0000000000000000
	setx	0xd95c3b4024c98155,%g7,%l0 ! %l0 = d95c3b4024c98155
!	%l1 = 00000000dceb0000
	setx	0x8c3e41007c8d843d,%g7,%l1 ! %l1 = 8c3e41007c8d843d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d95c3b4024c98155
	setx	0x7753376819ba1319,%g7,%l0 ! %l0 = 7753376819ba1319
!	%l1 = 8c3e41007c8d843d
	setx	0xc98a6a887eaf2e27,%g7,%l1 ! %l1 = c98a6a887eaf2e27
!	Mem[0000000010181408] = ff390061, %l0 = 7753376819ba1319
	ldswa	[%i6+%o4]0x80,%l0	! %l0 = ffffffffff390061
!	Mem[0000000021800080] = 00ff64ec, %l5 = eac59eff6ebcecba
	ldsba	[%o3+0x081]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181400] = c44e2bff, %l3 = 00000000fbf5ffff
	ldsha	[%i6+%g0]0x81,%l3	! %l3 = ffffffffffffc44e
!	Mem[0000000010041410] = da6bf6ee91800000, %l6 = 00000000000000ff
	ldxa	[%i1+%o5]0x80,%l6	! %l6 = da6bf6ee91800000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[00000000211c0001] = ffff6986
	stb	%l2,[%o2+0x001]		! Mem[00000000211c0000] = ffff6986

p0_label_106:
!	%f20 = 61000000 000000ff, Mem[0000000010001420] = 7257317c ff00bad0
	stda	%f20,[%i0+0x020]%asi	! Mem[0000000010001420] = 61000000 000000ff
!	%f0  = 1cde043d 00395b1c 0000ebdc 00000000
!	%f4  = 00008091 eef66bda a5744f2c 241f82c1
!	%f8  = be000000 05aa00ff 82ad7200 c94f038b
!	%f12 = cd54064d ec6178ff 06244587 b6cc9147
	stda	%f0,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
	membar	#Sync			! Added by membar checker (19)
!	%f16 = 57ff03e6 42000000 05aad266 1c5b3900
!	%f20 = 61000000 000000ff 7b85de8b 68ecfdd0
!	%f24 = da6bf6ee 91800000 6e0b7f3a 00000200
!	%f28 = ca1f3689 0a80762a c44e2ba6 b0538f8d
	stda	%f16,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
!	Mem[000000001004142e] = 0072ad82, %l3 = ffffffffffffc44e
	ldstuba	[%i1+0x02e]%asi,%l3	! %l3 = 000000ad000000ff
!	%l7 = 000000000000009c, Mem[0000000030181400] = c44e2bff00538f00
	stxa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000000000009c
!	Mem[000000001000141f] = 00000000, %l6 = da6bf6ee91800000
	ldstuba	[%i0+0x01f]%asi,%l6	! %l6 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[00000000211c0000] = ffff6986
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 00006986
!	%l0 = ff390061, %l1 = 7eaf2e27, Mem[0000000030041410] = 05aa00ff 00000000
	stda	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = ff390061 7eaf2e27
!	%l6 = 0000000000000000, Mem[0000000030101408] = 82270000
	stha	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081404] = ffffffff, %l0 = ffffffffff390061
	lduba	[%i2+0x007]%asi,%l0	! %l0 = 00000000000000ff

p0_label_107:
!	Mem[0000000010141400] = 00000000, %l5 = ffffffffffffffff
	lduh	[%i5+0x002],%l5		! %l5 = 0000000000000000
!	Mem[0000000010041410] = da6bf6ee, %l1 = c98a6a887eaf2e27
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = ffffffffffffffda
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010101408] = 00395b1c, %l2 = 00000000000000ff
	lduwa	[%i4+%o4]0x80,%l2	! %l2 = 0000000000395b1c
!	Mem[0000000030041408] = 21ab38ff, %l6 = 0000000000000000
	ldsha	[%i1+%o4]0x89,%l6	! %l6 = 00000000000038ff
!	Mem[0000000030141408] = 05aad266, %l5 = 0000000000000000
	ldsha	[%i5+%o4]0x89,%l5	! %l5 = ffffffffffffd266
!	Mem[0000000030181400] = 00000000, %l7 = 000000000000009c
	ldsba	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = eac59eff 6ebcecba, %l2 = 00395b1c, %l3 = 000000ad
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 00000000eac59eff 000000006ebcecba
!	Mem[0000000030101410] = ffff0000000000ff, %l6 = 00000000000038ff
	ldxa	[%i4+%o5]0x81,%l6	! %l6 = ffff0000000000ff
!	Mem[0000000010101408] = 00395b1c66d2aa05, %f28 = ca1f3689 0a80762a
	ldda	[%i4+%o4]0x80,%f28	! %f28 = 00395b1c 66d2aa05
!	Starting 10 instruction Store Burst
!	%f20 = 61000000 000000ff, Mem[0000000010181410] = 0000bdda 00000011
	stda	%f20,[%i6+%o5]0x80	! Mem[0000000010181410] = 61000000 000000ff

p0_label_108:
!	%f6  = a5744f2c 241f82c1, Mem[0000000010001430] = e5449c39 ebdc3bf1
	stda	%f6 ,[%i0+0x030]%asi	! Mem[0000000010001430] = a5744f2c 241f82c1
!	%l5 = ffffffffffffd266, Mem[0000000030181400] = 00000000
	stha	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000d266
!	%f16 = 57ff03e6, Mem[0000000030141410] = 57ff03e6
	sta	%f16,[%i5+%o5]0x81	! Mem[0000000030141410] = 57ff03e6
!	Mem[0000000030141408] = 05aad266, %l4 = 00000000000000ff
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 00000066000000ff
!	%l0 = 00000000000000ff, Mem[0000000030141408] = 05aad2ff
	stha	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 05aa00ff
!	%l7 = 0000000000000000, Mem[0000000010101410] = 000000ff
	stha	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000030101408] = 00000000, %l3 = 000000006ebcecba
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%f24 = da6bf6ee, Mem[0000000030181408] = ff0000ff
	sta	%f24,[%i6+%o4]0x89	! Mem[0000000030181408] = da6bf6ee
!	Mem[0000000030181410] = 925f00ff, %l4 = 0000000000000066
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ca1f3689, %l3 = 0000000000000000
	lduwa	[%i2+%o5]0x81,%l3	! %l3 = 00000000ca1f3689

p0_label_109:
!	Mem[0000000030101400] = 42000000, %l5 = ffffffffffffd266
	ldsha	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = ffffffff, %l3 = 00000000ca1f3689
	lduba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = 61000000 000000ff, %l4 = 000000ff, %l5 = 00000000
	ldd	[%i6+%o5],%l4		! %l4 = 0000000061000000 00000000000000ff
!	Mem[0000000020800040] = 02dce22a, %l2 = 00000000eac59eff
	ldsba	[%o1+0x041]%asi,%l2	! %l2 = ffffffffffffffdc
!	Mem[0000000010041410] = da6bf6ee91800000, %l7 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l7	! %l7 = da6bf6ee91800000
!	Mem[0000000030141400] = 61000000 000000ff, %l2 = ffffffdc, %l3 = 000000ff
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff 0000000061000000
!	Mem[0000000010001400] = e8920000, %f24 = da6bf6ee
	lda	[%i0+%g0]0x88,%f24	! %f24 = e8920000
!	Mem[0000000010101408] = 00395b1c66d2aa05, %f16 = 57ff03e6 42000000
	ldd	[%i4+%o4],%f16		! %f16 = 00395b1c 66d2aa05
!	Mem[0000000030181410] = 925f00ff, %f19 = 1c5b3900
	lda	[%i6+%o5]0x89,%f19	! %f19 = 925f00ff
!	Starting 10 instruction Store Burst
!	%f27 = 00000200, Mem[0000000010181410] = 00000061
	sta	%f27,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000200

p0_label_110:
!	%l6 = ffff0000000000ff, Mem[00000000100c1408] = 918000ff
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	Mem[00000000201c0001] = bdda4c16, %l6 = ffff0000000000ff
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000da000000ff
!	%f11 = c94f038b, Mem[0000000010041410] = eef66bda
	sta	%f11,[%i1+%o5]0x88	! Mem[0000000010041410] = c94f038b
!	%f9  = 05aa00ff, Mem[0000000010081410] = 00000000
	sta	%f9 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 05aa00ff
!	%f6  = a5744f2c, Mem[00000000100c1400] = 00ff00ff
	sta	%f6 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = a5744f2c
!	Mem[0000000010181409] = ff390061, %l2 = 00000000000000ff
	ldstub	[%i6+0x009],%l2		! %l2 = 00000039000000ff
!	%l1 = ffffffffffffffda, Mem[0000000010141400] = 000000006ebcecba
	stx	%l1,[%i5+%g0]		! Mem[0000000010141400] = ffffffffffffffda
!	%l2 = 0000000000000039, Mem[0000000030101408] = ff000000
	stha	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00390000
!	Mem[00000000300c1400] = 00000065, %l2 = 0000000000000039
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000065
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00390000, %l1 = ffffffffffffffda
	ldsha	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000039

p0_label_111:
!	Mem[0000000021800040] = ff564da2, %l2 = 0000000000000065
	ldsba	[%o3+0x041]%asi,%l2	! %l2 = 0000000000000056
!	Mem[0000000010101408] = 00395b1c66d2aa05, %l2 = 0000000000000056
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = 00395b1c66d2aa05
!	Mem[0000000030181410] = 57ff03e6 925f00ff, %l4 = 61000000, %l5 = 000000ff
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 00000000925f00ff 0000000057ff03e6
!	Mem[0000000010041408] = 00000000, %l2 = 00395b1c66d2aa05
	lduba	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001414] = 61000000, %l6 = 00000000000000da
	ldsba	[%i0+0x017]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = ffff0000, %l0 = 00000000000000ff
	ldsba	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = e603ff57, %f27 = 00000200
	lda	[%i2+%g0]0x89,%f27	! %f27 = e603ff57
!	Mem[0000000010001400] = 000092e8 000000ff, %l6 = 00000000, %l7 = 91800000
	ldd	[%i0+%g0],%l6		! %l6 = 00000000000092e8 00000000000000ff
!	Mem[0000000030141408] = 00000000 05aa00ff, %l0 = 00000000, %l1 = 00000039
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 0000000005aa00ff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 0000d266, %l7 = 00000000000000ff
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 00000066000000ff

p0_label_112:
!	Mem[0000000010001420] = 61000000, %l5 = 0000000057ff03e6, %asi = 80
	swapa	[%i0+0x020]%asi,%l5	! %l5 = 0000000061000000
!	%l6 = 00000000000092e8, Mem[0000000030081408] = ffff0000
	stha	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = ffff92e8
!	%f28 = 00395b1c 66d2aa05, %l0 = 0000000005aa00ff
!	Mem[0000000010081420] = ac60e6afc9c7befc
	add	%i2,0x020,%g1
	stda	%f28,[%g1+%l0]ASI_PST32_P ! Mem[0000000010081420] = 00395b1c66d2aa05
!	Mem[0000000010141400] = ffffffff, %l7 = 0000000000000066
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030181408] = eef66bda, %l1 = 0000000000000000
	ldsba	[%i6+%o4]0x81,%l1	! %l1 = ffffffffffffffee
!	%l1 = ffffffffffffffee, Mem[0000000010141408] = ff00aa05000000be
	stxa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffffffffffee
!	Mem[0000000010141408] = ffffffff, %l1 = ffffffffffffffee
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010141408] = ffffffff, %l0 = 0000000005aa00ff
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	%l2 = 00000000, %l3 = 61000000, Mem[0000000010081410] = 05aa00ff 00000000
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 61000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 42000000, %l3 = 0000000061000000
	ldsha	[%i4+%g0]0x89,%l3	! %l3 = 0000000000000000

p0_label_113:
!	Mem[0000000030141400] = 000000ff, %l7 = 00000000000000ff
	lduwa	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = ffffffffffffffee, %l5 = 0000000061000000
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = ffffffffffffffee
!	Mem[0000000030081408] = ffff92e8, %l7 = 00000000000000ff
	ldsba	[%i2+%o4]0x89,%l7	! %l7 = ffffffffffffffe8
!	Mem[0000000010101404] = e603ff57, %l6 = 00000000000092e8
	lduw	[%i4+0x004],%l6		! %l6 = 00000000e603ff57
!	Mem[0000000010101400] = 00000042, %l7 = ffffffffffffffe8
	ldswa	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000042
!	Mem[0000000030001408] = 00395b1c00ffffff, %f14 = 06244587 b6cc9147
	ldda	[%i0+%o4]0x89,%f14	! %f14 = 00395b1c 00ffffff
!	Mem[0000000030081410] = 89361fca, %l3 = 0000000000000000
	ldsha	[%i2+%o5]0x89,%l3	! %l3 = 0000000000001fca
!	Mem[0000000010181410] = 00020000, %l1 = 00000000000000ff
	ldsb	[%i6+%o5],%l1		! %l1 = 0000000000000000
!	Mem[0000000010181400] = ff00000000000000, %f4  = 00008091 eef66bda
	ldda	[%i6+%g0]0x80,%f4 	! %f4  = ff000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = ffffffff, %l6 = 00000000e603ff57
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 00000000ffffffff

p0_label_114:
!	%f16 = 00395b1c 66d2aa05, Mem[00000000100c1400] = 2c4f74a5 ebffffff
	stda	%f16,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00395b1c 66d2aa05
!	Mem[0000000010041400] = ffff8bff, %l4 = 00000000925f00ff
	swapa	[%i1+%g0]0x88,%l4	! %l4 = 00000000ffff8bff
!	Mem[0000000030181408] = eef66bda, %l0 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 000000ee000000ff
!	%f24 = e8920000 91800000, %l7 = 0000000000000042
!	Mem[0000000030081430] = 3588f09ecb454f27
	add	%i2,0x030,%g1
	stda	%f24,[%g1+%l7]ASI_PST32_S ! Mem[0000000030081430] = e8920000cb454f27
!	%l2 = 0000000000000000, Mem[0000000010141400] = ffffffff
	stwa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%l7 = 0000000000000042, Mem[0000000010141400] = 00000000
	stwa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000042
!	Mem[00000000300c1410] = ff0000ff, %l4 = 00000000ffff8bff
	ldstuba	[%i3+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%f6  = a5744f2c 241f82c1, %l4 = 00000000000000ff
!	Mem[0000000010141420] = 000028561cede55e
	add	%i5,0x020,%g1
	stda	%f6,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010141420] = c1821f242c4f74a5
!	%l3 = 0000000000001fca, Mem[0000000021800180] = ffffca0d, %asi = 80
	stha	%l3,[%o3+0x180]%asi	! Mem[0000000021800180] = 1fcaca0d
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ffffffff, %l5 = ffffffffffffffee
	lduba	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000ff

p0_label_115:
!	Mem[0000000010101420] = 00008091 eef66bda, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i4+0x020]%asi,%l4	! %l4 = 0000000000008091 00000000eef66bda
!	Mem[00000000100c141c] = 721c8243, %l1 = 0000000000000000
	ldsb	[%i3+0x01e],%l1		! %l1 = ffffffffffffff82
!	Mem[0000000010041408] = 00000000, %l5 = 00000000eef66bda
	ldsb	[%i1+0x00b],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l4 = 0000000000008091
	ldsba	[%i4+0x010]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800000] = 9aff5a05, %l1 = ffffffffffffff82
	ldsb	[%o1+0x001],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000020800000] = 9aff5a05, %l3 = 0000000000001fca
	ldub	[%o1+%g0],%l3		! %l3 = 000000000000009a
!	Mem[0000000030101410] = ffff0000000000ff, %f14 = 00395b1c 00ffffff
	ldda	[%i4+%o5]0x81,%f14	! %f14 = ffff0000 000000ff
!	Mem[0000000030181400] = ffd20000 0000009c, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 00000000ffd20000 000000000000009c
!	Mem[00000000201c0000] = bdff4c16, %l5 = 000000000000009c
	ldub	[%o0+%g0],%l5		! %l5 = 00000000000000bd
!	Starting 10 instruction Store Burst
!	%l0 = 000000ee, %l1 = ffffffff, Mem[00000000100c1410] = ff00aa05 000000be
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ee ffffffff

p0_label_116:
!	%l5 = 00000000000000bd, Mem[0000000010081408] = c443b9a4
	stba	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = c443b9bd
!	%l6 = 00000000ffffffff, Mem[0000000030041410] = 610039ff
	stha	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = ffff39ff
!	Mem[0000000010041400] = 925f00ff, %l5 = 00000000000000bd
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 00000000925f00ff
!	%f4  = ff000000 00000000, %l2 = 0000000000000000
!	Mem[00000000300c1410] = ff0000ff7fd1bbc9
	add	%i3,0x010,%g1
	stda	%f4,[%g1+%l2]ASI_PST8_S ! Mem[00000000300c1410] = ff0000ff7fd1bbc9
!	%l6 = ffffffff, %l7 = 00000042, Mem[0000000010001428] = 0a5dde72 2c0880e7
	std	%l6,[%i0+0x028]		! Mem[0000000010001428] = ffffffff 00000042
!	%f4  = ff000000 00000000, %l4 = 00000000ffd20000
!	Mem[0000000030181400] = ffd200000000009c
	stda	%f4,[%i6+%l4]ASI_PST8_S ! Mem[0000000030181400] = ffd200000000009c
!	Mem[0000000020800001] = 9aff5a05, %l0 = 00000000000000ee
	ldstub	[%o1+0x001],%l0		! %l0 = 000000ff000000ff
!	%l5 = 00000000925f00ff, Mem[0000000030041410] = 7eaf2e27ff39ffff
	stxa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000925f00ff
!	%l2 = 00000000, %l3 = 0000009a, Mem[00000000100c1400] = 66d2aa05 00395b1c
	stda	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 0000009a
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff9ec5ea, %l1 = ffffffffffffffff
	ldsha	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffffc5ea

p0_label_117:
!	Mem[0000000010141420] = c1821f24, %l7 = 0000000000000042
	ldub	[%i5+0x020],%l7		! %l7 = 00000000000000c1
!	Mem[0000000010141410] = e603ff57, %l7 = 00000000000000c1
	ldsba	[%i5+%o5]0x80,%l7	! %l7 = ffffffffffffffe6
!	Mem[0000000030041408] = ff38ab21, %l0 = 00000000000000ff
	lduha	[%i1+%o4]0x81,%l0	! %l0 = 000000000000ff38
!	Mem[0000000010141400] = daffffff00000042, %f12 = cd54064d ec6178ff
	ldda	[%i5+%g0]0x88,%f12	! %f12 = daffffff 00000042
!	Mem[00000000100c1408] = ff000000, %l7 = ffffffffffffffe6
	ldsha	[%i3+%o4]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[00000000201c0000] = bdff4c16, %l0 = 000000000000ff38
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000bdff
!	Mem[0000000010001428] = ffffffff00000042, %l6 = 00000000ffffffff
	ldx	[%i0+0x028],%l6		! %l6 = ffffffff00000042
!	Mem[0000000030141410] = e603ff57, %l7 = ffffffffffffff00
	ldsba	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000057
!	Mem[0000000030001408] = ffffff00, %l4 = 00000000ffd20000
	lduba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00000000, %l5 = 00000000925f00ff
	swap	[%i2+%o5],%l5		! %l5 = 0000000000000000

p0_label_118:
!	%l0 = 000000000000bdff, Mem[0000000010041424] = 8c5598cb
	sth	%l0,[%i1+0x024]		! Mem[0000000010041424] = bdff98cb
!	%l0 = 000000000000bdff, Mem[0000000010141408] = ffffffff
	stha	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffbdff
!	Mem[0000000010001408] = eac59eff, %l4 = 00000000000000ff
	ldstuba	[%i0+%o4]0x80,%l4	! %l4 = 000000ea000000ff
!	%f24 = e8920000 91800000, Mem[0000000010041410] = 8b034fc9 91800000
	stda	%f24,[%i1+%o5]0x80	! Mem[0000000010041410] = e8920000 91800000
!	Mem[0000000010041410] = 000092e8, %l7 = 0000000000000057
	swapa	[%i1+%o5]0x88,%l7	! %l7 = 00000000000092e8
!	%f9  = 05aa00ff, Mem[00000000300c1408] = 000000ff
	sta	%f9 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 05aa00ff
!	%f12 = daffffff 00000042, Mem[0000000030101408] = 00390000 66d2aa05
	stda	%f12,[%i4+%o4]0x81	! Mem[0000000030101408] = daffffff 00000042
!	%l1 = ffffffffffffc5ea, Mem[0000000030081400] = 57ff03e6
	stba	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = eaff03e6
!	Mem[0000000010101410] = 00000000, %l4 = 00000000000000ea
	ldstuba	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000dceb0000, %f20 = 61000000 000000ff
	ldd	[%i1+%o4],%f20		! %f20 = 00000000 dceb0000

p0_label_119:
!	Mem[0000000010181408] = 6100ffff, %l2 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Code Fragment 3
p0_fragment_9:
!	%l0 = 000000000000bdff
	setx	0xa7095b07f9ad0587,%g7,%l0 ! %l0 = a7095b07f9ad0587
!	%l1 = ffffffffffffc5ea
	setx	0x4ffe330003eb4a07,%g7,%l1 ! %l1 = 4ffe330003eb4a07
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a7095b07f9ad0587
	setx	0x7b8d05600864e59d,%g7,%l0 ! %l0 = 7b8d05600864e59d
!	%l1 = 4ffe330003eb4a07
	setx	0xf46aade7818d44d6,%g7,%l1 ! %l1 = f46aade7818d44d6
!	Mem[0000000010081408] = bdb943c4, %l3 = 000000000000009a
	lduha	[%i2+%o4]0x80,%l3	! %l3 = 000000000000bdb9
!	Mem[0000000010041400] = bd000000, %l6 = ffffffff00000042
	ldsha	[%i1+%g0]0x80,%l6	! %l6 = ffffffffffffbd00
!	Mem[0000000010141408] = ffbdffff, %l7 = 00000000000092e8
	ldswa	[%i5+%o4]0x80,%l7	! %l7 = ffffffffffbdffff
!	Mem[00000000300c1410] = c9bbd17f ff0000ff, %l2 = ffffffff, %l3 = 0000bdb9
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 00000000ff0000ff 00000000c9bbd17f
!	Mem[00000000201c0000] = bdff4c16, %l7 = ffffffffffbdffff
	lduba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = 00000042 e603ff57, %l0 = 0864e59d, %l1 = 818d44d6
	ldd	[%i4+%g0],%l0		! %l0 = 0000000000000042 00000000e603ff57
!	Mem[0000000010141400] = 00000042, %l7 = 00000000000000ff
	lduba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000042
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030141408] = 05aa00ff
	stwa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000

p0_label_120:
!	%f10 = 82ad7200 c94f038b, Mem[0000000010181408] = 6100ffff 00000000
	stda	%f10,[%i6+%o4]0x88	! Mem[0000000010181408] = 82ad7200 c94f038b
!	Mem[0000000010041417] = 91800000, %l3 = 00000000c9bbd17f
	ldstub	[%i1+0x017],%l3		! %l3 = 00000000000000ff
!	%l6 = ffffffffffffbd00, Mem[0000000030101400] = 00000042
	stba	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000042
!	Mem[0000000030181410] = 925f00ff, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010101404] = e603ff57, %l4 = 0000000000000000
	ldstub	[%i4+0x004],%l4		! %l4 = 000000e6000000ff
!	Mem[0000000030141400] = 000000ff, %l3 = 00000000000000ff
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000021800040] = ff564da2, %l4 = 00000000000000e6
	ldstub	[%o3+0x040],%l4		! %l4 = 000000ff000000ff
!	%f24 = e8920000, Mem[0000000010141400] = 42000000
	sta	%f24,[%i5+%g0]0x80	! Mem[0000000010141400] = e8920000
!	Mem[0000000030081410] = 89361fca, %l6 = ffffffffffffbd00
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 000000ca000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = 1100b3a7, %l1 = 00000000e603ff57
	ldsb	[%i5+0x030],%l1		! %l1 = 0000000000000011

p0_label_121:
!	Mem[0000000010001410] = dabd2923, %l6 = 00000000000000ca
	ldsha	[%i0+%o5]0x80,%l6	! %l6 = ffffffffffffdabd
!	Mem[0000000010001408] = baecbc6eff9ec5ff, %l0 = 0000000000000042
	ldxa	[%i0+%o4]0x88,%l0	! %l0 = baecbc6eff9ec5ff
!	Mem[0000000010081408] = bdb943c4 f229783b, %l6 = ffffdabd, %l7 = 00000042
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000bdb943c4 00000000f229783b
!	Mem[0000000010141424] = 2c4f74a5, %l7 = 00000000f229783b
	ldsha	[%i5+0x024]%asi,%l7	! %l7 = 0000000000002c4f
!	Mem[0000000010181400] = ff000000, %f29 = 66d2aa05
	lda	[%i6+%g0]0x80,%f29	! %f29 = ff000000
!	Mem[0000000030181400] = 9c0000000000d2ff, %f6  = a5744f2c 241f82c1
	ldda	[%i6+%g0]0x89,%f6 	! %f6  = 9c000000 0000d2ff
!	Mem[0000000010101408] = 1c5b3900, %f16 = 00395b1c
	lda	[%i4+%o4]0x88,%f16	! %f16 = 1c5b3900
!	Mem[00000000300c1400] = 00000039, %f8  = be000000
	lda	[%i3+%g0]0x81,%f8 	! %f8 = 00000039
!	Mem[0000000030181408] = fff66bda, %l7 = 0000000000002c4f
	lduha	[%i6+%o4]0x81,%l7	! %l7 = 000000000000fff6
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff0000ff, Mem[0000000010041400] = 1cde043d000000bd
	stxa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000ff0000ff

p0_label_122:
!	Mem[0000000020800041] = 02dce22a, %l2 = 00000000ff0000ff
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 000000dc000000ff
!	Mem[0000000010001410] = 2329bdda, %l1 = 0000000000000011
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 000000002329bdda
!	Mem[0000000010001400] = 000092e8, %l4 = 00000000000000ff
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 00000000000092e8
!	%f16 = 1c5b3900 66d2aa05 05aad266 925f00ff
!	%f20 = 00000000 dceb0000 7b85de8b 68ecfdd0
!	%f24 = e8920000 91800000 6e0b7f3a e603ff57
!	%f28 = 00395b1c ff000000 c44e2ba6 b0538f8d
	stda	%f16,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	%l0 = baecbc6eff9ec5ff, Mem[0000000030141410] = 57ff03e6
	stha	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = c5ff03e6
!	%f7  = 0000d2ff, Mem[0000000030081400] = e603ffea
	sta	%f7 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000d2ff
!	%f15 = 000000ff, Mem[00000000100c1410] = ee000000
	sta	%f15,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	%l0 = baecbc6eff9ec5ff, Mem[0000000030041408] = ff38ab21
	stwa	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = ff9ec5ff
!	Mem[00000000100c142c] = e603ff57, %l0 = baecbc6eff9ec5ff, %asi = 80
	swapa	[%i3+0x02c]%asi,%l0	! %l0 = 00000000e603ff57
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000, %l1 = 000000002329bdda
	lduw	[%i4+%o5],%l1		! %l1 = 00000000ff000000

p0_label_123:
!	Mem[0000000010081418] = c21fd5ff e531402f, %l6 = bdb943c4, %l7 = 0000fff6
	ldd	[%i2+0x018],%l6		! %l6 = 00000000c21fd5ff 00000000e531402f
!	Mem[00000000211c0000] = 00006986, %l4 = 00000000000092e8
	ldsh	[%o2+%g0],%l4		! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000030001400] = 00395b1c, %f4  = ff000000
	lda	[%i0+%g0]0x89,%f4 	! %f4 = 00395b1c
!	Mem[0000000030041408] = ff9ec5ff, %l4 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101408] = 1c5b3900, %l1 = 00000000ff000000
	lduwa	[%i4+%o4]0x88,%l1	! %l1 = 000000001c5b3900
!	Mem[0000000010081400] = ffffffff, %l2 = 00000000000000dc
	ldswa	[%i2+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000021800140] = 9f38e548, %l4 = 00000000000000ff
	ldsh	[%o3+0x140],%l4		! %l4 = ffffffffffff9f38
!	Mem[0000000010001418] = a7ff3bf1000000ff, %l4 = ffffffffffff9f38
	ldx	[%i0+0x018],%l4		! %l4 = a7ff3bf1000000ff
!	Mem[0000000030041410] = ff005f9200000000, %f10 = 82ad7200 c94f038b
	ldda	[%i1+%o5]0x81,%f10	! %f10 = ff005f92 00000000
!	Starting 10 instruction Store Burst
!	%f1  = 00395b1c, Mem[0000000030041400] = ff000000
	sta	%f1 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 00395b1c

p0_label_124:
!	%f30 = c44e2ba6 b0538f8d, Mem[0000000030041400] = 00395b1c fffff5fb
	stda	%f30,[%i1+%g0]0x81	! Mem[0000000030041400] = c44e2ba6 b0538f8d
!	Mem[0000000010041408] = 00000000, %l7 = 00000000e531402f
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%f8  = 00000039 05aa00ff, %l5 = 0000000000000000
!	Mem[0000000010081428] = 239ff9aa6e0b7f3a
	add	%i2,0x028,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010081428] = 239ff9aa6e0b7f3a
!	%l0 = 00000000e603ff57, Mem[000000001010142e] = 3a7f0b6e
	stb	%l0,[%i4+0x02e]		! Mem[000000001010142c] = 3a7f576e
!	%l6 = 00000000c21fd5ff, Mem[0000000010101408] = 1c5b3900
	stha	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 1c5bd5ff
!	Mem[0000000010041408] = 2f4031e5, %l2 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 0000002f000000ff
!	%f6  = 9c000000 0000d2ff, %l3 = 00000000000000ff
!	Mem[0000000030001408] = 05aad266925f00ff
	add	%i0,0x008,%g1
	stda	%f6,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030001408] = ffd200000000009c
!	%f22 = 7b85de8b 68ecfdd0, Mem[0000000010041408] = ff4031e5 dceb0000
	stda	%f22,[%i1+0x008]%asi	! Mem[0000000010041408] = 7b85de8b 68ecfdd0
!	%l4 = a7ff3bf1000000ff, Mem[000000001018141c] = 925ff89b, %asi = 80
	stha	%l4,[%i6+0x01c]%asi	! Mem[000000001018141c] = 00fff89b
!	Starting 10 instruction Load Burst
!	%l7 = 0000000000000000, %l2 = 000000000000002f, %l3 = 00000000000000ff
	subc	%l7,%l2,%l3		! %l3 = ffffffffffffffd1

p0_label_125:
!	Mem[0000000030001410] = 00000000dceb0000, %f20 = 00000000 dceb0000
	ldda	[%i0+%o5]0x81,%f20	! %f20 = 00000000 dceb0000
!	Mem[0000000010181414] = 000000ff, %l3 = ffffffffffffffd1
	lduwa	[%i6+0x014]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101438] = 8d8f53b0a62b4ec4, %l6 = 00000000c21fd5ff
	ldx	[%i4+0x038],%l6		! %l6 = 8d8f53b0a62b4ec4
!	Mem[0000000010081408] = bdb943c4f229783b, %l0 = 00000000e603ff57
	ldxa	[%i2+%o4]0x80,%l0	! %l0 = bdb943c4f229783b
!	Mem[0000000010101400] = 00000042, %f6  = 9c000000
	lda	[%i4+%g0]0x80,%f6 	! %f6 = 00000042
!	Mem[00000000300c1410] = ff0000ff, %l7 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141400] = 000000ff, %f28 = 00395b1c
	lda	[%i5+%g0]0x89,%f28	! %f28 = 000000ff
!	Mem[0000000010101400] = 00000042, %l0 = bdb943c4f229783b
	ldswa	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000042
!	Mem[0000000010141410] = 57ff03e6, %l7 = 00000000000000ff
	ldsha	[%i5+%o5]0x88,%l7	! %l7 = 00000000000003e6
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff000000, %l0 = 0000000000000042
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 00000000ff000000

p0_label_126:
!	%l0 = ff000000, %l1 = 1c5b3900, Mem[0000000010041420] = 62051572 bdff98cb
	stda	%l0,[%i1+0x020]%asi	! Mem[0000000010041420] = ff000000 1c5b3900
!	%l4 = a7ff3bf1000000ff, Mem[0000000010081410] = 61000000ff005f92
	stxa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = a7ff3bf1000000ff
!	Mem[0000000030041408] = ffc59eff, %l2 = 000000000000002f
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010141408] = ffbdffff
	stwa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff
!	%l7 = 00000000000003e6, Mem[0000000010181428] = 0000005e
	stw	%l7,[%i6+0x028]		! Mem[0000000010181428] = 000003e6
!	%f29 = ff000000, Mem[0000000030141408] = 00000000
	sta	%f29,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000
!	Mem[0000000030101400] = 42000000, %l6 = 8d8f53b0a62b4ec4
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%f23 = 68ecfdd0, Mem[0000000010141414] = 0000ff00
	sta	%f23,[%i5+0x014]%asi	! Mem[0000000010141414] = 68ecfdd0
!	%l6 = 0000000000000000, Mem[0000000010001400] = ff000000
	stwa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = 830ace35, %l4 = a7ff3bf1000000ff
	ldsh	[%o3+0x1c0],%l4		! %l4 = ffffffffffff830a

p0_label_127:
!	Mem[0000000010141410] = e603ff57, %f3  = 00000000
	lda	[%i5+%o5]0x80,%f3 	! %f3 = e603ff57
!	Mem[0000000010141410] = e603ff57, %l2 = 00000000000000ff
	ldsba	[%i5+%o5]0x80,%l2	! %l2 = ffffffffffffffe6
!	Mem[0000000030081410] = 89361fff, %f17 = 66d2aa05
	lda	[%i2+%o5]0x89,%f17	! %f17 = 89361fff
!	Mem[0000000010081434] = 6e0b7f3a, %l2 = ffffffffffffffe6
	lduw	[%i2+0x034],%l2		! %l2 = 000000006e0b7f3a
!	Mem[0000000010141424] = 2c4f74a5, %l6 = 0000000000000000
	lduh	[%i5+0x026],%l6		! %l6 = 00000000000074a5
!	Mem[0000000030001400] = 00395b1c, %l3 = 00000000000000ff
	ldsba	[%i0+%g0]0x89,%l3	! %l3 = 000000000000001c
!	Mem[00000000300c1410] = ff0000ff, %f3  = e603ff57
	lda	[%i3+%o5]0x81,%f3 	! %f3 = ff0000ff
!	Mem[0000000010001424] = 000000ff, %l4 = ffffffffffff830a
	ldsw	[%i0+0x024],%l4		! %l4 = 00000000000000ff
!	Mem[00000000201c0000] = bdff4c16, %l1 = 000000001c5b3900
	ldsb	[%o0+%g0],%l1		! %l1 = ffffffffffffffbd
!	Starting 10 instruction Store Burst
!	%f30 = c44e2ba6 b0538f8d, %l7 = 00000000000003e6
!	Mem[0000000030141428] = f54cc84b399c4442
	add	%i5,0x028,%g1
	stda	%f30,[%g1+%l7]ASI_PST8_S ! Mem[0000000030141428] = c44e2b4b39538f42

p0_label_128:
!	%l1 = ffffffffffffffbd, Mem[0000000030001400] = 00395b1c
	stba	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 00395bbd
!	%l1 = ffffffffffffffbd, Mem[0000000021800100] = 979502e9
	sth	%l1,[%o3+0x100]		! Mem[0000000021800100] = ffbd02e9
!	%l0 = 00000000ff000000, Mem[0000000010001410] = 11000000
	stwa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000
!	%l5 = 0000000000000000, Mem[0000000020800041] = 02ffe22a, %asi = 80
	stba	%l5,[%o1+0x041]%asi	! Mem[0000000020800040] = 0200e22a
!	%l3 = 000000000000001c, Mem[0000000010001408] = ffc59eff
	stba	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 1cc59eff
!	%l0 = 00000000ff000000, Mem[0000000010141402] = e8920000
	sth	%l0,[%i5+0x002]		! Mem[0000000010141400] = e8920000
!	%f2  = 0000ebdc ff0000ff, %l4 = 00000000000000ff
!	Mem[0000000030001410] = 00000000dceb0000
	add	%i0,0x010,%g1
	stda	%f2,[%g1+%l4]ASI_PST8_S ! Mem[0000000030001410] = 0000ebdcff0000ff
!	%f30 = c44e2ba6 b0538f8d, %l3 = 000000000000001c
!	Mem[0000000030101420] = caba3b133ac60ea0
	add	%i4,0x020,%g1
	stda	%f30,[%g1+%l3]ASI_PST8_S ! Mem[0000000030101420] = caba3ba6b0530ea0
!	%f8  = 00000039, Mem[0000000010181408] = 8b034fc9
	sta	%f8 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000039
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff9ec51c, %l3 = 000000000000001c
	ldswa	[%i0+%o4]0x88,%l3	! %l3 = ffffffffff9ec51c

p0_label_129:
!	Mem[00000000100c1410] = 000000ff, %l7 = 00000000000003e6
	lduwa	[%i3+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[000000001004143c] = 87452406, %l2 = 000000006e0b7f3a
	ldsba	[%i1+0x03d]%asi,%l2	! %l2 = 0000000000000045
!	Mem[0000000010141408] = ff000000, %l5 = 0000000000000000
	ldsha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = ffd20000, %l2 = 0000000000000045
	ldswa	[%i6+%g0]0x81,%l2	! %l2 = ffffffffffd20000
!	Mem[0000000030081410] = ff1f36890a80762a, %f4  = 00395b1c 00000000
	ldda	[%i2+%o5]0x81,%f4 	! %f4  = ff1f3689 0a80762a
!	Mem[0000000010101400] = 00000042, %l2 = ffffffffffd20000
	lduba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = ff9ec5ff, %l3 = ffffffffff9ec51c
	ldsba	[%i1+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101410] = 00000042 00000061, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000042 0000000000000061
!	Mem[0000000030141408] = ff000000, %l6 = 00000000000074a5
	ldsba	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 00000042, %l5 = 00000061, Mem[0000000030181408] = da6bf6ff 3c8bffff
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000042 00000061

p0_label_130:
!	Mem[00000000300c1408] = ff00aa05, %l4 = 0000000000000042
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 00000000ff00aa05
!	%l0 = ff000000, %l1 = ffffffbd, Mem[0000000030141400] = 000000ff 61000000
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = ff000000 ffffffbd
!	Mem[0000000030141408] = ff000000, %l4 = 00000000ff00aa05
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%f13 = 00000042, Mem[0000000010101408] = ffd55b1c
	sta	%f13,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000042
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000010101438] = 8d8f53b0 a62b4ec4
	stda	%l2,[%i4+0x038]%asi	! Mem[0000000010101438] = 00000000 ffffffff
!	Mem[0000000010181400] = 000000ff, %l3 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c1423] = 00009aff, %l4 = 00000000000000ff
	ldstuba	[%i3+0x023]%asi,%l4	! %l4 = 000000ff000000ff
!	%l6 = ffffffff, %l7 = 000000ff, Mem[0000000010001418] = a7ff3bf1 000000ff
	std	%l6,[%i0+0x018]		! Mem[0000000010001418] = ffffffff 000000ff
!	%f28 = 000000ff ff000000, Mem[0000000030081410] = ff1f3689 0a80762a
	stda	%f28,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 8bde857b, %l1 = ffffffffffffffbd
	lduwa	[%i1+%o4]0x88,%l1	! %l1 = 000000008bde857b

p0_label_131:
!	Mem[0000000010001408] = 1cc59eff, %f17 = 89361fff
	lda	[%i0+%o4]0x80,%f17	! %f17 = 1cc59eff
!	Mem[00000000300c1400] = 00000039, %l6 = ffffffffffffffff
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000039
!	Mem[000000001010140c] = 66d2aa05, %l6 = 0000000000000039
	ldsha	[%i4+0x00e]%asi,%l6	! %l6 = ffffffffffffaa05
!	Mem[0000000010141410] = 57ff03e6, %l0 = 00000000ff000000
	lduha	[%i5+%o5]0x88,%l0	! %l0 = 00000000000003e6
!	Mem[0000000010041410] = 57000000, %l0 = 00000000000003e6
	ldsha	[%i1+%o5]0x80,%l0	! %l0 = 0000000000005700
!	Mem[00000000300c1408] = 42000000, %l2 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000042
!	Mem[0000000010181400] = ff000000 00000000, %l4 = 000000ff, %l5 = 00000061
	ldda	[%i6+0x000]%asi,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000021800040] = ff564da2, %l2 = 0000000000000042
	ldsb	[%o3+0x041],%l2		! %l2 = 0000000000000056
!	%f10 = ff005f92 00000000, %f12 = daffffff
	fdtoi	%f10,%f12		! %f12 = 80000000
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffaa05, Mem[0000000010101420] = 00008091
	stw	%l6,[%i4+0x020]		! Mem[0000000010101420] = ffffaa05

p0_label_132:
!	%l7 = 00000000000000ff, Mem[0000000020800000] = 9aff5a05, %asi = 80
	stha	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = 00ff5a05
!	%l7 = 00000000000000ff, Mem[0000000030101410] = ffff0000
	stha	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ff0000
!	%l4 = 00000000ff000000, Mem[0000000030041410] = 925f00ff
	stba	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 925f0000
!	%l2 = 0000000000000056, Mem[0000000010041410] = ff00809100000057
	stxa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000056
!	%f22 = 7b85de8b, Mem[0000000030181410] = 925f00ff
	sta	%f22,[%i6+%o5]0x89	! Mem[0000000030181410] = 7b85de8b
!	Mem[0000000030141410] = e603ffc5, %l6 = ffffffffffffaa05
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 000000c5000000ff
!	Mem[0000000030181408] = 42000000, %l1 = 000000008bde857b
	swapa	[%i6+%o4]0x81,%l1	! %l1 = 0000000042000000
!	%f22 = 7b85de8b 68ecfdd0, %l4 = 00000000ff000000
!	Mem[00000000300c1428] = 43821c7238550000
	add	%i3,0x028,%g1
	stda	%f22,[%g1+%l4]ASI_PST16_S ! Mem[00000000300c1428] = 43821c7238550000
!	Mem[0000000030081400] = 0000d2ff, %l4 = 00000000ff000000
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 000000000000d2ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 8bde857be603ff57, %f10 = ff005f92 00000000
	ldda	[%i6+%o5]0x81,%f10	! %f10 = 8bde857b e603ff57

p0_label_133:
!	Mem[0000000030181400] = ffd20000, %f25 = 91800000
	lda	[%i6+%g0]0x81,%f25	! %f25 = ffd20000
!	Mem[0000000010141408] = eeffffffff000000, %f0  = 1cde043d 00395b1c
	ldda	[%i5+%o4]0x88,%f0 	! %f0  = eeffffff ff000000
!	Mem[000000001000143f] = 4bc84cf5, %l5 = 0000000000000000
	ldstuba	[%i0+0x03f]%asi,%l5	! %l5 = 000000f5000000ff
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000030001400] = bd5b3900 66d2aa05 ffd20000 0000009c
!	Mem[0000000030001410] = 0000ebdc ff0000ff 7b85de8b 68ecfdd0
!	Mem[0000000030001420] = e8920000 91800000 6e0b7f3a e603ff57
!	Mem[0000000030001430] = 00395b1c ff000000 c44e2ba6 b0538f8d
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[00000000300c1410] = ff0000ff 7fd1bbc9, %l4 = 0000d2ff, %l5 = 000000f5
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 00000000ff0000ff 000000007fd1bbc9
!	Mem[00000000100c1418] = 003981d1 721c8243, %l2 = 00000056, %l3 = 000000ff
	ldda	[%i3+0x018]%asi,%l2	! %l2 = 00000000003981d1 00000000721c8243
!	Mem[0000000030141410] = e603ffff, %l6 = 00000000000000c5
	lduba	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1408] = 42000000, %l2 = 00000000003981d1
	lduha	[%i3+%o4]0x81,%l2	! %l2 = 0000000000004200
!	Mem[0000000010141410] = 57ff03e6, %l3 = 00000000721c8243
	lduba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000e6
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000004200, Mem[0000000010101418] = d0fdec688bde857b
	stx	%l2,[%i4+0x018]		! Mem[0000000010101418] = 0000000000004200

p0_label_134:
!	%l3 = 00000000000000e6, Mem[0000000010001434] = 241f82c1
	stw	%l3,[%i0+0x034]		! Mem[0000000010001434] = 000000e6
!	%l3 = 00000000000000e6, Mem[0000000030141408] = ff000000
	stwa	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000e6
!	Mem[0000000010141400] = 000092e8, %l6 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 000000e8000000ff
!	%f24 = e8920000, Mem[00000000300c1408] = 00000042
	sta	%f24,[%i3+%o4]0x89	! Mem[00000000300c1408] = e8920000
!	Mem[0000000020800040] = 0200e22a, %l0 = 0000000000005700
	ldstub	[%o1+0x040],%l0		! %l0 = 00000002000000ff
!	Mem[00000000300c1400] = 39000000, %l2 = 0000000000004200
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 0000000039000000
!	Mem[0000000010041438] = 4791ccb687452406, %l6 = 00000000000000e8, %l6 = 00000000000000e8
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 4791ccb687452406
!	Mem[0000000010101400] = 00000042, %l7 = 00000000000000ff
	ldsba	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%f18 = 05aad266 925f00ff, %l6 = 4791ccb687452406
!	Mem[0000000010081408] = bdb943c4f229783b
	add	%i2,0x008,%g1
	stda	%f18,[%g1+%l6]ASI_PST16_P ! Mem[0000000010081408] = bdb9d266925f783b
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 8d8f53b0a62b4ec4, %f28 = 000000ff ff000000
	ldda	[%i1+%g0]0x89,%f28	! %f28 = 8d8f53b0 a62b4ec4

p0_label_135:
!	Mem[0000000030041408] = ff9ec5ff, %l2 = 0000000039000000
	lduba	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = ff000000, %l2 = 00000000000000ff
	lduha	[%i0+%o5]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[00000000300c1408] = 000092e8, %l5 = 000000007fd1bbc9
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = 00000000000092e8
!	Mem[0000000030001410] = dceb0000, %l5 = 00000000000092e8
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = 42449c39 000000ff, %l6 = 87452406, %l7 = 00000000
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ff 0000000042449c39
!	Mem[00000000201c0000] = bdff4c16, %l3 = 00000000000000e6
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffbdff
!	Mem[0000000010141410] = e603ff5768ecfdd0, %l5 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l5	! %l5 = e603ff5768ecfdd0
!	Mem[0000000030181400] = ffd20000, %l1 = 0000000042000000
	ldswa	[%i6+%g0]0x81,%l1	! %l1 = ffffffffffd20000
!	Mem[0000000010081410] = ff000000, %l1 = ffffffffffd20000
	lduha	[%i2+%o5]0x80,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l5 = e603ff5768ecfdd0, Mem[0000000010041400] = ff0000ff
	stha	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = ff00fdd0

p0_label_136:
!	Mem[0000000010081400] = ffffffff, %l2 = 000000000000ff00
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%f18 = 05aad266 925f00ff, Mem[00000000300c1408] = e8920000 8607578a
	stda	%f18,[%i3+%o4]0x89	! Mem[00000000300c1408] = 05aad266 925f00ff
!	%l5 = e603ff5768ecfdd0, Mem[00000000211c0001] = 00006986
	stb	%l5,[%o2+0x001]		! Mem[00000000211c0000] = 00d06986
!	Mem[00000000300c1400] = 00004200, %l1 = 000000000000ff00
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 0000000000004200
!	Mem[0000000010141410] = e603ff57, %l7 = 0000000042449c39
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 000000e6000000ff
!	Mem[0000000020800040] = ff00e22a, %l7 = 00000000000000e6
	ldstub	[%o1+0x040],%l7		! %l7 = 000000ff000000ff
!	Mem[0000000010001422] = 57ff03e6, %l1 = 0000000000004200
	ldstub	[%i0+0x022],%l1		! %l1 = 00000003000000ff
!	Mem[00000000100c1408] = ff000000, %l4 = 00000000ff0000ff
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[000000001010140c] = 66d2aa05, %l5 = e603ff5768ecfdd0
	ldstuba	[%i4+0x00c]%asi,%l5	! %l5 = 00000066000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff00000000000000, %f22 = 7b85de8b 68ecfdd0
	ldda	[%i6+%g0]0x80,%f22	! %f22 = ff000000 00000000

p0_label_137:
!	Mem[0000000030181408] = 8bde857b 61000000, %l2 = 000000ff, %l3 = ffffbdff
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 000000008bde857b 0000000061000000
!	Mem[0000000010041408] = 8bde857b, %l1 = 0000000000000003
	lduba	[%i1+%o4]0x88,%l1	! %l1 = 000000000000007b
!	Mem[0000000030041400] = a62b4ec4, %l6 = 00000000000000ff
	lduba	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000c4
!	Mem[0000000010001430] = a5744f2c 000000e6, %l6 = 000000c4, %l7 = 000000ff
	ldda	[%i0+0x030]%asi,%l6	! %l6 = 00000000a5744f2c 00000000000000e6
!	Mem[000000001018141c] = 00fff89b, %l7 = 00000000000000e6
	ldsba	[%i6+0x01e]%asi,%l7	! %l7 = fffffffffffffff8
!	Mem[0000000010041408] = d0fdec688bde857b, %f20 = 00000000 dceb0000
	ldda	[%i1+%o4]0x88,%f20	! %f20 = d0fdec68 8bde857b
!	Mem[0000000030141408] = 000000e6, %f7  = 68ecfdd0
	lda	[%i5+%o4]0x81,%f7 	! %f7 = 000000e6
!	Mem[0000000030181408] = 8bde857b 61000000, %l6 = a5744f2c, %l7 = fffffff8
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 000000008bde857b 0000000061000000
!	Mem[0000000030181410] = 57ff03e67b85de8b, %f0  = bd5b3900 66d2aa05
	ldda	[%i6+%o5]0x89,%f0 	! %f0  = 57ff03e6 7b85de8b
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = ff000042, %l6 = 000000008bde857b
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 00000000ff000042

p0_label_138:
!	Mem[0000000030101400] = 8bde857b, %l5 = 0000000000000066
	ldstuba	[%i4+%g0]0x81,%l5	! %l5 = 0000008b000000ff
!	%f2  = ffd20000 0000009c, %l6 = 00000000ff000042
!	Mem[0000000030041438] = 79a380ffb200b2b8
	add	%i1,0x038,%g1
	stda	%f2,[%g1+%l6]ASI_PST8_S ! Mem[0000000030041438] = 79d280ffb20000b8
!	Mem[0000000030141400] = ff000000, %l1 = 000000000000007b
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181430] = 6f273e24, %l4 = 000000ff, %l1 = 00000000
	add	%i6,0x30,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 000000006f273e24
!	%l2 = 8bde857b, %l3 = 61000000, Mem[0000000030041410] = 00005f92 00000000
	stda	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 8bde857b 61000000
!	%l2 = 000000008bde857b, Mem[0000000030081408] = e892ffff13b25e5f
	stxa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000008bde857b
!	%l5 = 000000000000008b, Mem[0000000030101400] = ffde857b
	stba	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 8bde857b
!	%l3 = 0000000061000000, Mem[0000000010041402] = d0fd00ff, %asi = 80
	stba	%l3,[%i1+0x002]%asi	! Mem[0000000010041400] = d0fd00ff
!	Mem[0000000030141400] = ff0000ff, %l3 = 0000000061000000
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff0000ff, %l0 = 0000000000000002
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = ffffffffffffffff

p0_label_139:
!	Mem[0000000010041408] = 8bde857b, %l4 = 00000000000000ff
	ldswa	[%i1+%o4]0x88,%l4	! %l4 = ffffffff8bde857b
!	Mem[000000001014143c] = 00000000, %f1  = 7b85de8b
	ld	[%i5+0x03c],%f1 	! %f1 = 00000000
!	Mem[00000000201c0000] = bdff4c16, %l6 = 00000000ff000042
	ldsh	[%o0+%g0],%l6		! %l6 = ffffffffffffbdff
!	Mem[00000000201c0000] = bdff4c16, %l3 = 00000000ff0000ff
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000bdff
!	Mem[0000000030141408] = 000000e6, %f31 = b0538f8d
	lda	[%i5+%o4]0x81,%f31	! %f31 = 000000e6
!	Mem[0000000030181408] = 7b85de8b, %l3 = 000000000000bdff
	ldsba	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffffff8b
!	Mem[0000000030001408] = ffd20000, %l3 = ffffffffffffff8b
	ldsha	[%i0+%o4]0x81,%l3	! %l3 = ffffffffffffffd2
!	Mem[0000000021800140] = 9f38e548, %l6 = ffffffffffffbdff
	lduh	[%o3+0x140],%l6		! %l6 = 0000000000009f38
!	Mem[0000000030101410] = 0000ff00, %l7 = 0000000061000000
	lduha	[%i4+%o5]0x89,%l7	! %l7 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010001428] = ffffffff, %l0 = ffffffff, %l5 = 0000008b
	add	%i0,0x28,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000ffffffff

p0_label_140:
!	%l0 = ffffffff, %l1 = 6f273e24, Mem[0000000010041408] = 7b85de8b 68ecfdd0
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffff 6f273e24
!	%l0 = ffffffffffffffff, Mem[0000000010001425] = 000000ff, %asi = 80
	stba	%l0,[%i0+0x025]%asi	! Mem[0000000010001424] = 00ff00ff
!	%l4 = 8bde857b, %l5 = ffffffff, Mem[00000000100c1410] = 000000ff ffffffff
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 8bde857b ffffffff
!	%l2 = 000000008bde857b, Mem[000000001004141c] = 00000065, %asi = 80
	stha	%l2,[%i1+0x01c]%asi	! Mem[000000001004141c] = 857b0065
!	Mem[0000000010141418] = 4926f386, %l6 = 0000000000009f38
	ldstub	[%i5+0x018],%l6		! %l6 = 00000049000000ff
	membar	#Sync			! Added by membar checker (23)
!	%l7 = 000000000000ff00, Mem[0000000030001410] = ff0000ffdceb0000
	stxa	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000000000ff00
!	Mem[0000000010041400] = d0fd00ff, %l1 = 000000006f273e24
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 000000d0000000ff
!	%f8  = e8920000 91800000, Mem[0000000030141410] = e603ffff 00000000
	stda	%f8 ,[%i5+%o5]0x89	! Mem[0000000030141410] = e8920000 91800000
!	%l4 = ffffffff8bde857b, Mem[0000000010081400] = ffffffff
	stwa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 8bde857b
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000ff, %f23 = 00000000
	lda	[%i5+%o4]0x80,%f23	! %f23 = 000000ff

p0_label_141:
!	Mem[00000000100c1408] = ff000000399c4442, %l5 = 00000000ffffffff
	ldxa	[%i3+%o4]0x80,%l5	! %l5 = ff000000399c4442
!	Mem[0000000030081410] = 000000ffff000000, %l1 = 00000000000000d0
	ldxa	[%i2+%o5]0x81,%l1	! %l1 = 000000ffff000000
!	Mem[00000000300c1400] = 00ff0000, %l1 = 000000ffff000000
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181424] = 62051572, %l6 = 0000000000000049
	lduw	[%i6+0x024],%l6		! %l6 = 0000000062051572
!	Mem[0000000030141408] = 000000e600000000, %f8  = e8920000 91800000
	ldda	[%i5+%o4]0x81,%f8 	! %f8  = 000000e6 00000000
!	Mem[0000000030081410] = ff000000, %l0 = ffffffffffffffff
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = 00000000 00000056, %l4 = 8bde857b, %l5 = 399c4442
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000056 0000000000000000
!	Mem[0000000010081400] = ffffffff8bde857b, %l4 = 0000000000000056
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = ffffffff8bde857b
!	Mem[00000000100c1410] = 7b85de8bffffffff, %f22 = ff000000 000000ff
	ldda	[%i3+%o5]0x80,%f22	! %f22 = 7b85de8b ffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ff00, Mem[00000000300c1400] = 00ff0000
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000ff00

p0_label_142:
!	%f14 = c44e2ba6 b0538f8d, Mem[0000000030041410] = 7b85de8b 00000061
	stda	%f14,[%i1+%o5]0x89	! Mem[0000000030041410] = c44e2ba6 b0538f8d
!	%f10 = 6e0b7f3a e603ff57, %l0 = 0000000000000000
!	Mem[0000000010001438] = 42449c394bc84cff
	add	%i0,0x038,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010001438] = 42449c394bc84cff
!	%l0 = 0000000000000000, Mem[000000001008140c] = 925f783b, %asi = 80
	stwa	%l0,[%i2+0x00c]%asi	! Mem[000000001008140c] = 00000000
!	Mem[0000000010101408] = 00000042, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000042
!	%f10 = 6e0b7f3a e603ff57, Mem[0000000010081400] = 8bde857b ffffffff
	stda	%f10,[%i2+%g0]0x88	! Mem[0000000010081400] = 6e0b7f3a e603ff57
!	Mem[0000000010041410] = 00000056, %l4 = ffffffff8bde857b
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000056
!	%l6 = 0000000062051572, Mem[0000000010041410] = 8bde857b
	stba	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 8bde8572
!	%l0 = 0000000000000000, Mem[0000000010081408] = bdb9d26600000000, %asi = 80
	stxa	%l0,[%i2+0x008]%asi	! Mem[0000000010081408] = 0000000000000000
!	%l0 = 00000000, %l1 = 00000042, Mem[0000000030081400] = 000000ff ffffffff
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 00000042
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ff9ec5ffdadb7aee, %l2 = 000000008bde857b
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = ff9ec5ffdadb7aee

p0_label_143:
!	Mem[0000000030081400] = 00000000, %l2 = ff9ec5ffdadb7aee
	ldsba	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 000092ff, %l4 = 0000000000000056
	lduwa	[%i5+%g0]0x88,%l4	! %l4 = 00000000000092ff
!	Mem[00000000300c1408] = 925f00ff, %l0 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001408] = 0000d2ff, %f27 = e603ff57
	lda	[%i0+%o4]0x89,%f27	! %f27 = 0000d2ff
!	Code Fragment 4
p0_fragment_10:
!	%l0 = ffffffffffffffff
	setx	0x85d23c37c729bdde,%g7,%l0 ! %l0 = 85d23c37c729bdde
!	%l1 = 0000000000000042
	setx	0xda0784dfe3638084,%g7,%l1 ! %l1 = da0784dfe3638084
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 85d23c37c729bdde
	setx	0x9ec3ed2874ed0784,%g7,%l0 ! %l0 = 9ec3ed2874ed0784
!	%l1 = da0784dfe3638084
	setx	0x60e59c27dea2f9ab,%g7,%l1 ! %l1 = 60e59c27dea2f9ab
!	Mem[0000000010141438] = b366fae9, %l7 = 000000000000ff00
	ldswa	[%i5+0x038]%asi,%l7	! %l7 = ffffffffb366fae9
!	Mem[0000000030141408] = 00000000e6000000, %f20 = d0fdec68 8bde857b
	ldda	[%i5+%o4]0x89,%f20	! %f20 = 00000000 e6000000
!	Mem[0000000030141408] = 00000000e6000000, %f4  = 0000ebdc ff0000ff
	ldda	[%i5+%o4]0x89,%f4 	! %f4  = 00000000 e6000000
!	Mem[0000000021800100] = ffbd02e9, %l3 = ffffffffffffffd2
	ldsb	[%o3+0x101],%l3		! %l3 = ffffffffffffffbd
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ffffffff, %l4 = 00000000000092ff
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 000000ff000000ff

p0_label_144:
!	%f18 = 05aad266 925f00ff, Mem[0000000010141410] = ff03ff57 68ecfdd0
	std	%f18,[%i5+%o5]	! Mem[0000000010141410] = 05aad266 925f00ff
!	Mem[0000000010141408] = 000000ff, %l5 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = bdff4c16, %l6 = 0000000062051572
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 000000bd000000ff
!	%l1 = 60e59c27dea2f9ab, Mem[000000001008143e] = baecbc6e, %asi = 80
	stha	%l1,[%i2+0x03e]%asi	! Mem[000000001008143c] = baecf9ab
!	Mem[0000000030081400] = 00000000, %l0 = 9ec3ed2874ed0784
	ldstuba	[%i2+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Randomly selected nop
	nop
!	%f11 = e603ff57, %f5  = e6000000
	fsqrts	%f11,%f5 		! %f5  = 7fffffff
!	%l7 = ffffffffb366fae9, Mem[0000000030001408] = 0000d2ff
	stba	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000d2e9
!	%l5 = 00000000000000ff, Mem[0000000030041410] = b0538f8d
	stba	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = b0538fff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 7b85de8b, %l7 = ffffffffb366fae9
	ldsha	[%i3+%o5]0x80,%l7	! %l7 = 0000000000007b85

p0_label_145:
!	Mem[0000000010181408] = 00000039, %f12 = 00395b1c
	lda	[%i6+%o4]0x80,%f12	! %f12 = 00000039
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000030041400] = c44e2ba6 b0538f8d ff9ec5ff dadb7aee
!	Mem[0000000030041410] = ff8f53b0 a62b4ec4 d525960b 99ec8220
!	Mem[0000000030041420] = 129bb126 4a03e98c 31a4ff9c 23d02031
!	Mem[0000000030041430] = c11b38cf 82b05f48 79d280ff b20000b8
	ldda	[%i1]ASI_BLK_AIUS,%f0	! Block Load from 0000000030041400
!	Mem[00000000100c1400] = 00000000, %l5 = 00000000000000ff
	ldsha	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 39000000, %l4 = 00000000000000ff
	lduwa	[%i6+%o4]0x88,%l4	! %l4 = 0000000039000000
!	Mem[0000000010081400] = e603ff57, %l5 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 000000000000ff57
!	Mem[0000000010141400] = ff920000, %l2 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l2	! %l2 = 00000000ff920000
!	Mem[0000000010041438] = 4791ccb6, %l1 = 60e59c27dea2f9ab
	lduba	[%i1+0x03a]%asi,%l1	! %l1 = 00000000000000cc
!	%l2 = 00000000ff920000, %l1 = 00000000000000cc, %y  = 0000004a
	udiv	%l2,%l1,%l6		! %l6 = 000000005e1d9414
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010101420] = ffffaa05, %l0 = 0000000000000000
	lduw	[%i4+0x020],%l0		! %l0 = 00000000ffffaa05
!	Starting 10 instruction Store Burst
!	%f24 = e8920000 ffd20000, Mem[0000000010001410] = ff000000 61000000
	stda	%f24,[%i0+%o5]0x80	! Mem[0000000010001410] = e8920000 ffd20000

p0_label_146:
!	%f16 = 1c5b3900 1cc59eff, Mem[0000000010181408] = 00000039 0072ad82
	stda	%f16,[%i6+%o4]0x80	! Mem[0000000010181408] = 1c5b3900 1cc59eff
!	Mem[0000000010141400] = ff920000, %l4 = 0000000039000000
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 00000000ff920000
!	Mem[0000000010101410] = 0000004200000061, %l6 = 000000005e1d9414, %l4 = 00000000ff920000
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = 0000004200000061
!	%f30 = c44e2ba6 000000e6, Mem[0000000010181408] = 00395b1c ff9ec51c
	stda	%f30,[%i6+%o4]0x88	! Mem[0000000010181408] = c44e2ba6 000000e6
!	Mem[0000000010101408] = 00000000, %l0 = 00000000ffffaa05
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%f21 = e6000000, Mem[0000000030081400] = ff000000
	sta	%f21,[%i2+%g0]0x81	! Mem[0000000030081400] = e6000000
!	Mem[0000000030181408] = 7b85de8b, %l4 = 0000004200000061
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 0000008b000000ff
!	%f28 = 8d8f53b0 a62b4ec4, Mem[0000000030141400] = 00000061 ffffffbd
	stda	%f28,[%i5+%g0]0x89	! Mem[0000000030141400] = 8d8f53b0 a62b4ec4
!	%l3 = ffffffffffffffbd, Mem[0000000030101410] = 00ff0000000000ff
	stxa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffffffffffbd
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l4 = 000000000000008b
	lduha	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_147:
!	Mem[0000000030001400] = 05aad26600395bbd, %f22 = 7b85de8b ffffffff
	ldda	[%i0+%g0]0x89,%f22	! %f22 = 05aad266 00395bbd
!	Mem[0000000010081408] = 00000000 00000000, %l4 = 00000000, %l5 = 0000ff57
	ldda	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010141428] = bc3a65129efa5dd9, %f30 = c44e2ba6 000000e6
	ldda	[%i5+0x028]%asi,%f30	! %f30 = bc3a6512 9efa5dd9
!	Mem[0000000010141438] = b366fae9, %l4 = 0000000000000000
	lduba	[%i5+0x03b]%asi,%l4	! %l4 = 00000000000000e9
!	Mem[0000000030001408] = 0000d2e9, %f22 = 05aad266
	lda	[%i0+%o4]0x89,%f22	! %f22 = 0000d2e9
!	Mem[0000000010181400] = 000000ff, %l1 = 00000000000000cc
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141410] = 00008091, %l0 = 0000000000000000
	ldsba	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = 00d06986, %l3 = ffffffffffffffbd
	ldsb	[%o2+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141420] = c1821f242c4f74a5, %f24 = e8920000 ffd20000
	ldda	[%i5+0x020]%asi,%f24	! %f24 = c1821f24 2c4f74a5
!	Starting 10 instruction Store Burst
!	%l4 = 000000e9, %l5 = 00000000, Mem[00000000300c1410] = ff0000ff 7fd1bbc9
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000e9 00000000

p0_label_148:
!	Mem[0000000030081408] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%l6 = 000000005e1d9414, Mem[0000000020800041] = ff00e22a, %asi = 80
	stba	%l6,[%o1+0x041]%asi	! Mem[0000000020800040] = ff14e22a
!	Mem[00000000100c1410] = 8bde857b, %l7 = 0000000000007b85
	swapa	[%i3+%o5]0x88,%l7	! %l7 = 000000008bde857b
!	Mem[0000000030181400] = 0000d2ff, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%f19 = 925f00ff, Mem[0000000010181410] = 00020000
	sta	%f19,[%i6+%o5]0x80	! Mem[0000000010181410] = 925f00ff
!	Mem[0000000010101400] = 00000042, %l3 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000042
!	Mem[0000000010081434] = 6e0b7f3a, %l1 = 0000000000000000
	swap	[%i2+0x034],%l1		! %l1 = 000000006e0b7f3a
!	Mem[0000000030001408] = 0000d2e9, %l4 = 00000000000000e9
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 000000e9000000ff
!	%l7 = 000000008bde857b, Mem[0000000010141404] = ffffffda, %asi = 80
	stwa	%l7,[%i5+0x004]%asi	! Mem[0000000010141404] = 8bde857b
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 0000ff00 d204d56c, %l4 = 000000e9, %l5 = 000000ff
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 000000000000ff00 00000000d204d56c

p0_label_149:
!	Mem[00000000218000c0] = 3a0fcd1f, %l3 = 0000000000000042
	ldub	[%o3+0x0c1],%l3		! %l3 = 000000000000000f
!	Mem[0000000010081408] = 00000000, %l6 = 000000005e1d9414
	ldsha	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 00000039, %l5 = 00000000d204d56c
	ldsha	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000039
!	Mem[0000000030101400] = 8bde857b e603ff57, %l6 = 00000000, %l7 = 8bde857b
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 000000008bde857b 00000000e603ff57
!	Mem[00000000300c1410] = 00000000e9000000, %l0 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l0	! %l0 = 00000000e9000000
!	Mem[0000000030141400] = a62b4ec4, %l3 = 000000000000000f
	lduba	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000c4
!	Mem[00000000300c1408] = ff005f9266d2aa05, %l5 = 0000000000000039
	ldxa	[%i3+%o4]0x81,%l5	! %l5 = ff005f9266d2aa05
!	Mem[0000000010081408] = 00000000, %l2 = 00000000ff920000
	lduba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = ffff4c16, %l2 = 0000000000000000
	ldub	[%o0+0x001],%l2		! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f2  = ff9ec5ff, Mem[0000000010141400] = 00000039
	sta	%f2 ,[%i5+%g0]0x88	! Mem[0000000010141400] = ff9ec5ff

p0_label_150:
!	%f12 = c11b38cf 82b05f48, %l2 = 00000000000000ff
!	Mem[0000000010041400] = fffd00ff00000000
	stda	%f12,[%i1+%l2]ASI_PST16_P ! Mem[0000000010041400] = c11b38cf82b05f48
!	%l4 = 000000000000ff00, Mem[0000000030001408] = 0000d2ff
	stwa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000ff00
!	Mem[0000000030141408] = e6000000, %l4 = 000000000000ff00
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 00000000e6000000
!	Mem[00000000100c1408] = 000000ff, %l5 = ff005f9266d2aa05
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%l7 = 00000000e603ff57, Mem[0000000010141437] = c2208e22, %asi = 80
	stba	%l7,[%i5+0x037]%asi	! Mem[0000000010141434] = c2208e57
!	%l7 = 00000000e603ff57, Mem[0000000010101410] = 42000000
	stba	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 42000057
!	%f16 = 1c5b3900 1cc59eff 05aad266 925f00ff
!	%f20 = 00000000 e6000000 0000d2e9 00395bbd
!	%f24 = c1821f24 2c4f74a5 6e0b7f3a 0000d2ff
!	%f28 = 8d8f53b0 a62b4ec4 bc3a6512 9efa5dd9
	stda	%f16,[%i2]ASI_BLK_AIUS	! Block Store to 0000000030081400
!	%l5 = 00000000000000ff, Mem[0000000010181408] = c44e2ba6000000e6
	stxa	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000000000ff
!	Mem[0000000020800000] = 00ff5a05, %l3 = 00000000000000c4
	ldstuba	[%o1+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 857b0000, %l6 = 000000008bde857b
	lduba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000085

p0_label_151:
!	Mem[0000000010041410] = 7285de8b, %l3 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000072
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000030081408] = 66d2aa05, %l3 = 0000000000000072
	lduba	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000005
!	Mem[0000000030181408] = 7b85deff, %l2 = 00000000000000ff
	ldswa	[%i6+%o4]0x89,%l2	! %l2 = 000000007b85deff
!	Mem[0000000010081438] = ff9ec5ea, %l0 = 00000000e9000000
	ldsh	[%i2+0x038],%l0		! %l0 = ffffffffffffff9e
!	Mem[00000000300c1400] = 0000ff00, %l5 = 00000000000000ff
	lduba	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = 00ff0000, %l3 = 0000000000000005
	lduha	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041408] = ffffffff, %l3 = 00000000000000ff
	ldsha	[%i1+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000211c0000] = 00d06986, %l0 = ffffffffffffff9e
	ldsh	[%o2+%g0],%l0		! %l0 = 00000000000000d0
!	Mem[0000000010181400] = ff000000 00000000 ff000000 00000000
!	Mem[0000000010181410] = 925f00ff 000000ff da00b270 00fff89b
!	Mem[0000000010181420] = d2ff1b72 62051572 000003e6 cc7e6d15
!	Mem[0000000010181430] = 6f273e24 f86a0000 8d8f53b0 a62b4ec4
	ldda	[%i6]ASI_BLK_AIUP,%f0	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000300c1408] = 925f00ff
	stba	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 925f0000

p0_label_152:
!	%l4 = 00000000e6000000, Mem[0000000010001400] = ff00000000000000
	stxa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000e6000000
!	Mem[0000000030081408] = 66d2aa05, %l1 = 000000006e0b7f3a
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 00000005000000ff
!	Mem[0000000021800141] = 9f38e548, %l5 = 0000000000000000
	ldstuba	[%o3+0x141]%asi,%l5	! %l5 = 00000038000000ff
!	Mem[00000000100c1438] = 9f000000, %l0 = 000000d0, %l1 = 00000005
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 000000009f000000
!	%l7 = 00000000e603ff57, Mem[00000000211c0000] = 00d06986, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff576986
!	Mem[0000000010181428] = 000003e6, %l6 = 0000000000000085
	swap	[%i6+0x028],%l6		! %l6 = 00000000000003e6
!	%l4 = 00000000e6000000, Mem[0000000030001408] = 00ff0000
	stwa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = e6000000
!	%l7 = 00000000e603ff57, Mem[0000000010141400] = ffc59eff
	stha	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = ff579eff
!	%l0 = 00000000000000d0, Mem[0000000030101408] = ffffffda
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffd0
!	Starting 10 instruction Load Burst
!	Mem[000000001004142c] = 0072ff82, %l3 = ffffffffffffffff
	lduwa	[%i1+0x02c]%asi,%l3	! %l3 = 000000000072ff82

p0_label_153:
!	Mem[00000000100c1400] = 00000000 9a000000 05aad266 399c4442
!	Mem[00000000100c1410] = 857b0000 ffffffff 003981d1 721c8243
!	Mem[00000000100c1420] = 00009aff c9bbd17f 19b35966 ff9ec5ff
!	Mem[00000000100c1430] = 26bfa66f 61602d68 9f000000 a625bcc7
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	%l5 = 0000000000000038, %l5 = 0000000000000038, %l3 = 000000000072ff82
	orn	%l5,%l5,%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = 00000000, %l6 = 00000000000003e6
	lduwa	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l0 = 00000000000000d0
	lduwa	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1428] = 19b35966, %l6 = 0000000000000000
	ldsw	[%i3+0x028],%l6		! %l6 = 0000000019b35966
!	Mem[0000000010181408] = ff000000, %l4 = 00000000e6000000
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l2 = 000000007b85deff
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = 00ff0000, %l5 = 0000000000000038
	lduha	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041408] = ffc59eff, %l4 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = e6000000, %l4 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 00000000e6000000

p0_label_154:
!	Mem[0000000010141400] = ff579eff, %l0 = 0000000000000000, %asi = 80
	swapa	[%i5+0x000]%asi,%l0	! %l0 = 00000000ff579eff
!	%l5 = 00000000000000ff, Mem[0000000030041410] = b0538fff
	stha	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = b05300ff
!	Mem[0000000010081410] = 000000ff, %l6 = 0000000019b35966
	ldstuba	[%i2+%o5]0x88,%l6	! %l6 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (26)
!	%l0 = 00000000ff579eff, Mem[0000000010181410] = ff005f92
	stwa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = ff579eff
!	Mem[0000000010181400] = 000000ff, %l7 = 00000000e603ff57
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l4 = 00000000e6000000, Mem[00000000100c1400] = 00000000
	stha	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l3 = ffffffffffffffff, Mem[0000000010181408] = 000000ff
	stwa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffff
!	Mem[00000000211c0001] = ff576986, %l3 = ffffffffffffffff
	ldstub	[%o2+0x001],%l3		! %l3 = 00000057000000ff
!	Mem[0000000010041400] = cf381bc1, %l1 = 000000009f000000
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 000000c1000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff000000, %l7 = 00000000000000ff
	ldsba	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000

p0_label_155:
!	Mem[0000000010041400] = cf381bff, %l5 = 00000000000000ff
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001410] = e8920000ffd20000, %f0  = 00000000 9a000000
	ldda	[%i0+%o5]0x80,%f0 	! %f0  = e8920000 ffd20000
!	Mem[0000000020800040] = ff14e22a, %l2 = 0000000000000000
	ldsba	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101410] = ffffffff, %l3 = 0000000000000057
	ldsha	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141400] = 00000000 8bde857b 00000000 ffffffee
!	Mem[0000000010141410] = 05aad266 925f00ff ff26f386 bc71357b
!	Mem[0000000010141420] = c1821f24 2c4f74a5 bc3a6512 9efa5dd9
!	Mem[0000000010141430] = 1100b3a7 c2208e57 b366fae9 00000000
	ldda	[%i5]ASI_BLK_P,%f0	! Block Load from 0000000010141400
!	Mem[0000000030041410] = ff0053b0a62b4ec4, %l2 = ffffffffffffffff
	ldxa	[%i1+%o5]0x81,%l2	! %l2 = ff0053b0a62b4ec4
!	Mem[00000000100c1410] = 00007b85, %l1 = 00000000000000c1
	ldsha	[%i3+%o5]0x88,%l1	! %l1 = 0000000000007b85
!	Mem[0000000010141408] = 00000000ffffffee, %f30 = bc3a6512 9efa5dd9
	ldda	[%i5+%o4]0x80,%f30	! %f30 = 00000000 ffffffee
!	Mem[0000000010041400] = ff1b38cf, %l4 = 00000000e6000000
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffff1b
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ffff4c16, %l6 = 00000000000000ff
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff

p0_label_156:
!	%l4 = ffffffffffffff1b, Mem[0000000010101400] = 00000000
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000ff1b
!	%l2 = ff0053b0a62b4ec4, Mem[0000000030101410] = ffffffff
	stha	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 4ec4ffff
!	Mem[000000001008140c] = 00000000, %l0 = 00000000ff579eff
	ldstuba	[%i2+0x00c]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081414] = f13bffa7, %l0 = 0000000000000000, %asi = 80
	swapa	[%i2+0x014]%asi,%l0	! %l0 = 00000000f13bffa7
!	Mem[0000000030141408] = 0000ff00, %l0 = 00000000f13bffa7
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010101410] = 42000057, %l0 = 000000000000ff00
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 00000057000000ff
!	%l2 = ff0053b0a62b4ec4, Mem[0000000030101410] = bdffffffffffc44e
	stxa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = ff0053b0a62b4ec4
!	%f23 = 00395bbd, Mem[0000000030041400] = a62b4ec4
	sta	%f23,[%i1+%g0]0x89	! Mem[0000000030041400] = 00395bbd
!	%f19 = 925f00ff, Mem[0000000010041400] = cf381bff
	sta	%f19,[%i1+%g0]0x88	! Mem[0000000010041400] = 925f00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffffff, %l0 = 0000000000000057
	ldswa	[%i6+%o4]0x80,%l0	! %l0 = ffffffffffffffff

p0_label_157:
!	Mem[0000000010101430] = 2a76800a, %l0 = ffffffffffffffff
	lduba	[%i4+0x032]%asi,%l0	! %l0 = 0000000000000080
!	Mem[00000000100c1408] = 05aad266, %l1 = 0000000000007b85
	ldsha	[%i3+%o4]0x80,%l1	! %l1 = 00000000000005aa
!	Mem[0000000010041410] = 8bde8572, %l0 = 0000000000000080
	lduba	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000072
!	Mem[0000000010001408] = baecbc6eff9ec51c, %f26 = 6e0b7f3a 0000d2ff
	ldda	[%i0+%o4]0x88,%f26	! %f26 = baecbc6e ff9ec51c
!	Mem[0000000030041408] = ff9ec5ff, %l3 = ffffffffffffffff
	lduba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = ff9e57ff, %l1 = 00000000000005aa
	lduha	[%i6+%o5]0x80,%l1	! %l1 = 000000000000ff9e
!	Mem[00000000100c1408] = 05aad266, %l5 = ffffffffffffffff
	ldsba	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000005
!	Mem[0000000010101400] = 1bff0000, %l1 = 000000000000ff9e
	ldswa	[%i4+%g0]0x80,%l1	! %l1 = 000000001bff0000
!	Mem[0000000010101408] = ff000000ffd2aa05, %l7 = 0000000000000000
	ldx	[%i4+%o4],%l7		! %l7 = ff000000ffd2aa05
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = ffff6986, %l2 = ff0053b0a62b4ec4
	ldstub	[%o2+0x001],%l2		! %l2 = 000000ff000000ff

p0_label_158:
!	%l1 = 000000001bff0000, Mem[0000000030141408] = f13bffa7
	stwa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 1bff0000
!	Mem[0000000010141408] = 00000000, %l1 = 000000001bff0000
	ldswa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (27)
!	%l6 = 00000000000000ff, Mem[0000000010141410] = 05aad266
	stha	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00ffd266
!	%l0 = 0000000000000072, Mem[00000000211c0000] = ffff6986, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00726986
!	Mem[000000001010142a] = 00020000, %l1 = 0000000000000000
	ldstub	[%i4+0x02a],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010001416] = ffd20000, %l2 = 00000000000000ff
	ldstuba	[%i0+0x016]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = 00005f92, %l4 = ffffffffffffff1b
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000005f92
!	%l0 = 0000000000000072, Mem[00000000300c1408] = ffffff1b
	stwa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000072
!	%f0  = 00000000 8bde857b, %l5 = 0000000000000005
!	Mem[0000000010041438] = 4791ccb687452406
	add	%i1,0x038,%g1
	stda	%f0,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010041438] = 7b85ccb600002406
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l3 = 00000000000000ff
	lduha	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_159:
!	Mem[0000000010001410] = 000092e8, %l4 = 0000000000005f92
	lduha	[%i0+%o5]0x88,%l4	! %l4 = 00000000000092e8
!	Mem[0000000010041408] = ffffffff, %l2 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1410] = 00007b85, %l2 = ffffffffffffffff
	ldswa	[%i3+%o5]0x88,%l2	! %l2 = 0000000000007b85
!	Mem[0000000030101400] = 8bde857b, %l2 = 0000000000007b85
	ldsba	[%i4+%g0]0x81,%l2	! %l2 = ffffffffffffff8b
!	Mem[0000000010181408] = 00000000 ffffffff, %l2 = ffffff8b, %l3 = 00000000
	ldda	[%i6+%o4]0x88,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[0000000010141408] = 00000000, %l1 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[000000001004140c] = 6f273e24, %l3 = 0000000000000000
	lduw	[%i1+0x00c],%l3		! %l3 = 000000006f273e24
!	Mem[0000000010181410] = ff9e57ff 000000ff, %l6 = 000000ff, %l7 = ffd2aa05
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff9e57ff 00000000000000ff
!	Mem[00000000201c0000] = ffff4c16, %l2 = 00000000ffffffff
	ldsh	[%o0+%g0],%l2		! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff9e57ff, Mem[0000000010001408] = 1cc59eff
	stha	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 57ff9eff

p0_label_160:
!	Mem[0000000030001410] = 00ff0000, %l6 = 00000000ff9e57ff
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 0000000000ff0000
!	Mem[00000000100c1408] = 05aad266, %l4 = 00000000000092e8
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 0000000005aad266
!	%l1 = 0000000000000000, Mem[0000000010141410] = ff005f9266d2ff00
	stxa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	%f30 = 00000000 ffffffee, Mem[0000000030101410] = a62b4ec4 ff0053b0
	stda	%f30,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 ffffffee
!	%l6 = 0000000000ff0000, Mem[0000000030041400] = 00395bbd
	stha	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00390000
!	Mem[0000000030041400] = 00003900, %l7 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = 1bff0000, %l4 = 0000000005aad266
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 000000001bff0000
!	%l3 = 000000006f273e24, Mem[0000000030101400] = 8bde857b
	stba	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 24de857b
!	%l4 = 000000001bff0000, Mem[0000000020800040] = ff14e22a, %asi = 80
	stha	%l4,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000e22a
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 000000e9, %l7 = 0000000000000000
	ldsba	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_161:
!	Mem[0000000010101408] = ff000000, %l3 = 000000006f273e24
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001408] = 9c000000 ff000000, %l6 = 00ff0000, %l7 = 00000000
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000ff000000 000000009c000000
!	Mem[0000000010041410] = 7285de8b00000000, %l3 = 00000000000000ff
	ldx	[%i1+%o5],%l3		! %l3 = 7285de8b00000000
!	Mem[0000000030001408] = ff000000, %l5 = 0000000000000005
	lduwa	[%i0+%o4]0x89,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030041408] = ffc59eff, %l5 = 00000000ff000000
	lduba	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = bd5b3900 66d2aa05, %l6 = ff000000, %l7 = 9c000000
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 00000000bd5b3900 0000000066d2aa05
!	Mem[0000000010101400] = 1bff0000ff03ff57, %l6 = 00000000bd5b3900
	ldx	[%i4+%g0],%l6		! %l6 = 1bff0000ff03ff57
!	Mem[0000000010001420] = 57ffffe600ff00ff, %l7 = 0000000066d2aa05
	ldxa	[%i0+0x020]%asi,%l7	! %l7 = 57ffffe600ff00ff
!	Mem[0000000010001408] = ff9eff57, %l1 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l1	! %l1 = 00000000ff9eff57
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = ffde857b, %l4 = 000000001bff0000
	ldstuba	[%i6+%o4]0x81,%l4	! %l4 = 000000ff000000ff

p0_label_162:
!	%l5 = 00000000000000ff, Mem[0000000010001400] = e6000000
	stha	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = e60000ff
!	Mem[0000000010041402] = ff005f92, %l7 = 57ffffe600ff00ff
	ldstub	[%i1+0x002],%l7		! %l7 = 0000005f000000ff
!	%l2 = ffffffffffffffff, Mem[0000000030001400] = bd5b390066d2aa05
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffffffffffff
!	%l3 = 7285de8b00000000, Mem[0000000030001410] = ff9e57ff
	stba	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 009e57ff
!	%l6 = ff03ff57, %l7 = 0000005f, Mem[0000000010041408] = ffffffff 243e276f
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = ff03ff57 0000005f
!	%f25 = 2c4f74a5, Mem[0000000010101438] = 00000000
	st	%f25,[%i4+0x038]	! Mem[0000000010101438] = 2c4f74a5
!	Mem[0000000010101408] = 000000ff, %l1 = 00000000ff9eff57
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[00000000300c1408] = 0000007266d2aa05
	stxa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000ff
!	%f6  = ff26f386 bc71357b, Mem[0000000010101410] = ff000042 00000061
	stda	%f6 ,[%i4+%o5]0x80	! Mem[0000000010101410] = ff26f386 bc71357b
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff003900 b0538f8d, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 00000000ff003900 00000000b0538f8d

p0_label_163:
!	Mem[0000000010001410] = e8920000, %l1 = 00000000000000ff
	ldsw	[%i0+%o5],%l1		! %l1 = ffffffffe8920000
!	Mem[0000000010181408] = ffffffff, %l6 = 1bff0000ff03ff57
	ldsba	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1410] = 00007b85, %l3 = 00000000b0538f8d
	ldswa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000007b85
!	Mem[00000000300c1408] = ff00000000000000, %f28 = 8d8f53b0 a62b4ec4
	ldda	[%i3+%o4]0x89,%f28	! %f28 = ff000000 00000000
!	Mem[0000000010081410] = 000000ff, %l5 = 00000000000000ff
	ldsha	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000218001c0] = 830ace35, %l6 = ffffffffffffffff
	ldub	[%o3+0x1c0],%l6		! %l6 = 0000000000000083
!	Mem[0000000030081408] = ffaad266, %l1 = ffffffffe8920000
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 00000000ffaad266
!	Mem[0000000030141410] = 91800000, %l4 = 00000000000000ff
	lduwa	[%i5+%o5]0x89,%l4	! %l4 = 0000000091800000
!	Mem[0000000010041400] = ff00ff9282b05f48, %f12 = 1100b3a7 c2208e57
	ldda	[%i1+0x000]%asi,%f12	! %f12 = ff00ff92 82b05f48
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = a62b4ec4, %l7 = 000000000000005f
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 000000c4000000ff

p0_label_164:
!	%l3 = 0000000000007b85, Mem[0000000020800001] = ffff5a05, %asi = 80
	stba	%l3,[%o1+0x001]%asi	! Mem[0000000020800000] = ff855a05
!	%f26 = baecbc6e ff9ec51c, %l3 = 0000000000007b85
!	Mem[0000000010081408] = 00000000ff000000
	add	%i2,0x008,%g1
	stda	%f26,[%g1+%l3]ASI_PST32_P ! Mem[0000000010081408] = 00000000ff9ec51c
!	%l6 = 00000083, %l7 = 000000c4, Mem[0000000030001400] = ffffffff ffffffff
	stda	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000083 000000c4
!	%l1 = 00000000ffaad266, Mem[0000000030181410] = 7b85de8b
	stha	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 7b85d266
!	%l4 = 91800000, %l5 = 000000ff, Mem[00000000300c1408] = 00000000 000000ff
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 91800000 000000ff
!	%l4 = 91800000, %l5 = 000000ff, Mem[0000000030101400] = 7b85de24 57ff03e6
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 91800000 000000ff
!	%l6 = 0000000000000083, Mem[0000000030081408] = ff005f9266d2aaff
	stxa	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000083
!	%l5 = 00000000000000ff, Mem[0000000030141408] = 66d2aa0500000000
	stxa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000000000ff
!	Mem[00000000300c1410] = 000000e9, %l5 = 00000000000000ff
	swapa	[%i3+%o5]0x81,%l5	! %l5 = 00000000000000e9
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = 94f7d108, %l3 = 0000000000007b85
	ldsb	[%o3+%g0],%l3		! %l3 = ffffffffffffff94

p0_label_165:
!	Mem[0000000030001408] = 000000ff, %l5 = 00000000000000e9
	ldsba	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = 00000000000000ff, %f18 = 05aad266 925f00ff
	ldda	[%i5+%o4]0x81,%f18	! %f18 = 00000000 000000ff
!	Mem[0000000010101410] = ff26f386, %l3 = ffffffffffffff94
	lduha	[%i4+0x012]%asi,%l3	! %l3 = 000000000000f386
!	Mem[0000000010001410] = 00ffd2ff000092e8, %f24 = c1821f24 2c4f74a5
	ldda	[%i0+%o5]0x88,%f24	! %f24 = 00ffd2ff 000092e8
!	Mem[0000000030181400] = ffd20000, %l5 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l5	! %l5 = 000000000000ffd2
!	Mem[0000000010041408] = ff03ff57, %l7 = 00000000000000c4
	lduba	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000057
!	%f16 = 1c5b3900 1cc59eff 00000000 000000ff
!	%f20 = 00000000 e6000000 0000d2e9 00395bbd
!	%f24 = 00ffd2ff 000092e8 baecbc6e ff9ec51c
!	%f28 = ff000000 00000000 00000000 ffffffee
	stda	%f16,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
	membar	#Sync			! Added by membar checker (28)
!	Mem[00000000100c1410] = 857b0000, %l0 = 0000000000000072
	lduba	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000085
!	Mem[00000000100c1400] = 00000000 9a000000 000092e8 399c4442
!	Mem[00000000100c1410] = 857b0000 ffffffff 003981d1 721c8243
!	Mem[00000000100c1420] = 00009aff c9bbd17f 19b35966 ff9ec5ff
!	Mem[00000000100c1430] = 26bfa66f 61602d68 9f000000 a625bcc7
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	%f23 = 00395bbd, Mem[0000000010081408] = 00000000
	sta	%f23,[%i2+0x008]%asi	! Mem[0000000010081408] = 00395bbd

p0_label_166:
!	%l7 = 0000000000000057, Mem[0000000030141408] = 00000000000000ff
	stxa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000057
!	%f16 = 1c5b3900 1cc59eff, %l3 = 000000000000f386
!	Mem[0000000030101408] = d0ffffff00000042
	add	%i4,0x008,%g1
	stda	%f16,[%g1+%l3]ASI_PST16_S ! Mem[0000000030101408] = d0ff39001cc50042
!	%l3 = 000000000000f386, Mem[0000000030041408] = ffc59eff
	stha	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = ffc5f386
!	%l4 = 91800000, %l5 = 0000ffd2, Mem[0000000010141410] = 00000000 00000000
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 91800000 0000ffd2
!	%f26 = baecbc6e ff9ec51c, Mem[0000000030081410] = 00000000 000000e6
	stda	%f26,[%i2+%o5]0x89	! Mem[0000000030081410] = baecbc6e ff9ec51c
!	%f29 = 00000000, Mem[0000000010081408] = bd5b3900
	sta	%f29,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	Mem[0000000010181410] = ff9e57ff, %l3 = 000000000000f386
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	%l2 = ff003900, %l3 = 000000ff, Mem[0000000030141408] = 00000000 57000000
	stda	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = ff003900 000000ff
!	%f16 = 1c5b3900 1cc59eff 00000000 000000ff
!	%f20 = 00000000 e6000000 0000d2e9 00395bbd
!	%f24 = 00ffd2ff 000092e8 baecbc6e ff9ec51c
!	%f28 = ff000000 00000000 00000000 ffffffee
	stda	%f16,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = 6f273e24, %l0 = 0000000000000085
	ldsh	[%i6+0x030],%l0		! %l0 = 0000000000006f27

p0_label_167:
!	Mem[00000000211c0000] = 00726986, %l7 = 0000000000000057
	lduba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010041400] = 1c5b3900 1cc59eff, %l2 = ff003900, %l3 = 000000ff
	ldd	[%i1+%g0],%l2		! %l2 = 000000001c5b3900 000000001cc59eff
!	%l3 = 000000001cc59eff, Mem[0000000010081400] = e603ff57
	stha	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = e6039eff
!	Mem[00000000100c1400] = 0000009a 00000000, %l6 = 00000083, %l7 = 00000000
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000 000000000000009a
!	Mem[0000000010101408] = 05aad2ff000000ff, %l0 = 0000000000006f27
	ldxa	[%i4+%o4]0x88,%l0	! %l0 = 05aad2ff000000ff
!	Mem[0000000030101408] = d0ff39001cc50042, %l0 = 05aad2ff000000ff
	ldxa	[%i4+%o4]0x81,%l0	! %l0 = d0ff39001cc50042
!	Mem[0000000030081408] = 00000083, %l5 = 000000000000ffd2
	lduwa	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000083
!	Mem[0000000010041404] = 1cc59eff, %l1 = 00000000ffaad266
	ldsha	[%i1+0x004]%asi,%l1	! %l1 = 0000000000001cc5
!	Mem[0000000010101400] = 1bff0000, %l2 = 000000001c5b3900
	lduwa	[%i4+%g0]0x80,%l2	! %l2 = 000000001bff0000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000091800000, Mem[00000000100c1410] = 00007b85
	stha	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000

p0_label_168:
!	%l4 = 0000000091800000, Mem[0000000010101408] = ff000000ffd2aa05
	stx	%l4,[%i4+%o4]		! Mem[0000000010101408] = 0000000091800000
!	%l5 = 0000000000000083, Mem[0000000030181410] = 7b85d266
	stba	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 7b85d283
!	Mem[0000000010001401] = ff0000e6, %l4 = 0000000091800000
	ldstub	[%i0+0x001],%l4		! %l4 = 00000000000000ff
!	%l4 = 00000000, %l5 = 00000083, Mem[00000000300c1408] = 000000ff 00000000
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 00000083
!	%l5 = 0000000000000083, Mem[0000000010181420] = d2ff1b7262051572
	stx	%l5,[%i6+0x020]		! Mem[0000000010181420] = 0000000000000083
!	Mem[0000000010041410] = 00000000, %l7 = 000000000000009a
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%f15 = a625bcc7, Mem[0000000030001410] = ff579e00
	sta	%f15,[%i0+%o5]0x89	! Mem[0000000030001410] = a625bcc7
!	%l5 = 0000000000000083, Mem[0000000010041410] = 000000ff
	stba	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000083
!	%l2 = 1bff0000, %l3 = 1cc59eff, Mem[0000000030001410] = c7bc25a6 00000000
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 1bff0000 1cc59eff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = a62b4eff, %l4 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l4	! %l4 = 0000000000004eff

p0_label_169:
!	Mem[0000000010041410] = 00000083, %l1 = 0000000000001cc5
	lduba	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000083
!	Mem[0000000030141410] = 00008091, %l0 = d0ff39001cc50042
	lduha	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l4 = 0000000000004eff
	lduha	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = ffd20000 0000009c, %l6 = 00000000, %l7 = 00000000
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 00000000ffd20000 000000000000009c
!	Mem[0000000010001400] = e600ffff, %l3 = 000000001cc59eff
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 0000000000000000
	setx	0x7c672e50553a5984,%g7,%l0 ! %l0 = 7c672e50553a5984
!	%l1 = 0000000000000083
	setx	0xeeda8d6f87c276fb,%g7,%l1 ! %l1 = eeda8d6f87c276fb
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7c672e50553a5984
	setx	0xddf23a40766065e2,%g7,%l0 ! %l0 = ddf23a40766065e2
!	%l1 = eeda8d6f87c276fb
	setx	0x08821367ea956fec,%g7,%l1 ! %l1 = 08821367ea956fec
!	Mem[0000000010001410] = e8920000, %l4 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = ffffffffe8920000
!	Mem[0000000010141408] = 00000000ffffffee, %l6 = 00000000ffd20000
	ldxa	[%i5+%o4]0x80,%l6	! %l6 = 00000000ffffffee
!	Mem[00000000100c1428] = 19b35966ff9ec5ff, %f26 = baecbc6e ff9ec51c
	ldd	[%i3+0x028],%f26	! %f26 = 19b35966 ff9ec5ff
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffe8920000, Mem[0000000010001400] = e600ffff
	stha	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = e6000000

p0_label_170:
!	%f10 = 19b35966 ff9ec5ff, Mem[0000000010001400] = e6000000 00000000
	stda	%f10,[%i0+%g0]0x88	! Mem[0000000010001400] = 19b35966 ff9ec5ff
!	%f15 = a625bcc7, Mem[0000000010101400] = 1bff0000
	sta	%f15,[%i4+%g0]0x80	! Mem[0000000010101400] = a625bcc7
!	%f21 = e6000000, Mem[0000000030141408] = 003900ff
	sta	%f21,[%i5+%o4]0x81	! Mem[0000000030141408] = e6000000
!	%f30 = 00000000, Mem[000000001008142c] = 6e0b7f3a
	st	%f30,[%i2+0x02c]	! Mem[000000001008142c] = 00000000
!	%l7 = 000000000000009c, Mem[00000000201c0000] = ffff4c16, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 9cff4c16
!	%l6 = ffffffee, %l7 = 0000009c, Mem[0000000010081400] = ff9e03e6 3a7f0b6e
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffee 0000009c
!	%l0 = 766065e2, %l1 = ea956fec, Mem[0000000010081410] = ff000000 00000000
	std	%l0,[%i2+%o5]		! Mem[0000000010081410] = 766065e2 ea956fec
!	Mem[0000000020800040] = 0000e22a, %l7 = 000000000000009c
	ldstub	[%o1+0x040],%l7		! %l7 = 00000000000000ff
!	%f6  = 003981d1, Mem[0000000010101400] = a625bcc7
	sta	%f6 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 003981d1
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000000000083
	ldsha	[%i3+0x010]%asi,%l5	! %l5 = 0000000000000000

p0_label_171:
!	Mem[0000000010101434] = 89361fca, %l2 = 000000001bff0000
	lduba	[%i4+0x034]%asi,%l2	! %l2 = 0000000000000089
!	Mem[0000000030101410] = eeffffff, %l6 = 00000000ffffffee
	ldsha	[%i4+%o5]0x81,%l6	! %l6 = ffffffffffffeeff
!	Mem[0000000010141410] = 91800000, %f5  = ffffffff
	lda	[%i5+%o5]0x88,%f5 	! %f5 = 91800000
!	Mem[0000000010041408] = ff000000 00000000, %l2 = 00000089, %l3 = ffffffff
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000030001410] = 1bff00001cc59eff, %l2 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l2	! %l2 = 1bff00001cc59eff
!	Mem[0000000010181408] = ffffffff, %l0 = ddf23a40766065e2
	ldsha	[%i6+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081400] = ffffffee, %f14 = 9f000000
	lda	[%i2+%g0]0x80,%f14	! %f14 = ffffffee
!	Mem[0000000030001410] = 1bff0000, %l7 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l7	! %l7 = 000000000000001b
!	Mem[0000000010101408] = 0000809100000000, %l7 = 000000000000001b
	ldxa	[%i4+%o4]0x88,%l7	! %l7 = 0000809100000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ff9eff57, %l7 = 0000809100000000
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 00000057000000ff

p0_label_172:
!	%l6 = ffffffffffffeeff, Mem[0000000010001400] = 19b35966ff9ec5ff
	stxa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffffffffeeff
!	%l5 = 0000000000000000, Mem[000000001000141d] = 000000ff, %asi = 80
	stba	%l5,[%i0+0x01d]%asi	! Mem[000000001000141c] = 000000ff
!	%f7  = 721c8243, Mem[0000000010081408] = 00000000
	sta	%f7 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 721c8243
!	Mem[00000000211c0001] = 00726986, %l1 = 08821367ea956fec
	ldstub	[%o2+0x001],%l1		! %l1 = 00000072000000ff
!	%f18 = 00000000 000000ff, Mem[0000000010181400] = e603ff57 00000000
	stda	%f18,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 000000ff
!	Mem[0000000030141400] = ff4e2ba6, %l1 = 0000000000000072
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 00000000ff4e2ba6
!	Mem[0000000030001408] = 000000ff, %l0 = ffffffffffffffff
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001408] = ffff9eff, %l6 = ffffffffffffeeff
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 00000000ffff9eff
!	Mem[00000000201c0001] = 9cff4c16, %l2 = 1bff00001cc59eff
	ldstub	[%o0+0x001],%l2		! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff579eff, %l0 = 00000000000000ff
	ldsha	[%i6+%o5]0x88,%l0	! %l0 = ffffffffffff9eff

p0_label_173:
!	Mem[0000000010141408] = 00000000ffffffee, %f30 = 00000000 ffffffee
	ldda	[%i5+%o4]0x80,%f30	! %f30 = 00000000 ffffffee
!	Mem[0000000010141408] = eeffffff00000000, %l6 = 00000000ffff9eff
	ldxa	[%i5+%o4]0x88,%l6	! %l6 = eeffffff00000000
!	Mem[0000000020800000] = ff855a05, %l0 = ffffffffffff9eff
	lduh	[%o1+%g0],%l0		! %l0 = 000000000000ff85
!	Mem[0000000030141408] = e6000000 ff000000, %l0 = 0000ff85, %l1 = ff4e2ba6
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000e6000000 00000000ff000000
!	Mem[0000000030041408] = 86f3c5ff, %f14 = ffffffee
	lda	[%i1+%o4]0x81,%f14	! %f14 = 86f3c5ff
!	Mem[000000001018140c] = 00000000, %l7 = 0000000000000057
	ldsh	[%i6+0x00c],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101400] = d1813900, %f4  = 857b0000
	lda	[%i4+%g0]0x88,%f4 	! %f4 = d1813900
!	Mem[0000000010001400] = ffffeeff, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 00000000ffffeeff
!	Mem[0000000010101400] = 003981d1, %f11 = ff9ec5ff
	lda	[%i4+%g0]0x80,%f11	! %f11 = 003981d1
!	Starting 10 instruction Store Burst
!	%f4  = d1813900, Mem[0000000030181400] = 0000d2ff
	sta	%f4 ,[%i6+%g0]0x89	! Mem[0000000030181400] = d1813900

p0_label_174:
!	%l4 = e8920000, %l5 = 00000000, Mem[0000000030181410] = 7b85d283 57ff03e6
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = e8920000 00000000
!	%l7 = 00000000ffffeeff, Mem[0000000030141400] = 72000000
	stba	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 720000ff
!	Mem[0000000030041408] = ffc5f386, %l0 = 00000000e6000000
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 00000000ffc5f386
!	Mem[000000001010142b] = 0002ff00, %l0 = 00000000ffc5f386
	ldstub	[%i4+0x02b],%l0		! %l0 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010181406] = 00000000
	sth	%l5,[%i6+0x006]		! Mem[0000000010181404] = 00000000
!	Mem[0000000010141408] = 00000000, %l1 = 00000000ff000000
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l7 = 00000000ffffeeff, Mem[0000000030041410] = ff0053b0
	stba	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = ff0053b0
!	Mem[0000000010181410] = ff579eff, %l0 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000ff579eff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 83000000, %l1 = 0000000000000000
	ldswa	[%i0+%g0]0x81,%l1	! %l1 = ffffffff83000000

p0_label_175:
!	Mem[0000000030141410] = 91800000, %l2 = 0000000000000000
	ldswa	[%i5+%o5]0x89,%l2	! %l2 = ffffffff91800000
!	Mem[0000000030001400] = 00000083, %l6 = eeffffff00000000
	lduwa	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000083
!	Mem[0000000030101408] = d0ff3900, %f4  = d1813900
	lda	[%i4+%o4]0x81,%f4 	! %f4 = d0ff3900
!	Mem[0000000010101400] = 003981d1, %l2 = ffffffff91800000
	lduh	[%i4+0x002],%l2		! %l2 = 00000000000081d1
!	Mem[00000000201c0000] = 9cff4c16, %l1 = ffffffff83000000
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffff9cff
!	Mem[0000000010101420] = ffffaa05eef66bda, %f16 = 1c5b3900 1cc59eff
	ldd	[%i4+0x020],%f16	! %f16 = ffffaa05 eef66bda
!	Mem[00000000100c1404] = 9a000000, %l6 = 0000000000000083
	ldsha	[%i3+0x004]%asi,%l6	! %l6 = ffffffffffff9a00
!	Mem[00000000100c1438] = 9f000000a625bcc7, %l0 = 00000000ff579eff
	ldxa	[%i3+0x038]%asi,%l0	! %l0 = 9f000000a625bcc7
!	Mem[0000000020800040] = ff00e22a, %l5 = 0000000000000000
	ldsba	[%o1+0x040]%asi,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[0000000030181408] = 000000617b85deff
	stxa	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffffffffffff

p0_label_176:
!	%f29 = 00000000, Mem[0000000010101410] = ff26f386
	sta	%f29,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l5 = ffffffffffffffff, Mem[0000000010001400] = ffffeeff
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffeeff
!	%f16 = ffffaa05 eef66bda, Mem[00000000100c1408] = e8920000 42449c39
	stda	%f16,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffaa05 eef66bda
!	Mem[0000000010001410] = e8920000, %l6 = ffffffffffff9a00
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 000000e8000000ff
!	%l0 = a625bcc7, %l1 = ffff9cff, Mem[0000000010141420] = c1821f24 2c4f74a5
	std	%l0,[%i5+0x020]		! Mem[0000000010141420] = a625bcc7 ffff9cff
!	%l3 = 00000000ff000000, Mem[00000000201c0001] = 9cff4c16, %asi = 80
	stba	%l3,[%o0+0x001]%asi	! Mem[00000000201c0000] = 9c004c16
!	%f16 = ffffaa05 eef66bda 00000000 000000ff
!	%f20 = 00000000 e6000000 0000d2e9 00395bbd
!	%f24 = 00ffd2ff 000092e8 19b35966 ff9ec5ff
!	%f28 = ff000000 00000000 00000000 ffffffee
	stda	%f16,[%i5]ASI_COMMIT_S	! Block Store to 0000000030141400
!	Mem[0000000010101416] = bc71357b, %l7 = 00000000ffffeeff
	ldstuba	[%i4+0x016]%asi,%l7	! %l7 = 00000035000000ff
!	%l4 = e8920000, %l5 = ffffffff, Mem[0000000030041410] = ff0053b0 a62b4ec4
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = e8920000 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = eef66bda, %l2 = 00000000000081d1
	ldswa	[%i3+%o4]0x88,%l2	! %l2 = ffffffffeef66bda

p0_label_177:
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000030141410] = 00000000, %f9  = c9bbd17f
	lda	[%i5+%o5]0x81,%f9 	! %f9 = 00000000
!	Mem[00000000300c1408] = 0000008300000000, %l0 = 9f000000a625bcc7
	ldxa	[%i3+%o4]0x89,%l0	! %l0 = 0000008300000000
!	Mem[00000000300c1408] = 00000000, %l5 = ffffffffffffffff
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = ffffaa05, %l6 = 00000000000000e8
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101408] = 00000000, %l1 = ffffffffffff9cff
	ldsha	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = eeffffff000000ff, %l3 = 00000000ff000000
	ldxa	[%i5+%o4]0x88,%l3	! %l3 = eeffffff000000ff
!	Mem[000000001018143c] = a62b4ec4, %l2 = ffffffffeef66bda
	lduba	[%i6+0x03f]%asi,%l2	! %l2 = 00000000000000c4
!	Mem[0000000010101400] = d1813900, %l5 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l4 = ffffffffe8920000
	lduba	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 0000008300000000, Mem[000000001018143c] = a62b4ec4
	stw	%l0,[%i6+0x03c]		! Mem[000000001018143c] = 00000000

p0_label_178:
!	%l1 = 0000000000000000, Mem[0000000030001410] = 1bff0000
	stwa	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	Mem[0000000010101408] = 00000000, %l0 = 0000008300000000
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%f10 = 19b35966 003981d1, Mem[0000000010181408] = ffffffff 00000000
	stda	%f10,[%i6+%o4]0x80	! Mem[0000000010181408] = 19b35966 003981d1
!	Mem[00000000300c1408] = 00000000, %l6 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000, %l7 = 00000035, Mem[0000000030101408] = 0039ffd0 4200c51c
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 00000035
!	Mem[0000000010141410] = 91800000, %l1 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101410] = eeffffff, %l0 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l0	! %l0 = 00000000eeffffff
!	%l0 = 00000000eeffffff, Mem[0000000030041408] = 000000e6
	stba	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = ff0000e6
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_179:
!	Mem[00000000300c1400] = ff9ec51c, %l4 = 00000000000000ff
	ldsha	[%i3+%g0]0x81,%l4	! %l4 = ffffffffffffff9e
!	Mem[0000000021800080] = 00ff64ec, %l4 = ffffffffffffff9e
	lduba	[%o3+0x080]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %f0  = 00000000
	lda	[%i5+%g0]0x88,%f0 	! %f0 = 00000000
!	Mem[00000000100c140c] = 05aaffff, %l1 = 0000000000000000
	lduba	[%i3+0x00c]%asi,%l1	! %l1 = 0000000000000005
!	Mem[0000000010101408] = ff000000, %l4 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030181408] = ffffffff, %l1 = 0000000000000005
	ldsba	[%i6+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001410] = ff920000, %l7 = 0000000000000035
	lduba	[%i0+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041408] = ff0000e6, %l1 = ffffffffffffffff
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001408] = ffffeeff, %f20 = 00000000
	lda	[%i0+%o4]0x80,%f20	! %f20 = ffffeeff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010101400] = 003981d1
	stha	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 000081d1

p0_label_180:
!	%l7 = 00000000000000ff, Mem[0000000010041428] = baecbc6eff9ec51c
	stx	%l7,[%i1+0x028]		! Mem[0000000010041428] = 00000000000000ff
!	%l0 = 00000000eeffffff, Mem[0000000030141408] = 00000000
	stwa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = eeffffff
!	%l0 = 00000000eeffffff, Mem[0000000010081410] = 766065e2
	stba	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = ff6065e2
!	Mem[0000000010141408] = ff000000, %l2 = 00000000000000c4
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1418] = 003981d1721c8243, %l0 = 00000000eeffffff, %l5 = 0000000000000000
	add	%i3,0x18,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = 003981d1721c8243
!	Mem[0000000030001408] = ffffffff, %l6 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffffffff
!	%l3 = eeffffff000000ff, Mem[0000000020800040] = ff00e22a
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 00ffe22a
!	%l1 = ffffffffffffffff, Mem[0000000010081400] = ffffffee, %asi = 80
	stwa	%l1,[%i2+0x000]%asi	! Mem[0000000010081400] = ffffffff
!	Mem[0000000030081400] = 00395b1c, %l5 = 003981d1721c8243
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 0000001c000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141428] = bc3a6512, %l4 = ffffffffffffff00
	ldsw	[%i5+0x028],%l4		! %l4 = ffffffffbc3a6512

p0_label_181:
!	Mem[0000000030181410] = 000092e8, %l3 = eeffffff000000ff
	lduwa	[%i6+%o5]0x81,%l3	! %l3 = 00000000000092e8
!	Mem[0000000010081408] = 43821c72, %l4 = ffffffffbc3a6512
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = 0000000043821c72
!	Mem[0000000010141400] = 000000008bde857b, %l2 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = 000000008bde857b
!	Mem[00000000100c1410] = ff000000, %l3 = 00000000000092e8
	ldswa	[%i3+%o5]0x80,%l3	! %l3 = ffffffffff000000
!	Mem[00000000300c1400] = ff9ec51c 00395b1c, %l0 = eeffffff, %l1 = ffffffff
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff9ec51c 0000000000395b1c
!	Mem[0000000021800100] = ffbd02e9, %l0 = 00000000ff9ec51c
	ldsh	[%o3+0x100],%l0		! %l0 = ffffffffffffffbd
!	Mem[0000000030081400] = 00395bff, %l1 = 0000000000395b1c
	ldsba	[%i2+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141400] = 00000000, %l5 = 000000000000001c
	lduwa	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = ff003900, %l7 = 00000000000000ff
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[0000000010081408] = 721c8243
	stha	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 721cffff

p0_label_182:
!	%l4 = 0000000043821c72, Mem[0000000010001418] = ffffffff000000ff, %asi = 80
	stxa	%l4,[%i0+0x018]%asi	! Mem[0000000010001418] = 0000000043821c72
!	%f19 = 000000ff, Mem[0000000010001408] = ffffeeff
	sta	%f19,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff
!	%l5 = 0000000000000000, Mem[0000000010041410] = 000000e600000083
	stxa	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000
!	%f16 = ffffaa05, Mem[0000000010101400] = 000081d1
	sta	%f16,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffaa05
!	%l6 = 00000000ffffffff, Mem[0000000010181418] = da00b270, %asi = 80
	stwa	%l6,[%i6+0x018]%asi	! Mem[0000000010181418] = ffffffff
!	%l1 = ffffffffffffffff, Mem[0000000030001400] = 00000083
	stwa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffff
!	%f17 = eef66bda, Mem[00000000100c1410] = 000000ff
	sta	%f17,[%i3+%o5]0x88	! Mem[00000000100c1410] = eef66bda
!	%l5 = 0000000000000000, Mem[0000000010181408] = 19b35966
	stha	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 00005966
!	%l4 = 0000000043821c72, Mem[0000000030001400] = ffffffff
	stwa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 43821c72
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = ff00000000000000, %l0 = ffffffffffffffbd
	ldx	[%i1+0x030],%l0		! %l0 = ff00000000000000

p0_label_183:
!	Mem[0000000010181410] = ff00000000000000, %f24 = 00ffd2ff 000092e8
	ldda	[%i6+%o5]0x88,%f24	! %f24 = ff000000 00000000
!	Mem[0000000030041400] = 003900ff, %l0 = ff00000000000000
	lduha	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181410] = e8920000, %l5 = 0000000000000000
	lduwa	[%i6+%o5]0x89,%l5	! %l5 = 00000000e8920000
!	Mem[0000000010181400] = ff000000, %l1 = ffffffffffffffff
	ldsha	[%i6+%g0]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[00000000201c0000] = 9c004c16, %l0 = 00000000000000ff
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffff9c
!	Mem[0000000030141400] = ffffaa05eef66bda, %l3 = ffffffffff000000
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = ffffaa05eef66bda
!	Mem[0000000030001408] = 000000000000009c, %l0 = ffffffffffffff9c
	ldxa	[%i0+%o4]0x81,%l0	! %l0 = 000000000000009c
!	Mem[0000000030041400] = 8d8f53b0003900ff, %l3 = ffffaa05eef66bda
	ldxa	[%i1+%g0]0x89,%l3	! %l3 = 8d8f53b0003900ff
!	Mem[0000000010081408] = ffff1c72ff9ec51c, %f30 = 00000000 ffffffee
	ldda	[%i2+%o4]0x80,%f30	! %f30 = ffff1c72 ff9ec51c
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000030181400] = d1813900
	stha	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = d18100ff

p0_label_184:
!	Mem[0000000030081400] = 00395bff, %l7 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 0000000000395bff
!	Mem[0000000030001408] = 00000000, %l6 = 00000000ffffffff
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l4 = 43821c72, %l5 = e8920000, Mem[0000000010001410] = ff920000 ffd2ff00
	stda	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 43821c72 e8920000
!	%l6 = 00000000, %l7 = 00395bff, Mem[0000000030081410] = ff9ec51c baecbc6e
	stda	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 00395bff
!	%l0 = 0000009c, %l1 = ffffff00, Mem[0000000030101408] = ff000000 35000000
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000009c ffffff00
!	%f18 = 00000000 000000ff, Mem[0000000030041410] = 000092e8 ffffffff
	stda	%f18,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 000000ff
!	%f26 = 19b35966, Mem[0000000030181408] = ffffffff
	sta	%f26,[%i6+%o4]0x89	! Mem[0000000030181408] = 19b35966
!	Mem[00000000100c141c] = 721c8243, %l4 = 0000000043821c72, %asi = 80
	swapa	[%i3+0x01c]%asi,%l4	! %l4 = 00000000721c8243
!	%f10 = 19b35966 003981d1, Mem[0000000010041410] = 00000000 00000000
	stda	%f10,[%i1+%o5]0x80	! Mem[0000000010041410] = 19b35966 003981d1
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 721c8243, %f21 = e6000000
	lda	[%i0+%o5]0x88,%f21	! %f21 = 721c8243

p0_label_185:
!	Mem[0000000030101410] = 00000000 00000000, %l2 = 8bde857b, %l3 = 003900ff
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[00000000211c0000] = 00ff6986, %l0 = 000000000000009c
	lduh	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030001408] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = e26560ff, %l0 = 00000000000000ff
	lduha	[%i2+%o5]0x88,%l0	! %l0 = 00000000000060ff
!	Mem[00000000100c1410] = ffffffffeef66bda, %l7 = 0000000000395bff
	ldxa	[%i3+%o5]0x88,%l7	! %l7 = ffffffffeef66bda
!	Mem[0000000010141400] = 00000000, %l1 = ffffffffffffff00
	lduha	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 00000000 000000ff, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[00000000211c0000] = 00ff6986, %l7 = ffffffffeef66bda
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 05aaffff, %l5 = 00000000e8920000
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 000000ff000000ff

p0_label_186:
!	%f10 = 19b35966 003981d1, Mem[0000000030101400] = 00008091 ff000000
	stda	%f10,[%i4+%g0]0x81	! Mem[0000000030101400] = 19b35966 003981d1
!	%f5  = 91800000, Mem[0000000010081410] = e26560ff
	sta	%f5 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 91800000
!	Mem[0000000010141410] = ff008091, %l4 = 00000000721c8243
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010041410] = 6659b319
	stba	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 6659b3ff
!	%l1 = 0000000000000000, Mem[0000000030101408] = 9c000000
	stba	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 9c000000
!	%l7 = 00000000000000ff, Mem[0000000030181408] = 19b35966
	stha	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 19b300ff
!	%l0 = 00000000000060ff, Mem[00000000201c0000] = 9c004c16
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = ff004c16
!	Mem[0000000010101400] = 05aaffff, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000211c0001] = 00ff6986, %l0 = 00000000000060ff
	ldstub	[%o2+0x001],%l0		! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 721c8243, %l5 = 00000000000000ff
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000043

p0_label_187:
!	Mem[0000000010081410] = 91800000, %l1 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = ff000000, %l2 = 00000000000000ff
	ldsha	[%i2+%g0]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[000000001004142c] = 000000ff, %l7 = 00000000000000ff
	lduha	[%i1+0x02e]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = 05aaffff, %l7 = 00000000000000ff
	ldswa	[%i4+%g0]0x88,%l7	! %l7 = 0000000005aaffff
!	Mem[0000000010181404] = 00000000, %l1 = 0000000000000000
	lduba	[%i6+0x004]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 43821c72 e8920000, %l6 = 000000ff, %l7 = 05aaffff
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 0000000043821c72 00000000e8920000
!	Mem[0000000010081400] = ffffffff, %l6 = 0000000043821c72
	lduha	[%i2+%g0]0x88,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010101400] = ffffaa05ff03ff57, %l1 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l1	! %l1 = ffffaa05ff03ff57
!	Mem[0000000010101418] = 00000000, %l3 = 0000000000000000
	ldswa	[%i4+0x018]%asi,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 1cc59eff, %l0 = 00000000000000ff
	ldstuba	[%i3+%g0]0x89,%l0	! %l0 = 000000ff000000ff

p0_label_188:
!	%l4 = 000000ff, %l5 = 00000043, Mem[0000000030081408] = 00000083 00000000
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff 00000043
!	%f20 = ffffeeff, Mem[00000000300c1410] = e6000000
	sta	%f20,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffeeff
!	Mem[0000000010001400] = ffffeeff, %l2 = ffffffffffffff00
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 00000000ffffeeff
!	%l4 = 00000000000000ff, Mem[0000000010101410] = 00000000, %asi = 80
	stha	%l4,[%i4+0x010]%asi	! Mem[0000000010101410] = 00ff0000
!	Mem[0000000010001410] = 721c8243, %l3 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 00000000721c8243
!	Mem[0000000030001408] = 000000ff, %l6 = 000000000000ffff
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l3 = 00000000721c8243, Mem[00000000211c0000] = 00ff6986, %asi = 80
	stba	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 43ff6986
!	%f10 = 19b35966 003981d1, Mem[0000000030101408] = 0000009c ffffff00
	stda	%f10,[%i4+%o4]0x81	! Mem[0000000030101408] = 19b35966 003981d1
!	%l1 = ffffaa05ff03ff57, Mem[00000000201c0000] = ff004c16, %asi = 80
	stba	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 57004c16
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff00b319, %l3 = 00000000721c8243
	ldswa	[%i6+%o4]0x81,%l3	! %l3 = ffffffffff00b319

p0_label_189:
!	Mem[0000000010081400] = ffffffff, %f16 = ffffaa05
	lda	[%i2+%g0]0x88,%f16	! %f16 = ffffffff
!	Mem[00000000201c0000] = 57004c16, %l4 = 00000000000000ff
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 003900ff, %l5 = 0000000000000043
	lduba	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = 6659b319, %l3 = ffffffffff00b319
	lduha	[%i4+%g0]0x89,%l3	! %l3 = 000000000000b319
!	Mem[0000000010081400] = ffffffff0000009c, %l0 = 00000000000000ff
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = ffffffff0000009c
!	Mem[0000000010181420] = 00000000, %l4 = 0000000000000000
	ldswa	[%i6+0x020]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l2 = 00000000ffffeeff
	ldsha	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 000000ff, %l6 = 00000000000000ff
	ldsha	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001400] = 00ffffff, %l6 = 00000000000000ff
	lduwa	[%i0+%g0]0x80,%l6	! %l6 = 0000000000ffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 6659b319, %l3 = 000000000000b319
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 000000006659b319

p0_label_190:
!	Mem[0000000030041408] = ff0000e6, %l1 = ffffaa05ff03ff57
	ldstuba	[%i1+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	%l4 = 0000000000000000, %l7 = 00000000e8920000, %l4 = 0000000000000000
	or	%l4,%l7,%l4		! %l4 = 00000000e8920000
!	%l3 = 000000006659b319, Mem[0000000030141400] = ffffaa05
	stwa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 6659b319
!	%f20 = ffffeeff 721c8243, %l2 = 0000000000000000
!	Mem[0000000030141410] = 00000000e6000000
	add	%i5,0x010,%g1
	stda	%f20,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030141410] = 00000000e6000000
!	Mem[0000000010101408] = 000000ff, %l7 = 00000000e8920000
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010041410] = 6659b3ff, %l7 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010081400] = ffffffff, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l2	! %l2 = 00000000ffffffff
!	%l4 = 00000000e8920000, Mem[0000000010081400] = 00000000
	stba	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%f10 = 19b35966 003981d1, Mem[0000000030041408] = ff0000e6 dadb7aee
	stda	%f10,[%i1+%o4]0x81	! Mem[0000000030041408] = 19b35966 003981d1
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = d18100ff, %l1 = 00000000000000ff
	ldswa	[%i6+%g0]0x89,%l1	! %l1 = ffffffffd18100ff

p0_label_191:
!	Mem[00000000201c0000] = 57004c16, %l6 = 0000000000ffffff
	ldsba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000057
!	%l2 = 00000000ffffffff, %l3 = 000000006659b319, %y  = 00000000
	sdiv	%l2,%l3,%l4		! %l4 = 0000000000000002
	mov	%l0,%y			! %y = 0000009c
!	Mem[00000000300c1410] = ffeeffff 00000000, %l2 = ffffffff, %l3 = 6659b319
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000ffeeffff 0000000000000000
!	Mem[00000000300c1400] = ff9ec51c, %l1 = ffffffffd18100ff
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffff9e
!	Mem[0000000030041408] = 19b35966, %f21 = 721c8243
	lda	[%i1+%o4]0x81,%f21	! %f21 = 19b35966
!	Mem[0000000030041410] = ff00000000000000, %f4  = d0ff3900 91800000
	ldda	[%i1+%o5]0x81,%f4 	! %f4  = ff000000 00000000
!	Mem[0000000010141418] = ff26f386bc71357b, %f10 = 19b35966 003981d1
	ldda	[%i5+0x018]%asi,%f10	! %f10 = ff26f386 bc71357b
!	Mem[0000000010181408] = 66590000, %l5 = 00000000000000ff
	lduha	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141420] = a625bcc7, %l4 = 0000000000000002
	lduha	[%i5+0x020]%asi,%l4	! %l4 = 000000000000a625
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff9e, Mem[0000000030141408] = ffffffee
	stba	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffff9e

p0_label_192:
!	%l1 = ffffffffffffff9e, Mem[0000000030141400] = 6659b319
	stha	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = ff9eb319
!	%f24 = ff000000 00000000, Mem[0000000030101410] = 00000000 00000000
	stda	%f24,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000 00000000
!	Mem[0000000010081418] = c21fd5ff, %l7 = 00000000000000ff
	swap	[%i2+0x018],%l7		! %l7 = 00000000c21fd5ff
!	%l1 = ffffffffffffff9e, Mem[0000000010141420] = a625bcc7, %asi = 80
	stha	%l1,[%i5+0x020]%asi	! Mem[0000000010141420] = ff9ebcc7
!	%f6  = 003981d1 721c8243, Mem[0000000010181400] = 000000ff 00000000
	stda	%f6 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 003981d1 721c8243
!	Mem[0000000010001420] = 57ffffe6, %l5 = 0000000000000000, %asi = 80
	swapa	[%i0+0x020]%asi,%l5	! %l5 = 0000000057ffffe6
!	%f10 = ff26f386 bc71357b, Mem[0000000010101410] = 0000ff00 7bff71bc
	stda	%f10,[%i4+%o5]0x88	! Mem[0000000010101410] = ff26f386 bc71357b
!	%l4 = 000000000000a625, Mem[0000000010141414] = d2ff0000, %asi = 80
	stwa	%l4,[%i5+0x014]%asi	! Mem[0000000010141414] = 0000a625
!	Mem[0000000010041410] = 6659b3ff, %l0 = ffffffff0000009c
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 000000006659b3ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 000000ff, %l5 = 0000000057ffffe6
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = ffffffffffffffff

p0_label_193:
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000057
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = da6bf6ee 19b39eff, %l4 = 0000a625, %l5 = ffffffff
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 0000000019b39eff 00000000da6bf6ee
!	Mem[0000000010101408] = 000000ff, %l4 = 0000000019b39eff
	lduha	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %f26 = 19b35966
	lda	[%i6+%o5]0x88,%f26	! %f26 = 00000000
!	Mem[0000000010081408] = ffff1c72, %l3 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l3	! %l3 = 00000000ffff1c72
!	Mem[0000000030101410] = 00000000, %l7 = 00000000c21fd5ff
	ldsha	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = 19b30000, %l3 = 00000000ffff1c72
	lduha	[%i4+%o4]0x81,%l3	! %l3 = 00000000000019b3
!	Mem[0000000010041410] = 9c000000, %l1 = ffffffffffffff9e
	ldsh	[%i1+0x012],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001000140c] = 6ebcecba, %l1 = 00000000, %l2 = ffeeffff
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 000000006ebcecba

p0_label_194:
!	Mem[0000000010001410] = 00000000, %l0 = 000000006659b3ff
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[00000000100c1420] = 00009aff c9bbd17f
	std	%l6,[%i3+0x020]		! Mem[00000000100c1420] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000030141408] = 9effffff
	stwa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[0000000010001410] = 6659b3ff, %l5 = 00000000da6bf6ee
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 00000066000000ff
!	Mem[00000000100c1431] = 26bfa66f, %l3 = 00000000000019b3
	ldstuba	[%i3+0x031]%asi,%l3	! %l3 = 000000bf000000ff
!	Mem[0000000030181400] = d18100ff, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000020800001] = ff855a05, %l7 = 00000000000000ff
	ldstuba	[%o1+0x001]%asi,%l7	! %l7 = 00000085000000ff
!	%l7 = 0000000000000085, Mem[0000000010181400] = 43821c72, %asi = 80
	stwa	%l7,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000085
!	%l1 = 0000000000000000, Mem[0000000010041400] = 00395b1c
	stba	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 00395b00
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 43ff6986, %l3 = 00000000000000bf
	ldsb	[%o2+%g0],%l3		! %l3 = 0000000000000043

p0_label_195:
!	Mem[0000000030101408] = 19b30000, %l2 = 000000006ebcecba
	lduha	[%i4+%o4]0x81,%l2	! %l2 = 00000000000019b3
!	Mem[0000000030001400] = 000000c4 43821c72, %l6 = 00000000, %l7 = 00000085
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 0000000043821c72 00000000000000c4
!	Mem[0000000030041408] = 19b35966, %l0 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000019
!	Mem[0000000030041400] = 003900ff, %l5 = 0000000000000066
	lduwa	[%i1+%g0]0x89,%l5	! %l5 = 00000000003900ff
!	Mem[0000000030181400] = d18100ff, %l7 = 00000000000000c4
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081410] = ec6f95ea91800000, %l1 = 0000000000000000
	ldxa	[%i2+%o5]0x88,%l1	! %l1 = ec6f95ea91800000
!	Mem[0000000010141408] = 000000ff, %l6 = 0000000043821c72
	lduha	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1408] = ff000000 83000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 00000000ff000000 0000000083000000
!	Mem[0000000030101400] = 6659b319, %f18 = 00000000
	lda	[%i4+%g0]0x89,%f18	! %f18 = 6659b319
!	Starting 10 instruction Store Burst
!	%f24 = ff000000 00000000, Mem[0000000010081400] = 00000000 0000009c
	stda	%f24,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000 00000000

p0_label_196:
!	Mem[0000000010041410] = 0000009c, %l2 = 00000000000019b3
	ldstuba	[%i1+%o5]0x88,%l2	! %l2 = 0000009c000000ff
!	%f30 = ffff1c72, %f12 = 26bfa66f, %f7  = 721c8243
	fdivs	%f30,%f12,%f7 		! %f7  = ffff1c72
!	%l3 = 0000000000000043, Mem[0000000030081408] = ff00000043000000
	stxa	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000043
!	Mem[0000000030081408] = 00000000, %l1 = ec6f95ea91800000
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%f4  = ff000000 00000000, Mem[0000000010081400] = 000000ff 00000000
	stda	%f4 ,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000 00000000
!	Mem[0000000030101400] = 19b35966, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 00000019000000ff
!	%l6 = 00000000ff000000, Mem[0000000030141410] = 000000e600000000
	stxa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000ff000000
!	Mem[0000000010101408] = 000000ff, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l0 = 0000000000000019, Mem[0000000030101408] = d18139000000b319
	stxa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000019
!	Starting 10 instruction Load Burst
!	Mem[000000001010140c] = 91800000, %l0 = 0000000000000019
	ldsb	[%i4+0x00f],%l0		! %l0 = 0000000000000000

p0_label_197:
!	Mem[0000000010181400] = 00000085, %l4 = 0000000000000019
	lduh	[%i6+0x002],%l4		! %l4 = 0000000000000085
!	Mem[0000000030041408] = d18139006659b319, %f10 = ff26f386 bc71357b
	ldda	[%i1+%o4]0x89,%f10	! %f10 = d1813900 6659b319
!	Mem[0000000010101410] = ff26f386 bc71357b, %l4 = 00000085, %l5 = 003900ff
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 00000000bc71357b 00000000ff26f386
!	Mem[0000000010181400] = 00000085, %f25 = 00000000
	ld	[%i6+%g0],%f25	! %f25 = 00000085
!	Mem[0000000030041410] = ff000000, %f2  = 000092e8
	lda	[%i1+%o5]0x81,%f2 	! %f2 = ff000000
!	Mem[0000000010141428] = bc3a6512, %l5 = 00000000ff26f386
	lduba	[%i5+0x029]%asi,%l5	! %l5 = 000000000000003a
!	Mem[0000000010141400] = 00000000, %l1 = 00000000000000ff
	lduba	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 7b3571bc, %l1 = 0000000000000000
	lduha	[%i4+0x010]%asi,%l1	! %l1 = 0000000000007b35
!	Mem[00000000100c1438] = 9f000000, %l2 = 000000000000009c
	ldsha	[%i3+0x038]%asi,%l2	! %l2 = ffffffffffff9f00
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[000000001014143c] = 00000000, %asi = 80
	stwa	%l0,[%i5+0x03c]%asi	! Mem[000000001014143c] = 00000000

p0_label_198:
!	%l3 = 0000000000000043, Mem[0000000010101400] = ffffaa05
	stha	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 0043aa05
!	Mem[00000000100c1400] = 00000000, %l4 = 00000000bc71357b
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l4 = 00000000, %l5 = 0000003a, Mem[0000000030081408] = ff000000 00000043
	stda	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 0000003a
!	Mem[0000000010041418] = 0000d2e9, %l1 = 00007b35, %l7 = 83000000
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l1,%l7	! %l7 = 000000000000d2e9
!	Mem[000000001014143e] = 00000000, %l3 = 0000000000000043
	ldstub	[%i5+0x03e],%l3		! %l3 = 00000000000000ff
!	%f26 = 00000000 ff9ec5ff, %l5 = 000000000000003a
!	Mem[0000000010181408] = 00005966003981d1
	add	%i6,0x008,%g1
	stda	%f26,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010181408] = 00c559ff000081d1
!	%l1 = 0000000000007b35, Mem[00000000100c140c] = 05aaffff
	stw	%l1,[%i3+0x00c]		! Mem[00000000100c140c] = 00007b35
!	%l6 = ff000000, %l7 = 0000d2e9, Mem[0000000010181400] = 85000000 003981d1
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000000 0000d2e9
!	%f4  = ff000000 00000000, Mem[0000000010101408] = 00000000 91800000
	stda	%f4 ,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 357b0000eef66bda, %l4 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l4	! %l4 = 357b0000eef66bda

p0_label_199:
!	Mem[00000000100c1410] = eef66bda, %l4 = 357b0000eef66bda
	ldsba	[%i3+%o5]0x88,%l4	! %l4 = ffffffffffffffda
!	Mem[0000000030081410] = 00395bff00000000, %l6 = 00000000ff000000
	ldxa	[%i2+%o5]0x89,%l6	! %l6 = 00395bff00000000
!	Mem[00000000100c1424] = 00000000, %l2 = ffffffffffff9f00
	lduw	[%i3+0x024],%l2		! %l2 = 0000000000000000
!	Mem[0000000030081408] = 3a00000000000000, %l3 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l3	! %l3 = 3a00000000000000
!	Mem[000000001000142c] = 00000042, %l6 = 00395bff00000000
	ldsh	[%i0+0x02e],%l6		! %l6 = 0000000000000042
!	Mem[0000000010001410] = ff59b3ff, %l3 = 3a00000000000000
	lduwa	[%i0+%o5]0x80,%l3	! %l3 = 00000000ff59b3ff
!	Mem[0000000030041408] = 19b35966003981d1, %l4 = ffffffffffffffda
	ldxa	[%i1+%o4]0x81,%l4	! %l4 = 19b35966003981d1
!	Mem[0000000020800000] = ffff5a05, %l4 = 19b35966003981d1
	lduh	[%o1+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030041400] = ff003900, %l3 = 00000000ff59b3ff
	lduba	[%i1+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001420] = 0000000000ff00ff, %l6 = 0000000000000042, %l0 = 0000000000000000
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = 0000000000ff00ff

p0_label_200:
!	%l4 = 000000000000ffff, Mem[0000000030141410] = 000000ff00000000
	stxa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000000000ffff
!	Mem[00000000300c1400] = ff9ec51c, %l3 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 00000000ff9ec51c
!	%l5 = 000000000000003a, Mem[0000000010001419] = 00000000
	stb	%l5,[%i0+0x019]		! Mem[0000000010001418] = 003a0000
!	Mem[00000000100c1400] = bc71357b, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 000000bc000000ff
!	%l4 = 0000ffff, %l5 = 0000003a, Mem[0000000010001408] = ff000000 baecbc6e
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000ffff 0000003a
!	%f17 = eef66bda, Mem[0000000030041400] = 003900ff
	sta	%f17,[%i1+%g0]0x89	! Mem[0000000030041400] = eef66bda
!	%f0  = 00000000 9a000000 ff000000 399c4442
!	%f4  = ff000000 00000000 003981d1 ffff1c72
!	%f8  = 00009aff 00000000 d1813900 6659b319
!	%f12 = 26bfa66f 61602d68 86f3c5ff a625bcc7
	stda	%f0,[%i5]ASI_BLK_AIUS	! Block Store to 0000000030141400
!	%f18 = 6659b319 000000ff, Mem[0000000010081410] = 91800000 ec6f95ea
	stda	%f18,[%i2+%o5]0x88	! Mem[0000000010081410] = 6659b319 000000ff
!	Mem[00000000300c1408] = ff000000, %l2 = 00000000000000bc
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 19000000, %l3 = 00000000ff9ec51c
	ldswa	[%i4+%o4]0x81,%l3	! %l3 = 0000000019000000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	stwa	%l2,[%i2+0x034]%asi
	ldsba	[%i6+0x018]%asi,%l0
	stha	%l0,[%i2+0x016]%asi
	nop
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0

1:	membar	#Sync			! Force all stores to complete


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000ff00ff
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000007b35
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000019000000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 000000000000ffff
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000000000003a
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000042
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 000000000000d2e9
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x0000009c,%g2
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
	cmp	%l0,%l1			! %f0  should be 00000000 9a000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ff000000 399c4442
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ff000000 00000000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 003981d1 ffff1c72
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00009aff 00000000
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be d1813900 6659b319
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 26bfa66f 61602d68
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 86f3c5ff a625bcc7
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ffffffff eef66bda
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 6659b319 000000ff
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ffffeeff 19b35966
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 0000d2e9 00395bbd
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ff000000 00000085
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 ff9ec5ff
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ff000000 00000000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be ffff1c72 ff9ec51c
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
	nop
	ldxa	[%i0+%g0]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010001400]
	lduha	[%i6+%o5]ASI_AS_IF_USER_PRIMARY,%l3	! Mem[0000000010181410]
	fdtoi	%f12,%f4 
	xnor	%l7,0x12b,%l5
	fdtos	%f14,%f8 
	done

p0_trap1o:
	nop
	ldxa	[%o0+%g0]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010001400]
	lduha	[%o6+%i5]ASI_AS_IF_USER_PRIMARY,%l3	! Mem[0000000010181410]
	fdtoi	%f12,%f4 
	xnor	%l7,0x12b,%l5
	fdtos	%f14,%f8 
	done


p0_trap2e:
	lduha	[%i6+%g0]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010181400]
	nop
	lduwa	[%i4+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010101400]
	xnor	%l0,-0x82f,%l0
	done

p0_trap2o:
	lduha	[%o6+%g0]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010181400]
	nop
	lduwa	[%o4+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010101400]
	xnor	%l0,-0x82f,%l0
	done


p0_trap3e:
	or	%l3,%l0,%l7
	add	%l5,%l2,%l5
	done

p0_trap3o:
	or	%l3,%l0,%l7
	add	%l5,%l2,%l5
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
	ldx	[%g1+0x000],%l0		! %l0 = 1564bc1818654768
	ldx	[%g1+0x008],%l1		! %l1 = 9bf2cfe03309c53e
	ldx	[%g1+0x010],%l2		! %l2 = c4ad5a68cd57317c
	ldx	[%g1+0x018],%l3		! %l3 = 87cb47ce0aa690c2
	ldx	[%g1+0x020],%l4		! %l4 = 7159770c51639208
	ldx	[%g1+0x028],%l5		! %l5 = 78a90911a3ce1d4d
	ldx	[%g1+0x030],%l6		! %l6 = 755384c274f2db83
	ldx	[%g1+0x038],%l7		! %l7 = c66f10b2bf83e6b4

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
	subc	%l3,-0x032,%l1
	ldub	[%i0+0x006],%l7		! Mem[0000000010001406]
	st	%f4 ,[%i0+0x02c]	! Mem[000000001000142c]
	ldd	[%i4+0x000],%f4 	! Mem[0000000010101400]
	jmpl	%o7,%g0
	smul	%l3,%l3,%l1
p0_near_0_he:
	stx	%l2,[%i6+0x028]		! Mem[0000000010181428]
	ldub	[%i3+0x029],%l5		! Mem[00000000100c1429]
	std	%f30,[%i2+0x018]	! Mem[0000000010081418]
	jmpl	%o7,%g0
	ldstub	[%i3+0x019],%l0		! Mem[00000000100c1419]
near0_b2b_h:
	fmuls	%f29,%f17,%f29
	fsqrts	%f16,%f16
	jmpl	%o7,%g0
	udivx	%l5,0x631,%l2
near0_b2b_l:
	and	%l5,%l2,%l1
	fitod	%f0 ,%f14
	jmpl	%o7,%g0
	or	%l2,-0xec5,%l3
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	ld	[%i2+0x018],%f0 	! Mem[0000000010081418]
	ldub	[%i0+0x013],%l2		! Mem[0000000010001413]
	fmuls	%f3 ,%f5 ,%f2 
	addc	%l0,%l5,%l3
	stx	%l3,[%i3+0x000]		! Mem[00000000100c1400]
	nop
	fdtoi	%f4 ,%f2 
	jmpl	%o7,%g0
	xor	%l1,-0x7ea,%l3
p0_near_1_he:
	jmpl	%o7,%g0
	orn	%l4,0x412,%l0
	jmpl	%o7,%g0
	nop
near1_b2b_h:
	fadds	%f20,%f26,%f21
	udivx	%l1,0x4e3,%l3
	jmpl	%o7,%g0
	subc	%l0,0x729,%l2
near1_b2b_l:
	xnor	%l2,0xa05,%l6
	fadds	%f10,%f5 ,%f2 
	jmpl	%o7,%g0
	sdivx	%l7,%l1,%l3
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	ld	[%i1+0x030],%f5 	! Mem[0000000010041430]
	fadds	%f15,%f11,%f9 
	add	%l7,%l4,%l7
	sth	%l0,[%i6+0x028]		! Mem[0000000010181428]
	fdtoi	%f14,%f5 
	umul	%l3,%l7,%l5
	jmpl	%o7,%g0
	stb	%l3,[%i3+0x002]		! Mem[00000000100c1402]
p0_near_2_he:
	jmpl	%o7,%g0
	xor	%l3,%l5,%l2
	jmpl	%o7,%g0
	nop
near2_b2b_h:
	sub	%l7,0x99b,%l1
	fadds	%f29,%f31,%f21
	addc	%l5,-0x53a,%l2
	umul	%l2,%l3,%l6
	jmpl	%o7,%g0
	fitod	%f27,%f20
near2_b2b_l:
	subc	%l5,-0x465,%l0
	fdtoi	%f2 ,%f15
	smul	%l1,%l7,%l3
	umul	%l1,-0xe5a,%l4
	jmpl	%o7,%g0
	xor	%l5,0xa65,%l5
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	ldub	[%i4+0x004],%l6		! Mem[0000000010101404]
	sth	%l5,[%i3+0x01a]		! Mem[00000000100c141a]
	nop
	jmpl	%o7,%g0
	sth	%l2,[%i0+0x01c]		! Mem[000000001000141c]
p0_near_3_he:
	ldsw	[%i3+0x010],%l0		! Mem[00000000100c1410]
	fdtoi	%f22,%f18
	jmpl	%o7,%g0
	fdivs	%f28,%f17,%f31
near3_b2b_h:
	sdivx	%l1,%l0,%l4
	xnor	%l7,%l0,%l0
	mulx	%l7,%l6,%l0
	jmpl	%o7,%g0
	smul	%l3,%l0,%l2
near3_b2b_l:
	udivx	%l0,0x9ea,%l4
	fcmps	%fcc1,%f3 ,%f14
	umul	%l4,%l6,%l0
	jmpl	%o7,%g0
	orn	%l7,0x8ff,%l3
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	orn	%l4,0x259,%l5
	umul	%l5,%l2,%l6
	lduw	[%i2+0x038],%l2		! Mem[0000000010081438]
	jmpl	%o7,%g0
	add	%l2,%l6,%l6
p0_far_0_lem:
	orn	%l4,0x259,%l5
	umul	%l5,%l2,%l6
	membar	#Sync
	lduw	[%i2+0x038],%l2		! Mem[0000000010081438]
	jmpl	%o7,%g0
	add	%l2,%l6,%l6
p0_far_0_he:
	udivx	%l4,%l5,%l3
	swap	[%i1+0x018],%l5		! Mem[0000000010041418]
	std	%f18,[%i4+0x018]	! Mem[0000000010101418]
	fdtoi	%f16,%f25
	std	%l6,[%i3+0x008]		! Mem[00000000100c1408]
	jmpl	%o7,%g0
	sdivx	%l2,%l6,%l6
p0_far_0_hem:
	udivx	%l4,%l5,%l3
	membar	#Sync
	swap	[%i1+0x018],%l5		! Mem[0000000010041418]
	std	%f18,[%i4+0x018]	! Mem[0000000010101418]
	fdtoi	%f16,%f25
	std	%l6,[%i3+0x008]		! Mem[00000000100c1408]
	jmpl	%o7,%g0
	sdivx	%l2,%l6,%l6
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	jmpl	%o7,%g0
	udivx	%l4,-0xee0,%l4
	jmpl	%o7,%g0
	nop
far0_b2b_l:
	jmpl	%o7,%g0
	fmuls	%f8 ,%f14,%f8 
	jmpl	%o7,%g0
	nop
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	jmpl	%o7,%g0
	fcmps	%fcc2,%f9 ,%f15
	jmpl	%o7,%g0
	nop
p0_far_1_lem:
	jmpl	%o7,%g0
	fcmps	%fcc2,%f9 ,%f15
	jmpl	%o7,%g0
	nop
p0_far_1_he:
	st	%f30,[%i6+0x014]	! Mem[0000000010181414]
	ldub	[%i2+0x038],%l1		! Mem[0000000010081438]
	fmuls	%f28,%f31,%f22
	fitos	%f24,%f22
	jmpl	%o7,%g0
	fdtos	%f30,%f22
p0_far_1_hem:
	membar	#Sync
	st	%f30,[%i6+0x014]	! Mem[0000000010181414]
	ldub	[%i2+0x038],%l1		! Mem[0000000010081438]
	fmuls	%f28,%f31,%f22
	fitos	%f24,%f22
	jmpl	%o7,%g0
	fdtos	%f30,%f22
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	fcmps	%fcc3,%f21,%f23
	fsqrts	%f28,%f29
	nop
	xor	%l4,0xec6,%l6
	umul	%l7,0x52e,%l0
	subc	%l7,0x13f,%l6
	jmpl	%o7,%g0
	udivx	%l7,%l3,%l5
far1_b2b_l:
	fsqrts	%f14,%f0 
	fadds	%f7 ,%f0 ,%f8 
	sdivx	%l4,%l2,%l5
	smul	%l3,-0xb92,%l6
	fdivs	%f3 ,%f5 ,%f15
	fdtos	%f10,%f14
	jmpl	%o7,%g0
	sdivx	%l7,-0x8b5,%l6
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	jmpl	%o7,%g0
	xnor	%l1,0xd5f,%l5
	jmpl	%o7,%g0
	nop
p0_far_2_lem:
	jmpl	%o7,%g0
	xnor	%l1,0xd5f,%l5
	jmpl	%o7,%g0
	nop
p0_far_2_he:
	ldsb	[%i4+0x02f],%l1		! Mem[000000001010142f]
	lduw	[%i1+0x000],%l4		! Mem[0000000010041400]
	fsubs	%f21,%f21,%f16
	swap	[%i2+0x038],%l2		! Mem[0000000010081438]
	or	%l1,-0xd88,%l2
	ldd	[%i6+0x038],%f28	! Mem[0000000010181438]
	fcmps	%fcc3,%f17,%f27
	jmpl	%o7,%g0
	nop
p0_far_2_hem:
	membar	#Sync
	ldsb	[%i4+0x02f],%l1		! Mem[000000001010142f]
	lduw	[%i1+0x000],%l4		! Mem[0000000010041400]
	fsubs	%f21,%f21,%f16
	swap	[%i2+0x038],%l2		! Mem[0000000010081438]
	or	%l1,-0xd88,%l2
	ldd	[%i6+0x038],%f28	! Mem[0000000010181438]
	fcmps	%fcc3,%f17,%f27
	jmpl	%o7,%g0
	nop
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fsubs	%f16,%f20,%f30
	fdtoi	%f22,%f25
	jmpl	%o7,%g0
	andn	%l7,%l0,%l5
far2_b2b_l:
	fsqrts	%f7 ,%f0 
	addc	%l4,0x87c,%l6
	jmpl	%o7,%g0
	fdivs	%f11,%f13,%f10
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	jmpl	%o7,%g0
	add	%l3,%l6,%l4
	jmpl	%o7,%g0
	nop
p0_far_3_lem:
	jmpl	%o7,%g0
	add	%l3,%l6,%l4
	jmpl	%o7,%g0
	nop
p0_far_3_he:
	ldstub	[%o2+0x000],%l5		! Mem[00000000211c0000]
	add	%l0,-0xe39,%l5
	lduh	[%i2+0x01a],%l5		! Mem[000000001008141a]
	jmpl	%o7,%g0
	sub	%l4,0xf77,%l1
p0_far_3_hem:
	ldstub	[%o2+0x000],%l5		! Mem[00000000211c0000]
	add	%l0,-0xe39,%l5
	membar	#Sync
	lduh	[%i2+0x01a],%l5		! Mem[000000001008141a]
	jmpl	%o7,%g0
	sub	%l4,0xf77,%l1
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	jmpl	%o7,%g0
	add	%l4,0x291,%l0
	jmpl	%o7,%g0
	nop
far3_b2b_l:
	jmpl	%o7,%g0
	fdivs	%f1 ,%f1 ,%f1 
	jmpl	%o7,%g0
	nop
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	swap	[%i2+0x018],%l3		! Mem[0000000010081418]
	ldd	[%i4+0x020],%f4 	! Mem[0000000010101420]
	and	%l6,%l3,%l7
	fdtos	%f10,%f2 
	jmpl	%g6+8,%g0
	ldd	[%i3+0x008],%l2		! Mem[00000000100c1408]
p0_call_0_le:
	retl
	fsqrts	%f13,%f11
p0_jmpl_0_lo:
	swap	[%o2+0x018],%l3		! Mem[0000000010081418]
	ldd	[%o4+0x020],%f4 	! Mem[0000000010101420]
	and	%l6,%l3,%l7
	fdtos	%f10,%f2 
	jmpl	%g6+8,%g0
	ldd	[%o3+0x008],%l2		! Mem[00000000100c1408]
p0_call_0_lo:
	retl
	fsqrts	%f13,%f11
p0_jmpl_0_he:
	st	%f17,[%i3+0x028]	! Mem[00000000100c1428]
	add	%l2,%l0,%l0
	fcmps	%fcc1,%f24,%f20
	ldsb	[%i4+0x005],%l3		! Mem[0000000010101405]
	ldsw	[%i3+0x010],%l5		! Mem[00000000100c1410]
	or	%l7,0x122,%l6
	fcmps	%fcc0,%f16,%f17
	jmpl	%g6+8,%g0
	sth	%l3,[%i6+0x032]		! Mem[0000000010181432]
p0_call_0_he:
	udivx	%l0,0x70e,%l4
	xor	%l1,%l6,%l6
	addc	%l0,%l0,%l1
	ldub	[%i1+0x008],%l6		! Mem[0000000010041408]
	ld	[%i4+0x024],%f25	! Mem[0000000010101424]
	fitod	%f19,%f28
	fadds	%f20,%f23,%f17
	retl
	ldub	[%i0+0x03a],%l4		! Mem[000000001000143a]
p0_jmpl_0_ho:
	st	%f17,[%o3+0x028]	! Mem[00000000100c1428]
	add	%l2,%l0,%l0
	fcmps	%fcc1,%f24,%f20
	ldsb	[%o4+0x005],%l3		! Mem[0000000010101405]
	ldsw	[%o3+0x010],%l5		! Mem[00000000100c1410]
	or	%l7,0x122,%l6
	fcmps	%fcc0,%f16,%f17
	jmpl	%g6+8,%g0
	sth	%l3,[%o6+0x032]		! Mem[0000000010181432]
p0_call_0_ho:
	udivx	%l0,0x70e,%l4
	xor	%l1,%l6,%l6
	addc	%l0,%l0,%l1
	ldub	[%o1+0x008],%l6		! Mem[0000000010041408]
	ld	[%o4+0x024],%f25	! Mem[0000000010101424]
	fitod	%f19,%f28
	fadds	%f20,%f23,%f17
	retl
	ldub	[%o0+0x03a],%l4		! Mem[000000001000143a]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	fdtoi	%f8 ,%f9 
	smul	%l5,-0x956,%l1
	ldd	[%i5+0x020],%l6		! Mem[0000000010141420]
	ldstub	[%i2+0x007],%l5		! Mem[0000000010081407]
	jmpl	%g6+8,%g0
	fstoi	%f8 ,%f9 
p0_call_1_le:
	retl
	fstod	%f9 ,%f8 
p0_jmpl_1_lo:
	fdtoi	%f8 ,%f9 
	smul	%l5,-0x956,%l1
	ldd	[%o5+0x020],%l6		! Mem[0000000010141420]
	ldstub	[%o2+0x007],%l5		! Mem[0000000010081407]
	jmpl	%g6+8,%g0
	fstoi	%f8 ,%f9 
p0_call_1_lo:
	retl
	fstod	%f9 ,%f8 
p0_jmpl_1_he:
	stb	%l6,[%i3+0x01d]		! Mem[00000000100c141d]
	stx	%l6,[%i2+0x020]		! Mem[0000000010081420]
	ldx	[%i1+0x028],%l1		! Mem[0000000010041428]
	ldstub	[%i4+0x01c],%l1		! Mem[000000001010141c]
	subc	%l6,0x714,%l0
	jmpl	%g6+8,%g0
	std	%l6,[%i6+0x030]		! Mem[0000000010181430]
p0_call_1_he:
	st	%f25,[%i2+0x014]	! Mem[0000000010081414]
	st	%f20,[%i0+0x030]	! Mem[0000000010001430]
	swap	[%i2+0x018],%l6		! Mem[0000000010081418]
	ldub	[%i5+0x007],%l1		! Mem[0000000010141407]
	fitod	%f19,%f24
	stw	%l6,[%i3+0x02c]		! Mem[00000000100c142c]
	retl
	fdtoi	%f30,%f22
p0_jmpl_1_ho:
	stb	%l6,[%o3+0x01d]		! Mem[00000000100c141d]
	stx	%l6,[%o2+0x020]		! Mem[0000000010081420]
	ldx	[%o1+0x028],%l1		! Mem[0000000010041428]
	ldstub	[%o4+0x01c],%l1		! Mem[000000001010141c]
	subc	%l6,0x714,%l0
	jmpl	%g6+8,%g0
	std	%l6,[%o6+0x030]		! Mem[0000000010181430]
p0_call_1_ho:
	st	%f25,[%o2+0x014]	! Mem[0000000010081414]
	st	%f20,[%o0+0x030]	! Mem[0000000010001430]
	swap	[%o2+0x018],%l6		! Mem[0000000010081418]
	ldub	[%o5+0x007],%l1		! Mem[0000000010141407]
	fitod	%f19,%f24
	stw	%l6,[%o3+0x02c]		! Mem[00000000100c142c]
	retl
	fdtoi	%f30,%f22
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	fstoi	%f3 ,%f3 
	subc	%l7,%l6,%l7
	fsubs	%f4 ,%f14,%f9 
	fdtoi	%f12,%f15
	jmpl	%g6+8,%g0
	st	%f3 ,[%i3+0x030]	! Mem[00000000100c1430]
p0_call_2_le:
	sth	%l4,[%i4+0x022]		! Mem[0000000010101422]
	retl
	lduw	[%i0+0x01c],%l2		! Mem[000000001000141c]
p0_jmpl_2_lo:
	fstoi	%f3 ,%f3 
	subc	%l7,%l6,%l7
	fsubs	%f4 ,%f14,%f9 
	fdtoi	%f12,%f15
	jmpl	%g6+8,%g0
	st	%f3 ,[%o3+0x030]	! Mem[00000000100c1430]
p0_call_2_lo:
	sth	%l4,[%o4+0x022]		! Mem[0000000010101422]
	retl
	lduw	[%o0+0x01c],%l2		! Mem[000000001000141c]
p0_jmpl_2_he:
	ldsb	[%i5+0x036],%l1		! Mem[0000000010141436]
	sdivx	%l7,%l4,%l3
	swap	[%i4+0x020],%l7		! Mem[0000000010101420]
	fmuls	%f22,%f29,%f31
	ldsh	[%i5+0x000],%l6		! Mem[0000000010141400]
	jmpl	%g6+8,%g0
	umul	%l4,%l6,%l7
p0_call_2_he:
	and	%l7,%l7,%l6
	lduw	[%i5+0x02c],%l0		! Mem[000000001014142c]
	or	%l7,%l7,%l1
	retl
	ldstub	[%o2+0x000],%l1		! Mem[00000000211c0000]
p0_jmpl_2_ho:
	ldsb	[%o5+0x036],%l1		! Mem[0000000010141436]
	sdivx	%l7,%l4,%l3
	swap	[%o4+0x020],%l7		! Mem[0000000010101420]
	fmuls	%f22,%f29,%f31
	ldsh	[%o5+0x000],%l6		! Mem[0000000010141400]
	jmpl	%g6+8,%g0
	umul	%l4,%l6,%l7
p0_call_2_ho:
	and	%l7,%l7,%l6
	lduw	[%o5+0x02c],%l0		! Mem[000000001014142c]
	or	%l7,%l7,%l1
	retl
	ldstub	[%i2+0x000],%l1		! Mem[00000000211c0000]
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	fcmps	%fcc3,%f6 ,%f10
	fstoi	%f7 ,%f14
	xnor	%l5,-0xbc3,%l7
	fsubs	%f12,%f15,%f10
	fsubs	%f9 ,%f14,%f4 
	jmpl	%g6+8,%g0
	fdtos	%f0 ,%f11
p0_call_3_le:
	retl
	umul	%l6,%l7,%l7
p0_jmpl_3_lo:
	fcmps	%fcc3,%f6 ,%f10
	fstoi	%f7 ,%f14
	xnor	%l5,-0xbc3,%l7
	fsubs	%f12,%f15,%f10
	fsubs	%f9 ,%f14,%f4 
	jmpl	%g6+8,%g0
	fdtos	%f0 ,%f11
p0_call_3_lo:
	retl
	umul	%l6,%l7,%l7
p0_jmpl_3_he:
	xor	%l7,0xa75,%l5
	udivx	%l7,-0xeef,%l0
	nop
	jmpl	%g6+8,%g0
	fdtoi	%f24,%f16
p0_call_3_he:
	ldd	[%i3+0x000],%l2		! Mem[00000000100c1400]
	ldsh	[%i6+0x03e],%l7		! Mem[000000001018143e]
	fsubs	%f26,%f20,%f23
	addc	%l3,-0x385,%l1
	ldsw	[%i0+0x030],%l4		! Mem[0000000010001430]
	fsqrts	%f26,%f29
	orn	%l1,%l3,%l5
	retl
	fdtoi	%f22,%f24
p0_jmpl_3_ho:
	xor	%l7,0xa75,%l5
	udivx	%l7,-0xeef,%l0
	nop
	jmpl	%g6+8,%g0
	fdtoi	%f24,%f16
p0_call_3_ho:
	ldd	[%o3+0x000],%l2		! Mem[00000000100c1400]
	ldsh	[%o6+0x03e],%l7		! Mem[000000001018143e]
	fsubs	%f26,%f20,%f23
	addc	%l3,-0x385,%l1
	ldsw	[%o0+0x030],%l4		! Mem[0000000010001430]
	fsqrts	%f26,%f29
	orn	%l1,%l3,%l5
	retl
	fdtoi	%f22,%f24
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
	.word	0x1564bc18,0x18654768		! Init value for %l0
	.word	0x9bf2cfe0,0x3309c53e		! Init value for %l1
	.word	0xc4ad5a68,0xcd57317c		! Init value for %l2
	.word	0x87cb47ce,0x0aa690c2		! Init value for %l3
	.word	0x7159770c,0x51639208		! Init value for %l4
	.word	0x78a90911,0xa3ce1d4d		! Init value for %l5
	.word	0x755384c2,0x74f2db83		! Init value for %l6
	.word	0xc66f10b2,0xbf83e6b4		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x1ea54470,0xa5d74ed1		! Init value for %f0 
	.word	0xd5e4c16f,0x79dccb52		! Init value for %f2 
	.word	0x17a825f8,0x1bab6075		! Init value for %f4 
	.word	0x2478b2ca,0xdba80498		! Init value for %f6 
	.word	0xca877beb,0xdf38bfe5		! Init value for %f8 
	.word	0x1831a4e7,0x51db2712		! Init value for %f10
	.word	0xdaa75d56,0x3f1f6cf9		! Init value for %f12
	.word	0xf3760b9f,0xfab9676a		! Init value for %f14
	.word	0x88f2bc69,0x777f6acc		! Init value for %f16
	.word	0x4c6e2360,0x5045b4ac		! Init value for %f18
	.word	0x1bf85f92,0x5cb2437d		! Init value for %f20
	.word	0x26e57ecc,0xfa192923		! Init value for %f22
	.word	0xc1151992,0x2a6bee38		! Init value for %f24
	.word	0xa69efaf6,0x39fc283b		! Init value for %f26
	.word	0xdcdbd6f8,0xd0f61b82		! Init value for %f28
	.word	0x9f499795,0x176bb887		! Init value for %f30
	.word	0xe118bca8,0xa89bb937		! Init value for %f32
	.word	0x482d5152,0x1553a3a0		! Init value for %f34
	.word	0x85b301a4,0x04b3a421		! Init value for %f36
	.word	0xff903a53,0x9ebe2647		! Init value for %f38
	.word	0xa3b827ed,0xeb792c1f		! Init value for %f40
	.word	0x143b2f8a,0x123b7f2f		! Init value for %f42
	.word	0xacda706e,0x1beae61a		! Init value for %f44
	.word	0x1a4c1d3e,0xe03c4082		! Init value for %f46
	.word	0x532290d4,0x744ce7cf
	.word	0xa11ede7c,0x48e3b36b
	.word	0x8602e3ee,0x0d7983d1
	.word	0x36284090,0x080ab8c7
	.word	0x558cacb8,0xa159fde0
	.word	0x2d293920,0x13f59b85
	.word	0xb58e5ec1,0x50214cd2
	.word	0xe32f7be0,0x88055f46
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
	.word	0x00000000,0x00ff00ff
	.word	0x00000000,0x00007b35
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x19000000
	.word	0x00000000,0x0000ffff
	.word	0x00000000,0x0000003a
	.word	0x00000000,0x00000042
	.word	0x00000000,0x0000d2e9
p0_expected_fp_regs:
	.word	0x00000000,0x9a000000
	.word	0xff000000,0x399c4442
	.word	0xff000000,0x00000000
	.word	0x003981d1,0xffff1c72
	.word	0x00009aff,0x00000000
	.word	0xd1813900,0x6659b319
	.word	0x26bfa66f,0x61602d68
	.word	0x86f3c5ff,0xa625bcc7
	.word	0xffffffff,0xeef66bda
	.word	0x6659b319,0x000000ff
	.word	0xffffeeff,0x19b35966
	.word	0x0000d2e9,0x00395bbd
	.word	0xff000000,0x00000085
	.word	0x00000000,0xff9ec5ff
	.word	0xff000000,0x00000000
	.word	0xffff1c72,0xff9ec51c
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0x00ffffff,0xffffffff
	.word	0xffff0000,0x3a000000
	.word	0xff59b3ff,0xe8920000
	.word	0x003a0000,0x43821c72
	.word	0x00000000,0x00ff00ff
	.word	0x0000008b,0x00000042
	.word	0xa5744f2c,0x000000e6
	.word	0x42449c39,0x4bc84cff
p0_local0_sec_expect:
	.word	0x721c8243,0xc4000000
	.word	0xffff0000,0x0000009c
	.word	0x00000000,0x1cc59eff
	.word	0x7b85de8b,0x68ecfdd0
	.word	0xe8920000,0x91800000
	.word	0x6e0b7f3a,0xe603ff57
	.word	0x00395b1c,0xff000000
	.word	0xc44e2ba6,0xb0538f8d
p0_local1_expect:
	.word	0x005b3900,0x1cc59eff
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x003981d1
	.word	0x0000d2e9,0x00395bbd
	.word	0x00ffd2ff,0x000092e8
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x00000000
	.word	0x00000000,0xffffffee
p0_local1_sec_expect:
	.word	0xda6bf6ee,0xb0538f8d
	.word	0x19b35966,0x003981d1
	.word	0xff000000,0x00000000
	.word	0xd525960b,0x99ec8220
	.word	0x129bb126,0x4a03e98c
	.word	0x31a4ff9c,0x23d02031
	.word	0xc11b38cf,0x82b05f48
	.word	0x79d280ff,0xb20000b8
p0_local2_expect:
	.word	0x00000000,0x000000ff
	.word	0xffff1c72,0xff9ec51c
	.word	0xff000000,0x19b35966
	.word	0x000000ff,0xe531402f
	.word	0x00395b1c,0x66d2aa05
	.word	0x239ff9aa,0x00000000
	.word	0x00000000,0x00000000
	.word	0xff9ec5ea,0xbaecf9ab
p0_local2_sec_expect:
	.word	0xff000000,0x1cc59eff
	.word	0x00000000,0x0000003a
	.word	0x00000000,0xff5b3900
	.word	0x0000d2e9,0x00395bbd
	.word	0xc1821f24,0x2c4f74a5
	.word	0x6e0b7f3a,0x0000d2ff
	.word	0x8d8f53b0,0xa62b4ec4
	.word	0xbc3a6512,0x9efa5dd9
p0_local3_expect:
	.word	0xff71357b,0x9a000000
	.word	0xda6bf6ee,0x00007b35
	.word	0xda6bf6ee,0xffffffff
	.word	0x003981d1,0x43821c72
	.word	0x00000000,0x00000000
	.word	0x19b35966,0xff9ec5ff
	.word	0x26ffa66f,0x61602d68
	.word	0x9f000000,0xa625bcc7
p0_local3_sec_expect:
	.word	0x000000ff,0x00395b1c
	.word	0xff000000,0x83000000
	.word	0xffeeffff,0x00000000
	.word	0xbd5b3900,0xe9d20000
	.word	0xe8920000,0xffd2ff00
	.word	0x1cc59eff,0x6ebcecba
	.word	0x00000000,0x000000ff
	.word	0xeeffffff,0x00000000
p0_local4_expect:
	.word	0x0043aa05,0xff03ff57
	.word	0xff000000,0x00000000
	.word	0x7b3571bc,0x86f326ff
	.word	0x00000000,0x00004200
	.word	0xffffaa05,0xeef66bda
	.word	0x0002ffff,0x3a7f576e
	.word	0x2a76800a,0x89361fca
	.word	0x2c4f74a5,0xffffffff
p0_local4_sec_expect:
	.word	0xffb35966,0x003981d1
	.word	0x19000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0xd0fdec68,0x8bde857b
	.word	0xcaba3ba6,0xb0530ea0
	.word	0x488fdd58,0xe8080f6c
	.word	0x2a76800a,0x89361fca
	.word	0x8d8f53b0,0xa62b4ec4
p0_local5_expect:
	.word	0x00000000,0x8bde857b
	.word	0xff000000,0xffffffee
	.word	0xff008091,0x0000a625
	.word	0xff26f386,0xbc71357b
	.word	0xff9ebcc7,0xffff9cff
	.word	0xbc3a6512,0x9efa5dd9
	.word	0x1100b3a7,0xc2208e57
	.word	0xb366fae9,0x0000ff00
p0_local5_sec_expect:
	.word	0x00000000,0x9a000000
	.word	0xff000000,0x399c4442
	.word	0xff000000,0x00000000
	.word	0x003981d1,0xffff1c72
	.word	0x00009aff,0x00000000
	.word	0xd1813900,0x6659b319
	.word	0x26bfa66f,0x61602d68
	.word	0x86f3c5ff,0xa625bcc7
p0_local6_expect:
	.word	0x000000ff,0xe9d20000
	.word	0x00c559ff,0x000081d1
	.word	0x00000000,0x000000ff
	.word	0xffffffff,0x00fff89b
	.word	0x00000000,0x00000083
	.word	0x00000085,0xcc7e6d15
	.word	0x6f273e24,0xf86a0000
	.word	0x8d8f53b0,0x00000000
p0_local6_sec_expect:
	.word	0xff0081d1,0x0000009c
	.word	0xff00b319,0xffffffff
	.word	0x000092e8,0x00000000
	.word	0xf6113d3e,0x7905ea26
	.word	0x6f273e24,0xf86a4d58
	.word	0x0a1dbb9b,0xacfd61e7
	.word	0x0f36a7ae,0x7fd1bbc9
	.word	0xcd54064d,0xec8e78c0
share0_expect:
	.word	0x57004c16,0x704f79c1
	.word	0x18ebc9bc,0xc6ab849a
	.word	0x32985e7f,0x83156671
	.word	0xa9926de4,0xda560313
	.word	0x8dc2eca7,0x3eb13f0c
	.word	0xbe0a47b9,0xea76518f
	.word	0x06de1648,0xb87d4dc3
	.word	0x205f4dc4,0x24623d6b
share1_expect:
	.word	0xffff5a05,0x05990aac
	.word	0xebb0fb83,0x891bded0
	.word	0xaa744a28,0x88917c21
	.word	0x4bfd2499,0x64d72994
	.word	0x2b2db500,0x43a66f83
	.word	0x638f9f14,0x84098160
	.word	0xa8986f4a,0xb54d8732
	.word	0x0b5ef026,0x76ba9229
	.word	0x00ffe22a,0xfb445aed
	.word	0x795207fc,0x10be0990
	.word	0x8c65063f,0xea6bbf30
	.word	0x2cc943c6,0x01a79a19
	.word	0xe78f2164,0xf0b8315f
	.word	0x6bfede8e,0xe64dcf55
	.word	0x70c4fce2,0xc45192c7
	.word	0xd83d1d65,0xc5f34f14
share2_expect:
	.word	0x43ff6986,0xa3b13abc
	.word	0x470f63fe,0x09dc6ac6
	.word	0xc307c49e,0x8d760497
	.word	0xd1d3b81a,0x66a9742a
	.word	0xb9ece0cd,0x8863cd37
	.word	0x7cd02c68,0xc829bf74
	.word	0x919d5593,0x26061bd3
	.word	0x9d1a43cb,0x93a8e407
share3_expect:
	.word	0x94f7d108,0x42cd8773
	.word	0xba149091,0x96ab6a44
	.word	0xeb0a3e2f,0x67bc6c94
	.word	0xe7e8398c,0xa8620968
	.word	0xc2169408,0x67a9bfb4
	.word	0x40f1d58b,0x29f8f01b
	.word	0x8a2443a3,0x967bf057
	.word	0xeee46675,0x7976e1a0
	.word	0xff564da2,0x8b47a723
	.word	0x14fd5bcd,0xd1195f03
	.word	0x54a2d563,0x70c56706
	.word	0x282e8df5,0x4b6a9ae8
	.word	0x3fa43ced,0x28068ace
	.word	0xe672d9c5,0x5b74da17
	.word	0x6d253577,0xcff4e198
	.word	0xa73706cc,0x87d319a9
	.word	0x00ff64ec,0xbdbdf222
	.word	0x759f7c14,0xd2ed8897
	.word	0x76c5d09c,0x33dd9627
	.word	0x1dd44cec,0xcd09a0ef
	.word	0x0ab86b0d,0x1fab0f72
	.word	0x5cfa44a6,0x4462a33b
	.word	0x7fdd0377,0xa829b149
	.word	0x95f3c54c,0xb9d5cf32
	.word	0x3a0fcd1f,0x1d60ce52
	.word	0x832084da,0xd7c5feab
	.word	0xc83575a7,0x49859069
	.word	0x53a2afa3,0xc93e90ec
	.word	0xf974bb56,0x66e0ab22
	.word	0x295ba347,0x25ae54ba
	.word	0xbdf0cab1,0x1dd4bda2
	.word	0x11640bd6,0x09c3ae56
	.word	0xffbd02e9,0x9142a108
	.word	0xdfffbe72,0x5738cbdb
	.word	0x56f6e387,0xa15df4ac
	.word	0x6105191c,0x49ee1f5a
	.word	0x8bcb0a97,0xc7af5e6f
	.word	0x67bc0bfa,0x28cf461d
	.word	0x1bfca58c,0xe1c973a9
	.word	0x8f152473,0x9cb9e8f7
	.word	0x9fffe548,0xa3fc9b81
	.word	0xcff16df4,0xb9c0f393
	.word	0xbdcd4f20,0x39d03625
	.word	0x05d3bbd7,0xe4e811af
	.word	0xe164029b,0xf7d5410d
	.word	0x4e9ba367,0xd6fd5002
	.word	0xfb5eb169,0x85977b56
	.word	0x688c552b,0x3a0e9619
	.word	0x1fcaca0d,0x13d5002d
	.word	0x33ad1c36,0x86b8ba7c
	.word	0x4410c57f,0xd9c29cd3
	.word	0xa933c8a0,0xf1a03505
	.word	0xd65b0400,0x53cad312
	.word	0x4cf6f2fc,0xd29c345a
	.word	0xba53c4bf,0xd7d5ba61
	.word	0x7bf31f1e,0x6cb9333d
	.word	0x830ace35,0x577274ad
	.word	0xfd1e0aca,0x969226e2
	.word	0x9035b58b,0xfe7b3980
	.word	0xfa06c697,0x64e41c67
	.word	0xf382de97,0x1913a3be
	.word	0xea4d96cd,0xa9500c98
	.word	0x71ade129,0xe536b4b7
	.word	0x391b88d4,0x9feb8313
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
	.word	0xb8b4a3af,0xf9a80ba0
	.word	0x00000000,0x00000002
	.word	0xe15497a0,0x1f89b41b
	.word	0x00000000,0x00000003
	.word	0x0ae9be4f,0xb7207f51
	.word	0x00000000,0x00000004
	.word	0x42d28c58,0x60561ed5
	.word	0x00000000,0x00000005
	.word	0x0bde259f,0xc91c54d9
	.word	0x00000000,0x00000006
	.word	0x5bc3138f,0xb7c470e0
	.word	0x00000000,0x00000007
	.word	0xc08b858f,0xaac1201c
	.word	0x00000000,0x00000008
	.word	0x9cbde8af,0x9cb85f1d
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
	.word	0x61a6c4bb,0xcf57710e,0x997b4e5b,0xeb373536
	.word	0xbfd3f035,0x11c45f74,0xa7463bf1,0xd204d56c
	.word	0x335d699b,0x17cc87b7,0xb05dde72,0x2c089fa1
	.word	0xe114fa68,0xa625cae9,0xbad062da,0xe18eb258
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
	.word	0xbfbfa66f,0x61602d68,0x8c5ddd3f,0x1f369552
	.word	0x7a718f26,0x2922c2d4,0x4e4e5160,0x9aec8665
	.word	0x1d3aae13,0x76da8471,0xee098e86,0x8770a023
	.word	0x6d39ecd7,0xe6c2e4dd,0x08b82755,0x4d942fe8
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
	.word	0xea08d2bd,0xea3aa890,0xa7e359ee,0x61429ff0
	.word	0xbd2fa5c9,0xf608314c,0xc1821f24,0x2c4f74a5
	.word	0x258da68d,0x8c559f5c,0x8b034fc9,0xdf72ad82
	.word	0x156a04ab,0x61c2e2b3,0x4791ccb6,0x87452406
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
	.word	0x6889dceb,0xfdc12fef,0xce22a038,0xdadb7aee
	.word	0x28bec284,0xfea02e6b,0xd525960b,0x99ec8220
	.word	0x129bb126,0x4a03e98c,0x31a4ff9c,0x23d02031
	.word	0xc11b38cf,0x82b05f48,0x79a380ff,0xb200b2b8
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
	.word	0x8f355064,0xc013d703,0x14c0b226,0xe892acbe
	.word	0xa18c0a8b,0x61f5e1f3,0xc21fd5b9,0xe531402f
	.word	0xac60e6af,0x6e13e270,0x239ff9aa,0xac026253
	.word	0xce964045,0xe94226de,0xea9ec5ea,0xbaecbc6e
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
	.word	0x7e00701d,0x92a2c4eb,0xb1d6ef03,0x77e4b6ce
	.word	0x7e2098f3,0x66d2aa05,0x05f054f4,0xf0e060cd
	.word	0x3733c04f,0x683c93ef,0x76365d7e,0xc98e46d3
	.word	0x3588f09e,0xcb454f27,0x9405f488,0x3e7ece56
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
	.word	0x91805266,0x15bd4a8a,0xf433680c,0x73ae1e78
	.word	0x5f9e495a,0x16d1ecac,0x003981d1,0x477af332
	.word	0xbb8cf8b6,0x8b3cfe3a,0x19b359a4,0xe6038157
	.word	0x26959520,0x7847714a,0x5f5e9b13,0x2fa3d66e
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
	.word	0xa32ae803,0xe98165e3,0x94b52a91,0x597041ae
	.word	0xf06b5298,0x42d6d559,0x2732f614,0x6dd9916a
	.word	0xf4926bce,0x17f5425f,0x32e46632,0xc9c58715
	.word	0x9fc90f35,0xed92b75b,0xa399a520,0xc4146163
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
	.word	0x20125042,0xd2be1b72,0xe9d011e2,0x7dce599e
	.word	0x76a25b1c,0x4bf7ed64,0xafbf4c43,0xe04b8abb
	.word	0x3b7829f2,0xc443b9a4,0xbfa28d72,0x62051537
	.word	0x190d7dd8,0x5f466c90,0xc9c7befc,0x3d04de1c
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
	.word	0xdd6041fa,0x3b6c3471,0xcb983130,0x24d734d6
	.word	0x8232d2c6,0x844e71dc,0xd0fdec68,0x8bde857b
	.word	0xcaba3b13,0x3ac60ea0,0x488fdd58,0xe8080f6c
	.word	0x2a76800a,0x89361fca,0x8d8f53b0,0xa62b4ec4
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
	.word	0x21ab3855,0x640041c6,0xaf5dc644,0x66c45d71
	.word	0x24e44417,0xe853ce74,0x4926f386,0xbc71357b
	.word	0x60099c4f,0x1cede55e,0xbc3a6512,0x9efa5dd9
	.word	0x113fb3a7,0xc2208e22,0xb366fae9,0x9f339182
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
	.word	0xb534dc3b,0xdaadbfe4,0xf56c0aa6,0xd9a4062a
	.word	0xf02afca4,0x377f2edd,0x9ec3138e,0x27920983
	.word	0x65528a93,0x8a570786,0xf54cc84b,0x399c4442
	.word	0x14f66b22,0x555c9ceb,0xc965974b,0xf7fdaf8a
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
	.word	0x6bf4c6d6,0x24182526,0xaa752d05,0x2901741a
	.word	0x1d53376f,0xcf0722f3,0xda008c70,0xe37b3d9b
	.word	0x3c80cf37,0xc4ea72a9,0x65d72f00,0x001c6d15
	.word	0x3266d851,0x138ecbae,0x1788c5ee,0x5ea30b43
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
	.word	0xdcc02a47,0x210acd61,0x6e0b7f3a,0x39d135b5
	.word	0x28560c52,0xe3287b27,0xf6113d3e,0x7905ea26
	.word	0x6f273e24,0xf86a4d58,0x0a1dbb9b,0xacfd61e7
	.word	0x0f36a7ae,0x7fd1bbc9,0xcd54064d,0xec8e78c0
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
	.word	0x85944c16,0x704f79c1,0x18ebc9bc,0xc6ab849a
	.word	0x32985e7f,0x83156671,0xa9926de4,0xda560313
	.word	0x8dc2eca7,0x3eb13f0c,0xbe0a47b9,0xea76518f
	.word	0x06de1648,0xb87d4dc3,0x205f4dc4,0x24623d6b
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
	.word	0xc5ca5a05,0x05990aac,0xebb0fb83,0x891bded0
	.word	0xaa744a28,0x88917c21,0x4bfd2499,0x64d72994
	.word	0x2b2db500,0x43a66f83,0x638f9f14,0x84098160
	.word	0xa8986f4a,0xb54d8732,0x0b5ef026,0x76ba9229
	.word	0xbcc7e22a,0xfb445aed,0x795207fc,0x10be0990
	.word	0x8c65063f,0xea6bbf30,0x2cc943c6,0x01a79a19
	.word	0xe78f2164,0xf0b8315f,0x6bfede8e,0xe64dcf55
	.word	0x70c4fce2,0xc45192c7,0xd83d1d65,0xc5f34f14
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
	.word	0x2cff6986,0xa3b13abc,0x470f63fe,0x09dc6ac6
	.word	0xc307c49e,0x8d760497,0xd1d3b81a,0x66a9742a
	.word	0xb9ece0cd,0x8863cd37,0x7cd02c68,0xc829bf74
	.word	0x919d5593,0x26061bd3,0x9d1a43cb,0x93a8e407
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
	.word	0x94f7d108,0x42cd8773,0xba149091,0x96ab6a44
	.word	0xeb0a3e2f,0x67bc6c94,0xe7e8398c,0xa8620968
	.word	0xc2169408,0x67a9bfb4,0x40f1d58b,0x29f8f01b
	.word	0x8a2443a3,0x967bf057,0xeee46675,0x7976e1a0
	.word	0x02564da2,0x8b47a723,0x14fd5bcd,0xd1195f03
	.word	0x54a2d563,0x70c56706,0x282e8df5,0x4b6a9ae8
	.word	0x3fa43ced,0x28068ace,0xe672d9c5,0x5b74da17
	.word	0x6d253577,0xcff4e198,0xa73706cc,0x87d319a9
	.word	0xc62464ec,0xbdbdf222,0x759f7c14,0xd2ed8897
	.word	0x76c5d09c,0x33dd9627,0x1dd44cec,0xcd09a0ef
	.word	0x0ab86b0d,0x1fab0f72,0x5cfa44a6,0x4462a33b
	.word	0x7fdd0377,0xa829b149,0x95f3c54c,0xb9d5cf32
	.word	0x3a0fcd1f,0x1d60ce52,0x832084da,0xd7c5feab
	.word	0xc83575a7,0x49859069,0x53a2afa3,0xc93e90ec
	.word	0xf974bb56,0x66e0ab22,0x295ba347,0x25ae54ba
	.word	0xbdf0cab1,0x1dd4bda2,0x11640bd6,0x09c3ae56
	.word	0x979502e9,0x9142a108,0xdfffbe72,0x5738cbdb
	.word	0x56f6e387,0xa15df4ac,0x6105191c,0x49ee1f5a
	.word	0x8bcb0a97,0xc7af5e6f,0x67bc0bfa,0x28cf461d
	.word	0x1bfca58c,0xe1c973a9,0x8f152473,0x9cb9e8f7
	.word	0x2873e548,0xa3fc9b81,0xcff16df4,0xb9c0f393
	.word	0xbdcd4f20,0x39d03625,0x05d3bbd7,0xe4e811af
	.word	0xe164029b,0xf7d5410d,0x4e9ba367,0xd6fd5002
	.word	0xfb5eb169,0x85977b56,0x688c552b,0x3a0e9619
	.word	0x5db8ca0d,0x13d5002d,0x33ad1c36,0x86b8ba7c
	.word	0x4410c57f,0xd9c29cd3,0xa933c8a0,0xf1a03505
	.word	0xd65b0400,0x53cad312,0x4cf6f2fc,0xd29c345a
	.word	0xba53c4bf,0xd7d5ba61,0x7bf31f1e,0x6cb9333d
	.word	0x830ace35,0x577274ad,0xfd1e0aca,0x969226e2
	.word	0x9035b58b,0xfe7b3980,0xfa06c697,0x64e41c67
	.word	0xf382de97,0x1913a3be,0xea4d96cd,0xa9500c98
	.word	0x71ade129,0xe536b4b7,0x391b88d4,0x9feb8313
share3_end:
