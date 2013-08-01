/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_2000_10.s
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
!	Seed = 330103942
!	Riesling can be on
!	1 Thread, 2000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_2000_10.s created on Mar 30, 2009 (10:39:42)
!	RC file : mar26.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar26.rc -o mpgen_2000_10 -p 1 -l 2000

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
!	%f0  = 9fb0139d 6c2bbc05 23c69758 fbc4e179
!	%f4  = c6795c11 5ee971aa d3f3dd7b a7f3ca48
!	%f8  = c7b1dcb7 c274f690 47d5ca66 a0213f02
!	%f12 = 06602e63 b8b87568 b5c6943d 712c80cc
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 093a7425 3f0daeb3 6851dcab 85976a2d
!	%f20 = 1e88b986 9a0231dc 6124bc80 49014a1e
!	%f24 = f356e200 2925597d 8b2a3086 6046fe2d
!	%f28 = e2bca68a 549100c3 89380ba3 beb15203
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 8267e2e2 da42ef45 0385ede2 88b9ba49
!	%f36 = 8f8c56c9 d1809569 9760e0c9 3064f4a1
!	%f40 = 0bcaa5d6 b5d6e970 7e99763e faa577a6
!	%f44 = 85c46f53 93bb0530 36781bba 8dfe6cbe
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x6a40a5b000000044,%g7,%g1 ! GSR scale =  8, align = 4
	wr	%g1,%g0,%gsr		! GSR = 6a40a5b000000044
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[00000000100c1400] = b68736f502eacc19, %f30 = 89380ba3 beb15203
	ldda	[%i3+%g0]0x88,%f30	! %f30 = b68736f5 02eacc19
!	%l1 = 9e3606fa17a36b36, Mem[0000000030081410] = b77ac0af
	stha	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 6b36c0af
!	Mem[0000000010141408] = 25a200a252633e01, %l2 = bb3fdf5e3ee319d5
	ldxa	[%i5+%o4]0x80,%l2	! %l2 = 25a200a252633e01
!	Mem[0000000030181400] = 0167650f, %f9  = c274f690
	lda	[%i6+%g0]0x81,%f9 	! %f9 = 0167650f
!	%l3 = 920d054a36dcb533, Mem[000000001010141e] = eb8d094e, %asi = 80
	stba	%l3,[%i4+0x01e]%asi	! Mem[000000001010141c] = eb8d334e
!	Mem[00000000211c0000] = e7fdd30e, %l1 = 9e3606fa17a36b36
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffe7fd
!	Mem[0000000030101408] = a2e88c52, %f19 = 85976a2d
	lda	[%i4+%o4]0x89,%f19	! %f19 = a2e88c52
!	%l5 = eda29913f5ae3004, Mem[00000000201c0000] = b45791b2, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 300491b2
!	Mem[0000000010141408] = 25a200a2, %l1 = ffffffffffffe7fd
	lduha	[%i5+%o4]0x80,%l1	! %l1 = 00000000000025a2
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = e7fdd30e, %l5 = eda29913f5ae3004
	ldstub	[%o2+%g0],%l5		! %l5 = 000000e7000000ff

p0_label_2:
!	Mem[0000000030001410] = 5178f9d6, %l4 = b28405939e29de0e
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 000000005178f9d6
!	%l7 = d0fa46ea7e08e65c, Mem[0000000020800000] = ab27a29f
	sth	%l7,[%o1+%g0]		! Mem[0000000020800000] = e65ca29f
!	%l0 = eb776091, %l1 = 000025a2, Mem[00000000100c1410] = 51617659 cd53ece9
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = eb776091 000025a2
!	Mem[00000000100c1400] = 02eacc19, %l3 = 920d054a36dcb533
	ldstuba	[%i3+%g0]0x88,%l3	! %l3 = 00000019000000ff
!	%f24 = f356e200, Mem[0000000010141400] = c8d0469f
	sta	%f24,[%i5+%g0]0x80	! Mem[0000000010141400] = f356e200
!	%l5 = 00000000000000e7, Mem[0000000010081400] = 92e2f854
	stwa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000e7
!	%f20 = 1e88b986 9a0231dc, %l1 = 00000000000025a2
!	Mem[0000000010141410] = ef1163af8a13a512
	add	%i5,0x010,%g1
	stda	%f20,[%g1+%l1]ASI_PST8_P ! Mem[0000000010141410] = 1e11b9af8a133112
!	Mem[0000000010101410] = bac94e3d, %l5 = 00000000000000e7
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 000000ba000000ff
!	%f4  = c6795c11, Mem[0000000010101410] = ffc94e3d
	sta	%f4 ,[%i4+%o5]0x80	! Mem[0000000010101410] = c6795c11
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = a625f9a3, %l5 = 00000000000000ba
	lduba	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000a3

p0_label_3:
!	Mem[0000000010101400] = a691fe38355b0cf4, %l5 = 00000000000000a3
	ldxa	[%i4+%g0]0x88,%l5	! %l5 = a691fe38355b0cf4
!	Mem[0000000010141408] = a200a225, %l0 = 0ad74513eb776091
	ldsba	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000025
!	Mem[0000000030101408] = a2e88c52, %l3 = 0000000000000019
	ldsha	[%i4+%o4]0x89,%l3	! %l3 = ffffffffffff8c52
!	Mem[0000000030141410] = ebcee329, %l1 = 00000000000025a2
	lduwa	[%i5+%o5]0x89,%l1	! %l1 = 00000000ebcee329
!	Mem[00000000211c0000] = fffdd30e, %l7 = d0fa46ea7e08e65c
	ldsb	[%o2+0x001],%l7		! %l7 = fffffffffffffffd
!	Mem[0000000010081408] = 92fb53e6c4224c12, %l0 = 0000000000000025
	ldxa	[%i2+%o4]0x88,%l0	! %l0 = 92fb53e6c4224c12
!	Mem[00000000100c1408] = ca8eb9027554c239, %f6  = d3f3dd7b a7f3ca48
	ldda	[%i3+%o4]0x88,%f6 	! %f6  = ca8eb902 7554c239
!	Mem[00000000100c1400] = ffccea02, %l4 = 000000005178f9d6
	ldsha	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffffcc
!	Mem[0000000010101408] = 3df454e4, %l1 = 00000000ebcee329
	lduba	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000e4
!	Starting 10 instruction Store Burst
!	%l0 = 92fb53e6c4224c12, Mem[0000000030101408] = a2e88c52
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = a2e88c12

p0_label_4:
!	Mem[0000000030041410] = 1015bc6b, %l2 = 25a200a252633e01
	ldstuba	[%i1+%o5]0x81,%l2	! %l2 = 00000010000000ff
!	Mem[000000001004143c] = 83f4eee5, %l1 = 000000e4, %l3 = ffff8c52
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 0000000083f4eee5
!	Mem[00000000300c1410] = 278ce280, %l6 = adb6129dc93e862e
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 00000000278ce280
!	Mem[0000000010001428] = 743ee3f0, %l0 = 92fb53e6c4224c12, %asi = 80
	swapa	[%i0+0x028]%asi,%l0	! %l0 = 00000000743ee3f0
!	%l1 = 00000000000000e4, Mem[00000000300c1410] = c93e862e
	stba	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = c93e86e4
!	%l1 = 00000000000000e4, Mem[00000000100c1408] = 39c25475
	stha	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00e45475
!	%l0 = 743ee3f0, %l1 = 000000e4, Mem[0000000010141410] = 1e11b9af 8a133112
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 743ee3f0 000000e4
!	%l0 = 743ee3f0, %l1 = 000000e4, Mem[0000000030181408] = 841aa50a 9d115f91
	stda	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 743ee3f0 000000e4
!	%l1 = 00000000000000e4, Mem[0000000010141430] = 6021af6062ab149e, %asi = 80
	stxa	%l1,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000000000000e4
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 6596e7f012f60e0b, %l0 = 00000000743ee3f0
	ldx	[%i3+0x018],%l0		! %l0 = 6596e7f012f60e0b

p0_label_5:
!	Mem[000000001018141c] = fde5e1cd, %l6 = 00000000278ce280
	lduba	[%i6+0x01d]%asi,%l6	! %l6 = 00000000000000e5
!	Mem[0000000030181408] = e4000000 f0e33e74, %l2 = 00000010, %l3 = 83f4eee5
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 00000000f0e33e74 00000000e4000000
!	Mem[00000000100c143c] = a69086f0, %l5 = a691fe38355b0cf4
	lduba	[%i3+0x03c]%asi,%l5	! %l5 = 00000000000000a6
!	Mem[00000000300c1408] = c01604d4, %l2 = 00000000f0e33e74
	lduwa	[%i3+%o4]0x81,%l2	! %l2 = 00000000c01604d4
!	Mem[00000000201c0000] = 300491b2, %l7 = fffffffffffffffd
	ldsb	[%o0+%g0],%l7		! %l7 = 0000000000000030
!	Mem[00000000300c1410] = c93e86e4, %l3 = 00000000e4000000
	ldsba	[%i3+%o5]0x89,%l3	! %l3 = ffffffffffffffe4
!	Mem[0000000030081400] = c7edd9845d6ea774, %l1 = 00000000000000e4
	ldxa	[%i2+%g0]0x81,%l1	! %l1 = c7edd9845d6ea774
!	Mem[0000000010101408] = 3df454e4, %l0 = 6596e7f012f60e0b
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = ffffffffffffffe4
!	Mem[0000000010181410] = 8c86efc9, %f3  = fbc4e179
	lda	[%i6+%o5]0x80,%f3 	! %f3 = 8c86efc9
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffe4, Mem[0000000010081408] = c4224c12
	stha	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = c422ffe4

p0_label_6:
!	Mem[00000000201c0000] = 300491b2, %l6 = 00000000000000e5
	ldstub	[%o0+%g0],%l6		! %l6 = 00000030000000ff
!	%l3 = ffffffffffffffe4, Mem[00000000300c1400] = aefa5adc
	stba	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = aefa5ae4
!	%l1 = c7edd9845d6ea774, Mem[00000000100c1400] = b68736f502eaccff
	stxa	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = c7edd9845d6ea774
!	Mem[0000000030041408] = a5791f3d, %l0 = ffffffffffffffe4
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 00000000a5791f3d
!	Mem[00000000300c1400] = aefa5ae4, %l1 = c7edd9845d6ea774
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 000000e4000000ff
!	Mem[00000000300c1408] = c01604d4, %l5 = 00000000000000a6
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 00000000c01604d4
!	%l5 = 00000000c01604d4, Mem[0000000030041400] = c773979b
	stha	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = c77304d4
!	Mem[000000001004142a] = e6410c9f, %l6 = 0000000000000030
	ldstub	[%i1+0x02a],%l6		! %l6 = 0000000c000000ff
!	Mem[000000001008140a] = e4ff22c4, %l7 = 0000000000000030
	ldstuba	[%i2+0x00a]%asi,%l7	! %l7 = 00000022000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = a3f925a6, %l0 = 00000000a5791f3d
	lduha	[%i6+%g0]0x80,%l0	! %l0 = 000000000000a3f9

p0_label_7:
!	Mem[0000000030181410] = 654282a9, %l1 = 00000000000000e4
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 00000000000082a9
!	Mem[0000000010141400] = 00e256f3, %f27 = 6046fe2d
	lda	[%i5+%g0]0x88,%f27	! %f27 = 00e256f3
!	Mem[00000000100c1400] = 74a76e5d, %f31 = 02eacc19
	ld	[%i3+%g0],%f31	! %f31 = 74a76e5d
!	Mem[0000000010181410] = 8c86efc9, %l6 = 000000000000000c
	lduha	[%i6+0x010]%asi,%l6	! %l6 = 0000000000008c86
!	Mem[0000000010001434] = 91e2ce06, %f11 = a0213f02
	lda	[%i0+0x034]%asi,%f11	! %f11 = 91e2ce06
!	Mem[0000000010081400] = e7000000, %l7 = 0000000000000022
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = ffffffffe7000000
!	Mem[000000001010140c] = 25697236, %l3 = ffffffffffffffe4
	lduw	[%i4+0x00c],%l3		! %l3 = 0000000025697236
!	Mem[0000000030181408] = 743ee3f0000000e4, %l6 = 0000000000008c86
	ldxa	[%i6+%o4]0x81,%l6	! %l6 = 743ee3f0000000e4
!	Mem[0000000020800040] = de2464b8, %l5 = 00000000c01604d4
	lduha	[%o1+0x040]%asi,%l5	! %l5 = 000000000000de24
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffcc, Mem[000000001004142a] = e641ff9f
	stb	%l4,[%i1+0x02a]		! Mem[0000000010041428] = e641cc9f

p0_label_8:
!	%l3 = 0000000025697236, Mem[000000001014143c] = a3d2482a
	stw	%l3,[%i5+0x03c]		! Mem[000000001014143c] = 25697236
!	Mem[0000000010181408] = 566a6b3b, %l5 = 000000000000de24
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 00000000566a6b3b
!	%l0 = 0000a3f9, %l1 = 000082a9, Mem[0000000030001410] = 9e29de0e 8668b26d
	stda	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000a3f9 000082a9
!	%f14 = b5c6943d 712c80cc, %l2 = 00000000c01604d4
!	Mem[0000000010181418] = e036d385fde5e1cd
	add	%i6,0x018,%g1
	stda	%f14,[%g1+%l2]ASI_PST8_P ! Mem[0000000010181418] = b5c6d33dfd2ce1cd
!	%l5 = 00000000566a6b3b, Mem[0000000010041400] = 90fdb42c
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 6b3bb42c
!	Mem[00000000300c1400] = ff5afaae, %l5 = 00000000566a6b3b
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	%l6 = 743ee3f0000000e4, Mem[0000000010041408] = f1615209
	stwa	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000e4
!	%f20 = 1e88b986 9a0231dc, %l0 = 000000000000a3f9
!	Mem[0000000030041428] = ca0edd9de945683f
	add	%i1,0x028,%g1
	stda	%f20,[%g1+%l0]ASI_PST32_S ! Mem[0000000030041428] = ca0edd9d9a0231dc
!	Mem[0000000010081408] = e4ffffc4, %l2 = 00000000c01604d4
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 00000000e4ffffc4
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = 9c23ef3b, %l5 = 00000000000000ff
	ldsha	[%i1+0x022]%asi,%l5	! %l5 = ffffffffffffef3b

p0_label_9:
!	Mem[0000000010041408] = 000000e4, %l6 = 743ee3f0000000e4
	lduha	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000e4
!	Mem[0000000030101408] = 128ce8a2, %l1 = 00000000000082a9
	lduha	[%i4+%o4]0x81,%l1	! %l1 = 000000000000128c
!	Mem[0000000010081410] = f4e79774 10fa40b2, %l2 = e4ffffc4, %l3 = 25697236
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 0000000010fa40b2 00000000f4e79774
!	Mem[0000000030081410] = 6b36c0af, %l4 = ffffffffffffffcc
	lduwa	[%i2+%o5]0x81,%l4	! %l4 = 000000006b36c0af
!	Mem[0000000030141408] = 25b93ce4, %l0 = 000000000000a3f9
	ldsha	[%i5+%o4]0x81,%l0	! %l0 = 00000000000025b9
!	Mem[0000000030001408] = 233725a7, %l0 = 00000000000025b9
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 0000000000002337
!	Mem[00000000100c1410] = eb776091 000025a2, %l0 = 00002337, %l1 = 0000128c
	ldd	[%i3+%o5],%l0		! %l0 = 00000000eb776091 00000000000025a2
!	Mem[0000000010141410] = 743ee3f0, %l2 = 0000000010fa40b2
	lduwa	[%i5+%o5]0x80,%l2	! %l2 = 00000000743ee3f0
!	Mem[0000000030141410] = 8f783edaebcee329, %l3 = 00000000f4e79774
	ldxa	[%i5+%o5]0x89,%l3	! %l3 = 8f783edaebcee329
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = c93e86e4, %l1 = 00000000000025a2
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 00000000c93e86e4

p0_label_10:
!	Mem[0000000030181408] = 743ee3f0, %l6 = 00000000000000e4
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000743ee3f0
!	%f0  = 9fb0139d 6c2bbc05 23c69758 8c86efc9
!	%f4  = c6795c11 5ee971aa ca8eb902 7554c239
!	%f8  = c7b1dcb7 0167650f 47d5ca66 91e2ce06
!	%f12 = 06602e63 b8b87568 b5c6943d 712c80cc
	stda	%f0,[%i6]ASI_COMMIT_P	! Block Store to 0000000010181400
!	Mem[0000000010141408] = 25a200a2, %l3 = 8f783edaebcee329
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 00000025000000ff
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010181410] = c6795c11, %l2 = 00000000743ee3f0
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000c6795c11
!	%l1 = 00000000c93e86e4, Mem[0000000010081410] = f4e7977410fa40b2
	stxa	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000c93e86e4
!	Mem[0000000030141408] = 25b93ce4, %l6 = 00000000743ee3f0
	swapa	[%i5+%o4]0x81,%l6	! %l6 = 0000000025b93ce4
!	%l3 = 0000000000000025, Mem[0000000010081410] = e4863ec9
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000025
!	Mem[0000000030041410] = ff15bc6b, %l0 = 00000000eb776091
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030181408] = e4000000, %l2 = 00000000c6795c11
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = c6795c11, %l7 = ffffffffe7000000
	lduha	[%i4+%o5]0x80,%l7	! %l7 = 000000000000c679

p0_label_11:
!	Mem[0000000010181408] = 5897c623, %f30 = b68736f5
	lda	[%i6+%o4]0x88,%f30	! %f30 = 5897c623
!	Mem[0000000030041410] = ff15bc6b, %l5 = ffffffffffffef3b
	lduha	[%i1+%o5]0x81,%l5	! %l5 = 000000000000ff15
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010181400] = 9fb0139d 6c2bbc05 23c69758 8c86efc9
!	Mem[0000000010181410] = 743ee3f0 5ee971aa ca8eb902 7554c239
!	Mem[0000000010181420] = c7b1dcb7 0167650f 47d5ca66 91e2ce06
!	Mem[0000000010181430] = 06602e63 b8b87568 b5c6943d 712c80cc
	ldda	[%i6]ASI_BLK_AIUP,%f0	! Block Load from 0000000010181400
!	Mem[0000000030101408] = a2e88c12, %l3 = 0000000000000025
	lduba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000012
!	Mem[0000000030001400] = bb6a2ee2, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000bb
!	Mem[0000000010141410] = f0e33e74, %f24 = f356e200
	lda	[%i5+%o5]0x88,%f24	! %f24 = f0e33e74
!	Mem[00000000201c0000] = ff0491b2, %l1 = 00000000c93e86e4
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081400] = e7000000 7c576394, %l2 = 000000bb, %l3 = 00000012
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 00000000e7000000 000000007c576394
!	Mem[000000001004143c] = 83f4eee5, %l1 = 00000000000000ff
	ldub	[%i1+0x03e],%l1		! %l1 = 00000000000000ee
!	Starting 10 instruction Store Burst
!	Mem[000000001000140c] = f67ba10b, %l7 = 000000000000c679
	swap	[%i0+0x00c],%l7		! %l7 = 00000000f67ba10b

p0_label_12:
!	Mem[0000000010141400] = 00e256f3, %l4 = 000000006b36c0af
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 000000f3000000ff
!	%l1 = 00000000000000ee, Mem[0000000010101410] = c6795c11
	stba	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = ee795c11
!	%f16 = 093a7425 3f0daeb3, %l5 = 000000000000ff15
!	Mem[0000000030141418] = 2fa2864dc7e28a7b
	add	%i5,0x018,%g1
	stda	%f16,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030141418] = b3a20d4d25e28a7b
!	Mem[0000000030101400] = e22b35ad, %l4 = 00000000000000f3
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 00000000e22b35ad
!	%f20 = 1e88b986, Mem[0000000010101400] = 355b0cf4
	sta	%f20,[%i4+%g0]0x88	! Mem[0000000010101400] = 1e88b986
	membar	#Sync			! Added by membar checker (3)
!	%f18 = 6851dcab a2e88c52, Mem[0000000010181400] = 9fb0139d 6c2bbc05
	stda	%f18,[%i6+%g0]0x80	! Mem[0000000010181400] = 6851dcab a2e88c52
!	%l5 = 000000000000ff15, Mem[0000000010081400] = 000000e7
	stha	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000ff15
!	Mem[0000000010001400] = 1d2cec92, %l2 = 00000000e7000000
	lduwa	[%i0+0x000]%asi,%l2	! %l2 = 000000001d2cec92
!	Mem[0000000030041408] = ffffffe4, %l5 = 000000000000ff15
	swapa	[%i1+%o4]0x81,%l5	! %l5 = 00000000ffffffe4
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = a6000000, %l1 = 00000000000000ee
	lduwa	[%i3+%o4]0x89,%l1	! %l1 = 00000000a6000000

p0_label_13:
!	Mem[0000000010101400] = 1e88b986, %l7 = 00000000f67ba10b
	lduwa	[%i4+%g0]0x88,%l7	! %l7 = 000000001e88b986
!	Mem[0000000030141400] = c606b8a4, %l2 = 000000001d2cec92
	ldswa	[%i5+%g0]0x89,%l2	! %l2 = ffffffffc606b8a4
!	Mem[0000000030081408] = eb98091a, %l2 = ffffffffc606b8a4
	ldsba	[%i2+%o4]0x89,%l2	! %l2 = 000000000000001a
!	Mem[0000000030081408] = 1a0998eb, %l6 = 0000000025b93ce4
	ldsba	[%i2+%o4]0x81,%l6	! %l6 = 000000000000001a
!	Mem[0000000030001410] = 000082a90000a3f9, %f0  = 9fb0139d 6c2bbc05
	ldda	[%i0+%o5]0x89,%f0 	! %f0  = 000082a9 0000a3f9
!	Mem[000000001004142c] = 9f18c46f, %l1 = 00000000a6000000
	ldsba	[%i1+0x02d]%asi,%l1	! %l1 = 0000000000000018
!	Mem[0000000010181410] = 743ee3f0, %l7 = 000000001e88b986
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = 000000000000743e
!	Mem[0000000030001410] = f9a30000 a9820000, %l6 = 0000001a, %l7 = 0000743e
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 00000000f9a30000 00000000a9820000
!	Mem[0000000010181410] = f0e33e74, %l7 = 00000000a9820000
	lduwa	[%i6+%o5]0x88,%l7	! %l7 = 00000000f0e33e74
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 0000a3f9, %l3 = 000000007c576394
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 000000f9000000ff

p0_label_14:
!	Mem[0000000010081408] = d40416c0, %l6 = 00000000f9a30000
	swapa	[%i2+%o4]0x88,%l6	! %l6 = 00000000d40416c0
!	Mem[000000001000142b] = c4224c12, %l6 = 00000000d40416c0
	ldstub	[%i0+0x02b],%l6		! %l6 = 00000012000000ff
!	Mem[0000000030141408] = f0e33e74, %l6 = 0000000000000012
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 00000074000000ff
!	Mem[0000000010101438] = c0a13507, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x038]%asi,%l0	! %l0 = 00000000c0a13507
!	Mem[0000000010001400] = 1d2cec92, %l6 = 0000000000000074
	swapa	[%i0+%g0]0x80,%l6	! %l6 = 000000001d2cec92
!	%l4 = 00000000e22b35ad, Mem[0000000010141410] = 743ee3f0
	stha	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 35ade3f0
!	%f21 = 9a0231dc, Mem[0000000010141400] = ff56e200
	sta	%f21,[%i5+%g0]0x80	! Mem[0000000010141400] = 9a0231dc
!	%f25 = 2925597d, Mem[0000000010181410] = f0e33e74
	sta	%f25,[%i6+%o5]0x88	! Mem[0000000010181410] = 2925597d
!	%l6 = 000000001d2cec92, Mem[0000000030181408] = e40000ff
	stwa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 1d2cec92
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = f3000000, %l0 = 00000000c0a13507
	ldswa	[%i4+%g0]0x89,%l0	! %l0 = fffffffff3000000

p0_label_15:
!	Mem[0000000030181408] = 1d2cec92, %l0 = fffffffff3000000
	ldswa	[%i6+%o4]0x89,%l0	! %l0 = 000000001d2cec92
!	Mem[000000001000143c] = 5d438f65, %l0 = 000000001d2cec92
	ldsha	[%i0+0x03c]%asi,%l0	! %l0 = 0000000000005d43
!	Mem[0000000010041408] = f1201c96000000e4, %l1 = 0000000000000018
	ldxa	[%i1+%o4]0x88,%l1	! %l1 = f1201c96000000e4
!	Mem[0000000030041408] = 5a073ad615ff0000, %f8  = c7b1dcb7 0167650f
	ldda	[%i1+%o4]0x89,%f8 	! %f8  = 5a073ad6 15ff0000
!	%l6 = 000000001d2cec92, immd = fffffffffffffb09, %l1 = f1201c96000000e4
	udivx	%l6,-0x4f7,%l1		! %l1 = 0000000000000000
!	Mem[0000000030101410] = 7c909452, %l0 = 0000000000005d43
	lduba	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000052
!	Mem[0000000010141410] = f0e3ad35, %l5 = 00000000ffffffe4
	lduwa	[%i5+%o5]0x88,%l5	! %l5 = 00000000f0e3ad35
!	Mem[0000000030081400] = c7edd9845d6ea774, %l5 = 00000000f0e3ad35
	ldxa	[%i2+%g0]0x81,%l5	! %l5 = c7edd9845d6ea774
!	%l5 = c7edd9845d6ea774, %l6 = 000000001d2cec92, %l2 = 000000000000001a
	or	%l5,%l6,%l2		! %l2 = c7edd9845d6eeff6
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = fffdd30e, %l0 = 0000000000000052
	ldstub	[%o2+0x001],%l0		! %l0 = 000000fd000000ff

p0_label_16:
!	%l1 = 0000000000000000, Mem[0000000010081400] = 15ff0000
	stba	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 00ff0000
!	%l3 = 00000000000000f9, Mem[0000000010041402] = 6b3bb42c, %asi = 80
	stha	%l3,[%i1+0x002]%asi	! Mem[0000000010041400] = 6b3b00f9
!	Mem[0000000010041408] = e4000000, %l2 = c7edd9845d6eeff6
	swap	[%i1+%o4],%l2		! %l2 = 00000000e4000000
!	Mem[0000000010181408] = 5897c623, %l6 = 000000001d2cec92
	swapa	[%i6+%o4]0x88,%l6	! %l6 = 000000005897c623
!	Mem[0000000030181400] = 0f656701, %l7 = 00000000f0e33e74
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 000000000f656701
!	%l7 = 000000000f656701, Mem[0000000010041421] = 9c23ef3b, %asi = 80
	stba	%l7,[%i1+0x021]%asi	! Mem[0000000010041420] = 9c01ef3b
!	Mem[0000000030081410] = 6b36c0af, %l5 = c7edd9845d6ea774
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 000000006b36c0af
!	%f10 = 47d5ca66 91e2ce06, Mem[0000000010101408] = e454f43d 25697236
	stda	%f10,[%i4+%o4]0x80	! Mem[0000000010101408] = 47d5ca66 91e2ce06
!	%l1 = 0000000000000000, Mem[0000000010101410] = ee795c11
	stba	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 00795c11
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 92ec2c1d, %l5 = 000000006b36c0af
	ldswa	[%i6+%o4]0x81,%l5	! %l5 = ffffffff92ec2c1d

p0_label_17:
!	Mem[0000000030001410] = ffa30000, %l5 = ffffffff92ec2c1d
	ldswa	[%i0+%o5]0x81,%l5	! %l5 = ffffffffffa30000
!	Mem[00000000300c1410] = a2250000, %l5 = ffffffffffa30000
	ldsba	[%i3+%o5]0x81,%l5	! %l5 = ffffffffffffffa2
!	Mem[0000000010041400] = 6b3b00f9cb818699, %l7 = 000000000f656701
	ldxa	[%i1+%g0]0x80,%l7	! %l7 = 6b3b00f9cb818699
!	Mem[0000000010041400] = 998681cb f9003b6b, %l6 = 5897c623, %l7 = cb818699
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 00000000f9003b6b 00000000998681cb
!	Mem[0000000010141420] = 92e7e9291dfce0ef, %l5 = ffffffffffffffa2
	ldxa	[%i5+0x020]%asi,%l5	! %l5 = 92e7e9291dfce0ef
!	Mem[0000000030141410] = 8f783eda ebcee329, %l6 = f9003b6b, %l7 = 998681cb
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 00000000ebcee329 000000008f783eda
!	Mem[0000000010081400] = 0000ff00, %l7 = 000000008f783eda
	ldsba	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[000000001018140c] = 8c86efc9, %f2  = 23c69758
	lda	[%i6+0x00c]%asi,%f2 	! %f2 = 8c86efc9
!	Mem[0000000020800000] = e65ca29f, %l3 = 00000000000000f9
	ldsh	[%o1+%g0],%l3		! %l3 = ffffffffffffe65c
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = a6000000, %l1 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff

p0_label_18:
!	%f8  = 5a073ad6 15ff0000, %l7 = 0000000000000000
!	Mem[0000000010081408] = 0000a3f9e653fb92
	add	%i2,0x008,%g1
	stda	%f8,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010081408] = 0000a3f9e653fb92
!	Mem[00000000300c1400] = aefa5aff, %l4 = 00000000e22b35ad
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	%l2 = e4000000, %l3 = ffffe65c, Mem[00000000300c1408] = a60000ff 476235d9
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = e4000000 ffffe65c
!	Mem[0000000010041400] = f9003b6b, %l5 = 92e7e9291dfce0ef
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 0000006b000000ff
!	Mem[00000000100c1400] = 74a76e5d, %l3 = ffffffffffffe65c
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 00000074000000ff
!	%l6 = 00000000ebcee329, Mem[00000000211c0000] = ffffd30e, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 29ffd30e
!	%l5 = 000000000000006b, Mem[00000000100c142c] = 1faa20a5, %asi = 80
	stba	%l5,[%i3+0x02c]%asi	! Mem[00000000100c142c] = 6baa20a5
!	%f14 = b5c6943d, Mem[0000000010001410] = d6dc35e1
	sta	%f14,[%i0+%o5]0x88	! Mem[0000000010001410] = b5c6943d
!	%f10 = 47d5ca66, Mem[0000000030081400] = 84d9edc7
	sta	%f10,[%i2+%g0]0x89	! Mem[0000000030081400] = 47d5ca66
!	Starting 10 instruction Load Burst
!	Mem[000000001000140c] = 0000c679, %l4 = 00000000000000ff
	ldsba	[%i0+0x00c]%asi,%l4	! %l4 = 0000000000000000

p0_label_19:
!	Mem[0000000030101400] = f3000000, %l7 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 0000ff15, %l2 = 00000000e4000000
	lduba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 00ff00007c576394, %f20 = 1e88b986 9a0231dc
	ldda	[%i2+0x000]%asi,%f20	! %f20 = 00ff0000 7c576394
!	Mem[00000000100c1410] = eb776091, %l4 = 0000000000000000
	ldsha	[%i3+0x010]%asi,%l4	! %l4 = ffffffffffffeb77
!	Mem[0000000030141408] = ff3ee3f0, %f7  = 7554c239
	lda	[%i5+%o4]0x81,%f7 	! %f7 = ff3ee3f0
!	Mem[0000000030081410] = 7d646d65 74a76e5d, %l0 = 000000fd, %l1 = 00000000
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 0000000074a76e5d 000000007d646d65
!	Mem[0000000030081408] = eb98091a, %l3 = 0000000000000074
	ldswa	[%i2+%o4]0x89,%l3	! %l3 = ffffffffeb98091a
!	Mem[0000000030041408] = 0000ff15, %l6 = 00000000ebcee329
	ldsba	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = c9ef868c 1d2cec92, %l0 = 74a76e5d, %l1 = 7d646d65
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 000000001d2cec92 00000000c9ef868c
!	Starting 10 instruction Store Burst
!	%l4 = ffffeb77, %l5 = 0000006b, Mem[0000000030181410] = a9824265 abc9db2a
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffeb77 0000006b

p0_label_20:
!	%l3 = ffffffffeb98091a, Mem[0000000010041400] = f9003bff
	stha	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = f900091a
!	%l0 = 000000001d2cec92, Mem[0000000010001400] = 00000074
	stha	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = ec920074
!	Mem[00000000211c0001] = 29ffd30e, %l1 = 00000000c9ef868c
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010081420] = a699a4eb, %l0 = 000000001d2cec92, %asi = 80
	swapa	[%i2+0x020]%asi,%l0	! %l0 = 00000000a699a4eb
!	%l6 = 0000000000000000, Mem[00000000100c1422] = 9288eca2, %asi = 80
	stha	%l6,[%i3+0x022]%asi	! Mem[00000000100c1420] = 92880000
!	%f0  = 000082a9 0000a3f9, Mem[0000000010041408] = f6ef6e5d f1201c96
	stda	%f0 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 000082a9 0000a3f9
!	%l0 = 00000000a699a4eb, Mem[0000000010081400] = 00ff0000
	stwa	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = a699a4eb
!	%l5 = 000000000000006b, Mem[0000000030101400] = f3000000
	stwa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000006b
!	Mem[0000000021800180] = fd374b9c, %l7 = 0000000000000000
	ldstub	[%o3+0x180],%l7		! %l7 = 000000fd000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = aa71e95e2925597d, %f16 = 093a7425 3f0daeb3
	ldda	[%i6+%o5]0x88,%f16	! %f16 = aa71e95e 2925597d

p0_label_21:
!	Mem[0000000010001408] = 5683e4b80000c679, %l2 = 0000000000000000
	ldx	[%i0+%o4],%l2		! %l2 = 5683e4b80000c679
!	Mem[0000000010001414] = 0efd2b21, %l6 = 0000000000000000
	ldsb	[%i0+0x014],%l6		! %l6 = 000000000000000e
!	Mem[0000000010081410] = 00000025, %l0 = 00000000a699a4eb
	ldsha	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 29e3ceeb, %l7 = 00000000000000fd
	ldsba	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000029
!	Mem[00000000300c1410] = 000025a2, %l2 = 5683e4b80000c679
	ldswa	[%i3+%o5]0x89,%l2	! %l2 = 00000000000025a2
!	Mem[0000000010001408] = 5683e4b8 0000c679, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 000000005683e4b8 000000000000c679
!	Mem[0000000010041400] = 1a0900f9cb818699, %l7 = 0000000000000029
	ldxa	[%i1+%g0]0x80,%l7	! %l7 = 1a0900f9cb818699
!	Mem[0000000010081410] = 0000000025000000, %f6  = ca8eb902 ff3ee3f0
	ldda	[%i2+%o5]0x88,%f6 	! %f6  = 00000000 25000000
!	Mem[0000000030041408] = 0000ff15, %l4 = ffffffffffffeb77
	lduba	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f18 = 6851dcab, Mem[0000000030141400] = a4b806c6
	sta	%f18,[%i5+%g0]0x81	! Mem[0000000030141400] = 6851dcab

p0_label_22:
!	%l7 = 1a0900f9cb818699, Mem[0000000010181408] = 1d2cec92
	stha	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 1d2c8699
!	%f31 = 74a76e5d, Mem[0000000010141424] = 1dfce0ef
	st	%f31,[%i5+0x024]	! Mem[0000000010141424] = 74a76e5d
!	Mem[0000000030101400] = 0000006b, %l1 = 000000000000c679
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 0000006b000000ff
!	%f2  = 8c86efc9, Mem[0000000010001438] = f314cac4
	st	%f2 ,[%i0+0x038]	! Mem[0000000010001438] = 8c86efc9
!	Mem[0000000030081400] = 66cad547, %l1 = 000000000000006b
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 00000066000000ff
!	%l0 = 000000005683e4b8, Mem[0000000010101414] = c326ec5c, %asi = 80
	stwa	%l0,[%i4+0x014]%asi	! Mem[0000000010101414] = 5683e4b8
!	Mem[0000000010001410] = b5c6943d, %l2 = 00000000000025a2
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 0000003d000000ff
!	%l1 = 0000000000000066, Mem[0000000030181400] = f0e33e74
	stba	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = f0e33e66
!	%l6 = 000000000000000e, Mem[0000000010041400] = f900091a
	stha	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = f900000e
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = bb6a2ee299198d56, %l0 = 000000005683e4b8
	ldxa	[%i0+%g0]0x81,%l0	! %l0 = bb6a2ee299198d56

p0_label_23:
!	Mem[0000000030101408] = a2e88c12, %f25 = 2925597d
	lda	[%i4+%o4]0x89,%f25	! %f25 = a2e88c12
!	Mem[0000000010181408] = 1d2c8699, %l0 = bb6a2ee299198d56
	lduwa	[%i6+%o4]0x88,%l0	! %l0 = 000000001d2c8699
!	Mem[0000000030041408] = 0000ff15, %f6  = 00000000
	lda	[%i1+%o4]0x81,%f6 	! %f6 = 0000ff15
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030101400] = ff000000 6f90bd45 128ce8a2 2761da8e
!	Mem[0000000030101410] = 5294907c cf7458b4 34c786ad 81f67883
!	Mem[0000000030101420] = 5af94f01 8dc144eb c6cc59f6 4fbd7843
!	Mem[0000000030101430] = c9ec9cde 06097efa d18db23e 2cde44c1
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[00000000100c1400] = ffa76e5d, %f31 = 74a76e5d
	lda	[%i3+%g0]0x80,%f31	! %f31 = ffa76e5d
!	Mem[0000000030001410] = ffa30000a9820000, %l7 = 1a0900f9cb818699
	ldxa	[%i0+%o5]0x81,%l7	! %l7 = ffa30000a9820000
!	Mem[0000000030001400] = 568d1999e22e6abb, %l4 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = 568d1999e22e6abb
!	Mem[0000000030141408] = 467ff37a f0e33eff, %l0 = 1d2c8699, %l1 = 00000066
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 00000000f0e33eff 00000000467ff37a
!	Mem[0000000010041410] = 85c859a5, %l2 = 000000000000003d
	ldsba	[%i1+%o5]0x88,%l2	! %l2 = ffffffffffffffa5
!	Starting 10 instruction Store Burst
!	%f26 = 8b2a3086 00e256f3, Mem[0000000010101408] = 47d5ca66 91e2ce06
	stda	%f26,[%i4+%o4]0x80	! Mem[0000000010101408] = 8b2a3086 00e256f3

p0_label_24:
!	%f28 = e2bca68a 549100c3, %l3 = ffffffffeb98091a
!	Mem[0000000010181438] = b5c6943d712c80cc
	add	%i6,0x038,%g1
	stda	%f28,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010181438] = b5c69154712cbce2
!	%l0 = 00000000f0e33eff, Mem[0000000010081410] = 0000000025000000
	stxa	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000f0e33eff
!	%l3 = ffffffffeb98091a, Mem[0000000030141410] = 29e3ceeb
	stha	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 091aceeb
!	%l7 = ffa30000a9820000, Mem[0000000030081408] = 77b2d3cceb98091a
	stxa	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = ffa30000a9820000
!	Mem[00000000201c0001] = ff0491b2, %l6 = 000000000000000e
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 00000004000000ff
!	%l0 = 00000000f0e33eff, Mem[0000000010001408] = 5683e4b8
	stha	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 3effe4b8
!	%l4 = 568d1999e22e6abb, Mem[0000000010181408] = 1d2c8699
	stba	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 1d2c86bb
!	Mem[0000000010041400] = f900000e, %l1 = 00000000467ff37a
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 00000000f900000e
!	%f20 = 00ff0000 7c576394, %l1 = 00000000f900000e
!	Mem[0000000030181418] = 85db0adeb46bae7b
	add	%i6,0x018,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030181418] = 85db0ade0000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffa200a2, %l4 = 568d1999e22e6abb
	ldsha	[%i5+%o4]0x80,%l4	! %l4 = ffffffffffffffa2

p0_label_25:
!	Mem[00000000201c0000] = ffff91b2, %l4 = ffffffffffffffa2
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[00000000100c1400] = ffa76e5d84d9edc7, %l0 = 00000000f0e33eff
	ldxa	[%i3+%g0]0x80,%l0	! %l0 = ffa76e5d84d9edc7
!	Mem[00000000100c1410] = eb776091 000025a2, %l2 = ffffffa5, %l3 = eb98091a
	ldda	[%i3+%o5]0x80,%l2	! %l2 = 00000000eb776091 00000000000025a2
!	Mem[0000000030081408] = 000082a9, %l0 = ffa76e5d84d9edc7
	ldswa	[%i2+%o4]0x81,%l0	! %l0 = 00000000000082a9
!	Mem[0000000010181400] = abdc5168, %l6 = 0000000000000004
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 00000000abdc5168
!	Mem[00000000100c1400] = 5d6ea7ff, %l4 = ffffffffffffffff
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141410] = 091aceebda3e788f, %f22 = 6124bc80 49014a1e
	ldda	[%i5+%o5]0x81,%f22	! %f22 = 091aceeb da3e788f
!	Mem[0000000030081408] = 000082a90000a3ff, %f18 = 6851dcab a2e88c52
	ldda	[%i2+%o4]0x81,%f18	! %f18 = 000082a9 0000a3ff
!	Mem[0000000030001410] = 000082a9 0000a3ff, %l6 = abdc5168, %l7 = a9820000
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 000000000000a3ff 00000000000082a9
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = b5c694ff, %l3 = 00000000000025a2
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 000000ff000000ff

p0_label_26:
!	Mem[00000000100c1404] = 84d9edc7, %l6 = 000000000000a3ff
	swap	[%i3+0x004],%l6		! %l6 = 0000000084d9edc7
!	%l4 = ffffffffffffffff, Mem[0000000010041408] = f9a30000
	stba	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = ffa30000
!	%l7 = 00000000000082a9, Mem[0000000010141410] = 35ade3f0
	stwa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 000082a9
!	Mem[0000000010181410] = 7d592529, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 0000007d000000ff
!	%l4 = ffffffffffffffff, Mem[0000000030081408] = ffa30000a9820000
	stxa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffffffffffff
!	%l0 = 000082a9, %l1 = f900000e, Mem[0000000030141410] = 091aceeb da3e788f
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 000082a9 f900000e
!	Mem[0000000010101436] = afad2fea, %l7 = 00000000000082a9
	ldstuba	[%i4+0x036]%asi,%l7	! %l7 = 0000002f000000ff
!	%l5 = 000000000000006b, Mem[0000000010181400] = 6851dcaba2e88c52
	stxa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000000000006b
	membar	#Sync			! Added by membar checker (5)
!	%l2 = 00000000eb776091, Mem[0000000030101408] = a2e88c12
	stba	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = a2e88c91
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffcad547 5d6ea774 ffffffff ffffffff
!	Mem[0000000030081410] = 5d6ea774 656d647d 0e2f9683 1669a53e
!	Mem[0000000030081420] = d16d567d 8f12e4d7 7b7d0855 6acd54af
!	Mem[0000000030081430] = 28ade205 ccc2d45b 60df3d69 fc78291a
	ldda	[%i2]ASI_BLK_SL,%f16	! Block Load from 0000000030081400

p0_label_27:
!	Mem[0000000020800040] = de2464b8, %l0 = 00000000000082a9
	ldub	[%o1+0x041],%l0		! %l0 = 0000000000000024
!	Mem[0000000010181418] = ca8eb9027554c239, %f10 = c6cc59f6 4fbd7843
	ldd	[%i6+0x018],%f10	! %f10 = ca8eb902 7554c239
!	Mem[0000000010181410] = ff592529, %l2 = 00000000eb776091
	lduwa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ff592529
!	Mem[00000000100c1410] = eb776091, %l6 = 0000000084d9edc7
	ldsha	[%i3+%o5]0x80,%l6	! %l6 = ffffffffffffeb77
!	Mem[0000000030001410] = 0000a3ff, %l2 = 00000000ff592529
	lduba	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = a699a4eb, %f2  = 128ce8a2
	ld	[%i2+%g0],%f2 	! %f2 = a699a4eb
!	Mem[0000000010041400] = 998681cb467ff37a, %l4 = ffffffffffffffff
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = 998681cb467ff37a
!	Mem[0000000030081408] = ffffffff, %f6  = 34c786ad
	lda	[%i2+%o4]0x89,%f6 	! %f6 = ffffffff
!	Mem[0000000030081410] = 74a76e5d, %f6  = ffffffff
	lda	[%i2+%o5]0x89,%f6 	! %f6 = 74a76e5d
!	Starting 10 instruction Store Burst
!	%f0  = ff000000, Mem[0000000010081420] = 1d2cec92
	st	%f0 ,[%i2+0x020]	! Mem[0000000010081420] = ff000000

p0_label_28:
!	%f16 = 74a76e5d 47d5caff ffffffff ffffffff
!	%f20 = 7d646d65 74a76e5d 3ea56916 83962f0e
!	%f24 = d7e4128f 7d566dd1 af54cd6a 55087d7b
!	%f28 = 5bd4c2cc 05e2ad28 1a2978fc 693ddf60
	stda	%f16,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400
!	%f5  = cf7458b4, Mem[0000000030141408] = ff3ee3f0
	sta	%f5 ,[%i5+%o4]0x81	! Mem[0000000030141408] = cf7458b4
!	Mem[0000000030101408] = a2e88c91, %l2 = 00000000000000ff
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 00000000a2e88c91
!	Mem[0000000030041408] = 15ff0000, %l7 = 000000000000002f
	ldstuba	[%i1+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l2 = 00000000a2e88c91, Mem[00000000300c1408] = 000000e4
	stha	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 8c9100e4
!	%l5 = 000000000000006b, Mem[0000000020800000] = e65ca29f, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 006ba29f
!	%f13 = 06097efa, Mem[0000000010041410] = a559c885
	sta	%f13,[%i1+%o5]0x80	! Mem[0000000010041410] = 06097efa
!	%l3 = 000000000000007d, Mem[0000000010181400] = 00000000
	stha	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000007d
!	Mem[0000000030041400] = d40473c7, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 000000d4000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041424] = 3d1c1b10, %l6 = ffffffffffffeb77
	ldsw	[%i1+0x024],%l6		! %l6 = 000000003d1c1b10

p0_label_29:
!	Mem[00000000100c1400] = 5d6ea7ff, %l0 = 0000000000000024
	ldsba	[%i3+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001408] = 65dde4f8a7253723, %l3 = 000000000000007d
	ldxa	[%i0+%o4]0x89,%l3	! %l3 = 65dde4f8a7253723
!	Mem[0000000010041400] = 7af37f46 cb818699, %l2 = a2e88c91, %l3 = a7253723
	ldda	[%i1+0x000]%asi,%l2	! %l2 = 000000007af37f46 00000000cb818699
!	Mem[0000000030041408] = 15ff00ff, %l7 = 00000000000000d4
	lduwa	[%i1+%o4]0x89,%l7	! %l7 = 0000000015ff00ff
!	Mem[0000000010101400] = 1e88b986, %l5 = 000000000000006b
	ldsba	[%i4+%g0]0x88,%l5	! %l5 = ffffffffffffff86
!	Mem[0000000010001428] = c4224cffc0b09daa, %f2  = a699a4eb 2761da8e
	ldda	[%i0+0x028]%asi,%f2 	! %f2  = c4224cff c0b09daa
!	Mem[0000000021800040] = b7725fe5, %l1 = 00000000f900000e
	ldsha	[%o3+0x040]%asi,%l1	! %l1 = ffffffffffffb772
!	Mem[0000000010141410] = a9820000, %l3 = 00000000cb818699
	ldsha	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = e400918c, %l6 = 000000003d1c1b10
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 000000000000918c
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ff0473c7, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000ff0473c7

p0_label_30:
!	%l4 = 467ff37a, %l5 = ffffff86, Mem[0000000010181418] = ca8eb902 7554c239
	stda	%l4,[%i6+0x018]%asi	! Mem[0000000010181418] = 467ff37a ffffff86
!	%l5 = ffffffffffffff86, Mem[0000000010141408] = a200a2ff
	stba	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = a200a286
!	%l2 = 7af37f46, %l3 = ff0473c7, Mem[0000000010101438] = 000000ff 2905d94f
	stda	%l2,[%i4+0x038]%asi	! Mem[0000000010101438] = 7af37f46 ff0473c7
!	%l2 = 000000007af37f46, Mem[0000000010041410] = fa7e0906
	stha	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = fa7e7f46
!	%l3 = 00000000ff0473c7, Mem[0000000010101400] = 86b9881e38fe91a6, %asi = 80
	stxa	%l3,[%i4+0x000]%asi	! Mem[0000000010101400] = 00000000ff0473c7
!	%f9  = 8dc144eb, Mem[0000000010101400] = 00000000
	sta	%f9 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 8dc144eb
!	Mem[00000000100c1408] = 7554e400, %l0 = ffffffffffffffff
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 000000007554e400
!	%l0 = 7554e400, %l1 = ffffb772, Mem[0000000010001408] = b8e4ff3e 79c60000
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 7554e400 ffffb772
!	Mem[0000000010141418] = 8d86c8b7, %l7 = 0000000015ff00ff, %asi = 80
	swapa	[%i5+0x018]%asi,%l7	! %l7 = 000000008d86c8b7
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = abdc5168, %f10 = ca8eb902
	lda	[%i5+%g0]0x89,%f10	! %f10 = abdc5168

p0_label_31:
!	Mem[00000000201c0000] = ffff91b2, %l0 = 000000007554e400
	ldsba	[%o0+0x001]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = ffa76e5d, %f3  = c0b09daa
	lda	[%i3+%g0]0x80,%f3 	! %f3 = ffa76e5d
!	Mem[0000000010141408] = 86a200a2 52633e01, %l2 = 7af37f46, %l3 = ff0473c7
	ldda	[%i5+0x008]%asi,%l2	! %l2 = 0000000086a200a2 0000000052633e01
!	Mem[000000001018141c] = ffffff86, %l6 = 000000000000918c
	ldsba	[%i6+0x01c]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101400] = eb44c18d, %l7 = 000000008d86c8b7
	ldsha	[%i4+%g0]0x88,%l7	! %l7 = ffffffffffffc18d
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010101400] = 8dc144eb ff0473c7 8b2a3086 00e256f3
!	Mem[0000000010101410] = 00795c11 5683e4b8 5d5bcd17 eb8d334e
!	Mem[0000000010101420] = 71eb081e 891c9711 818ee1d5 56dd49ba
!	Mem[0000000010101430] = 6318f4d7 afadffea 7af37f46 ff0473c7
	ldda	[%i4]ASI_BLK_PL,%f16	! Block Load from 0000000010101400
!	Mem[0000000010041400] = 467ff37a, %l6 = ffffffffffffffff
	lduha	[%i1+%g0]0x88,%l6	! %l6 = 000000000000f37a
!	Mem[00000000100c140c] = 02b98eca, %f1  = 6f90bd45
	ld	[%i3+0x00c],%f1 	! %f1 = 02b98eca
!	Mem[0000000010101410] = 115c7900, %l5 = ffffffffffffff86
	ldsha	[%i4+%o5]0x88,%l5	! %l5 = 0000000000007900
!	Starting 10 instruction Store Burst
!	%f6  = 74a76e5d 81f67883, Mem[0000000030001400] = e22e6abb 568d1999
	stda	%f6 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 74a76e5d 81f67883

p0_label_32:
!	%l5 = 0000000000007900, Mem[0000000030041408] = 15ff00ff
	stwa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 00007900
!	%l3 = 0000000052633e01, Mem[0000000030041400] = 00000000
	stba	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 01000000
!	Mem[0000000030001408] = 233725a7, %l0 = ffffffffffffffff
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 00000000233725a7
!	%l6 = 000000000000f37a, Mem[00000000100c1400] = ffa76e5d
	stwa	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000f37a
!	Mem[0000000010041410] = 467f7efa, %l1 = ffffffffffffb772
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000467f7efa
!	%l1 = 00000000467f7efa, Mem[000000001000140c] = 72b7ffff, %asi = 80
	stwa	%l1,[%i0+0x00c]%asi	! Mem[000000001000140c] = 467f7efa
!	%f7  = 81f67883, Mem[0000000010141400] = 9a0231dc
	sta	%f7 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 81f67883
!	Mem[00000000100c1410] = eb776091, %l7 = ffffffffffffc18d
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 00000000eb776091
!	%l5 = 0000000000007900, Mem[000000001008142c] = 7605d030
	sth	%l5,[%i2+0x02c]		! Mem[000000001008142c] = 7900d030
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffa30000, %l4 = 998681cb467ff37a
	ldswa	[%i1+%o4]0x80,%l4	! %l4 = ffffffffffa30000

p0_label_33:
!	Mem[0000000010181400] = 7d000000, %f3  = ffa76e5d
	lda	[%i6+%g0]0x80,%f3 	! %f3 = 7d000000
!	Mem[0000000010101400] = 8dc144eb, %l5 = 0000000000007900
	lduwa	[%i4+%g0]0x80,%l5	! %l5 = 000000008dc144eb
!	Mem[00000000100c1400] = 0000f37a, %l3 = 0000000052633e01
	ldsha	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = ffffffff f8e4dd65, %l6 = 0000f37a, %l7 = eb776091
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffffffff 00000000f8e4dd65
!	Mem[0000000010081408] = 0000a3f9 e653fb92, %l2 = 86a200a2, %l3 = 00000000
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 000000000000a3f9 00000000e653fb92
!	Mem[0000000030141410] = 000082a9 f900000e, %l6 = ffffffff, %l7 = f8e4dd65
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 00000000000082a9 00000000f900000e
!	Mem[0000000010081408] = 0000a3f9, %l7 = 00000000f900000e
	ldsba	[%i2+0x009]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 00007900, %l4 = ffffffffffa30000
	ldswa	[%i1+%o4]0x89,%l4	! %l4 = 0000000000007900
!	%l5 = 000000008dc144eb, Mem[0000000030101408] = 000000ff
	stha	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 000044eb
!	Starting 10 instruction Store Burst
!	Mem[0000000010181424] = 0167650f, %l2 = 000000000000a3f9
	ldstuba	[%i6+0x024]%asi,%l2	! %l2 = 00000001000000ff

p0_label_34:
	membar	#Sync			! Added by membar checker (7)
!	%l6 = 000082a9, %l7 = 00000000, Mem[0000000010101400] = eb44c18d c77304ff
	stda	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 000082a9 00000000
!	%l4 = 00007900, %l5 = 8dc144eb, Mem[0000000030001410] = 0000a3ff 000082a9
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 00007900 8dc144eb
!	%l3 = 00000000e653fb92, Mem[0000000010081408] = 0000a3f9
	stha	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = fb92a3f9
!	%f23 = 17cd5b5d, Mem[000000001010141c] = eb8d334e
	sta	%f23,[%i4+0x01c]%asi	! Mem[000000001010141c] = 17cd5b5d
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 00000000233725a7
	setx	0x096722a78853896e,%g7,%l0 ! %l0 = 096722a78853896e
!	%l1 = 00000000467f7efa
	setx	0xe93b194fa32c2228,%g7,%l1 ! %l1 = e93b194fa32c2228
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 096722a78853896e
	setx	0xb4e66c0869bd380d,%g7,%l0 ! %l0 = b4e66c0869bd380d
!	%l1 = e93b194fa32c2228
	setx	0xb6d138cfbb8efc3c,%g7,%l1 ! %l1 = b6d138cfbb8efc3c
!	%f14 = d18db23e 2cde44c1, %l5 = 000000008dc144eb
!	Mem[0000000010001420] = 5763227566ebe667
	add	%i0,0x020,%g1
	stda	%f14,[%g1+%l5]ASI_PST16_P ! Mem[0000000010001420] = d18d22752cde44c1
!	Mem[0000000010001400] = ec920074, %l6 = 00000000000082a9
	swapa	[%i0+%g0]0x80,%l6	! %l6 = 00000000ec920074
!	Mem[00000000300c1410] = 8a3ad11f 000025a2, %l2 = 00000001, %l3 = e653fb92
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 00000000000025a2 000000008a3ad11f
!	Mem[0000000010101406] = 00000000, %l3 = 000000008a3ad11f
	ldstub	[%i4+0x006],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 8378f681, %l1 = b6d138cfbb8efc3c
	ldsha	[%i5+%g0]0x88,%l1	! %l1 = fffffffffffff681

p0_label_35:
!	Mem[0000000010181400] = 7d0000000000006b, %l0 = b4e66c0869bd380d
	ldxa	[%i6+%g0]0x80,%l0	! %l0 = 7d0000000000006b
!	Mem[0000000030141410] = 0e0000f9a9820000, %f14 = d18db23e 2cde44c1
	ldda	[%i5+%o5]0x89,%f14	! %f14 = 0e0000f9 a9820000
!	Mem[0000000030001410] = 00007900, %l5 = 000000008dc144eb
	lduba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 7d000000 0000006b, %l4 = 00007900, %l5 = 00000000
	ldda	[%i6+0x000]%asi,%l4	! %l4 = 000000007d000000 000000000000006b
!	Mem[0000000010041400] = 467ff37a, %f31 = 467ff37a
	lda	[%i1+%g0]0x88,%f31	! %f31 = 467ff37a
!	Mem[0000000030141400] = abdc5168, %l6 = 00000000ec920074
	ldswa	[%i5+%g0]0x89,%l6	! %l6 = ffffffffabdc5168
!	Mem[0000000010001410] = b5c694ff, %l7 = 0000000000000000
	ldswa	[%i0+%o5]0x88,%l7	! %l7 = ffffffffb5c694ff
!	Mem[00000000300c1400] = aefa5aff, %l7 = ffffffffb5c694ff
	lduha	[%i3+%g0]0x89,%l7	! %l7 = 0000000000005aff
!	Mem[0000000030081410] = 5d6ea774656d647d, %f0  = ff000000 02b98eca
	ldda	[%i2+%o5]0x81,%f0 	! %f0  = 5d6ea774 656d647d
!	Starting 10 instruction Store Burst
!	%l4 = 000000007d000000, Mem[0000000021800140] = b5b364c9, %asi = 80
	stha	%l4,[%o3+0x140]%asi	! Mem[0000000021800140] = 000064c9

p0_label_36:
!	Mem[0000000030141400] = abdc5168, %l3 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 00000068000000ff
!	%f14 = 0e0000f9, Mem[000000001010142c] = 56dd49ba
	sta	%f14,[%i4+0x02c]%asi	! Mem[000000001010142c] = 0e0000f9
!	Mem[0000000010101408] = 8b2a3086, %l3 = 0000000000000068
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 0000008b000000ff
!	%l4 = 000000007d000000, Mem[0000000010041410] = ffffb772
	stha	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000b772
!	Mem[0000000010181400] = 7d000000, %l1 = fffffffffffff681
	ldstuba	[%i6+%g0]0x80,%l1	! %l1 = 0000007d000000ff
!	%f10 = abdc5168, Mem[0000000010041424] = 3d1c1b10
	st	%f10,[%i1+0x024]	! Mem[0000000010041424] = abdc5168
!	%f18 = f356e200 86302a8b, Mem[0000000030141408] = cf7458b4 7af37f46
	stda	%f18,[%i5+%o4]0x81	! Mem[0000000030141408] = f356e200 86302a8b
!	%f0  = 5d6ea774 656d647d c4224cff 7d000000
!	%f4  = 5294907c cf7458b4 74a76e5d 81f67883
!	%f8  = 5af94f01 8dc144eb abdc5168 7554c239
!	%f12 = c9ec9cde 06097efa 0e0000f9 a9820000
	stda	%f0,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%l4 = 000000007d000000, Mem[0000000030081410] = 74a76e5d
	stha	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 74a70000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff5afaae, %l4 = 000000007d000000
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 00000000ff5afaae

p0_label_37:
!	Mem[0000000030081410] = 0000a774656d647d, %f26 = ba49dd56 d5e18e81
	ldda	[%i2+%o5]0x81,%f26	! %f26 = 0000a774 656d647d
!	Mem[0000000010001410] = ff94c6b50efd2b21, %l6 = ffffffffabdc5168
	ldxa	[%i0+%o5]0x80,%l6	! %l6 = ff94c6b50efd2b21
!	Mem[0000000010001400] = 000082a9, %l4 = 00000000ff5afaae
	ldsba	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030101408] = 0000007dff4c22c4, %f24 = 11971c89 1e08eb71
	ldda	[%i4+%o4]0x89,%f24	! %f24 = 0000007d ff4c22c4
!	Mem[0000000030181408] = 92ec2c1d, %l3 = 000000000000008b
	ldswa	[%i6+%o4]0x81,%l3	! %l3 = ffffffff92ec2c1d
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 7d0000000000006b
	setx	0xdc85cd2859c1bca4,%g7,%l0 ! %l0 = dc85cd2859c1bca4
!	%l1 = 000000000000007d
	setx	0x2ecdbbeffe0e5e5f,%g7,%l1 ! %l1 = 2ecdbbeffe0e5e5f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dc85cd2859c1bca4
	setx	0x3d5308e7fe61c2fc,%g7,%l0 ! %l0 = 3d5308e7fe61c2fc
!	%l1 = 2ecdbbeffe0e5e5f
	setx	0x4ccac15877ed3431,%g7,%l1 ! %l1 = 4ccac15877ed3431
!	Mem[0000000010141400] = 81f67883 703c34d5 86a200a2 52633e01
!	Mem[0000000010141410] = 000082a9 000000e4 15ff00ff 473166a8
!	Mem[0000000010141420] = 92e7e929 74a76e5d 93876ada c03fd44e
!	Mem[0000000010141430] = 00000000 000000e4 ff3ef032 25697236
	ldda	[%i5]ASI_BLK_AIUP,%f0	! Block Load from 0000000010141400
!	Mem[0000000010141410] = e4000000a9820000, %l2 = 00000000000025a2
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = e4000000a9820000
!	Mem[0000000010101408] = ff2a3086, %l0 = 3d5308e7fe61c2fc
	lduwa	[%i4+%o4]0x80,%l0	! %l0 = 00000000ff2a3086
!	Starting 10 instruction Store Burst
!	%f24 = 0000007d ff4c22c4, Mem[0000000030141410] = a9820000 0e0000f9
	stda	%f24,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000007d ff4c22c4

p0_label_38:
	membar	#Sync			! Added by membar checker (9)
!	%f18 = f356e200, Mem[0000000010141408] = 86a200a2
	sta	%f18,[%i5+%o4]0x80	! Mem[0000000010141408] = f356e200
!	Mem[0000000030081410] = 0000a774, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l6 = 0efd2b21, %l7 = 00005aff, Mem[0000000010081400] = eba499a6 9463577c
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 0efd2b21 00005aff
!	%l1 = 4ccac15877ed3431, Mem[0000000010001400] = 000082a96063db4a
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 4ccac15877ed3431
!	%l4 = 00000000, %l5 = 0000006b, Mem[0000000030001400] = 8378f681 5d6ea774
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 0000006b
!	Mem[0000000010141410] = a9820000, %l3 = ffffffff92ec2c1d
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001422] = d18d2275, %l5 = 000000000000006b
	ldstuba	[%i0+0x022]%asi,%l5	! %l5 = 00000022000000ff
!	Mem[0000000010141410] = a98200ff, %l4 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000010001410] = b5c694ff
	stba	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = b5c694ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = fb92a3f9 e653fb92, %l0 = ff2a3086, %l1 = 77ed3431
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000fb92a3f9 00000000e653fb92

p0_label_39:
!	Mem[0000000030081410] = 74a700ff, %l6 = ff94c6b50efd2b21
	lduba	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800000] = 006ba29f, %l6 = 00000000000000ff
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = 000000000000006b
!	Mem[00000000300c1408] = e400918c, %l6 = 000000000000006b
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 000000000000918c
!	Mem[0000000030141410] = c4224cff, %l6 = 000000000000918c
	lduba	[%i5+%o5]0x81,%l6	! %l6 = 00000000000000c4
!	Mem[0000000010081400] = 212bfd0e, %l0 = 00000000fb92a3f9
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 000000000000212b
!	Mem[0000000030181400] = 663ee3f0, %l7 = 0000000000005aff
	lduwa	[%i6+%g0]0x81,%l7	! %l7 = 00000000663ee3f0
!	Mem[0000000020800040] = de2464b8, %l1 = 00000000e653fb92
	lduha	[%o1+0x040]%asi,%l1	! %l1 = 000000000000de24
!	Mem[0000000030181400] = f0e33e66, %l0 = 000000000000212b
	ldsba	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000066
!	Mem[0000000030181400] = 7b23c5abf0e33e66, %l5 = 0000000000000022
	ldxa	[%i6+%g0]0x89,%l5	! %l5 = 7b23c5abf0e33e66
!	Starting 10 instruction Store Burst
!	%l5 = 7b23c5abf0e33e66, Mem[0000000010141400] = 8378f681
	stha	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 83783e66

p0_label_40:
!	%l0 = 0000000000000066, Mem[0000000030081408] = ffffffffffffffff
	stxa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000066
!	%l4 = 000000ff, %l5 = f0e33e66, Mem[00000000100c1400] = 0000f37a 0000a3ff
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff f0e33e66
!	%f6  = 15ff00ff 473166a8, Mem[0000000030041400] = 00000001 622a9f58
	stda	%f6 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 15ff00ff 473166a8
!	Mem[0000000010001408] = 00e45475, %l6 = 00000000000000c4
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%f23 = 17cd5b5d, Mem[0000000030141400] = ff51dcab
	sta	%f23,[%i5+%g0]0x81	! Mem[0000000030141400] = 17cd5b5d
!	%l7 = 00000000663ee3f0, Mem[0000000030081408] = 00000000
	stwa	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 663ee3f0
!	%f20 = b8e48356 115c7900, Mem[0000000010041408] = 0000a3ff 000082a9
	stda	%f20,[%i1+%o4]0x88	! Mem[0000000010041408] = b8e48356 115c7900
!	%f22 = 4e338deb, Mem[0000000010041410] = 0000b772
	sta	%f22,[%i1+%o5]0x80	! Mem[0000000010041410] = 4e338deb
!	Mem[00000000100c1410] = ffffc18d, %l2 = e4000000a9820000
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 5294907c, %l4 = 00000000000000ff
	ldswa	[%i4+%o5]0x81,%l4	! %l4 = 000000005294907c

p0_label_41:
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000030001400] = 00000000 0000006b ffffffff f8e4dd65
!	Mem[0000000030001410] = 00790000 eb44c18d 87e15b2e 2478cb45
!	Mem[0000000030001420] = 0b8dd523 d3cdb77e 567aace1 901fd999
!	Mem[0000000030001430] = 847675dd 0bf12677 29d7805c e14bab79
	ldda	[%i0]ASI_BLK_SL,%f16	! Block Load from 0000000030001400
!	Mem[0000000030041410] = f6d5cbf76bbc15ff, %l5 = 7b23c5abf0e33e66
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = f6d5cbf76bbc15ff
!	Mem[00000000100c1434] = f0c08745, %l2 = 00000000000000ff
	ldsh	[%i3+0x034],%l2		! %l2 = fffffffffffff0c0
!	Mem[0000000010081400] = 0efd2b21, %l4 = 000000005294907c
	ldsba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000021
!	Mem[00000000211c0000] = 29ffd30e, %l2 = fffffffffffff0c0
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041400] = a8663147, %l3 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 00000000a8663147
!	%l1 = 000000000000de24, Mem[0000000010041408] = 115c7900
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 115cde24
!	Mem[0000000010101410] = 115c7900, %l3 = 00000000a8663147
	ldsba	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001428] = c4224cffc0b09daa, %l5 = f6d5cbf76bbc15ff
	ldxa	[%i0+0x028]%asi,%l5	! %l5 = c4224cffc0b09daa
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (11)
!	%f11 = c03fd44e, Mem[0000000030001410] = 00790000
	sta	%f11,[%i0+%o5]0x81	! Mem[0000000030001410] = c03fd44e

p0_label_42:
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 0000000000000066
	setx	0xaa5a997066a2a834,%g7,%l0 ! %l0 = aa5a997066a2a834
!	%l1 = 000000000000de24
	setx	0x43aa146863ebe1a8,%g7,%l1 ! %l1 = 43aa146863ebe1a8
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = aa5a997066a2a834
	setx	0x53a18a085982d538,%g7,%l0 ! %l0 = 53a18a085982d538
!	%l1 = 43aa146863ebe1a8
	setx	0x6a9e3518663029e9,%g7,%l1 ! %l1 = 6a9e3518663029e9
!	%f18 = 65dde4f8 ffffffff, %l7 = 00000000663ee3f0
!	Mem[0000000010081420] = ff0000003d24279c
	add	%i2,0x020,%g1
	stda	%f18,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010081420] = ff0000003d24279c
!	%f30 = 79ab4be1 5c80d729, Mem[0000000010101418] = 5d5bcd17 17cd5b5d
	std	%f30,[%i4+0x018]	! Mem[0000000010101418] = 79ab4be1 5c80d729
!	%l7 = 00000000663ee3f0, Mem[0000000030081408] = 66000000f0e33e66
	stxa	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000663ee3f0
!	%f16 = 6b000000 00000000 65dde4f8 ffffffff
!	%f20 = 8dc144eb 00007900 45cb7824 2e5be187
!	%f24 = 7eb7cdd3 23d58d0b 99d91f90 e1ac7a56
!	%f28 = 7726f10b dd757684 79ab4be1 5c80d729
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%f6  = 15ff00ff, Mem[0000000010181404] = 0000006b
	sta	%f6 ,[%i6+0x004]%asi	! Mem[0000000010181404] = 15ff00ff
!	%l1 = 6a9e3518663029e9, Mem[0000000010041410] = 088da15eeb8d334e
	stxa	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 6a9e3518663029e9
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010101400] = a9820000, %l7 = 00000000663ee3f0
	ldstuba	[%i4+%g0]0x80,%l7	! %l7 = 000000a9000000ff
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010141418] = 15ff00ff 473166a8
	std	%l2,[%i5+0x018]		! Mem[0000000010141418] = ffffffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff4c22c4, %l3 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l3	! %l3 = ffffffffffffffc4

p0_label_43:
!	Mem[0000000010141418] = ffffffff, %l6 = 0000000000000000
	ldsha	[%i5+0x018]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081438] = 99de5fd1 3bffd309, %l4 = 00000021, %l5 = c0b09daa
	ldda	[%i2+0x038]%asi,%l4	! %l4 = 0000000099de5fd1 000000003bffd309
!	Mem[0000000010041400] = 998681cb467ff37a, %l0 = 53a18a085982d538
	ldxa	[%i1+%g0]0x88,%l0	! %l0 = 998681cb467ff37a
!	Mem[0000000030081408] = 663ee3f0, %l5 = 000000003bffd309
	lduwa	[%i2+%o4]0x89,%l5	! %l5 = 00000000663ee3f0
!	Mem[0000000030101410] = eb44c18d, %l1 = 6a9e3518663029e9
	ldswa	[%i4+%o5]0x89,%l1	! %l1 = ffffffffeb44c18d
!	Mem[00000000300c1400] = ff5afaae, %l2 = ffffffffffffffff
	ldswa	[%i3+%g0]0x81,%l2	! %l2 = ffffffffff5afaae
!	Mem[0000000030041400] = a8663147 ff00ff15 00790000 d63a075a
!	Mem[0000000030041410] = ff15bc6b f7cbd5f6 1f2a2090 2003b023
!	Mem[0000000030041420] = 6f932c63 cb162d87 ca0edd9d 9a0231dc
!	Mem[0000000030041430] = 9e78b45c 2ab09a2e 65d22255 eb4e74ee
	ldda	[%i1]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030041400
!	Mem[0000000010141408] = 00e256f3, %l2 = ffffffffff5afaae
	ldsha	[%i5+%o4]0x88,%l2	! %l2 = 00000000000056f3
!	Mem[0000000030041400] = 473166a8, %l0 = 998681cb467ff37a
	ldsba	[%i1+%g0]0x89,%l0	! %l0 = ffffffffffffffa8
!	Starting 10 instruction Store Burst
!	%f22 = 45cb7824, Mem[0000000010081400] = 0efd2b21
	sta	%f22,[%i2+%g0]0x88	! Mem[0000000010081400] = 45cb7824

p0_label_44:
!	%l3 = ffffffffffffffc4, Mem[0000000010101426] = 891c9711, %asi = 80
	stba	%l3,[%i4+0x026]%asi	! Mem[0000000010101424] = 891cc411
!	%f22 = 45cb7824 2e5be187, Mem[0000000030101400] = 0000006b 00000000
	stda	%f22,[%i4+%g0]0x89	! Mem[0000000030101400] = 45cb7824 2e5be187
!	%f20 = 8dc144eb 00007900, Mem[00000000100c1410] = ffffc18d 000025a2
	stda	%f20,[%i3+%o5]0x80	! Mem[00000000100c1410] = 8dc144eb 00007900
!	Mem[000000001014142e] = c03fd44e, %l1 = ffffffffeb44c18d
	ldstuba	[%i5+0x02e]%asi,%l1	! %l1 = 000000d4000000ff
!	Mem[00000000300c1408] = e400918c, %l7 = 00000000000000a9
	swapa	[%i3+%o4]0x89,%l7	! %l7 = 00000000e400918c
!	%f16 = 6b000000, Mem[0000000010001408] = ffe45475
	st	%f16,[%i0+%o4]		! Mem[0000000010001408] = 6b000000
	membar	#Sync			! Added by membar checker (13)
!	%l4 = 0000000099de5fd1, Mem[0000000030041408] = 00007900
	stwa	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 99de5fd1
!	%l5 = 00000000663ee3f0, Mem[0000000020800040] = de2464b8, %asi = 80
	stba	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = f02464b8
!	%l0 = ffffffffffffffa8, Mem[000000001014142c] = c03fff4e, %asi = 80
	stha	%l0,[%i5+0x02c]%asi	! Mem[000000001014142c] = ffa8ff4e
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 1d2cec92, %l3 = ffffffffffffffc4
	lduba	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000092

p0_label_45:
!	Mem[0000000030181410] = 77ebffff, %f0  = 15ff00ff
	lda	[%i6+%o5]0x89,%f0 	! %f0 = 77ebffff
!	Mem[0000000010041400] = 998681cb467ff37a, %f2  = 5a073ad6 00007900
	ldda	[%i1+%g0]0x88,%f2 	! %f2  = 998681cb 467ff37a
!	Mem[0000000030181408] = 92ec2c1d, %l2 = 00000000000056f3
	ldsha	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffff92ec
!	%l1 = 00000000000000d4, Mem[0000000010041408] = 24de5c11
	stba	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = d4de5c11
!	Mem[0000000030141400] = 17cd5b5d, %l5 = 00000000663ee3f0
	lduba	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000017
!	Mem[0000000010101410] = 00795c11, %l3 = 0000000000000092
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000079
!	Mem[0000000030181410] = 77ebffff, %l0 = ffffffffffffffa8
	ldsha	[%i6+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141410] = a98200ff, %l1 = 00000000000000d4
	lduba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1424] = 0e02cdf6, %f24 = 7eb7cdd3
	lda	[%i3+0x024]%asi,%f24	! %f24 = 0e02cdf6
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffff92ec, Mem[0000000030041408] = d15fde99d63a075a
	stxa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffffffff92ec

p0_label_46:
!	Mem[0000000030101410] = 8dc144eb, %l5 = 0000000000000017
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 000000008dc144eb
!	%l2 = ffffffffffff92ec, Mem[0000000030001408] = ffffffff
	stha	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 92ecffff
!	%l7 = 00000000e400918c, Mem[00000000201c0000] = ffff91b2
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 918c91b2
!	%f2  = 998681cb 467ff37a, Mem[0000000010041418] = 623c33ba 41c83ff7
	std	%f2 ,[%i1+0x018]	! Mem[0000000010041418] = 998681cb 467ff37a
!	%l6 = ffffffffffffffff, Mem[0000000010141408] = 00e256f3
	stba	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00e256ff
!	%f30 = 79ab4be1, Mem[0000000010101408] = 86302aff
	sta	%f30,[%i4+%o4]0x88	! Mem[0000000010101408] = 79ab4be1
!	%l5 = 000000008dc144eb, Mem[00000000300c1400] = ff5afaae
	stwa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 8dc144eb
!	%l5 = 000000008dc144eb, Mem[0000000010141408] = ff56e20052633e01
	stxa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000008dc144eb
!	%f2  = 998681cb 467ff37a, Mem[0000000010181438] = b5c69154 712cbce2
	stda	%f2 ,[%i6+0x038]%asi	! Mem[0000000010181438] = 998681cb 467ff37a
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 74a76e5d47d5caff, %f8  = 872d16cb 632c936f
	ldda	[%i2+%g0]0x89,%f8 	! %f8  = 74a76e5d 47d5caff

p0_label_47:
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010041400] = 7af37f46 cb818699 d4de5c11 5683e4b8
!	Mem[0000000010041410] = e9293066 18359e6a 998681cb 467ff37a
!	Mem[0000000010041420] = 9c01ef3b abdc5168 e641cc9f 9f18c46f
!	Mem[0000000010041430] = a4a1b84a 522a501e a5eb7bc2 83f4eee5
	ldda	[%i1]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010041400
!	Mem[00000000100c1400] = 000000ff, %l6 = ffffffffffffffff
	lduwa	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = f6d5cbf76bbc15ff, %f18 = 65dde4f8 ffffffff
	ldda	[%i1+%o5]0x89,%f18	! %f18 = f6d5cbf7 6bbc15ff
!	Mem[0000000030081400] = ffcad547 5d6ea774 f0e33e66 00000000
!	Mem[0000000030081410] = ff00a774 656d647d 0e2f9683 1669a53e
!	Mem[0000000030081420] = d16d567d 8f12e4d7 7b7d0855 6acd54af
!	Mem[0000000030081430] = 28ade205 ccc2d45b 60df3d69 fc78291a
	ldda	[%i2]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Mem[0000000030081410] = ff00a774, %l1 = 00000000000000ff
	ldswa	[%i2+%o5]0x81,%l1	! %l1 = ffffffffff00a774
!	Mem[0000000010001420] = d18dff75, %l4 = 0000000099de5fd1
	lduw	[%i0+0x020],%l4		! %l4 = 00000000d18dff75
!	Mem[0000000010101420] = 71eb081e, %l1 = ffffffffff00a774
	ldsb	[%i4+0x023],%l1		! %l1 = 000000000000001e
!	Mem[0000000010041400] = 7af37f46, %l0 = ffffffffffffffff
	lduba	[%i1+0x001]%asi,%l0	! %l0 = 00000000000000f3
!	Mem[0000000030041400] = 473166a8, %l4 = 00000000d18dff75
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = 00000000000066a8
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 87e15b2e, %l6 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 00000087000000ff

p0_label_48:
!	%f1  = 467ff37a, Mem[0000000010001414] = 0efd2b21
	sta	%f1 ,[%i0+0x014]%asi	! Mem[0000000010001414] = 467ff37a
!	%l6 = 0000000000000087, Mem[0000000030101408] = 65dde4f8ffffffff
	stxa	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000087
!	%l1 = 000000000000001e, Mem[00000000100c1430] = e4c5217af0c08745, %asi = 80
	stxa	%l1,[%i3+0x030]%asi	! Mem[00000000100c1430] = 000000000000001e
	membar	#Sync			! Added by membar checker (15)
!	%l2 = ffffffffffff92ec, Mem[0000000010041410] = e9293066
	stba	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = ec293066
!	%l6 = 0000000000000087, Mem[0000000010001414] = 467ff37a
	stw	%l6,[%i0+0x014]		! Mem[0000000010001414] = 00000087
!	%l7 = 00000000e400918c, Mem[0000000010041400] = 467ff37a
	stwa	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = e400918c
!	%l0 = 00000000000000f3, Mem[0000000030081408] = 663ee3f0
	stwa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000f3
!	Mem[0000000010141410] = ff0082a9, %l3 = 00000079, %l3 = 00000079
	add	%i5,0x10,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 00000000ff0082a9
!	Mem[0000000010001408] = 6b000000, %l1 = 000000000000001e
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 0000006b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = f3000000 00000000, %l0 = 000000f3, %l1 = 0000006b
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 00000000f3000000 0000000000000000

p0_label_49:
!	Mem[0000000030101408] = 8700000000000000, %l4 = 00000000000066a8
	ldxa	[%i4+%o4]0x89,%l4	! %l4 = 8700000000000000
!	Mem[0000000010041400] = e400918c, %l0 = 00000000f3000000
	lduwa	[%i1+%g0]0x88,%l0	! %l0 = 00000000e400918c
!	Mem[0000000010141410] = a98200ff, %f24 = d16d567d
	lda	[%i5+%o5]0x88,%f24	! %f24 = a98200ff
!	Mem[0000000030081400] = 47d5caff, %l6 = 0000000000000087
	lduba	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141400] = 83783e66, %l4 = 8700000000000000
	ldsba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000066
!	Mem[0000000010101410] = 115c7900, %l3 = 00000000ff0082a9
	lduha	[%i4+%o5]0x88,%l3	! %l3 = 0000000000007900
!	Mem[00000000201c0000] = 918c91b2, %l1 = 0000000000000000
	ldub	[%o0+0x001],%l1		! %l1 = 000000000000008c
!	Mem[000000001014140c] = 8dc144eb, %l6 = 00000000000000ff
	lduh	[%i5+0x00e],%l6		! %l6 = 00000000000044eb
!	Mem[0000000010181408] = bb862c1d, %l7 = 00000000e400918c
	lduba	[%i6+%o4]0x80,%l7	! %l7 = 00000000000000bb
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000044eb, Mem[00000000218001c0] = 74ac67f1
	sth	%l6,[%o3+0x1c0]		! Mem[00000000218001c0] = 44eb67f1

p0_label_50:
!	%l6 = 000044eb, %l7 = 000000bb, Mem[00000000300c1400] = 8dc144eb 96b2a476
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000044eb 000000bb
!	%l7 = 00000000000000bb, Mem[0000000010141410] = a98200ff
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000bb
!	%l5 = 000000008dc144eb, Mem[0000000030081408] = 000000f3
	stba	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000eb
!	%l3 = 0000000000007900, Mem[0000000010141410] = e4000000000000bb
	stxa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000007900
!	%f31 = fc78291a, Mem[0000000010001410] = ff94c6b5
	sta	%f31,[%i0+%o5]0x80	! Mem[0000000010001410] = fc78291a
!	%l0 = e400918c, %l1 = 0000008c, Mem[0000000030181410] = 77ebffff 6b000000
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = e400918c 0000008c
!	%f12 = 1e502a52 4ab8a1a4, Mem[0000000030001408] = ffffec92 65dde4f8
	stda	%f12,[%i0+%o4]0x89	! Mem[0000000030001408] = 1e502a52 4ab8a1a4
!	%l0 = e400918c, %l1 = 0000008c, Mem[0000000030001400] = 00000000 0000006b
	stda	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = e400918c 0000008c
!	%f20 = ff00a774, Mem[0000000010001410] = fc78291a
	sta	%f20,[%i0+%o5]0x80	! Mem[0000000010001410] = ff00a774
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000ff, %l6 = 00000000000044eb
	lduba	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000

p0_label_51:
!	Mem[0000000010041400] = e400918c, %f27 = 6acd54af
	lda	[%i1+%g0]0x88,%f27	! %f27 = e400918c
!	Mem[00000000300c1408] = a9000000, %l3 = 0000000000007900
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 00000000a9000000
!	Mem[0000000010081400] = 2478cb45, %f3  = 115cded4
	lda	[%i2+%g0]0x80,%f3 	! %f3 = 2478cb45
!	Mem[0000000010181410] = ff5925295ee971aa, %l4 = 0000000000000066
	ldxa	[%i6+0x010]%asi,%l4	! %l4 = ff5925295ee971aa
!	Mem[0000000030101408] = 00000000, %l4 = ff5925295ee971aa
	ldsba	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = 17cd5b5d, %l3 = 00000000a9000000
	lduha	[%i5+%g0]0x81,%l3	! %l3 = 00000000000017cd
!	Mem[0000000010041408] = d4de5c115683e4b8, %l0 = 00000000e400918c
	ldxa	[%i1+%o4]0x80,%l0	! %l0 = d4de5c115683e4b8
!	Mem[0000000030041410] = 6bbc15ff, %l2 = ffffffffffff92ec
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010041410] = 663029ec, %l0 = d4de5c115683e4b8
	ldswa	[%i1+%o5]0x88,%l0	! %l0 = 00000000663029ec
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = a9000000, %l6 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 00000000a9000000

p0_label_52:
!	%l7 = 00000000000000bb, Mem[0000000010141410] = 0000000000007900
	stxa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000000bb
!	%l5 = 000000008dc144eb, Mem[0000000010001400] = 58c1ca4c
	stwa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 8dc144eb
!	%l7 = 00000000000000bb, Mem[0000000030081408] = eb000000
	stwa	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000bb
!	%l6 = a9000000, %l7 = 000000bb, Mem[0000000010141410] = bb000000 00000000
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = a9000000 000000bb
!	%f30 = 60df3d69 fc78291a, Mem[00000000100c1400] = ff000000 663ee3f0
	stda	%f30,[%i3+%g0]0x88	! Mem[00000000100c1400] = 60df3d69 fc78291a
!	Mem[0000000010041400] = 8c9100e4, %l0 = 00000000663029ec
	swapa	[%i1+%g0]0x80,%l0	! %l0 = 000000008c9100e4
!	%f2  = b8e48356 2478cb45, Mem[0000000030081408] = 000000bb 00000000
	stda	%f2 ,[%i2+%o4]0x81	! Mem[0000000030081408] = b8e48356 2478cb45
!	Mem[0000000010181410] = 292559ff, %l7 = 00000000000000bb
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 00000000292559ff
!	Mem[0000000030001410] = 4ed43fc0, %l7 = 00000000292559ff
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 000000c0000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 918c91b2, %l7 = 00000000000000c0
	ldsh	[%o0+%g0],%l7		! %l7 = ffffffffffff918c

p0_label_53:
!	Mem[0000000010101410] = 00795c11, %l2 = 00000000000000ff
	lduba	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1418] = 6596e7f0 12f60e0b, %l6 = a9000000, %l7 = ffff918c
	ldd	[%i3+0x018],%l6		! %l6 = 000000006596e7f0 0000000012f60e0b
!	Mem[0000000010181408] = bb862c1d, %l6 = 000000006596e7f0
	ldswa	[%i6+%o4]0x80,%l6	! %l6 = ffffffffbb862c1d
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010181400] = ff000000 15ff00ff bb862c1d 8c86efc9
!	Mem[0000000010181410] = bb000000 5ee971aa 467ff37a ffffff86
!	Mem[0000000010181420] = c7b1dcb7 ff67650f 47d5ca66 91e2ce06
!	Mem[0000000010181430] = 06602e63 b8b87568 998681cb 467ff37a
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[0000000010181400] = 000000ff, %f8  = 6851dcab
	lda	[%i6+%g0]0x88,%f8 	! %f8 = 000000ff
!	Mem[0000000010181408] = 1d2c86bb, %f3  = 2478cb45
	lda	[%i6+%o4]0x88,%f3 	! %f3 = 1d2c86bb
!	Mem[0000000010141418] = ffffffff00000000, %f12 = 1e502a52 4ab8a1a4
	ldd	[%i5+0x018],%f12	! %f12 = ffffffff 00000000
!	Mem[0000000030101410] = 0079000017000000, %f10 = 6fc4189f 9fcc41e6
	ldda	[%i4+%o5]0x89,%f10	! %f10 = 00790000 17000000
!	Mem[00000000201c0000] = 918c91b2, %l6 = ffffffffbb862c1d
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000918c
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (17)
!	%l3 = 00000000000017cd, Mem[0000000010181410] = aa71e95e000000bb
	stxa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000000017cd

p0_label_54:
!	%f0  = 998681cb 467ff37a b8e48356 1d2c86bb
!	%f4  = 6a9e3518 663029e9 7af37f46 cb818699
!	%f8  = 000000ff 3bef019c 00790000 17000000
!	%f12 = ffffffff 00000000 e5eef483 c27beba5
	stda	%f0,[%i4]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	%l2 = 0000000000000000, Mem[00000000300c1400] = eb440000
	stwa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%f16 = ff000000 15ff00ff bb862c1d 8c86efc9
!	%f20 = bb000000 5ee971aa 467ff37a ffffff86
!	%f24 = c7b1dcb7 ff67650f 47d5ca66 91e2ce06
!	%f28 = 06602e63 b8b87568 998681cb 467ff37a
	stda	%f16,[%i0]ASI_BLK_AIUS	! Block Store to 0000000030001400
!	%l5 = 000000008dc144eb, %l1 = 000000000000008c, %l0 = 000000008c9100e4
	or	%l5,%l1,%l0		! %l0 = 000000008dc144ef
!	%f6  = 7af37f46 cb818699, %l5 = 000000008dc144eb
!	Mem[0000000010001420] = d18dff752cde44c1
	add	%i0,0x020,%g1
	stda	%f6,[%g1+%l5]ASI_PST8_P ! Mem[0000000010001420] = 7af37f75cbde8699
!	%f10 = 00790000 17000000, Mem[0000000010181410] = 000017cd 00000000
	stda	%f10,[%i6+%o5]0x88	! Mem[0000000010181410] = 00790000 17000000
!	Mem[00000000201c0000] = 918c91b2, %l2 = 0000000000000000
	ldub	[%o0+0x001],%l2		! %l2 = 000000000000008c
!	%l7 = 0000000012f60e0b, Mem[0000000030041410] = ff15bc6b
	stha	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 0e0bbc6b
!	%l4 = 0000000000000000, Mem[0000000030041400] = 473166a8
	stwa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010101408] = e14bab79, %f2  = b8e48356
	lda	[%i4+%o4]0x80,%f2 	! %f2 = e14bab79

p0_label_55:
!	Mem[0000000030101400] = 998681cb, %l2 = 000000000000008c
	lduba	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000099
!	Mem[0000000010101400] = ff8200000000ff00, %f16 = ff000000 15ff00ff
	ldd	[%i4+%g0],%f16		! %f16 = ff820000 0000ff00
!	Mem[0000000030081410] = 7d646d6574a700ff, %f20 = bb000000 5ee971aa
	ldda	[%i2+%o5]0x89,%f20	! %f20 = 7d646d65 74a700ff
!	Mem[0000000030041400] = 00000000, %l7 = 0000000012f60e0b
	ldsba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %l1 = 000000000000008c
	lduha	[%i3+0x00a]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[00000000300c1410] = 8a3ad11f000025a2, %l7 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l7	! %l7 = 8a3ad11f000025a2
!	Mem[0000000030001408] = c9ef868c1d2c86bb, %f6  = 7af37f46 cb818699
	ldda	[%i0+%o4]0x89,%f6 	! %f6  = c9ef868c 1d2c86bb
!	Mem[0000000010181408] = 1d2c86bb, %l4 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l4	! %l4 = ffffffffffff86bb
!	Mem[0000000030081410] = 7d646d6574a700ff, %l6 = 000000000000918c
	ldxa	[%i2+%o5]0x89,%l6	! %l6 = 7d646d6574a700ff
!	Starting 10 instruction Store Burst
!	%l7 = 8a3ad11f000025a2, Mem[0000000010181408] = c9ef868c1d2c86bb
	stxa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 8a3ad11f000025a2

p0_label_56:
!	%l6 = 74a700ff, %l7 = 000025a2, Mem[00000000300c1400] = 00000000 bb000000
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 74a700ff 000025a2
!	Mem[00000000201c0000] = 918c91b2, %l0 = 000000008dc144ef
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 00000091000000ff
!	%l0 = 00000091, %l1 = 0000ffff, Mem[0000000030141400] = 5d5bcd17 b40d0682
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000091 0000ffff
!	%l1 = 000000000000ffff, Mem[0000000010141408] = 000000008dc144eb
	stxa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000000000ffff
!	%l0 = 0000000000000091, Mem[0000000030041410] = 0e0bbc6b
	stwa	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000091
!	%l6 = 7d646d6574a700ff, Mem[0000000030141408] = 8b2a308600e256f3
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 7d646d6574a700ff
!	Mem[0000000030001408] = 1d2c86bb, %l1 = 000000000000ffff
	swapa	[%i0+%o4]0x89,%l1	! %l1 = 000000001d2c86bb
!	%f13 = 00000000, Mem[0000000030141410] = c4224cff
	sta	%f13,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%f5  = 663029e9, Mem[0000000030001408] = ffff0000
	sta	%f5 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 663029e9
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00005aff45cb7824, %f10 = 00790000 17000000
	ldda	[%i2+%g0]0x88,%f10	! %f10 = 00005aff 45cb7824

p0_label_57:
!	Mem[000000001014143c] = 25697236, %l2 = 0000000000000099
	ldsw	[%i5+0x03c],%l2		! %l2 = 0000000025697236
!	Mem[0000000010081400] = 2478cb45, %l6 = 7d646d6574a700ff
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 0000000000002478
!	Mem[0000000030181410] = 8c9100e4, %l0 = 0000000000000091
	lduha	[%i6+%o5]0x81,%l0	! %l0 = 0000000000008c91
!	Mem[0000000030141410] = 00000000, %l1 = 000000001d2c86bb
	lduha	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 115c7900, %l3 = 00000000000017cd
	lduha	[%i4+%o5]0x88,%l3	! %l3 = 0000000000007900
!	Mem[0000000010181400] = ff00ff15 000000ff, %l6 = 00002478, %l7 = 000025a2
	ldda	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff 00000000ff00ff15
!	Mem[0000000010001434] = 91e2ce06, %l3 = 0000000000007900
	ldsha	[%i0+0x034]%asi,%l3	! %l3 = ffffffffffff91e2
!	Mem[0000000010141420] = 92e7e929 74a76e5d, %l4 = ffff86bb, %l5 = 8dc144eb
	ldd	[%i5+0x020],%l4		! %l4 = 0000000092e7e929 0000000074a76e5d
!	Mem[0000000030141408] = 7d646d6574a700ff, %l3 = ffffffffffff91e2
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = 7d646d6574a700ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = fc78291a, %l4 = 0000000092e7e929
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 00000000fc78291a

p0_label_58:
!	Mem[000000001010143c] = ff0473c7, %l3 = 7d646d6574a700ff, %asi = 80
	swapa	[%i4+0x03c]%asi,%l3	! %l3 = 00000000ff0473c7
!	Mem[0000000010181420] = c7b1dcb7, %l3 = 00000000ff0473c7, %asi = 80
	swapa	[%i6+0x020]%asi,%l3	! %l3 = 00000000c7b1dcb7
!	%f19 = 8c86efc9, Mem[0000000010081408] = f9a392fb
	sta	%f19,[%i2+%o4]0x88	! Mem[0000000010081408] = 8c86efc9
!	Mem[0000000030101408] = 5683e4b8, %l4 = 00000000fc78291a
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 000000005683e4b8
!	%l7 = 00000000ff00ff15, Mem[0000000010041408] = d4de5c115683e4b8
	stxa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000ff00ff15
!	%l0 = 00008c91, %l1 = 00000000, Mem[0000000010001420] = 7af37f75 cbde8699
	stda	%l0,[%i0+0x020]%asi	! Mem[0000000010001420] = 00008c91 00000000
!	%f14 = e5eef483 c27beba5, %l3 = 00000000c7b1dcb7
!	Mem[0000000030101400] = 998681cb467ff37a
	stda	%f14,[%i4+%l3]ASI_PST32_SL ! Mem[0000000030101400] = a5eb7bc283f4eee5
!	Mem[0000000030081410] = ff00a774, %l1 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 00000000ff00a774
!	Mem[0000000030181400] = f0e33e66, %l7 = 00000000ff00ff15
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 00000066000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 1a2978fc, %l4 = 000000005683e4b8
	ldsba	[%i4+%o4]0x81,%l4	! %l4 = 000000000000001a

p0_label_59:
!	Mem[0000000010141400] = 663e7883, %l7 = 0000000000000066
	lduwa	[%i5+%g0]0x80,%l7	! %l7 = 00000000663e7883
!	Mem[0000000030001410] = aa71e95e000000bb, %f4  = 6a9e3518 663029e9
	ldda	[%i0+%o5]0x89,%f4 	! %f4  = aa71e95e 000000bb
!	Mem[0000000010081400] = 00005aff45cb7824, %l3 = 00000000c7b1dcb7
	ldxa	[%i2+%g0]0x88,%l3	! %l3 = 00005aff45cb7824
!	Mem[00000000100c1410] = 8dc144eb, %l3 = 00005aff45cb7824
	lduba	[%i3+%o5]0x80,%l3	! %l3 = 000000000000008d
!	Mem[0000000010101438] = 7af37f46, %f29 = b8b87568
	lda	[%i4+0x038]%asi,%f29	! %f29 = 7af37f46
!	Mem[0000000010141400] = 83783e66, %f1  = 467ff37a
	lda	[%i5+%g0]0x88,%f1 	! %f1 = 83783e66
!	Mem[0000000010001434] = 91e2ce06, %f29 = 7af37f46
	lda	[%i0+0x034]%asi,%f29	! %f29 = 91e2ce06
!	Mem[0000000010041408] = 00000000, %l0 = 0000000000008c91
	ldswa	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 91000000, %l1 = 00000000ff00a774
	lduba	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000091
!	Starting 10 instruction Store Burst
!	%l5 = 0000000074a76e5d, Mem[0000000010141400] = d5343c7083783e66
	stxa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000074a76e5d

p0_label_60:
!	%f16 = ff820000 0000ff00, Mem[0000000010041410] = 663029ec 6a9e3518
	stda	%f16,[%i1+%o5]0x88	! Mem[0000000010041410] = ff820000 0000ff00
!	%l3 = 000000000000008d, Mem[0000000010181410] = 17000000
	stwa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000008d
!	%f6  = c9ef868c 1d2c86bb, Mem[0000000010101428] = 818ee1d5 0e0000f9
	stda	%f6 ,[%i4+0x028]%asi	! Mem[0000000010101428] = c9ef868c 1d2c86bb
!	Mem[0000000010081400] = 45cb7824, %l4 = 000000000000001a
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 0000000045cb7824
!	%f8  = 000000ff, Mem[0000000010141408] = 00000000
	sta	%f8 ,[%i5+0x008]%asi	! Mem[0000000010141408] = 000000ff
!	Mem[0000000030101400] = a5eb7bc2, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 00000000a5eb7bc2
!	%l6 = 00000000a5eb7bc2, Mem[0000000020800040] = f02464b8
	sth	%l6,[%o1+0x040]		! Mem[0000000020800040] = 7bc264b8
!	Mem[0000000030141400] = 00000091, %l6 = 00000000a5eb7bc2
	swapa	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000091
!	Mem[0000000010041408] = 00000000, %l3 = 000000000000008d
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 29e9e792693ddf60, %f0  = 998681cb 83783e66
	ldda	[%i3+%g0]0x80,%f0 	! %f0  = 29e9e792 693ddf60

p0_label_61:
!	Mem[0000000010181410] = 8d000000, %f31 = 467ff37a
	lda	[%i6+0x010]%asi,%f31	! %f31 = 8d000000
!	Mem[0000000021800080] = 764c9c17, %l3 = 0000000000000000
	lduha	[%o3+0x080]%asi,%l3	! %l3 = 000000000000764c
!	Mem[0000000010181410] = 8d000000, %l6 = 0000000000000091
	ldsha	[%i6+%o5]0x80,%l6	! %l6 = ffffffffffff8d00
!	Mem[0000000030181410] = 8c9100e4, %l5 = 0000000074a76e5d
	lduwa	[%i6+%o5]0x81,%l5	! %l5 = 000000008c9100e4
!	Mem[0000000030081408] = 5683e4b8, %l5 = 000000008c9100e4
	ldsba	[%i2+%o4]0x89,%l5	! %l5 = ffffffffffffffb8
!	Mem[00000000100c1408] = ffffffff, %f7  = 1d2c86bb
	lda	[%i3+%o4]0x88,%f7 	! %f7 = ffffffff
!	Mem[0000000020800000] = 006ba29f, %l2 = 0000000025697236
	ldsha	[%o1+0x000]%asi,%l2	! %l2 = 000000000000006b
!	Mem[000000001010142c] = 1d2c86bb, %l3 = 000000000000764c
	lduh	[%i4+0x02c],%l3		! %l3 = 0000000000001d2c
!	Mem[00000000300c1400] = 74a700ff, %l2 = 000000000000006b
	ldswa	[%i3+%g0]0x89,%l2	! %l2 = 0000000074a700ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141417] = 000000bb, %l2 = 0000000074a700ff
	ldstuba	[%i5+0x017]%asi,%l2	! %l2 = 000000bb000000ff

p0_label_62:
!	%l2 = 00000000000000bb, Mem[00000000300c1400] = ff00a774a2250000
	stxa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000000000bb
!	Mem[0000000030181408] = 92ec2c1d, %l2 = 00000000000000bb
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 00000092000000ff
!	%l4 = 45cb7824, %l5 = ffffffb8, Mem[0000000030101410] = 18359e6a e9293066
	stda	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 45cb7824 ffffffb8
!	%f4  = aa71e95e 000000bb, Mem[0000000030141410] = 00000000 7d000000
	stda	%f4 ,[%i5+%o5]0x81	! Mem[0000000030141410] = aa71e95e 000000bb
!	%l5 = ffffffffffffffb8, Mem[0000000010101430] = 6318f4d7
	stw	%l5,[%i4+0x030]		! Mem[0000000010101430] = ffffffb8
!	Mem[00000000100c1410] = 8dc144eb, %l7 = 00000000663e7883
	swap	[%i3+%o5],%l7		! %l7 = 000000008dc144eb
!	%l6 = ffffffffffff8d00, Mem[0000000030081400] = 74a76e5d47d5caff
	stxa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffffffff8d00
!	%l2 = 0000000000000092, Mem[0000000010101410] = 00795c11
	stwa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000092
!	%l7 = 000000008dc144eb, Mem[0000000010141400] = 0000000074a76e5d
	stxa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000008dc144eb
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l4 = 0000000045cb7824
	lduwa	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000000

p0_label_63:
!	Mem[00000000300c1408] = 00000000, %l0 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 79ab4be1, %l7 = 000000008dc144eb
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 0000000079ab4be1
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 0000000000000000
	setx	0xa070e2affc57f7e3,%g7,%l0 ! %l0 = a070e2affc57f7e3
!	%l1 = 0000000000000091
	setx	0xb5ecb55fa1bb7ed1,%g7,%l1 ! %l1 = b5ecb55fa1bb7ed1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a070e2affc57f7e3
	setx	0xb7e2857fcdacdb84,%g7,%l0 ! %l0 = b7e2857fcdacdb84
!	%l1 = b5ecb55fa1bb7ed1
	setx	0x4fd990679a18569e,%g7,%l1 ! %l1 = 4fd990679a18569e
!	Mem[0000000010001410] = 8700000074a700ff, %f10 = 00005aff 45cb7824
	ldda	[%i0+%o5]0x88,%f10	! %f10 = 87000000 74a700ff
!	Mem[0000000030081400] = ffff8d00, %l6 = ffffffffffff8d00
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 000000925683e4b8, %f2  = e14bab79 1d2c86bb
	ldda	[%i4+0x010]%asi,%f2 	! %f2  = 00000092 5683e4b8
!	Mem[0000000010041408] = 000000ff, %l7 = 0000000079ab4be1
	ldsba	[%i1+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041400] = ec293066, %l5 = ffffffffffffffb8
	lduha	[%i1+%g0]0x88,%l5	! %l5 = 0000000000003066
!	Mem[0000000010181400] = 000000ff, %l6 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = ffffffff, %l7 = ffffffffffffffff
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 00000000ffffffff

p0_label_64:
!	%l7 = 00000000ffffffff, Mem[0000000010141408] = 000000ff0000ffff
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000ffffffff
!	Mem[0000000030081400] = 008dffff, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000008dffff
!	%l5 = 0000000000003066, Mem[0000000030101400] = ff000000
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000066
!	%l7 = 00000000ffffffff, Mem[0000000010001400] = 3134ed778dc144eb
	stxa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000ffffffff
!	%l4 = 0000000000000000, Mem[0000000030001408] = c9ef868ce9293066
	stxa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000000000000
!	%l6 = 00000000008dffff, Mem[0000000030041408] = ffffffff
	stha	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff
!	Mem[0000000030081408] = b8e48356, %l3 = 0000000000001d2c
	swapa	[%i2+%o4]0x81,%l3	! %l3 = 00000000b8e48356
!	%l1 = 4fd990679a18569e, Mem[00000000300c1410] = 000025a2
	stba	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000259e
!	Mem[0000000010101410] = 92000000, %l7 = 00000000ffffffff
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff00a77400000087, %f18 = bb862c1d 8c86efc9
	ldda	[%i0+%o5]0x80,%f18	! %f18 = ff00a774 00000087

p0_label_65:
!	Mem[00000000100c1400] = 92e7e929, %l2 = 0000000000000092
	lduwa	[%i3+%g0]0x88,%l2	! %l2 = 0000000092e7e929
!	Mem[00000000300c1408] = 00000000, %l6 = 00000000008dffff
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = c9ef868ce653fb92, %f0  = 29e9e792 693ddf60
	ldda	[%i2+%o4]0x80,%f0 	! %f0  = c9ef868c e653fb92
!	Mem[0000000010041410] = 00ff0000, %l5 = 0000000000003066
	lduwa	[%i1+%o5]0x80,%l5	! %l5 = 0000000000ff0000
!	Mem[0000000020800000] = 006ba29f, %l3 = 00000000b8e48356
	ldsha	[%o1+0x000]%asi,%l3	! %l3 = 000000000000006b
!	Mem[0000000030041410] = 00000091, %l3 = 000000000000006b
	lduba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = ec293066, %l2 = 0000000092e7e929
	ldsha	[%i1+%g0]0x88,%l2	! %l2 = 0000000000003066
!	Mem[0000000020800000] = 006ba29f, %l2 = 0000000000003066
	ldsha	[%o1+0x000]%asi,%l2	! %l2 = 000000000000006b
!	Mem[0000000010001400] = ffffffff 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000ffffffff 0000000000000000
!	Starting 10 instruction Store Burst
!	%f27 = 91e2ce06, Mem[0000000010101410] = ff000092
	sta	%f27,[%i4+%o5]0x80	! Mem[0000000010101410] = 91e2ce06

p0_label_66:
!	%l1 = 4fd990679a18569e, Mem[0000000030081400] = ff000000
	stha	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = ff00569e
!	Mem[0000000010081418] = 8614e7d6abfd260c, %l4 = 0000000000000000, %l0 = b7e2857fcdacdb84
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = 8614e7d6abfd260c
!	Mem[0000000030041410] = 00000091, %l5 = 0000000000ff0000
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000091
!	Mem[0000000010041410] = 00ff0000000082ff, %l4 = 0000000000000000, %l0 = 8614e7d6abfd260c
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = 00ff0000000082ff
!	%f20 = 7d646d65 74a700ff, Mem[0000000030101400] = 660000ff 83f4eee5
	stda	%f20,[%i4+%g0]0x81	! Mem[0000000030101400] = 7d646d65 74a700ff
!	%l0 = 00ff0000000082ff, Mem[00000000211c0000] = 29ffd30e
	sth	%l0,[%o2+%g0]		! Mem[00000000211c0000] = 82ffd30e
!	%l7 = 0000000000000000, Mem[0000000010181400] = ff000000
	stwa	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%f28 = 06602e63, Mem[0000000010141410] = 000000a9
	sta	%f28,[%i5+%o5]0x88	! Mem[0000000010141410] = 06602e63
!	Mem[0000000021800100] = 97f238be, %l0 = 00ff0000000082ff
	ldstuba	[%o3+0x100]%asi,%l0	! %l0 = 00000097000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 83783e66, %l1 = 4fd990679a18569e
	ldsha	[%i3+%o5]0x88,%l1	! %l1 = 0000000000003e66

p0_label_67:
!	Mem[0000000030081400] = 9e5600ff, %l5 = 0000000000000091
	ldsba	[%i2+%g0]0x81,%l5	! %l5 = ffffffffffffff9e
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010141400] = eb44c18d 00000000 00000000 ffffffff
!	Mem[0000000010141410] = 632e6006 000000ff ffffffff 00000000
!	Mem[0000000010141420] = 92e7e929 74a76e5d 93876ada ffa8ff4e
!	Mem[0000000010141430] = 00000000 000000e4 ff3ef032 25697236
	ldda	[%i5]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010141400
!	Mem[0000000030081410] = 00000000, %l6 = 00000000ffffffff
	lduwa	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141410] = 5ee971aa, %l7 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 00000000000071aa
!	Mem[0000000010041408] = ff000000, %l2 = 000000000000006b
	ldsw	[%i1+%o4],%l2		! %l2 = ffffffffff000000
!	Mem[0000000030041410] = 00ff0000, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081420] = ff0000003d24279c, %f18 = ff00a774 00000087
	ldd	[%i2+0x020],%f18	! %f18 = ff000000 3d24279c
!	Mem[0000000030181400] = 7b23c5ab f0e33eff, %l4 = 00000000, %l5 = ffffff9e
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 00000000f0e33eff 000000007b23c5ab
!	Mem[00000000300c1400] = bb00000000000000, %f20 = 7d646d65 74a700ff
	ldda	[%i3+%g0]0x89,%f20	! %f20 = bb000000 00000000
!	Starting 10 instruction Store Burst
!	%f25 = ff67650f, Mem[0000000010101400] = ff820000
	sta	%f25,[%i4+%g0]0x80	! Mem[0000000010101400] = ff67650f

p0_label_68:
!	%f26 = 47d5ca66 91e2ce06, %l3 = 0000000000000000
!	Mem[0000000030001430] = 06602e63b8b87568
	add	%i0,0x030,%g1
	stda	%f26,[%g1+%l3]ASI_PST8_S ! Mem[0000000030001430] = 06602e63b8b87568
!	Mem[000000001008140c] = e653fb92, %l3 = 0000000000000000, %asi = 80
	swapa	[%i2+0x00c]%asi,%l3	! %l3 = 00000000e653fb92
!	%l6 = 000000ff, %l7 = 000071aa, Mem[0000000030041400] = 00000000 ff00ff15
	stda	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff 000071aa
!	%l7 = 00000000000071aa, Mem[00000000201c0000] = ff8c91b2, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = aa8c91b2
!	%l0 = 00000097, %l1 = 00003e66, Mem[0000000030041410] = 00ff0000 f7cbd5f6
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000097 00003e66
!	%l2 = ff000000, %l3 = e653fb92, Mem[0000000010001418] = 3b464555 9f33e31c
	stda	%l2,[%i0+0x018]%asi	! Mem[0000000010001418] = ff000000 e653fb92
!	%f28 = 06602e63, Mem[0000000030041400] = ff000000
	sta	%f28,[%i1+%g0]0x89	! Mem[0000000030041400] = 06602e63
!	Mem[0000000021800041] = b7725fe5, %l4 = 00000000f0e33eff
	ldstub	[%o3+0x041],%l4		! %l4 = 00000072000000ff
!	Mem[0000000030001400] = ff000000, %l3 = 00000000e653fb92
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l4 = 0000000000000072
	lduha	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000

p0_label_69:
!	Mem[0000000010101408] = e14bab79, %l3 = 00000000ff000000
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000e1
!	Mem[0000000010181424] = ff67650f, %l1 = 0000000000003e66
	lduh	[%i6+0x024],%l1		! %l1 = 000000000000ff67
!	Mem[0000000010001410] = 74a700ff, %l4 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %f18 = ff000000
	lda	[%i5+%o4]0x88,%f18	! %f18 = 00000000
!	Mem[0000000021800180] = ff374b9c, %l0 = 0000000000000097
	lduha	[%o3+0x180]%asi,%l0	! %l0 = 000000000000ff37
!	Mem[0000000010181424] = ff67650f, %l1 = 000000000000ff67
	lduh	[%i6+0x024],%l1		! %l1 = 000000000000ff67
!	Mem[00000000300c1408] = 00000000, %l0 = 000000000000ff37
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l6 = 00000000000000ff
	lduha	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081400] = 0000001a, %l7 = 00000000000071aa
	ldsba	[%i2+%g0]0x88,%l7	! %l7 = 000000000000001a
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 8c86efc9, %l2 = ffffffffff000000
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 000000c9000000ff

p0_label_70:
!	%l2 = 000000c9, %l3 = 000000e1, Mem[0000000030041408] = ffffffff ec92ffff
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000c9 000000e1
!	Mem[0000000030081410] = 00000000, %l5 = 000000007b23c5ab
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = 83783e66, %l2 = 00000000000000c9
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 00000066000000ff
!	%l5 = 0000000000000000, Mem[00000000300c1400] = 00000000
	stwa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010081410] = f0e33eff, %l3 = 00000000000000e1
	swapa	[%i2+%o5]0x88,%l3	! %l3 = 00000000f0e33eff
!	Mem[0000000010081410] = e1000000, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 000000e1000000ff
!	%f28 = 06602e63, Mem[0000000010101410] = 91e2ce06
	sta	%f28,[%i4+%o5]0x80	! Mem[0000000010101410] = 06602e63
!	Mem[00000000100c1428] = 39cb3389, %l2 = 0000000000000066
	swap	[%i3+0x028],%l2		! %l2 = 0000000039cb3389
!	%f26 = 47d5ca66, Mem[0000000010041434] = 522a501e
	st	%f26,[%i1+0x034]	! Mem[0000000010041434] = 47d5ca66
!	Starting 10 instruction Load Burst
!	Mem[0000000010181428] = 47d5ca66 91e2ce06, %l4 = 000000ff, %l5 = 000000e1
	ldd	[%i6+0x028],%l4		! %l4 = 0000000047d5ca66 0000000091e2ce06

p0_label_71:
!	Mem[0000000010141418] = ffffffff, %l0 = 0000000000000000
	lduwa	[%i5+0x018]%asi,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010101410] = 632e6006, %l1 = 000000000000ff67
	ldsba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000006
!	Mem[0000000010141424] = 74a76e5d, %l5 = 0000000091e2ce06
	ldsh	[%i5+0x024],%l5		! %l5 = 00000000000074a7
!	Mem[00000000100c143c] = a69086f0, %f15 = 32f03eff
	lda	[%i3+0x03c]%asi,%f15	! %f15 = a69086f0
!	Mem[0000000030081408] = 2c1d0000, %l4 = 0000000047d5ca66
	lduba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = ffffe65c00000000, %f6  = 00000000 ffffffff
	ldda	[%i3+%o4]0x89,%f6 	! %f6  = ffffe65c 00000000
!	Mem[0000000030101408] = 1a2978fc, %l3 = 00000000f0e33eff
	lduha	[%i4+%o4]0x81,%l3	! %l3 = 0000000000001a29
!	Mem[0000000010181418] = 467ff37a, %l0 = 00000000ffffffff
	lduha	[%i6+0x01a]%asi,%l0	! %l0 = 000000000000f37a
!	Mem[00000000100c1410] = ff3e7883, %f14 = 36726925
	lda	[%i3+%o5]0x80,%f14	! %f14 = ff3e7883
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (20)
!	%l3 = 0000000000001a29, Mem[0000000010141420] = 92e7e92974a76e5d
	stx	%l3,[%i5+0x020]		! Mem[0000000010141420] = 0000000000001a29

p0_label_72:
!	%l6 = 00000000000000ff, Mem[0000000010181410] = 0000008d
	stba	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	%f6  = ffffe65c 00000000, Mem[0000000030101400] = 7d646d65 74a700ff
	stda	%f6 ,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffe65c 00000000
!	Mem[0000000020800000] = 006ba29f, %l0 = 000000000000f37a
	ldstuba	[%o1+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	%f30 = 998681cb 8d000000, %l6 = 00000000000000ff
!	Mem[0000000030001408] = 0000000000000000
	add	%i0,0x008,%g1
	stda	%f30,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030001408] = 0000008dcb818699
!	%l1 = 0000000000000006, Mem[0000000021800041] = b7ff5fe5
	stb	%l1,[%o3+0x041]		! Mem[0000000021800040] = b7065fe5
!	Mem[0000000010101420] = 71eb081e891cc411, %l1 = 0000000000000006, %l0 = 0000000000000000
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 71eb081e891cc411
!	%f1  = 8dc144eb, Mem[000000001008143c] = 3bffd309
	sta	%f1 ,[%i2+0x03c]%asi	! Mem[000000001008143c] = 8dc144eb
!	Mem[0000000010081410] = 000000ff, %l3 = 0000000000001a29
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010081404] = ff5a0000, %l3 = 00000000000000ff
	swap	[%i2+0x004],%l3		! %l3 = 00000000ff5a0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000008dc144eb, %l4 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l4	! %l4 = 000000008dc144eb

p0_label_73:
!	Mem[000000001000142c] = c0b09daa, %l1 = 0000000000000006
	ldsb	[%i0+0x02e],%l1		! %l1 = ffffffffffffff9d
!	Mem[0000000030141400] = 0000ffffa5eb7bc2, %l0 = 71eb081e891cc411
	ldxa	[%i5+%g0]0x89,%l0	! %l0 = 0000ffffa5eb7bc2
!	Mem[00000000100c1400] = 60df3d6992e7e929, %l4 = 000000008dc144eb
	ldxa	[%i3+%g0]0x88,%l4	! %l4 = 60df3d6992e7e929
!	Mem[0000000030141408] = ff00a774, %l7 = 000000000000001a
	ldswa	[%i5+%o4]0x81,%l7	! %l7 = ffffffffff00a774
!	Mem[00000000100c1410] = ff3e7883, %l1 = ffffffffffffff9d
	ldsba	[%i3+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101400] = ffffe65c, %l4 = 60df3d6992e7e929
	ldswa	[%i4+%g0]0x81,%l4	! %l4 = ffffffffffffe65c
!	Mem[00000000100c1410] = ff3e7883 00007900, %l2 = 39cb3389, %l3 = ff5a0000
	ldda	[%i3+%o5]0x80,%l2	! %l2 = 00000000ff3e7883 0000000000007900
!	Mem[00000000100c1400] = 60df3d6992e7e929, %l0 = 0000ffffa5eb7bc2
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = 60df3d6992e7e929
!	Mem[0000000030101408] = bb862c1dfc78291a, %f14 = ff3e7883 a69086f0
	ldda	[%i4+%o4]0x89,%f14	! %f14 = bb862c1d fc78291a
!	Starting 10 instruction Store Burst
!	%f26 = 47d5ca66 91e2ce06, Mem[0000000010081410] = ff000000 00000000
	stda	%f26,[%i2+%o5]0x80	! Mem[0000000010081410] = 47d5ca66 91e2ce06

p0_label_74:
!	%l7 = ffffffffff00a774, Mem[0000000010001400] = ffffffff00000000
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffffff00a774
!	%l5 = 00000000000074a7, Mem[0000000030081410] = 000000ff
	stha	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 000074a7
!	%l5 = 00000000000074a7, Mem[0000000030181410] = e400918c
	stha	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = e40074a7
!	Mem[00000000100c140f] = 02b98eca, %l1 = ffffffffffffffff
	ldstuba	[%i3+0x00f]%asi,%l1	! %l1 = 000000ca000000ff
!	%l5 = 00000000000074a7, Mem[0000000030181408] = ffec2c1d
	stha	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 74a72c1d
!	%f10 = 4effa8ff da6a8793, Mem[0000000010041410] = 00ff0000 000082ff
	stda	%f10,[%i1+%o5]0x80	! Mem[0000000010041410] = 4effa8ff da6a8793
!	%f14 = bb862c1d fc78291a, Mem[00000000300c1408] = 00000000 ffffe65c
	stda	%f14,[%i3+%o4]0x89	! Mem[00000000300c1408] = bb862c1d fc78291a
!	%l4 = ffffffffffffe65c, Mem[00000000300c1410] = 9e2500001fd13a8a
	stxa	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffffffffe65c
!	Mem[0000000010141408] = 00000000, %l7 = ffffffffff00a774
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 0000008d, %l2 = 00000000ff3e7883
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = 000000000000008d

p0_label_75:
!	Mem[0000000030101408] = 1a2978fc1d2c86bb, %l6 = 00000000000000ff
	ldxa	[%i4+%o4]0x81,%l6	! %l6 = 1a2978fc1d2c86bb
!	Mem[0000000010181408] = a22500001fd13a8a, %f28 = 06602e63 91e2ce06
	ldd	[%i6+%o4],%f28		! %f28 = a2250000 1fd13a8a
!	Mem[0000000010041400] = 663029ec, %l1 = 00000000000000ca
	ldsha	[%i1+%g0]0x80,%l1	! %l1 = 0000000000006630
!	Mem[0000000030101400] = ffffe65c00000000, %f30 = 998681cb 8d000000
	ldda	[%i4+%g0]0x81,%f30	! %f30 = ffffe65c 00000000
!	Mem[00000000100c1400] = 92e7e929, %f16 = ff820000
	lda	[%i3+%g0]0x88,%f16	! %f16 = 92e7e929
!	Mem[0000000030001408] = 998681cb 8d000000, %l2 = 0000008d, %l3 = 00007900
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 000000008d000000 00000000998681cb
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010081400] = 1a000000 000000ff ffef868c 00000000
!	Mem[0000000010081410] = 47d5ca66 91e2ce06 8614e7d6 abfd260c
!	Mem[0000000010081420] = ff000000 3d24279c 0b4978ea 7900d030
!	Mem[0000000010081430] = 63bc2318 492e4da6 99de5fd1 8dc144eb
	ldda	[%i2]ASI_BLK_AIUP,%f0	! Block Load from 0000000010081400
!	Mem[00000000211c0000] = 82ffd30e, %l6 = 1a2978fc1d2c86bb
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffff82ff
!	Mem[0000000030181400] = ff3ee3f0, %l4 = ffffffffffffe65c
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000010101408] = e14bab79
	stha	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 00ffab79

p0_label_76:
!	%l4 = 00000000000000ff, Mem[00000000300c1408] = fc78291a
	stwa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	%l3 = 00000000998681cb, Mem[0000000010041400] = 663029ec
	stba	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = cb3029ec
!	%l3 = 00000000998681cb, Mem[00000000211c0000] = 82ffd30e
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 81cbd30e
!	%l3 = 00000000998681cb, Mem[0000000030181408] = 74a72c1d
	stha	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 81cb2c1d
!	%l4 = 000000ff, %l5 = 000074a7, Mem[0000000010141410] = 632e6006 000000ff
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff 000074a7
!	Mem[000000001008143b] = 99de5fd1, %l5 = 00000000000074a7
	ldstub	[%i2+0x03b],%l5		! %l5 = 000000d1000000ff
!	%f20 = bb000000, Mem[0000000030101408] = 1a2978fc
	sta	%f20,[%i4+%o4]0x81	! Mem[0000000030101408] = bb000000
!	Mem[00000000201c0001] = aa8c91b2, %l1 = 0000000000006630
	ldstub	[%o0+0x001],%l1		! %l1 = 0000008c000000ff
!	%l6 = ffffffffffff82ff, Mem[0000000030141400] = c27beba5
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 82ffeba5
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffffffff, %l2 = 000000008d000000
	ldsha	[%i3+%o5]0x89,%l2	! %l2 = ffffffffffffffff

p0_label_77:
!	Mem[0000000030041400] = 632e6006, %l6 = ffffffffffff82ff
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = 00000000632e6006
!	Mem[0000000030001410] = bb0000005ee971aa, %f28 = a2250000 1fd13a8a
	ldda	[%i0+%o5]0x81,%f28	! %f28 = bb000000 5ee971aa
!	Mem[0000000010181418] = 467ff37a, %l7 = 0000000000000000
	ldub	[%i6+0x01b],%l7		! %l7 = 000000000000007a
!	Mem[0000000030181400] = ff3ee3f0abc5237b, %f30 = ffffe65c 00000000
	ldda	[%i6+%g0]0x81,%f30	! %f30 = ff3ee3f0 abc5237b
!	Mem[0000000030101408] = bb862c1d000000bb, %f28 = bb000000 5ee971aa
	ldda	[%i4+%o4]0x89,%f28	! %f28 = bb862c1d 000000bb
!	Mem[00000000300c1408] = bb862c1d000000ff, %f22 = 467ff37a ffffff86
	ldda	[%i3+%o4]0x89,%f22	! %f22 = bb862c1d 000000ff
!	Mem[00000000300c1410] = ffffffff, %l7 = 000000000000007a
	lduba	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = ff3e788300007900, %f30 = ff3ee3f0 abc5237b
	ldda	[%i3+%o5]0x80,%f30	! %f30 = ff3e7883 00007900
!	Mem[0000000030001400] = 92fb53e6, %l2 = ffffffffffffffff
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 00000000000053e6
!	Starting 10 instruction Store Burst
!	%f30 = ff3e7883 00007900, Mem[0000000010181400] = 00000000 15ff00ff
	stda	%f30,[%i6+0x000]%asi	! Mem[0000000010181400] = ff3e7883 00007900

p0_label_78:
!	%l7 = 00000000000000ff, Mem[0000000030041400] = 632e6006
	stha	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00ff6006
!	Mem[0000000030001408] = 0000008d, %l0 = 60df3d6992e7e929
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%f16 = 92e7e929 0000ff00, Mem[0000000030141410] = 5ee971aa bb000000
	stda	%f16,[%i5+%o5]0x89	! Mem[0000000030141410] = 92e7e929 0000ff00
!	%f22 = bb862c1d 000000ff, %l0 = 0000000000000000
!	Mem[0000000010101418] = 79ab4be15c80d729
	add	%i4,0x018,%g1
	stda	%f22,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010101418] = 79ab4be15c80d729
!	%f16 = 92e7e929, Mem[0000000010101400] = 0f6567ff
	sta	%f16,[%i4+%g0]0x88	! Mem[0000000010101400] = 92e7e929
!	Mem[0000000010001410] = ff00a774, %l5 = 00000000000000d1
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010081410] = 66cad547, %l1 = 000000000000008c
	ldstuba	[%i2+%o5]0x88,%l1	! %l1 = 00000047000000ff
!	Mem[0000000010081400] = 1a000000, %l2 = 00000000000053e6
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 000000001a000000
	membar	#Sync			! Added by membar checker (22)
!	%l1 = 0000000000000047, Mem[0000000010081408] = ffef868c
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 47ef868c
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = a77400e4, %f5  = 91e2ce06
	lda	[%i6+%o5]0x81,%f5 	! %f5 = a77400e4

p0_label_79:
!	Mem[0000000030181400] = ff3ee3f0, %l7 = 00000000000000ff
	ldswa	[%i6+%g0]0x81,%l7	! %l7 = ffffffffff3ee3f0
!	Mem[00000000300c1410] = 5ce6ffff ffffffff, %l6 = 632e6006, %l7 = ff3ee3f0
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 00000000ffffffff 000000005ce6ffff
!	Mem[00000000100c1400] = 92e7e929, %l1 = 0000000000000047
	ldswa	[%i3+%g0]0x88,%l1	! %l1 = ffffffff92e7e929
!	Mem[0000000030101400] = 5ce6ffff, %l0 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030001400] = ff00ff15 92fb53e6, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 0000000092fb53e6 00000000ff00ff15
!	Mem[0000000010001400] = ffffffff, %l6 = 00000000ffffffff
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101408] = 000000bb, %l2 = 000000001a000000
	ldsba	[%i4+%o4]0x89,%l2	! %l2 = ffffffffffffffbb
!	Mem[0000000030141408] = ff00a774, %f26 = 47d5ca66
	lda	[%i5+%o4]0x81,%f26	! %f26 = ff00a774
!	Mem[00000000100c1410] = 83783eff, %f12 = 63bc2318
	lda	[%i3+%o5]0x88,%f12	! %f12 = 83783eff
!	Starting 10 instruction Store Burst
!	%l6 = ffffffff, %l7 = 5ce6ffff, Mem[0000000010081410] = 66cad5ff 06cee291
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffff 5ce6ffff

p0_label_80:
!	Mem[0000000030181400] = f0e33eff, %l0 = 000000000000ffff
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 00000000f0e33eff
!	%l4 = 0000000092fb53e6, Mem[0000000030101400] = 5ce6ffff
	stwa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 92fb53e6
!	Mem[0000000030141408] = 74a700ff, %l0 = 00000000f0e33eff
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 0000000074a700ff
!	%l2 = ffffffbb, %l3 = 998681cb, Mem[0000000030181408] = 81cb2c1d 000000e4
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffbb 998681cb
!	%l2 = ffffffbb, %l3 = 998681cb, Mem[0000000030101408] = bb000000 1d2c86bb
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffffbb 998681cb
!	%l2 = ffffffbb, %l3 = 998681cb, Mem[0000000010041410] = ffa8ff4e 93876ada
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffbb 998681cb
!	%l2 = ffffffbb, %l3 = 998681cb, Mem[0000000010141408] = 000000ff ffffffff
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffbb 998681cb
!	%f6  = 8614e7d6 abfd260c, %l1 = ffffffff92e7e929
!	Mem[0000000010101418] = 79ab4be15c80d729
	add	%i4,0x018,%g1
	stda	%f6,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010101418] = 0c264be15c801486
!	%f0  = 1a000000 000000ff ffef868c 00000000
!	%f4  = 47d5ca66 a77400e4 8614e7d6 abfd260c
!	%f8  = ff000000 3d24279c 0b4978ea 7900d030
!	%f12 = 83783eff 492e4da6 99de5fd1 8dc144eb
	stda	%f0,[%i2]ASI_BLK_AIUS	! Block Store to 0000000030081400
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = c4224cff, %l4 = 0000000092fb53e6
	ldswa	[%i0+0x028]%asi,%l4	! %l4 = ffffffffc4224cff

p0_label_81:
!	Mem[0000000010141410] = 000000ff000074a7, %l0 = 0000000074a700ff
	ldxa	[%i5+0x010]%asi,%l0	! %l0 = 000000ff000074a7
!	Mem[00000000100c1428] = 00000066, %l0 = 000000ff000074a7
	ldswa	[%i3+0x028]%asi,%l0	! %l0 = 0000000000000066
!	Mem[0000000030141410] = 00ff0000, %l4 = ffffffffc4224cff
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 83783eff, %f21 = 00000000
	lda	[%i3+%o5]0x88,%f21	! %f21 = 83783eff
!	Mem[0000000030141400] = 82ffeba5, %l0 = 0000000000000066
	ldsha	[%i5+%g0]0x81,%l0	! %l0 = ffffffffffff82ff
!	Mem[000000001010141c] = 5c801486, %l1 = ffffffff92e7e929
	ldsha	[%i4+0x01c]%asi,%l1	! %l1 = 0000000000005c80
!	Mem[0000000010181408] = a2250000 1fd13a8a, %l4 = 00000000, %l5 = ff00ff15
	ldda	[%i6+%o4]0x80,%l4	! %l4 = 00000000a2250000 000000001fd13a8a
!	Mem[0000000030101400] = 92fb53e6, %l1 = 0000000000005c80
	lduha	[%i4+%g0]0x89,%l1	! %l1 = 00000000000053e6
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000030081408] = 8c86efff, %l6 = ffffffffffffffff
	lduha	[%i2+%o4]0x89,%l6	! %l6 = 000000000000efff
!	Starting 10 instruction Store Burst
!	%f26 = ff00a774, Mem[000000001008142c] = 7900d030
	sta	%f26,[%i2+0x02c]%asi	! Mem[000000001008142c] = ff00a774

p0_label_82:
!	Mem[0000000010081408] = 8c86ef47, %l1 = 00000000000053e6
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 00000047000000ff
!	%f6  = 8614e7d6 abfd260c, %l4 = 00000000a2250000
!	Mem[00000000300c1430] = 97daf2f72e025c1e
	add	%i3,0x030,%g1
	stda	%f6,[%g1+%l4]ASI_PST8_SL ! Mem[00000000300c1430] = 97daf2f72e025c1e
!	%f2  = ffef868c 00000000, Mem[0000000010001408] = 000000ff fa7e7f46
	stda	%f2 ,[%i0+%o4]0x88	! Mem[0000000010001408] = ffef868c 00000000
!	%f16 = 92e7e929 0000ff00 00000000 3d24279c
!	%f20 = bb000000 83783eff bb862c1d 000000ff
!	%f24 = c7b1dcb7 ff67650f ff00a774 91e2ce06
!	%f28 = bb862c1d 000000bb ff3e7883 00007900
	stda	%f16,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	Mem[0000000030101408] = ffffffbb, %l1 = 0000000000000047
	swapa	[%i4+%o4]0x81,%l1	! %l1 = 00000000ffffffbb
!	Mem[0000000030141408] = ff3ee3f0, %l5 = 000000001fd13a8a
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 00000000ff3ee3f0
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010181410] = ff000000, %l7 = 000000005ce6ffff
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010101405] = 0000ff00, %l6 = 000000000000efff
	ldstub	[%i4+0x005],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030181410] = ff3e7883, %l3 = 00000000998681cb
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 00000000ff3e7883
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ffffffff, %l3 = 00000000ff3e7883
	lduha	[%i3+%o4]0x88,%l3	! %l3 = 000000000000ffff

p0_label_83:
!	Mem[0000000010081408] = 8c86efff, %f16 = 92e7e929
	lda	[%i2+%o4]0x88,%f16	! %f16 = 8c86efff
!	Mem[0000000010081400] = ff000000e6530000, %l7 = 00000000ff000000
	ldxa	[%i2+%g0]0x88,%l7	! %l7 = ff000000e6530000
!	Mem[0000000010041400] = cb3029ec cb818699, %l4 = a2250000, %l5 = ff3ee3f0
	ldd	[%i1+%g0],%l4		! %l4 = 00000000cb3029ec 00000000cb818699
!	Mem[0000000010141410] = ff000000, %l6 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %f27 = 91e2ce06
	lda	[%i3+%o4]0x80,%f27	! %f27 = ffffffff
!	Mem[0000000010041410] = ffffffbb, %f19 = 3d24279c
	lda	[%i1+%o5]0x88,%f19	! %f19 = ffffffbb
!	Mem[0000000010081428] = 0b4978ea ff00a774, %l2 = ffffffbb, %l3 = 0000ffff
	ldd	[%i2+0x028],%l2		! %l2 = 000000000b4978ea 00000000ff00a774
!	Mem[00000000100c1410] = ff3e788300007900, %f18 = 00000000 ffffffbb
	ldda	[%i3+%o5]0x80,%f18	! %f18 = ff3e7883 00007900
!	Mem[0000000010181430] = 06602e63, %l3 = 00000000ff00a774
	lduh	[%i6+0x032],%l3		! %l3 = 0000000000002e63
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ffffffff, %l4 = 00000000cb3029ec
	swap	[%i3+%o4],%l4		! %l4 = 00000000ffffffff

p0_label_84:
!	%l3 = 0000000000002e63, Mem[0000000010081410] = 5ce6ffffffffffff
	stxa	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000002e63
!	Mem[0000000030101410] = 2478cb45, %l2 = 000000000b4978ea
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 00000024000000ff
!	Mem[0000000010001400] = ffffffff, %l4 = 00000000ffffffff
	swapa	[%i0+%g0]0x88,%l4	! %l4 = 00000000ffffffff
!	%l5 = 00000000cb818699, Mem[0000000010141400] = eb44c18d
	stba	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 9944c18d
!	%l0 = ffff82ff, %l1 = ffffffbb, Mem[0000000030041410] = 97000000 663e0000
	stda	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = ffff82ff ffffffbb
!	Mem[0000000030041408] = c9000000, %l7 = ff000000e6530000
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 00000000c9000000
!	%f4  = 47d5ca66 a77400e4, %l2 = 0000000000000024
!	Mem[0000000010081400] = 000053e6000000ff
	stda	%f4,[%i2+%l2]ASI_PST8_PL ! Mem[0000000010081400] = 000074e600ca00ff
!	%l2 = 0000000000000024, Mem[0000000010141400] = 9944c18d
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000024
!	%f23 = 000000ff, Mem[0000000030141408] = 1fd13a8a
	sta	%f23,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = e40074a766cad547, %l7 = 00000000c9000000
	ldxa	[%i2+%o5]0x89,%l7	! %l7 = e40074a766cad547

p0_label_85:
!	Mem[0000000010101410] = 632e6006, %f28 = bb862c1d
	lda	[%i4+%o5]0x88,%f28	! %f28 = 632e6006
!	Mem[00000000211c0000] = 81cbd30e, %l3 = 0000000000002e63
	ldub	[%o2+0x001],%l3		! %l3 = 00000000000000cb
!	Mem[0000000030001408] = ff00008d, %l7 = e40074a766cad547
	ldsha	[%i0+%o4]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010081410] = 632e0000, %l1 = 00000000ffffffbb
	ldsha	[%i2+%o5]0x80,%l1	! %l1 = 000000000000632e
!	Mem[0000000030101410] = 45cb78ff, %l1 = 000000000000632e
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 0000000045cb78ff
!	Mem[00000000100c1438] = e1fd3fe6a69086f0, %f28 = 632e6006 000000bb
	ldd	[%i3+0x038],%f28	! %f28 = e1fd3fe6 a69086f0
!	Mem[0000000030041408] = e6530000, %l6 = 0000000000000000
	ldswa	[%i1+%o4]0x81,%l6	! %l6 = ffffffffe6530000
!	Mem[0000000030041400] = 00ff6006, %l3 = 00000000000000cb
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 0000000000ff6006
!	Mem[0000000030181400] = 0000ff00, %l2 = 0000000000000024
	lduha	[%i6+%g0]0x89,%l2	! %l2 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 82ffeba5, %l0 = ffffffffffff82ff
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 0000000082ffeba5

p0_label_86:
!	%f10 = 0b4978ea 7900d030, Mem[0000000010141400] = 00000024 00000000
	stda	%f10,[%i5+%g0]0x80	! Mem[0000000010141400] = 0b4978ea 7900d030
!	Mem[0000000010101410] = 06602e63, %l1 = 0000000045cb78ff
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 0000000006602e63
!	%f22 = bb862c1d 000000ff, %l2 = 000000000000ff00
!	Mem[0000000010041428] = e641cc9f9f18c46f
	add	%i1,0x028,%g1
	stda	%f22,[%g1+%l2]ASI_PST32_P ! Mem[0000000010041428] = e641cc9f9f18c46f
!	%f22 = bb862c1d, Mem[0000000030101400] = 92fb53e6
	sta	%f22,[%i4+%g0]0x89	! Mem[0000000030101400] = bb862c1d
!	Mem[00000000100c1410] = ff3e7883, %l7 = ffffffffffffff00, %asi = 80
	swapa	[%i3+0x010]%asi,%l7	! %l7 = 00000000ff3e7883
!	Mem[0000000030101400] = 1d2c86bb, %l7 = 00000000ff3e7883
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 0000001d000000ff
!	%l3 = 0000000000ff6006, Mem[0000000010041404] = cb818699, %asi = 80
	stwa	%l3,[%i1+0x004]%asi	! Mem[0000000010041404] = 00ff6006
!	%l7 = 000000000000001d, Mem[00000000100c1400] = 29e9e792
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000001d
!	%l2 = 000000000000ff00, Mem[0000000010181410] = ffffe65c
	stwa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffffffff, %l3 = 0000000000ff6006
	ldswa	[%i3+%o5]0x81,%l3	! %l3 = ffffffffffffffff

p0_label_87:
!	Mem[0000000010101400] = 00ffff00 92e7e929, %l4 = ffffffff, %l5 = cb818699
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 0000000092e7e929 0000000000ffff00
!	Mem[0000000030181410] = 998681cb, %l1 = 0000000006602e63
	lduba	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000099
!	Mem[0000000030041410] = ffff82ff, %l0 = 0000000082ffeba5
	ldsha	[%i1+%o5]0x89,%l0	! %l0 = ffffffffffff82ff
!	Mem[000000001014141c] = 00000000, %l0 = ffffffffffff82ff
	ldsha	[%i5+0x01e]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = 000025a2, %f3  = 00000000
	lda	[%i6+%o4]0x88,%f3 	! %f3 = 000025a2
!	Mem[0000000010101410] = b8e48356 ff78cb45, %l6 = e6530000, %l7 = 0000001d
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 00000000ff78cb45 00000000b8e48356
!	Mem[0000000030101400] = ff2c86bb 00000000, %l4 = 92e7e929, %l5 = 00ffff00
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 00000000ff2c86bb 0000000000000000
!	Mem[0000000030081408] = 8c86efff, %l0 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000020800040] = 7bc264b8, %l6 = 00000000ff78cb45
	ldsh	[%o1+0x040],%l6		! %l6 = 0000000000007bc2
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = 00000099, Mem[00000000100c1410] = ffffff00 00007900
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff 00000099

p0_label_88:
!	Mem[00000000100c1400] = 1d000000, %l3 = ffffffffffffffff
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 000000001d000000
!	%l6 = 0000000000007bc2, Mem[0000000030041400] = 0660ff00
	stwa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00007bc2
!	Mem[0000000030041410] = ffff82ff, %l1 = 0000000000000099
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 00000000ffff82ff
!	%l2 = 000000000000ff00, Mem[0000000021800080] = 764c9c17
	stb	%l2,[%o3+0x080]		! Mem[0000000021800080] = 004c9c17
!	%l6 = 00007bc2, %l7 = b8e48356, Mem[0000000010001400] = ffffffff ff00a774
	stda	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00007bc2 b8e48356
!	Mem[0000000010181424] = ff67650f, %l0 = 000000ff, %l1 = ffff82ff
	add	%i6,0x24,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 00000000ff67650f
!	Mem[0000000030041408] = e6530000, %l0 = 00000000000000ff
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 00000000e6530000
!	%l6 = 0000000000007bc2, Mem[0000000030041410] = 00000099
	stwa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00007bc2
!	%l6 = 0000000000007bc2, Mem[0000000030101410] = ff78cb45
	stha	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 7bc2cb45
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff00008d cb818699, %l0 = e6530000, %l1 = ff67650f
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 00000000ff00008d 00000000cb818699

p0_label_89:
!	Mem[0000000030101408] = 47000000, %l4 = 00000000ff2c86bb
	ldsba	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 0000001a, %l5 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l5	! %l5 = 000000000000001a
!	Mem[0000000030081400] = ff0000000000001a, %l1 = 00000000cb818699
	ldxa	[%i2+%g0]0x89,%l1	! %l1 = ff0000000000001a
!	Mem[00000000201c0000] = aaff91b2, %l4 = 0000000000000000
	ldsh	[%o0+%g0],%l4		! %l4 = ffffffffffffaaff
!	Mem[0000000010081410] = 632e0000, %l3 = 000000001d000000
	ldsh	[%i2+%o5],%l3		! %l3 = 000000000000632e
!	Mem[0000000030081410] = e40074a7 66cad547, %l2 = 0000ff00, %l3 = 0000632e
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 0000000066cad547 00000000e40074a7
!	Mem[0000000030041400] = aa71000000007bc2, %l4 = ffffffffffffaaff
	ldxa	[%i1+%g0]0x89,%l4	! %l4 = aa71000000007bc2
!	Mem[00000000100c1400] = ffffffff 693ddf60, %l6 = 00007bc2, %l7 = b8e48356
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 00000000ffffffff 00000000693ddf60
!	Mem[00000000100c1428] = 000000666baa20a5, %f2  = ffef868c 000025a2
	ldd	[%i3+0x028],%f2 	! %f2  = 00000066 6baa20a5
!	Starting 10 instruction Store Burst
!	%f13 = 492e4da6, Mem[0000000010141410] = 000000ff
	sta	%f13,[%i5+%o5]0x80	! Mem[0000000010141410] = 492e4da6

p0_label_90:
!	%l6 = 00000000ffffffff, Mem[0000000030181400] = 00ff0000
	stwa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffff
!	%l1 = ff0000000000001a, Mem[0000000030001408] = 8d0000ff
	stba	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 8d00001a
!	%l4 = aa71000000007bc2, Mem[00000000300c1400] = 00000000
	stha	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 7bc20000
!	%f10 = 0b4978ea, Mem[00000000100c141c] = 12f60e0b
	st	%f10,[%i3+0x01c]	! Mem[00000000100c141c] = 0b4978ea
!	%l5 = 000000000000001a, Mem[0000000030001400] = ff00ff1592fb53e6
	stxa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000000000001a
!	%l2 = 0000000066cad547, Mem[0000000010081408] = 8c86efff
	stba	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 8c86ef47
!	%l6 = 00000000ffffffff, Mem[0000000010001420] = 00008c9100000000
	stx	%l6,[%i0+0x020]		! Mem[0000000010001420] = 00000000ffffffff
!	Mem[000000001018140f] = 1fd13a8a, %l5 = 000000000000001a
	ldstuba	[%i6+0x00f]%asi,%l5	! %l5 = 0000008a000000ff
!	%l1 = ff0000000000001a, Mem[0000000010001439] = 8c86efc9, %asi = 80
	stba	%l1,[%i0+0x039]%asi	! Mem[0000000010001438] = 8c1aefc9
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = a2250000 1fd13aff, %l2 = 66cad547, %l3 = e40074a7
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 00000000a2250000 000000001fd13aff

p0_label_91:
!	Mem[0000000030181400] = ffffffff, %l3 = 000000001fd13aff
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001400] = 00007bc2, %f0  = 1a000000
	lda	[%i0+%g0]0x80,%f0 	! %f0 = 00007bc2
!	Mem[0000000010141400] = 0b4978ea, %l3 = ffffffffffffffff
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 000000000000000b
!	Mem[0000000030001408] = 998681cb 8d00001a, %l2 = a2250000, %l3 = 0000000b
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 000000008d00001a 00000000998681cb
!	Mem[0000000030001410] = aa71e95e 000000bb, %l0 = ff00008d, %l1 = 0000001a
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000bb 00000000aa71e95e
!	Mem[00000000300c1410] = 5ce6ffffffffffff, %f12 = 83783eff 492e4da6
	ldda	[%i3+%o5]0x89,%f12	! %f12 = 5ce6ffff ffffffff
!	Mem[0000000010101410] = ff78cb45, %l6 = 00000000ffffffff
	ldsha	[%i4+%o5]0x88,%l6	! %l6 = ffffffffffffcb45
!	Mem[0000000010081410] = 632e000000000000, %f18 = ff3e7883 00007900
	ldda	[%i2+%o5]0x80,%f18	! %f18 = 632e0000 00000000
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000030001400] = 1a000000 00000000 1a00008d cb818699
!	Mem[0000000030001410] = bb000000 5ee971aa 467ff37a ffffff86
!	Mem[0000000030001420] = c7b1dcb7 ff67650f 47d5ca66 91e2ce06
!	Mem[0000000030001430] = 06602e63 b8b87568 998681cb 467ff37a
	ldda	[%i0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030001400
!	Starting 10 instruction Store Burst
!	Mem[0000000010081424] = 3d24279c, %l7 = 00000000693ddf60, %asi = 80
	swapa	[%i2+0x024]%asi,%l7	! %l7 = 000000003d24279c

p0_label_92:
!	%l7 = 000000003d24279c, Mem[0000000010081438] = 99de5fff8dc144eb
	stx	%l7,[%i2+0x038]		! Mem[0000000010081438] = 000000003d24279c
!	%l1 = 00000000aa71e95e, Mem[000000001018140c] = 1fd13aff, %asi = 80
	stwa	%l1,[%i6+0x00c]%asi	! Mem[000000001018140c] = aa71e95e
	membar	#Sync			! Added by membar checker (26)
!	%l6 = ffffffffffffcb45, Mem[0000000030001410] = bb000000
	stwa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffcb45
!	Mem[0000000010181400] = ff3e7883, %l6 = ffffffffffffcb45
	ldstuba	[%i6+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000020800041] = 7bc264b8, %l0 = 00000000000000bb
	ldstuba	[%o1+0x041]%asi,%l0	! %l0 = 000000c2000000ff
!	%f24 = 0f6567ff b7dcb1c7, %l4 = aa71000000007bc2
!	Mem[0000000030101420] = 000000ff3bef019c
	add	%i4,0x020,%g1
	stda	%f24,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030101420] = 0000dcb73bef019c
!	Mem[00000000100c1400] = ffffffff, %l3 = 00000000998681cb
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ffffffff
!	%l5 = 000000000000008a, Mem[0000000010181428] = 47d5ca66
	stw	%l5,[%i6+0x028]		! Mem[0000000010181428] = 0000008a
!	Mem[0000000020800040] = 7bff64b8, %l3 = 00000000ffffffff
	ldstub	[%o1+0x040],%l3		! %l3 = 0000007b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000047, %f13 = ffffffff
	lda	[%i4+%o4]0x81,%f13	! %f13 = 00000047

p0_label_93:
!	Mem[0000000010141400] = 0b4978ea, %l4 = aa71000000007bc2
	ldsba	[%i5+%g0]0x80,%l4	! %l4 = 000000000000000b
!	Mem[0000000010081400] = e6740000, %l2 = 000000008d00001a
	ldsha	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 00ffab79, %l3 = 000000000000007b
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = 83783eff, %l0 = 00000000000000c2
	ldsba	[%i6+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1410] = ff000000, %l3 = 00000000000000ff
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010141410] = 492e4da6, %l6 = 00000000000000ff
	ldswa	[%i5+0x010]%asi,%l6	! %l6 = 00000000492e4da6
!	Mem[00000000218001c0] = 44eb67f1, %l6 = 00000000492e4da6
	ldsha	[%o3+0x1c0]%asi,%l6	! %l6 = 00000000000044eb
!	Mem[00000000300c1410] = ffffffff, %l3 = 00000000ff000000
	ldsba	[%i3+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030001410] = ffffcb45, %l7 = 000000003d24279c
	lduha	[%i0+%o5]0x81,%l7	! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l0 = ffffffff, %l1 = aa71e95e, Mem[0000000030101400] = bb862cff 00000000
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff aa71e95e

p0_label_94:
!	Mem[0000000010001410] = ff00a774, %l0 = ffffffffffffffff
	swap	[%i0+%o5],%l0		! %l0 = 00000000ff00a774
!	%l4 = 0000000b, %l5 = 0000008a, Mem[00000000100c1410] = 000000ff 00000099
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000b 0000008a
!	%l0 = ff00a774, %l1 = aa71e95e, Mem[0000000010041420] = 9c01ef3b abdc5168
	std	%l0,[%i1+0x020]		! Mem[0000000010041420] = ff00a774 aa71e95e
!	%l2 = 0000000000000000, Mem[0000000010101408] = 00ffab79
	stwa	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Mem[00000000100c1425] = 0e02cdf6, %l0 = 00000000ff00a774
	ldstub	[%i3+0x025],%l0		! %l0 = 00000002000000ff
!	Mem[0000000030001410] = 45cbffff, %l3 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%l0 = 00000002, %l1 = aa71e95e, Mem[0000000030041400] = 00007bc2 aa710000
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000002 aa71e95e
!	Mem[0000000030081400] = 0000001a, %l7 = 000000000000ffff
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 000000000000001a
!	%f18 = 998681cb, Mem[0000000010141400] = 0b4978ea
	sta	%f18,[%i5+%g0]0x80	! Mem[0000000010141400] = 998681cb
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = cb3029ec 02b98eff, %l0 = 00000002, %l1 = aa71e95e
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 00000000cb3029ec 0000000002b98eff

p0_label_95:
!	Mem[0000000010141400] = cb818699, %l5 = 000000000000008a
	ldsba	[%i5+%g0]0x88,%l5	! %l5 = ffffffffffffff99
!	Mem[0000000030101400] = ffffffff, %l0 = 00000000cb3029ec
	lduba	[%i4+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[00000000211c0000] = 81cbd30e, %l7 = 000000000000001a
	lduba	[%o2+0x001]%asi,%l7	! %l7 = 00000000000000cb
!	Mem[0000000030101400] = aa71e95effffffff, %l4 = 000000000000000b
	ldxa	[%i4+%g0]0x89,%l4	! %l4 = aa71e95effffffff
!	Mem[0000000010001408] = 00000000, %l5 = ffffffffffffff99
	lduba	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = 02000000 5ee971aa, %l0 = 000000ff, %l1 = 02b98eff
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 0000000002000000 000000005ee971aa
!	Mem[0000000010001414] = 00000087, %l3 = 00000000000000ff
	ldsh	[%i0+0x014],%l3		! %l3 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %l0 = 0000000002000000
	lduba	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l7 = 00000000000000cb
	ldswa	[%i0+0x008]%asi,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f14 = 99de5fd1 8dc144eb, Mem[0000000010041400] = cb3029ec 00ff6006
	stda	%f14,[%i1+%g0]0x80	! Mem[0000000010041400] = 99de5fd1 8dc144eb

p0_label_96:
!	%f16 = 00000000 0000001a, %l2 = 0000000000000000
!	Mem[00000000100c1420] = 928800000effcdf6
	add	%i3,0x020,%g1
	stda	%f16,[%g1+%l2]ASI_PST8_PL ! Mem[00000000100c1420] = 928800000effcdf6
!	Mem[0000000010181400] = 83783eff, %l1 = 000000005ee971aa
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 0000000083783eff
!	Mem[0000000010001410] = ffffffff, %l4 = aa71e95effffffff
	ldstuba	[%i0+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%f0  = 00007bc2, Mem[0000000030001400] = 1a000000
	sta	%f0 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 00007bc2
!	%l7 = 0000000000000000, Mem[0000000010181420] = ff0473c7ff67650f
	stx	%l7,[%i6+0x020]		! Mem[0000000010181420] = 0000000000000000
!	%f14 = 99de5fd1 8dc144eb, Mem[0000000030181410] = 998681cb 000000bb
	stda	%f14,[%i6+%o5]0x81	! Mem[0000000030181410] = 99de5fd1 8dc144eb
!	%f27 = 66cad547, Mem[0000000030141400] = ffff82ff
	sta	%f27,[%i5+%g0]0x81	! Mem[0000000030141400] = 66cad547
!	Mem[00000000300c1408] = 000000ff, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181403] = aa71e95e, %l0 = 0000000000000000
	ldstuba	[%i6+0x003]%asi,%l0	! %l0 = 0000005e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 99de5fd1, %f10 = 0b4978ea
	lda	[%i6+%o5]0x81,%f10	! %f10 = 99de5fd1

p0_label_97:
!	Mem[0000000010081408] = 8c86ef47, %f9  = 3d24279c
	lda	[%i2+%o4]0x88,%f9 	! %f9 = 8c86ef47
!	Mem[0000000030101408] = 00000047998681cb, %f16 = 00000000 0000001a
	ldda	[%i4+%o4]0x81,%f16	! %f16 = 00000047 998681cb
!	Mem[0000000010081410] = 0000000000002e63, %f12 = 5ce6ffff 00000047
	ldda	[%i2+%o5]0x88,%f12	! %f12 = 00000000 00002e63
!	Mem[0000000010141408] = bbffffffcb818699, %l2 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l2	! %l2 = bbffffffcb818699
!	Mem[0000000030181400] = 92e7e929 ffffffff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 00000000ffffffff 0000000092e7e929
!	%f18 = 998681cb 8d00001a, %f22 = 86ffffff
	fdtoi	%f18,%f22		! %f22 = 00000000
!	Mem[00000000100c1420] = 928800000effcdf6, %f16 = 00000047 998681cb
	ldda	[%i3+0x020]%asi,%f16	! %f16 = 92880000 0effcdf6
!	Mem[0000000010001410] = ffffffff, %l5 = 0000000092e7e929
	ldsha	[%i0+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141430] = 00000000, %l4 = 00000000ffffffff
	ldsba	[%i5+0x031]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = bbffffffcb818699, Mem[0000000030001408] = 8d00001a
	stba	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 8d000099

p0_label_98:
!	Mem[0000000010001404] = b8e48356, %l5 = ffffffffffffffff, %asi = 80
	swapa	[%i0+0x004]%asi,%l5	! %l5 = 00000000b8e48356
!	%l6 = 00000000000044eb, Mem[0000000030181400] = ffffffff
	stwa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 000044eb
!	Mem[0000000010141410] = a64d2e49, %l0 = 000000000000005e
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 00000049000000ff
!	Mem[00000000100c1410] = 0000000b, %l3 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000030001410] = ffffcb45
	stwa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff
!	%l0 = 0000000000000049, Mem[0000000010081413] = 632e0000
	stb	%l0,[%i2+0x013]		! Mem[0000000010081410] = 632e0049
!	Mem[0000000010181400] = aa71e9ff00007900, %l4 = 0000000000000000, %l3 = 0000000000000000
	casxa	[%i6]0x80,%l4,%l3	! %l3 = aa71e9ff00007900
!	%f8  = ff000000 8c86ef47, Mem[0000000030001410] = ff000000 aa71e95e
	stda	%f8 ,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000000 8c86ef47
!	%l7 = 00000000000000ff, Mem[00000000211c0000] = 81cbd30e, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ffd30e
!	Starting 10 instruction Load Burst
!	Mem[000000001014140c] = cb818699, %f26 = 06cee291
	lda	[%i5+0x00c]%asi,%f26	! %f26 = cb818699

p0_label_99:
!	Mem[0000000010181408] = 000025a2, %l7 = 00000000000000ff
	lduwa	[%i6+%o4]0x88,%l7	! %l7 = 00000000000025a2
!	Mem[0000000010041410] = bbffffffcb818699, %f6  = 8614e7d6 abfd260c
	ldda	[%i1+%o5]0x80,%f6 	! %f6  = bbffffff cb818699
!	Mem[0000000030181408] = 9c27243d00000000, %f10 = 99de5fd1 7900d030
	ldda	[%i6+%o4]0x81,%f10	! %f10 = 9c27243d 00000000
!	Mem[0000000030101400] = ffffffff, %l7 = 00000000000025a2
	lduha	[%i4+%g0]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030081400] = 0000ffff, %l0 = 0000000000000049
	ldsba	[%i2+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = 998681cb 693ddf60, %l0 = ffffffff, %l1 = 83783eff
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 00000000998681cb 00000000693ddf60
!	Mem[0000000030041400] = 00000002, %l0 = 00000000998681cb
	ldsha	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000002
!	Mem[0000000010041400] = 99de5fd18dc144eb, %l6 = 00000000000044eb
	ldxa	[%i1+%g0]0x80,%l6	! %l6 = 99de5fd18dc144eb
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000002
	lduwa	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 8dc144eb, %l7 = 0000ffff, Mem[0000000030101408] = 47000000 cb818699
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 8dc144eb 0000ffff

p0_label_100:
!	%l6 = 8dc144eb, %l7 = 0000ffff, Mem[0000000030081410] = 66cad547 e40074a7
	stda	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 8dc144eb 0000ffff
!	Mem[00000000201c0001] = aaff91b2, %l4 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l6 = 99de5fd18dc144eb, Mem[0000000030141400] = 66cad547
	stwa	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 8dc144eb
!	%l4 = 00000000000000ff, Mem[0000000010001408] = 00000000
	stha	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00ff0000
!	%l0 = 0000000000000000, Mem[0000000010041400] = d15fde99
	stwa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Mem[0000000030081408] = ffef868c, %l2 = bbffffffcb818699
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000218000c1] = 97384263, %l6 = 99de5fd18dc144eb
	ldstuba	[%o3+0x0c1]%asi,%l6	! %l6 = 00000038000000ff
!	Mem[0000000010101438] = 7af37f46, %l2 = 00000000000000ff
	swap	[%i4+0x038],%l2		! %l2 = 000000007af37f46
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 45cbc27b, %l3 = aa71e9ff00007900
	ldswa	[%i4+%o5]0x89,%l3	! %l3 = 0000000045cbc27b

p0_label_101:
!	Mem[00000000211c0000] = 00ffd30e, %l6 = 0000000000000038
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = eb44c18dffff0000, %l0 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l0	! %l0 = eb44c18dffff0000
!	Mem[0000000010041408] = 15ff00ff 000000ff, %l4 = 000000ff, %l5 = b8e48356
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff 0000000015ff00ff
!	Mem[0000000030081410] = eb44c18d, %f15 = 8dc144eb
	lda	[%i2+%o5]0x81,%f15	! %f15 = eb44c18d
!	Mem[0000000010001400] = c27b0000, %l0 = eb44c18dffff0000
	lduwa	[%i0+%g0]0x88,%l0	! %l0 = 00000000c27b0000
!	Mem[00000000201c0000] = aaff91b2, %l7 = 000000000000ffff
	ldsh	[%o0+%g0],%l7		! %l7 = ffffffffffffaaff
!	Mem[0000000030041410] = ffffffbb 00007bc2, %l0 = c27b0000, %l1 = 693ddf60
	ldda	[%i1+%o5]0x89,%l0	! %l0 = 0000000000007bc2 00000000ffffffbb
!	Mem[0000000010001408] = 0000ff00, %l3 = 0000000045cbc27b
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = 000000ff656d647d, %l2 = 000000007af37f46
	ldxa	[%i5+%o4]0x81,%l2	! %l2 = 000000ff656d647d
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[00000000211c0000] = 00ffd30e, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffffd30e

p0_label_102:
!	%f6  = bbffffff cb818699, Mem[0000000010141410] = a64d2eff a7740000
	stda	%f6 ,[%i5+%o5]0x88	! Mem[0000000010141410] = bbffffff cb818699
!	%f22 = 00000000 7af37f46, Mem[0000000030181408] = 3d24279c 00000000
	stda	%f22,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 7af37f46
!	Mem[0000000010181410] = 00ff0000, %l2 = 000000ff656d647d
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l4 = 000000ff, %l5 = 15ff00ff, Mem[0000000010001400] = 00007bc2 ffffffff
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff 15ff00ff
!	Mem[0000000030141400] = eb44c18d, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 0000008d000000ff
!	Mem[0000000030001410] = 47ef868c, %l1 = 00000000ffffffbb
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 00000047000000ff
!	Mem[0000000010181423] = 00000000, %l5 = 0000000015ff00ff
	ldstuba	[%i6+0x023]%asi,%l5	! %l5 = 00000000000000ff
!	%f30 = 7af37f46 cb818699, %l7 = ffffffffffffaaff
!	Mem[0000000030041420] = 6f932c63cb162d87
	add	%i1,0x020,%g1
	stda	%f30,[%g1+%l7]ASI_PST16_S ! Mem[0000000030041420] = 7af37f46cb818699
!	%l5 = 0000000000000000, Mem[0000000030081410] = eb44c18d
	stwa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 998681cb, %l1 = 0000000000000047
	lduwa	[%i5+%o5]0x80,%l1	! %l1 = 00000000998681cb

p0_label_103:
!	Mem[0000000030001400] = c27b0000, %l5 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l5	! %l5 = ffffffffc27b0000
!	Mem[0000000030101400] = ffffffff, %l7 = ffffffffffffaaff
	ldsha	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1400] = bb0000000000c27b, %f16 = 92880000 0effcdf6
	ldda	[%i3+%g0]0x89,%f16	! %f16 = bb000000 0000c27b
!	Mem[0000000010081410] = 49002e63, %l7 = ffffffffffffffff
	lduba	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000063
!	Mem[0000000010181400] = aa71e9ff, %l4 = 00000000000000ff
	ldsha	[%i6+%g0]0x80,%l4	! %l4 = ffffffffffffaa71
!	Mem[00000000211c0000] = ffffd30e, %l0 = 0000000000007bc2
	ldsh	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030101408] = eb44c18d, %l6 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l6	! %l6 = ffffffffffffffeb
!	Mem[0000000010081408] = 8c86ef47, %f26 = cb818699
	lda	[%i2+%o4]0x88,%f26	! %f26 = 8c86ef47
!	Mem[0000000030041410] = c27b0000bbffffff, %f22 = 00000000 7af37f46
	ldda	[%i1+%o5]0x81,%f22	! %f22 = c27b0000 bbffffff
!	Starting 10 instruction Store Burst
!	%f6  = bbffffff, Mem[0000000030081408] = ffef868c
	sta	%f6 ,[%i2+%o4]0x81	! Mem[0000000030081408] = bbffffff

p0_label_104:
!	%f19 = 8d00001a, Mem[0000000010181410] = 0000ffff
	sta	%f19,[%i6+%o5]0x88	! Mem[0000000010181410] = 8d00001a
!	%l7 = 0000000000000063, Mem[0000000010101400] = 29e9e792
	stwa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000063
!	Mem[0000000010081400] = e6740000, %l1 = 00000000998681cb
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[000000001004140c] = ff00ff15, %l6 = ffffffffffffffeb
	swap	[%i1+0x00c],%l6		! %l6 = 00000000ff00ff15
!	Mem[0000000010181400] = aa71e9ff, %l2 = 000000000000008d
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 000000aa000000ff
!	%l1 = 0000000000000000, Mem[00000000100c1408] = cb3029ec02b98eff
	stxa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	%l6 = ff00ff15, %l7 = 00000063, Mem[0000000010001400] = 000000ff 15ff00ff
	stda	%l6,[%i0+0x000]%asi	! Mem[0000000010001400] = ff00ff15 00000063
!	Mem[0000000030041410] = 00007bc2, %l7 = 0000000000000063
	ldstuba	[%i1+%o5]0x89,%l7	! %l7 = 000000c2000000ff
!	%f6  = bbffffff cb818699, Mem[0000000010141408] = bbffffff cb818699
	stda	%f6 ,[%i5+0x008]%asi	! Mem[0000000010141408] = bbffffff cb818699
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 000064c9, %l6 = 00000000ff00ff15
	ldsb	[%o3+0x141],%l6		! %l6 = 0000000000000000

p0_label_105:
!	Mem[0000000030081410] = 00000000, %l5 = ffffffffc27b0000
	lduha	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 00007bff, %l0 = ffffffffffffffff
	ldsba	[%i1+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001400] = c27b0000, %l6 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l6	! %l6 = 00000000c27b0000
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 0000c27b, %l1 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l1	! %l1 = 000000000000c27b
!	Mem[00000000300c1408] = 00000000 1d2c86bb, %l4 = ffffaa71, %l5 = 00000000
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000 000000001d2c86bb
!	Mem[00000000100c142c] = 6baa20a5, %l1 = 000000000000c27b
	ldsha	[%i3+0x02e]%asi,%l1	! %l1 = 00000000000020a5
!	Mem[00000000100c1400] = 60df3d69cb818699, %f26 = 8c86ef47 66cad547
	ldda	[%i3+%g0]0x88,%f26	! %f26 = 60df3d69 cb818699
!	Mem[00000000300c1410] = ffffffff, %l7 = 00000000000000c2
	ldsba	[%i3+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000c27b0000, Mem[0000000030041408] = ff000000
	stwa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = c27b0000

p0_label_106:
!	%l4 = 0000000000000000, Mem[00000000100c1434] = 0000001e
	sth	%l4,[%i3+0x034]		! Mem[00000000100c1434] = 0000001e
!	Mem[0000000010181430] = 06602e63, %l6 = c27b0000, %l5 = 1d2c86bb
	add	%i6,0x30,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 0000000006602e63
!	%l3 = 0000000000000000, Mem[0000000010141410] = 998681cb, %asi = 80
	stwa	%l3,[%i5+0x010]%asi	! Mem[0000000010141410] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010101400] = 63000000
	stha	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 63000000
!	%f26 = 60df3d69 cb818699, %l2 = 00000000000000aa
!	Mem[0000000030101418] = 7af37f46cb818699
	add	%i4,0x018,%g1
	stda	%f26,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030101418] = 7af381cbcb81df60
!	Mem[0000000030041408] = c27b0000, %l3 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 00000000c27b0000
!	%l7 = ffffffffffffffff, Mem[0000000010101400] = 63000000
	stwa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffff
!	%l0 = ffffffff, %l1 = 000020a5, Mem[0000000010001408] = 00ff0000 8c86efff
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff 000020a5
!	%l2 = 00000000000000aa, Mem[0000000010101400] = ffffffff
	stwa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000aa
!	Starting 10 instruction Load Burst
!	Mem[0000000010041434] = 47d5ca66, %l0 = ffffffffffffffff
	lduha	[%i1+0x034]%asi,%l0	! %l0 = 00000000000047d5

p0_label_107:
!	Mem[0000000030181410] = 99de5fd1, %l3 = 00000000c27b0000
	lduha	[%i6+%o5]0x81,%l3	! %l3 = 00000000000099de
!	Mem[000000001000141c] = e653fb92, %l6 = 00000000c27b0000
	lduha	[%i0+0x01c]%asi,%l6	! %l6 = 000000000000e653
!	Mem[0000000010081410] = 49002e63, %l1 = 00000000000020a5
	lduha	[%i2+%o5]0x88,%l1	! %l1 = 0000000000002e63
!	Mem[0000000030181408] = 7af37f46, %l7 = ffffffffffffffff
	ldsha	[%i6+%o4]0x89,%l7	! %l7 = 0000000000007f46
!	Mem[00000000300c1400] = 7bc20000 000000bb, %l2 = 000000aa, %l3 = 000099de
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 000000007bc20000 00000000000000bb
!	Mem[0000000010081434] = 492e4da6, %l0 = 00000000000047d5
	lduw	[%i2+0x034],%l0		! %l0 = 00000000492e4da6
!	Mem[0000000030101410] = 45cbc27b, %l4 = 0000000000000000
	lduwa	[%i4+%o5]0x89,%l4	! %l4 = 0000000045cbc27b
!	Mem[0000000030101400] = ffffffff5ee971aa, %l6 = 000000000000e653
	ldxa	[%i4+%g0]0x81,%l6	! %l6 = ffffffff5ee971aa
!	Mem[0000000030181410] = d15fde99, %l4 = 0000000045cbc27b
	ldsba	[%i6+%o5]0x89,%l4	! %l4 = ffffffffffffff99
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 00000000, %l5 = 0000000006602e63
	swapa	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000

p0_label_108:
!	Mem[0000000010081408] = 47ef868c, %l6 = ffffffff5ee971aa
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 0000000047ef868c
!	%f16 = bb000000, Mem[0000000010001408] = ffffffff
	sta	%f16,[%i0+%o4]0x88	! Mem[0000000010001408] = bb000000
!	%l0 = 492e4da6, %l1 = 00002e63, Mem[0000000030041408] = 00000000 e1000000
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 492e4da6 00002e63
!	%l1 = 0000000000002e63, Mem[0000000030081400] = ff0000000000ffff
	stxa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000002e63
!	%f10 = 9c27243d 00000000, Mem[0000000010001410] = ffffffff 00000087
	stda	%f10,[%i0+%o5]0x80	! Mem[0000000010001410] = 9c27243d 00000000
!	Mem[0000000010141400] = 998681cb, %l3 = 00000000000000bb
	swapa	[%i5+%g0]0x80,%l3	! %l3 = 00000000998681cb
!	%f20 = aa71e95e 000000bb, Mem[0000000010141410] = 00000000 ffffffbb
	stda	%f20,[%i5+%o5]0x80	! Mem[0000000010141410] = aa71e95e 000000bb
!	%l2 = 000000007bc20000, Mem[00000000100c1410] = 0b0000ff
	stwa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 7bc20000
!	Mem[0000000010141433] = 00000000, %l3 = 00000000998681cb
	ldstub	[%i5+0x033],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = bb0000000000c27b, %f26 = 60df3d69 cb818699
	ldda	[%i3+%g0]0x89,%f26	! %f26 = bb000000 0000c27b

p0_label_109:
!	Mem[0000000030001410] = ffef868c, %l3 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 000000000000ffef
!	Mem[0000000010041410] = bbffffff, %l3 = 000000000000ffef
	lduba	[%i1+%o5]0x80,%l3	! %l3 = 00000000000000bb
!	Mem[0000000010041428] = e641cc9f, %l5 = 0000000000000000
	lduh	[%i1+0x02a],%l5		! %l5 = 000000000000cc9f
!	Mem[0000000010001400] = ff00ff1500000063, %f16 = bb000000 0000c27b
	ldda	[%i0+%g0]0x80,%f16	! %f16 = ff00ff15 00000063
!	Mem[00000000100c1400] = cb818699, %f2  = 00000066
	lda	[%i3+%g0]0x88,%f2 	! %f2 = cb818699
!	Mem[0000000030081410] = 00000000, %l0 = 00000000492e4da6
	lduha	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 998681cb, %l7 = 0000000000007f46
	ldsba	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffffff99
!	Mem[0000000010101408] = 06602e63, %f12 = 00000000
	lda	[%i4+%o4]0x88,%f12	! %f12 = 06602e63
!	Mem[0000000010101408] = 632e6006, %l2 = 000000007bc20000
	ldswa	[%i4+%o4]0x80,%l2	! %l2 = 00000000632e6006
!	Starting 10 instruction Store Burst
!	%f30 = 7af37f46 cb818699, Mem[0000000030001400] = c27b0000 00000000
	stda	%f30,[%i0+%g0]0x89	! Mem[0000000030001400] = 7af37f46 cb818699

p0_label_110:
!	Mem[0000000010141410] = aa71e95e, %l4 = ffffffffffffff99
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000aa71e95e
!	%l5 = 000000000000cc9f, Mem[0000000030101410] = 45cbc27b
	stba	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 45cbc29f
!	Mem[00000000201c0000] = aaff91b2, %l0 = 0000000000000000
	ldstub	[%o0+%g0],%l0		! %l0 = 000000aa000000ff
!	%l3 = 00000000000000bb, Mem[0000000030101410] = 45cbc29f
	stwa	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000bb
!	Mem[00000000100c1408] = 00000000, %l2 = 00000000632e6006
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010041408] = 000000ff
	stha	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l7 = ffffffffffffff99, Mem[0000000030141410] = 0000ff00
	stha	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ff99
!	%l3 = 00000000000000bb, Mem[00000000201c0001] = ffff91b2
	stb	%l3,[%o0+0x001]		! Mem[00000000201c0000] = ffbb91b2
!	%f14 = 99de5fd1 eb44c18d, %l1 = 0000000000002e63
!	Mem[00000000300c1428] = 7cdf71e135feb250
	add	%i3,0x028,%g1
	stda	%f14,[%g1+%l1]ASI_PST8_S ! Mem[00000000300c1428] = 7cde5fe135fec18d
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ffffffbb00007bff, %l1 = 0000000000002e63
	ldxa	[%i1+%o5]0x89,%l1	! %l1 = ffffffbb00007bff

p0_label_111:
!	Mem[0000000010181408] = a2250000, %f20 = aa71e95e
	lda	[%i6+%o4]0x80,%f20	! %f20 = a2250000
!	Mem[0000000030141400] = 0000ffffeb44c1ff, %l3 = 00000000000000bb
	ldxa	[%i5+%g0]0x89,%l3	! %l3 = 0000ffffeb44c1ff
!	Mem[0000000021800100] = fff238be, %l6 = 0000000047ef868c
	lduh	[%o3+0x100],%l6		! %l6 = 000000000000fff2
!	Mem[0000000030041410] = ff7b0000, %l6 = 000000000000fff2
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010141400] = 000000bb 7900d030 bbffffff cb818699
!	Mem[0000000010141410] = ffffff99 000000bb ffffffff 00000000
!	Mem[0000000010141420] = 00000000 00001a29 93876ada ffa8ff4e
!	Mem[0000000010141430] = 000000ff 000000e4 ff3ef032 25697236
	ldda	[%i5]ASI_BLK_AIUP,%f0	! Block Load from 0000000010141400
!	Mem[0000000010101400] = 00ffff00000000aa, %l5 = 000000000000cc9f
	ldxa	[%i4+%g0]0x88,%l5	! %l5 = 00ffff00000000aa
!	Mem[0000000030001408] = 8d000099, %l4 = 00000000aa71e95e
	ldsha	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000099
!	Mem[00000000300c1408] = 000000001d2c86bb, %f16 = ff00ff15 00000063
	ldda	[%i3+%o4]0x81,%f16	! %f16 = 00000000 1d2c86bb
!	Mem[0000000030001400] = 998681cb, %l1 = ffffffbb00007bff
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffff9986
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (28)
!	%l7 = ffffffffffffff99, Mem[0000000010141408] = bbffffff
	stba	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 99ffffff

p0_label_112:
!	%f12 = 000000ff 000000e4, %l5 = 00ffff00000000aa
!	Mem[0000000030081410] = 00000000ffff0000
	add	%i2,0x010,%g1
	stda	%f12,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030081410] = 00000000ffff0000
!	Mem[0000000030081400] = 00002e63, %l4 = 0000000000000099
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 0000000000002e63
!	%l2 = 0000000000000000, Mem[0000000030181400] = 000044eb
	stba	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 000044eb
!	%l3 = 0000ffffeb44c1ff, Mem[00000000218001c0] = 44eb67f1, %asi = 80
	stha	%l3,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = c1ff67f1
!	%l4 = 0000000000002e63, Mem[0000000030101408] = 8dc144eb
	stha	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 8dc12e63
!	%f8  = 00000000 00001a29, Mem[0000000010101408] = 632e6006 00e256f3
	stda	%f8 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 00001a29
!	Mem[0000000010101427] = 891cc411, %l5 = 00ffff00000000aa
	ldstuba	[%i4+0x027]%asi,%l5	! %l5 = 00000011000000ff
!	%l4 = 0000000000002e63, Mem[0000000030141408] = ff000000
	stha	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = ff002e63
!	Mem[0000000030041408] = a64d2e49, %l0 = 00000000000000aa
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 00000049000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = bb00000099ffffff, %f24 = 0f6567ff b7dcb1c7
	ldda	[%i5+%o5]0x88,%f24	! %f24 = bb000000 99ffffff

p0_label_113:
!	Mem[0000000010141434] = 000000e4, %l1 = ffffffffffff9986
	ldsw	[%i5+0x034],%l1		! %l1 = 00000000000000e4
!	Mem[0000000010001400] = ff00ff15, %l3 = 0000ffffeb44c1ff
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[00000000300c1400] = 7bc20000000000bb, %f28 = 6875b8b8 632e6006
	ldda	[%i3+%g0]0x81,%f28	! %f28 = 7bc20000 000000bb
!	Mem[0000000030101408] = 632ec18d, %l7 = ffffffffffffff99
	ldsba	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000063
!	Mem[0000000010081400] = ff0074e6, %l2 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 00000000ff0074e6
!	Mem[0000000030001400] = 7af37f46cb818699, %l7 = 0000000000000063
	ldxa	[%i0+%g0]0x89,%l7	! %l7 = 7af37f46cb818699
!	Mem[0000000010181400] = ff71e9ff 00007900 a2250000 aa71e95e
!	Mem[0000000010181410] = 1a00008d 00007900 467ff37a ffffff86
!	Mem[0000000010181420] = 000000ff 00000000 0000008a 91e2ce06
!	Mem[0000000010181430] = 06602e63 b8b87568 998681cb 467ff37a
	ldda	[%i6]ASI_BLK_P,%f0	! Block Load from 0000000010181400
!	Mem[00000000211c0000] = ffffd30e, %l0 = 0000000000000049
	ldsb	[%o2+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000211c0000] = ffffd30e, %l6 = ffffffffffffffff
	ldsba	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000002e63, Mem[0000000030101408] = 632ec18d
	stwa	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00002e63

p0_label_114:
!	Mem[00000000211c0001] = ffffd30e, %l7 = 7af37f46cb818699
	ldstub	[%o2+0x001],%l7		! %l7 = 000000ff000000ff
!	Mem[0000000010101408] = 00000000, %l2 = 00000000ff0074e6
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000002e63, Mem[0000000010101400] = aa000000
	stha	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 2e630000
!	Mem[0000000010141410] = 99ffffff, %l1 = 00000000000000e4
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	%l3 = 000000000000ff00, Mem[0000000010141408] = ffffff99
	stwa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000ff00
!	%l4 = 00002e63, %l5 = 00000011, Mem[00000000300c1408] = 00000000 bb862c1d
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00002e63 00000011
!	%f27 = 0000c27b, Mem[0000000030181410] = d15fde99
	sta	%f27,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000c27b
!	%f18 = 998681cb 8d00001a, Mem[0000000030141410] = 0000ff99 92e7e929
	stda	%f18,[%i5+%o5]0x89	! Mem[0000000030141410] = 998681cb 8d00001a
!	%l1 = 00000000000000ff, Mem[0000000010041408] = 00000000
	stha	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 1a00008d, %l2 = 0000000000000000
	lduha	[%i5+%o5]0x81,%l2	! %l2 = 0000000000001a00

p0_label_115:
!	Mem[0000000030181400] = 000044eb29e9e792, %f24 = bb000000 99ffffff
	ldda	[%i6+%g0]0x81,%f24	! %f24 = 000044eb 29e9e792
!	Mem[0000000030101400] = aa71e95effffffff, %f16 = 00000000 1d2c86bb
	ldda	[%i4+%g0]0x89,%f16	! %f16 = aa71e95e ffffffff
!	Mem[0000000010001430] = d10c0b52, %l0 = ffffffffffffffff
	ldub	[%i0+0x030],%l0		! %l0 = 00000000000000d1
!	Mem[0000000010001408] = 000000bb 000020a5, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i0+0x008]%asi,%l6	! %l6 = 00000000000000bb 00000000000020a5
!	Mem[0000000010041410] = bbffffff cb818699, %l2 = 00001a00, %l3 = 0000ff00
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000bbffffff 00000000cb818699
!	Mem[0000000020800000] = ff6ba29f, %l4 = 0000000000002e63
	lduh	[%o1+%g0],%l4		! %l4 = 000000000000ff6b
!	Mem[0000000010081434] = 492e4da6, %l6 = 00000000000000bb
	lduba	[%i2+0x036]%asi,%l6	! %l6 = 000000000000004d
!	Mem[0000000010181400] = ff71e9ff 00007900 a2250000 aa71e95e
!	Mem[0000000010181410] = 1a00008d 00007900 467ff37a ffffff86
!	Mem[0000000010181420] = 000000ff 00000000 0000008a 91e2ce06
!	Mem[0000000010181430] = 06602e63 b8b87568 998681cb 467ff37a
	ldda	[%i6]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010181400
!	Mem[0000000010081400] = ff0074e6, %l2 = 00000000bbffffff
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000cb818699, Mem[0000000030141410] = 8d00001a
	stha	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 8d008699

p0_label_116:
!	%l0 = 00000000000000d1, Mem[00000000100c1408] = 06602e63
	stha	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00d12e63
!	%l3 = 00000000cb818699, Mem[0000000030181408] = 7af37f46
	stwa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = cb818699
!	%l5 = 0000000000000011, Mem[0000000030141408] = ff002e63
	stba	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = ff002e11
!	%l6 = 0000004d, %l7 = 000020a5, Mem[0000000010141420] = 00000000 00001a29
	std	%l6,[%i5+0x020]		! Mem[0000000010141420] = 0000004d 000020a5
!	Mem[0000000010081404] = 00ca00ff, %l7 = 00000000000020a5
	swap	[%i2+0x004],%l7		! %l7 = 0000000000ca00ff
!	Mem[000000001010143c] = 74a700ff, %l4 = 000000000000ff6b, %asi = 80
	swapa	[%i4+0x03c]%asi,%l4	! %l4 = 0000000074a700ff
!	Mem[0000000010181410] = 8d00001a, %l3 = 00000000cb818699
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 0000001a000000ff
!	%l6 = 000000000000004d, Mem[0000000030081408] = ffffffbb
	stha	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = ffff004d
!	%f24 = 000044eb 29e9e792, %l2 = 00000000000000ff
!	Mem[0000000030141400] = ffc144ebffff0000
	stda	%f24,[%i5+%l2]ASI_PST8_SL ! Mem[0000000030141400] = 92e7e929eb440000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l1 = 00000000000000ff
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_117:
!	Mem[00000000100c1400] = 998681cb, %l6 = 000000000000004d
	lduw	[%i3+%g0],%l6		! %l6 = 00000000998681cb
!	Mem[0000000030141410] = 8d008699, %l6 = 00000000998681cb
	lduha	[%i5+%o5]0x89,%l6	! %l6 = 0000000000008699
!	Mem[0000000020800040] = ffff64b8, %l7 = 0000000000ca00ff
	ldsb	[%o1+0x041],%l7		! %l7 = ffffffffffffffff
!	Mem[00000000300c1410] = 5ce6ffffffffffff, %f26 = bb000000 0000c27b
	ldda	[%i3+%o5]0x89,%f26	! %f26 = 5ce6ffff ffffffff
!	Mem[0000000010081410] = 49002e63, %f23 = bbffffff
	lda	[%i2+%o5]0x88,%f23	! %f23 = 49002e63
!	Mem[0000000020800000] = ff6ba29f, %l5 = 0000000000000011
	ldsh	[%o1+%g0],%l5		! %l5 = ffffffffffffff6b
!	Mem[0000000030181408] = cb818699, %l3 = 000000000000001a
	ldsha	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffff8699
!	Mem[0000000010041410] = ffffffbb, %l6 = 0000000000008699
	lduha	[%i1+%o5]0x88,%l6	! %l6 = 000000000000ffbb
!	Mem[0000000030101408] = 00002e63 ffff0000, %l0 = 000000d1, %l1 = 00000000
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 0000000000002e63 00000000ffff0000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000074a700ff, Mem[0000000030181408] = cb818699
	stha	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = cb8100ff

p0_label_118:
!	Mem[00000000100c1402] = 998681cb, %l7 = ffffffffffffffff
	ldstub	[%i3+0x002],%l7		! %l7 = 00000081000000ff
!	Mem[0000000010181408] = a2250000, %l5 = ffffffffffffff6b
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 000000a2000000ff
!	Mem[0000000010101408] = ff0074e6, %l0 = 0000000000002e63
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 00000000ff0074e6
!	%l0 = 00000000ff0074e6, Mem[0000000010001420] = 00000000
	sth	%l0,[%i0+0x020]		! Mem[0000000010001420] = 74e60000
!	%l5 = 00000000000000a2, Mem[0000000030181400] = 000044eb
	stha	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 00a244eb
!	Mem[0000000030001410] = 8c86efff, %l0 = 00000000ff0074e6
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 000000008c86efff
!	%l1 = 00000000ffff0000, Mem[0000000030101410] = bb000000
	stwa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = ffff0000
!	%f18 = 998681cb, Mem[0000000010041410] = bbffffff
	sta	%f18,[%i1+%o5]0x80	! Mem[0000000010041410] = 998681cb
!	%l3 = ffffffffffff8699, Mem[00000000100c1408] = 632ed100
	stha	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 632e8699
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = 74e60000 ffffffff, %l4 = 74a700ff, %l5 = 000000a2
	ldda	[%i0+0x020]%asi,%l4	! %l4 = 0000000074e60000 00000000ffffffff

p0_label_119:
!	Mem[0000000030181400] = 00a244eb29e9e792, %l6 = 000000000000ffbb
	ldxa	[%i6+%g0]0x81,%l6	! %l6 = 00a244eb29e9e792
!	Mem[0000000030041408] = ff2e4da6, %l5 = 00000000ffffffff
	ldsba	[%i1+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = 45cb78ff 5683e4b8, %l4 = 74e60000, %l5 = ffffffff
	ldd	[%i4+%o5],%l4		! %l4 = 0000000045cb78ff 000000005683e4b8
!	Mem[0000000010181408] = ff250000, %l2 = 00000000000000ff
	ldsha	[%i6+%o4]0x80,%l2	! %l2 = ffffffffffffff25
!	Mem[0000000030041400] = 020000005ee971aa, %l4 = 0000000045cb78ff
	ldxa	[%i1+%g0]0x81,%l4	! %l4 = 020000005ee971aa
!	Mem[000000001004143c] = 83f4eee5, %l5 = 000000005683e4b8
	ldsh	[%i1+0x03c],%l5		! %l5 = ffffffffffff83f4
!	Mem[0000000021800080] = 004c9c17, %l3 = ffffffffffff8699
	ldub	[%o3+0x081],%l3		! %l3 = 000000000000004c
!	Mem[0000000030081410] = 00000000, %l6 = 00a244eb29e9e792
	lduha	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = cb818699, %l5 = ffffffffffff83f4
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 00000000cb818699
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000004c, Mem[00000000201c0000] = ffbb91b2, %asi = 80
	stba	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 4cbb91b2

p0_label_120:
!	%l3 = 000000000000004c, Mem[0000000030001408] = 9900008d
	stba	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 4c00008d
!	%f0  = 00790000 ffe971ff 5ee971aa 000025a2
!	%f4  = 00790000 8d00001a 86ffffff 7af37f46
!	%f8  = 00000000 ff000000 06cee291 8a000000
!	%f12 = 6875b8b8 632e6006 7af37f46 cb818699
	stda	%f0,[%i2]ASI_BLK_P	! Block Store to 0000000010081400
!	Mem[0000000030081408] = 4d00ffff, %l2 = ffffffffffffff25
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 000000004d00ffff
!	Mem[000000001010143c] = 0000ff6b, %l1 = ffff0000, %l4 = 5ee971aa
	add	%i4,0x3c,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 000000000000ff6b
!	Mem[0000000010181410] = 8d0000ff, %l7 = 0000000000000081
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	%f30 = 7af37f46 cb818699, %l0 = 000000008c86efff
!	Mem[0000000010081408] = 5ee971aa000025a2
	add	%i2,0x008,%g1
	stda	%f30,[%g1+%l0]ASI_PST16_P ! Mem[0000000010081408] = 7af37f46cb818699
!	Mem[0000000030101400] = ffffffff, %l0 = 000000008c86efff
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	%l5 = 00000000cb818699, Mem[00000000201c0000] = 4cbb91b2
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 869991b2
!	%l4 = 000000000000ff6b, Mem[0000000030041400] = 00000002
	stba	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000006b
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 25ffffff, %l3 = 000000000000004c
	lduwa	[%i2+%o4]0x89,%l3	! %l3 = 0000000025ffffff

p0_label_121:
!	Mem[0000000010181408] = ff250000, %l2 = 000000004d00ffff
	ldsha	[%i6+%o4]0x80,%l2	! %l2 = ffffffffffffff25
!	Mem[0000000010101408] = 00002e63, %l4 = 000000000000ff6b
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = 869991b2, %l4 = 0000000000000000
	lduh	[%o0+%g0],%l4		! %l4 = 0000000000008699
!	Mem[0000000010181410] = 8d0000ff, %l5 = 00000000cb818699
	lduwa	[%i6+%o5]0x88,%l5	! %l5 = 000000008d0000ff
!	Mem[00000000211c0000] = ffffd30e, %l0 = 00000000000000ff
	ldub	[%o2+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030181400] = 00a244eb, %l1 = 00000000ffff0000
	ldsha	[%i6+%g0]0x81,%l1	! %l1 = 00000000000000a2
!	Mem[0000000030141410] = 8d008699, %l2 = ffffffffffffff25
	lduba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000099
!	Mem[00000000100c1430] = 00000000 0000001e, %l0 = 000000ff, %l1 = 000000a2
	ldd	[%i3+0x030],%l0		! %l0 = 0000000000000000 000000000000001e
!	Mem[0000000030041408] = ff2e4da6, %f30 = 7af37f46
	lda	[%i1+%o4]0x81,%f30	! %f30 = ff2e4da6
!	Starting 10 instruction Store Burst
!	%f24 = 000044eb 29e9e792, %l1 = 000000000000001e
!	Mem[00000000100c1410] = 0000c27b0000008a
	add	%i3,0x010,%g1
	stda	%f24,[%g1+%l1]ASI_PST16_PL ! Mem[00000000100c1410] = 0000e929eb440000

p0_label_122:
!	%f16 = aa71e95e ffffffff 998681cb 8d00001a
!	%f20 = a2250000 000000bb c27b0000 49002e63
!	%f24 = 000044eb 29e9e792 5ce6ffff ffffffff
!	%f28 = 7bc20000 000000bb ff2e4da6 cb818699
	stda	%f16,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	Mem[0000000030141408] = ff002e11, %l2 = 0000000000000099
	ldstuba	[%i5+%o4]0x89,%l2	! %l2 = 00000011000000ff
!	%l6 = 0000000000000000, Mem[00000000100c1410] = 0000e929eb440000
	stxa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	%f16 = aa71e95e ffffffff 998681cb 8d00001a
!	%f20 = a2250000 000000bb c27b0000 49002e63
!	%f24 = 000044eb 29e9e792 5ce6ffff ffffffff
!	%f28 = 7bc20000 000000bb ff2e4da6 cb818699
	stda	%f16,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010081424] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i2+0x024]%asi,%l0	! %l0 = 000000ff000000ff
!	%l6 = 0000000000000000, Mem[0000000030081408] = ffffff2500000000
	stxa	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	%f28 = 7bc20000, Mem[0000000010101400] = 2e630000
	sta	%f28,[%i4+%g0]0x80	! Mem[0000000010101400] = 7bc20000
!	%f3  = 000025a2, Mem[0000000010001408] = bb000000
	sta	%f3 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 000025a2
!	%l4 = 00008699, %l5 = 8d0000ff, Mem[0000000010081400] = 00790000 ffe971ff
	std	%l4,[%i2+%g0]		! Mem[0000000010081400] = 00008699 8d0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00002e63, %f1  = ffe971ff
	lda	[%i4+%o4]0x81,%f1 	! %f1 = 00002e63

p0_label_123:
!	Mem[0000000030041410] = 00007bff, %f17 = ffffffff
	lda	[%i1+%o5]0x89,%f17	! %f17 = 00007bff
!	Mem[0000000010001420] = 74e60000ffffffff, %l0 = 00000000000000ff
	ldx	[%i0+0x020],%l0		! %l0 = 74e60000ffffffff
!	Mem[0000000010001410] = 9c27243d00000000, %l7 = 00000000000000ff
	ldxa	[%i0+%o5]0x80,%l7	! %l7 = 9c27243d00000000
!	Mem[00000000300c1408] = 00002e63, %l5 = 000000008d0000ff
	ldsha	[%i3+%o4]0x89,%l5	! %l5 = 0000000000002e63
!	Mem[0000000030101410] = 0000ffff, %l2 = 0000000000000011
	ldsha	[%i4+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001400] = 5ee971aa, %l1 = 000000000000001e
	lduwa	[%i0+%g0]0x89,%l1	! %l1 = 000000005ee971aa
!	Mem[0000000010141408] = 0000ff00, %l0 = 74e60000ffffffff
	ldswa	[%i5+%o4]0x88,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010141408] = 00ff0000, %f7  = 7af37f46
	lda	[%i5+%o4]0x80,%f7 	! %f7 = 00ff0000
!	Mem[0000000010001430] = d10c0b52, %l1 = 000000005ee971aa
	ldsw	[%i0+0x030],%l1		! %l1 = ffffffffd10c0b52
!	Starting 10 instruction Store Burst
!	%f20 = a2250000 000000bb, %l7 = 9c27243d00000000
!	Mem[0000000030181438] = 0079000083783eff
	add	%i6,0x038,%g1
	stda	%f20,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030181438] = 0079000083783eff

p0_label_124:
!	%l3 = 0000000025ffffff, Mem[0000000010181410] = ff00008d00007900
	stxa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000025ffffff
!	%f10 = 06cee291, Mem[00000000100c140c] = 00000000
	sta	%f10,[%i3+0x00c]%asi	! Mem[00000000100c140c] = 06cee291
!	%l1 = ffffffffd10c0b52, Mem[0000000010181400] = ffe971ff
	stwa	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = d10c0b52
!	%l4 = 0000000000008699, Mem[0000000030141410] = 9986008d
	stwa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00008699
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030141410] = 99860000 998681cb
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 00000000
!	%l5 = 0000000000002e63, Mem[0000000020800000] = ff6ba29f
	sth	%l5,[%o1+%g0]		! Mem[0000000020800000] = 2e63a29f
!	Mem[0000000030081410] = 00000000, %l0 = 000000000000ff00
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101408] = 00002e63, %l4 = 0000000000008699
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 0000000000002e63
!	%f24 = 000044eb 29e9e792, %l3 = 0000000025ffffff
!	Mem[00000000300c1438] = b90dcab551895986
	add	%i3,0x038,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_SL ! Mem[00000000300c1438] = 92e7e929eb440000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 15ff00ff, %l5 = 0000000000002e63
	ldsba	[%i0+%g0]0x88,%l5	! %l5 = ffffffffffffffff

p0_label_125:
!	Mem[00000000100c1400] = cbff8699, %l7 = 9c27243d00000000
	lduwa	[%i3+%g0]0x88,%l7	! %l7 = 00000000cbff8699
!	Mem[0000000030001408] = 998681cb, %l3 = 0000000025ffffff
	ldsba	[%i0+%o4]0x81,%l3	! %l3 = ffffffffffffff99
!	Mem[0000000010141400] = 000000bb7900d030, %l0 = 0000000000000000
	ldx	[%i5+%g0],%l0		! %l0 = 000000bb7900d030
!	Mem[0000000010041400] = aa71e95e, %l2 = ffffffffffffffff
	lduba	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000aa
!	Mem[0000000030141400] = 29e9e792, %l6 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l6	! %l6 = 0000000029e9e792
!	Mem[0000000010181400] = 00790000 d10c0b52, %l2 = 000000aa, %l3 = ffffff99
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 00000000d10c0b52 0000000000790000
!	Mem[0000000010181418] = 467ff37a, %f4  = 00790000
	ld	[%i6+0x018],%f4 	! %f4 = 467ff37a
!	Mem[0000000030001408] = 1a00008d cb818699, %l2 = d10c0b52, %l3 = 00790000
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 00000000cb818699 000000001a00008d
!	Mem[0000000010081430] = 6875b8b8 632e6006, %l2 = cb818699, %l3 = 1a00008d
	ldd	[%i2+0x030],%l2		! %l2 = 000000006875b8b8 00000000632e6006
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = a2250000, %l7 = 00000000cbff8699
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 00000000a2250000

p0_label_126:
!	%f2  = 5ee971aa 000025a2, Mem[0000000010181408] = 000025ff 5ee971aa
	stda	%f2 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 5ee971aa 000025a2
!	%f17 = 00007bff, Mem[00000000100c1408] = 99862e63
	st	%f17,[%i3+%o4]		! Mem[00000000100c1408] = 00007bff
!	Mem[0000000030141408] = ff002eff, %l7 = 00000000a2250000
	ldstuba	[%i5+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	%l6 = 29e9e792, %l7 = 000000ff, Mem[0000000010181400] = d10c0b52 00790000
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 29e9e792 000000ff
!	Mem[00000000201c0001] = 869991b2, %l7 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 00000099000000ff
!	%l6 = 0000000029e9e792, Mem[0000000030181410] = 0000c27b
	stwa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 29e9e792
!	Mem[0000000030041408] = a64d2eff, %l6 = 0000000029e9e792
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 00000000a64d2eff
!	Mem[0000000021800140] = 000064c9, %l7 = 0000000000000099
	ldstuba	[%o3+0x140]%asi,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000a64d2eff, Mem[0000000010181400] = 92e7e929
	stwa	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = a64d2eff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00790000, %l5 = ffffffffffffffff
	ldswa	[%i2+%o5]0x80,%l5	! %l5 = 0000000000790000

p0_label_127:
!	Mem[0000000010101410] = 45cb78ff5683e4b8, %f2  = 5ee971aa 000025a2
	ldda	[%i4+%o5]0x80,%f2 	! %f2  = 45cb78ff 5683e4b8
!	Mem[0000000030081408] = 00000000, %l1 = ffffffffd10c0b52
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = cbff8699, %l0 = 000000bb7900d030
	lduwa	[%i0+%o4]0x80,%l0	! %l0 = 00000000cbff8699
!	Mem[0000000030081408] = 0000000000000000, %l1 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800100] = fff238be, %l2 = 000000006875b8b8
	lduba	[%o3+0x101]%asi,%l2	! %l2 = 00000000000000f2
!	Mem[0000000010041400] = aa71e95e, %l3 = 00000000632e6006
	lduha	[%i1+%g0]0x80,%l3	! %l3 = 000000000000aa71
!	Mem[0000000010001430] = d10c0b52, %l7 = 0000000000000000
	lduh	[%i0+0x032],%l7		! %l7 = 0000000000000b52
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000030141400] = 92e7e929 eb440000 ff2e00ff 656d647d
!	Mem[0000000030141410] = 00000000 00000000 b3a20d4d 25e28a7b
!	Mem[0000000030141420] = fc4808ec 1c11f4d7 6bafd61c 1eb2507e
!	Mem[0000000030141430] = 1e6b974d 66f9bdbc a421ad9c 0caff052
	ldda	[%i5]ASI_BLK_SL,%f0	! Block Load from 0000000030141400
!	Mem[0000000030141410] = 0000000000000000, %l4 = 0000000000002e63
	ldxa	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000cbff8699, Mem[000000001000140f] = 000020a5, %asi = 80
	stba	%l0,[%i0+0x00f]%asi	! Mem[000000001000140c] = 00002099

p0_label_128:
!	%l4 = 0000000000000000, Mem[0000000010101410] = 45cb78ff5683e4b8, %asi = 80
	stxa	%l4,[%i4+0x010]%asi	! Mem[0000000010101410] = 0000000000000000
!	%f26 = 5ce6ffff ffffffff, %l0 = 00000000cbff8699
!	Mem[0000000010101428] = c9ef868c1d2c86bb
	add	%i4,0x028,%g1
	stda	%f26,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010101428] = ffff868c1d2ce65c
!	%f17 = 00007bff, Mem[0000000010141410] = ffffff99
	sta	%f17,[%i5+%o5]0x80	! Mem[0000000010141410] = 00007bff
!	%f16 = aa71e95e 00007bff, Mem[00000000100c1400] = cbff8699 60df3d69
	stda	%f16,[%i3+%g0]0x88	! Mem[00000000100c1400] = aa71e95e 00007bff
!	%l1 = 0000000000000000, Mem[0000000010041408] = 998681cb8d00001a
	stxa	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000030001408] = cb818699, %l1 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 00000099000000ff
!	Mem[0000000030181400] = 00a244eb, %l7 = 0000000000000b52
	ldstuba	[%i6+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%l1 = 0000000000000099, Mem[000000001000141c] = e653fb92
	stb	%l1,[%i0+0x01c]		! Mem[000000001000141c] = 9953fb92
!	Mem[0000000030141408] = ff002eff, %l2 = 00000000000000f2
	ldstuba	[%i5+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c143c] = a69086f0, %f30 = ff2e4da6
	lda	[%i3+0x03c]%asi,%f30	! %f30 = a69086f0

p0_label_129:
!	Mem[0000000010041400] = ffffffff5ee971aa, %l3 = 000000000000aa71
	ldxa	[%i1+%g0]0x88,%l3	! %l3 = ffffffff5ee971aa
!	Mem[0000000010101408] = 99860000, %l4 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = 1a00008d cb8186ff, %l0 = cbff8699, %l1 = 00000099
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000cb8186ff 000000001a00008d
!	%f20 = a2250000, %f16 = aa71e95e
	fstoi	%f20,%f16		! %f16 = 00000000
!	Mem[0000000010181418] = 467ff37a ffffff86, %l2 = 000000ff, %l3 = 5ee971aa
	ldd	[%i6+0x018],%l2		! %l2 = 00000000467ff37a 00000000ffffff86
!	Mem[0000000030001408] = ff8681cb, %l5 = 0000000000790000
	lduba	[%i0+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000211c0000] = ffffd30e, %l5 = 00000000000000ff
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141408] = ff2e00ff, %l5 = ffffffffffffffff
	lduba	[%i5+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181404] = ff000000, %l1 = 000000001a00008d
	ldswa	[%i6+0x004]%asi,%l1	! %l1 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%l2 = 467ff37a, %l3 = ffffff86, Mem[0000000010041400] = aa71e95e ffffffff
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 467ff37a ffffff86

p0_label_130:
!	%f29 = 000000bb, Mem[0000000010181404] = ff000000
	st	%f29,[%i6+0x004]	! Mem[0000000010181404] = 000000bb
!	Mem[0000000030181410] = 92e7e929, %l6 = 00000000a64d2eff
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 0000000092e7e929
!	Mem[0000000010141408] = 00ff0000, %l6 = 0000000092e7e929, %asi = 80
	swapa	[%i5+0x008]%asi,%l6	! %l6 = 0000000000ff0000
!	Mem[00000000300c1408] = 00002e63, %l1 = ffffffffff000000
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000002e63
!	%l5 = 00000000000000ff, Mem[0000000030101410] = 0000ffff
	stba	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000ffff
!	%f25 = 29e9e792, Mem[0000000010181408] = a2250000
	sta	%f25,[%i6+%o4]0x80	! Mem[0000000010181408] = 29e9e792
!	%l2 = 00000000467ff37a, Mem[0000000010001400] = 15ff00ff
	stba	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 15ff007a
!	Mem[0000000010041420] = 000044eb29e9e792, %l1 = 0000000000002e63, %l7 = 0000000000000000
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 000044eb29e9e792
!	Mem[0000000010081408] = 7af37f46, %l0 = 00000000cb8186ff
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 0000007a000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 92e7e929, %l1 = 0000000000002e63
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffff92e7

p0_label_131:
!	Mem[0000000010181420] = 000000ff, %l7 = 000044eb29e9e792
	lduw	[%i6+0x020],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030181400] = eb44a2ff, %l3 = 00000000ffffff86
	ldswa	[%i6+%g0]0x89,%l3	! %l3 = ffffffffeb44a2ff
!	Mem[0000000021800100] = fff238be, %l0 = 000000000000007a
	lduha	[%o3+0x100]%asi,%l0	! %l0 = 000000000000fff2
!	Mem[0000000010181400] = a64d2eff, %l2 = 00000000467ff37a
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 00000000a64d2eff
!	Mem[0000000030141410] = 0000000000000000, %l3 = ffffffffeb44a2ff
	ldxa	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = 00000099, %l7 = 00000000000000ff
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000099
!	Mem[0000000030081400] = 99000000, %l6 = 0000000000ff0000
	lduba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000099
!	Mem[00000000300c1400] = 0000c27b, %l0 = 000000000000fff2
	ldsba	[%i3+%g0]0x89,%l0	! %l0 = 000000000000007b
!	Mem[0000000021800180] = ff374b9c, %l0 = 000000000000007b
	ldsha	[%o3+0x180]%asi,%l0	! %l0 = ffffffffffffff37
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 00007bff 998681cb 8d00001a
!	%f20 = a2250000 000000bb c27b0000 49002e63
!	%f24 = 000044eb 29e9e792 5ce6ffff ffffffff
!	%f28 = 7bc20000 000000bb a69086f0 cb818699
	stda	%f16,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400

p0_label_132:
!	%f8  = d7f4111c ec0848fc, %l0 = ffffffffffffff37
!	Mem[0000000030101400] = ffffffff5ee971aa
	stda	%f8,[%i4+%l0]ASI_PST8_S ! Mem[0000000030101400] = ffff111c5e0848fc
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000099
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030081410] = ff000000
	stha	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l4 = 0000000000000000, %l5 = 00000000000000ff, %y  = 00000000
	smul	%l4,%l5,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[0000000010141410] = ff7b0000, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 00000000ff7b0000
!	%f13 = 4d976b1e, Mem[0000000010001410] = 9c27243d
	sta	%f13,[%i0+%o5]0x80	! Mem[0000000010001410] = 4d976b1e
!	%f14 = 52f0af0c, Mem[0000000010081400] = 00008699
	sta	%f14,[%i2+%g0]0x80	! Mem[0000000010081400] = 52f0af0c
!	Mem[0000000030081410] = 00000000, %l7 = 0000000000000099
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = 004c9c17, %l6 = 0000000000000000
	ldsba	[%o3+0x080]%asi,%l6	! %l6 = 0000000000000000

p0_label_133:
!	Mem[0000000030041400] = 6b000000, %l2 = 00000000a64d2eff
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = 000000006b000000
!	Mem[0000000021800140] = ff0064c9, %l4 = 00000000ff7b0000
	lduba	[%o3+0x140]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001410] = 1e6b974d, %l5 = 00000000000000ff
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = 000000000000004d
!	Mem[0000000020800040] = ffff64b8, %l6 = 0000000000000000
	lduba	[%o1+0x041]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001438] = 8c1aefc95d438f65, %f14 = 52f0af0c 9cad21a4
	ldda	[%i0+0x038]%asi,%f14	! %f14 = 8c1aefc9 5d438f65
!	Mem[00000000100c1410] = 99000000, %l1 = ffffffffffff92e7
	lduba	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000099
!	Mem[0000000010101408] = 00008699 00001a29, %l4 = 000000ff, %l5 = 0000004d
	ldd	[%i4+%o4],%l4		! %l4 = 0000000000008699 0000000000001a29
!	Mem[0000000030041408] = 92e7e929 00002e63, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 0000000092e7e929 0000000000002e63
!	Mem[0000000010081410] = 1a00008d 00007900, %l4 = 00008699, %l5 = 00001a29
	ldda	[%i2+%o5]0x88,%l4	! %l4 = 0000000000007900 000000001a00008d
!	Starting 10 instruction Store Burst
!	%f7  = 4d0da2b3, Mem[0000000030041400] = 6b000000
	sta	%f7 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 4d0da2b3

p0_label_134:
!	Mem[0000000030101408] = 632e0000, %l4 = 0000000000007900
	ldstuba	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%f3  = ff002eff, Mem[0000000030181408] = cb8100ff
	sta	%f3 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ff002eff
!	Mem[0000000030001408] = cb8186ff, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	%f8  = d7f4111c ec0848fc, Mem[0000000010001408] = cbff8699 00002099
	stda	%f8 ,[%i0+%o4]0x80	! Mem[0000000010001408] = d7f4111c ec0848fc
!	Mem[0000000010181410] = 00000000, %l2 = 000000006b000000
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101400] = 00ffff000000c27b
	stxa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010001408] = d7f4111c
	stha	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000111c
!	Mem[0000000030081408] = 00000000, %l0 = ffffffffffffff37
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%l5 = 000000001a00008d, Mem[0000000030081410] = ff000000
	stwa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 1a00008d
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = bb000000, %f2  = 7d646d65
	lda	[%i5+%g0]0x88,%f2 	! %f2 = bb000000

p0_label_135:
!	Mem[0000000030041408] = 92e7e929, %f4  = 00000000
	lda	[%i1+%o4]0x81,%f4 	! %f4 = 92e7e929
!	Mem[0000000030181410] = ff2e4da6, %l7 = 0000000000002e63
	ldsba	[%i6+%o5]0x89,%l7	! %l7 = ffffffffffffffa6
!	Mem[0000000010001400] = 7a00ff1500000063, %l5 = 000000001a00008d
	ldxa	[%i0+%g0]0x80,%l5	! %l5 = 7a00ff1500000063
!	Mem[0000000010081438] = 7af37f46, %l6 = 0000000092e7e929
	ldub	[%i2+0x038],%l6		! %l6 = 000000000000007a
!	Mem[0000000030141400] = 92e7e929eb440000, %l3 = 00000000000000ff
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = 92e7e929eb440000
!	Mem[00000000100c1400] = aa71e95e00007bff, %l3 = 92e7e929eb440000
	ldxa	[%i3+%g0]0x88,%l3	! %l3 = aa71e95e00007bff
!	Mem[0000000010081400] = 0caff052, %l3 = aa71e95e00007bff
	lduwa	[%i2+%g0]0x88,%l3	! %l3 = 000000000caff052
!	Mem[0000000030041410] = ffffffbb00007bff, %f16 = 00000000 00007bff
	ldda	[%i1+%o5]0x89,%f16	! %f16 = ffffffbb 00007bff
!	Mem[0000000010141434] = 000000e4, %l2 = 0000000000000000
	ldsh	[%i5+0x036],%l2		! %l2 = 00000000000000e4
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 1a00008d, %l1 = 0000000000000099
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 000000001a00008d

p0_label_136:
!	%l4 = 0000000000000000, Mem[0000000010081400] = 0caff052
	stwa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	Mem[00000000100c1420] = 928800000effcdf6, %l0 = 0000000000000000, %l6 = 000000000000007a
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = 928800000effcdf6
!	%l5 = 7a00ff1500000063, Mem[0000000030001408] = cb8186ff
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = cb818663
!	%l1 = 000000001a00008d, Mem[0000000010181410] = ff000000
	stba	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 8d000000
!	%f15 = 5d438f65, Mem[000000001004143c] = f08690a6
	st	%f15,[%i1+0x03c]	! Mem[000000001004143c] = 5d438f65
!	%f23 = 49002e63, Mem[0000000010141400] = 000000bb
	sta	%f23,[%i5+%g0]0x80	! Mem[0000000010141400] = 49002e63
!	%l5 = 7a00ff1500000063, Mem[0000000030081408] = 00000000000000ff
	stxa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 7a00ff1500000063
!	Mem[0000000010101408] = 00008699, %l0 = 0000000000000000
	swap	[%i4+%o4],%l0		! %l0 = 0000000000008699
!	%f24 = 000044eb, Mem[0000000010041400] = 00007bff
	sta	%f24,[%i1+%g0]0x88	! Mem[0000000010041400] = 000044eb
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff000000, %l4 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_137:
!	Mem[0000000010081428] = 06cee2918a000000, %l7 = ffffffffffffffa6
	ldxa	[%i2+0x028]%asi,%l7	! %l7 = 06cee2918a000000
!	Mem[000000001010143c] = 0000ff6b, %l7 = 06cee2918a000000
	ldsh	[%i4+0x03e],%l7		! %l7 = ffffffffffffff6b
!	Mem[0000000010141410] = 00000000, %l3 = 000000000caff052
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 1c110000, %l0 = 0000000000008699
	lduha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010041414] = 000025a2, %f30 = a69086f0
	ld	[%i1+0x014],%f30	! %f30 = 000025a2
!	Mem[0000000030001410] = a2250000, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = ffffffffffffffa2
!	Mem[0000000030001408] = cb818663, %l7 = ffffffffffffff6b
	ldsha	[%i0+%o4]0x89,%l7	! %l7 = ffffffffffff8663
!	Mem[0000000010181424] = 00000000, %f5  = 00000000
	ld	[%i6+0x024],%f5 	! %f5 = 00000000
!	Mem[0000000010181400] = a64d2eff 000000bb 29e9e792 aa71e95e
!	Mem[0000000010181410] = 8d000000 25ffffff 467ff37a ffffff86
!	Mem[0000000010181420] = 000000ff 00000000 0000008a 91e2ce06
!	Mem[0000000010181430] = 06602e63 b8b87568 998681cb 467ff37a
	ldda	[%i6]ASI_BLK_PL,%f16	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	Mem[0000000010141438] = ff3ef03225697236, %l5 = 7a00ff1500000063, %l1 = 000000001a00008d
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = ff3ef03225697236

p0_label_138:
!	%l4 = 0000000000000000, Mem[0000000010141410] = 00000000
	stwa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
	membar	#Sync			! Added by membar checker (32)
!	%l4 = 0000000000000000, Mem[0000000010181400] = ff2e4da6
	stwa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%l7 = ffffffffffff8663, Mem[0000000010101404] = 00000000, %asi = 80
	stha	%l7,[%i4+0x004]%asi	! Mem[0000000010101404] = 86630000
!	%l7 = ffffffffffff8663, Mem[0000000030101408] = 632e00ff
	stwa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = ffff8663
!	%l6 = 928800000effcdf6, Mem[0000000030001400] = 5ee971aa
	stha	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 5ee9cdf6
!	Mem[00000000300c1408] = ff000000, %l6 = 928800000effcdf6
	ldstuba	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l1 = ff3ef03225697236, Mem[0000000010181418] = 467ff37affffff86, %asi = 80
	stxa	%l1,[%i6+0x018]%asi	! Mem[0000000010181418] = ff3ef03225697236
!	%l7 = ffffffffffff8663, Mem[0000000010181410] = 8d000000
	stba	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 63000000
!	%f6  = 7b8ae225 4d0da2b3, Mem[0000000010081408] = fff37f46 cb818699
	stda	%f6 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 7b8ae225 4d0da2b3
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = fc48085e1c11ffff, %f10 = 7e50b21e 1cd6af6b
	ldda	[%i4+%g0]0x89,%f10	! %f10 = fc48085e 1c11ffff

p0_label_139:
!	Mem[00000000201c0000] = 86ff91b2, %l3 = ffffffffffffffa2
	ldsba	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffff86
!	Mem[0000000010081400] = ff00008d00000000, %l7 = ffffffffffff8663
	ldxa	[%i2+%g0]0x88,%l7	! %l7 = ff00008d00000000
!	Mem[0000000030001400] = 5ee9cdf6, %l3 = ffffffffffffff86
	ldswa	[%i0+%g0]0x89,%l3	! %l3 = 000000005ee9cdf6
!	Mem[0000000010001400] = 7a00ff1500000063, %l3 = 000000005ee9cdf6
	ldxa	[%i0+%g0]0x80,%l3	! %l3 = 7a00ff1500000063
!	Mem[00000000300c1400] = 0000c27b, %l4 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l4	! %l4 = 000000000000007b
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010101400] = ff000000 86630000 00000000 00001a29
!	Mem[0000000010101410] = 00000000 00000000 0c264be1 5c801486
!	Mem[0000000010101420] = 71eb081e 891cc4ff ffff868c 1d2ce65c
!	Mem[0000000010101430] = ffffffb8 afadffea 000000ff 0000ff6b
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Mem[0000000010081408] = 25e28a7b, %f28 = 6875b8b8
	lda	[%i2+%o4]0x88,%f28	! %f28 = 25e28a7b
!	Mem[0000000030041410] = ff7b0000, %l6 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l6	! %l6 = ffffffffff7b0000
!	Mem[0000000010001420] = 74e60000 ffffffff, %l2 = 000000e4, %l3 = 00000063
	ldda	[%i0+0x020]%asi,%l2	! %l2 = 0000000074e60000 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 00000000, %l4 = 000000000000007b
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_140:
!	%f24 = 00000000 ff000000, Mem[0000000030181410] = ff2e4da6 eb44c18d
	stda	%f24,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 ff000000
!	Mem[0000000030181410] = 000000ff, %l3 = 00000000ffffffff
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%l0 = 00000000, %l1 = 25697236, Mem[0000000010141410] = 00000000 000000bb
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 25697236
!	%l2 = 0000000074e60000, Mem[0000000010001400] = 7a00ff15
	stha	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000ff15
!	%f28 = 25e28a7b 632e6006, Mem[0000000030101400] = ffff111c 5e0848fc
	stda	%f28,[%i4+%g0]0x81	! Mem[0000000030101400] = 25e28a7b 632e6006
	membar	#Sync			! Added by membar checker (34)
!	%l4 = 0000000000000000, Mem[0000000010101400] = 000000ff
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	%l5 = 7a00ff1500000063, Mem[00000000201c0001] = 86ff91b2
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = 866391b2
!	Mem[00000000100c1410] = 00000099, %l2 = 0000000074e60000
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 00000099000000ff
!	%f16 = bb000000 ff2e4da6, Mem[0000000030081410] = 99000000 0000ffff
	stda	%f16,[%i2+%o5]0x89	! Mem[0000000030081410] = bb000000 ff2e4da6
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 4d976b1e00000000, %f24 = 00000000 ff000000
	ldda	[%i0+%o5]0x80,%f24	! %f24 = 4d976b1e 00000000

p0_label_141:
!	Mem[0000000010001408] = 0000111cec0848fc, %f2  = 00000000 00001a29
	ldda	[%i0+0x008]%asi,%f2 	! %f2  = 0000111c ec0848fc
!	Mem[0000000030101410] = ffff0000, %f2  = 0000111c
	lda	[%i4+%o5]0x81,%f2 	! %f2 = ffff0000
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 0000000000000000
	setx	0x129412704c7314e5,%g7,%l0 ! %l0 = 129412704c7314e5
!	%l1 = ff3ef03225697236
	setx	0x285072e8386e3cd9,%g7,%l1 ! %l1 = 285072e8386e3cd9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 129412704c7314e5
	setx	0xa45991ef8b5bd248,%g7,%l0 ! %l0 = a45991ef8b5bd248
!	%l1 = 285072e8386e3cd9
	setx	0x8d1508e7caaf8497,%g7,%l1 ! %l1 = 8d1508e7caaf8497
!	Mem[0000000030001400] = f6cde95e, %l0 = a45991ef8b5bd248
	lduha	[%i0+%g0]0x81,%l0	! %l0 = 000000000000f6cd
!	Mem[0000000010181408] = 5ee971aa 92e7e929, %l4 = 00000000, %l5 = 00000063
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 0000000092e7e929 000000005ee971aa
!	Mem[00000000300c1400] = 0000c27b, %l3 = 00000000000000ff
	ldswa	[%i3+%g0]0x89,%l3	! %l3 = 000000000000c27b
!	Mem[0000000010141408] = 29e9e792, %f31 = cb818699
	lda	[%i5+%o4]0x88,%f31	! %f31 = 29e9e792
!	Mem[000000001000140c] = ec0848fc, %l5 = 000000005ee971aa
	ldsh	[%i0+0x00c],%l5		! %l5 = ffffffffffffec08
!	Mem[0000000030001408] = 638681cb, %l2 = 0000000000000099
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = 00000000638681cb
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000c27b, Mem[0000000030101400] = 7b8ae225
	stha	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 7b8ac27b

p0_label_142:
!	%f8  = 71eb081e 891cc4ff, %l6 = ffffffffff7b0000
!	Mem[0000000030101408] = 6386ffffffff0000
	add	%i4,0x008,%g1
	stda	%f8,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030101408] = 6386ffffffff0000
!	%l6 = ffffffffff7b0000, Mem[0000000010181408] = 5ee971aa92e7e929
	stxa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffffff7b0000
!	%l2 = 638681cb, %l3 = 0000c27b, Mem[0000000010081400] = 0000007b 8d0000ff
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 638681cb 0000c27b
!	%l3 = 000000000000c27b, Mem[0000000010001410] = 4d976b1e
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = c27b6b1e
!	%l5 = ffffffffffffec08, Mem[0000000010001408] = 0000111c
	stha	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = ec08111c
!	Mem[00000000300c1400] = 0000c27b, %l7 = ff00008d00000000
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 0000007b000000ff
!	Mem[0000000010001408] = ec08111c, %l6 = ffffffffff7b0000
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 000000ec000000ff
!	%f16 = bb000000 ff2e4da6, %l2 = 00000000638681cb
!	Mem[0000000030081428] = 0b4978ea7900d030
	add	%i2,0x028,%g1
	stda	%f16,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030081428] = a64d78ff790000bb
!	Mem[0000000010001408] = 1c1108ff, %l7 = 000000000000007b
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 000000001c1108ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff002eff, %f20 = ffffff25
	lda	[%i6+%o4]0x89,%f20	! %f20 = ff002eff

p0_label_143:
!	%f20 = ff002eff, Mem[0000000010181400] = 00000000
	sta	%f20,[%i6+%g0]0x80	! Mem[0000000010181400] = ff002eff
!	Mem[0000000030081408] = 6300000015ff007a, %l2 = 00000000638681cb
	ldxa	[%i2+%o4]0x81,%l2	! %l2 = 6300000015ff007a
!	Mem[0000000030141408] = ff002eff, %l5 = ffffffffffffec08
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181410] = ffffffff, %l2 = 6300000015ff007a
	lduha	[%i6+%o5]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030041400] = b3a20d4d, %l7 = 000000001c1108ff
	lduha	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000d4d
!	Mem[0000000010101410] = 00000000, %l3 = 000000000000c27b
	lduba	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = a64d2eff, %l2 = 000000000000ffff
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 000000000000a64d
!	Mem[000000001010141c] = 5c801486, %f29 = 632e6006
	ld	[%i4+0x01c],%f29	! %f29 = 5c801486
!	Mem[00000000300c1410] = 5ce6ffff ffffffff, %l4 = 92e7e929, %l5 = 000000ff
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 00000000ffffffff 000000005ce6ffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ff7b0000, %l5 = 000000005ce6ffff
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_144:
!	%l3 = 0000000000000000, Mem[00000000218000c0] = 97ff4263, %asi = 80
	stha	%l3,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00004263
!	Mem[0000000030001410] = a2250000, %l1 = 8d1508e7caaf8497
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 000000a2000000ff
!	%l2 = 000000000000a64d, Mem[0000000030181400] = eb44a2ff
	stha	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = eb44a64d
!	%f20 = ff002eff 0000008d, %l5 = 0000000000000000
!	Mem[0000000030041420] = 7af37f46cb818699
	add	%i1,0x020,%g1
	stda	%f20,[%g1+%l5]ASI_PST16_S ! Mem[0000000030041420] = 7af37f46cb818699
!	Mem[0000000010141408] = 29e9e792, %l2 = 000000000000a64d
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 00000092000000ff
!	%l0 = 000000000000f6cd, Mem[0000000010181400] = ff2e00ff
	stwa	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000f6cd
!	Mem[000000001008140f] = 4d0da2b3, %l0 = 000000000000f6cd
	ldstub	[%i2+0x00f],%l0		! %l0 = 000000b3000000ff
!	%f12 = ffffffb8 afadffea, %l2 = 0000000000000092
!	Mem[0000000010181438] = 998681cb467ff37a
	add	%i6,0x038,%g1
	stda	%f12,[%g1+%l2]ASI_PST32_P ! Mem[0000000010181438] = ffffffb8467ff37a
!	Mem[0000000010041408] = 1a00008d, %l2 = 0000000000000092
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 0000001a000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = eb44a64d, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l3	! %l3 = ffffffffffffa64d

p0_label_145:
!	Mem[0000000030001408] = 638681cb, %l6 = 00000000000000ec
	ldsba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000063
!	Mem[00000000300c1410] = ffffffff, %l5 = 0000000000000000
	ldswa	[%i3+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041408] = 92e7e92900002e63, %f16 = bb000000 ff2e4da6
	ldda	[%i1+%o4]0x81,%f16	! %f16 = 92e7e929 00002e63
!	Mem[00000000300c1408] = ff0000ff, %l1 = 00000000000000a2
	lduwa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ff0000ff
!	Mem[0000000010041410] = a2250000000000bb, %f4  = 00000000 00000000
	ldda	[%i1+%o5]0x88,%f4 	! %f4  = a2250000 000000bb
!	Mem[00000000201c0000] = 866391b2, %l5 = ffffffffffffffff
	ldsba	[%o0+0x001]%asi,%l5	! %l5 = 0000000000000063
!	Mem[0000000010101400] = 00000000, %f9  = 891cc4ff
	ld	[%i4+%g0],%f9 	! %f9 = 00000000
!	Mem[00000000100c143c] = a69086f0, %l4 = 00000000ffffffff
	ldsba	[%i3+0x03e]%asi,%l4	! %l4 = ffffffffffffff86
!	Mem[00000000100c1410] = ff000000, %f3  = ec0848fc
	lda	[%i3+%o5]0x80,%f3 	! %f3 = ff000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c142d] = 6baa20a5, %l3 = ffffffffffffa64d
	ldstub	[%i3+0x02d],%l3		! %l3 = 000000aa000000ff

p0_label_146:
!	%l1 = 00000000ff0000ff, Mem[0000000030081408] = 63000000
	stha	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ff0000
!	Mem[0000000010001408] = 7b000000, %l0 = 00000000000000b3
	swapa	[%i0+%o4]0x80,%l0	! %l0 = 000000007b000000
!	%l7 = 0000000000000d4d, Mem[0000000010001408] = b3000000
	stwa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000d4d
!	%f22 = 86ffffff 7af37f46, Mem[0000000010081408] = 7b8ae225 4d0da2ff
	std	%f22,[%i2+%o4]	! Mem[0000000010081408] = 86ffffff 7af37f46
!	Mem[00000000211c0001] = ffffd30e, %l2 = 000000000000001a
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010041428] = ffffffff, %l1 = 00000000ff0000ff, %asi = 80
	swapa	[%i1+0x028]%asi,%l1	! %l1 = 00000000ffffffff
!	%l1 = 00000000ffffffff, Mem[0000000010101432] = ffffffb8, %asi = 80
	stba	%l1,[%i4+0x032]%asi	! Mem[0000000010101430] = ffffffb8
!	Mem[0000000010141437] = 000000e4, %l7 = 0000000000000d4d
	ldstuba	[%i5+0x037]%asi,%l7	! %l7 = 000000e4000000ff
!	%f6  = 0c264be1 5c801486, Mem[00000000100c1408] = ff007bff 06cee291
	std	%f6 ,[%i3+%o4]	! Mem[00000000100c1408] = 0c264be1 5c801486
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = 8c1aefc95d438f65, %l5 = 0000000000000063
	ldx	[%i0+0x038],%l5		! %l5 = 8c1aefc95d438f65

p0_label_147:
!	Mem[0000000030181400] = eb44a64d, %l4 = ffffffffffffff86
	lduwa	[%i6+%g0]0x89,%l4	! %l4 = 00000000eb44a64d
!	Mem[0000000030001408] = 638681cb 8d00001a, %l2 = 000000ff, %l3 = 000000aa
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 00000000638681cb 000000008d00001a
!	Mem[0000000010041400] = 00000000000044eb, %f22 = 86ffffff 7af37f46
	ldda	[%i1+%g0]0x88,%f22	! %f22 = 00000000 000044eb
!	Mem[00000000300c1410] = ffffffff, %l1 = 00000000ffffffff
	ldsba	[%i3+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041408] = 998681cb8d0000ff, %f24 = 4d976b1e 00000000
	ldda	[%i1+%o4]0x88,%f24	! %f24 = 998681cb 8d0000ff
!	Mem[0000000030001408] = cb818663, %l0 = 000000007b000000
	lduha	[%i0+%o4]0x89,%l0	! %l0 = 0000000000008663
!	Mem[0000000030041410] = ff7b0000bbffffff, %l2 = 00000000638681cb
	ldxa	[%i1+%o5]0x81,%l2	! %l2 = ff7b0000bbffffff
!	Mem[0000000010001438] = 8c1aefc9, %l1 = ffffffffffffffff
	lduba	[%i0+0x038]%asi,%l1	! %l1 = 000000000000008c
!	Mem[0000000030141408] = ff002eff, %l1 = 000000000000008c
	lduba	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = f6cde95e, %l3 = 000000008d00001a
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 00000000f6cde95e

p0_label_148:
!	Mem[0000000010141400] = 49002e63, %l7 = 00000000000000e4
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 00000049000000ff
!	Mem[0000000010101400] = 00000000, %l7 = 0000000000000049
	ldstuba	[%i4+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = ff7b0000, %l3 = 00000000f6cde95e
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ff7b0000
!	%l2 = ff7b0000bbffffff, Mem[00000000300c1408] = ff0000ff11000000
	stxa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff7b0000bbffffff
!	%l5 = 8c1aefc95d438f65, Mem[0000000010041400] = eb440000
	stb	%l5,[%i1+%g0]		! Mem[0000000010041400] = 65440000
!	%l5 = 8c1aefc95d438f65, Mem[0000000010001410] = 000000001e6b7bc2
	stxa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 8c1aefc95d438f65
!	Mem[0000000030141410] = 00000000, %l2 = ff7b0000bbffffff
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = 0c264be1, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 0000000c000000ff
!	%l3 = 00000000ff7b0000, Mem[0000000030141400] = 29e9e792
	stha	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 29e90000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 63000000, %l5 = 8c1aefc95d438f65
	ldsha	[%i6+%o5]0x80,%l5	! %l5 = 0000000000006300

p0_label_149:
!	Mem[0000000010101408] = 291a000000000000, %f12 = ffffffb8 afadffea
	ldda	[%i4+%o4]0x88,%f12	! %f12 = 291a0000 00000000
!	Mem[000000001018143c] = 467ff37a, %l7 = 000000000000000c
	lduwa	[%i6+0x03c]%asi,%l7	! %l7 = 00000000467ff37a
!	%l6 = 0000000000000063, immed = 000007f9, %y  = 00000000
	umul	%l6,0x7f9,%l5		! %l5 = 000000000003154b, %y = 00000000
!	Mem[000000001008143c] = cb818699, %l2 = 0000000000000000
	ldsba	[%i2+0x03e]%asi,%l2	! %l2 = ffffffffffffff86
!	Mem[0000000010101400] = 000000ff, %f13 = 00000000
	lda	[%i4+%g0]0x88,%f13	! %f13 = 000000ff
!	Mem[0000000030101410] = ffff0000, %l5 = 000000000003154b
	ldswa	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffff0000
!	Mem[00000000100c1408] = e14b26ff, %l3 = 00000000ff7b0000
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[000000001008143c] = cb818699, %l1 = 00000000000000ff
	ldub	[%i2+0x03d],%l1		! %l1 = 0000000000000081
!	Mem[0000000010001400] = 63000000 15ff0000, %l4 = eb44a64d, %l5 = ffff0000
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 0000000015ff0000 0000000063000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000015ff0000, Mem[0000000010181410] = 6300000025ffffff
	stxa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000015ff0000

p0_label_150:
!	%l5 = 0000000063000000, Mem[0000000030101410] = 0000ffff
	stwa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 63000000
!	Mem[0000000010041410] = bb000000000025a2, %l1 = 0000000000000081, %l2 = ffffffffffffff86
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = bb000000000025a2
!	%l7 = 00000000467ff37a, Mem[0000000030141410] = ff000000
	stwa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 467ff37a
!	Mem[0000000030101400] = 7bc28a7b, %l7 = 00000000467ff37a
	swapa	[%i4+%g0]0x81,%l7	! %l7 = 000000007bc28a7b
!	%l3 = ffffffffffffffff, Mem[0000000020800001] = 2e63a29f, %asi = 80
	stba	%l3,[%o1+0x001]%asi	! Mem[0000000020800000] = 2effa29f
!	Mem[0000000010181400] = cdf60000, %l4 = 0000000015ff0000
	lduba	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000cd
!	%f18 = 5ee971aa 92e7e929, Mem[0000000010181410] = 00000000 0000ff15
	stda	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = 5ee971aa 92e7e929
!	%l2 = bb000000000025a2, Mem[0000000010081428] = 06cee291
	sth	%l2,[%i2+0x028]		! Mem[0000000010081428] = 25a2e291
!	%l6 = 0000000000000063, Mem[0000000010041410] = a2250000000000bb
	stxa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000063
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = 004c9c17, %l6 = 0000000000000063
	ldub	[%o3+0x080],%l6		! %l6 = 0000000000000000

p0_label_151:
!	Mem[00000000300c1408] = ff7b0000bbffffff, %f4  = a2250000 000000bb
	ldda	[%i3+%o4]0x81,%f4 	! %f4  = ff7b0000 bbffffff
!	Mem[0000000010041408] = 8d0000ff, %l1 = 0000000000000081
	ldswa	[%i1+%o4]0x88,%l1	! %l1 = ffffffff8d0000ff
!	Mem[0000000010001420] = 74e60000 ffffffff, %l4 = 000000cd, %l5 = 63000000
	ldd	[%i0+0x020],%l4		! %l4 = 0000000074e60000 00000000ffffffff
!	Mem[0000000010101408] = 0000000000001a29, %f10 = ffff868c 1d2ce65c
	ldda	[%i4+%o4]0x80,%f10	! %f10 = 00000000 00001a29
!	Mem[0000000010181408] = ff7b0000, %l7 = 000000007bc28a7b
	lduha	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = 467ff37a, %l1 = ffffffff8d0000ff
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000046
!	Mem[0000000030101400] = 467ff37a, %l1 = 0000000000000046
	ldsha	[%i4+%g0]0x81,%l1	! %l1 = 000000000000467f
!	Mem[0000000010141400] = ff002e63 7900d030, %l6 = 00000000, %l7 = 00000000
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 00000000ff002e63 000000007900d030
!	Mem[0000000010101410] = 0000000000000000, %l0 = 0000000000008663
	ldxa	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f20 = ff002eff 0000008d, Mem[0000000010101410] = 00000000 00000000
	stda	%f20,[%i4+0x010]%asi	! Mem[0000000010101410] = ff002eff 0000008d

p0_label_152:
!	Mem[0000000010101410] = ff002eff, %l5 = 00000000ffffffff
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 00000000ff002eff
!	Mem[0000000030141410] = 7af37f46, %l2 = bb000000000025a2
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 00000046000000ff
!	%l6 = ff002e63, %l7 = 7900d030, Mem[0000000010101410] = ffffffff 8d000000
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = ff002e63 7900d030
!	%f30 = 7af37f46 29e9e792, Mem[00000000100c1408] = ff264be1 5c801486
	stda	%f30,[%i3+%o4]0x80	! Mem[00000000100c1408] = 7af37f46 29e9e792
!	Mem[0000000010101400] = 000000ff, %l6 = 00000000ff002e63
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000046, %l3 = ffffffff, Mem[0000000030041400] = 4d0da2b3 5ee971aa
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000046 ffffffff
!	%f25 = 8d0000ff, Mem[0000000030141408] = ff2e00ff
	sta	%f25,[%i5+%o4]0x81	! Mem[0000000030141408] = 8d0000ff
!	Mem[00000000100c1408] = 467ff37a, %l7 = 000000007900d030
	swapa	[%i3+%o4]0x88,%l7	! %l7 = 00000000467ff37a
!	%l0 = 0000000000000000, Mem[0000000030181408] = ff002eff
	stba	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = ff002e00
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 4da644eb, %l7 = 00000000467ff37a
	lduha	[%i6+%g0]0x81,%l7	! %l7 = 0000000000004da6

p0_label_153:
!	Mem[0000000020800000] = 2effa29f, %l5 = 00000000ff002eff
	ldsb	[%o1+0x001],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010041430] = bb000000, %l5 = ffffffffffffffff
	ldsha	[%i1+0x032]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = 99000000, %l4 = 0000000074e60000
	ldsha	[%i2+%g0]0x81,%l4	! %l4 = ffffffffffff9900
!	Mem[0000000030081410] = a64d2eff, %l1 = 000000000000467f
	ldswa	[%i2+%o5]0x81,%l1	! %l1 = ffffffffa64d2eff
!	Mem[00000000300c1400] = ffc20000, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101410] = 00000063, %l4 = ffffffffffff9900
	lduba	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 65440000, %l6 = 00000000000000ff
	ldsha	[%i1+%g0]0x80,%l6	! %l6 = 0000000000006544
!	Mem[0000000030001408] = cb818663, %l4 = 0000000000000000
	lduha	[%i0+%o4]0x89,%l4	! %l4 = 0000000000008663
!	Mem[0000000010001410] = 8c1aefc9 5d438f65, %l6 = 00006544, %l7 = 00004da6
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 000000005d438f65 000000008c1aefc9
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ffffff86, %l4 = 0000000000008663
	swapa	[%i2+%o4]0x88,%l4	! %l4 = 00000000ffffff86

p0_label_154:
!	Mem[0000000010101410] = 632e00ff, %l2 = 00000046, %l7 = 8c1aefc9
	add	%i4,0x10,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 00000000632e00ff
!	Mem[00000000300c1408] = 00007bff, %l5 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 0000000000007bff
!	%l5 = 0000000000007bff, Mem[0000000010041437] = 0000c27b, %asi = 80
	stba	%l5,[%i1+0x037]%asi	! Mem[0000000010041434] = 0000c2ff
!	%f16 = 92e7e929 00002e63 5ee971aa 92e7e929
!	%f20 = ff002eff 0000008d 00000000 000044eb
!	%f24 = 998681cb 8d0000ff 06cee291 8a000000
!	%f28 = 25e28a7b 5c801486 7af37f46 29e9e792
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	Mem[0000000010141400] = 632e00ff, %l6 = 000000005d438f65
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 00000000632e00ff
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 0000000000000000
	setx	0xdaa6e797d526e590,%g7,%l0 ! %l0 = daa6e797d526e590
!	%l1 = ffffffffa64d2eff
	setx	0xf7e06bbfb10da85f,%g7,%l1 ! %l1 = f7e06bbfb10da85f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = daa6e797d526e590
	setx	0xc5e6ae1836e65d15,%g7,%l0 ! %l0 = c5e6ae1836e65d15
!	%l1 = f7e06bbfb10da85f
	setx	0x535b0227f66c4c32,%g7,%l1 ! %l1 = 535b0227f66c4c32
!	Mem[0000000010141410] = 00000000, %l3 = ffffffffffffffff
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (35)
!	%l0 = 36e65d15, %l1 = f66c4c32, Mem[0000000010081400] = 638681cb 0000c27b
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 36e65d15 f66c4c32
!	%l2 = 0000000000000046, Mem[00000000300c1408] = 000000ff
	stba	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000046
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff002e63, %l6 = 00000000632e00ff
	lduba	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000063

p0_label_155:
!	Mem[0000000030041410] = ff7b0000, %f3  = ff000000
	lda	[%i1+%o5]0x81,%f3 	! %f3 = ff7b0000
!	Mem[0000000010041408] = 8d0000ff, %l3 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141400] = 29e90000, %l0 = c5e6ae1836e65d15
	lduha	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 5ee9cdf6, %l3 = ffffffffffffffff
	lduha	[%i3+%g0]0x88,%l3	! %l3 = 000000000000cdf6
!	Mem[0000000010081400] = 36e65d15, %l3 = 000000000000cdf6
	ldsba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000036
!	Mem[0000000030001408] = 1a00008dcb818663, %l5 = 0000000000007bff
	ldxa	[%i0+%o4]0x89,%l5	! %l5 = 1a00008dcb818663
!	Mem[00000000300c1408] = ffffffbb00000046, %l6 = 0000000000000063
	ldxa	[%i3+%o4]0x89,%l6	! %l6 = ffffffbb00000046
!	Mem[0000000030001408] = 1a00008dcb818663, %f0  = ff000000 86630000
	ldda	[%i0+%o4]0x89,%f0 	! %f0  = 1a00008d cb818663
!	%l0 = 0000000000000000, immd = 000000000000020c, %l4 = 00000000ffffff86
	udivx	%l0,0x20c,%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000046, %l3 = 00000036, Mem[00000000100c1408] = 7900d030 92e7e929
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000046 00000036

p0_label_156:
!	%l6 = ffffffbb00000046, Mem[0000000010001400] = 15ff0000
	stba	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 15ff0046
!	%l4 = 00000000, %l5 = cb818663, Mem[0000000030181410] = ffffffff 00000000
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 cb818663
!	Mem[00000000100c1408] = 46000000, %l3 = 00000036, %l6 = 00000046
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 0000000046000000
!	%l0 = 00000000, %l1 = f66c4c32, Mem[0000000010081410] = 00790000 8d00001a
	stda	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 f66c4c32
!	Mem[00000000100c1400] = 5ee9cdf6, %l7 = 00000000632e00ff
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 000000f6000000ff
!	%l4 = 0000000000000000, imm = fffffffffffffe1e, %l4 = 0000000000000000
	addc	%l4,-0x1e2,%l4		! %l4 = fffffffffffffe1e
!	%l5 = 1a00008dcb818663, Mem[0000000010001408] = 00000d4d
	stha	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 00008663
!	Mem[00000000100c1408] = 00000046, %l5 = 1a00008dcb818663
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 00000046000000ff
!	Mem[0000000030001400] = 1a00008d, %l7 = 00000000000000f6
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 000000001a00008d
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 632e00ff 86630000, %l6 = 46000000, %l7 = 1a00008d
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000632e00ff 0000000086630000

p0_label_157:
!	Mem[0000000010181408] = 00007bff, %l5 = 0000000000000046
	lduwa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000007bff
!	Mem[00000000201c0000] = 866391b2, %l4 = fffffffffffffe1e
	lduba	[%o0+0x001]%asi,%l4	! %l4 = 0000000000000063
!	Mem[0000000010101410] = 632e00ff, %l5 = 0000000000007bff
	ldswa	[%i4+%o5]0x80,%l5	! %l5 = 00000000632e00ff
!	Mem[00000000300c1408] = 46000000, %f6  = 0c264be1
	lda	[%i3+%o4]0x81,%f6 	! %f6 = 46000000
!	Mem[0000000010101400] = 632e00ff, %l1 = 535b0227f66c4c32
	lduba	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000063
!	Mem[0000000010041410] = 00000063, %f26 = 06cee291
	lda	[%i1+%o5]0x88,%f26	! %f26 = 00000063
!	Mem[0000000010141408] = 29e9e7ff, %l2 = 0000000000000046
	lduba	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l1 = 0000000000000063
	ldsh	[%i4+0x00a],%l1		! %l1 = 0000000000000000
!	Mem[0000000010181400] = cdf60000, %l4 = 0000000000000063
	ldswa	[%i6+%g0]0x80,%l4	! %l4 = ffffffffcdf60000
!	Starting 10 instruction Store Burst
!	%f28 = 25e28a7b 5c801486, Mem[0000000010101400] = ff002e63 00006386
	stda	%f28,[%i4+%g0]0x88	! Mem[0000000010101400] = 25e28a7b 5c801486

p0_label_158:
!	Mem[00000000100c1400] = 5ee9cdff, %l6 = 00000000632e00ff
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[00000000300c1410] = ffffffff
	stha	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffff0000
!	Mem[000000001000143f] = 5d438f65, %l1 = 0000000000000000
	ldstuba	[%i0+0x03f]%asi,%l1	! %l1 = 00000065000000ff
!	Mem[0000000030001400] = f6000000, %l4 = ffffffffcdf60000
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 000000f6000000ff
!	%f7  = 5c801486, Mem[0000000030001408] = cb818663
	sta	%f7 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 5c801486
!	Mem[0000000010101400] = 8614805c, %l0 = 00000000, %l6 = 000000ff
	casa	[%i4]0x80,%l0,%l6	! %l6 = 000000008614805c
!	Mem[0000000030181408] = 002e00ff, %l4 = 00000000000000f6
	ldstuba	[%i6+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141400] = 0000e929, %l7 = 0000000086630000
	ldstuba	[%i5+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010181410] = 92e7e929
	stwa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1414] = 00000000, %l1 = 0000000000000065
	ldsb	[%i3+0x016],%l1		! %l1 = 0000000000000000

p0_label_159:
!	Mem[0000000030181408] = ff002eff, %l3 = 0000000000000036
	ldsba	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101408] = 00000000, %f3  = ff7b0000
	lda	[%i4+%o4]0x88,%f3 	! %f3 = 00000000
!	Mem[0000000030081410] = 8d000000ff2e00ff, %l7 = 0000000000000000
	ldxa	[%i2+%o5]0x89,%l7	! %l7 = 8d000000ff2e00ff
!	Mem[0000000010181408] = ff7b0000, %l4 = 0000000000000000
	lduwa	[%i6+%o4]0x88,%l4	! %l4 = 00000000ff7b0000
!	Mem[0000000030101410] = 00000063, %f23 = 000044eb
	lda	[%i4+%o5]0x81,%f23	! %f23 = 00000063
!	Mem[0000000030001410] = 000025ff, %l2 = 00000000000000ff
	lduwa	[%i0+%o5]0x89,%l2	! %l2 = 00000000000025ff
!	Mem[0000000010081410] = 00000000, %l4 = 00000000ff7b0000
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l4 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = ff00e929eb440000, %l1 = 0000000000000000
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = ff00e929eb440000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 63860000, %l7 = 8d000000ff2e00ff
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 00000063000000ff

p0_label_160:
!	%l6 = 8614805c, %l7 = 00000063, Mem[0000000010081418] = 86ffffff 7af37f46
	stda	%l6,[%i2+0x018]%asi	! Mem[0000000010081418] = 8614805c 00000063
!	%l0 = 00000000, %l1 = eb440000, Mem[0000000030141410] = 7af37fff 00000000
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 eb440000
!	Mem[00000000300c1410] = 0000ffff, %l5 = 00000000632e00ff
	swapa	[%i3+%o5]0x81,%l5	! %l5 = 000000000000ffff
!	%l5 = 000000000000ffff, Mem[0000000010001408] = 00008663
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000ffff
!	Mem[00000000300c1410] = 632e00ff, %l6 = 000000008614805c
	swapa	[%i3+%o5]0x81,%l6	! %l6 = 00000000632e00ff
!	Mem[0000000020800001] = 2effa29f, %l3 = ffffffffffffffff
	ldstub	[%o1+0x001],%l3		! %l3 = 000000ff000000ff
!	%l4 = 00000000, %l5 = 0000ffff, Mem[0000000030181410] = 00000000 638681cb
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 0000ffff
!	Mem[0000000030141400] = ff00e929, %l0 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff00e929
!	%f24 = 998681cb 8d0000ff, %l3 = 00000000000000ff
!	Mem[0000000030081408] = 5ee971aa92e7e929
	add	%i2,0x008,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_S ! Mem[0000000030081408] = 998681cb8d0000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 5ce6ffff 5c801486, %l6 = 632e00ff, %l7 = 00000063
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 000000005c801486 000000005ce6ffff

p0_label_161:
!	Mem[00000000300c1400] = ffc20000000000bb, %l4 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l4	! %l4 = ffc20000000000bb
!	Mem[0000000030001410] = 000025ff, %l3 = 00000000000000ff
	ldswa	[%i0+%o5]0x89,%l3	! %l3 = 00000000000025ff
!	Mem[0000000030141408] = ff00008d, %f20 = ff002eff
	lda	[%i5+%o4]0x89,%f20	! %f20 = ff00008d
!	Mem[0000000010081408] = 000086ff, %l4 = ffc20000000000bb
	ldswa	[%i2+%o4]0x88,%l4	! %l4 = 00000000000086ff
!	Mem[0000000010181410] = 5ee971aa 00000000, %l4 = 000086ff, %l5 = 0000ffff
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000 000000005ee971aa
!	Mem[0000000020800040] = ffff64b8, %l7 = 000000005ce6ffff
	ldsb	[%o1+0x041],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000020800040] = ffff64b8, %l0 = 00000000ff00e929
	ldsb	[%o1+0x040],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010101410] = 632e00ff 30d00079, %l6 = 5c801486, %l7 = ffffffff
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 00000000632e00ff 0000000030d00079
!	Mem[0000000010101400] = 5c801486, %l5 = 000000005ee971aa
	ldsha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000001486
!	Starting 10 instruction Store Burst
!	%l7 = 0000000030d00079, Mem[00000000201c0000] = 866391b2
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 007991b2

p0_label_162:
!	Mem[0000000021800000] = 98ed4ab3, %l6 = 00000000632e00ff
	ldsh	[%o3+%g0],%l6		! %l6 = ffffffffffff98ed
!	%f6  = 46000000 5c801486, Mem[00000000300c1410] = 8614805c ffffe65c
	stda	%f6 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 46000000 5c801486
!	%l0 = ffffffff, %l1 = eb440000, Mem[0000000030041400] = 00000046 ffffffff
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff eb440000
!	Mem[0000000010081408] = ff8600007af37f46, %l0 = ffffffffffffffff, %l2 = 00000000000025ff
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l0,%l2	! %l2 = ff8600007af37f46
!	%f18 = 5ee971aa 92e7e929, Mem[0000000030181410] = 00000000 ffff0000
	stda	%f18,[%i6+%o5]0x81	! Mem[0000000030181410] = 5ee971aa 92e7e929
!	%l0 = ffffffff, %l1 = eb440000, Mem[00000000100c1428] = 00000066 6bff20a5
	stda	%l0,[%i3+0x028]%asi	! Mem[00000000100c1428] = ffffffff eb440000
!	Mem[000000001008141c] = 00000063, %l0 = ffffffffffffffff, %asi = 80
	swapa	[%i2+0x01c]%asi,%l0	! %l0 = 0000000000000063
!	%l2 = ff8600007af37f46, Mem[0000000030081410] = ff2e00ff
	stha	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = ff2e7f46
!	Mem[0000000010081408] = ff860000, %l5 = 0000000000001486
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 00000000ff860000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = ff3ef03225697236, %l4 = 0000000000000000
	ldx	[%i6+0x018],%l4		! %l4 = ff3ef03225697236

p0_label_163:
!	Mem[0000000030001400] = ff000000ffffffff, %l4 = ff3ef03225697236
	ldxa	[%i0+%g0]0x81,%l4	! %l4 = ff000000ffffffff
!	Mem[0000000010041428] = ff0000ff, %f2  = ffff0000
	ld	[%i1+0x028],%f2 	! %f2 = ff0000ff
!	Mem[0000000010101408] = 00000000, %l2 = ff8600007af37f46
	lduwa	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = 00004465, %l0 = 0000000000000063
	ldswa	[%i1+%g0]0x88,%l0	! %l0 = 0000000000004465
!	Mem[00000000211c0000] = ffffd30e, %l0 = 0000000000004465
	ldub	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010141400] = 5d438f65, %l0 = 00000000000000ff
	lduha	[%i5+%g0]0x88,%l0	! %l0 = 0000000000008f65
!	Mem[00000000100c1400] = 5ee9cdff, %l2 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l2	! %l2 = 000000005ee9cdff
!	Mem[00000000100c1408] = ff000000, %l1 = ff00e929eb440000
	ldswa	[%i3+%o4]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[000000001010143c] = 0000ff6b, %l6 = ffffffffffff98ed
	lduwa	[%i4+0x03c]%asi,%l6	! %l6 = 000000000000ff6b
!	Starting 10 instruction Store Burst
!	%f12 = 291a0000, Mem[0000000030101408] = 6386ffff
	sta	%f12,[%i4+%o4]0x81	! Mem[0000000030101408] = 291a0000

p0_label_164:
!	Mem[00000000201c0001] = 007991b2, %l5 = 00000000ff860000
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 00000079000000ff
!	Mem[0000000030001408] = 5c801486, %l6 = 000000000000ff6b
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 000000005c801486
!	Mem[0000000010081400] = 155de636, %l7 = 0000000030d00079
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 00000000155de636
!	Mem[0000000010141410] = 000000ff, %l5 = 0000000000000079
	swapa	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%f7  = 5c801486, Mem[0000000010081408] = 00001486
	sta	%f7 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 5c801486
!	%f2  = ff0000ff, Mem[0000000010041410] = 63000000
	sta	%f2 ,[%i1+%o5]0x80	! Mem[0000000010041410] = ff0000ff
!	Mem[00000000100c1438] = e1fd3fe6, %l1 = ff000000, %l5 = 000000ff
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 00000000e1fd3fe6
!	Mem[0000000020800000] = 2effa29f, %l6 = 000000005c801486
	ldstuba	[%o1+0x000]%asi,%l6	! %l6 = 0000002e000000ff
!	%l1 = ffffffffff000000, Mem[0000000010101424] = 891cc4ff
	stb	%l1,[%i4+0x024]		! Mem[0000000010101424] = 001cc4ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff002eff, %l2 = 000000005ee9cdff
	ldsha	[%i6+%o4]0x89,%l2	! %l2 = 0000000000002eff

p0_label_165:
!	Mem[00000000100c1400] = ffcde95e, %l3 = 00000000000025ff
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141400] = 00000000eb440000, %l1 = ffffffffff000000
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = 00000000eb440000
!	Mem[0000000030081408] = ff00008dcb818699, %f28 = 25e28a7b 5c801486
	ldda	[%i2+%o4]0x89,%f28	! %f28 = ff00008d cb818699
!	Mem[0000000010101410] = ff002e63, %l1 = 00000000eb440000
	ldsba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000063
!	Mem[0000000010081410] = 324c6cf600000000, %f28 = ff00008d cb818699
	ldda	[%i2+%o5]0x88,%f28	! %f28 = 324c6cf6 00000000
!	Mem[0000000010101408] = 00000000, %l6 = 000000000000002e
	ldsba	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l7 = 00000000155de636
	lduha	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 7900d030, %l6 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l6	! %l6 = 000000007900d030
!	Mem[0000000010141410] = 79000000, %l4 = ff000000ffffffff
	ldswa	[%i5+%o5]0x80,%l4	! %l4 = 0000000079000000
!	Starting 10 instruction Store Burst
!	%l0 = 00008f65, %l1 = 00000063, Mem[0000000030101408] = 00001a29 0000ffff
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 00008f65 00000063

p0_label_166:
!	%l6 = 000000007900d030, Mem[00000000201c0000] = 00ff91b2
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = d03091b2
!	%l7 = 0000000000000000, Mem[0000000010041408] = 8d0000ff
	stha	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 8d000000
!	%l7 = 0000000000000000, Mem[0000000021800040] = b7065fe5, %asi = 80
	stha	%l7,[%o3+0x040]%asi	! Mem[0000000021800040] = 00005fe5
!	Mem[000000001018140a] = 00007bff, %l1 = 0000000000000063
	ldstub	[%i6+0x00a],%l1		! %l1 = 0000007b000000ff
!	Mem[00000000201c0000] = d03091b2, %l5 = 00000000e1fd3fe6
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 000000d0000000ff
!	%f0  = 1a00008d, Mem[0000000010001408] = 0000ffff
	sta	%f0 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 1a00008d
!	Mem[00000000100c1400] = ffcde95e, %l0 = 0000000000008f65
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ffcde95e
!	%l6 = 7900d030, %l7 = 00000000, Mem[0000000010181418] = ff3ef032 25697236
	std	%l6,[%i6+0x018]		! Mem[0000000010181418] = 7900d030 00000000
!	Mem[0000000010041400] = 65440000, %l5 = 00000000000000d0
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 0000000065440000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffffffffff0000, %l5 = 0000000065440000
	ldxa	[%i6+%o4]0x88,%l5	! %l5 = ffffffffffff0000

p0_label_167:
!	Mem[0000000010141404] = 7900d030, %l0 = 00000000ffcde95e
	ldsha	[%i5+0x004]%asi,%l0	! %l0 = 0000000000007900
!	Mem[0000000010101408] = 00000000 00001a29, %l6 = 7900d030, %l7 = 00000000
	ldda	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000001a29
!	Mem[0000000030101408] = 658f0000, %l3 = ffffffffffffffff
	lduba	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000065
!	Mem[0000000010041438] = 998681cb, %f8  = 71eb081e
	ld	[%i1+0x038],%f8 	! %f8 = 998681cb
!	Mem[0000000010181420] = 000000ff00000000, %l1 = 000000000000007b
	ldxa	[%i6+0x020]%asi,%l1	! %l1 = 000000ff00000000
!	Mem[0000000030041408] = 92e7e929, %l3 = 0000000000000065
	lduha	[%i1+%o4]0x81,%l3	! %l3 = 00000000000092e7
!	Mem[0000000030041408] = 29e9e792, %l2 = 0000000000002eff
	lduba	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000092
!	Mem[0000000030141400] = 00000000eb440000, %f18 = 5ee971aa 92e7e929
	ldda	[%i5+%g0]0x81,%f18	! %f18 = 00000000 eb440000
!	Mem[0000000010141438] = ff3ef03225697236, %l2 = 0000000000000092
	ldxa	[%i5+0x038]%asi,%l2	! %l2 = ff3ef03225697236
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000092e7, Mem[0000000010101410] = ff002e63
	stwa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 000092e7

p0_label_168:
!	Mem[0000000030181400] = eb44a64d, %l1 = 000000ff00000000
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 0000004d000000ff
!	%f14 = 000000ff 0000ff6b, Mem[0000000010141438] = ff3ef032 25697236
	std	%f14,[%i5+0x038]	! Mem[0000000010141438] = 000000ff 0000ff6b
!	%l4 = 79000000, %l5 = ffff0000, Mem[0000000010181410] = 00000000 aa71e95e
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 79000000 ffff0000
!	%l6 = 00000000, %l7 = 00001a29, Mem[0000000010101438] = 000000ff 0000ff6b
	std	%l6,[%i4+0x038]		! Mem[0000000010101438] = 00000000 00001a29
!	%f31 = 29e9e792, Mem[0000000010141434] = 000000ff
	sta	%f31,[%i5+0x034]%asi	! Mem[0000000010141434] = 29e9e792
!	%l1 = 000000000000004d, Mem[00000000100c1408] = ff000000
	stwa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000004d
!	%l4 = 0000000079000000, Mem[00000000201c0001] = ff3091b2, %asi = 80
	stba	%l4,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff0091b2
!	Mem[0000000010001410] = 658f435d, %l1 = 000000000000004d
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 00000000658f435d
!	%f22 = 00000000 00000063, Mem[0000000010181430] = 06602e63 b8b87568
	std	%f22,[%i6+0x030]	! Mem[0000000010181430] = 00000000 00000063
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 324c6cf630d00079, %l4 = 0000000079000000
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = 324c6cf630d00079

p0_label_169:
!	Mem[0000000030041410] = ffffffbb00007bff, %l1 = 00000000658f435d
	ldxa	[%i1+%o5]0x89,%l1	! %l1 = ffffffbb00007bff
!	Mem[0000000010181428] = 0000008a, %l6 = 0000000000000000
	ldsba	[%i6+0x029]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = 998681cb 8d0000ff, %l2 = 25697236, %l3 = 000092e7
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 00000000998681cb 000000008d0000ff
!	Mem[0000000010181400] = cdf60000 000000bb, %l6 = 00000000, %l7 = 00001a29
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000cdf60000 00000000000000bb
!	Mem[0000000010181410] = 79000000ffff0000, %l2 = 00000000998681cb
	ldxa	[%i6+%o5]0x80,%l2	! %l2 = 79000000ffff0000
!	Mem[0000000010101410] = 000092e7, %l4 = 324c6cf630d00079
	lduha	[%i4+%o5]0x88,%l4	! %l4 = 00000000000092e7
!	Mem[0000000010041408] = 998681cb8d000000, %f14 = 000000ff 0000ff6b
	ldda	[%i1+%o4]0x88,%f14	! %f14 = 998681cb 8d000000
!	Mem[0000000030141408] = 8d0000ff 656d647d, %l0 = 00007900, %l1 = 00007bff
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 000000008d0000ff 00000000656d647d
!	Mem[0000000030181408] = ff2e00ff 00000000, %l2 = ffff0000, %l3 = 8d0000ff
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 00000000ff2e00ff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = ff2e7f46, %l4 = 00000000000092e7
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 00000046000000ff

p0_label_170:
!	Mem[0000000020800041] = ffff64b8, %l1 = 00000000656d647d
	ldstuba	[%o1+0x041]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030001400] = ff000000, %l4 = 0000000000000046
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	%l0 = 000000008d0000ff, Mem[0000000010081400] = 7900d030
	sth	%l0,[%i2+%g0]		! Mem[0000000010081400] = 00ffd030
!	%l3 = 0000000000000000, Mem[00000000300c1410] = 46000000
	stha	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%f4  = ff7b0000 bbffffff, %l4 = 00000000ff000000
!	Mem[0000000010041428] = ff0000ffffffe65c
	add	%i1,0x028,%g1
	stda	%f4,[%g1+%l4]ASI_PST16_P ! Mem[0000000010041428] = ff0000ffffffe65c
!	Mem[0000000010001408] = 8d00001a, %l1 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x008]%asi,%l1	! %l1 = 000000008d00001a
!	%l2 = ff2e00ff, %l3 = 00000000, Mem[0000000010041438] = 998681cb 5d438f65
	stda	%l2,[%i1+0x038]%asi	! Mem[0000000010041438] = ff2e00ff 00000000
!	Mem[0000000030001410] = 000025ff, %l2 = 00000000ff2e00ff
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	%f28 = 324c6cf6, %f27 = 8a000000, %f4  = ff7b0000
	fmuls	%f28,%f27,%f4 		! %l0 = 000000008d000121, Unfinished, %fsr = 0000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 658f000063000000, %f2  = ff0000ff 00000000
	ldda	[%i4+%o4]0x81,%f2 	! %f2  = 658f0000 63000000

p0_label_171:
!	Mem[000000001004140c] = cb818699, %l2 = 00000000000000ff
	ldswa	[%i1+0x00c]%asi,%l2	! %l2 = ffffffffcb818699
!	Mem[0000000010001408] = ff000000, %l4 = 00000000ff000000
	lduba	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = ff0000ff, %l5 = ffffffffffff0000
	lduha	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181410] = 5ee971aa, %l0 = 000000008d000121
	lduwa	[%i6+%o5]0x81,%l0	! %l0 = 000000005ee971aa
!	Mem[0000000030081408] = 998681cb, %l6 = 00000000cdf60000
	ldsba	[%i2+%o4]0x81,%l6	! %l6 = ffffffffffffff99
!	Mem[0000000030041408] = 632e000029e9e792, %l0 = 000000005ee971aa
	ldxa	[%i1+%o4]0x89,%l0	! %l0 = 632e000029e9e792
!	Mem[0000000030041400] = ffffffff, %l6 = ffffffffffffff99
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081410] = 00000000, %l1 = 000000008d00001a
	lduwa	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = ff0000ff 00000000, %l0 = 29e9e792, %l1 = 00000000
	ldd	[%i1+%o5],%l0		! %l0 = 00000000ff0000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 658f435d, %l7 = 00000000000000bb
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 00000065000000ff

p0_label_172:
!	%f12 = 291a0000 000000ff, %l7 = 0000000000000065
!	Mem[0000000030181400] = ffa644eb29e9e792
	stda	%f12,[%i6+%l7]ASI_PST32_SL ! Mem[0000000030181400] = ff00000029e9e792
!	%f2  = 658f0000 63000000, Mem[0000000030141410] = 00000000 eb440000
	stda	%f2 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 658f0000 63000000
!	%l0 = 00000000ff0000ff, Mem[0000000030081408] = ff00008dcb818699
	stxa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000ff0000ff
!	%l7 = 0000000000000065, Mem[0000000010101410] = e792000030d00079
	stxa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000065
!	%l3 = 0000000000000000, Mem[0000000010101434] = afadffea, %asi = 80
	stha	%l3,[%i4+0x034]%asi	! Mem[0000000010101434] = 0000ffea
!	%l6 = ffffffffffffffff, Mem[0000000030141410] = 63000000
	stwa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff
!	%f2  = 658f0000 63000000, %l1 = 0000000000000000
!	Mem[0000000010141428] = 93876adaffa8ff4e
	add	%i5,0x028,%g1
	stda	%f2,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010141428] = 93876adaffa8ff4e
!	%f7  = 5c801486, Mem[0000000010181414] = ffff0000
	sta	%f7 ,[%i6+0x014]%asi	! Mem[0000000010181414] = 5c801486
!	Mem[0000000010141410] = 79000000, %l0 = 00000000ff0000ff
	ldstuba	[%i5+%o5]0x80,%l0	! %l0 = 00000079000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000000, %l1 = 0000000000000000
	ldsba	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_173:
!	Mem[0000000010181400] = cdf60000, %f24 = 998681cb
	lda	[%i6+%g0]0x80,%f24	! %f24 = cdf60000
!	Mem[0000000030001408] = 6bff0000, %l2 = ffffffffcb818699
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = 000000006bff0000
!	Mem[0000000010001424] = ffffffff, %l0 = 0000000000000079
	ldub	[%i0+0x026],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010101400] = 5c801486, %l6 = ffffffffffffffff
	lduba	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000086
!	Mem[0000000010041410] = ff0000ff, %f7  = 5c801486
	lda	[%i1+%o5]0x80,%f7 	! %f7 = ff0000ff
!	Mem[0000000010181410] = 79000000 5c801486, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 0000000079000000 000000005c801486
!	Mem[0000000010081418] = 8614805cffffffff, %f24 = cdf60000 8d0000ff
	ldda	[%i2+0x018]%asi,%f24	! %f24 = 8614805c ffffffff
!	Mem[00000000211c0000] = ffffd30e, %l6 = 0000000000000086
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030101400] = 467ff37a, %l1 = 000000005c801486
	ldsha	[%i4+%g0]0x81,%l1	! %l1 = 000000000000467f
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = ff0000ff, %l5 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l5	! %l5 = 00000000ff0000ff

p0_label_174:
!	Mem[00000000201c0000] = ff0091b2, %l4 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%l2 = 000000006bff0000, Mem[0000000010001400] = 4600ff15
	stwa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 6bff0000
!	%l4 = 00000000000000ff, Mem[0000000030181410] = 5ee971aa
	stwa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff
!	%l1 = 000000000000467f, Mem[00000000218000c0] = 00004263, %asi = 80
	stha	%l1,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 467f4263
!	%f16 = 92e7e929 00002e63, Mem[0000000030181408] = ff2e00ff 00000000
	stda	%f16,[%i6+%o4]0x81	! Mem[0000000030181408] = 92e7e929 00002e63
!	%l0 = 0000000079000000, Mem[0000000010141408] = ffe7e929
	stba	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00e7e929
!	Mem[00000000300c1400] = 0000c2ff, %l6 = 000000000000ffff
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 000000000000c2ff
!	%f16 = 92e7e929, Mem[00000000100c1410] = ff000000
	sta	%f16,[%i3+%o5]0x80	! Mem[00000000100c1410] = 92e7e929
!	%l3 = 0000000000000000, Mem[0000000030101400] = 7af37f46
	stba	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 7af37f00
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 000025ff, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = ffffffffffffffff

p0_label_175:
!	Mem[0000000010101400] = 25e28a7b 5c801486, %l0 = 79000000, %l1 = 0000467f
	ldda	[%i4+%g0]0x88,%l0	! %l0 = 000000005c801486 0000000025e28a7b
!	Mem[0000000030141400] = 00000000 eb440000, %l0 = 5c801486, %l1 = 25e28a7b
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000 00000000eb440000
!	Mem[0000000010081410] = 00000000, %l2 = 000000006bff0000
	ldsha	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 46000000, %l7 = 0000000000000065
	ldsba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000046
!	Mem[0000000010141410] = ff000000, %l6 = 000000000000c2ff
	lduba	[%i5+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181410] = 000000ff, %l5 = 00000000ff0000ff
	ldswa	[%i6+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000021800080] = 004c9c17, %l7 = 0000000000000046
	ldsha	[%o3+0x080]%asi,%l7	! %l7 = 000000000000004c
!	Mem[0000000010101408] = 291a000000000000, %f16 = 92e7e929 00002e63
	ldda	[%i4+%o4]0x88,%f16	! %f16 = 291a0000 00000000
!	Mem[0000000010081400] = 00ffd030 f66c4c32, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 0000000000ffd030 00000000f66c4c32
!	Starting 10 instruction Store Burst
!	%l5 = 00000000f66c4c32, Mem[0000000010041410] = ff000000
	stwa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = f66c4c32

p0_label_176:
!	Mem[00000000100c1408] = 4d000000, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l7 = 000000000000004c, Mem[0000000030181408] = 29e9e792
	stha	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 29e9004c
!	%l3 = ffffffffffffffff, Mem[00000000201c0000] = ff0091b2
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = ffff91b2
!	%l4 = 0000000000ffd030, Mem[00000000100c1408] = ff00004d36000000
	stxa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000ffd030
!	Mem[0000000021800081] = 004c9c17, %l1 = 00000000eb440000
	ldstub	[%o3+0x081],%l1		! %l1 = 0000004c000000ff
!	Mem[0000000010041410] = 324c6cf6, %l1 = 000000000000004c
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 000000f6000000ff
!	Mem[0000000010141408] = 00e7e929cb818699, %l7 = 000000000000004c
	ldxa	[%i5+%o4]0x80,%l7	! %l7 = 00e7e929cb818699
!	%l0 = 0000000000000000, Mem[0000000030181400] = ff000000
	stha	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%f23 = 00000063, Mem[0000000010081400] = 30d0ff00
	sta	%f23,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000063
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1424] = 0effcdf6, %l4 = 0000000000ffd030
	lduba	[%i3+0x025]%asi,%l4	! %l4 = 00000000000000ff

p0_label_177:
!	Mem[0000000030041400] = ffffffff, %l2 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141400] = 00000000 eb440000, %l4 = 000000ff, %l5 = f66c4c32
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000 00000000eb440000
!	Mem[0000000010001410] = 0000004d, %l5 = 00000000eb440000
	ldsha	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 92e7e929, %l1 = 00000000000000f6
	lduba	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000092
!	Mem[0000000010041400] = 000000d0, %l0 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041420] = 92e7e929eb440000, %f6  = 46000000 ff0000ff
	ldd	[%i1+0x020],%f6 	! %f6  = 92e7e929 eb440000
!	Mem[0000000010001438] = 8c1aefc9, %l1 = 0000000000000092
	ldsh	[%i0+0x038],%l1		! %l1 = ffffffffffff8c1a
!	Mem[0000000010101410] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 007ff37a, %l4 = 0000000000000000
	ldsha	[%i4+%g0]0x81,%l4	! %l4 = 000000000000007f
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 46000000, %l6 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 0000000046000000

p0_label_178:
!	Mem[00000000300c1400] = 0000ffff, %l4 = 000000000000007f
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 000000000000ffff
!	%l3 = ffffffffffffffff, Mem[0000000030081400] = 632e000029e9e792
	stxa	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffffffffffff
!	%l0 = 00000000, %l1 = ffff8c1a, Mem[0000000010081410] = 00000000 f66c4c32
	stda	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 ffff8c1a
!	%l6 = 46000000, %l7 = cb818699, Mem[0000000010181418] = 7900d030 00000000
	std	%l6,[%i6+0x018]		! Mem[0000000010181418] = 46000000 cb818699
!	Mem[0000000030101408] = 00008f65, %l4 = 000000000000ffff
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 0000000000008f65
!	Mem[0000000020800001] = ffffa29f, %l1 = ffffffffffff8c1a
	ldstub	[%o1+0x001],%l1		! %l1 = 000000ff000000ff
!	Mem[000000001010142c] = 1d2ce65c, %l3 = ffffffff, %l5 = 00000000
	add	%i4,0x2c,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 000000001d2ce65c
!	%l1 = 00000000000000ff, Mem[0000000030081408] = ff0000ff
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	%f22 = 00000000, Mem[0000000030141408] = ff00008d
	sta	%f22,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 324c6cff, %l6 = 0000000046000000
	ldsha	[%i1+%o5]0x88,%l6	! %l6 = 0000000000006cff

p0_label_179:
!	Mem[0000000030001410] = ff250000, %l5 = 000000001d2ce65c
	ldsba	[%i0+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1408] = 00000000 00ffd030, %l2 = ffffffff, %l3 = ffffffff
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000 0000000000ffd030
!	Mem[0000000010181408] = ffff0000, %l2 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000218001c0] = c1ff67f1, %l3 = 0000000000ffd030
	ldub	[%o3+0x1c0],%l3		! %l3 = 00000000000000c1
!	Mem[0000000010001410] = 0000004d, %f27 = 8a000000
	lda	[%i0+%o5]0x80,%f27	! %f27 = 0000004d
!	Mem[0000000030141400] = 00000000, %l0 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 00000000eb440000, %l7 = 00e7e929cb818699
	ldxa	[%i5+%g0]0x81,%l7	! %l7 = 00000000eb440000
!	Mem[0000000030101410] = 63000000, %f6  = 92e7e929
	lda	[%i4+%o5]0x89,%f6 	! %f6 = 63000000
!	Mem[00000000300c1400] = 0000007f, %l7 = 00000000eb440000
	lduha	[%i3+%g0]0x89,%l7	! %l7 = 000000000000007f
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 0000ffff, %l7 = 000000000000007f
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 000000000000ffff

p0_label_180:
!	%l6 = 00006cff, %l7 = 0000ffff, Mem[0000000010001428] = c4224cff c0b09daa
	stda	%l6,[%i0+0x028]%asi	! Mem[0000000010001428] = 00006cff 0000ffff
!	%l5 = ffffffffffffffff, Mem[0000000030181410] = ff000000
	stha	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = ff00ffff
!	%l6 = 0000000000006cff, Mem[00000000100c1400] = 00008f65
	stha	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 6cff8f65
!	%l0 = 0000000000000000, Mem[0000000010181400] = 0000f6cd
	stha	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[0000000010181408] = 0000007fffffffff, %l5 = ffffffffffffffff, %l6 = 0000000000006cff
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 0000007fffffffff
!	Mem[00000000300c1410] = 00000000, %l7 = 000000000000ffff
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l4 = 00008f65, %l5 = ffffffff, Mem[0000000030101400] = 007ff37a 632e6006
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 00008f65 ffffffff
!	Mem[0000000030001410] = 000025ff, %l3 = 00000000000000c1
	swapa	[%i0+%o5]0x89,%l3	! %l3 = 00000000000025ff
!	%l5 = ffffffffffffffff, Mem[00000000100c1400] = 658fff6c
	stwa	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffffffff 46000000, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 0000000046000000 00000000ffffffff

p0_label_181:
!	Mem[0000000030101408] = 000000630000ffff, %l0 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l0	! %l0 = 000000630000ffff
!	Mem[0000000030001400] = 00000046, %l4 = 0000000000008f65
	lduha	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 00000079, %l5 = ffffffffffffffff
	lduwa	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000079
!	Mem[0000000010181410] = 79000000, %l3 = 00000000000025ff
	ldsha	[%i6+%o5]0x80,%l3	! %l3 = 0000000000007900
!	Mem[0000000010141410] = 000000ff, %l6 = 0000000046000000
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141408] = 00e7e929, %l1 = 00000000000000ff
	lduwa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000e7e929
!	Mem[0000000030041410] = 00007bff, %l6 = 00000000000000ff
	lduha	[%i1+%o5]0x89,%l6	! %l6 = 0000000000007bff
!	Mem[00000000211c0000] = ffffd30e, %l6 = 0000000000007bff
	ldsb	[%o2+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010001400] = 0000ff6b, %l1 = 0000000000e7e929
	lduha	[%i0+%g0]0x88,%l1	! %l1 = 000000000000ff6b
!	Starting 10 instruction Store Burst
!	Mem[0000000010001429] = 00006cff, %l2 = 0000000000000000
	ldstub	[%i0+0x029],%l2		! %l2 = 00000000000000ff

p0_label_182:
!	%l3 = 0000000000007900, Mem[0000000010081400] = 63000000
	stba	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%l2 = 00000000, %l3 = 00007900, Mem[00000000100c1418] = 6596e7f0 0b4978ea
	std	%l2,[%i3+0x018]		! Mem[00000000100c1418] = 00000000 00007900
!	%l0 = 0000ffff, %l1 = 0000ff6b, Mem[0000000030081410] = ff2e7fff 8d000000
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000ffff 0000ff6b
!	%f1  = cb818663, Mem[00000000100c1408] = 00000000
	sta	%f1 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = cb818663
!	%f2  = 658f0000 63000000, %l6 = ffffffffffffffff
!	Mem[0000000030081418] = 00000000000044eb
	add	%i2,0x018,%g1
	stda	%f2,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030081418] = 0000006300008f65
!	%f26 = 00000063 0000004d, Mem[0000000030041400] = ffffffff 000044eb
	stda	%f26,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000063 0000004d
!	%f20 = ff00008d 0000008d, Mem[00000000300c1408] = 00000000 ffffffbb
	stda	%f20,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff00008d 0000008d
!	%l0 = 000000630000ffff, Mem[00000000300c1400] = bb0000000000007f
	stxa	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000630000ffff
!	Mem[00000000300c1400] = 0000ffff, %l6 = ffffffffffffffff
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 000000000000ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffffd30e, %l6 = 000000000000ffff
	ldsba	[%o2+0x001]%asi,%l6	! %l6 = ffffffffffffffff

p0_label_183:
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000030141400] = 00000000 eb440000 00000000 656d647d
!	Mem[0000000030141410] = ffffffff 00008f65 b3a20d4d 25e28a7b
!	Mem[0000000030141420] = fc4808ec 1c11f4d7 6bafd61c 1eb2507e
!	Mem[0000000030141430] = 1e6b974d 66f9bdbc a421ad9c 0caff052
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[00000000300c1410] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141400] = 5d438fff, %l3 = 0000000000007900
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = 000000005d438fff
!	Mem[00000000100c1400] = ffffffff 5ee971aa cb818663 00ffd030
!	Mem[00000000100c1410] = 92e7e929 00000000 00000000 00007900
!	Mem[00000000100c1420] = 92880000 0effcdf6 ffffffff eb440000
!	Mem[00000000100c1430] = 00000000 0000001e e1fd3fe6 a69086f0
	ldda	[%i3]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Mem[00000000300c1408] = 8d0000008d0000ff, %f14 = 998681cb 8d000000
	ldda	[%i3+%o4]0x81,%f14	! %f14 = 8d000000 8d0000ff
!	Mem[0000000010041408] = 8d000000, %l7 = 00000000ffffffff
	ldsba	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181430] = 00000000, %l7 = 0000000000000000
	lduh	[%i6+0x032],%l7		! %l7 = 0000000000000000
!	Mem[00000000211c0000] = ffffd30e, %l4 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000218001c0] = c1ff67f1, %l6 = ffffffffffffffff
	ldsh	[%o3+0x1c0],%l6		! %l6 = ffffffffffffc1ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 92e7e929, %l5 = 00000079, %l1 = 0000ff6b
	add	%i3,0x10,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 0000000092e7e929

p0_label_184:
!	Mem[000000001004142c] = ffffe65c, %l5 = 00000079, %l3 = 5d438fff
	add	%i1,0x2c,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 00000000ffffe65c
	membar	#Sync			! Added by membar checker (37)
!	%l0 = 0000ffff, %l1 = 92e7e929, Mem[0000000030141408] = 00000000 656d647d
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000ffff 92e7e929
!	%l0 = 000000630000ffff, Mem[0000000030101408] = 0000ffff
	stha	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000ffff
!	Mem[00000000100c1408] = cb818663, %l1 = 0000000092e7e929
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 000000cb000000ff
!	%f31 = e63ffde1, Mem[0000000010181410] = 79000000
	sta	%f31,[%i6+%o5]0x80	! Mem[0000000010181410] = e63ffde1
!	%f16 = aa71e95e ffffffff 30d0ff00 638681cb
!	%f20 = 00000000 29e9e792 00790000 00000000
!	%f24 = f6cdff0e 00008892 000044eb ffffffff
!	%f28 = 1e000000 00000000 f08690a6 e63ffde1
	stda	%f16,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	%f4  = ff7b0000, Mem[0000000010181438] = ffffffb8
	st	%f4 ,[%i6+0x038]	! Mem[0000000010181438] = ff7b0000
!	%l0 = 000000630000ffff, Mem[0000000010001422] = 74e60000
	sth	%l0,[%i0+0x022]		! Mem[0000000010001420] = 74e6ffff
!	%l0 = 000000630000ffff, Mem[0000000030001400] = ffffffff46000000
	stxa	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000630000ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 8d000000 8d0000ff, %l6 = ffffc1ff, %l7 = 00000000
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 000000008d000000 000000008d0000ff

p0_label_185:
!	Mem[0000000010141420] = 0000004d 000020a5, %l2 = 000000ff, %l3 = ffffe65c
	ldda	[%i5+0x020]%asi,%l2	! %l2 = 000000000000004d 00000000000020a5
!	Mem[00000000100c1400] = ffffffff, %l0 = 000000630000ffff
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010141418] = ffffffff, %l3 = 00000000000020a5
	lduw	[%i5+0x018],%l3		! %l3 = 00000000ffffffff
!	Mem[0000000010181410] = e1fd3fe6, %l0 = 000000000000ffff
	ldswa	[%i6+%o5]0x88,%l0	! %l0 = ffffffffe1fd3fe6
!	Mem[0000000010041408] = 0000008dcb818699, %f2  = 658f0000 63000000
	ldda	[%i1+%o4]0x80,%f2 	! %f2  = 0000008d cb818699
!	Mem[0000000010001408] = 000000ff, %l3 = 00000000ffffffff
	ldsh	[%i0+0x00a],%l3		! %l3 = 00000000000000ff
!	Mem[00000000100c1410] = 92e7e929, %f15 = 8d0000ff
	lda	[%i3+%o5]0x80,%f15	! %f15 = 92e7e929
!	Mem[00000000100c1428] = ffffffff, %f11 = 00001a29
	ld	[%i3+0x028],%f11	! %f11 = ffffffff
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010101400] = aa71e95e, %l7 = 000000008d0000ff
	ldswa	[%i4+%g0]0x80,%l7	! %l7 = ffffffffaa71e95e
!	Starting 10 instruction Store Burst
!	%f0  = 1a00008d, Mem[0000000030101408] = 0000ffff
	sta	%f0 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 1a00008d

p0_label_186:
!	%l0 = ffffffffe1fd3fe6, Mem[00000000300c1410] = ff000000
	stha	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 3fe60000
!	%l2 = 0000004d, %l3 = 000000ff, Mem[0000000030141410] = ffffffff 00008f65
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000004d 000000ff
!	Mem[0000000010101430] = 1e000000, %l4 = 00000000000000ff
	swap	[%i4+0x030],%l4		! %l4 = 000000001e000000
!	%l1 = 00000000000000cb, Mem[0000000030181408] = 4c00e929
	stba	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = cb00e929
!	%l6 = 000000008d000000, Mem[0000000030081410] = ffff0000
	stwa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 8d000000
!	Mem[0000000030041400] = 0000004d, %l3 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l3	! %l3 = 000000000000004d
!	%f25 = 00008892, Mem[0000000010101400] = aa71e95e
	sta	%f25,[%i4+%g0]0x80	! Mem[0000000010101400] = 00008892
!	%l2 = 000000000000004d, Mem[0000000020800000] = ffffa29f, %asi = 80
	stha	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 004da29f
!	%l0 = e1fd3fe6, %l1 = 000000cb, Mem[0000000010181400] = 00000000 000000bb
	stda	%l0,[%i6+0x000]%asi	! Mem[0000000010181400] = e1fd3fe6 000000cb
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 8614805c, %l7 = ffffffffaa71e95e
	ldsha	[%i2+%o4]0x88,%l7	! %l7 = ffffffffffff805c

p0_label_187:
!	Mem[0000000010041410] = ff6c4c32, %l6 = 000000008d000000
	lduwa	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff6c4c32
!	Mem[00000000300c1410] = 8614805c0000e63f, %f2  = 0000008d cb818699
	ldda	[%i3+%o5]0x89,%f2 	! %f2  = 8614805c 0000e63f
!	Mem[0000000010041428] = ff0000ff, %l1 = 00000000000000cb
	lduwa	[%i1+0x028]%asi,%l1	! %l1 = 00000000ff0000ff
!	Mem[0000000010041408] = 0000008d, %l5 = 0000000000000079
	lduwa	[%i1+%o4]0x80,%l5	! %l5 = 000000000000008d
!	Mem[00000000300c1400] = 00000063ffffffff, %f24 = f6cdff0e 00008892
	ldda	[%i3+%g0]0x89,%f24	! %f24 = 00000063 ffffffff
!	Mem[0000000010001410] = 4d000000, %l6 = 00000000ff6c4c32
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081420] = 00000000, %l6 = 0000000000000000
	ldsh	[%i2+0x020],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041408] = 632e000029e9e792, %f30 = f08690a6 e63ffde1
	ldda	[%i1+%o4]0x89,%f30	! %f30 = 632e0000 29e9e792
!	Mem[0000000030081408] = ff000000, %l3 = 000000000000004d
	ldswa	[%i2+%o4]0x81,%l3	! %l3 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 000000c1, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000c1

p0_label_188:
!	Mem[0000000030141408] = ffff0000, %l1 = 00000000ff0000ff
	ldstuba	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l6 = 000000c1, %l7 = ffff805c, Mem[0000000010081410] = 00000000 ffff8c1a
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000c1 ffff805c
!	%l1 = 0000000000000000, Mem[0000000010101400] = ffffffff92880000
	stxa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000000
!	%l4 = 1e000000, %l5 = 0000008d, Mem[00000000100c1420] = 92880000 0effcdf6
	stda	%l4,[%i3+0x020]%asi	! Mem[00000000100c1420] = 1e000000 0000008d
!	%f26 = 000044eb ffffffff, %l7 = ffffffffffff805c
!	Mem[0000000010081430] = 6875b8b8632e6006
	add	%i2,0x030,%g1
	stda	%f26,[%g1+%l7]ASI_PST8_P ! Mem[0000000010081430] = 6800b8ebffff6006
!	Mem[0000000020800001] = 004da29f, %l0 = ffffffffe1fd3fe6
	ldstuba	[%o1+0x001]%asi,%l0	! %l0 = 0000004d000000ff
!	%l4 = 000000001e000000, Mem[0000000020800040] = ffff64b8
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = 000064b8
!	Mem[0000000010081408] = 8614805c, %l0 = 000000000000004d
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 000000008614805c
!	%f20 = 00000000 29e9e792, Mem[0000000030001400] = 0000ffff 00000063
	stda	%f20,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 29e9e792
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff00ffff, %l6 = 00000000000000c1
	ldsba	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffffff

p0_label_189:
!	Mem[0000000010141408] = 29e9e700, %f10 = 00000000
	lda	[%i5+%o4]0x88,%f10	! %f10 = 29e9e700
!	Mem[0000000010181408] = 7f000000, %l0 = 000000008614805c
	lduha	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = 00000000 324c6cff, %l4 = 1e000000, %l5 = 0000008d
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 00000000324c6cff 0000000000000000
!	Mem[0000000010001400] = 630000000000ff6b, %l6 = ffffffffffffffff
	ldxa	[%i0+%g0]0x88,%l6	! %l6 = 630000000000ff6b
!	Mem[0000000030141408] = 29e9e792ffff00ff, %l4 = 00000000324c6cff
	ldxa	[%i5+%o4]0x89,%l4	! %l4 = 29e9e792ffff00ff
!	Mem[000000001004140c] = cb818699, %l6 = 630000000000ff6b
	ldsb	[%i1+0x00f],%l6		! %l6 = ffffffffffffff99
!	Mem[00000000100c1408] = ff81866300ffd030, %l4 = 29e9e792ffff00ff
	ldx	[%i3+%o4],%l4		! %l4 = ff81866300ffd030
!	Mem[0000000030141408] = ffff00ff, %l1 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l1	! %l1 = 00000000ffff00ff
!	Mem[00000000100c1408] = 30d0ff00638681ff, %l4 = ff81866300ffd030
	ldxa	[%i3+%o4]0x88,%l4	! %l4 = 30d0ff00638681ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 1a00008d, %l3 = ffffffffff000000
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 0000008d000000ff

p0_label_190:
!	%l2 = 0000004d, %l3 = 0000008d, Mem[0000000030041400] = 000000ff 00000063
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000004d 0000008d
!	%f2  = 8614805c 0000e63f, %l6 = ffffffffffffff99
!	Mem[0000000010181400] = e1fd3fe6000000cb
	stda	%f2,[%i6+%l6]ASI_PST32_P ! Mem[0000000010181400] = e1fd3fe60000e63f
!	Mem[0000000030081410] = 0000008d, %l3 = 000000000000008d
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 0000008d000000ff
!	%l6 = ffffffffffffff99, Mem[0000000030081410] = 000000ff
	stwa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffff99
!	%l5 = 0000000000000000, Mem[0000000030181408] = cb00e929
	stha	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000e929
!	Mem[0000000030181400] = 00000000, %l4 = 30d0ff00638681ff
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000
!	%l3 = 000000000000008d, Mem[0000000030181408] = 0000e929
	stha	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 008de929
!	Mem[0000000010141410] = 000000ff, %l6 = ffffffffffffff99
	ldstuba	[%i5+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%f22 = 00790000, Mem[0000000010001410] = 0000004d
	sta	%f22,[%i0+%o5]0x80	! Mem[0000000010001410] = 00790000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = e1fd3fe6, %f31 = 29e9e792
	lda	[%i6+%o5]0x88,%f31	! %f31 = e1fd3fe6

p0_label_191:
!	Mem[0000000010001408] = ff000000, %l7 = ffffffffffff805c
	lduha	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800140] = ff0064c9, %l7 = 0000000000000000
	ldsh	[%o3+0x140],%l7		! %l7 = ffffffffffffff00
!	Mem[0000000030001400] = 29e9e792, %l7 = ffffffffffffff00
	lduwa	[%i0+%g0]0x89,%l7	! %l7 = 0000000029e9e792
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000030081400] = ffffffff ffffffff ff000000 00000000
!	Mem[0000000030081410] = 99ffffff 6bff0000 00000063 00008f65
!	Mem[0000000030081420] = 998681cb 8d0000ff 06cee291 8a000000
!	Mem[0000000030081430] = 25e28a7b 5c801486 7af37f46 29e9e792
	ldda	[%i2]ASI_BLK_SL,%f16	! Block Load from 0000000030081400
!	Mem[0000000010001410] = 00790000, %l7 = 0000000029e9e792
	lduwa	[%i0+%o5]0x80,%l7	! %l7 = 0000000000790000
!	Mem[0000000021800180] = ff374b9c, %l2 = 000000000000004d
	ldub	[%o3+0x181],%l2		! %l2 = 0000000000000037
!	Mem[0000000030001410] = 00000000, %l1 = 00000000ffff00ff
	lduha	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 29e98d00, %l7 = 0000000000790000
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = 000000ff, %l3 = 000000000000008d
	ldswa	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ffff00ff, %l5 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 000000ff000000ff

p0_label_192:
!	Mem[0000000010081438] = 7af37f46cb818699, %l0 = 0000000000000000, %l3 = 00000000000000ff
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = 7af37f46cb818699
!	Mem[0000000010181408] = 7f000000, %l2 = 0000000000000037
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 000000007f000000
!	%l4 = 0000000000000000, Mem[0000000010101400] = 0000000000000000
	stxa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000000000
!	%l3 = 7af37f46cb818699, Mem[0000000030181410] = ffff00ff
	stba	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 99ff00ff
!	Mem[0000000010041410] = 324c6cff, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 00000000324c6cff
!	%l5 = 00000000000000ff, Mem[0000000030041400] = 0000008d0000004d
	stxa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000000000ff
!	%l4 = 324c6cff, %l5 = 000000ff, Mem[0000000010081420] = 00000000 ff000000
	std	%l4,[%i2+0x020]		! Mem[0000000010081420] = 324c6cff 000000ff
!	%l7 = 0000000000000000, Mem[0000000021800040] = 00005fe5, %asi = 80
	stha	%l7,[%o3+0x040]%asi	! Mem[0000000021800040] = 00005fe5
!	Mem[0000000030001408] = 0000ff6b, %l4 = 00000000324c6cff
	swapa	[%i0+%o4]0x89,%l4	! %l4 = 000000000000ff6b
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = e63ffde1, %l2 = 000000007f000000
	ldsha	[%i6+%o5]0x80,%l2	! %l2 = ffffffffffffe63f

p0_label_193:
!	Mem[0000000030041408] = 92e7e929, %l0 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l0	! %l0 = 00000000000092e7
!	Mem[0000000010141400] = ff8f435d, %l6 = 00000000000000ff
	ldsba	[%i5+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = 92e7e929, %l6 = ffffffffffffffff
	lduwa	[%i0+%g0]0x81,%l6	! %l6 = 0000000092e7e929
!	Mem[0000000010141428] = 93876ada, %l5 = 00000000000000ff
	ldub	[%i5+0x029],%l5		! %l5 = 0000000000000087
!	Mem[0000000030101400] = 00008f65ffffffff, %l4 = 000000000000ff6b
	ldxa	[%i4+%g0]0x81,%l4	! %l4 = 00008f65ffffffff
!	Mem[0000000010181408] = 37000000, %l4 = 00008f65ffffffff
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000037
!	Mem[0000000010001408] = 000000ff, %l2 = ffffffffffffe63f
	ldswa	[%i0+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001400] = 6bff0000 00000063, %l4 = 00000037, %l5 = 00000087
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 000000006bff0000 0000000000000063
!	Mem[0000000030081408] = 00000000 000000ff, %l2 = 000000ff, %l3 = cb818699
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 30d0ff00, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 00000030000000ff

p0_label_194:
!	%l6 = 92e7e929, %l7 = 00000000, Mem[0000000010181420] = 000000ff 00000000
	std	%l6,[%i6+0x020]		! Mem[0000000010181420] = 92e7e929 00000000
!	Mem[0000000010181410] = e63ffde15c801486, %l4 = 000000006bff0000, %l3 = 0000000000000030
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = e63ffde15c801486
!	Mem[0000000010101438] = f08690a6e63ffde1, %l3 = e63ffde15c801486, %l4 = 000000006bff0000
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = f08690a6e63ffde1
!	Mem[0000000010141428] = 93876ada, %l5 = 00000063, %l4 = e63ffde1
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 0000000093876ada
!	Mem[000000001004140c] = cb818699, %l0 = 000092e7, %l3 = 5c801486
	add	%i1,0x0c,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 00000000cb818699
!	Mem[0000000010141400] = ff8f435d, %l5 = 0000000000000063
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 00000000ff8f435d
!	%f2  = 8614805c 0000e63f, Mem[00000000100c1408] = ff818663 00ffd030
	stda	%f2 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 8614805c 0000e63f
!	%l5 = 00000000ff8f435d, Mem[0000000030141408] = ffff00ff
	stba	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = ffff005d
!	%f9  = 00000000, Mem[00000000100c1404] = 5ee971aa
	sta	%f9 ,[%i3+0x004]%asi	! Mem[00000000100c1404] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = e1fd3fe6, %l1 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l1	! %l1 = 00000000e1fd3fe6

p0_label_195:
!	Mem[0000000010081408] = 4d000000 7af37f46, %l6 = 92e7e929, %l7 = 00000000
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 000000004d000000 000000007af37f46
!	Mem[0000000030041408] = 92e7e92900002e63, %f16 = ffffffff ffffffff
	ldda	[%i1+%o4]0x81,%f16	! %f16 = 92e7e929 00002e63
!	Mem[0000000030141410] = ff0000004d000000, %l2 = 00000000000000ff
	ldxa	[%i5+%o5]0x89,%l2	! %l2 = ff0000004d000000
!	Mem[0000000030181400] = 638681ff, %l7 = 000000007af37f46
	ldsba	[%i6+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101410] = 00000063, %l4 = 0000000093876ada
	ldswa	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000063
!	Mem[0000000010101410] = 00000000, %l3 = 00000000cb818699
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 99ffffff, %l2 = ff0000004d000000
	lduba	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000099
!	Mem[0000000030101400] = ffffffff 658f0000, %l2 = 00000099, %l3 = 00000000
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 00000000658f0000 00000000ffffffff
!	Mem[00000000100c1408] = 8614805c0000e63f, %f26 = 0000008a 91e2ce06
	ldda	[%i3+%o4]0x80,%f26	! %f26 = 8614805c 0000e63f
!	Starting 10 instruction Store Burst
!	%f2  = 8614805c 0000e63f, Mem[0000000010141408] = 29e9e700 998681cb
	stda	%f2 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 8614805c 0000e63f

p0_label_196:
!	Mem[0000000010101410] = 00000000, %l7 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = ffffffff, %l1 = 00000000e1fd3fe6
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	%l4 = 0000000000000063, Mem[0000000010101438] = f08690a6e63ffde1, %asi = 80
	stxa	%l4,[%i4+0x038]%asi	! Mem[0000000010101438] = 0000000000000063
!	Mem[00000000300c1408] = 8d000000, %l6 = 000000004d000000
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 0000008d000000ff
!	%l0 = 000092e7, %l1 = ffffffff, Mem[0000000010181410] = e63ffde1 5c801486
	stda	%l0,[%i6+0x010]%asi	! Mem[0000000010181410] = 000092e7 ffffffff
!	%l6 = 0000008d, %l7 = 00000000, Mem[0000000010181428] = 0000008a 91e2ce06
	stda	%l6,[%i6+0x028]%asi	! Mem[0000000010181428] = 0000008d 00000000
!	%f28 = 8614805c 7b8ae225, Mem[00000000100c1400] = e1fd3fe6 00000000
	stda	%f28,[%i3+%g0]0x80	! Mem[00000000100c1400] = 8614805c 7b8ae225
!	Mem[0000000030141400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%l4 = 0000000000000063, Mem[0000000020800001] = 00ffa29f
	stb	%l4,[%o1+0x001]		! Mem[0000000020800000] = 0063a29f
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 63000000 0000ff6b, %l6 = 0000008d, %l7 = 00000000
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 000000000000ff6b 0000000063000000

p0_label_197:
!	Mem[00000000211c0000] = ffffd30e, %l1 = 00000000ffffffff
	ldsba	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081410] = 99ffffff6bff0000, %l5 = 00000000ff8f435d
	ldxa	[%i2+%o5]0x81,%l5	! %l5 = 99ffffff6bff0000
!	Mem[00000000100c1428] = ffffffff, %l0 = 00000000000092e7
	lduwa	[%i3+0x028]%asi,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010181408] = 37000000, %l4 = 0000000000000063
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = 0000000037000000
!	Mem[0000000030141408] = ffff005d, %l4 = 0000000037000000
	lduba	[%i5+%o4]0x89,%l4	! %l4 = 000000000000005d
!	Mem[0000000010141428] = 93876ada, %l1 = ffffffffffffffff
	ldsba	[%i5+0x02b]%asi,%l1	! %l1 = ffffffffffffffda
!	Mem[0000000010041400] = 000000d0, %l3 = 00000000ffffffff
	ldub	[%i1+0x003],%l3		! %l3 = 00000000000000d0
!	Mem[00000000300c1400] = ffffffff, %f0  = 1a00008d
	lda	[%i3+%g0]0x81,%f0 	! %f0 = ffffffff
!	Mem[0000000030081400] = ffffffff ffffffff, %l2 = 658f0000, %l3 = 000000d0
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 00000000ffffffff 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffffffff, Mem[0000000010041408] = 0000008d
	stba	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = ff00008d

p0_label_198:
!	Mem[0000000010041408] = ff00008d, %l5 = 99ffffff6bff0000
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%f17 = 00002e63, Mem[0000000010081424] = 000000ff
	sta	%f17,[%i2+0x024]%asi	! Mem[0000000010081424] = 00002e63
!	%l1 = ffffffffffffffda, Mem[000000001004141e] = 00007bc2
	stb	%l1,[%i1+0x01e]		! Mem[000000001004141c] = 0000dac2
!	%l5 = 00000000000000ff, Mem[0000000030181408] = 29e98d00
	stha	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 29e900ff
!	%l6 = 000000000000ff6b, Mem[00000000211c0000] = ffffd30e, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff6bd30e
!	Mem[0000000010001410] = 00790000c9ef1a8c, %l7 = 0000000063000000, %l1 = ffffffffffffffda
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = 00790000c9ef1a8c
!	Mem[00000000201c0000] = ffff91b2, %l4 = 000000000000005d
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%f2  = 8614805c, Mem[0000000010081424] = 00002e63
	sta	%f2 ,[%i2+0x024]%asi	! Mem[0000000010081424] = 8614805c
!	Mem[0000000010181400] = e1fd3fe6, %l6 = 000000000000ff6b
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 00000000e1fd3fe6
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 3fe60000, %l3 = 00000000ffffffff
	lduba	[%i3+%o5]0x81,%l3	! %l3 = 000000000000003f

p0_label_199:
!	Mem[0000000030181400] = ff81866329e9e792, %l0 = 00000000ffffffff
	ldxa	[%i6+%g0]0x81,%l0	! %l0 = ff81866329e9e792
!	Mem[0000000010041400] = 000000d0, %l4 = 00000000000000ff
	lduwa	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000d0
!	Mem[0000000010041410] = 0000000000000000, %f14 = 8d000000 92e7e929
	ldda	[%i1+%o5]0x80,%f14	! %f14 = 00000000 00000000
!	Mem[00000000300c1408] = 000000ff, %l5 = 00000000000000ff
	lduba	[%i3+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[000000001010143c] = 00000063, %l2 = 00000000ffffffff
	lduba	[%i4+0x03d]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 1a0000ff, %l4 = 00000000000000d0
	ldsha	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081410] = c1000000, %l7 = 0000000063000000
	lduha	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 37000000, %l0 = ff81866329e9e792
	ldsha	[%i6+%o4]0x80,%l0	! %l0 = 0000000000003700
!	Mem[0000000030081408] = 000000ff, %l1 = 00790000c9ef1a8c
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[000000001008141c] = ffffffff, %l3 = 000000000000003f
	swap	[%i2+0x01c],%l3		! %l3 = 00000000ffffffff

p0_label_200:
!	Mem[0000000010041410] = 00000000, %l0 = 0000000000003700
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010041408] = ff00008d
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	Mem[0000000010001408] = 000000ff, %l5 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101410] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000030181400] = ff818663 29e9e792
	stda	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff 000000ff
!	%f28 = 8614805c 7b8ae225, Mem[0000000010181408] = 37000000 ffffffff
	stda	%f28,[%i6+0x008]%asi	! Mem[0000000010181408] = 8614805c 7b8ae225
!	%f17 = 00002e63, Mem[0000000010041400] = d0000000
	sta	%f17,[%i1+%g0]0x88	! Mem[0000000010041400] = 00002e63
!	Mem[0000000010101410] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030041400] = ff000000, %l2 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff91b2, %l3 = 00000000ffffffff
	ldsb	[%o0+0x001],%l3		! %l3 = ffffffffffffffff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	stxa	%l0,[%i1+0x000]%asi
	stba	%l3,[%i3+0x00c]%asi
	ldda	[%i5+0x018]%asi,%l6
	ldsh	[%i6+0x008],%l6
	nop
	nop
	add	%l2,0x347,%l7
	sdiv	%l4,%l6,%l0
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0

1:	membar	#Sync			! Force all stores to complete


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
	cmp	%l3,%g2			! %l3 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000e1fd3fe6
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
	cmp	%l0,%l1			! %f0  should be ffffffff cb818663
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 8614805c 0000e63f
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ff7b0000 bbffffff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 63000000 eb440000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 998681cb 00000000
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 29e9e700 ffffffff
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 291a0000 000000ff
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000000 00000000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 92e7e929 00002e63
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 000000ff
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 0000ff6b ffffff99
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 658f0000 63000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ff00008d cb818699
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 8614805c 0000e63f
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 8614805c 7b8ae225
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 92e7e929 467ff37a
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
	nop
	fsqrts	%f2 ,%f14
	fdtoi	%f2 ,%f3 
	ldswa	[%i2+%o4]ASI_AS_IF_USER_PRIMARY,%l6	! Mem[0000000010081408]
	done

p0_trap1o:
	nop
	nop
	fsqrts	%f2 ,%f14
	fdtoi	%f2 ,%f3 
	ldswa	[%o2+%i4]ASI_AS_IF_USER_PRIMARY,%l6	! Mem[0000000010081408]
	done


p0_trap2e:
	ldswa	[%i4+%g0]ASI_AS_IF_USER_PRIMARY,%l5	! Mem[0000000010101400]
	smul	%l4,%l6,%l2
	stwa	%l2,[%i2+%o5]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010081410]
	umul	%l2,0xdc9,%l7
	xor	%l1,-0x640,%l5
	fsqrts	%f1 ,%f6 
	fstoi	%f0 ,%f5 
	done

p0_trap2o:
	ldswa	[%o4+%g0]ASI_AS_IF_USER_PRIMARY,%l5	! Mem[0000000010101400]
	smul	%l4,%l6,%l2
	stwa	%l2,[%o2+%i5]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010081410]
	umul	%l2,0xdc9,%l7
	xor	%l1,-0x640,%l5
	fsqrts	%f1 ,%f6 
	fstoi	%f0 ,%f5 
	done


p0_trap3e:
	or	%l1,0x010,%l1
	or	%l0,0x8bd,%l6
	subc	%l0,0xcf7,%l4
	or	%l1,%l6,%l5
	done

p0_trap3o:
	or	%l1,0x010,%l1
	or	%l0,0x8bd,%l6
	subc	%l0,0xcf7,%l4
	or	%l1,%l6,%l5
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
	ldx	[%g1+0x000],%l0		! %l0 = 0ad74513eb776091
	ldx	[%g1+0x008],%l1		! %l1 = 9e3606fa17a36b36
	ldx	[%g1+0x010],%l2		! %l2 = bb3fdf5e3ee319d5
	ldx	[%g1+0x018],%l3		! %l3 = 920d054a36dcb533
	ldx	[%g1+0x020],%l4		! %l4 = b28405939e29de0e
	ldx	[%g1+0x028],%l5		! %l5 = eda29913f5ae3004
	ldx	[%g1+0x030],%l6		! %l6 = adb6129dc93e862e
	ldx	[%g1+0x038],%l7		! %l7 = d0fa46ea7e08e65c

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
	stb	%l7,[%i0+0x022]		! Mem[0000000010001422]
	swap	[%i6+0x00c],%l0		! Mem[000000001018140c]
	jmpl	%o7,%g0
	fmuls	%f4 ,%f15,%f6 
p0_near_0_he:
	stx	%l6,[%i4+0x030]		! Mem[0000000010101430]
	ldsh	[%i0+0x008],%l5		! Mem[0000000010001408]
	fsqrts	%f31,%f23
	jmpl	%o7,%g0
	ldsh	[%i4+0x008],%l6		! Mem[0000000010101408]
near0_b2b_h:
	fcmps	%fcc2,%f29,%f27
	fstoi	%f19,%f22
	fcmps	%fcc2,%f16,%f18
	subc	%l1,%l7,%l5
	jmpl	%o7,%g0
	fmuls	%f26,%f18,%f24
near0_b2b_l:
	fcmps	%fcc1,%f13,%f2 
	fitos	%f14,%f8 
	orn	%l6,%l0,%l3
	umul	%l3,%l6,%l0
	jmpl	%o7,%g0
	fsubs	%f11,%f2 ,%f10
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	ldx	[%i2+0x020],%l6		! Mem[0000000010081420]
	ldsw	[%i3+0x008],%l0		! Mem[00000000100c1408]
	fadds	%f4 ,%f7 ,%f9 
	and	%l5,0x1ba,%l3
	jmpl	%o7,%g0
	umul	%l4,-0x887,%l4
p0_near_1_he:
	ldsb	[%i0+0x029],%l5		! Mem[0000000010001429]
	stw	%l0,[%i6+0x02c]		! Mem[000000001018142c]
	ldd	[%i2+0x010],%f22	! Mem[0000000010081410]
	fadds	%f17,%f16,%f26
	sdivx	%l1,-0x945,%l4
	jmpl	%o7,%g0
	ldub	[%i2+0x001],%l6		! Mem[0000000010081401]
near1_b2b_h:
	fstod	%f19,%f28
	fstoi	%f20,%f23
	orn	%l4,0x5e3,%l1
	or	%l4,-0x50d,%l1
	fstoi	%f19,%f18
	fadds	%f26,%f24,%f20
	jmpl	%o7,%g0
	fdtos	%f20,%f16
near1_b2b_l:
	mulx	%l6,0x796,%l0
	fmuls	%f15,%f13,%f3 
	andn	%l7,-0xd24,%l6
	fcmps	%fcc3,%f9 ,%f4 
	fstoi	%f5 ,%f7 
	udivx	%l7,-0xf3c,%l6
	jmpl	%o7,%g0
	mulx	%l5,%l1,%l1
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	sth	%l6,[%i1+0x032]		! Mem[0000000010041432]
	jmpl	%o7,%g0
	std	%f8 ,[%i6+0x020]	! Mem[0000000010181420]
p0_near_2_he:
	fstod	%f27,%f16
	umul	%l3,0x0f0,%l6
	jmpl	%o7,%g0
	fsubs	%f23,%f27,%f23
near2_b2b_h:
	mulx	%l1,0xb0c,%l4
	fstod	%f27,%f20
	sdivx	%l2,%l3,%l2
	and	%l6,-0x584,%l3
	jmpl	%o7,%g0
	mulx	%l7,0xada,%l4
near2_b2b_l:
	xnor	%l4,0xe58,%l1
	fcmps	%fcc2,%f11,%f1 
	addc	%l7,%l5,%l6
	fstod	%f13,%f0 
	jmpl	%o7,%g0
	fdtoi	%f0 ,%f3 
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	orn	%l7,%l3,%l6
	subc	%l5,0x79b,%l5
	andn	%l4,%l1,%l0
	subc	%l5,%l5,%l5
	add	%l1,0x726,%l4
	andn	%l3,-0x130,%l0
	jmpl	%o7,%g0
	smul	%l0,-0x93a,%l5
p0_near_3_he:
	ldd	[%i3+0x010],%f30	! Mem[00000000100c1410]
	jmpl	%o7,%g0
	and	%l7,%l0,%l2
near3_b2b_h:
	fdtos	%f16,%f21
	xor	%l5,%l1,%l2
	xnor	%l5,0x0cc,%l7
	andn	%l7,-0xedb,%l3
	and	%l1,0xeb3,%l2
	fdivs	%f21,%f18,%f26
	jmpl	%o7,%g0
	fsqrts	%f28,%f31
near3_b2b_l:
	fdtoi	%f0 ,%f13
	andn	%l5,0xf18,%l5
	fadds	%f12,%f3 ,%f1 
	fitod	%f7 ,%f8 
	fdtoi	%f8 ,%f0 
	or	%l5,0x103,%l0
	jmpl	%o7,%g0
	fdtos	%f2 ,%f1 
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	jmpl	%o7,%g0
	ldstub	[%i6+0x003],%l5		! Mem[0000000010181403]
	jmpl	%o7,%g0
	nop
p0_far_0_lem:
	membar	#Sync
	jmpl	%o7,%g0
	ldstub	[%i6+0x003],%l5		! Mem[0000000010181403]
	jmpl	%o7,%g0
	nop
p0_far_0_he:
	udivx	%l6,-0xcdd,%l2
	std	%l4,[%i2+0x030]		! Mem[0000000010081430]
	smul	%l2,%l2,%l2
	sdivx	%l7,%l6,%l0
	ldub	[%i2+0x01c],%l0		! Mem[000000001008141c]
	fitod	%f20,%f30
	subc	%l3,%l4,%l4
	jmpl	%o7,%g0
	and	%l3,%l5,%l1
p0_far_0_hem:
	udivx	%l6,-0xcdd,%l2
	membar	#Sync
	std	%l4,[%i2+0x030]		! Mem[0000000010081430]
	smul	%l2,%l2,%l2
	sdivx	%l7,%l6,%l0
	ldub	[%i2+0x01c],%l0		! Mem[000000001008141c]
	fitod	%f20,%f30
	subc	%l3,%l4,%l4
	jmpl	%o7,%g0
	and	%l3,%l5,%l1
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	jmpl	%o7,%g0
	orn	%l1,0x099,%l6
	jmpl	%o7,%g0
	nop
far0_b2b_l:
	jmpl	%o7,%g0
	sdivx	%l0,0x220,%l6
	jmpl	%o7,%g0
	nop
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	ldsw	[%i6+0x02c],%l0		! Mem[000000001018142c]
	fitod	%f1 ,%f14
	stx	%l0,[%i5+0x008]		! Mem[0000000010141408]
	fmuls	%f8 ,%f9 ,%f11
	fdtoi	%f0 ,%f14
	jmpl	%o7,%g0
	ldsh	[%i6+0x02a],%l3		! Mem[000000001018142a]
p0_far_1_lem:
	membar	#Sync
	ldsw	[%i6+0x02c],%l0		! Mem[000000001018142c]
	fitod	%f1 ,%f14
	stx	%l0,[%i5+0x008]		! Mem[0000000010141408]
	fmuls	%f8 ,%f9 ,%f11
	fdtoi	%f0 ,%f14
	membar	#Sync
	jmpl	%o7,%g0
	ldsh	[%i6+0x02a],%l3		! Mem[000000001018142a]
p0_far_1_he:
	fdtoi	%f16,%f20
	jmpl	%o7,%g0
	fsubs	%f24,%f20,%f17
p0_far_1_hem:
	fdtoi	%f16,%f20
	jmpl	%o7,%g0
	fsubs	%f24,%f20,%f17
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	fdtos	%f28,%f26
	sub	%l0,-0x85a,%l2
	fdtos	%f26,%f18
	fitos	%f23,%f29
	fsqrts	%f18,%f26
	jmpl	%o7,%g0
	fdivs	%f16,%f21,%f31
far1_b2b_l:
	fitos	%f14,%f13
	addc	%l0,0x4a9,%l3
	orn	%l3,-0xb1b,%l6
	fcmps	%fcc1,%f5 ,%f5 
	umul	%l7,0xc76,%l6
	jmpl	%o7,%g0
	udivx	%l6,-0xa9d,%l1
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	jmpl	%o7,%g0
	fitos	%f14,%f7 
	jmpl	%o7,%g0
	nop
p0_far_2_lem:
	jmpl	%o7,%g0
	fitos	%f14,%f7 
	jmpl	%o7,%g0
	nop
p0_far_2_he:
	ldsb	[%i6+0x03b],%l2		! Mem[000000001018143b]
	lduw	[%i6+0x034],%l1		! Mem[0000000010181434]
	swap	[%i6+0x028],%l2		! Mem[0000000010181428]
	jmpl	%o7,%g0
	ldx	[%i2+0x038],%l6		! Mem[0000000010081438]
p0_far_2_hem:
	membar	#Sync
	ldsb	[%i6+0x03b],%l2		! Mem[000000001018143b]
	lduw	[%i6+0x034],%l1		! Mem[0000000010181434]
	swap	[%i6+0x028],%l2		! Mem[0000000010181428]
	membar	#Sync
	jmpl	%o7,%g0
	ldx	[%i2+0x038],%l6		! Mem[0000000010081438]
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	jmpl	%o7,%g0
	sub	%l2,%l5,%l0
	jmpl	%o7,%g0
	nop
far2_b2b_l:
	jmpl	%o7,%g0
	fdivs	%f7 ,%f8 ,%f1 
	jmpl	%o7,%g0
	nop
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	jmpl	%o7,%g0
	fstoi	%f0 ,%f2 
	jmpl	%o7,%g0
	nop
p0_far_3_lem:
	jmpl	%o7,%g0
	fstoi	%f0 ,%f2 
	jmpl	%o7,%g0
	nop
p0_far_3_he:
	and	%l4,0xbe3,%l5
	ldstub	[%i4+0x025],%l1		! Mem[0000000010101425]
	ldstub	[%o1+0x001],%l3		! Mem[0000000020800001]
	stx	%l2,[%i1+0x008]		! Mem[0000000010041408]
	ldsb	[%i6+0x007],%l7		! Mem[0000000010181407]
	sdivx	%l3,%l7,%l4
	ldstub	[%i2+0x01d],%l0		! Mem[000000001008141d]
	jmpl	%o7,%g0
	ldstub	[%i5+0x018],%l3		! Mem[0000000010141418]
p0_far_3_hem:
	and	%l4,0xbe3,%l5
	membar	#Sync
	ldstub	[%i4+0x025],%l1		! Mem[0000000010101425]
	ldstub	[%o1+0x001],%l3		! Mem[0000000020800001]
	stx	%l2,[%i1+0x008]		! Mem[0000000010041408]
	ldsb	[%i6+0x007],%l7		! Mem[0000000010181407]
	sdivx	%l3,%l7,%l4
	ldstub	[%i2+0x01d],%l0		! Mem[000000001008141d]
	membar	#Sync
	jmpl	%o7,%g0
	ldstub	[%i5+0x018],%l3		! Mem[0000000010141418]
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fcmps	%fcc2,%f30,%f26
	xnor	%l0,%l3,%l7
	fsqrts	%f19,%f22
	fstod	%f27,%f22
	sdivx	%l2,%l6,%l5
	jmpl	%o7,%g0
	fstod	%f28,%f22
far3_b2b_l:
	fitos	%f10,%f10
	or	%l1,-0x390,%l6
	mulx	%l4,-0x451,%l1
	sub	%l6,%l0,%l1
	fitod	%f11,%f10
	jmpl	%o7,%g0
	fitod	%f2 ,%f10
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	sth	%l7,[%i2+0x026]		! Mem[0000000010081426]
	ldsb	[%i6+0x003],%l2		! Mem[0000000010181403]
	jmpl	%g6+8,%g0
	fdtoi	%f14,%f14
p0_call_0_le:
	ldsw	[%i4+0x010],%l7		! Mem[0000000010101410]
	std	%f12,[%i5+0x010]	! Mem[0000000010141410]
	retl
	std	%f6 ,[%i1+0x038]	! Mem[0000000010041438]
p0_jmpl_0_lo:
	sth	%l7,[%o2+0x026]		! Mem[0000000010081426]
	ldsb	[%o6+0x003],%l2		! Mem[0000000010181403]
	jmpl	%g6+8,%g0
	fdtoi	%f14,%f14
p0_call_0_lo:
	ldsw	[%o4+0x010],%l7		! Mem[0000000010101410]
	std	%f12,[%o5+0x010]	! Mem[0000000010141410]
	retl
	std	%f6 ,[%o1+0x038]	! Mem[0000000010041438]
p0_jmpl_0_he:
	sub	%l3,%l3,%l6
	xor	%l6,0xb9d,%l2
	stw	%l3,[%i6+0x010]		! Mem[0000000010181410]
	fdivs	%f22,%f21,%f17
	nop
	jmpl	%g6+8,%g0
	sub	%l2,%l2,%l5
p0_call_0_he:
	nop
	nop
	swap	[%i5+0x004],%l3		! Mem[0000000010141404]
	fdtos	%f20,%f26
	swap	[%i4+0x01c],%l5		! Mem[000000001010141c]
	retl
	stb	%l3,[%i1+0x034]		! Mem[0000000010041434]
p0_jmpl_0_ho:
	sub	%l3,%l3,%l6
	xor	%l6,0xb9d,%l2
	stw	%l3,[%o6+0x010]		! Mem[0000000010181410]
	fdivs	%f22,%f21,%f17
	nop
	jmpl	%g6+8,%g0
	sub	%l2,%l2,%l5
p0_call_0_ho:
	nop
	nop
	swap	[%o5+0x004],%l3		! Mem[0000000010141404]
	fdtos	%f20,%f26
	swap	[%o4+0x01c],%l5		! Mem[000000001010141c]
	retl
	stb	%l3,[%o1+0x034]		! Mem[0000000010041434]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	and	%l0,%l7,%l4
	ldub	[%i3+0x006],%l4		! Mem[00000000100c1406]
	jmpl	%g6+8,%g0
	orn	%l0,-0x8dd,%l2
p0_call_1_le:
	fsubs	%f11,%f2 ,%f15
	retl
	fdivs	%f2 ,%f10,%f13
p0_jmpl_1_lo:
	and	%l0,%l7,%l4
	ldub	[%o3+0x006],%l4		! Mem[00000000100c1406]
	jmpl	%g6+8,%g0
	orn	%l0,-0x8dd,%l2
p0_call_1_lo:
	fsubs	%f11,%f2 ,%f15
	retl
	fdivs	%f2 ,%f10,%f13
p0_jmpl_1_he:
	umul	%l6,0x44b,%l2
	jmpl	%g6+8,%g0
	stb	%l5,[%i4+0x02d]		! Mem[000000001010142d]
p0_call_1_he:
	retl
	mulx	%l1,%l6,%l1
p0_jmpl_1_ho:
	umul	%l6,0x44b,%l2
	jmpl	%g6+8,%g0
	stb	%l5,[%o4+0x02d]		! Mem[000000001010142d]
p0_call_1_ho:
	retl
	mulx	%l1,%l6,%l1
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	stx	%l6,[%i2+0x030]		! Mem[0000000010081430]
	mulx	%l0,-0x5e8,%l6
	sth	%l2,[%i6+0x036]		! Mem[0000000010181436]
	umul	%l3,0xf20,%l5
	ldd	[%i4+0x008],%l6		! Mem[0000000010101408]
	ldub	[%i2+0x036],%l3		! Mem[0000000010081436]
	jmpl	%g6+8,%g0
	fitos	%f4 ,%f6 
p0_call_2_le:
	mulx	%l3,-0xa6a,%l2
	stx	%l5,[%i4+0x028]		! Mem[0000000010101428]
	retl
	mulx	%l3,%l1,%l4
p0_jmpl_2_lo:
	stx	%l6,[%o2+0x030]		! Mem[0000000010081430]
	mulx	%l0,-0x5e8,%l6
	sth	%l2,[%o6+0x036]		! Mem[0000000010181436]
	umul	%l3,0xf20,%l5
	ldd	[%o4+0x008],%l6		! Mem[0000000010101408]
	ldub	[%o2+0x036],%l3		! Mem[0000000010081436]
	jmpl	%g6+8,%g0
	fitos	%f4 ,%f6 
p0_call_2_lo:
	mulx	%l3,-0xa6a,%l2
	stx	%l5,[%o4+0x028]		! Mem[0000000010101428]
	retl
	mulx	%l3,%l1,%l4
p0_jmpl_2_he:
	smul	%l7,%l4,%l6
	jmpl	%g6+8,%g0
	and	%l2,%l3,%l6
p0_call_2_he:
	addc	%l5,%l2,%l2
	fsubs	%f19,%f27,%f27
	fsubs	%f18,%f29,%f27
	fadds	%f26,%f22,%f23
	fmuls	%f31,%f31,%f27
	std	%f30,[%i0+0x030]	! Mem[0000000010001430]
	retl
	umul	%l0,-0x7f9,%l4
p0_jmpl_2_ho:
	smul	%l7,%l4,%l6
	jmpl	%g6+8,%g0
	and	%l2,%l3,%l6
p0_call_2_ho:
	addc	%l5,%l2,%l2
	fsubs	%f19,%f27,%f27
	fsubs	%f18,%f29,%f27
	fadds	%f26,%f22,%f23
	fmuls	%f31,%f31,%f27
	std	%f30,[%o0+0x030]	! Mem[0000000010001430]
	retl
	umul	%l0,-0x7f9,%l4
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	jmpl	%g6+8,%g0
	and	%l4,%l5,%l7
p0_call_3_le:
	fitos	%f2 ,%f15
	fstoi	%f11,%f12
	stw	%l5,[%i3+0x03c]		! Mem[00000000100c143c]
	stb	%l0,[%i3+0x019]		! Mem[00000000100c1419]
	sdivx	%l3,0x2ad,%l1
	stb	%l6,[%i5+0x005]		! Mem[0000000010141405]
	retl
	xnor	%l7,%l6,%l7
p0_jmpl_3_lo:
	jmpl	%g6+8,%g0
	and	%l4,%l5,%l7
p0_call_3_lo:
	fitos	%f2 ,%f15
	fstoi	%f11,%f12
	stw	%l5,[%o3+0x03c]		! Mem[00000000100c143c]
	stb	%l0,[%o3+0x019]		! Mem[00000000100c1419]
	sdivx	%l3,0x2ad,%l1
	stb	%l6,[%o5+0x005]		! Mem[0000000010141405]
	retl
	xnor	%l7,%l6,%l7
p0_jmpl_3_he:
	or	%l1,%l7,%l6
	orn	%l3,0x6c0,%l4
	ldd	[%i2+0x008],%l0		! Mem[0000000010081408]
	fsqrts	%f25,%f20
	jmpl	%g6+8,%g0
	fdtoi	%f16,%f16
p0_call_3_he:
	retl
	sth	%l3,[%i4+0x006]		! Mem[0000000010101406]
p0_jmpl_3_ho:
	or	%l1,%l7,%l6
	orn	%l3,0x6c0,%l4
	ldd	[%o2+0x008],%l0		! Mem[0000000010081408]
	fsqrts	%f25,%f20
	jmpl	%g6+8,%g0
	fdtoi	%f16,%f16
p0_call_3_ho:
	retl
	sth	%l3,[%o4+0x006]		! Mem[0000000010101406]
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
	.word	0x0ad74513,0xeb776091		! Init value for %l0
	.word	0x9e3606fa,0x17a36b36		! Init value for %l1
	.word	0xbb3fdf5e,0x3ee319d5		! Init value for %l2
	.word	0x920d054a,0x36dcb533		! Init value for %l3
	.word	0xb2840593,0x9e29de0e		! Init value for %l4
	.word	0xeda29913,0xf5ae3004		! Init value for %l5
	.word	0xadb6129d,0xc93e862e		! Init value for %l6
	.word	0xd0fa46ea,0x7e08e65c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x9fb0139d,0x6c2bbc05		! Init value for %f0 
	.word	0x23c69758,0xfbc4e179		! Init value for %f2 
	.word	0xc6795c11,0x5ee971aa		! Init value for %f4 
	.word	0xd3f3dd7b,0xa7f3ca48		! Init value for %f6 
	.word	0xc7b1dcb7,0xc274f690		! Init value for %f8 
	.word	0x47d5ca66,0xa0213f02		! Init value for %f10
	.word	0x06602e63,0xb8b87568		! Init value for %f12
	.word	0xb5c6943d,0x712c80cc		! Init value for %f14
	.word	0x093a7425,0x3f0daeb3		! Init value for %f16
	.word	0x6851dcab,0x85976a2d		! Init value for %f18
	.word	0x1e88b986,0x9a0231dc		! Init value for %f20
	.word	0x6124bc80,0x49014a1e		! Init value for %f22
	.word	0xf356e200,0x2925597d		! Init value for %f24
	.word	0x8b2a3086,0x6046fe2d		! Init value for %f26
	.word	0xe2bca68a,0x549100c3		! Init value for %f28
	.word	0x89380ba3,0xbeb15203		! Init value for %f30
	.word	0x8267e2e2,0xda42ef45		! Init value for %f32
	.word	0x0385ede2,0x88b9ba49		! Init value for %f34
	.word	0x8f8c56c9,0xd1809569		! Init value for %f36
	.word	0x9760e0c9,0x3064f4a1		! Init value for %f38
	.word	0x0bcaa5d6,0xb5d6e970		! Init value for %f40
	.word	0x7e99763e,0xfaa577a6		! Init value for %f42
	.word	0x85c46f53,0x93bb0530		! Init value for %f44
	.word	0x36781bba,0x8dfe6cbe		! Init value for %f46
	.word	0xda2376e9,0x9bc67829
	.word	0xb2cffcf5,0xcab35db3
	.word	0x906fa457,0x9be1e268
	.word	0xfe534224,0x19bcc54a
	.word	0x04546c48,0x84e6cf17
	.word	0xd20bc357,0xa2d2b9ee
	.word	0xa6ec6b07,0x71b43901
	.word	0x2d908b12,0x7870f93d
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
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xe1fd3fe6
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0xffffffff,0xcb818663
	.word	0x8614805c,0x0000e63f
	.word	0xff7b0000,0xbbffffff
	.word	0x63000000,0xeb440000
	.word	0x998681cb,0x00000000
	.word	0x29e9e700,0xffffffff
	.word	0x291a0000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x92e7e929,0x00002e63
	.word	0x00000000,0x000000ff
	.word	0x0000ff6b,0xffffff99
	.word	0x658f0000,0x63000000
	.word	0xff00008d,0xcb818699
	.word	0x8614805c,0x0000e63f
	.word	0x8614805c,0x7b8ae225
	.word	0x92e7e929,0x467ff37a
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0x6bff0000,0x00000063
	.word	0x000000ff,0xec0848fc
	.word	0x00790000,0xc9ef1a8c
	.word	0xff000000,0x9953fb92
	.word	0x74e6ffff,0xffffffff
	.word	0x00ff6cff,0x0000ffff
	.word	0xd10c0b52,0x91e2ce06
	.word	0x8c1aefc9,0x5d438fff
p0_local0_sec_expect:
	.word	0x92e7e929,0x00000000
	.word	0xff6c4c32,0x8d00001a
	.word	0x00000000,0x000000bb
	.word	0xc27b0000,0x49002e63
	.word	0x000044eb,0x29e9e792
	.word	0x5ce6ffff,0xffffffff
	.word	0x7bc20000,0x000000bb
	.word	0xff2e4da6,0xcb818699
p0_local1_expect:
	.word	0x632e0000,0x00000000
	.word	0x00000000,0xcb818699
	.word	0xff000000,0x00000000
	.word	0x632e0049,0x0000dac2
	.word	0x92e7e929,0xeb440000
	.word	0xff0000ff,0xffffe65c
	.word	0xbb000000,0x0000c2ff
	.word	0xff2e00ff,0x00000000
p0_local1_sec_expect:
	.word	0xff000000,0x00000000
	.word	0x92e7e929,0x00002e63
	.word	0xff7b0000,0xbbffffff
	.word	0x1f2a2090,0x2003b023
	.word	0x7af37f46,0xcb818699
	.word	0xca0edd9d,0x9a0231dc
	.word	0x9e78b45c,0x2ab09a2e
	.word	0x65d22255,0xeb4e74ee
p0_local2_expect:
	.word	0x00000000,0xf66c4c32
	.word	0x4d000000,0x7af37f46
	.word	0x000000c1,0xffff805c
	.word	0x8614805c,0x0000003f
	.word	0x324c6cff,0x8614805c
	.word	0x25a2e291,0x8a000000
	.word	0x6800b8eb,0xffff6006
	.word	0x7af37f46,0xcb818699
p0_local2_sec_expect:
	.word	0xffffffff,0xffffffff
	.word	0xff000000,0x00000000
	.word	0x99ffffff,0x6bff0000
	.word	0x00000063,0x00008f65
	.word	0x998681cb,0x8d0000ff
	.word	0x06cee291,0x8a000000
	.word	0x25e28a7b,0x5c801486
	.word	0x7af37f46,0x29e9e792
p0_local3_expect:
	.word	0x8614805c,0x7b8ae225
	.word	0x8614805c,0x0000e63f
	.word	0x92e7e929,0x00000000
	.word	0x00000000,0x00007900
	.word	0x1e000000,0x0000008d
	.word	0xffffffff,0xeb440000
	.word	0x00000000,0x0000001e
	.word	0xe1fd3fe6,0xa69086f0
p0_local3_sec_expect:
	.word	0xffffffff,0x63000000
	.word	0xff000000,0x8d0000ff
	.word	0x3fe60000,0x5c801486
	.word	0x59fa6577,0xa69bb726
	.word	0xd91532d8,0xeb590511
	.word	0x7cde5fe1,0x35fec18d
	.word	0x97daf2f7,0x2e025c1e
	.word	0x92e7e929,0xeb440000
p0_local4_expect:
	.word	0x00000000,0x00000000
	.word	0xffd0ff00,0x638681cb
	.word	0xff000000,0x29e9e792
	.word	0x00790000,0x00000000
	.word	0xf6cdff0e,0x00008892
	.word	0x000044eb,0xffffffff
	.word	0x000000ff,0x00000000
	.word	0x00000000,0x00000063
p0_local4_sec_expect:
	.word	0x00008f65,0xffffffff
	.word	0xff00001a,0x63000000
	.word	0x00000063,0xb8ffffff
	.word	0x7af381cb,0xcb81df60
	.word	0x0000dcb7,0x3bef019c
	.word	0x00790000,0x17000000
	.word	0xffffffff,0x00000000
	.word	0xe5eef483,0xc27beba5
p0_local5_expect:
	.word	0x00000063,0x7900d030
	.word	0x3fe60000,0x5c801486
	.word	0xff000000,0x25697236
	.word	0xffffffff,0x00000000
	.word	0x0000004d,0x000020a5
	.word	0x93876ada,0xffa8ff4e
	.word	0x000000ff,0x29e9e792
	.word	0x000000ff,0x0000ff6b
p0_local5_sec_expect:
	.word	0xff000000,0xeb440000
	.word	0x5d00ffff,0x92e7e929
	.word	0x0000004d,0x000000ff
	.word	0xb3a20d4d,0x25e28a7b
	.word	0xfc4808ec,0x1c11f4d7
	.word	0x6bafd61c,0x1eb2507e
	.word	0x1e6b974d,0x66f9bdbc
	.word	0xa421ad9c,0x0caff052
p0_local6_expect:
	.word	0x0000ff6b,0x0000e63f
	.word	0x8614805c,0x7b8ae225
	.word	0x000092e7,0xffffffff
	.word	0x46000000,0xcb818699
	.word	0x92e7e929,0x00000000
	.word	0x0000008d,0x00000000
	.word	0x00000000,0x00000063
	.word	0xff7b0000,0x467ff37a
p0_local6_sec_expect:
	.word	0x000000ff,0x000000ff
	.word	0xff00e929,0x00002e63
	.word	0x99ff00ff,0x92e7e929
	.word	0xff000000,0x1d2c86bb
	.word	0x0f6567ff,0xb7dcb1c7
	.word	0x06cee291,0x74a700ff
	.word	0xbb000000,0x1d2c86bb
	.word	0x00790000,0x83783eff
share0_expect:
	.word	0xffff91b2,0xc694ced6
	.word	0x5a0744af,0x71e66490
	.word	0x5bdeee81,0xb905b33f
	.word	0xf7903171,0x21a458eb
	.word	0xc3f8c84d,0x1c7c2a73
	.word	0x61ce61df,0xdcf5c8af
	.word	0xcd88b7e3,0x7b0f07ac
	.word	0xe380d60f,0x38b1eb0b
share1_expect:
	.word	0x0063a29f,0x080b93fe
	.word	0xd18d2ee8,0x30bdf8e4
	.word	0xc6936008,0x7a647288
	.word	0xee46ad9e,0xd25cd087
	.word	0xf0d91154,0xfc903bc1
	.word	0x86627ca9,0xcd002355
	.word	0xfb6f2448,0x15ff516c
	.word	0x3c0167aa,0x4e423099
	.word	0x000064b8,0xa07127b8
	.word	0x6e709aa5,0x923df849
	.word	0x7b678180,0x3ae789a7
	.word	0x610b1ae4,0x5d67964a
	.word	0x67aebca8,0x61d267cc
	.word	0xb83a53fd,0x16657b9e
	.word	0x9155e623,0x5f817a1d
	.word	0x410689c1,0xd2621476
share2_expect:
	.word	0xff6bd30e,0xa35d6f79
	.word	0xe33420eb,0x3070c2e1
	.word	0x530f9873,0xe2ca806a
	.word	0x55cfaa76,0x3ef84eaf
	.word	0x2a069ec0,0x9e97a590
	.word	0x50f56d9d,0x35cc3f43
	.word	0x872a62d8,0x7567d7ed
	.word	0xe671f097,0x591d0db2
share3_expect:
	.word	0x98ed4ab3,0x90fb07da
	.word	0xaf86a1ed,0x51eb880a
	.word	0x46e21384,0x68a897f7
	.word	0x6acc0a88,0x02adec99
	.word	0x5e5fcd02,0x933fe886
	.word	0x6cfafc37,0x8fde1600
	.word	0xd47eefea,0x28027388
	.word	0x0f9ca1b2,0x4e64c6e7
	.word	0x00005fe5,0xee7b0cc3
	.word	0x22239bfd,0xd31f1512
	.word	0x910fa501,0x7431dc7b
	.word	0xc561da8f,0x749a0f33
	.word	0xd531ca5d,0xf9448d72
	.word	0x96c98103,0x0242a123
	.word	0xef714920,0x3e9d0a2e
	.word	0xe9555365,0x4722fcd7
	.word	0x00ff9c17,0x29f4d6bc
	.word	0xea0ee5c8,0x10d2a995
	.word	0xbaf7ddf7,0xb9781d74
	.word	0xea1d1385,0xf71a5499
	.word	0x327cb400,0xb17442b7
	.word	0x73b8a85d,0x339a8e10
	.word	0x7c9e5b26,0x78bb4930
	.word	0xc4c05035,0x9b065376
	.word	0x467f4263,0x81ba6041
	.word	0x933f9b81,0xd3cdf155
	.word	0x6c2b0707,0x38c5f500
	.word	0x4834be50,0xecc23c30
	.word	0xa1377d44,0x661ab8d4
	.word	0x37240202,0x69d2acff
	.word	0xdeb49744,0x9a8ac715
	.word	0x6346bb38,0xc9bb5a45
	.word	0xfff238be,0x2fb4afe6
	.word	0xcb872fbd,0x037c41d9
	.word	0xa56ecd25,0x57cc2c51
	.word	0x640ce9d2,0xdd40c5c7
	.word	0x10d413a9,0xeba55d77
	.word	0x0c7036a0,0x7fb7d874
	.word	0xe2b96927,0x26f9331d
	.word	0x69eb10d5,0x5ac46dda
	.word	0xff0064c9,0xa1bc29d3
	.word	0xa967c35c,0x12c8efcb
	.word	0x710f22e5,0xbf907558
	.word	0x1b8656de,0x383dafcd
	.word	0x1b05663a,0x3effd992
	.word	0x11955fdc,0xde90a05f
	.word	0x1a3c1310,0x13c8ff82
	.word	0xf36a44c0,0xae2fce39
	.word	0xff374b9c,0xfc52e4f0
	.word	0x20c5bc99,0x07868cfb
	.word	0x2a8606b7,0xa64a2676
	.word	0x79da2192,0x02de633c
	.word	0xe9483708,0x38a01547
	.word	0x7655ccd6,0xefab9147
	.word	0x347784a4,0x02cfb34c
	.word	0xda212725,0x811ba76d
	.word	0xc1ff67f1,0xfb23031b
	.word	0x0a7855b8,0x660a2f09
	.word	0x4ae010c9,0x49020fc5
	.word	0xe5de1142,0x79111047
	.word	0x51390971,0xc65d320f
	.word	0xdfae4ef6,0x8ac8f6cd
	.word	0x7d3a8c20,0x3289181e
	.word	0xd3002e7e,0xa6798c08
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
	.word	0xe6f42c7f,0x9ba89223
	.word	0x00000000,0x00000002
	.word	0xa62e714f,0xe0b14c83
	.word	0x00000000,0x00000003
	.word	0x413a1600,0x3caacf39
	.word	0x00000000,0x00000004
	.word	0x220cf148,0x44bf43c8
	.word	0x00000000,0x00000005
	.word	0x03584960,0x533dced2
	.word	0x00000000,0x00000006
	.word	0x4109f2b7,0x98d20e94
	.word	0x00000000,0x00000007
	.word	0x0c87a858,0x45c597c7
	.word	0x00000000,0x00000008
	.word	0xc4b21e0f,0x82fa7343
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
	.word	0x1d2cec92,0x6063db4a,0x5683e4b8,0xf67ba10b
	.word	0xe135dcd6,0x0efd2b21,0x3b464555,0x9f33e31c
	.word	0x57632275,0x66ebe667,0x743ee3f0,0xc0b09daa
	.word	0xd10c0b52,0x91e2ce06,0xf314cac4,0x5d438f65
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
	.word	0xbb6a2ee2,0x99198d56,0x233725a7,0xf8e4dd65
	.word	0xd6f97851,0x6db26886,0x87e15b2e,0x2478cb45
	.word	0x0b8dd523,0xd3cdb77e,0x567aace1,0x901fd999
	.word	0x847675dd,0x0bf12677,0x29d7805c,0xe14bab79
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
	.word	0x90fdb42c,0xcb818699,0x095261f1,0x961c20f1
	.word	0xa559c885,0x5ea18d08,0x623c33ba,0x41c83ff7
	.word	0x9c23ef3b,0x3d1c1b10,0xe6410c9f,0x9f18c46f
	.word	0xa4a1b84a,0x522a501e,0xa5eb7bc2,0x83f4eee5
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
	.word	0x9b9773c7,0x589f2a62,0xa5791f3d,0xd63a075a
	.word	0x1015bc6b,0xf7cbd5f6,0x1f2a2090,0x2003b023
	.word	0x6f932c63,0xcb162d87,0xca0edd9d,0xe945683f
	.word	0x9e78b45c,0x2ab09a2e,0x65d22255,0xeb4e74ee
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
	.word	0x54f8e292,0x7c576394,0x124c22c4,0xe653fb92
	.word	0xb240fa10,0x7497e7f4,0x8614e7d6,0xabfd260c
	.word	0xa699a4eb,0x3d24279c,0x0b4978ea,0x7605d030
	.word	0x63bc2318,0x492e4da6,0x99de5fd1,0x3bffd309
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
	.word	0xc7edd984,0x5d6ea774,0x1a0998eb,0xccd3b277
	.word	0xb77ac0af,0x656d647d,0x0e2f9683,0x1669a53e
	.word	0xd16d567d,0x8f12e4d7,0x7b7d0855,0x6acd54af
	.word	0x28ade205,0xccc2d45b,0x60df3d69,0xfc78291a
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
	.word	0x19ccea02,0xf53687b6,0x39c25475,0x02b98eca
	.word	0x51617659,0xcd53ece9,0x6596e7f0,0x12f60e0b
	.word	0x9288eca2,0x0e02cdf6,0x39cb3389,0x1faa20a5
	.word	0xe4c5217a,0xf0c08745,0xe1fd3fe6,0xa69086f0
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
	.word	0xdc5afaae,0x96b2a476,0xc01604d4,0xd9356247
	.word	0x80e28c27,0x1fd13a8a,0x59fa6577,0xa69bb726
	.word	0xd91532d8,0xeb590511,0x7cdf71e1,0x35feb250
	.word	0x97daf2f7,0x2e025c1e,0xb90dcab5,0x51895986
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
	.word	0xf40c5b35,0x38fe91a6,0xe454f43d,0x25697236
	.word	0xbac94e3d,0xc326ec5c,0x5d5bcd17,0xeb8d094e
	.word	0x71eb081e,0x891c9711,0x818ee1d5,0x56dd49ba
	.word	0x6318f4d7,0xafad2fea,0xc0a13507,0x2905d94f
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
	.word	0xe22b35ad,0x6f90bd45,0x528ce8a2,0x2761da8e
	.word	0x5294907c,0xcf7458b4,0x34c786ad,0x81f67883
	.word	0x5af94f01,0x8dc144eb,0xc6cc59f6,0x4fbd7843
	.word	0xc9ec9cde,0x06097efa,0xd18db23e,0x2cde44c1
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
	.word	0xc8d0469f,0x703c34d5,0x25a200a2,0x52633e01
	.word	0xef1163af,0x8a13a512,0x8d86c8b7,0x473166a8
	.word	0x92e7e929,0x1dfce0ef,0x93876ada,0xc03fd44e
	.word	0x6021af60,0x62ab149e,0xff3ef032,0xa3d2482a
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
	.word	0xa4b806c6,0x82060db4,0x25b93ce4,0x7af37f46
	.word	0x29e3ceeb,0xda3e788f,0x2fa2864d,0xc7e28a7b
	.word	0xfc4808ec,0x1c11f4d7,0x6bafd61c,0x1eb2507e
	.word	0x1e6b974d,0x66f9bdbc,0xa421ad9c,0x0caff052
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
	.word	0xa3f925a6,0xf3d3a34a,0x566a6b3b,0x4fe85c1d
	.word	0x8c86efc9,0xa7dc3f69,0xe036d385,0xfde5e1cd
	.word	0x4502c60e,0xc47f08b7,0xfe65e7c9,0x306f30e7
	.word	0x446cb572,0x38d18857,0x0056074a,0xb1deda70
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
	.word	0x0167650f,0xabc5237b,0x841aa50a,0x9d115f91
	.word	0xa9824265,0xabc9db2a,0x85db0ade,0xb46bae7b
	.word	0x0a03f51c,0xe9ba5c96,0x6a390148,0x2822295c
	.word	0xe655f2e1,0x830188c8,0x9a276efc,0x85173b9c
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
	.word	0xb45791b2,0xc694ced6,0x5a0744af,0x71e66490
	.word	0x5bdeee81,0xb905b33f,0xf7903171,0x21a458eb
	.word	0xc3f8c84d,0x1c7c2a73,0x61ce61df,0xdcf5c8af
	.word	0xcd88b7e3,0x7b0f07ac,0xe380d60f,0x38b1eb0b
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
	.word	0xab27a29f,0x080b93fe,0xd18d2ee8,0x30bdf8e4
	.word	0xc6936008,0x7a647288,0xee46ad9e,0xd25cd087
	.word	0xf0d91154,0xfc903bc1,0x86627ca9,0xcd002355
	.word	0xfb6f2448,0x15ff516c,0x3c0167aa,0x4e423099
	.word	0xde2464b8,0xa07127b8,0x6e709aa5,0x923df849
	.word	0x7b678180,0x3ae789a7,0x610b1ae4,0x5d67964a
	.word	0x67aebca8,0x61d267cc,0xb83a53fd,0x16657b9e
	.word	0x9155e623,0x5f817a1d,0x410689c1,0xd2621476
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
	.word	0xe7fdd30e,0xa35d6f79,0xe33420eb,0x3070c2e1
	.word	0x530f9873,0xe2ca806a,0x55cfaa76,0x3ef84eaf
	.word	0x2a069ec0,0x9e97a590,0x50f56d9d,0x35cc3f43
	.word	0x872a62d8,0x7567d7ed,0xe671f097,0x591d0db2
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
	.word	0x98ed4ab3,0x90fb07da,0xaf86a1ed,0x51eb880a
	.word	0x46e21384,0x68a897f7,0x6acc0a88,0x02adec99
	.word	0x5e5fcd02,0x933fe886,0x6cfafc37,0x8fde1600
	.word	0xd47eefea,0x28027388,0x0f9ca1b2,0x4e64c6e7
	.word	0xb7725fe5,0xee7b0cc3,0x22239bfd,0xd31f1512
	.word	0x910fa501,0x7431dc7b,0xc561da8f,0x749a0f33
	.word	0xd531ca5d,0xf9448d72,0x96c98103,0x0242a123
	.word	0xef714920,0x3e9d0a2e,0xe9555365,0x4722fcd7
	.word	0x764c9c17,0x29f4d6bc,0xea0ee5c8,0x10d2a995
	.word	0xbaf7ddf7,0xb9781d74,0xea1d1385,0xf71a5499
	.word	0x327cb400,0xb17442b7,0x73b8a85d,0x339a8e10
	.word	0x7c9e5b26,0x78bb4930,0xc4c05035,0x9b065376
	.word	0x97384263,0x81ba6041,0x933f9b81,0xd3cdf155
	.word	0x6c2b0707,0x38c5f500,0x4834be50,0xecc23c30
	.word	0xa1377d44,0x661ab8d4,0x37240202,0x69d2acff
	.word	0xdeb49744,0x9a8ac715,0x6346bb38,0xc9bb5a45
	.word	0x97f238be,0x2fb4afe6,0xcb872fbd,0x037c41d9
	.word	0xa56ecd25,0x57cc2c51,0x640ce9d2,0xdd40c5c7
	.word	0x10d413a9,0xeba55d77,0x0c7036a0,0x7fb7d874
	.word	0xe2b96927,0x26f9331d,0x69eb10d5,0x5ac46dda
	.word	0xb5b364c9,0xa1bc29d3,0xa967c35c,0x12c8efcb
	.word	0x710f22e5,0xbf907558,0x1b8656de,0x383dafcd
	.word	0x1b05663a,0x3effd992,0x11955fdc,0xde90a05f
	.word	0x1a3c1310,0x13c8ff82,0xf36a44c0,0xae2fce39
	.word	0xfd374b9c,0xfc52e4f0,0x20c5bc99,0x07868cfb
	.word	0x2a8606b7,0xa64a2676,0x79da2192,0x02de633c
	.word	0xe9483708,0x38a01547,0x7655ccd6,0xefab9147
	.word	0x347784a4,0x02cfb34c,0xda212725,0x811ba76d
	.word	0x74ac67f1,0xfb23031b,0x0a7855b8,0x660a2f09
	.word	0x4ae010c9,0x49020fc5,0xe5de1142,0x79111047
	.word	0x51390971,0xc65d320f,0xdfae4ef6,0x8ac8f6cd
	.word	0x7d3a8c20,0x3289181e,0xd3002e7e,0xa6798c08
share3_end:
