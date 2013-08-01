/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000_11.s
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
!	Seed = 327144529
!	Riesling can be on
!	1 Thread, 5000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_5000_11.s created on Mar 27, 2009 (14:45:29)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_5000_11 -p 1 -l 5000

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
!	%f0  = c283e86e e7d635e4 ea1cf87a 208d2eac
!	%f4  = 1a3067de 7ee94f88 b666c79b 040c8cd3
!	%f8  = 072ba26e b8edf712 7b2253b1 bc0cfd12
!	%f12 = ba31470f d9e67963 af59bc8e c378bb56
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 7d2ad4b1 0e939dcb 0072d112 b1381bc2
!	%f20 = 997e78ef fc12310c 5768185f 70ba30fa
!	%f24 = cb28dec6 e84b78c6 05453b71 3a6319e2
!	%f28 = 8506dcc4 d2388b98 5a8b134e ab306e6f
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 523626e9 aeba524b 5bb67b92 589e5aab
!	%f36 = 091323f7 a6bf91ec 7c661737 fbd9b243
!	%f40 = 69a99b53 6a7af475 59f9b622 df13d084
!	%f44 = 09993b3c 52444c39 9c6b6e2b 1dc3d44a
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xfd3fc84800000065,%g7,%g1 ! GSR scale = 12, align = 5
	wr	%g1,%g0,%gsr		! GSR = fd3fc84800000065
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000010081410] = 2ac5373a, %l2 = 0b99d64bf4b68827
	lduba	[%i2+%o5]0x80,%l2	! %l2 = 000000000000002a
!	Mem[00000000100c1428] = 78b7ff9c, %l0 = de4369f3, %l2 = 0000002a
	add	%i3,0x28,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 0000000078b7ff9c
!	%l2 = 0000000078b7ff9c, Mem[0000000030001400] = 16f7837d1133e2b2
	stxa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000078b7ff9c
!	Mem[0000000010141434] = 94f993b8, %l5 = 7427b97e74903c02
	ldsba	[%i5+0x034]%asi,%l5	! %l5 = ffffffffffffff94
!	Mem[0000000030181400] = 960de33b, %l7 = 481d4082280c1424
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 00000000960de33b
!	Mem[0000000010001400] = bd96b39fef39bc40, %f2  = ea1cf87a 208d2eac
	ldd	[%i0+%g0],%f2 		! %f2  = bd96b39f ef39bc40
!	%l1 = 464e7f5c1a101ba9, Mem[0000000010041410] = 2b90e949
	stwa	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 1a101ba9
!	Mem[0000000030101400] = 853fdb8f52101836, %l5 = ffffffffffffff94
	ldxa	[%i4+%g0]0x89,%l5	! %l5 = 853fdb8f52101836
!	%f22 = 5768185f, Mem[0000000030041410] = ae591267
	sta	%f22,[%i1+%o5]0x89	! Mem[0000000030041410] = 5768185f
!	Starting 10 instruction Store Burst
!	%f27 = 3a6319e2, Mem[0000000010041410] = 1a101ba9
	sta	%f27,[%i1+%o5]0x88	! Mem[0000000010041410] = 3a6319e2

p0_label_2:
!	%l2 = 0000000078b7ff9c, Mem[0000000010041408] = 10b84a9723c81c5f
	stxa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000078b7ff9c
!	%f12 = ba31470f d9e67963, Mem[0000000030081410] = a1af46dd 72527aae
	stda	%f12,[%i2+%o5]0x81	! Mem[0000000030081410] = ba31470f d9e67963
!	Mem[0000000010081408] = 98541e59, %l7 = 00000000960de33b
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 00000059000000ff
!	Mem[0000000010081410] = 3a37c52a, %l4 = e4adeff25c3d1f67
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 0000002a000000ff
!	Mem[0000000010141400] = 3163d402, %l3 = 463dc82c7d677cb3
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 000000003163d402
!	Mem[0000000010101400] = 1f3ea91b, %l5 = 853fdb8f52101836
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 0000001f000000ff
!	%f10 = 7b2253b1 bc0cfd12, Mem[00000000100c1400] = 69764793 f899c6c9
	stda	%f10,[%i3+%g0]0x88	! Mem[00000000100c1400] = 7b2253b1 bc0cfd12
!	%l1 = 464e7f5c1a101ba9, Mem[000000001014142c] = 27b6813c, %asi = 80
	stha	%l1,[%i5+0x02c]%asi	! Mem[000000001014142c] = 1ba9813c
!	%l0 = de4369f3, %l1 = 1a101ba9, Mem[0000000010101410] = 54ac647d e60fe0ef
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = de4369f3 1a101ba9
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 5030d0b0847b229c, %l1 = 464e7f5c1a101ba9
	ldx	[%i5+%o5],%l1		! %l1 = 5030d0b0847b229c

p0_label_3:
!	Mem[0000000030181408] = c8599bd0, %l5 = 000000000000001f
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = ffffffffffffffd0
!	Mem[0000000030181408] = d09b59c8, %l1 = 5030d0b0847b229c
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000d0
!	Mem[0000000030181400] = 24140c28, %f27 = 3a6319e2
	lda	[%i6+%g0]0x89,%f27	! %f27 = 24140c28
!	Mem[0000000030081410] = 0f4731ba, %l3 = 000000003163d402
	ldswa	[%i2+%o5]0x89,%l3	! %l3 = 000000000f4731ba
!	Mem[0000000010001400] = 40bc39ef 9fb396bd, %l2 = 78b7ff9c, %l3 = 0f4731ba
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 000000009fb396bd 0000000040bc39ef
!	Mem[0000000030101408] = 787bfd2b92ebfe25, %f0  = c283e86e e7d635e4
	ldda	[%i4+%o4]0x81,%f0 	! %f0  = 787bfd2b 92ebfe25
!	Mem[0000000030141400] = 4eef94ba, %l3 = 0000000040bc39ef
	lduwa	[%i5+%g0]0x81,%l3	! %l3 = 000000004eef94ba
!	Mem[00000000100c1408] = 7a0120585d3f8086, %f30 = 5a8b134e ab306e6f
	ldda	[%i3+%o4]0x88,%f30	! %f30 = 7a012058 5d3f8086
!	Mem[0000000030001410] = 404ed407aee84455, %l6 = b020f9604e0927b0
	ldxa	[%i0+%o5]0x89,%l6	! %l6 = 404ed407aee84455
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = e65d7049, %l2 = 000000009fb396bd
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 000000e6000000ff

p0_label_4:
!	%l0 = d513d909de4369f3, Mem[0000000010181408] = 255980c9
	stba	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 255980f3
!	Mem[0000000010041408] = 00000000, %l1 = 00000000000000d0
	swapa	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081418] = d459166f, %l4 = 000000000000002a
	ldstuba	[%i2+0x018]%asi,%l4	! %l4 = 000000d4000000ff
!	%l2 = 00000000000000e6, Mem[0000000010041408] = 000000d0
	stba	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = e60000d0
!	%f16 = 7d2ad4b1 0e939dcb 0072d112 b1381bc2
!	%f20 = 997e78ef fc12310c 5768185f 70ba30fa
!	%f24 = cb28dec6 e84b78c6 05453b71 24140c28
!	%f28 = 8506dcc4 d2388b98 7a012058 5d3f8086
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%f2  = bd96b39f ef39bc40, Mem[00000000100c1408] = 86803f5d 5820017a
	stda	%f2 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = bd96b39f ef39bc40
!	%l2 = 00000000000000e6, Mem[0000000030041408] = 0e897547
	stwa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000e6
!	%l2 = 00000000000000e6, Mem[0000000010181423] = 9117f820, %asi = 80
	stba	%l2,[%i6+0x023]%asi	! Mem[0000000010181420] = 9117f8e6
!	Mem[0000000010001420] = 2a2ba122, %l2 = 00000000000000e6
	lduha	[%i0+0x022]%asi,%l2	! %l2 = 000000000000a122
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 4a221ee9, %f0  = 787bfd2b
	lda	[%i1+%g0]0x88,%f0 	! %f0 = 4a221ee9

p0_label_5:
!	Mem[0000000030141400] = 4eef94ba, %f4  = 1a3067de
	lda	[%i5+%g0]0x81,%f4 	! %f4 = 4eef94ba
!	Mem[0000000010081400] = 01bcb61b, %l3 = 000000004eef94ba
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = 0000000001bcb61b
!	Mem[0000000010181410] = 071a72a4 b3250928, %l2 = 0000a122, %l3 = 01bcb61b
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 00000000071a72a4 00000000b3250928
!	Mem[00000000218001c0] = 3653a57a, %l3 = 00000000b3250928
	lduh	[%o3+0x1c0],%l3		! %l3 = 0000000000003653
!	Mem[00000000100c1410] = a6849e2df8de3811, %l5 = ffffffffffffffd0
	ldxa	[%i3+%o5]0x88,%l5	! %l5 = a6849e2df8de3811
!	Mem[0000000010001408] = 954634d4, %f9  = b8edf712
	lda	[%i0+%o4]0x88,%f9 	! %f9 = 954634d4
!	Mem[00000000100c1400] = 12fd0cbcb153227b, %l0 = d513d909de4369f3
	ldxa	[%i3+0x000]%asi,%l0	! %l0 = 12fd0cbcb153227b
!	Mem[0000000021800000] = 3bd3b994, %l0 = 12fd0cbcb153227b
	lduba	[%o3+0x000]%asi,%l0	! %l0 = 000000000000003b
!	Mem[00000000201c0000] = d0f73e5d, %l3 = 0000000000003653
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffd0f7
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000d4, Mem[0000000030001410] = 5544e8ae
	stba	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = d444e8ae

p0_label_6:
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 000000000000003b
	setx	0xa892a297bd810014,%g7,%l0 ! %l0 = a892a297bd810014
!	%l1 = 0000000000000000
	setx	0x93bd3a47e036488a,%g7,%l1 ! %l1 = 93bd3a47e036488a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a892a297bd810014
	setx	0xcf46866fd398fd9a,%g7,%l0 ! %l0 = cf46866fd398fd9a
!	%l1 = 93bd3a47e036488a
	setx	0xf8219c604acefb03,%g7,%l1 ! %l1 = f8219c604acefb03
!	%l4 = 000000d4, %l5 = f8de3811, Mem[00000000300c1410] = 3f68fe6b 467dbab1
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000d4 f8de3811
!	%f10 = 7b2253b1 bc0cfd12, Mem[0000000010181400] = 49705dff 16b81fe5
	stda	%f10,[%i6+%g0]0x88	! Mem[0000000010181400] = 7b2253b1 bc0cfd12
!	%f10 = 7b2253b1, Mem[0000000010081408] = ff1e5498
	sta	%f10,[%i2+%o4]0x80	! Mem[0000000010081408] = 7b2253b1
!	%l4 = 00000000000000d4, Mem[0000000030141400] = 350d9a23ba94ef4e
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000000000d4
!	%f8  = 072ba26e, Mem[0000000010181400] = 12fd0cbc
	sta	%f8 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 072ba26e
!	%l4 = 00000000000000d4, Mem[0000000020800001] = a3e6779a
	stb	%l4,[%o1+0x001]		! Mem[0000000020800000] = a3d4779a
!	%f18 = 0072d112 b1381bc2, Mem[0000000030101400] = 7d2ad4b1 0e939dcb
	stda	%f18,[%i4+%g0]0x81	! Mem[0000000030101400] = 0072d112 b1381bc2
!	%l5 = a6849e2df8de3811, Mem[0000000030181410] = 0c5abdf8
	stwa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = f8de3811
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = 0c8261be, %l1 = f8219c604acefb03
	ldub	[%i0+0x032],%l1		! %l1 = 0000000000000061

p0_label_7:
!	Mem[00000000100c1414] = 2d9e84a6, %l2 = 00000000071a72a4
	lduh	[%i3+0x014],%l2		! %l2 = 0000000000002d9e
!	Mem[0000000030041408] = e6000000, %f28 = 8506dcc4
	lda	[%i1+%o4]0x81,%f28	! %f28 = e6000000
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030101400] = 0072d112 b1381bc2 0072d112 b1381bc2
!	Mem[0000000030101410] = 997e78ef fc12310c 5768185f 70ba30fa
!	Mem[0000000030101420] = cb28dec6 e84b78c6 05453b71 24140c28
!	Mem[0000000030101430] = 8506dcc4 d2388b98 7a012058 5d3f8086
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[00000000100c1408] = bd96b39f, %l6 = 404ed407aee84455
	ldswa	[%i3+%o4]0x80,%l6	! %l6 = ffffffffbd96b39f
!	Mem[0000000030141408] = 9d3248ea, %l6 = ffffffffbd96b39f
	ldswa	[%i5+%o4]0x89,%l6	! %l6 = ffffffff9d3248ea
!	Mem[0000000010181418] = a10fa8c8, %f19 = b1381bc2
	ld	[%i6+0x018],%f19	! %f19 = a10fa8c8
!	Mem[00000000100c1410] = f8de3811, %f22 = 5768185f
	lda	[%i3+%o5]0x88,%f22	! %f22 = f8de3811
!	Mem[0000000030041400] = 5537419e, %l2 = 0000000000002d9e
	lduba	[%i1+%g0]0x89,%l2	! %l2 = 000000000000009e
!	Mem[0000000010101400] = 1ba93eff, %l5 = a6849e2df8de3811
	lduba	[%i4+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 9fb396bd, %l4 = 00000000000000d4
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 000000009fb396bd

p0_label_8:
!	%l5 = 00000000000000ff, Mem[0000000010081400] = 01bcb61b3648a8d9
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000000000ff
!	%l4 = 000000009fb396bd, Mem[0000000030081408] = de53605b
	stba	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = bd53605b
!	%l7 = 0000000000000059, Mem[0000000030181410] = f8de3811f04a9bbf
	stxa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000059
!	Mem[0000000030141408] = 9d3248ea, %l4 = 000000009fb396bd
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 000000ea000000ff
!	Mem[0000000030041408] = 000000e6, %l0 = cf46866fd398fd9a
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 000000e6000000ff
!	%l5 = 00000000000000ff, Mem[00000000211c0000] = 54b46880, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff6880
!	Mem[0000000030081408] = 5b6053bd, %l4 = 00000000000000ea
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 000000005b6053bd
!	%l3 = ffffffffffffd0f7, Mem[0000000030181410] = 00000000
	stba	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000f7
!	%l4 = 000000005b6053bd, Mem[0000000030001400] = 9cffb778
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 5b6053bd
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 6ea22b07, %l5 = 00000000000000ff
	ldsha	[%i6+%g0]0x88,%l5	! %l5 = 0000000000002b07

p0_label_9:
!	Mem[0000000030181408] = c8599bd0, %l1 = 0000000000000061
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000d0
!	Mem[0000000010101404] = 32dd4be2, %l2 = 000000000000009e
	ldsha	[%i4+0x006]%asi,%l2	! %l2 = 0000000000004be2
!	Mem[00000000211c0000] = 00ff6880, %l4 = 000000005b6053bd
	ldsh	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010101430] = 7763161f 50eab348, %l0 = 000000e6, %l1 = 000000d0
	ldda	[%i4+0x030]%asi,%l0	! %l0 = 000000007763161f 0000000050eab348
!	Mem[00000000300c1400] = bd971a61, %l5 = 0000000000002b07
	lduwa	[%i3+%g0]0x89,%l5	! %l5 = 00000000bd971a61
!	Mem[0000000010181400] = 6ea22b07, %l6 = ffffffff9d3248ea
	lduba	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000007
!	Mem[00000000201c0000] = d0f73e5d, %l5 = 00000000bd971a61
	ldub	[%o0+0x001],%l5		! %l5 = 00000000000000f7
!	Mem[0000000030041408] = ff000000, %l1 = 0000000050eab348
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000201c0000] = d0f73e5d, %l2 = 0000000000004be2
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffd0
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 000000ea, %l2 = ffffffffffffffd0
	ldstuba	[%i2+%o4]0x89,%l2	! %l2 = 000000ea000000ff

p0_label_10:
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 000000007763161f
	setx	0xa3364e6f825216b9,%g7,%l0 ! %l0 = a3364e6f825216b9
!	%l1 = ffffffffffffffff
	setx	0x7c137a286d394dd2,%g7,%l1 ! %l1 = 7c137a286d394dd2
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a3364e6f825216b9
	setx	0x8dd9d2780ce501d5,%g7,%l0 ! %l0 = 8dd9d2780ce501d5
!	%l1 = 7c137a286d394dd2
	setx	0x5bdd4838755ab785,%g7,%l1 ! %l1 = 5bdd4838755ab785
!	Mem[0000000030181400] = 24140c28, %l0 = 8dd9d2780ce501d5
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 0000000024140c28
!	Mem[0000000010141410] = 5030d0b0, %l2 = 00000000000000ea
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 000000005030d0b0
!	Mem[0000000010041410] = 3a6319e2, %l5 = 00000000000000f7
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 000000e2000000ff
!	%l4 = 000000ff, %l5 = 000000e2, Mem[0000000010041400] = e91e224a b1260cf1
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff 000000e2
!	%l1 = 5bdd4838755ab785, Mem[000000001000143c] = b5a14333, %asi = 80
	stwa	%l1,[%i0+0x03c]%asi	! Mem[000000001000143c] = 755ab785
!	Mem[0000000010001408] = 954634d4, %l3 = ffffffffffffd0f7
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 000000d4000000ff
!	Mem[0000000010041410] = ff19633a, %l7 = 0000000000000059
	swapa	[%i1+%o5]0x80,%l7	! %l7 = 00000000ff19633a
!	%l2 = 5030d0b0, %l3 = 000000d4, Mem[0000000030081408] = 000000ff 6b24a7aa
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 5030d0b0 000000d4
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 12fd0cbcb153227b, %f12 = 8506dcc4 d2388b98
	ldda	[%i3+%g0]0x80,%f12	! %f12 = 12fd0cbc b153227b

p0_label_11:
!	Mem[0000000010101408] = 304b03f7 f938f173, %l2 = 5030d0b0, %l3 = 000000d4
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 00000000f938f173 00000000304b03f7
!	Mem[0000000010041408] = d00000e6, %l2 = 00000000f938f173
	lduwa	[%i1+%o4]0x88,%l2	! %l2 = 00000000d00000e6
!	Mem[0000000020800000] = a3d4779a, %l5 = 00000000000000e2
	lduba	[%o1+0x000]%asi,%l5	! %l5 = 00000000000000a3
!	Mem[0000000010141408] = 7dcfecd9, %l3 = 00000000304b03f7
	ldsha	[%i5+%o4]0x80,%l3	! %l3 = 0000000000007dcf
!	Mem[0000000010081410] = ffc5373a546113a9, %l2 = 00000000d00000e6
	ldxa	[%i2+%o5]0x80,%l2	! %l2 = ffc5373a546113a9
!	%l0 = 0000000024140c28, %l4 = 00000000000000ff, %y  = 00000000
	sdiv	%l0,%l4,%l7		! %l7 = 0000000000243844
	mov	%l0,%y			! %y = 24140c28
!	Mem[0000000030101410] = 997e78ef, %l1 = 5bdd4838755ab785
	lduba	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000099
!	Mem[0000000010181408] = 255980f3, %l2 = ffc5373a546113a9
	ldswa	[%i6+%o4]0x88,%l2	! %l2 = 00000000255980f3
!	Mem[0000000010181410] = 071a72a4, %l7 = 0000000000243844
	ldsba	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000007
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = ff000000, %l5 = 00000000000000a3
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 00000000000000ff

p0_label_12:
!	%f14 = 7a012058 5d3f8086, %l4 = 00000000000000ff
!	Mem[0000000010041428] = 990160908465843a
	add	%i1,0x028,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_P ! Mem[0000000010041428] = 7a0120585d3f8086
!	Mem[0000000010041400] = ff0000ff, %l0 = 0000000024140c28
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 00000000ff0000ff
!	%l7 = 0000000000000007, Mem[0000000010081410] = ffc5373a
	stba	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 07c5373a
!	Mem[0000000010081400] = 00000000, %l2 = 00000000255980f3
	swapa	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%l5 = 0000000000000000, Mem[00000000100c1410] = f8de3811
	stba	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = f8de3800
!	Mem[0000000010101410] = f36943dea91b101a, %l2 = 0000000000000000, %l2 = 0000000000000000
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = f36943dea91b101a
!	Mem[0000000010041404] = 000000e2, %l5 = 0000000000000000
	ldstuba	[%i1+0x004]%asi,%l5	! %l5 = 00000000000000ff
!	%f0  = 0072d112 b1381bc2 0072d112 b1381bc2
!	%f4  = 997e78ef fc12310c 5768185f 70ba30fa
!	%f8  = cb28dec6 e84b78c6 05453b71 24140c28
!	%f12 = 12fd0cbc b153227b 7a012058 5d3f8086
	stda	%f0,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	%l3 = 0000000000007dcf, %l4 = 00000000000000ff, %l0 = 00000000ff0000ff
	sdivx	%l3,%l4,%l0		! %l0 = 000000000000007e
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = bd96b39f, %l3 = 0000000000007dcf
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffffbd

p0_label_13:
!	Mem[0000000010101400] = ff3ea91b32dd4be2, %l0 = 000000000000007e
	ldxa	[%i4+%g0]0x80,%l0	! %l0 = ff3ea91b32dd4be2
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000030041410] = ef787e99, %l2 = f36943dea91b101a
	lduwa	[%i1+%o5]0x89,%l2	! %l2 = 00000000ef787e99
!	Mem[0000000030001408] = 3d236164, %l2 = 00000000ef787e99
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000003d23
!	Mem[0000000030001400] = 5b6053bd, %l3 = ffffffffffffffbd
	ldsha	[%i0+%g0]0x81,%l3	! %l3 = 0000000000005b60
!	Mem[0000000030001408] = 3d236164392408e9, %l1 = 0000000000000099
	ldxa	[%i0+%o4]0x81,%l1	! %l1 = 3d236164392408e9
!	Mem[0000000030141400] = 000000d4, %l0 = ff3ea91b32dd4be2
	lduha	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000d4
!	Mem[00000000300c1408] = f5dfcabe5e4ba994, %f20 = 997e78ef fc12310c
	ldda	[%i3+%o4]0x89,%f20	! %f20 = f5dfcabe 5e4ba994
!	Mem[0000000010081408] = c41410f0b153227b, %f0  = 0072d112 b1381bc2
	ldda	[%i2+%o4]0x88,%f0 	! %f0  = c41410f0 b153227b
!	Mem[0000000030101410] = ef787e99, %l7 = 0000000000000007
	lduwa	[%i4+%o5]0x89,%l7	! %l7 = 00000000ef787e99
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 000000d4, %l0 = 00000000000000d4
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 000000d4000000ff

p0_label_14:
!	Mem[0000000030041400] = 0072d112, %l1 = 3d236164392408e9
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 000000000072d112
!	Mem[0000000010101410] = f36943de, %l6 = 0000000000000007
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 00000000f36943de
!	%f26 = 05453b71, Mem[0000000030041410] = 997e78ef
	sta	%f26,[%i1+%o5]0x81	! Mem[0000000030041410] = 05453b71
!	Mem[0000000030001410] = aee844d4, %l0 = 00000000000000d4
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 00000000aee844d4
!	%f28 = e6000000 d2388b98, Mem[0000000010101410] = 07000000 1a101ba9
	stda	%f28,[%i4+%o5]0x88	! Mem[0000000010101410] = e6000000 d2388b98
!	Mem[0000000030101410] = ef787e99, %l3 = 0000000000005b60
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 00000000ef787e99
!	%f0  = c41410f0 b153227b, Mem[0000000030101410] = 00005b60 0c3112fc
	stda	%f0 ,[%i4+%o5]0x89	! Mem[0000000030101410] = c41410f0 b153227b
!	Mem[0000000010081419] = ff59166f, %l2 = 0000000000003d23
	ldstub	[%i2+0x019],%l2		! %l2 = 00000059000000ff
!	%l4 = 00000000000000ff, Mem[00000000201c0000] = d0f73e5d, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = fff73e5d
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 1ba93eff, %l4 = 00000000000000ff
	lduba	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_15:
!	Mem[0000000030181410] = 000000f7, %l4 = 00000000000000ff
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000f7
!	Mem[0000000010041400] = 280c1424, %l4 = 00000000000000f7
	ldsba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000028
!	Mem[00000000201c0000] = fff73e5d, %l5 = 0000000000000000
	ldub	[%o0+0x001],%l5		! %l5 = 00000000000000f7
!	Mem[0000000010141408] = d9eccf7d, %l4 = 0000000000000028
	ldsha	[%i5+%o4]0x88,%l4	! %l4 = ffffffffffffcf7d
!	Mem[00000000218000c0] = 57240fe0, %l1 = 000000000072d112
	lduha	[%o3+0x0c0]%asi,%l1	! %l1 = 0000000000005724
!	Mem[0000000010081400] = f3805925000000ff, %l5 = 00000000000000f7
	ldxa	[%i2+%g0]0x80,%l5	! %l5 = f3805925000000ff
!	Mem[0000000010181400] = 6ea22b07, %l7 = 00000000ef787e99
	lduba	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000007
!	Mem[0000000030041410] = 05453b71 fc12310c, %l6 = f36943de, %l7 = 00000007
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 0000000005453b71 00000000fc12310c
!	Mem[0000000010141428] = 3d517643, %l3 = 00000000ef787e99
	lduw	[%i5+0x028],%l3		! %l3 = 000000003d517643
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 00000000aee844d4
	setx	0x542692c7b3215c73,%g7,%l0 ! %l0 = 542692c7b3215c73
!	%l1 = 0000000000005724
	setx	0xfe930040072e24ea,%g7,%l1 ! %l1 = fe930040072e24ea
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 542692c7b3215c73
	setx	0x1f5d45df9ea3cda0,%g7,%l0 ! %l0 = 1f5d45df9ea3cda0
!	%l1 = fe930040072e24ea
	setx	0x2df3062018125fba,%g7,%l1 ! %l1 = 2df3062018125fba

p0_label_16:
!	%l6 = 0000000005453b71, %l6 = 0000000005453b71, %l5 = f3805925000000ff
	orn	%l6,%l6,%l5		! %l5 = ffffffffffffffff
!	%l5 = ffffffffffffffff, Mem[0000000010101438] = b48fd490, %asi = 80
	stwa	%l5,[%i4+0x038]%asi	! Mem[0000000010101438] = ffffffff
!	Mem[0000000020800001] = a3d4779a, %l0 = 1f5d45df9ea3cda0
	ldstuba	[%o1+0x001]%asi,%l0	! %l0 = 000000d4000000ff
!	%l6 = 0000000005453b71, Mem[00000000300c1400] = 611a97bd
	stha	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 3b7197bd
!	Mem[0000000010101434] = 50eab348, %l5 = ffffffff, %l3 = 3d517643
	add	%i4,0x34,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 0000000050eab348
!	Mem[0000000030101408] = 0072d112, %l0 = 00000000000000d4
	swapa	[%i4+%o4]0x81,%l0	! %l0 = 000000000072d112
!	Mem[0000000010181416] = b3250928, %l2 = 0000000000000059
	ldstuba	[%i6+0x016]%asi,%l2	! %l2 = 00000009000000ff
!	Mem[0000000030181400] = 0ce501d5, %l2 = 0000000000000009
	swapa	[%i6+%g0]0x89,%l2	! %l2 = 000000000ce501d5
!	%l3 = 0000000050eab348, Mem[00000000300c1400] = 3b7197bd
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 487197bd
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 07c5373a, %l6 = 0000000005453b71
	lduba	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000007

p0_label_17:
!	Mem[0000000030141408] = 9d3248ff, %l6 = 0000000000000007
	lduha	[%i5+%o4]0x89,%l6	! %l6 = 00000000000048ff
!	Mem[0000000030141400] = 000000ff, %l3 = 0000000050eab348
	lduha	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = bd53605b, %l1 = 2df3062018125fba
	lduba	[%i0+%g0]0x89,%l1	! %l1 = 000000000000005b
!	Mem[0000000030141410] = 9a5112a2, %l2 = 000000000ce501d5
	ldsba	[%i5+%o5]0x81,%l2	! %l2 = ffffffffffffff9a
!	Mem[0000000010141400] = b37c677d, %l5 = ffffffffffffffff
	ldswa	[%i5+%g0]0x80,%l5	! %l5 = ffffffffb37c677d
!	Mem[00000000100c1408] = d4000000ef39bc40, %f26 = 05453b71 24140c28
	ldd	[%i3+%o4],%f26		! %f26 = d4000000 ef39bc40
!	Mem[0000000010181408] = f38059251f3cfdb4, %l5 = ffffffffb37c677d
	ldxa	[%i6+%o4]0x80,%l5	! %l5 = f38059251f3cfdb4
!	Mem[0000000010081438] = 155d5e8d, %l0 = 000000000072d112
	ldsb	[%i2+0x03b],%l0		! %l0 = ffffffffffffff8d
!	Mem[0000000030081410] = ba31470f d9e67963, %l6 = 000048ff, %l7 = fc12310c
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000ba31470f 00000000d9e67963
!	Starting 10 instruction Store Burst
!	%l5 = f38059251f3cfdb4, Mem[0000000030141410] = a212519a
	stba	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = a21251b4

p0_label_18:
!	Mem[0000000030041400] = e9082439, %l3 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 00000039000000ff
!	%l1 = 000000000000005b, Mem[00000000100c140c] = ef39bc40
	stw	%l1,[%i3+0x00c]		! Mem[00000000100c140c] = 0000005b
!	%l3 = 0000000000000039, Mem[00000000300c1408] = 94a94b5ebecadff5
	stxa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000039
!	%f1  = b153227b, Mem[0000000010181408] = 255980f3
	sta	%f1 ,[%i6+%o4]0x88	! Mem[0000000010181408] = b153227b
!	%l0 = ffffff8d, %l1 = 0000005b, Mem[0000000030101408] = d4000000 c21b38b1
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffff8d 0000005b
!	Mem[000000001008140c] = f01014c4, %l1 = 0000005b, %l5 = 1f3cfdb4
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 00000000f01014c4
!	%l4 = ffffcf7d, %l5 = f01014c4, Mem[0000000030141400] = ff000000 00000000
	stda	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffcf7d f01014c4
!	%f8  = cb28dec6 e84b78c6, %l2 = ffffffffffffff9a
!	Mem[0000000030181420] = e2ff47bd09be3ca1
	add	%i6,0x020,%g1
	stda	%f8,[%g1+%l2]ASI_PST32_S ! Mem[0000000030181420] = cb28dec609be3ca1
!	%l1 = 000000000000005b, %l6 = 00000000ba31470f, %l6 = 00000000ba31470f
	xnor	%l1,%l6,%l6		! %l6 = ffffffff45ceb8ab
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = e6000000 d2388b98, %l2 = ffffff9a, %l3 = 00000039
	ldda	[%i4+%o5]0x88,%l2	! %l2 = 00000000d2388b98 00000000e6000000

p0_label_19:
!	Mem[0000000010141408] = db226799d9eccf7d, %l5 = 00000000f01014c4
	ldxa	[%i5+%o4]0x88,%l5	! %l5 = db226799d9eccf7d
!	Mem[00000000100c1408] = d4000000, %l0 = ffffffffffffff8d
	ldsha	[%i3+%o4]0x80,%l0	! %l0 = ffffffffffffd400
!	Mem[00000000300c1400] = 9c113005bd977148, %f10 = 05453b71 24140c28
	ldda	[%i3+%g0]0x89,%f10	! %f10 = 9c113005 bd977148
!	Mem[0000000010141410] = 000000ea, %l3 = 00000000e6000000
	lduwa	[%i5+%o5]0x80,%l3	! %l3 = 00000000000000ea
!	Mem[0000000030001408] = 3d236164, %f12 = 12fd0cbc
	lda	[%i0+%o4]0x81,%f12	! %f12 = 3d236164
!	Mem[0000000010101400] = e24bdd32 1ba93eff, %l6 = 45ceb8ab, %l7 = d9e67963
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 000000001ba93eff 00000000e24bdd32
!	Mem[0000000010101408] = 304b03f7f938f173, %l7 = 00000000e24bdd32
	ldxa	[%i4+%o4]0x88,%l7	! %l7 = 304b03f7f938f173
!	Mem[0000000030001410] = 000000d4, %f26 = d4000000
	lda	[%i0+%o5]0x89,%f26	! %f26 = 000000d4
!	Mem[0000000010141430] = 770ef1e3 94f993b8, %l4 = ffffcf7d, %l5 = d9eccf7d
	ldd	[%i5+0x030],%l4		! %l4 = 00000000770ef1e3 0000000094f993b8
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 7b2253b1, %l6 = 000000001ba93eff
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 000000007b2253b1

p0_label_20:
!	%l6 = 000000007b2253b1, Mem[0000000010041400] = 24140c28
	stba	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 24140cb1
!	%f4  = 997e78ef, Mem[0000000010181400] = 072ba26e
	sta	%f4 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 997e78ef
!	%l0 = ffffffffffffd400, Mem[0000000010041400] = b10c1424
	stba	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 000c1424
!	%l6 = 7b2253b1, %l7 = f938f173, Mem[0000000010081410] = 3a37c507 a9136154
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 7b2253b1 f938f173
!	%f22 = f8de3811 70ba30fa, Mem[0000000010141400] = 7d677cb3 60394930
	stda	%f22,[%i5+%g0]0x88	! Mem[0000000010141400] = f8de3811 70ba30fa
!	%l2 = d2388b98, %l3 = 000000ea, Mem[0000000010181408] = 7b2253b1 1f3cfdb4
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = d2388b98 000000ea
!	Mem[0000000010041400] = 24140c00, %l2 = 00000000d2388b98
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000, %l3 = 000000ea, Mem[0000000010001400] = 9fb396bd 40bc39ef
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 000000ea
!	%f29 = d2388b98, Mem[0000000010141400] = 70ba30fa
	sta	%f29,[%i5+%g0]0x88	! Mem[0000000010141400] = d2388b98
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ff6880, %l4 = 00000000770ef1e3
	ldub	[%o2+%g0],%l4		! %l4 = 0000000000000000

p0_label_21:
!	Mem[00000000100c1408] = d4000000 0000005b, %l0 = ffffd400, %l1 = 0000005b
	ldda	[%i3+0x008]%asi,%l0	! %l0 = 00000000d4000000 000000000000005b
!	Mem[0000000010041420] = a7803860a9da6d2d, %f14 = 7a012058 5d3f8086
	ldd	[%i1+0x020],%f14	! %f14 = a7803860 a9da6d2d
!	Mem[0000000030041410] = 05453b71, %l5 = 0000000094f993b8
	ldswa	[%i1+%o5]0x81,%l5	! %l5 = 0000000005453b71
!	Mem[0000000030041408] = 12d17200, %l3 = 00000000000000ea
	lduha	[%i1+%o4]0x89,%l3	! %l3 = 0000000000007200
!	Mem[00000000300c1400] = 487197bd, %f24 = cb28dec6
	lda	[%i3+%g0]0x81,%f24	! %f24 = 487197bd
!	Mem[00000000201c0000] = fff73e5d, %l7 = 304b03f7f938f173
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 000000000000fff7
!	Mem[0000000010101410] = 988b38d2, %l5 = 0000000005453b71
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = ffffffffffffff98
!	Mem[00000000100c1410] = 0038def82d9e84a6, %f14 = a7803860 a9da6d2d
	ldd	[%i3+%o5],%f14		! %f14 = 0038def8 2d9e84a6
!	Mem[0000000030101410] = 7b2253b1f01014c4, %l1 = 000000000000005b
	ldxa	[%i4+%o5]0x81,%l1	! %l1 = 7b2253b1f01014c4
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 5b6053bd, %l5 = ffffffffffffff98
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 0000005b000000ff

p0_label_22:
!	%f24 = 487197bd e84b78c6, Mem[0000000010141408] = d9eccf7d db226799
	stda	%f24,[%i5+%o4]0x88	! Mem[0000000010141408] = 487197bd e84b78c6
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 00000000d4000000
	setx	0xf12c4257e37438e4,%g7,%l0 ! %l0 = f12c4257e37438e4
!	%l1 = 7b2253b1f01014c4
	setx	0xfdb82fe7874e3aa8,%g7,%l1 ! %l1 = fdb82fe7874e3aa8
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f12c4257e37438e4
	setx	0xb4898f4fb65d2c27,%g7,%l0 ! %l0 = b4898f4fb65d2c27
!	%l1 = fdb82fe7874e3aa8
	setx	0x6a35313789bb9041,%g7,%l1 ! %l1 = 6a35313789bb9041
!	%l3 = 0000000000007200, %l6 = 000000007b2253b1, %y  = 24140c28
	sdiv	%l3,%l6,%l2		! %l2 = 000000004b020f52
	mov	%l0,%y			! %y = b65d2c27
!	%f16 = 7d2ad4b1 0e939dcb, %l6 = 000000007b2253b1
!	Mem[0000000030181420] = cb28dec609be3ca1
	add	%i6,0x020,%g1
	stda	%f16,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030181420] = cb9ddec609be3ca1
!	%l2 = 000000004b020f52, Mem[0000000010181410] = 28ff25b3a4721a07
	stxa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000004b020f52
!	%l7 = 000000000000fff7, Mem[0000000010081402] = f3805925
	sth	%l7,[%i2+0x002]		! Mem[0000000010081400] = f380fff7
!	%f0  = c41410f0 b153227b 0072d112 b1381bc2
!	%f4  = 997e78ef fc12310c 5768185f 70ba30fa
!	%f8  = cb28dec6 e84b78c6 9c113005 bd977148
!	%f12 = 3d236164 b153227b 0038def8 2d9e84a6
	stda	%f0,[%i2]ASI_BLK_AIUPL	! Block Store to 0000000010081400
!	%l3 = 0000000000007200, Mem[0000000010041400] = 24140cff
	stwa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 00007200
!	Mem[0000000010181400] = ef787e99, %l7 = 000000000000fff7
	ldstuba	[%i6+%g0]0x88,%l7	! %l7 = 00000099000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = a7803860, %f18 = 0072d112
	lda	[%i1+0x020]%asi,%f18	! %f18 = a7803860

p0_label_23:
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010081400] = 7b2253b1, %l2 = 000000004b020f52
	ldsha	[%i2+%g0]0x80,%l2	! %l2 = 0000000000007b22
!	Mem[0000000010081424] = c6de28cb, %l7 = 0000000000000099
	ldsb	[%i2+0x026],%l7		! %l7 = 0000000000000028
!	%l3 = 0000000000007200, %l5 = 000000000000005b, %l2 = 0000000000007b22
	xor	%l3,%l5,%l2		! %l2 = 000000000000725b
!	Mem[00000000201c0000] = fff73e5d, %l1 = 6a35313789bb9041
	ldub	[%o0+0x001],%l1		! %l1 = 00000000000000f7
!	Mem[0000000010141408] = c6784be8, %l2 = 000000000000725b
	ldsha	[%i5+0x008]%asi,%l2	! %l2 = ffffffffffffc678
!	Mem[0000000010141400] = 988b38d21138def8, %f2  = 0072d112 b1381bc2
	ldda	[%i5+%g0]0x80,%f2 	! %f2  = 988b38d2 1138def8
!	Mem[0000000030001400] = 00000000 bd5360ff, %l4 = 00000000, %l5 = 0000005b
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000bd5360ff 0000000000000000
!	Mem[00000000100c1408] = 000000d4, %l1 = 00000000000000f7
	lduba	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000d4
!	Mem[0000000010041400] = 00720000, %f15 = 2d9e84a6
	lda	[%i1+%g0]0x80,%f15	! %f15 = 00720000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000028, Mem[00000000300c1400] = 487197bd
	stha	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 002897bd

p0_label_24:
!	%f13 = b153227b, Mem[00000000300c1410] = d4000000
	sta	%f13,[%i3+%o5]0x81	! Mem[00000000300c1410] = b153227b
!	Mem[00000000100c1438] = 58626c0e, %l0 = b4898f4fb65d2c27
	ldstuba	[%i3+0x038]%asi,%l0	! %l0 = 00000058000000ff
!	%l6 = 000000007b2253b1, Mem[0000000020800000] = a3ff779a
	sth	%l6,[%o1+%g0]		! Mem[0000000020800000] = 53b1779a
!	%l6 = 7b2253b1, %l7 = 00000028, Mem[00000000100c1408] = 000000d4 5b000000
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 7b2253b1 00000028
!	%l4 = bd5360ff, %l5 = 00000000, Mem[0000000030081408] = 5030d0b0 000000d4
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = bd5360ff 00000000
!	%f6  = 5768185f 70ba30fa, Mem[0000000010101400] = ff3ea91b 32dd4be2
	stda	%f6 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 5768185f 70ba30fa
!	Mem[000000001018142c] = c6672f44, %l0 = 0000000000000058, %asi = 80
	swapa	[%i6+0x02c]%asi,%l0	! %l0 = 00000000c6672f44
!	%l4 = bd5360ff, %l5 = 00000000, Mem[0000000010101430] = 7763161f 50eab348
	stda	%l4,[%i4+0x030]%asi	! Mem[0000000010101430] = bd5360ff 00000000
!	%f8  = cb28dec6 e84b78c6, Mem[0000000010181400] = ff7e78ef b153227b
	stda	%f8 ,[%i6+%g0]0x80	! Mem[0000000010181400] = cb28dec6 e84b78c6
!	Starting 10 instruction Load Burst
!	%l3 = 0000000000007200, immed = 00000135, %y  = b65d2c27
	umul	%l3,0x135,%l5		! %l5 = 0000000000899a00, %y = 00000000

p0_label_25:
!	Mem[0000000030041410] = 713b4505, %f5  = fc12310c
	lda	[%i1+%o5]0x89,%f5 	! %f5 = 713b4505
!	Mem[00000000100c1410] = f8de3800, %l4 = 00000000bd5360ff
	ldswa	[%i3+%o5]0x88,%l4	! %l4 = fffffffff8de3800
!	Mem[0000000030081408] = ff6053bd, %l2 = ffffffffffffc678
	ldswa	[%i2+%o4]0x81,%l2	! %l2 = ffffffffff6053bd
!	Mem[0000000010081400] = 7b2253b1, %l4 = fffffffff8de3800
	ldsha	[%i2+%g0]0x80,%l4	! %l4 = 0000000000007b22
!	Mem[0000000010181414] = 00000000, %l0 = 00000000c6672f44
	ldswa	[%i6+0x014]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = cc0ab2fd, %f28 = e6000000
	lda	[%i2+%g0]0x89,%f28	! %f28 = cc0ab2fd
!	Mem[0000000020800040] = bb5c726d, %l0 = 0000000000000000
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 000000000000bb5c
!	Mem[000000001000142c] = ffa30f7b, %l2 = ffffffffff6053bd
	ldsha	[%i0+0x02e]%asi,%l2	! %l2 = 0000000000000f7b
!	Mem[0000000030041400] = ff2408e9, %l6 = 000000007b2253b1
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = ffffffffff2408e9
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000f7b, Mem[000000001010140c] = f7034b30
	stw	%l2,[%i4+0x00c]		! Mem[000000001010140c] = 00000f7b

p0_label_26:
!	Mem[0000000010081400] = b153227b, %l7 = 0000000000000028
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 00000000b153227b
!	%l6 = ffffffffff2408e9, Mem[0000000010101410] = d2388b98
	stba	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = d2388be9
!	%l4 = 0000000000007b22, Mem[0000000030141400] = 7dcfffff
	stha	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 7dcf7b22
!	%f20 = f5dfcabe 5e4ba994, %l6 = ffffffffff2408e9
!	Mem[0000000030101430] = 8506dcc4d2388b98
	add	%i4,0x030,%g1
	stda	%f20,[%g1+%l6]ASI_PST16_S ! Mem[0000000030101430] = f5dfdcc4d238a994
!	%l6 = ff2408e9, %l7 = b153227b, Mem[0000000010181438] = 6f4537ac 1a5185c2
	std	%l6,[%i6+0x038]		! Mem[0000000010181438] = ff2408e9 b153227b
!	%l2 = 0000000000000f7b, Mem[0000000010101417] = 000000e6
	stb	%l2,[%i4+0x017]		! Mem[0000000010101414] = 0000007b
!	%l6 = ffffffffff2408e9, Mem[00000000100c1400] = 12fd0cbc, %asi = 80
	stwa	%l6,[%i3+0x000]%asi	! Mem[00000000100c1400] = ff2408e9
!	Mem[00000000100c1428] = 78b7ff9c263728d3, %l7 = 00000000b153227b, %l7 = 00000000b153227b
	add	%i3,0x28,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = 78b7ff9c263728d3
!	%f17 = 0e939dcb, Mem[0000000010101438] = ffffffff
	sta	%f17,[%i4+0x038]%asi	! Mem[0000000010101438] = 0e939dcb
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 350580ad, %l4 = 0000000000007b22
	lduwa	[%i0+%o5]0x80,%l4	! %l4 = 00000000350580ad

p0_label_27:
!	Mem[00000000300c1400] = bd972800, %l5 = 0000000000899a00
	ldswa	[%i3+%g0]0x89,%l5	! %l5 = ffffffffbd972800
!	Mem[00000000300c1408] = 0000000000000039, %f26 = 000000d4 ef39bc40
	ldda	[%i3+%o4]0x81,%f26	! %f26 = 00000000 00000039
!	Mem[00000000100c1420] = cf624977d5b6f705, %f24 = 487197bd e84b78c6
	ldda	[%i3+0x020]%asi,%f24	! %f24 = cf624977 d5b6f705
!	Mem[0000000030141400] = 227bcf7d, %l5 = ffffffffbd972800
	lduwa	[%i5+%g0]0x81,%l5	! %l5 = 00000000227bcf7d
!	Mem[00000000300c1408] = 00000000, %l0 = 000000000000bb5c
	lduha	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = fdb20accccad9193, %f26 = 00000000 00000039
	ldda	[%i2+%g0]0x81,%f26	! %f26 = fdb20acc ccad9193
!	Mem[0000000030181408] = d09b59c8, %l5 = 00000000227bcf7d
	ldswa	[%i6+%o4]0x81,%l5	! %l5 = ffffffffd09b59c8
!	%l2 = 0000000000000f7b, %l0 = 0000000000000000, %y  = 00000000
	umul	%l2,%l0,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[0000000020800040] = bb5c726d, %l7 = 78b7ff9c263728d3
	ldsb	[%o1+0x040],%l7		! %l7 = ffffffffffffffbb
!	Starting 10 instruction Store Burst
!	Mem[00000000218000c1] = 57240fe0, %l3 = 0000000000000000
	ldstuba	[%o3+0x0c1]%asi,%l3	! %l3 = 00000024000000ff

p0_label_28:
!	%f24 = cf624977 d5b6f705, %l1 = 00000000000000d4
!	Mem[0000000010001438] = e3bae2c2755ab785
	add	%i0,0x038,%g1
	stda	%f24,[%g1+%l1]ASI_PST8_P ! Mem[0000000010001438] = cf62e27775b6b785
!	Mem[0000000010141410] = ea000000, %l6 = ffffffffff2408e9
	swapa	[%i5+%o5]0x88,%l6	! %l6 = 00000000ea000000
!	%l5 = ffffffffd09b59c8, Mem[00000000300c1408] = 00000000
	stba	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = c8000000
!	%f4  = 997e78ef 713b4505, Mem[0000000010001410] = ad800535 c784565e
	stda	%f4 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 997e78ef 713b4505
!	Mem[0000000030141400] = 7dcf7b22, %l1 = 00000000000000d4
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 00000022000000ff
!	Mem[0000000030001400] = bd5360ff, %l2 = 0000000000000f7b
	swapa	[%i0+%g0]0x89,%l2	! %l2 = 00000000bd5360ff
!	Mem[00000000100c1408] = b153227b, %l5 = ffffffffd09b59c8
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 000000b1000000ff
!	Mem[000000001008141a] = fa30ba70, %l5 = 00000000000000b1
	ldstub	[%i2+0x01a],%l5		! %l5 = 000000ba000000ff
!	%f28 = cc0ab2fd, Mem[0000000010101408] = 73f138f9
	st	%f28,[%i4+%o4]		! Mem[0000000010101408] = cc0ab2fd
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = bd972800, %l7 = ffffffffffffffbb
	ldsha	[%i3+%g0]0x89,%l7	! %l7 = 0000000000002800

p0_label_29:
!	Mem[0000000010141400] = 988b38d2 1138def8, %l4 = 350580ad, %l5 = 000000ba
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000988b38d2 000000001138def8
!	Mem[0000000030001410] = 000000d4, %l4 = 00000000988b38d2
	lduwa	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000d4
!	Mem[0000000021800080] = c6ae05ff, %l4 = 00000000000000d4
	ldsha	[%o3+0x080]%asi,%l4	! %l4 = ffffffffffffc6ae
!	Mem[0000000030141410] = a21251b4, %l7 = 0000000000002800
	ldsha	[%i5+%o5]0x89,%l7	! %l7 = 00000000000051b4
!	Mem[00000000100c1408] = ff53227b 28000000, %l0 = 00000000, %l1 = 00000022
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 00000000ff53227b 0000000028000000
!	Mem[0000000010181408] = d2388b98000000ea, %l4 = ffffffffffffc6ae
	ldxa	[%i6+%o4]0x80,%l4	! %l4 = d2388b98000000ea
!	Mem[0000000010001400] = 00000000, %l3 = 0000000000000024
	ldsha	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = 520f024b, %l0 = 00000000ff53227b
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 000000000000520f
!	Mem[0000000010041400] = 00007200, %l6 = 00000000ea000000
	lduha	[%i1+%g0]0x88,%l6	! %l6 = 0000000000007200
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 59000000, %l0 = 000000000000520f
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 0000000059000000

p0_label_30:
!	%l4 = d2388b98000000ea, Mem[0000000010101408] = fdb20acc
	stha	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = fdb200ea
!	%f2  = 988b38d2 1138def8, Mem[0000000030081408] = bd5360ff 00000000
	stda	%f2 ,[%i2+%o4]0x89	! Mem[0000000030081408] = 988b38d2 1138def8
!	%l2 = 00000000bd5360ff, Mem[000000001008142f] = 0530119c
	stb	%l2,[%i2+0x02f]		! Mem[000000001008142c] = 053011ff
!	Mem[0000000010081408] = c21b38b1, %l7 = 000051b4, %l6 = 00007200
	add	%i2,0x08,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 00000000c21b38b1
!	%l6 = 00000000c21b38b1, Mem[00000000201c0000] = fff73e5d
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 38b13e5d
!	%l2 = 00000000bd5360ff, Mem[0000000030141400] = ff7bcf7d
	stba	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = ff7bcf7d
!	%l2 = 00000000bd5360ff, Mem[0000000010181400] = cb28dec6e84b78c6
	stx	%l2,[%i6+%g0]		! Mem[0000000010181400] = 00000000bd5360ff
!	%f8  = cb28dec6 e84b78c6, %l7 = 00000000000051b4
!	Mem[0000000030041438] = 7a0120585d3f8086
	add	%i1,0x038,%g1
	stda	%f8,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030041438] = 7a0120585d3f8086
!	%l1 = 0000000028000000, Mem[00000000300c1400] = 002897bd
	stha	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000097bd
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 19bbda9c, %l6 = 00000000c21b38b1
	ldsha	[%o3+0x140]%asi,%l6	! %l6 = 00000000000019bb

p0_label_31:
!	Mem[0000000010081400] = 28000000 f01014c4, %l2 = bd5360ff, %l3 = 00000000
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 0000000028000000 00000000f01014c4
!	Mem[0000000010181410] = 520f024b00000000, %l2 = 0000000028000000
	ldxa	[%i6+%o5]0x80,%l2	! %l2 = 520f024b00000000
!	Mem[0000000010081410] = 997e78effc12310c, %l2 = 520f024b00000000
	ldxa	[%i2+%o5]0x88,%l2	! %l2 = 997e78effc12310c
!	Mem[0000000010101438] = 0e939dcb27e5f590, %l0 = 0000000059000000
	ldxa	[%i4+0x038]%asi,%l0	! %l0 = 0e939dcb27e5f590
!	Mem[0000000010001408] = 954634ff, %l7 = 00000000000051b4
	lduba	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041410] = 0c3112fc713b4505, %l6 = 00000000000019bb
	ldxa	[%i1+%o5]0x89,%l6	! %l6 = 0c3112fc713b4505
!	Mem[0000000030141410] = b45112a2, %l2 = 997e78effc12310c
	lduha	[%i5+%o5]0x81,%l2	! %l2 = 000000000000b451
!	Mem[0000000010001410] = 997e78ef713b4505, %f4  = 997e78ef 713b4505
	ldda	[%i0+%o5]0x88,%f4 	! %f4  = 997e78ef 713b4505
!	Mem[000000001010140c] = 00000f7b, %l1 = 0000000028000000
	ldswa	[%i4+0x00c]%asi,%l1	! %l1 = 0000000000000f7b
!	Starting 10 instruction Store Burst
!	%f30 = 7a012058 5d3f8086, %l7 = 00000000000000ff
!	Mem[0000000030041430] = 12fd0cbcb153227b
	add	%i1,0x030,%g1
	stda	%f30,[%g1+%l7]ASI_PST16_S ! Mem[0000000030041430] = 7a0120585d3f8086

p0_label_32:
!	%l7 = 00000000000000ff, Mem[0000000010081408] = b1381bc2
	stha	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = b13800ff
!	Mem[0000000030001400] = 7b0f0000, %l0 = 0e939dcb27e5f590
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 000000007b0f0000
!	Mem[00000000100c1408] = ff53227b28000000, %l7 = 00000000000000ff, %l2 = 000000000000b451
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = ff53227b28000000
!	%l2 = ff53227b28000000, Mem[0000000021800000] = 3bd3b994, %asi = 80
	stha	%l2,[%o3+0x000]%asi	! Mem[0000000021800000] = 0000b994
!	Mem[0000000010081430] = 7b2253b16461233d, %l5 = 000000001138def8, %l7 = 00000000000000ff
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = 7b2253b16461233d
!	%f4  = 997e78ef, Mem[0000000010041408] = e60000d0
	sta	%f4 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 997e78ef
!	%l2 = ff53227b28000000, Mem[0000000010041410] = 0000520f
	stwa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 28000000
!	Mem[0000000020800041] = bb5c726d, %l6 = 0c3112fc713b4505
	ldstub	[%o1+0x041],%l6		! %l6 = 0000005c000000ff
!	Mem[0000000030081408] = 1138def8, %l0 = 000000007b0f0000
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 000000001138def8
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = a21251b4, %l6 = 000000000000005c
	ldsha	[%i5+%o5]0x89,%l6	! %l6 = 00000000000051b4

p0_label_33:
!	Mem[0000000030041410] = 05453b71, %l0 = 000000001138def8
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000005
!	Mem[0000000030181410] = f7000000, %f14 = 0038def8
	lda	[%i6+%o5]0x81,%f14	! %f14 = f7000000
!	Mem[0000000030041408] = c21b38b112d17200, %f12 = 3d236164 b153227b
	ldda	[%i1+%o4]0x89,%f12	! %f12 = c21b38b1 12d17200
!	Mem[0000000030001408] = 3d236164, %l6 = 00000000000051b4
	ldsba	[%i0+%o4]0x81,%l6	! %l6 = 000000000000003d
!	Mem[00000000211c0000] = 00ff6880, %l4 = d2388b98000000ea
	lduh	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010101410] = d2388be9, %l7 = 7b2253b16461233d
	ldswa	[%i4+%o5]0x88,%l7	! %l7 = ffffffffd2388be9
!	Mem[0000000030141410] = a21251b4, %l6 = 000000000000003d
	lduwa	[%i5+%o5]0x89,%l6	! %l6 = 00000000a21251b4
!	Mem[0000000010041410] = 00000028, %l6 = 00000000a21251b4
	ldsha	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = 00ff6880, %l2 = ff53227b28000000
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000005, Mem[0000000030181408] = d09b59c8
	stba	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 059b59c8

p0_label_34:
!	%l3 = 00000000f01014c4, Mem[00000000100c1400] = ff2408e9b153227b
	stxa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000f01014c4
!	%l0 = 00000005, %l1 = 00000f7b, Mem[00000000100c1408] = ff53227b 28000000
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000005 00000f7b
!	%l0 = 0000000000000005, Mem[000000001000141c] = a434f6b5
	stw	%l0,[%i0+0x01c]		! Mem[000000001000141c] = 00000005
!	Mem[0000000030041408] = 0072d112, %l2 = 00000000000000ff
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 000000000072d112
!	%l6 = 0000000000000000, Mem[00000000211c0000] = 00ff6880
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 00006880
!	%f11 = bd977148, Mem[0000000010081410] = 0c3112fc
	sta	%f11,[%i2+%o5]0x80	! Mem[0000000010081410] = bd977148
!	Mem[00000000201c0000] = 38b13e5d, %l1 = 0000000000000f7b
	ldstub	[%o0+%g0],%l1		! %l1 = 00000038000000ff
!	%l5 = 000000001138def8, Mem[0000000010041434] = 90e0f5d5
	stw	%l5,[%i1+0x034]		! Mem[0000000010041434] = 1138def8
!	Mem[0000000030081400] = cc0ab2fd, %l2 = 000000000072d112
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 000000fd000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 0000005bffffff8d, %l2 = 00000000000000fd
	ldxa	[%i4+%o4]0x89,%l2	! %l2 = 0000005bffffff8d

p0_label_35:
!	Mem[00000000100c1404] = f01014c4, %l0 = 0000000000000005
	ldsh	[%i3+0x006],%l0		! %l0 = 00000000000014c4
!	Mem[0000000010141420] = cb38a8f2 3ebe2ec7, %l6 = 00000000, %l7 = d2388be9
	ldd	[%i5+0x020],%l6		! %l6 = 00000000cb38a8f2 000000003ebe2ec7
!	%f31 = 5d3f8086, %f10 = 9c113005
	fitos	%f31,%f10		! %f10 = 4eba7f01
!	Mem[0000000030101408] = 8dffffff5b000000, %f4  = 997e78ef 713b4505
	ldda	[%i4+%o4]0x81,%f4 	! %f4  = 8dffffff 5b000000
!	Mem[0000000010041400] = 00720000, %l4 = 00000000000000ff
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[000000001014140c] = bd977148, %l4 = 0000000000000000
	lduw	[%i5+0x00c],%l4		! %l4 = 00000000bd977148
!	Mem[0000000010181404] = bd5360ff, %l5 = 000000001138def8
	lduwa	[%i6+0x004]%asi,%l5	! %l5 = 00000000bd5360ff
!	Mem[0000000030001410] = 000000d4, %l1 = 0000000000000038
	lduba	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000d4
!	Mem[0000000010041410] = 00000028, %l7 = 000000003ebe2ec7
	lduwa	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000028
!	Starting 10 instruction Store Burst
!	%f24 = cf624977, Mem[0000000010101400] = 5f186857
	sta	%f24,[%i4+%g0]0x88	! Mem[0000000010101400] = cf624977

p0_label_36:
!	Mem[0000000030101400] = 12d17200, %l1 = 00000000000000d4
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l5 = 00000000bd5360ff, Mem[0000000010001408] = 954634ff
	stha	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 954660ff
!	%f28 = cc0ab2fd, %f7  = 70ba30fa
	fcmps	%fcc0,%f28,%f7 		! %fcc0 = 1
!	%l2 = 0000005bffffff8d, Mem[0000000010001410] = 05453b71ef787e99
	stxa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000005bffffff8d
!	Mem[00000000100c1403] = 00000000, %l4 = 00000000bd977148
	ldstub	[%i3+0x003],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030001410] = d4000000, %l7 = 0000000000000028
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 000000d4000000ff
!	%f12 = c21b38b1, Mem[0000000010181418] = a10fa8c8
	st	%f12,[%i6+0x018]	! Mem[0000000010181418] = c21b38b1
!	Mem[0000000030141408] = 9d3248ff, %l3 = 00000000f01014c4
	ldstuba	[%i5+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	%f26 = fdb20acc ccad9193, Mem[0000000010101418] = 5aa6806b 6abc2db4
	stda	%f26,[%i4+0x018]%asi	! Mem[0000000010101418] = fdb20acc ccad9193
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = f7000000, %l0 = 00000000000014c4
	ldswa	[%i6+%o5]0x81,%l0	! %l0 = fffffffff7000000

p0_label_37:
!	Mem[0000000010081408] = ff0038b1, %l1 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l1	! %l1 = 00000000ff0038b1
!	Mem[0000000030001408] = e90824396461233d, %f24 = cf624977 d5b6f705
	ldda	[%i0+%o4]0x89,%f24	! %f24 = e9082439 6461233d
!	Mem[0000000030101410] = 7b2253b1f01014c4, %l4 = 0000000000000000
	ldxa	[%i4+%o5]0x81,%l4	! %l4 = 7b2253b1f01014c4
!	Mem[0000000010041400] = 00007200, %l4 = 7b2253b1f01014c4
	lduba	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 520f024b00000000, %l6 = 00000000cb38a8f2
	ldxa	[%i6+0x010]%asi,%l6	! %l6 = 520f024b00000000
!	Mem[00000000218001c0] = 3653a57a, %l3 = 00000000000000ff
	ldsha	[%o3+0x1c0]%asi,%l3	! %l3 = 0000000000003653
!	Mem[0000000010041410] = 00000028, %l4 = 0000000000000000
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%f24 = e9082439, %f22 = f8de3811, %f14 = f7000000 00720000
	fsmuld	%f24,%f22,%f14		! %f14 = 4c4d8b4e 9937f240
!	Mem[0000000030101410] = c41410f0b153227b, %f22 = f8de3811 70ba30fa
	ldda	[%i4+%o5]0x89,%f22	! %f22 = c41410f0 b153227b
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000d4, Mem[0000000010001408] = ff604695
	stwa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000d4

p0_label_38:
!	%f16 = 7d2ad4b1 0e939dcb a7803860 a10fa8c8
!	%f20 = f5dfcabe 5e4ba994 c41410f0 b153227b
!	%f24 = e9082439 6461233d fdb20acc ccad9193
!	%f28 = cc0ab2fd d2388b98 7a012058 5d3f8086
	stda	%f16,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	%f2  = 988b38d2 1138def8, %l3 = 0000000000003653
!	Mem[0000000010141408] = c6784be8bd977148
	add	%i5,0x008,%g1
	stda	%f2,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010141408] = f8de3811bd977148
!	Mem[00000000211c0000] = 00006880, %l7 = 00000000000000d4
	ldstub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010081400] = 28000000, %l3 = 0000000000003653
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 00000028000000ff
!	Mem[0000000010081400] = ff000000, %l1 = 00000000ff0038b1
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	%l0 = f7000000, %l1 = 000000ff, Mem[0000000010001400] = 00000000 ea000000
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = f7000000 000000ff
!	%l0 = f7000000, %l1 = 000000ff, Mem[0000000030101408] = 8dffffff 5b000000
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = f7000000 000000ff
!	Mem[0000000010001410] = 5b000000, %l2 = 0000005bffffff8d
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 000000005b000000
!	%f14 = 4c4d8b4e 9937f240, %l5 = 00000000bd5360ff
!	Mem[0000000030101410] = 7b2253b1f01014c4
	add	%i4,0x010,%g1
	stda	%f14,[%g1+%l5]ASI_PST8_S ! Mem[0000000030101410] = 4c4d8b4e9937f240
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010101400] = 774962cf 70ba30fa ea00b2fd 00000f7b
!	Mem[0000000010101410] = e98b38d2 0000007b fdb20acc ccad9193
!	Mem[0000000010101420] = cfabcd92 fcd1f9fc 89de7878 ddf7b46f
!	Mem[0000000010101430] = bd5360ff 00000000 0e939dcb 27e5f590
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400

p0_label_39:
!	Mem[0000000010141428] = 3d5176431ba9813c, %f28 = cc0ab2fd d2388b98
	ldd	[%i5+0x028],%f28	! %f28 = 3d517643 1ba9813c
!	Mem[00000000100c1410] = 0038def8, %l6 = 520f024b00000000
	lduha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000038
!	Mem[000000001018142c] = 00000058, %f18 = a7803860
	ld	[%i6+0x02c],%f18	! %f18 = 00000058
!	Mem[0000000010081410] = bd977148, %f27 = ccad9193
	lda	[%i2+%o5]0x80,%f27	! %f27 = bd977148
!	%f16 = 7d2ad4b1 0e939dcb 00000058 a10fa8c8
!	%f20 = f5dfcabe 5e4ba994 c41410f0 b153227b
!	%f24 = e9082439 6461233d fdb20acc bd977148
!	%f28 = 3d517643 1ba9813c 7a012058 5d3f8086
	stda	%f16,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	Mem[00000000211c0000] = ff006880, %l6 = 0000000000000038
	ldsba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = fdb200ea, %l7 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l7	! %l7 = fffffffffdb200ea
!	Mem[0000000010141410] = e90824ff847b229c, %l1 = 00000000000000ff
	ldxa	[%i5+%o5]0x80,%l1	! %l1 = e90824ff847b229c
!	Mem[00000000100c1408] = 00000005 00000f7b, %l0 = f7000000, %l1 = 847b229c
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000005 0000000000000f7b
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000201c0000] = ffb13e5d, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00003e5d

p0_label_40:
!	Mem[0000000030001400] = 27e5f590, %l5 = 00000000bd5360ff
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 0000000027e5f590
!	%l2 = 000000005b000000, Mem[0000000030081400] = ffb20acc
	stwa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 5b000000
!	%f0  = fa30ba70 cf624977, %l1 = 0000000000000f7b
!	Mem[0000000030141410] = b45112a23cceb1f3
	add	%i5,0x010,%g1
	stda	%f0,[%g1+%l1]ASI_PST32_S ! Mem[0000000030141410] = fa30ba70cf624977
!	%l7 = fffffffffdb200ea, %l7 = fffffffffdb200ea, %l6 = 0000000000000000
	sub	%l7,%l7,%l6		! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010141410] = ff2408e9
	stwa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030041408] = a10fa8c8
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = a10f0000
!	Mem[0000000030141410] = 70ba30fa, %l0 = 0000000000000005
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 000000fa000000ff
	membar	#Sync			! Added by membar checker (5)
!	%f14 = 90f5e527 cb9d930e, Mem[0000000010101428] = 89de7878 ddf7b46f
	std	%f14,[%i4+0x028]	! Mem[0000000010101428] = 90f5e527 cb9d930e
!	%l6 = 00000000, %l7 = fdb200ea, Mem[0000000010081400] = 7d2ad4b1 0e939dcb
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 fdb200ea
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000c8, %l7 = fffffffffdb200ea
	lduba	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000c8

p0_label_41:
!	%f16 = 7d2ad4b1, %f0  = fa30ba70, %f13 = ff6053bd
	fsubs	%f16,%f0 ,%f13		! %f13 = 7d2d979b
!	Mem[0000000010081408] = 58000000, %l3 = 0000000000000028
	lduba	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	%f4  = 7b000000 d2388be9, %f3  = fdb200ea
	fxtos	%f4 ,%f3 		! %f3  = 5ef60000
!	Mem[00000000201c0000] = 00003e5d, %l6 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081428] = fdb20acc, %l1 = 0000000000000f7b
	ldsba	[%i2+0x029]%asi,%l1	! %l1 = ffffffffffffffb2
!	Mem[000000001014141c] = 5f4e94ac, %l0 = 00000000000000fa
	lduba	[%i5+0x01d]%asi,%l0	! %l0 = 000000000000004e
!	Mem[0000000030101400] = ff72d112b1381bc2, %f2  = 7b0f0000 5ef60000
	ldda	[%i4+%g0]0x81,%f2 	! %f2  = ff72d112 b1381bc2
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 000000000000004e
	setx	0x10d16e97fee85c91,%g7,%l0 ! %l0 = 10d16e97fee85c91
!	%l1 = ffffffffffffffb2
	setx	0x7bd40d80790a0917,%g7,%l1 ! %l1 = 7bd40d80790a0917
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 10d16e97fee85c91
	setx	0x6290fca7a5feba98,%g7,%l0 ! %l0 = 6290fca7a5feba98
!	%l1 = 7bd40d80790a0917
	setx	0x3ee58b9fd4a6426b,%g7,%l1 ! %l1 = 3ee58b9fd4a6426b
!	Mem[00000000201c0000] = 00003e5d, %l5 = 0000000027e5f590
	lduh	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[00000000100c1430] = b290ef6737fde103
	stx	%l3,[%i3+0x030]		! Mem[00000000100c1430] = 0000000000000000

p0_label_42:
!	Mem[0000000010081418] = c41410f0, %l7 = 00000000000000c8
	ldstuba	[%i2+0x018]%asi,%l7	! %l7 = 000000c4000000ff
!	%l0 = 6290fca7a5feba98, %l0 = 6290fca7a5feba98, %l2 = 000000005b000000
	sub	%l0,%l0,%l2		! %l2 = 0000000000000000
!	Mem[0000000010101408] = ea00b2fd, %l2 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 000000ea000000ff
!	Mem[0000000010101408] = ff00b2fd, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l5	! %l5 = 00000000ff00b2fd
!	%l5 = 00000000ff00b2fd, Mem[0000000010041410] = dc16faac28000000
	stxa	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000ff00b2fd
!	%l2 = 000000ea, %l3 = 00000000, Mem[0000000010081410] = becadff5 94a94b5e
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ea 00000000
!	%l2 = 000000ea, %l3 = 00000000, Mem[0000000030001400] = ff6053bd 00000000
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ea 00000000
!	Mem[0000000010041434] = 1138def8, %l3 = 0000000000000000
	ldstub	[%i1+0x034],%l3		! %l3 = 00000011000000ff
!	Mem[0000000030001400] = 000000ea, %l7 = 00000000000000c4
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 000000ea000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00003e5d, %l0 = 6290fca7a5feba98
	ldsb	[%o0+0x001],%l0		! %l0 = 0000000000000000

p0_label_43:
!	Mem[0000000010101408] = 00000000, %l4 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001008140c] = a10fa8c8, %l4 = 0000000000000000
	ldsw	[%i2+0x00c],%l4		! %l4 = ffffffffa10fa8c8
!	Mem[0000000030081400] = 5b000000, %l2 = 00000000000000ea
	lduba	[%i2+%g0]0x81,%l2	! %l2 = 000000000000005b
!	Mem[0000000030001408] = 6461233d, %f20 = f5dfcabe
	lda	[%i0+%o4]0x89,%f20	! %f20 = 6461233d
!	Mem[0000000030041400] = cb9d930e, %l7 = 00000000000000ea
	ldsha	[%i1+%g0]0x81,%l7	! %l7 = ffffffffffffcb9d
!	Mem[0000000010181410] = 4b020f52, %l1 = 3ee58b9fd4a6426b
	ldsha	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000f52
!	Mem[0000000010041410] = fdb200ff, %l5 = 00000000ff00b2fd
	ldsha	[%i1+%o5]0x80,%l5	! %l5 = fffffffffffffdb2
!	Mem[0000000010081400] = 00000000, %l4 = ffffffffa10fa8c8
	ldub	[%i2+0x003],%l4		! %l4 = 0000000000000000
!	Mem[0000000030081400] = 0000005b, %l6 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l6	! %l6 = 000000000000005b
!	Starting 10 instruction Store Burst
!	%f4  = 7b000000 d2388be9, %l2 = 000000000000005b
!	Mem[0000000030181428] = c31cc84b38ea09bd
	add	%i6,0x028,%g1
	stda	%f4,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030181428] = e98b38d238ea007b

p0_label_44:
!	%f17 = 0e939dcb, Mem[0000000030041410] = 94a94b5e
	sta	%f17,[%i1+%o5]0x81	! Mem[0000000030041410] = 0e939dcb
!	Mem[00000000100c140b] = 00000005, %l3 = 0000000000000011
	ldstub	[%i3+0x00b],%l3		! %l3 = 00000005000000ff
!	%l4 = 00000000, %l5 = fffffdb2, Mem[0000000030041410] = 0e939dcb becadff5
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 fffffdb2
!	%l1 = 0000000000000f52, Mem[0000000010141438] = 089552a8aa6e4118
	stx	%l1,[%i5+0x038]		! Mem[0000000010141438] = 0000000000000f52
!	%f12 = 00000000, Mem[0000000030001408] = 3d236164
	sta	%f12,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%f26 = fdb20acc, %f17 = 0e939dcb, %f17 = 0e939dcb
	fdivs	%f26,%f17,%f17		! %f17 = ff800000
!	%l3 = 0000000000000005, Mem[00000000300c1400] = 000097bd
	stwa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000005
!	Mem[0000000010041400] = 00720000, %l3 = 0000000000000005
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 0000000000720000
!	%l3 = 0000000000720000, Mem[0000000030001408] = 00000000
	stba	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff006880, %l1 = 0000000000000f52
	ldsb	[%o2+%g0],%l1		! %l1 = ffffffffffffffff

p0_label_45:
!	Mem[000000001008143c] = 5d3f8086, %l4 = 0000000000000000
	ldsha	[%i2+0x03c]%asi,%l4	! %l4 = 0000000000005d3f
!	Mem[0000000030181410] = 000000f7, %f8  = fcf9d1fc
	lda	[%i6+%o5]0x89,%f8 	! %f8 = 000000f7
!	Mem[00000000100c1400] = ff000000, %l1 = ffffffffffffffff
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = 00003e5d, %l1 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = a6849e2df8de3800, %f20 = 6461233d 5e4ba994
	ldda	[%i3+%o5]0x88,%f20	! %f20 = a6849e2d f8de3800
!	Mem[0000000030081400] = 5b000000, %l1 = 0000000000000000
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = 000000000000005b
!	Mem[0000000021800000] = 0000b994, %l2 = 000000000000005b
	lduh	[%o3+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000030081400] = 5b000000 ccad9193 00000f7b d2388b98
!	Mem[0000000030081410] = ba31470f d9e67963 c0f44a97 b7cca4c2
!	Mem[0000000030081420] = e7888aa7 a4e7ddb5 653f1504 0f06c47d
!	Mem[0000000030081430] = 0d832d3d d964a882 961cdec7 502b1033
	ldda	[%i2]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030081400
!	Mem[0000000010041400] = 05000000, %l7 = ffffffffffffcb9d
	ldsba	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f28 = 3d517643 1ba9813c, %l7 = 0000000000000000
!	Mem[0000000010181400] = 00000000bd5360ff
	stda	%f28,[%i6+%l7]ASI_PST32_PL ! Mem[0000000010181400] = 00000000bd5360ff

p0_label_46:
!	%l3 = 0000000000720000, Mem[0000000030101400] = 12d172ff
	stwa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 00720000
!	%l0 = 0000000000000000, Mem[0000000010041410] = fdb200ff00000000
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000000
!	%l6 = 0000005b, %l7 = 00000000, Mem[00000000300c1408] = c8000000 00000039
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000005b 00000000
!	%f16 = 7d2ad4b1, %f25 = 6461233d
	fsqrts	%f16,%f25		! %f25 = 5e511fa6
!	Mem[0000000030081408] = 00000f7b, %l0 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000f7b
!	%l5 = fffffffffffffdb2, Mem[0000000010101410] = 7b000000d2388be9
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = fffffffffffffdb2
!	%l7 = 0000000000000000, Mem[0000000030101410] = 4e8b4d4c
	stha	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 4e8b0000
!	Mem[0000000010081410] = ea000000, %l5 = fffffffffffffdb2
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 000000ea000000ff
!	Mem[00000000300c1410] = 7b2253b1, %l0 = 0000000000000f7b
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 000000007b2253b1
!	Starting 10 instruction Load Burst
!	Mem[0000000010141404] = 1138def8, %l0 = 000000007b2253b1
	lduw	[%i5+0x004],%l0		! %l0 = 000000001138def8

p0_label_47:
!	Mem[0000000021800000] = 0000b994, %l6 = 000000000000005b
	lduha	[%o3+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 00000000 fffffdb2, %l0 = 1138def8, %l1 = 0000005b
	ldda	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000 00000000fffffdb2
!	Mem[0000000030001400] = ff000000, %l0 = 0000000000000000
	lduha	[%i0+%g0]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030101410] = 40f237994e8b0000, %f24 = e9082439 5e511fa6
	ldda	[%i4+%o5]0x89,%f24	! %f24 = 40f23799 4e8b0000
!	Mem[0000000010001408] = d4000000, %f18 = 00000058
	lda	[%i0+%o4]0x88,%f18	! %f18 = d4000000
!	Mem[0000000010041408] = 997e78ef 78b7ff9c, %l0 = 0000ff00, %l1 = fffffdb2
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 00000000997e78ef 0000000078b7ff9c
!	Mem[0000000030041410] = 00000000 fffffdb2, %l4 = 00005d3f, %l5 = 000000ea
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000 00000000fffffdb2
!	Mem[000000001000141c] = 00000005, %l0 = 00000000997e78ef
	ldswa	[%i0+0x01c]%asi,%l0	! %l0 = 0000000000000005
!	Mem[0000000030001408] = 00000000, %l5 = 00000000fffffdb2
	lduha	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000005, Mem[0000000010181400] = 00000000
	stwa	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000005

p0_label_48:
!	%f24 = 40f23799, %f27 = bd977148, %f18 = d4000000 a10fa8c8
	fsmuld	%f24,%f27,%f18		! %f18 = bfe1e93f 3d258100
!	%f19 = 3d258100, Mem[0000000010041410] = 00000000
	sta	%f19,[%i1+%o5]0x80	! Mem[0000000010041410] = 3d258100
!	Mem[0000000010141400] = d2388b98, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 00000000d2388b98
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010101410] = fffffdb2 ffffffff
	stda	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 00000000
!	%l4 = 0000000000000000, Mem[0000000010041408] = 997e78ef
	stha	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 000078ef
!	Mem[0000000030181400] = 09000000, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 00000009000000ff
!	Mem[0000000010081408] = 58000000, %l5 = 0000000000000009
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 0000000058000000
!	%f18 = bfe1e93f 3d258100, Mem[0000000010081428] = fdb20acc bd977148
	stda	%f18,[%i2+0x028]%asi	! Mem[0000000010081428] = bfe1e93f 3d258100
!	Mem[0000000030041410] = 00000000, %l7 = 00000000d2388b98
	ldstuba	[%i1+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000ff, %l3 = 0000000000720000
	lduwa	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ff

p0_label_49:
!	Mem[0000000021800100] = 7b655371, %l3 = 00000000000000ff
	ldsb	[%o3+0x100],%l3		! %l3 = 000000000000007b
!	Mem[0000000030101400] = 00007200, %l4 = 0000000000000000
	ldsha	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = ff00000000000000, %f4  = 6379e6d9 0f4731ba
	ldda	[%i2+%o5]0x80,%f4 	! %f4  = ff000000 00000000
!	Mem[0000000030041410] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030181400] = ff000000 29cffb7c 059b59c8 80ada6c8
!	Mem[0000000030181410] = f7000000 00000059 89a56831 5c11a999
!	Mem[0000000030181420] = cb9ddec6 09be3ca1 e98b38d2 38ea007b
!	Mem[0000000030181430] = 8a7635e1 b743ad62 c15c5f2a 7af196a3
	ldda	[%i6]ASI_BLK_SL,%f0	! Block Load from 0000000030181400
!	Mem[0000000010141400] = 00000000, %f22 = c41410f0
	ld	[%i5+%g0],%f22	! %f22 = 00000000
!	Mem[0000000010081438] = 7a012058, %l5 = 0000000058000000
	ldsb	[%i2+0x03b],%l5		! %l5 = 0000000000000058
!	Mem[0000000030141408] = 9d3248ff, %l0 = 0000000000000005
	ldsha	[%i5+%o4]0x89,%l0	! %l0 = 00000000000048ff
!	Mem[0000000010101438] = 0e939dcb, %l0 = 00000000000048ff
	lduba	[%i4+0x03b]%asi,%l0	! %l0 = 00000000000000cb
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000058, Mem[0000000010001408] = 000000d4
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 580000d4

p0_label_50:
!	Mem[0000000030081410] = ba31470f, %l2 = 00000000000000ff
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 000000ba000000ff
!	%l4 = 0000000000000000, imm = 00000000000004d1, %l6 = 0000000000000000
	subc	%l4,0x4d1,%l6		! %l6 = fffffffffffffb2f
!	%l0 = 00000000000000cb, Mem[00000000100c1400] = 000000ff
	stha	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00cb00ff
!	Mem[0000000010041418] = c0b3f6b4, %l1 = 0000000078b7ff9c
	ldswa	[%i1+0x018]%asi,%l1	! %l1 = ffffffffc0b3f6b4
!	Mem[00000000100c1410] = 0038def8, %l5 = 0000000000000058
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 000000000038def8
!	%l7 = 0000000000000000, Mem[0000000010181434] = 923886e6
	sth	%l7,[%i6+0x034]		! Mem[0000000010181434] = 000086e6
!	Mem[00000000300c1410] = f8de381100000f7b, %f16 = 7d2ad4b1 ff800000
	ldda	[%i3+%o5]0x89,%f16	! %f16 = f8de3811 00000f7b
!	%l4 = 0000000000000000, Mem[0000000010041408] = ef780000
	stba	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ef780000
!	%l0 = 00000000000000cb, Mem[0000000030041400] = cb9d930e
	stha	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00cb930e
!	Starting 10 instruction Load Burst
!	Mem[000000001000141c] = 00000005, %l6 = fffffffffffffb2f
	lduba	[%i0+0x01e]%asi,%l6	! %l6 = 0000000000000000

p0_label_51:
!	Mem[00000000100c1408] = ff000000, %l3 = 000000000000007b
	lduha	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	%f16 = f8de3811, %f29 = 1ba9813c
	fcmpes	%fcc3,%f16,%f29		! %fcc3 = 1
!	Mem[00000000201c0000] = 00003e5d, %l1 = ffffffffc0b3f6b4
	ldstub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	%l0 = 00000000000000cb, %l0 = 00000000000000cb, %l7 = 0000000000000000
	or	%l0,%l0,%l7		! %l7 = 00000000000000cb
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 00000000000000cb
	setx	0x296fca97a8941693,%g7,%l0 ! %l0 = 296fca97a8941693
!	%l1 = 0000000000000000
	setx	0x9bc5bc5fd7c740f7,%g7,%l1 ! %l1 = 9bc5bc5fd7c740f7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 296fca97a8941693
	setx	0x533463c81a0ef6a7,%g7,%l0 ! %l0 = 533463c81a0ef6a7
!	%l1 = 9bc5bc5fd7c740f7
	setx	0x24ffc857eab6290f,%g7,%l1 ! %l1 = 24ffc857eab6290f
!	Mem[0000000010001408] = 580000d4, %f27 = bd977148
	lda	[%i0+%o4]0x80,%f27	! %f27 = 580000d4
!	Mem[0000000010081408] = 09000000a10fa8c8, %f26 = fdb20acc 580000d4
	ldda	[%i2+%o4]0x80,%f26	! %f26 = 09000000 a10fa8c8
!	Mem[0000000030101410] = 4e8b0000, %l0 = 533463c81a0ef6a7
	lduha	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141438] = 00000000 00000f52, %l0 = 00000000, %l1 = eab6290f
	ldd	[%i5+0x038],%l0		! %l0 = 0000000000000000 0000000000000f52
!	Starting 10 instruction Store Burst
!	%f16 = f8de3811 00000f7b, Mem[0000000030041400] = 00cb930e b1d42a7d
	stda	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = f8de3811 00000f7b

p0_label_52:
!	Mem[0000000010101438] = 0e939dcb27e5f590, %l1 = 0000000000000f52, %l1 = 0000000000000f52
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = 0e939dcb27e5f590
!	%l4 = 0000000000000000, Mem[00000000211c0001] = ff006880, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff006880
!	%l5 = 000000000038def8, Mem[000000001004142d] = 5d3f8086
	stb	%l5,[%i1+0x02d]		! Mem[000000001004142c] = 5df88086
!	Mem[0000000010041418] = c0b3f6b4, %l5 = 000000000038def8
	swap	[%i1+0x018],%l5		! %l5 = 00000000c0b3f6b4
!	Mem[00000000100c1400] = 00cb00ff, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (7)
!	%l4 = 0000000000000000, Mem[0000000030181400] = ff000000
	stba	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%f30 = 7a012058 5d3f8086, Mem[0000000030001410] = ff000000 07d44e40
	stda	%f30,[%i0+%o5]0x81	! Mem[0000000030001410] = 7a012058 5d3f8086
!	%l5 = 00000000c0b3f6b4, Mem[0000000020800041] = bbff726d, %asi = 80
	stba	%l5,[%o1+0x041]%asi	! Mem[0000000020800040] = bbb4726d
!	%l3 = 0000000000000000, Mem[0000000010001400] = f7000000
	stba	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 000000000081253d, %l4 = 0000000000000000
	ldxa	[%i1+%o5]0x88,%l4	! %l4 = 000000000081253d

p0_label_53:
!	Mem[0000000030101410] = 4e8b0000, %l6 = 0000000000000000
	lduha	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = 00000005, %l2 = 00000000000000ba
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101428] = 90f5e527 cb9d930e, %l4 = 0081253d, %l5 = c0b3f6b4
	ldd	[%i4+0x028],%l4		! %l4 = 0000000090f5e527 00000000cb9d930e
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010001400] = 00000000 000000ff 580000d4 a1cfe2a6
!	Mem[0000000010001410] = 8dffffff ffffff8d ac4f7128 00000005
!	Mem[0000000010001420] = 2a2ba122 32b3e57e 7dc8a373 ffa30f7b
!	Mem[0000000010001430] = 0c8261be d967c860 cf62e277 75b6b785
	ldda	[%i0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400
!	Mem[0000000010181400] = 05000000, %l2 = 0000000000000000
	ldsha	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000500
!	Mem[0000000010081434] = 1ba9813c, %l7 = 00000000000000cb
	ldub	[%i2+0x035],%l7		! %l7 = 00000000000000a9
!	Mem[0000000030041408] = a10f0000, %f13 = e135768a
	lda	[%i1+%o4]0x89,%f13	! %f13 = a10f0000
!	Mem[0000000010141410] = 00000000847b229c, %l5 = 00000000cb9d930e
	ldxa	[%i5+0x010]%asi,%l5	! %l5 = 00000000847b229c
!	Mem[0000000010141400] = 00000000 1138def8, %l4 = 90f5e527, %l5 = 847b229c
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000 000000001138def8
!	Starting 10 instruction Store Burst
!	%f10 = 7b00ea38 d2388be9, Mem[0000000030041400] = 1138def8 7b0f0000
	stda	%f10,[%i1+%g0]0x89	! Mem[0000000030041400] = 7b00ea38 d2388be9

p0_label_54:
!	%f6  = 99a9115c, %f8  = a13cbe09
	fcmpes	%fcc3,%f6 ,%f8 		! %fcc3 = 2
!	%f11 = d2388be9, Mem[0000000030141410] = ff30ba70
	sta	%f11,[%i5+%o5]0x81	! Mem[0000000030141410] = d2388be9
!	Mem[0000000030181400] = 00000000, %l2 = 0000000000000500
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = e98b38d2, %l6 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 00000000e98b38d2
!	Mem[000000001018140c] = 000000ea, %l2 = 0000000000000000
	swap	[%i6+0x00c],%l2		! %l2 = 00000000000000ea
!	%l3 = 0000000000000000, %l3 = 0000000000000000, %l7 = 00000000000000a9
	addc	%l3,%l3,%l7		! %l7 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010141408] = f8de3811bd977148
	stx	%l4,[%i5+%o4]		! Mem[0000000010141408] = 0000000000000000
!	%f0  = 7cfbcf29, %f6  = 99a9115c, %f3  = c8599b05
	fadds	%f0 ,%f6 ,%f3 		! %f3  = 7cfbcf29
!	%l4 = 0000000000000000, Mem[0000000010081410] = ff000000
	stha	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Starting 10 instruction Load Burst
!	%l3 = 0000000000000000, imm = 0000000000000600, %l7 = 0000000000000000
	sub	%l3,0x600,%l7		! %l7 = fffffffffffffa00

p0_label_55:
!	Mem[0000000030001410] = 86803f5d5820017a, %f2  = c8a6ad80 7cfbcf29
	ldda	[%i0+%o5]0x89,%f2 	! %f2  = 86803f5d 5820017a
!	Mem[0000000010001408] = 580000d4, %l4 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = 00000000580000d4
!	Mem[0000000010141400] = 00000000, %l0 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 7dcf7bff, %l3 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l3	! %l3 = 000000007dcf7bff
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, imm = fffffffffffffab9, %l5 = 000000001138def8
	addc	%l0,-0x547,%l5		! %l5 = fffffffffffffab9
!	Mem[0000000030081408] = 00000000, %l3 = 000000007dcf7bff
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041414] = 00000000, %l4 = 00000000580000d4, %asi = 80
	swapa	[%i1+0x014]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181438] = ff2408e9, %l3 = 0000000000000000
	ldsh	[%i6+0x038],%l3		! %l3 = ffffffffffffff24
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ea, Mem[0000000030181408] = c8599b05
	stha	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = c85900ea

p0_label_56:
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 0000000000000000
	setx	0x1b03187794d718d5,%g7,%l0 ! %l0 = 1b03187794d718d5
!	%l1 = 0e939dcb27e5f590
	setx	0x3885cf97e45a72ca,%g7,%l1 ! %l1 = 3885cf97e45a72ca
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1b03187794d718d5
	setx	0x7c50879fdc87a682,%g7,%l0 ! %l0 = 7c50879fdc87a682
!	%l1 = 3885cf97e45a72ca
	setx	0xe67a8dd81cb142bd,%g7,%l1 ! %l1 = e67a8dd81cb142bd
!	%f22 = 05000000 28714fac, Mem[0000000030181408] = ea0059c8 80ada6c8
	stda	%f22,[%i6+%o4]0x81	! Mem[0000000030181408] = 05000000 28714fac
!	Mem[0000000030101410] = 00008b4e, %l5 = fffffffffffffab9
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181408] = 05000000, %l5 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l5	! %l5 = 0000000005000000
!	%f29 = be61820c, %f15 = 2a5f5cc1
	fcmps	%fcc3,%f29,%f15		! %fcc3 = 1
!	%l0 = 7c50879fdc87a682, Mem[0000000010041408] = 000078ef78b7ff9c, %asi = 80
	stxa	%l0,[%i1+0x008]%asi	! Mem[0000000010041408] = 7c50879fdc87a682
!	Mem[0000000030181410] = f7000000, %l5 = 0000000005000000
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 00000000f7000000
!	%l1 = e67a8dd81cb142bd, Mem[0000000010181400] = 05000000bd5360ff
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = e67a8dd81cb142bd
!	Mem[00000000201c0000] = ff003e5d, %l4 = 0000000000000000
	ldstub	[%o0+%g0],%l4		! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %f30 = 85b7b675
	lda	[%i2+%g0]0x88,%f30	! %f30 = 00000000

p0_label_57:
!	Mem[0000000030181400] = 7cfbcf29 000000ff, %l4 = 000000ff, %l5 = f7000000
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff 000000007cfbcf29
!	Mem[0000000010181400] = e67a8dd8, %l2 = 00000000000000ea
	ldsha	[%i6+%g0]0x80,%l2	! %l2 = ffffffffffffe67a
!	Mem[0000000010181430] = c06caef7, %l3 = ffffffffffffff24
	ldub	[%i6+0x030],%l3		! %l3 = 00000000000000c0
!	%f17 = 00000000, %f13 = a10f0000
	fcmps	%fcc2,%f17,%f13		! %fcc2 = 2
!	Mem[0000000030081400] = 9391adcc0000005b, %l6 = 00000000e98b38d2
	ldxa	[%i2+%g0]0x89,%l6	! %l6 = 9391adcc0000005b
!	Mem[00000000100c1404] = f01014c4, %f3  = 5820017a
	ld	[%i3+0x004],%f3 	! %f3 = f01014c4
!	Mem[0000000010041408] = 7c50879f, %l4 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 000000007c50879f
!	Mem[0000000030001400] = 000000ff, %l6 = 9391adcc0000005b
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = ff00cbff, %l6 = 00000000000000ff
	lduha	[%i3+%g0]0x88,%l6	! %l6 = 000000000000cbff
!	Starting 10 instruction Store Burst
!	%l4 = 000000007c50879f, Mem[0000000010181438] = ff2408e9b153227b
	stx	%l4,[%i6+0x038]		! Mem[0000000010181438] = 000000007c50879f

p0_label_58:
!	%l5 = 000000007cfbcf29, Mem[0000000030101410] = 40f237994e8b00ff
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000007cfbcf29
!	%l5 = 000000007cfbcf29, Mem[0000000030101400] = 00720000
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 00720029
!	Mem[0000000030041410] = ff000000, %l4 = 000000007c50879f
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%f9  = c6de9dcb, Mem[0000000030001400] = ff000000
	sta	%f9 ,[%i0+%g0]0x81	! Mem[0000000030001400] = c6de9dcb
!	Mem[00000000100c1408] = ff000000, %l6 = 000000000000cbff
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 00000000ff000000
!	%l7 = fffffffffffffa00, Mem[00000000300c1408] = 0000005b
	stwa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = fffffa00
!	%f0  = 7cfbcf29 000000ff, Mem[0000000030041408] = 00000fa1 603880a7
	stda	%f0 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 7cfbcf29 000000ff
!	%l0 = 7c50879fdc87a682, Mem[0000000020800040] = bbb4726d
	sth	%l0,[%o1+0x040]		! Mem[0000000020800040] = a682726d
!	%l1 = e67a8dd81cb142bd, Mem[0000000021800140] = 19bbda9c
	sth	%l1,[%o3+0x140]		! Mem[0000000021800140] = 42bdda9c
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 53b1779a, %l3 = 00000000000000c0
	ldsba	[%o1+0x000]%asi,%l3	! %l3 = 0000000000000053

p0_label_59:
!	Mem[00000000201c0000] = ff003e5d, %l7 = fffffffffffffa00
	lduh	[%o0+%g0],%l7		! %l7 = 000000000000ff00
!	Mem[00000000300c1400] = 00000005, %l3 = 0000000000000053
	lduha	[%i3+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041438] = 48839796, %l6 = 00000000ff000000
	lduha	[%i1+0x03a]%asi,%l6	! %l6 = 0000000000009796
!	Mem[0000000010081408] = c8a80fa1 00000009, %l0 = dc87a682, %l1 = 1cb142bd
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000009 00000000c8a80fa1
!	Mem[0000000010081410] = 00000000, %l2 = ffffffffffffe67a
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 09000000 a10fa8c8, %l6 = 00009796, %l7 = 0000ff00
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 0000000009000000 00000000a10fa8c8
!	Mem[00000000100c142c] = 263728d3, %l6 = 0000000009000000
	lduha	[%i3+0x02e]%asi,%l6	! %l6 = 00000000000028d3
!	Mem[00000000300c1400] = 00000005, %l1 = 00000000c8a80fa1
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[000000001010143c] = 27e5f590, %l5 = 000000007cfbcf29
	lduwa	[%i4+0x03c]%asi,%l5	! %l5 = 0000000027e5f590
!	Starting 10 instruction Store Burst
!	%l7 = 00000000a10fa8c8, Mem[00000000300c1410] = 00000f7b
	stha	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000a8c8

p0_label_60:
!	Mem[0000000010181400] = e67a8dd81cb142bd, %l3 = 0000000000000000, %l4 = 00000000000000ff
	casxa	[%i6]0x80,%l3,%l4	! %l4 = e67a8dd81cb142bd
!	%f18 = a6e2cfa1, Mem[0000000010101400] = 774962cf
	sta	%f18,[%i4+%g0]0x80	! Mem[0000000010101400] = a6e2cfa1
!	%l4 = e67a8dd81cb142bd, Mem[0000000010101400] = a1cfe2a6
	stba	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = a1cfe2bd
!	Mem[0000000030141400] = ff7bcf7d, %l4 = e67a8dd81cb142bd
	ldstuba	[%i5+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	%l7 = 00000000a10fa8c8, Mem[0000000030101400] = 00720029
	stwa	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = a10fa8c8
!	%l4 = 000000ff, %l5 = 27e5f590, Mem[0000000010181410] = 4b020f52 00000000
	stda	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff 27e5f590
!	Mem[0000000030181400] = ff000000, %l0 = 0000000000000009
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010101400] = a1cfe2bd, %l0 = 00000000ff000000
	swapa	[%i4+%g0]0x88,%l0	! %l0 = 00000000a1cfe2bd
!	Mem[0000000030141410] = e98b38d2, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000e98b38d2
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff7bcf7d f01014c4, %l4 = 000000ff, %l5 = 27e5f590
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 00000000ff7bcf7d 00000000f01014c4

p0_label_61:
!	Mem[0000000010141418] = 83018bde, %l7 = 00000000a10fa8c8
	ldsh	[%i5+0x01a],%l7		! %l7 = ffffffffffff8bde
!	Mem[0000000010101408] = 0000000000000f7b, %l4 = 00000000ff7bcf7d
	ldxa	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000f7b
!	Mem[0000000030001408] = 00000000, %l3 = 00000000e98b38d2
	lduha	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 00000058, %l7 = ffffffffffff8bde
	ldswa	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000058
!	Mem[0000000030081410] = 0f4731ff, %l4 = 0000000000000f7b
	ldswa	[%i2+%o5]0x89,%l4	! %l4 = 000000000f4731ff
!	%l7 = 0000000000000058, %l5 = 00000000f01014c4, %l3 = 0000000000000000
	or	%l7,%l5,%l3		! %l3 = 00000000f01014dc
!	Mem[000000001014142c] = 1ba9813c, %l3 = 00000000f01014dc
	lduh	[%i5+0x02c],%l3		! %l3 = 0000000000001ba9
!	Mem[0000000010081430] = 3d517643 1ba9813c, %l6 = 000028d3, %l7 = 00000058
	ldd	[%i2+0x030],%l6		! %l6 = 000000003d517643 000000001ba9813c
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = ff48329d, %l4 = 000000000f4731ff
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 000000ff000000ff

p0_label_62:
	membar	#Sync			! Added by membar checker (9)
!	%l3 = 0000000000001ba9, Mem[0000000010001410] = ffffff8d
	stwa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 00001ba9
!	%f12 = 62ad43b7, Mem[0000000010181420] = 9117f8e6
	st	%f12,[%i6+0x020]	! Mem[0000000010181420] = 62ad43b7
!	%f1  = 000000ff, Mem[0000000010041424] = a9da6d2d
	sta	%f1 ,[%i1+0x024]%asi	! Mem[0000000010041424] = 000000ff
!	%f16 = ff000000, Mem[0000000030101400] = a10fa8c8
	sta	%f16,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000000
!	%l4 = 000000ff, %l5 = f01014c4, Mem[0000000010101400] = 000000ff 70ba30fa
	stda	%l4,[%i4+0x000]%asi	! Mem[0000000010101400] = 000000ff f01014c4
!	%f4  = 59000000 000000f7, Mem[0000000030101410] = 7cfbcf29 00000000
	stda	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 59000000 000000f7
!	%l6 = 000000003d517643, Mem[00000000300c1400] = 05000000
	stba	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 05000043
!	%l4 = 000000ff, %l5 = f01014c4, Mem[0000000010141420] = cb38a8f2 3ebe2ec7
	stda	%l4,[%i5+0x020]%asi	! Mem[0000000010141420] = 000000ff f01014c4
!	%l6 = 000000003d517643, Mem[0000000030001400] = cb9ddec6
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 3d517643
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 86803f5d5820017a, %f30 = 00000000 77e262cf
	ldda	[%i0+%o5]0x89,%f30	! %f30 = 86803f5d 5820017a

p0_label_63:
!	Mem[0000000010041438] = 48839796baefe943, %f0  = 7cfbcf29 000000ff
	ldda	[%i1+0x038]%asi,%f0 	! %f0  = 48839796 baefe943
!	Mem[0000000010041418] = 0038def8, %f25 = 22a12b2a
	ld	[%i1+0x018],%f25	! %f25 = 0038def8
!	Mem[0000000021800000] = 0000b994, %l6 = 000000003d517643
	ldub	[%o3+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000010041408] = 82a687dcff000000, %l6 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l6	! %l6 = 82a687dcff000000
!	Mem[0000000010001408] = 580000d4a1cfe2a6, %l5 = 00000000f01014c4
	ldxa	[%i0+%o4]0x80,%l5	! %l5 = 580000d4a1cfe2a6
!	Mem[0000000030101408] = 000000f7, %l2 = 0000000000000000
	lduha	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000f7
!	Mem[0000000010041408] = 000000ff, %l6 = 82a687dcff000000
	lduha	[%i1+0x008]%asi,%l6	! %l6 = 0000000000000000
!	%l4 = 00000000000000ff, %l3 = 0000000000001ba9, %l6 = 0000000000000000
	and	%l4,%l3,%l6		! %l6 = 00000000000000a9
!	Mem[00000000100c1408] = ffcb000000000f7b, %f4  = 59000000 000000f7
	ldda	[%i3+%o4]0x80,%f4 	! %f4  = ffcb0000 00000f7b
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000001ba9, Mem[0000000030081410] = ff31470f
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = a931470f

p0_label_64:
!	Mem[0000000030141400] = ff7bcf7d, %l0 = 00000000a1cfe2bd
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff7bcf7d
!	%f7  = 3168a589, Mem[0000000010001400] = 00000000
	sta	%f7 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 3168a589
!	%l0 = 00000000ff7bcf7d, Mem[0000000030001408] = 00000000
	stwa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = ff7bcf7d
!	%l7 = 000000001ba9813c, Mem[00000000218001c1] = 3653a57a, %asi = 80
	stba	%l7,[%o3+0x1c1]%asi	! Mem[00000000218001c0] = 363ca57a
!	%l2 = 00000000000000f7, Mem[0000000010141410] = 00000000
	stwa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000f7
!	Mem[00000000100c1430] = 00000000, %l6 = 00000000000000a9
	ldswa	[%i3+0x030]%asi,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030081410] = 0f4731a9
	stwa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%l0 = ff7bcf7d, %l1 = 00000000, Mem[0000000030181410] = 05000000 00000059
	stda	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = ff7bcf7d 00000000
!	%l1 = 0000000000000000, Mem[00000000300c1408] = fffffa0000000000
	stxa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 42bdda9c, %l5 = 580000d4a1cfe2a6
	ldsb	[%o3+0x140],%l5		! %l5 = 0000000000000042

p0_label_65:
!	Mem[0000000030101408] = f7000000, %l7 = 000000001ba9813c
	ldswa	[%i4+%o4]0x81,%l7	! %l7 = fffffffff7000000
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l6 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = ffcb0000, %l0 = 00000000ff7bcf7d
	ldsba	[%i3+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081400] = 00000000fdb200ea, %f6  = 99a9115c 3168a589
	ldda	[%i2+%g0]0x80,%f6 	! %f6  = 00000000 fdb200ea
!	Mem[0000000010081400] = 00000000, %l2 = 00000000000000f7
	lduwa	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %f12 = 62ad43b7
	lda	[%i2+%o5]0x89,%f12	! %f12 = 00000000
!	Mem[0000000010141410] = f7000000, %l3 = 0000000000001ba9
	ldsba	[%i5+%o5]0x80,%l3	! %l3 = fffffffffffffff7
!	Mem[0000000030101410] = f7000000 00000059, %l4 = 000000ff, %l5 = 00000042
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 00000000f7000000 0000000000000059
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 4376513d, %l3 = fffffffffffffff7
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 00000043000000ff

p0_label_66:
!	Mem[00000000100c1408] = ffcb0000, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%l0 = ffffffffffffffff, Mem[0000000030081400] = 9391adcc0000005b
	stxa	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffffffffffff
!	%f16 = ff000000, Mem[0000000030141400] = bde2cfa1
	sta	%f16,[%i5+%g0]0x89	! Mem[0000000030141400] = ff000000
!	Mem[0000000030181410] = 7dcf7bff, %l7 = fffffffff7000000
	ldstuba	[%i6+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	%f16 = ff000000 00000000, Mem[0000000010041408] = 000000ff dc87a682
	stda	%f16,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000 00000000
!	Mem[0000000010181410] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%l3 = 0000000000000043, Mem[0000000010101408] = 0000000000000f7b
	stxa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000043
!	%l1 = 0000000000000000, Mem[00000000100c1420] = cf624977, %asi = 80
	stwa	%l1,[%i3+0x020]%asi	! Mem[00000000100c1420] = 00000000
!	%f14 = a396f17a 2a5f5cc1, %l4 = 00000000f7000000
!	Mem[0000000030081408] = 00000000d2388b98
	add	%i2,0x008,%g1
	stda	%f14,[%g1+%l4]ASI_PST16_S ! Mem[0000000030081408] = 00000000d2388b98
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff7bcf7d, %l0 = ffffffffffffffff
	lduha	[%i6+%o5]0x81,%l0	! %l0 = 000000000000ff7b

p0_label_67:
!	Mem[0000000010041400] = e20000ff05000000, %f8  = a13cbe09 c6de9dcb
	ldda	[%i1+%g0]0x88,%f8 	! %f8  = e20000ff 05000000
!	Mem[0000000030001400] = ff76513d 00000000, %l4 = f7000000, %l5 = 00000059
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 00000000ff76513d 0000000000000000
!	Mem[0000000010181408] = d2388b98, %l7 = 00000000000000ff
	lduba	[%i6+%o4]0x80,%l7	! %l7 = 00000000000000d2
!	Mem[0000000030101410] = 000000f7, %l4 = 00000000ff76513d
	lduba	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000f7
!	Mem[00000000100c1400] = ff00cbff, %l5 = 0000000000000000
	lduha	[%i3+%g0]0x88,%l5	! %l5 = 000000000000cbff
!	Mem[0000000030001400] = ff76513d00000000, %l7 = 00000000000000d2
	ldxa	[%i0+%g0]0x81,%l7	! %l7 = ff76513d00000000
!	Mem[0000000030181408] = 0000000028714fac, %f0  = 48839796 baefe943
	ldda	[%i6+%o4]0x81,%f0 	! %f0  = 00000000 28714fac
!	Mem[0000000030101408] = ff000000000000f7, %l3 = 0000000000000043
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = ff000000000000f7
!	Mem[0000000010041410] = 3d258100, %l7 = ff76513d00000000
	ldsha	[%i1+%o5]0x80,%l7	! %l7 = 0000000000003d25
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00000000, %l3 = ff000000000000f7
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff

p0_label_68:
!	Mem[0000000030041408] = 29cffb7c, %l5 = 000000000000cbff
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 0000000029cffb7c
!	%l3 = 0000000000000000, Mem[00000000201c0000] = ff003e5d
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 00003e5d
!	%f3  = f01014c4, %f24 = 7ee5b332, %f23 = 28714fac
	fadds	%f3 ,%f24,%f23		! %f23 = 7ee5b332
!	%l2 = 00000000000000ff, Mem[0000000030041410] = ff000000
	stwa	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff
!	Mem[00000000300c1410] = 0000a8c8, %l4 = 00000000000000f7
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 000000000000a8c8
!	%f10 = 7b00ea38 d2388be9, %l4 = 000000000000a8c8
!	Mem[00000000300c1408] = 0000000000000000
	add	%i3,0x008,%g1
	stda	%f10,[%g1+%l4]ASI_PST32_SL ! Mem[00000000300c1408] = 0000000000000000
!	%l6 = 00000000000000ff, %l5 = 0000000029cffb7c, %l0 = 000000000000ff7b
	addc	%l6,%l5,%l0		! %l0 = 0000000029cffc7b
!	Mem[0000000030001410] = 5820017a, %l2 = 00000000000000ff
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 0000007a000000ff
!	%l7 = 0000000000003d25, Mem[0000000010181410] = 000000ff
	stwa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 00003d25
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000fff01014c4, %l6 = 00000000000000ff
	ldxa	[%i4+%g0]0x80,%l6	! %l6 = 000000fff01014c4

p0_label_69:
!	Mem[0000000030141400] = 000000ff, %l6 = 000000fff01014c4
	lduba	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000003d25
	ldsha	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081418] = ff1410f0, %l7 = 0000000000000000
	lduw	[%i2+0x018],%l7		! %l7 = 00000000ff1410f0
!	Mem[0000000030041410] = 000000ff, %l2 = 000000000000007a
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = 253d0000, %l3 = 0000000000000000
	lduw	[%i6+%o5],%l3		! %l3 = 00000000253d0000
!	Mem[00000000100c1408] = ffcb0000 00000f7b, %l2 = 00000000, %l3 = 253d0000
	ldda	[%i3+0x008]%asi,%l2	! %l2 = 00000000ffcb0000 0000000000000f7b
!	Mem[0000000030101408] = f7000000, %l7 = 00000000ff1410f0
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 00000000f7000000
!	Mem[0000000030081408] = 00000000, %l3 = 0000000000000f7b
	lduba	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l7 = 00000000f7000000
	ldsba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f20 = 8dffffff, %f0  = 00000000
	fcmpes	%fcc3,%f20,%f0 		! %fcc3 = 1

p0_label_70:
!	Mem[0000000010001439] = cf62e277, %l1 = 0000000000000000
	ldstub	[%i0+0x039],%l1		! %l1 = 00000062000000ff
!	%l3 = 0000000000000000, Mem[0000000010041410] = 3d258100
	stwa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%f20 = 8dffffff ffffff8d, Mem[0000000010181408] = d2388b98 00000000
	stda	%f20,[%i6+%o4]0x80	! Mem[0000000010181408] = 8dffffff ffffff8d
!	%l4 = 000000000000a8c8, imm = fffffffffffff5fa, %l5 = 0000000029cffb7c
	andn	%l4,-0xa06,%l5		! %l5 = 0000000000000800
!	%l1 = 0000000000000062, Mem[0000000030141400] = 000000fff01014c4
	stxa	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000062
!	Mem[00000000300c1408] = 00000000, %l4 = 000000000000a8c8
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041430] = 57296ebf, %l7 = 00000000, %l6 = 00000000
	add	%i1,0x30,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 0000000057296ebf
!	%f8  = e20000ff 05000000, %l5 = 0000000000000800
!	Mem[0000000010141420] = 000000fff01014c4
	add	%i5,0x020,%g1
	stda	%f8,[%g1+%l5]ASI_PST32_P ! Mem[0000000010141420] = 000000fff01014c4
!	Mem[0000000030101400] = 000000ff, %l7 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff006880, %l2 = 00000000ffcb0000
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffff00

p0_label_71:
!	Mem[0000000030041410] = ff000000, %l3 = 0000000000000000
	ldsha	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l2 = ffffffffffffff00, %l1 = 0000000000000062, %y  = 00000000
	smul	%l2,%l1,%l5		! %l5 = ffffffffffff9e00, %y = ffffffff
!	%f25 = 0038def8, %f7  = fdb200ea
	fcmpes	%fcc1,%f25,%f7 		! %fcc1 = 2
!	Mem[0000000030041400] = 00000000, %f25 = 0038def8
	lda	[%i1+%g0]0x81,%f25	! %f25 = 00000000
!	Mem[00000000100c1408] = 7b0f00000000cbff, %f20 = 8dffffff ffffff8d
	ldda	[%i3+%o4]0x88,%f20	! %f20 = 7b0f0000 0000cbff
!	Mem[0000000010041414] = 580000d4, %l5 = ffffffffffff9e00
	ldub	[%i1+0x014],%l5		! %l5 = 0000000000000058
!	Mem[00000000100c1414] = 2d9e84a6, %l7 = 00000000000000ff
	ldsh	[%i3+0x016],%l7		! %l7 = ffffffffffff84a6
!	Mem[0000000010001400] = 89a56831, %l5 = 0000000000000058
	lduh	[%i0+0x002],%l5		! %l5 = 0000000000006831
!	Mem[0000000010001408] = 580000d4, %l7 = ffffffffffff84a6
	lduha	[%i0+%o4]0x80,%l7	! %l7 = 0000000000005800
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 00000000, %l7 = 0000000000005800
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_72:
!	%l2 = ffffff00, %l3 = 00000000, Mem[0000000030041408] = ffcb0000 000000ff
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffff00 00000000
!	%l1 = 0000000000000062, Mem[0000000030101400] = 00000000
	stha	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000062
!	%l7 = 0000000000000000, Mem[0000000030101410] = f700000000000059
	stxa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000000
!	%l4 = 00000000, %l5 = 00006831, Mem[0000000010101408] = 00000000 00000043
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 00006831
!	%l1 = 0000000000000062, Mem[0000000030101408] = 000000f7
	stba	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000062
!	%l1 = 0000000000000062, Mem[0000000030181400] = 00000009
	stba	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 62000009
!	Mem[0000000030001410] = ff012058, %l3 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 00000000ff012058
!	%f2  = 86803f5d, %f1  = 28714fac, %f13 = a10f0000
	fsubs	%f2 ,%f1 ,%f13		! %f13 = a8714fac
!	%f20 = 7b0f0000, Mem[00000000100c1400] = ff00cbff
	sta	%f20,[%i3+%g0]0x88	! Mem[00000000100c1400] = 7b0f0000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000030041400] = 00000000 38ea007b ffffff00 00000000
!	Mem[0000000030041410] = 000000ff fffffdb2 7b2253b1 f01014c4
!	Mem[0000000030041420] = 3d236164 392408e9 9391adcc cc0ab2fd
!	Mem[0000000030041430] = 988b38d2 fdb20acc 86803f5d 5820017a
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400

p0_label_73:
!	Mem[000000001018143c] = 7c50879f, %f14 = a396f17a
	lda	[%i6+0x03c]%asi,%f14	! %f14 = 7c50879f
!	Mem[0000000030041400] = 7b00ea3800000000, %f8  = e20000ff 05000000
	ldda	[%i1+%g0]0x89,%f8 	! %f8  = 7b00ea38 00000000
!	Mem[0000000010141404] = 1138def8, %l3 = 00000000ff012058
	ldub	[%i5+0x005],%l3		! %l3 = 0000000000000038
!	Mem[0000000010041400] = 00000005, %l7 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000005
!	Mem[0000000030181408] = 00000000 28714fac, %l4 = 00000000, %l5 = 00006831
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000 0000000028714fac
!	Mem[0000000010081420] = e9082439, %l4 = 0000000000000000
	ldsb	[%i2+0x023],%l4		! %l4 = 0000000000000039
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000000005
	lduba	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = e67a8dd8, %l6 = 0000000057296ebf
	lduwa	[%i6+%g0]0x80,%l6	! %l6 = 00000000e67a8dd8
!	Mem[0000000010141424] = f01014c4, %l5 = 0000000028714fac
	ldsba	[%i5+0x025]%asi,%l5	! %l5 = 0000000000000010
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000062, Mem[0000000010141410] = f7000000847b229c
	stxa	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000062

p0_label_74:
!	Mem[00000000100c1408] = 0000cbff, %l4 = 0000000000000039
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	%l6 = 00000000e67a8dd8, Mem[0000000030081410] = 00000000
	stba	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = d8000000
!	Mem[0000000021800040] = 0a482728, %l7 = 0000000000000000
	ldstuba	[%o3+0x040]%asi,%l7	! %l7 = 0000000a000000ff
!	%l3 = 0000000000000038, Mem[0000000010081410] = 00000000
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000038
!	%l5 = 0000000000000010, Mem[0000000010101400] = ff000000
	stwa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000010
!	Mem[00000000100c1410] = 58000000, %l3 = 0000000000000038
	ldstuba	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f6  = 00000000, Mem[0000000030101410] = 00000000
	sta	%f6 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Mem[0000000021800081] = c6ae05ff, %l7 = 000000000000000a
	ldstub	[%o3+0x081],%l7		! %l7 = 000000ae000000ff
!	%l2 = ffffffffffffff00, Mem[0000000010041408] = ff000000
	stba	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff48329dd53f7559, %f10 = 7b00ea38 d2388be9
	ldda	[%i5+%o4]0x81,%f10	! %f10 = ff48329d d53f7559

p0_label_75:
!	Mem[00000000300c1408] = 00000000 000000ff, %l4 = 000000ff, %l5 = 00000010
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[00000000100c1400] = 7b0f0000, %l1 = 0000000000000062
	ldsba	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 0000000029cffc7b
	setx	0x488e0a483528207c,%g7,%l0 ! %l0 = 488e0a483528207c
!	%l1 = 0000000000000000
	setx	0xe08fdda04a65a584,%g7,%l1 ! %l1 = e08fdda04a65a584
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 488e0a483528207c
	setx	0xf0d56d6fd4992248,%g7,%l0 ! %l0 = f0d56d6fd4992248
!	%l1 = e08fdda04a65a584
	setx	0x77d4b9583d3ec9b5,%g7,%l1 ! %l1 = 77d4b9583d3ec9b5
!	Mem[00000000211c0000] = ff006880, %l2 = ffffffffffffff00
	ldub	[%o2+0x001],%l2		! %l2 = 0000000000000000
!	Mem[0000000030181400] = 62000009, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l3	! %l3 = 0000000000006200
!	Mem[0000000010101410] = 00000000, %l0 = f0d56d6fd4992248
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = 09000000, %l2 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l2	! %l2 = 0000000009000000
!	Mem[0000000010001408] = a6e2cfa1 d4000058, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 00000000d4000058 00000000a6e2cfa1
!	Mem[0000000010101400] = 10000000, %l7 = 00000000000000ae
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 0000000010000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 000000ff, %l5 = 00000000a6e2cfa1
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 000000ff000000ff

p0_label_76:
!	Mem[00000000100c1400] = 7b0f0000, %l2 = 0000000009000000
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l4 = 00000000d4000058, Mem[0000000010181408] = ffffff8d
	stba	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffff58
!	%f28 = 988b38d2 fdb20acc, Mem[0000000010001400] = 3168a589 ff000000
	stda	%f28,[%i0+%g0]0x88	! Mem[0000000010001400] = 988b38d2 fdb20acc
!	%f19 = 00000000, Mem[0000000010141410] = 00000000
	sta	%f19,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%f8  = 7b00ea38 00000000, %l5 = 00000000000000ff
!	Mem[0000000010181428] = be9a174000000058
	add	%i6,0x028,%g1
	stda	%f8,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010181428] = 0000000038ea007b
!	Mem[00000000211c0001] = ff006880, %l1 = 77d4b9583d3ec9b5
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	%f0  = 00000000 28714fac 86803f5d f01014c4
!	%f4  = ffcb0000 00000f7b 00000000 fdb200ea
!	%f8  = 7b00ea38 00000000 ff48329d d53f7559
!	%f12 = 00000000 a8714fac 7c50879f 2a5f5cc1
	stda	%f0,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	%f26 = 9391adcc cc0ab2fd, Mem[00000000100c1410] = ff000058 2d9e84a6
	stda	%f26,[%i3+%o5]0x80	! Mem[00000000100c1410] = 9391adcc cc0ab2fd
!	%f20 = 000000ff fffffdb2, Mem[0000000010081410] = 00000038 00000000
	stda	%f20,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff fffffdb2
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (11)
!	Mem[00000000100c1408] = 0000cbff, %l6 = 00000000e67a8dd8
	lduha	[%i3+%o4]0x88,%l6	! %l6 = 000000000000cbff

p0_label_77:
!	Mem[0000000010001400] = cc0ab2fd, %l5 = 00000000000000ff
	ldub	[%i0+0x001],%l5		! %l5 = 000000000000000a
!	Mem[0000000030181410] = 000000007dcf7bff, %l7 = 0000000010000000
	ldxa	[%i6+%o5]0x89,%l7	! %l7 = 000000007dcf7bff
!	Mem[0000000030081400] = ffffffff, %f9  = 00000000
	lda	[%i2+%g0]0x81,%f9 	! %f9 = ffffffff
!	Mem[0000000010141408] = ff000000, %l7 = 000000007dcf7bff
	ldswa	[%i5+%o4]0x80,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010181400] = e67a8dd8 1cb142bd 58ffffff ffffff8d
!	Mem[0000000010181410] = 253d0000 90f5e527 c21b38b1 823fbf33
!	Mem[0000000010181420] = 62ad43b7 077c310c 00000000 38ea007b
!	Mem[0000000010181430] = c06caef7 000086e6 00000000 7c50879f
	ldda	[%i6]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[0000000010081400] = 00000000, %l6 = 000000000000cbff
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = 09000062, %f10 = ff48329d
	lda	[%i6+%g0]0x89,%f10	! %f10 = 09000062
!	Mem[00000000100c1424] = d5b6f705, %l6 = 0000000000000000
	lduwa	[%i3+0x024]%asi,%l6	! %l6 = 00000000d5b6f705
!	Mem[0000000010081410] = 000000fffffffdb2, %l7 = ffffffffff000000
	ldx	[%i2+%o5],%l7		! %l7 = 000000fffffffdb2
!	Starting 10 instruction Store Burst
!	%f12 = 00000000 a8714fac, %l1 = 0000000000000000
!	Mem[0000000030101430] = f5dfdcc4d238a994
	add	%i4,0x030,%g1
	stda	%f12,[%g1+%l1]ASI_PST32_S ! Mem[0000000030101430] = f5dfdcc4d238a994

p0_label_78:
!	%l7 = 000000fffffffdb2, Mem[0000000010101417] = 00000000
	stb	%l7,[%i4+0x017]		! Mem[0000000010101414] = 000000b2
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010081438] = 7a012058 5d3f8086
	std	%l0,[%i2+0x038]		! Mem[0000000010081438] = 00000000 00000000
!	%l2 = 00000000, %l3 = 00006200, Mem[0000000010081408] = 09000000 a10fa8c8
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 00006200
!	%f0  = 00000000, Mem[0000000010081400] = 00000000
	sta	%f0 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	Mem[0000000010141423] = 000000ff, %l1 = 0000000000000000
	ldstub	[%i5+0x023],%l1		! %l1 = 000000ff000000ff
!	Mem[00000000100c1424] = d5b6f705, %l5 = 000000000000000a, %asi = 80
	swapa	[%i3+0x024]%asi,%l5	! %l5 = 00000000d5b6f705
	membar	#Sync			! Added by membar checker (12)
!	%f10 = 09000062 d53f7559, %l4 = 00000000d4000058
!	Mem[0000000010181430] = c06caef7000086e6
	add	%i6,0x030,%g1
	stda	%f10,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010181430] = c06caef700000009
!	%l6 = 00000000d5b6f705, Mem[0000000020800000] = 53b1779a, %asi = 80
	stba	%l6,[%o1+0x000]%asi	! Mem[0000000020800000] = 05b1779a
!	Mem[0000000010041408] = 00000000, %l5 = 00000000d5b6f705
	swapa	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = cc0ab2fd d2388b98, %l2 = 00000000, %l3 = 00006200
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000cc0ab2fd 00000000d2388b98

p0_label_79:
!	Mem[0000000030141410] = 00580000cf624977, %l6 = 00000000d5b6f705
	ldxa	[%i5+%o5]0x81,%l6	! %l6 = 00580000cf624977
!	Mem[00000000201c0000] = 00003e5d, %l4 = 00000000d4000058
	lduh	[%o0+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010001410] = a91b0000, %l0 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l0	! %l0 = 00000000a91b0000
!	Mem[0000000010141410] = 00000000, %l1 = 00000000000000ff
	ldub	[%i5+0x012],%l1		! %l1 = 0000000000000000
!	%f13 = a8714fac, %f8  = 7b00ea38, %f2  = 86803f5d f01014c4
	fsmuld	%f13,%f8 ,%f2 		! %f2  = c47e6127 67296800
!	Mem[0000000010181400] = e67a8dd8 1cb142bd, %l0 = a91b0000, %l1 = 00000000
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000e67a8dd8 000000001cb142bd
!	Mem[0000000010001400] = cc0ab2fd, %l1 = 000000001cb142bd
	lduba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000cc
!	%f18 = 58ffffff, %f26 = 00000000, %f21 = 90f5e527
	fadds	%f18,%f26,%f21		! %f21 = 58ffffff
!	Mem[0000000010041410] = 00000000, %l0 = 00000000e67a8dd8
	lduba	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = 62ad43b7 077c310c, Mem[0000000010181400] = d88d7ae6 bd42b11c
	stda	%f24,[%i6+%g0]0x88	! Mem[0000000010181400] = 62ad43b7 077c310c

p0_label_80:
!	Mem[0000000010141410] = 00000000, %l1 = 00000000000000cc
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ffff6880, %l2 = 00000000cc0ab2fd
	ldstub	[%o2+%g0],%l2		! %l2 = 000000ff000000ff
!	%l7 = 000000fffffffdb2, Mem[00000000300c1408] = 86803f5d
	stba	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = b2803f5d
!	%l1 = 0000000000000000, Mem[0000000010141410] = 000000cc
	stba	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%l6 = 00580000cf624977, Mem[0000000010081434] = 1ba9813c
	sth	%l6,[%i2+0x034]		! Mem[0000000010081434] = 4977813c
!	%l0 = 0000000000000000, Mem[0000000010101408] = 00000000
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%l0 = 0000000000000000, Mem[0000000030081400] = ffffffff
	stha	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000ffff
!	%l4 = 0000000000000000, Mem[0000000030141410] = 00580000
	stba	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00580000
!	%l5 = 0000000000000000, Mem[0000000030001408] = 7dcf7bff
	stha	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 00007bff
!	Starting 10 instruction Load Burst
!	Mem[000000001008142c] = 3d258100, %l3 = 00000000d2388b98
	ldsha	[%i2+0x02e]%asi,%l3	! %l3 = ffffffffffff8100

p0_label_81:
!	Mem[0000000030181400] = 62000009, %l4 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l4	! %l4 = 0000000000006200
!	Mem[0000000021800040] = ff482728, %l3 = ffffffffffff8100
	ldsb	[%o3+0x040],%l3		! %l3 = ffffffffffffffff
!	%l4 = 0000000000006200, %l6 = 00580000cf624977, %l7 = 000000fffffffdb2
	and	%l4,%l6,%l7		! %l7 = 0000000000004000
!	Mem[0000000010081414] = fffffdb2, %l2 = 00000000000000ff
	lduwa	[%i2+0x014]%asi,%l2	! %l2 = 00000000fffffdb2
!	Mem[0000000030181408] = 00000000, %l2 = 00000000fffffdb2
	lduwa	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 000000ff, %f2  = c47e6127
	lda	[%i2+%o5]0x80,%f2 	! %f2 = 000000ff
!	Mem[0000000010101400] = c41410f000000010, %f12 = 00000000 a8714fac
	ldda	[%i4+%g0]0x88,%f12	! %f12 = c41410f0 00000010
!	Mem[0000000030101408] = 62000000, %f29 = 000086e6
	lda	[%i4+%o4]0x81,%f29	! %f29 = 62000000
!	Mem[0000000030181400] = 62000009, %l1 = 0000000000000000
	ldswa	[%i6+%g0]0x81,%l1	! %l1 = 0000000062000009
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010001400] = fdb20acc
	stha	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = fdb20000

p0_label_82:
!	%l0 = 0000000000000000, Mem[0000000030001410] = 00000000
	stba	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	Mem[0000000010081408] = 00000000, %l3 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%f26 = 00000000, Mem[00000000300c1400] = 00000000
	sta	%f26,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010181410] = 253d0000, %l7 = 0000000000004000
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 00000000253d0000
!	Mem[0000000010081408] = ff000000, %l4 = 0000000000006200
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000030081400] = ffff0000
	stwa	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%f22 = c21b38b1 823fbf33, Mem[0000000010041410] = 00000000 580000d4
	stda	%f22,[%i1+%o5]0x80	! Mem[0000000010041410] = c21b38b1 823fbf33
!	%f7  = fdb200ea, Mem[0000000030101410] = 00000000
	sta	%f7 ,[%i4+%o5]0x89	! Mem[0000000030101410] = fdb200ea
!	%l3 = 0000000000000000, Mem[000000001010140c] = 00006831, %asi = 80
	stwa	%l3,[%i4+0x00c]%asi	! Mem[000000001010140c] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 0000b2fdd2388b98, %l0 = 0000000000000000
	ldxa	[%i0+%g0]0x80,%l0	! %l0 = 0000b2fdd2388b98

p0_label_83:
!	Mem[0000000010001408] = 580000d4, %l6 = 00580000cf624977
	lduha	[%i0+0x00a]%asi,%l6	! %l6 = 00000000000000d4
!	Mem[0000000010041408] = d5b6f705, %l0 = 0000b2fdd2388b98
	lduw	[%i1+%o4],%l0		! %l0 = 00000000d5b6f705
!	Mem[0000000030001400] = ff76513d, %l0 = 00000000d5b6f705
	ldswa	[%i0+%g0]0x81,%l0	! %l0 = ffffffffff76513d
!	Mem[0000000030001400] = ff76513d00000000, %l5 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l5	! %l5 = ff76513d00000000
!	Mem[0000000010001408] = d4000058, %l6 = 00000000000000d4
	lduba	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000058
!	Mem[0000000030181410] = 7dcf7bff, %l6 = 0000000000000058
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101400] = 00000062, %l2 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000062
!	%l0 = ffffffffff76513d, imm = 0000000000000b9c, %l0 = ffffffffff76513d
	orn	%l0,0xb9c,%l0		! %l0 = fffffffffffff57f
!	Mem[0000000010101408] = 00000000, %l5 = ff76513d00000000
	ldswa	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000062, Mem[0000000030001408] = ff7b0000
	stba	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ff7b0062

p0_label_84:
!	Mem[0000000010181438] = 00000000, %l0 = fffffffffffff57f
	swap	[%i6+0x038],%l0		! %l0 = 0000000000000000
!	%f4  = ffcb0000, Mem[0000000010181434] = 00000009
	sta	%f4 ,[%i6+0x034]%asi	! Mem[0000000010181434] = ffcb0000
!	%l0 = 00000000, %l1 = 62000009, Mem[0000000010181400] = 077c310c 62ad43b7
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 62000009
!	Mem[0000000030141400] = 00000000, %l1 = 0000000062000009
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001400] = ff76513d, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 00000000ff76513d
!	Mem[0000000030001408] = ff7b0062, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 00000000ff7b0062
!	Mem[0000000030141410] = 00580000, %l1 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l1	! %l1 = 0000000000580000
!	Mem[0000000020800001] = 05b1779a, %l2 = 0000000000000062
	ldstuba	[%o1+0x001]%asi,%l2	! %l2 = 000000b1000000ff
!	%l0 = 0000000000000000, Mem[0000000030081408] = 988b38d200000000
	stxa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00003e5d, %l2 = 00000000000000b1
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000

p0_label_85:
!	Mem[0000000010101438] = 0e939dcb, %l3 = 00000000ff7b0062
	lduha	[%i4+0x038]%asi,%l3	! %l3 = 0000000000000e93
!	Mem[0000000010001410] = a91b0000 ffffff8d, %l6 = ffffffff, %l7 = 253d0000
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 00000000a91b0000 00000000ffffff8d
!	Mem[0000000020800040] = a682726d, %l2 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffffa682
!	Mem[00000000211c0000] = ffff6880, %l0 = 0000000000000000
	ldsba	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101408] = ff00000000000062, %l5 = 00000000ff76513d
	ldxa	[%i4+%o4]0x89,%l5	! %l5 = ff00000000000062
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000030081400] = 00000000 ffffffff 00000000 00000000
!	Mem[0000000030081410] = d8000000 d9e67963 c0f44a97 b7cca4c2
!	Mem[0000000030081420] = e7888aa7 a4e7ddb5 653f1504 0f06c47d
!	Mem[0000000030081430] = 0d832d3d d964a882 961cdec7 502b1033
	ldda	[%i2]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Mem[0000000010181410] = 0000400090f5e527, %f10 = 09000062 d53f7559
	ldda	[%i6+%o5]0x80,%f10	! %f10 = 00004000 90f5e527
!	Mem[0000000010181414] = 90f5e527, %f14 = 7c50879f
	ld	[%i6+0x014],%f14	! %f14 = 90f5e527
!	%l0 = ffffffffffffffff, immd = fffffffffffff1f6, %l2  = ffffffffffffa682
	mulx	%l0,-0xe0a,%l2		! %l2 = 0000000000000e0a
!	Starting 10 instruction Store Burst
!	%l5 = ff00000000000062, Mem[0000000030041400] = 00000000
	stha	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 00620000

p0_label_86:
!	%l2 = 0000000000000e0a, Mem[00000000201c0001] = 00003e5d
	stb	%l2,[%o0+0x001]		! Mem[00000000201c0000] = 000a3e5d
!	%l3 = 0000000000000e93, Mem[0000000030001410] = 000000005d3f8086
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000e93
!	Mem[00000000100c1408] = ffcb0000, %l5 = ff00000000000062
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 00000000ffcb0000
!	%l6 = 00000000a91b0000, Mem[0000000020800041] = a682726d, %asi = 80
	stba	%l6,[%o1+0x041]%asi	! Mem[0000000020800040] = a600726d
!	Mem[0000000010101400] = 00000010, %l7 = 00000000ffffff8d
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000010
!	%l5 = 00000000ffcb0000, Mem[00000000201c0000] = 000a3e5d
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 00003e5d
!	%f10 = 00004000, Mem[000000001014142c] = 1ba9813c
	st	%f10,[%i5+0x02c]	! Mem[000000001014142c] = 00004000
!	%l0 = ffffffffffffffff, Mem[0000000010081408] = ff000000
	stba	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000
!	Mem[0000000010141406] = 1138def8, %l7 = 0000000000000010
	ldstub	[%i5+0x006],%l7		! %l7 = 000000de000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000000000b2, %l2 = 0000000000000e0a
	ldxa	[%i4+%o5]0x80,%l2	! %l2 = 00000000000000b2

p0_label_87:
!	Mem[00000000100c1410] = 9391adcccc0ab2fd, %l5 = 00000000ffcb0000
	ldxa	[%i3+%o5]0x80,%l5	! %l5 = 9391adcccc0ab2fd
!	Mem[0000000010141408] = ff000000, %l5 = 9391adcccc0ab2fd
	ldswa	[%i5+%o4]0x80,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010181400] = 00000000, %l6 = 00000000a91b0000
	ldsha	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l7 = 00000000000000de
	ldsha	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101414] = 000000b2, %l6 = 0000000000000000
	ldsb	[%i4+0x017],%l6		! %l6 = ffffffffffffffb2
!	Mem[000000001014142c] = 00004000, %l3 = 0000000000000e93
	lduwa	[%i5+0x02c]%asi,%l3	! %l3 = 0000000000004000
!	Mem[0000000030141400] = ff000000, %l4 = 00000000000000ff
	ldswa	[%i5+%g0]0x81,%l4	! %l4 = ffffffffff000000
!	Mem[00000000100c1408] = 00000062, %l7 = 0000000000000000
	ldsh	[%i3+0x00a],%l7		! %l7 = 0000000000000062
!	Mem[0000000030101410] = ea00b2fd, %l7 = 0000000000000062
	ldsha	[%i4+%o5]0x81,%l7	! %l7 = ffffffffffffea00
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = fdb20000, %l7 = ffffffffffffea00
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff

p0_label_88:
!	%l6 = ffffffffffffffb2, Mem[0000000010181408] = ffffff58
	stba	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffb2
!	%l0 = ffffffffffffffff, Mem[0000000010001408] = d4000058
	stba	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = d40000ff
!	Mem[00000000100c1410] = 9391adcc, %l5 = ffffffffff000000
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 000000009391adcc
!	%l4 = ff000000, %l5 = 9391adcc, Mem[0000000010141400] = 00000000 f8ff3811
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = ff000000 9391adcc
!	Mem[0000000010041400] = 05000000, %l1 = 0000000000580000
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 0000000005000000
!	Mem[0000000010001413] = a91b0000, %l1 = 0000000005000000
	ldstub	[%i0+0x013],%l1		! %l1 = 00000000000000ff
!	%f0  = 00000000 28714fac, %l0 = ffffffffffffffff
!	Mem[0000000010181410] = 0000400090f5e527
	add	%i6,0x010,%g1
	stda	%f0,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010181410] = ac4f712800000000
!	Mem[0000000030181400] = 62000009, %l0 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x81,%l0	! %l0 = 00000062000000ff
!	%l7 = 0000000000000000, Mem[0000000030001408] = 00000000
	stwa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 0000000005f7b6d5, %f2  = 000000ff 67296800
	ldda	[%i1+%o4]0x88,%f2 	! %f2  = 00000000 05f7b6d5

p0_label_89:
!	Mem[0000000030041408] = ffffff00, %l5 = 000000009391adcc
	ldsba	[%i1+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181400] = ff000009, %l7 = 0000000000000000
	lduwa	[%i6+%g0]0x81,%l7	! %l7 = 00000000ff000009
!	Mem[00000000100c1400] = 7b0f00ff, %l7 = 00000000ff000009
	lduha	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001410] = 8dffffff ff001ba9, %l2 = 000000b2, %l3 = 00004000
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 00000000ff001ba9 000000008dffffff
!	Mem[0000000010141408] = 00000000000000ff, %f16 = 00000000 ffffffff
	ldda	[%i5+%o4]0x88,%f16	! %f16 = 00000000 000000ff
!	Mem[0000000030081408] = 00000000, %l6 = ffffffffffffffb2
	ldswa	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 7b0f00ff, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141408] = 59753fd5 9d3248ff, %l0 = 00000062, %l1 = 000000ff
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 000000009d3248ff 0000000059753fd5
!	Mem[000000001000142c] = ffa30f7b, %l4 = ffffffffff000000
	ldsw	[%i0+0x02c],%l4		! %l4 = ffffffffffa30f7b
!	Starting 10 instruction Store Burst
!	%l0 = 000000009d3248ff, Mem[0000000010001400] = fdb200ff
	stwa	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 9d3248ff

p0_label_90:
!	Mem[0000000010141410] = 00000000, %l1 = 0000000059753fd5
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l0 = 000000009d3248ff, Mem[0000000030181410] = ff7bcf7d
	stwa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 9d3248ff
!	Mem[0000000030101400] = 00000062, %l1 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 00000062000000ff
!	Mem[0000000010001438] = cfffe277, %l4 = ffffffffffa30f7b
	swap	[%i0+0x038],%l4		! %l4 = 00000000cfffe277
!	%l5 = ffffffffffffffff, Mem[0000000030001410] = 00000000
	stba	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000
!	Mem[0000000030081400] = 00000000, %l4 = 00000000cfffe277
	ldstuba	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030141400] = ff000000
	stwa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[0000000030141410] = 00000000, %l5 = ffffffffffffffff
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030001410] = 000000ff
	stwa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000

p0_label_91:
!	Mem[00000000100c1400] = 7b0f00ff, %l2 = 00000000ff001ba9
	lduha	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%f20 = d8000000 d9e67963, %l0 = 000000009d3248ff
!	Mem[0000000030141400] = 0000000000000062
	stda	%f20,[%i5+%l0]ASI_PST32_SL ! Mem[0000000030141400] = 6379e6d9000000d8
!	%l6 = 0000000000000000, %l4 = 0000000000000000, %l3 = 000000008dffffff
	subc	%l6,%l4,%l3		! %l3 = 0000000000000000
!	Mem[0000000010041428] = 7a012058, %l3 = 0000000000000000
	lduw	[%i1+0x028],%l3		! %l3 = 000000007a012058
!	Mem[0000000030001410] = 0000000000000e93, %l2 = 00000000000000ff
	ldxa	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000e93
!	Mem[0000000010181430] = c06caef7, %l3 = 000000007a012058
	lduwa	[%i6+0x030]%asi,%l3	! %l3 = 00000000c06caef7
!	Mem[00000000100c1410] = fdb20acc000000ff, %f18 = 00000000 00000000
	ldda	[%i3+%o5]0x88,%f18	! %f18 = fdb20acc 000000ff
!	Mem[0000000030181410] = 9d3248ff, %l1 = 0000000000000062
	ldsha	[%i6+%o5]0x81,%l1	! %l1 = ffffffffffff9d32
!	Mem[0000000010041430] = 57296ebf ff38def8, %l4 = 00000000, %l5 = 00000000
	ldd	[%i1+0x030],%l4		! %l4 = 0000000057296ebf 00000000ff38def8
!	Starting 10 instruction Store Burst
!	%f12 = c41410f0 00000010, %l7 = 0000000000000000
!	Mem[0000000010081410] = 000000fffffffdb2
	add	%i2,0x010,%g1
	stda	%f12,[%g1+%l7]ASI_PST32_P ! Mem[0000000010081410] = 000000fffffffdb2

p0_label_92:
!	Mem[0000000010001428] = 7dc8a373ffa30f7b, %l3 = 00000000c06caef7, %l5 = 00000000ff38def8
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = 7dc8a373ffa30f7b
!	Mem[0000000010041410] = c21b38b1, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 000000c2000000ff
!	%f18 = fdb20acc 000000ff, Mem[0000000010041420] = a7803860 000000ff
	stda	%f18,[%i1+0x020]%asi	! Mem[0000000010041420] = fdb20acc 000000ff
!	Mem[0000000010041430] = 57296ebf, %l0 = 000000009d3248ff
	swap	[%i1+0x030],%l0		! %l0 = 0000000057296ebf
!	Mem[0000000010141410] = ff000000, %l6 = 000000c2, %l4 = 57296ebf
	add	%i5,0x10,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000ff000000
!	%f22 = c0f44a97, Mem[0000000030001410] = 00000000
	sta	%f22,[%i0+%o5]0x89	! Mem[0000000030001410] = c0f44a97
!	%l4 = ff000000, %l5 = ffa30f7b, Mem[0000000030181400] = ff000009 29cffb7c
	stda	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000 ffa30f7b
!	%l6 = 00000000000000c2, Mem[0000000020800040] = a600726d
	sth	%l6,[%o1+0x040]		! Mem[0000000020800040] = 00c2726d
!	Mem[0000000030041400] = 00006200, %l6 = 00000000000000c2
	swapa	[%i1+%g0]0x89,%l6	! %l6 = 0000000000006200
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00005800ff0000e2, %l4 = 00000000ff000000
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = 00005800ff0000e2

p0_label_93:
!	Mem[0000000010181410] = 28714fac, %l5 = 7dc8a373ffa30f7b
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = 0000000028714fac
!	Mem[0000000010141410] = 000000ff, %f30 = 961cdec7
	lda	[%i5+%o5]0x88,%f30	! %f30 = 000000ff
!	Mem[0000000030041410] = 000000ff, %l2 = 0000000000000e93
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = b2ffffffffffff8d, %f6  = 00000000 fdb200ea
	ldda	[%i6+%o4]0x80,%f6 	! %f6  = b2ffffff ffffff8d
!	%f1  = 28714fac, %f23 = b7cca4c2
	fsqrts	%f1 ,%f23		! %f23 = 33f88c10
!	Mem[0000000030041408] = ffffff00 00000000, %l0 = 57296ebf, %l1 = ffff9d32
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 00000000ffffff00 0000000000000000
!	Mem[0000000030041400] = 7b00ea38 000000c2, %l2 = 00000000, %l3 = c06caef7
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000c2 000000007b00ea38
!	Mem[0000000010101408] = 00000000 00000000, %l0 = ffffff00, %l1 = 00000000
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	%l2 = 00000000000000c2, %l7 = 0000000000000000, %l2 = 00000000000000c2
	xnor	%l2,%l7,%l2		! %l2 = ffffffffffffff3d
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffff3d, Mem[0000000010041410] = ff1b38b1
	stha	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = ff3d38b1

p0_label_94:
!	Mem[0000000010001434] = d967c860, %l1 = 00000000, %l1 = 00000000
	add	%i0,0x34,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 00000000d967c860
!	Mem[0000000010181408] = b2ffffff, %l3 = 000000007b00ea38
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 000000b2000000ff
!	Mem[0000000030081408] = 00000000, %l2 = ffffffffffffff3d
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000, %l1 = d967c860, Mem[0000000010101400] = ffffff8d c41410f0
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 d967c860
!	%l3 = 00000000000000b2, Mem[0000000020800000] = 05ff779a
	stb	%l3,[%o1+%g0]		! Mem[0000000020800000] = b2ff779a
!	Mem[0000000010141408] = 000000ff, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000028714fac, Mem[00000000300c1400] = ac4f712800000000
	stxa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000028714fac
!	%l5 = 0000000028714fac, Mem[0000000030141408] = ff48329d
	stwa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 28714fac
!	%f4  = ffcb0000 00000f7b, Mem[00000000300c1410] = ffcb0000 00000f7b
	stda	%f4 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffcb0000 00000f7b
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 8dffffffff001ba9, %l5 = 0000000028714fac
	ldxa	[%i0+%o5]0x88,%l5	! %l5 = 8dffffffff001ba9

p0_label_95:
!	Mem[0000000010141404] = ccad9193, %l7 = 0000000000000000
	ldub	[%i5+0x004],%l7		! %l7 = 00000000000000cc
!	Code Fragment 3
p0_fragment_9:
!	%l0 = 0000000000000000
	setx	0x8a36f57812e3a5f4,%g7,%l0 ! %l0 = 8a36f57812e3a5f4
!	%l1 = 00000000d967c860
	setx	0xca8eaaefff2a5997,%g7,%l1 ! %l1 = ca8eaaefff2a5997
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8a36f57812e3a5f4
	setx	0x42f449f84fdbd6a0,%g7,%l0 ! %l0 = 42f449f84fdbd6a0
!	%l1 = ca8eaaefff2a5997
	setx	0xb108d21fafdf1565,%g7,%l1 ! %l1 = b108d21fafdf1565
!	%l0 = 42f449f84fdbd6a0, %l6 = 0000000000006200, %l4 = 00005800ff0000e2
	or	%l0,%l6,%l4		! %l4 = 42f449f84fdbf6a0
!	Mem[0000000010141408] = 00000000, %f5  = 00000f7b
	lda	[%i5+%o4]0x80,%f5 	! %f5 = 00000000
!	Mem[0000000010181410] = 28714fac, %l6 = 0000000000006200
	ldswa	[%i6+%o5]0x88,%l6	! %l6 = 0000000028714fac
!	Mem[00000000100c1408] = 7b0f0000 62000000, %l2 = 000000ff, %l3 = 000000b2
	ldda	[%i3+%o4]0x88,%l2	! %l2 = 0000000062000000 000000007b0f0000
!	Mem[00000000100c1408] = 00000062, %f3  = 05f7b6d5
	ld	[%i3+%o4],%f3 	! %f3 = 00000062
!	Mem[0000000030081410] = 000000d8, %l4 = 42f449f84fdbf6a0
	lduba	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000d8
!	Mem[0000000010181410] = ac4f712800000000, %f28 = 0d832d3d d964a882
	ldda	[%i6+%o5]0x80,%f28	! %f28 = ac4f7128 00000000
!	Starting 10 instruction Store Burst
!	%l0 = 42f449f84fdbd6a0, Mem[0000000010001410] = 8dffffffff001ba9
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 42f449f84fdbd6a0

p0_label_96:
!	%l4 = 00000000000000d8, Mem[0000000010141400] = 000000ff
	stba	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = d80000ff
!	%l7 = 00000000000000cc, Mem[0000000010101400] = 0000000060c867d9
	stx	%l7,[%i4+%g0]		! Mem[0000000010101400] = 00000000000000cc
!	%l5 = 8dffffffff001ba9, Mem[0000000010181410] = 28714fac
	stha	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 28711ba9
!	%l5 = 8dffffffff001ba9, Mem[0000000010181410] = 28711ba9
	stba	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 28711ba9
!	%l2 = 0000000062000000, immed = ffffffb4, %y  = ffffffff
	udiv	%l2,-0x04c,%l1		! %l1 = 00000000ffffffff
	mov	%l0,%y			! %y = 4fdbd6a0
!	%l5 = 8dffffffff001ba9, Mem[0000000010181410] = 28711ba9
	stwa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = ff001ba9
!	Mem[0000000030001400] = 00000000, %l5 = 8dffffffff001ba9
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Code Fragment 4
p0_fragment_10:
!	%l0 = 42f449f84fdbd6a0
	setx	0xc7e84927f8960cb5,%g7,%l0 ! %l0 = c7e84927f8960cb5
!	%l1 = 00000000ffffffff
	setx	0x8187e07043add92f,%g7,%l1 ! %l1 = 8187e07043add92f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c7e84927f8960cb5
	setx	0xf5a920401c5648fe,%g7,%l0 ! %l0 = f5a920401c5648fe
!	%l1 = 8187e07043add92f
	setx	0x8eda2b48116014a1,%g7,%l1 ! %l1 = 8eda2b48116014a1
!	%l4 = 000000d8, %l5 = 00000000, Mem[0000000010041408] = 05f7b6d5 00000000
	stda	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000d8 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 000000c2, %l1 = 8eda2b48116014a1
	ldswa	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000c2

p0_label_97:
!	Mem[0000000030041400] = 000000c2, %l7 = 00000000000000cc
	lduba	[%i1+%g0]0x89,%l7	! %l7 = 00000000000000c2
!	Mem[00000000300c1410] = ffcb000000000f7b, %l0 = f5a920401c5648fe
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = ffcb000000000f7b
!	Mem[0000000010001428] = 7dc8a373 ffa30f7b, %l6 = 28714fac, %l7 = 000000c2
	ldd	[%i0+0x028],%l6		! %l6 = 000000007dc8a373 00000000ffa30f7b
!	Mem[0000000010001408] = ff0000d4, %l2 = 0000000062000000
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 00000000ff0000d4
!	Mem[0000000010101408] = 00000000, %l2 = 00000000ff0000d4
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l4 = 00000000000000d8
	lduba	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000030081400] = ff000000 ffffffff ff000000 00000000
!	Mem[0000000030081410] = d8000000 d9e67963 c0f44a97 b7cca4c2
!	Mem[0000000030081420] = e7888aa7 a4e7ddb5 653f1504 0f06c47d
!	Mem[0000000030081430] = 0d832d3d d964a882 961cdec7 502b1033
	ldda	[%i2]ASI_BLK_AIUS,%f0	! Block Load from 0000000030081400
!	Mem[0000000030041408] = 00ffffff, %l7 = 00000000ffa30f7b
	ldsha	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1400] = 0000000028714fac, %f26 = 653f1504 0f06c47d
	ldda	[%i3+%g0]0x89,%f26	! %f26 = 00000000 28714fac
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030181410] = 00000000ff48329d
	stxa	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000000

p0_label_98:
!	%l1 = 00000000000000c2, Mem[0000000030101410] = ea00b2fd
	stha	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 00c2b2fd
!	%f28 = ac4f7128 00000000, %l7 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000392408e9
	add	%i0,0x008,%g1
	stda	%f28,[%g1+%l7]ASI_PST16_S ! Mem[0000000030001408] = ac4f712800000000
!	Mem[0000000030101400] = ff000000, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[00000000100c1410] = ff000000, %l3 = 000000007b0f0000
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	%l5 = 00000000ff000000, imm = 000000000000021c, %l6 = 000000007dc8a373
	xnor	%l5,0x21c,%l6		! %l6 = ffffffff00fffde3
!	%l5 = 00000000ff000000, Mem[0000000010041408] = d800000000000000
	stxa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000ff000000
!	Mem[0000000030081400] = ff000000, %l1 = 00000000000000c2
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%f24 = e7888aa7 a4e7ddb5, Mem[0000000030001408] = 28714fac 00000000
	stda	%f24,[%i0+%o4]0x89	! Mem[0000000030001408] = e7888aa7 a4e7ddb5
!	%l6 = ffffffff00fffde3, Mem[0000000010001438] = ffa30f7b75b6b785
	stx	%l6,[%i0+0x038]		! Mem[0000000010001438] = ffffffff00fffde3
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l0 = ffcb000000000f7b
	lduba	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000

p0_label_99:
!	Mem[0000000030001400] = 000000ff, %l5 = 00000000ff000000
	ldsba	[%i0+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141410] = ffffffff, %l5 = ffffffffffffffff
	ldsha	[%i5+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001400] = ff00000000000000, %f26 = 00000000 28714fac
	ldda	[%i0+%g0]0x81,%f26	! %f26 = ff000000 00000000
!	Mem[0000000030181410] = 0000000000000000, %l1 = 00000000000000ff
	ldxa	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001408] = a6e2cfa1 d40000ff, %l2 = 000000ff, %l3 = ff000000
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 00000000d40000ff 00000000a6e2cfa1
!	Mem[00000000211c0000] = ffff6880, %l6 = ffffffff00fffde3
	ldsb	[%o2+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000300c1410] = ffcb0000, %l4 = 0000000000000000
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 00000000ffcb0000
!	Mem[00000000201c0000] = 00003e5d, %l4 = 00000000ffcb0000
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l1	! %l1 = 00000000000000ff

p0_label_100:
!	%f28 = ac4f7128 00000000, Mem[0000000010181408] = ffffffff ffffff8d
	std	%f28,[%i6+%o4]	! Mem[0000000010181408] = ac4f7128 00000000
!	Mem[0000000030101400] = 00000000, %l5 = ffffffffffffffff
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%l2 = 00000000d40000ff, Mem[0000000030181410] = ff000000
	stwa	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = d40000ff
!	%l2 = d40000ff, %l3 = a6e2cfa1, Mem[0000000010101400] = 00000000 cc000000
	stda	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = d40000ff a6e2cfa1
!	%l1 = 0000000000000000, Mem[00000000201c0000] = 00003e5d
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 00003e5d
!	%f17 = 000000ff, Mem[00000000300c1400] = ac4f7128
	sta	%f17,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff
!	%l5 = 0000000000000000, Mem[0000000010081408] = ff000000
	stwa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%f31 = 502b1033, Mem[0000000010101408] = 00000000
	sta	%f31,[%i4+%o4]0x80	! Mem[0000000010101408] = 502b1033
!	%f26 = ff000000 00000000, Mem[0000000010181410] = a91b00ff 00000000
	stda	%f26,[%i6+0x010]%asi	! Mem[0000000010181410] = ff000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000ff000000, %f18 = fdb20acc 000000ff
	ldda	[%i1+%o4]0x80,%f18	! %f18 = 00000000 ff000000

p0_label_101:
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000030181400] = ff000000 ffa30f7b 00000000 28714fac
!	Mem[0000000030181410] = d40000ff 00000000 89a56831 5c11a999
!	Mem[0000000030181420] = cb9ddec6 09be3ca1 e98b38d2 38ea007b
!	Mem[0000000030181430] = 8a7635e1 b743ad62 c15c5f2a 7af196a3
	ldda	[%i6]ASI_BLK_SL,%f0	! Block Load from 0000000030181400
!	Mem[0000000010041408] = 00000000, %l3 = 00000000a6e2cfa1
	lduwa	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = ffffff00, %l5 = 0000000000000000
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = ffffffffffffff00
!	%f28 = ac4f7128, %f20 = d8000000, %f20 = d8000000
	fsubs	%f28,%f20,%f20		! %f20 = 58000000
!	Mem[00000000100c1410] = fdb20acc 00000f7b, %l4 = 00000000, %l5 = ffffff00
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000f7b 00000000fdb20acc
!	Mem[0000000030181408] = 00000000, %l1 = 0000000000000000
	lduwa	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = ff000f7b, %l1 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = ffffffffff000f7b
!	Mem[0000000030041410] = 000000ff, %l6 = ffffffffffffffff
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 5d3f80b2, %f31 = 502b1033
	lda	[%i3+%o4]0x89,%f31	! %f31 = 5d3f80b2
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (16)
!	%l6 = 0000000000000000, Mem[0000000030181400] = ff000000
	stwa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000

p0_label_102:
!	%f16 = 00000000 000000ff, %l5 = 00000000fdb20acc
!	Mem[0000000010001430] = 0c8261bed967c860
	add	%i0,0x030,%g1
	stda	%f16,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010001430] = 0c8261bed967c860
!	%l7 = ffffffffffffffff, Mem[0000000030141408] = ac4f7128
	stha	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = ac4fffff
!	%l7 = ffffffffffffffff, Mem[00000000300c1400] = 000000ff
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff
!	%l0 = 00000000, %l1 = ff000f7b, Mem[0000000010041410] = ff3d38b1 823fbf33
	stda	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 ff000f7b
!	Mem[0000000030001408] = a4e7ddb5, %l6 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000a4e7ddb5
!	%f16 = 00000000 000000ff 00000000 ff000000
!	%f20 = 58000000 d9e67963 c0f44a97 33f88c10
!	%f24 = e7888aa7 a4e7ddb5 ff000000 00000000
!	%f28 = ac4f7128 00000000 000000ff 5d3f80b2
	stda	%f16,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	%l5 = 00000000fdb20acc, Mem[0000000010141400] = d80000ff
	stba	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = cc0000ff
!	%l6 = a4e7ddb5, %l7 = ffffffff, Mem[0000000010101400] = ff0000d4 a1cfe2a6
	stda	%l6,[%i4+0x000]%asi	! Mem[0000000010101400] = a4e7ddb5 ffffffff
!	Mem[0000000030181408] = 00000000, %l7 = ffffffffffffffff
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffffffff, %l2 = 00000000d40000ff
	ldsha	[%i3+%g0]0x81,%l2	! %l2 = ffffffffffffffff

p0_label_103:
!	Mem[0000000020800000] = b2ff779a, %l1 = ffffffffff000f7b
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 000000000000b2ff
!	%f15 = 2a5f5cc1, %f8  = a13cbe09, %f15 = 2a5f5cc1
	fmuls	%f15,%f8 ,%f15		! %f15 = 8c24adec
!	Mem[0000000030101408] = 62000000 000000ff, %l6 = a4e7ddb5, %l7 = 00000000
	ldda	[%i4+%o4]0x81,%l6	! %l6 = 0000000062000000 00000000000000ff
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010041420] = fdb20acc 000000ff, %l4 = 00000f7b, %l5 = fdb20acc
	ldda	[%i1+0x020]%asi,%l4	! %l4 = 00000000fdb20acc 00000000000000ff
!	Mem[0000000030001400] = 000000ff, %l7 = 00000000000000ff
	lduba	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081408] = ff000000 00000000, %l0 = 00000000, %l1 = 0000b2ff
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[00000000100c1410] = 7b0f0000, %l3 = 0000000000000000
	ldsba	[%i3+%o5]0x80,%l3	! %l3 = 000000000000007b
!	Mem[0000000030141408] = ffff4fac, %f31 = 5d3f80b2
	lda	[%i5+%o4]0x81,%f31	! %f31 = ffff4fac
!	Mem[0000000010041410] = 00000000ff000f7b, %l1 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l1	! %l1 = 00000000ff000f7b
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 00000062, %l4 = 00000000fdb20acc
	swap	[%i3+%o4],%l4		! %l4 = 0000000000000062

p0_label_104:
!	%l0 = 00000000ff000000, Mem[00000000211c0001] = ffff6880, %asi = 80
	stba	%l0,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff006880
!	%l1 = 00000000ff000f7b, Mem[0000000030081400] = 000000ff
	stba	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000007b
!	%l1 = 00000000ff000f7b, Mem[0000000010141408] = 00000000
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000f7b
!	%l3 = 000000000000007b, Mem[00000000300c1410] = ffcb0000
	stwa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000007b
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 00000000ff000000
	setx	0xc17d361ff23d1605,%g7,%l0 ! %l0 = c17d361ff23d1605
!	%l1 = 00000000ff000f7b
	setx	0xa063b8383c0fd9f1,%g7,%l1 ! %l1 = a063b8383c0fd9f1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c17d361ff23d1605
	setx	0xafb541b7b4a14dfa,%g7,%l0 ! %l0 = afb541b7b4a14dfa
!	%l1 = a063b8383c0fd9f1
	setx	0x29702f6fc17681b7,%g7,%l1 ! %l1 = 29702f6fc17681b7
!	%l2 = ffffffffffffffff, Mem[0000000010081408] = 00000000
	stwa	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff
!	%l3 = 000000000000007b, Mem[0000000010081400] = ea00b2fd00000000
	stxa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000000000007b
!	%l6 = 0000000062000000, Mem[0000000010181410] = ff000000
	stba	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%l4 = 0000000000000062, Mem[0000000030101408] = ff00000000000062
	stxa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000062
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 59753fd5ac4fffff, %l4 = 0000000000000062
	ldxa	[%i5+%o4]0x89,%l4	! %l4 = 59753fd5ac4fffff

p0_label_105:
!	Mem[0000000020800040] = 00c2726d, %l2 = ffffffffffffffff
	lduha	[%o1+0x040]%asi,%l2	! %l2 = 00000000000000c2
!	Mem[0000000010141400] = ff0000cc, %l1 = 29702f6fc17681b7
	ldsha	[%i5+%g0]0x88,%l1	! %l1 = 00000000000000cc
!	Mem[00000000100c1400] = ff000f7b f01014c4, %l2 = 000000c2, %l3 = 0000007b
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000ff000f7b 00000000f01014c4
!	Mem[0000000010041400] = 00005800, %l0 = afb541b7b4a14dfa
	ldsb	[%i1+%g0],%l0		! %l0 = 0000000000000000
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 0000000000000000
	setx	0x4b9525a8559be9b8,%g7,%l0 ! %l0 = 4b9525a8559be9b8
!	%l1 = 00000000000000cc
	setx	0xac47a037ebc5b0a4,%g7,%l1 ! %l1 = ac47a037ebc5b0a4
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4b9525a8559be9b8
	setx	0x399c07d806c171a3,%g7,%l0 ! %l0 = 399c07d806c171a3
!	%l1 = ac47a037ebc5b0a4
	setx	0x7c3401e065b79e05,%g7,%l1 ! %l1 = 7c3401e065b79e05
!	Mem[0000000030141400] = 6379e6d9, %f0  = 7b0fa3ff
	lda	[%i5+%g0]0x81,%f0 	! %f0 = 6379e6d9
!	Mem[0000000030141400] = d8000000d9e67963, %f2  = ac4f7128 00000000
	ldda	[%i5+%g0]0x89,%f2 	! %f2  = d8000000 d9e67963
!	Mem[0000000030141410] = ffffffff, %l5 = 00000000000000ff
	lduwa	[%i5+%o5]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010041428] = 7a012058 5df88086, %l0 = 06c171a3, %l1 = 65b79e05
	ldda	[%i1+0x028]%asi,%l0	! %l0 = 000000007a012058 000000005df88086
!	Starting 10 instruction Store Burst
!	%l4 = 59753fd5ac4fffff, Mem[0000000030081408] = ff000000
	stwa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = ac4fffff

p0_label_106:
!	%f0  = 6379e6d9 000000ff d8000000 d9e67963
!	%f4  = 00000000 ff0000d4 99a9115c 3168a589
!	%f8  = a13cbe09 c6de9dcb 7b00ea38 d2388be9
!	%f12 = 62ad43b7 e135768a a396f17a 8c24adec
	stda	%f0,[%i2]ASI_BLK_AIUS	! Block Store to 0000000030081400
!	%l4 = 59753fd5ac4fffff, Mem[0000000030181400] = 7b0fa3ff00000000
	stxa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 59753fd5ac4fffff
!	%l3 = 00000000f01014c4, immd = 000000000000004f, %l0  = 000000007a012058
	mulx	%l3,0x04f,%l0		! %l0 = 0000004a14f6687c
!	%l3 = 00000000f01014c4, Mem[0000000010181414] = 00000000, %asi = 80
	stwa	%l3,[%i6+0x014]%asi	! Mem[0000000010181414] = f01014c4
!	Mem[0000000010041410] = 00000000, %l4 = 59753fd5ac4fffff
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l2 = 00000000ff000f7b, Mem[0000000030001400] = 000000ff
	stba	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000007b
!	%l0 = 0000004a14f6687c, Mem[0000000010141400] = cc0000ff
	stwa	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 14f6687c
!	Mem[0000000010141410] = 000000ff, %l6 = 0000000062000000
	ldstuba	[%i5+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%f20 = 58000000 d9e67963, Mem[0000000030041400] = 00000000 ff000000
	stda	%f20,[%i1+%g0]0x89	! Mem[0000000030041400] = 58000000 d9e67963
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 974af4c0, %l4 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l4	! %l4 = 00000000974af4c0

p0_label_107:
!	Mem[0000000010181428] = 0000000038ea007b, %f20 = 58000000 d9e67963
	ldd	[%i6+0x028],%f20	! %f20 = 00000000 38ea007b
!	Mem[0000000010041408] = 00000000, %l2 = 00000000ff000f7b
	ldswa	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000030081408] = d8000000d9e67963, %l7 = 00000000000000ff
	ldxa	[%i2+%o4]0x81,%l7	! %l7 = d8000000d9e67963
!	Mem[0000000030101408] = 00000062, %l0 = 0000004a14f6687c
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 00000062000000ff
!	Mem[0000000030041410] = 58000000, %l4 = 00000000974af4c0
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000005800
!	Mem[0000000030001408] = 00000000, %l3 = 00000000f01014c4
	ldswa	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 000000ff, %l7 = d8000000d9e67963
	ldsha	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%f20 = 00000000, %f10 = 7b00ea38 d2388be9
	fstox	%f20,%f10		! %f10 = 00000000 00000000
!	Mem[000000001008143c] = 00000000, %l2 = 0000000000000000
	lduw	[%i2+0x03c],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030041410] = 00000058
	stwa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000

p0_label_108:
!	Mem[000000001004143c] = baefe943, %l4 = 0000000000005800
	ldstuba	[%i1+0x03c]%asi,%l4	! %l4 = 000000ba000000ff
!	%l1 = 000000005df88086, Mem[0000000030141410] = ffffffff
	stba	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffff86
!	%l1 = 000000005df88086, Mem[00000000100c1410] = 7b0f0000, %asi = 80
	stba	%l1,[%i3+0x010]%asi	! Mem[00000000100c1410] = 860f0000
!	Mem[0000000030041400] = d9e67963, %l1 = 000000005df88086
	ldstuba	[%i1+%g0]0x89,%l1	! %l1 = 00000063000000ff
!	%l2 = 0000000000000000, Mem[0000000010081408] = ffffffff
	stba	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ffffff
!	%f15 = 8c24adec, Mem[00000000300c1408] = b2803f5d
	sta	%f15,[%i3+%o4]0x81	! Mem[00000000300c1408] = 8c24adec
!	%f16 = 00000000 000000ff, %l0 = 0000000000000062
!	Mem[0000000030181428] = e98b38d238ea007b
	add	%i6,0x028,%g1
	stda	%f16,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030181428] = e98b000038ea007b
!	%f20 = 00000000 38ea007b, %l5 = 00000000ffffffff
!	Mem[0000000030041408] = 00000000ff000000
	add	%i1,0x008,%g1
	stda	%f20,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030041408] = 7b00ea3800000000
!	%l0 = 00000062, %l1 = 00000063, Mem[0000000010181408] = ac4f7128 00000000
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000062 00000063
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = d9e679ff, %l7 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l7	! %l7 = ffffffffd9e679ff

p0_label_109:
!	Mem[0000000010141400] = 7c68f614, %l1 = 0000000000000063
	ldswa	[%i5+%g0]0x88,%l1	! %l1 = 000000007c68f614
!	Mem[00000000300c1400] = ffffffff, %l0 = 0000000000000062
	lduwa	[%i3+%g0]0x81,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010181408] = 62000000, %l4 = 00000000000000ba
	lduwa	[%i6+%o4]0x88,%l4	! %l4 = 0000000062000000
!	Mem[00000000300c1400] = ffffffff, %l0 = 00000000ffffffff
	lduha	[%i3+%g0]0x89,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030081400] = ff000000d9e67963, %l6 = 00000000000000ff
	ldxa	[%i2+%g0]0x89,%l6	! %l6 = ff000000d9e67963
!	Mem[0000000010081400] = 7b000000, %l7 = ffffffffd9e679ff
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = 000000007b000000
!	Mem[0000000010101408] = 502b103300000000, %l5 = 00000000ffffffff
	ldx	[%i4+%o4],%l5		! %l5 = 502b103300000000
!	Mem[0000000010141410] = 62000000 000000ff, %l4 = 62000000, %l5 = 00000000
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff 0000000062000000
!	Mem[0000000030101400] = ffffffff b1381bc2, %l6 = d9e67963, %l7 = 7b000000
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 00000000ffffffff 00000000b1381bc2
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[00000000218001c0] = 363ca57a, %asi = 80
	stha	%l4,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 00ffa57a

p0_label_110:
!	%f30 = 000000ff ffff4fac, %l2 = 0000000000000000
!	Mem[0000000030181408] = ffffffff28714fac
	add	%i6,0x008,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_S ! Mem[0000000030181408] = ffffffff28714fac
!	%f8  = a13cbe09 c6de9dcb, Mem[0000000030001410] = 974af4c0 00000e93
	stda	%f8 ,[%i0+%o5]0x81	! Mem[0000000030001410] = a13cbe09 c6de9dcb
!	%l6 = ffffffff, %l7 = b1381bc2, Mem[0000000010101410] = 00000000 000000b2
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffff b1381bc2
!	%l5 = 0000000062000000, Mem[0000000010101408] = 33102b50
	stha	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 33100000
!	%l7 = 00000000b1381bc2, Mem[00000000300c1408] = 8c24adec
	stba	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = c224adec
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[000000001010141c] = ccad9193, %l3 = 0000000000000000, %asi = 80
	swapa	[%i4+0x01c]%asi,%l3	! %l3 = 00000000ccad9193
!	%l7 = 00000000b1381bc2, Mem[0000000030141400] = 6379e6d9
	stwa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = b1381bc2
!	%l0 = 000000000000ffff, Mem[0000000030081400] = d9e67963
	stwa	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 774962cfffffff86, %l2 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l2	! %l2 = 774962cfffffff86

p0_label_111:
!	Mem[0000000030141410] = 86ffffff, %l2 = 774962cfffffff86
	ldsba	[%i5+%o5]0x81,%l2	! %l2 = ffffffffffffff86
!	Mem[0000000030001410] = a13cbe09, %l3 = 00000000ccad9193
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 000000000000a13c
!	Mem[0000000010081408] = 00ffffff00006200, %f22 = c0f44a97 33f88c10
	ldda	[%i2+%o4]0x80,%f22	! %f22 = 00ffffff 00006200
!	Mem[0000000030101408] = ff00000000000000, %l5 = 0000000062000000
	ldxa	[%i4+%o4]0x81,%l5	! %l5 = ff00000000000000
!	Mem[0000000010001410] = 4fdbd6a0, %l0 = 000000000000ffff
	lduha	[%i0+%o5]0x88,%l0	! %l0 = 000000000000d6a0
!	Mem[0000000030141408] = ac4fffff, %l7 = 00000000b1381bc2
	ldswa	[%i5+%o4]0x89,%l7	! %l7 = ffffffffac4fffff
!	%f16 = 00000000, %f27 = 00000000, %f1  = 000000ff
	fsubs	%f16,%f27,%f1 		! %f1  = 00000000
!	Mem[0000000010001408] = a6e2cfa1 d40000ff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 00000000d40000ff 00000000a6e2cfa1
!	Mem[0000000030101410] = fdb2c200, %l5 = 00000000a6e2cfa1
	lduba	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f7  = 3168a589, Mem[0000000010141410] = ff000000
	sta	%f7 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 3168a589

p0_label_112:
!	Mem[000000001000140c] = a1cfe2a6, %l0 = 000000000000d6a0
	swap	[%i0+0x00c],%l0		! %l0 = 00000000a1cfe2a6
!	%l5 = 0000000000000000, Mem[0000000030141408] = ffff4fac
	stba	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ff4fac
!	%l6 = 00000000ffffffff, Mem[0000000021800100] = 7b655371
	sth	%l6,[%o3+0x100]		! Mem[0000000021800100] = ffff5371
!	%l1 = 000000007c68f614, Mem[0000000010181408] = 0000006200000063
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000007c68f614
!	Mem[00000000300c1408] = c224adec, %l3 = 000000000000a13c
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 00000000c224adec
!	Mem[00000000100c1400] = 7b0f00ff, %l6 = 00000000ffffffff
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	%f24 = e7888aa7 a4e7ddb5, Mem[0000000010141410] = 3168a589 00000062
	stda	%f24,[%i5+%o5]0x80	! Mem[0000000010141410] = e7888aa7 a4e7ddb5
!	%f18 = 00000000 ff000000, Mem[0000000030041410] = 00000000 d9e67963
	stda	%f18,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 ff000000
!	%l6 = 00000000000000ff, %l5 = 0000000000000000, %l4 = 00000000d40000ff
	sdivx	%l6,%l5,%l4		! Div by zero, %l0 = 00000000a1cfe2f6
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = 00000000 0000000a, %l2 = ffffff86, %l3 = c224adec
	ldda	[%i3+0x020]%asi,%l2	! %l2 = 0000000000000000 000000000000000a

p0_label_113:
!	Mem[0000000030081408] = 000000d8, %f24 = e7888aa7
	lda	[%i2+%o4]0x89,%f24	! %f24 = 000000d8
!	Mem[0000000010181410] = 000000ff, %f8  = a13cbe09
	lda	[%i6+%o5]0x88,%f8 	! %f8 = 000000ff
!	Mem[00000000300c1408] = 0000a13c f01014c4, %l6 = 000000ff, %l7 = ac4fffff
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 000000000000a13c 00000000f01014c4
!	Mem[0000000010001410] = a0d6db4f f849f442, %l0 = a1cfe2ce, %l1 = 7c68f614
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 00000000a0d6db4f 00000000f849f442
!	Mem[0000000030001410] = 09be3ca1, %f30 = 000000ff
	lda	[%i0+%o5]0x89,%f30	! %f30 = 09be3ca1
!	Mem[0000000010001400] = ff48329d, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101400] = c21b38b1ffffffff, %f6  = 99a9115c 3168a589
	ldda	[%i4+%g0]0x89,%f6 	! %f6  = c21b38b1 ffffffff
!	Mem[0000000030101400] = ffffffff, %l4 = 00000000d40000ff
	ldsha	[%i4+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	%l2 = 00000000000000ff, %l0 = 00000000a0d6db4f, %l2 = 00000000000000ff
	addc	%l2,%l0,%l2		! %l2 = 00000000a0d6dc4e
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = ff000000, %l0 = 00000000a0d6db4f
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 000000ff000000ff

p0_label_114:
!	%l2 = a0d6dc4e, %l3 = 0000000a, Mem[0000000030041400] = d9e679ff 58000000
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = a0d6dc4e 0000000a
!	%l7 = 00000000f01014c4, Mem[0000000030181400] = 59753fd5ac4fffff
	stxa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000f01014c4
!	Mem[00000000300c1410] = 0000007b, %l7 = 00000000f01014c4
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 000000000000007b
!	Mem[00000000100c1400] = ff000f7b, %l4 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	%f27 = 00000000, Mem[00000000100c1408] = cc0ab2fd
	sta	%f27,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	Mem[00000000100c1410] = 00000f86, %l5 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000f86
!	%l2 = 00000000a0d6dc4e, Mem[0000000010181408] = 00000000
	stba	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000004e
!	%f16 = 00000000 000000ff, %l6 = 000000000000a13c
!	Mem[0000000010181428] = 0000000038ea007b
	add	%i6,0x028,%g1
	stda	%f16,[%g1+%l6]ASI_PST8_P ! Mem[0000000010181428] = 000000000000007b
!	Mem[0000000010101408] = 00001033, %l5 = 00000f86, %l0 = 000000ff
	add	%i4,0x08,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 0000000000001033
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff000f7b, %l0 = 0000000000001033
	ldswa	[%i3+%g0]0x80,%l0	! %l0 = ffffffffff000f7b

p0_label_115:
!	Mem[00000000100c1410] = 00000000, %f10 = 00000000
	lda	[%i3+%o5]0x88,%f10	! %f10 = 00000000
!	Mem[0000000010101428] = 90f5e527, %l0 = ffffffffff000f7b
	ldub	[%i4+0x02b],%l0		! %l0 = 0000000000000027
!	Mem[00000000300c1410] = c41410f0, %l6 = 000000000000a13c
	lduwa	[%i3+%o5]0x89,%l6	! %l6 = 00000000c41410f0
!	Mem[0000000010181434] = ffcb0000, %f10 = 00000000
	ld	[%i6+0x034],%f10	! %f10 = ffcb0000
!	Mem[00000000211c0000] = ff006880, %l1 = 00000000f849f442
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030181408] = ac4f7128ffffffff, %f8  = 000000ff c6de9dcb
	ldda	[%i6+%o4]0x89,%f8 	! %f8  = ac4f7128 ffffffff
!	Mem[0000000010141418] = 83018bde, %l1 = ffffffffffffff00
	lduw	[%i5+0x018],%l1		! %l1 = 0000000083018bde
!	Code Fragment 3
p0_fragment_13:
!	%l0 = 0000000000000027
	setx	0xbfabbee02932fd74,%g7,%l0 ! %l0 = bfabbee02932fd74
!	%l1 = 0000000083018bde
	setx	0xb73c841fd39888e4,%g7,%l1 ! %l1 = b73c841fd39888e4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = bfabbee02932fd74
	setx	0xc37eb26809169f38,%g7,%l0 ! %l0 = c37eb26809169f38
!	%l1 = b73c841fd39888e4
	setx	0x37a5145fd67814ec,%g7,%l1 ! %l1 = 37a5145fd67814ec
!	Mem[0000000030081410] = 00000000, %l7 = 000000000000007b
	ldsha	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = a78a88e7, %l6 = 00000000c41410f0
	ldstuba	[%i5+%o5]0x88,%l6	! %l6 = 000000e7000000ff

p0_label_116:
!	Mem[0000000010041400] = 00580000, %l1 = 37a5145fd67814ec
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101410] = ffffffff, %l3 = 000000000000000a
	swap	[%i4+%o5],%l3		! %l3 = 00000000ffffffff
!	%l6 = 00000000000000e7, Mem[00000000300c1410] = f01014c4
	stha	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00e714c4
!	%l5 = 0000000000000f86, Mem[0000000010181408] = 4e000000
	stwa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000f86
!	Mem[00000000100c1400] = ff000f7b, %l2 = a0d6dc4e, %l6 = 000000e7
	casa	[%i3]0x80,%l2,%l6	! %l6 = 00000000ff000f7b
!	%l5 = 0000000000000f86, Mem[0000000030141400] = b1381bc2
	stba	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 86381bc2
!	%f31 = ffff4fac, Mem[00000000300c1410] = c414e700
	sta	%f31,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffff4fac
!	%l6 = 00000000ff000f7b, Mem[0000000010081400] = 7b000000
	stha	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 0f7b0000
!	Mem[00000000100c1400] = 7b0f00ff, %l0 = c37eb26809169f38
	ldstuba	[%i3+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffff4fac, %l4 = 00000000000000ff
	ldsha	[%i3+%o5]0x89,%l4	! %l4 = 0000000000004fac

p0_label_117:
!	Mem[0000000010101438] = 0e939dcb27e5f590, %l4 = 0000000000004fac
	ldxa	[%i4+0x038]%asi,%l4	! %l4 = 0e939dcb27e5f590
!	Mem[0000000030001408] = 00000000, %l2 = 00000000a0d6dc4e
	ldsba	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 14f6687c ccad9193, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 0000000014f6687c 00000000ccad9193
!	Mem[0000000030141400] = 86381bc2, %l6 = 00000000ff000f7b
	lduwa	[%i5+%g0]0x81,%l6	! %l6 = 0000000086381bc2
!	Mem[0000000020800040] = 00c2726d, %l2 = 0000000014f6687c
	ldsba	[%o1+0x040]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l5 = 0000000000000f86
	ldsba	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = ff000f7b, %l7 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181410] = ff000000, %f9  = ffffffff
	lda	[%i6+%o5]0x80,%f9 	! %f9 = ff000000
!	Mem[00000000300c1410] = ffff4fac, %f10 = ffcb0000
	lda	[%i3+%o5]0x89,%f10	! %f10 = ffff4fac
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = ac4fff00, %l5 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l5	! %l5 = 00000000ac4fff00

p0_label_118:
!	%f9  = ff000000, Mem[0000000030101408] = 000000ff
	sta	%f9 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000
!	%l3 = 00000000ccad9193, Mem[0000000010181408] = 860f0000
	stwa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = ccad9193
!	Mem[0000000010041408] = 00000000, %l7 = ffffffffffffffff
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = ffffffff, %l7 = 00000000, %l2 = 00000000
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 00000000ffffffff
!	%l5 = 00000000ac4fff00, Mem[00000000100c1408] = 00000000
	stba	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l5 = 00000000ac4fff00, Mem[0000000010001400] = 9d3248ff
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 9d324800
!	%f20 = 00000000 38ea007b, Mem[0000000010141420] = 000000ff f01014c4
	std	%f20,[%i5+0x020]	! Mem[0000000010141420] = 00000000 38ea007b
!	Mem[000000001010141c] = 00000000, %l0 = 00000000000000ff
	ldstub	[%i4+0x01c],%l0		! %l0 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010181406] = 09000062
	sth	%l1,[%i6+0x006]		! Mem[0000000010181404] = 09000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 86381bc2, %l7 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l7	! %l7 = ffffffffffffff86

p0_label_119:
!	Mem[0000000030081400] = ffff0000, %l6 = 0000000086381bc2
	lduwa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ffff0000
!	Mem[0000000010181430] = c06caef7 ffcb0000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i6+0x030]%asi,%l0	! %l0 = 00000000c06caef7 00000000ffcb0000
!	Mem[0000000010141400] = 14f6687c, %l4 = 0e939dcb27e5f590
	lduwa	[%i5+%g0]0x80,%l4	! %l4 = 0000000014f6687c
!	Mem[00000000300c1400] = ffffffff, %l1 = 00000000ffcb0000
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081408] = 000000d8, %l5 = 00000000ac4fff00
	ldswa	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000d8
!	Mem[0000000030041400] = a0d6dc4e, %f28 = ac4f7128
	lda	[%i1+%g0]0x89,%f28	! %f28 = a0d6dc4e
!	Mem[0000000030101400] = ffffffff b1381bc2, %l0 = c06caef7, %l1 = ffffffff
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 00000000ffffffff 00000000b1381bc2
!	Mem[0000000030041410] = 00000000ff000000, %l0 = 00000000ffffffff
	ldxa	[%i1+%o5]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030041400] = 4edcd6a0, %f21 = 38ea007b
	lda	[%i1+%g0]0x81,%f21	! %f21 = 4edcd6a0
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffff86, Mem[0000000030101410] = 00c2b2fd00000000
	stxa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffffffffff86

p0_label_120:
!	%f14 = a396f17a 8c24adec, Mem[0000000010081408] = ffffff00 00620000
	stda	%f14,[%i2+%o4]0x88	! Mem[0000000010081408] = a396f17a 8c24adec
!	%f22 = 00ffffff, Mem[00000000300c1410] = ffff4fac
	sta	%f22,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00ffffff
!	%f0  = 6379e6d9 00000000, %l2 = 00000000ffffffff
!	Mem[0000000030041418] = c0f44a9733f88c10
	add	%i1,0x018,%g1
	stda	%f0,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030041418] = 00000000d9e67963
!	%f26 = ff000000 00000000, Mem[0000000030141408] = 00000000 59753fd5
	stda	%f26,[%i5+%o4]0x89	! Mem[0000000030141408] = ff000000 00000000
!	Mem[0000000020800040] = 00c2726d, %l0 = 00000000ff000000
	ldstub	[%o1+0x040],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010181414] = f01014c4, %l5 = 00000000000000d8
	ldstub	[%i6+0x014],%l5		! %l5 = 000000f0000000ff
!	%f1  = 00000000, Mem[00000000100c142c] = 263728d3
	sta	%f1 ,[%i3+0x02c]%asi	! Mem[00000000100c142c] = 00000000
!	Mem[000000001014141d] = 5f4e94ac, %l0 = 0000000000000000
	ldstub	[%i5+0x01d],%l0		! %l0 = 0000004e000000ff
!	%f16 = 00000000 000000ff, %f31 = ffff4fac
	fdtos	%f16,%f31		! %f31 = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = a4e7ddb5, %l2 = 00000000ffffffff
	ldswa	[%i4+%g0]0x80,%l2	! %l2 = ffffffffa4e7ddb5

p0_label_121:
!	Mem[0000000010041408] = ffffffffff000000, %l4 = 0000000014f6687c
	ldxa	[%i1+%o4]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[00000000211c0000] = ff006880, %l3 = 00000000ccad9193
	ldub	[%o2+0x001],%l3		! %l3 = 0000000000000000
!	Mem[0000000030181400] = f01014c4, %l0 = 000000000000004e
	lduwa	[%i6+%g0]0x89,%l0	! %l0 = 00000000f01014c4
!	Mem[000000001010142c] = cb9d930e, %l3 = 0000000000000000
	ldub	[%i4+0x02e],%l3		! %l3 = 0000000000000093
!	%l2 = ffffffffa4e7ddb5, imm = fffffffffffff1d4, %l5 = 00000000000000f0
	add	%l2,-0xe2c,%l5		! %l5 = ffffffffa4e7cf89
!	Mem[00000000201c0000] = 00003e5d, %l6 = 00000000ffff0000
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = ff0000000000ffff, %l4 = ffffffffff000000
	ldxa	[%i2+%g0]0x89,%l4	! %l4 = ff0000000000ffff
!	Mem[0000000030041400] = a0d6dc4e, %l7 = ffffffffffffff86
	ldsba	[%i1+%g0]0x89,%l7	! %l7 = 000000000000004e
!	%f6  = c21b38b1, %f17 = 000000ff, %f22 = 00ffffff
	fadds	%f6 ,%f17,%f22		! %l0 = 00000000f01014e6, Unfinished, %fsr = 1a00000400
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ffffff00, %l4 = ff0000000000ffff
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 000000ff000000ff

p0_label_122:
!	%l7 = 000000000000004e, Mem[0000000010081408] = ecad248c
	stwa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000004e
!	%f18 = 00000000 ff000000, %f21 = 4edcd6a0
	fdtoi	%f18,%f21		! %l0 = 00000000f0101508, Unfinished, %fsr = 1a00000400
!	Mem[0000000010001434] = d967c860, %l3 = 0000000000000093
	swap	[%i0+0x034],%l3		! %l3 = 00000000d967c860
!	%f8  = ac4f7128 ff000000, Mem[00000000300c1408] = 0000a13c f01014c4
	stda	%f8 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = ac4f7128 ff000000
!	%f6  = c21b38b1, Mem[0000000030141408] = 00000000
	sta	%f6 ,[%i5+%o4]0x89	! Mem[0000000030141408] = c21b38b1
!	%l5 = ffffffffa4e7cf89, immed = fffffb68, %y  = 4fdbd6a0
	smul	%l5,-0x498,%l1		! %l1 = 000001a2771ea2a8, %y = 000001a2
!	%l5 = ffffffffa4e7cf89, Mem[0000000010001410] = 4fdbd6a0
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = a4e7cf89
!	%l1 = 000001a2771ea2a8, Mem[0000000010181408] = ccad9193
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = ccad91a8
!	Mem[0000000010101410] = 0000000a, %l1 = 000001a2771ea2a8, %asi = 80
	swapa	[%i4+0x010]%asi,%l1	! %l1 = 000000000000000a
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = c41410f0 00000000, %l4 = 000000ff, %l5 = a4e7cf89
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 00000000c41410f0 0000000000000000

p0_label_123:
!	Mem[0000000030181408] = ffffffff28714fac, %f8  = ac4f7128 ff000000
	ldda	[%i6+%o4]0x81,%f8 	! %f8  = ffffffff 28714fac
!	Mem[00000000211c0000] = ff006880, %l5 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 0000000009000000, %l6 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l6	! %l6 = 0000000009000000
!	Mem[0000000010141408] = 7b0f000000000000, %f12 = 62ad43b7 e135768a
	ldda	[%i5+%o4]0x80,%f12	! %f12 = 7b0f0000 00000000
!	Mem[000000001008142c] = 3d258100, %l2 = ffffffffa4e7ddb5
	lduha	[%i2+0x02c]%asi,%l2	! %l2 = 0000000000003d25
!	Mem[0000000030081410] = d40000ff 00000000, %l2 = 00003d25, %l3 = d967c860
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000 00000000d40000ff
!	Mem[0000000030181410] = ff0000d4, %l7 = 000000000000004e
	ldsba	[%i6+%o5]0x89,%l7	! %l7 = ffffffffffffffd4
!	Mem[0000000010181400] = 00000000, %l1 = 000000000000000a
	ldswa	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = ff000000, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f4  = 00000000 ff0000d4, Mem[00000000100c1438] = ff626c0e ceeb99a1
	stda	%f4 ,[%i3+0x038]%asi	! Mem[00000000100c1438] = 00000000 ff0000d4

p0_label_124:
!	%f22 = 00ffffff 00006200, %l4 = 00000000c41410f0
!	Mem[0000000010101410] = 771ea2a8b1381bc2
	add	%i4,0x010,%g1
	stda	%f22,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010101410] = 771ea2a8b1381bc2
!	Mem[0000000030101410] = ffffffff, %l7 = ffffffffffffffd4
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000ffffffff
!	%f16 = 00000000 000000ff, Mem[0000000010081438] = 00000000 00000000
	stda	%f16,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000000 000000ff
!	%f0  = 6379e6d9 00000000 d8000000 d9e67963
!	%f4  = 00000000 ff0000d4 c21b38b1 ffffffff
!	%f8  = ffffffff 28714fac ffff4fac 00000000
!	%f12 = 7b0f0000 00000000 a396f17a 8c24adec
	stda	%f0,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	%l3 = 00000000d40000ff, Mem[0000000030101408] = 000000ff
	stba	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = ff0000ff
!	%l2 = 0000000000000000, Mem[0000000010141408] = 0000000000000f7b
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%f24 = 000000d8 a4e7ddb5, %l5 = 0000000000000000
!	Mem[0000000010101408] = 0000103300000000
	add	%i4,0x008,%g1
	stda	%f24,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010101408] = 0000103300000000
!	%l4 = 00000000c41410f0, Mem[0000000010081408] = a396f17a4e000000
	stxa	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000c41410f0
!	%f20 = 00000000 4edcd6a0, Mem[0000000010001408] = ff0000d4 0000d6a0
	stda	%f20,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 4edcd6a0
!	Starting 10 instruction Load Burst
!	%f25 = a4e7ddb5, %f19 = ff000000
	fsqrts	%f25,%f19		! %f19 = 7fffffff

p0_label_125:
!	Mem[00000000300c1400] = ffffffff, %l7 = 00000000ffffffff
	ldswa	[%i3+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1410] = 00ffffff, %l0 = 00000000f0101508
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101438] = 0e939dcb, %l0 = ffffffffffffffff
	lduh	[%i4+0x038],%l0		! %l0 = 0000000000000e93
!	Mem[0000000010141418] = 83018bde, %f19 = 7fffffff
	ld	[%i5+0x018],%f19	! %f19 = 83018bde
!	Mem[0000000010141400] = 14f6687cccad9193, %l4 = 00000000c41410f0
	ldxa	[%i5+%g0]0x80,%l4	! %l4 = 14f6687cccad9193
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000030041408] = 6379e6d9000000d8, %f18 = 00000000 83018bde
	ldda	[%i1+%o4]0x81,%f18	! %f18 = 6379e6d9 000000d8
!	Mem[0000000020800000] = b2ff779a, %l0 = 0000000000000e93
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 000000000000b2ff
!	Mem[0000000010141400] = 14f6687c, %l2 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000014
!	Mem[0000000021800180] = b337bce0, %l3 = 00000000d40000ff
	lduha	[%o3+0x180]%asi,%l3	! %l3 = 000000000000b337
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = ffffffff, %l1 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l1	! %l1 = ffffffffffffffff

p0_label_126:
!	Mem[0000000010041400] = 005800ff, %l6 = 0000000009000000
	swapa	[%i1+%g0]0x88,%l6	! %l6 = 00000000005800ff
!	%l3 = 000000000000b337, Mem[00000000100c1408] = 00000000
	stha	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000b337
!	Mem[000000001010143b] = 0e939dcb, %l4 = 14f6687cccad9193
	ldstub	[%i4+0x03b],%l4		! %l4 = 000000cb000000ff
!	Mem[000000001014140c] = 00000000, %l0 = 000000000000b2ff
	swap	[%i5+0x00c],%l0		! %l0 = 0000000000000000
!	%f2  = d8000000, Mem[0000000010001418] = ac4f7128
	st	%f2 ,[%i0+0x018]	! Mem[0000000010001418] = d8000000
!	%f7  = ffffffff, Mem[0000000010141400] = 7c68f614
	sta	%f7 ,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffff
!	%l6 = 005800ff, %l7 = ffffffff, Mem[0000000030181400] = c41410f0 00000000
	stda	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 005800ff ffffffff
!	Mem[00000000100c1410] = 00000000, %l3 = 000000000000b337
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[000000001010140c] = 00000000, %l3 = 0000000000000000
	swap	[%i4+0x00c],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = a78a88ff, %l6 = 00000000005800ff
	lduha	[%i5+%o5]0x88,%l6	! %l6 = 00000000000088ff

p0_label_127:
!	Mem[0000000020800000] = b2ff779a, %l5 = 0000000000000000
	ldsba	[%o1+0x000]%asi,%l5	! %l5 = ffffffffffffffb2
!	Mem[0000000010041400] = 00000009, %l5 = ffffffffffffffb2
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000009
!	Mem[0000000010081410] = ff000000, %l3 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l6 = 00000000000088ff, %l6 = 00000000000088ff, %y  = 000001a2
	sdiv	%l6,%l6,%l6		! %l6 = 00000000030d1a42
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010101400] = ffffffffb5dde7a4, %f24 = 000000d8 a4e7ddb5
	ldda	[%i4+%g0]0x88,%f24	! %f24 = ffffffff b5dde7a4
!	Mem[0000000030001410] = 09be3ca1, %l0 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l0	! %l0 = 0000000000003ca1
!	Mem[0000000010141434] = 94f993b8, %l3 = 0000000000000000
	ldub	[%i5+0x036],%l3		! %l3 = 0000000000000093
!	Mem[0000000010181410] = 000000ff, %l1 = ffffffffffffffff
	lduwa	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l3 = 0000000000000093
	ldsba	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 6379e6d9 00000000 d8000000 d9e67963
!	%f4  = 00000000 ff0000d4 c21b38b1 ffffffff
!	%f8  = ffffffff 28714fac ffff4fac 00000000
!	%f12 = 7b0f0000 00000000 a396f17a 8c24adec
	stda	%f0,[%i4]ASI_BLK_S	! Block Store to 0000000030101400

p0_label_128:
!	Mem[0000000010081438] = 00000000, %l5 = 0000000000000009, %asi = 80
	swapa	[%i2+0x038]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = 86ffffff, %l2 = 0000000000000014
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 0000000086ffffff
!	%l4 = 00000000000000cb, Mem[0000000010001400] = 0048329d, %asi = 80
	stwa	%l4,[%i0+0x000]%asi	! Mem[0000000010001400] = 000000cb
!	%l1 = 00000000000000ff, Mem[0000000030101400] = 6379e6d9
	stwa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	%f16 = 00000000 000000ff 6379e6d9 000000d8
!	%f20 = 00000000 4edcd6a0 00ffffff 00006200
!	%f24 = ffffffff b5dde7a4 ff000000 00000000
!	%f28 = a0d6dc4e 00000000 09be3ca1 00000000
	stda	%f16,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%l6 = 00000000030d1a42, Mem[0000000030081400] = 0000ffff
	stha	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 00001a42
!	Mem[0000000030001410] = a13cbe09, %l1 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 000000a1000000ff
!	%l4 = 000000cb, %l5 = 00000000, Mem[0000000030001400] = 0000007b 00000000
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000cb 00000000
!	%l0 = 0000000000003ca1, Mem[00000000100c1410] = 0000b337
	stba	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000b3a1
!	Starting 10 instruction Load Burst
!	%l7 = ffffffffffffffff, Mem[0000000010001410] = 4edcd6a0
	stba	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 4edcd6ff

p0_label_129:
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000030101410] = 00000000, %f7  = ffffffff
	lda	[%i4+%o5]0x89,%f7 	! %f7 = 00000000
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000000000
	lduha	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = a4e7ddb5ffffffff, %f0  = 6379e6d9 00000000
	ldda	[%i4+%g0]0x80,%f0 	! %f0  = a4e7ddb5 ffffffff
!	Mem[00000000100c1430] = 00000000, %l4 = 00000000000000cb
	ldsh	[%i3+0x032],%l4		! %l4 = 0000000000000000
!	Mem[0000000010141408] = ffb2000000000000, %f18 = 6379e6d9 000000d8
	ldda	[%i5+%o4]0x88,%f18	! %f18 = ffb20000 00000000
!	Mem[0000000030081410] = 00000000, %l5 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141428] = 3d517643, %l0 = 0000000000003ca1
	ldswa	[%i5+0x028]%asi,%l0	! %l0 = 000000003d517643
!	Mem[00000000300c1408] = ac4f7128, %l4 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l4	! %l4 = 00000000000000ac
!	Mem[0000000010141400] = ffffffff, %l6 = 00000000030d1a42
	ldswa	[%i5+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 00000000, %l0 = 000000003d517643
	swapa	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_130:
!	%l3 = 0000000000000000, Mem[0000000010001410] = 4edcd6ff
	stha	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 4edc0000
!	%f16 = 00000000, Mem[0000000010081400] = 00007b0f
	sta	%f16,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	Mem[0000000010041408] = ffffffff, %l6 = ffffffffffffffff
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 00000000ffffffff
!	%f4  = 00000000 ff0000d4, %l0 = 0000000000000000
!	Mem[0000000030181400] = 005800ffffffffff
	stda	%f4,[%i6+%l0]ASI_PST8_S ! Mem[0000000030181400] = 005800ffffffffff
!	%l5 = 0000000000000000, Mem[0000000010041410] = ffff4fac
	stha	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = ffff0000
!	%f20 = 00000000 4edcd6a0, Mem[0000000010181420] = 62ad43b7 077c310c
	stda	%f20,[%i6+0x020]%asi	! Mem[0000000010181420] = 00000000 4edcd6a0
!	%l6 = 00000000ffffffff, Mem[0000000010001400] = 000000ff
	stba	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	%l4 = 00000000000000ac, Mem[00000000100c1408] = 0000b337
	stha	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ac
!	%f12 = 7b0f0000 00000000, Mem[0000000010141400] = ffffffff ccad9193
	std	%f12,[%i5+%g0]	! Mem[0000000010141400] = 7b0f0000 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 7b0f00ff, %f29 = 00000000
	lda	[%i3+%g0]0x88,%f29	! %f29 = 7b0f00ff

p0_label_131:
!	Mem[0000000010101410] = 771ea2a8, %l5 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 000000000000771e
!	Mem[00000000201c0000] = 00003e5d, %l3 = 0000000000000000
	lduh	[%o0+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000030101410] = d40000ff 00000000, %l4 = 000000ac, %l5 = 0000771e
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000 00000000d40000ff
!	%l6 = 00000000ffffffff, Mem[0000000030001400] = cb000000
	stwa	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffff
!	%f7  = 00000000, %f15 = 8c24adec
	fcmps	%fcc2,%f7 ,%f15		! %fcc2 = 2
!	Mem[0000000010181420] = 000000004edcd6a0, %l2 = 0000000086ffffff
	ldx	[%i6+0x020],%l2		! %l2 = 000000004edcd6a0
!	Mem[000000001014141c] = 5fff94ac, %l5 = 00000000d40000ff
	ldsh	[%i5+0x01c],%l5		! %l5 = 0000000000005fff
!	Mem[0000000010081400] = 0000000000000000, %l5 = 0000000000005fff
	ldxa	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001428] = 00000000 000000ff, %l6 = ffffffff, %l7 = ffffffff
	ldda	[%i0+0x028]%asi,%l6	! %l6 = 0000000000000000 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[000000001004142c] = 5df88086
	stw	%l7,[%i1+0x02c]		! Mem[000000001004142c] = 000000ff

p0_label_132:
!	%l2 = 000000004edcd6a0, Mem[0000000030001400] = ffffffff
	stwa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 4edcd6a0
!	%f8  = ffffffff, Mem[00000000100c140c] = 00000f7b
	sta	%f8 ,[%i3+0x00c]%asi	! Mem[00000000100c140c] = ffffffff
!	%l1 = 00000000000000a1, Mem[0000000010001400] = ff00000000000000
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000000000a1
!	%l5 = 0000000000000000, Mem[0000000010181400] = 00000000
	stba	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%l6 = 0000000000000000, Mem[00000000100c140e] = ffffffff
	sth	%l6,[%i3+0x00e]		! Mem[00000000100c140c] = ffff0000
!	%f4  = 00000000, Mem[0000000010001428] = 00000000
	st	%f4 ,[%i0+0x028]	! Mem[0000000010001428] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010101410] = a8a21e77
	stwa	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000010001418] = 00620000ffffff00, %l1 = 00000000000000a1, %l2 = 000000004edcd6a0
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = 00620000ffffff00
!	Mem[0000000030041410] = ff0000d4, %l1 = 00000000000000a1
	ldstuba	[%i1+%o5]0x89,%l1	! %l1 = 000000d4000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00ffffff, %l3 = 0000000000000000
	lduwa	[%i3+%o5]0x89,%l3	! %l3 = 0000000000ffffff

p0_label_133:
!	Mem[0000000030041400] = 4376513d, %l5 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l5	! %l5 = 000000000000513d
!	Mem[000000001014140c] = 0000b2ff, %l1 = 00000000000000d4
	lduba	[%i5+0x00f]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181410] = 00000000 ff0000d4, %l2 = ffffff00, %l3 = 00ffffff
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000ff0000d4 0000000000000000
!	Mem[0000000010141404] = 00000000, %l6 = 0000000000000000
	ldsb	[%i5+0x005],%l6		! %l6 = 0000000000000000
!	Mem[0000000010081410] = 000000ff, %l2 = 00000000ff0000d4
	ldswa	[%i2+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = ff000f7b, %l3 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = ffffffffff000f7b
!	Mem[0000000010181410] = ff000000 ff1014c4, %l2 = 000000ff, %l3 = ff000f7b
	ldd	[%i6+%o5],%l2		! %l2 = 00000000ff000000 00000000ff1014c4
!	Mem[0000000010041410] = 0000ffff, %l0 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = 6379e6d9, %f7  = 00000000
	lda	[%i1+%o4]0x81,%f7 	! %f7 = 6379e6d9
!	Starting 10 instruction Store Burst
!	Mem[000000001008142b] = bfe1e93f, %l5 = 000000000000513d
	ldstuba	[%i2+0x02b]%asi,%l5	! %l5 = 0000003f000000ff

p0_label_134:
!	%l0 = 0000000000000000, Mem[000000001000140c] = d9e67963
	stw	%l0,[%i0+0x00c]		! Mem[000000001000140c] = 00000000
!	Mem[00000000100c1410] = 0000b3a1, %l2 = 00000000ff000000
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 000000000000b3a1
!	Mem[0000000030141410] = 14000000, %l2 = 000000000000b3a1
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l3 = 00000000ff1014c4
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141410] = a78a88ff, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010041400] = 00000009, %l7 = 00000000000000ff
	swap	[%i1+%g0],%l7		! %l7 = 0000000000000009
!	%l3 = 0000000000000000, Mem[00000000100c1408] = ac000000
	stba	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000010081400] = 00000000 00000000
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff 000000ff
!	%l7 = 0000000000000009, Mem[0000000010141408] = ff0000000000b2ff
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000009
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = c41410f07b0f00ff, %f18 = ffb20000 00000000
	ldda	[%i3+%g0]0x88,%f18	! %f18 = c41410f0 7b0f00ff

p0_label_135:
!	%l6 = 0000000000000000, Mem[0000000010001424] = ffffffff
	sth	%l6,[%i0+0x024]		! Mem[0000000010001424] = 0000ffff
!	Mem[0000000030001410] = 09be3cff, %l4 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000211c0000] = ff006880, %l6 = 0000000000000000
	ldub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030141400] = d8000000c21b3886, %f20 = 00000000 4edcd6a0
	ldda	[%i5+%g0]0x89,%f20	! %f20 = d8000000 c21b3886
!	Mem[00000000100c1408] = 00000000, %f8  = ffffffff
	lda	[%i3+%o4]0x88,%f8 	! %f8 = 00000000
!	Mem[0000000010001408] = d800000000000000, %l5 = 000000000000003f
	ldxa	[%i0+%o4]0x80,%l5	! %l5 = d800000000000000
!	%f1  = ffffffff, %f13 = 00000000, %f21 = c21b3886
	fdivs	%f1 ,%f13,%f21		! %f21 = ffffffff
!	Mem[0000000020800000] = b2ff779a, %l3 = 0000000000000000
	ldsh	[%o1+%g0],%l3		! %l3 = ffffffffffffb2ff
!	Mem[0000000030081400] = 421a0000 000000ff d8000000 d9e67963
!	Mem[0000000030081410] = 00000000 ff0000d4 99a9115c 3168a589
!	Mem[0000000030081420] = a13cbe09 c6de9dcb 7b00ea38 d2388be9
!	Mem[0000000030081430] = 62ad43b7 e135768a a396f17a 8c24adec
	ldda	[%i2]ASI_BLK_AIUS,%f0	! Block Load from 0000000030081400
!	Starting 10 instruction Store Burst
!	%f27 = 00000000, Mem[0000000010101400] = b5dde7a4
	sta	%f27,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000

p0_label_136:
!	Mem[0000000010081400] = ff000000, %l7 = 0000000000000009
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030101400] = ff000000, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 00000000ff000000
!	%l5 = d800000000000000, Mem[0000000010141418] = 83018bde5fff94ac
	stx	%l5,[%i5+0x018]		! Mem[0000000010141418] = d800000000000000
!	%l2 = 00000000, %l3 = ffffb2ff, Mem[0000000010141410] = a78a88ff b5dde7a4
	stda	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 ffffb2ff
!	Mem[0000000010041400] = 000000ff, %l6 = 00000000ff000000
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l2 = 0000000000000000, immd = 0000000000000329, %l6 = 0000000000000000
	udivx	%l2,0x329,%l6		! %l6 = 0000000000000000
!	Mem[0000000020800001] = b2ff779a, %l3 = ffffffffffffb2ff
	ldstuba	[%o1+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	%l0 = 000000ff, %l1 = 000000ff, Mem[00000000100c1408] = 00000000 ffff0000
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff 000000ff
!	%l3 = 00000000000000ff, Mem[00000000218001c0] = 00ffa57a
	sth	%l3,[%o3+0x1c0]		! Mem[00000000218001c0] = 00ffa57a
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 6379e6d9, %l1 = 00000000000000ff
	ldswa	[%i1+%o4]0x81,%l1	! %l1 = 000000006379e6d9

p0_label_137:
!	Mem[0000000030081400] = 421a0000, %l4 = 00000000000000ff
	ldsba	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000042
!	Mem[000000001018143c] = 7c50879f, %l5 = d800000000000000
	lduha	[%i6+0x03e]%asi,%l5	! %l5 = 000000000000879f
!	Mem[0000000030041408] = d9e67963, %l2 = 0000000000000000
	lduwa	[%i1+%o4]0x89,%l2	! %l2 = 00000000d9e67963
!	Mem[0000000010081410] = 000000ff, %l0 = 00000000000000ff
	lduba	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001004142c] = 000000ff, %l1 = 000000006379e6d9
	ldsb	[%i1+0x02c],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141400] = d8000000c21b3886, %l0 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l0	! %l0 = d8000000c21b3886
!	Mem[0000000010041404] = ff0000e2, %f16 = 00000000
	ld	[%i1+0x004],%f16	! %f16 = ff0000e2
!	Mem[00000000100c1408] = ff000000ff000000, %f26 = ff000000 00000000
	ldda	[%i3+%o4]0x88,%f26	! %f26 = ff000000 ff000000
!	Mem[0000000010101424] = fcd1f9fc, %l3 = 00000000000000ff
	lduba	[%i4+0x026]%asi,%l3	! %l3 = 00000000000000f9
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000042, Mem[0000000010081400] = 00000009
	stba	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000042

p0_label_138:
!	Mem[0000000010041400] = ff0000ff, %l3 = 00000000000000f9
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 00000000ff0000ff
!	Mem[0000000030081408] = 000000d8, %l3 = 00000000ff0000ff
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 000000d8000000ff
!	%l7 = 00000000ff000000, Mem[0000000030101408] = d8000000d9e67963
	stxa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000ff000000
!	Mem[0000000030001408] = 00000000, %l3 = 00000000000000d8
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%l5 = 000000000000879f, Mem[0000000010001400] = 00000000
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000009f
!	%l0 = c21b3886, %l1 = 00000000, Mem[0000000030141400] = c21b3886 d8000000
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = c21b3886 00000000
!	Mem[0000000010001408] = 000000d8, %l5 = 000000000000879f
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000d8000000ff
!	%f28 = a0d6dc4e 7b0f00ff, %l1 = 0000000000000000
!	Mem[0000000010081408] = f01014c400000000
	add	%i2,0x008,%g1
	stda	%f28,[%g1+%l1]ASI_PST16_P ! Mem[0000000010081408] = f01014c400000000
!	%l6 = 00000000, %l7 = ff000000, Mem[0000000010041418] = 0038def8 ab1de0a7
	std	%l6,[%i1+0x018]		! Mem[0000000010041418] = 00000000 ff000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000030081400] = 421a0000 000000ff ff000000 d9e67963
!	Mem[0000000030081410] = 00000000 ff0000d4 99a9115c 3168a589
!	Mem[0000000030081420] = a13cbe09 c6de9dcb 7b00ea38 d2388be9
!	Mem[0000000030081430] = 62ad43b7 e135768a a396f17a 8c24adec
	ldda	[%i2]ASI_BLK_SL,%f0	! Block Load from 0000000030081400

p0_label_139:
!	Mem[0000000030081410] = d40000ff00000000, %f16 = ff0000e2 000000ff
	ldda	[%i2+%o5]0x89,%f16	! %f16 = d40000ff 00000000
!	Mem[000000001014141c] = 00000000, %l1 = 0000000000000000
	ldub	[%i5+0x01d],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141400] = c21b3886, %l1 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l1	! %l1 = ffffffffffffff86
!	Mem[0000000030081408] = 6379e6d9000000ff, %l6 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l6	! %l6 = 6379e6d9000000ff
!	Mem[0000000030141408] = ff000000c21b38b1, %f20 = d8000000 ffffffff
	ldda	[%i5+%o4]0x89,%f20	! %f20 = ff000000 c21b38b1
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000042
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = ac4f7128 ffffffff, %l6 = 000000ff, %l7 = ff000000
	ldda	[%i6+%o4]0x89,%l6	! %l6 = 00000000ffffffff 00000000ac4f7128
!	Mem[0000000010101418] = fdb20accff000000, %f22 = 00ffffff 00006200
	ldda	[%i4+0x018]%asi,%f22	! %f22 = fdb20acc ff000000
!	Mem[00000000100c1410] = 000000ffcc0ab2fd, %l1 = ffffffffffffff86
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = 000000ffcc0ab2fd
!	Starting 10 instruction Store Burst
!	%l6 = ffffffff, %l7 = ac4f7128, Mem[0000000010181400] = 00000000 09000000
	stda	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffffff ac4f7128

p0_label_140:
!	%f30 = 09be3ca1 00000000, %l3 = 0000000000000000
!	Mem[0000000010001410] = 0000dc4e00000000
	add	%i0,0x010,%g1
	stda	%f30,[%g1+%l3]ASI_PST32_P ! Mem[0000000010001410] = 0000dc4e00000000
!	%f26 = ff000000, Mem[0000000010001410] = 0000dc4e
	sta	%f26,[%i0+0x010]%asi	! Mem[0000000010001410] = ff000000
!	%l6 = 00000000ffffffff, Mem[0000000030181410] = d40000ff
	stha	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = ffff00ff
!	%f16 = d40000ff 00000000, Mem[00000000300c1400] = ffffffff 00000000
	stda	%f16,[%i3+%g0]0x89	! Mem[00000000300c1400] = d40000ff 00000000
!	%l3 = 0000000000000000, Mem[0000000010041410] = 0000ffff, %asi = 80
	stha	%l3,[%i1+0x010]%asi	! Mem[0000000010041410] = 0000ffff
!	%f22 = fdb20acc ff000000, Mem[0000000010001400] = 9f000000 000000a1
	stda	%f22,[%i0+%g0]0x80	! Mem[0000000010001400] = fdb20acc ff000000
!	%f26 = ff000000 ff000000, %l4 = 0000000000000000
!	Mem[0000000030141418] = 6330fb4e66d70f18
	add	%i5,0x018,%g1
	stda	%f26,[%g1+%l4]ASI_PST16_S ! Mem[0000000030141418] = 6330fb4e66d70f18
!	Mem[000000001008142c] = 3d258100, %l4 = 0000000000000000, %asi = 80
	swapa	[%i2+0x02c]%asi,%l4	! %l4 = 000000003d258100
!	Mem[0000000010041429] = 7a012058, %l5 = 00000000000000d8
	ldstub	[%i1+0x029],%l5		! %l5 = 00000001000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000042, %l4 = 000000003d258100
	lduba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000042

p0_label_141:
!	Mem[000000001000143c] = a13cbe09, %f29 = 7b0f00ff
	lda	[%i0+0x03c]%asi,%f29	! %f29 = a13cbe09
!	Mem[00000000211c0000] = ff006880, %l7 = 00000000ac4f7128
	ldub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030001408] = e7888aa7d8000000, %f22 = fdb20acc ff000000
	ldda	[%i0+%o4]0x89,%f22	! %f22 = e7888aa7 d8000000
!	Mem[0000000010081408] = f01014c4, %f31 = 00000000
	lda	[%i2+%o4]0x80,%f31	! %f31 = f01014c4
!	Mem[0000000010001408] = 00000000000000ff, %f24 = ffffffff b5dde7a4
	ldda	[%i0+%o4]0x88,%f24	! %f24 = 00000000 000000ff
!	Mem[0000000010081408] = f01014c4, %f19 = 7b0f00ff
	lda	[%i2+%o4]0x80,%f19	! %f19 = f01014c4
!	Mem[0000000010081410] = 000000ff, %l0 = d8000000c21b3886
	ldsba	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = ffffffff, %l1 = 000000ffcc0ab2fd
	lduha	[%i6+%o4]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030001400] = 4edcd6a0, %l4 = 0000000000000042
	ldsha	[%i0+%g0]0x89,%l4	! %l4 = ffffffffffffd6a0
!	Starting 10 instruction Store Burst
!	%f19 = f01014c4, %f25 = 000000ff, %f27 = ff000000
	fdivs	%f19,%f25,%f27		! %f27 = ff800000

p0_label_142:
	membar	#Sync			! Added by membar checker (22)
!	%f20 = ff000000 c21b38b1, %l1 = 000000000000ffff
!	Mem[0000000030081418] = 99a9115c3168a589
	add	%i2,0x018,%g1
	stda	%f20,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030081418] = b1381bc2000000ff
!	Mem[0000000010101438] = 0e939dff, %l2 = d9e67963, %l1 = 0000ffff
	add	%i4,0x38,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 000000000e939dff
!	Mem[0000000030141410] = 140000ff, %l3 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030101410] = 00000000, %l2 = 00000000d9e67963
	swapa	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101420] = cfabcd92, %l0 = 0000000000000000, %asi = 80
	swapa	[%i4+0x020]%asi,%l0	! %l0 = 00000000cfabcd92
!	%l0 = 00000000cfabcd92, Mem[000000001014140c] = 00000009
	stb	%l0,[%i5+0x00c]		! Mem[000000001014140c] = 92000009
!	%l6 = 00000000ffffffff, Mem[0000000010141400] = 7b0f0000
	stw	%l6,[%i5+%g0]		! Mem[0000000010141400] = ffffffff
!	%f0  = ff000000 00001a42 6379e6d9 000000ff
!	%f4  = d40000ff 00000000 89a56831 5c11a999
!	%f8  = cb9ddec6 09be3ca1 e98b38d2 38ea007b
!	%f12 = 8a7635e1 b743ad62 ecad248c 7af196a3
	stda	%f0,[%i2]ASI_BLK_P	! Block Store to 0000000010081400
!	%f26 = ff000000 ff800000, Mem[0000000010001400] = cc0ab2fd 000000ff
	stda	%f26,[%i0+%g0]0x88	! Mem[0000000010001400] = ff000000 ff800000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ffc2726d, %l3 = 00000000000000ff
	lduha	[%o1+0x040]%asi,%l3	! %l3 = 000000000000ffc2

p0_label_143:
!	Mem[0000000010001410] = ff000000, %l1 = 000000000e939dff
	ldsha	[%i0+%o5]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000021800180] = b337bce0, %l5 = 0000000000000001
	ldsba	[%o3+0x180]%asi,%l5	! %l5 = ffffffffffffffb3
!	Mem[0000000030141400] = 86381bc2, %l0 = 00000000cfabcd92
	lduba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000086
!	%l3 = 000000000000ffc2, immed = fffff2bb, %y  = 00000000
	smul	%l3,-0xd45,%l0		! %l0 = fffffffff2be36b6, %y = ffffffff
!	Mem[00000000100c1400] = 7b0f00ff, %l2 = 0000000000000000
	ldswa	[%i3+%g0]0x88,%l2	! %l2 = 000000007b0f00ff
!	Mem[0000000010141400] = 00000000ffffffff, %f20 = ff000000 c21b38b1
	ldda	[%i5+%g0]0x88,%f20	! %f20 = 00000000 ffffffff
!	Mem[00000000100c1408] = 000000ff000000ff, %l5 = ffffffffffffffb3
	ldx	[%i3+%o4],%l5		! %l5 = 000000ff000000ff
!	Mem[00000000100c1430] = 00000000 00000000, %l2 = 7b0f00ff, %l3 = 0000ffc2
	ldd	[%i3+0x030],%l2		! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010101400] = ffffffff 00000000, %l0 = f2be36b6, %l1 = ffffff00
	ldda	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff000f7b, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 00000000ff000f7b

p0_label_144:
!	Mem[0000000030001410] = ff3cbe09, %l5 = 000000ff000000ff
	swapa	[%i0+%o5]0x81,%l5	! %l5 = 00000000ff3cbe09
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010081400] = ff000000, %l2 = 00000000ff000f7b
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%f10 = e98b38d2, Mem[0000000010181410] = 000000ff
	sta	%f10,[%i6+%o5]0x88	! Mem[0000000010181410] = e98b38d2
!	Mem[0000000030141408] = b1381bc2, %l6 = 00000000ffffffff
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 000000b1000000ff
!	Mem[0000000010001402] = 000080ff, %l4 = ffffffffffffd6a0
	ldstuba	[%i0+0x002]%asi,%l4	! %l4 = 00000080000000ff
!	%l6 = 00000000000000b1, Mem[0000000010081410] = ff0000d4
	stha	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = ff0000b1
!	%l6 = 000000b1, %l7 = 000000ff, Mem[0000000010101400] = 00000000 ffffffff
	stda	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000b1 000000ff
!	Mem[00000000100c1404] = f01014c4, %l1 = 00000000ffffffff
	swap	[%i3+0x004],%l1		! %l1 = 00000000f01014c4
!	Mem[00000000211c0001] = ff006880, %l5 = 00000000ff3cbe09
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff000000, %l3 = 0000000000000000
	ldsba	[%i4+%g0]0x81,%l3	! %l3 = ffffffffffffffff

p0_label_145:
!	Mem[0000000030181408] = ffffffff, %l2 = 00000000000000ff
	lduwa	[%i6+%o4]0x81,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010141400] = ffffffff, %l1 = 00000000f01014c4
	ldsha	[%i5+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000211c0000] = ffff6880, %l0 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030141410] = ff000014, %l7 = 00000000000000ff
	ldsha	[%i5+%o5]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010041410] = 7b0f00ffffff0000, %f0  = ff000000 00001a42
	ldda	[%i1+%o5]0x88,%f0 	! %f0  = 7b0f00ff ffff0000
!	Mem[00000000300c1408] = 28714fac, %l1 = ffffffffffffffff
	ldswa	[%i3+%o4]0x89,%l1	! %l1 = 0000000028714fac
!	Mem[0000000010141408] = 00000000, %f24 = 00000000
	lda	[%i5+%o4]0x80,%f24	! %f24 = 00000000
!	Mem[0000000010041410] = 0000ffffff000f7b, %f22 = e7888aa7 d8000000
	ldda	[%i1+%o5]0x80,%f22	! %f22 = 0000ffff ff000f7b
!	Mem[0000000030001410] = 000000ffc6de9dcb, %f16 = d40000ff 00000000
	ldda	[%i0+%o5]0x81,%f16	! %f16 = 000000ff c6de9dcb
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l5 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000

p0_label_146:
!	%f6  = 89a56831, Mem[00000000100c1434] = 00000000
	st	%f6 ,[%i3+0x034]	! Mem[00000000100c1434] = 89a56831
!	%l3 = ffffffffffffffff, Mem[000000001018141c] = 823fbf33, %asi = 80
	stba	%l3,[%i6+0x01c]%asi	! Mem[000000001018141c] = ff3fbf33
!	%l1 = 0000000028714fac, Mem[0000000010101400] = b1000000
	stba	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = b10000ac
!	%l7 = ffffffffffffff00, Mem[00000000300c1408] = ac4f7128
	stwa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffff00
!	Mem[0000000030041400] = 4376513d, %l7 = ffffffffffffff00
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 000000004376513d
!	%f2  = 6379e6d9 000000ff, Mem[0000000010001410] = 000000ff 00000000
	stda	%f2 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 6379e6d9 000000ff
!	%f24 = 00000000 000000ff, %l2 = 00000000ffffffff
!	Mem[0000000030001410] = 000000ffc6de9dcb
	add	%i0,0x010,%g1
	stda	%f24,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030001410] = ff00000000000000
!	Mem[0000000030141400] = c21b3886, %l0 = 000000000000ffff
	swapa	[%i5+%g0]0x89,%l0	! %l0 = 00000000c21b3886
!	%l7 = 000000004376513d, Mem[0000000030181400] = ff005800
	stba	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = ff00583d
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = d2388be9, %l7 = 000000004376513d
	ldsba	[%i6+%o5]0x80,%l7	! %l7 = ffffffffffffffd2

p0_label_147:
!	Mem[0000000020800000] = b2ff779a, %l7 = ffffffffffffffd2
	lduha	[%o1+0x000]%asi,%l7	! %l7 = 000000000000b2ff
!	Mem[0000000030181408] = ffffffff, %l1 = 0000000028714fac
	ldswa	[%i6+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030141400] = ffff000000000000, %f28 = a0d6dc4e a13cbe09
	ldda	[%i5+%g0]0x81,%f28	! %f28 = ffff0000 00000000
!	Mem[00000000300c1408] = 00ffffff, %l3 = ffffffffffffffff
	lduha	[%i3+%o4]0x89,%l3	! %l3 = 000000000000ffff
!	Mem[00000000100c143c] = ff0000d4, %l2 = 00000000ffffffff
	ldsba	[%i3+0x03f]%asi,%l2	! %l2 = ffffffffffffffd4
!	Mem[0000000030181408] = ac4f7128ffffffff, %l7 = 000000000000b2ff
	ldxa	[%i6+%o4]0x89,%l7	! %l7 = ac4f7128ffffffff
!	Mem[0000000030141410] = ff000014, %l4 = 0000000000000080
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l2 = ffffffffffffffd4, %l4 = 00000000000000ff, %l3 = 000000000000ffff
	xnor	%l2,%l4,%l3		! %l3 = 00000000000000d4
!	Mem[0000000030041410] = ff0000ff 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 00000000ff0000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%f29 = 00000000, %f8  = cb9ddec6
	fsqrts	%f29,%f8 		! %f8  = 00000000

p0_label_148:
!	Mem[0000000010041426] = 000000ff, %l5 = 0000000000000000
	ldstub	[%i1+0x026],%l5		! %l5 = 00000000000000ff
!	%f16 = 000000ff c6de9dcb c41410f0 f01014c4
!	%f20 = 00000000 ffffffff 0000ffff ff000f7b
!	%f24 = 00000000 000000ff ff000000 ff800000
!	%f28 = ffff0000 00000000 09be3ca1 f01014c4
	stda	%f16,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	Mem[00000000211c0000] = ffff6880, %l2 = ffffffffffffffd4
	ldstub	[%o2+%g0],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000010001423] = a4e7ddb5, %l1 = ffffffffffffffff
	ldstuba	[%i0+0x023]%asi,%l1	! %l1 = 000000b5000000ff
!	%f1  = ffff0000, Mem[0000000030101410] = 6379e6d9
	sta	%f1 ,[%i4+%o5]0x89	! Mem[0000000030101410] = ffff0000
!	Mem[0000000030001400] = a0d6dc4e, %l3 = 00000000000000d4
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 000000a0000000ff
!	%l4 = ff0000ff, %l5 = 00000000, Mem[0000000030001400] = ffd6dc4e 00000000
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = ff0000ff 00000000
!	%l7 = ac4f7128ffffffff, Mem[0000000030001408] = d8000000
	stha	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = d800ffff
!	%f4  = d40000ff 00000000, Mem[0000000010001410] = ff000000 d9e67963
	stda	%f4 ,[%i0+%o5]0x80	! Mem[0000000010001410] = d40000ff 00000000
!	Starting 10 instruction Load Burst
!	%l3 = 00000000000000a0, imm = fffffffffffff7ef, %l0 = 00000000c21b3886
	sub	%l3,-0x811,%l0		! %l0 = 00000000000008b1

p0_label_149:
!	Mem[0000000010081428] = e98b38d2 38ea007b, %l2 = 000000ff, %l3 = 000000a0
	ldda	[%i2+0x028]%asi,%l2	! %l2 = 00000000e98b38d2 0000000038ea007b
!	Mem[0000000030181410] = ff00ffff, %l1 = 00000000000000b5
	lduwa	[%i6+%o5]0x89,%l1	! %l1 = 00000000ff00ffff
!	Mem[0000000010141418] = d800000000000000, %f12 = 8a7635e1 b743ad62
	ldd	[%i5+0x018],%f12	! %f12 = d8000000 00000000
!	Mem[0000000010141410] = ffffb2ff00000000, %f14 = ecad248c 7af196a3
	ldda	[%i5+%o5]0x88,%f14	! %f14 = ffffb2ff 00000000
!	Mem[0000000010141400] = ffffffff, %l2 = 00000000e98b38d2
	ldsha	[%i5+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181410] = ff00ffff, %l4 = 00000000ff0000ff
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010101410] = 00000000, %l0 = 00000000000008b1
	lduha	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l1 = 00000000ff00ffff
	lduwa	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%f0  = 7b0f00ff, %f30 = 09be3ca1, %f8  = 00000000
	fmuls	%f0 ,%f30,%f8 		! %f8  = 45548937
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000030181410] = ff00ffff 00000000
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff 00000000

p0_label_150:
!	Mem[0000000010041410] = ffff0000, %l7 = ac4f7128ffffffff
	lduha	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030181400] = 3d5800ffffffffff
	stxa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000000
!	Mem[0000000030001400] = ff0000ff, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 000000ff000000ff
!	%f0  = 7b0f00ff ffff0000 6379e6d9 000000ff
!	%f4  = d40000ff 00000000 89a56831 5c11a999
!	%f8  = 45548937 09be3ca1 e98b38d2 38ea007b
!	%f12 = d8000000 00000000 ffffb2ff 00000000
	stda	%f0,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	%f26 = ff000000 ff800000, Mem[0000000010181400] = ffffffff ac4f7128
	std	%f26,[%i6+%g0]	! Mem[0000000010181400] = ff000000 ff800000
!	%l3 = 0000000038ea007b, Mem[000000001004141e] = ff000000
	sth	%l3,[%i1+0x01e]		! Mem[000000001004141c] = ff00007b
!	Mem[0000000010141408] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000030101400] = 0000ffff, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%f22 = 0000ffff ff000f7b, %l4 = 0000000000000000
!	Mem[00000000300c1430] = 00000000a8714fac
	add	%i3,0x030,%g1
	stda	%f22,[%g1+%l4]ASI_PST32_SL ! Mem[00000000300c1430] = 00000000a8714fac
!	Starting 10 instruction Load Burst
!	%l7 = 0000000000000000, imm = 000000000000095c, %l7 = 0000000000000000
	orn	%l7,0x95c,%l7		! %l7 = fffffffffffff6a3

p0_label_151:
!	Mem[0000000010001400] = ffff0000, %l7 = fffffffffffff6a3
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 00000000ffff0000
!	%l4 = 0000000000000000, imm = fffffffffffff584, %l6 = 00000000000000b1
	xor	%l4,-0xa7c,%l6		! %l6 = fffffffffffff584
!	Mem[00000000300c1400] = 00000000ff0000d4, %f22 = 0000ffff ff000f7b
	ldda	[%i3+%g0]0x81,%f22	! %f22 = 00000000 ff0000d4
!	%f13 = 00000000, %f7  = 5c11a999, %f14 = ffffb2ff
	fdivs	%f13,%f7 ,%f14		! %f14 = 00000000
!	Mem[0000000030181410] = ff00000000000000, %l2 = ffffffffffffffff
	ldxa	[%i6+%o5]0x81,%l2	! %l2 = ff00000000000000
!	Mem[00000000100c1410] = ff000000, %l7 = 00000000ffff0000
	ldswa	[%i3+%o5]0x88,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010001408] = ff000000 00000000, %l6 = fffff584, %l7 = ff000000
	ldd	[%i0+%o4],%l6		! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000030001400] = ff0000ff, %l0 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101408] = c41410f0f01014c4, %f14 = 00000000 00000000
	ldda	[%i4+%o4]0x88,%f14	! %f14 = c41410f0 f01014c4
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[000000001000141e] = ffffff00, %asi = 80
	stba	%l4,[%i0+0x01e]%asi	! Mem[000000001000141c] = ffff0000

p0_label_152:
!	%l2 = ff00000000000000, Mem[00000000100c1410] = 000000ffcc0ab2fd
	stx	%l2,[%i3+%o5]		! Mem[00000000100c1410] = ff00000000000000
!	%l1 = 00000000000000ff, %l2 = ff00000000000000, %l2 = ff00000000000000
	xor	%l1,%l2,%l2		! %l2 = ff000000000000ff
!	Mem[0000000010001410] = d40000ff, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 000000d4000000ff
!	Mem[0000000020800001] = b2ff779a, %l3 = 0000000038ea007b
	ldstuba	[%o1+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010001431] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i0+0x031]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181410] = d2388be9, %l6 = 00000000ff000000
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 000000d2000000ff
!	%f20 = 00000000 ffffffff, Mem[0000000010101408] = f01014c4 c41410f0
	stda	%f20,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 ffffffff
!	%f8  = 45548937 09be3ca1, Mem[0000000010141400] = ffffffff 00000000
	stda	%f8 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 45548937 09be3ca1
!	Mem[0000000020800001] = b2ff779a, %l7 = 0000000000000000
	ldstub	[%o1+0x001],%l7		! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ffff00d8a78a88e7, %f10 = e98b38d2 38ea007b
	ldda	[%i0+%o4]0x81,%f10	! %f10 = ffff00d8 a78a88e7

p0_label_153:
!	Mem[0000000030141400] = 00000000 0000ffff, %l0 = ffffffff, %l1 = 000000ff
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 000000000000ffff 0000000000000000
!	Mem[0000000030041408] = 6379e6d9, %l1 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = 0000000000006379
!	Mem[0000000030101408] = ff000000, %l6 = 00000000000000d2
	lduba	[%i4+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l5 = 00000000000000d4
	ldsha	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = c21b38ff, %l2 = ff000000000000ff
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = ffffffffc21b38ff
!	Mem[00000000300c1410] = ffffff00, %l7 = 00000000000000ff
	ldswa	[%i3+%o5]0x81,%l7	! %l7 = ffffffffffffff00
!	%l4 = 0000000000000000, imm = fffffffffffff7da, %l7 = ffffffffffffff00
	xor	%l4,-0x826,%l7		! %l7 = fffffffffffff7da
!	Mem[0000000030001410] = 000000ff, %l0 = 000000000000ffff
	ldsba	[%i0+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181428] = 000000000000007b, %l5 = 0000000000000000
	ldxa	[%i6+0x028]%asi,%l5	! %l5 = 000000000000007b
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000007b, Mem[0000000021800041] = ff482728, %asi = 80
	stba	%l5,[%o3+0x041]%asi	! Mem[0000000021800040] = ff7b2728

p0_label_154:
!	%f24 = 00000000 000000ff, %l2 = ffffffffc21b38ff
!	Mem[0000000030101418] = 99a9115c3168a589
	add	%i4,0x018,%g1
	stda	%f24,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030101418] = ff00000000000000
!	%f18 = c41410f0, Mem[00000000100c1408] = 000000ff
	sta	%f18,[%i3+%o4]0x80	! Mem[00000000100c1408] = c41410f0
!	%f8  = 45548937 09be3ca1, Mem[0000000030101400] = ff00ffff ff000f7b
	stda	%f8 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 45548937 09be3ca1
!	Mem[00000000201c0000] = 00003e5d, %l2 = ffffffffc21b38ff
	ldstub	[%o0+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l7 = fffffffffffff7da
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181423] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i6+0x023]%asi,%l7	! %l7 = 00000000000000ff
!	%f18 = c41410f0, %f30 = 09be3ca1
	fstoi	%f18,%f30		! %f30 = fffffdb0
!	Mem[00000000218001c0] = 00ffa57a, %l1 = 0000000000006379
	ldstuba	[%o3+0x1c0]%asi,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000, %l0 = ffffffffffffffff
	lduba	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000ff

p0_label_155:
!	Mem[0000000010181410] = ff388be9, %l0 = 00000000000000ff
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = ffffffffff388be9
!	Mem[0000000030181400] = 00000000000000ff, %f30 = fffffdb0 f01014c4
	ldda	[%i6+%g0]0x89,%f30	! %f30 = 00000000 000000ff
!	Mem[0000000010181408] = a891adcc, %f29 = 00000000
	lda	[%i6+%o4]0x80,%f29	! %f29 = a891adcc
!	Mem[0000000030081408] = ff000000, %l1 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010081408] = 6379e6d9 000000ff, %l6 = 00000000, %l7 = 00000000
	ldd	[%i2+%o4],%l6		! %l6 = 000000006379e6d9 00000000000000ff
!	Mem[0000000010001410] = ff0000ff, %f29 = a891adcc
	lda	[%i0+%o5]0x80,%f29	! %f29 = ff0000ff
!	Mem[0000000030081408] = ff000000, %l6 = 000000006379e6d9
	lduha	[%i2+%o4]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000030181408] = ffffffff 28714fac, %l0 = ff388be9, %l1 = ff000000
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 00000000ffffffff 0000000028714fac
!	Mem[0000000030041408] = 6379e6d9000000d8, %l0 = 00000000ffffffff
	ldxa	[%i1+%o4]0x81,%l0	! %l0 = 6379e6d9000000d8
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, %l4 = 0000000000000000, %l4 = 0000000000000000
	sub	%l7,%l4,%l4		! %l4 = 00000000000000ff

p0_label_156:
!	%l2 = 0000000000000000, Mem[0000000010081418] = 89a568315c11a999
	stx	%l2,[%i2+0x018]		! Mem[0000000010081418] = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000030081410] = 00000000
	stba	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	Mem[00000000300c1400] = 00000000, %l6 = 000000000000ff00
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%f30 = 00000000 000000ff, Mem[0000000030081408] = ff000000 d9e67963
	stda	%f30,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 000000ff
!	%f14 = c41410f0 f01014c4, %l4 = 00000000000000ff
!	Mem[0000000010041410] = 0000ffffff000f7b
	add	%i1,0x010,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010041410] = c41410f0f01014c4
!	%f30 = 00000000 000000ff, %l1 = 0000000028714fac
!	Mem[00000000100c1430] = 0000000089a56831
	add	%i3,0x030,%g1
	stda	%f30,[%g1+%l1]ASI_PST8_PL ! Mem[00000000100c1430] = 0000000089006800
!	Mem[0000000010001400] = 0000ffff000000ff, %l6 = 0000000000000000, %l2 = 0000000000000000
	casxa	[%i0]0x80,%l6,%l2	! %l2 = 0000ffff000000ff
!	%l7 = 00000000000000ff, Mem[0000000030101410] = fffff7da
	stha	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 00fff7da
!	Mem[0000000010181434] = ffcb0000, %l0 = 6379e6d9000000d8
	ldstub	[%i6+0x034],%l0		! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = f01014c4, %l3 = 00000000000000ff
	ldsha	[%i1+%o5]0x88,%l3	! %l3 = 00000000000014c4

p0_label_157:
!	Mem[0000000010081400] = 421a0000000000ff, %f16 = 000000ff c6de9dcb
	ldda	[%i2+%g0]0x88,%f16	! %f16 = 421a0000 000000ff
!	Mem[0000000030001400] = ff0000ff, %l6 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l6	! %l6 = 00000000ff0000ff
!	Code Fragment 3
p0_fragment_14:
!	%l0 = 00000000000000ff
	setx	0xe5c08a97e4c0939b,%g7,%l0 ! %l0 = e5c08a97e4c0939b
!	%l1 = 0000000028714fac
	setx	0xa5361adfa38324c0,%g7,%l1 ! %l1 = a5361adfa38324c0
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e5c08a97e4c0939b
	setx	0x254a71985c79e366,%g7,%l0 ! %l0 = 254a71985c79e366
!	%l1 = a5361adfa38324c0
	setx	0x456f6117c96951d9,%g7,%l1 ! %l1 = 456f6117c96951d9
!	Mem[0000000020800040] = ffc2726d, %l7 = 00000000000000ff
	ldsba	[%o1+0x041]%asi,%l7	! %l7 = ffffffffffffffc2
!	Mem[0000000030181408] = ffffffff, %l2 = 0000ffff000000ff
	ldsha	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141400] = a13cbe09, %f14 = c41410f0
	lda	[%i5+%g0]0x80,%f14	! %f14 = a13cbe09
!	Mem[0000000030081400] = 00001a42, %l6 = 00000000ff0000ff
	lduha	[%i2+%g0]0x89,%l6	! %l6 = 0000000000001a42
!	Mem[000000001000142c] = 000000ff, %f13 = 00000000
	lda	[%i0+0x02c]%asi,%f13	! %f13 = 000000ff
!	Mem[0000000030181408] = ac4f7128 ffffffff, %l0 = 5c79e366, %l1 = c96951d9
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 00000000ffffffff 00000000ac4f7128
!	Starting 10 instruction Store Burst
!	%f9  = 09be3ca1, Mem[0000000010181418] = c21b38b1
	sta	%f9 ,[%i6+0x018]%asi	! Mem[0000000010181418] = 09be3ca1

p0_label_158:
!	%f26 = ff000000 ff800000, %l0 = 00000000ffffffff
!	Mem[0000000030181430] = 8a7635e1b743ad62
	add	%i6,0x030,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_S ! Mem[0000000030181430] = ff000000ff800000
!	%l2 = ffffffff, %l3 = 000014c4, Mem[0000000030141408] = c21b38ff ff000000
	stda	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff 000014c4
!	Mem[00000000300c1400] = 00ff0000, %l6 = 0000000000001a42
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 0000000000ff0000
!	%f0  = 7b0f00ff, Mem[0000000030181400] = ff000000
	sta	%f0 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 7b0f00ff
!	%f6  = 89a56831 5c11a999, Mem[0000000030101410] = 00fff7da ff0000d4
	stda	%f6 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 89a56831 5c11a999
!	%f16 = 421a0000 000000ff c41410f0 f01014c4
!	%f20 = 00000000 ffffffff 00000000 ff0000d4
!	%f24 = 00000000 000000ff ff000000 ff800000
!	%f28 = ffff0000 ff0000ff 00000000 000000ff
	stda	%f16,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	Mem[0000000010181410] = e98b38ff, %l0 = 00000000ffffffff
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000e98b38ff
!	%l0 = 00000000e98b38ff, Mem[0000000010001404] = 000000ff, %asi = 80
	stwa	%l0,[%i0+0x004]%asi	! Mem[0000000010001404] = e98b38ff
!	%f4  = d40000ff, Mem[00000000100c1430] = 00000000
	sta	%f4 ,[%i3+0x030]%asi	! Mem[00000000100c1430] = d40000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = 00ff0000 4edcd6a0, %l6 = 00ff0000, %l7 = ffffffc2
	ldd	[%i0+0x030],%l6		! %l6 = 0000000000ff0000 000000004edcd6a0

p0_label_159:
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000030101410] = ffffffff, %l2 = ffffffffffffffff
	ldswa	[%i4+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041400] = ffffff00, %l6 = 0000000000ff0000
	ldsha	[%i1+%g0]0x89,%l6	! %l6 = ffffffffffffff00
!	Mem[00000000100c1410] = 000000ff, %l6 = ffffffffffffff00
	lduha	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001410] = 00000000ff0000ff, %f30 = 00000000 000000ff
	ldda	[%i0+%o5]0x88,%f30	! %f30 = 00000000 ff0000ff
!	Mem[0000000010141408] = ff000000, %l6 = 00000000000000ff
	lduha	[%i5+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010081400] = 000000ff, %l6 = 000000000000ff00
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = ff000000, %l4 = 00000000000000ff
	lduba	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = ff0000ff, %l5 = 000000000000007b
	ldsba	[%i0+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101400] = 000000ff, %l6 = 00000000000000ff
	ldsha	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f13 = 000000ff, Mem[0000000010081418] = 00000000
	st	%f13,[%i2+0x018]	! Mem[0000000010081418] = 000000ff

p0_label_160:
!	%l1 = 00000000ac4f7128, Mem[0000000030101410] = ffffffff
	stwa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = ac4f7128
!	Mem[0000000010081408] = d9e67963, %l2 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 00000063000000ff
!	%f27 = ff800000, Mem[0000000030101400] = 000000ff
	sta	%f27,[%i4+%g0]0x89	! Mem[0000000030101400] = ff800000
!	%f29 = ff0000ff, %f14 = a13cbe09 f01014c4
	fstod	%f29,%f14		! %f14 = c7e0001f e0000000
!	Mem[0000000010141424] = 38ea007b, %l6 = 0000000000000000, %asi = 80
	swapa	[%i5+0x024]%asi,%l6	! %l6 = 0000000038ea007b
!	%l2 = 00000063, %l3 = 000014c4, Mem[0000000030001410] = 000000ff 00000000
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000063 000014c4
!	Mem[0000000010101400] = 000000ff, %l1 = 00000000ac4f7128, %asi = 80
	swapa	[%i4+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000010041430] = 9d3248ff, %asi = 80
	stha	%l1,[%i1+0x030]%asi	! Mem[0000000010041430] = 00ff48ff
!	%l4 = 0000000000000000, Mem[0000000010001434] = 4edcd6a0, %asi = 80
	stba	%l4,[%i0+0x034]%asi	! Mem[0000000010001434] = 00dcd6a0
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 421a0000 ff800000, %l2 = 00000063, %l3 = 000014c4
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 00000000ff800000 00000000421a0000

p0_label_161:
!	Mem[0000000030141410] = 140000ff, %l6 = 0000000038ea007b
	lduba	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001438] = 00000000a13cbe09, %f28 = ffff0000 ff0000ff
	ldd	[%i0+0x038],%f28	! %f28 = 00000000 a13cbe09
!	Mem[00000000300c1408] = 000000ff 00ffffff, %l0 = e98b38ff, %l1 = 000000ff
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 0000000000ffffff 00000000000000ff
!	Mem[00000000100c1408] = f01014c4, %l0 = 0000000000ffffff
	lduba	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000c4
!	Mem[0000000010141410] = 00000000, %f23 = ff0000d4
	lda	[%i5+%o5]0x80,%f23	! %f23 = 00000000
!	Mem[000000001000140c] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i0+0x00d]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = ff000000f01014c4, %f28 = 00000000 a13cbe09
	ldda	[%i3+%o4]0x88,%f28	! %f28 = ff000000 f01014c4
!	Mem[0000000010001428] = 00000000, %l5 = ffffffffffffffff
	ldub	[%i0+0x029],%l5		! %l5 = 0000000000000000
!	Mem[0000000010041400] = f9000000ff0000e2, %f0  = 7b0f00ff ffff0000
	ldda	[%i1+0x000]%asi,%f0 	! %f0  = f9000000 ff0000e2
!	Starting 10 instruction Store Burst
!	%f21 = ffffffff, Mem[0000000030081400] = 00001a42
	sta	%f21,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffff

p0_label_162:
!	%f0  = f9000000 ff0000e2, Mem[0000000010081410] = b10000ff 00000000
	stda	%f0 ,[%i2+%o5]0x80	! Mem[0000000010081410] = f9000000 ff0000e2
!	Mem[000000001010140a] = ffffffff, %l5 = 0000000000000000
	ldstub	[%i4+0x00a],%l5		! %l5 = 000000ff000000ff
!	Code Fragment 3
p0_fragment_15:
!	%l0 = 00000000000000c4
	setx	0x7fcc653026c07f0d,%g7,%l0 ! %l0 = 7fcc653026c07f0d
!	%l1 = 00000000000000ff
	setx	0x9adaa987c2d256aa,%g7,%l1 ! %l1 = 9adaa987c2d256aa
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7fcc653026c07f0d
	setx	0x781423c7afa0ddb1,%g7,%l0 ! %l0 = 781423c7afa0ddb1
!	%l1 = 9adaa987c2d256aa
	setx	0x8020b1bf97432491,%g7,%l1 ! %l1 = 8020b1bf97432491
!	%l6 = 0000000000000000, Mem[0000000010101426] = 000000ff, %asi = 80
	stba	%l6,[%i4+0x026]%asi	! Mem[0000000010101424] = 000000ff
!	%l0 = 781423c7afa0ddb1, Mem[0000000010141410] = 00000000ffb2ffff
	stx	%l0,[%i5+%o5]		! Mem[0000000010141410] = 781423c7afa0ddb1
!	Mem[00000000100c1410] = ff000000, %l3 = 00000000421a0000
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	%f3  = 000000ff, Mem[00000000300c1408] = 00ffffff
	sta	%f3 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	%l1 = 8020b1bf97432491, Mem[0000000030101410] = ac4f7128
	stwa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 97432491
!	%l4 = 0000000000000000, Mem[0000000021800000] = 0000b994, %asi = 80
	stha	%l4,[%o3+0x000]%asi	! Mem[0000000021800000] = 0000b994
!	Starting 10 instruction Load Burst
!	Mem[000000001018140c] = 7c68f614, %l3 = 00000000ff000000
	lduwa	[%i6+0x00c]%asi,%l3	! %l3 = 000000007c68f614

p0_label_163:
!	Mem[0000000010081400] = 000000ff, %l2 = 00000000ff800000
	ldsha	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001420] = a4e7ddff, %l2 = 00000000000000ff
	ldswa	[%i0+0x020]%asi,%l2	! %l2 = ffffffffa4e7ddff
!	Mem[0000000010041408] = 000000ffffffffff, %l5 = 00000000000000ff
	ldxa	[%i1+%o4]0x88,%l5	! %l5 = 000000ffffffffff
!	Mem[0000000010101438] = 09be3ca1f01014c4, %f24 = 00000000 000000ff
	ldda	[%i4+0x038]%asi,%f24	! %f24 = 09be3ca1 f01014c4
!	Mem[00000000300c1410] = ffffff0000000f7b, %l0 = 781423c7afa0ddb1
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = ffffff0000000f7b
!	Mem[0000000010081410] = 000000f9, %l0 = ffffff0000000f7b
	lduha	[%i2+%o5]0x88,%l0	! %l0 = 00000000000000f9
!	Mem[0000000010101410] = 00000000ffffffff, %l7 = 000000004edcd6a0
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000030041408] = d9e67963, %f11 = a78a88e7
	lda	[%i1+%o4]0x89,%f11	! %f11 = d9e67963
!	Mem[0000000010001410] = ff0000ff, %l6 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000030101400] = 000080ff00001a42
	stxa	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000000000ff

p0_label_164:
!	%f24 = 09be3ca1 f01014c4, %l3 = 000000007c68f614
!	Mem[0000000030141408] = ffffffffc4140000
	add	%i5,0x008,%g1
	stda	%f24,[%g1+%l3]ASI_PST16_S ! Mem[0000000030141408] = ffff3ca1c4140000
!	%l3 = 000000007c68f614, Mem[00000000201c0001] = ff003e5d, %asi = 80
	stba	%l3,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff143e5d
!	Mem[0000000020800040] = ffc2726d, %l2 = ffffffffa4e7ddff
	ldstuba	[%o1+0x040]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030141408] = ffff3ca1, %l7 = 00000000ffffffff
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000010141408] = 000000ff
	stwa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l7 = 00000000000000ff, Mem[0000000010141410] = c7231478
	stba	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = c72314ff
!	%f0  = f9000000 ff0000e2 6379e6d9 000000ff
!	%f4  = d40000ff 00000000 89a56831 5c11a999
!	%f8  = 45548937 09be3ca1 ffff00d8 d9e67963
!	%f12 = d8000000 000000ff c7e0001f e0000000
	stda	%f0,[%i0]ASI_BLK_AIUS	! Block Store to 0000000030001400
!	Mem[00000000201c0001] = ff143e5d, %l5 = 000000ffffffffff
	ldstub	[%o0+0x001],%l5		! %l5 = 00000014000000ff
!	Mem[00000000300c1410] = 00ffffff, %l5 = 0000000000000014
	swapa	[%i3+%o5]0x89,%l5	! %l5 = 0000000000ffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 421a0000, %l6 = 00000000000000ff
	lduba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000042

p0_label_165:
!	%f21 = ffffffff, %f27 = ff800000
	fcmpes	%fcc3,%f21,%f27		! %fcc3 = 3
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010001428] = 00000000, %l3 = 000000007c68f614
	ldsb	[%i0+0x028],%l3		! %l3 = 0000000000000000
!	%f16 = 421a0000, %f7  = 5c11a999, %f6  = 89a56831
	fsubs	%f16,%f7 ,%f6 		! %f6  = dc11a999
!	%f7  = 5c11a999, %f28 = ff000000, %f0  = f9000000
	fmuls	%f7 ,%f28,%f0 		! %f0  = ff800000
!	Mem[00000000100c1400] = ffffffff 00000000, %l6 = 00000042, %l7 = 000000ff
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000 00000000ffffffff
!	Mem[0000000010041400] = f9000000 ff0000e2, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i1+0x000]%asi,%l6	! %l6 = 00000000f9000000 00000000ff0000e2
!	Mem[0000000010001400] = ffff0000, %l2 = 00000000000000ff
	lduha	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[000000001000140c] = 00000000, %l7 = 00000000ff0000e2
	lduwa	[%i0+0x00c]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030041408] = 6379e6d9
	stwa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000

p0_label_166:
!	%l0 = 00000000000000f9, Mem[0000000030101400] = ff00000000000000
	stxa	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000000000f9
!	Mem[0000000010101400] = 28714fac, %l2 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 000000ac000000ff
!	%l0 = 000000f9, %l1 = 97432491, Mem[0000000010041400] = 000000f9 e20000ff
	stda	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000f9 97432491
!	%f23 = 00000000, Mem[0000000010081408] = ff79e6d9
	sta	%f23,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	Mem[0000000030141400] = 0000ffff, %l2 = 00000000000000ac
	swapa	[%i5+%g0]0x89,%l2	! %l2 = 000000000000ffff
!	%f18 = c41410f0 f01014c4, Mem[0000000030141400] = 000000ac 00000000
	stda	%f18,[%i5+%g0]0x89	! Mem[0000000030141400] = c41410f0 f01014c4
!	%f7  = 5c11a999, Mem[0000000010141418] = d8000000
	st	%f7 ,[%i5+0x018]	! Mem[0000000010141418] = 5c11a999
!	%f20 = 00000000 ffffffff, %l4 = 0000000000000000
!	Mem[0000000010101438] = 09be3ca1f01014c4
	add	%i4,0x038,%g1
	stda	%f20,[%g1+%l4]ASI_PST32_P ! Mem[0000000010101438] = 09be3ca1f01014c4
!	%f4  = d40000ff, Mem[0000000010101400] = ff4f7128
	sta	%f4 ,[%i4+%g0]0x80	! Mem[0000000010101400] = d40000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = f9000000ff0000e2, %l4 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l4	! %l4 = f9000000ff0000e2

p0_label_167:
!	Mem[0000000010181410] = ffffffff, %l0 = 00000000000000f9
	ldsba	[%i6+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081400] = ff000000, %f23 = 00000000
	lda	[%i2+%g0]0x80,%f23	! %f23 = ff000000
!	Mem[0000000010001400] = 0000ffff e98b38ff ff000000 00000000
!	Mem[0000000010001410] = ff0000ff 00000000 00620000 ffff0000
!	Mem[0000000010001420] = a4e7ddff 0000ffff 00000000 000000ff
!	Mem[0000000010001430] = 00ff0000 00dcd6a0 00000000 a13cbe09
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000030001400] = e20000ff000000f9, %l0 = ffffffffffffffff
	ldxa	[%i0+%g0]0x89,%l0	! %l0 = e20000ff000000f9
!	Mem[00000000100c1400] = 00000000, %l4 = f9000000ff0000e2
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = ffffffff, %l7 = 00000000000000ff
	ldswa	[%i1+0x008]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181400] = 7b0f00ff, %f12 = d8000000
	lda	[%i6+%g0]0x81,%f12	! %f12 = 7b0f00ff
!	Mem[0000000010001408] = ff000000, %l1 = 8020b1bf97432491
	ldsw	[%i0+%o4],%l1		! %l1 = ffffffffff000000
!	Mem[0000000030141410] = ff000014cf624977, %f10 = ffff00d8 d9e67963
	ldda	[%i5+%o5]0x81,%f10	! %f10 = ff000014 cf624977
!	Starting 10 instruction Store Burst
!	%l0 = e20000ff000000f9, Mem[0000000030081408] = 00000000
	stha	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00f90000

p0_label_168:
!	%f7  = 5c11a999, Mem[0000000010181400] = ff000000
	sta	%f7 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 5c11a999
!	Mem[0000000010141408] = 00000000, %l6 = 00000000f9000000
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%f14 = c7e0001f e0000000, Mem[0000000010081438] = ecad248c 7af196a3
	stda	%f14,[%i2+0x038]%asi	! Mem[0000000010081438] = c7e0001f e0000000
!	%l3 = 0000000000000000, Mem[000000001014140c] = 92000009
	sth	%l3,[%i5+0x00c]		! Mem[000000001014140c] = 00000009
!	%f6  = dc11a999 5c11a999, Mem[0000000030141410] = ff000014 cf624977
	stda	%f6 ,[%i5+%o5]0x81	! Mem[0000000030141410] = dc11a999 5c11a999
!	%l3 = 0000000000000000, Mem[0000000010181408] = ccad91a8
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = ccad0000
!	Mem[0000000021800181] = b337bce0, %l3 = 0000000000000000
	ldstub	[%o3+0x181],%l3		! %l3 = 00000037000000ff
!	%l4 = 0000000000000000, Mem[00000000211c0000] = ffff6880
	stb	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 00ff6880
!	Mem[0000000030041400] = ffffff00, %l5 = 0000000000ffffff
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffffffff, %l2 = 000000000000ffff
	lduwa	[%i6+%o5]0x88,%l2	! %l2 = 00000000ffffffff

p0_label_169:
!	Mem[0000000030041410] = ff0000ff, %l3 = 0000000000000037
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff0000ff
!	%l3 = 00000000ff0000ff, immed = fffff03c, %y  = ffffffff
	umul	%l3,-0xfc4,%l7		! %l7 = fefff14ac3f04bc4, %y = fefff14a
!	Mem[0000000010081408] = 00000000, %l4 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Code Fragment 3
p0_fragment_16:
!	%l0 = e20000ff000000f9
	setx	0x8652e1bf966677a4,%g7,%l0 ! %l0 = 8652e1bf966677a4
!	%l1 = ffffffffff000000
	setx	0x7496247809728a4a,%g7,%l1 ! %l1 = 7496247809728a4a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8652e1bf966677a4
	setx	0x437fdf3fe792b0d2,%g7,%l0 ! %l0 = 437fdf3fe792b0d2
!	%l1 = 7496247809728a4a
	setx	0x6fa3683859d2c33f,%g7,%l1 ! %l1 = 6fa3683859d2c33f
!	Mem[000000001008142c] = 38ea007b, %l1 = 6fa3683859d2c33f
	lduh	[%i2+0x02e],%l1		! %l1 = 000000000000007b
!	Mem[0000000010041410] = c41410f0, %f5  = 00000000
	lda	[%i1+%o5]0x80,%f5 	! %f5 = c41410f0
!	Mem[0000000010041420] = fdb20acc0000ffff, %l0 = 437fdf3fe792b0d2
	ldx	[%i1+0x020],%l0		! %l0 = fdb20acc0000ffff
!	Mem[00000000201c0000] = ffff3e5d, %l6 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = cb9ddec6ff0000d4, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l5	! %l5 = cb9ddec6ff0000d4
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_17:
!	%l0 = fdb20acc0000ffff
	setx	0xa3e73e3f8ce2f791,%g7,%l0 ! %l0 = a3e73e3f8ce2f791
!	%l1 = 000000000000007b
	setx	0x3a2f3a28130d5696,%g7,%l1 ! %l1 = 3a2f3a28130d5696
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a3e73e3f8ce2f791
	setx	0x75436b5005027d8d,%g7,%l0 ! %l0 = 75436b5005027d8d
!	%l1 = 3a2f3a28130d5696
	setx	0xd3280830788044ab,%g7,%l1 ! %l1 = d3280830788044ab

p0_label_170:
!	Mem[0000000030101400] = f9000000, %l0 = 75436b5005027d8d
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 000000f9000000ff
!	Mem[0000000010181410] = ffffffff, %l7 = fefff14ac3f04bc4
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	%l5 = cb9ddec6ff0000d4, %l6 = 00000000000000ff, %l2 = 00000000ffffffff
	addc	%l5,%l6,%l2		! %l2 = cb9ddec6ff0001d3
!	%f2  = 6379e6d9, Mem[0000000030101410] = 91244397
	sta	%f2 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 6379e6d9
!	%f22 = 00620000 ffff0000, %l1 = d3280830788044ab
!	Mem[0000000030141418] = 6330fb4e66d70f18
	add	%i5,0x018,%g1
	stda	%f22,[%g1+%l1]ASI_PST16_S ! Mem[0000000030141418] = 0062fb4effff0000
!	%f13 = 000000ff, %f18 = ff000000, %f25 = 0000ffff
	fdivs	%f13,%f18,%f25		! %f25 = 80000000
!	Mem[0000000021800140] = 42bdda9c, %l6 = 00000000000000ff
	ldstub	[%o3+0x140],%l6		! %l6 = 00000042000000ff
!	%f24 = a4e7ddff 80000000, %l6 = 0000000000000042
!	Mem[0000000030141410] = dc11a9995c11a999
	add	%i5,0x010,%g1
	stda	%f24,[%g1+%l6]ASI_PST8_S ! Mem[0000000030141410] = dce7a9995c110099
!	Mem[0000000010041410] = f01014c4, %l1 = d3280830788044ab
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 00000000f01014c4
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000ff, %l6 = 0000000000000042
	lduha	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff

p0_label_171:
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010041400] = f9000000 91244397 ffffffff ff000000
!	Mem[0000000010041410] = ab448078 f01014c4 00000000 ff00007b
!	Mem[0000000010041420] = fdb20acc 0000ffff 7aff2058 000000ff
!	Mem[0000000010041430] = 00ff48ff ff38def8 48839796 ffefe943
	ldda	[%i1]ASI_BLK_PL,%f16	! Block Load from 0000000010041400
!	Mem[0000000010181410] = ffffffffff1014c4, %f12 = 7b0f00ff 000000ff
	ldda	[%i6+%o5]0x80,%f12	! %f12 = ffffffff ff1014c4
!	%f10 = ff000014, %f4  = d40000ff
	fsqrts	%f10,%f4 		! %f4  = 7fffffff
!	Mem[0000000030081410] = ff000000, %l2 = cb9ddec6ff0001d3
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010181408] = ccad0000, %l6 = 00000000000000ff
	ldsha	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = 14000000, %l4 = 0000000000000000
	ldsba	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000014
!	Mem[0000000010101420] = 00000000 000000ff, %l2 = ff000000, %l3 = ff0000ff
	ldda	[%i4+0x020]%asi,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000010081438] = c7e0001fe0000000, %f8  = 45548937 09be3ca1
	ldda	[%i2+0x038]%asi,%f8 	! %f8  = c7e0001f e0000000
!	%f7  = 5c11a999, %f0  = ff800000, %f4  = 7fffffff
	fmuls	%f7 ,%f0 ,%f4 		! %f4  = ff800000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 99a9e7dc, %l5 = cb9ddec6ff0000d4
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 0000000099a9e7dc

p0_label_172:
!	%l1 = 00000000f01014c4, Mem[0000000010081410] = 000000f9
	stha	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 000014c4
	membar	#Sync			! Added by membar checker (29)
!	%f2  = 6379e6d9 000000ff, Mem[0000000010041410] = ab448078 f01014c4
	std	%f2 ,[%i1+%o5]	! Mem[0000000010041410] = 6379e6d9 000000ff
!	%l0 = 00000000000000f9, Mem[0000000030081408] = ff0000000000f900
	stxa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000f9
!	%f12 = ffffffff ff1014c4, %l1 = 00000000f01014c4
!	Mem[0000000030081400] = ffffffff000000ff
	stda	%f12,[%i2+%l1]ASI_PST32_S ! Mem[0000000030081400] = ffffffff000000ff
!	Mem[00000000100c1400] = 00000000, %l4 = 0000000000000014
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%f14 = c7e0001f e0000000, %l0 = 00000000000000f9
!	Mem[0000000010001428] = 00000000000000ff
	add	%i0,0x028,%g1
	stda	%f14,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010001428] = 000000e0000000ff
!	%f0  = ff800000 ff0000e2, Mem[0000000010041408] = ffffffff 000000ff
	stda	%f0 ,[%i1+%o4]0x88	! Mem[0000000010041408] = ff800000 ff0000e2
!	%l7 = 00000000000000ff, Mem[0000000010081438] = c7e0001f
	stb	%l7,[%i2+0x038]		! Mem[0000000010081438] = ffe0001f
!	%f20 = c41410f0 788044ab, Mem[0000000030041410] = ff0000ff 00000000
	stda	%f20,[%i1+%o5]0x81	! Mem[0000000030041410] = c41410f0 788044ab
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = d40000ff421a0000, %f12 = ffffffff ff1014c4
	ldda	[%i3+%g0]0x89,%f12	! %f12 = d40000ff 421a0000

p0_label_173:
!	Mem[0000000030181408] = ffffffff, %l4 = 0000000000000000
	ldsba	[%i6+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	%l7 = 00000000000000ff, imm = 0000000000000869, %l6 = 0000000000000000
	xnor	%l7,0x869,%l6		! %l6 = fffffffffffff769
!	Mem[0000000010181408] = ccad0000, %l7 = 00000000000000ff
	ldswa	[%i6+%o4]0x88,%l7	! %l7 = ffffffffccad0000
!	%l4 = ffffffffffffffff, imm = 0000000000000c1c, %l1 = 00000000f01014c4
	add	%l4,0xc1c,%l1		! %l1 = 0000000000000c1b
!	Mem[0000000030041410] = f01014c4, %f5  = c41410f0
	lda	[%i1+%o5]0x89,%f5 	! %f5 = f01014c4
!	Mem[0000000030181408] = ffffffff, %l7 = ffffffffccad0000
	ldsha	[%i6+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141400] = c41410f0, %l7 = ffffffffffffffff
	lduwa	[%i5+%g0]0x81,%l7	! %l7 = 00000000c41410f0
!	Mem[0000000010041410] = 6379e6d9, %l6 = fffffffffffff769
	ldsb	[%i1+%o5],%l6		! %l6 = 0000000000000063
!	Mem[0000000030141400] = c41410f0 f01014c4, %l0 = 000000f9, %l1 = 00000c1b
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 00000000f01014c4 00000000c41410f0
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 6379e6d9, %l3 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l3	! %l3 = 00000063000000ff

p0_label_174:
!	%f1  = ff0000e2, %f27 = 5820ff7a
	fsqrts	%f1 ,%f27		! %f27 = 7fffffff
!	Mem[0000000030141400] = c41410f0, %l6 = 0000000000000063
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 000000c4000000ff
!	Mem[0000000010001400] = ffff0000, %l1 = 00000000c41410f0
	ldsba	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%l2 = 00000000, %l3 = 00000063, Mem[0000000010181408] = 0000adcc 7c68f614
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 00000063
!	%f28 = f8de38ff, Mem[0000000010041428] = 7aff2058
	st	%f28,[%i1+0x028]	! Mem[0000000010041428] = f8de38ff
!	Mem[0000000010181408] = 00000000, %l1 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Code Fragment 3
p0_fragment_18:
!	%l0 = 00000000f01014c4
	setx	0xeebef3605c92ff7e,%g7,%l0 ! %l0 = eebef3605c92ff7e
!	%l1 = 0000000000000000
	setx	0x627506e87a1bb55c,%g7,%l1 ! %l1 = 627506e87a1bb55c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = eebef3605c92ff7e
	setx	0xfb4545180d95abab,%g7,%l0 ! %l0 = fb4545180d95abab
!	%l1 = 627506e87a1bb55c
	setx	0xe3d4d1701c159bac,%g7,%l1 ! %l1 = e3d4d1701c159bac
!	Mem[0000000030101400] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%l1 = e3d4d1701c159bac, Mem[0000000010181410] = ffffffff
	stha	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = ffff9bac
!	Starting 10 instruction Load Burst
!	Mem[0000000010041428] = f8de38ff, %l7 = 00000000c41410f0
	ldswa	[%i1+0x028]%asi,%l7	! %l7 = fffffffff8de38ff

p0_label_175:
!	Mem[0000000010081424] = 09be3ca1, %l0 = fb4545180d95abab
	lduwa	[%i2+0x024]%asi,%l0	! %l0 = 0000000009be3ca1
!	Code Fragment 4
p0_fragment_19:
!	%l0 = 0000000009be3ca1
	setx	0xb03636af90322212,%g7,%l0 ! %l0 = b03636af90322212
!	%l1 = e3d4d1701c159bac
	setx	0x4bdff8105ee46a8b,%g7,%l1 ! %l1 = 4bdff8105ee46a8b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b03636af90322212
	setx	0xfe5bb47f8d2de3f3,%g7,%l0 ! %l0 = fe5bb47f8d2de3f3
!	%l1 = 4bdff8105ee46a8b
	setx	0x7e7fc7c02fd311f3,%g7,%l1 ! %l1 = 7e7fc7c02fd311f3
!	Mem[0000000030141400] = ff1410f0, %l6 = 00000000000000c4
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 000000000000ff14
!	Mem[0000000020800000] = b2ff779a, %l0 = fe5bb47f8d2de3f3
	lduba	[%o1+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001410] = d40000ff, %l0 = 00000000000000ff
	lduwa	[%i0+%o5]0x81,%l0	! %l0 = 00000000d40000ff
!	Mem[00000000100c1410] = 00001a42, %l0 = 00000000d40000ff
	lduwa	[%i3+%o5]0x88,%l0	! %l0 = 0000000000001a42
!	Mem[0000000010101410] = 00000000, %l2 = 00000000000000ff
	ldswa	[%i4+0x010]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l1 = 7e7fc7c02fd311f3
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181408] = 6300000000000000, %l5 = 0000000099a9e7dc
	ldxa	[%i6+%o4]0x88,%l5	! %l5 = 6300000000000000
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[0000000010101408] = ffffffff
	stwa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffff

p0_label_176:
!	%l2 = 0000000000000000, Mem[00000000100c1400] = ff000000ffffffff, %asi = 80
	stxa	%l2,[%i3+0x000]%asi	! Mem[00000000100c1400] = 0000000000000000
!	%l5 = 6300000000000000, imm = 000000000000037f, %l5 = 6300000000000000
	orn	%l5,0x37f,%l5		! %l5 = fffffffffffffc80
!	%f23 = 00000000, Mem[0000000010141408] = ff000000
	sta	%f23,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%f23 = 00000000, Mem[0000000030001400] = 000000f9
	sta	%f23,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%l6 = 000000000000ff14, Mem[0000000030081400] = ff000000ffffffff
	stxa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000000000ff14
!	%l1 = ffffffffffffffff, Mem[0000000030081400] = 14ff0000
	stwa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffff
!	%l1 = ffffffffffffffff, Mem[0000000030001410] = d40000ff
	stba	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = ff0000ff
!	Mem[0000000030101410] = d9e67963, %l7 = fffffffff8de38ff
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 000000d9000000ff
!	%l5 = fffffffffffffc80, Mem[0000000010101410] = 00000000
	stwa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = fffffc80
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000030001400] = 00000000 ff0000e2 ff79e6d9 000000ff
!	Mem[0000000030001410] = ff0000ff 00000000 89a56831 5c11a999
!	Mem[0000000030001420] = 45548937 09be3ca1 ffff00d8 d9e67963
!	Mem[0000000030001430] = d8000000 000000ff c7e0001f e0000000
	ldda	[%i0]ASI_BLK_SL,%f16	! Block Load from 0000000030001400

p0_label_177:
!	Mem[0000000010181400] = 5c11a999, %f15 = e0000000
	lda	[%i6+%g0]0x80,%f15	! %f15 = 5c11a999
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000000001a42
	lduwa	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 421a0000, %l6 = 000000000000ff14
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000042
!	Mem[0000000020800040] = ffc2726d, %l2 = 0000000000000000
	ldub	[%o1+0x040],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010181400] = 99a9115c, %l2 = 00000000000000ff
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 0000000099a9115c
!	Mem[0000000010181410] = ac9bffffff1014c4, %f10 = ff000014 cf624977
	ldda	[%i6+%o5]0x80,%f10	! %f10 = ac9bffff ff1014c4
!	Mem[0000000030101408] = c41410f0, %l1 = ffffffffffffffff
	ldsha	[%i4+%o4]0x81,%l1	! %l1 = ffffffffffffc414
!	Mem[0000000010041410] = d9e67963, %l4 = ffffffffffffffff
	lduwa	[%i1+%o5]0x88,%l4	! %l4 = 00000000d9e67963
!	Mem[0000000030081410] = ff000000, %l7 = 00000000000000d9
	ldsha	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%f0  = ff800000 ff0000e2, %l3 = 0000000000000063
!	Mem[0000000010101428] = ff000000ff800000
	add	%i4,0x028,%g1
	stda	%f0,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010101428] = e2000000ff008000

p0_label_178:
!	Mem[0000000010101400] = d40000ff, %l3 = 0000000000000063
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 000000d4000000ff
!	Mem[0000000030141408] = a13cffff, %l6 = 0000000000000042
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	%f10 = ac9bffff ff1014c4, %l1 = ffffffffffffc414
!	Mem[0000000010081410] = c4140000ff0000e2
	add	%i2,0x010,%g1
	stda	%f10,[%g1+%l1]ASI_PST8_P ! Mem[0000000010081410] = c41400ffff1000e2
!	%l7 = ffffffffffffff00, Mem[0000000010101438] = 09be3ca1
	stw	%l7,[%i4+0x038]		! Mem[0000000010101438] = ffffff00
!	%f14 = c7e0001f, Mem[0000000010001408] = ff000000
	sta	%f14,[%i0+%o4]0x80	! Mem[0000000010001408] = c7e0001f
!	Mem[0000000010001400] = 0000ffff, %l4 = 00000000d9e67963
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%l5 = fffffffffffffc80, Mem[0000000030081400] = ffffffff
	stba	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 80ffffff
!	%l0 = 0000000000000000, Mem[0000000010001410] = 00000000ff0000ff
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
	membar	#Sync			! Added by membar checker (31)
!	%f10 = ac9bffff ff1014c4, %l6 = 00000000000000ff
!	Mem[0000000030001430] = d8000000000000ff
	add	%i0,0x030,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_S ! Mem[0000000030001430] = ac9bffffff1014c4
!	Starting 10 instruction Load Burst
!	Mem[0000000010101414] = ffffffff, %l6 = 00000000000000ff
	ldsw	[%i4+0x014],%l6		! %l6 = ffffffffffffffff

p0_label_179:
!	Mem[0000000030041410] = c41410f0, %l3 = 00000000000000d4
	ldsha	[%i1+%o5]0x81,%l3	! %l3 = ffffffffffffc414
!	Mem[00000000100c1400] = 00000000 00000000 c41410f0 000000ff
!	Mem[00000000100c1410] = 421a0000 00000000 431bbaae c6f3ecaf
!	Mem[00000000100c1420] = 00000000 0000000a 78b7ff9c 00000000
!	Mem[00000000100c1430] = d40000ff 89006800 00000000 ff0000d4
	ldda	[%i3]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[0000000030001400] = 00000000ff0000e2, %f2  = 6379e6d9 000000ff
	ldda	[%i0+%g0]0x81,%f2 	! %f2  = 00000000 ff0000e2
!	%l2 = 0000000099a9115c, imm = fffffffffffff2b3, %l4 = 0000000000000000
	xor	%l2,-0xd4d,%l4		! %l4 = ffffffff6656e3ef
!	Mem[00000000300c1408] = ff000000, %l3 = ffffffffffffc414
	ldsba	[%i3+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081410] = ff0014c4, %l1 = ffffffffffffc414
	lduwa	[%i2+%o5]0x88,%l1	! %l1 = 00000000ff0014c4
!	Mem[0000000030041410] = c41410f0, %l6 = ffffffffffffffff
	lduba	[%i1+%o5]0x81,%l6	! %l6 = 00000000000000c4
!	Mem[0000000010041420] = fdb20acc, %l7 = ffffffffffffff00
	ldub	[%i1+0x020],%l7		! %l7 = 00000000000000fd
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000000000000
	ldsha	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 00000000 c41410f0 000000ff
!	%f20 = 421a0000 00000000 431bbaae c6f3ecaf
!	%f24 = 00000000 0000000a 78b7ff9c 00000000
!	%f28 = d40000ff 89006800 00000000 ff0000d4
	stda	%f16,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400

p0_label_180:
!	Mem[0000000020800001] = b2ff779a, %l2 = 0000000099a9115c
	ldstub	[%o1+0x001],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000030181400] = 7b0f00ff, %l2 = 00000000000000ff
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 0000007b000000ff
!	%f16 = 00000000 00000000 c41410f0 000000ff
!	%f20 = 421a0000 00000000 431bbaae c6f3ecaf
!	%f24 = 00000000 0000000a 78b7ff9c 00000000
!	%f28 = d40000ff 89006800 00000000 ff0000d4
	stda	%f16,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	%f0  = ff800000 ff0000e2, %l1 = 00000000ff0014c4
!	Mem[0000000030041418] = ffffffffb1381bc2
	add	%i1,0x018,%g1
	stda	%f0,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030041418] = ffff00ffb13880ff
!	%l6 = 00000000000000c4, Mem[0000000030081410] = 421a000000000000
	stxa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000000000c4
!	%l6 = 00000000000000c4, Mem[0000000030081410] = c4000000
	stwa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000c4
!	%f6  = dc11a999, Mem[0000000030001400] = 00000000
	sta	%f6 ,[%i0+%g0]0x89	! Mem[0000000030001400] = dc11a999
!	%l2 = 0000007b, %l3 = ffffffff, Mem[0000000030141408] = ffff3ca1 c4140000
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000007b ffffffff
!	%l4 = ffffffff6656e3ef, %l7 = 00000000000000fd, %l3 = ffffffffffffffff
	andn	%l4,%l7,%l3		! %l3 = ffffffff6656e302
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = c41410f0, %l2 = 000000000000007b
	lduba	[%i1+%o5]0x81,%l2	! %l2 = 00000000000000c4

p0_label_181:
!	Mem[0000000010181420] = 000000ff, %l1 = 00000000ff0014c4
	ldsha	[%i6+0x020]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1410] = 7b0f000000000014, %f8  = c7e0001f e0000000
	ldda	[%i3+%o5]0x89,%f8 	! %f8  = 7b0f0000 00000014
	membar	#Sync			! Added by membar checker (32)
!	Mem[00000000100c141c] = c6f3ecaf, %l1 = 0000000000000000
	lduba	[%i3+0x01c]%asi,%l1	! %l1 = 00000000000000c6
!	Mem[0000000010181410] = ac9bffffff1014c4, %l7 = 00000000000000fd
	ldxa	[%i6+0x010]%asi,%l7	! %l7 = ac9bffffff1014c4
!	Mem[0000000010001410] = 00000000, %l5 = fffffffffffffc80
	ldswa	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = ffff3e5d, %l4 = ffffffff6656e3ef
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[00000000100c1400] = 00000000 00000000 c41410f0 000000ff
!	Mem[00000000100c1410] = 421a0000 00000000 431bbaae c6f3ecaf
!	Mem[00000000100c1420] = 00000000 0000000a 78b7ff9c 00000000
!	Mem[00000000100c1430] = d40000ff 89006800 00000000 ff0000d4
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	%l4 = 000000000000ffff, imm = 0000000000000d4f, %l0 = 0000000000000000
	andn	%l4,0xd4f,%l0		! %l0 = 000000000000f2b0
!	Mem[0000000010101408] = ffffffff, %l3 = ffffffff6656e302
	lduwa	[%i4+%o4]0x80,%l3	! %l3 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 00000000, %l1 = 00000000000000c6
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_182:
!	Mem[0000000010041420] = fdb20acc0000ffff, %l4 = 000000000000ffff, %l6 = 00000000000000c4
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = fdb20acc0000ffff
!	%f16 = 00000000, Mem[0000000010081400] = 000000ff
	sta	%f16,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%f16 = 00000000 00000000 c41410f0 000000ff
!	%f20 = 421a0000 00000000 431bbaae c6f3ecaf
!	%f24 = 00000000 0000000a 78b7ff9c 00000000
!	%f28 = d40000ff 89006800 00000000 ff0000d4
	stda	%f16,[%i2]ASI_BLK_P	! Block Store to 0000000010081400
!	Mem[0000000010001408] = 1f00e0c7, %l4 = 000000000000ffff
	swapa	[%i0+%o4]0x88,%l4	! %l4 = 000000001f00e0c7
!	Mem[0000000030081400] = c6000000, %l7 = ac9bffffff1014c4
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 000000c6000000ff
!	%l0 = 0000f2b0, %l1 = 00000000, Mem[0000000030181410] = 000000ff 00000000
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000f2b0 00000000
!	%l2 = 00000000000000c4, Mem[0000000010081408] = ff000000f01014c4
	stxa	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000c4
!	%l1 = 0000000000000000, Mem[0000000010101420] = 00000000000000ff, %asi = 80
	stxa	%l1,[%i4+0x020]%asi	! Mem[0000000010101420] = 0000000000000000
!	%f4  = 421a0000 00000000, %l1 = 0000000000000000
!	Mem[0000000030041400] = ffffffffd9e67963
	stda	%f4,[%i1+%l1]ASI_PST16_SL ! Mem[0000000030041400] = ffffffffd9e67963
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = f01014c4, %l6 = fdb20acc0000ffff
	ldsba	[%i4+%o4]0x89,%l6	! %l6 = ffffffffffffffc4

p0_label_183:
!	Mem[0000000010141400] = 4554893709be3ca1, %f8  = 00000000 0000000a
	ldda	[%i5+%g0]0x88,%f8 	! %f8  = 45548937 09be3ca1
!	Mem[0000000030081408] = 000000ff, %l5 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = 00001a42, %l5 = 00000000000000ff
	ldswa	[%i3+%o5]0x88,%l5	! %l5 = 0000000000001a42
!	Mem[0000000010181410] = ac9bffff, %l7 = 00000000000000c6
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000ac
!	Mem[0000000030181410] = 0000f2b0, %l3 = 00000000ffffffff
	lduba	[%i6+%o5]0x89,%l3	! %l3 = 00000000000000b0
!	%l6 = ffffffffffffffc4, %l3 = 00000000000000b0, %l6 = ffffffffffffffc4
	sdivx	%l6,%l3,%l6		! %l6 = 0000000000000000
!	Mem[0000000010181410] = ac9bffff, %l2 = 00000000000000c4
	ldsba	[%i6+%o5]0x80,%l2	! %l2 = ffffffffffffffac
!	Mem[00000000100c1410] = 00000000 00001a42, %l0 = 0000f2b0, %l1 = 00000000
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 0000000000001a42 0000000000000000
!	Mem[0000000010101400] = cb9ddec6 ff0000ff, %l4 = 1f00e0c7, %l5 = 00001a42
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 00000000ff0000ff 00000000cb9ddec6
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 00000000 c41410f0 000000ff
!	%f4  = 421a0000 00000000 431bbaae c6f3ecaf
!	%f8  = 45548937 09be3ca1 78b7ff9c 00000000
!	%f12 = d40000ff 89006800 00000000 ff0000d4
	stda	%f0,[%i5]ASI_BLK_AIUP	! Block Store to 0000000010141400

p0_label_184:
!	%l2 = ffffffffffffffac, %l7 = 00000000000000ac, %l0 = 0000000000001a42
	andn	%l2,%l7,%l0		! %l0 = ffffffffffffff00
!	Mem[0000000010001400] = ff00ffff, %l0 = ffffffffffffff00
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	%f30 = 00000000 ff0000d4, Mem[0000000030001400] = dc11a999 e20000ff
	stda	%f30,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 ff0000d4
!	Mem[00000000100c1430] = d40000ff, %l1 = 0000000000000000
	swap	[%i3+0x030],%l1		! %l1 = 00000000d40000ff
!	Mem[000000001000142e] = 000000ff, %l2 = ffffffffffffffac
	ldstub	[%i0+0x02e],%l2		! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010141438] = 00000000, %l6 = 0000000000000000
	ldstub	[%i5+0x038],%l6		! %l6 = 00000000000000ff
!	%l0 = 000000ff, %l1 = d40000ff, Mem[0000000010141408] = f01014c4 ff000000
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff d40000ff
!	%l0 = 00000000000000ff, Mem[0000000010181400] = 5c11a999
	stwa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	%f13 = 89006800, Mem[0000000010141410] = 421a0000
	sta	%f13,[%i5+%o5]0x80	! Mem[0000000010141410] = 89006800
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffff0000, %l1 = 00000000d40000ff
	ldsha	[%i0+%o4]0x80,%l1	! %l1 = ffffffffffffffff

p0_label_185:
!	Mem[0000000030181410] = b0f2000000000000, %l3 = 00000000000000b0
	ldxa	[%i6+%o5]0x81,%l3	! %l3 = b0f2000000000000
!	Mem[0000000010141408] = 000000ff, %l1 = ffffffffffffffff
	ldsha	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l1 = 00000000000000ff
	lduwa	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = ff000000, %l3 = b0f2000000000000
	ldswa	[%i2+%o4]0x81,%l3	! %l3 = ffffffffff000000
!	%f24 = 00000000, %f2  = c41410f0
	fcmpes	%fcc0,%f24,%f2 		! %fcc0 = 2
!	Mem[0000000010141410] = 8900680000000000, %l1 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l1	! %l1 = 8900680000000000
!	Mem[0000000010101418] = 0000ffffff000f7b, %l5 = 00000000cb9ddec6
	ldxa	[%i4+0x018]%asi,%l5	! %l5 = 0000ffffff000f7b
!	Mem[0000000010101438] = ffffff00, %l0 = 00000000000000ff
	ldsha	[%i4+0x038]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001408] = ff79e6d9 000000ff, %l2 = 00000000, %l3 = ff000000
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 00000000ff79e6d9 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ff0000ff, Mem[00000000100c1432] = 00000000
	stb	%l4,[%i3+0x032]		! Mem[00000000100c1430] = 0000ff00

p0_label_186:
!	%l6 = 00000000, %l7 = 000000ac, Mem[00000000300c1400] = 00001a42 ff0000d4
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 000000ac
!	%l6 = 0000000000000000, Mem[0000000020800000] = b2ff779a
	sth	%l6,[%o1+%g0]		! Mem[0000000020800000] = 0000779a
!	%l7 = 00000000000000ac, Mem[00000000300c1400] = 00000000
	stha	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ac
!	Mem[000000001014140c] = ff0000d4, %l6 = 0000000000000000
	swap	[%i5+0x00c],%l6		! %l6 = 00000000ff0000d4
!	%l2 = 00000000ff79e6d9, Mem[0000000010101408] = ffffffff
	stba	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = d9ffffff
!	Mem[0000000030081400] = 000000ff, %l6 = 00000000ff0000d4
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l7 = 00000000000000ac, Mem[0000000010181410] = ac9bffff
	stwa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ac
!	Mem[00000000201c0001] = ffff3e5d, %l0 = ffffffffffffffff
	ldstub	[%o0+0x001],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000030041400] = ffffffff, %l4 = 00000000ff0000ff
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff1410f0, %l5 = 0000ffffff000f7b
	ldsba	[%i5+%g0]0x81,%l5	! %l5 = ffffffffffffffff

p0_label_187:
!	Mem[00000000100c1430] = 0000ff00, %l7 = 00000000000000ac
	lduh	[%i3+0x032],%l7		! %l7 = 000000000000ff00
!	Mem[0000000030041410] = ab448078f01014c4, %l3 = 00000000000000ff
	ldxa	[%i1+%o5]0x89,%l3	! %l3 = ab448078f01014c4
!	Mem[0000000030181410] = b0f20000, %l6 = 00000000000000ff
	lduwa	[%i6+%o5]0x81,%l6	! %l6 = 00000000b0f20000
!	Mem[0000000010181410] = c41410ffac000000, %f0  = 00000000 00000000
	ldda	[%i6+%o5]0x88,%f0 	! %f0  = c41410ff ac000000
!	Mem[0000000030041408] = 00000000, %l7 = 000000000000ff00
	ldsha	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = c41410f0 000000ff, %l2 = ff79e6d9, %l3 = f01014c4
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff 00000000c41410f0
!	Mem[00000000100c1410] = 421a0000, %l6 = 00000000b0f20000
	ldswa	[%i3+%o5]0x80,%l6	! %l6 = 00000000421a0000
!	Mem[0000000010101410] = fffffc80ffffffff, %l7 = 0000000000000000
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = fffffc80ffffffff
!	Mem[0000000030141408] = 0000007b, %l6 = 00000000421a0000
	ldsba	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 00000000c41410f0, Mem[00000000211c0000] = 00ff6880
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 10f06880

p0_label_188:
!	%l5 = ffffffffffffffff, Mem[0000000010001435] = 00dcd6a0
	stb	%l5,[%i0+0x035]		! Mem[0000000010001434] = 00ffd6a0
!	%f24 = 00000000 0000000a, %l6 = 0000000000000000
!	Mem[0000000010041428] = f8de38ff000000ff
	add	%i1,0x028,%g1
	stda	%f24,[%g1+%l6]ASI_PST8_P ! Mem[0000000010041428] = f8de38ff000000ff
!	%l1 = 8900680000000000, imm = fffffffffffff630, %l7 = fffffc80ffffffff
	xor	%l1,-0x9d0,%l7		! %l7 = 76ff97fffffff630
!	%f22 = 431bbaae, Mem[00000000300c1410] = 00000014
	sta	%f22,[%i3+%o5]0x89	! Mem[00000000300c1410] = 431bbaae
!	Mem[00000000300c1400] = 000000ac, %l1 = 8900680000000000
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 000000ac000000ff
!	Mem[0000000010081410] = 421a0000, %l6 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 00000042000000ff
!	Mem[0000000010041408] = ff0000e2, %l7 = 76ff97fffffff630
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 000000e2000000ff
!	Mem[00000000100c140a] = c41410f0, %l2 = 00000000000000ff
	ldstuba	[%i3+0x00a]%asi,%l2	! %l2 = 00000010000000ff
!	%l4 = 00000000ffffffff, Mem[0000000030001408] = d9e679ff
	stwa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000ff, %l5 = ffffffffffffffff
	lduba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_189:
!	Mem[00000000100c1408] = ff000000f0ff14c4, %l2 = 0000000000000010
	ldxa	[%i3+%o4]0x88,%l2	! %l2 = ff000000f0ff14c4
!	%f16 = 00000000, %f18 = c41410f0
	fcmpes	%fcc3,%f16,%f18		! %fcc3 = 2
!	Mem[0000000030101410] = 000000006379e6ff, %f28 = d40000ff 89006800
	ldda	[%i4+%o5]0x89,%f28	! %f28 = 00000000 6379e6ff
!	Mem[0000000030041400] = ff0000ff, %f24 = 00000000
	lda	[%i1+%g0]0x89,%f24	! %f24 = ff0000ff
!	%f28 = 00000000, %f15 = ff0000d4
	fsqrts	%f28,%f15		! %f15 = 00000000
!	Mem[0000000030101408] = c41410f0, %l2 = ff000000f0ff14c4
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = ffffffffc41410f0
!	Mem[0000000010141420] = 4554893709be3ca1, %f26 = 78b7ff9c 00000000
	ldd	[%i5+0x020],%f26	! %f26 = 45548937 09be3ca1
!	Mem[0000000030041408] = 00000000, %l6 = 0000000000000042
	lduwa	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%l3 = 00000000c41410f0, imm = 0000000000000625, %l4 = 00000000ffffffff
	or	%l3,0x625,%l4		! %l4 = 00000000c41416f5
!	Starting 10 instruction Store Burst
!	Mem[0000000010001430] = 00ff0000, %l3 = 00000000c41410f0
	swap	[%i0+0x030],%l3		! %l3 = 0000000000ff0000

p0_label_190:
!	Mem[0000000010081430] = d40000ff, %l2 = c41410f0, %l7 = 000000e2
	add	%i2,0x30,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 00000000d40000ff
!	Mem[0000000010041418] = 00000000ff00007b, %l5 = 00000000000000ff, %l3 = 0000000000ff0000
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 00000000ff00007b
!	%f10 = 78b7ff9c 00000000, Mem[0000000010141408] = ff000000 00000000
	std	%f10,[%i5+%o4]	! Mem[0000000010141408] = 78b7ff9c 00000000
!	Mem[00000000201c0000] = ffff3e5d, %l4 = 00000000c41416f5
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%f26 = 45548937 09be3ca1, %l3 = 00000000ff00007b
!	Mem[00000000100c1430] = 0000ff0089006800
	add	%i3,0x030,%g1
	stda	%f26,[%g1+%l3]ASI_PST8_P ! Mem[00000000100c1430] = 0054893709003ca1
!	Mem[0000000010181420] = 000000ff, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x020]%asi,%l0	! %l0 = 00000000000000ff
!	%f25 = 0000000a, Mem[0000000030141408] = 7b000000
	sta	%f25,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000a
!	Mem[0000000030081410] = 000000c4, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000c4
!	%l0 = 00000000000000ff, Mem[00000000201c0000] = ffff3e5d, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff3e5d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = c414fff0 000000ff, %l0 = 000000ff, %l1 = 000000ac
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 00000000c414fff0 00000000000000ff

p0_label_191:
!	Mem[0000000010101410] = 80fcffff, %l3 = 00000000ff00007b
	ldsba	[%i4+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181400] = ff000000, %l6 = 00000000000000c4
	ldswa	[%i6+%g0]0x88,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030181408] = ffffffff, %l1 = 00000000000000ff
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181408] = ffffffff28714fac, %f14 = 00000000 00000000
	ldda	[%i6+%o4]0x81,%f14	! %f14 = ffffffff 28714fac
!	Mem[0000000010001410] = 00000000, %l3 = ffffffffffffffff
	lduha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = ff0000ff, %l3 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[0000000030001400] = d40000ff, %l2 = ffffffffc41410f0
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = ffffffffd40000ff
!	Mem[0000000030081408] = ff000000, %l7 = 00000000d40000ff
	lduba	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1408] = ff000000, %f12 = d40000ff
	lda	[%i3+%o4]0x81,%f12	! %f12 = ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 0a000000, %l4 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 0000000a000000ff

p0_label_192:
!	Mem[000000001014141d] = c6f3ecaf, %l7 = 00000000000000ff
	ldstuba	[%i5+0x01d]%asi,%l7	! %l7 = 000000f3000000ff
!	Mem[0000000010001410] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%f20 = 421a0000 00000000, %l6 = ffffffffff000000
!	Mem[0000000010141438] = ff000000ff0000d4
	add	%i5,0x038,%g1
	stda	%f20,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010141438] = ff000000ff0000d4
!	%f12 = ff000000 89006800, Mem[00000000100c1400] = 00000000 00000000
	std	%f12,[%i3+%g0]	! Mem[00000000100c1400] = ff000000 89006800
!	%f8  = 45548937 09be3ca1, Mem[0000000010141400] = 00000000 00000000
	stda	%f8 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 45548937 09be3ca1
!	%f24 = ff0000ff, Mem[00000000100c1410] = 00001a42
	sta	%f24,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff0000ff
!	%l0 = 00000000c414fff0, immd = 00000000000005e2, %l0  = 00000000c414fff0
	mulx	%l0,0x5e2,%l0		! %l0 = 000004818389a1e0
!	Mem[0000000010181410] = 000000ac, %l7 = 00000000000000f3
	ldstuba	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l3 = 000000000000ff00, Mem[0000000010101408] = ffffffd9
	stwa	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 89006800, %l6 = ffffffffff000000
	ldswa	[%i5+%o5]0x80,%l6	! %l6 = ffffffff89006800

p0_label_193:
!	Mem[0000000010001408] = 0000ffff, %l5 = 00000000000000ff
	ldsha	[%i0+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001438] = 00000000 a13cbe09, %l6 = 89006800, %l7 = 00000000
	ldd	[%i0+0x038],%l6		! %l6 = 0000000000000000 00000000a13cbe09
!	Mem[0000000020800000] = 0000779a, %l2 = ffffffffd40000ff
	ldsba	[%o1+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = ff000000 000000ac, %l0 = 8389a1e0, %l1 = 00000000
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff000000 00000000000000ac
!	Mem[0000000030141400] = ff1410f0, %l4 = 000000000000000a
	ldswa	[%i5+%g0]0x81,%l4	! %l4 = ffffffffff1410f0
!	Mem[0000000030041410] = c41410f0788044ab, %l1 = 00000000000000ac
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = c41410f0788044ab
!	Mem[0000000010001428] = 000000e0, %l2 = 0000000000000000
	lduh	[%i0+0x02a],%l2		! %l2 = 00000000000000e0
!	%f16 = 00000000, %f30 = 00000000, %f7  = c6f3ecaf
	fdivs	%f16,%f30,%f7 		! %f7  = 7fffffff
!	Mem[0000000030081408] = 000000ff, %l5 = ffffffffffffffff
	ldsha	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000e0, Mem[00000000100c1408] = f0ff14c4
	stba	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = f0ff14e0

p0_label_194:
!	%l5 = 00000000000000ff, Mem[0000000030141410] = ff0000d4
	stba	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = ff0000ff
!	%f10 = 78b7ff9c 00000000, %l4 = ffffffffff1410f0
!	Mem[0000000030041408] = 00000000000000d8
	add	%i1,0x008,%g1
	stda	%f10,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030041408] = 00000000000000d8
!	Mem[0000000020800001] = 0000779a, %l2 = 00000000000000e0
	ldstub	[%o1+0x001],%l2		! %l2 = 00000000000000ff
!	%f2  = c41410f0, %f26 = 45548937, %f25 = 0000000a
	fdivs	%f2 ,%f26,%f25		! %f25 = be325891
!	%l0 = 00000000ff000000, Mem[0000000010001410] = 000000ff
	stba	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	%l7 = 00000000a13cbe09, Mem[00000000100c1410] = ff0000ff
	stba	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 090000ff
!	Mem[0000000030041410] = c41410f0, %l3 = 000000000000ff00
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 000000c4000000ff
!	Mem[0000000010081410] = ff1a0000, %l4 = ffffffffff1410f0, %asi = 80
	swapa	[%i2+0x010]%asi,%l4	! %l4 = 00000000ff1a0000
!	%f8  = 45548937 09be3ca1, Mem[00000000100c1408] = e014fff0 000000ff
	stda	%f8 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 45548937 09be3ca1
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ac0000ff, %l1 = c41410f0788044ab
	lduwa	[%i6+%o5]0x88,%l1	! %l1 = 00000000ac0000ff

p0_label_195:
!	Mem[0000000010081400] = 0000000000000000, %l0 = 00000000ff000000
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = f01014ff, %l0 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030081400] = d40000ff00000000, %f6  = 431bbaae 7fffffff
	ldda	[%i2+%g0]0x81,%f6 	! %f6  = d40000ff 00000000
!	Mem[0000000030101400] = ff000000, %l6 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000030001410] = ff0000ff, %l0 = ffffffffffffffff
	lduha	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[000000001008143c] = ff0000d4, %l7 = 00000000a13cbe09
	ldsb	[%i2+0x03c],%l7		! %l7 = ffffffffffffffff
!	Code Fragment 4
p0_fragment_20:
!	%l0 = 00000000000000ff
	setx	0x105fbd8fbefa6ad0,%g7,%l0 ! %l0 = 105fbd8fbefa6ad0
!	%l1 = 00000000ac0000ff
	setx	0x90fa8bd7ba930ebb,%g7,%l1 ! %l1 = 90fa8bd7ba930ebb
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 105fbd8fbefa6ad0
	setx	0xe71a5d6068e23f2b,%g7,%l0 ! %l0 = e71a5d6068e23f2b
!	%l1 = 90fa8bd7ba930ebb
	setx	0x9bc016af88ec975a,%g7,%l1 ! %l1 = 9bc016af88ec975a
!	Mem[000000001010141c] = ff000f7b, %l6 = 000000000000ff00
	ldsw	[%i4+0x01c],%l6		! %l6 = ffffffffff000f7b
!	Mem[0000000010181410] = ff0000ac, %l5 = 00000000000000ff
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%f14 = ffffffff 28714fac, Mem[00000000300c1408] = 000000ff 000000ff
	stda	%f14,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffff 28714fac

p0_label_196:
!	%l3 = 00000000000000c4, Mem[0000000030081408] = 000000ff
	stwa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000c4
!	Mem[0000000010181408] = 00000000, %l7 = ffffffffffffffff
	ldstuba	[%i6+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041410] = 6379e6d9, %l5 = 000000000000ff00
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 000000006379e6d9
!	%l4 = 00000000ff1a0000, Mem[0000000030001408] = ffffffff
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ffffff
!	Mem[0000000010101400] = ff0000ff, %l0 = e71a5d6068e23f2b
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000300c1410] = 431bbaae, %l3 = 00000000000000c4
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 000000ae000000ff
!	Mem[0000000030141408] = 000000ff, %l5 = 000000006379e6d9
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000030101408] = c41410f0f01014c4
	stxa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000000000ff
!	Mem[0000000010101410] = fffffc80, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff0000ac, %l3 = 00000000000000ae
	lduba	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000ff

p0_label_197:
!	Mem[00000000100c1408] = 45548937, %l2 = 0000000000000000
	lduwa	[%i3+0x008]%asi,%l2	! %l2 = 0000000045548937
!	%l7 = 00000000000000ff, imm = fffffffffffffcda, %l1 = 9bc016af88ec975a
	orn	%l7,-0x326,%l1		! %l1 = 00000000000003ff
!	Mem[00000000300c1410] = ffba1b43, %f19 = 000000ff
	lda	[%i3+%o5]0x81,%f19	! %f19 = ffba1b43
!	Mem[0000000010101408] = 00ff000000000000, %l7 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l7	! %l7 = 00ff000000000000
!	Mem[00000000300c1410] = 431bbaff, %l4 = 00000000ff1a0000
	lduha	[%i3+%o5]0x89,%l4	! %l4 = 000000000000baff
!	Mem[0000000010001410] = 00000000 00000000, %l0 = 000000ff, %l1 = 000003ff
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010141410] = 8900680000000000, %f24 = ff0000ff be325891
	ldda	[%i5+0x010]%asi,%f24	! %f24 = 89006800 00000000
!	Mem[00000000300c1408] = 28714fac, %l1 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ac
!	Mem[0000000010081408] = c4000000, %l4 = 000000000000baff
	ldsh	[%i2+0x00a],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = d40000ff, %l4 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 00000000d40000ff

p0_label_198:
!	Mem[0000000020800000] = 00ff779a, %l3 = 00000000000000ff
	ldstuba	[%o1+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1400] = ff000000, %l4 = 00000000d40000ff
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	%l5 = 00000000000000ff, Mem[00000000218000c0] = 57ff0fe0, %asi = 80
	stha	%l5,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00ff0fe0
!	%l7 = 00ff000000000000, Mem[0000000030181410] = 0000f2b0
	stba	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000f200
!	%l6 = ffffffffff000f7b, Mem[0000000010001400] = ff00ffff
	stha	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 0f7bffff
!	Mem[0000000021800181] = b3ffbce0, %l1 = 00000000000000ac
	ldstub	[%o3+0x181],%l1		! %l1 = 000000ff000000ff
!	%l6 = ffffffffff000f7b, Mem[0000000030141410] = ff0000ff
	stba	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = ff00007b
!	%l2 = 0000000045548937, Mem[0000000030001408] = 00ffffff000000ff
	stxa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000045548937
!	Mem[0000000010101410] = fffffc80, %l0 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff00007b, %l3 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l3	! %l3 = 00000000ff00007b

p0_label_199:
!	Mem[00000000201c0000] = 00ff3e5d, %l7 = 00ff000000000000
	ldsb	[%o0+0x001],%l7		! %l7 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ff3e5d, %l3 = 00000000ff00007b
	ldsba	[%o0+0x001]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[000000001018141c] = ff3fbf33, %l5 = 00000000000000ff
	ldsb	[%i6+0x01c],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000300c1410] = 7b0f0000431bbaff, %l0 = 00000000000000ff
	ldxa	[%i3+%o5]0x89,%l0	! %l0 = 7b0f0000431bbaff
!	Mem[0000000030001410] = ff0000ff, %l2 = 0000000045548937
	lduwa	[%i0+%o5]0x89,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000030101400] = 000000ff, %l7 = ffffffffffffffff
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l0 = 7b0f0000431bbaff, Mem[000000001004140c] = 000080ff, %asi = 80
	stwa	%l0,[%i1+0x00c]%asi	! Mem[000000001004140c] = 431bbaff
!	Mem[0000000010181408] = ff000000, %l7 = 00000000000000ff
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030101400] = ff000000 00000000, %l6 = ff000f7b, %l7 = ff000000
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00000000, %l6 = 00000000ff000000
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_200:
!	%f0  = c41410ff ac000000 c41410f0 000000ff
!	%f4  = 421a0000 00000000 d40000ff 00000000
!	%f8  = 45548937 09be3ca1 78b7ff9c 00000000
!	%f12 = ff000000 89006800 ffffffff 28714fac
	stda	%f0,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	%l1 = 00000000000000ff, Mem[00000000100c1428] = 78b7ff9c00000000, %asi = 80
	stxa	%l1,[%i3+0x028]%asi	! Mem[00000000100c1428] = 00000000000000ff
!	%f16 = 00000000 00000000, Mem[0000000030181408] = ffffffff ac4f7128
	stda	%f16,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 00000000
!	%l2 = 00000000ff0000ff, Mem[0000000010181408] = 000000ff
	stwa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = ff0000ff
!	Mem[0000000010081404] = 00000000, %l0 = 7b0f0000431bbaff, %asi = 80
	swapa	[%i2+0x004]%asi,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010081400] = 00000000
	stba	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%f20 = 421a0000 00000000, Mem[00000000100c1408] = 37895445 a13cbe09
	stda	%f20,[%i3+%o4]0x88	! Mem[00000000100c1408] = 421a0000 00000000
!	%l5 = ffffffffffffffff, Mem[0000000030001400] = d40000ff00000000
	stxa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffffffffffff
!	%f19 = ffba1b43, Mem[0000000010101410] = 80fcffff
	sta	%f19,[%i4+%o5]0x88	! Mem[0000000010101410] = ffba1b43
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000ffff, %l0 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l0	! %l0 = ffffffffffffffff

p0_label_201:
!	Mem[00000000100c1400] = 000000ff, %l0 = ffffffffffffffff
	ldsha	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001408] = ffff000000000000, %f28 = 00000000 6379e6ff
	ldd	[%i0+%o4],%f28		! %f28 = ffff0000 00000000
!	Mem[0000000030181408] = 00000000, %l3 = ffffffffffffffff
	lduwa	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Code Fragment 3
p0_fragment_21:
!	%l0 = 00000000000000ff
	setx	0x70c9ab1fdd219ec8,%g7,%l0 ! %l0 = 70c9ab1fdd219ec8
!	%l1 = 00000000000000ff
	setx	0x1ab358e7f5a66a7a,%g7,%l1 ! %l1 = 1ab358e7f5a66a7a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 70c9ab1fdd219ec8
	setx	0xfcb7c747f39470fc,%g7,%l0 ! %l0 = fcb7c747f39470fc
!	%l1 = 1ab358e7f5a66a7a
	setx	0xd2792ddfdbf5f246,%g7,%l1 ! %l1 = d2792ddfdbf5f246
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010041428] = f8de38ff, %f26 = 45548937
	ld	[%i1+0x028],%f26	! %f26 = f8de38ff
!	Mem[00000000300c1408] = 28714fac, %l7 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l7	! %l7 = 0000000028714fac
!	Mem[0000000010001408] = ffff0000, %f29 = 00000000
	lda	[%i0+%o4]0x80,%f29	! %f29 = ffff0000
!	Mem[0000000010081418] = 431bbaaec6f3ecaf, %l0 = fcb7c747f39470fc
	ldx	[%i2+0x018],%l0		! %l0 = 431bbaaec6f3ecaf
!	Mem[000000001018142c] = 0000007b, %l6 = 0000000000000000
	lduh	[%i6+0x02c],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[00000000100c1420] = 000000000000000a, %asi = 80
	stxa	%l3,[%i3+0x020]%asi	! Mem[00000000100c1420] = 0000000000000000

p0_label_202:
!	%l7 = 0000000028714fac, Mem[0000000010181420] = 000000ff4edcd6a0, %asi = 80
	stxa	%l7,[%i6+0x020]%asi	! Mem[0000000010181420] = 0000000028714fac
!	Mem[00000000300c1408] = 28714fac, %l5 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 000000ac000000ff
!	%l5 = 00000000000000ac, Mem[000000001004141c] = ff00007b, %asi = 80
	stwa	%l5,[%i1+0x01c]%asi	! Mem[000000001004141c] = 000000ac
!	%f24 = 89006800, Mem[00000000100c1410] = 090000ff
	sta	%f24,[%i3+%o5]0x80	! Mem[00000000100c1410] = 89006800
!	%f12 = ff000000 89006800, Mem[0000000010101428] = e2000000 ff008000
	std	%f12,[%i4+0x028]	! Mem[0000000010101428] = ff000000 89006800
!	Mem[000000001010141c] = ff000f7b, %l3 = 00000000, %l7 = 28714fac
	add	%i4,0x1c,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 00000000ff000f7b
!	Mem[0000000010141430] = d40000ff, %l7 = 00000000ff000f7b
	swap	[%i5+0x030],%l7		! %l7 = 00000000d40000ff
!	%l1 = d2792ddfdbf5f246, Mem[0000000010001400] = ffff7b0f
	stba	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = ffff7b46
!	Mem[0000000010041408] = ff0000ff, %l7 = 00000000d40000ff
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00680089, %l0 = 431bbaaec6f3ecaf
	lduha	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000089

p0_label_203:
!	Mem[00000000211c0000] = 10f06880, %l5 = 00000000000000ac
	ldub	[%o2+0x001],%l5		! %l5 = 00000000000000f0
!	Mem[0000000010181408] = ff0000ff, %l7 = 00000000000000ff
	lduha	[%i6+%o4]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030101410] = 6379e6ff, %f26 = f8de38ff
	lda	[%i4+%o5]0x89,%f26	! %f26 = 6379e6ff
!	Mem[0000000030181408] = 00000000, %l7 = 000000000000ff00
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041430] = 00ff48ff, %l4 = 00000000ff000000
	ldsw	[%i1+0x030],%l4		! %l4 = 0000000000ff48ff
!	%f0  = c41410ff ac000000 c41410f0 000000ff
!	%f4  = 421a0000 00000000 d40000ff 00000000
!	%f8  = 45548937 09be3ca1 78b7ff9c 00000000
!	%f12 = ff000000 89006800 ffffffff 28714fac
	stda	%f0,[%i4]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	Mem[0000000010081408] = c4000000, %l4 = 0000000000ff48ff
	lduba	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000c4
!	Mem[00000000100c1410] = 89006800, %l5 = 00000000000000f0
	ldswa	[%i3+%o5]0x80,%l5	! %l5 = ffffffff89006800
!	Mem[0000000010001410] = 00000000, %l2 = 00000000ff0000ff
	ldsb	[%i0+0x012],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000218001c0] = ffffa57a, %asi = 80
	stba	%l7,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 00ffa57a

p0_label_204:
!	Mem[0000000010041400] = f9000000, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 00000000f9000000
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010101400] = ff0000ff, %l5 = ffffffff89006800
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 00000000ff0000ff
!	%l7 = 00000000f9000000, Mem[000000001018143c] = 7c50879f
	stw	%l7,[%i6+0x03c]		! Mem[000000001018143c] = f9000000
!	Mem[0000000030101408] = f01014c4, %l0 = 0000000000000089
	swapa	[%i4+%o4]0x89,%l0	! %l0 = 00000000f01014c4
!	%l3 = 0000000000000000, Mem[0000000010181400] = 000000ff
	stwa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Mem[0000000010001400] = 467bffff, %l4 = 00000000000000c4
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 00000000467bffff
!	%l4 = 00000000467bffff, Mem[0000000030181408] = 00000000
	stba	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000
!	Mem[0000000030101400] = c41410ff, %l0 = 00000000f01014c4
	swapa	[%i4+%g0]0x81,%l0	! %l0 = 00000000c41410ff
!	Mem[0000000030041410] = 421a0000, %l3 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 00000042000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l4 = 00000000467bffff
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_205:
!	Mem[0000000010041400] = 00000000, %l6 = 0000000000000000
	ldsha	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = ffba1b43, %l1 = d2792ddfdbf5f246
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffffffba
!	%l5 = 00000000ff0000ff, imm = 00000000000007b3, %l7 = 00000000f9000000
	sub	%l5,0x7b3,%l7		! %l7 = 00000000fefff94c
!	Mem[0000000030081400] = 0000000000000000, %f0  = c41410ff ac000000
	ldda	[%i2+%g0]0x89,%f0 	! %f0  = 00000000 00000000
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010101400] = 89006800 c6de9dcb 00ff0000 00000000
!	Mem[0000000010101410] = 431bbaff ffffffff 0000ffff ff000f7b
!	Mem[0000000010101420] = 00000000 00000000 ff000000 89006800
!	Mem[0000000010101430] = ffff0000 00000000 ffffff00 f01014c4
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000010041400] = 00000000 91244397, %l2 = 00000000, %l3 = 00000042
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000 0000000091244397
!	Mem[0000000030181400] = ff000fff, %l0 = 00000000c41410ff
	lduwa	[%i6+%g0]0x89,%l0	! %l0 = 00000000ff000fff
!	Mem[00000000300c1400] = ac000000 ff0000d4, %l6 = 00000000, %l7 = fefff94c
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 00000000ff0000d4 00000000ac000000
!	Mem[00000000300c1408] = ff4f7128, %l1 = ffffffffffffffba
	lduwa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ff4f7128
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010141400] = a13cbe09
	stwa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000

p0_label_206:
!	%l4 = 0000000000000000, Mem[0000000010001408] = ffff000000000000
	stxa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000000
!	Mem[0000000010101408] = 00ff0000, %l5 = 00000000ff0000ff
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030001408] = ff000000
	stwa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010181400] = 000080ff00000000
	stxa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000000
!	Mem[0000000030141400] = f01014ff, %l3 = 0000000091244397
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 00000000f01014ff
!	%f3  = 000000ff, Mem[0000000030101408] = 00000089
	sta	%f3 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff
!	Mem[0000000030001400] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010181426] = 28714fac, %l4 = 0000000000000000
	ldstuba	[%i6+0x026]%asi,%l4	! %l4 = 0000004f000000ff
!	%f9  = 09be3ca1, Mem[0000000030041408] = f01014c4
	sta	%f9 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 09be3ca1
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff1410f0, %l0 = 00000000ff000fff
	ldsha	[%i2+%o5]0x80,%l0	! %l0 = ffffffffffffff14

p0_label_207:
!	Mem[0000000010181414] = ff1014c4, %l4 = 000000000000004f
	lduh	[%i6+0x016],%l4		! %l4 = 00000000000014c4
!	Mem[0000000010001400] = 000000c4, %l0 = ffffffffffffff14
	lduba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = ff0000ff, %l3 = 00000000f01014ff
	lduha	[%i0+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041438] = 48839796ffefe943, %f6  = d40000ff 00000000
	ldd	[%i1+0x038],%f6 	! %f6  = 48839796 ffefe943
!	Mem[0000000010141410] = 00680089, %l6 = 00000000ff0000d4
	ldstuba	[%i5+%o5]0x88,%l6	! %l6 = 00000089000000ff
!	%l2 = 0000000000000000, %l3 = 00000000000000ff, %y  = fefff14a
	udiv	%l2,%l3,%l4		! %l4 = 00000000ffffffff
	mov	%l0,%y			! %y = 00000000
!	%l1 = 00000000ff4f7128, %l3 = 00000000000000ff, %l7 = 00000000ac000000
	subc	%l1,%l3,%l7		! %l7 = 00000000ff4f7029
!	Mem[0000000010001420] = a4e7ddff, %l7 = 00000000ff4f7029
	lduba	[%i0+0x020]%asi,%l7	! %l7 = 00000000000000a4
!	Mem[00000000211c0000] = 10f06880, %l0 = 0000000000000000
	ldsb	[%o2+%g0],%l0		! %l0 = 0000000000000010
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = ff1a0000, %l7 = 00000000000000a4
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 000000ff000000ff

p0_label_208:
!	%l1 = 00000000ff4f7128, Mem[0000000010181408] = ff0000ff
	stba	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 280000ff
!	%f1  = 00000000, Mem[00000000300c1400] = ff0000d4
	sta	%f1 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000030181408] = 000000ff 00000000
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffff 000000ff
!	%f6  = 48839796 ffefe943, Mem[0000000030041408] = 09be3ca1 ff000000
	stda	%f6 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 48839796 ffefe943
!	Mem[0000000010081424] = 0000000a, %l6 = 00000089, %l6 = 00000089
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 000000000000000a
!	Mem[0000000030041400] = c41410ff, %l5 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 00000000c41410ff
!	Mem[0000000030181400] = ff000fff, %l7 = 00000000000000ff
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010041416] = 000000ff, %l7 = 00000000000000ff
	ldstub	[%i1+0x016],%l7		! %l7 = 00000000000000ff
!	%l4 = ffffffff, %l5 = c41410ff, Mem[00000000100c1400] = 000000ff 00680089
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff c41410ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000010141400] = 00000000 37895445 78b7ff9c 00000000
!	Mem[0000000010141410] = ff006800 00000000 431bbaae c6ffecaf
!	Mem[0000000010141420] = 45548937 09be3ca1 78b7ff9c 00000000
!	Mem[0000000010141430] = ff000f7b 89006800 ff000000 ff0000d4
	ldda	[%i5]ASI_BLK_PL,%f16	! Block Load from 0000000010141400

p0_label_209:
!	%l5 = 00000000c41410ff, %l7 = 0000000000000000, %y  = 00000000
	smul	%l5,%l7,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[0000000030101400] = f01014c4 ac000000, %l0 = 00000010, %l1 = ff4f7128
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 00000000f01014c4 00000000ac000000
!	Mem[00000000201c0000] = 00ff3e5d, %l7 = 0000000000000000
	lduh	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010101434] = 00000000, %l1 = 00000000ac000000
	ldsh	[%i4+0x036],%l1		! %l1 = 0000000000000000
!	Mem[0000000030101400] = f01014c4, %f12 = ff000000
	lda	[%i4+%g0]0x81,%f12	! %f12 = f01014c4
!	Mem[0000000010141438] = ff000000 ff0000d4, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i5+0x038]%asi,%l2	! %l2 = 00000000ff000000 00000000ff0000d4
!	Mem[0000000030181400] = ff0f00ff, %l0 = 00000000f01014c4
	ldsha	[%i6+%g0]0x81,%l0	! %l0 = ffffffffffffff0f
!	Mem[0000000010141438] = ff000000, %l7 = 00000000000000ff
	lduba	[%i5+0x03a]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 48839796ffefe943, %f0  = 00000000 00000000
	ldda	[%i1+%o4]0x89,%f0 	! %f0  = 48839796 ffefe943
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ff00007b, %l6 = 000000000000000a
	swapa	[%i5+%o5]0x89,%l6	! %l6 = 00000000ff00007b

p0_label_210:
!	Mem[0000000010181410] = ff0000ac, %l4 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 00000000ff0000ac
!	Code Fragment 3
p0_fragment_22:
!	%l0 = ffffffffffffff0f
	setx	0x89b8a17848317370,%g7,%l0 ! %l0 = 89b8a17848317370
!	%l1 = 0000000000000000
	setx	0xbb9883d7e7ceda0f,%g7,%l1 ! %l1 = bb9883d7e7ceda0f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 89b8a17848317370
	setx	0x2baa4b57d897aea9,%g7,%l0 ! %l0 = 2baa4b57d897aea9
!	%l1 = bb9883d7e7ceda0f
	setx	0x9adb17b853a21d2b,%g7,%l1 ! %l1 = 9adb17b853a21d2b
!	Mem[0000000021800080] = c6ff05ff, %l5 = 00000000c41410ff
	ldstuba	[%o3+0x080]%asi,%l5	! %l5 = 000000c6000000ff
!	%l5 = 00000000000000c6, Mem[0000000030081410] = 00000000
	stba	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000c6
!	%f11 = 00000000, %f2  = c41410f0, %f4  = 421a0000
	fmuls	%f11,%f2 ,%f4 		! %f4  = 80000000
!	%f5  = 00000000, Mem[0000000010041410] = 0000ff00
	sta	%f5 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l4 = 00000000ff0000ac, Mem[0000000010181408] = 280000ff
	stha	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 00ac00ff
!	%l7 = 0000000000000000, Mem[000000001000143e] = a13cbe09, %asi = 80
	stha	%l7,[%i0+0x03e]%asi	! Mem[000000001000143c] = a13c0000
!	%l1 = 9adb17b853a21d2b, Mem[00000000100c1430] = 0054893709003ca1
	stx	%l1,[%i3+0x030]		! Mem[00000000100c1430] = 9adb17b853a21d2b
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 431bbaff, %f9  = 09be3ca1
	lda	[%i3+%o5]0x89,%f9 	! %f9 = 431bbaff

p0_label_211:
!	Mem[00000000100c1400] = ffffffff ff1014c4, %l0 = d897aea9, %l1 = 53a21d2b
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 00000000ffffffff 00000000ff1014c4
!	Mem[0000000010101408] = ffff0000, %l1 = 00000000ff1014c4
	ldsw	[%i4+%o4],%l1		! %l1 = ffffffffffff0000
!	Mem[0000000030181408] = 000000ffffffffff, %l5 = 00000000000000c6
	ldxa	[%i6+%o4]0x89,%l5	! %l5 = 000000ffffffffff
!	Mem[00000000100c1408] = 0000000000001a42, %f0  = 48839796 ffefe943
	ldda	[%i3+%o4]0x80,%f0 	! %f0  = 00000000 00001a42
!	Mem[0000000010141410] = ff006800, %l5 = 000000ffffffffff
	ldsba	[%i5+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1410] = 89006800, %f9  = 431bbaff
	ld	[%i3+%o5],%f9 	! %f9 = 89006800
!	Mem[000000001010143c] = f01014c4, %l0 = 00000000ffffffff
	lduha	[%i4+0x03e]%asi,%l0	! %l0 = 00000000000014c4
!	Mem[0000000010141410] = 006800ff, %l3 = 00000000ff0000d4
	ldswa	[%i5+%o5]0x88,%l3	! %l3 = 00000000006800ff
!	Mem[0000000030101410] = 00001a42, %l3 = 00000000006800ff
	lduwa	[%i4+%o5]0x89,%l3	! %l3 = 0000000000001a42
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030141410] = 9900115c0000000a
	stxa	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000

p0_label_212:
!	Mem[00000000100c1410] = 00680089, %l4 = 00000000ff0000ac
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 0000000000680089
!	%l6 = 00000000ff00007b, Mem[0000000010101408] = ffff0000
	stba	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 7bff0000
!	Mem[0000000010141430] = ff000f7b89006800, %l2 = 00000000ff000000, %l4 = 0000000000680089
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l2,%l4	! %l4 = ff000f7b89006800
!	%l3 = 0000000000001a42, Mem[0000000010001410] = 00000000
	stwa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 00001a42
!	Mem[0000000030181410] = 0000f200, %l0 = 00000000000014c4
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 000000000000f200
!	%f7  = ffefe943, %f27 = 9cffb778
	fsqrts	%f7 ,%f27		! %f27 = ffefe943
!	%l7 = 0000000000000000, Mem[0000000020800040] = ffc2726d, %asi = 80
	stba	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = 00c2726d
!	%l3 = 0000000000001a42, Mem[0000000030181400] = ff000fff
	stwa	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 00001a42
!	Mem[0000000010041406] = 91244397, %l3 = 0000000000001a42
	ldstuba	[%i1+0x006]%asi,%l3	! %l3 = 00000043000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00680089, %l4 = ff000f7b89006800
	lduha	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000089

p0_label_213:
!	Mem[0000000010101424] = 00000000, %l5 = ffffffffffffffff
	lduh	[%i4+0x024],%l5		! %l5 = 0000000000000000
!	Mem[00000000300c1408] = 28714fff, %l3 = 0000000000000043
	ldsha	[%i3+%o4]0x89,%l3	! %l3 = 0000000000004fff
!	Mem[00000000100c1400] = c41410ffffffffff, %l3 = 0000000000004fff
	ldxa	[%i3+%g0]0x88,%l3	! %l3 = c41410ffffffffff
!	Mem[0000000010001410] = 421a000000000000, %l4 = 0000000000000089
	ldx	[%i0+%o5],%l4		! %l4 = 421a000000000000
!	Mem[0000000030041410] = 00001aff, %l4 = 421a000000000000
	ldsba	[%i1+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001408] = 0000000000000000, %f4  = 80000000 00000000
	ldda	[%i0+0x008]%asi,%f4 	! %f4  = 00000000 00000000
!	Mem[0000000010041408] = ff0000ff 431bbaff, %l6 = ff00007b, %l7 = 00000000
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 00000000ff0000ff 00000000431bbaff
!	Mem[0000000030041410] = 00001aff, %l6 = 00000000ff0000ff
	ldsha	[%i1+%o5]0x89,%l6	! %l6 = 0000000000001aff
!	Mem[00000000300c1400] = 00000000 000000ac ff4f7128 ffffffff
!	Mem[00000000300c1410] = ffba1b43 00000f7b 00000000 fdb200ea
!	Mem[00000000300c1420] = 7b00ea38 00000000 ff48329d d53f7559
!	Mem[00000000300c1430] = 00000000 a8714fac 7c50879f 2a5f5cc1
	ldda	[%i3]ASI_BLK_AIUSL,%f0	! Block Load from 00000000300c1400
!	Starting 10 instruction Store Burst
!	%l3 = c41410ffffffffff, Mem[0000000030141400] = 91244397
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 912443ff

p0_label_214:
!	%l0 = 000000000000f200, Mem[0000000010041400] = 000000009124ff97
	stx	%l0,[%i1+%g0]		! Mem[0000000010041400] = 000000000000f200
!	Mem[0000000010141408] = 78b7ff9c, %l2 = 00000000ff000000
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 0000000078b7ff9c
!	%l6 = 0000000000001aff, Mem[00000000100c140c] = 00001a42
	stw	%l6,[%i3+0x00c]		! Mem[00000000100c140c] = 00001aff
!	%l0 = 000000000000f200, Mem[000000001004141c] = 000000ac
	stw	%l0,[%i1+0x01c]		! Mem[000000001004141c] = 0000f200
!	%l5 = 0000000000000000, Mem[0000000030181408] = ffffffff
	stwa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%l0 = 000000000000f200, imm = fffffffffffff958, %l3 = c41410ffffffffff
	and	%l0,-0x6a8,%l3		! %l3 = 000000000000f000
!	%l2 = 0000000078b7ff9c, Mem[0000000030001408] = 00000000
	stha	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000ff9c
!	%l5 = 0000000000000000, Mem[0000000010181408] = 00ac00ff00000063
	stxa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l6 = 0000000000001aff
	ldstuba	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001014142c] = 00000000, %l6 = 0000000000000000
	lduwa	[%i5+0x02c]%asi,%l6	! %l6 = 0000000000000000

p0_label_215:
!	Mem[0000000010101410] = 431bbaffffffffff, %l5 = 0000000000000000
	ldxa	[%i4+%o5]0x80,%l5	! %l5 = 431bbaffffffffff
!	%f31 = 000000ff, %f25 = 37895445, %f31 = 000000ff
	fdivs	%f31,%f25,%f31		! %l0 = 000000000000f222, Unfinished, %fsr = 2a00000800
!	Mem[0000000030001410] = ff0000ff, %f26 = 00000000
	lda	[%i0+%o5]0x81,%f26	! %f26 = ff0000ff
!	Mem[0000000010141400] = 00000000, %l7 = 00000000431bbaff
	lduba	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l1 = ffffffffffff0000
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %f30 = d40000ff
	lda	[%i6+%g0]0x88,%f30	! %f30 = 00000000
!	Mem[0000000010141410] = 00000000 006800ff, %l2 = 78b7ff9c, %l3 = 0000f000
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 00000000006800ff 0000000000000000
!	Mem[0000000010001410] = 00001a42, %l7 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000042
!	Mem[0000000030041408] = 43e9efff, %l3 = 0000000000000000
	ldswa	[%i1+%o4]0x81,%l3	! %l3 = 0000000043e9efff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 431bbaff, %l2 = 00000000006800ff, %asi = 80
	swapa	[%i4+0x010]%asi,%l2	! %l2 = 00000000431bbaff

p0_label_216:
!	%l0 = 000000000000f222, Mem[0000000020800040] = 00c2726d
	stb	%l0,[%o1+0x040]		! Mem[0000000020800040] = 22c2726d
!	Mem[00000000100c1410] = ff0000ac, %l1 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 000000ac000000ff
!	Mem[0000000010141408] = ff000000, %l2 = 00000000431bbaff
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 00000000ff000000
	membar	#Sync			! Added by membar checker (38)
!	%l3 = 0000000043e9efff, Mem[0000000010141400] = 00000000
	stha	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = efff0000
!	%l2 = ff000000, %l3 = 43e9efff, Mem[0000000030081400] = 000000ff 00000000
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = ff000000 43e9efff
!	%l1 = 00000000000000ac, Mem[0000000010081408] = 00000000000000c4
	stxa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000ac
!	Mem[0000000010001400] = 000000c4, %l7 = 0000000000000042
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = ff000000, %l1 = 00000000000000ac
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030041410] = ff1a0000, %l4 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = c41410f0 00ffd6a0, %l2 = ff000000, %l3 = 43e9efff
	ldda	[%i0+0x030]%asi,%l2	! %l2 = 00000000c41410f0 0000000000ffd6a0

p0_label_217:
!	Mem[00000000211c0000] = 10f06880, %l0 = 000000000000f222
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = 00000000000010f0
!	Mem[0000000030181410] = 00000000000014c4, %l4 = 00000000000000ff
	ldxa	[%i6+%o5]0x89,%l4	! %l4 = 00000000000014c4
!	Mem[0000000030041408] = 43e9efff, %l2 = 00000000c41410f0
	ldsba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000043
!	Mem[0000000030101410] = 421a0000, %l4 = 00000000000014c4
	lduba	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000042
!	%f1  = 00000000, %f19 = 9cffb778
	fsqrts	%f1 ,%f19		! %f19 = 00000000
!	Mem[00000000201c0000] = 00ff3e5d, %l7 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141400] = efff0000, %l5 = 431bbaffffffffff
	ldswa	[%i5+%g0]0x80,%l5	! %l5 = ffffffffefff0000
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = ff000000000000ff, %l2 = 0000000000000043
	ldxa	[%i4+%o4]0x89,%l2	! %l2 = ff000000000000ff
!	Starting 10 instruction Store Burst
!	%f20 = 00000000 006800ff, %l3 = 0000000000ffd6a0
!	Mem[0000000030101400] = f01014c4ac000000
	stda	%f20,[%i4+%l3]ASI_PST32_SL ! Mem[0000000030101400] = f01014c4ac000000

p0_label_218:
!	%l2 = ff000000000000ff, Mem[0000000010181414] = ff1014c4
	stw	%l2,[%i6+0x014]		! Mem[0000000010181414] = 000000ff
!	Mem[0000000030001408] = 0000ff9c, %l2 = ff000000000000ff
	swapa	[%i0+%o4]0x89,%l2	! %l2 = 000000000000ff9c
!	Mem[00000000100c1408] = 00000000, %l0 = 00000000000010f0
	swapa	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l5 = ffffffffefff0000, Mem[0000000030001400] = ffffffff
	stba	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffff00
!	%f0  = ac000000 00000000, Mem[00000000100c1408] = f0100000 ff1a0000
	stda	%f0 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = ac000000 00000000
!	Mem[00000000300c1400] = 00000000, %l1 = 00000000ff000000
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = ff4f7128, %l4 = 0000000000000042
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%f5  = 431bbaff, %f12 = ac4f71a8
	fsqrts	%f5 ,%f12		! %f12 = 4147aace
!	Mem[0000000030041410] = 00001aff, %l3 = 0000000000ffd6a0
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 0000000000001aff
!	Starting 10 instruction Load Burst
!	%f30 = 00000000, %f30 = 00000000, %f23 = aeba1b43
	fmuls	%f30,%f30,%f23		! %f23 = 00000000

p0_label_219:
!	Mem[0000000010041408] = ff0000ff, %l0 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1418] = 431bbaae c6f3ecaf, %l6 = 00000000, %l7 = 000000ff
	ldd	[%i3+0x018],%l6		! %l6 = 00000000431bbaae 00000000c6f3ecaf
!	Mem[0000000010041400] = 000000000000f200, %l4 = 00000000000000ff
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = 000000000000f200
!	Mem[00000000201c0000] = 00ff3e5d, %l5 = ffffffffefff0000
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1408] = 28714fff, %l6 = 00000000431bbaae
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 0000000000004fff
!	Mem[0000000030081400] = 43e9efff000000ac, %l2 = 000000000000ff9c
	ldxa	[%i2+%g0]0x89,%l2	! %l2 = 43e9efff000000ac
!	Mem[0000000010081400] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l2 = 43e9efff000000ac, %l0 = 0000000000000000, %y  = 00000000
	umul	%l2,%l0,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[00000000100c1410] = ff0000ff, %l0 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = ffffffffff0000ff
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000f200, Mem[00000000100c1400] = ffffffff
	stba	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00ffffff

p0_label_220:
!	%f26 = ff0000ff ffefe943, Mem[0000000010141420] = 45548937 09be3ca1
	std	%f26,[%i5+0x020]	! Mem[0000000010141420] = ff0000ff ffefe943
!	Mem[0000000030101400] = f01014c4, %l1 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 00000000f01014c4
!	%l6 = 00004fff, %l7 = c6f3ecaf, Mem[0000000030001400] = 00ffffff ffffffff
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00004fff c6f3ecaf
!	%l0 = ff0000ff, %l1 = f01014c4, Mem[0000000030041408] = 43e9efff 96978348
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = ff0000ff f01014c4
!	Mem[00000000100c142c] = 000000ff, %l1 = 00000000f01014c4, %asi = 80
	swapa	[%i3+0x02c]%asi,%l1	! %l1 = 00000000000000ff
!	%f24 = a13cbe09 37895445, Mem[0000000010181410] = 00000000 000000ff
	stda	%f24,[%i6+0x010]%asi	! Mem[0000000010181410] = a13cbe09 37895445
!	%l6 = 0000000000004fff, Mem[0000000030081408] = c4000000
	stwa	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00004fff
!	Mem[0000000010101408] = 0000ff7b, %l1 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 000000000000ff7b
!	Mem[00000000100c1410] = ff0000ff, %l7 = 00000000c6f3ecaf
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = ff7b2728, %l3 = 0000000000001aff
	ldub	[%o3+0x041],%l3		! %l3 = 000000000000007b

p0_label_221:
!	Code Fragment 4
p0_fragment_23:
!	%l0 = ffffffffff0000ff
	setx	0xdbd02bf7adee5639,%g7,%l0 ! %l0 = dbd02bf7adee5639
!	%l1 = 000000000000ff7b
	setx	0x29259a9020bdcd8a,%g7,%l1 ! %l1 = 29259a9020bdcd8a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = dbd02bf7adee5639
	setx	0x58c30eb7e2d3f0dd,%g7,%l0 ! %l0 = 58c30eb7e2d3f0dd
!	%l1 = 29259a9020bdcd8a
	setx	0xff3584e047db2225,%g7,%l1 ! %l1 = ff3584e047db2225
!	Mem[0000000010081408] = ac000000, %f3  = 28714fff
	lda	[%i2+%o4]0x80,%f3 	! %f3 = ac000000
!	Mem[0000000030101400] = 00000000, %l5 = 00000000000000ff
	lduha	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081414] = 00000000, %l2 = 0000000000000000
	ldub	[%i2+0x017],%l2		! %l2 = 0000000000000000
!	Mem[0000000010101410] = 006800ff ffffffff, %l2 = 00000000, %l3 = 0000007b
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 00000000006800ff 00000000ffffffff
!	Mem[0000000010081410] = f01014ff, %l5 = 0000000000000000
	lduwa	[%i2+%o5]0x88,%l5	! %l5 = 00000000f01014ff
!	Mem[0000000010141418] = 431bbaae c6ffecaf, %l0 = e2d3f0dd, %l1 = 47db2225
	ldda	[%i5+0x018]%asi,%l0	! %l0 = 00000000431bbaae 00000000c6ffecaf
!	Mem[00000000300c1408] = 28714fff, %l6 = 0000000000004fff
	lduwa	[%i3+%o4]0x89,%l6	! %l6 = 0000000028714fff
!	Mem[0000000030101410] = 421a000000000000, %l3 = 00000000ffffffff
	ldxa	[%i4+%o5]0x81,%l3	! %l3 = 421a000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 000000ff, %l4 = 000000000000f200
	swapa	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff

p0_label_222:
!	%l1 = 00000000c6ffecaf, Mem[0000000010001400] = ff0000c4
	stha	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = ecaf00c4
!	%f27 = ffefe943, Mem[0000000010001408] = 00000000
	sta	%f27,[%i0+%o4]0x80	! Mem[0000000010001408] = ffefe943
!	%l7 = 00000000ff0000ff, Mem[00000000300c1408] = ff4f7128ffffffff
	stxa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000ff0000ff
!	%l0 = 00000000431bbaae, %l5 = 00000000f01014ff, %l5 = 00000000f01014ff
	addc	%l0,%l5,%l5		! %l5 = 00000001332bcfad
!	%l7 = 00000000ff0000ff, %l4 = 00000000000000ff, %l6 = 0000000028714fff
	sdivx	%l7,%l4,%l6		! %l6 = 0000000001000001
!	%l2 = 00000000006800ff, imm = 00000000000008d8, %l1 = 00000000c6ffecaf
	xnor	%l2,0x8d8,%l1		! %l1 = ffffffffff97f7d8
!	%l0 = 00000000431bbaae, immed = 00000edb, %y  = 00000000
	smul	%l0,0xedb,%l4		! %l4 = 000003e4ecee36da, %y = 000003e4
!	Mem[0000000030181400] = 00001a42, %l0 = 00000000431bbaae
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 00000042000000ff
!	%l4 = ecee36da, %l5 = 332bcfad, Mem[0000000030081408] = 00004fff f01014c4
	stda	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = ecee36da 332bcfad
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000042, %l7 = 00000000ff0000ff, %l4 = 000003e4ecee36da
	subc	%l0,%l7,%l4		! %l4 = ffffffff00ffff43

p0_label_223:
!	Mem[0000000030041408] = c41410f0 ff0000ff, %l4 = 00ffff43, %l5 = 332bcfad
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 00000000ff0000ff 00000000c41410f0
!	Mem[0000000030181408] = 000000ff00000000, %f26 = ff0000ff ffefe943
	ldda	[%i6+%o4]0x89,%f26	! %f26 = 000000ff 00000000
!	Mem[0000000030101410] = 00000000 00001a42, %l6 = 01000001, %l7 = ff0000ff
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 0000000000001a42 0000000000000000
!	Mem[0000000010181438] = fffff57f, %l0 = 0000000000000042
	ldsb	[%i6+0x03a],%l0		! %l0 = fffffffffffffff5
!	Mem[0000000030141408] = 000000ff, %l2 = 00000000006800ff
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = 00ff3e5d, %l7 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = c6000000, %l6 = 0000000000001a42
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000c6
!	Mem[0000000010081410] = 00000000f01014ff, %f0  = ac000000 00000000
	ldda	[%i2+%o5]0x88,%f0 	! %f0  = 00000000 f01014ff
!	Mem[0000000010101410] = ff006800, %l1 = ffffffffff97f7d8
	lduba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f6  = ea00b2fd 00000000, %l7 = 0000000000000000
!	Mem[0000000010101410] = 006800ffffffffff
	add	%i4,0x010,%g1
	stda	%f6,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010101410] = 006800ffffffffff

p0_label_224:
!	Mem[0000000010081408] = ac00000000000000, %l3 = 421a000000000000, %l4 = 00000000ff0000ff
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = ac00000000000000
!	Mem[0000000010041410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%f4  = 7b0f0000 431bbaff, Mem[0000000010181410] = 09be3ca1 45548937
	stda	%f4 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 7b0f0000 431bbaff
!	%l2 = 00000000000000ff, Mem[0000000010141400] = efff0000
	stba	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = ffff0000
!	%l3 = 421a000000000000, Mem[0000000010101401] = 89006800
	stb	%l3,[%i4+0x001]		! Mem[0000000010101400] = 89006800
!	Mem[0000000030001408] = 00f20000, %l1 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 0000000000f20000
!	%l7 = 0000000000000000, Mem[0000000010141420] = ff0000ffffefe943, %asi = 80
	stxa	%l7,[%i5+0x020]%asi	! Mem[0000000010141420] = 0000000000000000
!	Mem[0000000010001408] = ffefe94300000000, %l5 = 00000000c41410f0, %l3 = 421a000000000000
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = ffefe94300000000
!	%f15 = 9f87507c, Mem[0000000010181408] = 00000000
	sta	%f15,[%i6+0x008]%asi	! Mem[0000000010181408] = 9f87507c
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 43e9efff 000000ac, %l0 = fffffff5, %l1 = 00f20000
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ac 0000000043e9efff

p0_label_225:
!	Mem[0000000010081438] = 00000000, %l7 = 0000000000000000
	ldsh	[%i2+0x03a],%l7		! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 00ff3e5d, %l1 = 0000000043e9efff
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001400] = ecaf00c4, %l3 = ffefe94300000000
	ldsba	[%i0+0x001]%asi,%l3	! %l3 = ffffffffffffffaf
!	Mem[0000000010101410] = ff006800, %l2 = 00000000000000ff
	lduha	[%i4+%o5]0x88,%l2	! %l2 = 0000000000006800
!	%l6 = 00000000000000c6, imm = 00000000000000db, %l2 = 0000000000006800
	subc	%l6,0x0db,%l2		! %l2 = ffffffffffffffeb
!	Code Fragment 3
p0_fragment_24:
!	%l0 = 00000000000000ac
	setx	0xea17b5786f88b440,%g7,%l0 ! %l0 = ea17b5786f88b440
!	%l1 = 00000000000000ff
	setx	0x5a75b8b0381eb05b,%g7,%l1 ! %l1 = 5a75b8b0381eb05b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ea17b5786f88b440
	setx	0x095efa203cf0547d,%g7,%l0 ! %l0 = 095efa203cf0547d
!	%l1 = 5a75b8b0381eb05b
	setx	0xd796123041761b56,%g7,%l1 ! %l1 = d796123041761b56
!	Mem[0000000010141410] = 00000000006800ff, %l3 = ffffffffffffffaf
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = 00000000006800ff
!	Mem[0000000010181410] = 7b0f0000 431bbaff, %l0 = 3cf0547d, %l1 = 41761b56
	ldda	[%i6+%o5]0x88,%l0	! %l0 = 00000000431bbaff 000000007b0f0000
!	Mem[0000000010001408] = 43e9efff, %f13 = 00000000
	lda	[%i0+%o4]0x88,%f13	! %f13 = 43e9efff
!	Starting 10 instruction Store Burst
!	%f30 = 00000000 000000ff, %l5 = 00000000c41410f0
!	Mem[0000000010141420] = 0000000000000000
	add	%i5,0x020,%g1
	stda	%f30,[%g1+%l5]ASI_PST16_P ! Mem[0000000010141420] = 0000000000000000

p0_label_226:
!	%l7 = 0000000000000000, Mem[000000001014140c] = 00000000
	stb	%l7,[%i5+0x00c]		! Mem[000000001014140c] = 00000000
!	%f28 = 00680089 7b0f00ff, Mem[0000000030101400] = 00000000 ac000000
	stda	%f28,[%i4+%g0]0x81	! Mem[0000000030101400] = 00680089 7b0f00ff
!	%f4  = 7b0f0000, Mem[00000000100c1428] = 00000000
	st	%f4 ,[%i3+0x028]	! Mem[00000000100c1428] = 7b0f0000
!	Mem[0000000010081400] = 00000000, %l6 = 00000000000000c6
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 431bbaff, %l0 = 00000000431bbaff
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000431bbaff
!	%f14 = c15c5f2a 9f87507c, Mem[0000000010101410] = 006800ff ffffffff
	stda	%f14,[%i4+%o5]0x80	! Mem[0000000010101410] = c15c5f2a 9f87507c
!	%l2 = ffffffffffffffeb, Mem[0000000010141404] = 37895445, %asi = 80
	stha	%l2,[%i5+0x004]%asi	! Mem[0000000010141404] = ffeb5445
!	Mem[0000000030181400] = 00001aff, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000100c1408] = 00000000, %l4 = ac00000000000000
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l5 = 00000000c41410f0
	lduwa	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000

p0_label_227:
!	Mem[0000000010081400] = ff000000, %l2 = ffffffffffffffeb
	ldsha	[%i2+%g0]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010181408] = 7c50879f, %l1 = 000000007b0f0000
	ldsha	[%i6+%o4]0x88,%l1	! %l1 = ffffffffffff879f
!	Code Fragment 4
p0_fragment_25:
!	%l0 = 00000000431bbaff
	setx	0x8c9817483798cd31,%g7,%l0 ! %l0 = 8c9817483798cd31
!	%l1 = ffffffffffff879f
	setx	0xe0b03358021b9751,%g7,%l1 ! %l1 = e0b03358021b9751
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8c9817483798cd31
	setx	0x1d32b7af857a22dd,%g7,%l0 ! %l0 = 1d32b7af857a22dd
!	%l1 = e0b03358021b9751
	setx	0x4e62b26ff271fe59,%g7,%l1 ! %l1 = 4e62b26ff271fe59
!	Mem[0000000010001428] = 000000e0 0000ffff, %l4 = 00000000, %l5 = 00000000
	ldd	[%i0+0x028],%l4		! %l4 = 00000000000000e0 000000000000ffff
!	Mem[0000000030141410] = 00000000, %f10 = 59753fd5
	lda	[%i5+%o5]0x89,%f10	! %f10 = 00000000
!	Mem[0000000010101410] = c15c5f2a 9f87507c, %l2 = ffffff00, %l3 = 006800ff
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 00000000c15c5f2a 000000009f87507c
!	Mem[0000000030001400] = ff4f0000, %l0 = 1d32b7af857a22dd
	ldsba	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 7b0f0000431bbaff, %l4 = 00000000000000e0
	ldxa	[%i6+%o5]0x88,%l4	! %l4 = 7b0f0000431bbaff
!	Mem[0000000030041400] = ff000000, %l2 = 00000000c15c5f2a
	lduha	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[00000000100c1410] = c6f3ecaf00000000, %asi = 80
	stxa	%l7,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00000000000000ff

p0_label_228:
!	%f18 = 00000000 00000000, Mem[0000000010141400] = 0000ffff 4554ebff
	stda	%f18,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 00000000
!	Mem[0000000030141400] = ff432491, %l7 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 00000000ff432491
!	%f30 = 00000000 000000ff, %l2 = 0000000000000000
!	Mem[0000000010181430] = c06caef7ffcb0000
	add	%i6,0x030,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_P ! Mem[0000000010181430] = c06caef7ffcb0000
!	Mem[0000000010001410] = 00001a42, %l5 = 000000000000ffff
	lduba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000042
!	%l6 = 0000000000000000, Mem[0000000030101400] = 00680089
	stba	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00680089
!	%l6 = 0000000000000000, Mem[0000000010101408] = ff000000
	stba	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Mem[00000000201c0001] = 00ff3e5d, %l4 = 7b0f0000431bbaff
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 000000ff000000ff
!	%f13 = 43e9efff, Mem[0000000010181400] = 00000000
	sta	%f13,[%i6+%g0]0x88	! Mem[0000000010181400] = 43e9efff
!	Mem[0000000030041410] = 00ffd6a0, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 000000a0000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = c400afec, %l7 = 00000000ff432491
	ldsha	[%i0+%g0]0x88,%l7	! %l7 = ffffffffffffafec

p0_label_229:
!	Mem[0000000010181410] = ffba1b43, %l4 = 00000000000000ff
	lduwa	[%i6+%o5]0x80,%l4	! %l4 = 00000000ffba1b43
!	Mem[0000000030141410] = 00000000, %l3 = 000000009f87507c
	ldsha	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = ffefe943, %l3 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffefe943
!	Mem[00000000300c1400] = 000000ff, %l4 = 00000000ffba1b43
	ldswa	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001400] = ecaf00c4, %l6 = 00000000000000a0
	ldsba	[%i0+%g0]0x80,%l6	! %l6 = ffffffffffffffec
!	Mem[0000000010081400] = ff000000431bbaff, %f24 = a13cbe09 37895445
	ldda	[%i2+%g0]0x80,%f24	! %f24 = ff000000 431bbaff
!	Mem[0000000030001408] = 00000000, %l3 = ffffffffffefe943
	lduha	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l1 = 4e62b26ff271fe59, %l4 = 0000000000000000, %l3 = 0000000000000000
	andn	%l1,%l4,%l3		! %l3 = 4e62b26ff271fe59
!	Starting 10 instruction Store Burst
!	%f27 = 00000000, Mem[00000000100c1414] = 000000ff
	st	%f27,[%i3+0x014]	! Mem[00000000100c1414] = 00000000

p0_label_230:
!	%f24 = ff000000, %f0  = 00000000
	fcmps	%fcc0,%f24,%f0 		! %fcc0 = 1
!	Mem[0000000010041418] = 000000000000f200, %l2 = 0000000000000000, %l5 = 0000000000000042
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 000000000000f200
!	Mem[0000000010141410] = 006800ff, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 00000000006800ff
!	%l6 = ffffffffffffffec, Mem[0000000030181410] = 000014c4
	stba	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 000014ec
!	%f16 = 45548937 00000000 00000000 00000000
!	%f20 = 00000000 006800ff afecffc6 00000000
!	%f24 = ff000000 431bbaff 000000ff 00000000
!	%f28 = 00680089 7b0f00ff 00000000 000000ff
	stda	%f16,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	%l2 = 0000000000000000, Mem[0000000030081410] = c600000000000000
	stxa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	%l4 = 00000000006800ff, Mem[0000000010081408] = ac000000
	stwa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 006800ff
!	Mem[0000000010141400] = 00000000, %l1 = 4e62b26ff271fe59
	ldstuba	[%i5+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = ff1a0000, %l5 = 000000000000f200
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %l3 = 4e62b26ff271fe59
	ldsha	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000

p0_label_231:
!	Mem[0000000030181408] = 00000000, %l6 = ffffffffffffffec
	lduwa	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = ecaf00c4, %l6 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l6	! %l6 = 000000000000ecaf
!	Mem[0000000030081400] = ac000000, %l1 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 00000000000000ac
!	Mem[0000000010041410] = ff000000 0000ffff, %l6 = 0000ecaf, %l7 = ffffafec
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff000000 000000000000ffff
!	Mem[0000000010081410] = ff1410f0, %l6 = 00000000ff000000
	lduwa	[%i2+%o5]0x80,%l6	! %l6 = 00000000ff1410f0
!	Mem[0000000030141400] = 000000ff f01014c4, %l6 = ff1410f0, %l7 = 0000ffff
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000000000ff 00000000f01014c4
!	Mem[0000000030081400] = 000000ac, %f13 = 43e9efff
	lda	[%i2+%g0]0x89,%f13	! %f13 = 000000ac
!	Mem[0000000010081410] = 00000000f01014ff, %f14 = c15c5f2a 9f87507c
	ldda	[%i2+%o5]0x88,%f14	! %f14 = 00000000 f01014ff
!	Mem[0000000030141400] = 000000fff01014c4, %f10 = 00000000 9d3248ff
	ldda	[%i5+%g0]0x81,%f10	! %f10 = 000000ff f01014c4
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 00000000000000ff

p0_label_232:
!	Mem[00000000201c0000] = 00ff3e5d, %l5 = 0000000000000000
	ldstub	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	%f7  = 00000000, Mem[0000000010181400] = 43e9efff
	sta	%f7 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%f0  = 00000000, Mem[00000000300c1408] = 00000000
	sta	%f0 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010141408] = 00000000ffba1b43
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%l4 = 00000000006800ff, Mem[0000000010101408] = 00000000
	stba	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000
!	%f8  = 00000000 38ea007b, Mem[0000000010001420] = a4e7ddff 0000ffff
	stda	%f8 ,[%i0+0x020]%asi	! Mem[0000000010001420] = 00000000 38ea007b
!	%l0 = 0000000000000000, Mem[0000000010041400] = 00000000
	stba	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[000000001008140c] = 00000000, %l3 = 0000000000000000
	swap	[%i2+0x00c],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff3e5d, %l6 = 00000000000000ff
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff

p0_label_233:
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000030101408] = 00000000, %f14 = 00000000
	lda	[%i4+%o4]0x89,%f14	! %f14 = 00000000
!	Mem[0000000010001410] = 421a0000, %l3 = 0000000000000000
	lduba	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000042
!	Mem[0000000030181410] = 000014ec, %l1 = 00000000000000ac
	lduwa	[%i6+%o5]0x89,%l1	! %l1 = 00000000000014ec
!	Mem[0000000030001400] = ff4f0000, %l4 = 00000000006800ff
	lduba	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000000042
	ldsba	[%i3+0x013]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = c41410f0ff0000ff, %f20 = 00000000 006800ff
	ldda	[%i1+%o4]0x89,%f20	! %f20 = c41410f0 ff0000ff
!	Mem[0000000030081408] = ecee36da, %l3 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l3	! %l3 = 000000000000ecee
!	Mem[0000000010001408] = 43e9efff, %l4 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = 0000000043e9efff
!	Mem[0000000030101410] = 00000000 006800ff, %l4 = 43e9efff, %l5 = 00000000
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 00000000006800ff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 000000ff, %l4 = 00000000006800ff
	swapa	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_234:
!	%l3 = 000000000000ecee, Mem[00000000100c1400] = ffffff00
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000ecee
!	%f18 = 00000000 00000000, Mem[0000000010041438] = 48839796 ffefe943
	std	%f18,[%i1+0x038]	! Mem[0000000010041438] = 00000000 00000000
!	Mem[0000000010141418] = 431bbaae, %l6 = 00000000000000ff
	swap	[%i5+0x018],%l6		! %l6 = 00000000431bbaae
!	Mem[0000000030041410] = 00ffd6ff, %l7 = 00000000f01014c4
	swapa	[%i1+%o5]0x89,%l7	! %l7 = 0000000000ffd6ff
!	%l7 = 0000000000ffd6ff, Mem[0000000030081410] = 00000000
	stwa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 00ffd6ff
!	%l0 = 0000000000000000, Mem[0000000030181410] = 000014ec
	stha	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%l6 = 00000000431bbaae, immed = 00000a52, %y  = 000003e4
	udiv	%l6,0xa52,%l2		! %l2 = 000000006088bb2d
	mov	%l0,%y			! %y = 00000000
!	Mem[00000000300c1400] = 000000ff, %l2 = 000000006088bb2d
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030141408] = 000000ff
	stwa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff000000, %l3 = 000000000000ecee
	lduba	[%i1+0x013]%asi,%l3	! %l3 = 0000000000000000

p0_label_235:
!	Mem[0000000030081408] = adcf2b33da36eeec, %f20 = c41410f0 ff0000ff
	ldda	[%i2+%o4]0x89,%f20	! %f20 = adcf2b33 da36eeec
!	Mem[0000000030101400] = 00000000, %l5 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l1 = 00000000000014ec
	ldswa	[%i6+%o4]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010001428] = 000000e0 0000ffff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i0+0x028]%asi,%l2	! %l2 = 00000000000000e0 000000000000ffff
!	Mem[0000000010181408] = 7c50879f, %l0 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = 000000007c50879f
!	Code Fragment 4
p0_fragment_26:
!	%l0 = 000000007c50879f
	setx	0x1b133377cd609579,%g7,%l0 ! %l0 = 1b133377cd609579
!	%l1 = ffffffffff000000
	setx	0x4a03ab27b008931b,%g7,%l1 ! %l1 = 4a03ab27b008931b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1b133377cd609579
	setx	0xc7cdf207fddb4b3e,%g7,%l0 ! %l0 = c7cdf207fddb4b3e
!	%l1 = 4a03ab27b008931b
	setx	0xdda73cf05f58c8d6,%g7,%l1 ! %l1 = dda73cf05f58c8d6
!	Mem[0000000010041410] = ff000000, %l5 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010081408] = 00000000ff006800, %l0 = c7cdf207fddb4b3e
	ldxa	[%i2+%o4]0x88,%l0	! %l0 = 00000000ff006800
!	Mem[00000000300c1408] = ff0000ff00000000, %f10 = 000000ff f01014c4
	ldda	[%i3+%o4]0x89,%f10	! %f10 = ff0000ff 00000000
!	Starting 10 instruction Store Burst
!	%l0 = ff006800, %l1 = 5f58c8d6, Mem[0000000010081400] = 000000ff ffba1b43
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = ff006800 5f58c8d6

p0_label_236:
!	%l1 = dda73cf05f58c8d6, Mem[00000000300c1410] = ffba1b43
	stba	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = d6ba1b43
!	%l5 = ffffffffffffff00, Mem[0000000030081400] = 000000ac
	stwa	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffff00
!	%f9  = 38ea007b, Mem[00000000300c1400] = 6088bb2d
	sta	%f9 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 38ea007b
!	Mem[0000000010181400] = 00000000, %l3 = 000000000000ffff
	ldstuba	[%i6+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = ff000000, %l2 = 00000000000000e0
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%l1 = dda73cf05f58c8d6, Mem[0000000010101422] = 00000000, %asi = 80
	stba	%l1,[%i4+0x022]%asi	! Mem[0000000010101420] = 0000d600
!	Mem[00000000300c1410] = d6ba1b43, %l5 = ffffffffffffff00
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 000000d6000000ff
!	Mem[0000000030101408] = 00000000, %l0 = 00000000ff006800
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[000000001018143f] = f9000000, %l4 = 00000000000000ff
	ldstuba	[%i6+0x03f]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000, %l7 = 0000000000ffd6ff
	lduwa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_237:
!	Mem[0000000030101400] = 00000000, %l6 = 00000000431bbaae
	ldsha	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = ff0000ff, %l7 = 0000000000000000
	ldswa	[%i1+%o4]0x81,%l7	! %l7 = ffffffffff0000ff
!	Mem[0000000010041400] = 00000000, %l7 = ffffffffff0000ff
	ldsba	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 00001aff, %f15 = f01014ff
	lda	[%i6+%g0]0x89,%f15	! %f15 = 00001aff
!	%f2  = ffffffff, %f0  = 00000000
	fsqrts	%f2 ,%f0 		! %f0  = ffffffff
!	Mem[0000000010141410] = 00000000, %l5 = 00000000000000d6
	ldswa	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = ff1410f0, %l4 = 0000000000000000
	ldsha	[%i2+%o5]0x80,%l4	! %l4 = ffffffffffffff14
!	Mem[0000000030141410] = 00000000, %l6 = 0000000000000000
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1418] = 431bbaaec6f3ecaf, %f22 = afecffc6 00000000
	ldd	[%i3+0x018],%f22	! %f22 = 431bbaae c6f3ecaf
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = f01014c4, %l2 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 00000000f01014c4

p0_label_238:
!	%l2 = 00000000f01014c4, Mem[00000000300c1400] = 38ea007b
	stwa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = f01014c4
!	Code Fragment 3
p0_fragment_27:
!	%l0 = 0000000000000000
	setx	0x174a8b77e9b7d3e0,%g7,%l0 ! %l0 = 174a8b77e9b7d3e0
!	%l1 = dda73cf05f58c8d6
	setx	0x36c3c74fb0568d5d,%g7,%l1 ! %l1 = 36c3c74fb0568d5d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 174a8b77e9b7d3e0
	setx	0xd7a774afdadc8c7b,%g7,%l0 ! %l0 = d7a774afdadc8c7b
!	%l1 = 36c3c74fb0568d5d
	setx	0x14788e97a94f5139,%g7,%l1 ! %l1 = 14788e97a94f5139
!	Mem[00000000211c0001] = 10f06880, %l1 = 14788e97a94f5139
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 000000f0000000ff
!	%f27 = 00000000, %f10 = ff0000ff, %f10 = ff0000ff 00000000
	fsmuld	%f27,%f10,%f10		! %f10 = 80000000 00000000
!	%l3 = 0000000000000000, Mem[0000000020800041] = 22c2726d
	stb	%l3,[%o1+0x041]		! Mem[0000000020800040] = 2200726d
!	%l2 = 00000000f01014c4, Mem[0000000010041410] = ff000000
	stwa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = f01014c4
!	Mem[0000000030081410] = 00ffd6ff, %l4 = ffffffffffffff14
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 0000000000ffd6ff
!	Mem[0000000030081410] = 14ffffff, %l2 = 00000000f01014c4
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 0000000014ffffff
!	Mem[0000000010041410] = f01014c4, %l0 = d7a774afdadc8c7b
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 000000f0000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041438] = 0000000000000000, %f28 = 00680089 7b0f00ff
	ldda	[%i1+0x038]%asi,%f28	! %f28 = 00000000 00000000

p0_label_239:
!	Mem[0000000010001408] = ffefe943, %l6 = 0000000000000000
	lduha	[%i0+0x008]%asi,%l6	! %l6 = 000000000000ffef
!	Mem[00000000100c140c] = 000000ac, %l5 = 0000000000000000
	ldswa	[%i3+0x00c]%asi,%l5	! %l5 = 00000000000000ac
!	Mem[0000000010101408] = ff00000000000000, %f6  = ea00b2fd 00000000
	ldda	[%i4+0x008]%asi,%f6 	! %f6  = ff000000 00000000
!	Mem[0000000030141408] = 00000000, %l7 = 0000000000000000
	lduha	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[000000001018141c] = ff3fbf33, %l2 = 0000000014ffffff
	ldswa	[%i6+0x01c]%asi,%l2	! %l2 = ffffffffff3fbf33
!	Mem[0000000010081400] = 006800ff, %l1 = 00000000000000f0
	ldsba	[%i2+0x003]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041408] = ff0000ff, %l6 = 000000000000ffef
	lduha	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001410] = ff0000ff, %l6 = 00000000000000ff
	lduha	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 7b0f0000 431bbaff, %l2 = ff3fbf33, %l3 = 00000000
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 00000000431bbaff 000000007b0f0000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000431bbaff, Mem[0000000030141408] = 00000000
	stba	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000

p0_label_240:
!	%f12 = 4147aace 000000ac, %l4 = 0000000000ffd6ff
!	Mem[0000000030041430] = ff00000089006800
	add	%i1,0x030,%g1
	stda	%f12,[%g1+%l4]ASI_PST32_S ! Mem[0000000030041430] = 4147aace000000ac
!	%f20 = adcf2b33 da36eeec, Mem[0000000010001400] = c400afec ff388be9
	stda	%f20,[%i0+%g0]0x88	! Mem[0000000010001400] = adcf2b33 da36eeec
!	Mem[0000000010101410] = c15c5f2a, %l1 = ffffffffffffffff
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 00000000c15c5f2a
!	%f31 = 000000ff, %f29 = 00000000
	fsqrts	%f31,%f29		! %l0 = 0000000000000112, Unfinished, %fsr = 2a00000400
!	%f8  = 00000000, Mem[0000000010081418] = 431bbaae
	st	%f8 ,[%i2+0x018]	! Mem[0000000010081418] = 00000000
!	%f20 = adcf2b33 da36eeec, Mem[0000000030101400] = 00000000 45548937
	stda	%f20,[%i4+%g0]0x89	! Mem[0000000030101400] = adcf2b33 da36eeec
!	Mem[0000000010141410] = 0000000000000000, %l1 = 00000000c15c5f2a, %l6 = 00000000000000ff
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 0000000000000000
!	%l1 = 00000000c15c5f2a, Mem[0000000020800001] = ffff779a, %asi = 80
	stba	%l1,[%o1+0x001]%asi	! Mem[0000000020800000] = ff2a779a
!	Mem[0000000010181410] = ffba1b43, %l5 = 00000000000000ac
	ldstuba	[%i6+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 9f87507c00000000, %l7 = 0000000000000000
	ldx	[%i6+%o4],%l7		! %l7 = 9f87507c00000000

p0_label_241:
!	Mem[0000000010041410] = c41410ff, %l2 = 00000000431bbaff
	ldsba	[%i1+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	%l6 = 0000000000000000, immed = fffff536, %y  = 00000000
	udiv	%l6,-0xaca,%l2		! %l2 = 0000000000000000
	mov	%l0,%y			! %y = 00000112
!	Mem[0000000030101408] = ff000000 00000000, %l2 = 00000000, %l3 = 7b0f0000
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000030081400] = 00ffffffffefe943, %f4  = 7b0f0000 431bbaff
	ldda	[%i2+%g0]0x81,%f4 	! %f4  = 00ffffff ffefe943
!	Mem[0000000030081410] = c41410f0, %l6 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l6	! %l6 = fffffffffffffff0
!	Code Fragment 3
p0_fragment_28:
!	%l0 = 0000000000000112
	setx	0xe8f1193fc98b485c,%g7,%l0 ! %l0 = e8f1193fc98b485c
!	%l1 = 00000000c15c5f2a
	setx	0x99ca40400f402ae7,%g7,%l1 ! %l1 = 99ca40400f402ae7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e8f1193fc98b485c
	setx	0xbddce900573b2f0b,%g7,%l0 ! %l0 = bddce900573b2f0b
!	%l1 = 99ca40400f402ae7
	setx	0x025f479fae5da5b6,%g7,%l1 ! %l1 = 025f479fae5da5b6
!	Mem[0000000030141410] = 00000000, %l3 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 006800ff, %l5 = 00000000000000ff
	ldswa	[%i2+%g0]0x80,%l5	! %l5 = 00000000006800ff
!	Mem[0000000030181410] = 0000000000000000, %l4 = 0000000000ffd6ff
	ldxa	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 573b2f0b, %l1 = ae5da5b6, Mem[0000000030101400] = ecee36da 332bcfad
	stda	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 573b2f0b ae5da5b6

p0_label_242:
!	%l1 = 025f479fae5da5b6, Mem[0000000010001400] = ecee36da
	stwa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = ae5da5b6
!	%f20 = adcf2b33 da36eeec, %l3 = 0000000000000000
!	Mem[0000000010041438] = 0000000000000000
	add	%i1,0x038,%g1
	stda	%f20,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010041438] = 0000000000000000
!	Mem[00000000100c1420] = 00000000, %l6 = fffffffffffffff0
	swap	[%i3+0x020],%l6		! %l6 = 0000000000000000
!	%f16 = 45548937 00000000 00000000 00000000
!	%f20 = adcf2b33 da36eeec 431bbaae c6f3ecaf
!	%f24 = ff000000 431bbaff 000000ff 00000000
!	%f28 = 00000000 00000000 00000000 000000ff
	stda	%f16,[%i4]ASI_COMMIT_S	! Block Store to 0000000030101400
	membar	#Sync			! Added by membar checker (40)
!	%l0 = 573b2f0b, %l1 = ae5da5b6, Mem[0000000030101410] = 332bcfad ecee36da
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 573b2f0b ae5da5b6
!	%l2 = ff000000, %l3 = 00000000, Mem[0000000010141408] = 00000000 00000000
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000 00000000
!	Mem[0000000030041400] = 000000ff, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041410] = 000000ff, %l5 = 00000000006800ff
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%l1 = 025f479fae5da5b6, Mem[0000000030081410] = f01014c4
	stwa	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = ae5da5b6
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_243:
!	Mem[0000000010001400] = ae5da5b6332bcfad, %l2 = 00000000ff000000
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = ae5da5b6332bcfad
!	Mem[0000000010141410] = 00000000, %f1  = f01014ff
	lda	[%i5+%o5]0x80,%f1 	! %f1 = 00000000
!	Mem[0000000030101410] = 0b2f3b57, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l5	! %l5 = 000000000b2f3b57
!	Mem[0000000030041400] = 000000ac 00000000, %l2 = 332bcfad, %l3 = 000000ff
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000 00000000000000ac
!	Mem[0000000010141428] = 78b7ff9c00000000, %f14 = 00000000 00001aff
	ldda	[%i5+0x028]%asi,%f14	! %f14 = 78b7ff9c 00000000
!	Mem[0000000030081400] = ffffff00, %l7 = 9f87507c00000000
	lduwa	[%i2+%g0]0x89,%l7	! %l7 = 00000000ffffff00
!	Mem[0000000030081410] = b6a55dae, %l0 = bddce900573b2f0b
	lduwa	[%i2+%o5]0x89,%l0	! %l0 = 00000000b6a55dae
!	Mem[00000000100c1424] = 00000000, %l6 = 0000000000000000
	ldsba	[%i3+0x026]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141434] = 89006800, %l3 = 00000000000000ac
	lduw	[%i5+0x034],%l3		! %l3 = 0000000089006800
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = f01014ff, %l5 = 000000000b2f3b57
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 00000000f01014ff

p0_label_244:
!	Mem[000000001000142d] = 0000ffff, %l1 = 025f479fae5da5b6
	ldstuba	[%i0+0x02d]%asi,%l1	! %l1 = 00000000000000ff
!	%f16 = 45548937 00000000 00000000 00000000
!	%f20 = adcf2b33 da36eeec 431bbaae c6f3ecaf
!	%f24 = ff000000 431bbaff 000000ff 00000000
!	%f28 = 00000000 00000000 00000000 000000ff
	stda	%f16,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	%l1 = 0000000000000000, Mem[0000000010041438] = 0000000000000000, %asi = 80
	stxa	%l1,[%i1+0x038]%asi	! Mem[0000000010041438] = 0000000000000000
!	%f10 = 80000000, %f8  = 00000000, %f7  = 00000000
	fadds	%f10,%f8 ,%f7 		! %f7  = 00000000
!	%l5 = 00000000f01014ff, Mem[0000000010041408] = ff0000ff
	stwa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = f01014ff
!	%f12 = 4147aace 000000ac, Mem[0000000010001408] = 43e9efff 00000000
	stda	%f12,[%i0+%o4]0x88	! Mem[0000000010001408] = 4147aace 000000ac
!	%l0 = 00000000b6a55dae, Mem[0000000010181400] = ff000000
	stba	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = ae000000
!	%f2  = ffffffff ac000000, %l3 = 0000000089006800
!	Mem[00000000300c1438] = 7c50879f2a5f5cc1
	add	%i3,0x038,%g1
	stda	%f2,[%g1+%l3]ASI_PST16_SL ! Mem[00000000300c1438] = 7c50879f2a5f5cc1
!	%l4 = 0000000000000000, Mem[0000000030181400] = ff1a0000
	stha	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 89006800c6de9dcb, %f8  = 00000000 38ea007b
	ldda	[%i4+%g0]0x80,%f8 	! %f8  = 89006800 c6de9dcb

p0_label_245:
!	Mem[0000000030181400] = 00000000, %l7 = 00000000ffffff00
	lduha	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = 00004fff, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l7	! %l7 = 0000000000004fff
!	Mem[0000000010101408] = ff00000000000000, %l5 = 00000000f01014ff
	ldxa	[%i4+0x008]%asi,%l5	! %l5 = ff00000000000000
!	Mem[000000001004143c] = 00000000, %l6 = 0000000000000000
	ldsh	[%i1+0x03e],%l6		! %l6 = 0000000000000000
!	Mem[0000000030001410] = ff0000ff, %l6 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000030101408] = 00000000, %f0  = ffffffff
	lda	[%i4+%o4]0x81,%f0 	! %f0 = 00000000
!	Mem[0000000010081408] = 006800ff, %l4 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = 00000000006800ff
!	Mem[0000000010001400] = b6a55dae, %l6 = 000000000000ff00
	lduba	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ae
!	Mem[0000000010141410] = 00000000, %l7 = 0000000000004fff
	lduwa	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 000000ae, %l7 = 00000000, Mem[0000000030101410] = 573b2f0b ae5da5b6
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ae 00000000

p0_label_246:
!	%l4 = 006800ff, %l5 = 00000000, Mem[0000000030101410] = 000000ae 00000000
	stda	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 006800ff 00000000
!	Mem[0000000030181400] = 00000000, %f8  = 89006800
	lda	[%i6+%g0]0x81,%f8 	! %f8 = 00000000
!	Mem[0000000010081400] = 006800ff, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000006800ff
!	%l0 = 00000000b6a55dae, Mem[0000000010041400] = 00f2000000000000
	stxa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000b6a55dae
!	%l0 = 00000000b6a55dae, Mem[0000000010101410] = ffffffff9f87507c
	stxa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000b6a55dae
!	Mem[0000000010101438] = ffffff00, %l2 = 00000000006800ff, %asi = 80
	swapa	[%i4+0x038]%asi,%l2	! %l2 = 00000000ffffff00
	membar	#Sync			! Added by membar checker (41)
!	%l5 = ff00000000000000, Mem[00000000100c1410] = adcf2b33
	stba	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00cf2b33
!	Mem[000000001004140d] = 431bbaff, %l7 = 0000000000000000
	ldstuba	[%i1+0x00d]%asi,%l7	! %l7 = 0000001b000000ff
!	%l5 = ff00000000000000, Mem[00000000201c0000] = ffff3e5d, %asi = 80
	stba	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff3e5d
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = 0000000038ea007b, %f30 = 00000000 000000ff
	ldda	[%i0+0x020]%asi,%f30	! %f30 = 00000000 38ea007b

p0_label_247:
!	Mem[0000000010081414] = 00000000, %l1 = 0000000000000000
	ldswa	[%i2+0x014]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181414] = 00000f7b, %l2 = 00000000ffffff00
	ldsba	[%i6+0x015]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 00000000 00000000, %l2 = 00000000, %l3 = 89006800
	ldda	[%i3+0x008]%asi,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[00000000100c1400] = 37895445, %l3 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000045
!	Mem[0000000010141400] = 006800ff, %l5 = ff00000000000000
	ldsba	[%i5+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081400] = 00000000 d6c8585f, %l2 = 00000000, %l3 = 00000045
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000 00000000d6c8585f
!	Mem[0000000030001410] = 00000000ff0000ff, %f28 = 00000000 00000000
	ldda	[%i0+%o5]0x89,%f28	! %f28 = 00000000 ff0000ff
!	Mem[0000000010141400] = 006800ff, %l1 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 00000000006800ff
!	Mem[0000000030081408] = da36eeec, %l1 = 00000000006800ff
	ldsha	[%i2+%o4]0x89,%l1	! %l1 = ffffffffffffeeec
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 006800ff, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 000000ff000000ff

p0_label_248:
!	Mem[0000000010101438] = 006800ff, %l4 = 006800ff, %l2 = 000000ff
	add	%i4,0x38,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000006800ff
!	%f0  = 00000000 00000000, %l4 = 00000000006800ff
!	Mem[0000000030001418] = 89a568315c11a999
	add	%i0,0x018,%g1
	stda	%f0,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030001418] = 0000000000000000
!	Mem[0000000010041408] = ff1410f0, %l0 = b6a55dae, %l3 = d6c8585f
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 00000000ff1410f0
!	%l5 = ffffffffffffffff, %l1 = ffffffffffffeeec, %l5 = ffffffffffffffff
	andn	%l5,%l1,%l5		! %l5 = 0000000000001113
!	%f0  = 00000000, Mem[0000000010041410] = c41410ff
	sta	%f0 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l2 = 00000000006800ff, Mem[0000000010181400] = 000000ae
	stha	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	Mem[0000000030101408] = 00000000, %l7 = 000000000000001b
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Code Fragment 4
p0_fragment_29:
!	%l0 = 00000000b6a55dae
	setx	0xb33f0a97aa2aaa69,%g7,%l0 ! %l0 = b33f0a97aa2aaa69
!	%l1 = ffffffffffffeeec
	setx	0x47010a77f93ec595,%g7,%l1 ! %l1 = 47010a77f93ec595
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b33f0a97aa2aaa69
	setx	0xf9b5b968142f3a25,%g7,%l0 ! %l0 = f9b5b968142f3a25
!	%l1 = 47010a77f93ec595
	setx	0x32d6e5d06d731e64,%g7,%l1 ! %l1 = 32d6e5d06d731e64
!	Mem[0000000030001410] = ff0000ff, %l6 = 00000000000000ae
	ldstuba	[%i0+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffba1b43, %l0 = f9b5b968142f3a25
	lduha	[%i3+%o5]0x81,%l0	! %l0 = 000000000000ffba

p0_label_249:
!	Mem[00000000300c1400] = c41410f0, %l0 = 000000000000ffba
	lduha	[%i3+%g0]0x81,%l0	! %l0 = 000000000000c414
!	Mem[000000001010141c] = ff000f7b, %l7 = 0000000000000000
	lduwa	[%i4+0x01c]%asi,%l7	! %l7 = 00000000ff000f7b
!	Mem[00000000100c1408] = 00000000, %l3 = 00000000ff1410f0
	ldsha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Randomly selected nop
	nop
!	Mem[0000000030181408] = 000000ff, %l1 = 32d6e5d06d731e64
	ldsha	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 9f87507c, %l3 = 0000000000000000
	lduha	[%i6+%o4]0x80,%l3	! %l3 = 0000000000009f87
!	%l5 = 0000000000001113, imm = 0000000000000bfc, %l5 = 0000000000001113
	add	%l5,0xbfc,%l5		! %l5 = 0000000000001d0f
!	Mem[0000000030081400] = ffffff00, %l3 = 0000000000009f87
	lduba	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ff000f7b, Mem[00000000218001c1] = 00ffa57a
	stb	%l7,[%o3+0x1c1]		! Mem[00000000218001c0] = 007ba57a

p0_label_250:
!	Mem[0000000030101410] = ff006800, %l1 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l4 = 00000000006800ff, Mem[0000000010041438] = 00000000
	stw	%l4,[%i1+0x038]		! Mem[0000000010041438] = 006800ff
!	%f1  = 00000000, Mem[0000000030181410] = 00000000
	sta	%f1 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	Mem[0000000010001400] = ae5da5b6, %l1 = 00000000000000ff
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ae5da5b6
!	%l3 = 0000000000000000, Mem[0000000010081410] = 573b2f0b00000000
	stxa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000000
!	Mem[0000000030081408] = ecee36da, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 000000ec000000ff
!	Mem[00000000300c1410] = ffba1b43, %l0 = 000000000000c414
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = 37895445
	stba	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 378954ff
!	%l0 = 000000ff, %l1 = ae5da5b6, Mem[00000000300c1400] = c41410f0 000000ac
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff ae5da5b6
!	Starting 10 instruction Load Burst
!	Mem[0000000010041434] = ff38def8, %l4 = 00000000006800ff
	ldsba	[%i1+0x035]%asi,%l4	! %l4 = 0000000000000038

p0_label_251:
!	Mem[0000000010041400] = ae5da5b6, %l7 = 00000000ff000f7b
	ldswa	[%i1+%g0]0x80,%l7	! %l7 = ffffffffae5da5b6
!	Mem[000000001008143c] = ff0000d4, %l7 = ffffffffae5da5b6
	lduw	[%i2+0x03c],%l7		! %l7 = 00000000ff0000d4
!	Mem[0000000030081410] = b6a55dae, %l7 = 00000000ff0000d4
	ldsba	[%i2+%o5]0x89,%l7	! %l7 = ffffffffffffffae
!	Mem[0000000010041408] = ff1410f043ffbaff, %l4 = 0000000000000038
	ldxa	[%i1+%o4]0x80,%l4	! %l4 = ff1410f043ffbaff
!	Mem[0000000030001410] = ff0000ff, %l1 = 00000000ae5da5b6
	lduwa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ff0000ff
!	%f2  = ffffffff, %f12 = 4147aace
	fcmps	%fcc2,%f2 ,%f12		! %fcc2 = 3
!	Mem[00000000100c1400] = ff548937, %l4 = ff1410f043ffbaff
	ldsha	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffff54
!	Mem[0000000030141408] = ff000000, %l2 = 00000000006800ff
	ldsha	[%i5+%o4]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[00000000100c1400] = 378954ff, %f15 = 00000000
	lda	[%i3+%g0]0x88,%f15	! %f15 = 378954ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 00000000, %l7 = ffffffffffffffae
	lduba	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_252:
!	%f16 = 45548937 00000000 00000000 00000000
!	%f20 = adcf2b33 da36eeec 431bbaae c6f3ecaf
!	%f24 = ff000000 431bbaff 000000ff 00000000
!	%f28 = 00000000 ff0000ff 00000000 38ea007b
	stda	%f16,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
!	Mem[0000000010141410] = 00000000, %l1 = 00000000ff0000ff
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181400] = 000000ff, %l0 = 00000000000000ff
	ldstuba	[%i6+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030101408] = 0000001b, %l4 = ffffffffffffff54
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 000000000000001b
!	Mem[00000000300c1408] = 00000000, %l3 = 00000000000000ec
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%f11 = 00000000, Mem[0000000030041410] = 006800ff
	sta	%f11,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l7 = 0000000000000000, Mem[0000000010101434] = 00000000
	stw	%l7,[%i4+0x034]		! Mem[0000000010101434] = 00000000
!	%l7 = 0000000000000000, imm = 0000000000000819, %l0 = 00000000000000ff
	or	%l7,0x819,%l0		! %l0 = 0000000000000819
!	%f4  = 00ffffff, Mem[0000000010141400] = ff006800
	sta	%f4 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 00ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 9f87507c, %f13 = 000000ac
	lda	[%i6+%o4]0x80,%f13	! %f13 = 9f87507c

p0_label_253:
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000010081430] = ff0000ff, %l0 = 0000000000000819
	ldsba	[%i2+0x032]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = ff0000ff 00000000, %l2 = ffffff00, %l3 = 00000000
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 00000000ff0000ff 0000000000000000
!	Mem[0000000030141410] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141418] = 000000ffc6ffecaf, %l0 = 0000000000000000
	ldx	[%i5+0x018],%l0		! %l0 = 000000ffc6ffecaf
!	Mem[0000000010141410] = ff000000, %l6 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l6	! %l6 = ffffffffff000000
!	Mem[000000001004143c] = 00000000, %l7 = 0000000000000000
	ldsba	[%i1+0x03e]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = ffffff00, %f30 = 00000000
	lda	[%i2+%g0]0x89,%f30	! %f30 = ffffff00
!	Mem[0000000010001420] = 0000000038ea007b, %l0 = 000000ffc6ffecaf
	ldxa	[%i0+0x020]%asi,%l0	! %l0 = 0000000038ea007b
!	Starting 10 instruction Store Burst
!	%f17 = 00000000, %f19 = 00000000, %f12 = 4147aace 9f87507c
	fsmuld	%f17,%f19,%f12		! %f12 = 00000000 00000000

p0_label_254:
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%f2  = ffffffff, Mem[0000000010041400] = b6a55dae
	sta	%f2 ,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffff
!	%l2 = 00000000ff0000ff, Mem[0000000030041408] = ff0000ff
	stwa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = ff0000ff
!	%f24 = ff000000 431bbaff, %l0 = 0000000038ea007b
!	Mem[0000000030141410] = 0000000000000000
	add	%i5,0x010,%g1
	stda	%f24,[%g1+%l0]ASI_PST8_S ! Mem[0000000030141410] = 000000004300baff
!	%l0 = 0000000038ea007b, Mem[0000000010041410] = 00000000
	stwa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 38ea007b
!	Mem[0000000010141400] = ffffff00, %l2 = 00000000ff0000ff
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 00000000ffffff00
!	%f6  = ff000000 00000000, %l2 = 00000000ffffff00
!	Mem[0000000030101400] = 4554893700000000
	stda	%f6,[%i4+%l2]ASI_PST32_SL ! Mem[0000000030101400] = 4554893700000000
!	%l0 = 38ea007b, %l1 = 00000000, Mem[0000000010101418] = 0000ffff ff000f7b
	stda	%l0,[%i4+0x018]%asi	! Mem[0000000010101418] = 38ea007b 00000000
!	%l1 = 0000000000000000, Mem[0000000010141408] = 000000ff00000000
	stxa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffffff54, %l3 = 0000000000000000
	lduba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000054

p0_label_255:
!	Mem[0000000010181410] = ffba1b43, %l3 = 0000000000000054
	lduba	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141410] = ffba004300000000, %l0 = 0000000038ea007b
	ldxa	[%i5+%o5]0x89,%l0	! %l0 = ffba004300000000
!	%l7 = 0000000000000000, imm = 0000000000000e59, %l6 = ffffffffff000000
	addc	%l7,0xe59,%l6		! %l6 = 0000000000000e59
!	Mem[0000000010101408] = 000000ff, %l5 = 0000000000001d0f
	ldsha	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101424] = 00000000, %l6 = 0000000000000e59
	ldsba	[%i4+0x025]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[000000001018143c] = f90000ff, %l6 = 0000000000000000
	lduh	[%i6+0x03e],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010041408] = ff1410f0, %l3 = 00000000000000ff
	ldsba	[%i1+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081410] = b6a55dae, %l3 = ffffffffffffffff
	ldswa	[%i2+%o5]0x89,%l3	! %l3 = ffffffffb6a55dae
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000030081408] = da36eeff
	stba	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = da36eeff

p0_label_256:
!	%l2 = ffffff00, %l3 = b6a55dae, Mem[0000000010041400] = ffffffff 00000000
	stda	%l2,[%i1+0x000]%asi	! Mem[0000000010041400] = ffffff00 b6a55dae
!	%l1 = 0000000000000000, Mem[00000000100c1420] = ff000000431bbaff, %asi = 80
	stxa	%l1,[%i3+0x020]%asi	! Mem[00000000100c1420] = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l2 = 00000000ffffff00
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = da36eeec, %l3 = ffffffffb6a55dae
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 000000ec000000ff
!	Mem[0000000030001410] = ff0000ff, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000020800001] = ff2a779a, %l6 = 00000000000000ff
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 0000002a000000ff
!	Mem[00000000300c1410] = 431bbaff, %l3 = 00000000000000ec
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c1410] = 332bcf00, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000332bcf00
!	%l4 = 0000001b, %l5 = 00000000, Mem[0000000010181400] = 000000ff 00000000
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000001b 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = ff000000, %l3 = 00000000000000ff
	lduba	[%i5+0x03a]%asi,%l3	! %l3 = 0000000000000000

p0_label_257:
!	Mem[0000000030041410] = 0000000000000000, %l6 = 000000000000002a
	ldxa	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = 0000001b, %l2 = 00000000000000ff
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 000000000000001b
!	Mem[0000000010101410] = 00000000, %l6 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = ff0000ff00000000, %l5 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = ff0000ff00000000
!	Mem[0000000010101400] = 89006800, %l2 = 000000000000001b
	ldsha	[%i4+%g0]0x80,%l2	! %l2 = ffffffffffff8900
!	Mem[0000000020800040] = 2200726d, %l6 = 0000000000000000
	ldsba	[%o1+0x041]%asi,%l6	! %l6 = 0000000000000000
!	Mem[000000001014143c] = ff0000d4, %l7 = 0000000000000000
	lduba	[%i5+0x03e]%asi,%l7	! %l7 = 0000000000000000
!	%l1 = 00000000332bcf00, imm = fffffffffffff726, %l6 = 0000000000000000
	orn	%l1,-0x8da,%l6		! %l6 = 00000000332bcfd9
!	Mem[0000000030181408] = ff000000ff000000, %l1 = 00000000332bcf00
	ldxa	[%i6+%o4]0x81,%l1	! %l1 = ff000000ff000000
!	Starting 10 instruction Store Burst
!	%l0 = ffba004300000000, Mem[00000000100c1400] = 00000000378954ff
	stxa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffba004300000000

p0_label_258:
!	Code Fragment 4
p0_fragment_30:
!	%l0 = ffba004300000000
	setx	0x4e4e33278dd28b95,%g7,%l0 ! %l0 = 4e4e33278dd28b95
!	%l1 = ff000000ff000000
	setx	0xf320ac683e0334d6,%g7,%l1 ! %l1 = f320ac683e0334d6
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4e4e33278dd28b95
	setx	0x3669123fda907287,%g7,%l0 ! %l0 = 3669123fda907287
!	%l1 = f320ac683e0334d6
	setx	0x5c4db517d1c9d58b,%g7,%l1 ! %l1 = 5c4db517d1c9d58b
!	%l6 = 00000000332bcfd9, Mem[0000000030081410] = b6a55dae
	stwa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 332bcfd9
!	%l4 = 000000000000001b, Mem[0000000030001408] = 3789544500000000
	stxa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000000000001b
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l6 = 332bcfd9, %l7 = 00000000, Mem[0000000010041410] = 7b00ea38 0000ffff
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 332bcfd9 00000000
!	Mem[0000000030181408] = 000000ff, %l1 = 5c4db517d1c9d58b
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%f10 = 80000000 00000000, %l4 = 000000000000001b
!	Mem[0000000010041420] = fdb20acc0000ffff
	add	%i1,0x020,%g1
	stda	%f10,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010041420] = 0000000000000080
!	%l2 = ffff8900, %l3 = 00000000, Mem[0000000010101410] = 00000000 ae5da5b6
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = ffff8900 00000000
!	Mem[00000000100c140c] = 00000000, %l5 = ff0000ff00000000, %asi = 80
	swapa	[%i3+0x00c]%asi,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %f20 = adcf2b33
	lda	[%i2+%o4]0x80,%f20	! %f20 = 00000000

p0_label_259:
!	Mem[0000000010101420] = 0000d600 00000000, %l6 = 332bcfd9, %l7 = 00000000
	ldda	[%i4+0x020]%asi,%l6	! %l6 = 000000000000d600 0000000000000000
!	Mem[0000000010101410] = ffff8900, %l7 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l7	! %l7 = 00000000ffff8900
!	Mem[0000000010081410] = ffee36da, %f31 = 38ea007b
	lda	[%i2+%o5]0x80,%f31	! %f31 = ffee36da
!	Mem[00000000300c1410] = 431bbaff, %l4 = 000000000000001b
	lduba	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101410] = ff006800, %l5 = 0000000000000000
	ldsha	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[00000000300c1400] = ff000000, %l2 = ffffffffffff8900
	ldsha	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 4147aace000000ac, %l0 = 3669123fda907287
	ldxa	[%i0+%o4]0x88,%l0	! %l0 = 4147aace000000ac
!	Mem[0000000010101408] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000020800000] = ffff779a, %l2 = ffffffffffffffff
	ldub	[%o1+%g0],%l2		! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 0000001b, %l7 = 00000000ffff8900
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 000000000000001b

p0_label_260:
!	%f4  = 00ffffff, Mem[00000000300c1408] = ec000000
	sta	%f4 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ffffff
!	%f12 = 00000000 00000000, %l4 = 00000000000000ff
!	Mem[0000000030181400] = 0000000000000000
	stda	%f12,[%i6+%l4]ASI_PST32_SL ! Mem[0000000030181400] = 0000000000000000
!	Mem[000000001018143c] = f90000ff, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x03c]%asi,%l2	! %l2 = 00000000f90000ff
!	%l5 = ffffffffffffff00, Mem[0000000010041400] = ae5da5b600ffffff
	stxa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffffffffff00
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181434] = ffcb0000, %l5 = ffffffffffffff00
	swap	[%i6+0x034],%l5		! %l5 = 00000000ffcb0000
!	Mem[0000000030101400] = 45548937, %l4 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 0000000045548937
!	%l3 = 0000000000000000, Mem[0000000010001422] = 00000000
	stb	%l3,[%i0+0x022]		! Mem[0000000010001420] = 00000000
!	%l5 = 00000000ffcb0000, Mem[00000000100c1428] = 000000ff
	sth	%l5,[%i3+0x028]		! Mem[00000000100c1428] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff000000, %l4 = 0000000045548937
	lduba	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_261:
!	Mem[0000000030001410] = ff0000ff00000000, %f16 = 45548937 00000000
	ldda	[%i0+%o5]0x81,%f16	! %f16 = ff0000ff 00000000
!	Mem[0000000010001408] = 000000ac, %l0 = 4147aace000000ac
	ldsba	[%i0+%o4]0x88,%l0	! %l0 = ffffffffffffffac
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001428] = 000000e0, %l5 = 00000000ffcb0000
	lduha	[%i0+0x028]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = 00004fff, %f26 = 000000ff
	lda	[%i0+%g0]0x81,%f26	! %f26 = 00004fff
!	Mem[0000000010101410] = ffff8900, %l0 = ffffffffffffffac
	ldswa	[%i4+%o5]0x88,%l0	! %l0 = ffffffffffff8900
!	Mem[0000000030181410] = 00000000, %f2  = ffffffff
	lda	[%i6+%o5]0x89,%f2 	! %f2 = 00000000
!	Mem[0000000030141408] = 000000ff, %l1 = 00000000000000ff
	lduba	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141410] = ffffff00, %l7 = 000000000000001b
	ldsha	[%i5+%o5]0x89,%l7	! %l7 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l2 = f90000ff, %l3 = 00000000, Mem[0000000010041410] = d9cf2b33 00000000
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = f90000ff 00000000

p0_label_262:
!	%l1 = 00000000000000ff, Mem[0000000030141400] = ff000000
	stba	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = ff0000ff
!	%f25 = 431bbaff, Mem[00000000300c1400] = ff000000
	sta	%f25,[%i3+%g0]0x89	! Mem[00000000300c1400] = 431bbaff
!	%l0 = ffffffffffff8900, Mem[00000000100c1408] = 00000000
	stba	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l2 = 00000000f90000ff, Mem[0000000010001408] = ac000000
	stha	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00ff0000
!	Mem[0000000030181410] = 00000000, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%l0 = ffffffffffff8900, Mem[00000000100c1408] = 00000000
	stwa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffff8900
!	%l5 = 0000000000000000, Mem[0000000030081400] = ffffff00
	stba	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffff00
!	%f28 = 00000000, Mem[00000000100c1408] = ffff8900
	sta	%f28,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%f18 = 00000000 00000000, %l0 = ffffffffffff8900
!	Mem[0000000010141400] = ff0000ff00000000
	stda	%f18,[%i5+%l0]ASI_PST32_P ! Mem[0000000010141400] = ff0000ff00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 7b0f0000431bbaff, %l2 = 00000000f90000ff
	ldxa	[%i6+%o5]0x88,%l2	! %l2 = 7b0f0000431bbaff

p0_label_263:
!	Mem[0000000010141408] = 0000000000000000, %f22 = 431bbaae c6f3ecaf
	ldda	[%i5+%o4]0x80,%f22	! %f22 = 00000000 00000000
!	Mem[0000000010181400] = 0089ffff 00000000, %l4 = 00000000, %l5 = 00000000
	ldd	[%i6+%g0],%l4		! %l4 = 000000000089ffff 0000000000000000
!	Mem[0000000010041400] = 00ffffff ffffffff, %l6 = 0000d600, %l7 = ffffff00
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 0000000000ffffff 00000000ffffffff
!	Mem[0000000030141400] = ff0000fff01014c4, %l1 = 00000000000000ff
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = ff0000fff01014c4
!	%l3 = 0000000000000000, imm = 000000000000096a, %l1 = ff0000fff01014c4
	andn	%l3,0x96a,%l1		! %l1 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l5 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010081418] = afecf3c6, %f5  = ffefe943
	ld	[%i2+0x018],%f5 	! %f5 = afecf3c6
!	%l4 = 000000000089ffff, %l7 = 00000000ffffffff, %y  = 00000112
	sdiv	%l4,%l7,%l4		! %l4 = ffffffff80000000
	mov	%l0,%y			! %y = ffff8900
!	Mem[0000000010141408] = 00000000, %l4 = ffffffff80000000
	ldswa	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f15 = 378954ff, Mem[0000000010041434] = ff38def8
	sta	%f15,[%i1+0x034]%asi	! Mem[0000000010041434] = 378954ff

p0_label_264:
!	%f2  = 00000000 ac000000, Mem[0000000010081400] = 00000000 45548937
	stda	%f2 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 ac000000
!	%l4 = 0000000000000000, Mem[00000000300c1408] = 00ffffffff0000ff
	stxa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	Mem[0000000010001410] = 00001a42, %l6 = 0000000000ffffff
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 00000042000000ff
!	%f21 = da36eeec, Mem[0000000010101438] = 000000ff
	sta	%f21,[%i4+0x038]%asi	! Mem[0000000010101438] = da36eeec
!	%l1 = 0000000000000000, Mem[0000000030141410] = 00ffffff4300baff
	stxa	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l2 = 7b0f0000431bbaff
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%f10 = 80000000 00000000, %l7 = 00000000ffffffff
!	Mem[00000000100c1410] = ff000000da36eeec
	add	%i3,0x010,%g1
	stda	%f10,[%g1+%l7]ASI_PST16_PL ! Mem[00000000100c1410] = 0000000000000080
!	%l2 = 0000000000000000, Mem[0000000030041410] = 00000000
	stha	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%f28 = 00000000 ff0000ff, Mem[0000000010081400] = ac000000 00000000
	stda	%f28,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff006800, %f6  = ff000000
	lda	[%i4+%o5]0x81,%f6 	! %f6 = ff006800

p0_label_265:
!	Mem[0000000010101410] = ffff8900, %l7 = 00000000ffffffff
	lduwa	[%i4+%o5]0x88,%l7	! %l7 = 00000000ffff8900
!	Mem[0000000010141400] = ff0000ff00000000, %l5 = 00000000ff000000
	ldxa	[%i5+0x000]%asi,%l5	! %l5 = ff0000ff00000000
!	Mem[0000000030081400] = ffffff00, %l2 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010001410] = ff1a0000, %f29 = ff0000ff
	lda	[%i0+%o5]0x80,%f29	! %f29 = ff1a0000
!	Mem[000000001014141c] = c6ffecaf, %l1 = 0000000000000000
	lduw	[%i5+0x01c],%l1		! %l1 = 00000000c6ffecaf
!	Mem[0000000030001410] = ff0000ff00000000, %f20 = 00000000 da36eeec
	ldda	[%i0+%o5]0x81,%f20	! %f20 = ff0000ff 00000000
!	Mem[0000000030041408] = ff0000ff, %l7 = 00000000ffff8900
	lduba	[%i1+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = ff000000, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030041408] = ff0000ff, %l3 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l3	! %l3 = 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010041408] = ff1410f043ffbaff
	stxa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000000000ff

p0_label_266:
!	%l5 = ff0000ff00000000, Mem[00000000100c1410] = 00000000
	stwa	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%f22 = 00000000 00000000, Mem[0000000010181400] = 0089ffff 00000000
	stda	%f22,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 00000000
!	Mem[0000000010001420] = 00000000, %l0 = ffffffffffff8900
	swap	[%i0+0x020],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181410] = 431bbaff, %l2 = ffffffffffffff00
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 00000000431bbaff
!	Mem[000000001000143c] = a13c0000, %l2 = 00000000431bbaff, %asi = 80
	swapa	[%i0+0x03c]%asi,%l2	! %l2 = 00000000a13c0000
!	%l3 = 00000000ff0000ff, Mem[0000000010181400] = 00000000
	stwa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = ff0000ff
!	%f16 = ff0000ff 00000000 00000000 00000000
!	%f20 = ff0000ff 00000000 00000000 00000000
!	%f24 = ff000000 431bbaff 00004fff 00000000
!	%f28 = 00000000 ff1a0000 ffffff00 ffee36da
	stda	%f16,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	Mem[0000000030141410] = ffba1b43, %l5 = ff0000ff00000000
	ldstuba	[%i5+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%f13 = 00000000, Mem[0000000010041410] = ff0000f9
	sta	%f13,[%i1+0x010]%asi	! Mem[0000000010041410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 000000ff, %l2 = 00000000a13c0000
	lduha	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff

p0_label_267:
!	Mem[0000000010081410] = adcf2b33 da36eeff, %l2 = 000000ff, %l3 = ff0000ff
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000da36eeff 00000000adcf2b33
!	Mem[00000000300c1400] = ffba1b43, %l1 = 00000000c6ffecaf
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041430] = 00ff48ff, %l2 = 00000000da36eeff
	ldub	[%i1+0x033],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030081400] = ffffff00, %l5 = 00000000000000ff
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001420] = ffff890038ea007b, %f4  = 00ffffff afecf3c6
	ldda	[%i0+0x020]%asi,%f4 	! %f4  = ffff8900 38ea007b
!	Mem[0000000030081410] = d9cf2b3300000000, %l3 = 00000000adcf2b33
	ldxa	[%i2+%o5]0x81,%l3	! %l3 = d9cf2b3300000000
!	Mem[0000000030101408] = 54ffffff 00000000, %l4 = ff000000, %l5 = 00000000
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 0000000054ffffff 0000000000000000
!	Mem[0000000010141428] = 78b7ff9c, %l0 = 0000000000000000
	lduba	[%i5+0x029]%asi,%l0	! %l0 = 00000000000000b7
!	Mem[0000000030041410] = 00000000, %l1 = ffffffffffffffff
	ldsba	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 00000000, %l2 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000

p0_label_268:
!	%l4 = 54ffffff, %l5 = 00000000, Mem[00000000300c1408] = 00000000 00000000
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 54ffffff 00000000
!	%l4 = 54ffffff, %l5 = 00000000, Mem[0000000010181410] = 00ffffff 00000f7b
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 54ffffff 00000000
!	Mem[0000000010181420] = 00000000, %l6 = 0000000000000042
	ldstuba	[%i6+0x020]%asi,%l6	! %l6 = 00000000000000ff
!	Code Fragment 4
p0_fragment_31:
!	%l0 = 00000000000000b7
	setx	0xfb229a887672851a,%g7,%l0 ! %l0 = fb229a887672851a
!	%l1 = 0000000000000000
	setx	0x9e3764c058681b6f,%g7,%l1 ! %l1 = 9e3764c058681b6f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fb229a887672851a
	setx	0x4d56c74808dd6a96,%g7,%l0 ! %l0 = 4d56c74808dd6a96
!	%l1 = 9e3764c058681b6f
	setx	0xd869b6af9abc6288,%g7,%l1 ! %l1 = d869b6af9abc6288
!	Mem[000000001004141a] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i1+0x01a]%asi,%l6	! %l6 = 00000000000000ff
!	%l4 = 0000000054ffffff, Mem[0000000030041400] = 00000000
	stha	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = ffff0000
!	Mem[000000001004140b] = 00000000, %l1 = d869b6af9abc6288
	ldstuba	[%i1+0x00b]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141430] = ff000f7b, %l2 = 0000000000000000
	swap	[%i5+0x030],%l2		! %l2 = 00000000ff000f7b
!	Mem[0000000030081408] = ffee36da, %l4 = 0000000054ffffff
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff0000ff, %l1 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffff00

p0_label_269:
!	Mem[0000000010001408] = 00ff0000, %l0 = 4d56c74808dd6a96
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000010101410] = ff0000ff 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 00000000ff0000ff 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = ff0000fff01014c4, %l1 = ffffffffffffff00
	ldxa	[%i1+%o4]0x81,%l1	! %l1 = ff0000fff01014c4
!	Mem[0000000010081408] = 00000000, %l1 = ff0000fff01014c4
	lduha	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = ff0000ff, %l2 = 00000000ff000f7b
	ldsba	[%i5+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081410] = d9cf2b3300000000, %f28 = 00000000 ff1a0000
	ldda	[%i2+%o5]0x81,%f28	! %f28 = d9cf2b33 00000000
!	Mem[0000000010141410] = 000000ff, %l2 = ffffffffffffffff
	ldsha	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = 00000000 431bbaff, %l4 = ff0000ff, %l5 = 00000000
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 00000000431bbaff 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010001408] = 0000ff00
	stba	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000ff00

p0_label_270:
!	%f14 = 78b7ff9c, Mem[0000000010081404] = 00000000
	sta	%f14,[%i2+0x004]%asi	! Mem[0000000010081404] = 78b7ff9c
!	%l0 = 0000000000000000, Mem[00000000211c0000] = 10ff6880, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00006880
!	%f22 = 00000000 00000000, Mem[0000000010081400] = ff0000ff 78b7ff9c
	std	%f22,[%i2+%g0]	! Mem[0000000010081400] = 00000000 00000000
!	Mem[0000000010041400] = 00ffffff, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%f23 = 00000000, Mem[0000000030041400] = ffff0000
	sta	%f23,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%l3 = d9cf2b3300000000, Mem[0000000010141408] = 00000000
	stha	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010081408] = 00000000 00000000
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 00000000
!	%l3 = d9cf2b3300000000, Mem[00000000300c1408] = ffffff54
	stwa	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000010181430] = c06caef7ffffff00, %l2 = 00000000000000ff, %l5 = 0000000000000000
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = c06caef7ffffff00
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff000000ffffffff, %f18 = 00000000 00000000
	ldda	[%i5+%o4]0x81,%f18	! %f18 = ff000000 ffffffff

p0_label_271:
!	Mem[0000000030081408] = ffee36da, %f25 = 431bbaff
	lda	[%i2+%o4]0x81,%f25	! %f25 = ffee36da
!	Mem[0000000030181400] = 00000000 00000000, %l4 = 431bbaff, %l5 = ffffff00
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010041420] = 00000000, %l2 = 00000000000000ff
	ldsw	[%i1+0x020],%l2		! %l2 = 0000000000000000
!	Mem[0000000030181408] = ff000000 ff000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 00000000ff000000 00000000ff000000
!	Mem[0000000030141410] = 00000000431bbaff, %l4 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l4	! %l4 = 00000000431bbaff
!	Mem[00000000218000c0] = 00ff0fe0, %l4 = 00000000431bbaff
	ldub	[%o3+0x0c1],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030101410] = 006800ff, %l2 = 0000000000000000
	lduwa	[%i4+%o5]0x89,%l2	! %l2 = 00000000006800ff
!	Mem[0000000010101420] = ff000000 431bbaff, %l4 = 000000ff, %l5 = 00000000
	ldd	[%i4+0x020],%l4		! %l4 = 00000000ff000000 00000000431bbaff
!	Mem[0000000010101408] = 00000000, %l6 = 00000000ff000000
	ldswa	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 431bbaff, %l7 = 00000000ff000000
	ldsha	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffbaff

p0_label_272:
!	%l3 = d9cf2b3300000000, Mem[0000000010041400] = ffffffff
	stba	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 00ffffff
!	Mem[0000000030141408] = 000000ff, %l4 = 00000000ff000000
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000218001c1] = 007ba57a, %l0 = 0000000000000000
	ldstub	[%o3+0x1c1],%l0		! %l0 = 0000007b000000ff
!	Mem[0000000030041410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041410] = 00000000, %l4 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%l2 = 006800ff, %l3 = 00000000, Mem[0000000010081428] = 00000000 ff000000
	stda	%l2,[%i2+0x028]%asi	! Mem[0000000010081428] = 006800ff 00000000
!	Mem[0000000010181400] = ff0000ff, %l7 = ffffffffffffbaff
	ldstuba	[%i6+%g0]0x88,%l7	! %l7 = 000000ff000000ff
!	%l2 = 00000000006800ff, Mem[000000001000142e] = 00ffffff
	sth	%l2,[%i0+0x02e]		! Mem[000000001000142c] = 00ff00ff
!	%l7 = 00000000000000ff, Mem[00000000300c1410] = ffba1b43
	stha	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ff1b43
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = da36eeff, %f25 = ffee36da
	lda	[%i2+%o4]0x89,%f25	! %f25 = da36eeff

p0_label_273:
!	Mem[00000000100c1400] = ff000000, %l1 = 0000000000000000
	lduha	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = 0000ff00, %l0 = 000000000000007b
	lduba	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 000000ff, %l5 = 00000000431bbaff
	lduha	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1420] = 0000000000000000, %l7 = 00000000000000ff
	ldx	[%i3+0x020],%l7		! %l7 = 0000000000000000
!	%l0 = 0000000000000000, %l0 = 0000000000000000, %l0 = 0000000000000000
	and	%l0,%l0,%l0		! %l0 = 0000000000000000
!	Mem[0000000010041400] = 00ffffff, %l1 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = 431bff00, %l1 = 00000000000000ff
	ldsba	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = ff000000ffffffff, %l4 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l4	! %l4 = ff000000ffffffff
!	Mem[0000000030141408] = ff000000, %l0 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%f18 = ff000000 ffffffff, %l2 = 00000000006800ff
!	Mem[0000000010141410] = ff00000000000000
	add	%i5,0x010,%g1
	stda	%f18,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010141410] = ffffffff000000ff

p0_label_274:
!	%l2 = 00000000006800ff, Mem[00000000100c1410] = 00000000
	stha	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	%l2 = 00000000006800ff, Mem[0000000030141400] = ff0000ff
	stba	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ff0000ff
!	Mem[0000000030041410] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	%l2 = 006800ff, %l3 = 00000000, Mem[0000000010141408] = 00000000 00000000
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 006800ff 00000000
!	Mem[00000000211c0000] = 00006880, %l4 = ff000000ffffffff
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000021800081] = ffff05ff, %l1 = 0000000000000000
	ldstub	[%o3+0x081],%l1		! %l1 = 000000ff000000ff
!	%l5 = 0000000000000000, %l1 = 00000000000000ff, %l6 = 00000000000000ff
	subc	%l5,%l1,%l6		! %l6 = ffffffffffffff01
!	%f12 = 00000000 00000000, Mem[00000000100c1408] = 00000000 00000000
	stda	%f12,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000010181400] = ff0000ff
	stha	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff0000ff, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x80,%l7	! %l7 = ffffffffff0000ff

p0_label_275:
!	Mem[0000000010041400] = 00ffffff, %l2 = 00000000006800ff
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = 0000000000ffffff
!	%l5 = 0000000000000000, imm = 000000000000055b, %l6 = ffffffffffffff01
	xnor	%l5,0x55b,%l6		! %l6 = fffffffffffffaa4
!	%l7 = ffffffffff0000ff, imm = 0000000000000633, %l6 = fffffffffffffaa4
	andn	%l7,0x633,%l6		! %l6 = ffffffffff0000cc
!	Mem[0000000010001420] = ffff890038ea007b, %f12 = 00000000 00000000
	ldda	[%i0+0x020]%asi,%f12	! %f12 = ffff8900 38ea007b
!	%f0  = 00000000, %f15 = 378954ff, %f22 = 00000000
	fsubs	%f0 ,%f15,%f22		! %f22 = b78954ff
!	Mem[0000000010181400] = ff000000, %l6 = ffffffffff0000cc
	ldswa	[%i6+%g0]0x88,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010101400] = ff0000ff00000000, %f4  = ffff8900 38ea007b
	ldda	[%i4+%g0]0x80,%f4 	! %f4  = ff0000ff 00000000
!	Mem[0000000030181400] = 00000000, %l5 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = ff0000ff, %l7 = ffffffffff0000ff
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000218000c0] = 00ff0fe0, %l0 = ffffffffff000000
	ldstuba	[%o3+0x0c0]%asi,%l0	! %l0 = 00000000000000ff

p0_label_276:
!	%l3 = d9cf2b3300000000, Mem[00000000300c1410] = 00ff1b43
	stwa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010001410] = ff1a0000, %l2 = 0000000000ffffff
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030101408] = ffffff54, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l4	! %l4 = 00000054000000ff
!	Mem[0000000021800141] = ffbdda9c, %l3 = d9cf2b3300000000
	ldstub	[%o3+0x141],%l3		! %l3 = 000000bd000000ff
!	%l7 = 00000000000000ff, Mem[0000000030101408] = ffffffff
	stha	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = ffff00ff
!	%l6 = ffffffffff000000, Mem[0000000030041408] = c41410f0ff0000ff
	stxa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffffff000000
!	Mem[0000000010141408] = 006800ff, %l3 = 00000000000000bd
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 00000000006800ff
!	%l4 = 00000054, %l5 = 00000000, Mem[0000000030081410] = d9cf2b33 00000000
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000054 00000000
!	Mem[0000000030001400] = 00004fff, %l7 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 0000000000004fff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff000000, %l1 = 00000000000000ff
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_277:
!	Mem[0000000010081410] = ffee36da332bcfad, %l3 = 00000000006800ff
	ldxa	[%i2+0x010]%asi,%l3	! %l3 = ffee36da332bcfad
!	Mem[0000000010101434] = ff1a0000, %l2 = 00000000000000ff
	lduha	[%i4+0x034]%asi,%l2	! %l2 = 000000000000ff1a
!	Mem[0000000010141410] = ffffffff, %l3 = ffee36da332bcfad
	ldsha	[%i5+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081408] = adcf2b33 da36eeff, %l6 = ff000000, %l7 = 00004fff
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 00000000da36eeff 00000000adcf2b33
!	Mem[0000000030041400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = ff006880, %l1 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 000000000000ff00
!	Mem[00000000100c1410] = ff000000 00000080, %l6 = da36eeff, %l7 = adcf2b33
	ldda	[%i3+0x010]%asi,%l6	! %l6 = 00000000ff000000 0000000000000080
!	Mem[0000000010081410] = da36eeff, %l3 = ffffffffffffffff
	ldsha	[%i2+%o5]0x88,%l3	! %l3 = ffffffffffffeeff
!	Mem[0000000010141410] = ffffffff, %l4 = 0000000000000054
	ldsha	[%i5+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000ff00, Mem[0000000010181400] = 000000ff
	stba	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff

p0_label_278:
!	%f16 = ff0000ff 00000000 ff000000 ffffffff
!	%f20 = ff0000ff 00000000 b78954ff 00000000
!	%f24 = ff000000 da36eeff 00004fff 00000000
!	%f28 = d9cf2b33 00000000 ffffff00 ffee36da
	stda	%f16,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	Mem[0000000030001408] = 1b000000, %l7 = 0000000000000080
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 0000001b000000ff
!	Mem[0000000010081408] = 00000000, %l4 = ffffffffffffffff
	swapa	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (44)
!	Mem[00000000100c1400] = ff0000ff, %l1 = 000000000000ff00
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ff0000ff
!	%l0 = 0000000000000000, Mem[0000000010081408] = ffffffff
	stba	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ffffff
!	%l1 = 00000000ff0000ff, Mem[0000000010001400] = 000000ff, %asi = 80
	stwa	%l1,[%i0+0x000]%asi	! Mem[0000000010001400] = ff0000ff
!	%l2 = 000000000000ff1a, Mem[00000000300c1400] = ffba1b43
	stba	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 1aba1b43
!	%l7 = 000000000000001b, %l1 = 00000000ff0000ff, %l1 = 00000000ff0000ff
	or	%l7,%l1,%l1		! %l1 = 00000000ff0000ff
!	%l1 = 00000000ff0000ff, Mem[0000000030041410] = 000000ff
	stba	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ff000000, %l0 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l0	! %l0 = ffffffffff000000

p0_label_279:
!	Mem[0000000030041408] = ffffffffff000000, %f0  = 00000000 00000000
	ldda	[%i1+%o4]0x89,%f0 	! %f0  = ffffffff ff000000
!	Mem[0000000010101410] = ff0000ff, %f26 = 00004fff
	lda	[%i4+%o5]0x88,%f26	! %f26 = ff0000ff
!	Mem[0000000030081410] = 00000054, %l2 = 000000000000ff1a
	lduba	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041438] = 006800ff00000000, %f0  = ffffffff ff000000
	ldd	[%i1+0x038],%f0 	! %f0  = 006800ff 00000000
!	Mem[0000000010041400] = 00ffffff, %l0 = ffffffffff000000
	ldsba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = ff006880, %l0 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffff00
!	%l4 = 0000000000000000, immed = fffff578, %y  = ffff8900
	umul	%l4,-0xa88,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[0000000010141434] = 89006800, %l5 = 0000000000000000
	lduba	[%i5+0x035]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = ff0000ff, %l6 = 00000000ff000000
	lduba	[%i5+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000020800040] = 2200726d, %asi = 80
	stba	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = ff00726d

p0_label_280:
!	%l3 = 0000000000000000, Mem[0000000010181408] = 000000007c50879f
	stxa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000000000000
!	Mem[0000000010141400] = ff0000ff, %l5 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 00000000ff0000ff
!	%f20 = ff0000ff 00000000, Mem[0000000030101400] = ff000000 00000000
	stda	%f20,[%i4+%g0]0x89	! Mem[0000000030101400] = ff0000ff 00000000
!	%l5 = 00000000ff0000ff, Mem[0000000010081410] = ffee36da, %asi = 80
	stwa	%l5,[%i2+0x010]%asi	! Mem[0000000010081410] = ff0000ff
!	%l0 = ffffffffffffff00, Mem[0000000010001430] = c41410f000ffd6a0, %asi = 80
	stxa	%l0,[%i0+0x030]%asi	! Mem[0000000010001430] = ffffffffffffff00
!	%l7 = 000000000000001b, Mem[00000000211c0000] = ff006880, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 001b6880
!	%l5 = 00000000ff0000ff, immd = fffffffffffffedd, %l3 = 0000000000000000
	udivx	%l5,-0x123,%l3		! %l3 = 0000000000000000
!	%l4 = 00000000, %l5 = ff0000ff, Mem[0000000030081408] = da36eeff adcf2b33
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 ff0000ff
!	%l6 = 000000ff, %l7 = 0000001b, Mem[0000000030101400] = 00000000 ff0000ff
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff 0000001b
!	Starting 10 instruction Load Burst
!	%l5 = 00000000ff0000ff, imm = fffffffffffff210, %l7 = 000000000000001b
	add	%l5,-0xdf0,%l7		! %l7 = 00000000fefff30f

p0_label_281:
!	%f2  = 00000000 ac000000, Mem[00000000100c1400] = 0000ff00 00000000
	stda	%f2 ,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000 ac000000
!	Mem[0000000010081410] = ff0000ff, %l2 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000021800180] = b3ffbce0, %l6 = 00000000000000ff
	ldsb	[%o3+0x180],%l6		! %l6 = ffffffffffffffb3
!	Mem[0000000010001438] = 00000000431bbaff, %l3 = 0000000000000000
	ldxa	[%i0+0x038]%asi,%l3	! %l3 = 00000000431bbaff
!	Mem[000000001010143c] = ffee36da, %l0 = ffffffffffffff00
	ldsha	[%i4+0x03c]%asi,%l0	! %l0 = ffffffffffffffee
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000030101400] = 000000ff 0000001b ff00ffff 00000000
!	Mem[0000000030101410] = ff006800 00000000 431bbaae c6f3ecaf
!	Mem[0000000030101420] = ff000000 431bbaff 000000ff 00000000
!	Mem[0000000030101430] = 00000000 00000000 00000000 000000ff
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000030141400] = c41410f0 ff0000ff, %l4 = 00000000, %l5 = ff0000ff
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 00000000ff0000ff 00000000c41410f0
!	Mem[0000000030141408] = ff000000ffffffff, %f12 = ffff8900 38ea007b
	ldda	[%i5+%o4]0x81,%f12	! %f12 = ff000000 ffffffff
!	Mem[0000000010101400] = ff0000ff00000000, %l0 = ffffffffffffffee
	ldxa	[%i4+%g0]0x80,%l0	! %l0 = ff0000ff00000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ff0000ff, Mem[0000000030001410] = ff0000ff
	stha	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ff00ff

p0_label_282:
!	Mem[0000000030101400] = ff000000, %l3 = 00000000431bbaff
	swapa	[%i4+%g0]0x89,%l3	! %l3 = 00000000ff000000
!	Mem[000000001004141e] = 0000f200, %l1 = 00000000ff0000ff
	ldstuba	[%i1+0x01e]%asi,%l1	! %l1 = 000000f2000000ff
!	%f10 = 80000000 00000000, Mem[0000000010141408] = 000000bd 00000000
	stda	%f10,[%i5+%o4]0x88	! Mem[0000000010141408] = 80000000 00000000
!	Mem[0000000010141408] = 00000000, %l7 = 00000000fefff30f
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%f9  = c6de9dcb, Mem[0000000010181408] = 00000000
	sta	%f9 ,[%i6+%o4]0x88	! Mem[0000000010181408] = c6de9dcb
!	%l7 = 0000000000000000, %l0 = ff0000ff00000000, %l2 = 00000000000000ff
	or	%l7,%l0,%l2		! %l2 = ff0000ff00000000
!	Mem[0000000010181400] = 000000ff, %l0 = ff0000ff00000000
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l3 = 00000000ff000000, Mem[0000000010041428] = f8de38ff000000ff
	stx	%l3,[%i1+0x028]		! Mem[0000000010041428] = 00000000ff000000
!	%f4  = ff0000ff 00000000, %l4 = 00000000ff0000ff
!	Mem[0000000030041410] = ff00000000000000
	add	%i1,0x010,%g1
	stda	%f4,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030041410] = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff0000ff, %f15 = 378954ff
	lda	[%i5+%g0]0x89,%f15	! %f15 = ff0000ff

p0_label_283:
!	Mem[00000000201c0000] = 00ff3e5d, %l1 = 00000000000000f2
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101400] = ffba1b43, %l5 = 00000000c41410f0
	lduwa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ffba1b43
!	Mem[0000000030101410] = ff006800, %l3 = 00000000ff000000
	ldsha	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffff00
!	Mem[00000000300c1400] = b6a55dae 431bba1a, %l2 = 00000000, %l3 = ffffff00
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 00000000431bba1a 00000000b6a55dae
!	Mem[0000000030181408] = ff000000, %l0 = 00000000000000ff
	lduwa	[%i6+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030041408] = ffffffff ff000000, %l2 = 431bba1a, %l3 = b6a55dae
	ldda	[%i1+%o4]0x89,%l2	! %l2 = 00000000ff000000 00000000ffffffff
!	Mem[0000000030141400] = ff0000ff, %l2 = 00000000ff000000
	ldsba	[%i5+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1408] = ff000000, %l2 = ffffffffffffffff
	ldsha	[%i3+%o4]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[00000000211c0000] = 001b6880, %l6 = ffffffffffffffb3
	ldub	[%o2+%g0],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ffba1b43, Mem[0000000030181410] = 00000000
	stwa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = ffba1b43

p0_label_284:
!	%l3 = 00000000ffffffff, imm = 0000000000000931, %l0 = 00000000ff000000
	andn	%l3,0x931,%l0		! %l0 = 00000000fffff6ce
!	Mem[0000000010141400] = 00000000, %l3 = 00000000ffffffff
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%f10 = 80000000 00000000, %l3 = 0000000000000000
!	Mem[0000000010081418] = afecf3c6aeba1b43
	add	%i2,0x018,%g1
	stda	%f10,[%g1+%l3]ASI_PST16_P ! Mem[0000000010081418] = afecf3c6aeba1b43
!	%l1 = 00000000000000ff, Mem[0000000010181420] = ff0000002871ffac
	stx	%l1,[%i6+0x020]		! Mem[0000000010181420] = 00000000000000ff
!	Mem[0000000030181408] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	%l4 = ff0000ff, %l5 = ffba1b43, Mem[0000000010141400] = ff000000 00000000
	stda	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = ff0000ff ffba1b43
!	%l4 = 00000000ff0000ff, Mem[00000000300c1408] = 0000000000000000
	stxa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000ff0000ff
!	%l3 = 00000000000000ff, Mem[0000000030141410] = ffba1b43
	stba	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = ffba1b43
!	Mem[0000000010001404] = 332bcfad, %l0 = fffff6ce, %l4 = ff0000ff
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 00000000332bcfad
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffff00, %l7 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l7	! %l7 = 000000000000ff00

p0_label_285:
!	Mem[0000000010141424] = 00000000, %l5 = 00000000ffba1b43
	ldsh	[%i5+0x026],%l5		! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l5 = 0000000000000000
	lduba	[%i3+0x001]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = 43e9efffffffff00, %f20 = ff006800 00000000
	ldda	[%i2+%g0]0x89,%f20	! %f20 = 43e9efff ffffff00
!	Mem[0000000010181400] = 00000000, %l4 = 00000000332bcfad
	ldsba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = ffff00ff, %l3 = 00000000000000ff
	ldsha	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000218000c0] = ffff0fe0, %l1 = 00000000000000ff
	ldsha	[%o3+0x0c0]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141420] = 00000000, %l4 = 0000000000000000
	lduha	[%i5+0x022]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000218001c0] = 00ffa57a, %l3 = 00000000000000ff
	lduha	[%o3+0x1c0]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101400] = ffba1b43, %l0 = 00000000fffff6ce
	ldsba	[%i4+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f22 = 431bbaae c6f3ecaf, %l3 = 00000000000000ff
!	Mem[0000000010081418] = afecf3c6aeba1b43
	add	%i2,0x018,%g1
	stda	%f22,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010081418] = afecf3c6aeba1b43

p0_label_286:
!	%l2 = ffffffffffffff00, Mem[00000000300c1408] = ff0000ff00000000
	stxa	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffffffffff00
!	Mem[0000000010001410] = 00001aff, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010081410] = ff0000ff, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000ff0000ff
!	%l1 = ffffffffffffffff, imm = 0000000000000074, %l0 = ffffffffffffffff
	xnor	%l1,0x074,%l0		! %l0 = 0000000000000074
!	Mem[0000000010001410] = ff1a0000, %l0 = 0000000000000074
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%l1 = ffffffffffffffff, Mem[0000000010141400] = ff0000ff
	stha	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = ffff00ff
!	Mem[00000000201c0001] = 00ff3e5d, %l4 = 0000000000000000
	ldstub	[%o0+0x001],%l4		! %l4 = 000000ff000000ff
!	Mem[0000000030081408] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010101408] = 00000000
	stba	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 006800ff, %l1 = ffffffffffffffff
	lduha	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff

p0_label_287:
!	Mem[0000000010101400] = ff0000ff00000000, %f24 = ff000000 431bbaff
	ldda	[%i4+%g0]0x80,%f24	! %f24 = ff0000ff 00000000
!	Mem[0000000030081410] = 54000000, %l1 = 00000000000000ff
	ldsba	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 00ffffff, %l6 = 00000000ff0000ff
	ldswa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000ffffff
!	Mem[0000000010141410] = ffffffff, %l3 = 0000000000000000
	ldswa	[%i5+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041410] = 000000ff, %l0 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = 431bbaff, %l2 = ffffffffffffff00
	lduwa	[%i5+%o5]0x89,%l2	! %l2 = 00000000431bbaff
!	Mem[0000000010101410] = ff0000ff, %l2 = 00000000431bbaff
	ldswa	[%i4+%o5]0x88,%l2	! %l2 = ffffffffff0000ff
!	Mem[00000000300c1400] = 1aba1b43, %l0 = 00000000000000ff
	lduwa	[%i3+%g0]0x81,%l0	! %l0 = 000000001aba1b43
!	Mem[00000000300c1410] = 00000000, %l5 = 00000000000000ff
	lduba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 006800ff 00000000 00000000 ac000000
!	%f4  = ff0000ff 00000000 ff006800 00000000
!	%f8  = 00000000 c6de9dcb 80000000 00000000
!	%f12 = ff000000 ffffffff 78b7ff9c ff0000ff
	stda	%f0,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400

p0_label_288:
!	%l2 = ffffffffff0000ff, Mem[0000000010181400] = 00000000
	stba	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000000
!	%f18 = ff00ffff 00000000, %l2 = ffffffffff0000ff
!	Mem[0000000030181420] = cb9ddec609be3ca1
	add	%i6,0x020,%g1
	stda	%f18,[%g1+%l2]ASI_PST32_S ! Mem[0000000030181420] = ff00ffff00000000
!	Code Fragment 3
p0_fragment_32:
!	%l0 = 000000001aba1b43
	setx	0xfcde1dd805f5fd04,%g7,%l0 ! %l0 = fcde1dd805f5fd04
!	%l1 = 0000000000000000
	setx	0x8131caefe267dd4e,%g7,%l1 ! %l1 = 8131caefe267dd4e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fcde1dd805f5fd04
	setx	0xa2c9b17fa0aedca8,%g7,%l0 ! %l0 = a2c9b17fa0aedca8
!	%l1 = 8131caefe267dd4e
	setx	0xcda13b77e6018a58,%g7,%l1 ! %l1 = cda13b77e6018a58
!	Mem[00000000211c0000] = 001b6880, %l3 = ffffffffffffffff
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0000] = ff1b6880, %l4 = 00000000000000ff
	ldstub	[%o2+%g0],%l4		! %l4 = 000000ff000000ff
!	%f18 = ff00ffff 00000000, Mem[0000000030081408] = 000000ff ff0000ff
	stda	%f18,[%i2+%o4]0x89	! Mem[0000000030081408] = ff00ffff 00000000
!	%l6 = 0000000000ffffff, Mem[0000000030001400] = 000000ff
	stha	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = ffff00ff
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000ffffff
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c142c] = 00000000, %l5 = 0000000000000000
	ldstub	[%i3+0x02c],%l5		! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = ff000000, %l2 = ffffffffff0000ff
	lduha	[%i4+0x020]%asi,%l2	! %l2 = 000000000000ff00

p0_label_289:
!	Mem[0000000030141400] = c41410f0ff0000ff, %l6 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l6	! %l6 = c41410f0ff0000ff
!	Mem[00000000100c1410] = ff0000ff, %l5 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 00000000ff0000ff
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010041400] = 00ffffff, %l4 = 00000000000000ff
	ldsb	[%i1+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010141434] = 89006800, %l5 = 00000000ff0000ff
	lduba	[%i5+0x035]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081424] = 000000ff, %l4 = 0000000000000000
	lduba	[%i2+0x027]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141410] = ffba1b4300000000, %f2  = 00000000 ac000000
	ldda	[%i5+%o5]0x81,%f2 	! %f2  = ffba1b43 00000000
!	Mem[0000000010041408] = ff000000 ff000000, %l0 = a0aedca8, %l1 = e6018a58
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000ff000000 00000000ff000000
!	%f20 = 43e9efff, %f27 = 00000000, %f31 = 000000ff
	fdivs	%f20,%f27,%f31		! %f31 = 7f800000
!	%l3 = 0000000000000000, imm = 000000000000026c, %l0 = 00000000ff000000
	sub	%l3,0x26c,%l0		! %l0 = fffffffffffffd94
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ff000000, Mem[0000000030141400] = ff0000ff
	stba	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff

p0_label_290:
!	Mem[0000000010081430] = ff0000ff, %l3 = 0000000000000000
	swap	[%i2+0x030],%l3		! %l3 = 00000000ff0000ff
!	%l3 = 00000000ff0000ff, Mem[0000000010141408] = fefff30f
	stwa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = ff0000ff
!	Mem[00000000201c0001] = 00ff3e5d, %l6 = c41410f0ff0000ff
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	%f22 = 431bbaae c6f3ecaf, %l6 = 00000000000000ff
!	Mem[0000000010001408] = 00ff0000ceaa4741
	add	%i0,0x008,%g1
	stda	%f22,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010001408] = afecf3c6aeba1b43
!	%f30 = 00000000, Mem[0000000010141408] = ff0000ff
	sta	%f30,[%i5+0x008]%asi	! Mem[0000000010141408] = 00000000
!	%f0  = 006800ff 00000000 ffba1b43 00000000
!	%f4  = ff0000ff 00000000 ff006800 00000000
!	%f8  = 00000000 c6de9dcb 80000000 00000000
!	%f12 = ff000000 ffffffff 78b7ff9c ff0000ff
	stda	%f0,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	%f25 = 00000000, %f17 = 0000001b
	fcmpes	%fcc2,%f25,%f17		! %fcc2 = 1
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000030041410] = ff0000ff 00000000
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff 00000000
!	Mem[0000000010141400] = ff00ffff, %l7 = 000000000000ff00
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 00000000ff00ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000 00000000 ff000000 ff000000
!	Mem[0000000030181410] = ffba1b43 00000000 89a56831 5c11a999
!	Mem[0000000030181420] = ff00ffff 00000000 e98b0000 38ea007b
!	Mem[0000000030181430] = ff000000 ff800000 c15c5f2a 7af196a3
	ldda	[%i6]ASI_BLK_S,%f16	! Block Load from 0000000030181400

p0_label_291:
!	Mem[0000000010101410] = ff0000ff 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 00000000ff0000ff 0000000000000000
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000010041408] = 000000ff, %l4 = 00000000ff0000ff
	ldsba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = ff0000ff, %l6 = 00000000000000ff
	ldswa	[%i4+%g0]0x88,%l6	! %l6 = ffffffffff0000ff
!	Mem[0000000030081400] = 00ffffff, %l7 = 00000000ff00ffff
	ldsha	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = 00000000000000ff, %f12 = ff000000 ffffffff
	ldda	[%i0+%o4]0x89,%f12	! %f12 = 00000000 000000ff
!	Mem[0000000010041408] = 000000ff, %l1 = 00000000ff000000
	ldsha	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 000000ff, %f2  = ffba1b43
	lda	[%i5+%g0]0x81,%f2 	! %f2 = 000000ff
!	Mem[0000000010101408] = 000000ff, %l2 = 000000000000ff00
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	%l3 = 00000000ff0000ff, %l1 = 0000000000000000, %l3 = 00000000ff0000ff
	udivx	%l3,%l1,%l3		! Div by zero, %l0 = fffffffffffffde4
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00000000, %l2 = ffffffffffffffff, %asi = 80
	swapa	[%i5+0x008]%asi,%l2	! %l2 = 0000000000000000

p0_label_292:
!	%l7 = 00000000000000ff, Mem[00000000100c1414] = 00000000
	sth	%l7,[%i3+0x014]		! Mem[00000000100c1414] = 00ff0000
!	%l4 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stha	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%f30 = c15c5f2a, %f22 = 89a56831, %f30 = c15c5f2a 7af196a3
	fsmuld	%f30,%f22,%f30		! %f30 = 3971cc60 dd28e140
!	Mem[0000000030141410] = ffba1b43, %l0 = fffffffffffffdbc
	swapa	[%i5+%o5]0x81,%l0	! %l0 = 00000000ffba1b43
!	Mem[0000000010001434] = ffffff00, %l7 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x034]%asi,%l7	! %l7 = 00000000ffffff00
!	%f28 = ff000000, Mem[000000001018143c] = 000000ff
	st	%f28,[%i6+0x03c]	! Mem[000000001018143c] = ff000000
!	%l0 = ffba1b43, %l1 = 00000000, Mem[0000000030141408] = ff000000 ffffffff
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = ffba1b43 00000000
!	%l1 = 0000000000000000, Mem[0000000010181400] = ff000000
	stha	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Mem[0000000010141400] = 0000ff00, %l5 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00ffffff00000000, %f24 = ff00ffff 00000000
	ldda	[%i2+%o4]0x80,%f24	! %f24 = 00ffffff 00000000

p0_label_293:
!	Mem[00000000300c1410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181424] = 000000ff, %l6 = ffffffffff0000ff
	ldub	[%i6+0x026],%l6		! %l6 = 0000000000000000
!	Mem[0000000030001410] = 00000000ff00ff00, %l3 = 00000000ff0000ff
	ldxa	[%i0+%o5]0x89,%l3	! %l3 = 00000000ff00ff00
!	Mem[0000000010041410] = 000000ff, %l7 = 00000000ffffff00
	ldswa	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1400] = 431bba1a, %l3 = 00000000ff00ff00
	ldsba	[%i3+%g0]0x89,%l3	! %l3 = 000000000000001a
!	Mem[0000000030081410] = 00000054, %l0 = 00000000ffba1b43
	ldsba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 00ff3e5d, %l5 = 0000000000000000
	ldub	[%o0+0x001],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030141400] = ff000000, %l2 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff000000ff, %l4 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l4	! %l4 = ffffffff000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000030081410] = 0000005400000000
	stxa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000000000ff

p0_label_294:
!	Mem[000000001000141c] = ffff0000, %l7 = 000000ff, %l3 = 0000001a
	add	%i0,0x1c,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000ffff0000
!	Mem[0000000010081408] = 00ffffff, %l7 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101410] = ff006800, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	%l3 = 00000000ffff0000, Mem[0000000030101408] = ff00ffff
	stha	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ffff
!	%l5 = 00000000000000ff, Mem[00000000300c1410] = 00000000
	stha	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff
!	%l7 = 00000000000000ff, Mem[00000000100c142f] = ff000000, %asi = 80
	stba	%l7,[%i3+0x02f]%asi	! Mem[00000000100c142c] = ff0000ff
!	%f10 = 80000000 00000000, %l1 = 0000000000000000
!	Mem[0000000010081408] = ffffffff00000000
	add	%i2,0x008,%g1
	stda	%f10,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010081408] = ffffffff00000000
!	%f18 = ff000000 ff000000, Mem[0000000030041410] = 000000ff 00000000
	stda	%f18,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000 ff000000
!	%l4 = ffffffff000000ff, Mem[0000000030001410] = 00ff00ff
	stba	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = ffff00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 000000ff, %f27 = 38ea007b
	lda	[%i1+%o5]0x88,%f27	! %f27 = 000000ff

p0_label_295:
!	Mem[0000000010181404] = 00000000, %l5 = 00000000000000ff
	lduw	[%i6+0x004],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l0 = 0000000000000000
	lduha	[%i4+%o4]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030081408] = 00000000ffff00ff, %l1 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l1	! %l1 = 00000000ffff00ff
!	Mem[0000000010181400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 00ff3e5d, %l6 = 0000000000000000
	ldsh	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030141410] = bcfdffff, %l0 = 000000000000ff00
	lduba	[%i5+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%l5 = 0000000000000000, imm = 0000000000000551, %l3 = 00000000ffff0000
	xor	%l5,0x551,%l3		! %l3 = 0000000000000551
!	Mem[0000000010041400] = ffffff00, %l1 = 00000000ffff00ff
	ldsba	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181424] = 000000ff, %l4 = ffffffff000000ff
	ldsha	[%i6+0x024]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[00000000100c1408] = 000000ff
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff

p0_label_296:
!	%f20 = ffba1b43, Mem[0000000010041410] = 000000ff
	sta	%f20,[%i1+%o5]0x88	! Mem[0000000010041410] = ffba1b43
!	%l7 = 00000000000000ff, Mem[00000000100c1410] = ff0000ff00ff0000
	stxa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000000000ff
!	Mem[0000000010181420] = 00000000000000ff, %l2 = 0000000000000000, %l3 = 0000000000000551
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1400] = 1aba1b43, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 0000001a000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141408] = ffffffff00000080
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010001432] = ffffffff, %asi = 80
	stha	%l0,[%i0+0x032]%asi	! Mem[0000000010001430] = ffff00ff
!	Mem[00000000211c0001] = ff1b6880, %l5 = 0000000000000000
	ldstub	[%o2+0x001],%l5		! %l5 = 0000001b000000ff
!	%f6  = ff006800 00000000, Mem[0000000030041400] = 006800ff 00000000
	stda	%f6 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ff006800 00000000
!	%f4  = ff0000ff 00000000, Mem[00000000100c1410] = 00000000 000000ff
	stda	%f4 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff0000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000ff, %l6 = 00000000000000ff
	ldswa	[%i5+%g0]0x81,%l6	! %l6 = 00000000000000ff

p0_label_297:
!	Mem[0000000030081408] = 00000000, %f21 = 00000000
	lda	[%i2+%o4]0x81,%f21	! %f21 = 00000000
!	Mem[0000000010141410] = ffffffff000000ff, %f20 = ffba1b43 00000000
	ldda	[%i5+%o5]0x80,%f20	! %f20 = ffffffff 000000ff
!	Mem[0000000030081410] = ff00000000000000, %f0  = 006800ff 00000000
	ldda	[%i2+%o5]0x89,%f0 	! %f0  = ff000000 00000000
!	Mem[0000000030041410] = ff000000ff000000, %f4  = ff0000ff 00000000
	ldda	[%i1+%o5]0x81,%f4 	! %f4  = ff000000 ff000000
!	Mem[0000000030101410] = 00000000006800ff, %f18 = ff000000 ff000000
	ldda	[%i4+%o5]0x89,%f18	! %f18 = 00000000 006800ff
!	Mem[0000000030081408] = 00000000, %f3  = 00000000
	lda	[%i2+%o4]0x81,%f3 	! %f3 = 00000000
!	Mem[0000000030101400] = ffba1b43, %l6 = 00000000000000ff
	ldswa	[%i4+%g0]0x81,%l6	! %l6 = ffffffffffba1b43
!	%f12 = 00000000, %f7  = 00000000
	fcmpes	%fcc0,%f12,%f7 		! %fcc0 = 0
!	Mem[0000000030101400] = ffba1b43, %l6 = ffffffffffba1b43
	ldsha	[%i4+%g0]0x81,%l6	! %l6 = ffffffffffffffba
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 00ff3e5d, %l4 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 000000ff000000ff

p0_label_298:
!	Mem[0000000010001408] = afecf3c6aeba1b43, %l4 = 00000000000000ff, %l0 = 00000000000000ff
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = afecf3c6aeba1b43
!	%l2 = 0000001a, %l3 = 000000ff, Mem[0000000010001410] = ff1a0000 00000000
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000001a 000000ff
!	Mem[0000000030081410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%l6 = ffffffffffffffba, immd = 00000000000001e1, %l7 = 00000000000000ff
	udivx	%l6,0x1e1,%l7		! %l7 = 00883fddf00883fd
!	%l4 = 00000000000000ff, immed = 00000e23, %y  = 00000000
	sdiv	%l4,0xe23,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = aeba1b43
!	Mem[0000000030181400] = 00000000, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%l6 = ffffffba, %l7 = f00883fd, Mem[0000000010041410] = 431bbaff 00000000
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffba f00883fd
!	%l6 = ffffffffffffffba, Mem[00000000100c1400] = 00000000
	stba	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ba
!	%l3 = 0000000000000000, Mem[0000000021800140] = ffffda9c
	sth	%l3,[%o3+0x140]		! Mem[0000000021800140] = 0000da9c
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000, %l2 = 000000000000001a
	ldsba	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000

p0_label_299:
!	Mem[0000000010181410] = 54ffffff 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 0000000054ffffff 0000000000000000
!	Mem[0000000010041410] = ffffffba, %l1 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101410] = ff0000ff00000000, %f30 = 3971cc60 dd28e140
	ldda	[%i4+%o5]0x80,%f30	! %f30 = ff0000ff 00000000
!	Mem[0000000010001408] = afecf3c6, %l6 = ffffffffffffffba
	ldsha	[%i0+%o4]0x80,%l6	! %l6 = ffffffffffffafec
!	Mem[0000000030041400] = ff006800, %l1 = ffffffffffffffff
	ldsba	[%i1+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101410] = ff0000ff, %l5 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 7b0f0000 000000ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff 000000007b0f0000
!	Mem[0000000010101400] = ff0000ff00000000, %l2 = 00000000000000ff
	ldxa	[%i4+%g0]0x80,%l2	! %l2 = ff0000ff00000000
!	Mem[0000000010181400] = 00000000, %l5 = 00000000000000ff
	ldsha	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ffffff00, %l4 = 0000000054ffffff
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 00000000ffffff00

p0_label_300:
!	Mem[0000000030081408] = 00000000, %l0 = afecf3c6aeba1b43
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%f26 = e98b0000 000000ff, Mem[0000000010001428] = 000000e0 00ff00ff
	std	%f26,[%i0+0x028]	! Mem[0000000010001428] = e98b0000 000000ff
!	Mem[0000000010101429] = 00004fff, %l0 = 0000000000000000
	ldstub	[%i4+0x029],%l0		! %l0 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030181410] = ffba1b43
	stha	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 00001b43
!	Mem[0000000010101406] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i4+0x006]%asi,%l5	! %l5 = 00000000000000ff
!	%f24 = 00ffffff, Mem[0000000010001408] = c6f3ecaf
	sta	%f24,[%i0+%o4]0x88	! Mem[0000000010001408] = 00ffffff
!	Mem[0000000010141410] = ffffffff, %l6 = ffffffffffffafec
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 00000000ffffffff
!	%l4 = ffffff00, %l5 = 00000000, Mem[00000000100c1410] = ff0000ff 00000000
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffff00 00000000
!	%l4 = 00000000ffffff00, Mem[0000000030181410] = 00001b43
	stha	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = ff001b43
!	Starting 10 instruction Load Burst
!	%f9  = c6de9dcb, %f15 = ff0000ff
	fcmps	%fcc1,%f9 ,%f15		! %fcc1 = 2

p0_label_301:
!	Mem[0000000030181400] = 00000000, %f7  = 00000000
	lda	[%i6+%g0]0x81,%f7 	! %f7 = 00000000
!	Mem[0000000010041424] = 00000080, %l5 = 0000000000000000
	ldsw	[%i1+0x024],%l5		! %l5 = 0000000000000080
!	Mem[0000000010101408] = 000000ff, %l6 = 00000000ffffffff
	lduba	[%i4+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = 00ff3e5d, %l5 = 0000000000000080
	ldub	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[00000000300c1400] = ffba1b43, %f7  = 00000000
	lda	[%i3+%g0]0x81,%f7 	! %f7 = ffba1b43
!	Mem[0000000030101400] = ffba1b43 0000001b, %l2 = 00000000, %l3 = 7b0f0000
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 00000000ffba1b43 000000000000001b
!	Mem[0000000010181410] = 54ffffff 00000000, %l4 = ffffff00, %l5 = 00000000
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 0000000054ffffff 0000000000000000
!	Mem[0000000010041438] = 006800ff, %l2 = 00000000ffba1b43
	ldsha	[%i1+0x038]%asi,%l2	! %l2 = 0000000000000068
!	Mem[0000000010041410] = ffffffbaf00883fd, %f22 = 89a56831 5c11a999
	ldda	[%i1+%o5]0x80,%f22	! %f22 = ffffffba f00883fd
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 00000000 00000000 006800ff
!	%f20 = ffffffff 000000ff ffffffba f00883fd
!	%f24 = 00ffffff 00000000 e98b0000 000000ff
!	%f28 = ff000000 ff800000 ff0000ff 00000000
	stda	%f16,[%i5]ASI_BLK_PL	! Block Store to 0000000010141400

p0_label_302:
!	%l7 = 00883fddf00883fd, Mem[0000000010041408] = 000000ff
	stwa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = f00883fd
!	%l7 = 00883fddf00883fd, Mem[00000000300c1400] = 431bbaff
	stha	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 431b83fd
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000010141410] = ff000000, %l3 = 000000000000001b
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010181408] = cb9ddec6, %l7 = 00883fddf00883fd
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 00000000cb9ddec6
!	%l0 = 0000000000000000, Mem[0000000010001408] = 00ffffff
	stba	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00ffff00
!	Mem[000000001010140c] = 00000000, %l6 = 00000000000000ff
	ldstub	[%i4+0x00c],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010101410] = ff0000ff, %l2 = 0000000000000068
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 00000000ff0000ff
!	%f29 = ff800000, %f13 = 000000ff
	fcmpes	%fcc1,%f29,%f13		! %fcc1 = 1
!	%f10 = 80000000 00000000, Mem[0000000010101400] = ff0000ff 0000ff00
	std	%f10,[%i4+%g0]	! Mem[0000000010101400] = 80000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff0000ff, %l4 = 0000000054ffffff
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = ffffffffff0000ff

p0_label_303:
!	Mem[0000000010001400] = ff0000ff, %f26 = e98b0000
	lda	[%i0+%g0]0x80,%f26	! %f26 = ff0000ff
!	Mem[0000000010141430] = 000080ff000000ff, %f6  = ff006800 ffba1b43
	ldd	[%i5+0x030],%f6 	! %f6  = 000080ff 000000ff
!	Mem[0000000030041410] = ff000000, %l6 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010081438] = 7b00ea3800000000, %l5 = 0000000000000000
	ldx	[%i2+0x038],%l5		! %l5 = 7b00ea3800000000
!	Mem[0000000010081408] = ffffffff, %l0 = 0000000000000000
	ldsba	[%i2+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181408] = 000000ff, %l1 = ffffffffffffffff
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081408] = aeba1b43, %f8  = 00000000
	lda	[%i2+%o4]0x89,%f8 	! %f8 = aeba1b43
!	Mem[0000000030141410] = fffffdbc, %l3 = 00000000ff000000
	ldswa	[%i5+%o5]0x81,%l3	! %l3 = fffffffffffffdbc
!	Mem[0000000010141410] = 0000001b, %l4 = ffffffffff0000ff
	lduwa	[%i5+%o5]0x80,%l4	! %l4 = 000000000000001b
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = ff006800, %l0 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x80,%l0	! %l0 = 000000ff000000ff

p0_label_304:
!	Mem[0000000030181410] = ff001b43, %l1 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 00000000ff001b43
!	%l0 = 00000000000000ff, Mem[0000000010141408] = ff006800
	stba	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = ff006800
!	%l2 = ff0000ff, %l3 = fffffdbc, Mem[0000000010141410] = 0000001b ffffffff
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = ff0000ff fffffdbc
!	%f16 = 00000000 00000000 00000000 006800ff
!	%f20 = ffffffff 000000ff ffffffba f00883fd
!	%f24 = 00ffffff 00000000 ff0000ff 000000ff
!	%f28 = ff000000 ff800000 ff0000ff 00000000
	stda	%f16,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%f12 = 00000000 000000ff, Mem[0000000030041410] = 000000ff 000000ff
	stda	%f12,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 000000ff
!	%f12 = 00000000 000000ff, Mem[00000000300c1410] = 000000ff 7b0f0000
	stda	%f12,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 000000ff
!	%f14 = 78b7ff9c ff0000ff, %l4 = 000000000000001b
!	Mem[0000000030041430] = ff000000ffffffff
	add	%i1,0x030,%g1
	stda	%f14,[%g1+%l4]ASI_PST16_S ! Mem[0000000030041430] = 78b70000ff0000ff
!	%f6  = 000080ff 000000ff, Mem[0000000010001408] = 00ffff00 aeba1b43
	stda	%f6 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 000080ff 000000ff
!	%l5 = 7b00ea3800000000, %l4 = 000000000000001b, %l3 = fffffffffffffdbc
	xnor	%l5,%l4,%l3		! %l3 = 84ff15c7ffffffe4
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 431bbaff, %l3 = 84ff15c7ffffffe4
	lduha	[%i4+%g0]0x89,%l3	! %l3 = 000000000000baff

p0_label_305:
!	Mem[00000000300c1410] = 00000000000000ff, %f2  = 000000ff 00000000
	ldda	[%i3+%o5]0x89,%f2 	! %f2  = 00000000 000000ff
!	Mem[0000000010041410] = ffffffba, %l1 = 00000000ff001b43
	ldsha	[%i1+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041408] = ffba1b43, %l0 = 00000000000000ff
	lduha	[%i1+%o4]0x81,%l0	! %l0 = 000000000000ffba
	membar	#Sync			! Added by membar checker (49)
!	Mem[0000000010101410] = ffffffff, %f5  = ff000000
	lda	[%i4+%o5]0x80,%f5 	! %f5 = ffffffff
!	%f3  = 000000ff, %f20 = ffffffff, %f28 = ff000000
	fdivs	%f3 ,%f20,%f28		! %f28 = ffffffff
!	Mem[0000000030141400] = ff000000, %l3 = 000000000000baff
	ldsha	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = 00000000bcfdffff, %f10 = 80000000 00000000
	ldda	[%i5+%o5]0x89,%f10	! %f10 = 00000000 bcfdffff
!	Code Fragment 3
p0_fragment_33:
!	%l0 = 000000000000ffba
	setx	0x2a49ec67df406b44,%g7,%l0 ! %l0 = 2a49ec67df406b44
!	%l1 = ffffffffffffffff
	setx	0x83f7417fcca6c33c,%g7,%l1 ! %l1 = 83f7417fcca6c33c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2a49ec67df406b44
	setx	0xb76cdfd810fd238f,%g7,%l0 ! %l0 = b76cdfd810fd238f
!	%l1 = 83f7417fcca6c33c
	setx	0x565b2d5f8b1bc621,%g7,%l1 ! %l1 = 565b2d5f8b1bc621
!	Mem[00000000218001c0] = 00ffa57a, %l7 = 00000000cb9ddec6
	lduh	[%o3+0x1c0],%l7		! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = f00883fd, %l6 = 000000000000ff00
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 00000000f00883fd

p0_label_306:
!	Mem[0000000021800000] = 0000b994, %l7 = 00000000000000ff
	ldstuba	[%o3+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	%f4  = ff000000 ffffffff, Mem[0000000030141400] = 000000ff f01014c4
	stda	%f4 ,[%i5+%g0]0x81	! Mem[0000000030141400] = ff000000 ffffffff
!	%l6 = 00000000f00883fd, Mem[0000000030101408] = ffff0000
	stwa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = f00883fd
!	Mem[0000000030081400] = ffffff54, %l4 = 000000000000001b
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 00000000ffffff54
!	%f30 = ff0000ff 00000000, %l6 = 00000000f00883fd
!	Mem[0000000030081438] = d40000ff00000000
	add	%i2,0x038,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_S ! Mem[0000000030081438] = d40000ff00000000
!	%l1 = 565b2d5f8b1bc621, Mem[0000000030181400] = 00000000
	stha	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000c621
!	Mem[0000000010001410] = 0000001a, %l0 = b76cdfd810fd238f
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 000000000000001a
!	%f25 = 00000000, %f6  = 000080ff, %f2  = 00000000
	fmuls	%f25,%f6 ,%f2 		! %f2  = 00000000
!	%f21 = 000000ff, Mem[000000001008142c] = 00000000
	st	%f21,[%i2+0x02c]	! Mem[000000001008142c] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000ff, %l5 = 7b00ea3800000000
	ldswa	[%i6+%o5]0x81,%l5	! %l5 = 00000000000000ff

p0_label_307:
!	%f30 = ff0000ff, %f26 = ff0000ff
	fsqrts	%f30,%f26		! %f26 = 7fffffff
!	Mem[0000000010141410] = ff0000ff fffffdbc, %l0 = 0000001a, %l1 = 8b1bc621
	ldda	[%i5+0x010]%asi,%l0	! %l0 = 00000000ff0000ff 00000000fffffdbc
!	Mem[0000000020800000] = ffff779a, %l2 = 00000000ff0000ff
	ldub	[%o1+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000020800040] = ff00726d, %l6 = 00000000f00883fd
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010101400] = 00000000 00000000 00000000 006800ff
!	Mem[0000000010101410] = ffffffff 000000ff ffffffba f00883fd
!	Mem[0000000010101420] = 00ffffff 00000000 ff0000ff 000000ff
!	Mem[0000000010101430] = ff000000 ff800000 ff0000ff 00000000
	ldda	[%i4]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400
!	Mem[0000000030141410] = bcfdffff, %l5 = 00000000000000ff
	ldsba	[%i5+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1410] = 00000000000000ff, %l2 = 00000000000000ff
	ldxa	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = ffffff00, %f5  = ffffffff
	lda	[%i1+%g0]0x88,%f5 	! %f5 = ffffff00
!	Mem[0000000010141410] = ff0000ff, %l1 = 00000000fffffdbc
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030081410] = ff000000
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000

p0_label_308:
!	Mem[0000000010141400] = 00000000, %l4 = 00000000ffffff54, %asi = 80
	swapa	[%i5+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0001] = 00ff3e5d, %l6 = ffffffffffffff00
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000030081408] = 431bbaae, %l6 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 00000043000000ff
!	%f0  = ff000000 00000000, Mem[00000000300c1408] = 00ffffff ffffffff
	stda	%f0 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000 00000000
!	Mem[0000000010081408] = ffffffff, %l2 = 00000000000000ff
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010001410] = 8f23fd10
	stba	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 8f23fdff
!	%l4 = 0000000000000000, Mem[0000000030101408] = f00883fd
	stwa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000030001408] = 000000ff 00000000
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff 00000000
!	%f13 = 000000ff, Mem[0000000030081400] = 1b000000
	sta	%f13,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffffffff 000000ff, %l0 = ff0000ff, %l1 = 000000ff
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 00000000ffffffff 00000000000000ff

p0_label_309:
!	Mem[0000000030141400] = ffffffff000000ff, %f4  = ff000000 ffffff00
	ldda	[%i5+%g0]0x89,%f4 	! %f4  = ffffffff 000000ff
!	Mem[0000000030141408] = 431bbaff, %l7 = 0000000000000000
	ldsha	[%i5+%o4]0x89,%l7	! %l7 = ffffffffffffbaff
!	%l4 = 0000000000000000, %l0 = 00000000ffffffff, %l3  = 0000000000000000
	mulx	%l4,%l0,%l3		! %l3 = 0000000000000000
!	Mem[0000000030081400] = 43e9efff000000ff, %l6 = 0000000000000043
	ldxa	[%i2+%g0]0x89,%l6	! %l6 = 43e9efff000000ff
!	Mem[0000000030181408] = 000000ff, %l2 = 00000000000000ff
	ldswa	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101410] = ffffffff, %l4 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181408] = 000000ff, %f10 = 00000000
	lda	[%i6+%o4]0x89,%f10	! %f10 = 000000ff
!	Mem[00000000300c1408] = ff000000, %l6 = 43e9efff000000ff
	lduha	[%i3+%o4]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010101400] = 0000000000000000, %f0  = ff000000 00000000
	ldda	[%i4+%g0]0x88,%f0 	! %f0  = 00000000 00000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (50)
!	%l3 = 0000000000000000, Mem[0000000010101410] = ffffffff
	stba	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ffffff

p0_label_310:
!	%l0 = ffffffff, %l1 = 000000ff, Mem[0000000030041400] = 006800ff 00000000
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff 000000ff
!	Mem[0000000010081408] = ffffffff, %l5 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000100c1408] = ff000000, %l3 = 00000000, %l7 = ffffbaff
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 00000000ff000000
!	%f16 = 00000000 00000000, %l3 = 0000000000000000
!	Mem[0000000010141420] = 00000000ffffff00
	add	%i5,0x020,%g1
	stda	%f16,[%g1+%l3]ASI_PST32_P ! Mem[0000000010141420] = 00000000ffffff00
!	%f19 = 00000000, Mem[0000000010141408] = ff006800
	sta	%f19,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[0000000010001408] = 000080ff, %l4 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c141c] = 00000000, %l3 = 0000000000000000
	lduh	[%i3+0x01e],%l3		! %l3 = 0000000000000000
!	%l2 = 00000000000000ff, Mem[0000000010181400] = 0000000000000000
	stxa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000000000ff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010141400] = ffffff54 00000000
	stda	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001000140c] = 000000ff, %l3 = 0000000000000000
	ldsb	[%i0+0x00e],%l3		! %l3 = 0000000000000000

p0_label_311:
!	Mem[0000000010101400] = 00000000, %f12 = 00000000
	lda	[%i4+%g0]0x80,%f12	! %f12 = 00000000
!	Code Fragment 3
p0_fragment_34:
!	%l0 = 00000000ffffffff
	setx	0x6aaeb937af8aa08f,%g7,%l0 ! %l0 = 6aaeb937af8aa08f
!	%l1 = 00000000000000ff
	setx	0x72aa1208144d4d5c,%g7,%l1 ! %l1 = 72aa1208144d4d5c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6aaeb937af8aa08f
	setx	0xc3b88ca0652fc836,%g7,%l0 ! %l0 = c3b88ca0652fc836
!	%l1 = 72aa1208144d4d5c
	setx	0xeaab8ab7fdaf1370,%g7,%l1 ! %l1 = eaab8ab7fdaf1370
!	Mem[0000000030101400] = 1b000000431bbaff, %l4 = 0000000000000000
	ldxa	[%i4+%g0]0x89,%l4	! %l4 = 1b000000431bbaff
!	Mem[0000000010181400] = 00000000, %l3 = 0000000000000000
	lduw	[%i6+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000030141410] = fffffdbc 00000000, %l6 = 0000ff00, %l7 = ff000000
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 00000000fffffdbc 0000000000000000
!	Mem[0000000030081400] = ff000000 ffefe943 ff1bbaae ffff00ff
!	Mem[0000000030081410] = 00000000 000000ff afecf3c6 aeba1b43
!	Mem[0000000030081420] = 0a000000 00000000 00000000 9cffb778
!	Mem[0000000030081430] = 00680089 ff0000d4 d40000ff 00000000
	ldda	[%i2]ASI_BLK_S,%f0	! Block Load from 0000000030081400
!	Mem[0000000010081408] = ffffffff, %l4 = 1b000000431bbaff
	ldsha	[%i2+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041400] = 00ffffff, %l7 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l7	! %l7 = 0000000000ffffff
!	Mem[0000000010141410] = ff0000ff, %l4 = ffffffffffffffff
	lduba	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f18 = ff006800 00000000, %l5 = 00000000000000ff
!	Mem[0000000030101408] = 0000000000000000
	add	%i4,0x008,%g1
	stda	%f18,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030101408] = 00000000006800ff

p0_label_312:
!	Code Fragment 4
p0_fragment_35:
!	%l0 = c3b88ca0652fc836
	setx	0xa592c8e7be1e5a26,%g7,%l0 ! %l0 = a592c8e7be1e5a26
!	%l1 = eaab8ab7fdaf1370
	setx	0xe3458c1fb6045f48,%g7,%l1 ! %l1 = e3458c1fb6045f48
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a592c8e7be1e5a26
	setx	0x3e76efe073b4f314,%g7,%l0 ! %l0 = 3e76efe073b4f314
!	%l1 = e3458c1fb6045f48
	setx	0x055e380fb1c953cc,%g7,%l1 ! %l1 = 055e380fb1c953cc
!	%l1 = 055e380fb1c953cc, Mem[0000000010081410] = ff000000
	stha	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 53cc0000
!	%f30 = 00000000 ff0000ff, Mem[0000000010181408] = f00883fd 00000000
	std	%f30,[%i6+%o4]	! Mem[0000000010181408] = 00000000 ff0000ff
!	%l7 = 0000000000ffffff, %l2 = 00000000000000ff, %l4 = 00000000000000ff
	udivx	%l7,%l2,%l4		! %l4 = 0000000000010101
!	%l2 = 00000000000000ff, Mem[0000000010181408] = 00000000
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000000
!	%f22 = fd8308f0, Mem[0000000030001400] = ffff00ff
	sta	%f22,[%i0+%g0]0x81	! Mem[0000000030001400] = fd8308f0
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010001408] = ff8000ff ff000000
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff 00000000
!	%f26 = ff000000 ff0000ff, %l6 = 00000000fffffdbc
!	Mem[0000000030141410] = fffffdbc00000000
	add	%i5,0x010,%g1
	stda	%f26,[%g1+%l6]ASI_PST16_S ! Mem[0000000030141410] = ff00000000000000
!	Mem[0000000010141408] = 00000000, %l5 = 00000000000000ff
	swapa	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	%f28 = 000080ff, %f18 = ff006800
	fsqrts	%f28,%f18		! %l0 = 3e76efe073b4f336, Unfinished, %fsr = 2500000000

p0_label_313:
!	Mem[0000000010081400] = 0000000000000000, %f18 = ff006800 00000000
	ldda	[%i2+%g0]0x80,%f18	! %f18 = 00000000 00000000
!	Mem[0000000030101408] = ff00680000000000, %l1 = 055e380fb1c953cc
	ldxa	[%i4+%o4]0x89,%l1	! %l1 = ff00680000000000
!	Mem[0000000010101438] = ff0000ff, %l4 = 0000000000010101
	ldsb	[%i4+0x03a],%l4		! %l4 = 0000000000000000
!	Mem[0000000030001400] = fd8308f0, %l1 = ff00680000000000
	ldswa	[%i0+%g0]0x81,%l1	! %l1 = fffffffffd8308f0
	membar	#Sync			! Added by membar checker (51)
!	Mem[0000000030001400] = fd8308f0 c6f3ecaf ff000000 00000000
!	Mem[0000000030001410] = ffff00ff 00000000 00000000 00000000
!	Mem[0000000030001420] = 45548937 09be3ca1 ffff00d8 d9e67963
!	Mem[0000000030001430] = ac9bffff ff1014c4 c7e0001f e0000000
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[00000000300c1408] = ff000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000010081428] = 006800ff, %l5 = 0000000000000000
	lduwa	[%i2+0x028]%asi,%l5	! %l5 = 00000000006800ff
!	Mem[0000000030041408] = ffba1b43 00000000, %l6 = fffffdbc, %l7 = 00ffffff
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 00000000ffba1b43 0000000000000000
!	Mem[0000000010081408] = ffffffff, %l6 = 00000000ffba1b43
	ldsba	[%i2+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffffff, Mem[0000000030141400] = 000000ff
	stwa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffff

p0_label_314:
!	%f16 = fd8308f0 c6f3ecaf ff000000 00000000
!	%f20 = ffff00ff 00000000 00000000 00000000
!	%f24 = 45548937 09be3ca1 ffff00d8 d9e67963
!	%f28 = ac9bffff ff1014c4 c7e0001f e0000000
	stda	%f16,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	%l5 = 00000000006800ff, imm = fffffffffffffef0, %l5 = 00000000006800ff
	xor	%l5,-0x110,%l5		! %l5 = ffffffffff97fe0f
!	%l0 = 73b4f336, %l1 = fd8308f0, Mem[0000000030101408] = 00000000 ff006800
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 73b4f336 fd8308f0
!	%l5 = ffffffffff97fe0f, Mem[0000000030081400] = ff000000
	stha	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = fe0f0000
!	Mem[0000000030041408] = ffba1b43, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (52)
!	Mem[0000000030001410] = ffff00ff, %l7 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	%f18 = ff000000, %f7  = aeba1b43, %f3  = ffff00ff
	fadds	%f18,%f7 ,%f3 		! %f3  = ff000000
!	%l0 = 73b4f336, %l1 = fd8308f0, Mem[0000000030101410] = ff006800 00000000
	stda	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 73b4f336 fd8308f0
!	Mem[0000000010041420] = 00000000, %l6 = ffffffffffffffff, %asi = 80
	swapa	[%i1+0x020]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ba000000, %l1 = fffffffffd8308f0
	ldsba	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffffba

p0_label_315:
!	Mem[0000000030181400] = 0000c621, %l0 = 3e76efe073b4f336
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = ffffffffffffc621
!	Mem[0000000030081408] = ff00ffff aeba1bff, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000aeba1bff 00000000ff00ffff
!	Mem[0000000010081400] = 00000000, %l7 = 00000000000000ff
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001438] = 00000000431bbaff, %f6  = afecf3c6 aeba1b43
	ldda	[%i0+0x038]%asi,%f6 	! %f6  = 00000000 431bbaff
!	%l0 = ffffffffffffc621, %l0 = ffffffffffffc621, %l3 = 00000000ff00ffff
	subc	%l0,%l0,%l3		! %l3 = 0000000000000000
!	Code Fragment 4
p0_fragment_36:
!	%l0 = ffffffffffffc621
	setx	0x1ab866bf93f67fbf,%g7,%l0 ! %l0 = 1ab866bf93f67fbf
!	%l1 = ffffffffffffffba
	setx	0xe099d5f85a31c955,%g7,%l1 ! %l1 = e099d5f85a31c955
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1ab866bf93f67fbf
	setx	0xe1486b87d0090641,%g7,%l0 ! %l0 = e1486b87d0090641
!	%l1 = e099d5f85a31c955
	setx	0x18e458bfc26139e4,%g7,%l1 ! %l1 = 18e458bfc26139e4
!	Mem[0000000030101400] = ffba1b430000001b, %f8  = 0a000000 00000000
	ldda	[%i4+%g0]0x81,%f8 	! %f8  = ffba1b43 0000001b
!	Mem[0000000010181400] = ff000000 00000000, %l0 = d0090641, %l1 = c26139e4
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000 00000000ff000000
!	Mem[0000000010141408] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 00ffffff, %l0 = ffffffffffffffff
	swapa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000ffffff

p0_label_316:
!	Mem[0000000010101428] = ff0000ff, %l6 = 0000000000000000
	ldstuba	[%i4+0x028]%asi,%l6	! %l6 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000020800000] = ffff779a
	stb	%l3,[%o1+%g0]		! Mem[0000000020800000] = 00ff779a
!	Mem[0000000010081408] = ffffffff, %l0 = 0000000000ffffff
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 00000000ffffffff
!	%f22 = 00000000 00000000, Mem[0000000010141400] = 00000000 ff000000
	stda	%f22,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000030041400] = ffffffff
	stha	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = ffff0000
!	%f10 = 00000000 9cffb778, Mem[0000000030001408] = ff000000 00000000
	stda	%f10,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 9cffb778
!	Mem[0000000010141410] = ff0000ff, %l6 = 00000000000000ff
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010041400] = ffffffff, %l2 = 00000000aeba1bff
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l4 = ff000000, %l5 = ff97fe0f, Mem[00000000300c1410] = 000000ff 00000000
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff000000 ff97fe0f
!	Starting 10 instruction Load Burst
!	Mem[00000000100c143c] = ffee36da, %l1 = 00000000ff000000
	lduw	[%i3+0x03c],%l1		! %l1 = 00000000ffee36da

p0_label_317:
!	Mem[0000000010141408] = 000000ff, %l1 = 00000000ffee36da
	ldsba	[%i5+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001410] = 8f23fdff, %l5 = ffffffffff97fe0f
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 000000000000fdff
!	Mem[0000000010181400] = 00000000, %f0  = ff000000
	lda	[%i6+%g0]0x80,%f0 	! %f0 = 00000000
!	Mem[0000000030181408] = ff000000, %l4 = 00000000ff000000
	lduha	[%i6+%o4]0x81,%l4	! %l4 = 000000000000ff00
!	%l0 = 00000000ffffffff, imm = fffffffffffffb30, %l6 = 00000000000000ff
	addc	%l0,-0x4d0,%l6		! %l6 = 00000000fffffb2f
!	Mem[0000000010081408] = ffffff0000000000, %f18 = ff000000 00000000
	ldda	[%i2+%o4]0x80,%f18	! %f18 = ffffff00 00000000
!	Mem[00000000300c1400] = 431b83fd, %l7 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 00000000431b83fd
!	Mem[0000000030081410] = 00000000, %l0 = 00000000ffffffff
	lduba	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, %l6 = 00000000fffffb2f, %l1 = ffffffffffffffff
	sdivx	%l0,%l6,%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000431b83fd, Mem[00000000211c0001] = ffff6880
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = fffd6880

p0_label_318:
!	Mem[00000000100c1408] = ff000000, %l5 = 000000000000fdff
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000020800041] = ff00726d, %l7 = 00000000431b83fd
	ldstuba	[%o1+0x041]%asi,%l7	! %l7 = 00000000000000ff
!	%l4 = 000000000000ff00, Mem[0000000030041408] = ffba1b43
	stwa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000ff00
!	Mem[00000000100c141c] = 00000000, %l5 = 00000000ff000000
	ldstuba	[%i3+0x01c]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = 0000fdff, %l1 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l4 = 000000000000ff00, Mem[0000000010141408] = 000000ff
	stba	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Mem[0000000010101408] = 00000000, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030081408] = aeba1bff
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l1 = 0000000000000000, Mem[0000000030081400] = fe0f0000ffefe943
	stxa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 000000ff, %l4 = 000000000000ff00
	ldsha	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000

p0_label_319:
!	Mem[0000000030001400] = fd8308f0, %l5 = 0000000000000000
	lduha	[%i0+%g0]0x81,%l5	! %l5 = 000000000000fd83
!	Mem[00000000100c1400] = 000000ac 000000ba, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ba 00000000000000ac
!	Mem[0000000030001410] = ffff00ff00000000, %l4 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l4	! %l4 = ffff00ff00000000
!	Mem[0000000010181408] = ff000000, %l2 = 00000000000000ff
	ldswa	[%i6+%o4]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000030181400] = 21c6000000000000, %l2 = ffffffffff000000
	ldxa	[%i6+%g0]0x81,%l2	! %l2 = 21c6000000000000
!	Mem[0000000010101410] = 00ffffff, %l0 = 00000000000000ba
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000000000ff, immed = 000002e7, %y  = aeba1b43
	smul	%l0,0x2e7,%l2		! %l2 = 000000000002e419, %y = 00000000
!	Mem[000000001004141c] = 0000ff00, %f20 = ffff00ff
	lda	[%i1+0x01c]%asi,%f20	! %f20 = 0000ff00
!	Mem[0000000021800140] = 0000da9c, %l4 = ffff00ff00000000
	ldsb	[%o3+0x141],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f15 = 00000000, Mem[00000000100c1410] = 00ffffff
	sta	%f15,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000

p0_label_320:
!	%l7 = 0000000000000000, Mem[00000000211c0000] = fffd6880, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00006880
!	%l6 = 00000000fffffb2f, Mem[0000000030041408] = 00ff0000
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00fffb2f
!	%f0  = 00000000 ffefe943 ff1bbaae ff000000
!	%f4  = 00000000 000000ff 00000000 431bbaff
!	%f8  = ffba1b43 0000001b 00000000 9cffb778
!	%f12 = 00680089 ff0000d4 d40000ff 00000000
	stda	%f0,[%i5]ASI_BLK_P	! Block Store to 0000000010141400
!	%l3 = 0000000000000000, Mem[0000000030081400] = 00000000
	stwa	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l0 = 00000000000000ff, Mem[00000000100c1410] = 00000000
	stha	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00ff0000
!	%f21 = 00000000, Mem[0000000030101410] = 73b4f336
	sta	%f21,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%f28 = ac9bffff ff1014c4, %l1 = 00000000000000ac
!	Mem[0000000030001430] = ac9bffffff1014c4
	add	%i0,0x030,%g1
	stda	%f28,[%g1+%l1]ASI_PST8_S ! Mem[0000000030001430] = ac9bffffff1014c4
!	Mem[0000000030001410] = ff00ffff, %l2 = 000000000002e419
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000030001408] = 00000000
	stha	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = ff00b994, %l3 = 0000000000000000
	ldsha	[%o3+0x000]%asi,%l3	! %l3 = ffffffffffffff00

p0_label_321:
!	Mem[00000000100c1410] = 00ff0000, %l4 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 00ff3e5d, %l6 = 00000000fffffb2f
	lduh	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %l6 = 00000000000000ff
	lduwa	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[000000001010143c] = 00000000, %l1 = 00000000000000ac
	lduh	[%i4+0x03e],%l1		! %l1 = 0000000000000000
!	Mem[000000001008141c] = aeba1b43, %l7 = 0000000000000000
	ldsh	[%i2+0x01e],%l7		! %l7 = 0000000000001b43
!	Mem[00000000100c1410] = 00ff0000, %l3 = ffffffffffffff00
	ldsb	[%i3+%o5],%l3		! %l3 = 0000000000000000
!	Mem[0000000030181408] = ff000000 ff000000, %l4 = 000000ff, %l5 = 0000fd83
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 00000000ff000000 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ff000000, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000ff000000

p0_label_322:
!	%l1 = 0000000000000000, Mem[0000000030041410] = ff000000
	stwa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%f26 = ffff00d8 d9e67963, %l1 = 0000000000000000
!	Mem[0000000030141418] = 0062fb4effff0000
	add	%i5,0x018,%g1
	stda	%f26,[%g1+%l1]ASI_PST16_S ! Mem[0000000030141418] = 0062fb4effff0000
!	%l7 = 0000000000001b43, Mem[0000000030141400] = ffffffff
	stba	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffff43
!	%l4 = ff000000, %l5 = ff000000, Mem[0000000010181408] = 00000000 ff0000ff
	stda	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000000 ff000000
!	%f18 = ffffff00, Mem[0000000010181408] = ff000000
	sta	%f18,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffff00
!	%l7 = 0000000000001b43, Mem[0000000010141438] = d40000ff00000000
	stx	%l7,[%i5+0x038]		! Mem[0000000010141438] = 0000000000001b43
!	%l7 = 0000000000001b43, Mem[00000000201c0001] = 00ff3e5d, %asi = 80
	stba	%l7,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00433e5d
!	Mem[0000000010101408] = 00000000, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x008]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = baffffff, %l4 = 00000000ff000000
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = ffba1b43, %l1 = 0000000000000000
	lduwa	[%i2+0x020]%asi,%l1	! %l1 = 00000000ffba1b43

p0_label_323:
!	Mem[0000000030181410] = ff000000, %l5 = 00000000ff000000
	lduha	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000000
!	%l7 = 0000000000001b43, %l4 = 00000000000000ff, %l0 = 0000000000000000
	sdivx	%l7,%l4,%l0		! %l0 = 000000000000001b
!	Mem[0000000030141410] = ff00000000000000, %l2 = 0000000000000000
	ldxa	[%i5+%o5]0x81,%l2	! %l2 = ff00000000000000
!	Mem[0000000010081430] = 00000000, %f30 = c7e0001f
	lda	[%i2+0x030]%asi,%f30	! %f30 = 00000000
!	Mem[00000000100c1430] = d9cf2b33 00000000, %l6 = ff000000, %l7 = 00001b43
	ldda	[%i3+0x030]%asi,%l6	! %l6 = 00000000d9cf2b33 0000000000000000
!	Mem[0000000030001408] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 000000ba, %l4 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = ffffffffffffffba
!	Mem[0000000030081410] = 00000000, %l2 = ff00000000000000
	ldswa	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = ff00ffff, %l6 = 00000000d9cf2b33
	lduba	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 ffefe943, %f8  = ffba1b43 0000001b
	fdtox	%f0 ,%f8 		! %l0 = 000000000000003d, Unfinished, %fsr = 2500000000

p0_label_324:
!	Mem[00000000211c0001] = 00006880, %l2 = 0000000000000000
	ldstub	[%o2+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010081419] = afecf3c6, %l0 = 000000000000003d
	ldstub	[%i2+0x019],%l0		! %l0 = 000000ec000000ff
!	Mem[0000000030101400] = 431bbaff, %l1 = 00000000ffba1b43
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010081400] = 00000000, %l1 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010141410] = 00000000
	stha	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%f22 = 00000000, Mem[0000000010181418] = 09be3ca1
	st	%f22,[%i6+0x018]	! Mem[0000000010181418] = 00000000
	membar	#Sync			! Added by membar checker (53)
!	Mem[0000000010141408] = ff1bbaae, %l4 = ffffffffffffffba
	swapa	[%i5+%o4]0x80,%l4	! %l4 = 00000000ff1bbaae
!	%f22 = 00000000, Mem[0000000010181400] = 00000000
	sta	%f22,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Mem[0000000010181408] = ffffff00, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffff00, %f26 = ffff00d8
	lda	[%i6+%o4]0x80,%f26	! %f26 = ffffff00

p0_label_325:
!	Mem[0000000030001408] = 78b7ff9c 00000000, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000 0000000078b7ff9c
!	Mem[0000000030081400] = 00000000, %f11 = 9cffb778
	lda	[%i2+%g0]0x89,%f11	! %f11 = 00000000
!	Mem[0000000010001400] = adcf2b33ff0000ff, %f18 = ffffff00 00000000
	ldda	[%i0+%g0]0x88,%f18	! %f18 = adcf2b33 ff0000ff
!	Mem[00000000211c0000] = 00ff6880, %l3 = 00000000000000ff
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	%f15 = 00000000, Mem[0000000010141408] = ffffffba
	sta	%f15,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[0000000030101410] = f00883fd 00000000, %l4 = ff1bbaae, %l5 = 00000000
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000 00000000f00883fd
!	Mem[00000000300c1410] = 000000ff0ffe97ff, %f4  = 00000000 000000ff
	ldda	[%i3+%o5]0x81,%f4 	! %f4  = 000000ff 0ffe97ff
!	Mem[0000000030181400] = 21c60000, %l5 = 00000000f00883fd
	ldsha	[%i6+%g0]0x81,%l5	! %l5 = 00000000000021c6
!	Mem[0000000010181410] = ffffff54, %l6 = 0000000000000000
	ldsba	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000054
!	Starting 10 instruction Store Burst
!	%f30 = 00000000 e0000000, Mem[0000000010001400] = ff0000ff adcf2b33
	stda	%f30,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 e0000000

p0_label_326:
!	%l0 = 000000ec, %l1 = 00000000, Mem[0000000030141400] = 43ffffff ffffffff
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ec 00000000
!	Mem[00000000100c1410] = 0000ff00, %l3 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f18 = adcf2b33 ff0000ff, %l2 = 0000000000000000
!	Mem[0000000030001400] = fd8308f0c6f3ecaf
	stda	%f18,[%i0+%l2]ASI_PST32_SL ! Mem[0000000030001400] = fd8308f0c6f3ecaf
!	%l6 = 0000000000000054, imm = fffffffffffff586, %l2 = 0000000000000000
	sub	%l6,-0xa7a,%l2		! %l2 = 0000000000000ace
!	%f8  = ffba1b43, %f29 = ff1014c4, %f21 = 00000000
	fsubs	%f8 ,%f29,%f21		! %f21 = fffa1b43
!	%f15 = 00000000, Mem[0000000030101410] = 00000000
	sta	%f15,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Mem[0000000010041400] = ffffffff, %l5 = 00000000000021c6
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000030101408] = 36f3b473
	stwa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030041410] = 00000000 00000000
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 0000000000fffb2f, %l6 = 0000000000000054
	ldxa	[%i1+%o4]0x89,%l6	! %l6 = 0000000000fffb2f

p0_label_327:
!	Mem[0000000030041408] = 2ffbff00, %l0 = 00000000000000ec
	lduha	[%i1+%o4]0x81,%l0	! %l0 = 0000000000002ffb
!	Mem[0000000030041410] = 00000000, %l3 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = ffffffba, %l6 = 0000000000fffb2f
	lduba	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1408] = ff000000, %l7 = 0000000078b7ff9c
	lduha	[%i3+%o4]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030181400] = 00000000 0000c621, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 000000000000c621 0000000000000000
!	%l3 = 0000000000000000, %l5 = 0000000000000000, %l1 = 0000000000000000
	subc	%l3,%l5,%l1		! %l1 = 0000000000000000
!	%l2 = 00000ace, %l3 = 00000000, Mem[0000000010001408] = ff000000 00000000
	stda	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000ace 00000000
!	Mem[000000001004140c] = 000000ff, %l2 = 0000000000000ace
	lduw	[%i1+0x00c],%l2		! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f20 = 0000ff00 fffa1b43, %l5 = 0000000000000000
!	Mem[0000000010001430] = ffff00ff000000ff
	add	%i0,0x030,%g1
	stda	%f20,[%g1+%l5]ASI_PST16_P ! Mem[0000000010001430] = ffff00ff000000ff

p0_label_328:
!	%l4 = 000000000000c621, %l6 = 00000000000000ff, %l3 = 0000000000000000
	orn	%l4,%l6,%l3		! %l3 = ffffffffffffff21
!	Mem[00000000100c1408] = ff00fdff, %l6 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%f10 = 00000000 00000000, %l4 = 000000000000c621
!	Mem[0000000030141430] = aca2929f88b66458
	add	%i5,0x030,%g1
	stda	%f10,[%g1+%l4]ASI_PST32_S ! Mem[0000000030141430] = aca2929f00000000
!	%f11 = 00000000, Mem[0000000010101408] = 000000ff
	sta	%f11,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l3 = ffffffffffffff21, %l3 = ffffffffffffff21, %l5 = 0000000000000000
	addc	%l3,%l3,%l5		! %l5 = fffffffffffffe42
!	%l2 = 00000000000000ff, Mem[0000000010181410] = 00000000ffffff54
	stxa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030101408] = 00000000
	stba	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000
!	Mem[0000000010141400] = 00000000, %l3 = ffffffffffffff21
	swapa	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010081404] = 00000000, %asi = 80
	stwa	%l3,[%i2+0x004]%asi	! Mem[0000000010081404] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000ff, %l7 = 000000000000ff00
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000ff

p0_label_329:
!	Mem[0000000030181408] = 000000ff000000ff, %f2  = ff1bbaae ff000000
	ldda	[%i6+%o4]0x89,%f2 	! %f2  = 000000ff 000000ff
!	Mem[000000001008141c] = aeba1b43, %l6 = 00000000000000ff
	lduba	[%i2+0x01c]%asi,%l6	! %l6 = 00000000000000ae
!	Mem[0000000030181408] = 000000ff 000000ff, %l6 = 000000ae, %l7 = 000000ff
	ldda	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff 00000000000000ff
!	Mem[00000000201c0000] = 00433e5d, %l3 = 0000000000000000
	ldsh	[%o0+%g0],%l3		! %l3 = 0000000000000043
!	Mem[0000000010041408] = 0000ff00, %f28 = ac9bffff
	lda	[%i1+%o4]0x80,%f28	! %f28 = 0000ff00
!	Mem[0000000030101408] = 000000ff, %l5 = fffffffffffffe42
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041410] = ff00000000000000, %f22 = 00000000 00000000
	ldda	[%i1+%o5]0x89,%f22	! %f22 = ff000000 00000000
!	Mem[0000000030041408] = 00fffb2f, %l2 = 00000000000000ff
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = 0000000000fffb2f
!	Mem[0000000010181410] = 000000ff, %l5 = 00000000000000ff
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f8  = ffba1b43, Mem[0000000010101400] = 00000000
	sta	%f8 ,[%i4+%g0]0x88	! Mem[0000000010101400] = ffba1b43

p0_label_330:
!	%l2 = 0000000000fffb2f, Mem[0000000030041410] = 00000000
	stwa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00fffb2f
!	Mem[00000000201c0000] = 00433e5d, %l0 = 0000000000002ffb
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	%f8  = ffba1b43, Mem[00000000100c1408] = fffd00ff
	sta	%f8 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffba1b43
!	%f16 = fd8308f0 c6f3ecaf, %l4 = 000000000000c621
!	Mem[00000000100c1420] = ff000000da36eeff
	add	%i3,0x020,%g1
	stda	%f16,[%g1+%l4]ASI_PST32_P ! Mem[00000000100c1420] = ff000000c6f3ecaf
!	%l3 = 0000000000000043, Mem[0000000030181410] = ff000000
	stha	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = ff000043
!	%f19 = ff0000ff, %f24 = 45548937, %f4  = 000000ff 0ffe97ff
	fsmuld	%f19,%f24,%f4 		! %f4  = c89a915b cd2b7240
!	%l6 = 00000000000000ff, Mem[0000000030141400] = ec000000
	stwa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	%l6 = 000000ff, %l7 = 000000ff, Mem[00000000300c1400] = fd831b43 ae5da5b6
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff 000000ff
!	%l5 = 00000000000000ff, Mem[0000000010101410] = ffffff00
	stba	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffffffffffffff, %f24 = 45548937 09be3ca1
	ldd	[%i1+%g0],%f24		! %f24 = ffffffff ffffffff

p0_label_331:
!	%l1 = 0000000000000000, %l5 = 00000000000000ff, %y  = 00000000
	sdiv	%l1,%l5,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030041400] = ffff0000, %f19 = ff0000ff
	lda	[%i1+%g0]0x89,%f19	! %f19 = ffff0000
!	Mem[0000000030001410] = ff00ffff, %l7 = 00000000000000ff
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030081408] = 00000000 ffff00ff, %l6 = 000000ff, %l7 = 0000ffff
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000 00000000ffff00ff
!	Mem[0000000010081410] = 53cc0000332bcfad, %l7 = 00000000ffff00ff
	ldx	[%i2+%o5],%l7		! %l7 = 53cc0000332bcfad
!	Mem[00000000100c1410] = 0000ffff, %l2 = 0000000000fffb2f
	lduwa	[%i3+%o5]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030101410] = 00000000, %l3 = 0000000000000043
	ldswa	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 00000000006800ff, %l0 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l0	! %l0 = 00000000006800ff
!	Mem[00000000100c1400] = 000000ba, %l7 = 53cc0000332bcfad
	lduwa	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ba
!	Starting 10 instruction Store Burst
!	%f16 = fd8308f0 c6f3ecaf adcf2b33 ffff0000
!	%f20 = 0000ff00 fffa1b43 ff000000 00000000
!	%f24 = ffffffff ffffffff ffffff00 d9e67963
!	%f28 = 0000ff00 ff1014c4 00000000 e0000000
	stda	%f16,[%i0]ASI_BLK_S	! Block Store to 0000000030001400

p0_label_332:
!	%l7 = 00000000000000ba, Mem[00000000300c1410] = ff97fe0fff000000
	stxa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000000000ba
!	%f14 = d40000ff, Mem[00000000300c1410] = 000000ba
	sta	%f14,[%i3+%o5]0x89	! Mem[00000000300c1410] = d40000ff
!	%f7  = 431bbaff, Mem[0000000030101408] = ff000000
	sta	%f7 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 431bbaff
!	%l3 = 0000000000000000, Mem[0000000030081400] = 00000000
	stha	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[000000001010141a] = ffffffba, %l7 = 00000000000000ba
	ldstub	[%i4+0x01a],%l7		! %l7 = 000000ff000000ff
!	Mem[000000001004142c] = ff000000, %l6 = 00000000, %l0 = 006800ff
	add	%i1,0x2c,%g1
	casa	[%g1]0x80,%l6,%l0	! %l0 = 00000000ff000000
!	%f7  = 431bbaff, %f6  = 00000000, %f2  = 000000ff
	fdivs	%f7 ,%f6 ,%f2 		! %f2  = 7f800000
!	Mem[0000000030181400] = 0000c621, %l2 = 000000000000ffff
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 00000021000000ff
!	Mem[0000000010081408] = 00ffffff, %l1 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 0000000000ffffff
!	Starting 10 instruction Load Burst
!	%f15 = 00000000, %f4  = c89a915b, %f4  = c89a915b
	fsubs	%f15,%f4 ,%f4 		! %f4  = 489a915b

p0_label_333:
!	Mem[0000000010041400] = ffffffff, %l1 = 0000000000ffffff
	ldswa	[%i1+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1400] = 000000ba, %l2 = 0000000000000021
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 000000ba000000ff
!	Mem[0000000030181400] = 0000c6ff, %l7 = 00000000000000ff
	lduha	[%i6+%g0]0x89,%l7	! %l7 = 000000000000c6ff
!	Mem[0000000030101400] = 1b000000431bbaff, %f10 = 00000000 00000000
	ldda	[%i4+%g0]0x89,%f10	! %f10 = 1b000000 431bbaff
!	%l2 = 00000000000000ba, immed = 00000a04, %y  = 00000000
	udiv	%l2,0xa04,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = ff000000
!	Mem[0000000010181400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = ffffffff, %l6 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141408] = 00000000, %l1 = ffffffffffffffff
	lduba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l2 = 00000000000000ba
	ldsba	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff000000, Mem[0000000010181400] = 00000000000000ff
	stxa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000ff000000

p0_label_334:
!	%l7 = 000000000000c6ff, Mem[0000000010141410] = 00000000
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000c6ff
!	Mem[0000000030181408] = ff000000, %l4 = 000000000000c621
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	%f6  = 00000000 431bbaff, %l3 = 0000000000000000
!	Mem[0000000030041428] = 8000000000000000
	add	%i1,0x028,%g1
	stda	%f6,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030041428] = 8000000000000000
!	%f16 = fd8308f0 c6f3ecaf adcf2b33 ffff0000
!	%f20 = 0000ff00 fffa1b43 ff000000 00000000
!	%f24 = ffffffff ffffffff ffffff00 d9e67963
!	%f28 = 0000ff00 ff1014c4 00000000 e0000000
	stda	%f16,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%f10 = 1b000000 431bbaff, Mem[0000000010001400] = e0000000 00000000
	stda	%f10,[%i0+%g0]0x88	! Mem[0000000010001400] = 1b000000 431bbaff
!	%l4 = 00000000ff000000, Mem[0000000010141418] = 00000000
	stw	%l4,[%i5+0x018]		! Mem[0000000010141418] = ff000000
!	%f15 = 00000000, Mem[0000000030141408] = 431bbaff
	sta	%f15,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Mem[0000000030181410] = 430000ff, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 00000043000000ff
!	%l7 = 000000000000c6ff, Mem[0000000010101400] = afecf3c6f00883fd
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000000000c6ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffbaf00883fd, %f12 = 00680089 ff0000d4
	ldda	[%i1+%o5]0x80,%f12	! %f12 = ffffffba f00883fd

p0_label_335:
!	Mem[0000000010181400] = 00000000 ff000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000010041408] = 0000ff00, %l3 = 00000000ff000000
	ldswa	[%i1+%o4]0x80,%l3	! %l3 = 000000000000ff00
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000010001410] = fffd238f, %l6 = ffffffffffffffff
	lduha	[%i0+%o5]0x80,%l6	! %l6 = 000000000000fffd
!	Mem[0000000010181410] = 00000000000000ff, %l5 = 00000000000000ff
	ldxa	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = 0000000000000000, %l5 = 00000000000000ff
	ldx	[%i2+%o4],%l5		! %l5 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l2 = 0000000000000000
	ldswa	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 0000000000000000, %f4  = 489a915b cd2b7240
	ldda	[%i2+%g0]0x81,%f4 	! %f4  = 00000000 00000000
!	%f20 = 0000ff00, %f18 = adcf2b33, %f1  = ffefe943
	fdivs	%f20,%f18,%f1 		! %l0 = 00000000ff000022, Unfinished, %fsr = 2500000000
!	Mem[0000000010041408] = 0000ff00, %l2 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l2	! %l2 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ffff0000, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 00000000ffff0000

p0_label_336:
!	%l2 = 0000ff00, %l3 = 0000ff00, Mem[00000000100c1400] = 000000ff 000000ac
	stda	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000ff00 0000ff00
!	%l1 = 0000000000000043, Mem[0000000010101404] = 00000000
	stb	%l1,[%i4+0x004]		! Mem[0000000010101404] = 43000000
!	%l2 = 0000ff00, %l3 = 0000ff00, Mem[0000000030041408] = 2ffbff00 00000000
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000ff00 0000ff00
!	Mem[000000001018143c] = ff000000, %l6 = 000000000000fffd
	ldstub	[%i6+0x03c],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000030081410] = 00000000, %l3 = 000000000000ff00
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000020800041] = ffff726d, %l2 = 000000000000ff00
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1410] = ffff0000, %l2 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 00000000ffff0000
!	%f24 = ffffffff ffffffff, %l4 = 00000000ff000000
!	Mem[0000000030081428] = 000000009cffb778
	add	%i2,0x028,%g1
	stda	%f24,[%g1+%l4]ASI_PST16_S ! Mem[0000000030081428] = 000000009cffb778
!	%l0 = 00000000ff000022, imm = 0000000000000c02, %l1 = 0000000000000043
	xor	%l0,0xc02,%l1		! %l1 = 00000000ff000c20
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l5 = 00000000ffff0000
	lduh	[%i6+%g0],%l5		! %l5 = 0000000000000000

p0_label_337:
!	Mem[0000000010101400] = ffc60000, %l2 = 00000000ffff0000
	ldsba	[%i4+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081400] = 00000000, %l1 = 00000000ff000c20
	ldswa	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = ff00000000000000, %f2  = 7f800000 000000ff
	ldda	[%i2+0x000]%asi,%f2 	! %f2  = ff000000 00000000
!	Mem[00000000300c1400] = 000000ff, %l7 = 000000000000c6ff
	ldsha	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 0000ff00, %l6 = 00000000000000ff
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141410] = 00000000000000ff, %f2  = ff000000 00000000
	ldda	[%i5+%o5]0x89,%f2 	! %f2  = 00000000 000000ff
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = 00ff0000, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c140c] = ffffffff, %l3 = 00000000, %l7 = 00000000
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 00000000ffffffff

p0_label_338:
!	Mem[0000000030101410] = 00000000, %l0 = 00000000ff000022
	ldstuba	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Code Fragment 4
p0_fragment_37:
!	%l0 = 0000000000000000
	setx	0x7943d8085aa0ed5f,%g7,%l0 ! %l0 = 7943d8085aa0ed5f
!	%l1 = 0000000000000000
	setx	0x5490363850658a0d,%g7,%l1 ! %l1 = 5490363850658a0d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7943d8085aa0ed5f
	setx	0xfb6dabd78548c74c,%g7,%l0 ! %l0 = fb6dabd78548c74c
!	%l1 = 5490363850658a0d
	setx	0xcb17cae7d8fdf98b,%g7,%l1 ! %l1 = cb17cae7d8fdf98b
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010181410] = ff000000 00000000
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffff 00000000
!	%l2 = ffffffffffffffff, Mem[0000000010081408] = 00000000
	stha	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ffff0000
!	%f9  = 0000001b, Mem[00000000300c1408] = 000000ff
	sta	%f9 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000001b
!	%f27 = d9e67963, Mem[0000000010081400] = 000000ff
	sta	%f27,[%i2+%g0]0x88	! Mem[0000000010081400] = d9e67963
!	Mem[00000000201c0000] = ff433e5d, %l0 = fb6dabd78548c74c
	ldstub	[%o0+%g0],%l0		! %l0 = 000000ff000000ff
!	Mem[000000001014140b] = 00000000, %l4 = 00000000ff000000
	ldstuba	[%i5+0x00b]%asi,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010041400] = ffffffff ffffffff
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[000000001000142c] = 000000ff, %l2 = ffffffffffffffff
	lduw	[%i0+0x02c],%l2		! %l2 = 00000000000000ff

p0_label_339:
!	Mem[00000000300c1408] = 000000000000001b, %f8  = ffba1b43 0000001b
	ldda	[%i3+%o4]0x89,%f8 	! %f8  = 00000000 0000001b
!	Mem[0000000030081410] = ff000000 000000ff, %l0 = 000000ff, %l1 = d8fdf98b
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff 00000000ff000000
!	Mem[0000000010001400] = ffba1b430000001b, %f30 = 00000000 e0000000
	ldda	[%i0+%g0]0x80,%f30	! %f30 = ffba1b43 0000001b
!	%l5 = 0000000000000000, %l3 = 0000000000000000, %l7 = 00000000ffffffff
	xnor	%l5,%l3,%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010081400] = d9e67963, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000063
!	Mem[00000000201c0000] = ff433e5d, %l3 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffff43
!	Mem[0000000010001420] = ffff8900, %l6 = 0000000000000063
	ldsw	[%i0+0x020],%l6		! %l6 = ffffffffffff8900
!	Mem[0000000010181408] = ffffff00ff000000, %f2  = 00000000 000000ff
	ldda	[%i6+%o4]0x80,%f2 	! %f2  = ffffff00 ff000000
!	Mem[000000001004143c] = 00000000, %l5 = 0000000000000000
	ldsha	[%i1+0x03c]%asi,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 ffefe943, %l2 = 00000000000000ff
!	Mem[0000000010181408] = ffffff00ff000000
	add	%i6,0x008,%g1
	stda	%f0,[%g1+%l2]ASI_PST16_P ! Mem[0000000010181408] = 00000000ffefe943

p0_label_340:
!	Mem[0000000010001400] = ffba1b43, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 00000000ffba1b43
!	%f2  = ffffff00 ff000000, Mem[0000000010181408] = 00000000 ffefe943
	std	%f2 ,[%i6+%o4]	! Mem[0000000010181408] = ffffff00 ff000000
!	Mem[0000000030181408] = 21c60000, %l3 = ffffffffffffff43
	swapa	[%i6+%o4]0x89,%l3	! %l3 = 0000000021c60000
!	Mem[0000000030181410] = ff0000ff, %l1 = 00000000ff000000
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[000000001000140c] = 00000000, %asi = 80
	stwa	%l5,[%i0+0x00c]%asi	! Mem[000000001000140c] = 00000000
!	%l1 = 00000000000000ff, Mem[0000000030081410] = ff000000000000ff
	stxa	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000000000ff
!	Code Fragment 4
p0_fragment_38:
!	%l0 = 00000000000000ff
	setx	0x8a64273f8793b448,%g7,%l0 ! %l0 = 8a64273f8793b448
!	%l1 = 00000000000000ff
	setx	0xf5696dc01739078b,%g7,%l1 ! %l1 = f5696dc01739078b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8a64273f8793b448
	setx	0x3825aa27a9a4a3b8,%g7,%l0 ! %l0 = 3825aa27a9a4a3b8
!	%l1 = f5696dc01739078b
	setx	0xa17af5e7a17ff9bc,%g7,%l1 ! %l1 = a17af5e7a17ff9bc
!	%l6 = ffffffffffff8900, Mem[0000000030081400] = 0000000000000000
	stxa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffffffff8900
!	%f20 = 0000ff00 fffa1b43, Mem[0000000010141410] = 0000c6ff ff000000
	stda	%f20,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000ff00 fffa1b43
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000ff000000, %f8  = 00000000 0000001b
	ldda	[%i6+%g0]0x80,%f8 	! %f8  = 00000000 ff000000

p0_label_341:
!	Mem[0000000030101400] = 431bbaff, %l1 = a17af5e7a17ff9bc
	ldsba	[%i4+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001400] = 1b00000000000000, %l6 = ffffffffffff8900
	ldxa	[%i0+%g0]0x88,%l6	! %l6 = 1b00000000000000
!	Mem[0000000010181410] = ffffffff, %f18 = adcf2b33
	lda	[%i6+%o5]0x80,%f18	! %f18 = ffffffff
!	Mem[0000000030041400] = 00000000, %l3 = 0000000021c60000
	lduba	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 53cc0000, %l4 = 00000000ffba1b43
	ldsh	[%i2+%o5],%l4		! %l4 = 00000000000053cc
!	Mem[00000000100c1408] = 431bbaff, %l2 = 00000000000000ff
	lduba	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000043
!	Mem[0000000010041410] = ffffffba, %f29 = ff1014c4
	lda	[%i1+%o5]0x80,%f29	! %f29 = ffffffba
!	Mem[0000000010081400] = 6379e6d900000000, %l2 = 0000000000000043
	ldxa	[%i2+%g0]0x80,%l2	! %l2 = 6379e6d900000000
!	Mem[0000000010041400] = 00000000, %l0 = 3825aa27a9a4a3b8
	lduha	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000053cc, Mem[0000000010001400] = 00000000
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 000053cc

p0_label_342:
!	%l4 = 000053cc, %l5 = 00000000, Mem[0000000010141418] = ff000000 431bbaff
	std	%l4,[%i5+0x018]		! Mem[0000000010141418] = 000053cc 00000000
!	%f24 = ffffffff, Mem[0000000010181408] = 00ffffff
	sta	%f24,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffff
!	%l1 = ffffffffffffffff, Mem[0000000030181410] = ff0000ff
	stba	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = ff0000ff
!	Mem[00000000218000c1] = ffff0fe0, %l6 = 1b00000000000000
	ldstub	[%o3+0x0c1],%l6		! %l6 = 000000ff000000ff
!	%l2 = 6379e6d900000000, imm = 00000000000002f4, %l4 = 00000000000053cc
	xnor	%l2,0x2f4,%l4		! %l4 = 9c861926fffffd0b
!	%l0 = 0000000000000000, Mem[0000000030001410] = 0000ff00
	stba	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000ff00
!	%l5 = 0000000000000000, Mem[0000000030101410] = 000000ff
	stba	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[0000000030041408] = 00ff0000, %l7 = ffffffffffffffff
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 0000000000ff0000
!	Mem[0000000010181408] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ff6880, %l0 = 0000000000000000
	lduh	[%o2+%g0],%l0		! %l0 = 00000000000000ff

p0_label_343:
!	Mem[0000000030101410] = 00000000, %l1 = ffffffffffffffff
	lduwa	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = fffd238f, %l1 = 0000000000000000
	lduha	[%i0+%o5]0x80,%l1	! %l1 = 000000000000fffd
!	Mem[0000000010141400] = 21ffffff, %l3 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l3	! %l3 = 0000000021ffffff
!	Mem[0000000030081400] = ffff8900, %f31 = 0000001b
	lda	[%i2+%g0]0x89,%f31	! %f31 = ffff8900
!	Mem[0000000010081408] = ffff0000, %l3 = 0000000021ffffff
	ldub	[%i2+0x009],%l3		! %l3 = 00000000000000ff
!	%f11 = 431bbaff, %f26 = ffffff00
	fcmpes	%fcc0,%f11,%f26		! %fcc0 = 3
!	Mem[0000000010101400] = ffc6000043000000, %f0  = 00000000 ffefe943
	ldda	[%i4+%g0]0x80,%f0 	! %f0  = ffc60000 43000000
!	Mem[0000000010141410] = fffa1b43, %l1 = 000000000000fffd
	lduwa	[%i5+%o5]0x88,%l1	! %l1 = 00000000fffa1b43
!	Mem[0000000010101408] = adcf2b33, %l3 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 000000000000adcf
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ffffffffff000000, %l4 = 9c861926fffffd0b, %l1 = 00000000fffa1b43
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l4,%l1	! %l1 = ffffffffff000000

p0_label_344:
!	Mem[0000000030041410] = 2ffbff00, %l6 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l6	! %l6 = 000000002ffbff00
!	%l1 = ffffffffff000000, Mem[0000000010101410] = 431bfaff00ff0000
	stxa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffffff000000
!	Mem[0000000030041400] = 00000000, %l2 = 6379e6d900000000
	swapa	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%l3 = 000000000000adcf, Mem[00000000300c1410] = ff0000d4
	stwa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000adcf
!	%l1 = ffffffffff000000, Mem[0000000010181430] = c06caef7ffffff00
	stx	%l1,[%i6+0x030]		! Mem[0000000010181430] = ffffffffff000000
!	%l4 = 9c861926fffffd0b, Mem[0000000010181410] = ffffffff
	stba	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffff0b
!	Mem[00000000300c1408] = 1b000000, %l6 = 000000002ffbff00
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 000000001b000000
!	Mem[00000000300c1408] = 00fffb2f, %l5 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 0000002f000000ff
!	%l1 = ffffffffff000000, Mem[0000000010101410] = 000000ff
	stba	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001434] = 000000ff, %l5 = 000000000000002f, %asi = 80
	swapa	[%i0+0x034]%asi,%l5	! %l5 = 00000000000000ff

p0_label_345:
!	Mem[0000000010001410] = fffd238f000000ff, %f2  = ffffff00 ff000000
	ldda	[%i0+%o5]0x80,%f2 	! %f2  = fffd238f 000000ff
!	Mem[0000000030081408] = 00000000, %l4 = 9c861926fffffd0b
	lduba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = ffffffff, %f24 = ffffffff
	lda	[%i1+%o4]0x81,%f24	! %f24 = ffffffff
!	Mem[0000000010181408] = ffffffff, %l1 = ffffffffff000000
	lduwa	[%i6+%o4]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010081400] = d9e67963, %l6 = 000000001b000000
	ldsba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000063
!	Mem[00000000100c1420] = ff000000, %l6 = 0000000000000063
	ldsb	[%i3+0x021],%l6		! %l6 = 0000000000000000
!	Mem[0000000010081408] = ffff0000, %l4 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l4	! %l4 = 00000000ffff0000
!	%l6 = 0000000000000000, imm = 0000000000000eaa, %l0 = 00000000000000ff
	andn	%l6,0xeaa,%l0		! %l0 = 0000000000000000
!	Mem[0000000010001408] = 00000ace, %l5 = 00000000000000ff
	ldsha	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f9  = ff000000, Mem[0000000010001400] = 000053cc
	sta	%f9 ,[%i0+%g0]0x80	! Mem[0000000010001400] = ff000000

p0_label_346:
!	Mem[0000000010181408] = ffffffff, %l1 = 00000000ffffffff
	swapa	[%i6+%o4]0x88,%l1	! %l1 = 00000000ffffffff
!	%f18 = ffffffff ffff0000, %l4 = 00000000ffff0000
!	Mem[0000000010041408] = 0000ff00000000ff
	add	%i1,0x008,%g1
	stda	%f18,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010041408] = 0000ff00000000ff
!	%f1  = 43000000, Mem[0000000010001400] = 000000ff
	sta	%f1 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 43000000
!	Mem[00000000300c1408] = 00fffbff, %l4 = 00000000ffff0000
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 0000000000fffbff
!	%l4 = 0000000000fffbff, Mem[0000000030041410] = ff000000ff000000
	stxa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000fffbff
!	Mem[0000000030141408] = 00000000, %l3 = 000000000000adcf
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = ffffff43, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 00000000ffffff43
!	%l6 = 00000000ffffff43, %l5 = 0000000000000000, %l4 = 0000000000fffbff
	udivx	%l6,%l5,%l4		! Div by zero, %l0 = 0000000000000050
!	%f20 = 0000ff00 fffa1b43, Mem[0000000010081428] = 006800ff 000000ff
	stda	%f20,[%i2+0x028]%asi	! Mem[0000000010081428] = 0000ff00 fffa1b43
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffffff ff000000, %l0 = 00000028, %l1 = ffffffff
	ldda	[%i6+0x008]%asi,%l0	! %l0 = 00000000ffffffff 00000000ff000000

p0_label_347:
!	Mem[0000000030041408] = ffffffff, %l6 = 00000000ffffff43
	ldsba	[%i1+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001408] = ce0a0000, %l1 = 00000000ff000000
	lduwa	[%i0+%o4]0x88,%l1	! %l1 = 00000000ce0a0000
!	Mem[0000000030101400] = 431bbaff, %l5 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l5	! %l5 = 00000000431bbaff
!	Mem[0000000010181410] = 00000000 ffffff0b, %l0 = ffffffff, %l1 = ce0a0000
	ldda	[%i6+%o5]0x88,%l0	! %l0 = 00000000ffffff0b 0000000000000000
!	Mem[00000000100c1410] = ff000000, %f12 = ffffffba
	lda	[%i3+%o5]0x88,%f12	! %f12 = ff000000
!	Mem[0000000010041410] = ffffffba, %f22 = ff000000
	lda	[%i1+%o5]0x80,%f22	! %f22 = ffffffba
!	Mem[0000000010001408] = 00000ace 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000ace 0000000000000000
!	Mem[0000000010041408] = 00ff0000, %f0  = ffc60000
	lda	[%i1+%o4]0x88,%f0 	! %f0 = 00ff0000
!	Mem[0000000010181410] = 0bffffff 00000000, %l0 = ffffff0b, %l1 = 00000000
	ldda	[%i6+0x010]%asi,%l0	! %l0 = 000000000bffffff 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000fffbff, Mem[0000000030141410] = ff000000
	stha	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = fbff0000

p0_label_348:
!	%l7 = 0000000000ff0000, Mem[0000000010041408] = 00ff0000
	stba	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 00ff0000
!	%l6 = ffffffffffffffff, Mem[0000000030041408] = ffffffff
	stba	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff
!	Mem[0000000010101410] = ff000000, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 00000000ff000000
!	%f3  = 000000ff, Mem[00000000100c1420] = ff000000
	st	%f3 ,[%i3+0x020]	! Mem[00000000100c1420] = 000000ff
!	%l0 = 000000000bffffff, Mem[0000000030101408] = ffba1b43
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = ffba1bff
!	Mem[0000000010041408] = 00ff0000, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000021800101] = ffff5371, %l0 = 000000000bffffff
	ldstuba	[%o3+0x101]%asi,%l0	! %l0 = 000000ff000000ff
!	%f6  = 00000000 431bbaff, Mem[0000000030081400] = 0089ffff ffffffff
	stda	%f6 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 431bbaff
!	%l0 = 00000000000000ff, Mem[00000000300c1408] = 0000ffff
	stba	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff00ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ffffff21, %l0 = 00000000000000ff
	ldsb	[%i5+%g0],%l0		! %l0 = ffffffffffffffff

p0_label_349:
!	Mem[00000000201c0000] = ff433e5d, %l2 = 0000000000000ace
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000043
!	Mem[0000000030081408] = ff00ffff00000000, %f28 = 0000ff00 ffffffba
	ldda	[%i2+%o4]0x89,%f28	! %f28 = ff00ffff 00000000
!	Mem[0000000010001418] = 00620000, %l7 = 0000000000ff0000
	ldsw	[%i0+0x018],%l7		! %l7 = 0000000000620000
!	Mem[00000000300c1408] = ff00ffff, %f13 = f00883fd
	lda	[%i3+%o4]0x81,%f13	! %f13 = ff00ffff
!	%f23 = 00000000, %f23 = 00000000, %f22 = ffffffba
	fsubs	%f23,%f23,%f22		! %f22 = 00000000
!	Mem[0000000010181410] = 0bffffff, %l5 = 00000000431bbaff
	ldsha	[%i6+%o5]0x80,%l5	! %l5 = 0000000000000bff
!	Mem[00000000300c1410] = cfad0000, %l4 = 0000000000fffbff
	ldsba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = 00000ace 00000000, %l4 = 00000000, %l5 = 00000bff
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000ace 0000000000000000
!	%l4 = 0000000000000ace, imm = fffffffffffff44d, %l5 = 0000000000000000
	xor	%l4,-0xbb3,%l5		! %l5 = fffffffffffffe83
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000043, Mem[0000000020800000] = 00ff779a, %asi = 80
	stba	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 43ff779a

p0_label_350:
!	%l4 = 0000000000000ace, Mem[0000000030041410] = fffbff00
	stwa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000ace
!	%l4 = 0000000000000ace, Mem[0000000010041410] = baffffff
	stha	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = baff0ace
!	Mem[0000000021800040] = ff7b2728, %l2 = 0000000000000043
	ldstuba	[%o3+0x040]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010101408] = 332bcfad, %l0 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 000000ad000000ff
!	%f16 = fd8308f0 c6f3ecaf ffffffff ffff0000
!	%f20 = 0000ff00 fffa1b43 00000000 00000000
!	%f24 = ffffffff ffffffff ffffff00 d9e67963
!	%f28 = ff00ffff 00000000 ffba1b43 ffff8900
	stda	%f16,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%l0 = 00000000000000ad, Mem[0000000010041408] = ff00ff00
	stwa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ad
!	%l3 = 00000000ff000000, Mem[0000000010101408] = ffffffff
	stha	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000ffff
!	%f13 = ff00ffff, Mem[0000000030041408] = ffffffff
	sta	%f13,[%i1+%o4]0x81	! Mem[0000000030041408] = ff00ffff
!	Mem[00000000100c1410] = 000000ff00000000, %l7 = 0000000000620000, %l4 = 0000000000000ace
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l7,%l4	! %l4 = 000000ff00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0000cc53, %l0 = 00000000000000ad
	ldsba	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000053

p0_label_351:
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000010101410] = 0000ff00, %l1 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l6 = ffffffffffffffff, %l5 = fffffffffffffe83, %l0 = 0000000000000053
	subc	%l6,%l5,%l0		! %l0 = 000000000000017c
!	Mem[0000000010001400] = 00000043, %f18 = ffffffff
	lda	[%i0+%g0]0x80,%f18	! %f18 = 00000043
!	Mem[0000000030041410] = 00000ace, %l7 = 0000000000620000
	lduwa	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000ace
!	Mem[0000000021800100] = ffff5371, %l0 = 000000000000017c
	ldsb	[%o3+0x101],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010001414] = 000000ff, %l3 = 00000000ff000000
	ldsh	[%i0+0x014],%l3		! %l3 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %f15 = 00000000
	lda	[%i6+%o4]0x81,%f15	! %f15 = 00000000
!	Mem[0000000010141400] = 43e9efff21ffffff, %l1 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = 43e9efff21ffffff
!	Mem[0000000010101420] = ffffffff, %l6 = ffffffffffffffff
	ldsh	[%i4+0x022],%l6		! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = ffffffff, %l7 = 00000ace, Mem[00000000100c1410] = 000000ff 00000000
	stda	%l6,[%i3+0x010]%asi	! Mem[00000000100c1410] = ffffffff 00000ace

p0_label_352:
!	%l0 = ffffffffffffffff, Mem[0000000010081400] = 6379e6d9
	stwa	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff
!	%l2 = 00000000000000ff, Mem[00000000100c1410] = ffffffff
	stwa	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	%l0 = ffffffffffffffff, Mem[0000000030041410] = ce0a0000
	stha	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = ce0affff
!	%l0 = ffffffffffffffff, Mem[00000000300c1408] = ff00ffff00000000
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffffffffffff
!	Mem[00000000300c1410] = cfad0000, %l7 = 0000000000000ace
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 00000000cfad0000
!	%l5 = fffffffffffffe83, Mem[0000000010001408] = 00000ace00000000
	stx	%l5,[%i0+%o4]		! Mem[0000000010001408] = fffffffffffffe83
!	%l3 = 0000000000000000, Mem[00000000100c1408] = ffba1b43
	stha	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffba0000
!	Mem[0000000010081400] = ffffffff, %l1 = 43e9efff21ffffff
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010141410] = 431bfaff00ff0000, %l6 = ffffffffffffffff, %l4 = 000000ff00000000
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = 431bfaff00ff0000
!	Starting 10 instruction Load Burst
!	%l5 = fffffffffffffe83, Mem[0000000010001410] = 8f23fdff
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = fffffe83

p0_label_353:
!	Mem[0000000010001408] = ffffffff, %l0 = ffffffffffffffff
	ldsba	[%i0+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001408] = adcf2b33ffff0000, %f2  = fffd238f 000000ff
	ldda	[%i0+%o4]0x81,%f2 	! %f2  = adcf2b33 ffff0000
!	Mem[0000000010081420] = ffba1b43, %f1  = 43000000
	lda	[%i2+0x020]%asi,%f1 	! %f1 = ffba1b43
!	Mem[0000000010001424] = 38ea007b, %l2 = 00000000000000ff
	ldsw	[%i0+0x024],%l2		! %l2 = 0000000038ea007b
!	Mem[0000000030141400] = ff00000000000000, %l7 = 00000000cfad0000
	ldxa	[%i5+%g0]0x81,%l7	! %l7 = ff00000000000000
!	Mem[0000000021800080] = ffff05ff, %l7 = ff00000000000000
	lduba	[%o3+0x081]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %f29 = 00000000
	lda	[%i6+%g0]0x80,%f29	! %f29 = 00000000
!	Mem[0000000020800000] = 43ff779a, %l5 = fffffffffffffe83
	lduh	[%o1+%g0],%l5		! %l5 = 00000000000043ff
!	Mem[00000000100c1400] = 00ff0000, %l0 = ffffffffffffffff
	ldsba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f27 = d9e67963, Mem[0000000010041410] = ce0affba
	sta	%f27,[%i1+0x010]%asi	! Mem[0000000010041410] = d9e67963

p0_label_354:
!	%l4 = 431bfaff00ff0000, Mem[0000000010101400] = fd8308f0c6f3ecaf
	stxa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 431bfaff00ff0000
!	%f12 = ff000000 ff00ffff, Mem[0000000010081400] = 21ffffff 00000000
	stda	%f12,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000 ff00ffff
!	%f18 = 00000043, Mem[00000000100c1438] = ffffff00
	sta	%f18,[%i3+0x038]%asi	! Mem[00000000100c1438] = 00000043
!	Mem[00000000100c141c] = ff000000, %l6 = ffffffffffffffff
	ldsha	[%i3+0x01c]%asi,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010081405] = ff00ffff, %l2 = 0000000038ea007b
	ldstuba	[%i2+0x005]%asi,%l2	! %l2 = 00000000000000ff
!	%l4 = 431bfaff00ff0000, Mem[0000000010141400] = ffffff21
	stha	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000ff21
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010181408] = ffffffff 000000ff
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 00000000
!	%f6  = 00000000, Mem[0000000030101410] = 00000000
	sta	%f6 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%l2 = 0000000000000000, Mem[0000000021800000] = ff00b994, %asi = 80
	stba	%l2,[%o3+0x000]%asi	! Mem[0000000021800000] = 0000b994
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000 000000ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000 00000000000000ff

p0_label_355:
!	%l3 = 00000000000000ff, %l3 = 00000000000000ff, %y  = ff000000
	udiv	%l3,%l3,%l1		! %l1 = 00000000ffffffff
	mov	%l0,%y			! %y = 00000000
!	Mem[00000000100c1400] = 00ff0000, %l7 = 00000000000000ff
	lduwa	[%i3+0x000]%asi,%l7	! %l7 = 0000000000ff0000
!	%f30 = ffba1b43, %f3  = ffff0000, %f6  = 00000000
	fsubs	%f30,%f3 ,%f6 		! %f6  = fffa1b43
!	Mem[0000000010101400] = 431bfaff00ff0000, %l1 = 00000000ffffffff
	ldxa	[%i4+%g0]0x80,%l1	! %l1 = 431bfaff00ff0000
!	Code Fragment 3
p0_fragment_39:
!	%l0 = 0000000000000000
	setx	0x338415202c3f292b,%g7,%l0 ! %l0 = 338415202c3f292b
!	%l1 = 431bfaff00ff0000
	setx	0xb7fda6b7b75ad57e,%g7,%l1 ! %l1 = b7fda6b7b75ad57e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 338415202c3f292b
	setx	0x74678de007633907,%g7,%l0 ! %l0 = 74678de007633907
!	%l1 = b7fda6b7b75ad57e
	setx	0xcfc8453fbb2f8dda,%g7,%l1 ! %l1 = cfc8453fbb2f8dda
!	Mem[0000000010081408] = ffff0000, %l3 = 00000000000000ff
	ldswa	[%i2+%o4]0x80,%l3	! %l3 = ffffffffffff0000
!	%l6 = ffffffffffffff00, immed = fffff6c0, %y  = 00000000
	smul	%l6,-0x940,%l1		! %l1 = 0000000000094000, %y = 00000000
!	Mem[0000000030081410] = 00000000, %f16 = fd8308f0
	lda	[%i2+%o5]0x89,%f16	! %f16 = 00000000
!	Mem[0000000030041400] = 00000000, %l0 = 74678de007633907
	lduwa	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ffffff0b, %l0 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000ffffff0b

p0_label_356:
!	%f12 = ff000000 ff00ffff, Mem[0000000030041410] = ce0affff 00000000
	stda	%f12,[%i1+%o5]0x89	! Mem[0000000030041410] = ff000000 ff00ffff
!	Mem[0000000030101408] = ff1bbaff, %l3 = ffffffffffff0000
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 00000000ff1bbaff
!	Mem[00000000201c0000] = ff433e5d, %l3 = 00000000ff1bbaff
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	%l6 = ffffff00, %l7 = 00ff0000, Mem[0000000010101438] = ffba1b43 ffff8900
	std	%l6,[%i4+0x038]		! Mem[0000000010101438] = ffffff00 00ff0000
!	%f6  = fffa1b43 431bbaff, %l5 = 00000000000043ff
!	Mem[0000000030181418] = 89a568315c11a999
	add	%i6,0x018,%g1
	stda	%f6,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030181418] = ffba1b43431bfaff
!	%f8  = 00000000 ff000000, Mem[0000000030141410] = fbff0000 00000000
	stda	%f8 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 ff000000
!	%f8  = 00000000 ff000000, %l7 = 0000000000ff0000
!	Mem[0000000010181400] = 00000000ff000000
	stda	%f8,[%i6+%l7]ASI_PST32_P ! Mem[0000000010181400] = 00000000ff000000
!	Mem[0000000010141408] = ff000000, %l0 = 00000000ffffff0b
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010181434] = ff000000, %l4 = 431bfaff00ff0000, %asi = 80
	swapa	[%i6+0x034]%asi,%l4	! %l4 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000ff00000000, %f16 = 00000000 c6f3ecaf
	ldda	[%i5+%o5]0x89,%f16	! %f16 = 000000ff 00000000

p0_label_357:
!	Mem[0000000030041400] = 00000000, %l7 = 0000000000ff0000
	lduba	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c141c] = ff000000, %l2 = 0000000000000000
	lduba	[%i3+0x01c]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = 00000000ff000000, %f4  = 00000000 00000000
	ldd	[%i6+%g0],%f4 		! %f4  = 00000000 ff000000
!	Mem[0000000010041410] = d9e67963, %f28 = ff00ffff
	lda	[%i1+%o5]0x80,%f28	! %f28 = d9e67963
!	Mem[0000000010101410] = 0000ff00, %l2 = 00000000000000ff
	ldsba	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = ff0000ff00000000, %f22 = 00000000 00000000
	ldda	[%i6+%o5]0x81,%f22	! %f22 = ff0000ff 00000000
!	Mem[0000000010141410] = fffa1b43, %f9  = ff000000
	lda	[%i5+%o5]0x88,%f9 	! %f9 = fffa1b43
!	Mem[0000000010081410] = 0000cc53, %l2 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l2	! %l2 = 000000000000cc53
!	Mem[0000000010081408] = 000000000000ffff, %l7 = 0000000000000000
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 00000000, %l1 = 0000000000094000
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000

p0_label_358:
!	%l3 = 00000000000000ff, Mem[0000000030141410] = 00000000
	stba	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	%f0  = 00ff0000 ffba1b43, Mem[0000000030101400] = 431bbaff 1b000000
	stda	%f0 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 00ff0000 ffba1b43
!	Mem[0000000010101428] = ffffff00, %l1 = 0000000000000000
	ldstub	[%i4+0x028],%l1		! %l1 = 000000ff000000ff
!	Mem[0000000010001408] = ffffffff, %l0 = 00000000ff000000
	ldstuba	[%i0+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000100c1408] = ffba0000, %l7 = 000000000000ffff
	ldstuba	[%i3+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%f24 = ffffffff ffffffff, %l7 = 0000000000000000
!	Mem[0000000030041400] = 00000000ff000000
	stda	%f24,[%i1+%l7]ASI_PST32_S ! Mem[0000000030041400] = 00000000ff000000
!	%f24 = ffffffff ffffffff, Mem[0000000030001400] = f00883fd afecf3c6
	stda	%f24,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffff ffffffff
!	%l3 = 00000000000000ff, Mem[0000000030141410] = ff000000
	stba	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000
!	Mem[0000000030001410] = 00ff0000, %l4 = 00000000ff000000
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_359:
!	Mem[0000000030101400] = 00ff0000ffba1b43, %l2 = 000000000000cc53
	ldxa	[%i4+%g0]0x89,%l2	! %l2 = 00ff0000ffba1b43
!	Mem[0000000010041410] = 6379e6d9, %l5 = 00000000000043ff
	ldswa	[%i1+%o5]0x88,%l5	! %l5 = 000000006379e6d9
!	Mem[0000000020800000] = 43ff779a, %l6 = ffffffffffffff00
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = 00000000000043ff
!	Mem[0000000030141410] = ff000000, %f0  = 00ff0000
	lda	[%i5+%o5]0x81,%f0 	! %f0 = ff000000
!	Mem[0000000010081410] = 53cc0000332bcfad, %l4 = 0000000000000000
	ldx	[%i2+%o5],%l4		! %l4 = 53cc0000332bcfad
!	Mem[0000000020800000] = 43ff779a, %l0 = 00000000000000ff
	lduh	[%o1+%g0],%l0		! %l0 = 00000000000043ff
!	Mem[0000000021800100] = ffff5371, %l2 = 00ff0000ffba1b43
	lduh	[%o3+0x100],%l2		! %l2 = 000000000000ffff
!	%l5 = 000000006379e6d9, %l3 = 00000000000000ff, %l5 = 000000006379e6d9
	addc	%l5,%l3,%l5		! %l5 = 000000006379e7d8
!	Mem[0000000010141410] = 431bfaff, %f22 = ff0000ff
	lda	[%i5+%o5]0x80,%f22	! %f22 = 431bfaff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 431bfaff, %l7 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l7	! %l7 = 00000043000000ff

p0_label_360:
!	Mem[0000000030081410] = 00000000, %l4 = 53cc0000332bcfad
	ldstuba	[%i2+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010141400] = 21ff0000
	stba	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 21ff0000
!	Mem[0000000010141428] = 000000009cffb778, %l7 = 0000000000000043, %l6 = 00000000000043ff
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = 000000009cffb778
!	Mem[0000000010001400] = 43000000, %l2 = 000000000000ffff
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 0000000043000000
!	Mem[00000000100c1410] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000000000000043, Mem[0000000010101418] = 0000000000000000, %asi = 80
	stxa	%l7,[%i4+0x018]%asi	! Mem[0000000010101418] = 0000000000000043
!	%f5  = ff000000, Mem[0000000030081410] = ff000000
	sta	%f5 ,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	%l1 = 00000000000000ff, Mem[0000000010001438] = 00000000431bbaff, %asi = 80
	stxa	%l1,[%i0+0x038]%asi	! Mem[0000000010001438] = 00000000000000ff
!	Mem[00000000300c1408] = ffffffff, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181414] = 00000000, %l1 = 00000000000000ff
	lduwa	[%i6+0x014]%asi,%l1	! %l1 = 0000000000000000

p0_label_361:
!	Mem[0000000030081410] = 000000ff, %l7 = 0000000000000043
	ldswa	[%i2+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141400] = 0000ff21, %l3 = 00000000000000ff
	ldsh	[%i5+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000010081420] = ffba1b43 000000ff, %l0 = 000043ff, %l1 = 00000000
	ldda	[%i2+0x020]%asi,%l0	! %l0 = 00000000ffba1b43 00000000000000ff
!	Mem[0000000010001400] = ffff0000, %l7 = 00000000000000ff
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041408] = ad000000, %l1 = 00000000000000ff
	lduwa	[%i1+%o4]0x88,%l1	! %l1 = 00000000ad000000
!	Mem[0000000030001400] = ffffffff ffffffff, %l6 = 9cffb778, %l7 = ffffffff
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010181410] = 0000000000000000, %l1 = 00000000ad000000
	ldx	[%i6+%o5],%l1		! %l1 = 0000000000000000
!	Mem[0000000010081408] = ffff0000, %l1 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l1	! %l1 = 00000000ffff0000
!	Mem[0000000010001424] = 38ea007b, %l4 = 00000000ffffffff
	lduba	[%i0+0x027]%asi,%l4	! %l4 = 000000000000007b
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 0000ffff, %l7 = 00000000ffffffff
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ff

p0_label_362:
!	Code Fragment 4
p0_fragment_40:
!	%l0 = 00000000ffba1b43
	setx	0x9cf5139008cd3e4a,%g7,%l0 ! %l0 = 9cf5139008cd3e4a
!	%l1 = 00000000ffff0000
	setx	0x8493d5cfa9e926ee,%g7,%l1 ! %l1 = 8493d5cfa9e926ee
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9cf5139008cd3e4a
	setx	0x52a2afd047d4fa03,%g7,%l0 ! %l0 = 52a2afd047d4fa03
!	%l1 = 8493d5cfa9e926ee
	setx	0xcbdcd5303233b999,%g7,%l1 ! %l1 = cbdcd5303233b999
!	%l2 = 0000000043000000, Mem[0000000010041408] = ff000000ad000000
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000043000000
!	%l6 = 00000000ffffffff, Mem[0000000010001400] = 0000ffff
	stwa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffff
!	%l0 = 52a2afd047d4fa03, Mem[0000000010041414] = f00883fd, %asi = 80
	stwa	%l0,[%i1+0x014]%asi	! Mem[0000000010041414] = 47d4fa03
!	%f24 = ffffffff ffffffff, Mem[0000000030101400] = ffba1b43 00ff0000
	stda	%f24,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff ffffffff
!	%f5  = ff000000, %f27 = d9e67963, %f25 = ffffffff
	fdivs	%f5 ,%f27,%f25		! %f25 = 648e2d2c
!	%f20 = 0000ff00 fffa1b43, Mem[0000000010001430] = ffff00ff 0000002f
	std	%f20,[%i0+0x030]	! Mem[0000000010001430] = 0000ff00 fffa1b43
!	Mem[0000000010001400] = ffffffff, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l3	! %l3 = 00000000ffffffff
!	%f8  = 00000000 fffa1b43, Mem[00000000300c1400] = 000000ff 000000ff
	stda	%f8 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 fffa1b43
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000ffff00ff, %l7 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l7	! %l7 = 00000000ffff00ff

p0_label_363:
!	Mem[0000000010181400] = 000000ff00000000, %f26 = ffffff00 d9e67963
	ldda	[%i6+%g0]0x88,%f26	! %f26 = 000000ff 00000000
!	Mem[00000000300c1400] = 00000000, %l4 = 000000000000007b
	ldsba	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = cfad0000, %l0 = 52a2afd047d4fa03
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 000000000000cfad
!	Mem[0000000030081410] = 000000ff, %l0 = 000000000000cfad
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1400] = 00000000, %l7 = 00000000ffff00ff
	lduba	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 21ff0000, %l0 = ffffffffffffffff
	ldswa	[%i5+%g0]0x88,%l0	! %l0 = 0000000021ff0000
!	Mem[0000000010181410] = 00000000, %l6 = 00000000ffffffff
	lduwa	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000218001c0] = 00ffa57a, %l4 = 0000000000000000
	lduh	[%o3+0x1c0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010041400] = 00000000 00000000, %l0 = 21ff0000, %l1 = 3233b999
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 0000c6ff, %l6 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 000000ff000000ff

p0_label_364:
!	%l0 = 0000000000000000, Mem[0000000020800040] = ffff726d, %asi = 80
	stba	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = 00ff726d
!	Mem[0000000010081408] = 0000ffff, %l5 = 000000006379e7d8
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 000000000000ffff
!	%f12 = ff000000 ff00ffff, Mem[0000000010181428] = 00000000 0000007b
	stda	%f12,[%i6+0x028]%asi	! Mem[0000000010181428] = ff000000 ff00ffff
!	%f0  = ff000000 ffba1b43, %l0 = 0000000000000000
!	Mem[0000000010001420] = ffff890038ea007b
	add	%i0,0x020,%g1
	stda	%f0,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010001420] = ffff890038ea007b
!	%f14 = d40000ff 00000000, Mem[0000000010001410] = fffffe83 ff000000
	stda	%f14,[%i0+%o5]0x88	! Mem[0000000010001410] = d40000ff 00000000
!	%f8  = 00000000, %f6  = fffa1b43, %f28 = d9e67963 00000000
	fsmuld	%f8 ,%f6 ,%f28		! %f28 = ffff4368 60000000
!	%l4 = 00000000000000ff, Mem[0000000010101410] = 0000ff00
	stha	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ffff00
!	Mem[00000000201c0000] = ff433e5d, %l0 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffff43
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = 0000ff00
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000, %l1 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffff00

p0_label_365:
!	Mem[0000000010141408] = ffffff0b, %l5 = 000000000000ffff
	ldsba	[%i5+%o4]0x88,%l5	! %l5 = 000000000000000b
!	Mem[00000000100c1408] = ff00baffffffffff, %l6 = 00000000000000ff
	ldxa	[%i3+%o4]0x80,%l6	! %l6 = ff00baffffffffff
!	Mem[0000000010041400] = 00000000, %l3 = 00000000ffffffff
	ldsha	[%i1+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = 00000000 ff000000, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[0000000010041400] = 00000000 00000000, %l2 = 43000000, %l3 = 00000000
	ldd	[%i1+%g0],%l2		! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010101424] = ffffffff, %l5 = 000000000000000b
	lduh	[%i4+0x026],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010001410] = 00000000, %l7 = 00000000ff000000
	lduba	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = ffc60000, %l0 = ffffffffffffff43
	lduba	[%i6+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001408] = fffffffffffffe83, %f16 = 000000ff 00000000
	ldda	[%i0+%o4]0x80,%f16	! %f16 = ffffffff fffffe83
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff00, Mem[0000000010141430] = 00680089ff0000d4, %asi = 80
	stxa	%l1,[%i5+0x030]%asi	! Mem[0000000010141430] = ffffffffffffff00

p0_label_366:
!	%l4 = 00000000000000ff, Mem[0000000030081408] = 00000000
	stba	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000
!	%l6 = 0000000000000000, Mem[0000000030141400] = 00000000000000ff
	stxa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	Mem[0000000030141408] = 0000adcf, %l3 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l3	! %l3 = 000000cf000000ff
!	Mem[00000000100c1408] = ff00baff, %l0 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l0	! %l0 = 00000000ff00baff
!	Mem[0000000010141400] = 21ff0000, %l0 = 00000000ff00baff
	ldstuba	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000, %l1 = ffffff00, Mem[0000000030141408] = 0000adff 00000000
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 ffffff00
!	%l5 = 000000000000ffff, Mem[0000000010001408] = ffffffff
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000ffff
!	%l4 = 00000000000000ff, Mem[0000000030101400] = ffffffff
	stwa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	%f0  = ff000000, Mem[00000000100c1408] = 000000ff
	sta	%f0 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000000, %f30 = ffba1b43
	lda	[%i5+%o5]0x81,%f30	! %f30 = ff000000

p0_label_367:
!	Mem[0000000030041400] = 00000000, %f31 = ffff8900
	lda	[%i1+%g0]0x89,%f31	! %f31 = 00000000
!	Mem[0000000010101400] = ff1bfaff, %f1  = ffba1b43
	lda	[%i4+%g0]0x80,%f1 	! %f1 = ff1bfaff
!	Mem[0000000030081400] = 00000000, %l0 = 0000000000000000
	lduha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = ff0000ff, %l6 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041404] = 00000000, %f14 = d40000ff
	ld	[%i1+0x004],%f14	! %f14 = 00000000
!	Mem[0000000010041410] = 6379e6d9, %l4 = 00000000000000ff
	ldswa	[%i1+%o5]0x88,%l4	! %l4 = 000000006379e6d9
!	Mem[0000000010041438] = 006800ff00000000, %f6  = fffa1b43 431bbaff
	ldd	[%i1+0x038],%f6 	! %f6  = 006800ff 00000000
!	Mem[0000000010141430] = ffffffff, %l7 = 0000000000000000
	lduh	[%i5+0x030],%l7		! %l7 = 000000000000ffff
!	Mem[0000000010141428] = 00000000, %l2 = 0000000000000000
	ldub	[%i5+0x029],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_41:
!	%l0 = 0000000000000000
	setx	0xb5b50087bb20c23d,%g7,%l0 ! %l0 = b5b50087bb20c23d
!	%l1 = ffffffffffffff00
	setx	0xedc3c8a05ceba585,%g7,%l1 ! %l1 = edc3c8a05ceba585
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b5b50087bb20c23d
	setx	0x7dbda70057eb9e8c,%g7,%l0 ! %l0 = 7dbda70057eb9e8c
!	%l1 = edc3c8a05ceba585
	setx	0xca13c297f549639c,%g7,%l1 ! %l1 = ca13c297f549639c

p0_label_368:
!	%f29 = 60000000, Mem[0000000010101400] = ff1bfaff
	sta	%f29,[%i4+%g0]0x80	! Mem[0000000010101400] = 60000000
!	%l7 = 000000000000ffff, Mem[0000000010141400] = 43e9efff21ff00ff
	stxa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000000000ffff
!	%f15 = 00000000, Mem[0000000010081410] = 53cc0000
	sta	%f15,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Mem[0000000010101410] = 00ffff00, %l3 = 00000000000000cf
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l6 = ffffffffffffffff, Mem[0000000010101410] = 00ffffff
	stwa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff
!	%l2 = 00000000, %l3 = 00000000, Mem[00000000100c1410] = ff0000ff 00000ace
	stda	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 00000000
!	%l0 = 57eb9e8c, %l1 = f549639c, Mem[0000000030101400] = ff000000 ffffffff
	stda	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 57eb9e8c f549639c
!	Mem[0000000010101428] = ffffff00, %l5 = 000000000000ffff, %asi = 80
	swapa	[%i4+0x028]%asi,%l5	! %l5 = 00000000ffffff00
!	Mem[0000000010081428] = 0000ff00, %l7 = 000000000000ffff, %asi = 80
	swapa	[%i2+0x028]%asi,%l7	! %l7 = 000000000000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010001434] = fffa1b43, %l7 = 000000000000ff00
	ldsba	[%i0+0x035]%asi,%l7	! %l7 = fffffffffffffffa

p0_label_369:
!	Mem[0000000010081408] = d8e77963, %l3 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l3	! %l3 = ffffffffffffd8e7
!	Mem[0000000010181420] = 00000000000000ff, %l6 = ffffffffffffffff
	ldx	[%i6+0x020],%l6		! %l6 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = ffffffffffffffff, %l3 = ffffffffffffd8e7
	ldxa	[%i0+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1410] = 00000ace, %l1 = ca13c297f549639c
	ldsha	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000ace
!	Mem[0000000010181400] = 00000000, %f31 = 00000000
	lda	[%i6+%g0]0x88,%f31	! %f31 = 00000000
!	Mem[0000000010141408] = ffffff0b, %l5 = 00000000ffffff00
	ldsba	[%i5+%o4]0x88,%l5	! %l5 = 000000000000000b
!	Mem[0000000030001400] = ffffffff, %l0 = 7dbda70057eb9e8c
	ldsba	[%i0+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181410] = 00000000, %f4  = 00000000
	lda	[%i6+%o5]0x80,%f4 	! %f4 = 00000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000030101400] = 57eb9e8c f549639c
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 ffffffff

p0_label_370:
!	Mem[0000000030041408] = ffff00ff, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 00000000ffff00ff
!	%f16 = ffffffff fffffe83, %l4 = 000000006379e6d9
!	Mem[00000000100c1408] = ff000000ffffffff
	add	%i3,0x008,%g1
	stda	%f16,[%g1+%l4]ASI_PST32_PL ! Mem[00000000100c1408] = 83feffffffffffff
!	%l5 = 000000000000000b, Mem[0000000010141434] = ffffff00
	stw	%l5,[%i5+0x034]		! Mem[0000000010141434] = 0000000b
!	Mem[0000000010001408] = ffff0000, %l1 = 0000000000000ace
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	%f22 = 431bfaff 00000000, Mem[0000000010101418] = 00000000 00000043
	stda	%f22,[%i4+0x018]%asi	! Mem[0000000010101418] = 431bfaff 00000000
!	Code Fragment 4
p0_fragment_42:
!	%l0 = ffffffffffffffff
	setx	0x8d59c22056331332,%g7,%l0 ! %l0 = 8d59c22056331332
!	%l1 = 00000000000000ff
	setx	0x8f40c4307b4db525,%g7,%l1 ! %l1 = 8f40c4307b4db525
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8d59c22056331332
	setx	0x8cdaacb006941ad5,%g7,%l0 ! %l0 = 8cdaacb006941ad5
!	%l1 = 8f40c4307b4db525
	setx	0xd0a3cfd034f66413,%g7,%l1 ! %l1 = d0a3cfd034f66413
!	Mem[0000000020800041] = 00ff726d, %l3 = ffffffffffffffff
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 000000ff000000ff
!	%f9  = fffa1b43, Mem[0000000010181410] = 00000000
	sta	%f9 ,[%i6+%o5]0x88	! Mem[0000000010181410] = fffa1b43
!	Mem[0000000021800180] = b3ffbce0, %l2 = 00000000ffff00ff
	ldstub	[%o3+0x180],%l2		! %l2 = 000000b3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000 0000ffff, %l0 = 06941ad5, %l1 = 34f66413
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 000000000000ffff 0000000000000000

p0_label_371:
!	Mem[0000000010081400] = ff000000, %l3 = 00000000000000ff
	ldsb	[%i2+0x003],%l3		! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l0 = 000000000000ffff
	ldsba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l0 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = ce0a0000, %f22 = 431bfaff
	lda	[%i3+%o5]0x81,%f22	! %f22 = ce0a0000
!	Mem[00000000300c1400] = 00000000fffa1b43, %f0  = ff000000 ff1bfaff
	ldda	[%i3+%g0]0x81,%f0 	! %f0  = 00000000 fffa1b43
!	Mem[0000000010081408] = d8e77963, %l0 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l0	! %l0 = ffffffffffffd8e7
!	Mem[0000000010101428] = 0000ffff, %l5 = 000000000000000b
	ldsba	[%i4+0x02a]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041410] = ffff00ff, %l1 = 0000000000000000
	ldsba	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181408] = 00000000, %l2 = 00000000000000b3
	ldsha	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffd8e7, Mem[00000000211c0001] = 00ff6880, %asi = 80
	stba	%l0,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00e76880

p0_label_372:
!	%l4 = 000000006379e6d9, Mem[0000000030081410] = ff000000
	stwa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 6379e6d9
!	Mem[00000000100c1400] = ff000000, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	%l6 = 000000ff, %l7 = fffffffa, Mem[0000000030041410] = ff00ffff ff000000
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff fffffffa
!	Mem[00000000300c1408] = 00000000, %l7 = fffffffffffffffa
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%f18 = 00000043, Mem[0000000030041400] = 00000000
	sta	%f18,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000043
!	Mem[0000000010101400] = 60000000, %l6 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 00000060000000ff
!	%f28 = ffff4368 60000000, Mem[0000000030141410] = 000000ff 000000ff
	stda	%f28,[%i5+%o5]0x89	! Mem[0000000030141410] = ffff4368 60000000
!	%f6  = 006800ff 00000000, Mem[0000000010141400] = 0000ffff 00000000
	stda	%f6 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 006800ff 00000000
!	%l7 = 0000000000000000, Mem[0000000010101408] = ffff00ff
	stha	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = ffff0000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff433e5d, %l2 = 0000000000000000
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000043

p0_label_373:
!	Mem[00000000211c0000] = 00e76880, %l6 = 0000000000000060
	ldsba	[%o2+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 6379e6d9, %l1 = ffffffffffffffff
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000063
!	Mem[0000000010041410] = 6379e6d9, %l5 = ffffffffffffffff
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 000000006379e6d9
!	Mem[0000000030001408] = 0000ffff332bcfad, %f4  = 00000000 ff000000
	ldda	[%i0+%o4]0x89,%f4 	! %f4  = 0000ffff 332bcfad
!	Mem[0000000010081410] = 00000000332bcfad, %f0  = 00000000 fffa1b43
	ldda	[%i2+%o5]0x80,%f0 	! %f0  = 00000000 332bcfad
!	Mem[0000000010141410] = 0000ff00 fffa1b43, %l0 = ffffd8e7, %l1 = 00000063
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 00000000fffa1b43 000000000000ff00
!	Mem[00000000201c0000] = ff433e5d, %l5 = 000000006379e6d9
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000ff43
!	Mem[0000000030181408] = 00400900, %l2 = 0000000000000043
	ldsha	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000040
!	Mem[0000000010041408] = 00000043, %l7 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000043
!	Starting 10 instruction Store Burst
!	%f19 = ffff0000, Mem[0000000010141410] = 431bfaff
	sta	%f19,[%i5+%o5]0x80	! Mem[0000000010141410] = ffff0000

p0_label_374:
!	Mem[0000000010081414] = 332bcfad, %l4 = 000000006379e6d9, %asi = 80
	swapa	[%i2+0x014]%asi,%l4	! %l4 = 00000000332bcfad
!	Mem[0000000030141408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101410] = ffffffff, %l2 = 0000000000000040
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000030101410] = 00000000, %l2 = 00000000ffffffff
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 0000ffff, %l0 = 00000000fffa1b43
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 000000000000ffff
!	Mem[00000000100c1400] = 00000000, %l4 = 00000000332bcfad
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[000000001008141c] = aeba1b43, %asi = 80
	stba	%l2,[%i2+0x01c]%asi	! Mem[000000001008141c] = 00ba1b43
!	%l1 = 000000000000ff00, Mem[00000000100c1408] = fffffffffffffe83
	stxa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000000000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l7 = 0000000000000043
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000

p0_label_375:
!	Mem[0000000010081410] = 00000000, %l4 = 0000000000000000
	lduha	[%i2+0x012]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = fffa1b43, %l7 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l7	! %l7 = 0000000000001b43
!	Mem[00000000300c1400] = 00000000, %f3  = ffff0000
	lda	[%i3+%g0]0x89,%f3 	! %f3 = 00000000
!	%l7 = 0000000000001b43, imm = 0000000000000ae3, %l3 = 00000000ff000000
	or	%l7,0xae3,%l3		! %l3 = 0000000000001be3
!	Mem[0000000010081418] = affff3c6, %l2 = 0000000000000000
	lduh	[%i2+0x018],%l2		! %l2 = 000000000000afff
!	Mem[0000000010101400] = ff00000000ff0000, %f4  = 0000ffff 332bcfad
	ldda	[%i4+%g0]0x80,%f4 	! %f4  = ff000000 00ff0000
!	Mem[0000000030181400] = 0000c6ff, %f26 = 000000ff
	lda	[%i6+%g0]0x89,%f26	! %f26 = 0000c6ff
!	%l6 = 0000000000000000, %l2 = 000000000000afff, %y  = 00000000
	umul	%l6,%l2,%l7		! %l7 = 0000000000000000, %y = 00000000
!	Mem[0000000030041408] = 00000000, %l6 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = ffffffff fffffe83, Mem[0000000010041410] = d9e67963 47d4fa03
	stda	%f16,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffff fffffe83

p0_label_376:
!	%l1 = 000000000000ff00, Mem[0000000030041410] = fffffffa000000ff
	stxa	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000000000ff00
!	%l0 = 000000000000ffff, Mem[0000000010141425] = 0000001b
	stb	%l0,[%i5+0x025]		! Mem[0000000010141424] = 00ff001b
!	%l4 = 00000000, %l5 = 0000ff43, Mem[0000000010101410] = 40000000 431bfaff
	stda	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 0000ff43
!	%l5 = 000000000000ff43, Mem[0000000030041408] = 00ff000000000000
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000000000ff43
!	Mem[0000000010001410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181408] = 00094000, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 0000000000094000
!	%f1  = 332bcfad, Mem[0000000010101410] = 00000000
	st	%f1 ,[%i4+%o5]		! Mem[0000000010101410] = 332bcfad
!	Mem[0000000010141420] = ffba1b43, %l1 = 000000000000ff00
	swap	[%i5+0x020],%l1		! %l1 = 00000000ffba1b43
!	%l1 = 00000000ffba1b43, Mem[0000000010181408] = 00000000
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000043
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000 ffffffff, %l4 = 00094000, %l5 = 0000ff43
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff000000 00000000ffffffff

p0_label_377:
!	Mem[0000000010141430] = ffffffff, %l7 = 0000000000000000
	ldsha	[%i5+0x030]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181414] = 00000000, %l0 = 000000000000ffff
	ldsba	[%i6+0x014]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 00000000431bbaff, %l3 = 0000000000001be3
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = 00000000431bbaff
!	Mem[0000000030001408] = 332bcfad, %f12 = ff000000
	lda	[%i0+%o4]0x89,%f12	! %f12 = 332bcfad
!	Mem[0000000030181408] = 00000000, %l6 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l4 = 00000000ff000000, %l1 = 00000000ffba1b43, %l1 = 00000000ffba1b43
	orn	%l4,%l1,%l1		! %l1 = ffffffffff45e4bc
!	Mem[0000000010141410] = 0000ff000000ffff, %l6 = 0000000000000000
	ldxa	[%i5+%o5]0x88,%l6	! %l6 = 0000ff000000ffff
!	Mem[0000000010041408] = 00000043, %l2 = 000000000000afff
	ldub	[%i1+%o4],%l2		! %l2 = 0000000000000000
!	Mem[0000000030141408] = ff000000, %f3  = 00000000
	lda	[%i5+%o4]0x81,%f3 	! %f3 = ff000000
!	Starting 10 instruction Store Burst
!	%f26 = 0000c6ff 00000000, Mem[0000000030141400] = 00000000 00000000
	stda	%f26,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000c6ff 00000000

p0_label_378:
!	Mem[0000000030041400] = 43000000, %l3 = 00000000431bbaff
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 00000043000000ff
!	%l0 = 0000000000000000, Mem[00000000211c0001] = 00e76880
	stb	%l0,[%o2+0x001]		! Mem[00000000211c0000] = 00006880
!	%f26 = 0000c6ff, Mem[00000000100c1408] = 00ff0000
	sta	%f26,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000c6ff
!	%f12 = 332bcfad, %f12 = 332bcfad, %f14 = 00000000
	fadds	%f12,%f12,%f14		! %f14 = 33abcfad
!	%l4 = 00000000ff000000, Mem[0000000030081408] = ff000000
	stba	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	Mem[00000000201c0000] = ff433e5d, %l4 = 00000000ff000000
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000010041408] = 43000000
	stwa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000010181413] = 431bfaff, %l1 = ffffffffff45e4bc
	ldstuba	[%i6+0x013]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000201c0001] = ff433e5d, %l5 = 00000000ffffffff
	ldstub	[%o0+0x001],%l5		! %l5 = 00000043000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00ff00ff, %l4 = 00000000000000ff
	ldsha	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff

p0_label_379:
!	Mem[0000000010141408] = 0bffffff, %l2 = 0000000000000000
	ldswa	[%i5+%o4]0x80,%l2	! %l2 = 000000000bffffff
!	Mem[0000000010101408] = ffff0000, %l1 = 00000000000000ff
	ldsba	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 6379e6d9, %l0 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000063
!	Mem[0000000010081408] = d8e77963, %l0 = 0000000000000063
	ldsba	[%i2+%o4]0x80,%l0	! %l0 = ffffffffffffffd8
!	Mem[0000000010101408] = 0000ffff ffff0000, %l4 = 000000ff, %l5 = 00000043
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 000000000000ffff 00000000ffff0000
!	Mem[0000000021800080] = ffff05ff, %l4 = 000000000000ffff
	ldsba	[%o3+0x081]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001410] = ff000000 ff0000d4, %l2 = 0bffffff, %l3 = 00000043
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 00000000ff000000 00000000ff0000d4
!	%l6 = 0000ff000000ffff, %l2 = 00000000ff000000, %l3 = 00000000ff0000d4
	subc	%l6,%l2,%l3		! %l3 = 0000feff0100ffff
!	Code Fragment 3
p0_fragment_43:
!	%l0 = ffffffffffffffd8
	setx	0xe73e926ff1c89d8e,%g7,%l0 ! %l0 = e73e926ff1c89d8e
!	%l1 = 0000000000000000
	setx	0xad877cbfb17b05b8,%g7,%l1 ! %l1 = ad877cbfb17b05b8
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e73e926ff1c89d8e
	setx	0x04230aefd64e1cf6,%g7,%l0 ! %l0 = 04230aefd64e1cf6
!	%l1 = ad877cbfb17b05b8
	setx	0x5150050fdca86fdc,%g7,%l1 ! %l1 = 5150050fdca86fdc
!	Starting 10 instruction Store Burst
!	%f14 = 33abcfad, Mem[0000000030001400] = ffffffff
	sta	%f14,[%i0+%g0]0x81	! Mem[0000000030001400] = 33abcfad

p0_label_380:
!	Mem[0000000010041410] = ffffffff, %l7 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	%f12 = 332bcfad ff00ffff, Mem[0000000010181410] = 431bfaff 00000000
	std	%f12,[%i6+%o5]	! Mem[0000000010181410] = 332bcfad ff00ffff
!	%l1 = 5150050fdca86fdc, Mem[0000000030101400] = 00000000
	stba	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000dc
!	%l6 = 0000ffff, %l7 = 000000ff, Mem[00000000100c1430] = d9cf2b33 00000000
	std	%l6,[%i3+0x030]		! Mem[00000000100c1430] = 0000ffff 000000ff
!	Mem[0000000010081408] = d8e77963, %l0 = 04230aefd64e1cf6
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 00000000d8e77963
!	Mem[000000001018140b] = 43000000, %l7 = 00000000000000ff
	ldstuba	[%i6+0x00b]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181408] = ff000043, %l3 = 0000feff0100ffff
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 00000043000000ff
!	Mem[0000000030101408] = 0000ffff, %l2 = 00000000ff000000
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 000000000000ffff
!	Mem[00000000100c1408] = 0000c6ff, %l0 = 00000000d8e77963
	swapa	[%i3+%o4]0x80,%l0	! %l0 = 000000000000c6ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000fff00883fd, %l5 = 00000000ffff0000
	ldxa	[%i4+%o4]0x81,%l5	! %l5 = 000000fff00883fd

p0_label_381:
!	Mem[0000000010001408] = fffa1b43, %l3 = 0000000000000043
	ldswa	[%i0+%o4]0x88,%l3	! %l3 = fffffffffffa1b43
!	Mem[0000000010101424] = ffffffff, %l1 = 5150050fdca86fdc
	ldsh	[%i4+0x026],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030141408] = ff00000000ffffff, %l7 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l7	! %l7 = ff00000000ffffff
!	Mem[0000000030001408] = adcf2b33, %l5 = 000000fff00883fd
	lduha	[%i0+%o4]0x81,%l5	! %l5 = 000000000000adcf
!	Mem[00000000300c1408] = ffffffff 000000ff, %l6 = 0000ffff, %l7 = 00ffffff
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff 00000000ffffffff
!	Mem[00000000201c0000] = ffff3e5d, %l2 = 000000000000ffff
	lduh	[%o0+%g0],%l2		! %l2 = 000000000000ffff
	membar	#Sync			! Added by membar checker (56)
!	Mem[00000000100c1400] = ff000000 00ff0000 d8e77963 00000000
!	Mem[00000000100c1410] = 00000000 00000000 b78954ff ff000000
!	Mem[00000000100c1420] = 000000ff c6f3ecaf 00004fff ff0000ff
!	Mem[00000000100c1430] = 0000ffff 000000ff 00000043 ffee36da
	ldda	[%i3]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[00000000100c1410] = 00000000, %l4 = ffffffffffffffff
	ldsba	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = adcfab33, %l2 = 000000000000ffff
	lduwa	[%i0+%g0]0x89,%l2	! %l2 = 00000000adcfab33
!	Starting 10 instruction Store Burst
!	%f2  = adcf2b33, Mem[000000001000141c] = ffff0000
	st	%f2 ,[%i0+0x01c]	! Mem[000000001000141c] = adcf2b33

p0_label_382:
!	%f4  = ff000000, Mem[0000000030181400] = ffc60000
	sta	%f4 ,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	%f15 = 00000000, Mem[0000000010081400] = ff000000
	st	%f15,[%i2+%g0]		! Mem[0000000010081400] = 00000000
!	%f10 = 1b000000 431bbaff, %l3 = fffffffffffa1b43
!	Mem[0000000010041410] = fffffffffffffe83
	add	%i1,0x010,%g1
	stda	%f10,[%g1+%l3]ASI_PST8_P ! Mem[0000000010041410] = ff00ffffffffbaff
!	%f15 = 00000000, %f14 = 33abcfad
	fcmpes	%fcc0,%f15,%f14		! %fcc0 = 1
!	%l2 = 00000000adcfab33, Mem[0000000010181410] = 332bcfad, %asi = 80
	stba	%l2,[%i6+0x010]%asi	! Mem[0000000010181410] = 332bcfad
!	Mem[0000000010101400] = ff000000, %l2 = 00000000adcfab33
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010001400] = 00000000, %l0 = 000000000000c6ff
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l6 = 000000ff, %l7 = ffffffff, Mem[0000000010041420] = ffffffff 00000080
	std	%l6,[%i1+0x020]		! Mem[0000000010041420] = 000000ff ffffffff
!	Mem[000000001018143c] = ff000000, %l3 = fffffffffffa1b43
	swap	[%i6+0x03c],%l3		! %l3 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00006880, %l5 = 000000000000adcf
	ldub	[%o2+0x001],%l5		! %l5 = 0000000000000000

p0_label_383:
!	Mem[0000000010081408] = f61c4ed6, %l1 = ffffffffffffffff
	ldswa	[%i2+%o4]0x88,%l1	! %l1 = fffffffff61c4ed6
!	Mem[0000000010141408] = 0bffffff, %l1 = fffffffff61c4ed6
	ldub	[%i5+0x00b],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030181408] = 00000000, %l0 = 0000000000000000
	lduwa	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 00ff00ff, %l4 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001410] = d40000ff000000ff, %f14 = 33abcfad 00000000
	ldda	[%i0+%o5]0x88,%f14	! %f14 = d40000ff 000000ff
!	Mem[0000000030141408] = ffffff00000000ff, %l4 = 00000000000000ff
	ldxa	[%i5+%o4]0x89,%l4	! %l4 = ffffff00000000ff
!	Mem[0000000010001408] = fffa1b43, %f10 = 1b000000
	lda	[%i0+%o4]0x88,%f10	! %f10 = fffa1b43
!	Mem[0000000010001408] = 83fefffffffa1b43, %f10 = fffa1b43 431bbaff
	ldda	[%i0+%o4]0x88,%f10	! %f10 = 83feffff fffa1b43
!	Mem[0000000010041410] = ff00ffffffffbaff, %l7 = 00000000ffffffff
	ldx	[%i1+%o5],%l7		! %l7 = ff00ffffffffbaff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ff000000, Mem[0000000030181400] = 000000ff
	stha	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000

p0_label_384:
!	%l3 = 00000000ff000000, Mem[0000000020800000] = 43ff779a, %asi = 80
	stha	%l3,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000779a
!	Code Fragment 4
p0_fragment_44:
!	%l0 = 0000000000000000
	setx	0xe8a12c17c0a3f364,%g7,%l0 ! %l0 = e8a12c17c0a3f364
!	%l1 = 00000000000000ff
	setx	0x2d7404b020ce72f8,%g7,%l1 ! %l1 = 2d7404b020ce72f8
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e8a12c17c0a3f364
	setx	0x2ed40e3797c51282,%g7,%l0 ! %l0 = 2ed40e3797c51282
!	%l1 = 2d7404b020ce72f8
	setx	0x5ae43e902bad35bd,%g7,%l1 ! %l1 = 5ae43e902bad35bd
	membar	#Sync			! Added by membar checker (57)
!	%l5 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stwa	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	Mem[0000000010081420] = ffba1b43000000ff, %l3 = 00000000ff000000, %l6 = 00000000000000ff
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = ffba1b43000000ff
!	%l0 = 2ed40e3797c51282, Mem[0000000030041400] = ff000000
	stba	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 82000000
!	Mem[0000000021800141] = 0000da9c, %l3 = 00000000ff000000
	ldstuba	[%o3+0x141]%asi,%l3	! %l3 = 00000000000000ff
!	%l0 = 97c51282, %l1 = 2bad35bd, Mem[0000000010041408] = 00000000 00000000
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 97c51282 2bad35bd
!	Mem[0000000030081410] = d9e67963, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 00000063000000ff
!	%l1 = 5ae43e902bad35bd, Mem[0000000010081404] = ffffffff, %asi = 80
	stha	%l1,[%i2+0x004]%asi	! Mem[0000000010081404] = 35bdffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = affff3c6, %l2 = 00000000000000ff
	lduwa	[%i2+0x018]%asi,%l2	! %l2 = 00000000affff3c6

p0_label_385:
!	Mem[0000000030181408] = 00000000ff000000, %l0 = 2ed40e3797c51282
	ldxa	[%i6+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030081408] = 00000000, %l2 = 00000000affff3c6
	lduha	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = ffff0000, %l0 = 00000000ff000000
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001400] = 000000ff, %l5 = 0000000000000000
	lduba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001408] = adcf2b33 ffff0000, %l0 = ffffffff, %l1 = 2bad35bd
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 00000000adcf2b33 00000000ffff0000
!	Mem[0000000021800040] = ff7b2728, %l1 = 00000000ffff0000
	lduba	[%o3+0x040]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = 00000000ff006800, %l4 = ffffff00000000ff
	ldx	[%i5+%g0],%l4		! %l4 = 00000000ff006800
!	Mem[00000000218000c0] = ffff0fe0, %l0 = 00000000adcf2b33
	ldsha	[%o3+0x0c0]%asi,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = ff000000, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 00000000ff000000

p0_label_386:
!	%l2 = 00000000ff000000, Mem[0000000030081408] = 00000000
	stha	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%f9  = fffa1b43, Mem[0000000030081410] = ff79e6d9
	sta	%f9 ,[%i2+%o5]0x81	! Mem[0000000030081410] = fffa1b43
!	Mem[00000000100c1408] = d8e77963, %l5 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 00000000d8e77963
!	Mem[0000000020800001] = 0000779a, %l5 = 00000000d8e77963
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	%f2  = adcf2b33 ff000000, %l2 = 00000000ff000000
!	Mem[00000000100c1408] = 000000ff00000000
	add	%i3,0x008,%g1
	stda	%f2,[%g1+%l2]ASI_PST32_P ! Mem[00000000100c1408] = 000000ff00000000
!	%l7 = ff00ffffffffbaff, Mem[0000000030101400] = 000000dc
	stha	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000baff
!	%l6 = ffba1b43000000ff, Mem[0000000030001400] = adcfab33
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	Mem[0000000010041410] = ffff00ff, %l6 = ffba1b43000000ff
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030101410] = ffffffff, %l6 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff0000ff, %f21 = 00000000
	lda	[%i6+%o4]0x80,%f21	! %f21 = ff0000ff

p0_label_387:
!	Mem[0000000030081410] = fffa1b43, %l2 = 00000000ff000000
	ldswa	[%i2+%o5]0x81,%l2	! %l2 = fffffffffffa1b43
!	Mem[0000000030081410] = fffa1b43, %l3 = 0000000000000063
	lduwa	[%i2+%o5]0x81,%l3	! %l3 = 00000000fffa1b43
!	Code Fragment 4
p0_fragment_45:
!	%l0 = ffffffffffffffff
	setx	0x6ba806a879f38f03,%g7,%l0 ! %l0 = 6ba806a879f38f03
!	%l1 = 00000000000000ff
	setx	0xffddbe706be32332,%g7,%l1 ! %l1 = ffddbe706be32332
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6ba806a879f38f03
	setx	0xce3b94afd81e8b9f,%g7,%l0 ! %l0 = ce3b94afd81e8b9f
!	%l1 = ffddbe706be32332
	setx	0xb39342482ee9ba23,%g7,%l1 ! %l1 = b39342482ee9ba23
!	Mem[0000000010041400] = 0000000000000000, %f22 = b78954ff ff000000
	ldda	[%i1+%g0]0x80,%f22	! %f22 = 00000000 00000000
!	Mem[0000000010141410] = ffff000000ff0000, %f18 = d8e77963 00000000
	ldda	[%i5+0x010]%asi,%f18	! %f18 = ffff0000 00ff0000
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000ffffffff
	lduba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = ff000000 0000001b, %l0 = d81e8b9f, %l1 = 2ee9ba23
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000ff000000 000000000000001b
!	Mem[0000000010101408] = 0000ffffffff0000, %f12 = 332bcfad ff00ffff
	ldda	[%i4+%o4]0x88,%f12	! %f12 = 0000ffff ffff0000
!	Mem[00000000300c1410] = 00000ace, %l4 = 00000000ff006800
	lduba	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ce
!	Starting 10 instruction Store Burst
!	%f23 = 00000000, Mem[0000000010041408] = 97c51282
	sta	%f23,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000

p0_label_388:
!	Mem[0000000010181400] = 00000000, %l7 = ff00ffffffffbaff
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l0 = 00000000ff000000, Mem[0000000030181400] = 00000000
	stha	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%f6  = 006800ff 00000000, %l1 = 000000000000001b
!	Mem[0000000010041408] = 000000002bad35bd
	add	%i1,0x008,%g1
	stda	%f6,[%g1+%l1]ASI_PST32_P ! Mem[0000000010041408] = 006800ff00000000
!	Mem[000000001014142c] = 9cffb778, %l0 = 00000000ff000000
	swap	[%i5+0x02c],%l0		! %l0 = 000000009cffb778
!	%l5 = 0000000000000000, Mem[0000000010141407] = ff006800, %asi = 80
	stba	%l5,[%i5+0x007]%asi	! Mem[0000000010141404] = ff006800
!	%f23 = 00000000, %f12 = 0000ffff
	fsqrts	%f23,%f12		! %f12 = 00000000
!	%l5 = 0000000000000000, Mem[0000000010081410] = 00000000
	stba	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Mem[0000000020800040] = 00ff726d, %l1 = 000000000000001b
	ldstub	[%o1+0x040],%l1		! %l1 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[00000000100c143c] = ffee36da
	stw	%l1,[%i3+0x03c]		! Mem[00000000100c143c] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 0000ff00 0000ffff, %l0 = 9cffb778, %l1 = 00000000
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 000000000000ffff 000000000000ff00

p0_label_389:
!	Mem[0000000010141410] = ffff0000, %l4 = 00000000000000ce
	lduwa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ffff0000
!	Mem[0000000030041400] = 82000000, %l7 = 0000000000000000
	ldsha	[%i1+%g0]0x81,%l7	! %l7 = ffffffffffff8200
!	Mem[0000000010041410] = ff00ffff, %l1 = 000000000000ff00
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = ffffffffff00ffff
!	%l7 = ffffffffffff8200, imm = 00000000000003a8, %l0 = 000000000000ffff
	or	%l7,0x3a8,%l0		! %l0 = ffffffffffff83a8
!	Mem[0000000010101400] = ff000000, %l7 = ffffffffffff8200
	ldswa	[%i4+0x000]%asi,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010101410] = 0000ff43adcf2b33, %f22 = 00000000 00000000
	ldda	[%i4+%o5]0x88,%f22	! %f22 = 0000ff43 adcf2b33
!	%l0 = ffffffffffff83a8, imm = 0000000000000f7f, %l2 = fffffffffffa1b43
	orn	%l0,0xf7f,%l2		! %l2 = fffffffffffff3a8
!	Mem[0000000010001408] = 431bfafffffffe83, %l2 = fffffffffffff3a8
	ldxa	[%i0+%o4]0x80,%l2	! %l2 = 431bfafffffffe83
!	Mem[0000000030101408] = 000000ff, %l5 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffff000000, Mem[0000000010081400] = 00000000
	stw	%l7,[%i2+%g0]		! Mem[0000000010081400] = ff000000

p0_label_390:
!	Mem[0000000010041408] = 006800ff, %l0 = ffffffffffff83a8
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l1 = ffffffffff00ffff, Mem[00000000201c0001] = ffff3e5d, %asi = 80
	stba	%l1,[%o0+0x001]%asi	! Mem[00000000201c0000] = ffff3e5d
!	%l4 = 00000000ffff0000, Mem[0000000010001400] = 000000ff
	stba	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	Mem[0000000010041400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l1 = ffffffffff00ffff, Mem[000000001004142c] = ff000000
	sth	%l1,[%i1+0x02c]		! Mem[000000001004142c] = ffff0000
!	%f26 = 00004fff ff0000ff, Mem[0000000030001400] = ff000000 ffffffff
	stda	%f26,[%i0+%g0]0x81	! Mem[0000000030001400] = 00004fff ff0000ff
!	%l4 = ffff0000, %l5 = 00000000, Mem[0000000030181410] = ff0000ff 00000000
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = ffff0000 00000000
!	%l2 = fffffe83, %l3 = fffa1b43, Mem[0000000010101418] = 431bfaff 00000000
	stda	%l2,[%i4+0x018]%asi	! Mem[0000000010101418] = fffffe83 fffa1b43
!	%l6 = 00000000, %l7 = ff000000, Mem[0000000010181400] = ffffbaff 000000ff
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000ff, %l1 = ffffffffff00ffff
	ldswa	[%i4+%o4]0x81,%l1	! %l1 = 00000000000000ff

p0_label_391:
!	Mem[0000000030181408] = 00000000, %f25 = c6f3ecaf
	lda	[%i6+%o4]0x81,%f25	! %f25 = 00000000
!	Mem[0000000010181424] = 000000ff, %l1 = 00000000000000ff
	lduw	[%i6+0x024],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030101408] = 000000ff, %f15 = 000000ff
	lda	[%i4+%o4]0x81,%f15	! %f15 = 000000ff
!	Mem[0000000030101408] = 000000ff, %l6 = 0000000000000000
	lduba	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%f14 = d40000ff, %f3  = ff000000, %f30 = 00000043
	fdivs	%f14,%f3 ,%f30		! %f30 = 148000ff
!	Mem[0000000030141408] = ffffff00000000ff, %f2  = adcf2b33 ff000000
	ldda	[%i5+%o4]0x89,%f2 	! %f2  = ffffff00 000000ff
!	Mem[0000000010141410] = ffff0000, %f1  = 332bcfad
	lda	[%i5+%o5]0x80,%f1 	! %f1 = ffff0000
!	Mem[0000000010141400] = 00000000, %l0 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141420] = 0000ff0000ff001b, %l6 = 0000000000000000
	ldxa	[%i5+0x020]%asi,%l6	! %l6 = 0000ff0000ff001b
!	Starting 10 instruction Store Burst
!	%l6 = 0000ff0000ff001b, Mem[0000000010081400] = ff000000
	stwa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00ff001b

p0_label_392:
!	%l7 = ffffffffff000000, Mem[0000000010181408] = ff0000ff
	stha	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = ff000000
!	%f16 = ff000000 00ff0000, Mem[0000000030081410] = 431bfaff ff000000
	stda	%f16,[%i2+%o5]0x89	! Mem[0000000030081410] = ff000000 00ff0000
!	%l2 = 431bfafffffffe83, Mem[0000000030081400] = ffba1b4300000000
	stxa	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 431bfafffffffe83
!	Mem[0000000010181400] = 00000000, %l7 = ffffffffff000000
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%l4 = ffff0000, %l5 = 00000000, Mem[0000000010141408] = ffffff0b 000000ff
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = ffff0000 00000000
!	Mem[00000000100c1408] = 000000ff, %l1 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%f5  = 00ff0000, Mem[0000000030141410] = 60000000
	sta	%f5 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 00ff0000
!	%l7 = 0000000000000000, Mem[0000000030081408] = 00000000ffff00ff
	stxa	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 000000ff, %l2 = 431bfafffffffe83
	ldsba	[%i5+%o4]0x89,%l2	! %l2 = ffffffffffffffff

p0_label_393:
!	Code Fragment 3
p0_fragment_46:
!	%l0 = 0000000000000000
	setx	0xadf7263faea33616,%g7,%l0 ! %l0 = adf7263faea33616
!	%l1 = 0000000000000000
	setx	0xd25022e07bd3248d,%g7,%l1 ! %l1 = d25022e07bd3248d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = adf7263faea33616
	setx	0x89033b0032f42b35,%g7,%l0 ! %l0 = 89033b0032f42b35
!	%l1 = d25022e07bd3248d
	setx	0x2a6f6327f664b324,%g7,%l1 ! %l1 = 2a6f6327f664b324
!	%l3 = 00000000fffa1b43, %l4 = 00000000ffff0000, %l5 = 0000000000000000
	or	%l3,%l4,%l5		! %l5 = 00000000ffff1b43
!	Mem[0000000010001410] = ff000000 ff0000d4, %l2 = ffffffff, %l3 = fffa1b43
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 00000000ff000000 00000000ff0000d4
!	%f28 = 0000ffff 000000ff, %f3  = 000000ff
	fdtos	%f28,%f3 		! %f3  = 00000000
!	Mem[0000000010081408] = d64e1cf6, %f31 = ffee36da
	lda	[%i2+%o4]0x80,%f31	! %f31 = d64e1cf6
!	Mem[0000000030001410] = 00ff00ff, %l1 = 2a6f6327f664b324
	lduha	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081418] = affff3c6, %l7 = 0000000000000000
	lduha	[%i2+0x018]%asi,%l7	! %l7 = 000000000000afff
!	Mem[0000000030181400] = 00000000, %l6 = 0000ff0000ff001b
	ldswa	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101418] = fffffe83 fffa1b43, %l2 = ff000000, %l3 = ff0000d4
	ldda	[%i4+0x018]%asi,%l2	! %l2 = 00000000fffffe83 00000000fffa1b43
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000010181410] = 332bcfad
	stha	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 00ffcfad

p0_label_394:
!	Mem[0000000010001410] = ff000000, %l5 = 00000000ffff1b43
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	%l5 = 00000000ff000000, Mem[00000000218000c0] = ffff0fe0, %asi = 80
	stba	%l5,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00ff0fe0
!	Mem[00000000100c1408] = ff0000ff, %l5 = 00000000ff000000
	lduha	[%i3+%o4]0x80,%l5	! %l5 = 000000000000ff00
!	%f15 = 000000ff, %f0  = 00000000, %f19 = 00ff0000
	fadds	%f15,%f0 ,%f19		! %l0 = 89033b0032f42b57, Unfinished, %fsr = 2500000400
!	%l4 = ffff0000, %l5 = 0000ff00, Mem[00000000100c1408] = ff0000ff 00000000
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffff0000 0000ff00
!	%f9  = fffa1b43, %f21 = ff0000ff, %f0  = 00000000
	fadds	%f9 ,%f21,%f0 		! %f0  = fffa1b43
!	%f24 = 000000ff 00000000, Mem[00000000100c1400] = 000000ff 0000ff00
	stda	%f24,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff 00000000
!	Mem[0000000030001400] = 00004fff, %l6 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101408] = 0000ffff, %l2 = 00000000fffffe83
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 0000ff00, %l7 = 000000000000afff
	lduba	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_395:
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = 83feffff, %l7 = 0000000000000000
	ldswa	[%i2+%g0]0x81,%l7	! %l7 = ffffffff83feffff
!	%l7 = ffffffff83feffff, %l2 = 0000000000000000, %l1 = 00000000000000ff
	orn	%l7,%l2,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010101400] = ff000000, %l3 = 00000000fffa1b43
	ldsha	[%i4+%g0]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030141400] = 0000c6ff, %l0 = 89033b0032f42b57
	ldsha	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = adcf2b33ffff0000, %l7 = ffffffff83feffff
	ldxa	[%i0+%o4]0x81,%l7	! %l7 = adcf2b33ffff0000
!	Mem[0000000030181408] = 00000000, %l7 = adcf2b33ffff0000
	ldsba	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181420] = 00000000, %f26 = 00004fff
	lda	[%i6+0x020]%asi,%f26	! %f26 = 00000000
!	%l0 = 0000000000000000, %l6 = 0000000000000000, %l0 = 0000000000000000
	or	%l0,%l6,%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_47:
!	%l0 = 0000000000000000
	setx	0x30ae5ec7daf8294d,%g7,%l0 ! %l0 = 30ae5ec7daf8294d
!	%l1 = ffffffffffffffff
	setx	0xc4baed107de73928,%g7,%l1 ! %l1 = c4baed107de73928
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 30ae5ec7daf8294d
	setx	0x17eaeb9ffa47bec2,%g7,%l0 ! %l0 = 17eaeb9ffa47bec2
!	%l1 = c4baed107de73928
	setx	0x21cb2f707613bb25,%g7,%l1 ! %l1 = 21cb2f707613bb25

p0_label_396:
!	%l7 = 0000000000000000, imm = 0000000000000208, %l6 = 0000000000000000
	orn	%l7,0x208,%l6		! %l6 = fffffffffffffdf7
!	Mem[0000000030081408] = 00000000, %l4 = 00000000ffff0000
	ldstuba	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%f3  = 00000000, Mem[000000001018142c] = ff00ffff
	sta	%f3 ,[%i6+0x02c]%asi	! Mem[000000001018142c] = 00000000
!	Mem[0000000010041425] = ffffffff, %l0 = 17eaeb9ffa47bec2
	ldstuba	[%i1+0x025]%asi,%l0	! %l0 = 000000ff000000ff
!	%f7  = 00000000, Mem[00000000300c1408] = 00000000
	sta	%f7 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l6 = fffffffffffffdf7, Mem[0000000010001410] = ffff1b43
	stwa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = fffffdf7
!	Mem[00000000100c1410] = 00000000, %l5 = 000000000000ff00
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, %l6 = fffffffffffffdf7, %l1 = 21cb2f707613bb25
	udivx	%l5,%l6,%l1		! %l1 = 0000000000000000
!	Mem[00000000211c0000] = 00006880, %l6 = fffffffffffffdf7
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = f61c4ed6, %l3 = ffffffffffffff00
	ldsha	[%i2+%o4]0x88,%l3	! %l3 = 0000000000004ed6

p0_label_397:
!	Mem[00000000100c1408] = 0000ffff, %l5 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010081410] = 00000000, %l3 = 0000000000004ed6
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = ff00ffffffff0000, %l2 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = ff00ffffffff0000
!	%l5 = 000000000000ffff, %l3 = 0000000000000000, %l4 = 0000000000000000
	addc	%l5,%l3,%l4		! %l4 = 000000000000ffff
!	Mem[0000000010081408] = d64e1cf6, %l6 = 0000000000000000
	lduha	[%i2+%o4]0x80,%l6	! %l6 = 000000000000d64e
!	Mem[0000000010001408] = 431bfafffffffe83, %f16 = ff000000 00ff0000
	ldda	[%i0+%o4]0x80,%f16	! %f16 = 431bfaff fffffe83
!	Mem[0000000010001408] = 431bfaff, %l7 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l7	! %l7 = 000000000000431b
!	Mem[00000000100c1400] = 00000000, %l4 = 000000000000ffff
	lduh	[%i3+0x002],%l4		! %l4 = 0000000000000000
!	Mem[00000000100c1438] = 00000043, %l6 = 000000000000d64e
	ldub	[%i3+0x039],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 431bfaff fffffe83 ffff0000 00ff0000
!	%f20 = 00000000 ff0000ff 0000ff43 adcf2b33
!	%f24 = 000000ff 00000000 00000000 ff0000ff
!	%f28 = 0000ffff 000000ff 148000ff d64e1cf6
	stda	%f16,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400

p0_label_398:
!	%l6 = 0000000000000000, Mem[0000000010181410] = 00ffcfad
	stw	%l6,[%i6+%o5]		! Mem[0000000010181410] = 00000000
!	Mem[0000000010141408] = 0000ffff, %l6 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 000000000000ffff
!	%f2  = ffffff00 00000000, %l5 = 000000000000ffff
!	Mem[00000000300c1408] = 00000000ffffffff
	add	%i3,0x008,%g1
	stda	%f2,[%g1+%l5]ASI_PST32_S ! Mem[00000000300c1408] = ffffff0000000000
!	%f10 = 83feffff fffa1b43, %l2 = ff00ffffffff0000
!	Mem[0000000030181430] = ff000000ff800000
	add	%i6,0x030,%g1
	stda	%f10,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030181430] = ff000000ff800000
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000030181410] = ffff0000 00000000
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff 00000000
!	%l3 = 0000000000000000, Mem[0000000030001410] = ff00ff00
	stha	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000ff00
!	Mem[00000000100c1408] = 0000ffff, %l6 = 0000ffff, %l2 = ffff0000
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010181404] = 000000ff, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x004]%asi,%l0	! %l0 = 00000000000000ff
!	%l7 = 000000000000431b, Mem[0000000010101410] = 332bcfad
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 431bcfad
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000ff, %l2 = 000000000000ffff
	ldsba	[%i6+%o5]0x89,%l2	! %l2 = ffffffffffffffff

p0_label_399:
!	Mem[00000000100c1404] = ff000000, %l6 = 000000000000ffff
	lduha	[%i3+0x006]%asi,%l6	! %l6 = 0000000000000000
!	Mem[000000001004143c] = 00000000, %l1 = 0000000000000000
	ldsh	[%i1+0x03e],%l1		! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (58)
!	Mem[0000000010081410] = 000000006379e6d9, %f12 = 00000000 ffff0000
	ldda	[%i2+%o5]0x80,%f12	! %f12 = 00000000 6379e6d9
!	Mem[0000000030041400] = 82000000, %l7 = 000000000000431b
	ldsba	[%i1+%g0]0x81,%l7	! %l7 = ffffffffffffff82
!	Mem[0000000021800080] = ffff05ff, %l5 = 000000000000ffff
	lduha	[%o3+0x080]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030041410] = 000000000000ff00, %f4  = ff000000 00ff0000
	ldda	[%i1+%o5]0x89,%f4 	! %f4  = 00000000 0000ff00
!	Mem[0000000030041400] = 82000000, %l1 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000082
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%f7  = 00000000, %f27 = ff0000ff
	fcmps	%fcc2,%f7 ,%f27		! %fcc2 = 2
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 431bfaff, %l4 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l4	! %l4 = 00000000431bfaff

p0_label_400:
!	%f8  = 00000000 fffa1b43, Mem[0000000010001400] = 00000000 1b000000
	stda	%f8 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 fffa1b43
!	Mem[0000000010181428] = ff00000000000000, %l3 = 0000000000000000, %l6 = 0000000000000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = ff00000000000000
!	%l7 = ffffffffffffff82, Mem[00000000300c1410] = 00000ace
	stba	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000a82
!	Mem[000000001004142b] = 00000000, %l1 = 0000000000000082
	ldstub	[%i1+0x02b],%l1		! %l1 = 00000000000000ff
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000030141400] = ffc60000 00000000
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffff 00000000
!	%l5 = 000000000000ffff, Mem[0000000030001400] = ff004fff
	stwa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000ffff
!	Mem[0000000010001410] = f7fdffff, %l3 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 00000000f7fdffff
!	%l4 = 00000000431bfaff, Mem[0000000010181400] = ff000000000000ff
	stxa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000431bfaff
!	%l0 = 00000000000000ff, Mem[0000000010081408] = d64e1cf6, %asi = 80
	stwa	%l0,[%i2+0x008]%asi	! Mem[0000000010081408] = 000000ff
!	Starting 10 instruction Load Burst
!	%l7 = ffffffffffffff82, %l1 = 0000000000000000, %y  = 00000000
	smul	%l7,%l1,%l1		! %l1 = 0000000000000000, %y = 00000000

p0_label_401:
!	Mem[00000000211c0000] = ff006880, %l6 = ff00000000000000
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffff00
!	Mem[0000000030081408] = 00ff0000, %l7 = ffffffffffffff82
	lduwa	[%i2+%o4]0x89,%l7	! %l7 = 0000000000ff0000
!	Mem[0000000030001408] = adcf2b33 ffff0000, %l6 = ffffff00, %l7 = 00ff0000
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000adcf2b33 00000000ffff0000
!	Mem[0000000021800000] = 0000b994, %l4 = 00000000431bfaff
	ldsb	[%o3+0x001],%l4		! %l4 = 0000000000000000
!	Mem[0000000010041410] = ffff00ff, %l4 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041418] = 0000ff000000ff00, %l1 = 0000000000000000
	ldxa	[%i1+0x018]%asi,%l1	! %l1 = 0000ff000000ff00
!	Mem[0000000010001400] = fffa1b43, %l6 = 00000000adcf2b33
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = fffffffffffa1b43
!	Mem[0000000010101400] = ff000000, %l1 = 0000ff000000ff00
	lduwa	[%i4+%g0]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010141400] = 006800ff00000000, %l7 = 00000000ffff0000
	ldxa	[%i5+%g0]0x88,%l7	! %l7 = 006800ff00000000
!	Starting 10 instruction Store Burst
!	%f26 = 00000000, Mem[0000000030181400] = 00000000
	sta	%f26,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000

p0_label_402:
!	%f1  = ffff0000, Mem[0000000030081400] = 83feffff
	sta	%f1 ,[%i2+%g0]0x81	! Mem[0000000030081400] = ffff0000
!	%l4 = 000000ff, %l5 = 0000ffff, Mem[0000000030101410] = 000000ff fd8308f0
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff 0000ffff
!	%l5 = 000000000000ffff, Mem[0000000010141400] = 00000000ff006800
	stx	%l5,[%i5+%g0]		! Mem[0000000010141400] = 000000000000ffff
!	Mem[0000000030141410] = 00ff0000, %l7 = 006800ff00000000
	ldstuba	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081418] = affff3c6, %l7 = 00000000, %l2 = ffffffff
	add	%i2,0x18,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 00000000affff3c6
!	Mem[000000001014142f] = ff000000, %l0 = 00000000000000ff
	ldstub	[%i5+0x02f],%l0		! %l0 = 00000000000000ff
!	%l2 = 00000000affff3c6, Mem[0000000010181408] = 000000ff
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = c60000ff
!	Mem[0000000010141413] = ffff0000, %l0 = 0000000000000000
	ldstub	[%i5+0x013],%l0		! %l0 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010001400] = 431bfaff
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000ff, %l1 = 00000000ff000000
	ldsha	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff

p0_label_403:
!	Mem[0000000030001410] = 00ff0000, %l1 = 00000000000000ff
	lduha	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l7 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = ff006880, %l2 = 00000000affff3c6
	ldsh	[%o2+%g0],%l2		! %l2 = ffffffffffffff00
!	Mem[0000000030041408] = 43ff000000000000, %l5 = 000000000000ffff
	ldxa	[%i1+%o4]0x81,%l5	! %l5 = 43ff000000000000
!	Mem[0000000030141408] = 000000ff, %l6 = fffffffffffa1b43
	lduha	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, %l7 = 0000000000000000, %l3 = 00000000f7fdffff
	subc	%l6,%l7,%l3		! %l3 = 00000000000000ff
!	Mem[0000000010041408] = ff0068ff, %l0 = 0000000000000000
	ldswa	[%i1+%o4]0x88,%l0	! %l0 = ffffffffff0068ff
!	Mem[0000000010081430] = 0000000000000000, %f30 = 148000ff d64e1cf6
	ldda	[%i2+0x030]%asi,%f30	! %f30 = 00000000 00000000
!	Mem[0000000030041410] = 0000ff00, %l3 = 00000000000000ff
	lduba	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 43ff0000, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 0000000043ff0000

p0_label_404:
!	%l2 = ffffffffffffff00, Mem[0000000010181410] = 00000000
	stwa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffff00
!	%l4 = 00000000000000ff, Mem[0000000010041410] = ff00ffff
	stba	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = ff00ffff
!	Mem[0000000030081408] = 00ff0000, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = ff000000, %l7 = 0000000043ff0000
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	%l0 = ffffffffff0068ff, Mem[0000000010101400] = 000000ff
	stha	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 000068ff
!	Mem[0000000030001408] = 332bcfad, %l6 = 00000000000000ff
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000332bcfad
!	Mem[0000000030141408] = ff000000, %l0 = ffffffffff0068ff
	ldstuba	[%i5+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010001410] = 00000000, %l2 = ffffffffffffff00
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%l5 = 43ff000000000000, Mem[0000000010001423] = ffff8900, %asi = 80
	stba	%l5,[%i0+0x023]%asi	! Mem[0000000010001420] = ffff8900
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00ff001b, %l0 = 00000000000000ff
	ldsw	[%i2+%g0],%l0		! %l0 = 0000000000ff001b

p0_label_405:
!	Mem[0000000030181400] = 00000000, %l1 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l7 = 00000000ff000000
	lduwa	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%l4 = 00000000000000ff, %l6 = 00000000332bcfad, %l4 = 00000000000000ff
	sub	%l4,%l6,%l4		! %l4 = ffffffffccd43152
!	Mem[0000000030001410] = 0000ff00 fffa1b43, %l6 = 332bcfad, %l7 = 00000000
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 000000000000ff00 00000000fffa1b43
!	Mem[0000000030041400] = 82000000, %l5 = 43ff000000000000
	ldsha	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffff8200
!	Mem[0000000030141400] = ffffffff, %l5 = ffffffffffff8200
	lduha	[%i5+%g0]0x81,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010081400] = 00ff001b, %l0 = 0000000000ff001b
	ldub	[%i2+0x003],%l0		! %l0 = 000000000000001b
!	Mem[00000000100c1410] = 0000ff00, %l7 = 00000000fffa1b43
	lduwa	[%i3+%o5]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030081410] = 00000000ff0000ff, %l0 = 000000000000001b
	ldxa	[%i2+%o5]0x89,%l0	! %l0 = 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ff00, Mem[0000000010001410] = ff000000
	stwa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000ff00

p0_label_406:
!	Mem[00000000100c1400] = 00000000, %l5 = 000000000000ffff
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%f15 = 000000ff, %f7  = 00000000, %f31 = 00000000
	fadds	%f15,%f7 ,%f31		! %l0 = 00000000ff000121, Unfinished, %fsr = 2900000400
!	%f16 = 431bfaff fffffe83 ffff0000 00ff0000
!	%f20 = 00000000 ff0000ff 0000ff43 adcf2b33
!	%f24 = 000000ff 00000000 00000000 ff0000ff
!	%f28 = 0000ffff 000000ff 00000000 00000000
	stda	%f16,[%i5]ASI_BLK_P	! Block Store to 0000000010141400
!	%f0  = fffa1b43 ffff0000, %l0 = 00000000ff000121
!	Mem[0000000030001400] = 0000ffffff0000ff
	stda	%f0,[%i0+%l0]ASI_PST8_SL ! Mem[0000000030001400] = 0000ffffff1b00ff
!	Mem[0000000030101400] = 0000baff, %l6 = 000000000000ff00
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030001400] = 0000ffff, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l0 = ff000121, %l1 = 00000000, Mem[0000000030001400] = ff00ffff ff1b00ff
	stda	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = ff000121 00000000
!	%f12 = 00000000 6379e6d9, Mem[0000000010101400] = 000068ff 0000ff00
	stda	%f12,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 6379e6d9
	membar	#Sync			! Added by membar checker (59)
!	Mem[0000000010141410] = 00000000, %l4 = ffffffffccd43152
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181414] = ff00ffff, %f3  = 00000000
	lda	[%i6+0x014]%asi,%f3 	! %f3 = ff00ffff

p0_label_407:
!	Mem[0000000010101408] = ff00ffff, %l5 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001430] = 0000ff00, %l7 = 000000000000ff00
	ldsw	[%i0+0x030],%l7		! %l7 = 000000000000ff00
!	Mem[0000000010081400] = ffffbd351b00ff00, %f28 = 0000ffff 000000ff
	ldda	[%i2+%g0]0x88,%f28	! %f28 = ffffbd35 1b00ff00
!	%f8  = 00000000, %f30 = 00000000, %f12 = 00000000
	fdivs	%f8 ,%f30,%f12		! %f12 = 7fffffff
!	%l5 = 00000000000000ff, %l3 = 0000000000000000, %l0 = 00000000ff000121
	udivx	%l5,%l3,%l0		! Div by zero, %l0 = 00000000ff000171
!	Mem[0000000030041400] = 000000ff00000082, %l4 = 0000000000000000
	ldxa	[%i1+%g0]0x89,%l4	! %l4 = 000000ff00000082
!	Code Fragment 4
p0_fragment_48:
!	%l0 = 00000000ff000149
	setx	0x6f4f19886cb3fef0,%g7,%l0 ! %l0 = 6f4f19886cb3fef0
!	%l1 = 0000000000000000
	setx	0x2a8046b7e8bfb361,%g7,%l1 ! %l1 = 2a8046b7e8bfb361
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6f4f19886cb3fef0
	setx	0x577c196869e279eb,%g7,%l0 ! %l0 = 577c196869e279eb
!	%l1 = 2a8046b7e8bfb361
	setx	0x68de31f03ca8ade9,%g7,%l1 ! %l1 = 68de31f03ca8ade9
!	Mem[0000000010081408] = ff000000, %l7 = 000000000000ff00
	ldswa	[%i2+%o4]0x88,%l7	! %l7 = ffffffffff000000
!	Mem[0000000030081408] = 00ff00ff, %f25 = 00000000
	lda	[%i2+%o4]0x89,%f25	! %f25 = 00ff00ff
!	Starting 10 instruction Store Burst
!	Mem[000000001018141c] = ff3fbf33, %l4 = 000000ff00000082
	swap	[%i6+0x01c],%l4		! %l4 = 00000000ff3fbf33

p0_label_408:
!	%l1 = 68de31f03ca8ade9, Mem[0000000010181420] = 00000000, %asi = 80
	stha	%l1,[%i6+0x020]%asi	! Mem[0000000010181420] = ade90000
!	Mem[0000000020800040] = ffff726d, %l2 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l2	! %l2 = 000000ff000000ff
!	%f12 = 7fffffff, Mem[0000000010081420] = ffba1b43
	sta	%f12,[%i2+0x020]%asi	! Mem[0000000010081420] = 7fffffff
!	Mem[0000000010101410] = 431bcfad, %l1 = 68de31f03ca8ade9, %asi = 80
	swapa	[%i4+0x010]%asi,%l1	! %l1 = 00000000431bcfad
!	%f31 = 00000000, Mem[000000001000140c] = fffffe83
	st	%f31,[%i0+0x00c]	! Mem[000000001000140c] = 00000000
!	Mem[0000000030101400] = 0000baff, %l5 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 000000000000baff
!	%l0 = 69e279eb, %l1 = 431bcfad, Mem[0000000010001400] = 000000ff 00000000
	std	%l0,[%i0+%g0]		! Mem[0000000010001400] = 69e279eb 431bcfad
!	Mem[000000001004140b] = ff6800ff, %l0 = 577c196869e279eb
	ldstub	[%i1+0x00b],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000010181400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 3ca8ade9, %l0 = 00000000000000ff
	lduwa	[%i4+%o5]0x80,%l0	! %l0 = 000000003ca8ade9

p0_label_409:
	membar	#Sync			! Added by membar checker (60)
!	Mem[0000000010001400] = 69e279eb 431bcfad 00000000 00000000
!	Mem[0000000010001410] = 0000ff00 ff0000d4 00620000 adcf2b33
!	Mem[0000000010001420] = ffff8900 38ea007b e98b0000 000000ff
!	Mem[0000000010001430] = 0000ff00 fffa1b43 00000000 000000ff
	ldda	[%i0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[0000000030101408] = ff000000, %l6 = 0000000000000000
	lduha	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = ff00ffff, %f3  = ff00ffff
	ld	[%i1+%o5],%f3 	! %f3 = ff00ffff
!	Mem[0000000010041408] = 00000000 ff0068ff, %l4 = ff3fbf33, %l5 = 0000baff
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 00000000ff0068ff 0000000000000000
!	Mem[0000000010041410] = ffff00ff, %l5 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001400] = 69e279eb 431bcfad 00000000 00000000
!	Mem[0000000010001410] = 0000ff00 ff0000d4 00620000 adcf2b33
!	Mem[0000000010001420] = ffff8900 38ea007b e98b0000 000000ff
!	Mem[0000000010001430] = 0000ff00 fffa1b43 00000000 000000ff
	ldda	[%i0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400
!	Mem[0000000010141424] = 00000000, %l4 = 00000000ff0068ff
	lduwa	[%i5+0x024]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001438] = 00000000000000ff, %f12 = 7fffffff 6379e6d9
	ldda	[%i0+0x038]%asi,%f12	! %f12 = 00000000 000000ff
!	Mem[0000000010141408] = 0000ffff, %f14 = d40000ff
	lda	[%i5+%o4]0x88,%f14	! %f14 = 0000ffff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (61)
!	%f2  = ffffff00 ff00ffff, %l1 = 00000000431bcfad
!	Mem[0000000010001418] = 00620000adcf2b33
	add	%i0,0x018,%g1
	stda	%f2,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010001418] = ffff00ffadcf2b33

p0_label_410:
!	%l6 = 0000000000000000, Mem[000000001018142c] = 00000000
	stb	%l6,[%i6+0x02c]		! Mem[000000001018142c] = 00000000
!	%f12 = 00000000, Mem[0000000030141408] = ff000000
	sta	%f12,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[0000000010141408] = 0000ffff, %l7 = ffffffffff000000
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 000000000000ffff
!	%l7 = 000000000000ffff, Mem[0000000010001410] = 0000ff00
	stha	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffff00
!	%l7 = 000000000000ffff, %l2 = 00000000000000ff, %l7 = 000000000000ffff
	addc	%l7,%l2,%l7		! %l7 = 00000000000100fe
!	%l2 = 00000000000000ff, Mem[0000000010101410] = 3ca8ade9
	stwa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff
!	%l0 = 000000003ca8ade9, Mem[0000000030001408] = 000000ff
	stha	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000ade9
!	%l3 = 0000000000000000, Mem[0000000010181408] = ff0000c6
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = ff000000
!	Mem[0000000030181408] = 00000000, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = d9e67963, %l3 = 0000000000000000
	ldsh	[%i4+0x002],%l3		! %l3 = 0000000000007963

p0_label_411:
!	Mem[0000000010001418] = ffff00ff adcf2b33, %l0 = 3ca8ade9, %l1 = 431bcfad
	ldda	[%i0+0x018]%asi,%l0	! %l0 = 00000000ffff00ff 00000000adcf2b33
!	Mem[0000000030001410] = 00ff0000, %l4 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l7 = 00000000000100fe
	lduwa	[%i4+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101410] = 000000ff, %l4 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 00ffffff, %l2 = 00000000000000ff
	lduba	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[000000001010141c] = fffa1b43, %l4 = 0000000000000000
	ldsw	[%i4+0x01c],%l4		! %l4 = fffffffffffa1b43
!	Mem[0000000010081400] = 00ff001b 35bdffff, %l0 = ffff00ff, %l1 = adcf2b33
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 0000000000ff001b 0000000035bdffff
!	Mem[0000000030041410] = 00ff0000, %l0 = 0000000000ff001b
	lduwa	[%i1+%o5]0x81,%l0	! %l0 = 0000000000ff0000
!	Mem[0000000010081410] = 00000000, %l1 = 0000000035bdffff
	lduha	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f5  = 0000ff00, Mem[0000000030041408] = 00000000
	sta	%f5 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000ff00

p0_label_412:
!	%f17 = eb79e269, Mem[0000000010141408] = 000000ff
	sta	%f17,[%i5+%o4]0x80	! Mem[0000000010141408] = eb79e269
!	%l0 = 0000000000ff0000, Mem[0000000010081408] = 000000ff
	stba	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff
!	%l1 = 0000000000000000, Mem[0000000030181400] = 0000000000000000
	stxa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000000
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010141408] = 69e279eb 0000ff00
	stda	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 000000ff
!	Mem[0000000030041400] = 82000000, %l0 = 0000000000ff0000
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 00000082000000ff
!	%l4 = fffa1b43, %l5 = ffffffff, Mem[0000000030081410] = ff0000ff 00000000
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = fffa1b43 ffffffff
!	Mem[0000000010081410] = 00000000, %l0 = 0000000000000082
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l5 = ffffffffffffffff, Mem[00000000211c0000] = ff006880
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = ffff6880
!	Mem[0000000010041410] = ffff00ff, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 00000000ffff00ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff6880, %l3 = 0000000000007963
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ffff

p0_label_413:
!	Mem[0000000010041400] = 0000ff43, %l5 = ffffffffffffffff
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000043
!	Mem[0000000030081410] = fffa1b43, %l5 = 0000000000000043
	lduwa	[%i2+%o5]0x81,%l5	! %l5 = 00000000fffa1b43
!	Mem[0000000010001430] = 0000ff00 fffa1b43, %l0 = 00000000, %l1 = ffff00ff
	ldd	[%i0+0x030],%l0		! %l0 = 000000000000ff00 00000000fffa1b43
!	Mem[0000000010041400] = 0000ff43, %l5 = 00000000fffa1b43
	lduha	[%i1+%g0]0x88,%l5	! %l5 = 000000000000ff43
!	Mem[0000000010041408] = ff0068ff, %l3 = 000000000000ffff
	lduha	[%i1+%o4]0x88,%l3	! %l3 = 00000000000068ff
!	Mem[0000000010181400] = ff000000, %l5 = 000000000000ff43
	ldswa	[%i6+%g0]0x88,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010041400] = 0000ff43, %l3 = 00000000000068ff
	ldsba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000043
!	Mem[0000000010081400] = 1b00ff00, %l4 = fffffffffffa1b43
	ldsha	[%i2+%g0]0x88,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010181408] = ff000000, %l5 = ffffffffff000000
	ldsha	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010081400] = 1b00ff00
	stha	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 1b0000ff

p0_label_414:
!	%f14 = 0000ffff, Mem[0000000030141408] = 00000000
	sta	%f14,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000ffff
!	%f11 = fffa1b43, Mem[00000000100c141c] = ff000000
	st	%f11,[%i3+0x01c]	! Mem[00000000100c141c] = fffa1b43
!	%l7 = 00000000000000ff, Mem[0000000010141408] = 00000000
	stha	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff0000
!	%l7 = 00000000000000ff, Mem[0000000010141400] = 431bfaff
	stha	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 00fffaff
!	%f0  = fffa1b43 ffff0000 ffffff00 ff00ffff
!	%f4  = 00000000 0000ff00 006800ff 00000000
!	%f8  = 00000000 fffa1b43 83feffff fffa1b43
!	%f12 = 00000000 000000ff 0000ffff 000000ff
	stda	%f0,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
	membar	#Sync			! Added by membar checker (62)
!	Mem[0000000010141424] = 00000000, %l2 = 000000ff, %l6 = 00000000
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l2,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 00ff0000, %l5 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 0000000000ff0000
!	%f28 = 431bfaff 00ff0000, %l3 = 0000000000000043
!	Mem[0000000010081430] = 0000000000000000
	add	%i2,0x030,%g1
	stda	%f28,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010081430] = 0000ff00fffa1b43
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010181408] = ff000000 00000000
	stda	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 43ff0000, %l4 = ffffffffffffff00
	ldswa	[%i1+%g0]0x80,%l4	! %l4 = 0000000043ff0000

p0_label_415:
!	Mem[0000000010181408] = 00000000ff000000, %f2  = ffffff00 ff00ffff
	ldda	[%i6+%o4]0x80,%f2 	! %f2  = 00000000 ff000000
!	Mem[00000000100c1410] = 00000000, %f14 = 0000ffff
	lda	[%i3+%o5]0x80,%f14	! %f14 = 00000000
!	Mem[0000000010181420] = ade90000, %f23 = 00006200
	lda	[%i6+0x020]%asi,%f23	! %f23 = ade90000
!	Mem[00000000211c0000] = ffff6880, %l4 = 0000000043ff0000
	ldsb	[%o2+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030001400] = 210100ff, %l4 = ffffffffffffffff
	lduba	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = fffa1b43ff000000, %l1 = 00000000fffa1b43
	ldxa	[%i6+%g0]0x88,%l1	! %l1 = fffa1b43ff000000
!	Mem[000000001010143c] = 00ff0000, %f27 = 00008be9
	lda	[%i4+0x03c]%asi,%f27	! %f27 = 00ff0000
!	Mem[00000000300c1408] = ffffff00, %l1 = fffa1b43ff000000
	lduba	[%i3+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001410] = 0000ff00, %l5 = 0000000000ff0000
	lduwa	[%i0+%o5]0x81,%l5	! %l5 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000ff00, Mem[0000000010041408] = ff6800ff, %asi = 80
	stwa	%l0,[%i1+0x008]%asi	! Mem[0000000010041408] = 0000ff00

p0_label_416:
!	Mem[0000000010101410] = ff000000, %f18 = 00000000
	lda	[%i4+%o5]0x88,%f18	! %f18 = ff000000
!	%f6  = 006800ff 00000000, Mem[00000000100c1428] = 00004fff ff0000ff
	stda	%f6 ,[%i3+0x028]%asi	! Mem[00000000100c1428] = 006800ff 00000000
!	%l3 = 0000000000000043, Mem[0000000030181410] = ff00000000000000
	stxa	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000043
!	%f0  = fffa1b43 ffff0000, %l4 = 00000000000000ff
!	Mem[0000000010081400] = ff00001b35bdffff
	stda	%f0,[%i2+%l4]ASI_PST32_PL ! Mem[0000000010081400] = 0000ffff431bfaff
!	Mem[0000000010101408] = ff00ffff, %l3 = 0000000000000043, %asi = 80
	swapa	[%i4+0x008]%asi,%l3	! %l3 = 00000000ff00ffff
!	%l2 = 000000ff, %l3 = ff00ffff, Mem[0000000030081400] = 0000ffff 431bfaff
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff ff00ffff
!	%l2 = 00000000000000ff, Mem[00000000300c1410] = 00000a82
	stba	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000aff
!	%f14 = 00000000 000000ff, %l1 = 00000000000000ff
!	Mem[0000000010081420] = 7fffffff000000ff
	add	%i2,0x020,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_P ! Mem[0000000010081420] = 00000000000000ff
!	%f11 = fffa1b43, Mem[0000000030181410] = 00000000
	sta	%f11,[%i6+%o5]0x81	! Mem[0000000030181410] = fffa1b43
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000 0000ff00, %l4 = 000000ff, %l5 = 0000ff00
	ldda	[%i1+%o5]0x89,%l4	! %l4 = 000000000000ff00 0000000000000000

p0_label_417:
!	Mem[0000000010141400] = 83feffff fffaff00, %l4 = 0000ff00, %l5 = 00000000
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 00000000fffaff00 0000000083feffff
!	Mem[0000000030141408] = 00ffffff, %l0 = 000000000000ff00
	ldsha	[%i5+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = ff000000, %l2 = 00000000000000ff
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030181410] = 431bfaff, %l3 = 00000000ff00ffff
	lduwa	[%i6+%o5]0x89,%l3	! %l3 = 00000000431bfaff
!	Mem[00000000300c1400] = ff000000, %l4 = 00000000fffaff00
	lduha	[%i3+%g0]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010141408] = 00ff0000 ff000000, %l4 = 0000ff00, %l5 = 83feffff
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 0000000000ff0000 00000000ff000000
!	%l0 = ffffffffffffffff, immd = 00000000000003f5, %l7  = 00000000000000ff
	mulx	%l0,0x3f5,%l7		! %l7 = fffffffffffffc0b
!	Mem[0000000010001400] = eb79e269, %l6 = 0000000000000000
	ldsba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000069
!	Mem[00000000100c1408] = ffff0000, %f8  = 00000000
	lda	[%i3+%o4]0x80,%f8 	! %f8 = ffff0000
!	Starting 10 instruction Store Burst
!	%f10 = 83feffff fffa1b43, %l3 = 00000000431bfaff
!	Mem[0000000030081410] = fffa1b43ffffffff
	add	%i2,0x010,%g1
	stda	%f10,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030081410] = 431bfafffffffe83

p0_label_418:
!	%f18 = ff000000, %f12 = 00000000
	fcmpes	%fcc3,%f18,%f12		! %fcc3 = 1
!	Mem[0000000030101410] = 000000ff, %l7 = fffffffffffffc0b
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l5 = 00000000ff000000, Mem[0000000010101408] = 00000043
	stwa	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000
!	Mem[0000000010041410] = 00000000, %l3 = 00000000431bfaff
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l1 = 00000000000000ff, Mem[00000000100c1408] = ffff0000
	stba	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffff0000
!	Mem[0000000030141408] = ffffff00, %l6 = 0000000000000069
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	%f10 = 83feffff fffa1b43, Mem[0000000030081400] = ff000000 ffff00ff
	stda	%f10,[%i2+%g0]0x81	! Mem[0000000030081400] = 83feffff fffa1b43
!	%l0 = ffffffff, %l1 = 000000ff, Mem[0000000010181408] = 00000000 000000ff
	stda	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffff 000000ff
!	Mem[0000000030101408] = ff000000, %l7 = 00000000000000ff
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff000000, %l1 = 00000000000000ff
	ldsha	[%i1+%g0]0x81,%l1	! %l1 = ffffffffffffff00

p0_label_419:
!	Mem[0000000010081400] = ffff0000, %l0 = ffffffffffffffff
	lduwa	[%i2+%g0]0x88,%l0	! %l0 = 00000000ffff0000
!	Mem[00000000100c1408] = 0000ffff, %l4 = 0000000000ff0000
	ldsba	[%i3+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081408] = 000000ff, %l3 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%f13 = 000000ff, %f19 = 00000000, %f16 = adcf1b43
	fdivs	%f13,%f19,%f16		! %f16 = 7f800000
!	Mem[0000000010001404] = 431bcfad, %l2 = 00000000ff000000
	lduha	[%i0+0x004]%asi,%l2	! %l2 = 000000000000431b
!	Mem[00000000100c1408] = ffff0000, %l1 = ffffffffffffff00
	ldswa	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffff0000
!	Mem[0000000010101410] = ff000000, %l0 = 00000000ffff0000
	ldsha	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800000] = 0000b994, %l1 = ffffffffffff0000
	ldub	[%o3+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000010101410] = ff000000, %l1 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l1	! %l1 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%f10 = 83feffff fffa1b43, Mem[0000000010181400] = ff000000 fffa1b43
	stda	%f10,[%i6+%g0]0x88	! Mem[0000000010181400] = 83feffff fffa1b43

p0_label_420:
!	%l3 = 0000000000000000, Mem[0000000030041408] = 00ff0000
	stba	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ff0000
!	%l5 = 00000000ff000000, immed = 0000034e, %y  = 00000000
	smul	%l5,0x34e,%l6		! %l6 = fffffffcb2000000, %y = fffffffc
!	%l2 = 000000000000431b, Mem[0000000010001410] = ffffff00
	stba	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 1bffff00
!	Mem[00000000201c0001] = ffff3e5d, %l6 = fffffffcb2000000
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000010141410] = ff000000
	stba	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	Mem[0000000010001410] = 00ffff1b, %l5 = 00000000ff000000
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 0000000000ffff1b
!	%l1 = 00000000ff000000, Mem[0000000010001438] = 00000000, %asi = 80
	stba	%l1,[%i0+0x038]%asi	! Mem[0000000010001438] = 00000000
!	Mem[0000000010181412] = 00ffffff, %l2 = 000000000000431b
	ldstuba	[%i6+0x012]%asi,%l2	! %l2 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[00000000100c1430] = 0000ffff, %asi = 80
	stha	%l0,[%i3+0x030]%asi	! Mem[00000000100c1430] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = fffffe83 fffa1b43, %l0 = 00000000, %l1 = ff000000
	ldd	[%i4+0x018],%l0		! %l0 = 00000000fffffe83 00000000fffa1b43

p0_label_421:
!	%l2 = 00000000000000ff, imm = fffffffffffff2c2, %l5 = 0000000000ffff1b
	addc	%l2,-0xd3e,%l5		! %l5 = fffffffffffff3c1
!	Mem[0000000010101430] = ff00ffff 00000000, %l6 = 000000ff, %l7 = ff000000
	ldda	[%i4+0x030]%asi,%l6	! %l6 = 00000000ff00ffff 0000000000000000
!	Mem[0000000030081410] = 431bfaff, %l3 = 0000000000000000
	lduba	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000043
!	Mem[0000000021800140] = 00ffda9c, %l1 = 00000000fffa1b43
	ldstub	[%o3+0x140],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %f18 = ff000000
	lda	[%i5+%o5]0x81,%f18	! %f18 = 00000000
!	Mem[0000000030041410] = 00000000 0000ff00, %l2 = 000000ff, %l3 = 00000043
	ldda	[%i1+%o5]0x89,%l2	! %l2 = 000000000000ff00 0000000000000000
!	Mem[0000000030081408] = 00ff00ff, %l6 = 00000000ff00ffff
	lduha	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041428] = 000000ff, %l6 = 00000000000000ff
	lduw	[%i1+0x028],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030001400] = ff000121 00000000, %l2 = 0000ff00, %l3 = 00000000
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 00000000ff000121 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = 00000000 000000ff, %l2 = 00000000ff000121
!	Mem[0000000010141438] = 0000000000000000
	add	%i5,0x038,%g1
	stda	%f12,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010141438] = ff00000000000000

p0_label_422:
!	Mem[0000000030001400] = 210100ff, %l5 = fffffffffffff3c1
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 00000000210100ff
!	%f5  = 0000ff00, %f9  = fffa1b43, %f25 = 0089ffff
	fmuls	%f5 ,%f9 ,%f25		! %f25 = fffa1b43
!	%l0 = 00000000fffffe83, Mem[0000000010081410] = 000000826379e6d9
	stxa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000fffffe83
!	Mem[0000000010101410] = ff000000, %l6 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%f23 = ade90000, Mem[0000000010001410] = ff000000
	sta	%f23,[%i0+%o5]0x88	! Mem[0000000010001410] = ade90000
!	%l1 = 0000000000000000, Mem[00000000300c1410] = 00000aff
	stba	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000a00
!	%f21 = 00ff0000, Mem[0000000010181428] = ff000000
	sta	%f21,[%i6+0x028]%asi	! Mem[0000000010181428] = 00ff0000
!	%l7 = 0000000000000000, Mem[0000000010101408] = 0000ffff000000ff
	stxa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010181408] = ffffffff
	stha	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff00ff00, %l4 = ffffffffffffffff
	lduha	[%i2+%o4]0x81,%l4	! %l4 = 000000000000ff00

p0_label_423:
!	Mem[0000000010041408] = 0000ff00, %l6 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 69e279eb, %l0 = 00000000fffffe83
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = 00000000000069e2
!	%l7 = 0000000000000000, imm = 0000000000000d5c, %l0 = 00000000000069e2
	subc	%l7,0xd5c,%l0		! %l0 = fffffffffffff2a4
!	Mem[0000000010181410] = 00ffffff, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 0bfcffff, %l0 = fffffffffffff2a4
	ldswa	[%i4+%o5]0x89,%l0	! %l0 = 000000000bfcffff
!	Mem[0000000010041400] = 0000ff43, %l6 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l6	! %l6 = 000000000000ff43
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = 000000000000ff00, %f10 = 83feffff fffa1b43
	ldda	[%i5+%o5]0x81,%f10	! %f10 = 00000000 0000ff00
!	Mem[0000000010041408] = 00000000 00ff0000, %l0 = 0bfcffff, %l1 = 00000000
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 0000000000ff0000 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = 7b00ea38 fffa1b43, Mem[0000000010001410] = 0000e9ad ff0000d4
	stda	%f24,[%i0+%o5]0x80	! Mem[0000000010001410] = 7b00ea38 fffa1b43

p0_label_424:
!	%l0 = 0000000000ff0000, Mem[0000000010101410] = ff0000ff
	stwa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ff0000
!	%f14 = 00000000 000000ff, Mem[0000000010081410] = 00000000 fffffe83
	stda	%f14,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 000000ff
!	Mem[0000000010001424] = 38ea007b, %l1 = 0000000000000000
	ldstuba	[%i0+0x024]%asi,%l1	! %l1 = 00000038000000ff
!	%l0 = 00ff0000, %l1 = 00000038, Mem[0000000010081410] = 00000000 ff000000
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 00ff0000 00000038
!	Code Fragment 3
p0_fragment_49:
!	%l0 = 0000000000ff0000
	setx	0xf9245cb80ab66fa6,%g7,%l0 ! %l0 = f9245cb80ab66fa6
!	%l1 = 0000000000000038
	setx	0x28febcd077c3d8ed,%g7,%l1 ! %l1 = 28febcd077c3d8ed
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f9245cb80ab66fa6
	setx	0x597b4e3f975aba6a,%g7,%l0 ! %l0 = 597b4e3f975aba6a
!	%l1 = 28febcd077c3d8ed
	setx	0x752524c7d59129db,%g7,%l1 ! %l1 = 752524c7d59129db
!	%l5 = 00000000210100ff, Mem[0000000030041408] = 0000ff00
	stba	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000ffff
!	%f6  = 006800ff, Mem[0000000010101408] = 00000000
	sta	%f6 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 006800ff
!	%l3 = 0000000000000000, Mem[0000000030041408] = ffff0000
	stwa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l2 = 00000000ff000121, Mem[0000000010141410] = 00000000ff0000ff
	stxa	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000ff000121
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = fffa1b43, %l6 = 000000000000ff43
	ldswa	[%i2+%o5]0x89,%l6	! %l6 = fffffffffffa1b43

p0_label_425:
!	Mem[0000000010101400] = 6379e6d9, %f16 = 7f800000
	lda	[%i4+%g0]0x88,%f16	! %f16 = 6379e6d9
!	Mem[0000000010141410] = 00000000ff000121, %l5 = 00000000210100ff
	ldxa	[%i5+%o5]0x80,%l5	! %l5 = 00000000ff000121
!	Mem[0000000010041408] = 0000000000ff0000, %f10 = 00000000 0000ff00
	ldda	[%i1+%o4]0x88,%f10	! %f10 = 00000000 00ff0000
!	Mem[0000000030101400] = ffffffff000000ff, %f6  = 006800ff 00000000
	ldda	[%i4+%g0]0x89,%f6 	! %f6  = ffffffff 000000ff
!	Mem[0000000010081420] = 00000000, %f20 = d40000ff
	lda	[%i2+0x020]%asi,%f20	! %f20 = 00000000
!	Mem[00000000100c1408] = ffff0000, %l0 = 597b4e3f975aba6a
	lduha	[%i3+%o4]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010001410] = 431bfaff38ea007b, %f26 = ff000000 00ff0000
	ldda	[%i0+%o5]0x88,%f26	! %f26 = 431bfaff 38ea007b
!	Mem[0000000010141410] = 00000000 ff000121, %l2 = ff000121, %l3 = 00000000
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000 00000000ff000121
!	Mem[0000000020800000] = 00ff779a, %l3 = 00000000ff000121
	ldub	[%o1+%g0],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00ff0000, %l1 = 752524c7d59129db
	ldstuba	[%i5+%o4]0x80,%l1	! %l1 = 00000000000000ff

p0_label_426:
!	%f10 = 00000000, Mem[0000000010101408] = ff006800
	st	%f10,[%i4+%o4]		! Mem[0000000010101408] = 00000000
!	Mem[0000000010041408] = 0000ff0000000000, %l5 = 00000000ff000121, %l1 = 0000000000000000
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 0000ff0000000000
!	Mem[0000000030001410] = 0000ff00, %l4 = 000000000000ff00
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000, %l5 = ff000121, Mem[0000000030041410] = 0000ff00 00000000
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 ff000121
!	%l5 = 00000000ff000121, Mem[0000000010141418] = 0000ff43
	stb	%l5,[%i5+0x018]		! Mem[0000000010141418] = 2100ff43
!	%l2 = 0000000000000000, Mem[0000000030141400] = 431bfaff
	stba	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 431bfa00
!	%f0  = fffa1b43 ffff0000, Mem[0000000010101400] = d9e67963 00000000
	stda	%f0 ,[%i4+%g0]0x80	! Mem[0000000010101400] = fffa1b43 ffff0000
!	%f0  = fffa1b43 ffff0000 00000000 ff000000
!	%f4  = 00000000 0000ff00 ffffffff 000000ff
!	%f8  = ffff0000 fffa1b43 00000000 00ff0000
!	%f12 = 00000000 000000ff 00000000 000000ff
	stda	%f0,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	Mem[00000000300c1408] = 00ffffff, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 0000000000ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = fffa1b4300000043, %f16 = 6379e6d9 eb79e269
	ldda	[%i6+%o5]0x81,%f16	! %f16 = fffa1b43 00000043

p0_label_427:
!	%l1 = 0000ff0000000000, immd = fffffffffffff459, %l4 = 0000000000000000
	udivx	%l1,-0xba7,%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l1 = 0000ff0000000000
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010101430] = ff00ffff00000000, %l7 = 0000000000000000
	ldxa	[%i4+0x030]%asi,%l7	! %l7 = ff00ffff00000000
!	Mem[0000000010181408] = ffff0000, %l0 = 000000000000ffff
	lduwa	[%i6+%o4]0x88,%l0	! %l0 = 00000000ffff0000
!	Mem[0000000010181400] = 431bfaff, %l4 = 0000000000000000
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 000000000000431b
!	Mem[00000000100c1400] = 000000ff000000ff, %l2 = 0000000000ffffff
	ldxa	[%i3+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[000000001000142c] = 000000ff, %l2 = 000000ff000000ff
	lduha	[%i0+0x02e]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181410] = 00ffffffff00ffff, %l1 = ffffffffffffff00
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = 00ffffffff00ffff
!	Mem[0000000010041410] = 431bfaff, %l6 = fffffffffffa1b43
	ldsha	[%i1+%o5]0x88,%l6	! %l6 = fffffffffffffaff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (63)
!	Mem[0000000010141408] = 0000ffff, %l7 = ff00ffff00000000
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 000000000000ffff

p0_label_428:
!	%f15 = 000000ff, Mem[0000000030101408] = ff000000
	sta	%f15,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	Mem[0000000030001400] = c1f3ffff, %l2 = 00000000000000ff
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 000000c1000000ff
!	%l5 = 00000000ff000121, Mem[0000000010081400] = 0000ffff
	stha	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 0121ffff
!	%l6 = fffffffffffffaff, imm = ffffffffffffff82, %l1 = 00ffffffff00ffff
	and	%l6,-0x07e,%l1		! %l1 = fffffffffffffa82
!	%f7  = 000000ff, Mem[00000000100c1408] = ffff0000
	sta	%f7 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	%f14 = 00000000, Mem[00000000300c1408] = 00000000
	sta	%f14,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000010081412] = 0000ff00, %l2 = 00000000000000c1
	ldstub	[%i2+0x012],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000010001408] = 00000000, %l5 = 00000000ff000121
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = ff000000, %l0 = 00000000ffff0000
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%l0 = 0000000000000000, immd = 0000000000000a50, %l0 = 0000000000000000
	sdivx	%l0,0xa50,%l0		! %l0 = 0000000000000000

p0_label_429:
!	Mem[0000000010081410] = 00ff0000, %l1 = fffffffffffffa82
	lduba	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = ff000000fffa1b43, %l2 = 00000000000000ff
	ldxa	[%i3+%g0]0x81,%l2	! %l2 = ff000000fffa1b43
!	Mem[000000001018143c] = fffa1b43, %l6 = fffffffffffffaff
	ldsha	[%i6+0x03c]%asi,%l6	! %l6 = fffffffffffffffa
!	Mem[0000000010181408] = 0000ffffff000000, %l5 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l5	! %l5 = 0000ffffff000000
!	Mem[0000000030141408] = ff000000, %l4 = 000000000000431b
	lduwa	[%i5+%o4]0x89,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030141410] = 00ff0000, %l4 = 00000000ff000000
	lduwa	[%i5+%o5]0x81,%l4	! %l4 = 0000000000ff0000
!	Mem[0000000010181424] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i6+0x026]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041430] = 00ff48ff, %l2 = ff000000fffa1b43
	ldswa	[%i1+0x030]%asi,%l2	! %l2 = 0000000000ff48ff
!	Mem[0000000010181410] = 00ffffff, %l2 = 0000000000ff48ff
	ldsba	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = fffff3ff, %l0 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 00000000fffff3ff

p0_label_430:
!	%f11 = 00ff0000, %f9  = fffa1b43, %f8  = ffff0000
	fadds	%f11,%f9 ,%f8 		! %f8  = fffa1b43
!	%l0 = 00000000fffff3ff, Mem[00000000300c1408] = 00000000
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	%l2 = 0000000000000000, Mem[00000000100c1400] = ff000000
	stba	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l0 = 00000000fffff3ff, Mem[00000000300c1400] = ff000000
	stha	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = f3ff0000
!	%f30 = ff000000 00000000, Mem[00000000100c1408] = 000000ff 00ff0000
	std	%f30,[%i3+%o4]	! Mem[00000000100c1408] = ff000000 00000000
!	%f16 = fffa1b43 00000043 00000000 00000000
!	%f20 = 00000000 00ff0000 332bcfad ade90000
!	%f24 = 7b00ea38 fffa1b43 431bfaff 38ea007b
!	%f28 = 431bfaff 00ff0000 ff000000 00000000
	stda	%f16,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	%l2 = 0000000000000000, Mem[0000000030181400] = 00000000
	stba	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[0000000010181409] = 0000ffff, %l7 = 000000000000ffff
	ldstub	[%i6+0x009],%l7		! %l7 = 00000000000000ff
!	Mem[00000000100c1404] = ff000000, %l5 = ff000000, %l3 = 00000000
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %f8  = fffa1b43
	lda	[%i5+%o4]0x80,%f8 	! %f8 = 00000000

p0_label_431:
!	Code Fragment 4
p0_fragment_50:
!	%l0 = 00000000fffff3ff
	setx	0xa1bb13603c354c83,%g7,%l0 ! %l0 = a1bb13603c354c83
!	%l1 = 0000000000000000
	setx	0x6586b48794215c0a,%g7,%l1 ! %l1 = 6586b48794215c0a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a1bb13603c354c83
	setx	0xeeda61ef948c68d7,%g7,%l0 ! %l0 = eeda61ef948c68d7
!	%l1 = 6586b48794215c0a
	setx	0xf44dfc800a03d160,%g7,%l1 ! %l1 = f44dfc800a03d160
	membar	#Sync			! Added by membar checker (64)
!	Mem[0000000010141400] = 00fffaff fffffe83 00000000 ff000000
!	Mem[0000000010141410] = 00000000 ff000121 2100ff43 adcf2b33
!	Mem[0000000010141420] = 000000ff 00000000 00000000 ff0000ff
!	Mem[0000000010141430] = 0000ffff 000000ff ff000000 00000000
	ldda	[%i5]ASI_BLK_PL,%f16	! Block Load from 0000000010141400
!	Mem[0000000010041408] = 0000ff00, %l0 = eeda61ef948c68d7
	lduha	[%i1+0x00a]%asi,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010081420] = 00000000, %f9  = fffa1b43
	ld	[%i2+0x020],%f9 	! %f9 = 00000000
!	Mem[0000000030141410] = 00ff0000, %l7 = 0000000000000000
	ldswa	[%i5+%o5]0x81,%l7	! %l7 = 0000000000ff0000
!	Mem[0000000010181410] = ffffff00, %l7 = 0000000000ff0000
	lduba	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = fffaff00, %l6 = fffffffffffffffa
	ldswa	[%i5+%g0]0x88,%l6	! %l6 = fffffffffffaff00
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	ldswa	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l1 = f44dfc800a03d160, imm = fffffffffffff838, %l6 = fffffffffffaff00
	or	%l1,-0x7c8,%l6		! %l6 = fffffffffffff978
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030081408] = 00ff00ff
	stba	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 00ff0000

p0_label_432:
!	%f8  = 00000000 00000000, Mem[0000000010181410] = ffffff00 ffff00ff
	stda	%f8 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 00000000
!	Mem[0000000010001410] = 0000ff00, %l1 = f44dfc800a03d160
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 000000000000ff00
!	%l6 = fffff978, %l7 = 00000000, Mem[0000000010101410] = 00ff0000 43ff0000
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = fffff978 00000000
!	%l4 = 00ff0000, %l5 = ff000000, Mem[0000000030081408] = 00ff0000 ffff0000
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00ff0000 ff000000
!	%f2  = 00000000 ff000000, Mem[0000000010041438] = 006800ff 00000000
	stda	%f2 ,[%i1+0x038]%asi	! Mem[0000000010041438] = 00000000 ff000000
!	%l2 = 00000000, %l3 = ff000000, Mem[0000000030081408] = 0000ff00 000000ff
	stda	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 ff000000
!	Mem[0000000010041408] = 00ff0000, %l5 = 0000ffffff000000
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 0000000000ff0000
	membar	#Sync			! Added by membar checker (65)
!	%l0 = 000000000000ff00, Mem[0000000010141400] = 83fefffffffaff00
	stxa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000000000ff00
!	%l4 = 0000000000ff0000, Mem[0000000030141400] = 0000ffff
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff6880, %l1 = 000000000000ff00
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffff

p0_label_433:
!	Mem[00000000100c1408] = 000000ff, %l1 = ffffffffffffffff
	ldswa	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101400] = fffa1b43ffff0000, %f2  = 00000000 ff000000
	ldda	[%i4+%g0]0x80,%f2 	! %f2  = fffa1b43 ffff0000
!	Mem[0000000010141400] = 0000ff00, %l3 = 00000000ff000000
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030101410] = 0bfcffff, %l2 = 0000000000000000
	lduwa	[%i4+%o5]0x89,%l2	! %l2 = 000000000bfcffff
!	Mem[0000000010041400] = 43ff0000, %l7 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l7	! %l7 = 00000000000043ff
!	Mem[0000000030101400] = 000000ff, %l3 = ffffffffffffff00
	ldsha	[%i4+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041408] = 00000000 ff000000, %l4 = 00ff0000, %l5 = 00ff0000
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[00000000100c1408] = 000000ff, %l2 = 000000000bfcffff
	lduba	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = 0a03d160, %f3  = ffff0000
	lda	[%i0+%o5]0x80,%f3 	! %f3 = 0a03d160
!	Starting 10 instruction Store Burst
!	%f24 = 00000000 ff000000, Mem[0000000030081408] = 00000000 ff000000
	stda	%f24,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 ff000000

p0_label_434:
!	Mem[0000000010081410] = 0000ff00, %l3 = 00000000000000ff
	swapa	[%i2+%o5]0x80,%l3	! %l3 = 000000000000ff00
!	%f15 = 000000ff, Mem[0000000010081410] = ff000000
	sta	%f15,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	Mem[00000000211c0000] = ffff6880, %l2 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010181430] = ffffffff, %asi = 80
	stwa	%l2,[%i6+0x030]%asi	! Mem[0000000010181430] = 000000ff
!	Mem[00000000300c1410] = 00000a00, %l0 = 000000000000ff00
	ldstuba	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0000] = ffff3e5d, %l5 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 000000ff000000ff
!	%f12 = 00000000 000000ff, %l2 = 00000000000000ff
!	Mem[0000000030141438] = ff00000000000000
	add	%i5,0x038,%g1
	stda	%f12,[%g1+%l2]ASI_PST8_S ! Mem[0000000030141438] = 00000000000000ff
!	%f10 = 00000000 00ff0000, %l5 = 00000000000000ff
!	Mem[0000000010101438] = ffffff0000ff0000
	add	%i4,0x038,%g1
	stda	%f10,[%g1+%l5]ASI_PST8_P ! Mem[0000000010101438] = 0000000000ff0000
!	Mem[000000001008142b] = 0000ffff, %l2 = 00000000000000ff
	ldstub	[%i2+0x02b],%l2		! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000

p0_label_435:
!	Mem[0000000010001400] = 00000043, %l0 = 0000000000000000
	lduba	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000043
!	Mem[0000000020800040] = ffff726d, %l2 = 00000000000000ff
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181400] = 0000000000000000, %f20 = 210100ff 00000000
	ldda	[%i6+%g0]0x81,%f20	! %f20 = 00000000 00000000
!	Mem[0000000010141408] = 00000000ff000000, %f8  = 00000000 00000000
	ldda	[%i5+%o4]0x80,%f8 	! %f8  = 00000000 ff000000
!	%f2  = fffa1b43, %f13 = 000000ff, %f8  = 00000000
	fsubs	%f2 ,%f13,%f8 		! %f8  = fffa1b43
!	Mem[0000000010041428] = 000000ff, %l1 = 00000000000000ff
	lduw	[%i1+0x028],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030141410] = 000000000000ff00, %l2 = ffffffffffffffff
	ldxa	[%i5+%o5]0x89,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010081410] = ff000000, %l4 = 00000000ff000000
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[00000000100c1438] = 00000043, %l0 = 0000000000000043
	lduw	[%i3+0x038],%l0		! %l0 = 0000000000000043
!	Starting 10 instruction Store Burst
!	%f0  = fffa1b43 ffff0000 fffa1b43 0a03d160
!	%f4  = 00000000 0000ff00 ffffffff 000000ff
!	%f8  = fffa1b43 ff000000 00000000 00ff0000
!	%f12 = 00000000 000000ff 00000000 000000ff
	stda	%f0,[%i5]ASI_COMMIT_S	! Block Store to 0000000030141400

p0_label_436:
!	Mem[00000000100c1408] = 000000ff, %l2 = 000000000000ff00
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[00000000201c0000] = ffff3e5d
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = ffff3e5d
!	%l1 = 00000000000000ff, Mem[0000000020800040] = ffff726d
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 00ff726d
!	%l4 = 000000000000ff00, Mem[0000000030041410] = 00000000
	stba	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%l3 = 000000000000ff00, Mem[000000001010141a] = fffffe83
	stb	%l3,[%i4+0x01a]		! Mem[0000000010101418] = ffff0083
!	%f19 = 00000000, Mem[0000000010081408] = ff0000ff
	sta	%f19,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	Mem[0000000010101414] = 00000000, %l7 = 00000000000043ff, %asi = 80
	swapa	[%i4+0x014]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000211c0001] = ffff6880, %l5 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000, %l2 = 00000000000000ff
	lduwa	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000

p0_label_437:
!	Mem[0000000010081400] = 0121ffff 431bfaff, %l0 = 00000043, %l1 = 000000ff
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 000000000121ffff 00000000431bfaff
!	Mem[0000000010101400] = 431bfaff, %l4 = 000000000000ff00
	ldsha	[%i4+%g0]0x88,%l4	! %l4 = fffffffffffffaff
!	Mem[0000000010001404] = 431bfaff, %l5 = 00000000000000ff
	ldsw	[%i0+0x004],%l5		! %l5 = 00000000431bfaff
!	Mem[0000000030001400] = 00000000, %l3 = 000000000000ff00
	ldsba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800040] = 00ff726d, %l1 = 00000000431bfaff
	lduh	[%o1+0x040],%l1		! %l1 = 00000000000000ff
!	Mem[00000000100c1414] = 00000000, %l3 = 0000000000000000
	ldswa	[%i3+0x014]%asi,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (66)
!	Mem[0000000010141408] = 000000ff00000000, %f28 = ff000000 ffff0000
	ldda	[%i5+%o4]0x88,%f28	! %f28 = 000000ff 00000000
!	Mem[0000000010041408] = 00000000ff000000, %l5 = 00000000431bfaff
	ldxa	[%i1+%o4]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030041400] = ff000000, %l6 = fffffffffffff978
	lduha	[%i1+%g0]0x81,%l6	! %l6 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%f26 = ff0000ff 00000000, %l3 = 0000000000000000
!	Mem[0000000030141428] = 0000000000ff0000
	add	%i5,0x028,%g1
	stda	%f26,[%g1+%l3]ASI_PST32_S ! Mem[0000000030141428] = 0000000000ff0000

p0_label_438:
!	Mem[0000000030181408] = 00000000, %l3 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030141410] = 00000000
	stba	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l5 = 00000000ff000000, %l5 = 00000000ff000000, %l5 = 00000000ff000000
	and	%l5,%l5,%l5		! %l5 = 00000000ff000000
!	%f16 = 83feffff fffaff00 000000ff 00000000
!	%f20 = 00000000 00000000 332bcfad 43ff0021
!	%f24 = 00000000 ff000000 ff0000ff 00000000
!	%f28 = 000000ff 00000000 00000000 000000ff
	stda	%f16,[%i2]ASI_BLK_AIUPL	! Block Store to 0000000010081400
!	Mem[0000000030101410] = 0bfcffff, %l6 = 000000000000ff00
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030141410] = 00000000, %l6 = 00000000000000ff
	swapa	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181420] = ade90000, %l5 = 00000000ff000000, %asi = 80
	swapa	[%i6+0x020]%asi,%l5	! %l5 = 00000000ade90000
!	%l3 = 0000000000000000, Mem[0000000030181408] = 00000000
	stha	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%l2 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stba	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (67)
!	Mem[0000000010081400] = 00fffaff, %l5 = 00000000ade90000
	ldsba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_439:
!	Mem[0000000010101408] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %f25 = ff000000
	lda	[%i4+%o4]0x80,%f25	! %f25 = 00000000
!	Mem[0000000010081410] = 00000000, %l5 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = fffa1b43, %l3 = 0000000000000000
	ldsha	[%i1+0x012]%asi,%l3	! %l3 = 0000000000001b43
!	Mem[0000000030001400] = 0000000000000000, %l7 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l4 = fffffffffffffaff
	lduha	[%i4+0x008]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = 0a03d160, %l1 = 00000000000000ff
	lduha	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000a03
!	Mem[0000000010041428] = 000000ffffff0000, %l1 = 0000000000000a03
	ldx	[%i1+0x028],%l1		! %l1 = 000000ffffff0000
!	Mem[0000000010141410] = 00000000 ff000121, %l2 = 00000000, %l3 = 00001b43
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000 00000000ff000121
!	Starting 10 instruction Store Burst
!	%l0 = 000000000121ffff, Mem[0000000010001400] = 43000000431bfaff
	stxa	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000000121ffff

p0_label_440:
!	%l4 = 0000000000000000, Mem[000000001004140e] = 00000000, %asi = 80
	stha	%l4,[%i1+0x00e]%asi	! Mem[000000001004140c] = 00000000
!	%l2 = 00000000, %l3 = ff000121, Mem[0000000010181400] = 431bfaff fffffe83
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 ff000121
!	%l6 = 0000000000000000, Mem[0000000030181400] = 00000000
	stba	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[0000000030141410] = ff000000, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030001400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030141400] = 431bfaff
	stha	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 431b0000
!	Mem[0000000010081421] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i2+0x021]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[000000001004140d] = 00000000, %l0 = 000000000121ffff
	ldstub	[%i1+0x00d],%l0		! %l0 = 00000000000000ff
!	%f20 = 00000000 00000000, Mem[0000000010041408] = 000000ff 00ff0000
	stda	%f20,[%i1+0x008]%asi	! Mem[0000000010041408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff6880, %l1 = 000000ffffff0000
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffff

p0_label_441:
!	Mem[000000001018143c] = fffa1b43, %l6 = 0000000000000000
	lduw	[%i6+0x03c],%l6		! %l6 = 00000000fffa1b43
!	Mem[00000000100c1408] = ff000000, %f20 = 00000000
	ld	[%i3+%o4],%f20	! %f20 = ff000000
!	Mem[0000000010101408] = 00000000, %l1 = ffffffffffffffff
	lduha	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181418] = 0000000000000082, %f14 = 00000000 000000ff
	ldd	[%i6+0x018],%f14	! %f14 = 00000000 00000082
!	Mem[0000000010041410] = fffa1b43, %l7 = 00000000ff000000
	ldswa	[%i1+%o5]0x80,%l7	! %l7 = fffffffffffa1b43
!	Mem[00000000201c0000] = ffff3e5d, %l4 = 0000000000000000
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1410] = ff0a0000 00000000, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 00000000ff0a0000 0000000000000000
!	Mem[0000000010001408] = 00000000, %f10 = 00000000
	lda	[%i0+%o4]0x88,%f10	! %f10 = 00000000
!	Mem[00000000218000c0] = 00ff0fe0, %l0 = 0000000000000000
	lduha	[%o3+0x0c0]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 431bfaff, %l4 = 00000000ff0a0000
	ldstuba	[%i2+%o5]0x81,%l4	! %l4 = 00000043000000ff

p0_label_442:
!	Mem[0000000030141400] = 00001b43, %l6 = 00000000fffa1b43
	swapa	[%i5+%g0]0x81,%l6	! %l6 = 0000000000001b43
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000001b43
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0001] = ffff3e5d, %l3 = 00000000ff000121
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	%l6 = 00000000, %l7 = fffa1b43, Mem[00000000100c1410] = 00000000 00000000
	stda	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 fffa1b43
!	%l4 = 00000043, %l5 = 00000000, Mem[0000000030041400] = ff000000 ff000000
	stda	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000043 00000000
!	%l3 = 00000000000000ff, Mem[0000000030001408] = e9ad0000
	stba	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = ffad0000
!	Mem[0000000010041410] = 431bfaff, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 00000000431bfaff
!	%l4 = 0000000000000043, Mem[0000000010181408] = 00ffffffff000000
	stxa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000043
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = fffa1bff, %l2 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l2	! %l2 = 0000000000001bff

p0_label_443:
!	Mem[00000000300c1408] = ff000000, %f30 = 00000000
	lda	[%i3+%o4]0x81,%f30	! %f30 = ff000000
!	Mem[0000000030081410] = 83feffff fffa1bff, %l6 = 00000000, %l7 = fffa1b43
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 00000000fffa1bff 0000000083feffff
!	Mem[000000001010142c] = d9e67963, %l7 = 0000000083feffff
	ldsha	[%i4+0x02e]%asi,%l7	! %l7 = 0000000000007963
!	Mem[0000000030141408] = fffa1b43, %l3 = 00000000000000ff
	lduha	[%i5+%o4]0x81,%l3	! %l3 = 000000000000fffa
!	Mem[0000000030181408] = 00000000, %l4 = 0000000000000043
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000021800180] = ffffbce0, %l6 = 00000000fffa1bff
	ldsba	[%o3+0x181]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101410] = fffff978, %l4 = 0000000000000000
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = fffffffffffff978
!	Mem[0000000030001400] = 000000ff, %l0 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101410] = fffffc0b 0000ffff, %l2 = 00001bff, %l3 = 0000fffa
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000fffffc0b 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000021800000] = 0000b994, %l3 = 000000000000ffff
	ldstuba	[%o3+0x000]%asi,%l3	! %l3 = 00000000000000ff

p0_label_444:
!	%l6 = ffffffff, %l7 = 00007963, Mem[00000000100c1408] = ff000000 00000000
	stda	%l6,[%i3+0x008]%asi	! Mem[00000000100c1408] = ffffffff 00007963
!	Mem[00000000300c1408] = 000000ff, %l7 = 0000000000007963
	swapa	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030081408] = 000000ff00000000
	stxa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000010041400] = 43ff0000
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	Mem[000000001010141e] = fffa1b43, %l3 = 0000000000000000
	ldstub	[%i4+0x01e],%l3		! %l3 = 0000001b000000ff
!	%f8  = fffa1b43 ff000000, %l3 = 000000000000001b
!	Mem[0000000010001400] = 000000000121ffff
	stda	%f8,[%i0+%l3]ASI_PST16_P ! Mem[0000000010001400] = fffa0000ff000000
!	Mem[000000001008143b] = ff000000, %l4 = fffffffffffff978
	ldstub	[%i2+0x03b],%l4		! %l4 = 00000000000000ff
!	Code Fragment 3
p0_fragment_51:
!	%l0 = 00000000000000ff
	setx	0x7003abd7c846e4d0,%g7,%l0 ! %l0 = 7003abd7c846e4d0
!	%l1 = 00000000431bfaff
	setx	0x469072afe4eb2832,%g7,%l1 ! %l1 = 469072afe4eb2832
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7003abd7c846e4d0
	setx	0x41819b9fa8b745a3,%g7,%l0 ! %l0 = 41819b9fa8b745a3
!	%l1 = 469072afe4eb2832
	setx	0x7cd6b8efc05504ab,%g7,%l1 ! %l1 = 7cd6b8efc05504ab
!	Mem[0000000010001410] = 0a03d160, %l2 = 00000000fffffc0b
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 000000000a03d160
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff3e5d, %l4 = 0000000000000000
	ldsh	[%o0+%g0],%l4		! %l4 = ffffffffffffffff

p0_label_445:
!	Mem[0000000010041428] = 000000ff, %l6 = ffffffffffffffff
	lduh	[%i1+0x028],%l6		! %l6 = 0000000000000000
!	Mem[0000000030101410] = fffffc0b, %l5 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181438] = fffff57ffffa1b43, %l1 = 7cd6b8efc05504ab
	ldx	[%i6+0x038],%l1		! %l1 = fffff57ffffa1b43
!	Mem[0000000010001400] = 0000faff, %l7 = 00000000000000ff
	ldsba	[%i0+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041410] = 00000000, %l6 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l2 = 000000000a03d160
	ldswa	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c140c] = 00007963, %l4 = ffffffffffffffff
	lduwa	[%i3+0x00c]%asi,%l4	! %l4 = 0000000000007963
!	Mem[000000001018141c] = 00000082, %l6 = 0000000000000000
	ldsb	[%i6+0x01d],%l6		! %l6 = 0000000000000000
!	Mem[0000000010101410] = fffff978, %l3 = 000000000000001b
	ldsha	[%i4+%o5]0x80,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000010101428] = 0000ffff d9e67963
	std	%l6,[%i4+0x028]		! Mem[0000000010101428] = 00000000 ffffffff

p0_label_446:
!	Mem[0000000010041408] = 0000000000000000, %l2 = 0000000000000000, %l6 = 0000000000000000
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l2,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = ff0a0000, %l5 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%l1 = fffff57ffffa1b43, Mem[00000000100c1410] = fffa1b4300000000
	stxa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = fffff57ffffa1b43
!	Mem[0000000030081410] = ff1bfaff, %l3 = ffffffffffffffff
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 00000000ff1bfaff
!	%l5 = 00000000000000ff, Mem[0000000030001408] = 0000adff
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000adff
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000030141400] = 431bfaff 0000ffff
	stda	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 ffffffff
!	%f18 = 000000ff 00000000, Mem[0000000030001410] = 00ff00ff 431bfaff
	stda	%f18,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff 00000000
!	%f26 = ff0000ff 00000000, %f14 = 00000000 00000082
	fdtox	%f26,%f14		! %f14 = 80000000 00000000
!	Mem[0000000030041408] = 00000000, %l1 = fffff57ffffa1b43
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = 00000000, %l0 = 41819b9fa8b745a3
	ldsw	[%i2+0x030],%l0		! %l0 = 0000000000000000

p0_label_447:
!	Mem[00000000100c1408] = 63790000 ffffffff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 00000000ffffffff 0000000063790000
!	Mem[0000000010001410] = 0bfcffff, %l0 = 00000000ffffffff
	lduba	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181408] = 00000000, %l4 = 0000000000007963
	ldsha	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081434] = ff000000, %l3 = 00000000ff1bfaff
	ldsba	[%i2+0x035]%asi,%l3	! %l3 = 0000000000000000
!	%l1 = 0000000063790000, immed = 00000592, %y  = fffffffc
	udiv	%l1,0x592,%l1		! %l1 = 00000000ffffffff
	mov	%l0,%y			! %y = 000000ff
!	Mem[00000000211c0000] = ffff6880, %l4 = 0000000000000000
	lduba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l7 = ffffffffffffffff
	lduba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000218001c0] = 00ffa57a, %l1 = 00000000ffffffff
	lduha	[%o3+0x1c0]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = fffffe83, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l2	! %l2 = 00000000fffffe83

p0_label_448:
!	%f20 = ff000000 00000000, %l3 = 0000000000000000
!	Mem[0000000030181400] = 0000000000000000
	stda	%f20,[%i6+%l3]ASI_PST16_S ! Mem[0000000030181400] = 0000000000000000
!	%f24 = 00000000, %f13 = 000000ff
	fcmps	%fcc2,%f24,%f13		! %fcc2 = 1
!	Mem[0000000030101400] = 000000ff, %l5 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%f12 = 00000000, Mem[0000000010081408] = 00000000
	sta	%f12,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	Mem[000000001004143f] = ff000000, %l2 = 00000000fffffe83
	ldstuba	[%i1+0x03f]%asi,%l2	! %l2 = 00000000000000ff
!	%f24 = 00000000, Mem[0000000030041400] = 00000043
	sta	%f24,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Mem[0000000030041400] = 00000000, %l4 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%f9  = ff000000, %f12 = 00000000
	fcmps	%fcc3,%f9 ,%f12		! %fcc3 = 1
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 00ff726d, %l4 = 0000000000000000
	lduba	[%o1+0x040]%asi,%l4	! %l4 = 0000000000000000

p0_label_449:
!	Mem[00000000100c1400] = 0000000000000000, %f28 = 000000ff 00000000
	ldda	[%i3+%g0]0x80,%f28	! %f28 = 00000000 00000000
!	Code Fragment 4
p0_fragment_52:
!	%l0 = 00000000000000ff
	setx	0x05ef2a87a35f565e,%g7,%l0 ! %l0 = 05ef2a87a35f565e
!	%l1 = 00000000000000ff
	setx	0xf0069b3802b670b4,%g7,%l1 ! %l1 = f0069b3802b670b4
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 05ef2a87a35f565e
	setx	0x3188b8e81f4c8724,%g7,%l0 ! %l0 = 3188b8e81f4c8724
!	%l1 = f0069b3802b670b4
	setx	0xf485d10fddc74c77,%g7,%l1 ! %l1 = f485d10fddc74c77
!	Mem[0000000010081410] = 00000000, %l7 = 0000000000000000
	lduha	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = ffff6880, %l4 = 0000000000000000
	ldsb	[%o2+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041430] = 00ff48ff 378954ff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+0x030]%asi,%l6	! %l6 = 0000000000ff48ff 00000000378954ff
!	Mem[0000000030101410] = fffffc0b, %l6 = 0000000000ff48ff
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = fffffffffffffc0b
!	Mem[0000000030101410] = 0bfcffff, %l2 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = 000000ff 00000000, %l0 = 1f4c8724, %l1 = ddc74c77
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[000000001004141e] = 0000ff00, %asi = 80
	stha	%l2,[%i1+0x01e]%asi	! Mem[000000001004141c] = 000000ff

p0_label_450:
!	Mem[0000000030141408] = 431bfaff, %l4 = ffffffffffffffff
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 00000000431bfaff
!	Mem[0000000010041410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%f4  = 00000000 0000ff00, Mem[0000000010101400] = fffa1b43 ffff0000
	stda	%f4 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 0000ff00
!	Mem[0000000010001408] = 00000000, %l5 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	%l7 = 00000000378954ff, Mem[0000000010101408] = ff00000000000000, %asi = 80
	stxa	%l7,[%i4+0x008]%asi	! Mem[0000000010101408] = 00000000378954ff
!	Mem[0000000030181408] = 00000000, %l7 = 00000000378954ff
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000030141410] = 00000000
	stba	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	Mem[0000000010081410] = 00000000, %l6 = fffffffffffffc0b
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041410] = ff000000, %l6 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l5 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000

p0_label_451:
!	Mem[0000000010041410] = 00000000, %f14 = 80000000
	lda	[%i1+%o5]0x88,%f14	! %f14 = 00000000
!	Mem[0000000030041400] = 000000ff, %l0 = 00000000000000ff
	lduha	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%f16 = 83feffff fffaff00 000000ff 00000000
!	%f20 = ff000000 00000000 332bcfad 43ff0021
!	%f24 = 00000000 00000000 ff0000ff 00000000
!	%f28 = 00000000 00000000 ff000000 000000ff
	stda	%f16,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400
!	Mem[0000000021800080] = ffff05ff, %l5 = 0000000000000000
	lduh	[%o3+0x080],%l5		! %l5 = 000000000000ffff
!	Mem[00000000100c1408] = ffffffff, %l1 = 0000000000000000
	ldsba	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (68)
!	Mem[0000000030081408] = 00000000, %l6 = 00000000ff000000
	ldswa	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %f15 = 00000000
	lda	[%i1+%o4]0x80,%f15	! %f15 = 00000000
!	Mem[00000000100c1408] = ffffffff00007963, %f24 = 00000000 00000000
	ldda	[%i3+%o4]0x80,%f24	! %f24 = ffffffff 00007963
!	Mem[0000000030041410] = 00000000, %l2 = 00000000000000ff
	lduba	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = ffffffff 00007963, %l1 = ffffffffffffffff
!	Mem[0000000010041420] = 000000ffffffffff
	add	%i1,0x020,%g1
	stda	%f24,[%g1+%l1]ASI_PST8_P ! Mem[0000000010041420] = ffffffff00007963

p0_label_452:
!	Mem[0000000030101408] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l4 = 431bfaff, %l5 = 0000ffff, Mem[0000000010001410] = fffffc0b 00000000
	stda	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 431bfaff 0000ffff
!	%l4 = 431bfaff, %l5 = 0000ffff, Mem[0000000010081408] = 00000000 000000ff
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 431bfaff 0000ffff
!	%l7 = 0000000000000000, imm = 0000000000000a06, %l5 = 000000000000ffff
	addc	%l7,0xa06,%l5		! %l5 = 0000000000000a06
!	%f18 = 000000ff, Mem[0000000030101410] = 0bfcffff
	sta	%f18,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	%l2 = 0000000000000000, Mem[0000000030081400] = 00fffaff
	stwa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[0000000030141400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%f11 = 00ff0000, Mem[0000000030081410] = 00000000
	sta	%f11,[%i2+%o5]0x81	! Mem[0000000030081410] = 00ff0000
!	%f16 = 83feffff fffaff00 000000ff 00000000
!	%f20 = ff000000 00000000 332bcfad 43ff0021
!	%f24 = ffffffff 00007963 ff0000ff 00000000
!	%f28 = 00000000 00000000 ff000000 000000ff
	stda	%f16,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (69)
!	Mem[0000000010141400] = 00ff000000000000, %l5 = 0000000000000a06
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = 00ff000000000000

p0_label_453:
!	%f11 = 00ff0000, %f30 = ff000000
	fcmpes	%fcc3,%f11,%f30		! %fcc3 = 2
!	Mem[0000000010041400] = 000000ff, %l2 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l1 = ffffffffffffffff
	ldswa	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l0 = 00000000000000ff
	ldsha	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = ff000000 ffffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 00000000ff000000 00000000ffffffff
!	Mem[00000000100c1408] = ffffffff, %l0 = 0000000000000000
	ldsba	[%i3+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030081400] = 00000000fffffe83, %l4 = 00000000431bfaff
	ldxa	[%i2+%g0]0x81,%l4	! %l4 = 00000000fffffe83
!	Mem[0000000010101400] = 00000000, %l1 = 00000000000000ff
	lduwa	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 00ff0000, %l7 = 0000000000000000
	lduha	[%i5+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff000000, Mem[0000000010141400] = 00ff0000
	stha	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000

p0_label_454:
!	%l0 = ffffffffffffffff, Mem[000000001008140d] = ffff0000
	stb	%l0,[%i2+0x00d]		! Mem[000000001008140c] = ffff0000
!	%l7 = 00000000000000ff, %l7 = 00000000000000ff, %l7 = 00000000000000ff
	sdivx	%l7,%l7,%l7		! %l7 = 0000000000000001
!	%l3 = 00000000ffffffff, Mem[0000000010081410] = ff000000
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffff
!	%l2 = 00000000ff000000, Mem[00000000100c1404] = 00000000, %asi = 80
	stwa	%l2,[%i3+0x004]%asi	! Mem[00000000100c1404] = ff000000
!	%l4 = fffffe83, %l5 = 00000000, Mem[0000000010041408] = 00000000 00000000
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = fffffe83 00000000
!	%l6 = 00000000, %l7 = 00000001, Mem[0000000010001410] = fffa1b43 ffff0000
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 00000001
!	%l5 = 00ff000000000000, Mem[0000000010081400] = 83fefffffffaff00
	stxa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 00ff000000000000
!	%f4  = 00000000 0000ff00, Mem[0000000030041408] = fffa1b43 00000000
	stda	%f4 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 0000ff00
!	%l6 = 0000000000000000, Mem[0000000010141400] = 00000000
	stba	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_455:
!	Mem[0000000010001408] = ff000000, %l6 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010101400] = 00000000, %l4 = 00000000fffffe83
	lduwa	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l0 = ffffffffffffffff
	lduha	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = ff000000, %f8  = fffa1b43
	lda	[%i1+%g0]0x88,%f8 	! %f8 = ff000000
!	Mem[0000000030141408] = 00000000, %l7 = 0000000000000001
	ldsha	[%i5+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, %l2 = 00000000ff000000, %l2 = 00000000ff000000
	add	%l7,%l2,%l2		! %l2 = 00000000ff000000
!	Mem[0000000010081408] = fffa1b43, %f24 = ffffffff
	lda	[%i2+0x008]%asi,%f24	! %f24 = fffa1b43
!	Mem[0000000030041400] = 000000ff, %l1 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101408] = fd8308f0 ff0000ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000ff0000ff 00000000fd8308f0
!	Starting 10 instruction Store Burst
!	%f10 = 00000000 00ff0000, Mem[0000000030001400] = 000000ff 00000000
	stda	%f10,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 00ff0000

p0_label_456:
!	%f25 = 00007963, %f5  = 0000ff00
	fsqrts	%f25,%f5 		! %l0 = 0000000000000022, Unfinished, %fsr = 2500000400
!	%l0 = 0000000000000022, imm = fffffffffffffdc5, %l2 = 00000000ff000000
	addc	%l0,-0x23b,%l2		! %l2 = fffffffffffffde7
!	Mem[0000000010141400] = 00000000, %l6 = ffffffffff000000
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%f4  = 00000000 0000ff00, Mem[0000000010101408] = 00000000 378954ff
	stda	%f4 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 0000ff00
!	%f4  = 00000000 0000ff00, Mem[0000000010141410] = 00000000 ff000121
	std	%f4 ,[%i5+%o5]	! Mem[0000000010141410] = 00000000 0000ff00
!	%f15 = 00000000, Mem[0000000030181410] = 431bfaff
	sta	%f15,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	Mem[0000000030001410] = 00000000, %l2 = fffffffffffffde7
	swapa	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041420] = ffffffff00007963, %l2 = 0000000000000000, %l5 = 00000000fd8308f0
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = ffffffff00007963
!	Mem[0000000030101410] = 000000ff, %l4 = 00000000ff0000ff
	swapa	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffffffff, %l5 = ffffffff00007963
	ldsw	[%i2+%o5],%l5		! %l5 = ffffffffffffffff

p0_label_457:
!	Mem[0000000010001400] = 0000faff, %f2  = fffa1b43
	lda	[%i0+%g0]0x88,%f2 	! %f2 = 0000faff
!	Mem[0000000030081408] = 00000000, %l6 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = ff000000, %l0 = 0000000000000022
	lduba	[%i1+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0000] = ffff3e5d, %l5 = ffffffffffffffff
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[0000000030101408] = ff0000ff, %l2 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101400] = 000000ff, %l4 = 00000000000000ff
	ldswa	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081410] = ffffffff, %l1 = 00000000000000ff
	ldsha	[%i2+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = ffffffff, Mem[0000000010041400] = ff000000 00000000
	stda	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff ffffffff

p0_label_458:
!	%l5 = 000000000000ffff, Mem[0000000010181400] = 00000000
	stba	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000000
!	Mem[0000000030001410] = fffffde7, %l2 = 00000000000000ff
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 000000e7000000ff
!	%f0  = fffa1b43 ffff0000 0000faff 0a03d160
!	%f4  = 00000000 0000ff00 ffffffff 000000ff
!	%f8  = ff000000 ff000000 00000000 00ff0000
!	%f12 = 00000000 000000ff 00000000 00000000
	stda	%f0,[%i5]ASI_BLK_AIUP	! Block Store to 0000000010141400
!	%l4 = 00000000000000ff, imm = 00000000000007ff, %l1 = ffffffffffffffff
	and	%l4,0x7ff,%l1		! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (70)
!	Mem[0000000010141408] = 0000faff, %l5 = 000000000000ffff
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 000000000000faff
!	%l5 = 000000000000faff, Mem[0000000010181404] = ff000121
	stw	%l5,[%i6+0x004]		! Mem[0000000010181404] = 0000faff
!	%f23 = 43ff0021, Mem[00000000100c1400] = 00000000
	sta	%f23,[%i3+%g0]0x80	! Mem[00000000100c1400] = 43ff0021
!	%l6 = 0000000000000000, Mem[0000000030041410] = 00000000
	stba	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l1 = 00000000000000ff, Mem[0000000030141408] = 00000000
	stwa	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 43000000 00000000, %l0 = 000000ff, %l1 = 000000ff
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000 0000000043000000

p0_label_459:
!	Mem[0000000010081400] = 000000000000ff00, %l5 = 000000000000faff
	ldxa	[%i2+%g0]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010141408] = ffff0000, %l5 = 000000000000ff00
	ldsha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = ff0000ff, %l7 = 0000000000000000
	lduha	[%i4+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = ffffffff, %l3 = 00000000ffffffff
	lduha	[%i3+%o4]0x88,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030101400] = ff000000, %l4 = 00000000000000ff
	ldsba	[%i4+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	%l7 = 00000000000000ff, imm = 0000000000000811, %l4 = ffffffffffffffff
	and	%l7,0x811,%l4		! %l4 = 0000000000000011
!	Mem[0000000030041400] = ff000000, %l7 = 00000000000000ff
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181408] = ff000000, %l3 = 000000000000ffff
	lduha	[%i6+%o4]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010141400] = fffa1b43, %l3 = 000000000000ff00
	ldsha	[%i5+%g0]0x80,%l3	! %l3 = fffffffffffffffa
!	Starting 10 instruction Store Burst
!	%f22 = 332bcfad, %f18 = 000000ff, %f15 = 00000000
	fdivs	%f22,%f18,%f15		! %l0 = 0000000000000022, Unfinished, %fsr = 2500000400

p0_label_460:
!	%l7 = 00000000000000ff, imm = 00000000000000dc, %l2 = 00000000000000e7
	sub	%l7,0x0dc,%l2		! %l2 = 0000000000000023
!	%l0 = 0000000000000022, Mem[00000000300c1408] = 0000000000007963
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000022
!	%f16 = 83feffff fffaff00 000000ff 00000000
!	%f20 = ff000000 00000000 332bcfad 43ff0021
!	%f24 = fffa1b43 00007963 ff0000ff 00000000
!	%f28 = 00000000 00000000 ff000000 000000ff
	stda	%f16,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	Mem[0000000010081404] = 0000ff00, %l0 = 0000000000000022, %asi = 80
	swapa	[%i2+0x004]%asi,%l0	! %l0 = 000000000000ff00
!	%f0  = fffa1b43, Mem[00000000300c1408] = 00000022
	sta	%f0 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = fffa1b43
!	%f0  = fffa1b43 ffff0000, %l6 = 0000000000000000
!	Mem[0000000010081408] = fffa1b43ffff0000
	add	%i2,0x008,%g1
	stda	%f0,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010081408] = fffa1b43ffff0000
!	%l4 = 0000000000000011, Mem[0000000010001408] = ff000000
	stba	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000011
!	%f3  = 0a03d160, Mem[0000000010101408] = 000000ff
	sta	%f3 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 0a03d160
!	%l2 = 0000000000000023, Mem[0000000010041400] = ff000000
	stha	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00230000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000000ff, %l3 = fffffffffffffffa
	lduba	[%i6+%g0]0x88,%l3	! %l3 = 00000000000000ff

p0_label_461:
	membar	#Sync			! Added by membar checker (71)
!	Mem[000000001010141c] = 43ff0021, %l1 = 0000000043000000
	lduba	[%i4+0x01c]%asi,%l1	! %l1 = 0000000000000043
!	Mem[0000000010001414] = 01000000, %l0 = 000000000000ff00
	lduha	[%i0+0x014]%asi,%l0	! %l0 = 0000000000000100
!	Mem[0000000010101408] = 0a03d160, %l6 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l6	! %l6 = 000000000a03d160
!	Mem[0000000030141400] = 00fffaff, %l4 = 0000000000000011
	ldsba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Code Fragment 4
p0_fragment_53:
!	%l0 = 0000000000000100
	setx	0x4d98ead808bbadc0,%g7,%l0 ! %l0 = 4d98ead808bbadc0
!	%l1 = 0000000000000043
	setx	0x42c915c81a5ea482,%g7,%l1 ! %l1 = 42c915c81a5ea482
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4d98ead808bbadc0
	setx	0xad30a4878df28aa1,%g7,%l0 ! %l0 = ad30a4878df28aa1
!	%l1 = 42c915c81a5ea482
	setx	0xb6ac20f00b2eac46,%g7,%l1 ! %l1 = b6ac20f00b2eac46
!	Mem[0000000010141408] = 0000ffff, %l1 = b6ac20f00b2eac46
	ldswa	[%i5+%o4]0x80,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030101410] = ff0000ff, %l4 = 0000000000000000
	lduha	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l3 = 00000000000000ff
	ldswa	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010001408] = 110000ff
	stwa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000

p0_label_462:
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010001408] = 00000000 00000000
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 00000000
!	%l3 = 0000000000000000, Mem[0000000010001410] = 00000000
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%l2 = 0000000000000023, Mem[0000000010081400] = 00000000
	stha	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00230000
!	Mem[0000000030081410] = 0000ff00, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 000000000000ff00
!	%l6 = 0a03d160, %l7 = 000000ff, Mem[00000000300c1400] = f3ff0000 fffa1b43
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0a03d160 000000ff
!	Mem[0000000010081408] = fffa1b43, %l2 = 0000000000000023
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010141410] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081404] = 00000022, %l1 = 0000ffff, %l2 = 00000000
	add	%i2,0x04,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 0000000000000022
!	Mem[00000000300c1410] = ff0a0000, %l2 = 0000000000000022
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l5 = 0000000000000000
	ldsba	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000

p0_label_463:
!	Mem[0000000010141408] = 0000ffff, %l6 = 000000000a03d160
	ldsba	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = fffa1b43, %l4 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041408] = 83feffff, %l2 = 00000000000000ff
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030081408] = 00000000, %l2 = 000000000000ffff
	lduba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 43ff0021, %l0 = ad30a4878df28aa1
	ldsba	[%i3+0x003]%asi,%l0	! %l0 = 0000000000000021
!	Mem[0000000010041400] = 00002300, %l0 = 0000000000000021
	ldswa	[%i1+%g0]0x88,%l0	! %l0 = 0000000000002300
!	Mem[0000000010181410] = 0000000000000000, %f18 = 000000ff 00000000
	ldda	[%i6+%o5]0x80,%f18	! %f18 = 00000000 00000000
!	Mem[0000000030081400] = 00000000, %l7 = 00000000000000ff
	lduha	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081418] = 2100ff43, %l2 = 0000000000000000
	lduba	[%i2+0x018]%asi,%l2	! %l2 = 0000000000000021
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000ffff, Mem[00000000211c0000] = ffff6880, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff6880

p0_label_464:
!	%f2  = 0000faff, Mem[0000000010001410] = 00000000
	sta	%f2 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000faff
!	%f30 = ff000000 000000ff, %f25 = 00007963
	fdtoi	%f30,%f25		! %f25 = 80000000
!	%f27 = 00000000, %f5  = 0000ff00, %f10 = 00000000
	fdivs	%f27,%f5 ,%f10		! %f10 = 00000000
!	Code Fragment 3
p0_fragment_54:
!	%l0 = 0000000000002300
	setx	0x128d92107f636f6b,%g7,%l0 ! %l0 = 128d92107f636f6b
!	%l1 = 000000000000ffff
	setx	0xb6d643384c25c7d7,%g7,%l1 ! %l1 = b6d643384c25c7d7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 128d92107f636f6b
	setx	0x32274307d50615a3,%g7,%l0 ! %l0 = 32274307d50615a3
!	%l1 = b6d643384c25c7d7
	setx	0xb74f3d786926f8a4,%g7,%l1 ! %l1 = b74f3d786926f8a4
!	%l1 = b74f3d786926f8a4, Mem[00000000211c0000] = ffff6880
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = f8a46880
!	%l0 = d50615a3, %l1 = 6926f8a4, Mem[00000000100c1400] = 2100ff43 000000ff
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = d50615a3 6926f8a4
!	%f23 = 43ff0021, Mem[00000000100c143c] = 00000000
	st	%f23,[%i3+0x03c]	! Mem[00000000100c143c] = 43ff0021
!	Mem[00000000211c0001] = f8a46880, %l2 = 0000000000000021
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 000000a4000000ff
!	Mem[0000000010081437] = ff000000, %l2 = 00000000000000a4
	ldstuba	[%i2+0x037]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l5 = 0000000000000000
	lduwa	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_465:
!	Mem[0000000010181400] = ff000000 0000faff 00000000 00000043
!	Mem[0000000010181410] = 00000000 00000000 00000000 00000082
!	Mem[0000000010181420] = ff000000 000000ff 00ff0000 00000000
!	Mem[0000000010181430] = 000000ff 00ff0000 fffff57f fffa1b43
	ldda	[%i6]ASI_BLK_P,%f0	! Block Load from 0000000010181400
!	Mem[0000000010041418] = 0000ff00 000000ff, %l4 = ffffffff, %l5 = 00000000
	ldd	[%i1+0x018],%l4		! %l4 = 000000000000ff00 00000000000000ff
!	Mem[0000000030101410] = ff0000ff, %l1 = b74f3d786926f8a4
	ldswa	[%i4+%o5]0x81,%l1	! %l1 = ffffffffff0000ff
!	Mem[0000000010001428] = 7b00ea38fffa1b43, %l3 = 000000000000ff00
	ldx	[%i0+0x028],%l3		! %l3 = 7b00ea38fffa1b43
!	Mem[0000000030001408] = 0000ffff0000adff, %l4 = 000000000000ff00
	ldxa	[%i0+%o4]0x89,%l4	! %l4 = 0000ffff0000adff
!	Mem[0000000030101410] = ff0000ff, %l6 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141400] = 0000ffff431bfaff, %l7 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l7	! %l7 = 0000ffff431bfaff
!	Mem[0000000030081400] = 00000000, %f26 = ff0000ff
	lda	[%i2+%g0]0x89,%f26	! %f26 = 00000000
!	%f22 = 332bcfad, %f25 = 80000000, %f17 = fffaff00
	fdivs	%f22,%f25,%f17		! %f17 = ff800000
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_55:
!	%l0 = 32274307d50615a3
	setx	0x85cc2a503f01503c,%g7,%l0 ! %l0 = 85cc2a503f01503c
!	%l1 = ffffffffff0000ff
	setx	0xa2ce9b00646609e4,%g7,%l1 ! %l1 = a2ce9b00646609e4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 85cc2a503f01503c
	setx	0xbe6b3db0094b3cff,%g7,%l0 ! %l0 = be6b3db0094b3cff
!	%l1 = a2ce9b00646609e4
	setx	0xd93fce081f5f1ace,%g7,%l1 ! %l1 = d93fce081f5f1ace

p0_label_466:
!	%f16 = 83feffff ff800000, %l0 = be6b3db0094b3cff
!	Mem[0000000010001408] = 0000000000000000
	add	%i0,0x008,%g1
	stda	%f16,[%g1+%l0]ASI_PST32_P ! Mem[0000000010001408] = 83feffffff800000
!	%f20 = ff000000 00000000, Mem[0000000030081410] = 00000000 000000ff
	stda	%f20,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000 00000000
!	%f26 = 00000000 00000000, Mem[0000000010041410] = 00000000 ffffbaff
	std	%f26,[%i1+%o5]	! Mem[0000000010041410] = 00000000 00000000
!	%l0 = 094b3cff, %l1 = 1f5f1ace, Mem[0000000030141408] = ff000000 000000ff
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 094b3cff 1f5f1ace
!	%l0 = 094b3cff, %l1 = 1f5f1ace, Mem[0000000010101408] = 60d1030a 00000000
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 094b3cff 1f5f1ace
!	Mem[0000000030141408] = ff3c4b09, %l7 = 0000ffff431bfaff
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l0 = be6b3db0094b3cff, Mem[0000000021800041] = ff7b2728
	stb	%l0,[%o3+0x041]		! Mem[0000000021800040] = ffff2728
!	%f20 = ff000000 00000000, Mem[0000000030081410] = ff000000 00000000
	stda	%f20,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000 00000000
!	%l7 = 00000000000000ff, Mem[0000000010141410] = ff000000
	stwa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 83feffff ff800000, %l2 = 00000000, %l3 = fffa1b43
	ldda	[%i0+0x008]%asi,%l2	! %l2 = 0000000083feffff 00000000ff800000

p0_label_467:
!	Mem[0000000010181418] = 00000000, %f24 = fffa1b43
	lda	[%i6+0x018]%asi,%f24	! %f24 = 00000000
!	Mem[0000000030181410] = 4300000000000000, %l2 = 0000000083feffff
	ldxa	[%i6+%o5]0x89,%l2	! %l2 = 4300000000000000
!	Mem[00000000300c1410] = ff0a0000, %l3 = 00000000ff800000
	ldsba	[%i3+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141410] = 000000ff 0000ff00, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 00000000000000ff 000000000000ff00
!	Mem[00000000100c1400] = 6926f8a4d50615a3, %f22 = 332bcfad 43ff0021
	ldda	[%i3+%g0]0x88,%f22	! %f22 = 6926f8a4 d50615a3
!	Mem[0000000030081410] = ff000000 00000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000010181400] = ff000000 0000faff, %l0 = 094b3cff, %l1 = 1f5f1ace
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000ff000000 000000000000faff
!	Mem[0000000030141408] = ff3c4b09, %l7 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181400] = 00000000, %l1 = 000000000000faff
	ldsha	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff000000, Mem[0000000010101433] = 00000000
	stb	%l0,[%i4+0x033]		! Mem[0000000010101430] = 00000000

p0_label_468:
!	Mem[0000000010041408] = fffffe83, %l1 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l1	! %l1 = 00000000fffffe83
!	%f26 = 00000000 00000000, Mem[0000000010001408] = 83feffff ff800000
	stda	%f26,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 00000000
!	%f28 = 00000000 00000000, Mem[00000000100c1400] = d50615a3 6926f8a4
	stda	%f28,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 00000000
!	%l4 = 0000ffff0000adff, Mem[0000000010041400] = 00230000ffffffff
	stxa	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000ffff0000adff
!	Mem[0000000010081438] = ff0000ff00000000, %l0 = 00000000ff000000, %l7 = ffffffffffffffff
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = ff0000ff00000000
	membar	#Sync			! Added by membar checker (72)
!	%l2 = 000000ff, %l3 = 0000ff00, Mem[0000000010181400] = ff000000 0000faff
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff 0000ff00
!	%l4 = 0000ffff0000adff, imm = 000000000000024f, %l3 = 000000000000ff00
	add	%l4,0x24f,%l3		! %l3 = 0000ffff0000b04e
!	%l6 = 00000000ff000000, Mem[000000001004140b] = 00000000
	stb	%l6,[%i1+0x00b]		! Mem[0000000010041408] = 00000000
!	%f16 = 83feffff, Mem[0000000030001410] = fffdffff
	sta	%f16,[%i0+%o5]0x81	! Mem[0000000030001410] = 83feffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041404] = 0000adff, %l5 = 00000000000000ff
	lduba	[%i1+0x006]%asi,%l5	! %l5 = 00000000000000ad

p0_label_469:
!	Mem[0000000030181400] = 00000000, %l1 = 00000000fffffe83
	lduha	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 0000ffff, %f26 = 00000000
	lda	[%i5+%o4]0x80,%f26	! %f26 = 0000ffff
!	Mem[0000000010141410] = 000000ff 0000ff00, %l2 = 000000ff, %l3 = 0000b04e
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 00000000000000ff 000000000000ff00
!	Mem[0000000010101408] = ff3c4b09, %l2 = 00000000000000ff
	lduba	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101410] = ff0000ff, %l2 = 00000000000000ff
	ldsha	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Code Fragment 4
p0_fragment_56:
!	%l0 = 00000000ff000000
	setx	0x4cfaf64854583f9c,%g7,%l0 ! %l0 = 4cfaf64854583f9c
!	%l1 = 0000000000000000
	setx	0x57fb16f01c447a1c,%g7,%l1 ! %l1 = 57fb16f01c447a1c
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4cfaf64854583f9c
	setx	0x9f6b297f80fa23d5,%g7,%l0 ! %l0 = 9f6b297f80fa23d5
!	%l1 = 57fb16f01c447a1c
	setx	0x69326f1ffcb6466a,%g7,%l1 ! %l1 = 69326f1ffcb6466a
!	Mem[0000000030141408] = ff3c4b09, %l7 = ff0000ff00000000
	ldsha	[%i5+%o4]0x81,%l7	! %l7 = ffffffffffffff3c
!	Mem[00000000201c0000] = ffff3e5d, %l4 = 0000ffff0000adff
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1424] = c6f3ecaf, %f5  = 00000000
	ld	[%i3+0x024],%f5 	! %f5 = c6f3ecaf
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000010181400] = ff000000
	stha	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ff00ffff

p0_label_470:
!	%l0 = 9f6b297f80fa23d5, Mem[0000000010081408] = fffa1b43
	stha	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 23d51b43
!	%l5 = 00000000000000ad, Mem[0000000010101438] = ff000000000000ff, %asi = 80
	stxa	%l5,[%i4+0x038]%asi	! Mem[0000000010101438] = 00000000000000ad
!	Mem[0000000030081400] = 00000000, %l0 = 9f6b297f80fa23d5
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Code Fragment 4
p0_fragment_57:
!	%l0 = 0000000000000000
	setx	0x2e7b6657d62b6662,%g7,%l0 ! %l0 = 2e7b6657d62b6662
!	%l1 = 69326f1ffcb6466a
	setx	0x4fe081101f126ff8,%g7,%l1 ! %l1 = 4fe081101f126ff8
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2e7b6657d62b6662
	setx	0x18434e382778fc08,%g7,%l0 ! %l0 = 18434e382778fc08
!	%l1 = 4fe081101f126ff8
	setx	0x764e2f678f0927c4,%g7,%l1 ! %l1 = 764e2f678f0927c4
!	%l6 = ff000000, %l7 = ffffff3c, Mem[0000000010001408] = 00000000 00000000
	stda	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000 ffffff3c
!	Mem[0000000010041400] = ffff0000, %l3 = 000000000000ff00
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%l4 = ffffffffffffffff, Mem[0000000030141400] = fffaff00
	stwa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffff
!	Mem[0000000030041408] = 00000000, %l5 = 00000000000000ad
	swapa	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l1 = 764e2f678f0927c4
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l2 = 00000000000000ff
	ldsba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_471:
!	Mem[00000000201c0000] = ffff3e5d, %l0 = 18434e382778fc08
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l7 = ffffffffffffff3c
	lduha	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %f8  = ff000000
	lda	[%i6+%o4]0x80,%f8 	! %f8 = 00000000
!	Mem[0000000010101410] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000211c0000] = f8ff6880, %l2 = ffffffffffffffff
	ldsba	[%o2+0x000]%asi,%l2	! %l2 = fffffffffffffff8
!	Mem[00000000300c1400] = 60d1030a, %l3 = 0000000000000000
	ldswa	[%i3+%g0]0x89,%l3	! %l3 = 0000000060d1030a
!	Mem[0000000010081400] = 00230000, %l0 = 00000000000000ff
	lduba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 0000ffff0a03d160, %f16 = 83feffff ff800000
	ldda	[%i5+%o4]0x80,%f16	! %f16 = 0000ffff 0a03d160
!	Mem[0000000030141410] = 00000000, %l0 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000030041410] = 00000000 ff000121
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffff 00000000

p0_label_472:
!	%f18 = 00000000 00000000, Mem[0000000010181418] = 00000000 00000082
	std	%f18,[%i6+0x018]	! Mem[0000000010181418] = 00000000 00000000
!	%l6 = ff000000, %l7 = 00000000, Mem[00000000100c1410] = 431bfaff 7ff5ffff
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000 00000000
!	%l7 = 0000000000000000, Mem[00000000300c1408] = 431bfaff
	stwa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Mem[000000001000141f] = adcf2b33, %l4 = ffffffffffffffff
	ldstub	[%i0+0x01f],%l4		! %l4 = 00000033000000ff
!	%l6 = 00000000ff000000, Mem[0000000030141408] = ff3c4b09ce1a5f1f
	stxa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000ff000000
!	Mem[00000000300c1400] = 0a03d160, %l0 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 000000000a03d160
!	%l2 = fffffff8, %l3 = 60d1030a, Mem[0000000010181410] = 00000000 00000000
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = fffffff8 60d1030a
!	Mem[0000000030101400] = ff000000, %l3 = 0000000060d1030a
	swapa	[%i4+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	%l5 = 0000000000000000, Mem[0000000010001400] = fffa0000
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ffffffff fffffe83, %l6 = ff000000, %l7 = 00000000
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000ffffffff 00000000fffffe83

p0_label_473:
!	Mem[0000000010101428] = ff0000ff, %l2 = fffffffffffffff8
	ldsw	[%i4+0x028],%l2		! %l2 = ffffffffff0000ff
!	Mem[0000000010001428] = 7b00ea38, %l6 = 00000000ffffffff
	lduba	[%i0+0x029]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1418] = b78954ff, %l1 = 0000000000000000
	ldswa	[%i3+0x018]%asi,%l1	! %l1 = ffffffffb78954ff
!	Mem[0000000010141410] = 000000ff 0000ff00, %l6 = 00000000, %l7 = fffffe83
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 00000000000000ff 000000000000ff00
!	Mem[0000000030101408] = ff0000ff f00883fd, %l0 = 0a03d160, %l1 = b78954ff
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 00000000ff0000ff 00000000f00883fd
!	Mem[0000000030181410] = 0000000000000043, %l7 = 000000000000ff00
	ldxa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000043
!	Mem[0000000010001414] = 01000000, %l4 = 0000000000000033
	lduba	[%i0+0x014]%asi,%l4	! %l4 = 0000000000000001
!	Mem[0000000010101420] = fffa1b43, %f14 = fffff57f
	ld	[%i4+0x020],%f14	! %f14 = fffa1b43
!	Mem[0000000010141438] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i5+0x03b]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f14 = fffa1b43 fffa1b43, Mem[00000000100c1418] = b78954ff fffa1b43
	stda	%f14,[%i3+0x018]%asi	! Mem[00000000100c1418] = fffa1b43 fffa1b43

p0_label_474:
!	Mem[00000000201c0000] = ffff3e5d, %l1 = 00000000f00883fd
	ldsh	[%o0+%g0],%l1		! %l1 = ffffffffffffffff
!	%f6  = 00000000 00000082, Mem[0000000010041400] = ff00ffff 0000adff
	stda	%f6 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 00000082
!	%l4 = 00000001, %l5 = 00000000, Mem[0000000030141410] = 00000000 ff000000
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000001 00000000
!	%l2 = ffffffffff0000ff, Mem[0000000010181400] = ffff00ff
	stwa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = ff0000ff
!	%l5 = 0000000000000000, Mem[00000000300c1410] = ff0a0000
	stba	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000a0000
!	Mem[0000000030141410] = 00000001, %l3 = 00000000ff000000
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 00000001000000ff
!	%l4 = 0000000000000001, Mem[0000000010101400] = 00fffafffffffe83
	stxa	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000001
!	%l6 = 00000000, %l7 = 00000043, Mem[0000000010141408] = ffff0000 60d1030a
	stda	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 00000043
!	%l0 = ff0000ff, %l1 = ffffffff, Mem[00000000100c1408] = ffffffff 00007963
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff0000ff ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000001fffa0000, %f26 = 0000ffff 00000000
	ldda	[%i0+%o5]0x88,%f26	! %f26 = 00000001 fffa0000

p0_label_475:
!	Mem[0000000010001438] = 00000000000000ff, %f20 = ff000000 00000000
	ldda	[%i0+0x038]%asi,%f20	! %f20 = 00000000 000000ff
!	Mem[00000000100c1408] = ff0000ffffffffff, %l3 = 0000000000000001
	ldx	[%i3+%o4],%l3		! %l3 = ff0000ffffffffff
!	Mem[0000000030141400] = ffffffff, %f27 = fffa0000
	lda	[%i5+%g0]0x81,%f27	! %f27 = ffffffff
!	Mem[0000000030101410] = ff0000ff 0000ffff, %l2 = ff0000ff, %l3 = ffffffff
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000ff0000ff 000000000000ffff
!	Mem[0000000010081414] = 00000000, %l3 = 000000000000ffff
	ldsha	[%i2+0x014]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l4 = 0000000000000001
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = ff0000ff, %f0  = ff000000
	lda	[%i4+%o5]0x89,%f0 	! %f0 = ff0000ff
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000000
	lduba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l4 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c141d] = fffa1b43, %l2 = 00000000ff0000ff
	ldstub	[%i3+0x01d],%l2		! %l2 = 000000fa000000ff

p0_label_476:
!	%l5 = 0000000000000000, Mem[0000000010001408] = ff000000
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	%l0 = 00000000ff0000ff, Mem[000000001018143c] = fffa1b43, %asi = 80
	stwa	%l0,[%i6+0x03c]%asi	! Mem[000000001018143c] = ff0000ff
!	%l3 = 0000000000000000, Mem[0000000010041438] = 00000000
	stw	%l3,[%i1+0x038]		! Mem[0000000010041438] = 00000000
!	Mem[0000000010081410] = ffffffff, %l2 = 00000000000000fa
	swapa	[%i2+%o5]0x80,%l2	! %l2 = 00000000ffffffff
!	%l1 = ffffffffffffffff, Mem[0000000010181410] = 0a03d160f8ffffff
	stxa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffffffffffff
!	Mem[000000001000143d] = 000000ff, %l7 = 0000000000000043
	ldstub	[%i0+0x03d],%l7		! %l7 = 00000000000000ff
!	%l4 = 000000ff, %l5 = 00000000, Mem[00000000100c1428] = 006800ff 00000000
	std	%l4,[%i3+0x028]		! Mem[00000000100c1428] = 000000ff 00000000
!	Mem[00000000201c0001] = ffff3e5d, %l6 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030001410] = fffffe83, %l2 = 00000000ffffffff
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 00000083000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = c427098f, %l3 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l3	! %l3 = 000000000000098f

p0_label_477:
!	Mem[0000000030001410] = fffeffff, %l7 = 0000000000000000
	ldsba	[%i0+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1408] = 00000000, %l7 = ffffffffffffffff
	lduha	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 00000000 43000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000 0000000043000000
!	Mem[0000000010001408] = 00000000, %l5 = 0000000043000000
	lduha	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = 23d51b43, %l0 = 00000000ff0000ff
	ldswa	[%i2+%o4]0x80,%l0	! %l0 = 0000000023d51b43
!	Mem[0000000030001408] = 0000ffff0000adff, %f0  = ff0000ff 0000faff
	ldda	[%i0+%o4]0x89,%f0 	! %f0  = 0000ffff 0000adff
!	Mem[0000000010181400] = ff0000ff0000ff00, %l1 = ffffffffffffffff
	ldx	[%i6+%g0],%l1		! %l1 = ff0000ff0000ff00
!	Mem[0000000030141400] = ffffffff fffffe83, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 00000000ffffffff 00000000fffffe83
!	Mem[00000000100c1408] = ffffffff ff0000ff, %l4 = ffffffff, %l5 = fffffe83
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000ff0000ff 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%f12 = 000000ff, Mem[0000000010041434] = 378954ff
	sta	%f12,[%i1+0x034]%asi	! Mem[0000000010041434] = 000000ff

p0_label_478:
!	Code Fragment 4
p0_fragment_58:
!	%l0 = 0000000023d51b43
	setx	0x81bf5278295c165b,%g7,%l0 ! %l0 = 81bf5278295c165b
!	%l1 = ff0000ff0000ff00
	setx	0x010107e8391ddcfb,%g7,%l1 ! %l1 = 010107e8391ddcfb
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 81bf5278295c165b
	setx	0x5b3e56cfda62852d,%g7,%l0 ! %l0 = 5b3e56cfda62852d
!	%l1 = 010107e8391ddcfb
	setx	0x12340d3047b43106,%g7,%l1 ! %l1 = 12340d3047b43106
!	Mem[00000000201c0000] = ffff3e5d, %l7 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	%f0  = 0000ffff 0000adff, Mem[0000000010001410] = 0000faff 01000000
	stda	%f0 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000ffff 0000adff
!	Mem[0000000030101400] = 60d1030a, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 0000000060d1030a
!	Mem[0000000010101435] = 00000000, %l2 = 0000000000000083
	ldstuba	[%i4+0x035]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l7 = 000000000000ffff
	ldstub	[%i5+%o4],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030141410] = 000000ff, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%f13 = 00ff0000, Mem[0000000010081410] = 000000fa
	sta	%f13,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ff0000
!	%l0 = 5b3e56cfda62852d, %l7 = 0000000000000000, %l7 = 0000000000000000
	xor	%l0,%l7,%l7		! %l7 = 5b3e56cfda62852d
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 0000adff, %l2 = 00000000000000ff
	lduha	[%i0+%o4]0x89,%l2	! %l2 = 000000000000adff

p0_label_479:
!	Mem[0000000030081408] = 00000000, %l6 = 0000000060d1030a
	ldsba	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l2 = 000000000000adff
	ldsha	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = ff0000ff, %l4 = 00000000ff0000ff
	ldswa	[%i4+%o5]0x81,%l4	! %l4 = ffffffffff0000ff
!	Mem[0000000030001410] = fffffeff, %l6 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101408] = 094b3cff, %l7 = 5b3e56cfda62852d
	lduba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = 000000ff, %l6 = ffffffffffffffff
	ldsha	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001410] = fffeffff ff000000, %l2 = 00000000, %l3 = 0000098f
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 00000000fffeffff 00000000ff000000
!	Mem[0000000010001400] = 00000000, %l2 = 00000000fffeffff
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001428] = 7b00ea38 fffa1b43, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i0+0x028]%asi,%l6	! %l6 = 000000007b00ea38 00000000fffa1b43
!	Starting 10 instruction Store Burst
!	%l6 = 000000007b00ea38, Mem[00000000100c1410] = 000000ff
	stba	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000038

p0_label_480:
!	%l6 = 000000007b00ea38, Mem[0000000010041410] = c427098f
	stha	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = c427ea38
!	%f10 = 00ff0000, %f3  = 00000043, %f15 = fffa1b43
	fsubs	%f10,%f3 ,%f15		! %l0 = 5b3e56cfda62854f, Unfinished, %fsr = 2500000400
!	%l2 = 00000000, %l3 = ff000000, Mem[0000000030141400] = ffffffff 83feffff
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 ff000000
!	%l0 = 5b3e56cfda62854f, Mem[0000000030141400] = 00000000
	stba	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 4f000000
!	%f20 = 00000000 000000ff, %l5 = 00000000ffffffff
!	Mem[0000000010141400] = fffa1b43ffff0000
	stda	%f20,[%i5+%l5]ASI_PST16_P ! Mem[0000000010141400] = 00000000000000ff
!	%l4 = ffffffffff0000ff, imm = 0000000000000448, %l2 = 0000000000000000
	andn	%l4,0x448,%l2		! %l2 = ffffffffff0000b7
!	%f2  = 00000000, Mem[0000000030041410] = ffffffff
	sta	%f2 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l5 = 00000000ffffffff, Mem[0000000010081408] = 431bd523
	stba	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 431bd5ff
!	%l1 = 12340d3047b43106, Mem[0000000021800080] = ffff05ff, %asi = 80
	stba	%l1,[%o3+0x080]%asi	! Mem[0000000021800080] = 06ff05ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00ff0000 ff000000, %l0 = da62854f, %l1 = 47b43106
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 00000000ff000000 0000000000ff0000

p0_label_481:
!	Mem[0000000010101400] = 00000000 00000001, %l6 = 7b00ea38, %l7 = fffa1b43
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000001 0000000000000000
!	Mem[0000000010141438] = 00000000 00000000, %l6 = 00000001, %l7 = 00000000
	ldd	[%i5+0x038],%l6		! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010041420] = ffffffff00007963, %l7 = 0000000000000000
	ldx	[%i1+0x020],%l7		! %l7 = ffffffff00007963
!	Mem[0000000010181400] = ff0000ff, %l1 = 0000000000ff0000
	lduha	[%i6+%g0]0x80,%l1	! %l1 = 000000000000ff00
!	Mem[00000000201c0000] = ffff3e5d, %l2 = ffffffffff0000b7
	ldsh	[%o0+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010181408] = 00000000, %l0 = 00000000ff000000
	lduwa	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = ff0000ff, %l5 = 00000000ffffffff
	lduba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%f18 = 00000000, %f15 = fffa1b43, %f10 = 00ff0000
	fsubs	%f18,%f15,%f10		! %f10 = fffa1b43
!	Mem[0000000030141400] = 0000004f, %f2  = 00000000
	lda	[%i5+%g0]0x89,%f2 	! %f2 = 0000004f
!	Starting 10 instruction Store Burst
!	%l7 = ffffffff00007963, Mem[00000000300c1400] = 00000000000000ff
	stxa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff00007963

p0_label_482:
!	Mem[0000000010001408] = 00000000, %l1 = 000000000000ff00
	swapa	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = ff0000ff, %l4 = ffffffffff0000ff
	ldstuba	[%i6+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	%l6 = 0000000000000000, Mem[0000000010101410] = ff000000
	stha	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l7 = ffffffff00007963, Mem[00000000100c1400] = 00000000
	stba	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 63000000
!	%l1 = 0000000000000000, Mem[0000000010101434] = 00ff0000, %asi = 80
	stwa	%l1,[%i4+0x034]%asi	! Mem[0000000010101434] = 00000000
!	Mem[0000000030001410] = fffeffff, %l7 = ffffffff00007963
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 00000000fffeffff
!	Mem[0000000030001410] = 00007963, %l3 = 00000000ff000000
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000007963
!	Mem[0000000010081410] = 00ff0000, %l1 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 0000000000ff0000
!	Mem[0000000010101400] = 01000000, %l1 = 0000000000ff0000
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 0000000001000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000, %f17 = 0a03d160
	lda	[%i6+%o5]0x81,%f17	! %f17 = 00000000

p0_label_483:
!	Mem[0000000030081408] = 00000000 ff000000, %l2 = ffffffff, %l3 = 00007963
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000010001410] = ffff0000, %l7 = 00000000fffeffff
	lduwa	[%i0+%o5]0x88,%l7	! %l7 = 00000000ffff0000
!	Code Fragment 4
p0_fragment_59:
!	%l0 = 0000000000000000
	setx	0x4ecbd19052da6e35,%g7,%l0 ! %l0 = 4ecbd19052da6e35
!	%l1 = 0000000001000000
	setx	0xc2ae00c05215de4b,%g7,%l1 ! %l1 = c2ae00c05215de4b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4ecbd19052da6e35
	setx	0xf19022382df7f3e2,%g7,%l0 ! %l0 = f19022382df7f3e2
!	%l1 = c2ae00c05215de4b
	setx	0xd20494dff5dc189b,%g7,%l1 ! %l1 = d20494dff5dc189b
!	Mem[0000000030081410] = 000000ff, %l6 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081400] = ff000000fffffe83, %l1 = d20494dff5dc189b
	ldxa	[%i2+%g0]0x81,%l1	! %l1 = ff000000fffffe83
!	Mem[000000001010142c] = 00000000, %l7 = 00000000ffff0000
	ldsba	[%i4+0x02e]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff, %f23 = d50615a3
	lda	[%i3+%g0]0x89,%f23	! %f23 = ffffffff
!	Mem[00000000300c1400] = ffffffff, %l6 = 00000000000000ff
	ldsba	[%i3+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1410] = 000a000000000000, %f20 = 00000000 000000ff
	ldda	[%i3+%o5]0x81,%f20	! %f20 = 000a0000 00000000
!	Starting 10 instruction Store Burst
!	%f2  = 0000004f, Mem[0000000010141428] = 00000000
	sta	%f2 ,[%i5+0x028]%asi	! Mem[0000000010141428] = 0000004f

p0_label_484:
!	%f8  = 00000000 000000ff, Mem[0000000010001410] = 0000ffff 0000adff
	stda	%f8 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 000000ff
!	%l0 = f19022382df7f3e2, Mem[0000000030041410] = 00000000
	stha	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = f3e20000
!	Mem[000000001000141c] = adcf2bff, %l6 = ffffffffffffffff
	swap	[%i0+0x01c],%l6		! %l6 = 00000000adcf2bff
!	%l6 = 00000000adcf2bff, Mem[00000000211c0001] = f8ff6880
	stb	%l6,[%o2+0x001]		! Mem[00000000211c0000] = f8ff6880
!	Mem[0000000010181410] = ffffffff, %l5 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	%f8  = 00000000 000000ff, %l0 = f19022382df7f3e2
!	Mem[00000000300c1430] = 00000000a8714fac
	add	%i3,0x030,%g1
	stda	%f8,[%g1+%l0]ASI_PST16_SL ! Mem[00000000300c1430] = 00000000a8714fac
!	Mem[00000000100c1418] = fffa1b43, %l4 = 000000ff, %l6 = adcf2bff
	add	%i3,0x18,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 00000000fffa1b43
!	Mem[00000000100c1410] = 38000000, %l6 = 00000000fffa1b43
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 0000000038000000
!	%l2 = 0000000000000000, Mem[0000000030081410] = ff000000
	stwa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 000000ff, %l2 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_485:
!	Mem[0000000030041408] = 000000ad, %l3 = 00000000ff000000
	lduha	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 00000000 00000043, %l6 = 38000000, %l7 = 00000000
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000000043
!	Mem[0000000030001408] = 0000ffff0000adff, %l2 = 0000000000000000
	ldxa	[%i0+%o4]0x89,%l2	! %l2 = 0000ffff0000adff
	membar	#Sync			! Added by membar checker (73)
!	Mem[0000000030081400] = ff000000 fffffe83 00000000 ff000000
!	Mem[0000000030081410] = 00000000 00000000 2100ff43 adcf2b33
!	Mem[0000000030081420] = 00000000 00000000 00000000 ff0000ff
!	Mem[0000000030081430] = 00000000 00000000 ff000000 000000ff
	ldda	[%i2]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	Mem[0000000010041410] = 00000000c427ea38, %l5 = 00000000000000ff
	ldxa	[%i1+%o5]0x88,%l5	! %l5 = 00000000c427ea38
!	Mem[0000000010001400] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l7 = 0000000000000043, %l6 = 0000000000000000, %l5 = 00000000c427ea38
	sub	%l7,%l6,%l5		! %l5 = 0000000000000043
!	%l4 = 0000000000000000, %l2 = 0000ffff0000adff, %l5 = 0000000000000043
	andn	%l4,%l2,%l5		! %l5 = 0000000000000000
!	Mem[0000000030101410] = ff0000ff, %l7 = 0000000000000043
	ldsba	[%i4+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 0000ffff0000adff, Mem[0000000010101408] = 094b3cff
	stha	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 094badff

p0_label_486:
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000010081418] = 2100ff43 adcf2b33
	std	%l6,[%i2+0x018]		! Mem[0000000010081418] = 00000000 ffffffff
	membar	#Sync			! Added by membar checker (74)
!	%l5 = 0000000000000000, Mem[0000000030081408] = 00000000
	stwa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	Mem[0000000010001410] = 00000000, %l2 = 0000ffff0000adff
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010141410] = 000000ff
	stha	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff
!	Mem[00000000100c1438] = 00000043, %l6 = 0000000000000000
	ldstuba	[%i3+0x038]%asi,%l6	! %l6 = 00000000000000ff
!	%l0 = f19022382df7f3e2, Mem[0000000010001410] = ffad0000
	stba	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = e2ad0000
!	Mem[0000000010181410] = ffffffff, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010081408] = 431bd5ff, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 00000000431bd5ff
!	%l6 = 0000000000000000, Mem[00000000100c1410] = 431bfaff
	stha	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 431b0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l1 = ff000000fffffe83
	lduba	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_487:
!	Mem[0000000030101410] = ff0000ff, %l0 = f19022382df7f3e2
	lduwa	[%i4+%o5]0x89,%l0	! %l0 = 00000000ff0000ff
!	Mem[000000001014142c] = 00ff0000, %f21 = 00000000
	lda	[%i5+0x02c]%asi,%f21	! %f21 = 00ff0000
!	Mem[0000000010041400] = 00000000, %l0 = 00000000ff0000ff
	ldsh	[%i1+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000030001400] = 0000ff00, %l1 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i1+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000218001c0] = 00ffa57a, %l3 = 00000000431bd5ff
	lduh	[%o3+0x1c0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030001410] = 000000ff, %l4 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1400] = 00000063, %l1 = ffffffffffffffff
	lduba	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000063
!	%l6 = 0000000000000000, %l5 = 0000000000000000, %l0 = 0000000000000000
	subc	%l6,%l5,%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ffffffff, Mem[0000000010141410] = ff000000
	stwa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffff

p0_label_488:
!	%l0 = 00000000, %l1 = 00000063, Mem[0000000010081400] = 00230000 00000022
	std	%l0,[%i2+%g0]		! Mem[0000000010081400] = 00000000 00000063
!	Mem[0000000030001410] = ff000000, %l7 = ffffffffffffffff
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = 4f000000, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 0000004f000000ff
!	%l5 = 0000000000000000, Mem[0000000030001410] = ffffffff
	stha	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000ffff
!	%l3 = 00000000000000ff, Mem[0000000010181408] = 00000000
	stba	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	%f28 = 00000000 00000000, Mem[0000000030181410] = 00000000 00000043
	stda	%f28,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 00000000
!	%l5 = 0000000000000000, Mem[0000000030001400] = 0000ff00
	stha	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000ff00
!	Mem[000000001018142b] = 00ff0000, %l4 = 00000000000000ff
	ldstub	[%i6+0x02b],%l4		! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00ff0000, %l2 = 00000000ffffffff
	lduwa	[%i0+%g0]0x89,%l2	! %l2 = 0000000000ff0000

p0_label_489:
!	Mem[0000000030101400] = ffffffff ff000000, %l0 = 00000000, %l1 = 00000063
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 00000000ff000000 00000000ffffffff
!	Mem[000000001014143c] = 00000000, %l5 = 0000000000000000
	ldub	[%i5+0x03c],%l5		! %l5 = 0000000000000000
!	Mem[0000000010041410] = 38ea27c4, %l0 = 00000000ff000000
	ldswa	[%i1+%o5]0x80,%l0	! %l0 = 0000000038ea27c4
!	Mem[0000000010141400] = 00000000, %l0 = 0000000038ea27c4
	lduha	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Code Fragment 4
p0_fragment_60:
!	%l0 = 0000000000000000
	setx	0x52d78257bf14e5ff,%g7,%l0 ! %l0 = 52d78257bf14e5ff
!	%l1 = 00000000ffffffff
	setx	0x0cbd387024b1f179,%g7,%l1 ! %l1 = 0cbd387024b1f179
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 52d78257bf14e5ff
	setx	0x0b768cf7ab05b810,%g7,%l0 ! %l0 = 0b768cf7ab05b810
!	%l1 = 0cbd387024b1f179
	setx	0x507397606f24d08c,%g7,%l1 ! %l1 = 507397606f24d08c
!	Mem[0000000010041400] = 00000000, %l7 = 00000000ff000000
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001418] = 0000e9ad, %l5 = 0000000000000000
	lduw	[%i0+0x018],%l5		! %l5 = 000000000000e9ad
!	Mem[0000000030181410] = 00000000, %l6 = 000000000000004f
	lduwa	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[000000001008143c] = 00000000, %l1 = 507397606f24d08c
	lduh	[%i2+0x03e],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0b768cf7ab05b810, Mem[00000000100c1410] = 00000000431b0000
	stxa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0b768cf7ab05b810

p0_label_490:
!	Mem[0000000010041408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l5 = 000000000000e9ad, Mem[0000000010041428] = 000000ff, %asi = 80
	stwa	%l5,[%i1+0x028]%asi	! Mem[0000000010041428] = 0000e9ad
!	Mem[0000000010041400] = 00000000, %l0 = 0b768cf7ab05b810
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[00000000100c1410] = ab05b810
	stha	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ab050000
!	%l7 = 0000000000000000, Mem[0000000030141410] = 00000000
	stha	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010081410] = 0000000000000000
	stxa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000000
!	%l6 = 0000000000000000, %l0 = 0000000000000000, %l3 = 00000000000000ff
	subc	%l6,%l0,%l3		! %l3 = 0000000000000000
!	%f16 = ff000000 fffffe83 00000000 ff000000
!	%f20 = 00000000 00ff0000 2100ff43 adcf2b33
!	%f24 = 00000000 00000000 00000000 ff0000ff
!	%f28 = 00000000 00000000 ff000000 000000ff
	stda	%f16,[%i1]ASI_BLK_PL	! Block Store to 0000000010041400
!	%l4 = 0000000000000000, %l0 = 0000000000000000, %l6 = 0000000000000000
	orn	%l4,%l0,%l6		! %l6 = ffffffffffffffff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000010181400] = ff0000ff 0000ff00 ff000000 00000043
!	Mem[0000000010181410] = 00000000 ffffffff 00000000 00000000
!	Mem[0000000010181420] = ff000000 000000ff 00ff00ff 00000000
!	Mem[0000000010181430] = 000000ff 00ff0000 fffff57f ff0000ff
	ldda	[%i6]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400

p0_label_491:
!	Mem[0000000010081410] = 00000000, %l1 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l2 = 0000000000ff0000
	lduha	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = ff000000, %l0 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010001410] = 0000ade2, %l7 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000e2
!	Mem[0000000010081404] = 00000063, %l4 = 0000000000000000
	ldsha	[%i2+0x006]%asi,%l4	! %l4 = 0000000000000063
!	Mem[0000000030041410] = f3e2000000000000, %f10 = fffa1b43 00000000
	ldda	[%i1+%o5]0x81,%f10	! %f10 = f3e20000 00000000
!	Mem[0000000010041410] = 00ff0000, %l5 = 000000000000e9ad
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 0000000000ff0000
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000ff0000
	ldsha	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = 00000000ffff0000, %l6 = ffffffffffffffff
	ldxa	[%i2+%o4]0x80,%l6	! %l6 = 00000000ffff0000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (76)
!	%l6 = 00000000ffff0000, Mem[0000000010181414] = ffffffff
	stw	%l6,[%i6+0x014]		! Mem[0000000010181414] = ffff0000

p0_label_492:
!	%l3 = 0000000000000000, imm = fffffffffffff9e3, %l3 = 0000000000000000
	addc	%l3,-0x61d,%l3		! %l3 = fffffffffffff9e3
!	%l7 = 00000000000000e2, Mem[0000000010141418] = ffffffff, %asi = 80
	stwa	%l7,[%i5+0x018]%asi	! Mem[0000000010141418] = 000000e2
!	%l1 = 0000000000000000, Mem[0000000010081400] = 0000000000000063, %asi = 80
	stxa	%l1,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000000000000000
!	Mem[00000000201c0000] = ffff3e5d, %l0 = 000000000000ff00
	ldstub	[%o0+%g0],%l0		! %l0 = 000000ff000000ff
!	%l2 = 00000000, %l3 = fffff9e3, Mem[00000000300c1400] = ffffffff 63790000
	stda	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 fffff9e3
!	%l4 = 0000000000000063, Mem[0000000010141400] = 00000000
	stha	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00630000
!	Mem[0000000020800040] = 00ff726d, %l7 = 00000000000000e2
	ldstub	[%o1+0x040],%l7		! %l7 = 00000000000000ff
!	%l6 = 00000000ffff0000, Mem[0000000021800180] = ffffbce0
	sth	%l6,[%o3+0x180]		! Mem[0000000021800180] = 0000bce0
!	Mem[0000000010041400] = fffffe83, %l1 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 00000000fffffe83
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 000000ff, %l5 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l5	! %l5 = 00000000000000ff

p0_label_493:
!	Mem[0000000010081438] = ff0000ff, %l5 = 00000000000000ff
	ldsw	[%i2+0x038],%l5		! %l5 = ffffffffff0000ff
!	Mem[0000000010181400] = ff0000ff, %l1 = 00000000fffffe83
	ldsha	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181400] = ff0000ff, %f21 = ffffffff
	lda	[%i6+%g0]0x80,%f21	! %f21 = ff0000ff
!	Mem[000000001010141c] = 43ff0021, %l1 = 00000000000000ff
	ldswa	[%i4+0x01c]%asi,%l1	! %l1 = 0000000043ff0021
!	Mem[000000001018143c] = ff0000ff, %l6 = 00000000ffff0000
	lduw	[%i6+0x03c],%l6		! %l6 = 00000000ff0000ff
!	Mem[00000000211c0000] = f8ff6880, %l3 = fffffffffffff9e3
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = fffffffffffff8ff
!	Mem[0000000030001408] = ffad0000, %l0 = 00000000000000ff
	ldsha	[%i0+%o4]0x81,%l0	! %l0 = ffffffffffffffad
!	Mem[0000000010001410] = e2ad0000, %l1 = 0000000043ff0021
	lduba	[%i0+%o5]0x80,%l1	! %l1 = 00000000000000e2
!	Mem[0000000010141400] = ff000000 00006300, %l6 = ff0000ff, %l7 = 00000000
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 0000000000006300 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1420] = 000000ff, %l0 = ffffffffffffffad
	swap	[%i3+0x020],%l0		! %l0 = 00000000000000ff

p0_label_494:
!	Mem[00000000100c1410] = ab050000, %l4 = 0000000000000063
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f0  = 0000ffff 0000adff, Mem[0000000030181408] = 000000ff 000000ff
	stda	%f0 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000ffff 0000adff
!	%l7 = 00000000ff000000, Mem[0000000030001408] = ffad0000ffff0000
	stxa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000ff000000
!	%f25 = 000000ff, Mem[0000000010181410] = 00000000
	sta	%f25,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff
!	Mem[0000000010181400] = ff0000ff, %l7 = 00000000ff000000
	ldstuba	[%i6+%g0]0x88,%l7	! %l7 = 000000ff000000ff
!	%l5 = ffffffffff0000ff, immed = fffffec8, %y  = 000000ff
	udiv	%l5,-0x138,%l5		! %l5 = 00000000000000ff
	mov	%l0,%y			! %y = 000000ff
!	%l2 = 0000000000000000, Mem[0000000020800001] = 00ff779a, %asi = 80
	stba	%l2,[%o1+0x001]%asi	! Mem[0000000020800000] = 0000779a
!	%l6 = 00006300, %l7 = 000000ff, Mem[0000000010041430] = 00000000 00000000
	stda	%l6,[%i1+0x030]%asi	! Mem[0000000010041430] = 00006300 000000ff
!	%l1 = 00000000000000e2, Mem[0000000010141410] = ffffffff
	stwa	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000e2
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000ff003cffffff, %l6 = 0000000000006300
	ldxa	[%i0+0x008]%asi,%l6	! %l6 = 0000ff003cffffff

p0_label_495:
!	Mem[00000000201c0000] = ffff3e5d, %l0 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[000000001014140c] = 43000000, %l0 = ffffffffffffffff
	ldsh	[%i5+0x00e],%l0		! %l0 = 0000000000000000
!	Mem[0000000010001410] = e2ad0000000000ff, %f20 = 00000000 ff0000ff
	ldda	[%i0+%o5]0x80,%f20	! %f20 = e2ad0000 000000ff
!	Mem[00000000300c1410] = 0000000000000a00, %f18 = ff000000 00000043
	ldda	[%i3+%o5]0x89,%f18	! %f18 = 00000000 00000a00
!	Mem[0000000030181400] = 0000000000000000, %l5 = 00000000000000ff
	ldxa	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = 000000000000ff00, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l5	! %l5 = 000000000000ff00
!	Mem[0000000020800040] = ffff726d, %l7 = 00000000000000ff
	lduha	[%o1+0x040]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030141400] = ff000000, %l6 = 0000ff003cffffff
	ldsha	[%i5+%g0]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010041430] = 00006300, %l5 = 000000000000ff00
	lduwa	[%i1+0x030]%asi,%l5	! %l5 = 0000000000006300
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 000000e2, Mem[00000000300c1408] = 00000000 00000000
	stda	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 000000e2

p0_label_496:
!	%l2 = 0000000000000000, %l7 = 000000000000ffff, %l1 = 00000000000000e2
	xor	%l2,%l7,%l1		! %l1 = 000000000000ffff
!	%f6  = 00000000 00000082, Mem[00000000100c1400] = 00000063 00000000
	stda	%f6 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 00000082
!	%l5 = 0000000000006300, Mem[0000000030141408] = 00000000
	stba	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%l3 = fffffffffffff8ff, imm = 0000000000000d02, %l3 = fffffffffffff8ff
	subc	%l3,0xd02,%l3		! %l3 = ffffffffffffebfd
!	%l3 = ffffffffffffebfd, Mem[0000000010181408] = 000000ff
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000ebfd
!	Mem[0000000030041400] = 000000ff, %l5 = 0000000000006300
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[00000000100c1400] = 00000082
	stwa	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	%l1 = 000000000000ffff, Mem[0000000010141410] = 00ff0000e2000000
	stxa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000000000ffff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030141410] = 00000000 00000000
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = 00000000 ff0000ff, %l2 = 00000000, %l3 = ffffebfd
	ldda	[%i2+0x030]%asi,%l2	! %l2 = 0000000000000000 00000000ff0000ff

p0_label_497:
!	Mem[0000000030001408] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 000000ffffffffff, %f12 = 000000ff 00ff0000
	ldda	[%i4+%g0]0x81,%f12	! %f12 = 000000ff ffffffff
!	Mem[0000000010041418] = 332bcfad, %f26 = 00ff00ff
	ld	[%i1+0x018],%f26	! %f26 = 332bcfad
!	%l4 = 0000000000000000, %l1 = 000000000000ffff, %l3 = 00000000ff0000ff
	sub	%l4,%l1,%l3		! %l3 = ffffffffffff0001
!	Mem[0000000030081400] = 83feffff000000ff, %l1 = 000000000000ffff
	ldxa	[%i2+%g0]0x89,%l1	! %l1 = 83feffff000000ff
!	Mem[0000000030141408] = 000000ff00000000, %l6 = ffffffffffffff00
	ldxa	[%i5+%o4]0x89,%l6	! %l6 = 000000ff00000000
!	Mem[00000000100c1410] = ff0005ab, %f28 = 000000ff
	lda	[%i3+%o5]0x80,%f28	! %f28 = ff0005ab
!	Mem[0000000010101408] = ffad4b09, %l0 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffad4b09
!	Mem[0000000010101418] = 332bcfad, %l3 = ffffffffffff0001
	ldsh	[%i4+0x018],%l3		! %l3 = 000000000000332b
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 00630000, %l1 = 83feffff000000ff
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 0000000000630000

p0_label_498:
!	%f16 = ff0000ff 0000ff00 00000000 00000a00
!	%f20 = e2ad0000 000000ff 00000000 00000000
!	%f24 = ff000000 000000ff 332bcfad 00000000
!	%f28 = ff0005ab 00ff0000 fffff57f ff0000ff
	stda	%f16,[%i0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	%l1 = 0000000000630000, Mem[0000000010181415] = ffff0000, %asi = 80
	stba	%l1,[%i6+0x015]%asi	! Mem[0000000010181414] = ff000000
!	%l0 = ffffffffffad4b09, Mem[0000000020800000] = 0000779a, %asi = 80
	stha	%l0,[%o1+0x000]%asi	! Mem[0000000020800000] = 4b09779a
!	Mem[00000000201c0000] = ffff3e5d, %l6 = 000000ff00000000
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[00000000100c140a] = ff0000ff, %asi = 80
	stba	%l5,[%i3+0x00a]%asi	! Mem[00000000100c1408] = ff0000ff
!	%l1 = 0000000000630000, Mem[00000000100c1400] = ff000000
	stha	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Mem[0000000010101400] = 0000ff00, %l7 = 000000000000ffff
	ldstuba	[%i4+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l5 = 0000000000000000, %l5 = 0000000000000000, %l7 = 0000000000000000
	addc	%l5,%l5,%l7		! %l7 = 0000000000000000
!	%f4  = 00000000 c6f3ecaf, %l1 = 0000000000630000
!	Mem[0000000030001408] = 00000000ff000000
	add	%i0,0x008,%g1
	stda	%f4,[%g1+%l1]ASI_PST16_S ! Mem[0000000030001408] = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000000000ff, %l3 = 000000000000332b
	ldxa	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff

p0_label_499:
!	Mem[0000000010101400] = 000000000000ffff, %l1 = 0000000000630000
	ldxa	[%i4+%g0]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000021800140] = ffffda9c, %l7 = 0000000000000000
	ldsb	[%o3+0x141],%l7		! %l7 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (77)
!	Mem[0000000010001400] = ff0000ff, %l3 = 00000000000000ff
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000021800040] = ffff2728, %l5 = 0000000000000000
	ldsba	[%o3+0x041]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181410] = 00000000, %l4 = 0000000000000000
	ldsba	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = 000000ff, %l7 = ffffffffffffffff
	lduba	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 0000ffff, %l0 = ffffffffffad4b09
	ldsba	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[000000001018142c] = 00000000, %l0 = 0000000000000000
	ldsb	[%i6+0x02c],%l0		! %l0 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000ffff, Mem[00000000300c1400] = 00000000e3f9ffff
	stxa	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000000000ffff

p0_label_500:
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000030101400] = 000000ff ffffffff
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 000000ff
!	Mem[00000000100c1410] = ab0500ff, %l4 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 00000000ab0500ff
!	%l0 = 00000000, %l1 = 0000ffff, Mem[0000000010101410] = 00000000 00000000
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 0000ffff
!	%f6  = 00000000 00000082, Mem[0000000010181408] = fdeb0000 00000043
	std	%f6 ,[%i6+%o4]	! Mem[0000000010181408] = 00000000 00000082
!	Mem[0000000010141410] = 0000ffff, %l0 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 000000000000ffff
!	%f20 = e2ad0000 000000ff, %l2 = 0000000000000000
!	Mem[0000000030081418] = 2100ff43adcf2b33
	add	%i2,0x018,%g1
	stda	%f20,[%g1+%l2]ASI_PST16_S ! Mem[0000000030081418] = 2100ff43adcf2b33
!	%l3 = 00000000000000ff, Mem[0000000030181408] = 0000ffff0000adff
	stxa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010081410] = 00000000, %asi = 80
	stwa	%l3,[%i2+0x010]%asi	! Mem[0000000010081410] = 000000ff
!	%f18 = 00000000 00000a00, Mem[0000000030181408] = 000000ff 00000000
	stda	%f18,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 00000a00
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff0000ff 0000ff00, %l0 = 0000ffff, %l1 = 0000ffff
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000ff0000ff 000000000000ff00

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	sta	%l4,[%i2+0x028]%asi
	smul	%l3,0x843,%l2
	fdivs	%f7,%f8,%f12
	fmuls	%f20,%f16,%f13
	nop
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000ff0000ff
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 000000000000ff00
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000ab0500ff
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x000000ff,%g2
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
	cmp	%l0,%l1			! %f0  should be 0000ffff 0000adff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 0000004f 00000043
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 c6f3ecaf
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 00000082
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 000000ff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be f3e20000 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 000000ff ffffffff
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be fffa1b43 fffa1b43
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ff0000ff 0000ff00
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 00000a00
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be e2ad0000 000000ff
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 00000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ff000000 000000ff
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 332bcfad 00000000
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ff0005ab 00ff0000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be fffff57f ff0000ff
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
	subc	%l6,%l1,%l7
	sdivx	%l7,0x3d3,%l6
	done

p0_trap1o:
	subc	%l6,%l1,%l7
	sdivx	%l7,0x3d3,%l6
	done


p0_trap2e:
	andn	%l0,0x7b0,%l6
	udivx	%l1,-0x64a,%l3
	ldstuba	[%i3+%o5]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[00000000100c1410]
	done

p0_trap2o:
	andn	%l0,0x7b0,%l6
	udivx	%l1,-0x64a,%l3
	ldstuba	[%o3+%i5]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[00000000100c1410]
	done


p0_trap3e:
	xnor	%l7,-0x0de,%l3
	subc	%l7,%l2,%l1
	and	%l5,0xa9b,%l7
	xnor	%l5,-0x710,%l0
	orn	%l4,%l2,%l0
	done

p0_trap3o:
	xnor	%l7,-0x0de,%l3
	subc	%l7,%l2,%l1
	and	%l5,0xa9b,%l7
	xnor	%l5,-0x710,%l0
	orn	%l4,%l2,%l0
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
	ldx	[%g1+0x000],%l0		! %l0 = d513d909de4369f3
	ldx	[%g1+0x008],%l1		! %l1 = 464e7f5c1a101ba9
	ldx	[%g1+0x010],%l2		! %l2 = 0b99d64bf4b68827
	ldx	[%g1+0x018],%l3		! %l3 = 463dc82c7d677cb3
	ldx	[%g1+0x020],%l4		! %l4 = e4adeff25c3d1f67
	ldx	[%g1+0x028],%l5		! %l5 = 7427b97e74903c02
	ldx	[%g1+0x030],%l6		! %l6 = b020f9604e0927b0
	ldx	[%g1+0x038],%l7		! %l7 = 481d4082280c1424

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
	subc	%l6,%l1,%l7
	sdivx	%l7,0x3d3,%l6
	fadds	%f0 ,%f7 ,%f15
	andn	%l0,%l0,%l6
	xor	%l5,-0xaa9,%l1
	jmpl	%o7,%g0
	fsubs	%f14,%f8 ,%f0 
p0_near_0_he:
	jmpl	%o7,%g0
	smul	%l4,%l4,%l4
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	fcmps	%fcc0,%f19,%f29
	orn	%l3,%l2,%l3
	jmpl	%o7,%g0
	udivx	%l5,%l6,%l6
near0_b2b_l:
	sdivx	%l6,-0xb07,%l5
	udivx	%l2,%l1,%l1
	jmpl	%o7,%g0
	fdivs	%f15,%f10,%f7 
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	xnor	%l0,%l4,%l0
	fsubs	%f3 ,%f0 ,%f14
	fdivs	%f9 ,%f1 ,%f4 
	smul	%l7,0x4e3,%l4
	jmpl	%o7,%g0
	orn	%l1,0x33c,%l6
p0_near_1_he:
	xor	%l3,0x2d7,%l2
	jmpl	%o7,%g0
	or	%l7,0x44c,%l2
near1_b2b_h:
	sdivx	%l5,-0xd14,%l6
	and	%l2,-0xc30,%l1
	jmpl	%o7,%g0
	orn	%l2,0x832,%l4
near1_b2b_l:
	subc	%l1,%l2,%l0
	umul	%l7,0x041,%l1
	jmpl	%o7,%g0
	or	%l5,%l4,%l6
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	or	%l4,%l4,%l6
	smul	%l1,%l2,%l0
	sub	%l4,0x293,%l3
	and	%l0,0x9b1,%l5
	jmpl	%o7,%g0
	fsqrts	%f3 ,%f6 
p0_near_2_he:
	orn	%l3,%l6,%l5
	fadds	%f20,%f21,%f16
	sub	%l0,-0x92d,%l1
	fsqrts	%f22,%f28
	sdivx	%l6,%l5,%l3
	mulx	%l5,-0x185,%l4
	fcmps	%fcc3,%f18,%f25
	jmpl	%o7,%g0
	addc	%l3,%l4,%l7
near2_b2b_h:
	jmpl	%o7,%g0
	or	%l4,-0xc2c,%l4
	jmpl	%o7,%g0
	nop
near2_b2b_l:
	jmpl	%o7,%g0
	mulx	%l0,0xc80,%l1
	jmpl	%o7,%g0
	nop
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	or	%l4,0x60f,%l5
	orn	%l0,0xb1b,%l7
	add	%l3,0x137,%l1
	jmpl	%o7,%g0
	fmuls	%f14,%f8 ,%f9 
p0_near_3_he:
	sdivx	%l7,0x17f,%l1
	udivx	%l3,%l3,%l0
	or	%l2,%l6,%l2
	fadds	%f30,%f20,%f27
	smul	%l1,-0xab8,%l2
	orn	%l0,%l1,%l6
	jmpl	%o7,%g0
	add	%l0,%l4,%l0
near3_b2b_h:
	andn	%l2,-0xf5c,%l7
	mulx	%l4,%l1,%l5
	and	%l3,%l0,%l5
	jmpl	%o7,%g0
	add	%l4,-0xa49,%l6
near3_b2b_l:
	subc	%l6,-0xb6a,%l1
	subc	%l2,%l3,%l5
	sub	%l0,-0x2db,%l0
	jmpl	%o7,%g0
	xnor	%l0,0xc3b,%l0
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fmuls	%f0 ,%f6 ,%f5 
	ldd	[%i5+0x008],%f0 	! Mem[0000000010141408]
	xor	%l6,-0xf0f,%l4
	fcmps	%fcc0,%f9 ,%f10
	jmpl	%o7,%g0
	xor	%l0,0xd6d,%l3
p0_far_0_lem:
	fmuls	%f0 ,%f6 ,%f5 
	membar	#Sync
	ldd	[%i5+0x008],%f0 	! Mem[0000000010141408]
	xor	%l6,-0xf0f,%l4
	fcmps	%fcc0,%f9 ,%f10
	jmpl	%o7,%g0
	xor	%l0,0xd6d,%l3
p0_far_0_he:
	or	%l6,%l4,%l7
	ldsw	[%i2+0x038],%l1		! Mem[0000000010081438]
	stw	%l5,[%i0+0x004]		! Mem[0000000010001404]
	xnor	%l3,-0x9f2,%l6
	jmpl	%o7,%g0
	xor	%l7,%l0,%l4
p0_far_0_hem:
	or	%l6,%l4,%l7
	membar	#Sync
	ldsw	[%i2+0x038],%l1		! Mem[0000000010081438]
	stw	%l5,[%i0+0x004]		! Mem[0000000010001404]
	xnor	%l3,-0x9f2,%l6
	jmpl	%o7,%g0
	xor	%l7,%l0,%l4
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	fdivs	%f28,%f19,%f24
	fcmps	%fcc3,%f27,%f29
	subc	%l7,%l5,%l5
	fsubs	%f18,%f17,%f21
	jmpl	%o7,%g0
	sub	%l3,%l3,%l0
far0_b2b_l:
	fstod	%f2 ,%f10
	orn	%l2,0x644,%l1
	fcmps	%fcc2,%f15,%f5 
	fadds	%f3 ,%f8 ,%f10
	jmpl	%o7,%g0
	subc	%l7,%l5,%l7
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	orn	%l7,%l2,%l3
	fcmps	%fcc2,%f10,%f8 
	sub	%l3,-0x776,%l7
	fcmps	%fcc2,%f4 ,%f5 
	sdivx	%l7,%l2,%l2
	jmpl	%o7,%g0
	mulx	%l6,0x6a4,%l4
p0_far_1_lem:
	orn	%l7,%l2,%l3
	fcmps	%fcc2,%f10,%f8 
	sub	%l3,-0x776,%l7
	fcmps	%fcc2,%f4 ,%f5 
	sdivx	%l7,%l2,%l2
	jmpl	%o7,%g0
	mulx	%l6,0x6a4,%l4
p0_far_1_he:
	fdivs	%f26,%f25,%f16
	fstod	%f19,%f24
	xnor	%l0,%l6,%l3
	ldd	[%i1+0x028],%f18	! Mem[0000000010041428]
	smul	%l3,%l6,%l7
	umul	%l1,%l0,%l3
	jmpl	%o7,%g0
	swap	[%i3+0x014],%l0		! Mem[00000000100c1414]
p0_far_1_hem:
	fdivs	%f26,%f25,%f16
	fstod	%f19,%f24
	xnor	%l0,%l6,%l3
	membar	#Sync
	ldd	[%i1+0x028],%f18	! Mem[0000000010041428]
	smul	%l3,%l6,%l7
	umul	%l1,%l0,%l3
	membar	#Sync
	jmpl	%o7,%g0
	swap	[%i3+0x014],%l0		! Mem[00000000100c1414]
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	fsubs	%f22,%f23,%f20
	subc	%l5,0x09b,%l4
	fcmps	%fcc1,%f23,%f22
	mulx	%l5,%l3,%l2
	jmpl	%o7,%g0
	smul	%l1,-0x5b3,%l5
far1_b2b_l:
	fsubs	%f1 ,%f12,%f8 
	xor	%l7,-0xd37,%l2
	fmuls	%f11,%f14,%f8 
	orn	%l7,0xe24,%l7
	jmpl	%o7,%g0
	udivx	%l5,%l1,%l6
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	lduw	[%i5+0x038],%l7		! Mem[0000000010141438]
	addc	%l3,0xb2f,%l6
	sdivx	%l2,-0x44c,%l3
	or	%l6,%l6,%l4
	sdivx	%l6,%l5,%l3
	jmpl	%o7,%g0
	fdivs	%f4 ,%f11,%f13
p0_far_2_lem:
	membar	#Sync
	lduw	[%i5+0x038],%l7		! Mem[0000000010141438]
	addc	%l3,0xb2f,%l6
	sdivx	%l2,-0x44c,%l3
	or	%l6,%l6,%l4
	sdivx	%l6,%l5,%l3
	jmpl	%o7,%g0
	fdivs	%f4 ,%f11,%f13
p0_far_2_he:
	jmpl	%o7,%g0
	subc	%l1,0x663,%l3
	jmpl	%o7,%g0
	nop
p0_far_2_hem:
	jmpl	%o7,%g0
	subc	%l1,0x663,%l3
	jmpl	%o7,%g0
	nop
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fsqrts	%f24,%f20
	and	%l1,0xb7d,%l0
	sdivx	%l4,0x31f,%l3
	umul	%l0,0xe5a,%l7
	sub	%l3,%l7,%l5
	umul	%l0,-0xd29,%l5
	jmpl	%o7,%g0
	xor	%l7,%l5,%l5
far2_b2b_l:
	fsubs	%f15,%f14,%f9 
	orn	%l2,%l4,%l4
	fsubs	%f5 ,%f2 ,%f6 
	fmuls	%f10,%f7 ,%f15
	sub	%l1,%l3,%l7
	fmuls	%f13,%f8 ,%f4 
	jmpl	%o7,%g0
	orn	%l3,0xa8c,%l1
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	jmpl	%o7,%g0
	orn	%l0,0xd83,%l1
	jmpl	%o7,%g0
	nop
p0_far_3_lem:
	jmpl	%o7,%g0
	orn	%l0,0xd83,%l1
	jmpl	%o7,%g0
	nop
p0_far_3_he:
	and	%l2,0x32b,%l3
	and	%l1,-0x809,%l5
	udivx	%l2,-0xf51,%l3
	st	%f31,[%i3+0x000]	! Mem[00000000100c1400]
	jmpl	%o7,%g0
	ldd	[%i2+0x028],%f30	! Mem[0000000010081428]
p0_far_3_hem:
	and	%l2,0x32b,%l3
	and	%l1,-0x809,%l5
	udivx	%l2,-0xf51,%l3
	membar	#Sync
	st	%f31,[%i3+0x000]	! Mem[00000000100c1400]
	membar	#Sync
	jmpl	%o7,%g0
	ldd	[%i2+0x028],%f30	! Mem[0000000010081428]
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fdivs	%f23,%f18,%f27
	fadds	%f31,%f31,%f17
	or	%l5,0x49a,%l5
	jmpl	%o7,%g0
	sdivx	%l0,%l0,%l0
far3_b2b_l:
	andn	%l7,-0xbb0,%l5
	umul	%l6,%l0,%l6
	fsqrts	%f3 ,%f6 
	jmpl	%o7,%g0
	fmuls	%f12,%f6 ,%f1 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	fmuls	%f14,%f15,%f9 
	udivx	%l7,-0x5bd,%l6
	and	%l7,%l3,%l7
	fitos	%f10,%f9 
	or	%l7,%l3,%l4
	jmpl	%g6+8,%g0
	and	%l4,-0x867,%l5
p0_call_0_le:
	smul	%l0,%l6,%l0
	smul	%l1,-0x83a,%l5
	fmuls	%f3 ,%f9 ,%f1 
	fsubs	%f8 ,%f12,%f10
	retl
	xor	%l6,-0xe27,%l3
p0_jmpl_0_lo:
	fmuls	%f14,%f15,%f9 
	udivx	%l7,-0x5bd,%l6
	and	%l7,%l3,%l7
	fitos	%f10,%f9 
	or	%l7,%l3,%l4
	jmpl	%g6+8,%g0
	and	%l4,-0x867,%l5
p0_call_0_lo:
	smul	%l0,%l6,%l0
	smul	%l1,-0x83a,%l5
	fmuls	%f3 ,%f9 ,%f1 
	fsubs	%f8 ,%f12,%f10
	retl
	xor	%l6,-0xe27,%l3
p0_jmpl_0_he:
	fadds	%f22,%f17,%f30
	umul	%l4,%l7,%l1
	jmpl	%g6+8,%g0
	mulx	%l3,0x537,%l7
p0_call_0_he:
	or	%l7,%l6,%l3
	std	%f24,[%i0+0x038]	! Mem[0000000010001438]
	std	%l4,[%i3+0x008]		! Mem[00000000100c1408]
	umul	%l1,0x97e,%l3
	retl
	orn	%l6,0x50b,%l1
p0_jmpl_0_ho:
	fadds	%f22,%f17,%f30
	umul	%l4,%l7,%l1
	jmpl	%g6+8,%g0
	mulx	%l3,0x537,%l7
p0_call_0_ho:
	or	%l7,%l6,%l3
	std	%f24,[%o0+0x038]	! Mem[0000000010001438]
	std	%l4,[%o3+0x008]		! Mem[00000000100c1408]
	umul	%l1,0x97e,%l3
	retl
	orn	%l6,0x50b,%l1
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	udivx	%l0,%l5,%l4
	mulx	%l2,-0xc9a,%l2
	fsubs	%f1 ,%f13,%f0 
	and	%l5,%l1,%l1
	jmpl	%g6+8,%g0
	subc	%l5,-0x842,%l4
p0_call_1_le:
	fadds	%f1 ,%f0 ,%f0 
	xnor	%l7,%l0,%l3
	sdivx	%l2,0xf7a,%l3
	mulx	%l7,%l0,%l0
	sdivx	%l2,%l4,%l4
	fdivs	%f8 ,%f5 ,%f0 
	retl
	fsubs	%f11,%f9 ,%f10
p0_jmpl_1_lo:
	udivx	%l0,%l5,%l4
	mulx	%l2,-0xc9a,%l2
	fsubs	%f1 ,%f13,%f0 
	and	%l5,%l1,%l1
	jmpl	%g6+8,%g0
	subc	%l5,-0x842,%l4
p0_call_1_lo:
	fadds	%f1 ,%f0 ,%f0 
	xnor	%l7,%l0,%l3
	sdivx	%l2,0xf7a,%l3
	mulx	%l7,%l0,%l0
	sdivx	%l2,%l4,%l4
	fdivs	%f8 ,%f5 ,%f0 
	retl
	fsubs	%f11,%f9 ,%f10
p0_jmpl_1_he:
	fcmps	%fcc2,%f21,%f17
	lduw	[%i1+0x024],%l5		! Mem[0000000010041424]
	fdivs	%f17,%f31,%f31
	jmpl	%g6+8,%g0
	mulx	%l4,-0x280,%l3
p0_call_1_he:
	smul	%l0,0x2d9,%l1
	mulx	%l0,%l2,%l4
	andn	%l7,0x1b1,%l4
	fmuls	%f24,%f23,%f25
	fsqrts	%f27,%f16
	fdivs	%f31,%f22,%f18
	retl
	andn	%l1,%l7,%l4
p0_jmpl_1_ho:
	fcmps	%fcc2,%f21,%f17
	lduw	[%o1+0x024],%l5		! Mem[0000000010041424]
	fdivs	%f17,%f31,%f31
	jmpl	%g6+8,%g0
	mulx	%l4,-0x280,%l3
p0_call_1_ho:
	smul	%l0,0x2d9,%l1
	mulx	%l0,%l2,%l4
	andn	%l7,0x1b1,%l4
	fmuls	%f24,%f23,%f25
	fsqrts	%f27,%f16
	fdivs	%f31,%f22,%f18
	retl
	andn	%l1,%l7,%l4
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	sdivx	%l7,-0x1c8,%l5
	fdivs	%f12,%f2 ,%f4 
	mulx	%l7,0xc6e,%l2
	smul	%l5,%l0,%l7
	addc	%l2,0x5c2,%l3
	jmpl	%g6+8,%g0
	umul	%l0,-0x9be,%l5
p0_call_2_le:
	umul	%l4,%l0,%l2
	smul	%l0,%l1,%l7
	or	%l0,%l6,%l1
	add	%l1,0x244,%l1
	fadds	%f1 ,%f4 ,%f15
	retl
	fsubs	%f0 ,%f11,%f13
p0_jmpl_2_lo:
	sdivx	%l7,-0x1c8,%l5
	fdivs	%f12,%f2 ,%f4 
	mulx	%l7,0xc6e,%l2
	smul	%l5,%l0,%l7
	addc	%l2,0x5c2,%l3
	jmpl	%g6+8,%g0
	umul	%l0,-0x9be,%l5
p0_call_2_lo:
	umul	%l4,%l0,%l2
	smul	%l0,%l1,%l7
	or	%l0,%l6,%l1
	add	%l1,0x244,%l1
	fadds	%f1 ,%f4 ,%f15
	retl
	fsubs	%f0 ,%f11,%f13
p0_jmpl_2_he:
	addc	%l6,-0x69c,%l4
	sdivx	%l1,0x5f6,%l0
	smul	%l6,%l0,%l2
	andn	%l2,-0x7bf,%l1
	xor	%l0,%l7,%l6
	smul	%l4,0xd67,%l0
	fmuls	%f19,%f25,%f29
	jmpl	%g6+8,%g0
	or	%l0,0xc5b,%l4
p0_call_2_he:
	and	%l4,0x14f,%l7
	addc	%l7,-0xaf0,%l2
	sub	%l3,0xe38,%l1
	udivx	%l3,%l7,%l5
	st	%f18,[%i4+0x018]	! Mem[0000000010101418]
	retl
	udivx	%l2,0xa3e,%l4
p0_jmpl_2_ho:
	addc	%l6,-0x69c,%l4
	sdivx	%l1,0x5f6,%l0
	smul	%l6,%l0,%l2
	andn	%l2,-0x7bf,%l1
	xor	%l0,%l7,%l6
	smul	%l4,0xd67,%l0
	fmuls	%f19,%f25,%f29
	jmpl	%g6+8,%g0
	or	%l0,0xc5b,%l4
p0_call_2_ho:
	and	%l4,0x14f,%l7
	addc	%l7,-0xaf0,%l2
	sub	%l3,0xe38,%l1
	udivx	%l3,%l7,%l5
	st	%f18,[%o4+0x018]	! Mem[0000000010101418]
	retl
	udivx	%l2,0xa3e,%l4
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	ldsb	[%i2+0x005],%l0		! Mem[0000000010081405]
	jmpl	%g6+8,%g0
	fdivs	%f6 ,%f0 ,%f6 
p0_call_3_le:
	orn	%l7,%l2,%l6
	fcmps	%fcc0,%f1 ,%f10
	retl
	and	%l2,%l6,%l2
p0_jmpl_3_lo:
	ldsb	[%o2+0x005],%l0		! Mem[0000000010081405]
	jmpl	%g6+8,%g0
	fdivs	%f6 ,%f0 ,%f6 
p0_call_3_lo:
	orn	%l7,%l2,%l6
	fcmps	%fcc0,%f1 ,%f10
	retl
	and	%l2,%l6,%l2
p0_jmpl_3_he:
	xor	%l1,%l5,%l5
	fmuls	%f21,%f19,%f22
	udivx	%l5,-0xc60,%l3
	add	%l1,0xcee,%l0
	jmpl	%g6+8,%g0
	mulx	%l3,%l4,%l2
p0_call_3_he:
	retl
	andn	%l5,-0x807,%l1
p0_jmpl_3_ho:
	xor	%l1,%l5,%l5
	fmuls	%f21,%f19,%f22
	udivx	%l5,-0xc60,%l3
	add	%l1,0xcee,%l0
	jmpl	%g6+8,%g0
	mulx	%l3,%l4,%l2
p0_call_3_ho:
	retl
	andn	%l5,-0x807,%l1
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
	.word	0xd513d909,0xde4369f3		! Init value for %l0
	.word	0x464e7f5c,0x1a101ba9		! Init value for %l1
	.word	0x0b99d64b,0xf4b68827		! Init value for %l2
	.word	0x463dc82c,0x7d677cb3		! Init value for %l3
	.word	0xe4adeff2,0x5c3d1f67		! Init value for %l4
	.word	0x7427b97e,0x74903c02		! Init value for %l5
	.word	0xb020f960,0x4e0927b0		! Init value for %l6
	.word	0x481d4082,0x280c1424		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xc283e86e,0xe7d635e4		! Init value for %f0 
	.word	0xea1cf87a,0x208d2eac		! Init value for %f2 
	.word	0x1a3067de,0x7ee94f88		! Init value for %f4 
	.word	0xb666c79b,0x040c8cd3		! Init value for %f6 
	.word	0x072ba26e,0xb8edf712		! Init value for %f8 
	.word	0x7b2253b1,0xbc0cfd12		! Init value for %f10
	.word	0xba31470f,0xd9e67963		! Init value for %f12
	.word	0xaf59bc8e,0xc378bb56		! Init value for %f14
	.word	0x7d2ad4b1,0x0e939dcb		! Init value for %f16
	.word	0x0072d112,0xb1381bc2		! Init value for %f18
	.word	0x997e78ef,0xfc12310c		! Init value for %f20
	.word	0x5768185f,0x70ba30fa		! Init value for %f22
	.word	0xcb28dec6,0xe84b78c6		! Init value for %f24
	.word	0x05453b71,0x3a6319e2		! Init value for %f26
	.word	0x8506dcc4,0xd2388b98		! Init value for %f28
	.word	0x5a8b134e,0xab306e6f		! Init value for %f30
	.word	0x523626e9,0xaeba524b		! Init value for %f32
	.word	0x5bb67b92,0x589e5aab		! Init value for %f34
	.word	0x091323f7,0xa6bf91ec		! Init value for %f36
	.word	0x7c661737,0xfbd9b243		! Init value for %f38
	.word	0x69a99b53,0x6a7af475		! Init value for %f40
	.word	0x59f9b622,0xdf13d084		! Init value for %f42
	.word	0x09993b3c,0x52444c39		! Init value for %f44
	.word	0x9c6b6e2b,0x1dc3d44a		! Init value for %f46
	.word	0xe12e27c2,0x20971370
	.word	0xf2616a02,0x7aa0b9b6
	.word	0xf5fa9774,0x16b5fd10
	.word	0x155abe48,0xbd99e509
	.word	0xdc59e0fd,0x36d6b95f
	.word	0x5cd23af5,0x4f9771c6
	.word	0x9b85e080,0x88e96dfc
	.word	0xd7e611c7,0x47c9eea0
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
	.word	0x00000000,0xff0000ff
	.word	0x00000000,0x0000ff00
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xab0500ff
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
p0_expected_fp_regs:
	.word	0x0000ffff,0x0000adff
	.word	0x0000004f,0x00000043
	.word	0x00000000,0xc6f3ecaf
	.word	0x00000000,0x00000082
	.word	0x00000000,0x000000ff
	.word	0xf3e20000,0x00000000
	.word	0x000000ff,0xffffffff
	.word	0xfffa1b43,0xfffa1b43
	.word	0xff0000ff,0x0000ff00
	.word	0x00000000,0x00000a00
	.word	0xe2ad0000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x332bcfad,0x00000000
	.word	0xff0005ab,0x00ff0000
	.word	0xfffff57f,0xff0000ff
	.word	0x00000025,0x00000400		! %fsr = 0000002500000400
p0_local0_expect:
	.word	0xff0000ff,0x0000ff00
	.word	0x00000000,0x00000a00
	.word	0xe2ad0000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x332bcfad,0x00000000
	.word	0xff0005ab,0x00ff0000
	.word	0xfffff57f,0xff0000ff
p0_local0_sec_expect:
	.word	0x0000ff00,0x00000000
	.word	0x00000000,0xff000000
	.word	0x0000ffff,0xff000000
	.word	0xff000000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0xffffff00,0xd9e67963
	.word	0x0000ff00,0xff1014c4
	.word	0x00000000,0xe0000000
p0_local1_expect:
	.word	0x00000000,0x000000ff
	.word	0x000000ff,0x00000000
	.word	0x0000ff00,0x00000000
	.word	0x332bcfad,0x43ff0021
	.word	0x00000000,0x00000000
	.word	0xff0000ff,0x00000000
	.word	0x00006300,0x000000ff
	.word	0xff000000,0x000000ff
p0_local1_sec_expect:
	.word	0x000000ff,0x00000000
	.word	0x000000ad,0x0000ff00
	.word	0xf3e20000,0x00000000
	.word	0xff006800,0x00000000
	.word	0x00000000,0xc6de9dcb
	.word	0x80000000,0x00000000
	.word	0x78b70000,0xff0000ff
	.word	0x78b7ff9c,0xff0000ff
p0_local2_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0xffff0000
	.word	0x000000ff,0x00000000
	.word	0x00000000,0xffffffff
	.word	0x00ff00ff,0x00000000
	.word	0x00000000,0xff0000ff
	.word	0x00000000,0xff0000ff
	.word	0xff0000ff,0x00000000
p0_local2_sec_expect:
	.word	0xff000000,0xfffffe83
	.word	0x00000000,0xff000000
	.word	0x00000000,0x00000000
	.word	0x2100ff43,0xadcf2b33
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff0000ff
	.word	0x00000000,0x00000000
	.word	0xff000000,0x000000ff
p0_local3_expect:
	.word	0x00000000,0x00000000
	.word	0xff0000ff,0xffffffff
	.word	0x00000000,0xf78c760b
	.word	0xfffa1b43,0xffff1b43
	.word	0xffffffad,0xc6f3ecaf
	.word	0x000000ff,0x00000000
	.word	0x0000ffff,0x000000ff
	.word	0xff000043,0x43ff0021
p0_local3_sec_expect:
	.word	0x00000000,0x0000ffff
	.word	0x00000000,0x000000e2
	.word	0x000a0000,0x00000000
	.word	0x00000000,0xfdb200ea
	.word	0x7b00ea38,0x00000000
	.word	0xff48329d,0xd53f7559
	.word	0x00000000,0xa8714fac
	.word	0x7c50879f,0x2a5f5cc1
p0_local4_expect:
	.word	0xffff0000,0x00000000
	.word	0xffad4b09,0xce1a5f1f
	.word	0x00000000,0x0000ffff
	.word	0x332bcfad,0x43ff0021
	.word	0xfffa1b43,0x00007963
	.word	0xff0000ff,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ad
p0_local4_sec_expect:
	.word	0x00000000,0x000000ff
	.word	0xff0000ff,0xf00883fd
	.word	0xff0000ff,0x0000ffff
	.word	0x431bbaae,0xc6f3ecaf
	.word	0xff000000,0x431bbaff
	.word	0x000000ff,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
p0_local5_expect:
	.word	0x00630000,0x000000ff
	.word	0xff000000,0x43000000
	.word	0x00000000,0x00000000
	.word	0x000000e2,0x000000ff
	.word	0xff000000,0xff000000
	.word	0x0000004f,0x00ff0000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
p0_local5_sec_expect:
	.word	0xff000000,0x000000ff
	.word	0x00000000,0xff000000
	.word	0x00000000,0xff000000
	.word	0x2100ff43,0xadcf2b33
	.word	0x63790000,0xffffffff
	.word	0x00000000,0xff0000ff
	.word	0x00000000,0x00000000
	.word	0xff000000,0x000000ff
p0_local6_expect:
	.word	0xff0000ff,0x0000ff00
	.word	0x00000000,0x00000082
	.word	0x000000ff,0xff000000
	.word	0x00000000,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x00ff00ff,0x00000000
	.word	0x000000ff,0x00ff0000
	.word	0xfffff57f,0xff0000ff
p0_local6_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x000a0000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffba1b43,0x431bfaff
	.word	0xff00ffff,0x00000000
	.word	0xe98b0000,0x38ea007b
	.word	0xff000000,0xff800000
	.word	0xc15c5f2a,0x7af196a3
share0_expect:
	.word	0xffff3e5d,0x665dcbe6
	.word	0x482f13d0,0x1693c5b1
	.word	0x502770bf,0x9ea470e9
	.word	0xaf480122,0xf0095901
	.word	0x159f5307,0x5424b3de
	.word	0x6a5a62a8,0xf1284c56
	.word	0xbc830e1f,0xdc012717
	.word	0x86781abd,0x603539d0
share1_expect:
	.word	0x4b09779a,0x1669303f
	.word	0xec2762c5,0x9a924e33
	.word	0x48730d21,0x079cecb4
	.word	0xf5485dbe,0xb181df23
	.word	0x6ae6d917,0xd5eecb58
	.word	0x83534e3d,0x39c89d09
	.word	0x46a60047,0x5a83eb46
	.word	0xe427639b,0xbe96ac9e
	.word	0xffff726d,0xb6b5afe0
	.word	0xf7563a8d,0x51a3ff16
	.word	0x5b1ab64f,0x6bec5272
	.word	0x68503cbf,0xe2e044f3
	.word	0x7cfcdf17,0x08ab7436
	.word	0x2915fafa,0x42289330
	.word	0xc016eadf,0xeee836e5
	.word	0x0f23fd6d,0x1b0e7271
share2_expect:
	.word	0xf8ff6880,0x607b08cc
	.word	0x2b3a7765,0xfc9d52bc
	.word	0x87047f8c,0x7ffc6602
	.word	0x6d50fb83,0xb783dfa2
	.word	0x0fda20a0,0x1fcc876e
	.word	0x2b1d0b37,0xa8d8537b
	.word	0x6a1c8b96,0xcd2b7591
	.word	0x67120363,0x2db71a5e
share3_expect:
	.word	0xff00b994,0x008c0a11
	.word	0xdb7bf24d,0x6d8862ad
	.word	0x221d7f5b,0x4772b945
	.word	0x58d02f24,0xd09b00f9
	.word	0x71b77f5f,0x117851ff
	.word	0xfa6f9306,0xa0927c8c
	.word	0xb2a13ddb,0xf5450940
	.word	0xdfa1e6c0,0xbc39efe2
	.word	0xffff2728,0x602e19ad
	.word	0xf17ed360,0x269f9eef
	.word	0xb119b6ca,0x7324971a
	.word	0xcdd9723b,0x22d48534
	.word	0xa9bafd7a,0xf8887a30
	.word	0xa8e42a0e,0x5fb9a09d
	.word	0x91fffcfa,0xb1306649
	.word	0x98f0b95b,0x6abfa88f
	.word	0x06ff05ff,0xd85a6559
	.word	0x46406378,0x46339c7b
	.word	0x4697f6fc,0x16e54e71
	.word	0x8c99b628,0x7abd6ad1
	.word	0x5ba234d9,0xcb73d723
	.word	0x9efbfa1e,0x7484c371
	.word	0x494194be,0x1aa1ecd3
	.word	0x154d9006,0x24f7bdbe
	.word	0x00ff0fe0,0x532ecee4
	.word	0xf75a0260,0x6f9d3dfa
	.word	0x06334314,0x672c4734
	.word	0xa9263491,0xc1bab4ff
	.word	0x619b1ea7,0xa3c21e32
	.word	0x0aed8923,0x8d13a7fd
	.word	0x68a4febe,0x94e6591c
	.word	0x7317e834,0xee348c49
	.word	0xffff5371,0x2b0e326c
	.word	0x7e178ead,0xaab363ae
	.word	0xbd1b80f2,0x7d6e8e3e
	.word	0xf5c0ffc7,0x45e8ec2e
	.word	0xef059fff,0xd6f23e13
	.word	0xd6b05ba4,0x9b171f25
	.word	0x5fd450a2,0x1cf78926
	.word	0x06b9079b,0x5efc606a
	.word	0xffffda9c,0x704ba05e
	.word	0x197aee1c,0x378ffd4b
	.word	0xb81065ce,0x38c9ead3
	.word	0x542d0c86,0x4b19a684
	.word	0xeac9e922,0x39b5bac8
	.word	0x670b5aa8,0x154f21a8
	.word	0x0a4cd42e,0xbbb70520
	.word	0x76f9ec3d,0x057f1b56
	.word	0x0000bce0,0x20d66963
	.word	0x07031560,0x0d5d82cc
	.word	0x27341e37,0x21204983
	.word	0xd59b1520,0x64b3a262
	.word	0x68efc1ff,0x14bb9028
	.word	0x75778738,0x90c10572
	.word	0xa80be6be,0xc41e3e50
	.word	0xfb41b5dd,0xd07baf75
	.word	0x00ffa57a,0x65521e7a
	.word	0x18f41b06,0x5c5df448
	.word	0x0cc11825,0xb6a74fda
	.word	0xb50ca733,0xc16c2988
	.word	0x241675c7,0x8bc3b7fa
	.word	0x85a82ca1,0xc0d8a127
	.word	0x4d14819e,0xeee7849b
	.word	0x4595cdbe,0xe19c14d9
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
	.word	0xa662723f,0xd6434053
	.word	0x00000000,0x00000002
	.word	0x3399e367,0xbe96d360
	.word	0x00000000,0x00000003
	.word	0x92e3c2c8,0x03c21456
	.word	0x00000000,0x00000004
	.word	0x8eca3fdf,0xad7b5d58
	.word	0x00000000,0x00000005
	.word	0xcfc85a28,0x5ed08b6c
	.word	0x00000000,0x00000006
	.word	0x133dab57,0xf22dd3bd
	.word	0x00000000,0x00000007
	.word	0x597d47a8,0x26e95e59
	.word	0x00000000,0x00000008
	.word	0x0bc99f80,0x7e1015c4
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
	.word	0xbd96b39f,0xef39bc40,0xd4344695,0xa1cfe2a6
	.word	0x350580ad,0x5e5684c7,0xac4f7128,0xa434f6b5
	.word	0x2a2ba122,0x32b3e57e,0x7dc8a373,0xffa30f7b
	.word	0x0c8261be,0xd967c860,0xe3bae2c2,0xb5a14333
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
	.word	0xb2e23311,0x7d83f716,0x3d236164,0x392408e9
	.word	0x5544e8ae,0x07d44e40,0x460fd81c,0xdc2cf692
	.word	0x49356c82,0x76e363b7,0x76962a8e,0x959fe459
	.word	0x9535ba01,0x7081b444,0x791a1579,0xfe904d05
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
	.word	0xe91e224a,0xb1260cf1,0x10b84a97,0x23c81c5f
	.word	0x49e9902b,0xacfa16dc,0xc0b3f6b4,0xab1de0a7
	.word	0xa7803860,0xa9da6d2d,0x99016090,0x8465843a
	.word	0x57296ebf,0x90e0f5d5,0x48839796,0xbaefe943
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
	.word	0x9e413755,0x78b1b2cf,0x4775890e,0x15d34552
	.word	0x671259ae,0x3391d0a2,0x951b5f7e,0x331a8899
	.word	0x6ae872a7,0x6868844c,0x8c41a74c,0x11ae8748
	.word	0x43dd6864,0x0578aba4,0x33b1b0d7,0x37aa4efb
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
	.word	0x01bcb61b,0x3648a8d9,0x591e5498,0xf01014c4
	.word	0x2ac5373a,0x546113a9,0xd459166f,0xb85884b6
	.word	0xf82c6309,0x71ea05cd,0x3ca909a8,0x695bb361
	.word	0xa34b3f13,0xe63073a7,0x155d5e8d,0x701d5577
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
	.word	0xfdb20acc,0xccad9193,0xde53605b,0xaaa7246b
	.word	0xa1af46dd,0x72527aae,0xc0f44a97,0xb7cca4c2
	.word	0xe7888aa7,0xa4e7ddb5,0x653f1504,0x0f06c47d
	.word	0x0d832d3d,0xd964a882,0x961cdec7,0x502b1033
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
	.word	0x93477669,0xc9c699f8,0x86803f5d,0x5820017a
	.word	0x1138def8,0x2d9e84a6,0x431bbaae,0xc6f3ecaf
	.word	0xcf624977,0xd5b6f705,0x78b7ff9c,0x263728d3
	.word	0xb290ef67,0x37fde103,0x58626c0e,0xceeb99a1
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
	.word	0x611a97bd,0x0530119c,0x94a94b5e,0xbecadff5
	.word	0x6bfe683f,0xb1ba7d46,0xdc630104,0x4ab1bae3
	.word	0xa2cba1fa,0x878aa658,0xa78278eb,0x9fafefef
	.word	0x30bfcac1,0xabf03020,0x96f6790a,0x131f7807
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
	.word	0x1f3ea91b,0x32dd4be2,0x73f138f9,0xf7034b30
	.word	0x7d64ac54,0xefe00fe6,0x5aa6806b,0x6abc2db4
	.word	0xcfabcd92,0xfcd1f9fc,0x89de7878,0xddf7b46f
	.word	0x7763161f,0x50eab348,0xb48fd490,0x27e5f590
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
	.word	0x36181052,0x8fdb3f85,0x787bfd2b,0x92ebfe25
	.word	0xc1ef26eb,0x1a113557,0x97fd1df5,0x33e7c3dd
	.word	0xe681d058,0xffe7c4c4,0xc27be7e5,0x09faaa89
	.word	0x57d5a682,0x7e73130d,0xa6b83021,0x95f8f09e
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
	.word	0x02d46331,0x30493960,0x7dcfecd9,0x996722db
	.word	0x5030d0b0,0x847b229c,0x83018bde,0x5f4e94ac
	.word	0xcb38a8f2,0x3ebe2ec7,0x3d517643,0x27b6813c
	.word	0x770ef1e3,0x94f993b8,0x089552a8,0xaa6e4118
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
	.word	0x4eef94ba,0x239a0d35,0xea48329d,0xd53f7559
	.word	0x9a5112a2,0x3cceb1f3,0x6330fb4e,0x66d70f18
	.word	0x7dea0e50,0x1d858298,0xb0661710,0x95748079
	.word	0xaca2929f,0x88b66458,0xd58cfcc8,0xa3d13100
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
	.word	0xe65d7049,0xe51fb816,0xc9805925,0x1f3cfdb4
	.word	0x071a72a4,0xb3250928,0xa10fa8c8,0x823fbf33
	.word	0x9117f820,0x077c310c,0xbe9a1740,0xc6672f44
	.word	0xc06caef7,0x923886e6,0x6f4537ac,0x1a5185c2
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
	.word	0x960de33b,0x29cffb7c,0xd09b59c8,0x80ada6c8
	.word	0x0c5abdf8,0xf04a9bbf,0x89a56831,0x5c11a999
	.word	0xe2ff47bd,0x09be3ca1,0xc31cc84b,0x38ea09bd
	.word	0x8a7635e1,0xb743ad62,0xc15c5f2a,0x7af196a3
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
	.word	0xd0f73e5d,0x665dcbe6,0x482f13d0,0x1693c5b1
	.word	0x502770bf,0x9ea470e9,0xaf480122,0xf0095901
	.word	0x159f5307,0x5424b3de,0x6a5a62a8,0xf1284c56
	.word	0xbc830e1f,0xdc012717,0x86781abd,0x603539d0
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
	.word	0xa3e6779a,0x1669303f,0xec2762c5,0x9a924e33
	.word	0x48730d21,0x079cecb4,0xf5485dbe,0xb181df23
	.word	0x6ae6d917,0xd5eecb58,0x83534e3d,0x39c89d09
	.word	0x46a60047,0x5a83eb46,0xe427639b,0xbe96ac9e
	.word	0xbb5c726d,0xb6b5afe0,0xf7563a8d,0x51a3ff16
	.word	0x5b1ab64f,0x6bec5272,0x68503cbf,0xe2e044f3
	.word	0x7cfcdf17,0x08ab7436,0x2915fafa,0x42289330
	.word	0xc016eadf,0xeee836e5,0x0f23fd6d,0x1b0e7271
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
	.word	0x54b46880,0x607b08cc,0x2b3a7765,0xfc9d52bc
	.word	0x87047f8c,0x7ffc6602,0x6d50fb83,0xb783dfa2
	.word	0x0fda20a0,0x1fcc876e,0x2b1d0b37,0xa8d8537b
	.word	0x6a1c8b96,0xcd2b7591,0x67120363,0x2db71a5e
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
	.word	0x3bd3b994,0x008c0a11,0xdb7bf24d,0x6d8862ad
	.word	0x221d7f5b,0x4772b945,0x58d02f24,0xd09b00f9
	.word	0x71b77f5f,0x117851ff,0xfa6f9306,0xa0927c8c
	.word	0xb2a13ddb,0xf5450940,0xdfa1e6c0,0xbc39efe2
	.word	0x0a482728,0x602e19ad,0xf17ed360,0x269f9eef
	.word	0xb119b6ca,0x7324971a,0xcdd9723b,0x22d48534
	.word	0xa9bafd7a,0xf8887a30,0xa8e42a0e,0x5fb9a09d
	.word	0x91fffcfa,0xb1306649,0x98f0b95b,0x6abfa88f
	.word	0xc6ae05ff,0xd85a6559,0x46406378,0x46339c7b
	.word	0x4697f6fc,0x16e54e71,0x8c99b628,0x7abd6ad1
	.word	0x5ba234d9,0xcb73d723,0x9efbfa1e,0x7484c371
	.word	0x494194be,0x1aa1ecd3,0x154d9006,0x24f7bdbe
	.word	0x57240fe0,0x532ecee4,0xf75a0260,0x6f9d3dfa
	.word	0x06334314,0x672c4734,0xa9263491,0xc1bab4ff
	.word	0x619b1ea7,0xa3c21e32,0x0aed8923,0x8d13a7fd
	.word	0x68a4febe,0x94e6591c,0x7317e834,0xee348c49
	.word	0x7b655371,0x2b0e326c,0x7e178ead,0xaab363ae
	.word	0xbd1b80f2,0x7d6e8e3e,0xf5c0ffc7,0x45e8ec2e
	.word	0xef059fff,0xd6f23e13,0xd6b05ba4,0x9b171f25
	.word	0x5fd450a2,0x1cf78926,0x06b9079b,0x5efc606a
	.word	0x19bbda9c,0x704ba05e,0x197aee1c,0x378ffd4b
	.word	0xb81065ce,0x38c9ead3,0x542d0c86,0x4b19a684
	.word	0xeac9e922,0x39b5bac8,0x670b5aa8,0x154f21a8
	.word	0x0a4cd42e,0xbbb70520,0x76f9ec3d,0x057f1b56
	.word	0xb337bce0,0x20d66963,0x07031560,0x0d5d82cc
	.word	0x27341e37,0x21204983,0xd59b1520,0x64b3a262
	.word	0x68efc1ff,0x14bb9028,0x75778738,0x90c10572
	.word	0xa80be6be,0xc41e3e50,0xfb41b5dd,0xd07baf75
	.word	0x3653a57a,0x65521e7a,0x18f41b06,0x5c5df448
	.word	0x0cc11825,0xb6a74fda,0xb50ca733,0xc16c2988
	.word	0x241675c7,0x8bc3b7fa,0x85a82ca1,0xc0d8a127
	.word	0x4d14819e,0xeee7849b,0x4595cdbe,0xe19c14d9
share3_end:
