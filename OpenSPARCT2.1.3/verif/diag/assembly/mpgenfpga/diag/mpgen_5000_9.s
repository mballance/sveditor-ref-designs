/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000_9.s
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
!	Seed = 327144526
!	Riesling can be on
!	1 Thread, 5000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_5000_9.s created on Mar 27, 2009 (14:45:26)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_5000_9 -p 1 -l 5000

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
!	%f0  = 7d94b7b5 1eca8581 89fbce34 14f1d541
!	%f4  = 57875909 266e5926 44f61ccf 7ab66d24
!	%f8  = 8fb266f3 e3096414 dc10062e 40cc3102
!	%f12 = 3c3fa217 d099a530 af3904e9 31bbcd7c
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 34502b85 1633d79f fcbd0f53 f38071e5
!	%f20 = 9492a8ca 88f2b688 1fa4e83c e7ce4dea
!	%f24 = c8360210 ad665e15 0087f722 af925539
!	%f28 = ebae2afa 19ce9f7b 811fa417 e8d89f23
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = b15589f6 6722abd5 292d31e2 e80550a5
!	%f36 = a7b56645 03fde505 87112a99 d05fdb11
!	%f40 = b635a4ce 29052da8 c65de21e a1a5e50a
!	%f44 = 69a8a56b 7c79989c ac77023e 9e77901e
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x269bacaf0000001c,%g7,%g1 ! GSR scale =  3, align = 4
	wr	%g1,%g0,%gsr		! GSR = 269bacaf0000001c
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000010081400] = 7ed0b1e3, %l5 = d3146983ea207428
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 000000007ed0b1e3
!	Mem[0000000030041408] = 711e6fb681ca25e9, %f28 = ebae2afa 19ce9f7b
	ldda	[%i1+%o4]0x81,%f28	! %f28 = 711e6fb6 81ca25e9
!	%l7 = 67bee32a639b131c, imm = 0000000000000c16, %l6 = 5948a2f5cadc27b2
	xnor	%l7,0xc16,%l6		! %l6 = 98411cd59c64e0f5
!	Mem[0000000030081400] = b9bd7bef, %l5 = 000000007ed0b1e3
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 000000ef000000ff
!	Mem[0000000010001410] = 444e043b, %l6 = 98411cd59c64e0f5
	swap	[%i0+%o5],%l6		! %l6 = 00000000444e043b
!	Mem[0000000010041408] = e3e7bd61, %l0 = b56b73fbd779b56d
	ldswa	[%i1+%o4]0x80,%l0	! %l0 = ffffffffe3e7bd61
!	%f0  = 7d94b7b5 1eca8581 89fbce34 14f1d541
!	%f4  = 57875909 266e5926 44f61ccf 7ab66d24
!	%f8  = 8fb266f3 e3096414 dc10062e 40cc3102
!	%f12 = 3c3fa217 d099a530 af3904e9 31bbcd7c
	stda	%f0,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%l0 = e3e7bd61, %l1 = c7dd0d92, Mem[0000000010181400] = ae75db09 f6063585
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = e3e7bd61 c7dd0d92
	membar	#Sync			! Added by membar checker (1)
!	Mem[00000000100c1408] = 0d82845d62b650dc, %l4 = a82d9b8c4290037a
	ldxa	[%i3+%o4]0x88,%l4	! %l4 = 0d82845d62b650dc
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_1:
!	%l0 = ffffffffe3e7bd61
	setx	0x0677d667c492c9dc,%g7,%l0 ! %l0 = 0677d667c492c9dc
!	%l1 = 4d1824aac7dd0d92
	setx	0x6b4da697e68d89c4,%g7,%l1 ! %l1 = 6b4da697e68d89c4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0677d667c492c9dc
	setx	0x96fb22e7c3aa1b9d,%g7,%l0 ! %l0 = 96fb22e7c3aa1b9d
!	%l1 = 6b4da697e68d89c4
	setx	0x19f39ca794e3ceee,%g7,%l1 ! %l1 = 19f39ca794e3ceee

p0_label_2:
!	%l4 = 0d82845d62b650dc, Mem[0000000020800040] = 30a42c25, %asi = 80
	stba	%l4,[%o1+0x040]%asi	! Mem[0000000020800040] = dca42c25
!	%l0 = c3aa1b9d, %l1 = 94e3ceee, Mem[0000000010101408] = 528d4c2d b9e8a602
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = c3aa1b9d 94e3ceee
!	%l6 = 444e043b, %l7 = 639b131c, Mem[0000000010081400] = ea207428 d2478422
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 444e043b 639b131c
!	Mem[00000000100c1408] = dc50b662, %l5 = 00000000000000ef
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 000000dc000000ff
!	Mem[0000000021800081] = 62f96f0b, %l4 = 0d82845d62b650dc
	ldstuba	[%o3+0x081]%asi,%l4	! %l4 = 000000f9000000ff
!	%l2 = ef51652ec95a4131, Mem[0000000030081408] = a6275650
	stha	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 41315650
!	%f16 = 34502b85 1633d79f, %l5 = 00000000000000dc
!	Mem[0000000030001438] = d3b06a67d116cfa4
	add	%i0,0x038,%g1
	stda	%f16,[%g1+%l5]ASI_PST8_S ! Mem[0000000030001438] = 34506a851633cfa4
!	Mem[0000000010041410] = 81afbcc5, %l4 = 00000000000000f9
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 0000000081afbcc5
!	%f17 = 1633d79f, %f6  = 44f61ccf, %f4  = 57875909 266e5926
	fsmuld	%f17,%f6 ,%f4 		! %f4  = 3b759cad f957b220
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ee06def8, %l4 = 0000000081afbcc5
	ldswa	[%i3+%o5]0x88,%l4	! %l4 = ffffffffee06def8

p0_label_3:
!	Mem[0000000030141408] = 8822f87a, %f10 = dc10062e
	lda	[%i5+%o4]0x89,%f10	! %f10 = 8822f87a
!	Mem[0000000030141408] = 54c544488822f87a, %f4  = 3b759cad f957b220
	ldda	[%i5+%o4]0x89,%f4 	! %f4  = 54c54448 8822f87a
!	Mem[0000000021800180] = 0385c5c1, %l7 = 67bee32a639b131c
	ldsh	[%o3+0x180],%l7		! %l7 = 0000000000000385
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 96fb22e7c3aa1b9d
	setx	0xbb415e5820d6455f,%g7,%l0 ! %l0 = bb415e5820d6455f
!	%l1 = 19f39ca794e3ceee
	setx	0xc6d3d70841681591,%g7,%l1 ! %l1 = c6d3d70841681591
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = bb415e5820d6455f
	setx	0xe5b31a47a67d3bd4,%g7,%l0 ! %l0 = e5b31a47a67d3bd4
!	%l1 = c6d3d70841681591
	setx	0xaec5f5a7c6453440,%g7,%l1 ! %l1 = aec5f5a7c6453440
!	Mem[0000000030081400] = b9bd7bff, %l0 = e5b31a47a67d3bd4
	lduba	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000000000ff, %l3 = 650300a28219ea07, %l5 = 00000000000000dc
	orn	%l0,%l3,%l5		! %l5 = 9afcff5d7de615ff
!	Mem[0000000010101410] = c69d265f, %l1 = aec5f5a7c6453440
	lduwa	[%i4+%o5]0x88,%l1	! %l1 = 00000000c69d265f
!	Mem[0000000030001400] = 3aea11c5, %f14 = af3904e9
	lda	[%i0+%g0]0x81,%f14	! %f14 = 3aea11c5
!	Mem[0000000010141410] = e388957ac9a380bd, %f30 = 811fa417 e8d89f23
	ldda	[%i5+%o5]0x88,%f30	! %f30 = e388957a c9a380bd
!	Starting 10 instruction Store Burst
!	%l2 = ef51652ec95a4131, Mem[0000000010181400] = e3e7bd61
	stha	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = e3e74131

p0_label_4:
!	%l7 = 0000000000000385, Mem[0000000010081400] = 3b044e44
	stwa	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000385
!	%l5 = 9afcff5d7de615ff, Mem[0000000030081408] = 50563141
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 7de615ff
!	%l6 = 444e043b, %l7 = 00000385, Mem[0000000010141408] = d78c3f91 4d468b6e
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 444e043b 00000385
!	Mem[0000000030141400] = a67e009a, %l7 = 0000000000000385
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 0000009a000000ff
!	Mem[0000000010001400] = ee50eb02, %l7 = 000000000000009a
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000ee50eb02
!	%l4 = ffffffffee06def8, Mem[0000000030101410] = b9eefa0a
	stba	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = f8eefa0a
!	%l2 = c95a4131, %l3 = 8219ea07, Mem[0000000030101400] = 287e03b3 4551d129
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = c95a4131 8219ea07
!	%f8  = 8fb266f3 e3096414, Mem[0000000010141400] = ef622205 0e51f237
	stda	%f8 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 8fb266f3 e3096414
!	Mem[0000000010001425] = a3e93e61, %l5 = 9afcff5d7de615ff
	ldstuba	[%i0+0x025]%asi,%l5	! %l5 = 000000e9000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = c3077f1a, %l6 = 00000000444e043b
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffffc307

p0_label_5:
!	Mem[00000000300c1400] = 8185ca1e, %l5 = 00000000000000e9
	ldswa	[%i3+%g0]0x81,%l5	! %l5 = ffffffff8185ca1e
!	Mem[0000000010001400] = 9a000000, %l4 = ffffffffee06def8
	lduha	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 00000000000000ff
	setx	0x724095b07f115da6,%g7,%l0 ! %l0 = 724095b07f115da6
!	%l1 = 00000000c69d265f
	setx	0xbf27f6683e1c6d83,%g7,%l1 ! %l1 = bf27f6683e1c6d83
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 724095b07f115da6
	setx	0x0df13cb83e2fb5c9,%g7,%l0 ! %l0 = 0df13cb83e2fb5c9
!	%l1 = bf27f6683e1c6d83
	setx	0x89e0e86fee5f6d1d,%g7,%l1 ! %l1 = 89e0e86fee5f6d1d
!	Mem[0000000030081400] = b9bd7bff, %l4 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141424] = 9fa21ded, %f26 = 0087f722
	ld	[%i5+0x024],%f26	! %f26 = 9fa21ded
!	Mem[0000000030181400] = 301fcf25, %l2 = ef51652ec95a4131
	ldswa	[%i6+%g0]0x89,%l2	! %l2 = 00000000301fcf25
!	Mem[0000000030001410] = d5638f6149c5581c, %l2 = 00000000301fcf25
	ldxa	[%i0+%o5]0x89,%l2	! %l2 = d5638f6149c5581c
!	Mem[0000000010181400] = 3141e7e3, %l0 = 0df13cb83e2fb5c9
	ldswa	[%i6+%g0]0x80,%l0	! %l0 = 000000003141e7e3
!	Mem[0000000030181400] = 53768d34301fcf25, %f16 = 34502b85 1633d79f
	ldda	[%i6+%g0]0x89,%f16	! %f16 = 53768d34 301fcf25
!	Starting 10 instruction Store Burst
!	%l5 = ffffffff8185ca1e, %l3 = 650300a28219ea07, %l1 = 89e0e86fee5f6d1d
	sub	%l5,%l3,%l1		! %l1 = 9afcff5cff6be017

p0_label_6:
!	Mem[00000000211c0000] = c3077f1a, %l2 = d5638f6149c5581c
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 000000c3000000ff
!	%l6 = ffffffffffffc307, Mem[00000000300c1400] = 8185ca1e
	stwa	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffc307
!	Mem[00000000300c1408] = 41d5f114, %l4 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 00000041000000ff
!	Mem[000000001000141a] = 4c818159, %l6 = ffffffffffffc307
	ldstuba	[%i0+0x01a]%asi,%l6	! %l6 = 00000081000000ff
!	%l0 = 3141e7e3, %l1 = ff6be017, Mem[0000000010081410] = 9ea039f2 5380f3bc
	stda	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 3141e7e3 ff6be017
!	Mem[0000000030101400] = 31415ac9, %l5 = ffffffff8185ca1e
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 0000000031415ac9
!	%l5 = 0000000031415ac9, Mem[0000000010181410] = dd193881
	stwa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 31415ac9
!	%l6 = 0000000000000081, Mem[0000000030181410] = a75026d1
	stha	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 008126d1
!	%f26 = 9fa21ded af925539, Mem[00000000100c1408] = ff50b662 5d84820d
	stda	%f26,[%i3+%o4]0x80	! Mem[00000000100c1408] = 9fa21ded af925539
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 49c5581c, %l3 = 650300a28219ea07
	ldsha	[%i0+%o5]0x89,%l3	! %l3 = 000000000000581c

p0_label_7:
!	%l4 = 0000000000000041, %l5 = 0000000031415ac9, %l2 = 00000000000000c3
	add	%l4,%l5,%l2		! %l2 = 0000000031415b0a
!	Mem[0000000010081410] = 17e06bff e3e74131, %l0 = 3141e7e3, %l1 = ff6be017
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 00000000e3e74131 0000000017e06bff
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000030081400] = ff7bbdb9 83e9def0 ff15e67d 85b62e5f
!	Mem[0000000030081410] = a73d0013 4019bc1b b2d0b9e9 77ed20db
!	Mem[0000000030081420] = 1b7f273a bbb5f751 7fb4e71f 3a206bd9
!	Mem[0000000030081430] = 4ad6903b d8ef1d65 38d11ad3 5b074475
	ldda	[%i2]ASI_BLK_S,%f0	! Block Load from 0000000030081400
!	Mem[00000000100c1408] = 9fa21ded, %l3 = 000000000000581c
	lduba	[%i3+%o4]0x80,%l3	! %l3 = 000000000000009f
!	Mem[0000000010101400] = 6dd546f692b0a59d, %l6 = 0000000000000081
	ldxa	[%i4+%g0]0x80,%l6	! %l6 = 6dd546f692b0a59d
!	%l5 = 0000000031415ac9, imm = 00000000000001e5, %l4 = 0000000000000041
	andn	%l5,0x1e5,%l4		! %l4 = 0000000031415a08
!	Mem[000000001004142c] = 60bf3f07, %f28 = 711e6fb6
	ld	[%i1+0x02c],%f28	! %f28 = 60bf3f07
!	Mem[0000000030141400] = a67e00ff, %f16 = 53768d34
	lda	[%i5+%g0]0x89,%f16	! %f16 = a67e00ff
!	Mem[00000000300c1410] = 26596e26, %l0 = 00000000e3e74131
	ldsha	[%i3+%o5]0x81,%l0	! %l0 = 0000000000002659
!	Starting 10 instruction Store Burst
!	%l6 = 6dd546f692b0a59d, Mem[0000000030041408] = b66f1e71
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = b66fa59d

p0_label_8:
!	%f0  = ff7bbdb9 83e9def0 ff15e67d 85b62e5f
!	%f4  = a73d0013 4019bc1b b2d0b9e9 77ed20db
!	%f8  = 1b7f273a bbb5f751 7fb4e71f 3a206bd9
!	%f12 = 4ad6903b d8ef1d65 38d11ad3 5b074475
	stda	%f0,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	Mem[0000000010141408] = 3b044e44, %l1 = 0000000017e06bff
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 00000044000000ff
!	%l7 = 00000000ee50eb02, Mem[0000000010081400] = 00000385
	stha	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = eb020385
!	Mem[0000000030081408] = ff15e67d, %l4 = 0000000031415a08
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 00000000ff15e67d
!	%l2 = 0000000031415b0a, Mem[0000000030101408] = ec6d0be1
	stba	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 0a6d0be1
!	%l2 = 31415b0a, %l3 = 0000009f, Mem[0000000010041410] = 000000f9 4d8cd03f
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 31415b0a 0000009f
!	%l0 = 0000000000002659, Mem[0000000010141414] = 7a9588e3
	stb	%l0,[%i5+0x014]		! Mem[0000000010141414] = 599588e3
!	%f31 = c9a380bd, %f25 = ad665e15
	fcmps	%fcc3,%f31,%f25		! %fcc3 = 1
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010001438] = 7544075b, %l6 = 92b0a59d, %l1 = 00000044
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 000000007544075b
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff077f1a, %l3 = 000000000000009f
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffff07

p0_label_9:
!	Mem[0000000030141408] = 54c54448 8822f87a, %l0 = 00002659, %l1 = 7544075b
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 000000008822f87a 0000000054c54448
!	Mem[00000000218000c0] = 8309f956, %l5 = 0000000031415ac9
	ldsba	[%o3+0x0c1]%asi,%l5	! %l5 = 0000000000000009
!	Mem[0000000010101408] = 9d1baac3, %l7 = 00000000ee50eb02
	lduha	[%i4+%o4]0x80,%l7	! %l7 = 0000000000009d1b
!	Mem[0000000030081408] = 31415a08, %l4 = 00000000ff15e67d
	ldswa	[%i2+%o4]0x81,%l4	! %l4 = 0000000031415a08
!	Mem[0000000030101410] = f8eefa0a 97732b5c, %l0 = 8822f87a, %l1 = 54c54448
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 00000000f8eefa0a 0000000097732b5c
!	Mem[0000000020800000] = 89bf16cb, %l5 = 0000000000000009
	lduh	[%o1+%g0],%l5		! %l5 = 00000000000089bf
!	Mem[0000000010141408] = ff4e043b, %l1 = 0000000097732b5c
	lduba	[%i5+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001408] = 9a5263a9, %l7 = 0000000000009d1b
	ldsba	[%i0+%o4]0x89,%l7	! %l7 = ffffffffffffffa9
!	Mem[00000000100c1418] = aba97235, %l7 = ffffffffffffffa9
	ldsha	[%i3+0x018]%asi,%l7	! %l7 = ffffffffffffaba9
!	Starting 10 instruction Store Burst
!	Mem[0000000010181430] = cc5410c3, %l0 = 00000000f8eefa0a
	swap	[%i6+0x030],%l0		! %l0 = 00000000cc5410c3

p0_label_10:
!	Mem[0000000010081410] = e3e74131, %l4 = 0000000031415a08
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 00000031000000ff
!	%f22 = 1fa4e83c e7ce4dea, %l0 = 00000000cc5410c3
!	Mem[0000000030101420] = 9a2593bfe2e3cfd9
	add	%i4,0x020,%g1
	stda	%f22,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030101420] = ea4dcee73ce8a41f
!	%l3 = ffffffffffffff07, Mem[00000000100c1410] = ee06def8
	stha	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = ee06ff07
!	Mem[00000000211c0001] = ff077f1a, %l0 = 00000000cc5410c3
	ldstub	[%o2+0x001],%l0		! %l0 = 00000007000000ff
!	%l3 = ffffffffffffff07, Mem[0000000010101400] = 6dd546f692b0a59d
	stxa	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffffffffff07
!	Mem[0000000010001408] = 5f2eb685, %l5 = 00000000000089bf
	ldstuba	[%i0+%o4]0x80,%l5	! %l5 = 0000005f000000ff
!	Mem[0000000030101408] = e10b6d0a, %l0 = 0000000000000007
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 0000000a000000ff
!	Mem[0000000010181410] = 31415ac9, %l3 = ffffffffffffff07
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 00000031000000ff
!	%l7 = ffffffffffffaba9, Mem[0000000010041404] = 25132c94, %asi = 80
	stha	%l7,[%i1+0x004]%asi	! Mem[0000000010041404] = aba92c94
!	Starting 10 instruction Load Burst
!	%f10 = 7fb4e71f 3a206bd9, %f6  = b2d0b9e9
	fdtos	%f10,%f6 		! %f6  = 7f800000

p0_label_11:
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 000000000000000a
	setx	0x88edc76020a1a706,%g7,%l0 ! %l0 = 88edc76020a1a706
!	%l1 = 00000000000000ff
	setx	0x43edf4379264d655,%g7,%l1 ! %l1 = 43edf4379264d655
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 88edc76020a1a706
	setx	0x89429ce879c4e029,%g7,%l0 ! %l0 = 89429ce879c4e029
!	%l1 = 43edf4379264d655
	setx	0x4f0c9cf031fae2c7,%g7,%l1 ! %l1 = 4f0c9cf031fae2c7
!	Mem[00000000100c1400] = 1aca112c, %l4 = 0000000000000031
	lduwa	[%i3+%g0]0x88,%l4	! %l4 = 000000001aca112c
!	Mem[0000000010181438] = 5f76d28f 4d15b29a, %l2 = 31415b0a, %l3 = 00000031
	ldd	[%i6+0x038],%l2		! %l2 = 000000005f76d28f 000000004d15b29a
!	Mem[0000000030081408] = 31415a08, %l7 = ffffffffffffaba9
	lduba	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000031
!	Mem[0000000010081434] = 7e1e2138, %f17 = 301fcf25
	ld	[%i2+0x034],%f17	! %f17 = 7e1e2138
!	Mem[0000000010101408] = 9d1baac3, %l7 = 0000000000000031
	lduw	[%i4+%o4],%l7		! %l7 = 000000009d1baac3
!	Mem[0000000030081400] = b9bd7bff, %l2 = 000000005f76d28f
	ldswa	[%i2+%g0]0x89,%l2	! %l2 = ffffffffb9bd7bff
!	Mem[0000000020800040] = dca42c25, %l5 = 000000000000005f
	ldsh	[%o1+0x040],%l5		! %l5 = ffffffffffffdca4
!	Mem[0000000010181400] = 3141e7e3, %l5 = ffffffffffffdca4
	lduha	[%i6+%g0]0x80,%l5	! %l5 = 0000000000003141
!	Starting 10 instruction Store Burst
!	%l7 = 000000009d1baac3, Mem[00000000201c0000] = 010c7d80, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = aac37d80

p0_label_12:
!	%l1 = 4f0c9cf031fae2c7, Mem[0000000010041429] = 25f1a81c, %asi = 80
	stba	%l1,[%i1+0x029]%asi	! Mem[0000000010041428] = 25c7a81c
!	%l4 = 000000001aca112c, Mem[0000000030101408] = ff6d0be1
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 112c0be1
!	%l2 = ffffffffb9bd7bff, Mem[0000000010001410] = 1bbc194013003da7
	stxa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffffb9bd7bff
!	%l2 = ffffffffb9bd7bff, Mem[00000000100c142c] = afc25041
	stb	%l2,[%i3+0x02c]		! Mem[00000000100c142c] = ffc25041
!	Mem[00000000100c142c] = ffc25041, %l0 = 79c4e029, %l4 = 1aca112c
	add	%i3,0x2c,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 00000000ffc25041
!	%l0 = 89429ce879c4e029, Mem[0000000010001432] = 651defd8, %asi = 80
	stha	%l0,[%i0+0x032]%asi	! Mem[0000000010001430] = 651de029
!	%f16 = a67e00ff 7e1e2138 fcbd0f53 f38071e5
!	%f20 = 9492a8ca 88f2b688 1fa4e83c e7ce4dea
!	%f24 = c8360210 ad665e15 9fa21ded af925539
!	%f28 = 60bf3f07 81ca25e9 e388957a c9a380bd
	stda	%f16,[%i6]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	Mem[0000000010141424] = 9fa21ded, %l6 = 6dd546f692b0a59d, %asi = 80
	swapa	[%i5+0x024]%asi,%l6	! %l6 = 000000009fa21ded
!	%l1 = 4f0c9cf031fae2c7, %l6 = 000000009fa21ded, %y  = 00000000
	umul	%l1,%l6,%l2		! %l2 = 1f2a7974cbe27d3b, %y = 1f2a7974
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 301665ca, %l3 = 000000004d15b29a
	ldsha	[%i5+%o5]0x81,%l3	! %l3 = 0000000000003016

p0_label_13:
!	Mem[00000000100c1408] = 9fa21ded, %l6 = 000000009fa21ded
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = ffffffffffff9fa2
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010181400] = 38211e7e ff007ea6 e57180f3 530fbdfc
!	Mem[0000000010181410] = 88b6f288 caa89294 ea4dcee7 3ce8a41f
!	Mem[0000000010181420] = 155e66ad 100236c8 395592af ed1da29f
!	Mem[0000000010181430] = e925ca81 073fbf60 bd80a3c9 7a9588e3
	ldda	[%i6]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	Mem[0000000030181400] = 301fcf25, %l6 = ffffffffffff9fa2
	lduba	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000025
!	Mem[0000000010041400] = 612da4b5, %l6 = 0000000000000025
	ldsba	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000061
!	%l7 = 000000009d1baac3, %l3 = 0000000000003016, %y  = 1f2a7974
	udiv	%l7,%l3,%l7		! %l7 = 00000000ffffffff
	mov	%l0,%y			! %y = 79c4e029
!	Mem[0000000030141408] = 7af822884844c554, %l5 = 0000000000003141
	ldxa	[%i5+%o4]0x81,%l5	! %l5 = 7af822884844c554
!	Mem[0000000010101400] = 07ffffff ffffffff, %l4 = ffc25041, %l5 = 4844c554
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 00000000ffffffff 0000000007ffffff
!	Mem[0000000030101408] = 7efee79be10b2c11, %f14 = 38d11ad3 5b074475
	ldda	[%i4+%o4]0x89,%f14	! %f14 = 7efee79b e10b2c11
!	Mem[0000000030181400] = 25cf1f30, %l0 = 89429ce879c4e029
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000025
!	Starting 10 instruction Store Burst
!	%f7  = 77ed20db, Mem[00000000300c1408] = 14f1d5ff
	sta	%f7 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 77ed20db

p0_label_14:
!	%f4  = a73d0013 4019bc1b, Mem[0000000010141408] = ff4e043b 00000385
	stda	%f4 ,[%i5+%o4]0x80	! Mem[0000000010141408] = a73d0013 4019bc1b
	membar	#Sync			! Added by membar checker (5)
!	%l0 = 0000000000000025, Mem[0000000010181410] = 88b6f288
	stha	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 0025f288
!	%l4 = 00000000ffffffff, Mem[0000000010041420] = f0cb05d3b37eb287
	stx	%l4,[%i1+0x020]		! Mem[0000000010041420] = 00000000ffffffff
!	%l3 = 0000000000003016, Mem[0000000010141438] = 6b2bda8689b1b57a
	stx	%l3,[%i5+0x038]		! Mem[0000000010141438] = 0000000000003016
!	%f30 = e388957a c9a380bd, %l7 = 00000000ffffffff
!	Mem[0000000030001400] = 3aea11c5e99504c2
	stda	%f30,[%i0+%l7]ASI_PST16_S ! Mem[0000000030001400] = e388957ac9a380bd
!	%l6 = 0000000000000061, Mem[00000000300c1408] = db20ed77
	stwa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000061
!	Mem[00000000300c1400] = 07c3ffff, %l1 = 4f0c9cf031fae2c7
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 000000ff000000ff
!	%f0  = ff7bbdb9 83e9def0, Mem[0000000010141408] = 13003da7 1bbc1940
	stda	%f0 ,[%i5+%o4]0x88	! Mem[0000000010141408] = ff7bbdb9 83e9def0
!	Mem[000000001004140c] = 3970cb25, %l6 = 0000000000000061, %asi = 80
	swapa	[%i1+0x00c]%asi,%l6	! %l6 = 000000003970cb25
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ed1da29f, %l0 = 0000000000000025
	lduwa	[%i3+%o4]0x88,%l0	! %l0 = 00000000ed1da29f

p0_label_15:
!	Mem[0000000010041408] = e3e7bd6100000061, %l6 = 000000003970cb25
	ldxa	[%i1+0x008]%asi,%l6	! %l6 = e3e7bd6100000061
!	Mem[0000000030081400] = b9bd7bff, %f16 = a67e00ff
	lda	[%i2+%g0]0x89,%f16	! %f16 = b9bd7bff
!	Mem[0000000030041410] = ee7cab83, %l5 = 0000000007ffffff
	lduha	[%i1+%o5]0x89,%l5	! %l5 = 000000000000ab83
!	Mem[0000000030181400] = 53768d34301fcf25, %l5 = 000000000000ab83
	ldxa	[%i6+%g0]0x89,%l5	! %l5 = 53768d34301fcf25
!	Mem[0000000010141400] = f366b28f, %l7 = 00000000ffffffff
	lduba	[%i5+%g0]0x88,%l7	! %l7 = 000000000000008f
!	Mem[0000000030101400] = 1eca8581, %l3 = 0000000000003016
	ldswa	[%i4+%g0]0x81,%l3	! %l3 = 000000001eca8581
!	Mem[000000001018143c] = 7a9588e3, %l1 = 00000000000000ff
	ldsba	[%i6+0x03c]%asi,%l1	! %l1 = 000000000000007a
!	Mem[0000000010101408] = 9d1baac3, %l3 = 000000001eca8581
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 000000000000009d
!	Mem[00000000218000c0] = 8309f956, %l2 = 1f2a7974cbe27d3b
	ldsba	[%o3+0x0c1]%asi,%l2	! %l2 = 0000000000000009
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000009, Mem[0000000010041408] = 61bde7e3
	stba	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 61bde709

p0_label_16:
!	Mem[0000000010141410] = bd80a3c9599588e3, %l2 = 0000000000000009, %l3 = 000000000000009d
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = bd80a3c9599588e3
!	%f16 = b9bd7bff 7e1e2138, Mem[0000000030081408] = 085a4131 5f2eb685
	stda	%f16,[%i2+%o4]0x89	! Mem[0000000030081408] = b9bd7bff 7e1e2138
!	%l2 = 0000000000000009, Mem[0000000030181410] = d1268100
	stwa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000009
!	Mem[0000000030081410] = 13003da7, %l2 = 0000000000000009
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 000000a7000000ff
!	Mem[0000000030141410] = 301665ca, %l6 = e3e7bd6100000061
	swapa	[%i5+%o5]0x81,%l6	! %l6 = 00000000301665ca
!	%l3 = bd80a3c9599588e3, Mem[0000000010141408] = f0dee983
	stwa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 599588e3
!	%f2  = ff15e67d 85b62e5f, Mem[0000000010001400] = 83e9def0 ff7bbdb9
	stda	%f2 ,[%i0+%g0]0x88	! Mem[0000000010001400] = ff15e67d 85b62e5f
!	%l3 = bd80a3c9599588e3, Mem[0000000030001408] = 9a5263a9
	stwa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 599588e3
!	%l0 = 00000000ed1da29f, Mem[0000000030001400] = 7a9588e3
	stba	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 7a95889f
!	Starting 10 instruction Load Burst
!	%f8  = 1b7f273a, %f24 = c8360210 ad665e15
	fitod	%f8 ,%f24		! %f24 = 41bb7f27 3a000000

p0_label_17:
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030081400] = ff7bbdb9 83e9def0 38211e7e ff7bbdb9
!	Mem[0000000030081410] = ff3d0013 4019bc1b b2d0b9e9 77ed20db
!	Mem[0000000030081420] = 1b7f273a bbb5f751 7fb4e71f 3a206bd9
!	Mem[0000000030081430] = 4ad6903b d8ef1d65 38d11ad3 5b074475
	ldda	[%i2]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030081400
!	Mem[00000000100c1408] = 9fa21ded, %f13 = d8ef1d65
	lda	[%i3+%o4]0x80,%f13	! %f13 = 9fa21ded
!	Mem[0000000010001400] = 85b62e5f, %l5 = 53768d34301fcf25
	ldsba	[%i0+%g0]0x88,%l5	! %l5 = 000000000000005f
!	Mem[0000000030041408] = b66fa59d, %l1 = 000000000000007a
	lduha	[%i1+%o4]0x89,%l1	! %l1 = 000000000000a59d
!	Mem[0000000010081408] = 4cf6ab34, %f8  = 1b7f273a
	lda	[%i2+%o4]0x88,%f8 	! %f8 = 4cf6ab34
!	Mem[0000000010141400] = 8fb266f3 e3096414 599588e3 b9bd7bff
!	Mem[0000000010141410] = bd80a3c9 599588e3 b95cf7b6 15999d57
!	Mem[0000000010141420] = 57cecc48 92b0a59d 51576b07 f2da102a
!	Mem[0000000010141430] = e8d0d8ea f34c9cd0 00000000 00003016
	ldda	[%i5]ASI_BLK_PL,%f0	! Block Load from 0000000010141400
!	Mem[0000000010041400] = b5a42d61, %l5 = 000000000000005f
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000061
!	Mem[0000000010041400] = 612da4b5, %l0 = 00000000ed1da29f
	lduha	[%i1+0x000]%asi,%l0	! %l0 = 000000000000612d
!	Mem[0000000030041400] = 4b567d9d fec8b26f 9da56fb6 81ca25e9
!	Mem[0000000030041410] = 83ab7cee 3aaf1e0b 27168f06 b1b9ebf0
!	Mem[0000000030041420] = 31f7bf47 e247debb 23044fbf 7237118d
!	Mem[0000000030041430] = 8ec1195f 11815484 ad880a76 65450a09
	ldda	[%i1]ASI_BLK_S,%f0	! Block Load from 0000000030041400
!	Starting 10 instruction Store Burst
!	%f20 = 1bbc1940 13003dff, Mem[0000000010081410] = ff41e7e3 ff6be017
	stda	%f20,[%i2+%o5]0x80	! Mem[0000000010081410] = 1bbc1940 13003dff

p0_label_18:
!	Mem[0000000030181400] = 301fcf25, %l7 = 000000000000008f
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 00000000301fcf25
!	%f18 = b9bd7bff 7e1e2138, %l6 = 00000000301665ca
!	Mem[0000000030181400] = 8f000000348d7653
	stda	%f18,[%i6+%l6]ASI_PST16_SL ! Mem[0000000030181400] = 8f001e7e348dbdb9
	membar	#Sync			! Added by membar checker (7)
!	%f30 = 7544075b d31ad138, Mem[0000000010141418] = b95cf7b6 15999d57
	stda	%f30,[%i5+0x018]%asi	! Mem[0000000010141418] = 7544075b d31ad138
!	Mem[00000000100c1400] = 2c11ca1a, %l0 = 000000000000612d
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 000000002c11ca1a
!	%l4 = 00000000ffffffff, Mem[0000000010081400] = eb020385
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff
!	%l5 = 0000000000000061, Mem[0000000010041400] = 612da4b5
	stba	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 612da4b5
!	%f30 = 7544075b d31ad138, %l7 = 00000000301fcf25
!	Mem[0000000030041418] = 27168f06b1b9ebf0
	add	%i1,0x018,%g1
	stda	%f30,[%g1+%l7]ASI_PST8_S ! Mem[0000000030041418] = 27160706b11aeb38
!	%l4 = 00000000ffffffff, Mem[0000000010081425] = feaffe2b, %asi = 80
	stba	%l4,[%i2+0x025]%asi	! Mem[0000000010081424] = fefffe2b
!	%f14 = ad880a76 65450a09, %l0 = 000000002c11ca1a
!	Mem[0000000010081430] = f692f9587e1e2138
	add	%i2,0x030,%g1
	stda	%f14,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010081430] = f69245657e1e88ad
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = b66fa59d, %l0 = 000000002c11ca1a
	lduwa	[%i1+%o4]0x89,%l0	! %l0 = 00000000b66fa59d

p0_label_19:
!	%l6 = 00000000301665ca, %l6 = 00000000301665ca, %l4 = 00000000ffffffff
	sub	%l6,%l6,%l4		! %l4 = 0000000000000000
!	Mem[0000000010181400] = 7e1e2138, %l1 = 000000000000a59d
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 0000000000002138
!	Mem[0000000010101410] = 5f269dc6, %l6 = 00000000301665ca
	lduba	[%i4+%o5]0x80,%l6	! %l6 = 000000000000005f
!	Mem[00000000300c1400] = ffffc307, %l2 = 00000000000000a7
	lduba	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = 00000061, %f19 = 7e1e2138
	lda	[%i5+%o5]0x81,%f19	! %f19 = 00000061
!	%l6 = 000000000000005f, %l7 = 00000000301fcf25, %l1 = 0000000000002138
	add	%l6,%l7,%l1		! %l1 = 00000000301fcf84
!	Mem[0000000010081434] = 7e1e88ad, %l1 = 00000000301fcf84
	lduha	[%i2+0x034]%asi,%l1	! %l1 = 0000000000007e1e
!	Mem[0000000010141400] = f366b28f, %f14 = ad880a76
	lda	[%i5+%g0]0x88,%f14	! %f14 = f366b28f
!	Mem[0000000010181428] = 395592af ed1da29f, %l6 = 0000005f, %l7 = 301fcf25
	ldda	[%i6+0x028]%asi,%l6	! %l6 = 00000000395592af 00000000ed1da29f
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 599588e3, Mem[0000000030081410] = 13003dff 1bbc1940
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff 599588e3

p0_label_20:
!	Mem[0000000021800101] = 0ee36971, %l5 = 0000000000000061
	ldstub	[%o3+0x101],%l5		! %l5 = 000000e3000000ff
!	%f20 = 1bbc1940 13003dff, %l0 = 00000000b66fa59d
!	Mem[0000000010181400] = 38211e7eff007ea6
	stda	%f20,[%i6+%l0]ASI_PST8_P ! Mem[0000000010181400] = 1b211e4013007eff
!	%l0 = b66fa59d, %l1 = 00007e1e, Mem[0000000030081400] = ff7bbdb9 83e9def0
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = b66fa59d 00007e1e
!	Mem[0000000010041400] = 612da4b5, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000612da4b5
!	Mem[0000000010001428] = d96b203a, %l6 = 395592af, %l6 = 395592af
	add	%i0,0x28,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 00000000d96b203a
!	%l4 = 00000000, %l5 = 000000e3, Mem[00000000100c1400] = 0000612d 53792f92
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 000000e3
!	%l0 = b66fa59d, %l1 = 00007e1e, Mem[0000000010141408] = 599588e3 b9bd7bff
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = b66fa59d 00007e1e
!	Mem[00000000300c1410] = 26596e26, %l0 = 00000000b66fa59d
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 00000026000000ff
!	%l1 = 0000000000007e1e, Mem[0000000010181424] = 100236c8, %asi = 80
	stwa	%l1,[%i6+0x024]%asi	! Mem[0000000010181424] = 00007e1e
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = e10b2c11, %l0 = 0000000000000026
	lduha	[%i4+%o4]0x89,%l0	! %l0 = 0000000000002c11

p0_label_21:
!	Mem[00000000100c1400] = 00000000000000e3, %f4  = 83ab7cee 3aaf1e0b
	ldd	[%i3+%g0],%f4 		! %f4  = 00000000 000000e3
!	Mem[0000000010141400] = f366b28f, %l0 = 0000000000002c11
	lduba	[%i5+%g0]0x88,%l0	! %l0 = 000000000000008f
!	Mem[00000000300c1408] = 61000000, %l3 = bd80a3c9599588e3
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = 0000000061000000
!	Mem[0000000010041408] = 09e7bd61, %f12 = 8ec1195f
	ld	[%i1+%o4],%f12	! %f12 = 09e7bd61
!	Mem[0000000030001408] = e3889559, %l7 = 00000000ed1da29f
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000e3
!	Mem[0000000030081400] = 1e7e00009da56fb6, %l3 = 0000000061000000
	ldxa	[%i2+%g0]0x89,%l3	! %l3 = 1e7e00009da56fb6
!	Mem[00000000100c1408] = 9fa21dedaf925539, %f26 = d96b203a 1fe7b47f
	ldda	[%i3+%o4]0x80,%f26	! %f26 = 9fa21ded af925539
!	Mem[0000000030041408] = b66fa59d, %l2 = 00000000612da4b5
	ldsha	[%i1+%o4]0x89,%l2	! %l2 = ffffffffffffa59d
!	Mem[0000000010001400] = 5f2eb685, %f20 = 1bbc1940
	lda	[%i0+%g0]0x80,%f20	! %f20 = 5f2eb685
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 000000000000008f
	setx	0x0b7e8167ccb892c5,%g7,%l0 ! %l0 = 0b7e8167ccb892c5
!	%l1 = 0000000000007e1e
	setx	0xdf2a228067f29892,%g7,%l1 ! %l1 = df2a228067f29892
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0b7e8167ccb892c5
	setx	0x659c8587e97a0448,%g7,%l0 ! %l0 = 659c8587e97a0448
!	%l1 = df2a228067f29892
	setx	0x5e384f3fa70ed68f,%g7,%l1 ! %l1 = 5e384f3fa70ed68f

p0_label_22:
!	Mem[0000000010081434] = 7e1e88ad, %l1 = 5e384f3fa70ed68f, %asi = 80
	swapa	[%i2+0x034]%asi,%l1	! %l1 = 000000007e1e88ad
!	%f4  = 00000000 000000e3, Mem[0000000010181428] = 395592af ed1da29f
	std	%f4 ,[%i6+0x028]	! Mem[0000000010181428] = 00000000 000000e3
!	%l7 = 00000000000000e3, imm = 0000000000000b15, %l2 = ffffffffffffa59d
	andn	%l7,0xb15,%l2		! %l2 = 00000000000000e2
!	Mem[0000000030081408] = 7e1e2138, %l2 = 00000000000000e2
	ldstuba	[%i2+%o4]0x89,%l2	! %l2 = 00000038000000ff
!	%f9  = e247debb, %f8  = 31f7bf47 e247debb
	fstox	%f9 ,%f8 		! %f8  = 80000000 00000000
!	Mem[0000000010001400] = 85b62e5f, %l7 = 00000000000000e3
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 0000005f000000ff
!	Mem[0000000010001408] = 85b62eff, %l1 = 000000007e1e88ad
	ldstuba	[%i0+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	%f3  = 81ca25e9, %f27 = af925539, %f26 = 9fa21ded af925539
	fsmuld	%f3 ,%f27,%f26		! %f26 = 363ce33a 9eb37840
!	%l3 = 1e7e00009da56fb6, Mem[000000001018140c] = 530fbdfc, %asi = 80
	stwa	%l3,[%i6+0x00c]%asi	! Mem[000000001018140c] = 9da56fb6
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 07ffffffffffffff, %l3 = 1e7e00009da56fb6
	ldxa	[%i4+%g0]0x88,%l3	! %l3 = 07ffffffffffffff

p0_label_23:
!	Mem[0000000010101410] = c69d265f, %l1 = 00000000000000ff
	ldswa	[%i4+%o5]0x88,%l1	! %l1 = ffffffffc69d265f
!	Mem[0000000030141410] = 00000061, %l3 = 07ffffffffffffff
	ldswa	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000061
!	Mem[0000000010141418] = 7544075b, %l1 = ffffffffc69d265f
	ldub	[%i5+0x01b],%l1		! %l1 = 000000000000005b
!	Mem[0000000030081400] = b66fa59d, %l0 = 659c8587e97a0448
	ldswa	[%i2+%g0]0x81,%l0	! %l0 = ffffffffb66fa59d
!	Mem[00000000218000c0] = 8309f956, %l4 = 0000000000000000
	ldub	[%o3+0x0c0],%l4		! %l4 = 0000000000000083
!	Mem[0000000030141400] = a67e00ff, %l1 = 000000000000005b
	ldsba	[%i5+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000021800180] = 0385c5c1, %l1 = ffffffffffffffff
	lduh	[%o3+0x180],%l1		! %l1 = 0000000000000385
!	Mem[0000000010141408] = 9da56fb6, %l4 = 0000000000000083
	lduba	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000b6
!	Mem[0000000010001408] = ff2eb6857de615ff, %l3 = 0000000000000061
	ldxa	[%i0+%o4]0x80,%l3	! %l3 = ff2eb6857de615ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 9fa21dedaf925539, %l7 = 000000000000005f, %l3 = ff2eb6857de615ff
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l7,%l3	! %l3 = 9fa21dedaf925539

p0_label_24:
!	%l6 = 00000000d96b203a, Mem[0000000010141408] = b66fa59d
	stwa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = d96b203a
!	%f20 = 5f2eb685 13003dff, %f12 = 09e7bd61 11815484
	fxtod	%f20,%f12		! %f12 = 43d7cbad a144c00f
!	%f10 = 23044fbf 7237118d, Mem[0000000010181410] = 0025f288 caa89294
	stda	%f10,[%i6+%o5]0x80	! Mem[0000000010181410] = 23044fbf 7237118d
!	Mem[0000000010101408] = 9d1baac3, %l4 = 00000000000000b6, %asi = 80
	swapa	[%i4+0x008]%asi,%l4	! %l4 = 000000009d1baac3
!	%l0 = ffffffffb66fa59d, Mem[00000000100c1410] = ee06ff07
	stha	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = ee06a59d
!	%l1 = 0000000000000385, Mem[00000000100c1408] = 9fa21dedaf925539
	stxa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000385
!	%f23 = e9b9d0b2, %f2  = 9da56fb6
	fcmps	%fcc2,%f23,%f2 		! %fcc2 = 1
!	%l3 = 9fa21dedaf925539, Mem[0000000030001400] = 9f88957a
	stba	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 3988957a
!	%f0  = 4b567d9d fec8b26f, %l7 = 000000000000005f
!	Mem[0000000030141418] = da9681a755cfd5d5
	add	%i5,0x018,%g1
	stda	%f0,[%g1+%l7]ASI_PST16_S ! Mem[0000000030141418] = 4b567d9dfec8b26f
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 07c3ffff, %f11 = 7237118d
	lda	[%i3+%g0]0x89,%f11	! %f11 = 07c3ffff

p0_label_25:
!	Mem[0000000030001408] = 599588e3, %l5 = 00000000000000e3
	ldswa	[%i0+%o4]0x89,%l5	! %l5 = 00000000599588e3
!	%f10 = 23044fbf, %f7  = b1b9ebf0, %f9  = 00000000
	fdivs	%f10,%f7 ,%f9 		! %f9  = b0b62ed4
!	%l7 = 000000000000005f, immed = 000005d0, %y  = 79c4e029
	smul	%l7,0x5d0,%l1		! %l1 = 0000000000022830, %y = 00000000
!	Mem[0000000030101410] = f8eefa0a, %l7 = 000000000000005f
	lduba	[%i4+%o5]0x81,%l7	! %l7 = 00000000000000f8
!	Mem[0000000010001408] = ff2eb685, %l0 = ffffffffb66fa59d
	ldsha	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffffff2e
!	Mem[0000000030081400] = 1e7e00009da56fb6, %l6 = 00000000d96b203a
	ldxa	[%i2+%g0]0x89,%l6	! %l6 = 1e7e00009da56fb6
!	Mem[0000000010081408] = 34abf64c, %l1 = 0000000000022830
	lduba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000034
!	Mem[0000000010081410] = 1bbc194013003dff, %l2 = 0000000000000038
	ldxa	[%i2+%o5]0x80,%l2	! %l2 = 1bbc194013003dff
!	Mem[0000000030001400] = 3988957a, %f30 = 7544075b
	lda	[%i0+%g0]0x81,%f30	! %f30 = 3988957a
!	Starting 10 instruction Store Burst
!	%l5 = 00000000599588e3, Mem[0000000030141400] = ff007ea6
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 88e37ea6

p0_label_26:
!	Mem[0000000030081410] = 000000ff, %l0 = ffffffffffffff2e
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030181408] = 5ba7328f, %l1 = 0000000000000034
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 0000008f000000ff
!	Mem[0000000010041434] = 41532212, %l7 = 00000000000000f8, %asi = 80
	swapa	[%i1+0x034]%asi,%l7	! %l7 = 0000000041532212
!	Mem[0000000030041408] = b66fa59d, %l1 = 000000000000008f
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 0000009d000000ff
!	Mem[0000000010141400] = 8fb266f3, %l1 = 000000000000009d
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 000000008fb266f3
!	Mem[0000000030081400] = b66fa59d, %l5 = 00000000599588e3
	ldstuba	[%i2+%g0]0x81,%l5	! %l5 = 000000b6000000ff
!	Mem[0000000030101400] = 8185ca1e, %l0 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 000000008185ca1e
!	%l0 = 8185ca1e, %l1 = 8fb266f3, Mem[0000000030141400] = a67ee388 1231fc73
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 8185ca1e 8fb266f3
!	%l2 = 1bbc194013003dff, immed = fffff8e5, %y  = 00000000
	smul	%l2,-0x71b,%l4		! %l4 = ffffff78fd477d1b, %y = ffffff78
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 23044fbf, %l7 = 0000000041532212
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = 0000000000002304

p0_label_27:
!	Mem[00000000211c0000] = ffff7f1a, %l1 = 000000008fb266f3
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffff
!	%l1 = ffffffffffffffff, imm = fffffffffffffa5c, %l6 = 1e7e00009da56fb6
	orn	%l1,-0x5a4,%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010181408] = e57180f3 9da56fb6, %l2 = 13003dff, %l3 = af925539
	ldd	[%i6+%o4],%l2		! %l2 = 00000000e57180f3 000000009da56fb6
!	Mem[0000000010181400] = 1b211e40, %l0 = 000000008185ca1e
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = 0000000000001b21
!	Mem[0000000030041410] = ee7cab83, %l2 = 00000000e57180f3
	lduwa	[%i1+%o5]0x89,%l2	! %l2 = 00000000ee7cab83
!	Mem[00000000300c1410] = 266e59ff, %l1 = ffffffffffffffff
	ldsba	[%i3+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081410] = 1bbc1940, %l7 = 0000000000002304
	lduw	[%i2+%o5],%l7		! %l7 = 000000001bbc1940
!	Mem[0000000010001410] = ffffffff, %f16 = f0dee983
	lda	[%i0+%o5]0x88,%f16	! %f16 = ffffffff
!	%f28 = 651defd8, %f13 = a144c00f
	fcmpes	%fcc0,%f28,%f13		! %fcc0 = 2
!	Starting 10 instruction Store Burst
!	%l4 = ffffff78fd477d1b, Mem[0000000010001410] = ffffffff
	stwa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = fd477d1b

p0_label_28:
!	Mem[0000000010181415] = 7237118d, %l7 = 000000001bbc1940
	ldstub	[%i6+0x015],%l7		! %l7 = 00000037000000ff
!	%l3 = 000000009da56fb6, Mem[00000000300c1408] = 00000061
	stha	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 6fb60061
!	Mem[0000000010101422] = 6b4724a6, %l6 = ffffffffffffffff
	ldstuba	[%i4+0x022]%asi,%l6	! %l6 = 00000024000000ff
!	%f26 = 363ce33a 9eb37840, Mem[0000000010081400] = ffffffff 1c139b63
	stda	%f26,[%i2+%g0]0x80	! Mem[0000000010081400] = 363ce33a 9eb37840
!	%l0 = 0000000000001b21, Mem[00000000300c1410] = ff596e26
	stba	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 21596e26
!	%l1 = ffffffffffffffff, Mem[0000000010001410] = 1b7d47fd
	stwa	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff
!	Mem[0000000030181400] = 8f001e7e, %l0 = 0000000000001b21
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 000000008f001e7e
!	%l7 = 0000000000000037, immed = 000008a0, %y  = ffffff78
	umul	%l7,0x8a0,%l6		! %l6 = 000000000001da60, %y = 00000000
!	%f19 = 00000061, Mem[00000000100c1400] = 00000000
	sta	%f19,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000061
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 34abf64c7f21ea0c, %f24 = 51f7b5bb 3a277f1b
	ldda	[%i2+0x008]%asi,%f24	! %f24 = 34abf64c 7f21ea0c

p0_label_29:
!	Mem[0000000010081430] = f6924565, %l7 = 0000000000000037
	ldub	[%i2+0x033],%l7		! %l7 = 0000000000000065
!	Mem[0000000030141408] = 8822f87a, %l2 = 00000000ee7cab83
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = ffffffff8822f87a
!	Mem[0000000010041408] = 6100000061bde709, %l4 = ffffff78fd477d1b
	ldxa	[%i1+%o4]0x88,%l4	! %l4 = 6100000061bde709
!	Mem[0000000010181400] = 1b211e40 13007eff, %l0 = 8f001e7e, %l1 = ffffffff
	ldda	[%i6+0x000]%asi,%l0	! %l0 = 000000001b211e40 0000000013007eff
!	Mem[00000000300c1408] = 6fb6006134cefb89, %f28 = 651defd8 3b90d64a
	ldda	[%i3+%o4]0x81,%f28	! %f28 = 6fb60061 34cefb89
!	Mem[0000000010181400] = 1b211e40, %f7  = b1b9ebf0
	lda	[%i6+%g0]0x80,%f7 	! %f7 = 1b211e40
!	Mem[0000000010081414] = 13003dff, %l2 = ffffffff8822f87a
	ldswa	[%i2+0x014]%asi,%l2	! %l2 = 0000000013003dff
!	Mem[0000000010041410] = 0a5b4131, %l5 = 00000000000000b6
	lduba	[%i1+%o5]0x80,%l5	! %l5 = 000000000000000a
!	Mem[00000000300c1408] = 6100b66f, %l6 = 000000000001da60
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 000000000000006f
!	Starting 10 instruction Store Burst
!	Mem[0000000010001420] = 51f7b5bb3a277f1b, %l6 = 000000000000006f, %l7 = 0000000000000065
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = 51f7b5bb3a277f1b

p0_label_30:
!	%l5 = 000000000000000a, Mem[00000000100c1410] = ee06a59d
	stba	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = ee06a50a
!	%l1 = 0000000013007eff, Mem[0000000010001410] = ffffffff
	stwa	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 13007eff
!	Mem[0000000010181408] = f38071e5, %l7 = 51f7b5bb3a277f1b
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 000000e5000000ff
!	%f2  = 9da56fb6 81ca25e9, Mem[0000000010081430] = f6924565 a70ed68f
	stda	%f2 ,[%i2+0x030]%asi	! Mem[0000000010081430] = 9da56fb6 81ca25e9
!	%l0 = 000000001b211e40, Mem[0000000030001408] = e3889559
	stba	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 40889559
!	%l5 = 000000000000000a, Mem[0000000010141410] = c9a380bd
	stba	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = c9a3800a
!	%l6 = 000000000000006f, immed = fffff06e, %y  = 00000000
	smul	%l6,-0xf92,%l6		! %l6 = fffffffffff93fb2, %y = ffffffff
!	Mem[000000001010143c] = c80c44e7, %l5 = 000000000000000a
	swap	[%i4+0x03c],%l5		! %l5 = 00000000c80c44e7
!	%l0 = 000000001b211e40, Mem[0000000010181410] = 23044fbf
	stwa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 1b211e40
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 61000000, %l0 = 000000001b211e40
	ldswa	[%i3+%g0]0x80,%l0	! %l0 = 0000000061000000

p0_label_31:
!	Mem[0000000010081410] = 1bbc1940, %l6 = fffffffffff93fb2
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 0000000000001bbc
!	Mem[0000000030001410] = 1c58c549618f63d5, %l6 = 0000000000001bbc
	ldxa	[%i0+%o5]0x81,%l6	! %l6 = 1c58c549618f63d5
!	Mem[0000000010041408] = 61bde709, %l1 = 0000000013007eff
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = ffffffffffffe709
!	Mem[000000001010142c] = 88e5521d, %l7 = 00000000000000e5
	ldsb	[%i4+0x02c],%l7		! %l7 = ffffffffffffff88
!	%l7 = ffffffffffffff88, immd = 0000000000000ee9, %l3 = 000000009da56fb6
	sdivx	%l7,0xee9,%l3		! %l3 = 0000000000000000
!	Mem[0000000010081408] = 34abf64c, %l1 = ffffffffffffe709
	lduba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000034
!	Mem[0000000010141400] = 9d000000, %f29 = 34cefb89
	lda	[%i5+%g0]0x88,%f29	! %f29 = 9d000000
!	Mem[0000000030141408] = 7af82288, %l4 = 6100000061bde709
	ldsha	[%i5+%o4]0x81,%l4	! %l4 = 0000000000007af8
!	Mem[0000000020800040] = dca42c25, %l4 = 0000000000007af8
	ldsba	[%o1+0x040]%asi,%l4	! %l4 = ffffffffffffffdc
!	Starting 10 instruction Store Burst
!	%l0 = 0000000061000000, Mem[00000000100c1410] = 0aa506ee
	stha	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000006ee

p0_label_32:
!	%l0 = 61000000, %l1 = 00000034, Mem[0000000010081410] = 4019bc1b ff3d0013
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 61000000 00000034
!	Mem[000000001000143c] = d31ad138, %l3 = 00000000, %l4 = ffffffdc
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 00000000d31ad138
!	Mem[0000000030141408] = 7af82288, %l0 = 0000000061000000
	ldstuba	[%i5+%o4]0x81,%l0	! %l0 = 0000007a000000ff
!	%l6 = 1c58c549618f63d5, Mem[0000000010041400] = 942ca9abff000000
	stxa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 1c58c549618f63d5
!	Mem[0000000010181400] = 1b211e40, %l0 = 000000000000007a
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 0000001b000000ff
!	Mem[0000000030181410] = 09000000, %l4 = 00000000d31ad138
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 00000009000000ff
!	%l0 = 000000000000001b, Mem[0000000010041400] = d5638f61
	stba	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 1b638f61
!	%l6 = 1c58c549618f63d5, immed = 0000010a, %y  = ffffffff
	umul	%l6,0x10a,%l1		! %l1 = 000000655efdbb52, %y = 00000065
!	%l3 = 0000000000000000, Mem[0000000010081410] = 61000000
	stba	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 61000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff7f1a, %l4 = 0000000000000009
	ldsba	[%o2+0x001]%asi,%l4	! %l4 = ffffffffffffffff

p0_label_33:
!	Mem[0000000030181400] = 00001b21, %f17 = b9bd7bff
	lda	[%i6+%g0]0x81,%f17	! %f17 = 00001b21
!	Mem[0000000010141400] = 0000009d, %l2 = 0000000013003dff
	ldswa	[%i5+%g0]0x80,%l2	! %l2 = 000000000000009d
!	Mem[0000000020800000] = 89bf16cb, %l7 = ffffffffffffff88
	lduh	[%o1+%g0],%l7		! %l7 = 00000000000089bf
!	%f24 = 34abf64c, %f4  = 00000000, %f5  = 000000e3
	fdivs	%f24,%f4 ,%f5 		! %f5  = 7f800000
!	Mem[0000000030141400] = 8fb266f38185ca1e, %f22 = db20ed77 e9b9d0b2
	ldda	[%i5+%g0]0x89,%f22	! %f22 = 8fb266f3 8185ca1e
!	Mem[0000000030041410] = 83ab7cee, %l2 = 000000000000009d
	ldswa	[%i1+%o5]0x81,%l2	! %l2 = ffffffff83ab7cee
!	Mem[0000000020800040] = dca42c25, %l7 = 00000000000089bf
	ldub	[%o1+0x041],%l7		! %l7 = 00000000000000a4
!	Mem[0000000030001410] = 1c58c549, %l4 = ffffffffffffffff
	ldsha	[%i0+%o5]0x81,%l4	! %l4 = 0000000000001c58
!	Mem[0000000030041408] = ffa56fb6, %l2 = ffffffff83ab7cee
	lduwa	[%i1+%o4]0x81,%l2	! %l2 = 00000000ffa56fb6
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 266e5921, %l3 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 00000021000000ff

p0_label_34:
!	%l3 = 0000000000000021, Mem[0000000010041408] = 09e7bd61
	stba	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 21e7bd61
!	Mem[00000000211c0000] = ffff7f1a, %l3 = 0000000000000021
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010181408] = f38071ff
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = f38000ff
!	Mem[0000000030081408] = 7e1e21ff, %l7 = 00000000000000a4
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	%l0 = 000000000000001b, %l0 = 000000000000001b, %l1 = 000000655efdbb52
	udivx	%l0,%l0,%l1		! %l1 = 0000000000000001
!	%f10 = 23044fbf 07c3ffff, Mem[0000000030081400] = 9da56fff 1e7e0000
	stda	%f10,[%i2+%g0]0x89	! Mem[0000000030081400] = 23044fbf 07c3ffff
!	%l6 = 1c58c549618f63d5, Mem[0000000010041400] = 1b638f61
	stwa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 618f63d5
!	%f14 = f366b28f, Mem[0000000010001408] = 85b62eff
	sta	%f14,[%i0+%o4]0x88	! Mem[0000000010001408] = f366b28f
!	Mem[0000000030181410] = ff000000, %l1 = 0000000000000001
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 40889559, %l0 = 000000000000001b
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = 0000000040889559

p0_label_35:
!	Mem[0000000010141408] = 3a206bd9, %l4 = 0000000000001c58
	lduwa	[%i5+%o4]0x88,%l4	! %l4 = 000000003a206bd9
!	Mem[0000000030041400] = 9d7d564b, %l2 = 00000000ffa56fb6
	ldsba	[%i1+%g0]0x89,%l2	! %l2 = 000000000000004b
!	Mem[0000000010141420] = 57cecc48, %l1 = 00000000000000ff
	ldsw	[%i5+0x020],%l1		! %l1 = 0000000057cecc48
!	Mem[0000000030041400] = 4b567d9d, %l2 = 000000000000004b
	ldsba	[%i1+%g0]0x81,%l2	! %l2 = 000000000000004b
!	Mem[00000000300c1410] = ff596e26, %l7 = 00000000000000ff
	lduba	[%i3+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081410] = 61000000, %l4 = 000000003a206bd9
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, immed = fffffa86, %y  = 00000065
	sdiv	%l4,-0x57a,%l5		! %l5 = ffffffffed8eca52
	mov	%l0,%y			! %y = 40889559
!	Mem[0000000030081408] = ff211e7eff7bbdb9, %f20 = 5f2eb685 13003dff
	ldda	[%i2+%o4]0x81,%f20	! %f20 = ff211e7e ff7bbdb9
!	Mem[0000000010081400] = 363ce33a, %l3 = 00000000000000ff
	ldsba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000036
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010141408] = d96b203a, %asi = 80
	stba	%l7,[%i5+0x008]%asi	! Mem[0000000010141408] = ff6b203a

p0_label_36:
!	Mem[0000000030041410] = ee7cab83, %l2 = 000000000000004b
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 00000083000000ff
!	Mem[0000000010041408] = 61bde721, %l2 = 0000000000000083
	swapa	[%i1+%o4]0x88,%l2	! %l2 = 0000000061bde721
!	%l1 = 0000000057cecc48, Mem[0000000010181410] = 1b211e40
	stha	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = cc481e40
!	%l5 = ffffffffed8eca52, Mem[0000000010181400] = ff211e40
	stwa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = ed8eca52
!	%f8  = 80000000 b0b62ed4, %l6 = 1c58c549618f63d5
!	Mem[0000000030001438] = 34506a851633cfa4
	add	%i0,0x038,%g1
	stda	%f8,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030001438] = d42e6a850000cfa4
!	%l3 = 0000000000000036, Mem[0000000010181410] = cc481e4072ff118d, %asi = 80
	stxa	%l3,[%i6+0x010]%asi	! Mem[0000000010181410] = 0000000000000036
!	Mem[0000000010101408] = 000000b6, %l6 = 1c58c549618f63d5
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 00000000000000b6
!	Mem[0000000030181410] = 000000ff, %l5 = ffffffffed8eca52
	ldstuba	[%i6+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%l3 = 0000000000000036, Mem[0000000010001408] = 8fb266f37de615ff
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000036
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = f8eefa0a, %l6 = 00000000000000b6
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = fffffffff8eefa0a

p0_label_37:
!	Mem[0000000010041400] = d5638f61, %l3 = 0000000000000036
	ldsba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000061
!	Mem[0000000010041400] = d5638f61, %l2 = 0000000061bde721
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 00000000d5638f61
!	Mem[0000000030081410] = 000000ff, %l4 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041410] = 31415b0a, %l4 = 00000000000000ff
	ldsba	[%i1+%o5]0x88,%l4	! %l4 = 000000000000000a
!	Mem[0000000030101400] = ff0000008219ea07, %l0 = 0000000040889559
	ldxa	[%i4+%g0]0x81,%l0	! %l0 = ff0000008219ea07
!	Mem[0000000010141410] = c9a3800a, %f13 = a144c00f
	lda	[%i5+%o5]0x88,%f13	! %f13 = c9a3800a
!	Mem[0000000010101408] = 618f63d5, %f29 = 9d000000
	lda	[%i4+%o4]0x80,%f29	! %f29 = 618f63d5
!	%l4 = 000000000000000a, immed = fffff905, %y  = 40889559
	umul	%l4,-0x6fb,%l6		! %l6 = 00000009ffffba32, %y = 00000009
!	Mem[0000000030041408] = ffa56fb6, %l7 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 8219ea07, %l1 = 57cecc48, Mem[0000000030041408] = ffa56fb6 81ca25e9
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 8219ea07 57cecc48

p0_label_38:
!	Mem[0000000030101400] = 000000ff, %l3 = 0000000000000061
	swapa	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000201c0001] = aac37d80, %l3 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 000000c3000000ff
!	%f31 = d31ad138, Mem[0000000010001404] = 7de615ff
	sta	%f31,[%i0+0x004]%asi	! Mem[0000000010001404] = d31ad138
!	%l7 = ffffffffffffffff, Mem[00000000300c1410] = 57875909266e59ff
	stxa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffffffffffff
!	Mem[0000000030101408] = e10b2c11, %l4 = 000000000000000a
	ldstuba	[%i4+%o4]0x89,%l4	! %l4 = 00000011000000ff
!	%l4 = 0000000000000011, %l1 = 0000000057cecc48, %l6 = 00000009ffffba32
	addc	%l4,%l1,%l6		! %l6 = 0000000057cecc59
!	%f9  = b0b62ed4, Mem[0000000010181408] = f38000ff
	sta	%f9 ,[%i6+%o4]0x88	! Mem[0000000010181408] = b0b62ed4
!	%l2 = d5638f61, %l3 = 000000c3, Mem[0000000010001410] = ff7e0013 b9bd7bff
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = d5638f61 000000c3
!	Mem[0000000010181410] = 00000000, %l6 = 0000000057cecc59
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffffff, %l0 = ff0000008219ea07
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff

p0_label_39:
!	Mem[0000000010041408] = 00000083, %l7 = ffffffffffffffff
	ldsha	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000083
!	Mem[00000000201c0000] = aaff7d80, %l6 = 0000000000000000
	ldsb	[%o0+%g0],%l6		! %l6 = ffffffffffffffaa
!	Mem[00000000201c0000] = aaff7d80, %l0 = 00000000000000ff
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000aa
!	Mem[0000000020800040] = dca42c25, %l0 = 00000000000000aa
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = ffffffffffffdca4
!	Mem[0000000010181400] = ed8eca52, %l1 = 0000000057cecc48
	ldsha	[%i6+%g0]0x80,%l1	! %l1 = ffffffffffffed8e
!	Mem[0000000030001408] = 40889559, %l0 = ffffffffffffdca4
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 0000000000004088
!	Mem[0000000010181410] = 000000ff, %l5 = 00000000000000ff
	ldsba	[%i6+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	%f10 = 23044fbf, %f6  = 27168f06
	fcmps	%fcc2,%f10,%f6 		! %fcc2 = 1
!	Mem[0000000030181410] = ff000000466e0aa5, %f8  = 80000000 b0b62ed4
	ldda	[%i6+%o5]0x81,%f8 	! %f8  = ff000000 466e0aa5
!	Starting 10 instruction Store Burst
!	%f16 = ffffffff 00001b21, Mem[0000000010101408] = 618f63d5 eecee394
	stda	%f16,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffff 00001b21

p0_label_40:
!	%l3 = 00000000000000c3, Mem[0000000030141408] = 8822f8ff
	stba	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 8822f8c3
!	Mem[00000000100c1400] = 00000061, %l1 = ffffffffffffed8e
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000061
!	%f9  = 466e0aa5, Mem[00000000100c1408] = 00000000
	sta	%f9 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 466e0aa5
!	Mem[0000000010081400] = 363ce33a, %l1 = 0000000000000061
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 00000036000000ff
!	%l1 = 0000000000000036, Mem[0000000030101400] = 610000008219ea07
	stxa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000036
!	%f12 = 43d7cbad c9a3800a, %l2 = 00000000d5638f61
!	Mem[0000000030101420] = ea4dcee73ce8a41f
	add	%i4,0x020,%g1
	stda	%f12,[%g1+%l2]ASI_PST8_S ! Mem[0000000030101420] = ead7cbe73ce8a40a
!	%f16 = ffffffff 00001b21 b9bd7bff 00000061
!	%f20 = ff211e7e ff7bbdb9 8fb266f3 8185ca1e
!	%f24 = 34abf64c 7f21ea0c 363ce33a 9eb37840
!	%f28 = 6fb60061 618f63d5 3988957a d31ad138
	stda	%f16,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	Mem[0000000010001410] = d5638f61, %l1 = 0000000000000036
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 000000d5000000ff
!	%l6 = ffffffaa, %l7 = 00000083, Mem[0000000030141410] = 00000061 ba032b8f
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffaa 00000083
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l7 = 0000000000000083
	lduha	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000000

p0_label_41:
!	Mem[0000000020800040] = dca42c25, %l2 = 00000000d5638f61
	lduh	[%o1+0x040],%l2		! %l2 = 000000000000dca4
!	Mem[0000000010001408] = 3600000000000000, %f12 = 43d7cbad c9a3800a
	ldda	[%i0+%o4]0x88,%f12	! %f12 = 36000000 00000000
!	Mem[0000000030141400] = 8185ca1e, %l4 = 0000000000000011
	ldsba	[%i5+%g0]0x89,%l4	! %l4 = 000000000000001e
!	Mem[0000000030181400] = 00001b21, %l4 = 000000000000001e
	ldsha	[%i6+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff, %f14 = f366b28f
	lda	[%i3+%o5]0x81,%f14	! %f14 = ffffffff
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 0000000000004088
	setx	0x80abf8c0209cf1e9,%g7,%l0 ! %l0 = 80abf8c0209cf1e9
!	%l1 = 00000000000000d5
	setx	0x172902905e5f3074,%g7,%l1 ! %l1 = 172902905e5f3074
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 80abf8c0209cf1e9
	setx	0xe5892947ca90f387,%g7,%l0 ! %l0 = e5892947ca90f387
!	%l1 = 172902905e5f3074
	setx	0xf21ca3df962bcb23,%g7,%l1 ! %l1 = f21ca3df962bcb23
!	Mem[0000000010081408] = 4cf6ab34, %l7 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000034
!	Mem[0000000010141400] = 0000009de3096414, %l4 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l4	! %l4 = 0000009de3096414
!	Mem[0000000030001408] = 40889559, %l7 = 0000000000000034
	ldswa	[%i0+%o4]0x81,%l7	! %l7 = 0000000040889559
!	Starting 10 instruction Store Burst
!	%f10 = 23044fbf 07c3ffff, %l4 = 0000009de3096414
!	Mem[0000000030141428] = 92453b2ff93ac210
	add	%i5,0x028,%g1
	stda	%f10,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030141428] = 92453b2ff93ac210

p0_label_42:
!	Mem[0000000010181400] = ed8eca52, %l1 = f21ca3df962bcb23
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 00000000ed8eca52
!	%l3 = 00000000000000c3, imm = fffffffffffff75e, %l3 = 00000000000000c3
	xnor	%l3,-0x8a2,%l3		! %l3 = 0000000000000862
!	%l7 = 0000000040889559, Mem[0000000010001400] = 85b62eff
	stwa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 40889559
!	%l4 = 0000009de3096414, Mem[0000000010181408] = d42eb6b0
	stwa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = e3096414
!	%l7 = 0000000040889559, Mem[0000000010181410] = ff00000000000036
	stxa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000040889559
!	Mem[0000000010001400] = 38d11ad3 40889559, %l0 = ca90f387, %l1 = ed8eca52
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 0000000040889559 0000000038d11ad3
!	Mem[0000000010081410] = 61000000, %l5 = ffffffffffffffff
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 0000000061000000
!	Mem[0000000030181400] = 00001b21, %l3 = 0000000000000862
	ldstuba	[%i6+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141400] = 8185ca1e, %l4 = 0000009de3096414
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 000000008185ca1e
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff000000 e3889559, %l4 = 8185ca1e, %l5 = 61000000
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 00000000ff000000 00000000e3889559

p0_label_43:
!	Mem[00000000211c0000] = ffff7f1a, %l2 = 000000000000dca4
	lduh	[%o2+%g0],%l2		! %l2 = 000000000000ffff
	membar	#Sync			! Added by membar checker (8)
!	Mem[00000000100c1410] = ff7bbdb9, %f12 = 36000000
	lda	[%i3+%o5]0x88,%f12	! %f12 = ff7bbdb9
!	Mem[00000000211c0000] = ffff7f1a, %l1 = 0000000038d11ad3
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000021800140] = 1f7002f2, %l0 = 0000000040889559
	lduh	[%o3+0x140],%l0		! %l0 = 0000000000001f70
!	%l5 = 00000000e3889559, %l4 = 00000000ff000000, %y  = 00000009
	udiv	%l5,%l4,%l1		! %l1 = 0000000000000009
	mov	%l0,%y			! %y = 00001f70
!	Mem[0000000010141418] = 7544075b, %l4 = 00000000ff000000
	ldsw	[%i5+0x018],%l4		! %l4 = 000000007544075b
!	Mem[0000000030001408] = 59958840, %l1 = 0000000000000009
	ldswa	[%i0+%o4]0x89,%l1	! %l1 = 0000000059958840
!	Mem[0000000010181430] = e925ca81, %f20 = ff211e7e
	ld	[%i6+0x030],%f20	! %f20 = e925ca81
!	Mem[0000000010081408] = 34abf64c 7f21ea0c, %l6 = ffffffaa, %l7 = 40889559
	ldd	[%i2+%o4],%l6		! %l6 = 0000000034abf64c 000000007f21ea0c
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000001f70, Mem[0000000030001408] = 40889559933bdf0b
	stxa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000001f70

p0_label_44:
!	%l6 = 0000000034abf64c, Mem[0000000030041400] = 4b567d9d
	stwa	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 34abf64c
!	%f26 = 363ce33a 9eb37840, Mem[00000000300c1408] = 6fb60061 34cefb89
	stda	%f26,[%i3+%o4]0x81	! Mem[00000000300c1408] = 363ce33a 9eb37840
!	%f21 = ff7bbdb9, %f5  = 7f800000, %f26 = 363ce33a
	fmuls	%f21,%f5 ,%f26		! %f26 = ff800000
!	Mem[00000000201c0000] = aaff7d80, %l1 = 0000000059958840
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 000000aa000000ff
!	Mem[0000000010141400] = 0000009d, %l4 = 000000007544075b
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041408] = 8219ea07, %l5 = 00000000e3889559
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 00000082000000ff
!	%f16 = ffffffff 00001b21, Mem[0000000010001410] = 618f63ff c3000000
	stda	%f16,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff 00001b21
!	%l3 = 0000000000000000, Mem[0000000010181435] = 073fbf60
	stb	%l3,[%i6+0x035]		! Mem[0000000010181434] = 0700bf60
!	%l6 = 0000000034abf64c, Mem[0000000010041438] = aad13c4a6a1329e2, %asi = 80
	stxa	%l6,[%i1+0x038]%asi	! Mem[0000000010041438] = 0000000034abf64c
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = 27cb7b35, %l3 = 0000000000000000
	ldsba	[%o3+0x1c1]%asi,%l3	! %l3 = ffffffffffffffcb

p0_label_45:
!	Mem[0000000010041408] = 83000000, %l3 = ffffffffffffffcb
	ldsha	[%i1+%o4]0x80,%l3	! %l3 = ffffffffffff8300
!	Mem[0000000030041400] = 34abf64c, %l0 = 0000000000001f70
	ldswa	[%i1+%g0]0x81,%l0	! %l0 = 0000000034abf64c
!	Mem[00000000300c1400] = ffffc307b5b7947d, %l7 = 000000007f21ea0c
	ldxa	[%i3+%g0]0x81,%l7	! %l7 = ffffc307b5b7947d
!	Mem[0000000010181408] = e30964149da56fb6, %l4 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l4	! %l4 = e30964149da56fb6
!	Mem[0000000010081410] = ffffffff, %l0 = 0000000034abf64c
	ldswa	[%i2+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1430] = d5638f61 6100b66f, %l4 = 9da56fb6, %l5 = 00000082
	ldda	[%i3+0x030]%asi,%l4	! %l4 = 00000000d5638f61 000000006100b66f
!	Mem[0000000020800000] = 89bf16cb, %l5 = 000000006100b66f
	ldub	[%o1+0x001],%l5		! %l5 = 00000000000000bf
!	Mem[0000000010101400] = ffffffff, %l4 = 00000000d5638f61
	lduha	[%i4+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030181400] = ff001b21, %l5 = 00000000000000bf
	ldsba	[%i6+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = ff7bbdb9, %l3 = ffffffffffff8300
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 00000000ff7bbdb9

p0_label_46:
!	%f7  = 1b211e40, %f24 = 34abf64c, %f28 = 6fb60061
	fdivs	%f7 ,%f24,%f28		! %f28 = 25efdb4c
!	%f16 = ffffffff 00001b21 b9bd7bff 00000061
!	%f20 = e925ca81 ff7bbdb9 8fb266f3 8185ca1e
!	%f24 = 34abf64c 7f21ea0c ff800000 9eb37840
!	%f28 = 25efdb4c 618f63d5 3988957a d31ad138
	stda	%f16,[%i0]ASI_BLK_AIUS	! Block Store to 0000000030001400
!	Mem[0000000030181410] = ff000000, %l2 = 000000000000ffff
	lduwa	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff000000
!	%l3 = 00000000ff7bbdb9, Mem[0000000010101410] = 5f269dc6
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = ff7bbdb9
!	%f6  = 27168f06 1b211e40, Mem[00000000300c1408] = 3ae33c36 4078b39e
	stda	%f6 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 27168f06 1b211e40
!	%l1 = 00000000000000aa, Mem[0000000030041410] = ffab7cee
	stba	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = aaab7cee
!	%f4  = 00000000, Mem[0000000030181400] = ff001b21
	sta	%f4 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%f14 = ffffffff, Mem[0000000030001408] = ff7bbdb9
	sta	%f14,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000030001400] = ffffffff, %l5 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = d5638f61, %l3 = 00000000ff7bbdb9
	ldsha	[%i1+%g0]0x88,%l3	! %l3 = ffffffffffff8f61

p0_label_47:
!	Mem[0000000030181410] = 000000ff, %l5 = 00000000000000ff
	ldsba	[%i6+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1408] = 00000061, %l3 = ffffffffffff8f61
	ldswa	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000061
!	Mem[0000000030141410] = 83000000aaffffff, %l1 = 00000000000000aa
	ldxa	[%i5+%o5]0x89,%l1	! %l1 = 83000000aaffffff
!	Mem[00000000211c0000] = ffff7f1a, %l3 = 0000000000000061
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010081408] = 4cf6ab34, %l0 = ffffffffffffffff
	lduha	[%i2+%o4]0x88,%l0	! %l0 = 000000000000ab34
!	Mem[00000000300c1400] = ffffc307b5b7947d, %f12 = ff7bbdb9 00000000
	ldda	[%i3+%g0]0x81,%f12	! %f12 = ffffc307 b5b7947d
!	Mem[0000000010101410] = b9bd7bff, %f13 = b5b7947d
	lda	[%i4+%o5]0x88,%f13	! %f13 = b9bd7bff
!	Mem[0000000010141410] = c9a3800a, %l3 = 000000000000ffff
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 000000000000800a
!	Mem[0000000010081400] = ff3ce33a9eb37840, %f6  = 27168f06 1b211e40
	ldda	[%i2+%g0]0x80,%f6 	! %f6  = ff3ce33a 9eb37840
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 00000000000000e3, %l1 = 83000000aaffffff, %l5 = ffffffffffffffff
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l1,%l5	! %l5 = 00000000000000e3

p0_label_48:
!	Mem[0000000010081422] = 9ab010c4, %l1 = 83000000aaffffff
	ldstuba	[%i2+0x022]%asi,%l1	! %l1 = 00000010000000ff
!	%f20 = e925ca81 ff7bbdb9, Mem[0000000030001410] = e925ca81 ff7bbdb9
	stda	%f20,[%i0+%o5]0x81	! Mem[0000000030001410] = e925ca81 ff7bbdb9
!	Mem[0000000010181410] = 00000000, %l3 = 000000000000800a
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 00000083, %l6 = 0000000034abf64c
	swapa	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000083
!	Mem[0000000010081408] = 4cf6ab34, %l2 = 00000000ff000000
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 000000004cf6ab34
!	Mem[0000000010101420] = 6b47ffa6, %l2 = 000000004cf6ab34
	ldstuba	[%i4+0x020]%asi,%l2	! %l2 = 0000006b000000ff
!	%l0 = 0000ab34, %l1 = 00000010, Mem[00000000300c1400] = 07c3ffff 7d94b7b5
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000ab34 00000010
!	%f8  = ff000000 466e0aa5, Mem[0000000030181408] = ff32a75b a693bdc6
	stda	%f8 ,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000 466e0aa5
!	Mem[0000000030141410] = ffffffaa, %l5 = 00000000000000e3
	ldstuba	[%i5+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 401e211b, %l0 = 000000000000ab34
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = 000000000000401e

p0_label_49:
!	Mem[0000000030041408] = 07ea19ff, %l2 = 000000000000006b
	ldsha	[%i1+%o4]0x89,%l2	! %l2 = 00000000000019ff
!	Mem[0000000010181410] = 59958840 0000800a, %l4 = 0000ffff, %l5 = 000000ff
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 000000000000800a 0000000059958840
!	Mem[0000000030001410] = 81ca25e9, %l1 = 0000000000000010
	ldsha	[%i0+%o5]0x89,%l1	! %l1 = 00000000000025e9
!	Mem[0000000030081408] = 7e1e21ff, %l0 = 000000000000401e
	ldsha	[%i2+%o4]0x89,%l0	! %l0 = 00000000000021ff
!	Mem[0000000030081408] = ff211e7e, %l6 = 0000000000000083
	lduba	[%i2+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 0a800000, %l1 = 00000000000025e9
	ldsha	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000a80
!	Mem[00000000201c0000] = ffff7d80, %l1 = 0000000000000a80
	ldub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	%l2 = 00000000000019ff, %l0 = 00000000000021ff, %l5 = 0000000059958840
	xnor	%l2,%l0,%l5		! %l5 = ffffffffffffc7ff
!	Mem[0000000010041408] = 34abf64c, %f1  = fec8b26f
	lda	[%i1+%o4]0x88,%f1 	! %f1 = 34abf64c
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000021ff, Mem[0000000010181410] = 0a800000
	stha	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 21ff0000

p0_label_50:
!	%l6 = 00000000000000ff, Mem[0000000010181410] = 599588400000ff21
	stxa	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000000000ff
!	Mem[00000000100c141f] = f366b28f, %l4 = 000000000000800a
	ldstub	[%i3+0x01f],%l4		! %l4 = 0000008f000000ff
!	%f0  = 4b567d9d, Mem[0000000030001400] = ffffffff
	sta	%f0 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 4b567d9d
!	%l7 = ffffc307b5b7947d, Mem[0000000010041410] = 31415b0a
	stha	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 3141947d
!	Mem[0000000021800140] = 1f7002f2, %l4 = 000000000000008f
	ldstub	[%o3+0x140],%l4		! %l4 = 0000001f000000ff
!	%l2 = 00000000000019ff, Mem[00000000100c1410] = ffff8300
	stha	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffff19ff
!	%l3 = 0000000000000000, Mem[0000000030041400] = 4cf6ab34
	stwa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010101410] = ff7bbdb9
	stha	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000bdb9
!	Mem[0000000030101410] = 0afaeef8, %l7 = ffffc307b5b7947d
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 000000000afaeef8
!	Starting 10 instruction Load Burst
!	%l7 = 000000000afaeef8, %l0 = 00000000000021ff, %l0 = 00000000000021ff
	sub	%l7,%l0,%l0		! %l0 = 000000000afaccf9

p0_label_51:
!	Mem[0000000010141410] = 0a80a3c9, %l7 = 000000000afaeef8
	ldsba	[%i5+%o5]0x80,%l7	! %l7 = 000000000000000a
!	Mem[00000000300c1408] = 401e211b, %l7 = 000000000000000a
	lduba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000040
!	Mem[000000001000143c] = d31ad138, %l0 = 000000000afaccf9
	ldsw	[%i0+0x03c],%l0		! %l0 = ffffffffd31ad138
!	Mem[0000000030141400] = 146409e3, %l4 = 000000000000001f
	ldsha	[%i5+%g0]0x81,%l4	! %l4 = 0000000000001464
!	Mem[0000000010041408] = 4cf6ab34, %l2 = 00000000000019ff
	lduha	[%i1+%o4]0x80,%l2	! %l2 = 0000000000004cf6
!	Mem[0000000030081410] = ff000000 e3889559, %l4 = 00001464, %l5 = ffffc7ff
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 00000000ff000000 00000000e3889559
!	Mem[0000000030001400] = 9d7d564b 00001b21, %l6 = 000000ff, %l7 = 00000040
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 000000009d7d564b 0000000000001b21
!	Mem[0000000010181408] = e3096414, %l3 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l3	! %l3 = ffffffffffffffe3
!	Mem[0000000030181410] = 000000ff, %l7 = 0000000000001b21
	lduha	[%i6+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = ff2c0be1, %l0 = ffffffffd31ad138
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 000000ff000000ff

p0_label_52:
!	Mem[0000000030081410] = 000000ff, %l4 = 00000000ff000000
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%l3 = ffffffffffffffe3, Mem[0000000030081408] = 7e1e21ff
	stwa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffe3
!	%l6 = 9d7d564b, %l7 = 000000ff, Mem[0000000030181408] = ff000000 466e0aa5
	stda	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 9d7d564b 000000ff
!	%l1 = 00000000000000ff, immed = 00000093, %y  = 00001f70
	smul	%l1,0x093,%l7		! %l7 = 000000000000926d, %y = 00000000
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000010101410] = b9bd0000 f5b62a7b
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff 000000ff
!	%l2 = 00004cf6, %l3 = ffffffe3, Mem[00000000300c1408] = 401e211b 068f1627
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00004cf6 ffffffe3
!	%f6  = ff3ce33a 9eb37840, Mem[0000000030001408] = ffffffff 61000000
	stda	%f6 ,[%i0+%o4]0x89	! Mem[0000000030001408] = ff3ce33a 9eb37840
!	%l4 = 00000000000000ff, Mem[0000000010081408] = 000000ff
	stha	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ff00ff
!	Mem[0000000010041408] = 34abf64c, %l6 = 000000009d7d564b
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 0000004c000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 211b0000ffffffff, %l5 = 00000000e3889559
	ldxa	[%i0+%o5]0x80,%l5	! %l5 = 211b0000ffffffff

p0_label_53:
!	Mem[0000000010181438] = bd80a3c9, %l2 = 0000000000004cf6
	lduba	[%i6+0x03a]%asi,%l2	! %l2 = 00000000000000a3
!	Mem[00000000300c1400] = 34ab000010000000, %f12 = ffffc307 b9bd7bff
	ldda	[%i3+%g0]0x81,%f12	! %f12 = 34ab0000 10000000
!	Mem[0000000030041410] = aaab7cee, %l2 = 00000000000000a3
	lduba	[%i1+%o5]0x81,%l2	! %l2 = 00000000000000aa
!	Mem[0000000010081400] = 3ae33cff, %l7 = 000000000000926d
	lduwa	[%i2+%g0]0x88,%l7	! %l7 = 000000003ae33cff
!	Mem[0000000030181400] = 00000000, %l5 = 211b0000ffffffff
	ldsha	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%l0 = 00000000000000ff, %l4 = 00000000000000ff, %l7 = 000000003ae33cff
	orn	%l0,%l4,%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010001400] = 59958840 d31ad138, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 0000000059958840 00000000d31ad138
!	Mem[0000000030081408] = ffffffe3, %l3 = ffffffffffffffe3
	lduwa	[%i2+%o4]0x89,%l3	! %l3 = 00000000ffffffe3
!	Mem[00000000201c0000] = ffff7d80, %l3 = 00000000ffffffe3
	lduba	[%o0+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[000000001000142c] = 1fe7b47f, %l4 = 59958840, %l6 = 0000004c
	add	%i0,0x2c,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 000000001fe7b47f

p0_label_54:
!	Mem[0000000010001410] = 00001b21, %l7 = ffffffffffffffff
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000001b21
!	Mem[0000000030141400] = 146409e3, %l3 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000146409e3
!	Mem[0000000010141400] = ff00009d, %l5 = 00000000d31ad138
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 00000000ff00009d
!	Mem[0000000030001410] = e925ca81, %l2 = 00000000000000aa
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 000000e9000000ff
!	Mem[00000000100c1410] = ffff19ff, %l4 = 0000000059958840
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 00000000ffff19ff
!	%l7 = 0000000000001b21, Mem[0000000010181435] = 0700bf60, %asi = 80
	stba	%l7,[%i6+0x035]%asi	! Mem[0000000010181434] = 0721bf60
!	%l3 = 00000000146409e3, Mem[0000000030081410] = 000000ff
	stba	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000e3
!	%l1 = 00000000000000ff, Mem[00000000211c0000] = ffff7f1a
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 00ff7f1a
!	%l0 = 00000000000000ff, Mem[0000000030041400] = 00000000
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 9eb37840, %l0 = 00000000000000ff
	ldsba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000040

p0_label_55:
!	%f1  = 34abf64c, %f6  = ff3ce33a, %f27 = 9eb37840
	fdivs	%f1 ,%f6 ,%f27		! %l0 = 0000000000000062, Unfinished, %fsr = 1400000800
!	Mem[0000000030041400] = 6fb2c8fe000000ff, %f16 = ffffffff 00001b21
	ldda	[%i1+%g0]0x89,%f16	! %f16 = 6fb2c8fe 000000ff
!	Mem[0000000030141400] = 8fb266f3 ff000000, %l6 = 1fe7b47f, %l7 = 00001b21
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 00000000ff000000 000000008fb266f3
!	Mem[0000000030141408] = c3f82288, %l6 = 00000000ff000000
	ldsha	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffc3f8
!	Mem[0000000030141410] = ffffffaa, %f18 = b9bd7bff
	lda	[%i5+%o5]0x81,%f18	! %f18 = ffffffaa
!	%f23 = 8185ca1e, %f12 = 34ab0000
	fcmpes	%fcc1,%f23,%f12		! %fcc1 = 1
!	Mem[0000000010001408] = 00000000, %l3 = 00000000146409e3
	lduha	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000030081400] = ffffc307 bf4f0423 e3ffffff ff7bbdb9
!	Mem[0000000030081410] = e3000000 e3889559 b2d0b9e9 77ed20db
!	Mem[0000000030081420] = 1b7f273a bbb5f751 7fb4e71f 3a206bd9
!	Mem[0000000030081430] = 4ad6903b d8ef1d65 38d11ad3 5b074475
	ldda	[%i2]ASI_BLK_AIUS,%f0	! Block Load from 0000000030081400
!	Mem[0000000021800100] = 0eff6971, %l6 = ffffffffffffc3f8
	lduh	[%o3+0x100],%l6		! %l6 = 0000000000000eff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = aaffffff, %l5 = 00000000ff00009d
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 000000ff000000ff

p0_label_56:
!	%f26 = ff800000 9eb37840, Mem[0000000030001400] = 4b567d9d 211b0000
	stda	%f26,[%i0+%g0]0x89	! Mem[0000000030001400] = ff800000 9eb37840
!	%f24 = 34abf64c, Mem[000000001018142c] = 000000e3
	sta	%f24,[%i6+0x02c]%asi	! Mem[000000001018142c] = 34abf64c
!	%l6 = 0000000000000eff, Mem[0000000030041400] = 000000ff
	stha	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000eff
!	%l3 = 0000000000000000, immed = fffff408, %y  = 00000000
	sdiv	%l3,-0xbf8,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	%l6 = 00000eff, %l7 = 8fb266f3, Mem[00000000300c1400] = 0000ab34 00000010
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000eff 8fb266f3
!	Mem[00000000300c1400] = 00000eff, %l4 = 00000000ffff19ff
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	%l3 = 0000000000000000, %l1 = 00000000000000ff, %l2 = 00000000000000e9
	orn	%l3,%l1,%l2		! %l2 = ffffffffffffff00
!	Mem[0000000030141400] = 000000ff, %l0 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%f22 = 8fb266f3 8185ca1e, %l1 = 00000000000000ff
!	Mem[0000000010141428] = 51576b07f2da102a
	add	%i5,0x028,%g1
	stda	%f22,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010141428] = 1eca8581f366b28f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 07ea19ff, %l5 = 00000000000000ff
	lduba	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_57:
!	Mem[0000000010041410] = 7d9441319f000000, %l6 = 0000000000000eff
	ldxa	[%i1+%o5]0x80,%l6	! %l6 = 7d9441319f000000
!	Mem[00000000100c1410] = 408895597e1e21ff, %l4 = 00000000000000ff
	ldxa	[%i3+%o5]0x80,%l4	! %l4 = 408895597e1e21ff
!	Mem[00000000100c1408] = 61000000, %l6 = 7d9441319f000000
	lduh	[%i3+0x00a],%l6		! %l6 = 0000000000000000
!	Mem[0000000010141408] = ff6b203a, %l3 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l3	! %l3 = 00000000ff6b203a
!	Mem[0000000030081408] = e3ffffff, %l6 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l6	! %l6 = 000000000000e3ff
!	Mem[0000000010081408] = ff00ff00, %f21 = ff7bbdb9
	lda	[%i2+%o4]0x88,%f21	! %f21 = ff00ff00
!	Mem[0000000010081408] = 00ff00ff, %l1 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%f31 = d31ad138, %f28 = 25efdb4c, %f23 = 8185ca1e
	fadds	%f31,%f28,%f23		! %f23 = d31ad138
!	%l5 = 00000000000000ff, immd = 000000000000095f, %l3 = 00000000ff6b203a
	udivx	%l5,0x95f,%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000100c1420] = 0cea217f
	sth	%l1,[%i3+0x020]		! Mem[00000000100c1420] = 0000217f

p0_label_58:
!	%l0 = 00000000000000ff, imm = 0000000000000eac, %l4 = 408895597e1e21ff
	or	%l0,0xeac,%l4		! %l4 = 0000000000000eff
!	%f20 = e925ca81, %f19 = 00000061, %f27 = 9eb37840
	fsubs	%f20,%f19,%f27		! %l0 = 0000000000000121, Unfinished, %fsr = 1500000800
!	%f20 = e925ca81 ff00ff00, %l5 = 00000000000000ff
!	Mem[0000000010041410] = 7d9441319f000000
	add	%i1,0x010,%g1
	stda	%f20,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010041410] = 00ff00ff81ca25e9
!	%l0 = 00000121, %l1 = 00000000, Mem[0000000010101410] = ff000000 ff000000
	stda	%l0,[%i4+0x010]%asi	! Mem[0000000010101410] = 00000121 00000000
!	%l6 = 000000000000e3ff, Mem[0000000030041400] = 6fb2c8fe00000eff
	stxa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000000000e3ff
!	Mem[0000000010081404] = 9eb37840, %l2 = ffffff00, %l0 = 00000121
	add	%i2,0x04,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 000000009eb37840
!	Mem[0000000010141420] = 57cecc48, %l3 = 0000000000000000, %asi = 80
	swapa	[%i5+0x020]%asi,%l3	! %l3 = 0000000057cecc48
!	%l0 = 9eb37840, %l1 = 00000000, Mem[0000000030141410] = ffffffaa 00000083
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 9eb37840 00000000
!	Mem[0000000010081410] = ffffffff, %l2 = ffffffffffffff00
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 0385c5c1, %l7 = 000000008fb266f3
	ldsba	[%o3+0x180]%asi,%l7	! %l7 = 0000000000000003

p0_label_59:
!	Mem[0000000010181400] = ff7e001323cb2b96, %f0  = ffffc307 bf4f0423
	ldda	[%i6+%g0]0x88,%f0 	! %f0  = ff7e0013 23cb2b96
!	Mem[0000000030001410] = ff25ca81, %l4 = 0000000000000eff
	lduwa	[%i0+%o5]0x81,%l4	! %l4 = 00000000ff25ca81
!	Mem[0000000030081410] = e3000000, %l7 = 0000000000000003
	lduba	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000e3
!	Mem[0000000010141410] = 0a80a3c9 599588e3, %l4 = ff25ca81, %l5 = 000000ff
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 000000000a80a3c9 00000000599588e3
!	Mem[0000000010181410] = 000000ff, %l4 = 000000000a80a3c9
	lduha	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = e10b2cff, %l7 = 00000000000000e3
	ldsba	[%i4+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1410] = ffffffff, %l5 = 00000000599588e3
	lduba	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = 00000061, %l6 = 000000000000e3ff
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000061
!	Mem[0000000010141410] = e3889559c9a3800a, %l2 = 00000000000000ff
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = e3889559c9a3800a
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 0a80a3c9, %l5 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x010]%asi,%l5	! %l5 = 000000000a80a3c9

p0_label_60:
!	%l3 = 0000000057cecc48, imm = fffffffffffff612, %l2 = e3889559c9a3800a
	xnor	%l3,-0x9ee,%l2		! %l2 = 0000000057cec5a5
!	%l5 = 000000000a80a3c9, Mem[0000000030001408] = 4078b39e3ae33cff
	stxa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000000a80a3c9
!	%f29 = 618f63d5, %f1  = 23cb2b96
	fcmps	%fcc0,%f29,%f1 		! %fcc0 = 2
!	Mem[00000000201c0001] = ffff7d80, %l6 = 0000000000000061
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	%f28 = 25efdb4c 618f63d5, %l7 = ffffffffffffffff
!	Mem[0000000030181430] = 1c581844067eee55
	add	%i6,0x030,%g1
	stda	%f28,[%g1+%l7]ASI_PST32_S ! Mem[0000000030181430] = 25efdb4c618f63d5
!	%f6  = b2d0b9e9, Mem[00000000300c1410] = ffffffff
	sta	%f6 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = b2d0b9e9
!	%l5 = 000000000a80a3c9, Mem[0000000010001410] = ffffffffffffffff
	stxa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000000a80a3c9
!	%f4  = e3000000 e3889559, %l3 = 0000000057cecc48
!	Mem[00000000300c1430] = 30a599d017a23f3c
	add	%i3,0x030,%g1
	stda	%f4,[%g1+%l3]ASI_PST8_S ! Mem[00000000300c1430] = 300099d0e3a23f3c
!	%l6 = 00000000000000ff, Mem[0000000030181400] = 00000000348dbdb9
	stxa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffffffffffff07, %f0  = ff7e0013 23cb2b96
	ldda	[%i4+%g0]0x80,%f0 	! %f0  = ffffffff ffffff07

p0_label_61:
!	Mem[0000000030001400] = ff800000 9eb37840, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 000000009eb37840 00000000ff800000
!	Mem[0000000010101410] = 0000012100000000, %l7 = 00000000ff800000
	ldx	[%i4+%o5],%l7		! %l7 = 0000012100000000
!	Mem[0000000010081400] = ff3ce33a, %l6 = 000000009eb37840
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 000000000000ff3c
!	%f13 = d8ef1d65, %f10 = 7fb4e71f, %f24 = 34abf64c 7f21ea0c
	fsmuld	%f13,%f10,%f24		! %f24 = 7ffe9ce3 e0000000
!	Mem[0000000030141410] = 4078b39e, %l5 = 000000000a80a3c9
	ldswa	[%i5+%o5]0x89,%l5	! %l5 = 000000004078b39e
!	Mem[0000000030081400] = ffffc307, %l6 = 000000000000ff3c
	lduba	[%i2+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1420] = 0000217f, %f21 = ff00ff00
	lda	[%i3+0x020]%asi,%f21	! %f21 = 0000217f
!	Mem[0000000030101400] = 0000000000000036, %f8  = 1b7f273a bbb5f751
	ldda	[%i4+%g0]0x81,%f8 	! %f8  = 00000000 00000036
!	Mem[0000000010101408] = ffffffff00001b21, %f12 = 4ad6903b d8ef1d65
	ldda	[%i4+%o4]0x80,%f12	! %f12 = ffffffff 00001b21
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 4078b39e, Mem[0000000010141430] = e8d0d8ea f34c9cd0
	stda	%l4,[%i5+0x030]%asi	! Mem[0000000010141430] = 000000ff 4078b39e

p0_label_62:
!	%l6 = 00000000000000ff, Mem[0000000010141410] = 000000ff
	stha	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00ff00ff
!	%l0 = 9eb37840, %l1 = 00000000, Mem[0000000010181410] = 000000ff 00000000
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 9eb37840 00000000
!	Mem[0000000021800040] = 059e487b, %l0 = 000000009eb37840
	ldstuba	[%o3+0x040]%asi,%l0	! %l0 = 00000005000000ff
!	Mem[0000000021800141] = ff7002f2, %l0 = 0000000000000005
	ldstub	[%o3+0x141],%l0		! %l0 = 00000070000000ff
!	%l4 = 00000000000000ff, Mem[0000000030001400] = 4078b39e
	stba	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = ff78b39e
!	%f16 = 6fb2c8fe 000000ff, Mem[0000000010001408] = 00000000 36000000
	stda	%f16,[%i0+%o4]0x88	! Mem[0000000010001408] = 6fb2c8fe 000000ff
!	Mem[00000000300c1400] = ff0e0000, %l1 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%l2 = 57cec5a5, %l3 = 57cecc48, Mem[0000000010081410] = ffffffff 34000000
	stda	%l2,[%i2+0x010]%asi	! Mem[0000000010081410] = 57cec5a5 57cecc48
!	Mem[0000000010181410] = 4078b39e, %l7 = 0000012100000000
	ldstuba	[%i6+%o5]0x80,%l7	! %l7 = 00000040000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = f64c0000, %l2 = 0000000057cec5a5
	ldswa	[%i3+%o4]0x89,%l2	! %l2 = fffffffff64c0000

p0_label_63:
!	%f11 = 3a206bd9, %f27 = 9eb37840
	fcmps	%fcc3,%f11,%f27		! %fcc3 = 2
!	Mem[000000001010140c] = 00001b21, %l0 = 0000000000000070
	ldsh	[%i4+0x00c],%l0		! %l0 = 0000000000000000
!	Mem[00000000100c1410] = ff211e7e59958840, %l4 = 00000000000000ff
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = ff211e7e59958840
!	Mem[0000000010001408] = ff000000, %l3 = 0000000057cecc48
	ldswa	[%i0+%o4]0x80,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030081410] = 000000e3, %l0 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000e3
!	Mem[0000000010041400] = 618f63d5, %l0 = 00000000000000e3
	lduha	[%i1+%g0]0x80,%l0	! %l0 = 000000000000618f
!	Mem[00000000100c1408] = 61000000, %f30 = 3988957a
	lda	[%i3+%o4]0x80,%f30	! %f30 = 61000000
!	Mem[0000000030141408] = c3f82288, %l6 = 00000000000000ff
	ldswa	[%i5+%o4]0x81,%l6	! %l6 = ffffffffc3f82288
!	Mem[0000000010001410] = c9a3800a, %f7  = 77ed20db
	lda	[%i0+%o5]0x80,%f7 	! %f7 = c9a3800a
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffff000000, Mem[0000000010001410] = 0a80a3c9
	stwa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = ff000000

p0_label_64:
!	%f29 = 618f63d5, %f24 = 7ffe9ce3, %f31 = d31ad138
	fsubs	%f29,%f24,%f31		! %f31 = 7ffe9ce3
!	%l6 = ffffffffc3f82288, Mem[00000000100c1400] = ffffffff00001b21
	stxa	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffffc3f82288
!	Mem[0000000010081408] = 00ff00ff, %l0 = 0000618f, %l2 = f64c0000
	add	%i2,0x08,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 0000000000ff00ff
!	Mem[0000000030041410] = aaab7cee, %l3 = ffffffffff000000
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 00000000aaab7cee
!	Mem[0000000010101400] = ffffffff, %l6 = ffffffffc3f82288
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010101439] = 5be863b2, %l7 = 0000000000000040
	ldstub	[%i4+0x039],%l7		! %l7 = 000000e8000000ff
!	%f20 = e925ca81 0000217f, %l4 = ff211e7e59958840
!	Mem[0000000030181408] = 9d7d564b000000ff
	add	%i6,0x008,%g1
	stda	%f20,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030181408] = 9d7d564b000025ff
	membar	#Sync			! Added by membar checker (11)
!	%l2 = 00ff00ff, %l3 = aaab7cee, Mem[0000000030081400] = 07c3ffff 23044fbf
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 00ff00ff aaab7cee
!	Mem[0000000030141400] = 00000000, %l0 = 000000000000618f
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 81ca25ff, %l3 = 00000000aaab7cee
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = ffffffffffffffff

p0_label_65:
!	Mem[00000000100c1410] = 40889559, %l6 = 00000000000000ff
	ldsha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000004088
!	Mem[0000000030001400] = 9eb378ff, %f21 = 0000217f
	lda	[%i0+%g0]0x89,%f21	! %f21 = 9eb378ff
!	Mem[0000000030001408] = 00000000, %f27 = 9eb37840
	lda	[%i0+%o4]0x89,%f27	! %f27 = 00000000
!	Mem[0000000030101408] = ff2c0be1, %l4 = ff211e7e59958840
	ldsha	[%i4+%o4]0x81,%l4	! %l4 = ffffffffffffff2c
!	Mem[0000000030081408] = ffffffe3, %l6 = 0000000000004088
	lduwa	[%i2+%o4]0x89,%l6	! %l6 = 00000000ffffffe3
!	Mem[0000000010181400] = 23cb2b96, %l3 = ffffffffffffffff
	lduwa	[%i6+%g0]0x88,%l3	! %l3 = 0000000023cb2b96
!	Mem[0000000010041408] = fff6ab34, %l4 = ffffffffffffff2c
	lduwa	[%i1+%o4]0x80,%l4	! %l4 = 00000000fff6ab34
!	Mem[000000001018141c] = 3ce8a41f, %l6 = 00000000ffffffe3
	ldub	[%i6+0x01c],%l6		! %l6 = 000000000000003c
!	Mem[0000000030141400] = 000000ff, %l1 = 00000000000000ff
	lduha	[%i5+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f16 = 6fb2c8fe 000000ff, Mem[0000000010181400] = 23cb2b96 ff7e0013
	stda	%f16,[%i6+%g0]0x88	! Mem[0000000010181400] = 6fb2c8fe 000000ff

p0_label_66:
!	Mem[000000001008143c] = f5548dc1, %l7 = 00000000000000e8
	ldstub	[%i2+0x03c],%l7		! %l7 = 000000f5000000ff
!	%f18 = ffffffaa 00000061, Mem[0000000030141410] = 9eb37840 00000000
	stda	%f18,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffaa 00000061
!	%f18 = ffffffaa 00000061, Mem[0000000030081410] = e3000000 e3889559
	stda	%f18,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffaa 00000061
!	Mem[0000000010181410] = ff78b39e, %l3 = 0000000023cb2b96
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 00000000ff78b39e
!	%l3 = 00000000ff78b39e, Mem[0000000010001410] = ff000000
	stba	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = ff00009e
!	Mem[0000000010081418] = b2d1a560144e28f2, %l3 = 00000000ff78b39e, %l4 = 00000000fff6ab34
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = b2d1a560144e28f2
!	%f12 = ffffffff 00001b21, Mem[0000000010101410] = 21010000 00000000
	stda	%f12,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff 00001b21
!	%l0 = 0000000000000000, Mem[00000000300c1408] = e3fffffff64c0000
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	%l1 = 00000000000000ff, Mem[0000000010101400] = ffffffff
	stba	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 81ca25ff, %l2 = 0000000000ff00ff
	lduwa	[%i0+%o5]0x89,%l2	! %l2 = 0000000081ca25ff

p0_label_67:
!	Mem[0000000010101420] = ff47ffa6, %l4 = b2d1a560144e28f2
	ldsw	[%i4+0x020],%l4		! %l4 = ffffffffff47ffa6
!	Mem[0000000010041410] = 00ff00ff, %l5 = 000000004078b39e
	ldsw	[%i1+%o5],%l5		! %l5 = 0000000000ff00ff
!	Mem[00000000100c1400] = 8822f8c3, %l7 = 00000000000000f5
	ldswa	[%i3+%g0]0x80,%l7	! %l7 = ffffffff8822f8c3
!	Mem[0000000030001410] = ff25ca81ff7bbdb9, %l2 = 0000000081ca25ff
	ldxa	[%i0+%o5]0x81,%l2	! %l2 = ff25ca81ff7bbdb9
!	Mem[0000000010041400] = 618f63d5, %f30 = 61000000
	lda	[%i1+%g0]0x80,%f30	! %f30 = 618f63d5
!	Mem[00000000100c1400] = 8822f8c3, %l4 = ffffffffff47ffa6
	ldsba	[%i3+0x001]%asi,%l4	! %l4 = 0000000000000022
!	Mem[0000000020800040] = dca42c25, %l4 = 0000000000000022
	lduba	[%o1+0x040]%asi,%l4	! %l4 = 00000000000000dc
!	Mem[0000000010141408] = 1e7e00003a206bff, %l7 = ffffffff8822f8c3
	ldxa	[%i5+%o4]0x88,%l7	! %l7 = 1e7e00003a206bff
!	Mem[0000000010101400] = 07ffffffffffffff, %l2 = ff25ca81ff7bbdb9
	ldxa	[%i4+%g0]0x88,%l2	! %l2 = 07ffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 07ffffffffffffff, Mem[0000000010181408] = e3096414
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = ff096414

p0_label_68:
!	Mem[0000000030001410] = 81ca25ff, %l6 = 000000000000003c
	ldstuba	[%i0+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[0000000030041410] = 000000ff
	stha	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	Mem[0000000010081410] = a5c5ce57, %l2 = 07ffffffffffffff
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 00000000a5c5ce57
!	%f10 = 7fb4e71f, %f5  = e3889559, %f6  = b2d0b9e9
	fadds	%f10,%f5 ,%f6 		! %f6  = 7ff4e71f
!	Mem[0000000010181400] = 000000ff, %l3 = 00000000ff78b39e
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141410] = ff00ff00, %l4 = 00000000000000dc
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 00000000ff00ff00
!	Mem[0000000010041434] = 000000f8, %l6 = 00000000000000ff
	swap	[%i1+0x034],%l6		! %l6 = 00000000000000f8
!	Mem[00000000100c1410] = 40889559, %l1 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 00000040000000ff
!	%l2 = 00000000a5c5ce57, Mem[00000000211c0000] = 00ff7f1a, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 57ff7f1a
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000ff, %l1 = 0000000000000040
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 00000000000000ff

p0_label_69:
!	Mem[000000001018141c] = 3ce8a41f, %l1 = 00000000000000ff
	lduwa	[%i6+0x01c]%asi,%l1	! %l1 = 000000003ce8a41f
	membar	#Sync			! Added by membar checker (12)
!	Mem[00000000100c1400] = 8822f8c3 ffffffff 61000000 ff7bbdb9
!	Mem[00000000100c1410] = ff889559 7e1e21ff 1eca8581 f366b2ff
!	Mem[00000000100c1420] = 0000217f 4cf6ab34 4078b39e 3ae33c36
!	Mem[00000000100c1430] = d5638f61 6100b66f 38d11ad3 7a958839
	ldda	[%i3]ASI_BLK_AIUP,%f0	! Block Load from 00000000100c1400
!	Mem[0000000030181400] = 00000000, %l7 = 1e7e00003a206bff
	lduha	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 00001b21, %f21 = 9eb378ff
	lda	[%i4+%o5]0x88,%f21	! %f21 = 00001b21
!	%l2 = 00000000a5c5ce57, imm = fffffffffffff781, %l0 = 0000000000000000
	and	%l2,-0x87f,%l0		! %l0 = 00000000a5c5c601
!	Mem[000000001014143c] = 00003016, %l3 = 00000000000000ff
	ldsw	[%i5+0x03c],%l3		! %l3 = 0000000000003016
!	Mem[0000000010101410] = 211b0000 ffffffff, %l6 = 000000f8, %l7 = 00000000
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 00000000211b0000 00000000ffffffff
!	%f23 = d31ad138, %f16 = 6fb2c8fe, %f30 = 618f63d5
	fsubs	%f23,%f16,%f30		! %f30 = efb2c8fe
!	Mem[0000000030101410] = b5b7947d, %l6 = 00000000211b0000
	lduha	[%i4+%o5]0x89,%l6	! %l6 = 000000000000947d
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ffffffff, immed = 000000d5, %y  = 00000000
	smul	%l7,0x0d5,%l3		! %l3 = ffffffffffffff2b, %y = ffffffff

p0_label_70:
!	%f29 = 618f63d5, Mem[000000001008140c] = 7f21ea0c
	sta	%f29,[%i2+0x00c]%asi	! Mem[000000001008140c] = 618f63d5
!	Mem[0000000030001410] = 81ca25ff, %l3 = ffffffffffffff2b
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%l7 = 00000000ffffffff, Mem[0000000010001410] = ff00009e
	stha	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = ff00ffff
!	%l4 = 00000000ff00ff00, Mem[00000000201c0000] = ffff7d80, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff7d80
!	%l1 = 000000003ce8a41f, Mem[0000000010181412] = 23cb2b96
	sth	%l1,[%i6+0x012]		! Mem[0000000010181410] = 23cba41f
!	%l4 = 00000000ff00ff00, Mem[0000000010041410] = ff00ff00
	stba	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = ff00ff00
!	%f26 = ff800000, Mem[0000000030001410] = 81ca25ff
	sta	%f26,[%i0+%o5]0x89	! Mem[0000000030001410] = ff800000
!	Mem[0000000010181400] = ff78b39e, %l7 = 00000000ffffffff
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 00000000ff78b39e
	membar	#Sync			! Added by membar checker (13)
!	%l6 = 000000000000947d, Mem[00000000100c1408] = 00000061
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000947d
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = e3ffffff, %l0 = 00000000a5c5c601
	ldswa	[%i2+%o4]0x81,%l0	! %l0 = ffffffffe3ffffff

p0_label_71:
!	Mem[0000000010101408] = 211b0000ffffffff, %f0  = 8822f8c3 ffffffff
	ldda	[%i4+%o4]0x88,%f0 	! %f0  = 211b0000 ffffffff
!	Mem[0000000030081408] = b9bd7bffffffffe3, %f22 = 8fb266f3 d31ad138
	ldda	[%i2+%o4]0x89,%f22	! %f22 = b9bd7bff ffffffe3
!	Mem[0000000030141400] = ff000000f366b28f, %f12 = d5638f61 6100b66f
	ldda	[%i5+%g0]0x81,%f12	! %f12 = ff000000 f366b28f
!	Mem[0000000030141400] = ff000000, %l0 = ffffffffe3ffffff
	lduwa	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	%l6 = 000000000000947d, immed = 000008a7, %y  = ffffffff
	smul	%l6,0x8a7,%l1		! %l1 = 000000000504c58b, %y = 00000000
!	Mem[0000000030101400] = 00000000, %l0 = 00000000ff000000
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 00001b21, %l0 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l0	! %l0 = 0000000000001b21
!	Mem[0000000010141410] = dc000000, %l5 = 0000000000ff00ff
	lduw	[%i5+%o5],%l5		! %l5 = 00000000dc000000
!	Mem[0000000030181408] = 9d7d564b, %l1 = 000000000504c58b
	lduwa	[%i6+%o4]0x81,%l1	! %l1 = 000000009d7d564b
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = aaffffff, %l0 = 0000000000001b21
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 00000000aaffffff

p0_label_72:
!	%f12 = ff000000 f366b28f, Mem[0000000010181428] = 00000000 34abf64c
	stda	%f12,[%i6+0x028]%asi	! Mem[0000000010181428] = ff000000 f366b28f
!	Mem[0000000010001410] = ff00ffff, %l2 = 00000000a5c5ce57
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 00000000ff00ffff
!	%l6 = 000000000000947d, Mem[0000000030141400] = ff000000
	stba	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 7d000000
!	%l5 = 00000000dc000000, Mem[0000000010141400] = d31ad138
	stba	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 001ad138
!	%l6 = 000000000000947d, Mem[0000000030141408] = c3f82288
	stha	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 947d2288
!	%l6 = 000000000000947d, Mem[0000000030081410] = 211b0000
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 947d0000
!	%f0  = 211b0000 ffffffff 61000000 ff7bbdb9
!	%f4  = ff889559 7e1e21ff 1eca8581 f366b2ff
!	%f8  = 0000217f 4cf6ab34 4078b39e 3ae33c36
!	%f12 = ff000000 f366b28f 38d11ad3 7a958839
	stda	%f0,[%i2]ASI_BLK_P	! Block Store to 0000000010081400
!	%l4 = 00000000ff00ff00, Mem[0000000021800101] = 0eff6971, %asi = 80
	stba	%l4,[%o3+0x101]%asi	! Mem[0000000021800100] = 0e006971
!	Mem[0000000030181400] = 00000000, %l5 = 00000000dc000000
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = aaffffff, %l0 = 00000000aaffffff
	ldswa	[%i5+%o5]0x89,%l0	! %l0 = ffffffffaaffffff

p0_label_73:
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010081410] = ff889559, %l2 = 00000000ff00ffff
	ldswa	[%i2+%o5]0x80,%l2	! %l2 = ffffffffff889559
!	Mem[0000000030001400] = ff78b39e 000080ff, %l6 = 0000947d, %l7 = ff78b39e
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 00000000ff78b39e 00000000000080ff
!	Mem[0000000030101400] = 00000000, %l6 = 00000000ff78b39e
	ldswa	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %l7 = 00000000000080ff
	ldswa	[%i6+%o5]0x81,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010181408] = 146409ff, %l1 = 000000009d7d564b
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 00000000146409ff
!	Mem[00000000100c1400] = 8822f8c3 ffffffff, %l2 = ff889559, %l3 = 000000ff
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 000000008822f8c3 00000000ffffffff
!	Mem[0000000030141408] = 947d2288 4844c554, %l0 = aaffffff, %l1 = 146409ff
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000947d2288 000000004844c554
!	Mem[0000000010101408] = ffffffff00001b21, %f6  = 1eca8581 f366b2ff
	ldda	[%i4+0x008]%asi,%f6 	! %f6  = ffffffff 00001b21
!	Mem[0000000030041408] = 07ea19ff, %l4 = 00000000ff00ff00
	ldsha	[%i1+%o4]0x89,%l4	! %l4 = 00000000000019ff
!	Starting 10 instruction Store Burst
!	Mem[000000001010140c] = 00001b21, %l0 = 00000000947d2288
	ldstuba	[%i4+0x00c]%asi,%l0	! %l0 = 00000000000000ff

p0_label_74:
!	%f20 = e925ca81, Mem[0000000030181410] = 000000ff
	sta	%f20,[%i6+%o5]0x89	! Mem[0000000030181410] = e925ca81
!	%l5 = 0000000000000000, Mem[0000000010001410] = 57cec5a500000000
	stxa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	%l4 = 00000000000019ff, imm = fffffffffffffa07, %l3 = 00000000ffffffff
	andn	%l4,-0x5f9,%l3		! %l3 = 00000000000001f8
!	%f17 = 000000ff, Mem[00000000300c1400] = 00000eff
	sta	%f17,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	Mem[0000000030081408] = e3ffffff, %l7 = ffffffffff000000
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 00000000e3ffffff
!	%f8  = 0000217f 4cf6ab34, %l2 = 000000008822f8c3
!	Mem[0000000030081408] = ff000000ff7bbdb9
	add	%i2,0x008,%g1
	stda	%f8,[%g1+%l2]ASI_PST32_S ! Mem[0000000030081408] = 0000217f4cf6ab34
!	Mem[0000000021800181] = 0385c5c1, %l6 = 0000000000000000
	ldstuba	[%o3+0x181]%asi,%l6	! %l6 = 00000085000000ff
!	%l5 = 0000000000000000, Mem[000000001014140c] = 00007e1e, %asi = 80
	stwa	%l5,[%i5+0x00c]%asi	! Mem[000000001014140c] = 00000000
!	%l7 = 00000000e3ffffff, Mem[0000000030041400] = 0000e3ff
	stba	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000e3ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ffe3000000000000, %l7 = 00000000e3ffffff
	ldxa	[%i1+%g0]0x81,%l7	! %l7 = ffe3000000000000

p0_label_75:
!	Mem[0000000010141400] = 001ad138, %l4 = 00000000000019ff
	lduwa	[%i5+%g0]0x80,%l4	! %l4 = 00000000001ad138
!	Mem[0000000030101410] = b5b7947d, %l6 = 0000000000000085
	lduba	[%i4+%o5]0x89,%l6	! %l6 = 000000000000007d
!	Mem[0000000030141410] = aaffffff, %l4 = 00000000001ad138
	ldsba	[%i5+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = ff6b203a, %f24 = 7ffe9ce3
	lda	[%i5+%o4]0x80,%f24	! %f24 = ff6b203a
!	Mem[0000000030041410] = ff000000 3aaf1e0b, %l2 = 8822f8c3, %l3 = 000001f8
	ldda	[%i1+%o5]0x81,%l2	! %l2 = 00000000ff000000 000000003aaf1e0b
!	Mem[0000000030101410] = b5b7947d, %l0 = 0000000000000000
	ldsba	[%i4+%o5]0x89,%l0	! %l0 = 000000000000007d
!	Mem[000000001008143c] = 7a958839, %l5 = 0000000000000000
	ldsb	[%i2+0x03f],%l5		! %l5 = 0000000000000039
!	Mem[0000000010081410] = ff889559, %f28 = 25efdb4c
	lda	[%i2+0x010]%asi,%f28	! %f28 = ff889559
!	Mem[0000000030181408] = 4b567d9d, %l4 = ffffffffffffffff
	ldsha	[%i6+%o4]0x89,%l4	! %l4 = 0000000000007d9d
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = 57ff7f1a, %l5 = 0000000000000039
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 00000057000000ff

p0_label_76:
!	Mem[0000000010141420] = 00000000, %l6 = 000000000000007d
	ldstuba	[%i5+0x020]%asi,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[00000000100c1410] = ff889559 7e1e21ff
	std	%l6,[%i3+%o5]		! Mem[00000000100c1410] = 00000000 00000000
!	Mem[0000000010041400] = 618f63d5, %l2 = 00000000ff000000
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 00000061000000ff
!	%l3 = 000000003aaf1e0b, immed = 00000129, %y  = 00000000
	udiv	%l3,0x129,%l1		! %l1 = 0000000000329538
	mov	%l0,%y			! %y = 0000007d
!	%f3  = ff7bbdb9, Mem[0000000010041410] = ff00ff00
	sta	%f3 ,[%i1+%o5]0x88	! Mem[0000000010041410] = ff7bbdb9
!	%l4 = 00007d9d, %l5 = 00000057, Mem[0000000010001400] = 40889559 38d11ad3
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00007d9d 00000057
!	%l3 = 000000003aaf1e0b, Mem[0000000010081408] = 00000061
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000000b
!	%f9  = 4cf6ab34, Mem[0000000030141400] = 0000007d
	sta	%f9 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 4cf6ab34
!	%l5 = 0000000000000057, Mem[0000000010141408] = ff6b203a
	stwa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000057
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00007d9d, %l2 = 0000000000000061
	ldsba	[%i0+%g0]0x88,%l2	! %l2 = ffffffffffffff9d

p0_label_77:
!	Mem[0000000010081410] = ff889559, %l3 = 000000003aaf1e0b
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101410] = 00001b21, %f1  = ffffffff
	lda	[%i4+%o5]0x88,%f1 	! %f1 = 00001b21
!	Mem[0000000021800140] = ffff02f2, %l0 = 000000000000007d
	lduh	[%o3+0x140],%l0		! %l0 = 000000000000ffff
!	%l6 = 0000000000000000, %l2 = ffffffffffffff9d, %l2 = ffffffffffffff9d
	sdivx	%l6,%l2,%l2		! Div by zero, %l0 = 0000000000010027
!	Mem[0000000010101408] = ffffffffff001b21, %l1 = 0000000000329538
	ldxa	[%i4+0x008]%asi,%l1	! %l1 = ffffffffff001b21
!	Mem[0000000030081400] = ff00ff00, %l1 = ffffffffff001b21
	lduha	[%i2+%g0]0x81,%l1	! %l1 = 000000000000ff00
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 000000000000ffff
	setx	0x7b99e758080e1619,%g7,%l0 ! %l0 = 7b99e758080e1619
!	%l1 = 000000000000ff00
	setx	0xcc98ec479c7347e5,%g7,%l1 ! %l1 = cc98ec479c7347e5
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7b99e758080e1619
	setx	0x8fbe568037161ca5,%g7,%l0 ! %l0 = 8fbe568037161ca5
!	%l1 = cc98ec479c7347e5
	setx	0x308d179000dff685,%g7,%l1 ! %l1 = 308d179000dff685
!	Mem[000000001018142c] = f366b28f, %l1 = 308d179000dff685
	ldsba	[%i6+0x02c]%asi,%l1	! %l1 = fffffffffffffff3
!	Mem[0000000010101408] = ffffffff, %l3 = 00000000000000ff
	lduwa	[%i4+%o4]0x80,%l3	! %l3 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%f8  = 0000217f 4cf6ab34, Mem[0000000010141408] = 57000000 00000000
	stda	%f8 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000217f 4cf6ab34

p0_label_78:
!	%f24 = ff6b203a, Mem[0000000010001410] = 00000000
	sta	%f24,[%i0+0x010]%asi	! Mem[0000000010001410] = ff6b203a
!	%l0 = 8fbe568037161ca5, Mem[0000000030181400] = dc000000
	stwa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 37161ca5
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000010181430] = e925ca81 0721bf60
	std	%l2,[%i6+0x030]		! Mem[0000000010181430] = 00000000 ffffffff
!	Mem[0000000030001408] = 00000000, %l7 = ffe3000000000000
	swapa	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030041408] = ff19ea07 57cecc48
	stda	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[00000000201c0001] = 00ff7d80, %asi = 80
	stba	%l7,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00007d80
!	Mem[0000000010081430] = ff000000, %l4 = 0000000000007d9d
	swap	[%i2+0x030],%l4		! %l4 = 00000000ff000000
!	%l3 = 00000000ffffffff, Mem[0000000010081418] = 1eca8581, %asi = 80
	stba	%l3,[%i2+0x018]%asi	! Mem[0000000010081418] = ffca8581
!	%l7 = 0000000000000000, %l2 = 0000000000000000, %l7 = 0000000000000000
	xor	%l7,%l2,%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = e9b9d0b2, %l7 = 0000000000000000
	ldsha	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffd0b2

p0_label_79:
!	Mem[0000000010101400] = ffffffff, %l1 = fffffffffffffff3
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041400] = d5638fff, %l6 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l6	! %l6 = 0000000000008fff
!	Mem[000000001018141c] = 3ce8a41f, %l3 = 00000000ffffffff
	ldsb	[%i6+0x01f],%l3		! %l3 = 000000000000001f
!	Mem[0000000010101400] = ffffffff, %l1 = 00000000000000ff
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 000000000000ffff
!	%f16 = 6fb2c8fe, %f26 = ff800000, %f14 = 38d11ad3 7a958839
	fsmuld	%f16,%f26,%f14		! %f14 = fff00000 00000000
!	Mem[00000000300c1408] = 00000000, %l4 = 00000000ff000000
	lduba	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 211b0000, %l7 = ffffffffffffd0b2
	lduwa	[%i4+%o5]0x80,%l7	! %l7 = 00000000211b0000
!	Mem[0000000030141410] = aaffffff, %l7 = 00000000211b0000
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030081400] = ff00ff00, %l1 = 000000000000ffff
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030001408] = 00000000
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000

p0_label_80:
!	%f22 = b9bd7bff ffffffe3, Mem[0000000010181400] = ffffffff fec8b26f
	std	%f22,[%i6+%g0]	! Mem[0000000010181400] = b9bd7bff ffffffe3
!	%l4 = 0000000000000000, Mem[0000000010001406] = 57000000
	sth	%l4,[%i0+0x006]		! Mem[0000000010001404] = 57000000
!	%l3 = 000000000000001f, Mem[0000000010101400] = ffffffffffffff07
	stxa	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000000000001f
!	Mem[0000000010041424] = ffffffff, %l3 = 000000000000001f
	ldstub	[%i1+0x024],%l3		! %l3 = 000000ff000000ff
!	%l1 = ffffffffffffffff, Mem[0000000010081420] = 0000217f4cf6ab34
	stx	%l1,[%i2+0x020]		! Mem[0000000010081420] = ffffffffffffffff
!	%f18 = ffffffaa 00000061, %l1 = ffffffffffffffff
!	Mem[0000000010101418] = 296e6adc09ee7bef
	add	%i4,0x018,%g1
	stda	%f18,[%g1+%l1]ASI_PST8_P ! Mem[0000000010101418] = ffffffaa00000061
!	%l1 = ffffffffffffffff, Mem[0000000010001408] = ff000000fec8b26f
	stx	%l1,[%i0+%o4]		! Mem[0000000010001408] = ffffffffffffffff
!	Mem[0000000030041400] = 0000e3ff, %l6 = 0000000000008fff
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000211c0001] = ffff7f1a, %l3 = 00000000000000ff
	ldstub	[%o2+0x001],%l3		! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 8fbe568037161ca5
	setx	0xfc09cdf86279f7be,%g7,%l0 ! %l0 = fc09cdf86279f7be
!	%l1 = ffffffffffffffff
	setx	0x94be0f8843397cda,%g7,%l1 ! %l1 = 94be0f8843397cda
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fc09cdf86279f7be
	setx	0x60753287a1f3e6d9,%g7,%l0 ! %l0 = 60753287a1f3e6d9
!	%l1 = 94be0f8843397cda
	setx	0x6770eec7b2c3cb32,%g7,%l1 ! %l1 = 6770eec7b2c3cb32

p0_label_81:
!	Mem[0000000010141400] = 146409e338d11a00, %f22 = b9bd7bff ffffffe3
	ldda	[%i5+%g0]0x88,%f22	! %f22 = 146409e3 38d11a00
!	Mem[0000000030181410] = e925ca81, %f29 = 618f63d5
	lda	[%i6+%o5]0x89,%f29	! %f29 = e925ca81
!	Mem[0000000010081408] = 0b000000, %l0 = 60753287a1f3e6d9
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 000000000b000000
!	Mem[0000000010141408] = 34abf64c, %l0 = 000000000b000000
	ldsha	[%i5+%o4]0x80,%l0	! %l0 = 00000000000034ab
!	Mem[0000000010101410] = 211b0000, %f7  = 00001b21
	lda	[%i4+%o5]0x80,%f7 	! %f7 = 211b0000
!	Mem[0000000010101410] = 00001b21, %f17 = 000000ff
	lda	[%i4+%o5]0x88,%f17	! %f17 = 00001b21
!	Mem[0000000010081428] = 4078b39e, %l5 = 0000000000000057
	lduba	[%i2+0x028]%asi,%l5	! %l5 = 0000000000000040
!	Mem[0000000030181410] = 81ca25e9, %f7  = 211b0000
	lda	[%i6+%o5]0x81,%f7 	! %f7 = 81ca25e9
!	Mem[000000001010143c] = 0000000a, %l0 = 00000000000034ab
	ldsha	[%i4+0x03e]%asi,%l0	! %l0 = 000000000000000a
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 001ad138, %l4 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 00000000001ad138

p0_label_82:
!	Mem[00000000100c1428] = 4078b39e, %l4 = 00000000001ad138, %asi = 80
	swapa	[%i3+0x028]%asi,%l4	! %l4 = 000000004078b39e
!	%f15 = 00000000, Mem[00000000100c1408] = 7d940000
	sta	%f15,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010001403] = 9d7d0000, %l5 = 0000000000000040
	ldstuba	[%i0+0x003]%asi,%l5	! %l5 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030041400] = ffe30000
	stwa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%f7  = 81ca25e9, Mem[0000000030081400] = ff00ff00
	sta	%f7 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 81ca25e9
!	Mem[00000000300c1400] = ff000000, %l3 = 00000000000000ff
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010041408] = 6100000034abf6ff
	stxa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000000000ff
!	%f24 = ff6b203a e0000000, Mem[0000000030101410] = b5b7947d 5c2b7397
	stda	%f24,[%i4+%o5]0x89	! Mem[0000000030101410] = ff6b203a e0000000
!	Mem[0000000010141400] = 00000000, %l4 = 000000004078b39e
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (15)
!	Mem[00000000100c1400] = 8822f8c3 ffffffff 00000000 ff7bbdb9
!	Mem[00000000100c1410] = 00000000 00000000 1eca8581 f366b2ff
!	Mem[00000000100c1420] = 0000217f 4cf6ab34 001ad138 3ae33c36
!	Mem[00000000100c1430] = d5638f61 6100b66f 38d11ad3 7a958839
	ldda	[%i3]ASI_BLK_PL,%f0	! Block Load from 00000000100c1400

p0_label_83:
!	%f29 = e925ca81, %f18 = ffffffaa, %f17 = 00001b21
	fadds	%f29,%f18,%f17		! %f17 = ffffffaa
!	Mem[000000001014142c] = f366b28f, %l1 = 6770eec7b2c3cb32
	ldsh	[%i5+0x02e],%l1		! %l1 = ffffffffffffb28f
!	Mem[00000000300c1400] = ff000000 f366b28f 00000000 00000000
!	Mem[00000000300c1410] = b2d0b9e9 ffffffff 246db67a cf1cf644
!	Mem[00000000300c1420] = 146409e3 f366b28f 0231cc40 2e0610dc
!	Mem[00000000300c1430] = 300099d0 e3a23f3c 7ccdbb31 e90439af
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030041410] = 000000ff, %l6 = 00000000000000ff
	lduha	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = 37161ca5, %l0 = 000000000000000a
	ldsba	[%i6+%g0]0x89,%l0	! %l0 = ffffffffffffffa5
!	Mem[0000000010141410] = 000000dc, %l0 = ffffffffffffffa5
	lduwa	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000dc
!	Mem[00000000100c142c] = 3ae33c36, %l2 = 0000000000000000
	lduwa	[%i3+0x02c]%asi,%l2	! %l2 = 000000003ae33c36
!	Mem[0000000020800000] = 89bf16cb, %l6 = 0000000000000000
	ldub	[%o1+0x001],%l6		! %l6 = 00000000000000bf
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, %l0 = 00000000000000dc, %y  = 0000007d
	sdiv	%l5,%l0,%l0		! %l0 = 000000007fffffff
	mov	%l0,%y			! %y = 7fffffff

p0_label_84:
!	Mem[00000000100c1414] = 00000000, %l0 = 7fffffff, %l3 = 000000ff
	add	%i3,0x14,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 0000000000000000
!	%l6 = 00000000000000bf, Mem[0000000010001408] = ffffffff
	stha	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = ffff00bf
!	%f6  = ffb266f3 8185ca1e, %l3 = 0000000000000000
!	Mem[0000000030101438] = dcf36edecf55fcc6
	add	%i4,0x038,%g1
	stda	%f6,[%g1+%l3]ASI_PST32_S ! Mem[0000000030101438] = dcf36edecf55fcc6
!	%f2  = b9bd7bff 00000000, %l6 = 00000000000000bf
!	Mem[0000000030001400] = ff78b39e000080ff
	stda	%f2,[%i0+%l6]ASI_PST16_SL ! Mem[0000000030001400] = 00000000ff7bbdb9
!	%l5 = 0000000000000000, Mem[0000000030141400] = 4cf6ab34
	stba	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 4cf6ab00
	membar	#Sync			! Added by membar checker (16)
!	%f2  = b9bd7bff, Mem[00000000300c1410] = b2d0b9e9
	sta	%f2 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = b9bd7bff
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = 000000e0, %l0 = 000000007fffffff
	ldstuba	[%i4+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = b9bd7bffffffffe3, %l3 = 0000000000000000, %l1 = ffffffffffffb28f
	casxa	[%i6]0x80,%l3,%l1	! %l1 = b9bd7bffffffffe3
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffff00bf, %l3 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 00000000000000bf

p0_label_85:
!	Mem[0000000010181404] = ffffffe3, %l1 = b9bd7bffffffffe3
	lduh	[%i6+0x006],%l1		! %l1 = 000000000000ffe3
!	Mem[0000000010081408] = 0b000000ff7bbdb9, %f2  = b9bd7bff 00000000
	ldda	[%i2+%o4]0x80,%f2 	! %f2  = 0b000000 ff7bbdb9
!	Mem[0000000030001400] = 00000000, %l2 = 000000003ae33c36
	lduwa	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l1 = 000000000000ffe3
	ldsba	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081408] = 0b000000ff7bbdb9, %f22 = 246db67a cf1cf644
	ldda	[%i2+%o4]0x80,%f22	! %f22 = 0b000000 ff7bbdb9
!	Mem[0000000010001408] = ffff00bf, %f2  = 0b000000
	lda	[%i0+%o4]0x88,%f2 	! %f2 = ffff00bf
!	%l0 = 0000000000000000, Mem[0000000030081410] = 00007d94
	stha	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[0000000010001408] = ffffffffffff00bf, %f8  = 34abf64c 7f210000
	ldda	[%i0+%o4]0x88,%f8 	! %f8  = ffffffff ffff00bf
!	Starting 10 instruction Store Burst
!	%f18 = 00000000 00000000, Mem[0000000030081408] = 7f210000 34abf64c
	stda	%f18,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 00000000

p0_label_86:
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030181410] = e925ca81 a50a6e46
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 00000000
!	%f0  = ffffffff c3f82288 ffff00bf ff7bbdb9
!	%f4  = 00000000 00000000 ffb266f3 8185ca1e
!	%f8  = ffffffff ffff00bf 363ce33a 38d11a00
!	%f12 = 6fb60061 618f63d5 3988957a d31ad138
	stda	%f0,[%i6]ASI_BLK_P	! Block Store to 0000000010181400
!	%f16 = ff000000 f366b28f 00000000 00000000
!	%f20 = b2d0b9e9 ffffffff 0b000000 ff7bbdb9
!	%f24 = 146409e3 f366b28f 0231cc40 2e0610dc
!	%f28 = 300099d0 e3a23f3c 7ccdbb31 e90439af
	stda	%f16,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	Mem[00000000300c1408] = 00000000, %l3 = 00000000000000bf
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030181400] = 37161ca5 ff000000
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 00000000
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 0000000000000000
	setx	0xf8d6a0b058bb5c1c,%g7,%l0 ! %l0 = f8d6a0b058bb5c1c
!	%l1 = 0000000000000000
	setx	0xb50d0b7790916cac,%g7,%l1 ! %l1 = b50d0b7790916cac
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f8d6a0b058bb5c1c
	setx	0x32e5f057ffe24b02,%g7,%l0 ! %l0 = 32e5f057ffe24b02
!	%l1 = b50d0b7790916cac
	setx	0xd1c2a628370fc3e4,%g7,%l1 ! %l1 = d1c2a628370fc3e4
!	Mem[0000000030081408] = 00000000, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%l7 = 000000000000ffff, Mem[0000000010181408] = b9bd7bffbf00ffff
	stxa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000000000ffff
!	%l2 = 00000000000000ff, immed = 0000007f, %y  = 7fffffff
	umul	%l2,0x07f,%l6		! %l6 = 0000000000007e81, %y = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 947d2288, %l1 = d1c2a628370fc3e4
	ldsba	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffffff94

p0_label_87:
!	Mem[0000000030181410] = 0000000000000000, %f10 = 363ce33a 38d11a00
	ldda	[%i6+%o5]0x89,%f10	! %f10 = 00000000 00000000
!	Mem[0000000020800000] = 89bf16cb, %l5 = 0000000000000000
	ldub	[%o1+%g0],%l5		! %l5 = 0000000000000089
!	Mem[0000000030181408] = 4b567d9d, %l4 = 0000000000000000
	ldsba	[%i6+%o4]0x89,%l4	! %l4 = ffffffffffffff9d
!	Mem[00000000100c1400] = 8822f8c3ffffffff, %f6  = ffb266f3 8185ca1e
	ldda	[%i3+%g0]0x80,%f6 	! %f6  = 8822f8c3 ffffffff
!	Mem[0000000010081408] = 0b000000, %f11 = 00000000
	lda	[%i2+%o4]0x80,%f11	! %f11 = 0b000000
!	Mem[0000000030041400] = 0000000000000000, %l1 = ffffffffffffff94
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l4 = ffffffffffffff9d
	lduwa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l3 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141400] = 4cf6ab00, %l4 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l4	! %l4 = 000000004cf6ab00
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000300c1400] = 000000ff
	stba	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000

p0_label_88:
!	%l5 = 0000000000000089, Mem[0000000010181408] = 0000ffff
	stba	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000ff89
!	%l0 = 32e5f057ffe24b02, Mem[0000000021800141] = ffff02f2, %asi = 80
	stba	%l0,[%o3+0x141]%asi	! Mem[0000000021800140] = ff0202f2
!	Mem[000000001004141c] = b94892de, %l0 = ffe24b02, %l7 = 0000ffff
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 00000000b94892de
!	Mem[00000000100c1410] = 00000000, %l0 = 32e5f057ffe24b02
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010001434] = e3a23f3c, %l4 = 4cf6ab00, %l2 = 000000ff
	add	%i0,0x34,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000e3a23f3c
!	%f25 = f366b28f, %f9  = ffff00bf, %f5  = 00000000
	fsubs	%f25,%f9 ,%f5 		! %f5  = ffff00bf
!	%l7 = 00000000b94892de, Mem[0000000010041408] = ff000000
	stwa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = b94892de
!	%f30 = 7ccdbb31 e90439af, %l2 = 00000000e3a23f3c
!	Mem[0000000030141418] = 4b567d9dfec8b26f
	add	%i5,0x018,%g1
	stda	%f30,[%g1+%l2]ASI_PST8_S ! Mem[0000000030141418] = 4b56bb31e904b26f
!	%l6 = 0000000000007e81, imm = fffffffffffff1da, %l2 = 00000000e3a23f3c
	xnor	%l6,-0xe26,%l2		! %l2 = 00000000000070a4
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %f21 = ffffffff
	lda	[%i2+%o5]0x89,%f21	! %f21 = 00000000

p0_label_89:
!	Mem[0000000010101400] = 000000000000001f, %f6  = 8822f8c3 ffffffff
	ldda	[%i4+%g0]0x80,%f6 	! %f6  = 00000000 0000001f
!	Mem[0000000030101408] = ff2c0be1 9be7fe7e, %l6 = 00007e81, %l7 = b94892de
	ldda	[%i4+%o4]0x81,%l6	! %l6 = 00000000ff2c0be1 000000009be7fe7e
!	%l6 = 00000000ff2c0be1, immed = 000002a2, %y  = 00000000
	smul	%l6,0x2a2,%l1		! %l1 = fffffffdd1f74662, %y = fffffffd
!	%l4 = 000000004cf6ab00, imm = fffffffffffff320, %l3 = 00000000000000ff
	andn	%l4,-0xce0,%l3		! %l3 = 0000000000000800
!	Mem[0000000030141408] = 947d2288, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffff947d
!	Mem[00000000100c1428] = 001ad1383ae33c36, %f22 = 0b000000 ff7bbdb9
	ldda	[%i3+0x028]%asi,%f22	! %f22 = 001ad138 3ae33c36
!	Mem[00000000300c1410] = ffffffffff7bbdb9, %f10 = 00000000 0b000000
	ldda	[%i3+%o5]0x89,%f10	! %f10 = ffffffff ff7bbdb9
!	Mem[00000000300c1400] = 8fb266f300000000, %l2 = 00000000000070a4
	ldxa	[%i3+%g0]0x89,%l2	! %l2 = 8fb266f300000000
!	Mem[00000000300c1400] = 00000000, %l1 = fffffffdd1f74662
	lduba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800040] = ff9e487b, %l2 = 8fb266f300000000
	ldstub	[%o3+0x040],%l2		! %l2 = 000000ff000000ff

p0_label_90:
!	%f0  = ffffffff, Mem[0000000010041400] = ff8f63d5
	sta	%f0 ,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffff
!	%l2 = 00000000000000ff, Mem[00000000100c1418] = 1eca8581f366b2ff
	stx	%l2,[%i3+0x018]		! Mem[00000000100c1418] = 00000000000000ff
!	%l4 = 000000004cf6ab00, %l2 = 00000000000000ff, %l7 = 000000009be7fe7e
	xor	%l4,%l2,%l7		! %l7 = 000000004cf6abff
!	%f22 = 001ad138 3ae33c36, Mem[0000000010101400] = 00000000 1f000000
	stda	%f22,[%i4+%g0]0x88	! Mem[0000000010101400] = 001ad138 3ae33c36
!	Mem[00000000211c0001] = ffff7f1a, %l0 = ffffffffffff947d
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010081408] = 0b000000, %l3 = 0000000000000800
	ldstuba	[%i2+0x008]%asi,%l3	! %l3 = 0000000b000000ff
!	%f10 = ffffffff ff7bbdb9, %l2 = 00000000000000ff
!	Mem[0000000010081438] = 38d11ad37a958839
	add	%i2,0x038,%g1
	stda	%f10,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010081438] = b9bd7bffffffffff
!	Mem[00000000211c0001] = ffff7f1a, %l5 = 0000000000000089
	ldstub	[%o2+0x001],%l5		! %l5 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000010181408] = 89ff000000000000
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 81ca25e9 ee7cabaa, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 0000000081ca25e9 00000000ee7cabaa

p0_label_91:
!	Mem[0000000010101410] = 211b0000, %l7 = 000000004cf6abff
	lduba	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000021
!	Mem[0000000030141400] = 4cf6ab00, %l0 = 0000000081ca25e9
	ldsha	[%i5+%g0]0x89,%l0	! %l0 = ffffffffffffab00
!	Mem[0000000010181400] = ffffffff, %l7 = 0000000000000021
	lduwa	[%i6+%g0]0x88,%l7	! %l7 = 00000000ffffffff
!	Mem[00000000201c0000] = 00007d80, %l4 = 000000004cf6ab00
	ldub	[%o0+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000030101410] = e00000ff, %l0 = ffffffffffffab00
	ldswa	[%i4+%o5]0x89,%l0	! %l0 = ffffffffe00000ff
!	Mem[00000000211c0000] = ffff7f1a, %l7 = 00000000ffffffff
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	%l5 = 00000000000000ff, immd = fffffffffffff748, %l4 = 0000000000000000
	udivx	%l5,-0x8b8,%l4		! %l4 = 0000000000000000
!	Mem[0000000030141408] = 88227d94, %l2 = 00000000000000ff
	lduha	[%i5+%o4]0x89,%l2	! %l2 = 0000000000007d94
!	%f15 = d31ad138, %f5  = ffff00bf, %f23 = 3ae33c36
	fadds	%f15,%f5 ,%f23		! %f23 = ffff00bf
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffff, Mem[00000000201c0001] = 00007d80, %asi = 80
	stba	%l7,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00ff7d80

p0_label_92:
!	Mem[0000000010101400] = 3ae33c36, %l0 = ffffffffe00000ff
	swapa	[%i4+%g0]0x88,%l0	! %l0 = 000000003ae33c36
!	%f27 = 2e0610dc, Mem[00000000100c1400] = 8822f8c3
	sta	%f27,[%i3+%g0]0x80	! Mem[00000000100c1400] = 2e0610dc
!	Mem[00000000300c1410] = b9bd7bff, %l1 = 00000000ee7cabaa
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 000000b9000000ff
!	Mem[0000000030181400] = 00000000, %l2 = 0000000000007d94
	swapa	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[000000001014143c] = 00003016, %l3 = 000000000000000b
	swap	[%i5+0x03c],%l3		! %l3 = 0000000000003016
!	%l2 = 0000000000000000, Mem[0000000030101410] = ff0000e03a206bff
	stxa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000000
!	%l2 = 00000000, %l3 = 00003016, Mem[0000000010101410] = 211b0000 ffffffff
	stda	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 00003016
!	Mem[0000000010041400] = ffffffff 49c5581c, %l0 = 3ae33c36, %l1 = 000000b9
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000ffffffff 0000000049c5581c
!	%f0  = ffffffff c3f82288 ffff00bf ff7bbdb9
!	%f4  = 00000000 ffff00bf 00000000 0000001f
!	%f8  = ffffffff ffff00bf ffffffff ff7bbdb9
!	%f12 = 6fb60061 618f63d5 3988957a d31ad138
	stda	%f0,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff000000, %l4 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l4	! %l4 = 00000000ff000000

p0_label_93:
!	Mem[0000000030041408] = 00000000, %l6 = 00000000ff2c0be1
	lduwa	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1424] = 4cf6ab34, %l1 = 0000000049c5581c
	ldsw	[%i3+0x024],%l1		! %l1 = 000000004cf6ab34
!	Mem[00000000300c1408] = ff000000, %l1 = 000000004cf6ab34
	ldswa	[%i3+%o4]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[0000000030041400] = 0000000000000000, %l4 = 00000000ff000000
	ldxa	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000003016
	ldsha	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 599588ff, %l0 = 00000000ffffffff
	lduha	[%i2+%o5]0x88,%l0	! %l0 = 00000000000088ff
!	%f26 = 0231cc40 2e0610dc, %f30 = 7ccdbb31 e90439af
	fdtox	%f26,%f30		! %f30 = 00000000 00000000
!	Mem[0000000010101400] = e00000ff, %l5 = 00000000000000ff
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = 2e0610dc, %l5 = 00000000000000ff
	lduha	[%i3+%g0]0x80,%l5	! %l5 = 0000000000002e06
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 000000ff, %l6 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000ff

p0_label_94:
!	%f18 = 00000000, Mem[00000000100c1408] = 00000000
	sta	%f18,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%l6 = 00000000000000ff, Mem[000000001004141e] = 0000001f
	sth	%l6,[%i1+0x01e]		! Mem[000000001004141c] = 000000ff
!	Mem[0000000030181408] = 9d7d564b, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 0000009d000000ff
!	Mem[0000000010081414] = 7e1e21ff, %l5 = 0000000000002e06
	ldstuba	[%i2+0x014]%asi,%l5	! %l5 = 0000007e000000ff
!	%l0 = 00000000000088ff, Mem[0000000030081408] = 0000000000000000
	stxa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000088ff
!	Mem[0000000030041410] = 000000ff, %l2 = 000000000000009d
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010181408] = 00000000
	stwa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	Mem[0000000010081408] = 00000000, %l7 = ffffffffffffffff
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010141434] = 4078b39e, %asi = 80
	stba	%l4,[%i5+0x034]%asi	! Mem[0000000010141434] = 0078b39e
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff7d564b, %l1 = ffffffffff000000
	ldsba	[%i6+%o4]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_95:
!	Mem[0000000010101400] = ff0000e038d11a00, %f18 = 00000000 00000000
	ldd	[%i4+%g0],%f18		! %f18 = ff0000e0 38d11a00
!	%l5 = 000000000000007e, %l1 = ffffffffffffffff, %y  = fffffffd
	umul	%l5,%l1,%l3		! %l3 = 0000007dffffff82, %y = 0000007d
!	Mem[0000000030101400] = 00000000, %f25 = f366b28f
	lda	[%i4+%g0]0x81,%f25	! %f25 = 00000000
!	Mem[000000001018143c] = d31ad138, %f17 = f366b28f
	lda	[%i6+0x03c]%asi,%f17	! %f17 = d31ad138
!	Mem[00000000100c1408] = 00000000, %l1 = ffffffffffffffff
	lduwa	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = 88227d94, %l5 = 000000000000007e
	lduwa	[%i5+%o4]0x89,%l5	! %l5 = 0000000088227d94
!	Mem[0000000030141408] = 947d2288, %l3 = 0000007dffffff82
	ldsha	[%i5+%o4]0x81,%l3	! %l3 = ffffffffffff947d
!	Mem[0000000010081410] = ff211eff599588ff, %l5 = 0000000088227d94
	ldxa	[%i2+%o5]0x88,%l5	! %l5 = ff211eff599588ff
!	Mem[00000000300c1400] = 8fb266f300000000, %l1 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l1	! %l1 = 8fb266f300000000
!	Starting 10 instruction Store Burst
!	%l5 = ff211eff599588ff, Mem[0000000010101408] = 211b00ffffffffff
	stxa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = ff211eff599588ff

p0_label_96:
!	%l7 = 0000000000000000, Mem[0000000030181408] = 4b567dff
	stha	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 4b560000
!	Mem[0000000010001418] = 0b000000, %l6 = 00000000000000ff
	swap	[%i0+0x018],%l6		! %l6 = 000000000b000000
!	Mem[00000000300c1400] = 00000000, %l2 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030081410] = 00000000
	stwa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[00000000218001c1] = 27cb7b35, %l2 = 0000000000000000
	ldstub	[%o3+0x1c1],%l2		! %l2 = 000000cb000000ff
!	%l1 = 8fb266f300000000, Mem[0000000010141400] = 4078b39e
	stwa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	Mem[00000000300c1400] = 00000000, %l1 = 8fb266f300000000
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 0000564b, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 000000000000564b
!	%l2 = 000000cb, %l3 = ffff947d, Mem[0000000030081400] = e925ca81 aaab7cee
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000cb ffff947d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000ff7bbdb9, %f4  = 00000000 ffff00bf
	ldda	[%i3+%o4]0x80,%f4 	! %f4  = 00000000 ff7bbdb9

p0_label_97:
!	Mem[00000000100c1408] = 00000000, %l0 = 00000000000088ff
	lduha	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010041430] = 6fb60061618f63d5, %l3 = ffffffffffff947d
	ldx	[%i1+0x030],%l3		! %l3 = 6fb60061618f63d5
!	Mem[000000001014143c] = 0000000b, %l0 = 0000000000000000
	ldsb	[%i5+0x03c],%l0		! %l0 = 0000000000000000
!	Mem[0000000010101410] = 1630000000000000, %l2 = 00000000000000cb
	ldxa	[%i4+%o5]0x88,%l2	! %l2 = 1630000000000000
!	Mem[0000000010101408] = ff889559ff1e21ff, %f2  = ffff00bf ff7bbdb9
	ldda	[%i4+%o4]0x80,%f2 	! %f2  = ff889559 ff1e21ff
!	Mem[0000000030001400] = b9bd7bff00000000, %f0  = ffffffff c3f82288
	ldda	[%i0+%g0]0x89,%f0 	! %f0  = b9bd7bff 00000000
!	Mem[0000000030081400] = ffff947d000000cb, %f4  = 00000000 ff7bbdb9
	ldda	[%i2+%g0]0x89,%f4 	! %f4  = ffff947d 000000cb
!	Mem[0000000010181408] = 0000000000000000, %l5 = ff211eff599588ff
	ldxa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = 8822f8c3ffffffff, %f6  = 00000000 0000001f
	ldda	[%i1+%g0]0x88,%f6 	! %f6  = 8822f8c3 ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = dc000000, %l3 = 6fb60061618f63d5
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 00000000dc000000

p0_label_98:
!	%l3 = 00000000dc000000, Mem[0000000010101410] = 0000000000003016
	stxa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000dc000000
!	%l4 = 000000000000564b, Mem[0000000030181400] = 00007d9400000000
	stxa	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000000000564b
!	%l2 = 00000000, %l3 = dc000000, Mem[0000000010081408] = ffffffff b9bd7bff
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 dc000000
!	Mem[0000000030101408] = ff2c0be1, %l4 = 000000000000564b
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ff2c0be1
!	%f12 = 6fb60061, Mem[00000000100c1410] = ff000000
	sta	%f12,[%i3+%o5]0x80	! Mem[00000000100c1410] = 6fb60061
!	%l0 = 0000000000000000, Mem[00000000100c1410] = 6fb60061
	stba	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00b60061
!	%l0 = 0000000000000000, immed = 00000ef9, %y  = 0000007d
	sdiv	%l0,0xef9,%l6		! %l6 = 0000000008593ab4
	mov	%l0,%y			! %y = 00000000
!	%l3 = 00000000dc000000, Mem[0000000021800140] = ff0202f2, %asi = 80
	stha	%l3,[%o3+0x140]%asi	! Mem[0000000021800140] = 000002f2
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff000000, %l0 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l0	! %l0 = 00000000ff000000

p0_label_99:
!	Mem[0000000010141400] = 00000000 e3096414, %l4 = ff2c0be1, %l5 = 00000000
	ldda	[%i5+0x000]%asi,%l4	! %l4 = 0000000000000000 00000000e3096414
!	Mem[0000000010041408] = ffff00bf, %l5 = 00000000e3096414
	ldsha	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141408] = 34abf64c, %l6 = 0000000008593ab4
	ldsha	[%i5+%o4]0x80,%l6	! %l6 = 00000000000034ab
!	Mem[0000000030001410] = 000080ff, %l1 = 0000000000000000
	ldswa	[%i0+%o5]0x81,%l1	! %l1 = 00000000000080ff
!	Mem[0000000020800000] = 89bf16cb, %l6 = 00000000000034ab
	ldsb	[%o1+0x001],%l6		! %l6 = ffffffffffffffbf
!	Mem[0000000030181400] = 00000000, %l5 = ffffffffffffffff
	ldswa	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = ff000000, %l5 = 0000000000000000
	lduha	[%i6+%o4]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030041410] = 0b1eaf3a0000009d, %l6 = ffffffffffffffbf
	ldxa	[%i1+%o5]0x89,%l6	! %l6 = 0b1eaf3a0000009d
!	Mem[0000000010041424] = ffff00bf, %l1 = 00000000000080ff
	lduw	[%i1+0x024],%l1		! %l1 = 00000000ffff00bf
!	Starting 10 instruction Store Burst
!	%f4  = ffff947d 000000cb, %l3 = 00000000dc000000
!	Mem[00000000100c1438] = 38d11ad37a958839
	add	%i3,0x038,%g1
	stda	%f4,[%g1+%l3]ASI_PST8_P ! Mem[00000000100c1438] = 38d11ad37a958839

p0_label_100:
!	%f20 = b2d0b9e9 00000000, %l4 = 0000000000000000
!	Mem[00000000100c1420] = 0000217f4cf6ab34
	add	%i3,0x020,%g1
	stda	%f20,[%g1+%l4]ASI_PST8_P ! Mem[00000000100c1420] = 0000217f4cf6ab34
!	%l2 = 1630000000000000, Mem[0000000030141408] = 54c5444888227d94
	stxa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 1630000000000000
!	%l0 = 00000000ff000000, Mem[0000000010041400] = ffffffff
	stwa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000
!	Mem[0000000030001400] = 00000000, %l3 = 00000000dc000000
	ldstuba	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010101400] = e00000ff
	stba	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = e0000000
!	Mem[0000000010101420] = ff47ffa6, %l1 = 00000000ffff00bf
	swap	[%i4+0x020],%l1		! %l1 = 00000000ff47ffa6
!	%f4  = ffff947d 000000cb, Mem[0000000010041408] = bf00ffff b9bd7bff
	stda	%f4 ,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff947d 000000cb
!	Mem[0000000010001420] = 146409e3f366b28f, %l5 = 000000000000ff00, %l3 = 0000000000000000
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 146409e3f366b28f
!	%l3 = 146409e3f366b28f, Mem[0000000030001400] = ff000000
	stha	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = b28f0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 000000cb, %l5 = 000000000000ff00
	ldsha	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000cb

p0_label_101:
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000030141400] = 00abf64c f366b28f 00000000 00003016
!	Mem[0000000030141410] = ffffffaa 00000061 4b56bb31 e904b26f
!	Mem[0000000030141420] = e413c6f7 06810bf4 92453b2f f93ac210
!	Mem[0000000030141430] = f8166e42 6f348f41 c1a03a58 1f5a6334
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000010081420] = ffffffffffffffff, %l3 = 146409e3f366b28f
	ldx	[%i2+0x020],%l3		! %l3 = ffffffffffffffff
!	Mem[00000000100c1400] = dc10062e, %l6 = 0b1eaf3a0000009d
	ldsha	[%i3+%g0]0x88,%l6	! %l6 = 000000000000062e
!	Mem[0000000030001400] = 00008fb2, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l7	! %l7 = 0000000000008fb2
!	Mem[0000000030001400] = 00008fb2, %l7 = 0000000000008fb2
	lduba	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000b2
!	Mem[0000000010041408] = cb000000, %l1 = 00000000ff47ffa6
	lduw	[%i1+%o4],%l1		! %l1 = 00000000cb000000
!	Mem[0000000010041400] = 000000ff, %l5 = 00000000000000cb
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = dc00000000000000, %l6 = 000000000000062e
	ldxa	[%i2+%o4]0x88,%l6	! %l6 = dc00000000000000
!	Mem[0000000010081408] = 00000000, %l2 = 1630000000000000
	ldsba	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181418] = ffb266f38185ca1e, %l7 = 00000000000000b2, %l4 = 0000000000000000
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l7,%l4	! %l4 = ffb266f38185ca1e

p0_label_102:
!	%l4 = ffb266f38185ca1e, Mem[0000000021800000] = 1cc0ba26
	stb	%l4,[%o3+%g0]		! Mem[0000000021800000] = 1ec0ba26
!	Mem[00000000300c1410] = ffbd7bff, %l4 = ffb266f38185ca1e
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l6 = dc00000000000000, Mem[000000001000140a] = 00000000
	sth	%l6,[%i0+0x00a]		! Mem[0000000010001408] = 00000000
!	%l3 = ffffffffffffffff, Mem[0000000010081400] = 00001b21
	stwa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffff
!	Mem[0000000030001410] = ff800000, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%f15 = d31ad138, %f6  = 8822f8c3, %f8  = ffffffff
	fsubs	%f15,%f6 ,%f8 		! %f8  = d31ad138
!	Mem[0000000030141400] = 00abf64c, %l1 = 00000000cb000000
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 0000000000abf64c
!	Mem[0000000010101408] = ff889559, %l0 = 00000000ff000000
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 00000000ff889559
!	Mem[00000000100c1410] = 6100b600, %l5 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 000000006100b600
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = b9bd7bff ffffffff, %l6 = 00000000, %l7 = 000000b2
	ldd	[%i2+0x038],%l6		! %l6 = 00000000b9bd7bff 00000000ffffffff

p0_label_103:
!	Mem[0000000030141410] = aaffffff, %f2  = ff889559
	lda	[%i5+%o5]0x89,%f2 	! %f2 = aaffffff
!	Mem[0000000010041408] = 000000cb, %f9  = ffff00bf
	lda	[%i1+%o4]0x88,%f9 	! %f9 = 000000cb
!	Mem[00000000211c0000] = ffff7f1a, %l4 = 00000000000000ff
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010101408] = 000000ff, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081414] = ff1e21ff, %l1 = 0000000000abf64c
	ldswa	[%i2+0x014]%asi,%l1	! %l1 = ffffffffff1e21ff
!	%l1 = ffffffffff1e21ff, imm = 0000000000000d32, %l4 = ffffffffffffffff
	xnor	%l1,0xd32,%l4		! %l4 = 0000000000e1d332
!	Mem[0000000010001400] = 8fb266f3000000ff, %f4  = ffff947d 000000cb
	ldda	[%i0+%g0]0x88,%f4 	! %f4  = 8fb266f3 000000ff
!	Mem[0000000030081410] = 00000000, %l1 = ffffffffff1e21ff
	ldsha	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, imm = 000000000000087b, %l7 = 00000000ffffffff
	xor	%l1,0x87b,%l7		! %l7 = 000000000000087b
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010081410] = ff889559
	stwa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000

p0_label_104:
!	Mem[0000000010001400] = ff000000, %l7 = 000000000000087b
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	%f6  = 8822f8c3 ffffffff, Mem[0000000010081428] = 4078b39e 3ae33c36
	stda	%f6 ,[%i2+0x028]%asi	! Mem[0000000010081428] = 8822f8c3 ffffffff
!	%f2  = aaffffff ff1e21ff, Mem[0000000010041410] = 00000000 ffff00bf
	stda	%f2 ,[%i1+%o5]0x80	! Mem[0000000010041410] = aaffffff ff1e21ff
!	%l6 = 00000000b9bd7bff, Mem[00000000300c1408] = 00000000000000ff
	stxa	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000b9bd7bff
!	Mem[0000000020800040] = dca42c25, %l3 = ffffffffffffffff
	ldstub	[%o1+0x040],%l3		! %l3 = 000000dc000000ff
!	%l3 = 00000000000000dc, Mem[0000000010041408] = cb000000
	stba	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = dc000000
!	Mem[0000000010141414] = 599588e3, %l5 = 6100b600, %l2 = 000000ff
	add	%i5,0x14,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 00000000599588e3
!	Mem[00000000300c1408] = b9bd7bff, %l0 = 00000000ff889559
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%f2  = aaffffff, Mem[0000000030041408] = 00000000
	sta	%f2 ,[%i1+%o4]0x81	! Mem[0000000030041408] = aaffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000217f 4cf6ab34, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 000000004cf6ab34 000000000000217f

p0_label_105:
!	Mem[00000000300c1400] = 00000000f366b28f, %f20 = ffffffaa 00000061
	ldda	[%i3+%g0]0x81,%f20	! %f20 = 00000000 f366b28f
!	%f8  = d31ad138, %f1  = 00000000, %f4  = 8fb266f3
	fmuls	%f8 ,%f1 ,%f4 		! %f4  = 80000000
!	Mem[00000000300c1400] = 00000000, %f15 = d31ad138
	lda	[%i3+%g0]0x81,%f15	! %f15 = 00000000
!	Mem[0000000010141410] = 618f63d5, %l4 = 0000000000e1d332
	ldsba	[%i5+0x012]%asi,%l4	! %l4 = 0000000000000063
!	Mem[00000000100c1408] = 00000000, %l3 = 00000000000000dc
	ldsba	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000063
	ldsba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = aaffffff, %l2 = 00000000599588e3
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = ffffffffffffaaff
!	Mem[0000000030081400] = cb000000, %l4 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000cb
!	Mem[0000000010041408] = dc000000, %l3 = 0000000000000000
	lduha	[%i1+%o4]0x80,%l3	! %l3 = 000000000000dc00
!	Starting 10 instruction Store Burst
!	Mem[0000000010081421] = ffffffff, %l3 = 000000000000dc00
	ldstuba	[%i2+0x021]%asi,%l3	! %l3 = 000000ff000000ff

p0_label_106:
!	%l0 = 000000004cf6ab34, Mem[0000000030081410] = 00000000
	stwa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 4cf6ab34
!	%l4 = 00000000000000cb, immed = 00000881, %y  = 00000000
	udiv	%l4,0x881,%l2		! %l2 = 0000000000000000
	mov	%l0,%y			! %y = 4cf6ab34
!	%l1 = 000000000000217f, Mem[0000000010141408] = 0000217f4cf6ab34
	stxa	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000000000217f
	membar	#Sync			! Added by membar checker (20)
!	%l1 = 000000000000217f, Mem[0000000030141410] = aaffffff
	stwa	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000217f
!	%l3 = 00000000000000ff, Mem[0000000030181400] = 00000000
	stwa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff
!	%l0 = 000000004cf6ab34, Mem[0000000030001408] = 00000000
	stwa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 4cf6ab34
!	Mem[0000000010041418] = 00000000, %l6 = b9bd7bff, %l6 = b9bd7bff
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = ff0080ff, %l0 = 000000004cf6ab34
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%l5 = 000000006100b600, Mem[0000000010001414] = ffffffff
	sth	%l5,[%i0+0x014]		! Mem[0000000010001414] = b600ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffffffff, %l0 = 00000000000000ff
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = ffffffffffffffff

p0_label_107:
!	Mem[00000000300c1410] = ffbd7bffffffffff, %l7 = 00000000000000ff
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = ffbd7bffffffffff
!	Mem[0000000010041410] = ffffffaa, %l0 = ffffffffffffffff
	lduha	[%i1+%o5]0x88,%l0	! %l0 = 000000000000ffaa
!	Mem[0000000010141410] = 618f63d5, %l5 = 000000006100b600
	lduwa	[%i5+%o5]0x80,%l5	! %l5 = 00000000618f63d5
!	Mem[0000000030101408] = 7efee79b 4b560000, %l0 = 0000ffaa, %l1 = 0000217f
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 000000004b560000 000000007efee79b
!	Mem[0000000010101428] = c06c6e39 88e5521d, %l6 = 00000000, %l7 = ffffffff
	ldd	[%i4+0x028],%l6		! %l6 = 00000000c06c6e39 0000000088e5521d
!	Mem[0000000010181420] = ffffffffffff00bf, %l1 = 000000007efee79b
	ldxa	[%i6+0x020]%asi,%l1	! %l1 = ffffffffffff00bf
!	Mem[0000000010041408] = dc000000, %l0 = 000000004b560000
	lduba	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000dc
!	Mem[00000000201c0000] = 00ff7d80, %l3 = 00000000000000ff
	ldsh	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	%l1 = ffffffffffff00bf, %l3 = 00000000000000ff, %l0  = 00000000000000dc
	mulx	%l1,%l3,%l0		! %l0 = ffffffffff01be41
!	Starting 10 instruction Store Burst
!	%l6 = 00000000c06c6e39, Mem[00000000201c0001] = 00ff7d80, %asi = 80
	stba	%l6,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00397d80

p0_label_108:
!	%l3 = 00000000000000ff, %l5 = 00000000618f63d5, %l0  = ffffffffff01be41
	mulx	%l3,%l5,%l0		! %l0 = 000000612dd4712b
!	Mem[0000000010141436] = 0078b39e, %l6 = 00000000c06c6e39
	ldstub	[%i5+0x036],%l6		! %l6 = 000000b3000000ff
!	%f18 = 00000000 00003016, Mem[00000000100c1408] = 00000000 b9bd7bff
	stda	%f18,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 00003016
!	%l0 = 2dd4712b, %l1 = ffff00bf, Mem[00000000300c1410] = ff7bbdff ffffffff
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 2dd4712b ffff00bf
!	Mem[0000000010081438] = b9bd7bffffffffff, %l0 = 000000612dd4712b, %l1 = ffffffffffff00bf
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = b9bd7bffffffffff
!	%l4 = 000000cb, %l5 = 618f63d5, Mem[0000000010081408] = 00000000 000000dc
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000cb 618f63d5
!	%l7 = 0000000088e5521d, Mem[0000000030101400] = 00000000
	stba	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000001d
!	%l2 = 0000000000000000, imm = fffffffffffffd00, %l4 = 00000000000000cb
	sub	%l2,-0x300,%l4		! %l4 = 0000000000000300
!	%l6 = 00000000000000b3, Mem[0000000030001400] = b28f0000
	stha	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00b30000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 000000cb, %l3 = 00000000000000ff
	ldswa	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000cb

p0_label_109:
!	Mem[0000000030181410] = 00000000, %l5 = 00000000618f63d5
	ldswa	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00000000 000000ff, %l6 = 000000b3, %l7 = 88e5521d
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000010101410] = 00000000dc000000, %f18 = 00000000 00003016
	ldda	[%i4+0x010]%asi,%f18	! %f18 = 00000000 dc000000
!	Mem[00000000300c1408] = 00000000b9bd7bff, %l1 = b9bd7bffffffffff
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = 00000000b9bd7bff
!	Mem[0000000030181408] = ff25000000000000, %l2 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l2	! %l2 = ff25000000000000
!	Mem[00000000201c0000] = 00397d80, %l5 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l5	! %l5 = 0000000000000039
!	Mem[0000000010001410] = b2d0b9e9b600ffff, %l4 = 0000000000000300
	ldxa	[%i0+%o5]0x80,%l4	! %l4 = b2d0b9e9b600ffff
!	Mem[0000000030181408] = 00000000, %f22 = 4b56bb31
	lda	[%i6+%o4]0x89,%f22	! %f22 = 00000000
!	Mem[0000000010101408] = 000000ff, %l5 = 0000000000000039
	ldsha	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = ff7bbdb9, %l0 = 000000612dd4712b
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 000000ff000000ff

p0_label_110:
!	%l3 = 00000000000000cb, Mem[0000000030181400] = 000000ff0000564b
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000000000cb
!	%l4 = b2d0b9e9b600ffff, Mem[0000000030001410] = ff8000ff
	stba	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = ff8000ff
!	%l3 = 00000000000000cb, Mem[0000000010041408] = dc000000
	stha	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 00cb0000
!	%l6 = 00000000000000ff, Mem[0000000010081400] = ffffffff
	stba	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff
!	Mem[0000000030101410] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f20 = 00000000 f366b28f, Mem[0000000030041400] = 00000000 00000000
	stda	%f20,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 f366b28f
!	%f9  = 000000cb, Mem[0000000010081410] = 00000000
	sta	%f9 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000cb
!	Mem[00000000300c1410] = 2dd4712b, %l7 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 000000002dd4712b
!	Mem[0000000010141400] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = ff00000092b0a59d, %f6  = 8822f8c3 ffffffff
	ldd	[%i5+0x020],%f6 	! %f6  = ff000000 92b0a59d

p0_label_111:
!	Mem[0000000030081410] = 34abf64c, %l7 = 000000002dd4712b
	ldswa	[%i2+%o5]0x89,%l7	! %l7 = 0000000034abf64c
!	Mem[0000000030041410] = 9d000000, %l1 = 00000000b9bd7bff
	lduwa	[%i1+%o5]0x81,%l1	! %l1 = 000000009d000000
!	%l4 = b2d0b9e9b600ffff, %l4 = b2d0b9e9b600ffff, %y  = 4cf6ab34
	smul	%l4,%l4,%l0		! %l0 = 15636c0193fe0001, %y = 15636c01
!	Mem[0000000010101410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l6 = 0000000000000000
	ldsha	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = ff000000, %l0 = 15636c0193fe0001
	lduha	[%i6+%o4]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010141400] = ff000000, %l4 = b2d0b9e9b600ffff
	lduwa	[%i5+%g0]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010001400] = ff000000 f366b28f, %l0 = 0000ff00, %l1 = 9d000000
	ldda	[%i0+0x000]%asi,%l0	! %l0 = 00000000ff000000 00000000f366b28f
!	Mem[00000000211c0000] = ffff7f1a, %l6 = 0000000000000000
	ldsb	[%o2+0x001],%l6		! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 00000000, %l1 = 00000000f366b28f
	swapa	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_112:
!	Mem[0000000010181410] = 00000000, %l7 = 0000000034abf64c
	ldstuba	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000020800041] = ffa42c25, %l1 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l1	! %l1 = 000000a4000000ff
!	%l2 = ff25000000000000, Mem[0000000010081420] = ffffffff, %asi = 80
	stha	%l2,[%i2+0x020]%asi	! Mem[0000000010081420] = 0000ffff
!	%f17 = f366b28f, Mem[0000000010141410] = d5638f61
	sta	%f17,[%i5+%o5]0x88	! Mem[0000000010141410] = f366b28f
!	%l3 = 00000000000000cb, Mem[000000001000141c] = ff7bbdb9, %asi = 80
	stwa	%l3,[%i0+0x01c]%asi	! Mem[000000001000141c] = 000000cb
!	%l2 = 00000000, %l3 = 000000cb, Mem[0000000010101408] = 000000ff ff211eff
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 000000cb
!	%l6 = ffffffffffffffff, Mem[0000000010101410] = 00000000
	stba	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	Mem[0000000021800040] = ff9e487b, %l7 = 0000000000000000
	ldstub	[%o3+0x040],%l7		! %l7 = 000000ff000000ff
!	%l1 = 00000000000000a4, Mem[0000000010081400] = ffffffffffffffff
	stxa	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000000000a4
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 0000217f, %f5  = 000000ff
	lda	[%i5+%o5]0x89,%f5 	! %f5 = 0000217f

p0_label_113:
!	%f4  = 80000000, %f6  = ff000000
	fcmpes	%fcc2,%f4 ,%f6 		! %fcc2 = 2
!	Mem[0000000010041400] = 8822f8c3ff000000, %f0  = b9bd7bff 00000000
	ldda	[%i1+%g0]0x88,%f0 	! %f0  = 8822f8c3 ff000000
!	Mem[0000000010081410] = 000000cb, %l4 = 00000000ff000000
	ldsba	[%i2+%o5]0x88,%l4	! %l4 = ffffffffffffffcb
!	Mem[0000000010101400] = 001ad138e0000000, %l2 = ff25000000000000
	ldxa	[%i4+%g0]0x88,%l2	! %l2 = 001ad138e0000000
!	Mem[0000000010041404] = c3f82288, %f10 = ffffffff
	ld	[%i1+0x004],%f10	! %f10 = c3f82288
!	Mem[0000000030101400] = 0000001d, %l2 = 001ad138e0000000
	lduba	[%i4+%g0]0x89,%l2	! %l2 = 000000000000001d
!	Mem[0000000010041408] = 0000cb00, %l0 = 00000000ff000000
	lduha	[%i1+%o4]0x88,%l0	! %l0 = 000000000000cb00
!	%l2 = 000000000000001d, %l1 = 00000000000000a4, %l3 = 00000000000000cb
	orn	%l2,%l1,%l3		! %l3 = ffffffffffffff5f
!	Mem[0000000010081410] = ff211eff000000cb, %f6  = ff000000 92b0a59d
	ldda	[%i2+%o5]0x88,%f6 	! %f6  = ff211eff 000000cb
!	Starting 10 instruction Store Burst
!	%l6 = ffffffff, %l7 = 000000ff, Mem[0000000010181400] = ffffffff 8822f8c3
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff 000000ff

p0_label_114:
!	%l7 = 00000000000000ff, Mem[0000000010081410] = 000000cb
	stha	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	%l4 = ffffffcb, %l5 = 000000ff, Mem[0000000010181400] = ffffffff 000000ff
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffcb 000000ff
!	Mem[0000000010141410] = f366b28f, %l4 = ffffffffffffffcb
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 0000008f000000ff
!	Mem[0000000010181430] = 6fb60061, %l3 = ffffffffffffff5f
	swap	[%i6+0x030],%l3		! %l3 = 000000006fb60061
!	%l6 = ffffffff, %l7 = 000000ff, Mem[0000000030181408] = 00000000 ff250000
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffff 000000ff
!	%l3 = 000000006fb60061, Mem[0000000030001400] = 0000b300
	stba	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000b361
!	%l2 = 0000001d, %l3 = 6fb60061, Mem[0000000010141400] = 000000ff 146409e3
	stda	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000001d 6fb60061
!	Mem[0000000030181410] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041410] = 9d000000, %l5 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 000000009d000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = c9a3800a 4cf6ab34, %l0 = 0000cb00, %l1 = 000000a4
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 000000004cf6ab34 00000000c9a3800a

p0_label_115:
!	Mem[0000000010081408] = 000000cb, %l2 = 000000000000001d
	ldsw	[%i2+%o4],%l2		! %l2 = 00000000000000cb
!	Mem[0000000030181410] = 000000ff, %l2 = 00000000000000cb
	ldsha	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l5 = 000000009d000000, %l0 = 000000004cf6ab34, %y  = 15636c01
	sdiv	%l5,%l0,%l2		! %l2 = 0000000047249f1d
	mov	%l0,%y			! %y = 4cf6ab34
	membar	#Sync			! Added by membar checker (21)
!	Mem[00000000300c1400] = 00000000 f366b28f ff7bbdb9 00000000
!	Mem[00000000300c1410] = 00000000 bf00ffff 246db67a cf1cf644
!	Mem[00000000300c1420] = 146409e3 f366b28f 0231cc40 2e0610dc
!	Mem[00000000300c1430] = 300099d0 e3a23f3c 7ccdbb31 e90439af
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Mem[000000001018142c] = 38d11a00, %l6 = ffffffffffffffff
	ldsha	[%i6+0x02c]%asi,%l6	! %l6 = 00000000000038d1
!	Mem[00000000100c1410] = 000000ff, %l6 = 00000000000038d1
	lduha	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041400] = 000000ff, %l5 = 000000009d000000
	ldsba	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 7f210000, %l0 = 000000004cf6ab34
	ldsha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000007f21
!	Mem[00000000100c1410] = 00000000000000ff, %f28 = f8166e42 6f348f41
	ldda	[%i3+%o5]0x88,%f28	! %f28 = 00000000 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001438] = 7ccdbb31e90439af, %l7 = 0000000000000000, %l0 = 0000000000007f21
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 7ccdbb31e90439af

p0_label_116:
!	Mem[0000000010001404] = f366b28f, %l0 = 7ccdbb31e90439af
	swap	[%i0+0x004],%l0		! %l0 = 00000000f366b28f
!	Mem[0000000030101408] = 0000564b, %l6 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c141e] = 000000ff, %l4 = 000000000000008f
	ldstuba	[%i3+0x01e]%asi,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030141408] = 00000000
	stwa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%l4 = 0000000000000000, Mem[00000000100c1400] = 2e0610dc
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l6 = 0000000000000000, %l2 = 0000000047249f1d, %l0 = 00000000f366b28f
	sub	%l6,%l2,%l0		! %l0 = ffffffffb8db60e3
!	%f23 = e904b26f, Mem[0000000010141410] = f366b2ff
	sta	%f23,[%i5+%o5]0x88	! Mem[0000000010141410] = e904b26f
!	Mem[0000000010181408] = ff000000, %l3 = 000000006fb60061
	swapa	[%i6+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010141408] = 7f210000, %l3 = 00000000ff000000
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 000000007f210000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000000000ff, %f24 = e413c6f7 06810bf4
	ldda	[%i5+%o4]0x88,%f24	! %f24 = 00000000 000000ff

p0_label_117:
!	Mem[0000000010081438] = b9bd7bffffffffff, %l4 = 0000000000000000
	ldx	[%i2+0x038],%l4		! %l4 = b9bd7bffffffffff
!	Mem[0000000030181410] = ff000000 00000000, %l0 = b8db60e3, %l1 = c9a3800a
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[000000001004143c] = d31ad138, %l1 = 0000000000000000
	ldsha	[%i1+0x03c]%asi,%l1	! %l1 = ffffffffffffd31a
!	Mem[00000000300c1400] = 00000000, %l7 = 0000000000000000
	ldsha	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = ffff7f1a, %l5 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101430] = 86f5424a, %l6 = 0000000000000000
	ldub	[%i4+0x031],%l6		! %l6 = 00000000000000f5
!	Mem[0000000030101400] = 1d000000, %l2 = 0000000047249f1d
	ldsba	[%i4+%g0]0x81,%l2	! %l2 = 000000000000001d
!	Mem[00000000300c1400] = 00000000, %l5 = ffffffffffffffff
	ldswa	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = 6100000034abf64c, %l4 = b9bd7bffffffffff
	ldxa	[%i2+%o5]0x89,%l4	! %l4 = 6100000034abf64c
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 000000cb, %f24 = 00000000
	ld	[%i2+%o4],%f24	! %f24 = 000000cb

p0_label_118:
	membar	#Sync			! Added by membar checker (22)
!	%l3 = 000000007f210000, Mem[00000000300c1400] = 8fb266f300000000
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000007f210000
!	Mem[0000000030001400] = 61b30000, %l4 = 6100000034abf64c
	lduha	[%i0+%g0]0x81,%l4	! %l4 = 00000000000061b3
!	%f30 = c1a03a58, %f30 = c1a03a58, %f0  = 00000000
	fmuls	%f30,%f30,%f0 		! %f0  = 43c891f7
!	%l6 = 000000f5, %l7 = 00000000, Mem[0000000010081400] = a4000000 00000000
	stda	%l6,[%i2+0x000]%asi	! Mem[0000000010081400] = 000000f5 00000000
!	%l5 = 0000000000000000, Mem[0000000030001400] = 0000b361
	stwa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[00000000211c0001] = ffff7f1a, %l6 = 00000000000000f5
	ldstub	[%o2+0x001],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000010041400] = ff000000, %l6 = 00000000000000ff
	swapa	[%i1+%g0]0x88,%l6	! %l6 = 00000000ff000000
!	%l5 = 0000000000000000, Mem[00000000201c0001] = 00397d80
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = 00007d80
!	%l4 = 00000000000061b3, Mem[0000000010181428] = 363ce33a38d11a00, %asi = 80
	stxa	%l4,[%i6+0x028]%asi	! Mem[0000000010181428] = 00000000000061b3
!	Starting 10 instruction Load Burst
!	%l1 = ffffffffffffd31a, Mem[0000000010101410] = 000000dc000000ff
	stxa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffffffffd31a

p0_label_119:
!	Mem[0000000010181408] = 6fb6006100000000, %l1 = ffffffffffffd31a
	ldxa	[%i6+%o4]0x80,%l1	! %l1 = 6fb6006100000000
!	Mem[0000000030141408] = 00000000, %l5 = 0000000000000000
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = 4cf6ab34, %l0 = 00000000ff000000
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 000000004cf6ab34
!	Mem[0000000030141410] = 7f210000 00000061, %l0 = 4cf6ab34, %l1 = 00000000
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 000000007f210000 0000000000000061
!	Mem[0000000030041408] = 00000000ffffffaa, %l4 = 00000000000061b3
	ldxa	[%i1+%o4]0x89,%l4	! %l4 = 00000000ffffffaa
!	Mem[0000000010181410] = ff00000000000000, %l2 = 000000000000001d
	ldxa	[%i6+%o5]0x80,%l2	! %l2 = ff00000000000000
!	Mem[0000000010001410] = b2d0b9e9b600ffff, %f16 = 00abf64c f366b28f
	ldda	[%i0+%o5]0x80,%f16	! %f16 = b2d0b9e9 b600ffff
!	Mem[00000000300c1400] = 0000217f 00000000, %l4 = ffffffaa, %l5 = 00000000
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 000000000000217f 0000000000000000
!	Mem[0000000010181428] = 00000000000061b3, %l2 = ff00000000000000
	ldx	[%i6+0x028],%l2		! %l2 = 00000000000061b3
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 00000000, %l3 = 000000007f210000
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff

p0_label_120:
!	%l3 = 0000000000000000, Mem[00000000300c1408] = b9bd7bff
	stba	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = b9bd7b00
!	Mem[00000000300c1400] = 7f210000, %l6 = 00000000ff000000
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030141408] = 00000000 16300000
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 00000000
!	Mem[0000000010001410] = b2d0b9e9, %l1 = 0000000000000061
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 000000b2000000ff
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 000000007f210000
	setx	0x6a9775f79de3cf61,%g7,%l0 ! %l0 = 6a9775f79de3cf61
!	%l1 = 00000000000000b2
	setx	0xae3e3d9819c87fe4,%g7,%l1 ! %l1 = ae3e3d9819c87fe4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6a9775f79de3cf61
	setx	0x40f7108005c352d9,%g7,%l0 ! %l0 = 40f7108005c352d9
!	%l1 = ae3e3d9819c87fe4
	setx	0xdbe08f1f866085ca,%g7,%l1 ! %l1 = dbe08f1f866085ca
!	%f19 = dc000000, Mem[0000000010181424] = ffff00bf
	st	%f19,[%i6+0x024]	! Mem[0000000010181424] = dc000000
!	Mem[0000000010041410] = ffffffaa, %l2 = 00000000000061b3
	ldstuba	[%i1+%o5]0x88,%l2	! %l2 = 000000aa000000ff
!	%f8  = 146409e3 f366b28f, %l4 = 000000000000217f
!	Mem[0000000010081408] = 000000cb618f63d5
	add	%i2,0x008,%g1
	stda	%f8,[%g1+%l4]ASI_PST32_P ! Mem[0000000010081408] = 146409e3f366b28f
!	Mem[0000000010181428] = 00000000, %l2 = 00000000000000aa
	swap	[%i6+0x028],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffff00b6e9b9d0ff, %f0  = 43c891f7 f366b28f
	ldda	[%i0+%o5]0x88,%f0 	! %f0  = ffff00b6 e9b9d0ff

p0_label_121:
!	Mem[0000000030081408] = 00000000, %l6 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800000] = 89bf16cb, %l5 = 0000000000000000
	ldsb	[%o1+0x001],%l5		! %l5 = ffffffffffffffbf
!	Mem[00000000218000c0] = 8309f956, %l2 = 0000000000000000
	lduba	[%o3+0x0c1]%asi,%l2	! %l2 = 0000000000000009
!	Mem[0000000010041400] = 8822f8c3 000000ff, %l4 = 0000217f, %l5 = ffffffbf
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 00000000000000ff 000000008822f8c3
!	Mem[0000000010001408] = 00000000, %l2 = 0000000000000009
	lduba	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 0000001d, %l3 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = 000000000000001d
!	Mem[0000000030081410] = 34abf64c, %f26 = 92453b2f
	lda	[%i2+%o5]0x89,%f26	! %f26 = 34abf64c
!	Mem[0000000010001400] = ff000000, %l0 = 40f7108005c352d9
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010001400] = ff000000 e90439af, %l2 = 00000000, %l3 = 0000001d
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ff000000 00000000e90439af
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 8fb266f3, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 000000008fb266f3

p0_label_122:
!	%f22 = 00000000 e904b26f, Mem[0000000010181400] = cbffffff ff000000
	stda	%f22,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 e904b26f
!	Mem[0000000010141410] = 6fb204e9, %l2 = 00000000ff000000
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 000000006fb204e9
!	Mem[0000000030001410] = ff8000ff, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 00000000ff8000ff
!	Mem[00000000100c1410] = ff000000, %l0 = ffffffffffffff00
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	%l4 = 00000000000000ff, Mem[0000000010181410] = ff00000000000000
	stxa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000000000ff
!	%l6 = ff8000ff, %l7 = 8fb266f3, Mem[0000000010101408] = ff000000 cb000000
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = ff8000ff 8fb266f3
!	%l7 = 000000008fb266f3, %l7 = 000000008fb266f3, %l6 = 00000000ff8000ff
	addc	%l7,%l7,%l6		! %l6 = 000000011f64cde6
!	%l1 = dbe08f1f866085ca, immd = 0000000000000c9d, %l5 = 000000008822f8c3
	sdivx	%l1,0xc9d,%l5		! %l5 = fffd22d95204c96b
!	%l1 = dbe08f1f866085ca, Mem[0000000010181428] = 000000aa, %asi = 80
	stha	%l1,[%i6+0x028]%asi	! Mem[0000000010181428] = 85ca00aa
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000, %f27 = f93ac210
	lda	[%i2+%o4]0x89,%f27	! %f27 = 00000000

p0_label_123:
!	%f21 = f366b28f, %f11 = 2e0610dc
	fcmps	%fcc0,%f21,%f11		! %fcc0 = 1
!	Mem[0000000030081400] = 000000cb, %l1 = dbe08f1f866085ca
	lduba	[%i2+%g0]0x89,%l1	! %l1 = 00000000000000cb
!	Mem[00000000300c1408] = 00000000b9bd7b00, %f28 = 00000000 000000ff
	ldda	[%i3+%o4]0x89,%f28	! %f28 = 00000000 b9bd7b00
!	Mem[0000000030141400] = 000000cb, %l5 = fffd22d95204c96b
	lduwa	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000cb
!	Mem[00000000100c1410] = 0000000000ffffff, %f6  = 246db67a cf1cf644
	ldda	[%i3+%o5]0x88,%f6 	! %f6  = 00000000 00ffffff
!	Mem[0000000030081410] = 4cf6ab34, %l7 = 000000008fb266f3
	lduwa	[%i2+%o5]0x81,%l7	! %l7 = 000000004cf6ab34
!	Mem[0000000010141400] = 1d0000006100b66f, %f0  = ffff00b6 e9b9d0ff
	ldda	[%i5+%g0]0x80,%f0 	! %f0  = 1d000000 6100b66f
!	Mem[0000000030001400] = 00000000, %l4 = 00000000000000ff
	lduha	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l4 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 000000011f64cde6, Mem[0000000030041400] = 00000000
	stba	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000e6

p0_label_124:
!	%f16 = b2d0b9e9, %f15 = e90439af, %f20 = 00000000 f366b28f
	fsmuld	%f16,%f15,%f20		! %f20 = 438af3b9 0dfdd1c0
!	Mem[0000000030041408] = aaffffff, %l6 = 000000011f64cde6
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 00000000aaffffff
!	Mem[00000000100c1400] = 00000000, %l3 = 00000000e90439af
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l7 = 000000004cf6ab34, Mem[00000000300c1408] = b9bd7b00
	stha	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = b9bdab34
!	Mem[0000000010181408] = 6fb60061, %l0 = 00000000ff000000
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 0000006f000000ff
!	%f6  = 00000000 00ffffff, %l5 = 00000000000000cb
!	Mem[00000000100c1428] = 001ad1383ae33c36
	add	%i3,0x028,%g1
	stda	%f6,[%g1+%l5]ASI_PST8_PL ! Mem[00000000100c1428] = ffffd1003ae30000
!	%l1 = 00000000000000cb, Mem[0000000010141400] = 0000001d
	stha	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000cb
!	Mem[0000000010181430] = ffffff5f, %l7 = 000000004cf6ab34
	swap	[%i6+0x030],%l7		! %l7 = 00000000ffffff5f
!	%l0 = 0000006f, %l1 = 000000cb, Mem[0000000010001430] = 300099d0 e3a23f3c
	stda	%l0,[%i0+0x030]%asi	! Mem[0000000010001430] = 0000006f 000000cb
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = 62ff6f0b, %l4 = 0000000000000000
	lduba	[%o3+0x081]%asi,%l4	! %l4 = 00000000000000ff

p0_label_125:
!	Mem[0000000010181400] = 00000000, %l6 = 00000000aaffffff
	lduba	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = 00007d80, %l0 = 000000000000006f
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	%l1 = 00000000000000cb, %l3 = 0000000000000000, %l0 = 0000000000000000
	addc	%l1,%l3,%l0		! %l0 = 00000000000000cb
!	Mem[0000000010001430] = 0000006f000000cb, %l6 = 0000000000000000
	ldxa	[%i0+0x030]%asi,%l6	! %l6 = 0000006f000000cb
!	Mem[00000000100c1404] = ffffffff, %l5 = 00000000000000cb
	lduwa	[%i3+0x004]%asi,%l5	! %l5 = 00000000ffffffff
!	%f16 = b2d0b9e9, %f18 = 00000000
	fcmpes	%fcc2,%f16,%f18		! %fcc2 = 1
!	Mem[0000000030001400] = 00000000, %l7 = 00000000ffffff5f
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = ff000000, %l0 = 00000000000000cb
	lduwa	[%i5+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[00000000100c1410] = ffffff00, %f10 = 0231cc40
	lda	[%i3+%o5]0x80,%f10	! %f10 = ffffff00
!	Starting 10 instruction Store Burst
!	%f9  = f366b28f, Mem[0000000010001410] = e9b9d0ff
	sta	%f9 ,[%i0+%o5]0x88	! Mem[0000000010001410] = f366b28f

p0_label_126:
!	%l6 = 000000cb, %l7 = 00000000, Mem[0000000030101410] = ff000000 00000000
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000cb 00000000
!	%f20 = 438af3b9 0dfdd1c0, Mem[0000000010041400] = ff000000 c3f82288
	stda	%f20,[%i1+%g0]0x80	! Mem[0000000010041400] = 438af3b9 0dfdd1c0
!	%f4  = 00000000 bf00ffff, %l3 = 0000000000000000
!	Mem[00000000100c1430] = d5638f616100b66f
	add	%i3,0x030,%g1
	stda	%f4,[%g1+%l3]ASI_PST8_P ! Mem[00000000100c1430] = d5638f616100b66f
!	Mem[00000000100c1412] = ffffff00, %l5 = 00000000ffffffff
	ldstub	[%i3+0x012],%l5		! %l5 = 000000ff000000ff
!	%f26 = 34abf64c 00000000, Mem[0000000030001408] = 000000ff 0a80a3c9
	stda	%f26,[%i0+%o4]0x81	! Mem[0000000030001408] = 34abf64c 00000000
!	%l2 = 000000006fb204e9, Mem[0000000010001408] = 00000000
	stba	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000e9
!	Mem[0000000020800041] = ffff2c25, %l0 = 00000000ff000000
	ldstub	[%o1+0x041],%l0		! %l0 = 000000ff000000ff
!	%l2 = 6fb204e9, %l3 = 00000000, Mem[0000000010001410] = f366b28f ffff00b6
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 6fb204e9 00000000
!	%l7 = 0000000000000000, Mem[0000000030041410] = 000000ff3aaf1e0b
	stxa	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = b9bd7bffffffffff, %f22 = 00000000 e904b26f
	ldd	[%i2+0x038],%f22	! %f22 = b9bd7bff ffffffff

p0_label_127:
!	Mem[0000000030001400] = b9bd7bff00000000, %l3 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l3	! %l3 = b9bd7bff00000000
!	Mem[0000000010081408] = 146409e3 f366b28f, %l0 = 000000ff, %l1 = 000000cb
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000146409e3 00000000f366b28f
!	Mem[0000000010141400] = 000000cb, %l3 = b9bd7bff00000000
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000cb
!	%f0  = 1d000000, %f30 = c1a03a58, %f14 = 7ccdbb31
	fadds	%f0 ,%f30,%f14		! %f14 = c1a03a58
!	Mem[0000000010181408] = 000000006100b6ff, %f12 = 300099d0 e3a23f3c
	ldda	[%i6+%o4]0x88,%f12	! %f12 = 00000000 6100b6ff
!	Mem[0000000010181438] = 3988957a, %f12 = 00000000
	lda	[%i6+0x038]%asi,%f12	! %f12 = 3988957a
!	Mem[00000000100c1400] = 000000ff, %l2 = 000000006fb204e9
	ldswa	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141410] = 000000ff, %l1 = 00000000f366b28f
	ldsha	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101410] = 00000000cb000000, %l3 = 00000000000000cb
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = 00000000cb000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = f5000000, %l4 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 00000000f5000000

p0_label_128:
!	%f26 = 34abf64c, Mem[0000000010081418] = ffca8581
	st	%f26,[%i2+0x018]	! Mem[0000000010081418] = 34abf64c
!	%l5 = 00000000000000ff, Mem[0000000030181410] = 000000ff
	stwa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	%l2 = 00000000000000ff, Mem[0000000010101408] = ff0080ff
	stha	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ff0000ff
!	%l4 = 00000000f5000000, Mem[0000000030141400] = cb000000
	stba	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l5 = 00000000000000ff, Mem[0000000030141408] = 00000000
	stha	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	%f16 = b2d0b9e9 b600ffff, %l1 = 00000000000000ff
!	Mem[0000000030141408] = ff00000000000000
	add	%i5,0x008,%g1
	stda	%f16,[%g1+%l1]ASI_PST8_S ! Mem[0000000030141408] = b2d0b9e9b600ffff
!	%f6  = 00000000, %f11 = 2e0610dc, %f25 = 000000ff
	fsubs	%f6 ,%f11,%f25		! %f25 = ae0610dc
!	%l0 = 146409e3, %l1 = 000000ff, Mem[0000000030141410] = 0000217f 61000000
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 146409e3 000000ff
!	%l4 = f5000000, %l5 = 000000ff, Mem[0000000010141428] = 1eca8581 f366b28f
	std	%l4,[%i5+0x028]		! Mem[0000000010141428] = f5000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 000000ff, %l7 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff

p0_label_129:
!	Mem[0000000030081408] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = 000000ff, %l0 = 00000000146409e3
	lduha	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141410] = ff000000599588e3, %f12 = 3988957a 6100b6ff
	ldda	[%i5+%o5]0x80,%f12	! %f12 = ff000000 599588e3
!	Mem[0000000010101400] = 001ad138e0000000, %l6 = 0000006f000000cb
	ldxa	[%i4+%g0]0x88,%l6	! %l6 = 001ad138e0000000
!	Mem[0000000030041408] = 1f64cde6, %l4 = 00000000f5000000
	ldsha	[%i1+%o4]0x81,%l4	! %l4 = 0000000000001f64
!	Mem[0000000010041420] = ffffffffffff00bf, %l2 = 00000000000000ff
	ldx	[%i1+0x020],%l2		! %l2 = ffffffffffff00bf
!	%l3 = 00000000cb000000, %l3 = 00000000cb000000, %l7 = 0000000000000000
	xnor	%l3,%l3,%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030101410] = 000000cb, %l5 = 00000000000000ff
	lduha	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l7 = ffffffffffffffff
	lduha	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = ffff7f1a, %l5 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000ff000000ff

p0_label_130:
!	%l5 = 00000000000000ff, Mem[0000000010001410] = 6fb204e9
	stba	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 6fb204ff
!	%l4 = 0000000000001f64, Mem[00000000300c1400] = ff00217f
	stha	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 1f64217f
!	Mem[0000000010181400] = 00000000, %l3 = 00000000cb000000
	swap	[%i6+%g0],%l3		! %l3 = 0000000000000000
!	%l4 = 0000000000001f64, immd = fffffffffffff270, %l6 = 001ad138e0000000
	sdivx	%l4,-0xd90,%l6		! %l6 = fffffffffffffffe
!	%f6  = 00000000, Mem[0000000010101410] = ffffd31a
	sta	%f6 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000001f64
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = 00003016, %l1 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l1	! %l1 = 00000016000000ff
!	%l2 = ffffffffffff00bf, Mem[0000000010041400] = 438af3b9
	stwa	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = ffff00bf
!	Mem[00000000300c1400] = 7f21641f, %l5 = 00000000000000ff
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 0000001f000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c140c] = 00000000, %l7 = 0000000000000000
	ldub	[%i3+0x00c],%l7		! %l7 = 0000000000000000

p0_label_131:
!	Mem[0000000010041400] = ffff00bf, %f22 = b9bd7bff
	lda	[%i1+%g0]0x80,%f22	! %f22 = ffff00bf
!	Mem[0000000010081410] = 000000ff, %l1 = 0000000000000016
	lduha	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181408] = 000000006100b6ff, %l1 = 00000000000000ff
	ldxa	[%i6+%o4]0x88,%l1	! %l1 = 000000006100b6ff
!	Mem[0000000010181408] = 6100b6ff, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l4	! %l4 = 000000006100b6ff
!	Mem[0000000030081408] = 00000000000088ff, %l6 = fffffffffffffffe
	ldxa	[%i2+%o4]0x81,%l6	! %l6 = 00000000000088ff
!	Mem[0000000010141400] = 000000cb, %f15 = e90439af
	lda	[%i5+%g0]0x88,%f15	! %f15 = 000000cb
!	Mem[0000000030041400] = 000000e6, %l4 = 000000006100b6ff
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000e6
!	Mem[0000000030101410] = 00000000cb000000, %l3 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = 00000000cb000000
!	Mem[0000000030101400] = 1d000000, %l4 = 00000000000000e6
	ldswa	[%i4+%g0]0x81,%l4	! %l4 = 000000001d000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff000000, %l1 = 000000006100b6ff
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 000000ff000000ff

p0_label_132:
!	%f16 = b2d0b9e9 b600ffff, Mem[0000000010101400] = 000000e0 38d11a00
	stda	%f16,[%i4+%g0]0x80	! Mem[0000000010101400] = b2d0b9e9 b600ffff
!	%l3 = 00000000cb000000, Mem[00000000100c1430] = d5638f616100b66f
	stx	%l3,[%i3+0x030]		! Mem[00000000100c1430] = 00000000cb000000
!	%f0  = 1d000000 6100b66f, %l3 = 00000000cb000000
!	Mem[0000000010181400] = cb000000e904b26f
	stda	%f0,[%i6+%l3]ASI_PST16_PL ! Mem[0000000010181400] = cb000000e904b26f
!	%f26 = 34abf64c 00000000, Mem[00000000300c1400] = 7f2164ff 00000000
	stda	%f26,[%i3+%g0]0x89	! Mem[00000000300c1400] = 34abf64c 00000000
!	%l1 = 00000000000000ff, Mem[0000000010001428] = 0231cc40
	sth	%l1,[%i0+0x028]		! Mem[0000000010001428] = 00ffcc40
!	%l4 = 000000001d000000, Mem[0000000030081408] = 00000000000088ff
	stxa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000001d000000
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000030001410] = 00000000 b9bd7bff
	stda	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff 000000ff
!	%l0 = 00000000000000ff, Mem[0000000030001410] = ff000000ff000000
	stxa	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000000000ff
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 00000000000000ff
	setx	0xa7503ec00fed7e6f,%g7,%l0 ! %l0 = a7503ec00fed7e6f
!	%l1 = 00000000000000ff
	setx	0x9609f2283dafdf50,%g7,%l1 ! %l1 = 9609f2283dafdf50
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a7503ec00fed7e6f
	setx	0xae86bd1fc7a92cb2,%g7,%l0 ! %l0 = ae86bd1fc7a92cb2
!	%l1 = 9609f2283dafdf50
	setx	0x8a9ba507ecb19f57,%g7,%l1 ! %l1 = 8a9ba507ecb19f57
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 000000ff, %f10 = ffffff00
	lda	[%i5+%o5]0x88,%f10	! %f10 = 000000ff

p0_label_133:
!	Mem[0000000010041400] = ffff00bf, %l4 = 000000001d000000
	ldub	[%i1+0x003],%l4		! %l4 = 00000000000000bf
!	Mem[000000001010140c] = 8fb266f3, %l2 = ffffffffffff00bf
	ldsha	[%i4+0x00e]%asi,%l2	! %l2 = 00000000000066f3
!	%l2 = 00000000000066f3, imm = 0000000000000385, %l4 = 00000000000000bf
	add	%l2,0x385,%l4		! %l4 = 0000000000006a78
!	Mem[0000000010181408] = ffb60061, %f18 = 00000000
	lda	[%i6+%o4]0x80,%f18	! %f18 = ffb60061
!	%l0 = ae86bd1fc7a92cb2, immed = fffff7c0, %y  = 4cf6ab34
	udiv	%l0,-0x840,%l0		! %l0 = 000000004cf6adaf
	mov	%l0,%y			! %y = 4cf6adaf
!	Mem[0000000030041408] = 1f64cde6, %l5 = 000000000000001f
	lduha	[%i1+%o4]0x81,%l5	! %l5 = 0000000000001f64
!	Mem[0000000010081400] = ff000000, %l0 = 000000004cf6adaf
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000020800040] = ffff2c25, %l0 = ffffffffffffff00
	ldsba	[%o1+0x041]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030141408] = b2d0b9e9, %l7 = 0000000000000000
	lduba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000b2
!	Starting 10 instruction Store Burst
!	Mem[0000000010181414] = 000000ff, %l7 = 00000000000000b2
	swap	[%i6+0x014],%l7		! %l7 = 00000000000000ff

p0_label_134:
!	%l2 = 000066f3, %l3 = cb000000, Mem[0000000030081400] = 000000cb ffff947d
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000066f3 cb000000
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010141400] = cb000000 6100b66f ff000000 00000000
!	Mem[0000000010141410] = ff000000 599588e3 7544075b d31ad138
!	Mem[0000000010141420] = ff000000 92b0a59d f5000000 000000ff
!	Mem[0000000010141430] = 000000ff 0078ff9e 00000000 0000000b
	ldda	[%i5]ASI_BLK_AIUP,%f16	! Block Load from 0000000010141400
!	%l6 = 000088ff, %l7 = 000000ff, Mem[0000000030081408] = 00000000 1d000000
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 000088ff 000000ff
!	%l6 = 00000000000088ff, Mem[0000000030001400] = ff000000
	stba	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = ff000000
!	%l7 = 00000000000000ff, Mem[0000000030001408] = 4cf6ab34
	stha	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 4cf600ff
!	Mem[0000000010181408] = ffb60061, %l3 = 00000000cb000000
	ldsw	[%i6+%o4],%l3		! %l3 = ffffffffffb60061
!	%f0  = 1d000000, %f15 = 000000cb, %f8  = 146409e3
	fdivs	%f0 ,%f15,%f8 		! %l0 = 0000000000000021, Unfinished, %fsr = 2500000400
!	%l4 = 0000000000006a78, Mem[0000000010101430] = 86f5424a, %asi = 80
	stha	%l4,[%i4+0x030]%asi	! Mem[0000000010101430] = 6a78424a
!	%l2 = 00000000000066f3, Mem[0000000010081428] = 8822f8c3ffffffff
	stx	%l2,[%i2+0x028]		! Mem[0000000010081428] = 00000000000066f3
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00cb0000 7d94ffff, %l6 = 000088ff, %l7 = 000000ff
	ldd	[%i1+%o4],%l6		! %l6 = 0000000000cb0000 000000007d94ffff

p0_label_135:
!	Mem[0000000010041400] = ffff00bf, %l6 = 0000000000cb0000
	lduba	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141400] = 000000cb, %l2 = 00000000000066f3
	lduwa	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000cb
!	Mem[0000000010181408] = 6100b6ff, %l1 = 8a9ba507ecb19f57
	ldsha	[%i6+%o4]0x88,%l1	! %l1 = ffffffffffffb6ff
!	Mem[0000000010041408] = ffff947d0000cb00, %l4 = 0000000000006a78
	ldxa	[%i1+%o4]0x88,%l4	! %l4 = ffff947d0000cb00
!	Mem[0000000010181400] = cb000000, %l4 = ffff947d0000cb00
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 000000000000cb00
!	Mem[0000000030141410] = 146409e3, %l6 = 00000000000000ff
	lduha	[%i5+%o5]0x89,%l6	! %l6 = 00000000000009e3
!	Mem[0000000010001410] = ff04b26f00000000, %f14 = c1a03a58 000000cb
	ldda	[%i0+%o5]0x80,%f14	! %f14 = ff04b26f 00000000
!	Mem[0000000030041408] = e6cd641f, %l2 = 00000000000000cb
	lduba	[%i1+%o4]0x89,%l2	! %l2 = 000000000000001f
!	Mem[0000000010181410] = 00000000, %f5  = bf00ffff
	lda	[%i6+%o5]0x80,%f5 	! %f5 = 00000000
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000cb00, Mem[0000000010101410] = 00000000
	stba	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000

p0_label_136:
!	%f6  = 00000000, Mem[0000000010001408] = e9000000
	sta	%f6 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%f10 = 000000ff, Mem[0000000010081408] = e3096414
	sta	%f10,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff
!	%l7 = 000000007d94ffff, Mem[0000000010081430] = 00007d9df366b28f, %asi = 80
	stxa	%l7,[%i2+0x030]%asi	! Mem[0000000010081430] = 000000007d94ffff
!	%f4  = 00000000 00000000, Mem[0000000010001428] = 00ffcc40 2e0610dc
	std	%f4 ,[%i0+0x028]	! Mem[0000000010001428] = 00000000 00000000
	membar	#Sync			! Added by membar checker (24)
!	%f8  = 146409e3 f366b28f, Mem[0000000010141400] = cb000000 6100b66f
	stda	%f8 ,[%i5+0x000]%asi	! Mem[0000000010141400] = 146409e3 f366b28f
!	%l6 = 00000000000009e3, Mem[0000000030141400] = 00000000
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 09e30000
!	%f8  = 146409e3 f366b28f, Mem[0000000010041408] = 00cb0000 7d94ffff
	stda	%f8 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 146409e3 f366b28f
!	%f24 = ff000000 92b0a59d, %l6 = 00000000000009e3
!	Mem[0000000030041408] = 1f64cde600000000
	add	%i1,0x008,%g1
	stda	%f24,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030041408] = 9da5b092000000ff
!	%f26 = f5000000, %f9  = f366b28f
	fcmps	%fcc0,%f26,%f9 		! %fcc0 = 1
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff00564b9be7fe7e, %f12 = ff000000 599588e3
	ldda	[%i4+%o4]0x81,%f12	! %f12 = ff00564b 9be7fe7e

p0_label_137:
!	Mem[00000000300c1400] = 34abf64c 00000000, %l6 = 000009e3, %l7 = 7d94ffff
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000 0000000034abf64c
!	Mem[0000000010081438] = b9bd7bff ffffffff, %l4 = 0000cb00, %l5 = 00001f64
	ldda	[%i2+0x038]%asi,%l4	! %l4 = 00000000b9bd7bff 00000000ffffffff
!	Mem[00000000300c1410] = 00000000, %f25 = 92b0a59d
	lda	[%i3+%o5]0x81,%f25	! %f25 = 00000000
!	Mem[0000000030101408] = 7efee79b 4b5600ff, %l2 = 0000001f, %l3 = ffb60061
	ldda	[%i4+%o4]0x89,%l2	! %l2 = 000000004b5600ff 000000007efee79b
!	%f27 = 000000ff, %f16 = cb000000
	fcmps	%fcc0,%f27,%f16		! %fcc0 = 2
!	Mem[0000000010041410] = ff211eff ffffffff, %l4 = b9bd7bff, %l5 = ffffffff
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 00000000ffffffff 00000000ff211eff
!	Mem[0000000030181408] = ffffffff, %l6 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041428] = ffffffff, %l6 = 00000000000000ff
	ldsw	[%i1+0x028],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030181410] = 00000000 000000ff, %l0 = 00000021, %l1 = ffffb6ff
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ff211eff, Mem[0000000010081408] = 000000ff
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = ff211eff

p0_label_138:
!	%l3 = 000000007efee79b, Mem[0000000010141420] = ff000000
	stw	%l3,[%i5+0x020]		! Mem[0000000010141420] = 7efee79b
!	Mem[0000000010181410] = 00000000, %l2 = 000000004b5600ff
	swap	[%i6+%o5],%l2		! %l2 = 0000000000000000
!	%f0  = 1d000000, Mem[0000000010101408] = ff0000ff
	sta	%f0 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 1d000000
!	%l5 = 00000000ff211eff, Mem[0000000030141408] = e9b9d0b2
	stha	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = e9b91eff
!	%f30 = 00000000, Mem[0000000030101400] = 1d000000
	sta	%f30,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Mem[00000000100c1410] = ffffff00, %l6 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%f6  = 00000000 00ffffff, Mem[0000000010101410] = 00000000 ffffffff
	stda	%f6 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 00ffffff
!	Mem[0000000030041400] = 000000e6, %l4 = 00000000ffffffff
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 000000e6000000ff
!	%f8  = 146409e3 f366b28f, Mem[0000000010181410] = ff00564b b2000000
	stda	%f8 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 146409e3 f366b28f
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = 7efee79b, %l4 = 00000000000000e6
	lduwa	[%i5+0x020]%asi,%l4	! %l4 = 000000007efee79b

p0_label_139:
!	Mem[0000000030001410] = ff00000000000000, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = ff00000000000000
!	%f0  = 1d000000, %f11 = 2e0610dc
	fcmpes	%fcc3,%f0 ,%f11		! %fcc3 = 1
!	Mem[0000000030041410] = 00000000, %l4 = 000000007efee79b
	ldsba	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = ffb6006100000000, %l3 = 000000007efee79b
	ldxa	[%i6+%o4]0x80,%l3	! %l3 = ffb6006100000000
!	Mem[0000000010081408] = 8fb266f3ff211eff, %l7 = 0000000034abf64c
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = 8fb266f3ff211eff
!	Mem[0000000010041414] = ff1e21ff, %l0 = 00000000000000ff
	lduw	[%i1+0x014],%l0		! %l0 = 00000000ff1e21ff
!	Mem[0000000010101420] = ffff00bf, %f9  = f366b28f
	ld	[%i4+0x020],%f9 	! %f9 = ffff00bf
!	Mem[00000000300c1400] = 00000000 4cf6ab34 34abbdb9 00000000
!	Mem[00000000300c1410] = 00000000 bf00ffff 246db67a cf1cf644
!	Mem[00000000300c1420] = 146409e3 f366b28f 0231cc40 2e0610dc
!	Mem[00000000300c1430] = 300099d0 e3a23f3c 7ccdbb31 e90439af
	ldda	[%i3]ASI_BLK_AIUS,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030041408] = 9da5b092, %l2 = 0000000000000000
	ldswa	[%i1+%o4]0x81,%l2	! %l2 = ffffffff9da5b092
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_140:
!	%l2 = 9da5b092, %l3 = 00000000, Mem[0000000010041410] = ffffffff ff211eff
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 9da5b092 00000000
!	%l1 = ff00000000000000, Mem[0000000010041408] = e3096414
	stwa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000010181408] = 6100b6ff, %l0 = 00000000ff1e21ff
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 000000006100b6ff
!	%l0 = 000000006100b6ff, Mem[0000000030041408] = ff00000092b0a59d
	stxa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000006100b6ff
!	%l1 = ff00000000000000, Mem[0000000030081408] = ff880000
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	Mem[0000000010001400] = ff000000, %l7 = 8fb266f3ff211eff
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	%l5 = 00000000ff211eff, %l7 = 00000000ff000000, %y  = 4cf6adaf
	sdiv	%l5,%l7,%l0		! %l0 = ffffffff80000000
	mov	%l0,%y			! %y = 80000000
!	%l6 = 0000000000000000, Mem[0000000010081408] = ff211eff
	stba	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = ff211e00
!	%l3 = ffb6006100000000, Mem[0000000010041400] = ffff00bf
	stha	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000bf
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00007d80, %l5 = 00000000ff211eff
	ldsh	[%o0+%g0],%l5		! %l5 = 0000000000000000

p0_label_141:
!	Mem[0000000010181428] = 85ca00aa 000061b3, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+0x028]%asi,%l4	! %l4 = 0000000085ca00aa 00000000000061b3
!	Mem[0000000010001408] = 00000000, %l2 = ffffffff9da5b092
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, immed = fffff030, %y  = 80000000
	smul	%l2,-0xfd0,%l0		! %l0 = 0000000000000000, %y = 00000000
!	Mem[00000000100c1400] = ff000000 ffffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000ff000000 00000000ffffffff
!	Mem[0000000010081408] = 8fb266f3ff211e00, %l2 = 00000000ff000000
	ldxa	[%i2+%o4]0x88,%l2	! %l2 = 8fb266f3ff211e00
!	Mem[00000000211c0000] = ffff7f1a, %l4 = 0000000085ca00aa
	ldsb	[%o2+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030001400] = 000000ff, %l4 = ffffffffffffffff
	lduwa	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = ff300000, %l4 = 00000000000000ff
	lduwa	[%i3+%o4]0x80,%l4	! %l4 = 00000000ff300000
!	%l0 = 0000000000000000, immd = fffffffffffff80f, %l1  = ff00000000000000
	mulx	%l0,-0x7f1,%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = cb000000 6100b66f ff000000 00000000
!	%f20 = ff000000 599588e3 7544075b d31ad138
!	%f24 = ff000000 00000000 f5000000 000000ff
!	%f28 = 000000ff 0078ff9e 00000000 0000000b
	stda	%f16,[%i2]ASI_COMMIT_P	! Block Store to 0000000010081400

p0_label_142:
	membar	#Sync			! Added by membar checker (25)
!	%l6 = 0000000000000000, Mem[0000000010081400] = cb0000006100b66f
	stxa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000
!	%l5 = 00000000000061b3, Mem[0000000030081410] = 4cf6ab34
	stba	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = b3f6ab34
!	%l2 = 8fb266f3ff211e00, Mem[00000000300c1408] = 34abbdb9
	stba	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00abbdb9
!	Mem[00000000300c1410] = 00000000, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[000000001014140f] = 00000000, %l4 = 00000000ff300000
	ldstuba	[%i5+0x00f]%asi,%l4	! %l4 = 00000000000000ff
!	%f18 = ff000000 00000000, Mem[0000000030041408] = ffb60061 00000000
	stda	%f18,[%i1+%o4]0x81	! Mem[0000000030041408] = ff000000 00000000
!	%l4 = 0000000000000000, Mem[0000000010181410] = f366b28f
	stwa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%f12 = 300099d0 e3a23f3c, Mem[0000000010001410] = ff04b26f 00000000
	std	%f12,[%i0+%o5]	! Mem[0000000010001410] = 300099d0 e3a23f3c
!	Mem[0000000030101400] = ff000000, %l0 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff000000, %l4 = 0000000000000000
	lduha	[%i2+%o4]0x80,%l4	! %l4 = 000000000000ff00

p0_label_143:
!	Mem[0000000030001400] = ff000000, %l1 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101410] = 00000000 00ffffff, %l6 = 00000000, %l7 = ff000000
	ldda	[%i4+0x010]%asi,%l6	! %l6 = 0000000000000000 0000000000ffffff
!	Mem[0000000030041400] = 000000ff, %l1 = ffffffffffffffff
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141434] = 0078ff9e, %f24 = ff000000
	lda	[%i5+0x034]%asi,%f24	! %f24 = 0078ff9e
!	Mem[0000000030141400] = 09e30000 f366b28f, %l0 = ff000000, %l1 = 000000ff
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 0000000009e30000 00000000f366b28f
!	Mem[0000000010141408] = 000000ff, %l7 = 0000000000ffffff
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = 000030ff, %l3 = 00000000ffffffff
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041410] = 92b0a59d00000000, %f4  = 00000000 bf00ffff
	ldda	[%i1+%o5]0x80,%f4 	! %f4  = 92b0a59d 00000000
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 8fb266f3ff211e00, Mem[0000000010141428] = f5000000000000ff
	stx	%l2,[%i5+0x028]		! Mem[0000000010141428] = 8fb266f3ff211e00

p0_label_144:
!	Mem[0000000010081430] = 000000ff0078ff9e, %l5 = 00000000000061b3, %l3 = ffffffffffffffff
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 000000ff0078ff9e
!	Mem[0000000010101410] = 00000000, %l3 = 000000ff0078ff9e
	ldswa	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141404] = f366b28f, %l4 = 000000000000ff00
	swap	[%i5+0x004],%l4		! %l4 = 00000000f366b28f
!	%l0 = 0000000009e30000, %l0 = 0000000009e30000, %y  = 00000000
	umul	%l0,%l0,%l7		! %l7 = 0061bf4900000000, %y = 0061bf49
!	%l2 = 8fb266f3ff211e00, Mem[00000000100c142e] = 3ae30000, %asi = 80
	stha	%l2,[%i3+0x02e]%asi	! Mem[00000000100c142c] = 3ae31e00
!	%l2 = 8fb266f3ff211e00, Mem[0000000010141400] = 146409e30000ff00
	stxa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 8fb266f3ff211e00
!	Mem[00000000100c1430] = 00000000, %l1 = f366b28f, %l5 = 000061b3
	add	%i3,0x30,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 000000ff, %l0 = 0000000009e30000
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	%l7 = 0061bf4900000000, Mem[0000000010001408] = 00000000
	stba	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = e3889559 000000ff, %l2 = ff211e00, %l3 = 00000000
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff 00000000e3889559

p0_label_145:
!	Mem[0000000010101400] = ffff00b6 e9b9d0b2, %l6 = 00000000, %l7 = 00000000
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 00000000e9b9d0b2 00000000ffff00b6
!	Mem[0000000020800040] = ffff2c25, %l4 = 00000000f366b28f
	ldsb	[%o1+0x040],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030001408] = 000000004cf600ff, %f8  = 146409e3 f366b28f
	ldda	[%i0+%o4]0x89,%f8 	! %f8  = 00000000 4cf600ff
!	Mem[0000000030041408] = ff000000, %l5 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000020800000] = 89bf16cb, %l7 = 00000000ffff00b6
	ldsh	[%o1+%g0],%l7		! %l7 = ffffffffffff89bf
!	Mem[0000000030081410] = 6100000034abf6b3, %l1 = 00000000f366b28f
	ldxa	[%i2+%o5]0x89,%l1	! %l1 = 6100000034abf6b3
!	Mem[0000000010181410] = 00000000, %l5 = 00000000ff000000
	ldsha	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800040] = ffff2c25, %l5 = 0000000000000000
	ldub	[%o1+0x041],%l5		! %l5 = 00000000000000ff
!	Mem[000000001000141c] = 000000cb, %f3  = 00000000
	ld	[%i0+0x01c],%f3 	! %f3 = 000000cb
!	Starting 10 instruction Store Burst
!	Mem[000000001004141c] = 000000ff, %l6 = 00000000e9b9d0b2, %asi = 80
	swapa	[%i1+0x01c]%asi,%l6	! %l6 = 00000000000000ff

p0_label_146:
!	Mem[00000000100c1408] = 000030ff, %l6 = 00000000000000ff
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 00000000000030ff
!	%l7 = ffffffffffff89bf, immed = 00000897, %y  = 0061bf49
	umul	%l7,0x897,%l4		! %l4 = 00000896fc0837a9, %y = 00000896
!	%l0 = 00000000000000ff, Mem[0000000010101408] = 1d000000
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	%l3 = 00000000e3889559, Mem[0000000010101408] = ff000000
	stba	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 59000000
!	%l6 = 00000000000030ff, Mem[0000000010041400] = bf000000
	stwa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 000030ff
!	Mem[0000000010141408] = ff000000, %l1 = 6100000034abf6b3
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 00000000ff000000
!	%l6 = 00000000000030ff, Mem[0000000030181408] = ffffffff
	stha	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = ffff30ff
!	%f16 = cb000000, Mem[0000000030001408] = 4cf600ff
	sta	%f16,[%i0+%o4]0x89	! Mem[0000000030001408] = cb000000
!	%f26 = f5000000 000000ff, Mem[0000000030041408] = 000000ff 00000000
	stda	%f26,[%i1+%o4]0x89	! Mem[0000000030041408] = f5000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l3 = 00000000e3889559
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_147:
!	Mem[0000000010101424] = 21ff4d4a, %l3 = 0000000000000000
	lduw	[%i4+0x024],%l3		! %l3 = 0000000021ff4d4a
!	Mem[0000000030001410] = 00000000000000ff, %f14 = 7ccdbb31 e90439af
	ldda	[%i0+%o5]0x81,%f14	! %f14 = 00000000 000000ff
!	Mem[0000000030081408] = 00000000, %l1 = 00000000ff000000
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 146409e3, %l1 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 00000000000009e3
!	Mem[0000000010181400] = 000000cb, %l1 = 00000000000009e3
	lduwa	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000cb
!	Mem[0000000030041408] = 000000ff, %f5  = 00000000
	lda	[%i1+%o4]0x89,%f5 	! %f5 = 000000ff
!	Mem[0000000010081400] = 00000000, %l5 = 00000000000000ff
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 000000cb, %l6 = 00000000000030ff
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000cb
!	Mem[0000000030081400] = 000066f3, %l3 = 0000000021ff4d4a
	ldswa	[%i2+%g0]0x89,%l3	! %l3 = 00000000000066f3
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 00000000, %l7 = ffffffffffff89bf
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff

p0_label_148:
!	%l4 = 00000896fc0837a9, Mem[0000000010141408] = b3f6ab34
	stba	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = b3f6aba9
!	Mem[0000000010181428] = 85ca00aa000061b3, %l2 = 00000000000000ff, %l7 = 0000000000000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = 85ca00aa000061b3
!	Mem[000000001018141a] = ffb266f3, %l1 = 00000000000000cb
	ldstuba	[%i6+0x01a]%asi,%l1	! %l1 = 00000066000000ff
!	%l0 = 00000000000000ff, Mem[0000000010181418] = ffb2fff38185ca1e, %asi = 80
	stxa	%l0,[%i6+0x018]%asi	! Mem[0000000010181418] = 00000000000000ff
!	Mem[0000000010041410] = 9da5b092, %l3 = 00000000000066f3
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 000000009da5b092
!	%f26 = f5000000, %f2  = 34abbdb9, %f22 = 7544075b d31ad138
	fsmuld	%f26,%f2 ,%f22		! %f22 = c54577b7 20000000
!	Mem[00000000201c0001] = 00007d80, %l5 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141410] = e3096414, %l2 = 00000000000000ff
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000e3096414
!	%f11 = 2e0610dc, Mem[0000000030041410] = 00000000
	sta	%f11,[%i1+%o5]0x81	! Mem[0000000030041410] = 2e0610dc
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000000cb, %l0 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_149:
!	%f10 = 0231cc40, %f17 = 6100b66f
	fcmps	%fcc0,%f10,%f17		! %fcc0 = 1
!	Mem[0000000010041410] = f366000000000000, %f14 = 00000000 000000ff
	ldda	[%i1+%o5]0x80,%f14	! %f14 = f3660000 00000000
!	Mem[0000000030141408] = ff1eb9e9b600ffff, %f30 = 00000000 0000000b
	ldda	[%i5+%o4]0x81,%f30	! %f30 = ff1eb9e9 b600ffff
!	Mem[0000000030081400] = 000066f3, %l3 = 000000009da5b092
	ldswa	[%i2+%g0]0x89,%l3	! %l3 = 00000000000066f3
!	Mem[0000000010001404] = e90439af, %l1 = 0000000000000066
	ldsb	[%i0+0x007],%l1		! %l1 = ffffffffffffffaf
!	Mem[000000001014140c] = 000000ff, %l4 = 00000896fc0837a9
	lduw	[%i5+0x00c],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030041400] = 000000ff, %l3 = 00000000000066f3
	ldsba	[%i1+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	%l7 = 85ca00aa000061b3, %l3 = ffffffffffffffff, %l0  = 0000000000000000
	mulx	%l7,%l3,%l0		! %l0 = 7a35ff55ffff9e4d
!	Mem[0000000030141410] = ff000000, %l4 = 00000000000000ff
	ldswa	[%i5+%o5]0x89,%l4	! %l4 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = ffff7f1a, %l5 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 000000ff000000ff

p0_label_150:
!	Mem[0000000010081410] = ff000000, %l3 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010001408] = 00000000, %l2 = 00000000e3096414
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f17 = 6100b66f, Mem[00000000300c1400] = 00000000
	sta	%f17,[%i3+%g0]0x81	! Mem[00000000300c1400] = 6100b66f
!	%l1 = ffffffffffffffaf, Mem[00000000300c1408] = 00abbdb9
	stba	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = afabbdb9
!	%l3 = 00000000000000ff, Mem[0000000030141400] = 09e30000
	stwa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff
!	%l2 = 0000000000000000, Mem[0000000010001408] = 000000ff
	stwa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	%l6 = 00000000000000cb, Mem[0000000010041410] = 000066f3
	stba	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 000066cb
!	%l1 = ffffffffffffffaf, Mem[0000000030041408] = f5000000000000ff
	stxa	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffffffffffaf
!	Mem[000000001010143c] = 0000000a, %l1 = ffffffaf, %l6 = 000000cb
	add	%i4,0x3c,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 000000000000000a
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000000000000000, %l0 = 7a35ff55ffff9e4d
	ldxa	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000

p0_label_151:
!	Mem[0000000010141410] = ff000000, %f20 = ff000000
	lda	[%i5+%o5]0x80,%f20	! %f20 = ff000000
!	Mem[00000000100c1408] = ff000000, %l6 = 000000000000000a
	lduwa	[%i3+0x008]%asi,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030181408] = ff30ffff, %f13 = e3a23f3c
	lda	[%i6+%o4]0x81,%f13	! %f13 = ff30ffff
!	Mem[0000000030041410] = 2e0610dc, %l3 = 00000000000000ff
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = 000000002e0610dc
!	Mem[0000000010041410] = 000066cb, %f7  = cf1cf644
	lda	[%i1+%o5]0x88,%f7 	! %f7 = 000066cb
!	Mem[0000000030041408] = ffffffaf, %l3 = 000000002e0610dc
	ldsba	[%i1+%o4]0x89,%l3	! %l3 = ffffffffffffffaf
!	Mem[00000000100c1410] = ffffff00, %l6 = 00000000ff000000
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041400] = 000030ff, %l7 = 85ca00aa000061b3
	ldsha	[%i1+%g0]0x88,%l7	! %l7 = 00000000000030ff
!	Mem[0000000030001408] = 000000cb, %f26 = f5000000
	lda	[%i0+%o4]0x81,%f26	! %f26 = 000000cb
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffaf, Mem[000000001014143a] = 00000000
	stb	%l3,[%i5+0x03a]		! Mem[0000000010141438] = 0000af00

p0_label_152:
!	%l2 = 0000000000000000, Mem[00000000100c1410] = ffffff00
	stha	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000ff00
!	%l7 = 00000000000030ff, Mem[0000000010181408] = ff211eff, %asi = 80
	stwa	%l7,[%i6+0x008]%asi	! Mem[0000000010181408] = 000030ff
!	Mem[0000000030081408] = ff000000, %l0 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	%f17 = 6100b66f, Mem[0000000030181400] = 00000000
	sta	%f17,[%i6+%g0]0x89	! Mem[0000000030181400] = 6100b66f
!	%f16 = cb000000 6100b66f ff000000 00000000
!	%f20 = ff000000 599588e3 c54577b7 20000000
!	%f24 = 0078ff9e 00000000 000000cb 000000ff
!	%f28 = 000000ff 0078ff9e ff1eb9e9 b600ffff
	stda	%f16,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	%l2 = 00000000, %l3 = ffffffaf, Mem[0000000010041408] = 00000000 8fb266f3
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 ffffffaf
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010081410] = ff000000, %l2 = 00000000, %l6 = ffffffff
	add	%i2,0x10,%g1
	casa	[%g1]0x80,%l2,%l6	! %l6 = 00000000ff000000
!	%l6 = ff000000, %l7 = 000030ff, Mem[0000000030001408] = cb000000 00000000
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = ff000000 000030ff
!	%l6 = 00000000ff000000, Mem[0000000010141400] = 8fb266f3
	stha	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 000066f3
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff7d80, %l1 = ffffffffffffffaf
	ldsh	[%o0+%g0],%l1		! %l1 = 00000000000000ff

p0_label_153:
!	Mem[0000000030181410] = 000000ff, %l6 = 00000000ff000000
	lduwa	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181408] = 00000000ff300000, %l4 = ffffffffff000000
	ldxa	[%i6+%o4]0x88,%l4	! %l4 = 00000000ff300000
!	Mem[0000000030141408] = ff1eb9e9, %l5 = 00000000000000ff
	ldswa	[%i5+%o4]0x81,%l5	! %l5 = ffffffffff1eb9e9
!	Mem[0000000010181410] = 146409e300000000, %l0 = 00000000ff000000
	ldxa	[%i6+%o5]0x88,%l0	! %l0 = 146409e300000000
!	Mem[0000000030181400] = 6100b66f, %l4 = 00000000ff300000
	lduha	[%i6+%g0]0x89,%l4	! %l4 = 000000000000b66f
!	Mem[00000000300c1410] = 00000000, %l4 = 000000000000b66f
	ldsha	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800040] = ffff2c25, %l5 = ffffffffff1eb9e9
	ldsha	[%o1+0x040]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1410] = 00000000, %l3 = ffffffffffffffaf
	lduwa	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l7 = 00000000000030ff, Mem[0000000030101408] = 7efee79b4b5600ff
	stxa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000000030ff
!	Starting 10 instruction Store Burst
!	Mem[0000000021800181] = 03ffc5c1, %l5 = ffffffffffffffff
	ldstuba	[%o3+0x181]%asi,%l5	! %l5 = 000000ff000000ff

p0_label_154:
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010081410] = ff000000 599588e3
	stda	%l2,[%i2+0x010]%asi	! Mem[0000000010081410] = 00000000 00000000
!	%l2 = 0000000000000000, Mem[0000000030181400] = 6100b66f
	stba	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 6100b600
!	Mem[00000000100c1410] = 00ff0000, %l0 = 146409e300000000
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%f24 = 0078ff9e 00000000, Mem[00000000300c1410] = 00000000 ffff00bf
	stda	%f24,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0078ff9e 00000000
!	Mem[00000000300c1408] = b9bdabaf, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 000000af000000ff
!	%f18 = ff000000, Mem[0000000010081400] = cb000000
	sta	%f18,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000
!	%f28 = 000000ff, Mem[0000000030081408] = 00000000
	sta	%f28,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000ff
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030081408] = 000000ff 000000ff
	stda	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 000000ff
!	%f16 = cb000000 6100b66f, Mem[0000000030181408] = ffff30ff 000000ff
	stda	%f16,[%i6+%o4]0x89	! Mem[0000000030181408] = cb000000 6100b66f
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = c0d1fd0d000030ff, %f4  = 92b0a59d 000000ff
	ldda	[%i1+%g0]0x88,%f4 	! %f4  = c0d1fd0d 000030ff

p0_label_155:
!	Mem[0000000010101428] = c06c6e39, %l0 = 0000000000000000
	ldswa	[%i4+0x028]%asi,%l0	! %l0 = ffffffffc06c6e39
!	Mem[0000000010181428] = 85ca00aa000061b3, %l5 = 00000000000000ff
	ldx	[%i6+0x028],%l5		! %l5 = 85ca00aa000061b3
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000000000
	ldsba	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 34abf6b3, %l2 = 00000000000000af
	ldsba	[%i2+%o5]0x89,%l2	! %l2 = ffffffffffffffb3
!	Mem[0000000010101410] = 0000000000ffffff, %f26 = 000000cb 000000ff
	ldda	[%i4+0x010]%asi,%f26	! %f26 = 00000000 00ffffff
!	Mem[0000000010041400] = ff300000, %l7 = 00000000000030ff
	lduha	[%i1+%g0]0x80,%l7	! %l7 = 000000000000ff30
!	Mem[0000000010181408] = 000030ff 00000000, %l6 = 000000ff, %l7 = 0000ff30
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 00000000000030ff 0000000000000000
!	Mem[0000000030081408] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 000066f3, %f26 = 00000000
	lda	[%i5+%g0]0x80,%f26	! %f26 = 000066f3
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000

p0_label_156:
!	Mem[0000000030181408] = 6fb60061, %l3 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 000000006fb60061
!	%l6 = 00000000000030ff, Mem[00000000211c0000] = ffff7f1a, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff7f1a
!	Mem[0000000010181408] = 000030ff, %l5 = 85ca00aa000061b3
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = b3f6ab34, %l2 = ffffffffffffffb3
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 000000b3000000ff
!	%l0 = ffffffffc06c6e39, Mem[0000000010101400] = ffff00b6e9b9d0b2
	stxa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffffc06c6e39
!	%l5 = 0000000000000000, Mem[0000000010041400] = ff300000
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Mem[0000000010181408] = ff0030ff, %l0 = ffffffffc06c6e39
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 00000000ff0030ff
!	%l4 = 0000000000000000, Mem[00000000201c0001] = 00ff7d80, %asi = 80
	stba	%l4,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00007d80
!	%l3 = 000000006fb60061, Mem[0000000010181410] = 00000000
	stha	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000061
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 000000ff, %l0 = 00000000ff0030ff
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff

p0_label_157:
!	Mem[0000000030081410] = fff6ab34, %l0 = 00000000000000ff
	lduwa	[%i2+%o5]0x81,%l0	! %l0 = 00000000fff6ab34
!	Mem[0000000030141400] = ff000000, %l0 = 00000000fff6ab34
	ldswa	[%i5+%g0]0x89,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030101400] = 00000000, %f9  = 4cf600ff
	lda	[%i4+%g0]0x89,%f9 	! %f9 = 00000000
!	Mem[0000000030181400] = 00b60061, %l2 = 00000000000000b3
	lduwa	[%i6+%g0]0x81,%l2	! %l2 = 0000000000b60061
!	%l1 = 0000000000000000, %l5 = 0000000000000000, %y  = 00000896
	sdiv	%l1,%l5,%l6		! Div by zero, %l0 = ffffffffff000050
	mov	%l0,%y			! %y = ff000028
!	Mem[0000000030141400] = 000000ff, %l4 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141410] = ff000000, %l7 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = 00ff00ff, %l1 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %l2 = 0000000000b60061
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_12:
!	%l0 = ffffffffff000028
	setx	0x1a890e67eed53b79,%g7,%l0 ! %l0 = 1a890e67eed53b79
!	%l1 = 00000000000000ff
	setx	0x8b4bd170764b22da,%g7,%l1 ! %l1 = 8b4bd170764b22da
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1a890e67eed53b79
	setx	0x0c1c796029eb0ecf,%g7,%l0 ! %l0 = 0c1c796029eb0ecf
!	%l1 = 8b4bd170764b22da
	setx	0xfeb22667f805e71b,%g7,%l1 ! %l1 = feb22667f805e71b

p0_label_158:
!	Mem[00000000211c0000] = ffff7f1a, %l3 = 000000006fb60061
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	%l0 = 29eb0ecf, %l1 = f805e71b, Mem[00000000300c1408] = b9bdabff 00000000
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 29eb0ecf f805e71b
!	%f28 = 000000ff, Mem[0000000030181408] = 00000000
	sta	%f28,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ff
!	%f14 = f3660000 00000000, %l7 = 00000000000000ff
!	Mem[0000000030101430] = e55dad0b03fb41ba
	add	%i4,0x030,%g1
	stda	%f14,[%g1+%l7]ASI_PST8_S ! Mem[0000000030101430] = f366000000000000
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010101400] = c06c6e39 ffffffff
	stda	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff 00000000
!	%f6  = 246db67a 000066cb, %l7 = 00000000000000ff
!	Mem[0000000010041400] = 000000000dfdd1c0
	stda	%f6,[%i1+%l7]ASI_PST32_PL ! Mem[0000000010041400] = cb6600007ab66d24
!	%l0 = 0c1c796029eb0ecf, immed = 00000b30, %y  = ff000028
	smul	%l0,0xb30,%l0		! %l0 = 000001d4f5b5abd0, %y = 000001d4
!	%f12 = 300099d0 ff30ffff, Mem[0000000010001430] = 0000006f 000000cb
	std	%f12,[%i0+0x030]	! Mem[0000000010001430] = 300099d0 ff30ffff
!	Mem[0000000010141408] = b3f6aba9, %l3 = 00000000000000ff
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 000000a9000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = cb66000000000000, %l7 = 00000000000000ff
	ldxa	[%i1+%o5]0x80,%l7	! %l7 = cb66000000000000

p0_label_159:
!	Mem[0000000030101408] = 00000000000030ff, %l3 = 00000000000000a9
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = 00000000000030ff
!	Mem[0000000010181400] = cb000000, %l0 = 000001d4f5b5abd0
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = ffffffffffffcb00
!	Mem[0000000030141400] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 00007d80, %l6 = 00000000000030ff
	ldub	[%o0+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000030081400] = f3660000, %l1 = feb22667f805e71b
	ldswa	[%i2+%g0]0x81,%l1	! %l1 = fffffffff3660000
!	Mem[00000000211c0000] = ffff7f1a, %l7 = cb66000000000000
	lduh	[%o2+%g0],%l7		! %l7 = 000000000000ffff
!	Mem[00000000100c1410] = ff00ff0000000000, %f6  = 246db67a 000066cb
	ldda	[%i3+0x010]%asi,%f6 	! %f6  = ff00ff00 00000000
!	Mem[0000000010141430] = 000000ff, %l3 = 00000000000030ff
	lduwa	[%i5+0x030]%asi,%l3	! %l3 = 00000000000000ff
!	Code Fragment 3
p0_fragment_13:
!	%l0 = ffffffffffffcb00
	setx	0x0b6bd068269b7c4a,%g7,%l0 ! %l0 = 0b6bd068269b7c4a
!	%l1 = fffffffff3660000
	setx	0x0db0a7c7b8443a2a,%g7,%l1 ! %l1 = 0db0a7c7b8443a2a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0b6bd068269b7c4a
	setx	0x79b02328753184ce,%g7,%l0 ! %l0 = 79b02328753184ce
!	%l1 = 0db0a7c7b8443a2a
	setx	0xae4c63b85199e491,%g7,%l1 ! %l1 = ae4c63b85199e491
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010141408] = b3f6abff
	stba	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = b3f6ab00

p0_label_160:
!	Mem[000000001018140a] = c06c6e39, %l6 = 0000000000000000
	ldstuba	[%i6+0x00a]%asi,%l6	! %l6 = 0000006e000000ff
!	%f27 = 00ffffff, Mem[00000000300c1400] = 6100b66f
	sta	%f27,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00ffffff
!	Mem[0000000010181400] = 000000cb, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000cb
!	%l3 = 00000000000000ff, Mem[0000000030041410] = 2e0610dc00000000
	stxa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000000000ff
!	Mem[00000000100c1400] = ff000000, %l1 = ae4c63b85199e491
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ff000000
!	%f0  = 00000000, Mem[0000000030141410] = 000000ff
	sta	%f0 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%l0 = 79b02328753184ce, Mem[0000000010141400] = f3660000
	stwa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 753184ce
!	Mem[0000000010101432] = 6a78424a, %l3 = 00000000000000ff
	ldstub	[%i4+0x032],%l3		! %l3 = 00000042000000ff
!	Mem[0000000010081400] = 000000ff, %l6 = 000000000000006e
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000ff, %l3 = 0000000000000042
	lduba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000

p0_label_161:
!	Mem[0000000010141428] = 8fb266f3, %l7 = 000000000000ffff
	ldsw	[%i5+0x028],%l7		! %l7 = ffffffff8fb266f3
!	Mem[0000000010001400] = af3904e9ff1e21ff, %l7 = ffffffff8fb266f3
	ldxa	[%i0+%g0]0x88,%l7	! %l7 = af3904e9ff1e21ff
!	Mem[0000000030001410] = ff00000000000000, %l0 = 79b02328753184ce
	ldxa	[%i0+%o5]0x89,%l0	! %l0 = ff00000000000000
!	Mem[0000000010141400] = ce843175ff211e00, %l5 = 00000000000000cb
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = ce843175ff211e00
!	Code Fragment 3
p0_fragment_14:
!	%l0 = ff00000000000000
	setx	0xb7035f9f8862b404,%g7,%l0 ! %l0 = b7035f9f8862b404
!	%l1 = 00000000ff000000
	setx	0x545c8affb034e91f,%g7,%l1 ! %l1 = 545c8affb034e91f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b7035f9f8862b404
	setx	0x97f0bfa845b453c9,%g7,%l0 ! %l0 = 97f0bfa845b453c9
!	%l1 = 545c8affb034e91f
	setx	0xb8f675b02558f679,%g7,%l1 ! %l1 = b8f675b02558f679
!	%l6 = 00000000000000ff, imm = 0000000000000851, %l3 = 0000000000000000
	xnor	%l6,0x851,%l3		! %l3 = fffffffffffff751
!	Mem[0000000030101408] = ff300000, %l3 = fffffffffffff751
	lduwa	[%i4+%o4]0x81,%l3	! %l3 = 00000000ff300000
!	Mem[0000000010081408] = ff000000, %l3 = 00000000ff300000
	lduba	[%i2+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = 0000000000000000, %l7 = af3904e9ff1e21ff
	ldxa	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f25 = 00000000, Mem[00000000300c1408] = cf0eeb29
	sta	%f25,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000

p0_label_162:
!	%l0 = 97f0bfa845b453c9, Mem[0000000010181410] = 61000000
	stba	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = c9000000
!	Mem[0000000010041400] = cb660000, %l3 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000cb660000
!	%l6 = 00000000000000ff, Mem[0000000010001408] = 00000000
	stba	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000
!	Mem[00000000300c1410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l2 = ff000000, %l3 = cb660000, Mem[0000000030141400] = ff000000 8fb266f3
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ff000000 cb660000
!	Mem[0000000030001408] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%f30 = ff1eb9e9 b600ffff, Mem[0000000010181400] = 00000000 e904b26f
	stda	%f30,[%i6+%g0]0x80	! Mem[0000000010181400] = ff1eb9e9 b600ffff
!	%l3 = 00000000cb660000, Mem[0000000030101410] = 00000000cb000000
	stxa	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000cb660000
!	%f17 = 6100b66f, Mem[0000000030181400] = 00b60061
	sta	%f17,[%i6+%g0]0x81	! Mem[0000000030181400] = 6100b66f
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = d0990030, %l2 = 00000000ff000000
	ldsba	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000030

p0_label_163:
!	%f31 = b600ffff, %f6  = ff00ff00
	fsqrts	%f31,%f6 		! %f6  = 7fffffff
!	Mem[0000000010141410] = e3889559 000000ff, %l2 = 00000030, %l3 = cb660000
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff 00000000e3889559
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010181400] = ff1eb9e9 b600ffff c06cff39 00000000
!	Mem[0000000010181410] = c9000000 e3096414 00000000 000000ff
!	Mem[0000000010181420] = ffffffff dc000000 85ca00aa 000061b3
!	Mem[0000000010181430] = 4cf6ab34 618f63d5 3988957a d31ad138
	ldda	[%i6]ASI_BLK_P,%f0	! Block Load from 0000000010181400
!	Mem[00000000100c1410] = 00ff00ff, %l5 = ce843175ff211e00
	ldsha	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101438] = 5bff63b2, %l6 = 00000000000000ff
	ldsba	[%i4+0x03a]%asi,%l6	! %l6 = 0000000000000063
!	%l6 = 0000000000000063, %l6 = 0000000000000063, %l1 = b8f675b02558f679
	and	%l6,%l6,%l1		! %l1 = 0000000000000063
!	Mem[0000000010081438] = ff1eb9e9, %f23 = 20000000
	ld	[%i2+0x038],%f23	! %f23 = ff1eb9e9
!	Mem[0000000030081408] = 00000000, %l3 = 00000000e3889559
	ldsha	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = ffff7f1a, %l0 = 97f0bfa845b453c9
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, imm = 000000000000052f, %l4 = 0000000000000000
	xnor	%l2,0x52f,%l4		! %l4 = fffffffffffffa2f

p0_label_164:
!	Mem[0000000010041434] = 618f63d5, %l1 = 0000000000000063
	swap	[%i1+0x034],%l1		! %l1 = 00000000618f63d5
!	%l2 = 00000000000000ff, Mem[00000000100c1410] = 00ff00ff
	stba	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00ff00ff
!	%l4 = fffffa2f, %l5 = 000000ff, Mem[0000000010081408] = ff000000 00000000
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = fffffa2f 000000ff
!	Mem[0000000010101400] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (28)
!	%l5 = 00000000000000ff, Mem[0000000010181410] = 146409e3000000c9
	stxa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000000000ff
!	Mem[0000000010001410] = 300099d0, %l6 = 0000000000000063
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 00000030000000ff
!	Mem[0000000010001408] = ff000000, %l5 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	%l1 = 00000000618f63d5, Mem[0000000010041400] = 000000ff
	stha	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 63d500ff
!	%l6 = 00000030, %l7 = 00000000, Mem[0000000010141400] = 753184ce 001e21ff
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000030 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 30000000 00000000, %l4 = fffffa2f, %l5 = ff000000
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 0000000030000000 0000000000000000

p0_label_165:
!	Mem[0000000010101400] = 000000ff, %f19 = 00000000
	lda	[%i4+%g0]0x88,%f19	! %f19 = 000000ff
!	Mem[00000000100c1408] = 00000000000000ff, %l2 = 00000000000000ff
	ldxa	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000000000ff, imm = ffffffffffffff14, %l4 = 0000000030000000
	xor	%l0,-0x0ec,%l4		! %l4 = ffffffffffffffeb
!	Mem[0000000010181408] = 39ff6cc0, %l5 = 0000000000000000
	lduba	[%i6+%o4]0x88,%l5	! %l5 = 00000000000000c0
!	Mem[00000000100c1418] = 000000000000ffff, %l1 = 00000000618f63d5
	ldx	[%i3+0x018],%l1		! %l1 = 000000000000ffff
!	%l7 = 0000000000000000, %l5 = 00000000000000c0, %l3 = 00000000000000ff
	andn	%l7,%l5,%l3		! %l3 = 0000000000000000
!	Mem[0000000010141420] = 7efee79b, %l5 = 00000000000000c0
	ldsh	[%i5+0x020],%l5		! %l5 = 0000000000007efe
!	Mem[0000000010101400] = ff000000, %l3 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030101400] = 00000000, %l5 = 0000000000007efe
	lduha	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000030, Mem[0000000020800040] = ffff2c25
	stb	%l6,[%o1+0x040]		! Mem[0000000020800040] = 30ff2c25

p0_label_166:
!	%f30 = ff1eb9e9 b600ffff, %l1 = 000000000000ffff
!	Mem[0000000030041408] = afffffffffffffff
	add	%i1,0x008,%g1
	stda	%f30,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030041408] = ffff00b6e9b91eff
!	%l4 = ffffffffffffffeb, Mem[0000000010181400] = e9b91eff
	stwa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffeb
!	%l4 = ffffffffffffffeb, Mem[0000000010181438] = 3988957ad31ad138
	stx	%l4,[%i6+0x038]		! Mem[0000000010181438] = ffffffffffffffeb
!	Mem[0000000030101410] = 000066cb, %l6 = 0000000000000030
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000000066cb
!	%f15 = d31ad138, Mem[0000000030101400] = 00000000
	sta	%f15,[%i4+%g0]0x81	! Mem[0000000030101400] = d31ad138
!	Mem[0000000010101400] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000020800000] = 89bf16cb, %l3 = ffffffffffffff00
	ldstuba	[%o1+0x000]%asi,%l3	! %l3 = 00000089000000ff
!	%f8  = ffffffff dc000000, Mem[0000000010141400] = 30000000 00000000
	stda	%f8 ,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffffff dc000000
!	%l1 = 000000000000ffff, Mem[0000000010081428] = 000000cb000000ff, %asi = 80
	stxa	%l1,[%i2+0x028]%asi	! Mem[0000000010081428] = 000000000000ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 000000ff, %l3 = 0000000000000089
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffffffff

p0_label_167:
!	Mem[000000001018141c] = 000000ff, %l7 = 00000000000000ff
	ldsw	[%i6+0x01c],%l7		! %l7 = 00000000000000ff
!	Mem[0000000020800000] = ffbf16cb, %l1 = 000000000000ffff
	ldsh	[%o1+%g0],%l1		! %l1 = ffffffffffffffbf
!	Mem[0000000010001408] = ff000000, %l2 = 00000000000000ff
	lduha	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l4 = ffffffffffffffeb
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041408] = 00000000, %f6  = 00000000
	lda	[%i1+%o4]0x88,%f6 	! %f6 = 00000000
!	Mem[0000000010041410] = 000066cb, %l0 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l0	! %l0 = 00000000000066cb
!	Mem[0000000010181400] = ffffffeb, %l2 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 000000eb000000ff
!	Mem[00000000100c1408] = 00000000000000ff, %l0 = 00000000000066cb
	ldxa	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1424] = 4cf6ab34, %f30 = ff1eb9e9
	lda	[%i3+0x024]%asi,%f30	! %f30 = 4cf6ab34
!	Starting 10 instruction Store Burst
!	%f3  = 00000000, Mem[0000000010081408] = fffffa2f
	sta	%f3 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000

p0_label_168:
!	%l1 = ffffffffffffffbf, Mem[0000000030041400] = ff000000f366b28f
	stxa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffffffffffbf
!	%l0 = 00000000000000ff, Mem[00000000211c0000] = ffff7f1a
	sth	%l0,[%o2+%g0]		! Mem[00000000211c0000] = 00ff7f1a
!	%f4  = c9000000 e3096414, %l3 = ffffffffffffffff
!	Mem[00000000100c1400] = 5199e491ffffffff
	stda	%f4,[%i3+%l3]ASI_PST16_P ! Mem[00000000100c1400] = c9000000e3096414
!	Mem[0000000030001400] = 000000ff, %l2 = 00000000000000eb
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000300c1410] = ff000000, %l6 = 00000000000066cb
	swapa	[%i3+%o5]0x81,%l6	! %l6 = 00000000ff000000
!	%f10 = 85ca00aa 000061b3, %l0 = 00000000000000ff
!	Mem[0000000030141408] = ff1eb9e9b600ffff
	add	%i5,0x008,%g1
	stda	%f10,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030141408] = b3610000aa00ca85
!	Mem[0000000010181408] = c06cff39, %l7 = 00000000000000ff
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 00000000c06cff39
!	%f6  = 00000000 000000ff, Mem[00000000100c1400] = c9000000 e3096414
	stda	%f6 ,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000 000000ff
!	Mem[0000000010001410] = d09900ff, %l0 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l0	! %l0 = 00000000d09900ff
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_15:
!	%l0 = 00000000d09900ff
	setx	0x77eef0b80ccdeff4,%g7,%l0 ! %l0 = 77eef0b80ccdeff4
!	%l1 = ffffffffffffffbf
	setx	0xfeedb90faa700117,%g7,%l1 ! %l1 = feedb90faa700117
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 77eef0b80ccdeff4
	setx	0x9d0947f03f4c04af,%g7,%l0 ! %l0 = 9d0947f03f4c04af
!	%l1 = feedb90faa700117
	setx	0x224d8b0875412979,%g7,%l1 ! %l1 = 224d8b0875412979

p0_label_169:
!	Mem[0000000010181408] = 000000ff, %l7 = 00000000c06cff39
	ldsha	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 00000030, %f23 = ff1eb9e9
	lda	[%i4+%o5]0x81,%f23	! %f23 = 00000030
!	Mem[00000000211c0000] = 00ff7f1a, %l5 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = ff00000000000000, %l0 = 9d0947f03f4c04af
	ldxa	[%i2+%o4]0x88,%l0	! %l0 = ff00000000000000
!	%f18 = ff000000 000000ff, Mem[0000000010101410] = 00000000 00ffffff
	stda	%f18,[%i4+%o5]0x80	! Mem[0000000010101410] = ff000000 000000ff
!	Mem[0000000030041410] = 00000000 000000ff, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000010141400] = ffffffff, %l3 = ffffffffffffffff
	ldsba	[%i5+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = ff000000, %l3 = ffffffffffffffff
	ldswa	[%i4+%g0]0x80,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010041410] = 000066cb, %l7 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l7	! %l7 = ffffffffffffffcb
!	Starting 10 instruction Store Burst
!	%l1 = 224d8b0875412979, Mem[0000000010001408] = 000000ff, %asi = 80
	stwa	%l1,[%i0+0x008]%asi	! Mem[0000000010001408] = 75412979

p0_label_170:
!	%l5 = 00000000000000ff, Mem[0000000010141410] = 000000ff
	stwa	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%l7 = ffffffffffffffcb, Mem[0000000010081400] = ff000000
	stha	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = ffcb0000
!	%f16 = cb000000 6100b66f ff000000 000000ff
!	%f20 = ff000000 599588e3 c54577b7 00000030
!	%f24 = 0078ff9e 00000000 000066f3 00ffffff
!	%f28 = 000000ff 0078ff9e 4cf6ab34 b600ffff
	stda	%f16,[%i5]ASI_COMMIT_S	! Block Store to 0000000030141400
!	Mem[0000000010001410] = 000000ff, %l0 = ff00000000000000
	swapa	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (29)
!	Mem[000000001014143e] = 0000000b, %l5 = 00000000000000ff
	ldstuba	[%i5+0x03e]%asi,%l5	! %l5 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[00000000211c0000] = 00ff7f1a
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00007f1a
!	%f14 = 3988957a d31ad138, Mem[0000000030001408] = ff0000ff ff300000
	stda	%f14,[%i0+%o4]0x81	! Mem[0000000030001408] = 3988957a d31ad138
!	%f29 = 0078ff9e, Mem[0000000030001408] = 3988957a
	sta	%f29,[%i0+%o4]0x81	! Mem[0000000030001408] = 0078ff9e
!	%l6 = 00000000ff000000, Mem[0000000030181410] = 00000000000000ff
	stxa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = 27ff7b35, %l0 = 00000000000000ff
	ldsha	[%o3+0x1c0]%asi,%l0	! %l0 = 00000000000027ff

p0_label_171:
!	Mem[00000000300c1400] = ffffff00, %l6 = 00000000ff000000
	lduwa	[%i3+%g0]0x89,%l6	! %l6 = 00000000ffffff00
!	Mem[0000000010081408] = 00000000, %l0 = 00000000000027ff
	ldswa	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = ff000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000 00000000ff000000
!	Mem[0000000021800100] = 0e006971, %l0 = 0000000000000000
	ldsba	[%o3+0x101]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = ff00ff00, %l5 = 00000000ff000000
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 00000000ff00ff00
!	Mem[0000000030101400] = 38d11ad3, %l1 = 224d8b0875412979
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000d3
!	Mem[0000000010041428] = ffffffffff7bbdb9, %f6  = 00000000 000000ff
	ldd	[%i1+0x028],%f6 	! %f6  = ffffffff ff7bbdb9
!	%l6 = ffffff00, %l7 = ffffffcb, Mem[0000000010041400] = 63d500ff 7ab66d24
	std	%l6,[%i1+%g0]		! Mem[0000000010041400] = ffffff00 ffffffcb
!	Mem[0000000030141410] = 000000ff, %l4 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f0  = ff1eb9e9 b600ffff c06cff39 00000000
!	%f4  = c9000000 e3096414 ffffffff ff7bbdb9
!	%f8  = ffffffff dc000000 85ca00aa 000061b3
!	%f12 = 4cf6ab34 618f63d5 3988957a d31ad138
	stda	%f0,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400

p0_label_172:
!	%l6 = 00000000ffffff00, Mem[0000000010041400] = cbffffff00ffffff
	stxa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000ffffff00
!	Mem[0000000010181400] = ffffffff, %l5 = 00000000ff00ff00
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 00000000ffffffff
!	%l6 = 00000000ffffff00, Mem[00000000100c1410] = ff00ff00
	stha	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff00ff00
!	Mem[0000000030141408] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l0	! %l0 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (30)
!	%l0 = 000000ff, %l1 = 000000d3, Mem[0000000030081410] = 000000c9 146409e3
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff 000000d3
!	%l1 = 00000000000000d3, Mem[0000000030001410] = 00000000
	stha	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000d3
!	Mem[0000000030141410] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030081400] = e9b91eff, %l0 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 00000000e9b91eff
!	Mem[0000000010101410] = ff000000, %l4 = ffffffffffffffff
	swapa	[%i4+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = cb0000006fb60061, %l1 = 00000000000000d3
	ldxa	[%i6+%g0]0x89,%l1	! %l1 = cb0000006fb60061

p0_label_173:
!	Mem[00000000211c0000] = 00007f1a, %l0 = 00000000e9b91eff
	ldub	[%o2+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l2 = 00000000000000ff
	ldsba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = ffcb0000, %l7 = ffffffffffffffcb
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041408] = b600ffff, %l2 = 0000000000000000
	lduha	[%i1+%o4]0x89,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010041400] = 00000000ffffff00, %l6 = 00000000ffffff00
	ldxa	[%i1+%g0]0x88,%l6	! %l6 = 00000000ffffff00
!	Mem[0000000010081408] = 00000000, %l3 = ffffffffff000000
	ldsba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 9eff7800, %l3 = 0000000000000000
	ldsha	[%i0+%o4]0x89,%l3	! %l3 = 0000000000007800
!	Mem[0000000030001410] = 000000d3, %l2 = 000000000000ffff
	lduwa	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000d3
!	Mem[0000000010141400] = ffffffffdc000000, %f4  = c9000000 e3096414
	ldd	[%i5+%g0],%f4 		! %f4  = ffffffff dc000000
!	Starting 10 instruction Store Burst
!	%f15 = d31ad138, %f12 = 4cf6ab34
	fcmpes	%fcc1,%f15,%f12		! %fcc1 = 1

p0_label_174:
!	%f24 = 0078ff9e 00000000, Mem[0000000010041400] = 00ffffff 00000000
	std	%f24,[%i1+%g0]	! Mem[0000000010041400] = 0078ff9e 00000000
!	%l0 = 0000000000000000, Mem[0000000010181408] = 000000ff
	stw	%l0,[%i6+%o4]		! Mem[0000000010181408] = 00000000
!	%l1 = cb0000006fb60061, Mem[0000000010081428] = 00000000
	stw	%l1,[%i2+0x028]		! Mem[0000000010081428] = 6fb60061
!	Mem[000000001014141c] = d31ad138, %l5 = ffffffff, %l2 = 000000d3
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 00000000d31ad138
!	%l7 = 00000000000000ff, Mem[00000000100c1410] = ff00ff00
	stha	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00ffff00
!	%l7 = 00000000000000ff, Mem[0000000021800041] = ff9e487b
	stb	%l7,[%o3+0x041]		! Mem[0000000021800040] = ffff487b
!	Mem[0000000010181410] = ff000000, %l6 = 00000000ffffff00
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000010041404] = 00000000
	sth	%l0,[%i1+0x004]		! Mem[0000000010041404] = 00000000
!	%l0 = 0000000000000000, Mem[0000000030001410] = d3000000000000ff
	stxa	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = ffffffff, %l6 = 00000000000000ff
	lduh	[%i6+0x03a],%l6		! %l6 = 000000000000ffff

p0_label_175:
!	Mem[0000000010181400] = ff00ff00b600ffff, %l5 = 00000000ffffffff
	ldxa	[%i6+%g0]0x80,%l5	! %l5 = ff00ff00b600ffff
!	Mem[0000000010081410] = 00000000, %l0 = 0000000000000000
	lduha	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = ff1e21ff, %l3 = 0000000000007800
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c1408] = 000000ff, %l2 = 00000000d31ad138
	lduba	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081408] = c06cff3900000000, %l1 = cb0000006fb60061
	ldxa	[%i2+%o4]0x81,%l1	! %l1 = c06cff3900000000
!	%l3 = 00000000000000ff, imm = fffffffffffffd92, %l6 = 000000000000ffff
	andn	%l3,-0x26e,%l6		! %l6 = 000000000000006d
!	Mem[0000000010141430] = 000000ff, %l0 = 0000000000000000
	lduha	[%i5+0x032]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181400] = 6100b66f, %f12 = 4cf6ab34
	lda	[%i6+%g0]0x81,%f12	! %f12 = 6100b66f
!	Mem[0000000010041408] = 00000000, %l1 = c06cff3900000000
	lduha	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00ffff00, %l0 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_176:
!	%f20 = ff000000 599588e3, %l1 = 0000000000000000
!	Mem[0000000030081418] = ffffffffff7bbdb9
	add	%i2,0x018,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_S ! Mem[0000000030081418] = ffffffffff7bbdb9
!	%l6 = 0000006d, %l7 = 000000ff, Mem[0000000010141430] = 000000ff 0078ff9e
	std	%l6,[%i5+0x030]		! Mem[0000000010141430] = 0000006d 000000ff
!	Mem[0000000030041410] = 00000000, %l6 = 000000000000006d
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%f24 = 0078ff9e 00000000, %l0 = 0000000000000000
!	Mem[0000000030001418] = 8fb266f38185ca1e
	add	%i0,0x018,%g1
	stda	%f24,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030001418] = 8fb266f38185ca1e
!	%f0  = ff1eb9e9 b600ffff c06cff39 00000000
!	%f4  = ffffffff dc000000 ffffffff ff7bbdb9
!	%f8  = ffffffff dc000000 85ca00aa 000061b3
!	%f12 = 6100b66f 618f63d5 3988957a d31ad138
	stda	%f0,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	%f18 = ff000000, %f28 = 000000ff, %f25 = 00000000
	fdivs	%f18,%f28,%f25		! %f25 = ff800000
!	Mem[00000000300c1410] = cb660000, %l5 = ff00ff00b600ffff
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%f30 = 4cf6ab34 b600ffff, Mem[0000000010181400] = ff00ff00 b600ffff
	stda	%f30,[%i6+%g0]0x80	! Mem[0000000010181400] = 4cf6ab34 b600ffff
!	%f31 = b600ffff, Mem[0000000030181410] = 000000ff
	sta	%f31,[%i6+%o5]0x81	! Mem[0000000030181410] = b600ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 0078ff9e, %l2 = 00000000000000ff
	lduba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000

p0_label_177:
!	Mem[0000000010141434] = 000000ff, %l0 = 0000000000000000
	ldsh	[%i5+0x034],%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1410] = ff0066cb9eff7800, %f20 = ff000000 599588e3
	ldda	[%i3+%o5]0x81,%f20	! %f20 = ff0066cb 9eff7800
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010001408] = 79294175, %l0 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000004175
!	Mem[0000000030101408] = ff300000, %l3 = 00000000000000ff
	lduba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001420] = 146409e3f366b28f, %l1 = 0000000000000000
	ldxa	[%i0+0x020]%asi,%l1	! %l1 = 146409e3f366b28f
!	%l3 = 00000000000000ff, imm = fffffffffffff6d5, %l5 = 0000000000000000
	subc	%l3,-0x92b,%l5		! %l5 = 0000000000000a2a
!	Mem[0000000020800000] = ffbf16cb, %l6 = 0000000000000000
	ldsb	[%o1+0x001],%l6		! %l6 = ffffffffffffffbf
!	%l2 = 0000000000000000, imm = fffffffffffffe93, %l4 = 00000000ff000000
	xor	%l2,-0x16d,%l4		! %l4 = fffffffffffffe93
!	Starting 10 instruction Store Burst
!	%f18 = ff000000 000000ff, Mem[0000000010001408] = 75412979 00000000
	stda	%f18,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000 000000ff

p0_label_178:
!	Mem[00000000100c1408] = ff000000, %l0 = 0000000000004175
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	%f30 = 4cf6ab34 b600ffff, %l1 = 146409e3f366b28f
!	Mem[0000000010081420] = 0078ff9e00000000
	add	%i2,0x020,%g1
	stda	%f30,[%g1+%l1]ASI_PST16_P ! Mem[0000000010081420] = 4cf6ab34b600ffff
!	%l5 = 0000000000000a2a, Mem[0000000030141408] = 000000ff
	stwa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000a2a
!	%f12 = 6100b66f 618f63d5, Mem[0000000030101400] = 38d11ad3 36000000
	stda	%f12,[%i4+%g0]0x89	! Mem[0000000030101400] = 6100b66f 618f63d5
!	%f1  = b600ffff, Mem[00000000100c1408] = ff000000
	sta	%f1 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = b600ffff
!	%f16 = cb000000, Mem[00000000100c1408] = ffff00b6
	sta	%f16,[%i3+%o4]0x88	! Mem[00000000100c1408] = cb000000
!	Mem[0000000010001408] = ff000000, %l6 = ffffffffffffffbf
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101400] = 000000ff
	stha	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	%l3 = 00000000000000ff, Mem[0000000010081408] = 00000000000000ff, %asi = 80
	stxa	%l3,[%i2+0x008]%asi	! Mem[0000000010081408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = cb0000006100b66f, %l1 = 146409e3f366b28f
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = cb0000006100b66f

p0_label_179:
!	%l2 = 0000000000000000, %l2 = 0000000000000000, %l5  = 0000000000000a2a
	mulx	%l2,%l2,%l5		! %l5 = 0000000000000000
!	Code Fragment 3
p0_fragment_16:
!	%l0 = 00000000000000ff
	setx	0x06ea2667f11207da,%g7,%l0 ! %l0 = 06ea2667f11207da
!	%l1 = cb0000006100b66f
	setx	0x29e1c3385eb49e59,%g7,%l1 ! %l1 = 29e1c3385eb49e59
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 06ea2667f11207da
	setx	0xed117670179634dc,%g7,%l0 ! %l0 = ed117670179634dc
!	%l1 = 29e1c3385eb49e59
	setx	0xdee4fc0062793a00,%g7,%l1 ! %l1 = dee4fc0062793a00
!	Mem[0000000010181410] = ff000000, %l3 = 00000000000000ff
	lduba	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101408] = ff300000, %l6 = 00000000000000ff
	ldswa	[%i4+%o4]0x81,%l6	! %l6 = ffffffffff300000
!	Mem[0000000010101408] = 00000059, %l0 = ed117670179634dc
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000059
!	Mem[00000000100c142c] = 3ae31e00, %l1 = dee4fc0062793a00
	lduh	[%i3+0x02c],%l1		! %l1 = 0000000000003ae3
!	Mem[0000000030101410] = 00000000 30000000, %l0 = 00000059, %l1 = 00003ae3
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 0000000030000000 0000000000000000
!	Mem[0000000010141410] = 000000ff, %f4  = ffffffff
	lda	[%i5+%o5]0x88,%f4 	! %f4 = 000000ff
!	Mem[0000000010081400] = 0000cbff, %f25 = ff800000
	lda	[%i2+%g0]0x88,%f25	! %f25 = 0000cbff
!	Starting 10 instruction Store Burst
!	%l6 = ff300000, %l7 = 000000ff, Mem[0000000010101408] = 59000000 8fb266f3
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = ff300000 000000ff

p0_label_180:
!	%f23 = 00000030, %f16 = cb000000, %f6  = ffffffff ff7bbdb9
	fsmuld	%f23,%f16,%f6 		! %l0 = 0000000030000022, Unfinished, %fsr = 1500000400
!	%l6 = ffffffffff300000, Mem[0000000010141410] = 000000ff
	stba	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%l6 = ffffffffff300000, Mem[0000000030141408] = 00000a2a
	stwa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = ff300000
!	%l1 = 0000000000000000, %l6 = ffffffffff300000, %l5 = 0000000000000000
	orn	%l1,%l6,%l5		! %l5 = 0000000000cfffff
!	%f10 = 85ca00aa 000061b3, Mem[0000000010001408] = 000000ff ff000000
	stda	%f10,[%i0+%o4]0x88	! Mem[0000000010001408] = 85ca00aa 000061b3
!	Mem[0000000010081424] = b600ffff, %l4 = fffffffffffffe93
	swap	[%i2+0x024],%l4		! %l4 = 00000000b600ffff
!	%f19 = 000000ff, Mem[00000000300c1408] = 00000000
	sta	%f19,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff
!	%f25 = 0000cbff, Mem[00000000100c1408] = 000000cb
	sta	%f25,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000cbff
!	Mem[0000000010181410] = 000000ff, %l0 = 0000000030000022
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00abf6b3, %l5 = 0000000000cfffff
	ldsha	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ab

p0_label_181:
!	Mem[0000000030141400] = cb000000, %l3 = 00000000000000ff
	ldsha	[%i5+%g0]0x81,%l3	! %l3 = ffffffffffffcb00
!	Mem[00000000100c1408] = ffcb0000, %l6 = ffffffffff300000
	lduha	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = ff000000, %l6 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000020800000] = ffbf16cb, %l0 = 00000000000000ff
	ldsh	[%o1+%g0],%l0		! %l0 = ffffffffffffffbf
!	Mem[0000000030041400] = ffffffff, %l4 = 00000000b600ffff
	ldswa	[%i1+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181408] = ff000000, %l6 = 000000000000ff00
	ldswa	[%i6+%o4]0x89,%l6	! %l6 = ffffffffff000000
!	Mem[00000000100c1408] = 0000cbff, %l5 = 00000000000000ab
	ldsha	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = d5638f61, %l5 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l5	! %l5 = 00000000d5638f61
!	Mem[0000000030041400] = ffffffff, %l7 = 00000000000000ff
	lduha	[%i1+%g0]0x81,%l7	! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 6100b66f, %l4 = ffffffffffffffff
	swapa	[%i6+%g0]0x81,%l4	! %l4 = 000000006100b66f

p0_label_182:
!	%f29 = 0078ff9e, Mem[0000000010001410] = 00000000
	sta	%f29,[%i0+%o5]0x88	! Mem[0000000010001410] = 0078ff9e
!	Mem[0000000030041410] = 000000ff, %l0 = ffffffffffffffbf
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%l6 = ffffffffff000000, Mem[00000000201c0001] = 00007d80
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = 00007d80
!	%f12 = 6100b66f 618f63d5, Mem[0000000030141410] = 000000ff e3889559
	stda	%f12,[%i5+%o5]0x89	! Mem[0000000030141410] = 6100b66f 618f63d5
!	%f25 = 0000cbff, %f31 = b600ffff, %f20 = ff0066cb 9eff7800
	fsmuld	%f25,%f31,%f20		! %l0 = 0000000000000121, Unfinished, %fsr = 1500000400
!	%l0 = 00000121, %l1 = 00000000, Mem[0000000030141400] = cb000000 6100b66f
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000121 00000000
!	Mem[0000000030101400] = d5638f61, %l7 = 000000000000ffff
	swapa	[%i4+%g0]0x81,%l7	! %l7 = 00000000d5638f61
!	%f30 = 4cf6ab34 b600ffff, Mem[0000000030181410] = ffff00b6 00000000
	stda	%f30,[%i6+%o5]0x89	! Mem[0000000030181410] = 4cf6ab34 b600ffff
!	%f16 = cb000000 6100b66f ff000000 000000ff
!	%f20 = ff0066cb 9eff7800 c54577b7 00000030
!	%f24 = 0078ff9e 0000cbff 000066f3 00ffffff
!	%f28 = 000000ff 0078ff9e 4cf6ab34 b600ffff
	stda	%f16,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff000000 00000000, %l4 = 6100b66f, %l5 = d5638f61
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000000 00000000ff000000

p0_label_183:
!	Mem[00000000201c0000] = 00007d80, %l6 = ffffffffff000000
	ldsb	[%o0+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000030181410] = b600ffff, %l2 = 0000000000000000
	lduwa	[%i6+%o5]0x89,%l2	! %l2 = 00000000b600ffff
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000010141400] = 000000dcffffffff, %l2 = 00000000b600ffff
	ldxa	[%i5+%g0]0x88,%l2	! %l2 = 000000dcffffffff
!	Mem[000000001010143c] = 0000000a, %l4 = 0000000000000000
	lduwa	[%i4+0x03c]%asi,%l4	! %l4 = 000000000000000a
!	Mem[0000000010041410] = cb660000, %l4 = 000000000000000a
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000cb
!	Mem[00000000100c1410] = 00ffffff, %f26 = 000066f3
	lda	[%i3+%o5]0x88,%f26	! %f26 = 00ffffff
!	Mem[0000000030141400] = cb000000, %l1 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffffffcb
!	Mem[0000000010101400] = ff000000 00000000 ff300000 000000ff
!	Mem[0000000010101410] = ffffffff 000000ff ffffffaa 00000061
!	Mem[0000000010101420] = ffff00bf 21ff4d4a c06c6e39 88e5521d
!	Mem[0000000010101430] = 6a78ff4a 82af381f 5bff63b2 0000000a
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400
!	Mem[0000000030081410] = ff000000, %l2 = 000000dcffffffff
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000121, Mem[0000000010181400] = 34abf64c
	stwa	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000121

p0_label_184:
!	%l0 = 0000000000000121, %l3 = ffffffffffffcb00, %y  = 000001d4
	sdiv	%l0,%l3,%l5		! %l5 = fffffffff72b78c2
	mov	%l0,%y			! %y = 00000121
!	Mem[0000000030081410] = 000000ff, %l1 = ffffffffffffffcb
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181401] = 21010000, %l3 = ffffffffffffcb00
	ldstub	[%i6+0x001],%l3		! %l3 = 00000001000000ff
!	%l6 = 0000000000000000, Mem[0000000030101408] = ff300000
	stba	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 00300000
!	%l1 = 00000000000000ff, Mem[0000000010001410] = 9eff7800
	sth	%l1,[%i0+%o5]		! Mem[0000000010001410] = 00ff7800
!	%l7 = 00000000d5638f61, Mem[00000000100c1400] = 00000000000000ff
	stx	%l7,[%i3+%g0]		! Mem[00000000100c1400] = 00000000d5638f61
!	Mem[0000000010141408] = 00abf6b3, %l5 = fffffffff72b78c2
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 0000000000abf6b3
!	%l3 = 0000000000000001, Mem[0000000030081408] = c06cff39
	stba	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 016cff39
!	Mem[0000000010081410] = 00000000, %l2 = 000000000000ff00
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010001400] = ff211eff e90439af b3610000 aa00ca85
!	Mem[0000000010001410] = 00ff7800 e3a23f3c 000000ff 000000cb
!	Mem[0000000010001420] = 146409e3 f366b28f 00000000 00000000
!	Mem[0000000010001430] = 300099d0 ff30ffff 7ccdbb31 e90439af
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400

p0_label_185:
!	Mem[0000000030001408] = c06cff39, %l7 = 00000000d5638f61
	lduha	[%i0+%o4]0x81,%l7	! %l7 = 000000000000c06c
!	Mem[0000000010181430] = 4cf6ab34618f63d5, %l6 = 0000000000000000
	ldxa	[%i6+0x030]%asi,%l6	! %l6 = 4cf6ab34618f63d5
!	Mem[0000000010181400] = 21ff0000, %l7 = 000000000000c06c
	lduwa	[%i6+%g0]0x80,%l7	! %l7 = 0000000021ff0000
!	Mem[00000000201c0000] = 00007d80, %l4 = 00000000000000cb
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l6 = 4cf6ab34618f63d5
	lduha	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800040] = ffff487b, %l2 = 0000000000000000
	ldsb	[%o3+0x041],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030141410] = 0078ff9ecb6600ff, %l3 = 0000000000000001
	ldxa	[%i5+%o5]0x89,%l3	! %l3 = 0078ff9ecb6600ff
!	Mem[0000000010101408] = 000030ff, %f19 = 000000ff
	lda	[%i4+%o4]0x88,%f19	! %f19 = 000030ff
!	%l7 = 0000000021ff0000, immed = fffff138, %y  = 00000121
	sdiv	%l7,-0xec8,%l3		! %l3 = ffffffffec7070a5
	mov	%l0,%y			! %y = 00000121
!	Starting 10 instruction Store Burst
!	%f16 = cb000000 6100b66f, %l4 = 0000000000000000
!	Mem[0000000010181430] = 4cf6ab34618f63d5
	add	%i6,0x030,%g1
	stda	%f16,[%g1+%l4]ASI_PST8_P ! Mem[0000000010181430] = 4cf6ab34618f63d5

p0_label_186:
!	%f25 = 0000cbff, Mem[0000000030101400] = ffff0000
	sta	%f25,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000cbff
!	%l6 = 00000000, %l7 = 21ff0000, Mem[0000000010141420] = 7efee79b 92b0a59d
	std	%l6,[%i5+0x020]		! Mem[0000000010141420] = 00000000 21ff0000
!	%l4 = 00000000, %l5 = 00abf6b3, Mem[00000000100c1410] = 00ffffff 00000000
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 00abf6b3
!	%l6 = 00000000, %l7 = 21ff0000, Mem[0000000030041408] = b600ffff ff1eb9e9
	stda	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 21ff0000
!	Mem[00000000100c1408] = 0000cbff, %l1 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 000000000000cbff
!	%l2 = ffffffff, %l3 = ec7070a5, Mem[0000000010081400] = ffcb0000 6100b66f
	std	%l2,[%i2+%g0]		! Mem[0000000010081400] = ffffffff ec7070a5
!	%l5 = 0000000000abf6b3, Mem[0000000010081408] = 00000000000000ff
	stxa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000abf6b3
!	%l4 = 0000000000000000, Mem[0000000030101408] = 00300000
	stwa	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[0000000010141408] = c2782bf7, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 000000f7000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001018143c] = ffffffeb, %l2 = ffffffffffffffff
	lduh	[%i6+0x03e],%l2		! %l2 = 000000000000ffeb

p0_label_187:
!	Mem[0000000010001400] = ff211eff, %f31 = b600ffff
	lda	[%i0+%g0]0x80,%f31	! %f31 = ff211eff
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000030041400] = ffffffff ffffffbf 00000000 0000ff21
!	Mem[0000000030041410] = bfffffff 000000ff 27160706 b11aeb38
!	Mem[0000000030041420] = 31f7bf47 e247debb 23044fbf 7237118d
!	Mem[0000000030041430] = 8ec1195f 11815484 ad880a76 65450a09
	ldda	[%i1]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030041400
!	%l5 = 0000000000abf6b3, %l6 = 00000000000000f7, %l7 = 0000000021ff0000
	sub	%l5,%l6,%l7		! %l7 = 0000000000abf5bc
!	Mem[0000000021800080] = 62ff6f0b, %l3 = ffffffffec7070a5
	ldsba	[%o3+0x081]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041424] = ffff00bf, %l3 = ffffffffffffffff
	ldsw	[%i1+0x024],%l3		! %l3 = ffffffffffff00bf
!	Mem[0000000010181400] = ffff00b60000ff21, %f30 = 4cf6ab34 ff211eff
	ldda	[%i6+%g0]0x88,%f30	! %f30 = ffff00b6 0000ff21
!	Mem[0000000010101400] = 00000000000000ff, %f30 = ffff00b6 0000ff21
	ldda	[%i4+%g0]0x88,%f30	! %f30 = 00000000 000000ff
!	Mem[0000000010101408] = ff300000000000ff, %f18 = ff000000 000030ff
	ldda	[%i4+%o4]0x80,%f18	! %f18 = ff300000 000000ff
!	Mem[0000000030041410] = ffffffbf, %l3 = ffffffffffff00bf
	ldsba	[%i1+%o5]0x89,%l3	! %l3 = ffffffffffffffbf
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ffff00b6, %l7 = 0000000000abf5bc
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 00000000ffff00b6

p0_label_188:
!	%f30 = 00000000 000000ff, Mem[00000000300c1408] = ff000000 f805e71b
	stda	%f30,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 000000ff
!	Mem[00000000100c1410] = 00000000, %l3 = ffffffffffffffbf
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (35)
!	%f16 = cb000000 6100b66f, %l5 = 0000000000abf6b3
!	Mem[0000000030041418] = 27160706b11aeb38
	add	%i1,0x018,%g1
	stda	%f16,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030041418] = 6fb607060000ebcb
!	%l2 = 0000ffeb, %l3 = 00000000, Mem[0000000010041420] = ffffffff ffff00bf
	std	%l2,[%i1+0x020]		! Mem[0000000010041420] = 0000ffeb 00000000
!	%l1 = 000000000000cbff, Mem[0000000030081408] = 0000000039ff6c01
	stxa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000000000cbff
!	%l3 = 0000000000000000, Mem[0000000010101410] = ffffffff
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l4 = 00000000, %l5 = 00abf6b3, Mem[00000000300c1408] = ff000000 00000000
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 00abf6b3
!	%l1 = 000000000000cbff, Mem[0000000010001410] = 00ff7800
	stwa	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000cbff
!	%f16 = cb000000 6100b66f ff300000 000000ff
!	%f20 = ff0066cb 9eff7800 c54577b7 00000030
!	%f24 = 0078ff9e 0000cbff 00ffffff 00ffffff
!	%f28 = 000000ff 0078ff9e 00000000 000000ff
	stda	%f16,[%i3]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000

p0_label_189:
!	Mem[000000001010142c] = 88e5521d, %l7 = 00000000ffff00b6
	ldsba	[%i4+0x02e]%asi,%l7	! %l7 = 0000000000000052
!	Mem[0000000010001410] = 0000cbffe3a23f3c, %f6  = 38eb1ab1 06071627
	ldda	[%i0+%o5]0x80,%f6 	! %f6  = 0000cbff e3a23f3c
!	Mem[0000000021800180] = 03ffc5c1, %l0 = 0000000000000121
	ldsba	[%o3+0x181]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001408] = b3610000, %l7 = 0000000000000052
	ldsha	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffb361
!	Mem[0000000030001410] = ffffffff, %l0 = ffffffffffffffff
	ldsha	[%i0+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030081410] = cbffffff d3000000, %l6 = 000000f7, %l7 = ffffb361
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000cbffffff 00000000d3000000
!	Mem[0000000030101400] = 6100b66f 0000cbff, %l4 = 00000000, %l5 = 00abf6b3
	ldda	[%i4+%g0]0x89,%l4	! %l4 = 000000000000cbff 000000006100b66f
!	Mem[0000000030181400] = ffffffff, %l1 = 000000000000cbff
	lduba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = cb660000, %l2 = 000000000000ffeb
	lduh	[%i1+0x012],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[0000000010001408] = 000061b3
	stba	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 000061ff

p0_label_190:
	membar	#Sync			! Added by membar checker (36)
!	%l1 = 00000000000000ff, Mem[00000000300c1408] = ff300000
	stha	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ff0000
!	%l4 = 0000cbff, %l5 = 6100b66f, Mem[0000000030081400] = ff000000 b600ffff
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000cbff 6100b66f
!	%l6 = 00000000cbffffff, Mem[0000000010141408] = ff2b78c2
	stha	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = ffff78c2
!	%f28 = 000000ff 0078ff9e, Mem[0000000010181408] = 00000000 00000000
	stda	%f28,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff 0078ff9e
!	%l4 = 000000000000cbff, Mem[0000000030081400] = 0000cbff
	stwa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000cbff
!	Mem[0000000010001408] = 000061ff, %l7 = 00000000d3000000
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	%l7 = 00000000000000ff, %l2 = 0000000000000000, %y  = 00000121
	sdiv	%l7,%l2,%l0		! Div by zero, %l0 = 000000000000004f
	mov	%l0,%y			! %y = 00000027
!	Mem[0000000010081400] = ffffffff, %l5 = 000000006100b66f
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000021800081] = 62ff6f0b, %l5 = 00000000000000ff
	ldstuba	[%o3+0x081]%asi,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 30000000, %l1 = 00000000000000ff
	ldsha	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000

p0_label_191:
!	Mem[0000000010181428] = 85ca00aa000061b3, %l5 = 00000000000000ff
	ldxa	[%i6+0x028]%asi,%l5	! %l5 = 85ca00aa000061b3
!	Mem[00000000100c1430] = 00000000, %l7 = 00000000000000ff
	ldsw	[%i3+0x030],%l7		! %l7 = 0000000000000000
!	Mem[0000000010001428] = 00000000 00000000, %l2 = 00000000, %l3 = 00000000
	ldd	[%i0+0x028],%l2		! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030001410] = ffffffff, %l6 = 00000000cbffffff
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001408] = 39ff6cc0, %l2 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l2	! %l2 = 0000000039ff6cc0
!	Mem[0000000010081410] = ff00000000000000, %l5 = 85ca00aa000061b3
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = ff00000000000000
!	Code Fragment 4
p0_fragment_17:
!	%l0 = 0000000000000027
	setx	0x75f6a2dfaf3ea011,%g7,%l0 ! %l0 = 75f6a2dfaf3ea011
!	%l1 = 0000000000000000
	setx	0x22bf85a005254b52,%g7,%l1 ! %l1 = 22bf85a005254b52
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 75f6a2dfaf3ea011
	setx	0xab5a3aa799dbae2d,%g7,%l0 ! %l0 = ab5a3aa799dbae2d
!	%l1 = 22bf85a005254b52
	setx	0xf178083832eab694,%g7,%l1 ! %l1 = f178083832eab694
!	Mem[0000000030041408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 000000ff, %l1 = f178083832eab694
	lduwa	[%i6+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff

p0_label_192:
!	Mem[00000000300c1410] = cb6600ff, %l2 = 0000000039ff6cc0
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 00000000cb6600ff
!	Mem[0000000030141410] = cb6600ff, %l2 = 00000000cb6600ff
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 00000000cb6600ff
!	%l1 = 00000000000000ff, Mem[0000000010001410] = 0000cbff
	stba	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = ff00cbff
!	%l6 = ffffffffffffffff, Mem[0000000010081428] = 6fb600610000ffff, %asi = 80
	stxa	%l6,[%i2+0x028]%asi	! Mem[0000000010081428] = ffffffffffffffff
!	%f12 = 84548111 5f19c18e, %l3 = 0000000000000000
!	Mem[0000000030141430] = 000000ff0078ff9e
	add	%i5,0x030,%g1
	stda	%f12,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030141430] = 000000ff0078ff9e
!	%l1 = 00000000000000ff, Mem[0000000030181400] = ffffffff
	stha	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 00ffffff
!	Mem[0000000030141410] = cb6600ff, %l0 = ab5a3aa799dbae2d
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030081408] = ffcb0000, %l0 = 00000000000000ff
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ffcb0000
!	Mem[00000000300c1410] = 39ff6cc0, %l5 = ff00000000000000
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 000000c0000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 000000ff, %f0  = bfffffff
	lda	[%i6+%o4]0x81,%f0 	! %f0 = 000000ff

p0_label_193:
!	Mem[0000000010001420] = 146409e3 f366b28f, %l4 = 0000cbff, %l5 = 000000c0
	ldd	[%i0+0x020],%l4		! %l4 = 00000000146409e3 00000000f366b28f
!	%f19 = 000000ff, %f13 = 5f19c18e
	fsqrts	%f19,%f13		! %l0 = 00000000ffcb0022, Unfinished, %fsr = 1500000400
!	Mem[0000000010041410] = 000066cb, %l6 = ffffffffffffffff
	lduwa	[%i1+%o5]0x88,%l6	! %l6 = 00000000000066cb
!	Mem[0000000030141408] = ff000000, %l0 = 00000000ffcb0022
	ldsba	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181408] = 000000ff, %l4 = 00000000146409e3
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = bfffffff, %l0 = ffffffffffffffff
	lduh	[%i3+0x012],%l0		! %l0 = 000000000000ffff
!	Mem[00000000100c1400] = 00000000 d5638f61 000000ff 00000000
!	Mem[00000000100c1410] = bfffffff b3f6ab00 00000000 0000ffff
!	Mem[00000000100c1420] = 0000217f 4cf6ab34 ffffd100 3ae31e00
!	Mem[00000000100c1430] = 00000000 cb000000 38d11ad3 7a958839
	ldda	[%i3]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010041410] = cb660000, %l4 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l4	! %l4 = ffffffffffffcb66
!	Mem[0000000030001400] = ff1eb9e9b600ffff, %f14 = 090a4565 760a88ad
	ldda	[%i0+%g0]0x81,%f14	! %f14 = ff1eb9e9 b600ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = ff00cbff, %l2 = 00000000cb6600ff
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 000000ff000000ff

p0_label_194:
!	%l4 = ffffffffffffcb66, Mem[0000000030001400] = ff1eb9e9
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffcb66
!	Mem[0000000010081408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (37)
!	%l2 = 00000000000000ff, Mem[00000000100c1408] = ff000000
	stwa	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	%l2 = 00000000000000ff, Mem[0000000010081410] = ff000000
	stwa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	Mem[0000000010041400] = 0078ff9e, %l2 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[00000000218001c1] = 27ff7b35
	stb	%l3,[%o3+0x1c1]		! Mem[00000000218001c0] = 27007b35
!	%f30 = 38d11ad3, Mem[00000000100c140c] = 00000000
	st	%f30,[%i3+0x00c]	! Mem[00000000100c140c] = 38d11ad3
!	%l3 = 0000000000000000, Mem[0000000030001410] = ffffffff
	stwa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%l3 = 0000000000000000, Mem[00000000100c1411] = bfffffff, %asi = 80
	stba	%l3,[%i3+0x011]%asi	! Mem[00000000100c1410] = bf00ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000000000ff, %f0  = 000000ff ffffffff
	ldda	[%i4+%g0]0x88,%f0 	! %f0  = 00000000 000000ff

p0_label_195:
!	Mem[0000000010141430] = 0000006d, %l5 = 00000000f366b28f
	ldsha	[%i5+0x032]%asi,%l5	! %l5 = 000000000000006d
!	Mem[0000000010081438] = ff1eb9e9 b600ffff, %l0 = 0000ffff, %l1 = 000000ff
	ldd	[%i2+0x038],%l0		! %l0 = 00000000ff1eb9e9 00000000b600ffff
!	Mem[0000000030001400] = 66cbffff, %l6 = 00000000000066cb
	ldswa	[%i0+%g0]0x89,%l6	! %l6 = 0000000066cbffff
!	%f9  = 47bff731, %f6  = 0000cbff, %f4  = ff000000
	fdivs	%f9 ,%f6 ,%f4 		! %f4  = 7f800000
!	Mem[0000000030101400] = ffcb0000, %l2 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l2	! %l2 = 000000000000ffcb
!	Mem[0000000010081418] = c54577b720000000, %f20 = bfffffff b3f6ab00
	ldda	[%i2+0x018]%asi,%f20	! %f20 = c54577b7 20000000
!	Mem[0000000010081408] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = 000000ff, %l2 = 000000000000ffcb
	lduba	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101408] = 000030ff, %l7 = 00000000000000ff
	lduba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000066cbffff, Mem[0000000021800180] = 03ffc5c1
	sth	%l6,[%o3+0x180]		! Mem[0000000021800180] = ffffc5c1

p0_label_196:
!	%l1 = 00000000b600ffff, Mem[00000000211c0000] = 00007f1a
	stb	%l1,[%o2+%g0]		! Mem[00000000211c0000] = ff007f1a
!	%l2 = 00000000000000ff, Mem[00000000201c0000] = 00007d80, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff7d80
!	Mem[0000000030041410] = ffffffbf, %l5 = 000000000000006d
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 000000bf000000ff
!	Mem[0000000010181410] = 22000030, %l5 = 00000000000000bf
	ldstuba	[%i6+%o5]0x80,%l5	! %l5 = 00000022000000ff
!	%l4 = ffffffffffffcb66, %l1 = 00000000b600ffff, %l4 = ffffffffffffcb66
	or	%l4,%l1,%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010081408] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181410] = 00abf5bc, %l0 = 00000000ff1eb9e9
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030141410] = ff0066cb
	stba	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 000066cb
!	%f24 = 0000217f 4cf6ab34, Mem[0000000030101410] = 30000000 00000000
	stda	%f24,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000217f 4cf6ab34
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = ffffd100 3ae31e00, %l6 = 66cbffff, %l7 = 000000ff
	ldd	[%i3+0x028],%l6		! %l6 = 00000000ffffd100 000000003ae31e00

p0_label_197:
!	Mem[0000000030081408] = ff000000, %l1 = 00000000b600ffff
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = cb000000, %f9  = 47bff731
	lda	[%i5+%g0]0x81,%f9 	! %f9 = cb000000
!	Mem[0000000021800180] = ffffc5c1, %l2 = 00000000000000ff
	lduh	[%o3+0x180],%l2		! %l2 = 000000000000ffff
!	Mem[00000000300c1408] = 00ff0000, %f22 = 00000000
	lda	[%i3+%o4]0x81,%f22	! %f22 = 00ff0000
!	Mem[0000000010181410] = ff000030, %l5 = 0000000000000022
	ldsba	[%i6+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141400] = cb000000, %l2 = 000000000000ffff
	lduha	[%i5+%g0]0x81,%l2	! %l2 = 000000000000cb00
!	Mem[0000000010141410] = e388955900000000, %l5 = ffffffffffffffff
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = e388955900000000
!	Mem[00000000300c1400] = cb000000 6100b66f 00ff0000 000000ff
!	Mem[00000000300c1410] = ff6cff39 9eff7800 c54577b7 00000030
!	Mem[00000000300c1420] = 0078ff9e 0000cbff 00ffffff 00ffffff
!	Mem[00000000300c1430] = 000000ff 0078ff9e 00000000 000000ff
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010101400] = ff00000000000000, %f8  = bbde47e2 cb000000
	ldda	[%i4+%g0]0x80,%f8 	! %f8  = ff000000 00000000
!	Starting 10 instruction Store Burst
!	%l5 = e388955900000000, Mem[0000000030001410] = 00000000
	stha	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000

p0_label_198:
!	%l2 = 000000000000cb00, Mem[0000000010081408] = ff000000
	stba	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	Mem[0000000020800040] = 30ff2c25, %l5 = e388955900000000
	ldstuba	[%o1+0x040]%asi,%l5	! %l5 = 00000030000000ff
!	%l7 = 000000003ae31e00, Mem[00000000211c0000] = ff007f1a, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 1e007f1a
!	%l6 = ffffd100, %l7 = 3ae31e00, Mem[0000000030081408] = 000000ff 00000000
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffd100 3ae31e00
!	Mem[00000000300c1408] = 00ff0000, %l6 = 00000000ffffd100
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%f4  = 7f800000, Mem[0000000010001400] = ff1e21ff
	sta	%f4 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 7f800000
!	Mem[0000000030001408] = c06cff39, %l2 = 000000000000cb00
	ldstuba	[%i0+%o4]0x81,%l2	! %l2 = 000000c0000000ff
!	%l2 = 00000000000000c0, immed = 00000627, %y  = 00000027
	umul	%l2,0x627,%l7		! %l7 = 0000000000049d40, %y = 00000000
!	%l2 = 00000000000000c0, Mem[0000000010101428] = c06c6e3988e5521d, %asi = 80
	stxa	%l2,[%i4+0x028]%asi	! Mem[0000000010101428] = 00000000000000c0
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000300000ff, %l6 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l6	! %l6 = 00000000300000ff

p0_label_199:
!	Mem[0000000010141410] = e388955900000000, %l4 = ffffffffffffffff
	ldxa	[%i5+%o5]0x88,%l4	! %l4 = e388955900000000
!	Mem[0000000030001410] = 00000000, %f2  = 21ff0000
	lda	[%i0+%o5]0x81,%f2 	! %f2 = 00000000
!	Mem[0000000030141408] = ff000000000000ff, %l7 = 0000000000049d40
	ldxa	[%i5+%o4]0x81,%l7	! %l7 = ff000000000000ff
!	Mem[0000000020800000] = ffbf16cb, %l1 = 0000000000000000
	lduba	[%o1+0x001]%asi,%l1	! %l1 = 00000000000000bf
!	%l4 = 00000000, %l5 = 00000030, Mem[0000000030101408] = 00000000 00000000
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 00000030
!	Mem[00000000300c1410] = 39ff6cff, %l0 = 0000000000000000
	lduha	[%i3+%o5]0x89,%l0	! %l0 = 0000000000006cff
!	Mem[0000000010041408] = 00000000, %l1 = 00000000000000bf
	ldswa	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l2 = 00000000000000c0
	lduba	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l4 = e388955900000000
	lduwa	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, imm = 0000000000000267, %l0 = 0000000000006cff
	or	%l1,0x267,%l0		! %l0 = 0000000000000267

p0_label_200:
!	%l6 = 00000000300000ff, %l0 = 0000000000000267, %l0 = 0000000000000267
	subc	%l6,%l0,%l0		! %l0 = 000000002ffffe98
!	Mem[0000000010081400] = ffffffff, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010141434] = 000000ff, %l6 = 00000000300000ff
	swap	[%i5+0x034],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010001400] = 0000807f, %l1 = 0000000000000000, %asi = 80
	swapa	[%i0+0x000]%asi,%l1	! %l1 = 000000000000807f
!	Mem[00000000300c1408] = 0000ffff, %l7 = ff000000000000ff
	swapa	[%i3+%o4]0x89,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030041408] = ff000000, %l7 = 000000000000ffff
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[000000001000142c] = 00000000, %l3 = 00000000ffffffff
	swap	[%i0+0x02c],%l3		! %l3 = 0000000000000000
!	Mem[00000000100c1415] = b3f6ab00, %l4 = 0000000000000000
	ldstub	[%i3+0x015],%l4		! %l4 = 000000f6000000ff
!	%f12 = 84548111, Mem[0000000030181410] = ffabf5bc
	sta	%f12,[%i6+%o5]0x81	! Mem[0000000030181410] = 84548111
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 30000000 00000000, %l0 = 2ffffe98, %l1 = 0000807f
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000 0000000030000000

p0_label_201:
!	Mem[0000000010081400] = 00000000, %l6 = 00000000000000ff
	lduha	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l1 = 0000000030000000
	ldswa	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = ffff78c2, %f5  = ffffffbf
	lda	[%i5+%o4]0x80,%f5 	! %f5 = ffff78c2
!	Mem[00000000211c0000] = 1e007f1a, %l3 = 0000000000000000
	lduh	[%o2+%g0],%l3		! %l3 = 0000000000001e00
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010041400] = ff78ff9e 00000000 00000000 afffffff
!	Mem[0000000010041410] = cb660000 00000000 00000000 e9b9d0b2
!	Mem[0000000010041420] = 0000ffeb 00000000 ffffffff ff7bbdb9
!	Mem[0000000010041430] = 6fb60061 00000063 3988957a d31ad138
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[0000000010141408] = c278ffff, %f20 = ff6cff39
	lda	[%i5+%o4]0x88,%f20	! %f20 = c278ffff
!	Mem[0000000030081410] = cbffffffd3000000, %f28 = 000000ff 0078ff9e
	ldda	[%i2+%o5]0x81,%f28	! %f28 = cbffffff d3000000
!	Mem[0000000030001400] = ffffcb66, %l2 = 0000000000000000
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffffcb66
!	Mem[0000000030181410] = 11815484, %f25 = 0000cbff
	lda	[%i6+%o5]0x89,%f25	! %f25 = 11815484
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000030, Mem[00000000218000c0] = 8309f956
	stb	%l5,[%o3+0x0c0]		! Mem[00000000218000c0] = 3009f956

p0_label_202:
!	%l3 = 0000000000001e00, Mem[0000000010141410] = 00000000
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 00001e00
!	Mem[0000000030001410] = 00000000, %l0 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%f20 = c278ffff 9eff7800, %l5 = 0000000000000030
!	Mem[0000000010081418] = c54577b720000000
	add	%i2,0x018,%g1
	stda	%f20,[%g1+%l5]ASI_PST8_P ! Mem[0000000010081418] = c545ffff20000000
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000030
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041410] = cb660000, %l3 = 0000000000001e00
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 000000cb000000ff
!	%l1 = 0000000000000000, Mem[0000000010101410] = 00000000
	stha	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	Mem[00000000211c0001] = 1e007f1a, %l0 = 0000000000000000
	ldstub	[%o2+0x001],%l0		! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010001430] = 300099d0, %asi = 80
	stwa	%l0,[%i0+0x030]%asi	! Mem[0000000010001430] = 00000000
!	%l0 = 0000000000000000, Mem[0000000020800040] = ffff2c25
	stb	%l0,[%o1+0x040]		! Mem[0000000020800040] = 00ff2c25
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000ff, %f23 = 00000030
	lda	[%i3+%o4]0x89,%f23	! %f23 = 000000ff

p0_label_203:
!	Mem[0000000010101410] = 00000000 000000ff, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000 00000000000000ff
!	Mem[0000000010041400] = 9eff78ff, %l0 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l0	! %l0 = ffffffff9eff78ff
!	Mem[0000000030081408] = ffffd100 3ae31e00, %l0 = 9eff78ff, %l1 = 00000000
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 00000000ffffd100 000000003ae31e00
!	Mem[00000000100c1410] = bf00ffff, %l5 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l5	! %l5 = 000000000000bf00
!	Mem[0000000010181400] = 21ff0000, %l2 = ffffffffffffcb66
	lduba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000021
!	Mem[0000000010081400] = ff000000, %l2 = 0000000000000021
	ldswa	[%i2+0x000]%asi,%l2	! %l2 = ffffffffff000000
!	Mem[000000001010141c] = 00000061, %l2 = ffffffffff000000
	ldsba	[%i4+0x01d]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 000000cb, %l7 = 00000000000000ff
	ldsha	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000cb
!	Mem[0000000030181408] = ff000000, %l1 = 000000003ae31e00
	ldsha	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = 00000000 000000ff, %l6 = 0000000000000000
!	Mem[0000000010181420] = ffffffffdc000000
	add	%i6,0x020,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_P ! Mem[0000000010181420] = ffffffffdc000000

p0_label_204:
!	%l6 = 0000000000000000, Mem[0000000030101400] = ffcb0000
	stha	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%l3 = 00000000000000cb, Mem[00000000100c1400] = 00000000
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000cb
!	%f18 = 00ff0000 000000ff, Mem[00000000300c1400] = 000000cb 6fb60061
	stda	%f18,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00ff0000 000000ff
!	Mem[0000000010041408] = 00000000, %l1 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%l0 = 00000000ffffd100, Mem[00000000218000c0] = 3009f956
	sth	%l0,[%o3+0x0c0]		! Mem[00000000218000c0] = d100f956
!	%f26 = 00ffffff 00ffffff, %l3 = 00000000000000cb
!	Mem[0000000030081430] = 4cf6ab34618f63d5
	add	%i2,0x030,%g1
	stda	%f26,[%g1+%l3]ASI_PST16_S ! Mem[0000000030081430] = 00ffab3400ffffff
!	Mem[0000000010041400] = 9eff78ff, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 000000009eff78ff
!	Mem[0000000030181400] = ffffff00, %l7 = 00000000000000cb
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 00000000ffffff00
!	%l7 = 00000000ffffff00, imm = 000000000000047f, %l1 = 0000000000000000
	orn	%l7,0x47f,%l1		! %l1 = ffffffffffffff80
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 000066ff, %l6 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l6	! %l6 = ffffffffffffffff

p0_label_205:
!	Mem[00000000218000c0] = d100f956, %l6 = ffffffffffffffff
	ldub	[%o3+0x0c0],%l6		! %l6 = 00000000000000d1
!	Mem[0000000030101408] = 0000000000000030, %f0  = ff78ff9e 00000000
	ldda	[%i4+%o4]0x81,%f0 	! %f0  = 00000000 00000030
!	Mem[0000000030081400] = ffcb0000, %l2 = 000000009eff78ff
	lduwa	[%i2+%g0]0x89,%l2	! %l2 = 00000000ffcb0000
!	Mem[0000000010081408] = 00000000, %l5 = 000000000000bf00
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = ffffffff, %l4 = 00000000000000f6
	lduwa	[%i1+%g0]0x89,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030081410] = ffffffcb, %f10 = ffffffff
	lda	[%i2+%o5]0x89,%f10	! %f10 = ffffffcb
!	%l2 = 00000000ffcb0000, %l3 = 00000000000000cb, %y  = 00000000
	sdiv	%l2,%l3,%l6		! %l6 = 000000000142938b
	mov	%l0,%y			! %y = ffffd100
!	Mem[0000000030081400] = ffcb0000, %l6 = 000000000142938b
	lduha	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141418] = 7544075bd31ad138, %l2 = 00000000ffcb0000
	ldx	[%i5+0x018],%l2		! %l2 = 7544075bd31ad138
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffffffff, Mem[00000000100c1410] = bf00ffffb3ffab00
	stx	%l4,[%i3+%o5]		! Mem[00000000100c1410] = 00000000ffffffff

p0_label_206:
!	%l3 = 00000000000000cb, Mem[0000000030181410] = 84548111
	stwa	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000cb
!	Mem[0000000010081408] = 00000000, %l0 = 00000000ffffd100
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, %l3 = 00000000000000cb, %l0 = 0000000000000000
	orn	%l0,%l3,%l0		! %l0 = ffffffffffffff34
!	Mem[0000000010141400] = ffffffff, %l3 = 00000000000000cb
	ldstuba	[%i5+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030101400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = ffffffcb, %l2 = 7544075bd31ad138
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 000000cb000000ff
!	%l0 = ffffff34, %l1 = ffffff80, Mem[0000000010181400] = 21ff0000 b600ffff
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffff34 ffffff80
!	Mem[0000000010181434] = 618f63d5, %l5 = 0000000000000000
	swap	[%i6+0x034],%l5		! %l5 = 00000000618f63d5
!	%f6  = 00000000 e9b9d0b2, %l6 = 0000000000000000
!	Mem[0000000010081438] = ff1eb9e9b600ffff
	add	%i2,0x038,%g1
	stda	%f6,[%g1+%l6]ASI_PST8_P ! Mem[0000000010081438] = ff1eb9e9b600ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000, %l2 = 00000000000000cb
	ldswa	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_207:
!	Mem[0000000010001410] = ff00cbff, %f28 = cbffffff
	lda	[%i0+%o5]0x80,%f28	! %f28 = ff00cbff
!	Mem[0000000010101410] = 00000000, %l1 = ffffffffffffff80
	ldsba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l0 = ffffffffffffff34
	ldswa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 000000cb, %f11 = ff7bbdb9
	lda	[%i3+%g0]0x88,%f11	! %f11 = 000000cb
!	Mem[0000000030001400] = ffffcb66, %l6 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000211c0000] = 1eff7f1a, %l6 = 00000000000000ff
	lduba	[%o2+0x000]%asi,%l6	! %l6 = 000000000000001e
!	Mem[000000001004140c] = afffffff, %l2 = 0000000000000000
	ldub	[%i1+0x00f],%l2		! %l2 = 00000000000000ff
!	%l0 = 0000000000000000, imm = 0000000000000f1a, %l1 = 0000000000000000
	addc	%l0,0xf1a,%l1		! %l1 = 0000000000000f1a
!	Mem[0000000030001400] = ffffcb66, %f6  = 00000000
	lda	[%i0+%g0]0x81,%f6 	! %f6 = ffffcb66
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000001e, Mem[0000000010141408] = ff000000c278ffff
	stxa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000000000001e

p0_label_208:
!	%l0 = 0000000000000000, Mem[0000000030181400] = 000000cb
	stwa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%l7 = 00000000ffffff00, Mem[00000000211c0000] = 1eff7f1a
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = ff007f1a
!	Mem[0000000030101408] = 00000000, %l5 = 00000000618f63d5
	ldstuba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101428] = 00000000, %l3 = 0000000000000000, %asi = 80
	swapa	[%i4+0x028]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010181410] = ff000030, %l2 = 00000000000000ff
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ff000030
!	%f9  = 00000000, Mem[0000000010001410] = ffcb00ff
	sta	%f9 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Starting 10 instruction Load Burst
!	%l3 = 0000000000000000, imm = fffffffffffff165, %l4 = 00000000ffffffff
	addc	%l3,-0xe9b,%l4		! %l4 = fffffffffffff165

p0_label_209:
!	Mem[0000000010041408] = 00000000, %l6 = 000000000000001e
	lduha	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 000000ff 000000cb, %l0 = 00000000, %l1 = 00000f1a
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 00000000000000ff 00000000000000cb
!	Mem[0000000010041410] = 000066ff, %l3 = 0000000000000000
	lduba	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001410] = 00000000e3a23f3c, %f16 = cb000000 6100b66f
	ldda	[%i0+%o5]0x80,%f16	! %f16 = 00000000 e3a23f3c
!	Mem[0000000030001400] = ffff00b666cbffff, %f28 = ff00cbff d3000000
	ldda	[%i0+%g0]0x89,%f28	! %f28 = ffff00b6 66cbffff
!	Mem[0000000030181400] = 00000000000000cb, %f28 = ffff00b6 66cbffff
	ldda	[%i6+%g0]0x81,%f28	! %f28 = 00000000 000000cb
!	Mem[0000000010041408] = 00000000, %l2 = 00000000ff000030
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = ffffffff00000000, %l4 = fffffffffffff165
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = ffffffff00000000
!	Mem[00000000100c1408] = ff00000038d11ad3, %f0  = 00000000 00000030
	ldda	[%i3+%o4]0x80,%f0 	! %f0  = ff000000 38d11ad3
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[000000001010140a] = ff300000
	sth	%l2,[%i4+0x00a]		! Mem[0000000010101408] = ff300000

p0_label_210:
!	%l0 = 000000ff, %l1 = 000000cb, Mem[0000000030101400] = 000000ff 6100b66f
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff 000000cb
!	%l7 = 00000000ffffff00, Mem[0000000010181400] = 34ffffff
	stwa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffff00
!	%l7 = 00000000ffffff00, Mem[00000000300c1400] = ff000000
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffff00
!	%l4 = 00000000, %l5 = ff000000, Mem[0000000010181400] = ffffff00 80ffffff
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 ff000000
!	%l6 = 0000000000000000, Mem[0000000010101400] = ff00000000000000
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000000000
!	Mem[0000000010181408] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i6+0x008]%asi,%l2	! %l2 = 00000000000000ff
!	%l1 = 00000000000000cb, immed = fffffd87, %y  = ffffd100
	smul	%l1,-0x279,%l6		! %l6 = fffffffffffe0a0d, %y = ffffffff
!	%l6 = fffe0a0d, %l7 = ffffff00, Mem[0000000030141408] = 000000ff ff000000
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = fffe0a0d ffffff00
	membar	#Sync			! Added by membar checker (39)
!	%f30 = 00000000 000000ff, Mem[0000000010041400] = 00000000 00000000
	std	%f30,[%i1+%g0]	! Mem[0000000010041400] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff6cff39, %l4 = ffffffff00000000
	ldswa	[%i3+%o5]0x81,%l4	! %l4 = ffffffffff6cff39

p0_label_211:
!	Mem[0000000030081410] = ffffffff, %l4 = ffffffffff6cff39
	lduha	[%i2+%o5]0x81,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010141400] = ffffffff, %f20 = c278ffff
	lda	[%i5+%g0]0x88,%f20	! %f20 = ffffffff
!	Mem[00000000300c1408] = 000000ff, %f7  = e9b9d0b2
	lda	[%i3+%o4]0x89,%f7 	! %f7 = 000000ff
!	Mem[0000000030001408] = 39ff6cff, %l6 = fffffffffffe0a0d
	lduba	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101400] = ff000000, %l1 = 00000000000000cb
	lduha	[%i4+%g0]0x81,%l1	! %l1 = 000000000000ff00
!	%l0 = 00000000000000ff, %l4 = 000000000000ffff, %l4 = 000000000000ffff
	sub	%l0,%l4,%l4		! %l4 = ffffffffffff0100
!	Mem[000000001004142f] = ff7bbdb9, %l6 = 00000000000000ff
	ldstub	[%i1+0x02f],%l6		! %l6 = 000000b9000000ff
!	Mem[0000000010101404] = 00000000, %l0 = 00000000000000ff
	lduba	[%i4+0x004]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 00000000ffffffff, %f2  = 00000000 afffffff
	ldda	[%i3+%o5]0x80,%f2 	! %f2  = 00000000 ffffffff
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffff0100, Mem[0000000030141400] = cb000000
	stba	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000

p0_label_212:
!	%f27 = 00ffffff, Mem[0000000030141410] = 000066cb
	sta	%f27,[%i5+%o5]0x81	! Mem[0000000030141410] = 00ffffff
!	Mem[0000000010181408] = ff0000ff, %l7 = 00000000ffffff00
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 00000000ff0000ff
!	Mem[0000000030041400] = ffffffff, %l3 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030081400] = 0000cbff, %l3 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l3	! %l3 = 000000000000cbff
!	%l7 = 00000000ff0000ff, Mem[00000000100c1410] = 00000000ffffffff
	stxa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000ff0000ff
!	%l6 = 00000000000000b9, Mem[0000000030001400] = 66cbffff
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000b9
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l6 = 00000000000000b9, Mem[00000000211c0000] = ff007f1a, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = b9007f1a
!	%l4 = ffffffffffff0100, Mem[00000000100c1410] = 00000000
	stha	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 01000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000cb, %l5 = 00000000ff000000
	ldsha	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000

p0_label_213:
!	Mem[00000000100c1408] = ff000000, %l0 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010001400] = 00000000, %l4 = ffffffffffff0100
	ldsba	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001014142c] = ff211e00, %l1 = 000000000000ff00
	ldsw	[%i5+0x02c],%l1		! %l1 = ffffffffff211e00
!	Mem[0000000010081400] = a57070ec000000ff, %f20 = ffffffff 9eff7800
	ldda	[%i2+%g0]0x88,%f20	! %f20 = a57070ec 000000ff
!	%l7 = 00000000ff0000ff, %l3 = 000000000000cbff, %l2 = 0000000000000000
	sdivx	%l7,%l3,%l2		! %l2 = 0000000000014001
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000030041400] = ffffffff ffffffbf ff000000 0000ff21
!	Mem[0000000030041410] = ffffffff 000000ff 6fb60706 0000ebcb
!	Mem[0000000030041420] = 31f7bf47 e247debb 23044fbf 7237118d
!	Mem[0000000030041430] = 8ec1195f 11815484 ad880a76 65450a09
	ldda	[%i1]ASI_BLK_SL,%f0	! Block Load from 0000000030041400
!	Mem[0000000030101400] = ff000000 cb000000 ff000000 00000030
!	Mem[0000000030101410] = 34abf64c 7f210000 35f607b4 45a8d46d
!	Mem[0000000030101420] = ead7cbe7 3ce8a40a 30ac171b 27bec53e
!	Mem[0000000030101430] = f3660000 00000000 dcf36ede cf55fcc6
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000030081408] = ffffd100, %l0 = 000000000000ff00
	ldsba	[%i2+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001400] = b9000000, %l1 = ffffffffff211e00
	lduwa	[%i0+%g0]0x81,%l1	! %l1 = 00000000b9000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[0000000030181400] = 00000000000000cb
	stxa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffffffffffff

p0_label_214:
!	Mem[0000000010141408] = 1e000000, %l7 = ff0000ff, %l6 = 000000b9
	add	%i5,0x08,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 000000001e000000
!	%f9  = 47bff731, Mem[0000000030081408] = ffffd100
	sta	%f9 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 47bff731
!	%f9  = 47bff731, Mem[0000000030001410] = ff000000
	sta	%f9 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 47bff731
!	%l6 = 000000001e000000, Mem[0000000010001428] = 00000000, %asi = 80
	stwa	%l6,[%i0+0x028]%asi	! Mem[0000000010001428] = 1e000000
!	Mem[0000000010181420] = ffffffff, %l2 = 0000000000014001, %asi = 80
	swapa	[%i6+0x020]%asi,%l2	! %l2 = 00000000ffffffff
!	%l3 = 000000000000cbff, Mem[0000000010181430] = 4cf6ab34
	stb	%l3,[%i6+0x030]		! Mem[0000000010181430] = fff6ab34
!	Mem[0000000030101410] = 34abf64c, %l7 = 00000000ff0000ff
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 0000000034abf64c
!	Mem[00000000300c1410] = ff6cff39, %l1 = 00000000b9000000
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010001408] = ff610000, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 00000000ff610000
!	Starting 10 instruction Load Burst
!	Mem[000000001008141c] = 20000000, %l0 = ffffffffffffffff
	lduwa	[%i2+0x01c]%asi,%l0	! %l0 = 0000000020000000

p0_label_215:
!	Mem[0000000010081438] = ff1eb9e9, %l3 = 000000000000cbff
	lduw	[%i2+0x038],%l3		! %l3 = 00000000ff1eb9e9
!	Mem[0000000010081400] = ff000000ec7070a5, %f6  = cbeb0000 0607b66f
	ldda	[%i2+%g0]0x80,%f6 	! %f6  = ff000000 ec7070a5
!	Mem[0000000030001408] = 39ff6cff, %l2 = 00000000ffffffff
	lduha	[%i0+%o4]0x89,%l2	! %l2 = 0000000000006cff
!	%l5 = 00000000ff610000, %l0 = 0000000020000000, %l7  = 0000000034abf64c
	mulx	%l5,%l0,%l7		! %l7 = 1fec200000000000
!	Mem[0000000010001418] = 000000ff, %l1 = 00000000000000ff
	lduba	[%i0+0x018]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l2 = 0000000000006cff
	lduwa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i2+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1400] = 00ffffff, %l3 = 00000000ff1eb9e9
	ldswa	[%i3+%g0]0x89,%l3	! %l3 = 0000000000ffffff
!	Mem[0000000010041408] = 00000000afffffff, %f6  = ff000000 ec7070a5
	ldda	[%i1+0x008]%asi,%f6 	! %f6  = 00000000 afffffff
!	Starting 10 instruction Store Burst
!	%l7 = 1fec200000000000, Mem[0000000010101408] = ff300000
	stba	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00300000

p0_label_216:
!	%f12 = 84548111 5f19c18e, Mem[0000000010141400] = ffffffff dc000000
	stda	%f12,[%i5+%g0]0x80	! Mem[0000000010141400] = 84548111 5f19c18e
!	Mem[0000000030181400] = ffffffff, %l5 = 00000000ff610000
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000021800040] = ffff487b, %l5 = 00000000000000ff
	ldstub	[%o3+0x040],%l5		! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000030141400] = 00000000
	stwa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff
!	%l2 = ffffffffffffffff, Mem[0000000010081416] = 00000000
	stb	%l2,[%i2+0x016]		! Mem[0000000010081414] = 0000ff00
!	Mem[00000000211c0000] = b9007f1a, %l4 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 000000b9000000ff
!	%l4 = 000000b9, %l5 = 000000ff, Mem[0000000010081400] = ff000000 ec7070a5
	std	%l4,[%i2+%g0]		! Mem[0000000010081400] = 000000b9 000000ff
!	%l4 = 000000b9, %l5 = 000000ff, Mem[0000000010181418] = 00000000 000000ff
	stda	%l4,[%i6+0x018]%asi	! Mem[0000000010181418] = 000000b9 000000ff
!	%f0  = bfffffff ffffffff, Mem[0000000010001408] = 00000000 85ca00aa
	stda	%f0 ,[%i0+%o4]0x88	! Mem[0000000010001408] = bfffffff ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l2 = ffffffffffffffff
	ldswa	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000

p0_label_217:
!	%l5 = 00000000000000ff, immed = 000004e8, %y  = ffffffff
	smul	%l5,0x4e8,%l5		! %l5 = 000000000004e318, %y = 00000000
!	Mem[0000000010001408] = ffffffff, %l0 = 0000000020000000
	lduba	[%i0+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l5 = 000000000004e318, %l3 = 0000000000ffffff, %l4  = 00000000000000b9
	mulx	%l5,%l3,%l4		! %l4 = 000004e317fb1ce8
!	Mem[0000000020800040] = 00ff2c25, %l2 = 0000000000000000
	ldub	[%o1+0x041],%l2		! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = cb000000 d5638f61, %l2 = 000000ff, %l3 = 00ffffff
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000cb000000 00000000d5638f61
!	Mem[0000000030041400] = ffffffffffffffbf, %l3 = 00000000d5638f61
	ldxa	[%i1+%g0]0x81,%l3	! %l3 = ffffffffffffffbf
!	Mem[0000000010141408] = 0000001e, %f18 = ff000000
	lda	[%i5+%o4]0x88,%f18	! %f18 = 0000001e
!	Mem[0000000010081408] = 00d1ffff, %l1 = 0000000000000000
	lduha	[%i2+%o4]0x80,%l1	! %l1 = 00000000000000d1
!	Mem[0000000010141400] = 11815484, %l2 = 00000000cb000000
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = 0000000000005484
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = ffffffff, %l5 = 000000000004e318
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 00000000ffffffff

p0_label_218:
!	Mem[0000000010181410] = 000000ff, %l3 = ffffffffffffffbf
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%f24 = ead7cbe7 3ce8a40a, Mem[0000000010141408] = 1e000000 00000000
	stda	%f24,[%i5+%o4]0x80	! Mem[0000000010141408] = ead7cbe7 3ce8a40a
!	%l0 = 00000000000000ff, Mem[0000000010101400] = 0000000000000000
	stx	%l0,[%i4+%g0]		! Mem[0000000010101400] = 00000000000000ff
!	%l4 = 000004e317fb1ce8, Mem[0000000010141400] = 11815484
	stba	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 118154e8
!	%l2 = 00005484, %l3 = 000000ff, Mem[0000000010041408] = 00000000 ffffffaf
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00005484 000000ff
!	%l4 = 17fb1ce8, %l5 = ffffffff, Mem[00000000100c1400] = cb000000 d5638f61
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 17fb1ce8 ffffffff
!	%f0  = bfffffff ffffffff, %l0 = 00000000000000ff
!	Mem[0000000030001428] = 85ca00aa000061b3
	add	%i0,0x028,%g1
	stda	%f0,[%g1+%l0]ASI_PST16_S ! Mem[0000000030001428] = bfffffffffffffff
!	%l2 = 00005484, %l3 = 000000ff, Mem[00000000100c1400] = e81cfb17 ffffffff
	stda	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00005484 000000ff
!	%l6 = 000000001e000000, Mem[0000000010181400] = 00000000
	stba	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 39ff6cff, %l1 = 00000000000000d1
	ldswa	[%i3+%o5]0x89,%l1	! %l1 = 0000000039ff6cff

p0_label_219:
!	Mem[0000000030181410] = cb000000, %l4 = 000004e317fb1ce8
	ldsha	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 000066ff, %f10 = 8d113772
	lda	[%i1+%o5]0x88,%f10	! %f10 = 000066ff
!	Mem[0000000010141410] = e388955900001e00, %f12 = 84548111 5f19c18e
	ldda	[%i5+%o5]0x88,%f12	! %f12 = e3889559 00001e00
!	Mem[0000000010181410] = ffffffbf, %l2 = 0000000000005484
	ldsba	[%i6+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181408] = 00ffffff, %l3 = 00000000000000ff
	ldsba	[%i6+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	%f27 = 27bec53e, %f9  = 47bff731, %f15 = 760a88ad
	fadds	%f27,%f9 ,%f15		! %f15 = 47bff731
!	Mem[0000000030001408] = ff6cff39, %l3 = ffffffffffffffff
	lduba	[%i0+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101428] = 00000000, %f12 = e3889559
	ld	[%i4+0x028],%f12	! %f12 = 00000000
!	Mem[00000000300c1408] = ff000000000000ff, %f8  = bbde47e2 47bff731
	ldda	[%i3+%o4]0x89,%f8 	! %f8  = ff000000 000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = ffffffff, Mem[00000000300c1400] = 00ffffff 00ff0000
	stda	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 ffffffff

p0_label_220:
!	%l0 = 00000000000000ff, Mem[0000000030181410] = cb000000
	stwa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	Mem[0000000010081433] = 000000ff, %l5 = 00000000ffffffff
	ldstuba	[%i2+0x033]%asi,%l5	! %l5 = 000000ff000000ff
!	%f10 = 000066ff bf4f0423, %l3 = 00000000000000ff
!	Mem[0000000010001428] = 1e000000ffffffff
	add	%i0,0x028,%g1
	stda	%f10,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010001428] = 23044fbfff660000
!	%f0  = bfffffff ffffffff, Mem[0000000010001410] = 00000000 3c3fa2e3
	stda	%f0 ,[%i0+%o5]0x88	! Mem[0000000010001410] = bfffffff ffffffff
!	Mem[0000000010081408] = 00d1ffff, %l5 = 00000000000000ff
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000d1ffff
!	%f4  = ff000000 ffffffff, Mem[0000000030141408] = 0d0afeff 00ffffff
	stda	%f4 ,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000 ffffffff
!	Mem[00000000100c143c] = 7a958839, %l1 = 39ff6cff, %l1 = 39ff6cff
	add	%i3,0x3c,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 000000007a958839
!	Mem[0000000010041408] = 84540000, %l0 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 00000084000000ff
!	Mem[00000000100c1400] = 00005484, %l5 = 0000000000d1ffff
	swapa	[%i3+%g0]0x88,%l5	! %l5 = 0000000000005484
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000 b9000000, %l2 = ffffffff, %l3 = 000000ff
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000b9000000 00000000ff000000

p0_label_221:
!	Mem[0000000010081408] = b3f6ab00ff000000, %l3 = 00000000ff000000
	ldxa	[%i2+%o4]0x88,%l3	! %l3 = b3f6ab00ff000000
!	Mem[0000000010001438] = 7ccdbb31e90439af, %f12 = 00000000 00001e00
	ldda	[%i0+0x038]%asi,%f12	! %f12 = 7ccdbb31 e90439af
!	Mem[0000000021800080] = 62ff6f0b, %l7 = 1fec200000000000
	ldsba	[%o3+0x080]%asi,%l7	! %l7 = 0000000000000062
!	Mem[0000000010001400] = 00000000, %l4 = 0000000000000000
	ldsba	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = ffffff00, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010081420] = 4cf6ab34, %l0 = 0000000000000084
	lduh	[%i2+0x020],%l0		! %l0 = 0000000000004cf6
!	Mem[0000000010101410] = 00000000, %f0  = bfffffff
	lda	[%i4+%o5]0x80,%f0 	! %f0 = 00000000
!	Mem[0000000030101408] = 000000ff, %l5 = 0000000000005484
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%f29 = 00000000, %f3  = 000000ff
	fcmpes	%fcc2,%f29,%f3 		! %fcc2 = 1
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ff0000ff, %l0 = 0000000000004cf6
	ldstuba	[%i4+%o5]0x81,%l0	! %l0 = 000000ff000000ff

p0_label_222:
!	%l0 = 00000000000000ff, Mem[00000000211c0000] = ff007f1a
	stb	%l0,[%o2+%g0]		! Mem[00000000211c0000] = ff007f1a
!	Mem[0000000010101400] = 00000000, %l5 = 00000000000000ff
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (41)
!	%f8  = ff000000 000000ff, Mem[0000000030101410] = ff0000ff 7f210000
	stda	%f8 ,[%i4+%o5]0x81	! Mem[0000000030101410] = ff000000 000000ff
!	Mem[00000000100c1410] = 01000000, %l2 = b9000000, %l1 = 7a958839
	add	%i3,0x10,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 0000000001000000
!	%f22 = 35f607b4, Mem[00000000300c1400] = 00000000
	sta	%f22,[%i3+%g0]0x81	! Mem[00000000300c1400] = 35f607b4
!	%l2 = 00000000b9000000, Mem[0000000010181422] = 00014001, %asi = 80
	stha	%l2,[%i6+0x022]%asi	! Mem[0000000010181420] = 00010000
!	%f0  = 00000000, %f26 = 30ac171b
	fcmpes	%fcc0,%f0 ,%f26		! %fcc0 = 1
!	%l3 = b3f6ab00ff000000, Mem[0000000010001408] = ffffffff
	stha	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000ffff
!	%l4 = ffffffffffffff00, Mem[0000000010081410] = ff000000
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 00ff2c25, %l5 = 0000000000000000
	ldsb	[%o1+0x041],%l5		! %l5 = ffffffffffffffff

p0_label_223:
!	%f28 = f3660000, %f24 = ead7cbe7, %f24 = ead7cbe7
	fadds	%f28,%f24,%f24		! %f24 = f366006c
!	Mem[0000000030101408] = ff000000, %l0 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000, %l3 = b3f6ab00ff000000
	lduwa	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 0000ffff, %l7 = 0000000000000062
	ldswa	[%i0+%o4]0x80,%l7	! %l7 = 000000000000ffff
!	%l0 = ffffffffffffffff, %l6 = 000000001e000000, %l5 = ffffffffffffffff
	subc	%l0,%l6,%l5		! %l5 = ffffffffe1ffffff
!	Mem[0000000010141410] = 001e0000599588e3, %l0 = ffffffffffffffff
	ldxa	[%i5+%o5]0x80,%l0	! %l0 = 001e0000599588e3
!	Mem[0000000010141410] = 001e0000, %f28 = f3660000
	lda	[%i5+%o5]0x80,%f28	! %f28 = 001e0000
!	Mem[0000000010041408] = ff540000ff000000, %f30 = dcf36ede cf55fcc6
	ldda	[%i1+0x008]%asi,%f30	! %f30 = ff540000 ff000000
!	Mem[0000000030101408] = 000000ff, %l0 = 001e0000599588e3
	ldsba	[%i4+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = b9000000, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 00000000b9000000

p0_label_224:
!	%l0 = ffffffff, %l1 = 01000000, Mem[0000000010181400] = 00000000 ff000000
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff 01000000
!	Mem[000000001018142c] = 000061b3, %l6 = 000000001e000000
	swap	[%i6+0x02c],%l6		! %l6 = 00000000000061b3
!	Mem[00000000201c0000] = 00ff7d80, %l3 = 00000000b9000000
	ldstub	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010181421] = 00010000, %l5 = ffffffffe1ffffff
	ldstub	[%i6+0x021],%l5		! %l5 = 00000001000000ff
!	%f14 = 090a4565 47bff731, %l2 = 00000000b9000000
!	Mem[0000000030081400] = 000000ff6100b66f
	stda	%f14,[%i2+%l2]ASI_PST32_SL ! Mem[0000000030081400] = 000000ff6100b66f
!	%l4 = ffffff00, %l5 = 00000001, Mem[0000000010101408] = 00300000 000000ff
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffff00 00000001
!	Mem[000000001018142b] = 85ca00aa, %l0 = ffffffffffffffff
	ldstub	[%i6+0x02b],%l0		! %l0 = 000000aa000000ff
!	%l7 = 000000000000ffff, Mem[0000000030041408] = 000000ff
	stba	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	%f22 = 35f607b4, Mem[0000000010081400] = 000000b9
	sta	%f22,[%i2+%g0]0x80	! Mem[0000000010081400] = 35f607b4
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 4cf6ab34000000ff, %l3 = 0000000000000000
	ldxa	[%i6+%o5]0x89,%l3	! %l3 = 4cf6ab34000000ff

p0_label_225:
!	Mem[0000000010181428] = 85ca00ff 1e000000, %l6 = 000061b3, %l7 = 0000ffff
	ldda	[%i6+0x028]%asi,%l6	! %l6 = 0000000085ca00ff 000000001e000000
!	Mem[00000000100c1404] = ff000000, %f10 = 000066ff
	lda	[%i3+0x004]%asi,%f10	! %f10 = ff000000
!	Mem[0000000010101408] = ffffff00, %l7 = 000000001e000000
	lduba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0000] = ffff7d80, %l0 = 00000000000000aa
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010081408] = ff000000, %l3 = 4cf6ab34000000ff
	ldsba	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = ead7cbe7, %l7 = 00000000000000ff
	ldsha	[%i5+%o4]0x80,%l7	! %l7 = ffffffffffffead7
!	Mem[0000000010041410] = ff660000, %l1 = 0000000001000000
	lduba	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001400] = 00000000, %l7 = ffffffffffffead7
	ldsba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = 000000ff, %l4 = ffffffffffffff00
	lduba	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000021800101] = 0e006971, %asi = 80
	stba	%l3,[%o3+0x101]%asi	! Mem[0000000021800100] = 0e006971

p0_label_226:
!	%f4  = ff000000 ffffffff, %l6 = 0000000085ca00ff
!	Mem[0000000030101430] = f366000000000000
	add	%i4,0x030,%g1
	stda	%f4,[%g1+%l6]ASI_PST8_S ! Mem[0000000030101430] = ff000000ffffffff
!	%f28 = 001e0000 00000000, %l1 = 00000000000000ff
!	Mem[0000000030101418] = 35f607b445a8d46d
	add	%i4,0x018,%g1
	stda	%f28,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030101418] = 0000000000001e00
!	Mem[0000000010001418] = 000000ff, %l4 = 00000000, %l4 = 00000000
	add	%i0,0x18,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = ffffffff, %l6 = 0000000085ca00ff
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010181400] = ffffffff, %l4 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030001408] = ff6cff39, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[000000001004142c] = ff7bbdff, %l1 = 00000000000000ff, %asi = 80
	swapa	[%i1+0x02c]%asi,%l1	! %l1 = 00000000ff7bbdff
!	%f12 = 7ccdbb31 e90439af, Mem[0000000010001410] = ffffffff ffffffbf
	stda	%f12,[%i0+%o5]0x80	! Mem[0000000010001410] = 7ccdbb31 e90439af
!	%l0 = 00000000000000ff, Mem[00000000201c0000] = ffff7d80, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff7d80
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = d31ad138000000ff, %l2 = 00000000b9000000
	ldxa	[%i3+%o4]0x88,%l2	! %l2 = d31ad138000000ff

p0_label_227:
!	Mem[0000000010141408] = 0aa4e83c e7cbd7ea, %l4 = ffffffff, %l5 = 00000001
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 00000000e7cbd7ea 000000000aa4e83c
!	Mem[000000001004142c] = 000000ff, %l7 = 0000000000000000
	ldsw	[%i1+0x02c],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010081410] = 000000ff, %l5 = 000000000aa4e83c
	ldsba	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = e388955900001e00, %f12 = 7ccdbb31 e90439af
	ldda	[%i5+%o5]0x88,%f12	! %f12 = e3889559 00001e00
!	%l7 = 00000000000000ff, Mem[0000000010101437] = 82af381f, %asi = 80
	stba	%l7,[%i4+0x037]%asi	! Mem[0000000010101434] = 82af38ff
!	Mem[00000000201c0000] = 00ff7d80, %l2 = d31ad138000000ff
	lduh	[%o0+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010101408] = ffffff00, %l6 = 00000000000000ff
	ldsba	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030041400] = ffffffff, %l1 = 00000000ff7bbdff
	lduba	[%i1+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = ff660000 00000000, %l4 = e7cbd7ea, %l5 = 00000000
	ldda	[%i1+%o5]0x80,%l4	! %l4 = 00000000ff660000 0000000000000000
!	Starting 10 instruction Store Burst
!	%f3  = 000000ff, %f22 = 35f607b4
	fcmpes	%fcc2,%f3 ,%f22		! %fcc2 = 1

p0_label_228:
!	%l4 = ff660000, %l5 = 00000000, Mem[0000000010181408] = 00ffffff 9eff7800
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = ff660000 00000000
!	Mem[0000000010101410] = 00000000, %l4 = 00000000ff660000
	swapa	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = ff000000, %l3 = 00000000000000ff
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 00000000ff000000
!	%l1 = 00000000000000ff, Mem[0000000010181400] = 000000ff00000001
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010101430] = 6a78ff4a82af38ff
	stx	%l5,[%i4+0x030]		! Mem[0000000010101430] = 0000000000000000
!	%f16 = ff000000 cb000000 0000001e 00000030
!	%f20 = 34abf64c 7f210000 35f607b4 45a8d46d
!	%f24 = f366006c 3ce8a40a 30ac171b 27bec53e
!	%f28 = 001e0000 00000000 ff540000 ff000000
	stda	%f16,[%i3]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	Mem[0000000030181400] = ffffffff ffffffff 000000ff 000000cb
!	Mem[0000000030181410] = ff000000 34abf64c 93faf4be c4eb7d82
!	Mem[0000000030181420] = 1f45d1ab 7e96e600 5af64036 ebfe1be4
!	Mem[0000000030181430] = 25efdb4c 618f63d5 e9f2d044 425428b0
	ldda	[%i6]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030181400
!	%l2 = 000000ff, %l3 = ff000000, Mem[0000000010001400] = 00000000 e90439af
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff ff000000
!	%l6 = ffffffffffffffff, Mem[0000000010141408] = e7cbd7ea
	stba	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = e7cbd7ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff660000, %l3 = 00000000ff000000
	ldsha	[%i4+%o5]0x80,%l3	! %l3 = ffffffffffffff66

p0_label_229:
!	%f12 = e3889559 00001e00, %l7 = 00000000000000ff
!	Mem[0000000030141410] = 00ffffff9eff7800
	add	%i5,0x010,%g1
	stda	%f12,[%g1+%l7]ASI_PST32_S ! Mem[0000000030141410] = e388955900001e00
!	%l3 = ffffffffffffff66, immed = 00000d96, %y  = 00000000
	umul	%l3,0xd96,%l5		! %l5 = 00000d95fff7d3c4, %y = 00000d95
!	Mem[0000000030101408] = ff000000, %l4 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010041408] = 000054ff, %l2 = 00000000000000ff
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 00000000000054ff
!	Mem[0000000030081400] = ff000000, %l4 = ffffffffff000000
	ldsha	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %l1 = 00000000000000ff
	lduba	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041408] = ff540000, %f6  = 00000000
	ld	[%i1+%o4],%f6 	! %f6 = ff540000
!	Mem[0000000030081408] = 47bff731 3ae31e00, %l4 = 00000000, %l5 = fff7d3c4
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 0000000047bff731 000000003ae31e00
!	Mem[0000000010101408] = 00ffffff, %l0 = 00000000000000ff
	ldsha	[%i4+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = ffffffff, %l1 = 000000ff, Mem[0000000010041408] = ff540000 ff000000
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffff 000000ff

p0_label_230:
!	Mem[0000000010101438] = 5bff63b2, %l4 = 47bff731, %l1 = 000000ff
	add	%i4,0x38,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 000000005bff63b2
	membar	#Sync			! Added by membar checker (42)
!	%f5  = ffffffff, Mem[0000000030181400] = ffffffff
	sta	%f5 ,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff
!	%f24 = 00e6967e abd1451f, %l1 = 000000005bff63b2
!	Mem[0000000030101408] = ff00000000000030
	add	%i4,0x008,%g1
	stda	%f24,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030101408] = ff0000007e96e600
!	%l0 = ffffffffffffffff, Mem[00000000300c1408] = 1e000000
	stha	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 1e00ffff
!	Mem[000000001008143b] = ff1eb9e9, %l3 = ffffffffffffff66
	ldstub	[%i2+0x03b],%l3		! %l3 = 000000e9000000ff
!	Mem[0000000010141400] = e8548111, %l0 = ffffffffffffffff
	ldstuba	[%i5+0x000]%asi,%l0	! %l0 = 000000e8000000ff
!	%l2 = 000054ff, %l3 = 000000e9, Mem[0000000010101410] = 000066ff ff000000
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 000054ff 000000e9
!	Mem[0000000010001427] = f366b28f, %l6 = ffffffffffffffff
	ldstuba	[%i0+0x027]%asi,%l6	! %l6 = 0000008f000000ff
!	Mem[0000000030001400] = 00000000, %l1 = 000000005bff63b2
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffffd100 ff000000, %l2 = 000054ff, %l3 = 000000e9
	ldd	[%i3+%g0],%l2		! %l2 = 00000000ffffd100 00000000ff000000

p0_label_231:
!	Mem[0000000010181410] = ffffffbf 00000000, %l2 = ffffd100, %l3 = ff000000
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 00000000ffffffbf 0000000000000000
!	Mem[0000000030181410] = ff00000034abf64c, %l2 = 00000000ffffffbf
	ldxa	[%i6+%o5]0x81,%l2	! %l2 = ff00000034abf64c
!	Mem[0000000010101410] = 000054ff, %l6 = 000000000000008f
	lduha	[%i4+%o5]0x88,%l6	! %l6 = 00000000000054ff
!	Mem[0000000030181408] = 000000ff, %f6  = ff540000
	lda	[%i6+%o4]0x81,%f6 	! %f6 = 000000ff
!	Mem[00000000100c1408] = 000000ff, %l7 = 00000000000000ff
	ldsha	[%i3+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = ff000000000000ff, %f2  = 21ff0000 000000ff
	ldda	[%i4+%g0]0x80,%f2 	! %f2  = ff000000 000000ff
!	Mem[0000000010001438] = 7ccdbb31 e90439af, %l4 = 47bff731, %l5 = 3ae31e00
	ldd	[%i0+0x038],%l4		! %l4 = 000000007ccdbb31 00000000e90439af
!	Mem[0000000030001408] = 0000000039ff6cff, %l6 = 00000000000054ff
	ldxa	[%i0+%o4]0x89,%l6	! %l6 = 0000000039ff6cff
!	Mem[0000000010181408] = 000066ff, %f24 = 00e6967e
	lda	[%i6+%o4]0x80,%f24	! %f24 = 000066ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181430] = fff6ab3400000000, %l6 = 0000000039ff6cff, %l0 = 00000000000000e8
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = fff6ab3400000000

p0_label_232:
!	%f14 = 090a4565 47bff731, %l0 = fff6ab3400000000
!	Mem[0000000010081438] = ff1eb9ffb600ffff
	add	%i2,0x038,%g1
	stda	%f14,[%g1+%l0]ASI_PST32_P ! Mem[0000000010081438] = ff1eb9ffb600ffff
!	Mem[0000000010141408] = ffd7cbe7, %l3 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 00000000ffd7cbe7
!	%f4  = ff000000 ffffffff, Mem[0000000010181400] = 00000000 000000ff
	std	%f4 ,[%i6+%g0]	! Mem[0000000010181400] = ff000000 ffffffff
!	%l2 = ff00000034abf64c, Mem[0000000030041400] = ffffffff
	stba	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffff4c
!	Mem[0000000030001400] = ff000000, %l4 = 000000007ccdbb31
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030001400] = 000000ff, %l5 = 00000000e90439af
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030141400] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1400] = 00d1ffff, %l4 = 00000000000000ff
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	%l3 = 00000000ffd7cbe7, %l4 = 00000000000000ff, %y  = 00000d95
	smul	%l3,%l4,%l7		! %l7 = ffffffffd7f41b19, %y = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff000000, %l1 = 0000000000000000
	ldsba	[%i4+%g0]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_233:
!	Mem[0000000010041408] = ffffffff, %l0 = fff6ab3400000000
	lduba	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141410] = 00001e00, %l3 = 00000000ffd7cbe7
	ldswa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000001e00
!	Mem[0000000010101408] = 0100000000ffffff, %l4 = 00000000000000ff
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = 0100000000ffffff
!	Mem[0000000010181430] = fff6ab3400000000, %f2  = ff000000 000000ff
	ldda	[%i6+0x030]%asi,%f2 	! %f2  = fff6ab34 00000000
!	Mem[0000000030181408] = 000000ff, %l5 = 00000000000000ff
	ldsha	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00000001, %l0 = 00000000000000ff
	ldsha	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000001
!	Mem[0000000030041408] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i1+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181430] = fff6ab3400000000, %l3 = 0000000000001e00
	ldx	[%i6+0x030],%l3		! %l3 = fff6ab3400000000
!	Code Fragment 3
p0_fragment_18:
!	%l0 = 0000000000000001
	setx	0x9d9e5ee7992ce91d,%g7,%l0 ! %l0 = 9d9e5ee7992ce91d
!	%l1 = ffffffffffffffff
	setx	0x14ee66cff534d1a1,%g7,%l1 ! %l1 = 14ee66cff534d1a1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9d9e5ee7992ce91d
	setx	0x67a0ed5053e48525,%g7,%l0 ! %l0 = 67a0ed5053e48525
!	%l1 = 14ee66cff534d1a1
	setx	0x4fb7c4f7f6079023,%g7,%l1 ! %l1 = 4fb7c4f7f6079023
!	Starting 10 instruction Store Burst
!	%l4 = 0100000000ffffff, Mem[0000000010041410] = ff66000000000000
	stxa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 0100000000ffffff

p0_label_234:
!	Mem[00000000300c1400] = ff000000, %l3 = fff6ab3400000000
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030001410] = 31f7bf47, %l5 = ffffffffffffffff
	swapa	[%i0+%o5]0x81,%l5	! %l5 = 0000000031f7bf47
!	Mem[0000000030001408] = 39ff6cff, %l2 = ff00000034abf64c
	swapa	[%i0+%o4]0x89,%l2	! %l2 = 0000000039ff6cff
!	Mem[0000000030081410] = 0004e318, %l0 = 67a0ed5053e48525
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 00000018000000ff
!	%f20 = 4cf6ab34 000000ff, Mem[0000000010101410] = ff540000 e9000000
	stda	%f20,[%i4+%o5]0x80	! Mem[0000000010101410] = 4cf6ab34 000000ff
!	Mem[00000000300c1400] = 00000000, %l1 = 4fb7c4f7f6079023
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 000000ff, %l5 = 0000000031f7bf47
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	%l6 = 0000000039ff6cff, Mem[0000000010101408] = 00ffffff
	stba	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 00ffffff
!	%f13 = 00001e00, %f17 = ffffffff, %f27 = 3640f65a
	fsubs	%f13,%f17,%f27		! %f27 = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001404] = ff000000, %l0 = 0000000000000018
	lduwa	[%i0+0x004]%asi,%l0	! %l0 = 00000000ff000000

p0_label_235:
!	Mem[00000000100c1408] = ff00000038d11ad3, %l1 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l1	! %l1 = ff00000038d11ad3
!	Mem[00000000300c1408] = ffff001e, %l5 = 00000000000000ff
	lduwa	[%i3+%o4]0x81,%l5	! %l5 = 00000000ffff001e
!	Mem[0000000010181408] = 00000000ff660000, %l7 = ffffffffd7f41b19
	ldxa	[%i6+%o4]0x88,%l7	! %l7 = 00000000ff660000
!	Mem[0000000010101400] = ff000000000000ff, %l6 = 0000000039ff6cff
	ldxa	[%i4+%g0]0x88,%l6	! %l6 = ff000000000000ff
!	Mem[00000000218000c0] = d100f956, %l2 = 0000000039ff6cff
	lduha	[%o3+0x0c0]%asi,%l2	! %l2 = 000000000000d100
!	Mem[0000000010041430] = 6fb6006100000063, %f26 = e41bfeeb ffffffff
	ldda	[%i1+0x030]%asi,%f26	! %f26 = 6fb60061 00000063
!	Mem[0000000030041408] = ff000000, %l7 = 00000000ff660000
	lduba	[%i1+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001400] = 000000ffff000000, %f22 = 827debc4 bef4fa93
	ldda	[%i0+%g0]0x88,%f22	! %f22 = 000000ff ff000000
!	Mem[0000000010181408] = ff660000, %l4 = 0100000000ffffff
	ldsha	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041418] = 00000000, %l4 = 0000000000000000, %asi = 80
	swapa	[%i1+0x018]%asi,%l4	! %l4 = 0000000000000000

p0_label_236:
!	Mem[0000000010101430] = 00000000, %l1 = 38d11ad3, %l0 = ff000000
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 0000000000000000
!	%f13 = 00001e00, %f1  = ffffffff, %f25 = abd1451f
	fadds	%f13,%f1 ,%f25		! %f25 = ffffffff
!	%l0 = 0000000000000000, Mem[00000000100c141c] = 0000ffff, %asi = 80
	stwa	%l0,[%i3+0x01c]%asi	! Mem[00000000100c141c] = 00000000
!	%f20 = 4cf6ab34, Mem[0000000010041408] = ffffffff
	sta	%f20,[%i1+%o4]0x88	! Mem[0000000010041408] = 4cf6ab34
!	Mem[0000000010041420] = 0000ffeb00000000, %l0 = 0000000000000000, %l7 = 00000000000000ff
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = 0000ffeb00000000
!	Mem[00000000100c1408] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%l7 = 0000ffeb00000000, Mem[0000000010081400] = b407f635
	stwa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l0 = 0000000000000000, Mem[0000000030141410] = 599588e3
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	Mem[0000000010081418] = c545ffff20000000, %l2 = 000000000000d100, %l7 = 0000ffeb00000000
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = c545ffff20000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 000000ff, %f4  = ff000000
	lda	[%i4+%g0]0x89,%f4 	! %f4 = 000000ff

p0_label_237:
!	Mem[0000000020800040] = 00ff2c25, %l6 = ff000000000000ff
	ldsh	[%o1+0x040],%l6		! %l6 = 00000000000000ff
!	Mem[00000000300c1408] = 1e00ffff, %f12 = e3889559
	lda	[%i3+%o4]0x89,%f12	! %f12 = 1e00ffff
!	Mem[0000000010081400] = ff000000 00000000, %l6 = 000000ff, %l7 = 20000000
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[0000000030141400] = ff000000, %f1  = ffffffff
	lda	[%i5+%g0]0x81,%f1 	! %f1 = ff000000
!	Mem[0000000010001408] = 0000ffff, %l7 = 00000000ff000000
	lduwa	[%i0+%o4]0x80,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030081408] = 31f7bf47, %l6 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000047
!	Mem[0000000010101408] = ffffff00, %l0 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffffff00
!	%l5 = 00000000ffff001e, immed = fffff61b, %y  = ffffffff
	sdiv	%l5,-0x9e5,%l7		! %l7 = 0000000000000019
	mov	%l0,%y			! %y = ffffff00
!	Mem[0000000010001428] = 23044fbf ff660000, %l6 = 00000047, %l7 = 00000019
	ldd	[%i0+0x028],%l6		! %l6 = 0000000023044fbf 00000000ff660000
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = ffff001e, Mem[0000000010181400] = 000000ff ffffffff
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff ffff001e

p0_label_238:
!	%l5 = 00000000ffff001e, Mem[0000000010101400] = ff000000000000ff, %asi = 80
	stxa	%l5,[%i4+0x000]%asi	! Mem[0000000010101400] = 00000000ffff001e
!	%l5 = 00000000ffff001e, Mem[0000000030141400] = 6fb60061000000ff
	stxa	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000ffff001e
!	%l5 = 00000000ffff001e, Mem[00000000100c1410] = 01000000
	stha	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 001e0000
!	%l1 = ff00000038d11ad3, Mem[0000000030181410] = ff000000
	stwa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 38d11ad3
!	%l4 = 000000ff, %l5 = ffff001e, Mem[00000000100c1410] = 00001e00 ff0000ff
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff ffff001e
!	%f2  = fff6ab34 00000000, Mem[0000000010001410] = 7ccdbb31 e90439af
	stda	%f2 ,[%i0+%o5]0x80	! Mem[0000000010001410] = fff6ab34 00000000
!	%l5 = 00000000ffff001e, Mem[0000000030141408] = 000000ff
	stwa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = ffff001e
!	%f10 = ff000000 bf4f0423, Mem[0000000030181400] = ffffffff ffffffff
	stda	%f10,[%i6+%g0]0x89	! Mem[0000000030181400] = ff000000 bf4f0423
!	%f14 = 090a4565, Mem[0000000010041410] = 01000000
	sta	%f14,[%i1+%o5]0x80	! Mem[0000000010041410] = 090a4565
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff007f1a, %l3 = 00000000ff000000
	ldub	[%o2+%g0],%l3		! %l3 = 00000000000000ff

p0_label_239:
!	Mem[0000000030081410] = 0004e3ff, %l0 = ffffffffffffff00
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001408] = 0000ffff, %l3 = 00000000000000ff
	ldsba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = 00ff7d80, %l5 = 00000000ffff001e
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l7 = 00000000ff660000
	ldsha	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = ffff0000, %l4 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = ffffffffffff0000
	membar	#Sync			! Added by membar checker (43)
!	Mem[00000000100c1400] = ffffd100 ff000000 ff000000 38d11ad3
!	Mem[00000000100c1410] = ff000000 1e00ffff 00000000 00000000
!	Mem[00000000100c1420] = 0000217f 4cf6ab34 ffffd100 3ae31e00
!	Mem[00000000100c1430] = 00000000 cb000000 38d11ad3 7a958839
	ldda	[%i3]ASI_BLK_PL,%f0	! Block Load from 00000000100c1400
!	Mem[000000001014142c] = ff211e00, %l0 = ffffffffffffffff
	ldsh	[%i5+0x02e],%l0		! %l0 = 0000000000001e00
!	Mem[0000000030001400] = ffff00b6000000ff, %f16 = ffffffff ffffffff
	ldda	[%i0+%g0]0x89,%f16	! %f16 = ffff00b6 000000ff
!	Starting 10 instruction Store Burst
!	%f0  = 000000ff 00d1ffff d31ad138 000000ff
!	%f4  = ffff001e 000000ff 00000000 00000000
!	%f8  = 34abf64c 7f210000 001ee33a 00d1ffff
!	%f12 = 000000cb 00000000 3988957a d31ad138
	stda	%f0,[%i2]ASI_BLK_AIUS	! Block Store to 0000000030081400

p0_label_240:
!	%l3 = 0000000000000000, Mem[0000000010041410] = 090a4565
	stba	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 000a4565
!	Mem[0000000010141400] = ff548111, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l7	! %l7 = 00000000ff548111
	membar	#Sync			! Added by membar checker (44)
!	%l7 = 00000000ff548111, Mem[00000000100c1400] = 00d1ffff
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff548111
!	Mem[0000000010141430] = 0000006d300000ff, %l2 = 000000000000d100, %l7 = 00000000ff548111
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = 0000006d300000ff
!	%l4 = ffffffffffff0000, Mem[0000000030041410] = ffffffff
	stha	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = ffff0000
!	%l0 = 0000000000001e00, %l4 = ffffffffffff0000, %l5 = 00000000000000ff
	xnor	%l0,%l4,%l5		! %l5 = 000000000000e1ff
!	Mem[0000000030041408] = ff000000, %l2 = 000000000000d100
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	%l5 = 000000000000e1ff, Mem[00000000100c1400] = 118154ffff000000, %asi = 80
	stxa	%l5,[%i3+0x000]%asi	! Mem[00000000100c1400] = 000000000000e1ff
!	%f29 = 4cdbef25, Mem[00000000300c1410] = 34abf64c
	sta	%f29,[%i3+%o5]0x81	! Mem[00000000300c1410] = 4cdbef25
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff7d80, %l1 = ff00000038d11ad3
	ldsh	[%o0+%g0],%l1		! %l1 = 00000000000000ff

p0_label_241:
!	Mem[00000000100c1410] = 000000ff, %l1 = 00000000000000ff
	ldsha	[%i3+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[000000001008141c] = 20000000, %l0 = 0000000000001e00
	lduba	[%i2+0x01d]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = ffffffbf 00000000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 00000000ffffffbf 0000000000000000
!	Mem[000000001008143c] = b600ffff, %l7 = 0000006d300000ff
	lduwa	[%i2+0x03c]%asi,%l7	! %l7 = 00000000b600ffff
!	Mem[0000000010081428] = ffffffff, %l2 = 00000000ffffffbf
	lduwa	[%i2+0x028]%asi,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010081420] = 4cf6ab34fffffe93, %l3 = 0000000000000000
	ldx	[%i2+0x020],%l3		! %l3 = 4cf6ab34fffffe93
!	Mem[0000000010041400] = 00000000, %l4 = ffffffffffff0000
	ldswa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, imm = 0000000000000903, %l2 = 00000000ffffffff
	add	%l4,0x903,%l2		! %l2 = 0000000000000903
!	%f15 = d31ad138, %f29 = 4cdbef25
	fsqrts	%f15,%f29		! %f29 = 7fffffff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000030041400] = 4cffffffffffffbf
	stxa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000000000ff

p0_label_242:
!	Mem[000000001010143e] = 0000000a, %l6 = 0000000023044fbf
	ldstub	[%i4+0x03e],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010081408] = 000000ff, %l7 = 00000000b600ffff
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%f14 = 3988957a d31ad138, Mem[0000000030081400] = ff000000 ffffd100
	stda	%f14,[%i2+%g0]0x89	! Mem[0000000030081400] = 3988957a d31ad138
!	Mem[00000000100c1430] = 00000000, %l6 = 0000000000000000
	swap	[%i3+0x030],%l6		! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030101408] = ff000000
	stba	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[0000000030081410] = ffff001e, %l6 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l6	! %l6 = ffffffffffff001e
!	Mem[0000000010081405] = 000000ff, %l3 = 4cf6ab34fffffe93
	ldstub	[%i2+0x005],%l3		! %l3 = 00000000000000ff
!	%f30 = b0285442 44d0f2e9, Mem[0000000030041410] = 0000ffff 000000ff
	stda	%f30,[%i1+%o5]0x81	! Mem[0000000030041410] = b0285442 44d0f2e9
!	%l6 = ffffffffffff001e, Mem[0000000030081400] = d31ad138
	stha	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = d31a001e
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000ffff, %l5 = 000000000000e1ff
	ldsba	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000

p0_label_243:
!	Mem[0000000030041410] = b0285442, %f4  = ffff001e
	lda	[%i1+%o5]0x81,%f4 	! %f4 = b0285442
!	Mem[0000000030081400] = 1e001ad37a958839, %l0 = 0000000000000000
	ldxa	[%i2+%g0]0x81,%l0	! %l0 = 1e001ad37a958839
!	Mem[0000000021800100] = 0e006971, %l3 = 0000000000000000
	lduh	[%o3+0x100],%l3		! %l3 = 0000000000000e00
!	Mem[0000000010081408] = b3f6ab00ffff00b6, %f2  = d31ad138 000000ff
	ldda	[%i2+%o4]0x88,%f2 	! %f2  = b3f6ab00 ffff00b6
!	%l3 = 0000000000000e00, %l5 = 0000000000000000, %l1 = 00000000000000ff
	xor	%l3,%l5,%l1		! %l1 = 0000000000000e00
!	Mem[0000000010081410] = ff000000, %f17 = 000000ff
	lda	[%i2+%o5]0x88,%f17	! %f17 = ff000000
!	Mem[0000000010181410] = ffffffbf, %l0 = 1e001ad37a958839
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030001400] = ff000000, %l1 = 0000000000000e00
	ldswa	[%i0+%g0]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010081408] = ffff00b6, %f20 = 4cf6ab34
	lda	[%i2+%o4]0x88,%f20	! %f20 = ffff00b6
!	Starting 10 instruction Store Burst
!	%f30 = b0285442 44d0f2e9, Mem[00000000100c1408] = ff000000 38d11ad3
	stda	%f30,[%i3+%o4]0x80	! Mem[00000000100c1408] = b0285442 44d0f2e9

p0_label_244:
!	Mem[0000000030001408] = 34abf64c, %l7 = 00000000000000ff
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 0000004c000000ff
!	%l6 = ffffffffffff001e, Mem[0000000010101410] = 4cf6ab34000000ff
	stxa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffffffff001e
!	%f22 = 000000ff ff000000, Mem[0000000030001410] = ffffffff dc000000
	stda	%f22,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff ff000000
!	%l6 = ffffffffffff001e, Mem[0000000030101410] = 000000ff
	stha	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000001e
!	%l6 = ffff001e, %l7 = 0000004c, Mem[0000000010001410] = 34abf6ff 00000000
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = ffff001e 0000004c
!	%l1 = ffffffffff000000, Mem[0000000010041434] = 00000063, %asi = 80
	stha	%l1,[%i1+0x034]%asi	! Mem[0000000010041434] = 00000063
!	%f26 = 6fb60061 00000063, Mem[0000000010181400] = ff000000 1e00ffff
	std	%f26,[%i6+%g0]	! Mem[0000000010181400] = 6fb60061 00000063
!	%l6 = ffff001e, %l7 = 0000004c, Mem[0000000030181408] = ff000000 cb000000
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = ffff001e 0000004c
!	%l0 = 0000ffff, %l1 = ff000000, Mem[0000000010181400] = 6fb60061 00000063
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000ffff ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = e9f2d044425428b0, %l2 = 0000000000000903
	ldxa	[%i3+%o4]0x88,%l2	! %l2 = e9f2d044425428b0

p0_label_245:
!	Mem[0000000030141408] = 1e00ffff, %l5 = 0000000000000000
	lduba	[%i5+%o4]0x81,%l5	! %l5 = 000000000000001e
!	Mem[0000000010181408] = 00000000ff660000, %l7 = 000000000000004c
	ldxa	[%i6+%o4]0x88,%l7	! %l7 = 00000000ff660000
!	Mem[0000000030081400] = d31a001e, %l3 = 0000000000000e00
	lduba	[%i2+%g0]0x89,%l3	! %l3 = 000000000000001e
!	Mem[0000000010001404] = ff000000, %l7 = 00000000ff660000
	ldswa	[%i0+0x004]%asi,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010181424] = dc000000, %l2 = e9f2d044425428b0
	lduba	[%i6+0x024]%asi,%l2	! %l2 = 00000000000000dc
!	Mem[0000000010101430] = 00000000, %l7 = ffffffffff000000
	lduwa	[%i4+0x030]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = ff000000 0000001e, %l4 = 00000000, %l5 = 0000001e
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 000000000000001e 00000000ff000000
!	Code Fragment 4
p0_fragment_19:
!	%l0 = 000000000000ffff
	setx	0xea841ef7d54d3a9a,%g7,%l0 ! %l0 = ea841ef7d54d3a9a
!	%l1 = ffffffffff000000
	setx	0xf7feb4e0321cd38b,%g7,%l1 ! %l1 = f7feb4e0321cd38b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ea841ef7d54d3a9a
	setx	0x45d1585827156538,%g7,%l0 ! %l0 = 45d1585827156538
!	%l1 = f7feb4e0321cd38b
	setx	0x6f43ec4fe526e44a,%g7,%l1 ! %l1 = 6f43ec4fe526e44a
!	Mem[00000000300c1408] = 300000001e00ffff, %l5 = 00000000ff000000
	ldxa	[%i3+%o4]0x89,%l5	! %l5 = 300000001e00ffff
!	Starting 10 instruction Store Burst
!	%l6 = ffff001e, %l7 = 00000000, Mem[0000000030181408] = ffff001e 0000004c
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = ffff001e 00000000

p0_label_246:
!	Mem[0000000010081410] = ff000000, %l5 = 300000001e00ffff
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%l6 = ffffffffffff001e, Mem[0000000010001410] = 1e00ffff
	stwa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = ffff001e
!	%l4 = 000000000000001e, Mem[0000000010181400] = 0000ffff
	stwa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000001e
!	%f8  = 34abf64c 7f210000, Mem[0000000010001408] = ffff0000 bfffffff
	stda	%f8 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 34abf64c 7f210000
!	Mem[00000000300c1408] = 1e00ffff, %l0 = 45d1585827156538
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000030141410] = 00000000
	stba	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000
!	%l4 = 000000000000001e, Mem[0000000030141400] = ffff001e
	stha	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = ffff001e
!	%l6 = ffffffffffff001e, Mem[0000000010141408] = 00000000
	stha	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 001e0000
!	%l5 = 0000000000000000, Mem[0000000030041400] = 00000000
	stba	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffffffbf, %l1 = 6f43ec4fe526e44a
	lduwa	[%i6+%o5]0x80,%l1	! %l1 = 00000000ffffffbf

p0_label_247:
!	Mem[00000000100c1410] = ff0000001e00ffff, %l7 = 0000000000000000
	ldxa	[%i3+0x010]%asi,%l7	! %l7 = ff0000001e00ffff
!	Mem[0000000030001400] = ffff00b6000000ff, %f8  = 34abf64c 7f210000
	ldda	[%i0+%g0]0x89,%f8 	! %f8  = ffff00b6 000000ff
!	Mem[0000000010101408] = 00ffffff, %l6 = ffffffffffff001e
	ldswa	[%i4+%o4]0x88,%l6	! %l6 = 0000000000ffffff
!	Mem[0000000010001400] = 000000ffff000000, %l1 = 00000000ffffffbf
	ldxa	[%i0+%g0]0x88,%l1	! %l1 = 000000ffff000000
!	Mem[0000000010101408] = 0100000000ffffff, %l7 = ff0000001e00ffff
	ldxa	[%i4+%o4]0x88,%l7	! %l7 = 0100000000ffffff
!	Mem[00000000300c1410] = 0000217f 25efdb4c, %l2 = 000000dc, %l3 = 0000001e
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 0000000025efdb4c 000000000000217f
!	Mem[0000000010141418] = 7544075b, %l3 = 000000000000217f
	lduh	[%i5+0x018],%l3		! %l3 = 0000000000007544
!	Mem[0000000030001410] = ff000000, %f13 = 00000000
	lda	[%i0+%o5]0x89,%f13	! %f13 = ff000000
!	Mem[0000000010081408] = b3f6ab00 ffff00b6, %l0 = 000000ff, %l1 = ff000000
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000ffff00b6 00000000b3f6ab00
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 000000ffff000000, %f30 = b0285442 44d0f2e9
	ldda	[%i0+%g0]0x80,%f30	! %f30 = 000000ff ff000000

p0_label_248:
!	Mem[0000000010041410] = 65450a00, %l7 = 0100000000ffffff
	ldstuba	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010101400] = 00000000
	stha	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l2 = 0000000025efdb4c, Mem[0000000030181408] = 1e00ffff
	stha	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = db4cffff
!	%l0 = 00000000ffff00b6, Mem[00000000211c0001] = ff007f1a
	stb	%l0,[%o2+0x001]		! Mem[00000000211c0000] = ffb67f1a
!	%l0 = 00000000ffff00b6, Mem[00000000100c1400] = 00000000
	stha	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000b6
!	%l4 = 000000000000001e, Mem[0000000010041400] = ff00000000000000
	stxa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000000001e
!	Mem[0000000010041408] = 34abf64c, %l7 = 0000000000000000
	swap	[%i1+%o4],%l7		! %l7 = 0000000034abf64c
!	%f5  = 000000ff, Mem[0000000010141438] = 0000af00
	st	%f5 ,[%i5+0x038]	! Mem[0000000010141438] = 000000ff
!	%l5 = 0000000000000000, Mem[0000000030181410] = 4cf6ab34d31ad138
	stxa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffffffffffff001e, %l6 = 0000000000ffffff
	ldxa	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffff001e

p0_label_249:
!	%f0  = 000000ff, %f24 = 000066ff, %f1  = 00d1ffff
	fmuls	%f0 ,%f24,%f1 		! %f1  = 00000000
!	Mem[0000000030001408] = fff6ab3400000000, %l3 = 0000000000007544
	ldxa	[%i0+%o4]0x81,%l3	! %l3 = fff6ab3400000000
!	Mem[0000000010141408] = 00001e00, %l6 = ffffffffffff001e
	ldsba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1414] = 1e00ffff, %l3 = fff6ab3400000000
	lduw	[%i3+0x014],%l3		! %l3 = 000000001e00ffff
!	Mem[0000000020800000] = ffbf16cb, %l2 = 0000000025efdb4c
	ldsb	[%o1+0x001],%l2		! %l2 = ffffffffffffffbf
!	Mem[00000000300c1400] = f6079023, %l0 = 00000000ffff00b6
	ldsba	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000023
!	Mem[0000000030181400] = bf4f0423, %l1 = 00000000b3f6ab00
	lduha	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000423
!	Mem[0000000010001420] = 146409e3, %l4 = 000000000000001e
	lduha	[%i0+0x022]%asi,%l4	! %l4 = 00000000000009e3
!	Mem[00000000100c1410] = ff000000, %f12 = 000000cb
	ld	[%i3+%o5],%f12	! %f12 = ff000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000023, Mem[0000000010101408] = ffffff00
	stha	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 0023ff00

p0_label_250:
!	Mem[0000000030181400] = bf4f0423, %l3 = 000000001e00ffff
	ldstuba	[%i6+%g0]0x89,%l3	! %l3 = 00000023000000ff
!	%f9  = 000000ff, Mem[0000000030001408] = fff6ab34
	sta	%f9 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff
!	%f23 = ff000000, Mem[0000000010081408] = ffff00b6
	sta	%f23,[%i2+%o4]0x88	! Mem[0000000010081408] = ff000000
!	Mem[0000000020800001] = ffbf16cb, %l1 = 0000000000000423
	ldstuba	[%o1+0x001]%asi,%l1	! %l1 = 000000bf000000ff
!	Mem[0000000010101404] = ffff001e, %l2 = ffffffffffffffbf, %asi = 80
	swapa	[%i4+0x004]%asi,%l2	! %l2 = 00000000ffff001e
!	Mem[00000000201c0001] = 00ff7d80, %l6 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	%f30 = 000000ff, %f30 = 000000ff, %f4  = b0285442 000000ff
	fsmuld	%f30,%f30,%f4 		! %l0 = 0000000000000045, Unfinished, %fsr = 1500000400
!	%l7 = 0000000034abf64c, %l0 = 0000000000000045, %y  = ffffff00
	smul	%l7,%l0,%l4		! %l4 = 0000000e3259627c, %y = 0000000e
!	%l4 = 0000000e3259627c, Mem[000000001008140a] = 000000ff, %asi = 80
	stba	%l4,[%i2+0x00a]%asi	! Mem[0000000010081408] = 00007cff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffff001e, %l3 = 0000000000000023
	lduba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ff

p0_label_251:
!	Mem[0000000010101410] = 1e00ffff ffffffff, %l4 = 3259627c, %l5 = 00000000
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 00000000ffffffff 000000001e00ffff
!	Mem[0000000030081408] = d31ad138000000ff, %f2  = b3f6ab00 ffff00b6
	ldda	[%i2+%o4]0x81,%f2 	! %f2  = d31ad138 000000ff
!	Mem[0000000030041408] = 21ff0000000000ff, %f26 = 6fb60061 00000063
	ldda	[%i1+%o4]0x89,%f26	! %f26 = 21ff0000 000000ff
!	Mem[0000000010001400] = 000000ff, %l0 = 0000000000000045
	lduba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = 001e0000, %l1 = 00000000000000bf
	lduba	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l6 = 00000000000000ff, imm = 0000000000000b6d, %l2 = 00000000ffff001e
	orn	%l6,0xb6d,%l2		! %l2 = fffffffffffff4ff
!	Mem[0000000010081420] = 4cf6ab34, %l4 = 00000000ffffffff
	ldsh	[%i2+0x022],%l4		! %l4 = ffffffffffffab34
!	Mem[0000000010041410] = ff0a4565, %l2 = fffff4ff, %l0 = 00000000
	add	%i1,0x10,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 00000000ff0a4565
!	Mem[0000000010001400] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 000000001e00ffff, Mem[0000000030181408] = db4cffff00000000
	stxa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000001e00ffff

p0_label_252:
!	%l6 = 000000ff, %l7 = 34abf64c, Mem[0000000030001408] = 000000ff 00000000
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff 34abf64c
!	%l6 = 00000000000000ff, Mem[0000000010081436] = 0078ff9e, %asi = 80
	stha	%l6,[%i2+0x036]%asi	! Mem[0000000010081434] = 007800ff
!	Mem[00000000211c0001] = ffb67f1a, %l5 = 000000001e00ffff
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000b6000000ff
!	%l5 = 00000000000000b6, Mem[0000000010041410] = ff0a4565
	stha	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 00b64565
!	%f8  = ffff00b6 000000ff, Mem[0000000010141410] = 001e0000 599588e3
	stda	%f8 ,[%i5+%o5]0x80	! Mem[0000000010141410] = ffff00b6 000000ff
!	%l0 = ff0a4565, %l1 = 00000000, Mem[0000000010181400] = 1e000000 000000ff
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = ff0a4565 00000000
!	%l0 = 00000000ff0a4565, Mem[0000000030041408] = 000000ff
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 00004565
!	%f14 = 3988957a, %f24 = 000066ff, %f30 = 000000ff
	fsubs	%f14,%f24,%f30		! %l0 = 00000000ff0a4587, Unfinished, %fsr = 1500000400
!	%l7 = 0000000034abf64c, %l5 = 00000000000000b6, %l4 = ffffffffffffab34
	xnor	%l7,%l5,%l4		! %l4 = ffffffffcb540905
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff7d80, %l7 = 0000000034abf64c
	ldsb	[%o0+%g0],%l7		! %l7 = 0000000000000000

p0_label_253:
!	Mem[000000001008143c] = b600ffff, %l0 = 00000000ff0a4587
	ldsw	[%i2+0x03c],%l0		! %l0 = ffffffffb600ffff
!	Mem[0000000030081400] = 3988957ad31a001e, %l0 = ffffffffb600ffff
	ldxa	[%i2+%g0]0x89,%l0	! %l0 = 3988957ad31a001e
!	Mem[0000000030101410] = 1e000000, %l6 = 00000000000000ff
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = 000000000000001e
!	Mem[00000000100c1408] = 425428b0, %l6 = 000000000000001e
	lduba	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000b0
!	Mem[00000000211c0000] = ffff7f1a, %l1 = 0000000000000000
	ldsba	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001408] = 7f210000, %l2 = fffffffffffff4ff
	lduha	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141408] = 001e00003ce8a40a, %l6 = 00000000000000b0
	ldxa	[%i5+%o4]0x80,%l6	! %l6 = 001e00003ce8a40a
!	Mem[0000000030041408] = 65450000, %l3 = 00000000000000ff
	lduwa	[%i1+%o4]0x81,%l3	! %l3 = 0000000065450000
!	Mem[0000000030081400] = 3988957a d31a001e, %l2 = 00000000, %l3 = 65450000
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 00000000d31a001e 000000003988957a
!	Starting 10 instruction Store Burst
!	%f31 = ff000000, Mem[0000000010101428] = 00000000
	sta	%f31,[%i4+0x028]%asi	! Mem[0000000010101428] = ff000000

p0_label_254:
!	Mem[0000000030101400] = 000000ff, %l0 = 3988957ad31a001e
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141410] = b600ffff, %l3 = 000000003988957a
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030101400] = d31a001e, %l6 = 001e00003ce8a40a
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 0000001e000000ff
!	%l7 = 0000000000000000, Mem[0000000010041408] = 00000000000000ff
	stxa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = 425428b0, %l6 = 000000000000001e
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 00000000425428b0
!	%l2 = 00000000d31a001e, Mem[0000000030001408] = ff000000
	stha	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ff00001e
!	%l2 = d31a001e, %l3 = 000000ff, Mem[0000000030041410] = b0285442 44d0f2e9
	stda	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = d31a001e 000000ff
!	%f19 = ff000000, %f15 = d31ad138, %f5  = 000000ff
	fadds	%f19,%f15,%f5 		! %f5  = ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 239007f6, %l5 = 00000000000000b6
	ldsha	[%i3+%g0]0x81,%l5	! %l5 = 0000000000002390

p0_label_255:
!	Mem[0000000010081410] = ff0000ff, %l1 = ffffffffffffffff
	ldsba	[%i2+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101400] = 00000000 ffffffbf, %l2 = d31a001e, %l3 = 000000ff
	ldd	[%i4+%g0],%l2		! %l2 = 0000000000000000 00000000ffffffbf
!	Mem[0000000010101410] = ffffffff, %l2 = 0000000000000000
	ldswa	[%i4+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181400] = ff0a4565, %l4 = ffffffffcb540905
	ldswa	[%i6+%g0]0x88,%l4	! %l4 = ffffffffff0a4565
!	Mem[0000000010181408] = 000066ff, %l5 = 0000000000002390
	ldsba	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = ff0a4565, %l1 = ffffffffffffffff
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 0000000000004565
!	Mem[00000000300c1408] = ffff001e00000030, %f8  = ffff00b6 000000ff
	ldda	[%i3+%o4]0x81,%f8 	! %f8  = ffff001e 00000030
!	Mem[00000000211c0000] = ffff7f1a, %l6 = 00000000425428b0
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030081400] = d31a001e, %l6 = 000000000000ffff
	ldsha	[%i2+%g0]0x89,%l6	! %l6 = 000000000000001e
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000030001408] = ff00001e
	stwa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff

p0_label_256:
!	Mem[00000000100c1400] = b6000000, %l0 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000b6000000
!	%l3 = 00000000ffffffbf, Mem[0000000010001408] = 0000217f4cf6ab34
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000ffffffbf
!	%l6 = 000000000000001e, Mem[0000000030081410] = ffff001e
	stwa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000001e
!	%f6  = 00000000, Mem[0000000030101400] = d31a00ff
	sta	%f6 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Mem[0000000030141410] = 001e0000 000000ff, %l6 = 0000001e, %l7 = 00000000
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff 00000000001e0000
!	%l3 = 00000000ffffffbf, Mem[0000000030001410] = ff000000
	stha	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = ff00ffbf
!	Mem[0000000030041408] = 00004565, %l7 = 00000000001e0000
	ldstuba	[%i1+%o4]0x89,%l7	! %l7 = 00000065000000ff
!	%l4 = ffffffffff0a4565, Mem[00000000211c0000] = ffff7f1a, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 45657f1a
!	%l0 = 00000000b6000000, Mem[0000000010141418] = 7544075bd31ad138, %asi = 80
	stxa	%l0,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000b6000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00007cff00abf6b3, %l2 = ffffffffffffffff
	ldxa	[%i2+%o4]0x80,%l2	! %l2 = 00007cff00abf6b3

p0_label_257:
!	Mem[000000001008143c] = b600ffff, %l6 = 00000000000000ff
	ldsb	[%i2+0x03c],%l6		! %l6 = ffffffffffffffb6
!	Mem[0000000010101408] = 01000000 00ff2300, %l0 = b6000000, %l1 = 00004565
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 0000000000ff2300 0000000001000000
!	Mem[0000000010141408] = 001e0000, %l7 = 0000000000000065
	lduha	[%i5+%o4]0x80,%l7	! %l7 = 000000000000001e
!	Mem[0000000010181400] = 65450aff, %l2 = 00007cff00abf6b3
	ldsw	[%i6+%g0],%l2		! %l2 = 0000000065450aff
!	Mem[0000000010081400] = 00000000, %l0 = 0000000000ff2300
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l0 = 0000000000000000
	lduha	[%i1+%o4]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030001400] = 000000ff, %l7 = 000000000000001e
	ldswa	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[000000001010142c] = 000000c0, %l3 = 00000000ffffffbf
	ldsb	[%i4+0x02c],%l3		! %l3 = 0000000000000000
!	Mem[0000000030001400] = 000000ff, %l0 = 000000000000ff00
	lduha	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041428] = ffffffff000000ff, %l3 = 0000000000000000, %l6 = ffffffffffffffb6
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = ffffffff000000ff

p0_label_258:
!	%f11 = 00d1ffff, Mem[00000000300c1408] = ffff001e
	sta	%f11,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00d1ffff
!	%f18 = cb000000 ff000000, Mem[0000000030001410] = ff00ffbf 000000ff
	stda	%f18,[%i0+%o5]0x89	! Mem[0000000030001410] = cb000000 ff000000
!	Mem[00000000201c0000] = 00ff7d80, %l5 = 0000000000000000
	ldstub	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010041418] = 00000000, %l6 = ffffffff000000ff
	swap	[%i1+0x018],%l6		! %l6 = 0000000000000000
!	Mem[0000000030001400] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010101408] = 0023ff00
	stb	%l7,[%i4+%o4]		! Mem[0000000010101408] = ff23ff00
!	Mem[0000000030081410] = 0000001e, %l7 = 00000000000000ff
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 000000000000001e
!	%l1 = 0000000001000000, Mem[00000000100c141c] = 00000000, %asi = 80
	stba	%l1,[%i3+0x01c]%asi	! Mem[00000000100c141c] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010181410] = bfffffff
	stha	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = bfff0000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff000000, %f11 = 00d1ffff
	lda	[%i3+%o5]0x80,%f11	! %f11 = ff000000

p0_label_259:
!	Mem[0000000030001410] = 000000ff000000cb, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l3	! %l3 = 000000ff000000cb
!	Mem[00000000100c1410] = 000000ff, %f0  = 000000ff
	lda	[%i3+%o5]0x88,%f0 	! %f0 = 000000ff
!	Mem[0000000030041410] = 1e001ad3, %f27 = 000000ff
	lda	[%i1+%o5]0x89,%f27	! %f27 = 1e001ad3
!	%f17 = ff000000, %f30 = 000000ff, %f11 = ff000000
	fsubs	%f17,%f30,%f11		! %l0 = 0000000000000121, Unfinished, %fsr = 1500000400
!	Mem[00000000218000c0] = d100f956, %l2 = 0000000065450aff
	lduh	[%o3+0x0c0],%l2		! %l2 = 000000000000d100
!	Mem[0000000010101400] = 00000000ffffffbf, %f20 = ffff00b6 000000ff
	ldda	[%i4+%g0]0x80,%f20	! %f20 = 00000000 ffffffbf
!	Mem[0000000010081408] = b3f6ab00ff7c0000, %f20 = 00000000 ffffffbf
	ldda	[%i2+%o4]0x88,%f20	! %f20 = b3f6ab00 ff7c0000
!	Mem[0000000010081410] = 00ff0000 ff0000ff, %l6 = 00000000, %l7 = 0000001e
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 00000000ff0000ff 0000000000ff0000
!	Mem[00000000300c1408] = 30000000ffffd100, %f10 = 001ee33a ff000000
	ldda	[%i3+%o4]0x89,%f10	! %f10 = 30000000 ffffd100
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffff0a4565, Mem[0000000010181438] = ffffffffffffffeb, %asi = 80
	stxa	%l4,[%i6+0x038]%asi	! Mem[0000000010181438] = ffffffffff0a4565

p0_label_260:
!	%l7 = 0000000000ff0000, Mem[0000000030041400] = 00000000
	stwa	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 00ff0000
!	Mem[0000000030141400] = 1e00ffff, %l1 = 0000000001000000
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 0000001e000000ff
!	%l2 = 000000000000d100, Mem[00000000201c0000] = ffff7d80, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = d1007d80
!	%l7 = 0000000000ff0000, immed = 00000a66, %y  = 0000000e
	umul	%l7,0xa66,%l2		! %l2 = 0000000a5b9a0000, %y = 0000000a
!	%l4 = ff0a4565, %l5 = 00000000, Mem[0000000010001400] = 000000ff ff000000
	std	%l4,[%i0+%g0]		! Mem[0000000010001400] = ff0a4565 00000000
!	%l0 = 00000121, %l1 = 0000001e, Mem[0000000030101400] = 00000000 cb000000
	stda	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000121 0000001e
!	%l4 = ffffffffff0a4565, Mem[0000000010181408] = ff660000
	stwa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = ff0a4565
!	%l3 = 000000ff000000cb, Mem[0000000030181400] = ff044fbf
	stha	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 00cb4fbf
!	%l2 = 0000000a5b9a0000, %l1 = 000000000000001e, %l1 = 000000000000001e
	and	%l2,%l1,%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = d1007d80, %l3 = 000000ff000000cb
	lduh	[%o0+%g0],%l3		! %l3 = 000000000000d100

p0_label_261:
!	%l6 = 00000000ff0000ff, immed = fffff396, %y  = 0000000a
	smul	%l6,-0xc6a,%l4		! %l4 = 0000000c69f3a26a, %y = 0000000c
!	Mem[0000000030101400] = 00000121, %l7 = 0000000000ff0000
	lduwa	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000121
!	Mem[00000000300c1408] = 30000000ffffd100, %l0 = 0000000000000121
	ldxa	[%i3+%o4]0x89,%l0	! %l0 = 30000000ffffd100
!	Mem[0000000030081400] = 3988957a d31a001e, %l6 = ff0000ff, %l7 = 00000121
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 00000000d31a001e 000000003988957a
!	Mem[0000000030181400] = 00cb4fbf, %f22 = 000000ff
	lda	[%i6+%g0]0x81,%f22	! %f22 = 00cb4fbf
!	Mem[0000000010141410] = b600ffff, %l2 = 0000000a5b9a0000
	ldsha	[%i5+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141408] = 001e0000 3ce8a40a, %l0 = ffffd100, %l1 = 00000000
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 00000000001e0000 000000003ce8a40a
!	Mem[0000000010181408] = ff0a4565, %l4 = 0000000c69f3a26a
	ldsba	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000065
!	Mem[0000000021800100] = 0e006971, %l2 = ffffffffffffffff
	lduba	[%o3+0x101]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000065, Mem[0000000010041410] = 6545b600
	stba	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 6545b665

p0_label_262:
!	%l3 = 000000000000d100, Mem[0000000010001408] = 00000000
	stwa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000d100
!	Mem[0000000020800041] = 00ff2c25, %l7 = 000000003988957a
	ldstub	[%o1+0x041],%l7		! %l7 = 000000ff000000ff
!	%f18 = cb000000 ff000000, Mem[0000000010001400] = ff0a4565 00000000
	stda	%f18,[%i0+%g0]0x80	! Mem[0000000010001400] = cb000000 ff000000
!	Mem[0000000010141400] = 000000005f19c18e, %l7 = 00000000000000ff, %l2 = 0000000000000000
	casxa	[%i5]0x80,%l7,%l2	! %l2 = 000000005f19c18e
!	%l2 = 000000005f19c18e, Mem[0000000030181400] = 00cb4fbf
	stwa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 5f19c18e
!	%l2 = 000000005f19c18e, Mem[0000000010181408] = 65450aff
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 8e450aff
!	Mem[00000000300c1400] = f6079023, %l2 = 000000005f19c18e
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 00000023000000ff
!	Mem[00000000300c1408] = 00d1ffff, %l5 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[000000001000140b] = 00d10000, %l3 = 000000000000d100
	ldstub	[%i0+0x00b],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_20:
!	%l0 = 00000000001e0000
	setx	0xa17eef284ae8a04d,%g7,%l0 ! %l0 = a17eef284ae8a04d
!	%l1 = 000000003ce8a40a
	setx	0x1ca00b7819496d00,%g7,%l1 ! %l1 = 1ca00b7819496d00
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a17eef284ae8a04d
	setx	0xf6ab72b7a61286c1,%g7,%l0 ! %l0 = f6ab72b7a61286c1
!	%l1 = 1ca00b7819496d00
	setx	0x602fcdbfc401ac1b,%g7,%l1 ! %l1 = 602fcdbfc401ac1b

p0_label_263:
!	Mem[0000000010081424] = fffffe93, %l0 = f6ab72b7a61286c1
	ldub	[%i2+0x026],%l0		! %l0 = 00000000000000fe
!	Mem[0000000030081410] = 000000ff 000000ff, %l2 = 00000023, %l3 = 00000000
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000000000ff 00000000000000ff
!	Mem[0000000021800100] = 0e006971, %l1 = 602fcdbfc401ac1b
	lduba	[%o3+0x100]%asi,%l1	! %l1 = 000000000000000e
!	Mem[0000000010181438] = ffffffff ff0a4565, %l0 = 000000fe, %l1 = 0000000e
	ldd	[%i6+0x038],%l0		! %l0 = 00000000ffffffff 00000000ff0a4565
!	Mem[000000001010141c] = 00000061, %l3 = 00000000000000ff
	ldsb	[%i4+0x01f],%l3		! %l3 = 0000000000000061
!	Mem[0000000010101400] = 00000000, %l1 = 00000000ff0a4565
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 0000001e, %l7 = 00000000000000ff
	lduba	[%i1+%g0]0x88,%l7	! %l7 = 000000000000001e
!	Mem[0000000010041410] = 6545b665, %l2 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l2	! %l2 = 000000000000b665
!	Mem[0000000010101410] = ffffffff ffff001e, %l2 = 0000b665, %l3 = 00000061
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 00000000ffffffff 00000000ffff001e
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = f60790ff, %l0 = 00000000ffffffff
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 00000000f60790ff

p0_label_264:
!	Mem[000000001008142a] = ffffffff, %l4 = 0000000000000065
	ldstuba	[%i2+0x02a]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010001400] = cb000000, %l5 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 000000cb000000ff
!	Code Fragment 4
p0_fragment_21:
!	%l0 = 00000000f60790ff
	setx	0xb6220977d221c194,%g7,%l0 ! %l0 = b6220977d221c194
!	%l1 = 0000000000000000
	setx	0xb6df86ffba547d38,%g7,%l1 ! %l1 = b6df86ffba547d38
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b6220977d221c194
	setx	0xc265e337e1954f49,%g7,%l0 ! %l0 = c265e337e1954f49
!	%l1 = b6df86ffba547d38
	setx	0x787a38505f107083,%g7,%l1 ! %l1 = 787a38505f107083
!	%l2 = ffffffff, %l3 = ffff001e, Mem[00000000100c1400] = ff000000 ffe10000
	stda	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff ffff001e
!	Mem[00000000100c1408] = 1e000000, %l4 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 000000001e000000
!	Mem[0000000030181400] = 8ec1195f, %l1 = 787a38505f107083
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 000000008ec1195f
!	Mem[0000000010101428] = ff000000, %l5 = 00000000000000cb, %asi = 80
	swapa	[%i4+0x028]%asi,%l5	! %l5 = 00000000ff000000
!	Mem[00000000100c1410] = ff000000, %l4 = 000000001e000000
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010181400] = 65450aff, %l5 = 00000000ff000000
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000065000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 00ff2c25, %l2 = 00000000ffffffff
	lduba	[%o1+0x041]%asi,%l2	! %l2 = 00000000000000ff

p0_label_265:
!	Mem[0000000010101408] = ff23ff00, %l0 = c265e337e1954f49
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[000000001014140c] = 3ce8a40a, %l5 = 0000000000000065
	lduw	[%i5+0x00c],%l5		! %l5 = 000000003ce8a40a
!	Mem[0000000010081400] = ff00ff00 00000000, %l4 = 000000ff, %l5 = 3ce8a40a
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000 00000000ff00ff00
!	%l1 = 000000008ec1195f, imm = fffffffffffff708, %l1 = 000000008ec1195f
	and	%l1,-0x8f8,%l1		! %l1 = 000000008ec11108
!	Mem[0000000010141410] = ffff00b6, %l0 = 00000000000000ff
	lduha	[%i5+%o5]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030101410] = 1e000000, %l4 = 0000000000000000
	lduha	[%i4+%o5]0x81,%l4	! %l4 = 0000000000001e00
!	Mem[0000000010141400] = 000000005f19c18e, %l0 = 000000000000ffff
	ldx	[%i5+%g0],%l0		! %l0 = 000000005f19c18e
!	Mem[0000000010181400] = ff450aff, %l3 = 00000000ffff001e
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffff45
!	Mem[0000000030041400] = 0000ff00, %l6 = 00000000d31a001e
	lduwa	[%i1+%g0]0x81,%l6	! %l6 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010101401] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i4+0x001]%asi,%l2	! %l2 = 00000000000000ff

p0_label_266:
!	Mem[0000000010001408] = 00d100ff, %l5 = 00000000ff00ff00
	ldstuba	[%i0+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010101408] = 00ff23ff
	stba	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 00ff2300
!	%l2 = 0000000000000000, Mem[0000000010141408] = 001e0000
	stha	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%l4 = 0000000000001e00, Mem[0000000010101408] = 0023ff00
	stwa	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 00001e00
!	%f14 = 3988957a d31ad138, Mem[0000000010141408] = 00000000 3ce8a40a
	stda	%f14,[%i5+0x008]%asi	! Mem[0000000010141408] = 3988957a d31ad138
!	%l4 = 00001e00, %l5 = 00000000, Mem[0000000030081400] = 1e001ad3 7a958839
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00001e00 00000000
!	%l2 = 0000000000000000, Mem[0000000010081400] = 00000000
	stba	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l6 = 000000000000ff00, immd = fffffffffffffa56, %l4 = 0000000000001e00
	sdivx	%l6,-0x5aa,%l4		! %l4 = ffffffffffffffd3
!	Mem[00000000100c1400] = ffffffff, %l0 = 000000005f19c18e
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff000000, %l2 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l2	! %l2 = 00000000ff000000

p0_label_267:
!	Mem[0000000020800040] = 00ff2c25, %l5 = 0000000000000000
	ldsh	[%o1+0x040],%l5		! %l5 = 00000000000000ff
!	Mem[00000000211c0000] = 45657f1a, %l6 = 000000000000ff00
	ldub	[%o2+%g0],%l6		! %l6 = 0000000000000045
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000010081400] = 00000000 00ff00ff 00007cff 00abf6b3
!	Mem[0000000010081410] = ff0000ff 0000ff00 c545ffff 20000000
!	Mem[0000000010081420] = 4cf6ab34 fffffe93 ffffffff ffffffff
!	Mem[0000000010081430] = 000000ff 007800ff ff1eb9ff b600ffff
	ldda	[%i2]ASI_BLK_AIUP,%f0	! Block Load from 0000000010081400
!	Mem[0000000010101410] = ffffffff, %l6 = 0000000000000045
	lduba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001408] = ffd100ff, %l6 = 00000000000000ff
	lduha	[%i0+%o4]0x80,%l6	! %l6 = 000000000000ffd1
!	Mem[0000000020800000] = ffff16cb, %l5 = 00000000000000ff
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[00000000201c0000] = d1007d80, %l5 = 000000000000ffff
	ldsh	[%o0+%g0],%l5		! %l5 = ffffffffffffd100
!	Mem[0000000010141408] = 38d11ad37a958839, %f24 = 000066ff ffffffff
	ldda	[%i5+%o4]0x88,%f24	! %f24 = 38d11ad3 7a958839
!	Mem[0000000010101400] = 00ff0000 ffffffbf, %l2 = ff000000, %l3 = ffffff45
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 0000000000ff0000 00000000ffffffbf
!	Starting 10 instruction Store Burst
!	%f24 = 38d11ad3 7a958839, Mem[0000000010141410] = ffff00b6 000000ff
	stda	%f24,[%i5+%o5]0x80	! Mem[0000000010141410] = 38d11ad3 7a958839

p0_label_268:
!	%l2 = 00ff0000, %l3 = ffffffbf, Mem[00000000100c1410] = ff000000 1e00ffff
	std	%l2,[%i3+%o5]		! Mem[00000000100c1410] = 00ff0000 ffffffbf
!	Mem[0000000010081401] = 00000000, %l3 = 00000000ffffffbf
	ldstuba	[%i2+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = bfff0000, %l2 = 0000000000ff0000
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141404] = 5f19c18e, %l3 = 00000000, %l7 = 0000001e
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 000000005f19c18e
!	%l4 = ffffffffffffffd3, Mem[0000000030001408] = ffffffff
	stba	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffd3
!	%f18 = cb000000 ff000000, %l1 = 000000008ec11108
!	Mem[0000000030001418] = ffffffffff7bbdb9
	add	%i0,0x018,%g1
	stda	%f18,[%g1+%l1]ASI_PST8_S ! Mem[0000000030001418] = ffffffffff7bbdb9
!	Mem[0000000030101400] = 21010000, %l3 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l0 = ffffffff, %l1 = 8ec11108, Mem[0000000030001408] = ffffffd3 4cf6ab34
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff 8ec11108
!	%l1 = 000000008ec11108, Mem[0000000010141400] = 000000005f19c18e
	stxa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000008ec11108
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000ff00, %l0 = 00000000ffffffff
	lduwa	[%i2+%g0]0x88,%l0	! %l0 = 000000000000ff00

p0_label_269:
!	Mem[0000000010041400] = 0000001e, %l6 = 000000000000ffd1
	ldsha	[%i1+%g0]0x88,%l6	! %l6 = 000000000000001e
!	Mem[0000000030041400] = 0000ff00 000000ff ff450000 0000ff21
!	Mem[0000000030041410] = d31a001e 000000ff 6fb60706 0000ebcb
!	Mem[0000000030041420] = 31f7bf47 e247debb 23044fbf 7237118d
!	Mem[0000000030041430] = 8ec1195f 11815484 ad880a76 65450a09
	ldda	[%i1]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030041400
!	Mem[00000000100c1400] = 5f19c18e1e00ffff, %f6  = c545ffff 20000000
	ldda	[%i3+%g0]0x80,%f6 	! %f6  = 5f19c18e 1e00ffff
!	Mem[0000000030181410] = 00000000, %l1 = 000000008ec11108
	ldsba	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 00000000 bfff00ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 00000000bfff00ff 0000000000000000
!	Mem[00000000201c0000] = d1007d80, %l0 = 000000000000ff00
	ldsb	[%o0+%g0],%l0		! %l0 = ffffffffffffffd1
!	%l7 = 000000005f19c18e, Mem[0000000030141408] = ffff001e
	stba	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = ffff008e
!	Mem[0000000010181428] = 85ca00ff, %l4 = ffffffffffffffd3
	lduba	[%i6+0x02b]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1410] = 0000ff00, %f7  = 1e00ffff
	lda	[%i3+%o5]0x88,%f7 	! %f7 = 0000ff00
!	Starting 10 instruction Store Burst
!	%l2 = 00000000bfff00ff, Mem[00000000211c0001] = 45657f1a
	stb	%l2,[%o2+0x001]		! Mem[00000000211c0000] = 45ff7f1a

p0_label_270:
!	%l7 = 000000005f19c18e, Mem[00000000100c1400] = 8ec1195f
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 5f19c18e
!	%l1 = 0000000000000000, Mem[0000000021800180] = ffffc5c1
	sth	%l1,[%o3+0x180]		! Mem[0000000021800180] = 0000c5c1
!	%f16 = ff000000 00ff0000 21ff0000 000045ff
!	%f20 = ff000000 1e001ad3 cbeb0000 0607b66f
!	%f24 = bbde47e2 47bff731 8d113772 bf4f0423
!	%f28 = 84548111 5f19c18e 090a4565 760a88ad
	stda	%f16,[%i6]ASI_COMMIT_S	! Block Store to 0000000030181400
	membar	#Sync			! Added by membar checker (46)
!	%l6 = 000000000000001e, Mem[0000000010181408] = 8e450aff
	stba	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 1e450aff
!	%l2 = 00000000bfff00ff, Mem[0000000030141408] = 8e00ffff
	stba	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = ff00ffff
!	%f24 = bbde47e2 47bff731, %l5 = ffffffffffffd100
!	Mem[00000000100c1430] = 00000000cb000000
	add	%i3,0x030,%g1
	stda	%f24,[%g1+%l5]ASI_PST16_P ! Mem[00000000100c1430] = 00000000cb000000
!	%l5 = ffffffffffffd100, Mem[0000000010001410] = ffff001e
	stwa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffd100
!	Mem[00000000100c1404] = 1e00ffff, %l0 = ffffffffffffffd1, %asi = 80
	swapa	[%i3+0x004]%asi,%l0	! %l0 = 000000001e00ffff
!	Mem[0000000030101410] = 1e000000, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 000000001e000000
!	Starting 10 instruction Load Burst
!	%f6  = 5f19c18e, %f23 = 0607b66f, %f16 = ff000000
	fsubs	%f6 ,%f23,%f16		! %f16 = 5f19c18e

p0_label_271:
!	Mem[00000000201c0000] = d1007d80, %l3 = 000000001e000000
	lduh	[%o0+%g0],%l3		! %l3 = 000000000000d100
!	Mem[0000000030081400] = 00000000001e0000, %f4  = ff0000ff 0000ff00
	ldda	[%i2+%g0]0x89,%f4 	! %f4  = 00000000 001e0000
!	Mem[0000000030101410] = 00000000, %f20 = ff000000
	lda	[%i4+%o5]0x89,%f20	! %f20 = 00000000
!	Mem[0000000030041410] = d31a001e, %l6 = 000000000000001e
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffffd3
!	Mem[0000000010181410] = ff00ffbf00000000, %f2  = 00007cff 00abf6b3
	ldda	[%i6+0x010]%asi,%f2 	! %f2  = ff00ffbf 00000000
!	Mem[0000000010041400] = 1e000000 00000000 ff000000 00000000
!	Mem[0000000010041410] = 65b64565 00ffffff 000000ff e9b9d0b2
!	Mem[0000000010041420] = 0000ffeb 00000000 ffffffff 000000ff
!	Mem[0000000010041430] = 6fb60061 00000063 3988957a d31ad138
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	%l6 = ffffffd3, %l7 = 5f19c18e, Mem[0000000010101410] = ffffffff 1e00ffff
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffd3 5f19c18e
!	Code Fragment 4
p0_fragment_22:
!	%l0 = 000000001e00ffff
	setx	0xbf8c1cd859649095,%g7,%l0 ! %l0 = bf8c1cd859649095
!	%l1 = 0000000000000000
	setx	0xdc114d67dfd6a51f,%g7,%l1 ! %l1 = dc114d67dfd6a51f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bf8c1cd859649095
	setx	0x00f7589fc81d410c,%g7,%l0 ! %l0 = 00f7589fc81d410c
!	%l1 = dc114d67dfd6a51f
	setx	0x41c79810551dc79e,%g7,%l1 ! %l1 = 41c79810551dc79e
!	Mem[0000000010041438] = 3988957ad31ad138, %f22 = cbeb0000 0607b66f
	ldda	[%i1+0x038]%asi,%f22	! %f22 = 3988957a d31ad138
!	Starting 10 instruction Store Burst
!	%l2 = bfff00ff, %l3 = 0000d100, Mem[0000000010081408] = ff7c0000 b3f6ab00
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = bfff00ff 0000d100

p0_label_272:
!	%f16 = 5f19c18e 00ff0000 21ff0000 000045ff
!	%f20 = 00000000 1e001ad3 3988957a d31ad138
!	%f24 = bbde47e2 47bff731 8d113772 bf4f0423
!	%f28 = 84548111 5f19c18e 090a4565 760a88ad
	stda	%f16,[%i6]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	Mem[00000000100c1410] = bfffffff 0000ff00, %l0 = c81d410c, %l1 = 551dc79e
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 000000000000ff00 00000000bfffffff
!	Mem[0000000010101408] = 001e0000, %l4 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000001e0000
	membar	#Sync			! Added by membar checker (47)
!	%f0  = 1e000000, Mem[0000000010041400] = 1e000000
	sta	%f0 ,[%i1+0x000]%asi	! Mem[0000000010041400] = 1e000000
!	%l5 = ffffffffffffd100, immed = fffff1d4, %y  = 0000000c
	udiv	%l5,-0xe2c,%l1		! %l1 = 000000000000000d
	mov	%l0,%y			! %y = 0000ff00
!	%f16 = 5f19c18e, Mem[00000000300c1410] = 25efdb4c
	sta	%f16,[%i3+%o5]0x89	! Mem[00000000300c1410] = 5f19c18e
!	Mem[00000000211c0000] = 45ff7f1a, %l3 = 000000000000d100
	ldstub	[%o2+%g0],%l3		! %l3 = 00000045000000ff
!	Mem[0000000020800000] = ffff16cb, %l5 = ffffffffffffd100
	ldstub	[%o1+%g0],%l5		! %l5 = 000000ff000000ff
!	Mem[000000001014140c] = d31ad138, %l7 = 000000005f19c18e
	swap	[%i5+0x00c],%l7		! %l7 = 00000000d31ad138
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000ff00, %l7 = 00000000d31ad138
	ldsba	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_273:
!	Mem[0000000030001410] = ff000000, %l7 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%f18 = 21ff0000, %f4  = 65b64565, %f22 = 3988957a d31ad138
	fsmuld	%f18,%f4 ,%f22		! %f22 = 4106b1e3 f3600000
!	Mem[0000000010181418] = 38d11ad3 7a958839, %l2 = bfff00ff, %l3 = 00000045
	ldd	[%i6+0x018],%l2		! %l2 = 0000000038d11ad3 000000007a958839
!	Mem[000000001010140c] = 00000001, %l5 = 00000000000000ff
	lduh	[%i4+0x00c],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101438] = 5bff63b2, %l2 = 0000000038d11ad3
	lduw	[%i4+0x038],%l2		! %l2 = 000000005bff63b2
!	Mem[0000000030141410] = 000000ff, %l2 = 000000005bff63b2
	lduwa	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l4 = 001e0000, %l5 = 00000000, Mem[0000000010041410] = 6545b665 ffffff00
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 001e0000 00000000
!	Mem[00000000100c1414] = ffffffbf, %l7 = 0000000000000000
	lduw	[%i3+0x014],%l7		! %l7 = 00000000ffffffbf
!	Mem[0000000010041408] = 00000000000000ff, %l7 = 00000000ffffffbf
	ldxa	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000021800180] = 0000c5c1
	stb	%l7,[%o3+0x180]		! Mem[0000000021800180] = ff00c5c1

p0_label_274:
!	%f16 = 5f19c18e 00ff0000 21ff0000 000045ff
!	%f20 = 00000000 1e001ad3 4106b1e3 f3600000
!	%f24 = bbde47e2 47bff731 8d113772 bf4f0423
!	%f28 = 84548111 5f19c18e 090a4565 760a88ad
	stda	%f16,[%i5]ASI_BLK_AIUPL	! Block Store to 0000000010141400
!	%l0 = 0000ff00, %l1 = 0000000d, Mem[0000000030001400] = ff000000 b600ffff
	stda	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000ff00 0000000d
!	Mem[0000000030101408] = 00000000, %l7 = 00000000000000ff
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Code Fragment 3
p0_fragment_23:
!	%l0 = 000000000000ff00
	setx	0x95064d8fec3fad8b,%g7,%l0 ! %l0 = 95064d8fec3fad8b
!	%l1 = 000000000000000d
	setx	0xea0d82d79c197b8c,%g7,%l1 ! %l1 = ea0d82d79c197b8c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 95064d8fec3fad8b
	setx	0x58f03aa855632da9,%g7,%l0 ! %l0 = 58f03aa855632da9
!	%l1 = ea0d82d79c197b8c
	setx	0x5311e8501987ff6d,%g7,%l1 ! %l1 = 5311e8501987ff6d
!	%l0 = 58f03aa855632da9, imm = fffffffffffffcda, %l4 = 00000000001e0000
	xor	%l0,-0x326,%l4		! %l4 = a70fc557aa9cd173
!	%f12 = 6fb60061 00000063, Mem[0000000010001418] = 000000ff 000000cb
	stda	%f12,[%i0+0x018]%asi	! Mem[0000000010001418] = 6fb60061 00000063
!	Mem[0000000030141408] = ffff00ff, %l1 = 5311e8501987ff6d
	swapa	[%i5+%o4]0x89,%l1	! %l1 = 00000000ffff00ff
!	Mem[0000000010041408] = ff000000, %l5 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030081408] = 38d11ad3, %l2 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l2	! %l2 = 000000d3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = 5bff63b2, %l3 = 000000007a958839
	ldsw	[%i4+0x038],%l3		! %l3 = 000000005bff63b2

p0_label_275:
!	%l3 = 000000005bff63b2, %l2 = 00000000000000d3, %l0 = 58f03aa855632da9
	sub	%l3,%l2,%l0		! %l0 = 000000005bff62df
!	Mem[0000000030141408] = 6dff8719, %l6 = ffffffffffffffd3
	ldsba	[%i5+%o4]0x81,%l6	! %l6 = 000000000000006d
!	Mem[000000001004140c] = 00000000, %l7 = 0000000000000000
	ldsw	[%i1+0x00c],%l7		! %l7 = 0000000000000000
!	Mem[0000000010001428] = 23044fbf, %l2 = 00000000000000d3
	ldsh	[%i0+0x02a],%l2		! %l2 = 0000000000004fbf
!	Mem[0000000030181400] = 000000ff, %l3 = 000000005bff63b2
	ldswa	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l6 = 000000000000006d, %l1 = 00000000ffff00ff, %y  = 0000ff00
	smul	%l6,%l1,%l5		! %l5 = ffffffffff936c93, %y = ffffffff
!	Mem[0000000010081410] = ff0000ff, %l7 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = ff000000, %l5 = ffffffffff936c93
	ldsha	[%i4+%o4]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000030101400] = ff000121, %f9  = 00000000
	lda	[%i4+%g0]0x81,%f9 	! %f9 = ff000121
!	Starting 10 instruction Store Burst
!	Mem[000000001004142e] = 000000ff, %l2 = 0000000000004fbf
	ldstuba	[%i1+0x02e]%asi,%l2	! %l2 = 00000000000000ff

p0_label_276:
!	%l2 = 0000000000000000, Mem[0000000010001408] = ffd100ffffffffbf
	stxa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000000
!	%l3 = 00000000000000ff, %l0 = 000000005bff62df, %l1 = 00000000ffff00ff
	andn	%l3,%l0,%l1		! %l1 = 0000000000000020
!	%f7  = e9b9d0b2, Mem[0000000010101430] = 00000000
	st	%f7 ,[%i4+0x030]	! Mem[0000000010101430] = e9b9d0b2
!	Mem[0000000010101408] = 000000ff, %l7 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	%l5 = ffffffffffffff00, Mem[0000000010101434] = 00000000, %asi = 80
	stha	%l5,[%i4+0x034]%asi	! Mem[0000000010101434] = ff000000
!	%f11 = 000000ff, Mem[0000000030101400] = ff000121
	sta	%f11,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	%l4 = a70fc557aa9cd173, %l5 = ffffffffffffff00, %y  = ffffffff
	smul	%l4,%l5,%l6		! %l6 = 00000055632e8d00, %y = 00000055
!	%l7 = 00000000000000ff, Mem[00000000100c1410] = bfffffff0000ff00
	stxa	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000000000ff
!	Mem[00000000300c1408] = ffd1ffff, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 00000000ffd1ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l0 = 000000005bff62df
	lduwa	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000

p0_label_277:
!	Mem[0000000030181408] = 0000ff21, %l3 = 00000000000000ff
	ldsha	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffffff21
!	%l6 = 00000055632e8d00, imm = fffffffffffff6ec, %l7 = 00000000000000ff
	and	%l6,-0x914,%l7		! %l7 = 00000055632e8400
!	Mem[0000000030001400] = 0000ff00, %l1 = 0000000000000020
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 000000ff, %l2 = 00000000ffd1ffff
	lduba	[%i3+0x008]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081428] = ffffffff, %l0 = 0000000000000000
	lduh	[%i2+0x028],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030041408] = 000045ff, %f15 = d31ad138
	lda	[%i1+%o4]0x89,%f15	! %f15 = 000045ff
!	Mem[0000000030041400] = 0000ff00, %l2 = 0000000000000000
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081404] = 00ff00ff, %l4 = a70fc557aa9cd173
	ldsw	[%i2+0x004],%l4		! %l4 = 0000000000ff00ff
!	Mem[00000000100c1410] = ff000000 00000000, %l6 = 632e8d00, %l7 = 632e8400
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030001400] = 0d00000000ff0000
	stxa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000000

p0_label_278:
!	%l6 = 00000000ff000000, Mem[0000000030181410] = ff000000
	stba	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%l4 = 0000000000ff00ff, Mem[0000000010081400] = 00ff000000ff00ff
	stxa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000ff00ff
!	%f28 = 84548111 5f19c18e, Mem[0000000030001410] = ff000000 cb000000
	stda	%f28,[%i0+%o5]0x89	! Mem[0000000030001410] = 84548111 5f19c18e
!	Mem[0000000020800040] = 00ff2c25, %l4 = 0000000000ff00ff
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[00000000211c0000] = ffff7f1a, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00007f1a
!	%l4 = 0000000000000000, Mem[0000000010081430] = 000000ff007800ff, %asi = 80
	stxa	%l4,[%i2+0x030]%asi	! Mem[0000000010081430] = 0000000000000000
!	Mem[0000000010041404] = 00000000, %l4 = 00000000, %l1 = 00000000
	add	%i1,0x04,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 0000000000000000
!	%l6 = 00000000ff000000, Mem[0000000010101430] = e9b9d0b2, %asi = 80
	stha	%l6,[%i4+0x030]%asi	! Mem[0000000010101430] = 0000d0b2
!	%l2 = 0000000000000000, Mem[0000000030141408] = 1987ff6d
	stwa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff00000000000000, %f30 = 090a4565 760a88ad
	ldda	[%i4+%o5]0x89,%f30	! %f30 = ff000000 00000000

p0_label_279:
!	Mem[0000000021800000] = 1ec0ba26, %l5 = ffffffffffffff00
	ldsha	[%o3+0x000]%asi,%l5	! %l5 = 0000000000001ec0
!	Mem[0000000030101410] = 00000000, %l6 = 00000000ff000000
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %f30 = ff000000
	lda	[%i5+%o4]0x89,%f30	! %f30 = 00000000
!	Mem[00000000211c0000] = 00007f1a, %l5 = 0000000000001ec0
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = ff000000, %l3 = ffffffffffffff21
	ldsba	[%i5+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	%l3 = ffffffffffffffff, imm = 0000000000000ef0, %l0 = 000000000000ffff
	sub	%l3,0xef0,%l0		! %l0 = fffffffffffff10f
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = ff4500000000ff21, %f4  = 65b64565 00ffffff
	ldda	[%i1+%o4]0x81,%f4 	! %f4  = ff450000 0000ff21
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030141408] = 00000000
	stwa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000

p0_label_280:
!	Mem[0000000030141410] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010001400] = ff000000
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 00ff0000
!	Mem[0000000030181408] = 21ff0000, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 00000021000000ff
!	%l6 = 0000000000000000, Mem[0000000030001408] = ffffffff
	stba	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ffffff
!	Mem[0000000020800041] = ffff2c25, %l5 = 00000000000000ff
	ldstub	[%o1+0x041],%l5		! %l5 = 000000ff000000ff
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000030041410] = 1e001ad3 ff000000
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 ffffffff
!	%l4 = 0000000000000000, Mem[0000000021800101] = 0e006971
	stb	%l4,[%o3+0x101]		! Mem[0000000021800100] = 0e006971
!	%f6  = 000000ff e9b9d0b2, %l2 = 0000000000000000
!	Mem[00000000100c1438] = 38d11ad37a958839
	add	%i3,0x038,%g1
	stda	%f6,[%g1+%l2]ASI_PST32_P ! Mem[00000000100c1438] = 38d11ad37a958839
!	Mem[0000000010001400] = 00ff0000, %l7 = 0000000000000021
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000ff0000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 8ec1195f, %l0 = fffffffffffff10f
	ldsha	[%i3+%o5]0x81,%l0	! %l0 = ffffffffffff8ec1

p0_label_281:
!	Mem[0000000030101400] = 000000ff0000001e, %f4  = ff450000 0000ff21
	ldda	[%i4+%g0]0x81,%f4 	! %f4  = 000000ff 0000001e
!	Mem[0000000030001400] = 00000000, %l7 = 0000000000ff0000
	lduba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%f18 = 21ff0000, %f5  = 0000001e
	fsqrts	%f18,%f5 		! %f5  = 30b4aa5a
!	Mem[0000000010001400] = 00000021, %f25 = 47bff731
	lda	[%i0+%g0]0x80,%f25	! %f25 = 00000021
!	Mem[0000000020800000] = ffff16cb, %l3 = ffffffffffffffff
	lduh	[%o1+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[0000000030001408] = 00ffffff, %l6 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 3000000000000000, %l3 = 000000000000ffff
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = 3000000000000000
!	Mem[0000000030181408] = ffff0000, %f25 = 00000021
	lda	[%i6+%o4]0x81,%f25	! %f25 = ffff0000
!	Mem[000000001010142c] = 000000c0, %l5 = 00000000000000ff
	ldsb	[%i4+0x02d],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030081408] = 38d11aff
	stba	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 38d11a00

p0_label_282:
!	%l4 = 0000000000000000, Mem[00000000100c1410] = 000000ff
	stwa	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l7 = 0000000000000000, Mem[0000000010181408] = ff450000
	stha	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%f20 = 00000000, %f30 = 00000000, %f23 = f3600000
	fsubs	%f20,%f30,%f23		! %f23 = 00000000
!	%f4  = 000000ff 30b4aa5a, Mem[0000000010141438] = ad880a76 65450a09
	std	%f4 ,[%i5+0x038]	! Mem[0000000010141438] = 000000ff 30b4aa5a
!	Mem[0000000030001400] = 00000000, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%f28 = 84548111 5f19c18e, Mem[0000000010141428] = 23044fbf 7237118d
	stda	%f28,[%i5+0x028]%asi	! Mem[0000000010141428] = 84548111 5f19c18e
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030001408] = 00ffffff 0811c18e
	stda	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 00000000
!	%f26 = 8d113772, Mem[0000000030141400] = ffff00ff
	sta	%f26,[%i5+%g0]0x89	! Mem[0000000030141400] = 8d113772
!	%l0 = ffffffffffff8ec1, imm = 0000000000000a32, %l7 = 0000000000000000
	xor	%l0,0xa32,%l7		! %l7 = ffffffffffff84f3
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = ffff487b, %l1 = 0000000000000000
	ldsba	[%o3+0x040]%asi,%l1	! %l1 = ffffffffffffffff

p0_label_283:
!	Mem[0000000021800080] = 62ff6f0b, %l4 = 0000000000000000
	lduba	[%o3+0x081]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = 00001e00, %l1 = ffffffffffffffff
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 7237118d, %f22 = 4106b1e3
	lda	[%i5+%g0]0x81,%f22	! %f22 = 7237118d
!	Mem[0000000030181408] = ffff0000000045ff, %f14 = 3988957a 000045ff
	ldda	[%i6+%o4]0x81,%f14	! %f14 = ffff0000 000045ff
!	Mem[0000000010041400] = 1e000000, %l3 = 3000000000000000
	ldsh	[%i1+0x002],%l3		! %l3 = 0000000000000000
!	Mem[0000000021800080] = 62ff6f0b, %l4 = 00000000000000ff
	ldub	[%o3+0x081],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l2 = 0000000000000000
	lduha	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 00000000 0000ff21, %l4 = 000000ff, %l5 = 00000000
	ldd	[%i6+%o4],%l4		! %l4 = 0000000000000000 000000000000ff21
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010181410] = d31a001e 00000000
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 00000000

p0_label_284:
!	Mem[0000000010041434] = 00000063, %l3 = 0000000000000000
	swap	[%i1+0x034],%l3		! %l3 = 0000000000000063
!	%f16 = 5f19c18e 00ff0000, %l2 = 0000000000000000
!	Mem[0000000010001410] = ffffd1004c000000
	add	%i0,0x010,%g1
	stda	%f16,[%g1+%l2]ASI_PST16_P ! Mem[0000000010001410] = ffffd1004c000000
!	Mem[0000000030001400] = 00000000, %l0 = ffffffffffff8ec1
	ldstuba	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%l2 = 00000000, %l3 = 00000063, Mem[0000000010001410] = 00d1ffff 0000004c
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 00000063
!	%f26 = 8d113772 bf4f0423, %l0 = 0000000000000000
!	Mem[0000000010001430] = 00000000ff30ffff
	add	%i0,0x030,%g1
	stda	%f26,[%g1+%l0]ASI_PST16_P ! Mem[0000000010001430] = 00000000ff30ffff
!	Mem[0000000030081400] = 00001e00, %l4 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 0000000000001e00
!	%f14 = ffff0000 000045ff, %l7 = ffffffffffff84f3
!	Mem[0000000030141408] = 00000000ffffffff
	add	%i5,0x008,%g1
	stda	%f14,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030141408] = ff4500000000ffff
!	%f30 = 00000000, Mem[0000000030181408] = ffff0000
	sta	%f30,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	Mem[0000000030081408] = 001ad138, %l7 = ffffffffffff84f3
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 00000000001ad138
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff000000, %l5 = 000000000000ff21
	ldswa	[%i4+%g0]0x89,%l5	! %l5 = ffffffffff000000

p0_label_285:
!	%l2 = 0000000000000000, imm = fffffffffffff9b4, %l6 = 0000000000000000
	andn	%l2,-0x64c,%l6		! %l6 = 0000000000000000
!	Mem[0000000010101428] = 000000cb, %f31 = 00000000
	ld	[%i4+0x028],%f31	! %f31 = 000000cb
!	%l0 = 0000000000000000, %l3 = 0000000000000063, %l7 = 00000000001ad138
	and	%l0,%l3,%l7		! %l7 = 0000000000000000
!	Mem[0000000010081410] = ff0000ff0000ff00, %f2  = ff000000 00000000
	ldda	[%i2+%o5]0x80,%f2 	! %f2  = ff0000ff 0000ff00
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000010141408] = 000045ff, %l0 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000020800040] = ffff2c25, %l2 = 0000000000000000
	ldsh	[%o1+0x040],%l2		! %l2 = ffffffffffffffff
!	Mem[000000001000140c] = 00000000, %l6 = 0000000000000000
	ldsba	[%i0+0x00d]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l5 = ffffffffff000000
	ldswa	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001400] = 000000ff 21000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 0000000021000000 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000001e00, Mem[0000000010101410] = d3ffffff
	stwa	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00001e00

p0_label_286:
!	%l6 = 0000000021000000, Mem[0000000010041408] = 00000000
	stha	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l7 = 00000000000000ff, %l2 = ffffffffffffffff, %y  = 00000055
	udiv	%l7,%l2,%l2		! %l2 = 0000000000000055
	mov	%l0,%y			! %y = ffffffff
!	%l0 = ffffffff, %l1 = 00000000, Mem[0000000010181410] = 00000000 00000000
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffff 00000000
!	%f10 = ffffffff 000000ff, %l1 = 0000000000000000
!	Mem[0000000030181428] = 8d113772bf4f0423
	add	%i6,0x028,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030181428] = 8d113772bf4f0423
!	%f28 = 84548111 5f19c18e, %l6 = 0000000021000000
!	Mem[0000000030081428] = 001ee33a00d1ffff
	add	%i2,0x028,%g1
	stda	%f28,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030081428] = 001ee33a00d1ffff
!	Mem[0000000010041408] = 00000000, %l3 = 0000000000000063
	swapa	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%l0 = ffffffffffffffff, Mem[0000000010041410] = 001e0000
	stwa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff
!	%l3 = 0000000000000000, Mem[0000000010101400] = 00ff0000
	stha	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l0 = ffffffffffffffff, Mem[0000000020800001] = ffff16cb, %asi = 80
	stba	%l0,[%o1+0x001]%asi	! Mem[0000000020800000] = ffff16cb
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 1e000000, %l4 = 0000000000001e00
	ldsha	[%i1+0x000]%asi,%l4	! %l4 = 0000000000001e00

p0_label_287:
!	Mem[0000000010181400] = 00ff0000, %l3 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l7 = 00000000000000ff
	lduba	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = ffff84f3, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l7	! %l7 = ffffffffffff84f3
!	Mem[0000000010041408] = 0000000063000000, %f10 = ffffffff 000000ff
	ldda	[%i1+%o4]0x88,%f10	! %f10 = 00000000 63000000
!	Mem[0000000010041430] = 6fb6006100000000, %l5 = 00000000000000ff
	ldxa	[%i1+0x030]%asi,%l5	! %l5 = 6fb6006100000000
!	Mem[0000000010141400] = 0000ff008ec1195f, %l4 = 0000000000001e00
	ldxa	[%i5+%g0]0x80,%l4	! %l4 = 0000ff008ec1195f
!	%f16 = 5f19c18e, %f10 = 00000000
	fsqrts	%f16,%f10		! %f10 = 4f4665c0
!	Mem[0000000010041410] = ffffffff, %l2 = 0000000000000055
	lduba	[%i1+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = 000000ff, %l2 = 00000000000000ff
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f0  = 1e000000 00000000 ff0000ff 0000ff00
!	%f4  = 000000ff 30b4aa5a 000000ff e9b9d0b2
!	%f8  = 0000ffeb ff000121 4f4665c0 63000000
!	%f12 = 6fb60061 00000063 ffff0000 000045ff
	stda	%f0,[%i0]ASI_BLK_P	! Block Store to 0000000010001400

p0_label_288:
!	%l3 = 0000000000000000, %l1 = 0000000000000000, %l0 = ffffffffffffffff
	or	%l3,%l1,%l0		! %l0 = 0000000000000000
!	%f22 = 7237118d 00000000, Mem[0000000010081408] = ff00ffbf 00d10000
	stda	%f22,[%i2+%o4]0x80	! Mem[0000000010081408] = 7237118d 00000000
!	%l6 = 0000000021000000, Mem[00000000211c0000] = 00007f1a, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00007f1a
!	%f26 = 8d113772 bf4f0423, Mem[0000000010181408] = 00000000 21ff0000
	stda	%f26,[%i6+%o4]0x88	! Mem[0000000010181408] = 8d113772 bf4f0423
!	%l1 = 0000000000000000, Mem[000000001010143b] = 5bff63b2
	stb	%l1,[%i4+0x03b]		! Mem[0000000010101438] = 5bff6300
!	Mem[0000000010181410] = ffffffff, %l7 = ffffffffffff84f3
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 00000000ffffffff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010141410] = d31a001e 00000000
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 00000000
!	%l1 = 0000000000000000, Mem[0000000010181410] = ffff84f3
	stba	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = ffff8400
!	%l5 = 6fb6006100000000, Mem[0000000010101400] = 00000000
	stwa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ff00000000000000, %f26 = 8d113772 bf4f0423
	ldda	[%i0+%g0]0x81,%f26	! %f26 = ff000000 00000000

p0_label_289:
!	Mem[0000000010041438] = 3988957ad31ad138, %f22 = 7237118d 00000000
	ldda	[%i1+0x038]%asi,%f22	! %f22 = 3988957a d31ad138
!	Mem[0000000010041400] = 0000001e, %l4 = 0000ff008ec1195f
	lduwa	[%i1+%g0]0x88,%l4	! %l4 = 000000000000001e
!	Mem[00000000300c1400] = ffffffffcb000000, %f16 = 5f19c18e 00ff0000
	ldda	[%i3+%g0]0x81,%f16	! %f16 = ffffffff cb000000
	membar	#Sync			! Added by membar checker (49)
!	Mem[0000000010001400] = 0000001e, %l2 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l2	! %l2 = 000000000000001e
!	Mem[0000000010181410] = 0084ffff, %l3 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = 5f19c18e, %l3 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l3	! %l3 = 000000000000c18e
!	Mem[0000000010041400] = 1e000000 00000000, %l0 = 00000000, %l1 = 00000000
	ldd	[%i1+%g0],%l0		! %l0 = 000000001e000000 0000000000000000
!	Mem[0000000010001408] = ff0000ff0000ff00, %l3 = 000000000000c18e
	ldxa	[%i0+0x008]%asi,%l3	! %l3 = ff0000ff0000ff00
!	Mem[0000000030181400] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i6+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = 6fb6006100000000, Mem[00000000100c1410] = 00000000
	stba	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000

p0_label_290:
!	Mem[0000000030041400] = 0000ff00, %l4 = 000000000000001e
	ldstuba	[%i1+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010181400] = 0000ff008ec1195f
	stxa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000000
!	%f0  = 1e000000 00000000 ff0000ff 0000ff00
!	%f4  = 000000ff 30b4aa5a 000000ff e9b9d0b2
!	%f8  = 0000ffeb ff000121 4f4665c0 63000000
!	%f12 = 6fb60061 00000063 ffff0000 000045ff
	stda	%f0,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	%l1 = ffffffffffffffff, Mem[0000000010181410] = 0084ffff00000000
	stxa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffffffffffff
	membar	#Sync			! Added by membar checker (50)
!	Mem[00000000100c1400] = 00000000, %l6 = 0000000021000000
	swapa	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%l0 = 000000001e000000, Mem[0000000030001410] = 845481115f19c18e
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000001e000000
!	%l0 = 000000001e000000, Mem[0000000010041408] = 00000063
	stwa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 1e000000
!	%f25 = ffff0000, Mem[0000000010041410] = ffffffff
	sta	%f25,[%i1+%o5]0x88	! Mem[0000000010041410] = ffff0000
!	%l0 = 1e000000, %l1 = ffffffff, Mem[0000000010041400] = 1e000000 00000000
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 1e000000 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 1e000000, %l0 = 000000001e000000
	lduha	[%i0+0x000]%asi,%l0	! %l0 = 0000000000001e00

p0_label_291:
!	Mem[0000000010141400] = 0000ff00, %f10 = 4f4665c0
	lda	[%i5+%g0]0x80,%f10	! %f10 = 0000ff00
!	Mem[000000001004141c] = e9b9d0b2, %l1 = ffffffffffffffff
	ldsba	[%i1+0x01c]%asi,%l1	! %l1 = ffffffffffffffe9
!	Mem[0000000030181410] = 00000000, %l6 = 0000000000000000
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = ff000000, %l3 = ff0000ff0000ff00
	lduba	[%i4+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 00ff0000, %l0 = 0000000000001e00
	ldsha	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l2 = 000000000000001e, imm = fffffffffffff97f, %l1 = ffffffffffffffe9
	andn	%l2,-0x681,%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 0000ff00, %l2 = 000000000000001e
	lduha	[%i3+%o4]0x88,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010081408] = 7237118d, %l6 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 000000007237118d
!	Starting 10 instruction Store Burst
!	%f22 = 3988957a d31ad138, %l6 = 000000007237118d
!	Mem[0000000030001420] = ffffffffdc000000
	add	%i0,0x020,%g1
	stda	%f22,[%g1+%l6]ASI_PST32_S ! Mem[0000000030001420] = ffffffffd31ad138

p0_label_292:
!	Mem[00000000100c1400] = 21000000, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 0000000021000000
!	%l4 = 0000000000000000, Mem[0000000010101408] = ff000000
	stha	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%f22 = 3988957a d31ad138, %l4 = 0000000000000000
!	Mem[0000000030001430] = 6100b66f618f63d5
	add	%i0,0x030,%g1
	stda	%f22,[%g1+%l4]ASI_PST8_S ! Mem[0000000030001430] = 6100b66f618f63d5
!	%l2 = 000000000000ff00, Mem[0000000020800040] = ffff2c25, %asi = 80
	stba	%l2,[%o1+0x040]%asi	! Mem[0000000020800040] = 00ff2c25
!	Mem[000000001010142b] = 000000cb, %l4 = 0000000000000000
	ldstuba	[%i4+0x02b]%asi,%l4	! %l4 = 000000cb000000ff
!	%f24 = bbde47e2 ffff0000, Mem[0000000010181400] = 00000000 00000000
	stda	%f24,[%i6+%g0]0x80	! Mem[0000000010181400] = bbde47e2 ffff0000
!	%l3 = 0000000021000000, Mem[00000000201c0000] = d1007d80, %asi = 80
	stba	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00007d80
!	Mem[0000000030181408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%f24 = bbde47e2 ffff0000, %l3 = 0000000021000000
!	Mem[0000000030181420] = bbde47e247bff731
	add	%i6,0x020,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030181420] = bbde47e247bff731
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00e6967e000000ff, %l4 = 00000000000000cb
	ldxa	[%i4+%o4]0x89,%l4	! %l4 = 00e6967e000000ff

p0_label_293:
!	Mem[00000000100c1410] = 5aaab430, %l0 = 00000000000000ff
	ldsha	[%i3+%o5]0x80,%l0	! %l0 = 0000000000005aaa
!	%l3 = 0000000021000000, %l2 = 000000000000ff00, %l7 = 00000000ffffffff
	orn	%l3,%l2,%l7		! %l7 = ffffffffffff00ff
!	Mem[0000000030141410] = 001e0000000000ff, %f30 = 00000000 000000cb
	ldda	[%i5+%o5]0x89,%f30	! %f30 = 001e0000 000000ff
!	Code Fragment 3
p0_fragment_24:
!	%l0 = 0000000000005aaa
	setx	0x2a8683584f6be468,%g7,%l0 ! %l0 = 2a8683584f6be468
!	%l1 = 0000000000000000
	setx	0x810b417836202f52,%g7,%l1 ! %l1 = 810b417836202f52
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2a8683584f6be468
	setx	0x58cfd31f8a7d4cca,%g7,%l0 ! %l0 = 58cfd31f8a7d4cca
!	%l1 = 810b417836202f52
	setx	0xee5fc87fb382eeee,%g7,%l1 ! %l1 = ee5fc87fb382eeee
!	Mem[0000000010101438] = 5bff6300, %f15 = 000045ff
	lda	[%i4+0x038]%asi,%f15	! %f15 = 5bff6300
!	Mem[0000000030041410] = 00000000, %l2 = 000000000000ff00
	lduha	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800040] = 00ff2c25, %l2 = 0000000000000000
	ldsb	[%o1+0x040],%l2		! %l2 = 0000000000000000
!	Mem[0000000030041408] = 000045ff, %l5 = 6fb6006100000000
	lduba	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141400] = 7237118d, %l1 = ee5fc87fb382eeee
	lduha	[%i5+%g0]0x81,%l1	! %l1 = 0000000000007237
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000007237, %l2 = 0000000000000000, %l6 = 000000007237118d
	xor	%l1,%l2,%l6		! %l6 = 0000000000007237

p0_label_294:
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000030001410] = 1e000000 00000000
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff 000000ff
!	%l2 = 00000000, %l3 = 21000000, Mem[00000000100c1410] = 5aaab430 ff000000
	stda	%l2,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00000000 21000000
!	Mem[0000000010001408] = ff0000ff, %l6 = 0000000000007237
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010041408] = 1e000000, %l0 = 58cfd31f8a7d4cca
	swapa	[%i1+%o4]0x80,%l0	! %l0 = 000000001e000000
!	%f2  = ff0000ff 0000ff00, %l1 = 0000000000007237
!	Mem[0000000030101400] = 000000ff0000001e
	stda	%f2,[%i4+%l1]ASI_PST16_SL ! Mem[0000000030101400] = 00ff0000ff00001e
!	Mem[0000000010041434] = 00000000, %l7 = ffffffffffff00ff
	swap	[%i1+0x034],%l7		! %l7 = 0000000000000000
!	%f3  = 0000ff00, Mem[0000000010081408] = 8d113772
	sta	%f3 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000ff00
!	Mem[00000000300c1408] = 00000000, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010041400] = 0000001e ffffffff
	stda	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 000000ff, %l7 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_295:
!	Mem[0000000010001438] = ffff0000, %f16 = ffffffff
	lda	[%i0+0x038]%asi,%f16	! %f16 = ffff0000
!	Mem[0000000010101408] = 00000000, %l0 = 000000001e000000
	lduha	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800040] = 00ff2c25, %l5 = 00000000000000ff
	ldsh	[%o1+0x040],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030141410] = ff000000, %f9  = ff000121
	lda	[%i5+%o5]0x81,%f9 	! %f9 = ff000000
!	%f19 = 000045ff, %f11 = 63000000
	fcmps	%fcc3,%f19,%f11		! %fcc3 = 1
!	Mem[0000000010141428] = 84548111, %l2 = 0000000000000000
	lduba	[%i5+0x029]%asi,%l2	! %l2 = 0000000000000054
!	Mem[0000000010001410] = ff000000, %l7 = 00000000000000ff
	ldsha	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 00ff0000, %f12 = 6fb60061
	lda	[%i4+%g0]0x81,%f12	! %f12 = 00ff0000
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000000007237
	lduwa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001000141c] = e9b9d0b2, %l3 = 0000000021000000
	ldstuba	[%i0+0x01c]%asi,%l3	! %l3 = 000000e9000000ff

p0_label_296:
!	%l3 = 00000000000000e9, Mem[00000000218000c0] = d100f956
	stb	%l3,[%o3+0x0c0]		! Mem[00000000218000c0] = e900f956
!	%f6  = 000000ff e9b9d0b2, %l1 = 0000000000000000
!	Mem[0000000010141420] = 31f7bf47e247debb
	add	%i5,0x020,%g1
	stda	%f6,[%g1+%l1]ASI_PST32_P ! Mem[0000000010141420] = 31f7bf47e247debb
!	Mem[0000000010181400] = e247debb, %l0 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l0	! %l0 = 000000bb000000ff
!	Mem[0000000010041438] = 3988957a, %l0 = 00000000000000bb, %asi = 80
	swapa	[%i1+0x038]%asi,%l0	! %l0 = 000000003988957a
!	Mem[0000000030101410] = 00000000, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%f6  = 000000ff e9b9d0b2, Mem[0000000010001410] = 000000ff 30b4aa5a
	stda	%f6 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff e9b9d0b2
!	Mem[0000000010001434] = 00000063, %l5 = 000000ff, %l4 = 000000ff
	add	%i0,0x34,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 0000000000000063
!	%f8  = 0000ffeb, Mem[00000000100c1400] = 00000000
	sta	%f8 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000ffeb
!	%l0 = 000000003988957a, Mem[00000000300c1410] = 8ec1195f
	stha	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 957a195f
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000000021000000, %l5 = 00000000000000ff
	ldxa	[%i3+0x010]%asi,%l5	! %l5 = 0000000021000000

p0_label_297:
!	Mem[0000000030081410] = 000000ff, %l1 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l1 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001434] = 00000063, %l1 = 00000000000000ff
	lduw	[%i0+0x034],%l1		! %l1 = 0000000000000063
!	Mem[0000000010141408] = 21ff0000000045ff, %l0 = 000000003988957a
	ldxa	[%i5+%o4]0x88,%l0	! %l0 = 21ff0000000045ff
!	Mem[0000000030141400] = 8d113772, %f9  = ff000000
	lda	[%i5+%g0]0x89,%f9 	! %f9 = 8d113772
!	Mem[00000000201c0000] = 00007d80, %l7 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = ca4c7d8a, %f26 = ff000000
	lda	[%i1+%o4]0x88,%f26	! %f26 = ca4c7d8a
!	Mem[0000000010001410] = ff000000, %l1 = 0000000000000063
	lduha	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001004143c] = d31ad138, %l3 = 00000000000000e9
	ldsba	[%i1+0x03e]%asi,%l3	! %l3 = ffffffffffffffd1
!	Starting 10 instruction Store Burst
!	%f0  = 1e000000 00000000 ff0000ff 0000ff00
!	%f4  = 000000ff 30b4aa5a 000000ff e9b9d0b2
!	%f8  = 0000ffeb 8d113772 0000ff00 63000000
!	%f12 = 00ff0000 00000063 ffff0000 5bff6300
	stda	%f0,[%i3]ASI_BLK_AIUPL	! Block Store to 00000000100c1400

p0_label_298:
!	%l4 = 0000000000000063, Mem[0000000020800040] = 00ff2c25, %asi = 80
	stha	%l4,[%o1+0x040]%asi	! Mem[0000000020800040] = 00632c25
!	Mem[0000000030101408] = ff000000, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	%f21 = 1e001ad3, %f17 = cb000000, %f16 = ffff0000
	fsubs	%f21,%f17,%f16		! %f16 = 4b000000
	membar	#Sync			! Added by membar checker (51)
!	Mem[00000000100c1414] = ff000000, %l1 = 00000000ff000000, %asi = 80
	swapa	[%i3+0x014]%asi,%l1	! %l1 = 00000000ff000000
!	%f16 = 4b000000 cb000000 21ff0000 000045ff
!	%f20 = 00000000 1e001ad3 3988957a d31ad138
!	%f24 = bbde47e2 ffff0000 ca4c7d8a 00000000
!	%f28 = 84548111 5f19c18e 001e0000 000000ff
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%f6  = 000000ff, %f14 = ffff0000, %f10 = 0000ff00
	fsubs	%f6 ,%f14,%f10		! %f10 = ffff0000
!	%l4 = 0000000000000063, Mem[00000000211c0000] = 00007f1a, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00637f1a
!	%f8  = 0000ffeb 8d113772, %l0 = 21ff0000000045ff
!	Mem[0000000030141408] = ff4500000000ffff
	add	%i5,0x008,%g1
	stda	%f8,[%g1+%l0]ASI_PST8_S ! Mem[0000000030141408] = 0000ffeb8d113772
!	%l6 = 000000ff, %l7 = 00000000, Mem[00000000300c1408] = 00000000 00000030
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = ad880a7665450a09, %l1 = 00000000ff000000
	ldxa	[%i6+0x038]%asi,%l1	! %l1 = ad880a7665450a09

p0_label_299:
!	%l4 = 0000000000000063, %l6 = 00000000000000ff, %l2  = 0000000000000054
	mulx	%l4,%l6,%l2		! %l2 = 000000000000629d
!	Mem[0000000010181408] = bf4f0423, %f14 = ffff0000
	lda	[%i6+%o4]0x88,%f14	! %f14 = bf4f0423
!	Mem[00000000300c1408] = ff000000, %l6 = 00000000000000ff
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = ffff0000, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800000] = ffff16cb, %l2 = 000000000000629d
	lduha	[%o1+0x000]%asi,%l2	! %l2 = 000000000000ffff
	membar	#Sync			! Added by membar checker (52)
!	Mem[0000000010101408] = 00000000, %l0 = 21ff0000000045ff
	ldsha	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001400] = 000000ff, %l2 = 000000000000ffff
	lduwa	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = ffde47e2, %l5 = 0000000021000000
	ldswa	[%i6+%g0]0x80,%l5	! %l5 = ffffffffffde47e2
!	Starting 10 instruction Store Burst
!	%f28 = 84548111, Mem[00000000300c1408] = 000000ff
	sta	%f28,[%i3+%o4]0x81	! Mem[00000000300c1408] = 84548111

p0_label_300:
!	%l2 = 00000000000000ff, Mem[000000001000140e] = 0000ff00
	stb	%l2,[%i0+0x00e]		! Mem[000000001000140c] = 0000ff00
!	Mem[0000000010041408] = ca4c7d8a, %l5 = ffffffffffde47e2
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 00000000ca4c7d8a
!	%l4 = 0000000000000063, Mem[0000000010041410] = 0000ffff00000000
	stxa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000063
!	%l2 = 000000ff, %l3 = ffffffd1, Mem[00000000100c1410] = 5aaab430 ff000000
	stda	%l2,[%i3+0x010]%asi	! Mem[00000000100c1410] = 000000ff ffffffd1
!	%f6  = 000000ff e9b9d0b2, Mem[0000000010141400] = 0000ff00 8ec1195f
	stda	%f6 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff e9b9d0b2
!	Mem[00000000201c0001] = 00007d80, %l4 = 0000000000000063
	ldstub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	%f15 = 5bff6300, Mem[0000000030141408] = 0000ffeb
	sta	%f15,[%i5+%o4]0x81	! Mem[0000000030141408] = 5bff6300
!	%l1 = ad880a7665450a09, Mem[0000000020800000] = ffff16cb, %asi = 80
	stba	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = 09ff16cb
!	%f16 = 4b000000 cb000000 21ff0000 000045ff
!	%f20 = 00000000 1e001ad3 3988957a d31ad138
!	%f24 = bbde47e2 ffff0000 ca4c7d8a 00000000
!	%f28 = 84548111 5f19c18e 001e0000 000000ff
	stda	%f16,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 7237118d0063ff5b, %f8  = 0000ffeb 8d113772
	ldda	[%i5+%o4]0x89,%f8 	! %f8  = 7237118d 0063ff5b

p0_label_301:
!	Mem[0000000030101408] = ff450000 0000ff21, %l2 = 000000ff, %l3 = ffffffd1
	ldda	[%i4+%o4]0x89,%l2	! %l2 = 000000000000ff21 00000000ff450000
!	Mem[0000000030081408] = ffff84f3 000000ff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 00000000ffff84f3 00000000000000ff
!	Mem[0000000030141400] = 7237118d, %l3 = 00000000ff450000
	lduba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000072
!	Mem[0000000030001410] = ff000000 ff000000, %l6 = ffff84f3, %l7 = 000000ff
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff000000 00000000ff000000
!	Mem[00000000100c1400] = 00000000, %l6 = 00000000ff000000
	ldsba	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l0 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l6 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = ff450000, %f14 = bf4f0423
	lda	[%i5+%o4]0x80,%f14	! %f14 = ff450000
!	%l4 = 0000000000000000, Mem[0000000030081408] = ff000000f384ffff
	stxa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ff000000, Mem[0000000030141400] = 7237118d
	stba	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 0037118d

p0_label_302:
!	%l2 = 000000000000ff21, Mem[00000000300c1400] = ffffffffcb000000
	stxa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000000000ff21
!	%l5 = 00000000ca4c7d8a, Mem[000000001004141a] = 3988957a, %asi = 80
	stha	%l5,[%i1+0x01a]%asi	! Mem[0000000010041418] = 39887d8a
!	%f14 = ff450000 5bff6300, Mem[0000000010081410] = ff0000ff 00ff0000
	stda	%f14,[%i2+%o5]0x88	! Mem[0000000010081410] = ff450000 5bff6300
!	Mem[0000000010001408] = ff0000ff, %l2 = 000000000000ff21
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 00000000ff0000ff
!	%l2 = 00000000ff0000ff, Mem[0000000030041400] = 00ff00ff
	stha	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00ff00ff
!	Mem[0000000010141428] = 845481115f19c18e, %l2 = 00000000ff0000ff, %l1 = ad880a7665450a09
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 845481115f19c18e
!	%f0  = 1e000000 00000000 ff0000ff 0000ff00
!	%f4  = 000000ff 30b4aa5a 000000ff e9b9d0b2
!	%f8  = 7237118d 0063ff5b ffff0000 63000000
!	%f12 = 00ff0000 00000063 ff450000 5bff6300
	stda	%f0,[%i3]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	%f17 = cb000000, Mem[0000000010041408] = 21ff0000
	sta	%f17,[%i1+%o4]0x80	! Mem[0000000010041408] = cb000000
!	%f26 = ca4c7d8a 00000000, Mem[0000000030141410] = 000000ff 001e0000
	stda	%f26,[%i5+%o5]0x89	! Mem[0000000030141410] = ca4c7d8a 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 000000ff, %l5 = 00000000ca4c7d8a
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = ffffffffffffffff

p0_label_303:
!	Mem[0000000010141408] = ff450000, %l2 = 00000000ff0000ff
	lduha	[%i5+%o4]0x80,%l2	! %l2 = 000000000000ff45
!	Mem[0000000010001408] = 21ff0000, %l1 = 845481115f19c18e
	lduwa	[%i0+%o4]0x80,%l1	! %l1 = 0000000021ff0000
!	Mem[0000000010001428] = 4f4665c063000000, %l1 = 0000000021ff0000
	ldx	[%i0+0x028],%l1		! %l1 = 4f4665c063000000
!	Mem[0000000030181408] = ff000000, %l0 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l0	! %l0 = ffffffffff000000
	membar	#Sync			! Added by membar checker (53)
!	Mem[00000000100c1410] = ff000000, %l4 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000ff000000
	lduba	[%i3+0x003]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 000000cb0000004b, %f28 = 84548111 5f19c18e
	ldda	[%i1+%g0]0x88,%f28	! %f28 = 000000cb 0000004b
!	Mem[00000000218000c0] = e900f956, %l3 = 0000000000000072
	lduh	[%o3+0x0c0],%l3		! %l3 = 000000000000e900
!	Mem[00000000211c0000] = 00637f1a, %l4 = 0000000000000000
	ldsh	[%o2+%g0],%l4		! %l4 = 0000000000000063
!	Starting 10 instruction Store Burst
!	%l1 = 4f4665c063000000, Mem[0000000010141410] = 00000000
	stwa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 63000000

p0_label_304:
!	Mem[0000000030081400] = 00000000, %l1 = 4f4665c063000000
	lduha	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l4 = 0000000000000063
	ldstuba	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010181428] = 23044fbf7237118d, %asi = 80
	stxa	%l7,[%i6+0x028]%asi	! Mem[0000000010181428] = 0000000000000000
!	Code Fragment 4
p0_fragment_25:
!	%l0 = ffffffffff000000
	setx	0x67d7eae7ccde1518,%g7,%l0 ! %l0 = 67d7eae7ccde1518
!	%l1 = 0000000000000000
	setx	0x21f5be4026943e07,%g7,%l1 ! %l1 = 21f5be4026943e07
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 67d7eae7ccde1518
	setx	0xeeb0e328754b8761,%g7,%l0 ! %l0 = eeb0e328754b8761
!	%l1 = 21f5be4026943e07
	setx	0xe21f95e7dc759fd2,%g7,%l1 ! %l1 = e21f95e7dc759fd2
!	%l5 = ffffffffffffffff, Mem[00000000100c140e] = ff0000ff
	stb	%l5,[%i3+0x00e]		! Mem[00000000100c140c] = ff00ffff
!	%f10 = ffff0000 63000000, Mem[00000000300c1410] = ff000000 5aaab430
	stda	%f10,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffff0000 63000000
!	%f22 = 3988957a d31ad138, Mem[0000000030081400] = 00000000 00000000
	stda	%f22,[%i2+%g0]0x81	! Mem[0000000030081400] = 3988957a d31ad138
!	Mem[0000000030141410] = 00000000, %l1 = e21f95e7dc759fd2
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081418] = c545ffff, %l7 = 0000000000000000
	swap	[%i2+0x018],%l7		! %l7 = 00000000c545ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00ff0000 00000000, %l2 = 0000ff45, %l3 = 0000e900
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 0000000000ff0000 0000000000000000

p0_label_305:
!	Mem[0000000030081400] = 3988957a, %l3 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l3	! %l3 = 0000000000003988
!	Mem[0000000010081400] = ff00ff0000000000, %l0 = eeb0e328754b8761
	ldxa	[%i2+%g0]0x88,%l0	! %l0 = ff00ff0000000000
!	Mem[0000000010141408] = 000045ff, %l3 = 0000000000003988
	ldsba	[%i5+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000020800000] = 09ff16cb, %l2 = 0000000000ff0000
	ldsb	[%o1+%g0],%l2		! %l2 = 0000000000000009
!	Mem[0000000010181410] = ffffffff, %l7 = 00000000c545ffff
	ldsha	[%i6+0x010]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000020800000] = 09ff16cb, %l0 = ff00ff0000000000
	ldsh	[%o1+%g0],%l0		! %l0 = 00000000000009ff
!	Mem[000000001014141c] = e3b10641, %l5 = ffffffffffffffff
	lduha	[%i5+0x01c]%asi,%l5	! %l5 = 000000000000e3b1
!	Mem[0000000010141408] = ff450000, %l7 = ffffffffffffffff
	lduha	[%i5+%o4]0x80,%l7	! %l7 = 000000000000ff45
!	Mem[0000000030141408] = 0063ff5b, %l2 = 0000000000000009
	lduba	[%i5+%o4]0x89,%l2	! %l2 = 000000000000005b
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 000000ff000000ff

p0_label_306:
!	%f24 = bbde47e2 ffff0000, Mem[0000000030101410] = 000000ff d31a001e
	stda	%f24,[%i4+%o5]0x89	! Mem[0000000030101410] = bbde47e2 ffff0000
!	Mem[0000000010001400] = 1e000000, %l3 = ffffffffffffffff
	swapa	[%i0+%g0]0x80,%l3	! %l3 = 000000001e000000
!	%f13 = 00000063, Mem[0000000030081400] = 7a958839
	sta	%f13,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000063
!	Mem[0000000030181410] = 00000000, %l0 = 00000000000009ff
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = ff000000, %l3 = 000000001e000000
	ldstuba	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010141406] = e9b9d0b2
	sth	%l4,[%i5+0x006]		! Mem[0000000010141404] = e9b90000
!	Mem[00000000100c1408] = 00ff0000, %l6 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l6	! %l6 = 0000000000ff0000
!	Mem[0000000030141408] = 5bff6300, %l5 = 000000000000e3b1
	ldstuba	[%i5+%o4]0x81,%l5	! %l5 = 0000005b000000ff
!	Mem[00000000201c0001] = 00ff7d80, %l4 = 0000000000000000
	ldstub	[%o0+0x001],%l4		! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 0063ffff, %l3 = 0000000000000000
	ldsha	[%i5+%o4]0x89,%l3	! %l3 = ffffffffffffffff

p0_label_307:
!	Mem[0000000030181400] = ff000000, %l2 = 000000000000005b
	ldsha	[%i6+%g0]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[00000000211c0000] = 00637f1a, %l2 = ffffffffffffff00
	ldsb	[%o2+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081408] = 0000ff00, %l4 = 00000000000000ff
	ldswa	[%i2+%o4]0x88,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030181408] = ff000000000045ff, %f24 = bbde47e2 ffff0000
	ldda	[%i6+%o4]0x81,%f24	! %f24 = ff000000 000045ff
!	Mem[0000000010001410] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 000000ff000000ff, %l5 = 000000000000005b
	ldxa	[%i2+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000020800040] = 00632c25, %l1 = 00000000000000ff
	ldub	[%o1+0x041],%l1		! %l1 = 0000000000000063
!	Mem[0000000030001400] = 000000ff, %l5 = 000000ff000000ff
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181400] = 000000ff, %l5 = 00000000000000ff
	ldsba	[%i6+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f8  = 7237118d 0063ff5b, Mem[0000000010141408] = ff450000 0000ff21
	stda	%f8 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 7237118d 0063ff5b

p0_label_308:
!	Mem[0000000010181410] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010041409] = cb000000, %l7 = 000000000000ff45
	ldstuba	[%i1+0x009]%asi,%l7	! %l7 = 00000000000000ff
!	%l5 = ffffffffffffffff, Mem[0000000010141410] = 0000000063000000
	stxa	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffffffffffff
!	%l4 = 000000000000ff00, Mem[0000000010181400] = 0000ffffe247deff
	stxa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000000000ff00
!	Mem[00000000300c1408] = ff0000ff, %l1 = 0000000000000063
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ff0000ff
!	Mem[00000000300c1410] = 63000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[00000000211c0000] = 00637f1a
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = ffff7f1a
!	%f2  = ff0000ff 0000ff00, Mem[00000000100c1408] = 00000000 ffff00ff
	stda	%f2 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff0000ff 0000ff00
!	%l6 = 00ff0000, %l7 = 00000000, Mem[0000000010001408] = 0000ff21 00ff0000
	stda	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00ff0000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 0000ffcb, %l0 = 0000000000000000
	lduba	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000cb

p0_label_309:
!	Mem[0000000010101410] = 5f19c18e001e0000, %f8  = 7237118d 0063ff5b
	ldda	[%i4+%o5]0x88,%f8 	! %f8  = 5f19c18e 001e0000
!	Mem[0000000010101408] = 00000000, %l6 = 0000000000ff0000
	lduba	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 0037118d00000000, %f6  = 000000ff e9b9d0b2
	ldda	[%i5+%g0]0x81,%f6 	! %f6  = 0037118d 00000000
!	%f0  = 1e000000, %f8  = 5f19c18e
	fcmpes	%fcc3,%f0 ,%f8 		! %fcc3 = 1
!	Mem[00000000100c1410] = ff0000ff, %f13 = 00000063
	lda	[%i3+%o5]0x88,%f13	! %f13 = ff0000ff
!	Mem[00000000100c1400] = 00000000, %l4 = 000000000000ff00
	ldsha	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 001e0000, %l3 = ffffffffffffffff
	lduha	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = 000000000000ff00, %l7 = 0000000000000000
	ldxa	[%i6+%g0]0x88,%l7	! %l7 = 000000000000ff00
!	%l1 = 00000000ff0000ff, imm = fffffffffffff6dd, %l0 = 00000000000000cb
	xnor	%l1,-0x923,%l0		! %l0 = 00000000ff0009dd
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_26:
!	%l0 = 00000000ff0009dd
	setx	0x7a1257300e62396c,%g7,%l0 ! %l0 = 7a1257300e62396c
!	%l1 = 00000000ff0000ff
	setx	0x561a30ef8023fe1a,%g7,%l1 ! %l1 = 561a30ef8023fe1a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7a1257300e62396c
	setx	0x9d436bb79d57e01c,%g7,%l0 ! %l0 = 9d436bb79d57e01c
!	%l1 = 561a30ef8023fe1a
	setx	0x559d4367e1dc3cb8,%g7,%l1 ! %l1 = 559d4367e1dc3cb8

p0_label_310:
!	%l3 = 0000000000000000, Mem[0000000010081404] = 00ff00ff, %asi = 80
	stwa	%l3,[%i2+0x004]%asi	! Mem[0000000010081404] = 00000000
!	Mem[0000000030141400] = 8d113700, %l5 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001430] = 6fb60061, %l4 = 0000000000000000, %asi = 80
	swapa	[%i0+0x030]%asi,%l4	! %l4 = 000000006fb60061
!	%l4 = 6fb60061, %l5 = 00000000, Mem[0000000010081400] = 00000000 00000000
	stda	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 6fb60061 00000000
!	Mem[0000000030141408] = ffff6300, %l7 = 000000000000ff00
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030141400] = ff37118d, %l0 = 9d436bb79d57e01c
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff37118d
!	Mem[000000001004140f] = 000045ff, %l6 = 0000000000000000
	ldstub	[%i1+0x00f],%l6		! %l6 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000030101408] = 21ff0000000045ff
	stxa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l1 = 559d4367e1dc3cb8
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 5bff6300, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = 000000005bff6300

p0_label_311:
!	Mem[0000000010101410] = 001e0000, %l7 = 00000000000000ff
	ldsha	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 8d113772, %l6 = 00000000000000ff
	ldsha	[%i5+%o4]0x88,%l6	! %l6 = 0000000000003772
!	Mem[0000000030041408] = 000045ff, %l7 = 0000000000000000
	ldsba	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181420] = 31f7bf47e247debb, %l7 = ffffffffffffffff
	ldx	[%i6+0x020],%l7		! %l7 = 31f7bf47e247debb
!	Mem[000000001004143c] = 000000ff, %l5 = 0000000000000000
	ldsb	[%i1+0x03c],%l5		! %l5 = 0000000000000000
!	Mem[0000000030081410] = 000000ff, %l1 = 000000005bff6300
	ldswa	[%i2+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181408] = ff000000 000045ff, %l0 = ff37118d, %l1 = 000000ff
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 00000000ff000000 00000000000045ff
!	%f19 = 000045ff, %f9  = 001e0000, %f24 = ff000000
	fsubs	%f19,%f9 ,%f24		! %l0 = 00000000ff000022, Unfinished, %fsr = 1500000400
!	%l1 = 00000000000045ff, %l3 = 0000000000000000, %l4 = 000000006fb60061
	xnor	%l1,%l3,%l4		! %l4 = ffffffffffffba00
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, %l7 = 31f7bf47e247debb, %l1 = 00000000000045ff
	xor	%l5,%l7,%l1		! %l1 = 31f7bf47e247debb

p0_label_312:
!	%l4 = ffffffffffffba00, Mem[0000000030101410] = ffff0000
	stba	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = ffff0000
!	Mem[0000000010101400] = ff000000, %l3 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	%l4 = ffffffffffffba00, Mem[0000000010141400] = ff000000
	stha	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = ff00ba00
!	%l0 = ff000022, %l1 = e247debb, Mem[0000000030101410] = 0000ffff e247debb
	stda	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = ff000022 e247debb
!	%l6 = 0000000000003772, Mem[0000000030001408] = 00000000
	stwa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00003772
!	%l4 = ffffba00, %l5 = 00000000, Mem[0000000010101410] = 00001e00 8ec1195f
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffba00 00000000
!	%l0 = 00000000ff000022, Mem[00000000300c1408] = 63000000
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 63000022
!	Mem[00000000300c1408] = 63000022, %l0 = 00000000ff000022
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 0000000063000022
!	%l4 = ffffffffffffba00, Mem[0000000030081400] = 63000000
	stwa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffba00
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = ffffffaa00000061, %l2 = 00000000000000ff
	ldx	[%i4+0x018],%l2		! %l2 = ffffffaa00000061

p0_label_313:
!	Mem[00000000218001c0] = 27007b35, %l1 = 31f7bf47e247debb
	ldsba	[%o3+0x1c0]%asi,%l1	! %l1 = 0000000000000027
!	Mem[0000000030001400] = 000000ff, %l0 = 0000000063000022
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081410] = 0063ff5b000045ff, %f12 = 00ff0000 ff0000ff
	ldda	[%i2+0x010]%asi,%f12	! %f12 = 0063ff5b 000045ff
!	Mem[00000000300c1400] = 1e000000 00000000, %l4 = ffffba00, %l5 = 00000000
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 000000001e000000 0000000000000000
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000003772
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = 0000000000000000, %f10 = ffff0000 63000000
	ldda	[%i2+%o4]0x81,%f10	! %f10 = 00000000 00000000
!	Mem[00000000100c1400] = 1e00000000000000, %f6  = 0037118d 00000000
	ldda	[%i3+%g0]0x88,%f6 	! %f6  = 1e000000 00000000
!	Mem[0000000021800140] = 000002f2, %l6 = 0000000000000000
	ldub	[%o3+0x140],%l6		! %l6 = 0000000000000000
!	%l4 = 000000001e000000, %l2 = ffffffaa00000061, %l4 = 000000001e000000
	xnor	%l4,%l2,%l4		! %l4 = 00000055e1ffff9e
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, imm = fffffffffffffcc4, %l5 = 0000000000000000
	and	%l5,-0x33c,%l5		! %l5 = 0000000000000000

p0_label_314:
!	%l7 = 31f7bf47e247debb, Mem[0000000030041410] = 00000000
	stha	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = debb0000
!	%l4 = 00000055e1ffff9e, Mem[0000000010181408] = 23044fbf
	stwa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = e1ffff9e
!	Mem[0000000030001410] = ff000000, %l2 = ffffffaa00000061
	swapa	[%i0+%o5]0x81,%l2	! %l2 = 00000000ff000000
!	Mem[00000000100c1400] = 00000000, %l2 = 00000000ff000000
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l6 = 0000000000000000, %l5 = 0000000000000000, %y  = ffffffff
	smul	%l6,%l5,%l0		! %l0 = 0000000000000000, %y = 00000000
!	%l2 = 0000000000000000, Mem[0000000030181400] = ff000000
	stwa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%l0 = 0000000000000000, Mem[0000000030181400] = 00000000
	stwa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030001408] = 72370000
	stha	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 72370000
!	%l0 = 00000000, %l1 = 00000027, Mem[0000000030081408] = 00000000 00000000
	stda	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 00000027
!	Starting 10 instruction Load Burst
!	%l1 = 0000000000000027, imm = 00000000000005fe, %l6 = 0000000000000000
	and	%l1,0x5fe,%l6		! %l6 = 0000000000000026

p0_label_315:
!	Mem[0000000010101408] = ff000000, %l3 = 00000000ff000000
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000020800000] = 09ff16cb, %l6 = 0000000000000026
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 00000000000009ff
!	Mem[00000000201c0000] = 00ff7d80, %l0 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = ff00ba00, %f12 = 0063ff5b
	lda	[%i5+%g0]0x88,%f12	! %f12 = ff00ba00
!	Mem[0000000010141400] = 00ba00ff, %f5  = 30b4aa5a
	lda	[%i5+%g0]0x80,%f5 	! %f5 = 00ba00ff
!	Code Fragment 3
p0_fragment_27:
!	%l0 = 0000000000000000
	setx	0x03a372efdca4352c,%g7,%l0 ! %l0 = 03a372efdca4352c
!	%l1 = 0000000000000027
	setx	0xfe539e403f74106a,%g7,%l1 ! %l1 = fe539e403f74106a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 03a372efdca4352c
	setx	0xd39dfd1066f2a8af,%g7,%l0 ! %l0 = d39dfd1066f2a8af
!	%l1 = fe539e403f74106a
	setx	0xc48afb3fbb1efd91,%g7,%l1 ! %l1 = c48afb3fbb1efd91
!	Mem[0000000010181400] = 00ff0000, %l7 = 31f7bf47e247debb
	lduba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081420] = 4cf6ab34, %l7 = 0000000000000000
	ldswa	[%i2+0x020]%asi,%l7	! %l7 = 000000004cf6ab34
!	Mem[00000000300c1408] = 00ff0000 ff000022, %l0 = 66f2a8af, %l1 = bb1efd91
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 00000000ff000022 0000000000ff0000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ffffba00, %l7 = 000000004cf6ab34
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 000000ff000000ff

p0_label_316:
!	Mem[0000000010101408] = ff000000, %l3 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l6 = 00000000000009ff, Mem[0000000010001400] = ffffffff00000000
	stxa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000000009ff
!	Mem[00000000211c0000] = ffff7f1a, %l5 = 0000000000000000
	ldstub	[%o2+%g0],%l5		! %l5 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[000000001018142e] = 00000000, %asi = 80
	stha	%l2,[%i6+0x02e]%asi	! Mem[000000001018142c] = 00000000
!	Mem[00000000211c0000] = ffff7f1a, %l5 = 00000000000000ff
	ldstub	[%o2+%g0],%l5		! %l5 = 000000ff000000ff
!	%l0 = ff000022, %l1 = 00ff0000, Mem[0000000010001410] = 000000ff e9b9d0b2
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000022 00ff0000
!	%l7 = 00000000000000ff, Mem[0000000010081429] = ffffffff, %asi = 80
	stba	%l7,[%i2+0x029]%asi	! Mem[0000000010081428] = ffffffff
!	Mem[0000000030041400] = 00ff00ff, %l7 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 0000000000ff00ff
!	%f28 = 000000cb 0000004b, %l6 = 00000000000009ff
!	Mem[0000000030081430] = 000000cb00000000
	add	%i2,0x030,%g1
	stda	%f28,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030081430] = 4b000000cb000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000 000000ff, %l6 = 000009ff, %l7 = 00ff00ff
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000

p0_label_317:
!	Mem[0000000010081400] = 6100b66f00000000, %f26 = ca4c7d8a 00000000
	ldda	[%i2+%g0]0x80,%f26	! %f26 = 6100b66f 00000000
!	Mem[0000000030001410] = 00000061, %l7 = 0000000000000000
	ldsba	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = ffffffff, %l1 = 0000000000ff0000
	ldswa	[%i5+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141400] = ff00ba00, %l1 = ffffffffffffffff
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 00000000ff00ba00
!	Mem[0000000010041400] = 4b000000cb000000, %f12 = ff00ba00 000045ff
	ldda	[%i1+%g0]0x80,%f12	! %f12 = 4b000000 cb000000
!	Mem[00000000100c1400] = 000000ff, %l6 = 00000000000000ff
	ldsha	[%i3+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %l6 = 00000000000000ff
	lduha	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 00000000ffffffbf, %l5 = 00000000000000ff
	ldxa	[%i4+%g0]0x80,%l5	! %l5 = 00000000ffffffbf
!	Mem[0000000010141424] = e247debb, %l0 = 00000000ff000022
	lduw	[%i5+0x024],%l0		! %l0 = 00000000e247debb
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[00000000300c1408] = ff000022
	stba	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff000000

p0_label_318:
!	%f24 = ff000000 000045ff, %l2 = 0000000000000000
!	Mem[0000000030141410] = d29f75dc8a7d4cca
	add	%i5,0x010,%g1
	stda	%f24,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030141410] = d29f75dc8a7d4cca
!	Mem[0000000010041428] = ca4c7d8a, %l6 = 0000000000000000
	ldstuba	[%i1+0x028]%asi,%l6	! %l6 = 000000ca000000ff
!	Mem[0000000021800141] = 000002f2, %l0 = 00000000e247debb
	ldstub	[%o3+0x141],%l0		! %l0 = 00000000000000ff
!	Mem[000000001014141d] = e3b10641, %l2 = 0000000000000000
	ldstub	[%i5+0x01d],%l2		! %l2 = 000000b1000000ff
!	%l3 = 00000000000000ff, Mem[0000000010181408] = 9effffe1
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 9eff00ff
!	Mem[000000001008142a] = ffffffff, %l3 = 00000000000000ff
	ldstuba	[%i2+0x02a]%asi,%l3	! %l3 = 000000ff000000ff
!	%l1 = 00000000ff00ba00, Mem[0000000010001400] = ff09000000000000
	stxa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000ff00ba00
!	Mem[0000000010041408] = cbff0000, %l7 = 0000000000000000
	swap	[%i1+%o4],%l7		! %l7 = 00000000cbff0000
!	%l6 = 00000000000000ca, %l7 = 00000000cbff0000, %y  = 00000000
	umul	%l6,%l7,%l3		! %l3 = 000000a0f7360000, %y = 000000a0
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000000, imm = fffffffffffff614, %l5 = 00000000ffffffbf
	xnor	%l0,-0x9ec,%l5		! %l5 = 00000000000009eb

p0_label_319:
!	Mem[0000000010001410] = ff000022, %l0 = 0000000000000000
	ldsba	[%i0+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030141410] = d29f75dc8a7d4cca, %l1 = 00000000ff00ba00
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = d29f75dc8a7d4cca
!	Mem[0000000030081400] = ffffba00d31ad138, %l6 = 00000000000000ca
	ldxa	[%i2+%g0]0x81,%l6	! %l6 = ffffba00d31ad138
!	Mem[0000000010001410] = ff000022, %f2  = ff0000ff
	lda	[%i0+%o5]0x80,%f2 	! %f2 = ff000022
!	Mem[0000000010041410] = 00000000, %f10 = 00000000
	lda	[%i1+%o5]0x88,%f10	! %f10 = 00000000
!	Mem[000000001008142c] = ffffffff, %l5 = 00000000000009eb
	ldsh	[%i2+0x02e],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000020800040] = 00632c25, %l1 = d29f75dc8a7d4cca
	ldsh	[%o1+0x040],%l1		! %l1 = 0000000000000063
!	Mem[0000000010181424] = e247debb, %l0 = ffffffffffffffff
	ldsha	[%i6+0x026]%asi,%l0	! %l0 = ffffffffffffdebb
!	Mem[0000000030181408] = 000000ff, %f14 = ff450000
	lda	[%i6+%o4]0x89,%f14	! %f14 = 000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = ffff7f1a, %l7 = 00000000cbff0000
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000ff000000ff

p0_label_320:
!	%l0 = ffffffffffffdebb, Mem[0000000030101410] = ff000022
	stha	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = debb0022
!	Mem[0000000010041410] = 00000000, %l0 = ffffffffffffdebb
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l5 = ffffffffffffffff, %l7 = 00000000000000ff, %l4 = 00000055e1ffff9e
	addc	%l5,%l7,%l4		! %l4 = 00000000000000fe
!	%f21 = 1e001ad3, Mem[0000000030181410] = 000009ff
	sta	%f21,[%i6+%o5]0x89	! Mem[0000000030181410] = 1e001ad3
!	%f0  = 1e000000 00000000, %l3 = 000000a0f7360000
!	Mem[0000000010141430] = 8ec1195f11815484
	add	%i5,0x030,%g1
	stda	%f0,[%g1+%l3]ASI_PST16_P ! Mem[0000000010141430] = 8ec1195f11815484
!	%f6  = 1e000000 00000000, Mem[0000000030181400] = 00000000 00ff0000
	stda	%f6 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 1e000000 00000000
!	Mem[000000001004141c] = d31ad138, %l7 = 00000000000000ff
	swap	[%i1+0x01c],%l7		! %l7 = 00000000d31ad138
!	Mem[0000000010081408] = 00ff0000, %l7 = 00000000d31ad138
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%f26 = 6100b66f, %f28 = 000000cb, %f16 = 4b000000
	fdivs	%f26,%f28,%f16		! %f16 = 7f800000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0063ff5b, %l3 = 000000a0f7360000
	ldsha	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000063

p0_label_321:
!	Mem[0000000030101410] = bbde47e2 2200bbde, %l6 = d31ad138, %l7 = 00000000
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 000000002200bbde 00000000bbde47e2
!	Mem[0000000010141410] = ffffffff, %l4 = 00000000000000fe
	ldsb	[%i5+%o5],%l4		! %l4 = ffffffffffffffff
!	Mem[00000000300c1410] = ffff0000 630000ff, %l6 = 2200bbde, %l7 = bbde47e2
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 00000000630000ff 00000000ffff0000
!	Mem[0000000030041408] = ff450000 0000ff21, %l4 = ffffffff, %l5 = ffffffff
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 00000000ff450000 000000000000ff21
!	Mem[0000000010181400] = 00ff0000 00000000, %l6 = 630000ff, %l7 = ffff0000
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 0000000000ff0000 0000000000000000
!	Mem[0000000020800000] = 09ff16cb, %l3 = 0000000000000063
	ldsh	[%o1+%g0],%l3		! %l3 = 00000000000009ff
!	Mem[0000000030081410] = 000000ff, %l1 = 0000000000000063
	ldsha	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 000000ff, %l6 = 0000000000ff0000
	lduwa	[%i3+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = ffffffff0000bbde, %l1 = 0000000000000000
	ldxa	[%i1+%o5]0x89,%l1	! %l1 = ffffffff0000bbde
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010081410] = 5bff6300
	stha	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 5bff0000

p0_label_322:
!	%l4 = ff450000, %l5 = 0000ff21, Mem[0000000010101408] = 000000ff 01000000
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = ff450000 0000ff21
!	%l5 = 000000000000ff21, Mem[0000000010181410] = ffffffff
	stwa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000ff21
!	%l2 = 00000000000000b1, Mem[0000000010181412] = 0000ff21, %asi = 80
	stba	%l2,[%i6+0x012]%asi	! Mem[0000000010181410] = 0000b121
!	%l5 = 000000000000ff21, Mem[00000000211c0000] = ffff7f1a, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff217f1a
!	%f28 = 000000cb, %f0  = 1e000000, %f7  = 00000000
	fsubs	%f28,%f0 ,%f7 		! %l0 = 0000000000000022, Unfinished, %fsr = 1500000400
!	Mem[0000000030141408] = ffff6300, %l7 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l4 = 00000000ff450000, Mem[0000000030041410] = debb0000
	stha	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%l1 = ffffffff0000bbde, Mem[0000000010041410] = 000000ff
	stha	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000bbde
!	%f2  = ff000022 0000ff00, Mem[0000000010181408] = ff00ff9e 7237118d
	stda	%f2 ,[%i6+0x008]%asi	! Mem[0000000010181408] = ff000022 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = debb0022, %l4 = 00000000ff450000
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = ffffffffffffffde

p0_label_323:
	membar	#Sync			! Added by membar checker (54)
!	Mem[00000000100c1400] = ff000000 0000001e 00ff0000 ff0000ff
!	Mem[00000000100c1410] = ff0000ff ffffffd1 b2d0b9e9 ff000000
!	Mem[00000000100c1420] = 7237118d ebff0000 00000063 00ff0000
!	Mem[00000000100c1430] = 63000000 0000ff00 0063ff5b 0000ffff
	ldda	[%i3]ASI_BLK_AIUPL,%f0	! Block Load from 00000000100c1400
!	Mem[0000000030081400] = 38d11ad3 00baffff, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 0000000000baffff 0000000038d11ad3
!	Mem[0000000021800040] = ffff487b, %l6 = 0000000000baffff
	ldsb	[%o3+0x040],%l6		! %l6 = ffffffffffffffff
!	%l0 = 0000000000000022, %l5 = 000000000000ff21, %l2 = 00000000000000b1
	addc	%l0,%l5,%l2		! %l2 = 000000000000ff43
!	Mem[00000000100c1400] = ff000000 0000001e 00ff0000 ff0000ff
!	Mem[00000000100c1410] = ff0000ff ffffffd1 b2d0b9e9 ff000000
!	Mem[00000000100c1420] = 7237118d ebff0000 00000063 00ff0000
!	Mem[00000000100c1430] = 63000000 0000ff00 0063ff5b 0000ffff
	ldda	[%i3]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000030181400] = 0000001e, %f7  = e9b9d0b2
	lda	[%i6+%g0]0x89,%f7 	! %f7 = 0000001e
!	Mem[0000000010081408] = ffff0000, %f6  = 000000ff
	lda	[%i2+%o4]0x80,%f6 	! %f6 = ffff0000
!	Mem[0000000010041410] = debb00001e001ad3, %l5 = 000000000000ff21
	ldxa	[%i1+%o5]0x80,%l5	! %l5 = debb00001e001ad3
!	Mem[0000000010101400] = 00000000, %l3 = 00000000000009ff
	lduba	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (55)
!	%f11 = 63000000, Mem[00000000100c1410] = ff0000ff
	sta	%f11,[%i3+%o5]0x88	! Mem[00000000100c1410] = 63000000

p0_label_324:
!	%f16 = 1e000000 000000ff, %l0 = 0000000000000022
!	Mem[0000000030181400] = 1e00000000000000
	stda	%f16,[%i6+%l0]ASI_PST16_SL ! Mem[0000000030181400] = 1e00000000000000
!	%f22 = 000000ff e9b9d0b2, %l4 = ffffffffffffffde
!	Mem[0000000010181400] = 00ff000000000000
	stda	%f22,[%i6+%l4]ASI_PST8_P ! Mem[0000000010181400] = 000000ffe9b9d000
!	%l7 = 0000000038d11ad3, Mem[0000000021800040] = ffff487b
	sth	%l7,[%o3+0x040]		! Mem[0000000021800040] = 1ad3487b
!	%l5 = debb00001e001ad3, Mem[0000000030141400] = 000000001ce0579d
	stxa	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = debb00001e001ad3
!	Mem[0000000030181410] = 1e001ad3, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 000000d3000000ff
!	Mem[0000000010181410] = 21b10000, %l7 = 0000000038d11ad3
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 0000000021b10000
!	Mem[0000000010081404] = 00000000, %l4 = ffffffffffffffde, %asi = 80
	swapa	[%i2+0x004]%asi,%l4	! %l4 = 0000000000000000
!	%f16 = 1e000000 000000ff, Mem[0000000010001410] = 220000ff 0000ff00
	stda	%f16,[%i0+%o5]0x88	! Mem[0000000010001410] = 1e000000 000000ff
!	%l6 = ffffffff, %l7 = 21b10000, Mem[0000000010041408] = 00000000 ff450000
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffff 21b10000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 000045ff, %l0 = 0000000000000022
	ldswa	[%i4+%o4]0x80,%l0	! %l0 = 00000000000045ff

p0_label_325:
!	%f4  = d1ffffff, %f30 = ffff0000, %f30 = ffff0000 5bff6300
	fsmuld	%f4 ,%f30,%f30		! %f30 = ffffe000 00000000
!	Mem[0000000010101400] = 00000000 ffffffbf 000045ff 21ff0000
!	Mem[0000000010101410] = ffffba00 00000000 ffffffaa 00000061
!	Mem[0000000010101420] = ffff00bf 21ff4d4a 000000ff 000000c0
!	Mem[0000000010101430] = 0000d0b2 ff000000 5bff6300 0000ff0a
	ldda	[%i4]ASI_BLK_PL,%f0	! Block Load from 0000000010101400
!	Mem[0000000010081418] = 00000000, %l1 = ffffffff0000bbde
	lduwa	[%i2+0x018]%asi,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (56)
!	Mem[0000000010181400] = 000000ff e9b9d000 ff000022 0000ff00
!	Mem[0000000010181410] = d31ad138 ffffffff 38d11ad3 7a958839
!	Mem[0000000010181420] = 31f7bf47 e247debb 00000000 00000000
!	Mem[0000000010181430] = 8ec1195f 11815484 ad880a76 65450a09
	ldda	[%i6]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	Mem[000000001018141c] = 7a958839, %l2 = 000000000000ff43
	lduh	[%i6+0x01c],%l2		! %l2 = 0000000000007a95
!	Mem[0000000030001410] = 00000061 ff000000, %l4 = 00000000, %l5 = 1e001ad3
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000061 00000000ff000000
!	Mem[00000000300c1408] = 000000ff 0000ff00, %l0 = 000045ff, %l1 = 00000000
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000ff 000000000000ff00
!	Mem[0000000030101410] = debb0022, %f5  = 00baffff
	lda	[%i4+%o5]0x81,%f5 	! %f5 = debb0022
!	Mem[0000000010181410] = d31ad138, %f6  = 61000000
	lda	[%i6+%o5]0x80,%f6 	! %f6 = d31ad138
!	Starting 10 instruction Store Burst
!	%l6 = ffffffff, %l7 = 21b10000, Mem[0000000030001408] = 72370000 00000000
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff 21b10000

p0_label_326:
!	%f4  = 00000000, %f5  = debb0022, %f2  = 0000ff21
	fdivs	%f4 ,%f5 ,%f2 		! %f2  = 80000000
!	%l3 = 00000000000000d3, Mem[0000000010101410] = 0000000000baffff
	stxa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000000000d3
!	%l0 = 00000000000000ff, Mem[0000000010101408] = ff450000
	stha	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = ff4500ff
!	Mem[0000000010101408] = ff4500ff, %l6 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%l4 = 0000000000000061, Mem[0000000030181410] = 1e001aff
	stwa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000061
!	%f0  = bfffffff 00000000, %l1 = 000000000000ff00
!	Mem[0000000030041410] = 00000000ffffffff
	add	%i1,0x010,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_S ! Mem[0000000030041410] = 00000000ffffffff
!	%l0 = 00000000000000ff, Mem[0000000030141408] = 0063ffff
	stha	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 006300ff
!	%f8  = 4a4dff21 bf00ffff, %l3 = 00000000000000d3
!	Mem[0000000030141420] = 0078ff9e0000cbff
	add	%i5,0x020,%g1
	stda	%f8,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030141420] = ffff00bf21ff4d4a
!	%l2 = 00007a95, %l3 = 000000d3, Mem[00000000100c1430] = 63000000 0000ff00
	stda	%l2,[%i3+0x030]%asi	! Mem[00000000100c1430] = 00007a95 000000d3
!	Starting 10 instruction Load Burst
!	Mem[0000000010081428] = ffffffffffffffff, %l1 = 000000000000ff00
	ldx	[%i2+0x028],%l1		! %l1 = ffffffffffffffff

p0_label_327:
!	Mem[0000000010081408] = 000000000000ffff, %f4  = 00000000 debb0022
	ldda	[%i2+%o4]0x88,%f4 	! %f4  = 00000000 0000ffff
!	Mem[00000000300c1408] = 000000ff, %l6 = 00000000000000ff
	lduba	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = ffffffff, %f4  = 00000000
	lda	[%i0+%o4]0x81,%f4 	! %f4 = ffffffff
!	Mem[0000000030181408] = 000000ff, %l2 = 0000000000007a95
	ldsha	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l1 = ffffffffffffffff
	ldsha	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041400] = ff000000000000ff, %l5 = 00000000ff000000
	ldxa	[%i1+%g0]0x81,%l5	! %l5 = ff000000000000ff
!	Mem[00000000201c0000] = 00ff7d80, %l2 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = d29f75dc 8a7d4cca, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 00000000d29f75dc 000000008a7d4cca
!	Mem[0000000030181410] = 61000000, %l2 = 00000000000000ff
	lduha	[%i6+%o5]0x81,%l2	! %l2 = 0000000000006100
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 2200bbde, %l1 = 000000008a7d4cca
	swapa	[%i4+%o5]0x89,%l1	! %l1 = 000000002200bbde

p0_label_328:
!	%f14 = 0aff0000 0063ff5b, %l6 = 0000000000000000
!	Mem[0000000030081430] = 4b000000cb000000
	add	%i2,0x030,%g1
	stda	%f14,[%g1+%l6]ASI_PST8_S ! Mem[0000000030081430] = 4b000000cb000000
!	Mem[0000000030041410] = 00000000, %l4 = 0000000000000061
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l3 = 00000000000000d3, Mem[00000000300c1410] = 630000ff
	stwa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000d3
!	Mem[0000000030101400] = 4b000000, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 0000004b000000ff
!	%l3 = 00000000000000d3, Mem[0000000010041410] = d31a001e0000bbde
	stxa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000000000d3
!	Mem[0000000010041408] = ffffffff, %l3 = 00000000000000d3
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030001400] = ff000000, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	%l2 = 0000000000006100, Mem[0000000030141408] = 006300ff
	stwa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00006100
!	Mem[0000000030141408] = 00610000, %l1 = 000000002200bbde
	ldstuba	[%i5+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 000000ff, %l7 = 0000000021b10000
	ldswa	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000ff

p0_label_329:
!	Mem[0000000030001400] = 00000000, %l2 = 0000000000006100
	ldsha	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 0000ff5b, %l6 = 00000000ff000000
	ldsba	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l3 = 00000000000000ff
	lduha	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l5 = ff000000000000ff
	lduba	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = ffffffff, %l7 = 00000000000000ff
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181400] = 1e000000, %l1 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l1	! %l1 = 0000000000001e00
!	Mem[0000000010141414] = ffffffff, %l7 = ffffffffffffffff
	ldsba	[%i5+0x017]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101408] = ff0045ff, %f9  = bf00ffff
	lda	[%i4+%o4]0x80,%f9 	! %f9 = ff0045ff
!	Mem[0000000030001400] = 00000000, %l4 = 000000000000004b
	ldsba	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 000000ff, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff

p0_label_330:
!	Mem[0000000010181410] = 38d11ad3, %l5 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 000000d3000000ff
!	%f0  = bfffffff 00000000, %l4 = 0000000000000000
!	Mem[0000000010081400] = 6100b66fffffffde
	stda	%f0,[%i2+%l4]ASI_PST16_PL ! Mem[0000000010081400] = 6100b66fffffffde
!	Mem[0000000010001414] = 0000001e, %l4 = 0000000000000000, %asi = 80
	swapa	[%i0+0x014]%asi,%l4	! %l4 = 000000000000001e
	membar	#Sync			! Added by membar checker (57)
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010181410] = 38d11aff ffffffff
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff 00000000
!	%l4 = 000000000000001e, Mem[0000000010041408] = ffffffff0000b121, %asi = 80
	stxa	%l4,[%i1+0x008]%asi	! Mem[0000000010041408] = 000000000000001e
!	%f4  = ffffffff 0000ffff, %l1 = 0000000000001e00
!	Mem[0000000010001420] = 0000ffebff000121
	add	%i0,0x020,%g1
	stda	%f4,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010001420] = 0000ffebff000121
!	%f4  = ffffffff 0000ffff, %l4 = 000000000000001e
!	Mem[0000000030041428] = 23044fbf7237118d
	add	%i1,0x028,%g1
	stda	%f4,[%g1+%l4]ASI_PST8_S ! Mem[0000000030041428] = 23044fff0000ff8d
!	Mem[0000000010001410] = ff000000, %l1 = 0000000000001e00
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%l4 = 000000000000001e, Mem[0000000030181408] = ff000000
	stwa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000001e
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_28:
!	%l0 = 00000000d29f75dc
	setx	0xc59d79506c62f4d6,%g7,%l0 ! %l0 = c59d79506c62f4d6
!	%l1 = 00000000000000ff
	setx	0xa61ab82835878707,%g7,%l1 ! %l1 = a61ab82835878707
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c59d79506c62f4d6
	setx	0xe5548ca7b204cfa6,%g7,%l0 ! %l0 = e5548ca7b204cfa6
!	%l1 = a61ab82835878707
	setx	0x51c15d8838aa2746,%g7,%l1 ! %l1 = 51c15d8838aa2746

p0_label_331:
!	Mem[0000000030141408] = ff610000, %l1 = 51c15d8838aa2746
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffffff61
!	Mem[0000000010041410] = d3000000, %l2 = 00000000000000ff
	lduwa	[%i1+%o5]0x80,%l2	! %l2 = 00000000d3000000
!	Mem[0000000010101400] = 00000000ffffffbf, %l6 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l6	! %l6 = 00000000ffffffbf
!	Mem[0000000010181410] = 000000ff, %l6 = 00000000ffffffbf
	lduba	[%i6+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%l4 = 000000000000001e, imm = 00000000000000af, %l6 = 00000000000000ff
	subc	%l4,0x0af,%l6		! %l6 = ffffffffffffff6f
!	Mem[0000000030001408] = ffffffff 0000b121, %l6 = ffffff6f, %l7 = ffffffff
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffffffff 000000000000b121
!	Mem[0000000010001400] = 00ba00ff, %l5 = 00000000000000d3
	ldsha	[%i0+%g0]0x80,%l5	! %l5 = 00000000000000ba
!	Code Fragment 3
p0_fragment_29:
!	%l0 = e5548ca7b204cfa6
	setx	0x435256406245f2e3,%g7,%l0 ! %l0 = 435256406245f2e3
!	%l1 = ffffffffffffff61
	setx	0x7db301c00d8e2e0e,%g7,%l1 ! %l1 = 7db301c00d8e2e0e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 435256406245f2e3
	setx	0xb4e1edb7920a6f85,%g7,%l0 ! %l0 = b4e1edb7920a6f85
!	%l1 = 7db301c00d8e2e0e
	setx	0x329d7097fbcc9456,%g7,%l1 ! %l1 = 329d7097fbcc9456
!	Mem[0000000010181400] = 00d0b9e9ff000000, %f0  = bfffffff 00000000
	ldda	[%i6+%g0]0x88,%f0 	! %f0  = 00d0b9e9 ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 7237118d, %l0 = b4e1edb7920a6f85
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 000000007237118d

p0_label_332:
!	Mem[0000000030041408] = 000045ff, %l5 = 00000000000000ba
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l4 = 000000000000001e, Mem[0000000030001410] = 61000000
	stha	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 6100001e
!	Mem[0000000030101408] = 00000000, %l7 = 000000000000b121
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = 0000ff00, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 000000000000ff00
!	%l3 = 000000000000ff00, Mem[0000000030081400] = 00baffff
	stba	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 00baff00
!	%l0 = 000000007237118d, Mem[0000000010141400] = 00ba00ff, %asi = 80
	stwa	%l0,[%i5+0x000]%asi	! Mem[0000000010141400] = 7237118d
!	Mem[0000000030081400] = 00baff00, %l5 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 0000000000baff00
!	%l1 = 329d7097fbcc9456, immd = fffffffffffff0cd, %l1 = 329d7097fbcc9456
	sdivx	%l1,-0xf33,%l1		! %l1 = fffcab7e37a96e09
!	Mem[00000000100c1417] = ffffffd1, %l4 = 000000000000001e
	ldstub	[%i3+0x017],%l4		! %l4 = 000000d1000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 000000ff, %l0 = 000000007237118d
	ldsha	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_333:
!	Mem[0000000030081410] = ff000000, %l2 = 00000000d3000000
	ldsba	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l3 = 000000000000ff00
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010141410] = ffffffff, %l6 = 00000000ffffffff
	ldsba	[%i5+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181410] = ff000000, %l2 = 0000000000000000
	lduwa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030141400] = debb0000 1e001ad3, %l2 = ff000000, %l3 = ff000000
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 000000001e001ad3 00000000debb0000
!	Mem[0000000030001400] = 00000000 00000000, %l0 = 00000000, %l1 = 37a96e09
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000030141400] = d31a001e, %l7 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l7	! %l7 = 000000000000d31a
!	Mem[0000000030081408] = 0000000027000000, %l0 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l0	! %l0 = 0000000027000000
!	Mem[0000000030041400] = ff000000000000ff, %f22 = 3988957a d31ad138
	ldda	[%i1+%g0]0x89,%f22	! %f22 = ff000000 000000ff
!	Starting 10 instruction Store Burst
!	%f10 = c0000000 ff000000, Mem[0000000010181410] = ff000000 00000000
	stda	%f10,[%i6+%o5]0x80	! Mem[0000000010181410] = c0000000 ff000000

p0_label_334:
!	%f14 = 0aff0000 0063ff5b, Mem[0000000010181410] = 000000c0 000000ff
	stda	%f14,[%i6+%o5]0x88	! Mem[0000000010181410] = 0aff0000 0063ff5b
!	%l7 = 000000000000d31a, Mem[0000000010081410] = 5bff0000
	stba	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 5bff001a
!	%l2 = 000000001e001ad3, Mem[0000000010081408] = 0000ffff
	stha	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00001ad3
!	Mem[0000000010101410] = d3000000, %l3 = 00000000debb0000
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 00000000d3000000
!	Mem[0000000010081408] = 00001ad3, %l0 = 0000000027000000
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 000000d3000000ff
!	%l0 = 00000000000000d3, Mem[0000000030101410] = 8a7d4cca
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000d3
!	Mem[0000000010001408] = 00000000, %l0 = 00000000000000d3
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 6fb60061, %l7 = 000000000000d31a
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 000000006fb60061
!	%l3 = 00000000d3000000, Mem[0000000010101400] = 00000000
	stha	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 0000ff00, %l6 = ffffffffffffffff
	ldsha	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffff00

p0_label_335:
!	Mem[0000000010041400] = 0000004b, %l5 = 0000000000baff00
	ldswa	[%i1+%g0]0x88,%l5	! %l5 = 000000000000004b
!	Mem[00000000218001c0] = 27007b35, %l0 = 0000000000000000
	ldsba	[%o3+0x1c1]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l3 = 00000000d3000000
	lduba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = 000000ff, %l4 = 00000000000000d1
	ldsha	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041408] = 00000000, %f11 = ff000000
	lda	[%i1+%o4]0x88,%f11	! %f11 = 00000000
!	Mem[00000000201c0000] = 00ff7d80, %l2 = 000000001e001ad3
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 1e000000, %l1 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l1	! %l1 = 0000000000001e00
!	%l7 = 000000006fb60061, imm = fffffffffffff2be, %l0 = 0000000000000000
	addc	%l7,-0xd42,%l0		! %l0 = 000000006fb5f31f
!	Starting 10 instruction Store Burst
!	Mem[0000000010081434] = 00000000, %l3 = 0000000000000000, %asi = 80
	swapa	[%i2+0x034]%asi,%l3	! %l3 = 0000000000000000

p0_label_336:
!	Mem[0000000030101400] = ff000000, %l4 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	%l4 = ff000000, %l5 = 0000004b, Mem[0000000010001408] = d3000000 00000000
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000 0000004b
!	%f4  = ffffffff 0000ffff, Mem[0000000010141410] = ffffffff ffffffff
	stda	%f4 ,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff 0000ffff
!	Mem[0000000010101408] = ff0045ff, %l4 = 00000000ff000000
	ldstuba	[%i4+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000030101408] = ff000000
	stwa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	%l7 = 000000006fb60061, Mem[0000000010141410] = ffffffff
	stwa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 6fb60061
!	%f18 = 00ff0000 220000ff, %l6 = ffffffffffffff00
!	Mem[0000000030101418] = 3988957ad31ad138
	add	%i4,0x018,%g1
	stda	%f18,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030101418] = 3988957ad31ad138
!	%l1 = 0000000000001e00, Mem[00000000100c1400] = 00000000
	stwa	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00001e00
!	Mem[0000000010041438] = 001e0000, %l1 = 00001e00, %l6 = ffffff00
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 00000000001e0000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff000000, %l2 = 00000000000000ff
	ldswa	[%i3+%o4]0x89,%l2	! %l2 = ffffffffff000000

p0_label_337:
!	Mem[000000001004140c] = 0000001e, %l0 = 000000006fb5f31f
	ldsw	[%i1+0x00c],%l0		! %l0 = 000000000000001e
!	Mem[00000000100c1410] = 00000063, %l0 = 000000000000001e
	ldsba	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001014140c] = 0063ff5b, %l2 = ffffffffff000000
	ldsw	[%i5+0x00c],%l2		! %l2 = 000000000063ff5b
!	Mem[0000000030181410] = d31a001e00000061, %l5 = 000000000000004b
	ldxa	[%i6+%o5]0x89,%l5	! %l5 = d31a001e00000061
!	Mem[0000000010141410] = 6fb60061, %l6 = 00000000001e0000
	lduba	[%i5+%o5]0x80,%l6	! %l6 = 000000000000006f
!	Mem[00000000300c1400] = 1e000000, %l2 = 000000000063ff5b
	lduba	[%i3+%g0]0x81,%l2	! %l2 = 000000000000001e
!	Mem[0000000010081408] = ff1a0000, %l4 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141418] = 000060f3e3ff0641, %f28 = 84548111 5f19c18e
	ldda	[%i5+0x018]%asi,%f28	! %f28 = 000060f3 e3ff0641
!	Mem[00000000218000c0] = e900f956, %l7 = 000000006fb60061
	ldsb	[%o3+0x0c1],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041424] = ffff0000, %l5 = d31a001e00000061
	swap	[%i1+0x024],%l5		! %l5 = 00000000ffff0000

p0_label_338:
!	Mem[0000000010101410] = 0000bbde, %l1 = 0000000000001e00
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 000000de000000ff
!	%f21 = 38d11ad3, Mem[0000000030101410] = d3000000
	sta	%f21,[%i4+%o5]0x81	! Mem[0000000030101410] = 38d11ad3
!	%f24 = bbde47e2 47bff731, Mem[0000000030081408] = 00000000 27000000
	stda	%f24,[%i2+%o4]0x81	! Mem[0000000030081408] = bbde47e2 47bff731
!	%l2 = 000000000000001e, Mem[00000000100c1400] = 001e0000
	stw	%l2,[%i3+%g0]		! Mem[00000000100c1400] = 0000001e
!	Mem[0000000010101410] = ffbb000000000000, %l3 = 0000000000000000, %l1 = 00000000000000de
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = ffbb000000000000
!	Mem[0000000010041418] = 39887d8a, %l7 = 00000000, %l4 = ffffffff
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 0000000039887d8a
!	%l7 = 0000000000000000, Mem[0000000020800000] = 09ff16cb
	sth	%l7,[%o1+%g0]		! Mem[0000000020800000] = 000016cb
!	Mem[00000000100c1410] = 63000000, %l0 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l2 = 000000000000001e, imm = fffffffffffff098, %l6 = 000000000000006f
	add	%l2,-0xf68,%l6		! %l6 = fffffffffffff0b6
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 0000000000000000, %f16 = 00d0b9e9 ff000000
	ldda	[%i0+%g0]0x81,%f16	! %f16 = 00000000 00000000

p0_label_339:
!	Mem[0000000010101408] = 0000ff21ff4500ff, %l3 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l3	! %l3 = 0000ff21ff4500ff
!	Mem[0000000030041408] = ff4500000000ff21, %l2 = 000000000000001e
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = ff4500000000ff21
!	Mem[00000000100c1434] = 000000d3, %l1 = ffbb000000000000
	lduha	[%i3+0x036]%asi,%l1	! %l1 = 00000000000000d3
!	Mem[00000000201c0000] = 00ff7d80, %l5 = 00000000ffff0000
	lduh	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[00000000300c1400] = 000000000000001e, %f14 = 0aff0000 0063ff5b
	ldda	[%i3+%g0]0x89,%f14	! %f14 = 00000000 0000001e
!	Mem[0000000030181410] = 00000061, %l5 = 00000000000000ff
	lduwa	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000061
!	Mem[0000000030081410] = ff000000, %l4 = 0000000039887d8a
	ldsha	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[000000001014141c] = e3ff0641, %l3 = 0000ff21ff4500ff
	lduha	[%i5+0x01c]%asi,%l3	! %l3 = 000000000000e3ff
!	Mem[0000000010101400] = 00000000, %l2 = ff4500000000ff21
	ldsha	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 1e000000, %l5 = 0000000000000061
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_340:
!	%l2 = 0000000000000000, Mem[00000000211c0001] = ff217f1a, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff007f1a
!	%l1 = 00000000000000d3, Mem[0000000030101410] = 38d11ad3
	stba	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = d3d11ad3
!	Mem[0000000010001408] = ff000000, %l4 = 0000000000000000
	swap	[%i0+%o4],%l4		! %l4 = 00000000ff000000
!	%l0 = 00000000, %l1 = 000000d3, Mem[0000000010101420] = ffff00bf 21ff4d4a
	std	%l0,[%i4+0x020]		! Mem[0000000010101420] = 00000000 000000d3
!	%l7 = 0000000000000000, Mem[00000000211c0000] = ff007f1a
	stb	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 00007f1a
!	Mem[0000000010101438] = 5bff6300, %l6 = fffffffffffff0b6
	swap	[%i4+0x038],%l6		! %l6 = 000000005bff6300
!	%l6 = 000000005bff6300, Mem[0000000010081400] = 0000d31a
	stha	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00006300
!	%l6 = 000000005bff6300, Mem[0000000030081410] = 000000ff
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 630000ff
!	%l0 = 0000000000000000, Mem[0000000010141400] = 8d113772
	stwa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff000063ffffffff, %f30 = 090a4565 760a88ad
	ldda	[%i3+%o5]0x80,%f30	! %f30 = ff000063 ffffffff

p0_label_341:
!	Mem[00000000100c1400] = 1e000000, %l7 = 0000000000000000
	lduha	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 00d0b9e90000ff00, %f30 = ff000063 ffffffff
	ldda	[%i6+%g0]0x88,%f30	! %f30 = 00d0b9e9 0000ff00
!	Mem[0000000030181400] = 1e000000, %l6 = 000000005bff6300
	lduha	[%i6+%g0]0x81,%l6	! %l6 = 0000000000001e00
!	Mem[00000000211c0000] = 00007f1a, %l5 = 0000000000000000
	lduh	[%o2+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010001410] = ff000000 00000000, %l4 = ff000000, %l5 = 00000000
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[00000000100c1408] = 0000ff00, %l6 = 0000000000001e00
	lduba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[000000001018143c] = 65450a09, %f10 = c0000000
	lda	[%i6+0x03c]%asi,%f10	! %f10 = 65450a09
!	Mem[0000000010081408] = ff1a0000, %l1 = 00000000000000d3
	ldswa	[%i2+%o4]0x80,%l1	! %l1 = ffffffffff1a0000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ff000000, Mem[0000000010001408] = 00000000
	stwa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000

p0_label_342:
!	%l2 = 0000000000000000, Mem[0000000010141410] = ffff00006100b66f
	stxa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	Mem[00000000218000c1] = e900f956, %l2 = 0000000000000000
	ldstuba	[%o3+0x0c1]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081410] = 630000ff, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 00000063000000ff
!	Mem[0000000010081408] = 00001aff, %l3 = 000000000000e3ff
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 00000063, Mem[0000000030081410] = ff0000ff ff000000
	stda	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 00000063
!	Mem[0000000010181410] = 5bff6300, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 0000005b000000ff
!	%f26 = 00000000 00000000, Mem[0000000010041410] = 000000d3 00000000
	stda	%f26,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 00000000
!	%f22 = ff000000 000000ff, Mem[0000000010001428] = 4f4665c0 63000000
	stda	%f22,[%i0+0x028]%asi	! Mem[0000000010001428] = ff000000 000000ff
!	Mem[0000000010081410] = 5bff001a, %l3 = 00000000000000ff
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 0000001a000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 21ff0000000045ff, %l6 = 000000000000005b
	ldxa	[%i1+%o4]0x89,%l6	! %l6 = 21ff0000000045ff

p0_label_343:
!	%l4 = 00000000ff000000, imm = 0000000000000162, %l2 = 0000000000000000
	andn	%l4,0x162,%l2		! %l2 = 00000000ff000000
!	Mem[0000000010181428] = 0000000000000000, %f14 = 00000000 0000001e
	ldd	[%i6+0x028],%f14	! %f14 = 00000000 00000000
!	Mem[0000000030041410] = 61000000ffffffff, %f28 = 000060f3 e3ff0641
	ldda	[%i1+%o5]0x81,%f28	! %f28 = 61000000 ffffffff
!	Mem[0000000010081410] = 5bff00ff, %l4 = 00000000ff000000
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = ff000000, %l0 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030101400] = ff000000, %l7 = 0000000000000063
	lduha	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = 00007f1a, %l6 = 21ff0000000045ff
	ldsba	[%o2+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l5 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = ff0045ff, %f25 = 47bff731
	lda	[%i4+%o4]0x80,%f25	! %f25 = ff0045ff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000100c1400] = 1e000000
	stba	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 1e000000

p0_label_344:
!	%l1 = ffffffffff1a0000, Mem[0000000010001431] = 00000000, %asi = 80
	stba	%l1,[%i0+0x031]%asi	! Mem[0000000010001430] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030101408] = 000000ff
	stha	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	%f5  = 0000ffff, %f7  = aaffffff, %f28 = 61000000
	fmuls	%f5 ,%f7 ,%f28		! %f28 = 80000000
!	%f2  = 80000000 ff450000, Mem[0000000010081408] = 00001aff 00000000
	stda	%f2 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 80000000 ff450000
!	Mem[0000000010001410] = ff000000, %l4 = 00000000000000ff
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	%l1 = ffffffffff1a0000, Mem[00000000201c0000] = 00ff7d80
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 00007d80
!	Mem[0000000030101408] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f30 = 00d0b9e9, Mem[0000000010101408] = ff0045ff
	sta	%f30,[%i4+%o4]0x80	! Mem[0000000010101408] = 00d0b9e9
!	%l4 = 00000000ff000000, Mem[0000000010081408] = 80000000ff450000
	stxa	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000 0000bbff, %l2 = ff000000, %l3 = 0000001a
	ldda	[%i4+%o5]0x88,%l2	! %l2 = 000000000000bbff 0000000000000000

p0_label_345:
!	Mem[00000000100c1438] = 0063ff5b, %l0 = 00000000ff000000
	ldsb	[%i3+0x038],%l0		! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 00007d80, %l2 = 000000000000bbff
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = ff0000ff, %l7 = 0000000000000000
	ldswa	[%i4+%o4]0x89,%l7	! %l7 = ffffffffff0000ff
!	Mem[00000000100c1410] = ff000063ffffffff, %f24 = bbde47e2 ff0045ff
	ldda	[%i3+%o5]0x80,%f24	! %f24 = ff000063 ffffffff
!	%l5 = 0000000000000000, %l6 = 0000000000000000, %l5 = 0000000000000000
	xnor	%l5,%l6,%l5		! %l5 = ffffffffffffffff
!	Mem[00000000300c1410] = ffff0000000000d3, %f20 = ffffffff 38d11ad3
	ldda	[%i3+%o5]0x89,%f20	! %f20 = ffff0000 000000d3
!	Mem[0000000030041408] = 000045ff, %f6  = d31ad138
	lda	[%i1+%o4]0x89,%f6 	! %f6 = 000045ff
!	Mem[0000000010081408] = 000000ff, %f30 = 00d0b9e9
	ld	[%i2+%o4],%f30	! %f30 = 000000ff
!	Mem[0000000030101410] = d3d11ad3, %f11 = 00000000
	lda	[%i4+%o5]0x81,%f11	! %f11 = d3d11ad3
!	Starting 10 instruction Store Burst
!	%f20 = ffff0000 000000d3, Mem[0000000030181400] = 0000001e 00000000
	stda	%f20,[%i6+%g0]0x89	! Mem[0000000030181400] = ffff0000 000000d3

p0_label_346:
!	%l0 = 00000000, %l1 = ff1a0000, Mem[00000000100c1410] = ff000063 ffffffff
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 ff1a0000
!	%l7 = ffffffffff0000ff, %l7 = ffffffffff0000ff, %y  = 000000a0
	sdiv	%l7,%l7,%l1		! %l1 = ffffffffffff5f01
	mov	%l0,%y			! %y = 00000000
!	Mem[00000000300c1400] = 1e000000, %l0 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 000000001e000000
!	Mem[0000000010141400] = 00000000, %l5 = ffffffffffffffff
	swapa	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%l0 = 000000001e000000, Mem[0000000010081400] = deffffff00006300
	stxa	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000001e000000
!	Mem[0000000010141408] = 920a6f85, %l3 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 00000092000000ff
!	Mem[000000001014142a] = 84548111, %l4 = 00000000ff000000
	ldstub	[%i5+0x02a],%l4		! %l4 = 00000081000000ff
!	%l4 = 0000000000000081, Mem[0000000010101408] = 00d0b9e9
	stha	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 0081b9e9
!	%l0 = 000000001e000000, %l5 = 0000000000000000, %l7 = ffffffffff0000ff
	and	%l0,%l5,%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 84548111, %l6 = 0000000000000000
	ldsba	[%i1+0x030]%asi,%l6	! %l6 = ffffffffffffff84

p0_label_347:
!	Mem[0000000030041400] = ff000000, %l6 = ffffffffffffff84
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030001400] = 00000000, %l6 = ffffffffff000000
	lduwa	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = 0aff0000 0063ffff, %l2 = 00000000, %l3 = 00000092
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 000000000063ffff 000000000aff0000
!	Mem[00000000300c1408] = 000000ff, %l0 = 000000001e000000
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = ff00ff5b, %l7 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l7	! %l7 = 00000000ff00ff5b
!	Mem[0000000010081410] = ff00ff5b, %l4 = 0000000000000081
	ldswa	[%i2+%o5]0x80,%l4	! %l4 = ffffffffff00ff5b
!	Mem[000000001010141c] = 00000061, %l4 = ffffffffff00ff5b
	ldsb	[%i4+0x01f],%l4		! %l4 = 0000000000000061
	membar	#Sync			! Added by membar checker (58)
!	Mem[0000000010081400] = 0000001e 00000000 000000ff 00000000
!	Mem[0000000010081410] = ff00ff5b 000045ff 00000000 20000000
!	Mem[0000000010081420] = 4cf6ab34 fffffe93 ffffffff ffffffff
!	Mem[0000000010081430] = 00000000 00000000 ff1eb9ff b600ffff
	ldda	[%i2]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Mem[0000000030181408] = 1e0000ff, %l4 = 0000000000000061
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = 000000001e0000ff
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffff5f01, Mem[0000000010001408] = ff000000
	stba	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 01000000

p0_label_348:
!	%l2 = 000000000063ffff, Mem[00000000100c1400] = 1e000000
	stha	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 1e00ffff
!	Mem[0000000010041409] = 00000000, %l1 = ffffffffffff5f01
	ldstub	[%i1+0x009],%l1		! %l1 = 00000000000000ff
!	%l6 = 00000000, %l7 = ff00ff5b, Mem[0000000010181410] = ffff6300 0000ff0a
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 ff00ff5b
!	%l3 = 000000000aff0000, Mem[0000000030081410] = 00000000
	stha	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
	membar	#Sync			! Added by membar checker (59)
!	%l7 = 00000000ff00ff5b, Mem[0000000010081410] = ff4500005bff00ff
	stxa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000ff00ff5b
!	%l7 = 00000000ff00ff5b, Mem[0000000030141410] = dc759fd2
	stba	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = dc759f5b
!	%l1 = 0000000000000000, Mem[0000000030101400] = 000000ff
	stba	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	%f7  = aaffffff, Mem[0000000010081408] = ff000000
	sta	%f7 ,[%i2+%o4]0x88	! Mem[0000000010081408] = aaffffff
!	%l1 = 0000000000000000, %l5 = 0000000000000000, %l6 = 0000000000000000
	add	%l1,%l5,%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00001aff00000000, %l4 = 000000001e0000ff
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = 00001aff00000000

p0_label_349:
!	%l7 = 00000000ff00ff5b, %l1 = 0000000000000000, %l0 = 0000000000000000
	xnor	%l7,%l1,%l0		! %l0 = ffffffff00ff00a4
!	%l6 = 0000000000000000, %l0 = ffffffff00ff00a4, %l3 = 000000000aff0000
	or	%l6,%l0,%l3		! %l3 = ffffffff00ff00a4
!	Mem[0000000030041400] = 000000ff, %l2 = 000000000063ffff
	ldswa	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = 00d0b9e90000ff00, %l5 = 0000000000000000
	ldxa	[%i6+%g0]0x88,%l5	! %l5 = 00d0b9e90000ff00
!	Mem[0000000030001410] = 000000ff6100001e, %l7 = 00000000ff00ff5b
	ldxa	[%i0+%o5]0x89,%l7	! %l7 = 000000ff6100001e
!	Mem[0000000030001410] = 000000ff6100001e, %l0 = ffffffff00ff00a4
	ldxa	[%i0+%o5]0x89,%l0	! %l0 = 000000ff6100001e
!	Mem[0000000030181410] = 61000000, %f8  = 4a4dff21
	lda	[%i6+%o5]0x81,%f8 	! %f8 = 61000000
!	Mem[0000000010081410] = 5bff00ff00000000, %f14 = 00000000 00000000
	ldda	[%i2+%o5]0x80,%f14	! %f14 = 5bff00ff 00000000
	membar	#Sync			! Added by membar checker (60)
!	Mem[0000000030101400] = 000000ff cb000000 ff0000ff 000000ff
!	Mem[0000000030101410] = d3d11ad3 e247debb 3988957a d31ad138
!	Mem[0000000030101420] = bbde47e2 ffff0000 ca4c7d8a 00000000
!	Mem[0000000030101430] = 84548111 5f19c18e 001e0000 000000ff
	ldda	[%i4]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030101400
!	Starting 10 instruction Store Burst
!	Mem[0000000010081418] = 00000000 20000000, %l6 = 00000000, %l7 = 6100001e
	ldd	[%i2+0x018],%l6		! %l6 = 0000000000000000 0000000020000000

p0_label_350:
!	Mem[00000000300c1408] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l5 = 00d0b9e90000ff00, Mem[0000000030001410] = 1e000061ff000000
	stxa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00d0b9e90000ff00
!	%l4 = 00001aff00000000, Mem[0000000021800041] = 1ad3487b
	stb	%l4,[%o3+0x041]		! Mem[0000000021800040] = 1a00487b
!	Mem[0000000030081408] = bbde47e2, %l5 = 00d0b9e90000ff00
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 000000bb000000ff
!	%l4 = 00001aff00000000, Mem[00000000300c1410] = d3000000
	stwa	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010001410] = 000000ff, %l4 = 00001aff00000000
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l4 = 000000ff, %l5 = 000000bb, Mem[0000000010081410] = 5bff00ff 00000000
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff 000000bb
!	%f16 = 00000000, Mem[00000000100c1408] = 00ff0000
	sta	%f16,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l0 = 000000ff6100001e, Mem[0000000030181410] = 00000061
	stha	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000001e
!	Starting 10 instruction Load Burst
!	Mem[00000000100c141c] = ff000000, %l3 = ffffffff00ff00a4
	lduwa	[%i3+0x01c]%asi,%l3	! %l3 = 00000000ff000000

p0_label_351:
!	Mem[0000000010001410] = 00000000 00000000, %l0 = 6100001e, %l1 = 00000000
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010001400] = ff00ba00, %l0 = 0000000000000000
	lduba	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l3 = 00000000ff000000, imm = 000000000000080d, %l5 = 00000000000000bb
	xor	%l3,0x80d,%l5		! %l5 = 00000000ff00080d
!	Mem[0000000021800000] = 1ec0ba26, %l0 = 0000000000000000
	ldsb	[%o3+0x001],%l0		! %l0 = ffffffffffffffc0
!	Mem[0000000010041408] = 00ff00000000001e, %l1 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l1	! %l1 = 00ff00000000001e
!	Mem[0000000030141400] = d31a001e, %l3 = 00000000ff000000
	lduha	[%i5+%g0]0x81,%l3	! %l3 = 000000000000d31a
!	Mem[0000000020800000] = 000016cb, %l6 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l3 = 000000000000d31a
	lduha	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 00007f1a, %l0 = ffffffffffffffc0
	ldsh	[%o2+%g0],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f26 = ffffffff, Mem[0000000030141410] = dc759f5b
	sta	%f26,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff

p0_label_352:
!	%l3 = 0000000000000000, Mem[0000000030001410] = 00d0b9e9
	stba	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00d0b9e9
!	Mem[0000000010141434] = 11815484, %l3 = 00000000, %l6 = 00000000
	add	%i5,0x34,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 0000000011815484
!	%l2 = 00000000000000ff, Mem[0000000030081400] = ff000000d31ad138
	stxa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000000000ff
!	Mem[0000000030081410] = 00000000, %l0 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000020000000
	swap	[%i3+%o5],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101408] = 0081b9e9, %l1 = 00ff00000000001e
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l6 = 0000000011815484, Mem[0000000030141410] = ffffffff8a7d4cca
	stxa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000011815484
!	%l3 = 0000000000000000, Mem[0000000030001400] = 0000000000000000
	stxa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	Mem[0000000010141408] = 856f0aff, %l6 = 0000000011815484
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 00000000856f0aff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 1e000000, %l7 = 0000000000000000
	ldswa	[%i2+%g0]0x88,%l7	! %l7 = 000000001e000000

p0_label_353:
!	Mem[00000000100c1408] = 00000000 ff0000ff, %l4 = 000000ff, %l5 = ff00080d
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000 00000000ff0000ff
!	Mem[0000000010101408] = ff81b9e9, %l1 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l1	! %l1 = ffffffffffffff81
!	Mem[0000000010081438] = ff1eb9ff, %l0 = 0000000000000000
	ldsb	[%i2+0x03a],%l0		! %l0 = ffffffffffffffb9
!	Mem[0000000010081408] = ffffffaa00000000, %f26 = ffffffff ffffffff
	ldda	[%i2+%o4]0x80,%f26	! %f26 = ffffffaa 00000000
!	Mem[0000000021800140] = 00ff02f2, %l1 = ffffffffffffff81
	lduh	[%o3+0x140],%l1		! %l1 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = 00d0b9e9, %l7 = 000000001e000000
	lduwa	[%i0+%o5]0x81,%l7	! %l7 = 0000000000d0b9e9
!	Mem[0000000010081410] = ff000000, %l2 = 00000000000000ff
	lduwa	[%i2+%o5]0x88,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030081408] = ffde47e2, %f9  = e247debb
	lda	[%i2+%o4]0x81,%f9 	! %f9 = ffde47e2
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000010101400] = 00000000
	stha	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff

p0_label_354:
!	Mem[0000000010081420] = 4cf6ab34fffffe93, %l3 = 0000000000000000, %l6 = 00000000856f0aff
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = 4cf6ab34fffffe93
!	%l0 = ffffffffffffffb9, %l6 = 4cf6ab34fffffe93, %l0 = ffffffffffffffb9
	subc	%l0,%l6,%l0		! %l0 = b30954cb00000126
!	%f13 = 11815484, Mem[0000000010141400] = ffffffff
	sta	%f13,[%i5+%g0]0x88	! Mem[0000000010141400] = 11815484
!	%l0 = b30954cb00000126, Mem[0000000010141410] = 0000000000000000
	stxa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = b30954cb00000126
!	Mem[00000000201c0000] = 00007d80, %l1 = 00000000000000ff
	ldstub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010101400] = 000000ff
	stba	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	Mem[0000000010181410] = 00000000, %l6 = 4cf6ab34fffffe93
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%f24 = 93feffff, Mem[0000000030081408] = ffde47e2
	sta	%f24,[%i2+%o4]0x81	! Mem[0000000030081408] = 93feffff
!	%l4 = 0000000000000000, Mem[00000000201c0000] = ff007d80
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 00007d80
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 20000000 ff1a0000, %l0 = 00000126, %l1 = 00000000
	ldda	[%i3+%o5]0x80,%l0	! %l0 = 0000000020000000 00000000ff1a0000

p0_label_355:
!	Mem[0000000010101400] = 00000000ffffffbf, %f0  = 000000cb ff000000
	ldda	[%i4+%g0]0x80,%f0 	! %f0  = 00000000 ffffffbf
!	Mem[00000000300c1408] = ff0000ff, %l5 = 00000000ff0000ff
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000010101424] = 000000d3, %l0 = 0000000020000000
	lduwa	[%i4+0x024]%asi,%l0	! %l0 = 00000000000000d3
!	Mem[00000000100c1410] = 20000000ff1a0000, %l7 = 0000000000d0b9e9
	ldxa	[%i3+%o5]0x80,%l7	! %l7 = 20000000ff1a0000
!	Mem[0000000020800040] = 00632c25, %l7 = 20000000ff1a0000
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = 0000000000000063
!	Mem[0000000010141408] = 84548111 0063ff5b, %l4 = 00000000, %l5 = ff0000ff
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 0000000084548111 000000000063ff5b
!	Mem[0000000010001424] = ff000121, %l5 = 000000000063ff5b
	ldsw	[%i0+0x024],%l5		! %l5 = ffffffffff000121
!	Mem[0000000010081434] = 00000000, %l1 = 00000000ff1a0000
	lduba	[%i2+0x035]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = ff450000, %f21 = 5bff00ff
	lda	[%i1+%o4]0x81,%f21	! %f21 = ff450000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = ff00ba00, %l2 = 00000000ff000000
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 00000000ff00ba00

p0_label_356:
!	%f8  = 0000ffff ffde47e2, %l6 = 0000000000000000
!	Mem[0000000010101400] = 00000000ffffffbf
	stda	%f8,[%i4+%l6]ASI_PST8_PL ! Mem[0000000010101400] = 00000000ffffffbf
!	%l3 = 0000000000000000, Mem[0000000010141410] = 26010000
	stwa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%f4  = bbde47e2, Mem[0000000030181400] = 000000d3
	sta	%f4 ,[%i6+%g0]0x89	! Mem[0000000030181400] = bbde47e2
!	%f0  = 00000000 ffffffbf, %l0 = 00000000000000d3
!	Mem[0000000010101428] = 000000ff000000c0
	add	%i4,0x028,%g1
	stda	%f0,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010101428] = bfff00ff00000000
!	%l7 = 0000000000000063, Mem[0000000010141408] = 5bff630011815484
	stxa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000063
!	Mem[0000000030181400] = e247debb, %l6 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 000000e2000000ff
!	%l4 = 84548111, %l5 = ff000121, Mem[0000000010001410] = 00000000 00000000
	std	%l4,[%i0+%o5]		! Mem[0000000010001410] = 84548111 ff000121
!	%l0 = 00000000000000d3, immd = fffffffffffff991, %l7 = 0000000000000063
	udivx	%l0,-0x66f,%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000084548111
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000000000ff, %l2 = 00000000ff00ba00
	ldxa	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff

p0_label_357:
!	Mem[0000000030081410] = 00000000, %l7 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 000000ff cb000000, %l4 = 00000000, %l5 = ff000121
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff 00000000cb000000
!	Mem[000000001014143c] = 30b4aa5a, %l0 = 00000000000000d3
	lduh	[%i5+0x03c],%l0		! %l0 = 00000000000030b4
!	Mem[000000001008143c] = b600ffff, %l0 = 00000000000030b4
	lduwa	[%i2+0x03c]%asi,%l0	! %l0 = 00000000b600ffff
!	Mem[0000000010141400] = 11815484, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l7	! %l7 = 0000000011815484
!	Mem[0000000010041408] = 1e0000000000ff00, %f30 = ffff00b6 ffb91eff
	ldda	[%i1+%o4]0x88,%f30	! %f30 = 1e000000 0000ff00
!	Mem[0000000030181410] = 0000001e, %l5 = 00000000cb000000
	ldsha	[%i6+%o5]0x89,%l5	! %l5 = 000000000000001e
!	Mem[0000000010181408] = ff000022 0000ff00, %l4 = 000000ff, %l5 = 0000001e
	ldd	[%i6+%o4],%l4		! %l4 = 00000000ff000022 000000000000ff00
!	Mem[0000000030141410] = 84548111 00000000, %l0 = b600ffff, %l1 = 00000000
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000 0000000084548111
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 84548111, %l7 = 0000000011815484
	swapa	[%i5+%g0]0x80,%l7	! %l7 = 0000000084548111

p0_label_358:
!	Mem[00000000300c1400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%f30 = 1e000000 0000ff00, Mem[0000000010081410] = 000000ff 000000bb
	stda	%f30,[%i2+%o5]0x80	! Mem[0000000010081410] = 1e000000 0000ff00
!	%l6 = 000000e2, %l7 = 84548111, Mem[0000000030181408] = ff00001e 000045ff
	stda	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000e2 84548111
!	Mem[0000000010101408] = ff81b9e9, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Code Fragment 4
p0_fragment_30:
!	%l0 = 00000000000000ff
	setx	0x127b7ce0558ad09f,%g7,%l0 ! %l0 = 127b7ce0558ad09f
!	%l1 = 0000000084548111
	setx	0x1a39c997acda2f95,%g7,%l1 ! %l1 = 1a39c997acda2f95
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 127b7ce0558ad09f
	setx	0x6fc6a31f8f29e9d2,%g7,%l0 ! %l0 = 6fc6a31f8f29e9d2
!	%l1 = 1a39c997acda2f95
	setx	0x6f1628001e6fe8c1,%g7,%l1 ! %l1 = 6f1628001e6fe8c1
!	Mem[0000000010081410] = 1e000000, %l1 = 6f1628001e6fe8c1
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 000000001e000000
!	Mem[0000000010001408] = 010000000000004b, %l3 = 0000000000000000, %l3 = 0000000000000000
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = 010000000000004b
!	%f18 = 00000000 ff000000, Mem[00000000300c1400] = ff000000 00000000
	stda	%f18,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 ff000000
!	%l1 = 000000001e000000, Mem[000000001010142f] = 00000000
	stb	%l1,[%i4+0x02f]		! Mem[000000001010142c] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = aaffffff, %l3 = 010000000000004b
	ldsba	[%i2+%o4]0x88,%l3	! %l3 = ffffffffffffffff

p0_label_359:
!	Mem[0000000030141408] = 7237118d 000061ff, %l0 = 8f29e9d2, %l1 = 1e000000
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 00000000000061ff 000000007237118d
!	Mem[0000000030141410] = 00000000, %l5 = 000000000000ff00
	lduba	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 000000ffcb000000, %l0 = 00000000000061ff
	ldxa	[%i4+%g0]0x81,%l0	! %l0 = 000000ffcb000000
!	Mem[0000000010141408] = 00000063, %l6 = 00000000000000e2
	ldswa	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000063
!	Mem[0000000030081408] = fffffe93, %f23 = 00000000
	lda	[%i2+%o4]0x89,%f23	! %f23 = fffffe93
!	Mem[0000000030041410] = 61000000, %f8  = 0000ffff
	lda	[%i1+%o5]0x81,%f8 	! %f8 = 61000000
!	%f9  = ffde47e2, %f13 = 11815484, %f17 = 1e000000
	fmuls	%f9 ,%f13,%f17		! %f17 = ffde47e2
!	Mem[0000000030081410] = 0000000063000000, %f22 = 00000020 fffffe93
	ldda	[%i2+%o5]0x81,%f22	! %f22 = 00000000 63000000
!	Mem[00000000100c1410] = 20000000, %f20 = ff450000
	lda	[%i3+%o5]0x80,%f20	! %f20 = 20000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff

p0_label_360:
!	Mem[00000000218000c0] = e9fff956, %l5 = 0000000000000000
	ldstuba	[%o3+0x0c0]%asi,%l5	! %l5 = 000000e9000000ff
!	Mem[0000000010081408] = aaffffff, %l2 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 00000000aaffffff
!	%l6 = 00000063, %l7 = 84548111, Mem[00000000100c1418] = b2d0b9e9 ff000000
	stda	%l6,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000063 84548111
!	%l6 = 0000000000000063, Mem[000000001004142d] = 00000000
	stb	%l6,[%i1+0x02d]		! Mem[000000001004142c] = 00630000
!	%f10 = 00000000 8a7d4cca, Mem[0000000010181400] = 00ff0000 e9b9d000
	stda	%f10,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000 8a7d4cca
!	%l6 = 0000000000000063, Mem[0000000010141434] = 11815484, %asi = 80
	stwa	%l6,[%i5+0x034]%asi	! Mem[0000000010141434] = 00000063
!	%l3 = ffffffffffffffff, Mem[0000000030001410] = e9b9d000
	stba	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = e9b9d0ff
!	%l4 = ff000022, %l5 = 000000e9, Mem[0000000010001408] = 01000000 0000004b
	std	%l4,[%i0+%o4]		! Mem[0000000010001408] = ff000022 000000e9
!	%l4 = 00000000ff000022, Mem[0000000010101400] = 00000000ffffffbf
	stxa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000ff000022
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00007f1a, %l4 = 00000000ff000022
	ldub	[%o2+0x001],%l4		! %l4 = 0000000000000000

p0_label_361:
!	Mem[0000000030141410] = 00000000, %l6 = 0000000000000063
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l5 = 00000000000000e9
	lduha	[%i5+0x012]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = ffff001e, %l0 = 000000ffcb000000
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 000000000000ffff
!	%l3 = ffffffffffffffff, imm = 0000000000000461, %l4 = 0000000000000000
	and	%l3,0x461,%l4		! %l4 = 0000000000000461
!	Mem[0000000030181410] = 1e000000, %l7 = 0000000084548111
	ldsba	[%i6+%o5]0x81,%l7	! %l7 = 000000000000001e
!	Mem[0000000020800040] = 00632c25, %l4 = 0000000000000461
	ldub	[%o1+0x041],%l4		! %l4 = 0000000000000063
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 0000001e00000000, %f2  = ff000000 ff0000ff
	ldda	[%i2+%g0]0x80,%f2 	! %f2  = 0000001e 00000000
!	Starting 10 instruction Store Burst
!	%l1 = 000000007237118d, Mem[00000000100c1408] = 000000ff
	stwa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 7237118d

p0_label_362:
!	%l2 = aaffffff, %l3 = ffffffff, Mem[0000000010081400] = 0000001e 00000000
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = aaffffff ffffffff
!	%l6 = 00000000, %l7 = 0000001e, Mem[0000000010141408] = 63000000 00000000
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 0000001e
!	%l6 = 0000000000000000, Mem[0000000010081408] = 0000000000000000
	stxa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
	membar	#Sync			! Added by membar checker (61)
!	Mem[00000000100c1400] = ffff001e 0000001e 8d113772 ff0000ff
!	Mem[00000000100c1410] = 20000000 ff1a0000 00000063 84548111
!	Mem[00000000100c1420] = 7237118d ebff0000 00000063 00ff0000
!	Mem[00000000100c1430] = 00007a95 000000d3 0063ff5b 0000ffff
	ldda	[%i3]ASI_BLK_AIUP,%f16	! Block Load from 00000000100c1400
!	%l6 = 0000000000000000, imm = 0000000000000e29, %l3 = ffffffffffffffff
	andn	%l6,0xe29,%l3		! %l3 = 0000000000000000
!	%l2 = 00000000aaffffff, Mem[0000000010041410] = 0000000000000000
	stxa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000aaffffff
!	Code Fragment 3
p0_fragment_31:
!	%l0 = 000000000000ffff
	setx	0xd6c8da7fa4c516ef,%g7,%l0 ! %l0 = d6c8da7fa4c516ef
!	%l1 = 000000007237118d
	setx	0x83b490afa5efb874,%g7,%l1 ! %l1 = 83b490afa5efb874
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d6c8da7fa4c516ef
	setx	0xfae3564002f91747,%g7,%l0 ! %l0 = fae3564002f91747
!	%l1 = 83b490afa5efb874
	setx	0xf30b639f8c0ffc05,%g7,%l1 ! %l1 = f30b639f8c0ffc05
!	%l4 = 0000000000000063, Mem[0000000010141408] = 00000000
	stba	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000063
!	Mem[0000000010081438] = ff1eb9ffb600ffff, %l0 = fae3564002f91747, %l0 = fae3564002f91747
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l0,%l0	! %l0 = ff1eb9ffb600ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = e2000000, %l7 = 000000000000001e
	lduba	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000

p0_label_363:
!	Mem[0000000010001400] = ff0000ff, %l4 = 0000000000000063
	ldsba	[%i0+0x002]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = 00ff0000e9b9d0ff, %f4  = bbde47e2 d31ad1d3
	ldda	[%i0+%o5]0x89,%f4 	! %f4  = 00ff0000 e9b9d0ff
!	Mem[00000000300c1408] = ff0000ff, %l1 = f30b639f8c0ffc05
	lduha	[%i3+%o4]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[00000000100c1438] = 0063ff5b0000ffff, %f6  = 38d11ad3 7a958839
	ldd	[%i3+0x038],%f6 	! %f6  = 0063ff5b 0000ffff
!	Mem[0000000030101400] = 000000ff, %l1 = 000000000000ff00
	lduba	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, imm = 00000000000001db, %l5 = 0000000000000000
	add	%l1,0x1db,%l5		! %l5 = 00000000000001db
!	Mem[0000000030081410] = 00000000, %f4  = 00ff0000
	lda	[%i2+%o5]0x81,%f4 	! %f4 = 00000000
!	Mem[0000000010181410] = 5bff00ff000000ff, %l6 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l6	! %l6 = 5bff00ff000000ff
!	Mem[000000001008140c] = 00000000, %l2 = 00000000aaffffff
	lduw	[%i2+0x00c],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f10 = 00000000, Mem[0000000030181400] = bbde47ff
	sta	%f10,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000

p0_label_364:
	membar	#Sync			! Added by membar checker (62)
!	%l5 = 00000000000001db, Mem[00000000100c1414] = ff1a0000, %asi = 80
	stha	%l5,[%i3+0x014]%asi	! Mem[00000000100c1414] = 01db0000
!	%f0  = 00000000 ffffffbf, %l6 = 5bff00ff000000ff
!	Mem[0000000010181418] = 38d11ad37a958839
	add	%i6,0x018,%g1
	stda	%f0,[%g1+%l6]ASI_PST16_P ! Mem[0000000010181418] = 00000000ffffffbf
!	%l3 = 0000000000000000, Mem[00000000100c1410] = 00000020
	stba	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%f13 = 11815484, Mem[0000000010101410] = ffbb0000
	sta	%f13,[%i4+%o5]0x80	! Mem[0000000010101410] = 11815484
!	Mem[0000000030081410] = 00000000, %l0 = ff1eb9ffb600ffff
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%f17 = 0000001e, %f9  = ffde47e2, %f11 = 8a7d4cca
	fdivs	%f17,%f9 ,%f11		! %f11 = ffde47e2
!	%l2 = 0000000000000000, immd = fffffffffffff5ed, %l0 = 0000000000000000
	sdivx	%l2,-0xa13,%l0		! %l0 = 0000000000000000
!	Code Fragment 3
p0_fragment_32:
!	%l0 = 0000000000000000
	setx	0x53fa5ba04ff975c9,%g7,%l0 ! %l0 = 53fa5ba04ff975c9
!	%l1 = 0000000000000000
	setx	0x8714fc983c55f834,%g7,%l1 ! %l1 = 8714fc983c55f834
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 53fa5ba04ff975c9
	setx	0x803a4b583000f8aa,%g7,%l0 ! %l0 = 803a4b583000f8aa
!	%l1 = 8714fc983c55f834
	setx	0x2f4b1c88302aaed0,%g7,%l1 ! %l1 = 2f4b1c88302aaed0
!	%f24 = 7237118d ebff0000, Mem[0000000030181410] = 1e000000 1e001ad3
	stda	%f24,[%i6+%o5]0x81	! Mem[0000000030181410] = 7237118d ebff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff0000ff, %f10 = 00000000
	lda	[%i4+%o4]0x89,%f10	! %f10 = ff0000ff

p0_label_365:
!	Mem[000000001018143c] = 65450a09, %l6 = 5bff00ff000000ff
	ldsw	[%i6+0x03c],%l6		! %l6 = 0000000065450a09
!	Mem[0000000010141410] = 00000000, %l1 = 2f4b1c88302aaed0
	lduha	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[000000001008143c] = b600ffff, %l0 = 803a4b583000f8aa
	lduh	[%i2+0x03e],%l0		! %l0 = 000000000000ffff
!	Mem[0000000010141400] = 11815484, %l5 = 00000000000001db
	ldsba	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000011
!	Mem[0000000010001408] = ff000022, %l0 = 000000000000ffff
	lduwa	[%i0+0x008]%asi,%l0	! %l0 = 00000000ff000022
!	Mem[0000000010141400] = 84548111, %l6 = 0000000065450a09
	lduha	[%i5+%g0]0x88,%l6	! %l6 = 0000000000008111
!	Mem[0000000010041408] = 0000ff00, %l0 = 00000000ff000022
	lduha	[%i1+%o4]0x88,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010141400] = 11815484, %l0 = 000000000000ff00
	lduha	[%i5+%g0]0x80,%l0	! %l0 = 0000000000001181
!	Mem[00000000100c1400] = 1e00ffff, %l2 = 0000000000000000
	ldsha	[%i3+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010001400] = 00000000ff0000ff
	stxa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000

p0_label_366:
!	%l4 = 0000000000000000, Mem[0000000010181408] = 220000ff
	stha	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 22000000
!	%l5 = 0000000000000011, Mem[0000000030001400] = 00000000
	stha	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000011
!	Mem[0000000010001414] = ff000121, %l7 = 0000000000000000
	swap	[%i0+0x014],%l7		! %l7 = 00000000ff000121
!	%l1 = 0000000000000000, Mem[0000000010141408] = 63000000
	stha	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%f29 = 000000d3, Mem[0000000030141410] = 00000000
	sta	%f29,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000d3
!	%f22 = 00000063, %f1  = ffffffbf, %f4  = 00000000 e9b9d0ff
	fsmuld	%f22,%f1 ,%f4 		! %f4  = fffffff7 e0000000
!	Mem[00000000100c1408] = 7237118d, %l6 = 0000000000008111
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 000000007237118d
!	%l0 = 0000000000001181, Mem[0000000010141410] = b30954cb00000000
	stxa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000001181
!	%l0 = 0000000000001181, Mem[0000000020800000] = 000016cb, %asi = 80
	stha	%l0,[%o1+0x000]%asi	! Mem[0000000020800000] = 118116cb
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000022, %l7 = 00000000ff000121
	lduba	[%i0+%o4]0x80,%l7	! %l7 = 00000000000000ff

p0_label_367:
!	Mem[0000000010181410] = ff000000ff00ff5b, %l1 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = ff000000ff00ff5b
!	Mem[0000000010141410] = 00000000 00001181, %l0 = 00001181, %l1 = ff00ff5b
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 0000000000001181 0000000000000000
!	Mem[0000000030001400] = 00000000 00000011, %l0 = 00001181, %l1 = 00000000
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000011 0000000000000000
!	Mem[0000000010141408] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l6 = 000000007237118d
	lduwa	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = ffffffffffffffaa, %f26 = 00000063 00ff0000
	ldda	[%i2+%g0]0x88,%f26	! %f26 = ffffffff ffffffaa
!	Mem[0000000030081400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Code Fragment 3
p0_fragment_33:
!	%l0 = 0000000000000011
	setx	0x67662adff04d9c7e,%g7,%l0 ! %l0 = 67662adff04d9c7e
!	%l1 = 0000000000000000
	setx	0x151cd54865dc22fe,%g7,%l1 ! %l1 = 151cd54865dc22fe
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 67662adff04d9c7e
	setx	0xc623f8f035e93f64,%g7,%l0 ! %l0 = c623f8f035e93f64
!	%l1 = 151cd54865dc22fe
	setx	0xe97168e78d96a5cf,%g7,%l1 ! %l1 = e97168e78d96a5cf
!	%l5 = 0000000000000011, %l3 = 0000000000000000, %l4 = 0000000000000000
	orn	%l5,%l3,%l4		! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000011, %l5 = 0000000000000011, %l1 = e97168e78d96a5cf
	sdivx	%l5,%l5,%l1		! %l1 = 0000000000000001

p0_label_368:
!	%l0 = c623f8f035e93f64, Mem[00000000201c0001] = 00007d80
	stb	%l0,[%o0+0x001]		! Mem[00000000201c0000] = 00647d80
!	%f12 = 8ec1195f 11815484, %l5 = 0000000000000011
!	Mem[0000000030041408] = ff4500000000ff21
	add	%i1,0x008,%g1
	stda	%f12,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030041408] = 844500005f00ff21
!	%l2 = ffffffffffffffff, %l7 = 0000000000000000, %y  = 00000000
	udiv	%l2,%l7,%l7		! Div by zero, %l0 = c623f8f035e93fb4
	mov	%l0,%y			! %y = 35e93f8c
!	%f11 = ffde47e2, Mem[0000000030041400] = ff000000
	sta	%f11,[%i1+%g0]0x81	! Mem[0000000030041400] = ffde47e2
!	%l7 = 0000000000000000, imm = fffffffffffffa4f, %l7 = 0000000000000000
	xnor	%l7,-0x5b1,%l7		! %l7 = 00000000000005b0
!	Mem[0000000010181400] = 000000008a7d4cca, %l0 = c623f8f035e93f8c, %l2 = ffffffffffffffff
	casxa	[%i6]0x80,%l0,%l2	! %l2 = 000000008a7d4cca
!	%l3 = 0000000000000000, Mem[0000000010101400] = 00000000
	stwa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	%l2 = 000000008a7d4cca, Mem[00000000100c141b] = 00000063
	stb	%l2,[%i3+0x01b]		! Mem[00000000100c1418] = 000000ca
!	%f28 = 00007a95, Mem[0000000010081400] = ffffffaa
	sta	%f28,[%i2+%g0]0x88	! Mem[0000000010081400] = 00007a95
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 4b000000cb000000, %f20 = 20000000 ff1a0000
	ldda	[%i1+%g0]0x80,%f20	! %f20 = 4b000000 cb000000

p0_label_369:
!	Mem[0000000030081410] = 000000ff, %l4 = ffffffffffffffff
	lduba	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = 00008111, %l0 = c623f8f035e93f8c
	lduba	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000011
!	Mem[0000000010041428] = ff4c7d8a, %l0 = 0000000000000011
	ldswa	[%i1+0x028]%asi,%l0	! %l0 = ffffffffff4c7d8a
	membar	#Sync			! Added by membar checker (63)
!	Mem[0000000010141400] = 11815484 e9b90000 00000000 0000001e
!	Mem[0000000010141410] = 81110000 00000000 000060f3 e3ff0641
!	Mem[0000000010141420] = 31f7bf47 e247debb 8454ff11 5f19c18e
!	Mem[0000000010141430] = 8ec1195f 00000063 000000ff 30b4aa5a
	ldda	[%i5]ASI_BLK_PL,%f0	! Block Load from 0000000010141400
!	Mem[0000000030041408] = 00004584, %l7 = 00000000000005b0
	lduba	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000084
!	Mem[00000000100c1418] = 000000ca84548111, %f30 = 0063ff5b 0000ffff
	ldd	[%i3+0x018],%f30	! %f30 = 000000ca 84548111
!	%l3 = 0000000000000000, immd = 0000000000000085, %l6 = 0000000000000000
	sdivx	%l3,0x085,%l6		! %l6 = 0000000000000000
!	Mem[0000000030101408] = ff0000ff, %l3 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l3	! %l3 = 00000000ff0000ff
!	Mem[0000000030141408] = ff610000, %l7 = 0000000000000084
	lduha	[%i5+%o4]0x81,%l7	! %l7 = 000000000000ff61
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (64)
!	%l5 = 0000000000000011, Mem[000000001014141c] = e3ff0641
	stw	%l5,[%i5+0x01c]		! Mem[000000001014141c] = 00000011

p0_label_370:
!	Mem[0000000010001418] = 000000ffffb9d0b2, %l7 = 000000000000ff61, %l7 = 000000000000ff61
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = 000000ffffb9d0b2
!	Mem[0000000010041414] = 00000000, %l5 = 00000011, %l3 = ff0000ff
	add	%i1,0x14,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l1 = 0000000000000001
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 4b000000, %l4 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 0000004b000000ff
!	%l2 = 8a7d4cca, %l3 = 00000000, Mem[0000000030081408] = fffffe93 31f7bf47
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 8a7d4cca 00000000
!	Mem[000000001000142c] = 000000ff, %l5 = 0000000000000011, %asi = 80
	swapa	[%i0+0x02c]%asi,%l5	! %l5 = 00000000000000ff
!	%l2 = 000000008a7d4cca, Mem[0000000010081400] = 00007a95
	stwa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 8a7d4cca
!	%l4 = 000000000000004b, Mem[00000000100c1430] = 00007a95000000d3
	stx	%l4,[%i3+0x030]		! Mem[00000000100c1430] = 000000000000004b
!	Mem[0000000010001400] = 00000000, %l0 = ff4c7d8a, %l0 = ff4c7d8a
	casa	[%i0]0x80,%l0,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	%f19 = ff0000ff, %f5  = 00001181
	fsqrts	%f19,%f5 		! %f5  = 7fffffff

p0_label_371:
!	Mem[0000000010041408] = 00ff0000, %f1  = 84548111
	lda	[%i1+%o4]0x80,%f1 	! %f1 = 00ff0000
!	Mem[0000000010081410] = c1e86f1e, %l2 = 000000008a7d4cca
	lduha	[%i2+%o5]0x88,%l2	! %l2 = 0000000000006f1e
!	Mem[0000000010101430] = 0000d0b2, %l2 = 0000000000006f1e
	ldsh	[%i4+0x030],%l2		! %l2 = 0000000000000000
!	Mem[0000000030041408] = 84450000, %f26 = ffffffff
	lda	[%i1+%o4]0x81,%f26	! %f26 = 84450000
!	Mem[0000000010101400] = 00000001ff000022, %f0  = 0000b9e9 00ff0000
	ldda	[%i4+0x000]%asi,%f0 	! %f0  = 00000001 ff000022
!	Mem[0000000010081400] = ca4c7d8a ffffffff, %l4 = 0000004b, %l5 = 000000ff
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000ca4c7d8a 00000000ffffffff
!	%f13 = 5f19c18e, %f15 = ff000000, %f25 = ebff0000
	fdivs	%f13,%f15,%f25		! %f25 = 9f99c18e
	membar	#Sync			! Added by membar checker (65)
!	Mem[0000000010081400] = ca4c7d8a ffffffff 00000000 00000000
!	Mem[0000000010081410] = 1e6fe8c1 0000ff00 00000000 20000000
!	Mem[0000000010081420] = 4cf6ab34 fffffe93 ffffffff ffffffff
!	Mem[0000000010081430] = 00000000 00000000 ff1eb9ff b600ffff
	ldda	[%i2]ASI_BLK_AIUP,%f16	! Block Load from 0000000010081400
!	Mem[0000000010141400] = 84548111, %l4 = 00000000ca4c7d8a
	lduba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000011
!	Starting 10 instruction Store Burst
!	%f10 = 8ec1195f, Mem[0000000030041410] = 61000000
	sta	%f10,[%i1+%o5]0x81	! Mem[0000000030041410] = 8ec1195f

p0_label_372:
!	Mem[0000000010181424] = e247debb, %l7 = ffb9d0b2, %l3 = 00000000
	add	%i6,0x24,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000e247debb
!	%l0 = 0000000000000000, Mem[000000001004143a] = 001e0000
	stb	%l0,[%i1+0x03a]		! Mem[0000000010041438] = 001e0000
!	%l7 = 000000ffffb9d0b2, Mem[0000000021800100] = 0e006971
	sth	%l7,[%o3+0x100]		! Mem[0000000021800100] = d0b26971
!	%l7 = 000000ffffb9d0b2, Mem[0000000010141400] = 84548111
	stha	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 8454d0b2
!	%f4  = 00000000 7fffffff, Mem[0000000030001410] = ffd0b9e9 0000ff00
	stda	%f4 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 7fffffff
!	%l1 = 0000000000000000, Mem[0000000010001408] = e9000000220000ff
	stxa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000000000000
!	%l4 = 0000000000000011, Mem[0000000010181412] = ff000000, %asi = 80
	stba	%l4,[%i6+0x012]%asi	! Mem[0000000010181410] = ff001100
!	Mem[0000000030141408] = ff610000, %l4 = 0000000000000011
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 00000000ff610000
!	Mem[0000000030181408] = 000000e2, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000e2
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 1e00ffff, %l1 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l1	! %l1 = ffffffffffffffff

p0_label_373:
!	Mem[0000000010181400] = 000000008a7d4cca, %f12 = 63000000 5f19c18e
	ldd	[%i6+%g0],%f12		! %f12 = 00000000 8a7d4cca
!	Mem[0000000010101400] = 00000001, %l0 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = ff001100, %l6 = 00000000000000e2
	ldswa	[%i6+%o5]0x80,%l6	! %l6 = ffffffffff001100
!	Mem[0000000010081420] = 4cf6ab34, %l6 = ffffffffff001100
	lduw	[%i2+0x020],%l6		! %l6 = 000000004cf6ab34
!	Mem[0000000010041400] = ff000000, %l3 = 00000000e247debb
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141408] = 00000011, %l0 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081418] = 00000000, %l6 = 000000004cf6ab34
	ldsh	[%i2+0x018],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001418] = 000000ff, %l3 = 0000000000000000
	ldsh	[%i0+0x018],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030101410] = d3d11ad3
	stba	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00d11ad3

p0_label_374:
!	%f14 = 5aaab430 ff000000, %l3 = 0000000000000000
!	Mem[0000000030081400] = 00000000000000ff
	stda	%f14,[%i2+%l3]ASI_PST32_S ! Mem[0000000030081400] = 00000000000000ff
!	%l0 = 00000000, %l1 = ffffffff, Mem[00000000100c1410] = 00000000 01db0000
	stda	%l0,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00000000 ffffffff
!	%f10 = 8ec1195f 11ff5484, Mem[0000000030181410] = 8d113772 0000ffeb
	stda	%f10,[%i6+%o5]0x89	! Mem[0000000030181410] = 8ec1195f 11ff5484
!	%l1 = ffffffffffffffff, Mem[0000000030001408] = 21b10000ffffffff
	stxa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffffffffffff
	membar	#Sync			! Added by membar checker (66)
!	%l5 = 00000000ffffffff, Mem[0000000010081408] = 00000000
	stha	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = ffff0000
!	%f20 = 1e6fe8c1 0000ff00, Mem[0000000010041410] = ffffffaa 00000000
	stda	%f20,[%i1+%o5]0x80	! Mem[0000000010041410] = 1e6fe8c1 0000ff00
!	%f16 = ca4c7d8a ffffffff 00000000 00000000
!	%f20 = 1e6fe8c1 0000ff00 00000000 20000000
!	%f24 = 4cf6ab34 fffffe93 ffffffff ffffffff
!	%f28 = 00000000 00000000 ff1eb9ff b600ffff
	stda	%f16,[%i2]ASI_BLK_AIUPL	! Block Store to 0000000010081400
!	%l0 = 0000000000000000, Mem[0000000010041400] = ff000000
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%l1 = ffffffffffffffff, Mem[000000001000141a] = 000000ff, %asi = 80
	stha	%l1,[%i0+0x01a]%asi	! Mem[0000000010001418] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 1e001ad3, %l6 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l6	! %l6 = 0000000000001ad3

p0_label_375:
!	Mem[0000000030141410] = 000000d3, %l7 = 000000ffffb9d0b2
	ldsha	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000d3
!	%f6  = 4106ffe3 f3600000, Mem[00000000100c1438] = 0063ff5b 0000ffff
	std	%f6 ,[%i3+0x038]	! Mem[00000000100c1438] = 4106ffe3 f3600000
!	Mem[0000000030141400] = d31a001e, %l3 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l3	! %l3 = 00000000d31a001e
!	Mem[000000001014141c] = 00000011, %f2  = 1e000000
	lda	[%i5+0x01c]%asi,%f2 	! %f2 = 00000011
!	Mem[0000000010141410] = 81110000, %l7 = 00000000000000d3
	lduba	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000081
	membar	#Sync			! Added by membar checker (67)
!	Mem[0000000010081400] = ca4c7d8a ffffffff, %l6 = 00001ad3, %l7 = 00000081
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 00000000ffffffff 00000000ca4c7d8a
!	Mem[0000000010141410] = 00001181, %l1 = ffffffffffffffff
	ldsha	[%i5+%o5]0x88,%l1	! %l1 = 0000000000001181
!	Mem[0000000010001400] = 00000000, %l7 = 00000000ca4c7d8a
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 00008111, %l3 = 00000000d31a001e
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 00000011000000ff
!	Starting 10 instruction Store Burst
!	%f4  = 00000000 7fffffff, Mem[00000000100c1438] = 4106ffe3 f3600000
	stda	%f4 ,[%i3+0x038]%asi	! Mem[00000000100c1438] = 00000000 7fffffff

p0_label_376:
!	%l2 = 0000000000000000, Mem[0000000010101410] = 11815484
	stba	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 00815484
!	Mem[0000000030141400] = d31a001e, %l1 = 0000000000001181
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 000000d3000000ff
!	Mem[00000000100c1414] = ffffffff, %l2 = 0000000000000000
	swap	[%i3+0x014],%l2		! %l2 = 00000000ffffffff
!	%l0 = 00000000, %l1 = 000000d3, Mem[0000000030101408] = ff0000ff 000000ff
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 000000d3
!	%f22 = 00000000 20000000, Mem[0000000010101400] = 00000001 ff000022
	stda	%f22,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 20000000
!	%l0 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stba	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[0000000021800001] = 1ec0ba26, %l7 = 0000000000000000
	ldstub	[%o3+0x001],%l7		! %l7 = 000000c0000000ff
!	%l6 = 00000000ffffffff, Mem[0000000030181400] = 00000000
	stha	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000ffff
!	Code Fragment 3
p0_fragment_34:
!	%l0 = 0000000000000000
	setx	0xa32eb9a7a8989c21,%g7,%l0 ! %l0 = a32eb9a7a8989c21
!	%l1 = 00000000000000d3
	setx	0xa25a0b1fb80b9905,%g7,%l1 ! %l1 = a25a0b1fb80b9905
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a32eb9a7a8989c21
	setx	0x25482dc0490c0afe,%g7,%l0 ! %l0 = 25482dc0490c0afe
!	%l1 = a25a0b1fb80b9905
	setx	0xdd799c900f123e1f,%g7,%l1 ! %l1 = dd799c900f123e1f
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l2 = 00000000ffffffff
	ldsba	[%i3+0x010]%asi,%l2	! %l2 = 0000000000000000

p0_label_377:
!	Mem[0000000030141410] = 84548111000000d3, %l6 = 00000000ffffffff
	ldxa	[%i5+%o5]0x89,%l6	! %l6 = 84548111000000d3
!	Mem[0000000010001408] = 00000000 00000000, %l2 = 00000000, %l3 = 00000011
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030101410] = d31ad100, %l6 = 84548111000000d3
	lduwa	[%i4+%o5]0x89,%l6	! %l6 = 00000000d31ad100
!	Mem[0000000010101400] = 00000000, %l7 = 00000000000000c0
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = ff81b9e921ff0000, %f26 = ffffffff ffffffff
	ldda	[%i4+%o4]0x80,%f26	! %f26 = ff81b9e9 21ff0000
!	Mem[0000000010081400] = ffffffff, %l6 = 00000000d31ad100
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010101408] = ff81b9e9, %l2 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l2	! %l2 = ffffffffff81b9e9
!	Mem[0000000020800000] = 118116cb, %l2 = ffffffffff81b9e9
	lduha	[%o1+0x000]%asi,%l2	! %l2 = 0000000000001181
!	Mem[0000000010101400] = c000000020000000, %f10 = 8ec1195f 11ff5484
	ldda	[%i4+%g0]0x80,%f10	! %f10 = c0000000 20000000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 00647d80, %l6 = 000000000000ffff
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 00000064000000ff

p0_label_378:
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000064
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%l0 = 25482dc0490c0afe, Mem[0000000010001410] = 0000000011815484
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 25482dc0490c0afe
!	%l4 = ff610000, %l5 = ffffffff, Mem[0000000030181410] = 11ff5484 8ec1195f
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = ff610000 ffffffff
!	%f0  = 00000001, Mem[0000000010181400] = 00000064
	sta	%f0 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000001
!	Mem[0000000010081404] = 8a7d4cca, %l3 = 0000000000000000, %asi = 80
	swapa	[%i2+0x004]%asi,%l3	! %l3 = 000000008a7d4cca
!	Mem[0000000010101410] = 00815484, %l0 = 25482dc0490c0afe
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 0000000000815484
!	%l3 = 000000008a7d4cca, Mem[0000000010001400] = 0000000000000000
	stxa	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000008a7d4cca
!	Mem[00000000211c0001] = 00007f1a, %l1 = dd799c900f123e1f
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	%f6  = 4106ffe3 f3600000, Mem[0000000010041408] = 00ff0000 0000001e
	stda	%f6 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 4106ffe3 f3600000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 000000ffcb000000, %l5 = 00000000ffffffff
	ldxa	[%i4+%g0]0x81,%l5	! %l5 = 000000ffcb000000

p0_label_379:
!	Mem[0000000030181408] = 00000000, %l4 = 00000000ff610000
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = fe0a0c49, %l1 = 0000000000000000
	lduba	[%i0+%o5]0x80,%l1	! %l1 = 00000000000000fe
!	Mem[0000000030001408] = ffffffff ffffffff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010141408] = 00000000, %l4 = 0000000000000000
	ldsba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = 0000000084548111, %f20 = 1e6fe8c1 0000ff00
	ldda	[%i6+%o4]0x81,%f20	! %f20 = 00000000 84548111
!	Mem[00000000300c1410] = 00000000, %l2 = 0000000000001181
	lduba	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = 00ff7d80, %l7 = 00000000ffffffff
	ldsh	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010141418] = 000060f300000011, %f4  = 00000000 7fffffff
	ldda	[%i5+0x018]%asi,%f4 	! %f4  = 000060f3 00000011
!	Mem[0000000010101408] = ff81b9e9, %l0 = 0000000000815484
	ldsha	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffffff81
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00001181, %l4 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 00000081000000ff

p0_label_380:
!	Mem[0000000030001410] = 00000000, %l5 = 000000ffcb000000
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l0 = ffffffffffffff81, Mem[0000000010001400] = 8a7d4cca
	stba	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 8a7d4c81
!	%l1 = 00000000000000fe, Mem[00000000100c1408] = 000081ff
	stba	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000081fe
!	%l2 = 00000000, %l3 = 8a7d4cca, Mem[0000000010101400] = c0000000 20000000
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 8a7d4cca
!	%l1 = 00000000000000fe, Mem[00000000100c1410] = 00000000
	stwa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000fe
!	%l0 = ffffffffffffff81, Mem[00000000300c1400] = 00000000
	stha	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff810000
!	%l2 = 00000000, %l3 = 8a7d4cca, Mem[0000000010101410] = 490c0afe 00000000
	stda	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 8a7d4cca
!	%f14 = 5aaab430, Mem[00000000100c1424] = ebff0000
	sta	%f14,[%i3+0x024]%asi	! Mem[00000000100c1424] = 5aaab430
!	%l2 = 0000000000000000, %l2 = 0000000000000000, %l4 = 0000000000000081
	udivx	%l2,%l2,%l4		! Div by zero, %l0 = ffffffffffffffd1
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = d300000000000000, %l3 = 000000008a7d4cca
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = d300000000000000

p0_label_381:
!	Mem[0000000030081408] = ca4c7d8a, %l5 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l5	! %l5 = ffffffffffffffca
!	Mem[0000000010081400] = ffffffff, %f19 = 00000000
	lda	[%i2+%g0]0x80,%f19	! %f19 = ffffffff
!	Mem[0000000010101408] = e9b981ff, %l0 = ffffffffffffffa9
	lduha	[%i4+%o4]0x88,%l0	! %l0 = 00000000000081ff
!	Mem[0000000010001410] = fe0a0c49, %l4 = 0000000000000081
	lduba	[%i0+%o5]0x80,%l4	! %l4 = 00000000000000fe
!	Mem[0000000010081410] = 0000ff00, %l1 = 00000000000000fe
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010081410] = 0000ff00, %l4 = 00000000000000fe
	ldswa	[%i2+%o5]0x88,%l4	! %l4 = 000000000000ff00
!	Mem[00000000201c0000] = 00ff7d80, %l5 = ffffffffffffffca
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = b2d05484, %l2 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = ffffffffffffffb2
!	Mem[0000000030001400] = 11000000, %l5 = 00000000000000ff
	ldsba	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000011
!	Starting 10 instruction Store Burst
!	%f30 = ff1eb9ff b600ffff, %l5 = 0000000000000011
!	Mem[00000000100c1438] = 000000007fffffff
	add	%i3,0x038,%g1
	stda	%f30,[%g1+%l5]ASI_PST16_P ! Mem[00000000100c1438] = 000000007fffffff

p0_label_382:
!	Mem[0000000010141438] = 000000ff, %l1 = 0000ff00, %l6 = ffffffff
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 00000000000000ff
!	%l4 = 0000ff00, %l5 = 00000011, Mem[0000000030041400] = ffde47e2 000000ff
	stda	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000ff00 00000011
!	%l4 = 000000000000ff00, Mem[0000000020800001] = 118116cb, %asi = 80
	stba	%l4,[%o1+0x001]%asi	! Mem[0000000020800000] = 110016cb
!	%l4 = 000000000000ff00, Mem[0000000010081408] = 00000000
	stwa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000ff00
!	Mem[0000000010101408] = ff81b9e9, %l0 = 00000000000081ff
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 00000000ff81b9e9
!	%l5 = 0000000000000011, Mem[00000000201c0000] = 00ff7d80
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 00117d80
!	Mem[0000000010081400] = ffffffff, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000020800041] = 00632c25, %l3 = d300000000000000
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 00000063000000ff
!	Mem[0000000030041410] = 5f19c18e, %l4 = 000000000000ff00
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 000000005f19c18e
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = b2d05484 e9b90000, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i5+0x000]%asi,%l6	! %l6 = 00000000b2d05484 00000000e9b90000

p0_label_383:
!	Mem[00000000300c1400] = ff810000, %l0 = 00000000ff81b9e9
	lduba	[%i3+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1410] = fe000000, %l2 = ffffffffffffffb2
	lduha	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%f10 = c0000000, %f6  = 4106ffe3, %f25 = fffffe93
	fdivs	%f10,%f6 ,%f25		! %f25 = be72ba0a
!	Mem[0000000010041410] = c1e86f1e, %f22 = 00000000
	lda	[%i1+%o5]0x88,%f22	! %f22 = c1e86f1e
!	Mem[000000001000140c] = 00000000, %l6 = 00000000b2d05484
	ldub	[%i0+0x00d],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1430] = 000000000000004b, %l4 = 000000005f19c18e
	ldx	[%i3+0x030],%l4		! %l4 = 000000000000004b
!	Mem[0000000030081410] = ff00000063000000, %l7 = 00000000e9b90000
	ldxa	[%i2+%o5]0x81,%l7	! %l7 = ff00000063000000
!	Mem[0000000010041400] = 00000000, %l6 = 0000000000000000
	ldsha	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %f31 = b600ffff
	lda	[%i2+%g0]0x89,%f31	! %f31 = 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030101400] = ff000000
	stba	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000000

p0_label_384:
!	%l5 = 0000000000000011, imm = fffffffffffff1fd, %l2 = 0000000000000000
	subc	%l5,-0xe03,%l2		! %l2 = 0000000000000e14
!	Mem[0000000030081408] = ca4c7d8a, %l5 = 0000000000000011
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 000000ca000000ff
!	%l2 = 0000000000000e14, Mem[0000000010181428] = 00000000, %asi = 80
	stwa	%l2,[%i6+0x028]%asi	! Mem[0000000010181428] = 00000e14
!	%f16 = ca4c7d8a ffffffff 00000000 ffffffff
!	%f20 = 00000000 84548111 c1e86f1e 20000000
!	%f24 = 4cf6ab34 be72ba0a ff81b9e9 21ff0000
!	%f28 = 00000000 00000000 ff1eb9ff 00000000
	stda	%f16,[%i6]ASI_BLK_PL	! Block Store to 0000000010181400
!	Code Fragment 4
p0_fragment_35:
!	%l0 = 00000000000000ff
	setx	0xbba5a6982d82b0dd,%g7,%l0 ! %l0 = bba5a6982d82b0dd
!	%l1 = 000000000000ff00
	setx	0x2523a9803277dac3,%g7,%l1 ! %l1 = 2523a9803277dac3
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bba5a6982d82b0dd
	setx	0x2776e41878d6614d,%g7,%l0 ! %l0 = 2776e41878d6614d
!	%l1 = 2523a9803277dac3
	setx	0xaa68de87cde34b49,%g7,%l1 ! %l1 = aa68de87cde34b49
!	Mem[0000000010041400] = 00000000, %l1 = aa68de87cde34b49
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%l0 = 2776e41878d6614d, Mem[0000000010181408] = 00000000ffffffff
	stxa	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 2776e41878d6614d
!	%f12 = 00000000 8a7d4cca, Mem[0000000010141410] = 000011ff 00000000
	stda	%f12,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 8a7d4cca
!	Mem[0000000010041408] = 4106ffe3, %l4 = 000000000000004b
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 000000004106ffe3
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l7 = ff00000063000000
	lduwa	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000

p0_label_385:
!	Mem[0000000010081434] = 00000000, %l1 = 0000000000000000
	ldsb	[%i2+0x037],%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1408] = fe810000, %f12 = 00000000
	lda	[%i3+%o4]0x80,%f12	! %f12 = fe810000
!	Mem[0000000030181400] = 0000ffff, %f0  = 00000001
	lda	[%i6+%g0]0x89,%f0 	! %f0 = 0000ffff
!	Mem[0000000030001408] = ffffffff, %l2 = 0000000000000e14
	ldsha	[%i0+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141408] = 00000000, %l2 = ffffffffffffffff
	ldsha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = ff0000ff, %l6 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = 000000fe, %l5 = 00000000000000ca
	lduba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (68)
!	Mem[0000000010181404] = 8a7d4cca, %l4 = 000000004106ffe3
	ldsba	[%i6+0x006]%asi,%l4	! %l4 = 000000000000004c
!	%l2 = 0000000000000000, immd = fffffffffffff43b, %l3 = 0000000000000063
	sdivx	%l2,-0xbc5,%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff

p0_label_386:
!	%l3 = 0000000000000000, imm = 0000000000000879, %l5 = 0000000000000000
	xor	%l3,0x879,%l5		! %l5 = 0000000000000879
!	Mem[0000000030181400] = ffff0000, %l6 = 00000000000000ff
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000030041410] = 0000ff00
	stba	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000ff00
!	%l0 = 78d6614d, %l1 = 00000000, Mem[0000000010041400] = ff000000 cb000000
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 78d6614d 00000000
!	%l7 = 0000000000000000, Mem[0000000010141410] = 8a7d4cca
	stha	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 8a7d0000
!	Mem[0000000030141408] = 00000011, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l7	! %l7 = 0000000000000011
!	%l6 = 00000000000000ff, Mem[0000000030141410] = d3000000
	stwa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff
!	%l1 = 0000000000000000, Mem[0000000010001410] = 490c0afe
	stha	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 490c0000
!	Mem[000000001008143a] = ffff00b6, %l1 = 0000000000000000
	ldstuba	[%i2+0x03a]%asi,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l0 = 2776e41878d6614d
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_387:
!	Mem[0000000030001408] = ffffffff, %f10 = c0000000
	lda	[%i0+%o4]0x89,%f10	! %f10 = ffffffff
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000000000
	lduba	[%i5+0x00a]%asi,%l0	! %l0 = 0000000000000000
!	Mem[000000001014142c] = 5f19c18e, %l3 = 0000000000000000
	lduh	[%i5+0x02e],%l3		! %l3 = 000000000000c18e
!	Mem[0000000030041410] = 0000ff00, %l1 = 0000000000000000
	lduwa	[%i1+%o5]0x89,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010181410] = 0000000084548111, %l5 = 0000000000000879
	ldxa	[%i6+%o5]0x88,%l5	! %l5 = 0000000084548111
!	Mem[0000000010041420] = bbde47e2, %l7 = 0000000000000011
	ldswa	[%i1+0x020]%asi,%l7	! %l7 = ffffffffbbde47e2
!	Mem[0000000030101410] = bbde47e2d31ad100, %l0 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l0	! %l0 = bbde47e2d31ad100
!	Mem[0000000030001400] = 11000000, %l0 = bbde47e2d31ad100
	lduba	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000011
!	Mem[0000000010101408] = ff810000, %l0 = 0000000000000011
	lduwa	[%i4+%o4]0x88,%l0	! %l0 = 00000000ff810000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00000000, %l7 = ffffffffbbde47e2
	ldstuba	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff

p0_label_388:
!	Mem[0000000010001418] = 0000ffff, %l2 = 0000000000000000
	swap	[%i0+0x018],%l2		! %l2 = 000000000000ffff
!	Mem[0000000010101400] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l5 = 0000000084548111, Mem[0000000010041400] = 78d6614d
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 8111614d
!	Mem[00000000300c1408] = ff0000ff, %l2 = 000000000000ffff
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010081408] = 0000ff00, %l2 = 00000000000000ff
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 000000000000ff00
!	%l5 = 0000000084548111, imm = 000000000000047e, %l2 = 000000000000ff00
	sub	%l5,0x47e,%l2		! %l2 = 0000000084547c93
!	Mem[000000001018141c] = 1e6fe8c1, %l3 = 000000000000c18e, %asi = 80
	swapa	[%i6+0x01c]%asi,%l3	! %l3 = 000000001e6fe8c1
!	%l7 = 0000000000000000, Mem[0000000030141408] = ff000000
	stha	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	%f8  = bbde47e2 47bff731, Mem[0000000010041400] = 4d611181 00000000
	stda	%f8 ,[%i1+%g0]0x88	! Mem[0000000010041400] = bbde47e2 47bff731
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ff7f1a, %l3 = 000000001e6fe8c1
	lduh	[%o2+%g0],%l3		! %l3 = 00000000000000ff

p0_label_389:
!	Mem[00000000300c1408] = ff0000ff, %f24 = 4cf6ab34
	lda	[%i3+%o4]0x81,%f24	! %f24 = ff0000ff
!	Mem[0000000030141410] = ff000000, %l2 = 0000000084547c93
	ldsba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = 47bff731, %f26 = ff81b9e9
	lda	[%i1+%g0]0x88,%f26	! %f26 = 47bff731
!	Mem[00000000300c1400] = 000081ff, %l0 = 00000000ff810000
	ldsha	[%i3+%g0]0x89,%l0	! %l0 = ffffffffffff81ff
!	Mem[00000000100c1400] = ffff001e 0000001e fe810000 ff0000ff
!	Mem[00000000100c1410] = 000000fe 00000000 000000ca 84548111
!	Mem[00000000100c1420] = 7237118d 5aaab430 00000063 00ff0000
!	Mem[00000000100c1430] = 00000000 0000004b 00000000 7fffffff
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000010141400] = 8454d0b2, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l7	! %l7 = 000000008454d0b2
!	Mem[00000000100c1400] = 1e00ffff, %f30 = ff1eb9ff
	lda	[%i3+%g0]0x88,%f30	! %f30 = 1e00ffff
!	%l4 = 0000004c, %l5 = 84548111, Mem[0000000010041408] = 0000004b f3600000
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000004c 84548111
!	Mem[0000000010001408] = ff00000000000000, %f16 = ca4c7d8a ffffffff
	ldda	[%i0+%o4]0x80,%f16	! %f16 = ff000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081434] = 00000000, %l0 = ffffffffffff81ff, %asi = 80
	swapa	[%i2+0x034]%asi,%l0	! %l0 = 0000000000000000

p0_label_390:
!	%l0 = 00000000, %l1 = 0000ff00, Mem[0000000010081428] = ffffffff ffffffff
	stda	%l0,[%i2+0x028]%asi	! Mem[0000000010081428] = 00000000 0000ff00
	membar	#Sync			! Added by membar checker (69)
!	%f22 = c1e86f1e 20000000, Mem[00000000100c1420] = 7237118d 5aaab430
	stda	%f22,[%i3+0x020]%asi	! Mem[00000000100c1420] = c1e86f1e 20000000
!	%l3 = 00000000000000ff, Mem[0000000030181408] = 1181548400000000
	stxa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000ff
!	Mem[0000000010041410] = c1e86f1e, %l2 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l2	! %l2 = 0000001e000000ff
!	%l6 = 00000000, %l7 = 8454d0b2, Mem[0000000030181408] = 000000ff 00000000
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 8454d0b2
!	Mem[0000000030101400] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[000000001004141c] = 000000ff, %l1 = 000000000000ff00, %asi = 80
	swapa	[%i1+0x01c]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101428] = bfff00ff00000000, %l6 = 0000000000000000, %l3 = 0000000000000000
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = bfff00ff00000000
!	Mem[0000000010181414] = 00000000, %l4 = 0000004c, %l0 = 00000000
	add	%i6,0x14,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffffffff, %l3 = bfff00ff00000000
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffffff

p0_label_391:
!	Mem[0000000030001400] = 0000000000000011, %l4 = 000000000000004c
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000011
!	Mem[0000000010181400] = ffffffff, %l1 = 00000000000000ff
	lduba	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l5 = 0000000084548111
	ldswa	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = 8a7d4cff, %l2 = 000000000000001e
	lduha	[%i2+%o4]0x89,%l2	! %l2 = 0000000000004cff
!	Mem[00000000100c1410] = 00000000fe000000, %l6 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l6	! %l6 = 00000000fe000000
!	%l3 = ffffffffffffffff, %l1 = 00000000000000ff, %l0 = 0000000000000000
	xnor	%l3,%l1,%l0		! %l0 = 00000000000000ff
!	Mem[00000000201c0000] = 00117d80, %l2 = 0000000000004cff
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000011
!	%l0 = 00000000000000ff, %l5 = 0000000000000000, %l2 = 0000000000000011
	xnor	%l0,%l5,%l2		! %l2 = ffffffffffffff00
!	Mem[0000000010041400] = 31f7bf47e247debb, %l0 = 00000000000000ff
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = 31f7bf47e247debb
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000010041408] = 0000004c
	stwa	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff

p0_label_392:
!	Mem[0000000010001434] = 00000063, %l7 = 8454d0b2, %l0 = e247debb
	add	%i0,0x34,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 0000000000000063
!	%l7 = 000000008454d0b2, Mem[0000000010181410] = 84548111
	stba	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 845481b2
!	%l5 = 0000000000000000, Mem[0000000030081408] = 8a7d4cff
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	Mem[0000000010081410] = 00ff0000, %l7 = 000000008454d0b2
	swap	[%i2+%o5],%l7		! %l7 = 0000000000ff0000
!	%f21 = 84548111, Mem[0000000010181408] = 4d61d678
	sta	%f21,[%i6+0x008]%asi	! Mem[0000000010181408] = 84548111
!	%l7 = 0000000000ff0000, Mem[0000000030001400] = 11000000
	stha	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	Mem[0000000010101410] = 00000000, %l3 = ffffffffffffffff
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%f14 = 00000000, %f7  = 84548111, %f23 = 20000000
	fmuls	%f14,%f7 ,%f23		! %f23 = 80000000
!	Mem[0000000010001408] = 000000ff, %l2 = ffffffffffffff00
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_36:
!	%l0 = 0000000000000063
	setx	0xf9fbe7579ce2f58f,%g7,%l0 ! %l0 = f9fbe7579ce2f58f
!	%l1 = 00000000000000ff
	setx	0x1e429207f40a1818,%g7,%l1 ! %l1 = 1e429207f40a1818
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f9fbe7579ce2f58f
	setx	0x1faca3401b5f0409,%g7,%l0 ! %l0 = 1faca3401b5f0409
!	%l1 = 1e429207f40a1818
	setx	0xf80b4337d160f485,%g7,%l1 ! %l1 = f80b4337d160f485

p0_label_393:
!	Mem[0000000030141408] = 00000000, %l5 = 0000000000000000
	lduha	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = ffffffff, %l6 = 00000000fe000000
	lduwa	[%i6+%g0]0x80,%l6	! %l6 = 00000000ffffffff
!	Mem[00000000100c1408] = fe810000, %l4 = 0000000000000011
	ldsha	[%i3+%o4]0x80,%l4	! %l4 = fffffffffffffe81
!	Mem[0000000010181400] = ffffffff, %l3 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l3	! %l3 = 00000000ffffffff
!	Code Fragment 3
p0_fragment_37:
!	%l0 = 1faca3401b5f0409
	setx	0x638b3877fb8a6353,%g7,%l0 ! %l0 = 638b3877fb8a6353
!	%l1 = f80b4337d160f485
	setx	0xebfb4ff805e8faec,%g7,%l1 ! %l1 = ebfb4ff805e8faec
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 638b3877fb8a6353
	setx	0xf98d3c2077bf0cec,%g7,%l0 ! %l0 = f98d3c2077bf0cec
!	%l1 = ebfb4ff805e8faec
	setx	0x323ce447b910cf1b,%g7,%l1 ! %l1 = 323ce447b910cf1b
!	%l5 = 0000000000000000, Mem[00000000100c1410] = 000000fe
	stha	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000fe
!	Mem[00000000100c1410] = fe000000, %l3 = 00000000ffffffff
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 00000000fe000000
!	Mem[00000000100c1408] = fe810000, %l7 = 0000000000ff0000
	ldsha	[%i3+%o4]0x80,%l7	! %l7 = fffffffffffffe81
!	Code Fragment 3
p0_fragment_38:
!	%l0 = f98d3c2077bf0cec
	setx	0x43ef32bfe8845a7c,%g7,%l0 ! %l0 = 43ef32bfe8845a7c
!	%l1 = 323ce447b910cf1b
	setx	0x6363e7d855f6db7c,%g7,%l1 ! %l1 = 6363e7d855f6db7c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 43ef32bfe8845a7c
	setx	0xed5440c7b3ca5101,%g7,%l0 ! %l0 = ed5440c7b3ca5101
!	%l1 = 6363e7d855f6db7c
	setx	0x6ddbd96798970b00,%g7,%l1 ! %l1 = 6ddbd96798970b00
!	Starting 10 instruction Store Burst
!	%l0 = ed5440c7b3ca5101, Mem[0000000010101408] = 000081ff
	stba	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 010081ff

p0_label_394:
!	%l1 = 6ddbd96798970b00, immed = fffff800, %y  = 35e93f8c
	udiv	%l1,-0x800,%l6		! %l6 = 0000000035e9413b
	mov	%l0,%y			! %y = b3ca5101
!	Mem[0000000010001410] = 00000c49, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%f18 = 00000000, %f5  = 00000000, %f19 = ffffffff
	fadds	%f18,%f5 ,%f19		! %f19 = 00000000
!	%f21 = 84548111, Mem[000000001004143c] = 000000ff
	st	%f21,[%i1+0x03c]	! Mem[000000001004143c] = 84548111
!	%f30 = 1e00ffff 00000000, %l7 = fffffffffffffe81
!	Mem[0000000030101410] = 00d11ad3e247debb
	add	%i4,0x010,%g1
	stda	%f30,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030101410] = 00001ad3e247debb
!	%f0  = ffff001e 0000001e, Mem[0000000030041400] = 0000ff00 00000011
	stda	%f0 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ffff001e 0000001e
!	Mem[0000000030141410] = ff000000, %l3 = 00000000fe000000
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000ff000000
!	%f13 = 0000004b, Mem[0000000010141430] = 8ec1195f
	st	%f13,[%i5+0x030]	! Mem[0000000010141430] = 0000004b
!	Mem[0000000010001408] = ff000000, %l4 = fffffffffffffe81
	swapa	[%i0+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = d31a0000, %l5 = 0000000000000000
	lduha	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000

p0_label_395:
!	Mem[00000000300c1408] = ff0000ff, %l6 = 0000000035e9413b
	lduha	[%i3+%o4]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010141400] = b2d05484e9b90000, %f18 = 00000000 00000000
	ldda	[%i5+%g0]0x80,%f18	! %f18 = b2d05484 e9b90000
!	Mem[00000000100c1404] = 0000001e, %l7 = fffffffffffffe81
	lduba	[%i3+0x007]%asi,%l7	! %l7 = 000000000000001e
!	Mem[0000000021800000] = 1effba26, %l7 = 000000000000001e
	ldsha	[%o3+0x000]%asi,%l7	! %l7 = 0000000000001eff
!	Mem[0000000030101410] = bbde47e2d31a0000, %f4  = 000000fe 00000000
	ldda	[%i4+%o5]0x89,%f4 	! %f4  = bbde47e2 d31a0000
!	Mem[000000001000141c] = ffb9d0b2, %l5 = 0000000000000000
	ldsh	[%i0+0x01c],%l5		! %l5 = ffffffffffffffb9
!	Mem[0000000030181400] = ffff0000, %l0 = ed5440c7b3ca5101
	lduba	[%i6+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l6 = 000000000000ff00
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 000081fe, %l3 = 00000000ff000000
	ldsha	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffff81fe
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ff000000, %l6 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l6	! %l6 = 00000000ff000000

p0_label_396:
!	%l5 = ffffffffffffffb9, Mem[0000000030041410] = 0000ff00
	stba	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000ffb9
!	%l7 = 0000000000001eff, imm = 000000000000086c, %l7 = 0000000000001eff
	xor	%l7,0x86c,%l7		! %l7 = 0000000000001693
!	%f26 = 47bff731, Mem[0000000030181408] = 00000000
	sta	%f26,[%i6+%o4]0x81	! Mem[0000000030181408] = 47bff731
!	%f3  = ff0000ff, Mem[0000000010081408] = ff000000
	sta	%f3 ,[%i2+%o4]0x88	! Mem[0000000010081408] = ff0000ff
!	%l7 = 0000000000001693, immed = fffff42c, %y  = b3ca5101
	smul	%l7,-0xbd4,%l0		! %l0 = fffffffffef4fd44, %y = ffffffff
!	Mem[0000000030081400] = 00000000, %l5 = ffffffffffffffb9
	ldstuba	[%i2+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001410] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010001408] = fffffe81
	stba	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = fffffe81
!	%f18 = b2d05484 e9b90000, %l6 = 00000000ff000000
!	Mem[0000000010181420] = 0aba72be34abf64c
	add	%i6,0x020,%g1
	stda	%f18,[%g1+%l6]ASI_PST8_P ! Mem[0000000010181420] = 0aba72be34abf64c
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ca4c7d8affffffff, %f20 = 00000000 84548111
	ldda	[%i6+%g0]0x88,%f20	! %f20 = ca4c7d8a ffffffff

p0_label_397:
!	Mem[0000000010181400] = ffffffff, %l3 = ffffffffffff81fe
	lduwa	[%i6+%g0]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030041400] = ffff001e, %l6 = 00000000ff000000
	ldsba	[%i1+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = 00ff7f1a, %l3 = 00000000ffffffff
	ldsba	[%o2+0x001]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101408] = 0000ff21 ff810001, %l0 = fef4fd44, %l1 = 98970b00
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 00000000ff810001 000000000000ff21
!	Mem[0000000010001400] = 00000000 8a7d4c81, %l4 = ff000000, %l5 = 000000ff
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 000000008a7d4c81 0000000000000000
	membar	#Sync			! Added by membar checker (70)
!	Mem[0000000030101400] = ff0000ff cb000000 00000000 000000d3
!	Mem[0000000030101410] = 00001ad3 e247debb 3988957a d31ad138
!	Mem[0000000030101420] = bbde47e2 ffff0000 ca4c7d8a 00000000
!	Mem[0000000030101430] = 84548111 5f19c18e 001e0000 000000ff
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000010101400] = ff000000, %l6 = ffffffffffffffff
	lduha	[%i4+%g0]0x80,%l6	! %l6 = 000000000000ff00
!	Code Fragment 4
p0_fragment_39:
!	%l0 = 00000000ff810001
	setx	0x6e745867e70621b6,%g7,%l0 ! %l0 = 6e745867e70621b6
!	%l1 = 000000000000ff21
	setx	0xb6bd36b00a425192,%g7,%l1 ! %l1 = b6bd36b00a425192
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6e745867e70621b6
	setx	0x9daa25c00c8b7457,%g7,%l0 ! %l0 = 9daa25c00c8b7457
!	%l1 = b6bd36b00a425192
	setx	0x74e4f42068323841,%g7,%l1 ! %l1 = 74e4f42068323841
!	Mem[0000000010041418] = 39887d8a0000ff00, %l4 = 000000008a7d4c81
	ldx	[%i1+0x018],%l4		! %l4 = 39887d8a0000ff00
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000001693, Mem[00000000100c1422] = c1e86f1e, %asi = 80
	stha	%l7,[%i3+0x022]%asi	! Mem[00000000100c1420] = c1e81693

p0_label_398:
!	%f10 = 00000063 00ff0000, Mem[0000000030041400] = 1e00ffff 1e000000
	stda	%f10,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000063 00ff0000
!	Mem[0000000010101427] = 000000d3, %l7 = 0000000000001693
	ldstub	[%i4+0x027],%l7		! %l7 = 000000d3000000ff
!	%l1 = 74e4f42068323841, Mem[0000000020800040] = 00ff2c25
	stb	%l1,[%o1+0x040]		! Mem[0000000020800040] = 41ff2c25
!	Mem[0000000030041408] = 00004584, %l4 = 39887d8a0000ff00
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 0000000000004584
!	Mem[0000000030041410] = 0000ffb9, %l6 = 000000000000ff00
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 000000b9000000ff
!	%l0 = 0c8b7457, %l1 = 68323841, Mem[00000000100c1410] = 000000fe 00000000
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0c8b7457 68323841
!	%l6 = 00000000000000b9, Mem[0000000010141408] = 00000000
	stwa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000b9
!	%f12 = 00000000 0000004b, %l1 = 74e4f42068323841
!	Mem[0000000010041400] = 31f7bf47e247debb
	stda	%f12,[%i1+%l1]ASI_PST32_P ! Mem[0000000010041400] = 31f7bf470000004b
	membar	#Sync			! Added by membar checker (71)
!	%l0 = 9daa25c00c8b7457, Mem[0000000030101410] = 00001ad3
	stwa	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 0c8b7457
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 010081ff, %l4 = 0000000000004584
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000100

p0_label_399:
!	Mem[0000000010081400] = 000000ff, %l0 = 9daa25c00c8b7457
	ldsha	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001400] = 00000000, %l2 = 00000000000000ff
	lduha	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 0000ff00, %l7 = 00000000000000d3
	ldsha	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001430] = 00000000 00000063, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i0+0x030]%asi,%l2	! %l2 = 0000000000000000 0000000000000063
!	%f7  = 84548111, %f15 = 7fffffff, %f29 = 5f19c18e
	fsubs	%f7 ,%f15,%f29		! %f29 = 7fffffff
!	Mem[0000000010181400] = ffffffff 8a7d4cca, %l4 = 00000100, %l5 = 00000000
	ldda	[%i6+%g0]0x80,%l4	! %l4 = 00000000ffffffff 000000008a7d4cca
!	Mem[00000000100c1410] = 0c8b7457, %l4 = 00000000ffffffff
	lduwa	[%i3+%o5]0x80,%l4	! %l4 = 000000000c8b7457
!	Mem[0000000010141434] = 00000063, %l6 = 00000000000000b9
	ldswa	[%i5+0x034]%asi,%l6	! %l6 = 0000000000000063
!	Mem[0000000010041410] = c1e86fff, %l5 = 000000008a7d4cca
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 00000000c1e86fff
!	Starting 10 instruction Store Burst
!	%l4 = 000000000c8b7457, Mem[0000000030181408] = 31f7bf47
	stba	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 31f7bf57

p0_label_400:
!	Mem[0000000030101410] = 0c8b7457, %l6 = 0000000000000063
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 0000000c000000ff
!	%l2 = 00000000, %l3 = 00000063, Mem[00000000300c1408] = ff0000ff 0000ff00
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 00000063
!	%l0 = 00000000000000ff, Mem[00000000300c1408] = 00000000
	stba	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000
!	%l4 = 0c8b7457, %l5 = c1e86fff, Mem[0000000010181428] = 0000ff21 e9b981ff
	stda	%l4,[%i6+0x028]%asi	! Mem[0000000010181428] = 0c8b7457 c1e86fff
!	%f0  = ffff001e 0000001e, %l4 = 000000000c8b7457
!	Mem[0000000030101430] = 845481115f19c18e
	add	%i4,0x030,%g1
	stda	%f0,[%g1+%l4]ASI_PST8_S ! Mem[0000000030101430] = 84ff811e5f00001e
!	Mem[0000000030081408] = 00000000, %l1 = 74e4f42068323841
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081408] = 000000ff, %l7 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010001410] = 490c00ff
	stba	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 490c00ff
!	%l6 = 000000000000000c, Mem[0000000021800040] = 1a00487b
	sth	%l6,[%o3+0x040]		! Mem[0000000021800040] = 000c487b
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff000000, %l6 = 000000000000000c
	ldsha	[%i2+%o5]0x81,%l6	! %l6 = ffffffffffffff00

p0_label_401:
!	Mem[0000000030001408] = ffffffff, %l2 = 0000000000000000
	lduba	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181414] = 00000000, %l7 = 00000000000000ff
	lduh	[%i6+0x014],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141410] = 8a7d0000, %l1 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%l5 = 00000000c1e86fff, %l6 = ffffffffffffff00, %y  = ffffffff
	sdiv	%l5,%l6,%l3		! %l3 = 00000000003e1790
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000030141410] = fe000000, %l2 = 00000000000000ff
	ldsba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = debb00001e001aff, %l3 = 00000000003e1790
	ldxa	[%i5+%g0]0x89,%l3	! %l3 = debb00001e001aff
!	Mem[0000000030181410] = ff610000, %f26 = ca4c7d8a
	lda	[%i6+%o5]0x89,%f26	! %f26 = ff610000
!	%f16 = ff0000ff cb000000, %f11 = 00ff0000
	fdtos	%f16,%f11		! %f11 = ff800000
!	%l5 = 00000000c1e86fff, %l4 = 000000000c8b7457, %l2 = 0000000000000000
	xnor	%l5,%l4,%l2		! %l2 = ffffffff329ce457
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000030181410] = 000061ff
	stba	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = ff0061ff

p0_label_402:
!	%l7 = 0000000000000000, Mem[0000000010041414] = 0000ff00, %asi = 80
	stwa	%l7,[%i1+0x014]%asi	! Mem[0000000010041414] = 00000000
!	Mem[0000000030181408] = 57bff731, %l7 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l7	! %l7 = 0000000057bff731
!	%l7 = 0000000057bff731, Mem[0000000010141400] = b2d05484e9b90000
	stx	%l7,[%i5+%g0]		! Mem[0000000010141400] = 0000000057bff731
!	Mem[0000000030081410] = ff000000, %l3 = debb00001e001aff
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	%f29 = 7fffffff, Mem[000000001010140c] = 21ff0000
	sta	%f29,[%i4+0x00c]%asi	! Mem[000000001010140c] = 7fffffff
!	%f7  = 84548111, %f14 = 00000000
	fsqrts	%f7 ,%f14		! %f14 = 7fffffff
!	%f16 = ff0000ff, Mem[0000000010181408] = 84548111
	sta	%f16,[%i6+%o4]0x80	! Mem[0000000010181408] = ff0000ff
!	%f28 = 84548111 7fffffff, %l6 = ffffffffffffff00
!	Mem[0000000010101418] = ffffffaa00000061
	add	%i4,0x018,%g1
	stda	%f28,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010101418] = ffffffaa00000061
!	%f28 = 84548111 7fffffff, %l5 = 00000000c1e86fff
!	Mem[0000000030141410] = 000000fe11815484
	add	%i5,0x010,%g1
	stda	%f28,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030141410] = ffffff7f11815484
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = b2815484, %l5 = 00000000c1e86fff
	ldsha	[%i6+0x012]%asi,%l5	! %l5 = 0000000000005484

p0_label_403:
!	Mem[0000000030141408] = 00000000 8d113772, %l2 = 329ce457, %l3 = ff000000
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000 000000008d113772
!	Mem[0000000030101408] = d3000000 00000000, %l4 = 0c8b7457, %l5 = 00005484
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000 00000000d3000000
!	%l5 = 00000000d3000000, Mem[0000000030101408] = 00000000
	stwa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = d3000000
!	Mem[0000000010141410] = 00007d8a 00000000, %l2 = 00000000, %l3 = 8d113772
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 0000000000007d8a 0000000000000000
!	Mem[0000000010101410] = ffffffff, %f0  = ffff001e
	lda	[%i4+%o5]0x88,%f0 	! %f0 = ffffffff
!	Mem[0000000010081408] = ff0000ff00000000, %l5 = 00000000d3000000
	ldxa	[%i2+%o4]0x80,%l5	! %l5 = ff0000ff00000000
!	Mem[0000000030181400] = ffff0000 0000ffff, %l2 = 00007d8a, %l3 = 00000000
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 000000000000ffff 00000000ffff0000
!	Mem[0000000030181410] = ff0061ff, %l3 = 00000000ffff0000
	ldsba	[%i6+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041400] = 0000ff0063000000, %f18 = 00000000 000000d3
	ldda	[%i1+%g0]0x81,%f18	! %f18 = 0000ff00 63000000
!	Starting 10 instruction Store Burst
!	%f15 = 7fffffff, Mem[0000000010141400] = 00000000
	sta	%f15,[%i5+%g0]0x88	! Mem[0000000010141400] = 7fffffff

p0_label_404:
!	%l2 = 000000000000ffff, Mem[00000000100c1400] = 1e00ffff
	stwa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000ffff
!	%l1 = 0000000000000000, Mem[0000000010081410] = 8454d0b2
	stha	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000d0b2
!	%f16 = ff0000ff cb000000, %l0 = 00000000000000ff
!	Mem[0000000010141430] = 0000004b00000063
	add	%i5,0x030,%g1
	stda	%f16,[%g1+%l0]ASI_PST32_P ! Mem[0000000010141430] = ff0000ffcb000000
!	Mem[0000000010041400] = 31f7bf47, %l2 = 000000000000ffff
	ldstub	[%i1+%g0],%l2		! %l2 = 00000031000000ff
!	%l2 = 00000031, %l3 = ffffffff, Mem[0000000030101400] = ff0000ff 000000cb
	stda	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000031 ffffffff
!	%f16 = ff0000ff cb000000 0000ff00 63000000
!	%f20 = 00001ad3 e247debb 3988957a d31ad138
!	%f24 = bbde47e2 ffff0000 ff610000 00000000
!	%f28 = 84548111 7fffffff 001e0000 000000ff
	stda	%f16,[%i3]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	%l7 = 0000000057bff731, Mem[0000000010001420] = 0000ffebff000121, %asi = 80
	stxa	%l7,[%i0+0x020]%asi	! Mem[0000000010001420] = 0000000057bff731
!	%f5  = d31a0000, Mem[0000000030101410] = ff8b7457
	sta	%f5 ,[%i4+%o5]0x81	! Mem[0000000030101410] = d31a0000
!	Mem[0000000021800181] = ff00c5c1, %l6 = ffffffffffffff00
	ldstub	[%o3+0x181],%l6		! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (72)
!	Mem[00000000300c1400] = ff0000ffcb000000, %f8  = 7237118d 5aaab430
	ldda	[%i3+%g0]0x81,%f8 	! %f8  = ff0000ff cb000000

p0_label_405:
!	Mem[00000000100c1400] = 1e000000 0000ffff, %l2 = 00000031, %l3 = ffffffff
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 000000000000ffff 000000001e000000
!	Mem[00000000211c0000] = 00ff7f1a, %l2 = 000000000000ffff
	ldsb	[%o2+0x001],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010101408] = 010081ff, %l3 = 000000001e000000
	lduh	[%i4+%o4],%l3		! %l3 = 0000000000000100
!	Mem[00000000100c1410] = 57748b0c, %l6 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l6	! %l6 = ffffffffffff8b0c
!	Mem[0000000010081410] = 0000d0b2, %l3 = 0000000000000100
	ldsha	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = ffffff7f57bff731, %f16 = ff0000ff cb000000
	ldda	[%i5+%g0]0x80,%f16	! %f16 = ffffff7f 57bff731
!	Mem[0000000030041408] = 00ff0000, %l0 = 00000000000000ff
	ldswa	[%i1+%o4]0x81,%l0	! %l0 = 0000000000ff0000
!	Mem[00000000300c1408] = 0000ff00, %l4 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l5 = ff0000ff00000000, %l3 = 0000000000000000, %l0 = 0000000000ff0000
	xnor	%l5,%l3,%l0		! %l0 = 00ffff00ffffffff
!	Starting 10 instruction Store Burst
!	%l6 = ffff8b0c, %l7 = 57bff731, Mem[0000000010041408] = 00000000 84548111
	stda	%l6,[%i1+0x008]%asi	! Mem[0000000010041408] = ffff8b0c 57bff731

p0_label_406:
!	%l1 = 0000000000000000, Mem[0000000010081438] = ffffffb6ffb91eff
	stx	%l1,[%i2+0x038]		! Mem[0000000010081438] = 0000000000000000
!	Code Fragment 3
p0_fragment_40:
!	%l0 = 00ffff00ffffffff
	setx	0xa1fd74dfa0fe872f,%g7,%l0 ! %l0 = a1fd74dfa0fe872f
!	%l1 = 0000000000000000
	setx	0xede9a207b0560117,%g7,%l1 ! %l1 = ede9a207b0560117
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a1fd74dfa0fe872f
	setx	0x1e39551fd7867cba,%g7,%l0 ! %l0 = 1e39551fd7867cba
!	%l1 = ede9a207b0560117
	setx	0x970d35d830a29302,%g7,%l1 ! %l1 = 970d35d830a29302
!	%l2 = ffffffffffffffff, %l2 = ffffffffffffffff, %l2  = ffffffffffffffff
	mulx	%l2,%l2,%l2		! %l2 = 0000000000000001
!	%l6 = ffffffffffff8b0c, Mem[0000000030181408] = 00000000
	stwa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = ffff8b0c
!	%l6 = ffffffffffff8b0c, Mem[0000000030141400] = ff1a001e0000bbde
	stxa	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffffffff8b0c
!	Mem[0000000030181408] = ffff8b0c, %l6 = ffffffffffff8b0c
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	%l1 = 970d35d830a29302, Mem[0000000010141434] = cb000000
	sth	%l1,[%i5+0x034]		! Mem[0000000010141434] = 93020000
!	%f16 = ffffff7f 57bff731, %l3 = 0000000000000000
!	Mem[00000000300c1418] = 3988957ad31ad138
	add	%i3,0x018,%g1
	stda	%f16,[%g1+%l3]ASI_PST32_SL ! Mem[00000000300c1418] = 3988957ad31ad138
!	%l6 = 00000000000000ff, Mem[0000000020800000] = 110016cb
	sth	%l6,[%o1+%g0]		! Mem[0000000020800000] = 00ff16cb
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0000000000000000, %l1 = 970d35d830a29302
	ldxa	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000

p0_label_407:
!	Mem[0000000010081410] = 0000d0b2c1e86f1e, %f2  = fe810000 ff0000ff
	ldda	[%i2+%o5]0x80,%f2 	! %f2  = 0000d0b2 c1e86f1e
!	Mem[00000000300c1408] = 0000ff00, %f5  = d31a0000
	lda	[%i3+%o4]0x81,%f5 	! %f5 = 0000ff00
!	Mem[0000000010081410] = 0000d0b2, %l0 = 1e39551fd7867cba
	lduwa	[%i2+%o5]0x80,%l0	! %l0 = 000000000000d0b2
!	Code Fragment 4
p0_fragment_41:
!	%l0 = 000000000000d0b2
	setx	0xaf685ee7bffb0d6e,%g7,%l0 ! %l0 = af685ee7bffb0d6e
!	%l1 = 0000000000000000
	setx	0x38152d486c297260,%g7,%l1 ! %l1 = 38152d486c297260
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = af685ee7bffb0d6e
	setx	0x3e7dd81f85191519,%g7,%l0 ! %l0 = 3e7dd81f85191519
!	%l1 = 38152d486c297260
	setx	0xaaf0170f83129082,%g7,%l1 ! %l1 = aaf0170f83129082
!	Mem[0000000010141410] = 8a7d0000, %f8  = ff0000ff
	lda	[%i5+%o5]0x88,%f8 	! %f8 = 8a7d0000
!	Mem[0000000030041408] = 0000ff00, %l5 = ff0000ff00000000
	lduba	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = 0c8bffff, %l6 = 00000000000000ff
	ldswa	[%i6+%o4]0x89,%l6	! %l6 = 000000000c8bffff
!	Mem[0000000030181410] = ff0061ff ffffffff, %l0 = 85191519, %l1 = 83129082
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 00000000ff0061ff 00000000ffffffff
!	Mem[000000001004142c] = 00630000, %l0 = 00000000ff0061ff
	lduha	[%i1+0x02e]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 0000ff00, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 00000000000000ff

p0_label_408:
!	%l2 = 0000000000000001, Mem[0000000010141410] = 00007d8a
	stba	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 01007d8a
!	%l2 = 00000001, %l3 = 00000000, Mem[00000000100c1400] = ffff0000 0000001e
	stda	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000001 00000000
!	%l0 = 0000000000000000, Mem[0000000030181408] = ffff8b0cb2d05484
	stxa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%l2 = 0000000000000001, Mem[00000000201c0000] = 00117d80
	stb	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 01117d80
!	%l7 = 0000000057bff731, Mem[0000000030101408] = 000000d3
	stwa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 57bff731
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000100c1400] = 00000001 00000000
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 00000000
!	Mem[0000000010081438] = 00000000, %l2 = 0000000000000001
	ldstub	[%i2+0x038],%l2		! %l2 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010101408] = 010081ff
	stha	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 000081ff
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_42:
!	%l0 = 0000000000000000
	setx	0xef8ad20ff09b18a4,%g7,%l0 ! %l0 = ef8ad20ff09b18a4
!	%l1 = 00000000ffffffff
	setx	0x1c4e5b5ff4d34e3d,%g7,%l1 ! %l1 = 1c4e5b5ff4d34e3d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ef8ad20ff09b18a4
	setx	0xbddedfd7e2aefe19,%g7,%l0 ! %l0 = bddedfd7e2aefe19
!	%l1 = 1c4e5b5ff4d34e3d
	setx	0x0024f1a07754ffb7,%g7,%l1 ! %l1 = 0024f1a07754ffb7

p0_label_409:
!	Mem[00000000100c1408] = fe810000 ff0000ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 00000000fe810000 00000000ff0000ff
!	%l6 = 000000000c8bffff, %l5 = 0000000000000000, %y  = 000000ff
	udiv	%l6,%l5,%l6		! Div by zero, %l0 = bddedfd7e2aefe69
	mov	%l0,%y			! %y = e2aefe41
!	Mem[0000000010081410] = 0000d0b2 c1e86f1e, %l2 = fe810000, %l3 = ff0000ff
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 000000000000d0b2 00000000c1e86f1e
!	Mem[0000000030101410] = 00001ad3, %l6 = 000000000c8bffff
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = 0000000000001ad3
!	Mem[0000000010181430] = 00000000, %l3 = 00000000c1e86f1e
	lduha	[%i6+0x030]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = ff0000ff, %f22 = 3988957a
	lda	[%i2+%o4]0x88,%f22	! %f22 = ff0000ff
!	Mem[00000000300c1410] = 00001ad3e247debb, %l6 = 0000000000001ad3
	ldxa	[%i3+%o5]0x81,%l6	! %l6 = 00001ad3e247debb
!	Mem[0000000030041400] = 0000ff00, %l3 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l3	! %l3 = 000000000000ff00
	membar	#Sync			! Added by membar checker (73)
!	Mem[0000000030181400] = ffff0000 0000ffff 00000000 00000000
!	Mem[0000000030181410] = ff0061ff ffffffff cbeb0000 0607b66f
!	Mem[0000000030181420] = bbde47e2 47bff731 8d113772 bf4f0423
!	Mem[0000000030181430] = 84548111 5f19c18e 090a4565 760a88ad
	ldda	[%i6]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030181400
!	Starting 10 instruction Store Burst
!	%f19 = 63000000, %f18 = 0000ff00, %f19 = 63000000
	fdivs	%f19,%f18,%f19		! %f19 = 7f800000

p0_label_410:
!	%f21 = e247debb, Mem[00000000100c1418] = 000000ca
	st	%f21,[%i3+0x018]	! Mem[00000000100c1418] = e247debb
!	%l7 = 0000000057bff731, Mem[0000000010181400] = ca4c7d8affffffff
	stxa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000057bff731
!	%l2 = 0000d0b2, %l3 = 0000ff00, Mem[0000000010101410] = ffffffff 8a7d4cca
	stda	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000d0b2 0000ff00
!	%l0 = e2aefe41, %l1 = 7754ffb7, Mem[0000000010001400] = 814c7d8a 00000000
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = e2aefe41 7754ffb7
!	Mem[0000000010081400] = 000000ff, %l0 = bddedfd7e2aefe41
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%f26 = ff610000 00000000, Mem[0000000030041408] = 00ff0000 5f00ff21
	stda	%f26,[%i1+%o4]0x81	! Mem[0000000030041408] = ff610000 00000000
!	%f20 = 00001ad3 e247debb, %l7 = 0000000057bff731
!	Mem[0000000010181408] = ff0000ff18e47627
	add	%i6,0x008,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_P ! Mem[0000000010181408] = ff001ad318e476bb
!	Mem[000000001018141c] = 0000c18e, %l5 = 0000000000000000, %asi = 80
	swapa	[%i6+0x01c]%asi,%l5	! %l5 = 000000000000c18e
!	Mem[0000000010141400] = ffffff7f, %l7 = 0000000057bff731
	swapa	[%i5+%g0]0x80,%l7	! %l7 = 00000000ffffff7f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 0000ff00, %l2 = 000000000000d0b2
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_411:
!	%f19 = 7f800000, %f26 = ff610000, %f21 = e247debb
	fdivs	%f19,%f26,%f21		! %f21 = ff800000
!	Mem[0000000010081400] = e2aefe41, %l5 = 000000000000c18e
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 000000000000fe41
!	Mem[0000000030141408] = 7237118d 00000000, %l2 = 00000000, %l3 = 0000ff00
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000 000000007237118d
!	Mem[0000000030001408] = ffffffff, %l4 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000021800180] = ffffc5c1, %l3 = 000000007237118d
	lduha	[%o3+0x180]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010181408] = ff001ad3, %l3 = 000000000000ffff
	lduha	[%i6+0x00a]%asi,%l3	! %l3 = 0000000000001ad3
!	Mem[0000000010141408] = 000000b9 0000001e, %l6 = e247debb, %l7 = ffffff7f
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 00000000000000b9 000000000000001e
!	Mem[0000000030001410] = ff000000, %l0 = 00000000000000ff
	ldsba	[%i0+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041410] = 00000000c1e86fff, %f20 = 00001ad3 ff800000
	ldda	[%i1+%o5]0x88,%f20	! %f20 = 00000000 c1e86fff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000001ad3, Mem[00000000211c0000] = 00ff7f1a, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 1ad37f1a

p0_label_412:
!	Mem[0000000010181400] = 57bff731, %l4 = 00000000ffffffff
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 00000031000000ff
!	Mem[000000001010142c] = 00000000, %l4 = 0000000000000031
	swap	[%i4+0x02c],%l4		! %l4 = 0000000000000000
!	Mem[0000000010041410] = c1e86fff, %l7 = 000000000000001e
	swapa	[%i1+%o5]0x88,%l7	! %l7 = 00000000c1e86fff
!	%f22 = ff0000ff d31ad138, Mem[0000000010041408] = ffff8b0c 57bff731
	stda	%f22,[%i1+%o4]0x80	! Mem[0000000010041408] = ff0000ff d31ad138
!	%l4 = 0000000000000000, Mem[0000000030141410] = 845481117fffffff
	stxa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	%l1 = 0024f1a07754ffb7, Mem[0000000010101400] = 000000ff
	stha	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000ffb7
!	Mem[0000000030041410] = ffff0000, %l2 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010041408] = ff0000ff, %l6 = 00000000000000b9
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000010141408] = b9000000, %l7 = 00000000c1e86fff
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 00000000b9000000
!	Starting 10 instruction Load Burst
!	%f16 = ffffff7f, %f16 = ffffff7f
	fcmps	%fcc3,%f16,%f16		! %fcc3 = 3

p0_label_413:
!	Mem[0000000010001410] = ff000c49c02d4825, %f26 = ff610000 00000000
	ldda	[%i0+%o5]0x80,%f26	! %f26 = ff000c49 c02d4825
!	Mem[0000000010181410] = 845481b2, %l7 = 00000000b9000000
	lduwa	[%i6+%o5]0x88,%l7	! %l7 = 00000000845481b2
!	Mem[0000000020800000] = 00ff16cb, %l2 = 00000000000000ff
	ldsh	[%o1+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000021800040] = 000c487b, %l2 = 00000000000000ff
	lduh	[%o3+0x040],%l2		! %l2 = 000000000000000c
!	Mem[0000000030001400] = 0000000000000000, %f16 = ffffff7f 57bff731
	ldda	[%i0+%g0]0x81,%f16	! %f16 = 00000000 00000000
!	Mem[0000000010181400] = 57bff7ff, %l2 = 000000000000000c
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 0000000057bff7ff
!	Mem[0000000030081408] = 00000000, %l6 = 00000000ff0000ff
	lduha	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = 1ad37f1a, %l5 = 000000000000fe41
	ldsba	[%o2+0x000]%asi,%l5	! %l5 = 000000000000001a
!	Mem[0000000030181400] = 0000ffff, %l6 = 0000000000000000
	lduha	[%i6+%g0]0x89,%l6	! %l6 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f2  = 00000000 00000000, Mem[0000000010001400] = 41feaee2 b7ff5477
	stda	%f2 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 00000000

p0_label_414:
!	%f6  = 6fb60706 0000ebcb, Mem[0000000010141400] = 31f7bf57 31f7bf57
	stda	%f6 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 6fb60706 0000ebcb
!	%l1 = 0024f1a07754ffb7, %l7 = 00000000845481b2, %l7 = 00000000845481b2
	xor	%l1,%l7,%l7		! %l7 = 0024f1a0f3007e05
!	%l5 = 000000000000001a, Mem[0000000030001400] = 00000000
	stwa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000001a
!	%l6 = 000000000000ffff, imm = fffffffffffffcad, %l5 = 000000000000001a
	addc	%l6,-0x353,%l5		! %l5 = 000000000000fcac
!	%f24 = bbde47e2, Mem[0000000030001408] = ffffffff
	sta	%f24,[%i0+%o4]0x81	! Mem[0000000030001408] = bbde47e2
!	%l2 = 0000000057bff7ff, Mem[0000000010041410] = 0000001e
	stwa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 57bff7ff
!	Mem[0000000010181400] = 57bff7ff, %l0 = ffffffffffffffff
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 0000000057bff7ff
!	Mem[00000000201c0001] = 01117d80, %l6 = 000000000000ffff
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 00000011000000ff
!	%l6 = 00000011, %l7 = f3007e05, Mem[0000000030081410] = 1e001aff 63000000
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000011 f3007e05
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0000000000000000, %f4  = ffffffff ff6100ff
	ldda	[%i2+%o4]0x81,%f4 	! %f4  = 00000000 00000000

p0_label_415:
!	%f15 = 65450a09, %f14 = ad880a76, %f12 = 8ec1195f
	fdivs	%f15,%f14,%f12		! %f12 = f7396499
!	Mem[0000000030181400] = 0000ffff, %f10 = 23044fbf
	lda	[%i6+%g0]0x89,%f10	! %f10 = 0000ffff
!	Mem[0000000030001408] = ffffffffe247debb, %l4 = 0000000000000000
	ldxa	[%i0+%o4]0x89,%l4	! %l4 = ffffffffe247debb
!	Mem[0000000010101408] = 000081ff7fffffff, %l6 = 0000000000000011
	ldxa	[%i4+%o4]0x80,%l6	! %l6 = 000081ff7fffffff
!	Mem[0000000010101408] = 000081ff7fffffff, %l5 = 000000000000fcac
	ldxa	[%i4+0x008]%asi,%l5	! %l5 = 000081ff7fffffff
!	Mem[0000000010041408] = 000000b9, %l6 = 000081ff7fffffff
	ldswa	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000b9
!	Mem[0000000030141408] = 00000000, %l3 = 0000000000001ad3
	lduba	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = 47bff7ff, %l1 = 0024f1a07754ffb7
	ldsba	[%i1+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101408] = 57bff731, %l1 = ffffffffffffffff
	lduwa	[%i4+%o4]0x81,%l1	! %l1 = 0000000057bff731
!	Starting 10 instruction Store Burst
!	Mem[0000000010041438] = 001e000084548111, %l7 = 0024f1a0f3007e05, %l6 = 00000000000000b9
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = 001e000084548111

p0_label_416:
!	%f2  = 00000000 00000000, Mem[0000000030101408] = 31f7bf57 d3000000
	stda	%f2 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 00000000
!	%l0 = 57bff7ff, %l1 = 57bff731, Mem[0000000010081400] = 41feaee2 00000000
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 57bff7ff 57bff731
!	Mem[0000000010181408] = d31a00ff, %l7 = 0024f1a0f3007e05
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	%l5 = 000081ff7fffffff, Mem[00000000211c0000] = 1ad37f1a
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = ffff7f1a
!	%f18 = 0000ff00 7f800000, %l2 = 0000000057bff7ff
!	Mem[0000000030041420] = 31f7bf47e247debb
	add	%i1,0x020,%g1
	stda	%f18,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030041420] = 0000807f00ff0000
!	%l6 = 001e000084548111, Mem[0000000030081400] = 000000ff
	stha	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 00008111
!	Mem[0000000030001400] = 0000001a, %l1 = 0000000057bff731
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 0000001a000000ff
!	Mem[0000000010081428] = 000000000000ff00, %l1 = 000000000000001a, %l1 = 000000000000001a
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010001408] = 81feffff, %l7 = 00000000000000ff
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 0000000081feffff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 00ff02f2, %l4 = ffffffffe247debb
	ldsb	[%o3+0x141],%l4		! %l4 = ffffffffffffffff

p0_label_417:
!	Mem[00000000300c1400] = ff0000ff cb000000 ff00ff00 63000000
!	Mem[00000000300c1410] = 00001ad3 e247debb 3988957a d31ad138
!	Mem[00000000300c1420] = bbde47e2 ffff0000 ff610000 00000000
!	Mem[00000000300c1430] = 84548111 7fffffff 001e0000 000000ff
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Mem[0000000010141410] = 8a7d0001, %l3 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000001
!	Mem[000000001008141c] = 00000000, %l6 = 001e000084548111
	ldsw	[%i2+0x01c],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001400] = 0000000000000000, %f18 = 0000ff00 7f800000
	ldda	[%i0+%g0]0x80,%f18	! %f18 = 00000000 00000000
!	Mem[00000000300c1400] = ff0000ff, %l6 = 0000000000000000
	lduwa	[%i3+%g0]0x81,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000010141410] = 01007d8a00000000, %f30 = 001e0000 000000ff
	ldda	[%i5+%o5]0x80,%f30	! %f30 = 01007d8a 00000000
!	Mem[00000000300c1408] = 00ff00ff, %f19 = 00000000
	lda	[%i3+%o4]0x89,%f19	! %f19 = 00ff00ff
!	Mem[0000000021800040] = 000c487b, %l3 = 0000000000000001
	ldsba	[%o3+0x040]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = fff7bf470000004b, %f16 = 00000000 00000000
	ldda	[%i1+%g0]0x80,%f16	! %f16 = fff7bf47 0000004b
!	Starting 10 instruction Store Burst
!	%f30 = 01007d8a 00000000, %l3 = 0000000000000000
!	Mem[0000000030101400] = 31000000ffffffff
	stda	%f30,[%i4+%l3]ASI_PST8_SL ! Mem[0000000030101400] = 31000000ffffffff

p0_label_418:
!	Mem[000000001010143c] = 0000ff0a, %l3 = 0000000000000000
	swap	[%i4+0x03c],%l3		! %l3 = 000000000000ff0a
!	%l3 = 000000000000ff0a, Mem[0000000030101410] = d31a0000
	stba	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 0a1a0000
!	%l3 = 000000000000ff0a, Mem[0000000030101408] = 00000000
	stwa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000ff0a
!	%l4 = ffffffffffffffff, Mem[0000000020800041] = 41ff2c25
	stb	%l4,[%o1+0x041]		! Mem[0000000020800040] = 41ff2c25
!	%l5 = 000081ff7fffffff, Mem[00000000100c1428] = 00000063
	stw	%l5,[%i3+0x028]		! Mem[00000000100c1428] = 7fffffff
!	%l3 = 000000000000ff0a, Mem[0000000010101408] = 000081ff
	stha	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = ff0a81ff
!	%l3 = 000000000000ff0a, Mem[00000000211c0001] = ffff7f1a
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = ff0a7f1a
!	%l6 = 00000000ff0000ff, Mem[0000000030141400] = ffffffff
	stha	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = ffff00ff
!	Mem[0000000020800000] = 00ff16cb, %l0 = 0000000057bff7ff
	ldstuba	[%o1+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = d0b26971, %l4 = ffffffffffffffff
	lduba	[%o3+0x101]%asi,%l4	! %l4 = 00000000000000b2

p0_label_419:
!	Mem[0000000030001400] = 000000ff, %l4 = 00000000000000b2
	ldsba	[%i0+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181408] = ff001ad318e476bb, %l7 = 0000000081feffff
	ldxa	[%i6+%o4]0x80,%l7	! %l7 = ff001ad318e476bb
!	%f31 = 00000000, %f27 = c02d4825, %f22 = ff0000ff
	fmuls	%f31,%f27,%f22		! %f22 = 80000000
!	Mem[0000000030001400] = 00000000000000ff, %l4 = ffffffffffffffff
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041410] = 57bff7ff, %l6 = 00000000ff0000ff
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = 0000000057bff7ff
!	Mem[0000000010101408] = ff0a81ff, %l1 = 000000000000ff00
	lduha	[%i4+%o4]0x80,%l1	! %l1 = 000000000000ff0a
!	Mem[00000000100c1410] = 4138326857748b0c, %f26 = ff000c49 c02d4825
	ldda	[%i3+%o5]0x88,%f26	! %f26 = 41383268 57748b0c
!	Mem[0000000030181400] = 0000ffff, %l5 = 000081ff7fffffff
	ldsba	[%i6+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001400] = 000000ff, %f23 = d31ad138
	lda	[%i0+%g0]0x89,%f23	! %f23 = 000000ff
!	Starting 10 instruction Store Burst
!	%f16 = fff7bf47, Mem[0000000010081410] = 0000d0b2
	sta	%f16,[%i2+%o5]0x80	! Mem[0000000010081410] = fff7bf47

p0_label_420:
!	Mem[0000000030101400] = 00000031, %l6 = 0000000057bff7ff
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 00000031000000ff
!	%l6 = 00000031, %l7 = 18e476bb, Mem[0000000010141410] = 8a7d0001 00000000
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000031 18e476bb
!	%f27 = 57748b0c, Mem[0000000010041408] = b9000000
	sta	%f27,[%i1+%o4]0x88	! Mem[0000000010041408] = 57748b0c
!	Mem[000000001008142c] = 0000ff00, %l3 = 000000000000ff0a, %asi = 80
	swapa	[%i2+0x02c]%asi,%l3	! %l3 = 000000000000ff00
!	%f18 = 00000000, Mem[0000000010041408] = 0c8b7457
	st	%f18,[%i1+%o4]		! Mem[0000000010041408] = 00000000
	membar	#Sync			! Added by membar checker (74)
!	%l4 = 00000000000000ff, Mem[0000000030181410] = ffffffffff6100ff
	stxa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000000ff
!	%l5 = ffffffffffffffff, Mem[0000000030101410] = bbde47e200001a0a
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffffffffffff
!	%l7 = ff001ad318e476bb, Mem[00000000300c1410] = 00001ad3
	stha	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 76bb1ad3
!	Code Fragment 3
p0_fragment_43:
!	%l0 = 0000000000000000
	setx	0x7642e9206f0c8d5a,%g7,%l0 ! %l0 = 7642e9206f0c8d5a
!	%l1 = 000000000000ff0a
	setx	0x731a2587f8342542,%g7,%l1 ! %l1 = 731a2587f8342542
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7642e9206f0c8d5a
	setx	0x747089185d680bbe,%g7,%l0 ! %l0 = 747089185d680bbe
!	%l1 = 731a2587f8342542
	setx	0xb6d82c9fd168729b,%g7,%l1 ! %l1 = b6d82c9fd168729b
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 1e6fe8c1 47bff7ff, %l0 = 5d680bbe, %l1 = d168729b
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 0000000047bff7ff 000000001e6fe8c1

p0_label_421:
!	Mem[0000000010141408] = ff6fe8c1 0000001e, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 00000000ff6fe8c1 000000000000001e
!	Mem[0000000021800040] = 000c487b, %l6 = 0000000000000031
	ldsh	[%o3+0x040],%l6		! %l6 = 000000000000000c
!	Mem[00000000100c141c] = 84548111, %l4 = 00000000ff6fe8c1
	lduwa	[%i3+0x01c]%asi,%l4	! %l4 = 0000000084548111
!	Mem[0000000010041430] = 845481115f19c18e, %f30 = 01007d8a 00000000
	ldda	[%i1+0x030]%asi,%f30	! %f30 = 84548111 5f19c18e
!	Mem[0000000010001404] = 00000000, %l4 = 0000000084548111
	ldswa	[%i0+0x004]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = ffffffff, %l1 = 000000001e6fe8c1
	lduba	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = 00000000845481b2, %l2 = 0000000057bff7ff
	ldxa	[%i6+%o5]0x88,%l2	! %l2 = 00000000845481b2
!	Mem[0000000030001410] = ffffff7f000000ff, %f4  = 00001ad3 e247debb
	ldda	[%i0+%o5]0x89,%f4 	! %f4  = ffffff7f 000000ff
!	Mem[0000000030101410] = ffffffff ffffffff, %l4 = 00000000, %l5 = 0000001e
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 00000000ffffffff 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%f10 = ff610000 00000000, Mem[0000000030081410] = 11000000 057e00f3
	stda	%f10,[%i2+%o5]0x89	! Mem[0000000030081410] = ff610000 00000000

p0_label_422:
!	%l4 = ffffffff, %l5 = ffffffff, Mem[0000000010081410] = fff7bf47 c1e86f1e
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffff ffffffff
!	%l6 = 000000000000000c, Mem[00000000300c1400] = ff0000ff
	stwa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000c
!	%f18 = 00000000 00ff00ff, Mem[0000000010081400] = 57bff7ff 57bff731
	stda	%f18,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 00ff00ff
!	Mem[0000000010101408] = ff810aff, %l3 = 000000000000ff00
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 00000000ff810aff
!	Mem[000000001014143a] = 000000ff, %l7 = ff001ad318e476bb
	ldstub	[%i5+0x03a],%l7		! %l7 = 00000000000000ff
!	%l6 = 000000000000000c, Mem[0000000030141410] = 00000000
	stwa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000c
!	%l7 = 0000000000000000, Mem[000000001014143c] = 30b4aa5a
	stw	%l7,[%i5+0x03c]		! Mem[000000001014143c] = 00000000
!	%l4 = ffffffff, %l5 = ffffffff, Mem[0000000030141408] = 00000000 8d113772
	stda	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff ffffffff
!	%f12 = 84548111, %f6  = 3988957a, %f15 = 000000ff
	fmuls	%f12,%f6 ,%f15		! %l0 = 0000000047bff821, Unfinished, %fsr = 3500000400
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff000000, %l5 = 00000000ffffffff
	lduwa	[%i0+%o5]0x81,%l5	! %l5 = 00000000ff000000

p0_label_423:
	membar	#Sync			! Added by membar checker (75)
!	Mem[00000000300c1400] = 0c000000 cb000000 ff00ff00 63000000
!	Mem[00000000300c1410] = 76bb1ad3 e247debb 3988957a d31ad138
!	Mem[00000000300c1420] = bbde47e2 ffff0000 ff610000 00000000
!	Mem[00000000300c1430] = 84548111 7fffffff 001e0000 000000ff
	ldda	[%i3]ASI_BLK_AIUSL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010181438] = 00000000ffb91eff, %f6  = 3988957a d31ad138
	ldda	[%i6+0x038]%asi,%f6 	! %f6  = 00000000 ffb91eff
!	Mem[00000000211c0000] = ff0a7f1a, %l0 = 0000000047bff821
	ldsba	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081428] = 00000000 0000ff0a, %l2 = 845481b2, %l3 = ff810aff
	ldd	[%i2+0x028],%l2		! %l2 = 0000000000000000 000000000000ff0a
!	Mem[0000000030141410] = 0000000c, %l5 = 00000000ff000000
	ldswa	[%i5+%o5]0x89,%l5	! %l5 = 000000000000000c
!	Mem[0000000020800000] = ffff16cb, %l5 = 000000000000000c
	lduba	[%o1+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = ff0000ff00000000, %l1 = 00000000000000ff
	ldx	[%i2+%o4],%l1		! %l1 = ff0000ff00000000
!	Mem[0000000010081408] = ff0000ff, %l6 = 000000000000000c
	lduba	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141400] = ffff00ff, %l3 = 000000000000ff0a
	lduha	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f10 = ff610000 00000000, Mem[0000000030141408] = ffffffff ffffffff
	stda	%f10,[%i5+%o4]0x81	! Mem[0000000030141408] = ff610000 00000000

p0_label_424:
!	Mem[0000000010101410] = 0000d0b2, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l7	! %l7 = 000000000000d0b2
!	%f5  = 000000ff, Mem[0000000030181410] = ff000000
	sta	%f5 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff
!	Mem[0000000010081400] = 00000000, %l4 = 00000000ffffffff
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%f14 = 001e0000, %f10 = ff610000, %f6  = 00000000 ffb91eff
	fsmuld	%f14,%f10,%f6 		! %l0 = 0000000000000021, Unfinished, %fsr = 3500000400
!	%l4 = 0000000000000000, Mem[0000000010141400] = 0000ebcb
	stwa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%f2  = ff00ff00 63000000, %l1 = ff0000ff00000000
!	Mem[0000000010081420] = 93feffff34abf64c
	add	%i2,0x020,%g1
	stda	%f2,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010081420] = 93feffff34abf64c
!	Mem[0000000010101430] = 0000d0b2, %l0 = 00000021, %l5 = 000000ff
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 000000000000d0b2
!	%l6 = 00000000000000ff, Mem[0000000030041410] = ffff0000
	stha	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 00ff0000
!	%l7 = 000000000000d0b2, Mem[000000001000143a] = ffff0000
	sth	%l7,[%i0+0x03a]		! Mem[0000000010001438] = ffffd0b2
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l6 = 00000000000000ff
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_425:
!	Mem[0000000010001410] = 25482dc0 490c00ff, %l4 = 00000000, %l5 = 0000d0b2
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 00000000490c00ff 0000000025482dc0
!	Mem[0000000010101400] = 0000ffb7, %l5 = 0000000025482dc0
	ldsha	[%i4+%g0]0x88,%l5	! %l5 = ffffffffffffffb7
!	Mem[0000000030081400] = 11810000, %l2 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l2	! %l2 = 0000000000001181
!	Mem[0000000030001408] = bbde47e2, %l2 = 0000000000001181
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 000000000000bbde
!	Mem[0000000030101408] = 0000ff0a, %l7 = 000000000000d0b2
	ldswa	[%i4+%o4]0x89,%l7	! %l7 = 000000000000ff0a
!	Mem[0000000010141400] = 6fb6070600000000, %f14 = 001e0000 000000ff
	ldda	[%i5+%g0]0x88,%f14	! %f14 = 6fb60706 00000000
!	Mem[00000000300c1400] = 0c000000cb000000, %f12 = 84548111 7fffffff
	ldda	[%i3+%g0]0x81,%f12	! %f12 = 0c000000 cb000000
!	Mem[0000000020800040] = 41ff2c25, %l6 = 0000000000000000
	ldsba	[%o1+0x040]%asi,%l6	! %l6 = 0000000000000041
!	Mem[0000000010081428] = 00000000, %l2 = 000000000000bbde
	ldub	[%i2+0x029],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 57748b0c, %l7 = 000000000000ff0a
	swapa	[%i3+%o5]0x88,%l7	! %l7 = 0000000057748b0c

p0_label_426:
!	%f11 = 00000000, Mem[0000000010181400] = ffffffff
	sta	%f11,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Mem[0000000030181408] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081413] = ffffffff, %l7 = 0000000057748b0c
	ldstub	[%i2+0x013],%l7		! %l7 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010181410] = 845481b2
	stba	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 845481ff
!	%l4 = 00000000490c00ff, Mem[0000000030001400] = 000000ff
	stwa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 490c00ff
!	%f7  = ffb91eff, %f18 = 00000063
	fcmps	%fcc1,%f7 ,%f18		! %fcc1 = 3
!	%l2 = 0000000000000000, Mem[0000000010181408] = ff001ad3
	stha	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 00001ad3
!	%f0  = ff0000ff cb000000, Mem[0000000030141410] = 0c000000 00000000
	stda	%f0 ,[%i5+%o5]0x81	! Mem[0000000030141410] = ff0000ff cb000000
!	%f0  = ff0000ff cb000000, %l1 = ff0000ff00000000
!	Mem[0000000010181410] = ff81548400000000
	add	%i6,0x010,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010181410] = ff81548400000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff000c49, %l5 = ffffffffffffffb7
	ldsha	[%i0+%o5]0x80,%l5	! %l5 = ffffffffffffff00

p0_label_427:
	membar	#Sync			! Added by membar checker (76)
!	Mem[0000000030001400] = ff000c49 00000000 bbde47e2 ffffffff
!	Mem[0000000030001410] = ff000000 7fffffff ffffffff ff7bbdb9
!	Mem[0000000030001420] = ffffffff d31ad138 bfffffff ffffffff
!	Mem[0000000030001430] = 6100b66f 618f63d5 3988957a d31ad138
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[0000000030181410] = 000000ff, %f22 = 38d11ad3
	lda	[%i6+%o5]0x81,%f22	! %f22 = 000000ff
!	Mem[00000000211c0000] = ff0a7f1a, %l0 = 0000000000000021
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffff0a
!	Mem[0000000010141400] = 00000000 0607b66f ff6fe8c1 0000001e
!	Mem[0000000010141410] = 31000000 bb76e418 000060f3 00000011
!	Mem[0000000010141420] = 31f7bf47 e247debb 8454ff11 5f19c18e
!	Mem[0000000010141430] = ff0000ff 93020000 0000ffff 00000000
	ldda	[%i5]ASI_BLK_AIUP,%f0	! Block Load from 0000000010141400
!	Mem[00000000300c1400] = 0c000000 cb000000 ff00ff00 63000000
!	Mem[00000000300c1410] = 76bb1ad3 e247debb 3988957a d31ad138
!	Mem[00000000300c1420] = bbde47e2 ffff0000 ff610000 00000000
!	Mem[00000000300c1430] = 84548111 7fffffff 001e0000 000000ff
	ldda	[%i3]ASI_BLK_SL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010141410] = 00000031, %l0 = ffffffffffffff0a
	ldsha	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000031
!	Mem[0000000030141408] = ff610000 00000000, %l6 = 00000041, %l7 = 000000ff
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 00000000ff610000 0000000000000000
!	Mem[0000000030081408] = 0000000000000000, %l1 = ff0000ff00000000
	ldxa	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = 18e476bb00000031, %f8  = 31f7bf47 e247debb
	ldda	[%i5+%o5]0x88,%f8 	! %f8  = 18e476bb 00000031
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (77)
!	%l7 = 0000000000000000, Mem[0000000010141410] = 00000031
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000

p0_label_428:
!	%l2 = 0000000000000000, imm = 0000000000000a50, %l7 = 0000000000000000
	andn	%l2,0xa50,%l7		! %l7 = 0000000000000000
!	Mem[0000000030101410] = ffffffff, %l4 = 00000000490c00ff
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[000000001004143c] = 84548111, %l0 = 0000000000000031
	swap	[%i1+0x03c],%l0		! %l0 = 0000000084548111
!	%f6  = 000060f3 00000011, Mem[0000000030081410] = 00000000 000061ff
	stda	%f6 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 000060f3 00000011
!	Mem[00000000300c1410] = 76bb1ad3, %l4 = 00000000000000ff
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 0000000076bb1ad3
!	%l3 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stha	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Mem[0000000030101400] = ff000000, %l5 = ffffffffffffff00
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030181400] = ffff0000, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 00000000ffff0000
!	Mem[00000000100c1431] = 00000000, %l5 = 00000000ff000000
	ldstub	[%i3+0x031],%l5		! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101428] = bfff00ff, %l1 = 0000000000000000
	ldsb	[%i4+0x02b],%l1		! %l1 = ffffffffffffffff

p0_label_429:
!	Mem[0000000010101408] = 00ff0000, %f6  = 000060f3
	lda	[%i4+%o4]0x80,%f6 	! %f6 = 00ff0000
!	Mem[0000000010081400] = ffffffff, %l4 = 0000000076bb1ad3
	ldswa	[%i2+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101408] = 0aff000000000000, %f22 = 38d11ad3 7a958839
	ldda	[%i4+%o4]0x81,%f22	! %f22 = 0aff0000 00000000
!	Mem[0000000010181438] = 00000000, %l4 = ffffffffffffffff
	ldswa	[%i6+0x038]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = 00ff0000, %l3 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l3	! %l3 = 0000000000ff0000
!	Mem[0000000010081410] = ffffffff, %l4 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000211c0000] = ff0a7f1a, %l1 = ffffffffffffffff
	ldub	[%o2+0x001],%l1		! %l1 = 000000000000000a
!	Mem[0000000010181418] = 00000020 00000000, %l6 = ff610000, %l7 = ffff0000
	ldd	[%i6+0x018],%l6		! %l6 = 0000000000000020 0000000000000000
!	Mem[0000000010081400] = ffffffff, %f22 = 0aff0000
	lda	[%i2+%g0]0x80,%f22	! %f22 = ffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00ff0000, Mem[0000000010041400] = 47bff7ff 4b000000
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 00ff0000

p0_label_430:
!	%l1 = 000000000000000a, Mem[0000000010041400] = 00000000
	stha	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000a
!	%l0 = 0000000084548111, %l6 = 0000000000000020, %y  = e2aefe41
	smul	%l0,%l6,%l0		! %l0 = fffffff08a902220, %y = fffffff0
!	%l3 = 0000000000ff0000, Mem[00000000201c0000] = 01ff7d80, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00007d80
!	Mem[00000000100c1404] = 00000000, %l1 = 0000000a, %l5 = 00000000
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 0000000000000000
!	%f18 = 00000063, %f17 = 0000000c
	fcmpes	%fcc3,%f18,%f17		! %fcc3 = 2
!	Mem[0000000010141410] = 00000000, %l4 = ffffffffffffffff
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%f10 = 8454ff11 5f19c18e, %l7 = 0000000000000000
!	Mem[00000000300c1410] = 000000ffe247debb
	add	%i3,0x010,%g1
	stda	%f10,[%g1+%l7]ASI_PST32_S ! Mem[00000000300c1410] = 000000ffe247debb
!	%f12 = ff0000ff 93020000, Mem[00000000300c1410] = ff000000 bbde47e2
	stda	%f12,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff0000ff 93020000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 0aff0000, %l0 = fffffff08a902220
	lduha	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000aff

p0_label_431:
!	Mem[0000000030081408] = 00000000, %f6  = 00ff0000
	lda	[%i2+%o4]0x81,%f6 	! %f6 = 00000000
!	Mem[00000000100c1408] = fe810000, %f13 = 93020000
	lda	[%i3+%o4]0x80,%f13	! %f13 = fe810000
!	Mem[0000000010001408] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = 00ffffff, %l3 = 0000000000ff0000
	lduwa	[%i4+%g0]0x89,%l3	! %l3 = 0000000000ffffff
!	Mem[0000000010081410] = ffffffffffffffff, %l0 = 0000000000000aff
	ldxa	[%i2+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030141408] = 000061ff, %l4 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 00000000000061ff
!	Mem[0000000030001400] = ff000c49, %l1 = 000000000000000a
	ldsba	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001430] = 0000000000000063, %f22 = ffffffff 00000000
	ldd	[%i0+0x030],%f22	! %f22 = 00000000 00000063
!	Mem[0000000021800140] = 00ff02f2, %l5 = 0000000000000000
	lduba	[%o3+0x141]%asi,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[0000000030041408] = 00000000000061ff
	stxa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffffffffffff

p0_label_432:
!	%f14 = 0000ffff, Mem[0000000010041404] = 0000ff00
	sta	%f14,[%i1+0x004]%asi	! Mem[0000000010041404] = 0000ffff
!	Code Fragment 4
p0_fragment_44:
!	%l0 = ffffffffffffffff
	setx	0x70197927e3bae471,%g7,%l0 ! %l0 = 70197927e3bae471
!	%l1 = ffffffffffffffff
	setx	0x121832a82ca5f75d,%g7,%l1 ! %l1 = 121832a82ca5f75d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 70197927e3bae471
	setx	0x180620c0363a2c23,%g7,%l0 ! %l0 = 180620c0363a2c23
!	%l1 = 121832a82ca5f75d
	setx	0x5a1b641f816a9776,%g7,%l1 ! %l1 = 5a1b641f816a9776
!	Mem[00000000218001c0] = 27007b35, %l3 = 0000000000ffffff
	ldstuba	[%o3+0x1c0]%asi,%l3	! %l3 = 00000027000000ff
!	%l0 = 180620c0363a2c23, Mem[00000000201c0000] = 00007d80
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 23007d80
!	%l1 = 5a1b641f816a9776, Mem[00000000300c1408] = 00ff00ff
	stha	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00ff9776
!	Mem[0000000010081410] = ffffffff, %l5 = 00000000000000ff
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 00000000ffffffff
!	%l5 = 00000000ffffffff, Mem[00000000300c1410] = 93020000
	stha	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 9302ffff
!	%f24 = 0000ffff e247debb, Mem[0000000030101400] = 00ffffff ffffffff
	stda	%f24,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ffff e247debb
!	%l6 = 00000020, %l7 = 000000ff, Mem[00000000300c1400] = 0c000000 cb000000
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000020 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = 31f7bf47, %l0 = 180620c0363a2c23
	ldsw	[%i5+0x020],%l0		! %l0 = 0000000031f7bf47

p0_label_433:
!	Mem[0000000020800000] = ffff16cb, %l2 = 0000000000000000
	ldsh	[%o1+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030081408] = 0000000000000000, %f26 = 00000000 000061ff
	ldda	[%i2+%o4]0x81,%f26	! %f26 = 00000000 00000000
!	Mem[0000000010181404] = 00000000, %l2 = ffffffffffffffff
	lduwa	[%i6+0x004]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l5 = 00000000ffffffff
	lduba	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001438] = ffffd0b2000045ff, %l2 = 0000000000000000
	ldxa	[%i0+0x038]%asi,%l2	! %l2 = ffffd0b2000045ff
!	Mem[0000000030101410] = ffffffff ffffffff, %l4 = 000061ff, %l5 = 00000000
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000030001410] = ff000000, %l0 = 0000000031f7bf47
	lduha	[%i0+%o5]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030001410] = 000000ff, %l1 = 5a1b641f816a9776
	lduwa	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l4 = 00000000ffffffff, immed = fffff1d8, %y  = fffffff0
	sdiv	%l4,-0xe28,%l6		! %l6 = 00000000010f421e
	mov	%l0,%y			! %y = 0000ff00
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000030141410] = ff0000ff
	stba	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = ff0000ff

p0_label_434:
!	%l6 = 00000000010f421e, Mem[0000000010041428] = ff4c7d8a00630000
	stx	%l6,[%i1+0x028]		! Mem[0000000010041428] = 00000000010f421e
!	%l5 = 00000000ffffffff, %l1 = 00000000000000ff, %l2 = ffffd0b2000045ff
	and	%l5,%l1,%l2		! %l2 = 00000000000000ff
!	%l0 = 000000000000ff00, Mem[0000000030101410] = ffffffffffffffff
	stxa	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000000000ff00
!	Mem[0000000010101400] = 0000ffb7, %l3 = 0000000000000027
	ldstuba	[%i4+%g0]0x88,%l3	! %l3 = 000000b7000000ff
!	Mem[00000000100c1410] = 0000ff0a, %l1 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 000000000000ff0a
!	Mem[00000000100c1408] = fe810000, %l4 = 00000000ffffffff
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 00000000fe810000
!	%l1 = 000000000000ff0a, Mem[0000000010141400] = 00000000
	stwa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000ff0a
!	%f30 = ff000000 00001e00, %l4 = 00000000fe810000
!	Mem[00000000100c1420] = c1e8169320000000
	add	%i3,0x020,%g1
	stda	%f30,[%g1+%l4]ASI_PST16_PL ! Mem[00000000100c1420] = c1e8169320000000
!	Mem[0000000030041410] = 0000ff00, %l2 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%l5 = 00000000ffffffff, imm = 0000000000000290, %l1 = 000000000000ff0a
	or	%l5,0x290,%l1		! %l1 = 00000000ffffffff

p0_label_435:
!	Mem[00000000300c1408] = 00ff9776, %l6 = 00000000010f421e
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 0000000000009776
!	Mem[0000000010181414] = 00000000, %l4 = 00000000fe810000
	lduw	[%i6+0x014],%l4		! %l4 = 0000000000000000
!	Code Fragment 3
p0_fragment_45:
!	%l0 = 000000000000ff00
	setx	0x01cffc1fd3b0f3a2,%g7,%l0 ! %l0 = 01cffc1fd3b0f3a2
!	%l1 = 00000000ffffffff
	setx	0xd01933bff7df947b,%g7,%l1 ! %l1 = d01933bff7df947b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 01cffc1fd3b0f3a2
	setx	0xa46af777ceec31af,%g7,%l0 ! %l0 = a46af777ceec31af
!	%l1 = d01933bff7df947b
	setx	0xe7afe95f8bf14879,%g7,%l1 ! %l1 = e7afe95f8bf14879
!	Mem[0000000010001400] = 00000000, %l3 = 00000000000000b7
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 00ff00007fffffff, %l5 = 00000000ffffffff
	ldxa	[%i4+%o4]0x80,%l5	! %l5 = 00ff00007fffffff
!	Mem[00000000100c1400] = 0000000000000000, %l7 = 00000000000000ff
	ldxa	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = ff0000ff, %l0 = a46af777ceec31af
	ldsha	[%i2+%o4]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030101408] = 0000ff0a, %l2 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l2	! %l2 = ffffffffffffff0a
!	Mem[0000000010041400] = 0a000000, %l6 = 0000000000009776
	lduba	[%i1+%g0]0x80,%l6	! %l6 = 000000000000000a
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = ff000000, %f7  = 00000011
	lda	[%i6+%o4]0x81,%f7 	! %f7 = ff000000

p0_label_436:
!	%f19 = 00ff00ff, Mem[0000000030001400] = ff000c49
	sta	%f19,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ff00ff
!	Mem[0000000030141408] = 00000000, %l4 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%l4 = 00000000, %l5 = 7fffffff, Mem[0000000010141400] = 0aff0000 0607b66f
	stda	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 7fffffff
!	Mem[0000000010001408] = 000000ff, %l6 = 000000000000000a
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010101408] = 0000ff00, %l7 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[00000000211c0000] = ff0a7f1a, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff7f1a
!	Mem[0000000030041400] = 00ff0000, %l1 = e7afe95f8bf14879
	swapa	[%i1+%g0]0x89,%l1	! %l1 = 0000000000ff0000
!	Mem[0000000030141400] = ffff00ff, %l4 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 00000000ffff00ff
!	%f0  = 00000000 0607b66f ff6fe8c1 0000001e
!	%f4  = 31000000 bb76e418 00000000 ff000000
!	%f8  = 18e476bb 00000031 8454ff11 5f19c18e
!	%f12 = ff0000ff fe810000 0000ffff 00000000
	stda	%f0,[%i2]ASI_COMMIT_P	! Block Store to 0000000010081400
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000 00000000, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000 0000000000000000

p0_label_437:
	membar	#Sync			! Added by membar checker (78)
!	Mem[0000000010081410] = 31000000, %f26 = 00000000
	lda	[%i2+%o5]0x80,%f26	! %f26 = 31000000
!	Mem[0000000010101408] = ffff0000, %l1 = 0000000000ff0000
	lduba	[%i4+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181434] = 00000000, %l3 = 0000000000000000
	lduba	[%i6+0x034]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181430] = 00000000, %l1 = 00000000000000ff
	lduh	[%i6+0x032],%l1		! %l1 = 0000000000000000
!	%l0 = ffffffffffffff00, imm = fffffffffffff5fd, %l6 = 0000000000000000
	addc	%l0,-0xa03,%l6		! %l6 = fffffffffffff4fd
!	Mem[0000000010101410] = 00000000, %l0 = ffffffffffffff00
	ldsha	[%i4+0x012]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 00000000 ff00ff00, %l2 = ffffff0a, %l3 = 00000000
	ldda	[%i0+%g0]0x89,%l2	! %l2 = 00000000ff00ff00 0000000000000000
!	Mem[0000000030141410] = ff0000ff, %f23 = 00000063
	lda	[%i5+%o5]0x89,%f23	! %f23 = ff0000ff
!	Mem[0000000010001408] = ff000000, %l5 = 00ff00007fffffff
	lduwa	[%i0+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%f2  = ff6fe8c1, Mem[0000000030101400] = e247debb
	sta	%f2 ,[%i4+%g0]0x89	! Mem[0000000030101400] = ff6fe8c1

p0_label_438:
!	%f0  = 00000000 0607b66f ff6fe8c1 0000001e
!	%f4  = 31000000 bb76e418 00000000 ff000000
!	%f8  = 18e476bb 00000031 8454ff11 5f19c18e
!	%f12 = ff0000ff fe810000 0000ffff 00000000
	stda	%f0,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
!	Mem[0000000010181414] = 00000000, %l6 = fffff4fd, %l5 = ff000000
	add	%i6,0x14,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 00000020, %l4 = 00000000ffff00ff
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000020
!	%l6 = fffffffffffff4fd, Mem[0000000030041410] = ffff0000ffffffff
	stxa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = fffffffffffff4fd
!	Mem[0000000030001408] = bbde47e2, %l7 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l7	! %l7 = 00000000bbde47e2
!	Mem[0000000030001408] = 00000000 ffffffff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000 00000000ffffffff
!	Mem[0000000030041408] = ffffffff, %l4 = 0000000000000020
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[00000000100c1410] = ff000000
	stha	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[0000000010181408] = 00001ad3, %l2 = 00000000ff00ff00
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 0000000000001ad3
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000ff00000000, %l6 = fffffffffffff4fd
	ldxa	[%i6+%o5]0x81,%l6	! %l6 = 000000ff00000000

p0_label_439:
!	Mem[0000000030001408] = ffffffff 00000000, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000 00000000ffffffff
!	Mem[0000000010001424] = 57bff731, %l3 = 0000000000000000
	lduwa	[%i0+0x024]%asi,%l3	! %l3 = 0000000057bff731
!	Mem[0000000010041408] = 00000000, %l6 = 000000ff00000000
	ldub	[%i1+0x009],%l6		! %l6 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %f30 = ff000000
	lda	[%i6+%g0]0x89,%f30	! %f30 = 00000000
!	Mem[0000000010181400] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000057bff731
	lduba	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 0aff0000, %l5 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l5	! %l5 = 000000000aff0000
!	Mem[0000000030141408] = 00000000, %l2 = 0000000000001ad3
	lduwa	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Code Fragment 3
p0_fragment_46:
!	%l0 = 0000000000000000
	setx	0x550b3567f55a2f1a,%g7,%l0 ! %l0 = 550b3567f55a2f1a
!	%l1 = 00000000ffffffff
	setx	0x196d1e806090fb4d,%g7,%l1 ! %l1 = 196d1e806090fb4d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 550b3567f55a2f1a
	setx	0x329d93401e55b0ed,%g7,%l0 ! %l0 = 329d93401e55b0ed
!	%l1 = 196d1e806090fb4d
	setx	0x3a02e867bef9dda7,%g7,%l1 ! %l1 = 3a02e867bef9dda7
!	Starting 10 instruction Store Burst
!	%l5 = 000000000aff0000, Mem[0000000030041410] = ffffffff
	stwa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 0aff0000

p0_label_440:
!	%l2 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stha	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%f0  = 00000000 0607b66f ff6fe8c1 0000001e
!	%f4  = 31000000 bb76e418 00000000 ff000000
!	%f8  = 18e476bb 00000031 8454ff11 5f19c18e
!	%f12 = ff0000ff fe810000 0000ffff 00000000
	stda	%f0,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	Mem[0000000010041408] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (79)
!	%l0 = 329d93401e55b0ed, Mem[00000000100c1400] = 000000000607b66f
	stxa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 329d93401e55b0ed
!	Mem[0000000010041424] = 00000061, %l6 = 0000000000000000
	ldstuba	[%i1+0x024]%asi,%l6	! %l6 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030001410] = ff000000
	stwa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%f12 = ff0000ff, Mem[0000000010101400] = ffff0000
	sta	%f12,[%i4+%g0]0x80	! Mem[0000000010101400] = ff0000ff
!	%l3 = 0000000000000000, Mem[0000000010001400] = 0000000000000000
	stxa	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000
!	%l0 = 329d93401e55b0ed, Mem[000000001018143c] = ffb91eff
	stb	%l0,[%i6+0x03c]		! Mem[000000001018143c] = edb91eff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000 0000ff00, %l6 = 00000000, %l7 = bbde47e2
	ldda	[%i4+0x010]%asi,%l6	! %l6 = 0000000000000000 000000000000ff00

p0_label_441:
!	Mem[0000000010081408] = c1e86fff, %l2 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l2	! %l2 = 0000000000006fff
!	Mem[0000000010001420] = 0000000057bff731, %f16 = 000000cb 0000000c
	ldda	[%i0+0x020]%asi,%f16	! %f16 = 00000000 57bff731
!	Mem[000000001014141c] = ff000000, %l7 = 000000000000ff00
	lduwa	[%i5+0x01c]%asi,%l7	! %l7 = 00000000ff000000
!	Mem[00000000100c1400] = 40939d32, %l6 = 0000000000000000
	ldsha	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffff9d32
!	Mem[0000000010141410] = 31000000, %l7 = 00000000ff000000
	ldsba	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000031
!	Mem[00000000300c1400] = ffff00ff000000ff, %f0  = 00000000 0607b66f
	ldda	[%i3+%g0]0x81,%f0 	! %f0  = ffff00ff 000000ff
!	%f18 = 00000063, %f27 = 00000000
	fcmpes	%fcc1,%f18,%f27		! %fcc1 = 2
!	Mem[0000000030081408] = 00000000, %l5 = 000000000aff0000
	lduha	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = 000000000000ff00, %f26 = 31000000 00000000
	ldda	[%i4+%o5]0x81,%f26	! %f26 = 00000000 0000ff00
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[00000000300c1410] = 9302ffff
	stha	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 93020000

p0_label_442:
!	%l0 = 329d93401e55b0ed, Mem[00000000201c0000] = 23007d80
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = b0ed7d80
!	Mem[0000000010181400] = 00000000, %l6 = ffffffffffff9d32
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l1 = 3a02e867bef9dda7, Mem[0000000010141408] = c1e86fff
	stba	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = c1e86fa7
!	%l1 = 3a02e867bef9dda7, Mem[0000000010141410] = 18e476bb00000031
	stxa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 3a02e867bef9dda7
!	Mem[0000000030141408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030181400] = 00000000
	stba	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%f27 = 0000ff00, %f4  = 31000000
	fsqrts	%f27,%f4 		! %l0 = 329d93401e55b10f, Unfinished, %fsr = 2600000400
!	%l5 = 0000000000000000, Mem[0000000020800040] = 41ff2c25
	sth	%l5,[%o1+0x040]		! Mem[0000000020800040] = 00002c25
!	%f7  = ff000000, Mem[0000000030001400] = ff00ff00
	sta	%f7 ,[%i0+%g0]0x89	! Mem[0000000030001400] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 1e000000c1e86fa7, %f12 = ff0000ff fe810000
	ldda	[%i5+%o4]0x88,%f12	! %f12 = 1e000000 c1e86fa7

p0_label_443:
!	Mem[0000000010101410] = 00000000, %l2 = 0000000000006fff
	lduw	[%i4+%o5],%l2		! %l2 = 0000000000000000
!	Mem[0000000030141410] = ff0000ff, %l0 = 329d93401e55b10f
	lduwa	[%i5+%o5]0x81,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000010101408] = ffff0000, %l6 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l6	! %l6 = 00000000ffff0000
!	Code Fragment 4
p0_fragment_47:
!	%l0 = 00000000ff0000ff
	setx	0x7d5dde5fe81c6513,%g7,%l0 ! %l0 = 7d5dde5fe81c6513
!	%l1 = 3a02e867bef9dda7
	setx	0x6b94a950608f6a20,%g7,%l1 ! %l1 = 6b94a950608f6a20
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7d5dde5fe81c6513
	setx	0xb9572447d5cd1daa,%g7,%l0 ! %l0 = b9572447d5cd1daa
!	%l1 = 6b94a950608f6a20
	setx	0xcb43db4049a7d2d7,%g7,%l1 ! %l1 = cb43db4049a7d2d7
!	Mem[00000000100c1410] = 31000000, %l3 = 0000000000000000
	lduwa	[%i3+0x010]%asi,%l3	! %l3 = 0000000031000000
!	%l1 = cb43db4049a7d2d7, %l6 = 00000000ffff0000, %l2 = 0000000000000000
	sdivx	%l1,%l6,%l2		! %l2 = ffffffffcb43a684
!	%l2 = ffffffffcb43a684, immed = 00000d67, %y  = 0000ff00
	smul	%l2,0xd67,%l2		! %l2 = fffffd3d37acb31c, %y = fffffd3d
!	Mem[00000000100c1408] = c1e86fff, %l1 = cb43db4049a7d2d7
	ldsba	[%i3+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041400] = 7948f18b 63000000 ffffffff ffffffff
!	Mem[0000000030041410] = 0000ff0a fffff4fd 6fb60706 0000ebcb
!	Mem[0000000030041420] = 0000807f 00ff0000 23044fff 0000ff8d
!	Mem[0000000030041430] = 8ec1195f 11815484 ad880a76 65450a09
	ldda	[%i1]ASI_BLK_S,%f0	! Block Load from 0000000030041400
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 000000ff, %l6 = 00000000ffff0000
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_444:
!	%l2 = fffffd3d37acb31c, Mem[000000001018140d] = 18e476bb, %asi = 80
	stba	%l2,[%i6+0x00d]%asi	! Mem[000000001018140c] = 181c76bb
!	Mem[0000000010081428] = 8454ff115f19c18e, %l1 = ffffffffffffffff, %l7 = 0000000000000031
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 8454ff115f19c18e
!	%l1 = ffffffffffffffff, Mem[0000000010181408] = ff00ff00181c76bb
	stx	%l1,[%i6+%o4]		! Mem[0000000010181408] = ffffffffffffffff
!	%f28 = ffffff7f, Mem[00000000100c141c] = ff000000
	sta	%f28,[%i3+0x01c]%asi	! Mem[00000000100c141c] = ffffff7f
!	%l6 = 00000000000000ff, Mem[0000000010101402] = ff0000ff
	sth	%l6,[%i4+0x002]		! Mem[0000000010101400] = ff0000ff
!	%f22 = 00000000 ff0000ff, Mem[0000000010181408] = ffffffff ffffffff
	stda	%f22,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 ff0000ff
!	Mem[0000000010141408] = c1e86fa7, %l4 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l4	! %l4 = 000000a7000000ff
!	%l6 = 00000000000000ff, Mem[0000000030181410] = ff000000
	stwa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	Mem[0000000010141400] = 00000000, %l7 = 8454ff115f19c18e
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000

p0_label_445:
!	Mem[00000000211c0000] = 00ff7f1a, %l5 = 0000000000000000
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[000000001000142c] = 00000011, %l7 = 0000000000000000
	ldsha	[%i0+0x02e]%asi,%l7	! %l7 = 0000000000000011
!	Mem[00000000211c0000] = 00ff7f1a, %l7 = 0000000000000011
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101410] = 00ff0000 00000000, %l0 = d5cd1daa, %l1 = ffffffff
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000 0000000000ff0000
!	Mem[0000000010141410] = 3a02e867bef9dda7, %f18 = 00000063 00ff00ff
	ldda	[%i5+%o5]0x88,%f18	! %f18 = 3a02e867 bef9dda7
!	Mem[0000000030181400] = 00000000, %f26 = 00000000
	lda	[%i6+%g0]0x89,%f26	! %f26 = 00000000
!	Mem[0000000010181410] = ff81548400000000, %l2 = fffffd3d37acb31c
	ldxa	[%i6+%o5]0x80,%l2	! %l2 = ff81548400000000
!	Mem[0000000030041400] = 7948f18b 63000000 ffffffff ffffffff
!	Mem[0000000030041410] = 0000ff0a fffff4fd 6fb60706 0000ebcb
!	Mem[0000000030041420] = 0000807f 00ff0000 23044fff 0000ff8d
!	Mem[0000000030041430] = 8ec1195f 11815484 ad880a76 65450a09
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[000000001004143c] = 00000031, %f2  = ffffffff
	ld	[%i1+0x03c],%f2 	! %f2 = 00000031
!	Starting 10 instruction Store Burst
!	%l3 = 0000000031000000, Mem[0000000010081410] = 18e476bb00000031
	stxa	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000031000000

p0_label_446:
!	Mem[0000000030081408] = 00000000, %l4 = 00000000000000a7
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%f2  = 00000031 ffffffff, %l2 = ff81548400000000
!	Mem[0000000030181438] = 090a4565760a88ad
	add	%i6,0x038,%g1
	stda	%f2,[%g1+%l2]ASI_PST8_S ! Mem[0000000030181438] = 090a4565760a88ad
!	%f2  = 00000031, %f13 = 11815484, %f10 = 23044fff
	fsubs	%f2 ,%f13,%f10		! %l0 = 0000000000000022, Unfinished, %fsr = 2600000400
!	%l6 = 0000000000000000, Mem[0000000010081400] = 000000000607b66f
	stxa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000010181408] = ff0000ff
	stha	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 00ff00ff
!	%l6 = 0000000000000000, Mem[0000000010141410] = bef9dda7
	stha	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = bef90000
!	%f2  = 00000031 ffffffff, %l5 = 0000000000000000
!	Mem[0000000010101428] = bfff00ff00000031
	add	%i4,0x028,%g1
	stda	%f2,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010101428] = bfff00ff00000031
!	%l3 = 0000000031000000, Mem[0000000030081408] = 000000a7
	stha	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000a7
!	%l3 = 0000000031000000, Mem[0000000010041400] = 0a000000
	stha	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Starting 10 instruction Load Burst
!	%f10 = 23044fff, %f8  = 0000807f, %f15 = 65450a09
	fdivs	%f10,%f8 ,%f15		! %l0 = 0000000000000044, Unfinished, %fsr = 2600000400

p0_label_447:
!	Mem[0000000030181408] = ff00000000000000, %l1 = 0000000000ff0000
	ldxa	[%i6+%o4]0x81,%l1	! %l1 = ff00000000000000
!	Mem[0000000030041400] = 8bf14879, %l3 = 0000000031000000
	lduba	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000079
!	Mem[0000000010101438] = fffff0b600000000, %l5 = 0000000000000000
	ldx	[%i4+0x038],%l5		! %l5 = fffff0b600000000
!	Mem[0000000010041410] = fff7bf5700000000, %f10 = 23044fff 0000ff8d
	ldda	[%i1+%o5]0x80,%f10	! %f10 = fff7bf57 00000000
!	Mem[00000000100c1410] = 31000000 bb76e418, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 0000000031000000 00000000bb76e418
!	Mem[0000000030041410] = fdf4ffff 0aff0000, %l0 = 00000044, %l1 = 00000000
	ldda	[%i1+%o5]0x89,%l0	! %l0 = 000000000aff0000 00000000fdf4ffff
!	Mem[0000000010101400] = ff0000ff, %l6 = 0000000031000000
	lduba	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800000] = ffff16cb, %l0 = 000000000aff0000
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010001410] = ff000c49, %l2 = ff81548400000000
	ldsba	[%i0+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (80)
!	%l5 = fffff0b600000000, Mem[0000000030041410] = 0000ff0a
	stha	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000ff0a

p0_label_448:
!	%l0 = 000000000000ffff, Mem[00000000100c1410] = 00000031
	stwa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000ffff
!	Mem[0000000010141410] = 0000f9be, %l5 = fffff0b600000000
	ldstuba	[%i5+0x010]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l3 = 0000000000000079
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = 40939d32
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 409300ff
!	%l2 = ffffffffffffffff, Mem[0000000010181410] = 845481ff
	stba	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 845481ff
!	%l1 = 00000000fdf4ffff, Mem[0000000010181426] = 34abf64c
	sth	%l1,[%i6+0x026]		! Mem[0000000010181424] = 34abffff
!	%l7 = 00000000bb76e418, Mem[0000000010181410] = 845481ff
	stwa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = bb76e418
!	%l6 = 00000000000000ff, Mem[00000000100c1408] = ff6fe8c1
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ffe8c1
!	%l0 = 000000000000ffff, Mem[00000000300c1408] = 7697ff0063000000
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000000000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l2 = ffffffffffffffff
	lduwa	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_449:
!	Mem[0000000021800000] = 1effba26, %l1 = 00000000fdf4ffff
	lduh	[%o3+%g0],%l1		! %l1 = 0000000000001eff
!	Mem[0000000010041408] = 000000ff, %l0 = 000000000000ffff
	ldswa	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%f1  = 63000000, %f18 = ffffffff, %f21 = fffff4fd
	fmuls	%f1 ,%f18,%f21		! %f21 = ffffffff
!	Mem[0000000010001408] = ff000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldd	[%i0+%o4],%l4		! %l4 = 00000000ff000000 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081404] = 00000000, %l3 = 0000000000000000
	ldub	[%i2+0x005],%l3		! %l3 = 0000000000000000
!	Mem[0000000010001438] = ffffd0b2, %f23 = 0000ebcb
	lda	[%i0+0x038]%asi,%f23	! %f23 = ffffd0b2
!	Mem[0000000030041410] = 0aff0000, %l7 = 00000000bb76e418
	lduba	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = 00000000 7fffffff, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000 000000007fffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ff0000ff, %l6 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l6	! %l6 = 00000000ff0000ff

p0_label_450:
!	%l4 = ff000000, %l5 = 00000000, Mem[0000000010041410] = fff7bf57 00000000
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = ff000000 00000000
!	Mem[0000000010181400] = ffff9d32, %l0 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[00000000100c1400] = ff009340
	stha	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00009340
!	Mem[0000000030081400] = 00008111, %l4 = 00000000ff000000
	ldstuba	[%i2+%g0]0x89,%l4	! %l4 = 00000011000000ff
!	%l7 = 000000007fffffff, Mem[0000000010001408] = 000000ff
	stha	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000ffff
!	%l6 = ff0000ff, %l7 = 7fffffff, Mem[0000000010041418] = 39887d8a 0000ff00
	std	%l6,[%i1+0x018]		! Mem[0000000010041418] = ff0000ff 7fffffff
!	%l7 = 000000007fffffff, Mem[0000000010001410] = ff000c49
	stba	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000c49
!	%l7 = 000000007fffffff, Mem[00000000218000c0] = fffff956, %asi = 80
	stba	%l7,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = fffff956
!	%l3 = 0000000000000000, Mem[0000000030081400] = ff810000
	stha	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffff00ff, %l2 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l2	! %l2 = 000000000000ffff

p0_label_451:
!	Mem[0000000030181410] = 00000000000000ff, %l6 = 00000000ff0000ff
	ldxa	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181408] = 00000000 000000ff, %l4 = 00000011, %l5 = 00000000
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[0000000030101408] = 0aff000000000000, %f30 = ad880a76 65450a09
	ldda	[%i4+%o4]0x81,%f30	! %f30 = 0aff0000 00000000
!	Mem[0000000021800040] = 000c487b, %l6 = 00000000000000ff
	ldsb	[%o3+0x041],%l6		! %l6 = 000000000000000c
!	Mem[0000000030141410] = 00000000, %l0 = 00000000000000ff
	ldsha	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l5 = 0000000000000000
	ldswa	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 0000ff0a, %l1 = 0000000000001eff
	lduha	[%i1+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[000000001010141c] = 00000061, %l5 = 0000000000000000
	lduw	[%i4+0x01c],%l5		! %l5 = 0000000000000061
!	Mem[0000000021800100] = d0b26971, %l4 = 00000000000000ff
	lduha	[%o3+0x100]%asi,%l4	! %l4 = 000000000000d0b2
!	Starting 10 instruction Store Burst
!	%l7 = 000000007fffffff, Mem[0000000010041408] = ff000000
	stha	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = ffff0000

p0_label_452:
!	%f28 = 8ec1195f, Mem[0000000030141410] = 00000000
	sta	%f28,[%i5+%o5]0x81	! Mem[0000000030141410] = 8ec1195f
!	Mem[0000000030181408] = 000000ff, %l3 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l4 = 000000000000d0b2, Mem[0000000010081410] = 0000000031000000
	stxa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000000000d0b2
!	%l7 = 000000007fffffff, Mem[0000000021800040] = 000c487b, %asi = 80
	stba	%l7,[%o3+0x040]%asi	! Mem[0000000021800040] = ff0c487b
!	Mem[0000000030041410] = 0000ff0a, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 000000000000ff0a
!	Mem[0000000030181408] = 00000000, %l5 = 0000000000000061
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%f16 = 7948f18b 63000000 ffffffff ffffffff
!	%f20 = 0000ff0a ffffffff 6fb60706 ffffd0b2
!	%f24 = 0000807f 00ff0000 23044fff 0000ff8d
!	%f28 = 8ec1195f 11815484 0aff0000 00000000
	stda	%f16,[%i0]ASI_BLK_P	! Block Store to 0000000010001400
!	Mem[00000000100c141c] = ffffff7f, %l0 = 00000000, %l6 = 0000000c
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 00000000ffffff7f
!	%l6 = 00000000ffffff7f, Mem[0000000010001410] = 0000ff0a
	stwa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffff7f
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000 000000ff, %l0 = 00000000, %l1 = 0000ff0a
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000 00000000000000ff

p0_label_453:
!	Mem[0000000030181408] = 000000ff, %l6 = 00000000ffffff7f
	ldswa	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181408] = 00ff00ff, %l5 = 0000000000000000
	ldsha	[%i6+0x00a]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l7 = 000000007fffffff
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = ffffffff00000000, %l5 = 00000000000000ff
	ldxa	[%i0+%o4]0x89,%l5	! %l5 = ffffffff00000000
!	Mem[00000000211c0000] = 00ff7f1a, %l4 = 000000000000d0b2
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l3 = 00000000000000ff
	lduba	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (81)
!	Mem[0000000010001408] = ffffffff, %l0 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141408] = 0000ffff00000000, %l0 = 00000000000000ff
	ldxa	[%i5+%o4]0x81,%l0	! %l0 = 0000ffff00000000
!	Mem[00000000211c0000] = 00ff7f1a, %l5 = ffffffff00000000
	ldsh	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[00000000201c0000] = b0ed7d80, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff7d80

p0_label_454:
!	%f24 = 0000807f 00ff0000, Mem[0000000030081408] = a7000000 00000000
	stda	%f24,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000807f 00ff0000
!	%l2 = 000000000000ffff, Mem[0000000010101410] = 00000079
	stwa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000ffff
!	%l0 = 0000ffff00000000, %l1 = 00000000000000ff, %y  = fffffd3d
	umul	%l0,%l1,%l7		! %l7 = 0000000000000000, %y = 00000000
!	%f22 = 6fb60706 ffffd0b2, %l2 = 000000000000ffff
!	Mem[00000000100c1400] = 000093401e55b0ed
	stda	%f22,[%i3+%l2]ASI_PST8_P ! Mem[00000000100c1400] = 6fb60706ffffd0b2
!	Mem[0000000010041408] = 0000ffff, %l7 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	%f18 = ffffffff ffffffff, Mem[0000000030041400] = 7948f18b 63000000
	stda	%f18,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff ffffffff
!	Mem[0000000010081410] = b2d00000, %l4 = 00000000000000ff
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 000000000000b2d0
!	%f12 = 8ec1195f, Mem[00000000100c1400] = 6fb60706
	sta	%f12,[%i3+%g0]0x80	! Mem[00000000100c1400] = 8ec1195f
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010101400] = ff0000ff ca4c7d8a
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = bb76e418, %l6 = 00000000000000ff
	lduha	[%i6+%o5]0x88,%l6	! %l6 = 000000000000e418

p0_label_455:
!	Mem[0000000010081408] = 1e000000c1e86fff, %l6 = 000000000000e418
	ldxa	[%i2+%o4]0x88,%l6	! %l6 = 1e000000c1e86fff
!	%f28 = 8ec1195f, %f4  = 0000ff0a, %f28 = 8ec1195f 11815484
	fsmuld	%f28,%f4 ,%f28		! %l0 = 0000ffff00000022, Unfinished, %fsr = 2600000400
!	Mem[0000000010081410] = 0000d0b2, %l7 = 00000000000000ff
	ldsha	[%i2+%o5]0x88,%l7	! %l7 = ffffffffffffd0b2
!	Mem[0000000030001400] = ff000000, %l7 = ffffffffffffd0b2
	ldsba	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l0 = 0000ffff00000022
	lduba	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181404] = 00000000, %l5 = 00000000000000ff
	ldsha	[%i6+0x004]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l6 = 1e000000c1e86fff
	ldswa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %f22 = 6fb60706
	lda	[%i2+%g0]0x80,%f22	! %f22 = 00000000
!	Mem[00000000100c142c] = 5f19c18e, %l1 = 00000000000000ff
	lduh	[%i3+0x02c],%l1		! %l1 = 0000000000005f19
!	Starting 10 instruction Store Burst
!	%f10 = fff7bf57, Mem[0000000010081400] = 00000000
	st	%f10,[%i2+%g0]		! Mem[0000000010081400] = fff7bf57

p0_label_456:
!	%f0  = 7948f18b 63000000, %l5 = 0000000000000000
!	Mem[0000000030081438] = 3988957ad31ad138
	add	%i2,0x038,%g1
	stda	%f0,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030081438] = 3988957ad31ad138
!	Mem[0000000030181400] = 00000000, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000000, Mem[00000000300c1410] = 93020000
	stwa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[00000000300c1400] = ffff00ff, %l4 = 000000000000b2d0
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 00000000ffff00ff
!	%l0 = 0000000000000000, Mem[0000000020800000] = ffff16cb, %asi = 80
	stha	%l0,[%o1+0x000]%asi	! Mem[0000000020800000] = 000016cb
!	Mem[0000000010001410] = 7fffffff, %l5 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 000000007fffffff
!	Mem[0000000010001434] = 11815484, %l7 = 0000000000000000
	swap	[%i0+0x034],%l7		! %l7 = 0000000011815484
!	%f31 = 00000000, Mem[0000000010081408] = c1e86fff
	sta	%f31,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	Mem[0000000010101400] = 00000000, %l4 = 00000000ffff00ff
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffff9d3200000000, %f28 = 8ec1195f 11815484
	ldda	[%i6+%g0]0x80,%f28	! %f28 = ffff9d32 00000000

p0_label_457:
!	Mem[0000000010101410] = ffff0000, %l6 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l6	! %l6 = 00000000ffff0000
!	Mem[0000000010001408] = ffffffff, %l0 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030001410] = 00000000, %l0 = 00000000ffffffff
	lduwa	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 8ec1195f, %l7 = 0000000011815484
	lduha	[%i5+%o5]0x81,%l7	! %l7 = 0000000000008ec1
!	Mem[0000000010101400] = ffff00ff, %l3 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l3	! %l3 = ffffffffffff00ff
!	Mem[0000000030141408] = 0000ffff00000000, %l0 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l0	! %l0 = 0000ffff00000000
!	Mem[0000000010141408] = ff6fe8c1 0000001e, %l6 = ffff0000, %l7 = 00008ec1
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 00000000ff6fe8c1 000000000000001e
!	Mem[0000000030181400] = 00000000 0000ffff, %l0 = 00000000, %l1 = 00005f19
	ldda	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000 000000000000ffff
!	Mem[0000000010001410] = 00000000, %l4 = 0000000000000000
	ldsha	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff6fe8c1, Mem[0000000030001400] = 000000ff00000000
	stxa	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000ff6fe8c1

p0_label_458:
!	%f28 = ffff9d32 00000000, Mem[0000000030001400] = 00000000 c1e86fff
	stda	%f28,[%i0+%g0]0x89	! Mem[0000000030001400] = ffff9d32 00000000
!	Mem[0000000030081408] = 00ff0000, %l3 = ffffffffffff00ff
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = c1e8ff00, %l5 = 000000007fffffff
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 00000000c1e8ff00
!	Mem[0000000010001404] = 63000000, %l6 = 00000000ff6fe8c1
	swap	[%i0+0x004],%l6		! %l6 = 0000000063000000
!	%f18 = ffffffff ffffffff, Mem[0000000030141408] = ffff0000 00000000
	stda	%f18,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff ffffffff
!	%l6 = 63000000, %l7 = 0000001e, Mem[0000000010081408] = 00000000 0000001e
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 63000000 0000001e
!	%f2  = 00000031 ffffffff, Mem[0000000030001410] = 00000000 7fffffff
	stda	%f2 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000031 ffffffff
!	Mem[0000000010001438] = 0aff0000, %l6 = 0000000063000000
	ldstub	[%i0+0x038],%l6		! %l6 = 0000000a000000ff
!	%f24 = 0000807f 00ff0000, Mem[0000000030041410] = 00000000 fdf4ffff
	stda	%f24,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000807f 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff00ffffff000000, %l1 = 000000000000ffff
	ldxa	[%i4+%g0]0x80,%l1	! %l1 = ff00ffffff000000

p0_label_459:
!	Mem[0000000030101408] = 0000ff0a, %f24 = 0000807f
	lda	[%i4+%o4]0x89,%f24	! %f24 = 0000ff0a
!	Mem[0000000010041410] = ff00000000000000, %f10 = fff7bf57 00000000
	ldda	[%i1+%o5]0x80,%f10	! %f10 = ff000000 00000000
!	%l4 = 0000000000000000, %l7 = 000000000000001e, %l2 = 000000000000ffff
	sub	%l4,%l7,%l2		! %l2 = ffffffffffffffe2
!	Mem[00000000300c1408] = 00000000, %l7 = 000000000000001e
	lduwa	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 00000000000000ff, %l1 = ff00ffffff000000
	ldxa	[%i6+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001438] = ffff000000000000, %l4 = 0000000000000000
	ldx	[%i0+0x038],%l4		! %l4 = ffff000000000000
!	Mem[0000000030001400] = 00000000, %l7 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = ffff0000, %l2 = ffffffffffffffe2
	ldswa	[%i3+%o5]0x80,%l2	! %l2 = ffffffffffff0000
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000000a, Mem[0000000010101410] = 0000ffff
	stwa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000a

p0_label_460:
!	Mem[00000000300c1410] = 00000000, %l4 = ffff000000000000
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[000000001000141e] = ffffd0b2
	stb	%l4,[%i0+0x01e]		! Mem[000000001000141c] = ffff00b2
!	%l7 = 0000000000000000, Mem[0000000010101400] = ff00ffff
	stwa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010141410] = ff00f9be
	stwa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	Mem[0000000010081401] = fff7bf57, %l3 = 0000000000000000
	ldstuba	[%i2+0x001]%asi,%l3	! %l3 = 000000f7000000ff
!	Mem[00000000211c0000] = 00ff7f1a, %l0 = 0000000000000000
	ldstub	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	%l2 = ffffffffffff0000, Mem[0000000010101408] = ffff00007fffffff
	stxa	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffffffff0000
!	%l2 = ffffffffffff0000, Mem[00000000100c1400] = 8ec1195f
	sth	%l2,[%i3+%g0]		! Mem[00000000100c1400] = 0000195f
!	%f27 = 0000ff8d, Mem[0000000010181400] = ffff9d32
	st	%f27,[%i6+%g0]		! Mem[0000000010181400] = 0000ff8d
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = 0000ffff, %l1 = 0000000000000000
	lduwa	[%i5+0x038]%asi,%l1	! %l1 = 000000000000ffff

p0_label_461:
!	Mem[0000000010181420] = 0aba72be, %l3 = 00000000000000f7
	ldsh	[%i6+0x020],%l3		! %l3 = 0000000000000aba
!	%l2 = ffffffffffff0000, %l1 = 000000000000ffff, %l0 = 0000000000000000
	subc	%l2,%l1,%l0		! %l0 = fffffffffffe0001
!	Mem[0000000010101408] = ffffffff ffff0000, %l2 = ffff0000, %l3 = 00000aba
	ldda	[%i4+%o4]0x80,%l2	! %l2 = 00000000ffffffff 00000000ffff0000
!	Mem[00000000201c0000] = 00ff7d80, %l6 = 000000000000000a
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = 0000195f, %l2 = 00000000ffffffff
	lduba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 0000000057bfffff, %l7 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l7	! %l7 = 0000000057bfffff
!	Mem[0000000030181408] = ff00000000000000, %f18 = ffffffff ffffffff
	ldda	[%i6+%o4]0x81,%f18	! %f18 = ff000000 00000000
!	Mem[00000000201c0000] = 00ff7d80, %l2 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	%l7 = 0000000057bfffff, %l4 = 0000000000000000, %y  = 00000000
	umul	%l7,%l4,%l1		! %l1 = 0000000000000000, %y = 00000000
!	Starting 10 instruction Store Burst
!	%f24 = 0000ff0a 00ff0000, %l5 = 00000000c1e8ff00
!	Mem[00000000300c1408] = 000000000000ffff
	add	%i3,0x008,%g1
	stda	%f24,[%g1+%l5]ASI_PST16_SL ! Mem[00000000300c1408] = 000000000000ffff

p0_label_462:
!	Mem[00000000100c1400] = 0000195f, %l5 = 00000000c1e8ff00
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 000000000000195f
!	%l3 = 00000000ffff0000, Mem[0000000021800081] = 62ff6f0b
	stb	%l3,[%o3+0x081]		! Mem[0000000021800080] = 62006f0b
!	%l6 = 000000ff, %l7 = 57bfffff, Mem[0000000030041410] = 00ff0000 0000807f
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff 57bfffff
!	%l7 = 0000000057bfffff, Mem[00000000300c1410] = ff000000ff0000ff
	stxa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000057bfffff
!	Mem[00000000100c1410] = ffff0000, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 00000000ffff0000
!	%l2 = 000000ff, %l3 = ffff0000, Mem[0000000010101410] = 0a000000 00ff0000
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff ffff0000
!	%l1 = 00000000ffff0000, Mem[0000000020800040] = 00002c25
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 00002c25
!	Mem[0000000030141410] = 5f19c18e, %l7 = 0000000057bfffff
	ldstuba	[%i5+%o5]0x89,%l7	! %l7 = 0000008e000000ff
!	Mem[00000000100c1438] = 0000ffff, %l6 = 000000ff, %l2 = 000000ff
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 000000000000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000ff, %l3 = 00000000ffff0000
	lduwa	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff

p0_label_463:
!	Mem[0000000030001408] = 00000000, %l3 = 00000000000000ff
	lduwa	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l0 = fffffffffffe0001
	lduba	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101408] = ffffffff, %l3 = 0000000000000000
	lduwa	[%i4+%o4]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030101410] = 00ff000000000000, %l3 = 00000000ffffffff
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = 00ff000000000000
!	Mem[0000000010141428] = 8454ff115f19c18e, %l1 = 00000000ffff0000
	ldxa	[%i5+0x028]%asi,%l1	! %l1 = 8454ff115f19c18e
!	Mem[00000000300c1400] = 0000b2d0, %f29 = 00000000
	lda	[%i3+%g0]0x81,%f29	! %f29 = 0000b2d0
!	Mem[0000000030181410] = ff000000, %l2 = 000000000000ffff
	ldsha	[%i6+%o5]0x81,%l2	! %l2 = ffffffffffffff00
!	%f31 = 00000000, %f19 = 00000000
	fcmpes	%fcc0,%f31,%f19		! %fcc0 = 0
!	Mem[0000000010001410] = 00000000, %l1 = 8454ff115f19c18e
	lduha	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = ffffff00, %l3 = 00000000, Mem[0000000010081430] = ff0000ff fe810000
	std	%l2,[%i2+0x030]		! Mem[0000000010081430] = ffffff00 00000000

p0_label_464:
!	Mem[0000000010081438] = 0000ffff, %l2 = ffffffffffffff00
	swap	[%i2+0x038],%l2		! %l2 = 000000000000ffff
!	%l6 = 00000000000000ff, imm = fffffffffffff322, %l3 = 00ff000000000000
	or	%l6,-0xcde,%l3		! %l3 = fffffffffffff3ff
!	%f16 = 7948f18b 63000000, Mem[0000000010001410] = 00000000 ffffffff
	stda	%f16,[%i0+%o5]0x80	! Mem[0000000010001410] = 7948f18b 63000000
!	Mem[0000000010101408] = ffffffffffff0000, %l2 = 000000000000ffff, %l1 = 0000000000000000
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = ffffffffffff0000
!	%f0  = 7948f18b 63000000 00000031 ffffffff
!	%f4  = 0000ff0a fffff4fd 6fb60706 0000ebcb
!	%f8  = 0000807f 00ff0000 ff000000 00000000
!	%f12 = 8ec1195f 11815484 ad880a76 65450a09
	stda	%f0,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
	membar	#Sync			! Added by membar checker (82)
!	Mem[00000000100c1410] = fffff4fd, %l4 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 00000000fffff4fd
!	Mem[0000000010041408] = ffff0000, %l2 = 000000000000ffff
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010141417] = 67e8023a, %l2 = 00000000000000ff
	ldstuba	[%i5+0x017]%asi,%l2	! %l2 = 0000003a000000ff
!	%l1 = ffffffffffff0000, %l2 = 000000000000003a, %l2 = 000000000000003a
	add	%l1,%l2,%l2		! %l2 = ffffffffffff003a
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 000016cb, %l1 = ffffffffffff0000
	ldsh	[%o1+%g0],%l1		! %l1 = 0000000000000000

p0_label_465:
!	Mem[0000000010081428] = 8454ff115f19c18e, %l0 = 00000000000000ff
	ldxa	[%i2+0x028]%asi,%l0	! %l0 = 8454ff115f19c18e
!	Mem[0000000030141400] = 00000000, %l0 = 8454ff115f19c18e
	lduba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 7948f18b, %l7 = 000000000000008e
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000079
!	Mem[0000000030181408] = ff00000000000000, %f28 = ffff9d32 0000b2d0
	ldda	[%i6+%o4]0x81,%f28	! %f28 = ff000000 00000000
!	Mem[0000000030041408] = ffffffff, %l4 = 00000000fffff4fd
	ldsba	[%i1+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181408] = ff00ff00, %l0 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = ffffffffff00ff00
!	Mem[0000000010101408] = ffffffff, %f31 = 00000000
	lda	[%i4+%o4]0x88,%f31	! %f31 = ffffffff
!	Mem[0000000020800000] = 000016cb, %l1 = 0000000000000000
	lduba	[%o1+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = b2d00000, %f3  = ffffffff
	lda	[%i2+%o5]0x80,%f3 	! %f3 = b2d00000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010001410] = 7948f18b
	stba	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = ff48f18b

p0_label_466:
!	%l4 = ffffffffffffffff, Mem[0000000021800140] = 00ff02f2
	stb	%l4,[%o3+0x140]		! Mem[0000000021800140] = ffff02f2
!	%l2 = ffffffffffff003a, Mem[0000000010101400] = 00000000
	stha	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000003a
!	%f16 = 7948f18b 63000000, Mem[0000000030141408] = ffffffff ffffffff
	stda	%f16,[%i5+%o4]0x89	! Mem[0000000030141408] = 7948f18b 63000000
!	Mem[0000000010101400] = 3a000000, %l0 = ffffffffff00ff00
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 0000003a000000ff
!	%l1 = 0000000000000000, Mem[0000000010101425] = 000000ff
	stb	%l1,[%i4+0x025]		! Mem[0000000010101424] = 000000ff
!	Mem[0000000030001400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Code Fragment 3
p0_fragment_48:
!	%l0 = 000000000000003a
	setx	0x1c6f494fb4152279,%g7,%l0 ! %l0 = 1c6f494fb4152279
!	%l1 = 0000000000000000
	setx	0x3e51f37857a19dab,%g7,%l1 ! %l1 = 3e51f37857a19dab
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1c6f494fb4152279
	setx	0xe34655af8749aa28,%g7,%l0 ! %l0 = e34655af8749aa28
!	%l1 = 3e51f37857a19dab
	setx	0x24a0dcc00b5cfe98,%g7,%l1 ! %l1 = 24a0dcc00b5cfe98
!	%l6 = 00000000, %l7 = 00000079, Mem[0000000030081408] = ff00ff00 7f800000
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 00000079
!	Mem[0000000010181410] = bb76e418, %l2 = ffffffffffff003a
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 00000000bb76e418
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = 8ec1195f00000000, %f0  = 7948f18b 63000000
	ldda	[%i0+0x030]%asi,%f0 	! %f0  = 8ec1195f 00000000

p0_label_467:
!	%l6 = 0000000000000000, Mem[0000000010081400] = 57bfffff
	stwa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	Mem[0000000010141400] = 6fb60706 000000ff, %l6 = 00000000, %l7 = 00000079
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 00000000000000ff 000000006fb60706
!	Mem[0000000010181410] = 3a00ffff, %l4 = ffffffffffffffff
	ldsha	[%i6+%o5]0x80,%l4	! %l4 = 0000000000003a00
!	Mem[0000000010101400] = ff000000ff000000, %l0 = e34655af8749aa28
	ldxa	[%i4+0x000]%asi,%l0	! %l0 = ff000000ff000000
!	Mem[0000000010141410] = 00000000, %l7 = 000000006fb60706
	ldsha	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l3 = fffffffffffff3ff
	ldswa	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181420] = 0aba72be 34abffff, %l2 = bb76e418, %l3 = 000000ff
	ldd	[%i6+0x020],%l2		! %l2 = 000000000aba72be 0000000034abffff
!	Mem[0000000030001400] = 000000ff 329dffff, %l2 = 0aba72be, %l3 = 34abffff
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000ff 00000000329dffff
!	Mem[00000000211c0000] = ffff7f1a, %l4 = 0000000000003a00
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f14 = ad880a76 65450a09, %l1 = 24a0dcc00b5cfe98
!	Mem[0000000030041430] = 8ec1195f11815484
	add	%i1,0x030,%g1
	stda	%f14,[%g1+%l1]ASI_PST8_S ! Mem[0000000030041430] = adc1197665815484

p0_label_468:
!	%l5 = 000000000000195f, Mem[0000000030141410] = ffc1195f
	stwa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000195f
!	Mem[000000001000140c] = ffffffff, %l4 = ffffffff, %l2 = 000000ff
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000020800041] = 00002c25, %l7 = 0000000000000000
	ldstub	[%o1+0x041],%l7		! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000329dffff
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000010141408] = ff6fe8c1
	stha	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ffe8c1
!	%l3 = 0000000000000000, imm = fffffffffffff0e0, %l0 = ff000000ff000000
	add	%l3,-0xf20,%l0		! %l0 = fffffffffffff0e0
!	Mem[0000000010041428] = 00000000010f421e, %l5 = 000000000000195f, %l4 = ffffffffffffffff
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 00000000010f421e
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010101418] = ffffffaa 00000061
	std	%l2,[%i4+0x018]		! Mem[0000000010101418] = ffffffff 00000000
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010041408] = 0000ffff 38d11ad3
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000063, %f18 = ff000000
	lda	[%i2+%o4]0x88,%f18	! %f18 = 00000063

p0_label_469:
!	Mem[0000000030041400] = ffffffff, %l4 = 00000000010f421e
	ldsba	[%i1+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001400] = 7948f18bff6fe8c1, %f0  = 8ec1195f 00000000
	ldda	[%i0+%g0]0x80,%f0 	! %f0  = 7948f18b ff6fe8c1
!	%f12 = 8ec1195f 11815484, %f28 = ff000000
	fxtos	%f12,%f28		! %f28 = dee27dcd
!	Mem[0000000010001408] = ffffffff000000ff, %l0 = fffffffffffff0e0
	ldxa	[%i0+%o4]0x80,%l0	! %l0 = ffffffff000000ff
!	Mem[000000001008143c] = 00000000, %f22 = 00000000
	ld	[%i2+0x03c],%f22	! %f22 = 00000000
!	%f15 = 65450a09, %f15 = 65450a09, %f8  = 0000807f
	fmuls	%f15,%f15,%f8 		! %f8  = 7f800000
!	Mem[0000000030001410] = 31000000, %f5  = fffff4fd
	lda	[%i0+%o5]0x89,%f5 	! %f5 = 31000000
!	Mem[0000000010101410] = ff0000000000ffff, %l0 = ffffffff000000ff
	ldxa	[%i4+0x010]%asi,%l0	! %l0 = ff0000000000ffff
!	%l0 = ff0000000000ffff, Mem[0000000021800100] = d0b26971, %asi = 80
	stha	%l0,[%o3+0x100]%asi	! Mem[0000000021800100] = ffff6971
!	Starting 10 instruction Store Burst
!	%f28 = dee27dcd 00000000, Mem[0000000010181400] = 0000ff8d 00000000
	stda	%f28,[%i6+%g0]0x80	! Mem[0000000010181400] = dee27dcd 00000000

p0_label_470:
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010001410] = 8bf148ff 00000063
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff 00000000
!	Mem[0000000030081408] = 00000000, %l4 = ffffffffffffffff
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%f22 = 00000000 ffffd0b2, Mem[0000000010001408] = ffffffff 000000ff
	stda	%f22,[%i0+0x008]%asi	! Mem[0000000010001408] = 00000000 ffffd0b2
!	Mem[0000000010081422] = 18e476bb, %l5 = 000000000000195f
	ldstub	[%i2+0x022],%l5		! %l5 = 00000076000000ff
!	%l7 = 0000000000000000, Mem[0000000030081410] = 000060f3
	stha	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 000060f3
!	%l4 = 0000000000000000, Mem[0000000020800040] = 00ff2c25
	stb	%l4,[%o1+0x040]		! Mem[0000000020800040] = 00ff2c25
!	%f28 = dee27dcd, Mem[0000000010081428] = 8454ff11
	sta	%f28,[%i2+0x028]%asi	! Mem[0000000010081428] = dee27dcd
!	%l6 = 00000000000000ff, Mem[0000000030001410] = 00000031ffffffff
	stxa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000000000ff
!	%f26 = 23044fff 0000ff8d, %l2 = 00000000ffffffff
!	Mem[0000000030181410] = ff00000000000000
	add	%i6,0x010,%g1
	stda	%f26,[%g1+%l2]ASI_PST32_S ! Mem[0000000030181410] = 23044fff0000ff8d
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000063, %l5 = 0000000000000076
	ldstuba	[%i5+%o4]0x81,%l5	! %l5 = 00000000000000ff

p0_label_471:
!	Mem[00000000300c1400] = 0000b2d0, %f19 = 00000000
	lda	[%i3+%g0]0x81,%f19	! %f19 = 0000b2d0
!	Mem[0000000010181418] = 00000020, %l6 = 00000000000000ff
	lduha	[%i6+0x01a]%asi,%l6	! %l6 = 0000000000000020
!	Mem[0000000010101424] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i4+0x024]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = 00000000cd7de2de, %f24 = 0000ff0a 00ff0000
	ldda	[%i6+%g0]0x88,%f24	! %f24 = 00000000 cd7de2de
!	Code Fragment 3
p0_fragment_49:
!	%l0 = ff0000000000ffff
	setx	0x1e8c8d87c416c1ba,%g7,%l0 ! %l0 = 1e8c8d87c416c1ba
!	%l1 = 24a0dcc00b5cfe98
	setx	0x35de958f8b5eb157,%g7,%l1 ! %l1 = 35de958f8b5eb157
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1e8c8d87c416c1ba
	setx	0x6b9d876819c9df29,%g7,%l0 ! %l0 = 6b9d876819c9df29
!	%l1 = 35de958f8b5eb157
	setx	0x287f21efba812891,%g7,%l1 ! %l1 = 287f21efba812891
!	Mem[0000000030141408] = ff000063, %l2 = 00000000ffffffff
	ldsha	[%i5+%o4]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010001408] = 00000000, %f1  = ff6fe8c1
	lda	[%i0+%o4]0x80,%f1 	! %f1 = 00000000
!	Mem[0000000010101438] = fffff0b6, %l3 = 0000000000000000
	lduba	[%i4+0x038]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l1 = 287f21efba812891
	ldsba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 6b9d876819c9df29, Mem[0000000010181400] = dee27dcd
	stha	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = df297dcd

p0_label_472:
!	%l0 = 6b9d876819c9df29, Mem[0000000010041408] = ffffffff00000000
	stxa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 6b9d876819c9df29
!	%l7 = 00000000000000ff, Mem[0000000010181400] = cd7d29df
	stba	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = cd7d29ff
!	%f30 = 0aff0000, Mem[0000000030041400] = ffffffff
	sta	%f30,[%i1+%g0]0x89	! Mem[0000000030041400] = 0aff0000
!	Mem[0000000010181410] = ffff003a, %l2 = ffffffffffffff00
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 0000003a000000ff
!	%f18 = 00000063, %f2  = 00000031, %f26 = 23044fff 0000ff8d
	fsmuld	%f18,%f2 ,%f26		! %l0 = 6b9d876819c9df4b, Unfinished, %fsr = 2600000000
!	Mem[0000000010101410] = ff000000, %l6 = 0000000000000020
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000010001427] = 00ff0000
	stb	%l4,[%i0+0x027]		! Mem[0000000010001424] = 00ff0000
!	%f18 = 00000063 0000b2d0, Mem[0000000030141408] = 630000ff 7948f18b
	stda	%f18,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000063 0000b2d0
!	Mem[0000000010081408] = 63000000, %l3 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 00000063000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041418] = ff0000ff7fffffff, %l3 = 0000000000000063
	ldx	[%i1+0x018],%l3		! %l3 = ff0000ff7fffffff

p0_label_473:
!	Mem[0000000030101410] = 00000000, %l2 = 000000000000003a
	ldsha	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = ff00ffff, %l7 = 00000000000000ff
	lduwa	[%i6+0x010]%asi,%l7	! %l7 = 00000000ff00ffff
!	Mem[00000000100c1408] = ffffffff, %l4 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030041408] = ffffffff, %f18 = 00000063
	lda	[%i1+%o4]0x81,%f18	! %f18 = ffffffff
!	Mem[0000000010181408] = ff00ff00, %l5 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = 0000000000000000, %l2 = 00000000000000ff
	ldx	[%i2+%g0],%l2		! %l2 = 0000000000000000
!	Mem[00000000201c0000] = 00ff7d80, %l7 = 00000000ff00ffff
	lduh	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000020800040] = 00ff2c25, %l0 = 6b9d876819c9df4b
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000030081410] = 000060f3
	stwa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff

p0_label_474:
!	%f23 = ffffd0b2, Mem[0000000010141408] = c1e8ff00
	sta	%f23,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffd0b2
!	Mem[0000000010181400] = ff297dcd, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 00000000ff297dcd
!	%l0 = 00000000000000ff, Mem[0000000010001400] = 8bf14879
	stba	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 8bf148ff
!	%l2 = 00000000, %l3 = 7fffffff, Mem[0000000010001410] = ffffffff 00000000
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 7fffffff
!	%l0 = 00000000000000ff, Mem[0000000010101430] = 0000d0b2ff000000
	stx	%l0,[%i4+0x030]		! Mem[0000000010101430] = 00000000000000ff
!	%f9  = 00ff0000, Mem[0000000010081410] = b2d00000
	sta	%f9 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ff0000
!	%l6 = 00000000000000ff, Mem[00000000300c1410] = 00000000
	stha	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff
!	Mem[0000000030081400] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000000000ff, %f30 = 0aff0000 ffffffff
	ldda	[%i1+%o5]0x88,%f30	! %f30 = 00000000 000000ff

p0_label_475:
!	Mem[0000000030101408] = 0aff0000, %l7 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000aff
!	Mem[0000000010101408] = 0000ffff ffffffff, %l4 = 0000ffff, %l5 = 00000000
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 00000000ffffffff 000000000000ffff
!	Mem[0000000010101408] = ffffffffffff0000, %l2 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffff0000
!	Mem[0000000030041410] = ff000000, %l0 = 00000000000000ff
	ldswa	[%i1+%o5]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[00000000100c1410] = 0000ff0a ffff9d32, %l6 = 000000ff, %l7 = 00000aff
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 00000000ffff9d32 000000000000ff0a
!	Mem[0000000010081400] = 00000000, %l4 = 00000000ffffffff
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1430] = 845481115f19c18e, %l5 = 000000000000ffff
	ldxa	[%i3+0x030]%asi,%l5	! %l5 = 845481115f19c18e
!	Mem[0000000030141400] = 00000000 ffff8b0c, %l6 = ffff9d32, %l7 = 0000ff0a
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000 00000000ffff8b0c
!	Mem[0000000030141400] = 00000000, %l6 = 0000000000000000
	ldswa	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ffff8b0c, Mem[0000000010141408] = 1e000000ffffd0b2
	stxa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000ffff8b0c

p0_label_476:
!	%l1 = 00000000ff297dcd, Mem[0000000010041400] = 00000000
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = cd000000
!	Mem[0000000030001408] = 00000000, %l3 = ff0000ff7fffffff
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%f2  = 00000031 b2d00000, Mem[0000000010181410] = ffff00ff 00000000
	stda	%f2 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000031 b2d00000
!	Mem[0000000030101400] = ff6fe8c1, %l5 = 845481115f19c18e
	ldstuba	[%i4+%g0]0x89,%l5	! %l5 = 000000c1000000ff
!	%f7  = 0000ebcb, %f18 = ffffffff, %f23 = ffffd0b2
	fmuls	%f7 ,%f18,%f23		! %f23 = ffffffff
!	Mem[0000000030041408] = ffffffff, %l3 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 00000000ffffffff
!	%f4  = 0000ff0a, Mem[0000000010041400] = 000000cd
	sta	%f4 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000ff0a
!	%l2 = ffff0000, %l3 = ffffffff, Mem[0000000010001438] = ffff0000 00000000
	stda	%l2,[%i0+0x038]%asi	! Mem[0000000010001438] = ffff0000 ffffffff
!	%f0  = 7948f18b 00000000, %l6 = 0000000000000000
!	Mem[0000000030041410] = ff000000ffffbf57
	add	%i1,0x010,%g1
	stda	%f0,[%g1+%l6]ASI_PST8_S ! Mem[0000000030041410] = ff000000ffffbf57
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00ff00ff, %f7  = 0000ebcb
	ld	[%i6+%o4],%f7 	! %f7 = 00ff00ff

p0_label_477:
!	Mem[0000000010101410] = ff000000, %l3 = 00000000ffffffff
	ldswa	[%i4+%o5]0x80,%l3	! %l3 = ffffffffff000000
!	Code Fragment 3
p0_fragment_50:
!	%l0 = ffffffffff000000
	setx	0x27689057c47e94b7,%g7,%l0 ! %l0 = 27689057c47e94b7
!	%l1 = 00000000ff297dcd
	setx	0x8ffa7297bc936e2f,%g7,%l1 ! %l1 = 8ffa7297bc936e2f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 27689057c47e94b7
	setx	0xb24bda5fe5684509,%g7,%l0 ! %l0 = b24bda5fe5684509
!	%l1 = 8ffa7297bc936e2f
	setx	0x80125b906849e526,%g7,%l1 ! %l1 = 80125b906849e526
!	Mem[00000000100c1418] = cbeb00000607b66f, %f28 = dee27dcd 00000000
	ldda	[%i3+0x018]%asi,%f28	! %f28 = cbeb0000 0607b66f
!	Mem[0000000010081408] = 000000ff, %l2 = ffffffffffff0000
	ldsha	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101410] = ff0000000000ffff, %f8  = 7f800000 00ff0000
	ldda	[%i4+%o5]0x80,%f8 	! %f8  = ff000000 0000ffff
!	Mem[0000000030181410] = 8dff0000 ff4f0423, %l0 = e5684509, %l1 = 6849e526
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000ff4f0423 000000008dff0000
!	Mem[0000000030001410] = 00000000, %l6 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081404] = 00000000, %f21 = ffffffff
	ld	[%i2+0x004],%f21	! %f21 = 00000000
!	Mem[00000000100c1414] = 0aff0000, %f31 = 000000ff
	lda	[%i3+0x014]%asi,%f31	! %f31 = 0aff0000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000c1, Mem[00000000211c0000] = ffff7f1a, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00c17f1a

p0_label_478:
!	Mem[0000000010001410] = 00000000, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%l0 = ff4f0423, %l1 = 8dff0000, Mem[0000000010081400] = 00000000 00000000
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = ff4f0423 8dff0000
!	%l4 = 0000000000000000, Mem[00000000300c1400] = 0000b2d0
	stba	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000b2d0
!	%f5  = 31000000, Mem[00000000100c1414] = 0aff0000
	sta	%f5 ,[%i3+0x014]%asi	! Mem[00000000100c1414] = 31000000
!	Mem[0000000010001424] = 00ff0000, %l5 = 00000000000000c1
	ldstuba	[%i0+0x024]%asi,%l5	! %l5 = 00000000000000ff
!	%f26 = 23044fff 0000ff8d, Mem[0000000010081400] = ff4f0423 8dff0000
	stda	%f26,[%i2+%g0]0x88	! Mem[0000000010081400] = 23044fff 0000ff8d
!	Mem[0000000030001410] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = ffffffff, %l4 = 00000000, %l3 = ff000000
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 00000000ffffffff
!	%l1 = 000000008dff0000, Mem[0000000010001410] = 00000000
	stba	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000

p0_label_479:
!	Mem[0000000010101408] = 0000ffffffffffff, %l6 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l6	! %l6 = 0000ffffffffffff
!	Mem[0000000010141400] = ff0000000607b66f, %f20 = 0000ff0a 00000000
	ldda	[%i5+0x000]%asi,%f20	! %f20 = ff000000 0607b66f
!	%f9  = 0000ffff, %f7  = 00ff00ff
	fcmps	%fcc3,%f9 ,%f7 		! %fcc3 = 1
!	%l4 = 0000000000000000, imm = ffffffffffffff3b, %l0 = 00000000ff4f0423
	xnor	%l4,-0x0c5,%l0		! %l0 = 00000000000000c4
!	Mem[0000000030141408] = d0b20000, %l4 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l4	! %l4 = 000000000000d0b2
!	Mem[0000000010001408] = 00000000, %l4 = 000000000000d0b2
	lduwa	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %l1 = 000000008dff0000
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010001400] = c1e86fff8bf148ff, %f30 = 00000000 0aff0000
	ldda	[%i0+%g0]0x88,%f30	! %f30 = c1e86fff 8bf148ff
!	Mem[0000000010041410] = 00000000 000000ff, %l0 = 000000c4, %l1 = 0000ff00
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%f4  = 0000ff0a, Mem[0000000010181408] = ff00ff00
	sta	%f4 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000ff0a

p0_label_480:
!	Mem[00000000100c1410] = 329dffff, %l5 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 00000000329dffff
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001430] = 8ec1195f00000000, %l0 = 00000000000000ff, %l6 = 0000ffffffffffff
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = 8ec1195f00000000
!	%l2 = 0000000000000000, Mem[000000001018140c] = 00000000, %asi = 80
	stba	%l2,[%i6+0x00c]%asi	! Mem[000000001018140c] = 00000000
!	%f30 = c1e86fff 8bf148ff, %l5 = 00000000329dffff
!	Mem[0000000010041430] = 845481115f19c18e
	add	%i1,0x030,%g1
	stda	%f30,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010041430] = ff48f18bff6fe8c1
!	%l3 = 00000000ffffffff, Mem[00000000300c1400] = 0000b2d0
	stwa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff
!	%l4 = 0000000000000000, %l4 = 0000000000000000, %y  = 00000000
	udiv	%l4,%l4,%l7		! Div by zero, %l0 = 000000000000014f
	mov	%l0,%y			! %y = 00000127
!	%l6 = 8ec1195f00000000, Mem[0000000030181400] = 00000000
	stwa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[0000000010081408] = ff000000, %l7 = 00000000ffff8b0c
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000000000ff, %l7 = 00000000000000ff
	ldxa	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000ff

p0_label_481:
!	%l5 = 00000000329dffff, %l0 = 0000000000000127, %l1 = 0000000000000000
	orn	%l5,%l0,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010081410] = 00ff0000, %f10 = ff000000
	lda	[%i2+%o5]0x80,%f10	! %f10 = 00ff0000
!	Mem[00000000100c142c] = 000000ff, %l7 = 00000000000000ff
	lduw	[%i3+0x02c],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030041408] = 00000000, %f29 = 0607b66f
	lda	[%i1+%o4]0x81,%f29	! %f29 = 00000000
!	Code Fragment 3
p0_fragment_51:
!	%l0 = 0000000000000127
	setx	0x1a622da7b3fc22b1,%g7,%l0 ! %l0 = 1a622da7b3fc22b1
!	%l1 = ffffffffffffffff
	setx	0x1f0a913809f76a68,%g7,%l1 ! %l1 = 1f0a913809f76a68
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1a622da7b3fc22b1
	setx	0xf0cb467022a77894,%g7,%l0 ! %l0 = f0cb467022a77894
!	%l1 = 1f0a913809f76a68
	setx	0x5b82d0a7e85cca64,%g7,%l1 ! %l1 = 5b82d0a7e85cca64
!	Mem[0000000010001400] = ff48f18b, %l1 = 5b82d0a7e85cca64
	lduba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101410] = ff000000, %f10 = 00ff0000
	ld	[%i4+%o5],%f10	! %f10 = ff000000
!	Mem[0000000010181420] = 0aba72be, %f19 = 0000b2d0
	ld	[%i6+0x020],%f19	! %f19 = 0aba72be
!	Mem[0000000030081400] = ff000000000000ff, %l7 = 00000000000000ff
	ldxa	[%i2+%g0]0x81,%l7	! %l7 = ff000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = 00c17f1a, %l0 = f0cb467022a77894
	ldstub	[%o2+%g0],%l0		! %l0 = 00000000000000ff

p0_label_482:
!	Mem[0000000020800040] = 00ff2c25, %l5 = 00000000329dffff
	ldstuba	[%o1+0x040]%asi,%l5	! %l5 = 00000000000000ff
!	%f8  = ff000000 0000ffff, Mem[00000000300c1400] = ffffffff ff000000
	stda	%f8 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff000000 0000ffff
!	%l1 = 00000000000000ff, Mem[0000000030141410] = 000000cb5f190000
	stxa	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030081410] = 000000ff
	stha	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 00ff00ff
!	%l2 = 00000000, %l3 = ffffffff, Mem[00000000100c1410] = 00000000 00000031
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 ffffffff
!	%l6 = 8ec1195f00000000, %l1 = 00000000000000ff, %l6 = 8ec1195f00000000
	orn	%l6,%l1,%l6		! %l6 = ffffffffffffff00
!	%l1 = 00000000000000ff, Mem[0000000030081400] = ff000000
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00ff0000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010181410] = 0000d0b2 31000000
	std	%l4,[%i6+%o5]		! Mem[0000000010181410] = 00000000 00000000
!	Mem[0000000010141400] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = ffffc5c1, %l4 = 0000000000000000
	lduh	[%o3+0x180],%l4		! %l4 = 000000000000ffff

p0_label_483:
!	%f1  = 00000000, %f9  = 0000ffff, %f0  = 7948f18b 00000000
	fsmuld	%f1 ,%f9 ,%f0 		! %f0  = 00000000 00000000
!	Mem[0000000030141400] = 00000000, %f16 = 7948f18b
	lda	[%i5+%g0]0x81,%f16	! %f16 = 00000000
!	Mem[00000000300c1410] = ff000000, %l3 = 00000000ffffffff
	ldswa	[%i3+%o5]0x81,%l3	! %l3 = ffffffffff000000
!	Mem[00000000100c1408] = 00000031ffffffff, %l7 = ff000000000000ff
	ldxa	[%i3+%o4]0x88,%l7	! %l7 = 00000031ffffffff
!	Mem[0000000030001408] = ffffffff 000000ff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000000000ff 00000000ffffffff
!	Mem[000000001010140c] = ffff0000, %l6 = ffffffffffffff00
	lduw	[%i4+0x00c],%l6		! %l6 = 00000000ffff0000
!	Mem[000000001004141c] = 7fffffff, %f0  = 00000000
	ld	[%i1+0x01c],%f0 	! %f0 = 7fffffff
!	Mem[0000000030001400] = 000000ff329dffff, %f26 = 23044fff 0000ff8d
	ldda	[%i0+%g0]0x81,%f26	! %f26 = 000000ff 329dffff
!	Mem[0000000030001400] = ff000000, %l3 = ffffffffff000000
	lduba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = 00000031 b2d00000, %l1 = 00000000ffffffff
!	Mem[0000000030141428] = 000066f300ffffff
	add	%i5,0x028,%g1
	stda	%f2,[%g1+%l1]ASI_PST16_S ! Mem[0000000030141428] = 00000031b2d00000

p0_label_484:
!	%l0 = 000000ff, %l1 = ffffffff, Mem[0000000010041400] = 0aff0000 0000ffff
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff ffffffff
!	%l3 = 0000000000000000, Mem[0000000030081408] = ffffffff
	stba	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ffffff
!	%l4 = 000000000000ffff, Mem[0000000010101400] = ff000000
	stba	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000
!	%f4  = 0000ff0a 31000000, %l6 = 00000000ffff0000
!	Mem[0000000010181438] = 00000000edb91eff
	add	%i6,0x038,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010181438] = 00000000edb91eff
!	%l5 = 00000000000000ff, Mem[00000000100c1400] = 7948f18b63000000
	stxa	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000000000ff
!	%f16 = 00000000 63000000 ffffffff 0aba72be
!	%f20 = ff000000 0607b66f 00000000 ffffffff
!	%f24 = 00000000 cd7de2de 000000ff 329dffff
!	%f28 = cbeb0000 00000000 c1e86fff 8bf148ff
	stda	%f16,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
!	%l1 = 00000000ffffffff, Mem[0000000030081408] = 00ffffff
	stba	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffffff
!	%l6 = ffff0000, %l7 = ffffffff, Mem[0000000010001400] = ff48f18b ff6fe8c1
	stda	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = ffff0000 ffffffff
!	Mem[0000000030081408] = ffffffff, %l0 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff000000, %l5 = 00000000000000ff
	ldsha	[%i3+%o5]0x81,%l5	! %l5 = ffffffffffffff00

p0_label_485:
!	Mem[0000000010001418] = 6fb60706, %l2 = 0000000000000000
	lduh	[%i0+0x018],%l2		! %l2 = 0000000000006fb6
	membar	#Sync			! Added by membar checker (83)
!	Mem[0000000010181408] = 0000ff0a, %l4 = 000000000000ffff
	lduha	[%i6+%o4]0x88,%l4	! %l4 = 000000000000ff0a
!	Mem[0000000010041410] = ff000000, %l0 = 00000000000000ff
	ldsw	[%i1+%o5],%l0		! %l0 = ffffffffff000000
!	Mem[0000000010081428] = dee27dcd5f19c18e, %f24 = 00000000 cd7de2de
	ldd	[%i2+0x028],%f24	! %f24 = dee27dcd 5f19c18e
!	Mem[0000000030101400] = ffe86fff, %l6 = 00000000ffff0000
	ldsha	[%i4+%g0]0x81,%l6	! %l6 = ffffffffffffffe8
!	Mem[00000000100c1408] = ffffffff, %l0 = ffffffffff000000
	lduha	[%i3+%o4]0x88,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010081410] = 00ff0000 00000000, %l0 = 0000ffff, %l1 = ffffffff
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 0000000000ff0000 0000000000000000
!	Mem[0000000010041400] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041400] = 0000ff0affffffff, %f4  = 0000ff0a 31000000
	ldda	[%i1+%g0]0x81,%f4 	! %f4  = 0000ff0a ffffffff
!	Starting 10 instruction Store Burst
!	%l6 = ffffffe8, %l7 = ffffffff, Mem[00000000300c1400] = ffff0000 000000ff
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffe8 ffffffff

p0_label_486:
!	%l0 = 0000000000ff0000, Mem[0000000010141410] = 00000000
	stba	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%l6 = ffffffffffffffe8, Mem[00000000300c1410] = 000000ff
	stha	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000ffe8
!	%f26 = 000000ff 329dffff, Mem[0000000030101410] = 00000000 0000ff00
	stda	%f26,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff 329dffff
!	%l5 = ffffffffffffff00, Mem[0000000010081410] = 00ff000000000000
	stxa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffffffffff00
!	%l4 = 0000ff0a, %l5 = ffffff00, Mem[00000000100c1420] = 0000ff00 7f800000
	stda	%l4,[%i3+0x020]%asi	! Mem[00000000100c1420] = 0000ff0a ffffff00
!	%l4 = 000000000000ff0a, Mem[00000000300c1410] = e8ff0000
	stba	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0aff0000
!	Mem[00000000300c1400] = ffffffe8, %l6 = ffffffffffffffe8
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 00000000ffffffe8
!	%l2 = 00006fb6, %l3 = 00000000, Mem[00000000300c1400] = e8ffffff ffffffff
	stda	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00006fb6 00000000
!	%l6 = 00000000ffffffe8, Mem[0000000010141414] = 67e802ff
	stw	%l6,[%i5+0x014]		! Mem[0000000010141414] = ffffffe8
!	Starting 10 instruction Load Burst
!	%f14 = ad880a76, %f12 = 8ec1195f, %f27 = 329dffff
	fsubs	%f14,%f12,%f27		! %f27 = ad880a76

p0_label_487:
!	Mem[0000000030041400] = 0aff0000, %l3 = 0000000000000000
	lduwa	[%i1+%g0]0x89,%l3	! %l3 = 000000000aff0000
!	Mem[0000000010081410] = ffffffffffffff00, %f22 = 00000000 ffffffff
	ldda	[%i2+0x010]%asi,%f22	! %f22 = ffffffff ffffff00
!	Mem[0000000010041420] = bbde47e2ff000061, %l5 = ffffffffffffff00
	ldx	[%i1+0x020],%l5		! %l5 = bbde47e2ff000061
!	Mem[00000000211c0000] = ffc17f1a, %l4 = 000000000000ff0a
	ldsba	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000021800100] = ffff6971, %l3 = 000000000aff0000
	lduh	[%o3+0x100],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010001400] = ffff0000, %f22 = ffffffff
	lda	[%i0+0x000]%asi,%f22	! %f22 = ffff0000
!	Mem[0000000010001424] = ffff0000, %l7 = 00000031ffffffff
	lduh	[%i0+0x024],%l7		! %l7 = 000000000000ffff
!	Mem[00000000300c1400] = 00006fb6, %l6 = 00000000ffffffe8
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = 0000000000006fb6
!	Mem[0000000010141430] = ff0000fffe810000, %f2  = 00000031 b2d00000
	ldd	[%i5+0x030],%f2 	! %f2  = ff0000ff fe810000
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000030101400] = 0000ffffff6fe8ff
	stxa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffffffffffff

p0_label_488:
!	%f4  = 0000ff0a ffffffff, Mem[0000000030141400] = 00000000 ffff8b0c
	stda	%f4 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000ff0a ffffffff
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000ff0000
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010181410] = 00000000
	stwa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%f12 = 8ec1195f 11815484, Mem[0000000030181410] = 000000ff 6fb60706
	stda	%f12,[%i6+%o5]0x89	! Mem[0000000030181410] = 8ec1195f 11815484
!	Code Fragment 4
p0_fragment_52:
!	%l0 = 0000000000000000
	setx	0x0afac887dd03edbe,%g7,%l0 ! %l0 = 0afac887dd03edbe
!	%l1 = 0000000000000000
	setx	0xf1c9d9081e583ee8,%g7,%l1 ! %l1 = f1c9d9081e583ee8
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0afac887dd03edbe
	setx	0x2152af479ff2f0d1,%g7,%l0 ! %l0 = 2152af479ff2f0d1
!	%l1 = f1c9d9081e583ee8
	setx	0xd291eacfe3824e3f,%g7,%l1 ! %l1 = d291eacfe3824e3f
!	%l7 = 000000000000ffff, Mem[00000000100c1400] = ff000000
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000ffff
!	%l2 = 00006fb6, %l3 = 0000ffff, Mem[0000000010081408] = 000000ff 1e000000
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00006fb6 0000ffff
!	%l1 = d291eacfe3824e3f, Mem[00000000201c0000] = 00ff7d80, %asi = 80
	stba	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 3fff7d80
!	Mem[00000000100c1438] = 090a4565, %l5 = bbde47e2ff000061, %asi = 80
	swapa	[%i3+0x038]%asi,%l5	! %l5 = 00000000090a4565
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00006fb6, %l1 = d291eacfe3824e3f
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 0000000000006fb6

p0_label_489:
!	Mem[0000000030141400] = 0000ff0a, %l3 = 000000000000ffff
	ldsha	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000021800100] = ffff6971, %l4 = ffffffffffffffff
	lduh	[%o3+0x100],%l4		! %l4 = 000000000000ffff
!	%l7 = 000000000000ffff, %l3 = 0000000000000000, %l5 = 00000000090a4565
	xnor	%l7,%l3,%l5		! %l5 = ffffffffffff0000
!	Mem[0000000010141410] = e8ffffff00000000, %f16 = 00000000 63000000
	ldda	[%i5+%o5]0x88,%f16	! %f16 = e8ffffff 00000000
!	Mem[0000000010141408] = 00000000ffff8b0c, %f18 = ffffffff 0aba72be
	ldda	[%i5+%o4]0x88,%f18	! %f18 = 00000000 ffff8b0c
!	Mem[0000000010181400] = 00000000, %f13 = 11815484
	lda	[%i6+%g0]0x88,%f13	! %f13 = 00000000
!	Mem[0000000010001410] = 00000000, %l2 = 0000000000006fb6
	lduha	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = ffffffff, %l0 = 2152af479ff2f0d1
	lduwa	[%i6+%o4]0x89,%l0	! %l0 = 00000000ffffffff
!	Mem[00000000300c1400] = 00000000 00006fb6, %l0 = ffffffff, %l1 = 00006fb6
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 0000000000006fb6 0000000000000000
!	Starting 10 instruction Store Burst
!	%f28 = cbeb0000, %f24 = dee27dcd, %f28 = cbeb0000
	fmuls	%f28,%f24,%f28		! %f28 = 6b4fe97b

p0_label_490:
!	%f16 = e8ffffff 00000000, %l0 = 0000000000006fb6
!	Mem[00000000300c1428] = ff61000000000000
	add	%i3,0x028,%g1
	stda	%f16,[%g1+%l0]ASI_PST32_SL ! Mem[00000000300c1428] = ff610000ffffffe8
!	Mem[0000000010141400] = ff000000, %l2 = 0000000000000000
	swap	[%i5+%g0],%l2		! %l2 = 00000000ff000000
!	Mem[0000000010101428] = bfff00ff, %l2 = ff000000, %l4 = 0000ffff
	add	%i4,0x28,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 00000000bfff00ff
!	%l0 = 0000000000006fb6, Mem[0000000010081408] = 00006fb6
	stha	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00006fb6
!	Mem[0000000010041408] = 6b9d8768, %l2 = 00000000ff000000
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 0000006b000000ff
!	%l1 = 0000000000000000, immed = fffffc6b, %y  = 00000127
	umul	%l1,-0x395,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[00000000201c0001] = 3fff7d80, %l5 = ffffffffffff0000
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	%f23 = ffffff00, %f7  = 00ff00ff, %f17 = 00000000
	fmuls	%f23,%f7 ,%f17		! %f17 = ffffff00
!	%f29 = 00000000, %f14 = ad880a76, %f4  = 0000ff0a
	fadds	%f29,%f14,%f4 		! %f4  = ad880a76
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0000ffff00000000, %l4 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l4	! %l4 = 0000ffff00000000

p0_label_491:
!	%l1 = 0000000000000000, Mem[0000000010001410] = 00000000
	stha	%l1,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[0000000010101418] = ffffffff 00000000, %l2 = 0000006b, %l3 = 00000000
	ldda	[%i4+0x018]%asi,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[0000000010181410] = 00000000, %f4  = ad880a76
	lda	[%i6+%o5]0x88,%f4 	! %f4 = 00000000
!	Mem[0000000010101400] = ff000000, %l0 = 0000000000006fb6
	lduha	[%i4+%g0]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010041408] = ff9d8768 19c9df29, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 00000000ff9d8768 0000000019c9df29
!	Mem[00000000100c1410] = 00000000, %l4 = 0000ffff00000000
	lduwa	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 84548111, %l2 = 00000000ff9d8768
	ldswa	[%i6+%o5]0x81,%l2	! %l2 = ffffffff84548111
!	%l3 = 0000000019c9df29, immed = fffffd91, %y  = 00000000
	smul	%l3,-0x26f,%l1		! %l1 = ffffffc13db9eb39, %y = ffffffc1
!	Mem[0000000010081408] = 00006fb6, %l7 = 000000000000ffff
	lduba	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000b6
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[00000000300c1410] = 0aff000057bfffff
	stxa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000000000ff

p0_label_492:
!	Mem[000000001010142b] = bfff00ff, %l7 = 00000000000000b6
	ldstuba	[%i4+0x02b]%asi,%l7	! %l7 = 000000ff000000ff
!	%f0  = 7fffffff 00000000, %l3 = 0000000019c9df29
!	Mem[0000000030001438] = 3988957ad31ad138
	add	%i0,0x038,%g1
	stda	%f0,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030001438] = 0000957ad31aff7f
!	%l3 = 0000000019c9df29, %l3 = 0000000019c9df29, %l5  = 00000000000000ff
	mulx	%l3,%l3,%l5		! %l5 = 02990cc632ea7491
!	Mem[0000000030181410] = 84548111, %l3 = 0000000019c9df29
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 0000000084548111
!	Mem[0000000030181400] = 0000ff00, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 000000000000ff00
!	%l1 = ffffffc13db9eb39, Mem[0000000030141400] = 0aff0000
	stba	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 0aff0039
!	Mem[0000000010001400] = ffff0000, %l2 = ffffffff84548111
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%l5 = 02990cc632ea7491, Mem[0000000010081414] = ffffff00
	stw	%l5,[%i2+0x014]		! Mem[0000000010081414] = 32ea7491
!	%f10 = ff000000 00000000, %l6 = 0000000000006fb6
!	Mem[0000000010041438] = 001e000000000031
	add	%i1,0x038,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_P ! Mem[0000000010041438] = 001e000000000031
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (84)
!	Mem[0000000010141400] = 00000000 0607b66f 0c8bffff 00000000
!	Mem[0000000010141410] = 00000000 ffffffe8 00000000 ff000000
!	Mem[0000000010141420] = 18e476bb 00000031 8454ff11 5f19c18e
!	Mem[0000000010141430] = ff0000ff fe810000 0000ffff 00000000
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400

p0_label_493:
!	Mem[0000000010141408] = ffff8b0c, %l3 = 0000000084548111
	ldsba	[%i5+%o4]0x88,%l3	! %l3 = 000000000000000c
!	Mem[0000000020800000] = 000016cb, %l7 = 00000000000000ff
	lduba	[%o1+0x001]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000006fb6
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = ffffffff32ea7491, %l7 = 0000000000000000
	ldx	[%i2+%o5],%l7		! %l7 = ffffffff32ea7491
!	Mem[0000000010081404] = ff4f0423, %f3  = fe810000
	ld	[%i2+0x004],%f3 	! %f3 = ff4f0423
!	Mem[00000000211c0000] = ffc17f1a, %l1 = ffffffc13db9eb39
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffc1
!	Mem[0000000010101400] = 000000ff, %l0 = 000000000000ff00
	ldsba	[%i4+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081410] = ffffffff, %f10 = ff000000
	lda	[%i2+%o5]0x80,%f10	! %f10 = ffffffff
!	Mem[0000000030041400] = 0aff0000, %l3 = 000000000000000c
	ldswa	[%i1+%g0]0x89,%l3	! %l3 = 000000000aff0000
!	Starting 10 instruction Store Burst
!	%f12 = 8ec1195f, Mem[0000000010081410] = ffffffff
	sta	%f12,[%i2+%o5]0x80	! Mem[0000000010081410] = 8ec1195f

p0_label_494:
!	Code Fragment 3
p0_fragment_53:
!	%l0 = ffffffffffffffff
	setx	0x2d0a87507b9ebd8c,%g7,%l0 ! %l0 = 2d0a87507b9ebd8c
!	%l1 = ffffffffffffffc1
	setx	0x3d6d9a48556e4bf2,%g7,%l1 ! %l1 = 3d6d9a48556e4bf2
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2d0a87507b9ebd8c
	setx	0x1cd33c3fd6ee855c,%g7,%l0 ! %l0 = 1cd33c3fd6ee855c
!	%l1 = 3d6d9a48556e4bf2
	setx	0x5d0967d86f54f09e,%g7,%l1 ! %l1 = 5d0967d86f54f09e
!	Mem[000000001014141c] = ff000000, %l6 = 0000000000000000
	ldstub	[%i5+0x01c],%l6		! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[0000000010001408] = 00000000
	stha	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	Mem[00000000211c0000] = ffc17f1a, %l0 = 1cd33c3fd6ee855c
	ldstub	[%o2+%g0],%l0		! %l0 = 000000ff000000ff
!	%l4 = 000000000000ff00, Mem[0000000010001400] = ffff0000
	stba	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 00ff0000
!	%f0  = 7fffffff, %f4  = 00000000
	fitos	%f0 ,%f4 		! %f4  = 4f000000
!	Mem[0000000010001408] = ff000000ffffd0b2, %l5 = 02990cc632ea7491, %l7 = ffffffff32ea7491
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = ff000000ffffd0b2
!	Mem[00000000100c1438] = ff000061, %l1 = 6f54f09e, %l2 = 000000ff
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 00000000ff000061
!	%l1 = 5d0967d86f54f09e, Mem[0000000030001400] = ff000000
	stba	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = ff00009e
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff000000, %l7 = ff000000ffffd0b2
	ldsha	[%i0+%o4]0x81,%l7	! %l7 = ffffffffffffff00

p0_label_495:
!	Mem[00000000201c0000] = 3fff7d80, %l6 = 00000000000000ff
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 000000000000003f
!	Mem[0000000010141400] = 00000000, %f8  = ff000000
	lda	[%i5+%g0]0x80,%f8 	! %f8 = 00000000
!	Mem[0000000030081400] = 0000ff00, %f6  = 6fb60706
	lda	[%i2+%g0]0x89,%f6 	! %f6 = 0000ff00
!	Mem[0000000010081410] = 8ec1195f32ea7491, %f4  = 4f000000 ffffffff
	ldda	[%i2+%o5]0x80,%f4 	! %f4  = 8ec1195f 32ea7491
!	Mem[0000000021800000] = 1effba26, %l4 = 000000000000ff00
	lduh	[%o3+%g0],%l4		! %l4 = 0000000000001eff
!	Mem[0000000010101400] = ff000000, %l4 = 0000000000001eff
	lduha	[%i4+%g0]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[00000000100c1410] = 00000000, %l2 = 00000000ff000061
	lduwa	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l5 = 02990cc632ea7491, %l1 = 5d0967d86f54f09e, %l2 = 0000000000000000
	xor	%l5,%l1,%l2		! %l2 = 5f906b1e5dbe840f
!	Mem[0000000030141408] = 000000630000b2d0, %l0 = 00000000000000ff
	ldxa	[%i5+%o4]0x89,%l0	! %l0 = 000000630000b2d0
!	Starting 10 instruction Store Burst
!	%l2 = 5dbe840f, %l3 = 0aff0000, Mem[0000000030041400] = 0aff0000 ffffffff
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 5dbe840f 0aff0000

p0_label_496:
	membar	#Sync			! Added by membar checker (85)
!	%f20 = 00000000, Mem[0000000010141410] = 00000000
	sta	%f20,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%f12 = 8ec1195f 00000000, Mem[0000000010101400] = ff000000 ff000000
	stda	%f12,[%i4+%g0]0x80	! Mem[0000000010101400] = 8ec1195f 00000000
!	%l6 = 000000000000003f, Mem[0000000010101410] = ff0000000000ffff
	stxa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000000000003f
!	%f8  = 00000000, Mem[00000000300c1400] = b66f0000
	sta	%f8 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l2 = 5f906b1e5dbe840f, Mem[0000000010081400] = 8dff0000
	stha	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 840f0000
!	Mem[0000000030081408] = ffffffff, %l1 = 5d0967d86f54f09e
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010181428] = 0c8b7457c1e86fff, %l3 = 000000000aff0000, %l7 = ffffffffffffff00
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = 0c8b7457c1e86fff
!	%f28 = ff0000ff fe810000, Mem[0000000030181408] = ffffffff be72ba0a
	stda	%f28,[%i6+%o4]0x89	! Mem[0000000030181408] = ff0000ff fe810000
!	%f0  = 7fffffff, Mem[0000000010181408] = 0000ff0a
	sta	%f0 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 7fffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffc17f1a, %l6 = 000000000000003f
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffffc1

p0_label_497:
!	Mem[0000000030041400] = 0f84be5d, %l5 = 02990cc632ea7491
	lduha	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000f84
!	Mem[0000000010001400] = 00ff0000ffffffff, %f10 = ffffffff 00000000
	ldda	[%i0+%g0]0x80,%f10	! %f10 = 00ff0000 ffffffff
!	Mem[0000000020800040] = ffff2c25, %l0 = 000000630000b2d0
	ldub	[%o1+0x041],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l4 = 000000000000ff00
	lduba	[%i0+0x010]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = ff000000, %l1 = 00000000000000ff
	lduwa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	%l4 = 0000000000000000, imm = fffffffffffff0e6, %l2 = 5f906b1e5dbe840f
	xnor	%l4,-0xf1a,%l2		! %l2 = 0000000000000f19
!	Mem[0000000010101408] = ffffffff, %l7 = 0c8b7457c1e86fff
	lduha	[%i4+%o4]0x80,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010001428] = 23044fff, %l3 = 000000000aff0000
	lduw	[%i0+0x028],%l3		! %l3 = 0000000023044fff
!	%f5  = 32ea7491, %f21 = ffffffe8
	fcmpes	%fcc2,%f5 ,%f21		! %fcc2 = 3
!	Starting 10 instruction Store Burst
!	%f6  = 0000ff00 00ff00ff, Mem[0000000030141408] = d0b20000 63000000
	stda	%f6 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000ff00 00ff00ff

p0_label_498:
!	%l6 = ffffffffffffffc1, Mem[0000000010081400] = 840f0000ff4f0423
	stx	%l6,[%i2+%g0]		! Mem[0000000010081400] = ffffffffffffffc1
!	Mem[0000000010081410] = 8ec1195f, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 0000008e000000ff
!	Mem[00000000100c1410] = 00000000, %l0 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	%f30 = 0000ffff, Mem[0000000010001400] = 00ff0000
	sta	%f30,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000ffff
!	Mem[0000000021800000] = 1effba26, %l5 = 0000000000000f84
	ldstuba	[%o3+0x000]%asi,%l5	! %l5 = 0000001e000000ff
!	%l4 = 0000008e, %l5 = 0000001e, Mem[0000000010001408] = ff000000 ffffd0b2
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000008e 0000001e
!	%f20 = 00000000 ffffffe8, Mem[0000000010181408] = ffffff7f 00000000
	stda	%f20,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 ffffffe8
!	%l3 = 0000000023044fff, Mem[0000000010181408] = 00000000
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 00004fff
!	%l4 = 000000000000008e, %l0 = 0000000000000000, %l2 = 0000000000000f19
	or	%l4,%l0,%l2		! %l2 = 000000000000008e
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ffffffff 31000000, %l4 = 0000008e, %l5 = 0000001e
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 00000000ffffffff 0000000031000000

p0_label_499:
!	Mem[0000000030001410] = 000000ff, %f30 = 0000ffff
	lda	[%i0+%o5]0x89,%f30	! %f30 = 000000ff
!	Mem[0000000010041408] = ff9d8768, %l5 = 0000000031000000
	ldswa	[%i1+%o4]0x80,%l5	! %l5 = ffffffffff9d8768
!	Mem[0000000010181408] = ff4f0000 ffffffe8, %l0 = 00000000, %l1 = ff000000
	ldda	[%i6+0x008]%asi,%l0	! %l0 = 00000000ff4f0000 00000000ffffffe8
!	Mem[0000000010041428] = 00000000 010f421e, %l0 = ff4f0000, %l1 = ffffffe8
	ldd	[%i1+0x028],%l0		! %l0 = 0000000000000000 00000000010f421e
!	Mem[00000000300c1400] = 0000000000000000, %f30 = 000000ff 00000000
	ldda	[%i3+%g0]0x81,%f30	! %f30 = 00000000 00000000
!	Mem[0000000010081438] = ffffff00 00000000, %l0 = 00000000, %l1 = 010f421e
	ldda	[%i2+0x038]%asi,%l0	! %l0 = 00000000ffffff00 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l7 = 000000000000ffff
	ldswa	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041400] = 000000ff, %l2 = 000000000000008e
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 0aff00005dbe840f, %l0 = 00000000ffffff00
	ldxa	[%i1+%g0]0x89,%l0	! %l0 = 0aff00005dbe840f
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stwa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000

p0_label_500:
!	Mem[0000000010081424] = 00000031, %l2 = 0000000000000000, %asi = 80
	swapa	[%i2+0x024]%asi,%l2	! %l2 = 0000000000000031
!	%l1 = 0000000000000000, Mem[0000000010041408] = ff9d8768
	stha	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 00008768
!	Mem[0000000010041418] = ff0000ff, %l6 = ffffffffffffffc1
	swap	[%i1+0x018],%l6		! %l6 = 00000000ff0000ff
!	%f4  = 8ec1195f, Mem[0000000030101410] = ff000000
	sta	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 8ec1195f
!	%f15 = 65450a09, %f17 = 0607b66f
	fcmps	%fcc3,%f15,%f17		! %fcc3 = 2
!	%f27 = 5f19c18e, %f5  = 32ea7491
	fsqrts	%f27,%f5 		! %f5  = 4f4665c0
!	Mem[0000000030141408] = 0000ff00, %l5 = ffffffffff9d8768
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 000000000000ff00
!	%f20 = 00000000 ffffffe8, %l7 = 00000000000000ff
!	Mem[0000000010041410] = ff00000000000000
	add	%i1,0x010,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_P ! Mem[0000000010041410] = 00000000ffffffe8
!	%f6  = 0000ff00 00ff00ff, %l5 = 000000000000ff00
!	Mem[00000000100c1428] = 00000000000000ff
	add	%i3,0x028,%g1
	stda	%f6,[%g1+%l5]ASI_PST32_PL ! Mem[00000000100c1428] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001004141c] = 7fffffff, %l2 = 0000000000000031
	ldsba	[%i1+0x01d]%asi,%l2	! %l2 = ffffffffffffffff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	sdivx	%l6,%l2,%l4
	fdivs	%f26,%f3,%f5
	lduwa	[%i3+0x010]%asi,%l2
	sdiv	%l2,%l6,%l4
	xnor	%l4,0xd98,%l1
	sdivx	%l1,%l4,%l0
	nop
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0aff00005dbe840f
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000023044fff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000ffffffff
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 000000000000ff00
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000ff0000ff
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xffffffc1,%g2
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
	cmp	%l0,%l1			! %f0  should be 7fffffff 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ff0000ff ff4f0423
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 8ec1195f 4f4665c0
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 0000ff00 00ff00ff
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 0000ffff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00ff0000 ffffffff
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 8ec1195f 00000000
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ad880a76 65450a09
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 0607b66f
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 0c8bffff 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 ffffffe8
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 ff000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 18e476bb 00000031
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 8454ff11 5f19c18e
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ff0000ff fe810000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 00000000
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
	umul	%l5,0xd92,%l6
	fsqrts	%f5 ,%f2 
	umul	%l2,0xdee,%l7
	orn	%l4,%l6,%l2
	smul	%l0,0xbbb,%l7
	done

p0_trap1o:
	umul	%l5,0xd92,%l6
	fsqrts	%f5 ,%f2 
	umul	%l2,0xdee,%l7
	orn	%l4,%l6,%l2
	smul	%l0,0xbbb,%l7
	done


p0_trap2e:
	smul	%l6,-0x040,%l2
	xnor	%l6,-0x1c5,%l2
	fadds	%f8 ,%f10,%f5 
	fsubs	%f3 ,%f0 ,%f0 
	sdivx	%l2,%l6,%l4
	done

p0_trap2o:
	smul	%l6,-0x040,%l2
	xnor	%l6,-0x1c5,%l2
	fadds	%f8 ,%f10,%f5 
	fsubs	%f3 ,%f0 ,%f0 
	sdivx	%l2,%l6,%l4
	done


p0_trap3e:
	xnor	%l3,0xc26,%l1
	or	%l7,-0xabb,%l1
	xor	%l1,0x2f5,%l4
	xnor	%l5,%l4,%l6
	xnor	%l3,%l4,%l7
	andn	%l3,%l6,%l1
	done

p0_trap3o:
	xnor	%l3,0xc26,%l1
	or	%l7,-0xabb,%l1
	xor	%l1,0x2f5,%l4
	xnor	%l5,%l4,%l6
	xnor	%l3,%l4,%l7
	andn	%l3,%l6,%l1
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
	ldx	[%g1+0x000],%l0		! %l0 = b56b73fbd779b56d
	ldx	[%g1+0x008],%l1		! %l1 = 4d1824aac7dd0d92
	ldx	[%g1+0x010],%l2		! %l2 = ef51652ec95a4131
	ldx	[%g1+0x018],%l3		! %l3 = 650300a28219ea07
	ldx	[%g1+0x020],%l4		! %l4 = a82d9b8c4290037a
	ldx	[%g1+0x028],%l5		! %l5 = d3146983ea207428
	ldx	[%g1+0x030],%l6		! %l6 = 5948a2f5cadc27b2
	ldx	[%g1+0x038],%l7		! %l7 = 67bee32a639b131c

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
	umul	%l5,0xd92,%l6
	udivx	%l6,%l2,%l3
	umul	%l6,%l3,%l6
	and	%l5,-0x31e,%l2
	smul	%l1,0xf18,%l7
	st	%f2 ,[%i2+0x018]	! Mem[0000000010081418]
	jmpl	%o7,%g0
	add	%l1,%l2,%l4
p0_near_0_he:
	jmpl	%o7,%g0
	add	%l3,-0xc91,%l5
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	addc	%l0,0x58a,%l7
	fcmps	%fcc3,%f29,%f22
	or	%l3,-0x197,%l2
	fdivs	%f22,%f28,%f28
	fdivs	%f28,%f24,%f21
	udivx	%l2,%l1,%l4
	jmpl	%o7,%g0
	andn	%l2,-0xd76,%l5
near0_b2b_l:
	fsubs	%f15,%f2 ,%f14
	subc	%l7,0x587,%l4
	sdivx	%l2,%l6,%l4
	xnor	%l5,%l1,%l0
	fcmps	%fcc1,%f9 ,%f6 
	smul	%l7,%l2,%l4
	jmpl	%o7,%g0
	sdivx	%l5,%l0,%l4
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	addc	%l7,%l1,%l4
	sdivx	%l6,%l3,%l2
	fcmps	%fcc3,%f3 ,%f11
	jmpl	%o7,%g0
	and	%l2,0x5e8,%l1
p0_near_1_he:
	sub	%l4,0x3a4,%l3
	umul	%l6,%l1,%l6
	orn	%l5,0x5c8,%l2
	subc	%l2,-0x0d6,%l7
	jmpl	%o7,%g0
	st	%f17,[%i2+0x024]	! Mem[0000000010081424]
near1_b2b_h:
	sdivx	%l5,0x254,%l1
	addc	%l5,%l6,%l5
	addc	%l2,-0x605,%l7
	xor	%l4,%l3,%l7
	jmpl	%o7,%g0
	fsubs	%f24,%f24,%f16
near1_b2b_l:
	addc	%l6,%l1,%l1
	fmuls	%f11,%f11,%f11
	addc	%l2,0xe57,%l6
	or	%l0,%l5,%l6
	jmpl	%o7,%g0
	or	%l6,-0x6f7,%l4
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	jmpl	%o7,%g0
	fadds	%f15,%f1 ,%f9 
	jmpl	%o7,%g0
	nop
p0_near_2_he:
	or	%l5,%l0,%l4
	xnor	%l6,0x95b,%l0
	jmpl	%o7,%g0
	fsubs	%f21,%f21,%f25
near2_b2b_h:
	sdivx	%l6,%l4,%l4
	fcmps	%fcc3,%f20,%f21
	andn	%l4,0x2e1,%l4
	orn	%l5,0x3f3,%l3
	jmpl	%o7,%g0
	sub	%l1,%l4,%l5
near2_b2b_l:
	addc	%l5,%l3,%l5
	fsqrts	%f15,%f5 
	fdivs	%f8 ,%f12,%f14
	fcmps	%fcc3,%f10,%f12
	jmpl	%o7,%g0
	fcmps	%fcc1,%f5 ,%f0 
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	fdivs	%f13,%f3 ,%f1 
	jmpl	%o7,%g0
	xnor	%l2,%l1,%l5
p0_near_3_he:
	subc	%l6,-0x6ff,%l5
	add	%l2,%l2,%l7
	orn	%l2,%l1,%l0
	ldsw	[%i4+0x008],%l1		! Mem[0000000010101408]
	xnor	%l6,%l0,%l7
	jmpl	%o7,%g0
	andn	%l2,%l3,%l3
near3_b2b_h:
	jmpl	%o7,%g0
	subc	%l4,%l6,%l5
	jmpl	%o7,%g0
	nop
near3_b2b_l:
	jmpl	%o7,%g0
	fadds	%f0 ,%f3 ,%f13
	jmpl	%o7,%g0
	nop
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fcmps	%fcc2,%f0 ,%f1 
	xnor	%l7,0x4c2,%l4
	fadds	%f4 ,%f6 ,%f15
	fmuls	%f2 ,%f3 ,%f1 
	jmpl	%o7,%g0
	sdivx	%l2,%l1,%l7
p0_far_0_lem:
	fcmps	%fcc2,%f0 ,%f1 
	xnor	%l7,0x4c2,%l4
	fadds	%f4 ,%f6 ,%f15
	fmuls	%f2 ,%f3 ,%f1 
	jmpl	%o7,%g0
	sdivx	%l2,%l1,%l7
p0_far_0_he:
	fsqrts	%f20,%f28
	sub	%l7,%l4,%l2
	addc	%l0,%l2,%l6
	fsubs	%f28,%f31,%f24
	fmuls	%f22,%f31,%f24
	udivx	%l7,%l4,%l0
	subc	%l0,0xb8d,%l3
	jmpl	%o7,%g0
	and	%l3,-0xd0f,%l7
p0_far_0_hem:
	fsqrts	%f20,%f28
	sub	%l7,%l4,%l2
	addc	%l0,%l2,%l6
	fsubs	%f28,%f31,%f24
	fmuls	%f22,%f31,%f24
	udivx	%l7,%l4,%l0
	subc	%l0,0xb8d,%l3
	jmpl	%o7,%g0
	and	%l3,-0xd0f,%l7
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	fdivs	%f23,%f20,%f22
	andn	%l7,0x03d,%l4
	smul	%l1,%l4,%l2
	fdivs	%f31,%f19,%f30
	fitos	%f23,%f31
	smul	%l1,%l4,%l7
	jmpl	%o7,%g0
	fcmps	%fcc3,%f29,%f28
far0_b2b_l:
	smul	%l0,%l2,%l0
	fmuls	%f11,%f9 ,%f14
	fdivs	%f4 ,%f10,%f15
	xnor	%l1,%l6,%l1
	fmuls	%f5 ,%f0 ,%f9 
	or	%l2,-0x454,%l1
	jmpl	%o7,%g0
	subc	%l2,%l6,%l7
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	subc	%l1,%l1,%l3
	sub	%l0,0x51d,%l1
	jmpl	%o7,%g0
	orn	%l6,%l3,%l7
p0_far_1_lem:
	subc	%l1,%l1,%l3
	sub	%l0,0x51d,%l1
	jmpl	%o7,%g0
	orn	%l6,%l3,%l7
p0_far_1_he:
	jmpl	%o7,%g0
	add	%l1,%l0,%l0
	jmpl	%o7,%g0
	nop
p0_far_1_hem:
	jmpl	%o7,%g0
	add	%l1,%l0,%l0
	jmpl	%o7,%g0
	nop
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	subc	%l0,0x9b2,%l3
	fdivs	%f16,%f30,%f27
	andn	%l1,0x6de,%l7
	udivx	%l0,%l0,%l0
	mulx	%l2,%l7,%l5
	udivx	%l5,-0xee4,%l3
	fdtos	%f24,%f16
	jmpl	%o7,%g0
	xor	%l0,%l1,%l3
far1_b2b_l:
	udivx	%l7,%l5,%l2
	fcmps	%fcc2,%f4 ,%f15
	smul	%l1,%l6,%l5
	sub	%l3,0xb73,%l3
	fcmps	%fcc3,%f1 ,%f11
	fmuls	%f8 ,%f14,%f2 
	fadds	%f0 ,%f0 ,%f1 
	jmpl	%o7,%g0
	smul	%l6,%l7,%l5
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	jmpl	%o7,%g0
	smul	%l3,-0xf73,%l0
	jmpl	%o7,%g0
	nop
p0_far_2_lem:
	jmpl	%o7,%g0
	smul	%l3,-0xf73,%l0
	jmpl	%o7,%g0
	nop
p0_far_2_he:
	sdivx	%l5,%l2,%l1
	jmpl	%o7,%g0
	sdivx	%l5,0xbe6,%l4
p0_far_2_hem:
	sdivx	%l5,%l2,%l1
	jmpl	%o7,%g0
	sdivx	%l5,0xbe6,%l4
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fsubs	%f16,%f24,%f29
	sdivx	%l2,-0xc10,%l7
	xnor	%l0,%l1,%l1
	orn	%l3,-0x323,%l5
	jmpl	%o7,%g0
	fdivs	%f22,%f19,%f20
far2_b2b_l:
	xor	%l2,%l0,%l6
	smul	%l0,%l0,%l6
	fsubs	%f13,%f7 ,%f14
	smul	%l0,-0x3f4,%l3
	jmpl	%o7,%g0
	smul	%l6,0x6cc,%l2
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	jmpl	%o7,%g0
	xnor	%l7,%l3,%l6
	jmpl	%o7,%g0
	nop
p0_far_3_lem:
	jmpl	%o7,%g0
	xnor	%l7,%l3,%l6
	jmpl	%o7,%g0
	nop
p0_far_3_he:
	jmpl	%o7,%g0
	fsubs	%f26,%f24,%f16
	jmpl	%o7,%g0
	nop
p0_far_3_hem:
	jmpl	%o7,%g0
	fsubs	%f26,%f24,%f16
	jmpl	%o7,%g0
	nop
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	andn	%l1,%l3,%l4
	fadds	%f25,%f16,%f25
	udivx	%l1,-0x768,%l0
	fsubs	%f25,%f28,%f25
	fadds	%f30,%f24,%f16
	fsubs	%f25,%f28,%f25
	xor	%l0,-0x36e,%l1
	jmpl	%o7,%g0
	fdivs	%f22,%f26,%f26
far3_b2b_l:
	fmuls	%f13,%f1 ,%f7 
	fadds	%f0 ,%f3 ,%f9 
	andn	%l0,%l5,%l3
	fcmps	%fcc1,%f9 ,%f7 
	add	%l3,0xeaf,%l4
	smul	%l5,0xf0a,%l1
	smul	%l3,%l1,%l0
	jmpl	%o7,%g0
	addc	%l4,%l0,%l1
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	xnor	%l5,%l2,%l6
	xnor	%l1,0x7a6,%l1
	and	%l3,%l2,%l2
	orn	%l3,%l2,%l5
	fmuls	%f12,%f10,%f15
	fmuls	%f12,%f15,%f13
	jmpl	%g6+8,%g0
	smul	%l2,%l6,%l6
p0_call_0_le:
	sth	%l2,[%i5+0x026]		! Mem[0000000010141426]
	udivx	%l4,0xf0a,%l6
	retl
	mulx	%l4,%l4,%l5
p0_jmpl_0_lo:
	xnor	%l5,%l2,%l6
	xnor	%l1,0x7a6,%l1
	and	%l3,%l2,%l2
	orn	%l3,%l2,%l5
	fmuls	%f12,%f10,%f15
	fmuls	%f12,%f15,%f13
	jmpl	%g6+8,%g0
	smul	%l2,%l6,%l6
p0_call_0_lo:
	sth	%l2,[%o5+0x026]		! Mem[0000000010141426]
	udivx	%l4,0xf0a,%l6
	retl
	mulx	%l4,%l4,%l5
p0_jmpl_0_he:
	jmpl	%g6+8,%g0
	subc	%l6,%l3,%l2
p0_call_0_he:
	smul	%l2,%l2,%l5
	fcmps	%fcc3,%f20,%f17
	fcmps	%fcc3,%f22,%f19
	retl
	xor	%l4,0xf64,%l1
p0_jmpl_0_ho:
	jmpl	%g6+8,%g0
	subc	%l6,%l3,%l2
p0_call_0_ho:
	smul	%l2,%l2,%l5
	fcmps	%fcc3,%f20,%f17
	fcmps	%fcc3,%f22,%f19
	retl
	xor	%l4,0xf64,%l1
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	addc	%l7,%l7,%l1
	xnor	%l2,-0xd6d,%l4
	orn	%l3,-0x7ff,%l0
	jmpl	%g6+8,%g0
	add	%l4,%l3,%l1
p0_call_1_le:
	xnor	%l3,0x1a5,%l0
	xor	%l5,%l1,%l0
	fcmps	%fcc1,%f1 ,%f12
	fsubs	%f12,%f15,%f1 
	add	%l7,0x5ce,%l5
	subc	%l0,%l4,%l5
	add	%l0,-0x334,%l1
	retl
	sub	%l0,0x71e,%l0
p0_jmpl_1_lo:
	addc	%l7,%l7,%l1
	xnor	%l2,-0xd6d,%l4
	orn	%l3,-0x7ff,%l0
	jmpl	%g6+8,%g0
	add	%l4,%l3,%l1
p0_call_1_lo:
	xnor	%l3,0x1a5,%l0
	xor	%l5,%l1,%l0
	fcmps	%fcc1,%f1 ,%f12
	fsubs	%f12,%f15,%f1 
	add	%l7,0x5ce,%l5
	subc	%l0,%l4,%l5
	add	%l0,-0x334,%l1
	retl
	sub	%l0,0x71e,%l0
p0_jmpl_1_he:
	and	%l7,-0xe66,%l1
	fsqrts	%f17,%f17
	sub	%l6,%l2,%l7
	andn	%l7,-0xbe1,%l0
	fsubs	%f16,%f28,%f24
	jmpl	%g6+8,%g0
	xor	%l7,0xd19,%l5
p0_call_1_he:
	fmuls	%f16,%f29,%f20
	addc	%l1,%l4,%l2
	mulx	%l7,%l6,%l2
	smul	%l6,%l6,%l0
	and	%l5,%l7,%l3
	retl
	fcmps	%fcc2,%f27,%f16
p0_jmpl_1_ho:
	and	%l7,-0xe66,%l1
	fsqrts	%f17,%f17
	sub	%l6,%l2,%l7
	andn	%l7,-0xbe1,%l0
	fsubs	%f16,%f28,%f24
	jmpl	%g6+8,%g0
	xor	%l7,0xd19,%l5
p0_call_1_ho:
	fmuls	%f16,%f29,%f20
	addc	%l1,%l4,%l2
	mulx	%l7,%l6,%l2
	smul	%l6,%l6,%l0
	and	%l5,%l7,%l3
	retl
	fcmps	%fcc2,%f27,%f16
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	sdivx	%l1,%l0,%l7
	addc	%l1,0x452,%l4
	lduh	[%i1+0x036],%l6		! Mem[0000000010041436]
	fadds	%f6 ,%f13,%f7 
	fcmps	%fcc3,%f15,%f1 
	fdivs	%f15,%f13,%f5 
	jmpl	%g6+8,%g0
	fdivs	%f6 ,%f11,%f6 
p0_call_2_le:
	or	%l0,%l4,%l2
	retl
	smul	%l5,%l4,%l1
p0_jmpl_2_lo:
	sdivx	%l1,%l0,%l7
	addc	%l1,0x452,%l4
	lduh	[%o1+0x036],%l6		! Mem[0000000010041436]
	fadds	%f6 ,%f13,%f7 
	fcmps	%fcc3,%f15,%f1 
	fdivs	%f15,%f13,%f5 
	jmpl	%g6+8,%g0
	fdivs	%f6 ,%f11,%f6 
p0_call_2_lo:
	or	%l0,%l4,%l2
	retl
	smul	%l5,%l4,%l1
p0_jmpl_2_he:
	ldsb	[%i3+0x03c],%l4		! Mem[00000000100c143c]
	sdivx	%l0,-0x7ca,%l4
	jmpl	%g6+8,%g0
	addc	%l3,-0x775,%l6
p0_call_2_he:
	xnor	%l6,-0x30c,%l7
	andn	%l0,%l0,%l3
	retl
	fsqrts	%f19,%f22
p0_jmpl_2_ho:
	ldsb	[%o3+0x03c],%l4		! Mem[00000000100c143c]
	sdivx	%l0,-0x7ca,%l4
	jmpl	%g6+8,%g0
	addc	%l3,-0x775,%l6
p0_call_2_ho:
	xnor	%l6,-0x30c,%l7
	andn	%l0,%l0,%l3
	retl
	fsqrts	%f19,%f22
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	fdivs	%f1 ,%f10,%f4 
	jmpl	%g6+8,%g0
	or	%l4,-0xcfe,%l5
p0_call_3_le:
	fstoi	%f6 ,%f11
	sub	%l1,0x70c,%l4
	addc	%l4,0xf28,%l7
	fsqrts	%f0 ,%f1 
	retl
	fadds	%f8 ,%f9 ,%f0 
p0_jmpl_3_lo:
	fdivs	%f1 ,%f10,%f4 
	jmpl	%g6+8,%g0
	or	%l4,-0xcfe,%l5
p0_call_3_lo:
	fstoi	%f6 ,%f11
	sub	%l1,0x70c,%l4
	addc	%l4,0xf28,%l7
	fsqrts	%f0 ,%f1 
	retl
	fadds	%f8 ,%f9 ,%f0 
p0_jmpl_3_he:
	fcmps	%fcc3,%f22,%f30
	jmpl	%g6+8,%g0
	lduw	[%i3+0x03c],%l0		! Mem[00000000100c143c]
p0_call_3_he:
	smul	%l7,-0x8ed,%l5
	fmuls	%f20,%f25,%f23
	fsubs	%f20,%f16,%f19
	retl
	fsqrts	%f25,%f24
p0_jmpl_3_ho:
	fcmps	%fcc3,%f22,%f30
	jmpl	%g6+8,%g0
	lduw	[%o3+0x03c],%l0		! Mem[00000000100c143c]
p0_call_3_ho:
	smul	%l7,-0x8ed,%l5
	fmuls	%f20,%f25,%f23
	fsubs	%f20,%f16,%f19
	retl
	fsqrts	%f25,%f24
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
	.word	0xb56b73fb,0xd779b56d		! Init value for %l0
	.word	0x4d1824aa,0xc7dd0d92		! Init value for %l1
	.word	0xef51652e,0xc95a4131		! Init value for %l2
	.word	0x650300a2,0x8219ea07		! Init value for %l3
	.word	0xa82d9b8c,0x4290037a		! Init value for %l4
	.word	0xd3146983,0xea207428		! Init value for %l5
	.word	0x5948a2f5,0xcadc27b2		! Init value for %l6
	.word	0x67bee32a,0x639b131c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x7d94b7b5,0x1eca8581		! Init value for %f0 
	.word	0x89fbce34,0x14f1d541		! Init value for %f2 
	.word	0x57875909,0x266e5926		! Init value for %f4 
	.word	0x44f61ccf,0x7ab66d24		! Init value for %f6 
	.word	0x8fb266f3,0xe3096414		! Init value for %f8 
	.word	0xdc10062e,0x40cc3102		! Init value for %f10
	.word	0x3c3fa217,0xd099a530		! Init value for %f12
	.word	0xaf3904e9,0x31bbcd7c		! Init value for %f14
	.word	0x34502b85,0x1633d79f		! Init value for %f16
	.word	0xfcbd0f53,0xf38071e5		! Init value for %f18
	.word	0x9492a8ca,0x88f2b688		! Init value for %f20
	.word	0x1fa4e83c,0xe7ce4dea		! Init value for %f22
	.word	0xc8360210,0xad665e15		! Init value for %f24
	.word	0x0087f722,0xaf925539		! Init value for %f26
	.word	0xebae2afa,0x19ce9f7b		! Init value for %f28
	.word	0x811fa417,0xe8d89f23		! Init value for %f30
	.word	0xb15589f6,0x6722abd5		! Init value for %f32
	.word	0x292d31e2,0xe80550a5		! Init value for %f34
	.word	0xa7b56645,0x03fde505		! Init value for %f36
	.word	0x87112a99,0xd05fdb11		! Init value for %f38
	.word	0xb635a4ce,0x29052da8		! Init value for %f40
	.word	0xc65de21e,0xa1a5e50a		! Init value for %f42
	.word	0x69a8a56b,0x7c79989c		! Init value for %f44
	.word	0xac77023e,0x9e77901e		! Init value for %f46
	.word	0x88693781,0x499d19bd
	.word	0x9a2ea96d,0x326d418f
	.word	0x124c71cf,0x14e11514
	.word	0x24394a84,0x40398db2
	.word	0xf72d392c,0x00fdeb03
	.word	0x4aa372fb,0xd305c4c2
	.word	0xcada3c33,0x0c8d02c9
	.word	0x0249a41e,0x0157f145
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
	.word	0x0aff0000,0x5dbe840f
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x23044fff
	.word	0x00000000,0xffffffff
	.word	0x00000000,0x0000ff00
	.word	0x00000000,0xff0000ff
	.word	0x00000000,0x000000ff
p0_expected_fp_regs:
	.word	0x7fffffff,0x00000000
	.word	0xff0000ff,0xff4f0423
	.word	0x8ec1195f,0x4f4665c0
	.word	0x0000ff00,0x00ff00ff
	.word	0x00000000,0x0000ffff
	.word	0x00ff0000,0xffffffff
	.word	0x8ec1195f,0x00000000
	.word	0xad880a76,0x65450a09
	.word	0x00000000,0x0607b66f
	.word	0x0c8bffff,0x00000000
	.word	0x00000000,0xffffffe8
	.word	0x00000000,0xff000000
	.word	0x18e476bb,0x00000031
	.word	0x8454ff11,0x5f19c18e
	.word	0xff0000ff,0xfe810000
	.word	0x00000000,0x00000000
	.word	0x0000002e,0x00000000		! %fsr = 0000002e00000000
p0_local0_expect:
	.word	0x0000ffff,0xffffffff
	.word	0x0000008e,0x0000001e
	.word	0x00000000,0x7fffffff
	.word	0x6fb60706,0xffff00b2
	.word	0x0000807f,0xffff0000
	.word	0x23044fff,0x0000ff8d
	.word	0x8ec1195f,0x00000000
	.word	0xffff0000,0xffffffff
p0_local0_sec_expect:
	.word	0x9e0000ff,0x329dffff
	.word	0xff000000,0xffffffff
	.word	0xff000000,0x000000ff
	.word	0xffffffff,0xff7bbdb9
	.word	0xffffffff,0xd31ad138
	.word	0xbfffffff,0xffffffff
	.word	0x6100b66f,0x618f63d5
	.word	0x0000957a,0xd31aff7f
p0_local1_expect:
	.word	0x000000ff,0xffffffff
	.word	0x00008768,0x19c9df29
	.word	0x00000000,0xffffffe8
	.word	0xffffffc1,0x7fffffff
	.word	0xbbde47e2,0xff000061
	.word	0x00000000,0x010f421e
	.word	0xff48f18b,0xff6fe8c1
	.word	0x001e0000,0x00000031
p0_local1_sec_expect:
	.word	0x0f84be5d,0x0000ff0a
	.word	0x00000000,0xffffffff
	.word	0xff000000,0xffffbf57
	.word	0x6fb60706,0x0000ebcb
	.word	0x0000807f,0x00ff0000
	.word	0x23044fff,0x0000ff8d
	.word	0xadc11976,0x65815484
	.word	0xad880a76,0x65450a09
p0_local2_expect:
	.word	0xffffffff,0xffffffc1
	.word	0xb66f0000,0xffff0000
	.word	0xffc1195f,0x32ea7491
	.word	0x00000000,0xff000000
	.word	0x18e4ffbb,0x00000000
	.word	0xdee27dcd,0x5f19c18e
	.word	0xffffff00,0x00000000
	.word	0xffffff00,0x00000000
p0_local2_sec_expect:
	.word	0x00ff0000,0x000000ff
	.word	0xffffffff,0x00000079
	.word	0x00ff00ff,0x00000011
	.word	0x00000000,0x00000000
	.word	0x34abf64c,0x7f210000
	.word	0x001ee33a,0x00d1ffff
	.word	0x4b000000,0xcb000000
	.word	0x3988957a,0xd31ad138
p0_local3_expect:
	.word	0x0000ffff,0x00000000
	.word	0xffffffff,0x31000000
	.word	0xff000000,0xffffffff
	.word	0xcbeb0000,0x0607b66f
	.word	0x0000ff0a,0xffffff00
	.word	0x00000000,0x000000ff
	.word	0x84548111,0x5f19c18e
	.word	0xff000061,0x760a88ad
p0_local3_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0000ffff
	.word	0x00000000,0x000000ff
	.word	0x3988957a,0xd31ad138
	.word	0xbbde47e2,0xffff0000
	.word	0xff610000,0xffffffe8
	.word	0x84548111,0x7fffffff
	.word	0x001e0000,0x000000ff
p0_local4_expect:
	.word	0x8ec1195f,0x00000000
	.word	0xffffffff,0xffff0000
	.word	0x00000000,0x0000003f
	.word	0xffffffff,0x00000000
	.word	0x00000000,0x000000ff
	.word	0xbfff00ff,0x00000031
	.word	0x00000000,0x000000ff
	.word	0xfffff0b6,0x00000000
p0_local4_sec_expect:
	.word	0xffffffff,0xffffffff
	.word	0x0aff0000,0x00000000
	.word	0x5f19c18e,0x329dffff
	.word	0x3988957a,0xd31ad138
	.word	0xbbde47e2,0xffff0000
	.word	0xca4c7d8a,0x00000000
	.word	0x84ff811e,0x5f00001e
	.word	0x001e0000,0x000000ff
p0_local5_expect:
	.word	0x00000000,0x0607b66f
	.word	0x0c8bffff,0x00000000
	.word	0x00000000,0xffffffe8
	.word	0x00000000,0xff000000
	.word	0x18e476bb,0x00000031
	.word	0x8454ff11,0x5f19c18e
	.word	0xff0000ff,0xfe810000
	.word	0x0000ffff,0x00000000
p0_local5_sec_expect:
	.word	0x3900ff0a,0xffffffff
	.word	0xff9d8768,0x00ff00ff
	.word	0xff000000,0x00000000
	.word	0xc54577b7,0x00000030
	.word	0xffff00bf,0x21ff4d4a
	.word	0x00000031,0xb2d00000
	.word	0x000000ff,0x0078ff9e
	.word	0x4cf6ab34,0xb600ffff
p0_local6_expect:
	.word	0x00000000,0x00000000
	.word	0xff4f0000,0xffffffe8
	.word	0x00000000,0x00000000
	.word	0x00000020,0x00000000
	.word	0x0aba72be,0x34abffff
	.word	0x0c8b7457,0xc1e86fff
	.word	0x00000000,0x00000000
	.word	0x00000000,0xedb91eff
p0_local6_sec_expect:
	.word	0x00000000,0x63000000
	.word	0x000081fe,0xff0000ff
	.word	0x19c9df29,0x5f19c18e
	.word	0x00000000,0xffffffff
	.word	0x00000000,0xcd7de2de
	.word	0x000000ff,0x329dffff
	.word	0xcbeb0000,0x00000000
	.word	0xc1e86fff,0x8bf148ff
share0_expect:
	.word	0x3fff7d80,0xcacf082a
	.word	0x650208de,0xc3b7a6b7
	.word	0xc8f063a8,0x46d505fd
	.word	0x76b7a53b,0x0c09afad
	.word	0x600da0b3,0x517ba7bd
	.word	0x257e11ff,0x4e2e3783
	.word	0x4aced11b,0xa181f3f7
	.word	0x89275a48,0x1d249ab3
share1_expect:
	.word	0x000016cb,0x819146e3
	.word	0xe841a44e,0xbc835ff8
	.word	0xdff00438,0x591be9dc
	.word	0xa77269f4,0xd00f891a
	.word	0x86b73c77,0xfcdf6830
	.word	0x2b2528f9,0x39471fd9
	.word	0x49fee12d,0xa7ee6954
	.word	0x3bb0e2f8,0xdef8a0de
	.word	0xffff2c25,0x6a28838c
	.word	0x19018b7c,0x98731de9
	.word	0x741fc1b9,0xd7f11da8
	.word	0x31be990f,0x4786d2f4
	.word	0xa3deb75a,0xe1ce063c
	.word	0x8b07b638,0x14425b29
	.word	0x32cca2e6,0x931d7edb
	.word	0x278d4545,0x15105de1
share2_expect:
	.word	0xffc17f1a,0x99bef1de
	.word	0xeae01451,0xd5da2eab
	.word	0xe563238d,0xb05af2d7
	.word	0xbb28ea76,0xb9d18da2
	.word	0x67004f4f,0x163124a4
	.word	0xc521da94,0x77b733ed
	.word	0x9aea968b,0xdb3bcd78
	.word	0xcf4d0521,0xeb9de43b
share3_expect:
	.word	0xffffba26,0xe0d2ea73
	.word	0xea1b1b62,0xce1d0181
	.word	0x9c8bc872,0x2584d0cc
	.word	0xe40aaf63,0x6c8c7cd8
	.word	0xcba6fa4d,0xe9186a1a
	.word	0x941da94a,0x73246c7b
	.word	0x29f24170,0xd95a71e6
	.word	0xd66f536c,0xd284b8ae
	.word	0xff0c487b,0xde42bf09
	.word	0xad6d453f,0x55e8f94d
	.word	0x73a52642,0x4cfbc099
	.word	0xb0528cc7,0x9b904037
	.word	0x8422efcf,0x18310e55
	.word	0xe610031a,0x04dd7bef
	.word	0xb32f16c3,0x23709c5c
	.word	0xbd0479f6,0x3d3a4ac1
	.word	0x62006f0b,0xd217774f
	.word	0xcc5c9974,0x00880f9c
	.word	0x96c35735,0x7360f9fb
	.word	0xbe0d7b08,0x2907b8b1
	.word	0x39182305,0xba5d0c50
	.word	0x487b4f97,0x7cefbdc9
	.word	0x7a21cb74,0xf48bec6a
	.word	0xe4b745d0,0xd6b49bfd
	.word	0xfffff956,0xfc01ac67
	.word	0xba6a6bc9,0x4eecef01
	.word	0x003d0219,0xdda26d5b
	.word	0xebcb4070,0x4026edd8
	.word	0x13b0a214,0x41fb8574
	.word	0x181c9aa8,0x9691da86
	.word	0xbf82d403,0x9944ae28
	.word	0x50476b7d,0xfecf86f0
	.word	0xffff6971,0x2db8d55e
	.word	0x8bc1297a,0x3ef8de59
	.word	0x9813b73d,0x1bc5d815
	.word	0xa4d58681,0x378d1582
	.word	0x47ec1697,0x469f8fc1
	.word	0x86245cf3,0x6752db3c
	.word	0x2f475918,0x1d6bbf8b
	.word	0x6938d8c9,0x025631a9
	.word	0xffff02f2,0x2a6ed3d5
	.word	0x94de0827,0x9d55ca20
	.word	0xaa2c5a63,0xd2f823b1
	.word	0x35b87504,0xb0449fba
	.word	0x5724c129,0x877596da
	.word	0xbc81d2a2,0x38f25ef4
	.word	0x4c74be1b,0x71c39910
	.word	0xe025b4da,0x84eb5640
	.word	0xffffc5c1,0x87435378
	.word	0xc6d61f24,0x8e282a6d
	.word	0xa7548ccf,0x17c600cb
	.word	0x5f0d5a12,0x4b489fce
	.word	0xac6990a0,0xf73e5918
	.word	0x62cfa6df,0xe625cc3e
	.word	0xcbee102b,0x4b517de0
	.word	0xfed122c8,0x12fee5d1
	.word	0xff007b35,0xec7aa1d1
	.word	0x9543d243,0xe2d49280
	.word	0x878d4edd,0x4e30eac5
	.word	0x1d8f20d1,0xdead9daa
	.word	0xd036299b,0xf7d875d5
	.word	0xa184e36f,0xd3de38b6
	.word	0x8ea07341,0x125479e0
	.word	0xa06c5956,0x0c46cf72
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
	.word	0x5b95b458,0x0671a5c4
	.word	0x00000000,0x00000002
	.word	0x341d4317,0xb4d38866
	.word	0x00000000,0x00000003
	.word	0x77d01378,0x2c011b04
	.word	0x00000000,0x00000004
	.word	0x2bc61858,0x66309ba9
	.word	0x00000000,0x00000005
	.word	0xaeeef577,0xe9815790
	.word	0x00000000,0x00000006
	.word	0x49508330,0x51c9c1b9
	.word	0x00000000,0x00000007
	.word	0x25caec80,0x2ab6912b
	.word	0x00000000,0x00000008
	.word	0xbea23ce7,0x97001962
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
	.word	0xee50eb02,0x741ad06e,0x97696442,0x01a47bb8
	.word	0x444e043b,0x185e5876,0x4c818159,0xeb4301e5
	.word	0x86e95698,0xa3e93e61,0x36d81e7f,0xea2a17a0
	.word	0x3b5cd916,0x257d92a6,0xfae10dda,0xe1d7f818
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
	.word	0x3aea11c5,0xe99504c2,0xa963529a,0x933bdf0b
	.word	0x1c58c549,0x618f63d5,0x25ca0eb2,0x38786e82
	.word	0x33b972b9,0xf9ee859f,0x5ea2b3ce,0x0ab80521
	.word	0x24a3d80d,0x5afac4d5,0xd3b06a67,0xd116cfa4
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
	.word	0x612da4b5,0x25132c94,0xe3e7bd61,0x3970cb25
	.word	0xc5bcaf81,0x3fd08c4d,0x82d3f214,0xb94892de
	.word	0xf0cb05d3,0xb37eb287,0x25f1a81c,0x60bf3f07
	.word	0x2776174f,0x41532212,0xaad13c4a,0x6a1329e2
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
	.word	0x4b567d9d,0xfec8b26f,0x711e6fb6,0x81ca25e9
	.word	0x83ab7cee,0x3aaf1e0b,0x27168f06,0xb1b9ebf0
	.word	0x31f7bf47,0xe247debb,0x23044fbf,0x7237118d
	.word	0x8ec1195f,0x11815484,0xad880a76,0x65450a09
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
	.word	0xe3b1d07e,0x228447d2,0x34abf64c,0x7f21ea0c
	.word	0x9ea039f2,0x5380f3bc,0xb2d1a560,0x144e28f2
	.word	0x9ab010c4,0xfeaffe2b,0x077f3090,0xc53686f2
	.word	0xf692f958,0x7e1e2138,0x1027021e,0xf5548dc1
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
	.word	0xef7bbdb9,0x83e9def0,0xa6275650,0x85b62e5f
	.word	0xa73d0013,0x4019bc1b,0xb2d0b9e9,0x77ed20db
	.word	0x1b7f273a,0xbbb5f751,0x7fb4e71f,0x3a206bd9
	.word	0x4ad6903b,0xd8ef1d65,0x38d11ad3,0x5b074475
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
	.word	0x2c11ca1a,0x53792f92,0xdc50b662,0x5d84820d
	.word	0xf8de06ee,0xb4091b29,0xaba97235,0x03c9fbe4
	.word	0xb83e414b,0x952eb8da,0x45410d1a,0xafc25041
	.word	0x9f4c4205,0xb6fd7d2e,0x8a48196d,0x36ca16a6
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
	.word	0x60a06728,0x07d79fb2,0x35ffb64a,0x024a3d80
	.word	0x6f6757e7,0xfcc33a2f,0x77731bae,0x438957ab
	.word	0xc6f93a6a,0x75a65f44,0xcbd20c39,0xb4fbac79
	.word	0x6435848c,0xf40a8717,0xeae04e6a,0x9f50c401
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
	.word	0x6dd546f6,0x92b0a59d,0x2d4c8d52,0x02a6e8b9
	.word	0x5f269dc6,0x7b2ab6f5,0x296e6adc,0x09ee7bef
	.word	0x6b4724a6,0x21ff4d4a,0xc06c6e39,0x88e5521d
	.word	0x86f5424a,0x82af381f,0x5be863b2,0xc80c44e7
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
	.word	0x287e03b3,0x4551d129,0xec6d0be1,0x9be7fe7e
	.word	0xb9eefa0a,0x97732b5c,0x35f607b4,0x45a8d46d
	.word	0x9a2593bf,0xe2e3cfd9,0x30ac171b,0x27bec53e
	.word	0xe55dad0b,0x03fb41ba,0xdcf36ede,0xcf55fcc6
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
	.word	0xef622205,0x0e51f237,0xd78c3f91,0x4d468b6e
	.word	0xbd80a3c9,0x7a9588e3,0xb95cf7b6,0x15999d57
	.word	0x57cecc48,0x9fa21ded,0x51576b07,0xf2da102a
	.word	0xe8d0d8ea,0xf34c9cd0,0x6b2bda86,0x89b1b57a
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
	.word	0x9a007ea6,0x73fc3112,0x7af82288,0x4844c554
	.word	0x301665ca,0xba032b8f,0xda9681a7,0x55cfd5d5
	.word	0xe413c6f7,0x06810bf4,0x92453b2f,0xf93ac210
	.word	0xf8166e42,0x6f348f41,0xc1a03a58,0x1f5a6334
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
	.word	0x09db75ae,0x853506f6,0xea95bbc6,0x18380c87
	.word	0xdd193881,0xc0046e31,0xe18ab6dd,0xfc5f5879
	.word	0x797b2189,0xeb53e0d2,0x1c2f228b,0xc4a4f3d1
	.word	0xcc5410c3,0x7aaae5b6,0x5f76d28f,0x4d15b29a
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
	.word	0x25cf1f30,0x348d7653,0x8f32a75b,0xa693bdc6
	.word	0xa75026d1,0x466e0aa5,0x93faf4be,0xc4eb7d82
	.word	0x1f45d1ab,0x7e96e600,0x5af64036,0xebfe1be4
	.word	0x1c581844,0x067eee55,0xe9f2d044,0x425428b0
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
	.word	0x010c7d80,0xcacf082a,0x650208de,0xc3b7a6b7
	.word	0xc8f063a8,0x46d505fd,0x76b7a53b,0x0c09afad
	.word	0x600da0b3,0x517ba7bd,0x257e11ff,0x4e2e3783
	.word	0x4aced11b,0xa181f3f7,0x89275a48,0x1d249ab3
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
	.word	0x89bf16cb,0x819146e3,0xe841a44e,0xbc835ff8
	.word	0xdff00438,0x591be9dc,0xa77269f4,0xd00f891a
	.word	0x86b73c77,0xfcdf6830,0x2b2528f9,0x39471fd9
	.word	0x49fee12d,0xa7ee6954,0x3bb0e2f8,0xdef8a0de
	.word	0x30a42c25,0x6a28838c,0x19018b7c,0x98731de9
	.word	0x741fc1b9,0xd7f11da8,0x31be990f,0x4786d2f4
	.word	0xa3deb75a,0xe1ce063c,0x8b07b638,0x14425b29
	.word	0x32cca2e6,0x931d7edb,0x278d4545,0x15105de1
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
	.word	0xc3077f1a,0x99bef1de,0xeae01451,0xd5da2eab
	.word	0xe563238d,0xb05af2d7,0xbb28ea76,0xb9d18da2
	.word	0x67004f4f,0x163124a4,0xc521da94,0x77b733ed
	.word	0x9aea968b,0xdb3bcd78,0xcf4d0521,0xeb9de43b
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
	.word	0x1cc0ba26,0xe0d2ea73,0xea1b1b62,0xce1d0181
	.word	0x9c8bc872,0x2584d0cc,0xe40aaf63,0x6c8c7cd8
	.word	0xcba6fa4d,0xe9186a1a,0x941da94a,0x73246c7b
	.word	0x29f24170,0xd95a71e6,0xd66f536c,0xd284b8ae
	.word	0x059e487b,0xde42bf09,0xad6d453f,0x55e8f94d
	.word	0x73a52642,0x4cfbc099,0xb0528cc7,0x9b904037
	.word	0x8422efcf,0x18310e55,0xe610031a,0x04dd7bef
	.word	0xb32f16c3,0x23709c5c,0xbd0479f6,0x3d3a4ac1
	.word	0x62f96f0b,0xd217774f,0xcc5c9974,0x00880f9c
	.word	0x96c35735,0x7360f9fb,0xbe0d7b08,0x2907b8b1
	.word	0x39182305,0xba5d0c50,0x487b4f97,0x7cefbdc9
	.word	0x7a21cb74,0xf48bec6a,0xe4b745d0,0xd6b49bfd
	.word	0x8309f956,0xfc01ac67,0xba6a6bc9,0x4eecef01
	.word	0x003d0219,0xdda26d5b,0xebcb4070,0x4026edd8
	.word	0x13b0a214,0x41fb8574,0x181c9aa8,0x9691da86
	.word	0xbf82d403,0x9944ae28,0x50476b7d,0xfecf86f0
	.word	0x0ee36971,0x2db8d55e,0x8bc1297a,0x3ef8de59
	.word	0x9813b73d,0x1bc5d815,0xa4d58681,0x378d1582
	.word	0x47ec1697,0x469f8fc1,0x86245cf3,0x6752db3c
	.word	0x2f475918,0x1d6bbf8b,0x6938d8c9,0x025631a9
	.word	0x1f7002f2,0x2a6ed3d5,0x94de0827,0x9d55ca20
	.word	0xaa2c5a63,0xd2f823b1,0x35b87504,0xb0449fba
	.word	0x5724c129,0x877596da,0xbc81d2a2,0x38f25ef4
	.word	0x4c74be1b,0x71c39910,0xe025b4da,0x84eb5640
	.word	0x0385c5c1,0x87435378,0xc6d61f24,0x8e282a6d
	.word	0xa7548ccf,0x17c600cb,0x5f0d5a12,0x4b489fce
	.word	0xac6990a0,0xf73e5918,0x62cfa6df,0xe625cc3e
	.word	0xcbee102b,0x4b517de0,0xfed122c8,0x12fee5d1
	.word	0x27cb7b35,0xec7aa1d1,0x9543d243,0xe2d49280
	.word	0x878d4edd,0x4e30eac5,0x1d8f20d1,0xdead9daa
	.word	0xd036299b,0xf7d875d5,0xa184e36f,0xd3de38b6
	.word	0x8ea07341,0x125479e0,0xa06c5956,0x0c46cf72
share3_end:
