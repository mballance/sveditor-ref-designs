/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_2000_8.s
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
!	Seed = 626121659
!	Riesling can be on
!	1 Thread, 2000 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_2000_8.s created on Jun 26, 2009 (12:16:59)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_2000_8 -p 1 -l 2000

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
!	%f0  = 5d2e58a0 03f69231 51f536de 6ae0f8b7
!	%f4  = 7ac7378c 4589b1ed 06a2d22a 5144a753
!	%f8  = 4ccc5a38 5b3aae69 0105df36 0f55e8af
!	%f12 = 378e0ca4 4f7923a5 255e0a02 229a38cb
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 4ede5ad0 62176da1 5b0abe8e 685fd3a7
!	%f20 = 72bd10bc 56c6a85d 639728da 4119b543
!	%f24 = 1bc3ba68 5c52afd9 6f8634e6 627b999f
!	%f28 = 6351a3d4 689e2015 5cde8eb2 1455fcbb
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 1377d900 255e5511 4b76a23e 54321a97
!	%f36 = 4aa525ec 49976acd 73009b8a 1badef33
!	%f40 = 7f121698 7bd83d49 66d66696 4598368f
!	%f44 = 6decf704 19366885 3385af62 4dcc6cab
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x8eff31e40000007c,%g7,%g1 ! %gsr scale = 15, align = 4
	wr	%g1,%g0,%gsr		! %gsr = 8eff31e40000007c

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	%f4  = 7ac7378c 4589b1ed, %l2 = 6a1840dc0d3ba8b4
!	Mem[0000000030041418] = 4b857cfa6a5ba4e3
	add	%i1,0x018,%g1
	stda	%f4,[%g1+%l2]ASI_PST16_S ! Mem[0000000030041418] = 4b85378c6a5ba4e3
!	Mem[0000000010101400] = 50546ae0, %l2 = 6a1840dc0d3ba8b4
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000050
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[0000000021800101] = 1fb0fd80, %l7 = 5efa2d3ebde22d4b
	ldstub	[%o3+0x101],%l7		! %l7 = 00000000000000b0
!	Mem[00000000100c1400] = 4bc13a80, %l3 = 00000000f0208f7f
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 000000004bc13a80
!	%l2 = 0000000000000050, Mem[0000000010081400] = 7f1ffa200b6ebdb1
	stx	%l2,[%i2+%g0]		! Mem[0000000010081400] = 0000000000000050
!	Mem[0000000010081408] = 5e843b48, %l5 = 0000000053642645
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 000000005e843b48
!	Mem[00000000218001c1] = 392b4010, %l2 = 0000000000000050
	ldstuba	[%o3+0x1c1]%asi,%l2	! %l2 = 000000000000002b
!	Mem[0000000030001400] = 3c6b3b90 2c4d5361 145e754e 30037767
!	%f0  = 5d2e58a0 03f69231 51f536de 6ae0f8b7
!	%f4  = 7ac7378c 4589b1ed 06a2d22a 5144a753
!	%f8  = 4ccc5a38 5b3aae69 0105df36 0f55e8af
!	%f12 = 378e0ca4 4f7923a5 255e0a02 229a38cb
	stda	%f0 ,[%i0+%g0]ASI_BLK_SL	! Block Store to 0000000030001400
!	%l2 = 0000002b, %l3 = 4bc13a80, Mem[0000000010081400] = 00000000 50000000
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000002b 4bc13a80
!	%l4 = 460e1babed10d85a, Mem[00000000100c1408] = 1782c723beafe26c
	stxa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 460e1babed10d85a

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 048283bc, %l0 = 4161ff66ff58454e
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000004
!	Mem[00000000300c1400] = 04bf14b0, %l0 = 0000000000000004
	ldswa	[%i3+%g0]0x81,%l0	! %l0 = 0000000004bf14b0
!	Mem[0000000010101410] = ccddb443, %l3 = 000000004bc13a80
	ldsba	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000043
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010001408] = 659d7d9e6d6cec77, %f28 = 6351a3d4 689e2015
	ldda	[%i0+%o4]0x80,%f28	! %f28 = 659d7d9e 6d6cec77
!	Mem[00000000100c1408] = 5ad810ed, %l1 = ab432e2bf94a10f9
	lduha	[%i3+%o4]0x80,%l1	! %l1 = 0000000000005ad8
!	Mem[000000001010142b] = 10749b76, %l6 = 17ce4438e5dcac40, %asi = 80
	lduba	[%i4+0x02b]%asi,%l6	! %l6 = 0000000000000076
!	Mem[000000001014143a] = 4b62bfa2, %l0 = 0000000004bf14b0, %asi = 80
	ldsba	[%i5+0x03a]%asi,%l0	! %l0 = ffffffffffffffbf
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0000] = 398c3e90, %l7 = 00000000000000b0
	lduh	[%o2+%g0],%l7		! %l7 = 000000000000398c
!	Mem[00000000100c1400] = f0208f7f, %l5 = 000000005e843b48
	lduwa	[%i3+%g0]0x80,%l5	! %l5 = 00000000f0208f7f
!	Mem[00000000100c1408] = 460e1babed10d85a, %f22 = 639728da 4119b543
	ldda	[%i3+%o4]0x88,%f22	! %f22 = 460e1bab ed10d85a

p0_label_3:
!	Starting 10 instruction Store Burst
!	%f8  = 4ccc5a38 5b3aae69, %l7 = 000000000000398c
!	Mem[0000000010141400] = 4c318b40149cd651
	stda	%f8,[%i5+%l7]ASI_PST32_P ! Mem[0000000010141400] = 4c318b40149cd651
!	%l4 = 460e1babed10d85a, Mem[00000000211c0000] = 398c3e90
	stb	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 5a8c3e90
!	Mem[0000000030181410] = bc838204, %l3 = 0000000000000043
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000004
!	Mem[0000000010101410] = 43b4ddcc, %l4 = 460e1babed10d85a
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000043
!	Mem[00000000100c1415] = 1e6e2e4d, %l4 = 0000000000000043
	ldstub	[%i3+0x015],%l4		! %l4 = 000000000000006e
!	%l4 = 0000006e, %l5 = f0208f7f, Mem[0000000010141408] = 2559567e 136c55d7, %asi = 80
	stda	%l4,[%i5+0x008]%asi	! Mem[0000000010141408] = 0000006e f0208f7f
!	Mem[00000000100c1400] = f0208f7f, %l2 = 000000000000002b
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 00000000f0208f7f
!	Mem[0000000010001410] = 64f8044c, %l4 = 000000000000006e
	swap	[%i0+%o5],%l4		! %l4 = 0000000064f8044c
!	%l2 = 00000000f0208f7f, Mem[0000000030001408] = b7f8e06a
	stha	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 8f7fe06a
!	%l2 = 00000000f0208f7f, Mem[0000000030001408] = 6ae07f8f
	stha	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 6ae08f7f

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = bc8382ff, %l5 = 00000000f0208f7f
	ldsba	[%i6+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1408] = 079573446ecf3e2f, %l1 = 0000000000005ad8
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = 079573446ecf3e2f
!	Mem[0000000030001400] = 3192f603, %l6 = 0000000000000076
	ldsha	[%i0+%g0]0x81,%l6	! %l6 = 0000000000003192
!	Mem[0000000010141410] = 60f86c2c, %f29 = 6d6cec77
	lda	[%i5+%o5]0x80,%f29	! %f29 = 60f86c2c
!	Mem[00000000300c1408] = 2f3ecf6e, %l1 = 079573446ecf3e2f
	ldswa	[%i3+%o4]0x81,%l1	! %l1 = 000000002f3ecf6e
!	Mem[0000000030041410] = dc13b069, %l4 = 0000000064f8044c
	ldsba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000069
!	Mem[000000001010141c] = 014ea693, %l1 = 000000002f3ecf6e
	ldsb	[%i4+0x01c],%l1		! %l1 = 0000000000000001
!	Mem[0000000010001410] = 0000006e 587053ad, %l2 = f0208f7f, %l3 = 00000004
	ldd	[%i0+%o5],%l2		! %l2 = 000000000000006e 00000000587053ad
!	Mem[0000000030041400] = f093a61a, %l5 = ffffffffffffffff
	ldswa	[%i1+%g0]0x89,%l5	! %l5 = fffffffff093a61a
!	Mem[0000000010041410] = 5897d2ac, %l3 = 00000000587053ad
	lduha	[%i1+%o5]0x80,%l3	! %l3 = 0000000000005897

p0_label_5:
!	Starting 10 instruction Store Burst
!	%f30 = 5cde8eb2, Mem[0000000010181400] = a09bb01a
	sta	%f30,[%i6+%g0]0x88	! Mem[0000000010181400] = 5cde8eb2
!	Mem[0000000010101408] = 1e4b8f6a, %l1 = 0000000000000001
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 000000000000006a
!	%l6 = 00003192, %l7 = 0000398c, Mem[0000000010081400] = 2b000000 803ac14b
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00003192 0000398c
!	Mem[00000000100c1400] = 0000002b, %l4 = 0000000000000069
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l7 = 000000000000398c, Mem[0000000010081418] = 2bbc97aa49dde6d3
	stx	%l7,[%i2+0x018]		! Mem[0000000010081418] = 000000000000398c
!	%f0  = 5d2e58a0, %f22 = 460e1bab
	fitos	%f0 ,%f22		! %f22 = 4eba5cb1
!	Mem[00000000300c1400] = b014bf04, %l3 = 0000000000005897
	swapa	[%i3+%g0]0x89,%l3	! %l3 = 00000000b014bf04
!	%l3 = 00000000b014bf04, Mem[0000000030181410] = ff8283bc
	stha	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = bf0483bc
!	Mem[0000000010141408] = 6e000000, %l0 = 00000000ffffffbf
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 000000006e000000
!	%l0 = 000000006e000000, Mem[0000000030141408] = 44d8e62e47c818c7
	stxa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000006e000000

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 03ea78ae, %l5 = fffffffff093a61a
	ldsha	[%i1+%o4]0x81,%l5	! %l5 = 00000000000003ea
!	Mem[0000000010081408] = 53642645, %l2 = 000000000000006e
	lduba	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000045
	membar	#Sync			! Added by membar checker (2)
!	Mem[00000000300c1400] = 97580000 79a79401 2f3ecf6e 44739507
!	Mem[00000000300c1410] = 1fe9709c 57f41cbd 7f4a8fba 3a21b4a3
!	Mem[00000000300c1420] = 6b54a048 70c6d239 6c60d1c6 711436ff
!	Mem[00000000300c1430] = 0e35efb4 72c05075 1b8e4192 4049981b
	ldda	[%i3+%g0]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[000000001014140e] = f0208f7f, %l0 = 000000006e000000
	ldstuba	[%i5+0x00e]%asi,%l0	! %l0 = 000000000000008f
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	Mem[00000000201c0001] = 33299c00, %l3 = 00000000b014bf04
	ldub	[%o0+0x001],%l3		! %l3 = 0000000000000029
!	Mem[0000000010141410] = 60f86c2c1cfcb00d, %l4 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l4	! %l4 = 60f86c2c1cfcb00d
!	Mem[0000000030081400] = 21f9a337 50dc4f56, %l0 = 0000008f, %l1 = 0000006a
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 0000000050dc4f56 0000000021f9a337
!	%f14 = 255e0a02, %f5  = 4589b1ed, %f9  = 5b3aae69
	fmuls	%f14,%f5 ,%f9 		! %f9  = 2b6edb5b
!	Mem[0000000030141408] = 00000000 6e000000, %l4 = 1cfcb00d, %l5 = 000003ea
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000 000000006e000000
!	Mem[0000000010181408] = 7d58d1de433947b7, %l2 = 0000000000000045
	ldxa	[%i6+%o4]0x80,%l2	! %l2 = 7d58d1de433947b7

p0_label_7:
!	Starting 10 instruction Store Burst
!	Mem[000000001000143c] = 7ac5508b, %l4 = 0000000000000000, %asi = 80
	swapa	[%i0+0x03c]%asi,%l4	! %l4 = 000000007ac5508b
!	%l6 = 0000000000003192, Mem[0000000010101410] = ccddb4ff
	stwa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 00003192
!	Mem[0000000010181400] = b28ede5c, %l4 = 000000007ac5508b
	ldstuba	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000b2
!	Mem[0000000010081414] = 3463b56d, %l4 = 00000000000000b2
	swap	[%i2+0x014],%l4		! %l4 = 000000003463b56d
!	Mem[0000000010181400] = 5cde8eff, %l2 = 00000000433947b7
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 000000005cde8eff
!	Mem[0000000010001410] = 6e000000, %l1 = 0000000021f9a337
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%l4 = 000000003463b56d, Mem[0000000010141400] = 408b314c
	stha	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 408bb56d
!	%l1 = 0000000000000000, Mem[000000001000141c] = 1a6fe713
	sth	%l1,[%i0+0x01c]		! Mem[000000001000141c] = 0000e713
!	%l2 = 5cde8eff, %l3 = 00000029, Mem[0000000030141408] = 00000000 6e000000
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 5cde8eff 00000029
!	%f22 = 7f4a8fba 3a21b4a3, %l7 = 000000000000398c
!	Mem[0000000030081438] = 238ca43247404c3b
	add	%i2,0x038,%g1
	stda	%f22,[%g1+%l7]ASI_PST8_S ! Mem[0000000030081438] = 7f8ca4323a214c3b

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 4718a9c0, %l6 = 0000000000003192, %asi = 80
	lduwa	[%i1+0x000]%asi,%l6	! %l6 = 000000004718a9c0
!	Mem[0000000010041408] = fec88114, %l6 = 000000004718a9c0
	ldsha	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffff8114
!	Mem[0000000010001400] = 1c534960031a47f1, %f10 = 0105df36 0f55e8af
	ldd	[%i0+%g0],%f10		! %f10 = 1c534960 031a47f1
!	Mem[0000000010181408] = ded1587d, %l0 = 0000000050dc4f56
	ldsha	[%i6+%o4]0x88,%l0	! %l0 = 000000000000587d
!	Mem[0000000010181410] = 8ceac005, %f0  = 5d2e58a0
	lda	[%i6+%o5]0x88,%f0 	! %f0 = 8ceac005
!	Mem[0000000030041410] = dc13b069, %l2 = 000000005cde8eff
	lduba	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000069
!	Mem[0000000010181430] = 44f79fa4, %f3  = 6ae0f8b7
	lda	[%i6+0x030]%asi,%f3 	! %f3 = 44f79fa4
!	Mem[0000000010001410] = 6e0000ff, %l1 = 0000000000000000
	ldsba	[%i0+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041428] = 57b1c556, %l6 = ffffffffffff8114
	ldsw	[%i1+0x028],%l6		! %l6 = 0000000057b1c556
!	Mem[0000000010181400] = 31e9a916433947b7, %f12 = 378e0ca4 4f7923a5
	ldda	[%i6+%g0]0x88,%f12	! %f12 = 31e9a916 433947b7

p0_label_9:
!	Starting 10 instruction Store Burst
!	%l4 = 000000003463b56d, Mem[0000000010181410] = 8ceac005
	stba	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 8ceac06d
!	%l6 = 0000000057b1c556, Mem[0000000010001408] = 9e7d9d65
	stwa	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 57b1c556
!	Mem[0000000010181408] = 7d58d1de, %l5 = 000000006e000000
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 000000000000007d
!	%f22 = 7f4a8fba 3a21b4a3, %l1 = ffffffffffffffff
!	Mem[0000000010101428] = 10749b764ac70bef
	add	%i4,0x028,%g1
	stda	%f22,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010101428] = a3b4213aba8f4a7f
!	%f22 = 7f4a8fba 3a21b4a3, Mem[0000000010181410] = 6dc0ea8c 5670b8ed
	stda	%f22,[%i6+%o5]0x80	! Mem[0000000010181410] = 7f4a8fba 3a21b4a3
!	%l2 = 00000069, %l3 = 00000029, Mem[0000000010141410] = 2c6cf860 0db0fc1c
	stda	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000069 00000029
!	%l0 = 0000587d, %l1 = ffffffff, Mem[0000000010001410] = 6e0000ff ad537058
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000587d ffffffff
!	%l2 = 0000000000000069, Mem[00000000100c1400] = 2b0000ff
	stha	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 2b000069
!	%l5 = 000000000000007d, Mem[0000000030181400] = 3a205dd0
	stba	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 7d205dd0
!	Mem[0000000030101410] = 053b86fc, %l5 = 000000000000007d
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 00000000053b86fc

p0_label_10:
!	Starting 10 instruction Load Burst
!	%l7 = 000000000000398c, %l5 = 00000000053b86fc, %l6 = 0000000057b1c556
	xnor	%l7,%l5,%l6		! %l6 = fffffffffac4408f
!	Mem[0000000010141408] = 7fff20f0ffffffbf, %l6 = fffffffffac4408f
	ldxa	[%i5+%o4]0x88,%l6	! %l6 = 7fff20f0ffffffbf
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800040] = 28f48c60, %l3 = 0000000000000029
	ldsh	[%o1+0x040],%l3		! %l3 = 00000000000028f4
!	Mem[0000000030181410] = bf0483bc, %l3 = 00000000000028f4
	lduba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000bf
!	Mem[0000000010001408] = 57b1c556, %l0 = 000000000000587d
	lduwa	[%i0+%o4]0x88,%l0	! %l0 = 0000000057b1c556
!	Mem[0000000010041410] = acd29758, %l3 = 00000000000000bf
	lduba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000058
!	%l3 = 0000000000000058, imm = fffffffffffffc77, %l0 = 0000000057b1c556
	subc	%l3,-0x389,%l0		! %l0 = 00000000000003e1
!	Mem[0000000021800100] = 1ffffd80, %l3 = 0000000000000058, %asi = 80
	ldsha	[%o3+0x100]%asi,%l3	! %l3 = 0000000000001fff
!	Mem[0000000010141420] = 162330d8 264f8689, %l4 = 3463b56d, %l5 = 053b86fc
	ldd	[%i5+0x020],%l4		! %l4 = 00000000162330d8 00000000264f8689
!	Mem[00000000300c1410] = 9c70e91f, %l5 = 00000000264f8689
	ldswa	[%i3+%o5]0x89,%l5	! %l5 = ffffffff9c70e91f

p0_label_11:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000003e1, Mem[0000000010001410] = 0000587d
	stha	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 000003e1
!	%l1 = ffffffffffffffff, Mem[0000000010181408] = ded158ff
	stha	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = ded1ffff
!	%l6 = ffffffbf, %l7 = 0000398c, Mem[0000000010181400] = b7473943 16a9e931
	stda	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffffbf 0000398c
!	Mem[0000000010041408] = 1481c8fe, %l5 = 000000009c70e91f
	swapa	[%i1+%o4]0x80,%l5	! %l5 = 000000001481c8fe
!	Mem[0000000010101420] = 2e05d478, %l6 = ffffffbf, %l2 = 00000069
	add	%i4,0x20,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 000000002e05d478
!	%f16 = 97580000 79a79401, Mem[0000000030101400] = 103d4c57 e15edb1b
	stda	%f16,[%i4+%g0]0x89	! Mem[0000000030101400] = 97580000 79a79401
!	%l4 = 162330d8, %l5 = 1481c8fe, Mem[0000000010041408] = 9c70e91f 6b496e57
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 162330d8 1481c8fe
!	%l5 = 000000001481c8fe, Mem[0000000030081408] = 3ed7ec0e119ddb27
	stxa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000001481c8fe
	membar	#Sync			! Added by membar checker (3)
!	%f2  = 51f536de, Mem[00000000300c1408] = 6ecf3e2f
	sta	%f2 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 51f536de
!	Mem[0000000010181430] = 44f79fa4, %l1 = ffffffff, %l1 = ffffffff
	add	%i6,0x30,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 0000000044f79fa4

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 5a8c3e90, %l1 = 0000000044f79fa4
	lduh	[%o2+%g0],%l1		! %l1 = 0000000000005a8c
!	Mem[0000000030101410] = 7d000000, %l3 = 0000000000001fff
	ldswa	[%i4+%o5]0x89,%l3	! %l3 = 000000007d000000
!	Mem[0000000030041400] = 418ed820 f093a61a, %l0 = 000003e1, %l1 = 00005a8c
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 00000000f093a61a 00000000418ed820
!	Mem[0000000010041422] = 4d4d5f58, %l2 = 000000002e05d478
	ldsb	[%i1+0x022],%l2		! %l2 = 000000000000005f
!	Mem[0000000010041410] = 5897d2ac1e8c6c8d, %l5 = 000000001481c8fe, %asi = 80
	ldxa	[%i1+0x010]%asi,%l5	! %l5 = 5897d2ac1e8c6c8d
!	Mem[00000000100c1408] = 5ad810ed ab1b0e46, %l4 = 162330d8, %l5 = 1e8c6c8d
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 000000005ad810ed 00000000ab1b0e46
!	Mem[0000000010141410] = 69000000, %l0 = 00000000f093a61a
	ldsw	[%i5+%o5],%l0		! %l0 = 0000000069000000
!	Mem[0000000010181402] = ffffffbf, %l0 = 0000000069000000, %asi = 80
	lduba	[%i6+0x002]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141400] = 6db58b40, %l0 = 00000000000000ff
	lduwa	[%i5+%g0]0x80,%l0	! %l0 = 000000006db58b40
!	Mem[00000000300c1400] = 00005897, %l7 = 000000000000398c
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 0000000000005897

p0_label_13:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 3192f603 a0582e5d 7f8fe06a de36f551
!	%f0  = 8ceac005 03f69231 51f536de 44f79fa4
!	%f4  = 7ac7378c 4589b1ed 06a2d22a 5144a753
!	%f8  = 4ccc5a38 2b6edb5b 1c534960 031a47f1
!	%f12 = 31e9a916 433947b7 255e0a02 229a38cb
	stda	%f0 ,[%i0+%g0]ASI_BLK_S	! Block Store to 0000000030001400
!	%f28 = 0e35efb4 72c05075, Mem[0000000010101418] = 7bdc1a6a 014ea693, %asi = 80
	stda	%f28,[%i4+0x018]%asi	! Mem[0000000010101418] = 0e35efb4 72c05075
!	%f30 = 1b8e4192 4049981b, %l0 = 000000006db58b40
!	Mem[0000000030041418] = 4b85378c6a5ba4e3
	add	%i1,0x018,%g1
	stda	%f30,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030041418] = 4b85378c6a5ba4e3
!	%f8  = 4ccc5a38 2b6edb5b, %l6 = 7fff20f0ffffffbf
!	Mem[0000000030181400] = 7d205dd030b384a1
	stda	%f8,[%i6+%l6]ASI_PST16_S ! Mem[0000000030181400] = 4ccc5a382b6edb5b
!	%l5 = 00000000ab1b0e46, Mem[0000000030041400] = 1aa693f0
	stba	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 46a693f0
!	%l6 = 7fff20f0ffffffbf, Mem[0000000010181410] = ba8f4a7f
	stwa	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffbf
!	%l0 = 000000006db58b40, Mem[00000000211c0001] = 5a8c3e90
	stb	%l0,[%o2+0x001]		! Mem[00000000211c0000] = 5a403e90
!	%f27 = 711436ff, Mem[0000000030181400] = 4ccc5a38
	sta	%f27,[%i6+%g0]0x81	! Mem[0000000030181400] = 711436ff
!	%l1 = 00000000418ed820, Mem[0000000030041408] = 03ea78ae
	stwa	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 418ed820
!	%l3 = 000000007d000000, Mem[0000000030001410] = 8c37c77a
	stha	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 8c370000

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = b20000000c915c10, %l3 = 000000007d000000
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = b20000000c915c10
!	Mem[00000000100c1408] = 460e1bab ed10d85a, %l6 = ffffffbf, %l7 = 00005897
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000ed10d85a 00000000460e1bab
!	Mem[0000000020800000] = 39175630, %l2 = 000000000000005f, %asi = 80
	ldsha	[%o1+0x000]%asi,%l2	! %l2 = 0000000000003917
!	Mem[0000000010041408] = 162330d81481c8fe, %l6 = 00000000ed10d85a
	ldxa	[%i1+%o4]0x80,%l6	! %l6 = 162330d81481c8fe
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030001400] = 8ceac005, %l2 = 0000000000003917
	ldsha	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffff8cea
!	Mem[0000000030001410] = 8c370000, %l1 = 00000000418ed820
	ldsha	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 1c534960, %l2 = ffffffffffff8cea
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = 0000000000001c53
!	Mem[0000000010101400] = 71f3b304e06a54ff, %f16 = 97580000 79a79401
	ldda	[%i4+%g0]0x88,%f16	! %f16 = 71f3b304 e06a54ff
!	Mem[0000000021800180] = 7c33ade0, %l6 = 162330d81481c8fe, %asi = 80
	ldsba	[%o3+0x180]%asi,%l6	! %l6 = 000000000000007c
!	Mem[0000000030001408] = 51f536de44f79fa4, %f16 = 71f3b304 e06a54ff
	ldda	[%i0+%o4]0x81,%f16	! %f16 = 51f536de 44f79fa4

p0_label_15:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ab1b0e46, Mem[0000000010041400] = 4718a9c0
	stba	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 4618a9c0
!	%l2 = 0000000000001c53, Mem[0000000010081410] = 0c915c10
	stba	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 0c915c53
!	%l0 = 6db58b40, %l1 = 00000000, Mem[0000000030141408] = ff8ede5c 29000000
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 6db58b40 00000000
!	%f12 = 31e9a916 433947b7, %l2 = 0000000000001c53
!	Mem[0000000030101410] = 0000007d38ec5d9d
	add	%i4,0x010,%g1
	stda	%f12,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030101410] = b747394338ec5d9d
!	%l6 = 000000000000007c, Mem[0000000030101410] = b7473943
	stwa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000007c
!	Mem[0000000030101408] = 3b3722ce, %l5 = 00000000ab1b0e46
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 000000003b3722ce
!	Mem[00000000100c141c] = 42f9eeb3, %l7 = 460e1bab, %l0 = 6db58b40
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 0000000042f9eeb3
!	%l2 = 0000000000001c53, Mem[0000000010181408] = ded1ffff
	stha	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = ded11c53
!	Code Fragment 3, seed = 343911
p0_fragment_1:
!	%l0 = 0000000042f9eeb3
	setx	0xf0ea9267ff4c93ee,%g7,%l0 ! %l0 = f0ea9267ff4c93ee
!	%l1 = 0000000000000000
	setx	0x5e24255348299d99,%g7,%l1 ! %l1 = 5e24255348299d99
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f0ea9267ff4c93ee
	setx	0xf3d41cb3467a1354,%g7,%l0 ! %l0 = f3d41cb3467a1354
!	%l1 = 5e24255348299d99
	setx	0x535df4ad955f781f,%g7,%l1 ! %l1 = 535df4ad955f781f
p0_fragment_1_end:
!	%f4  = 7ac7378c 4589b1ed, %l1 = 535df4ad955f781f
!	Mem[0000000030141428] = 6121208645b312bf
	add	%i5,0x028,%g1
	stda	%f4,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030141428] = edb189458c37c77a

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff8f4b1e, %l1 = 535df4ad955f781f
	ldsba	[%i4+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141410] = 6900000029000000, %l1 = ffffffffffffffff
	ldxa	[%i5+%o5]0x80,%l1	! %l1 = 6900000029000000
!	Mem[00000000211c0000] = 5a403e90, %l2 = 0000000000001c53, %asi = 80
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = 0000000000005a40
!	Mem[0000000030041408] = 418ed8203bb5d147, %l5 = 000000003b3722ce
	ldxa	[%i1+%o4]0x81,%l5	! %l5 = 418ed8203bb5d147
!	Mem[0000000030141400] = 70554f1b, %l1 = 6900000029000000
	lduba	[%i5+%g0]0x89,%l1	! %l1 = 000000000000001b
!	Mem[0000000010081400] = 000031920000398c, %f8  = 4ccc5a38 2b6edb5b
	ldda	[%i2+%g0]0x80,%f8 	! %f8  = 00003192 0000398c
!	Mem[0000000010041418] = 57f57e4a, %f14 = 255e0a02
	ld	[%i1+0x018],%f14	! %f14 = 57f57e4a
!	Mem[0000000010101400] = 71f3b304e06a54ff, %f24 = 6b54a048 70c6d239
	ldda	[%i4+%g0]0x88,%f24	! %f24 = 71f3b304 e06a54ff
!	Mem[00000000100c1400] = 2b000069, %l3 = b20000000c915c10
	ldsha	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000069
!	Mem[0000000010041400] = 4618a9c0, %f1  = 03f69231
	lda	[%i1+%g0]0x80,%f1 	! %f1 = 4618a9c0

p0_label_17:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 178420
p0_fragment_2:
!	%l0 = f3d41cb3467a1354
	setx	0xf4996ef9a230e486,%g7,%l0 ! %l0 = f4996ef9a230e486
!	%l1 = 000000000000001b
	setx	0xe144f818889aeab1,%g7,%l1 ! %l1 = e144f818889aeab1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f4996ef9a230e486
	setx	0x3ba7cdd27001b4ec,%g7,%l0 ! %l0 = 3ba7cdd27001b4ec
!	%l1 = e144f818889aeab1
	setx	0x6190aa08da274637,%g7,%l1 ! %l1 = 6190aa08da274637
p0_fragment_2_end:
!	%f26 = 6c60d1c6 711436ff, Mem[0000000030041408] = 20d88e41 47d1b53b
	stda	%f26,[%i1+%o4]0x89	! Mem[0000000030041408] = 6c60d1c6 711436ff
!	%l1 = 6190aa08da274637, Mem[0000000010041400] = d16a2238c0a91846
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 6190aa08da274637
!	Mem[0000000010101408] = 1e4b8fff, %l5 = 418ed8203bb5d147
	ldstuba	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041408] = d8302316, %l7 = 00000000460e1bab
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 00000000d8302316
!	Mem[0000000010141408] = bfffffff, %l7 = 00000000d8302316
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000bf
!	%l0 = 7001b4ec, %l1 = da274637, Mem[00000000300c1408] = 51f536de 07957344
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 7001b4ec da274637
!	%l1 = 6190aa08da274637, Mem[0000000010141408] = ffffffff
	stwa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = da274637
!	Mem[0000000030101408] = 460e1bab, %l6 = 000000000000007c
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 00000000460e1bab
!	%f18 = 2f3ecf6e, Mem[0000000030001410] = 8c370000
	sta	%f18,[%i0+%o5]0x89	! Mem[0000000030001410] = 2f3ecf6e

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 711436ff, %l4 = 000000005ad810ed
	ldswa	[%i1+%o4]0x89,%l4	! %l4 = 00000000711436ff
!	Mem[00000000201c0000] = 33299c00, %l1 = 6190aa08da274637
	ldsh	[%o0+%g0],%l1		! %l1 = 0000000000003329
!	Mem[0000000010141408] = 7fff20f0374627da, %f30 = 1b8e4192 4049981b
	ldda	[%i5+%o4]0x88,%f30	! %f30 = 7fff20f0 374627da
!	Mem[0000000030001410] = edb189452f3ecf6e, %f26 = 6c60d1c6 711436ff
	ldda	[%i0+%o5]0x89,%f26	! %f26 = edb18945 2f3ecf6e
!	Mem[0000000010001408] = 56c5b157 6d6cec77, %l0 = 7001b4ec, %l1 = 00003329
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 0000000056c5b157 000000006d6cec77
!	Mem[0000000010041408] = fec88114 460e1bab, %l0 = 56c5b157, %l1 = 6d6cec77
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000460e1bab 00000000fec88114
!	Mem[0000000010181408] = ded11c53, %l5 = 00000000000000ff
	lduha	[%i6+%o4]0x88,%l5	! %l5 = 0000000000001c53
!	Mem[0000000030181408] = 8e193c2a, %l1 = 00000000fec88114
	ldsha	[%i6+%o4]0x89,%l1	! %l1 = 0000000000003c2a
!	Mem[0000000030001408] = de36f551, %l1 = 0000000000003c2a
	ldswa	[%i0+%o4]0x89,%l1	! %l1 = ffffffffde36f551
!	%f20 = 1fe9709c, %f15 = 229a38cb, %f4  = 7ac7378c
	fadds	%f20,%f15,%f4 		! %f4  = 229dde8d

p0_label_19:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1418] = 612c210a, %l2 = 0000000000005a40
	ldstub	[%i3+0x018],%l2		! %l2 = 0000000000000061
!	Mem[0000000010141438] = 4b62bfa2, %l1 = 00000000de36f551
	swap	[%i5+0x038],%l1		! %l1 = 000000004b62bfa2
!	%f14 = 57f57e4a, %f4  = 229dde8d
	fsqrts	%f14,%f4 		! %f4  = 4bb14408
!	%f16 = 51f536de 44f79fa4, %l3 = 0000000000000069
!	Mem[0000000010081428] = 64ec9cb6230d402f
	add	%i2,0x028,%g1
	stda	%f16,[%g1+%l3]ASI_PST16_P ! Mem[0000000010081428] = 51f59cb6230d9fa4
!	%l1 = 000000004b62bfa2, Mem[0000000030181400] = 711436ff2b6edb5b
	stxa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000004b62bfa2
!	%l1 = 000000004b62bfa2, %l7 = 00000000000000bf, %l5 = 0000000000001c53
	add	%l1,%l7,%l5		! %l5 = 000000004b62c061
!	%f12 = 31e9a916, Mem[0000000010001410] = 000003e1
	sta	%f12,[%i0+%o5]0x88	! Mem[0000000010001410] = 31e9a916
!	%f22 = 7f4a8fba, Mem[0000000010181410] = ffffffbf
	sta	%f22,[%i6+%o5]0x88	! Mem[0000000010181410] = 7f4a8fba
!	%l7 = 00000000000000bf, Mem[0000000010141410] = 0000002900000069
	stxa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000000bf
!	%l4 = 711436ff, %l5 = 4b62c061, Mem[0000000030041410] = dc13b069 fd2ac17f
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 711436ff 4b62c061

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[000000001018143a] = 700f7502, %l7 = 00000000000000bf, %asi = 80
	lduha	[%i6+0x03a]%asi,%l7	! %l7 = 0000000000007502
!	Mem[0000000030041410] = ff361471, %l1 = 000000004b62bfa2
	ldswa	[%i1+%o5]0x81,%l1	! %l1 = ffffffffff361471
!	Mem[00000000211c0000] = 5a403e90, %l1 = ffffffffff361471
	lduh	[%o2+%g0],%l1		! %l1 = 0000000000005a40
!	Mem[0000000010141408] = da274637, %l6 = 00000000460e1bab
	lduh	[%i5+%o4],%l6		! %l6 = 000000000000da27
!	Mem[0000000010181400] = bfffffff, %f1  = 4618a9c0
	lda	[%i6+%g0]0x88,%f1 	! %f1 = bfffffff
!	Mem[0000000010041430] = 05239bc4, %l5 = 000000004b62c061, %asi = 80
	ldswa	[%i1+0x030]%asi,%l5	! %l5 = 0000000005239bc4
!	Mem[0000000030081408] = fec8811400000000, %f18 = 2f3ecf6e 44739507
	ldda	[%i2+%o4]0x89,%f18	! %f18 = fec88114 00000000
!	Mem[0000000030001408] = de36f551, %l1 = 0000000000005a40
	ldsba	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000051
!	Mem[00000000211c0001] = 5a403e90, %l4 = 00000000711436ff
	ldub	[%o2+0x001],%l4		! %l4 = 0000000000000040
!	Mem[0000000030141400] = 70554f1b, %f5  = 4589b1ed
	lda	[%i5+%g0]0x89,%f5 	! %f5 = 70554f1b

p0_label_21:
!	Starting 10 instruction Store Burst
!	%l4 = 00000040, %l5 = 05239bc4, Mem[0000000010181400] = ffffffbf 0000398c, %asi = 80
	stda	%l4,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000040 05239bc4
!	%f22 = 7f4a8fba 3a21b4a3, Mem[0000000010181410] = ba8f4a7f 3a21b4a3, %asi = 80
	stda	%f22,[%i6+0x010]%asi	! Mem[0000000010181410] = 7f4a8fba 3a21b4a3
!	%f24 = 71f3b304 e06a54ff, Mem[0000000010001420] = 5d1fc2f8 1367fc29
	std	%f24,[%i0+0x020]	! Mem[0000000010001420] = 71f3b304 e06a54ff
!	%f10 = 1c534960 031a47f1, Mem[0000000010141428] = 18f1c2d6 549f79cf
	std	%f10,[%i5+0x028]	! Mem[0000000010141428] = 1c534960 031a47f1
!	%f20 = 1fe9709c 57f41cbd, %l7 = 0000000000007502
!	Mem[0000000010081410] = 535c910c000000b2
	add	%i2,0x010,%g1
	stda	%f20,[%g1+%l7]ASI_PST16_P ! Mem[0000000010081410] = 535c910c57f400b2
!	Mem[00000000300c1410] = 1fe9709c, %l4 = 0000000000000040
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 000000000000001f
!	%l4 = 000000000000001f, Mem[0000000010181404] = 05239bc4, %asi = 80
	stba	%l4,[%i6+0x004]%asi	! Mem[0000000010181404] = 1f239bc4
!	%f22 = 7f4a8fba 3a21b4a3, Mem[0000000010101418] = 0e35efb4 72c05075, %asi = 80
	stda	%f22,[%i4+0x018]%asi	! Mem[0000000010101418] = 7f4a8fba 3a21b4a3
!	%l5 = 0000000005239bc4, Mem[0000000010101400] = e06a54ff
	stha	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = e06a9bc4
!	Mem[0000000010001408] = 56c5b157, %l2 = 0000000000000061
	swapa	[%i0+%o4]0x80,%l2	! %l2 = 0000000056c5b157

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 923100004d23d72d, %f10 = 1c534960 031a47f1
	ldda	[%i4+%o5]0x80,%f10	! %f10 = 92310000 4d23d72d
!	Mem[0000000010081414] = 57f400b2, %l6 = 000000000000da27
	ldsw	[%i2+0x014],%l6		! %l6 = 0000000057f400b2
!	Mem[0000000010141410] = bf00000000000000, %l1 = 0000000000000051, %asi = 80
	ldxa	[%i5+0x010]%asi,%l1	! %l1 = bf00000000000000
!	%l0 = 00000000460e1bab, imm = fffffffffffffe7c, %l4 = 000000000000001f
	andn	%l0,-0x184,%l4		! %l4 = 0000000000000183
!	Mem[0000000010001438] = 5ad3c4c200000000, %l0 = 00000000460e1bab, %asi = 80
	ldxa	[%i0+0x038]%asi,%l0	! %l0 = 5ad3c4c200000000
!	Mem[0000000010141400] = 6db58b40, %l6 = 0000000057f400b2
	ldsha	[%i5+%g0]0x80,%l6	! %l6 = 0000000000006db5
!	Mem[0000000030081410] = 3c4a581c, %l2 = 0000000056c5b157
	ldsha	[%i2+%o5]0x89,%l2	! %l2 = 000000000000581c
!	Mem[0000000010081400] = 00003192, %l5 = 0000000005239bc4
	ldsw	[%i2+%g0],%l5		! %l5 = 0000000000003192
!	Mem[0000000010001410] = ffffffff31e9a916, %f28 = 0e35efb4 72c05075
	ldda	[%i0+%o5]0x88,%f28	! %f28 = ffffffff 31e9a916
!	Mem[000000001018141a] = 1b5d5d2a, %l7 = 0000000000007502, %asi = 80
	lduba	[%i6+0x01a]%asi,%l7	! %l7 = 000000000000005d

p0_label_23:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141429] = 1c534960, %l0 = 5ad3c4c200000000
	ldstub	[%i5+0x029],%l0		! %l0 = 0000000000000053
!	%f20 = 1fe9709c, Mem[0000000010101424] = 627cd7a9
	st	%f20,[%i4+0x024]	! Mem[0000000010101424] = 1fe9709c
!	%l6 = 0000000000006db5, Mem[00000000100c1408] = 460e1babed10d85a
	stxa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000006db5
!	%l2 = 0000581c, %l3 = 00000069, Mem[00000000100c1410] = 531e3f6c 1eff2e4d, %asi = 80
	stda	%l2,[%i3+0x010]%asi	! Mem[00000000100c1410] = 0000581c 00000069
!	Mem[00000000211c0001] = 5a403e90, %l2 = 000000000000581c
	ldstub	[%o2+0x001],%l2		! %l2 = 0000000000000040
!	%l5 = 0000000000003192, Mem[0000000010081420] = 51f2ebb82b3e09e9, %asi = 80
	stxa	%l5,[%i2+0x020]%asi	! Mem[0000000010081420] = 0000000000003192
!	%l7 = 000000000000005d, Mem[000000001008141c] = 0000398c, %asi = 80
	stwa	%l7,[%i2+0x01c]%asi	! Mem[000000001008141c] = 0000005d
!	Mem[0000000030141400] = 1b4f5570, %l4 = 0000000000000183
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 000000001b4f5570
!	Mem[0000000030081410] = 1c584a3c, %l3 = 0000000000000069
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 000000000000001c
!	%f4  = 4bb14408, Mem[00000000100c1410] = 1c580000
	sta	%f4 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 4bb14408

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 7dcec3315c8d2639, %f20 = 1fe9709c 57f41cbd
	ldda	[%i5+%o5]0x89,%f20	! %f20 = 7dcec331 5c8d2639
!	Mem[0000000010001438] = 5ad3c4c200000000, %l3 = 000000000000001c
	ldx	[%i0+0x038],%l3		! %l3 = 5ad3c4c200000000
!	Mem[0000000010141414] = 00000000, %l7 = 000000000000005d
	ldub	[%i5+0x014],%l7		! %l7 = 0000000000000000
!	%l0 = 0000000000000053, imm = 0000000000000f2a, %l0 = 0000000000000053
	andn	%l0,0xf2a,%l0		! %l0 = 0000000000000051
!	Mem[0000000030101410] = 9d5dec38 7c000000, %l0 = 00000051, %l1 = 00000000
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 000000007c000000 000000009d5dec38
!	Mem[0000000030081410] = ff584a3c, %l1 = 000000009d5dec38
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = ecb40170, %l0 = 000000007c000000
	ldsba	[%i3+%o4]0x81,%l0	! %l0 = ffffffffffffffec
!	Mem[0000000030001408] = 51f536de, %l6 = 0000000000006db5
	lduha	[%i0+%o4]0x81,%l6	! %l6 = 00000000000051f5
!	Mem[0000000030101410] = 0000007c, %l6 = 00000000000051f5
	ldsha	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010101400] = c49b6ae0 04b3f371 ff8f4b1e 03d913f7
!	Mem[0000000010101410] = 92310000 4d23d72d 7f4a8fba 3a21b4a3
!	Mem[0000000010101420] = 2e05d478 1fe9709c a3b4213a ba8f4a7f
!	Mem[0000000010101430] = 3dcb9ae4 001290e5 1b6c7a42 5ccbc00b
	ldda	[%i4+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010101400

p0_label_25:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffec, %l1 = 000000ff, Mem[0000000030141408] = 408bb56d 00000000
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffec 000000ff
!	Mem[00000000100c1410] = 0844b14b, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000008
!	%f6  = 7f4a8fba 3a21b4a3, Mem[0000000030081410] = ff584a3c 3c630bdd
	stda	%f6 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 7f4a8fba 3a21b4a3
!	%l7 = 0000000000000008, Mem[000000001014142a] = 1cff4960, %asi = 80
	stha	%l7,[%i5+0x02a]%asi	! Mem[0000000010141428] = 1cff0008
!	%l6 = 00000000, %l7 = 00000008, Mem[0000000030101410] = 0000007c 38ec5d9d
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 00000008
!	%l4 = 1b4f5570, %l5 = 00003192, Mem[0000000010041418] = 57f57e4a 3fc28ef3, %asi = 80
	stda	%l4,[%i1+0x018]%asi	! Mem[0000000010041418] = 1b4f5570 00003192
!	Mem[0000000021800040] = 78d716f0, %l5 = 0000000000003192
	ldstub	[%o3+0x040],%l5		! %l5 = 0000000000000078
!	%l2 = 0000000000000040, Mem[000000001018142d] = 58bf97af
	stb	%l2,[%i6+0x02d]		! Mem[000000001018142c] = 584097af
	membar	#Sync			! Added by membar checker (6)
!	%f25 = e06a54ff, Mem[000000001010141c] = 3a21b4a3
	st	%f25,[%i4+0x01c]	! Mem[000000001010141c] = e06a54ff
!	Mem[0000000030181400] = 00000000 4b62bfa2 2a3c198e 79b6e2a7
!	%f16 = 51f536de 44f79fa4 fec88114 00000000
!	%f20 = 7dcec331 5c8d2639 7f4a8fba 3a21b4a3
!	%f24 = 71f3b304 e06a54ff edb18945 2f3ecf6e
!	%f28 = ffffffff 31e9a916 7fff20f0 374627da
	stda	%f16,[%i6+%g0]ASI_BLK_AIUS	! Block Store to 0000000030181400

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = bf000000, %l3 = 5ad3c4c200000000
	lduha	[%i5+%o5]0x80,%l3	! %l3 = 000000000000bf00
!	Mem[0000000030141400] = 00000183 7f3759c1, %l0 = ffffffec, %l1 = 000000ff
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000183 000000007f3759c1
!	Mem[0000000010001408] = 00000061, %l4 = 000000001b4f5570
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000061
!	Mem[0000000010141408] = da274637, %l4 = 0000000000000061
	ldswa	[%i5+%o4]0x80,%l4	! %l4 = ffffffffda274637
	membar	#Sync			! Added by membar checker (7)
!	Mem[000000001018141c] = 22822653, %l7 = 0000000000000008
	ldsw	[%i6+0x01c],%l7		! %l7 = 0000000022822653
!	Mem[00000000300c1400] = 97580000, %f6  = 7f4a8fba
	lda	[%i3+%g0]0x81,%f6 	! %f6 = 97580000
!	Mem[0000000030181408] = fec88114, %l6 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l6	! %l6 = fffffffffec88114
!	Mem[000000001004142a] = 57b1c556, %l6 = fffffffffec88114
	lduh	[%i1+0x02a],%l6		! %l6 = 000000000000c556
!	Mem[00000000100c1410] = ff44b14b, %l6 = 000000000000c556
	lduha	[%i3+%o5]0x80,%l6	! %l6 = 000000000000ff44
!	Mem[0000000010081410] = 535c910c, %l6 = 000000000000ff44
	ldsha	[%i2+%o5]0x80,%l6	! %l6 = 000000000000535c

p0_label_27:
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000535c, Mem[0000000030001408] = de36f551
	stba	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = de36f55c
!	%l1 = 000000007f3759c1, Mem[0000000030001400] = 8ceac005
	stwa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 7f3759c1
!	%l4 = ffffffffda274637, Mem[0000000010001400] = 1c534960
	stba	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 37534960
!	%f19 = 00000000, Mem[0000000010101408] = 1e4b8fff
	sta	%f19,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[00000000211c0001] = 5aff3e90, %l4 = ffffffffda274637
	ldstub	[%o2+0x001],%l4		! %l4 = 00000000000000ff
!	%f2  = ff8f4b1e, Mem[0000000030081400] = 564fdc50
	sta	%f2 ,[%i2+%g0]0x81	! Mem[0000000030081400] = ff8f4b1e
!	Mem[00000000211c0001] = 5aff3e90, %l6 = 000000000000535c
	ldstub	[%o2+0x001],%l6		! %l6 = 00000000000000ff
!	%f8  = 2e05d478, Mem[0000000010101408] = 00000000
	sta	%f8 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 2e05d478
!	Mem[0000000010181420] = 34187d3838e46569, %l2 = 0000000000000040, %l2 = 0000000000000040
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = 34187d3838e46569
!	Mem[00000000300c1410] = 9c70e9ff, %l6 = 00000000000000ff
	ldstuba	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 711436ff, %l7 = 0000000022822653
	lduha	[%i1+%o5]0x89,%l7	! %l7 = 00000000000036ff
!	Mem[0000000010141408] = da274637, %l2 = 34187d3838e46569
	ldsha	[%i5+%o4]0x80,%l2	! %l2 = ffffffffffffda27
!	Mem[0000000030001410] = 2f3ecf6e, %l0 = 0000000000000183
	lduba	[%i0+%o5]0x89,%l0	! %l0 = 000000000000006e
!	Mem[000000001010142c] = ba8f4a7f, %l3 = 000000000000bf00, %asi = 80
	ldsba	[%i4+0x02c]%asi,%l3	! %l3 = ffffffffffffffba
!	Mem[0000000030101408] = 0000007c, %l5 = 0000000000000078
	ldsba	[%i4+%o4]0x89,%l5	! %l5 = 000000000000007c
!	Mem[0000000010081410] = 0c915c53, %l4 = 00000000000000ff
	ldswa	[%i2+%o5]0x88,%l4	! %l4 = 000000000c915c53
!	Mem[0000000010081408] = 45266453, %l2 = ffffffffffffda27
	ldsba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000045
!	Mem[0000000030041400] = 46a693f0, %f25 = e06a54ff
	lda	[%i1+%g0]0x81,%f25	! %f25 = 46a693f0
!	Mem[0000000010041408] = 460e1bab, %l3 = ffffffffffffffba
	lduba	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ab
!	Mem[0000000030141400] = 83010000, %l3 = 00000000000000ab
	ldsha	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000

p0_label_29:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041414] = 1e8c6c8d, %l2 = 0000000000000045, %asi = 80
	swapa	[%i1+0x014]%asi,%l2	! %l2 = 000000001e8c6c8d
!	Mem[0000000010181408] = ded11c53, %l1 = 000000007f3759c1
	ldstuba	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000053
!	Mem[0000000030001400] = c159377f, %l5 = 000000000000007c
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 00000000c159377f
!	%f9  = 1fe9709c, Mem[0000000010101400] = c49b6ae0
	sta	%f9 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 1fe9709c
!	Mem[0000000010101400] = 9c70e91f, %l4 = 000000000c915c53
	ldstuba	[%i4+%g0]0x88,%l4	! %l4 = 000000000000001f
!	%f7  = 3a21b4a3, Mem[0000000010041408] = ab1b0e46
	sta	%f7 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 3a21b4a3
!	%l6 = 000000ff, %l7 = 000036ff, Mem[0000000010041410] = acd29758 45000000
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff 000036ff
!	%f4  = 92310000 4d23d72d, %l1 = 0000000000000053
!	Mem[0000000030101410] = 0000000000000008
	add	%i4,0x010,%g1
	stda	%f4,[%g1+%l1]ASI_PST32_S ! Mem[0000000030101410] = 923100004d23d72d
!	%f18 = fec88114, Mem[0000000010041408] = 3a21b4a3
	sta	%f18,[%i1+%o4]0x80	! Mem[0000000010041408] = fec88114
!	%f12 = 3dcb9ae4 001290e5, %l1 = 0000000000000053
!	Mem[0000000030041408] = ff361471c6d1606c
	add	%i1,0x008,%g1
	stda	%f12,[%g1+%l1]ASI_PST32_S ! Mem[0000000030041408] = 3dcb9ae4001290e5

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 97580000, %l5 = 00000000c159377f
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 0000000000009758
!	Mem[00000000300c1408] = 7001b4ec, %l7 = 00000000000036ff
	lduwa	[%i3+%o4]0x89,%l7	! %l7 = 000000007001b4ec
!	Mem[0000000030101400] = 0194a779, %l0 = 000000000000006e
	ldsba	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000001
!	Mem[0000000010141410] = bf000000, %l3 = 0000000000000000
	lduh	[%i5+%o5],%l3		! %l3 = 000000000000bf00
!	Mem[0000000010001430] = 15d6d164 12bcdd65, %l0 = 00000001, %l1 = 00000053, %asi = 80
	ldda	[%i0+0x030]%asi,%l0	! %l0 = 0000000015d6d164 0000000012bcdd65
!	Mem[0000000030001400] = 7c00000003f69231, %f12 = 3dcb9ae4 001290e5
	ldda	[%i0+%g0]0x81,%f12	! %f12 = 7c000000 03f69231
!	Mem[0000000030181400] = 51f536de 44f79fa4 fec88114 00000000
!	Mem[0000000030181410] = 7dcec331 5c8d2639 7f4a8fba 3a21b4a3
!	Mem[0000000030181420] = 71f3b304 e06a54ff edb18945 2f3ecf6e
!	Mem[0000000030181430] = ffffffff 31e9a916 7fff20f0 374627da
	ldda	[%i6+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030181400
!	Mem[00000000201c0000] = 33299c00, %l0 = 0000000015d6d164, %asi = 80
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 0000000000003329
!	Mem[0000000030001408] = 5cf536de, %l7 = 000000007001b4ec
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 000000000000005c
!	Mem[0000000010141400] = 408bb56d, %l1 = 0000000012bcdd65
	ldsba	[%i5+%g0]0x88,%l1	! %l1 = 000000000000006d

p0_label_31:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000009758, Mem[0000000030081408] = 00000000
	stha	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 97580000
!	Mem[0000000010041408] = fec88114, %l6 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 00000000fec88114
!	%l2 = 000000001e8c6c8d, Mem[00000000211c0000] = 5aff3e90
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 6c8d3e90
!	Mem[0000000030081410] = ba8f4a7f, %l4 = 000000000000001f
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 000000000000007f
!	Mem[0000000030001408] = de36f55c, %l2 = 000000001e8c6c8d
	swapa	[%i0+%o4]0x89,%l2	! %l2 = 00000000de36f55c
!	%l2 = 00000000de36f55c, Mem[00000000201c0001] = 33299c00, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = 335c9c00
!	Mem[00000000100c1410] = 4bb144ff, %l4 = 000000000000007f
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000fec88114, Mem[000000001010143c] = 5ccbc00b, %asi = 80
	stwa	%l6,[%i4+0x03c]%asi	! Mem[000000001010143c] = fec88114
!	Mem[0000000010101428] = a3b4213aba8f4a7f, %l0 = 0000000000003329, %l1 = 000000000000006d
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = a3b4213aba8f4a7f
!	%l3 = 000000000000bf00, Mem[0000000010101418] = 7f4a8fbae06a54ff, %asi = 80
	stxa	%l3,[%i4+0x018]%asi	! Mem[0000000010101418] = 000000000000bf00

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041416] = ff360000, %l6 = 00000000fec88114, %asi = 80
	lduba	[%i1+0x016]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800041] = 28f48c60, %l5 = 0000000000009758, %asi = 80
	lduba	[%o1+0x041]%asi,%l5	! %l5 = 00000000000000f4
!	Mem[0000000030141408] = ffffffec, %l0 = 0000000000003329
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 000000000000ffff
!	Mem[00000000100c1410] = ff44b14b, %l6 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l6	! %l6 = 000000000000ff44
!	Mem[00000000100c1400] = 9140f76f2b000069, %l5 = 00000000000000f4
	ldxa	[%i3+%g0]0x88,%l5	! %l5 = 9140f76f2b000069
!	Mem[0000000010141410] = bf00000000000000, %l4 = 00000000000000ff
	ldx	[%i5+%o5],%l4		! %l4 = bf00000000000000
!	Mem[00000000300c1400] = 00005897, %l5 = 9140f76f2b000069
	ldsba	[%i3+%g0]0x89,%l5	! %l5 = ffffffffffffff97
!	Mem[0000000010141400] = 408bb56d, %l6 = 000000000000ff44
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = ffffffffffffb56d
!	Mem[0000000010101412] = 92310000, %l1 = a3b4213aba8f4a7f, %asi = 80
	lduha	[%i4+0x012]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 97580000 79a79401, %l0 = 0000ffff, %l1 = 00000000
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 0000000097580000 0000000079a79401

p0_label_33:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000de36f55c, Mem[0000000010101408] = 78d4052e
	stba	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 78d4055c
!	%f12 = 16a9e931 ffffffff, Mem[0000000010101408] = 78d4055c f713d903
	stda	%f12,[%i4+%o4]0x88	! Mem[0000000010101408] = 16a9e931 ffffffff
!	%f0  = a49ff744 de36f551, Mem[0000000010081408] = 53642645 37a07f0e
	stda	%f0 ,[%i2+%o4]0x88	! Mem[0000000010081408] = a49ff744 de36f551
!	%l4 = 00000000, %l5 = ffffff97, Mem[0000000010141400] = 6db58b40 149cd651
	stda	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 ffffff97
!	Mem[0000000030001408] = 8d6c8c1e, %l2 = 00000000de36f55c
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 000000008d6c8c1e
!	%f26 = edb18945, Mem[0000000010181408] = ded11cff
	sta	%f26,[%i6+%o4]0x88	! Mem[0000000010181408] = edb18945
!	%f5  = 31c3ce7d, Mem[0000000010001424] = e06a54ff
	st	%f5 ,[%i0+0x024]	! Mem[0000000010001424] = 31c3ce7d
!	%f24 = 71f3b304 46a693f0, Mem[0000000010081410] = 535c910c 57f400b2
	std	%f24,[%i2+%o5]		! Mem[0000000010081410] = 71f3b304 46a693f0
!	%l6 = ffffb56d, %l7 = 0000005c, Mem[0000000010101418] = 00000000 0000bf00
	std	%l6,[%i4+0x018]		! Mem[0000000010101418] = ffffb56d 0000005c
!	%l5 = ffffffffffffff97, Mem[0000000010041408] = 000000ff1481c8fe
	stxa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffffffffff97

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = a49ff744de36f551, %l3 = 000000000000bf00
	ldxa	[%i2+%o4]0x88,%l3	! %l3 = a49ff744de36f551
!	Mem[00000000100c1410] = ff44b14b, %l7 = 000000000000005c
	ldsba	[%i3+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Code Fragment 4, seed = 590144
p0_fragment_3:
!	%l0 = 0000000097580000
	setx	0xb57c9660e2b4ae26,%g7,%l0 ! %l0 = b57c9660e2b4ae26
!	%l1 = 0000000079a79401
	setx	0xe961044904cd0251,%g7,%l1 ! %l1 = e961044904cd0251
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b57c9660e2b4ae26
	setx	0x031e49f3b128ba8c,%g7,%l0 ! %l0 = 031e49f3b128ba8c
!	%l1 = e961044904cd0251
	setx	0xae09f65aa347d9d7,%g7,%l1 ! %l1 = ae09f65aa347d9d7
p0_fragment_3_end:
!	Mem[0000000010001430] = 15d6d164, %l4 = bf00000000000000, %asi = 80
	lduwa	[%i0+0x030]%asi,%l4	! %l4 = 0000000015d6d164
!	Mem[0000000010181408] = 4589b1ed, %f31 = 374627da
	lda	[%i6+%o4]0x80,%f31	! %f31 = 4589b1ed
!	Mem[0000000010081400] = 000031920000398c, %f12 = 16a9e931 ffffffff
	ldda	[%i2+%g0]0x80,%f12	! %f12 = 00003192 0000398c
!	Mem[0000000010101400] = ffe9709c 04b3f371, %l2 = 8d6c8c1e, %l3 = de36f551
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 00000000ffe9709c 0000000004b3f371
!	Mem[0000000010041410] = ff000000, %l3 = 0000000004b3f371
	lduwa	[%i1+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010101400] = ffe9709c, %l2 = 00000000ffe9709c
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 000000000000ffe9
!	Mem[0000000030041400] = f093a646, %f18 = fec88114
	lda	[%i1+%g0]0x89,%f18	! %f18 = f093a646

p0_label_35:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = bf000000, %l0 = 00000000b128ba8c
	swapa	[%i5+%o5]0x80,%l0	! %l0 = 00000000bf000000
!	%l3 = 00000000ff000000, Mem[0000000010141408] = da274637
	stba	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 00274637
!	Mem[00000000300c1400] = 97580000, %l7 = 00000000ffffffff
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 0000000097580000
!	Mem[0000000021800141] = 354e97b0, %l0 = 00000000bf000000
	ldstub	[%o3+0x141],%l0		! %l0 = 000000000000004e
!	Mem[0000000030001400] = 7c000000 03f69231 de36f55c 44f79fa4
!	%f0  = a49ff744 de36f551 00000000 1481c8fe
!	%f4  = 39268d5c 31c3ce7d a3b4213a ba8f4a7f
!	%f8  = ff546ae0 04b3f371 6ecf3e2f 4589b1ed
!	%f12 = 00003192 0000398c da274637 f020ff7f
	stda	%f0 ,[%i0+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	%l6 = ffffffffffffb56d, Mem[0000000010101426] = 1fe9709c, %asi = 80
	stha	%l6,[%i4+0x026]%asi	! Mem[0000000010101424] = 1fe9b56d
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010001430] = 15d6d16412bcdd65, %l3 = 00000000ff000000, %l6 = ffffffffffffb56d
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = 15d6d16412bcdd65
!	%l7 = 0000000097580000, Mem[0000000010081400] = 8c39000092310000
	stxa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000097580000
!	Mem[0000000030041410] = ff361471, %l4 = 0000000015d6d164
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l6 = 15d6d16412bcdd65, Mem[0000000010081408] = 51f536de
	stba	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 65f536de

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 7c000000 72eefee7, %l4 = 000000ff, %l5 = ffffff97
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 000000007c000000 0000000072eefee7
!	Mem[0000000010041410] = ff000000, %l1 = ae09f65aa347d9d7
	lduha	[%i1+%o5]0x80,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010001410] = ffffffff31e9a916, %f16 = 51f536de 44f79fa4
	ldda	[%i0+%o5]0x88,%f16	! %f16 = ffffffff 31e9a916
!	Mem[0000000010101408] = ffffffff, %l2 = 000000000000ffe9
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	%f10 = 6ecf3e2f, %f23 = 3a21b4a3, %f18 = f093a646
	fmuls	%f10,%f23,%f18		! %f18 = 6982e857
!	Mem[0000000010001408] = 61000000, %l0 = 000000000000004e
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 46a693f0, %l1 = 000000000000ff00
	ldswa	[%i1+%g0]0x81,%l1	! %l1 = 0000000046a693f0
!	Mem[0000000010081410] = 71f3b30446a693f0, %l2 = ffffffffffffffff, %asi = 80
	ldxa	[%i2+0x010]%asi,%l2	! %l2 = 71f3b30446a693f0
!	Mem[0000000010001408] = 00000061, %l6 = 15d6d16412bcdd65
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000061
!	Mem[0000000030141408] = ffffffec, %l2 = 71f3b30446a693f0
	lduwa	[%i5+%o4]0x81,%l2	! %l2 = 00000000ffffffec

p0_label_37:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 00000183, %l0 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l7 = 0000000097580000, Mem[0000000010041408] = ffffffff
	stha	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000ffff
!	%f30 = 7fff20f0 4589b1ed, Mem[0000000010101400] = ffe9709c 04b3f371
	stda	%f30,[%i4+%g0]0x80	! Mem[0000000010101400] = 7fff20f0 4589b1ed
!	Mem[0000000010141400] = 00000000, %l7 = 0000000097580000
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010041439] = 29e04a22, %asi = 80
	stba	%l7,[%i1+0x039]%asi	! Mem[0000000010041438] = 29004a22
!	Mem[0000000010001410] = 16a9e931, %l1 = 0000000046a693f0
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 0000000016a9e931
!	%l0 = 0000000000000000, Mem[0000000010101408] = ffffffff
	stwa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Mem[00000000100c1408] = b56d0000, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000b5
!	%l3 = 00000000ff000000, Mem[0000000030081408] = 00005897
	stha	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%f20 = 7dcec331 5c8d2639, Mem[0000000010081438] = 6b433f82 7aeb284b
	std	%f20,[%i2+0x038]	! Mem[0000000010081438] = 7dcec331 5c8d2639

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 71f3b30446a693f0, %f12 = 00003192 0000398c
	ldda	[%i2+%o5]0x80,%f12	! %f12 = 71f3b304 46a693f0
!	Mem[0000000030181410] = 7dcec331 5c8d2639, %l4 = 7c000000, %l5 = 72eefee7
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 000000007dcec331 000000005c8d2639
!	Mem[0000000010001408] = 61000000, %l1 = 0000000016a9e931
	ldswa	[%i0+%o4]0x88,%l1	! %l1 = 0000000061000000
!	Mem[0000000030101400] = 9758000079a79401, %l5 = 000000005c8d2639
	ldxa	[%i4+%g0]0x89,%l5	! %l5 = 9758000079a79401
!	Mem[00000000100c1400] = 2b000069, %l2 = 00000000ffffffec
	lduwa	[%i3+%g0]0x88,%l2	! %l2 = 000000002b000069
!	%l2 = 000000002b000069, %l2 = 000000002b000069, %l6 = 0000000000000061
	xnor	%l2,%l2,%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030001408] = 1481c8fe, %l3 = 00000000ff000000
	lduba	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000fe
!	Mem[0000000030141400] = 830100ff, %l5 = 9758000079a79401
	ldsba	[%i5+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081400] = 0000589700000000, %l5 = ffffffffffffffff
	ldxa	[%i2+%g0]0x80,%l5	! %l5 = 0000589700000000
!	Mem[0000000030001410] = 31c3ce7d, %l7 = 00000000000000b5
	lduwa	[%i0+%o5]0x89,%l7	! %l7 = 0000000031c3ce7d

p0_label_39:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 1e4b8fff, %l0 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%l1 = 0000000061000000, imm = fffffffffffff100, %l5 = 0000589700000000
	add	%l1,-0xf00,%l5		! %l5 = 0000000060fff100
!	%l5 = 0000000060fff100, Mem[0000000030041400] = 46a693f0
	stwa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 60fff100
!	Mem[0000000010101410] = 92310000, %l3 = 00000000000000fe
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 0000000092310000
!	%l0 = 000000ff, %l1 = 61000000, Mem[00000000300c1410] = ffe9709c 57f41cbd
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff 61000000
!	%f11 = 4589b1ed, %f28 = ffffffff, %f27 = 2f3ecf6e
	fmuls	%f11,%f28,%f27		! %f27 = ffffffff
!	%f5  = 31c3ce7d, %f30 = 7fff20f0
	fsqrts	%f5 ,%f30		! %f30 = 389e5052
!	%l3 = 0000000092310000, Mem[0000000010081408] = 65f536de
	stha	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 000036de
!	%l1 = 0000000061000000, Mem[0000000010141410] = b128ba8c00000000
	stxa	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000061000000
!	%l2 = 000000002b000069, Mem[0000000010081400] = 97580000
	stwa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 2b000069

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = de36f551 00ee13eb, %l6 = ffffffff, %l7 = 31c3ce7d, %asi = 80
	ldda	[%i5+0x038]%asi,%l6	! %l6 = 00000000de36f551 0000000000ee13eb
!	Mem[0000000010141410] = 00000000, %l3 = 0000000092310000
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = 92310000, %l0 = 00000000000000ff
	lduha	[%i4+%o5]0x81,%l0	! %l0 = 0000000000009231
!	Mem[0000000010101400] = f020ff7f, %l7 = 0000000000ee13eb
	ldsha	[%i4+%g0]0x88,%l7	! %l7 = ffffffffffffff7f
!	Mem[0000000010141410] = 00000000, %l4 = 000000007dcec331
	ldsba	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff, %l4 = 0000000000000000
	ldsha	[%i3+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141408] = ecffffff, %l4 = ffffffffffffffff
	ldsba	[%i5+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101400] = 79a79401, %l0 = 0000000000009231
	lduha	[%i4+%g0]0x89,%l0	! %l0 = 0000000000009401
!	Mem[0000000010181421] = 34187d38, %l0 = 0000000000009401, %asi = 80
	lduba	[%i6+0x021]%asi,%l0	! %l0 = 0000000000000018
!	Mem[0000000030141408] = ffffffec, %l2 = 000000002b000069
	ldswa	[%i5+%o4]0x81,%l2	! %l2 = ffffffffffffffec

p0_label_41:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 60fff100 20d88e41 3dcb9ae4 001290e5
!	%f0  = a49ff744 de36f551 00000000 1481c8fe
!	%f4  = 39268d5c 31c3ce7d a3b4213a ba8f4a7f
!	%f8  = ff546ae0 04b3f371 6ecf3e2f 4589b1ed
!	%f12 = 71f3b304 46a693f0 da274637 f020ff7f
	stda	%f0 ,[%i1+%g0]ASI_COMMIT_S	! Block Store to 0000000030041400
!	%f0  = a49ff744, Mem[00000000100c1410] = 4bb144ff
	sta	%f0 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = a49ff744
!	Mem[0000000030081410] = ff4a8fba, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (9)
!	%f19 = 00000000, Mem[0000000010041410] = ff000000
	st	%f19,[%i1+%o5]		! Mem[0000000010041410] = 00000000
!	%l0 = 0000000000000018, Mem[0000000010001408] = 61000000
	stwa	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000018
!	%l2 = ffffffec, %l3 = 000000ff, Mem[0000000030001400] = de36f551 a49ff744
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffec 000000ff
!	%f26 = edb18945 ffffffff, Mem[0000000010001408] = 18000000 6d6cec77
	stda	%f26,[%i0+%o4]0x80	! Mem[0000000010001408] = edb18945 ffffffff
!	Mem[0000000030181400] = de36f551, %l4 = 00000000ffffffff
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 00000000de36f551
!	Mem[00000000300c1408] = ecb40170, %l1 = 0000000061000000
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ecb40170
!	Mem[0000000030141408] = ffffffec, %l4 = 00000000de36f551
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 00000000000000ff

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 44f79fa4, %l5 = 0000000060fff100
	lduha	[%i3+%o5]0x80,%l5	! %l5 = 00000000000044f7
!	Mem[0000000010181400] = 40000000, %l1 = 00000000ecb40170
	ldsha	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = fec88114, %f10 = 6ecf3e2f
	lda	[%i0+%o4]0x81,%f10	! %f10 = fec88114
!	Mem[0000000010181400] = 40000000, %l1 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 2b000069, %l5 = 00000000000044f7
	lduba	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000069
!	Mem[00000000211c0000] = 6c8d3e90, %l4 = 00000000000000ff
	ldsh	[%o2+%g0],%l4		! %l4 = 0000000000006c8d
!	Mem[000000001004142a] = 57b1c556, %l7 = ffffffffffffff7f, %asi = 80
	lduba	[%i1+0x02a]%asi,%l7	! %l7 = 00000000000000c5
!	Mem[00000000100c140a] = ff6d0000, %l3 = 00000000000000ff, %asi = 80
	ldsha	[%i3+0x00a]%asi,%l3	! %l3 = 0000000000000000
!	%f19 = 00000000, %f9  = 04b3f371, %f13 = 46a693f0
	fdivs	%f19,%f9 ,%f13		! %f13 = 00000000
!	Mem[0000000010081400] = 6900002b 00000000 000036de 44f79fa4
!	Mem[0000000010081410] = 71f3b304 46a693f0 00000000 0000005d
!	Mem[0000000010081420] = 00000000 00003192 51f59cb6 230d9fa4
!	Mem[0000000010081430] = 6dab5624 5f055725 7dcec331 5c8d2639
	ldda	[%i2+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010081400

p0_label_43:
!	Starting 10 instruction Store Burst
!	%l0 = 00000018, %l1 = 00000000, Mem[0000000010181400] = 00000040 1f239bc4
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000018 00000000
!	%l0 = 0000000000000018, Mem[0000000020800040] = 28f48c60
	sth	%l0,[%o1+0x040]		! Mem[0000000020800040] = 00188c60
!	%l6 = de36f551, %l7 = 000000c5, Mem[0000000030081410] = ff4a8fba 3a21b4a3
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = de36f551 000000c5
!	%f29 = 31e9a916, %f12 = 6dab5624, %f28 = ffffffff
	fsubs	%f29,%f12,%f28		! %f28 = edab5624
!	Mem[0000000010101408] = 00000000, %l7 = 00000000000000c5
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%f30 = 389e5052 4589b1ed, %l5 = 0000000000000069
!	Mem[0000000010001420] = 71f3b30431c3ce7d
	add	%i0,0x020,%g1
	stda	%f30,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010001420] = edf3b34531509e7d
!	%l4 = 0000000000006c8d, imm = fffffffffffff14b, %l6 = 00000000de36f551
	xnor	%l4,-0xeb5,%l6		! %l6 = 0000000000006239
!	%l7 = 0000000000000000, Mem[0000000021800140] = 35ff97b0
	sth	%l7,[%o3+0x140]		! Mem[0000000021800140] = 000097b0
!	%f29 = 31e9a916, %f11 = 230d9fa4
	fcmpes	%fcc0,%f29,%f11		! %fcc0 = 2
!	%l2 = ffffffffffffffec, Mem[00000000300c1410] = 000000ff
	stwa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffec

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[000000001010143c] = fec88114, %l0 = 0000000000000018, %asi = 80
	ldsba	[%i4+0x03c]%asi,%l0	! %l0 = fffffffffffffffe
!	Mem[0000000010081408] = 000036de 44f79fa4, %l6 = 00006239, %l7 = 00000000
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000000036de 0000000044f79fa4
!	Mem[0000000010181410] = 7f4a8fba, %l1 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l1	! %l1 = 0000000000007f4a
!	Mem[0000000010141400] = ff000000ffffff97, %f30 = 389e5052 4589b1ed
	ldda	[%i5+%g0]0x80,%f30	! %f30 = ff000000 ffffff97
!	Mem[0000000010041408] = 0000ffff, %l3 = 0000000000000000
	lduha	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = ffff0000, %l2 = ffffffffffffffec
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l5 = 0000000000000069, Mem[0000000010041410] = 00000000
	stha	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000069
!	Mem[00000000300c1408] = da27463700000061, %f30 = ff000000 ffffff97
	ldda	[%i3+%o4]0x89,%f30	! %f30 = da274637 00000061
!	Mem[0000000010041418] = 1b4f5570, %l5 = 0000000000000069
	lduw	[%i1+0x018],%l5		! %l5 = 000000001b4f5570
!	Mem[0000000010001410] = f093a646, %l7 = 0000000044f79fa4
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000046

p0_label_45:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (10)
!	%l4 = 0000000000006c8d, Mem[0000000010081430] = 6dab5624
	stw	%l4,[%i2+0x030]		! Mem[0000000010081430] = 00006c8d
!	%l1 = 0000000000007f4a, Mem[0000000010001400] = 60495337
	stha	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 60497f4a
!	%l3 = 0000000000000000, Mem[00000000211c0000] = 6c8d3e90, %asi = 80
	stba	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 008d3e90
!	Mem[0000000010181400] = 18000000, %l0 = 00000000fffffffe
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 0000000018000000
!	Mem[0000000030101408] = 0000007c, %l7 = 0000000000000046
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 000000000000007c
!	Mem[0000000010141408] = 00274637, %l6 = 00000000000036de
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081438] = 7dcec331, %l0 = 18000000, %l5 = 1b4f5570
	add	%i2,0x38,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 000000007dcec331
!	Mem[0000000010041410] = 69000000, %l4 = 0000000000006c8d
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 0000000069000000
!	Mem[0000000010101400] = 7fff20f0, %l7 = 000000000000007c
	ldstuba	[%i4+%g0]0x80,%l7	! %l7 = 000000000000007f
!	%l4 = 0000000069000000, Mem[00000000201c0001] = 335c9c00
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = 33009c00

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081428] = 51f59cb6230d9fa4, %f20 = 7dcec331 5c8d2639
	ldd	[%i2+0x028],%f20	! %f20 = 51f59cb6 230d9fa4
!	Mem[0000000010001408] = 4589b1ed, %l3 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l3	! %l3 = 000000004589b1ed
!	Mem[0000000030181400] = ffffffff, %l3 = 000000004589b1ed
	lduha	[%i6+%g0]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010181410] = 7f4a8fba 3a21b4a3, %l0 = 18000000, %l1 = 00007f4a
	ldd	[%i6+%o5],%l0		! %l0 = 000000007f4a8fba 000000003a21b4a3
!	Mem[0000000010181408] = edb18945, %l4 = 0000000069000000
	ldswa	[%i6+%o4]0x88,%l4	! %l4 = ffffffffedb18945
!	Mem[0000000010041410] = 000036ff 8d6c0000, %l6 = 00000000, %l7 = 0000007f
	ldda	[%i1+%o5]0x88,%l6	! %l6 = 000000008d6c0000 00000000000036ff
!	Mem[0000000030181400] = ffffffff, %l2 = 0000000000000000
	lduba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081408] = de360000, %l5 = 000000007dcec331
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = ffffffffde360000
!	Mem[0000000010101420] = 2e05d478, %l1 = 000000003a21b4a3
	ldsh	[%i4+0x020],%l1		! %l1 = 0000000000002e05
!	Mem[0000000010081410] = 04b3f371, %l0 = 000000007f4a8fba
	ldsha	[%i2+%o5]0x88,%l0	! %l0 = fffffffffffff371

p0_label_47:
!	Starting 10 instruction Store Burst
!	%f18 = 6982e857, Mem[0000000010181400] = fffffffe
	sta	%f18,[%i6+%g0]0x88	! Mem[0000000010181400] = 6982e857
!	%f28 = edab5624 31e9a916, Mem[0000000010101410] = fe000000 2dd7234d
	stda	%f28,[%i4+%o5]0x88	! Mem[0000000010101410] = edab5624 31e9a916
!	%l1 = 0000000000002e05, %l1 = 0000000000002e05, %l7 = 00000000000036ff
	addc	%l1,%l1,%l7		! %l7 = 0000000000005c0a
!	%l6 = 000000008d6c0000, Mem[0000000010001400] = 4a7f4960
	stha	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00004960
!	%f27 = ffffffff, Mem[0000000030001400] = ecffffff
	sta	%f27,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffff
!	%f28 = edab5624, Mem[0000000030101410] = 00003192
	sta	%f28,[%i4+%o5]0x89	! Mem[0000000030101410] = edab5624
!	Mem[0000000030181400] = ffffffff, %l6 = 000000008d6c0000
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l4 = ffffffffedb18945, Mem[00000000300c1408] = 61000000
	stba	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 45000000
!	%l1 = 0000000000002e05, Mem[0000000020800041] = 00188c60, %asi = 80
	stba	%l1,[%o1+0x041]%asi	! Mem[0000000020800040] = 00058c60
!	%f14 = 7dcec331 5c8d2639, Mem[0000000010001408] = 4589b1ed ffffffff
	stda	%f14,[%i0+%o4]0x88	! Mem[0000000010001408] = 7dcec331 5c8d2639

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff000000, %f12 = 6dab5624
	lda	[%i4+%o4]0x80,%f12	! %f12 = ff000000
!	%l2 = 00000000000000ff, immd = 000000b7, %y  = 00000000
	udiv	%l2,0x0b7,%l1		! %l1 = 0000000000000001
	mov	%l0,%y			! %y = fffff371
!	Mem[000000001014142c] = 031a47f1, %l0 = fffffffffffff371, %asi = 80
	ldswa	[%i5+0x02c]%asi,%l0	! %l0 = 00000000031a47f1
!	Mem[0000000010141408] = 374627ff, %l2 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = 00000000374627ff
!	Mem[000000001014143c] = 00ee13eb, %l5 = ffffffffde360000
	lduh	[%i5+0x03c],%l5		! %l5 = 00000000000000ee
!	Mem[0000000010041408] = ffff0000, %f21 = 230d9fa4
	lda	[%i1+%o4]0x88,%f21	! %f21 = ffff0000
!	Mem[0000000030181410] = 31c3ce7d, %l0 = 00000000031a47f1
	ldsha	[%i6+%o5]0x89,%l0	! %l0 = ffffffffffffce7d
!	Mem[00000000100c1408] = ff6d000000000000, %l3 = 000000000000ffff
	ldxa	[%i3+%o4]0x80,%l3	! %l3 = ff6d000000000000
!	Mem[000000001010143c] = fec88114, %l2 = 00000000374627ff, %asi = 80
	ldsba	[%i4+0x03c]%asi,%l2	! %l2 = fffffffffffffffe
!	Mem[00000000201c0000] = 33009c00, %l6 = 00000000000000ff
	ldsh	[%o0+%g0],%l6		! %l6 = 0000000000003300

p0_label_49:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 51f536de, %l5 = 00000000000000ee
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000de
!	%l5 = 00000000000000de, Mem[0000000030181410] = 7dcec331
	stwa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000de
!	%f14 = 7dcec331 5c8d2639, Mem[0000000030101410] = edab5624 2dd7234d
	stda	%f14,[%i4+%o5]0x89	! Mem[0000000030101410] = 7dcec331 5c8d2639
!	Mem[0000000010101408] = 000000ff, %l0 = 00000000ffffce7d
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l6 = 0000000000003300, Mem[0000000010041408] = ffff0000
	stba	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff0000
!	%l0 = 00000000000000ff, Mem[0000000010101405] = 4589b1ed, %asi = 80
	stba	%l0,[%i4+0x005]%asi	! Mem[0000000010101404] = 45ffb1ed
!	Mem[0000000030141400] = 830100ff, %l7 = 0000000000005c0a
	swapa	[%i5+%g0]0x89,%l7	! %l7 = 00000000830100ff
!	Mem[0000000030181410] = 000000de, %l4 = ffffffffedb18945
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081428] = 51f59cb6, %l6 = 0000000000003300
	swap	[%i2+0x028],%l6		! %l6 = 0000000051f59cb6
!	%l0 = 00000000000000ff, Mem[0000000010181408] = edb18945
	stha	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = edb100ff

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00006c8d, %l3 = ff6d000000000000, %asi = 80
	ldswa	[%i1+0x010]%asi,%l3	! %l3 = 0000000000006c8d
!	Mem[0000000010141400] = ff000000ffffff97, %f28 = edab5624 31e9a916
	ldda	[%i5+%g0]0x80,%f28	! %f28 = ff000000 ffffff97
!	Mem[0000000010101410] = 16a9e931, %l4 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l4	! %l4 = 0000000016a9e931
!	Mem[00000000201c0001] = 33009c00, %l2 = fffffffffffffffe, %asi = 80
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 51f536de44f79fa4, %l3 = 0000000000006c8d
	ldxa	[%i1+%g0]0x89,%l3	! %l3 = 51f536de44f79fa4
!	Mem[0000000010141408] = 374627ff, %f29 = ffffff97
	lda	[%i5+%o4]0x88,%f29	! %f29 = 374627ff
!	Mem[0000000021800141] = 000097b0, %l5 = 00000000000000de
	ldub	[%o3+0x141],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141410] = 0000000061000000, %f8  = 00000000 00003192, %asi = 80
	ldda	[%i5+0x010]%asi,%f8 	! %f8  = 00000000 61000000
!	Mem[0000000010181430] = 44f79fa4, %l0 = 00000000000000ff
	lduh	[%i6+0x030],%l0		! %l0 = 00000000000044f7
!	Mem[0000000010041416] = ff360000, %l3 = 51f536de44f79fa4, %asi = 80
	ldsba	[%i1+0x016]%asi,%l3	! %l3 = 0000000000000000

p0_label_51:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ffffffff, %l1 = 0000000000000001
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000211c0000] = 008d3e90, %l0 = 00000000000044f7
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = 6900002b, %l1 = 00000000, %l0 = 00000000
	casa	[%i2]0x80,%l1,%l0	! %l0 = 000000006900002b
!	Mem[0000000030101410] = 5c8d2639, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000039
!	%l0 = 000000006900002b, imm = 000000000000046c, %l7 = 00000000830100ff
	andn	%l0,0x46c,%l7		! %l7 = 0000000069000003
!	Mem[0000000010141408] = ff274637, %l7 = 0000000069000003
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001400] = ffffffff, %l4 = 0000000016a9e931
	swapa	[%i0+%g0]0x89,%l4	! %l4 = 00000000ffffffff
!	%l7 = 00000000000000ff, Mem[0000000030081410] = 51f536ff
	stwa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	Mem[00000000211c0001] = ff8d3e90, %l4 = 00000000ffffffff
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 000000000000008d

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ffffffff, %f21 = ffff0000
	lda	[%i6+%g0]0x89,%f21	! %f21 = ffffffff
!	Mem[0000000010181400] = 6982e857, %l2 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l2	! %l2 = 000000006982e857
!	Mem[0000000030081400] = ff8f4b1e, %l2 = 000000006982e857
	lduba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = 7dcec3315c8d2639, %f24 = 71f3b304 46a693f0
	ldda	[%i5+%o5]0x89,%f24	! %f24 = 7dcec331 5c8d2639
!	Mem[000000001004141c] = 00003192, %l5 = 0000000000000000
	ldsw	[%i1+0x01c],%l5		! %l5 = 0000000000003192
!	Mem[0000000010141400] = ff000000ffffff97, %f16 = ffffffff 31e9a916
	ldda	[%i5+%g0]0x80,%f16	! %f16 = ff000000 ffffff97
!	Mem[0000000030141400] = 00005c0a, %l7 = 00000000000000ff
	lduwa	[%i5+%g0]0x89,%l7	! %l7 = 0000000000005c0a
!	Mem[00000000100c1406] = 6ff74091, %l5 = 0000000000003192
	lduh	[%i3+0x006],%l5		! %l5 = 0000000000004091
!	Mem[0000000030181400] = ffffffff, %l7 = 0000000000005c0a
	ldsba	[%i6+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181410] = 7f4a8fba, %l2 = 00000000000000ff
	ldswa	[%i6+%o5]0x80,%l2	! %l2 = 000000007f4a8fba

p0_label_53:
!	Starting 10 instruction Store Burst
!	%f16 = ff000000 ffffff97, %l5 = 0000000000004091
!	Mem[0000000030101438] = 56e24ef2711593fb
	add	%i4,0x038,%g1
	stda	%f16,[%g1+%l5]ASI_PST16_S ! Mem[0000000030101438] = 56e24ef27115ff97
!	%f24 = 7dcec331 5c8d2639, %l1 = 0000000000000000
!	Mem[00000000100c1438] = 2594a4e25c881c2b
	add	%i3,0x038,%g1
	stda	%f24,[%g1+%l1]ASI_PST8_PL ! Mem[00000000100c1438] = 2594a4e25c881c2b
!	%l6 = 0000000051f59cb6, Mem[0000000010041400] = 374627da08aa9061
	stxa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000051f59cb6
!	%l3 = 0000000000000039, Mem[0000000010181400] = 57e8826900000000
	stxa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000039
!	Mem[0000000030181410] = ff0000de, %l3 = 0000000000000039
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = a49ff744, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 00000000000000a4
!	Mem[0000000010081400] = 2b000069, %l7 = 00000000ffffffff
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 000000002b000069
!	%l4 = 0000008d, %l5 = 00004091, Mem[0000000010041400] = 00000000 b69cf551
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000008d 00004091
!	%l6 = 0000000051f59cb6, Mem[0000000030081400] = 1e4b8fff
	stha	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 1e4b9cb6
!	%l0 = 000000006900002b, Mem[000000001010141b] = ffffb56d, %asi = 80
	stba	%l0,[%i4+0x01b]%asi	! Mem[0000000010101418] = ffffb52b

p0_label_54:
!	Starting 10 instruction Load Burst
!	%l1 = 00000000000000a4, %l2 = 000000007f4a8fba, %l0 = 000000006900002b
	andn	%l1,%l2,%l0		! %l0 = 0000000000000004
!	Mem[00000000100c1410] = 44f79fa400000069, %f4  = 71f3b304 46a693f0, %asi = 80
	ldda	[%i3+0x010]%asi,%f4 	! %f4  = 44f79fa4 00000069
!	Mem[00000000201c0001] = 33009c00, %l6 = 0000000051f59cb6
	ldub	[%o0+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000010041418] = 1b4f5570, %l1 = 00000000000000a4, %asi = 80
	ldswa	[%i1+0x018]%asi,%l1	! %l1 = 000000001b4f5570
!	Mem[0000000030081400] = 21f9a3371e4b9cb6, %l3 = 00000000000000ff
	ldxa	[%i2+%g0]0x89,%l3	! %l3 = 21f9a3371e4b9cb6
!	Mem[00000000100c1408] = ff6d0000, %l3 = 21f9a3371e4b9cb6
	ldsba	[%i3+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141410] = 7dcec331 5c8d2639, %l2 = 7f4a8fba, %l3 = ffffffff
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 000000005c8d2639 000000007dcec331
!	Mem[0000000010141400] = ff000000 ffffff97 ff274637 f020ff7f
!	%f16 = ff000000 ffffff97 6982e857 00000000
!	%f20 = 51f59cb6 ffffffff 7f4a8fba 3a21b4a3
!	%f24 = 7dcec331 5c8d2639 edb18945 ffffffff
!	%f28 = ff000000 374627ff da274637 00000061
	stda	%f16,[%i5+%g0]ASI_BLK_AIUP	! Block Store to 0000000010141400
!	Mem[0000000030041400] = ff9ff744, %f15 = 5c8d2639
	lda	[%i1+%g0]0x81,%f15	! %f15 = ff9ff744
!	Mem[0000000010101408] = ffffce7d, %l2 = 000000005c8d2639
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 000000000000007d

p0_label_55:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = 00058c60, %l0 = 0000000000000004
	ldstub	[%o1+0x040],%l0		! %l0 = 0000000000000000
!	%l7 = 000000002b000069, Mem[00000000100c1408] = ff6d0000
	stha	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00690000
!	%l1 = 000000001b4f5570, Mem[0000000010041400] = 000040910000008d
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000001b4f5570
!	%l7 = 000000002b000069, Mem[0000000021800080] = 05e03d20, %asi = 80
	stha	%l7,[%o3+0x080]%asi	! Mem[0000000021800080] = 00693d20
!	Mem[0000000030001400] = 16a9e931, %l0 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 0000000016a9e931
!	%f2  = 000036de 44f79fa4, %l6 = 0000000000000000
!	Mem[0000000010081410] = 71f3b30446a693f0
	add	%i2,0x010,%g1
	stda	%f2,[%g1+%l6]ASI_PST16_P ! Mem[0000000010081410] = 71f3b30446a693f0
!	%l6 = 0000000000000000, Mem[0000000010181400] = 00000000
	stha	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%f24 = 7dcec331 5c8d2639, Mem[0000000010081400] = ffffffff 00000000
	stda	%f24,[%i2+%g0]0x88	! Mem[0000000010081400] = 7dcec331 5c8d2639
!	%l7 = 000000002b000069, Mem[0000000010041400] = 70554f1b
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00694f1b
!	Mem[0000000010181410] = ba8f4a7f, %l7 = 000000002b000069
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 000000000000007f

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 39268d5c, %l1 = 000000001b4f5570
	ldsha	[%i5+%o5]0x81,%l1	! %l1 = 0000000000003926
!	Mem[0000000010181400] = 00000000, %f12 = ff000000
	lda	[%i6+%g0]0x80,%f12	! %f12 = 00000000
!	Mem[00000000211c0000] = ffff3e90, %l5 = 0000000000004091
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[0000000030001410] = 31c3ce7d, %l6 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l6	! %l6 = 000000000000007d
!	Mem[0000000010001400] = 60490000, %l6 = 000000000000007d
	lduwa	[%i0+%g0]0x88,%l6	! %l6 = 0000000060490000
!	Mem[0000000030001408] = 000000001481c8fe, %f0  = 6900002b 00000000
	ldda	[%i0+%o4]0x89,%f0 	! %f0  = 00000000 1481c8fe
!	Mem[0000000030141410] = 5c8d2639, %l1 = 0000000000003926
	lduba	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000039
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010141418] = 7f4a8fba3a21b4a3, %f14 = 7dcec331 ff9ff744, %asi = 80
	ldda	[%i5+0x018]%asi,%f14	! %f14 = 7f4a8fba 3a21b4a3
!	Mem[0000000030081408] = 000000ff, %l3 = 000000007dcec331
	lduha	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041425] = 17e1eb09, %l6 = 0000000060490000, %asi = 80
	ldsba	[%i1+0x025]%asi,%l6	! %l6 = ffffffffffffffe1

p0_label_57:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ffff, Mem[0000000030041400] = 44f79fff
	stba	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 44f79fff
!	%f26 = edb18945 ffffffff, Mem[0000000030101410] = 5c8d26ff 7dcec331
	stda	%f26,[%i4+%o5]0x89	! Mem[0000000030101410] = edb18945 ffffffff
!	%l2 = 0000007d, %l3 = 000000ff, Mem[0000000010081400] = 39268d5c 31c3ce7d, %asi = 80
	stda	%l2,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000007d 000000ff
!	%l7 = 000000000000007f, Mem[000000001000142c] = 53d2346f, %asi = 80
	stwa	%l7,[%i0+0x02c]%asi	! Mem[000000001000142c] = 0000007f
!	Mem[0000000010141400] = ff000000, %l5 = 000000000000ffff
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030001408] = fec88114, %l6 = 00000000ffffffe1
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 00000000fec88114
!	%f10 = 51f59cb6 230d9fa4, %l7 = 000000000000007f
!	Mem[0000000030141400] = 0a5c00007f3759c1
	stda	%f10,[%i5+%l7]ASI_PST8_SL ! Mem[0000000030141400] = a49f0d23b69cf5c1
!	Mem[0000000030181400] = ffffffff, %l2 = 000000000000007d
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l7 = 000000000000007f, Mem[0000000010041410] = 8d6c0000
	stwa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000007f
!	%l7 = 000000000000007f, Mem[00000000100c1408] = 0000000000006900
	stxa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000000000007f

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ffffffe1, %l2 = 00000000000000ff
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = ffffffffffffffe1
!	Mem[0000000030081410] = ff000000000000c5, %l5 = 00000000ff000000
	ldxa	[%i2+%o5]0x81,%l5	! %l5 = ff000000000000c5
!	Mem[0000000030141408] = ffffffec000000ff, %f16 = ff000000 ffffff97
	ldda	[%i5+%o4]0x81,%f16	! %f16 = ffffffec 000000ff
!	Mem[0000000010141400] = ffff0000, %l1 = 0000000000000039
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 00000000ffff0000
!	Mem[0000000030081408] = 000000ff, %l6 = 00000000fec88114
	ldswa	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081400] = ff0000007d000000, %l5 = ff000000000000c5
	ldxa	[%i2+%g0]0x88,%l5	! %l5 = ff0000007d000000
!	Mem[0000000010041410] = 7f000000, %l5 = ff0000007d000000
	ldswa	[%i1+%o5]0x80,%l5	! %l5 = 000000007f000000
!	Mem[0000000010101410] = 31e9a916, %l2 = ffffffffffffffe1
	ldsba	[%i4+%o5]0x88,%l2	! %l2 = 0000000000000016
!	Mem[0000000030141408] = ecffffff, %l3 = 00000000000000ff
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 00000000ecffffff
!	Mem[0000000010041437] = 33848245, %l2 = 0000000000000016
	ldub	[%i1+0x037],%l2		! %l2 = 0000000000000045

p0_label_59:
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000007f, Mem[0000000030041400] = 44f79fff
	stha	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 44f7007f
!	%l7 = 000000000000007f, Mem[0000000010081400] = 7d000000
	stha	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 7d00007f
!	%l3 = 00000000ecffffff, Mem[00000000100c1408] = 7f000000
	stwa	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = ecffffff
!	%f22 = 7f4a8fba, Mem[0000000010141410] = 51f59cb6
	sta	%f22,[%i5+%o5]0x80	! Mem[0000000010141410] = 7f4a8fba
!	Mem[0000000010001410] = f093a646, %l1 = 00000000ffff0000
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 00000000f093a646
!	Mem[0000000030181400] = ffffffff 44f79fa4 fec88114 00000000
!	%f16 = ffffffec 000000ff 6982e857 00000000
!	%f20 = 51f59cb6 ffffffff 7f4a8fba 3a21b4a3
!	%f24 = 7dcec331 5c8d2639 edb18945 ffffffff
!	%f28 = ff000000 374627ff da274637 00000061
	stda	%f16,[%i6+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	%f2  = 000036de 44f79fa4, %l4 = 000000000000008d
!	Mem[0000000010081408] = 000036de44f79fa4
	add	%i2,0x008,%g1
	stda	%f2,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010081408] = a49f36dede360000
!	%l5 = 000000007f000000, %l6 = 00000000000000ff, %y  = fffff371
	sdiv	%l5,%l6,%l5		! %l5 = ffffffff80000000
	mov	%l0,%y			! %y = 16a9e931
!	%l7 = 000000000000007f, Mem[0000000010141408] = 57e88269
	stba	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 57e8827f
!	%l6 = 000000ff, %l7 = 0000007f, Mem[00000000100c1408] = ecffffff 00000000, %asi = 80
	stda	%l6,[%i3+0x008]%asi	! Mem[00000000100c1408] = 000000ff 0000007f

p0_label_60:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010181424] = 38e46569, %l2 = 0000000000000045
	lduw	[%i6+0x024],%l2		! %l2 = 0000000038e46569
!	Mem[0000000030141408] = ffffffec000000ff, %f8  = 00000000 61000000
	ldda	[%i5+%o4]0x81,%f8 	! %f8  = ffffffec 000000ff
!	Mem[0000000010181428] = 2e0a5a36 584097af, %l4 = 0000008d, %l5 = 80000000, %asi = 80
	ldda	[%i6+0x028]%asi,%l4	! %l4 = 000000002e0a5a36 00000000584097af
!	Mem[0000000010101410] = 16a9e931 2456abed, %l4 = 2e0a5a36, %l5 = 584097af
	ldd	[%i4+%o5],%l4		! %l4 = 0000000016a9e931 000000002456abed
!	Mem[0000000010141400] = 0000ffff, %l6 = 00000000000000ff
	ldsba	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l4 = 0000000016a9e931, immd = fffffbf4, %y  = 16a9e931
	umul	%l4,-0x40c,%l1		! %l1 = 16a9e8d548644db4, %y = 16a9e8d5
!	%l1 = 16a9e8d548644db4, immd = ffffffffffffffd5, %l108 = 0000000000000005
	udivx	%l1,-0x02b,%l5		! %l5 = 0000000000000000
!	Mem[000000001010140c] = 31e9a916, %l5 = 0000000000000000
	ldstub	[%i4+0x00c],%l5		! %l5 = 0000000000000031
!	Mem[00000000100c1408] = 7f000000 ff000000, %l4 = 16a9e931, %l5 = 00000031
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000ff000000 000000007f000000
!	Mem[0000000010141400] = 0000ffff, %l1 = 16a9e8d548644db4
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_61:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000038e46569, %l5 = 000000007f000000, %l7 = 000000000000007f
	sdivx	%l2,%l5,%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 2b000069, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 000000002b000069
!	%l3 = 00000000ecffffff, Mem[0000000010081434] = 5f055725, %asi = 80
	stwa	%l3,[%i2+0x034]%asi	! Mem[0000000010081434] = ecffffff
!	%l1 = 0000000000000000, Mem[0000000010081408] = a49f36dede360000
	stxa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	%l5 = 000000007f000000, Mem[0000000010181408] = ff00b1ed433947b7
	stxa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000007f000000
!	Mem[0000000010041408] = 0000ffff, %l5 = 000000007f000000
	swapa	[%i1+%o4]0x80,%l5	! %l5 = 000000000000ffff
!	%f17 = 000000ff, Mem[0000000030001400] = 00000000
	sta	%f17,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	Mem[00000000100c1410] = 44f79fa4, %l3 = 00000000ecffffff
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000044
!	%l4 = ff000000, %l5 = 0000ffff, Mem[00000000300c1400] = ffffffff 79a79401
	stda	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000 0000ffff
!	%l7 = 000000002b000069, Mem[00000000211c0000] = ffff3e90
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 00693e90

p0_label_62:
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000000000, Mem[0000000030041400] = 7f00f744
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000f744
!	Mem[0000000030181410] = 51f59cb6ffffffff, %f0  = 00000000 1481c8fe
	ldda	[%i6+%o5]0x89,%f0 	! %f0  = 51f59cb6 ffffffff
!	Mem[0000000021800000] = 2b696cc0, %l4 = 00000000ff000000
	ldsh	[%o3+%g0],%l4		! %l4 = 0000000000002b69
!	Mem[0000000010001410] = 0000ffff, %l5 = 000000000000ffff
	lduwa	[%i0+%o5]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030141408] = ecffffff, %l6 = 0000000000000000
	lduha	[%i5+%o4]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[00000000300c1410] = ecffffff, %l3 = 0000000000000044
	ldsha	[%i3+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = f020ffff, %l2 = 0000000038e46569
	ldswa	[%i4+%g0]0x88,%l2	! %l2 = fffffffff020ffff
!	Mem[0000000010001420] = edf3b34531509e7d, %l5 = 000000000000ffff
	ldx	[%i0+0x020],%l5		! %l5 = edf3b34531509e7d
!	Mem[0000000030001408] = 00000000e1ffffff, %f6  = 00000000 0000005d
	ldda	[%i0+%o4]0x89,%f6 	! %f6  = 00000000 e1ffffff
!	Mem[0000000030141410] = 39268d5c, %l2 = fffffffff020ffff
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = 0000000000003926

p0_label_63:
!	Starting 10 instruction Store Burst
!	%l5 = edf3b34531509e7d, Mem[000000001014142c] = ffffffff, %asi = 80
	stwa	%l5,[%i5+0x02c]%asi	! Mem[000000001014142c] = 31509e7d
!	Mem[0000000010101400] = ffff20f0, %l3 = 00000000ffffffff
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 00000000ffff20f0
!	%l3 = 00000000ffff20f0, Mem[0000000030041400] = 51f536de44f70000
	stxa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000ffff20f0
!	Mem[00000000100c1410] = fff79fa4, %l5 = 31509e7d, %l7 = 2b000069
	add	%i3,0x10,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 00000000fff79fa4
!	%l0 = 0000000016a9e931, Mem[00000000211c0001] = 00693e90
	stb	%l0,[%o2+0x001]		! Mem[00000000211c0000] = 00313e90
!	%l6 = 0000ffff, %l7 = fff79fa4, Mem[00000000300c1408] = 00000045 da274637
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000ffff fff79fa4
!	%f27 = ffffffff, %f9  = 000000ff, %f18 = 6982e857
	fsubs	%f27,%f9 ,%f18		! %f18 = ffffffff
!	Mem[0000000010001400] = 00004960 031a47f1 39268d5c 31c3ce7d
!	%f0  = 51f59cb6 ffffffff 000036de 44f79fa4
!	%f4  = 44f79fa4 00000069 00000000 e1ffffff
!	%f8  = ffffffec 000000ff 51f59cb6 230d9fa4
!	%f12 = 00000000 5f055725 7f4a8fba 3a21b4a3
	stda	%f0 ,[%i0+%g0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%l7 = 00000000fff79fa4, Mem[0000000010041430] = 05239bc4
	sth	%l7,[%i1+0x030]		! Mem[0000000010041430] = 9fa49bc4
!	%l1 = 0000000000000000, Mem[0000000010081408] = 0000000000000000
	stxa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000000000000000

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 9758000079a79401, %f30 = da274637 00000061
	ldda	[%i4+%g0]0x89,%f30	! %f30 = 97580000 79a79401
!	Mem[0000000030081408] = 000000ff, %l1 = 0000000000000000
	lduha	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081410] = 71f3b304, %f24 = 7dcec331
	lda	[%i2+%o5]0x80,%f24	! %f24 = 71f3b304
!	Mem[0000000030181408] = 00000000 57e88269, %l4 = 00002b69, %l5 = 31509e7d
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000 0000000057e88269
!	Mem[00000000211c0000] = 00313e90, %l4 = 0000000000000000
	ldsh	[%o2+%g0],%l4		! %l4 = 0000000000000031
!	Mem[00000000100c1410] = fff79fa4, %l1 = 00000000000000ff, %asi = 80
	ldsha	[%i3+0x010]%asi,%l1	! %l1 = fffffffffffffff7
!	Mem[000000001008140b] = 00000000, %l5 = 0000000057e88269
	ldub	[%i2+0x00b],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141400] = 0000ffff, %l0 = 0000000016a9e931
	ldstuba	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (13)
!	Mem[000000001000143a] = 7f4a8fba, %l3 = 00000000ffff20f0
	ldsh	[%i0+0x03a],%l3		! %l3 = ffffffffffff8fba
!	Mem[0000000030001400] = ff000000ff000000, %f22 = 7f4a8fba 3a21b4a3
	ldda	[%i0+%g0]0x81,%f22	! %f22 = ff000000 ff000000

p0_label_65:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000fff79fa4, Mem[000000001008143c] = 5c8d2639
	stw	%l7,[%i2+0x03c]		! Mem[000000001008143c] = fff79fa4
!	%l5 = 0000000000000000, Mem[0000000030041408] = 00000000
	stba	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l2 = 00003926, %l3 = ffff8fba, Mem[0000000010081410] = 71f3b304 46a693f0
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00003926 ffff8fba
!	%f0  = 51f59cb6 ffffffff, %l6 = 000000000000ffff
!	Mem[0000000010041438] = 29004a227ebce46b
	add	%i1,0x038,%g1
	stda	%f0,[%g1+%l6]ASI_PST8_P ! Mem[0000000010041438] = 51f59cb6ffffffff
!	Mem[0000000030181400] = 000000ff, %l4 = 0000000000000031
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010141400] = ffff00ff
	stba	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = ffff0000
!	Mem[0000000010101400] = ffffffff, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 00000000ffffffff
!	%l3 = ffffffffffff8fba, Mem[0000000010181430] = 44f79fa401a48aa5, %asi = 80
	stxa	%l3,[%i6+0x030]%asi	! Mem[0000000010181430] = ffffffffffff8fba
!	Mem[0000000010081410] = 00003926, %l5 = 00000000ffffffff
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181438] = 700f75021a2717cb, %l6 = 000000000000ffff, %l0 = 0000000000000000
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = 700f75021a2717cb

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 5c8d2639, %l7 = 00000000fff79fa4
	lduwa	[%i1+%o5]0x89,%l7	! %l7 = 000000005c8d2639
!	%l0 = 700f75021a2717cb, Mem[00000000100c1438] = 2594a4e25c881c2b
	stx	%l0,[%i3+0x038]		! Mem[00000000100c1438] = 700f75021a2717cb
!	%l1 = fffffffffffffff7, imm = fffffffffffff7cd, %l5 = 0000000000000000
	sub	%l1,-0x833,%l5		! %l5 = 000000000000082a
!	Mem[0000000030141400] = 230d9fa4, %f22 = ff000000
	lda	[%i5+%g0]0x89,%f22	! %f22 = 230d9fa4
!	Mem[000000001008142a] = 00003300, %l5 = 000000000000082a
	lduh	[%i2+0x02a],%l5		! %l5 = 0000000000003300
!	Mem[0000000010141400] = 97ffffffffff0000, %f16 = ffffffec 000000ff
	ldda	[%i5+%g0]0x88,%f16	! %f16 = 97ffffff ffff0000
!	Mem[0000000030181400] = 00000031, %l6 = 000000000000ffff
	ldswa	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000031
!	Mem[0000000010141438] = da274637 00000061, %l0 = 1a2717cb, %l1 = fffffff7, %asi = 80
	ldda	[%i5+0x038]%asi,%l0	! %l0 = 00000000da274637 0000000000000061
!	Mem[0000000010141415] = ffffffff, %l5 = 0000000000003300
	ldsb	[%i5+0x015],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000211c0001] = 00313e90, %l7 = 000000005c8d2639, %asi = 80
	lduba	[%o2+0x001]%asi,%l7	! %l7 = 0000000000000031

p0_label_67:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = f020ffff, %l1 = 0000000000000061
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 00000000000000f0
!	Mem[000000001018143c] = 1a2717cb, %l0 = 00000000da274637, %asi = 80
	swapa	[%i6+0x03c]%asi,%l0	! %l0 = 000000001a2717cb
!	Code Fragment 4, seed = 725935
p0_fragment_4:
!	%l0 = 000000001a2717cb
	setx	0xf453f3e0b98cb9ae,%g7,%l0 ! %l0 = f453f3e0b98cb9ae
!	%l1 = 00000000000000f0
	setx	0x4a07c7ac0db3d759,%g7,%l1 ! %l1 = 4a07c7ac0db3d759
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f453f3e0b98cb9ae
	setx	0x9cd7b3478dc22114,%g7,%l0 ! %l0 = 9cd7b3478dc22114
!	%l1 = 4a07c7ac0db3d759
	setx	0xa5c09216e58d19df,%g7,%l1 ! %l1 = a5c09216e58d19df
p0_fragment_4_end:
!	%l7 = 0000000000000031, Mem[0000000010141410] = 7f4a8fba
	stba	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 314a8fba
!	%l1 = a5c09216e58d19df, Mem[0000000010001408] = 000036de
	stba	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = df0036de
!	%l7 = 0000000000000031, %l0 = 9cd7b3478dc22114, %l6 = 0000000000000031
	or	%l7,%l0,%l6		! %l6 = 9cd7b3478dc22135
!	%f15 = 3a21b4a3, %f25 = 5c8d2639, %f5  = 00000069
	fsubs	%f15,%f25,%f5 		! %f5  = dc8d2639
!	%f20 = 51f59cb6, Mem[0000000010181410] = ba8f4aff
	sta	%f20,[%i6+%o5]0x88	! Mem[0000000010181410] = 51f59cb6
!	%f16 = 97ffffff, Mem[0000000010001400] = b69cf551
	sta	%f16,[%i0+%g0]0x88	! Mem[0000000010001400] = 97ffffff
!	Mem[00000000201c0001] = 33009c00, %l5 = ffffffffffffffff
	ldstub	[%o0+0x001],%l5		! %l5 = 0000000000000000

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[000000001000140c] = 44f79fa4, %l5 = 0000000000000000, %asi = 80
	lduwa	[%i0+0x00c]%asi,%l5	! %l5 = 0000000044f79fa4
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010141400] = 0000ffff ffffff97 7f82e857 00000000
!	Mem[0000000010141410] = 314a8fba ffffffff 7f4a8fba 3a21b4a3
!	Mem[0000000010141420] = 7dcec331 5c8d2639 edb18945 31509e7d
!	Mem[0000000010141430] = ff000000 374627ff da274637 00000061
	ldda	[%i5+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010141400
!	Mem[0000000030001400] = ff000000ff000000, %l7 = 0000000000000031
	ldxa	[%i0+%g0]0x81,%l7	! %l7 = ff000000ff000000
!	Mem[0000000030181410] = ffffffff, %l5 = 0000000044f79fa4
	lduba	[%i6+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%l6 = 9cd7b3478dc22135, %l0 = 9cd7b3478dc22114, %l1 = a5c09216e58d19df
	xor	%l6,%l0,%l1		! %l1 = 0000000000000021
!	Mem[00000000300c1400] = ff000000, %l3 = ffffffffffff8fba
	lduba	[%i3+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141418] = 7f4a8fba3a21b4a3, %f20 = 51f59cb6 ffffffff, %asi = 80
	ldda	[%i5+0x018]%asi,%f20	! %f20 = 7f4a8fba 3a21b4a3
!	%l2 = 0000000000003926, %l3 = 00000000000000ff, %l6 = 9cd7b3478dc22135
	add	%l2,%l3,%l6		! %l6 = 0000000000003a25
!	Mem[00000000300c1410] = ffffffec, %l1 = 0000000000000021
	ldsba	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101408] = 46000000, %f26 = edb18945
	lda	[%i4+%o4]0x81,%f26	! %f26 = 46000000

p0_label_69:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000003926, Mem[0000000010001416] = 00000069, %asi = 80
	stha	%l2,[%i0+0x016]%asi	! Mem[0000000010001414] = 00003926
!	Mem[0000000020800000] = 39175630, %l3 = 00000000000000ff
	ldstub	[%o1+%g0],%l3		! %l3 = 0000000000000039
!	Mem[0000000030041408] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%f8  = 7dcec331 5c8d2639, %l1 = ffffffffffffffff
!	Mem[0000000030041410] = 39268d5c31c3ce7d
	add	%i1,0x010,%g1
	stda	%f8,[%g1+%l1]ASI_PST8_S ! Mem[0000000030041410] = 7dcec3315c8d2639
!	%f8  = 7dcec331 5c8d2639, Mem[0000000030101400] = 79a79401 97580000
	stda	%f8 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 7dcec331 5c8d2639
!	%f15 = 00000061, Mem[0000000030081400] = b69c4b1e
	sta	%f15,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000061
!	%f0  = 0000ffff, Mem[00000000100c1410] = a49ff7ff
	sta	%f0 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000ffff
!	%l5 = 00000000000000ff, Mem[0000000010181400] = 00000000
	sth	%l5,[%i6+%g0]		! Mem[0000000010181400] = 00ff0000
!	Mem[0000000010101408] = 7dceffff, %l7 = 00000000ff000000
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 000000007dceffff
!	Mem[0000000010081430] = 00006c8d, %l4 = 0000000000000000
	swap	[%i2+0x030],%l4		! %l4 = 0000000000006c8d

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ba8f4a31, %l1 = ffffffffffffffff
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 0000000000004a31
!	Mem[0000000010181408] = 00000000, %l6 = 0000000000003a25
	ldswa	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[000000001010143c] = fec88114, %f22 = 230d9fa4
	ld	[%i4+0x03c],%f22	! %f22 = fec88114
!	Mem[00000000211c0000] = 00313e90, %l7 = 000000007dceffff
	lduh	[%o2+%g0],%l7		! %l7 = 0000000000000031
!	Mem[0000000010041410] = 7f000000ff360000, %l1 = 0000000000004a31
	ldx	[%i1+%o5],%l1		! %l1 = 7f000000ff360000
!	Mem[0000000010041400] = 00694f1b, %l1 = 7f000000ff360000
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 0000000000694f1b
!	Mem[0000000010101404] = 45ffb1ed, %l4 = 0000000000006c8d
	ldsw	[%i4+0x004],%l4		! %l4 = 0000000045ffb1ed
!	Mem[0000000010001408] = a49ff744de3600df, %l6 = 0000000000000000
	ldxa	[%i0+%o4]0x88,%l6	! %l6 = a49ff744de3600df
!	Mem[0000000010001400] = ffffff97ffffffff, %f30 = 97580000 79a79401
	ldd	[%i0+%g0],%f30		! %f30 = ffffff97 ffffffff
!	Mem[0000000030141410] = 5c8d2639, %l2 = 0000000000003926
	lduha	[%i5+%o5]0x89,%l2	! %l2 = 0000000000002639

p0_label_71:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (15)
!	%l1 = 0000000000694f1b, Mem[0000000010141415] = ffffffff
	stb	%l1,[%i5+0x015]		! Mem[0000000010141414] = ff1bffff
!	%f14 = da274637 00000061, Mem[0000000010081408] = 00000000 00000000
	stda	%f14,[%i2+%o4]0x80	! Mem[0000000010081408] = da274637 00000061
!	Mem[0000000030041400] = ff20ffff 00000000 ff000000 1481c8fe
!	%f0  = 0000ffff ffffff97 7f82e857 00000000
!	%f4  = 314a8fba ffffffff 7f4a8fba 3a21b4a3
!	%f8  = 7dcec331 5c8d2639 edb18945 31509e7d
!	%f12 = ff000000 374627ff da274637 00000061
	stda	%f0 ,[%i1+%g0]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	%f9  = 5c8d2639, Mem[00000000100c1408] = ff000000
	sta	%f9 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 5c8d2639
!	%l1 = 0000000000694f1b, Mem[0000000010141400] = 0000ffff
	stba	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 1b00ffff
!	%f19 = 00000000, Mem[0000000010141408] = 57e8827f
	sta	%f19,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Mem[0000000010141400] = 1b00ffff, %l4 = 0000000045ffb1ed
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 000000000000001b
!	%l1 = 0000000000694f1b, Mem[0000000010001400] = 97ffffff
	stba	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 97ffff1b
!	%f6  = 7f4a8fba 3a21b4a3, Mem[0000000010081400] = 7f00007d 000000ff
	stda	%f6 ,[%i2+%g0]0x80	! Mem[0000000010081400] = 7f4a8fba 3a21b4a3
!	%f8  = 7dcec331, Mem[0000000030141400] = 230d9fa4
	sta	%f8 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 7dcec331

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 263900ff, %l7 = 0000000000000031
	ldsba	[%i2+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181436] = ffff8fba, %l1 = 0000000000694f1b
	lduh	[%i6+0x036],%l1		! %l1 = 0000000000008fba
!	Mem[0000000030081408] = ff000000, %l0 = 9cd7b3478dc22114
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000030041408] = 7f82e857, %l2 = 0000000000002639
	lduwa	[%i1+%o4]0x81,%l2	! %l2 = 000000007f82e857
!	Mem[0000000010181408] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = ffffffe1, %l3 = 0000000000000039
	lduha	[%i0+%o4]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010141410] = 314a8fba, %l1 = 0000000000008fba
	lduba	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000031
!	Mem[0000000030041408] = 57e8827f, %l7 = ffffffffffffffff
	ldsha	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffff827f
!	%l0 = ffffffffffffff00, %l7 = ffffffffffff827f, %l7 = ffffffffffff827f
	sdivx	%l0,%l7,%l7		! %l7 = 0000000000000000
!	Mem[0000000010141408] = 00000000 00000000, %l4 = 0000001b, %l5 = 00000000
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000 0000000000000000

p0_label_73:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = de3600df, %l2 = 000000007f82e857
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 00000000de3600df
!	%l4 = 0000000000000000, Mem[000000001014142c] = 31509e7d, %asi = 80
	stba	%l4,[%i5+0x02c]%asi	! Mem[000000001014142c] = 00509e7d
!	%l0 = ffffff00, %l1 = 00000031, Mem[0000000010001438] = 7f4a8fba 3a21b4a3, %asi = 80
	stda	%l0,[%i0+0x038]%asi	! Mem[0000000010001438] = ffffff00 00000031
!	Mem[0000000010041410] = 7f000000, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 000000007f000000
!	Mem[0000000010041410] = 00000000, %l1 = 0000000000000031
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%f22 = fec88114 ff000000, Mem[0000000030181408] = 00000000 57e88269
	stda	%f22,[%i6+%o4]0x81	! Mem[0000000030181408] = fec88114 ff000000
!	%l1 = 0000000000000000, Mem[0000000010081410] = ff003926ffff8fba
	stxa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000000
!	Mem[0000000030181400] = 31000000 ecffffff fec88114 ff000000
!	%f16 = 97ffffff ffff0000 ffffffff 00000000
!	%f20 = 7f4a8fba 3a21b4a3 fec88114 ff000000
!	%f24 = 71f3b304 5c8d2639 46000000 ffffffff
!	%f28 = ff000000 374627ff ffffff97 ffffffff
	stda	%f16,[%i6+%g0]ASI_BLK_S	! Block Store to 0000000030181400
!	Mem[0000000030141400] = 7dcec331, %l1 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000031
!	%f20 = 7f4a8fba, Mem[00000000100c1400] = 00000000
	sta	%f20,[%i3+%g0]0x80	! Mem[00000000100c1400] = 7f4a8fba

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[000000001004143a] = 51f59cb6, %l3 = 000000000000ffff
	ldsh	[%i1+0x03a],%l3		! %l3 = ffffffffffff9cb6
!	Mem[00000000201c0000] = 33ff9c00, %l0 = ffffffffffffff00, %asi = 80
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = 00000000000033ff
!	Mem[000000001014141c] = 3a21b4a3, %l4 = 0000000000000000, %asi = 80
	lduha	[%i5+0x01c]%asi,%l4	! %l4 = 0000000000003a21
!	Mem[0000000010101400] = 00000000, %l6 = a49ff744de3600df
	ldswa	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 690000000000ffff, %f0  = 0000ffff ffffff97
	ldda	[%i3+%o5]0x88,%f0 	! %f0  = 69000000 0000ffff
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010181400] = 00ff0000 00000039 00000000 7f000000
!	Mem[0000000010181410] = b69cf551 3a21b4a3 1b5d5d2a 22822653
!	Mem[0000000010181420] = 34187d38 38e46569 2e0a5a36 584097af
!	Mem[0000000010181430] = ffffffff ffff8fba 700f7502 da274637
	ldda	[%i6+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010181400
!	Mem[00000000100c1400] = 7f4a8fba, %l4 = 0000000000003a21
	ldsw	[%i3+%g0],%l4		! %l4 = 000000007f4a8fba
!	Mem[0000000030101400] = 39268d5c 31c3ce7d 46000000 72eefee7
!	Mem[0000000030101410] = ffffffff 4589b1ed 04b3c11a 4f27c483
!	Mem[0000000030101420] = 592704a8 12b56919 4bf94126 6fedccdf
!	Mem[0000000030101430] = 47a20214 7cfd1d55 56e24ef2 7115ff97
	ldda	[%i4+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030101400
!	Mem[00000000100c1420] = 096868181b7458c9, %f16 = 97ffffff ffff0000
	ldd	[%i3+0x020],%f16	! %f16 = 09686818 1b7458c9
!	Mem[00000000100c143c] = 1a2717cb, %l2 = 00000000de3600df, %asi = 80
	lduha	[%i3+0x03c]%asi,%l2	! %l2 = 0000000000001a27

p0_label_75:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffff9cb6, Mem[0000000030081400] = 0000006137a3f921
	stxa	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffffffff9cb6
!	%l1 = 0000000000000031, Mem[00000000100c1404] = 6ff74091, %asi = 80
	stba	%l1,[%i3+0x004]%asi	! Mem[00000000100c1404] = 31f74091
!	Mem[0000000010081418] = 000000000000005d, %l5 = 000000007f000000, %l4 = 000000007f4a8fba
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 000000000000005d
!	Mem[0000000030081400] = ffffffff, %l5 = 000000007f000000
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l2 = 0000000000001a27, Mem[0000000010001428] = 51f59cb6230d9fa4, %asi = 80
	stxa	%l2,[%i0+0x028]%asi	! Mem[0000000010001428] = 0000000000001a27
!	Mem[0000000010101410] = 16a9e931, %l3 = 00000000ffff9cb6
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 0000000016a9e931
!	Mem[00000000100c141c] = 42f9eeb3, %l5 = 000000ff, %l7 = 00000000
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 0000000042f9eeb3
!	%l3 = 0000000016a9e931, Mem[0000000030041400] = ffff0000
	stba	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = ffff0031
!	%l4 = 000000000000005d, Mem[00000000100c1418] = ff2c210a
	stw	%l4,[%i3+0x018]		! Mem[00000000100c1418] = 0000005d
!	%l7 = 0000000042f9eeb3, Mem[0000000010041408] = 7f000000
	stba	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = b3000000

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 57e8827f, %f27 = ffffffff
	lda	[%i0+%o4]0x80,%f27	! %f27 = 57e8827f
!	Mem[00000000100c142f] = 577e4e0f, %l1 = 0000000000000031
	ldsb	[%i3+0x02f],%l1		! %l1 = 000000000000000f
!	Mem[0000000030181410] = 7f4a8fba, %l5 = 00000000000000ff
	lduba	[%i6+%o5]0x81,%l5	! %l5 = 000000000000007f
!	Mem[00000000211c0000] = 00313e90, %l2 = 0000000000001a27, %asi = 80
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000031
!	Mem[0000000030001410] = 7dcec3315c8d2639, %l1 = 000000000000000f
	ldxa	[%i0+%o5]0x81,%l1	! %l1 = 7dcec3315c8d2639
!	%f18 = ffffffff, %f28 = ff000000, %f18 = ffffffff
	fdivs	%f18,%f28,%f18		! %f18 = ffffffff
!	%l0 = 00000000000033ff, %l3 = 0000000016a9e931, %y  = 16a9e8d5
	sdiv	%l0,%l3,%l3		! %l3 = 000000007fffffff
	mov	%l0,%y			! %y = 000033ff
!	Mem[0000000010081400] = a3b4213aba8f4a7f, %f18 = ffffffff 00000000
	ldda	[%i2+%g0]0x88,%f18	! %f18 = a3b4213a ba8f4a7f
!	Mem[0000000030181408] = ffffffff, %l7 = 0000000042f9eeb3
	lduba	[%i6+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1400] = ff000000, %f30 = ffffff97
	lda	[%i3+%g0]0x81,%f30	! %f30 = ff000000

p0_label_77:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = b3000000, %l7 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 00000000b3000000
!	Mem[0000000010001438] = ffffff0000000031, %l1 = 7dcec3315c8d2639, %l1 = 7dcec3315c8d2639
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = ffffff0000000031
!	Mem[0000000010101408] = 000000ff, %l4 = 000000000000005d
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101438] = 1b6c7a42, %l1 = ffffff0000000031
	ldstub	[%i4+0x038],%l1		! %l1 = 000000000000001b
!	%l1 = 000000000000001b, Mem[0000000010081400] = ba8f4a7f
	stha	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = ba8f001b
!	%l6 = 0000000000000000, Mem[0000000010041400] = 00694f1b
	stwa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%f6  = 04b3c11a 4f27c483, %l1 = 000000000000001b
!	Mem[0000000010101420] = 2e05d4781fe9b56d
	add	%i4,0x020,%g1
	stda	%f6,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010101420] = 83c4d44f1ae9b56d
!	%l7 = 00000000b3000000, Mem[00000000201c0000] = 33ff9c00
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00ff9c00
	membar	#Sync			! Added by membar checker (18)
!	%l2 = 0000000000000031, Mem[0000000010181404] = 00000039, %asi = 80
	stwa	%l2,[%i6+0x004]%asi	! Mem[0000000010181404] = 00000031
!	Mem[0000000010001400] = 97ffff1b, %l3 = 000000007fffffff
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 000000000000001b

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ecffffff, %l6 = 0000000000000000
	ldsha	[%i5+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101434] = 001290e5, %l6 = ffffffffffffffff, %asi = 80
	lduha	[%i4+0x034]%asi,%l6	! %l6 = 0000000000000012
!	Mem[0000000010141410] = ba8f4a31, %l4 = 00000000000000ff
	lduba	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000031
!	Mem[0000000010141408] = 00000000, %l4 = 0000000000000031
	lduwa	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%f17 = 1b7458c9, %f5  = 4589b1ed, %f22 = fec88114 ff000000
	fsmuld	%f17,%f5 ,%f22		! %f22 = 3c306daa e54562a0
!	Mem[0000000010101404] = 45ffb1ed, %l5 = 000000000000007f, %asi = 80
	lduha	[%i4+0x004]%asi,%l5	! %l5 = 00000000000045ff
!	Mem[0000000010001408] = a49ff7447f82e857, %f28 = ff000000 374627ff
	ldda	[%i0+%o4]0x88,%f28	! %f28 = a49ff744 7f82e857
!	Mem[0000000030101410] = ffffffff, %f18 = a3b4213a
	lda	[%i4+%o5]0x81,%f18	! %f18 = ffffffff
!	Mem[0000000010041410] = ff000000 ff360000, %l2 = 00000031, %l3 = 0000001b
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000ff000000 00000000ff360000
!	Mem[0000000020800041] = ff058c60, %l0 = 00000000000033ff
	ldsb	[%o1+0x041],%l0		! %l0 = 0000000000000005

p0_label_79:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff000000, Mem[00000000300c1410] = ffffffec
	stba	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ffffec
!	%l7 = 00000000b3000000, Mem[0000000010041410] = ff000000
	stwa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = b3000000
!	%l4 = 0000000000000000, Mem[0000000030141400] = 7dcec3ff
	stha	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 7dce0000
!	%l6 = 0000000000000012, Mem[00000000300c1408] = ffff0000
	stha	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00120000
!	%l1 = 000000000000001b, Mem[0000000010181410] = a3b4213a51f59cb6
	stxa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000000000001b
!	Mem[0000000010181400] = 0000ff00, %l6 = 0000000000000012
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = e1ffffff, %l5 = 00000000000045ff
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 00000000e1ffffff
!	%l6 = 0000000000000000, Mem[0000000010101428] = a3b4213aba8f4a7f
	stx	%l6,[%i4+0x028]		! Mem[0000000010101428] = 0000000000000000
!	%l0 = 0000000000000005, Mem[0000000010101410] = b69cffff
	stba	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = b69cff05
!	%l6 = 0000000000000000, Mem[0000000030141400] = c1f59cb67dce0000
	stxa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffffffff, %f25 = 5c8d2639
	lda	[%i2+%g0]0x89,%f25	! %f25 = ffffffff
!	%l5 = 00000000e1ffffff, immd = 000008a2, %y  = 000033ff
	sdiv	%l5,0x8a2,%l4		! %l4 = 000000007fffffff
	mov	%l0,%y			! %y = 00000005
!	Mem[0000000030141400] = 00000000 00000000, %l4 = 7fffffff, %l5 = e1ffffff
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030041410] = 314a8fba, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = 000000000000314a
!	Mem[00000000300c1410] = 00ffffec, %l0 = 0000000000000005
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = 0000000000ffffec
!	Mem[00000000300c1400] = ff000000 0000ffff, %l0 = 00ffffec, %l1 = 0000001b
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff000000 000000000000ffff
!	Mem[0000000030181408] = ffffffff, %f24 = 71f3b304
	lda	[%i6+%o4]0x81,%f24	! %f24 = ffffffff
!	Mem[0000000030081410] = ff000000 000000c5, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 00000000ff000000 00000000000000c5
!	Mem[0000000020800040] = ff058c60, %l7 = 00000000b3000000
	ldsh	[%o1+0x040],%l7		! %l7 = ffffffffffffff05
!	Mem[0000000010041430] = 9fa49bc433848245, %l7 = ffffffffffffff05
	ldx	[%i1+0x030],%l7		! %l7 = 9fa49bc433848245

p0_label_81:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff000000, Mem[0000000030001410] = 7dcec331
	stwa	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000
!	%l5 = 00000000000000c5, Mem[0000000010081408] = 374627da
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000c5
!	Mem[0000000010041410] = b3000000, %l1 = 000000000000ffff
	ldstuba	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000b3
!	Mem[000000001010142c] = 00000000, %l5 = 00000000000000c5
	swap	[%i4+0x02c],%l5		! %l5 = 0000000000000000
!	Mem[0000000030081410] = ff000000, %l7 = 9fa49bc433848245
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%f10 = 4bf94126, Mem[0000000010141400] = ffff00ff
	sta	%f10,[%i5+%g0]0x88	! Mem[0000000010141400] = 4bf94126
!	Mem[0000000010041410] = 000000ff, %l0 = 00000000ff000000
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030001408] = ff45000000000000
	stxa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010001400] = 97ffffff
	stwa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	Mem[0000000010101410] = 05ff9cb6, %l2 = 00000000ff000000, %asi = 80
	swapa	[%i4+0x010]%asi,%l2	! %l2 = 0000000005ff9cb6

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041418] = 1b4f5570 00003192, %l4 = ff000000, %l5 = 00000000
	ldd	[%i1+0x018],%l4		! %l4 = 000000001b4f5570 0000000000003192
!	Mem[0000000030181410] = 7f4a8fba, %l2 = 0000000005ff9cb6
	ldsba	[%i6+%o5]0x81,%l2	! %l2 = 000000000000007f
!	Mem[0000000010001408] = 7f82e857, %l3 = 00000000ff360000
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 000000000000e857
!	Mem[00000000100c1400] = ba8f4a7f, %f22 = 3c306daa
	lda	[%i3+%g0]0x88,%f22	! %f22 = ba8f4a7f
!	%l3 = 000000000000e857, imm = 0000000000000c7a, %l6 = 000000000000314a
	xnor	%l3,0xc7a,%l6		! %l6 = ffffffffffff1bd2
!	Mem[00000000100c1410] = 0000ffff, %l0 = 00000000000000ff
	ldsha	[%i3+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001408] = 57e8827f44f79fa4, %l0 = ffffffffffffffff
	ldxa	[%i0+%o4]0x80,%l0	! %l0 = 57e8827f44f79fa4
!	Mem[0000000030181408] = ffffffff, %l1 = 00000000000000b3
	lduha	[%i6+%o4]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030001400] = ff000000ff000000, %f4  = ffffffff 4589b1ed
	ldda	[%i0+%g0]0x81,%f4 	! %f4  = ff000000 ff000000
!	Mem[0000000030081408] = ff000000, %l3 = 000000000000e857
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = ffffffffffffff00

p0_label_83:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffff00, Mem[0000000030001410] = 000000ff
	stha	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000ff00
!	%l1 = 000000000000ffff, Mem[0000000030081410] = 000000ff
	stha	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000ffff
!	%l7 = 00000000000000ff, Mem[0000000010141400] = 4bf94126
	stha	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 4bf900ff
!	Mem[0000000010001408] = 57e8827f, %l4 = 000000001b4f5570
	ldstuba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000057
!	%l2 = 000000000000007f, Mem[0000000010041438] = 51f59cb6ffffffff
	stx	%l2,[%i1+0x038]		! Mem[0000000010041438] = 000000000000007f
!	%l3 = ffffffffffffff00, %l5 = 0000000000003192, %l5 = 0000000000003192
	or	%l3,%l5,%l5		! %l5 = ffffffffffffff92
!	%l0 = 44f79fa4, %l1 = 0000ffff, Mem[0000000010141408] = 00000000 00000000
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 44f79fa4 0000ffff
!	%l6 = ffffffffffff1bd2, Mem[0000000010141428] = edb18945
	sth	%l6,[%i5+0x028]		! Mem[0000000010141428] = 1bd28945
!	%l4 = 0000000000000057, Mem[0000000010101410] = ff0000002456abed
	stx	%l4,[%i4+%o5]		! Mem[0000000010101410] = 0000000000000057
!	%l0 = 57e8827f44f79fa4, Mem[0000000010081408] = c500000000000061
	stxa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 57e8827f44f79fa4

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff000000, %l5 = ffffffffffffff92
	ldswa	[%i2+%o4]0x81,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010181400] = ffff000000000031, %l1 = 000000000000ffff
	ldxa	[%i6+%g0]0x80,%l1	! %l1 = ffff000000000031
!	Mem[0000000010141410] = ba8f4a31, %l7 = 00000000000000ff
	lduba	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000031
!	Mem[0000000010001408] = a49ff7447f82e8ff, %f8  = 592704a8 12b56919
	ldda	[%i0+%o4]0x88,%f8 	! %f8  = a49ff744 7f82e8ff
!	%f14 = 56e24ef2, Mem[0000000030001400] = ff000000
	sta	%f14,[%i0+%g0]0x81	! Mem[0000000030001400] = 56e24ef2
!	Mem[0000000010101410] = 00000000, %l1 = ffff000000000031
	ldsha	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 46000000, %l5 = ffffffffff000000
	lduba	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000046
!	Mem[00000000100c1418] = 0000005d 42f9eeb3, %l6 = ffff1bd2, %l7 = 00000031, %asi = 80
	ldda	[%i3+0x018]%asi,%l6	! %l6 = 000000000000005d 0000000042f9eeb3
!	Mem[00000000300c1400] = ff000000 0000ffff, %l0 = 44f79fa4, %l1 = 00000000
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff000000 000000000000ffff
!	Mem[000000001004141f] = 00003192, %l1 = 000000000000ffff
	ldub	[%i1+0x01f],%l1		! %l1 = 0000000000000092

p0_label_85:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041412] = ff000000, %l6 = 000000000000005d
	ldstuba	[%i1+0x012]%asi,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000046, Mem[0000000010181431] = ffffffff
	stb	%l5,[%i6+0x031]		! Mem[0000000010181430] = ff46ffff
!	Code Fragment 3, seed = 510215
p0_fragment_5:
!	%l0 = 00000000ff000000
	setx	0xe65040e8c413e6ee,%g7,%l0 ! %l0 = e65040e8c413e6ee
!	%l1 = 0000000000000092
	setx	0x8b1d2eee030c8099,%g7,%l1 ! %l1 = 8b1d2eee030c8099
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e65040e8c413e6ee
	setx	0xcb731614efe38654,%g7,%l0 ! %l0 = cb731614efe38654
!	%l1 = 8b1d2eee030c8099
	setx	0x3f5090aa55ca7b1f,%g7,%l1 ! %l1 = 3f5090aa55ca7b1f
p0_fragment_5_end:
!	%l0 = cb731614efe38654, Mem[0000000010081432] = 00000000
	stb	%l0,[%i2+0x032]		! Mem[0000000010081430] = 00005400
!	%l6 = 0000000000000000, Mem[0000000010041400] = 00000000
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Mem[00000000300c1408] = 00001200, %l1 = 3f5090aa55ca7b1f
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%l0 = cb731614efe38654, Mem[0000000020800041] = ff058c60
	stb	%l0,[%o1+0x041]		! Mem[0000000020800040] = ff548c60
!	Mem[0000000010001400] = 00000000ffffffff, %l4 = 0000000000000057, %l3 = ffffffffffffff00
	casxa	[%i0]0x80,%l4,%l3	! %l3 = 00000000ffffffff
!	Randomly selected nop
	nop
!	Mem[000000001000141c] = e1ffffff, %l4 = 0000000000000057, %asi = 80
	lduwa	[%i0+0x01c]%asi,%l4	! %l4 = 00000000e1ffffff

p0_label_86:
!	Starting 10 instruction Load Burst
!	Code Fragment 4, seed = 323380
p0_fragment_6:
!	%l0 = cb731614efe38654
	setx	0xe4516eab01697286,%g7,%l0 ! %l0 = e4516eab01697286
!	%l1 = 0000000000000000
	setx	0x233bcbe6980618b1,%g7,%l1 ! %l1 = 233bcbe6980618b1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e4516eab01697286
	setx	0x434cfd08259d82ec,%g7,%l0 ! %l0 = 434cfd08259d82ec
!	%l1 = 233bcbe6980618b1
	setx	0xa3472db5a391b437,%g7,%l1 ! %l1 = a3472db5a391b437
p0_fragment_6_end:
!	Mem[00000000100c1408] = 5c8d2639, %l6 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000039
!	Mem[00000000100c1408] = 39268d5c, %f19 = ba8f4a7f
	lda	[%i3+%o4]0x80,%f19	! %f19 = 39268d5c
!	Mem[00000000100c1408] = 39268d5c, %l4 = 00000000e1ffffff
	lduha	[%i3+%o4]0x80,%l4	! %l4 = 0000000000003926
!	Mem[0000000010041408] = 000000ffffffff97, %l4 = 0000000000003926
	ldxa	[%i1+%o4]0x80,%l4	! %l4 = 000000ffffffff97
!	Mem[0000000030001408] = 0000000000000000, %l4 = 000000ffffffff97
	ldxa	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[000000001008143c] = fff79fa4, %f20 = 7f4a8fba
	ld	[%i2+0x03c],%f20	! %f20 = fff79fa4
!	Mem[0000000030041400] = 3100ffff, %l4 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000031
!	Mem[0000000010041410] = 000036ff00ff00ff, %l4 = 0000000000000031
	ldxa	[%i1+%o5]0x88,%l4	! %l4 = 000036ff00ff00ff
!	Mem[0000000010081400] = a3b4213aba8f001b, %l2 = 000000000000007f
	ldxa	[%i2+%g0]0x88,%l2	! %l2 = a3b4213aba8f001b

p0_label_87:
!	Starting 10 instruction Store Burst
!	%f31 = ffffffff, Mem[0000000030141408] = ecffffff
	sta	%f31,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff
!	%l2 = a3b4213aba8f001b, Mem[0000000010181400] = ffff000000000031
	stx	%l2,[%i6+%g0]		! Mem[0000000010181400] = a3b4213aba8f001b
!	Mem[0000000030001400] = f24ee256, %l0 = 00000000259d82ec
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 00000000f24ee256
!	%l2 = a3b4213aba8f001b, imm = fffffffffffffc37, %l5 = 0000000000000046
	and	%l2,-0x3c9,%l5		! %l5 = a3b4213aba8f0013
!	%l0 = f24ee256, %l1 = a391b437, Mem[0000000010141408] = 44f79fa4 0000ffff
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = f24ee256 a391b437
!	Mem[0000000010101400] = 00000000 45ffb1ed 5d000000 ffe9a916
!	%f0  = 39268d5c 31c3ce7d 46000000 72eefee7
!	%f4  = ff000000 ff000000 04b3c11a 4f27c483
!	%f8  = a49ff744 7f82e8ff 4bf94126 6fedccdf
!	%f12 = 47a20214 7cfd1d55 56e24ef2 7115ff97
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	Mem[0000000030001400] = ec829d25, %l2 = a3b4213aba8f001b
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000ec
!	%f2  = 46000000 72eefee7, %l7 = 0000000042f9eeb3
!	Mem[0000000030101428] = 4bf941266fedccdf
	add	%i4,0x028,%g1
	stda	%f2,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030101428] = e7feee726fedccdf
!	Code Fragment 3, seed = 400209
p0_fragment_7:
!	%l0 = 00000000f24ee256
	setx	0xd80b54aa8137be9e,%g7,%l0 ! %l0 = d80b54aa8137be9e
!	%l1 = a3472db5a391b437
	setx	0xbc4867a4e5868949,%g7,%l1 ! %l1 = bc4867a4e5868949
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d80b54aa8137be9e
	setx	0xffb064a35870f004,%g7,%l0 ! %l0 = ffb064a35870f004
!	%l1 = bc4867a4e5868949
	setx	0x041a8881746175cf,%g7,%l1 ! %l1 = 041a8881746175cf
p0_fragment_7_end:
!	Mem[0000000010041408] = ff000000, %l3 = 00000000ffffffff
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 00000000ff000000

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff175630, %l2 = 00000000000000ec
	ldub	[%o1+%g0],%l2		! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010101408] = 46000000, %l7 = 0000000042f9eeb3
	ldsha	[%i4+%o4]0x80,%l7	! %l7 = 0000000000004600
!	Mem[0000000010001410] = 26390000a49ff744, %l3 = 00000000ff000000
	ldxa	[%i0+%o5]0x88,%l3	! %l3 = 26390000a49ff744
!	Mem[0000000020800001] = ff175630, %l0 = ffb064a35870f004
	ldub	[%o1+0x001],%l0		! %l0 = 0000000000000017
!	Mem[0000000030001400] = 259d82ff, %l5 = a3b4213aba8f0013
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 00000000259d82ff
!	Mem[0000000030141400] = 00000000, %l4 = 000036ff00ff00ff
	ldsha	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141438] = da274637 00000061, %l4 = 00000000, %l5 = 259d82ff
	ldd	[%i5+0x038],%l4		! %l4 = 00000000da274637 0000000000000061
!	Mem[0000000030041400] = 3100ffffffffff97, %f2  = 46000000 72eefee7
	ldda	[%i1+%g0]0x81,%f2 	! %f2  = 3100ffff ffffff97
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000004600
	lduba	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Code Fragment 3, seed = 996039
p0_fragment_8:
!	%l0 = 0000000000000017
	setx	0xb8363e86c02e58ee,%g7,%l0 ! %l0 = b8363e86c02e58ee
!	%l1 = 041a8881746175cf
	setx	0x2e298ef12a845299,%g7,%l1 ! %l1 = 2e298ef12a845299
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b8363e86c02e58ee
	setx	0x4054135eb7bab854,%g7,%l0 ! %l0 = 4054135eb7bab854
!	%l1 = 2e298ef12a845299
	setx	0xf0222547cb630d1f,%g7,%l1 ! %l1 = f0222547cb630d1f
p0_fragment_8_end:

p0_label_89:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 000000ff, %l0 = 4054135eb7bab854
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l2 = 000000ff, %l3 = a49ff744, Mem[0000000030141410] = 39268d5c 31c3ce7d
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff a49ff744
!	Mem[0000000030001410] = 00ff0000, %l5 = 0000000000000061
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = 7f82e857, %l6 = 0000000000000039
	ldstuba	[%i1+%o4]0x81,%l6	! %l6 = 000000000000007f
!	%l2 = 000000ff, %l3 = a49ff744, Mem[0000000030141400] = 00000000 00000000
	stda	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff a49ff744
!	%f2  = 3100ffff, Mem[00000000300c1408] = ff120000
	sta	%f2 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 3100ffff
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%f15 = 7115ff97, Mem[0000000010101410] = ff000000
	sta	%f15,[%i4+%o5]0x80	! Mem[0000000010101410] = 7115ff97
!	%l1 = f0222547cb630d1f, Mem[0000000030001408] = 00000000
	stba	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000001f
!	Mem[00000000211c0001] = 00313e90, %l0 = 00000000000000ff
	ldstub	[%o2+0x001],%l0		! %l0 = 0000000000000031

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 1f000000, %l5 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l5	! %l5 = 000000000000001f
!	Mem[0000000010101408] = 46000000 72eefee7, %l0 = 00000031, %l1 = cb630d1f
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 0000000046000000 0000000072eefee7
!	Mem[0000000010041408] = ffffffff, %f0  = 39268d5c
	lda	[%i1+%o4]0x88,%f0 	! %f0 = ffffffff
!	Mem[0000000010181428] = 2e0a5a36, %l4 = 00000000da274637, %asi = 80
	ldswa	[%i6+0x028]%asi,%l4	! %l4 = 000000002e0a5a36
!	Code Fragment 3, seed = 507899
p0_fragment_9:
!	%l0 = 0000000046000000
	setx	0x4b26b2013201634e,%g7,%l0 ! %l0 = 4b26b2013201634e
!	%l1 = 0000000072eefee7
	setx	0x6dd10fa3b880cef9,%g7,%l1 ! %l1 = 6dd10fa3b880cef9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4b26b2013201634e
	setx	0x25f79320fc0e06b4,%g7,%l0 ! %l0 = 25f79320fc0e06b4
!	%l1 = 6dd10fa3b880cef9
	setx	0x4a3a7a0bdc3c8d7f,%g7,%l1 ! %l1 = 4a3a7a0bdc3c8d7f
p0_fragment_9_end:
!	Mem[0000000010141408] = f24ee256, %l5 = 000000000000001f
	ldsba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000056
!	Mem[00000000211c0000] = 00ff3e90, %l7 = 0000000000000000, %asi = 80
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0000] = 00ff9c00, %l1 = 4a3a7a0bdc3c8d7f, %asi = 80
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l4 = 000000002e0a5a36
	lduba	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = a3b4213a ba8f4a7f, %l6 = 0000007f, %l7 = 000000ff
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 00000000ba8f4a7f 00000000a3b4213a

p0_label_91:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081418] = 00000000, %l6 = 00000000ba8f4a7f
	swap	[%i2+0x018],%l6		! %l6 = 0000000000000000
!	%l1 = 0000000000000000, Mem[000000001014142e] = 00509e7d, %asi = 80
	stba	%l1,[%i5+0x02e]%asi	! Mem[000000001014142c] = 0050007d
!	%l0 = 25f79320fc0e06b4, Mem[000000001000140c] = 44f79fa4
	stw	%l0,[%i0+0x00c]		! Mem[000000001000140c] = fc0e06b4
!	%f26 = 46000000 57e8827f, %l1 = 0000000000000000
!	Mem[0000000010141418] = 7f4a8fba3a21b4a3
	add	%i5,0x018,%g1
	stda	%f26,[%g1+%l1]ASI_PST8_P ! Mem[0000000010141418] = 7f4a8fba3a21b4a3
!	%l6 = 0000000000000000, Mem[0000000030041400] = ffff0031
	stha	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = ffff0000
!	%l0 = 25f79320fc0e06b4, Mem[00000000300c1408] = ffff0031
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = fc0e06b4
!	Mem[00000000100c1400] = 7f4a8fba 31f74091 39268d5c 0000007f
!	%f0  = ffffffff 31c3ce7d 3100ffff ffffff97
!	%f4  = ff000000 ff000000 04b3c11a 4f27c483
!	%f8  = a49ff744 7f82e8ff 4bf94126 6fedccdf
!	%f12 = 47a20214 7cfd1d55 56e24ef2 7115ff97
	stda	%f0 ,[%i3+%g0]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	%l5 = 0000000000000056, Mem[0000000030081400] = b69cffffffffffff
	stxa	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000000056
!	%l2 = 00000000000000ff, Mem[0000000010041400] = 00000000
	stba	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = ff000000
!	%l7 = 00000000a3b4213a, Mem[00000000201c0000] = 00ff9c00, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 213a9c00

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = fc0e06b4, %l5 = 0000000000000056
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 00000000fc0e06b4
!	%f28 = a49ff744, %f25 = ffffffff
	fitos	%f28,%f25		! %f25 = ceb6c011
!	Mem[000000001018141a] = 1b5d5d2a, %l7 = 00000000a3b4213a
	lduh	[%i6+0x01a],%l7		! %l7 = 0000000000005d2a
!	Mem[0000000010141408] = f24ee256, %l1 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l1	! %l1 = 00000000f24ee256
!	Mem[0000000010101410] = 7115ff97 ff000000, %l2 = 000000ff, %l3 = a49ff744
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 000000007115ff97 00000000ff000000
!	Mem[0000000030181410] = 7f4a8fba3a21b4a3, %f28 = a49ff744 7f82e857
	ldda	[%i6+%o5]0x81,%f28	! %f28 = 7f4a8fba 3a21b4a3
	membar	#Sync			! Added by membar checker (20)
!	Mem[00000000100c1400] = 7dcec331 ffffffff 97ffffff ffff0031
!	Mem[00000000100c1410] = 000000ff 000000ff 83c4274f 1ac1b304
!	Mem[00000000100c1420] = ffe8827f 44f79fa4 dfcced6f 2641f94b
!	Mem[00000000100c1430] = 551dfd7c 1402a247 97ff1571 f24ee256
	ldda	[%i3+%g0]ASI_BLK_P,%f0 	! Block Load from 00000000100c1400
!	Mem[0000000010001408] = 7f82e8ff, %l7 = 0000000000005d2a
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041400] = ff00000000000000, %f30 = ff000000 ffffffff
	ldda	[%i1+%g0]0x80,%f30	! %f30 = ff000000 00000000
!	Mem[0000000010181408] = 00000000, %l4 = 0000000000000000
	lduba	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000

p0_label_93:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 259d82ff, %l3 = 00000000ff000000
	ldstuba	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l7 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000010181410] = 0000001b
	stha	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	Mem[0000000030101410] = ffffffff, %l1 = 00000000f24ee256
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l0 = 25f79320fc0e06b4, Mem[0000000010001432] = 00000000
	stb	%l0,[%i0+0x032]		! Mem[0000000010001430] = 0000b400
!	Mem[0000000030101410] = ffffffff, %l3 = 00000000000000ff
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001428] = 00000000, %l0 = 25f79320fc0e06b4
	ldstub	[%i0+0x028],%l0		! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 7dcec331, %l0 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 000000007dcec331
!	%f8  = ffe8827f, Mem[0000000030001400] = ff829d25
	sta	%f8 ,[%i0+%g0]0x81	! Mem[0000000030001400] = ffe8827f
!	%l1 = 00000000000000ff, Mem[000000001000140a] = ffe8827f
	sth	%l1,[%i0+0x00a]		! Mem[0000000010001408] = ffe800ff

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800041] = ff548c60, %l2 = 000000007115ff97
	ldsb	[%o1+0x041],%l2		! %l2 = 0000000000000054
!	Mem[0000000010141400] = ff00f94bffffff97, %l4 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l4	! %l4 = ff00f94bffffff97
!	Mem[0000000010181400] = 3a21b4a3, %l1 = 00000000000000ff
	ldsha	[%i6+%g0]0x88,%l1	! %l1 = ffffffffffffb4a3
!	Mem[0000000010001400] = 00000000, %l5 = 00000000fc0e06b4
	ldswa	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = fc0e06b4, %l2 = 0000000000000054
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 00000000000006b4
!	Mem[0000000020800000] = ff175630, %l0 = 000000007dcec331, %asi = 80
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 000000000000ff17
!	Mem[0000000010181400] = a3b4213aba8f001b, %f24 = ffffffff ceb6c011
	ldda	[%i6+%g0]0x80,%f24	! %f24 = a3b4213a ba8f001b
!	Mem[0000000010081410] = 000000ff, %l2 = 00000000000006b4
	lduwa	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1410] = 00ffffec, %l3 = 00000000000000ff
	lduha	[%i3+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181400] = ffffff97, %l5 = 0000000000000000
	lduha	[%i6+%g0]0x89,%l5	! %l5 = 000000000000ff97

p0_label_95:
!	Starting 10 instruction Store Burst
!	%f24 = a3b4213a ba8f001b, %l3 = 00000000000000ff
!	Mem[0000000010001418] = 00000000e1ffffff
	add	%i0,0x018,%g1
	stda	%f24,[%g1+%l3]ASI_PST16_P ! Mem[0000000010001418] = a3b4213aba8f001b
!	%l5 = 000000000000ff97, Mem[0000000030081408] = 000000ff
	stha	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ff97
!	%f18 = ffffffff 39268d5c, Mem[0000000030141410] = ff000000 44f79fa4
	stda	%f18,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff 39268d5c
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000030081400] = 56000000 00000000 97ff0000 1481c8fe
!	Mem[0000000030081410] = ffff0000 000000c5 376dce5a 41f054c3
!	Mem[0000000030081420] = 72562be8 53266b59 113fd266 6b6e511f
!	Mem[0000000030081430] = 6d20cd54 7468b395 7f8ca432 3a214c3b
	ldda	[%i2+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	%l7 = 0000000000000000, imm = 0000000000000703, %l0 = 000000000000ff17
	xnor	%l7,0x703,%l0		! %l0 = fffffffffffff8fc
!	Mem[0000000010181410] = ff00000000000000, %l1 = ffffffffffffb4a3, %l2 = 00000000000000ff
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = ff00000000000000
!	%l3 = 00000000000000ff, Mem[0000000030141408] = ffffffff
	stwa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	%l1 = ffffffffffffb4a3, Mem[0000000010181400] = 3a21b4a3
	stha	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 3a21b4a3
!	%f24 = 72562be8 53266b59, Mem[0000000010041400] = ff000000 00000000
	stda	%f24,[%i1+%g0]0x80	! Mem[0000000010041400] = 72562be8 53266b59
	membar	#Sync			! Added by membar checker (22)
!	%f10 = dfcced6f 2641f94b, Mem[0000000030081410] = 0000ffff c5000000
	stda	%f10,[%i2+%o5]0x89	! Mem[0000000030081410] = dfcced6f 2641f94b

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = e7feee72 00000046, %l4 = ffffff97, %l5 = 0000ff97
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000046 00000000e7feee72
!	Mem[0000000010101428] = 4bf94126, %f28 = 6d20cd54
	lda	[%i4+0x028]%asi,%f28	! %f28 = 4bf94126
!	Mem[0000000020800041] = ff548c60, %l5 = 00000000e7feee72, %asi = 80
	lduba	[%o1+0x041]%asi,%l5	! %l5 = 0000000000000054
!	Mem[00000000100c1400] = 00000000, %l7 = 0000000000000000
	lduha	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[000000001010142c] = 6fedccdf, %l1 = ffffffffffffb4a3
	ldsw	[%i4+0x02c],%l1		! %l1 = 000000006fedccdf
!	Mem[0000000030081400] = 00000056, %l4 = 0000000000000046
	lduha	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000056
!	%f8  = ffe8827f, %f14 = 97ff1571, %f8  = ffe8827f
	fsubs	%f8 ,%f14,%f8 		! %f8  = ffe8827f
!	Mem[0000000030141400] = ff000000, %l5 = 0000000000000054
	ldsha	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = 39268d5c, %l3 = 00000000000000ff
	ldsba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000039
!	Mem[00000000100c1410] = 000000ff, %l6 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000

p0_label_97:
!	Starting 10 instruction Store Burst
!	%l2 = ff00000000000000, immd = 0000000000000d00, %l108 = 0000000000000002
	sdivx	%l2,0xd00,%l2		! %l2 = ffffec4ec4ec4ec5
!	Mem[0000000020800001] = ff175630, %l4 = 0000000000000056
	ldstub	[%o1+0x001],%l4		! %l4 = 0000000000000017
!	Mem[0000000010141408] = 56e24ef2, %l0 = fffff8fc, %l4 = 00000017
	add	%i5,0x08,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 0000000056e24ef2
!	%l4 = 56e24ef2, %l5 = 00000000, Mem[0000000010141400] = ff00f94b ffffff97
	stda	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 56e24ef2 00000000
!	%l0 = fffffffffffff8fc, Mem[0000000030141410] = 5c8d2639ffffffff
	stxa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = fffffffffffff8fc
!	%f14 = 97ff1571 f24ee256, Mem[0000000010081408] = 7f82e857 a49ff744
	stda	%f14,[%i2+%o4]0x88	! Mem[0000000010081408] = 97ff1571 f24ee256
!	%f26 = 113fd266 6b6e511f, Mem[0000000030001408] = ff000000 00000000
	stda	%f26,[%i0+%o4]0x81	! Mem[0000000030001408] = 113fd266 6b6e511f
!	%l0 = fffff8fc, %l1 = 6fedccdf, Mem[0000000030001410] = ffff0000 5c8d2639
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = fffff8fc 6fedccdf
!	%f28 = 4bf94126 7468b395, Mem[00000000100c1400] = 00000000 ffffffff
	stda	%f28,[%i3+%g0]0x88	! Mem[00000000100c1400] = 4bf94126 7468b395
!	Mem[0000000010081410] = 000000ff, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000ff

p0_label_98:
!	Starting 10 instruction Load Burst
!	%f23 = 41f054c3, %f14 = 97ff1571, %f24 = 72562be8 53266b59
	fsmuld	%f23,%f14,%f24		! %f24 = bb4def11 e8cd2260
!	Mem[0000000030081410] = 2641f94b, %f16 = 56000000
	lda	[%i2+%o5]0x89,%f16	! %f16 = 2641f94b
!	%l0 = fffffffffffff8fc, %l1 = 000000006fedccdf, %l3 = 0000000000000039
	xnor	%l0,%l1,%l3		! %l3 = 000000006fedcbdc
!	%l3 = 000000006fedcbdc, imm = fffffffffffffb7a, %l3 = 000000006fedcbdc
	sub	%l3,-0x486,%l3		! %l3 = 000000006fedd062
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000030081400] = 56000000 00000000 97ff0000 1481c8fe
!	Mem[0000000030081410] = 4bf94126 6fedccdf 376dce5a 41f054c3
!	Mem[0000000030081420] = 72562be8 53266b59 113fd266 6b6e511f
!	Mem[0000000030081430] = 6d20cd54 7468b395 7f8ca432 3a214c3b
	ldda	[%i2+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030081400
!	Mem[00000000100c1410] = 000000ff000000ff, %f10 = dfcced6f 2641f94b
	ldda	[%i3+%o5]0x80,%f10	! %f10 = 000000ff 000000ff
!	Mem[0000000010001428] = ff00000000001a27, %f6  = 83c4274f 1ac1b304
	ldd	[%i0+0x028],%f6 	! %f6  = ff000000 00001a27
!	Code Fragment 3, seed = 994896
p0_fragment_10:
!	%l0 = fffffffffffff8fc
	setx	0xe117af345f8d55a6,%g7,%l0 ! %l0 = e117af345f8d55a6
!	%l1 = 000000006fedccdf
	setx	0xb29fe82754fb11d1,%g7,%l1 ! %l1 = b29fe82754fb11d1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e117af345f8d55a6
	setx	0x9cdc01e72ecfb20c,%g7,%l0 ! %l0 = 9cdc01e72ecfb20c
!	%l1 = b29fe82754fb11d1
	setx	0x37afd003f5333957,%g7,%l1 ! %l1 = 37afd003f5333957
p0_fragment_10_end:
!	Mem[0000000010001410] = 44f79fa4 00003926, %l0 = 2ecfb20c, %l1 = f5333957
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 0000000044f79fa4 0000000000003926
!	Mem[00000000100c1410] = 000000ff000000ff, %f0  = 7dcec331 ffffffff
	ldda	[%i3+%o5]0x80,%f0 	! %f0  = 000000ff 000000ff

p0_label_99:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 5600000000000000, %f14 = 97ff1571 f24ee256
	ldda	[%i2+%g0]0x81,%f14	! %f14 = 56000000 00000000
	membar	#Sync			! Added by membar checker (24)
!	%l4 = 0000000056e24ef2, Mem[0000000030081400] = 56000000
	stba	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = f2000000
!	%l3 = 000000006fedd062, %l0 = 0000000044f79fa4, %l6 = 00000000000000ff
	or	%l3,%l0,%l6		! %l6 = 000000006fffdfe6
!	%l0 = 0000000044f79fa4, Mem[0000000010141400] = 56e24ef2
	stba	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = a4e24ef2
!	%l1 = 0000000000003926, Mem[0000000010041410] = 00ff00ff
	stwa	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 00003926
!	Mem[0000000030141410] = ffffffff, %l1 = 0000000000003926
	ldstuba	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%f16 = 00000000 00000056, %l3 = 000000006fedd062
!	Mem[0000000010041438] = 000000000000007f
	add	%i1,0x038,%g1
	stda	%f16,[%g1+%l3]ASI_PST8_P ! Mem[0000000010041438] = 000000000000007f
!	%f11 = 000000ff, Mem[0000000010141400] = f24ee2a4
	sta	%f11,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	Mem[0000000010041400] = 72562be8, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 0000000072562be8
!	Mem[0000000010081410] = 00000000, %l7 = 0000000072562be8
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff000000, %l1 = 00000000000000ff
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010001400] = ffffffff 00000000, %l4 = 56e24ef2, %l5 = 00000000
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000 00000000ffffffff
!	Mem[0000000010181420] = 34187d3838e46569, %l4 = 0000000000000000
	ldx	[%i6+0x020],%l4		! %l4 = 34187d3838e46569
!	Mem[0000000030181400] = 97ffffff, %l2 = ffffec4ec4ec4ec5
	lduwa	[%i6+%g0]0x81,%l2	! %l2 = 0000000097ffffff
!	Mem[0000000010001408] = ff00e8ff, %f23 = 5ace6d37
	lda	[%i0+%o4]0x88,%f23	! %f23 = ff00e8ff
!	Mem[0000000010101410] = 7115ff97, %l0 = 0000000044f79fa4
	ldsba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000071
!	Mem[0000000010041400] = 0000000053266b59, %l0 = 0000000000000071
	ldx	[%i1+%g0],%l0		! %l0 = 0000000053266b59
!	Mem[000000001000140c] = fc0e06b4, %l3 = 000000006fedd062
	ldsw	[%i0+0x00c],%l3		! %l3 = fffffffffc0e06b4
!	Mem[0000000010141408] = 56e24ef237b491a3, %f22 = c354f041 ff00e8ff
	ldda	[%i5+%o4]0x80,%f22	! %f22 = 56e24ef2 37b491a3
!	%l5 = 00000000ffffffff, %l5 = 00000000ffffffff, %l6 = 000000006fffdfe6
	addc	%l5,%l5,%l6		! %l6 = 00000001fffffffe

p0_label_101:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 804789
p0_fragment_11:
!	%l0 = 0000000053266b59
	setx	0x077e65d5c853ff7e,%g7,%l0 ! %l0 = 077e65d5c853ff7e
!	%l1 = ffffffffff000000
	setx	0x1b8687d0e7a87429,%g7,%l1 ! %l1 = 1b8687d0e7a87429
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 077e65d5c853ff7e
	setx	0xad38fed3d77064e4,%g7,%l0 ! %l0 = ad38fed3d77064e4
!	%l1 = 1b8687d0e7a87429
	setx	0x5af034f5501054af,%g7,%l1 ! %l1 = 5af034f5501054af
p0_fragment_11_end:
!	%f12 = 551dfd7c 1402a247, Mem[0000000010141410] = ba8f4a31 ffff1bff
	stda	%f12,[%i5+%o5]0x88	! Mem[0000000010141410] = 551dfd7c 1402a247
!	%l3 = fffffffffc0e06b4, Mem[0000000030041410] = ba8f4a31
	stwa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = fc0e06b4
!	%f20 = dfcced6f, Mem[00000000100c1400] = 7468b395
	sta	%f20,[%i3+%g0]0x88	! Mem[00000000100c1400] = dfcced6f
!	Mem[00000000201c0000] = 213a9c00, %l1 = 5af034f5501054af
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000021
!	%f24 = 596b2653 e82b5672, Mem[0000000010041410] = 26390000 ff360000
	stda	%f24,[%i1+%o5]0x80	! Mem[0000000010041410] = 596b2653 e82b5672
!	Mem[0000000010041400] = 00000000, %l1 = 0000000000000021
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%f6  = ff000000 00001a27, Mem[0000000010041428] = 57b1c556 61bbe24f
	std	%f6 ,[%i1+0x028]	! Mem[0000000010041428] = ff000000 00001a27
!	%l0 = d77064e4, %l1 = 00000000, Mem[00000000100c1400] = 6fedccdf 2641f94b
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = d77064e4 00000000
!	%f16 = 00000000 00000056, %l3 = fffffffffc0e06b4
!	Mem[0000000010041438] = 000000000000007f
	add	%i1,0x038,%g1
	stda	%f16,[%g1+%l3]ASI_PST32_P ! Mem[0000000010041438] = 000000000000007f

p0_label_102:
!	Starting 10 instruction Load Burst
!	%f2  = 97ffffff, %f14 = 56000000
	fsqrts	%f2 ,%f14		! %f14 = 7fffffff
!	Mem[0000000010081410] = 000000ff, %l1 = 0000000000000000
	ldsha	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141410] = fcf8ffffffffffff, %l6 = 00000001fffffffe
	ldxa	[%i5+%o5]0x89,%l6	! %l6 = fcf8ffffffffffff
!	Mem[00000000211c0001] = 00ff3e90, %l3 = fffffffffc0e06b4
	ldub	[%o2+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030141408] = ff000000, %l4 = 34187d3838e46569
	ldsha	[%i5+%o4]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030181408] = ffffffff, %l5 = 00000000ffffffff
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101410] = ffffffff, %l6 = fcf8ffffffffffff
	ldsha	[%i4+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1410] = 000000ff, %l7 = 0000000000000000
	ldsba	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = ff000000, %l2 = 0000000097ffffff
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010141400] = 000000ff, %l4 = ffffffffffffff00
	lduha	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_103:
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffffff, Mem[0000000010141410] = 47a202147cfd1d55
	stxa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffffffffffff
!	Mem[0000000030041410] = fc0e06b4, %l0 = ad38fed3d77064e4
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000b4
!	Mem[0000000010101433] = 47a20214, %l1 = 00000000000000ff
	ldstub	[%i4+0x033],%l1		! %l1 = 0000000000000014
!	Mem[0000000010081410] = ff000000, %l2 = 000000000000ff00
	swapa	[%i2+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	%f24 = 596b2653 e82b5672, Mem[0000000010141410] = ffffffff ffffffff
	stda	%f24,[%i5+%o5]0x80	! Mem[0000000010141410] = 596b2653 e82b5672
!	%l6 = ffffffffffffffff, Mem[0000000030101410] = ffffffff
	stwa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffff
!	%l6 = ffffffff, %l7 = 00000000, Mem[0000000010141408] = f24ee256 a391b437
	stda	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffff 00000000
!	%f18 = fec88114 0000ff97, %l4 = 00000000000000ff
!	Mem[0000000010101418] = 04b3c11a4f27c483
	add	%i4,0x018,%g1
	stda	%f18,[%g1+%l4]ASI_PST16_P ! Mem[0000000010101418] = fec881140000ff97
!	%l6 = ffffffffffffffff, Mem[0000000030081408] = 0000ff97
	stba	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ffff
!	Mem[0000000030001410] = fcf8ffff, %l2 = 00000000ff000000
	swapa	[%i0+%o5]0x89,%l2	! %l2 = 00000000fcf8ffff

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 7f4a8fba, %l5 = ffffffffffffffff
	lduba	[%i6+%o5]0x81,%l5	! %l5 = 000000000000007f
!	Mem[00000000100c1400] = e46470d7, %l6 = ffffffffffffffff
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffffffd7
!	Mem[0000000020800000] = ffff5630, %l0 = 00000000000000b4
	ldub	[%o1+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010081408] = 56e24ef2, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l7	! %l7 = 0000000056e24ef2
!	Mem[0000000010041408] = ffffffff, %l4 = 00000000000000ff
	ldsba	[%i1+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001400] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 00ff3e90, %l3 = 0000000000000000, %asi = 80
	ldsba	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = ffffffff, %f17 = 00000056
	lda	[%i5+%o5]0x89,%f17	! %f17 = ffffffff
!	Mem[000000001008142f] = 230d9fa4, %l1 = 0000000000000014, %asi = 80
	lduba	[%i2+0x02f]%asi,%l1	! %l1 = 00000000000000a4
!	Mem[0000000010081408] = f24ee256, %l0 = 00000000000000ff
	lduha	[%i2+%o4]0x88,%l0	! %l0 = 000000000000e256

p0_label_105:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000a4, Mem[0000000010041410] = 596b2653e82b5672
	stxa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000000a4
!	Mem[0000000010001400] = 00000000, %l6 = ffffffffffffffd7
	ldstuba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%l2 = 00000000fcf8ffff, Mem[0000000010101408] = 46000000
	stha	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = ffff0000
!	Mem[0000000010041430] = 9fa49bc4, %l0 = 000000000000e256
	ldstuba	[%i1+0x030]%asi,%l0	! %l0 = 000000000000009f
!	Mem[00000000100c140e] = ffff0031, %l6 = 0000000000000000
	ldstub	[%i3+0x00e],%l6		! %l6 = 0000000000000000
!	Mem[0000000010141400] = ff00000000000000, %l4 = ffffffffffffffff, %l7 = 0000000056e24ef2
	casxa	[%i5]0x80,%l4,%l7	! %l7 = ff00000000000000
!	%l1 = 00000000000000a4, Mem[000000001010142a] = 4bf94126
	sth	%l1,[%i4+0x02a]		! Mem[0000000010101428] = 4bf900a4
!	%l4 = ffffffffffffffff, Mem[00000000211c0000] = 00ff3e90, %asi = 80
	stba	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff3e90
!	Mem[00000000201c0000] = ff3a9c00, %l1 = 00000000000000a4
	ldstub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	%l7 = ff00000000000000, Mem[000000001010143d] = 7115ff97, %asi = 80
	stba	%l7,[%i4+0x03d]%asi	! Mem[000000001010143c] = 7100ff97

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ffff0000, %l0 = 000000000000009f
	ldswa	[%i2+%o4]0x81,%l0	! %l0 = ffffffffffff0000
!	%l3 = 0000000000000000, %l2 = 00000000fcf8ffff, %l4 = ffffffffffffffff
	and	%l3,%l2,%l4		! %l4 = 0000000000000000
!	Mem[0000000010141400] = ff00000000000000, %l0 = ffffffffffff0000
	ldxa	[%i5+%g0]0x80,%l0	! %l0 = ff00000000000000
!	Mem[0000000030001410] = 000000ff, %l5 = 000000000000007f
	ldsba	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 5c8d2639, %l6 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l6	! %l6 = 000000005c8d2639
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010001410] = 44f79fa4 00003926
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 000000ff
!	Mem[0000000010001410] = 00000000000000ff, %l1 = 00000000000000ff
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081408] = 56e24ef2 7115ff97, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 0000000056e24ef2 000000007115ff97
!	Mem[0000000020800000] = ffff5630, %l5 = 0000000000000000, %asi = 80
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010181400] = a3b4213a ba8f001b, %l0 = 56e24ef2, %l1 = 7115ff97
	ldd	[%i6+%g0],%l0		! %l0 = 00000000a3b4213a 00000000ba8f001b

p0_label_107:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00ff0000, %l7 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 0000000000ff0000
!	%f22 = 56e24ef2 37b491a3, %l5 = 000000000000ffff
!	Mem[0000000030041430] = ff000000374627ff
	add	%i1,0x030,%g1
	stda	%f22,[%g1+%l5]ASI_PST16_S ! Mem[0000000030041430] = 56e24ef237b491a3
!	Mem[0000000030001408] = 113fd266, %l6 = 000000005c8d2639
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 00000000113fd266
!	Mem[0000000010181408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = ff000000, %l1 = 00000000ba8f001b
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%l2 = fcf8ffff, %l3 = 00000000, Mem[00000000300c1408] = fc0e06b4 fff79fa4
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = fcf8ffff 00000000
!	%l5 = 000000000000ffff, Mem[0000000010041428] = ff000000, %asi = 80
	stha	%l5,[%i1+0x028]%asi	! Mem[0000000010041428] = ffff0000
!	Mem[0000000010101408] = 0000ffff, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Code Fragment 3, seed = 5075
p0_fragment_12:
!	%l0 = 00000000a3b4213a
	setx	0x1aae405453121c8e,%g7,%l0 ! %l0 = 1aae405453121c8e
!	%l1 = 00000000000000ff
	setx	0x68a024eee61d4439,%g7,%l1 ! %l1 = 68a024eee61d4439
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1aae405453121c8e
	setx	0xa53ce84a481977f4,%g7,%l0 ! %l0 = a53ce84a481977f4
!	%l1 = 68a024eee61d4439
	setx	0x1105f9ece4363abf,%g7,%l1 ! %l1 = 1105f9ece4363abf
p0_fragment_12_end:
!	Mem[0000000030001410] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 39268d5c31c3ce7d, %l3 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l3	! %l3 = 39268d5c31c3ce7d
!	Mem[0000000010081408] = f24ee256, %l4 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = ffffffffffffe256
!	Mem[0000000010041400] = ff000000, %l7 = 0000000000ff0000
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181420] = 34187d38, %f29 = 54cd206d
	ld	[%i6+0x020],%f29	! %f29 = 34187d38
!	Mem[0000000010181425] = 38e46569, %l5 = 000000000000ffff
	ldub	[%i6+0x025],%l5		! %l5 = 00000000000000e4
!	Mem[00000000211c0001] = ffff3e90, %l5 = 00000000000000e4, %asi = 80
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1410] = ff000000, %f2  = 97ffffff
	lda	[%i3+%o5]0x88,%f2 	! %f2 = ff000000
!	Mem[0000000030101400] = 5c8d2639, %l2 = 00000000fcf8ffff
	lduwa	[%i4+%g0]0x89,%l2	! %l2 = 000000005c8d2639
!	%f30 = 3b4c213a, %f28 = 95b36874 34187d38
	fstod	%f30,%f28		! %f28 = 3f698427 40000000
!	Mem[0000000030181408] = ffffffff, %l3 = 39268d5c31c3ce7d
	ldsha	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffffffff

p0_label_109:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[000000001010140e] = 72eefee7
	sth	%l5,[%i4+0x00e]		! Mem[000000001010140c] = 72eeffff
!	%l5 = ffffffffffffffff, Mem[0000000010081410] = 00000000
	stwa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffff
!	Mem[0000000030181408] = ffffffff, %l1 = 00000000e4363abf
	swapa	[%i6+%o4]0x81,%l1	! %l1 = 00000000ffffffff
!	%f17 = ffffffff, Mem[0000000030041410] = ff060efc
	sta	%f17,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffff
!	Mem[0000000030101408] = 46000000, %l3 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000046
!	%f8  = ffe8827f 44f79fa4, Mem[0000000010081418] = ba8f4a7f 0000005d
	std	%f8 ,[%i2+0x018]	! Mem[0000000010081418] = ffe8827f 44f79fa4
!	Mem[0000000010101400] = 39268d5c 31c3ce7d ffff0000 72eeffff
!	%f0  = 000000ff 000000ff ff000000 ffff0031
!	%f4  = 000000ff 000000ff ff000000 00001a27
!	%f8  = ffe8827f 44f79fa4 000000ff 000000ff
!	%f12 = 551dfd7c 1402a247 7fffffff 00000000
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	Mem[00000000100c1400] = d77064e400000000, %l3 = 0000000000000046, %l1 = 00000000ffffffff
	casxa	[%i3]0x80,%l3,%l1	! %l1 = d77064e400000000
!	Mem[0000000010001408] = ff00e8ff, %l4 = 00000000ffffe256
	swapa	[%i0+%o4]0x88,%l4	! %l4 = 00000000ff00e8ff
!	%l2 = 5c8d2639, %l3 = 00000046, Mem[0000000010001408] = 56e2ffff fc0e06b4
	stda	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 5c8d2639 00000046

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff3a9c00, %l6 = 00000000113fd266
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000ff3a
!	Mem[0000000030181408] = e4363abf, %f16 = 00000000
	lda	[%i6+%o4]0x81,%f16	! %f16 = e4363abf
!	Mem[0000000010001403] = ff000000, %l5 = ffffffffffffffff
	ldsb	[%i0+0x003],%l5		! %l5 = 0000000000000000
!	Mem[0000000030081400] = 000000f2, %l2 = 000000005c8d2639
	ldswa	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000f2
!	Mem[0000000010081410] = ffffffff, %l2 = 00000000000000f2
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010041410] = 00000000000000a4, %l0 = a53ce84a481977f4
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = 00000000000000a4
!	Mem[0000000030141408] = 000000ff, %l6 = 000000000000ff3a
	ldsba	[%i5+%o4]0x89,%l6	! %l6 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010101408] = ff000000ffff0031, %l5 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l5	! %l5 = ff000000ffff0031
!	Mem[0000000030041410] = ffffffff, %l4 = 00000000ff00e8ff
	lduba	[%i1+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000211c0000] = ffff3e90, %l0 = 00000000000000a4, %asi = 80
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 000000000000ffff

p0_label_111:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000046, Mem[0000000010141400] = 000000ff
	stwa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000046
!	%l1 = d77064e400000000, Mem[0000000030081410] = dfcced6f2641f94b
	stxa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = d77064e400000000
!	%l6 = ffffffffffffffff, Mem[0000000010141410] = 596b2653
	stwa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff
!	%l7 = ffffffffffffffff, Mem[0000000010141400] = 00000046
	stwa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffff
!	%l3 = 0000000000000046, Mem[0000000030181408] = bf3a36e4
	stha	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = bf3a0046
!	%l6 = ffffffff, %l7 = ffffffff, Mem[00000000100c1408] = 97ffffff ffffff31
	stda	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffffff ffffffff
!	%l1 = d77064e400000000, Mem[0000000030081400] = f2000000
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l0 = 000000000000ffff, Mem[0000000030141410] = ffffffff
	stha	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff
!	Mem[0000000030101410] = ffffffff, %l4 = 00000000000000ff
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%f28 = 3f698427 40000000, %l1 = d77064e400000000
!	Mem[0000000030041430] = 56e24ef237b491a3
	add	%i1,0x030,%g1
	stda	%f28,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030041430] = 56e24ef237b491a3

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ffffffff, %l5 = ff000000ffff0031
	lduba	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 00000061ecffff00, %l2 = 000000000000ffff
	ldxa	[%i3+%o5]0x89,%l2	! %l2 = 00000061ecffff00
!	Mem[0000000030101400] = 5c8d2639, %f2  = ff000000
	lda	[%i4+%g0]0x89,%f2 	! %f2 = 5c8d2639
!	Mem[0000000030101400] = 5c8d2639, %l0 = 000000000000ffff
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000039
!	Mem[0000000010141410] = ffffffffe82b5672, %l1 = d77064e400000000
	ldxa	[%i5+%o5]0x80,%l1	! %l1 = ffffffffe82b5672
!	Mem[0000000010001405] = ffffffff, %l1 = ffffffffe82b5672
	ldsb	[%i0+0x005],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030101408] = ff000000, %f21 = 2641f94b
	lda	[%i4+%o4]0x81,%f21	! %f21 = ff000000
!	Mem[0000000030181400] = 0000ffffffffff97, %f14 = 7fffffff 00000000
	ldda	[%i6+%g0]0x89,%f14	! %f14 = 0000ffff ffffff97
!	Mem[0000000030041408] = 57e882ff, %l2 = 00000061ecffff00
	lduha	[%i1+%o4]0x89,%l2	! %l2 = 00000000000082ff
!	Mem[0000000010141428] = 1bd28945, %l7 = ffffffffffffffff, %asi = 80
	lduwa	[%i5+0x028]%asi,%l7	! %l7 = 000000001bd28945

p0_label_113:
!	Starting 10 instruction Store Burst
!	%l2 = 000082ff, %l3 = 00000046, Mem[0000000010001410] = 00000000 000000ff
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 000082ff 00000046
!	%l3 = 0000000000000046, Mem[0000000030181410] = a3b4213aba8f4a7f
	stxa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000046
!	%l0 = 00000039, %l1 = ffffffff, Mem[0000000010001418] = a3b4213a ba8f001b
	std	%l0,[%i0+0x018]		! Mem[0000000010001418] = 00000039 ffffffff
!	Mem[0000000030181408] = 46003abf, %l3 = 0000000000000046
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 0000000046003abf
!	Mem[0000000030041410] = ffffffff, %l3 = 0000000046003abf
	ldstuba	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000000082ff, Mem[00000000201c0001] = ff3a9c00
	stb	%l2,[%o0+0x001]		! Mem[00000000201c0000] = ffff9c00
!	%l1 = ffffffffffffffff, Mem[0000000010081400] = a3b4213aba8f001b
	stxa	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffffffffffff
!	%l3 = 00000000000000ff, immd = fffffffffffff745, %l2  = 00000000000082ff
	mulx	%l3,-0x8bb,%l2		! %l2 = fffffffffff74dbb
!	%l6 = ffffffffffffffff, Mem[0000000010081400] = ffffffffffffffff
	stxa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffffffffffff
!	Mem[0000000010101410] = ff000000, %l4 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 00000000ff000000

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff3e90, %l6 = ffffffffffffffff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041408] = ffffffff, %l0 = 0000000000000039
	lduba	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = ffffffff, %l3 = 00000000000000ff
	lduwa	[%i2+%g0]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[000000001004142c] = 00001a27, %l4 = 00000000ff000000, %asi = 80
	ldswa	[%i1+0x02c]%asi,%l4	! %l4 = 0000000000001a27
!	Mem[0000000010181400] = a3b4213a ba8f001b ff000000 7f000000
!	Mem[0000000010181410] = ff000000 00000000 1b5d5d2a 22822653
!	Mem[0000000010181420] = 34187d38 38e46569 2e0a5a36 584097af
!	Mem[0000000010181430] = ff46ffff ffff8fba 700f7502 da274637
	ldda	[%i6+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	Mem[0000000030181400] = 97ffffff ffff0000, %l0 = 000000ff, %l1 = ffffffff
	ldda	[%i6+%g0]0x81,%l0	! %l0 = 0000000097ffffff 00000000ffff0000
!	Mem[00000000100c1400] = d77064e4, %l2 = fffffffffff74dbb
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 00000000d77064e4
!	Mem[0000000030041410] = ffffffffffffffff, %l0 = 0000000097ffffff
	ldxa	[%i1+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181400] = a3b4213a ba8f001b ff000000 7f000000
!	Mem[0000000010181410] = ff000000 00000000 1b5d5d2a 22822653
!	Mem[0000000010181420] = 34187d38 38e46569 2e0a5a36 584097af
!	Mem[0000000010181430] = ff46ffff ffff8fba 700f7502 da274637
	ldda	[%i6+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[0000000010041408] = ffffffff, %l0 = ffffffffffffffff
	ldswa	[%i1+%o4]0x88,%l0	! %l0 = ffffffffffffffff

p0_label_115:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000030081400] = 00000000
	stha	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	%l2 = 00000000d77064e4, Mem[0000000030001400] = ffe8827f
	stba	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = e4e8827f
!	%l6 = ffffffff, %l7 = 1bd28945, Mem[0000000010101420] = ffe8827f 44f79fa4, %asi = 80
	stda	%l6,[%i4+0x020]%asi	! Mem[0000000010101420] = ffffffff 1bd28945
!	Mem[00000000211c0001] = ffff3e90, %l4 = 0000000000001a27
	ldstub	[%o2+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[00000000211c0000] = ffff3e90, %l2 = 00000000d77064e4
	ldstub	[%o2+%g0],%l2		! %l2 = 00000000000000ff
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000030001408] = 39268d5c 1f516e6b
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff ffffffff
!	Mem[0000000010041430] = ffa49bc4, %l0 = 00000000ffffffff
	swap	[%i1+0x030],%l0		! %l0 = 00000000ffa49bc4
!	Mem[0000000030141400] = ff000000, %l3 = 00000000ffffffff
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030001408] = 000000ff
	stwa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Mem[0000000021800180] = 7c33ade0, %l1 = 00000000ffff0000
	ldstuba	[%o3+0x180]%asi,%l1	! %l1 = 000000000000007c

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 000082ff, %l7 = 000000001bd28945
	lduha	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = ffff3e90, %l5 = 00000000000000ff
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010101418] = ff000000 00001a27, %l6 = ffffffff, %l7 = 00000000, %asi = 80
	ldda	[%i4+0x018]%asi,%l6	! %l6 = 00000000ff000000 0000000000001a27
!	Mem[0000000010141400] = ffffffff, %f2  = 5c8d2639
	lda	[%i5+%g0]0x80,%f2 	! %f2 = ffffffff
!	Mem[0000000010041418] = 1b4f5570 00003192, %l6 = ff000000, %l7 = 00001a27, %asi = 80
	ldda	[%i1+0x018]%asi,%l6	! %l6 = 000000001b4f5570 0000000000003192
!	Mem[00000000100c1402] = d77064e4, %l7 = 0000000000003192, %asi = 80
	lduha	[%i3+0x002]%asi,%l7	! %l7 = 00000000000064e4
!	Mem[0000000010181408] = 000000ff, %l1 = 000000000000007c
	ldsba	[%i6+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000218001c0] = 39ff4010, %l7 = 00000000000064e4
	lduh	[%o3+0x1c0],%l7		! %l7 = 00000000000039ff
!	Mem[0000000010081430] = 00005400 ecffffff, %l2 = 000000ff, %l3 = 00000000
	ldd	[%i2+0x030],%l2		! %l2 = 0000000000005400 00000000ecffffff
!	Mem[0000000030101410] = ffffffff, %f4  = 000000ff
	lda	[%i4+%o5]0x89,%f4 	! %f4 = ffffffff

p0_label_117:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000005400, Mem[0000000010141408] = ffffffff
	stba	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ffffff
!	%f18 = ff000000, Mem[0000000010041400] = ff000000
	sta	%f18,[%i1+%g0]0x80	! Mem[0000000010041400] = ff000000
!	%l2 = 0000000000005400, Mem[0000000030041408] = ff82e85700000000
	stxa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000000005400
!	%f13 = 1402a247, Mem[00000000300c1408] = fffff8fc
	sta	%f13,[%i3+%o4]0x81	! Mem[00000000300c1408] = 1402a247
!	%f3  = ffff0031, Mem[00000000100c1400] = d77064e4
	sta	%f3 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffff0031
!	%l5 = 000000000000ffff, Mem[0000000030041400] = 0000ffffffffff97
	stxa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000000000ffff
!	%l5 = 000000000000ffff, Mem[0000000010141410] = 72562be8ffffffff
	stxa	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000000000ffff
	membar	#Sync			! Added by membar checker (26)
!	%f14 = 0000ffff, Mem[000000001018142c] = 584097af
	sta	%f14,[%i6+0x02c]%asi	! Mem[000000001018142c] = 0000ffff
!	%l3 = 00000000ecffffff, Mem[0000000010101408] = 000000ff
	stba	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	%l6 = 000000001b4f5570, Mem[00000000100c1418] = 83c4274f1ac1b304, %asi = 80
	stxa	%l6,[%i3+0x018]%asi	! Mem[00000000100c1418] = 000000001b4f5570

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff0000ff a49ff744 ff000000 000000ff
!	Mem[0000000030141410] = ffffffff fffff8fc 6541627a 493a8463
!	Mem[0000000030141420] = 60255908 34ea2ff9 edb18945 8c37c77a
!	Mem[0000000030141430] = 0d3d0474 70971a35 7220cc52 44dc3fdb
	ldda	[%i5+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030141400
!	Mem[000000001004143c] = 0000007f, %f24 = 34187d38
	ld	[%i1+0x03c],%f24	! %f24 = 0000007f
!	Mem[00000000211c0000] = ffff3e90, %l7 = 00000000000039ff
	ldub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010181406] = ba8f001b, %l3 = 00000000ecffffff, %asi = 80
	lduha	[%i6+0x006]%asi,%l3	! %l3 = 000000000000001b
!	Mem[0000000030041408] = 00000000, %f30 = 700f7502
	lda	[%i1+%o4]0x81,%f30	! %f30 = 00000000
!	Mem[00000000100c1400] = 3100ffff, %l0 = 00000000ffa49bc4
	lduha	[%i3+%g0]0x88,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030181410] = 0000000000000046, %l5 = 000000000000ffff
	ldxa	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000046
!	Mem[00000000100c1400] = 3100ffff, %l4 = 00000000000000ff
	ldswa	[%i3+%g0]0x88,%l4	! %l4 = 000000003100ffff
!	Mem[0000000010001410] = ff820000, %l3 = 000000000000001b
	lduha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181428] = 2e0a5a36, %l0 = 000000000000ffff, %asi = 80
	ldsba	[%i6+0x028]%asi,%l0	! %l0 = 000000000000002e

p0_label_119:
!	Starting 10 instruction Store Burst
!	%f22 = 1b5d5d2a 22822653, %l7 = 00000000000000ff
!	Mem[0000000010081418] = ffe8827f44f79fa4
	add	%i2,0x018,%g1
	stda	%f22,[%g1+%l7]ASI_PST8_P ! Mem[0000000010081418] = 1b5d5d2a22822653
!	%l6 = 1b4f5570, %l7 = 000000ff, Mem[00000000300c1410] = 00ffffec 61000000
	stda	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 1b4f5570 000000ff
!	%f18 = ff000000, %f10 = 7ac7378c, %f30 = 00000000
	fadds	%f18,%f10,%f30		! %f30 = feff38c8
!	Mem[0000000030101408] = 000000ff, %l1 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081400] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%f22 = 1b5d5d2a 22822653, Mem[0000000030041400] = 00000000 ffff0000
	stda	%f22,[%i1+%g0]0x89	! Mem[0000000030041400] = 1b5d5d2a 22822653
!	Mem[00000000211c0000] = ffff3e90, %l6 = 000000001b4f5570
	ldstub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[000000001000143c] = 00000031, %l1 = 00000000000000ff
	ldstub	[%i0+0x03c],%l1		! %l1 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000010141400] = ffffffff
	stba	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffff
!	%l5 = 0000000000000046, Mem[0000000010101410] = 000000ff
	stha	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000046

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = 700f7502da274637, %f28 = ff46ffff ffff8fba, %asi = 80
	ldda	[%i6+0x038]%asi,%f28	! %f28 = 700f7502 da274637
!	Mem[0000000030101408] = 000000ff, %l7 = 00000000000000ff
	lduba	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = ff000000, %l4 = 000000003100ffff
	ldsha	[%i4+%o4]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[00000000300c1400] = ff000000, %l5 = 0000000000000046
	ldswa	[%i3+%g0]0x81,%l5	! %l5 = ffffffffff000000
!	Mem[00000000100c1400] = 000000003100ffff, %f30 = feff38c8 da274637
	ldda	[%i3+%g0]0x88,%f30	! %f30 = 00000000 3100ffff
!	Mem[0000000010041410] = 00000000000000a4, %f18 = ff000000 7f000000
	ldd	[%i1+%o5],%f18		! %f18 = 00000000 000000a4
!	Mem[0000000030141408] = 000000ff, %l2 = 0000000000005400
	lduha	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1430] = 551dfd7c1402a247, %f24 = 0000007f 38e46569
	ldd	[%i3+0x030],%f24	! %f24 = 551dfd7c 1402a247
!	Mem[0000000010101400] = 000000ff, %f23 = 22822653
	ld	[%i4+%g0],%f23		! %f23 = 000000ff
!	Mem[0000000010101410] = ff00000000000046, %l5 = ffffffffff000000
	ldxa	[%i4+%o5]0x88,%l5	! %l5 = ff00000000000046

p0_label_121:
!	Starting 10 instruction Store Burst
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010141408] = ffffff00 00000000
	stda	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff 000000ff
!	Mem[0000000030001410] = ff0000ff, %l6 = 00000000000000ff
	ldsba	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	%f12 = 351a9770 74043d0d, Mem[0000000010081400] = ffffffff ffffffff
	stda	%f12,[%i2+%g0]0x88	! Mem[0000000010081400] = 351a9770 74043d0d
!	Mem[0000000010001410] = ff820000, %l6 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000010141400] = ffffffff
	stba	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffff
!	%f3  = 000000ff, Mem[0000000010181400] = a3b4213a
	st	%f3 ,[%i6+%g0]		! Mem[0000000010181400] = 000000ff
!	%f8  = f92fea34, Mem[0000000010101428] = 000000ff
	st	%f8 ,[%i4+0x028]	! Mem[0000000010101428] = f92fea34
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010041408] = ffffffff 97ffffff
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 000000ff
!	%f20 = ff000000, Mem[0000000030041410] = ffffffff
	sta	%f20,[%i1+%o5]0x89	! Mem[0000000030041410] = ff000000
!	Mem[0000000010041400] = ff000000, %l0 = 000000000000002e
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ffff0000, %l7 = 00000000000000ff
	lduba	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Code Fragment 3, seed = 170602
p0_fragment_13:
!	%l0 = 00000000000000ff
	setx	0xdcee13cc445b2ed6,%g7,%l0 ! %l0 = dcee13cc445b2ed6
!	%l1 = 0000000000000000
	setx	0x71f6f2b4983d6401,%g7,%l1 ! %l1 = 71f6f2b4983d6401
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dcee13cc445b2ed6
	setx	0x514202a3fa912d3c,%g7,%l0 ! %l0 = 514202a3fa912d3c
!	%l1 = 71f6f2b4983d6401
	setx	0x37d24ce32f3f8d87,%g7,%l1 ! %l1 = 37d24ce32f3f8d87
p0_fragment_13_end:
!	Mem[0000000010181410] = ff00000000000000, %l6 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l6	! %l6 = ff00000000000000
!	Mem[0000000010181408] = 000000ff, %f16 = a3b4213a
	lda	[%i6+%o4]0x88,%f16	! %f16 = 000000ff
!	Mem[0000000010181400] = 000000ff, %l0 = 514202a3fa912d3c
	lduha	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = ff000000ff000000, %l6 = ff00000000000000
	ldxa	[%i4+%g0]0x88,%l6	! %l6 = ff000000ff000000
!	Mem[0000000030041408] = 00000000, %l4 = ffffffffffffff00
	lduha	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 53268222, %l3 = 00000000000000ff
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 0000000053268222
!	Mem[0000000010101410] = 00000046, %l3 = 0000000053268222
	ldswa	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000046
!	Mem[0000000030041408] = 00000000, %l2 = 00000000000000ff
	ldswa	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000

p0_label_123:
!	Starting 10 instruction Store Burst
!	%f10 = 7ac7378c, Mem[0000000010181414] = 00000000
	st	%f10,[%i6+0x014]	! Mem[0000000010181414] = 7ac7378c
!	Mem[0000000010041410] = 00000000, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000
!	%l5 = ff00000000000046, Mem[00000000201c0001] = ffff9c00, %asi = 80
	stba	%l5,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff469c00
!	%l4 = 0000000000000000, Mem[00000000300c1410] = 70554f1b
	stba	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 70554f00
!	%l7 = 00000000000000ff, Mem[00000000100c1438] = 97ff1571f24ee256, %asi = 80
	stxa	%l7,[%i3+0x038]%asi	! Mem[00000000100c1438] = 00000000000000ff
!	Mem[00000000300c1410] = 004f5570, %l4 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	%l1 = 37d24ce32f3f8d87, Mem[0000000010081420] = 00000000
	stw	%l1,[%i2+0x020]		! Mem[0000000010081420] = 2f3f8d87
!	Mem[0000000030081410] = 00000000, %l6 = ff000000ff000000
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010081400] = 351a977074043d0d
	stxa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000000
!	Mem[0000000010181408] = ff000000, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000ff000000

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000 ff000000, %l2 = ff000000, %l3 = 00000046
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 00000000ff000000 00000000ff000000
!	Mem[0000000030141400] = ff0000ff a49ff744, %l0 = 00000000, %l1 = 2f3f8d87
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff0000ff 00000000a49ff744
!	Mem[00000000100c1408] = ffffffffffffffff, %l1 = 00000000a49ff744
	ldxa	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181430] = ff46ffffffff8fba, %f0  = 44f79fa4 ff0000ff
	ldd	[%i6+0x030],%f0 	! %f0  = ff46ffff ffff8fba
!	%l7 = 00000000000000ff, immd = 0000000000000ca5, %l108 = 0000000000000001
	sdivx	%l7,0xca5,%l1		! %l1 = 0000000000000000
!	Mem[0000000010001400] = 000000ff, %l5 = ff00000000000046
	ldsha	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181408] = 00000000 7f000000, %l2 = ff000000, %l3 = ff000000
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000 000000007f000000
!	Mem[0000000030141400] = ff0000ff, %f28 = 700f7502
	lda	[%i5+%g0]0x81,%f28	! %f28 = ff0000ff
!	Mem[00000000211c0000] = ffff3e90, %l6 = 0000000000000000
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010141408] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = ffffffffffffffff

p0_label_125:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ffffffff, %l3 = 000000007f000000
	swapa	[%i3+%o4]0x88,%l3	! %l3 = 00000000ffffffff
!	%l2 = ffffffff, %l3 = ffffffff, Mem[0000000010081400] = 00000000 00000000
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffff ffffffff
!	%f8  = f92fea34, Mem[000000001010141c] = 00001a27
	st	%f8 ,[%i4+0x01c]	! Mem[000000001010141c] = f92fea34
!	%l5 = 00000000000000ff, Mem[0000000010101414] = 000000ff, %asi = 80
	stwa	%l5,[%i4+0x014]%asi	! Mem[0000000010101414] = 000000ff
!	%f6  = 63843a49, Mem[0000000030081408] = 0000ffff
	sta	%f6 ,[%i2+%o4]0x89	! Mem[0000000030081408] = 63843a49
!	%l0 = 00000000ff0000ff, immd = fffffa78, %y  = 00000005
	umul	%l0,-0x588,%l7		! %l7 = fefffb7c87fa7d88, %y = fefffb7c
!	%l6 = ffffffff, %l7 = 87fa7d88, Mem[0000000010181408] = 00000000 7f000000
	std	%l6,[%i6+%o4]		! Mem[0000000010181408] = ffffffff 87fa7d88
!	Mem[00000000211c0000] = ffff3e90, %l7 = fefffb7c87fa7d88
	ldstub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (27)
!	%l7 = 00000000000000ff, Mem[0000000030141400] = ff0000ffa49ff744
	stxa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000000000ff
!	%f22 = 1b5d5d2a 000000ff, %l7 = 00000000000000ff
!	Mem[0000000030101408] = ff00000072eefee7
	add	%i4,0x008,%g1
	stda	%f22,[%g1+%l7]ASI_PST16_S ! Mem[0000000030101408] = 1b5d5d2a000000ff

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081413] = ffffffff, %l2 = ffffffffffffffff
	ldstuba	[%i2+0x013]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = 7f000000, %l6 = ffffffffffffffff
	lduwa	[%i3+%o4]0x88,%l6	! %l6 = 000000007f000000
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000218001c0] = 39ff4010, %l4 = 0000000000000000
	lduh	[%o3+0x1c0],%l4		! %l4 = 00000000000039ff
!	Mem[0000000010181438] = 700f7502, %l6 = 000000007f000000
	lduw	[%i6+0x038],%l6		! %l6 = 00000000700f7502
!	Mem[0000000030001408] = 00000000, %l0 = 00000000ff0000ff
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1405] = 00000000, %l3 = 00000000ffffffff
	ldsb	[%i3+0x005],%l3		! %l3 = 0000000000000000
!	Mem[00000000100c1400] = ffff0031, %l0 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l0	! %l0 = ffffffffffff0031
!	%f27 = 584097af, %f8  = f92fea34
	fcmps	%fcc3,%f27,%f8 		! %fcc3 = 2
!	Mem[0000000030001400] = e4e8827f, %l1 = 0000000000000000
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffffe4e8

p0_label_127:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081434] = ecffffff, %l4 = 000039ff, %l6 = 700f7502
	add	%i2,0x34,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 00000000ecffffff
!	Mem[00000000100c1408] = 0000007f, %l2 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 000000000000007f
!	%l2 = 000000000000007f, Mem[0000000010001408] = 39268d5c
	stwa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000007f
!	%l7 = 00000000000000ff, Mem[0000000010041408] = 00000000
	stba	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000
!	%f3  = 000000ff, Mem[0000000010141410] = 0000ffff
	sta	%f3 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%f8  = f92fea34 08592560, Mem[00000000100c1410] = 000000ff 000000ff
	stda	%f8 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = f92fea34 08592560
!	%l7 = 00000000000000ff, Mem[0000000030081400] = 00000000000000ff
	stxa	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000000000ff
!	Mem[0000000030001400] = 7f82e8e4, %l6 = 00000000ecffffff
	ldstuba	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000e4
!	%l0 = ffffffffffff0031, Mem[0000000010041400] = ff000000
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = ffff0031
!	Mem[0000000030001400] = 7f82e8ff, %l6 = 00000000000000e4
	ldstuba	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 63843a49, %l4 = 00000000000039ff
	ldsba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000049
!	%f9  = 08592560, %f29 = da274637
	fcmps	%fcc0,%f9 ,%f29		! %fcc0 = 2
!	Mem[0000000030041400] = 532682222a5d5d1b, %l3 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l3	! %l3 = 532682222a5d5d1b
!	Mem[0000000030101400] = 7dcec331 5c8d2639, %l0 = ffff0031, %l1 = ffffe4e8
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 000000005c8d2639 000000007dcec331
!	Mem[0000000010181408] = 887dfa87ffffffff, %l5 = 00000000000000ff
	ldxa	[%i6+%o4]0x88,%l5	! %l5 = 887dfa87ffffffff
!	Mem[0000000010101400] = ff000000, %l3 = 532682222a5d5d1b
	lduha	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 000000ff, %l1 = 000000007dcec331, %asi = 80
	ldsha	[%i4+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 46000000000000ff, %f4  = fcf8ffff ffffffff
	ldda	[%i4+%o5]0x80,%f4 	! %f4  = 46000000 000000ff
!	Mem[0000000021800080] = 00693d20, %l3 = 0000000000000000
	ldsh	[%o3+0x080],%l3		! %l3 = 0000000000000069
!	Mem[0000000010181419] = 1b5d5d2a, %l5 = 887dfa87ffffffff
	ldub	[%i6+0x019],%l5		! %l5 = 000000000000005d

p0_label_129:
!	Starting 10 instruction Store Burst
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000030181408] = 46000000 00000000
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff 000000ff
!	Mem[0000000010081408] = 56e24ef2, %l3 = 0000000000000069
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000056
!	%l2 = 000000000000007f, Mem[0000000030181400] = ffffff97
	stwa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000007f
!	%f19 = 000000a4, Mem[0000000010181400] = 000000ff
	sta	%f19,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000a4
!	%f28 = ff0000ff, Mem[0000000030141410] = ffffffff
	sta	%f28,[%i5+%o5]0x89	! Mem[0000000030141410] = ff0000ff
!	%f28 = ff0000ff da274637, %l0 = 000000005c8d2639
!	Mem[0000000030101430] = 47a202147cfd1d55
	add	%i4,0x030,%g1
	stda	%f28,[%g1+%l0]ASI_PST16_S ! Mem[0000000030101430] = ff0002147cfd4637
!	%l2 = 000000000000007f, imm = fffffffffffff14f, %l5 = 000000000000005d
	andn	%l2,-0xeb1,%l5		! %l5 = 0000000000000030
!	%l6 = 00000000000000ff, Mem[000000001004141e] = 00003192, %asi = 80
	stha	%l6,[%i1+0x01e]%asi	! Mem[000000001004141c] = 000000ff
!	%l3 = 0000000000000056, Mem[0000000030141410] = ff0000ff
	stwa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000056
!	Mem[0000000030001408] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000000ff ffffffff, %l0 = 5c8d2639, %l1 = 00000000
	ldda	[%i1+%o5]0x81,%l0	! %l0 = 00000000000000ff 00000000ffffffff
!	Mem[0000000010041438] = 00000000 0000007f, %l4 = 00000049, %l5 = 00000030
	ldd	[%i1+0x038],%l4		! %l4 = 0000000000000000 000000000000007f
!	Mem[0000000010001410] = ff0082ff 00000046, %l4 = 00000000, %l5 = 0000007f
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff0082ff 0000000000000046
!	Mem[0000000030001400] = 7f82e8ff, %l0 = 00000000000000ff
	lduwa	[%i0+%g0]0x89,%l0	! %l0 = 000000007f82e8ff
!	Mem[0000000010141410] = 000000ff, %f6  = 63843a49
	lda	[%i5+%o5]0x88,%f6 	! %f6 = 000000ff
!	Mem[0000000010081410] = ffffffff 00000000, %l0 = 7f82e8ff, %l1 = ffffffff
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000ffffffff 0000000000000000
!	Mem[0000000010041400] = ffff0031, %l4 = 00000000ff0082ff
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	%l2 = 000000000000007f, imm = fffffffffffff7aa, %l3 = 0000000000000056
	and	%l2,-0x856,%l3		! %l3 = 000000000000002a
!	Mem[0000000010101428] = f92fea34, %l4 = ffffffffffffffff, %asi = 80
	ldsba	[%i4+0x028]%asi,%l4	! %l4 = fffffffffffffff9
!	Mem[00000000100c1400] = ffff0031, %f25 = 1402a247
	lda	[%i3+%g0]0x80,%f25	! %f25 = ffff0031

p0_label_131:
!	Starting 10 instruction Store Burst
!	%l4 = fffffffffffffff9, Mem[00000000300c1410] = ff4f5570
	stba	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = f94f5570
!	%l5 = 0000000000000046, Mem[00000000300c1400] = ff0000000000ffff
	stxa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000046
!	%f2  = ff000000 000000ff, Mem[0000000010141430] = ff000000 374627ff
	std	%f2 ,[%i5+0x030]	! Mem[0000000010141430] = ff000000 000000ff
!	Mem[0000000010141410] = 000000ff, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l2 = 0000007f, %l3 = 0000002a, Mem[00000000100c1408] = ff000000 ffffffff
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000007f 0000002a
!	%l5 = 0000000000000046, Mem[0000000030001410] = ff0000ff
	stwa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000046
!	%f25 = ffff0031, Mem[0000000010081400] = ffffffff
	sta	%f25,[%i2+%g0]0x80	! Mem[0000000010081400] = ffff0031
!	%f10 = 7ac7378c 4589b1ed, Mem[0000000030001400] = 7f82e8ff 000000ff
	stda	%f10,[%i0+%g0]0x89	! Mem[0000000030001400] = 7ac7378c 4589b1ed
!	Mem[0000000010141400] = ffffffff, %l5 = 0000000000000046
	swapa	[%i5+%g0]0x88,%l5	! %l5 = 00000000ffffffff
!	%l0 = 00000000ffffffff, Mem[0000000010081410] = ffffffff00000000, %asi = 80
	stxa	%l0,[%i2+0x010]%asi	! Mem[0000000010081410] = 00000000ffffffff

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff8200ff, %l5 = 00000000ffffffff
	ldswa	[%i0+%o5]0x88,%l5	! %l5 = ffffffffff8200ff
!	Mem[0000000010181400] = a4000000, %l7 = 00000000000000ff
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 46000000, %l4 = fffffffffffffff9
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = 0000000046000000
!	Mem[0000000010141408] = ff000000, %f2  = ff000000
	lda	[%i5+0x008]%asi,%f2 	! %f2 = ff000000
!	Mem[0000000010181400] = 000000a4 ba8f001b, %l4 = 46000000, %l5 = ff8200ff, %asi = 80
	ldda	[%i6+0x000]%asi,%l4	! %l4 = 00000000000000a4 00000000ba8f001b
!	Mem[0000000030001400] = 4589b1ed, %l6 = 00000000000000ff
	ldsba	[%i0+%g0]0x89,%l6	! %l6 = ffffffffffffffed
!	%l5 = 00000000ba8f001b, Mem[0000000030141400] = 00000000
	stba	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000001b
!	Mem[0000000030181400] = 0000007f, %l4 = 00000000000000a4
	ldswa	[%i6+%g0]0x89,%l4	! %l4 = 000000000000007f
!	Mem[0000000030181410] = 00000046, %l1 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000046
!	Mem[0000000030141410] = 56000000, %l7 = 0000000000000000
	ldsba	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000056

p0_label_133:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 3100ffff, %l3 = 000000000000002a
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 000000003100ffff
!	%l6 = ffffffffffffffed, Mem[0000000010141408] = ff000000
	stwa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffed
!	Mem[0000000010181410] = 000000ff, %l2 = 000000000000007f
	lduba	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%l1 = 0000000000000046, Mem[0000000030001408] = ff000000
	stwa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000046
!	Mem[000000001000142b] = ff000000, %l1 = 0000000000000046
	ldstuba	[%i0+0x02b]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l4 = 000000000000007f
	ldstuba	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[000000001018140e] = 87fa7d88, %l3 = 000000003100ffff
	ldstub	[%i6+0x00e],%l3		! %l3 = 000000000000007d
!	Mem[0000000010141400] = 46000000 00000000 ffffffed ff000000
!	%f0  = ff46ffff ffff8fba ff000000 000000ff
!	%f4  = 46000000 000000ff 000000ff 7a624165
!	%f8  = f92fea34 08592560 7ac7378c 4589b1ed
!	%f12 = 351a9770 74043d0d db3fdc44 52cc2072
	stda	%f0 ,[%i5+%g0]ASI_COMMIT_P	! Block Store to 0000000010141400
!	Mem[0000000030181408] = 000000ff, %l3 = 000000000000007d
	ldstuba	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101400] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000

p0_label_134:
!	Starting 10 instruction Load Burst
!	%l7 = 0000000000000056, immd = 0000000000000f6f, %l108 = 0000000000000007
	sdivx	%l7,0xf6f,%l7		! %l7 = 0000000000000000
!	Mem[0000000010001418] = 00000039, %l6 = ffffffffffffffed
	ldub	[%i0+0x018],%l6		! %l6 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l6 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030101410] = ffffffff, %l4 = 00000000000000ff
	ldsba	[%i4+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000211c0000] = ffff3e90, %l5 = 00000000ba8f001b, %asi = 80
	ldsba	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041408] = 00000000, %l5 = ffffffffffffffff
	lduba	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = 3100ffff, %l1 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l1	! %l1 = 000000003100ffff
!	Mem[0000000030041408] = 00000000, %l0 = 00000000ffffffff
	lduha	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = edb18945 ffffffff, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 00000000ffffffff 00000000edb18945
!	Mem[00000000100c1430] = 551dfd7c, %l6 = ffffffffffffff00, %asi = 80
	lduba	[%i3+0x030]%asi,%l6	! %l6 = 0000000000000055

p0_label_135:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = ff0000ff, %l4 = ffffffffffffffff
	ldstuba	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l2 = 00000000ffffffff, Mem[0000000030001400] = edb189458c37c77a
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000ffffffff
!	Mem[00000000100c1400] = 0000002a, %l4 = 00000000000000ff
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 000000000000002a
!	%f3  = 000000ff, Mem[00000000100c1410] = f92fea34
	sta	%f3 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	%l4 = 000000000000002a, Mem[0000000010001410] = 46000000ff8200ff
	stxa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000000000002a
!	%l3 = 00000000edb18945, Mem[0000000010181410] = 8c37c77a000000ff
	stxa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000edb18945
!	%f27 = 584097af, Mem[0000000030141410] = 00000056
	sta	%f27,[%i5+%o5]0x89	! Mem[0000000030141410] = 584097af
!	Mem[0000000030001410] = 00000046, %l4 = 000000000000002a
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010041410] = 00000000
	stwa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l3 = 00000000edb18945, Mem[0000000010001410] = 2a000000
	stba	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 45000000

p0_label_136:
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000000055, %l3 = 00000000edb18945, %y  = fefffb7c
	udiv	%l6,%l3,%l0		! %l0 = 00000000ffffffff
	mov	%l0,%y			! %y = ffffffff
!	Mem[0000000030081410] = 000000ff, %l0 = 00000000ffffffff
	lduwa	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = a4000000, %l5 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = ffffffff, %l6 = 0000000000000055
	lduba	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081400] = ffff0031ffffffff, %f24 = 551dfd7c ffff0031
	ldd	[%i2+%g0],%f24		! %f24 = ffff0031 ffffffff
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010141410] = 46000000, %l5 = 0000000000000000
	lduwa	[%i5+%o5]0x80,%l5	! %l5 = 0000000046000000
!	%f27 = 584097af, %f20 = ff000000, %f21 = 00000000
	fdivs	%f27,%f20,%f21		! %f21 = 98c097af
!	Mem[0000000030001408] = 46000000, %f23 = 000000ff
	lda	[%i0+%o4]0x89,%f23	! %f23 = 46000000
!	Mem[0000000010181420] = 34187d38, %l6 = 00000000000000ff
	lduw	[%i6+0x020],%l6		! %l6 = 0000000034187d38
!	Mem[0000000010041420] = 4d4d5f58 17e1eb09, %l2 = ffffffff, %l3 = edb18945, %asi = 80
	ldda	[%i1+0x020]%asi,%l2	! %l2 = 000000004d4d5f58 0000000017e1eb09

p0_label_137:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000201c0001] = ff469c00, %asi = 80
	stba	%l7,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff009c00
!	Mem[0000000030041410] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030081408] = 493a84631481c8fe
	stxa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010141400] = ffff46ff
	stha	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = ffff0000
!	%l1 = 000000003100ffff, Mem[0000000030181400] = 7f000000
	stba	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	%l0 = 00000000000000ff, Mem[0000000010181410] = 4589b1ed00000000
	stxa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000000000ff
!	Mem[0000000030141408] = 000000ff, %l5 = 0000000046000000
	lduha	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l1 = 000000003100ffff, %l5 = 00000000000000ff, %l4  = 0000000000000000
	mulx	%l1,%l5,%l4		! %l4 = 00000030cffeff01
!	%f26 = 2e0a5a36 584097af, Mem[0000000010081400] = 3100ffff ffffffff
	stda	%f26,[%i2+%g0]0x88	! Mem[0000000010081400] = 2e0a5a36 584097af
!	%f6  = 000000ff, Mem[0000000010181400] = a4000000
	sta	%f6 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 7f00000000000046, %f10 = 7ac7378c 4589b1ed
	ldda	[%i0+%o4]0x80,%f10	! %f10 = 7f000000 00000046
!	Mem[000000001014140e] = 000000ff, %l2 = 000000004d4d5f58
	lduh	[%i5+0x00e],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030141408] = 000000ff, %l4 = 00000030cffeff01
	ldsha	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041408] = 00000000, %l3 = 0000000017e1eb09
	ldsba	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %l2 = 00000000000000ff
	ldsha	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[00000000300c1410] = 70554ff9, %l1 = 000000003100ffff
	ldswa	[%i3+%o5]0x89,%l1	! %l1 = 0000000070554ff9
!	Mem[00000000300c1408] = 1402a247, %l3 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000014
!	Mem[00000000201c0001] = ff009c00, %l0 = 00000000000000ff, %asi = 80
	ldsba	[%o0+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = ff00000000000046, %f6  = 000000ff 7a624165
	ldda	[%i4+%o5]0x88,%f6 	! %f6  = ff000000 00000046
!	Mem[0000000010181408] = ffffffff 87faff88, %l6 = 34187d38, %l7 = 00000000
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 00000000ffffffff 0000000087faff88

p0_label_139:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffff00, Mem[0000000010141436] = 74043d0d, %asi = 80
	stba	%l2,[%i5+0x036]%asi	! Mem[0000000010141434] = 7404000d
!	Mem[0000000030001408] = 46000000, %l2 = ffffffffffffff00
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%f2  = ff000000 000000ff, Mem[0000000010001410] = 00000045 00000000
	stda	%f2 ,[%i0+%o5]0x88	! Mem[0000000010001410] = ff000000 000000ff
!	Mem[0000000010141400] = ffff0000, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%l0 = 00000000, %l1 = 70554ff9, Mem[0000000010101428] = f92fea34 000000ff, %asi = 80
	stda	%l0,[%i4+0x028]%asi	! Mem[0000000010101428] = 00000000 70554ff9
!	%l0 = 0000000000000000, Mem[0000000010141400] = ff00ffff
	stba	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000ffff
!	Mem[00000000211c0001] = ffff3e90, %l6 = 00000000ffffffff
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	%f8  = f92fea34, %f2  = ff000000
	fcmpes	%fcc3,%f8 ,%f2 		! %fcc3 = 2
!	%f20 = ff000000, Mem[000000001000143c] = ff000031
	st	%f20,[%i0+0x03c]	! Mem[000000001000143c] = ff000000
!	Mem[0000000010041410] = 00000000, %l1 = 0000000070554ff9
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_140:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ffff0000, %l0 = 0000000000000000
	ldsba	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 460000ff, %l7 = 0000000087faff88
	ldsha	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = ff000046, %l7 = 00000000000000ff
	lduwa	[%i0+%o5]0x81,%l7	! %l7 = 00000000ff000046
!	Mem[0000000030181410] = 46000000, %l3 = 0000000000000014
	lduha	[%i6+%o5]0x81,%l3	! %l3 = 0000000000004600
!	Mem[00000000100c1410] = 000000ff, %l4 = 00000000000000ff, %asi = 80
	ldswa	[%i3+0x010]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101400] = ff000000ff0000ff, %f18 = 00000000 000000a4
	ldda	[%i4+%g0]0x88,%f18	! %f18 = ff000000 ff0000ff
!	Mem[00000000100c1428] = dfcced6f, %l3 = 0000000000004600
	lduw	[%i3+0x028],%l3		! %l3 = 00000000dfcced6f
!	Mem[0000000030101410] = edb18945 ffffffff, %l2 = 00000000, %l3 = dfcced6f
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 00000000ffffffff 00000000edb18945
!	Mem[0000000030101408] = 1b5d5d2a, %l5 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l5	! %l5 = 000000000000001b
!	Mem[00000000100c1410] = 000000ff, %f4  = 46000000
	lda	[%i3+%o5]0x80,%f4 	! %f4 = 000000ff

p0_label_141:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030141408] = ff000000000000ff
	stxa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000
!	%l5 = 000000000000001b, Mem[0000000030181408] = 000000ff
	stha	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000001b
!	%f30 = 00000000, %f3  = 000000ff, %f0  = ff46ffff ffff8fba
	fsmuld	%f30,%f3 ,%f0 		! %f0  = 00000000 00000000
!	%f22 = 1b5d5d2a 46000000, Mem[0000000010101408] = ff000000 ffff0031
	stda	%f22,[%i4+%o4]0x80	! Mem[0000000010101408] = 1b5d5d2a 46000000
!	Mem[0000000030141400] = 1b000000, %l6 = 00000000000000ff
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 000000000000001b
!	Mem[0000000010101400] = ff0000ff 000000ff 1b5d5d2a 46000000
!	%f0  = 00000000 00000000 ff000000 000000ff
!	%f4  = 000000ff 000000ff ff000000 00000046
!	%f8  = f92fea34 08592560 7f000000 00000046
!	%f12 = 351a9770 74043d0d db3fdc44 52cc2072
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%l5 = 000000000000001b, Mem[0000000030181408] = 000000ff0000001b
	stxa	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000000000001b
!	%l0 = 0000000000000000, Mem[0000000010181408] = ffffffff
	stba	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffff00
!	%l4 = 000000ff, %l5 = 0000001b, Mem[00000000100c1410] = 000000ff 08592560, %asi = 80
	stda	%l4,[%i3+0x010]%asi	! Mem[00000000100c1410] = 000000ff 0000001b
!	%l0 = 0000000000000000, Mem[0000000010101416] = 000000ff, %asi = 80
	stha	%l0,[%i4+0x016]%asi	! Mem[0000000010101414] = 00000000

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181414] = 000000ff, %l6 = 000000000000001b, %asi = 80
	lduwa	[%i6+0x014]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141408] = ff000000000000ff, %f18 = ff000000 ff0000ff
	ldda	[%i5+%o4]0x88,%f18	! %f18 = ff000000 000000ff
!	Mem[0000000010081408] = f24ee2ff, %l5 = 000000000000001b
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = fffffffff24ee2ff
!	Mem[0000000010081438] = 7dcec331fff79fa4, %f20 = ff000000 98c097af, %asi = 80
	ldda	[%i2+0x038]%asi,%f20	! %f20 = 7dcec331 fff79fa4
!	Mem[000000001018140f] = 87faff88, %l2 = 00000000ffffffff
	ldub	[%i6+0x00f],%l2		! %l2 = 0000000000000088
!	Mem[0000000030081400] = ff000000 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000030181400] = ff000000, %l2 = 0000000000000088
	ldsha	[%i6+%g0]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010141428] = 7ac7378c, %l3 = 00000000edb18945
	ldsw	[%i5+0x028],%l3		! %l3 = 000000007ac7378c
!	%f16 = 000000ff ba8f001b, %f31 = 3100ffff
	fdtoi	%f16,%f31		! tt=0x22, %l0 = 00000000ff000022
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010101408] = ff000000, %f28 = ff0000ff
	lda	[%i4+0x008]%asi,%f28	! %f28 = ff000000

p0_label_143:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000010141408] = ff000000000000ff
	stx	%l4,[%i5+%o4]		! Mem[0000000010141408] = 00000000000000ff
!	Mem[0000000010081408] = f24ee2ff, %l5 = fffffffff24ee2ff
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010001410] = 000000ff
	stba	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[0000000010081408] = ffe24ef2, %l0 = 00000000ff000022
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000010081428] = 00003300
	sth	%l5,[%i2+0x028]		! Mem[0000000010081428] = 00ff3300
!	%l0 = 00000000000000ff, Mem[0000000010001400] = ff000000
	stha	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 00ff0000
!	Mem[0000000010141408] = 00000000, %l6 = 00000000000000ff
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 460000ff, %l4 = 00000000000000ff
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%f22 = 1b5d5d2a 46000000, Mem[0000000010001418] = 00000039 ffffffff, %asi = 80
	stda	%f22,[%i0+0x018]%asi	! Mem[0000000010001418] = 1b5d5d2a 46000000
!	Mem[0000000010041408] = ff000000, %l7 = 00000000ff000046
	ldsha	[%i1+%o4]0x80,%l7	! %l7 = ffffffffffffff00

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 0000ff00, %l3 = 000000007ac7378c
	ldswa	[%i0+%g0]0x88,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010041408] = ff000000, %l3 = 000000000000ff00
	lduwa	[%i1+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[00000000211c0001] = ffff3e90, %l6 = 0000000000000000
	ldsb	[%o2+0x001],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030041400] = 53268222, %l3 = 00000000ff000000
	lduba	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000053
!	Mem[0000000010141408] = ff000000, %f15 = 52cc2072
	lda	[%i5+%o4]0x88,%f15	! %f15 = ff000000
!	Mem[0000000010101400] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = 000000ff, %l2 = ffffffffffffff00
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081410] = ff000000, %l4 = 00000000000000ff
	ldswa	[%i2+%o5]0x81,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010101400] = ff000000 00000000, %l4 = ff000000, %l5 = 00000000
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000020800040] = ff548c60, %l2 = 00000000000000ff, %asi = 80
	lduha	[%o1+0x040]%asi,%l2	! %l2 = 000000000000ff54

p0_label_145:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 2e0a5a360000ffff, %l2 = 000000000000ff54, %l1 = 0000000000000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 2e0a5a360000ffff
!	Mem[0000000010081408] = ffe24ef2, %l0 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l5 = 0000000000000000, %l3 = 0000000000000053, %l6 = ffffffffffffffff
	or	%l5,%l3,%l6		! %l6 = 0000000000000053
!	Mem[0000000010081400] = 584097af, %l0 = 00000000000000ff
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000af
!	%f2  = ff000000 000000ff, Mem[0000000010001410] = 00000000 000000ff
	stda	%f2 ,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000 000000ff
!	%l1 = 2e0a5a360000ffff, Mem[0000000010181410] = 00000000
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000ffff
!	%l5 = 0000000000000000, Mem[0000000030101408] = 2a5d5d1b
	stha	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 2a5d0000
!	%l0 = 000000af, %l1 = 0000ffff, Mem[0000000030101410] = ffffffff edb18945
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000af 0000ffff
!	Mem[00000000218000c0] = 504fdf50, %l3 = 0000000000000053
	ldstuba	[%o3+0x0c0]%asi,%l3	! %l3 = 0000000000000050
!	%l2 = 000000000000ff54, Mem[0000000030101400] = 5c8d2639
	stwa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ff54

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 000000ff 0000001b, %l0 = 000000af, %l1 = 0000ffff
	ldd	[%i3+%o5],%l0		! %l0 = 00000000000000ff 000000000000001b
!	Mem[0000000010081408] = ffe24ef2, %l2 = 000000000000ff54
	ldswa	[%i2+%o4]0x80,%l2	! %l2 = ffffffffffe24ef2
!	Mem[0000000030141400] = 000000ff, %l1 = 000000000000001b
	ldswa	[%i5+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = 47a20214, %f27 = 584097af
	lda	[%i3+%o4]0x89,%f27	! %f27 = 47a20214
!	Mem[000000001014143d] = 52cc2072, %l0 = 00000000000000ff, %asi = 80
	lduba	[%i5+0x03d]%asi,%l0	! %l0 = 00000000000000cc
!	Code Fragment 3, seed = 70382
p0_fragment_14:
!	%l0 = 00000000000000cc
	setx	0x186d4e0eae5b2eb6,%g7,%l0 ! %l0 = 186d4e0eae5b2eb6
!	%l1 = 00000000000000ff
	setx	0x31901932e222dde1,%g7,%l1 ! %l1 = 31901932e222dde1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 186d4e0eae5b2eb6
	setx	0xd172f602286b011c,%g7,%l0 ! %l0 = d172f602286b011c
!	%l1 = 31901932e222dde1
	setx	0x4abadfe259669b67,%g7,%l1 ! %l1 = 4abadfe259669b67
p0_fragment_14_end:
!	Mem[0000000030101408] = 2a5d0000, %l2 = ffffffffffe24ef2
	ldsba	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %l2 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081410] = 00000000, %l2 = ffffffffffffffff
	ldsha	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 000000ff, %l6 = 0000000000000053
	ldsha	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff

p0_label_147:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffff00, Mem[00000000218001c0] = 39ff4010
	stb	%l7,[%o3+0x1c0]		! Mem[00000000218001c0] = 00ff4010
!	%l0 = d172f602286b011c, Mem[0000000010041428] = ffff0000, %asi = 80
	stwa	%l0,[%i1+0x028]%asi	! Mem[0000000010041428] = 286b011c
!	%l1 = 4abadfe259669b67, Mem[00000000100c1422] = ffe8827f
	stb	%l1,[%i3+0x022]		! Mem[00000000100c1420] = ffe8677f
!	%l6 = 000000ff, %l7 = ffffff00, Mem[00000000300c1400] = 00000000 46000000
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff ffffff00
!	%f9  = 08592560, Mem[0000000010141438] = db3fdc44
	sta	%f9 ,[%i5+0x038]%asi	! Mem[0000000010141438] = 08592560
!	Code Fragment 3, seed = 924236
p0_fragment_15:
!	%l0 = d172f602286b011c
	setx	0x3316a382d6aeb1c6,%g7,%l0 ! %l0 = 3316a382d6aeb1c6
!	%l1 = 4abadfe259669b67
	setx	0x86bda5d3c2a833f1,%g7,%l1 ! %l1 = 86bda5d3c2a833f1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3316a382d6aeb1c6
	setx	0xd7a01abb8d35ba2c,%g7,%l0 ! %l0 = d7a01abb8d35ba2c
!	%l1 = 86bda5d3c2a833f1
	setx	0xdbc86ed685754777,%g7,%l1 ! %l1 = dbc86ed685754777
p0_fragment_15_end:
!	%l1 = dbc86ed685754777, Mem[0000000010141436] = 7404000d
	sth	%l1,[%i5+0x036]		! Mem[0000000010141434] = 74044777
!	%l3 = 0000000000000050, Mem[00000000218001c0] = 00ff4010, %asi = 80
	stba	%l3,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 50ff4010
!	%l7 = ffffffffffffff00, Mem[0000000010101400] = 000000ff
	stwa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffff00
!	%l0 = d7a01abb8d35ba2c, Mem[0000000030041400] = 22822653
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 8d35ba2c

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 7f000000, %f21 = fff79fa4
	lda	[%i3+%o4]0x80,%f21	! %f21 = 7f000000
!	Mem[00000000100c141e] = 1b4f5570, %l4 = 00000000ff000000
	ldstuba	[%i3+0x01e]%asi,%l4	! %l4 = 0000000000000055
!	Mem[0000000010181408] = 88fffa87 ffffff00, %l0 = 8d35ba2c, %l1 = 85754777
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 00000000ffffff00 0000000088fffa87
!	Mem[00000000201c0000] = ff009c00, %l2 = 0000000000000000, %asi = 80
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010101400] = 00000000 ffffff00, %l2 = 0000ff00, %l3 = 00000050
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 00000000ffffff00 0000000000000000
!	Mem[0000000020800040] = ff548c60, %l1 = 0000000088fffa87
	lduh	[%o1+0x040],%l1		! %l1 = 000000000000ff54
!	Mem[0000000030181408] = 0000001b, %l2 = 00000000ffffff00
	lduwa	[%i6+%o4]0x89,%l2	! %l2 = 000000000000001b
!	Mem[0000000010041408] = 000000ff, %l5 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041408] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800041] = ff548c60, %l0 = 00000000ffffff00
	ldub	[%o1+0x041],%l0		! %l0 = 0000000000000054

p0_label_149:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 000000ff, %l4 = 0000000000000055
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 7f000000, %l7 = ffffffffffffff00
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 000000000000007f
!	Mem[00000000300c1408] = 47a20214, %l3 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000014
!	%l6 = 0000000000000000, Mem[0000000010101410] = ff0000ff00000000
	stxa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	Mem[0000000010081408] = f24ee2ff, %l4 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l4	! %l4 = 00000000f24ee2ff
!	Mem[0000000010101405] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i4+0x005]%asi,%l5	! %l5 = 0000000000000000
!	%f28 = ff000000 da274637, Mem[00000000300c1408] = ff02a247 00000000
	stda	%f28,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000 da274637
!	Mem[00000000300c1400] = ff000000 00ffffff ff000000 da274637
!	%f0  = 00000000 00000000 ff000000 000000ff
!	%f4  = 000000ff 000000ff ff000000 00000046
!	%f8  = f92fea34 08592560 7f000000 00000046
!	%f12 = 351a9770 74043d0d db3fdc44 ff000000
	stda	%f0 ,[%i3+%g0]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%l4 = 00000000f24ee2ff, Mem[00000000100c1410] = 000000ff0000001b
	stxa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000f24ee2ff
!	%l7 = 000000000000007f, Mem[00000000300c1410] = ff000000
	stwa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000007f

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 000000ff, %l2 = 000000000000001b
	lduba	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101400] = 0000ff54, %f18 = ff000000
	lda	[%i4+%g0]0x89,%f18	! %f18 = 0000ff54
!	Mem[0000000010141400] = ffff0000, %l0 = 0000000000000054
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 00000000ffff0000
!	Mem[0000000010041408] = 000000ff, %f20 = 7dcec331
	lda	[%i1+%o4]0x88,%f20	! %f20 = 000000ff
!	Mem[000000001004140c] = ff000000, %l4 = 00000000f24ee2ff, %asi = 80
	ldsha	[%i1+0x00c]%asi,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010181420] = 34187d38 38e46569, %l4 = ffffff00, %l5 = 00000000
	ldd	[%i6+0x020],%l4		! %l4 = 0000000034187d38 0000000038e46569
!	Mem[0000000010141400] = ffff0000, %l7 = 000000000000007f
	lduwa	[%i5+%g0]0x88,%l7	! %l7 = 00000000ffff0000
!	Mem[0000000030141400] = ff000000, %l6 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000020800040] = ff548c60, %l2 = 00000000000000ff, %asi = 80
	lduha	[%o1+0x040]%asi,%l2	! %l2 = 000000000000ff54
!	Mem[0000000010181400] = ff000000 ba8f001b, %l4 = 34187d38, %l5 = 38e46569, %asi = 80
	ldda	[%i6+0x000]%asi,%l4	! %l4 = 00000000ff000000 00000000ba8f001b

p0_label_151:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ba8f001b, Mem[0000000030081408] = 00000000
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = ba8f001b
!	Mem[0000000030181400] = 000000ff, %l6 = ffffffffffffff00
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l4 = ff000000, %l5 = ba8f001b, Mem[0000000030181408] = 1b000000 00000000
	stda	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000 ba8f001b
!	%l6 = 00000000000000ff, %l2 = 000000000000ff54, %l1  = 000000000000ff54
	mulx	%l6,%l2,%l1		! %l1 = 0000000000fe54ac
!	Mem[0000000030181410] = 46000000, %l6 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000046
!	%l3 = 0000000000000014, Mem[00000000211c0001] = ffff3e90
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = ff143e90
!	%l0 = 00000000ffff0000, immd = fffff2e3, %y  = ffffffff
	umul	%l0,-0xd1d,%l4		! %l4 = fffef2e30d1d0000, %y = fffef2e3
!	Mem[0000000010101410] = 00000000, %l3 = 0000000000000014
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l7 = 00000000ffff0000, Mem[0000000010001410] = ff000000
	stha	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	Mem[0000000030001400] = 00000000, %l5 = 00000000ba8f001b
	lduha	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_152:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 14000000, %f29 = da274637
	lda	[%i4+%o5]0x80,%f29	! %f29 = 14000000
!	Mem[0000000010181400] = 000000ff, %l6 = 0000000000000046
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (30)
!	Mem[00000000100c1410] = 00000000, %l7 = 00000000ffff0000
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = ff000046, %l0 = 00000000ffff0000
	ldsha	[%i0+%o5]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030001408] = 460000ff, %l0 = ffffffffffffff00
	ldsba	[%i0+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181408] = ff000000, %l5 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030001400] = 00000000, %l1 = 0000000000fe54ac
	lduwa	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l2 = 000000000000ff54
	ldsba	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800041] = ffd716f0, %l7 = 0000000000000000, %asi = 80
	ldsba	[%o3+0x041]%asi,%l7	! %l7 = ffffffffffffffd7
!	Mem[00000000100c1408] = ff000000, %l0 = ffffffffffffffff
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000ff

p0_label_153:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffd7, Mem[0000000020800040] = ff548c60
	stb	%l7,[%o1+0x040]		! Mem[0000000020800040] = d7548c60
!	%f0  = 00000000 00000000, %l4 = fffef2e30d1d0000
!	Mem[0000000030141418] = 6541627a493a8463
	add	%i5,0x018,%g1
	stda	%f0,[%g1+%l4]ASI_PST32_S ! Mem[0000000030141418] = 6541627a493a8463
!	%l2 = 0000000000000000, %l3 = 0000000000000000, %l5 = 000000000000ff00
	addc	%l2,%l3,%l5		! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010181408] = ffffff00
	stwa	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010001400] = 0000ff00
	stha	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%f15 = ff000000, Mem[0000000030101410] = 000000af
	sta	%f15,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000
!	Mem[0000000030001408] = ff000046, %l4 = 000000000d1d0000
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 00000000ff000046
!	%l4 = ff000046, %l5 = 00000000, Mem[00000000300c1400] = 00000000 00000000
	stda	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000046 00000000
!	%l6 = 00000000000000ff, Mem[0000000030081410] = 000000ff
	stwa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	Mem[00000000100c1410] = 00000000, %l0 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000

p0_label_154:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 000000ff, %l4 = 00000000ff000046
	ldsba	[%i4+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141408] = 00000000, %f14 = db3fdc44
	lda	[%i5+%o4]0x81,%f14	! %f14 = 00000000
!	Mem[0000000010101400] = 00ffffff 00ff0000 ff000000 000000ff
!	Mem[0000000010101410] = 14000000 00000000 ff000000 00000046
!	Mem[0000000010101420] = f92fea34 08592560 7f000000 00000046
!	Mem[0000000010101430] = 351a9770 74043d0d db3fdc44 52cc2072
	ldda	[%i4+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000030081408] = 1b008fba, %l1 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l1	! %l1 = 000000001b008fba
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = ff0000ff, %l4 = ffffffffffffffff
	lduwa	[%i1+%o5]0x89,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010181410] = ffff0000, %f4  = 000000ff
	lda	[%i6+%o5]0x80,%f4 	! %f4 = ffff0000
!	Mem[0000000010081408] = 97ff157100000000, %f0  = 00000000 00000000
	ldda	[%i2+%o4]0x88,%f0 	! %f0  = 97ff1571 00000000
!	Mem[0000000021800100] = 1ffffd80, %l3 = 0000000000000000, %asi = 80
	lduha	[%o3+0x100]%asi,%l3	! %l3 = 0000000000001fff
!	Mem[0000000010181410] = 0000ffff, %l3 = 0000000000001fff
	lduha	[%i6+%o5]0x88,%l3	! %l3 = 000000000000ffff

p0_label_155:
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = ff143e90, %l2 = 0000000000000000
	ldstub	[%o2+0x001],%l2		! %l2 = 0000000000000014
!	%f2  = ff000000 000000ff, %l6 = 00000000000000ff
!	Mem[0000000030041438] = da27463700000061
	add	%i1,0x038,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030041438] = ff000000000000ff
!	%f25 = 08592560, Mem[0000000030141410] = af974058
	sta	%f25,[%i5+%o5]0x81	! Mem[0000000030141410] = 08592560
!	%f21 = 00000000, Mem[0000000010041420] = 4d4d5f58
	sta	%f21,[%i1+0x020]%asi	! Mem[0000000010041420] = 00000000
!	%f18 = ff000000 000000ff, Mem[00000000100c1410] = ff000000 f24ee2ff
	stda	%f18,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000 000000ff
!	Mem[0000000030141410] = 60255908, %l2 = 0000000000000014
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 0000000060255908
!	Mem[0000000030001400] = 00000000, %l0 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 7f000000, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 000000000000007f
!	Mem[0000000010081434] = ecffffff, %l3 = 000000000000ffff, %asi = 80
	swapa	[%i2+0x034]%asi,%l3	! %l3 = 00000000ecffffff
!	%f6  = ff000000, Mem[0000000010181400] = 000000ff
	sta	%f6 ,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000000

p0_label_156:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l7 = ffffffffffffffd7
	ldswa	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = ffff5630, %l0 = 000000000000007f, %asi = 80
	ldsha	[%o1+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101410] = 000000ff, %l6 = 00000000000000ff
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141426] = 08592560, %l4 = 00000000ff0000ff, %asi = 80
	lduba	[%i5+0x026]%asi,%l4	! %l4 = 0000000000000025
!	Mem[0000000010181410] = ff0000000000ffff, %f6  = ff000000 00000046
	ldda	[%i6+%o5]0x88,%f6 	! %f6  = ff000000 0000ffff
!	Mem[00000000300c1400] = ff000046, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141408] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000020800001] = ffff5630, %l7 = 00000000000000ff, %asi = 80
	lduba	[%o1+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141400] = ffff0000, %l1 = 000000001b008fba
	lduha	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 70554ff9, %l4 = 0000000000000025
	ldswa	[%i1+%o5]0x88,%l4	! %l4 = 0000000070554ff9

p0_label_157:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000030001400] = 00000000
	stba	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	Mem[0000000030101408] = 00005d2a, %l0 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	%l4 = 0000000070554ff9, Mem[0000000010001410] = 00000000
	stha	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00004ff9
!	%f8  = f92fea34 08592560, Mem[0000000010141408] = 000000ff 000000ff
	stda	%f8 ,[%i5+%o4]0x80	! Mem[0000000010141408] = f92fea34 08592560
!	Mem[0000000010181400] = 000000ff, %l1 = 0000000000000000, %asi = 80
	swapa	[%i6+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1400] = ff000046 00000000 ff000000 000000ff
!	%f0  = 97ff1571 00000000 ff000000 000000ff
!	%f4  = ffff0000 000000ff ff000000 0000ffff
!	%f8  = f92fea34 08592560 7f000000 00000046
!	%f12 = 351a9770 74043d0d 00000000 ff000000
	stda	%f0 ,[%i3+%g0]ASI_BLK_AIUSL	! Block Store to 00000000300c1400
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010001428] = ff0000ff 00001a27
	std	%l6,[%i0+0x028]		! Mem[0000000010001428] = 00000000 000000ff
!	Mem[0000000030041408] = 00000000, %l3 = 00000000ecffffff
	swapa	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (31)
!	Mem[00000000100c1408] = ff000000, %l5 = 00000000000000ff
	swap	[%i3+%o4],%l5		! %l5 = 00000000ff000000
!	%f17 = 00ff0000, %f29 = 74043d0d, %f23 = 00000046
	fmuls	%f17,%f29,%f23		! %f23 = 3583b8d0

p0_label_158:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = f94f5570, %l2 = 0000000060255908
	ldstuba	[%i1+%o5]0x80,%l2	! %l2 = 00000000000000f9
!	Code Fragment 4, seed = 114328
p0_fragment_16:
!	%l0 = 0000000000000000
	setx	0x09b78205cfe39b66,%g7,%l0 ! %l0 = 09b78205cfe39b66
!	%l1 = 00000000000000ff
	setx	0xd3ccb34547416b91,%g7,%l1 ! %l1 = d3ccb34547416b91
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 09b78205cfe39b66
	setx	0x0ea3af44d099dfcc,%g7,%l0 ! %l0 = 0ea3af44d099dfcc
!	%l1 = d3ccb34547416b91
	setx	0x5a7988eb5ac8fb17,%g7,%l1 ! %l1 = 5a7988eb5ac8fb17
p0_fragment_16_end:
!	Mem[0000000010141408] = 34ea2ff9, %f11 = 00000046
	lda	[%i5+%o4]0x88,%f11	! %f11 = 34ea2ff9
!	Mem[0000000030041408] = ffffffec, %l6 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l6	! %l6 = ffffffffffffffec
!	Mem[0000000030141400] = ff000000 000000ff, %l6 = ffffffec, %l7 = 000000ff
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000ff 00000000ff000000
!	Mem[0000000010181408] = 0000000087faff88, %l3 = 0000000000000000
	ldx	[%i6+%o4],%l3		! %l3 = 0000000087faff88
!	Mem[0000000010041438] = 00000000 0000007f, %l6 = 000000ff, %l7 = ff000000, %asi = 80
	ldda	[%i1+0x038]%asi,%l6	! %l6 = 0000000000000000 000000000000007f
!	Mem[00000000300c1410] = ff000000, %l1 = 5a7988eb5ac8fb17
	lduwa	[%i3+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[00000000100c1438] = 00000000000000ff, %f4  = ffff0000 000000ff
	ldd	[%i3+0x038],%f4 	! %f4  = 00000000 000000ff
!	Mem[0000000010041408] = 000000ff000000ff, %l4 = 0000000070554ff9
	ldxa	[%i1+%o4]0x88,%l4	! %l4 = 000000ff000000ff

p0_label_159:
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000007f, Mem[00000000100c1410] = 000000ff
	stha	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000007f
!	%f19 = 000000ff, Mem[0000000030101408] = 2a5d00ff
	sta	%f19,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff
!	%l6 = 00000000, %l7 = 0000007f, Mem[0000000030041410] = ff0000ff ffffffff
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 0000007f
!	%f8  = f92fea34 08592560, %l6 = 0000000000000000
!	Mem[0000000030181418] = fec88114ff000000
	add	%i6,0x018,%g1
	stda	%f8,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030181418] = fec88114ff000000
!	%l6 = 0000000000000000, Mem[00000000218001c1] = 50ff4010
	stb	%l6,[%o3+0x1c1]		! Mem[00000000218001c0] = 50004010
!	%f14 = 00000000 ff000000, Mem[0000000030141400] = 000000ff ff000000
	stda	%f14,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 ff000000
!	%l1 = 00000000ff000000, Mem[00000000300c1408] = ff000000
	stwa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000
!	%l4 = 000000ff000000ff, Mem[0000000010081420] = 2f3f8d8700003192, %asi = 80
	stxa	%l4,[%i2+0x020]%asi	! Mem[0000000010081420] = 000000ff000000ff
!	%f24 = f92fea34 08592560, %l0 = 0ea3af44d099dfcc
!	Mem[0000000010101418] = ff00000000000046
	add	%i4,0x018,%g1
	stda	%f24,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010101418] = ff00000034ea2ff9
!	Mem[0000000030001400] = 000000ff, %l0 = 00000000d099dfcc
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff

p0_label_160:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff009c00, %l2 = 00000000000000f9, %asi = 80
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010181408] = 00000000, %l7 = 000000000000007f
	ldswa	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = 8d35ba2c, %f19 = 000000ff
	lda	[%i1+%g0]0x89,%f19	! %f19 = 8d35ba2c
!	Mem[00000000100c1408] = ff000000, %l3 = 0000000087faff88
	ldsha	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	%l1 = 00000000ff000000, %l1 = 00000000ff000000, %y  = fffef2e3
	udiv	%l1,%l1,%l1		! %l1 = 00000000ffffffff
	mov	%l0,%y			! %y = 000000ff
!	Mem[00000000100c1408] = ff000000, %l7 = 0000000000000000
	lduba	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041430] = ffffffff 33848245, %l2 = ffffff00, %l3 = 00000000, %asi = 80
	ldda	[%i1+0x030]%asi,%l2	! %l2 = 00000000ffffffff 0000000033848245
!	Mem[0000000030001408] = 00001d0d, %l5 = 00000000ff000000
	ldsba	[%i0+%o4]0x89,%l5	! %l5 = 000000000000000d
!	Mem[0000000030081408] = 00000000ba8f001b, %f22 = ff000000 3583b8d0
	ldda	[%i2+%o4]0x89,%f22	! %f22 = 00000000 ba8f001b
!	Mem[0000000030181400] = 0000ffff000000ff, %l0 = 00000000000000ff
	ldxa	[%i6+%g0]0x89,%l0	! %l0 = 0000ffff000000ff

p0_label_161:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 00000000, %l4 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001428] = 00000000000000ff, %l1 = 00000000ffffffff, %l0 = 0000ffff000000ff
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 00000000000000ff
!	%l3 = 0000000033848245, Mem[0000000010081406] = 365a0a2e, %asi = 80
	stha	%l3,[%i2+0x006]%asi	! Mem[0000000010081404] = 365a8245
!	%f28 = 351a9770 74043d0d, %l4 = 0000000000000000
!	Mem[0000000010041410] = ff4f5570000000a4
	add	%i1,0x010,%g1
	stda	%f28,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010041410] = ff4f5570000000a4
!	Mem[0000000030101400] = 54ff0000, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000054
!	%l4 = 0000000000000000, Mem[00000000100c1400] = 000000ff
	stha	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%l5 = 000000000000000d, Mem[0000000010101410] = 14000000
	stba	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 0d000000
!	%f24 = f92fea34 08592560, Mem[0000000010141408] = f92fea34 08592560, %asi = 80
	stda	%f24,[%i5+0x008]%asi	! Mem[0000000010141408] = f92fea34 08592560
!	Mem[0000000010081400] = 584097ff, %l6 = 0000000000000054
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010041410] = 70554fff
	stwa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff

p0_label_162:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1426] = 44f79fa4, %l3 = 0000000033848245, %asi = 80
	lduba	[%i3+0x026]%asi,%l3	! %l3 = 000000000000009f
!	Mem[0000000030041410] = ff000000, %l5 = 000000000000000d
	lduwa	[%i1+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030181400] = 0000ffff000000ff, %f6  = ff000000 0000ffff
	ldda	[%i6+%g0]0x89,%f6 	! %f6  = 0000ffff 000000ff
!	Mem[00000000300c1410] = ff000000, %f28 = 351a9770
	lda	[%i3+%o5]0x81,%f28	! %f28 = ff000000
!	Mem[0000000010141400] = 0000ffff, %l0 = 00000000000000ff
	ldsba	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 0000000d, %l4 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l4	! %l4 = 000000000000000d
!	Mem[00000000100c1408] = ff000000, %l5 = 00000000ff000000
	lduba	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = d099dfcc, %l2 = 00000000ffffffff
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 000000000000dfcc
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000000
	lduha	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = ecffffff 00005400, %l2 = 0000dfcc, %l3 = 0000009f
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000ecffffff 0000000000005400

p0_label_163:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffffffff, Mem[00000000100c1408] = 000000ff
	stha	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffff00ff
!	Mem[00000000211c0000] = ffff3e90, %l3 = 0000000000005400
	ldstub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010141430] = 351a9770, %l1 = 00000000ffffffff
	swap	[%i5+0x030],%l1		! %l1 = 00000000351a9770
!	%l4 = 000000000000000d, Mem[0000000030181410] = 000000ff
	stba	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000d
!	%f31 = 52cc2072, %f22 = 00000000, %f29 = 74043d0d
	fsubs	%f31,%f22,%f29		! %f29 = 52cc2072
!	%l7 = 0000000000000000, Mem[0000000010001410] = f94f0000000000ff
	stxa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	Mem[0000000030181408] = 000000ff, %l5 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000020800001] = ffff5630, %asi = 80
	stba	%l6,[%o1+0x001]%asi	! Mem[0000000020800000] = ffff5630
!	Mem[0000000010181400] = 00000000ba8f001b, %l4 = 000000000000000d, %l6 = 00000000000000ff
	casxa	[%i6]0x80,%l4,%l6	! %l6 = 00000000ba8f001b
!	Mem[0000000030101400] = ffff0000, %l6 = 00000000ba8f001b
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 00000000000000ff

p0_label_164:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = fcf8ffff00000014, %l0 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l0	! %l0 = fcf8ffff00000014
!	Mem[00000000100c1438] = 00000000 000000ff, %l2 = ecffffff, %l3 = 000000ff
	ldd	[%i3+0x038],%l2		! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000030101408] = ff000000, %l3 = 00000000000000ff
	lduha	[%i4+%o4]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[0000000030181408] = 00000000 ba8f001b, %l4 = 0000000d, %l5 = 000000ff
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000 00000000ba8f001b
!	Mem[0000000030081400] = ff000000, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[00000000211c0001] = ffff3e90, %l0 = fcf8ffff00000014, %asi = 80
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101410] = 00000000 0000000d, %l0 = ffffffff, %l1 = 351a9770
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 000000000000000d 0000000000000000
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000030101400] = ffff0000 31c3ce7d ff000000 000000ff
!	Mem[0000000030101410] = 000000ff ffff0000 04b3c11a 4f27c483
!	Mem[0000000030101420] = 592704a8 12b56919 e7feee72 6fedccdf
!	Mem[0000000030101430] = ff000214 7cfd4637 56e24ef2 7115ff97
	ldda	[%i4+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030101400
!	Mem[0000000010081428] = 00ff3300, %l7 = 00000000ff000000
	lduw	[%i2+0x028],%l7		! %l7 = 0000000000ff3300
!	Mem[0000000010101410] = 0000000d, %l2 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l2	! %l2 = 000000000000000d

p0_label_165:
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000000d, Mem[00000000211c0000] = ffff3e90
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 000d3e90
!	%l5 = 00000000ba8f001b, Mem[0000000010181410] = 0000ffff
	stwa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = ba8f001b
!	%l6 = 00000000000000ff, Mem[0000000010181408] = 0000000087faff88
	stxa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000000000ff
	membar	#Sync			! Added by membar checker (33)
!	%l6 = 00000000000000ff, Mem[0000000030101410] = 0000ffffff000000
	stxa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000000000ff
!	%l0 = 000000000000000d, Mem[0000000030001410] = ff000046
	stwa	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000d
!	%l0 = 000000000000000d, Mem[00000000201c0000] = ff009c00
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 000d9c00
!	%l0 = 0000000d, %l1 = 00000000, Mem[0000000010181408] = 00000000 000000ff
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000d 00000000
!	Mem[0000000030101400] = 0000ffff, %l5 = 00000000ba8f001b
	ldstuba	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%f28 = ff000000 52cc2072, %l5 = 00000000000000ff
!	Mem[0000000030001420] = 71f3b304e06a54ff
	add	%i0,0x020,%g1
	stda	%f28,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030001420] = 7220cc52000000ff
!	%l2 = 000000000000000d, Mem[0000000010101410] = 0d000000
	stha	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 000d0000

p0_label_166:
!	Starting 10 instruction Load Burst
!	%l2 = 000000000000000d, Mem[0000000010101400] = 00ffffff
	stha	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 000dffff
!	Mem[0000000010081408] = 97ff157100000000, %f10 = e7feee72 6fedccdf
	ldda	[%i2+%o4]0x88,%f10	! %f10 = 97ff1571 00000000
!	Mem[0000000010181408] = 0000000d00000000, %f0  = ffff0000 31c3ce7d
	ldda	[%i6+%o4]0x80,%f0 	! %f0  = 0000000d 00000000
!	%l0 = 000000000000000d, %l5 = 00000000000000ff, %y  = 000000ff
	sdiv	%l0,%l5,%l7		! %l7 = 000000007fffffff
	mov	%l0,%y			! %y = 0000000d
!	Mem[0000000030041410] = 000000ff, %l5 = 00000000000000ff
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%f13 = 7cfd4637, %f2  = ff000000, %f3  = 000000ff
	fdivs	%f13,%f2 ,%f3 		! %f3  = bd7d4637
!	Mem[0000000010001438] = ffffff00ff000000, %l6 = 00000000000000ff, %asi = 80
	ldxa	[%i0+0x038]%asi,%l6	! %l6 = ffffff00ff000000
!	Mem[0000000030101410] = 000000ff, %l7 = 000000007fffffff
	lduba	[%i4+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041438] = 00000000, %l7 = 00000000000000ff
	lduh	[%i1+0x038],%l7		! %l7 = 0000000000000000
!	Mem[00000000300c1410] = ffff0000000000ff, %f8  = 592704a8 12b56919
	ldda	[%i3+%o5]0x89,%f8 	! %f8  = ffff0000 000000ff

p0_label_167:
!	Starting 10 instruction Store Burst
!	%f8  = ffff0000 000000ff, %l5 = 00000000000000ff
!	Mem[0000000030181430] = ff000000374627ff
	add	%i6,0x030,%g1
	stda	%f8,[%g1+%l5]ASI_PST16_S ! Mem[0000000030181430] = ffff0000000000ff
!	%f12 = ff000214 7cfd4637, Mem[0000000030181408] = 00000000 1b008fba
	stda	%f12,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000214 7cfd4637
!	%l7 = 0000000000000000, Mem[00000000211c0000] = 000d3e90
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 00003e90
!	%l3 = 000000000000ff00, imm = 00000000000009d3, %l5 = 00000000000000ff
	add	%l3,0x9d3,%l5		! %l5 = 00000000000108d3
!	%l7 = 0000000000000000, Mem[0000000010141408] = f92fea3408592560
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000000
!	Mem[0000000030101400] = ffff0000 31c3ce7d ff000000 000000ff
!	%f0  = 0000000d 00000000 ff000000 bd7d4637
!	%f4  = 000000ff ffff0000 04b3c11a 4f27c483
!	%f8  = ffff0000 000000ff 97ff1571 00000000
!	%f12 = ff000214 7cfd4637 56e24ef2 7115ff97
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%l2 = 0000000d, %l3 = 0000ff00, Mem[0000000030141410] = 14000000 fffff8fc
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000d 0000ff00
!	Mem[00000000300c1408] = 000000ff, %l5 = 00000000000108d3
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l0 = 0000000d, %l1 = 00000000, Mem[0000000010101418] = ff000000 34ea2ff9, %asi = 80
	stda	%l0,[%i4+0x018]%asi	! Mem[0000000010101418] = 0000000d 00000000
!	%l2 = 0000000d, %l3 = 0000ff00, Mem[0000000030181410] = 0000000d 00000000
	stda	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000d 0000ff00

p0_label_168:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000000000000000, %f22 = 00000000 ba8f001b
	ldda	[%i5+%o4]0x88,%f22	! %f22 = 00000000 00000000
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010101400] = 000dffff 00ff0000 ff000000 000000ff
!	Mem[0000000010101410] = 000d0000 00000000 0000000d 00000000
!	Mem[0000000010101420] = f92fea34 08592560 7f000000 00000046
!	Mem[0000000010101430] = 351a9770 74043d0d db3fdc44 52cc2072
	ldda	[%i4+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400
!	Mem[0000000030141400] = 000000ff00000000, %f8  = ffff0000 000000ff
	ldda	[%i5+%g0]0x81,%f8 	! %f8  = 000000ff 00000000
!	Mem[0000000010101400] = ffff0d00, %l0 = 000000000000000d
	ldswa	[%i4+%g0]0x88,%l0	! %l0 = ffffffffffff0d00
!	Mem[00000000100c1420] = ffe8677f 44f79fa4, %l0 = ffff0d00, %l1 = 00000000
	ldd	[%i3+0x020],%l0		! %l0 = 00000000ffe8677f 0000000044f79fa4
!	Mem[0000000030001400] = ccdf99d0 ffffffff 0d1d0000 ffffffff
!	Mem[0000000030001410] = 0000000d 6fedccdf 7f4a8fba 3a21b4a3
!	Mem[0000000030001420] = 7220cc52 000000ff edb18945 2f3ecf6e
!	Mem[0000000030001430] = 8c390000 92310000 7fff20f0 374627da
	ldda	[%i0+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000010101408] = ff000000, %l2 = 000000000000000d
	lduha	[%i4+%o4]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030001400] = ccdf99d0ffffffff, %f4  = 000000ff ffff0000
	ldda	[%i0+%g0]0x81,%f4 	! %f4  = ccdf99d0 ffffffff
!	Mem[0000000030041400] = 2cba358d2a5d5d1b, %f4  = ccdf99d0 ffffffff
	ldda	[%i1+%g0]0x81,%f4 	! %f4  = 2cba358d 2a5d5d1b
!	Mem[0000000010141428] = 7ac7378c, %l6 = ffffff00ff000000
	ldsb	[%i5+0x028],%l6		! %l6 = 000000000000007a

p0_label_169:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 000000ff, %l3 = 000000000000ff00
	swapa	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001408] = ff000000, %l1 = 0000000044f79fa4
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%f26 = edb18945 2f3ecf6e, Mem[0000000010081428] = 00ff3300 230d9fa4, %asi = 80
	stda	%f26,[%i2+0x028]%asi	! Mem[0000000010081428] = edb18945 2f3ecf6e
!	Mem[00000000300c1400] = 00000000 7115ff97 d3080100 000000ff
!	%f0  = 0000000d 00000000 ff000000 bd7d4637
!	%f4  = 2cba358d 2a5d5d1b 04b3c11a 4f27c483
!	%f8  = 000000ff 00000000 97ff1571 00000000
!	%f12 = ff000214 7cfd4637 56e24ef2 7115ff97
	stda	%f0 ,[%i3+%g0]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	%l2 = 000000000000ff00, imm = 0000000000000dc2, %l6 = 000000000000007a
	and	%l2,0xdc2,%l6		! %l6 = 0000000000000d00
!	Mem[0000000010081408] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i2+0x008]%asi,%l1	! %l1 = 0000000000000000
!	%f8  = 000000ff 00000000, %l6 = 0000000000000d00
!	Mem[0000000010001438] = ffffff00ff000000
	add	%i0,0x038,%g1
	stda	%f8,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010001438] = ffffff00ff000000
	membar	#Sync			! Added by membar checker (35)
!	%l4 = 0000000000000000, Mem[0000000030001400] = d099dfcc
	stba	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = d099df00
!	%l5 = 00000000000000ff, Mem[0000000010041410] = ff000000000000a4
	stxa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000000ff
!	Mem[0000000030041410] = ff000000, %l5 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 00000000ff000000

p0_label_170:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff000000, %l1 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010101408] = 000000ff, %l0 = 00000000ffe8677f
	ldswa	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001400] = ffffffff00000000, %f24 = 7220cc52 000000ff
	ldda	[%i0+%g0]0x88,%f24	! %f24 = ffffffff 00000000
!	Mem[0000000030141410] = 0000000d0000ff00, %f0  = 0000000d 00000000
	ldda	[%i5+%o5]0x81,%f0 	! %f0  = 0000000d 0000ff00
!	Mem[0000000010041408] = ff000000, %l0 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010101410] = 000d0000 00000000, %l6 = 00000d00, %l7 = 00000000
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 00000000000d0000 0000000000000000
!	Mem[00000000100c1410] = 7f000000, %l3 = 00000000000000ff
	lduwa	[%i3+%o5]0x80,%l3	! %l3 = 000000007f000000
!	Mem[00000000300c1400] = 0d000000, %l6 = 00000000000d0000
	ldsba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l7 = 0000000000000000
	ldsh	[%i1+%o5],%l7		! %l7 = 0000000000000000
!	Mem[0000000010001408] = ff000000, %l7 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffff00

p0_label_171:
!	Starting 10 instruction Store Burst
!	%f24 = ffffffff 00000000, %l7 = ffffffffffffff00
!	Mem[0000000030081420] = 72562be853266b59
	add	%i2,0x020,%g1
	stda	%f24,[%g1+%l7]ASI_PST32_S ! Mem[0000000030081420] = 72562be853266b59
!	Mem[00000000100c142c] = 2641f94b, %l1 = 00000000ffffff00
	swap	[%i3+0x02c],%l1		! %l1 = 000000002641f94b
!	%l2 = 000000000000ff00, Mem[0000000030101410] = 0000ffff
	stba	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000ffff
!	%l7 = ffffffffffffff00, Mem[00000000300c1408] = 000000ff
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffff00
!	%l0 = 0000ff00, %l1 = 2641f94b, Mem[0000000010001408] = 000000ff 46000000
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000ff00 2641f94b
!	Mem[0000000030141410] = 0000000d, %l5 = 00000000ff000000
	ldstuba	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%f10 = 97ff1571, %f5  = 2a5d5d1b, %f28 = 8c390000
	fadds	%f10,%f5 ,%f28		! %f28 = 2a5d5d1b
!	Mem[0000000010081410] = 00000000, %l3 = 000000007f000000
	swapa	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%f28 = 2a5d5d1b 92310000, Mem[0000000010141408] = 00000000 00000000
	stda	%f28,[%i5+%o4]0x88	! Mem[0000000010141408] = 2a5d5d1b 92310000
!	%f16 = ccdf99d0, Mem[0000000010081410] = 7f000000
	sta	%f16,[%i2+%o5]0x80	! Mem[0000000010081410] = ccdf99d0

p0_label_172:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 2a5d5d1b 92310000, %l0 = 0000ff00, %l1 = 2641f94b
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 0000000092310000 000000002a5d5d1b
!	Mem[0000000010041408] = ff000000ff000000, %l6 = 0000000000000000, %asi = 80
	ldxa	[%i1+0x008]%asi,%l6	! %l6 = ff000000ff000000
!	Mem[0000000010081410] = ccdf99d0, %l5 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l5	! %l5 = ffffffffccdf99d0
!	Mem[0000000030001408] = 0d1d0000, %l7 = ffffffffffffff00
	ldswa	[%i0+%o4]0x81,%l7	! %l7 = 000000000d1d0000
!	Mem[0000000010041400] = 596b2653 3100ffff, %l4 = 00000000, %l5 = ccdf99d0
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 000000003100ffff 00000000596b2653
!	Mem[00000000100c1420] = ffe8677f, %l1 = 000000002a5d5d1b
	lduh	[%i3+0x020],%l1		! %l1 = 000000000000ffe8
!	Mem[0000000030101410] = 0000ffffff000000, %f8  = 000000ff 00000000
	ldda	[%i4+%o5]0x81,%f8 	! %f8  = 0000ffff ff000000
!	Mem[00000000201c0000] = 000d9c00, %l7 = 000000000d1d0000
	ldsb	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141400] = 0000ffff, %l7 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0001] = 000d9c00, %l7 = 0000000000000000
	ldsb	[%o0+0x001],%l7		! %l7 = 000000000000000d

p0_label_173:
!	Starting 10 instruction Store Burst
!	%f2  = ff000000 bd7d4637, Mem[0000000010081410] = d099dfcc ffffffff
	stda	%f2 ,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000 bd7d4637
!	%l4 = 3100ffff, %l5 = 596b2653, Mem[0000000010041420] = 00000000 17e1eb09
	std	%l4,[%i1+0x020]		! Mem[0000000010041420] = 3100ffff 596b2653
!	%l3 = 0000000000000000, immd = 00000a96, %y  = 0000000d
	udiv	%l3,0xa96,%l6		! %l6 = 00000000013a611c
	mov	%l0,%y			! %y = 92310000
!	%l2 = 000000000000ff00, immd = fffff7e7, %y  = 92310000
	sdiv	%l2,-0x819,%l3		! %l3 = 000000007fffffff
	mov	%l0,%y			! %y = 92310000
!	Mem[00000000100c1410] = 7f000000, %l7 = 000000000000000d, %asi = 80
	swapa	[%i3+0x010]%asi,%l7	! %l7 = 000000007f000000
!	%f25 = 00000000, Mem[00000000100c1410] = 0000000d
	sta	%f25,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[0000000010081408] = 000000ff, %l4 = 000000003100ffff
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l2 = 000000000000ff00, Mem[0000000030181400] = ff000000
	stba	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%f16 = ccdf99d0, Mem[0000000010181408] = 0000000d
	sta	%f16,[%i6+%o4]0x80	! Mem[0000000010181408] = ccdf99d0
!	%l6 = 00000000013a611c, %l2 = 000000000000ff00, %y  = 92310000
	smul	%l6,%l2,%l7		! %l7 = 0000013926bae400, %y = 00000139

p0_label_174:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ba8f001b, %l3 = 000000007fffffff
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = 000000000000001b
!	Mem[00000000218000c0] = ff4fdf50, %l7 = 0000013926bae400, %asi = 80
	lduha	[%o3+0x0c0]%asi,%l7	! %l7 = 000000000000ff4f
!	Mem[0000000010081410] = 37467dbd, %f21 = 6fedccdf
	lda	[%i2+%o5]0x80,%f21	! %f21 = 37467dbd
!	Mem[0000000030081400] = 000000000000ff00, %f24 = ffffffff 00000000
	ldda	[%i2+%g0]0x89,%f24	! %f24 = 00000000 0000ff00
!	Mem[00000000100c1408] = ffff00ff2a000000, %l7 = 000000000000ff4f, %asi = 80
	ldxa	[%i3+0x008]%asi,%l7	! %l7 = ffff00ff2a000000
!	Mem[0000000010181410] = ba8f001b, %l1 = 000000000000ffe8
	ldsba	[%i6+%o5]0x88,%l1	! %l1 = 000000000000001b
!	Mem[0000000010001408] = 2641f94b0000ff00, %l5 = 00000000596b2653
	ldxa	[%i0+%o4]0x88,%l5	! %l5 = 2641f94b0000ff00
!	Mem[0000000010141408] = 00003192, %f30 = 7fff20f0
	lda	[%i5+%o4]0x80,%f30	! %f30 = 00003192
!	Mem[0000000030101408] = 37467dbd, %l1 = 000000000000001b
	lduba	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000037
!	Mem[0000000021800000] = 2b696cc0, %l5 = 2641f94b0000ff00
	ldsh	[%o3+%g0],%l5		! %l5 = 0000000000002b69

p0_label_175:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ff00ffff, %l0 = 0000000092310000
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l7 = ffff00ff2a000000, Mem[00000000211c0000] = 00003e90
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 00003e90
!	Mem[00000000300c1400] = 0000000d, %l7 = ffff00ff2a000000
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = 000000ff 00000000 00000000 00000000
!	%f0  = 0000000d 0000ff00 ff000000 bd7d4637
!	%f4  = 2cba358d 2a5d5d1b 04b3c11a 4f27c483
!	%f8  = 0000ffff ff000000 97ff1571 00000000
!	%f12 = ff000214 7cfd4637 56e24ef2 7115ff97
	stda	%f0 ,[%i5+%g0]ASI_COMMIT_S	! Block Store to 0000000030141400
!	%f12 = ff000214 7cfd4637, Mem[0000000010181400] = 00000000 1b008fba
	stda	%f12,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000214 7cfd4637
!	%l5 = 0000000000002b69, Mem[0000000010081410] = bd7d4637
	stba	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = bd7d4669
!	%l6 = 00000000013a611c, immd = 00000fe2, %y  = 00000139
	udiv	%l6,0xfe2,%l5		! %l5 = 0000000013b50713
	mov	%l0,%y			! %y = 000000ff
!	%l7 = 0000000000000000, imm = 0000000000000a36, %l3 = 000000000000001b
	addc	%l7,0xa36,%l3		! %l3 = 0000000000000a36
!	%l4 = 000000ff, %l5 = 13b50713, Mem[00000000300c1408] = ffffff00 37467dbd
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff 13b50713
!	%l3 = 0000000000000a36, Mem[0000000010101408] = 000000ff
	stwa	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000a36

p0_label_176:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000dffff, %l0 = 00000000000000ff
	lduba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010141410] = 46000000, %l2 = 000000000000ff00
	lduwa	[%i5+%o5]0x80,%l2	! %l2 = 0000000046000000
!	Mem[0000000030141408] = ff000000bd7d4637, %l1 = 0000000000000037
	ldxa	[%i5+%o4]0x81,%l1	! %l1 = ff000000bd7d4637
!	Mem[00000000100c140c] = 2a000000, %l2 = 0000000046000000, %asi = 80
	ldswa	[%i3+0x00c]%asi,%l2	! %l2 = 000000002a000000
!	Mem[0000000030101410] = ffff0000, %l1 = ff000000bd7d4637
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 00000000ffff0000
!	Code Fragment 4, seed = 718568
p0_fragment_17:
!	%l0 = 0000000000000000
	setx	0x526655210dd328e6,%g7,%l0 ! %l0 = 526655210dd328e6
!	%l1 = 00000000ffff0000
	setx	0x8415aac683498111,%g7,%l1 ! %l1 = 8415aac683498111
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 526655210dd328e6
	setx	0x399214b7fff3fd4c,%g7,%l0 ! %l0 = 399214b7fff3fd4c
!	%l1 = 8415aac683498111
	setx	0xfe1e572e0b76a097,%g7,%l1 ! %l1 = fe1e572e0b76a097
p0_fragment_17_end:
!	Mem[0000000030101410] = 0000ffffff000000, %f26 = edb18945 2f3ecf6e
	ldda	[%i4+%o5]0x81,%f26	! %f26 = 0000ffff ff000000
!	Mem[0000000010001400] = 00000000, %l2 = 000000002a000000
	lduwa	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 37467dbd, %l7 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l7	! %l7 = 0000000000003746
!	Mem[0000000010141430] = ffffffff74044777, %f20 = 0000000d 37467dbd
	ldd	[%i5+0x030],%f20	! %f20 = ffffffff 74044777

p0_label_177:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00000000, %l6 = 00000000013a611c
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l0 = 399214b7fff3fd4c, Mem[0000000030041400] = 2cba358d
	stha	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = fd4c358d
!	Mem[0000000010101425] = 08592560, %l0 = 399214b7fff3fd4c
	ldstuba	[%i4+0x025]%asi,%l0	! %l0 = 0000000000000059
!	Mem[0000000030181400] = 00000000, %l5 = 0000000013b50713
	swapa	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%f30 = 00003192 374627da, Mem[0000000010141430] = ffffffff 74044777, %asi = 80
	stda	%f30,[%i5+0x030]%asi	! Mem[0000000010141430] = 00003192 374627da
!	Mem[0000000010181410] = ba8f001b, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 00000000ba8f001b
!	Mem[0000000010081408] = ff000000, %l2 = 00000000ba8f001b
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%l7 = 0000000000003746, Mem[0000000030001410] = 0000000d6fedccdf
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000003746
!	%l6 = 00000000, %l7 = 00003746, Mem[0000000010081400] = ff974058 365a8245
	std	%l6,[%i2+%g0]		! Mem[0000000010081400] = 00000000 00003746
!	%l1 = fe1e572e0b76a097, %l3 = 0000000000000a36, %l5 = 0000000000000000
	sub	%l1,%l3,%l5		! %l5 = fe1e572e0b769661

p0_label_178:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000003746
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %f15 = 7115ff97
	lda	[%i3+%g0]0x80,%f15	! %f15 = 00000000
!	Mem[0000000010101414] = 00000000, %l3 = 0000000000000a36
	ldsw	[%i4+0x014],%l3		! %l3 = 0000000000000000
!	Mem[0000000030001410] = 0000000000003746, %f20 = ffffffff 74044777
	ldda	[%i0+%o5]0x81,%f20	! %f20 = 00000000 00003746
!	Mem[0000000010041400] = ffff0031, %l1 = fe1e572e0b76a097
	ldsha	[%i1+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101408] = 37467dbd, %l4 = 00000000000000ff
	ldswa	[%i4+%o4]0x81,%l4	! %l4 = 0000000037467dbd
!	Mem[0000000030041410] = 0000007fff000000, %l4 = 0000000037467dbd
	ldxa	[%i1+%o5]0x89,%l4	! %l4 = 0000007fff000000
!	Mem[00000000300c1408] = ff000000 1307b513, %l6 = 00000000, %l7 = 00000000
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 00000000ff000000 000000001307b513
!	Mem[0000000010141408] = 92310000, %f28 = 2a5d5d1b
	lda	[%i5+%o4]0x88,%f28	! %f28 = 92310000
!	Mem[00000000100c1410] = 00000000, %f8  = 0000ffff
	ld	[%i3+%o5],%f8 		! %f8 = 00000000

p0_label_179:
!	Starting 10 instruction Store Burst
!	%l7 = 000000001307b513, Mem[0000000010181410] = 00000000
	stba	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000013
!	%l5 = fe1e572e0b769661, Mem[00000000201c0000] = 000d9c00, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 96619c00
!	Mem[0000000010041408] = 000000ff, %l4 = 0000007fff000000
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000ff000000, Mem[0000000010001418] = 1b5d5d2a46000000, %asi = 80
	stxa	%l6,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000000ff000000
!	%l4 = 00000000000000ff, Mem[0000000030141408] = 000000ff
	stba	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	Mem[00000000211c0000] = 00003e90, %l1 = ffffffffffffffff
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Code Fragment 3, seed = 588233
p0_fragment_18:
!	%l0 = 0000000000000059
	setx	0x209cbd10d3a0c2de,%g7,%l0 ! %l0 = 209cbd10d3a0c2de
!	%l1 = 0000000000000000
	setx	0x0a921f79a3255989,%g7,%l1 ! %l1 = 0a921f79a3255989
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 209cbd10d3a0c2de
	setx	0x0808c163284bcc44,%g7,%l0 ! %l0 = 0808c163284bcc44
!	%l1 = 0a921f79a3255989
	setx	0xc9d321597baa9e0f,%g7,%l1 ! %l1 = c9d321597baa9e0f
p0_fragment_18_end:
!	%l4 = 00000000000000ff, %l7 = 000000001307b513, %l4 = 00000000000000ff
	add	%l4,%l7,%l4		! %l4 = 000000001307b612
!	%f10 = 97ff1571 00000000, %l6 = 00000000ff000000
!	Mem[0000000010081410] = 69467dbd000000ff
	add	%i2,0x010,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_P ! Mem[0000000010081410] = 69467dbd000000ff
!	%l5 = fe1e572e0b769661, Mem[0000000030101400] = ff000000
	stwa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 0b769661

p0_label_180:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 000000ff, %f17 = ffffffff
	lda	[%i2+%o4]0x88,%f17	! %f17 = 000000ff
!	Mem[0000000030081410] = 000000ff, %l0 = 0808c163284bcc44
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041410] = ff000000, %f20 = 00000000
	lda	[%i1+%o5]0x89,%f20	! %f20 = ff000000
!	Mem[0000000030181410] = 0d000000, %l5 = fe1e572e0b769661
	lduba	[%i6+%o5]0x81,%l5	! %l5 = 000000000000000d
!	Mem[00000000300c1400] = ff00000d, %l3 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010101400] = 000dffff, %l6 = 00000000ff000000
	ldsba	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = 0d00000000ff0000, %l5 = 000000000000000d
	ldxa	[%i6+%o5]0x81,%l5	! %l5 = 0d00000000ff0000
!	Mem[0000000030141410] = 1b5d5d2a 8d35ba2c, %l4 = 1307b612, %l5 = 00ff0000
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 000000008d35ba2c 000000001b5d5d2a
!	Mem[0000000010141408] = 92310000, %l4 = 000000008d35ba2c
	ldsba	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000

p0_label_181:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 1b5d5d2a, Mem[0000000010041408] = 000000ff 000000ff
	stda	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 1b5d5d2a
!	%l6 = 0000000000000000, Mem[0000000030041408] = ffffffec
	stwa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	Mem[0000000010081418] = 1b5d5d2a22822653, %l1 = c9d321597baa9e0f, %l0 = ffffffffffffffff
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 1b5d5d2a22822653
!	%l3 = 000000000000ff00, Mem[0000000030041410] = 000000ff
	stwa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000ff00
!	Mem[0000000010141414] = 000000ff, %l4 = 00000000, %l2 = 000000ff
	add	%i5,0x14,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0001] = 96619c00, %l0 = 1b5d5d2a22822653
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 0000000000000061
!	Mem[0000000010081410] = 69467dbd, %l4 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 0000000069467dbd
!	%f24 = 00000000 0000ff00, %l1 = c9d321597baa9e0f
!	Mem[0000000010081400] = 0000000000003746
	stda	%f24,[%i2+%l1]ASI_PST16_P ! Mem[0000000010081400] = 000000000000ff00
!	Mem[00000000300c1410] = 2cba358d, %l4 = 0000000069467dbd
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 000000000000002c
!	%f27 = ff000000, Mem[0000000010001408] = 00ff0000
	sta	%f27,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000

p0_label_182:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 1b5d5d2a8d35ba2c, %f26 = 0000ffff ff000000
	ldda	[%i5+%o5]0x89,%f26	! %f26 = 1b5d5d2a 8d35ba2c
!	Mem[0000000010041424] = 596b2653, %f12 = ff000214
	lda	[%i1+0x024]%asi,%f12	! %f12 = 596b2653
!	Mem[0000000010141408] = 00003192 1b5d5d2a, %l0 = 00000061, %l1 = 7baa9e0f
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 0000000000003192 000000001b5d5d2a
!	Mem[0000000010101422] = f92fea34, %l4 = 000000000000002c
	ldsh	[%i4+0x022],%l4		! %l4 = ffffffffffffea34
!	%l7 = 000000001307b513, imm = 0000000000000d2f, %l5 = 000000001b5d5d2a
	xnor	%l7,0xd2f,%l5		! %l5 = ffffffffecf847c3
!	Mem[0000000030101408] = bd7d4637, %l2 = 00000000000000ff
	lduwa	[%i4+%o4]0x89,%l2	! %l2 = 00000000bd7d4637
!	%l0 = 0000000000003192, immd = fffffffffffff5f3, %l108 = 0000000000000002
	udivx	%l0,-0xa0d,%l2		! %l2 = 0000000000000000
!	Mem[0000000010001400] = 00000000ffffffff, %l0 = 0000000000003192, %asi = 80
	ldxa	[%i0+0x000]%asi,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030141408] = 37467dbd 000000ff, %l2 = 00000000, %l3 = 0000ff00
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff 0000000037467dbd
!	Mem[0000000010141400] = 0000ffff, %f6  = 04b3c11a
	lda	[%i5+%g0]0x80,%f6 	! %f6 = 0000ffff

p0_label_183:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c140c] = 2a000000, %l5 = ffffffffecf847c3
	ldstub	[%i3+0x00c],%l5		! %l5 = 000000000000002a
!	%l2 = 00000000000000ff, Mem[00000000100c1408] = ffff00ff
	stwa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	%l7 = 000000001307b513, Mem[0000000010181408] = ccdf99d0
	stba	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 13df99d0
!	Mem[0000000030081400] = 00ff0000, %l1 = 000000001b5d5d2a
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%l2 = 00000000000000ff, immd = fffff8ad, %y  = 000000ff
	sdiv	%l2,-0x753,%l6		! %l6 = ffffffffdd2f1aa0
	mov	%l0,%y			! %y = ffffffff
!	Mem[0000000030081400] = ffff0000, %l2 = 00000000000000ff
	lduba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030081400] = ffff0000
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l2 = 00000000000000ff, Mem[00000000100c1410] = 00000000
	stwa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	%f18 = 0d1d0000 ffffffff, %l3 = 0000000037467dbd
!	Mem[00000000100c1430] = 551dfd7c1402a247
	add	%i3,0x030,%g1
	stda	%f18,[%g1+%l3]ASI_PST8_PL ! Mem[00000000100c1430] = ff1dffff0000a20d
!	%l1 = 0000000000000000, imm = 0000000000000932, %l7 = 000000001307b513
	xnor	%l1,0x932,%l7		! %l7 = fffffffffffff6cd

p0_label_184:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081434] = 0000ffff, %l3 = 0000000037467dbd, %asi = 80
	lduwa	[%i2+0x034]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010181400] = 3746fd7c 140200ff, %l2 = 000000ff, %l3 = 0000ffff
	ldda	[%i6+%g0]0x80,%l2	! %l2 = 000000003746fd7c 00000000140200ff
!	Mem[0000000010101410] = 000d0000, %l2 = 000000003746fd7c
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 000000000000000d
!	Mem[0000000030101410] = ffff0000, %l6 = ffffffffdd2f1aa0
	lduba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081434] = 0000ffff, %f0  = 0000000d
	lda	[%i2+0x034]%asi,%f0 	! %f0 = 0000ffff
!	%f18 = 0d1d0000, %f15 = 00000000, %f28 = 92310000
	fsubs	%f18,%f15,%f28		! %f28 = 0d1d0000
!	Mem[0000000030081400] = 00000000, %l0 = 00000000ffffffff
	ldsha	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = d099df00, %l0 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = ffffffffd099df00
!	Mem[00000000211c0001] = ff003e90, %l7 = fffffffffffff6cd, %asi = 80
	ldsba	[%o2+0x001]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 7cfd4637, %l4 = ffffffffffffea34
	lduwa	[%i6+%g0]0x88,%l4	! %l4 = 000000007cfd4637

p0_label_185:
!	Starting 10 instruction Store Burst
!	%l0 = d099df00, %l1 = 00000000, Mem[0000000010141418] = 000000ff 7a624165, %asi = 80
	stda	%l0,[%i5+0x018]%asi	! Mem[0000000010141418] = d099df00 00000000
!	%l6 = 0000000000000000, Mem[0000000010181403] = 3746fd7c, %asi = 80
	stba	%l6,[%i6+0x003]%asi	! Mem[0000000010181400] = 3746fd00
!	Mem[0000000030101408] = 37467dbd, %l7 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 0000000037467dbd
!	%f18 = 0d1d0000 ffffffff, Mem[0000000030001408] = 0d1d0000 ffffffff
	stda	%f18,[%i0+%o4]0x81	! Mem[0000000030001408] = 0d1d0000 ffffffff
!	%f6  = 0000ffff 4f27c483, Mem[0000000010101410] = 00000d00 00000000
	stda	%f6 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000ffff 4f27c483
!	Mem[0000000010001400] = 00000000, %l2 = 000000000000000d
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 7cfd4637, %l3 = 00000000140200ff
	swapa	[%i6+%o4]0x89,%l3	! %l3 = 000000007cfd4637
!	Mem[0000000010181408] = d099df13, %l1 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l1	! %l1 = 00000000d099df13
!	%l2 = 0000000000000000, Mem[00000000300c1400] = ff00000d00000000
	stxa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000000
!	%f30 = 00003192, Mem[0000000010101408] = 360a0000
	sta	%f30,[%i4+%o4]0x80	! Mem[0000000010101408] = 00003192

p0_label_186:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00003192, %l1 = 00000000d099df13
	lduba	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141427] = 08592560, %l5 = 000000000000002a, %asi = 80
	lduba	[%i5+0x027]%asi,%l5	! %l5 = 0000000000000060
!	Mem[0000000010041430] = ffffffff 33848245, %l4 = 7cfd4637, %l5 = 00000060
	ldd	[%i1+0x030],%l4		! %l4 = 00000000ffffffff 0000000033848245
!	Mem[0000000010101400] = 000dffff, %l6 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l6	! %l6 = 000000000000000d
!	Mem[0000000010041410] = 00000000, %l4 = 00000000ffffffff
	ldswa	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181428] = 2e0a5a360000ffff, %f26 = 1b5d5d2a 8d35ba2c, %asi = 80
	ldda	[%i6+0x028]%asi,%f26	! %f26 = 2e0a5a36 0000ffff
!	Mem[0000000010081408] = 000000ff, %l1 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041434] = 33848245, %f22 = 7f4a8fba
	ld	[%i1+0x034],%f22	! %f22 = 33848245
!	Mem[0000000030101410] = 0000ffff, %l2 = 0000000000000000
	ldsha	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = d099df00, %f29 = 92310000
	lda	[%i0+%g0]0x89,%f29	! %f29 = d099df00

p0_label_187:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 00000000, %l4 = 00000000, %l2 = 00000000
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 0000000000000000
!	%f14 = 56e24ef2 00000000, %l5 = 0000000033848245
!	Mem[0000000010081408] = ff0000007115ff97
	add	%i2,0x008,%g1
	stda	%f14,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010081408] = 00000000f24eff97
!	%l3 = 000000007cfd4637, Mem[0000000030081400] = 00000000
	stwa	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 7cfd4637
!	%f14 = 56e24ef2, %f10 = 97ff1571, %f17 = 000000ff
	fadds	%f14,%f10,%f17		! %f17 = 56e24ef2
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[000000001014140c] = 1b5d5d2a, %l7 = 0000000037467dbd, %asi = 80
	swapa	[%i5+0x00c]%asi,%l7	! %l7 = 000000001b5d5d2a
!	Code Fragment 4, seed = 610852
p0_fragment_19:
!	%l0 = ffffffffd099df00
	setx	0x13006d2c63cc4b06,%g7,%l0 ! %l0 = 13006d2c63cc4b06
!	%l1 = 00000000000000ff
	setx	0xfd7da824483b8931,%g7,%l1 ! %l1 = fd7da824483b8931
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 13006d2c63cc4b06
	setx	0x944b3ac321020b6c,%g7,%l0 ! %l0 = 944b3ac321020b6c
!	%l1 = fd7da824483b8931
	setx	0xaf0fd6af02d9d4b7,%g7,%l1 ! %l1 = af0fd6af02d9d4b7
p0_fragment_19_end:
!	%l0 = 944b3ac321020b6c, Mem[0000000030041408] = 00000000
	stha	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 0b6c0000
!	%f8  = 00000000 ff000000, Mem[0000000030141400] = 0d000000 00ff0000
	stda	%f8 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 ff000000
!	%l3 = 000000007cfd4637, Mem[00000000300c1400] = 00000000
	stwa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 7cfd4637

p0_label_188:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 97ff4ef200000000, %l1 = af0fd6af02d9d4b7
	ldxa	[%i2+%o4]0x88,%l1	! %l1 = 97ff4ef200000000
!	Mem[0000000010081403] = 00000000, %l1 = 97ff4ef200000000, %asi = 80
	lduba	[%i2+0x003]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 140200ff, %l2 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001400] = 0000000d, %f30 = 00003192
	lda	[%i0+%g0]0x80,%f30	! %f30 = 0000000d
!	Mem[00000000100c1410] = 000000ff, %l0 = 944b3ac321020b6c
	lduha	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101408] = ff000000 92310000, %l6 = 0000000d, %l7 = 1b5d5d2a
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 0000000092310000 00000000ff000000
!	Mem[0000000030101400] = 0b769661, %f23 = 3a21b4a3
	lda	[%i4+%g0]0x81,%f23	! %f23 = 0b769661
!	Mem[0000000010081410] = 00000000, %l7 = 00000000ff000000
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 1b008fba, %l3 = 000000007cfd4637
	lduwa	[%i2+%o4]0x81,%l3	! %l3 = 000000001b008fba
!	%f7  = 4f27c483, %f2  = ff000000
	fcmps	%fcc2,%f7 ,%f2 		! %fcc2 = 2

p0_label_189:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 33848245, Mem[0000000010081408] = 00000000 f24eff97
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 33848245
!	Mem[0000000010101408] = 00003192, %l0 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 0000000000003192
!	Mem[0000000030041400] = fd4c358d 2a5d5d1b 0b6c0000 00005400
!	%f16 = ccdf99d0 56e24ef2 0d1d0000 ffffffff
!	%f20 = ff000000 00003746 33848245 0b769661
!	%f24 = 00000000 0000ff00 2e0a5a36 0000ffff
!	%f28 = 0d1d0000 d099df00 0000000d 374627da
	stda	%f16,[%i1+%g0]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	%f30 = 0000000d 374627da, %f3  = bd7d4637
	fxtos	%f30,%f3 		! %f3  = 51537462
!	%f14 = 56e24ef2, %f21 = 00003746, %f4  = 2cba358d
	fmuls	%f14,%f21,%f4 		! tt=0x22, %l0 = 00000000000031b4
!	Mem[0000000030101400] = 0b769661, %l0 = 00000000000031b4
	swapa	[%i4+%g0]0x81,%l0	! %l0 = 000000000b769661
!	%l6 = 0000000092310000, Mem[00000000100c1410] = ff000000
	stha	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	%l7 = 0000000000000000, Mem[0000000020800000] = ffff5630, %asi = 80
	stha	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = 00005630
!	Mem[0000000010001428] = 00000000000000ff, %l2 = 00000000000000ff, %l0 = 000000000b769661
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_190:
!	Starting 10 instruction Load Burst
!	%l2 = 00000000000000ff, %l3 = 000000001b008fba, %l2 = 00000000000000ff
	udivx	%l2,%l3,%l2		! %l2 = 0000000000000000
!	Mem[0000000010181400] = 3746fd00, %f12 = 596b2653
	lda	[%i6+%g0]0x80,%f12	! %f12 = 3746fd00
!	Mem[0000000010081408] = 45828433 00000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000 0000000045828433
!	Mem[0000000030181410] = 0000000d, %l6 = 0000000092310000
	lduwa	[%i6+%o5]0x89,%l6	! %l6 = 000000000000000d
!	Mem[0000000010081408] = 0000000033848245, %f0  = 0000ffff 0000ff00
	ldda	[%i2+%o4]0x80,%f0 	! %f0  = 00000000 33848245
!	Mem[0000000030181408] = ff000214, %l1 = 0000000045828433
	ldsha	[%i6+%o4]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010001408] = ff000000 4bf94126, %l0 = 00000000, %l1 = ffffff00
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 00000000ff000000 000000004bf94126
!	Mem[0000000010081410] = ff000000000000ff, %l1 = 000000004bf94126
	ldxa	[%i2+%o5]0x88,%l1	! %l1 = ff000000000000ff
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000010041400] = 3100ffff, %l2 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030101400] = 000031b4 0d000000, %l0 = ff000000, %l1 = 000000ff
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 00000000000031b4 000000000d000000

p0_label_191:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 00000000, %l3 = 000000001b008fba
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stwa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Mem[0000000030081410] = 000000ff, %l0 = 00000000000031b4
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = 3746fd00 140200ff ff000000 00000000
!	%f16 = ccdf99d0 56e24ef2 0d1d0000 ffffffff
!	%f20 = ff000000 00003746 33848245 0b769661
!	%f24 = 00000000 0000ff00 2e0a5a36 0000ffff
!	%f28 = 0d1d0000 d099df00 0000000d 374627da
	stda	%f16,[%i6+%g0]ASI_BLK_PL	! Block Store to 0000000010181400
!	%l1 = 000000000d000000, Mem[0000000010041410] = 00000000
	stha	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010181410] = 46370000, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 0000000046370000
!	Mem[000000001004142c] = 00001a27, %l6 = 000000000000000d
	ldstuba	[%i1+0x02c]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000201c0000] = 96ff9c00, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00009c00
!	Mem[0000000010101400] = 000dffff 00ff0000 000000ff 000000ff
!	%f0  = 00000000 33848245 ff000000 51537462
!	%f4  = 2cba358d 2a5d5d1b 0000ffff 4f27c483
!	%f8  = 00000000 ff000000 97ff1571 00000000
!	%f12 = 3746fd00 7cfd4637 56e24ef2 00000000
	stda	%f0 ,[%i4+%g0]ASI_COMMIT_P	! Block Store to 0000000010101400

p0_label_192:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l2 = 000000000000ffff
	ldswa	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = ff000000000000ff, %f28 = 0d1d0000 d099df00
	ldda	[%i2+%o5]0x88,%f28	! %f28 = ff000000 000000ff
!	Mem[00000000100c1408] = 000000ff, %l4 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%f7  = 4f27c483, %f27 = 0000ffff
	fcmps	%fcc0,%f7 ,%f27		! %fcc0 = 2
!	Mem[0000000030181410] = 0d000000, %l6 = 0000000000000000
	lduha	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000d00
!	Mem[00000000300c1410] = ffba358d, %f17 = 56e24ef2
	lda	[%i3+%o5]0x81,%f17	! %f17 = ffba358d
!	Mem[0000000020800001] = 00005630, %l7 = 0000000046370000, %asi = 80
	lduba	[%o1+0x001]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 00003192, %f17 = ffba358d
	lda	[%i5+%o4]0x80,%f17	! %f17 = 00003192
!	Mem[0000000030041410] = ff000000, %l5 = 0000000033848245
	ldsba	[%i1+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181408] = ffffffff, %l0 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l0	! %l0 = 00000000ffffffff

p0_label_193:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030001410] = 00000000 46370000
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 00000000
!	%l4 = 0000000000000000, Mem[0000000030141400] = ff000000
	stwa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l3 = 0000000000000000, Mem[00000000300c1410] = 8d35baff
	stba	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 8d35ba00
!	%f15 = 00000000, Mem[0000000030001410] = 00000000
	sta	%f15,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%f26 = 2e0a5a36 0000ffff, Mem[0000000030041408] = 00001d0d ffffffff
	stda	%f26,[%i1+%o4]0x89	! Mem[0000000030041408] = 2e0a5a36 0000ffff
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000d00
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0001] = 00009c00, %l5 = ffffffffffffffff
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = ffff003153266b59, %l4 = 0000000000000000, %l0 = 00000000ffffffff
	casxa	[%i1]0x80,%l4,%l0	! %l0 = ffff003153266b59
!	%l4 = 0000000000000000, Mem[0000000030141410] = 2cba358d2a5d5d1b
	stxa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000000
!	%l0 = 53266b59, %l1 = 0d000000, Mem[0000000030101408] = 00000000 ff000000
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 53266b59 0d000000

p0_label_194:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 000000002a5d5d1b, %l2 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l2	! %l2 = 000000002a5d5d1b
!	%l2 = 000000002a5d5d1b, imm = fffffffffffff5f3, %l4 = 0000000000000000
	addc	%l2,-0xa0d,%l4		! %l4 = 000000002a5d530e
!	Mem[0000000010041400] = ffff0031 53266b59, %l0 = 53266b59, %l1 = 0d000000
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000ffff0031 0000000053266b59
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 0000000d, %l2 = 000000002a5d5d1b
	lduwa	[%i6+%o5]0x89,%l2	! %l2 = 000000000000000d
!	Mem[0000000010141400] = ffff0000, %l1 = 0000000053266b59
	ldsha	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = d099df00, %l1 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l1	! %l1 = ffffffffd099df00
!	Mem[0000000010081410] = ff000000, %l6 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000010101400] = 00000000, %l0 = 00000000ffff0031
	ldswa	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = ffff0000, %l7 = 0000000000000000
	ldsba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000

p0_label_195:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = d099df00, Mem[0000000010001420] = ffffffec 000000ff, %asi = 80
	stda	%l0,[%i0+0x020]%asi	! Mem[0000000010001420] = 00000000 d099df00
!	%l0 = 00000000, %l1 = d099df00, Mem[0000000010041408] = 00000000 1b5d5d2a
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 d099df00
!	%f10 = 97ff1571, Mem[000000001000140c] = 4bf94126
	sta	%f10,[%i0+0x00c]%asi	! Mem[000000001000140c] = 97ff1571
!	%f29 = 000000ff, Mem[0000000010141408] = 92310000
	sta	%f29,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l2 = 000000000000000d, Mem[0000000030101400] = b4310000
	stwa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000d
!	%l7 = 0000000000000000, Mem[0000000010101405] = 33848245, %asi = 80
	stba	%l7,[%i4+0x005]%asi	! Mem[0000000010101404] = 33008245
!	Mem[0000000030041400] = d099dfcc, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000cc
!	%l3 = 0000000000000000, Mem[0000000030081410] = 000031b4
	stba	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 00003100
!	%l2 = 0000000d, %l3 = 00000000, Mem[0000000010101410] = 8d35ba2c 1b5d5d2a
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000d 00000000

p0_label_196:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff000000, %l7 = 0000000000000000
	lduba	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1414] = 000000ff, %l3 = 0000000000000000, %asi = 80
	ldsha	[%i3+0x014]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %f28 = ff000000
	lda	[%i1+0x010]%asi,%f28	! %f28 = 00000000
!	Mem[0000000010101408] = 000000ff, %f7  = 4f27c483
	lda	[%i4+%o4]0x88,%f7 	! %f7 = 000000ff
!	Mem[0000000030041408] = ffff0000, %f29 = 000000ff
	lda	[%i1+%o4]0x81,%f29	! %f29 = ffff0000
!	Mem[0000000010001428] = 00000000, %l1 = ffffffffd099df00, %asi = 80
	lduwa	[%i0+0x028]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = 46000000 000000ff, %l6 = 000000ff, %l7 = 00000000, %asi = 80
	ldda	[%i5+0x010]%asi,%l6	! %l6 = 0000000046000000 00000000000000ff
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l6 = 0000000046000000
	lduba	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ff003e90, %l2 = 000000000000000d
	ldub	[%o2+%g0],%l2		! %l2 = 00000000000000ff

p0_label_197:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[000000001000140c] = 97ff1571, %asi = 80
	stwa	%l3,[%i0+0x00c]%asi	! Mem[000000001000140c] = 00000000
!	Mem[0000000010181400] = f24ee256, %l2 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 00000000f24ee256
!	%l0 = 00000000000000cc, Mem[0000000010101408] = ff00000051537462
	stxa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000000000cc
!	Code Fragment 3, seed = 481514
p0_fragment_20:
!	%l0 = 00000000000000cc
	setx	0x385918c54dbbbad6,%g7,%l0 ! %l0 = 385918c54dbbbad6
!	%l1 = 0000000000000000
	setx	0x9191222357a83001,%g7,%l1 ! %l1 = 9191222357a83001
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 385918c54dbbbad6
	setx	0x0d0ccd5b0ef2393c,%g7,%l0 ! %l0 = 0d0ccd5b0ef2393c
!	%l1 = 9191222357a83001
	setx	0x1982b6ce73c2d987,%g7,%l1 ! %l1 = 1982b6ce73c2d987
p0_fragment_20_end:
!	%l6 = 0000000000000000, Mem[0000000030081410] = 00310000
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Mem[0000000010101408] = 00000000, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 00000046, %l1 = 0000000073c2d987
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000046
!	%l6 = 0000000000000000, Mem[0000000021800081] = 00693d20
	stb	%l6,[%o3+0x081]		! Mem[0000000021800080] = 00003d20
!	%l7 = 00000000000000ff, Mem[00000000300c1410] = 00ba358d
	stwa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff
!	%f10 = 97ff1571 00000000, Mem[0000000010081408] = ba8f001b 33848245, %asi = 80
	stda	%f10,[%i2+0x008]%asi	! Mem[0000000010081408] = 97ff1571 00000000

p0_label_198:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %f20 = ff000000
	lda	[%i5+%g0]0x89,%f20	! %f20 = 00000000
!	Mem[0000000030081400] = 000000007cfd4637, %l2 = 00000000f24ee256
	ldxa	[%i2+%g0]0x89,%l2	! %l2 = 000000007cfd4637
!	Mem[0000000030081400] = 7cfd4637, %l2 = 000000007cfd4637
	ldswa	[%i2+%g0]0x89,%l2	! %l2 = 000000007cfd4637
!	Mem[0000000010181410] = 00000000, %l5 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 000000ffd099dfcc, %f12 = 3746fd00 7cfd4637
	ldda	[%i6+%g0]0x80,%f12	! %f12 = 000000ff d099dfcc
!	Mem[0000000010081400] = 00000000, %l0 = 0d0ccd5b0ef2393c
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l5 = 0000000000000000
	lduwa	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = 97ff157100000000, %f30 = 0000000d 374627da
	ldda	[%i2+%o4]0x80,%f30	! %f30 = 97ff1571 00000000
!	Mem[0000000010141400] = 0000ffff, %l0 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030181408] = 140200ff, %l6 = 0000000000000000
	ldsba	[%i6+%o4]0x89,%l6	! %l6 = ffffffffffffffff

p0_label_199:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 000000ff, %l6 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 53266b59, %l0 = 000000000000ffff
	swapa	[%i4+%o4]0x89,%l0	! %l0 = 0000000053266b59
!	%f16 = ccdf99d0 00003192, %l5 = 0000000000000000
!	Mem[0000000010001408] = ff00000000000000
	add	%i0,0x008,%g1
	stda	%f16,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010001408] = ff00000000000000
!	%f24 = 00000000 0000ff00, Mem[0000000030101408] = ffff0000 0000000d
	stda	%f24,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 0000ff00
!	Mem[0000000030001410] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010041400] = 3100ffff
	stwa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%f18 = 0d1d0000 ffffffff, %l6 = 0000000000000000
!	Mem[00000000300c1430] = ff0002147cfd4637
	add	%i3,0x030,%g1
	stda	%f18,[%g1+%l6]ASI_PST16_S ! Mem[00000000300c1430] = ff0002147cfd4637
!	%f24 = 00000000, Mem[000000001018142c] = 365a0a2e
	st	%f24,[%i6+0x02c]	! Mem[000000001018142c] = 00000000
!	%f4  = 2cba358d 2a5d5d1b, %l0 = 0000000053266b59
!	Mem[0000000010181410] = 00000000000000ff
	add	%i6,0x010,%g1
	stda	%f4,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010181410] = 1b5d00000000ba2c
!	Mem[0000000030041408] = 0000ffff, %l0 = 0000000053266b59
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff

p0_label_200:
!	Starting 10 instruction Load Burst
!	Mem[000000001008140e] = 00000000, %l7 = 00000000000000ff
	ldsb	[%i2+0x00e],%l7		! %l7 = 0000000000000000
!	Mem[0000000030081410] = d77064e400000000, %f4  = 2cba358d 2a5d5d1b
	ldda	[%i2+%o5]0x89,%f4 	! %f4  = d77064e4 00000000
!	Mem[0000000010101410] = 0000000d, %f1  = 33848245
	lda	[%i4+%o5]0x88,%f1 	! %f1 = 0000000d
!	Mem[0000000010141408] = 000000ff, %l6 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101410] = ffff0000, %l1 = 0000000000000046
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 00000000ffff0000
!	Mem[0000000010141410] = ff00000073c2d987, %l2 = 000000007cfd4637
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = ff00000073c2d987
!	Mem[00000000300c1410] = ff000000, %l5 = 0000000000000000
	ldsba	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = ff000000, %l4 = 000000002a5d530e, %asi = 80
	ldsha	[%i0+0x008]%asi,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030041408] = ffff0000 365a0a2e, %l0 = 000000ff, %l1 = ffff0000
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 00000000ffff0000 00000000365a0a2e
!	Code Fragment 4, seed = 899273
p0_fragment_21:
!	%l0 = 00000000ffff0000
	setx	0xc11c1cfdcf69cade,%g7,%l0 ! %l0 = c11c1cfdcf69cade
!	%l1 = 00000000365a0a2e
	setx	0x3e63bc584f3fe189,%g7,%l1 ! %l1 = 3e63bc584f3fe189
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c11c1cfdcf69cade
	setx	0x89102e8811ffd444,%g7,%l0 ! %l0 = 89102e8811ffd444
!	%l1 = 3e63bc584f3fe189
	setx	0xa2a196f34dc0260f,%g7,%l1 ! %l1 = a2a196f34dc0260f
p0_fragment_21_end:

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 89102e8811ffd444
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be a2a196f34dc0260f
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be ff00000073c2d987
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be ffffffffffffff00
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be ffffffffffffffff
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
	cmp	%l0,%l1			! %f0  should be 00000000 0000000d
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ff000000 51537462
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be d77064e4 00000000
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 0000ffff 000000ff
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 ff000000
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 97ff1571 00000000
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 000000ff d099dfcc
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 56e24ef2 00000000
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ccdf99d0 00003192
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 0d1d0000 ffffffff
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00003746
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 33848245 0b769661
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 0000ff00
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 2e0a5a36 0000ffff
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 00000000 ffff0000
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 97ff1571 00000000
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
	ldx	[%g1+0x000],%l0		! %l0 = 4161ff66ff58454e
	ldx	[%g1+0x008],%l1		! %l1 = ab432e2bf94a10f9
	ldx	[%g1+0x010],%l2		! %l2 = 6a1840dc0d3ba8b4
	ldx	[%g1+0x018],%l3		! %l3 = 645aa513f0208f7f
	ldx	[%g1+0x020],%l4		! %l4 = 460e1babed10d85a
	ldx	[%g1+0x028],%l5		! %l5 = 179dac3a53642645
	ldx	[%g1+0x030],%l6		! %l6 = 17ce4438e5dcac40
	ldx	[%g1+0x038],%l7		! %l7 = 5efa2d3ebde22d4b

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
	xor	%l0,%l2,%l1
	add	%l7,%l3,%l7
	fadds	%f4 ,%f5 ,%f5 
	fmuls	%f8 ,%f13,%f1 
	ldub	[%i3+0x010],%l2		! Mem[00000000100c1410]
	sub	%l4,0xc03,%l3
	jmpl	%o7,%g0
	subc	%l6,0xe81,%l1
p0_near_0_he:
	jmpl	%o7,%g0
	fcmps	%fcc2,%f27,%f27
	jmpl	%o7,%g0
	nop
p0_near_0_lo:
	xor	%l0,%l2,%l1
	add	%l7,%l3,%l7
	fadds	%f4 ,%f5 ,%f5 
	fmuls	%f8 ,%f13,%f1 
	ldub	[%o3+0x010],%l2		! Mem[00000000100c1410]
	sub	%l4,0xc03,%l3
	jmpl	%o7,%g0
	subc	%l6,0xe81,%l1
p0_near_0_ho:
	jmpl	%o7,%g0
	fcmps	%fcc2,%f27,%f27
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	subc	%l2,0x4d6,%l3
	fdivs	%f30,%f30,%f21
	smul	%l2,0xbca,%l5
	jmpl	%o7,%g0
	addc	%l3,%l0,%l3
near0_b2b_l:
	fsubs	%f11,%f1 ,%f7 
	and	%l7,%l6,%l0
	sdivx	%l0,%l6,%l2
	jmpl	%o7,%g0
	andn	%l5,%l5,%l2
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
	fdivs	%f8 ,%f4 ,%f2 
	std	%f14,[%i2+0x020]	! Mem[0000000010081420]
	smul	%l1,-0x4af,%l6
	umul	%l6,-0xa9b,%l1
	add	%l2,%l2,%l6
	umul	%l1,%l1,%l3
	fadds	%f6 ,%f0 ,%f13
	jmpl	%o7,%g0
	smul	%l1,0x262,%l4
p0_near_1_he:
	fcmps	%fcc1,%f25,%f23
	xnor	%l7,%l4,%l3
	fsqrts	%f26,%f21
	ldd	[%i6+0x028],%f18	! Mem[0000000010181428]
	or	%l0,0xa2c,%l6
	xor	%l5,%l3,%l0
	andn	%l2,%l6,%l2
	jmpl	%o7,%g0
	subc	%l1,0x0bb,%l5
p0_near_1_lo:
	fdivs	%f8 ,%f4 ,%f2 
	std	%f14,[%o2+0x020]	! Mem[0000000010081420]
	smul	%l1,-0x4af,%l6
	umul	%l6,-0xa9b,%l1
	add	%l2,%l2,%l6
	umul	%l1,%l1,%l3
	fadds	%f6 ,%f0 ,%f13
	jmpl	%o7,%g0
	smul	%l1,0x262,%l4
p0_near_1_ho:
	fcmps	%fcc1,%f25,%f23
	xnor	%l7,%l4,%l3
	fsqrts	%f26,%f21
	ldd	[%o6+0x028],%f18	! Mem[0000000010181428]
	or	%l0,0xa2c,%l6
	xor	%l5,%l3,%l0
	andn	%l2,%l6,%l2
	jmpl	%o7,%g0
	subc	%l1,0x0bb,%l5
near1_b2b_h:
	fsubs	%f18,%f29,%f25
	sub	%l3,-0xa4a,%l4
	add	%l0,-0x9ad,%l4
	fdivs	%f20,%f25,%f17
	sub	%l4,%l6,%l4
	xor	%l0,%l5,%l6
	jmpl	%o7,%g0
	fdivs	%f17,%f30,%f26
near1_b2b_l:
	fdivs	%f8 ,%f12,%f6 
	mulx	%l7,0x89e,%l0
	mulx	%l3,%l1,%l6
	fcmps	%fcc2,%f4 ,%f3 
	orn	%l4,-0x115,%l5
	umul	%l4,-0xd3c,%l0
	jmpl	%o7,%g0
	subc	%l3,0x9a5,%l7
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
	ldstub	[%o3+0x181],%l2		! Mem[0000000021800181]
	and	%l4,%l0,%l2
	jmpl	%o7,%g0
	and	%l0,%l2,%l6
p0_near_2_he:
	sub	%l2,0xa11,%l1
	jmpl	%o7,%g0
	sth	%l0,[%i0+0x01c]		! Mem[000000001000141c]
p0_near_2_lo:
	ldstub	[%i3+0x181],%l2		! Mem[0000000021800181]
	and	%l4,%l0,%l2
	jmpl	%o7,%g0
	and	%l0,%l2,%l6
p0_near_2_ho:
	sub	%l2,0xa11,%l1
	jmpl	%o7,%g0
	sth	%l0,[%o0+0x01c]		! Mem[000000001000141c]
near2_b2b_h:
	addc	%l3,-0x531,%l3
	fdivs	%f25,%f24,%f25
	xor	%l6,%l4,%l3
	fmuls	%f26,%f25,%f26
	udivx	%l6,%l2,%l0
	fdivs	%f18,%f29,%f19
	fmuls	%f25,%f17,%f31
	jmpl	%o7,%g0
	fadds	%f17,%f29,%f27
near2_b2b_l:
	and	%l5,-0x4ce,%l7
	and	%l2,0xd75,%l0
	addc	%l5,-0xd0f,%l5
	add	%l0,%l5,%l5
	udivx	%l1,%l1,%l7
	mulx	%l5,0x775,%l1
	and	%l2,0x858,%l5
	jmpl	%o7,%g0
	smul	%l3,%l6,%l2
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
	mulx	%l6,%l3,%l3
	andn	%l7,-0xfac,%l1
	orn	%l1,-0x66a,%l7
	jmpl	%o7,%g0
	sub	%l7,%l2,%l1
p0_near_3_he:
	subc	%l4,%l5,%l1
	andn	%l2,%l2,%l0
	jmpl	%o7,%g0
	subc	%l1,%l7,%l4
p0_near_3_lo:
	mulx	%l6,%l3,%l3
	andn	%l7,-0xfac,%l1
	orn	%l1,-0x66a,%l7
	jmpl	%o7,%g0
	sub	%l7,%l2,%l1
p0_near_3_ho:
	subc	%l4,%l5,%l1
	andn	%l2,%l2,%l0
	jmpl	%o7,%g0
	subc	%l1,%l7,%l4
near3_b2b_h:
	subc	%l3,-0xc6c,%l7
	and	%l5,%l4,%l4
	fadds	%f23,%f30,%f26
	addc	%l2,%l2,%l7
	xnor	%l2,%l7,%l0
	jmpl	%o7,%g0
	subc	%l4,0xc1a,%l2
near3_b2b_l:
	addc	%l5,%l0,%l2
	fdivs	%f5 ,%f1 ,%f13
	andn	%l3,-0xb61,%l0
	sdivx	%l2,0xf3c,%l4
	xor	%l2,-0xaae,%l2
	jmpl	%o7,%g0
	udivx	%l1,%l2,%l7
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
	udivx	%l0,0x9d5,%l7
	xnor	%l2,0x5ee,%l7
	sdivx	%l4,0x3fd,%l0
	udivx	%l4,%l3,%l4
	mulx	%l5,%l2,%l2
	jmpl	%o7,%g0
	fsubs	%f7 ,%f8 ,%f1 
p0_far_0_he:
	fdivs	%f29,%f29,%f19
	jmpl	%o7,%g0
	udivx	%l7,0xf78,%l6
p0_far_0_lo:
	udivx	%l0,0x9d5,%l7
	xnor	%l2,0x5ee,%l7
	sdivx	%l4,0x3fd,%l0
	udivx	%l4,%l3,%l4
	mulx	%l5,%l2,%l2
	jmpl	%o7,%g0
	fsubs	%f7 ,%f8 ,%f1 
p0_far_0_ho:
	fdivs	%f29,%f29,%f19
	jmpl	%o7,%g0
	udivx	%l7,0xf78,%l6
far0_b2b_h:
	add	%l0,%l7,%l7
	fcmps	%fcc1,%f31,%f23
	xor	%l2,%l5,%l6
	fmuls	%f23,%f23,%f19
	jmpl	%o7,%g0
	xor	%l6,%l7,%l5
far0_b2b_l:
	fsubs	%f4 ,%f8 ,%f5 
	umul	%l0,%l6,%l0
	add	%l5,0x6e8,%l5
	xor	%l3,-0x537,%l0
	jmpl	%o7,%g0
	add	%l4,%l6,%l3
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
	fsqrts	%f1 ,%f2 
	subc	%l7,%l7,%l0
	subc	%l6,%l1,%l6
	jmpl	%o7,%g0
	fcmps	%fcc3,%f6 ,%f6 
p0_far_1_he:
	xnor	%l7,%l3,%l2
	fadds	%f24,%f28,%f18
	umul	%l5,%l3,%l1
	jmpl	%o7,%g0
	andn	%l3,%l6,%l3
p0_far_1_lo:
	fsqrts	%f1 ,%f2 
	subc	%l7,%l7,%l0
	subc	%l6,%l1,%l6
	jmpl	%o7,%g0
	fcmps	%fcc3,%f6 ,%f6 
p0_far_1_ho:
	xnor	%l7,%l3,%l2
	fadds	%f24,%f28,%f18
	umul	%l5,%l3,%l1
	jmpl	%o7,%g0
	andn	%l3,%l6,%l3
far1_b2b_h:
	fmuls	%f21,%f20,%f29
	jmpl	%o7,%g0
	subc	%l6,%l2,%l3
far1_b2b_l:
	xnor	%l7,-0x800,%l5
	jmpl	%o7,%g0
	subc	%l2,%l0,%l3
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
	sub	%l4,%l7,%l6
	mulx	%l5,%l3,%l1
	fdivs	%f4 ,%f7 ,%f5 
	addc	%l7,%l1,%l3
	andn	%l4,0x663,%l5
	jmpl	%o7,%g0
	fcmps	%fcc1,%f0 ,%f4 
p0_far_2_he:
	jmpl	%o7,%g0
	mulx	%l4,0xfcd,%l6
	jmpl	%o7,%g0
	nop
p0_far_2_lo:
	sub	%l4,%l7,%l6
	mulx	%l5,%l3,%l1
	fdivs	%f4 ,%f7 ,%f5 
	addc	%l7,%l1,%l3
	andn	%l4,0x663,%l5
	jmpl	%o7,%g0
	fcmps	%fcc1,%f0 ,%f4 
p0_far_2_ho:
	jmpl	%o7,%g0
	mulx	%l4,0xfcd,%l6
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far2_b2b_h:
	or	%l5,0x29a,%l1
	fcmps	%fcc3,%f21,%f25
	jmpl	%o7,%g0
	fmuls	%f26,%f18,%f20
far2_b2b_l:
	or	%l1,-0x7d6,%l6
	addc	%l0,%l2,%l3
	jmpl	%o7,%g0
	and	%l5,%l2,%l3
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
	sub	%l4,%l6,%l0
	orn	%l1,-0x07e,%l5
	mulx	%l5,%l0,%l6
	andn	%l2,-0xf01,%l7
	jmpl	%o7,%g0
	fsubs	%f4 ,%f10,%f6 
p0_far_3_he:
	udivx	%l7,%l2,%l4
	and	%l0,%l1,%l2
	smul	%l6,0x172,%l3
	xor	%l1,0xc6c,%l2
	jmpl	%o7,%g0
	xor	%l6,0xffd,%l5
p0_far_3_lo:
	sub	%l4,%l6,%l0
	orn	%l1,-0x07e,%l5
	mulx	%l5,%l0,%l6
	andn	%l2,-0xf01,%l7
	jmpl	%o7,%g0
	fsubs	%f4 ,%f10,%f6 
p0_far_3_ho:
	udivx	%l7,%l2,%l4
	and	%l0,%l1,%l2
	smul	%l6,0x172,%l3
	xor	%l1,0xc6c,%l2
	jmpl	%o7,%g0
	xor	%l6,0xffd,%l5
far3_b2b_h:
	mulx	%l2,0x097,%l2
	fsqrts	%f22,%f16
	jmpl	%o7,%g0
	orn	%l7,0xcdb,%l3
far3_b2b_l:
	fsqrts	%f12,%f1 
	fmuls	%f7 ,%f10,%f4 
	jmpl	%o7,%g0
	fdivs	%f10,%f6 ,%f3 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	fdivs	%f9 ,%f2 ,%f5 
	xor	%l4,0x3a6,%l6
	fadds	%f7 ,%f15,%f3 
	mulx	%l7,-0x170,%l1
	orn	%l0,-0xf6a,%l7
	fmuls	%f8 ,%f12,%f7 
	jmpl	%g6+8,%g0
	fmuls	%f3 ,%f3 ,%f8 
p0_call_0_le:
	mulx	%l1,%l2,%l5
	add	%l6,%l1,%l6
	udivx	%l7,0xb9b,%l1
	smul	%l3,-0xbf6,%l0
	retl
	andn	%l5,0x722,%l1
p0_jmpl_0_lo:
	fdivs	%f9 ,%f2 ,%f5 
	xor	%l4,0x3a6,%l6
	fadds	%f7 ,%f15,%f3 
	mulx	%l7,-0x170,%l1
	orn	%l0,-0xf6a,%l7
	fmuls	%f8 ,%f12,%f7 
	jmpl	%g6+8,%g0
	fmuls	%f3 ,%f3 ,%f8 
p0_call_0_lo:
	mulx	%l1,%l2,%l5
	add	%l6,%l1,%l6
	udivx	%l7,0xb9b,%l1
	smul	%l3,-0xbf6,%l0
	retl
	andn	%l5,0x722,%l1
p0_jmpl_0_he:
	sdivx	%l2,0x4c4,%l6
	jmpl	%g6+8,%g0
	sdivx	%l4,%l3,%l2
p0_call_0_he:
	ldstub	[%i6+0x036],%l5		! Mem[0000000010181436]
	fcmps	%fcc1,%f16,%f27
	fsubs	%f19,%f27,%f28
	stb	%l2,[%o1+0x000]		! Mem[0000000020800000]
	and	%l1,%l4,%l0
	fdivs	%f24,%f28,%f23
	retl
	or	%l7,%l0,%l5
p0_jmpl_0_ho:
	sdivx	%l2,0x4c4,%l6
	jmpl	%g6+8,%g0
	sdivx	%l4,%l3,%l2
p0_call_0_ho:
	ldstub	[%o6+0x036],%l5		! Mem[0000000010181436]
	fcmps	%fcc1,%f16,%f27
	fsubs	%f19,%f27,%f28
	stb	%l2,[%i1+0x000]		! Mem[0000000020800000]
	and	%l1,%l4,%l0
	fdivs	%f24,%f28,%f23
	retl
	or	%l7,%l0,%l5
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	jmpl	%g6+8,%g0
	add	%l6,-0x9a8,%l1
p0_call_1_le:
	retl
	fadds	%f10,%f7 ,%f14
p0_jmpl_1_lo:
	jmpl	%g6+8,%g0
	add	%l6,-0x9a8,%l1
p0_call_1_lo:
	retl
	fadds	%f10,%f7 ,%f14
p0_jmpl_1_he:
	jmpl	%g6+8,%g0
	sdivx	%l2,0x399,%l3
p0_call_1_he:
	fitos	%f19,%f25
	xnor	%l3,0x045,%l3
	orn	%l0,0xf7a,%l7
	retl
	xnor	%l4,-0x80f,%l2
p0_jmpl_1_ho:
	jmpl	%g6+8,%g0
	sdivx	%l2,0x399,%l3
p0_call_1_ho:
	fitos	%f19,%f25
	xnor	%l3,0x045,%l3
	orn	%l0,0xf7a,%l7
	retl
	xnor	%l4,-0x80f,%l2
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	fadds	%f9 ,%f13,%f5 
	xor	%l3,%l7,%l5
	fdivs	%f2 ,%f4 ,%f5 
	fcmps	%fcc3,%f12,%f8 
	fsubs	%f6 ,%f8 ,%f6 
	andn	%l7,0xc3a,%l2
	jmpl	%g6+8,%g0
	fadds	%f0 ,%f8 ,%f13
p0_call_2_le:
	and	%l6,%l6,%l1
	retl
	andn	%l3,%l6,%l4
p0_jmpl_2_lo:
	fadds	%f9 ,%f13,%f5 
	xor	%l3,%l7,%l5
	fdivs	%f2 ,%f4 ,%f5 
	fcmps	%fcc3,%f12,%f8 
	fsubs	%f6 ,%f8 ,%f6 
	andn	%l7,0xc3a,%l2
	jmpl	%g6+8,%g0
	fadds	%f0 ,%f8 ,%f13
p0_call_2_lo:
	and	%l6,%l6,%l1
	retl
	andn	%l3,%l6,%l4
p0_jmpl_2_he:
	xnor	%l7,-0xd82,%l0
	orn	%l0,%l4,%l7
	and	%l5,%l1,%l0
	jmpl	%g6+8,%g0
	smul	%l6,%l4,%l7
p0_call_2_he:
	retl
	andn	%l1,%l2,%l7
p0_jmpl_2_ho:
	xnor	%l7,-0xd82,%l0
	orn	%l0,%l4,%l7
	and	%l5,%l1,%l0
	jmpl	%g6+8,%g0
	smul	%l6,%l4,%l7
p0_call_2_ho:
	retl
	andn	%l1,%l2,%l7
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	addc	%l2,%l4,%l6
	orn	%l6,%l0,%l7
	orn	%l2,-0xa87,%l2
	sth	%l7,[%i1+0x000]		! Mem[0000000010041400]
	mulx	%l7,%l7,%l6
	ldd	[%i0+0x028],%l2		! Mem[0000000010001428]
	jmpl	%g6+8,%g0
	sub	%l3,-0xf7a,%l6
p0_call_3_le:
	andn	%l2,%l7,%l7
	retl
	fsqrts	%f7 ,%f13
p0_jmpl_3_lo:
	addc	%l2,%l4,%l6
	orn	%l6,%l0,%l7
	orn	%l2,-0xa87,%l2
	sth	%l7,[%o1+0x000]		! Mem[0000000010041400]
	mulx	%l7,%l7,%l6
	ldd	[%o0+0x028],%l2		! Mem[0000000010001428]
	jmpl	%g6+8,%g0
	sub	%l3,-0xf7a,%l6
p0_call_3_lo:
	andn	%l2,%l7,%l7
	retl
	fsqrts	%f7 ,%f13
p0_jmpl_3_he:
	jmpl	%g6+8,%g0
	andn	%l4,%l4,%l3
p0_call_3_he:
	mulx	%l2,%l7,%l7
	stw	%l2,[%i3+0x02c]		! Mem[00000000100c142c]
	mulx	%l0,-0xff9,%l1
	retl
	udivx	%l1,%l3,%l0
p0_jmpl_3_ho:
	jmpl	%g6+8,%g0
	andn	%l4,%l4,%l3
p0_call_3_ho:
	mulx	%l2,%l7,%l7
	stw	%l2,[%o3+0x02c]		! Mem[00000000100c142c]
	mulx	%l0,-0xff9,%l1
	retl
	udivx	%l1,%l3,%l0
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
	.word	0x4161ff66,0xff58454e		! Init value for %l0
	.word	0xab432e2b,0xf94a10f9		! Init value for %l1
	.word	0x6a1840dc,0x0d3ba8b4		! Init value for %l2
	.word	0x645aa513,0xf0208f7f		! Init value for %l3
	.word	0x460e1bab,0xed10d85a		! Init value for %l4
	.word	0x179dac3a,0x53642645		! Init value for %l5
	.word	0x17ce4438,0xe5dcac40		! Init value for %l6
	.word	0x5efa2d3e,0xbde22d4b		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x5d2e58a0,0x03f69231		! Init value for %f0 
	.word	0x51f536de,0x6ae0f8b7		! Init value for %f2 
	.word	0x7ac7378c,0x4589b1ed		! Init value for %f4 
	.word	0x06a2d22a,0x5144a753		! Init value for %f6 
	.word	0x4ccc5a38,0x5b3aae69		! Init value for %f8 
	.word	0x0105df36,0x0f55e8af		! Init value for %f10
	.word	0x378e0ca4,0x4f7923a5		! Init value for %f12
	.word	0x255e0a02,0x229a38cb		! Init value for %f14
	.word	0x4ede5ad0,0x62176da1		! Init value for %f16
	.word	0x5b0abe8e,0x685fd3a7		! Init value for %f18
	.word	0x72bd10bc,0x56c6a85d		! Init value for %f20
	.word	0x639728da,0x4119b543		! Init value for %f22
	.word	0x1bc3ba68,0x5c52afd9		! Init value for %f24
	.word	0x6f8634e6,0x627b999f		! Init value for %f26
	.word	0x6351a3d4,0x689e2015		! Init value for %f28
	.word	0x5cde8eb2,0x1455fcbb		! Init value for %f30
	.word	0x1377d900,0x255e5511		! Init value for %f32
	.word	0x4b76a23e,0x54321a97		! Init value for %f34
	.word	0x4aa525ec,0x49976acd		! Init value for %f36
	.word	0x73009b8a,0x1badef33		! Init value for %f38
	.word	0x7f121698,0x7bd83d49		! Init value for %f40
	.word	0x66d66696,0x4598368f		! Init value for %f42
	.word	0x6decf704,0x19366885		! Init value for %f44
	.word	0x3385af62,0x4dcc6cab		! Init value for %f46
	.word	0x4245d330,0x7d0a4881
	.word	0x021be1ee,0x67cecd87
	.word	0x7fba771c,0x256af93d
	.word	0x2d322a3a,0x28285523
	.word	0x7ce26ec8,0x506a56b9
	.word	0x73b97446,0x3c82bf7f
	.word	0x797b0634,0x6e10fcf5
	.word	0x35866c12,0x6e84889b
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
	.word	0x89102e88,0x11ffd444		! %l0
	.word	0xa2a196f3,0x4dc0260f		! %l1
	.word	0xff000000,0x73c2d987		! %l2
	.word	0x00000000,0x00000000		! %l3
	.word	0xffffffff,0xffffff00		! %l4
	.word	0x00000000,0x00000000		! %l5
	.word	0xffffffff,0xffffffff		! %l6
	.word	0x00000000,0x00000000		! %l7
p0_expected_fp_regs:
	.word	0x00000000,0x0000000d		! %f0
	.word	0xff000000,0x51537462		! %f2
	.word	0xd77064e4,0x00000000		! %f4
	.word	0x0000ffff,0x000000ff		! %f6
	.word	0x00000000,0xff000000		! %f8
	.word	0x97ff1571,0x00000000		! %f10
	.word	0x000000ff,0xd099dfcc		! %f12
	.word	0x56e24ef2,0x00000000		! %f14
	.word	0xccdf99d0,0x00003192		! %f16
	.word	0x0d1d0000,0xffffffff		! %f18
	.word	0x00000000,0x00003746		! %f20
	.word	0x33848245,0x0b769661		! %f22
	.word	0x00000000,0x0000ff00		! %f24
	.word	0x2e0a5a36,0x0000ffff		! %f26
	.word	0x00000000,0xffff0000		! %f28
	.word	0x97ff1571,0x00000000		! %f30
	.word	0x00000028,0x00000a20		! %fsr
p0_local0_expect:
	.word	0x0000000d,0xffffffff,0xff000000,0x00000000 ! PA = 0000000010001400
	.word	0xff000000,0x00000000,0x00000000,0xff000000 ! PA = 0000000010001410
	.word	0x00000000,0xd099df00,0x00000000,0x0b769661 ! PA = 0000000010001420
	.word	0x0000b400,0x5f055725,0xffffff00,0xff000000 ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0x00df99d0,0xffffffff,0x0d1d0000,0xffffffff ! PA = 0000000030001400
	.word	0xff000000,0x00000000,0x7f4a8fba,0x3a21b4a3 ! PA = 0000000030001410
	.word	0x7220cc52,0x000000ff,0xedb18945,0x2f3ecf6e ! PA = 0000000030001420
	.word	0x8c390000,0x92310000,0x7fff20f0,0x374627da ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0xbcc047ce,0xde4a233f,0x01c2f5f2,0x22f7932b
	.word	0x445a8636,0x5e4f3577,0x4a0fd19a,0xc622f523
	.word	0x5302b91e,0xbd5cd52f,0x3fb465c2,0xa2b5b09b
	.word	0xa6338886,0x1e51fa67,0x3e3a9a6a,0x5af47d93
p0_local1_expect:
	.word	0x00000000,0x53266b59,0x00000000,0x00df99d0 ! PA = 0000000010041400
	.word	0x00000000,0x000000ff,0x1b4f5570,0x000000ff ! PA = 0000000010041410
	.word	0x3100ffff,0x596b2653,0x286b011c,0xff001a27 ! PA = 0000000010041420
	.word	0xffffffff,0x33848245,0x00000000,0x0000007f ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0xffdf99d0,0x56e24ef2,0xffff0000,0x365a0a2e ! PA = 0000000030041400
	.word	0xff000000,0x00003746,0x33848245,0x0b769661 ! PA = 0000000030041410
	.word	0x00000000,0x0000ff00,0x2e0a5a36,0x0000ffff ! PA = 0000000030041420
	.word	0x0d1d0000,0xd099df00,0x0000000d,0x374627da ! PA = 0000000030041430
p0_local2_expect:
	.word	0x00000000,0x0000ff00,0x97ff1571,0x00000000 ! PA = 0000000010081400
	.word	0xff000000,0x000000ff,0x1b5d5d2a,0x22822653 ! PA = 0000000010081410
	.word	0x000000ff,0x000000ff,0xedb18945,0x2f3ecf6e ! PA = 0000000010081420
	.word	0x00005400,0x0000ffff,0x7dcec331,0xfff79fa4 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x3746fd7c,0x00000000,0x1b008fba,0x00000000 ! PA = 0000000030081400
	.word	0x00000000,0xe46470d7,0x376dce5a,0x41f054c3 ! PA = 0000000030081410
	.word	0x72562be8,0x53266b59,0x113fd266,0x6b6e511f ! PA = 0000000030081420
	.word	0x6d20cd54,0x7468b395,0x7f8ca432,0x3a214c3b ! PA = 0000000030081430
p0_local3_expect:
	.word	0x00000000,0x00000000,0x000000ff,0xff000000 ! PA = 00000000100c1400
	.word	0x00000d00,0x000000ff,0x00000000,0x1b4fff70 ! PA = 00000000100c1410
	.word	0xffe8677f,0x44f79fa4,0xdfcced6f,0xffffff00 ! PA = 00000000100c1420
	.word	0xff1dffff,0x0000a20d,0x00000000,0x000000ff ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0x3746fd7c,0x00000000,0x00000000,0x1307b513 ! PA = 00000000300c1400
	.word	0x000000ff,0x2a5d5d1b,0x04b3c11a,0x4f27c483 ! PA = 00000000300c1410
	.word	0x000000ff,0x00000000,0x97ff1571,0x00000000 ! PA = 00000000300c1420
	.word	0xff000214,0x7cfd4637,0x56e24ef2,0x7115ff97 ! PA = 00000000300c1430
p0_local4_expect:
	.word	0x00000000,0x33008245,0x00000000,0x000000cc ! PA = 0000000010101400
	.word	0x0d000000,0x00000000,0x0000ffff,0x4f27c483 ! PA = 0000000010101410
	.word	0x00000000,0xff000000,0x97ff1571,0x00000000 ! PA = 0000000010101420
	.word	0x3746fd00,0x7cfd4637,0x56e24ef2,0x00000000 ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0x0d000000,0x0d000000,0x00000000,0x0000ff00 ! PA = 0000000030101400
	.word	0x0000ffff,0xff000000,0x83c4274f,0x1ac1b304 ! PA = 0000000030101410
	.word	0xff000000,0x0000ffff,0x00000000,0x7115ff97 ! PA = 0000000030101420
	.word	0x3746fd7c,0x140200ff,0x97ff1571,0xf24ee256 ! PA = 0000000030101430
p0_local5_expect:
	.word	0x0000ffff,0xffff8fba,0xff000000,0x37467dbd ! PA = 0000000010141400
	.word	0x87d9c273,0x000000ff,0xd099df00,0x00000000 ! PA = 0000000010141410
	.word	0xf92fea34,0x08592560,0x7ac7378c,0x4589b1ed ! PA = 0000000010141420
	.word	0x00003192,0x374627da,0x08592560,0x52cc2072 ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0x00000000,0x00000000,0xff000000,0xbd7d4637 ! PA = 0000000030141400
	.word	0x00000000,0x00000000,0x04b3c11a,0x4f27c483 ! PA = 0000000030141410
	.word	0x0000ffff,0xff000000,0x97ff1571,0x00000000 ! PA = 0000000030141420
	.word	0xff000214,0x7cfd4637,0x56e24ef2,0x7115ff97 ! PA = 0000000030141430
p0_local6_expect:
	.word	0x000000ff,0xd099dfcc,0xffffffff,0x00001d0d ! PA = 0000000010181400
	.word	0x1b5d0000,0x0000ba2c,0x6196760b,0x45828433 ! PA = 0000000010181410
	.word	0x00ff0000,0x00000000,0xffff0000,0x00000000 ! PA = 0000000010181420
	.word	0x00df99d0,0x00001d0d,0xda274637,0x0d000000 ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x13b50713,0xffff0000,0xff000214,0x140200ff ! PA = 0000000030181400
	.word	0x0d000000,0x00ff0000,0xfec88114,0xff000000 ! PA = 0000000030181410
	.word	0x71f3b304,0x5c8d2639,0x46000000,0xffffffff ! PA = 0000000030181420
	.word	0xffff0000,0x000000ff,0xffffff97,0xffffffff ! PA = 0000000030181430
share0_expect:
	.word	0x00ff9c00,0x2dd32c11,0x4ea5bd3e,0x0ff7e997 ! PA = 00000000201c0000
	.word	0x68e658ec,0x2df7f1cd,0x535ea68a,0x2dd0ee33 ! PA = 00000000201c0010
	.word	0x163db998,0x18337449,0x3ad66196,0x46df658f ! PA = 00000000201c0020
	.word	0x0b4e0a04,0x7acb4f85,0x000a9a62,0x45aecbab ! PA = 00000000201c0030
share1_expect:
	.word	0x00005630,0x6947df81,0x4578bcee,0x4b735c87 ! PA = 0000000020800000
	.word	0x0c276a1c,0x50f0403d,0x5a29f53a,0x09661423 ! PA = 0000000020800010
	.word	0x5705d1c8,0x46064db9,0x5c7f2f46,0x28e0ae7f ! PA = 0000000020800020
	.word	0x585fd934,0x25c2a3f5,0x66bd1712,0x7e39a79b ! PA = 0000000020800030
	.word	0xd7548c60,0x29109ef1,0x7158189e,0x02603b77 ! PA = 0000000020800040
	.word	0x1d40b74c,0x440a5aad,0x57005fea,0x4f386613 ! PA = 0000000020800050
	.word	0x66eae5f8,0x6e34b329,0x266dd8f6,0x1ab6e36f ! PA = 0000000020800060
	.word	0x01ef6464,0x2f7b4465,0x2dec2fc2,0x6cbd2f8b ! PA = 0000000020800070
share2_expect:
	.word	0xff003e90,0x0dec6a61,0x6ca6d04e,0x0bb58667 ! PA = 00000000211c0000
	.word	0x50ed407c,0x3835411d,0x55b4e69a,0x5beee403 ! PA = 00000000211c0010
	.word	0x1b97f628,0x08dda499,0x10e55ea6,0x2db9045f ! PA = 00000000211c0020
	.word	0x1197ab94,0x3e4430d5,0x254ae472,0x3640637b ! PA = 00000000211c0030
share3_expect:
	.word	0x2b696cc0,0x035a41d1,0x3987e3fe,0x2f2a3d57 ! PA = 0000000021800000
	.word	0x11a805ac,0x251ff38d,0x55da894a,0x58f08df3 ! PA = 0000000021800010
	.word	0x6c780258,0x10e02209,0x53e8c056,0x5bfe114f ! PA = 0000000021800020
	.word	0x5eb3aec4,0x772c6945,0x684c3522,0x448a436b ! PA = 0000000021800030
	.word	0xffd716f0,0x2f992541,0x71de53ae,0x15356047 ! PA = 0000000021800040
	.word	0x2fac06dc,0x393971fd,0x7ac447fa,0x2c6463e3 ! PA = 0000000021800050
	.word	0x22b60a88,0x73db2b79,0x173afe06,0x785d0a3f ! PA = 0000000021800060
	.word	0x3e5e6df4,0x6e02edb5,0x0e2321d2,0x3621cf5b ! PA = 0000000021800070
	.word	0x00003d20,0x63a814b1,0x774d1f5e,0x370def37 ! PA = 0000000021800080
	.word	0x10f4440c,0x49b0bc6d,0x3b8522aa,0x693165d3 ! PA = 0000000021800090
	.word	0x093d0eb8,0x022dc0e9,0x225f17b6,0x1e6cef2f ! PA = 00000000218000a0
	.word	0x3372e924,0x1556be25,0x59c2aa82,0x4e4e074b ! PA = 00000000218000b0
	.word	0xff4fdf50,0x0b461021,0x2337470e,0x4eaaea27 ! PA = 00000000218000c0
	.word	0x613bbd3c,0x4274d2dd,0x12f0195a,0x3efe93c3 ! PA = 00000000218000d0
	.word	0x1cb80ee8,0x5ef6e259,0x0c980d66,0x2284c01f ! PA = 00000000218000e0
	.word	0x1e8c2054,0x2e76da95,0x69ddcf32,0x6515eb3b ! PA = 00000000218000f0
	.word	0x1ffffd80,0x1cf21791,0x76bfcabe,0x46c35117 ! PA = 0000000021800100
	.word	0x41fd726c,0x1634b54d,0x2f982c0a,0x6a32edb3 ! PA = 0000000021800110
	.word	0x3b920b18,0x70158fc9,0x6ce8df16,0x01bb7d0f ! PA = 0000000021800120
	.word	0x6e051384,0x39724305,0x68e78fe2,0x57407b2b ! PA = 0000000021800130
	.word	0x000097b0,0x09eb2b01,0x4ac9aa6e,0x2ace2407 ! PA = 0000000021800140
	.word	0x7a74639c,0x2e5f63bd,0x23d05aba,0x23f573a3 ! PA = 0000000021800150
	.word	0x55f60348,0x4e28c939,0x0a148cc6,0x51e825ff ! PA = 0000000021800160
	.word	0x4df8c2b4,0x6517f775,0x3d12ec92,0x7654b71b ! PA = 0000000021800170
	.word	0xff33ade0,0x2e304a71,0x7ff7e61e,0x170262f7 ! PA = 0000000021800180
	.word	0x279b90cc,0x5b23de2d,0x15aba56a,0x122d2593 ! PA = 0000000021800190
	.word	0x1dcef778,0x348f8ea9,0x0a9e1676,0x31a1baef ! PA = 00000000218001a0
	.word	0x58422de4,0x7ef6f7e5,0x3852e542,0x78999f0b ! PA = 00000000218001b0
	.word	0x50004010,0x408075e1,0x2ead7dce,0x28570de7 ! PA = 00000000218001c0
	.word	0x6c2df9fc,0x4371249d,0x6efd0c1a,0x37810383 ! PA = 00000000218001d0
	.word	0x36c7e7a8,0x7168e019,0x24c87c26,0x383f3bdf ! PA = 00000000218001e0
	.word	0x447c5514,0x635e4455,0x485a79f2,0x691632fb ! PA = 00000000218001f0
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
	.word	0x1c534960,0x031a47f1,0x659d7d9e,0x6d6cec77	! PA = 0000000010001400
	.word	0x64f8044c,0x587053ad,0x1e3ed4ea,0x1a6fe713	! PA = 0000000010001410
	.word	0x5d1fc2f8,0x1367fc29,0x02b25df6,0x53d2346f	! PA = 0000000010001420
	.word	0x15d6d164,0x12bcdd65,0x5ad3c4c2,0x7ac5508b	! PA = 0000000010001430
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
	.word	0x3c6b3b90,0x2c4d5361,0x145e754e,0x30037767	! PA = 0000000030001400
	.word	0x5318cd7c,0x27967a1d,0x15f99b9a,0x032ba503	! PA = 0000000030001410
	.word	0x59751328,0x10f02d99,0x100423a6,0x10dd955f	! PA = 0000000030001420
	.word	0x709b5894,0x418909d5,0x3720b972,0x4b95c47b	! PA = 0000000030001430
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
	.word	0x4718a9c0,0x38226ad1,0x1481c8fe,0x6b496e57	! PA = 0000000010041400
	.word	0x5897d2ac,0x1e8c6c8d,0x57f57e4a,0x3fc28ef3	! PA = 0000000010041410
	.word	0x4d4d5f58,0x17e1eb09,0x57b1c556,0x61bbe24f	! PA = 0000000010041420
	.word	0x05239bc4,0x33848245,0x29e04a22,0x7ebce46b	! PA = 0000000010041430
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
	.word	0x1aa693f0,0x20d88e41,0x03ea78ae,0x3bb5d147	! PA = 0000000030041400
	.word	0x69b013dc,0x7fc12afd,0x4b857cfa,0x6a5ba4e3	! PA = 0000000030041410
	.word	0x65d3a788,0x69dc3479,0x057e4306,0x0d441b3f	! PA = 0000000030041420
	.word	0x4c8a9af4,0x107e46b5,0x0e4576d2,0x66c1b05b	! PA = 0000000030041430
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
	.word	0x7f1ffa20,0x0b6ebdb1,0x483b845e,0x0e7fa037	! PA = 0000000010081400
	.word	0x105c910c,0x3463b56d,0x2bbc97aa,0x49dde6d3	! PA = 0000000010081410
	.word	0x51f2ebb8,0x2b3e09e9,0x64ec9cb6,0x230d402f	! PA = 0000000010081420
	.word	0x6dab5624,0x5f055725,0x6b433f82,0x7aeb284b	! PA = 0000000010081430
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
	.word	0x564fdc50,0x37a3f921,0x3ed7ec0e,0x119ddb27	! PA = 0000000030081400
	.word	0x1c584a3c,0x3c630bdd,0x376dce5a,0x41f054c3	! PA = 0000000030081410
	.word	0x72562be8,0x53266b59,0x113fd266,0x6b6e511f	! PA = 0000000030081420
	.word	0x6d20cd54,0x7468b395,0x238ca432,0x47404c3b	! PA = 0000000030081430
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
	.word	0x4bc13a80,0x6ff74091,0x6ce2afbe,0x23c78217	! PA = 00000000100c1400
	.word	0x531e3f6c,0x1e6e2e4d,0x612c210a,0x42f9eeb3	! PA = 00000000100c1410
	.word	0x09686818,0x1b7458c9,0x257ae416,0x577e4e0f	! PA = 00000000100c1420
	.word	0x5d460084,0x64b75c05,0x2594a4e2,0x5c881c2b	! PA = 00000000100c1430
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
	.word	0x04bf14b0,0x79a79401,0x2f3ecf6e,0x44739507	! PA = 00000000300c1400
	.word	0x1fe9709c,0x57f41cbd,0x7f4a8fba,0x3a21b4a3	! PA = 00000000300c1410
	.word	0x6b54a048,0x70c6d239,0x6c60d1c6,0x711436ff	! PA = 00000000300c1420
	.word	0x0e35efb4,0x72c05075,0x1b8e4192,0x4049981b	! PA = 00000000300c1430
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
	.word	0x50546ae0,0x04b3f371,0x6a8f4b1e,0x03d913f7	! PA = 0000000010101400
	.word	0x43b4ddcc,0x4d23d72d,0x7bdc1a6a,0x014ea693	! PA = 0000000010101410
	.word	0x2e05d478,0x627cd7a9,0x10749b76,0x4ac70bef	! PA = 0000000010101420
	.word	0x3dcb9ae4,0x001290e5,0x1b6c7a42,0x5ccbc00b	! PA = 0000000010101430
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
	.word	0x574c3d10,0x1bdb5ee1,0x3b3722ce,0x72eefee7	! PA = 0000000030101400
	.word	0x053b86fc,0x38ec5d9d,0x04b3c11a,0x4f27c483	! PA = 0000000030101410
	.word	0x592704a8,0x12b56919,0x4bf94126,0x6fedccdf	! PA = 0000000030101420
	.word	0x47a20214,0x7cfd1d55,0x56e24ef2,0x711593fb	! PA = 0000000030101430
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
	.word	0x4c318b40,0x149cd651,0x2559567e,0x136c55d7	! PA = 0000000010141400
	.word	0x60f86c2c,0x1cfcb00d,0x3b6483ca,0x27140e73	! PA = 0000000010141410
	.word	0x162330d8,0x264f8689,0x18f1c2d6,0x549f79cf	! PA = 0000000010141420
	.word	0x55142544,0x588ef5c5,0x4b62bfa2,0x00ee13eb	! PA = 0000000010141430
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
	.word	0x1b4f5570,0x7f3759c1,0x44d8e62e,0x47c818c7	! PA = 0000000030141400
	.word	0x39268d5c,0x31c3ce7d,0x6541627a,0x493a8463	! PA = 0000000030141410
	.word	0x60255908,0x34ea2ff9,0x61212086,0x45b312bf	! PA = 0000000030141420
	.word	0x0d3d0474,0x70971a35,0x7220cc52,0x44dc3fdb	! PA = 0000000030141430
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
	.word	0x1ab09ba0,0x16a9e931,0x7d58d1de,0x433947b7	! PA = 0000000010181400
	.word	0x05c0ea8c,0x5670b8ed,0x1b5d5d2a,0x22822653	! PA = 0000000010181410
	.word	0x34187d38,0x38e46569,0x2e0a5a36,0x58bf97af	! PA = 0000000010181420
	.word	0x44f79fa4,0x01a48aa5,0x700f7502,0x1a2717cb	! PA = 0000000010181430
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
	.word	0x3a205dd0,0x30b384a1,0x2a3c198e,0x79b6e2a7	! PA = 0000000030181400
	.word	0x048283bc,0x00f26f5d,0x7a8b73da,0x3c91f443	! PA = 0000000030181410
	.word	0x40a79d68,0x7f5d26d9,0x58f06fe6,0x5c1c089f	! PA = 0000000030181420
	.word	0x2edef6d4,0x17064715,0x45e1b9b2,0x72d59bbb	! PA = 0000000030181430
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
	.word	0x33299c00,0x2dd32c11,0x4ea5bd3e,0x0ff7e997	! PA = 00000000201c0000
	.word	0x68e658ec,0x2df7f1cd,0x535ea68a,0x2dd0ee33	! PA = 00000000201c0010
	.word	0x163db998,0x18337449,0x3ad66196,0x46df658f	! PA = 00000000201c0020
	.word	0x0b4e0a04,0x7acb4f85,0x000a9a62,0x45aecbab	! PA = 00000000201c0030
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
	.word	0x39175630,0x6947df81,0x4578bcee,0x4b735c87	! PA = 0000000020800000
	.word	0x0c276a1c,0x50f0403d,0x5a29f53a,0x09661423	! PA = 0000000020800010
	.word	0x5705d1c8,0x46064db9,0x5c7f2f46,0x28e0ae7f	! PA = 0000000020800020
	.word	0x585fd934,0x25c2a3f5,0x66bd1712,0x7e39a79b	! PA = 0000000020800030
	.word	0x28f48c60,0x29109ef1,0x7158189e,0x02603b77	! PA = 0000000020800040
	.word	0x1d40b74c,0x440a5aad,0x57005fea,0x4f386613	! PA = 0000000020800050
	.word	0x66eae5f8,0x6e34b329,0x266dd8f6,0x1ab6e36f	! PA = 0000000020800060
	.word	0x01ef6464,0x2f7b4465,0x2dec2fc2,0x6cbd2f8b	! PA = 0000000020800070
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
	.word	0x398c3e90,0x0dec6a61,0x6ca6d04e,0x0bb58667	! PA = 00000000211c0000
	.word	0x50ed407c,0x3835411d,0x55b4e69a,0x5beee403	! PA = 00000000211c0010
	.word	0x1b97f628,0x08dda499,0x10e55ea6,0x2db9045f	! PA = 00000000211c0020
	.word	0x1197ab94,0x3e4430d5,0x254ae472,0x3640637b	! PA = 00000000211c0030
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
	.word	0x2b696cc0,0x035a41d1,0x3987e3fe,0x2f2a3d57	! PA = 0000000021800000
	.word	0x11a805ac,0x251ff38d,0x55da894a,0x58f08df3	! PA = 0000000021800010
	.word	0x6c780258,0x10e02209,0x53e8c056,0x5bfe114f	! PA = 0000000021800020
	.word	0x5eb3aec4,0x772c6945,0x684c3522,0x448a436b	! PA = 0000000021800030
	.word	0x78d716f0,0x2f992541,0x71de53ae,0x15356047	! PA = 0000000021800040
	.word	0x2fac06dc,0x393971fd,0x7ac447fa,0x2c6463e3	! PA = 0000000021800050
	.word	0x22b60a88,0x73db2b79,0x173afe06,0x785d0a3f	! PA = 0000000021800060
	.word	0x3e5e6df4,0x6e02edb5,0x0e2321d2,0x3621cf5b	! PA = 0000000021800070
	.word	0x05e03d20,0x63a814b1,0x774d1f5e,0x370def37	! PA = 0000000021800080
	.word	0x10f4440c,0x49b0bc6d,0x3b8522aa,0x693165d3	! PA = 0000000021800090
	.word	0x093d0eb8,0x022dc0e9,0x225f17b6,0x1e6cef2f	! PA = 00000000218000a0
	.word	0x3372e924,0x1556be25,0x59c2aa82,0x4e4e074b	! PA = 00000000218000b0
	.word	0x504fdf50,0x0b461021,0x2337470e,0x4eaaea27	! PA = 00000000218000c0
	.word	0x613bbd3c,0x4274d2dd,0x12f0195a,0x3efe93c3	! PA = 00000000218000d0
	.word	0x1cb80ee8,0x5ef6e259,0x0c980d66,0x2284c01f	! PA = 00000000218000e0
	.word	0x1e8c2054,0x2e76da95,0x69ddcf32,0x6515eb3b	! PA = 00000000218000f0
	.word	0x1fb0fd80,0x1cf21791,0x76bfcabe,0x46c35117	! PA = 0000000021800100
	.word	0x41fd726c,0x1634b54d,0x2f982c0a,0x6a32edb3	! PA = 0000000021800110
	.word	0x3b920b18,0x70158fc9,0x6ce8df16,0x01bb7d0f	! PA = 0000000021800120
	.word	0x6e051384,0x39724305,0x68e78fe2,0x57407b2b	! PA = 0000000021800130
	.word	0x354e97b0,0x09eb2b01,0x4ac9aa6e,0x2ace2407	! PA = 0000000021800140
	.word	0x7a74639c,0x2e5f63bd,0x23d05aba,0x23f573a3	! PA = 0000000021800150
	.word	0x55f60348,0x4e28c939,0x0a148cc6,0x51e825ff	! PA = 0000000021800160
	.word	0x4df8c2b4,0x6517f775,0x3d12ec92,0x7654b71b	! PA = 0000000021800170
	.word	0x7c33ade0,0x2e304a71,0x7ff7e61e,0x170262f7	! PA = 0000000021800180
	.word	0x279b90cc,0x5b23de2d,0x15aba56a,0x122d2593	! PA = 0000000021800190
	.word	0x1dcef778,0x348f8ea9,0x0a9e1676,0x31a1baef	! PA = 00000000218001a0
	.word	0x58422de4,0x7ef6f7e5,0x3852e542,0x78999f0b	! PA = 00000000218001b0
	.word	0x392b4010,0x408075e1,0x2ead7dce,0x28570de7	! PA = 00000000218001c0
	.word	0x6c2df9fc,0x4371249d,0x6efd0c1a,0x37810383	! PA = 00000000218001d0
	.word	0x36c7e7a8,0x7168e019,0x24c87c26,0x383f3bdf	! PA = 00000000218001e0
	.word	0x447c5514,0x635e4455,0x485a79f2,0x691632fb	! PA = 00000000218001f0
share3_end:
