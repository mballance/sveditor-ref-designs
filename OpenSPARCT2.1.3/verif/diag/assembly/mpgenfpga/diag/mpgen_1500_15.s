/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_15.s
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
!	Seed = 327144534
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1500_15.s created on Mar 27, 2009 (14:45:34)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_1500_15 -p 1 -l 1500

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
!	%f0  = c2de300d dde5afdd 02c854f0 38d54d89
!	%f4  = 95f911c1 a125a382 80ddcbc3 614c11a0
!	%f8  = 771d9f0f 696b1178 e7617a36 7b85f102
!	%f12 = 51f8dceb 167cfdb8 7ab333f5 864cae6c
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 517462e5 d4d2176b 65de29bb 5c5f0d5d
!	%f20 = bc93102e 853c7314 03b02e58 82f57916
!	%f24 = 2b1f52a0 2e9bec6d b979979e 080e08a5
!	%f28 = 9a04926a a0e251f3 9787eb2b 410fe543
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 99de84aa 3125a7e5 c66815e2 541ebde1
!	%f36 = a7dacca1 3b57bfc1 bc8fc929 68e591c1
!	%f40 = c3a10586 5e8f0620 8db3c9fe a645b4ce
!	%f44 = d8ac9843 c335c6e8 a4bd8962 37a7137e
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x71a7ca0f00000034,%g7,%g1 ! GSR scale =  6, align = 4
	wr	%g1,%g0,%gsr		! GSR = 71a7ca0f00000034
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l6 = a8bed256, %l7 = ef7315dc, Mem[0000000030101410] = 6fccc237 32648985
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = a8bed256 ef7315dc
!	%l7 = 13653169ef7315dc, Mem[0000000030001410] = 25393a09
	stha	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 253915dc
!	Mem[0000000030101408] = 7a555fba, %l6 = 9634340ea8bed256
	ldswa	[%i4+%o4]0x81,%l6	! %l6 = 000000007a555fba
!	Mem[0000000010041408] = 8e1b99d7, %l4 = 9ed92743dc5da346
	lduha	[%i1+%o4]0x80,%l4	! %l4 = 0000000000008e1b
!	%l2 = 3abd3d7ebcfafe6d, Mem[0000000030101410] = a8bed256
	stwa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = bcfafe6d
!	Mem[0000000030001410] = a2a3303c253915dc, %f16 = 517462e5 d4d2176b
	ldda	[%i0+%o5]0x89,%f16	! %f16 = a2a3303c 253915dc
!	Mem[0000000010081410] = 12388ec94efc2df6, %l3 = 12f514ba2028c67b
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = 12388ec94efc2df6
!	Mem[0000000010141410] = 69953adf, %l5 = 2b47e9745b5fde6c
	lduba	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000df
!	Mem[0000000030041400] = 1a4cde05 af445512, %l2 = bcfafe6d, %l3 = 4efc2df6
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 00000000af445512 000000001a4cde05
!	Starting 10 instruction Store Burst
!	%l2 = 00000000af445512, Mem[00000000201c0001] = 126cde6c
	stb	%l2,[%o0+0x001]		! Mem[00000000201c0000] = 1212de6c

p0_label_2:
!	Mem[0000000010181424] = e8f438d9, %l6 = 000000007a555fba, %asi = 80
	swapa	[%i6+0x024]%asi,%l6	! %l6 = 00000000e8f438d9
!	Mem[00000000211c0001] = d561622e, %l2 = 00000000af445512
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 00000061000000ff
!	%l6 = e8f438d9, %l7 = ef7315dc, Mem[0000000010081400] = ad9f63ff 8ce02fac
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = e8f438d9 ef7315dc
!	%l6 = 00000000e8f438d9, Mem[0000000010041400] = 54775d61
	stba	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = d9775d61
!	%l0 = 3ee8ec29, %l1 = 230fddce, Mem[00000000300c1408] = f2184855 bd4e8066
	stda	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 3ee8ec29 230fddce
!	%l0 = 3ee8ec29, %l1 = 230fddce, Mem[0000000030181400] = 6ba2dcff 969aa2da
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 3ee8ec29 230fddce
!	%f24 = 2b1f52a0 2e9bec6d, Mem[0000000030001410] = 253915dc a2a3303c
	stda	%f24,[%i0+%o5]0x89	! Mem[0000000030001410] = 2b1f52a0 2e9bec6d
!	%l0 = 09d72c243ee8ec29, imm = fffffffffffff066, %l4 = 0000000000008e1b
	sub	%l0,-0xf9a,%l4		! %l4 = 09d72c243ee8fbc3
!	%l0 = 09d72c243ee8ec29, Mem[0000000030141410] = 4e4bbc42
	stha	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = ec29bc42
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = 3aefa7e1 adf9f778, %l4 = 3ee8fbc3, %l5 = 000000df
	ldd	[%i3+0x028],%l4		! %l4 = 000000003aefa7e1 00000000adf9f778

p0_label_3:
!	Mem[0000000030081408] = d654367c, %l1 = 3afe6bda230fddce
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 000000000000007c
!	Mem[00000000100c1408] = 0b0d6fc8, %l0 = 09d72c243ee8ec29
	ldsba	[%i3+%o4]0x88,%l0	! %l0 = ffffffffffffffc8
!	Mem[00000000300c1400] = cbffaae5, %f20 = bc93102e
	lda	[%i3+%g0]0x81,%f20	! %f20 = cbffaae5
!	Mem[0000000030101400] = e7ffe701da9674f8, %f8  = 771d9f0f 696b1178
	ldda	[%i4+%g0]0x89,%f8 	! %f8  = e7ffe701 da9674f8
!	Mem[0000000010101408] = 9608d922, %l3 = 000000001a4cde05
	lduwa	[%i4+%o4]0x88,%l3	! %l3 = 000000009608d922
!	Mem[0000000010101408] = 2d220e53 9608d922, %l2 = 00000061, %l3 = 9608d922
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 000000009608d922 000000002d220e53
!	Mem[0000000010101410] = 19e35666, %f15 = 864cae6c
	lda	[%i4+%o5]0x80,%f15	! %f15 = 19e35666
!	Mem[0000000030101410] = 6dfefabc, %l2 = 000000009608d922
	lduba	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000bc
!	Mem[0000000030101408] = ba5f557a, %l2 = 00000000000000bc
	lduwa	[%i4+%o4]0x89,%l2	! %l2 = 00000000ba5f557a
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = f04d6bad, %l1 = 000000000000007c
	swapa	[%i6+%o5]0x89,%l1	! %l1 = 00000000f04d6bad

p0_label_4:
!	%l2 = 00000000ba5f557a, Mem[00000000300c1400] = e5aaffcb
	stha	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = e5aa557a
!	%f12 = 51f8dceb 167cfdb8, Mem[0000000010001410] = 0e927e34 ea0506b4
	stda	%f12,[%i0+%o5]0x88	! Mem[0000000010001410] = 51f8dceb 167cfdb8
!	%l1 = 00000000f04d6bad, Mem[00000000100c1410] = a368771a
	stba	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = ad68771a
!	%l3 = 000000002d220e53, Mem[00000000100c1418] = 1f01e0ee3b1a4b65
	stx	%l3,[%i3+0x018]		! Mem[00000000100c1418] = 000000002d220e53
!	%f20 = cbffaae5, Mem[0000000030001400] = 10ef94e2
	sta	%f20,[%i0+%g0]0x81	! Mem[0000000030001400] = cbffaae5
!	Mem[0000000010001403] = 88a28424, %l6 = 00000000e8f438d9
	ldstub	[%i0+0x003],%l6		! %l6 = 00000024000000ff
!	Mem[0000000010081416] = c98e3812, %l5 = 00000000adf9f778
	ldstuba	[%i2+0x016]%asi,%l5	! %l5 = 00000038000000ff
!	Mem[0000000021800000] = 95787193, %l6 = 0000000000000024
	ldstuba	[%o3+0x000]%asi,%l6	! %l6 = 00000095000000ff
!	%l2 = 00000000ba5f557a, Mem[0000000021800141] = 7171f79c
	stb	%l2,[%o3+0x141]		! Mem[0000000021800140] = 717af79c
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = bd8426d4, %f29 = a0e251f3
	lda	[%i6+%o4]0x80,%f29	! %f29 = bd8426d4

p0_label_5:
!	Mem[0000000010001410] = b8fd7c16, %l0 = ffffffffffffffc8
	lduha	[%i0+%o5]0x80,%l0	! %l0 = 000000000000b8fd
!	Mem[00000000100c1410] = ad68771a, %l6 = 0000000000000095
	lduba	[%i3+%o5]0x80,%l6	! %l6 = 00000000000000ad
!	Mem[0000000010141408] = d8d112e249bec8ce, %f20 = cbffaae5 853c7314
	ldda	[%i5+%o4]0x80,%f20	! %f20 = d8d112e2 49bec8ce
!	Mem[0000000010181400] = a612477d, %l7 = 13653169ef7315dc
	lduba	[%i6+%g0]0x88,%l7	! %l7 = 000000000000007d
!	Mem[0000000010181408] = bd8426d4, %l6 = 00000000000000ad
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 00000000bd8426d4
!	Mem[0000000030001400] = cbffaae5, %l0 = 000000000000b8fd
	lduwa	[%i0+%g0]0x81,%l0	! %l0 = 00000000cbffaae5
!	Mem[0000000010181408] = d42684bd, %f18 = 65de29bb
	lda	[%i6+%o4]0x88,%f18	! %f18 = d42684bd
!	Mem[0000000030001408] = fc90eb4e80db160c, %f8  = e7ffe701 da9674f8
	ldda	[%i0+%o4]0x81,%f8 	! %f8  = fc90eb4e 80db160c
!	Mem[0000000030041408] = 3ce3b456, %l6 = 00000000bd8426d4
	lduba	[%i1+%o4]0x81,%l6	! %l6 = 000000000000003c
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 29ece83e, %l2 = 00000000ba5f557a
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 0000003e000000ff

p0_label_6:
!	%l0 = cbffaae5, %l1 = f04d6bad, Mem[0000000030041408] = 3ce3b456 81180082
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = cbffaae5 f04d6bad
!	%f3  = 38d54d89, Mem[0000000010001424] = 48021096
	st	%f3 ,[%i0+0x024]	! Mem[0000000010001424] = 38d54d89
!	%l7 = 000000000000007d, Mem[0000000010041400] = 615d77d9
	stha	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 615d007d
!	Mem[0000000010001410] = 167cfdb8, %l5 = 0000000000000038
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 00000000167cfdb8
!	%f0  = c2de300d dde5afdd 02c854f0 38d54d89
!	%f4  = 95f911c1 a125a382 80ddcbc3 614c11a0
!	%f8  = fc90eb4e 80db160c e7617a36 7b85f102
!	%f12 = 51f8dceb 167cfdb8 7ab333f5 19e35666
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	%l4 = 000000003aefa7e1, Mem[0000000010141428] = 819db43a
	stw	%l4,[%i5+0x028]		! Mem[0000000010141428] = 3aefa7e1
!	%l5 = 00000000167cfdb8, Mem[0000000010141400] = 32702f931db6c076
	stxa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000167cfdb8
!	%f24 = 2b1f52a0 2e9bec6d, Mem[00000000300c1410] = 4472f3a0 dd6c6fd6
	stda	%f24,[%i3+%o5]0x81	! Mem[00000000300c1410] = 2b1f52a0 2e9bec6d
	membar	#Sync			! Added by membar checker (1)
!	%l7 = 000000000000007d, Mem[0000000010041408] = 8e1b99d7bb2677ac
	stx	%l7,[%i1+%o4]		! Mem[0000000010041408] = 000000000000007d
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = fe2f8901, %l0 = 00000000cbffaae5
	lduha	[%i2+%o4]0x88,%l0	! %l0 = 0000000000008901

p0_label_7:
!	Mem[0000000010041400] = 7d005d618c1a090d, %l6 = 000000000000003c
	ldx	[%i1+%g0],%l6		! %l6 = 7d005d618c1a090d
!	Mem[0000000030041410] = c111f995, %f30 = 9787eb2b
	lda	[%i1+%o5]0x89,%f30	! %f30 = c111f995
!	Mem[0000000010101410] = 19e35666, %f23 = 82f57916
	lda	[%i4+%o5]0x80,%f23	! %f23 = 19e35666
!	Mem[00000000100c1430] = 9e93528b, %l7 = 000000000000007d
	ldsh	[%i3+0x032],%l7		! %l7 = 000000000000528b
!	Mem[0000000010001410] = 38000000, %l4 = 000000003aefa7e1
	ldsba	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000038
!	Mem[00000000211c0000] = d5ff622e, %l6 = 7d005d618c1a090d
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffd5ff
!	Mem[0000000030181400] = 3ee8ec29, %l0 = 0000000000008901
	ldsha	[%i6+%g0]0x81,%l0	! %l0 = 0000000000003ee8
!	Mem[0000000010041438] = d1862b88b49ffcaf, %l2 = 000000000000003e
	ldxa	[%i1+0x038]%asi,%l2	! %l2 = d1862b88b49ffcaf
!	Mem[0000000030141410] = ec29bc42, %l0 = 0000000000003ee8
	ldswa	[%i5+%o5]0x81,%l0	! %l0 = ffffffffec29bc42
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = eac7063d, %l7 = 000000000000528b
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 0000003d000000ff

p0_label_8:
!	%l6 = ffffffffffffd5ff, %l0 = ffffffffec29bc42, %l5 = 00000000167cfdb8
	or	%l6,%l0,%l5		! %l5 = fffffffffffffdff
!	%f4  = 95f911c1 a125a382, %l6 = ffffffffffffd5ff
!	Mem[0000000030141430] = f6dca653b02daabc
	add	%i5,0x030,%g1
	stda	%f4,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030141430] = 82a325a1c111f995
!	%l0 = ffffffffec29bc42, Mem[0000000030141410] = 42bc29ec
	stba	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 42bc2942
!	%f20 = d8d112e2 49bec8ce, Mem[00000000100c1408] = c86f0d0b 927067e1
	stda	%f20,[%i3+%o4]0x80	! Mem[00000000100c1408] = d8d112e2 49bec8ce
!	Mem[0000000010001410] = 38000000, %l6 = ffffffffffffd5ff
	lduwa	[%i0+%o5]0x80,%l6	! %l6 = 0000000038000000
!	%l4 = 0000000000000038, Mem[0000000030041400] = c2de300d
	stba	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 38de300d
!	%l3 = 000000002d220e53, Mem[0000000010101414] = 015e4f85, %asi = 80
	stha	%l3,[%i4+0x014]%asi	! Mem[0000000010101414] = 0e534f85
!	%f20 = d8d112e2, Mem[0000000010041408] = 00000000
	sta	%f20,[%i1+%o4]0x80	! Mem[0000000010041408] = d8d112e2
!	%f20 = d8d112e2, Mem[0000000010001434] = 2975bc2d
	st	%f20,[%i0+0x034]	! Mem[0000000010001434] = d8d112e2
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = a612477d, %f18 = d42684bd
	lda	[%i6+%g0]0x88,%f18	! %f18 = a612477d

p0_label_9:
!	Mem[0000000020800040] = 61300345, %l0 = ffffffffec29bc42
	ldsh	[%o1+0x040],%l0		! %l0 = 0000000000006130
!	Mem[0000000010041428] = 95303980a5f1a9a2, %l7 = 000000000000003d
	ldx	[%i1+0x028],%l7		! %l7 = 95303980a5f1a9a2
!	Mem[0000000030181400] = cedd0f2329ece83e, %l5 = fffffffffffffdff
	ldxa	[%i6+%g0]0x89,%l5	! %l5 = cedd0f2329ece83e
!	Mem[0000000030081410] = 354f70e9, %l5 = cedd0f2329ece83e
	ldsba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000035
!	Mem[0000000010141410] = df3a9569, %l5 = 0000000000000035
	lduha	[%i5+%o5]0x80,%l5	! %l5 = 000000000000df3a
!	Mem[0000000010181408] = bd8426d4, %l3 = 000000002d220e53
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 00000000bd8426d4
!	Mem[0000000010001414] = ebdcf851, %f25 = 2e9bec6d
	lda	[%i0+0x014]%asi,%f25	! %f25 = ebdcf851
!	Mem[00000000211c0000] = d5ff622e, %l4 = 0000000000000038
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffd5ff
!	Mem[0000000010141404] = 167cfdb8, %l4 = ffffffffffffd5ff
	lduh	[%i5+0x006],%l4		! %l4 = 000000000000fdb8
!	Starting 10 instruction Store Burst
!	%l7 = 95303980a5f1a9a2, Mem[0000000010041400] = 7d005d61
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = a9a25d61

p0_label_10:
!	%f22 = 03b02e58 19e35666, %l0 = 0000000000006130
!	Mem[0000000010001428] = 3abe3d91183a0ab5
	add	%i0,0x028,%g1
	stda	%f22,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010001428] = 3abe3d91183a0ab5
!	%l0 = 0000000000006130, Mem[0000000010081438] = 516ab524, %asi = 80
	stwa	%l0,[%i2+0x038]%asi	! Mem[0000000010081438] = 00006130
!	%l7 = 95303980a5f1a9a2, Mem[0000000010141402] = 00000000
	sth	%l7,[%i5+0x002]		! Mem[0000000010141400] = 0000a9a2
!	%l5 = 000000000000df3a, Mem[0000000030181410] = 0000007c
	stha	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000df3a
!	Mem[0000000030181408] = efb5c107, %l7 = 95303980a5f1a9a2
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 000000ef000000ff
!	Mem[0000000010041408] = d8d112e2, %l3 = 00000000bd8426d4
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 000000d8000000ff
!	%l0 = 0000000000006130, Mem[0000000030141408] = ae43bda2
	stha	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = ae436130
!	%f2  = 02c854f0 38d54d89, Mem[0000000010001400] = 88a284ff b440e5a6
	stda	%f2 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 02c854f0 38d54d89
!	Mem[0000000030181410] = 0000df3a, %l5 = 000000000000df3a
	swapa	[%i6+%o5]0x89,%l5	! %l5 = 000000000000df3a
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = c7b24c12ba5f557a, %l6 = 0000000038000000
	ldxa	[%i4+%o4]0x89,%l6	! %l6 = c7b24c12ba5f557a

p0_label_11:
!	Mem[0000000010001400] = 02c854f0, %f1  = dde5afdd
	lda	[%i0+%g0]0x80,%f1 	! %f1 = 02c854f0
!	Mem[0000000030001410] = 6dec9b2e, %l3 = 00000000000000d8
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = 000000000000006d
!	Mem[000000001004141c] = 9f70a1f9, %l6 = c7b24c12ba5f557a
	lduha	[%i1+0x01e]%asi,%l6	! %l6 = 000000000000a1f9
!	Mem[0000000030181410] = 3adf0000, %l2 = d1862b88b49ffcaf
	lduha	[%i6+%o5]0x81,%l2	! %l2 = 0000000000003adf
!	Mem[0000000030041400] = 0d30de38, %l2 = 0000000000003adf
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = ffffffffffffde38
!	Mem[0000000030181400] = 3ee8ec29230fddce, %f20 = d8d112e2 49bec8ce
	ldda	[%i6+%g0]0x81,%f20	! %f20 = 3ee8ec29 230fddce
!	Mem[0000000020800040] = 61300345, %l4 = 000000000000fdb8
	ldsha	[%o1+0x040]%asi,%l4	! %l4 = 0000000000006130
	membar	#Sync			! Added by membar checker (2)
!	Mem[00000000100c1400] = d146b027 710a3b45 d8d112e2 49bec8ce
!	Mem[00000000100c1410] = ad68771a d0032ce2 00000000 2d220e53
!	Mem[00000000100c1420] = 6081bef2 86a0be79 3aefa7e1 adf9f778
!	Mem[00000000100c1430] = 9e93528b 9cd10952 9549ef5e fbc4b379
	ldda	[%i3]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[0000000030141410] = 4229bc42, %l2 = ffffffffffffde38
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000042
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = e5aaffcb, %l5 = 000000000000df3a
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 000000cb000000ff

p0_label_12:
!	%f10 = e7617a36 7b85f102, Mem[00000000300c1410] = 2b1f52a0 2e9bec6d
	stda	%f10,[%i3+%o5]0x81	! Mem[00000000300c1410] = e7617a36 7b85f102
!	%l4 = 0000000000006130, imm = 00000000000000bb, %l2 = 0000000000000042
	add	%l4,0x0bb,%l2		! %l2 = 00000000000061eb
!	%l4 = 0000000000006130, Mem[0000000030001400] = ffffaae5cd6de01a
	stxa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000006130
!	%f8  = fc90eb4e 80db160c, Mem[0000000010001400] = f054c802 894dd538
	stda	%f8 ,[%i0+%g0]0x88	! Mem[0000000010001400] = fc90eb4e 80db160c
!	Mem[0000000030041410] = 95f911c1, %l4 = 0000000000006130
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 00000095000000ff
!	%l6 = 0000a1f9, %l7 = 000000ef, Mem[0000000010041408] = e212d1ff 7d000000
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000a1f9 000000ef
!	Mem[0000000030101400] = da9674f8, %l0 = 0000000000006130
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000da9674f8
!	Mem[0000000010081408] = 01892ffe2bd3735d, %l1 = 00000000f04d6bad, %l4 = 0000000000000095
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = 01892ffe2bd3735d
!	Mem[0000000010041408] = f9a10000, %l2 = 00000000000061eb
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 00000000f9a10000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = fc90eb4e, %l4 = 01892ffe2bd3735d
	lduwa	[%i0+%o4]0x81,%l4	! %l4 = 00000000fc90eb4e

p0_label_13:
!	Mem[0000000030041400] = 38de300d, %f3  = 38d54d89
	lda	[%i1+%g0]0x81,%f3 	! %f3 = 38de300d
!	Mem[0000000020800000] = 61e468e7, %l6 = 000000000000a1f9
	ldsba	[%o1+0x001]%asi,%l6	! %l6 = ffffffffffffffe4
!	Mem[0000000030181408] = ffb5c107446c0b6a, %l0 = 00000000da9674f8
	ldxa	[%i6+%o4]0x81,%l0	! %l0 = ffb5c107446c0b6a
!	Mem[0000000010001434] = d8d112e2, %l5 = 00000000000000cb
	ldsba	[%i0+0x036]%asi,%l5	! %l5 = 0000000000000012
!	Mem[0000000010081408] = 01892ffe2bd3735d, %f2  = 02c854f0 38de300d
	ldda	[%i2+%o4]0x80,%f2 	! %f2  = 01892ffe 2bd3735d
!	Mem[0000000010081408] = 01892ffe, %l5 = 0000000000000012
	lduba	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000001
!	Mem[00000000300c1410] = 367a61e7, %l3 = 000000000000006d
	lduha	[%i3+%o5]0x89,%l3	! %l3 = 00000000000061e7
!	Mem[000000001010143c] = 2c49dfe5, %f13 = 167cfdb8
	lda	[%i4+0x03c]%asi,%f13	! %f13 = 2c49dfe5
!	Mem[0000000010001410] = 00000038, %l0 = ffb5c107446c0b6a
	ldsba	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000038
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000038, Mem[0000000030141400] = 42205d66e650bdc0
	stxa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000038

p0_label_14:
!	%l0 = 0000000000000038, Mem[0000000010001408] = ff06c7ea
	stha	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 0038c7ea
!	Mem[00000000300c1408] = 29ece8ff, %l0 = 0000000000000038
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%f2  = 01892ffe 2bd3735d, Mem[0000000010141408] = d8d112e2 49bec8ce
	stda	%f2 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 01892ffe 2bd3735d
!	Mem[000000001004143c] = b49ffcaf, %l1 = f04d6bad, %l4 = fc90eb4e
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000b49ffcaf
!	%f1  = 02c854f0, Mem[00000000300c1400] = e5aa557a
	sta	%f1 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 02c854f0
!	%l0 = 00000000000000ff, Mem[0000000030181410] = 3adf0000
	stha	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00ff0000
!	Mem[0000000010101408] = 22d90896, %l7 = 00000000000000ef
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 00000022000000ff
!	Mem[0000000010181400] = 7d4712a6, %l7 = 0000000000000022
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 0000007d000000ff
!	Mem[0000000030041410] = c111f9ff, %l2 = 00000000f9a10000
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 00000000c111f9ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 5cef78ea, %l0 = 00000000000000ff
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = 000000005cef78ea

p0_label_15:
!	Mem[0000000030181410] = 00ff0000, %l0 = 000000005cef78ea
	ldswa	[%i6+%o5]0x81,%l0	! %l0 = 0000000000ff0000
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010001400] = 0c16db80 4eeb90fc 0038c7ea f36ffe22
!	Mem[0000000010001410] = 38000000 ebdcf851 3c334bfa e5ec94b8
!	Mem[0000000010001420] = 043335ab 38d54d89 3abe3d91 183a0ab5
!	Mem[0000000010001430] = 14dcaef4 d8d112e2 fccaff57 35cd25d0
	ldda	[%i0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[0000000030181410] = 00ff0000c79a62b7, %l6 = ffffffffffffffe4
	ldxa	[%i6+%o5]0x81,%l6	! %l6 = 00ff0000c79a62b7
!	Mem[00000000100c1400] = d146b027, %l7 = 000000000000007d
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000d1
!	Mem[0000000030141408] = ae436130, %l5 = 0000000000000001
	ldsba	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000030
!	Mem[00000000201c0000] = 1212de6c, %l5 = 0000000000000030
	ldsb	[%o0+%g0],%l5		! %l5 = 0000000000000012
!	%l4 = 00000000b49ffcaf, %l7 = 00000000000000d1, %l4 = 00000000b49ffcaf
	subc	%l4,%l7,%l4		! %l4 = 00000000b49ffbde
!	Mem[0000000030081408] = 7126306c d654367c, %l2 = c111f9ff, %l3 = 000061e7
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000d654367c 000000007126306c
!	Mem[0000000010101410] = 19e35666 0e534f85, %l0 = 00ff0000, %l1 = f04d6bad
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 0000000019e35666 000000000e534f85
!	Starting 10 instruction Store Burst
!	%l1 = 000000000e534f85, Mem[00000000218000c0] = 4209afb8, %asi = 80
	stha	%l1,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 4f85afb8

p0_label_16:
!	Mem[00000000100c1407] = 710a3b45, %l3 = 000000007126306c
	ldstub	[%i3+0x007],%l3		! %l3 = 00000045000000ff
!	Mem[0000000030181408] = 07c1b5ff, %l2 = 00000000d654367c
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%f6  = 80ddcbc3, Mem[0000000010041408] = eb610000
	sta	%f6 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 80ddcbc3
!	Mem[0000000010141410] = df3a9569e95d0a0f, %l3 = 0000000000000045, %l3 = 0000000000000045
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = df3a9569e95d0a0f
!	%l7 = 00000000000000d1, Mem[0000000010041400] = a9a25d618c1a090d
	stxa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000000000d1
!	%l4 = b49ffbde, %l5 = 00000012, Mem[0000000030081400] = 00dfc5f1 58661a2c
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = b49ffbde 00000012
!	%l1 = 000000000e534f85, Mem[0000000030141400] = 00000000
	stha	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 4f850000
!	%l1 = 000000000e534f85, Mem[0000000010141420] = 0c8a24d1, %asi = 80
	stha	%l1,[%i5+0x020]%asi	! Mem[0000000010141420] = 4f8524d1
!	%l4 = 00000000b49ffbde, Mem[0000000010141410] = 69953adf
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 69953ade
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = f054c802, %l7 = 00000000000000d1
	ldsha	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffffc802

p0_label_17:
!	Mem[0000000010001410] = 51f8dceb 00000038, %l6 = c79a62b7, %l7 = ffffc802
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000038 0000000051f8dceb
!	Mem[0000000010181408] = bd8426d4, %l3 = df3a9569e95d0a0f
	lduwa	[%i6+0x008]%asi,%l3	! %l3 = 00000000bd8426d4
!	Mem[0000000030101400] = e7ffe70100006130, %l6 = 0000000000000038
	ldxa	[%i4+%g0]0x89,%l6	! %l6 = e7ffe70100006130
!	Mem[0000000030041400] = 0d30de38, %l1 = 000000000e534f85
	lduha	[%i1+%g0]0x89,%l1	! %l1 = 000000000000de38
!	Mem[0000000010041400] = 00000000, %l6 = e7ffe70100006130
	lduha	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = f054c802 b81fea02, %l6 = 00000000, %l7 = 51f8dceb
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000f054c802 00000000b81fea02
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 0000000019e35666
	setx	0x8088000ff4cc0202,%g7,%l0 ! %l0 = 8088000ff4cc0202
!	%l1 = 000000000000de38
	setx	0x7e31c1c803db520d,%g7,%l1 ! %l1 = 7e31c1c803db520d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8088000ff4cc0202
	setx	0xb0a8176f9c689843,%g7,%l0 ! %l0 = b0a8176f9c689843
!	%l1 = 7e31c1c803db520d
	setx	0x26173528052517cb,%g7,%l1 ! %l1 = 26173528052517cb
!	Mem[0000000010181410] = 5cef78ea18135046, %l3 = 00000000bd8426d4
	ldx	[%i6+%o5],%l3		! %l3 = 5cef78ea18135046
!	Mem[00000000100c1408] = d8d112e2, %l2 = 00000000000000ff
	lduha	[%i3+%o4]0x80,%l2	! %l2 = 000000000000d8d1
!	Starting 10 instruction Store Burst
!	Mem[0000000010101428] = 48fefd5cd5821887, %l2 = 000000000000d8d1, %l1 = 26173528052517cb
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 48fefd5cd5821887

p0_label_18:
!	%l3 = 5cef78ea18135046, Mem[0000000021800080] = ee02e4e3, %asi = 80
	stha	%l3,[%o3+0x080]%asi	! Mem[0000000021800080] = 5046e4e3
!	%l0 = 9c689843, %l1 = d5821887, Mem[0000000010101400] = f4f2ca28 b6cf7337
	stda	%l0,[%i4+0x000]%asi	! Mem[0000000010101400] = 9c689843 d5821887
!	%f31 = 57ffcafc, Mem[0000000010181408] = d42684bd
	sta	%f31,[%i6+%o4]0x88	! Mem[0000000010181408] = 57ffcafc
!	%l6 = 00000000f054c802, Mem[0000000010081410] = f62dfc4e
	stha	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = c802fc4e
!	%f4  = 95f911c1 a125a382, Mem[0000000010101410] = 6656e319 854f530e
	stda	%f4 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 95f911c1 a125a382
!	%l7 = 00000000b81fea02, Mem[0000000030141400] = 4f850000
	stba	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 02850000
!	Mem[0000000010101408] = ffd90896, %l1 = 48fefd5cd5821887
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030081408] = d654367c, %l7 = 00000000b81fea02
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 00000000d654367c
!	%l2 = 000000000000d8d1, Mem[0000000010181408] = 57ffcafc
	stwa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000d8d1
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 01892ffe 2bd3735d, %l4 = b49ffbde, %l5 = 00000012
	ldd	[%i5+%o4],%l4		! %l4 = 0000000001892ffe 000000002bd3735d

p0_label_19:
!	Mem[0000000030141400] = 0285000000000038, %f30 = d025cd35 57ffcafc
	ldda	[%i5+%g0]0x81,%f30	! %f30 = 02850000 00000038
!	Mem[0000000010041408] = c3cbdd80, %l7 = 00000000d654367c
	lduw	[%i1+%o4],%l7		! %l7 = 00000000c3cbdd80
!	Mem[0000000010101404] = d5821887, %f4  = 95f911c1
	ld	[%i4+0x004],%f4 	! %f4 = d5821887
!	Mem[0000000030141400] = 02850000, %l6 = 00000000f054c802
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000285
!	Mem[0000000010141410] = 69953ade, %l7 = 00000000c3cbdd80
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = 0000000069953ade
!	Mem[000000001008140c] = 2bd3735d, %f18 = 22fe6ff3
	ld	[%i2+0x00c],%f18	! %f18 = 2bd3735d
!	Mem[0000000010181400] = a61247ff, %l0 = b0a8176f9c689843
	ldswa	[%i6+%g0]0x88,%l0	! %l0 = ffffffffa61247ff
!	Mem[0000000030081408] = 02ea1fb86c302671, %l2 = 000000000000d8d1
	ldxa	[%i2+%o4]0x81,%l2	! %l2 = 02ea1fb86c302671
!	Mem[0000000030041400] = 38de300d, %l3 = 5cef78ea18135046
	ldsha	[%i1+%g0]0x81,%l3	! %l3 = 00000000000038de
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 01892ffe, %l7 = 0000000069953ade
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 00000001000000ff

p0_label_20:
!	%l0 = a61247ff, %l1 = 000000ff, Mem[0000000030041408] = f054c802 894dd538
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = a61247ff 000000ff
!	%l5 = 000000002bd3735d, Mem[0000000030181410] = 00ff0000
	stha	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 735d0000
	membar	#Sync			! Added by membar checker (4)
!	%f8  = fc90eb4e 80db160c, %l3 = 00000000000038de
!	Mem[0000000010001418] = 3c334bfae5ec94b8
	add	%i0,0x018,%g1
	stda	%f8,[%g1+%l3]ASI_PST32_P ! Mem[0000000010001418] = fc90eb4ee5ec94b8
!	%f1  = 02c854f0, Mem[0000000030001408] = 4eeb90fc
	sta	%f1 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 02c854f0
!	%f10 = e7617a36 7b85f102, Mem[0000000010081408] = fe2f8901 5d73d32b
	stda	%f10,[%i2+%o4]0x88	! Mem[0000000010081408] = e7617a36 7b85f102
!	%l2 = 02ea1fb86c302671, Mem[0000000010081400] = d938f4e8
	stwa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 6c302671
!	%l1 = 00000000000000ff, Mem[0000000030081410] = bcde0171e9704f35
	stxa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000000000ff
!	%f3  = 2bd3735d, Mem[0000000010001408] = eac73800
	sta	%f3 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 2bd3735d
!	%l4 = 0000000001892ffe, Mem[00000000100c1408] = d8d112e2
	stwa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 01892ffe
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 95f911c1a125a382, %f16 = fc90eb4e 80db160c
	ldda	[%i4+%o5]0x88,%f16	! %f16 = 95f911c1 a125a382

p0_label_21:
!	Code Fragment 3
p0_fragment_2:
!	%l0 = ffffffffa61247ff
	setx	0xf596c9900f9f800c,%g7,%l0 ! %l0 = f596c9900f9f800c
!	%l1 = 00000000000000ff
	setx	0x2ed4686fa41a6518,%g7,%l1 ! %l1 = 2ed4686fa41a6518
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f596c9900f9f800c
	setx	0x3dbc081079f682e6,%g7,%l0 ! %l0 = 3dbc081079f682e6
!	%l1 = 2ed4686fa41a6518
	setx	0xd370f3487847f4cd,%g7,%l1 ! %l1 = d370f3487847f4cd
!	Mem[0000000010001408] = 5d73d32b, %l7 = 0000000000000001
	ldswa	[%i0+%o4]0x80,%l7	! %l7 = 000000005d73d32b
!	%l0 = 3dbc081079f682e6, %l2 = 02ea1fb86c302671, %l0 = 3dbc081079f682e6
	sub	%l0,%l2,%l0		! %l0 = 3ad1e8580dc65c75
!	Mem[0000000010081410] = 4efc02c8, %f22 = b894ece5
	lda	[%i2+%o5]0x88,%f22	! %f22 = 4efc02c8
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010081400] = 7126306c ef7315dc 02f1857b 367a61e7
!	Mem[0000000010081410] = c802fc4e c98eff12 b21980c4 6fb71394
!	Mem[0000000010081420] = de1a96d2 4b7f7ac8 5fc6552c 1fe26fae
!	Mem[0000000010081430] = 1a1ec5fc 7178a96b 00006130 248e193a
	ldda	[%i2]ASI_BLK_AIUP,%f16	! Block Load from 0000000010081400
!	Mem[0000000010081410] = 4efc02c8, %l2 = 02ea1fb86c302671
	lduba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000c8
!	Mem[0000000010001410] = 00000038, %l1 = d370f3487847f4cd
	ldswa	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000038
!	Mem[0000000030041408] = a61247ff, %f7  = 614c11a0
	lda	[%i1+%o4]0x89,%f7 	! %f7 = a61247ff
!	Mem[0000000030001410] = 2e9bec6d, %l3 = 00000000000038de
	lduba	[%i0+%o5]0x89,%l3	! %l3 = 000000000000006d
!	Starting 10 instruction Store Burst
!	%f10 = e7617a36 7b85f102, %l7 = 000000005d73d32b
!	Mem[0000000030101430] = f39b705bc5ea0b71
	add	%i4,0x030,%g1
	stda	%f10,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030101430] = 02f1857b367a61e7

p0_label_22:
!	Mem[00000000300c1400] = 02c854f0, %l4 = 0000000001892ffe
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 000000f0000000ff
!	%l0 = 3ad1e8580dc65c75, %l2 = 00000000000000c8, %l6 = 0000000000000285
	add	%l0,%l2,%l6		! %l6 = 3ad1e8580dc65d3d
!	%f13 = 2c49dfe5, %f3  = 2bd3735d, %f4  = d5821887
	fdivs	%f13,%f3 ,%f4 		! %f4  = 3ff4680b
!	%f8  = fc90eb4e 80db160c, %l7 = 000000005d73d32b
!	Mem[00000000100c1428] = 3aefa7e1adf9f778
	add	%i3,0x028,%g1
	stda	%f8,[%g1+%l7]ASI_PST8_P ! Mem[00000000100c1428] = 3aefebe180f9160c
!	Mem[00000000201c0000] = 1212de6c, %l3 = 000000000000006d
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 00000012000000ff
!	Mem[0000000010181419] = 92ebc9a2, %l2 = 00000000000000c8
	ldstuba	[%i6+0x019]%asi,%l2	! %l2 = 000000eb000000ff
!	Mem[0000000030081400] = b49ffbde, %l6 = 3ad1e8580dc65d3d
	ldstuba	[%i2+%g0]0x89,%l6	! %l6 = 000000de000000ff
!	Mem[0000000010181428] = 093def7187824a0d, %l6 = 00000000000000de, %l6 = 00000000000000de
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 093def7187824a0d
!	%f10 = e7617a36, Mem[0000000030181408] = ffb5c107
	sta	%f10,[%i6+%o4]0x81	! Mem[0000000030181408] = e7617a36
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff3b0a7127b046d1, %l2 = 00000000000000eb
	ldxa	[%i3+%g0]0x88,%l2	! %l2 = ff3b0a7127b046d1

p0_label_23:
!	Mem[0000000020800000] = 61e468e7, %l4 = 00000000000000f0
	lduba	[%o1+0x001]%asi,%l4	! %l4 = 00000000000000e4
!	Mem[0000000010001400] = 80db160c, %l3 = 0000000000000012
	lduwa	[%i0+%g0]0x88,%l3	! %l3 = 0000000080db160c
!	Mem[0000000010101408] = ffd90896530e222d, %l3 = 0000000080db160c
	ldx	[%i4+%o4],%l3		! %l3 = ffd90896530e222d
!	%f3  = 2bd3735d, %f13 = 2c49dfe5, %f13 = 2c49dfe5
	fsubs	%f3 ,%f13,%f13		! %f13 = abc04c6d
!	%l4 = 00000000000000e4, immd = fffffffffffff965, %l3  = ffd90896530e222d
	mulx	%l4,-0x69b,%l3		! %l3 = fffffffffffa1df4
!	Mem[0000000030041408] = a61247ff, %l7 = 000000005d73d32b
	ldswa	[%i1+%o4]0x89,%l7	! %l7 = ffffffffa61247ff
!	Mem[0000000030181410] = 735d0000 c79a62b7, %l0 = 0dc65c75, %l1 = 00000038
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 00000000735d0000 00000000c79a62b7
!	Mem[0000000030141408] = 306143ae, %l5 = 000000002bd3735d
	lduwa	[%i5+%o4]0x81,%l5	! %l5 = 00000000306143ae
!	Mem[0000000030041410] = 0000a1f9 a125a382, %l0 = 735d0000, %l1 = c79a62b7
	ldda	[%i1+%o5]0x81,%l0	! %l0 = 000000000000a1f9 00000000a125a382
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000e4, Mem[0000000010141400] = 0000a9a2
	stba	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = e400a9a2

p0_label_24:
!	Mem[0000000010141420] = 4f8524d15b35b7b7, %l5 = 00000000306143ae, %l5 = 00000000306143ae
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = 4f8524d15b35b7b7
!	Mem[0000000010181420] = 7c5cdd057a555fba, %l1 = 00000000a125a382, %l0 = 000000000000a1f9
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 7c5cdd057a555fba
!	%f15 = 19e35666, Mem[0000000030181410] = 735d0000
	sta	%f15,[%i6+%o5]0x81	! Mem[0000000030181410] = 19e35666
!	%f0  = c2de300d, Mem[00000000100c1400] = d146b027
	sta	%f0 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = c2de300d
!	%l3 = fffffffffffa1df4, imm = 0000000000000ddd, %l1 = 00000000a125a382
	subc	%l3,0xddd,%l1		! %l1 = fffffffffffa1017
!	Mem[00000000201c0000] = ff12de6c, %l6 = 093def7187824a0d
	ldstub	[%o0+%g0],%l6		! %l6 = 000000ff000000ff
!	%l2 = ff3b0a7127b046d1, Mem[00000000300c1408] = ffe8ec29
	stwa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 27b046d1
!	Mem[0000000010101408] = ffd90896, %l4 = 00000000000000e4
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000ffd90896
!	%l5 = 4f8524d15b35b7b7, Mem[0000000030041400] = 38de300d
	stwa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 5b35b7b7
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = fe2f8901, %f6  = 80ddcbc3
	lda	[%i3+%o4]0x88,%f6 	! %f6 = fe2f8901

p0_label_25:
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030101400] = 30610000 01e7ffe7 7a555fba 124cb2c7
!	Mem[0000000030101410] = bcfafe6d ef7315dc 296a7add 5650f73a
!	Mem[0000000030101420] = be6494a6 0e14473c 7a77a4b4 9d9acf2d
!	Mem[0000000030101430] = 02f1857b 367a61e7 7bf46ccb 890d9fc6
	ldda	[%i4]ASI_BLK_AIUS,%f0	! Block Load from 0000000030101400
!	Mem[0000000030181400] = 3ee8ec29230fddce, %f16 = 7126306c ef7315dc
	ldda	[%i6+%g0]0x81,%f16	! %f16 = 3ee8ec29 230fddce
!	Mem[0000000010001400] = 0c16db80, %l6 = 00000000000000ff
	ldsba	[%i0+%g0]0x80,%l6	! %l6 = 000000000000000c
!	Mem[0000000030041400] = ddafe5dd b7b7355b, %l4 = ffd90896, %l5 = 5b35b7b7
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 00000000b7b7355b 00000000ddafe5dd
!	Mem[0000000030081408] = b81fea02, %l3 = fffffffffffa1df4
	lduwa	[%i2+%o4]0x89,%l3	! %l3 = 00000000b81fea02
!	Mem[0000000010081410] = c802fc4e c98eff12, %l4 = b7b7355b, %l5 = ddafe5dd
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 00000000c802fc4e 00000000c98eff12
!	Mem[0000000030141400] = 02850000, %l3 = 00000000b81fea02
	lduwa	[%i5+%g0]0x81,%l3	! %l3 = 0000000002850000
!	Mem[0000000010101408] = 000000e4, %l5 = 00000000c98eff12
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = 6dec9b2e, %l4 = 00000000c802fc4e
	ldsba	[%i0+%o5]0x81,%l4	! %l4 = 000000000000006d
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010181410] = ea78ef5c
	stha	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = ea780000

p0_label_26:
!	%l2 = ff3b0a7127b046d1, Mem[00000000211c0000] = d5ff622e, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 46d1622e
!	%f25 = 4b7f7ac8, %f17 = 230fddce
	fcmpes	%fcc1,%f25,%f17		! %fcc1 = 2
!	Mem[0000000010181410] = ea780000, %l4 = 000000000000006d
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f0  = 30610000 01e7ffe7 7a555fba 124cb2c7
!	%f4  = bcfafe6d ef7315dc 296a7add 5650f73a
!	%f8  = be6494a6 0e14473c 7a77a4b4 9d9acf2d
!	%f12 = 02f1857b 367a61e7 7bf46ccb 890d9fc6
	stda	%f0,[%i2]ASI_BLK_AIUS	! Block Store to 0000000030081400
!	%l5 = 0000000000000000, Mem[0000000010141400] = e400a9a2
	stha	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000a9a2
!	%f30 = 00006130, Mem[0000000010041424] = 4b6cafd5
	sta	%f30,[%i1+0x024]%asi	! Mem[0000000010041424] = 00006130
!	%l3 = 0000000002850000, Mem[0000000010101410] = a125a382
	stba	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = a125a300
!	Mem[0000000010001408] = 5d73d32b, %l3 = 0000000002850000
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 000000005d73d32b
!	%f16 = 3ee8ec29 230fddce 02f1857b 367a61e7
!	%f20 = c802fc4e c98eff12 b21980c4 6fb71394
!	%f24 = de1a96d2 4b7f7ac8 5fc6552c 1fe26fae
!	%f28 = 1a1ec5fc 7178a96b 00006130 248e193a
	stda	%f16,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = bcfafe6d, %l3 = 000000005d73d32b
	ldsha	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffbcfa

p0_label_27:
!	Mem[00000000100c1408] = 01892ffe, %l0 = 7c5cdd057a555fba
	ldsba	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000001
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010041434] = dd372ab3, %f6  = 296a7add
	lda	[%i1+0x034]%asi,%f6 	! %f6 = dd372ab3
!	Mem[0000000010101410] = 00a325a1c111f995, %l7 = ffffffffa61247ff
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = 00a325a1c111f995
!	Mem[00000000100c1410] = 1a7768ad, %l2 = ff3b0a7127b046d1
	lduba	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ad
!	Mem[00000000218001c0] = 3556f6ef, %l3 = ffffffffffffbcfa
	lduh	[%o3+0x1c0],%l3		! %l3 = 0000000000003556
!	Mem[0000000010101410] = 00a325a1, %l6 = 000000000000000c
	ldsha	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000a3
!	Mem[0000000030181408] = e7617a36, %l5 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l5	! %l5 = ffffffffe7617a36
!	Mem[0000000010081408] = 02f1857b, %f0  = 30610000
	lda	[%i2+%o4]0x80,%f0 	! %f0 = 02f1857b
!	Mem[0000000021800000] = ff787193, %l0 = 0000000000000001
	lduba	[%o3+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 29ece83e, %l1 = fffffffffffa1017
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 0000003e000000ff

p0_label_28:
!	Mem[0000000010181400] = ff4712a6, %l7 = 00a325a1c111f995
	ldswa	[%i6+%g0]0x80,%l7	! %l7 = ffffffffff4712a6
!	Mem[0000000010141400] = 0000a9a2, %l4 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001410] = 6dec9b2e, %l0 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 000000006dec9b2e
!	Mem[0000000010041408] = c3cbdd80, %l5 = ffffffffe7617a36
	ldswa	[%i1+0x008]%asi,%l5	! %l5 = ffffffffc3cbdd80
!	%f0  = 02f1857b, Mem[0000000010181410] = ff0078ea
	sta	%f0 ,[%i6+0x010]%asi	! Mem[0000000010181410] = 02f1857b
!	%l7 = ffffffffff4712a6, Mem[0000000010181408] = 0000d8d1
	stha	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 000012a6
!	%l5 = ffffffffc3cbdd80, Mem[0000000010081400] = 6c302671
	stba	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 6c302680
!	%f6  = dd372ab3, %f9  = 0e14473c
	fsqrts	%f6 ,%f9 		! %f9  = 7fffffff
!	%l5 = ffffffffc3cbdd80, Mem[0000000010081410] = 4efc02c8
	stha	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 4efcdd80
!	Starting 10 instruction Load Burst
!	Mem[0000000010081414] = c98eff12, %l5 = ffffffffc3cbdd80
	lduha	[%i2+0x014]%asi,%l5	! %l5 = 000000000000c98e

p0_label_29:
!	Mem[0000000010181408] = 8c29b7c2 000012a6, %l2 = 000000ad, %l3 = 00003556
	ldda	[%i6+%o4]0x88,%l2	! %l2 = 00000000000012a6 000000008c29b7c2
!	Mem[0000000010141408] = 5d73d32bfe2f89ff, %l7 = ffffffffff4712a6
	ldxa	[%i5+%o4]0x88,%l7	! %l7 = 5d73d32bfe2f89ff
!	Mem[00000000218001c0] = 3556f6ef, %l6 = 00000000000000a3
	lduha	[%o3+0x1c0]%asi,%l6	! %l6 = 0000000000003556
!	Mem[0000000010101400] = 871882d5 4398689c, %l2 = 000012a6, %l3 = 8c29b7c2
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 000000004398689c 00000000871882d5
!	Mem[0000000010101400] = 4398689c, %l5 = 000000000000c98e
	ldsba	[%i4+%g0]0x88,%l5	! %l5 = ffffffffffffff9c
!	%l6 = 0000000000003556, %l4 = 0000000000000000, %y  = 00000000
	sdiv	%l6,%l4,%l2		! Div by zero, %l0 = 000000006dec9b7e
	mov	%l0,%y			! %y = 6dec9b56
!	Mem[0000000030101408] = 7a555fba, %f2  = 7a555fba
	lda	[%i4+%o4]0x81,%f2 	! %f2 = 7a555fba
!	Mem[00000000211c0000] = 46d1622e, %l0 = 000000006dec9b56
	ldsb	[%o2+0x001],%l0		! %l0 = ffffffffffffffd1
!	Mem[00000000100c1400] = 0d30dec2, %l4 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000c2
!	Starting 10 instruction Store Burst
!	%l6 = 00003556, %l7 = fe2f89ff, Mem[00000000100c1410] = 1a7768ad e22c03d0
	stda	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00003556 fe2f89ff

p0_label_30:
!	%f0  = 02f1857b 01e7ffe7 7a555fba 124cb2c7
!	%f4  = bcfafe6d ef7315dc dd372ab3 5650f73a
!	%f8  = be6494a6 7fffffff 7a77a4b4 9d9acf2d
!	%f12 = 02f1857b 367a61e7 7bf46ccb 890d9fc6
	stda	%f0,[%i0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	Mem[0000000030041408] = 7b85f102, %l4 = 00000000000000c2
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 000000007b85f102
!	%f20 = c802fc4e, %f24 = de1a96d2
	fsqrts	%f20,%f24		! %f24 = 7fffffff
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010001400] = 02f1857b, %l3 = 00000000871882d5, %asi = 80
	swapa	[%i0+0x000]%asi,%l3	! %l3 = 0000000002f1857b
!	%l6 = 00003556, %l7 = fe2f89ff, Mem[0000000010041410] = d1599277 bc6d4ac0
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00003556 fe2f89ff
!	Mem[0000000010041418] = 8c1172299f70a1f9, %l3 = 0000000002f1857b, %l7 = 5d73d32bfe2f89ff
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = 8c1172299f70a1f9
!	%l2 = 4398689c, %l3 = 02f1857b, Mem[0000000010001420] = be6494a6 7fffffff
	stda	%l2,[%i0+0x020]%asi	! Mem[0000000010001420] = 4398689c 02f1857b
!	%f22 = b21980c4 6fb71394, %l6 = 0000000000003556
!	Mem[0000000010101428] = 48fefd5cd5821887
	add	%i4,0x028,%g1
	stda	%f22,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010101428] = 48fefd5cc48019b2
!	Mem[0000000010181408] = a6120000c2b7298c, %l1 = 000000000000003e, %l7 = 8c1172299f70a1f9
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = a6120000c2b7298c
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00006130, %l4 = 000000007b85f102
	lduha	[%i4+%g0]0x89,%l4	! %l4 = 0000000000006130

p0_label_31:
!	Mem[0000000030141400] = 00008502, %l2 = 000000004398689c
	ldsba	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000002
!	Mem[0000000030181408] = 367a61e7, %l2 = 0000000000000002
	ldsha	[%i6+%o4]0x89,%l2	! %l2 = 00000000000061e7
!	Mem[0000000030101400] = 00006130, %l5 = ffffffffffffff9c
	lduba	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000030
!	Mem[0000000030181408] = e7617a36, %l2 = 00000000000061e7
	ldsba	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffffffe7
!	Mem[00000000100c1420] = 6081bef2, %f17 = 230fddce
	ld	[%i3+0x020],%f17	! %f17 = 6081bef2
!	Mem[0000000030141410] = 4229bc420f129d3e, %l7 = a6120000c2b7298c
	ldxa	[%i5+%o5]0x81,%l7	! %l7 = 4229bc420f129d3e
!	%l0 = ffffffffffffffd1, immed = 00000d0a, %y  = 6dec9b56
	smul	%l0,0xd0a,%l0		! %l0 = fffffffffffd9b2a, %y = ffffffff
!	Mem[0000000030181410] = 6656e319, %l0 = fffffffffffd9b2a
	ldsba	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000019
!	Mem[0000000010141408] = fe2f89ff, %l2 = ffffffffffffffe7
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = fffffffffe2f89ff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000002f1857b, Mem[0000000030181408] = 367a61e7
	stba	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 367a617b

p0_label_32:
!	Mem[0000000020800041] = 61300345, %l4 = 0000000000006130
	ldstuba	[%o1+0x041]%asi,%l4	! %l4 = 00000030000000ff
!	%f10 = 7a77a4b4 9d9acf2d, %l2 = fffffffffe2f89ff
!	Mem[00000000100c1410] = 56350000ff892ffe
	add	%i3,0x010,%g1
	stda	%f10,[%g1+%l2]ASI_PST32_PL ! Mem[00000000100c1410] = 2dcf9a9db4a4777a
!	Mem[0000000030041408] = c2000000, %l5 = 0000000000000030
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 000000c2000000ff
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 0000000000000019
	setx	0x1f63b747d7908593,%g7,%l0 ! %l0 = 1f63b747d7908593
!	%l1 = 000000000000003e
	setx	0x578dfb5fd0dfd9ae,%g7,%l1 ! %l1 = 578dfb5fd0dfd9ae
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1f63b747d7908593
	setx	0x196462b839e72230,%g7,%l0 ! %l0 = 196462b839e72230
!	%l1 = 578dfb5fd0dfd9ae
	setx	0x01b868f05b888cb9,%g7,%l1 ! %l1 = 01b868f05b888cb9
!	%l0 = 196462b839e72230, Mem[0000000030101400] = 30610000
	stha	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 22300000
!	%l4 = 0000000000000030, Mem[0000000010081408] = 02f1857b367a61e7
	stxa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000030
!	Mem[00000000100c1424] = 86a0be79, %l5 = 000000c2, %l6 = 00003556
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l5,%l6	! %l6 = 0000000086a0be79
!	%f18 = 02f1857b, Mem[0000000010181408] = a6120000
	sta	%f18,[%i6+%o4]0x80	! Mem[0000000010181408] = 02f1857b
!	%l7 = 4229bc420f129d3e, Mem[00000000100c1400] = c2de300d
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0f129d3e
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 56350000ff892ffe, %l5 = 00000000000000c2
	ldxa	[%i1+0x010]%asi,%l5	! %l5 = 56350000ff892ffe

p0_label_33:
!	Mem[0000000010081408] = 00000000, %l5 = 56350000ff892ffe
	lduwa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = d100000000000000, %f8  = be6494a6 7fffffff
	ldda	[%i1+%g0]0x88,%f8 	! %f8  = d1000000 00000000
!	Mem[0000000030001408] = f054c80280db160c, %f26 = 5fc6552c 1fe26fae
	ldda	[%i0+%o4]0x81,%f26	! %f26 = f054c802 80db160c
!	Mem[0000000010081400] = 8026306c, %l4 = 0000000000000030
	lduwa	[%i2+%g0]0x80,%l4	! %l4 = 000000008026306c
!	Mem[0000000010081408] = 30000000 00000000, %l2 = fe2f89ff, %l3 = 02f1857b
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000 0000000030000000
!	Mem[0000000030141408] = 306143ae, %l0 = 196462b839e72230
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 0000000000003061
!	Mem[0000000030101410] = dc1573ef 6dfefabc, %l2 = 00000000, %l3 = 30000000
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 000000006dfefabc 00000000dc1573ef
!	%f14 = 7bf46ccb, %f11 = 9d9acf2d, %f18 = 02f1857b
	fadds	%f14,%f11,%f18		! %f18 = 7bf46ccb
!	Mem[00000000100c1400] = 3e9d120f, %f12 = 02f1857b
	lda	[%i3+%g0]0x88,%f12	! %f12 = 3e9d120f
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = bcfafe6d, %l6 = 0000000086a0be79
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000bcfafe6d

p0_label_34:
!	%l6 = 00000000bcfafe6d, Mem[0000000010081408] = 00000000
	stwa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = bcfafe6d
!	%l7 = 4229bc420f129d3e, Mem[0000000030101400] = 22300000
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 0f129d3e
!	%l6 = 00000000bcfafe6d, Mem[0000000010101400] = 9c689843
	stba	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 6d689843
!	%f19 = 367a61e7, Mem[0000000010181408] = 02f1857b
	sta	%f19,[%i6+%o4]0x80	! Mem[0000000010181408] = 367a61e7
!	%f6  = dd372ab3 5650f73a, %l5 = 0000000000000000
!	Mem[0000000010141428] = 3aefa7e1e05768f7
	add	%i5,0x028,%g1
	stda	%f6,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010141428] = 3aefa7e1e05768f7
!	%l4 = 000000008026306c, Mem[0000000030181410] = 6656e319
	stha	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 6656306c
!	%l3 = 00000000dc1573ef, Mem[0000000030001408] = f054c802
	stwa	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = dc1573ef
!	Mem[0000000030141400] = 00008502, %l4 = 000000008026306c
	ldstuba	[%i5+%g0]0x89,%l4	! %l4 = 00000002000000ff
!	%f8  = d1000000, Mem[00000000100c1408] = 01892ffe
	sta	%f8 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = d1000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 29ece83e, %l5 = 0000000000000000
	lduwa	[%i1+%g0]0x89,%l5	! %l5 = 0000000029ece83e

p0_label_35:
!	Mem[0000000010181400] = ff4712a6 de7ce6d5, %l6 = bcfafe6d, %l7 = 0f129d3e
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000ff4712a6 00000000de7ce6d5
!	Mem[0000000010041410] = 56350000, %l0 = 0000000000003061
	ldswa	[%i1+%o5]0x80,%l0	! %l0 = 0000000056350000
!	Mem[0000000020800000] = 61e468e7, %l4 = 0000000000000002
	ldsba	[%o1+0x001]%asi,%l4	! %l4 = ffffffffffffffe4
!	Mem[000000001008141c] = 6fb71394, %l3 = 00000000dc1573ef
	ldsha	[%i2+0x01e]%asi,%l3	! %l3 = 0000000000001394
!	Mem[0000000010181410] = 02f1857b, %l1 = 01b868f05b888cb9
	ldswa	[%i6+%o5]0x80,%l1	! %l1 = 0000000002f1857b
!	Mem[0000000010081400] = 8026306c, %l0 = 0000000056350000
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffff8026
!	Mem[0000000010101408] = 000000e4, %l1 = 0000000002f1857b
	ldub	[%i4+0x00a],%l1		! %l1 = 0000000000000000
!	Mem[0000000010041408] = c3cbdd80 ef000000, %l2 = 6dfefabc, %l3 = 00001394
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 00000000c3cbdd80 00000000ef000000
!	Mem[0000000010041400] = 00000000, %l2 = 00000000c3cbdd80
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f6  = dd372ab3 5650f73a, %l5 = 0000000029ece83e
!	Mem[0000000010101420] = 8c26381621df356d
	add	%i4,0x020,%g1
	stda	%f6,[%g1+%l5]ASI_PST16_P ! Mem[0000000010101420] = dd372ab35650356d

p0_label_36:
!	%l2 = 0000000000000000, Mem[000000001004141f] = 9f70a1f9, %asi = 80
	stba	%l2,[%i1+0x01f]%asi	! Mem[000000001004141c] = 9f70a100
!	Mem[0000000030081408] = 7a555fba, %l6 = 00000000ff4712a6
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 000000007a555fba
!	Mem[0000000030141410] = 42bc2942, %l3 = 00000000ef000000
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 00000042000000ff
!	Mem[0000000010041414] = ff892ffe, %l4 = ffffffffffffffe4
	ldstuba	[%i1+0x014]%asi,%l4	! %l4 = 000000ff000000ff
!	%l3 = 0000000000000042, Mem[0000000010181410] = 02f1857b
	stwa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000042
!	%l2 = 0000000000000000, Mem[0000000010041435] = dd372ab3
	stb	%l2,[%i1+0x035]		! Mem[0000000010041434] = dd002ab3
!	Mem[0000000010141437] = 73b719d1, %l3 = 0000000000000042
	ldstuba	[%i5+0x037]%asi,%l3	! %l3 = 000000d1000000ff
!	Mem[0000000010141400] = ff00a9a2, %l5 = 0000000029ece83e
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000030141400] = ff850000
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 29ece83e, %l6 = 000000007a555fba
	lduha	[%i1+%g0]0x89,%l6	! %l6 = 000000000000e83e

p0_label_37:
!	Mem[0000000010181400] = ff4712a6, %l3 = 00000000000000d1
	ldswa	[%i6+%g0]0x80,%l3	! %l3 = ffffffffff4712a6
!	Mem[00000000211c0000] = 46d1622e, %l2 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 00000000000046d1
!	Mem[0000000010081400] = 8026306c, %l6 = 000000000000e83e
	ldub	[%i2+%g0],%l6		! %l6 = 0000000000000080
!	%l5 = 00000000000000ff, imm = 0000000000000dd0, %l7 = 00000000de7ce6d5
	xnor	%l5,0xdd0,%l7		! %l7 = fffffffffffff2d0
!	Mem[0000000030181408] = 367a617b, %l4 = 00000000000000ff
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = 00000000367a617b
!	%l2 = 00000000000046d1, imm = 0000000000000a85, %l2 = 00000000000046d1
	addc	%l2,0xa85,%l2		! %l2 = 0000000000005156
!	Mem[00000000100c1430] = 9e93528b 9cd10952, %l0 = ffff8026, %l1 = 00000000
	ldda	[%i3+0x030]%asi,%l0	! %l0 = 000000009e93528b 000000009cd10952
!	Mem[0000000010181408] = e7617a36, %l4 = 00000000367a617b
	ldsba	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000036
!	Mem[0000000030141408] = 421a1126ae436130, %f22 = b21980c4 6fb71394
	ldda	[%i5+%o4]0x89,%f22	! %f22 = 421a1126 ae436130
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = bcfafe6d, %l2 = 0000000000005156
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 000000bc000000ff

p0_label_38:
!	Mem[0000000030101408] = 7a555fba, %l5 = 00000000000000ff
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 000000007a555fba
!	Mem[0000000030001410] = 000000ff, %l1 = 000000009cd10952
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%f14 = 7bf46ccb 890d9fc6, Mem[00000000300c1408] = 27b046d1 230fddce
	stda	%f14,[%i3+%o4]0x81	! Mem[00000000300c1408] = 7bf46ccb 890d9fc6
!	%f10 = 7a77a4b4 9d9acf2d, Mem[0000000030001408] = dc1573ef 80db160c
	stda	%f10,[%i0+%o4]0x81	! Mem[0000000030001408] = 7a77a4b4 9d9acf2d
!	%l2 = 000000bc, %l3 = ff4712a6, Mem[0000000010141410] = de3a9569 e95d0a0f
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000bc ff4712a6
!	%f24 = 7fffffff 4b7f7ac8, Mem[0000000010101410] = a125a300 95f911c1
	stda	%f24,[%i4+%o5]0x88	! Mem[0000000010101410] = 7fffffff 4b7f7ac8
!	%l4 = 00000036, %l5 = 7a555fba, Mem[0000000010181430] = 87cbb125 b0e638f6
	std	%l4,[%i6+0x030]		! Mem[0000000010181430] = 00000036 7a555fba
!	%l1 = 00000000000000ff, Mem[0000000030181410] = 6c305666
	stha	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 00ff5666
!	%f20 = c802fc4e c98eff12, Mem[0000000010141408] = ff892ffe 2bd3735d
	stda	%f20,[%i5+%o4]0x80	! Mem[0000000010141408] = c802fc4e c98eff12
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000000080, immed = 00000723, %y  = ffffffff
	smul	%l6,0x723,%l7		! %l7 = 0000000000039180, %y = 00000000

p0_label_39:
!	Mem[0000000010101400] = 6d689843, %l3 = ffffffffff4712a6
	ldsha	[%i4+%g0]0x80,%l3	! %l3 = 0000000000006d68
!	Mem[00000000300c1400] = ff54c802, %l2 = 00000000000000bc
	lduba	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181408] = 367a61e7, %f3  = 124cb2c7
	lda	[%i6+%o4]0x80,%f3 	! %f3 = 367a61e7
!	Mem[0000000030041410] = c802fc4e, %l4 = 0000000000000036
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 000000000000c802
!	Mem[0000000010041420] = fc14b011, %l6 = 0000000000000080
	ldsba	[%i1+0x020]%asi,%l6	! %l6 = fffffffffffffffc
!	Mem[0000000010041410] = 56350000, %l1 = 00000000000000ff
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = 0000000056350000
!	Mem[00000000100c1408] = 000000d1, %l2 = 00000000000000ff
	ldswa	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000d1
!	Mem[00000000100c1410] = 9d9acf2d, %l1 = 0000000056350000
	lduha	[%i3+%o5]0x88,%l1	! %l1 = 000000000000cf2d
!	Mem[00000000300c1400] = ff54c802, %l5 = 000000007a555fba
	lduba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = fffffffffffffffc, Mem[0000000010001400] = 871882d501e7ffe7
	stxa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = fffffffffffffffc

p0_label_40:
!	%l1 = 000000000000cf2d, Mem[0000000010101408] = 000000e4
	stba	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 2d0000e4
!	%f6  = dd372ab3 5650f73a, Mem[0000000010041408] = c3cbdd80 ef000000
	stda	%f6 ,[%i1+0x008]%asi	! Mem[0000000010041408] = dd372ab3 5650f73a
!	Mem[0000000010101420] = dd372ab3, %l6 = fffffffffffffffc
	ldstuba	[%i4+0x020]%asi,%l6	! %l6 = 000000dd000000ff
!	%f23 = ae436130, %f7  = 5650f73a
	fsqrts	%f23,%f7 		! %f7  = 7fffffff
!	%l4 = 0000c802, %l5 = 000000ff, Mem[0000000030141408] = 306143ae 26111a42
	stda	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000c802 000000ff
!	Mem[0000000030101400] = 3e9d120f, %l6 = 00000000000000dd
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 000000003e9d120f
!	Mem[0000000030181408] = 7b617a36, %l4 = 000000000000c802
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 000000007b617a36
!	%f16 = 3ee8ec29, Mem[0000000010041434] = dd002ab3
	st	%f16,[%i1+0x034]	! Mem[0000000010041434] = 3ee8ec29
!	Mem[0000000030141410] = 42bc29ff, %l4 = 000000007b617a36
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	%f19 = 367a61e7, %f17 = 6081bef2, %f3  = 367a61e7
	fadds	%f19,%f17,%f3 		! %f3  = 6081bef2

p0_label_41:
!	Mem[0000000030101400] = dd000000, %l2 = 00000000000000d1
	ldsha	[%i4+%g0]0x81,%l2	! %l2 = ffffffffffffdd00
!	Mem[0000000010141410] = a61247ff bc000000, %l0 = 9e93528b, %l1 = 0000cf2d
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 00000000bc000000 00000000a61247ff
!	Mem[0000000030041408] = 000000ff, %l0 = 00000000bc000000
	ldsha	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = 8026306cef7315dc, %f28 = 1a1ec5fc 7178a96b
	ldda	[%i2+%g0]0x80,%f28	! %f28 = 8026306c ef7315dc
!	Mem[0000000010041408] = dd372ab3, %f15 = 890d9fc6
	lda	[%i1+%o4]0x80,%f15	! %f15 = dd372ab3
!	Mem[0000000030141408] = ff00000002c80000, %f0  = 02f1857b 01e7ffe7
	ldda	[%i5+%o4]0x89,%f0 	! %f0  = ff000000 02c80000
!	Mem[0000000030041410] = c802fc4ec98eff12, %f8  = d1000000 00000000
	ldda	[%i1+%o5]0x81,%f8 	! %f8  = c802fc4e c98eff12
!	Mem[0000000030181408] = 0000c802, %l3 = 0000000000006d68
	ldswa	[%i6+%o4]0x81,%l3	! %l3 = 000000000000c802
!	Mem[00000000100c1400] = ff3b0a713e9d120f, %f4  = bcfafe6d ef7315dc
	ldda	[%i3+%g0]0x88,%f4 	! %f4  = ff3b0a71 3e9d120f
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffdd00, Mem[0000000010041418] = 8c117229, %asi = 80
	stwa	%l2,[%i1+0x018]%asi	! Mem[0000000010041418] = ffffdd00

p0_label_42:
!	Mem[00000000201c0001] = ff12de6c, %l7 = 0000000000039180
	ldstub	[%o0+0x001],%l7		! %l7 = 00000012000000ff
!	Mem[0000000030141408] = 0000c802, %l2 = ffffffffffffdd00
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = 0f129d3e, %l3 = 000000000000c802
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 000000000f129d3e
!	%l4 = 00000000000000ff, Mem[0000000030181408] = 02c80000
	stba	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 02c800ff
!	%f12 = 3e9d120f, %f0  = ff000000, %f14 = 7bf46ccb
	fdivs	%f12,%f0 ,%f14		! %l0 = 0000000000000121, Unfinished, %fsr = 0200000000
!	%f0  = ff000000 02c80000 7a555fba 6081bef2
!	%f4  = ff3b0a71 3e9d120f dd372ab3 7fffffff
!	%f8  = c802fc4e c98eff12 7a77a4b4 9d9acf2d
!	%f12 = 3e9d120f 367a61e7 7bf46ccb dd372ab3
	stda	%f0,[%i4]ASI_BLK_AIUPL	! Block Store to 0000000010101400
!	%l4 = 00000000000000ff, %l7 = 0000000000000012, %l3 = 000000000f129d3e
	orn	%l4,%l7,%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030181400] = 29ece8ff, %l4 = 00000000000000ff
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 0000000029ece8ff
!	Mem[0000000030141400] = 00ff0000, %l4 = 0000000029ece8ff
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 0000000000ff0000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff54c802, %l6 = 000000003e9d120f
	ldsha	[%i3+%g0]0x81,%l6	! %l6 = ffffffffffffff54

p0_label_43:
!	Mem[0000000010001408] = 7a555fba, %l4 = 0000000000ff0000
	lduba	[%i0+%o4]0x80,%l4	! %l4 = 000000000000007a
!	Mem[0000000010041410] = 56350000ff892ffe, %f22 = 421a1126 ae436130
	ldda	[%i1+%o5]0x80,%f22	! %f22 = 56350000 ff892ffe
!	Mem[00000000100c1404] = 710a3bff, %l2 = 0000000000000000
	lduh	[%i3+0x004],%l2		! %l2 = 000000000000710a
!	Mem[0000000030081408] = ff4712a6124cb2c7, %l7 = 0000000000000012
	ldxa	[%i2+%o4]0x81,%l7	! %l7 = ff4712a6124cb2c7
!	Mem[0000000010181400] = d5e67cdea61247ff, %l3 = ffffffffffffffff
	ldxa	[%i6+%g0]0x88,%l3	! %l3 = d5e67cdea61247ff
!	Mem[00000000100c1410] = 7a77a4b49d9acf2d, %f26 = f054c802 80db160c
	ldda	[%i3+%o5]0x88,%f26	! %f26 = 7a77a4b4 9d9acf2d
!	Mem[00000000201c0000] = ffffde6c, %l6 = ffffffffffffff54
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041408] = dd372ab3, %l7 = ff4712a6124cb2c7
	ldsha	[%i1+%o4]0x80,%l7	! %l7 = ffffffffffffdd37
!	%l5 = 00000000000000ff, %l3 = d5e67cdea61247ff, %l5 = 00000000000000ff
	orn	%l5,%l3,%l5		! %l5 = 2a19832159edb8ff
!	Starting 10 instruction Store Burst
!	%f21 = c98eff12, Mem[0000000010141400] = ff00a9a2
	sta	%f21,[%i5+%g0]0x80	! Mem[0000000010141400] = c98eff12

p0_label_44:
!	Mem[00000000100c1428] = 3aefebe1, %l6 = ffffffffffffffff, %asi = 80
	swapa	[%i3+0x028]%asi,%l6	! %l6 = 000000003aefebe1
!	Mem[000000001018142b] = 093def71, %l1 = 00000000a61247ff
	ldstuba	[%i6+0x02b]%asi,%l1	! %l1 = 00000071000000ff
!	%f21 = c98eff12, %f23 = ff892ffe
	fcmps	%fcc0,%f21,%f23		! %fcc0 = 3
!	Mem[00000000100c141c] = 2d220e53, %l4 = 000000000000007a
	swap	[%i3+0x01c],%l4		! %l4 = 000000002d220e53
!	%f0  = ff000000 02c80000 7a555fba 6081bef2
!	%f4  = ff3b0a71 3e9d120f dd372ab3 7fffffff
!	%f8  = c802fc4e c98eff12 7a77a4b4 9d9acf2d
!	%f12 = 3e9d120f 367a61e7 7bf46ccb dd372ab3
	stda	%f0,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
!	Mem[0000000030041410] = 4efc02c8, %l2 = 000000000000710a
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 000000c8000000ff
!	%l3 = d5e67cdea61247ff, Mem[0000000010181414] = 18135046, %asi = 80
	stwa	%l3,[%i6+0x014]%asi	! Mem[0000000010181414] = a61247ff
!	Mem[000000001008143c] = 248e193a, %l1 = 0000000000000071
	swap	[%i2+0x03c],%l1		! %l1 = 00000000248e193a
!	%l0 = 0000000000000121, Mem[00000000300c1408] = 7bf46ccb890d9fc6
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000121
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 000000bc, %l5 = 2a19832159edb8ff
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_45:
!	Mem[00000000100c1408] = d1000000, %l1 = 00000000248e193a
	ldsha	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffffd100
!	Mem[0000000010081400] = dc1573ef 6c302680, %l2 = 000000c8, %l3 = a61247ff
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 000000006c302680 00000000dc1573ef
!	Mem[0000000010141400] = b8fd7c1612ff8ec9, %l1 = ffffffffffffd100
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = b8fd7c1612ff8ec9
!	Mem[0000000010081408] = 6dfefabc00000030, %f28 = 8026306c ef7315dc
	ldda	[%i2+0x008]%asi,%f28	! %f28 = 6dfefabc 00000030
!	Mem[0000000010001400] = ffffffff, %f23 = ff892ffe
	ld	[%i0+%g0],%f23	! %f23 = ffffffff
!	Mem[0000000010081410] = 4efcdd80, %l1 = b8fd7c1612ff8ec9
	lduha	[%i2+%o5]0x88,%l1	! %l1 = 000000000000dd80
!	Mem[0000000010041400] = 00000000, %l2 = 000000006c302680
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l4 = 000000002d220e53
	lduha	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l1 = 000000000000dd80
	lduba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = 7fffffff 4b7f7ac8, %l0 = 0000000000000121
!	Mem[00000000300c1408] = 0000000000000121
	add	%i3,0x008,%g1
	stda	%f24,[%g1+%l0]ASI_PST8_SL ! Mem[00000000300c1408] = c800000000ff0121

p0_label_46:
!	Mem[00000000100c141c] = 0000007a, %l1 = 0000000000000000
	ldstub	[%i3+0x01c],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030081410] = fffafe6d, %l5 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 00000000fffafe6d
!	Mem[00000000100c1400] = 0000c802, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 000000000000c802
!	%l2 = 000000000000c802, Mem[0000000010081408] = 30000000bcfafe6d
	stxa	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000000000c802
!	%l2 = 0000c802, %l3 = dc1573ef, Mem[0000000030001400] = 00000000 00006130
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000c802 dc1573ef
!	%f26 = 7a77a4b4 9d9acf2d, %l2 = 000000000000c802
!	Mem[00000000300c1420] = 0cad1a8716f9d277
	add	%i3,0x020,%g1
	stda	%f26,[%g1+%l2]ASI_PST8_SL ! Mem[00000000300c1420] = 0ccf1a8716f9d277
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010181416] = a61247ff, %l4 = 0000000000000000
	ldstub	[%i6+0x016],%l4		! %l4 = 00000047000000ff
!	%f0  = ff000000, Mem[00000000300c1400] = ff54c802
	sta	%f0 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000
!	Mem[0000000030141408] = 02c800ff, %l0 = 0000000000000121
	lduha	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 000000d1, %l5 = 00000000fffafe6d
	lduba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000d1

p0_label_47:
!	Mem[00000000100c1408] = d1000000, %l1 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l1	! %l1 = 00000000d1000000
!	Mem[00000000100c1410] = 2dcf9a9d, %l4 = 0000000000000047
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 0000000000002dcf
!	%f11 = 9d9acf2d, %f12 = 3e9d120f, %f18 = 7bf46ccb
	fadds	%f11,%f12,%f18		! %f18 = 3e9d120f
!	Mem[0000000010041400] = 00000000, %l3 = 00000000dc1573ef
	ldswa	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = a61247ff, %f28 = 6dfefabc
	lda	[%i6+%g0]0x88,%f28	! %f28 = a61247ff
!	Mem[0000000030181408] = ba5f557a, %l7 = ffffffffffffdd37
	lduba	[%i6+%o4]0x89,%l7	! %l7 = 000000000000007a
!	Mem[00000000211c0000] = 46d1622e, %l0 = 00000000000000ff
	ldub	[%o2+0x001],%l0		! %l0 = 00000000000000d1
!	Mem[00000000300c1408] = c8000000, %l2 = 000000000000c802
	ldswa	[%i3+%o4]0x81,%l2	! %l2 = ffffffffc8000000
!	Mem[00000000100c1408] = d1000000, %f29 = 00000030
	lda	[%i3+%o4]0x80,%f29	! %f29 = d1000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101412] = 0f129d3e, %l5 = 00000000000000d1
	ldstub	[%i4+0x012],%l5		! %l5 = 0000009d000000ff

p0_label_48:
!	%l5 = 000000000000009d, Mem[00000000100c1426] = 86a0be79
	sth	%l5,[%i3+0x026]		! Mem[00000000100c1424] = 86a0009d
!	Mem[00000000300c1410] = 367a61e7, %l7 = 000000000000007a
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 000000e7000000ff
!	%l4 = 0000000000002dcf, Mem[000000001000143d] = 890d9fc6
	stb	%l4,[%i0+0x03d]		! Mem[000000001000143c] = 89cf9fc6
!	Mem[0000000010101424] = 4efc02c8, %l7 = 00000000000000e7, %asi = 80
	swapa	[%i4+0x024]%asi,%l7	! %l7 = 000000004efc02c8
!	Mem[0000000010041400] = 00000000, %l4 = 0000000000002dcf, %asi = 80
	swapa	[%i1+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 000000bc, %l5 = 000000000000009d
	swap	[%i5+%o5],%l5		! %l5 = 00000000000000bc
!	Mem[00000000300c1408] = 000000c8, %l2 = ffffffffc8000000
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 000000c8000000ff
!	Mem[0000000030001400] = 02c80000, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l4	! %l4 = 0000000002c80000
!	Mem[00000000300c1408] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000ff, %f22 = 56350000
	lda	[%i3+%o4]0x89,%f22	! %f22 = 000000ff

p0_label_49:
!	Mem[0000000030041400] = 3ee8ec29, %l1 = 00000000d1000000
	lduha	[%i1+%g0]0x81,%l1	! %l1 = 0000000000003ee8
!	Mem[0000000010141410] = 0000009d, %l4 = 0000000002c80000
	lduwa	[%i5+%o5]0x80,%l4	! %l4 = 000000000000009d
!	Mem[0000000010141410] = 9d000000, %l0 = 00000000000000d1
	lduba	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l6 = 000000003aefebe1
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[00000000100c1410] = 9d9acf2d, %f14 = 7bf46ccb
	lda	[%i3+%o5]0x88,%f14	! %f14 = 9d9acf2d
!	Mem[0000000010001400] = ffffffff, %l6 = 00000000ff000000
	ldswa	[%i0+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101400] = 0000c802, %l1 = 0000000000003ee8
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = dd000000, %l7 = 000000004efc02c8
	ldsha	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffdd00
!	Mem[0000000010141430] = 03835268 73b719ff, %l6 = ffffffff, %l7 = ffffdd00
	ldda	[%i5+0x030]%asi,%l6	! %l6 = 0000000003835268 0000000073b719ff
!	Starting 10 instruction Store Burst
!	%l2 = 000000c8, %l3 = 000000ff, Mem[0000000010081410] = 4efcdd80 12ff8ec9
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000c8 000000ff

p0_label_50:
!	Mem[0000000030081400] = 00006130, %l4 = 000000000000009d
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 0000000000006130
!	Mem[0000000030041410] = 4efc02ff, %l3 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%f29 = d1000000, Mem[0000000010041438] = d1862b88
	st	%f29,[%i1+0x038]	! Mem[0000000010041438] = d1000000
!	Mem[0000000010001400] = ffffffff, %l4 = 0000000000006130
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000100c143f] = fbc4b379, %l5 = 00000000000000bc
	ldstuba	[%i3+0x03f]%asi,%l5	! %l5 = 00000079000000ff
!	%l2 = 00000000000000c8, immed = 00000a63, %y  = 00000000
	umul	%l2,0xa63,%l0		! %l0 = 0000000000081d58, %y = 00000000
!	Mem[0000000010181408] = 367a61e7, %l2 = 00000000000000c8
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000367a61e7
!	Mem[0000000030081410] = 00000000, %l7 = 0000000073b719ff
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%f24 = 7fffffff, Mem[0000000010101400] = 0000c802
	sta	%f24,[%i4+%g0]0x80	! Mem[0000000010101400] = 7fffffff
!	Starting 10 instruction Load Burst
!	%f17 = 6081bef2, %f10 = 7a77a4b4, %f9  = c98eff12
	fmuls	%f17,%f10,%f9 		! %f9  = 7f800000

p0_label_51:
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000030081400] = 9d000000 01e7ffe7 ff4712a6 124cb2c7
!	Mem[0000000030081410] = 73b719ff ef7315dc 296a7add 5650f73a
!	Mem[0000000030081420] = be6494a6 0e14473c 7a77a4b4 9d9acf2d
!	Mem[0000000030081430] = 02f1857b 367a61e7 7bf46ccb 890d9fc6
	ldda	[%i2]ASI_BLK_SL,%f16	! Block Load from 0000000030081400
!	Mem[00000000300c1410] = 367a61ff, %l3 = 00000000000000ff
	ldsba	[%i3+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141410] = 0000009d, %l1 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = 000000000000009d
!	Mem[0000000010141408] = c802fc4e, %l0 = 0000000000081d58
	lduwa	[%i5+%o4]0x80,%l0	! %l0 = 00000000c802fc4e
!	Mem[00000000100c1430] = 9e93528b9cd10952, %f12 = 3e9d120f 367a61e7
	ldd	[%i3+0x030],%f12	! %f12 = 9e93528b 9cd10952
!	Mem[0000000030101400] = 000000dd, %f5  = 3e9d120f
	lda	[%i4+%g0]0x89,%f5 	! %f5 = 000000dd
!	Mem[0000000030081410] = 73b719ff, %l3 = ffffffffffffffff
	lduha	[%i2+%o5]0x81,%l3	! %l3 = 00000000000073b7
!	Mem[00000000300c1400] = 000000ff, %l0 = 00000000c802fc4e
	lduwa	[%i3+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001400] = ffffffff, %l6 = 0000000003835268
	ldsba	[%i0+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffffff, Mem[0000000010041408] = dd372ab3
	stwa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffff

p0_label_52:
!	%l2 = 367a61e7, %l3 = 000073b7, Mem[0000000010141408] = c802fc4e c98eff12
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 367a61e7 000073b7
!	%l3 = 00000000000073b7, Mem[00000000201c0000] = ffffde6c, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 73b7de6c
!	Mem[0000000030001400] = 00000000, %l3 = 00000000000073b7
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 0000009d, %l2 = 00000000367a61e7
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 000000000000009d
!	%l3 = 0000000000000000, Mem[0000000030001400] = 000073b7
	stwa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[0000000030081410] = 73b719ff, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 00000073000000ff
!	%l4 = 00000000000000ff, Mem[0000000010141400] = c98eff12
	stwa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff
!	Mem[0000000010141410] = 367a61e7, %l5 = 0000000000000079, %asi = 80
	swapa	[%i5+0x010]%asi,%l5	! %l5 = 00000000367a61e7
!	%f7  = 7fffffff, Mem[0000000010081408] = 0000c802
	sta	%f7 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 7fffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 367a61ff, %l0 = 00000000000000ff
	lduwa	[%i3+%o5]0x89,%l0	! %l0 = 00000000367a61ff

p0_label_53:
!	Mem[0000000020800040] = 61ff0345, %l5 = 00000000367a61e7
	lduha	[%o1+0x040]%asi,%l5	! %l5 = 00000000000061ff
!	Mem[0000000030141400] = 38000000ffe8ec29, %f12 = 9e93528b 9cd10952
	ldda	[%i5+%g0]0x89,%f12	! %f12 = 38000000 ffe8ec29
!	%l2 = 000000000000009d, Mem[0000000010141420] = 4f8524d1
	stw	%l2,[%i5+0x020]		! Mem[0000000010141420] = 0000009d
!	Mem[0000000010141408] = 367a61e7, %l4 = 00000000000000ff
	lduha	[%i5+%o4]0x80,%l4	! %l4 = 000000000000367a
!	Mem[0000000010081400] = 6c302680, %l2 = 000000000000009d
	ldsba	[%i2+%g0]0x88,%l2	! %l2 = ffffffffffffff80
!	Mem[0000000030181410] = ff3b0a71, %l7 = 0000000000000000
	lduwa	[%i6+%o5]0x81,%l7	! %l7 = 00000000ff3b0a71
!	Mem[00000000100c1408] = d1000000, %l6 = ffffffffffffffff
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = ffffffffffffd100
!	Mem[00000000201c0000] = 73b7de6c, %l5 = 00000000000061ff
	ldsb	[%o0+0x001],%l5		! %l5 = ffffffffffffffb7
!	Mem[0000000030181400] = ff000000 02c80000 7a555fba 6081bef2
!	Mem[0000000030181410] = ff3b0a71 3e9d120f dd372ab3 7fffffff
!	Mem[0000000030181420] = c802fc4e c98eff12 7a77a4b4 9d9acf2d
!	Mem[0000000030181430] = 3e9d120f 367a61e7 7bf46ccb dd372ab3
	ldda	[%i6]ASI_BLK_AIUS,%f0	! Block Load from 0000000030181400
!	Starting 10 instruction Store Burst
!	Mem[0000000010081413] = c8000000, %l3 = 0000000000000073
	ldstub	[%i2+0x013],%l3		! %l3 = 00000000000000ff

p0_label_54:
!	%l4 = 000000000000367a, Mem[00000000100c1428] = ffffffff80f9160c, %asi = 80
	stxa	%l4,[%i3+0x028]%asi	! Mem[00000000100c1428] = 000000000000367a
!	Mem[0000000010181400] = ff4712a6, %l0 = 00000000367a61ff
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 00000000ff4712a6
!	Mem[0000000030181408] = ba5f557a, %l6 = ffffffffffffd100
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 00000000ba5f557a
!	%f30 = c69f0d89 cb6cf47b, Mem[0000000010001410] = 6dfefabc dc1573ef
	stda	%f30,[%i0+%o5]0x88	! Mem[0000000010001410] = c69f0d89 cb6cf47b
!	%l2 = ffffff80, %l3 = 00000000, Mem[0000000030001408] = b4a4777a 2dcf9a9d
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffff80 00000000
!	%f0  = ff000000 02c80000 7a555fba 6081bef2
!	%f4  = ff3b0a71 3e9d120f dd372ab3 7fffffff
!	%f8  = c802fc4e c98eff12 7a77a4b4 9d9acf2d
!	%f12 = 3e9d120f 367a61e7 7bf46ccb dd372ab3
	stda	%f0,[%i1]ASI_BLK_P	! Block Store to 0000000010041400
!	%l5 = ffffffffffffffb7, Mem[0000000010101400] = 7fffffff
	stwa	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffb7
!	Mem[0000000030081400] = 0000009d, %l2 = ffffffffffffff80
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 0000009d000000ff
!	Mem[0000000030101400] = 000000dd, %l0 = 00000000ff4712a6
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000dd
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffffd100, %f28 = e7617a36
	lda	[%i6+%o4]0x89,%f28	! %f28 = ffffd100

p0_label_55:
!	Mem[00000000100c1408] = d100000049bec8ce, %f24 = 3c47140e a69464be
	ldda	[%i3+%o4]0x80,%f24	! %f24 = d1000000 49bec8ce
!	Mem[0000000030081400] = 000000ff, %l5 = ffffffffffffffb7
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000021800000] = ff787193, %l3 = 0000000000000000
	ldsb	[%o3+%g0],%l3		! %l3 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010041408] = f2be8160ba5f557a, %f18 = c7b24c12 a61247ff
	ldda	[%i1+%o4]0x88,%f18	! %f18 = f2be8160 ba5f557a
!	Mem[0000000030001400] = 00000000 dc1573ef 80ffffff 00000000
!	Mem[0000000030001410] = 9cd10952 a0521f2b dc687efe 9e34a28f
!	Mem[0000000030001420] = 1f44758d 0c75d9b9 a673e23e 891d7ef6
!	Mem[0000000030001430] = e1dd814d e0de13fb 6fd3ffde 02cfc061
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000030181408] = ffffd100, %l5 = ffffffffffffffff
	lduwa	[%i6+%o4]0x89,%l5	! %l5 = 00000000ffffd100
!	Mem[00000000300c1408] = 000000ff, %l2 = 000000000000009d
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000 710a3bff d1000000 49bec8ce
!	Mem[00000000100c1410] = 2dcf9a9d b4a4777a 00000000 ff00007a
!	Mem[00000000100c1420] = 6081bef2 86a0009d 00000000 0000367a
!	Mem[00000000100c1430] = 9e93528b 9cd10952 9549ef5e fbc4b3ff
	ldda	[%i3]ASI_BLK_AIUP,%f0	! Block Load from 00000000100c1400
!	Mem[0000000010081400] = 8026306cef7315dc, %l2 = 00000000000000ff
	ldxa	[%i2+%g0]0x80,%l2	! %l2 = 8026306cef7315dc
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, %l5 = 00000000ffffd100, %l1 = 000000000000009d
	xnor	%l3,%l5,%l1		! %l1 = 00000000ffffd100

p0_label_56:
!	%f20 = 9cd10952 a0521f2b, %l0 = 00000000000000dd
!	Mem[0000000030181428] = 7a77a4b49d9acf2d
	add	%i6,0x028,%g1
	stda	%f20,[%g1+%l0]ASI_PST8_S ! Mem[0000000030181428] = 9cd1a452a052cf2b
!	%l0 = 000000dd, %l1 = ffffd100, Mem[0000000010181400] = ff617a36 d5e67cde
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000dd ffffd100
	membar	#Sync			! Added by membar checker (12)
!	%l4 = 000000000000367a, Mem[0000000030001408] = ffffff80
	stha	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = ffff367a
!	Mem[0000000030141408] = ff00c802, %l0 = 00000000000000dd
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 00000000ff00c802
!	Mem[0000000010081400] = 8026306c, %l5 = 00000000ffffd100
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 000000008026306c
!	%l7 = 00000000ff3b0a71, Mem[00000000100c1408] = d1000000
	stwa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff3b0a71
!	%l0 = 00000000ff00c802, Mem[00000000300c1410] = 367a61ff
	stha	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 367ac802
!	%l6 = 00000000ba5f557a, Mem[0000000010081410] = c80000ff
	stwa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = ba5f557a
!	%l7 = 00000000ff3b0a71, Mem[0000000010181428] = 093defff87824a0d
	stx	%l7,[%i6+0x028]		! Mem[0000000010181428] = 00000000ff3b0a71
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ffe8ec29, %l2 = 8026306cef7315dc
	ldswa	[%i5+%g0]0x89,%l2	! %l2 = ffffffffffe8ec29

p0_label_57:
!	Mem[0000000030001408] = 7a36ffff, %l0 = 00000000ff00c802
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = 000000007a36ffff
!	Mem[00000000211c0000] = 46d1622e, %l7 = 00000000ff3b0a71
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000046d1
!	Mem[00000000100c1410] = 2dcf9a9db4a4777a, %f12 = 9e93528b 9cd10952
	ldda	[%i3+%o5]0x80,%f12	! %f12 = 2dcf9a9d b4a4777a
!	Mem[0000000010001400] = ffffffff, %l6 = 00000000ba5f557a
	lduha	[%i0+%g0]0x88,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030041400] = 3ee8ec29230fddce, %l3 = ffffffffffffffff
	ldxa	[%i1+%g0]0x81,%l3	! %l3 = 3ee8ec29230fddce
!	Mem[0000000010181408] = c8000000, %l2 = ffffffffffe8ec29
	lduba	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 00000000710a3bff, %f24 = 1f44758d 0c75d9b9
	ldda	[%i3+%g0]0x80,%f24	! %f24 = 00000000 710a3bff
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000000046d1
	ldswa	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = c7b24c12 ba5f557a, %l4 = 0000367a, %l5 = 8026306c
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 00000000ba5f557a 00000000c7b24c12
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000042, %l4 = 00000000ba5f557a
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000042

p0_label_58:
!	%l4 = 00000042, %l5 = c7b24c12, Mem[0000000010041428] = 7a77a4b4 9d9acf2d
	stda	%l4,[%i1+0x028]%asi	! Mem[0000000010041428] = 00000042 c7b24c12
!	Mem[00000000100c140c] = 49bec8ce, %l2 = 00000000, %l1 = ffffd100
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 0000000049bec8ce
!	Mem[0000000010001400] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l3 = 3ee8ec29230fddce, immd = 0000000000000fcb, %l5 = 00000000c7b24c12
	sdivx	%l3,0xfcb,%l5		! %l5 = 0003fbc0b0dc09de
!	%l7 = 0000000000000000, Mem[0000000010041414] = 3e9d120f
	stw	%l7,[%i1+0x014]		! Mem[0000000010041414] = 00000000
!	%l7 = 0000000000000000, Mem[0000000030141400] = 29ece8ff
	stha	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000e8ff
!	%l3 = 3ee8ec29230fddce, imm = 000000000000032b, %l0 = 000000007a36ffff
	addc	%l3,0x32b,%l0		! %l0 = 3ee8ec29230fe0f9
!	Mem[0000000010181410] = 7a555fba, %l1 = 0000000049bec8ce
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 000000ba000000ff
!	%l6 = 000000000000ffff, immed = 00000e09, %y  = 00000000
	sdiv	%l6,0xe09,%l6		! %l6 = 0000000000000012
	mov	%l0,%y			! %y = 230fe0f9
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000 7fffffff, %l6 = 00000012, %l7 = 00000000
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 000000007fffffff 0000000000000000

p0_label_59:
!	Mem[0000000010101410] = 3eff120f, %f28 = e1dd814d
	lda	[%i4+%o5]0x88,%f28	! %f28 = 3eff120f
!	Mem[0000000010081408] = ffffff7f, %l4 = 0000000000000042
	lduba	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1414] = b4a4777a, %l2 = 00000000000000ff
	ldsb	[%i3+0x014],%l2		! %l2 = ffffffffffffffb4
!	Mem[0000000030181408] = 00d1ffff, %l3 = 3ee8ec29230fddce
	lduwa	[%i6+%o4]0x81,%l3	! %l3 = 0000000000d1ffff
!	Mem[0000000010001400] = fcffffffffffffff, %l1 = 00000000000000ba
	ldxa	[%i0+%g0]0x88,%l1	! %l1 = fcffffffffffffff
!	Mem[0000000010141410] = 00000079, %l5 = 0003fbc0b0dc09de
	ldswa	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000079
!	Mem[0000000010001410] = 7bf46ccb, %f8  = 6081bef2
	lda	[%i0+%o5]0x80,%f8 	! %f8 = 7bf46ccb
!	Mem[00000000300c1408] = 000000ff, %l1 = fcffffffffffffff
	ldsha	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l2 = ffffffffffffffb4
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f18 = 80ffffff 00000000, Mem[0000000030141410] = 42bc29ff 3e9d120f
	stda	%f18,[%i5+%o5]0x89	! Mem[0000000030141410] = 80ffffff 00000000

p0_label_60:
!	%l1 = 00000000000000ff, Mem[0000000010181408] = c8000000
	stwa	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	%l7 = 0000000000000000, Mem[0000000010081408] = ffffff7f
	stha	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000ff7f
!	%f13 = b4a4777a, Mem[0000000010041408] = 7a555fba
	sta	%f13,[%i1+%o4]0x80	! Mem[0000000010041408] = b4a4777a
!	Mem[000000001004143c] = dd372ab3, %l1 = 000000ff, %l3 = 00d1ffff
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 00000000dd372ab3
!	Mem[00000000211c0000] = 46d1622e, %l7 = 0000000000000000
	ldstub	[%o2+%g0],%l7		! %l7 = 00000046000000ff
!	%l4 = 00000000000000ff, immed = 00000069, %y  = 230fe0f9
	udiv	%l4,0x069,%l1		! %l1 = 00000000ffffffff
	mov	%l0,%y			! %y = 230fe0f9
!	Mem[0000000021800040] = b2866a20, %l0 = 3ee8ec29230fe0f9
	ldstuba	[%o3+0x040]%asi,%l0	! %l0 = 000000b2000000ff
!	%f0  = 00000000 710a3bff d1000000 49bec8ce
!	%f4  = 2dcf9a9d b4a4777a 00000000 ff00007a
!	%f8  = 7bf46ccb 86a0009d 00000000 0000367a
!	%f12 = 2dcf9a9d b4a4777a 9549ef5e fbc4b3ff
	stda	%f0,[%i5]ASI_BLK_PL	! Block Store to 0000000010141400
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 00000000000000b2
	setx	0x508d247063b84221,%g7,%l0 ! %l0 = 508d247063b84221
!	%l1 = 00000000ffffffff
	setx	0x9e679577884a8f0f,%g7,%l1 ! %l1 = 9e679577884a8f0f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 508d247063b84221
	setx	0x6d82bd3860dc6e57,%g7,%l0 ! %l0 = 6d82bd3860dc6e57
!	%l1 = 9e679577884a8f0f
	setx	0x9b066f4fb76d90f0,%g7,%l1 ! %l1 = 9b066f4fb76d90f0
!	Starting 10 instruction Load Burst
!	%l1 = 9b066f4fb76d90f0, %l2 = 0000000000000000, %y  = 230fe0f9
	sdiv	%l1,%l2,%l5		! Div by zero, %l0 = 6d82bd3860dc6ea7
	mov	%l0,%y			! %y = 60dc6e7f

p0_label_61:
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000010141410] = 7a77a4b4, %l6 = 000000007fffffff
	lduha	[%i5+%o5]0x80,%l6	! %l6 = 0000000000007a77
!	Mem[0000000010001410] = cb6cf47b, %l7 = 0000000000000046
	lduha	[%i0+%o5]0x88,%l7	! %l7 = 000000000000f47b
!	Mem[0000000021800080] = 5046e4e3, %l5 = 0000000000000079
	lduh	[%o3+0x080],%l5		! %l5 = 0000000000005046
!	Mem[0000000030141400] = ffe80000, %l0 = 6d82bd3860dc6e7f
	lduba	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 0000e8ff, %l4 = 00000000000000ff
	lduba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000218000c0] = 4f85afb8, %l1 = 9b066f4fb76d90f0
	lduha	[%o3+0x0c0]%asi,%l1	! %l1 = 0000000000004f85
!	Mem[00000000100c1410] = 9d9acf2d, %l4 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 0000002d000000ff
!	Mem[0000000020800040] = 61ff0345, %l6 = 0000000000007a77
	ldsba	[%o1+0x041]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081410] = ba5f557a, %f25 = 710a3bff
	lda	[%i2+%o5]0x80,%f25	! %f25 = ba5f557a
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000f47b, Mem[0000000030101408] = ff000000
	stwa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000f47b

p0_label_62:
!	Mem[00000000300c1408] = ff000000, %l7 = 000000000000f47b
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l6 = ffffffff, %l7 = 000000ff, Mem[0000000030041410] = 4efc02ff 12ff8ec9
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffff 000000ff
!	%l2 = 0000000000000000, Mem[0000000010041400] = 000000ff
	stwa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Mem[0000000010001400] = ffffffff, %l5 = 0000000000005046
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	%f26 = a673e23e 891d7ef6, Mem[0000000010181410] = ff5f557a a612ffff
	std	%f26,[%i6+%o5]	! Mem[0000000010181410] = a673e23e 891d7ef6
!	Mem[0000000030101408] = 7bf40000, %l5 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 0000007b000000ff
!	Mem[0000000010181437] = 7a555fba, %l0 = 0000000000000000
	ldstub	[%i6+0x037],%l0		! %l0 = 000000ba000000ff
!	%l4 = 0000002d, %l5 = 0000007b, Mem[0000000010001410] = cb6cf47b c69f0d89
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000002d 0000007b
!	%l2 = 0000000000000000, Mem[00000000100c142c] = 0000367a, %asi = 80
	stba	%l2,[%i3+0x02c]%asi	! Mem[00000000100c142c] = 0000367a
!	Starting 10 instruction Load Burst
!	Mem[0000000010081428] = 5fc6552c 1fe26fae, %l4 = 0000002d, %l5 = 0000007b
	ldda	[%i2+0x028]%asi,%l4	! %l4 = 000000005fc6552c 000000001fe26fae

p0_label_63:
!	%l5 = 000000001fe26fae, Mem[0000000030001400] = 00000000
	stba	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ae
!	Mem[0000000030141400] = 0000e8ff, %l0 = 00000000000000ba
	lduha	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 00d1ffff, %f10 = 00000000
	lda	[%i2+%g0]0x88,%f10	! %f10 = 00d1ffff
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000030041400] = 3ee8ec29 230fddce ff000000 367a61e7
!	Mem[0000000030041410] = ffffffff ff000000 b21980c4 6fb71394
!	Mem[0000000030041420] = de1a96d2 4b7f7ac8 5fc6552c 1fe26fae
!	Mem[0000000030041430] = 1a1ec5fc 7178a96b 00006130 248e193a
	ldda	[%i1]ASI_BLK_AIUS,%f16	! Block Load from 0000000030041400
!	Mem[00000000201c0000] = 73b7de6c, %l0 = 0000000000000000
	ldub	[%o0+0x001],%l0		! %l0 = 00000000000000b7
!	Mem[0000000010141408] = 49bec8ce, %l5 = 000000001fe26fae
	ldsba	[%i5+%o4]0x88,%l5	! %l5 = ffffffffffffffce
!	Mem[0000000010081400] = dc1573ef00d1ffff, %l3 = 00000000dd372ab3
	ldxa	[%i2+%g0]0x88,%l3	! %l3 = dc1573ef00d1ffff
!	Mem[0000000030001408] = 7a36ffff00000000, %f2  = d1000000 49bec8ce
	ldda	[%i0+%o4]0x81,%f2 	! %f2  = 7a36ffff 00000000
!	Mem[0000000010081410] = ba5f557aff000000, %f8  = 7bf46ccb 86a0009d
	ldda	[%i2+%o5]0x80,%f8 	! %f8  = ba5f557a ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 0000002d, %l0 = 00000000000000b7
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 0000002d000000ff

p0_label_64:
!	Mem[0000000010001408] = 7a555fba, %l6 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 0000007a000000ff
!	%f6  = 00000000, Mem[0000000010141408] = 49bec8ce
	sta	%f6 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Mem[00000000100c1408] = 710a3bff, %l3 = dc1573ef00d1ffff
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%f8  = ba5f557a ff000000, Mem[0000000030101408] = 0000f4ff c7b24c12
	stda	%f8 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ba5f557a ff000000
!	%l7 = 00000000000000ff, imm = fffffffffffffa82, %l7 = 00000000000000ff
	xor	%l7,-0x57e,%l7		! %l7 = fffffffffffffa7d
!	Mem[0000000030101408] = 000000ff, %l7 = fffffffffffffa7d
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c143c] = fbc4b3ff, %l6 = 0000007a, %l7 = 000000ff
	add	%i3,0x3c,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 00000000fbc4b3ff
!	%l4 = 000000005fc6552c, %l1 = 0000000000004f85, %l0 = 000000000000002d
	xor	%l4,%l1,%l0		! %l0 = 000000005fc61aa9
!	%l7 = 00000000fbc4b3ff, Mem[0000000010181410] = a673e23e
	stwa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = fbc4b3ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 02c87a36, %l2 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000002

p0_label_65:
!	Mem[00000000300c1410] = 02c87a36, %l3 = 00000000000000ff
	lduwa	[%i3+%o5]0x81,%l3	! %l3 = 0000000002c87a36
!	Mem[00000000300c1410] = 02c87a367b85f102, %f0  = 00000000 710a3bff
	ldda	[%i3+%o5]0x81,%f0 	! %f0  = 02c87a36 7b85f102
!	Mem[0000000030081400] = 000000ff, %l1 = 0000000000004f85
	lduwa	[%i2+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041408] = ff000000, %f12 = 2dcf9a9d
	lda	[%i1+%o4]0x81,%f12	! %f12 = ff000000
!	Mem[0000000030141400] = 0000e8ff00000038, %f0  = 02c87a36 7b85f102
	ldda	[%i5+%g0]0x81,%f0 	! %f0  = 0000e8ff 00000038
!	Mem[0000000010101400] = b7ffffff, %l4 = 000000005fc6552c
	ldsba	[%i4+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141408] = dd000000, %f9  = ff000000
	lda	[%i5+%o4]0x89,%f9 	! %f9 = dd000000
!	Mem[00000000300c1410] = 02c87a36, %l4 = ffffffffffffffff
	lduha	[%i3+%o5]0x81,%l4	! %l4 = 00000000000002c8
!	Mem[0000000010081400] = ffffd100, %f8  = ba5f557a
	lda	[%i2+%g0]0x80,%f8 	! %f8 = ffffd100
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 7a77a4b4, %l3 = 0000000002c87a36
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 000000007a77a4b4

p0_label_66:
!	Mem[0000000030081410] = ff19b7ff, %l5 = ffffffffffffffce
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010081400] = ffffd100, %l5 = 00000000000000ff
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%f3  = 00000000, Mem[0000000010001410] = 000000ff
	sta	%f3 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	%l2 = 0000000000000002, Mem[0000000010141400] = 00000000710a3bff
	stxa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000002
!	%l2 = 0000000000000002, Mem[00000000300c1400] = 02ea1fb8000000ff
	stxa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000002
!	%l3 = 000000007a77a4b4, Mem[00000000100c1439] = 9549ef5e, %asi = 80
	stba	%l3,[%i3+0x039]%asi	! Mem[00000000100c1438] = 95b4ef5e
!	Mem[0000000010181400] = 000000dd, %l4 = 00000000000002c8
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 000000dd000000ff
!	Mem[0000000030101410] = 86a0be79, %l2 = 0000000000000002
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 00000086000000ff
!	Mem[0000000010041409] = b4a4777a, %l3 = 000000007a77a4b4
	ldstuba	[%i1+0x009]%asi,%l3	! %l3 = 000000a4000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 7a555fba, %l3 = 00000000000000a4
	ldswa	[%i2+%o5]0x88,%l3	! %l3 = 000000007a555fba

p0_label_67:
!	Mem[0000000030101400] = ff4712a6, %l0 = 000000005fc61aa9
	ldsha	[%i4+%g0]0x89,%l0	! %l0 = 00000000000012a6
!	Mem[0000000030001410] = 9cd10952, %l3 = 000000007a555fba
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 0000000000009cd1
!	Mem[0000000010081408] = 000000007fff0000, %f24 = de1a96d2 4b7f7ac8
	ldda	[%i2+%o4]0x88,%f24	! %f24 = 00000000 7fff0000
!	Mem[0000000030101400] = a61247ff, %f31 = 248e193a
	lda	[%i4+%g0]0x81,%f31	! %f31 = a61247ff
!	Mem[0000000030081408] = c7b24c12 a61247ff, %l0 = 000012a6, %l1 = 000000ff
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 00000000a61247ff 00000000c7b24c12
!	Mem[00000000100c1408] = cec8be49 710a3bff, %l0 = a61247ff, %l1 = c7b24c12
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 00000000710a3bff 00000000cec8be49
!	%l1 = 00000000cec8be49, %l0 = 00000000710a3bff, %l4 = 00000000000000dd
	sdivx	%l1,%l0,%l4		! %l4 = 0000000000000001
!	Mem[00000000100c1400] = ff3b0a7100000000, %f16 = 3ee8ec29 230fddce
	ldda	[%i3+%g0]0x88,%f16	! %f16 = ff3b0a71 00000000
!	%l5 = 00000000000000ff, imm = fffffffffffffd35, %l6 = 000000000000007a
	subc	%l5,-0x2cb,%l6		! %l6 = 00000000000003ca
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000009cd1, Mem[0000000030101408] = fffffa7d
	stba	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = d1fffa7d

p0_label_68:
!	%l5 = 00000000000000ff, Mem[0000000030001400] = ae000000
	stba	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = ff000000
!	%l4 = 0000000000000001, Mem[0000000030181410] = ff3b0a71
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 013b0a71
!	%f3  = 00000000, %f28 = 1a1ec5fc, %f0  = 0000e8ff
	fadds	%f3 ,%f28,%f0 		! %f0  = 1a1ec5fc
!	Mem[0000000010001400] = ffffffff, %l4 = 0000000000000001
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010181408] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000010081408] = 0000ff7f, %asi = 80
	stwa	%l4,[%i2+0x008]%asi	! Mem[0000000010081408] = 000000ff
!	Mem[0000000010081410] = ba5f557a, %l0 = 00000000710a3bff
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 000000ba000000ff
!	Mem[0000000010181400] = ff000000, %l7 = 00000000fbc4b3ff
	swapa	[%i6+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	%f6  = 00000000 ff00007a, Mem[0000000010001410] = 00000000 7b000000
	stda	%f6 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 ff00007a
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000009cd1
	ldsha	[%i5+%o4]0x80,%l3	! %l3 = 0000000000000000

p0_label_69:
!	Mem[0000000030001408] = 7a36ffff, %l4 = 00000000000000ff
	ldswa	[%i0+%o4]0x81,%l4	! %l4 = 000000007a36ffff
!	Mem[0000000010141410] = 02c87a36 9d9acf2d, %l2 = 00000086, %l3 = 00000000
	ldda	[%i5+0x010]%asi,%l2	! %l2 = 0000000002c87a36 000000009d9acf2d
!	Mem[00000000300c1400] = 0200000000000000, %f30 = 00006130 a61247ff
	ldda	[%i3+%g0]0x81,%f30	! %f30 = 02000000 00000000
!	Mem[00000000300c1408] = 000000ff, %l5 = 00000000000000ff
	lduha	[%i3+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[000000001008141c] = 6fb71394, %l6 = 00000000000003ca
	ldsb	[%i2+0x01d],%l6		! %l6 = ffffffffffffffb7
!	%f31 = 00000000, %f15 = fbc4b3ff, %f24 = 00000000 7fff0000
	fsmuld	%f31,%f15,%f24		! %f24 = 80000000 00000000
!	Mem[0000000010181400] = fbc4b3ff, %l3 = 000000009d9acf2d
	lduha	[%i6+%g0]0x80,%l3	! %l3 = 000000000000fbc4
!	Mem[0000000030081408] = ff4712a6, %l4 = 000000007a36ffff
	ldsha	[%i2+%o4]0x81,%l4	! %l4 = ffffffffffffff47
!	Mem[0000000010141408] = d100000000000000, %f14 = 9549ef5e fbc4b3ff
	ldda	[%i5+%o4]0x88,%f14	! %f14 = d1000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 7a555fff, %l2 = 0000000002c87a36
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 000000007a555fff

p0_label_70:
!	%f3  = 00000000, Mem[0000000010101408] = 6081bef2
	sta	%f3 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%f15 = 00000000, %f31 = 00000000, %f14 = d1000000 00000000
	fsmuld	%f15,%f31,%f14		! %f14 = 00000000 00000000
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000ff000000
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l3 = 000000000000fbc4, Mem[0000000010001408] = ff555fba
	stwa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000fbc4
!	%l2 = 000000007a555fff, Mem[0000000010141410] = 367ac802
	stba	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 367ac8ff
!	%f0  = 1a1ec5fc 00000038, %l4 = ffffffffffffff47
!	Mem[0000000010041438] = 7bf46ccbdd372ab3
	add	%i1,0x038,%g1
	stda	%f0,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010041438] = 38000000fcc51e1a
!	%f15 = 00000000, Mem[000000001014143c] = 5eef4995
	sta	%f15,[%i5+0x03c]%asi	! Mem[000000001014143c] = 00000000
!	Mem[0000000010181417] = 891d7ef6, %l1 = 00000000cec8be49
	ldstuba	[%i6+0x017]%asi,%l1	! %l1 = 000000f6000000ff
!	%l0 = 00000000000000ba, Mem[0000000030001410] = 9cd10952a0521f2b
	stxa	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000000000ba
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffb719ff, %l1 = 00000000000000f6
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 000000000000ffb7

p0_label_71:
!	Mem[00000000300c1400] = 00000002, %l3 = 000000000000fbc4
	ldsha	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000002
!	Mem[0000000010001408] = c7b24c12 c4fb0000, %l4 = ffffff47, %l5 = 000000ff
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 00000000c4fb0000 00000000c7b24c12
!	Mem[0000000020800040] = 61ff0345, %l1 = 000000000000ffb7
	lduba	[%o1+0x041]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101400] = ff4712a6, %l1 = 00000000000000ff
	ldsha	[%i4+%g0]0x89,%l1	! %l1 = 00000000000012a6
!	Mem[0000000010101410] = 0f12ff3e 710a3bff, %l0 = 000000ba, %l1 = 000012a6
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 000000000f12ff3e 00000000710a3bff
!	Mem[0000000030081408] = c7b24c12a61247ff, %f20 = ffffffff ff000000
	ldda	[%i2+%o4]0x89,%f20	! %f20 = c7b24c12 a61247ff
!	Mem[0000000030101408] = 7dfaffd1, %l7 = 0000000000000000
	lduha	[%i4+%o4]0x89,%l7	! %l7 = 000000000000ffd1
!	Mem[00000000300c1400] = 02000000, %l1 = 00000000710a3bff
	lduha	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000200
!	%f17 = 00000000, %f6  = 00000000
	fcmpes	%fcc2,%f17,%f6 		! %fcc2 = 0
!	Starting 10 instruction Store Burst
!	%f6  = 00000000 ff00007a, Mem[0000000010181400] = ffb3c4fb ffffd100
	stda	%f6 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 ff00007a

p0_label_72:
!	Mem[0000000030001408] = 7a36ffff, %l0 = 000000000f12ff3e
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 0000007a000000ff
!	%l6 = ffffffffffffffb7, Mem[0000000030101410] = ffa0be79
	stha	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = ffb7be79
!	%l4 = 00000000c4fb0000, Mem[0000000030141400] = 0000e8ff
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000e8ff
!	%f24 = 80000000 00000000, Mem[0000000010041410] = 710a3bff 00000000
	stda	%f24,[%i1+%o5]0x88	! Mem[0000000010041410] = 80000000 00000000
!	Mem[0000000030101400] = a61247ff01e7ffe7, %f14 = 00000000 00000000
	ldda	[%i4+%g0]0x81,%f14	! %f14 = a61247ff 01e7ffe7
!	Mem[0000000030081410] = ff19b7ff, %l4 = 00000000c4fb0000
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%l6 = ffffffb7, %l7 = 0000ffd1, Mem[00000000300c1410] = 367ac802 02f1857b
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffb7 0000ffd1
!	%f18 = ff000000 367a61e7, %l4 = 00000000000000ff
!	Mem[0000000010041438] = 38000000fcc51e1a
	add	%i1,0x038,%g1
	stda	%f18,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010041438] = e7617a36000000ff
!	%f18 = ff000000 367a61e7, %l5 = 00000000c7b24c12
!	Mem[0000000010181438] = 567787ff772db599
	add	%i6,0x038,%g1
	stda	%f18,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010181438] = 567787ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0000e8ff, %l0 = 000000000000007a
	lduha	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_73:
!	Mem[0000000010181410] = fbc4b3ff 891d7eff, %l4 = 000000ff, %l5 = c7b24c12
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 00000000fbc4b3ff 00000000891d7eff
!	Mem[00000000211c0000] = ffd1622e, %l0 = 0000000000000000
	ldub	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[00000000211c0000] = ffd1622e, %l3 = 0000000000000002
	lduba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141430] = 7a77a4b4 9d9acf2d, %l6 = ffffffb7, %l7 = 0000ffd1
	ldd	[%i5+0x030],%l6		! %l6 = 000000007a77a4b4 000000009d9acf2d
!	Mem[0000000010181410] = ff7e1d89ffb3c4fb, %f8  = ffffd100 dd000000
	ldda	[%i6+%o5]0x88,%f8 	! %f8  = ff7e1d89 ffb3c4fb
!	Mem[0000000010001408] = 0000fbc4, %l0 = 00000000000000ff
	ldsha	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 0000000000000002, %f26 = 5fc6552c 1fe26fae
	ldda	[%i3+%g0]0x89,%f26	! %f26 = 00000000 00000002
!	Mem[0000000010141400] = 00000002, %l7 = 000000009d9acf2d
	ldsba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000002
!	Mem[00000000300c1400] = 02000000, %l5 = 00000000891d7eff
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000200
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff000000, %l4 = 00000000fbc4b3ff
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 00000000ff000000

p0_label_74:
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 0000000000000000
	setx	0x8f04ebf84777c3a0,%g7,%l0 ! %l0 = 8f04ebf84777c3a0
!	%l1 = 0000000000000200
	setx	0x775cd1ff872f02a6,%g7,%l1 ! %l1 = 775cd1ff872f02a6
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8f04ebf84777c3a0
	setx	0x7c8e5c87a13f73bb,%g7,%l0 ! %l0 = 7c8e5c87a13f73bb
!	%l1 = 775cd1ff872f02a6
	setx	0x07b24c67bee0f09d,%g7,%l1 ! %l1 = 07b24c67bee0f09d
!	Mem[0000000021800140] = 717af79c, %l3 = 00000000000000ff
	ldstub	[%o3+0x140],%l3		! %l3 = 00000071000000ff
!	%l6 = 7a77a4b4, %l7 = 00000002, Mem[0000000010001400] = ffffffff fcffffff
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 7a77a4b4 00000002
!	Mem[0000000010081404] = ef7315dc, %l1 = bee0f09d, %l0 = a13f73bb
	add	%i2,0x04,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 00000000ef7315dc
!	%f16 = ff3b0a71, Mem[00000000300c1408] = 000000ff
	sta	%f16,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff3b0a71
!	Mem[0000000010141411] = ffc87a36, %l4 = 00000000ff000000
	ldstub	[%i5+0x011],%l4		! %l4 = 000000c8000000ff
!	Mem[0000000010001400] = 7a77a4b4, %l7 = 0000000000000002
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 000000007a77a4b4
!	%f0  = 1a1ec5fc 00000038, Mem[0000000030101410] = 79beb7ff dc1573ef
	stda	%f0 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 1a1ec5fc 00000038
!	%l0 = 00000000ef7315dc, Mem[0000000030101408] = d1fffa7d
	stha	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 15dcfa7d
!	Starting 10 instruction Load Burst
!	%l2 = 000000007a555fff, immd = 0000000000000e2f, %l7 = 000000007a77a4b4
	udivx	%l2,0xe2f,%l7		! %l7 = 0000000000089fff

p0_label_75:
!	Mem[0000000030181410] = 013b0a71, %l4 = 00000000000000c8
	ldsha	[%i6+%o5]0x81,%l4	! %l4 = 000000000000013b
!	Mem[0000000030141400] = ffe80000, %l2 = 000000007a555fff
	ldsha	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l2 = 0000000000000000
	ldsha	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 0000ffd1ffffffb7, %l5 = 0000000000000200
	ldxa	[%i3+%o5]0x89,%l5	! %l5 = 0000ffd1ffffffb7
!	Mem[0000000010001400] = 02000000, %f19 = 367a61e7
	lda	[%i0+%g0]0x80,%f19	! %f19 = 02000000
!	Mem[0000000030141408] = ff000000 dd000000, %l6 = 7a77a4b4, %l7 = 00089fff
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 00000000dd000000 00000000ff000000
!	Mem[0000000020800040] = 61ff0345, %l7 = 00000000ff000000
	ldsba	[%o1+0x041]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081400] = 000000ff, %l5 = 0000ffd1ffffffb7
	ldswa	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = ff4712a6, %l1 = 07b24c67bee0f09d
	ldsha	[%i2+%o4]0x81,%l1	! %l1 = ffffffffffffff47
!	Starting 10 instruction Store Burst
!	%f13 = b4a4777a, Mem[0000000010001418] = dd372ab3
	st	%f13,[%i0+0x018]	! Mem[0000000010001418] = b4a4777a

p0_label_76:
!	%l0 = 00000000ef7315dc, Mem[0000000030181410] = 013b0a71
	stba	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = dc3b0a71
!	%l3 = 0000000000000071, Mem[0000000010041408] = b4ff777a
	stba	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 71ff777a
!	%f12 = ff000000 b4a4777a, %l3 = 0000000000000071
!	Mem[00000000100c1410] = ffcf9a9db4a4777a
	add	%i3,0x010,%g1
	stda	%f12,[%g1+%l3]ASI_PST32_P ! Mem[00000000100c1410] = ffcf9a9db4a4777a
!	%f26 = 00000000, Mem[00000000100c1418] = 00000000
	sta	%f26,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000
!	Mem[0000000010101400] = b7ffffff, %l0 = 00000000ef7315dc
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010041410] = 8000000000000000
	stxa	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000000000ff
!	Mem[0000000030041410] = ffffffff, %l0 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 00000000ffffffff
!	%f4  = 2dcf9a9d b4a4777a, %l1 = ffffffffffffff47
!	Mem[0000000010101400] = ffffffb7000000ff
	stda	%f4,[%i4+%l1]ASI_PST32_PL ! Mem[0000000010101400] = 7a77a4b49d9acf2d
!	%f28 = 1a1ec5fc, %f26 = 00000000
	fsqrts	%f28,%f26		! %f26 = 2cc99bc6
!	Starting 10 instruction Load Burst
!	%l5 = 00000000000000ff, imm = fffffffffffff65e, %l4 = 000000000000013b
	sub	%l5,-0x9a2,%l4		! %l4 = 0000000000000aa1

p0_label_77:
!	Mem[00000000300c1410] = ffffffb7, %f9  = ffb3c4fb
	lda	[%i3+%o5]0x89,%f9 	! %f9 = ffffffb7
!	Mem[00000000300c1400] = 00000002, %l1 = ffffffffffffff47
	ldswa	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000002
!	Mem[0000000010141408] = 00000000000000d1, %l7 = ffffffffffffffff
	ldxa	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000d1
!	Mem[00000000211c0000] = ffd1622e, %l6 = 00000000dd000000
	ldub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010081408] = 000000ff00000000, %f18 = ff000000 02000000
	ldd	[%i2+%o4],%f18		! %f18 = 000000ff 00000000
!	Mem[0000000010181410] = ffb3c4fb, %f8  = ff7e1d89
	lda	[%i6+%o5]0x88,%f8 	! %f8 = ffb3c4fb
!	Mem[0000000010041408] = 71ff777a6081bef2, %f6  = 00000000 ff00007a
	ldda	[%i1+%o4]0x80,%f6 	! %f6  = 71ff777a 6081bef2
!	Mem[0000000030001410] = 00000000, %l7 = 00000000000000d1
	lduha	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000071
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 00000000000000ff

p0_label_78:
!	Mem[0000000010101418] = ffffff7fb32a37dd, %l4 = 0000000000000aa1, %l1 = 0000000000000002
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l4,%l1	! %l1 = ffffff7fb32a37dd
	membar	#Sync			! Added by membar checker (15)
!	%l2 = 0000000000000000, Mem[0000000030041400] = 29ece83e
	stha	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 29ec0000
!	Mem[0000000030101408] = 15dcfa7d, %l0 = 00000000ffffffff
	swapa	[%i4+%o4]0x81,%l0	! %l0 = 0000000015dcfa7d
!	%f15 = 01e7ffe7, %f31 = 00000000, %f18 = 000000ff 00000000
	fsmuld	%f15,%f31,%f18		! %f18 = 00000000 00000000
!	Mem[00000000100c1408] = 710a3bff, %l6 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%l4 = 0000000000000aa1, Mem[0000000010141400] = 02000000
	stwa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000aa1
!	Mem[0000000010181408] = ff000000, %l4 = 0000000000000aa1
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	%f14 = a61247ff 01e7ffe7, Mem[0000000030041410] = 000000ff 000000ff
	stda	%f14,[%i1+%o5]0x89	! Mem[0000000030041410] = a61247ff 01e7ffe7
!	%l0 = 0000000015dcfa7d, Mem[0000000010181402] = 7a0000ff, %asi = 80
	stba	%l0,[%i6+0x002]%asi	! Mem[0000000010181400] = 7a007dff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c143c] = fbc4b3ff, %l5 = 00000000000000ff
	ldsw	[%i3+0x03c],%l5		! %l5 = fffffffffbc4b3ff

p0_label_79:
!	Mem[0000000010041410] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1400] = fbc4b3ff, %l3 = 00000000000000ff
	lduwa	[%i3+%g0]0x80,%l3	! %l3 = 00000000fbc4b3ff
!	%l4 = 00000000000000ff, %l7 = 0000000000000000, %l5  = fffffffffbc4b3ff
	mulx	%l4,%l7,%l5		! %l5 = 0000000000000000
!	Mem[0000000030041408] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1420] = 6081bef2, %l3 = 00000000fbc4b3ff
	lduw	[%i3+0x020],%l3		! %l3 = 000000006081bef2
!	Mem[0000000010041420] = c802fc4e, %l0 = 0000000015dcfa7d
	ldsb	[%i1+0x023],%l0		! %l0 = 000000000000004e
!	Mem[0000000030141408] = dd000000, %l2 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = ffffffffdd000000
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = 0000e8ff, %l4 = 00000000000000ff
	lduba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = ff4712a6, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 00000000ff4712a6

p0_label_80:
!	%l4 = 0000000000000000, Mem[0000000010101400] = b4a4777a
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = b4a40000
!	Mem[0000000030001408] = ffff36ff, %l6 = 00000000ff4712a6
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000300c1410] = ffffffb7, %l6 = 00000000000000ff
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 00000000ffffffb7
!	Mem[0000000030181400] = ff000000, %l1 = ffffff7fb32a37dd
	swapa	[%i6+%g0]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030141410] = 00000000, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l2 = ffffffffdd000000
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = ffcf9a9d, %l0 = 000000000000004e
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 00000000ffcf9a9d
!	Mem[0000000030181408] = ffffd100, %l6 = 00000000ffffffb7
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 00000000ffffd100
!	Mem[0000000030181408] = ffffffb7, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 00000000ffffffb7
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 367ac802, %l2 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l2	! %l2 = 00000000367ac802

p0_label_81:
!	Mem[00000000300c1408] = 2101ff00 ff3b0a71, %l6 = ffffd100, %l7 = 00000000
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 00000000ff3b0a71 000000002101ff00
!	Mem[0000000030141400] = ffe80000, %l5 = 00000000000000ff
	lduwa	[%i5+%g0]0x89,%l5	! %l5 = 00000000ffe80000
!	Mem[0000000010101408] = 7a555fba 00000000, %l0 = ffcf9a9d, %l1 = ff000000
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000 000000007a555fba
!	Mem[0000000030001400] = 000000ff, %l1 = 000000007a555fba
	lduwa	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%f5  = b4a4777a, %f29 = 7178a96b, %f22 = b21980c4
	fdivs	%f5 ,%f29,%f22		! %f22 = 82a951fc
!	Mem[0000000030101400] = 000000ff, %l3 = 000000006081bef2
	lduwa	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l2 = 00000000367ac802
	lduba	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 0000000000000000
	setx	0xdf57cac026d9cf5b,%g7,%l0 ! %l0 = df57cac026d9cf5b
!	%l1 = 00000000000000ff
	setx	0xc3ffc18819927f84,%g7,%l1 ! %l1 = c3ffc18819927f84
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = df57cac026d9cf5b
	setx	0xd2463ddf88b27e8e,%g7,%l0 ! %l0 = d2463ddf88b27e8e
!	%l1 = c3ffc18819927f84
	setx	0xab1c6f97bdc105e2,%g7,%l1 ! %l1 = ab1c6f97bdc105e2
!	Mem[0000000010081400] = 00d1ffff, %l1 = ab1c6f97bdc105e2
	lduwa	[%i2+%g0]0x88,%l1	! %l1 = 0000000000d1ffff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffffffb7, Mem[0000000030041408] = 000000ff
	stwa	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffb7

p0_label_82:
!	%f26 = 2cc99bc6 00000002, Mem[0000000030181400] = dd372ab3 0000c802
	stda	%f26,[%i6+%g0]0x89	! Mem[0000000030181400] = 2cc99bc6 00000002
!	Mem[0000000030101408] = ffffffff, %l6 = 00000000ff3b0a71
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[0000000030041408] = ffffffb7
	stwa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	%f22 = 82a951fc 6fb71394, Mem[0000000010041410] = ff000000 00000000
	stda	%f22,[%i1+%o5]0x80	! Mem[0000000010041410] = 82a951fc 6fb71394
!	Mem[0000000030101400] = ff000000, %l1 = 0000000000d1ffff
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 00000000ff000000
!	%f6  = 71ff777a 6081bef2, Mem[0000000030181400] = 02000000 c69bc92c
	stda	%f6 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 71ff777a 6081bef2
!	Mem[00000000300c1400] = 00000002, %l6 = 00000000000000ff
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000002000000ff
!	%l6 = 0000000000000002, Mem[0000000010181408] = 000000ff
	stwa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000002
!	Mem[0000000030001408] = ffff36ff, %l3 = 00000000000000ff
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 71ff777a 6081bef2, %l0 = 88b27e8e, %l1 = ff000000
	ldd	[%i1+%o4],%l0		! %l0 = 0000000071ff777a 000000006081bef2

p0_label_83:
!	Mem[0000000030041400] = cedd0f2329ec0000, %l3 = 00000000000000ff
	ldxa	[%i1+%g0]0x89,%l3	! %l3 = cedd0f2329ec0000
!	Mem[0000000010101400] = b4a40000, %l2 = 0000000000000000
	lduha	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = f2be81607a77ff71, %f24 = 80000000 00000000
	ldda	[%i6+%g0]0x89,%f24	! %f24 = f2be8160 7a77ff71
!	Mem[0000000030041410] = e7ffe701, %l0 = 0000000071ff777a
	lduha	[%i1+%o5]0x81,%l0	! %l0 = 000000000000e7ff
!	Mem[0000000010081410] = 367ac802 ff000000, %l6 = 00000002, %l7 = 2101ff00
	ldda	[%i2+0x010]%asi,%l6	! %l6 = 00000000367ac802 00000000ff000000
!	Mem[0000000030141400] = ffe80000, %l2 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = 3eff120f, %l6 = 00000000367ac802
	lduba	[%i4+%o5]0x88,%l6	! %l6 = 000000000000000f
!	Mem[0000000010081400] = ffffd100, %l1 = 000000006081bef2
	ldsha	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[000000001000140c] = 124cb2c7, %l7 = 00000000ff000000
	ldub	[%i0+0x00c],%l7		! %l7 = 0000000000000012
!	Starting 10 instruction Store Burst
!	%f12 = ff000000, Mem[0000000030141410] = 00000000
	sta	%f12,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000

p0_label_84:
!	%f4  = 2dcf9a9d b4a4777a, %l5 = 00000000ffe80000
!	Mem[0000000030001418] = dc687efe9e34a28f
	add	%i0,0x018,%g1
	stda	%f4,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030001418] = dc687efe9e34a28f
!	Mem[00000000201c0000] = 73b7de6c, %l2 = 0000000000000000
	ldsh	[%o0+%g0],%l2		! %l2 = 00000000000073b7
!	Mem[0000000030181400] = 71ff777a, %l5 = 00000000ffe80000
	swapa	[%i6+%g0]0x81,%l5	! %l5 = 0000000071ff777a
!	Mem[00000000201c0001] = 73b7de6c, %l7 = 0000000000000012
	ldstub	[%o0+0x001],%l7		! %l7 = 000000b7000000ff
!	%l7 = 00000000000000b7, Mem[00000000100c1410] = 0000004e
	stwa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000b7
!	%l5 = 0000000071ff777a, imm = fffffffffffff8df, %l3 = cedd0f2329ec0000
	addc	%l5,-0x721,%l3		! %l3 = 0000000071ff7059
!	Mem[0000000010041415] = 6fb71394, %l7 = 00000000000000b7
	ldstub	[%i1+0x015],%l7		! %l7 = 000000b7000000ff
!	Mem[0000000010081410] = 02c87a36, %l7 = 00000000000000b7
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 0000000002c87a36
!	Mem[0000000010081408] = 000000ff, %l7 = 0000000002c87a36
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = b7000000, %l1 = ffffffffffffffff
	ldsba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_85:
!	Mem[0000000030141410] = ff000000 ffffff80, %l0 = 0000e7ff, %l1 = 00000000
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 00000000ff000000 00000000ffffff80
!	Mem[0000000010001400] = 0000000200000002, %l7 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l7	! %l7 = 0000000200000002
!	Mem[00000000100c1410] = 000000b7, %l0 = 00000000ff000000
	lduha	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 000000ff, %l5 = 0000000071ff777a
	ldsba	[%i0+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1434] = 9cd10952, %l1 = 00000000ffffff80
	ldsh	[%i3+0x034],%l1		! %l1 = ffffffffffff9cd1
!	Mem[0000000010101428] = 2dcf9a9d, %l5 = ffffffffffffffff
	ldswa	[%i4+0x028]%asi,%l5	! %l5 = 000000002dcf9a9d
!	Mem[00000000300c1408] = 710a3bff, %l3 = 0000000071ff7059
	ldsba	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000071
!	%l6 = 000000000000000f, %l4 = 00000000ffffffb7, %l2 = 00000000000073b7
	xor	%l6,%l4,%l2		! %l2 = 00000000ffffffb8
!	%l3 = 0000000000000071, imm = fffffffffffff52c, %l2 = 00000000ffffffb8
	subc	%l3,-0xad4,%l2		! %l2 = 0000000000000b45
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = ff000000, %l1 = ffffffffffff9cd1
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 00000000ff000000

p0_label_86:
!	%l7 = 0000000200000002, Mem[0000000010181408] = 8c29b7c200000002
	stxa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000200000002
!	Mem[0000000010081400] = 00d1ffff, %l3 = 0000000000000071
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 0000000000d1ffff
!	%l6 = 0000000f, %l7 = 00000002, Mem[0000000010101410] = 0f12ff3e 710a3bff
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000f 00000002
!	%f2  = 7a36ffff 00000000, %l2 = 0000000000000b45
!	Mem[0000000010181418] = 92ffc9a2c5910333
	add	%i6,0x018,%g1
	stda	%f2,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010181418] = 00ff00a2c5913633
!	%f26 = 2cc99bc6, Mem[0000000030101400] = ffffd100
	sta	%f26,[%i4+%g0]0x89	! Mem[0000000030101400] = 2cc99bc6
!	%l6 = 000000000000000f, Mem[000000001014141c] = 00000000
	sth	%l6,[%i5+0x01c]		! Mem[000000001014141c] = 000f0000
!	%l6 = 000000000000000f, Mem[0000000010041410] = fc51a982
	stba	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = fc51a90f
!	Mem[0000000010081410] = 000000b7, %l7 = 0000000200000002
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000b7
!	Mem[0000000010101408] = 00000000, %l1 = 00000000ff000000
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffd1622e, %l7 = 00000000000000b7
	ldsba	[%o2+0x001]%asi,%l7	! %l7 = ffffffffffffffd1

p0_label_87:
!	Mem[0000000030041400] = 0000ec29, %l6 = 000000000000000f
	lduwa	[%i1+%g0]0x81,%l6	! %l6 = 000000000000ec29
!	Mem[0000000030101408] = ffffffff, %l5 = 000000002dcf9a9d
	lduba	[%i4+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001408] = c7b24c12c4fb0000, %f16 = ff3b0a71 00000000
	ldda	[%i0+%o4]0x88,%f16	! %f16 = c7b24c12 c4fb0000
!	Mem[0000000030041400] = 0000ec29, %l5 = 00000000000000ff
	lduba	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = ffb719ff, %l4 = 00000000ffffffb7
	lduha	[%i2+%o5]0x81,%l4	! %l4 = 000000000000ffb7
!	Mem[00000000300c1410] = 000000ff, %l4 = 000000000000ffb7
	lduwa	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041400] = 29ec0000, %l3 = 0000000000d1ffff
	ldsba	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1414] = b4a4777a, %l4 = 00000000000000ff
	lduba	[%i3+0x015]%asi,%l4	! %l4 = 00000000000000a4
!	%f29 = 7178a96b, %f24 = f2be8160, %f18 = 00000000
	fdivs	%f29,%f24,%f18		! %f18 = be27133b
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = 61e468e7, %l2 = 0000000000000b45
	ldstub	[%o1+0x001],%l2		! %l2 = 000000e4000000ff

p0_label_88:
!	%l7 = ffffffffffffffd1, Mem[00000000100c1410] = b7000000
	stba	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = b70000d1
!	Code Fragment 4
p0_fragment_7:
!	%l0 = 0000000000000000
	setx	0xadfe9f6fc1a31057,%g7,%l0 ! %l0 = adfe9f6fc1a31057
!	%l1 = 0000000000000000
	setx	0x6a5fb3400fe08591,%g7,%l1 ! %l1 = 6a5fb3400fe08591
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = adfe9f6fc1a31057
	setx	0x3faa9e5800c45526,%g7,%l0 ! %l0 = 3faa9e5800c45526
!	%l1 = 6a5fb3400fe08591
	setx	0xe6409f8feba06d2a,%g7,%l1 ! %l1 = e6409f8feba06d2a
!	%l7 = ffffffffffffffd1, Mem[0000000010101410] = 0f000000
	stha	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 0f00ffd1
!	%l1 = e6409f8feba06d2a, %l6 = 000000000000ec29, %l6 = 000000000000ec29
	sdivx	%l1,%l6,%l6		! %l6 = ffffe416e1841ff7
!	%l7 = ffffffffffffffd1, Mem[00000000201c0000] = 73ffde6c
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = ffd1de6c
!	Mem[0000000030141410] = 000000ff, %l4 = 00000000000000a4
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081408] = ff4712a6, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	%l6 = ffffe416e1841ff7, Mem[00000000100c1408] = ff3b0a71
	stba	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = f73b0a71
!	Mem[0000000010181415] = 891d7eff, %l3 = 00000000000000ff
	ldstub	[%i6+0x015],%l3		! %l3 = 0000001d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 38000000ffe80000, %l1 = e6409f8feba06d2a
	ldxa	[%i5+%g0]0x89,%l1	! %l1 = 38000000ffe80000

p0_label_89:
!	Mem[0000000010081420] = de1a96d2, %f9  = ffffffb7
	lda	[%i2+0x020]%asi,%f9 	! %f9 = de1a96d2
!	Mem[0000000030181408] = 00000000 6081bef2, %l6 = e1841ff7, %l7 = ffffffd1
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000 000000006081bef2
!	Mem[0000000010101410] = d1ff000f 00000002, %l0 = 00c45526, %l1 = ffe80000
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 00000000d1ff000f 0000000000000002
!	%l4 = 00000000000000ff, immd = 0000000000000997, %l2 = 00000000000000e4
	sdivx	%l4,0x997,%l2		! %l2 = 0000000000000000
!	Mem[00000000300c1408] = ff3b0a71, %l7 = 000000006081bef2
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000071
	membar	#Sync			! Added by membar checker (16)
!	Mem[00000000100c1400] = fbc4b3ff 710a3bff f73b0a71 49bec8ce
!	Mem[00000000100c1410] = d10000b7 b4a4777a 00000000 ff00007a
!	Mem[00000000100c1420] = 6081bef2 86a0009d 00000000 0000367a
!	Mem[00000000100c1430] = 9e93528b 9cd10952 95b4ef5e fbc4b3ff
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000010041400] = ff000000, %l3 = 000000000000001d
	ldsba	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000211c0000] = ffd1622e, %l7 = 0000000000000071
	lduba	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041400] = 0000ec29 230fddce ff000000 367a61e7
!	Mem[0000000030041410] = e7ffe701 ff4712a6 b21980c4 6fb71394
!	Mem[0000000030041420] = de1a96d2 4b7f7ac8 5fc6552c 1fe26fae
!	Mem[0000000030041430] = 1a1ec5fc 7178a96b 00006130 248e193a
	ldda	[%i1]ASI_BLK_S,%f0	! Block Load from 0000000030041400
!	Starting 10 instruction Store Burst
!	Mem[0000000010001438] = 7bf46ccb89cf9fc6, %l1 = 0000000000000002, %l2 = 0000000000000000
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = 7bf46ccb89cf9fc6

p0_label_90:
!	Mem[0000000030041400] = 29ec0000, %l4 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l0 = d1ff000f, %l1 = 00000002, Mem[0000000010081408] = ff0000ff 00000000
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = d1ff000f 00000002
!	%l0 = 00000000d1ff000f, Mem[0000000010001400] = 0200000002000000
	stxa	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000d1ff000f
!	Mem[00000000100c1407] = 710a3bff, %l0 = 00000000d1ff000f
	ldstuba	[%i3+0x007]%asi,%l0	! %l0 = 000000ff000000ff
!	%l0 = 000000ff, %l1 = 00000002, Mem[0000000010081410] = 02000000 ff000000
	stda	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff 00000002
!	Mem[0000000010001408] = c4fb0000, %l4 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%f16 = c7b24c12 c4fb0000, %l6 = 0000000000000000
!	Mem[0000000010041418] = dd372ab37fffffff
	add	%i1,0x018,%g1
	stda	%f16,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010041418] = dd372ab37fffffff
!	Mem[0000000030141400] = ffe80000, %l2 = 7bf46ccb89cf9fc6
	swapa	[%i5+%g0]0x89,%l2	! %l2 = 00000000ffe80000
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010181418] = 00ff00a2 c5913633
	std	%l6,[%i6+0x018]		! Mem[0000000010181418] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 0000c802000000ff, %l3 = ffffffffffffffff
	ldxa	[%i1+%g0]0x88,%l3	! %l3 = 0000c802000000ff

p0_label_91:
!	Mem[0000000030181400] = ffe80000, %l0 = 00000000000000ff
	ldsha	[%i6+%g0]0x81,%l0	! %l0 = ffffffffffffffe8
!	Mem[0000000030081400] = ff000000 01e7ffe7 ff4712a6 124cb2c7
!	Mem[0000000030081410] = ffb719ff ef7315dc 296a7add 5650f73a
!	Mem[0000000030081420] = be6494a6 0e14473c 7a77a4b4 9d9acf2d
!	Mem[0000000030081430] = 02f1857b 367a61e7 7bf46ccb 890d9fc6
	ldda	[%i2]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Mem[0000000010041408] = 7a77ff71, %f15 = 248e193a
	lda	[%i1+%o4]0x88,%f15	! %f15 = 7a77ff71
!	Mem[00000000100c1438] = 95b4ef5e, %l0 = ffffffffffffffe8
	lduha	[%i3+0x03a]%asi,%l0	! %l0 = 000000000000ef5e
!	Mem[0000000010001438] = 7bf46ccb 89cf9fc6, %l2 = ffe80000, %l3 = 000000ff
	ldda	[%i0+0x038]%asi,%l2	! %l2 = 000000007bf46ccb 0000000089cf9fc6
!	Mem[0000000010041410] = 0fa951fc, %l5 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000fa9
!	%l3 = 0000000089cf9fc6, immed = 00000102, %y  = 60dc6e7f
	udiv	%l3,0x102,%l4		! %l4 = 00000000ffffffff
	mov	%l0,%y			! %y = 0000ef5e
!	Mem[0000000010041434] = 367a61e7, %l3 = 0000000089cf9fc6
	ldsh	[%i1+0x034],%l3		! %l3 = 000000000000367a
!	Mem[0000000030001408] = ff36ffff, %f5  = ff4712a6
	lda	[%i0+%o4]0x81,%f5 	! %f5 = ff36ffff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000fa9, Mem[0000000010001410] = ffff9cd1ff00007a, %asi = 80
	stxa	%l5,[%i0+0x010]%asi	! Mem[0000000010001410] = 0000000000000fa9

p0_label_92:
!	%l2 = 000000007bf46ccb, Mem[0000000010181400] = ff7d007a
	stha	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = ff7d6ccb
!	%l3 = 000000000000367a, Mem[0000000010001408] = c7b24c12c4fb00ff
	stxa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000000000367a
	membar	#Sync			! Added by membar checker (17)
!	%l6 = 0000000000000000, Mem[00000000100c1410] = d10000b7
	stba	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000b7
!	Mem[0000000010041410] = 0fa951fc, %l1 = 0000000000000002
	ldstuba	[%i1+%o5]0x80,%l1	! %l1 = 0000000f000000ff
!	%l0 = 000000000000ef5e, Mem[000000001010143c] = cb6cf47b, %asi = 80
	stha	%l0,[%i4+0x03c]%asi	! Mem[000000001010143c] = ef5ef47b
!	%f22 = 296a7add, Mem[0000000010001400] = 00000000
	sta	%f22,[%i0+%g0]0x88	! Mem[0000000010001400] = 296a7add
!	%f5  = ff36ffff, Mem[0000000010181400] = cb6c7dff
	sta	%f5 ,[%i6+%g0]0x80	! Mem[0000000010181400] = ff36ffff
!	Mem[00000000100c1408] = f73b0a71, %l3 = 000000000000367a
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 000000f7000000ff
!	%l7 = 00000000000000ff, Mem[0000000010041418] = dd372ab37fffffff, %asi = 80
	stxa	%l7,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff000000d1ff0000, %f30 = 7bf46ccb 890d9fc6
	ldda	[%i3+%o5]0x81,%f30	! %f30 = ff000000 d1ff0000

p0_label_93:
!	Mem[00000000300c1410] = ff000000d1ff0000, %l6 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l6	! %l6 = ff000000d1ff0000
!	Mem[00000000211c0000] = ffd1622e, %l1 = 000000000000000f
	ldsba	[%o2+0x001]%asi,%l1	! %l1 = ffffffffffffffd1
!	Mem[0000000010101408] = 000000ff, %l2 = 000000007bf46ccb
	ldsba	[%i4+0x00a]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = ffb719ff, %l1 = ffffffffffffffd1
	ldsha	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffffb7
!	Mem[00000000201c0000] = ffd1de6c, %l1 = ffffffffffffffb7
	lduh	[%o0+%g0],%l1		! %l1 = 000000000000ffd1
!	Mem[000000001018143c] = 000000ff, %l1 = 000000000000ffd1
	lduwa	[%i6+0x03c]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = ffa951fc, %l1 = 00000000000000ff
	lduwa	[%i1+%o5]0x80,%l1	! %l1 = 00000000ffa951fc
!	Mem[0000000021800100] = 161494a7, %l5 = 0000000000000fa9
	ldsha	[%o3+0x100]%asi,%l5	! %l5 = 0000000000001614
!	Mem[0000000010001408] = 000000000000367a, %f0  = 0000ec29 230fddce
	ldda	[%i0+%o4]0x88,%f0 	! %f0  = 00000000 0000367a
!	Starting 10 instruction Store Burst
!	%f8  = de1a96d2 4b7f7ac8, Mem[0000000010081408] = 0f00ffd1 02000000
	stda	%f8 ,[%i2+%o4]0x88	! Mem[0000000010081408] = de1a96d2 4b7f7ac8

p0_label_94:
!	Mem[0000000030141410] = 000000a4, %l5 = 0000000000001614
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 00000000000000a4
!	%f14 = 00006130 7a77ff71, %l3 = 00000000000000f7
!	Mem[00000000100c1428] = 000000000000367a
	add	%i3,0x028,%g1
	stda	%f14,[%g1+%l3]ASI_PST8_P ! Mem[00000000100c1428] = 000061300077ff71
!	%f4  = e7ffe701 ff36ffff, Mem[0000000010001408] = 7a360000 00000000
	stda	%f4 ,[%i0+%o4]0x80	! Mem[0000000010001408] = e7ffe701 ff36ffff
!	Mem[0000000010001400] = 296a7add, %l5 = 00000000000000a4
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000296a7add
!	%l7 = 00000000000000ff, Mem[0000000030141400] = 89cf9fc6
	stwa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	%l0 = 000000000000ef5e, Mem[0000000030041410] = 01e7ffe7
	stha	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 01e7ef5e
!	%f0  = 00000000 0000367a, Mem[0000000010001400] = a4000000 d1ff000f
	stda	%f0 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 0000367a
!	%f10 = 5fc6552c 1fe26fae, %l6 = ff000000d1ff0000
!	Mem[0000000030041428] = 5fc6552c1fe26fae
	add	%i1,0x028,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_S ! Mem[0000000030041428] = 5fc6552c1fe26fae
!	Mem[0000000010181410] = fbc4b3ff89ff7eff, %l1 = 00000000ffa951fc, %l4 = 00000000ffffffff
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = fbc4b3ff89ff7eff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = c69bc92c01e7ffe7, %f24 = be6494a6 0e14473c
	ldda	[%i4+%g0]0x81,%f24	! %f24 = c69bc92c 01e7ffe7

p0_label_95:
!	Mem[00000000100c1408] = ff3b0a7149bec8ce, %l3 = 00000000000000f7
	ldxa	[%i3+0x008]%asi,%l3	! %l3 = ff3b0a7149bec8ce
!	Mem[0000000010081400] = 71000000ef7315dc, %f14 = 00006130 7a77ff71
	ldda	[%i2+%g0]0x80,%f14	! %f14 = 71000000 ef7315dc
!	Mem[0000000030081400] = ff00000001e7ffe7, %f8  = de1a96d2 4b7f7ac8
	ldda	[%i2+%g0]0x81,%f8 	! %f8  = ff000000 01e7ffe7
!	%f20 = ffb719ff, %f12 = 1a1ec5fc
	fcmpes	%fcc2,%f20,%f12		! %fcc2 = 3
!	Mem[0000000010081410] = 02000000 ff000000, %l6 = d1ff0000, %l7 = 000000ff
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 00000000ff000000 0000000002000000
!	Mem[0000000010181400] = 00000000ffff36ff, %f22 = 296a7add 5650f73a
	ldda	[%i6+%g0]0x88,%f22	! %f22 = 00000000 ffff36ff
!	Mem[0000000010101400] = b4a40000, %l1 = 00000000ffa951fc
	ldswa	[%i4+%g0]0x88,%l1	! %l1 = ffffffffb4a40000
!	Mem[0000000010141400] = 00000aa100000000, %f22 = 00000000 ffff36ff
	ldd	[%i5+%g0],%f22		! %f22 = 00000aa1 00000000
!	%l3 = ff3b0a7149bec8ce, %l5 = 00000000296a7add, %y  = 0000ef5e
	smul	%l3,%l5,%l0		! %l0 = 0bee3a8cb8b185d6, %y = 0bee3a8c
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 0000e8ff, %l1 = ffffffffb4a40000
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 000000ff000000ff

p0_label_96:
!	%l2 = 00000000, %l3 = 49bec8ce, Mem[0000000030181400] = 0000e8ff f2be8160
	stda	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 49bec8ce
!	%l0 = 0bee3a8cb8b185d6, Mem[000000001014142c] = 00000000
	sth	%l0,[%i5+0x02c]		! Mem[000000001014142c] = 85d60000
!	%f14 = 71000000, Mem[0000000010001434] = 367a61e7
	st	%f14,[%i0+0x034]	! Mem[0000000010001434] = 71000000
!	%l3 = ff3b0a7149bec8ce, Mem[00000000100c1410] = 000000b7b4a4777a
	stxa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff3b0a7149bec8ce
!	%l2 = 0000000000000000, Mem[0000000030181408] = 00000000
	stha	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%f7  = 6fb71394, Mem[0000000010181410] = ffb3c4fb
	sta	%f7 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 6fb71394
!	Mem[0000000010001413] = 00000000, %l6 = 00000000ff000000
	ldstub	[%i0+0x013],%l6		! %l6 = 00000000000000ff
!	Mem[00000000100c1408] = ff3b0a71, %l7 = 0000000002000000
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 00000000ff3b0a71
!	Mem[0000000030181400] = 00000000, %l4 = fbc4b3ff89ff7eff
	ldstuba	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff3b0a71, %l1 = 00000000000000ff
	lduba	[%i3+%o5]0x80,%l1	! %l1 = 00000000000000ff

p0_label_97:
!	%l0 = 0bee3a8cb8b185d6, Mem[000000001008142e] = 1fe26fae, %asi = 80
	stba	%l0,[%i2+0x02e]%asi	! Mem[000000001008142c] = 1fe2d6ae
!	Mem[0000000030141400] = 000000ff, %l4 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030181408] = 00000000
	stha	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	Mem[0000000010001404] = 0000367a, %l3 = ff3b0a7149bec8ce
	ldsba	[%i0+0x006]%asi,%l3	! %l3 = 0000000000000036
!	Mem[0000000021800080] = 5046e4e3, %l7 = 00000000ff3b0a71
	lduba	[%o3+0x080]%asi,%l7	! %l7 = 0000000000000050
!	Mem[0000000010041400] = 000000ff, %l1 = 00000000000000ff
	ldswa	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010001400] = 00000000 0000367a e7ffe701 ff36ffff
!	Mem[0000000010001410] = 000000ff 00000fa9 b4a4777a 5650f73a
!	Mem[0000000010001420] = 4398689c 02f1857b 7a77a4b4 9d9acf2d
!	Mem[0000000010001430] = 02f1857b 71000000 7bf46ccb 89cf9fc6
	ldda	[%i0]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010001400
!	%l0 = 0bee3a8cb8b185d6, %l7 = 0000000000000050, %y  = 0bee3a8c
	smul	%l0,%l7,%l2		! %l2 = ffffffe9b779d2e0, %y = ffffffe9
!	Mem[0000000030181410] = 0f129d3e 710a3bdc, %l0 = b8b185d6, %l1 = 000000ff
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000710a3bdc 000000000f129d3e
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000010101400] = 0000a4b4
	stwa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff

p0_label_98:
!	%l4 = 000000ff, %l5 = 296a7add, Mem[0000000030081408] = a61247ff c7b24c12
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff 296a7add
!	Mem[00000000211c0001] = ffd1622e, %l5 = 00000000296a7add
	ldstub	[%o2+0x001],%l5		! %l5 = 000000d1000000ff
	membar	#Sync			! Added by membar checker (19)
!	%l5 = 00000000000000d1, Mem[0000000010001410] = ff000000
	stba	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = ff0000d1
!	%f10 = 2dcf9a9d, Mem[0000000030081408] = 000000ff
	sta	%f10,[%i2+%o4]0x89	! Mem[0000000030081408] = 2dcf9a9d
!	%l4 = 00000000000000ff, Mem[0000000010001410] = d10000ff00000fa9, %asi = 80
	stxa	%l4,[%i0+0x010]%asi	! Mem[0000000010001410] = 00000000000000ff
!	Mem[0000000010041408] = 7a77ff71, %l3 = 0000000000000036
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 00000071000000ff
!	Mem[0000000021800040] = ff866a20, %l4 = 00000000000000ff
	ldstub	[%o3+0x040],%l4		! %l4 = 000000ff000000ff
!	Mem[0000000020800001] = 61ff68e7, %l7 = 0000000000000050
	ldstuba	[%o1+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	%f13 = 7b85f102, %f7  = 7a77a4b4, %f24 = c69bc92c
	fdivs	%f13,%f7 ,%f24		! %f24 = 408a7614
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000 000000ff, %l0 = 710a3bdc, %l1 = 0f129d3e
	ldd	[%i0+%o5],%l0		! %l0 = 0000000000000000 00000000000000ff

p0_label_99:
!	Mem[0000000010041438] = e7617a36, %l4 = 00000000000000ff
	ldub	[%i1+0x03b],%l4		! %l4 = 0000000000000036
!	Mem[0000000030041410] = 01e7ef5e, %l7 = 00000000000000ff
	lduha	[%i1+%o5]0x89,%l7	! %l7 = 000000000000ef5e
!	Mem[0000000010141400] = 00000aa100000000, %f18 = ff4712a6 124cb2c7
	ldda	[%i5+0x000]%asi,%f18	! %f18 = 00000aa1 00000000
!	Mem[0000000030101400] = e7ffe7012cc99bc6, %f6  = 3af75056 7a77a4b4
	ldda	[%i4+%g0]0x89,%f6 	! %f6  = e7ffe701 2cc99bc6
!	%f15 = cb6cf47b, %f14 = c69fcf89
	fcmps	%fcc2,%f15,%f14		! %fcc2 = 1
!	Mem[0000000010041410] = ffa951fc, %l1 = 00000000000000ff
	ldub	[%i1+%o5],%l1		! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = ff3b0a71, %l5 = 00000000000000d1
	lduba	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000071
!	Mem[0000000010001410] = 00000000, %f30 = ff000000
	lda	[%i0+0x010]%asi,%f30	! %f30 = 00000000
!	Mem[00000000100c1400] = ffb3c4fb, %l4 = 0000000000000036
	lduwa	[%i3+%g0]0x88,%l4	! %l4 = 00000000ffb3c4fb
!	Starting 10 instruction Store Burst
!	Mem[0000000010001404] = 0000367a, %l4 = 00000000ffb3c4fb
	swap	[%i0+0x004],%l4		! %l4 = 000000000000367a

p0_label_100:
!	Mem[00000000300c1408] = ff3b0a71, %l4 = 000000000000367a
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 00000071000000ff
!	%l7 = 000000000000ef5e, Mem[00000000300c1410] = 0000ffd1000000ff
	stxa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000000000ef5e
!	%f17 = 01e7ffe7, Mem[0000000030141400] = 000000ff
	sta	%f17,[%i5+%g0]0x89	! Mem[0000000030141400] = 01e7ffe7
!	Mem[0000000030101408] = ffffffff, %l4 = 0000000000000071
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[00000000100c1408] = cec8be4900000002
	stxa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000000000ff
!	Mem[00000000201c0001] = ffd1de6c, %l3 = 0000000000000071
	ldstub	[%o0+0x001],%l3		! %l3 = 000000d1000000ff
!	Mem[0000000020800000] = 61ff68e7, %l4 = 00000000000000ff
	ldstub	[%o1+%g0],%l4		! %l4 = 00000061000000ff
!	Mem[000000001014141c] = 000f0000, %l5 = 0000000000000071
	swap	[%i5+0x01c],%l5		! %l5 = 00000000000f0000
!	%f26 = 7a77a4b4, Mem[0000000010141400] = 00000aa1
	sta	%f26,[%i5+%g0]0x80	! Mem[0000000010141400] = 7a77a4b4
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff622e, %l4 = 0000000000000061
	ldsba	[%o2+0x001]%asi,%l4	! %l4 = ffffffffffffffff

p0_label_101:
!	Mem[00000000300c1410] = 0000ef5e, %l2 = ffffffe9b779d2e0
	ldsha	[%i3+%o5]0x89,%l2	! %l2 = ffffffffffffef5e
!	Mem[0000000030001408] = ff36ffff 00000000, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 00000000ff36ffff 0000000000000000
!	Mem[00000000100c1410] = 710a3bff, %l3 = 00000000000000d1
	ldswa	[%i3+%o5]0x88,%l3	! %l3 = 00000000710a3bff
!	Mem[0000000030081408] = 2dcf9a9d, %l3 = 00000000710a3bff
	ldsba	[%i2+%o4]0x89,%l3	! %l3 = ffffffffffffff9d
!	Mem[0000000010141400] = b4a4777a, %l3 = ffffffffffffff9d
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = ffffffffb4a4777a
!	Mem[0000000021800000] = ff787193, %l4 = ffffffffffffffff
	ldsba	[%o3+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030001400] = 000000ff, %f0  = 7a360000
	lda	[%i0+%g0]0x89,%f0 	! %f0 = 000000ff
!	Mem[0000000020800000] = ffff68e7, %l0 = 00000000ff36ffff
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030101400] = 2cc99bc6, %l0 = 000000000000ffff
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 000000002cc99bc6
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ffff777a6081bef2, %l0 = 000000002cc99bc6, %l3 = ffffffffb4a4777a
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = ffff777a6081bef2

p0_label_102:
!	Mem[0000000020800000] = ffff68e7, %l7 = 000000000000ef5e
	ldstub	[%o1+%g0],%l7		! %l7 = 000000ff000000ff
!	Mem[0000000010181408] = 02000000, %l6 = 0000000000000000
	swap	[%i6+%o4],%l6		! %l6 = 0000000002000000
!	%l4 = ffffffffffffffff, Mem[0000000030181400] = ff000000
	stba	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	%f22 = 00000aa1 00000000, Mem[0000000010041428] = 00000042 c7b24c12
	std	%f22,[%i1+0x028]	! Mem[0000000010041428] = 00000aa1 00000000
!	%f0  = 000000ff 00000000 ffff36ff 01e7ffe7
!	%f4  = a90f0000 ff000000 e7ffe701 2cc99bc6
!	%f8  = 7b85f102 9c689843 2dcf9a9d b4a4777a
!	%f12 = 00000071 7b85f102 c69fcf89 cb6cf47b
	stda	%f0,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	%l0 = 2cc99bc6, %l1 = 00000000, Mem[0000000030141408] = 000000dd 000000ff
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 2cc99bc6 00000000
!	Mem[00000000100c1400] = fbc4b3ff, %l3 = ffff777a6081bef2
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000fb
!	%l7 = 00000000000000ff, Mem[0000000010141410] = ffff7a36
	stba	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = ffff7a36
!	%f0  = 000000ff 00000000 ffff36ff 01e7ffe7
!	%f4  = a90f0000 ff000000 e7ffe701 2cc99bc6
!	%f8  = 7b85f102 9c689843 2dcf9a9d b4a4777a
!	%f12 = 00000071 7b85f102 c69fcf89 cb6cf47b
	stda	%f0,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000

p0_label_103:
!	Mem[0000000010101408] = ff000000, %l7 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010041410] = fc51a9ff, %f31 = d1ff0000
	lda	[%i1+%o5]0x88,%f31	! %f31 = fc51a9ff
!	Mem[000000001010143c] = ef5ef47b, %f22 = 00000aa1
	lda	[%i4+0x03c]%asi,%f22	! %f22 = ef5ef47b
!	Mem[0000000030101400] = 2cc99bc6, %l1 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l1	! %l1 = 0000000000009bc6
!	Mem[0000000010081408] = 4b7f7ac8, %l3 = 00000000000000fb
	ldsha	[%i2+%o4]0x88,%l3	! %l3 = 0000000000007ac8
!	Mem[0000000010141438] = ffb3c4fb, %l3 = 0000000000007ac8
	ldsb	[%i5+0x039],%l3		! %l3 = ffffffffffffffb3
!	Mem[00000000300c1410] = 5eef0000, %l7 = ffffffffff000000
	lduwa	[%i3+%o5]0x81,%l7	! %l7 = 000000005eef0000
!	Mem[00000000300c1408] = ff0a3bff, %f26 = 7a77a4b4
	lda	[%i3+%o4]0x81,%f26	! %f26 = ff0a3bff
!	Mem[0000000010141428] = 7a36000085d60000, %l7 = 000000005eef0000
	ldxa	[%i5+0x028]%asi,%l7	! %l7 = 7a36000085d60000
!	Starting 10 instruction Store Burst
!	%f25 = 01e7ffe7, Mem[0000000010101410] = d1ff000f
	sta	%f25,[%i4+0x010]%asi	! Mem[0000000010101410] = 01e7ffe7

p0_label_104:
!	%l2 = ffffef5e, %l3 = ffffffb3, Mem[0000000010001410] = 00000000 ff000000
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffef5e ffffffb3
!	%f24 = 408a7614 01e7ffe7, %l1 = 0000000000009bc6
!	Mem[0000000010041438] = e7617a36000000ff
	add	%i1,0x038,%g1
	stda	%f24,[%g1+%l1]ASI_PST32_P ! Mem[0000000010041438] = 408a7614000000ff
!	Mem[0000000010101410] = e7ffe701, %l1 = 0000000000009bc6
	swapa	[%i4+%o5]0x88,%l1	! %l1 = 00000000e7ffe701
!	%l5 = 00000000000f0000, Mem[0000000030041408] = 000000ff
	stwa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 000f0000
!	%l3 = ffffffffffffffb3, Mem[00000000201c0001] = ffffde6c, %asi = 80
	stba	%l3,[%o0+0x001]%asi	! Mem[00000000201c0000] = ffb3de6c
!	%f22 = ef5ef47b 00000000, %l4 = ffffffffffffffff
!	Mem[0000000010141430] = 7a77a4b49d9acf2d
	add	%i5,0x030,%g1
	stda	%f22,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010141430] = 000000007bf45eef
!	%l2 = ffffffffffffef5e, Mem[00000000100c1410] = a90f0000ff000000
	stx	%l2,[%i3+%o5]		! Mem[00000000100c1410] = ffffffffffffef5e
!	%l5 = 00000000000f0000, Mem[0000000030181400] = 000000ff
	stwa	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 000f0000
!	%l5 = 00000000000f0000, Mem[00000000100c141c] = 2cc99bc6
	sth	%l5,[%i3+0x01c]		! Mem[00000000100c141c] = 00009bc6
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff000000, %f30 = 00000000
	lda	[%i3+%g0]0x81,%f30	! %f30 = ff000000

p0_label_105:
!	Mem[0000000030141400] = e7ffe701, %l1 = 00000000e7ffe701
	lduha	[%i5+%g0]0x81,%l1	! %l1 = 000000000000e7ff
!	Mem[0000000030181410] = dc3b0a71, %l7 = 7a36000085d60000
	ldsha	[%i6+%o5]0x81,%l7	! %l7 = ffffffffffffdc3b
!	Mem[0000000030001400] = 000000ff, %l0 = 000000002cc99bc6
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (20)
!	Mem[00000000100c1408] = ffff36ff, %l2 = ffffffffffffef5e
	ldswa	[%i3+0x008]%asi,%l2	! %l2 = ffffffffffff36ff
!	Mem[0000000030101410] = 38000000, %l5 = 00000000000f0000
	lduha	[%i4+%o5]0x81,%l5	! %l5 = 0000000000003800
!	Mem[0000000010081410] = 000000ff, %l6 = 0000000002000000
	ldsha	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = ff36ffff00000000, %l4 = ffffffffffffffff
	ldxa	[%i0+%o4]0x81,%l4	! %l4 = ff36ffff00000000
!	Mem[0000000010041408] = ffff777a, %l5 = 0000000000003800
	lduba	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101428] = 2dcf9a9db4a4777a, %f8  = 7b85f102 9c689843
	ldda	[%i4+0x028]%asi,%f8 	! %f8  = 2dcf9a9d b4a4777a
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 7a77ffff, %l5 = 00000000000000ff
	ldstuba	[%i1+%o4]0x88,%l5	! %l5 = 000000ff000000ff

p0_label_106:
!	%f0  = 000000ff 00000000 ffff36ff 01e7ffe7
!	%f4  = a90f0000 ff000000 e7ffe701 2cc99bc6
!	%f8  = 2dcf9a9d b4a4777a 2dcf9a9d b4a4777a
!	%f12 = 00000071 7b85f102 c69fcf89 cb6cf47b
	stda	%f0,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	%l0 = 00000000000000ff, Mem[0000000030141410] = 80ffffff00001614
	stxa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000000000ff
!	%l1 = 000000000000e7ff, Mem[0000000010181408] = ff36ffff
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = ff36ffff
!	Mem[0000000030181410] = 710a3bdc, %l7 = ffffffffffffdc3b
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 00000000710a3bdc
!	%l6 = 00000000, %l7 = 710a3bdc, Mem[00000000300c1410] = 0000ef5e 00000000
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 710a3bdc
!	%l2 = ffffffffffff36ff, Mem[0000000010141410] = 367affff
	stwa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = ffff36ff
!	%l6 = 0000000000000000, Mem[000000001008142a] = 5fc6552c, %asi = 80
	stba	%l6,[%i2+0x02a]%asi	! Mem[0000000010081428] = 5fc6002c
!	%l6 = 0000000000000000, Mem[0000000030181400] = 00000f00
	stba	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000f00
!	%l0 = 00000000000000ff, Mem[00000000218000c0] = 4f85afb8, %asi = 80
	stha	%l0,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00ffafb8
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff000000, %l4 = ff36ffff00000000
	lduha	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000

p0_label_107:
!	Mem[0000000010181408] = ff36ffff, %l1 = 000000000000e7ff
	lduba	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = 00000f00, %l3 = ffffffffffffffb3
	lduwa	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000f00
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010041410] = ffa951fc 6fff1394, %l0 = 000000ff, %l1 = 000000ff
	ldda	[%i1+0x010]%asi,%l0	! %l0 = 00000000ffa951fc 000000006fff1394
!	Mem[0000000010101410] = 00009bc6, %l3 = 0000000000000f00
	lduba	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000c6
!	Mem[0000000010141408] = 00000000000000d1, %f0  = 000000ff 00000000
	ldda	[%i5+%o4]0x80,%f0 	! %f0  = 00000000 000000d1
!	Mem[0000000010181400] = 000000ff00000000, %f8  = 2dcf9a9d b4a4777a
	ldda	[%i6+%g0]0x80,%f8 	! %f8  = 000000ff 00000000
!	Mem[0000000030141408] = 2cc99bc6, %l1 = 000000006fff1394
	lduwa	[%i5+%o4]0x81,%l1	! %l1 = 000000002cc99bc6
!	Mem[0000000010001408] = 01e7ffe7, %l7 = 00000000710a3bdc
	ldsha	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffffe7
!	Mem[0000000010101404] = 9d9acf2d, %l7 = ffffffffffffffe7
	ldswa	[%i4+0x004]%asi,%l7	! %l7 = ffffffff9d9acf2d
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[00000000300c1400] = 000000ff
	stwa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000

p0_label_108:
!	Mem[0000000010041408] = ffff777a, %l1 = 000000002cc99bc6
	swapa	[%i1+%o4]0x80,%l1	! %l1 = 00000000ffff777a
!	%l0 = ffa951fc, %l1 = ffff777a, Mem[0000000010101400] = 000000ff 9d9acf2d
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = ffa951fc ffff777a
!	%l0 = 00000000ffa951fc, Mem[0000000010081410] = 000000ff
	stba	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = fc0000ff
!	Mem[0000000010101408] = 000000ff, %l3 = 00000000000000c6
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000021800040] = ff866a20, %l7 = ffffffff9d9acf2d
	ldstub	[%o3+0x040],%l7		! %l7 = 000000ff000000ff
!	Mem[00000000218000c1] = 00ffafb8, %l4 = 0000000000000000
	ldstuba	[%o3+0x0c1]%asi,%l4	! %l4 = 000000ff000000ff
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 00000000ffa951fc
	setx	0x92ce5757f7740ab5,%g7,%l0 ! %l0 = 92ce5757f7740ab5
!	%l1 = 00000000ffff777a
	setx	0xe87edc982d89985c,%g7,%l1 ! %l1 = e87edc982d89985c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 92ce5757f7740ab5
	setx	0xcc93949fb18b8897,%g7,%l0 ! %l0 = cc93949fb18b8897
!	%l1 = e87edc982d89985c
	setx	0x5b45b1d854b75ce5,%g7,%l1 ! %l1 = 5b45b1d854b75ce5
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010041400] = ff000000 02c80000
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 000000ff
!	%l5 = 00000000000000ff, Mem[0000000010041408] = 2cc99bc6
	stwa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffffffff, %l1 = 5b45b1d854b75ce5
	ldswa	[%i4+%o4]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_109:
!	Mem[0000000030141410] = 000000ff, %l5 = 00000000000000ff
	lduba	[%i5+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = 000000ff00000000, %l5 = 00000000000000ff
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = 000000ff00000000
!	%l0 = cc93949fb18b8897, imm = 000000000000033e, %l1 = ffffffffffffffff
	xnor	%l0,0x33e,%l1		! %l1 = 336c6b604e747456
!	Mem[0000000010181400] = 00000000ff000000, %f2  = ffff36ff 01e7ffe7
	ldda	[%i6+%g0]0x88,%f2 	! %f2  = 00000000 ff000000
!	Mem[00000000201c0000] = ffb3de6c, %l2 = ffffffffffff36ff
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 000000000000ffb3
!	Mem[0000000010041410] = ffa951fc, %f22 = ef5ef47b
	lda	[%i1+%o5]0x80,%f22	! %f22 = ffa951fc
!	Mem[0000000030001400] = ff000000dc1573ef, %f12 = 00000071 7b85f102
	ldda	[%i0+%g0]0x81,%f12	! %f12 = ff000000 dc1573ef
!	Mem[00000000100c1410] = ffffffffffffef5e, %l5 = 000000ff00000000
	ldxa	[%i3+%o5]0x80,%l5	! %l5 = ffffffffffffef5e
!	Mem[0000000010081420] = de1a96d2, %l6 = 0000000000000000
	ldsba	[%i2+0x021]%asi,%l6	! %l6 = 000000000000001a
!	Starting 10 instruction Store Burst
!	Mem[0000000021800140] = ff7af79c, %l4 = 00000000000000ff
	ldstub	[%o3+0x140],%l4		! %l4 = 000000ff000000ff

p0_label_110:
!	Mem[00000000100c1408] = ff36ffff, %l4 = 00000000000000ff
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 00000000ff36ffff
!	%l4 = 00000000ff36ffff, Mem[0000000030181408] = ff0000006081bef2
	stxa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000ff36ffff
!	%f8  = 000000ff 00000000, %l1 = 336c6b604e747456
!	Mem[0000000030081418] = 296a7add5650f73a
	add	%i2,0x018,%g1
	stda	%f8,[%g1+%l1]ASI_PST8_S ! Mem[0000000030081418] = 29007aff5600003a
!	Mem[0000000010081408] = 4b7f7ac8, %l7 = 00000000000000ff
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 000000c8000000ff
!	%f20 = ffb719ff, Mem[0000000010181428] = 2dcf9a9d
	st	%f20,[%i6+0x028]	! Mem[0000000010181428] = ffb719ff
!	Mem[0000000030041410] = 00000fa9, %l0 = cc93949fb18b8897
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 000000a9000000ff
!	%l1 = 336c6b604e747456, Mem[00000000100c142c] = b4a4777a
	stw	%l1,[%i3+0x02c]		! Mem[00000000100c142c] = 4e747456
!	Mem[0000000030001408] = ff36ffff, %l1 = 336c6b604e747456
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 00000000ff36ffff
!	%l1 = 00000000ff36ffff, Mem[0000000010101400] = fc51a9ff
	stba	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = fc51a9ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ef7315dc000000ff, %f30 = ff000000 fc51a9ff
	ldda	[%i0+%g0]0x89,%f30	! %f30 = ef7315dc 000000ff

p0_label_111:
!	Mem[0000000030081400] = 000000ff, %l1 = 00000000ff36ffff
	ldsba	[%i2+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181400] = 000f0000, %l0 = 00000000000000a9
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = c69b0000, %l5 = ffffffffffffef5e
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = ffffffffffffffc6
!	Mem[0000000010081408] = de1a96d2 4b7f7aff, %l4 = ff36ffff, %l5 = ffffffc6
	ldda	[%i2+%o4]0x88,%l4	! %l4 = 000000004b7f7aff 00000000de1a96d2
!	Mem[00000000100c1408] = 000000ff, %l3 = 00000000000000ff
	ldswa	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000020800040] = 61ff0345, %l7 = 00000000000000c8
	ldsh	[%o1+0x040],%l7		! %l7 = 00000000000061ff
!	Mem[0000000030181408] = ffff36ff00000000, %f18 = 00000aa1 00000000
	ldda	[%i6+%o4]0x89,%f18	! %f18 = ffff36ff 00000000
!	Mem[0000000010041408] = ff000000, %f22 = ffa951fc
	lda	[%i1+%o4]0x88,%f22	! %f22 = ff000000
!	Mem[0000000010181410] = a90f0000, %l7 = 00000000000061ff
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = ffffffffffffa90f
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ff0000fc, %l4 = 000000004b7f7aff
	swapa	[%i2+%o5]0x88,%l4	! %l4 = 00000000ff0000fc

p0_label_112:
!	%l2 = 000000000000ffb3, imm = 0000000000000799, %l6 = 000000000000001a
	or	%l2,0x799,%l6		! %l6 = 000000000000ffbb
!	%f14 = c69fcf89 cb6cf47b, Mem[0000000010041400] = 00000000 000000ff
	std	%f14,[%i1+%g0]	! Mem[0000000010041400] = c69fcf89 cb6cf47b
!	%l2 = 0000ffb3, %l3 = 000000ff, Mem[0000000010141400] = 7a77a4b4 00000000
	stda	%l2,[%i5+0x000]%asi	! Mem[0000000010141400] = 0000ffb3 000000ff
!	Mem[0000000030141400] = 01e7ffe7, %l7 = ffffffffffffa90f
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 000000e7000000ff
!	%l3 = 00000000000000ff, %l7 = 00000000000000e7, %l0  = 0000000000000000
	mulx	%l3,%l7,%l0		! %l0 = 000000000000e619
!	Mem[00000000201c0000] = ffb3de6c, %l3 = 00000000000000ff
	ldstub	[%o0+%g0],%l3		! %l3 = 000000ff000000ff
!	%f21 = ef7315dc, Mem[000000001014141c] = 00000071
	sta	%f21,[%i5+0x01c]%asi	! Mem[000000001014141c] = ef7315dc
!	%l1 = ffffffffffffffff, Mem[0000000030181408] = ffff36ff00000000
	stxa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffffffffffff
!	Mem[0000000010101418] = ffffff7f, %l4 = 00000000ff0000fc
	swap	[%i4+0x018],%l4		! %l4 = 00000000ffffff7f
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 020000004b7f7aff, %f18 = ffff36ff 00000000
	ldda	[%i2+%o5]0x88,%f18	! %f18 = 02000000 4b7f7aff

p0_label_113:
!	Mem[0000000030001400] = ff000000dc1573ef, %f28 = 02f1857b 367a61e7
	ldda	[%i0+%g0]0x81,%f28	! %f28 = ff000000 dc1573ef
!	Mem[0000000010041408] = ff000000, %l4 = 00000000ffffff7f
	ldswa	[%i1+%o4]0x88,%l4	! %l4 = ffffffffff000000
!	Mem[0000000030081408] = 9d9acf2d, %l4 = ffffffffff000000
	lduwa	[%i2+%o4]0x81,%l4	! %l4 = 000000009d9acf2d
!	Mem[00000000100c1410] = ffffffffffffef5e, %f20 = ffb719ff ef7315dc
	ldda	[%i3+%o5]0x80,%f20	! %f20 = ffffffff ffffef5e
!	Mem[0000000020800000] = ffff68e7, %l6 = 000000000000ffbb
	ldsb	[%o1+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010041400] = c69fcf89cb6cf47b, %f10 = 2dcf9a9d b4a4777a
	ldda	[%i1+%g0]0x80,%f10	! %f10 = c69fcf89 cb6cf47b
!	Mem[00000000100c1408] = e7ffe701 000000ff, %l6 = ffffffff, %l7 = 000000e7
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ff 00000000e7ffe701
!	Mem[0000000030041400] = ff000000, %f23 = 00000000
	lda	[%i1+%g0]0x89,%f23	! %f23 = ff000000
!	Mem[0000000010041400] = c69fcf89, %l4 = 000000009d9acf2d
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000c6
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000010001438] = 7bf46ccb89cf9fc6
	stx	%l3,[%i0+0x038]		! Mem[0000000010001438] = 00000000000000ff

p0_label_114:
!	%l0 = 0000e619, %l1 = ffffffff, Mem[0000000010041408] = 000000ff 6081bef2
	std	%l0,[%i1+%o4]		! Mem[0000000010041408] = 0000e619 ffffffff
!	Mem[00000000201c0001] = ffb3de6c, %l4 = 00000000000000c6
	ldstub	[%o0+0x001],%l4		! %l4 = 000000b3000000ff
!	Mem[0000000010081401] = 71000000, %l3 = 00000000000000ff
	ldstuba	[%i2+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1400] = 000000ff, %l7 = 00000000e7ffe701
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l1 = ffffffffffffffff, Mem[0000000010181400] = 000000ff, %asi = 80
	stha	%l1,[%i6+0x000]%asi	! Mem[0000000010181400] = ffff00ff
!	%l7 = 00000000000000ff, Mem[0000000030041400] = ff000000
	stwa	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	%f22 = ff000000 ff000000, %l1 = ffffffffffffffff
!	Mem[0000000030181410] = 3bdcffff3e9d120f
	add	%i6,0x010,%g1
	stda	%f22,[%g1+%l1]ASI_PST8_S ! Mem[0000000030181410] = ff000000ff000000
!	%l2 = 000000000000ffb3, Mem[0000000030041408] = ffff36ff
	stha	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = ffb336ff
!	%f26 = ff0a3bff 9d9acf2d, Mem[0000000010141438] = ffb3c4fb 00000000
	stda	%f26,[%i5+0x038]%asi	! Mem[0000000010141438] = ff0a3bff 9d9acf2d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 01e7ffe7, %l2 = 000000000000ffb3
	ldsha	[%i3+%g0]0x88,%l2	! %l2 = ffffffffffffffe7

p0_label_115:
!	Mem[0000000010001414] = b3ffffff, %l7 = 00000000000000ff
	ldub	[%i0+0x017],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010001400] = 00000000, %l1 = ffffffffffffffff
	lduha	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = ffffe70100000038, %l1 = 0000000000000000
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = ffffe70100000038
!	Mem[0000000010081430] = 1a1ec5fc7178a96b, %l7 = 00000000000000ff
	ldx	[%i2+0x030],%l7		! %l7 = 1a1ec5fc7178a96b
!	Mem[0000000010001408] = e7ffe701, %f13 = dc1573ef
	lda	[%i0+%o4]0x80,%f13	! %f13 = e7ffe701
!	Mem[0000000030041408] = ffb336ff01e7ffe7, %l0 = 000000000000e619
	ldxa	[%i1+%o4]0x81,%l0	! %l0 = ffb336ff01e7ffe7
!	Mem[00000000201c0000] = ffffde6c, %l2 = ffffffffffffffe7
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[00000000201c0000] = ffffde6c, %l1 = ffffe70100000038
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Code Fragment 4
p0_fragment_9:
!	%l0 = ffb336ff01e7ffe7
	setx	0x8bdb3327c963a07e,%g7,%l0 ! %l0 = 8bdb3327c963a07e
!	%l1 = 000000000000ffff
	setx	0x4b479e90099baf7b,%g7,%l1 ! %l1 = 4b479e90099baf7b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8bdb3327c963a07e
	setx	0xf657db1fb8f7da06,%g7,%l0 ! %l0 = f657db1fb8f7da06
!	%l1 = 4b479e90099baf7b
	setx	0x54f4450fc717ba18,%g7,%l1 ! %l1 = 54f4450fc717ba18
!	Starting 10 instruction Store Burst
!	%f2  = 00000000, Mem[0000000010001408] = e7ffe701
	sta	%f2 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000

p0_label_116:
!	%f30 = ef7315dc 000000ff, Mem[0000000010041400] = 89cf9fc6 7bf46ccb
	stda	%f30,[%i1+%g0]0x88	! Mem[0000000010041400] = ef7315dc 000000ff
!	Mem[0000000021800041] = ff866a20, %l0 = f657db1fb8f7da06
	ldstuba	[%o3+0x041]%asi,%l0	! %l0 = 00000086000000ff
!	%l7 = 1a1ec5fc7178a96b, Mem[0000000010001410] = 5eefffff
	stha	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = a96bffff
!	Mem[0000000030081410] = ff19b7ff, %l0 = 0000000000000086
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 00000000ff19b7ff
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041408] = 19e60000, %l2 = 000000000000ffff
	swapa	[%i1+%o4]0x88,%l2	! %l2 = 0000000019e60000
!	%l7 = 1a1ec5fc7178a96b, Mem[0000000010001434] = 71000000
	stw	%l7,[%i0+0x034]		! Mem[0000000010001434] = 7178a96b
!	Mem[0000000010081410] = ff7a7f4b, %l6 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%l7 = 1a1ec5fc7178a96b, Mem[00000000100c1408] = 000000ff
	stha	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000a96b
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000ff, %l7 = 1a1ec5fc7178a96b
	lduwa	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000ff

p0_label_117:
!	Mem[0000000030081400] = e7ffe701000000ff, %f16 = ff000000 01e7ffe7
	ldda	[%i2+%g0]0x89,%f16	! %f16 = e7ffe701 000000ff
!	Mem[0000000010141408] = 000000ff, %l2 = 0000000019e60000
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f29 = dc1573ef, %f12 = ff000000, %f25 = 01e7ffe7
	fmuls	%f29,%f12,%f25		! %f25 = 7f800000
!	Mem[00000000300c1410] = 00000000, %l5 = 00000000de1a96d2
	ldsha	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010141400] = 0000ffb3 000000ff ff000000 000000d1
!	Mem[0000000010141410] = ff36ffff 9d9acf2d 7a0000ff ef7315dc
!	Mem[0000000010141420] = 9d00a086 cb6cf47b 7a360000 85d60000
!	Mem[0000000010141430] = 00000000 7bf45eef ff0a3bff 9d9acf2d
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000010001410] = a96bffffb3ffffff, %f14 = c69fcf89 cb6cf47b
	ldda	[%i0+%o5]0x80,%f14	! %f14 = a96bffff b3ffffff
!	Mem[00000000100c1410] = ffffffff, %l7 = 00000000000000ff
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010141408] = 000000ff, %l5 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181408] = ffffffffffffffff, %l7 = 000000000000ffff
	ldxa	[%i6+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030101410] = 38000000
	stwa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000

p0_label_118:
!	Mem[00000000100c1400] = 01e7ffe7, %l5 = 00000000000000ff
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 000000e7000000ff
!	%l6 = 00000000000000ff, Mem[0000000030141408] = 2cc99bc6
	stha	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ff9bc6
	membar	#Sync			! Added by membar checker (23)
!	%l2 = 00000000000000ff, Mem[000000001014140e] = 000000d1
	sth	%l2,[%i5+0x00e]		! Mem[000000001014140c] = 000000ff
!	%l4 = 00000000000000b3, Mem[0000000030041400] = ff000000
	stwa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000b3
!	%l6 = 00000000000000ff, Mem[0000000030141408] = 00000000c69bff00
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000000000ff
!	%l5 = 00000000000000e7, Mem[000000001000140c] = ff36ffff, %asi = 80
	stwa	%l5,[%i0+0x00c]%asi	! Mem[000000001000140c] = 000000e7
!	Mem[00000000100c1400] = 01e7ffff, %l4 = 00000000000000b3
	lduha	[%i3+%g0]0x88,%l4	! %l4 = 000000000000ffff
!	%l5 = 00000000000000e7, Mem[0000000010081410] = 4b7f7aff
	stba	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 4b7f7ae7
!	%l6 = 000000ff, %l7 = ffffffff, Mem[0000000010181400] = ffff00ff 00000000
	std	%l6,[%i6+%g0]		! Mem[0000000010181400] = 000000ff ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ffffffff, %l0 = 00000000ff19b7ff
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = ffffffffffffffff

p0_label_119:
!	Mem[0000000030101408] = ffffffff, %f30 = ff0a3bff
	lda	[%i4+%o4]0x89,%f30	! %f30 = ffffffff
!	Mem[0000000030081410] = dc1573ef 00000086, %l0 = ffffffff, %l1 = c717ba18
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000086 00000000dc1573ef
!	Mem[0000000010141404] = 000000ff, %l0 = 0000000000000086
	lduw	[%i5+0x004],%l0		! %l0 = 00000000000000ff
!	Mem[00000000201c0000] = ffffde6c, %l4 = 000000000000ffff
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = e77a7f4b, %l6 = 00000000000000ff
	ldsba	[%i2+%o5]0x80,%l6	! %l6 = ffffffffffffffe7
!	Mem[0000000010081438] = 00006130, %l1 = 00000000dc1573ef
	ldsha	[%i2+0x038]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800000] = ffff68e7, %l3 = 0000000000000000
	ldsh	[%o1+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010081400] = 71ff0000 ef7315dc, %l2 = 000000ff, %l3 = ffffffff
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 0000000071ff0000 00000000ef7315dc
!	Mem[0000000010041410] = ffa951fc6fff1394, %f4  = a90f0000 ff000000
	ldda	[%i1+%o5]0x80,%f4 	! %f4  = ffa951fc 6fff1394
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1404] = 00000000, %l2 = 71ff0000, %l3 = ef7315dc
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 0000000000000000

p0_label_120:
!	%f6  = e7ffe701, %f16 = 0000ffb3, %f29 = 7bf45eef
	fdivs	%f6 ,%f16,%f29		! %f29 = ff800000
!	Mem[0000000021800141] = ff7af79c, %l2 = 0000000071ff0000
	ldstuba	[%o3+0x141]%asi,%l2	! %l2 = 0000007a000000ff
!	Mem[0000000010001400] = 00000000, %l4 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081424] = 4b7f7ac8, %l1 = 0000000000000000
	ldstub	[%i2+0x024],%l1		! %l1 = 0000004b000000ff
!	%f28 = 00000000, Mem[000000001008143c] = 00000071
	st	%f28,[%i2+0x03c]	! Mem[000000001008143c] = 00000000
!	%f2  = 00000000 ff000000, Mem[0000000010041410] = ffa951fc 6fff1394
	stda	%f2 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 ff000000
!	%l2 = 000000000000007a, Mem[0000000010081410] = e77a7f4b
	stwa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000007a
!	%f5  = 6fff1394, Mem[000000001010140c] = ba5f557a
	sta	%f5 ,[%i4+0x00c]%asi	! Mem[000000001010140c] = 6fff1394
!	%l5 = 00000000000000e7, Mem[0000000010001408] = 00000000
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000e7
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff622e, %l3 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000ffff

p0_label_121:
!	Mem[0000000010041400] = ff000000, %l0 = 00000000000000ff
	lduha	[%i1+%g0]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[00000000100c1400] = ffffe701, %l7 = ffffffffffffffff
	ldswa	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffffe701
!	Mem[0000000030001408] = 4e747456, %l5 = 00000000000000e7
	lduha	[%i0+%o4]0x81,%l5	! %l5 = 0000000000004e74
!	%f26 = 7a360000, %f13 = e7ffe701
	fcmps	%fcc2,%f26,%f13		! %fcc2 = 2
!	Mem[0000000010081408] = ff7a7f4bd2961ade, %f8  = 000000ff 00000000
	ldda	[%i2+0x008]%asi,%f8 	! %f8  = ff7a7f4b d2961ade
!	Mem[0000000020800040] = 61ff0345, %l3 = 000000000000ffff
	ldsba	[%o1+0x041]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101410] = 02000000 00009bc6, %l0 = 0000ff00, %l1 = 0000004b
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 0000000000009bc6 0000000002000000
!	Mem[0000000030141410] = ff000000, %l4 = 0000000000000000
	lduha	[%i5+%o5]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030181408] = ffffffff ffffffff, %l2 = 0000007a, %l3 = ffffffff
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 00000000ffffffff 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%f28 = 00000000 ff800000, %l0 = 0000000000009bc6
!	Mem[0000000010041418] = 00000000000000ff
	add	%i1,0x018,%g1
	stda	%f28,[%g1+%l0]ASI_PST8_P ! Mem[0000000010041418] = 00000000008000ff

p0_label_122:
!	%l6 = ffffffe7, %l7 = ffffe701, Mem[00000000300c1400] = 00000000 00000000
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffe7 ffffe701
!	%f22 = 7a0000ff, Mem[000000001000140c] = 000000e7
	sta	%f22,[%i0+0x00c]%asi	! Mem[000000001000140c] = 7a0000ff
!	%f20 = ff36ffff 9d9acf2d, Mem[0000000030141408] = ff000000 00000000
	stda	%f20,[%i5+%o4]0x81	! Mem[0000000030141408] = ff36ffff 9d9acf2d
!	%l7 = ffffffffffffe701, Mem[0000000010141408] = ff000000000000ff
	stxa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffffffffe701
!	Mem[0000000010101410] = 00009bc6, %l3 = 00000000ffffffff
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 000000c6000000ff
!	%f10 = c69fcf89 cb6cf47b, Mem[0000000030101408] = ffffffff ba5f557a
	stda	%f10,[%i4+%o4]0x89	! Mem[0000000030101408] = c69fcf89 cb6cf47b
!	Mem[0000000010041425] = c98eff12, %l0 = 0000000000009bc6
	ldstub	[%i1+0x025],%l0		! %l0 = 0000008e000000ff
!	%l1 = 0000000002000000, Mem[00000000100c1400] = ffffe70100000000
	stxa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000002000000
!	%l6 = ffffffffffffffe7, Mem[000000001010143c] = ef5ef47b, %asi = 80
	stha	%l6,[%i4+0x03c]%asi	! Mem[000000001010143c] = ffe7f47b
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffffde6c, %l6 = ffffffffffffffe7
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000ffff

p0_label_123:
!	Mem[0000000030001400] = 000000ff, %l4 = 000000000000ff00
	lduwa	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l0 = 000000000000008e
	ldsha	[%i4+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 000000c66fff1394, %l3 = 00000000000000c6
	ldxa	[%i4+%o4]0x80,%l3	! %l3 = 000000c66fff1394
!	Mem[0000000010041410] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l0 = 0000000000000000, %l5 = 0000000000004e74, %l7 = ffffffffffffe701
	add	%l0,%l5,%l7		! %l7 = 0000000000004e74
!	Mem[0000000030001408] = 4e747456, %l6 = 000000000000ffff
	ldswa	[%i0+%o4]0x81,%l6	! %l6 = 000000004e747456
!	Mem[0000000010001418] = b4a4777a 5650f73a, %l2 = ffffffff, %l3 = 6fff1394
	ldd	[%i0+0x018],%l2		! %l2 = 00000000b4a4777a 000000005650f73a
!	Mem[0000000030081400] = ff000000 01e7ffe7 9d9acf2d dd7a6a29
!	Mem[0000000030081410] = 86000000 ef7315dc 29007aff 5600003a
!	Mem[0000000030081420] = be6494a6 0e14473c 7a77a4b4 9d9acf2d
!	Mem[0000000030081430] = 02f1857b 367a61e7 7bf46ccb 890d9fc6
	ldda	[%i2]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	Mem[0000000030101400] = c69bc92c, %f11 = cb6cf47b
	lda	[%i4+%g0]0x81,%f11	! %f11 = c69bc92c
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000004e74, Mem[0000000010081408] = 4b7f7aff
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 00004e74

p0_label_124:
!	%l7 = 0000000000004e74, Mem[0000000010181410] = a90f0000
	stba	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 740f0000
!	%l2 = 00000000b4a4777a, Mem[0000000030001410] = 00000000
	stwa	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = b4a4777a
!	%f12 = ff000000, Mem[00000000100c1400] = 00000000
	sta	%f12,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff000000
!	Mem[0000000030041408] = ffb336ff, %l7 = 0000000000004e74
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 00000000ffb336ff
!	%l2 = 00000000b4a4777a, Mem[0000000010081418] = b21980c46fb71394
	stx	%l2,[%i2+0x018]		! Mem[0000000010081418] = 00000000b4a4777a
!	%f6  = e7ffe701 2cc99bc6, Mem[0000000030101408] = cb6cf47b c69fcf89
	stda	%f6 ,[%i4+%o4]0x89	! Mem[0000000030101408] = e7ffe701 2cc99bc6
!	Code Fragment 4
p0_fragment_10:
!	%l0 = 0000000000000000
	setx	0x667f8e406ce03a0e,%g7,%l0 ! %l0 = 667f8e406ce03a0e
!	%l1 = 0000000002000000
	setx	0xd5e4f5202403d063,%g7,%l1 ! %l1 = d5e4f5202403d063
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 667f8e406ce03a0e
	setx	0x29de7fa01cd2ed7e,%g7,%l0 ! %l0 = 29de7fa01cd2ed7e
!	%l1 = d5e4f5202403d063
	setx	0xb18a81000ef23d33,%g7,%l1 ! %l1 = b18a81000ef23d33
!	%l0 = 1cd2ed7e, %l1 = 0ef23d33, Mem[0000000010041400] = 000000ff ef7315dc
	stda	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 1cd2ed7e 0ef23d33
!	Mem[0000000010181400] = ff000000, %l0 = 29de7fa01cd2ed7e
	ldstuba	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = ffff6a20, %l4 = 0000000000000000
	lduba	[%o3+0x040]%asi,%l4	! %l4 = 00000000000000ff

p0_label_125:
!	Mem[0000000010081410] = 7a000000, %l6 = 000000004e747456
	ldsba	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = ffff36ff, %l2 = 00000000b4a4777a
	lduha	[%i5+%o4]0x89,%l2	! %l2 = 00000000000036ff
!	Mem[0000000010181428] = ffb719ff, %l7 = 00000000ffb336ff
	ldswa	[%i6+0x028]%asi,%l7	! %l7 = ffffffffffb719ff
!	Mem[0000000030141400] = ffffe701, %l6 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 740f0000ff000000, %f2  = 00000000 ff000000
	ldda	[%i6+%o5]0x80,%f2 	! %f2  = 740f0000 ff000000
!	Mem[0000000030041400] = 00000000 b3000000, %l6 = 000000ff, %l7 = ffb719ff
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 00000000b3000000 0000000000000000
!	Mem[0000000010041438] = 408a7614, %f13 = e7ffe701
	lda	[%i1+0x038]%asi,%f13	! %f13 = 408a7614
!	Mem[00000000300c1410] = 00000000, %l6 = 00000000b3000000
	lduba	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141420] = 9d00a086cb6cf47b, %f12 = ff000000 408a7614
	ldda	[%i5+0x020]%asi,%f12	! %f12 = 9d00a086 cb6cf47b
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = ff000000, %l2 = 00000000000036ff
	swapa	[%i0+%g0]0x81,%l2	! %l2 = 00000000ff000000

p0_label_126:
!	%l6 = 0000000000000000, %l5 = 0000000000004e74, %y  = ffffffe9
	sdiv	%l6,%l5,%l6		! %l6 = ffffffffffb4f2e6
	mov	%l0,%y			! %y = 00000000
!	%f16 = ff000000 01e7ffe7, %l0 = 0000000000000000
!	Mem[0000000030181418] = dd372ab37fffffff
	add	%i6,0x018,%g1
	stda	%f16,[%g1+%l0]ASI_PST8_S ! Mem[0000000030181418] = dd372ab37fffffff
!	Mem[00000000100c1410] = ffffffff, %l3 = 000000005650f73a
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 00000000ffffffff
!	%l6 = ffffffffffb4f2e6, Mem[0000000010101420] = 12ff8ec9000000e7
	stx	%l6,[%i4+0x020]		! Mem[0000000010101420] = ffffffffffb4f2e6
!	Mem[0000000010181438] = c69fcf89cb6cf47b, %l5 = 0000000000004e74, %l2 = 00000000ff000000
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = c69fcf89cb6cf47b
!	%l4 = 00000000000000ff, Mem[00000000211c0000] = ffff622e
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 00ff622e
!	%f14 = a96bffff, Mem[00000000300c1400] = e7ffffff
	sta	%f14,[%i3+%g0]0x89	! Mem[00000000300c1400] = a96bffff
!	Mem[0000000030101410] = 00000000, %l1 = b18a81000ef23d33
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 1cd2ed7e, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 0000007e000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff000000, %f5  = 6fff1394
	lda	[%i3+%g0]0x88,%f5 	! %f5 = ff000000

p0_label_127:
!	Mem[0000000010101400] = ffa951fc, %l0 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181408] = e7ffe701ff36ffff, %f22 = 29007aff 5600003a
	ldda	[%i6+%o4]0x88,%f22	! %f22 = e7ffe701 ff36ffff
!	Mem[0000000030081410] = 86000000, %l1 = 000000000000007e
	lduwa	[%i2+%o5]0x81,%l1	! %l1 = 0000000086000000
!	Mem[0000000010081420] = de1a96d2ff7f7ac8, %l3 = 00000000ffffffff
	ldx	[%i2+0x020],%l3		! %l3 = de1a96d2ff7f7ac8
!	Mem[0000000020800040] = 61ff0345, %l7 = 0000000000000000
	ldsh	[%o1+0x040],%l7		! %l7 = 00000000000061ff
!	Mem[0000000010041408] = ffff0000ffffffff, %f14 = a96bffff b3ffffff
	ldda	[%i1+%o4]0x80,%f14	! %f14 = ffff0000 ffffffff
!	Mem[0000000010181410] = 00000f74, %l3 = de1a96d2ff7f7ac8
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000f74
!	Mem[0000000010141400] = ff000000b3ff0000, %f22 = e7ffe701 ff36ffff
	ldda	[%i5+%g0]0x88,%f22	! %f22 = ff000000 b3ff0000
!	Mem[00000000211c0000] = 00ff622e, %l1 = 0000000086000000
	ldsb	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffff, %l1 = 00000000, Mem[0000000010181410] = 740f0000 ff000000
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffff 00000000

p0_label_128:
	membar	#Sync			! Added by membar checker (24)
!	%l5 = 0000000000004e74, Mem[0000000030081410] = 00000086
	stba	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000074
!	%l0 = ffffffffffffffff, Mem[0000000030141410] = 000000ff
	stha	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ffff
!	%l3 = 0000000000000f74, %l5 = 0000000000004e74, %l3 = 0000000000000f74
	andn	%l3,%l5,%l3		! %l3 = 0000000000000100
!	Mem[0000000030181400] = 00000f00, %l2 = c69fcf89cb6cf47b
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[00000000100c1408] = 6ba9000001e7ffe7
	stx	%l1,[%i3+%o4]		! Mem[00000000100c1408] = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000030101400] = 2cc99bc6
	stha	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 2cc900ff
!	%l6 = ffb4f2e6, %l7 = 000061ff, Mem[0000000030041410] = 00000fff 000000ff
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = ffb4f2e6 000061ff
!	%f13 = cb6cf47b, %f2  = 740f0000
	fcmpes	%fcc0,%f13,%f2 		! %fcc0 = 1
!	%l1 = 0000000000000000, Mem[0000000010041408] = ffff0000
	stha	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 026e1af7, %l3 = 0000000000000100
	ldsb	[%o3+0x181],%l3		! %l3 = 000000000000006e

p0_label_129:
!	Mem[0000000010001408] = ff00007a 000000e7, %l2 = 00000000, %l3 = 0000006e
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000e7 00000000ff00007a
!	Mem[00000000211c0000] = 00ff622e, %l3 = 00000000ff00007a
	lduh	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010141400] = 0000ffb3000000ff, %f26 = 7a77a4b4 9d9acf2d
	ldda	[%i5+%g0]0x80,%f26	! %f26 = 0000ffb3 000000ff
!	%l4 = 00000000000000ff, immed = fffffadc, %y  = 00000000
	sdiv	%l4,-0x524,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000021800180] = 026e1af7, %l3 = 00000000000000ff
	lduha	[%o3+0x180]%asi,%l3	! %l3 = 000000000000026e
!	Mem[0000000010001420] = 4398689c, %f10 = c69fcf89
	ld	[%i0+0x020],%f10	! %f10 = 4398689c
!	Mem[0000000010041408] = 00000000, %l3 = 000000000000026e
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	%f17 = 01e7ffe7, %f10 = 4398689c, %f9  = d2961ade
	fmuls	%f17,%f10,%f9 		! %f9  = 060a1ebe
!	%f30 = 7bf46ccb, %f14 = ffff0000, %f0  = 00000000 000000d1
	fsmuld	%f30,%f14,%f0 		! %f0  = ffffe000 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1426] = 9c689843, %l6 = ffffffffffb4f2e6
	ldstub	[%i3+0x026],%l6		! %l6 = 00000098000000ff

p0_label_130:
!	%f24 = be6494a6, Mem[0000000010101400] = ffa951fc
	sta	%f24,[%i4+%g0]0x80	! Mem[0000000010101400] = be6494a6
!	%f30 = 7bf46ccb, %f19 = dd7a6a29
	fcmps	%fcc2,%f30,%f19		! %fcc2 = 2
!	Mem[0000000010081410] = 7a000000, %l7 = 00000000000061ff
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 000000007a000000
!	Mem[00000000201c0001] = ffffde6c, %l2 = 00000000000000e7
	ldstub	[%o0+0x001],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000030101408] = c69bc92c, %l5 = 0000000000004e74
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 000000c6000000ff
!	Mem[0000000010141400] = b3ff0000, %l7 = 000000007a000000
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 00000000b3ff0000
!	Mem[0000000030141410] = 0000ffff, %l4 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%f8  = ff7a7f4b 060a1ebe, Mem[0000000010101428] = 2dcf9a9d b4a4777a
	stda	%f8 ,[%i4+0x028]%asi	! Mem[0000000010101428] = ff7a7f4b 060a1ebe
!	%f14 = ffff0000, %f24 = be6494a6, %f22 = ff000000 b3ff0000
	fsmuld	%f14,%f24,%f22		! %f22 = ffffe000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000000005674744e, %f14 = ffff0000 ffffffff
	ldda	[%i0+%o4]0x89,%f14	! %f14 = 00000000 5674744e

p0_label_131:
!	Mem[0000000010001408] = e7000000, %l0 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffffe700
!	Mem[0000000030141410] = ffff0000, %l0 = ffffffffffffe700
	ldsba	[%i5+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101400] = be6494a6ffff777a, %f20 = 86000000 ef7315dc
	ldda	[%i4+%g0]0x80,%f20	! %f20 = be6494a6 ffff777a
!	Mem[0000000010081408] = 744e0000d2961ade, %f0  = ffffe000 00000000
	ldda	[%i2+%o4]0x80,%f0 	! %f0  = 744e0000 d2961ade
!	Mem[0000000030101400] = ff00c92c01e7ffe7, %f22 = ffffe000 00000000
	ldda	[%i4+%g0]0x81,%f22	! %f22 = ff00c92c 01e7ffe7
!	Mem[0000000030081408] = 296a7add 2dcf9a9d, %l4 = 000000ff, %l5 = 000000c6
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 000000002dcf9a9d 00000000296a7add
!	Mem[0000000010001400] = ff000000 ffb3c4fb, %l4 = 2dcf9a9d, %l5 = 296a7add
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 00000000ff000000 00000000ffb3c4fb
!	Mem[0000000010081400] = dc1573ef0000ff71, %l2 = 00000000000000ff
	ldxa	[%i2+%g0]0x88,%l2	! %l2 = dc1573ef0000ff71
!	Mem[0000000010141418] = 7a0000ffef7315dc, %f8  = ff7a7f4b 060a1ebe
	ldd	[%i5+0x018],%f8 	! %f8  = 7a0000ff ef7315dc
!	Starting 10 instruction Store Burst
!	%l2 = 0000ff71, %l3 = 00000000, Mem[0000000010081410] = ff610000 00000002
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000ff71 00000000

p0_label_132:
!	%f2  = 740f0000 ff000000, Mem[0000000010101408] = 000000c6 6fff1394
	stda	%f2 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 740f0000 ff000000
!	Mem[000000001010141f] = b32a37dd, %l2 = dc1573ef0000ff71
	ldstub	[%i4+0x01f],%l2		! %l2 = 000000dd000000ff
!	%f2  = 740f0000, Mem[0000000010181400] = ff0000ff
	sta	%f2 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 740f0000
!	%f0  = 744e0000 d2961ade, Mem[00000000100c1428] = 2dcf9a9d 4e747456
	std	%f0 ,[%i3+0x028]	! Mem[00000000100c1428] = 744e0000 d2961ade
!	%f8  = 7a0000ff, Mem[0000000030041410] = ffb4f2e6
	sta	%f8 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 7a0000ff
!	%l4 = ff000000, %l5 = ffb3c4fb, Mem[0000000010001408] = e7000000 7a0000ff
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000 ffb3c4fb
!	Mem[00000000300c1408] = ff0a3bff, %l0 = ffffffffffffffff
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = ffffffffffffff0a
!	Mem[0000000010141410] = ffff36ff, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 00000000ffff36ff
!	Mem[00000000300c1408] = ff3b0aff, %l4 = 00000000ff000000
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 00000000ff3b0aff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffffffff, %l6 = 0000000000000098
	lduha	[%i6+%o4]0x89,%l6	! %l6 = 000000000000ffff

p0_label_133:
!	Mem[0000000010101420] = ffffffffffb4f2e6, %f28 = 02f1857b 367a61e7
	ldd	[%i4+0x020],%f28	! %f28 = ffffffff ffb4f2e6
!	Mem[0000000010141414] = 9d9acf2d, %l3 = 00000000ffff36ff
	ldswa	[%i5+0x014]%asi,%l3	! %l3 = ffffffff9d9acf2d
!	Mem[0000000030101400] = ff00c92c, %l1 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l1	! %l1 = 00000000ff00c92c
!	Mem[0000000030081400] = 000000ff, %l3 = ffffffff9d9acf2d
	lduba	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000021800040] = ffff6a20, %l5 = 00000000ffb3c4fb
	lduba	[%o3+0x040]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041438] = 408a7614, %l3 = 00000000000000ff
	ldswa	[%i1+0x038]%asi,%l3	! %l3 = 00000000408a7614
!	Mem[0000000010101410] = 00009bff, %l1 = 00000000ff00c92c
	ldsha	[%i4+%o5]0x88,%l1	! %l1 = ffffffffffff9bff
!	Mem[0000000010041408] = 00000000, %f4  = ffa951fc
	lda	[%i1+%o4]0x80,%f4 	! %f4 = 00000000
!	Mem[0000000010081420] = de1a96d2, %l2 = 00000000000000dd
	ldsba	[%i2+0x022]%asi,%l2	! %l2 = ffffffffffffff96
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000ffff, Mem[0000000030101408] = ff9bc92c
	stwa	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ffff

p0_label_134:
!	%l0 = ffffffffffffff0a, Mem[00000000100c1408] = 00000000
	stwa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffff0a
!	%l4 = 00000000ff3b0aff, Mem[0000000030141400] = ffffe701
	stwa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = ff3b0aff
!	Mem[0000000010001408] = ff000000, %l7 = 00000000b3ff0000
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	%l3 = 00000000408a7614, Mem[0000000030181408] = ffffffff
	stwa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 408a7614
!	%l1 = ffffffffffff9bff, Mem[0000000010041413] = 00000000, %asi = 80
	stba	%l1,[%i1+0x013]%asi	! Mem[0000000010041410] = 000000ff
!	Mem[00000000100c1420] = 7b85f102, %l1 = ffffffffffff9bff, %asi = 80
	swapa	[%i3+0x020]%asi,%l1	! %l1 = 000000007b85f102
!	%f22 = ff00c92c, Mem[0000000030081410] = 00000074
	sta	%f22,[%i2+%o5]0x89	! Mem[0000000030081410] = ff00c92c
!	%l6 = 0000ffff, %l7 = 000000ff, Mem[0000000030041408] = 00004e74 01e7ffe7
	stda	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000ffff 000000ff
!	%l0 = ffffffffffffff0a, Mem[0000000010101408] = 00000f74
	stha	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000ff0a
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000030101400] = ff00c92c 01e7ffe7 0000ffff 01e7ffe7
!	Mem[0000000030101410] = 0ef23d33 fcc51e1a 296a7add 5650f73a
!	Mem[0000000030101420] = be6494a6 0e14473c 7a77a4b4 9d9acf2d
!	Mem[0000000030101430] = 02f1857b 367a61e7 7bf46ccb 890d9fc6
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400

p0_label_135:
!	Mem[0000000030141410] = 0000ffff, %l0 = ffffffffffffff0a
	lduwa	[%i5+%o5]0x89,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010141408] = 01e7ffff, %l5 = 00000000000000ff
	ldswa	[%i5+%o4]0x80,%l5	! %l5 = 0000000001e7ffff
!	Mem[0000000010181400] = ffffffff 00000f74, %l6 = 0000ffff, %l7 = 000000ff
	ldda	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000f74 00000000ffffffff
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 000000000000ffff
	setx	0xac5cc7ffcff8c376,%g7,%l0 ! %l0 = ac5cc7ffcff8c376
!	%l1 = 000000007b85f102
	setx	0xba0da3d83f3e0744,%g7,%l1 ! %l1 = ba0da3d83f3e0744
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ac5cc7ffcff8c376
	setx	0xe3cda81825cf9e07,%g7,%l0 ! %l0 = e3cda81825cf9e07
!	%l1 = ba0da3d83f3e0744
	setx	0x821da8c8611051ae,%g7,%l1 ! %l1 = 821da8c8611051ae
!	Mem[00000000300c1400] = ffff6ba9 ffffe701, %l2 = ffffff96, %l3 = 408a7614
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 00000000ffff6ba9 00000000ffffe701
!	Mem[0000000010181400] = 740f0000 ffffffff, %l2 = ffff6ba9, %l3 = ffffe701
	ldda	[%i6+0x000]%asi,%l2	! %l2 = 00000000740f0000 00000000ffffffff
!	Mem[00000000300c1408] = ff000000, %l3 = 00000000ffffffff
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010001408] = ff000000, %l6 = 0000000000000f74
	lduh	[%i0+%o4],%l6		! %l6 = 000000000000ff00
!	Mem[0000000010101410] = ff9b0000, %l5 = 0000000001e7ffff
	ldsha	[%i4+%o5]0x80,%l5	! %l5 = ffffffffffffff9b
!	Starting 10 instruction Store Burst
!	%l1 = 821da8c8611051ae, Mem[00000000100c1400] = 000000ff
	stwa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 611051ae

p0_label_136:
!	%l6 = 000000000000ff00, Mem[0000000030141410] = ffff0000
	stha	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000
!	%l0 = e3cda81825cf9e07, Mem[0000000030041410] = 7a0000ff
	stba	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 7a000007
!	Mem[0000000010041400] = ffedd21c, %l3 = ffffffffff000000
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000ffedd21c
!	%l0 = 25cf9e07, %l1 = 611051ae, Mem[0000000010081418] = 00000000 b4a4777a
	stda	%l0,[%i2+0x018]%asi	! Mem[0000000010081418] = 25cf9e07 611051ae
!	%l6 = 000000000000ff00, Mem[0000000010141428] = 7a360000
	stb	%l6,[%i5+0x028]		! Mem[0000000010141428] = 00360000
!	%l6 = 000000000000ff00, Mem[0000000030141410] = 000000ff
	stwa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ff00
!	Mem[0000000030041400] = 000000b3, %l1 = 821da8c8611051ae
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141408] = ffff36ff, %l2 = 00000000740f0000
	ldstuba	[%i5+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%l5 = ffffffffffffff9b, Mem[0000000030181410] = ff000000ff000000
	stxa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffffffffff9b
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff000f00, %l6 = 000000000000ff00
	lduwa	[%i6+%g0]0x81,%l6	! %l6 = 00000000ff000f00

p0_label_137:
!	Mem[0000000010001400] = 000000ff, %l0 = e3cda81825cf9e07
	lduha	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = 71ff0000, %l5 = ffffffffffffff9b
	lduha	[%i2+%g0]0x80,%l5	! %l5 = 00000000000071ff
!	Mem[0000000010141400] = 0000007a, %l3 = 00000000ffedd21c
	ldsw	[%i5+%g0],%l3		! %l3 = 000000000000007a
!	Mem[0000000030141410] = 00ff0000, %l4 = 00000000ff3b0aff
	lduwa	[%i5+%o5]0x81,%l4	! %l4 = 0000000000ff0000
!	Mem[0000000030081408] = 9d9acf2ddd7a6a29, %l4 = 0000000000ff0000
	ldxa	[%i2+%o4]0x81,%l4	! %l4 = 9d9acf2ddd7a6a29
!	Mem[0000000010041408] = 00000000, %l4 = 9d9acf2ddd7a6a29
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 71ff0000, %l3 = 000000000000007a
	lduba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000071
!	Mem[0000000030181410] = ffffffff, %l5 = 00000000000071ff
	lduha	[%i6+%o5]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030101400] = ff00c92c, %l1 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l1	! %l1 = ffffffffff00c92c
!	Starting 10 instruction Store Burst
!	%l6 = ff000f00, %l7 = ffffffff, Mem[0000000010001408] = ff000000 ffb3c4fb
	stda	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000f00 ffffffff

p0_label_138:
!	%f18 = 9d9acf2d dd7a6a29, %l7 = 00000000ffffffff
!	Mem[0000000030181418] = dd372ab37fffffff
	add	%i6,0x018,%g1
	stda	%f18,[%g1+%l7]ASI_PST16_S ! Mem[0000000030181418] = 9d9acf2ddd7a6a29
!	Mem[0000000030041408] = 0000ffff, %l7 = 00000000ffffffff
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 000000000000ffff
!	%l3 = 0000000000000071, Mem[0000000030081408] = 296a7add2dcf9a9d
	stxa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000071
!	%f24 = be6494a6, Mem[0000000010041434] = 367a61e7
	sta	%f24,[%i1+0x034]%asi	! Mem[0000000010041434] = be6494a6
!	%l1 = ffffffffff00c92c, Mem[0000000010101408] = 0000ff0a
	stba	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000ff2c
!	%l4 = 00000000, %l5 = 0000ffff, Mem[00000000100c1400] = ae511061 00000002
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 0000ffff
!	%f14 = 7bf46ccb 890d9fc6, Mem[0000000010081400] = 71ff0000 ef7315dc
	stda	%f14,[%i2+%g0]0x80	! Mem[0000000010081400] = 7bf46ccb 890d9fc6
!	%f2  = 0000ffff, Mem[0000000010141410] = 00000000
	sta	%f2 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000ffff
!	%l0 = 00000000000000ff, Mem[0000000030001410] = 7a77a4b4
	stwa	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff000000, %l3 = 0000000000000071
	lduwa	[%i3+%o4]0x89,%l3	! %l3 = 00000000ff000000

p0_label_139:
!	Mem[0000000030041408] = ffffffff, %l2 = 00000000000000ff
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1408] = 000000ff, %l7 = 000000000000ffff
	lduwa	[%i3+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141410] = 0000ff00, %l5 = 000000000000ffff
	ldswa	[%i5+%o5]0x89,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010001410] = a96bffff, %l0 = 00000000000000ff
	lduha	[%i0+%o5]0x80,%l0	! %l0 = 000000000000a96b
!	Mem[0000000010041410] = 000000ffff000000, %f24 = be6494a6 0e14473c
	ldda	[%i1+%o5]0x80,%f24	! %f24 = 000000ff ff000000
!	Mem[0000000030081400] = ff000000, %f2  = 0000ffff
	lda	[%i2+%g0]0x81,%f2 	! %f2 = ff000000
!	Mem[0000000030081400] = e7ffe701000000ff, %l3 = 00000000ff000000
	ldxa	[%i2+%g0]0x89,%l3	! %l3 = e7ffe701000000ff
!	Mem[0000000010181438] = c69fcf89cb6cf47b, %l2 = ffffffffffffffff
	ldx	[%i6+0x038],%l2		! %l2 = c69fcf89cb6cf47b
!	Mem[0000000030041410] = 7a000007, %f24 = 000000ff
	lda	[%i1+%o5]0x89,%f24	! %f24 = 7a000007
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 0000ff00, Mem[0000000010081400] = 7bf46ccb 890d9fc6
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 0000ff00

p0_label_140:
!	%f15 = 890d9fc6, Mem[0000000030001410] = 000000ff
	sta	%f15,[%i0+%o5]0x81	! Mem[0000000030001410] = 890d9fc6
!	%l6 = 00000000ff000f00, Mem[0000000010041410] = 000000ffff000000, %asi = 80
	stxa	%l6,[%i1+0x010]%asi	! Mem[0000000010041410] = 00000000ff000f00
!	%l1 = ffffffffff00c92c, Mem[0000000010141436] = 7bf45eef
	stb	%l1,[%i5+0x036]		! Mem[0000000010141434] = 7bf42cef
!	%l1 = ffffffffff00c92c, Mem[00000000300c1400] = a96bffff
	stha	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = a96bc92c
!	Mem[0000000010141400] = 0000007a, %l5 = 000000000000ff00
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 000000000000007a
!	Mem[0000000010181410] = ffffffff, %l4 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l4	! %l4 = 00000000ffffffff
!	%f19 = dd7a6a29, Mem[0000000010081408] = 744e0000
	sta	%f19,[%i2+%o4]0x80	! Mem[0000000010081408] = dd7a6a29
!	%l7 = 00000000000000ff, Mem[000000001008142c] = 1fe2d6ae, %asi = 80
	stwa	%l7,[%i2+0x02c]%asi	! Mem[000000001008142c] = 000000ff
!	%f22 = ff00c92c, %f7  = 5650f73a
	fcmpes	%fcc0,%f22,%f7 		! %fcc0 = 1
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000f00ffffffff, %f26 = 0000ffb3 000000ff
	ldda	[%i0+%o4]0x80,%f26	! %f26 = ff000f00 ffffffff

p0_label_141:
!	Mem[0000000020800040] = 61ff0345, %l1 = ffffffffff00c92c
	ldub	[%o1+0x040],%l1		! %l1 = 0000000000000061
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000ffffffff
	lduba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = be6494a6, %l5 = 000000000000007a
	ldsba	[%i4+%g0]0x80,%l5	! %l5 = ffffffffffffffbe
!	Mem[0000000010181400] = 00000f74, %l0 = 000000000000a96b
	ldsba	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000074
!	Mem[00000000300c1408] = 000000ff, %l5 = ffffffffffffffbe
	lduwa	[%i3+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = de1a96d2 296a7add, %l0 = 00000074, %l1 = 00000061
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000296a7add 00000000de1a96d2
!	Mem[0000000010041410] = 00000000, %l1 = 00000000de1a96d2
	ldsha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001438] = 00000000000000ff, %f24 = 7a000007 ff000000
	ldda	[%i0+0x038]%asi,%f24	! %f24 = 00000000 000000ff
!	Mem[0000000030001400] = 000036ff, %l6 = 00000000ff000f00
	lduha	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010041400] = 000000ff
	stwa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000

p0_label_142:
!	%f14 = 7bf46ccb 890d9fc6, %l6 = 0000000000000000
!	Mem[00000000100c1400] = 00000000ffff0000
	stda	%f14,[%i3+%l6]ASI_PST8_PL ! Mem[00000000100c1400] = 00000000ffff0000
!	%l1 = 0000000000000000, Mem[0000000010181408] = ffff36ff
	stha	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 000036ff
!	%f10 = 7a77a4b4, Mem[00000000300c1410] = 00000000
	sta	%f10,[%i3+%o5]0x89	! Mem[00000000300c1410] = 7a77a4b4
!	Mem[0000000010001400] = 000000ff, %l5 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l3 = e7ffe701000000ff, Mem[0000000030181400] = 000f00ff
	stba	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 000f00ff
!	Mem[0000000030181410] = ffffffff, %l7 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 00000000ffffffff
!	%f3  = 01e7ffe7, Mem[0000000030001400] = 000036ff
	sta	%f3 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 01e7ffe7
!	%f6  = 296a7add 5650f73a, %l3 = e7ffe701000000ff
!	Mem[0000000010181420] = 7b85f1029c689843
	add	%i6,0x020,%g1
	stda	%f6,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010181420] = 3af75056dd7a6a29
!	%l7 = 00000000ffffffff, Mem[0000000010001400] = ff000000ffb3c4fb
	stx	%l7,[%i0+%g0]		! Mem[0000000010001400] = 00000000ffffffff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000030001400] = 01e7ffe7 dc1573ef 4e747456 00000000
!	Mem[0000000030001410] = 890d9fc6 000000ba dc687efe 9e34a28f
!	Mem[0000000030001420] = 1f44758d 0c75d9b9 a673e23e 891d7ef6
!	Mem[0000000030001430] = e1dd814d e0de13fb 6fd3ffde 02cfc061
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400

p0_label_143:
!	Mem[00000000100c1400] = 0000ffff 00000000, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000 000000000000ffff
!	Mem[0000000010181408] = 000036ff, %f24 = 00000000
	lda	[%i6+%o4]0x80,%f24	! %f24 = 000036ff
!	Mem[0000000030041400] = b30000ff, %f16 = ff000000
	lda	[%i1+%g0]0x89,%f16	! %f16 = b30000ff
!	Mem[0000000010101410] = ff9b0000, %l6 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000333df20e, %l6 = ffffffffffffffff
	ldxa	[%i1+%g0]0x80,%l6	! %l6 = 00000000333df20e
!	Mem[0000000010001418] = b4a4777a5650f73a, %f20 = be6494a6 ffff777a
	ldd	[%i0+0x018],%f20	! %f20 = b4a4777a 5650f73a
!	Mem[0000000010001400] = 00000000, %l2 = c69fcf89cb6cf47b
	ldswa	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 00000000 b30000ff, %l6 = 333df20e, %l7 = 0000ffff
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 00000000b30000ff 0000000000000000
!	Mem[000000001018141c] = 2cc99bc6, %l1 = 0000000000000000
	lduw	[%i6+0x01c],%l1		! %l1 = 000000002cc99bc6
!	Starting 10 instruction Store Burst
!	%l0 = 296a7add, %l1 = 2cc99bc6, Mem[0000000010141400] = 00ff0000 ff000000
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 296a7add 2cc99bc6

p0_label_144:
!	Mem[00000000300c1410] = 7a77a4b4, %l6 = 00000000b30000ff
	ldstuba	[%i3+%o5]0x89,%l6	! %l6 = 000000b4000000ff
!	Mem[00000000300c1410] = 7a77a4ff, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 000000007a77a4ff
!	%l0 = 00000000296a7add, Mem[0000000030041400] = ff0000b3
	stba	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = dd0000b3
!	%f30 = 7bf46ccb 890d9fc6, %l2 = 000000007a77a4ff
!	Mem[0000000030081400] = ff00000001e7ffe7
	stda	%f30,[%i2+%l2]ASI_PST16_SL ! Mem[0000000030081400] = c69f0d89cb6cf47b
!	Mem[0000000030041410] = 7a000007, %l1 = 000000002cc99bc6
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 000000007a000007
!	Mem[0000000010101410] = ff9b0000, %l5 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030181400] = 000f00ff, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 00000000000f00ff
!	Mem[0000000010101408] = 2cff0000, %l1 = 000000007a000007
	swapa	[%i4+%o4]0x80,%l1	! %l1 = 000000002cff0000
!	%l7 = 00000000000f00ff, Mem[0000000030101400] = ff00c92c01e7ffe7
	stxa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000000f00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff0a3bff, %f27 = ffffffff
	lda	[%i5+%g0]0x89,%f27	! %f27 = ff0a3bff

p0_label_145:
!	Mem[0000000030101408] = ffff0000, %l1 = 000000002cff0000
	lduba	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 000036ff, %l3 = e7ffe701000000ff
	ldsb	[%i6+0x00a],%l3		! %l3 = 0000000000000036
!	Mem[0000000010001408] = ff000f00, %l4 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = ffffffffff000f00
!	Mem[0000000030181410] = 000000ff, %l0 = 00000000296a7add
	lduwa	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = 7a77ffff a69464be, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i4+%g0]0x88,%l0	! %l0 = 00000000a69464be 000000007a77ffff
!	Mem[0000000010141400] = 296a7add, %l6 = 00000000000000b4
	lduwa	[%i5+%g0]0x88,%l6	! %l6 = 00000000296a7add
!	Mem[0000000021800180] = 026e1af7, %l3 = 0000000000000036
	ldub	[%o3+0x180],%l3		! %l3 = 0000000000000002
!	Mem[0000000010181430] = 00000071, %f21 = 5650f73a
	ld	[%i6+0x030],%f21	! %f21 = 00000071
!	Mem[0000000010041410] = 00000000, %l6 = 00000000296a7add
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = 7bf46ccb 890d9fc6, %l3 = 0000000000000002
!	Mem[0000000010081438] = 0000613000000000
	add	%i2,0x038,%g1
	stda	%f30,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010081438] = 009f613000000000

p0_label_146:
!	%f0  = 01e7ffe7 dc1573ef 4e747456 00000000
!	%f4  = 890d9fc6 000000ba dc687efe 9e34a28f
!	%f8  = 1f44758d 0c75d9b9 a673e23e 891d7ef6
!	%f12 = e1dd814d e0de13fb 6fd3ffde 02cfc061
	stda	%f0,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	Mem[0000000010001400] = 00000000, %l1 = 000000007a77ffff
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (27)
!	%l4 = ff000f00, %l5 = 000000ff, Mem[0000000030001408] = 5674744e 00000000
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = ff000f00 000000ff
!	%f22 = ff00c92c, Mem[0000000010141428] = 00360000
	st	%f22,[%i5+0x028]	! Mem[0000000010141428] = ff00c92c
!	%l5 = 00000000000000ff, Mem[0000000010101400] = be6494a6
	stba	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = ff6494a6
!	Mem[0000000010081419] = 25cf9e07, %l7 = 00000000000f00ff
	ldstub	[%i2+0x019],%l7		! %l7 = 000000cf000000ff
!	Mem[00000000300c1400] = 2cc96ba9, %l0 = 00000000a69464be
	ldstuba	[%i3+%g0]0x81,%l0	! %l0 = 0000002c000000ff
!	%f4  = 890d9fc6 000000ba, %l6 = 0000000000000000
!	Mem[0000000030181428] = 9cd1a452a052cf2b
	add	%i6,0x028,%g1
	stda	%f4,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030181428] = 9cd1a452a052cf2b
!	%l5 = 00000000000000ff, Mem[00000000100c1426] = 9c68ff43, %asi = 80
	stha	%l5,[%i3+0x026]%asi	! Mem[00000000100c1424] = 9c6800ff
!	Starting 10 instruction Load Burst
!	%l3 = 0000000000000002, imm = 00000000000003bb, %l6 = 0000000000000000
	add	%l3,0x3bb,%l6		! %l6 = 00000000000003bd

p0_label_147:
!	Mem[00000000300c1410] = 00000000, %l6 = 00000000000003bd
	lduba	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = ffff777a, %l4 = ffffffffff000f00
	lduba	[%i0+%g0]0x88,%l4	! %l4 = 000000000000007a
!	Mem[0000000030001408] = 000f00ff, %l0 = 000000000000002c
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 000000000000000f
!	Mem[0000000030141410] = 00ff0000, %l2 = 000000007a77a4ff
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = 5650f73a, %l1 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l1	! %l1 = 000000000000003a
!	Mem[0000000010181400] = 740f0000ffffffff, %l4 = 000000000000007a
	ldxa	[%i6+%g0]0x80,%l4	! %l4 = 740f0000ffffffff
!	Mem[0000000010001410] = ffff6ba9, %l0 = 000000000000000f
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = ffffffffffff6ba9
!	Mem[0000000020800040] = 61ff0345, %l4 = 740f0000ffffffff
	ldsba	[%o1+0x041]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081430] = 1a1ec5fc, %l3 = 0000000000000002
	ldswa	[%i2+0x030]%asi,%l3	! %l3 = 000000001a1ec5fc
!	Starting 10 instruction Store Burst
!	Mem[0000000010041428] = 00000aa1, %l6 = 0000000000000000
	swap	[%i1+0x028],%l6		! %l6 = 0000000000000aa1

p0_label_148:
!	%l7 = 00000000000000cf, Mem[0000000030081410] = ff00c92c
	stba	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = ff00c9cf
!	Mem[00000000100c1400] = 00000000, %l1 = 000000000000003a
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, Mem[00000000300c1400] = ffc96ba9
	stwa	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l5 = 00000000000000ff, Mem[000000001018143a] = c69fcf89, %asi = 80
	stha	%l5,[%i6+0x03a]%asi	! Mem[0000000010181438] = c69f00ff
!	%l5 = 00000000000000ff, Mem[00000000300c1410] = 00000000
	stwa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff
!	%l2 = 00000000000000ff, Mem[0000000030041410] = 000061ff2cc99bc6
	stxa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000000000ff
!	Mem[0000000030101408] = 5674744e, %l7 = 00000000000000cf
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 000000005674744e
!	Mem[0000000020800001] = ffff68e7, %l2 = 00000000000000ff
	ldstub	[%o1+0x001],%l2		! %l2 = 000000ff000000ff
!	%f15 = 02cfc061, %f10 = a673e23e
	fcmpes	%fcc3,%f15,%f10		! %fcc3 = 2
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ffff0000, %l3 = 000000001a1ec5fc
	lduwa	[%i5+%o5]0x80,%l3	! %l3 = 00000000ffff0000

p0_label_149:
!	%l5 = 00000000000000ff, Mem[0000000030081410] = ff00c9cf
	stha	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = ff0000ff
!	Mem[000000001008142c] = 000000ff, %f4  = 890d9fc6
	ld	[%i2+0x02c],%f4 	! %f4 = 000000ff
!	Mem[0000000010181400] = 740f0000, %l6 = 0000000000000aa1
	lduba	[%i6+0x003]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	ldswa	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = b30000dd, %l5 = 00000000000000ff
	ldswa	[%i1+%g0]0x89,%l5	! %l5 = ffffffffb30000dd
!	Mem[0000000010001410] = ffffffb3 ffff6ba9, %l2 = 000000ff, %l3 = ffff0000
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 00000000ffff6ba9 00000000ffffffb3
!	Mem[0000000010081400] = 00000000, %f15 = 02cfc061
	lda	[%i2+%g0]0x80,%f15	! %f15 = 00000000
!	Mem[0000000010081408] = dd7a6a29 d2961ade, %l0 = ffff6ba9, %l1 = 00000000
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000dd7a6a29 00000000d2961ade
!	Mem[0000000010041410] = 00000000, %f24 = 000036ff
	ld	[%i1+%o5],%f24	! %f24 = 00000000
!	Starting 10 instruction Store Burst
!	%f8  = 1f44758d, Mem[0000000010101410] = 00009bff
	sta	%f8 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 1f44758d

p0_label_150:
!	Mem[0000000010041435] = be6494a6, %l5 = ffffffffb30000dd
	ldstub	[%i1+0x035],%l5		! %l5 = 00000064000000ff
!	%l4 = ffffffffffffffff, Mem[0000000030141410] = 00ff0000
	stwa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff
!	%l1 = 00000000d2961ade, Mem[00000000100c1410] = 3af75056
	stwa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = d2961ade
!	Mem[0000000010101400] = ff6494a6, %l1 = 00000000d2961ade
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 00000000ff6494a6
!	Mem[00000000300c1410] = ff000000, %l4 = ffffffffffffffff
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 00000000ff000000
!	%f2  = 4e747456 00000000, %l0 = 00000000dd7a6a29
!	Mem[0000000030141420] = 6bba7aae1e5fd513
	add	%i5,0x020,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030141420] = 000000001e5fd513
!	Mem[0000000010181410] = 00000000, %l4 = 00000000ff000000
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000, %l7 = 5674744e, Mem[00000000300c1408] = ff000000 2101ff00
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 5674744e
!	Mem[0000000030041400] = b30000dd, %l6 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 000000dd000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 7a000007, %l5 = 0000000000000064
	ldswa	[%i4+%o4]0x80,%l5	! %l5 = 000000007a000007

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	lduha	[%i2+0x010]%asi,%l0
	sdivx	%l7,0xaaf,%l2
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000dd7a6a29
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000ff6494a6
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000ffff6ba9
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000ffffffb3
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000007a000007
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000000dd
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 000000005674744e
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 01e7ffe7 dc1573ef
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 4e747456 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 000000ff 000000ba
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be dc687efe 9e34a28f
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 1f44758d 0c75d9b9
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be a673e23e 891d7ef6
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be e1dd814d e0de13fb
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 6fd3ffde 00000000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be b30000ff 01e7ffe7
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 9d9acf2d dd7a6a29
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be b4a4777a 00000071
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ff00c92c 01e7ffe7
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 000000ff
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ff000f00 ff0a3bff
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ffffffff ffb4f2e6
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 7bf46ccb 890d9fc6
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
	xnor	%l7,%l5,%l2
	done

p0_trap1o:
	xnor	%l7,%l5,%l2
	done


p0_trap2e:
	ldsba	[%i3+%o4]ASI_AS_IF_USER_PRIMARY,%l2	! Mem[00000000100c1408]
	swapa	[%i5+%o5]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010141410]
	orn	%l7,-0xf2c,%l7
	done

p0_trap2o:
	ldsba	[%o3+%i4]ASI_AS_IF_USER_PRIMARY,%l2	! Mem[00000000100c1408]
	swapa	[%o5+%i5]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010141410]
	orn	%l7,-0xf2c,%l7
	done


p0_trap3e:
	addc	%l6,%l2,%l6
	xnor	%l3,%l3,%l3
	add	%l1,%l6,%l0
	subc	%l7,0x8f9,%l7
	sub	%l0,-0xa16,%l0
	sub	%l2,-0x64d,%l6
	addc	%l7,-0xffd,%l3
	done

p0_trap3o:
	addc	%l6,%l2,%l6
	xnor	%l3,%l3,%l3
	add	%l1,%l6,%l0
	subc	%l7,0x8f9,%l7
	sub	%l0,-0xa16,%l0
	sub	%l2,-0x64d,%l6
	addc	%l7,-0xffd,%l3
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
	ldx	[%g1+0x000],%l0		! %l0 = 09d72c243ee8ec29
	ldx	[%g1+0x008],%l1		! %l1 = 3afe6bda230fddce
	ldx	[%g1+0x010],%l2		! %l2 = 3abd3d7ebcfafe6d
	ldx	[%g1+0x018],%l3		! %l3 = 12f514ba2028c67b
	ldx	[%g1+0x020],%l4		! %l4 = 9ed92743dc5da346
	ldx	[%g1+0x028],%l5		! %l5 = 2b47e9745b5fde6c
	ldx	[%g1+0x030],%l6		! %l6 = 9634340ea8bed256
	ldx	[%g1+0x038],%l7		! %l7 = 13653169ef7315dc

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
	fdivs	%f5 ,%f7 ,%f4 
	fsubs	%f0 ,%f12,%f0 
	jmpl	%o7,%g0
	subc	%l1,-0xb62,%l7
p0_near_0_he:
	smul	%l0,0x748,%l3
	smul	%l5,0x743,%l3
	jmpl	%o7,%g0
	addc	%l0,-0xaa6,%l1
near0_b2b_h:
	xor	%l0,0xbb6,%l1
	fsubs	%f26,%f20,%f19
	sub	%l0,0x5da,%l1
	fdivs	%f24,%f21,%f22
	addc	%l0,%l0,%l7
	addc	%l6,-0xb6c,%l3
	subc	%l2,%l1,%l4
	jmpl	%o7,%g0
	fmuls	%f18,%f25,%f29
near0_b2b_l:
	orn	%l0,%l0,%l3
	andn	%l5,0x9f0,%l0
	sdivx	%l3,0xa80,%l1
	fmuls	%f14,%f15,%f9 
	udivx	%l6,-0x645,%l7
	andn	%l7,-0x77e,%l0
	addc	%l0,-0x895,%l5
	jmpl	%o7,%g0
	mulx	%l4,0xad2,%l2
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	fmuls	%f8 ,%f10,%f5 
	fmuls	%f8 ,%f12,%f12
	jmpl	%o7,%g0
	addc	%l5,0x924,%l0
p0_near_1_he:
	fadds	%f22,%f16,%f28
	fsqrts	%f26,%f23
	fsubs	%f16,%f31,%f18
	ld	[%i3+0x01c],%f23	! Mem[00000000100c141c]
	fadds	%f31,%f16,%f16
	umul	%l6,%l4,%l4
	jmpl	%o7,%g0
	fmuls	%f23,%f26,%f29
near1_b2b_h:
	andn	%l4,-0x7d4,%l2
	smul	%l7,%l6,%l1
	xnor	%l6,-0x577,%l7
	fadds	%f19,%f20,%f31
	orn	%l4,-0x337,%l5
	sdivx	%l1,%l6,%l6
	xnor	%l1,0x896,%l1
	jmpl	%o7,%g0
	fsqrts	%f28,%f21
near1_b2b_l:
	xnor	%l7,0x1e5,%l7
	sub	%l2,0x02a,%l0
	fdtos	%f4 ,%f11
	or	%l6,%l7,%l5
	subc	%l1,-0x237,%l7
	xor	%l3,%l0,%l6
	andn	%l2,%l7,%l3
	jmpl	%o7,%g0
	and	%l7,-0x2f7,%l6
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	jmpl	%o7,%g0
	fsubs	%f0 ,%f9 ,%f6 
	jmpl	%o7,%g0
	nop
p0_near_2_he:
	smul	%l0,%l3,%l0
	fdtos	%f26,%f19
	jmpl	%o7,%g0
	ldd	[%i1+0x008],%l6		! Mem[0000000010041408]
near2_b2b_h:
	fsubs	%f21,%f30,%f27
	fcmps	%fcc1,%f18,%f23
	xnor	%l6,0xfd9,%l6
	subc	%l5,-0xff1,%l1
	fdivs	%f20,%f26,%f18
	smul	%l7,%l2,%l4
	fadds	%f20,%f25,%f16
	jmpl	%o7,%g0
	umul	%l5,%l3,%l6
near2_b2b_l:
	fadds	%f13,%f7 ,%f12
	sdivx	%l5,-0xc27,%l5
	fmuls	%f14,%f11,%f12
	fadds	%f10,%f12,%f2 
	xor	%l0,%l6,%l5
	fcmps	%fcc0,%f15,%f13
	and	%l4,0xe35,%l1
	jmpl	%o7,%g0
	xnor	%l2,0xac5,%l6
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	smul	%l4,-0xe4b,%l4
	xnor	%l1,0xbf0,%l4
	smul	%l6,%l7,%l1
	subc	%l0,%l7,%l6
	mulx	%l5,0x77d,%l0
	jmpl	%o7,%g0
	fsubs	%f14,%f7 ,%f10
p0_near_3_he:
	fadds	%f19,%f31,%f22
	fadds	%f22,%f29,%f28
	sub	%l2,-0xb96,%l1
	fdivs	%f16,%f22,%f18
	fsubs	%f30,%f21,%f22
	subc	%l0,0x0a1,%l5
	jmpl	%o7,%g0
	xnor	%l4,%l3,%l0
near3_b2b_h:
	mulx	%l0,%l6,%l1
	jmpl	%o7,%g0
	or	%l6,%l4,%l4
near3_b2b_l:
	xnor	%l6,%l0,%l6
	jmpl	%o7,%g0
	sub	%l5,%l3,%l1
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	jmpl	%o7,%g0
	fdivs	%f9 ,%f13,%f2 
	jmpl	%o7,%g0
	nop
p0_far_0_lem:
	jmpl	%o7,%g0
	fdivs	%f9 ,%f13,%f2 
	jmpl	%o7,%g0
	nop
p0_far_0_he:
	sub	%l0,0x7ba,%l5
	or	%l3,0x0b0,%l2
	fcmps	%fcc0,%f23,%f30
	fdivs	%f21,%f29,%f23
	jmpl	%o7,%g0
	and	%l6,%l4,%l3
p0_far_0_hem:
	sub	%l0,0x7ba,%l5
	or	%l3,0x0b0,%l2
	fcmps	%fcc0,%f23,%f30
	fdivs	%f21,%f29,%f23
	jmpl	%o7,%g0
	and	%l6,%l4,%l3
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	andn	%l3,%l1,%l0
	fsubs	%f26,%f26,%f25
	jmpl	%o7,%g0
	fadds	%f30,%f17,%f19
far0_b2b_l:
	sub	%l6,0x0ce,%l7
	smul	%l4,%l4,%l2
	jmpl	%o7,%g0
	addc	%l2,%l7,%l3
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	sdivx	%l6,-0x968,%l3
	xor	%l6,%l5,%l2
	subc	%l4,0x83d,%l4
	and	%l7,-0x7f8,%l1
	jmpl	%o7,%g0
	fcmps	%fcc1,%f10,%f1 
p0_far_1_lem:
	sdivx	%l6,-0x968,%l3
	xor	%l6,%l5,%l2
	subc	%l4,0x83d,%l4
	and	%l7,-0x7f8,%l1
	jmpl	%o7,%g0
	fcmps	%fcc1,%f10,%f1 
p0_far_1_he:
	andn	%l1,-0x435,%l2
	sub	%l7,%l4,%l0
	umul	%l1,-0x619,%l7
	mulx	%l3,%l2,%l6
	fdivs	%f17,%f31,%f16
	jmpl	%o7,%g0
	andn	%l2,%l2,%l0
p0_far_1_hem:
	andn	%l1,-0x435,%l2
	sub	%l7,%l4,%l0
	umul	%l1,-0x619,%l7
	mulx	%l3,%l2,%l6
	fdivs	%f17,%f31,%f16
	jmpl	%o7,%g0
	andn	%l2,%l2,%l0
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	orn	%l0,0xb61,%l6
	subc	%l4,0x475,%l0
	fdivs	%f21,%f23,%f22
	fcmps	%fcc3,%f19,%f31
	sub	%l6,%l6,%l3
	mulx	%l6,0x621,%l2
	andn	%l1,%l5,%l3
	jmpl	%o7,%g0
	subc	%l7,-0x00f,%l7
far1_b2b_l:
	andn	%l7,%l5,%l5
	smul	%l1,-0xf61,%l1
	subc	%l1,%l5,%l2
	fstoi	%f1 ,%f9 
	fadds	%f3 ,%f13,%f1 
	fdivs	%f5 ,%f4 ,%f10
	fdivs	%f8 ,%f15,%f15
	jmpl	%o7,%g0
	mulx	%l7,%l1,%l0
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	addc	%l3,0x93e,%l4
	jmpl	%o7,%g0
	swap	[%i4+0x004],%l0		! Mem[0000000010101404]
p0_far_2_lem:
	addc	%l3,0x93e,%l4
	membar	#Sync
	jmpl	%o7,%g0
	swap	[%i4+0x004],%l0		! Mem[0000000010101404]
p0_far_2_he:
	addc	%l0,-0xf0f,%l3
	jmpl	%o7,%g0
	fsqrts	%f16,%f18
p0_far_2_hem:
	addc	%l0,-0xf0f,%l3
	jmpl	%o7,%g0
	fsqrts	%f16,%f18
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fsubs	%f25,%f23,%f19
	subc	%l5,%l0,%l6
	smul	%l4,%l1,%l2
	mulx	%l2,0x732,%l1
	jmpl	%o7,%g0
	xor	%l2,0x9b4,%l5
far2_b2b_l:
	fmuls	%f1 ,%f8 ,%f11
	xnor	%l4,-0xa97,%l3
	xor	%l4,%l2,%l2
	xnor	%l5,-0x72e,%l6
	jmpl	%o7,%g0
	umul	%l6,-0xf90,%l0
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	addc	%l5,0xf77,%l4
	umul	%l1,%l3,%l1
	fmuls	%f9 ,%f8 ,%f13
	jmpl	%o7,%g0
	umul	%l5,-0x0fa,%l3
p0_far_3_lem:
	addc	%l5,0xf77,%l4
	umul	%l1,%l3,%l1
	fmuls	%f9 ,%f8 ,%f13
	jmpl	%o7,%g0
	umul	%l5,-0x0fa,%l3
p0_far_3_he:
	orn	%l0,%l7,%l1
	jmpl	%o7,%g0
	addc	%l2,%l0,%l5
p0_far_3_hem:
	orn	%l0,%l7,%l1
	jmpl	%o7,%g0
	addc	%l2,%l0,%l5
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fsqrts	%f23,%f24
	fadds	%f16,%f28,%f16
	fsubs	%f19,%f18,%f18
	sub	%l5,%l2,%l3
	sub	%l1,0x6db,%l1
	mulx	%l2,%l7,%l4
	jmpl	%o7,%g0
	fsqrts	%f26,%f22
far3_b2b_l:
	fsubs	%f12,%f0 ,%f1 
	fstod	%f1 ,%f14
	fdivs	%f7 ,%f12,%f14
	fcmps	%fcc3,%f12,%f5 
	addc	%l0,0x071,%l3
	xnor	%l6,0x63f,%l1
	jmpl	%o7,%g0
	fdivs	%f2 ,%f8 ,%f6 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	xnor	%l6,%l7,%l6
	xnor	%l5,%l3,%l2
	jmpl	%g6+8,%g0
	fsqrts	%f10,%f8 
p0_call_0_le:
	andn	%l6,-0x31f,%l5
	or	%l7,%l7,%l2
	xnor	%l3,%l7,%l1
	smul	%l6,0x256,%l2
	retl
	fsqrts	%f11,%f3 
p0_jmpl_0_lo:
	xnor	%l6,%l7,%l6
	xnor	%l5,%l3,%l2
	jmpl	%g6+8,%g0
	fsqrts	%f10,%f8 
p0_call_0_lo:
	andn	%l6,-0x31f,%l5
	or	%l7,%l7,%l2
	xnor	%l3,%l7,%l1
	smul	%l6,0x256,%l2
	retl
	fsqrts	%f11,%f3 
p0_jmpl_0_he:
	fsubs	%f23,%f25,%f23
	fitod	%f27,%f20
	addc	%l1,%l2,%l6
	sdivx	%l0,-0xdb7,%l1
	udivx	%l0,%l1,%l3
	sub	%l3,%l5,%l0
	jmpl	%g6+8,%g0
	fsqrts	%f31,%f27
p0_call_0_he:
	sth	%l4,[%i4+0x00a]		! Mem[000000001010140a]
	or	%l5,0xa52,%l7
	fmuls	%f16,%f16,%f20
	retl
	xnor	%l4,0xb2e,%l4
p0_jmpl_0_ho:
	fsubs	%f23,%f25,%f23
	fitod	%f27,%f20
	addc	%l1,%l2,%l6
	sdivx	%l0,-0xdb7,%l1
	udivx	%l0,%l1,%l3
	sub	%l3,%l5,%l0
	jmpl	%g6+8,%g0
	fsqrts	%f31,%f27
p0_call_0_ho:
	sth	%l4,[%o4+0x00a]		! Mem[000000001010140a]
	or	%l5,0xa52,%l7
	fmuls	%f16,%f16,%f20
	retl
	xnor	%l4,0xb2e,%l4
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	jmpl	%g6+8,%g0
	fcmps	%fcc1,%f14,%f10
p0_call_1_le:
	retl
	umul	%l4,-0x69a,%l5
p0_jmpl_1_lo:
	jmpl	%g6+8,%g0
	fcmps	%fcc1,%f14,%f10
p0_call_1_lo:
	retl
	umul	%l4,-0x69a,%l5
p0_jmpl_1_he:
	ldd	[%i4+0x010],%f22	! Mem[0000000010101410]
	fmuls	%f19,%f28,%f30
	jmpl	%g6+8,%g0
	addc	%l6,0x1c4,%l0
p0_call_1_he:
	andn	%l4,%l2,%l5
	retl
	or	%l0,%l3,%l5
p0_jmpl_1_ho:
	ldd	[%o4+0x010],%f22	! Mem[0000000010101410]
	fmuls	%f19,%f28,%f30
	jmpl	%g6+8,%g0
	addc	%l6,0x1c4,%l0
p0_call_1_ho:
	andn	%l4,%l2,%l5
	retl
	or	%l0,%l3,%l5
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	xnor	%l7,-0xcde,%l2
	sub	%l0,%l5,%l3
	jmpl	%g6+8,%g0
	udivx	%l6,%l1,%l4
p0_call_2_le:
	fmuls	%f1 ,%f14,%f4 
	addc	%l7,0x1fe,%l1
	retl
	smul	%l3,-0x6a6,%l0
p0_jmpl_2_lo:
	xnor	%l7,-0xcde,%l2
	sub	%l0,%l5,%l3
	jmpl	%g6+8,%g0
	udivx	%l6,%l1,%l4
p0_call_2_lo:
	fmuls	%f1 ,%f14,%f4 
	addc	%l7,0x1fe,%l1
	retl
	smul	%l3,-0x6a6,%l0
p0_jmpl_2_he:
	andn	%l5,0xa2c,%l3
	sdivx	%l4,%l7,%l2
	xor	%l2,0x9f6,%l4
	sdivx	%l2,%l5,%l3
	fmuls	%f28,%f18,%f28
	subc	%l0,-0xb9b,%l7
	jmpl	%g6+8,%g0
	stx	%l2,[%i5+0x008]		! Mem[0000000010141408]
p0_call_2_he:
	xor	%l6,0x35a,%l0
	xor	%l6,-0x4ce,%l1
	smul	%l0,-0xffd,%l0
	addc	%l0,%l3,%l2
	subc	%l6,0x8aa,%l3
	umul	%l0,0x5d9,%l4
	sub	%l7,-0x261,%l4
	retl
	fdivs	%f19,%f30,%f29
p0_jmpl_2_ho:
	andn	%l5,0xa2c,%l3
	sdivx	%l4,%l7,%l2
	xor	%l2,0x9f6,%l4
	sdivx	%l2,%l5,%l3
	fmuls	%f28,%f18,%f28
	subc	%l0,-0xb9b,%l7
	jmpl	%g6+8,%g0
	stx	%l2,[%o5+0x008]		! Mem[0000000010141408]
p0_call_2_ho:
	xor	%l6,0x35a,%l0
	xor	%l6,-0x4ce,%l1
	smul	%l0,-0xffd,%l0
	addc	%l0,%l3,%l2
	subc	%l6,0x8aa,%l3
	umul	%l0,0x5d9,%l4
	sub	%l7,-0x261,%l4
	retl
	fdivs	%f19,%f30,%f29
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	sub	%l6,-0xb40,%l0
	sdivx	%l2,%l7,%l3
	fcmps	%fcc2,%f11,%f9 
	xor	%l0,%l6,%l2
	fdivs	%f10,%f7 ,%f6 
	fadds	%f9 ,%f8 ,%f1 
	jmpl	%g6+8,%g0
	fcmps	%fcc1,%f2 ,%f9 
p0_call_3_le:
	add	%l7,%l0,%l3
	fdtoi	%f4 ,%f5 
	retl
	fitod	%f8 ,%f4 
p0_jmpl_3_lo:
	sub	%l6,-0xb40,%l0
	sdivx	%l2,%l7,%l3
	fcmps	%fcc2,%f11,%f9 
	xor	%l0,%l6,%l2
	fdivs	%f10,%f7 ,%f6 
	fadds	%f9 ,%f8 ,%f1 
	jmpl	%g6+8,%g0
	fcmps	%fcc1,%f2 ,%f9 
p0_call_3_lo:
	add	%l7,%l0,%l3
	fdtoi	%f4 ,%f5 
	retl
	fitod	%f8 ,%f4 
p0_jmpl_3_he:
	fstod	%f25,%f16
	subc	%l6,-0x6e0,%l6
	jmpl	%g6+8,%g0
	fadds	%f28,%f26,%f16
p0_call_3_he:
	udivx	%l7,%l2,%l1
	fcmps	%fcc2,%f18,%f23
	ldd	[%i4+0x010],%f26	! Mem[0000000010101410]
	lduh	[%i5+0x02a],%l7		! Mem[000000001014142a]
	sdivx	%l4,%l2,%l1
	retl
	fdivs	%f23,%f25,%f16
p0_jmpl_3_ho:
	fstod	%f25,%f16
	subc	%l6,-0x6e0,%l6
	jmpl	%g6+8,%g0
	fadds	%f28,%f26,%f16
p0_call_3_ho:
	udivx	%l7,%l2,%l1
	fcmps	%fcc2,%f18,%f23
	ldd	[%o4+0x010],%f26	! Mem[0000000010101410]
	lduh	[%o5+0x02a],%l7		! Mem[000000001014142a]
	sdivx	%l4,%l2,%l1
	retl
	fdivs	%f23,%f25,%f16
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
	.word	0x09d72c24,0x3ee8ec29		! Init value for %l0
	.word	0x3afe6bda,0x230fddce		! Init value for %l1
	.word	0x3abd3d7e,0xbcfafe6d		! Init value for %l2
	.word	0x12f514ba,0x2028c67b		! Init value for %l3
	.word	0x9ed92743,0xdc5da346		! Init value for %l4
	.word	0x2b47e974,0x5b5fde6c		! Init value for %l5
	.word	0x9634340e,0xa8bed256		! Init value for %l6
	.word	0x13653169,0xef7315dc		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xc2de300d,0xdde5afdd		! Init value for %f0 
	.word	0x02c854f0,0x38d54d89		! Init value for %f2 
	.word	0x95f911c1,0xa125a382		! Init value for %f4 
	.word	0x80ddcbc3,0x614c11a0		! Init value for %f6 
	.word	0x771d9f0f,0x696b1178		! Init value for %f8 
	.word	0xe7617a36,0x7b85f102		! Init value for %f10
	.word	0x51f8dceb,0x167cfdb8		! Init value for %f12
	.word	0x7ab333f5,0x864cae6c		! Init value for %f14
	.word	0x517462e5,0xd4d2176b		! Init value for %f16
	.word	0x65de29bb,0x5c5f0d5d		! Init value for %f18
	.word	0xbc93102e,0x853c7314		! Init value for %f20
	.word	0x03b02e58,0x82f57916		! Init value for %f22
	.word	0x2b1f52a0,0x2e9bec6d		! Init value for %f24
	.word	0xb979979e,0x080e08a5		! Init value for %f26
	.word	0x9a04926a,0xa0e251f3		! Init value for %f28
	.word	0x9787eb2b,0x410fe543		! Init value for %f30
	.word	0x99de84aa,0x3125a7e5		! Init value for %f32
	.word	0xc66815e2,0x541ebde1		! Init value for %f34
	.word	0xa7dacca1,0x3b57bfc1		! Init value for %f36
	.word	0xbc8fc929,0x68e591c1		! Init value for %f38
	.word	0xc3a10586,0x5e8f0620		! Init value for %f40
	.word	0x8db3c9fe,0xa645b4ce		! Init value for %f42
	.word	0xd8ac9843,0xc335c6e8		! Init value for %f44
	.word	0xa4bd8962,0x37a7137e		! Init value for %f46
	.word	0x303636d9,0x4ad09971
	.word	0x50d5a925,0xf6cf73cb
	.word	0x669a7187,0x1f90dda0
	.word	0x62217de4,0xcc9df0da
	.word	0xdd7226b0,0xbeb851cf
	.word	0xc78a5c3f,0xdc2cf5b6
	.word	0x4234d5ff,0x816fa051
	.word	0xb08e3c8a,0x806cc38d
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
	.word	0x00000000,0xdd7a6a29
	.word	0x00000000,0xff6494a6
	.word	0x00000000,0xffff6ba9
	.word	0x00000000,0xffffffb3
	.word	0x00000000,0x00000000
	.word	0x00000000,0x7a000007
	.word	0x00000000,0x000000dd
	.word	0x00000000,0x5674744e
p0_expected_fp_regs:
	.word	0x01e7ffe7,0xdc1573ef
	.word	0x4e747456,0x00000000
	.word	0x000000ff,0x000000ba
	.word	0xdc687efe,0x9e34a28f
	.word	0x1f44758d,0x0c75d9b9
	.word	0xa673e23e,0x891d7ef6
	.word	0xe1dd814d,0xe0de13fb
	.word	0x6fd3ffde,0x00000000
	.word	0xb30000ff,0x01e7ffe7
	.word	0x9d9acf2d,0xdd7a6a29
	.word	0xb4a4777a,0x00000071
	.word	0xff00c92c,0x01e7ffe7
	.word	0x00000000,0x000000ff
	.word	0xff000f00,0xff0a3bff
	.word	0xffffffff,0xffb4f2e6
	.word	0x7bf46ccb,0x890d9fc6
	.word	0x0000002a,0x00000400		! %fsr = 0000002a00000400
p0_local0_expect:
	.word	0x7a77ffff,0xffffffff
	.word	0xff000f00,0xffffffff
	.word	0xa96bffff,0xb3ffffff
	.word	0xb4a4777a,0x5650f73a
	.word	0x4398689c,0x02f1857b
	.word	0x7a77a4b4,0x9d9acf2d
	.word	0x02f1857b,0x7178a96b
	.word	0x00000000,0x000000ff
p0_local0_sec_expect:
	.word	0x01e7ffe7,0xdc1573ef
	.word	0x000f00ff,0xff000000
	.word	0x890d9fc6,0x000000ba
	.word	0xdc687efe,0x9e34a28f
	.word	0x1f44758d,0x0c75d9b9
	.word	0xa673e23e,0x891d7ef6
	.word	0xe1dd814d,0xe0de13fb
	.word	0x6fd3ffde,0x02cfc061
p0_local1_expect:
	.word	0x00000000,0x333df20e
	.word	0x00000000,0xffffffff
	.word	0x00000000,0xff000f00
	.word	0x00000000,0x008000ff
	.word	0xc802fc4e,0xc9ffff12
	.word	0x00000000,0x00000000
	.word	0x3e9d120f,0xbeff94a6
	.word	0x408a7614,0x000000ff
p0_local1_sec_expect:
	.word	0xff0000b3,0x00000000
	.word	0xffffffff,0x000000ff
	.word	0xff000000,0x00000000
	.word	0xe7ffe701,0x2cc99bc6
	.word	0x2dcf9a9d,0xb4a4777a
	.word	0x2dcf9a9d,0xb4a4777a
	.word	0x00000071,0x7b85f102
	.word	0xc69fcf89,0xcb6cf47b
p0_local2_expect:
	.word	0x00000000,0x0000ff00
	.word	0xdd7a6a29,0xd2961ade
	.word	0x0000ff71,0x00000000
	.word	0x25ff9e07,0x611051ae
	.word	0xde1a96d2,0xff7f7ac8
	.word	0x5fc6002c,0x000000ff
	.word	0x1a1ec5fc,0x7178a96b
	.word	0x009f6130,0x00000000
p0_local2_sec_expect:
	.word	0xc69f0d89,0xcb6cf47b
	.word	0x71000000,0x00000000
	.word	0xff0000ff,0xef7315dc
	.word	0x29007aff,0x5600003a
	.word	0xbe6494a6,0x0e14473c
	.word	0x7a77a4b4,0x9d9acf2d
	.word	0x02f1857b,0x367a61e7
	.word	0x7bf46ccb,0x890d9fc6
p0_local3_expect:
	.word	0x0000003a,0xffff0000
	.word	0xffffff0a,0x00000000
	.word	0xd2961ade,0xffffef5e
	.word	0xe7ffe701,0x00009bc6
	.word	0xffff9bff,0x9c6800ff
	.word	0x744e0000,0xd2961ade
	.word	0x00000071,0x7b85f102
	.word	0xc69fcf89,0xcb6cf47b
p0_local3_sec_expect:
	.word	0x00000000,0xffffe701
	.word	0x00000000,0x4e747456
	.word	0xffffffff,0xdc3b0a71
	.word	0x7946d93e,0x9942070c
	.word	0x0ccf1a87,0x16f9d277
	.word	0x5be758f2,0x8e4c5c7f
	.word	0x73d5844e,0x75852610
	.word	0x8998c3a1,0x64e0fbd1
p0_local4_expect:
	.word	0xd2961ade,0xffff777a
	.word	0x7a000007,0xff000000
	.word	0x8d75441f,0x00000002
	.word	0xff0000fc,0xb32a37ff
	.word	0xffffffff,0xffb4f2e6
	.word	0xff7a7f4b,0x060a1ebe
	.word	0xe7617a36,0x0f129d3e
	.word	0xb32a37dd,0xffe7f47b
p0_local4_sec_expect:
	.word	0x01e7ffe7,0xdc1573ef
	.word	0xcf000000,0x00000000
	.word	0x890d9fc6,0x000000ba
	.word	0xdc687efe,0x9e34a28f
	.word	0x1f44758d,0x0c75d9b9
	.word	0xa673e23e,0x891d7ef6
	.word	0xe1dd814d,0xe0de13fb
	.word	0x6fd3ffde,0x02cfc061
p0_local5_expect:
	.word	0xdd7a6a29,0xc69bc92c
	.word	0x01e7ffff,0xffffffff
	.word	0xffff0000,0x9d9acf2d
	.word	0x7a0000ff,0xef7315dc
	.word	0x9d00a086,0xcb6cf47b
	.word	0xff00c92c,0x85d60000
	.word	0x00000000,0x7bf42cef
	.word	0xff0a3bff,0x9d9acf2d
p0_local5_sec_expect:
	.word	0xff3b0aff,0x00000038
	.word	0xff36ffff,0x9d9acf2d
	.word	0xffffffff,0x00000000
	.word	0x82ae12fc,0x01792b44
	.word	0x00000000,0x1e5fd513
	.word	0xf468e37f,0x0b5a531d
	.word	0x82a325a1,0xc111f995
	.word	0xe9b72f47,0x98880ba4
p0_local6_expect:
	.word	0x740f0000,0xffffffff
	.word	0x000036ff,0x01e7ffe7
	.word	0xff000000,0x00000000
	.word	0xe7ffe701,0x2cc99bc6
	.word	0x3af75056,0xdd7a6a29
	.word	0xffb719ff,0xb4a4777a
	.word	0x00000071,0x7b85f102
	.word	0xc69f00ff,0xcb6cf47b
p0_local6_sec_expect:
	.word	0x00000000,0xcec8be49
	.word	0x14768a40,0xffffffff
	.word	0x000000ff,0xffffff9b
	.word	0x9d9acf2d,0xdd7a6a29
	.word	0xc802fc4e,0xc98eff12
	.word	0x9cd1a452,0xa052cf2b
	.word	0x3e9d120f,0x367a61e7
	.word	0x7bf46ccb,0xdd372ab3
share0_expect:
	.word	0xffffde6c,0x57d5b669
	.word	0x20f2eae0,0xd58c3fc4
	.word	0x7d1e5384,0x7f345ee2
	.word	0xfe325666,0xeff03cff
	.word	0x890f2600,0x049791d9
	.word	0xdc522017,0x7acafd09
	.word	0x48f09f3b,0xa644c66d
	.word	0x70b538eb,0x5f2f6847
share1_expect:
	.word	0xffff68e7,0x641dedab
	.word	0x306aa704,0x559bf337
	.word	0xf99be28b,0xea4fcbc7
	.word	0x5f57cd5e,0xa5394248
	.word	0x6e75cfac,0x87f8d950
	.word	0x6843d4c0,0x08917fb6
	.word	0x7e0814a7,0x077543ec
	.word	0x1a1b61f1,0x9b818089
	.word	0x61ff0345,0x6d3b1ac0
	.word	0x5178e7e4,0x9eb69eb2
	.word	0x273a2291,0x58671440
	.word	0xc62505e0,0xded99e4d
	.word	0xfedb1ba9,0x9aa67490
	.word	0x619cd437,0x12b92c04
	.word	0x630f63ea,0x663ffd70
	.word	0xb4160e04,0xccf3cab5
share2_expect:
	.word	0x00ff622e,0x8e28ec93
	.word	0xced4b6ad,0x300b7081
	.word	0xf311999e,0x7835a36e
	.word	0x3c404669,0xd116d56b
	.word	0x29509919,0x30f4011b
	.word	0x32304fe2,0xd26052ae
	.word	0x15f57aef,0x9e45f228
	.word	0x07f348b8,0xf569357d
share3_expect:
	.word	0xff787193,0x996da118
	.word	0xf7304cf5,0x7e9739bf
	.word	0x116c8c3a,0x917e3c33
	.word	0x99886cea,0x93601035
	.word	0x84808e9a,0x65dc9e54
	.word	0x65a1fe2f,0xd9225aa8
	.word	0x678215a1,0xe8e5c832
	.word	0xf233b36e,0x5280dfdf
	.word	0xffff6a20,0xaed44102
	.word	0x54c10af0,0xd1f72a4a
	.word	0x2f9cad2f,0x8f68a88d
	.word	0x01cb1a1b,0x5f9c4c9d
	.word	0x539d7b32,0x27b80b31
	.word	0x0eba96f3,0xb5b0fb1f
	.word	0x7b96564b,0x54620f8d
	.word	0x0d10a042,0xe4c47f3b
	.word	0x5046e4e3,0xceec97f8
	.word	0xda27337e,0x4cd00bfd
	.word	0xae788adf,0x9781b3c7
	.word	0x7c4f2d6c,0x4beb5410
	.word	0xb11c6355,0xe91f329f
	.word	0xde5aecbc,0x790d237d
	.word	0x8857ad51,0x35ffcee0
	.word	0x125fa877,0x30c98115
	.word	0x00ffafb8,0x1a0cb64e
	.word	0xa918f770,0x48dfd205
	.word	0x2dc42c36,0x55e0848b
	.word	0x52bc4911,0x7f5a3081
	.word	0x040a23fd,0xa6b6394f
	.word	0x9edc8d20,0x3cd396e0
	.word	0xc8965a58,0xd7bd04e4
	.word	0xaf1fb91c,0x8519ee6a
	.word	0x161494a7,0x751918ec
	.word	0xe35fcf25,0x72da1668
	.word	0xfb1a223d,0xabf9fcfe
	.word	0x34e6672e,0xfba62cd5
	.word	0x298420c1,0xa964cf85
	.word	0x5c67ec71,0x5eb1ba32
	.word	0x828aa027,0x6f951199
	.word	0x14cb328f,0x62fd97b8
	.word	0xfffff79c,0x56bd6c0f
	.word	0x85e3f2d5,0xc65f811d
	.word	0xa6e95c4a,0xc3cf0841
	.word	0x1cb4ee1b,0x372cc984
	.word	0xb895fdbb,0x26d0e4dd
	.word	0x001ccd10,0x58897ab6
	.word	0xede8c2a5,0x5e14227a
	.word	0x6e98a5f2,0x34856a4c
	.word	0x026e1af7,0x15724510
	.word	0x6f1a7032,0xc33337c0
	.word	0x230d1689,0x866facf4
	.word	0x48dae9f8,0x267063a1
	.word	0x020ce403,0x9f0eddff
	.word	0x350670ce,0x83a5b62a
	.word	0xa0950224,0x7a0786a8
	.word	0x85d70577,0x945686e6
	.word	0x3556f6ef,0x15209e7c
	.word	0x19dd9964,0xe908bfdd
	.word	0xde8f5d3d,0x69663a31
	.word	0x3b378feb,0xed6b3b88
	.word	0x1e9dfed1,0x3b340fa1
	.word	0x4d477a7d,0x185dbdd2
	.word	0x0bf1330f,0x6d399219
	.word	0xf8c93dcf,0x92bb3a76
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
	.word	0xca1c21f8,0x44ecc652
	.word	0x00000000,0x00000002
	.word	0xc10fe9a8,0x20d33d71
	.word	0x00000000,0x00000003
	.word	0x45b5488f,0xefb65a21
	.word	0x00000000,0x00000004
	.word	0x918f27d0,0x16a6b191
	.word	0x00000000,0x00000005
	.word	0x9c5a43ff,0xd59c5c9b
	.word	0x00000000,0x00000006
	.word	0xd2b73eb0,0x322c6dce
	.word	0x00000000,0x00000007
	.word	0xf1a6f24f,0xf8a9abf9
	.word	0x00000000,0x00000008
	.word	0xf5b21ab8,0x1ea5c96c
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
	.word	0x88a28424,0xb440e5a6,0x3d06c7ea,0xf36ffe22
	.word	0x347e920e,0xb40605ea,0x3c334bfa,0xe5ec94b8
	.word	0x043335ab,0x48021096,0x3abe3d91,0x183a0ab5
	.word	0x14dcaef4,0x2975bc2d,0xfccaff57,0x35cd25d0
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
	.word	0x10ef94e2,0xcd6de01a,0xfc90eb4e,0x80db160c
	.word	0x093a3925,0x3c30a3a2,0xdc687efe,0x9e34a28f
	.word	0x1f44758d,0x0c75d9b9,0xa673e23e,0x891d7ef6
	.word	0xe1dd814d,0xe0de13fb,0x6fd3ffde,0x02cfc061
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
	.word	0x54775d61,0x8c1a090d,0x8e1b99d7,0xbb2677ac
	.word	0x779259d1,0xc04a6dbc,0x8c117229,0x9f70a1f9
	.word	0xfc14b011,0x4b6cafd5,0x95303980,0xa5f1a9a2
	.word	0x7000520f,0xdd372ab3,0xd1862b88,0xb49ffcaf
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
	.word	0x125544af,0x05de4c1a,0x3ce3b456,0x81180082
	.word	0x690e0655,0x90deefd7,0x03603d2a,0xe05834f5
	.word	0xfb6921e2,0x8adf232b,0xdcdc5116,0x36cbb7d0
	.word	0x73b8a3cb,0xb77c5413,0x2a621bf7,0x02c1597d
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
	.word	0xad9f63ff,0x8ce02fac,0x01892ffe,0x2bd3735d
	.word	0xf62dfc4e,0xc98e3812,0xb21980c4,0x6fb71394
	.word	0xde1a96d2,0x4b7f7ac8,0x5fc6552c,0x1fe26fae
	.word	0x1a1ec5fc,0x7178a96b,0x516ab524,0x248e193a
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
	.word	0xf1c5df00,0x2c1a6658,0x7c3654d6,0x6c302671
	.word	0x354f70e9,0x7101debc,0x4f04014c,0x220f3073
	.word	0x0a71f60f,0x8cdf3de7,0xf87578b5,0xb6bfff33
	.word	0x9a2461d6,0x6613b8c5,0x97093227,0xdcbe6e7d
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
	.word	0xd146b027,0x710a3b45,0xc86f0d0b,0x927067e1
	.word	0xa368771a,0xd0032ce2,0x1f01e0ee,0x3b1a4b65
	.word	0x6081bef2,0x86a0be79,0x3aefa7e1,0xadf9f778
	.word	0x9e93528b,0x9cd10952,0x9549ef5e,0xfbc4b379
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
	.word	0xcbffaae5,0xb81fea02,0xf2184855,0xbd4e8066
	.word	0x4472f3a0,0xdd6c6fd6,0x7946d93e,0x9942070c
	.word	0x0cad1a87,0x16f9d277,0x5be758f2,0x8e4c5c7f
	.word	0x73d5844e,0x75852610,0x8998c3a1,0x64e0fbd1
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
	.word	0xf4f2ca28,0xb6cf7337,0x22d90896,0x530e222d
	.word	0x19e35666,0x015e4f85,0x4c48a05e,0xaee829d5
	.word	0x8c263816,0x21df356d,0x48fefd5c,0xd5821887
	.word	0xef8a753e,0xa89f3a56,0x98c0c3e1,0x2c49dfe5
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
	.word	0xf87496da,0x01e7ffe7,0x7a555fba,0x124cb2c7
	.word	0x6fccc237,0x32648985,0x296a7add,0x5650f73a
	.word	0xbe6494a6,0x0e14473c,0x7a77a4b4,0x9d9acf2d
	.word	0xf39b705b,0xc5ea0b71,0x7bf46ccb,0x890d9fc6
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
	.word	0x32702f93,0x1db6c076,0xd8d112e2,0x49bec8ce
	.word	0xdf3a9569,0xe95d0a0f,0x060667ad,0xa2641e9a
	.word	0x0c8a24d1,0x5b35b7b7,0x819db43a,0xe05768f7
	.word	0x03835268,0x73b719d1,0xebcabddf,0x88fc15fa
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
	.word	0x42205d66,0xe650bdc0,0xa2bd43ae,0x26111a42
	.word	0x4e4bbc42,0x0f129d3e,0x82ae12fc,0x01792b44
	.word	0x6bba7aae,0x1e5fd513,0xf468e37f,0x0b5a531d
	.word	0xf6dca653,0xb02daabc,0xe9b72f47,0x98880ba4
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
	.word	0x7d4712a6,0xde7ce6d5,0xbd8426d4,0xc2b7298c
	.word	0x5cef78ea,0x18135046,0x92ebc9a2,0xc5910333
	.word	0x7c5cdd05,0xe8f438d9,0x093def71,0x87824a0d
	.word	0x87cbb125,0xb0e638f6,0x567787ff,0x772db599
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
	.word	0x6ba2dcff,0x969aa2da,0xefb5c107,0x446c0b6a
	.word	0xad6b4df0,0xc79a62b7,0x3411b3bb,0x647888e2
	.word	0xc3f40c11,0x390065e5,0xe987b872,0xc6505146
	.word	0x3667119b,0x02557304,0xe9944756,0x52ff0c20
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
	.word	0x126cde6c,0x57d5b669,0x20f2eae0,0xd58c3fc4
	.word	0x7d1e5384,0x7f345ee2,0xfe325666,0xeff03cff
	.word	0x890f2600,0x049791d9,0xdc522017,0x7acafd09
	.word	0x48f09f3b,0xa644c66d,0x70b538eb,0x5f2f6847
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
	.word	0x61e468e7,0x641dedab,0x306aa704,0x559bf337
	.word	0xf99be28b,0xea4fcbc7,0x5f57cd5e,0xa5394248
	.word	0x6e75cfac,0x87f8d950,0x6843d4c0,0x08917fb6
	.word	0x7e0814a7,0x077543ec,0x1a1b61f1,0x9b818089
	.word	0x61300345,0x6d3b1ac0,0x5178e7e4,0x9eb69eb2
	.word	0x273a2291,0x58671440,0xc62505e0,0xded99e4d
	.word	0xfedb1ba9,0x9aa67490,0x619cd437,0x12b92c04
	.word	0x630f63ea,0x663ffd70,0xb4160e04,0xccf3cab5
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
	.word	0xd561622e,0x8e28ec93,0xced4b6ad,0x300b7081
	.word	0xf311999e,0x7835a36e,0x3c404669,0xd116d56b
	.word	0x29509919,0x30f4011b,0x32304fe2,0xd26052ae
	.word	0x15f57aef,0x9e45f228,0x07f348b8,0xf569357d
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
	.word	0x95787193,0x996da118,0xf7304cf5,0x7e9739bf
	.word	0x116c8c3a,0x917e3c33,0x99886cea,0x93601035
	.word	0x84808e9a,0x65dc9e54,0x65a1fe2f,0xd9225aa8
	.word	0x678215a1,0xe8e5c832,0xf233b36e,0x5280dfdf
	.word	0xb2866a20,0xaed44102,0x54c10af0,0xd1f72a4a
	.word	0x2f9cad2f,0x8f68a88d,0x01cb1a1b,0x5f9c4c9d
	.word	0x539d7b32,0x27b80b31,0x0eba96f3,0xb5b0fb1f
	.word	0x7b96564b,0x54620f8d,0x0d10a042,0xe4c47f3b
	.word	0xee02e4e3,0xceec97f8,0xda27337e,0x4cd00bfd
	.word	0xae788adf,0x9781b3c7,0x7c4f2d6c,0x4beb5410
	.word	0xb11c6355,0xe91f329f,0xde5aecbc,0x790d237d
	.word	0x8857ad51,0x35ffcee0,0x125fa877,0x30c98115
	.word	0x4209afb8,0x1a0cb64e,0xa918f770,0x48dfd205
	.word	0x2dc42c36,0x55e0848b,0x52bc4911,0x7f5a3081
	.word	0x040a23fd,0xa6b6394f,0x9edc8d20,0x3cd396e0
	.word	0xc8965a58,0xd7bd04e4,0xaf1fb91c,0x8519ee6a
	.word	0x161494a7,0x751918ec,0xe35fcf25,0x72da1668
	.word	0xfb1a223d,0xabf9fcfe,0x34e6672e,0xfba62cd5
	.word	0x298420c1,0xa964cf85,0x5c67ec71,0x5eb1ba32
	.word	0x828aa027,0x6f951199,0x14cb328f,0x62fd97b8
	.word	0x7171f79c,0x56bd6c0f,0x85e3f2d5,0xc65f811d
	.word	0xa6e95c4a,0xc3cf0841,0x1cb4ee1b,0x372cc984
	.word	0xb895fdbb,0x26d0e4dd,0x001ccd10,0x58897ab6
	.word	0xede8c2a5,0x5e14227a,0x6e98a5f2,0x34856a4c
	.word	0x026e1af7,0x15724510,0x6f1a7032,0xc33337c0
	.word	0x230d1689,0x866facf4,0x48dae9f8,0x267063a1
	.word	0x020ce403,0x9f0eddff,0x350670ce,0x83a5b62a
	.word	0xa0950224,0x7a0786a8,0x85d70577,0x945686e6
	.word	0x3556f6ef,0x15209e7c,0x19dd9964,0xe908bfdd
	.word	0xde8f5d3d,0x69663a31,0x3b378feb,0xed6b3b88
	.word	0x1e9dfed1,0x3b340fa1,0x4d477a7d,0x185dbdd2
	.word	0x0bf1330f,0x6d399219,0xf8c93dcf,0x92bb3a76
share3_end:
