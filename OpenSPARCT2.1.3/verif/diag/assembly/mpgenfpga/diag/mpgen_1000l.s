/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1000l.s
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
!	Seed = 626160649
!	Riesling can be on
!	1 Thread, 1000 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_1000l_1.s created on Jun 26, 2009 (16:06:49)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_1000l_1 -p 1 -l 1000

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
!	%f0  = 4a8f94f0 0c08eb41 36fb41ae 65f1d647
!	%f4  = 5834e4dc 437c17fd 651c95fa 40d2b9e3
!	%f8  = 777d4888 6ee6b179 0c2cac06 2da3403f
!	%f12 = 38320bf4 16ad53b5 596c2fd2 3a45e55b
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 1eee3b20 16a75ab1 190b8d5e 5ef5e537
!	%f20 = 02caa20c 099ae26d 1636f0aa 66a33bd3
!	%f24 = 6ac9ccb8 5d78c6e9 08e245b6 160ea52f
!	%f28 = 77040724 6c58a425 7d553882 4da59d4b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 21935d50 3634d621 6177350e 221e6027
!	%f36 = 633f9b3c 176678dd 23db675a 27d3e9c3
!	%f40 = 07ea4ce8 17e16859 108cbb66 6ce1f61f
!	%f44 = 3ebabe54 2f304095 5799dd32 5e01013b
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xc41cb7060000007a,%g7,%g1 ! %gsr scale = 15, align = 2
	wr	%g1,%g0,%gsr		! %gsr = c41cb7060000007a

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 10be0434, %l7 = 7c59f5d774e355db
	ldstuba	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000034
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	%l1 = 86b7c68342346789, Mem[0000000021800100] = 39dfe1d0, %asi = 80
	stha	%l1,[%o3+0x100]%asi	! Mem[0000000021800100] = 6789e1d0
!	Mem[00000000100c1408] = 0d95628e, %l4 = 030c90a5a5f5cfea
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 000000000000000d
!	Mem[0000000010001408] = 6e98ac61, %l0 = 47701fb4c72330de
	ldstuba	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000061
!	Mem[00000000100c1400] = d0de4d21, %l6 = 00000000cd9109d0
	swapa	[%i3+%g0]0x88,%l6	! %l6 = 00000000d0de4d21
!	%l5 = fd30dd24543ac8d5, %l0 = 0000000000000061, %l5 = fd30dd24543ac8d5
	sdivx	%l5,%l0,%l5		! %l5 = fff89612d947dd20
!	Mem[00000000100c1400] = d00991cd, %l1 = 0000000042346789, %asi = 80
	swapa	[%i3+0x000]%asi,%l1	! %l1 = 00000000d00991cd
!	%l3 = 6c405a3df00cec0f, Mem[00000000300c1408] = 1c5e463e
	stba	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0f5e463e
!	%l3 = 6c405a3df00cec0f, Mem[000000001010140a] = 79a085ee
	sth	%l3,[%i4+0x00a]		! Mem[0000000010101408] = 79a0ec0f
!	Mem[00000000100c1414] = 4597dc5d, %l5 = 00000000d947dd20
	swap	[%i3+0x014],%l5		! %l5 = 000000004597dc5d

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 0a2f4c40, %l0 = 0000000000000061
	ldsba	[%i1+%g0]0x81,%l0	! %l0 = 000000000000000a
!	Mem[0000000010101400] = 3057df32, %l3 = 6c405a3df00cec0f
	lduha	[%i4+%g0]0x88,%l3	! %l3 = 000000000000df32
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	Mem[00000000201c0000] = 37676050, %l6 = 00000000d0de4d21, %asi = 80
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = 0000000000003767
!	Mem[0000000030101410] = 627dc84c, %l4 = 000000000000000d
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000062
!	Mem[0000000010181418] = 620f60fa793f78e3, %l4 = 0000000000000062
	ldx	[%i6+0x018],%l4		! %l4 = 620f60fa793f78e3
!	Mem[0000000010001410] = 5173419c, %l0 = 000000000000000a
	lduwa	[%i0+%o5]0x80,%l0	! %l0 = 000000005173419c
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0000] = 5e0aeee0, %l5 = 000000004597dc5d, %asi = 80
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000005e0a
!	Mem[0000000010041400] = 10be04ff, %l7 = 0000000000000034
	lduha	[%i1+%g0]0x88,%l7	! %l7 = 00000000000004ff
!	Mem[0000000010001410] = bd09802b 9c417351, %l6 = 00003767, %l7 = 000004ff
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 000000009c417351 00000000bd09802b
	membar	#Sync			! Added by membar checker (1)
!	Mem[00000000300c1400] = 01dc5d00 538e4911 0f5e463e 7e64ae97
!	Mem[00000000300c1410] = 1560e9ec 63399ecd 55297f8a 7854c333
!	Mem[00000000300c1420] = 3cc91a98 4680b149 7d048a96 61e74a8f
!	Mem[00000000300c1430] = 26833b04 3eb91c85 4bbd1362 2d37c0ab
	ldda	[%i3+%g0]ASI_BLK_AIUS,%f16	! Block Load from 00000000300c1400

p0_label_3:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (2)
!	%l4 = 620f60fa793f78e3, Mem[00000000300c1410] = ece96015
	stha	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = ece978e3
!	Mem[0000000010141410] = 7c916309, %l3 = 000000000000df32
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 000000007c916309
!	Mem[0000000010081410] = 5c5eb576, %l4 = 620f60fa793f78e3
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000076
!	%l5 = 0000000000005e0a, Mem[0000000030001410] = 7367eecc
	stwa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00005e0a
!	Mem[0000000010181400] = f0179452, %l4 = 0000000000000076
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000052
!	%l0 = 000000005173419c, Mem[000000001018141b] = 620f60fa, %asi = 80
	stba	%l0,[%i6+0x01b]%asi	! Mem[0000000010181418] = 620f609c
!	Mem[0000000021800180] = 1f00da30, %l2 = f991b1f311c57a44
	ldstuba	[%o3+0x180]%asi,%l2	! %l2 = 000000000000001f
!	%l6 = 000000009c417351, Mem[0000000030101408] = 5bff219e
	stha	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 7351219e
!	Mem[0000000010101410] = 1ebb3b1c, %l1 = 00000000d00991cd
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 000000001ebb3b1c
!	Mem[0000000010001410] = 9c417351, %l3 = 000000007c916309
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 000000009c417351

p0_label_4:
!	Starting 10 instruction Load Burst
!	%f28 = 26833b04, %f22 = 55297f8a, %f29 = 3eb91c85
	fadds	%f28,%f22,%f29		! %f29 = 55297f8a
!	%l6 = 000000009c417351, imm = 0000000000000230, %l0 = 000000005173419c
	andn	%l6,0x230,%l0		! %l0 = 000000009c417141
!	Mem[0000000030101400] = f13b0c4f 60cd6145, %l6 = 9c417351, %l7 = bd09802b
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 0000000060cd6145 00000000f13b0c4f
!	Mem[0000000010141408] = 31dd194e, %l3 = 000000009c417351
	ldswa	[%i5+%o4]0x80,%l3	! %l3 = 0000000031dd194e
!	Mem[0000000010041400] = e13bed7810be04ff, %f18 = 0f5e463e 7e64ae97
	ldda	[%i1+%g0]0x88,%f18	! %f18 = e13bed78 10be04ff
!	Mem[0000000030141408] = 57022049fe6c5d51, %f8  = 777d4888 6ee6b179
	ldda	[%i5+%o4]0x89,%f8 	! %f8  = 57022049 fe6c5d51
!	Mem[0000000010101408] = 79a0ec0f, %l0 = 000000009c417141
	lduba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000079
!	Mem[0000000010081408] = 2eafa377, %l7 = 00000000f13b0c4f
	lduha	[%i2+%o4]0x88,%l7	! %l7 = 000000000000a377
!	Mem[00000000100c1400] = a1614661 89673442, %l2 = 0000001f, %l3 = 31dd194e
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 0000000089673442 00000000a1614661
!	%l0 = 0000000000000079, %l4 = 0000000000000052, %l5 = 0000000000005e0a
	addc	%l0,%l4,%l5		! %l5 = 00000000000000cb

p0_label_5:
!	Starting 10 instruction Store Burst
!	%l0 = 00000079, %l1 = 1ebb3b1c, Mem[0000000010001408] = 6e98acff 079a7832
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000079 1ebb3b1c
!	%l4 = 0000000000000052, Mem[00000000100c1410] = 2373d4bc
	stha	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0052d4bc
!	%l4 = 0000000000000052, Mem[0000000010001410] = 0963917c2b8009bd
	stx	%l4,[%i0+%o5]		! Mem[0000000010001410] = 0000000000000052
!	%f18 = e13bed78 10be04ff, Mem[0000000010181410] = dcd74460 fd5e385a
	stda	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = e13bed78 10be04ff
!	Mem[0000000010181418] = 620f609c, %l5 = 00000000000000cb, %asi = 80
	swapa	[%i6+0x018]%asi,%l5	! %l5 = 00000000620f609c
!	%l2 = 89673442, %l3 = a1614661, Mem[0000000030141410] = 71e796ac 1ff2a08d
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 89673442 a1614661
!	Mem[000000001008141c] = 00e39963, %l3 = 00000000a1614661, %asi = 80
	swapa	[%i2+0x01c]%asi,%l3	! %l3 = 0000000000e39963
!	Mem[0000000030101400] = 60cd6145, %l5 = 00000000620f609c
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 0000000060cd6145
!	%l5 = 0000000060cd6145, Mem[0000000010181410] = 10be04ff
	stwa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 60cd6145
!	%l7 = 000000000000a377, Mem[0000000030141408] = 515d6cfe
	stwa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000a377

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 10be04ff, %l6 = 0000000060cd6145
	ldsha	[%i1+%g0]0x88,%l6	! %l6 = 00000000000004ff
!	Mem[0000000030101408] = 7780f172 9e215173, %l4 = 00000052, %l5 = 60cd6145
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 000000009e215173 000000007780f172
!	Mem[0000000030001410] = 00005e0a, %l1 = 000000001ebb3b1c
	ldsha	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = ae1c6328, %l4 = 000000009e215173
	lduba	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000028
!	Mem[00000000100c1404] = 614661a1, %l5 = 000000007780f172, %asi = 80
	ldswa	[%i3+0x004]%asi,%l5	! %l5 = 00000000614661a1
!	%l6 = 000004ff, %l7 = 0000a377, Mem[0000000030081400] = a0dce829 31866429
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 000004ff 0000a377
!	%l5 = 00000000614661a1, %l7 = 000000000000a377, %l7 = 000000000000a377
	orn	%l5,%l7,%l7		! %l7 = ffffffffffff7da9
!	Mem[0000000030181400] = 207e8268, %l2 = 0000000089673442
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000068
!	Mem[0000000030041408] = 69f4df7e, %l5 = 00000000614661a1
	lduwa	[%i1+%o4]0x81,%l5	! %l5 = 0000000069f4df7e
!	Mem[0000000010101418] = 14880e3a55282923, %l5 = 0000000069f4df7e
	ldx	[%i4+0x018],%l5		! %l5 = 14880e3a55282923

p0_label_7:
!	Starting 10 instruction Store Burst
!	%l2 = 00000068, %l3 = 00e39963, Mem[0000000010081410] = 5c5eb5ff 7dbb201a
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000068 00e39963
!	%l2 = 00000068, %l3 = 00e39963, Mem[00000000100c1408] = 8e6295ff a767c90b
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000068 00e39963
!	Mem[0000000010101408] = 79a0ec0f, %l0 = 0000000000000079
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000079
!	Mem[0000000010141418] = 3c697f9a, %l0 = 00000079, %l3 = 00e39963
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 000000003c697f9a
!	Mem[0000000010001400] = 299d15b0, %l5 = 0000000055282923
	swap	[%i0+%g0],%l5		! %l5 = 00000000299d15b0
!	%l3 = 000000003c697f9a, Mem[0000000010041410] = 53a7d7fc, %asi = 80
	stba	%l3,[%i1+0x010]%asi	! Mem[0000000010041410] = 9aa7d7fc
!	%f12 = 38320bf4 16ad53b5, %l2 = 0000000000000068
!	Mem[0000000030181438] = 5b08a38242ec7c4b
	add	%i6,0x038,%g1
	stda	%f12,[%g1+%l2]ASI_PST32_S ! Mem[0000000030181438] = 5b08a38242ec7c4b
!	Mem[0000000010101406] = 3f7b3c81, %l0 = 0000000000000079
	ldstub	[%i4+0x006],%l0		! %l0 = 000000000000003c
!	Mem[0000000010041420] = 095025a8, %l3 = 000000003c697f9a, %asi = 80
	swapa	[%i1+0x020]%asi,%l3	! %l3 = 00000000095025a8
!	%l2 = 0000000000000068, Mem[0000000030181400] = 207e8268
	stwa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000068

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00005e0a 5b6c042d, %l0 = 0000003c, %l1 = 00000000
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 0000000000005e0a 000000005b6c042d
!	%l3 = 00000000095025a8, %l3 = 00000000095025a8, %l4 = 0000000000000028
	addc	%l3,%l3,%l4		! %l4 = 0000000012a04b50
!	Mem[0000000030181410] = 0c55762e, %l2 = 0000000000000068
	ldsba	[%i6+%o5]0x89,%l2	! %l2 = 000000000000002e
!	Mem[00000000100c1410] = 0052d4bc, %l5 = 00000000299d15b0
	ldsha	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000052
!	Mem[0000000010041408] = ce6bb33d, %l0 = 0000000000005e0a
	ldswa	[%i1+%o4]0x88,%l0	! %l0 = ffffffffce6bb33d
!	Mem[00000000100c1400] = 42346789614661a1, %l2 = 000000000000002e
	ldxa	[%i3+%g0]0x80,%l2	! %l2 = 42346789614661a1
!	Mem[0000000010001408] = 79000000, %l0 = ffffffffce6bb33d
	ldswa	[%i0+%o4]0x80,%l0	! %l0 = 0000000079000000
!	Mem[0000000010041400] = 10be04ff, %l3 = 00000000095025a8
	ldsba	[%i1+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181400] = f01794ff, %l3 = ffffffffffffffff
	lduba	[%i6+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = 404c2f0a, %l7 = ffffffffffff7da9
	ldswa	[%i1+%g0]0x89,%l7	! %l7 = 00000000404c2f0a

p0_label_9:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000079000000, Mem[0000000030181400] = 00000068
	stwa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 79000000
!	%f28 = 26833b04, Mem[000000001000142c] = 52dc5bff
	st	%f28,[%i0+0x02c]	! Mem[000000001000142c] = 26833b04
!	Mem[0000000030001410] = 00005e0a, %l3 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000005e0a
!	%f26 = 7d048a96 61e74a8f, %l2 = 42346789614661a1
!	Mem[0000000030081400] = ff04000077a30000
	stda	%f26,[%i2+%l2]ASI_PST32_S ! Mem[0000000030081400] = ff04000061e74a8f
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800040] = 680098b0, %l7 = 00000000404c2f0a
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 0000000000000068
!	%l2 = 42346789614661a1, Mem[0000000030141410] = 89673442
	stba	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = a1673442
!	Mem[00000000218000c0] = 30bb1fa0, %l1 = 000000005b6c042d
	ldstuba	[%o3+0x0c0]%asi,%l1	! %l1 = 0000000000000030
!	Mem[0000000030141400] = 43d12dc0, %l0 = 0000000079000000
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000043
!	Mem[00000000201c0001] = 37676050, %l3 = 0000000000005e0a
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 0000000000000067
!	%f2  = 36fb41ae 65f1d647, %l1 = 0000000000000030
!	Mem[0000000010141420] = 4beb172839fba199
	add	%i5,0x020,%g1
	stda	%f2,[%g1+%l1]ASI_PST32_P ! Mem[0000000010141420] = 4beb172839fba199

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = deda621e, %l0 = 0000000000000043
	lduba	[%i2+%o4]0x89,%l0	! %l0 = 000000000000001e
!	Mem[0000000010001400] = 23292855, %l0 = 000000000000001e
	lduwa	[%i0+%g0]0x88,%l0	! %l0 = 0000000023292855
!	Mem[0000000030081408] = 1e62dade36c18cb7, %f28 = 26833b04 55297f8a
	ldda	[%i2+%o4]0x81,%f28	! %f28 = 1e62dade 36c18cb7
!	Mem[0000000010101408] = ffa0ec0f, %l1 = 0000000000000030
	ldsha	[%i4+%o4]0x80,%l1	! %l1 = ffffffffffffffa0
!	Mem[0000000030141400] = ffd12dc0, %l4 = 0000000012a04b50
	ldsba	[%i5+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041408] = 3db36bce, %l5 = 0000000000000052
	ldsb	[%i1+%o4],%l5		! %l5 = 000000000000003d
!	Mem[0000000010001400] = 23292855, %l7 = 0000000000000068
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 0000000023292855
!	Mem[0000000030041410] = 2cfdad62, %l5 = 000000000000003d
	ldsba	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000062
!	Mem[0000000030101408] = 7351219e, %l7 = 0000000023292855
	ldsha	[%i4+%o4]0x81,%l7	! %l7 = 0000000000007351
!	Mem[0000000010041410] = 9aa7d7fc0640ca9d, %l4 = ffffffffffffffff
	ldxa	[%i1+%o5]0x80,%l4	! %l4 = 9aa7d7fc0640ca9d

p0_label_11:
!	Starting 10 instruction Store Burst
!	%f24 = 3cc91a98 4680b149, %l7 = 0000000000007351
!	Mem[0000000010181408] = 28631cae7c956547
	add	%i6,0x008,%g1
	stda	%f24,[%g1+%l7]ASI_PST8_P ! Mem[0000000010181408] = 28c91c987c956549
!	%l2 = 614661a1, %l3 = 00000067, Mem[0000000010081410] = 68000000 6399e300
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 614661a1 00000067
!	%l4 = 9aa7d7fc0640ca9d, Mem[00000000211c0000] = 5e0aeee0, %asi = 80
	stba	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 9d0aeee0
!	%l1 = ffffffffffffffa0, Mem[0000000030081410] = 7bb8fb8c
	stba	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = a0b8fb8c
!	Mem[0000000030141400] = c02dd1ff, %l7 = 0000000000007351
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = 7351219e, %l3 = 0000000000000067
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000073
!	Mem[00000000100c1400] = 89673442, %l4 = 000000000640ca9d
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 0000000089673442
!	%l1 = ffffffffffffffa0, Mem[0000000030181408] = 6c91285e41a83437
	stxa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffffffffffa0
!	Code Fragment 4, seed = 35793
p0_fragment_1:
!	%l0 = 0000000023292855
	setx	0x56b35a84a93cba9e,%g7,%l0 ! %l0 = 56b35a84a93cba9e
!	%l1 = ffffffffffffffa0
	setx	0x1f4a2f8aaf2ac549,%g7,%l1 ! %l1 = 1f4a2f8aaf2ac549
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 56b35a84a93cba9e
	setx	0x6c91f29af2906c04,%g7,%l0 ! %l0 = 6c91f29af2906c04
!	%l1 = 1f4a2f8aaf2ac549
	setx	0xa4d7c088071831cf,%g7,%l1 ! %l1 = a4d7c088071831cf
p0_fragment_1_end:
!	Mem[0000000030001410] = ff000000, %l3 = 0000000000000073
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 2cfdad62, %l6 = 00000000000004ff
	lduba	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000062
!	Mem[0000000010141400] = 242ebf90, %l6 = 0000000000000062
	lduwa	[%i5+%g0]0x80,%l6	! %l6 = 00000000242ebf90
!	Mem[00000000100c1400] = 0640ca9d, %f15 = 3a45e55b
	lda	[%i3+%g0]0x88,%f15	! %f15 = 0640ca9d
!	Mem[0000000030001400] = 71902d39e0ab570b, %f2  = 36fb41ae 65f1d647
	ldda	[%i0+%g0]0x89,%f2 	! %f2  = 71902d39 e0ab570b
!	Mem[0000000010141434] = 76debdd5, %l0 = 6c91f29af2906c04, %asi = 80
	ldswa	[%i5+0x034]%asi,%l0	! %l0 = 0000000076debdd5
!	Mem[0000000010081418] = 43b27b7aa1614661, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i2+0x018]%asi,%l3	! %l3 = 43b27b7aa1614661
!	Mem[0000000010141408] = 4e19dd31, %f30 = 4bbd1362
	lda	[%i5+%o4]0x88,%f30	! %f30 = 4e19dd31
!	Mem[0000000010001410] = 00000000, %l6 = 00000000242ebf90
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 9dca4006614661a1, %f12 = 38320bf4 16ad53b5
	ldda	[%i3+%g0]0x80,%f12	! %f12 = 9dca4006 614661a1
!	Mem[0000000010001410] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000

p0_label_13:
!	Starting 10 instruction Store Burst
!	Mem[00000000218001c0] = 2b531060, %l0 = 0000000076debdd5
	ldstub	[%o3+0x1c0],%l0		! %l0 = 000000000000002b
!	%f6  = 651c95fa 40d2b9e3, Mem[0000000030041408] = 69f4df7e 73501ad7
	stda	%f6 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 651c95fa 40d2b9e3
!	Mem[0000000030181410] = 0c55762e, %l2 = 00000000614661a1
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 000000000c55762e
!	%l1 = a4d7c088071831cf, Mem[0000000010141400] = 242ebf9007004761
	stxa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = a4d7c088071831cf
!	%l7 = 0000000000000000, Mem[0000000030081408] = 1e62dade
	stwa	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l2 = 000000000c55762e, Mem[0000000010141424] = 39fba199, %asi = 80
	stwa	%l2,[%i5+0x024]%asi	! Mem[0000000010141424] = 0c55762e
!	%l5 = 0000000000000062, Mem[00000000201c0000] = 37ff6050, %asi = 80
	stba	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 62ff6050
!	%l6 = 0000000000000000, Mem[0000000010101400] = 3057df32
	stba	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 3057df00
!	Mem[0000000030081408] = 00000000, %l2 = 000000000c55762e
	ldstuba	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 0a2f4c406196f351, %l1 = a4d7c088071831cf
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = 0a2f4c406196f351

p0_label_14:
!	Starting 10 instruction Load Burst
!	%l0 = 000000000000002b, %l7 = 0000000000000000, %y  = 00000000
	umul	%l0,%l7,%l1		! %l1 = 0000000000000000, %y = 00000000
!	Mem[00000000100c140d] = 6399e300, %l5 = 0000000000000062, %asi = 80
	ldsba	[%i3+0x00d]%asi,%l5	! %l5 = ffffffffffffff99
!	Mem[00000000100c1408] = 00e39963 00000068, %l6 = 00000000, %l7 = 00000000
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000068 0000000000e39963
!	Mem[0000000010181408] = 28c91c98, %l5 = ffffffffffffff99
	lduha	[%i6+%o4]0x80,%l5	! %l5 = 00000000000028c9
!	Mem[0000000010081408] = 77a3af2e, %l5 = 00000000000028c9
	lduwa	[%i2+%o4]0x80,%l5	! %l5 = 0000000077a3af2e
!	Mem[00000000100c1410] = 0052d4bc, %l3 = 43b27b7aa1614661
	lduwa	[%i3+%o5]0x80,%l3	! %l3 = 000000000052d4bc
!	Mem[00000000201c0000] = 62ff6050, %l6 = 0000000000000068
	ldsb	[%o0+%g0],%l6		! %l6 = 0000000000000062
!	Mem[0000000010101410] = cd9109d0, %l5 = 0000000077a3af2e
	ldsba	[%i4+%o5]0x88,%l5	! %l5 = ffffffffffffffd0
!	Mem[00000000300c1400] = 01dc5d00, %l3 = 000000000052d4bc
	ldsha	[%i3+%g0]0x81,%l3	! %l3 = 00000000000001dc
!	Mem[0000000010181410] = 4561cd60, %l2 = 0000000000000000
	ldsba	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000045

p0_label_15:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 00000079, %l5 = ffffffffffffffd0
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000079
!	%l7 = 0000000000e39963, Mem[00000000100c141c] = 30a78943, %asi = 80
	stwa	%l7,[%i3+0x01c]%asi	! Mem[00000000100c141c] = 00e39963
!	Mem[00000000300c1400] = 005ddc01, %l1 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 00000000005ddc01
!	%f8  = 57022049 fe6c5d51, Mem[0000000010001430] = 400260b4 0b605d75, %asi = 80
	stda	%f8 ,[%i0+0x030]%asi	! Mem[0000000010001430] = 57022049 fe6c5d51
!	Mem[0000000010041408] = 3db36bce, %l5 = 0000000000000079
	swapa	[%i1+%o4]0x80,%l5	! %l5 = 000000003db36bce
!	Mem[0000000030141400] = c02dd1ff, %l2 = 0000000000000045
	swapa	[%i5+%g0]0x89,%l2	! %l2 = 00000000c02dd1ff
!	%l7 = 0000000000e39963, Mem[000000001004142e] = 514a71df, %asi = 80
	stha	%l7,[%i1+0x02e]%asi	! Mem[000000001004142c] = 514a9963
!	%f10 = 0c2cac06 2da3403f, %l6 = 0000000000000062
!	Mem[0000000030141430] = 28cddfc41b4b3645
	add	%i5,0x030,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_S ! Mem[0000000030141430] = 282cacc41b4b4045
!	Mem[00000000300c1400] = 00000000 538e4911 0f5e463e 7e64ae97
!	%f16 = 01dc5d00 538e4911 e13bed78 10be04ff
!	%f20 = 1560e9ec 63399ecd 55297f8a 7854c333
!	%f24 = 3cc91a98 4680b149 7d048a96 61e74a8f
!	%f28 = 1e62dade 36c18cb7 4e19dd31 2d37c0ab
	stda	%f16,[%i3+%g0]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%f18 = e13bed78 10be04ff, Mem[0000000010101438] = 2f0ad012 75e8dc9b
	std	%f18,[%i4+0x038]	! Mem[0000000010101438] = e13bed78 10be04ff

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 4500000036d65ed1, %l1 = 00000000005ddc01
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = 4500000036d65ed1
	membar	#Sync			! Added by membar checker (3)
!	Mem[00000000300c1408] = ff04be10, %l4 = 0000000089673442
	ldsha	[%i3+%o4]0x81,%l4	! %l4 = ffffffffffffff04
!	Mem[00000000100c1410] = bcd45200, %l5 = 000000003db36bce
	ldsba	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101430] = 51764a34, %l4 = ffffffffffffff04
	ldsw	[%i4+0x030],%l4		! %l4 = 0000000051764a34
!	Mem[0000000030041410] = 62adfd2c, %l7 = 0000000000e39963
	ldsba	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000062
!	Mem[0000000030001410] = ff0000ff, %l0 = 000000000000002b
	lduba	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001400] = 55282923, %l0 = 00000000000000ff
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000055
!	Mem[0000000030041400] = 0a2f4c40, %f9  = fe6c5d51
	lda	[%i1+%g0]0x81,%f9 	! %f9 = 0a2f4c40
!	Mem[0000000010001408] = 000000ff, %f29 = 36c18cb7
	lda	[%i0+%o4]0x88,%f29	! %f29 = 000000ff
!	Mem[0000000010001410] = 00000000, %l7 = 0000000000000062
	ldswa	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000

p0_label_17:
!	Starting 10 instruction Store Burst
!	%f10 = 0c2cac06 2da3403f, Mem[0000000030081410] = a0b8fb8c 62c9e5ed
	stda	%f10,[%i2+%o5]0x81	! Mem[0000000030081410] = 0c2cac06 2da3403f
!	%l4 = 0000000051764a34, Mem[0000000010141410] = 1dae2b790000df32
	stxa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000051764a34
!	%l4 = 51764a34, %l5 = 00000000, Mem[0000000030141408] = 0000a377 49200257
	stda	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 51764a34 00000000
!	Mem[0000000030181400] = 79000000, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 790000ff, %l0 = 0000000000000055
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 00000000790000ff
!	Mem[0000000010141410] = 344a7651, %l3 = 00000000000001dc
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000034
!	%l6 = 0000000000000062, Mem[0000000030081400] = ff040000
	stba	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 62040000
!	Mem[0000000010041410] = 9aa7d7fc, %l1 = 0000000036d65ed1
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 000000009aa7d7fc
!	%l2 = 00000000c02dd1ff, Mem[00000000300c1410] = cd9e3963
	stha	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = d1ff3963
!	%f4  = 5834e4dc 437c17fd, Mem[0000000030101410] = 4cc87d62 ad877413
	stda	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 5834e4dc 437c17fd

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 9e2151ff, %f7  = 40d2b9e3
	lda	[%i4+%o4]0x89,%f7 	! %f7 = 9e2151ff
!	Mem[00000000201c0001] = 62ff6050, %l1 = 000000009aa7d7fc
	ldsb	[%o0+0x001],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010001408] = ff000000 1c3bbb1e, %l6 = 00000062, %l7 = 00000000
	ldd	[%i0+%o4],%l6		! %l6 = 00000000ff000000 000000001c3bbb1e
!	%l4 = 0000000051764a34, %l4 = 0000000051764a34, %l2 = 00000000c02dd1ff
	or	%l4,%l4,%l2		! %l2 = 0000000051764a34
!	Code Fragment 4, seed = 368651
p0_fragment_2:
!	%l0 = 00000000790000ff
	setx	0x52679069543f72ce,%g7,%l0 ! %l0 = 52679069543f72ce
!	%l1 = ffffffffffffffff
	setx	0x8969ddedab37c679,%g7,%l1 ! %l1 = 8969ddedab37c679
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 52679069543f72ce
	setx	0xf90c4c47f6096634,%g7,%l0 ! %l0 = f90c4c47f6096634
!	%l1 = 8969ddedab37c679
	setx	0xda863185e06fd4ff,%g7,%l1 ! %l1 = da863185e06fd4ff
p0_fragment_2_end:
!	Mem[000000001010143e] = 10be04ff, %l7 = 000000001c3bbb1e
	ldub	[%i4+0x03e],%l7		! %l7 = 0000000000000004
!	Mem[0000000030001410] = ff0000ff, %l5 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041408] = 651c95fa, %l5 = ffffffffffffffff
	lduwa	[%i1+%o4]0x81,%l5	! %l5 = 00000000651c95fa
!	Mem[0000000020800000] = 3acdbe80, %l4 = 0000000051764a34, %asi = 80
	lduba	[%o1+0x000]%asi,%l4	! %l4 = 000000000000003a
!	Mem[0000000010101408] = ffa0ec0f580a6187, %f10 = 0c2cac06 2da3403f
	ldd	[%i4+%o4],%f10		! %f10 = ffa0ec0f 580a6187

p0_label_19:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = ffffffff, %l1 = da863185e06fd4ff
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%l6 = ff000000, %l7 = 00000004, Mem[0000000030101408] = 9e2151ff 7780f172
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000 00000004
!	Mem[00000000100c1408] = 68000000, %l2 = 0000000051764a34
	swap	[%i3+%o4],%l2		! %l2 = 0000000068000000
!	%l0 = f90c4c47f6096634, Mem[0000000010181420] = 02b3ab88, %asi = 80
	stwa	%l0,[%i6+0x020]%asi	! Mem[0000000010181420] = f6096634
!	%l6 = ff000000, %l7 = 00000004, Mem[0000000010141400] = a4d7c088 071831cf
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = ff000000 00000004
!	Mem[00000000100c1410] = 0052d4bcd947dd20, %l1 = 00000000000000ff
	ldx	[%i3+%o5],%l1		! %l1 = 0052d4bcd947dd20
!	%l6 = 00000000ff000000, Mem[0000000021800180] = ff00da30
	sth	%l6,[%o3+0x180]		! Mem[0000000021800180] = 0000da30
!	Mem[0000000030041408] = 651c95fa, %l4 = 000000000000003a
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 00000000651c95fa
!	Mem[0000000010041400] = ff04be10, %l0 = 00000000f6096634
	swapa	[%i1+%g0]0x80,%l0	! %l0 = 00000000ff04be10
!	Mem[00000000100c1410] = bcd45200, %l1 = 0052d4bcd947dd20
	ldsba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 62ff6050, %l6 = 00000000ff000000, %asi = 80
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000062
!	%l7 = 0000000000000004, immd = fffff28f, %y  = 00000000
	udiv	%l7,-0xd71,%l3		! %l3 = 0000000000000000
	mov	%l0,%y			! %y = ff04be10
!	Mem[0000000010101432] = 51764a34, %l3 = 0000000000000000, %asi = 80
	lduha	[%i4+0x032]%asi,%l3	! %l3 = 0000000000004a34
!	Mem[0000000010141410] = ff4a7651, %l1 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101410] = fd177c43, %l2 = 0000000068000000
	ldswa	[%i4+%o5]0x81,%l2	! %l2 = fffffffffd177c43
!	Mem[0000000010041428] = 35432a26514a9963, %l7 = 0000000000000004, %asi = 80
	ldxa	[%i1+0x028]%asi,%l7	! %l7 = 35432a26514a9963
!	Mem[0000000010001400] = 23292855, %l0 = 00000000ff04be10
	lduba	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000055
!	Mem[0000000030001408] = 02fc541e, %l1 = 00000000000000ff
	ldsha	[%i0+%o4]0x81,%l1	! %l1 = 00000000000002fc
!	Mem[0000000030181400] = 00000055, %f18 = e13bed78
	lda	[%i6+%g0]0x89,%f18	! %f18 = 00000055
!	Mem[0000000010081400] = 2e225670, %l0 = 0000000000000055
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = 000000002e225670

p0_label_21:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000004a34, Mem[0000000010101408] = 0feca0ff
	stha	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 0fec4a34
!	Mem[0000000030081410] = 06ac2c0c, %l4 = 00000000651c95fa
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 0000000006ac2c0c
!	%f2  = 71902d39, Mem[0000000030041400] = 404c2f0a
	sta	%f2 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 71902d39
!	%f26 = 7d048a96 61e74a8f, Mem[0000000010141410] = ff4a7651 00000000
	stda	%f26,[%i5+%o5]0x80	! Mem[0000000010141410] = 7d048a96 61e74a8f
!	%l7 = 35432a26514a9963, immd = fffffa4e, %y  = ff04be10
	udiv	%l7,-0x5b2,%l5		! %l5 = 00000000ff04c3bc
	mov	%l0,%y			! %y = 2e225670
!	%f4  = 5834e4dc 437c17fd, Mem[0000000010001420] = 2b134148 1a724f39, %asi = 80
	stda	%f4 ,[%i0+0x020]%asi	! Mem[0000000010001420] = 5834e4dc 437c17fd
!	%l2 = fd177c43, %l3 = 00004a34, Mem[00000000100c1418] = 3cd30cda 00e39963
	std	%l2,[%i3+0x018]		! Mem[00000000100c1418] = fd177c43 00004a34
!	%l2 = fd177c43, %l3 = 00004a34, Mem[0000000010181400] = ff9417f0 68cd8241
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = fd177c43 00004a34
!	Mem[0000000010041400] = 346609f6, %l6 = 0000000000000062
	ldstuba	[%i1+%g0]0x88,%l6	! %l6 = 00000000000000f6
!	%l6 = 00000000000000f6, Mem[0000000010181410] = 60cd6145
	stba	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 60cd61f6

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 1e54fc02, %l4 = 0000000006ac2c0c
	lduha	[%i0+%o4]0x89,%l4	! %l4 = 000000000000fc02
!	Mem[0000000010001410] = 00000000, %l7 = 35432a26514a9963
	ldsba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 346609ff, %l1 = 00000000000002fc
	ldswa	[%i1+%g0]0x88,%l1	! %l1 = 00000000346609ff
!	Mem[0000000010041400] = 346609ff, %l0 = 000000002e225670
	lduwa	[%i1+%g0]0x88,%l0	! %l0 = 00000000346609ff
!	Mem[0000000010141410] = 968a047d, %l2 = fffffffffd177c43
	ldsha	[%i5+%o5]0x88,%l2	! %l2 = 000000000000047d
!	Mem[0000000010101408] = 87610a580fec4a34, %l0 = 00000000346609ff
	ldxa	[%i4+%o4]0x88,%l0	! %l0 = 87610a580fec4a34
!	Mem[0000000010081400] = c1b66967 7056222e, %l0 = 0fec4a34, %l1 = 346609ff
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 000000007056222e 00000000c1b66967
!	Mem[0000000010081400] = 2e225670 6769b6c1 77a3af2e 56961dc7
!	Mem[0000000010081410] = 614661a1 00000067 43b27b7a a1614661
!	Mem[0000000010081420] = 66f8fa08 1836acf9 7bc98986 65e437bf
!	Mem[0000000010081430] = 6e2e7574 40a82735 4a618552 78d274db
	ldda	[%i2+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010081400
!	%l0 = 000000007056222e, imm = fffffffffffff082, %l5 = 00000000ff04c3bc
	subc	%l0,-0xf7e,%l5		! %l5 = 00000000705631ac
!	Mem[00000000201c0001] = 62ff6050, %l4 = 000000000000fc02, %asi = 80
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = ffffffffffffffff

p0_label_23:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = d15ed636, %l6 = 00000000000000f6
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 00000000d15ed636
!	%l0 = 7056222e, %l1 = c1b66967, Mem[0000000030081410] = fa951c65 2da3403f
	stda	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 7056222e c1b66967
!	Mem[0000000030041408] = 3a000000, %l5 = 00000000705631ac
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%l6 = 00000000d15ed636, Mem[0000000030041410] = 62adfd2c
	stba	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 36adfd2c
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000030081408] = ff000000 36c18cb7
	stda	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffffff 00000000
!	Mem[00000000211c0000] = 9d0aeee0, %l3 = 0000000000004a34
	ldstub	[%o2+%g0],%l3		! %l3 = 000000000000009d
!	%f0  = 2e225670 6769b6c1, Mem[0000000010041438] = 317c87f2 180f48fb
	std	%f0 ,[%i1+0x038]	! Mem[0000000010041438] = 2e225670 6769b6c1
!	%l5 = 0000000000000000, Mem[0000000030181400] = b1b1e45100000055
	stxa	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000000
!	Mem[00000000300c1410] = d1ff3963, %l3 = 000000000000009d
	ldstuba	[%i3+%o5]0x81,%l3	! %l3 = 00000000000000d1
!	%l1 = 00000000c1b66967, Mem[0000000010001408] = ff000000
	stba	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 67000000

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = d00991cd531e2d3d, %l4 = ffffffffffffffff
	ldxa	[%i4+%o5]0x80,%l4	! %l4 = d00991cd531e2d3d
!	%l2 = 000000000000047d, %l6 = 00000000d15ed636, %l7 = 0000000000000000
	andn	%l2,%l6,%l7		! %l7 = 0000000000000049
!	Mem[00000000100c1408] = 344a7651, %l6 = 00000000d15ed636
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000051
!	Mem[0000000030001410] = ff0000ff, %l6 = 0000000000000051
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000010001410] = 00000000, %l4 = d00991cd531e2d3d
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = ff0aeee0, %l7 = 0000000000000049, %asi = 80
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffff0a
!	Mem[0000000020800000] = 3acdbe80, %l1 = 00000000c1b66967
	lduh	[%o1+%g0],%l1		! %l1 = 0000000000003acd
!	Mem[0000000030101410] = fd177c43dce43458, %l3 = 00000000000000d1
	ldxa	[%i4+%o5]0x81,%l3	! %l3 = fd177c43dce43458
!	Mem[0000000030181410] = a1614661, %l7 = ffffffffffffff0a
	lduha	[%i6+%o5]0x81,%l7	! %l7 = 000000000000a161
!	Mem[0000000010041408] = 00000079, %l0 = 000000007056222e
	ldsha	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000

p0_label_25:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081420] = 66f8fa08, %l2 = 000000000000047d, %asi = 80
	swapa	[%i2+0x020]%asi,%l2	! %l2 = 0000000066f8fa08
!	%f20 = 1560e9ec 63399ecd, Mem[0000000010141400] = 000000ff 04000000
	stda	%f20,[%i5+%g0]0x88	! Mem[0000000010141400] = 1560e9ec 63399ecd
!	%f4  = 614661a1, %f4  = 614661a1, %f16 = 01dc5d00 538e4911
	fsmuld	%f4 ,%f4 ,%f16		! %f16 = 48633765 48ece820
!	%l4 = 0000000000000000, Mem[0000000010181415] = 78ed3be1, %asi = 80
	stba	%l4,[%i6+0x015]%asi	! Mem[0000000010181414] = 78003be1
!	%f14 = 4a618552 78d274db, %l0 = 0000000000000000
!	Mem[0000000010041420] = 3c697f9a66916619
	add	%i1,0x020,%g1
	stda	%f14,[%g1+%l0]ASI_PST16_P ! Mem[0000000010041420] = 3c697f9a66916619
!	%l6 = ff0000ff, %l7 = 0000a161, Mem[0000000010141400] = 63399ecd 1560e9ec
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = ff0000ff 0000a161
!	Mem[0000000010101418] = 14880e3a, %l6 = 00000000ff0000ff, %asi = 80
	swapa	[%i4+0x018]%asi,%l6	! %l6 = 0000000014880e3a
!	%f0  = 2e225670 6769b6c1, Mem[0000000030101410] = fd177c43 dce43458
	stda	%f0 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 2e225670 6769b6c1
!	Mem[0000000030001400] = e0ab570b, %l4 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 000000000000000b
!	%l5 = 0000000000000000, Mem[0000000030141408] = 51764a3400000000
	stxa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000000

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 344aec0f 580a6187, %l0 = 00000000, %l1 = 00003acd
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 00000000344aec0f 00000000580a6187
!	Mem[00000000300c1410] = ffff3963ece96015, %f0  = 2e225670 6769b6c1
	ldda	[%i3+%o5]0x81,%f0 	! %f0  = ffff3963 ece96015
!	Mem[0000000010181420] = f6096634, %l0 = 00000000344aec0f
	ldsw	[%i6+0x020],%l0		! %l0 = fffffffff6096634
!	Mem[0000000030181408] = ffffffff, %l4 = 000000000000000b
	lduha	[%i6+%o4]0x81,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030001400] = ff57abe0, %f26 = 7d048a96
	lda	[%i0+%g0]0x81,%f26	! %f26 = ff57abe0
!	Mem[0000000030181410] = a1614661, %l0 = fffffffff6096634
	lduha	[%i6+%o5]0x81,%l0	! %l0 = 000000000000a161
!	Mem[0000000010081408] = 77a3af2e, %l3 = fd177c43dce43458
	ldswa	[%i2+%o4]0x80,%l3	! %l3 = 0000000077a3af2e
!	Mem[0000000010081400] = 7056222e, %l5 = 0000000000000000
	ldswa	[%i2+%g0]0x88,%l5	! %l5 = 000000007056222e
!	%l4 = 000000000000ffff, imm = 0000000000000d23, %l2 = 0000000066f8fa08
	xnor	%l4,0xd23,%l2		! %l2 = ffffffffffff0d23
!	Mem[0000000010081408] = 2eafa377, %l5 = 000000007056222e
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 000000002eafa377

p0_label_27:
!	Starting 10 instruction Store Burst
!	%f16 = 48633765 48ece820, Mem[0000000010141400] = ff0000ff 0000a161
	stda	%f16,[%i5+%g0]0x88	! Mem[0000000010141400] = 48633765 48ece820
!	%l0 = 0000a161, %l1 = 580a6187, Mem[0000000030001400] = ff57abe0 392d9071
	stda	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000a161 580a6187
!	Mem[0000000021800180] = 0000da30, %l4 = 000000000000ffff
	ldstuba	[%o3+0x180]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l3 = 0000000077a3af2e
	ldstuba	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[000000001010143f] = 10be04ff, %l0 = 000000000000a161
	ldstuba	[%i4+0x03f]%asi,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (4)
!	%f18 = 00000055 10be04ff, Mem[0000000010081410] = 614661a1 00000067
	stda	%f18,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000055 10be04ff
!	%l4 = 0000000000000000, Mem[0000000010101408] = 344aec0f580a6187
	stxa	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010001408] = 00000067
	stha	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	%l6 = 14880e3a, %l7 = 0000a161, Mem[0000000010041408] = 00000079 55b883e7, %asi = 80
	stda	%l6,[%i1+0x008]%asi	! Mem[0000000010041408] = 14880e3a 0000a161
!	Mem[0000000010101408] = 00000000, %l2 = ffffffffffff0d23
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 71902d39, %l4 = 0000000000000000
	ldsba	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000039
!	Mem[0000000030101400] = 9c600f62, %l0 = 00000000000000ff
	lduha	[%i4+%g0]0x81,%l0	! %l0 = 0000000000009c60
!	Mem[00000000100c1410] = 20dd47d9 bcd45200, %l0 = 00009c60, %l1 = 580a6187
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 00000000bcd45200 0000000020dd47d9
!	Mem[00000000100c1430] = 1ec2e7d400afd415, %l4 = 0000000000000039, %asi = 80
	ldxa	[%i3+0x030]%asi,%l4	! %l4 = 1ec2e7d400afd415
!	Mem[0000000010101400] = 00df5730, %f18 = 00000055
	lda	[%i4+%g0]0x80,%f18	! %f18 = 00df5730
!	Mem[0000000030181400] = ff000000, %l5 = 000000002eafa377
	lduba	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101430] = 51764a34, %l1 = 0000000020dd47d9
	ldsb	[%i4+0x030],%l1		! %l1 = 0000000000000051
!	Mem[0000000010001410] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l6 = 0000000014880e3a
	lduba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = ff000000, %l3 = 0000000000000000
	ldswa	[%i6+%g0]0x81,%l3	! %l3 = ffffffffff000000

p0_label_29:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 20e8ec48 65376348 31dd194e 2a110b67
!	%f16 = 48633765 48ece820 00df5730 10be04ff
!	%f20 = 1560e9ec 63399ecd 55297f8a 7854c333
!	%f24 = 3cc91a98 4680b149 ff57abe0 61e74a8f
!	%f28 = 1e62dade 000000ff 4e19dd31 2d37c0ab
	stda	%f16,[%i5+%g0]ASI_BLK_P	! Block Store to 0000000010141400
!	%l4 = 1ec2e7d400afd415, Mem[00000000201c0000] = 62ff6050, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 15ff6050
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010141420] = 3cc91a98, %l2 = 0000000000000000
	swap	[%i5+0x020],%l2		! %l2 = 000000003cc91a98
!	%l4 = 1ec2e7d400afd415, imm = 000000000000053c, %l2 = 000000003cc91a98
	addc	%l4,0x53c,%l2		! %l2 = 1ec2e7d400afd951
!	Mem[0000000030041400] = 71902d39, %l3 = ffffffffff000000
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000039
!	%f19 = 10be04ff, %f27 = 61e74a8f, %f16 = 48633765 48ece820
	fsmuld	%f19,%f27,%f16		! %f16 = 3e6575bb 35f00e20
!	Mem[0000000010001424] = 437c17fd, %l6 = 0000000000000000, %asi = 80
	swapa	[%i0+0x024]%asi,%l6	! %l6 = 00000000437c17fd
!	%l0 = bcd45200, %l1 = 00000051, Mem[00000000300c1400] = 11498e53 005ddc01
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = bcd45200 00000051
!	%l3 = 0000000000000039, Mem[0000000030141400] = d15ed63600000045
	stxa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000039
!	Mem[0000000010141408] = 00df5730, %l6 = 00000000437c17fd
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 0000000000df5730

p0_label_30:
!	Starting 10 instruction Load Burst
!	%l1 = 0000000000000051, %l5 = 0000000000000000, %l0 = 00000000bcd45200
	addc	%l1,%l5,%l0		! %l0 = 0000000000000051
!	Mem[0000000030101400] = 620f609c, %l7 = 000000000000a161
	lduba	[%i4+%g0]0x89,%l7	! %l7 = 000000000000009c
!	Mem[000000001014140c] = 10be04ff, %l0 = 0000000000000051, %asi = 80
	lduwa	[%i5+0x00c]%asi,%l0	! %l0 = 0000000010be04ff
!	Mem[00000000100c142a] = 4d3758e6, %l5 = 0000000000000000
	lduh	[%i3+0x02a],%l5		! %l5 = 00000000000058e6
!	Mem[0000000010001400] = 55282923, %f18 = 00df5730
	lda	[%i0+0x000]%asi,%f18	! %f18 = 55282923
!	Mem[0000000010181410] = f661cd6078003be1, %l3 = 0000000000000039
	ldxa	[%i6+%o5]0x80,%l3	! %l3 = f661cd6078003be1
!	Mem[000000001014142c] = 61e74a8f, %f30 = 4e19dd31
	ld	[%i5+0x02c],%f30	! %f30 = 61e74a8f
!	Mem[0000000010081408] = 77a3af2e 56961dc7, %l2 = 00afd951, %l3 = 78003be1
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 0000000077a3af2e 0000000056961dc7
!	Mem[0000000010081408] = 2eafa377, %f18 = 55282923
	lda	[%i2+%o4]0x88,%f18	! %f18 = 2eafa377
!	%f11 = 65e437bf, %f4  = 614661a1, %f21 = 63399ecd
	fdivs	%f11,%f4 ,%f21		! %f21 = 44134048

p0_label_31:
!	Starting 10 instruction Store Burst
!	Mem[00000000218001c0] = ff531060, %l2 = 0000000077a3af2e
	ldstub	[%o3+0x1c0],%l2		! %l2 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030081400] = 00000462
	stha	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	%l4 = 1ec2e7d400afd415, Mem[00000000201c0000] = 15ff6050
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = d4156050
!	Mem[0000000030001408] = 1e54fc02, %l4 = 0000000000afd415
	swapa	[%i0+%o4]0x89,%l4	! %l4 = 000000001e54fc02
!	%f20 = 1560e9ec 44134048, Mem[0000000010101428] = 72a49846 047ad37f, %asi = 80
	stda	%f20,[%i4+0x028]%asi	! Mem[0000000010101428] = 1560e9ec 44134048
!	%l0 = 0000000010be04ff, Mem[0000000021800141] = 32de2000, %asi = 80
	stba	%l0,[%o3+0x141]%asi	! Mem[0000000021800140] = 32ff2000
!	%l4 = 000000001e54fc02, Mem[0000000030041400] = ff2d90716196f351
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000001e54fc02
!	%l1 = 0000000000000051, Mem[00000000100c1403] = 9dca4006
	stb	%l1,[%i3+0x003]		! Mem[00000000100c1400] = 9dca4051
!	Mem[0000000030041408] = ff00003a, %l4 = 000000001e54fc02
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 00000000ff00003a
!	Mem[0000000030001400] = 61a10000, %l1 = 0000000000000051
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[000000001018140e] = 7c956549, %l2 = 00000000000000ff, %asi = 80
	lduha	[%i6+0x00e]%asi,%l2	! %l2 = 0000000000006549
!	%l7 = 000000000000009c, imm = 0000000000000a12, %l4 = 00000000ff00003a
	orn	%l7,0xa12,%l4		! %l4 = fffffffffffff5fd
!	Mem[0000000030041410] = 2cfdad36, %l5 = 00000000000058e6
	lduba	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000036
!	Mem[0000000010101428] = 1560e9ec, %l6 = 0000000000df5730, %asi = 80
	lduwa	[%i4+0x028]%asi,%l6	! %l6 = 000000001560e9ec
!	Mem[0000000010041410] = f6000000, %l7 = 000000000000009c
	ldsba	[%i1+%o5]0x80,%l7	! %l7 = fffffffffffffff6
!	Mem[00000000211c0000] = ff0aeee0, %l4 = fffffffffffff5fd, %asi = 80
	ldsba	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000211c0000] = ff0aeee0, %l1 = 0000000000000000
	ldub	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030081408] = ffffffff00000000, %f8  = 66f8fa08 1836acf9
	ldda	[%i2+%o4]0x81,%f8 	! %f8  = ffffffff 00000000
!	Mem[0000000021800180] = ff00da30, %l7 = fffffffffffffff6
	ldsb	[%o3+0x180],%l7		! %l7 = ffffffffffffffff
!	%f7  = a1614661, %f8  = ffffffff
	fcmps	%fcc2,%f7 ,%f8 		! %fcc2 = 3

p0_label_33:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000010101408] = ff00000000000000
	stxa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000000000ff
!	%f2  = 77a3af2e 56961dc7, %l6 = 000000001560e9ec
!	Mem[0000000010141418] = 55297f8a7854c333
	add	%i5,0x018,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010141418] = 55297f8a7854c333
!	%l0 = 0000000010be04ff, Mem[00000000300c1408] = 10be04ff
	stha	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 10be04ff
!	Mem[0000000030001410] = ff0000ff, %l3 = 0000000056961dc7
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000201c0001] = d4156050
	stb	%l3,[%o0+0x001]		! Mem[00000000201c0000] = d4ff6050
!	Mem[0000000010141425] = 4680b149, %l0 = 0000000010be04ff
	ldstub	[%i5+0x025],%l0		! %l0 = 0000000000000080
!	%l6 = 1560e9ec, %l7 = ffffffff, Mem[0000000030001400] = ff00a161 580a6187
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 1560e9ec ffffffff
!	%l0 = 0000000000000080, Mem[0000000030181410] = 614661a1
	stha	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 61460080
!	Mem[0000000010081400] = 2e225670, %l4 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 000000000000002e
!	%l6 = 000000001560e9ec, Mem[0000000030041408] = 02fc541e
	stba	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 02fc54ec

p0_label_34:
!	Starting 10 instruction Load Burst
!	%f10 = 7bc98986, %f2  = 77a3af2e, %f22 = 55297f8a
	fmuls	%f10,%f2 ,%f22		! %f22 = 7f800000
!	Mem[0000000010041413] = f6000000, %l2 = 0000000000006549, %asi = 80
	ldsba	[%i1+0x013]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = 1560e9ec, %l3 = 00000000000000ff
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = 000000001560e9ec
!	Mem[0000000010081400] = c1b66967705622ff, %l4 = 000000000000002e
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = c1b66967705622ff
!	Mem[0000000030101408] = ff000000, %l0 = 0000000000000080
	lduha	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = ff0aeee0, %l2 = 0000000000000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ff0a
!	Mem[0000000010081408] = 2eafa377, %l7 = ffffffffffffffff
	ldsha	[%i2+%o4]0x88,%l7	! %l7 = ffffffffffffa377
!	Mem[0000000030001408] = 00afd415, %l3 = 000000001560e9ec
	lduba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000015
!	Mem[0000000030101400] = 9c600f62, %l0 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l0	! %l0 = 000000000000009c
!	Mem[00000000201c0001] = d4ff6050, %l4 = c1b66967705622ff
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff

p0_label_35:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101424] = 77f3cab9, %l4 = 00000000ffffffff, %asi = 80
	swapa	[%i4+0x024]%asi,%l4	! %l4 = 0000000077f3cab9
!	Mem[000000001010140d] = 000000ff, %l3 = 0000000000000015
	ldstuba	[%i4+0x00d]%asi,%l3	! %l3 = 0000000000000000
!	%l7 = ffffffffffffa377, Mem[0000000030001408] = f758581700afd415
	stxa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffffffffa377
!	%l6 = 1560e9ec, %l7 = ffffa377, Mem[0000000030141408] = 00000000 00000000
	stda	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 1560e9ec ffffa377
!	%l0 = 0000009c, %l1 = 000000ff, Mem[0000000010041430] = 73e0f314 3cb5aa55, %asi = 80
	stda	%l0,[%i1+0x030]%asi	! Mem[0000000010041430] = 0000009c 000000ff
!	%l1 = 00000000000000ff, Mem[0000000010081410] = ff04be1055000000
	stxa	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000000000ff
!	Mem[000000001008140c] = 56961dc7, %l1 = 00000000000000ff
	swap	[%i2+0x00c],%l1		! %l1 = 0000000056961dc7
!	%l3 = 0000000000000000, Mem[0000000030001408] = 77a3ffff
	stha	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000ffff
!	%l2 = 000000000000ff0a, Mem[00000000300c1400] = bcd4520000000051
	stxa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000000000ff0a
!	%l4 = 77f3cab9, %l5 = 00000036, Mem[00000000100c1408] = 51764a34 6399e300
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 77f3cab9 00000036

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000ff, %l2 = 000000000000ff0a
	ldsha	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181408] = 28c91c98, %l4 = 0000000077f3cab9, %asi = 80
	ldswa	[%i6+0x008]%asi,%l4	! %l4 = 0000000028c91c98
!	Mem[0000000010041408] = 14880e3a, %f31 = 2d37c0ab
	lda	[%i1+%o4]0x80,%f31	! %f31 = 14880e3a
!	Mem[00000000100c1410] = bcd45200, %l1 = 0000000056961dc7
	lduba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = ff0000ff5b6c042d, %l0 = 000000000000009c
	ldxa	[%i0+%o5]0x81,%l0	! %l0 = ff0000ff5b6c042d
!	Mem[0000000030081410] = 2e225670, %l7 = ffffffffffffa377
	lduha	[%i2+%o5]0x89,%l7	! %l7 = 0000000000005670
!	Mem[00000000300c1408] = 10be04ff, %l7 = 0000000000005670
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000021800180] = ff00da30, %l4 = 0000000028c91c98
	lduh	[%o3+0x180],%l4		! %l4 = 000000000000ff00
!	Mem[00000000100c1410] = 20dd47d9 bcd45200, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i3+%o5]0x88,%l2	! %l2 = 00000000bcd45200 0000000020dd47d9
!	Mem[0000000010181410] = f661cd60, %l1 = 0000000000000000
	ldswa	[%i6+%o5]0x80,%l1	! %l1 = fffffffff661cd60

p0_label_37:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 9c600f62, %l0 = ff0000ff5b6c042d
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 000000000000009c
!	%f0  = ffff3963 ece96015, %l4 = 000000000000ff00
!	Mem[0000000010141408] = 437c17fd10be04ff
	add	%i5,0x008,%g1
	stda	%f0,[%g1+%l4]ASI_PST16_P ! Mem[0000000010141408] = 437c17fd10be04ff
!	%f20 = 1560e9ec 44134048, %l1 = fffffffff661cd60
!	Mem[00000000100c1428] = 4d3758e61a61ad9f
	add	%i3,0x028,%g1
	stda	%f20,[%g1+%l1]ASI_PST8_PL ! Mem[00000000100c1428] = 4d3758e61ae9609f
!	Mem[0000000010181408] = 28c91c98, %l2 = 00000000bcd45200
	ldstub	[%i6+%o4],%l2		! %l2 = 0000000000000028
!	Mem[0000000010081408] = 2eafa377, %l5 = 0000000000000036
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000077
!	%f4  = 614661a1, Mem[0000000030141408] = 1560e9ec
	sta	%f4 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 614661a1
!	Mem[0000000010141408] = 437c17fd, %l5 = 0000000000000077
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000043
!	Mem[00000000300c1408] = 10be04ff, %l3 = 0000000020dd47d9
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101410] = d00991cd
	stba	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = ff0991cd
!	%l6 = 000000001560e9ec, Mem[00000000211c0000] = ff0aeee0, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = ec0aeee0

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 0000000000ff00ff, %f18 = 2eafa377 10be04ff
	ldda	[%i4+%o4]0x80,%f18	! %f18 = 00000000 00ff00ff
!	Mem[0000000010141418] = 55297f8a, %l2 = 0000000000000028
	ldsh	[%i5+0x018],%l2		! %l2 = 0000000000005529
!	Mem[0000000030081408] = ffffffff, %l7 = ffffffffffffffff
	ldsba	[%i2+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101402] = 00df5730, %l1 = fffffffff661cd60, %asi = 80
	ldsha	[%i4+0x002]%asi,%l1	! %l1 = 0000000000005730
!	Mem[0000000030141410] = 423467a1, %l7 = ffffffffffffffff
	ldswa	[%i5+%o5]0x89,%l7	! %l7 = 00000000423467a1
!	Mem[0000000030041408] = ec54fc02, %l4 = 000000000000ff00
	lduba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000ec
!	Mem[0000000030001408] = ffff0000, %l5 = 0000000000000043
	ldswa	[%i0+%o4]0x89,%l5	! %l5 = ffffffffffff0000
!	Mem[0000000010181410] = 60cd61f6, %l7 = 00000000423467a1
	lduwa	[%i6+%o5]0x88,%l7	! %l7 = 0000000060cd61f6
!	Mem[0000000030141400] = 39000000, %l1 = 0000000000005730
	lduba	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000039
!	Mem[0000000030141410] = 423467a1, %l6 = 000000001560e9ec
	ldswa	[%i5+%o5]0x89,%l6	! %l6 = 00000000423467a1

p0_label_39:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000423467a1, Mem[00000000100c1400] = 9dca4051
	stwa	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 423467a1
!	%l4 = 00000000000000ec, immd = fffff839, %y  = 2e225670
	udiv	%l4,-0x7c7,%l2		! %l2 = 000000002e2257d6
	mov	%l0,%y			! %y = 0000009c
!	Mem[0000000030041400] = 00000000, %l1 = 0000000000000039
	swapa	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, imm = 0000000000000d05, %l6 = 00000000423467a1
	addc	%l1,0xd05,%l6		! %l6 = 0000000000000d05
!	%l4 = 00000000000000ec, Mem[0000000030041410] = 36adfd2c51ad5d0d
	stxa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000000000ec
!	%l5 = ffffffffffff0000, Mem[0000000030101400] = 620f60ff
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 620f6000
!	%l2 = 000000002e2257d6, Mem[0000000030181408] = ffffffff
	stha	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 57d6ffff
!	Mem[0000000010041430] = 0000009c, %l6 = 00000d05, %l4 = 000000ec
	add	%i1,0x30,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 000000000000009c
!	Mem[00000000300c1408] = ff04be10, %l3 = 00000000000000ff
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101408] = ff000000, %l6 = 0000000000000d05
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 01f1d86823292855, %f22 = 7f800000 7854c333
	ldda	[%i0+%g0]0x88,%f22	! %f22 = 01f1d868 23292855
!	Mem[00000000211c0001] = ec0aeee0, %l0 = 000000000000009c, %asi = 80
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = 000000000000000a
!	Mem[0000000010101408] = 0000000000ff00ff, %f22 = 01f1d868 23292855
	ldda	[%i4+%o4]0x80,%f22	! %f22 = 00000000 00ff00ff
!	Mem[0000000010001400] = 01f1d86823292855, %l1 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l1	! %l1 = 01f1d86823292855
!	Mem[0000000030101400] = f13b0c4f 620f6000, %l2 = 2e2257d6, %l3 = 000000ff
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 00000000620f6000 00000000f13b0c4f
!	Mem[0000000030001400] = 1560e9ec, %l6 = 0000000000000000
	ldsha	[%i0+%g0]0x81,%l6	! %l6 = 0000000000001560
!	Mem[0000000010001408] = 000000001c3bbb1e, %f14 = 4a618552 78d274db, %asi = 80
	ldda	[%i0+0x008]%asi,%f14	! %f14 = 00000000 1c3bbb1e
!	Mem[00000000218000c1] = ffbb1fa0, %l4 = 000000000000009c
	ldub	[%o3+0x0c1],%l4		! %l4 = 00000000000000bb
!	Mem[00000000100c1408] = 77f3cab900000036, %l5 = ffffffffffff0000
	ldxa	[%i3+%o4]0x80,%l5	! %l5 = 77f3cab900000036
!	Mem[0000000030041408] = ec54fc02, %l5 = 77f3cab900000036
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = ffffffffec54fc02

p0_label_41:
!	Starting 10 instruction Store Burst
!	%f6  = 43b27b7a, Mem[00000000300c1408] = 10be04ff
	sta	%f6 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 43b27b7a
!	Mem[0000000010181410] = f661cd60, %l4 = 00000000000000bb
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 00000000000000f6
!	%l3 = 00000000f13b0c4f, Mem[00000000201c0000] = d4ff6050, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0c4f6050
!	Mem[00000000218001c0] = ff531060, %l5 = ffffffffec54fc02
	ldstub	[%o3+0x1c0],%l5		! %l5 = 00000000000000ff
!	%l6 = 0000000000001560, Mem[0000000010181410] = 60cd61ff
	stha	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 60cd1560
!	%l1 = 01f1d86823292855, Mem[00000000100c1438] = 3808f2b2370850bb
	stx	%l1,[%i3+0x038]		! Mem[00000000100c1438] = 01f1d86823292855
!	Mem[0000000010101408] = 00000000, %l7 = 0000000060cd61f6
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%f6  = 43b27b7a, Mem[0000000010041408] = 14880e3a
	sta	%f6 ,[%i1+0x008]%asi	! Mem[0000000010041408] = 43b27b7a
!	Mem[0000000030101410] = 7056222e, %l5 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 000000007056222e
!	%f20 = 1560e9ec, %f16 = 3e6575bb 35f00e20
	fstod	%f20,%f16		! %f16 = 3aac1d3d 80000000

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 55282923, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l7	! %l7 = 0000000055282923
!	Mem[0000000010081408] = 2eafa3ff, %l2 = 00000000620f6000
	ldswa	[%i2+%o4]0x88,%l2	! %l2 = 000000002eafa3ff
!	Mem[0000000010141410] = ece96015, %l7 = 0000000055282923
	lduwa	[%i5+%o5]0x88,%l7	! %l7 = 00000000ece96015
!	Mem[0000000030101400] = 00600f62 4f0c3bf1, %l6 = 00001560, %l7 = ece96015
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 0000000000600f62 000000004f0c3bf1
!	Mem[0000000030041408] = 02fc54ec, %f2  = 77a3af2e
	lda	[%i1+%o4]0x89,%f2 	! %f2 = 02fc54ec
!	Mem[0000000010141410] = cd9e3963ece96015, %f30 = 61e74a8f 14880e3a
	ldda	[%i5+%o5]0x88,%f30	! %f30 = cd9e3963 ece96015
!	Mem[00000000300c1400] = 0aff0000 00000000, %l4 = 000000f6, %l5 = 7056222e
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000 000000000aff0000
!	Mem[0000000010081404] = 6769b6c1, %l5 = 000000000aff0000
	ldsb	[%i2+0x004],%l5		! %l5 = 0000000000000067
!	%l5 = 0000000000000067, %l1 = 01f1d86823292855, %l3 = 00000000f13b0c4f
	orn	%l5,%l1,%l3		! %l3 = fe0e2797dcd6d7ef
!	Mem[000000001008140b] = ffa3af2e, %l5 = 0000000000000067
	ldub	[%i2+0x00b],%l5		! %l5 = 000000000000002e

p0_label_43:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 65376348, %l1 = 0000000023292855
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 0000000065376348
!	Mem[0000000021800181] = ff00da30, %l3 = fe0e2797dcd6d7ef
	ldstuba	[%o3+0x181]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 7a7bb243, %l1 = 0000000065376348
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000043
!	Mem[000000001014142a] = ff57abe0, %l3 = 0000000000000000
	ldstub	[%i5+0x02a],%l3		! %l3 = 00000000000000ab
!	Mem[0000000010141420] = 00000000, %l6 = 0000000000600f62, %asi = 80
	swapa	[%i5+0x020]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 0000ffff, %l6 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 000000000000ffff
!	%f2  = 02fc54ec 56961dc7, %l7 = 000000004f0c3bf1
!	Mem[0000000030141428] = 5253e956782ef64f
	add	%i5,0x028,%g1
	stda	%f2,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030141428] = c71d9656782ef64f
!	%f0  = ffff3963 ece96015, %l2 = 000000002eafa3ff
!	Mem[0000000010181410] = 6015cd6078003be1
	add	%i6,0x010,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010181410] = 1560e9ec6339ffff
!	Mem[0000000010041434] = 000000ff, %l5 = 0000002e, %l3 = 000000ab
	add	%i1,0x34,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 00000000000000ff
!	%l7 = 000000004f0c3bf1, Mem[0000000010181410] = ffff3963ece96015
	stxa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000004f0c3bf1

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141414] = 63399ecd, %l1 = 0000000000000043, %asi = 80
	ldswa	[%i5+0x014]%asi,%l1	! %l1 = 0000000063399ecd
!	Mem[0000000030001408] = 00000000, %l5 = 000000000000002e
	ldsha	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030001400] = 1560e9ec ffffffff 00000000 ffffffff
!	Mem[0000000030001410] = ff0000ff 5b6c042d 5c83736a 7b6cfb93
!	Mem[0000000030001420] = 0331b578 269894a9 5e274476 067170ef
!	Mem[0000000030001430] = 6f894be4 1116dde5 1fcb7342 047f350b
	ldda	[%i0+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000030041410] = ec00000000000000, %l2 = 000000002eafa3ff
	ldxa	[%i1+%o5]0x89,%l2	! %l2 = ec00000000000000
!	Mem[0000000010041400] = ff09663478ed3be1, %l3 = 00000000000000ff
	ldx	[%i1+%g0],%l3		! %l3 = ff09663478ed3be1
!	Mem[0000000030041410] = 00000000000000ec, %l3 = ff09663478ed3be1
	ldxa	[%i1+%o5]0x81,%l3	! %l3 = 00000000000000ec
!	%l6 = 000000000000ffff, %l1 = 0000000063399ecd, %l1 = 0000000063399ecd
	or	%l6,%l1,%l1		! %l1 = 000000006339ffff
!	Mem[0000000030001408] = 00000000, %l4 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = ec54fc02, %l3 = 00000000000000ec
	lduwa	[%i1+%o4]0x81,%l3	! %l3 = 00000000ec54fc02
!	Mem[0000000030041400] = 39000000, %l1 = 000000006339ffff
	ldsba	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000039

p0_label_45:
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000000a, Mem[0000000010101408] = ff000000
	stha	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 000a0000
!	Mem[0000000010081400] = ff225670, %l7 = 000000004f0c3bf1, %asi = 80
	swapa	[%i2+0x000]%asi,%l7	! %l7 = 00000000ff225670
!	Mem[00000000201c0000] = 0c4f6050, %l1 = 0000000000000039
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 000000000000000c
!	Mem[0000000010081408] = ffa3af2e, %l7 = 00000000ff225670
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 00000000ffa3af2e
!	%f16 = 1560e9ec ffffffff, %l3 = 00000000ec54fc02
!	Mem[0000000030081410] = 7056222ec1b66967
	add	%i2,0x010,%g1
	stda	%f16,[%g1+%l3]ASI_PST32_S ! Mem[0000000030081410] = 1560e9ecc1b66967
!	%f24 = 0331b578 269894a9, %l5 = 0000000000000000
!	Mem[0000000030181410] = 80004661212be96d
	add	%i6,0x010,%g1
	stda	%f24,[%g1+%l5]ASI_PST8_S ! Mem[0000000030181410] = 80004661212be96d
!	%l0 = 000000000000000a, Mem[0000000010081404] = 6769b6c1, %asi = 80
	stba	%l0,[%i2+0x004]%asi	! Mem[0000000010081404] = 0a69b6c1
!	%f28 = 6f894be4, Mem[0000000010181410] = f13b0c4f
	sta	%f28,[%i6+%o5]0x80	! Mem[0000000010181410] = 6f894be4
!	%l5 = 0000000000000000, Mem[0000000010141400] = 23292855
	stwa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000010041410] = f6000000, %l1 = 000000000000000c
	ldstuba	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000f6

p0_label_46:
!	Starting 10 instruction Load Burst
!	%l6 = 000000000000ffff, %l3 = 00000000ec54fc02, %l1 = 00000000000000f6
	andn	%l6,%l3,%l1		! %l1 = 00000000000003fd
!	Mem[0000000010101430] = 51764a345244b0f5, %l3 = 00000000ec54fc02, %asi = 80
	ldxa	[%i4+0x030]%asi,%l3	! %l3 = 51764a345244b0f5
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000030181400] = ff000000 00000000 57d6ffff ffffffa0
!	Mem[0000000030181410] = 80004661 212be96d 64b37baa 095abad3
!	Mem[0000000030181420] = 2967efb8 79ec7de9 3348c0b6 2212542f
!	Mem[0000000030181430] = 545f9a24 0f6e0b25 5b08a382 42ec7c4b
	ldda	[%i6+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030181400
!	Mem[0000000030181400] = ff000000, %l3 = 51764a345244b0f5
	lduwa	[%i6+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030101410] = 000000ff, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101400] = 00df5730 3f7bff81 000a0000 00ff00ff
!	Mem[0000000010101410] = ff0991cd 531e2d3d ff0000ff 55282923
!	Mem[0000000010101420] = 3dee72c8 ffffffff 1560e9ec 44134048
!	Mem[0000000010101430] = 51764a34 5244b0f5 e13bed78 10be04ff
	ldda	[%i4+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010101400
	membar	#Sync			! Added by membar checker (8)
!	%l3 = 00000000ff000000, Mem[0000000010101410] = cd9109ff
	stha	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = cd910000
!	Mem[0000000010141410] = ece96015, %l3 = 00000000ff000000
	lduwa	[%i5+%o5]0x88,%l3	! %l3 = 00000000ece96015
!	Mem[0000000030081408] = ffffffff 00000000, %l2 = 00000000, %l3 = ece96015
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[0000000030001408] = ffffffff 00000000, %l6 = 0000ffff, %l7 = ffa3af2e
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000 00000000ffffffff

p0_label_47:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ffffffff, Mem[0000000010101410] = cd910000
	stwa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff
!	%f8  = e97dec79, Mem[0000000030101408] = ff0000ff
	sta	%f8 ,[%i4+%o4]0x89	! Mem[0000000030101408] = e97dec79
!	%l0 = 000000000000000a, Mem[0000000030181400] = ff000000
	stwa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000a
!	%f18 = ff00ff00 00000a00, Mem[00000000300c1408] = 7a7bb243 78ed3be1
	stda	%f18,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff00ff00 00000a00
!	%l4 = 0000000000000000, Mem[0000000010041420] = 3c697f9a66916619
	stx	%l4,[%i1+0x020]		! Mem[0000000010041420] = 0000000000000000
!	%l0 = 0000000a, %l1 = 000003fd, Mem[00000000300c1410] = 6339ffff 1560e9ec
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000a 000003fd
!	%l4 = 0000000000000000, Mem[0000000010001410] = 00000000
	stha	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%l6 = 0000000000000000, Mem[00000000100c1438] = 01f1d86823292855, %asi = 80
	stxa	%l6,[%i3+0x038]%asi	! Mem[00000000100c1438] = 0000000000000000
!	Mem[0000000010101407] = 3f7bff81, %l5 = 00000000000000ff
	ldstuba	[%i4+0x007]%asi,%l5	! %l5 = 0000000000000081
!	%l4 = 0000000000000000, Mem[0000000010081404] = 0a69b6c1
	stw	%l4,[%i2+0x004]		! Mem[0000000010081404] = 00000000

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 1560e9ec ffffffff, %l0 = 0000000a, %l1 = 000003fd
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 000000001560e9ec 00000000ffffffff
!	Mem[0000000010041408] = 7a7bb2ff, %l4 = 0000000000000000
	lduba	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141410] = a1673442a1614661, %f24 = ffffffff c872ee3d
	ldda	[%i5+%o5]0x81,%f24	! %f24 = a1673442 a1614661
!	%l6 = 0000000000000000, immd = 00000d17, %y  = 0000009c
	smul	%l6,0xd17,%l6		! %l6 = 0000000000000000, %y = 00000000
!	%l4 = 00000000000000ff, %l7 = 00000000ffffffff, %l0 = 000000001560e9ec
	sdivx	%l4,%l7,%l0		! %l0 = 0000000000000000
!	Mem[0000000010181416] = 00000000, %l1 = 00000000ffffffff, %asi = 80
	ldsha	[%i6+0x016]%asi,%l1	! %l1 = 0000000000000000
!	Mem[000000001000140c] = 1c3bbb1e, %l0 = 0000000000000000, %asi = 80
	lduwa	[%i0+0x00c]%asi,%l0	! %l0 = 000000001c3bbb1e
!	Mem[0000000010041408] = ffb27b7a, %f18 = ff00ff00
	lda	[%i1+0x008]%asi,%f18	! %f18 = ffb27b7a
!	Mem[0000000010001410] = 00000000, %l1 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 55282923, %l5 = 0000000000000081
	ldswa	[%i0+%g0]0x80,%l5	! %l5 = 0000000055282923

p0_label_49:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l2 = 00000000ffffffff
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1416] = d947dd20, %l4 = 00000000000000ff
	ldstub	[%i3+0x016],%l4		! %l4 = 00000000000000dd
!	%l3 = 0000000000000000, imm = fffffffffffffed2, %l2 = 0000000000000000
	and	%l3,-0x12e,%l2		! %l2 = 0000000000000000
!	Code Fragment 3, seed = 312386
p0_fragment_3:
!	%l0 = 000000001c3bbb1e
	setx	0x44b45e4d04d33816,%g7,%l0 ! %l0 = 44b45e4d04d33816
!	%l1 = 0000000000000000
	setx	0x849dd4bcd6e02941,%g7,%l1 ! %l1 = 849dd4bcd6e02941
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 44b45e4d04d33816
	setx	0x16621a16c311ee7c,%g7,%l0 ! %l0 = 16621a16c311ee7c
!	%l1 = 849dd4bcd6e02941
	setx	0x8661d7e62fed8ac7,%g7,%l1 ! %l1 = 8661d7e62fed8ac7
p0_fragment_3_end:
!	%l6 = 0000000000000000, Mem[00000000300c1408] = 00ff00ff
	stwa	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010081408] = ff225670
	stba	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00225670
!	%f2  = a0ffffff, %f0  = 00000000, %f10 = 2f541222 b6c04833
	fsmuld	%f2 ,%f0 ,%f10		! %f10 = 80000000 00000000
!	%l5 = 0000000055282923, Mem[0000000010081408] = 00225670
	stba	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 23225670
!	Mem[00000000300c1410] = 0000000a, %l1 = 8661d7e62fed8ac7
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 000000000000000a
!	Mem[00000000100c1408] = b9caf377, %l1 = 000000000000000a
	swapa	[%i3+%o4]0x88,%l1	! %l1 = 00000000b9caf377

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = 6789e1d0, %l0 = 16621a16c311ee7c, %asi = 80
	ldsha	[%o3+0x100]%asi,%l0	! %l0 = 0000000000006789
!	Mem[0000000030081410] = 6769b6c1 ece96015, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 00000000ece96015 000000006769b6c1
!	Mem[0000000010181408] = ffc91c98, %l2 = 00000000ece96015
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041410] = 9dca4006000000ff, %l1 = 00000000b9caf377
	ldxa	[%i1+%o5]0x88,%l1	! %l1 = 9dca4006000000ff
!	Mem[0000000010081408] = 70562223, %l0 = 0000000000006789
	lduba	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000023
!	Mem[0000000030101408] = 79ec7de9, %l2 = ffffffffffffffff
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = 0000000079ec7de9
!	%l3 = 000000006769b6c1, %l5 = 0000000055282923, %l5 = 0000000055282923
	orn	%l3,%l5,%l5		! %l5 = ffffffffeffff6dd
!	Mem[00000000300c1408] = 00000000, %l0 = 0000000000000023
	ldsba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = ff0000000640ca9d, %l5 = ffffffffeffff6dd
	ldxa	[%i1+%o5]0x80,%l5	! %l5 = ff0000000640ca9d
!	Mem[0000000010081408] = ff000000 70562223, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 0000000070562223 00000000ff000000

p0_label_51:
!	Starting 10 instruction Store Burst
!	%l0 = 70562223, %l1 = ff000000, Mem[0000000030081410] = 1560e9ec c1b66967
	stda	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 70562223 ff000000
!	%f16 = 81ff7b3f 3057df00, %l1 = 00000000ff000000
!	Mem[00000000300c1430] = b78cc136deda621e
	add	%i3,0x030,%g1
	stda	%f16,[%g1+%l1]ASI_PST16_SL ! Mem[00000000300c1430] = b78cc136deda621e
!	%f22 = 23292855 ff0000ff, Mem[00000000300c1408] = 00000000 000a0000
	stda	%f22,[%i3+%o4]0x89	! Mem[00000000300c1408] = 23292855 ff0000ff
!	%l0 = 70562223, %l1 = ff000000, Mem[0000000010041410] = 000000ff 9dca4006
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 70562223 ff000000
!	Mem[00000000100c1400] = a1673442, %l1 = 00000000ff000000
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 00000000a1673442
!	Mem[0000000030101400] = 00600f62, %l2 = 0000000079ec7de9
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001418] = 52cea8ba, %l6 = 0000000000000000
	swap	[%i0+0x018],%l6		! %l6 = 0000000052cea8ba
!	%l1 = 00000000a1673442, Mem[0000000010141425] = 46ffb149
	stb	%l1,[%i5+0x025]		! Mem[0000000010141424] = 4642b149
!	%f10 = 80000000 00000000, Mem[0000000010181400] = 437c17fd 344a0000
	stda	%f10,[%i6+%g0]0x88	! Mem[0000000010181400] = 80000000 00000000
!	%f13 = 249a5f54, Mem[0000000030081400] = 000000ff
	sta	%f13,[%i2+%g0]0x89	! Mem[0000000030081400] = 249a5f54

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 70562223, %l6 = 0000000052cea8ba
	lduwa	[%i2+%o4]0x88,%l6	! %l6 = 0000000070562223
!	Mem[0000000030081408] = ffffffff, %l2 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101408] = 00000004e97dec79, %f10 = 80000000 00000000
	ldda	[%i4+%o4]0x89,%f10	! %f10 = 00000004 e97dec79
!	Mem[0000000010081408] = 23225670000000ff, %l2 = ffffffffffffffff, %asi = 80
	ldxa	[%i2+0x008]%asi,%l2	! %l2 = 23225670000000ff
!	Mem[0000000010141400] = 00000000, %l4 = 00000000000000dd
	lduwa	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l0 = 0000000070562223
	ldswa	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = ff0000ff, %l1 = 00000000a1673442
	ldswa	[%i0+%o5]0x89,%l1	! %l1 = ffffffffff0000ff
!	Mem[0000000010181400] = 00000000, %l5 = ff0000000640ca9d
	ldsha	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = ffffffff, %l4 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041400] = 346609ff, %l2 = 23225670000000ff
	lduba	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff

p0_label_53:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000070562223, Mem[00000000100c1410] = 0052d4bc
	stba	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 2352d4bc
!	Mem[00000000100c1408] = 0000000a, %l7 = 00000000ffffffff
	ldstuba	[%i3+%o4]0x88,%l7	! %l7 = 000000000000000a
!	%f24 = a1673442 a1614661, Mem[0000000030141400] = 00000039 00000000
	stda	%f24,[%i5+%g0]0x89	! Mem[0000000030141400] = a1673442 a1614661
!	Mem[0000000010181400] = 00000000 00000080 ffc91c98 7c956549
!	%f0  = 00000000 000000ff a0ffffff ffffd657
!	%f4  = 6de92b21 61460080 d3ba5a09 aa7bb364
!	%f8  = e97dec79 b8ef6729 00000004 e97dec79
!	%f12 = 250b6e0f 249a5f54 4b7cec42 82a3085b
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	%l2 = 00000000000000ff, Mem[0000000030081400] = 249a5f54
	stha	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 249a00ff
!	%l2 = 00000000000000ff, Mem[0000000010041410] = 70562223
	stba	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 705622ff
!	%f9  = b8ef6729, Mem[00000000100c1430] = 1ec2e7d4
	st	%f9 ,[%i3+0x030]	! Mem[00000000100c1430] = b8ef6729
!	%l0 = 0000000000000000, Mem[0000000010081400] = 4f0c3bf1
	stwa	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	Mem[0000000030081408] = ffffffff, %l4 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l1 = ffffffffff0000ff, %l5 = 0000000000000000, %y  = 00000000
	udiv	%l1,%l5,%l5		! Div by zero, %l0 = 0000000000000028

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 000000ff 23225670, %l2 = 000000ff, %l3 = 6769b6c1
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 0000000023225670 00000000000000ff
!	Mem[0000000030081410] = 23225670, %l1 = ffffffffff0000ff
	lduha	[%i2+%o5]0x89,%l1	! %l1 = 0000000000005670
!	Mem[0000000030181410] = 80004661, %l6 = 0000000070562223
	ldsha	[%i6+%o5]0x81,%l6	! %l6 = ffffffffffff8000
!	Mem[0000000010081410] = 000000ff, %l6 = ffffffffffff8000
	lduba	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001420] = 5834e4dc00000000, %l0 = 0000000000000028
	ldx	[%i0+0x020],%l0		! %l0 = 5834e4dc00000000
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010181408] = 57d6ffffffffffa0, %l7 = 000000000000000a
	ldx	[%i6+%o4],%l7		! %l7 = 57d6ffffffffffa0
!	Mem[0000000010041420] = 00000000 00000000, %l2 = 23225670, %l3 = 000000ff
	ldd	[%i1+0x020],%l2		! %l2 = 0000000000000000 0000000000000000
!	Mem[00000000100c1400] = a1614661ff000000, %l1 = 0000000000005670
	ldxa	[%i3+%g0]0x88,%l1	! %l1 = a1614661ff000000
!	Mem[0000000030101400] = ff600f62, %l0 = 5834e4dc00000000
	lduwa	[%i4+%g0]0x81,%l0	! %l0 = 00000000ff600f62
!	Mem[0000000010041410] = ff225670000000ff, %l2 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l2	! %l2 = ff225670000000ff

p0_label_55:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[00000000300c1400] = ffffffff
	stwa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff
!	%l1 = a1614661ff000000, Mem[0000000020800000] = 3acdbe80, %asi = 80
	stba	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = 00cdbe80
!	%l4 = 00000000000000ff, Mem[0000000010181400] = ff000000, %asi = 80
	stwa	%l4,[%i6+0x000]%asi	! Mem[0000000010181400] = 000000ff
!	Mem[0000000030001410] = ff0000ff, %l2 = ff225670000000ff
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010041400] = ff096634 78ed3be1
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff 00000000
!	%f28 = f5b04452 344a7651, %l2 = 00000000000000ff
!	Mem[0000000030141408] = 614661a1ffffa377
	add	%i5,0x008,%g1
	stda	%f28,[%g1+%l2]ASI_PST16_S ! Mem[0000000030141408] = f5b04452344a7651
!	%l5 = 0000000000000000, Mem[000000001010143e] = 10be04ff, %asi = 80
	stba	%l5,[%i4+0x03e]%asi	! Mem[000000001010143c] = 10be00ff
!	%l3 = 0000000000000000, Mem[0000000030101410] = ff000000
	stwa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Mem[0000000010141420] = 00600f62, %l6 = 000000ff, %l0 = ff600f62
	add	%i5,0x20,%g1
	casa	[%g1]0x80,%l6,%l0	! %l0 = 0000000000600f62
!	%f15 = 82a3085b, %f20 = 3d2d1e53, %f3  = ffffd657
	fmuls	%f15,%f20,%f3 		! tt=0x22, %l0 = 0000000000600f84

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081416] = 00000000, %l3 = 0000000000000000, %asi = 80
	ldsha	[%i2+0x016]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800040] = ff0098b0, %l7 = 57d6ffffffffffa0
	ldsb	[%o1+0x040],%l7		! %l7 = ffffffffffffffff
!	Mem[00000000300c1410] = ff000000, %l2 = 00000000000000ff
	ldswa	[%i3+%o5]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000030041400] = 390000001e54fc02, %f28 = f5b04452 344a7651
	ldda	[%i1+%g0]0x81,%f28	! %f28 = 39000000 1e54fc02
!	Mem[0000000010041408] = ffb27b7a, %l7 = ffffffffffffffff
	ldswa	[%i1+%o4]0x80,%l7	! %l7 = ffffffffffb27b7a
!	Mem[00000000100c1430] = b8ef672900afd415, %l2 = ffffffffff000000
	ldx	[%i3+0x030],%l2		! %l2 = b8ef672900afd415
!	Mem[0000000010081408] = 23225670, %l6 = 00000000000000ff
	ldswa	[%i2+%o4]0x80,%l6	! %l6 = 0000000023225670
!	Mem[0000000030141410] = a1673442, %l1 = a1614661ff000000
	ldsha	[%i5+%o5]0x81,%l1	! %l1 = ffffffffffffa167
	membar	#Sync			! Added by membar checker (10)
!	Mem[00000000300c1400] = 000000ff 0000ff0a ff0000ff 55282923
!	Mem[00000000300c1410] = ff000000 fd030000 33c35478 8a7f2955
!	Mem[00000000300c1420] = 49b18046 981ac93c 8f4ae761 968a047d
!	Mem[00000000300c1430] = b78cc136 deda621e abc0372d 31dd194e
	ldda	[%i3+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 00000000300c1400
!	Mem[00000000211c0000] = ec0aeee0, %l6 = 0000000023225670, %asi = 80
	lduba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ec

p0_label_57:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffb27b7a, Mem[0000000030141410] = 423467a1
	stwa	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = ffb27b7a
!	Mem[0000000020800000] = 00cdbe80, %l2 = b8ef672900afd415
	ldstub	[%o1+%g0],%l2		! %l2 = 0000000000000000
!	%l6 = 00000000000000ec, Mem[0000000010041438] = 2e225670, %asi = 80
	stha	%l6,[%i1+0x038]%asi	! Mem[0000000010041438] = 00ec5670
!	Mem[0000000010081400] = 00000000 00000000 23225670 000000ff
!	%f0  = 0aff0000 ff000000 23292855 ff0000ff
!	%f4  = 000003fd 000000ff 55297f8a 7854c333
!	%f8  = 3cc91a98 4680b149 7d048a96 61e74a8f
!	%f12 = 1e62dade 36c18cb7 4e19dd31 2d37c0ab
	stda	%f0 ,[%i2+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010081400
!	%f24 = a1673442 a1614661, %l4 = 00000000000000ff
!	Mem[0000000010141408] = ff7c17fd10be04ff
	add	%i5,0x008,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_P ! Mem[0000000010141408] = a1673442a1614661
!	%l7 = ffffffffffb27b7a, Mem[0000000010181410] = 61460080
	stba	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 6146007a
!	Mem[0000000030081410] = 70562223, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000070
!	Mem[0000000010181410] = 6146007a, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 000000000000007a
!	Mem[0000000010101400] = 3057df00, %l0 = 0000000000600f84
	swapa	[%i4+%g0]0x88,%l0	! %l0 = 000000003057df00
!	%l5 = 0000000000000070, Mem[0000000030181400] = 0a000000
	stha	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 0a000070

p0_label_58:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010081423] = 49b18046, %l7 = ffffffffffb27b7a, %asi = 80
	ldsba	[%i2+0x023]%asi,%l7	! %l7 = 0000000000000046
!	Mem[0000000010141400] = 00000000, %l1 = ffffffffffffa167
	ldsha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %f16 = 81ff7b3f
	lda	[%i0+%o4]0x88,%f16	! %f16 = 00000000
!	Mem[0000000010001408] = 00000000, %l1 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = ff0000ff, %f16 = 00000000
	lda	[%i2+%o4]0x80,%f16	! %f16 = ff0000ff
!	Mem[00000000100c1410] = 2352d4bc, %l2 = 000000000000007a
	lduwa	[%i3+%o5]0x80,%l2	! %l2 = 000000002352d4bc
!	Mem[0000000030081410] = ff562223, %l5 = 0000000000000070
	lduwa	[%i2+%o5]0x81,%l5	! %l5 = 00000000ff562223
!	Mem[0000000030141408] = 5244b0f5, %l5 = 00000000ff562223
	lduwa	[%i5+%o4]0x89,%l5	! %l5 = 000000005244b0f5
!	%l1 = 0000000000000000, immd = fffffffffffffa0f, %l108 = 0000000000000005
	sdivx	%l1,-0x5f1,%l5		! %l5 = 0000000000000000
!	Mem[0000000010141408] = a1673442, %l6 = 00000000000000ec, %asi = 80
	lduwa	[%i5+0x008]%asi,%l6	! %l6 = 00000000a1673442

p0_label_59:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101430] = 51764a34, %l0 = 3057df00, %l3 = 00000000
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 0000000051764a34
!	%f6  = 55297f8a 7854c333, Mem[0000000010081408] = ff0000ff 23292855
	stda	%f6 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 55297f8a 7854c333
!	%f16 = ff0000ff 3057df00, Mem[0000000010041400] = 000000ff 00000000
	stda	%f16,[%i1+%g0]0x80	! Mem[0000000010041400] = ff0000ff 3057df00
!	%l7 = 0000000000000046, %l2 = 000000002352d4bc, %l7 = 0000000000000046
	xnor	%l7,%l2,%l7		! %l7 = ffffffffdcad2b05
!	Mem[0000000010041400] = ff0000ff, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081400] = ff009a24 61e74a8f ffffffff 00000000
!	%f16 = ff0000ff 3057df00 ffb27b7a 00000a00
!	%f20 = 3d2d1e53 cd9109ff 23292855 ff0000ff
!	%f24 = a1673442 a1614661 48401344 ece96015
!	%f28 = 39000000 1e54fc02 ff04be10 78ed3be1
	stda	%f16,[%i2+%g0]ASI_BLK_S	! Block Store to 0000000030081400
!	%f24 = a1673442, Mem[0000000030181400] = 0a000070
	sta	%f24,[%i6+%g0]0x89	! Mem[0000000030181400] = a1673442
!	Mem[0000000010101408] = 000a0000, %l0 = 000000003057df00
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 00000000000a0000
!	Mem[0000000010101400] = 840f6000, %l0 = 00000000000a0000
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000084
!	Mem[00000000218001c1] = ff531060, %l5 = 00000000000000ff
	ldstuba	[%o3+0x1c1]%asi,%l5	! %l5 = 0000000000000053

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 5244b0f5, %l1 = 0000000000000000
	lduha	[%i5+%o4]0x89,%l1	! %l1 = 000000000000b0f5
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030081410] = 531e2d3d, %f2  = 23292855
	lda	[%i2+%o5]0x89,%f2 	! %f2 = 531e2d3d
!	Mem[0000000021800140] = 32ff2000, %l5 = 0000000000000053, %asi = 80
	lduha	[%o3+0x140]%asi,%l5	! %l5 = 00000000000032ff
!	Mem[0000000010181400] = 000000ff, %l1 = 000000000000b0f5
	lduwa	[%i6+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[000000001014142c] = 61e74a8f, %l3 = 0000000051764a34, %asi = 80
	ldswa	[%i5+0x02c]%asi,%l3	! %l3 = 0000000061e74a8f
!	Mem[0000000030081408] = ffb27b7a00000a00, %l2 = 000000002352d4bc
	ldxa	[%i2+%o4]0x81,%l2	! %l2 = ffb27b7a00000a00
!	Mem[00000000201c0000] = ff4f6050, %l3 = 0000000061e74a8f
	ldsh	[%o0+%g0],%l3		! %l3 = ffffffffffffff4f
!	%l0 = 0000000000000084, immd = fffffffffffff4a5, %l108 = 0000000000000000
	udivx	%l0,-0xb5b,%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 000000ff, %l7 = ffffffffdcad2b05
	ldsba	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001400] = ece96015, %l2 = ffb27b7a00000a00
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 0000000000006015

p0_label_61:
!	Starting 10 instruction Store Burst
!	%l6 = a1673442, %l7 = ffffffff, Mem[0000000010041400] = ff0000ff 3057df00
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = a1673442 ffffffff
!	%f0  = 0aff0000 ff000000, %l0 = 0000000000000000
!	Mem[0000000030081428] = 48401344ece96015
	add	%i2,0x028,%g1
	stda	%f0,[%g1+%l0]ASI_PST16_S ! Mem[0000000030081428] = 48401344ece96015
!	Code Fragment 3, seed = 954529
p0_fragment_4:
!	%l0 = 0000000000000000
	setx	0xc5a88be373fa641e,%g7,%l0 ! %l0 = c5a88be373fa641e
!	%l1 = 00000000000000ff
	setx	0x691b22948dd636c9,%g7,%l1 ! %l1 = 691b22948dd636c9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c5a88be373fa641e
	setx	0x96d4a3e48b5f2584,%g7,%l0 ! %l0 = 96d4a3e48b5f2584
!	%l1 = 691b22948dd636c9
	setx	0xf66ca2297847b34f,%g7,%l1 ! %l1 = f66ca2297847b34f
p0_fragment_4_end:
!	Mem[0000000030101408] = e97dec79, %l5 = 00000000000032ff
	swapa	[%i4+%o4]0x89,%l5	! %l5 = 00000000e97dec79
!	Mem[0000000030001408] = 00000000, %l0 = 000000008b5f2584
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	%l2 = 0000000000006015, Mem[000000001004140a] = ffb27b7a
	sth	%l2,[%i1+0x00a]		! Mem[0000000010041408] = ffb26015
!	%f30 = ff04be10 78ed3be1, %l2 = 0000000000006015
!	Mem[0000000010041408] = ffb260150000a161
	add	%i1,0x008,%g1
	stda	%f30,[%g1+%l2]ASI_PST32_P ! Mem[0000000010041408] = ffb2601578ed3be1
!	%l0 = 0000000000000000, Mem[00000000218000c1] = ffbb1fa0
	stb	%l0,[%o3+0x0c1]		! Mem[00000000218000c0] = ff001fa0
!	%l0 = 0000000000000000, Mem[0000000010001408] = 000000001c3bbb1e
	stxa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000000
!	%l7 = ffffffffffffffff, Mem[0000000030001400] = 1560e9ec
	stha	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffe9ec

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 33c35478, %l0 = 0000000000000000, %asi = 80
	ldsha	[%i2+0x008]%asi,%l0	! %l0 = 00000000000033c3
!	Mem[0000000030101408] = ff320000, %f7  = 7854c333
	lda	[%i4+%o4]0x81,%f7 	! %f7 = ff320000
!	Mem[0000000030101408] = 00000004000032ff, %l3 = ffffffffffffff4f
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = 00000004000032ff
!	Mem[0000000010141404] = 48ece820, %f26 = 48401344
	lda	[%i5+0x004]%asi,%f26	! %f26 = 48ece820
!	Mem[0000000030041400] = 39000000 1e54fc02, %l6 = a1673442, %l7 = ffffffff
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 0000000039000000 000000001e54fc02
!	Mem[00000000100c1400] = 000000ff, %l1 = f66ca2297847b34f
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141410] = 1560e9ec, %l0 = 00000000000033c3
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000015
!	Mem[0000000030101400] = ff600f62 4f0c3bf1, %l6 = 39000000, %l7 = 1e54fc02
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 00000000ff600f62 000000004f0c3bf1
!	Mem[0000000010001410] = 00000000, %l0 = 0000000000000015
	ldsba	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = ff0f6000, %l1 = 00000000000000ff
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 000000000000ff0f

p0_label_63:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000e97dec79, Mem[0000000010181410] = ff004661
	stba	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 79004661
!	Mem[00000000100c141c] = 00004a34, %l0 = 0000000000000000, %asi = 80
	swapa	[%i3+0x01c]%asi,%l0	! %l0 = 0000000000004a34
!	Mem[0000000010101410] = ffffffff, %l4 = 00000000000000ff
	swapa	[%i4+%o5]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030081400] = ff0000ff, %l0 = 0000000000004a34
	ldstuba	[%i2+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000021800180] = ffffda30
	sth	%l0,[%o3+0x180]		! Mem[0000000021800180] = 00ffda30
!	%l0 = 00000000000000ff, Mem[0000000030081400] = ff0000ff
	stha	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 00ff00ff
!	Mem[0000000010001404] = 68d8f101, %l3 = 000032ff, %l3 = 000032ff
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 0000000068d8f101
!	Mem[0000000030181408] = 57d6ffff, %l7 = 000000004f0c3bf1
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000057
!	%f20 = 3d2d1e53, Mem[0000000030081410] = 3d2d1e53
	sta	%f20,[%i2+%o5]0x81	! Mem[0000000030081410] = 3d2d1e53
!	%l7 = 0000000000000057, Mem[0000000010181424] = 79ec7de9
	stw	%l7,[%i6+0x024]		! Mem[0000000010181424] = 00000057

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081424] = 981ac93c, %l1 = 000000000000ff0f, %asi = 80
	lduba	[%i2+0x024]%asi,%l1	! %l1 = 0000000000000098
!	Mem[0000000030101400] = f13b0c4f620f60ff, %l2 = 0000000000006015
	ldxa	[%i4+%g0]0x89,%l2	! %l2 = f13b0c4f620f60ff
!	Mem[0000000010101438] = e13bed7810be00ff, %l3 = 0000000068d8f101, %asi = 80
	ldxa	[%i4+0x038]%asi,%l3	! %l3 = e13bed7810be00ff
!	%l2 = f13b0c4f620f60ff, %l0 = 00000000000000ff, %l4 = 00000000ffffffff
	or	%l2,%l0,%l4		! %l4 = f13b0c4f620f60ff
!	Mem[0000000020800000] = ffcdbe80, %l0 = 00000000000000ff, %asi = 80
	lduba	[%o1+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000021800140] = 32ff2000, %l6 = 00000000ff600f62, %asi = 80
	lduha	[%o3+0x140]%asi,%l6	! %l6 = 00000000000032ff
!	Mem[0000000030101410] = 00000000, %f15 = 2d37c0ab
	lda	[%i4+%o5]0x89,%f15	! %f15 = 00000000
!	Mem[0000000010141408] = a1673442, %l0 = 00000000000000ff
	lduba	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000a1
!	Mem[0000000010181408] = ffffd657, %l0 = 00000000000000a1
	lduha	[%i6+%o4]0x88,%l0	! %l0 = 000000000000d657
!	%f17 = 3057df00, %f24 = a1673442, %f14 = 4e19dd31
	fadds	%f17,%f24,%f14		! %f14 = 3057df00

p0_label_65:
!	Starting 10 instruction Store Burst
!	%f24 = a1673442 a1614661, Mem[00000000100c1400] = ff000000 a1614661
	stda	%f24,[%i3+%g0]0x88	! Mem[00000000100c1400] = a1673442 a1614661
!	%f24 = a1673442, Mem[0000000010041438] = 00ec5670
	sta	%f24,[%i1+0x038]%asi	! Mem[0000000010041438] = a1673442
!	%l7 = 0000000000000057, Mem[0000000010101400] = 00600fff
	stba	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 00600f57
!	%l2 = f13b0c4f620f60ff, Mem[0000000010141408] = 614661a1423467a1
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = f13b0c4f620f60ff
!	%l2 = 620f60ff, %l3 = 10be00ff, Mem[0000000010181430] = 545f9a24 0f6e0b25, %asi = 80
	stda	%l2,[%i6+0x030]%asi	! Mem[0000000010181430] = 620f60ff 10be00ff
!	Mem[0000000010001408] = 00000000, %l1 = 0000000000000098
	ldswa	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 79004661212be96d, %l7 = 0000000000000057, %l7 = 0000000000000057
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = 79004661212be96d
!	%l6 = 000032ff, %l7 = 212be96d, Mem[0000000030081410] = 531e2d3d ff0991cd
	stda	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 000032ff 212be96d
!	Mem[0000000010181420] = 2967efb8, %l7 = 212be96d, %l5 = e97dec79
	add	%i6,0x20,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 000000002967efb8
!	Mem[0000000030141400] = 614661a1, %l3 = 0000000010be00ff
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000614661a1

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[000000001008143d] = 31dd194e, %l2 = f13b0c4f620f60ff, %asi = 80
	lduba	[%i2+0x03d]%asi,%l2	! %l2 = 00000000000000dd
!	Mem[0000000010041439] = a1673442, %l5 = 000000002967efb8
	ldub	[%i1+0x039],%l5		! %l5 = 0000000000000067
!	Mem[0000000010141408] = 620f60ff, %l6 = 00000000000032ff
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%l0 = 000000000000d657, %l7 = 79004661212be96d, %l2 = 00000000000000dd
	and	%l0,%l7,%l2		! %l2 = 000000000000c045
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000010181400] = 000000ff 00000000 57d6ffff ffffffa0
!	Mem[0000000010181410] = 79004661 212be96d 64b37baa 095abad3
!	Mem[0000000010181420] = 2967efb8 00000057 79ec7de9 04000000
!	Mem[0000000010181430] = 620f60ff 10be00ff 5b08a382 42ec7c4b
	ldda	[%i6+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010181400
!	Mem[0000000030041400] = 39000000, %l3 = 00000000614661a1
	lduba	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000039
!	Mem[00000000100c1410] = bcd45223, %l1 = 0000000000000000
	lduwa	[%i3+%o5]0x88,%l1	! %l1 = 00000000bcd45223
!	Mem[00000000100c1408] = ff00000000000036, %l7 = 79004661212be96d
	ldxa	[%i3+%o4]0x80,%l7	! %l7 = ff00000000000036
!	Code Fragment 4, seed = 724175
p0_fragment_5:
!	%l0 = 000000000000d657
	setx	0x343311a0347010ae,%g7,%l0 ! %l0 = 343311a0347010ae
!	%l1 = 00000000bcd45223
	setx	0x485f0b16d7437e59,%g7,%l1 ! %l1 = 485f0b16d7437e59
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 343311a0347010ae
	setx	0x8f6009a3188d1814,%g7,%l0 ! %l0 = 8f6009a3188d1814
!	%l1 = 485f0b16d7437e59
	setx	0xf95ce88c8af260df,%g7,%l1 ! %l1 = f95ce88c8af260df
p0_fragment_5_end:
!	Mem[0000000010101400] = ffff7b3f00600f57, %f16 = ff0000ff 3057df00
	ldda	[%i4+%g0]0x88,%f16	! %f16 = ffff7b3f 00600f57

p0_label_67:
!	Starting 10 instruction Store Burst
!	%l7 = ff00000000000036, Mem[0000000030181408] = ffd6ffff
	stwa	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000036
!	Mem[0000000010001417] = 00000052, %l7 = ff00000000000036
	ldstub	[%i0+0x017],%l7		! %l7 = 0000000000000052
!	%l4 = f13b0c4f620f60ff, Mem[00000000300c1408] = 23292855ff0000ff
	stxa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = f13b0c4f620f60ff
!	Mem[00000000300c1408] = 620f60ff, %l4 = 00000000620f60ff
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 00000000620f60ff
!	%f24 = a1673442 a1614661, Mem[0000000010141410] = 1560e9ec 63399ecd
	stda	%f24,[%i5+%o5]0x80	! Mem[0000000010141410] = a1673442 a1614661
!	Mem[00000000300c1410] = ff000000, %l1 = f95ce88c8af260df
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000021800081] = 0de4d970, %l6 = 00000000000000ff
	ldstub	[%o3+0x081],%l6		! %l6 = 00000000000000e4
!	Mem[00000000100c1400] = 614661a1, %l7 = 0000000000000052
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000061
	membar	#Sync			! Added by membar checker (14)
!	%l4 = 00000000620f60ff, Mem[0000000010181400] = 000000ff
	stha	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 60ff00ff
!	%f6  = 64b37baa, Mem[0000000010081408] = 7854c333
	sta	%f6 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 64b37baa

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 7a7bb2ffa1614661, %f8  = 2967efb8 00000057
	ldda	[%i5+%o5]0x81,%f8 	! %f8  = 7a7bb2ff a1614661
!	Mem[00000000300c1400] = ff000000, %l4 = 00000000620f60ff
	ldsha	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000021800141] = 32ff2000, %l1 = 00000000000000ff
	ldsb	[%o3+0x141],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030081400] = 00ff00ff, %l6 = 00000000000000e4
	lduha	[%i2+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%l4 = 0000000000000000, %l1 = ffffffffffffffff, %y  = 00000000
	sdiv	%l4,%l1,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = 188d1814
!	Mem[000000001004143a] = a1673442, %l6 = 00000000000000ff, %asi = 80
	lduha	[%i1+0x03a]%asi,%l6	! %l6 = 0000000000003442
!	Mem[00000000300c1410] = ff000000, %l2 = 000000000000c045
	ldswa	[%i3+%o5]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000030141410] = 7a7bb2ff, %l4 = 0000000000000000
	ldswa	[%i5+%o5]0x81,%l4	! %l4 = 000000007a7bb2ff
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = ec0aeee0, %l6 = 0000000000003442, %asi = 80
	lduba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ec

p0_label_69:
!	Starting 10 instruction Store Burst
!	%l4 = 000000007a7bb2ff, Mem[0000000010101410] = 000000ff531e2d3d
	stx	%l4,[%i4+%o5]		! Mem[0000000010101410] = 000000007a7bb2ff
!	%l2 = ffffffffff000000, Mem[00000000300c1410] = ff000000
	stwa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff000000
!	Mem[0000000020800041] = ff0098b0, %l1 = ffffffffffffffff
	ldstub	[%o1+0x041],%l1		! %l1 = 0000000000000000
!	%l2 = ffffffffff000000, Mem[0000000030041400] = 00000039
	stha	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%l1 = 0000000000000000, Mem[00000000100c1434] = 00afd415
	sth	%l1,[%i3+0x034]		! Mem[00000000100c1434] = 0000d415
!	Mem[0000000010181408] = 57d6ffff, %l5 = 0000000000000000, %asi = 80
	swapa	[%i6+0x008]%asi,%l5	! %l5 = 0000000057d6ffff
!	Mem[0000000010081408] = 64b37baa, %l7 = 0000000000000061
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 0000000064b37baa
!	%l0 = 8f6009a3188d1814, Mem[0000000010001409] = 00000000, %asi = 80
	stba	%l0,[%i0+0x009]%asi	! Mem[0000000010001408] = 00140000
!	%f14 = 5b08a382 42ec7c4b, %l5 = 0000000057d6ffff
!	Mem[0000000010041420] = 0000000000000000
	add	%i1,0x020,%g1
	stda	%f14,[%g1+%l5]ASI_PST8_P ! Mem[0000000010041420] = 5b08a38242ec7c4b
!	Mem[0000000030081410] = 000032ff, %l6 = 00000000000000ec
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000ff

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 1560b2ff, %l4 = 000000007a7bb2ff
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 000000000000b2ff
!	Mem[0000000010181410] = 61460079, %f30 = ff04be10
	lda	[%i6+%o5]0x88,%f30	! %f30 = 61460079
!	Mem[0000000010181400] = 60ff00ff00000000, %l2 = ffffffffff000000
	ldxa	[%i6+%g0]0x80,%l2	! %l2 = 60ff00ff00000000
!	Mem[000000001004140c] = 78ed3be1, %l3 = 0000000000000039
	ldsh	[%i1+0x00c],%l3		! %l3 = 00000000000078ed
!	%l0 = 8f6009a3188d1814, immd = fffffffffffff68e, %l108 = 0000000000000001
	udivx	%l0,-0x972,%l1		! %l1 = 0000000000000000
!	Mem[0000000021800140] = 32ff2000, %l4 = 000000000000b2ff
	lduh	[%o3+0x140],%l4		! %l4 = 00000000000032ff
!	Mem[00000000300c1410] = 000000ff, %f19 = 00000a00
	lda	[%i3+%o5]0x89,%f19	! %f19 = 000000ff
!	Mem[00000000100c1410] = 2352d4bcd947ff20, %f30 = 61460079 78ed3be1
	ldda	[%i3+%o5]0x80,%f30	! %f30 = 2352d4bc d947ff20
!	Mem[0000000030041408] = e3b9d24002fc54ec, %f12 = 620f60ff 10be00ff
	ldda	[%i1+%o4]0x89,%f12	! %f12 = e3b9d240 02fc54ec
!	Mem[0000000030081400] = 00df5730ff00ff00, %f24 = a1673442 a1614661
	ldda	[%i2+%g0]0x89,%f24	! %f24 = 00df5730 ff00ff00

p0_label_71:
!	Starting 10 instruction Store Burst
!	%l0 = 188d1814, %l1 = 00000000, Mem[0000000010101408] = 3057df00 00ff00ff
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 188d1814 00000000
!	%l4 = 00000000000032ff, Mem[0000000010141400] = 00000000
	stwa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 000032ff
!	Mem[00000000201c0001] = ff4f6050, %l4 = 00000000000032ff
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 000000000000004f
!	Mem[00000000100c1408] = ff000000, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	%f2  = 57d6ffff, Mem[0000000010001410] = 00000000
	sta	%f2 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 57d6ffff
!	%l5 = 0000000057d6ffff, Mem[0000000010181418] = 64b37baa095abad3, %asi = 80
	stxa	%l5,[%i6+0x018]%asi	! Mem[0000000010181418] = 0000000057d6ffff
!	%l2 = 00000000ff000000, Mem[0000000010001400] = 55282923
	stba	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00282923
!	Mem[0000000010141410] = a1673442, %l4 = 000000000000004f
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000a1
!	%f4  = 79004661 212be96d, Mem[0000000010001410] = ffffd657 000000ff
	stda	%f4 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 79004661 212be96d
!	%l6 = 00000000000000ff, %l4 = 00000000000000a1, %l0 = 8f6009a3188d1814
	subc	%l6,%l4,%l0		! %l0 = 000000000000005e

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff320000, %l4 = 00000000000000a1
	lduwa	[%i5+%g0]0x88,%l4	! %l4 = 00000000ff320000
!	Mem[0000000010081418] = 33c354788a7f2955, %f18 = ffb27b7a 000000ff, %asi = 80
	ldda	[%i2+0x018]%asi,%f18	! %f18 = 33c35478 8a7f2955
!	Mem[0000000010101410] = 00000000, %f0  = 000000ff
	lda	[%i4+%o5]0x88,%f0 	! %f0 = 00000000
!	Mem[0000000030141400] = ff00be10, %l3 = 00000000000078ed
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000010
!	%l0 = 000000000000005e, immd = fffff107, %y  = 188d1814
	smul	%l0,-0xef9,%l5		! %l5 = fffffffffffa8092, %y = ffffffff
!	Mem[0000000030001410] = ff0000ff, %l4 = 00000000ff320000
	lduba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l4 = 00000000000000ff
	lduha	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = 8b5f2584, %l3 = 0000000000000010
	lduha	[%i0+%o4]0x81,%l3	! %l3 = 0000000000008b5f
!	Mem[00000000100c1437] = 0000d415, %l4 = 0000000000000000, %asi = 80
	ldsba	[%i3+0x037]%asi,%l4	! %l4 = 0000000000000015
!	Mem[0000000010181410] = 79004661, %l2 = 00000000ff000000
	ldswa	[%i6+%o5]0x80,%l2	! %l2 = 0000000079004661

p0_label_73:
!	Starting 10 instruction Store Burst
!	%f16 = ffff7b3f 00600f57, Mem[0000000010141438] = 4e19dd31 2d37c0ab
	std	%f16,[%i5+0x038]	! Mem[0000000010141438] = ffff7b3f 00600f57
!	Mem[00000000300c1410] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l2 = 0000000079004661, Mem[0000000020800000] = ffcdbe80
	stb	%l2,[%o1+%g0]		! Mem[0000000020800000] = 61cdbe80
!	Mem[0000000010181410] = 79004661, %l1 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000079
!	Mem[0000000030141408] = 5244b0f5, %l4 = 0000000000000015
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 000000005244b0f5
!	Mem[0000000010081419] = 33c35478, %l3 = 0000000000008b5f
	ldstuba	[%i2+0x019]%asi,%l3	! %l3 = 00000000000000c3
!	Mem[0000000030181410] = 80004661, %l4 = 000000005244b0f5
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000080
!	Mem[0000000030081400] = 00ff00ff 3057df00 ffb27b7a 00000a00
!	%f0  = 00000000 00000000 57d6ffff ffffffa0
!	%f4  = 79004661 212be96d 64b37baa 095abad3
!	%f8  = 7a7bb2ff a1614661 79ec7de9 04000000
!	%f12 = e3b9d240 02fc54ec 5b08a382 42ec7c4b
	stda	%f0 ,[%i2+%g0]ASI_BLK_S	! Block Store to 0000000030081400
!	%l4 = 00000080, %l5 = fffa8092, Mem[0000000010141408] = 620f60ff f13b0c4f
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000080 fffa8092
!	Code Fragment 3, seed = 172145
p0_fragment_6:
!	%l0 = 000000000000005e
	setx	0x1574deb0da82b59e,%g7,%l0 ! %l0 = 1574deb0da82b59e
!	%l1 = 0000000000000079
	setx	0xe3c914ce116bd049,%g7,%l1 ! %l1 = e3c914ce116bd049
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1574deb0da82b59e
	setx	0x1eb7a1de9e1f8704,%g7,%l0 ! %l0 = 1eb7a1de9e1f8704
!	%l1 = e3c914ce116bd049
	setx	0xf332568e5fd85ccf,%g7,%l1 ! %l1 = f332568e5fd85ccf
p0_fragment_6_end:

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff320000, %l1 = f332568e5fd85ccf
	lduha	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = ff600f62, %l7 = 0000000064b37baa
	ldswa	[%i4+%g0]0x81,%l7	! %l7 = ffffffffff600f62
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010081400] = 0aff0000 ff000000, %l2 = 79004661, %l3 = 000000c3
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000ff000000 000000000aff0000
!	Mem[0000000010041410] = 705622ff, %l2 = 00000000ff000000
	lduwa	[%i1+%o5]0x88,%l2	! %l2 = 00000000705622ff
!	Mem[0000000010181414] = 212be96d, %l6 = 00000000000000ff, %asi = 80
	lduha	[%i6+0x014]%asi,%l6	! %l6 = 000000000000212b
!	Mem[00000000100c1414] = d947ff20, %f4  = 79004661
	ld	[%i3+0x014],%f4 	! %f4 = d947ff20
!	Mem[000000001018142c] = 04000000, %l0 = 1eb7a1de9e1f8704, %asi = 80
	lduha	[%i6+0x02c]%asi,%l0	! %l0 = 0000000000000400
!	Mem[0000000010101410] = 00000000, %f31 = d947ff20
	lda	[%i4+%o5]0x88,%f31	! %f31 = 00000000
!	Mem[0000000010001408] = 00140000, %l6 = 000000000000212b, %asi = 80
	ldswa	[%i0+0x008]%asi,%l6	! %l6 = 0000000000140000
!	Mem[0000000010181410] = 6de92b21 614600ff, %l2 = 705622ff, %l3 = 0aff0000
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 00000000614600ff 000000006de92b21

p0_label_75:
!	Starting 10 instruction Store Burst
!	%f14 = 5b08a382, %f17 = 00600f57
	fcmpes	%fcc0,%f14,%f17		! %fcc0 = 2
!	%l0 = 0000000000000400, Mem[0000000030041408] = 02fc54ec
	stwa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000400
!	Mem[000000001000143c] = 3d86cd1b, %l5 = 00000000fffa8092, %asi = 80
	swapa	[%i0+0x03c]%asi,%l5	! %l5 = 000000003d86cd1b
!	%l0 = 00000400, %l1 = 00000000, Mem[0000000010181408] = 00000000 ffffffa0
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000400 00000000
!	Mem[00000000300c1410] = 000000ff, %l4 = 0000000000000080
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = ece9ffff, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1410] = 2352d4bc, %l5 = 000000003d86cd1b
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000023
!	%l2 = 614600ff, %l3 = 6de92b21, Mem[00000000300c1410] = 00000080 000003fd
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 614600ff 6de92b21
!	Mem[000000001010141c] = 55282923, %l5 = 0000000000000023
	swap	[%i4+0x01c],%l5		! %l5 = 0000000055282923
!	%l7 = ffffffffff600f62, Mem[00000000201c0000] = ffff6050, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0f626050

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00040000, %l0 = 0000000000000400
	ldsba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101428] = 1560e9ec, %l4 = 00000000000000ff
	ldsw	[%i4+0x028],%l4		! %l4 = 000000001560e9ec
!	Mem[0000000010041406] = ffffffff, %l4 = 000000001560e9ec
	lduh	[%i1+0x006],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030001408] = 8b5f2584, %l0 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l0	! %l0 = ffffffffffff8b5f
!	Mem[00000000100c1418] = fd177c43, %l7 = ffffffffff600f62
	ldsw	[%i3+0x018],%l7		! %l7 = fffffffffd177c43
!	Mem[0000000010141400] = 000032ff48ece820, %f20 = 3d2d1e53 cd9109ff
	ldda	[%i5+%g0]0x80,%f20	! %f20 = 000032ff 48ece820
!	Mem[0000000010081410] = 000000ff, %f4  = d947ff20
	lda	[%i2+%o5]0x88,%f4 	! %f4 = 000000ff
!	Mem[0000000010041408] = 1560b2ff, %l4 = 000000000000ffff
	ldsha	[%i1+%o4]0x88,%l4	! %l4 = ffffffffffffb2ff
!	Mem[0000000010001410] = 79004661212be96d, %l3 = 000000006de92b21
	ldxa	[%i0+%o5]0x80,%l3	! %l3 = 79004661212be96d
!	Mem[00000000100c1400] = 614661a1, %l5 = 0000000055282923
	ldswa	[%i3+%g0]0x80,%l5	! %l5 = 00000000614661a1

p0_label_77:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000614600ff, Mem[000000001014143c] = 00600f57, %asi = 80
	stwa	%l2,[%i5+0x03c]%asi	! Mem[000000001014143c] = 614600ff
!	%f14 = 5b08a382 42ec7c4b, Mem[0000000030001410] = ff0000ff 5b6c042d
	stda	%f14,[%i0+%o5]0x81	! Mem[0000000030001410] = 5b08a382 42ec7c4b
!	%f27 = ece96015, %f11 = 04000000, %f29 = 1e54fc02
	fsubs	%f27,%f11,%f29		! %f29 = ece96015
!	%l4 = ffffffffffffb2ff, Mem[0000000010101400] = 00600f57
	stba	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 00600fff
!	%l1 = 00000000000000ff, Mem[0000000010141418] = 55297f8a7854c333, %asi = 80
	stxa	%l1,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000000000ff
!	%l4 = ffffffffffffb2ff, Mem[0000000020800000] = 61cdbe80
	stb	%l4,[%o1+%g0]		! Mem[0000000020800000] = ffcdbe80
!	%l6 = 0000000000140000, Mem[00000000201c0000] = 0f626050, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00006050
!	%l5 = 00000000614661a1, Mem[0000000030081400] = 00000000
	stwa	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 614661a1
!	%l0 = ffffffffffff8b5f, Mem[000000001014143c] = 614600ff, %asi = 80
	stwa	%l0,[%i5+0x03c]%asi	! Mem[000000001014143c] = ffff8b5f
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000000140000
	swapa	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041416] = 000000ff, %l6 = 0000000000000000, %asi = 80
	lduha	[%i1+0x016]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141420] = 00600f624642b149, %l2 = 00000000614600ff
	ldx	[%i5+0x020],%l2		! %l2 = 00600f624642b149
!	Mem[0000000010001410] = 61460079, %f4  = 000000ff
	lda	[%i0+%o5]0x88,%f4 	! %f4 = 61460079
!	Mem[000000001004141e] = 45a45983, %l3 = 79004661212be96d, %asi = 80
	lduha	[%i1+0x01e]%asi,%l3	! %l3 = 0000000000005983
!	Mem[0000000010041438] = a1673442, %l0 = ffffffffffff8b5f, %asi = 80
	ldswa	[%i1+0x038]%asi,%l0	! %l0 = ffffffffa1673442
!	Mem[0000000030141400] = a1673442ff00be10, %l2 = 00600f624642b149
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = a1673442ff00be10
!	Mem[0000000010081410] = 000003fd000000ff, %f20 = 000032ff 48ece820
	ldda	[%i2+%o5]0x88,%f20	! %f20 = 000003fd 000000ff
	membar	#Sync			! Added by membar checker (16)
!	Mem[00000000100c1400] = 614661a1 423467a1 00140000 00000036
!	Mem[00000000100c1410] = ff52d4bc d947ff20 fd177c43 00000000
!	Mem[00000000100c1420] = 2465be68 775a23d9 4d3758e6 1ae9609f
!	Mem[00000000100c1430] = b8ef6729 0000d415 00000000 00000000
	ldda	[%i3+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000030101400] = ff600f62, %l7 = fffffffffd177c43
	ldsba	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[000000001004141e] = 45a45983, %l3 = 0000000000005983
	ldsh	[%i1+0x01e],%l3		! %l3 = 0000000000005983

p0_label_79:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010141405] = 48ece820, %asi = 80
	stba	%l6,[%i5+0x005]%asi	! Mem[0000000010141404] = 48ffe820
!	%f16 = a1673442 a1614661, %l2 = a1673442ff00be10
!	Mem[0000000030081428] = 79ec7de904000000
	add	%i2,0x028,%g1
	stda	%f16,[%g1+%l2]ASI_PST8_S ! Mem[0000000030081428] = 79ec7d4204000000
!	Mem[0000000030141408] = 00000015, %l0 = ffffffffa1673442
	ldstuba	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000015
!	Mem[0000000010041438] = a16734426769b6c1, %l4 = ffffffffffffb2ff, %l7 = ffffffffffffffff
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = a16734426769b6c1
!	Mem[000000001014140e] = 9280faff, %l2 = a1673442ff00be10
	ldstub	[%i5+0x00e],%l2		! %l2 = 00000000000000fa
!	%l3 = 0000000000005983, Mem[0000000010081438] = abc0372d31dd194e
	stx	%l3,[%i2+0x038]		! Mem[0000000010081438] = 0000000000005983
!	%l4 = ffffffffffffb2ff, Mem[0000000010101400] = ff0f6000
	stw	%l4,[%i4+%g0]		! Mem[0000000010101400] = ffffb2ff
!	%l4 = ffffffffffffb2ff, Mem[0000000010141410] = 423467ff
	stha	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 4234b2ff
!	%f28 = 15d40000, Mem[0000000030081410] = 61460079
	sta	%f28,[%i2+%o5]0x89	! Mem[0000000030081410] = 15d40000
!	%l0 = 00000015, %l1 = 000000ff, Mem[0000000010101400] = ffffb2ff 3f7bffff
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000015 000000ff

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 423467a1, %l2 = 00000000000000fa
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 00000000000067a1
!	Mem[0000000030041408] = 00040000, %l1 = 00000000000000ff
	lduba	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 000000007a7bb2ff, %l5 = 00000000614661a1
	ldx	[%i4+%o5],%l5		! %l5 = 000000007a7bb2ff
!	Mem[0000000030041408] = e3b9d240 00000400, %l2 = 000067a1, %l3 = 00005983
	ldda	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000400 00000000e3b9d240
!	Mem[0000000010141400] = 20e8ff48 ff320000, %l4 = ffffb2ff, %l5 = 7a7bb2ff
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 00000000ff320000 0000000020e8ff48
!	Code Fragment 3, seed = 749381
p0_fragment_7:
!	%l0 = 0000000000000015
	setx	0xfa123a1f23e752fe,%g7,%l0 ! %l0 = fa123a1f23e752fe
!	%l1 = 0000000000000000
	setx	0xf59ee9b170016fa9,%g7,%l1 ! %l1 = f59ee9b170016fa9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fa123a1f23e752fe
	setx	0x9cf1abb7a0be8864,%g7,%l0 ! %l0 = 9cf1abb7a0be8864
!	%l1 = f59ee9b170016fa9
	setx	0x2c75ef438d6b202f,%g7,%l1 ! %l1 = 2c75ef438d6b202f
p0_fragment_7_end:
!	Mem[0000000010101408] = 188d1814, %l0 = 9cf1abb7a0be8864
	lduwa	[%i4+%o4]0x80,%l0	! %l0 = 00000000188d1814
!	%l1 = 2c75ef438d6b202f, %l2 = 0000000000000400, %l4 = 00000000ff320000
	addc	%l1,%l2,%l4		! %l4 = 2c75ef438d6b242f
!	Mem[0000000010001400] = 00282923, %l1 = 2c75ef438d6b202f
	ldsha	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000028
!	Mem[00000000100c1408] = 0014000000000036, %f6  = 64b37baa 095abad3
	ldda	[%i3+%o4]0x80,%f6 	! %f6  = 00140000 00000036

p0_label_81:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (17)
!	%f20 = 20ff47d9 bcd452ff, Mem[00000000100c1420] = 2465be68 775a23d9
	std	%f20,[%i3+0x020]	! Mem[00000000100c1420] = 20ff47d9 bcd452ff
!	Mem[0000000030041400] = 00000000, %l7 = a16734426769b6c1
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l4 = 000000008d6b242f
	swap	[%i4+%o5],%l4		! %l4 = 0000000000000000
!	Mem[00000000100c1410] = ff52d4bc, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181400] = 423467a1, %l3 = 00000000e3b9d240
	ldstuba	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000042
!	%f2  = 57d6ffff ffffffa0, %l2 = 0000000000000400
!	Mem[0000000010001410] = 79004661212be96d
	add	%i0,0x010,%g1
	stda	%f2,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010001410] = 79004661212be96d
!	Mem[0000000010081410] = 000000ff, %l1 = 0000000000000028
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l2 = 0000000000000400, Mem[0000000010001410] = 79004661, %asi = 80
	stwa	%l2,[%i0+0x010]%asi	! Mem[0000000010001410] = 00000400
!	%f4  = 61460079 212be96d, Mem[0000000010141400] = ff320000 20e8ff48
	stda	%f4 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 61460079 212be96d
!	%f7  = 00000036, Mem[000000001010143c] = 10be00ff
	st	%f7 ,[%i4+0x03c]	! Mem[000000001010143c] = 00000036

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 614661a1, %l5 = 0000000020e8ff48
	lduha	[%i2+%g0]0x89,%l5	! %l5 = 00000000000061a1
!	Mem[0000000010101400] = ff000000 15000000, %l4 = 00000000, %l5 = 000061a1
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 0000000015000000 00000000ff000000
!	Mem[000000001000140e] = 00000000, %l6 = 00000000000000ff, %asi = 80
	ldsha	[%i0+0x00e]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800040] = ffff98b0, %l7 = 00000000000000ff, %asi = 80
	lduha	[%o1+0x040]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[00000000300c1408] = f13b0c4f620f60ff, %f30 = 00000000 00000000
	ldda	[%i3+%o4]0x89,%f30	! %f30 = f13b0c4f 620f60ff
!	Mem[00000000100c1400] = 614661a1, %l2 = 0000000000000400
	lduha	[%i3+%g0]0x80,%l2	! %l2 = 0000000000006146
!	Mem[00000000201c0000] = 00006050, %l1 = 00000000000000ff
	ldsh	[%o0+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000010181400] = 60ff00ff00000000, %f24 = d9235a77 68be6524, %asi = 80
	ldda	[%i6+0x000]%asi,%f24	! %f24 = 60ff00ff 00000000
!	Mem[0000000010001430] = 57022049fe6c5d51, %l6 = 0000000000000000
	ldx	[%i0+0x030],%l6		! %l6 = 57022049fe6c5d51
!	%l2 = 0000000000006146, imm = 00000000000006d4, %l3 = 0000000000000042
	sub	%l2,0x6d4,%l3		! %l3 = 0000000000005a72

p0_label_83:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ff000000, Mem[0000000030081410] = 15d40000
	stba	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 15d40000
!	Mem[0000000010001413] = 00000400, %l2 = 0000000000006146
	ldstub	[%i0+0x013],%l2		! %l2 = 0000000000000000
!	Mem[00000000211c0000] = ec0aeee0, %l3 = 0000000000005a72
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ec
!	%l1 = 0000000000000000, Mem[0000000030141410] = 7a7bb2ff
	stha	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000b2ff
!	%f4  = 61460079, Mem[0000000030001410] = 5b08a382
	sta	%f4 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 61460079
!	%l4 = 0000000015000000, Mem[0000000010081410] = 28000000
	stwa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 15000000
!	%l6 = fe6c5d51, %l7 = 0000ffff, Mem[0000000010101428] = 1560e9ec 44134048, %asi = 80
	stda	%l6,[%i4+0x028]%asi	! Mem[0000000010101428] = fe6c5d51 0000ffff
!	%f11 = 04000000, Mem[0000000030101408] = 000032ff
	sta	%f11,[%i4+%o4]0x89	! Mem[0000000030101408] = 04000000
!	%f23 = 437c17fd, Mem[0000000030141408] = ff000000
	sta	%f23,[%i5+%o4]0x81	! Mem[0000000030141408] = 437c17fd
!	%l6 = 57022049fe6c5d51, Mem[0000000010001408] = 00001400
	stha	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00005d51

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 15d40000, %l7 = 000000000000ffff
	lduwa	[%i2+%o5]0x89,%l7	! %l7 = 0000000015d40000
!	Mem[0000000010141410] = 4234b2ff, %l1 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l1	! %l1 = ffffffffffffb2ff
!	Mem[0000000010181430] = 620f60ff, %f28 = 15d40000
	lda	[%i6+0x030]%asi,%f28	! %f28 = 620f60ff
!	Mem[0000000010041410] = ff225670, %l2 = 0000000000000000, %asi = 80
	lduha	[%i1+0x010]%asi,%l2	! %l2 = 000000000000ff22
!	Mem[000000001004142d] = 514a9963, %l0 = 00000000188d1814, %asi = 80
	lduba	[%i1+0x02d]%asi,%l0	! %l0 = 000000000000004a
!	Mem[0000000010141410] = ffb23442a1614661, %f16 = a1673442 a1614661
	ldda	[%i5+%o5]0x80,%f16	! %f16 = ffb23442 a1614661
!	Mem[0000000030101408] = 00000004, %l2 = 000000000000ff22
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000004
!	Mem[0000000010081410] = 00000015, %l7 = 0000000015d40000
	lduwa	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000015
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000030101400] = ff600f62 4f0c3bf1 00000004 04000000
!	Mem[0000000030101410] = 00000000 6769b6c1 5701b8ea 0b08bb13
!	Mem[0000000030101420] = 3fc0c6f8 55127029 6a9a81f6 1eb3486f
!	Mem[0000000030101430] = 7f771564 76e19165 29e528c2 2562a48b
	ldda	[%i4+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000030101400] = 620f60ff, %l6 = 57022049fe6c5d51
	ldsha	[%i4+%g0]0x89,%l6	! %l6 = 00000000000060ff

p0_label_85:
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffb2ff, Mem[0000000010181430] = 620f60ff
	sth	%l1,[%i6+0x030]		! Mem[0000000010181430] = b2ff60ff
!	%l3 = 00000000000000ec, Mem[0000000010181410] = 614600ff
	stwa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ec
!	Mem[0000000030081408] = ffffd657, %l5 = 00000000ff000000
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000057
!	%f23 = 0b08bb13, Mem[0000000030081400] = 614661a1
	sta	%f23,[%i2+%g0]0x89	! Mem[0000000030081400] = 0b08bb13
!	Mem[0000000030041408] = 00040000, %l3 = 00000000000000ec
	swapa	[%i1+%o4]0x81,%l3	! %l3 = 0000000000040000
!	Mem[0000000021800180] = 00ffda30, %l5 = 0000000000000057
	ldstuba	[%o3+0x180]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 000000ec, %l6 = 00000000000060ff
	swapa	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ec
!	%l2 = 0000000000000004, Mem[0000000010101408] = 0000000014188d18
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000004
!	%l0 = 000000000000004a, Mem[0000000010101420] = 3dee72c8ffffffff
	stx	%l0,[%i4+0x020]		! Mem[0000000010101420] = 000000000000004a
!	%l0 = 000000000000004a, Mem[0000000010041408] = ffb26015
	stha	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 004a6015

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 620f60ff, %l3 = 0000000000040000
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = 00000000620f60ff
!	Mem[0000000030081408] = ffffd6ff, %l2 = 0000000000000004
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101428] = fe6c5d51, %l6 = 00000000000000ec
	lduh	[%i4+0x028],%l6		! %l6 = 000000000000fe6c
!	Mem[0000000010101410] = 8d6b242f 7a7bb2ff, %l2 = 000000ff, %l3 = 620f60ff
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 000000008d6b242f 000000007a7bb2ff
!	Mem[0000000030101410] = 00000000, %l3 = 000000007a7bb2ff
	lduwa	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 8b5f2584ffffffff, %f0  = 00000000 00000000
	ldda	[%i0+%o4]0x81,%f0 	! %f0  = 8b5f2584 ffffffff
!	Mem[0000000010101400] = 00000015, %l2 = 000000008d6b242f
	lduba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = 2f246b8d, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l5	! %l5 = 000000002f246b8d
!	Mem[00000000300c1408] = ff600f624f0c3bf1, %f10 = 79ec7de9 04000000
	ldda	[%i3+%o4]0x81,%f10	! %f10 = ff600f62 4f0c3bf1
!	Mem[0000000010081400] = 000000ff, %l3 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = 00000000000000ff

p0_label_87:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = ff225670, %l6 = 000000000000fe6c
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff225670
!	Mem[0000000010181400] = 60ff00ff, %l5 = 000000002f246b8d
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000060
!	%l3 = 00000000000000ff, Mem[0000000030001410] = 79004661
	stha	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 790000ff
!	%f25 = 55127029, Mem[0000000030181400] = ff3467a1
	sta	%f25,[%i6+%g0]0x81	! Mem[0000000030181400] = 55127029
!	Mem[0000000010001400] = 23292800, %l3 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%l5 = 0000000000000060, Mem[0000000030001408] = 84255f8b
	stha	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 84250060
!	%l1 = ffffffffffffb2ff, Mem[0000000030141410] = ffb20000
	stha	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = ffb2b2ff
!	%l4 = 0000000015000000, Mem[0000000030181410] = 614600ff
	stha	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 61460000
!	%l1 = ffffffffffffb2ff, Mem[0000000030081408] = ffd6ffff
	stwa	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffb2ff
!	Mem[0000000010101410] = 8d6b242f, %l5 = 0000000000000060
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 000000008d6b242f

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = b8ef6729, %l0 = 000000000000004a
	lduw	[%i3+0x030],%l0		! %l0 = 00000000b8ef6729
!	Mem[0000000010041400] = a1673442 ffffffff, %l6 = ff225670, %l7 = 00000015
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000a1673442 00000000ffffffff
!	Mem[00000000100c1410] = bcd452ff, %l3 = 0000000000000000
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 00000000bcd452ff
!	Mem[0000000010181408] = 0000000000040000, %f10 = ff600f62 4f0c3bf1
	ldda	[%i6+%o4]0x88,%f10	! %f10 = 00000000 00040000
!	Mem[0000000030001410] = ff000079, %f1  = ffffffff
	lda	[%i0+%o5]0x81,%f1 	! %f1 = ff000079
!	Mem[0000000010081408] = 61000000, %l3 = 00000000bcd452ff
	lduwa	[%i2+%o4]0x80,%l3	! %l3 = 0000000061000000
!	Mem[0000000030001400] = ece9ffff, %l2 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030041408] = ec000000, %l7 = 00000000ffffffff
	lduba	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, %l3 = 0000000061000000, %l6 = 00000000a1673442
	sub	%l7,%l3,%l6		! %l6 = ffffffff9f000000
!	Mem[00000000300c1408] = f13b0c4f620f60ff, %f12 = e3b9d240 02fc54ec
	ldda	[%i3+%o4]0x89,%f12	! %f12 = f13b0c4f 620f60ff

p0_label_89:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000201c0000] = 00006050
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00006050
!	%f6  = 00140000 00000036, %l1 = ffffffffffffb2ff
!	Mem[0000000030181410] = 00004661212be96d
	add	%i6,0x010,%g1
	stda	%f6,[%g1+%l1]ASI_PST8_S ! Mem[0000000030181410] = 0014000000000036
!	%f4  = 61460079 212be96d, Mem[0000000010181408] = 00000400 00000000
	std	%f4 ,[%i6+%o4]		! Mem[0000000010181408] = 61460079 212be96d
	membar	#Sync			! Added by membar checker (19)
!	%l4 = 0000000015000000, Mem[0000000030101400] = 620f60ff
	stwa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 15000000
!	%f7  = 00000036, Mem[0000000030041400] = 000000ff
	sta	%f7 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000036
!	%l0 = 00000000b8ef6729, Mem[0000000010001410] = ff040000
	stha	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = ff046729
!	%l4 = 15000000, %l5 = 8d6b242f, Mem[0000000030001408] = 84250060 ffffffff
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 15000000 8d6b242f
!	Mem[0000000010081408] = 00000061, %l5 = 000000008d6b242f
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000061
!	Mem[0000000010081427] = 981ac93c, %l1 = ffffffffffffb2ff
	ldstub	[%i2+0x027],%l1		! %l1 = 000000000000003c
!	%f4  = 61460079 212be96d, %l3 = 0000000061000000
!	Mem[00000000300c1400] = 000000ff0000ff0a
	stda	%f4,[%i3+%l3]ASI_PST8_SL ! Mem[00000000300c1400] = 000000ff0000ff0a

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[000000001000140c] = 00000000, %f10 = 00000000
	lda	[%i0+0x00c]%asi,%f10	! %f10 = 00000000
!	Mem[0000000030081408] = ffb2ffff, %f28 = 7f771564
	lda	[%i2+%o4]0x89,%f28	! %f28 = ffb2ffff
!	Mem[0000000010081400] = ff000000, %f29 = 76e19165
	lda	[%i2+%g0]0x88,%f29	! %f29 = ff000000
!	Mem[0000000010101410] = 00000060, %l0 = 00000000b8ef6729
	ldsba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 13bb080b 00000000 ffffb2ff ffffffa0
!	Mem[0000000030081410] = 0000d415 212be96d 64b37baa 095abad3
!	Mem[0000000030081420] = 7a7bb2ff a1614661 79ec7d42 04000000
!	Mem[0000000030081430] = e3b9d240 02fc54ec 5b08a382 42ec7c4b
	ldda	[%i2+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	Mem[0000000021800140] = 32ff2000, %l7 = 0000000000000000, %asi = 80
	lduha	[%o3+0x140]%asi,%l7	! %l7 = 00000000000032ff
!	Mem[00000000211c0001] = ff0aeee0, %l7 = 00000000000032ff
	ldub	[%o2+0x001],%l7		! %l7 = 000000000000000a
!	Mem[0000000030181410] = 36000000 00001400, %l6 = 9f000000, %l7 = 0000000a
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 0000000000001400 0000000036000000
!	Mem[0000000010141400] = 6de92b2179004661, %f4  = 61460079 212be96d
	ldda	[%i5+%g0]0x80,%f4 	! %f4  = 6de92b21 79004661
!	Mem[0000000010101410] = 00000060, %l2 = 000000000000ffff
	lduba	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000

p0_label_91:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000061, Mem[0000000010141400] = 212be96d
	stwa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000061
!	%l2 = 0000000000000000, Mem[0000000030001410] = ff000079
	stwa	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	Mem[00000000300c1400] = ff000000, %l4 = 0000000015000000
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 00000000ff000000
!	%f8  = 7a7bb2ff a1614661, %l6 = 0000000000001400
!	Mem[0000000030181430] = 545f9a240f6e0b25
	add	%i6,0x030,%g1
	stda	%f8,[%g1+%l6]ASI_PST8_S ! Mem[0000000030181430] = 545f9a240f6e0b25
!	%l1 = 000000000000003c, Mem[0000000030001408] = 000000152f246b8d
	stxa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000000000003c
	membar	#Sync			! Added by membar checker (20)
!	%l5 = 0000000000000061, Mem[0000000030081400] = 13bb080b00000000
	stxa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000000000061
!	%l5 = 0000000000000061, Mem[0000000010101410] = 60000000
	stha	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 60000061
!	Mem[0000000030081410] = 0000d415, %l5 = 0000000000000061
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 000000000000d415
!	%f10 = 00000000 00040000, %l1 = 000000000000003c
!	Mem[0000000030001400] = ffffe9ecffffffff
	stda	%f10,[%i0+%l1]ASI_PST8_SL ! Mem[0000000030001400] = ffff04000000ffff
!	Mem[00000000100c1400] = 614661a1, %l6 = 0000000000001400
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 00000000614661a1

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 61000060, %l0 = 0000000000000000
	ldswa	[%i4+%o5]0x80,%l0	! %l0 = 0000000061000060
!	Mem[0000000030041410] = 00000000, %l7 = 0000000036000000
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 00000015 000000ff, %l2 = 00000000, %l3 = 61000000
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000015 00000000000000ff
!	%l4 = 00000000ff000000, immd = 000000000000080f, %l108 = 0000000000000005
	udivx	%l4,0x80f,%l5		! %l5 = 00000000001fa4ab
!	Mem[0000000010181400] = ffff00ff 00000000 61460079 212be96d
!	Mem[0000000010181410] = ff600000 212be96d 00000000 57d6ffff
!	Mem[0000000010181420] = 2967efb8 00000057 79ec7de9 04000000
!	Mem[0000000010181430] = b2ff60ff 10be00ff 5b08a382 42ec7c4b
	ldda	[%i6+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[0000000010141410] = 4234b2ff, %l6 = 00000000614661a1
	ldsba	[%i5+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = ff0aeee0, %l6 = ffffffffffffffff, %asi = 80
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000ff0a
!	Mem[0000000030141410] = ffb2b2ff a1614661, %l2 = 00000015, %l3 = 000000ff
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 00000000ffb2b2ff 00000000a1614661
!	Mem[0000000030181408] = 00000036, %l0 = 0000000061000060
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 0aff0000ff000000, %f4  = 6de92b21 79004661
	ldda	[%i2+%g0]0x88,%f4 	! %f4  = 0aff0000 ff000000

p0_label_93:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030101410] = 00000000
	stba	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[0000000030141410] = ffb2b2ff, %l3 = 00000000a1614661
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 00000000ffb2b2ff
!	%l5 = 00000000001fa4ab, Mem[0000000030081408] = ffffb2ffffffffa0
	stxa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000001fa4ab
!	%f12 = f13b0c4f, Mem[0000000030081408] = 00000000
	sta	%f12,[%i2+%o4]0x89	! Mem[0000000030081408] = f13b0c4f
!	%l5 = 00000000001fa4ab, Mem[0000000030081408] = f13b0c4f
	stba	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = f13b0cab
!	Mem[00000000100c1400] = 00001400, %l6 = 000000000000ff0a
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%f21 = 212be96d, Mem[000000001010140c] = 00000000
	st	%f21,[%i4+0x00c]	! Mem[000000001010140c] = 212be96d
!	Mem[00000000201c0001] = 00006050, %l2 = 00000000ffb2b2ff
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = ff046729, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000ff046729
!	Mem[0000000021800141] = 32ff2000, %l3 = 00000000ffb2b2ff
	ldsb	[%o3+0x141],%l3		! %l3 = ffffffffffffffff

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l5 = 00000000001fa4ab
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101428] = fe6c5d51, %f1  = ff000079
	lda	[%i4+0x028]%asi,%f1 	! %f1 = fe6c5d51
!	Mem[0000000010101400] = 15000000, %l0 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800040] = 11920f40, %l2 = 0000000000000000
	ldub	[%o3+0x040],%l2		! %l2 = 0000000000000011
!	Mem[0000000010181400] = ff00ffff, %l7 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010081408] = 000000ff, %f15 = 42ec7c4b
	lda	[%i2+%o4]0x88,%f15	! %f15 = 000000ff
!	Mem[0000000020800001] = ffcdbe80, %l2 = 0000000000000011
	ldstuba	[%o1+0x001]%asi,%l2	! %l2 = 00000000000000cd
!	Mem[0000000030141400] = ff00be10, %l1 = 000000000000003c
	ldsba	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000010
!	Mem[0000000010101408] = 04000000212be96d, %l3 = ffffffffffffffff, %asi = 80
	ldxa	[%i4+0x008]%asi,%l3	! %l3 = 04000000212be96d
!	Mem[0000000030041400] = 00000036, %l5 = 0000000000000000
	lduwa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000036

p0_label_95:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000036, Mem[0000000030101408] = 04000000
	stba	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 04000036
!	%l4 = 00000000ff000000, Mem[0000000030181400] = 29701255
	stha	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 29700000
!	%l4 = 00000000ff000000, Mem[0000000030081408] = ab0c3bf1
	stha	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00003bf1
	membar	#Sync			! Added by membar checker (21)
!	%f31 = 42ec7c4b, Mem[0000000010181410] = ff600000
	st	%f31,[%i6+%o5]		! Mem[0000000010181410] = 42ec7c4b
!	%l2 = 00000000000000cd, Mem[0000000030041400] = 36000000
	stwa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000cd
!	%f7  = 00000036, Mem[00000000300c1400] = 00000015
	sta	%f7 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000036
!	Mem[0000000030041400] = 000000cd, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = 15000000, %l4 = 00000000ff000000, %asi = 80
	swapa	[%i2+0x010]%asi,%l4	! %l4 = 0000000015000000
!	%l1 = 0000000000000010, Mem[0000000030081408] = 00003bf1
	stha	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 00103bf1
!	Mem[0000000030101400] = 15000000, %l5 = 0000000000000036
	ldstuba	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffb27b7a 60000061, %l4 = 15000000, %l5 = 00000000
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 0000000060000061 00000000ffb27b7a
!	Mem[0000000010181430] = b2ff60ff10be00ff, %l1 = 0000000000000010
	ldx	[%i6+0x030],%l1		! %l1 = b2ff60ff10be00ff
!	Mem[0000000030041400] = 02fc541ecd0000ff, %l4 = 0000000060000061
	ldxa	[%i1+%g0]0x89,%l4	! %l4 = 02fc541ecd0000ff
!	Mem[0000000030181410] = 00140000, %f3  = ffffffa0
	lda	[%i6+%o5]0x81,%f3 	! %f3 = 00140000
!	Mem[0000000010181408] = 61460079, %f22 = 00000000
	lda	[%i6+%o4]0x80,%f22	! %f22 = 61460079
!	Mem[0000000021800140] = 32ff2000, %l5 = 00000000ffb27b7a
	ldsh	[%o3+0x140],%l5		! %l5 = 00000000000032ff
!	Mem[0000000010081400] = 000000ff, %l1 = b2ff60ff10be00ff
	ldsba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[000000001008141e] = 8a7f2955, %l3 = 04000000212be96d, %asi = 80
	lduha	[%i2+0x01e]%asi,%l3	! %l3 = 0000000000002955
!	Mem[0000000030101400] = ff0000154f0c3bf1, %f0  = 8b5f2584 fe6c5d51
	ldda	[%i4+%g0]0x81,%f0 	! %f0  = ff000015 4f0c3bf1
!	Mem[00000000300c1408] = 620f60ff, %l6 = 00000000ff046729
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = ffffffffffffffff

p0_label_97:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 00001400, %l5 = 00000000000032ff
	swapa	[%i6+%o5]0x89,%l5	! %l5 = 0000000000001400
!	Mem[0000000010001400] = ff282923, %l1 = 0000000000000000, %asi = 80
	swapa	[%i0+0x000]%asi,%l1	! %l1 = 00000000ff282923
!	Mem[000000001018140c] = 212be96d, %l5 = 0000000000001400
	ldstub	[%i6+0x00c],%l5		! %l5 = 0000000000000021
!	Mem[0000000010101410] = 61000060, %l1 = 00000000ff282923
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 0000000061000060
!	%l3 = 0000000000002955, Mem[0000000010141410] = 614661a14234b2ff
	stxa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000002955
!	%l6 = ffffffff, %l7 = 0000ffff, Mem[0000000030181408] = 00000036 ffffffa0
	stda	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff 0000ffff
!	%l6 = ffffffffffffffff, Mem[0000000010081428] = 8f4ae761968a047d
	stx	%l6,[%i2+0x028]		! Mem[0000000010081428] = ffffffffffffffff
!	%f24 = 2967efb8 00000057, Mem[0000000010181410] = 4b7cec42 6de92b21
	stda	%f24,[%i6+%o5]0x88	! Mem[0000000010181410] = 2967efb8 00000057
!	%l1 = 0000000061000060, Mem[0000000010141408] = 800000009280ffff
	stxa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000061000060
!	%f14 = 5b08a382 000000ff, %l1 = 0000000061000060
!	Mem[0000000010141418] = 00000000000000ff
	add	%i5,0x018,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_P ! Mem[0000000010141418] = 00000000000000ff

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %f17 = 00000000
	lda	[%i0+%o4]0x81,%f17	! %f17 = 00000000
!	Mem[0000000010081408] = 000000ff, %l4 = 02fc541ecd0000ff
	lduha	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001400] = 00000000, %l1 = 0000000061000060
	ldsha	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101418] = ff0000ff, %l6 = ffffffffffffffff
	ldsw	[%i4+0x018],%l6		! %l6 = ffffffffff0000ff
!	Mem[0000000010001400] = 00000000, %l6 = ffffffffff0000ff
	ldsba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%l4 = 00000000000000ff, imm = fffffffffffff37c, %l1 = 0000000000000000
	xnor	%l4,-0xc84,%l1		! %l1 = 0000000000000c7c
!	Mem[0000000010001400] = 00000000, %l1 = 0000000000000c7c
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l7 = 000000000000ffff
	ldsha	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 00ff6050, %l2 = 00000000000000cd, %asi = 80
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000021, imm = fffffffffffffb5e, %l6 = 0000000000000000
	xnor	%l5,-0x4a2,%l6		! %l6 = 0000000000000480

p0_label_99:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 000000ff, %l6 = 0000000000000480
	ldstuba	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041410] = 6cfe0000, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 000000006cfe0000
!	%l3 = 0000000000002955, Mem[0000000010081400] = 0aff0000ff000000
	stxa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000002955
!	%l6 = 00000000000000ff, Mem[0000000030141408] = 437c17fd
	stha	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ff17fd
!	Mem[00000000100c1410] = ff52d4bcd947ff20, %l0 = 000000006cfe0000, %l5 = 0000000000000021
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = ff52d4bcd947ff20
!	%f2  = 57d6ffff, Mem[0000000030181408] = ffffffff
	sta	%f2 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 57d6ffff
!	Mem[0000000010041410] = 00000000, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0001] = 00ff6050, %l6 = 00000000000000ff
	ldstub	[%o0+0x001],%l6		! %l6 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010181400] = ffff00ff 00000000
	stda	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff 00000000
!	%f4  = 0aff0000 ff000000, Mem[0000000010081410] = ff000000 fd030000
	stda	%f4 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 0aff0000 ff000000

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00007029, %l6 = 00000000000000ff
	ldswa	[%i6+%g0]0x81,%l6	! %l6 = 0000000000007029
!	Mem[0000000030001408] = 3c00000000000000, %f10 = 00000000 00040000
	ldda	[%i0+%o4]0x89,%f10	! %f10 = 3c000000 00000000
!	Mem[00000000100c1410] = ff52d4bcd947ff20, %f30 = 5b08a382 42ec7c4b
	ldda	[%i3+%o5]0x80,%f30	! %f30 = ff52d4bc d947ff20
!	Mem[0000000010141408] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = 150000ff, %l2 = 00000000000000ff
	ldsha	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %f10 = 3c000000
	lda	[%i4+%o5]0x89,%f10	! %f10 = 00000000
!	Mem[0000000010001433] = 57022049, %l1 = 0000000000000000
	ldub	[%i0+0x033],%l1		! %l1 = 0000000000000049
!	%l0 = 000000006cfe0000, %l6 = 0000000000007029, %l5 = ff52d4bcd947ff20
	add	%l0,%l6,%l5		! %l5 = 000000006cfe7029
!	Mem[0000000030141408] = 51764a34fd17ff00, %f12 = f13b0c4f 620f60ff
	ldda	[%i5+%o4]0x89,%f12	! %f12 = 51764a34 fd17ff00
!	Mem[0000000030141410] = a1614661, %f28 = b2ff60ff
	lda	[%i5+%o5]0x81,%f28	! %f28 = a1614661

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000006cfe0000
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000049
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000000000ff
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000002955
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000006cfe7029
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000007029
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
	cmp	%l0,%l1			! %f0  should be ff000015 4f0c3bf1
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 57d6ffff 00140000
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 0aff0000 ff000000
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00140000 00000036
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 7a7bb2ff a1614661
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 51764a34 fd17ff00
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 5b08a382 000000ff
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ffff00ff 00000000
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 61460079 212be96d
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ff600000 212be96d
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 61460079 57d6ffff
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 2967efb8 00000057
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 79ec7de9 04000000
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be a1614661 10be00ff
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be ff52d4bc d947ff20
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
	ldx	[%g1+0x000],%l0		! %l0 = 47701fb4c72330de
	ldx	[%g1+0x008],%l1		! %l1 = 86b7c68342346789
	ldx	[%g1+0x010],%l2		! %l2 = f991b1f311c57a44
	ldx	[%g1+0x018],%l3		! %l3 = 6c405a3df00cec0f
	ldx	[%g1+0x020],%l4		! %l4 = 030c90a5a5f5cfea
	ldx	[%g1+0x028],%l5		! %l5 = fd30dd24543ac8d5
	ldx	[%g1+0x030],%l6		! %l6 = ed7c69b4cd9109d0
	ldx	[%g1+0x038],%l7		! %l7 = 7c59f5d774e355db

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
	sub	%l3,%l7,%l2
	jmpl	%o7,%g0
	addc	%l0,-0x2f9,%l3
p0_near_0_he:
	fsubs	%f29,%f23,%f22
	xor	%l4,-0xf8c,%l3
	smul	%l6,%l3,%l6
	andn	%l0,-0xf5a,%l6
	smul	%l3,-0x662,%l3
	xnor	%l2,0x8ec,%l6
	fdivs	%f19,%f20,%f17
	jmpl	%o7,%g0
	umul	%l1,-0xa75,%l2
p0_near_0_lo:
	sub	%l3,%l7,%l2
	jmpl	%o7,%g0
	addc	%l0,-0x2f9,%l3
p0_near_0_ho:
	fsubs	%f29,%f23,%f22
	xor	%l4,-0xf8c,%l3
	smul	%l6,%l3,%l6
	andn	%l0,-0xf5a,%l6
	smul	%l3,-0x662,%l3
	xnor	%l2,0x8ec,%l6
	fdivs	%f19,%f20,%f17
	jmpl	%o7,%g0
	umul	%l1,-0xa75,%l2
near0_b2b_h:
	xor	%l2,-0x9ec,%l6
	fdivs	%f23,%f23,%f16
	sdivx	%l0,%l4,%l0
	jmpl	%o7,%g0
	umul	%l0,-0x419,%l0
near0_b2b_l:
	fsubs	%f12,%f15,%f15
	sub	%l1,0x289,%l6
	orn	%l4,0xf90,%l1
	jmpl	%o7,%g0
	sdivx	%l5,0xa0f,%l5
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
	andn	%l5,%l4,%l3
	xnor	%l0,%l7,%l7
	fmuls	%f8 ,%f1 ,%f3 
	and	%l7,0x40e,%l2
	orn	%l7,-0x46e,%l4
	jmpl	%o7,%g0
	add	%l7,0x650,%l7
p0_near_1_he:
	or	%l0,%l3,%l4
	sdivx	%l2,%l3,%l4
	umul	%l5,0x25d,%l5
	addc	%l2,0x435,%l3
	sub	%l3,0xdbc,%l7
	jmpl	%o7,%g0
	ldstub	[%o3+0x1c1],%l0		! Mem[00000000218001c1]
p0_near_1_lo:
	andn	%l5,%l4,%l3
	xnor	%l0,%l7,%l7
	fmuls	%f8 ,%f1 ,%f3 
	and	%l7,0x40e,%l2
	orn	%l7,-0x46e,%l4
	jmpl	%o7,%g0
	add	%l7,0x650,%l7
p0_near_1_ho:
	or	%l0,%l3,%l4
	sdivx	%l2,%l3,%l4
	umul	%l5,0x25d,%l5
	addc	%l2,0x435,%l3
	sub	%l3,0xdbc,%l7
	jmpl	%o7,%g0
	ldstub	[%i3+0x1c1],%l0		! Mem[00000000218001c1]
near1_b2b_h:
	and	%l6,-0x310,%l5
	fmuls	%f18,%f22,%f21
	smul	%l6,-0x2a6,%l3
	fmuls	%f25,%f22,%f26
	fadds	%f23,%f28,%f26
	udivx	%l5,0x6cb,%l1
	umul	%l2,%l5,%l3
	jmpl	%o7,%g0
	subc	%l5,-0x69f,%l4
near1_b2b_l:
	sdivx	%l4,%l2,%l6
	fdivs	%f6 ,%f1 ,%f1 
	fadds	%f15,%f12,%f5 
	and	%l0,0x7cb,%l7
	fcmps	%fcc1,%f6 ,%f10
	umul	%l4,%l2,%l4
	orn	%l3,%l1,%l2
	jmpl	%o7,%g0
	udivx	%l2,0x454,%l5
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
	andn	%l0,0xb26,%l4
	addc	%l2,0xb36,%l0
	orn	%l0,%l2,%l1
	jmpl	%o7,%g0
	fadds	%f5 ,%f5 ,%f3 
p0_near_2_he:
	sdivx	%l0,%l7,%l0
	fcmps	%fcc0,%f31,%f29
	addc	%l7,0x4d6,%l2
	xnor	%l6,0x78a,%l5
	jmpl	%o7,%g0
	or	%l7,0x47a,%l6
p0_near_2_lo:
	andn	%l0,0xb26,%l4
	addc	%l2,0xb36,%l0
	orn	%l0,%l2,%l1
	jmpl	%o7,%g0
	fadds	%f5 ,%f5 ,%f3 
p0_near_2_ho:
	sdivx	%l0,%l7,%l0
	fcmps	%fcc0,%f31,%f29
	addc	%l7,0x4d6,%l2
	xnor	%l6,0x78a,%l5
	jmpl	%o7,%g0
	or	%l7,0x47a,%l6
near2_b2b_h:
	sdivx	%l6,0x02a,%l2
	fcmps	%fcc3,%f30,%f27
	fmuls	%f28,%f25,%f26
	jmpl	%o7,%g0
	add	%l5,0xca2,%l5
near2_b2b_l:
	fadds	%f6 ,%f4 ,%f15
	fmuls	%f2 ,%f8 ,%f13
	umul	%l4,0xa34,%l4
	jmpl	%o7,%g0
	smul	%l7,0xb86,%l5
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
	and	%l6,0x2df,%l3
	sub	%l5,0x88e,%l1
	fsubs	%f12,%f7 ,%f5 
	jmpl	%o7,%g0
	smul	%l5,%l6,%l3
p0_near_3_he:
	mulx	%l6,%l3,%l4
	jmpl	%o7,%g0
	and	%l1,%l1,%l2
p0_near_3_lo:
	and	%l6,0x2df,%l3
	sub	%l5,0x88e,%l1
	fsubs	%f12,%f7 ,%f5 
	jmpl	%o7,%g0
	smul	%l5,%l6,%l3
p0_near_3_ho:
	mulx	%l6,%l3,%l4
	jmpl	%o7,%g0
	and	%l1,%l1,%l2
near3_b2b_h:
	addc	%l0,%l1,%l5
	subc	%l0,0xda9,%l0
	jmpl	%o7,%g0
	fcmps	%fcc2,%f16,%f26
near3_b2b_l:
	and	%l7,0x2ec,%l5
	fdivs	%f0 ,%f14,%f15
	jmpl	%o7,%g0
	andn	%l3,-0x4ab,%l5
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
	jmpl	%o7,%g0
	sub	%l1,0xd38,%l2
	jmpl	%o7,%g0
	nop
p0_far_0_he:
	fdivs	%f31,%f20,%f25
	xnor	%l0,-0xe3a,%l6
	or	%l4,%l7,%l6
	jmpl	%o7,%g0
	subc	%l3,-0xa97,%l0
p0_far_0_lo:
	jmpl	%o7,%g0
	sub	%l1,0xd38,%l2
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
p0_far_0_ho:
	fdivs	%f31,%f20,%f25
	xnor	%l0,-0xe3a,%l6
	or	%l4,%l7,%l6
	jmpl	%o7,%g0
	subc	%l3,-0xa97,%l0
far0_b2b_h:
	fsqrts	%f20,%f18
	subc	%l5,%l2,%l2
	sdivx	%l2,0xafc,%l7
	jmpl	%o7,%g0
	fcmps	%fcc0,%f21,%f18
far0_b2b_l:
	umul	%l3,%l5,%l7
	umul	%l0,%l6,%l7
	orn	%l4,%l3,%l2
	jmpl	%o7,%g0
	sub	%l2,%l1,%l2
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
	fsubs	%f6 ,%f0 ,%f4 
	mulx	%l2,%l4,%l2
	fsqrts	%f2 ,%f1 
	fsubs	%f8 ,%f3 ,%f0 
	udivx	%l4,0xc94,%l2
	sdivx	%l4,%l4,%l0
	smul	%l7,-0xa8e,%l7
	jmpl	%o7,%g0
	sub	%l4,%l0,%l4
p0_far_1_he:
	umul	%l4,-0xe16,%l4
	xor	%l2,-0xc87,%l1
	xor	%l2,%l7,%l2
	sub	%l2,0x33e,%l4
	jmpl	%o7,%g0
	fsqrts	%f16,%f18
p0_far_1_lo:
	fsubs	%f6 ,%f0 ,%f4 
	mulx	%l2,%l4,%l2
	fsqrts	%f2 ,%f1 
	fsubs	%f8 ,%f3 ,%f0 
	udivx	%l4,0xc94,%l2
	sdivx	%l4,%l4,%l0
	smul	%l7,-0xa8e,%l7
	jmpl	%o7,%g0
	sub	%l4,%l0,%l4
p0_far_1_ho:
	umul	%l4,-0xe16,%l4
	xor	%l2,-0xc87,%l1
	xor	%l2,%l7,%l2
	sub	%l2,0x33e,%l4
	jmpl	%o7,%g0
	fsqrts	%f16,%f18
far1_b2b_h:
	sdivx	%l3,%l3,%l4
	sdivx	%l0,0x892,%l0
	jmpl	%o7,%g0
	or	%l1,%l3,%l6
far1_b2b_l:
	or	%l1,0xda9,%l1
	fcmps	%fcc3,%f4 ,%f3 
	jmpl	%o7,%g0
	add	%l3,%l6,%l1
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
	sdivx	%l5,%l1,%l4
	fsubs	%f9 ,%f3 ,%f12
	fcmps	%fcc0,%f10,%f1 
	fsubs	%f3 ,%f12,%f11
	smul	%l0,-0x3d6,%l1
	jmpl	%o7,%g0
	fsqrts	%f3 ,%f12
p0_far_2_he:
	and	%l0,0xb32,%l1
	ldsh	[%i2+0x022],%l2		! Mem[0000000010081422]
	fdivs	%f29,%f20,%f23
	fmuls	%f18,%f29,%f19
	jmpl	%o7,%g0
	mulx	%l5,%l4,%l7
p0_far_2_lo:
	sdivx	%l5,%l1,%l4
	fsubs	%f9 ,%f3 ,%f12
	fcmps	%fcc0,%f10,%f1 
	fsubs	%f3 ,%f12,%f11
	smul	%l0,-0x3d6,%l1
	jmpl	%o7,%g0
	fsqrts	%f3 ,%f12
p0_far_2_ho:
	and	%l0,0xb32,%l1
	ldsh	[%o2+0x022],%l2		! Mem[0000000010081422]
	fdivs	%f29,%f20,%f23
	fmuls	%f18,%f29,%f19
	jmpl	%o7,%g0
	mulx	%l5,%l4,%l7
far2_b2b_h:
	jmpl	%o7,%g0
	orn	%l1,-0x286,%l0
	jmpl	%o7,%g0
	nop
far2_b2b_l:
	jmpl	%o7,%g0
	fmuls	%f6 ,%f14,%f11
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
	orn	%l0,0xd1f,%l6
	and	%l6,%l2,%l6
	fmuls	%f14,%f3 ,%f10
	fmuls	%f0 ,%f7 ,%f15
	addc	%l4,-0xf2b,%l6
	xnor	%l2,0xa5b,%l4
	jmpl	%o7,%g0
	ldstub	[%i5+0x038],%l6		! Mem[0000000010141438]
p0_far_3_he:
	jmpl	%o7,%g0
	fsqrts	%f28,%f18
	jmpl	%o7,%g0
	nop
p0_far_3_lo:
	orn	%l0,0xd1f,%l6
	and	%l6,%l2,%l6
	fmuls	%f14,%f3 ,%f10
	fmuls	%f0 ,%f7 ,%f15
	addc	%l4,-0xf2b,%l6
	xnor	%l2,0xa5b,%l4
	jmpl	%o7,%g0
	ldstub	[%o5+0x038],%l6		! Mem[0000000010141438]
p0_far_3_ho:
	jmpl	%o7,%g0
	fsqrts	%f28,%f18
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far3_b2b_h:
	add	%l3,0xb8a,%l4
	add	%l0,%l7,%l0
	jmpl	%o7,%g0
	fsubs	%f30,%f18,%f16
far3_b2b_l:
	xor	%l7,-0x434,%l1
	andn	%l7,-0x62b,%l4
	jmpl	%o7,%g0
	andn	%l0,0xd72,%l6
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	std	%f12,[%i5+0x020]	! Mem[0000000010141420]
	jmpl	%g6+8,%g0
	addc	%l1,%l4,%l0
p0_call_0_le:
	fdivs	%f11,%f14,%f12
	retl
	fsubs	%f13,%f1 ,%f3 
p0_jmpl_0_lo:
	std	%f12,[%o5+0x020]	! Mem[0000000010141420]
	jmpl	%g6+8,%g0
	addc	%l1,%l4,%l0
p0_call_0_lo:
	fdivs	%f11,%f14,%f12
	retl
	fsubs	%f13,%f1 ,%f3 
p0_jmpl_0_he:
	jmpl	%g6+8,%g0
	udivx	%l7,0x705,%l2
p0_call_0_he:
	xnor	%l0,0x85e,%l0
	xor	%l3,%l3,%l5
	fstod	%f18,%f18
	sub	%l1,%l2,%l5
	sub	%l3,%l0,%l0
	xnor	%l5,%l2,%l2
	fsubs	%f17,%f17,%f24
	retl
	fsqrts	%f22,%f31
p0_jmpl_0_ho:
	jmpl	%g6+8,%g0
	udivx	%l7,0x705,%l2
p0_call_0_ho:
	xnor	%l0,0x85e,%l0
	xor	%l3,%l3,%l5
	fstod	%f18,%f18
	sub	%l1,%l2,%l5
	sub	%l3,%l0,%l0
	xnor	%l5,%l2,%l2
	fsubs	%f17,%f17,%f24
	retl
	fsqrts	%f22,%f31
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	jmpl	%g6+8,%g0
	addc	%l7,%l7,%l2
p0_call_1_le:
	mulx	%l5,-0x51c,%l7
	and	%l6,%l7,%l7
	retl
	ldd	[%i3+0x020],%l2		! Mem[00000000100c1420]
p0_jmpl_1_lo:
	jmpl	%g6+8,%g0
	addc	%l7,%l7,%l2
p0_call_1_lo:
	mulx	%l5,-0x51c,%l7
	and	%l6,%l7,%l7
	retl
	ldd	[%o3+0x020],%l2		! Mem[00000000100c1420]
p0_jmpl_1_he:
	jmpl	%g6+8,%g0
	orn	%l4,0xa1b,%l3
p0_call_1_he:
	orn	%l3,0x273,%l6
	xor	%l5,-0xdcf,%l4
	retl
	xnor	%l4,-0x664,%l0
p0_jmpl_1_ho:
	jmpl	%g6+8,%g0
	orn	%l4,0xa1b,%l3
p0_call_1_ho:
	orn	%l3,0x273,%l6
	xor	%l5,-0xdcf,%l4
	retl
	xnor	%l4,-0x664,%l0
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	fadds	%f8 ,%f9 ,%f14
	addc	%l6,%l4,%l3
	add	%l7,0x231,%l5
	jmpl	%g6+8,%g0
	fsubs	%f11,%f1 ,%f0 
p0_call_2_le:
	addc	%l7,0xaa4,%l0
	retl
	fcmps	%fcc1,%f15,%f0 
p0_jmpl_2_lo:
	fadds	%f8 ,%f9 ,%f14
	addc	%l6,%l4,%l3
	add	%l7,0x231,%l5
	jmpl	%g6+8,%g0
	fsubs	%f11,%f1 ,%f0 
p0_call_2_lo:
	addc	%l7,0xaa4,%l0
	retl
	fcmps	%fcc1,%f15,%f0 
p0_jmpl_2_he:
	xnor	%l7,-0x46f,%l0
	jmpl	%g6+8,%g0
	xor	%l3,%l0,%l3
p0_call_2_he:
	sub	%l0,0x63b,%l7
	fmuls	%f20,%f22,%f18
	umul	%l6,-0xa8a,%l2
	umul	%l5,0xcb8,%l0
	retl
	fmuls	%f21,%f20,%f16
p0_jmpl_2_ho:
	xnor	%l7,-0x46f,%l0
	jmpl	%g6+8,%g0
	xor	%l3,%l0,%l3
p0_call_2_ho:
	sub	%l0,0x63b,%l7
	fmuls	%f20,%f22,%f18
	umul	%l6,-0xa8a,%l2
	umul	%l5,0xcb8,%l0
	retl
	fmuls	%f21,%f20,%f16
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	udivx	%l7,%l2,%l4
	fdivs	%f8 ,%f12,%f9 
	fsubs	%f4 ,%f11,%f6 
	mulx	%l2,%l7,%l0
	smul	%l1,0xcbd,%l5
	xor	%l6,%l4,%l0
	add	%l6,%l0,%l7
	jmpl	%g6+8,%g0
	umul	%l4,-0xb5a,%l6
p0_call_3_le:
	and	%l5,0x850,%l5
	retl
	andn	%l5,0x98b,%l6
p0_jmpl_3_lo:
	udivx	%l7,%l2,%l4
	fdivs	%f8 ,%f12,%f9 
	fsubs	%f4 ,%f11,%f6 
	mulx	%l2,%l7,%l0
	smul	%l1,0xcbd,%l5
	xor	%l6,%l4,%l0
	add	%l6,%l0,%l7
	jmpl	%g6+8,%g0
	umul	%l4,-0xb5a,%l6
p0_call_3_lo:
	and	%l5,0x850,%l5
	retl
	andn	%l5,0x98b,%l6
p0_jmpl_3_he:
	add	%l2,%l5,%l0
	smul	%l1,0x040,%l2
	fadds	%f28,%f20,%f22
	jmpl	%g6+8,%g0
	fmuls	%f22,%f19,%f23
p0_call_3_he:
	sub	%l7,0x200,%l2
	fcmps	%fcc1,%f30,%f29
	sdivx	%l6,%l7,%l5
	retl
	sub	%l7,%l3,%l7
p0_jmpl_3_ho:
	add	%l2,%l5,%l0
	smul	%l1,0x040,%l2
	fadds	%f28,%f20,%f22
	jmpl	%g6+8,%g0
	fmuls	%f22,%f19,%f23
p0_call_3_ho:
	sub	%l7,0x200,%l2
	fcmps	%fcc1,%f30,%f29
	sdivx	%l6,%l7,%l5
	retl
	sub	%l7,%l3,%l7
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
	.word	0x47701fb4,0xc72330de		! Init value for %l0
	.word	0x86b7c683,0x42346789		! Init value for %l1
	.word	0xf991b1f3,0x11c57a44		! Init value for %l2
	.word	0x6c405a3d,0xf00cec0f		! Init value for %l3
	.word	0x030c90a5,0xa5f5cfea		! Init value for %l4
	.word	0xfd30dd24,0x543ac8d5		! Init value for %l5
	.word	0xed7c69b4,0xcd9109d0		! Init value for %l6
	.word	0x7c59f5d7,0x74e355db		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x4a8f94f0,0x0c08eb41		! Init value for %f0 
	.word	0x36fb41ae,0x65f1d647		! Init value for %f2 
	.word	0x5834e4dc,0x437c17fd		! Init value for %f4 
	.word	0x651c95fa,0x40d2b9e3		! Init value for %f6 
	.word	0x777d4888,0x6ee6b179		! Init value for %f8 
	.word	0x0c2cac06,0x2da3403f		! Init value for %f10
	.word	0x38320bf4,0x16ad53b5		! Init value for %f12
	.word	0x596c2fd2,0x3a45e55b		! Init value for %f14
	.word	0x1eee3b20,0x16a75ab1		! Init value for %f16
	.word	0x190b8d5e,0x5ef5e537		! Init value for %f18
	.word	0x02caa20c,0x099ae26d		! Init value for %f20
	.word	0x1636f0aa,0x66a33bd3		! Init value for %f22
	.word	0x6ac9ccb8,0x5d78c6e9		! Init value for %f24
	.word	0x08e245b6,0x160ea52f		! Init value for %f26
	.word	0x77040724,0x6c58a425		! Init value for %f28
	.word	0x7d553882,0x4da59d4b		! Init value for %f30
	.word	0x21935d50,0x3634d621		! Init value for %f32
	.word	0x6177350e,0x221e6027		! Init value for %f34
	.word	0x633f9b3c,0x176678dd		! Init value for %f36
	.word	0x23db675a,0x27d3e9c3		! Init value for %f38
	.word	0x07ea4ce8,0x17e16859		! Init value for %f40
	.word	0x108cbb66,0x6ce1f61f		! Init value for %f42
	.word	0x3ebabe54,0x2f304095		! Init value for %f44
	.word	0x5799dd32,0x5e01013b		! Init value for %f46
	.word	0x3209fb80,0x19305d91
	.word	0x696138be,0x12224717
	.word	0x330ed06c,0x178ddb4d
	.word	0x149cfa0a,0x38cbc3b3
	.word	0x4549c918,0x3bff95c9
	.word	0x122f0d16,0x2734330f
	.word	0x15b13184,0x17432905
	.word	0x6aad1de2,0x401f112b
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
	.word	0x00000000,0x6cfe0000		! %l0
	.word	0x00000000,0x00000049		! %l1
	.word	0x00000000,0x000000ff		! %l2
	.word	0x00000000,0x00002955		! %l3
	.word	0x00000000,0x00000000		! %l4
	.word	0x00000000,0x6cfe7029		! %l5
	.word	0x00000000,0x00007029		! %l6
	.word	0x00000000,0x00000000		! %l7
p0_expected_fp_regs:
	.word	0xff000015,0x4f0c3bf1		! %f0
	.word	0x57d6ffff,0x00140000		! %f2
	.word	0x0aff0000,0xff000000		! %f4
	.word	0x00140000,0x00000036		! %f6
	.word	0x7a7bb2ff,0xa1614661		! %f8
	.word	0x00000000,0x00000000		! %f10
	.word	0x51764a34,0xfd17ff00		! %f12
	.word	0x5b08a382,0x000000ff		! %f14
	.word	0xffff00ff,0x00000000		! %f16
	.word	0x61460079,0x212be96d		! %f18
	.word	0xff600000,0x212be96d		! %f20
	.word	0x61460079,0x57d6ffff		! %f22
	.word	0x2967efb8,0x00000057		! %f24
	.word	0x79ec7de9,0x04000000		! %f26
	.word	0xa1614661,0x10be00ff		! %f28
	.word	0xff52d4bc,0xd947ff20		! %f30
	.word	0x0000000c,0x00000921		! %fsr
p0_local0_expect:
	.word	0x00000000,0x68d8f101,0x515d0000,0x00000000 ! PA = 0000000010001400
	.word	0x00000000,0x212be96d,0x00000000,0x4ab1c9a3 ! PA = 0000000010001410
	.word	0x5834e4dc,0x00000000,0x2c8c3ac6,0x26833b04 ! PA = 0000000010001420
	.word	0x57022049,0xfe6c5d51,0x74c1fa92,0xfffa8092 ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0xffff0400,0x0000ffff,0x00000000,0x0000003c ! PA = 0000000030001400
	.word	0x00000000,0x42ec7c4b,0x5c83736a,0x7b6cfb93 ! PA = 0000000030001410
	.word	0x0331b578,0x269894a9,0x5e274476,0x067170ef ! PA = 0000000030001420
	.word	0x6f894be4,0x1116dde5,0x1fcb7342,0x047f350b ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0xd7808f7e,0x166afc4f,0x98724722,0x9f3a18bb
	.word	0x30828ce6,0x2ab8eb87,0x902a99ca,0xa9ee7fb3
	.word	0x55d5aece,0xa92af83f,0xd34354f2,0xa686502b
	.word	0xd50b9d36,0xe7851a77,0x59d5609a,0xcc934223
p0_local1_expect:
	.word	0xa1673442,0xffffffff,0x004a6015,0x78ed3be1 ! PA = 0000000010041400
	.word	0x00000000,0x000000ff,0x738e5a1a,0x45a45983 ! PA = 0000000010041410
	.word	0x5b08a382,0x42ec7c4b,0x35432a26,0x514a9963 ! PA = 0000000010041420
	.word	0x0000009c,0x000000ff,0xa1673442,0x6769b6c1 ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0xff0000cd,0x1e54fc02,0x000000ec,0x40d2b9e3 ! PA = 0000000030041400
	.word	0x00000000,0x000000ec,0x4d825cca,0x70bee373 ! PA = 0000000030041410
	.word	0x1ad991d8,0x633bc389,0x7fe2ebd6,0x2b7e5ecf ! PA = 0000000030041420
	.word	0x6a645644,0x214bc2c5,0x3b4838a2,0x3ffe08eb ! PA = 0000000030041430
p0_local2_expect:
	.word	0x55290000,0x00000000,0xff000000,0x8a7f2955 ! PA = 0000000010081400
	.word	0x0aff0000,0xff000000,0x33ff5478,0x8a7f2955 ! PA = 0000000010081410
	.word	0x49b18046,0x981ac9ff,0xffffffff,0xffffffff ! PA = 0000000010081420
	.word	0xb78cc136,0xdeda621e,0x00000000,0x00005983 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x00000000,0x00000061,0x00103bf1,0x001fa4ab ! PA = 0000000030081400
	.word	0x00000061,0x212be96d,0x64b37baa,0x095abad3 ! PA = 0000000030081410
	.word	0x7a7bb2ff,0xa1614661,0x79ec7d42,0x04000000 ! PA = 0000000030081420
	.word	0xe3b9d240,0x02fc54ec,0x5b08a382,0x42ec7c4b ! PA = 0000000030081430
p0_local3_expect:
	.word	0xff001400,0x423467a1,0x00140000,0x00000036 ! PA = 00000000100c1400
	.word	0xff52d4bc,0xd947ff20,0xfd177c43,0x00000000 ! PA = 00000000100c1410
	.word	0x20ff47d9,0xbcd452ff,0x4d3758e6,0x1ae9609f ! PA = 00000000100c1420
	.word	0xb8ef6729,0x0000d415,0x00000000,0x00000000 ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0x00000036,0x0000ff0a,0xff600f62,0x4f0c3bf1 ! PA = 00000000300c1400
	.word	0xff004661,0x212be96d,0x33c35478,0x8a7f2955 ! PA = 00000000300c1410
	.word	0x49b18046,0x981ac93c,0x8f4ae761,0x968a047d ! PA = 00000000300c1420
	.word	0xb78cc136,0xdeda621e,0xabc0372d,0x31dd194e ! PA = 00000000300c1430
p0_local4_expect:
	.word	0x00000015,0x000000ff,0x04000000,0x212be96d ! PA = 0000000010101400
	.word	0xff282923,0x7a7bb2ff,0xff0000ff,0x00000023 ! PA = 0000000010101410
	.word	0x00000000,0x0000004a,0xfe6c5d51,0x0000ffff ! PA = 0000000010101420
	.word	0x51764a34,0x5244b0f5,0xe13bed78,0x00000036 ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0xff000015,0x4f0c3bf1,0x36000004,0x04000000 ! PA = 0000000030101400
	.word	0x00000000,0x6769b6c1,0x5701b8ea,0x0b08bb13 ! PA = 0000000030101410
	.word	0x3fc0c6f8,0x55127029,0x6a9a81f6,0x1eb3486f ! PA = 0000000030101420
	.word	0x7f771564,0x76e19165,0x29e528c2,0x2562a48b ! PA = 0000000030101430
p0_local5_expect:
	.word	0x61000000,0x79004661,0x00000000,0x61000060 ! PA = 0000000010141400
	.word	0x55290000,0x00000000,0x00000000,0x000000ff ! PA = 0000000010141410
	.word	0x00600f62,0x4642b149,0xff57ffe0,0x61e74a8f ! PA = 0000000010141420
	.word	0x1e62dade,0x000000ff,0xffff7b3f,0xffff8b5f ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0x10be00ff,0x423467a1,0x00ff17fd,0x344a7651 ! PA = 0000000030141400
	.word	0xa1614661,0xa1614661,0x5852624a,0x514d62f3 ! PA = 0000000030141410
	.word	0x0dd86358,0x058e5f09,0xc71d9656,0x782ef64f ! PA = 0000000030141420
	.word	0x282cacc4,0x1b4b4045,0x40cbae22,0x218c386b ! PA = 0000000030141430
p0_local6_expect:
	.word	0x000000ff,0x00000000,0x61460079,0xff2be96d ! PA = 0000000010181400
	.word	0x57000000,0xb8ef6729,0x00000000,0x57d6ffff ! PA = 0000000010181410
	.word	0x2967efb8,0x00000057,0x79ec7de9,0x04000000 ! PA = 0000000010181420
	.word	0xb2ff60ff,0x10be00ff,0x5b08a382,0x42ec7c4b ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x00007029,0x00000000,0x57d6ffff,0x0000ffff ! PA = 0000000030181400
	.word	0xff320000,0x00000036,0x64b37baa,0x095abad3 ! PA = 0000000030181410
	.word	0x2967efb8,0x79ec7de9,0x3348c0b6,0x2212542f ! PA = 0000000030181420
	.word	0x545f9a24,0x0f6e0b25,0x5b08a382,0x42ec7c4b ! PA = 0000000030181430
share0_expect:
	.word	0x00ff6050,0x41daed21,0x4b4a900e,0x564f6f27 ! PA = 00000000201c0000
	.word	0x7c370e3c,0x04bc3fdd,0x6f11b25a,0x754628c3 ! PA = 00000000201c0010
	.word	0x32a02fe8,0x5e35df59,0x79d8f666,0x119c651f ! PA = 00000000201c0020
	.word	0x50ba1154,0x5b026795,0x5e1f0832,0x0abaa03b ! PA = 00000000201c0030
share1_expect:
	.word	0xffffbe80,0x132f3491,0x19b253be,0x29421617 ! PA = 0000000020800000
	.word	0x5f02036c,0x1b98624d,0x43bd050a,0x3d68c2b3 ! PA = 0000000020800010
	.word	0x30c76c18,0x0024ccc9,0x08910816,0x5c15620f ! PA = 0000000020800020
	.word	0x10044484,0x22c21005,0x7f3408e2,0x76bb702b ! PA = 0000000020800030
	.word	0xffff98b0,0x1b208801,0x04ab736e,0x49f72907 ! PA = 0000000020800040
	.word	0x1212349c,0x732f50bd,0x090873ba,0x5ee988a3 ! PA = 0000000020800050
	.word	0x4808a448,0x5c584639,0x7a33f5c6,0x1b544aff ! PA = 0000000020800060
	.word	0x325933b4,0x397c0475,0x387aa592,0x1c75ec1b ! PA = 0000000020800070
share2_expect:
	.word	0xff0aeee0,0x19ade771,0x40d8ef1e,0x58a5a7f7 ! PA = 00000000211c0000
	.word	0x2662a1cc,0x7fb00b2d,0x7906fe6a,0x43af7a93 ! PA = 00000000211c0010
	.word	0x5e4ed878,0x122f4ba9,0x4944bf76,0x71f01fef ! PA = 00000000211c0020
	.word	0x4593dee4,0x10bf44e5,0x6fe5de42,0x7631140b ! PA = 00000000211c0030
share3_expect:
	.word	0x15b7c110,0x299652e1,0x3a9dc6ce,0x764492e7 ! PA = 0000000021800000
	.word	0x32ae4afc,0x0c09919d,0x118ba51a,0x32619883 ! PA = 0000000021800010
	.word	0x4b4508a8,0x53c8dd19,0x00066526,0x7b3fe0df ! PA = 0000000021800020
	.word	0x754f4614,0x28dad155,0x2728b2f2,0x52f3e7fb ! PA = 0000000021800030
	.word	0x11920f40,0x3058ca51,0x461cfa7e,0x348ae9d7 ! PA = 0000000021800040
	.word	0x0370302c,0x29eae40d,0x442967ca,0x3e66e273 ! PA = 0000000021800050
	.word	0x085634d8,0x5603fa89,0x687be6d6,0x3b5a8dcf ! PA = 0000000021800060
	.word	0x3ae66944,0x00dda9c5,0x2bb623a2,0x468567eb ! PA = 0000000021800070
	.word	0x0dffd970,0x4e344dc1,0x4f398a2e,0x05efacc7 ! PA = 0000000021800080
	.word	0x4ae3515c,0x21c3027d,0x2633467a,0x37e65863 ! PA = 0000000021800090
	.word	0x60ad5d08,0x407fa3f9,0x3c684486,0x0f1726bf ! PA = 00000000218000a0
	.word	0x0d744874,0x0696ce35,0x46c13052,0x196c93db ! PA = 00000000218000b0
	.word	0xff001fa0,0x4e27dd31,0x099675de,0x2da9dbb7 ! PA = 00000000218000c0
	.word	0x5102ae8c,0x62c0eced,0x20bc412a,0x1bc6fa53 ! PA = 00000000218000d0
	.word	0x21358138,0x1d9ad969,0x554e7e36,0x1c0cabaf ! PA = 00000000218000e0
	.word	0x11d3e3a4,0x06953ea5,0x6d3cd902,0x38f06bcb ! PA = 00000000218000f0
	.word	0x6789e1d0,0x15f278a1,0x2096bd8e,0x2fb076a7 ! PA = 0000000021800100
	.word	0x238947bc,0x72d3a35d,0x209757da,0x03afc843 ! PA = 0000000021800110
	.word	0x4899a168,0x4a749ad9,0x5c7193e6,0x40921c9f ! PA = 0000000021800120
	.word	0x4aa03ad4,0x1c27fb15,0x6fdc1db2,0x2717efbb ! PA = 0000000021800130
	.word	0x32ff2000,0x16132011,0x675d613e,0x40ba7d97 ! PA = 0000000021800140
	.word	0x45f21cec,0x5eaa25cd,0x46578a8a,0x1607c233 ! PA = 0000000021800150
	.word	0x3744bd98,0x66ebe849,0x7ad48596,0x03be798f ! PA = 0000000021800160
	.word	0x48344e04,0x215e0385,0x2b11fe62,0x6aaa1fab ! PA = 0000000021800170
	.word	0xffffda30,0x39c8d381,0x08cd60ee,0x363ef087 ! PA = 0000000021800180
	.word	0x61782e1c,0x29b3743d,0x164fd93a,0x75f5e823 ! PA = 0000000021800190
	.word	0x5f61d5c8,0x459fc1b9,0x093a5346,0x0568c27f ! PA = 00000000218001a0
	.word	0x58ab1d34,0x1f0657f5,0x37117b12,0x7f2dfb9b ! PA = 00000000218001b0
	.word	0xffff1060,0x571292f1,0x3789bc9e,0x7674cf77 ! PA = 00000000218001c0
	.word	0x75167b4c,0x3e1e8ead,0x289343ea,0x33613a13 ! PA = 00000000218001d0
	.word	0x74dbe9f8,0x5bef2729,0x4025fcf6,0x6e27f76f ! PA = 00000000218001e0
	.word	0x37dfa864,0x3caff865,0x17cd93c2,0x44ea838b ! PA = 00000000218001f0
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
	.word	0x299d15b0,0x68d8f101,0x61ac986e,0x32789a07	! PA = 0000000010001400
	.word	0x5173419c,0x2b8009bd,0x52cea8ba,0x4ab1c9a3	! PA = 0000000010001410
	.word	0x2b134148,0x1a724f39,0x2c8c3ac6,0x52dc5bff	! PA = 0000000010001420
	.word	0x400260b4,0x0b605d75,0x74c1fa92,0x3d86cd1b	! PA = 0000000010001430
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
	.word	0x0b57abe0,0x392d9071,0x02fc541e,0x175858f7	! PA = 0000000030001400
	.word	0x7367eecc,0x5b6c042d,0x5c83736a,0x7b6cfb93	! PA = 0000000030001410
	.word	0x0331b578,0x269894a9,0x5e274476,0x067170ef	! PA = 0000000030001420
	.word	0x6f894be4,0x1116dde5,0x1fcb7342,0x047f350b	! PA = 0000000030001430
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
	.word	0x3404be10,0x78ed3be1,0x3db36bce,0x55b883e7	! PA = 0000000010041400
	.word	0x53a7d7fc,0x0640ca9d,0x738e5a1a,0x45a45983	! PA = 0000000010041410
	.word	0x095025a8,0x66916619,0x35432a26,0x514a71df	! PA = 0000000010041420
	.word	0x73e0f314,0x3cb5aa55,0x317c87f2,0x180f48fb	! PA = 0000000010041430
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
	.word	0x0a2f4c40,0x6196f351,0x69f4df7e,0x73501ad7	! PA = 0000000030041400
	.word	0x62adfd2c,0x51ad5d0d,0x4d825cca,0x70bee373	! PA = 0000000030041410
	.word	0x1ad991d8,0x633bc389,0x7fe2ebd6,0x2b7e5ecf	! PA = 0000000030041420
	.word	0x6a645644,0x214bc2c5,0x3b4838a2,0x3ffe08eb	! PA = 0000000030041430
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
	.word	0x2e225670,0x6769b6c1,0x77a3af2e,0x56961dc7	! PA = 0000000010081400
	.word	0x76b55e5c,0x1a20bb7d,0x43b27b7a,0x00e39963	! PA = 0000000010081410
	.word	0x66f8fa08,0x1836acf9,0x7bc98986,0x65e437bf	! PA = 0000000010081420
	.word	0x6e2e7574,0x40a82735,0x4a618552,0x78d274db	! PA = 0000000010081430
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
	.word	0x29e8dca0,0x29648631,0x1e62dade,0x36c18cb7	! PA = 0000000030081400
	.word	0x7bb8fb8c,0x62c9e5ed,0x0331b62a,0x26f97b53	! PA = 0000000030081410
	.word	0x1e995e38,0x63e12269,0x067a0336,0x1a12fcaf	! PA = 0000000030081420
	.word	0x481a50a4,0x7b59d7a5,0x17bb6e02,0x63d38ccb	! PA = 0000000030081430
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
	.word	0x214dded0,0x614661a1,0x0d95628e,0x0bc967a7	! PA = 00000000100c1400
	.word	0x2373d4bc,0x4597dc5d,0x3cd30cda,0x30a78943	! PA = 00000000100c1410
	.word	0x2465be68,0x775a23d9,0x4d3758e6,0x1a61ad9f	! PA = 00000000100c1420
	.word	0x1ec2e7d4,0x00afd415,0x3808f2b2,0x370850bb	! PA = 00000000100c1430
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
	.word	0x01dc5d00,0x538e4911,0x1c5e463e,0x7e64ae97	! PA = 00000000300c1400
	.word	0x1560e9ec,0x63399ecd,0x55297f8a,0x7854c333	! PA = 00000000300c1410
	.word	0x3cc91a98,0x4680b149,0x7d048a96,0x61e74a8f	! PA = 00000000300c1420
	.word	0x26833b04,0x3eb91c85,0x4bbd1362,0x2d37c0ab	! PA = 00000000300c1430
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
	.word	0x32df5730,0x3f7b3c81,0x79a085ee,0x580a6187	! PA = 0000000010101400
	.word	0x1ebb3b1c,0x531e2d3d,0x14880e3a,0x55282923	! PA = 0000000010101410
	.word	0x3dee72c8,0x77f3cab9,0x72a49846,0x047ad37f	! PA = 0000000010101420
	.word	0x51764a34,0x5244b0f5,0x2f0ad012,0x75e8dc9b	! PA = 0000000010101430
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
	.word	0x4561cd60,0x4f0c3bf1,0x5bff219e,0x72f18077	! PA = 0000000030101400
	.word	0x627dc84c,0x137487ad,0x5701b8ea,0x0b08bb13	! PA = 0000000030101410
	.word	0x3fc0c6f8,0x55127029,0x6a9a81f6,0x1eb3486f	! PA = 0000000030101420
	.word	0x7f771564,0x76e19165,0x29e528c2,0x2562a48b	! PA = 0000000030101430
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
	.word	0x242ebf90,0x07004761,0x31dd194e,0x2a110b67	! PA = 0000000010141400
	.word	0x0963917c,0x792bae1d,0x3c697f9a,0x3a9d7903	! PA = 0000000010141410
	.word	0x4beb1728,0x39fba199,0x312947a6,0x45e7a95f	! PA = 0000000010141420
	.word	0x2e209c94,0x76debdd5,0x1fff1d72,0x24ac187b	! PA = 0000000010141430
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
	.word	0x43d12dc0,0x36d65ed1,0x515d6cfe,0x49200257	! PA = 0000000030141400
	.word	0x71e796ac,0x1ff2a08d,0x5852624a,0x514d62f3	! PA = 0000000030141410
	.word	0x0dd86358,0x058e5f09,0x5253e956,0x782ef64f	! PA = 0000000030141420
	.word	0x28cddfc4,0x1b4b3645,0x40cbae22,0x218c386b	! PA = 0000000030141430
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
	.word	0x529417f0,0x68cd8241,0x28631cae,0x7c956547	! PA = 0000000010181400
	.word	0x6044d7dc,0x5a385efd,0x620f60fa,0x793f78e3	! PA = 0000000010181410
	.word	0x02b3ab88,0x0969a879,0x49dd6706,0x0c602f3f	! PA = 0000000010181420
	.word	0x3899def4,0x1bf5fab5,0x377ddad2,0x7e8a045b	! PA = 0000000010181430
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
	.word	0x68827e20,0x51e4b1b1,0x6c91285e,0x41a83437	! PA = 0000000030181400
	.word	0x2e76550c,0x212be96d,0x64b37baa,0x095abad3	! PA = 0000000030181410
	.word	0x2967efb8,0x79ec7de9,0x3348c0b6,0x2212542f	! PA = 0000000030181420
	.word	0x545f9a24,0x0f6e0b25,0x5b08a382,0x42ec7c4b	! PA = 0000000030181430
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
	.word	0x37676050,0x41daed21,0x4b4a900e,0x564f6f27	! PA = 00000000201c0000
	.word	0x7c370e3c,0x04bc3fdd,0x6f11b25a,0x754628c3	! PA = 00000000201c0010
	.word	0x32a02fe8,0x5e35df59,0x79d8f666,0x119c651f	! PA = 00000000201c0020
	.word	0x50ba1154,0x5b026795,0x5e1f0832,0x0abaa03b	! PA = 00000000201c0030
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
	.word	0x3acdbe80,0x132f3491,0x19b253be,0x29421617	! PA = 0000000020800000
	.word	0x5f02036c,0x1b98624d,0x43bd050a,0x3d68c2b3	! PA = 0000000020800010
	.word	0x30c76c18,0x0024ccc9,0x08910816,0x5c15620f	! PA = 0000000020800020
	.word	0x10044484,0x22c21005,0x7f3408e2,0x76bb702b	! PA = 0000000020800030
	.word	0x680098b0,0x1b208801,0x04ab736e,0x49f72907	! PA = 0000000020800040
	.word	0x1212349c,0x732f50bd,0x090873ba,0x5ee988a3	! PA = 0000000020800050
	.word	0x4808a448,0x5c584639,0x7a33f5c6,0x1b544aff	! PA = 0000000020800060
	.word	0x325933b4,0x397c0475,0x387aa592,0x1c75ec1b	! PA = 0000000020800070
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
	.word	0x5e0aeee0,0x19ade771,0x40d8ef1e,0x58a5a7f7	! PA = 00000000211c0000
	.word	0x2662a1cc,0x7fb00b2d,0x7906fe6a,0x43af7a93	! PA = 00000000211c0010
	.word	0x5e4ed878,0x122f4ba9,0x4944bf76,0x71f01fef	! PA = 00000000211c0020
	.word	0x4593dee4,0x10bf44e5,0x6fe5de42,0x7631140b	! PA = 00000000211c0030
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
	.word	0x15b7c110,0x299652e1,0x3a9dc6ce,0x764492e7	! PA = 0000000021800000
	.word	0x32ae4afc,0x0c09919d,0x118ba51a,0x32619883	! PA = 0000000021800010
	.word	0x4b4508a8,0x53c8dd19,0x00066526,0x7b3fe0df	! PA = 0000000021800020
	.word	0x754f4614,0x28dad155,0x2728b2f2,0x52f3e7fb	! PA = 0000000021800030
	.word	0x11920f40,0x3058ca51,0x461cfa7e,0x348ae9d7	! PA = 0000000021800040
	.word	0x0370302c,0x29eae40d,0x442967ca,0x3e66e273	! PA = 0000000021800050
	.word	0x085634d8,0x5603fa89,0x687be6d6,0x3b5a8dcf	! PA = 0000000021800060
	.word	0x3ae66944,0x00dda9c5,0x2bb623a2,0x468567eb	! PA = 0000000021800070
	.word	0x0de4d970,0x4e344dc1,0x4f398a2e,0x05efacc7	! PA = 0000000021800080
	.word	0x4ae3515c,0x21c3027d,0x2633467a,0x37e65863	! PA = 0000000021800090
	.word	0x60ad5d08,0x407fa3f9,0x3c684486,0x0f1726bf	! PA = 00000000218000a0
	.word	0x0d744874,0x0696ce35,0x46c13052,0x196c93db	! PA = 00000000218000b0
	.word	0x30bb1fa0,0x4e27dd31,0x099675de,0x2da9dbb7	! PA = 00000000218000c0
	.word	0x5102ae8c,0x62c0eced,0x20bc412a,0x1bc6fa53	! PA = 00000000218000d0
	.word	0x21358138,0x1d9ad969,0x554e7e36,0x1c0cabaf	! PA = 00000000218000e0
	.word	0x11d3e3a4,0x06953ea5,0x6d3cd902,0x38f06bcb	! PA = 00000000218000f0
	.word	0x39dfe1d0,0x15f278a1,0x2096bd8e,0x2fb076a7	! PA = 0000000021800100
	.word	0x238947bc,0x72d3a35d,0x209757da,0x03afc843	! PA = 0000000021800110
	.word	0x4899a168,0x4a749ad9,0x5c7193e6,0x40921c9f	! PA = 0000000021800120
	.word	0x4aa03ad4,0x1c27fb15,0x6fdc1db2,0x2717efbb	! PA = 0000000021800130
	.word	0x32de2000,0x16132011,0x675d613e,0x40ba7d97	! PA = 0000000021800140
	.word	0x45f21cec,0x5eaa25cd,0x46578a8a,0x1607c233	! PA = 0000000021800150
	.word	0x3744bd98,0x66ebe849,0x7ad48596,0x03be798f	! PA = 0000000021800160
	.word	0x48344e04,0x215e0385,0x2b11fe62,0x6aaa1fab	! PA = 0000000021800170
	.word	0x1f00da30,0x39c8d381,0x08cd60ee,0x363ef087	! PA = 0000000021800180
	.word	0x61782e1c,0x29b3743d,0x164fd93a,0x75f5e823	! PA = 0000000021800190
	.word	0x5f61d5c8,0x459fc1b9,0x093a5346,0x0568c27f	! PA = 00000000218001a0
	.word	0x58ab1d34,0x1f0657f5,0x37117b12,0x7f2dfb9b	! PA = 00000000218001b0
	.word	0x2b531060,0x571292f1,0x3789bc9e,0x7674cf77	! PA = 00000000218001c0
	.word	0x75167b4c,0x3e1e8ead,0x289343ea,0x33613a13	! PA = 00000000218001d0
	.word	0x74dbe9f8,0x5bef2729,0x4025fcf6,0x6e27f76f	! PA = 00000000218001e0
	.word	0x37dfa864,0x3caff865,0x17cd93c2,0x44ea838b	! PA = 00000000218001f0
share3_end:
