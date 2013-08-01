/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000_7.s
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
!	Seed = 327144523
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_3000_7.s created on Mar 27, 2009 (14:45:23)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_3000_7 -p 1 -l 3000

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
!	%f0  = 38b51efc a83b2d1f bf56dced 78e1c136
!	%f4  = 8d1f3bd4 4fcb9bc3 fd1391e4 dfd9ce76
!	%f8  = 28326b59 76a2a117 3301a2ab 768c1512
!	%f12 = 32b001c0 5aadd6fd 4fd79745 6ffa1d62
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = e79d7db9 bdd3ee12 bff47cb4 54d907a8
!	%f20 = 70d12ea4 d39ca6e3 57e6b81a 221ada99
!	%f24 = 4d3cc2da 617ebc64 be342c94 593d4611
!	%f28 = da573830 269650fe c86246bf b9e10c97
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 8d913ce2 5818bb3f 3f240e52 fbb0f85e
!	%f36 = c417e972 2e33b61f ca807afb ccdd005f
!	%f40 = 7f3ecc49 7c8f651b 4b25ea3a abcf8a71
!	%f44 = 69b8ed9a 265dcce0 f493eaf0 1e3a3452
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xb588de5000000053,%g7,%g1 ! GSR scale = 10, align = 3
	wr	%g1,%g0,%gsr		! GSR = b588de5000000053
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000010141400] = f5a2e5f0, %l3 = 83c8391a06dc575c
	ldsba	[%i5+%g0]0x80,%l3	! %l3 = fffffffffffffff5
!	%l6 = 479f27b5, %l7 = 9f2a1214, Mem[0000000030101400] = 82f7e0c1 66430049
	stda	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 479f27b5 9f2a1214
!	%l5 = 3201198adfa0ac4f, %l5 = 3201198adfa0ac4f, %y  = 00000000
	udiv	%l5,%l5,%l1		! %l1 = 0000000000000001
	mov	%l0,%y			! %y = d0b000e6
!	Mem[0000000030101400] = b5279f47, %l5 = 3201198adfa0ac4f
	ldstuba	[%i4+%g0]0x81,%l5	! %l5 = 000000b5000000ff
!	%f0  = 38b51efc a83b2d1f, Mem[0000000030001408] = 35d5feb0 791e6618
	stda	%f0 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 38b51efc a83b2d1f
!	%l0 = 95c30eebd0b000e6, Mem[000000001018140e] = 91c1f147
	sth	%l0,[%i6+0x00e]		! Mem[000000001018140c] = 91c100e6
!	%f0  = 38b51efc a83b2d1f, %l7 = 876085d29f2a1214
!	Mem[00000000300c1420] = 89d516c4abc26868
	add	%i3,0x020,%g1
	stda	%f0,[%g1+%l7]ASI_PST32_S ! Mem[00000000300c1420] = 89d516c4abc26868
!	Mem[0000000030181400] = ad2e3cbb78916949, %l1 = 0000000000000001
	ldxa	[%i6+%g0]0x89,%l1	! %l1 = ad2e3cbb78916949
!	Mem[0000000030101400] = 479f27ff, %l5 = 00000000000000b5
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 00000000479f27ff
!	Starting 10 instruction Store Burst
!	%l4 = 6bad4728a8e2e78e, Mem[0000000030181400] = 78916949
	stha	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 7891e78e

p0_label_2:
!	%f12 = 32b001c0 5aadd6fd, %l0 = 95c30eebd0b000e6
!	Mem[0000000010181430] = 72e7bf45192b3c10
	add	%i6,0x030,%g1
	stda	%f12,[%g1+%l0]ASI_PST16_P ! Mem[0000000010181430] = 72e701c05aad3c10
!	%f8  = 28326b59 76a2a117, %l1 = ad2e3cbb78916949
!	Mem[0000000030001418] = f82df2ce822190d7
	add	%i0,0x018,%g1
	stda	%f8,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030001418] = 17a1a276822190d7
!	Mem[0000000030001400] = a12aa807, %l3 = fffffffffffffff5
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 00000000a12aa807
!	%l4 = 6bad4728a8e2e78e, imm = fffffffffffffd9c, %l0 = 95c30eebd0b000e6
	addc	%l4,-0x264,%l0		! %l0 = 6bad4728a8e2e52a
!	%l1 = ad2e3cbb78916949, imm = 0000000000000582, %l6 = 02704c8e479f27b5
	or	%l1,0x582,%l6		! %l6 = ad2e3cbb78916dcb
!	%l1 = ad2e3cbb78916949, Mem[000000001000143e] = adf371ad, %asi = 80
	stha	%l1,[%i0+0x03e]%asi	! Mem[000000001000143c] = adf36949
!	%f23 = 221ada99, Mem[00000000100c1408] = 6b7e613d
	sta	%f23,[%i3+%o4]0x80	! Mem[00000000100c1408] = 221ada99
!	Mem[0000000030041408] = d4c6f28b, %l0 = 6bad4728a8e2e52a
	ldstuba	[%i1+%o4]0x81,%l0	! %l0 = 000000d4000000ff
!	%l4 = 6bad4728a8e2e78e, Mem[0000000010081408] = 4f62f486
	stba	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 4f62f48e
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = 7f9995a98cae2507, %l3 = 00000000a12aa807
	ldx	[%i2+0x038],%l3		! %l3 = 7f9995a98cae2507

p0_label_3:
!	%f8  = 28326b59, %f14 = 4fd79745
	fcmpes	%fcc1,%f8 ,%f14		! %fcc1 = 1
!	Mem[0000000010141410] = e6f2c253, %l3 = 7f9995a98cae2507
	lduwa	[%i5+%o5]0x88,%l3	! %l3 = 00000000e6f2c253
!	Mem[0000000010041420] = e45f81ed 1d22008e, %l0 = 000000d4, %l1 = 78916949
	ldd	[%i1+0x020],%l0		! %l0 = 00000000e45f81ed 000000001d22008e
!	Mem[0000000010001410] = ea70d01aa13f90d4, %f24 = 4d3cc2da 617ebc64
	ldda	[%i0+%o5]0x88,%f24	! %f24 = ea70d01a a13f90d4
!	Mem[0000000010081420] = 262b71a78d9039a3, %f20 = 70d12ea4 d39ca6e3
	ldd	[%i2+0x020],%f20	! %f20 = 262b71a7 8d9039a3
!	Mem[0000000020800000] = 365c5b63, %l0 = 00000000e45f81ed
	ldub	[%o1+0x001],%l0		! %l0 = 000000000000005c
!	Mem[00000000300c1410] = 8b9902eb, %f12 = 32b001c0
	lda	[%i3+%o5]0x81,%f12	! %f12 = 8b9902eb
!	Mem[0000000030101408] = fd4dddaa, %l3 = 00000000e6f2c253
	ldsha	[%i4+%o4]0x81,%l3	! %l3 = fffffffffffffd4d
!	Mem[00000000211c0000] = e58c4b99, %l3 = fffffffffffffd4d
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000e5000000ff
!	Starting 10 instruction Store Burst
!	%l2 = d308f4101dfdfa3a, Mem[0000000030101408] = c898ecdfaadd4dfd
	stxa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = d308f4101dfdfa3a

p0_label_4:
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 000000000000005c
	setx	0x5fb9e057ebea92f4,%g7,%l0 ! %l0 = 5fb9e057ebea92f4
!	%l1 = 000000001d22008e
	setx	0x8afc670fbb3aeb85,%g7,%l1 ! %l1 = 8afc670fbb3aeb85
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5fb9e057ebea92f4
	setx	0x1fdafd88188ce4be,%g7,%l0 ! %l0 = 1fdafd88188ce4be
!	%l1 = 8afc670fbb3aeb85
	setx	0x4ead03f83145e862,%g7,%l1 ! %l1 = 4ead03f83145e862
!	Mem[000000001004140f] = 11b59f35, %l0 = 1fdafd88188ce4be
	ldstuba	[%i1+0x00f]%asi,%l0	! %l0 = 00000035000000ff
!	%l3 = 00000000000000e5, Mem[0000000030041410] = a2164892
	stwa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000e5
!	%l5 = 00000000479f27ff, Mem[0000000030081410] = d745ac45
	stha	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 27ffac45
!	%l4 = 6bad4728a8e2e78e, Mem[00000000211c0000] = ff8c4b99, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = e78e4b99
!	%f20 = 262b71a7 8d9039a3, Mem[0000000010041410] = 241a94fb a763103a
	stda	%f20,[%i1+%o5]0x80	! Mem[0000000010041410] = 262b71a7 8d9039a3
!	Mem[0000000010081400] = 1170adf8, %l0 = 0000000000000035
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 000000001170adf8
!	%l1 = 4ead03f83145e862, Mem[0000000030181408] = 9eaae217fb9cd25c
	stxa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 4ead03f83145e862
!	Mem[0000000010101403] = 53ad409c, %l3 = 00000000000000e5
	ldstub	[%i4+0x003],%l3		! %l3 = 0000009c000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = f5ffffff e47b6216, %l2 = 1dfdfa3a, %l3 = 0000009c
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 00000000f5ffffff 00000000e47b6216

p0_label_5:
!	Mem[0000000030081408] = 1e8cab71, %l7 = 876085d29f2a1214
	ldsba	[%i2+%o4]0x81,%l7	! %l7 = 000000000000001e
!	Mem[0000000030181408] = 62e84531 f803ad4e, %l6 = 78916dcb, %l7 = 0000001e
	ldda	[%i6+%o4]0x89,%l6	! %l6 = 00000000f803ad4e 0000000062e84531
!	Mem[0000000030001410] = 5cd3715f98d55407, %l1 = 4ead03f83145e862
	ldxa	[%i0+%o5]0x81,%l1	! %l1 = 5cd3715f98d55407
!	%f19 = 54d907a8, %f2  = bf56dced, %f8  = 28326b59
	fsubs	%f19,%f2 ,%f8 		! %f8  = 54d907a8
!	Mem[0000000010041408] = ff9fb511 260ceba6, %l0 = 1170adf8, %l1 = 98d55407
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000260ceba6 00000000ff9fb511
!	Mem[0000000010001438] = 77dc5bff, %l6 = 00000000f803ad4e
	ldsw	[%i0+0x038],%l6		! %l6 = 0000000077dc5bff
!	Mem[0000000010101410] = 114ed4389695bbf8, %l0 = 00000000260ceba6
	ldxa	[%i4+%o5]0x80,%l0	! %l0 = 114ed4389695bbf8
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010001400] = 369dec9d ab7361d0 4c05bd3d b8f161e8
!	Mem[0000000010001410] = d4903fa1 1ad070ea 98d0e6b4 1afba657
!	Mem[0000000010001420] = 0db79c36 c750ee45 22d7337e 28e63c7e
!	Mem[0000000010001430] = 010a115a e7e770fa 77dc5bff adf36949
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Mem[0000000010101408] = 0cf9081d, %l6 = 0000000077dc5bff
	ldswa	[%i4+0x008]%asi,%l6	! %l6 = 000000000cf9081d
!	Starting 10 instruction Store Burst
!	%l2 = 00000000f5ffffff, Mem[000000001008143c] = 8cae2507
	sth	%l2,[%i2+0x03c]		! Mem[000000001008143c] = ffff2507

p0_label_6:
!	%l2 = 00000000f5ffffff, Mem[0000000010081418] = f78cb2f4
	sth	%l2,[%i2+0x018]		! Mem[0000000010081418] = ffffb2f4
!	%l5 = 00000000479f27ff, Mem[0000000030141400] = d4707ac1
	stha	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = d47027ff
!	Mem[00000000300c1410] = eb02998b, %l6 = 000000000cf9081d
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 00000000eb02998b
!	%f20 = 262b71a7, Mem[0000000010101400] = 53ad40ff
	sta	%f20,[%i4+%g0]0x80	! Mem[0000000010101400] = 262b71a7
!	%f25 = a13f90d4, Mem[0000000030081410] = 45acff27
	sta	%f25,[%i2+%o5]0x89	! Mem[0000000030081410] = a13f90d4
!	%l2 = 00000000f5ffffff, Mem[0000000030001410] = 5f71d35c
	stwa	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = f5ffffff
!	%l4 = 6bad4728a8e2e78e, Mem[00000000300c1410] = 1d08f90c
	stba	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 8e08f90c
!	%l4 = 6bad4728a8e2e78e, Mem[0000000010101436] = d37aa06c
	stb	%l4,[%i4+0x036]		! Mem[0000000010101434] = d37a8e6c
!	%f0  = 369dec9d ab7361d0 4c05bd3d b8f161e8
!	%f4  = d4903fa1 1ad070ea 98d0e6b4 1afba657
!	%f8  = 0db79c36 c750ee45 22d7337e 28e63c7e
!	%f12 = 010a115a e7e770fa 77dc5bff adf36949
	stda	%f0,[%i4]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 114ed4389695bbf8
	setx	0x63ea03004da4319f,%g7,%l0 ! %l0 = 63ea03004da4319f
!	%l1 = 00000000ff9fb511
	setx	0x3d06b54846b9d78b,%g7,%l1 ! %l1 = 3d06b54846b9d78b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 63ea03004da4319f
	setx	0xbf353bc01ebc8485,%g7,%l0 ! %l0 = bf353bc01ebc8485
!	%l1 = 3d06b54846b9d78b
	setx	0xb979fc47e5b6e986,%g7,%l1 ! %l1 = b979fc47e5b6e986

p0_label_7:
!	Mem[0000000010041400] = 6e13d48a, %l1 = b979fc47e5b6e986
	lduba	[%i1+%g0]0x80,%l1	! %l1 = 000000000000006e
!	Mem[0000000030041410] = 000000e5, %l4 = 6bad4728a8e2e78e
	lduwa	[%i1+%o5]0x89,%l4	! %l4 = 00000000000000e5
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010101410] = 114ed438 9695bbf8, %l0 = 1ebc8485, %l1 = 0000006e
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 00000000114ed438 000000009695bbf8
!	Mem[0000000010081400] = 35000000, %l6 = 00000000eb02998b
	ldsha	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 2007b7ba 323ebeac 221ada99 e635b7cc
!	Mem[00000000100c1410] = e8405eac 3b70ef3b 8d59ff24 0923f7ad
!	Mem[00000000100c1420] = b6366b43 84bc058d 7a8e4af0 7e610554
!	Mem[00000000100c1430] = af520c69 f21de8de 8ae1e2be 7b3c982e
	ldda	[%i3]ASI_BLK_PL,%f0	! Block Load from 00000000100c1400
!	Mem[0000000010081408] = 49ce89464f62f48e, %l0 = 00000000114ed438
	ldxa	[%i2+%o4]0x88,%l0	! %l0 = 49ce89464f62f48e
!	Mem[0000000030101400] = 369dec9d ab7361d0 4c05bd3d b8f161e8
!	Mem[0000000030101410] = d4903fa1 1ad070ea 98d0e6b4 1afba657
!	Mem[0000000030101420] = 0db79c36 c750ee45 22d7337e 28e63c7e
!	Mem[0000000030101430] = 010a115a e7e770fa 77dc5bff adf36949
	ldda	[%i4]ASI_BLK_SL,%f16	! Block Load from 0000000030101400
!	Mem[0000000010001400] = 369dec9d ab7361d0, %l4 = 000000e5, %l5 = 479f27ff
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 00000000369dec9d 00000000ab7361d0
!	Mem[0000000030041408] = ffc6f28b, %f6  = adf72309
	lda	[%i1+%o4]0x81,%f6 	! %f6 = ffc6f28b
!	Starting 10 instruction Store Burst
!	%f0  = acbe3e32 bab70720 ccb735e6 99da1a22
!	%f4  = 3bef703b ac5e40e8 ffc6f28b 24ff598d
!	%f8  = 8d05bc84 436b36b6 5405617e f04a8e7a
!	%f12 = dee81df2 690c52af 2e983c7b bee2e18a
	stda	%f0,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400

p0_label_8:
!	%f25 = 369cb70d, Mem[0000000010001400] = 369dec9d
	sta	%f25,[%i0+%g0]0x80	! Mem[0000000010001400] = 369cb70d
!	%f30 = 4969f3ad, Mem[00000000300c1408] = 6fc8c2a9
	sta	%f30,[%i3+%o4]0x89	! Mem[00000000300c1408] = 4969f3ad
	membar	#Sync			! Added by membar checker (3)
!	%l3 = 00000000e47b6216, Mem[00000000100c1400] = 2007b7ba323ebeac
	stx	%l3,[%i3+%g0]		! Mem[00000000100c1400] = 00000000e47b6216
!	%f26 = 7e3ce628 7e33d722, Mem[0000000010041410] = ac5e40e8 3bef703b
	stda	%f26,[%i1+%o5]0x88	! Mem[0000000010041410] = 7e3ce628 7e33d722
!	%l1 = 000000009695bbf8, Mem[000000001010141a] = 1bf4cbdc
	stb	%l1,[%i4+0x01a]		! Mem[0000000010101418] = 1bf4f8dc
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 49ce89464f62f48e
	setx	0x9b22b3a024950b09,%g7,%l0 ! %l0 = 9b22b3a024950b09
!	%l1 = 000000009695bbf8
	setx	0x52372647c4bc8dd2,%g7,%l1 ! %l1 = 52372647c4bc8dd2
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9b22b3a024950b09
	setx	0xa4fc123f8c7a9b1c,%g7,%l0 ! %l0 = a4fc123f8c7a9b1c
!	%l1 = 52372647c4bc8dd2
	setx	0xecde63382827de5a,%g7,%l1 ! %l1 = ecde63382827de5a
!	Mem[0000000010081418] = ffffb2f4, %l5 = 00000000ab7361d0, %asi = 80
	swapa	[%i2+0x018]%asi,%l5	! %l5 = 00000000ffffb2f4
!	Code Fragment 3
p0_fragment_4:
!	%l0 = a4fc123f8c7a9b1c
	setx	0x8ffa1a385c0982c9,%g7,%l0 ! %l0 = 8ffa1a385c0982c9
!	%l1 = ecde63382827de5a
	setx	0xf4671d87d768524a,%g7,%l1 ! %l1 = f4671d87d768524a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8ffa1a385c0982c9
	setx	0x5d91447fe16b9e2d,%g7,%l0 ! %l0 = 5d91447fe16b9e2d
!	%l1 = f4671d87d768524a
	setx	0xf357e5786b6a62a0,%g7,%l1 ! %l1 = f357e5786b6a62a0
!	Mem[0000000010041408] = 99da1a22, %l3 = 00000000e47b6216
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 00000022000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = e78e4b99, %l2 = 00000000f5ffffff
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffe78e

p0_label_9:
!	Mem[0000000010141410] = f34ef10ce6f2c253, %f6  = ffc6f28b 24ff598d
	ldda	[%i5+%o5]0x88,%f6 	! %f6  = f34ef10c e6f2c253
!	%l5 = 00000000ffffb2f4, %l3 = 0000000000000022, %y  = d0b000e6
	sdiv	%l5,%l3,%l2		! %l2 = ffffffff80000000
	mov	%l0,%y			! %y = e16b9e2d
!	Mem[0000000010041410] = 22d7337e28e63c7e, %l6 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l6	! %l6 = 22d7337e28e63c7e
!	%l2 = ffffffff80000000, immd = fffffffffffff515, %l5 = 00000000ffffb2f4
	udivx	%l2,-0xaeb,%l5		! %l5 = 0000000000000000
!	Mem[000000001000143c] = adf36949, %l3 = 0000000000000022
	ldsb	[%i0+0x03f],%l3		! %l3 = 0000000000000049
!	Mem[00000000100c1418] = 8d59ff24, %l0 = 5d91447fe16b9e2d
	lduh	[%i3+0x018],%l0		! %l0 = 0000000000008d59
!	Mem[0000000020800040] = 735fa555, %l4 = 00000000369dec9d
	ldsba	[%o1+0x040]%asi,%l4	! %l4 = 0000000000000073
!	Mem[0000000020800040] = 735fa555, %l2 = ffffffff80000000
	ldsba	[%o1+0x040]%asi,%l2	! %l2 = 0000000000000073
!	Mem[00000000300c1408] = 1b0a77414969f3ad, %f26 = 7e3ce628 7e33d722
	ldda	[%i3+%o4]0x89,%f26	! %f26 = 1b0a7741 4969f3ad
!	Starting 10 instruction Store Burst
!	%f26 = 1b0a7741 4969f3ad, %l2 = 0000000000000073
!	Mem[0000000030101400] = 369dec9dab7361d0
	stda	%f26,[%i4+%l2]ASI_PST8_SL ! Mem[0000000030101400] = adf3ec9d41770ad0

p0_label_10:
!	%l2 = 0000000000000073, Mem[0000000030081400] = cbb059c7
	stha	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 007359c7
!	%f8  = 8d05bc84, Mem[0000000010041408] = ff1ada99
	sta	%f8 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 8d05bc84
!	%f22 = 57a6fb1a, %f5  = ac5e40e8
	fcmpes	%fcc1,%f22,%f5 		! %fcc1 = 2
!	Mem[0000000010181408] = 63851402, %l7 = 0000000062e84531
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 00000002000000ff
!	%l6 = 28e63c7e, %l7 = 00000002, Mem[0000000010081408] = 8ef4624f 4689ce49
	stda	%l6,[%i2+0x008]%asi	! Mem[0000000010081408] = 28e63c7e 00000002
!	%l3 = 0000000000000049, Mem[0000000010141400] = f5a2e5f0
	stwa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000049
!	Mem[00000000100c1410] = ac5e40e8, %l4 = 0000000000000073
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 00000000ac5e40e8
!	%l1 = f357e5786b6a62a0, Mem[0000000010001406] = ab7361d0, %asi = 80
	stha	%l1,[%i0+0x006]%asi	! Mem[0000000010001404] = ab7362a0
!	Mem[0000000030041410] = 000000e5, %l6 = 22d7337e28e63c7e
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 000000e5000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = a13f90d4, %l5 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l5	! %l5 = 00000000a13f90d4

p0_label_11:
!	Mem[00000000100c1418] = 8d59ff240923f7ad, %f16 = d06173ab 9dec9d36
	ldd	[%i3+0x018],%f16	! %f16 = 8d59ff24 0923f7ad
!	Mem[0000000010041400] = bab70720, %l5 = 00000000a13f90d4
	ldswa	[%i1+%g0]0x88,%l5	! %l5 = ffffffffbab70720
!	Mem[0000000030141410] = dd74d706, %l5 = ffffffffbab70720
	ldswa	[%i5+%o5]0x89,%l5	! %l5 = ffffffffdd74d706
!	Mem[0000000010101400] = 262b71a7, %l2 = 0000000000000073
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 000000000000262b
!	Mem[00000000100c1408] = 221ada99, %f29 = 5a110a01
	lda	[%i3+%o4]0x80,%f29	! %f29 = 221ada99
!	Mem[0000000030141400] = ff2770d462597181, %f28 = fa70e7e7 221ada99
	ldda	[%i5+%g0]0x81,%f28	! %f28 = ff2770d4 62597181
!	%l1 = f357e5786b6a62a0, %l2 = 000000000000262b, %l0 = 0000000000008d59
	udivx	%l1,%l2,%l0		! %l0 = 00066026b5ae80b4
!	Mem[0000000010101408] = 0cf9081d, %l2 = 000000000000262b
	ldsha	[%i4+0x008]%asi,%l2	! %l2 = 0000000000000cf9
!	Mem[0000000010101434] = d37a8e6c, %l7 = 0000000000000002
	ldsh	[%i4+0x034],%l7		! %l7 = ffffffffffffd37a
!	Starting 10 instruction Store Burst
!	%l6 = 000000e5, %l7 = ffffd37a, Mem[0000000030141410] = 06d774dd c6ac212d
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000e5 ffffd37a

p0_label_12:
!	%l1 = f357e5786b6a62a0, Mem[0000000030101410] = d4903fa11ad070ea
	stxa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = f357e5786b6a62a0
!	%f0  = acbe3e32 bab70720, Mem[0000000010081408] = 28e63c7e 00000002
	stda	%f0 ,[%i2+%o4]0x80	! Mem[0000000010081408] = acbe3e32 bab70720
!	%f12 = dee81df2, Mem[0000000030141410] = e5000000
	sta	%f12,[%i5+%o5]0x89	! Mem[0000000030141410] = dee81df2
!	%f30 = 4969f3ad ff5bdc77, %l0 = 00066026b5ae80b4
!	Mem[0000000010081408] = acbe3e32bab70720
	add	%i2,0x008,%g1
	stda	%f30,[%g1+%l0]ASI_PST32_P ! Mem[0000000010081408] = acbe3e32bab70720
!	Mem[0000000010081408] = acbe3e32, %l6 = 00000000000000e5
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 000000ac000000ff
!	%l0 = 00066026b5ae80b4, Mem[00000000300c1408] = 4969f3ad
	stha	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 496980b4
!	%l4 = 00000000ac5e40e8, Mem[0000000020800001] = 365c5b63
	stb	%l4,[%o1+0x001]		! Mem[0000000020800000] = 36e85b63
!	Mem[0000000010041410] = 7e33d722, %l4 = 00000000ac5e40e8
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 00000022000000ff
!	%l3 = 0000000000000049, Mem[0000000010081410] = 4eb6087d
	stwa	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000049
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = e78e4b99, %l7 = ffffffffffffd37a
	ldub	[%o2+%g0],%l7		! %l7 = 00000000000000e7

p0_label_13:
!	Mem[0000000030141410] = f21de8de, %l6 = 00000000000000ac
	lduba	[%i5+%o5]0x81,%l6	! %l6 = 00000000000000f2
!	Mem[0000000010141400] = 000000497c74fcde, %f12 = dee81df2 690c52af
	ldda	[%i5+%g0]0x80,%f12	! %f12 = 00000049 7c74fcde
!	Mem[00000000100c1400] = 00000000, %l0 = 00066026b5ae80b4
	ldsha	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = a13f90d4, %l0 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000d4
!	Mem[0000000010001420] = 0db79c36 c750ee45, %l4 = 00000022, %l5 = dd74d706
	ldda	[%i0+0x020]%asi,%l4	! %l4 = 000000000db79c36 00000000c750ee45
!	Mem[0000000010001400] = 369cb70d ab7362a0, %l6 = 000000f2, %l7 = 000000e7
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000369cb70d 00000000ab7362a0
!	Mem[0000000030141400] = 81715962d47027ff, %f20 = ea70d01a a13f90d4
	ldda	[%i5+%g0]0x89,%f20	! %f20 = 81715962 d47027ff
!	Mem[0000000030001408] = 1f2d3ba8, %l0 = 00000000000000d4
	ldsba	[%i0+%o4]0x81,%l0	! %l0 = 000000000000001f
!	Mem[0000000030141408] = dac09af4dc7495ba, %l5 = 00000000c750ee45
	ldxa	[%i5+%o4]0x89,%l5	! %l5 = dac09af4dc7495ba
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000049, Mem[00000000300c1408] = 496980b4
	stba	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 49698049

p0_label_14:
!	%l6 = 00000000369cb70d, Mem[0000000030181410] = ee567a29
	stha	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = b70d7a29
!	%f22 = 57a6fb1a, Mem[0000000030041408] = 8bf2c6ff
	sta	%f22,[%i1+%o4]0x89	! Mem[0000000030041408] = 57a6fb1a
!	%f21 = d47027ff, Mem[00000000100c1400] = 00000000
	sta	%f21,[%i3+%g0]0x80	! Mem[00000000100c1400] = d47027ff
!	%l7 = 00000000ab7362a0, Mem[0000000030181408] = f803ad4e
	stha	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = f80362a0
!	Mem[00000000100c1410] = 73000000, %l4 = 000000000db79c36
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 0000000073000000
!	%f9  = 436b36b6, Mem[00000000300c1408] = 49698049
	sta	%f9 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 436b36b6
!	%l0 = 0000001f, %l1 = 6b6a62a0, Mem[0000000030101408] = 4c05bd3d b8f161e8
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000001f 6b6a62a0
!	%l0 = 000000000000001f, Mem[0000000010141410] = 53c2f2e6
	stwa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000001f
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 000000000000001f
	setx	0xb4d1b0afdc729bd3,%g7,%l0 ! %l0 = b4d1b0afdc729bd3
!	%l1 = f357e5786b6a62a0
	setx	0xd8b185c79fa93f46,%g7,%l1 ! %l1 = d8b185c79fa93f46
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b4d1b0afdc729bd3
	setx	0x410e2be7fa126126,%g7,%l0 ! %l0 = 410e2be7fa126126
!	%l1 = d8b185c79fa93f46
	setx	0x722ebabfdb9c5088,%g7,%l1 ! %l1 = 722ebabfdb9c5088
!	Starting 10 instruction Load Burst
!	%f15 = bee2e18a, %f4  = 3bef703b
	fcmpes	%fcc1,%f15,%f4 		! %fcc1 = 1

p0_label_15:
!	Mem[0000000010041410] = ffd7337e, %l4 = 0000000073000000
	lduha	[%i1+%o5]0x80,%l4	! %l4 = 000000000000ffd7
!	Mem[0000000010001438] = 77dc5bff, %l4 = 000000000000ffd7
	ldsw	[%i0+0x038],%l4		! %l4 = 0000000077dc5bff
!	Mem[00000000201c0000] = 1388eaae, %l1 = 722ebabfdb9c5088
	ldub	[%o0+%g0],%l1		! %l1 = 0000000000000013
!	Mem[0000000010101400] = a7712b26, %l7 = 00000000ab7362a0
	ldswa	[%i4+%g0]0x88,%l7	! %l7 = ffffffffa7712b26
!	Mem[0000000030081410] = d4903fa1 9fdf938e, %l6 = 369cb70d, %l7 = a7712b26
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000d4903fa1 000000009fdf938e
!	Mem[0000000010181428] = a69ebf0f, %l3 = 0000000000000049
	lduwa	[%i6+0x028]%asi,%l3	! %l3 = 00000000a69ebf0f
!	Mem[0000000030181410] = 297a0db7, %l4 = 0000000077dc5bff
	ldswa	[%i6+%o5]0x89,%l4	! %l4 = 00000000297a0db7
!	Mem[0000000030141408] = dc7495ba, %l1 = 0000000000000013
	ldsha	[%i5+%o4]0x89,%l1	! %l1 = ffffffffffff95ba
!	Mem[0000000010001408] = 4c05bd3db8f161e8, %l1 = ffffffffffff95ba
	ldx	[%i0+%o4],%l1		! %l1 = 4c05bd3db8f161e8
!	Starting 10 instruction Store Burst
!	%l1 = 4c05bd3db8f161e8, Mem[0000000010041404] = 323ebeac, %asi = 80
	stwa	%l1,[%i1+0x004]%asi	! Mem[0000000010041404] = b8f161e8

p0_label_16:
!	%l2 = 00000cf9, %l3 = a69ebf0f, Mem[0000000010101408] = 1d08f90c e656e6ab
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000cf9 a69ebf0f
!	%l2 = 00000cf9, %l3 = a69ebf0f, Mem[0000000030181410] = b70d7a29 5f9fe92d
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000cf9 a69ebf0f
!	%l7 = 000000009fdf938e, %l2 = 0000000000000cf9, %y  = e16b9e2d
	sdiv	%l7,%l2,%l2		! %l2 = ffffffff80000000
	mov	%l0,%y			! %y = fa126126
!	%l7 = 000000009fdf938e, Mem[0000000010101422] = fac942fd
	sth	%l7,[%i4+0x022]		! Mem[0000000010101420] = fac9938e
!	%l3 = 00000000a69ebf0f, Mem[000000001004142a] = 7a8e4af0, %asi = 80
	stba	%l3,[%i1+0x02a]%asi	! Mem[0000000010041428] = 7a8e0ff0
!	Mem[00000000211c0000] = e78e4b99, %l4 = 00000000297a0db7
	ldstub	[%o2+%g0],%l4		! %l4 = 000000e7000000ff
!	%f6  = f34ef10c e6f2c253, Mem[00000000100c1408] = 221ada99 e635b7cc
	stda	%f6 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = f34ef10c e6f2c253
!	%l2 = ffffffff80000000, Mem[0000000030001408] = 1f2d3ba8
	stha	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00003ba8
!	%f22 = 57a6fb1a b4e6d098, Mem[0000000030141408] = dc7495ba dac09af4
	stda	%f22,[%i5+%o4]0x89	! Mem[0000000030141408] = 57a6fb1a b4e6d098
!	Starting 10 instruction Load Burst
!	Mem[000000001004141c] = 8bf2c6ff, %l3 = 00000000a69ebf0f
	ldub	[%i1+0x01f],%l3		! %l3 = 00000000000000ff

p0_label_17:
!	Mem[0000000030041408] = 1afba657, %l0 = 410e2be7fa126126
	ldswa	[%i1+%o4]0x81,%l0	! %l0 = 000000001afba657
!	Mem[0000000030141408] = 98d0e6b4, %l4 = 00000000000000e7
	ldsba	[%i5+%o4]0x81,%l4	! %l4 = ffffffffffffff98
!	Mem[00000000211c0000] = ff8e4b99, %l3 = 00000000000000ff
	ldsba	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081408] = 08e547b771ab8c1e, %f26 = 1b0a7741 4969f3ad
	ldda	[%i2+%o4]0x89,%f26	! %f26 = 08e547b7 71ab8c1e
!	Mem[0000000030001400] = 16627be4fffffff5, %f4  = 3bef703b ac5e40e8
	ldda	[%i0+%g0]0x89,%f4 	! %f4  = 16627be4 fffffff5
!	Mem[0000000030041400] = 686e680f, %l0 = 000000001afba657
	lduba	[%i1+%g0]0x89,%l0	! %l0 = 000000000000000f
!	Mem[0000000021800180] = 846e1c36, %l7 = 000000009fdf938e
	lduba	[%o3+0x180]%asi,%l7	! %l7 = 0000000000000084
!	Mem[0000000021800180] = 846e1c36, %l5 = dac09af4dc7495ba
	lduha	[%o3+0x180]%asi,%l5	! %l5 = 000000000000846e
!	Mem[00000000211c0000] = ff8e4b99, %l5 = 000000000000846e
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ff8e
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000084, Mem[0000000010081410] = 49000000
	stha	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 00840000

p0_label_18:
!	%l3 = ffffffffffffffff, Mem[0000000010081408] = 323ebeff
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 323ebeff
!	%l7 = 0000000000000084, Mem[0000000010101410] = 114ed438
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000084
!	Mem[00000000100c1434] = f21de8de, %l5 = 000000000000ff8e
	ldstub	[%i3+0x034],%l5		! %l5 = 000000f2000000ff
!	%l2 = ffffffff80000000, Mem[0000000010141410] = 0000001f
	stha	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000001f
!	Mem[00000000211c0000] = ff8e4b99, %l4 = ffffffffffffff98
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000300c1400] = d49fed5b, %l3 = ffffffffffffffff
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 00000000d49fed5b
!	Mem[0000000010081400] = 35000000, %l7 = 0000000000000084
	ldstuba	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001432] = 010a115a, %l1 = 4c05bd3db8f161e8
	ldstub	[%i0+0x032],%l1		! %l1 = 00000011000000ff
!	Mem[0000000030101410] = f357e578, %l4 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 000000f3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 71ab8c1e, %f28 = ff2770d4
	lda	[%i2+%o4]0x89,%f28	! %f28 = 71ab8c1e

p0_label_19:
!	Mem[00000000300c1410] = 8e08f90c, %l3 = 00000000d49fed5b
	lduha	[%i3+%o5]0x81,%l3	! %l3 = 0000000000008e08
!	Mem[0000000010041408] = 8d05bc84 e635b7cc, %l2 = 80000000, %l3 = 00008e08
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 000000008d05bc84 00000000e635b7cc
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 000000000000000f
	setx	0xb28c272060bee8c5,%g7,%l0 ! %l0 = b28c272060bee8c5
!	%l1 = 0000000000000011
	setx	0x58e04e007aabd57c,%g7,%l1 ! %l1 = 58e04e007aabd57c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b28c272060bee8c5
	setx	0xceaed21064db534b,%g7,%l0 ! %l0 = ceaed21064db534b
!	%l1 = 58e04e007aabd57c
	setx	0xe076733f9806f444,%g7,%l1 ! %l1 = e076733f9806f444
!	Mem[0000000010041410] = 7e33d7ff, %l7 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000211c0000] = ff8e4b99, %l2 = 000000008d05bc84
	ldub	[%o2+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010101400] = 262b71a7, %l3 = 00000000e635b7cc
	ldswa	[%i4+%g0]0x80,%l3	! %l3 = 00000000262b71a7
!	Mem[0000000030101408] = 1f000000, %l0 = ceaed21064db534b
	lduba	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff, %l2 = 00000000000000ff
	ldsba	[%i3+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1400] = ff2770d4, %l2 = ffffffffffffffff
	ldsha	[%i3+%g0]0x88,%l2	! %l2 = 00000000000070d4
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030081408] = 71ab8c1e
	stha	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 71ab0000

p0_label_20:
!	Mem[0000000010001400] = 0db79c36, %l0 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 000000000db79c36
!	Mem[0000000030181400] = 7891e78e, %l7 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 0000008e000000ff
!	%l6 = 00000000d4903fa1, Mem[0000000010101400] = 262b71a7
	stb	%l6,[%i4+%g0]		! Mem[0000000010101400] = a12b71a7
!	%l4 = 000000f3, %l5 = 000000f2, Mem[0000000010181408] = 638514ff e600c191
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000f3 000000f2
!	Mem[00000000100c1420] = b6366b43, %l2 = 00000000000070d4
	swap	[%i3+0x020],%l2		! %l2 = 00000000b6366b43
!	%l7 = 000000000000008e, Mem[00000000300c1400] = 24d52de3ffffffff
	stxa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000000000008e
!	%f20 = 81715962 d47027ff, Mem[0000000010181400] = 27f56bb2 a86ac08b
	stda	%f20,[%i6+%g0]0x88	! Mem[0000000010181400] = 81715962 d47027ff
!	Mem[000000001014140c] = 88b7831d, %l7 = 0000008e, %l0 = 0db79c36
	add	%i5,0x0c,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 0000000088b7831d
!	Mem[00000000300c1400] = 8e000000, %l5 = 00000000000000f2
	swapa	[%i3+%g0]0x81,%l5	! %l5 = 000000008e000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = a12b71a7ba1fd126, %l4 = 00000000000000f3
	ldxa	[%i4+%g0]0x80,%l4	! %l4 = a12b71a7ba1fd126

p0_label_21:
!	Mem[0000000010001414] = 1ad070ea, %l5 = 000000008e000000
	lduw	[%i0+0x014],%l5		! %l5 = 000000001ad070ea
!	Mem[0000000021800100] = eab07eb5, %l7 = 000000000000008e
	ldsha	[%o3+0x100]%asi,%l7	! %l7 = ffffffffffffeab0
!	Mem[0000000010001438] = 77dc5bffadf36949, %f6  = f34ef10c e6f2c253
	ldd	[%i0+0x038],%f6 	! %f6  = 77dc5bff adf36949
!	Mem[0000000030101408] = 0000001f, %l5 = 000000001ad070ea
	ldswa	[%i4+%o4]0x81,%l5	! %l5 = 000000000000001f
!	Mem[0000000010181400] = d47027ff, %l7 = ffffffffffffeab0
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 00000000000027ff
!	Mem[0000000010181410] = 429c26ffd0a1fb6d, %l1 = e076733f9806f444
	ldxa	[%i6+%o5]0x88,%l1	! %l1 = 429c26ffd0a1fb6d
!	Mem[0000000010081408] = ffbe3e32bab70720, %l5 = 000000000000001f
	ldxa	[%i2+%o4]0x80,%l5	! %l5 = ffbe3e32bab70720
!	Mem[0000000010141408] = 18c2a287, %l1 = 429c26ffd0a1fb6d
	ldsb	[%i5+0x00b],%l1		! %l1 = ffffffffffffff87
!	%f31 = ff5bdc77, %f12 = 00000049
	fcmpes	%fcc3,%f31,%f12		! %fcc3 = 1
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 00000000, %l4 = a12b71a7ba1fd126
	swapa	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_22:
!	%l7 = 00000000000027ff, Mem[0000000010181410] = d0a1fb6d
	stha	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = d0a127ff
!	Mem[0000000010081430] = 67138f59fbee4764, %l2 = 00000000b6366b43, %l3 = 00000000262b71a7
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 67138f59fbee4764
!	Mem[00000000211c0000] = ff8e4b99, %l5 = ffbe3e32bab70720
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 000000ff000000ff
!	%f10 = 5405617e f04a8e7a, %l1 = ffffffffffffff87
!	Mem[0000000030081400] = 007359c761833684
	stda	%f10,[%i2+%l1]ASI_PST32_SL ! Mem[0000000030081400] = 7a8e4af07e610554
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 0000000088b7831d
	setx	0x1fa96108021c1606,%g7,%l0 ! %l0 = 1fa96108021c1606
!	%l1 = ffffffffffffff87
	setx	0xa252e0781cd8e45f,%g7,%l1 ! %l1 = a252e0781cd8e45f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1fa96108021c1606
	setx	0x39a42bf87975acc9,%g7,%l0 ! %l0 = 39a42bf87975acc9
!	%l1 = a252e0781cd8e45f
	setx	0xaaf9251854b0443c,%g7,%l1 ! %l1 = aaf9251854b0443c
!	%f22 = 57a6fb1a b4e6d098, Mem[0000000010081408] = 323ebeff 2007b7ba
	stda	%f22,[%i2+%o4]0x88	! Mem[0000000010081408] = 57a6fb1a b4e6d098
!	%l7 = 00000000000027ff, Mem[0000000030141410] = dee81df2
	stba	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = dee81dff
!	%f6  = 77dc5bff adf36949, Mem[0000000010101400] = a7712ba1 26d11fba
	stda	%f6 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 77dc5bff adf36949
!	%l3 = 67138f59fbee4764, Mem[0000000010001428] = 22d7337e, %asi = 80
	stha	%l3,[%i0+0x028]%asi	! Mem[0000000010001428] = 4764337e
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 5405617e f04a8e7a, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 00000000f04a8e7a 000000005405617e

p0_label_23:
!	Mem[00000000100c1400] = 16627be4ff2770d4, %f20 = 81715962 d47027ff
	ldda	[%i3+%g0]0x88,%f20	! %f20 = 16627be4 ff2770d4
!	Mem[0000000010041410] = 7e3ce628 7e33d7ff, %l6 = d4903fa1, %l7 = 000027ff
	ldda	[%i1+%o5]0x88,%l6	! %l6 = 000000007e33d7ff 000000007e3ce628
!	Mem[0000000020800000] = 36e85b63, %l7 = 000000007e3ce628
	lduba	[%o1+0x001]%asi,%l7	! %l7 = 00000000000000e8
!	Mem[0000000010101400] = 4969f3ad, %l0 = 39a42bf87975acc9
	lduba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000049
!	%l4 = 00000000f04a8e7a, %l1 = aaf9251854b0443c, %y  = fa126126
	umul	%l4,%l1,%l0		! %l0 = 4f7dea0e1b31cc98, %y = 4f7dea0e
!	Mem[0000000010041400] = 2007b7ba, %l5 = 000000005405617e
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = 000000002007b7ba
!	Mem[0000000010181410] = d0a127ff, %f17 = 0923f7ad
	lda	[%i6+%o5]0x88,%f17	! %f17 = d0a127ff
!	Mem[0000000030141400] = 81715962d47027ff, %f6  = 77dc5bff adf36949
	ldda	[%i5+%g0]0x89,%f6 	! %f6  = 81715962 d47027ff
!	Mem[0000000010081410] = 00008400, %l5 = 000000002007b7ba
	lduba	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = b4e6d098, %l5 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l5	! %l5 = 00000000b4e6d098

p0_label_24:
!	%f22 = 57a6fb1a b4e6d098, %l0 = 4f7dea0e1b31cc98
!	Mem[0000000010181428] = a69ebf0f5c068e76
	add	%i6,0x028,%g1
	stda	%f22,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010181428] = a69ebf0f5c068e76
!	%l5 = 00000000b4e6d098, Mem[00000000100c1400] = d47027ff
	stba	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 987027ff
!	Mem[0000000010181400] = ff2770d4, %l6 = 000000007e33d7ff
	ldstuba	[%i6+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	%l4 = f04a8e7a, %l5 = b4e6d098, Mem[0000000030001410] = fffffff5 98d55407
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = f04a8e7a b4e6d098
!	%l5 = 00000000b4e6d098, Mem[0000000030181400] = 7891e7ff
	stwa	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = b4e6d098
!	%l5 = 00000000b4e6d098, Mem[0000000010181400] = ff2770d4
	stwa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = b4e6d098
!	Mem[0000000010041400] = bab70720, %l3 = 67138f59fbee4764
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 00000000bab70720
!	%l6 = 00000000000000ff, Mem[00000000100c142a] = 7a8e4af0, %asi = 80
	stba	%l6,[%i3+0x02a]%asi	! Mem[00000000100c1428] = 7a8efff0
!	%l3 = 00000000bab70720, Mem[0000000010041400] = fbee4764
	stwa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = bab70720
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = d4903fa19fdf938e, %l2 = 00000000b6366b43
	ldxa	[%i2+%o5]0x81,%l2	! %l2 = d4903fa19fdf938e

p0_label_25:
!	Mem[0000000010081400] = 350000ff, %l6 = 00000000000000ff
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001410] = f04a8e7a, %l7 = 00000000000000e8
	ldsha	[%i0+%o5]0x81,%l7	! %l7 = fffffffffffff04a
!	Mem[0000000010101410] = f8bb959684000000, %l6 = 00000000000000ff
	ldxa	[%i4+%o5]0x88,%l6	! %l6 = f8bb959684000000
!	Mem[0000000010141434] = 77f6cf06, %l1 = aaf9251854b0443c
	lduwa	[%i5+0x034]%asi,%l1	! %l1 = 0000000077f6cf06
!	Mem[00000000211c0000] = ff8e4b99, %l3 = 00000000bab70720
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ff8e
!	Mem[0000000010101434] = d37a8e6c, %l2 = d4903fa19fdf938e
	ldsba	[%i4+0x037]%asi,%l2	! %l2 = 000000000000006c
!	Mem[0000000030041408] = 57a6fb1a, %l5 = 00000000b4e6d098
	ldsba	[%i1+%o4]0x89,%l5	! %l5 = 000000000000001a
!	Mem[0000000020800000] = 36e85b63, %l4 = 00000000f04a8e7a
	ldsha	[%o1+0x000]%asi,%l4	! %l4 = 00000000000036e8
!	Mem[0000000030001410] = 98d0e6b47a8e4af0, %f0  = acbe3e32 bab70720
	ldda	[%i0+%o5]0x89,%f0 	! %f0  = 98d0e6b4 7a8e4af0
!	Starting 10 instruction Store Burst
!	%l6 = f8bb959684000000, Mem[0000000030101408] = a0626a6b1f000000
	stxa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = f8bb959684000000

p0_label_26:
!	Mem[0000000010181410] = ff27a1d0, %l4 = 00000000000036e8
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 00000000ff27a1d0
!	%f20 = 16627be4 ff2770d4, Mem[0000000010041430] = af520c69 f21de8de
	stda	%f20,[%i1+0x030]%asi	! Mem[0000000010041430] = 16627be4 ff2770d4
!	%l2 = 000000000000006c, Mem[0000000021800080] = bb203e7c
	sth	%l2,[%o3+0x080]		! Mem[0000000021800080] = 006c3e7c
!	%l4 = 00000000ff27a1d0, Mem[0000000010141408] = 18c2a287
	stha	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = a1d0a287
!	%l3 = 000000000000ff8e, Mem[0000000030041410] = ff000000
	stba	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 8e000000
!	Mem[0000000030081400] = 7a8e4af0, %l7 = fffffffffffff04a
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 000000007a8e4af0
!	%l6 = f8bb959684000000, Mem[00000000300c1400] = 000000f2
	stwa	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 84000000
!	%l0 = 4f7dea0e1b31cc98, %l0 = 4f7dea0e1b31cc98, %y  = 4f7dea0e
	umul	%l0,%l0,%l4		! %l4 = 02e38ad805b29a40, %y = 02e38ad8
!	%f10 = 5405617e, Mem[00000000100c1410] = 369cb70d
	sta	%f10,[%i3+%o5]0x88	! Mem[00000000100c1410] = 5405617e
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = adf3ec9d, %l4 = 02e38ad805b29a40
	ldsha	[%i4+%g0]0x81,%l4	! %l4 = ffffffffffffadf3

p0_label_27:
!	Mem[0000000030181400] = 98d0e6b4, %f30 = 4969f3ad
	lda	[%i6+%g0]0x81,%f30	! %f30 = 98d0e6b4
!	Mem[0000000030081410] = d4903fa1, %l7 = 000000007a8e4af0
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffffffd4
!	Mem[0000000010001408] = e861f1b83dbd054c, %f2  = ccb735e6 99da1a22
	ldda	[%i0+%o4]0x88,%f2 	! %f2  = e861f1b8 3dbd054c
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 4f7dea0e1b31cc98
	setx	0x7b6cb4686079622d,%g7,%l0 ! %l0 = 7b6cb4686079622d
!	%l1 = 0000000077f6cf06
	setx	0x5fd0ce6016ebe418,%g7,%l1 ! %l1 = 5fd0ce6016ebe418
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7b6cb4686079622d
	setx	0x7e0e718fff83dbab,%g7,%l0 ! %l0 = 7e0e718fff83dbab
!	%l1 = 5fd0ce6016ebe418
	setx	0xe87cf36fdbc9de5e,%g7,%l1 ! %l1 = e87cf36fdbc9de5e
!	Mem[0000000010101408] = 00000cf9, %l6 = f8bb959684000000
	lduha	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000cf9
!	Mem[0000000021800100] = eab07eb5, %l7 = ffffffffffffffd4
	lduha	[%o3+0x100]%asi,%l7	! %l7 = 000000000000eab0
!	Mem[0000000030081400] = 4af0ffff, %l7 = 000000000000eab0
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 000000000000ffff
!	%f17 = d0a127ff, %f2  = e861f1b8
	fcmpes	%fcc0,%f17,%f2 		! %fcc0 = 2
!	Mem[0000000030001400] = f5ffffff, %l3 = 000000000000ff8e
	ldsha	[%i0+%g0]0x81,%l3	! %l3 = fffffffffffff5ff
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000006c, %l1 = e87cf36fdbc9de5e, %l2 = 000000000000006c
	udivx	%l2,%l1,%l2		! %l2 = 0000000000000000

p0_label_28:
!	Mem[0000000020800000] = 36e85b63, %l1 = e87cf36fdbc9de5e
	ldstub	[%o1+%g0],%l1		! %l1 = 00000036000000ff
!	Mem[0000000010001400] = 26d11fba, %l1 = 0000000000000036
	ldstuba	[%i0+0x000]%asi,%l1	! %l1 = 00000026000000ff
!	Mem[0000000030101408] = 84000000, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 0000000084000000
!	%f17 = d0a127ff, Mem[0000000030041400] = 686e680f
	sta	%f17,[%i1+%g0]0x89	! Mem[0000000030041400] = d0a127ff
!	Mem[0000000010141410] = 1f000000, %l1 = 0000000000000026
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l6 = 00000cf9, %l7 = 0000ffff, Mem[0000000010001410] = a13f90d4 ea70d01a
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000cf9 0000ffff
!	%l5 = 000000000000001a, Mem[00000000100c1410] = 3bef703b5405617e
	stxa	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000000000001a
!	Mem[0000000010081428] = 5403dcf823c848d7, %l5 = 000000000000001a, %l6 = 0000000000000cf9
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 5403dcf823c848d7
!	%l1 = 0000000000000000, Mem[0000000010141438] = 2860b7d7a7195457, %asi = 80
	stxa	%l1,[%i5+0x038]%asi	! Mem[0000000010141438] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffd11fba, %l6 = 5403dcf823c848d7
	lduba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff

p0_label_29:
!	Mem[0000000030101408] = 00000000, %l1 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = ffd7337e, %l4 = ffffffffffffadf3
	lduha	[%i1+0x012]%asi,%l4	! %l4 = 000000000000337e
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030041400] = ff27a1d0 89a1bcb0 1afba657 19b11335
!	Mem[0000000030041410] = 8e000000 5cb239cf 7e5da5c0 94f14874
!	Mem[0000000030041420] = d11954e5 8429aab2 c371ea9a 11acf543
!	Mem[0000000030041430] = 102c0183 61d5e96d cd3f8433 0ca4ff79
	ldda	[%i1]ASI_BLK_SL,%f0	! Block Load from 0000000030041400
!	Mem[0000000010101408] = 00000cf9, %l1 = 0000000000000000
	lduwa	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000cf9
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 7e0e718fff83dbab
	setx	0x094227378fd0b04e,%g7,%l0 ! %l0 = 094227378fd0b04e
!	%l1 = 0000000000000cf9
	setx	0x2a9ed9fffc69fc37,%g7,%l1 ! %l1 = 2a9ed9fffc69fc37
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 094227378fd0b04e
	setx	0x1bfed8a7822e8478,%g7,%l0 ! %l0 = 1bfed8a7822e8478
!	%l1 = 2a9ed9fffc69fc37
	setx	0x623049b072417d66,%g7,%l1 ! %l1 = 623049b072417d66
!	Mem[00000000100c1410] = 0000001a, %f31 = ff5bdc77
	lda	[%i3+%o5]0x88,%f31	! %f31 = 0000001a
!	Mem[00000000300c1400] = 8400000000000000, %l1 = 623049b072417d66
	ldxa	[%i3+%g0]0x81,%l1	! %l1 = 8400000000000000
!	Mem[0000000030081408] = 71ab0000, %f19 = 3dbd054c
	lda	[%i2+%o4]0x89,%f19	! %f19 = 71ab0000
!	Mem[0000000030181408] = 62e84531f80362a0, %f24 = 45ee50c7 369cb70d
	ldda	[%i6+%o4]0x89,%f24	! %f24 = 62e84531 f80362a0
!	Starting 10 instruction Store Burst
!	Mem[0000000010001420] = 0db79c36c750ee45, %l2 = 0000000084000000, %l3 = fffffffffffff5ff
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 0db79c36c750ee45

p0_label_30:
	membar	#Sync			! Added by membar checker (5)
!	%l5 = 000000000000001a, Mem[0000000030041408] = 3513b11957a6fb1a
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000000000001a
!	%l3 = 0db79c36c750ee45, Mem[0000000030081400] = fffff04a
	stwa	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = c750ee45
!	%l2 = 0000000084000000, Mem[0000000010041408] = 8d05bc84e635b7cc
	stx	%l2,[%i1+%o4]		! Mem[0000000010041408] = 0000000084000000
!	%l0 = 822e8478, %l1 = 00000000, Mem[0000000030141410] = dee81dff 7ad3ffff
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 822e8478 00000000
!	Mem[00000000300c1408] = b6366b43, %l1 = 8400000000000000
	ldstuba	[%i3+%o4]0x81,%l1	! %l1 = 000000b6000000ff
!	Mem[0000000010101400] = adf36949, %l7 = 000000000000ffff
	ldstuba	[%i4+%g0]0x88,%l7	! %l7 = 00000049000000ff
!	Mem[0000000020800000] = ffe85b63, %l5 = 000000000000001a
	ldstuba	[%o1+0x000]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010181410] = 000036e8, %l1 = 00000000000000b6
	swapa	[%i6+%o5]0x80,%l1	! %l1 = 00000000000036e8
!	%l4 = 0000337e, %l5 = 000000ff, Mem[0000000030181400] = 98d0e6b4 bb3c2ead
	stda	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000337e 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = 16743492, %l4 = 000000000000337e
	lduh	[%o3+0x0c0],%l4		! %l4 = 0000000000001674

p0_label_31:
!	Mem[0000000021800180] = 846e1c36, %l5 = 00000000000000ff
	ldsh	[%o3+0x180],%l5		! %l5 = ffffffffffff846e
!	Mem[0000000010101410] = f8bb959684000000, %f16 = 8d59ff24 d0a127ff
	ldda	[%i4+%o5]0x88,%f16	! %f16 = f8bb9596 84000000
!	Mem[0000000010181408] = f3000000, %l4 = 0000000000001674
	lduwa	[%i6+%o4]0x80,%l4	! %l4 = 00000000f3000000
!	%l7 = 0000000000000049, imm = 00000000000009c2, %l7 = 0000000000000049
	subc	%l7,0x9c2,%l7		! %l7 = fffffffffffff687
!	Mem[0000000030141400] = ff2770d4, %l4 = 00000000f3000000
	lduha	[%i5+%g0]0x81,%l4	! %l4 = 000000000000ff27
!	Mem[0000000020800040] = 735fa555, %l4 = 000000000000ff27
	lduh	[%o1+0x040],%l4		! %l4 = 000000000000735f
!	Mem[00000000300c1400] = 00000084, %l1 = 00000000000036e8
	lduba	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000084
!	Mem[0000000010081400] = 350000ff, %l3 = 0db79c36c750ee45
	ldsba	[%i2+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	%f0  = b0bca189, %f23 = b4e6d098
	fsqrts	%f0 ,%f23		! %f23 = 7fffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041406] = b8f161e8, %l2 = 0000000084000000
	ldstuba	[%i1+0x006]%asi,%l2	! %l2 = 00000061000000ff

p0_label_32:
!	%f10 = 43f5ac11 9aea71c3, Mem[0000000010001408] = 4c05bd3d b8f161e8
	stda	%f10,[%i0+%o4]0x80	! Mem[0000000010001408] = 43f5ac11 9aea71c3
!	Mem[0000000010141408] = 87a2d0a1, %l3 = ffffffffffffffff
	lduwa	[%i5+%o4]0x88,%l3	! %l3 = 0000000087a2d0a1
!	Mem[0000000010041428] = 7a8e0ff07e610554, %l1 = 0000000000000084, %l6 = 00000000000000ff
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 7a8e0ff07e610554
!	%l5 = ffffffffffff846e, Mem[0000000010181420] = dc69e2cf2e17228c
	stx	%l5,[%i6+0x020]		! Mem[0000000010181420] = ffffffffffff846e
!	%f0  = b0bca189 d0a127ff 3513b119 57a6fb1a
!	%f4  = cf39b25c 0000008e 7448f194 c0a55d7e
!	%f8  = b2aa2984 e55419d1 43f5ac11 9aea71c3
!	%f12 = 6de9d561 83012c10 79ffa40c 33843fcd
	stda	%f0,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
!	%l0 = 1bfed8a7822e8478, Mem[0000000010101408] = 00000cf9
	stba	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000c78
!	Mem[0000000010081428] = 5403dcf823c848d7, %l5 = ffffffffffff846e, %l2 = 0000000000000061
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = 5403dcf823c848d7
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010141408] = 19b11335, %l7 = fffffffffffff687
	ldstuba	[%i5+%o4]0x88,%l7	! %l7 = 00000035000000ff
!	%f4  = cf39b25c 0000008e, %l0 = 1bfed8a7822e8478
!	Mem[0000000010141408] = ff13b11957a6fb1a
	add	%i5,0x008,%g1
	stda	%f4,[%g1+%l0]ASI_PST8_P ! Mem[0000000010141408] = ff39b25c00a6fb1a
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 822e8478, %l7 = 0000000000000035
	lduba	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000078

p0_label_33:
!	Mem[0000000010081400] = ff000035, %l0 = 1bfed8a7822e8478
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = ffffffffff000035
!	Mem[0000000010001410] = 0000ffff 00000cf9, %l0 = ff000035, %l1 = 00000084
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000cf9 000000000000ffff
!	Mem[0000000010181408] = f3000000f2000000, %l5 = ffffffffffff846e
	ldxa	[%i6+%o4]0x80,%l5	! %l5 = f3000000f2000000
!	Mem[0000000030041400] = d0a127ff, %l3 = 0000000087a2d0a1
	ldsba	[%i1+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030181410] = f90c0000, %l4 = 000000000000735f
	ldsha	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l0 = 0000000000000cf9
	ldsha	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = f5ffffff, %l4 = 0000000000000000
	lduha	[%i0+%g0]0x81,%l4	! %l4 = 000000000000f5ff
!	Mem[0000000030001408] = 00003ba8, %f9  = e55419d1
	lda	[%i0+%o4]0x81,%f9 	! %f9 = 00003ba8
!	Mem[0000000010181410] = 000000b6, %l4 = 000000000000f5ff
	lduha	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 7a8e0ff07e610554, Mem[0000000030041410] = 0000008e
	stwa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 7e610554

p0_label_34:
!	%f20 = 16627be4, Mem[0000000030001408] = a83b0000
	sta	%f20,[%i0+%o4]0x89	! Mem[0000000030001408] = 16627be4
!	Mem[0000000020800041] = 735fa555, %l0 = 0000000000000000
	ldstub	[%o1+0x041],%l0		! %l0 = 0000005f000000ff
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 000000000000005f
	setx	0x765c283f945dcbf6,%g7,%l0 ! %l0 = 765c283f945dcbf6
!	%l1 = 000000000000ffff
	setx	0x042304478d167f5f,%g7,%l1 ! %l1 = 042304478d167f5f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 765c283f945dcbf6
	setx	0x6b390c9059d650ba,%g7,%l0 ! %l0 = 6b390c9059d650ba
!	%l1 = 042304478d167f5f
	setx	0x6f548cbfc10d3fb0,%g7,%l1 ! %l1 = 6f548cbfc10d3fb0
!	%f16 = f8bb9596, Mem[0000000010141410] = cf39b25c
	st	%f16,[%i5+%o5]		! Mem[0000000010141410] = f8bb9596
!	%f8  = b2aa2984 00003ba8, %l4 = 0000000000000000
!	Mem[0000000030041438] = cd3f84330ca4ff79
	add	%i1,0x038,%g1
	stda	%f8,[%g1+%l4]ASI_PST8_S ! Mem[0000000030041438] = cd3f84330ca4ff79
!	%l5 = f3000000f2000000, Mem[0000000030081408] = 0000ab71b747e508
	stxa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = f3000000f2000000
!	%l4 = 00000000, %l5 = f2000000, Mem[0000000030041410] = 7e610554 cf39b25c
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 f2000000
!	%l6 = 7a8e0ff07e610554, Mem[0000000030101408] = 00000000
	stwa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 7e610554
!	Mem[0000000010181400] = b4e6d098, %l5 = f3000000f2000000
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 00000000b4e6d098
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000c78, %l4 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000078

p0_label_35:
!	Mem[0000000030001400] = f5ffffff, %l6 = 7a8e0ff07e610554
	lduwa	[%i0+%g0]0x81,%l6	! %l6 = 00000000f5ffffff
!	Mem[0000000030141400] = ff2770d4, %f14 = 79ffa40c
	lda	[%i5+%g0]0x81,%f14	! %f14 = ff2770d4
!	Mem[0000000021800000] = c60ef55e, %l2 = 5403dcf823c848d7
	ldsh	[%o3+%g0],%l2		! %l2 = ffffffffffffc60e
!	Mem[0000000030041400] = ff27a1d0, %f28 = 71ab8c1e
	lda	[%i1+%g0]0x81,%f28	! %f28 = ff27a1d0
!	Mem[0000000030081400] = c750ee45, %l5 = 00000000b4e6d098
	lduwa	[%i2+%g0]0x81,%l5	! %l5 = 00000000c750ee45
!	Mem[0000000030101400] = adf3ec9d, %l6 = 00000000f5ffffff
	lduha	[%i4+%g0]0x81,%l6	! %l6 = 000000000000adf3
!	Mem[0000000030081410] = d4903fa1 9fdf938e, %l0 = 59d650ba, %l1 = c10d3fb0
	ldda	[%i2+%o5]0x81,%l0	! %l0 = 00000000d4903fa1 000000009fdf938e
!	Mem[0000000030101408] = 5405617e, %l2 = ffffffffffffc60e
	ldsha	[%i4+%o4]0x81,%l2	! %l2 = 0000000000005405
!	Mem[0000000030001408] = e47b6216fc1eb538, %l6 = 000000000000adf3
	ldxa	[%i0+%o4]0x81,%l6	! %l6 = e47b6216fc1eb538
!	Starting 10 instruction Store Burst
!	Mem[0000000010181430] = 72e701c0, %l7 = 0000000000000078, %asi = 80
	swapa	[%i6+0x030]%asi,%l7	! %l7 = 0000000072e701c0

p0_label_36:
!	%l5 = 00000000c750ee45, Mem[00000000300c1410] = 0cf9088e
	stwa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = c750ee45
!	Mem[0000000010041418] = 8d59ff24, %l2 = 0000000000005405, %asi = 80
	swapa	[%i1+0x018]%asi,%l2	! %l2 = 000000008d59ff24
!	%l6 = fc1eb538, %l7 = 72e701c0, Mem[0000000030141410] = 822e8478 00000000
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = fc1eb538 72e701c0
!	%f30 = 98d0e6b4, Mem[0000000010041410] = 7e33d7ff
	sta	%f30,[%i1+%o5]0x88	! Mem[0000000010041410] = 98d0e6b4
!	%l5 = 00000000c750ee45, Mem[0000000010101428] = 3121a4ea9cc3788a, %asi = 80
	stxa	%l5,[%i4+0x028]%asi	! Mem[0000000010101428] = 00000000c750ee45
!	Mem[0000000010141400] = 89a1bcb0, %l4 = 0000000000000078
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 000000b0000000ff
!	Mem[0000000010101410] = 00000084, %l3 = ffffffffffffffff
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000084
!	%l4 = 000000b0, %l5 = c750ee45, Mem[0000000030101400] = adf3ec9d 41770ad0
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000b0 c750ee45
!	%f25 = f80362a0, %f0  = b0bca189, %f16 = f8bb9596
	fadds	%f25,%f0 ,%f16		! %f16 = f80362a0
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 5405617e45ee50c7, %f22 = 57a6fb1a 7fffffff
	ldda	[%i2+%g0]0x89,%f22	! %f22 = 5405617e 45ee50c7

p0_label_37:
!	Mem[00000000100c1408] = 53c2f2e60cf14ef3, %l5 = 00000000c750ee45
	ldxa	[%i3+%o4]0x88,%l5	! %l5 = 53c2f2e60cf14ef3
!	Mem[0000000030141400] = 81715962d47027ff, %f28 = ff27a1d0 62597181
	ldda	[%i5+%g0]0x89,%f28	! %f28 = 81715962 d47027ff
!	%l0 = 00000000d4903fa1, imm = fffffffffffff7c4, %l2 = 000000008d59ff24
	andn	%l0,-0x83c,%l2		! %l2 = 0000000000000821
!	Mem[0000000020800040] = 73ffa555, %l7 = 0000000072e701c0
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = 00000000000073ff
!	Mem[0000000010181410] = 000000b6ff269c42, %f28 = 81715962 d47027ff
	ldda	[%i6+%o5]0x80,%f28	! %f28 = 000000b6 ff269c42
!	Mem[0000000030001400] = f5ffffff, %l4 = 00000000000000b0
	ldsha	[%i0+%g0]0x81,%l4	! %l4 = fffffffffffff5ff
!	Mem[0000000010181408] = f3000000 f2000000, %l0 = d4903fa1, %l1 = 9fdf938e
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 00000000f3000000 00000000f2000000
!	Mem[0000000010181400] = f2000000 62597181, %l0 = f3000000, %l1 = f2000000
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000f2000000 0000000062597181
!	Mem[0000000010001400] = ffd11fba, %l3 = 0000000000000084
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_11:
!	%l0 = 00000000f2000000
	setx	0x6997be4fb9c46d8c,%g7,%l0 ! %l0 = 6997be4fb9c46d8c
!	%l1 = 0000000062597181
	setx	0x04c46cd00f266cab,%g7,%l1 ! %l1 = 04c46cd00f266cab
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6997be4fb9c46d8c
	setx	0x19448be844217972,%g7,%l0 ! %l0 = 19448be844217972
!	%l1 = 04c46cd00f266cab
	setx	0xab01fd6f9cb32af7,%g7,%l1 ! %l1 = ab01fd6f9cb32af7

p0_label_38:
!	Mem[0000000030101410] = ff57e578, %l0 = 19448be844217972
	ldstuba	[%i4+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%l4 = fffff5ff, %l5 = 0cf14ef3, Mem[0000000030041410] = 00000000 f2000000
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = fffff5ff 0cf14ef3
!	%f24 = 62e84531, %f10 = 43f5ac11
	fcmps	%fcc3,%f24,%f10		! %fcc3 = 2
!	Mem[0000000010041410] = b4e6d098, %l1 = 9cb32af7, %l4 = fffff5ff
	add	%i1,0x10,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000b4e6d098
!	%l0 = 00000000000000ff, Mem[000000001010140e] = 0fbf9ea6
	sth	%l0,[%i4+0x00e]		! Mem[000000001010140c] = 0fbf00ff
!	%l1 = ab01fd6f9cb32af7, Mem[0000000010081408] = b4e6d098
	stba	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = b4e6d0f7
!	Mem[0000000010141410] = f8bb9596, %l3 = 00000000000000ff
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 000000f8000000ff
!	%l6 = e47b6216fc1eb538, Mem[0000000030041400] = d0a127ff
	stwa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = fc1eb538
!	%l7 = 00000000000073ff, Mem[0000000020800040] = 73ffa555, %asi = 80
	stha	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = 73ffa555
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = b4e6d09828e63c7e, %f30 = 98d0e6b4 0000001a
	ldda	[%i1+%o5]0x80,%f30	! %f30 = b4e6d098 28e63c7e

p0_label_39:
!	%l3 = 00000000000000f8, %l0 = 00000000000000ff, %l5 = 53c2f2e60cf14ef3
	xor	%l3,%l0,%l5		! %l5 = 0000000000000007
!	Mem[0000000010041408] = 00000000 84000000, %l6 = fc1eb538, %l7 = 000073ff
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000084000000
!	Mem[0000000020800040] = 73ffa555, %l5 = 0000000000000007
	ldub	[%o1+0x040],%l5		! %l5 = 0000000000000073
!	Mem[00000000100c1408] = 53c2f2e6 0cf14ef3, %l4 = b4e6d098, %l5 = 00000073
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 000000000cf14ef3 0000000053c2f2e6
!	Mem[0000000010181414] = ff269c42, %f18 = e861f1b8
	ld	[%i6+0x014],%f18	! %f18 = ff269c42
!	Mem[0000000010081428] = 5403dcf823c848d7, %l1 = ab01fd6f9cb32af7
	ldxa	[%i2+0x028]%asi,%l1	! %l1 = 5403dcf823c848d7
!	Mem[0000000010041408] = 00000000, %l4 = 000000000cf14ef3
	ldsba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = ff000035, %l6 = 0000000000000000
	lduha	[%i2+0x002]%asi,%l6	! %l6 = 0000000000000035
!	Mem[0000000010101410] = ffffffff, %l4 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 84000000, %l5 = 0000000053c2f2e6
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000084000000ff

p0_label_40:
!	%f30 = b4e6d098 28e63c7e, Mem[0000000010001410] = f90c0000 ffff0000
	stda	%f30,[%i0+%o5]0x80	! Mem[0000000010001410] = b4e6d098 28e63c7e
!	Mem[0000000020800001] = ffe85b63, %l6 = 0000000000000035
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 000000e8000000ff
!	%l4 = 00000000000000ff, Mem[0000000010101413] = ffffffff, %asi = 80
	stba	%l4,[%i4+0x013]%asi	! Mem[0000000010101410] = ffffffff
!	%f14 = ff2770d4 33843fcd, %l7 = 0000000084000000
!	Mem[0000000010181420] = ffffffffffff846e
	add	%i6,0x020,%g1
	stda	%f14,[%g1+%l7]ASI_PST16_P ! Mem[0000000010181420] = ffffffffffff846e
!	Mem[0000000020800001] = ffff5b63, %l5 = 0000000000000084
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[00000000100c1400] = ff277098 16627be4
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff 000000ff
!	%l1 = 5403dcf823c848d7, immed = fffff1e9, %y  = 02e38ad8
	sdiv	%l1,-0xe17,%l4		! %l4 = ffffffff80000000
	mov	%l0,%y			! %y = 000000ff
!	%l6 = 00000000000000e8, Mem[0000000010001428] = 4764337e, %asi = 80
	stwa	%l6,[%i0+0x028]%asi	! Mem[0000000010001428] = 000000e8
!	%l2 = 0000000000000821, Mem[0000000030081408] = f3000000
	stba	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 21000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041438] = 8ae1e2be 7b3c982e, %l0 = 000000ff, %l1 = 23c848d7
	ldda	[%i1+0x038]%asi,%l0	! %l0 = 000000008ae1e2be 000000007b3c982e

p0_label_41:
!	Mem[0000000010181410] = 000000b6ff269c42, %f28 = 000000b6 ff269c42
	ldda	[%i6+0x010]%asi,%f28	! %f28 = 000000b6 ff269c42
!	Mem[0000000010141400] = ffbca189, %l2 = 0000000000000821
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1410] = 0000001a, %l7 = 0000000084000000
	ldsba	[%i3+%o5]0x88,%l7	! %l7 = 000000000000001a
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010041400] = 2007b7ba b8f1ffe8 00000000 84000000
!	Mem[0000000010041410] = b4e6d098 28e63c7e 00005405 8bf2c6ff
!	Mem[0000000010041420] = b6366b43 84bc058d 7a8e0ff0 7e610554
!	Mem[0000000010041430] = 16627be4 ff2770d4 8ae1e2be 7b3c982e
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	%l2 = ffffffffffffffff, Mem[00000000100c1410] = 0000001a
	stha	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000ffff
!	Mem[0000000030141410] = 38b51efc, %l1 = 000000007b3c982e
	lduba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000038
!	%l7 = 000000000000001a, immed = 00000835, %y  = 000000ff
	smul	%l7,0x835,%l6		! %l6 = 000000000000d562, %y = 00000000
!	Mem[00000000300c1408] = ff366b4341770a1b, %f26 = 08e547b7 71ab8c1e
	ldda	[%i3+%o4]0x81,%f26	! %f26 = ff366b43 41770a1b
!	Mem[00000000100c1430] = af520c69ff1de8de, %f26 = ff366b43 41770a1b
	ldda	[%i3+0x030]%asi,%f26	! %f26 = af520c69 ff1de8de
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000f8, Mem[00000000300c1410] = 45ee50c7
	stba	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = f8ee50c7

p0_label_42:
!	%l3 = 00000000000000f8, Mem[0000000010181438] = 4cbd48a2caf4af8c, %asi = 80
	stxa	%l3,[%i6+0x038]%asi	! Mem[0000000010181438] = 00000000000000f8
!	Mem[0000000021800101] = eab07eb5, %l2 = ffffffffffffffff
	ldstuba	[%o3+0x101]%asi,%l2	! %l2 = 000000b0000000ff
!	%l6 = 000000000000d562, immed = fffff636, %y  = 00000000
	umul	%l6,-0x9ca,%l2		! %l2 = 0000d561f7d72eac, %y = 0000d561
!	%f24 = 62e84531 f80362a0, %l2 = 0000d561f7d72eac
!	Mem[0000000010181420] = ffffffffffff846e
	add	%i6,0x020,%g1
	stda	%f24,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010181420] = ffffffffffff846e
!	Mem[0000000020800040] = 73ffa555, %l0 = 000000008ae1e2be
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 00000073000000ff
!	Mem[0000000030001408] = 16627be4, %l0 = 0000000000000073
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 000000e4000000ff
	membar	#Sync			! Added by membar checker (8)
!	%l0 = 00000000000000e4, Mem[0000000010041400] = bab70720
	stwa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000e4
!	%f28 = 000000b6 ff269c42, %l4 = ffffffff80000000
!	Mem[0000000030141438] = a63ebc79565da1a3
	add	%i5,0x038,%g1
	stda	%f28,[%g1+%l4]ASI_PST8_S ! Mem[0000000030141438] = a63ebc79565da1a3
!	Mem[0000000010101410] = ffffffff, %l5 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff8e4b99, %l7 = 000000000000001a
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffff8e

p0_label_43:
!	Mem[0000000010081410] = 00008400, %l7 = ffffffffffffff8e
	lduba	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 00008400, %f18 = ff269c42
	lda	[%i2+%o5]0x88,%f18	! %f18 = 00008400
!	%f1  = b8f1ffe8, %f31 = 28e63c7e
	fsqrts	%f1 ,%f31		! %f31 = 7fffffff
!	Mem[0000000030181408] = a06203f8 3145e862, %l2 = f7d72eac, %l3 = 000000f8
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 00000000a06203f8 000000003145e862
!	Mem[0000000010101418] = 1bf4f8dc053b7086, %f28 = 000000b6 ff269c42
	ldd	[%i4+0x018],%f28	! %f28 = 1bf4f8dc 053b7086
!	Mem[0000000030101408] = f8bb95967e610554, %l3 = 000000003145e862
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = f8bb95967e610554
!	Mem[0000000010101400] = ff69f3adff5bdc77, %f4  = b4e6d098 28e63c7e
	ldda	[%i4+0x000]%asi,%f4 	! %f4  = ff69f3ad ff5bdc77
!	Mem[0000000010041410] = 7e3ce62898d0e6b4, %f6  = 00005405 8bf2c6ff
	ldda	[%i1+%o5]0x88,%f6 	! %f6  = 7e3ce628 98d0e6b4
!	Mem[0000000010181400] = 000000f2, %l7 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000f2
!	Starting 10 instruction Store Burst
!	%f2  = 00000000 84000000, Mem[0000000030041408] = 0000001a 00000000
	stda	%f2 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 84000000

p0_label_44:
!	%f13 = ff2770d4, Mem[0000000010041400] = e4000000
	sta	%f13,[%i1+%g0]0x80	! Mem[0000000010041400] = ff2770d4
!	%l7 = 00000000000000f2, Mem[00000000100c1408] = 0cf14ef3
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0cf14ef2
!	Mem[0000000030041408] = 84000000, %l4 = ffffffff80000000
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 0000000084000000
!	%l2 = a06203f8, %l3 = 7e610554, Mem[0000000010141410] = 9695bbff 8e000000
	stda	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = a06203f8 7e610554
!	%l3 = f8bb95967e610554, Mem[0000000010141410] = 7e610554a06203f8
	stxa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = f8bb95967e610554
!	Mem[00000000300c1408] = ff366b43, %l1 = 0000000000000038
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = ffffffffffffff36
!	%l0 = 000000e4, %l1 = ffffff36, Mem[00000000300c1410] = c750eef8 44b55a89
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000e4 ffffff36
!	%l4 = 0000000084000000, Mem[0000000010001400] = a06273abba1fd1ff
	stxa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000084000000
!	%f26 = af520c69, Mem[00000000100c1430] = af520c69
	st	%f26,[%i3+0x030]	! Mem[00000000100c1430] = af520c69
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 38b51efc 16627bff, %l2 = a06203f8, %l3 = 7e610554
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 0000000016627bff 0000000038b51efc

p0_label_45:
!	%l1 = ffffffffffffff36, %l3 = 0000000038b51efc, %l7 = 00000000000000f2
	subc	%l1,%l3,%l7		! %l7 = ffffffffc74ae03a
!	Mem[0000000030141400] = 81715962d47027ff, %f26 = af520c69 ff1de8de
	ldda	[%i5+%g0]0x89,%f26	! %f26 = 81715962 d47027ff
!	Mem[0000000010001408] = 43f5ac119aea71c3, %l4 = 0000000084000000
	ldx	[%i0+%o4],%l4		! %l4 = 43f5ac119aea71c3
!	Mem[0000000030081400] = 5405617e 45ee50c7, %l4 = 9aea71c3, %l5 = 000000ff
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 0000000045ee50c7 000000005405617e
!	Mem[0000000030001410] = f04a8e7a, %f31 = 7fffffff
	lda	[%i0+%o5]0x81,%f31	! %f31 = f04a8e7a
!	Mem[0000000010081430] = 67138f59, %l0 = 00000000000000e4
	ldsba	[%i2+0x033]%asi,%l0	! %l0 = 0000000000000059
!	Mem[0000000030141410] = 38b51efcc001e772, %l2 = 0000000016627bff
	ldxa	[%i5+%o5]0x81,%l2	! %l2 = 38b51efcc001e772
!	Mem[0000000010001400] = 00000000 84000000, %l0 = 00000059, %l1 = ffffff36
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 0000000084000000 0000000000000000
!	Mem[0000000010001410] = b4e6d09828e63c7e, %l0 = 0000000084000000
	ldx	[%i0+%o5],%l0		! %l0 = b4e6d09828e63c7e
!	Starting 10 instruction Store Burst
!	%f30 = b4e6d098 f04a8e7a, %l1 = 0000000000000000
!	Mem[0000000030001420] = 5d28c91a5a6b513c
	add	%i0,0x020,%g1
	stda	%f30,[%g1+%l1]ASI_PST16_S ! Mem[0000000030001420] = 5d28c91a5a6b513c

p0_label_46:
!	%f24 = 62e84531, Mem[0000000030041410] = fff5ffff
	sta	%f24,[%i1+%o5]0x81	! Mem[0000000030041410] = 62e84531
!	%l7 = ffffffffc74ae03a, Mem[0000000030081400] = 45ee50c7
	stha	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 45eee03a
!	Mem[000000001018142e] = 5c068e76, %l4 = 0000000045ee50c7
	ldstub	[%i6+0x02e],%l4		! %l4 = 0000008e000000ff
!	%f13 = ff2770d4, Mem[0000000010101420] = fac9938e
	st	%f13,[%i4+0x020]	! Mem[0000000010101420] = ff2770d4
!	%f10 = 7a8e0ff0, %f31 = f04a8e7a, %f24 = 62e84531 f80362a0
	fsmuld	%f10,%f31,%f24		! %f24 = cd6c19e8 faae1800
!	%f24 = cd6c19e8 faae1800, %l4 = 000000000000008e
!	Mem[0000000030181408] = a06203f83145e862
	add	%i6,0x008,%g1
	stda	%f24,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030181408] = a062aefae8196ccd
!	Mem[00000000300c1410] = e4000000, %l3 = 0000000038b51efc
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 00000000e4000000
!	Mem[0000000010041434] = ff2770d4, %l0 = b4e6d09828e63c7e
	ldsb	[%i1+0x037],%l0		! %l0 = ffffffffffffffd4
!	Mem[00000000300c1408] = ff366b43, %l0 = ffffffffffffffd4
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = f24ef10c e6f2c253, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 00000000f24ef10c 00000000e6f2c253

p0_label_47:
!	Mem[0000000030181410] = 00000cf9, %l3 = 00000000e4000000
	ldswa	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000cf9
!	Mem[0000000030001410] = f04a8e7a, %l2 = 38b51efcc001e772
	lduha	[%i0+%o5]0x81,%l2	! %l2 = 000000000000f04a
!	Mem[0000000030141408] = 00000000, %l1 = 00000000e6f2c253
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = fc1eb538, %l3 = 0000000000000cf9
	lduha	[%i5+%o5]0x89,%l3	! %l3 = 000000000000b538
!	Mem[0000000010101414] = 9695bbf8, %f1  = b8f1ffe8
	ld	[%i4+0x014],%f1 	! %f1 = 9695bbf8
!	Mem[0000000030181410] = f90c0000, %l0 = 00000000f24ef10c
	ldswa	[%i6+%o5]0x89,%l0	! %l0 = fffffffff90c0000
!	Mem[0000000030101400] = 000000b0c750ee45, %l0 = fffffffff90c0000
	ldxa	[%i4+%g0]0x81,%l0	! %l0 = 000000b0c750ee45
!	Mem[0000000010101400] = adf369ff, %f26 = 81715962
	lda	[%i4+%g0]0x88,%f26	! %f26 = adf369ff
!	Mem[0000000010141400] = ffbca189, %l4 = 000000000000008e
	ldswa	[%i5+%g0]0x80,%l4	! %l4 = ffffffffffbca189
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 00000cf9, %l6 = 000000000000d562
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 00000000000000ff

p0_label_48:
!	Mem[0000000010001400] = 84000000, %l4 = ffffffffffbca189
	ldstuba	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030181408] = faae62a0
	stwa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010041400] = d47027ff
	stwa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010001400] = ff00008400000000, %asi = 80
	stxa	%l1,[%i0+0x000]%asi	! Mem[0000000010001400] = 0000000000000000
!	%l2 = 000000000000f04a, Mem[0000000010181400] = f200000062597181
	stxa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000000000f04a
!	Mem[0000000030001400] = fffffff5, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 00000000fffffff5
!	%f20 = 16627be4 ff2770d4, %l5 = 000000005405617e
!	Mem[0000000030041438] = cd3f84330ca4ff79
	add	%i1,0x038,%g1
	stda	%f20,[%g1+%l5]ASI_PST32_S ! Mem[0000000030041438] = 16627be40ca4ff79
!	%l7 = ffffffffc74ae03a, Mem[0000000010101432] = 9504cf24
	sth	%l7,[%i4+0x032]		! Mem[0000000010101430] = 9504e03a
!	%l4 = 00000000, %l5 = 5405617e, Mem[0000000010181420] = ffffffff ffff846e
	stda	%l4,[%i6+0x020]%asi	! Mem[0000000010181420] = 00000000 5405617e
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (9)
!	Mem[00000000100c1400] = ff000000 ff000000 f24ef10c e6f2c253
!	Mem[00000000100c1410] = ffff0000 00000000 8d59ff24 0923f7ad
!	Mem[00000000100c1420] = 000070d4 84bc058d 7a8efff0 7e610554
!	Mem[00000000100c1430] = af520c69 ff1de8de 8ae1e2be 7b3c982e
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400

p0_label_49:
!	Mem[00000000100c141c] = 0923f7ad, %l0 = 000000b0c750ee45
	lduh	[%i3+0x01e],%l0		! %l0 = 000000000000f7ad
!	%l4 = 0000000000000000, imm = fffffffffffff773, %l5 = 000000005405617e
	sub	%l4,-0x88d,%l5		! %l5 = 000000000000088d
!	Mem[0000000010041400] = 00000000, %l0 = 000000000000f7ad
	ldsha	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 00000000 e47b6216, %l6 = fffffff5, %l7 = c74ae03a
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000 00000000e47b6216
!	Mem[0000000030101410] = ff57e578, %l4 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l4	! %l4 = 00000000ff57e578
!	Mem[0000000030041400] = fc1eb538, %l0 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l0	! %l0 = ffffffffffffb538
!	Mem[0000000030141400] = d47027ff, %l4 = 00000000ff57e578
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081434] = fbee4764, %l7 = 00000000e47b6216
	lduw	[%i2+0x034],%l7		! %l7 = 00000000fbee4764
!	Mem[0000000030141400] = 81715962 d47027ff, %l6 = 00000000, %l7 = fbee4764
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 00000000d47027ff 0000000081715962
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030041408] = 00000080
	stba	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000080

p0_label_50:
!	Mem[00000000201c0000] = 1388eaae, %l5 = 000000000000088d
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000013000000ff
!	%l2 = 000000000000f04a, Mem[0000000010041400] = 00000000
	stba	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000004a
!	Mem[0000000010141410] = 5405617e, %l5 = 00000013, %l0 = ffffb538
	add	%i5,0x10,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 000000005405617e
!	%l6 = 00000000d47027ff, %l1 = 0000000000000000, %l0  = 000000005405617e
	mulx	%l6,%l1,%l0		! %l0 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l2 = 000000000000f04a, Mem[0000000010081400] = 350000ff
	stba	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 3500004a
!	%l0 = 0000000000000000, Mem[0000000010081412] = 00840000
	stb	%l0,[%i2+0x012]		! Mem[0000000010081410] = 00840000
!	Mem[00000000211c0000] = ff8e4b99, %l6 = 00000000d47027ff
	ldsb	[%o2+0x001],%l6		! %l6 = ffffffffffffff8e
!	Mem[0000000010041428] = 7a8e0ff0, %l2 = 000000000000f04a
	swap	[%i1+0x028],%l2		! %l2 = 000000007a8e0ff0
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = b4e6d098, %l5 = 0000000000000013
	ldswa	[%i0+%o5]0x80,%l5	! %l5 = ffffffffb4e6d098

p0_label_51:
!	Mem[00000000100c1410] = 000000000000ffff, %f30 = b4e6d098 f04a8e7a
	ldda	[%i3+%o5]0x88,%f30	! %f30 = 00000000 0000ffff
!	Mem[0000000010081410] = f003eb30 00008400, %l2 = 7a8e0ff0, %l3 = 0000b538
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 0000000000008400 00000000f003eb30
!	%f18 = 00008400, %f20 = 16627be4, %f30 = 00000000 0000ffff
	fsmuld	%f18,%f20,%f30		! %l0 = 0000000000000022, Unfinished, %fsr = 2100000800
!	Mem[0000000030101410] = ff57e578, %l7 = 0000000081715962
	lduha	[%i4+%o5]0x81,%l7	! %l7 = 000000000000ff57
!	%l3 = 00000000f003eb30, immed = fffff8c6, %y  = 0000d561
	sdiv	%l3,-0x73a,%l4		! %l4 = ffffffff80000000
	mov	%l0,%y			! %y = 00000022
!	Mem[000000001000141c] = 1afba657, %l5 = ffffffffb4e6d098
	lduwa	[%i0+0x01c]%asi,%l5	! %l5 = 000000001afba657
!	Mem[0000000010041408] = 00000000, %l6 = ffffffffffffff8e
	lduwa	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = b4e6d09828e63c7e, %l2 = 0000000000008400
	ldxa	[%i1+%o5]0x80,%l2	! %l2 = b4e6d09828e63c7e
!	Mem[00000000100c1430] = af520c69, %l6 = 0000000000000000
	ldsb	[%i3+0x032],%l6		! %l6 = 000000000000000c
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = ff69f3ad, %l5 = 000000001afba657
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 00000000ff69f3ad

p0_label_52:
!	%f20 = 16627be4 ff2770d4, %l2 = b4e6d09828e63c7e
!	Mem[0000000030001418] = 17a1a276822190d7
	add	%i0,0x018,%g1
	stda	%f20,[%g1+%l2]ASI_PST8_S ! Mem[0000000030001418] = 17627be4ff2770d7
!	Mem[0000000030101410] = ff57e578, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l7 = 000000000000ff57, Mem[0000000030081400] = 3ae0ee45
	stba	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 57e0ee45
!	%l6 = 0000000c, %l7 = 0000ff57, Mem[0000000030141408] = 00000000 1afba657
	stda	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000c 0000ff57
!	%l2 = 28e63c7e, %l3 = f003eb30, Mem[0000000010141438] = 79ffa40c 33843fcd
	std	%l2,[%i5+0x038]		! Mem[0000000010141438] = 28e63c7e f003eb30
!	%l6 = 000000000000000c, Mem[0000000010181410] = 000000b6
	stba	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 0c0000b6
!	Mem[0000000020800001] = ffff5b63, %l3 = 00000000f003eb30
	ldstuba	[%o1+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030041400] = fc1eb538, %l1 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l1	! %l1 = 00000038000000ff
!	Mem[0000000030041408] = 80000000, %l3 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = f7d0e6b41afba657, %l4 = ffffffff80000000
	ldxa	[%i2+%o4]0x80,%l4	! %l4 = f7d0e6b41afba657

p0_label_53:
!	Mem[0000000030081408] = 21000000, %f19 = 71ab0000
	lda	[%i2+%o4]0x81,%f19	! %f19 = 21000000
!	Mem[00000000300c1410] = ffffff36 fc1eb538, %l0 = 00000022, %l1 = 00000038
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 00000000fc1eb538 00000000ffffff36
!	Mem[0000000030141400] = d47027ff, %l7 = 000000000000ff57
	lduha	[%i5+%g0]0x89,%l7	! %l7 = 00000000000027ff
!	Mem[00000000300c1408] = ff366b4341770a1b, %f10 = 7a8efff0 7e610554
	ldda	[%i3+%o4]0x81,%f10	! %f10 = ff366b43 41770a1b
!	Mem[0000000030041400] = fc1eb5ff, %l6 = 000000000000000c
	ldsha	[%i1+%g0]0x89,%l6	! %l6 = ffffffffffffb5ff
!	Mem[0000000010141410] = 7e610554, %l0 = 00000000fc1eb538
	lduwa	[%i5+%o5]0x88,%l0	! %l0 = 000000007e610554
!	Mem[0000000030141410] = 38b51efc c001e772, %l2 = 28e63c7e, %l3 = 00000000
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 0000000038b51efc 00000000c001e772
!	Mem[0000000010041408] = 00000000, %l0 = 000000007e610554
	ldsha	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = 436b36ff, %l5 = 00000000ff69f3ad
	ldswa	[%i3+%o4]0x89,%l5	! %l5 = 00000000436b36ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 000000ff, %l3 = 00000000c001e772
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000ff

p0_label_54:
	membar	#Sync			! Added by membar checker (10)
!	%f12 = af520c69, Mem[00000000100c1400] = c001e772
	sta	%f12,[%i3+%g0]0x88	! Mem[00000000100c1400] = af520c69
!	Mem[0000000030001400] = 00000000, %l4 = f7d0e6b41afba657
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000010141400] = ffbca189, %asi = 80
	stwa	%l3,[%i5+0x000]%asi	! Mem[0000000010141400] = 000000ff
!	Mem[0000000010001400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041400] = fc1eb5ff, %l6 = ffffffffffffb5ff
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010181408] = f3000000, %l6 = 00000000000000ff
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000f3000000
!	%l5 = 00000000436b36ff, Mem[0000000010101400] = 57a6fb1a
	stha	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 57a636ff
!	%l0 = 00000000, %l1 = ffffff36, Mem[0000000010081408] = f7d0e6b4 1afba657
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 ffffff36
!	%l3 = 00000000000000ff, Mem[0000000010081410] = 00840000
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 7e3ce62898d0e6b4, %l6 = 00000000f3000000
	ldxa	[%i0+%o5]0x88,%l6	! %l6 = 7e3ce62898d0e6b4

p0_label_55:
!	Mem[0000000030101408] = f8bb9596 7e610554, %l0 = 00000000, %l1 = ffffff36
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 000000007e610554 00000000f8bb9596
!	Mem[0000000010141438] = 28e63c7e, %l7 = 00000000000027ff
	ldsb	[%i5+0x03b],%l7		! %l7 = 000000000000007e
!	Mem[0000000010081400] = 4a000035695fe48a, %f14 = 8ae1e2be 7b3c982e
	ldda	[%i2+0x000]%asi,%f14	! %f14 = 4a000035 695fe48a
!	Mem[0000000010081400] = 4a000035, %l7 = 000000000000007e
	lduwa	[%i2+%g0]0x80,%l7	! %l7 = 000000004a000035
!	Mem[0000000010101408] = 00000c78, %l4 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000078
!	%l5 = 00000000436b36ff, imm = 0000000000000f2a, %l1 = 00000000f8bb9596
	add	%l5,0xf2a,%l1		! %l1 = 00000000436b4629
!	Mem[0000000030181408] = 00000000, %l4 = 0000000000000078
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1430] = af520c69ff1de8de, %f2  = f24ef10c e6f2c253
	ldda	[%i3+0x030]%asi,%f2 	! %f2  = af520c69 ff1de8de
!	Mem[00000000300c1400] = ff000000, %f14 = 4a000035
	lda	[%i3+%g0]0x81,%f14	! %f14 = ff000000
!	Starting 10 instruction Store Burst
!	%f28 = 1bf4f8dc, Mem[00000000300c1410] = fc1eb538
	sta	%f28,[%i3+%o5]0x89	! Mem[00000000300c1410] = 1bf4f8dc

p0_label_56:
!	Mem[0000000010041408] = 00000000, %l7 = 000000004a000035
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%l2 = 38b51efc, %l3 = 000000ff, Mem[0000000010101410] = ffffffff f8bb9596
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 38b51efc 000000ff
!	%l7 = 0000000000000000, Mem[0000000030181408] = 00000000
	stwa	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%l2 = 38b51efc, %l3 = 000000ff, Mem[0000000030101408] = 7e610554 f8bb9596
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 38b51efc 000000ff
!	Mem[0000000010141408] = 5cb239ff, %l0 = 000000007e610554
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 000000005cb239ff
!	Mem[00000000300c1410] = dcf8f41b, %l4 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 00000000dcf8f41b
!	Mem[00000000300c1408] = ff366b43, %l3 = 00000000000000ff
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	%f0  = ff000000 ff000000 af520c69 ff1de8de
!	%f4  = ffff0000 00000000 8d59ff24 0923f7ad
!	%f8  = 000070d4 84bc058d ff366b43 41770a1b
!	%f12 = af520c69 ff1de8de ff000000 695fe48a
	stda	%f0,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	%l7 = 0000000000000000, Mem[00000000100c1408] = 53c2f2e60cf14ef2
	stxa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	%l3 = 00000000000000ff, %l2 = 0000000038b51efc, %y  = 00000022
	sdiv	%l3,%l2,%l5		! %l5 = 0000000000000099
	mov	%l0,%y			! %y = 5cb239ff

p0_label_57:
!	Mem[0000000030041408] = ff000080 00000000, %l6 = 98d0e6b4, %l7 = 00000000
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 00000000ff000080 0000000000000000
!	Mem[0000000010081408] = 00000000, %l1 = 00000000436b4629
	lduba	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ff8e4b99, %l3 = 00000000000000ff
	ldsba	[%o2+0x001]%asi,%l3	! %l3 = ffffffffffffff8e
!	Mem[0000000030001410] = 98d0e6b47a8e4af0, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = 98d0e6b47a8e4af0
!	Mem[0000000010181420] = 000000005405617e, %f22 = 5405617e 45ee50c7
	ldd	[%i6+0x020],%f22	! %f22 = 00000000 5405617e
!	Mem[0000000010081408] = 00000000, %f20 = 16627be4
	lda	[%i2+%o4]0x88,%f20	! %f20 = 00000000
!	Mem[0000000030041408] = ff000080, %l5 = 0000000000000099
	lduha	[%i1+%o4]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030141408] = 0000000c0000ff57, %f16 = f80362a0 84000000
	ldda	[%i5+%o4]0x81,%f16	! %f16 = 0000000c 0000ff57
!	Mem[0000000010141410] = 5405617e 9695bbf8, %l0 = 5cb239ff, %l1 = 7a8e4af0
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 000000005405617e 000000009695bbf8
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010001410] = 000000000000ffff, %l5 = 000000000000ff00, %l5 = 000000000000ff00
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = 000000000000ffff

p0_label_58:
!	%f24 = cd6c19e8 faae1800, %l4 = 00000000dcf8f41b
!	Mem[0000000010101400] = ff36a657ff5bdc77
	stda	%f24,[%i4+%l4]ASI_PST16_PL ! Mem[0000000010101400] = 0018aefaff5b6ccd
!	%l0 = 000000005405617e, Mem[0000000010081410] = 000000ff
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 617e00ff
!	%l5 = 000000000000ffff, Mem[00000000201c0001] = ff88eaae
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = ffffeaae
!	Mem[0000000030041400] = fc1eb5ff, %l3 = ffffffffffffff8e
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%l5 = 000000000000ffff, Mem[0000000010141410] = 5405617e9695bbf8, %asi = 80
	stxa	%l5,[%i5+0x010]%asi	! Mem[0000000010141410] = 000000000000ffff
!	Mem[0000000030141400] = ff2770d4, %l4 = 00000000dcf8f41b
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 00000000ff2770d4
!	%f28 = 1bf4f8dc 053b7086, %l2 = 0000000038b51efc
!	Mem[0000000010141430] = 6de9d56183012c10
	add	%i5,0x030,%g1
	stda	%f28,[%g1+%l2]ASI_PST8_P ! Mem[0000000010141430] = 1bf4f8dc053b2c10
!	%f14 = ff000000 695fe48a, %l7 = 0000000000000000
!	Mem[0000000010101418] = 1bf4f8dc053b7086
	add	%i4,0x018,%g1
	stda	%f14,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010101418] = 1bf4f8dc053b7086
!	Mem[0000000020800000] = ffff5b63, %l4 = 00000000ff2770d4
	ldstuba	[%o1+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001414] = 0000ffff, %l5 = 000000000000ffff
	ldsw	[%i0+0x014],%l5		! %l5 = 000000000000ffff

p0_label_59:
!	Mem[00000000100c1428] = 7a8efff07e610554, %f28 = 1bf4f8dc 053b7086
	ldda	[%i3+0x028]%asi,%f28	! %f28 = 7a8efff0 7e610554
!	Mem[0000000030001410] = 7a8e4af0, %l1 = 000000009695bbf8
	ldswa	[%i0+%o5]0x89,%l1	! %l1 = 000000007a8e4af0
!	Mem[00000000100c1400] = 690c52afff000000, %l5 = 000000000000ffff
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = 690c52afff000000
!	Mem[0000000010101410] = 38b51efc, %l7 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l7	! %l7 = fffffffffffffffc
!	Mem[0000000010141438] = 28e63c7e f003eb30, %l0 = 5405617e, %l1 = 7a8e4af0
	ldda	[%i5+0x038]%asi,%l0	! %l0 = 0000000028e63c7e 00000000f003eb30
!	Mem[0000000030141408] = 0000000c 0000ff57, %l0 = 28e63c7e, %l1 = f003eb30
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 000000000000000c 000000000000ff57
!	Mem[0000000030141408] = 0000000c0000ff57, %l4 = 00000000000000ff
	ldxa	[%i5+%o4]0x81,%l4	! %l4 = 0000000c0000ff57
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010141400] = 000000ff d0a127ff 5405617e 00a6fb1a
!	Mem[0000000010141410] = 00000000 0000ffff 7448f194 c0a55d7e
!	Mem[0000000010141420] = b2aa2984 e55419d1 43f5ac11 9aea71c3
!	Mem[0000000010141430] = 1bf4f8dc 053b2c10 28e63c7e f003eb30
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000010041428] = 0000f04a7e610554, %f8  = 000070d4 84bc058d
	ldd	[%i1+0x028],%f8 	! %f8  = 0000f04a 7e610554
!	Starting 10 instruction Store Burst
!	%l2 = 38b51efc, %l3 = 000000ff, Mem[0000000030041400] = fc1eb5ff b0bca189
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 38b51efc 000000ff

p0_label_60:
!	%f10 = ff366b43 41770a1b, Mem[00000000300c1410] = 00000000 ffffff36
	stda	%f10,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff366b43 41770a1b
!	Mem[0000000010041408] = 3500004a, %l7 = fffffffffffffffc
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 0000004a000000ff
!	Mem[00000000218000c1] = 16743492, %l7 = 000000000000004a
	ldstub	[%o3+0x0c1],%l7		! %l7 = 00000074000000ff
!	Mem[000000001000142c] = 436b36ff, %l3 = 00000000000000ff
	swap	[%i0+0x02c],%l3		! %l3 = 00000000436b36ff
!	%l3 = 00000000436b36ff, Mem[000000001008143c] = ffff2507, %asi = 80
	stba	%l3,[%i2+0x03c]%asi	! Mem[000000001008143c] = ffff2507
!	%l6 = 00000000ff000080, Mem[0000000010181408] = 000000ff
	stwa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000080
	membar	#Sync			! Added by membar checker (13)
!	%l5 = 690c52afff000000, Mem[0000000010141438] = 28e63c7ef003eb30, %asi = 80
	stxa	%l5,[%i5+0x038]%asi	! Mem[0000000010141438] = 690c52afff000000
!	Mem[0000000030001408] = 16627bff, %l5 = 690c52afff000000
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[00000000300c1408] = 436b36ff
	stwa	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 000000ff38b51efc, %f30 = 28e63c7e f003eb30
	ldda	[%i1+%g0]0x89,%f30	! %f30 = 000000ff 38b51efc

p0_label_61:
!	Mem[0000000021800000] = c60ef55e, %l7 = 0000000000000074
	ldsb	[%o3+%g0],%l7		! %l7 = ffffffffffffffc6
!	Mem[00000000218001c0] = 2934eec2, %l7 = ffffffffffffffc6
	ldsb	[%o3+0x1c0],%l7		! %l7 = 0000000000000029
!	Mem[00000000211c0000] = ff8e4b99, %l5 = 00000000000000ff
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 000000000000008e
!	Mem[00000000300c1400] = 000000ff, %l0 = 000000000000000c
	ldswa	[%i3+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1400] = 000000ffaf520c69, %l5 = 000000000000008e
	ldxa	[%i3+%g0]0x88,%l5	! %l5 = 000000ffaf520c69
!	Mem[0000000030141408] = 0c000000, %l4 = 0000000c0000ff57
	lduwa	[%i5+%o4]0x89,%l4	! %l4 = 000000000c000000
!	Mem[00000000300c1410] = 1b0a7741436b36ff, %l6 = 00000000ff000080
	ldxa	[%i3+%o5]0x81,%l6	! %l6 = 1b0a7741436b36ff
!	Mem[00000000300c1400] = 000000ff, %l5 = 000000ffaf520c69
	ldsha	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141400] = dcf8f41b, %f28 = 1bf4f8dc
	lda	[%i5+%g0]0x81,%f28	! %f28 = dcf8f41b
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 7e330000, %l0 = 00000000000000ff
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 000000007e330000

p0_label_62:
!	%f5  = 00000000, Mem[00000000300c1410] = 41770a1b
	sta	%f5 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l7 = 0000000000000029, Mem[0000000010081414] = 30eb03f0, %asi = 80
	stha	%l7,[%i2+0x014]%asi	! Mem[0000000010081414] = 002903f0
!	Mem[0000000010001418] = adf72309, %l2 = 0000000038b51efc, %asi = 80
	swapa	[%i0+0x018]%asi,%l2	! %l2 = 00000000adf72309
!	%f24 = b2aa2984 e55419d1, Mem[0000000030181400] = ff000000 000000ff
	stda	%f24,[%i6+%g0]0x81	! Mem[0000000030181400] = b2aa2984 e55419d1
!	%l4 = 000000000c000000, Mem[0000000020800040] = ffffa555
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = 0000a555
!	Mem[0000000010101434] = d37a8e6c, %l7 = 00000029, %l3 = 436b36ff
	add	%i4,0x34,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000d37a8e6c
!	%l1 = 000000000000ff57, Mem[0000000010141410] = 000000000000ffff
	stxa	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000000000ff57
!	Mem[0000000030041400] = fc1eb538, %l1 = 000000000000ff57
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 000000fc000000ff
!	%l6 = 1b0a7741436b36ff, Mem[0000000010001408] = ff1de8de
	stba	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = ff1de8ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 62e84531f34ef10c, %f26 = 43f5ac11 9aea71c3
	ldda	[%i1+%o5]0x81,%f26	! %f26 = 62e84531 f34ef10c

p0_label_63:
!	Mem[0000000030101408] = fc1eb538ff000000, %l3 = 00000000d37a8e6c
	ldxa	[%i4+%o4]0x81,%l3	! %l3 = fc1eb538ff000000
!	Mem[0000000010101408] = 00000c78, %l7 = 0000000000000029
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000c78
!	Mem[0000000010141400] = 000000ffd0a127ff, %l5 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = 000000ffd0a127ff
!	Mem[0000000010081410] = ff007e61, %f17 = d0a127ff
	lda	[%i2+%o5]0x88,%f17	! %f17 = ff007e61
!	Mem[0000000030041410] = 3145e862, %l6 = 1b0a7741436b36ff
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000062
!	%l5 = 000000ffd0a127ff, imm = 00000000000001f3, %l1 = 00000000000000fc
	orn	%l5,0x1f3,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010081410] = f0032900ff007e61, %l6 = 0000000000000062
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = f0032900ff007e61
!	Mem[00000000300c1410] = ff366b43 00000000, %l2 = adf72309, %l3 = ff000000
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000 00000000ff366b43
!	Mem[0000000010081408] = 00000000, %l1 = ffffffffffffffff
	lduba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f6  = 8d59ff24 0923f7ad, Mem[00000000300c1408] = 000000ff 1b0a7741
	stda	%f6 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 8d59ff24 0923f7ad

p0_label_64:
!	%f20 = 00000000, %f2  = af520c69
	fcmps	%fcc2,%f20,%f2 		! %fcc2 = 2
!	%l2 = 0000000000000000, Mem[0000000010141410] = 00000000
	stba	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%l3 = 00000000ff366b43, Mem[0000000021800041] = 19dc07c8
	stb	%l3,[%o3+0x041]		! Mem[0000000021800040] = 194307c8
!	%f13 = ff1de8de, Mem[0000000010181438] = 00000000
	st	%f13,[%i6+0x038]	! Mem[0000000010181438] = ff1de8de
!	%f30 = 000000ff, Mem[0000000010001410] = 00000000
	sta	%f30,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff
!	%l0 = 000000007e330000, Mem[0000000010041408] = ff000035
	stwa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 7e330000
!	%l7 = 0000000000000c78, Mem[00000000100c1428] = 7a8efff0
	stw	%l7,[%i3+0x028]		! Mem[00000000100c1428] = 00000c78
!	%l4 = 0c000000, %l5 = d0a127ff, Mem[00000000100c1420] = 000070d4 84bc058d
	std	%l4,[%i3+0x020]		! Mem[00000000100c1420] = 0c000000 d0a127ff
!	Mem[00000000100c1400] = 690c52af, %l7 = 0000000000000c78
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 00000069000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001014142c] = 9aea71c3, %l6 = f0032900ff007e61
	lduwa	[%i5+0x02c]%asi,%l6	! %l6 = 000000009aea71c3

p0_label_65:
!	Mem[0000000010081410] = 617e00ff002903f0, %l7 = 0000000000000069
	ldxa	[%i2+%o5]0x80,%l7	! %l7 = 617e00ff002903f0
!	Mem[0000000030101410] = a0626a6b78e557ff, %l0 = 000000007e330000
	ldxa	[%i4+%o5]0x89,%l0	! %l0 = a0626a6b78e557ff
!	%l6 = 000000009aea71c3, %l1 = 0000000000000000, %y  = 5cb239ff
	sdiv	%l6,%l1,%l2		! Div by zero, %l0 = a0626a6b78e5584f
	mov	%l0,%y			! %y = 78e55827
!	Mem[0000000010181434] = 5aad3c10, %l2 = 0000000000000000
	lduba	[%i6+0x036]%asi,%l2	! %l2 = 000000000000003c
!	Mem[0000000010101434] = d37a8e6c, %l4 = 000000000c000000
	lduh	[%i4+0x036],%l4		! %l4 = 0000000000008e6c
!	Mem[0000000030141410] = 38b51efcc001e772, %l5 = 000000ffd0a127ff
	ldxa	[%i5+%o5]0x81,%l5	! %l5 = 38b51efcc001e772
!	Mem[0000000021800140] = e61a8319, %l2 = 000000000000003c
	ldsb	[%o3+0x140],%l2		! %l2 = ffffffffffffffe6
!	Mem[0000000030101400] = 000000b0, %l0 = a0626a6b78e55827
	lduha	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = ff000080 00000000, %l4 = 00008e6c, %l5 = c001e772
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 00000000ff000080 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000211c0001] = ff8e4b99, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff004b99

p0_label_66:
!	Mem[0000000030081408] = 21000000, %l4 = 00000000ff000080
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 0000000021000000
!	%l4 = 0000000021000000, Mem[0000000010101408] = ff00bf0f00000c78
	stxa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000021000000
!	%l6 = 000000009aea71c3, Mem[0000000030001400] = 57a6fb1a
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 9aea71c3
!	%l6 = 000000009aea71c3, Mem[00000000211c0000] = ff004b99
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 71c34b99
!	Mem[0000000030001410] = 7a8e4af0, %l3 = 00000000ff366b43
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 000000f0000000ff
!	%l0 = 0000000000000000, Mem[0000000030181408] = 00000000
	stwa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[0000000030001400] = 9aea71c3, %l7 = 617e00ff002903f0
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 000000c3000000ff
!	%l5 = 0000000000000000, Mem[0000000010081410] = 617e00ff
	stha	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	%l6 = 9aea71c3, %l7 = 000000c3, Mem[0000000010141408] = 5405617e 00a6fb1a
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 9aea71c3 000000c3
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l0 = 0000000000000000
	ldsba	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000

p0_label_67:
!	Mem[0000000010081410] = ff000000, %l6 = 000000009aea71c3
	lduwa	[%i2+%o5]0x88,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030001408] = ff7b6216 fc1eb538, %l4 = 21000000, %l5 = 00000000
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 00000000ff7b6216 00000000fc1eb538
!	Mem[00000000100c1430] = af520c69, %l7 = 00000000000000c3
	ldsb	[%i3+0x032],%l7		! %l7 = 000000000000000c
!	Mem[0000000030141410] = fc1eb538, %l5 = 00000000fc1eb538
	ldsba	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000038
!	Mem[0000000020800040] = 0000a555, %l4 = 00000000ff7b6216
	ldsha	[%o1+0x040]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l0 = 0000000000000000
	lduw	[%i2+%o4],%l0		! %l0 = 0000000000000000
!	Mem[0000000010001410] = ff000000, %l7 = 000000000000000c
	ldsha	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000038
	ldsha	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = ff71ea9a, %l2 = ffffffffffffffe6
	lduwa	[%i0+%g0]0x81,%l2	! %l2 = 00000000ff71ea9a
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010041410] = b4e6d098
	stba	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00e6d098

p0_label_68:
!	Mem[00000000300c1410] = 00000000, %l0 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stba	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff
!	Mem[0000000010101417] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i4+0x017]%asi,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000ff000000, Mem[0000000010141400] = ff000000
	stwa	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = ff000000
!	%l0 = 0000000000000000, immed = 000006dc, %y  = 78e55827
	smul	%l0,0x6dc,%l4		! %l4 = 0000000000000000, %y = 00000000
!	%f25 = e55419d1, Mem[0000000030081408] = ff000080
	sta	%f25,[%i2+%o4]0x81	! Mem[0000000030081408] = e55419d1
!	%l2 = 00000000ff71ea9a, Mem[0000000010081408] = 36ffffff00000000
	stxa	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000ff71ea9a
!	%l2 = ff71ea9a, %l3 = 000000f0, Mem[0000000010081408] = ff71ea9a 00000000
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = ff71ea9a 000000f0
!	%l0 = 0000000000000000, Mem[00000000100c1408] = 0000000000000000
	stxa	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 0018aefa, %l2 = 00000000ff71ea9a
	ldsha	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000018

p0_label_69:
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 0000000000000000
	setx	0x94c669a7a1fce4ec,%g7,%l0 ! %l0 = 94c669a7a1fce4ec
!	%l1 = 0000000000000000
	setx	0x0fb40938530c8b41,%g7,%l1 ! %l1 = 0fb40938530c8b41
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 94c669a7a1fce4ec
	setx	0xfdd63cc81f5b8fbb,%g7,%l0 ! %l0 = fdd63cc81f5b8fbb
!	%l1 = 0fb40938530c8b41
	setx	0xa59c0e3023542257,%g7,%l1 ! %l1 = a59c0e3023542257
!	Mem[0000000030081408] = e55419d1, %f0  = ff000000
	lda	[%i2+%o4]0x81,%f0 	! %f0 = e55419d1
!	Mem[0000000010141400] = 000000ff, %l4 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l1 = a59c0e3023542257
	lduwa	[%i5+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041408] = 00000084 0000337e, %l0 = 1f5b8fbb, %l1 = 000000ff
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 000000000000337e 0000000000000084
!	Mem[0000000010001400] = 000000ff 000000ff, %l6 = ff000000, %l7 = 00000000
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff 00000000000000ff
!	Mem[0000000010001400] = ff000000, %l7 = 00000000000000ff
	ldsba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = 71c34b99, %l4 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 00000000000071c3
!	Mem[0000000010001418] = 38b51efc, %f1  = ff000000
	lda	[%i0+0x018]%asi,%f1 	! %f1 = 38b51efc
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030101400] = 000000b0c750ee45
	stxa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000

p0_label_70:
!	%l0 = 000000000000337e, Mem[0000000030081410] = a13f90d4
	stba	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = a13f907e
!	Mem[0000000020800041] = 0000a555, %l1 = 0000000000000084
	ldstuba	[%o1+0x041]%asi,%l1	! %l1 = 00000000000000ff
!	%f16 = 000000ff ff007e61, Mem[0000000030001408] = ff7b6216 fc1eb538
	stda	%f16,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff ff007e61
!	%l1 = 0000000000000000, imm = 0000000000000dbc, %l1 = 0000000000000000
	xor	%l1,0xdbc,%l1		! %l1 = 0000000000000dbc
!	%l5 = 0000000000000000, Mem[0000000030141408] = 0000000c
	stwa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	%f6  = 8d59ff24 0923f7ad, %l5 = 0000000000000000
!	Mem[0000000010081418] = ab7361d0d42b6f1b
	add	%i2,0x018,%g1
	stda	%f6,[%g1+%l5]ASI_PST32_P ! Mem[0000000010081418] = ab7361d0d42b6f1b
!	%l1 = 0000000000000dbc, Mem[0000000010081410] = ff000000
	stha	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000dbc
!	%f0  = e55419d1, %f16 = 000000ff
	fitos	%f0 ,%f16		! %f16 = cdd55f31
!	%l7 = 0000000000000000, Mem[0000000010001410] = 000000ff
	stba	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000 00000000, %l4 = 000071c3, %l5 = 00000000
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000 0000000000000000

p0_label_71:
!	Mem[0000000030141410] = 38b51efcc001e772, %l0 = 000000000000337e
	ldxa	[%i5+%o5]0x81,%l0	! %l0 = 38b51efcc001e772
!	Mem[0000000010101408] = 00000021, %f12 = af520c69
	ld	[%i4+%o4],%f12	! %f12 = 00000021
!	Mem[0000000010001408] = af520c69ff1de8ff, %f8  = 0000f04a 7e610554
	ldda	[%i0+%o4]0x88,%f8 	! %f8  = af520c69 ff1de8ff
!	Mem[0000000010001438] = 8ae45f69000000ff, %f18 = 5405617e 00a6fb1a
	ldda	[%i0+0x038]%asi,%f18	! %f18 = 8ae45f69 000000ff
!	Mem[0000000030181408] = 00000000, %l1 = 0000000000000dbc
	lduwa	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = ff71ea9ae47b6216, %l2 = 0000000000000018
	ldxa	[%i0+%g0]0x81,%l2	! %l2 = ff71ea9ae47b6216
!	Mem[0000000030141408] = 000000000000ff57, %l4 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l4	! %l4 = 000000000000ff57
!	Mem[0000000030141400] = dcf8f41b, %f9  = ff1de8ff
	lda	[%i5+%g0]0x81,%f9 	! %f9 = dcf8f41b
!	Mem[000000001014143c] = ff000000, %l2 = ff71ea9ae47b6216
	ldsh	[%i5+0x03c],%l2		! %l2 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 38b51eff, %l2 = ffffffffffffff00
	swapa	[%i1+%g0]0x89,%l2	! %l2 = 0000000038b51eff

p0_label_72:
!	%f19 = 000000ff, Mem[0000000030101410] = 78e557ff
	sta	%f19,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	%l3 = 00000000000000f0, Mem[0000000030181400] = d11954e58429aab2
	stxa	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000000000f0
!	Mem[00000000100c1400] = ff0c52af, %l4 = 000000000000ff57
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010141408] = c371ea9a, %l1 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 00000000c371ea9a
!	%l6 = 00000000000000ff, Mem[0000000030141400] = 1bf4f8dc
	stha	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 1bf400ff
!	%f28 = dcf8f41b 053b2c10, Mem[00000000100c1410] = ffff0000 00000000
	stda	%f28,[%i3+%o5]0x80	! Mem[00000000100c1410] = dcf8f41b 053b2c10
!	%f12 = 00000021 ff1de8de, Mem[0000000010101410] = fc1eb538 ff0000ff
	stda	%f12,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000021 ff1de8de
!	Mem[0000000030141408] = 00000000, %l6 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%f9  = dcf8f41b, Mem[0000000030041408] = 800000ff
	sta	%f9 ,[%i1+%o4]0x89	! Mem[0000000030041408] = dcf8f41b
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = f0000000, %l3 = 00000000000000f0
	ldsha	[%i6+%g0]0x81,%l3	! %l3 = fffffffffffff000

p0_label_73:
!	Mem[0000000030041400] = 00ffffff ff000000, %l0 = c001e772, %l1 = c371ea9a
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 0000000000ffffff 00000000ff000000
!	Mem[0000000030081408] = 000000f2d11954e5, %l6 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l6	! %l6 = 000000f2d11954e5
!	Mem[0000000010041410] = 7e3ce62898d0e600, %l1 = 00000000ff000000
	ldxa	[%i1+%o5]0x88,%l1	! %l1 = 7e3ce62898d0e600
!	Mem[000000001018141c] = 3fd45bb1, %l3 = fffffffffffff000
	ldsba	[%i6+0x01e]%asi,%l3	! %l3 = 000000000000005b
!	Mem[00000000100c1410] = 102c3b05 1bf4f8dc, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 000000001bf4f8dc 00000000102c3b05
!	Mem[00000000201c0000] = ffffeaae, %l2 = 0000000038b51eff
	ldub	[%o0+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030081400] = 5405617e45eee057, %l7 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l7	! %l7 = 5405617e45eee057
!	Mem[0000000030101410] = ff000000, %l0 = 0000000000ffffff
	ldsha	[%i4+%o5]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030081410] = a13f907e, %f27 = f34ef10c
	lda	[%i2+%o5]0x89,%f27	! %f27 = a13f907e
!	Starting 10 instruction Store Burst
!	%l6 = d11954e5, %l7 = 45eee057, Mem[0000000030081408] = d11954e5 000000f2
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = d11954e5 45eee057

p0_label_74:
!	%l1 = 7e3ce62898d0e600, %l3 = 000000000000005b, %l7 = 5405617e45eee057
	add	%l1,%l3,%l7		! %l7 = 7e3ce62898d0e65b
!	%f27 = a13f907e, Mem[0000000030101410] = ff000000
	sta	%f27,[%i4+%o5]0x81	! Mem[0000000030101410] = a13f907e
!	%f26 = 62e84531, %f14 = ff000000, %f10 = ff366b43 41770a1b
	fsmuld	%f26,%f14,%f10		! %f10 = cc4d08a6 20000000
!	%l2 = 000000ff, %l3 = 0000005b, Mem[0000000010101400] = 0018aefa ff5b6ccd
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff 0000005b
!	Code Fragment 4
p0_fragment_13:
!	%l0 = ffffffffffffff00
	setx	0x6cb738ffed059a6b,%g7,%l0 ! %l0 = 6cb738ffed059a6b
!	%l1 = 7e3ce62898d0e600
	setx	0x493ce4801cc4468e,%g7,%l1 ! %l1 = 493ce4801cc4468e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6cb738ffed059a6b
	setx	0x82eda0d04db665b1,%g7,%l0 ! %l0 = 82eda0d04db665b1
!	%l1 = 493ce4801cc4468e
	setx	0x863288f855a56439,%g7,%l1 ! %l1 = 863288f855a56439
!	%l0 = 82eda0d04db665b1, Mem[00000000100c1400] = af520cff
	stha	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = af5265b1
!	%l4 = 000000001bf4f8dc, Mem[00000000100c1410] = 1bf4f8dc
	stba	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 1bf4f8dc
!	%l1 = 863288f855a56439, Mem[0000000030181400] = f0000000
	stwa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 55a56439
!	Mem[0000000030101400] = 00000000, %l5 = 00000000102c3b05
	ldstuba	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%l2 = 00000000000000ff, imm = fffffffffffff45a, %l5 = 0000000000000000
	andn	%l2,-0xba6,%l5		! %l5 = 00000000000000a5

p0_label_75:
!	Mem[0000000010081408] = 9aea71ff, %l6 = 000000f2d11954e5
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffff9aea
!	Mem[000000001004141c] = 8bf2c6ff, %f5  = 00000000
	lda	[%i1+0x01c]%asi,%f5 	! %f5 = 8bf2c6ff
!	Mem[0000000030101408] = 000000ff 38b51efc, %l2 = 000000ff, %l3 = 0000005b
	ldda	[%i4+%o4]0x89,%l2	! %l2 = 0000000038b51efc 00000000000000ff
!	Mem[0000000010141430] = 1bf4f8dc053b2c10, %l4 = 000000001bf4f8dc
	ldx	[%i5+0x030],%l4		! %l4 = 1bf4f8dc053b2c10
!	Mem[0000000030181410] = f90c00ff, %l6 = ffffffffffff9aea
	lduwa	[%i6+%o5]0x89,%l6	! %l6 = 00000000f90c00ff
!	Mem[0000000010041408] = 7e330000, %l2 = 0000000038b51efc
	lduha	[%i1+%o4]0x80,%l2	! %l2 = 0000000000007e33
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000030101400] = ff000000 00000000 fc1eb538 ff000000
!	Mem[0000000030101410] = a13f907e 6b6a62a0 98d0e6b4 1afba657
!	Mem[0000000030101420] = 0db79c36 c750ee45 22d7337e 28e63c7e
!	Mem[0000000030101430] = 010a115a e7e770fa 77dc5bff adf36949
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[0000000010141410] = 00000000, %f25 = e55419d1
	lda	[%i5+%o5]0x80,%f25	! %f25 = 00000000
!	Mem[0000000030081408] = d11954e5, %l1 = 863288f855a56439
	ldsha	[%i2+%o4]0x89,%l1	! %l1 = 00000000000054e5
!	Starting 10 instruction Store Burst
!	%l4 = 1bf4f8dc053b2c10, Mem[0000000030141400] = ff00f41b62597181
	stxa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 1bf4f8dc053b2c10

p0_label_76:
	membar	#Sync			! Added by membar checker (15)
!	%l6 = 00000000f90c00ff, Mem[0000000030101400] = 000000ff
	stha	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	%l6 = 00000000f90c00ff, Mem[00000000300c1410] = 00000000
	stba	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff000000
!	Mem[0000000030181410] = f90c00ff, %l1 = 00000000000054e5
	swapa	[%i6+%o5]0x89,%l1	! %l1 = 00000000f90c00ff
!	%f5  = 6b6a62a0, Mem[0000000010141428] = 43f5ac11
	st	%f5 ,[%i5+0x028]	! Mem[0000000010141428] = 6b6a62a0
!	%l0 = 4db665b1, %l1 = f90c00ff, Mem[00000000100c1418] = 8d59ff24 0923f7ad
	std	%l0,[%i3+0x018]		! Mem[00000000100c1418] = 4db665b1 f90c00ff
!	%l2 = 0000000000007e33, Mem[00000000100c1406] = ff000000, %asi = 80
	stha	%l2,[%i3+0x006]%asi	! Mem[00000000100c1404] = ff007e33
!	Mem[0000000030181408] = 00000000, %l5 = 00000000000000a5
	swapa	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000010041400] = 0000004a
	stwa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff
!	%f28 = dcf8f41b, %f19 = 000000ff, %f4  = a13f907e
	fdivs	%f28,%f19,%f4 		! %f4  = ff800000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000021, %l3 = 00000000000000ff
	ldsha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_77:
!	Mem[0000000030101408] = fc1eb538ff000000, %l5 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l5	! %l5 = fc1eb538ff000000
!	Mem[0000000010001400] = 000000ff, %l5 = fc1eb538ff000000
	ldswa	[%i0+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Code Fragment 3
p0_fragment_14:
!	%l0 = 82eda0d04db665b1
	setx	0xaa7211606b3f72c7,%g7,%l0 ! %l0 = aa7211606b3f72c7
!	%l1 = 00000000f90c00ff
	setx	0x9b4066b7c8cde502,%g7,%l1 ! %l1 = 9b4066b7c8cde502
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = aa7211606b3f72c7
	setx	0xad9731af92a1241e,%g7,%l0 ! %l0 = ad9731af92a1241e
!	%l1 = 9b4066b7c8cde502
	setx	0x2c3ba9406043c032,%g7,%l1 ! %l1 = 2c3ba9406043c032
!	Mem[0000000010041400] = ff000000, %l5 = 00000000000000ff
	ldsba	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041400] = 00ffffff ff000000 1bf4f8dc 00000000
!	Mem[0000000030041410] = 62e84531 f34ef10c 7e5da5c0 94f14874
!	Mem[0000000030041420] = d11954e5 8429aab2 c371ea9a 11acf543
!	Mem[0000000030041430] = 102c0183 61d5e96d 16627be4 0ca4ff79
	ldda	[%i1]ASI_BLK_SL,%f16	! Block Load from 0000000030041400
!	Mem[0000000030001410] = 7a8e4aff, %l5 = ffffffffffffffff
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = 0000000000004aff
!	Mem[0000000030081400] = 57e0ee45, %l2 = 0000000000007e33
	ldswa	[%i2+%g0]0x81,%l2	! %l2 = 0000000057e0ee45
!	Mem[0000000010081438] = 7f9995a9ffff2507, %l4 = 1bf4f8dc053b2c10
	ldx	[%i2+0x038],%l4		! %l4 = 7f9995a9ffff2507
!	Mem[0000000010001408] = ff1de8ff, %l3 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l3	! %l3 = 00000000ff1de8ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 0000337e, %l1 = 2c3ba9406043c032
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 000000000000337e

p0_label_78:
!	%l1 = 000000000000337e, Mem[0000000010001420] = 8d05bc84
	stw	%l1,[%i0+0x020]		! Mem[0000000010001420] = 0000337e
!	%l6 = 00000000f90c00ff, imm = fffffffffffffaac, %l0 = ad9731af92a1241e
	add	%l6,-0x554,%l0		! %l0 = 00000000f90bfbab
!	Mem[00000000100c1408] = 00000000, %l4 = 7f9995a9ffff2507
	ldstub	[%i3+%o4],%l4		! %l4 = 00000000000000ff
!	%l5 = 0000000000004aff, Mem[0000000010141408] = 00000000
	sth	%l5,[%i5+%o4]		! Mem[0000000010141408] = 4aff0000
!	%l2 = 57e0ee45, %l3 = ff1de8ff, Mem[0000000010081430] = 67138f59 fbee4764
	std	%l2,[%i2+0x030]		! Mem[0000000010081430] = 57e0ee45 ff1de8ff
!	%l4 = 00000000, %l5 = 00004aff, Mem[0000000010001428] = 1b0a7741 000000ff
	std	%l4,[%i0+0x028]		! Mem[0000000010001428] = 00000000 00004aff
!	Mem[0000000010181408] = ff000080, %l0 = 00000000f90bfbab
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010001408] = ff1de8ff, %l7 = 7e3ce62898d0e65b
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	%l0 = 00000000000000ff, immed = 00000a39, %y  = 00000000
	umul	%l0,0xa39,%l7		! %l7 = 00000000000a2ec7, %y = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000021, %l3 = 00000000ff1de8ff
	ldsba	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_79:
!	Mem[0000000010081400] = 4a000035, %l2 = 0000000057e0ee45
	ldsha	[%i2+%g0]0x80,%l2	! %l2 = 0000000000004a00
!	Mem[00000000211c0000] = 71c34b99, %l3 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l3	! %l3 = ffffffffffffffc3
!	Mem[0000000010041408] = 32c0436084000000, %f4  = ff800000 6b6a62a0
	ldda	[%i1+0x008]%asi,%f4 	! %f4  = 32c04360 84000000
!	Mem[0000000030181408] = 000000a5, %l5 = 0000000000004aff
	lduba	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000000
	ldub	[%i5+0x012],%l5		! %l5 = 0000000000000000
!	Mem[000000001014140c] = 000000c3, %l0 = 00000000000000ff
	ldsh	[%i5+0x00c],%l0		! %l0 = 0000000000000000
!	Mem[0000000030001400] = 16627be49aea71ff, %f12 = 010a115a e7e770fa
	ldda	[%i0+%g0]0x89,%f12	! %f12 = 16627be4 9aea71ff
!	Mem[0000000010041408] = 00000084 6043c032, %l0 = 00000000, %l1 = 0000337e
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 000000006043c032 0000000000000084
!	Mem[0000000030001408] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i0+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 6043c032, %l1 = 00000084, Mem[0000000030081410] = a13f907e 8e93df9f
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 6043c032 00000084

p0_label_80:
!	%l4 = 0000000000000000, Mem[0000000010081400] = 4a000035
	stha	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000035
!	Mem[0000000020800041] = 00ffa555, %l5 = 00000000000000ff
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 000000ff000000ff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030001408] = ff000000 617e00ff
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 000000ff
!	%l3 = ffffffffffffffc3, Mem[000000001000140e] = 690c52af, %asi = 80
	stha	%l3,[%i0+0x00e]%asi	! Mem[000000001000140c] = 690cffc3
!	%l7 = 00000000000a2ec7, Mem[0000000010141408] = 4aff0000000000c3, %asi = 80
	stxa	%l7,[%i5+0x008]%asi	! Mem[0000000010141408] = 00000000000a2ec7
!	Code Fragment 4
p0_fragment_15:
!	%l0 = 000000006043c032
	setx	0x0736cf67deda7a28,%g7,%l0 ! %l0 = 0736cf67deda7a28
!	%l1 = 0000000000000084
	setx	0x043f2cc84019968d,%g7,%l1 ! %l1 = 043f2cc84019968d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0736cf67deda7a28
	setx	0x9f2fcf882a878a4e,%g7,%l0 ! %l0 = 9f2fcf882a878a4e
!	%l1 = 043f2cc84019968d
	setx	0x8931fb80266e1ca7,%g7,%l1 ! %l1 = 8931fb80266e1ca7
!	Mem[0000000010001410] = 000000ff, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l7 = 00000000000a2ec7, Mem[0000000030081400] = 45eee057
	stha	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 45ee2ec7
!	Mem[0000000010001424] = d4700000, %l5 = 00000000000000ff
	swap	[%i0+0x024],%l5		! %l5 = 00000000d4700000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 16627be4 9aea71ff, %l6 = f90c00ff, %l7 = 000a2ec7
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 000000009aea71ff 0000000016627be4

p0_label_81:
!	Mem[00000000300c1410] = ff366b43 000000ff, %l0 = 2a878a4e, %l1 = 266e1ca7
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000ff 00000000ff366b43
!	Mem[0000000010101404] = 0000005b, %f25 = e55419d1
	ld	[%i4+0x004],%f25	! %f25 = 0000005b
!	Mem[0000000010001400] = 000000ff, %l2 = 0000000000004a00
	lduha	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 00000000ff000000, %f18 = 00000000 dcf8f41b
	ldda	[%i0+%o4]0x81,%f18	! %f18 = 00000000 ff000000
!	Mem[0000000010081410] = ff000dbc, %l5 = 00000000d4700000
	ldswa	[%i2+%o5]0x88,%l5	! %l5 = ffffffffff000dbc
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010181400] = 00000000 0000f04a ff000080 f2000000
!	Mem[0000000010181410] = 0c0000b6 ff269c42 c056b74d 3fd45bb1
!	Mem[0000000010181420] = 00000000 5405617e a69ebf0f 5c06ff76
!	Mem[0000000010181430] = 00000078 5aad3c10 ff1de8de 000000f8
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[0000000010181418] = c056b74d 3fd45bb1, %l0 = 000000ff, %l1 = ff366b43
	ldd	[%i6+0x018],%l0		! %l0 = 00000000c056b74d 000000003fd45bb1
!	Mem[0000000020800040] = 00ffa555, %l5 = ffffffffff000dbc
	lduh	[%o1+0x040],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030141410] = fc1eb538, %l4 = 00000000000000ff
	lduha	[%i5+%o5]0x89,%l4	! %l4 = 000000000000b538
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_16:
!	%l0 = 00000000c056b74d
	setx	0xe2521ee028d5ba04,%g7,%l0 ! %l0 = e2521ee028d5ba04
!	%l1 = 000000003fd45bb1
	setx	0x0ec078bfac1679dc,%g7,%l1 ! %l1 = 0ec078bfac1679dc
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e2521ee028d5ba04
	setx	0x75ab49cfc8b65b35,%g7,%l0 ! %l0 = 75ab49cfc8b65b35
!	%l1 = 0ec078bfac1679dc
	setx	0xbc53b86f881d0195,%g7,%l1 ! %l1 = bc53b86f881d0195

p0_label_82:
!	%l4 = 000000000000b538, Mem[0000000010001410] = 000000000000ffff, %asi = 80
	stxa	%l4,[%i0+0x010]%asi	! Mem[0000000010001410] = 000000000000b538
!	Mem[00000000100c1423] = 0c000000, %l4 = 000000000000b538
	ldstuba	[%i3+0x023]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101410] = a13f907e, %l1 = bc53b86f881d0195
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 00000000a13f907e
!	%l3 = ffffffffffffffc3, Mem[0000000030101408] = 38b51efc
	stha	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 38b5ffc3
!	%l6 = 000000009aea71ff, Mem[0000000030141408] = ff000000
	stwa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 9aea71ff
!	Mem[0000000010181408] = 800000ff, %l0 = 75ab49cfc8b65b35
	ldstuba	[%i6+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030101400] = 000000ff, %l6 = 000000009aea71ff
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000211c0001] = 71c34b99, %l2 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 000000c3000000ff
!	%f3  = ff000000, Mem[0000000030141408] = 9aea71ff
	sta	%f3 ,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 9aea71ff, %l7 = 0000000016627be4
	lduwa	[%i0+%g0]0x89,%l7	! %l7 = 000000009aea71ff

p0_label_83:
!	Mem[00000000211c0000] = 71ff4b99, %l4 = 0000000000000000
	lduh	[%o2+%g0],%l4		! %l4 = 00000000000071ff
!	Mem[0000000010001400] = 000000ff, %l7 = 000000009aea71ff
	lduh	[%i0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000030101400] = ff000000, %l0 = 00000000000000ff
	lduba	[%i4+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041400] = ff000000, %l6 = 00000000000000ff
	lduwa	[%i1+%g0]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[00000000100c1410] = 1bf4f8dc, %f13 = 9aea71ff
	lda	[%i3+%o5]0x88,%f13	! %f13 = 1bf4f8dc
!	Mem[00000000100c1400] = b16552afff007e33, %l1 = 00000000a13f907e
	ldxa	[%i3+0x000]%asi,%l1	! %l1 = b16552afff007e33
!	Mem[0000000020800040] = 00ffa555, %l0 = 00000000000000ff
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041400] = ffffff00, %l7 = 0000000000000000
	lduha	[%i1+%g0]0x89,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010041400] = 000000ff, %l6 = 00000000ff000000
	ldswa	[%i1+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f14 = 77dc5bff adf36949, Mem[0000000010141408] = 00000000 c72e0a00
	stda	%f14,[%i5+%o4]0x88	! Mem[0000000010141408] = 77dc5bff adf36949

p0_label_84:
!	%l6 = 00000000000000ff, Mem[0000000030181400] = 3964a555
	stba	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 3964a5ff
!	%l6 = 000000ff, %l7 = 0000ff00, Mem[0000000010081410] = bc0d00ff 002903f0
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff 0000ff00
!	Mem[0000000010101410] = 21000000, %l6 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l6	! %l6 = 0000000021000000
!	%f20 = 0c0000b6 ff269c42, %l1 = b16552afff007e33
!	Mem[0000000030101418] = 98d0e6b41afba657
	add	%i4,0x018,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_S ! Mem[0000000030101418] = 0c0000b6ff269c42
!	%l2 = 00000000000000c3, Mem[0000000010081410] = 000000ff0000ff00
	stxa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000000000c3
!	%f28 = 00000078, Mem[0000000010081400] = 00000035
	st	%f28,[%i2+%g0]		! Mem[0000000010081400] = 00000078
!	%l5 = 00000000000000ff, Mem[0000000030041400] = ffffff00
	stba	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff
!	Mem[00000000300c1410] = ff000000, %l6 = 0000000021000000
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030101400] = 000000ff, %l2 = 00000000000000c3
	ldstuba	[%i4+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %f27 = 5c06ff76
	lda	[%i0+%o4]0x81,%f27	! %f27 = 00000000

p0_label_85:
!	Mem[0000000020800040] = 00ffa555, %l4 = 00000000000071ff
	lduh	[%o1+0x040],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030141408] = ff000000, %l0 = 00000000000000ff
	lduba	[%i5+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = 38b51efc, %f6  = 98d0e6b4
	lda	[%i5+%o5]0x81,%f6 	! %f6 = 38b51efc
!	Mem[00000000100c1410] = dcf8f41b, %l5 = 00000000000000ff
	lduba	[%i3+%o5]0x80,%l5	! %l5 = 00000000000000dc
!	Mem[00000000300c1410] = ff000000436b36ff, %f16 = 00000000 0000f04a
	ldda	[%i3+%o5]0x81,%f16	! %f16 = ff000000 436b36ff
!	Mem[0000000030101400] = 000000ff, %l4 = 00000000000000ff
	lduwa	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001408] = 00000000 ff000000, %l6 = 000000ff, %l7 = 0000ff00
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[0000000010101420] = ff2770d4, %f25 = 5405617e
	ld	[%i4+0x020],%f25	! %f25 = ff2770d4
!	Mem[0000000010141410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000dc, Mem[000000001000143b] = 8ae45f69
	stb	%l5,[%i0+0x03b]		! Mem[0000000010001438] = 8ae45fdc

p0_label_86:
!	Mem[0000000030141408] = 000000ff, %l0 = 00000000000000ff
	ldstuba	[%i5+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%f30 = ff1de8de 000000f8, Mem[0000000030081408] = d11954e5 45eee057
	stda	%f30,[%i2+%o4]0x89	! Mem[0000000030081408] = ff1de8de 000000f8
	membar	#Sync			! Added by membar checker (17)
!	%f18 = ff000080 f2000000, %l4 = 00000000000000ff
!	Mem[0000000010181430] = 000000785aad3c10
	add	%i6,0x030,%g1
	stda	%f18,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010181430] = 000000f2800000ff
!	%f0  = ff000000 00000000 fc1eb538 ff000000
!	%f4  = 32c04360 84000000 38b51efc 1afba657
!	%f8  = 0db79c36 c750ee45 22d7337e 28e63c7e
!	%f12 = 16627be4 1bf4f8dc 77dc5bff adf36949
	stda	%f0,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	Mem[00000000100c1434] = ff1de8de, %l0 = 00000000000000ff
	ldstuba	[%i3+0x034]%asi,%l0	! %l0 = 000000ff000000ff
!	%f28 = 00000078 5aad3c10, Mem[0000000030081400] = 45ee2ec7 5405617e
	stda	%f28,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000078 5aad3c10
!	Mem[0000000030181410] = 000054e5, %l2 = 00000000000000ff
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 000000e5000000ff
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000030101400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000000000000e5, Mem[00000000100c1410] = 102c3b051bf4f8dc
	stxa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000000000e5
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff4a8e7a, %l6 = 0000000000000000
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffffff4a

p0_label_87:
!	Mem[0000000030081408] = f8000000, %f16 = ff000000
	lda	[%i2+%o4]0x81,%f16	! %f16 = f8000000
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 00000000000000ff
	setx	0xb9964888657a9d88,%g7,%l0 ! %l0 = b9964888657a9d88
!	%l1 = b16552afff007e33
	setx	0x3ee93f3fe433a06c,%g7,%l1 ! %l1 = 3ee93f3fe433a06c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b9964888657a9d88
	setx	0xfb6077b001cb64e8,%g7,%l0 ! %l0 = fb6077b001cb64e8
!	%l1 = 3ee93f3fe433a06c
	setx	0xdeb60d3ff107d51c,%g7,%l1 ! %l1 = deb60d3ff107d51c
!	Mem[0000000010141408] = 4969f3ad, %l4 = 00000000000000ff
	lduba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000049
!	Mem[0000000010181400] = 4af0000000000000, %l6 = ffffffffffffff4a
	ldxa	[%i6+%g0]0x88,%l6	! %l6 = 4af0000000000000
!	Mem[0000000021800180] = 846e1c36, %l1 = deb60d3ff107d51c
	ldsha	[%o3+0x180]%asi,%l1	! %l1 = ffffffffffff846e
!	Mem[0000000010101400] = ff000000, %l4 = 0000000000000049
	ldsha	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l2 = 00000000000000e5, %l3 = ffffffffffffffc3, %y  = 00000000
	sdiv	%l2,%l3,%l1		! %l1 = fffffffffffffffd
	mov	%l0,%y			! %y = 01cb64e8
!	Mem[0000000030141408] = ff000000, %f20 = 0c0000b6
	lda	[%i5+%o4]0x81,%f20	! %f20 = ff000000
!	Mem[0000000010181400] = 4af0000000000000, %l0 = fb6077b001cb64e8
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = 4af0000000000000
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffc3, Mem[00000000100c1400] = af5265b1
	stba	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = af5265c3

p0_label_88:
!	%l2 = 00000000000000e5, Mem[0000000020800000] = ffff5b63, %asi = 80
	stha	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 00e55b63
!	Mem[0000000021800040] = 194307c8, %l1 = fffffffffffffffd
	ldstub	[%o3+0x040],%l1		! %l1 = 00000019000000ff
!	Mem[0000000030081410] = 32c04360, %l2 = 00000000000000e5
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 00000032000000ff
!	Mem[0000000010041400] = 000000ff, %l1 = 0000000000000019
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%l3 = ffffffffffffffc3, Mem[0000000030081400] = 103cad5a78000000
	stxa	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffffffffffc3
!	%l7 = 00000000ff000000, Mem[0000000010081408] = ff71ea9a
	stha	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = ff710000
!	Mem[000000001000140c] = 690cffc3, %l6 = 4af0000000000000
	ldstub	[%i0+0x00c],%l6		! %l6 = 00000069000000ff
!	%l6 = 00000069, %l7 = ff000000, Mem[0000000010041408] = 32c04360 84000000
	stda	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000069 ff000000
!	%l2 = 0000000000000032, Mem[00000000100c1410] = 000000e5
	stwa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000032
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 71ff4b99, %l0 = 4af0000000000000
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = ffffffffffffffff

p0_label_89:
!	Mem[0000000030181400] = ffa56439, %l7 = 00000000ff000000
	ldswa	[%i6+%g0]0x81,%l7	! %l7 = ffffffffffa56439
!	Mem[0000000030081410] = ffc04360 84000000, %l2 = 00000032, %l3 = ffffffc3
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000ffc04360 0000000084000000
!	Mem[0000000010081400] = 8ae45f6978000000, %f16 = f8000000 436b36ff
	ldda	[%i2+%g0]0x88,%f16	! %f16 = 8ae45f69 78000000
!	Mem[0000000030141408] = ff0000000000ff57, %f0  = ff000000 00000000
	ldda	[%i5+%o4]0x81,%f0 	! %f0  = ff000000 0000ff57
!	Mem[0000000010101400] = ff000000, %l2 = 00000000ffc04360
	lduba	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800180] = 846e1c36, %l6 = 0000000000000069
	lduh	[%o3+0x180],%l6		! %l6 = 000000000000846e
!	Mem[00000000211c0000] = 71ff4b99, %l5 = 00000000000000dc
	ldsb	[%o2+%g0],%l5		! %l5 = 0000000000000071
!	Mem[00000000300c1400] = 00000000000000ff, %f0  = ff000000 0000ff57
	ldda	[%i3+%g0]0x89,%f0 	! %f0  = 00000000 000000ff
!	Mem[0000000010101408] = 00000021, %l0 = ffffffffffffffff
	ldswa	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000021
!	Starting 10 instruction Store Burst
!	%f16 = 8ae45f69 78000000 ff000080 f2000000
!	%f20 = ff000000 ff269c42 c056b74d 3fd45bb1
!	%f24 = 00000000 ff2770d4 a69ebf0f 00000000
!	%f28 = 00000078 5aad3c10 ff1de8de 000000f8
	stda	%f16,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400

p0_label_90:
!	Code Fragment 4
p0_fragment_18:
!	%l0 = 0000000000000021
	setx	0xf1537b67a0abf3ac,%g7,%l0 ! %l0 = f1537b67a0abf3ac
!	%l1 = 00000000000000ff
	setx	0xa1a50b2827d8fb1e,%g7,%l1 ! %l1 = a1a50b2827d8fb1e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f1537b67a0abf3ac
	setx	0x4a87e370240ba117,%g7,%l0 ! %l0 = 4a87e370240ba117
!	%l1 = a1a50b2827d8fb1e
	setx	0x2e2485186055e51b,%g7,%l1 ! %l1 = 2e2485186055e51b
!	%f13 = 1bf4f8dc, Mem[0000000010181410] = b600000c
	sta	%f13,[%i6+%o5]0x88	! Mem[0000000010181410] = 1bf4f8dc
!	%l6 = 000000000000846e, Mem[0000000010101410] = dee81dff000000ff
	stxa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000000000846e
!	%l4 = 00000000, %l5 = 00000071, Mem[00000000100c1400] = c36552af ff007e33
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 00000071
	membar	#Sync			! Added by membar checker (19)
!	%l1 = 2e2485186055e51b, Mem[0000000010041410] = 00e6d098
	stha	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = e51bd098
!	%l4 = 00000000, %l5 = 00000071, Mem[00000000100c1428] = 00000c78 7e610554
	std	%l4,[%i3+0x028]		! Mem[00000000100c1428] = 00000000 00000071
!	%f24 = 00000000, %f14 = 77dc5bff, %f11 = 28e63c7e
	fdivs	%f24,%f14,%f11		! %f11 = 00000000
!	%l2 = 00000000, %l3 = 84000000, Mem[0000000030001400] = ff71ea9a e47b6216
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 84000000
!	%f24 = 00000000 ff2770d4, Mem[0000000010041410] = 98d01be5 7e3ce628
	stda	%f24,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 ff2770d4
!	Starting 10 instruction Load Burst
!	%f13 = 1bf4f8dc, %f12 = 16627be4 1bf4f8dc
	fstox	%f13,%f12		! %f12 = 00000000 00000000

p0_label_91:
!	Mem[0000000010081424] = 8d9039a3, %l0 = 4a87e370240ba117
	ldsb	[%i2+0x027],%l0		! %l0 = ffffffffffffffa3
!	Mem[0000000010081410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = ff000000, %l3 = 0000000084000000
	ldswa	[%i4+%o4]0x89,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030101400] = ff000000000000ff, %f26 = a69ebf0f 00000000
	ldda	[%i4+%g0]0x81,%f26	! %f26 = ff000000 000000ff
!	Mem[00000000201c0000] = ffffeaae, %l6 = 000000000000846e
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030101408] = ff000000, %l3 = ffffffffff000000
	lduwa	[%i4+%o4]0x89,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030141410] = 72e701c0 fc1eb538, %l4 = 00000000, %l5 = 00000071
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 00000000fc1eb538 0000000072e701c0
!	Mem[0000000030101400] = ff000000 000000ff, %l2 = 00000000, %l3 = ff000000
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff 00000000ff000000
!	Code Fragment 3
p0_fragment_19:
!	%l0 = ffffffffffffffa3
	setx	0xd900f7f824c83833,%g7,%l0 ! %l0 = d900f7f824c83833
!	%l1 = 2e2485186055e51b
	setx	0x5fea897067458471,%g7,%l1 ! %l1 = 5fea897067458471
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d900f7f824c83833
	setx	0xdfcd4ca051629452,%g7,%l0 ! %l0 = dfcd4ca051629452
!	%l1 = 5fea897067458471
	setx	0xe17e770066503f4c,%g7,%l1 ! %l1 = e17e770066503f4c
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000ffff, Mem[0000000030181408] = 000000a5
	stha	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = ffff00a5

p0_label_92:
!	Mem[000000001008142b] = 5403dcf8, %l0 = dfcd4ca051629452
	ldstuba	[%i2+0x02b]%asi,%l0	! %l0 = 000000f8000000ff
!	%l1 = e17e770066503f4c, Mem[0000000010081410] = 00000000
	stba	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000004c
!	%l2 = 000000ff, %l3 = ff000000, Mem[0000000010001408] = ff1de8ff c3ff0cff
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff ff000000
!	%l6 = 000000000000ffff, Mem[0000000030181408] = ffff00a5
	stha	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = ffff00a5
!	Code Fragment 4
p0_fragment_20:
!	%l0 = 00000000000000f8
	setx	0x32bd74bfb255d9e2,%g7,%l0 ! %l0 = 32bd74bfb255d9e2
!	%l1 = e17e770066503f4c
	setx	0x0098418fc8c59f5c,%g7,%l1 ! %l1 = 0098418fc8c59f5c
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 32bd74bfb255d9e2
	setx	0x34739b37ef78fd02,%g7,%l0 ! %l0 = 34739b37ef78fd02
!	%l1 = 0098418fc8c59f5c
	setx	0x8d4f434f92cdbc90,%g7,%l1 ! %l1 = 8d4f434f92cdbc90
!	%f28 = 00000078 5aad3c10, Mem[0000000030081410] = ffc04360 84000000
	stda	%f28,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000078 5aad3c10
!	%l0 = 34739b37ef78fd02, Mem[0000000010001410] = 38b5000000000000
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 34739b37ef78fd02
!	%l6 = 0000ffff, %l7 = ffa56439, Mem[0000000030001408] = 00000000 ff000000
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000ffff ffa56439
!	%f18 = ff000080 f2000000, Mem[00000000300c1408] = adf72309 24ff598d
	stda	%f18,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000080 f2000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 16627be4ff2770d4, %l3 = 00000000ff000000
	ldx	[%i1+0x030],%l3		! %l3 = 16627be4ff2770d4

p0_label_93:
!	%l1 = 8d4f434f92cdbc90, %l3 = 16627be4ff2770d4, %l1 = 8d4f434f92cdbc90
	and	%l1,%l3,%l1		! %l1 = 0442434492053090
!	Mem[0000000010041430] = 16627be4, %l1 = 0442434492053090
	lduwa	[%i1+0x030]%asi,%l1	! %l1 = 0000000016627be4
!	Mem[0000000030001410] = ff4a8e7a, %l7 = ffffffffffa56439
	ldswa	[%i0+%o5]0x81,%l7	! %l7 = ffffffffff4a8e7a
!	Mem[0000000010081400] = 00000078, %f17 = 78000000
	lda	[%i2+%g0]0x80,%f17	! %f17 = 00000078
!	Mem[0000000021800080] = 006c3e7c, %l4 = 00000000fc1eb538
	ldsba	[%o3+0x081]%asi,%l4	! %l4 = 000000000000006c
!	Mem[0000000010101430] = 9504e03ad37a8e6c, %l0 = 34739b37ef78fd02
	ldx	[%i4+0x030],%l0		! %l0 = 9504e03ad37a8e6c
!	Mem[00000000100c1408] = 000000ff, %f20 = ff000000
	lda	[%i3+%o4]0x88,%f20	! %f20 = 000000ff
!	Mem[0000000030101408] = ff000000, %l1 = 0000000016627be4
	ldsha	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = ff000080, %l0 = 9504e03ad37a8e6c
	lduba	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010141400] = ff000000
	stha	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = ff0000ff

p0_label_94:
!	%f30 = ff1de8de 000000f8, %l3 = 16627be4ff2770d4
!	Mem[0000000030081438] = cb2597ce1c8a888c
	add	%i2,0x038,%g1
	stda	%f30,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030081438] = cb2500cede8a1dff
!	Mem[0000000010181410] = 1bf4f8dc, %l4 = 000000000000006c
	swapa	[%i6+%o5]0x88,%l4	! %l4 = 000000001bf4f8dc
!	%l4 = 000000001bf4f8dc, Mem[0000000010001428] = 00000000, %asi = 80
	stba	%l4,[%i0+0x028]%asi	! Mem[0000000010001428] = dc000000
!	%f8  = 0db79c36 c750ee45, Mem[0000000010141410] = 00000000 57ff0000
	stda	%f8 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 0db79c36 c750ee45
!	Mem[0000000010101400] = 000000ff, %l3 = 16627be4ff2770d4
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l4 = 000000001bf4f8dc, Mem[00000000300c1400] = ff000000
	stha	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = f8dc0000
!	%l7 = ffffffffff4a8e7a, Mem[0000000010001400] = ff000000ff000000
	stxa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffffff4a8e7a
!	Mem[000000001018141d] = 3fd45bb1, %l5 = 0000000072e701c0
	ldstub	[%i6+0x01d],%l5		! %l5 = 000000d4000000ff
!	Mem[00000000100c1418] = 4db665b1, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x018]%asi,%l0	! %l0 = 000000004db665b1
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 0000ffffffa56439, %f20 = 000000ff ff269c42
	ldda	[%i0+%o4]0x81,%f20	! %f20 = 0000ffff ffa56439

p0_label_95:
!	Mem[0000000010101408] = 00000021, %l4 = 000000001bf4f8dc
	lduwa	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000021
!	Mem[0000000030001410] = ff4a8e7a, %l1 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ff4a8e7a
!	Mem[0000000010141408] = 4969f3adff5bdc77, %l3 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l3	! %l3 = 4969f3adff5bdc77
!	Mem[0000000030101410] = 32c04360 84000000, %l6 = 0000ffff, %l7 = ff4a8e7a
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 0000000084000000 0000000032c04360
!	Mem[0000000010101400] = ff0000ff0000005b, %l4 = 0000000000000021
	ldxa	[%i4+%g0]0x80,%l4	! %l4 = ff0000ff0000005b
!	Mem[0000000010001410] = ef78fd02, %l0 = 000000004db665b1
	ldsba	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000002
!	Mem[0000000030141408] = 000000ff, %l6 = 0000000084000000
	lduwa	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141424] = e55419d1, %l2 = 00000000000000ff
	ldswa	[%i5+0x024]%asi,%l2	! %l2 = ffffffffe55419d1
!	Mem[0000000010141400] = ff0000ff, %l3 = 4969f3adff5bdc77
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = ffffffffff0000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000d4, %l6 = 00000000000000ff, %l6  = 00000000000000ff
	mulx	%l5,%l6,%l6		! %l6 = 000000000000d32c

p0_label_96:
!	%f2  = fc1eb538, Mem[0000000010041410] = ff2770d4
	sta	%f2 ,[%i1+%o5]0x88	! Mem[0000000010041410] = fc1eb538
!	%l2 = e55419d1, %l3 = ff0000ff, Mem[00000000300c1410] = 000000ff ff366b43
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = e55419d1 ff0000ff
!	%l4 = 0000005b, %l5 = 000000d4, Mem[0000000030001408] = 0000ffff ffa56439
	stda	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000005b 000000d4
!	Mem[0000000010101400] = ff0000ff, %l2 = e55419d1, %l4 = 0000005b
	casa	[%i4]0x80,%l2,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010041408] = 69000000, %l7 = 0000000032c04360
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 0000000069000000
!	%l5 = 00000000000000d4, Mem[0000000010141408] = 4969f3ad
	stwa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000d4
!	%f12 = 00000000, Mem[0000000030041400] = 8ae45f69
	sta	%f12,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%l6 = 000000000000d32c, immd = fffffffffffff21b, %l7  = 0000000069000000
	mulx	%l6,-0xde5,%l7		! %l7 = fffffffff489dda4
!	Mem[0000000010181408] = 800000ff, %l0 = 0000000000000002
	ldstuba	[%i6+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 000071ff, %l6 = 000000000000d32c
	lduha	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_97:
!	Mem[0000000030001408] = 0000005b, %f21 = ffa56439
	lda	[%i0+%o4]0x81,%f21	! %f21 = 0000005b
!	%l5 = 00000000000000d4, %l7 = fffffffff489dda4, %y  = 01cb64e8
	udiv	%l5,%l7,%l2		! %l2 = 0000000001e0ed05
	mov	%l0,%y			! %y = 000000ff
!	Mem[00000000300c1408] = 800000ff, %l5 = 00000000000000d4
	lduba	[%i3+%o4]0x89,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (20)
!	Mem[00000000300c1400] = f8dc0000 00000000 ff000080 f2000000
!	Mem[00000000300c1410] = d11954e5 ff0000ff b62c8ce5 fc90520c
!	Mem[00000000300c1420] = 89d516c4 abc26868 3b341992 88ef9f08
!	Mem[00000000300c1430] = 6f143112 cf54a533 981cc911 3850cf48
	ldda	[%i3]ASI_BLK_AIUSL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010001400] = ff4a8e7a, %l0 = 00000000000000ff
	ldsba	[%i0+%g0]0x88,%l0	! %l0 = 000000000000007a
!	Mem[0000000010081400] = 78000000, %l7 = fffffffff489dda4
	ldswa	[%i2+%g0]0x88,%l7	! %l7 = 0000000078000000
!	Mem[0000000010001408] = ff000000 000000ff, %l6 = 00000000, %l7 = 78000000
	ldd	[%i0+%o4],%l6		! %l6 = 00000000ff000000 00000000000000ff
!	Mem[0000000030101408] = fc1eb538ff000000, %f12 = 00000000 00000000
	ldda	[%i4+%o4]0x89,%f12	! %f12 = fc1eb538 ff000000
!	Mem[00000000300c1400] = f8dc0000, %l1 = 00000000ff4a8e7a
	lduha	[%i3+%g0]0x81,%l1	! %l1 = 000000000000f8dc
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ff0000ff, Mem[0000000030041408] = ff000080
	stwa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = ff0000ff

p0_label_98:
!	Mem[0000000010141414] = 369cb70d, %l6 = 00000000ff000000
	ldstub	[%i5+0x014],%l6		! %l6 = 00000036000000ff
!	%l3 = ffffffffff0000ff, Mem[00000000100c1424] = d0a127ff
	stw	%l3,[%i3+0x024]		! Mem[00000000100c1424] = ff0000ff
!	Mem[00000000300c1410] = e55419d1, %l1 = 000000000000f8dc
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 00000000e55419d1
!	Mem[0000000010141410] = c750ee45, %l7 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 00000045000000ff
!	%l6 = 0000000000000036, Mem[0000000030181408] = ffff00a5
	stba	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 36ff00a5
!	%l2 = 0000000001e0ed05, Mem[00000000201c0000] = ffffeaae
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = ed05eaae
	membar	#Sync			! Added by membar checker (21)
!	%f1  = 000000ff, Mem[00000000300c1400] = f8dc0000
	sta	%f1 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff
!	Mem[0000000030141410] = fc1eb538, %l7 = 0000000000000045
	ldsba	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000038
!	Mem[0000000030001400] = 00000000, %l2 = 0000000001e0ed05
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 78000000, %l0 = 000000000000007a
	ldsba	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000

p0_label_99:
!	Mem[0000000030001400] = 000000ff, %l7 = 0000000000000038
	lduwa	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000036, %l7 = 000000ff, Mem[0000000010141410] = c750eeff 0db79cff
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000036 000000ff
!	Mem[0000000030141408] = 57ff0000 000000ff, %l4 = ff0000ff, %l5 = 000000ff
	ldda	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ff 0000000057ff0000
!	Mem[0000000030001400] = ff000000, %l2 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l2	! %l2 = 00000000ff000000
!	Mem[00000000300c1410] = ff0000ff0000f8dc, %f2  = fc1eb538 ff000000
	ldda	[%i3+%o5]0x89,%f2 	! %f2  = ff0000ff 0000f8dc
!	Mem[0000000030041400] = 00000000, %l0 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 00000021, %l5 = 0000000057ff0000
	ldswa	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000021
!	Mem[0000000030041410] = ff000000ff269c42, %l7 = 00000000000000ff
	ldxa	[%i1+%o5]0x81,%l7	! %l7 = ff000000ff269c42
!	Mem[0000000010041428] = 0000f04a7e610554, %l2 = 00000000ff000000
	ldx	[%i1+0x028],%l2		! %l2 = 0000f04a7e610554
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000036, Mem[0000000030181410] = ff540000
	stba	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 36540000

p0_label_100:
!	%f4  = 32c04360, Mem[0000000030141408] = ff000000
	sta	%f4 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 32c04360
!	%l1 = 00000000e55419d1, Mem[0000000010081412] = 4c000000, %asi = 80
	stba	%l1,[%i2+0x012]%asi	! Mem[0000000010081410] = 4c00d100
!	%f10 = 22d7337e 00000000, %l6 = 0000000000000036
!	Mem[0000000010181438] = ff1de8de000000f8
	add	%i6,0x038,%g1
	stda	%f10,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010181438] = ff1de8de7e33d722
!	%l4 = 00000000000000ff, Mem[00000000100c1410] = 32000000
	stha	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00ff0000
!	Mem[0000000030141408] = 6043c032, %l1 = 00000000e55419d1
	swapa	[%i5+%o4]0x89,%l1	! %l1 = 000000006043c032
!	%l3 = ffffffffff0000ff, Mem[0000000010101426] = 7a78b8d6, %asi = 80
	stba	%l3,[%i4+0x026]%asi	! Mem[0000000010101424] = 7a78ffd6
!	%l1 = 000000006043c032, %l0 = 0000000000000000, %y  = 000000ff
	sdiv	%l1,%l0,%l6		! %l6 = 0000000000000036
	mov	%l0,%y			! %y = 00000028
!	%l2 = 7e610554, %l3 = ff0000ff, Mem[0000000010081410] = 00d1004c c3000000
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 7e610554 ff0000ff
!	Mem[0000000030081400] = ffffffff, %l0 = 0000000000000028
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = a500ff36, %l1 = 000000006043c032
	ldswa	[%i6+%o4]0x89,%l1	! %l1 = ffffffffa500ff36

p0_label_101:
!	Mem[0000000010081408] = 000071ff, %l6 = 0000000000000036
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081430] = 57e0ee45, %l6 = 0000000000000000
	lduwa	[%i2+0x030]%asi,%l6	! %l6 = 0000000057e0ee45
!	Mem[0000000010041408] = 6043c032 ff000000, %l6 = 57e0ee45, %l7 = ff269c42
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 000000006043c032 00000000ff000000
!	Code Fragment 4
p0_fragment_21:
!	%l0 = 00000000000000ff
	setx	0x25b3bc3fbe73c3fb,%g7,%l0 ! %l0 = 25b3bc3fbe73c3fb
!	%l1 = ffffffffa500ff36
	setx	0x9832c98fb248d9e7,%g7,%l1 ! %l1 = 9832c98fb248d9e7
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 25b3bc3fbe73c3fb
	setx	0x67b225b86c8b3eb6,%g7,%l0 ! %l0 = 67b225b86c8b3eb6
!	%l1 = 9832c98fb248d9e7
	setx	0x3164690804b3002f,%g7,%l1 ! %l1 = 3164690804b3002f
!	Mem[0000000030041410] = 000000ff, %l0 = 67b225b86c8b3eb6
	lduba	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = fc1eb538, %l5 = 0000000000000021
	ldsba	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000038
!	Mem[0000000010001424] = 000000ff, %l3 = ffffffffff0000ff
	lduw	[%i0+0x024],%l3		! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000000000ff, %l3 = 00000000000000ff
	ldxa	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = 6c000000ff269c42, %f26 = 089fef88 9219343b
	ldda	[%i6+%o5]0x80,%f26	! %f26 = 6c000000 ff269c42
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000030141400] = 1bf4f8dc053b2c10
	stxa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000000000ff

p0_label_102:
!	Mem[0000000010141428] = 6b6a62a09aea71c3, %l3 = 00000000000000ff, %l5 = 0000000000000038
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = 6b6a62a09aea71c3
!	Mem[0000000030101408] = ff000000, %l7 = 00000000ff000000
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c140b] = ff000000, %l5 = 6b6a62a09aea71c3
	ldstub	[%i3+0x00b],%l5		! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l6 = 000000006043c032
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000030101400] = 000000ff
	stba	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	%l3 = 00000000000000ff, Mem[0000000021800101] = eaff7eb5, %asi = 80
	stba	%l3,[%o3+0x101]%asi	! Mem[0000000021800100] = eaff7eb5
!	Mem[0000000030081400] = ffffffff, %l2 = 0000f04a7e610554
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[00000000211c0000] = 71ff4b99, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff4b99
!	%l7 = 0000000000000000, Mem[0000000030141400] = 00000000
	stba	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 000071ff, %l5 = 0000000000000000
	ldsb	[%i2+0x00b],%l5		! %l5 = ffffffffffffffff

p0_label_103:
!	Mem[0000000030141408] = e55419d1, %l0 = 00000000000000ff
	lduwa	[%i5+%o4]0x89,%l0	! %l0 = 00000000e55419d1
!	Mem[0000000010081400] = 00000078, %l3 = 00000000000000ff
	lduba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = ff0000ff38b51efc, %l6 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l6	! %l6 = ff0000ff38b51efc
!	Mem[0000000020800000] = 00e55b63, %l7 = 0000000000000000
	ldub	[%o1+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010181408] = ff000080, %l3 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141400] = 00000000, %f9  = c750ee45
	lda	[%i5+%g0]0x81,%f9 	! %f9 = 00000000
!	Mem[0000000010081408] = ff710000, %f4  = 32c04360
	lda	[%i2+%o4]0x88,%f4 	! %f4 = ff710000
!	Mem[0000000030181400] = ffa56439, %l1 = 3164690804b3002f
	ldswa	[%i6+%g0]0x81,%l1	! %l1 = ffffffffffa56439
!	Mem[00000000201c0000] = ed05eaae, %l0 = 00000000e55419d1
	ldsh	[%o0+%g0],%l0		! %l0 = ffffffffffffed05
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000010101400] = ff0000ff 5b000000
	stda	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff ffffffff

p0_label_104:
!	%l1 = ffffffffffa56439, Mem[0000000030181400] = ffa56439
	stwa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = ffa56439
!	%f14 = 77dc5bff adf36949, %l3 = 00000000000000ff
!	Mem[0000000010181438] = ff1de8de7e33d722
	add	%i6,0x038,%g1
	stda	%f14,[%g1+%l3]ASI_PST8_P ! Mem[0000000010181438] = 77dc5bffadf36949
!	%l0 = ffffed05, %l1 = ffa56439, Mem[0000000010181420] = 00000000 5405617e
	stda	%l0,[%i6+0x020]%asi	! Mem[0000000010181420] = ffffed05 ffa56439
!	Mem[0000000010041410] = 38b51efc, %l5 = ffffffffffffffff, %asi = 80
	swapa	[%i1+0x010]%asi,%l5	! %l5 = 0000000038b51efc
!	%l2 = 00000000000000ff, Mem[0000000030081408] = ff1de8de000000f8
	stxa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000ff
!	%f21 = e55419d1, Mem[0000000030141408] = e55419d1
	sta	%f21,[%i5+%o4]0x89	! Mem[0000000030141408] = e55419d1
!	Mem[0000000010141400] = ff0000ff, %l4 = 00000000000000ff
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010001400] = ff4a8e7a, %l6 = ff0000ff38b51efc
	ldstuba	[%i0+%g0]0x88,%l6	! %l6 = 0000007a000000ff
!	%l4 = 00000000000000ff, Mem[0000000030181410] = 36540000a69ebf0f
	stxa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%l2 = 00000000000000ff, Mem[00000000218001c0] = 2934eec2
	sth	%l2,[%o3+0x1c0]		! Mem[00000000218001c0] = 00ffeec2

p0_label_105:
!	Mem[0000000030141408] = d11954e5, %l6 = 000000000000007a
	ldswa	[%i5+%o4]0x81,%l6	! %l6 = ffffffffd11954e5
!	Mem[0000000010081400] = 78000000, %l2 = 00000000000000ff
	ldsha	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = 6c000000ff269c42, %l2 = 0000000000000000
	ldx	[%i6+%o5],%l2		! %l2 = 6c000000ff269c42
!	Mem[0000000030181400] = 000000003964a5ff, %f28 = 33a554cf 1231146f
	ldda	[%i6+%g0]0x89,%f28	! %f28 = 00000000 3964a5ff
!	Mem[0000000010141400] = ff27a1d0 ff0000ff, %l0 = ffffed05, %l1 = ffa56439
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 00000000ff0000ff 00000000ff27a1d0
!	Mem[0000000010001410] = ef78fd02, %f28 = 00000000
	lda	[%i0+%o5]0x88,%f28	! %f28 = ef78fd02
!	Mem[0000000010081408] = ff710000, %l1 = 00000000ff27a1d0
	lduba	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 6c000000, %l0 = 00000000ff0000ff
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000006c00
!	Mem[0000000010181410] = 6c000000, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 000000000000006c
!	Starting 10 instruction Store Burst
!	%f13 = ff000000, Mem[0000000010041400] = 000000ff
	sta	%f13,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000

p0_label_106:
!	%l0 = 0000000000006c00, Mem[0000000010041400] = e8fff1b8ff000000
	stxa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000006c00
!	%l1 = 0000000000000000, Mem[00000000201c0001] = ed05eaae, %asi = 80
	stba	%l1,[%o0+0x001]%asi	! Mem[00000000201c0000] = ed00eaae
!	%l2 = 6c000000ff269c42, Mem[00000000100c1401] = ff000000
	stb	%l2,[%i3+0x001]		! Mem[00000000100c1400] = ff420000
!	%l0 = 00006c00, %l1 = 00000000, Mem[0000000010081400] = 00000078 695fe48a
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00006c00 00000000
!	%l2 = 6c000000ff269c42, imm = 0000000000000983, %l4 = 00000000000000ff
	andn	%l2,0x983,%l4		! %l4 = 6c000000ff269440
!	%l0 = 0000000000006c00, Mem[0000000030101410] = 00000084
	stba	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000084
!	Mem[0000000010141400] = ff0000ff, %l3 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l2 = 6c000000ff269c42, Mem[0000000030081400] = ffffffff
	stba	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 42ffffff
!	%f28 = ef78fd02 3964a5ff, %l2 = 6c000000ff269c42
!	Mem[0000000010141418] = 7448f194c0a55d7e
	add	%i5,0x018,%g1
	stda	%f28,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010141418] = 74a5f194c0a5787e
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = 000000ff, %l3 = 00000000000000ff
	ldswa	[%i0+0x024]%asi,%l3	! %l3 = 00000000000000ff

p0_label_107:
!	Mem[0000000010141400] = ff0000ff, %l1 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 00000000ff0000ff
!	Mem[0000000010001408] = 000000ff, %l5 = 0000000038b51efc
	ldsha	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141400] = ff00000000000000, %f12 = fc1eb538 ff000000
	ldda	[%i5+%g0]0x89,%f12	! %f12 = ff000000 00000000
!	Mem[0000000030041410] = 000000ff, %l3 = 00000000000000ff
	lduha	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l6 = ffffffffd11954e5, imm = 0000000000000e13, %l4 = 6c000000ff269440
	and	%l6,0xe13,%l4		! %l4 = 0000000000000401
!	Mem[00000000218001c0] = 00ffeec2, %l7 = 000000000000006c
	lduha	[%o3+0x1c0]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1408] = 800000ff, %l3 = 00000000000000ff
	lduha	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081408] = 000071ff, %l1 = 00000000ff0000ff
	lduwa	[%i2+%o4]0x80,%l1	! %l1 = 00000000000071ff
!	%l7 = 00000000000000ff, %l2 = 6c000000ff269c42, %y  = 00000028
	umul	%l7,%l2,%l2		! %l2 = 000000fe2775a5be, %y = 000000fe
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[00000000300c1400] = ff000000
	stha	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff0000ff

p0_label_108:
!	%l2 = 2775a5be, %l3 = 000000ff, Mem[0000000010001400] = ff8e4aff ffffffff
	stda	%l2,[%i0+0x000]%asi	! Mem[0000000010001400] = 2775a5be 000000ff
!	Mem[0000000030041410] = ff000000, %l3 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[00000000211c0000] = 00ff4b99
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 00004b99
!	%l3 = 00000000ff000000, Mem[00000000300c1410] = dcf80000
	stha	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Mem[00000000100c143c] = 7b3c982e, %l5 = 00000000000000ff
	swap	[%i3+0x03c],%l5		! %l5 = 000000007b3c982e
!	%l4 = 0000000000000401, Mem[0000000010001400] = 2775a5be000000ff
	stxa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000401
!	Mem[00000000100c140c] = 00000000, %l7 = 000000ff, %l5 = 7b3c982e
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 0000000000000000
!	%l3 = 00000000ff000000, Mem[0000000010041430] = 16627be4
	stw	%l3,[%i1+0x030]		! Mem[0000000010041430] = ff000000
!	Mem[00000000300c1400] = ff0000ff, %l6 = ffffffffd11954e5
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = 57e0ee45, %l7 = 00000000000000ff
	ldsha	[%i2+0x030]%asi,%l7	! %l7 = 00000000000057e0

p0_label_109:
!	Mem[0000000010101410] = 6e840000, %f7  = 1afba657
	lda	[%i4+0x010]%asi,%f7 	! %f7 = 6e840000
!	Mem[0000000030001400] = ff000000, %l5 = 0000000000000000
	ldsha	[%i0+%g0]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000030081408] = ff000000, %f28 = ef78fd02
	lda	[%i2+%o4]0x81,%f28	! %f28 = ff000000
!	Mem[0000000030141408] = d11954e5, %l1 = 00000000000071ff
	ldswa	[%i5+%o4]0x81,%l1	! %l1 = ffffffffd11954e5
!	Mem[0000000030001410] = 7a8e4aff, %l3 = 00000000ff000000
	lduwa	[%i0+%o5]0x89,%l3	! %l3 = 000000007a8e4aff
!	%l3 = 000000007a8e4aff, imm = 000000000000038d, %l0 = 0000000000006c00
	addc	%l3,0x38d,%l0		! %l0 = 000000007a8e4e8c
!	Mem[0000000030001410] = ff4a8e7ab4e6d098, %f30 = 48cf5038 11c91c98
	ldda	[%i0+%o5]0x81,%f30	! %f30 = ff4a8e7a b4e6d098
!	Mem[0000000010041420] = b6366b43, %l6 = 00000000000000ff
	lduha	[%i1+0x022]%asi,%l6	! %l6 = 0000000000006b43
!	Mem[0000000021800080] = 006c3e7c, %l0 = 000000007a8e4e8c
	lduba	[%o3+0x081]%asi,%l0	! %l0 = 000000000000006c
!	Starting 10 instruction Store Burst
!	%l3 = 000000007a8e4aff, Mem[0000000010001408] = ff000000000000ff
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000007a8e4aff

p0_label_110:
!	%l7 = 00000000000057e0, Mem[0000000030181400] = 000000003964a5ff
	stxa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000000057e0
!	%f19 = 800000ff, Mem[0000000030081408] = 000000ff
	sta	%f19,[%i2+%o4]0x89	! Mem[0000000030081408] = 800000ff
!	Mem[0000000030001400] = ff000000, %l4 = 0000000000000401
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010181408] = 800000ff, %l4 = 00000000ff000000
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 00000000800000ff
!	Mem[0000000010141408] = 000000d4, %l5 = ffffffffffffff00
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000d4
!	%f20 = ff0000ff e55419d1, %l5 = 00000000000000d4
!	Mem[0000000010041400] = 006c000000000000
	stda	%f20,[%i1+%l5]ASI_PST32_PL ! Mem[0000000010041400] = 006c000000000000
!	Mem[0000000030041400] = 00000000, %l7 = 00000000000057e0
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101431] = 9504e03a, %l6 = 0000000000006b43
	ldstuba	[%i4+0x031]%asi,%l6	! %l6 = 00000004000000ff
!	%f16 = 00000000 0000dcf8 000000f2 800000ff
!	%f20 = ff0000ff e55419d1 0c5290fc e58c2cb6
!	%f24 = 6868c2ab c416d589 6c000000 ff269c42
!	%f28 = ff000000 3964a5ff ff4a8e7a b4e6d098
	stda	%f16,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000800000ff
	lduha	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000

p0_label_111:
!	Mem[00000000211c0000] = 00004b99, %l1 = ffffffffd11954e5
	lduba	[%o2+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = 98d0e6b4 7a8e4aff, %l6 = 00000004, %l7 = 00000000
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 000000007a8e4aff 0000000098d0e6b4
!	Mem[0000000030181410] = 00000000, %l6 = 000000007a8e4aff
	lduba	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = 000071ff, %l4 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 5405617eff0000ff, %f10 = 22d7337e 00000000
	ldda	[%i2+%o5]0x80,%f10	! %f10 = 5405617e ff0000ff
!	Mem[0000000030081410] = 00000078, %l7 = 0000000098d0e6b4
	ldswa	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000078
!	Mem[0000000010041410] = 00000000 ffffffff, %l4 = 00000000, %l5 = 000000d4
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Mem[0000000010081400] = 00006c00, %l6 = 0000000000000000
	ldsha	[%i2+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = 36000000, %f9  = 00000000
	lda	[%i5+%o5]0x80,%f9 	! %f9 = 36000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffffffff, Mem[0000000030081400] = 42ffffffffffffc3
	stxa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000ffffffff

p0_label_112:
!	%l1 = 0000000000000000, Mem[0000000030101400] = f8dc0000
	stha	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Mem[0000000030041400] = e0570000, %l3 = 000000007a8e4aff
	swapa	[%i1+%g0]0x89,%l3	! %l3 = 00000000e0570000
!	%l3 = 00000000e0570000, Mem[00000000201c0001] = ed00eaae, %asi = 80
	stba	%l3,[%o0+0x001]%asi	! Mem[00000000201c0000] = ed00eaae
!	Mem[00000000100c1410] = 00ff0000, %l7 = 0000000000000078
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000010101410] = 6e840000 00000000
	std	%l4,[%i4+%o5]		! Mem[0000000010101410] = ffffffff 00000000
!	%l7 = 0000000000000000, Mem[0000000030041408] = ff0000ff
	stba	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff
!	Mem[0000000030181410] = 00000000, %l4 = 00000000ffffffff
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l0 = 000000000000006c, Mem[0000000010141410] = 00000036
	stha	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000006c
!	%l1 = 0000000000000000, Mem[000000001014140f] = ff5bdc77
	stb	%l1,[%i5+0x00f]		! Mem[000000001014140c] = ff5bdc00
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00004b99, %l7 = 0000000000000000
	ldsh	[%o2+%g0],%l7		! %l7 = 0000000000000000

p0_label_113:
!	Mem[0000000010141428] = 6b6a62a09aea71c3, %l6 = 0000000000000000
	ldx	[%i5+0x028],%l6		! %l6 = 6b6a62a09aea71c3
!	Mem[0000000010041400] = 006c0000, %l7 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l7	! %l7 = 00000000006c0000
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010101418] = 1bf4f8dc 053b7086, %l4 = 00000000, %l5 = 00000000
	ldd	[%i4+0x018],%l4		! %l4 = 000000001bf4f8dc 00000000053b7086
!	Mem[0000000010181408] = ff000000, %l1 = 0000000000000000
	lduba	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101438] = 37bb86bf 48972b83, %l2 = 2775a5be, %l3 = e0570000
	ldd	[%i4+0x038],%l2		! %l2 = 0000000037bb86bf 0000000048972b83
!	Mem[0000000030041410] = ff000000, %l4 = 000000001bf4f8dc
	lduwa	[%i1+%o5]0x89,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030081410] = 00000078, %l1 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 0104000000000000, %l2 = 0000000037bb86bf
	ldxa	[%i0+%g0]0x88,%l2	! %l2 = 0104000000000000
!	Mem[0000000030001400] = 00000401, %l4 = 00000000ff000000
	lduba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stba	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000

p0_label_114:
!	%l7 = 00000000006c0000, Mem[0000000030001408] = 5b000000
	stwa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 006c0000
!	Mem[0000000030041408] = ff000000, %l7 = 00000000006c0000
	ldstuba	[%i1+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181434] = 800000ff, %l7 = 00000000, %l3 = 48972b83
	add	%i6,0x34,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000800000ff
!	Mem[00000000300c1400] = ff0000ff, %l5 = 00000000053b7086
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030041408] = ff0000ff, %l2 = 0104000000000000
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[000000001000141d] = 24ff598d, %l6 = 6b6a62a09aea71c3
	ldstuba	[%i0+0x01d]%asi,%l6	! %l6 = 000000ff000000ff
!	%f23 = e58c2cb6, Mem[00000000100c1400] = 000042ff
	sta	%f23,[%i3+%g0]0x88	! Mem[00000000100c1400] = e58c2cb6
!	Mem[0000000010141410] = 0000006c, %l2 = 00000000000000ff
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 000000000000006c
!	%f1  = 000000ff, %f31 = b4e6d098, %f0  = 00000000
	fadds	%f1 ,%f31,%f0 		! %l0 = 000000000000008e, Unfinished, %fsr = 2900000800
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff4a8e7a 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000 00000000ff4a8e7a

p0_label_115:
!	Mem[00000000100c1408] = ff0000ff, %l7 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010081408] = 000000f0ff710000, %l7 = ffffffffffffff00
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = 000000f0ff710000
!	Mem[0000000010081400] = 00006c00 00000000, %l2 = 0000006c, %l3 = 800000ff
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 0000000000006c00 0000000000000000
!	Mem[0000000030041408] = ff0000ff f2000000, %l0 = 0000008e, %l1 = 00000000
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 00000000ff0000ff 00000000f2000000
!	Mem[0000000030181400] = e0570000, %l5 = 00000000ff4a8e7a
	ldsha	[%i6+%g0]0x81,%l5	! %l5 = ffffffffffffe057
!	Mem[0000000010181410] = 6c000000, %l7 = 000000f0ff710000
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 000000006c000000
!	Mem[0000000010081410] = 5405617e, %l2 = 0000000000006c00
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 0000000000005405
!	Mem[0000000010141410] = 000000ff, %l5 = ffffffffffffe057
	ldsba	[%i5+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	%f23 = e58c2cb6, %f12 = ff000000
	fcmps	%fcc0,%f23,%f12		! %fcc0 = 2
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ed00eaae, %l5 = ffffffffffffffff
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000ff

p0_label_116:
!	%f8  = 0db79c36, Mem[0000000030181408] = 36ff00a5
	sta	%f8 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 0db79c36
!	Mem[000000001000142e] = 00004aff, %l5 = 0000000000000000
	ldstuba	[%i0+0x02e]%asi,%l5	! %l5 = 0000004a000000ff
!	%l2 = 0000000000005405, Mem[0000000010041408] = 6043c032
	stba	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 0543c032
!	%f6  = 38b51efc 6e840000, %l3 = 0000000000000000
!	Mem[0000000010181408] = 000000fff2000000
	add	%i6,0x008,%g1
	stda	%f6,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010181408] = 000000fff2000000
!	%f16 = 00000000 0000dcf8, %l4 = 0000000000000000
!	Mem[0000000010081438] = 7f9995a9ffff2507
	add	%i2,0x038,%g1
	stda	%f16,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010081438] = 7f9995a9ffff2507
!	%l4 = 00000000, %l5 = 0000004a, Mem[00000000300c1410] = 00000000 ff0000ff
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 0000004a
!	Mem[0000000010141400] = ff0000ff, %l1 = 00000000f2000000
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 00000000ff0000ff
!	%l1 = 00000000ff0000ff, Mem[0000000030001400] = 0000008401040000
	stxa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000ff0000ff
!	%l6 = 00000000000000ff, Mem[0000000010001408] = 000000007a8e4aff
	stxa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000ff, %l1 = 00000000ff0000ff
	ldsha	[%i6+%o5]0x89,%l1	! %l1 = 00000000000000ff

p0_label_117:
!	Mem[00000000100c1420] = 0c0000ff ff0000ff, %l2 = 00005405, %l3 = 00000000
	ldd	[%i3+0x020],%l2		! %l2 = 000000000c0000ff 00000000ff0000ff
!	Mem[0000000010101400] = ff000000, %l5 = 000000000000004a
	lduwa	[%i4+%g0]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010141408] = ffffff00, %l0 = 00000000ff0000ff
	ldub	[%i5+0x009],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030181400] = e0570000, %l2 = 000000000c0000ff
	lduba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000e0
!	Mem[0000000030181410] = 000000ff, %f20 = ff0000ff
	lda	[%i6+%o5]0x89,%f20	! %f20 = 000000ff
!	Mem[0000000030141400] = 00000000, %l4 = 0000000000000000
	ldswa	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	%l3 = 00000000ff0000ff, imm = 0000000000000f7e, %l2 = 00000000000000e0
	subc	%l3,0xf7e,%l2		! %l2 = 00000000fefff181
!	Mem[0000000010181408] = 000000fff2000000, %l3 = 00000000ff0000ff
	ldxa	[%i6+%o4]0x80,%l3	! %l3 = 000000fff2000000
!	Mem[000000001008140c] = f0000000, %l5 = 00000000ff000000
	ldsha	[%i2+0x00c]%asi,%l5	! %l5 = fffffffffffff000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010141408] = ffffff00
	stwa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff

p0_label_118:
!	Mem[0000000010081408] = ff710000, %l7 = 000000006c000000
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000000000ff, imm = 0000000000000b81, %l3 = 000000fff2000000
	xor	%l6,0xb81,%l3		! %l3 = 0000000000000b7e
!	Mem[0000000010181400] = 00000000, %l1 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%f12 = ff000000 00000000, %l7 = 0000000000000000
!	Mem[0000000010001418] = 38b51efc24ff598d
	add	%i0,0x018,%g1
	stda	%f12,[%g1+%l7]ASI_PST32_P ! Mem[0000000010001418] = 38b51efc24ff598d
!	%f10 = 5405617e ff0000ff, Mem[0000000030001400] = ff0000ff 00000000
	stda	%f10,[%i0+%g0]0x81	! Mem[0000000030001400] = 5405617e ff0000ff
!	%l6 = 00000000000000ff, Mem[0000000010101410] = ffffffff
	stwa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	Mem[0000000030141408] = d11954e5, %l0 = 00000000000000ff
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 00000000d11954e5
!	%l0 = 00000000d11954e5, Mem[00000000211c0001] = 00004b99
	stb	%l0,[%o2+0x001]		! Mem[00000000211c0000] = 00e54b99
!	Code Fragment 4
p0_fragment_22:
!	%l0 = 00000000d11954e5
	setx	0x6b11ce5794258a46,%g7,%l0 ! %l0 = 6b11ce5794258a46
!	%l1 = 0000000000000000
	setx	0xb0d05b0010072626,%g7,%l1 ! %l1 = b0d05b0010072626
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6b11ce5794258a46
	setx	0x397cc5b0275ba447,%g7,%l0 ! %l0 = 397cc5b0275ba447
!	%l1 = b0d05b0010072626
	setx	0x1ec8403ff1e6bb78,%g7,%l1 ! %l1 = 1ec8403ff1e6bb78
!	Starting 10 instruction Load Burst
!	Mem[0000000010081434] = ff1de8ff, %l1 = 1ec8403ff1e6bb78
	lduh	[%i2+0x034],%l1		! %l1 = 000000000000ff1d

p0_label_119:
!	Mem[0000000030181408] = 0db79c36, %l5 = fffffffffffff000
	ldsha	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000db7
!	Mem[0000000010181410] = 0000006c, %l5 = 0000000000000db7
	lduha	[%i6+%o5]0x88,%l5	! %l5 = 000000000000006c
!	Mem[0000000030141400] = 00000000, %l3 = 0000000000000b7e
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = b62c8ce500000071, %f12 = ff000000 00000000
	ldda	[%i3+%g0]0x80,%f12	! %f12 = b62c8ce5 00000071
!	Mem[00000000300c1400] = 00000000 ff0000ff, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 00000000ff0000ff 0000000000000000
!	Mem[00000000300c1400] = 00000000 ff0000ff, %l4 = 00000000, %l5 = 0000006c
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 00000000ff0000ff 0000000000000000
!	Mem[00000000300c1400] = ff0000ff, %l5 = 0000000000000000
	ldswa	[%i3+%g0]0x81,%l5	! %l5 = ffffffffff0000ff
!	Mem[0000000030001400] = 5405617eff0000ff, %l5 = ffffffffff0000ff
	ldxa	[%i0+%g0]0x81,%l5	! %l5 = 5405617eff0000ff
!	%f6  = 38b51efc, %f31 = b4e6d098, %f17 = 0000dcf8
	fdivs	%f6 ,%f31,%f17		! %f17 = c348e248
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 000000f2, %l2 = 00000000fefff181
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000f2

p0_label_120:
!	Mem[0000000010001438] = 8ae45fdc, %l5 = ff0000ff, %l7 = 00000000
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 000000008ae45fdc
!	%l3 = 0000000000000000, Mem[0000000030041410] = 429c26ffff000000
	stxa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000000
!	Mem[0000000010141410] = ff000000, %l7 = 000000008ae45fdc
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	%f18 = 000000f2 800000ff, Mem[0000000030141408] = 000000ff 0000ff57
	stda	%f18,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000f2 800000ff
!	%f26 = 6c000000 ff269c42, Mem[0000000030181410] = 000000ff ff000000
	stda	%f26,[%i6+%o5]0x89	! Mem[0000000030181410] = 6c000000 ff269c42
!	%f0  = 00000000 000000ff ff0000ff 0000f8dc
!	%f4  = ff710000 84000000 38b51efc 6e840000
!	%f8  = 0db79c36 36000000 5405617e ff0000ff
!	%f12 = b62c8ce5 00000071 77dc5bff adf36949
	stda	%f0,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	%l4 = 00000000ff0000ff, Mem[0000000030141410] = 38b51efcc001e772
	stxa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000ff0000ff
	membar	#Sync			! Added by membar checker (23)
!	%l5 = 5405617eff0000ff, Mem[0000000010001410] = ef78fd02
	stha	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = ef7800ff
!	Mem[00000000300c1400] = ff0000ff, %l2 = 00000000000000f2
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 81f1fffe, %f19 = 800000ff
	ld	[%i5+%g0],%f19	! %f19 = 81f1fffe

p0_label_121:
!	Mem[0000000010101400] = ff000000 ffffffff 00000021 00000000
!	Mem[0000000010101410] = ff000000 00000000 1bf4f8dc 053b7086
!	Mem[0000000010101420] = ff2770d4 7a78ffd6 00000000 c750ee45
!	Mem[0000000010101430] = 95ffe03a d37a8e6c 37bb86bf 48972b83
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Mem[0000000030101408] = 000000f2800000ff, %l1 = 000000000000ff1d
	ldxa	[%i4+%o4]0x89,%l1	! %l1 = 000000f2800000ff
!	Mem[0000000010041410] = ffffffff, %l6 = 00000000ff0000ff
	ldsh	[%i1+0x012],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030041408] = ff0000ff, %l4 = 00000000ff0000ff
	ldsba	[%i1+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101410] = e55419d1, %l6 = ffffffffffffffff
	lduwa	[%i4+%o5]0x89,%l6	! %l6 = 00000000e55419d1
!	Mem[0000000010001408] = ff00000000000000, %f16 = 00000000 c348e248
	ldda	[%i0+%o4]0x88,%f16	! %f16 = ff000000 00000000
!	Mem[0000000030041400] = 7a8e4aff, %f22 = 0c5290fc
	lda	[%i1+%g0]0x89,%f22	! %f22 = 7a8e4aff
!	Mem[0000000030101410] = ff0000ffe55419d1, %f30 = ff4a8e7a b4e6d098
	ldda	[%i4+%o5]0x89,%f30	! %f30 = ff0000ff e55419d1
!	Mem[0000000010081400] = 00006c00, %l5 = 5405617eff0000ff
	ldswa	[%i2+%g0]0x80,%l5	! %l5 = 0000000000006c00
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000021800081] = 006c3e7c
	stb	%l4,[%o3+0x081]		! Mem[0000000021800080] = 00ff3e7c

p0_label_122:
!	%f30 = ff0000ff e55419d1, %l0 = 397cc5b0275ba447
!	Mem[0000000010041420] = b6366b4384bc058d
	add	%i1,0x020,%g1
	stda	%f30,[%g1+%l0]ASI_PST16_P ! Mem[0000000010041420] = b63600ffe55419d1
!	%l7 = 00000000000000ff, imm = fffffffffffff5c3, %l6 = 00000000e55419d1
	xor	%l7,-0xa3d,%l6		! %l6 = fffffffffffff53c
!	Mem[0000000030001408] = ff0000ff, %l6 = fffffffffffff53c
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010081410] = 7e610554, %l7 = 00000000000000ff
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 00000054000000ff
	membar	#Sync			! Added by membar checker (24)
!	%f28 = ff000000 3964a5ff, %l4 = ffffffffffffffff
!	Mem[0000000010101410] = ff00000000000000
	add	%i4,0x010,%g1
	stda	%f28,[%g1+%l4]ASI_PST32_P ! Mem[0000000010101410] = ff0000003964a5ff
!	Mem[0000000030181408] = 369cb70d, %l1 = 000000f2800000ff
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 00000000369cb70d
!	%l1 = 00000000369cb70d, Mem[0000000030101410] = d11954e5
	stwa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 369cb70d
!	Mem[00000000100c1400] = b62c8ce5, %l1 = 00000000369cb70d
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 000000b6000000ff
!	%f29 = 3964a5ff, %f19 = 81f1fffe, %f23 = e58c2cb6
	fdivs	%f29,%f19,%f23		! %f23 = f6f1e045
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000, %l0 = 397cc5b0275ba447
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff

p0_label_123:
!	Mem[0000000010041410] = ffffffff, %l7 = 0000000000000054
	lduwa	[%i1+%o5]0x88,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010141400] = fefff181, %l7 = 00000000ffffffff
	ldswa	[%i5+%g0]0x88,%l7	! %l7 = fffffffffefff181
!	%l2 = 00000000ff0000ff, %l2 = 00000000ff0000ff, %l4 = ffffffffffffffff
	xnor	%l2,%l2,%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = 81f1fffe, %f20 = 000000ff
	lda	[%i5+%g0]0x80,%f20	! %f20 = 81f1fffe
!	Mem[0000000010101408] = 00000021 00000000, %l4 = ffffffff, %l5 = 00006c00
	ldd	[%i4+%o4],%l4		! %l4 = 0000000000000021 0000000000000000
!	Mem[0000000030101408] = 800000ff, %l3 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001410] = ef7800ff, %f31 = e55419d1
	lda	[%i0+%o5]0x88,%f31	! %f31 = ef7800ff
!	Mem[0000000010181400] = ff000000, %l3 = ffffffffffffffff
	lduba	[%i6+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[000000001018140c] = f2000000, %f1  = ffffffff
	ld	[%i6+0x00c],%f1 	! %f1 = f2000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001418] = 38b51efc, %l5 = 0000000000000000
	swap	[%i0+0x018],%l5		! %l5 = 0000000038b51efc

p0_label_124:
!	%f18 = 000000f2 81f1fffe, %l2 = 00000000ff0000ff
!	Mem[0000000010041428] = 0000f04a7e610554
	add	%i1,0x028,%g1
	stda	%f18,[%g1+%l2]ASI_PST8_P ! Mem[0000000010041428] = 000000f281f1fffe
!	%f9  = 7a78ffd6, %f23 = f6f1e045, %f24 = 6868c2ab
	fdivs	%f9 ,%f23,%f24		! %f24 = c303c506
!	%f3  = 00000000, Mem[0000000010081408] = ff0071ff
	sta	%f3 ,[%i2+0x008]%asi	! Mem[0000000010081408] = 00000000
!	%l1 = 00000000000000b6, Mem[00000000300c1408] = ff000080
	stha	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00b60080
!	Mem[0000000010081408] = 00000000, %l7 = fffffffffefff181
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = ff000080, %l5 = 0000000038b51efc
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 00000000ff000080
!	%f8  = ff2770d4, %f29 = 3964a5ff, %f1  = f2000000
	fsubs	%f8 ,%f29,%f1 		! %f1  = ff2770d4
!	%l5 = 00000000ff000080, Mem[0000000030081408] = 800000ff
	stha	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 80000080
!	Mem[0000000010181400] = ff000000, %l0 = 00000000000000ff
	lduha	[%i6+%g0]0x80,%l0	! %l0 = 000000000000ff00
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000ffff, %l2 = 00000000ff0000ff
	lduwa	[%i3+%o5]0x88,%l2	! %l2 = 000000000000ffff

p0_label_125:
!	Mem[0000000010001410] = ff0078ef379b7334, %l7 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l7	! %l7 = ff0078ef379b7334
!	Mem[00000000201c0000] = edffeaae, %l4 = 0000000000000021
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffedff
!	Mem[0000000030101408] = 000000f2fc1eb538, %l4 = ffffffffffffedff
	ldxa	[%i4+%o4]0x89,%l4	! %l4 = 000000f2fc1eb538
!	Mem[0000000010181400] = 000000ff, %l6 = 00000000000000ff
	lduha	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101410] = ff000000, %l2 = 000000000000ffff
	ldswa	[%i4+%o5]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010081410] = ff05617eff0000ff, %l4 = 000000f2fc1eb538
	ldxa	[%i2+%o5]0x80,%l4	! %l4 = ff05617eff0000ff
!	Mem[0000000030101408] = fc1eb538, %l5 = 00000000ff000080
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000038
!	Mem[0000000010081400] = 006c0000, %l1 = 00000000000000b6
	lduba	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = ff000000, %l1 = 0000000000000000
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 21000000, %l5 = 0000000000000038
	swapa	[%i4+%o4]0x88,%l5	! %l5 = 0000000021000000

p0_label_126:
!	%l4 = ff05617eff0000ff, Mem[000000001018140c] = f2000000, %asi = 80
	stwa	%l4,[%i6+0x00c]%asi	! Mem[000000001018140c] = ff0000ff
!	%f13 = d37a8e6c, %f4  = ff000000, %f10 = 00000000 c750ee45
	fsmuld	%f13,%f4 ,%f10		! %f10 = 4a5f51cd 80000000
!	%f6  = 1bf4f8dc, Mem[0000000030181408] = ff000080
	sta	%f6 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 1bf4f8dc
!	Mem[00000000201c0000] = edffeaae, %l2 = ffffffffff000000
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 000000ed000000ff
!	Mem[0000000010001408] = 00000000, %l6 = 000000ff, %l4 = ff0000ff
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 0000000000000000
!	%f24 = c303c506, Mem[0000000010101400] = ff000000
	sta	%f24,[%i4+%g0]0x80	! Mem[0000000010101400] = c303c506
!	%l5 = 0000000021000000, Mem[00000000100c1410] = ffff0000
	stha	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	%l1 = 00000000ff000000, Mem[0000000010041400] = 006c0000
	stha	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Mem[0000000021800081] = 00ff3e7c, %l4 = 0000000000000000
	ldstub	[%o3+0x081],%l4		! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = 57e0ee45ff1de8ff, %f0  = ff000000 ff2770d4
	ldda	[%i2+0x030]%asi,%f0 	! %f0  = 57e0ee45 ff1de8ff

p0_label_127:
!	%f31 = ef7800ff, %f8  = ff2770d4 7a78ffd6
	fstod	%f31,%f8 		! %f8  = c5ef001f e0000000
!	Mem[0000000010181428] = a69ebf0f, %l3 = 00000000000000ff
	lduh	[%i6+0x028],%l3		! %l3 = 000000000000a69e
!	Mem[0000000030001400] = 00000000, %l2 = 00000000000000ed
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041424] = e55419d1, %l7 = ff0078ef379b7334
	lduh	[%i1+0x026],%l7		! %l7 = 00000000000019d1
!	Mem[0000000030181400] = 000057e0, %l7 = 00000000000019d1
	ldswa	[%i6+%g0]0x89,%l7	! %l7 = 00000000000057e0
!	Mem[0000000030101408] = fc1eb538, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000038
!	Mem[0000000030141400] = 00000000, %l5 = 0000000021000000
	lduwa	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000218000c0] = 16ff3492, %l1 = 00000000ff000000
	lduh	[%o3+0x0c0],%l1		! %l1 = 00000000000016ff
!	Mem[0000000030001408] = ff0000ff, %l2 = 0000000000000038
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = ffffffffff0000ff
!	Starting 10 instruction Store Burst
!	%f13 = d37a8e6c, Mem[0000000030081400] = 00000000
	sta	%f13,[%i2+%g0]0x81	! Mem[0000000030081400] = d37a8e6c

p0_label_128:
!	%f3  = 00000000, Mem[0000000030141400] = 00000000
	sta	%f3 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%f18 = 000000f2 81f1fffe, Mem[00000000100c1410] = 00000000 00000000
	stda	%f18,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000f2 81f1fffe
!	%f12 = 95ffe03a d37a8e6c, Mem[0000000030181408] = 1bf4f8dc e8196ccd
	stda	%f12,[%i6+%o4]0x81	! Mem[0000000030181408] = 95ffe03a d37a8e6c
!	Mem[0000000010041400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 000000ff, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010001408] = 00000000000000ff
	stx	%l5,[%i0+%o4]		! Mem[0000000010001408] = 0000000000000000
!	%l1 = 00000000000016ff, Mem[0000000030101400] = 00000000
	stba	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000000
!	%f7  = 053b7086, %f16 = ff000000, %f9  = e0000000
	fmuls	%f7 ,%f16,%f9 		! %f9  = c4bb7086
!	Mem[0000000021800040] = ff4307c8, %l0 = 000000000000ff00
	ldstub	[%o3+0x040],%l0		! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_129:
!	Mem[0000000010141404] = d0a127ff, %l7 = 00000000000057e0
	ldswa	[%i5+0x004]%asi,%l7	! %l7 = ffffffffd0a127ff
!	Mem[0000000010101430] = 95ffe03ad37a8e6c, %f22 = 7a8e4aff f6f1e045
	ldd	[%i4+0x030],%f22	! %f22 = 95ffe03a d37a8e6c
!	Mem[0000000010041408] = 0543c032ff000000, %l0 = 0000000000000000
	ldxa	[%i1+0x008]%asi,%l0	! %l0 = 0543c032ff000000
!	Mem[0000000010141400] = 81f1fffed0a127ff, %f20 = 81f1fffe e55419d1
	ldda	[%i5+%g0]0x80,%f20	! %f20 = 81f1fffe d0a127ff
!	Mem[0000000010041400] = 000000ff 00000000, %l0 = ff000000, %l1 = 000016ff
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000030041400] = 00000078 7a8e4aff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 000000007a8e4aff 0000000000000078
!	Mem[000000001014143c] = ff000000, %l5 = 0000000000000078
	lduba	[%i5+0x03d]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181434] = 800000ff, %f9  = c4bb7086
	ld	[%i6+0x034],%f9 	! %f9 = 800000ff
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010181400] = ff000000 0000f04a 00000000 ff0000ff
!	Mem[0000000010181410] = 6c000000 ff269c42 c056b74d 3fff5bb1
!	Mem[0000000010181420] = ffffed05 ffa56439 a69ebf0f 5c06ff76
!	Mem[0000000010181430] = 000000f2 800000ff 77dc5bff adf36949
	ldda	[%i6]ASI_BLK_AIUP,%f0	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 00006c00, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 00000000000000ff

p0_label_130:
!	%l3 = 000000000000a69e, %l4 = 000000007a8e4aff, %l4 = 000000007a8e4aff
	or	%l3,%l4,%l4		! %l4 = 000000007a8eeeff
!	%l7 = ffffffffd0a127ff, Mem[0000000020800001] = 00e55b63, %asi = 80
	stba	%l7,[%o1+0x001]%asi	! Mem[0000000020800000] = 00ff5b63
!	Mem[0000000010041428] = 000000f2, %l6 = 00000000000000ff
	swap	[%i1+0x028],%l6		! %l6 = 00000000000000f2
!	Mem[0000000030181400] = e0570000, %l6 = 00000000000000f2
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 000000e0000000ff
!	Mem[000000001014143c] = ff000000, %l4 = 000000007a8eeeff, %asi = 80
	swapa	[%i5+0x03c]%asi,%l4	! %l4 = 00000000ff000000
!	%f28 = ff000000, Mem[0000000010041400] = ff000000
	sta	%f28,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000
!	%l5 = 0000000000000000, Mem[0000000010141400] = ff27a1d0fefff181
	stxa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000000
!	%l2 = ffffffffff0000ff, Mem[0000000010041410] = 00000000ffffffff
	stxa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffffff0000ff
!	Mem[00000000300c1408] = 8000b600, %l1 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%l2 = ffffffffff0000ff, imm = fffffffffffff348, %l4 = 00000000ff000000
	addc	%l2,-0xcb8,%l4		! %l4 = fffffffffefff447

p0_label_131:
!	Mem[00000000100c1400] = e58c2cff, %l6 = 00000000000000e0
	ldswa	[%i3+%g0]0x88,%l6	! %l6 = ffffffffe58c2cff
!	Mem[0000000010181408] = 00000000, %l4 = fffffffffefff447
	lduwa	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = ffffffff06c503c3, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l5	! %l5 = ffffffff06c503c3
!	Mem[000000001010141c] = 053b7086, %l2 = ffffffffff0000ff
	lduba	[%i4+0x01e]%asi,%l2	! %l2 = 0000000000000070
!	Mem[0000000030041408] = 000000f2ff0000ff, %l1 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l1	! %l1 = 000000f2ff0000ff
!	%l7 = ffffffffd0a127ff, imm = fffffffffffff6e6, %l1 = 000000f2ff0000ff
	orn	%l7,-0x91a,%l1		! %l1 = ffffffffd0a12fff
!	Mem[0000000010041410] = ff0000ffffffffff, %f20 = 81f1fffe d0a127ff
	ldda	[%i1+0x010]%asi,%f20	! %f20 = ff0000ff ffffffff
!	Mem[0000000010101400] = c303c506 ffffffff, %l2 = 00000070, %l3 = 0000a69e
	ldda	[%i4+0x000]%asi,%l2	! %l2 = 00000000c303c506 00000000ffffffff
!	Mem[0000000010141408] = 000000ff, %l5 = ffffffff06c503c3
	lduwa	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010001410] = 34739b37ef7800ff
	stxa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000

p0_label_132:
!	%f22 = 95ffe03a, Mem[0000000030001408] = ff0000ff
	sta	%f22,[%i0+%o4]0x81	! Mem[0000000030001408] = 95ffe03a
!	Mem[0000000010181400] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	%f20 = ff0000ff ffffffff, Mem[0000000010001410] = 00000000 00000000
	stda	%f20,[%i0+%o5]0x80	! Mem[0000000010001410] = ff0000ff ffffffff
!	%l0 = 00000000000000ff, Mem[0000000010041410] = ff0000ff
	stwa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff
!	%f20 = ff0000ff ffffffff, Mem[0000000010101428] = 00000000 c750ee45
	stda	%f20,[%i4+0x028]%asi	! Mem[0000000010101428] = ff0000ff ffffffff
!	%l2 = c303c506, %l3 = ffffffff, Mem[0000000010001400] = 00000000 01040000
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = c303c506 ffffffff
!	%l1 = ffffffffd0a12fff, Mem[0000000030101410] = 369cb70dff0000ff
	stxa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffffd0a12fff
!	%f30 = ff0000ff, %f21 = ffffffff, %f27 = ff269c42
	fsubs	%f30,%f21,%f27		! %f27 = ffffffff
!	%f22 = 95ffe03a d37a8e6c, %l3 = 00000000ffffffff
!	Mem[0000000010001410] = ff0000ffffffffff
	add	%i0,0x010,%g1
	stda	%f22,[%g1+%l3]ASI_PST16_P ! Mem[0000000010001410] = 95ffe03ad37a8e6c
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffffff06c503c3, %f18 = 000000f2 81f1fffe
	ldda	[%i4+%g0]0x88,%f18	! %f18 = ffffffff 06c503c3

p0_label_133:
!	Mem[0000000030041408] = ff0000ff, %f18 = ffffffff
	lda	[%i1+%o4]0x89,%f18	! %f18 = ff0000ff
!	Mem[00000000100c1410] = f2000000, %l6 = ffffffffe58c2cff
	ldswa	[%i3+%o5]0x88,%l6	! %l6 = fffffffff2000000
!	Mem[000000001004140c] = ff000000, %f28 = ff000000
	ld	[%i1+0x00c],%f28	! %f28 = ff000000
!	Mem[00000000100c1400] = ff2c8ce5 00000071 ff0000ff 00000000
!	Mem[00000000100c1410] = 000000f2 81f1fffe 000000ff f90c00ff
!	Mem[00000000100c1420] = 0c0000ff ff0000ff 00000000 00000071
!	Mem[00000000100c1430] = af520c69 ff1de8de 8ae1e2be 000000ff
	ldda	[%i3]ASI_BLK_AIUP,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010081428] = 5403dcff23c848d7, %f4  = 6c000000 ff269c42
	ldd	[%i2+0x028],%f4 	! %f4  = 5403dcff 23c848d7
!	Mem[00000000100c1418] = 000000ff, %l3 = 00000000ffffffff
	ldsh	[%i3+0x01a],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030181400] = 000057ff, %f13 = 800000ff
	lda	[%i6+%g0]0x89,%f13	! %f13 = 000057ff
!	Mem[0000000030001410] = 000071ff, %l5 = 00000000000000ff
	ldsba	[%i0+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1400] = 000000f2, %f2  = 00000000
	lda	[%i3+%g0]0x89,%f2 	! %f2 = 000000f2
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (26)
!	%f4  = 5403dcff 23c848d7, Mem[0000000010181400] = ff000000 0000f04a
	stda	%f4 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 5403dcff 23c848d7

p0_label_134:
!	%f26 = 00000000 00000071, Mem[0000000030081410] = 78000000 103cad5a
	stda	%f26,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 00000071
!	Mem[0000000010081434] = ff1de8ff, %l3 = 00000000000000ff
	swap	[%i2+0x034],%l3		! %l3 = 00000000ff1de8ff
!	%l4 = 00000000000000ff, Mem[000000001004142a] = 000000ff
	sth	%l4,[%i1+0x02a]		! Mem[0000000010041428] = 000000ff
!	%f16 = ff2c8ce5, Mem[0000000030041410] = 00000000
	sta	%f16,[%i1+%o5]0x89	! Mem[0000000030041410] = ff2c8ce5
!	%f11 = 5c06ff76, Mem[0000000010001410] = 95ffe03a
	sta	%f11,[%i0+%o5]0x80	! Mem[0000000010001410] = 5c06ff76
!	Mem[0000000010181408] = 00000000, %l2 = 00000000c303c506
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l7 = ffffffffd0a127ff, Mem[0000000010141410] = 000000ff
	stha	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 000027ff
!	Mem[0000000010181408] = ff000000, %l6 = fffffffff2000000
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010081404] = 00000000, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x004]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 8000b6ff, %l1 = ffffffffd0a12fff
	ldsba	[%i3+%o4]0x89,%l1	! %l1 = ffffffffffffffff

p0_label_135:
!	Mem[0000000020800000] = 00ff5b63, %l7 = ffffffffd0a127ff
	ldsha	[%o1+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081430] = 57e0ee45, %l5 = ffffffffffffffff
	ldub	[%i2+0x032],%l5		! %l5 = 00000000000000ee
!	Mem[0000000010041410] = ffffffffff000000, %l3 = 00000000ff1de8ff
	ldxa	[%i1+%o5]0x88,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030041400] = ff4a8e7a, %l5 = 00000000000000ee
	ldswa	[%i1+%g0]0x81,%l5	! %l5 = ffffffffff4a8e7a
!	Mem[0000000030181408] = 3ae0ff95, %f2  = 000000f2
	lda	[%i6+%o4]0x89,%f2 	! %f2 = 3ae0ff95
!	Mem[0000000030041410] = e58c2cff, %l2 = 0000000000000000
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = ffffffffffffffe5
!	Mem[00000000211c0000] = 00e54b99, %l3 = ffffffffff000000
	ldsba	[%o2+0x001]%asi,%l3	! %l3 = ffffffffffffffe5
!	Mem[0000000010141408] = 000000ff, %l0 = 00000000000000ff
	ldsha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001004142c] = 81f1fffe, %l3 = ffffffffffffffe5
	lduwa	[%i1+0x02c]%asi,%l3	! %l3 = 0000000081f1fffe
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 8000b6ff, %l5 = ffffffffff4a8e7a
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 000000ff000000ff

p0_label_136:
!	Mem[0000000010101410] = ff000000, %l3 = 0000000081f1fffe
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	%f6  = c056b74d, %f2  = 3ae0ff95, %f5  = 23c848d7
	fsubs	%f6 ,%f2 ,%f5 		! %f5  = c056d36d
!	%l3 = 00000000ff000000, Mem[0000000010181400] = ffdc0354
	stba	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = ffdc0300
!	Mem[0000000030081400] = 6c8e7ad3, %l7 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 000000006c8e7ad3
!	%l1 = ffffffffffffffff, Mem[0000000010141408] = 000000ffff5bdc00
	stxa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffffffffffff
!	Mem[00000000218000c1] = 16ff3492, %l3 = 00000000ff000000
	ldstuba	[%o3+0x0c1]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030081400] = 000000ff, %l6 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	%f20 = 000000f2, Mem[0000000030081400] = 000000ff
	sta	%f20,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000f2
!	Mem[00000000211c0001] = 00e54b99, %l2 = ffffffffffffffe5
	ldstub	[%o2+0x001],%l2		! %l2 = 000000e5000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff0000ff, %l7 = 000000006c8e7ad3
	lduha	[%i3+%o4]0x80,%l7	! %l7 = 000000000000ff00

p0_label_137:
!	Mem[00000000100c1430] = af520c69, %l7 = 000000000000ff00
	ldsha	[%i3+0x030]%asi,%l7	! %l7 = ffffffffffffaf52
!	Mem[0000000030001408] = 95ffe03a, %l1 = ffffffffffffffff
	ldswa	[%i0+%o4]0x81,%l1	! %l1 = ffffffff95ffe03a
!	Mem[0000000010181410] = 429c26ff 0000006c, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 000000000000006c 00000000429c26ff
!	Mem[0000000010041428] = 000000ff81f1fffe, %l3 = 00000000000000ff
	ldx	[%i1+0x028],%l3		! %l3 = 000000ff81f1fffe
!	Mem[0000000010181410] = 429c26ff0000006c, %l2 = 00000000000000e5
	ldxa	[%i6+%o5]0x88,%l2	! %l2 = 429c26ff0000006c
!	Mem[0000000030041410] = ff2c8ce5, %l4 = 000000000000006c
	ldsha	[%i1+%o5]0x89,%l4	! %l4 = ffffffffffff8ce5
!	Mem[0000000010081400] = 006c00ff, %l4 = ffffffffffff8ce5
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 00000000006c00ff
!	Mem[0000000030041408] = ff0000ff, %l6 = 00000000000000ff
	ldsha	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = ffffeaae, %l3 = 000000ff81f1fffe
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = f2000000, %l6 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 00000000f2000000

p0_label_138:
!	Mem[0000000010001400] = 06c503c3, %l7 = ffffffffffffaf52
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 0000000006c503c3
!	Mem[00000000211c0000] = 00ff4b99, %l2 = 429c26ff0000006c
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101420] = ff2770d47a78ffd6, %l4 = 00000000006c00ff, %l2 = 0000000000000000
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = ff2770d47a78ffd6
!	Mem[00000000201c0001] = ffffeaae, %l2 = ff2770d47a78ffd6
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	%l6 = f2000000, %l7 = 06c503c3, Mem[0000000030041400] = 7a8e4aff 00000078
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = f2000000 06c503c3
!	Mem[0000000030101408] = 38b51efc, %l3 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 00000038000000ff
!	%f0  = ff000000 0000f04a 3ae0ff95 ff0000ff
!	%f4  = 5403dcff c056d36d c056b74d 3fff5bb1
!	%f8  = ffffed05 ffa56439 a69ebf0f 5c06ff76
!	%f12 = 000000f2 000057ff 77dc5bff adf36949
	stda	%f0,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
	membar	#Sync			! Added by membar checker (27)
!	Mem[00000000300c1410] = 6dd356c0, %l2 = 00000000000000ff
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 0000006d000000ff
!	Mem[0000000010041413] = 000000ff, %l3 = 0000000000000038
	ldstuba	[%i1+0x013]%asi,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000, %f12 = 000000f2
	lda	[%i5+%g0]0x80,%f12	! %f12 = 00000000

p0_label_139:
!	Mem[00000000100c1410] = ff00000081f1fffe, %l1 = ffffffff95ffe03a
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = ff00000081f1fffe
!	Mem[00000000211c0000] = ffff4b99, %l4 = 00000000006c00ff
	lduh	[%o2+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030001408] = 95ffe03a, %l4 = 000000000000ffff
	lduba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000095
!	Mem[0000000010001408] = 00000000, %f14 = 77dc5bff
	ld	[%i0+%o4],%f14	! %f14 = 00000000
!	Mem[00000000300c1408] = ff0000ff, %l1 = ff00000081f1fffe
	lduba	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181400] = d748c823 ffdc0300, %l4 = 00000095, %l5 = 429c26ff
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 00000000ffdc0300 00000000d748c823
!	Mem[00000000300c1410] = ffd356c0ffdc0354, %f0  = ff000000 0000f04a
	ldda	[%i3+%o5]0x81,%f0 	! %f0  = ffd356c0 ffdc0354
!	Mem[0000000010101408] = 00000038, %l1 = 00000000000000ff
	lduwa	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000038
!	Code Fragment 3
p0_fragment_23:
!	%l0 = 0000000000000000
	setx	0xba21143fc0bdd9c6,%g7,%l0 ! %l0 = ba21143fc0bdd9c6
!	%l1 = 0000000000000038
	setx	0x1811d4f846ec7c50,%g7,%l1 ! %l1 = 1811d4f846ec7c50
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ba21143fc0bdd9c6
	setx	0xadc515ff88db4090,%g7,%l0 ! %l0 = adc515ff88db4090
!	%l1 = 1811d4f846ec7c50
	setx	0x0dbe6d2febd1c42a,%g7,%l1 ! %l1 = 0dbe6d2febd1c42a
!	Starting 10 instruction Store Burst
!	%l6 = 00000000f2000000, Mem[0000000021800140] = e61a8319, %asi = 80
	stha	%l6,[%o3+0x140]%asi	! Mem[0000000021800140] = 00008319

p0_label_140:
!	Mem[0000000030081408] = 80000080, %l0 = adc515ff88db4090
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 0000000080000080
!	%l1 = 0dbe6d2febd1c42a, Mem[0000000010181400] = 0003dcff
	stwa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = ebd1c42a
!	Mem[00000000201c0001] = ffffeaae, %l1 = 0dbe6d2febd1c42a
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	%f20 = 000000f2, Mem[00000000100c1408] = ff0000ff
	sta	%f20,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000f2
!	%l7 = 0000000006c503c3, %l4 = 00000000ffdc0300, %l7 = 0000000006c503c3
	and	%l7,%l4,%l7		! %l7 = 0000000006c40300
!	Mem[0000000010001410] = 5c06ff76, %l6 = 00000000f2000000
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 0000005c000000ff
!	Mem[0000000010001418] = 0000000024ff598d, %l3 = 00000000000000ff, %l4 = 00000000ffdc0300
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 0000000024ff598d
!	%l2 = 000000000000006d, immed = 00000ccb, %y  = 000000fe
	smul	%l2,0xccb,%l2		! %l2 = 000000000005726f, %y = 00000000
!	%l5 = 00000000d748c823, Mem[0000000030101408] = 000000f2fc1eb5ff
	stxa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000d748c823
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 52afffff, %l7 = 0000000006c40300
	ldswa	[%i0+%g0]0x88,%l7	! %l7 = 0000000052afffff

p0_label_141:
!	Mem[0000000010001408] = 00000000, %l3 = 00000000000000ff
	lduwa	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041420] = b63600ff e55419d1, %l4 = 24ff598d, %l5 = d748c823
	ldda	[%i1+0x020]%asi,%l4	! %l4 = 00000000b63600ff 00000000e55419d1
!	Mem[0000000010181408] = ff000000ff0000ff, %f2  = 3ae0ff95 ff0000ff
	ldda	[%i6+%o4]0x80,%f2 	! %f2  = ff000000 ff0000ff
!	%l6 = 000000000000005c, imm = fffffffffffff467, %l3 = 0000000000000000
	subc	%l6,-0xb99,%l3		! %l3 = 0000000000000bf5
!	%l6 = 000000000000005c, %l6 = 000000000000005c, %l5 = 00000000e55419d1
	add	%l6,%l6,%l5		! %l5 = 00000000000000b8
!	Mem[0000000010081424] = 8d9039a3, %l6 = 000000000000005c
	ldsha	[%i2+0x024]%asi,%l6	! %l6 = ffffffffffff8d90
!	Mem[0000000010141410] = 000027ff, %l6 = ffffffffffff8d90
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 00000000000027ff
!	%f12 = 00000000, %f5  = c056d36d
	fcmpes	%fcc2,%f12,%f5 		! %fcc2 = 2
!	Mem[0000000010081410] = 7e6105ff, %l7 = 0000000052afffff
	ldsba	[%i2+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f10 = a69ebf0f 5c06ff76, Mem[0000000010101410] = 81f1fffe 3964a5ff
	std	%f10,[%i4+%o5]	! Mem[0000000010101410] = a69ebf0f 5c06ff76

p0_label_142:
!	%l7 = ffffffffffffffff, Mem[0000000010081400] = ff000000006c00ff
	stxa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffffffffffff
!	Mem[0000000010101408] = 38000000, %l2 = 0005726f, %l4 = b63600ff
	add	%i4,0x08,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 0000000038000000
!	%l5 = 00000000000000b8, Mem[0000000010081400] = ffffffffffffffff
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000000000b8
!	%l3 = 0000000000000bf5, %l6 = 00000000000027ff, %l3  = 0000000000000bf5
	mulx	%l3,%l6,%l3		! %l3 = 0000000001de3c0b
!	%l0 = 0000000080000080, Mem[0000000010141410] = 000027ff
	stba	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00002780
!	%f12 = 00000000 000057ff, Mem[0000000010001400] = ffffaf52 ffffffff
	stda	%f12,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 000057ff
!	%l6 = 000027ff, %l7 = ffffffff, Mem[0000000010041408] = 32c04305 000000ff
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 000027ff ffffffff
!	Mem[0000000010081410] = ff05617e, %l4 = 0000000038000000
	ldsba	[%i2+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	%l7 = ffffffffffffffff, Mem[00000000100c1408] = 000000f2
	stha	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ffffffff, %l2 = 000000000005726f
	ldsha	[%i4+%o5]0x89,%l2	! %l2 = ffffffffffffffff

p0_label_143:
!	Mem[0000000030041408] = ff0000ff, %l7 = ffffffffffffffff
	lduwa	[%i1+%o4]0x89,%l7	! %l7 = 00000000ff0000ff
!	Mem[0000000021800080] = 00ff3e7c, %l3 = 0000000001de3c0b
	ldsb	[%o3+0x080],%l3		! %l3 = 0000000000000000
!	Mem[0000000010001408] = 0000000000000000, %f14 = 00000000 adf36949
	ldda	[%i0+%o4]0x88,%f14	! %f14 = 00000000 00000000
!	%l2 = ffffffffffffffff, imm = fffffffffffff251, %l6 = 00000000000027ff
	subc	%l2,-0xdaf,%l6		! %l6 = 0000000000000dae
!	Mem[0000000030141410] = ff0000ff 00000000, %l4 = ffffffff, %l5 = 000000b8
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000 00000000ff0000ff
!	Mem[0000000010041400] = 00000000ff000000, %l4 = 0000000000000000
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010081410] = ff05617eff0000ff, %f26 = 00000000 00000071
	ldda	[%i2+0x010]%asi,%f26	! %f26 = ff05617e ff0000ff
!	Mem[0000000030141400] = ff00000000000000, %l2 = ffffffffffffffff
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = ff00000000000000
!	%f31 = 000000ff, %f1  = ffdc0354, %f24 = 0c0000ff
	fadds	%f31,%f1 ,%f24		! %f24 = ffdc0354
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ff05617e, %l7 = 00000000ff0000ff
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 000000ff000000ff

p0_label_144:
!	%l6 = 00000dae, %l7 = 000000ff, Mem[0000000030141410] = 00000000 ff0000ff
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000dae 000000ff
!	Mem[0000000030041410] = e58c2cff, %l6 = 0000000000000dae
	swapa	[%i1+%o5]0x81,%l6	! %l6 = 00000000e58c2cff
!	%f0  = ffd356c0 ffdc0354 ff000000 ff0000ff
!	%f4  = 5403dcff c056d36d c056b74d 3fff5bb1
!	%f8  = ffffed05 ffa56439 a69ebf0f 5c06ff76
!	%f12 = 00000000 000057ff 00000000 00000000
	stda	%f0,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
!	Mem[00000000100c1424] = ff0000ff, %l1 = 00000000000000ff
	swap	[%i3+0x024],%l1		! %l1 = 00000000ff0000ff
!	Mem[0000000010001408] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181400] = ff570000, %l6 = 00000000e58c2cff
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 00000000ff570000
!	Code Fragment 4
p0_fragment_24:
!	%l0 = 0000000080000080
	setx	0x82cd4f67e10995f0,%g7,%l0 ! %l0 = 82cd4f67e10995f0
!	%l1 = 00000000ff0000ff
	setx	0x1262db0fc85a6e8e,%g7,%l1 ! %l1 = 1262db0fc85a6e8e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 82cd4f67e10995f0
	setx	0x1daf7aa038759348,%g7,%l0 ! %l0 = 1daf7aa038759348
!	%l1 = 1262db0fc85a6e8e
	setx	0x9c41ceffe8ca407e,%g7,%l1 ! %l1 = 9c41ceffe8ca407e
!	%l2 = ff00000000000000, Mem[0000000030101408] = 00000000d748c823
	stxa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = ff00000000000000
!	%f26 = ff05617e ff0000ff, %l5 = 00000000ff0000ff
!	Mem[0000000030081410] = 7100000000000000
	add	%i2,0x010,%g1
	stda	%f26,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030081410] = ff0000ff7e6105ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ebd1c42a23c848d7, %l4 = 00000000ff000000
	ldxa	[%i6+%g0]0x80,%l4	! %l4 = ebd1c42a23c848d7

p0_label_145:
!	Mem[00000000300c1410] = ffd356c0, %l1 = 9c41ceffe8ca407e
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffffffd3
!	Mem[0000000030101410] = ffffffff, %f22 = 000000ff
	lda	[%i4+%o5]0x81,%f22	! %f22 = ffffffff
!	Mem[00000000100c1410] = ff000000, %l2 = ff00000000000000
	ldsha	[%i3+%o5]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030041410] = 00000000ae0d0000, %l5 = 00000000ff0000ff
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = 00000000ae0d0000
!	Mem[00000000100c1410] = ff000000, %l0 = 1daf7aa038759348
	ldswa	[%i3+0x010]%asi,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030081400] = ffffffff 000000f2, %l2 = ffffff00, %l3 = 00000000
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000f2 00000000ffffffff
!	Mem[0000000030081410] = ff0000ff, %l1 = ffffffffffffffd3
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000030181400] = e58c2cff, %l4 = ebd1c42a23c848d7
	lduha	[%i6+%g0]0x81,%l4	! %l4 = 000000000000e58c
!	Mem[000000001018140c] = ff0000ff, %l7 = 0000000000000000
	ldswa	[%i6+0x00c]%asi,%l7	! %l7 = ffffffffff0000ff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ffffffff, Mem[00000000100c1410] = ff000000
	stw	%l3,[%i3+%o5]		! Mem[00000000100c1410] = ffffffff

p0_label_146:
!	%l6 = 00000000ff570000, Mem[0000000010141408] = ffffffff
	stwa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = ff570000
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010081428] = 76ff065c, %l2 = 00000000000000f2, %asi = 80
	swapa	[%i2+0x028]%asi,%l2	! %l2 = 0000000076ff065c
!	Mem[0000000030181408] = 95ffe03a, %l0 = ffffffffff000000
	swapa	[%i6+%o4]0x81,%l0	! %l0 = 0000000095ffe03a
!	Mem[00000000201c0001] = ffffeaae, %l2 = 0000000076ff065c
	ldstub	[%o0+0x001],%l2		! %l2 = 000000ff000000ff
!	%l6 = 00000000ff570000, Mem[00000000100c1408] = 0000ffff
	stba	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000ff00
!	Mem[0000000010081430] = ff570000, %l4 = 000000000000e58c, %asi = 80
	swapa	[%i2+0x030]%asi,%l4	! %l4 = 00000000ff570000
!	%l4 = ff570000, %l5 = ae0d0000, Mem[0000000030141410] = ae0d0000 ff000000
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = ff570000 ae0d0000
!	%l7 = ffffffffff0000ff, Mem[0000000030001410] = ff710000
	stwa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = ff0000ff
!	Mem[0000000010001400] = 00000000, %l0 = 0000000095ffe03a
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	%f0  = ffd356c0, %f2  = ff000000
	fcmps	%fcc1,%f0 ,%f2 		! %fcc1 = 3

p0_label_147:
!	Mem[00000000211c0000] = ffff4b99, %l4 = 00000000ff570000
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010041408] = 000027ff, %l7 = ffffffffff0000ff
	lduwa	[%i1+%o4]0x88,%l7	! %l7 = 00000000000027ff
!	Mem[0000000030101400] = ff00000000000000, %l0 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l0	! %l0 = ff00000000000000
!	Mem[0000000030081408] = 88db4090, %l3 = 00000000ffffffff
	ldswa	[%i2+%o4]0x81,%l3	! %l3 = ffffffff88db4090
!	%f0  = ffd356c0, %f0  = ffd356c0, %f27 = ff0000ff
	fadds	%f0 ,%f0 ,%f27		! %f27 = ffd356c0
!	Mem[00000000100c1408] = 00ff0000, %l1 = 000000000000ff00
	ldsha	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l5 = 00000000ae0d0000, %l2 = 00000000000000ff, %l5 = 00000000ae0d0000
	addc	%l5,%l2,%l5		! %l5 = 00000000ae0d00ff
!	Mem[0000000010181400] = 2ac4d1eb, %l3 = ffffffff88db4090
	ldswa	[%i6+%g0]0x88,%l3	! %l3 = 000000002ac4d1eb
!	Mem[0000000010181408] = ff000000, %l3 = 000000002ac4d1eb
	ldsw	[%i6+%o4],%l3		! %l3 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ae0d00ff, Mem[0000000030081400] = f2000000ffffffff
	stxa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000ae0d00ff

p0_label_148:
!	%l2 = 00000000000000ff, Mem[0000000030181408] = 000000ff
	stha	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	%l4 = ffffffffffffffff, Mem[0000000010041408] = ff270000
	stb	%l4,[%i1+%o4]		! Mem[0000000010041408] = ff270000
!	Mem[0000000030101400] = 000000ff, %l5 = 00000000ae0d00ff
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l6 = 00000000ff570000, Mem[00000000300c1410] = ffd356c0
	stwa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff570000
!	%l2 = 000000ff, %l3 = ff000000, Mem[0000000010101400] = c303c506 ffffffff
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff ff000000
!	%l7 = 00000000000027ff, Mem[00000000201c0001] = ffffeaae
	stb	%l7,[%o0+0x001]		! Mem[00000000201c0000] = ffffeaae
!	Mem[0000000030001410] = ff0000ff, %l5 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000030181410] = 429c26ff, %l3 = ffffffffff000000
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 00000000429c26ff
!	Mem[0000000010141408] = 000057ff, %l0 = ff00000000000000
	swapa	[%i5+%o4]0x88,%l0	! %l0 = 00000000000057ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff570000ffdc0354, %f4  = 5403dcff c056d36d
	ldda	[%i3+%o5]0x81,%f4 	! %f4  = ff570000 ffdc0354

p0_label_149:
!	Mem[00000000100c1438] = 8ae1e2be, %l2 = 00000000000000ff
	lduha	[%i3+0x03a]%asi,%l2	! %l2 = 000000000000e2be
!	Mem[0000000030101410] = ffffffff d0a12fff, %l6 = ff570000, %l7 = 000027ff
	ldda	[%i4+%o5]0x81,%l6	! %l6 = 00000000ffffffff 00000000d0a12fff
!	Mem[00000000211c0000] = ffff4b99, %l3 = 00000000429c26ff
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1400] = e58c2cff, %l0 = 00000000000057ff
	ldswa	[%i3+%g0]0x88,%l0	! %l0 = ffffffffe58c2cff
!	Mem[0000000030101410] = ffffffff, %l5 = 00000000ff0000ff
	ldswa	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001410] = ff06ff76, %l4 = ffffffffffffffff
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = ffffffffff06ff76
!	%l7 = 00000000d0a12fff, immd = 000000000000051a, %l7  = 00000000d0a12fff
	mulx	%l7,0x51a,%l7		! %l7 = 00000428564edae6
!	Mem[0000000030101410] = ffffffff, %l5 = ffffffffffffffff
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = a69ebf0f 5c06ff76, %l6 = ffffffff, %l7 = 564edae6
	ldda	[%i4+0x010]%asi,%l6	! %l6 = 00000000a69ebf0f 000000005c06ff76
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 000000ff, %l2 = 000000000000e2be
	swapa	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff

p0_label_150:
!	%f16 = ff2c8ce5, Mem[0000000030081400] = 00000000
	sta	%f16,[%i2+%g0]0x81	! Mem[0000000030081400] = ff2c8ce5
!	%f15 = 00000000, Mem[0000000030001400] = 00000000
	sta	%f15,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[00000000100c1438] = 8ae1e2be000000ff, %l4 = ffffffffff06ff76, %l4 = ffffffffff06ff76
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l4,%l4	! %l4 = 8ae1e2be000000ff
!	%l2 = 00000000000000ff, Mem[0000000030101400] = ae0d00ff
	stba	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = ae0d00ff
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000010041408] = 000027ff ffffffff
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff ffffffff
!	%l0 = ffffffffe58c2cff, Mem[0000000030141408] = 000000f2
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 2cff00f2
!	Mem[0000000010101438] = 37bb86bf48972b83, %l2 = 00000000000000ff, %l6 = 00000000a69ebf0f
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l2,%l6	! %l6 = 37bb86bf48972b83
!	Mem[0000000010001410] = ff06ff76, %l0 = ffffffffe58c2cff
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%l7 = 000000005c06ff76, Mem[0000000030081410] = ff05617eff0000ff
	stxa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000005c06ff76
!	Starting 10 instruction Load Burst
!	%l5 = ffffffffffffffff, imm = fffffffffffffb54, %l0 = 00000000000000ff
	orn	%l5,-0x4ac,%l0		! %l0 = ffffffffffffffff

p0_label_151:
!	Mem[0000000030181410] = ff000000, %l2 = 00000000000000ff
	lduba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Code Fragment 3
p0_fragment_25:
!	%l0 = ffffffffffffffff
	setx	0x3dc415f8346a557a,%g7,%l0 ! %l0 = 3dc415f8346a557a
!	%l1 = 00000000000000ff
	setx	0xeace17f06f826b84,%g7,%l1 ! %l1 = eace17f06f826b84
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3dc415f8346a557a
	setx	0xbbb8379fe8b38385,%g7,%l0 ! %l0 = bbb8379fe8b38385
!	%l1 = eace17f06f826b84
	setx	0xe1453a0823457ec3,%g7,%l1 ! %l1 = e1453a0823457ec3
!	Mem[0000000010181410] = 6c000000ff269c42, %f2  = ff000000 ff0000ff
	ldda	[%i6+%o5]0x80,%f2 	! %f2  = 6c000000 ff269c42
!	Mem[0000000010181400] = 2ac4d1eb, %l6 = 37bb86bf48972b83
	ldsha	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffd1eb
!	Mem[0000000010001400] = 3ae0ff95000057ff, %l1 = e1453a0823457ec3
	ldxa	[%i0+%g0]0x80,%l1	! %l1 = 3ae0ff95000057ff
!	Mem[0000000010041408] = ff000000, %l0 = bbb8379fe8b38385
	lduha	[%i1+%o4]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010181410] = 6c000000, %l5 = ffffffffffffffff
	ldsha	[%i6+%o5]0x80,%l5	! %l5 = 0000000000006c00
!	Mem[0000000010141410] = 80270000, %l1 = 3ae0ff95000057ff
	ldsba	[%i5+%o5]0x80,%l1	! %l1 = ffffffffffffff80
!	%l6 = ffffffffffffd1eb, %l1 = ffffffffffffff80, %y  = 00000000
	sdiv	%l6,%l1,%l1		! %l1 = fffffffffe00005d
	mov	%l0,%y			! %y = 0000ff00
!	Starting 10 instruction Store Burst
!	%f12 = 00000000 000057ff, %l6 = ffffffffffffd1eb
!	Mem[0000000010001438] = 8ae45fdc000000ff
	add	%i0,0x038,%g1
	stda	%f12,[%g1+%l6]ASI_PST16_P ! Mem[0000000010001438] = 00005fdc000057ff

p0_label_152:
!	%f16 = ff2c8ce5 00000071, %l0 = 000000000000ff00
!	Mem[0000000030001418] = 38b51efc6e840000
	add	%i0,0x018,%g1
	stda	%f16,[%g1+%l0]ASI_PST32_S ! Mem[0000000030001418] = 38b51efc6e840000
!	%l6 = ffffd1eb, %l7 = 5c06ff76, Mem[0000000010181410] = 6c000000 ff269c42
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffd1eb 5c06ff76
!	%l2 = 00000000000000ff, Mem[0000000030101400] = ae0d00ff
	stwa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	%f6  = c056b74d 3fff5bb1, %l1 = fffffffffe00005d
!	Mem[0000000030001400] = 00000000000000ff
	stda	%f6,[%i0+%l1]ASI_PST16_S ! Mem[0000000030001400] = c056b74d00005bb1
!	%l2 = 00000000000000ff, %l6 = ffffffffffffd1eb, %l2 = 00000000000000ff
	xnor	%l2,%l6,%l2		! %l2 = 0000000000002eeb
!	Mem[0000000010181410] = ebd1ffff, %l1 = fffffffffe00005d
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	%l2 = 0000000000002eeb, Mem[00000000300c1400] = ff0000000000f04a
	stxa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000002eeb
!	Mem[0000000010081408] = ff0000ff, %l1 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010141400] = 00000000, %l5 = 0000000000006c00
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffffd1eb, %f30 = 8ae1e2be
	lda	[%i6+%o5]0x80,%f30	! %f30 = ffffd1eb

p0_label_153:
!	%f3  = ff269c42, %f14 = 00000000, %f10 = a69ebf0f
	fadds	%f3 ,%f14,%f10		! %f10 = ff269c42
!	Mem[0000000010001408] = 000000ff, %l1 = 00000000000000ff
	lduha	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1408] = 00ff0000, %l0 = 000000000000ff00
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = ff0000ff, %l4 = 8ae1e2be000000ff
	ldsba	[%i3+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000211c0000] = ffff4b99, %l2 = 0000000000002eeb
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1408] = ff0000ff95ffe03a, %l7 = 000000005c06ff76
	ldxa	[%i3+%o4]0x81,%l7	! %l7 = ff0000ff95ffe03a
!	Mem[0000000010041408] = ff000000, %l7 = ff0000ff95ffe03a
	lduha	[%i1+%o4]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030001410] = bee20000 84000000, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 00000000bee20000 0000000084000000
!	Mem[0000000010081400] = 5403dcff, %l5 = 0000000084000000
	ldswa	[%i2+%g0]0x80,%l5	! %l5 = 000000005403dcff
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010001410] = ff06ff76
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffff76

p0_label_154:
!	%l6 = ffffffffffffd1eb, %l5 = 000000005403dcff, %l2 = ffffffffffffffff
	and	%l6,%l5,%l2		! %l2 = 000000005403d0eb
!	%f11 = 5c06ff76, Mem[0000000030101410] = ffffffff
	sta	%f11,[%i4+%o5]0x89	! Mem[0000000030101410] = 5c06ff76
!	%l1 = 00000000000000ff, Mem[0000000010141410] = 80270000
	stwa	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff
!	Mem[0000000030141408] = 2cff00f2, %l6 = ffffffffffffd1eb
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 0000002c000000ff
!	Mem[00000000100c1402] = ff2c8ce5, %l1 = 00000000000000ff
	ldstub	[%i3+0x002],%l1		! %l1 = 0000008c000000ff
!	Mem[0000000010041408] = ff000000, %l3 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000010181410] = ebd1ffff
	stha	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = ebd10000
!	%l0 = 0000000000000000, Mem[0000000010101400] = 000000ffff000000
	stxa	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000000000
!	%l0 = 00000000, %l1 = 0000008c, Mem[0000000010081430] = 0000e58c 00000000
	stda	%l0,[%i2+0x030]%asi	! Mem[0000000010081430] = 00000000 0000008c
!	Starting 10 instruction Load Burst
!	Mem[0000000010181424] = ffa56439, %f6  = c056b74d
	lda	[%i6+0x024]%asi,%f6 	! %f6 = ffa56439

p0_label_155:
!	Mem[0000000030181400] = e58c2cff, %f31 = 000000ff
	lda	[%i6+%g0]0x81,%f31	! %f31 = e58c2cff
!	Mem[00000000211c0000] = ffff4b99, %l0 = 0000000000000000
	ldsb	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010001428] = dc0000000000ffff, %l3 = 00000000000000ff
	ldxa	[%i0+0x028]%asi,%l3	! %l3 = dc0000000000ffff
!	Code Fragment 4
p0_fragment_26:
!	%l0 = ffffffffffffffff
	setx	0x8ab65ba7c7d0b445,%g7,%l0 ! %l0 = 8ab65ba7c7d0b445
!	%l1 = 000000000000008c
	setx	0x77923cafc8cae3b8,%g7,%l1 ! %l1 = 77923cafc8cae3b8
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8ab65ba7c7d0b445
	setx	0x0e31b930748f3d9e,%g7,%l0 ! %l0 = 0e31b930748f3d9e
!	%l1 = 77923cafc8cae3b8
	setx	0x01c978e84d23d93f,%g7,%l1 ! %l1 = 01c978e84d23d93f
!	Mem[0000000030181410] = 6c000000 000000ff, %l4 = bee20000, %l5 = 5403dcff
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff 000000006c000000
!	Mem[0000000010001408] = 000000ff, %l2 = 000000005403d0eb
	ldsha	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000 00002eeb, %l4 = 000000ff, %l5 = 6c000000
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 0000000000002eeb 0000000000000000
!	Mem[0000000030081408] = 88db4090, %l6 = 000000000000002c
	lduwa	[%i2+%o4]0x81,%l6	! %l6 = 0000000088db4090
!	Mem[0000000030141408] = ffff00f2, %l5 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l5	! %l5 = ffffffffffff00f2
!	Starting 10 instruction Store Burst
!	%l4 = 00002eeb, %l5 = ffff00f2, Mem[0000000010101408] = 00000038 00000000
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 00002eeb ffff00f2

p0_label_156:
!	%l0 = 0e31b930748f3d9e, Mem[000000001014141e] = c0a5787e
	sth	%l0,[%i5+0x01e]		! Mem[000000001014141c] = c0a53d9e
!	%l1 = 01c978e84d23d93f, Mem[0000000030141400] = 00000000
	stwa	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 4d23d93f
!	%l3 = dc0000000000ffff, Mem[0000000030001400] = 4db756c0
	stha	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 4db7ffff
!	%l0 = 0e31b930748f3d9e, Mem[0000000010101400] = 00000000
	stha	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 3d9e0000
!	Mem[0000000030101410] = 76ff065c, %l2 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l2	! %l2 = 0000000076ff065c
!	Code Fragment 4
p0_fragment_27:
!	%l0 = 0e31b930748f3d9e
	setx	0x8e633b4f89451b71,%g7,%l0 ! %l0 = 8e633b4f89451b71
!	%l1 = 01c978e84d23d93f
	setx	0x28180fa02641e3f0,%g7,%l1 ! %l1 = 28180fa02641e3f0
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8e633b4f89451b71
	setx	0x8da25a77d37b48f9,%g7,%l0 ! %l0 = 8da25a77d37b48f9
!	%l1 = 28180fa02641e3f0
	setx	0xcf6119583f95e095,%g7,%l1 ! %l1 = cf6119583f95e095
!	%f19 = 00000000, Mem[00000000100c1408] = 00ff0000
	sta	%f19,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%f22 = ffffffff, Mem[0000000010001428] = dc000000
	st	%f22,[%i0+0x028]	! Mem[0000000010001428] = ffffffff
!	%l1 = cf6119583f95e095, Mem[0000000020800040] = 00ffa555
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = e095a555
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff4b99, %l2 = 0000000076ff065c
	ldsb	[%o2+%g0],%l2		! %l2 = ffffffffffffffff

p0_label_157:
!	Mem[0000000030001408] = 95ffe03a 0000f8dc, %l6 = 88db4090, %l7 = 0000ff00
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 0000000095ffe03a 000000000000f8dc
!	Mem[00000000100c1400] = ff2cffe5 00000071, %l0 = d37b48f9, %l1 = 3f95e095
	ldd	[%i3+%g0],%l0		! %l0 = 00000000ff2cffe5 0000000000000071
!	Mem[0000000030001408] = 3ae0ff95, %l2 = ffffffffffffffff
	ldsha	[%i0+%o4]0x89,%l2	! %l2 = ffffffffffffff95
!	Mem[0000000010101434] = d37a8e6c, %l4 = 0000000000002eeb
	ldsha	[%i4+0x034]%asi,%l4	! %l4 = ffffffffffffd37a
!	Mem[0000000010101408] = eb2e0000, %l6 = 0000000095ffe03a
	lduwa	[%i4+%o4]0x80,%l6	! %l6 = 00000000eb2e0000
!	Mem[0000000010101400] = 3d9e0000, %l2 = ffffffffffffff95
	lduwa	[%i4+%g0]0x80,%l2	! %l2 = 000000003d9e0000
!	Mem[0000000010101410] = a69ebf0f, %l3 = dc0000000000ffff
	ldsba	[%i4+%o5]0x80,%l3	! %l3 = ffffffffffffffa6
!	Mem[00000000100c1410] = ffffffff, %l2 = 000000003d9e0000
	ldsba	[%i3+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000020800040] = e095a555, %l6 = 00000000eb2e0000
	ldsba	[%o1+0x041]%asi,%l6	! %l6 = ffffffffffffff95
!	Starting 10 instruction Store Burst
!	%f30 = ffffd1eb e58c2cff, %l6 = ffffffffffffff95
!	Mem[0000000010181430] = 000000f2800000ff
	add	%i6,0x030,%g1
	stda	%f30,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010181430] = ff008cf2eb0000ff

p0_label_158:
!	Mem[0000000010081410] = 6dd356c0, %l7 = 000000000000f8dc
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 000000006dd356c0
!	%l3 = ffffffffffffffa6, Mem[0000000030141400] = 4d23d93f000000ff
	stxa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffffffffffa6
!	Mem[0000000010181410] = 0000d1eb, %l2 = ffffffffffffffff
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010141410] = ff000000
	stba	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = ff000000
!	%l5 = ffffffffffff00f2, Mem[0000000030101408] = 00000000
	stha	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 00f20000
!	Mem[00000000300c1410] = ff570000, %l3 = ffffffffffffffa6
	ldstuba	[%i3+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	%f18 = ff0000ff 00000000, Mem[0000000030101410] = 000000ff d0a12fff
	stda	%f18,[%i4+%o5]0x81	! Mem[0000000030101410] = ff0000ff 00000000
!	Mem[0000000010081428] = 000000f20fbf9ea6, %l7 = 000000006dd356c0, %l5 = ffffffffffff00f2
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = 000000f20fbf9ea6
!	%f14 = 00000000, Mem[0000000030141410] = ff570000
	sta	%f14,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffffff76, %l5 = 000000f20fbf9ea6
	lduba	[%i0+%o5]0x80,%l5	! %l5 = 00000000000000ff

p0_label_159:
!	%f24 = ffdc0354 ff0000ff, %l6 = ffffffffffffff95
!	Mem[00000000300c1410] = ff570000ffdc0354
	add	%i3,0x010,%g1
	stda	%f24,[%g1+%l6]ASI_PST16_SL ! Mem[00000000300c1410] = ff00000054030354
!	Mem[0000000010101408] = 00002eeb, %l5 = 00000000000000ff
	ldsha	[%i4+%o4]0x88,%l5	! %l5 = 0000000000002eeb
!	Mem[0000000030081408] = 88db4090, %l2 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l2	! %l2 = 00000000000088db
!	Mem[00000000300c1410] = 54030354000000ff, %f0  = ffd356c0 ffdc0354
	ldda	[%i3+%o5]0x89,%f0 	! %f0  = 54030354 000000ff
!	Mem[0000000030041410] = 00000dae, %f3  = ff269c42
	lda	[%i1+%o5]0x81,%f3 	! %f3 = 00000dae
!	Mem[000000001000142c] = 0000ffff, %l5 = 0000000000002eeb
	ldsw	[%i0+0x02c],%l5		! %l5 = 000000000000ffff
!	Mem[00000000300c1410] = ff000000, %l1 = 0000000000000071
	ldsba	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041400] = 000000ff 00000000, %l2 = 000088db, %l3 = 000000ff
	ldda	[%i1+0x000]%asi,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[00000000201c0000] = ffffeaae, %l1 = ffffffffffffffff
	ldsh	[%o0+%g0],%l1		! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 000000006dd356c0, Mem[0000000030081400] = e58c2cff
	stba	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = e58c2cc0

p0_label_160:
!	Mem[000000001004142c] = 81f1fffe, %l6 = ffffffffffffff95
	swap	[%i1+0x02c],%l6		! %l6 = 0000000081f1fffe
!	%l3 = 0000000000000000, Mem[0000000030141400] = a6ffffffffffffff
	stxa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	Mem[0000000030181400] = ff2c8ce5, %l1 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 000000e5000000ff
!	Mem[0000000010101400] = 00009e3d, %l2 = 00000000000000ff
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 0000000000009e3d
!	Mem[00000000300c1410] = ff000000, %l0 = 00000000ff2cffe5
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 00000000ff000000
!	%l2 = 0000000000009e3d, Mem[0000000030041408] = ff0000ff
	stha	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = ff009e3d
!	%f18 = ff0000ff 00000000, %l0 = 00000000ff000000
!	Mem[0000000010081418] = b15bff3f4db756c0
	add	%i2,0x018,%g1
	stda	%f18,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010081418] = b15bff3f4db756c0
!	%l1 = 00000000000000e5, Mem[0000000010081408] = ff0000ff000000ff
	stxa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000000000e5
!	%f10 = ff269c42 5c06ff76, Mem[0000000010041408] = ff000000 ffffffff
	std	%f10,[%i1+%o4]	! Mem[0000000010041408] = ff269c42 5c06ff76
!	Starting 10 instruction Load Burst
!	Mem[0000000010041434] = ff2770d4, %l0 = 00000000ff000000
	ldsw	[%i1+0x034],%l0		! %l0 = ffffffffff2770d4

p0_label_161:
!	Mem[0000000030181408] = 000000ff, %l6 = 0000000081f1fffe
	lduwa	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101410] = a69ebf0f, %l2 = 0000000000009e3d
	lduh	[%i4+%o5],%l2		! %l2 = 000000000000a69e
!	Mem[0000000010041400] = 000000ff00000000, %f6  = ffa56439 3fff5bb1
	ldda	[%i1+0x000]%asi,%f6 	! %f6  = 000000ff 00000000
!	Mem[0000000030081410] = 76ff065c, %l6 = 00000000000000ff
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000076
!	Mem[00000000211c0000] = ffff4b99, %l6 = 0000000000000076
	lduba	[%o2+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1418] = 000000ff, %l5 = 000000000000ffff
	lduwa	[%i3+0x018]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 54030354e5ff2cff, %f0  = 54030354 000000ff
	ldda	[%i3+%o5]0x89,%f0 	! %f0  = 54030354 e5ff2cff
!	Mem[00000000100c1410] = ffffffff, %l4 = ffffffffffffd37a
	lduwa	[%i3+%o5]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010041410] = ff000000, %l3 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = ffffd1eb, Mem[000000001008142c] = 0fbf9ea6
	st	%f30,[%i2+0x02c]	! Mem[000000001008142c] = ffffd1eb

p0_label_162:
!	%l4 = 00000000ffffffff, Mem[0000000010181410] = ff00d1eb
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffff
!	Mem[00000000300c1408] = ff0000ff, %l2 = 000000000000a69e
	ldsba	[%i3+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	%l4 = ffffffff, %l5 = 000000ff, Mem[00000000100c1400] = ff2cffe5 00000071
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffff 000000ff
!	%l4 = 00000000ffffffff, Mem[0000000010141430] = 1bf4f8dc053b2c10
	stx	%l4,[%i5+0x030]		! Mem[0000000010141430] = 00000000ffffffff
!	Mem[0000000010101408] = eb2e0000, %l5 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 000000eb000000ff
!	%f0  = 54030354 e5ff2cff, %l5 = 00000000000000eb
!	Mem[0000000030041420] = 00000000ff2770d4
	add	%i1,0x020,%g1
	stda	%f0,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030041420] = ff2c00e5ff030354
!	Mem[00000000211c0001] = ffff4b99, %l4 = 00000000ffffffff
	ldstub	[%o2+0x001],%l4		! %l4 = 000000ff000000ff
!	%l3 = 0000000000000000, %l1 = 00000000000000e5, %y  = 0000ff00
	sdiv	%l3,%l1,%l7		! %l7 = 000000007fffffff
	mov	%l0,%y			! %y = ff2770d4
!	Mem[000000001004143a] = 8ae1e2be, %l0 = ffffffffff2770d4
	ldstuba	[%i1+0x03a]%asi,%l0	! %l0 = 000000e2000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff8c2cff00000000, %f22 = ffffffff f90c00ff
	ldda	[%i6+%g0]0x81,%f22	! %f22 = ff8c2cff 00000000

p0_label_163:
!	Mem[0000000010041404] = 00000000, %l4 = 00000000000000ff
	ldsh	[%i1+0x004],%l4		! %l4 = 0000000000000000
!	Mem[00000000100c1428] = 00000000, %l2 = ffffffffffffffff
	lduh	[%i3+0x028],%l2		! %l2 = 0000000000000000
!	Mem[0000000030101410] = ff0000ff, %l4 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010181414] = 5c06ff76, %l6 = 00000000000000ff
	ldsha	[%i6+0x014]%asi,%l6	! %l6 = 0000000000005c06
!	Mem[0000000010141410] = 000000ffff000000, %l5 = 00000000000000eb
	ldx	[%i5+%o5],%l5		! %l5 = 000000ffff000000
!	Mem[0000000010181408] = ff000000, %l7 = 000000007fffffff
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030141410] = ae0d000000000000, %l4 = 00000000ff0000ff
	ldxa	[%i5+%o5]0x89,%l4	! %l4 = ae0d000000000000
!	Mem[0000000010101410] = 76ff065c0fbf9ea6, %f28 = af520c69 ff1de8de
	ldda	[%i4+%o5]0x88,%f28	! %f28 = 76ff065c 0fbf9ea6
!	Mem[00000000100c1418] = 000000ff f90c00ff, %l6 = 00005c06, %l7 = ff000000
	ldd	[%i3+0x018],%l6		! %l6 = 00000000000000ff 00000000f90c00ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000f90c00ff, Mem[0000000030081400] = e58c2cc0
	stba	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = e58c2cff

p0_label_164:
!	%l5 = 000000ffff000000, Mem[000000001010141e] = 053b7086
	sth	%l5,[%i4+0x01e]		! Mem[000000001010141c] = 053b0000
!	Mem[0000000030081408] = 9040db88, %l4 = ae0d000000000000
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 000000009040db88
!	%l6 = 00000000000000ff, Mem[0000000010181410] = ffffffff
	stwa	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff
!	%l5 = 000000ffff000000, Mem[0000000030081400] = ff2c8ce5
	stwa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000000
!	%l6 = 00000000000000ff, Mem[0000000030101400] = ff000000
	stwa	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	Mem[0000000010141410] = 000000ff ff000000, %l6 = 000000ff, %l7 = f90c00ff
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 00000000000000ff 00000000ff000000
!	Mem[0000000030041410] = ae0d0000, %l5 = 000000ffff000000
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010001410] = ffffff76
	stha	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00ffff76
!	%f22 = ff8c2cff, Mem[0000000010041410] = ff000000
	sta	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = ff8c2cff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = bee20000, %l2 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l2	! %l2 = 00000000bee20000

p0_label_165:
!	Mem[00000000100c1410] = ffffffff, %l0 = 00000000000000e2
	ldsha	[%i3+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141400] = 00006c00, %l7 = 00000000ff000000
	lduwa	[%i5+%g0]0x80,%l7	! %l7 = 0000000000006c00
!	Mem[0000000030141410] = 00000000, %l0 = ffffffffffffffff
	ldsha	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l2 = 00000000bee20000
	lduwa	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 00006c00, %l5 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800180] = 846e1c36, %l2 = 0000000000000000
	lduba	[%o3+0x181]%asi,%l2	! %l2 = 000000000000006e
!	Mem[0000000030141400] = 00000000, %l0 = 0000000000000000
	ldswa	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = ff000000, %l1 = 00000000000000e5
	lduwa	[%i4+%g0]0x89,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010141408] = 00000000, %l1 = 00000000ff000000
	lduwa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f28 = 76ff065c 0fbf9ea6, %l4 = 000000009040db88
!	Mem[0000000010041420] = b63600ffe55419d1
	add	%i1,0x020,%g1
	stda	%f28,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010041420] = b636000fe5541976

p0_label_166:
!	Mem[0000000030041408] = ff009e3d, %l6 = 00000000000000ff
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 00000000ff009e3d
!	Mem[00000000218000c0] = 16ff3492, %l4 = 000000009040db88
	ldstuba	[%o3+0x0c0]%asi,%l4	! %l4 = 00000016000000ff
!	%l2 = 000000000000006e, Mem[0000000010081408] = 00000000
	stwa	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000006e
!	%f28 = 76ff065c 0fbf9ea6, Mem[00000000100c1408] = 00000000 00000000
	std	%f28,[%i3+%o4]	! Mem[00000000100c1408] = 76ff065c 0fbf9ea6
!	Mem[0000000010101410] = 0fbf9ea6, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 000000000fbf9ea6
!	Mem[0000000030141410] = 00000000, %l0 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001406] = 000057ff, %l5 = 0000000000000000
	ldstuba	[%i0+0x006]%asi,%l5	! %l5 = 00000057000000ff
!	%l7 = 0000000000006c00, Mem[0000000010181410] = ff000000
	stha	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = ff006c00
!	%l3 = 000000000fbf9ea6, Mem[0000000030181400] = ff8c2cff00000000
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000000fbf9ea6
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff8c2cff, %l7 = 0000000000006c00
	lduwa	[%i1+%o5]0x88,%l7	! %l7 = 00000000ff8c2cff

p0_label_167:
!	Mem[0000000010081418] = b15bff3f, %l0 = 0000000000000000
	ldsw	[%i2+0x018],%l0		! %l0 = ffffffffb15bff3f
!	Mem[0000000010081438] = 0000000000000000, %f4  = ff570000 ffdc0354
	ldda	[%i2+0x038]%asi,%f4 	! %f4  = 00000000 00000000
!	Mem[0000000010181408] = 000000ff, %l5 = 0000000000000057
	lduwa	[%i6+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101410] = 00000000 5c06ff76, %l6 = ff009e3d, %l7 = ff8c2cff
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000 000000005c06ff76
!	Mem[00000000201c0000] = ffffeaae, %l7 = 000000005c06ff76
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Code Fragment 4
p0_fragment_28:
!	%l0 = ffffffffb15bff3f
	setx	0xc28c8d2876ebbeb0,%g7,%l0 ! %l0 = c28c8d2876ebbeb0
!	%l1 = 0000000000000000
	setx	0xf41d6590374cced1,%g7,%l1 ! %l1 = f41d6590374cced1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c28c8d2876ebbeb0
	setx	0xdc327c4fb23c3131,%g7,%l0 ! %l0 = dc327c4fb23c3131
!	%l1 = f41d6590374cced1
	setx	0x52bafdf006f4d73f,%g7,%l1 ! %l1 = 52bafdf006f4d73f
!	Mem[0000000010041430] = ff000000 ff2770d4, %l2 = 0000006e, %l3 = 0fbf9ea6
	ldda	[%i1+0x030]%asi,%l2	! %l2 = 00000000ff000000 00000000ff2770d4
!	Mem[0000000010081428] = 000000f2 ffffd1eb, %l4 = 00000016, %l5 = 000000ff
	ldda	[%i2+0x028]%asi,%l4	! %l4 = 00000000000000f2 00000000ffffd1eb
!	Code Fragment 4
p0_fragment_29:
!	%l0 = dc327c4fb23c3131
	setx	0x5f7115a7c0d02762,%g7,%l0 ! %l0 = 5f7115a7c0d02762
!	%l1 = 52bafdf006f4d73f
	setx	0xb69baddfdb7feada,%g7,%l1 ! %l1 = b69baddfdb7feada
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5f7115a7c0d02762
	setx	0x54c247a045a8fe4f,%g7,%l0 ! %l0 = 54c247a045a8fe4f
!	%l1 = b69baddfdb7feada
	setx	0x5528be286c17b8bf,%g7,%l1 ! %l1 = 5528be286c17b8bf
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = e095a555, %l2 = 00000000ff000000
	ldstub	[%o1+0x041],%l2		! %l2 = 00000095000000ff

p0_label_168:
!	%l4 = 000000f2, %l5 = ffffd1eb, Mem[0000000030041400] = 000000f2 c303c506
	stda	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000f2 ffffd1eb
!	Mem[0000000030141410] = 00000000, %l0 = 54c247a045a8fe4f
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081418] = b15bff3f, %l0 = 00000000, %l0 = 00000000
	add	%i2,0x18,%g1
	casa	[%g1]0x80,%l0,%l0	! %l0 = 00000000b15bff3f
!	%l0 = 00000000b15bff3f, Mem[0000000010001405] = 0000ffff
	stb	%l0,[%i0+0x005]		! Mem[0000000010001404] = 003fffff
!	%l7 = 000000000000ffff, Mem[0000000010141410] = 000000ffff000000
	stxa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000000000ffff
!	Mem[00000000211c0000] = ffff4b99, %l3 = 00000000ff2770d4
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010041410] = ff2c8cff, %l5 = 00000000ffffd1eb
	ldstuba	[%i1+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	%l1 = 5528be286c17b8bf, Mem[0000000030041408] = 000000ff
	stha	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000b8bf
!	Mem[0000000030001400] = 4db7ffff, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 000000004db7ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0000000000000000, %f26 = ff05617e ffd356c0
	ldda	[%i5+%g0]0x81,%f26	! %f26 = 00000000 00000000

p0_label_169:
!	Mem[000000001018141c] = 3fff5bb1, %l2 = 0000000000000095
	ldub	[%i6+0x01f],%l2		! %l2 = 00000000000000b1
!	Mem[00000000300c1410] = e5ff2cff, %l6 = 000000004db7ffff
	ldswa	[%i3+%o5]0x89,%l6	! %l6 = ffffffffe5ff2cff
!	Mem[0000000010181408] = ff0000ff 000000ff, %l6 = e5ff2cff, %l7 = 0000ffff
	ldda	[%i6+%o4]0x88,%l6	! %l6 = 00000000000000ff 00000000ff0000ff
!	Mem[0000000030141410] = ae0d0000000000ff, %l4 = 00000000000000f2
	ldxa	[%i5+%o5]0x89,%l4	! %l4 = ae0d0000000000ff
!	Mem[0000000010081410] = 0000f8dc, %l4 = ae0d0000000000ff
	ldswa	[%i2+%o5]0x80,%l4	! %l4 = 000000000000f8dc
!	Mem[0000000030181408] = ff000000d37a8e6c, %f26 = 00000000 00000000
	ldda	[%i6+%o4]0x81,%f26	! %f26 = ff000000 d37a8e6c
!	%f10 = ff269c42, %f31 = e58c2cff, %f3  = 00000dae
	fdivs	%f10,%f31,%f3 		! %f3  = 59182374
!	Mem[0000000030041410] = ff000dae00000000, %f2  = 6c000000 59182374
	ldda	[%i1+%o5]0x81,%f2 	! %f2  = ff000dae 00000000
!	Mem[00000000100c1410] = ffffffff, %l7 = 00000000ff0000ff
	lduwa	[%i3+%o5]0x88,%l7	! %l7 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 00000000, %l5 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000

p0_label_170:
!	%l4 = 000000000000f8dc, Mem[00000000100c1408] = 76ff065c
	stwa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000f8dc
!	%f19 = 00000000, Mem[0000000010081410] = 0000f8dc
	sta	%f19,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%f0  = 54030354 e5ff2cff, %l2 = 00000000000000b1
!	Mem[0000000030041408] = bfb80000f2000000
	add	%i1,0x008,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_S ! Mem[0000000030041408] = 54b80354f20000ff
!	Mem[0000000030141400] = 00000000, %l2 = 00000000000000b1
	swapa	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Code Fragment 4
p0_fragment_30:
!	%l0 = 00000000b15bff3f
	setx	0xb89e590fafe89698,%g7,%l0 ! %l0 = b89e590fafe89698
!	%l1 = 5528be286c17b8bf
	setx	0xf1a5dfe7a06347e8,%g7,%l1 ! %l1 = f1a5dfe7a06347e8
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b89e590fafe89698
	setx	0x742a5affa65217ec,%g7,%l0 ! %l0 = 742a5affa65217ec
!	%l1 = f1a5dfe7a06347e8
	setx	0xa33933486a62c401,%g7,%l1 ! %l1 = a33933486a62c401
!	%l6 = 000000ff, %l7 = ffffffff, Mem[0000000010181410] = ff006c00 76ff065c
	stda	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff ffffffff
!	%l7 = 00000000ffffffff, Mem[0000000030141410] = ff000000
	stba	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000
!	%f26 = ff000000 d37a8e6c, Mem[0000000010081400] = ffdc0354 ffd356c0
	stda	%f26,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000 d37a8e6c
!	Mem[0000000010081400] = 6c8e7ad3, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 000000006c8e7ad3
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 54030354 e5ff2cff, %l4 = 0000f8dc, %l5 = 00000000
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 00000000e5ff2cff 0000000054030354

p0_label_171:
!	Mem[0000000010181400] = 2ac4d1eb, %l5 = 0000000054030354
	lduha	[%i6+%g0]0x88,%l5	! %l5 = 000000000000d1eb
!	Mem[00000000300c1400] = 00002eeb, %l4 = 00000000e5ff2cff
	ldswa	[%i3+%g0]0x89,%l4	! %l4 = 0000000000002eeb
!	Mem[0000000030181400] = a69ebf0f00000000, %l2 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = a69ebf0f00000000
!	Mem[0000000010141410] = 00000000, %l0 = 742a5affa65217ec
	lduwa	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = 00000000ffdc0354, %f24 = ffdc0354 ff0000ff
	ldda	[%i2+%o5]0x80,%f24	! %f24 = 00000000 ffdc0354
!	Mem[0000000010101410] = 76ff065c00000000, %l4 = 0000000000002eeb
	ldxa	[%i4+%o5]0x88,%l4	! %l4 = 76ff065c00000000
!	Mem[0000000030141400] = 000000b1, %l6 = 000000006c8e7ad3
	lduba	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000b1
!	Mem[0000000030041410] = ff000dae, %l6 = 00000000000000b1
	ldswa	[%i1+%o5]0x81,%l6	! %l6 = ffffffffff000dae
!	Mem[0000000030041410] = ae0d00ff, %l1 = a33933486a62c401
	ldsha	[%i1+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ffffffff, Mem[0000000010101410] = 00000000
	stba	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff

p0_label_172:
!	%l1 = 00000000000000ff, Mem[0000000010081436] = 0000008c
	sth	%l1,[%i2+0x036]		! Mem[0000000010081434] = 000000ff
!	%f13 = 000057ff, Mem[0000000010181410] = ff000000
	sta	%f13,[%i6+%o5]0x80	! Mem[0000000010181410] = 000057ff
!	Mem[0000000010041410] = ff8c2cff, %l6 = ffffffffff000dae
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 00000000ff8c2cff
!	%l7 = 00000000ffffffff, Mem[0000000030081408] = 00000000
	stwa	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffffff
!	Mem[0000000010001432] = dee81dff, %l3 = 00000000000000ff
	ldstuba	[%i0+0x032]%asi,%l3	! %l3 = 0000001d000000ff
!	Mem[000000001010140c] = f200ffff, %l2 = a69ebf0f00000000
	ldstub	[%i4+0x00c],%l2		! %l2 = 000000f2000000ff
!	%f20 = 000000f2 81f1fffe, Mem[0000000010181408] = ff000000 ff0000ff
	stda	%f20,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000f2 81f1fffe
!	Mem[0000000010041410] = ff000dae, %l1 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 00000000ff000dae
!	Mem[00000000211c0000] = ffff4b99, %l6 = 00000000ff8c2cff
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffffffff, %l2 = 00000000000000f2
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 00000000ffffffff

p0_label_173:
!	Mem[0000000010101410] = 000000ff, %l1 = 00000000ff000dae
	lduha	[%i4+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = 000057ff, %f11 = 5c06ff76
	lda	[%i6+%o5]0x80,%f11	! %f11 = 000057ff
!	Mem[0000000010181408] = f2000000, %l0 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = fffffffff2000000
!	Mem[0000000010181400] = 2ac4d1eb, %f8  = ffffed05
	lda	[%i6+%g0]0x88,%f8 	! %f8 = 2ac4d1eb
!	Mem[0000000010181400] = ebd1c42a, %l0 = fffffffff2000000
	lduwa	[%i6+%g0]0x80,%l0	! %l0 = 00000000ebd1c42a
!	Mem[0000000030081408] = 00000000 ffffffff, %l2 = ffffffff, %l3 = 0000001d
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[0000000010001400] = 3ae0ff95, %l0 = 00000000ebd1c42a
	lduha	[%i0+%g0]0x80,%l0	! %l0 = 0000000000003ae0
!	Mem[0000000010141408] = 00000000, %l5 = 000000000000d1eb
	lduwa	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = 95ffe03a, %l6 = 00000000000000ff
	lduha	[%i0+%g0]0x88,%l6	! %l6 = 000000000000e03a
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 00f20000, %l6 = 000000000000e03a
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 00000000000000ff

p0_label_174:
!	%l2 = 00000000ffffffff, Mem[0000000010101408] = 00002eff
	stba	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 00002eff
!	%l2 = 00000000ffffffff, Mem[0000000030001408] = dcf800003ae0ff95
	stxa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000ffffffff
!	Mem[0000000010101408] = 00002eff, %l1 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 0000000000002eff
!	Mem[0000000020800041] = e0ffa555, %l4 = 76ff065c00000000
	ldstuba	[%o1+0x041]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010081408] = 6e000000, %l5 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 000000006e000000
!	%f20 = 000000f2 81f1fffe, Mem[00000000100c1400] = ffffffff ff000000
	stda	%f20,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000f2 81f1fffe
!	Mem[0000000010181410] = 000057ff, %l7 = 00000000ffffffff
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 00000000000057ff
!	%l3 = 0000000000000000, Mem[0000000010041410] = ff000000
	stha	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	Mem[0000000030181408] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	%f30 = ffffd1eb, %f23 = 00000000, %f29 = 0fbf9ea6
	fsubs	%f30,%f23,%f29		! %f29 = ffffd1eb

p0_label_175:
!	Mem[0000000030141400] = 00000000000000b1, %l6 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000b1
!	Mem[00000000100c1400] = fefff181 f2000000, %l4 = 000000ff, %l5 = 6e000000
	ldda	[%i3+0x000]%asi,%l4	! %l4 = 00000000fefff181 00000000f2000000
!	Mem[0000000030141410] = 000000ff, %l2 = 00000000ffffffff
	lduba	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = ffffeaae, %l5 = 00000000f2000000
	ldsh	[%o0+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010001410] = 76ffff00, %f25 = ffdc0354
	lda	[%i0+%o5]0x88,%f25	! %f25 = 76ffff00
!	Mem[0000000010101408] = ff000000, %l4 = 00000000fefff181
	lduba	[%i4+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = ff0000000000f2ff, %l6 = 00000000000000b1
	ldxa	[%i4+%o4]0x89,%l6	! %l6 = ff0000000000f2ff
!	Mem[0000000010041404] = 00000000, %f23 = 00000000
	ld	[%i1+0x004],%f23	! %f23 = 00000000
!	Mem[00000000201c0000] = ffffeaae, %l6 = ff0000000000f2ff
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010101400] = 000000ff
	stba	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff

p0_label_176:
!	%l6 = 000000ff, %l7 = 000057ff, Mem[0000000010101410] = ff000000 5c06ff76
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff 000057ff
!	Mem[0000000030181410] = 000000ff, %l5 = ffffffffffffffff
	ldstuba	[%i6+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[000000001010140c] = ff00ffff, %l4 = 00000000000000ff
	swap	[%i4+0x00c],%l4		! %l4 = 00000000ff00ffff
!	Mem[0000000030141410] = 000000ff, %l3 = 00000000000000ff
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%f18 = ff0000ff 00000000, %l5 = 00000000000000ff
!	Mem[0000000010081438] = 0000000000000000
	add	%i2,0x038,%g1
	stda	%f18,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010081438] = 00000000ff0000ff
!	%l6 = 00000000000000ff, Mem[0000000010081410] = 00000000
	stwa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	%l0 = 0000000000003ae0, Mem[00000000211c0000] = ffff4b99, %asi = 80
	stba	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = e0ff4b99
!	Mem[0000000010141408] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001410] = 76ffff00, %l6 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000ae0d00ff, %l2 = 00000000000000ff
	ldxa	[%i1+%o5]0x89,%l2	! %l2 = 00000000ae0d00ff

p0_label_177:
!	Mem[00000000201c0000] = ffffeaae, %l1 = 0000000000002eff
	ldsb	[%o0+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010041408] = 429c26ff, %l3 = 00000000000000ff
	lduwa	[%i1+%o4]0x88,%l3	! %l3 = 00000000429c26ff
!	Mem[00000000300c1400] = 00002eeb, %l7 = 00000000000057ff
	ldswa	[%i3+%g0]0x89,%l7	! %l7 = 0000000000002eeb
!	Mem[0000000010141404] = 00000000, %l1 = ffffffffffffffff
	ldsha	[%i5+0x004]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = b1000000, %l7 = 0000000000002eeb
	lduwa	[%i5+%g0]0x81,%l7	! %l7 = 00000000b1000000
!	Mem[0000000020800000] = 00ff5b63, %l1 = 0000000000000000
	ldub	[%o1+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030081410] = 5c06ff76, %l3 = 00000000429c26ff
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 000000005c06ff76
!	Mem[0000000010041400] = ff000000, %l6 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010101410] = 000000ff000057ff, %f28 = 76ff065c ffffd1eb
	ldda	[%i4+%o5]0x80,%f28	! %f28 = 000000ff 000057ff
!	Starting 10 instruction Store Burst
!	%f2  = ff000dae, Mem[00000000300c1400] = 00002eeb
	sta	%f2 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff000dae

p0_label_178:
!	%f24 = 00000000 76ffff00, Mem[0000000010041408] = ff269c42 5c06ff76
	stda	%f24,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 76ffff00
!	%l3 = 000000005c06ff76, Mem[0000000021800181] = 846e1c36, %asi = 80
	stba	%l3,[%o3+0x181]%asi	! Mem[0000000021800180] = 84761c36
!	Mem[0000000030001408] = ffffffff, %l0 = 0000000000003ae0
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 00000000ffffffff
!	%f24 = 00000000 76ffff00, %l1 = 00000000000000ff
!	Mem[0000000010181410] = ffffffffffffffff
	add	%i6,0x010,%g1
	stda	%f24,[%g1+%l1]ASI_PST8_P ! Mem[0000000010181410] = 0000000076ffff00
!	Mem[0000000030141408] = f200ffff, %f28 = 000000ff
	lda	[%i5+%o4]0x89,%f28	! %f28 = f200ffff
!	%l0 = ffffffff, %l1 = 000000ff, Mem[0000000030141400] = 000000b1 00000000
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffff 000000ff
!	%l7 = 00000000b1000000, Mem[0000000030081400] = ff000000ae0d00ff
	stxa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000b1000000
!	%f12 = 00000000 000057ff, %l1 = 00000000000000ff
!	Mem[00000000100c1420] = 0c0000ff000000ff
	add	%i3,0x020,%g1
	stda	%f12,[%g1+%l1]ASI_PST16_P ! Mem[00000000100c1420] = 00000000000057ff
!	%l0 = ffffffff, %l1 = 000000ff, Mem[0000000030101410] = ff0000ff 00000000
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = 00ff3e7c, %l6 = 00000000ff000000
	lduba	[%o3+0x080]%asi,%l6	! %l6 = 0000000000000000

p0_label_179:
!	Mem[0000000010141428] = 6b6a62a09aea71c3, %f6  = 000000ff 00000000
	ldda	[%i5+0x028]%asi,%f6 	! %f6  = 6b6a62a0 9aea71c3
!	Mem[0000000010101408] = ff000000000000ff, %l1 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l1	! %l1 = ff000000000000ff
!	Mem[0000000010081410] = ff000000 ffdc0354, %l4 = ff00ffff, %l5 = 00000000
	ldda	[%i2+0x010]%asi,%l4	! %l4 = 00000000ff000000 00000000ffdc0354
!	Mem[00000000211c0000] = e0ff4b99, %l4 = 00000000ff000000
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffe0ff
!	Mem[00000000100c1408] = 0000f8dc, %l3 = 000000005c06ff76
	ldsha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = ff2cffe5 54030354, %l2 = ae0d00ff, %l3 = 00000000
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000ff2cffe5 0000000054030354
!	%f11 = 000057ff, %f11 = 000057ff, %f6  = 6b6a62a0
	fmuls	%f11,%f11,%f6 		! %f6  = 00000000
!	Mem[0000000010041400] = ff000000, %l2 = 00000000ff2cffe5
	ldswa	[%i1+%g0]0x88,%l2	! %l2 = ffffffffff000000
!	Mem[0000000030101408] = 0000f2ff, %l1 = ff000000000000ff
	lduba	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffff000000, Mem[0000000010041400] = ff000000
	stwa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000

p0_label_180:
!	Mem[0000000010041400] = 000000ff, %l3 = 0000000054030354
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[00000000100c1410] = ffffffff
	stwa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	%f20 = 000000f2 81f1fffe, Mem[0000000030041400] = 000000f2 ffffd1eb
	stda	%f20,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000f2 81f1fffe
!	Mem[0000000010101424] = 7a78ffd6, %l7 = 00000000b1000000
	swap	[%i4+0x024],%l7		! %l7 = 000000007a78ffd6
!	%l6 = 0000000000000000, Mem[0000000010181408] = 000000f281f1fffe
	stxa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	Mem[0000000030001400] = 000000ff, %l0 = 00000000ffffffff
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001408] = ff000000, %l7 = 000000007a78ffd6
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	%f18 = ff0000ff, Mem[0000000010041408] = 00000000
	sta	%f18,[%i1+%o4]0x80	! Mem[0000000010041408] = ff0000ff
!	Mem[0000000010041410] = 00000000, %l4 = ffffffffffffe0ff
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff000dae, %l4 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = ffffffffffffff00

p0_label_181:
!	Mem[0000000030141408] = ff000080f200ffff, %l0 = 0000000000000000
	ldxa	[%i5+%o4]0x89,%l0	! %l0 = ff000080f200ffff
!	Mem[0000000010181408] = 00000000, %l4 = ffffffffffffff00
	lduwa	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101414] = 000057ff, %l3 = 00000000000000ff
	ldsw	[%i4+0x014],%l3		! %l3 = 00000000000057ff
!	Mem[0000000010101400] = 000000ff, %f8  = 2ac4d1eb
	lda	[%i4+%g0]0x88,%f8 	! %f8 = 000000ff
!	Mem[0000000030181400] = 00000000, %l3 = 00000000000057ff
	lduba	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 81f1fffe, %l3 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l3	! %l3 = fffffffffffffffe
!	Mem[00000000100c141c] = f90c00ff, %l1 = 00000000000000ff
	lduba	[%i3+0x01f]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181400] = ebd1c42a, %f11 = 000057ff
	lda	[%i6+%g0]0x80,%f11	! %f11 = ebd1c42a
!	Mem[0000000010101408] = ff000000000000ff, %l1 = 00000000000000ff
	ldxa	[%i4+%o4]0x88,%l1	! %l1 = ff000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081434] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i2+0x034]%asi,%l6	! %l6 = 00000000000000ff

p0_label_182:
!	%l6 = 0000000000000000, Mem[0000000010081438] = 00000000
	stb	%l6,[%i2+0x038]		! Mem[0000000010081438] = 00000000
!	Mem[0000000010081428] = 000000f2, %l6 = 0000000000000000
	swap	[%i2+0x028],%l6		! %l6 = 00000000000000f2
!	Mem[0000000030001400] = ff0000ff, %l0 = ff000080f200ffff
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 00000000ff0000ff
!	%l3 = fffffffffffffffe, Mem[00000000100c1408] = 0000f8dc
	stha	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = fffef8dc
!	%l6 = 00000000000000f2, Mem[00000000300c1408] = ff0000ff
	stwa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000f2
!	Mem[0000000030101408] = 0000f2ff, %l6 = 00000000000000f2
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 000000000000f2ff
!	Mem[0000000010181428] = a69ebf0f, %l7 = 00000000000000ff
	swap	[%i6+0x028],%l7		! %l7 = 00000000a69ebf0f
!	%l4 = 0000000000000000, Mem[0000000030181410] = 000000ff
	stwa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%l2 = ffffffffff000000, Mem[0000000030181400] = 00000000
	stwa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 54030354, %l0 = 00000000ff0000ff
	lduha	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000354

p0_label_183:
!	Mem[00000000211c0000] = e0ff4b99, %l4 = 0000000000000000
	ldub	[%o2+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030141400] = ffffffff, %l5 = 00000000ffdc0354
	ldsba	[%i5+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1410] = 54030354e5ff2cff, %l2 = ffffffffff000000
	ldxa	[%i3+%o5]0x89,%l2	! %l2 = 54030354e5ff2cff
!	%l1 = ff000000000000ff, %l3 = fffffffffffffffe, %y  = ff2770d4
	sdiv	%l1,%l3,%l4		! %l4 = 000000007fffffff
	mov	%l0,%y			! %y = 00000354
!	Mem[00000000201c0000] = ffffeaae, %l0 = 0000000000000354
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	%l2 = 54030354e5ff2cff, Mem[0000000030081410] = 5c06ff76
	stba	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 5c06ffff
!	%l4 = 000000007fffffff, %l3 = fffffffffffffffe, %l5 = ffffffffffffffff
	add	%l4,%l3,%l5		! %l5 = 000000007ffffffd
!	Mem[0000000010101408] = ff000000, %l4 = 000000007fffffff
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010001408] = ff00000000000000, %l7 = 00000000a69ebf0f
	ldxa	[%i0+%o4]0x80,%l7	! %l7 = ff00000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000f2ff, Mem[0000000010001400] = 95ffe03a
	stwa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000f2ff

p0_label_184:
!	%f12 = 00000000 000057ff, Mem[0000000010181400] = ebd1c42a 23c848d7
	stda	%f12,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000 000057ff
!	%l4 = ffffff00, %l5 = 7ffffffd, Mem[0000000030181400] = 000000ff a69ebf0f
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffff00 7ffffffd
!	%l7 = ff00000000000000, Mem[0000000021800140] = 00008319, %asi = 80
	stha	%l7,[%o3+0x140]%asi	! Mem[0000000021800140] = 00008319
!	Mem[00000000100c1408] = dcf8feff, %l4 = ffffffffffffff00
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 00000000dcf8feff
!	%l0 = ffffffff, %l1 = 000000ff, Mem[0000000030001408] = 00003ae0 00000000
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff 000000ff
!	%l4 = 00000000dcf8feff, Mem[0000000030101410] = ffffffff
	stwa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = dcf8feff
!	%f30 = ffffd1eb e58c2cff, %l5 = 000000007ffffffd
!	Mem[0000000010041400] = 5403035400000000
	stda	%f30,[%i1+%l5]ASI_PST32_P ! Mem[0000000010041400] = 54030354e58c2cff
!	Mem[0000000030081408] = ffffffff, %l4 = 00000000dcf8feff
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010041400] = 54030354, %l3 = fffffffffffffffe
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 00000054000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %l1 = ff000000000000ff
	lduwa	[%i0+%o4]0x80,%l1	! %l1 = 00000000ff000000

p0_label_185:
!	Mem[0000000030081408] = 00000000 ffffffff, %l4 = 000000ff, %l5 = 7ffffffd
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Mem[0000000010081400] = ff000000, %l2 = 54030354e5ff2cff
	lduwa	[%i2+%g0]0x88,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010141400] = 00000000006c0000, %f8  = 000000ff ffa56439
	ldda	[%i5+%g0]0x88,%f8 	! %f8  = 00000000 006c0000
!	Mem[0000000010101408] = ff000000000000ff, %l7 = ff00000000000000
	ldxa	[%i4+%o4]0x88,%l7	! %l7 = ff000000000000ff
!	Mem[0000000010141424] = e55419d1, %l2 = 00000000ff000000
	ldsb	[%i5+0x026],%l2		! %l2 = 0000000000000019
!	%f27 = d37a8e6c, %f9  = 006c0000
	fcmpes	%fcc0,%f27,%f9 		! %fcc0 = 1
!	Mem[0000000030141400] = ffffffffff000000, %f12 = 00000000 000057ff
	ldda	[%i5+%g0]0x81,%f12	! %f12 = ffffffff ff000000
!	Mem[00000000300c1410] = e5ff2cff, %l1 = 00000000ff000000
	lduha	[%i3+%o5]0x89,%l1	! %l1 = 0000000000002cff
!	Mem[0000000010101408] = ff000000000000ff, %l2 = 0000000000000019
	ldxa	[%i4+%o4]0x88,%l2	! %l2 = ff000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001419] = 00000000, %l6 = 000000000000f2ff
	ldstub	[%i0+0x019],%l6		! %l6 = 00000000000000ff

p0_label_186:
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000030081408] = ffffffff 00000000
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 000000ff
!	%l7 = ff000000000000ff, Mem[0000000010101408] = ff000000000000ff
	stxa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000000000ff
!	%f31 = e58c2cff, Mem[0000000010141410] = 00000000
	sta	%f31,[%i5+%o5]0x80	! Mem[0000000010141410] = e58c2cff
!	Mem[00000000100c1421] = 00000000, %l3 = 0000000000000054
	ldstub	[%i3+0x021],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l1 = 0000000000002cff
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010041400] = ff030354 e58c2cff
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 000000ff
!	%f14 = 00000000, Mem[0000000010181400] = ff000000
	sta	%f14,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%f16 = ff2c8ce5, Mem[0000000030101408] = f2000000
	sta	%f16,[%i4+%o4]0x81	! Mem[0000000030101408] = ff2c8ce5
!	%l0 = ffffffff, %l1 = 00000000, Mem[0000000010001400] = 0000f2ff ffff3f00
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ff

p0_label_187:
!	Mem[00000000300c1408] = f2000000, %l2 = ff000000000000ff
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = b15b0000ffff00f2, %l7 = ff000000000000ff
	ldxa	[%i0+%g0]0x89,%l7	! %l7 = b15b0000ffff00f2
!	Mem[00000000300c1400] = ae0d00ff00000000, %f0  = 54030354 e5ff2cff
	ldda	[%i3+%g0]0x81,%f0 	! %f0  = ae0d00ff 00000000
!	Mem[0000000010081410] = 000000ff, %l6 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141434] = ffffffff, %l2 = 0000000000000000
	lduh	[%i5+0x036],%l2		! %l2 = 000000000000ffff
!	Mem[0000000010181408] = 00000000, %l1 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = ff00000000000dae, %f16 = ff2c8ce5 00000071
	ldda	[%i5+%o5]0x81,%f16	! %f16 = ff000000 00000dae
!	Starting 10 instruction Store Burst
!	%l7 = b15b0000ffff00f2, Mem[000000001018141a] = c056b74d, %asi = 80
	stha	%l7,[%i6+0x01a]%asi	! Mem[0000000010181418] = c05600f2

p0_label_188:
!	%l4 = 00000000ffffffff, Mem[0000000030081408] = ff00000000000000
	stxa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000ffffffff
!	Mem[0000000030081400] = 00000000, %l4 = 00000000ffffffff
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l0 = ffffffffffffffff, Mem[0000000010001408] = 00000000000000ff
	stxa	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffffffffffff
!	%f12 = ffffffff ff000000, Mem[0000000030141400] = ffffffff ff000000
	stda	%f12,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffff ff000000
!	%f6  = 00000000 9aea71c3, Mem[0000000030181400] = ffffff00 7ffffffd
	stda	%f6 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 9aea71c3
!	%l2 = 000000000000ffff, Mem[0000000021800080] = 00ff3e7c
	stb	%l2,[%o3+0x080]		! Mem[0000000021800080] = ffff3e7c
!	%f24 = 00000000 76ffff00, %l3 = 00000000000000ff
!	Mem[0000000030041408] = 54b80354f20000ff
	add	%i1,0x008,%g1
	stda	%f24,[%g1+%l3]ASI_PST16_S ! Mem[0000000030041408] = 0000000076ffff00
!	%f16 = ff000000, %f9  = 006c0000, %f0  = ae0d00ff
	fsubs	%f16,%f9 ,%f0 		! %l0 = 0000000000000021, Unfinished, %fsr = 2b00000400
!	Mem[00000000100c1435] = ff1de8de, %l0 = 0000000000000021
	ldstub	[%i3+0x035],%l0		! %l0 = 0000001d000000ff
!	Starting 10 instruction Load Burst
!	%f20 = 000000f2, %f24 = 00000000
	fsqrts	%f20,%f24		! %l0 = 000000000000003f, Unfinished, %fsr = 2b00000400

p0_label_189:
!	Mem[0000000030041410] = ff000dae 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 00000000ff000dae 0000000000000000
!	Mem[0000000030001400] = ffff00f2, %l1 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000f2
!	Mem[000000001004143c] = 7b3c982e, %l4 = 00000000ff000dae
	ldsw	[%i1+0x03c],%l4		! %l4 = 000000007b3c982e
!	Mem[0000000030181408] = ff000000, %l7 = b15b0000ffff00f2
	ldsba	[%i6+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041410] = ff000dae, %l1 = 00000000000000f2
	ldsba	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041408] = 00000000, %f20 = 000000f2
	lda	[%i1+%o4]0x89,%f20	! %f20 = 00000000
!	Mem[00000000300c1400] = ff000dae, %l4 = 000000007b3c982e
	ldsha	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000dae
!	Mem[0000000010181410] = 00ffff7600000000, %l3 = 00000000000000ff
	ldxa	[%i6+%o5]0x88,%l3	! %l3 = 00ffff7600000000
!	Mem[00000000100c1418] = 000000ff, %l7 = ffffffffffffffff
	lduwa	[%i3+0x018]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010041400] = 00000000
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = ff000000

p0_label_190:
!	%l0 = 0000003f, %l1 = ffffffff, Mem[0000000030141400] = ffffffff ff000000
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000003f ffffffff
!	Mem[00000000100c1408] = 00ffffff, %l0 = 000000000000003f
	swapa	[%i3+%o4]0x80,%l0	! %l0 = 0000000000ffffff
!	Mem[0000000021800181] = 84761c36, %l3 = 00ffff7600000000
	ldstuba	[%o3+0x181]%asi,%l3	! %l3 = 00000076000000ff
!	Mem[0000000010041408] = ff0000ff, %l5 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	%l4 = 0000000000000dae, Mem[0000000010101424] = b1000000, %asi = 80
	stba	%l4,[%i4+0x024]%asi	! Mem[0000000010101424] = ae000000
!	%l5 = 00000000000000ff, Mem[0000000010181410] = 0000000076ffff00, %asi = 80
	stxa	%l5,[%i6+0x010]%asi	! Mem[0000000010181410] = 00000000000000ff
!	Mem[0000000010181438] = 77dc5bffadf36949, %l3 = 0000000000000076, %l3 = 0000000000000076
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = 77dc5bffadf36949
!	Mem[0000000030181410] = 00000000, %l6 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%l4 = 0000000000000dae, Mem[0000000010141408] = ff000000
	stwa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000dae
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = c05600f2, %l4 = 0000000000000dae
	ldsb	[%i6+0x01a],%l4		! %l4 = 0000000000000000

p0_label_191:
!	Mem[0000000030081400] = ffffffff, %l4 = 0000000000000000
	lduha	[%i2+%g0]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[00000000100c1408] = 3f000000, %l1 = ffffffffffffffff
	lduba	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041400] = 000000f2, %l4 = 000000000000ffff
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l2 = 000000000000ffff
	lduba	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181410] = 000000ff, %l2 = 00000000000000ff
	lduwa	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001400] = ffffffff, %f15 = 00000000
	lda	[%i0+%g0]0x80,%f15	! %f15 = ffffffff
!	Mem[0000000030181400] = 9aea71c3, %l1 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000c3
!	Mem[0000000010081420] = 3964a5ff, %l4 = 0000000000000000
	ldsw	[%i2+0x020],%l4		! %l4 = 000000003964a5ff
!	Mem[0000000010101408] = ff000000, %l0 = 0000000000ffffff
	ldswa	[%i4+0x008]%asi,%l0	! %l0 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%f10 = ff269c42 ebd1c42a, Mem[0000000030041410] = ae0d00ff 00000000
	stda	%f10,[%i1+%o5]0x89	! Mem[0000000030041410] = ff269c42 ebd1c42a

p0_label_192:
!	Mem[0000000030081400] = ffffffff, %l5 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000201c0001] = ffffeaae, %l5 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[000000001010141c] = 053b0000, %l0 = ffffffffff000000, %asi = 80
	swapa	[%i4+0x01c]%asi,%l0	! %l0 = 00000000053b0000
!	%l3 = 77dc5bffadf36949, Mem[0000000020800041] = e0ffa555, %asi = 80
	stba	%l3,[%o1+0x041]%asi	! Mem[0000000020800040] = e049a555
!	%l0 = 00000000053b0000, Mem[0000000010101410] = 000000ff
	stwa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 053b0000
!	Mem[0000000030141400] = 0000003f, %l5 = 00000000000000ff
	ldstuba	[%i5+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l4 = 000000003964a5ff, Mem[0000000030181408] = ff000000
	stwa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 3964a5ff
!	%l1 = 00000000000000c3, Mem[000000001010140c] = 000000ff
	stb	%l1,[%i4+0x00c]		! Mem[000000001010140c] = c30000ff
!	Mem[0000000010001400] = ffffffff, %l4 = 000000003964a5ff
	swapa	[%i0+%g0]0x88,%l4	! %l4 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000ff, %l7 = 00000000000000ff
	lduha	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_193:
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010181400] = 00000000 000057ff 00000000 00000000
!	Mem[0000000010181410] = 00000000 000000ff c05600f2 3fff5bb1
!	Mem[0000000010181420] = ffffed05 ffa56439 000000ff 5c06ff76
!	Mem[0000000010181430] = ff008cf2 eb0000ff 77dc5bff adf36949
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[00000000300c1400] = ae0d00ff00000000, %f4  = 00000000 00000000
	ldda	[%i3+%g0]0x81,%f4 	! %f4  = ae0d00ff 00000000
!	Mem[0000000030041410] = ebd1c42a, %l0 = 00000000053b0000
	lduha	[%i1+%o5]0x89,%l0	! %l0 = 000000000000c42a
!	Mem[0000000010141408] = ae0d0000, %l2 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = ffffffffae0d0000
!	Mem[0000000030101400] = ff000000, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010181418] = c05600f2, %l7 = ffffffffff000000
	lduha	[%i6+0x01a]%asi,%l7	! %l7 = 00000000000000f2
!	Mem[0000000010141400] = 00006c00 00000000 00000dae ffffffff
!	Mem[0000000010141410] = e58c2cff 0000ffff 74a5f194 c0a53d9e
!	Mem[0000000010141420] = b2aa2984 e55419d1 6b6a62a0 9aea71c3
!	Mem[0000000010141430] = 00000000 ffffffff 690c52af 7a8eeeff
	ldda	[%i5]ASI_BLK_PL,%f0	! Block Load from 0000000010141400
!	Mem[0000000010001410] = ffffff76, %l4 = 00000000ffffffff
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = ffffffffffffff76
!	Code Fragment 3
p0_fragment_31:
!	%l0 = 000000000000c42a
	setx	0x44168c37e3ecc863,%g7,%l0 ! %l0 = 44168c37e3ecc863
!	%l1 = 00000000000000c3
	setx	0x3a0009f00064536d,%g7,%l1 ! %l1 = 3a0009f00064536d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 44168c37e3ecc863
	setx	0x2ba36727cad012e4,%g7,%l0 ! %l0 = 2ba36727cad012e4
!	%l1 = 3a0009f00064536d
	setx	0x5d4b16efc826f2ec,%g7,%l1 ! %l1 = 5d4b16efc826f2ec
!	Starting 10 instruction Store Burst
!	%f25 = ffa56439, Mem[0000000010081410] = 000000ff
	sta	%f25,[%i2+%o5]0x88	! Mem[0000000010081410] = ffa56439

p0_label_194:
!	%l3 = 77dc5bffadf36949, Mem[00000000201c0000] = ffffeaae
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 6949eaae
!	%l4 = ffffff76, %l5 = 00000000, Mem[00000000300c1400] = ff000dae 00000000
	stda	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffff76 00000000
!	Mem[0000000010081410] = ffa56439, %l2 = ffffffffae0d0000
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 00000039000000ff
!	%l0 = cad012e4, %l1 = c826f2ec, Mem[0000000010081400] = ff000000 ff000000
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = cad012e4 c826f2ec
!	%l6 = 00000000, %l7 = 000000f2, Mem[00000000300c1410] = ff2cffe5 54030354
	stda	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 000000f2
!	%f29 = eb0000ff, %f19 = 00000000
	fcmps	%fcc1,%f29,%f19		! %fcc1 = 1
!	Mem[000000001014143c] = 7a8eeeff, %l2 = 0000000000000039
	ldub	[%i5+0x03d],%l2		! %l2 = 000000000000008e
!	Mem[00000000100c1410] = ff000000, %l1 = 5d4b16efc826f2ec
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%f22 = c05600f2 3fff5bb1, Mem[0000000030101410] = dcf8feff ff000000
	stda	%f22,[%i4+%o5]0x81	! Mem[0000000030101410] = c05600f2 3fff5bb1
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000 ff000000, %l0 = cad012e4, %l1 = 000000ff
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 00000000ff000000 0000000000000000

p0_label_195:
!	Mem[0000000010141410] = e58c2cff, %l7 = 00000000000000f2
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 000000e5000000ff
!	Mem[0000000010141408] = 00000dae, %l0 = 00000000ff000000
	lduba	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = 3964a5ffd37a8e6c, %l0 = 0000000000000000
	ldxa	[%i6+%o4]0x81,%l0	! %l0 = 3964a5ffd37a8e6c
!	Mem[0000000010041408] = ff0000ff, %l6 = 0000000000000000
	ldsba	[%i1+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[000000001000140c] = ffffffff, %l3 = 77dc5bffadf36949
	lduba	[%i0+0x00f]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1408] = f2000000, %f24 = ffffed05
	lda	[%i3+%o4]0x89,%f24	! %f24 = f2000000
!	Mem[0000000030041400] = 000000f2, %l4 = ffffffffffffff76
	ldswa	[%i1+%g0]0x81,%l4	! %l4 = 00000000000000f2
!	Mem[0000000030081400] = ffffffff, %l5 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101430] = 95ffe03a, %l6 = ffffffffffffffff
	ldsb	[%i4+0x031],%l6		! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f30 = 77dc5bff adf36949, Mem[0000000030001408] = ffffffff 000000ff
	stda	%f30,[%i0+%o4]0x89	! Mem[0000000030001408] = 77dc5bff adf36949

p0_label_196:
!	%l7 = 00000000000000e5, imm = 000000000000045b, %l1 = 0000000000000000
	andn	%l7,0x45b,%l1		! %l1 = 00000000000000a4
!	Mem[0000000010141428] = 6b6a62a09aea71c3, %l1 = 00000000000000a4, %l2 = 000000000000008e
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = 6b6a62a09aea71c3
!	Mem[0000000030141410] = ff000000, %l1 = 00000000000000a4
	swapa	[%i5+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010181408] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = ff64a5ff, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l3	! %l3 = 00000000ff64a5ff
!	%f12 = ffffffff 00000000, %l7 = 00000000000000e5
!	Mem[0000000010041438] = 8ae1ffbe7b3c982e
	add	%i1,0x038,%g1
	stda	%f12,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010041438] = 00e100be7bffffff
!	Mem[0000000030041408] = 00000000, %l3 = 00000000ff64a5ff
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141400] = 00006c00, %l5 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[000000001018141a] = c05600f2, %l0 = 3964a5ffd37a8e6c
	ldstub	[%i6+0x01a],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff006c00, %l1 = 00000000ff000000
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 000000000000ff00

p0_label_197:
!	%l2 = 6b6a62a09aea71c3, Mem[0000000010041410] = ffffe0ff
	stha	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 71c3e0ff
!	Mem[0000000010101400] = 00000000 000000ff, %l0 = 00000000, %l1 = 0000ff00
	ldda	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000030041400] = f2000000, %l4 = 00000000000000f2
	ldswa	[%i1+%g0]0x89,%l4	! %l4 = fffffffff2000000
!	Mem[0000000030181400] = c371ea9a 00000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i6+%g0]0x81,%l0	! %l0 = 00000000c371ea9a 0000000000000000
!	Mem[0000000030041410] = ebd1c42a, %l4 = fffffffff2000000
	lduwa	[%i1+%o5]0x89,%l4	! %l4 = 00000000ebd1c42a
!	Mem[0000000010181408] = 000000ff, %l7 = 00000000000000e5
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	%f24 = f2000000 ffa56439, Mem[0000000030081408] = ffffffff 00000000
	stda	%f24,[%i2+%o4]0x81	! Mem[0000000030081408] = f2000000 ffa56439
!	Mem[0000000030101408] = e58c2cff, %l7 = ffffffffffffffff
	lduwa	[%i4+%o4]0x89,%l7	! %l7 = 00000000e58c2cff
!	Mem[0000000010101418] = 1bf4f8dc, %l7 = 00000000e58c2cff
	ldub	[%i4+0x018],%l7		! %l7 = 000000000000001b
!	Starting 10 instruction Store Burst
!	Mem[0000000010041404] = 000000ff, %l6 = ffffffff, %l2 = 9aea71c3
	add	%i1,0x04,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 00000000000000ff

p0_label_198:
!	%l0 = c371ea9a, %l1 = 00000000, Mem[0000000010101400] = ff000000 00000000
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = c371ea9a 00000000
!	Mem[0000000010101408] = 000000ff, %l0 = 00000000c371ea9a
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[000000001010141b] = 1bf4f8dc
	stb	%l1,[%i4+0x01b]		! Mem[0000000010101418] = 1bf4f800
!	%l7 = 000000000000001b, %l5 = 0000000000000000, %l5 = 0000000000000000
	orn	%l7,%l5,%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010081408] = 00000000, %l7 = 000000000000001b
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%f26 = 000000ff, Mem[0000000030041400] = 000000f2
	sta	%f26,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	%f6  = 9e3da5c0, %f7  = 94f1a574, %f19 = 00000000
	fdivs	%f6 ,%f7 ,%f19		! %f19 = 48c8e996
!	Mem[0000000010101428] = ff0000ff, %l0 = 000000ff, %l4 = ebd1c42a
	add	%i4,0x28,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 00000000ff0000ff
!	%l0 = 00000000000000ff, Mem[0000000030141408] = ffff00f2
	stba	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = ffff00f2
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 0000003f, %l0 = 00000000000000ff
	ldsba	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000

p0_label_199:
!	Mem[0000000010141410] = ff8c2cff, %l5 = ffffffffffffffff
	lduba	[%i5+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101408] = ff000000, %f5  = ff2c8ce5
	lda	[%i4+%o4]0x80,%f5 	! %f5 = ff000000
!	Mem[0000000030181400] = 9aea71c3, %l6 = ffffffffffffffff
	lduha	[%i6+%g0]0x89,%l6	! %l6 = 00000000000071c3
!	Mem[0000000010181400] = 00000000000057ff, %f0  = 00000000 006c0000
	ldda	[%i6+%g0]0x80,%f0 	! %f0  = 00000000 000057ff
!	Mem[0000000030081400] = ffffffff b1000000, %l6 = 000071c3, %l7 = 00000000
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 00000000ffffffff 00000000b1000000
!	Mem[0000000010141408] = 00000dae, %l5 = 00000000000000ff
	ldub	[%i5+%o4],%l5		! %l5 = 0000000000000000
!	Mem[0000000010081428] = 00000000, %f24 = f2000000
	lda	[%i2+0x028]%asi,%f24	! %f24 = 00000000
!	Mem[0000000010181408] = ff000000, %l0 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010101408] = ff0000c3000000ff, %l0 = ffffffffff000000
	ldxa	[%i4+%o4]0x88,%l0	! %l0 = ff0000c3000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000030141400] = 3f0000ff ffffffff
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff 00000000

p0_label_200:
!	%f29 = eb0000ff, Mem[00000000300c1408] = 000000f2
	sta	%f29,[%i3+%o4]0x81	! Mem[00000000300c1408] = eb0000ff
!	Mem[0000000030141400] = 000000ff, %l7 = 00000000b1000000
	swapa	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l4 = 00000000ff0000ff
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%f16 = 00000000 000057ff, Mem[00000000100c1418] = 000000ff f90c00ff
	std	%f16,[%i3+0x018]	! Mem[00000000100c1418] = 00000000 000057ff
!	%l3 = 0000000000000000, Mem[00000000300c1400] = 76ffffff00000000
	stxa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000000
!	%f7  = 94f1a574, %f10 = c371ea9a
	fsqrts	%f7 ,%f10		! %f10 = 7fffffff
!	Mem[0000000010081410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%f20 = 00000000 000000ff, %l7 = 00000000000000ff
!	Mem[0000000010081438] = 00000000ff0000ff
	add	%i2,0x038,%g1
	stda	%f20,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010081438] = ff00000000000000
!	%l2 = 00000000000000ff, Mem[0000000030001400] = f200ffff
	stha	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000ff, %l5 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff

p0_label_201:
!	Mem[00000000100c1408] = 0000003f, %l6 = 00000000ffffffff
	ldsba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 053b0000000057ff, %l0 = ff0000c3000000ff
	ldxa	[%i4+%o5]0x80,%l0	! %l0 = 053b0000000057ff
!	Mem[0000000030001408] = 77dc5bff adf36949, %l0 = 000057ff, %l1 = 00000000
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000adf36949 0000000077dc5bff
!	Mem[0000000030141408] = ffff00f2, %f25 = ffa56439
	lda	[%i5+%o4]0x81,%f25	! %f25 = ffff00f2
!	%l2 = 00000000000000ff, imm = fffffffffffff81e, %l3 = 0000000000000000
	and	%l2,-0x7e2,%l3		! %l3 = 000000000000001e
!	Mem[0000000010081438] = ff000000 00000000, %l0 = adf36949, %l1 = 77dc5bff
	ldd	[%i2+0x038],%l0		! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000030101408] = e58c2cff, %l2 = 00000000000000ff
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101400] = 000000ff, %l2 = 00000000000000ff
	lduba	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = adf36949, %l0 = 00000000ff000000
	lduwa	[%i0+%o4]0x89,%l0	! %l0 = 00000000adf36949
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[00000000100c1410] = ff00000081f1fffe, %asi = 80
	stxa	%l2,[%i3+0x010]%asi	! Mem[00000000100c1410] = 0000000000000000

p0_label_202:
!	%f22 = c05600f2 3fff5bb1, %l5 = 00000000000000ff
!	Mem[0000000010081408] = ff000000000000e5
	add	%i2,0x008,%g1
	stda	%f22,[%g1+%l5]ASI_PST8_P ! Mem[0000000010081408] = c05600f23fff5bb1
!	Code Fragment 4
p0_fragment_32:
!	%l0 = 00000000adf36949
	setx	0x48286780739145e3,%g7,%l0 ! %l0 = 48286780739145e3
!	%l1 = 0000000000000000
	setx	0x3fcb3050661adb44,%g7,%l1 ! %l1 = 3fcb3050661adb44
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 48286780739145e3
	setx	0x26d7b8a842e510f7,%g7,%l0 ! %l0 = 26d7b8a842e510f7
!	%l1 = 3fcb3050661adb44
	setx	0x0cef30f8073463ff,%g7,%l1 ! %l1 = 0cef30f8073463ff
!	%l0 = 26d7b8a842e510f7, %l5 = 00000000000000ff, %l7 = 00000000000000ff
	xnor	%l0,%l5,%l7		! %l7 = d9284757bd1aeff7
!	Mem[0000000010181400] = 000000ff, %l1 = 0cef30f8073463ff
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%f8  = d11954e5 8429aab2, %l0 = 26d7b8a842e510f7
!	Mem[0000000030081418] = 029d915c015552b2
	add	%i2,0x018,%g1
	stda	%f8,[%g1+%l0]ASI_PST32_S ! Mem[0000000030081418] = d11954e58429aab2
!	Mem[0000000030081410] = ffff065c, %l4 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 00000000ffff065c
!	Mem[00000000100c1418] = 00000000, %l0 = 26d7b8a842e510f7
	swap	[%i3+0x018],%l0		! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010041410] = 71c3e0ff
	stba	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00c3e0ff
!	%l3 = 000000000000001e, Mem[0000000021800040] = ff4307c8
	stb	%l3,[%o3+0x040]		! Mem[0000000021800040] = 1e4307c8
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff0000c3000000ff, %l7 = d9284757bd1aeff7
	ldxa	[%i4+%o4]0x88,%l7	! %l7 = ff0000c3000000ff

p0_label_203:
!	Mem[0000000010101410] = ff57000000003b05, %l1 = 00000000000000ff
	ldxa	[%i4+%o5]0x88,%l1	! %l1 = ff57000000003b05
!	Mem[00000000211c0000] = e0ff4b99, %l5 = 00000000000000ff
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181410] = 000000ff0000006c, %l0 = 0000000000000000
	ldxa	[%i6+%o5]0x81,%l0	! %l0 = 000000ff0000006c
!	Mem[00000000300c1408] = eb0000ff, %f10 = 7fffffff
	lda	[%i3+%o4]0x81,%f10	! %f10 = eb0000ff
!	Mem[0000000030141410] = 000000a4 00000dae, %l4 = ffff065c, %l5 = ffffffff
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000a4 0000000000000dae
!	Mem[0000000030101410] = c05600f2, %l4 = 00000000000000a4
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = ffffffffffffffc0
!	Mem[0000000010041408] = ff0000ff, %l4 = ffffffffffffffc0
	lduwa	[%i1+%o4]0x80,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010081410] = ff000000, %l0 = 000000ff0000006c
	lduba	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l3 = 000000000000001e, Mem[0000000030101410] = f20056c0
	stba	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = f200561e
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000001e, Mem[0000000010001400] = 000000003964a5ff
	stxa	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000000000001e

p0_label_204:
!	%f10 = eb0000ff a0626a6b, Mem[0000000010041430] = ff000000 ff2770d4
	stda	%f10,[%i1+0x030]%asi	! Mem[0000000010041430] = eb0000ff a0626a6b
!	%f5  = ff000000, Mem[0000000010081400] = cad012e4
	sta	%f5 ,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000
!	%f14 = ffee8e7a af520c69, Mem[0000000030181408] = 3964a5ff d37a8e6c
	stda	%f14,[%i6+%o4]0x81	! Mem[0000000030181408] = ffee8e7a af520c69
!	Mem[0000000030101410] = 1e5600f2, %l1 = ff57000000003b05
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 000000001e5600f2
!	Mem[0000000010081400] = 000000ff, %l7 = ff0000c3000000ff, %asi = 80
	swapa	[%i2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	%l2 = 0000000000000000, %l3 = 000000000000001e, %l6 = 0000000000000000
	xor	%l2,%l3,%l6		! %l6 = 000000000000001e
!	Mem[0000000030101408] = e58c2cff, %l3 = 000000000000001e
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 00000000e58c2cff
!	Mem[0000000010181418] = c056fff23fff5bb1, %l7 = 00000000000000ff, %l1 = 000000001e5600f2
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = c056fff23fff5bb1
!	Mem[0000000030081410] = 00000000, %l6 = 000000000000001e
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff8c2cff, %l0 = 00000000000000ff
	ldsha	[%i5+%o5]0x80,%l0	! %l0 = ffffffffffffff8c

p0_label_205:
!	Mem[0000000030001408] = 4969f3ad, %l3 = 00000000e58c2cff
	ldsha	[%i0+%o4]0x81,%l3	! %l3 = 0000000000004969
!	%f9  = 8429aab2, %f26 = 000000ff, %f15 = af520c69
	fsubs	%f9 ,%f26,%f15		! %l0 = ffffffffffffffae, Unfinished, %fsr = 2900000400
!	Mem[0000000010101410] = ff57000000003b05, %f18 = 00000000 48c8e996
	ldda	[%i4+%o5]0x88,%f18	! %f18 = ff570000 00003b05
!	Mem[000000001004141c] = 8bf2c6ff, %l1 = c056fff23fff5bb1
	lduw	[%i1+0x01c],%l1		! %l1 = 000000008bf2c6ff
!	Mem[0000000010181404] = 000057ff, %l2 = 0000000000000000
	lduwa	[%i6+0x004]%asi,%l2	! %l2 = 00000000000057ff
!	Mem[0000000030041408] = 000000ff, %l0 = ffffffffffffffae
	lduha	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101418] = 1bf4f800 ff000000, %l2 = 000057ff, %l3 = 00004969
	ldda	[%i4+0x018]%asi,%l2	! %l2 = 000000001bf4f800 00000000ff000000
!	Mem[0000000010181438] = 77dc5bffadf36949, %f12 = ffffffff 00000000
	ldda	[%i6+0x038]%asi,%f12	! %f12 = 77dc5bff adf36949
!	Mem[0000000010101408] = ff0000c3 000000ff, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 00000000000000ff 00000000ff0000c3
!	Starting 10 instruction Store Burst
!	%l1 = 000000008bf2c6ff, imm = 00000000000003cb, %l1 = 000000008bf2c6ff
	sub	%l1,0x3cb,%l1		! %l1 = 000000008bf2c334

p0_label_206:
!	Mem[0000000010181433] = ff008cf2, %l7 = 00000000ff0000c3
	ldstuba	[%i6+0x033]%asi,%l7	! %l7 = 000000f2000000ff
!	%l5 = 0000000000000dae, Mem[000000001000141c] = 24ff598d
	sth	%l5,[%i0+0x01c]		! Mem[000000001000141c] = 0dae598d
!	%l2 = 000000001bf4f800, Mem[0000000030141400] = b1000000
	stba	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = b1000000
!	Mem[0000000010081410] = 000000ff, %l7 = 00000000000000f2
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (30)
!	%f26 = 000000ff, Mem[0000000010141408] = ae0d0000
	sta	%f26,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	Mem[00000000100c1400] = fefff181, %l6 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 00000000fefff181
!	Mem[00000000300c1410] = 00000000, %l7 = 00000000000000ff
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%l4 = 00000000ff0000ff, Mem[0000000010181416] = 000000ff, %asi = 80
	stha	%l4,[%i6+0x016]%asi	! Mem[0000000010181414] = 000000ff
!	%l2 = 000000001bf4f800, Mem[0000000010001408] = ffffffffffffffff
	stxa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000001bf4f800
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = ff2770d4ae000000, %l6 = 00000000fefff181
	ldx	[%i4+0x020],%l6		! %l6 = ff2770d4ae000000

p0_label_207:
!	Mem[0000000030141408] = ff000080f200ffff, %f10 = eb0000ff a0626a6b
	ldda	[%i5+%o4]0x89,%f10	! %f10 = ff000080 f200ffff
!	Mem[0000000030081400] = ffffffff, %f12 = 77dc5bff
	lda	[%i2+%g0]0x89,%f12	! %f12 = ffffffff
!	Mem[00000000218001c0] = 00ffeec2, %l6 = ff2770d4ae000000
	lduba	[%o3+0x1c0]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = ff269c42ebd1c42a, %l1 = 000000008bf2c334
	ldxa	[%i1+%o5]0x89,%l1	! %l1 = ff269c42ebd1c42a
!	Mem[0000000010081410] = 000000f2, %l0 = 00000000000000ff
	ldsba	[%i2+%o5]0x88,%l0	! %l0 = fffffffffffffff2
!	Mem[0000000030001410] = 0000e2be, %l6 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l6	! %l6 = 000000000000e2be
!	Mem[0000000030081410] = 1e000000, %l5 = 0000000000000dae
	lduwa	[%i2+%o5]0x81,%l5	! %l5 = 000000001e000000
!	Mem[0000000010141408] = ff000000, %l2 = 000000001bf4f800
	ldub	[%i5+0x009],%l2		! %l2 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %f21 = 000000ff
	lda	[%i6+%o5]0x89,%f21	! %f21 = ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = bee20000, %l7 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 000000be000000ff

p0_label_208:
!	%f30 = 77dc5bff, Mem[0000000010181408] = ff000000
	sta	%f30,[%i6+%o4]0x80	! Mem[0000000010181408] = 77dc5bff
!	%f0  = 00000000 000057ff, %l6 = 000000000000e2be
!	Mem[0000000030181420] = 7f90b8590fa627de
	add	%i6,0x020,%g1
	stda	%f0,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030181420] = 7f57000000002700
!	%f0  = 00000000 000057ff, %l7 = 00000000000000be
!	Mem[0000000030081410] = 1e00000000000000
	add	%i2,0x010,%g1
	stda	%f0,[%g1+%l7]ASI_PST8_S ! Mem[0000000030081410] = 0000000000005700
!	%l5 = 000000001e000000, Mem[0000000020800040] = e049a555, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000a555
!	%f26 = 000000ff, Mem[0000000030041400] = 000000ff
	sta	%f26,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	Mem[0000000020800000] = 00ff5b63, %l6 = 000000000000e2be
	ldstub	[%o1+%g0],%l6		! %l6 = 00000000000000ff
!	%l4 = 00000000ff0000ff, Mem[0000000030141410] = a4000000
	stha	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = a40000ff
!	%l3 = 00000000ff000000, imm = fffffffffffffe56, %l6 = 0000000000000000
	or	%l3,-0x1aa,%l6		! %l6 = fffffffffffffe56
!	%f29 = eb0000ff, Mem[0000000010041400] = ff000000
	sta	%f29,[%i1+%g0]0x80	! Mem[0000000010041400] = eb0000ff
!	Starting 10 instruction Load Burst
!	%l1 = ff269c42ebd1c42a, imm = fffffffffffff232, %l3 = 00000000ff000000
	xor	%l1,-0xdce,%l3		! %l3 = 00d963bd142e3618

p0_label_209:
!	Mem[0000000030181400] = 00000000 9aea71c3, %l4 = ff0000ff, %l5 = 1e000000
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 000000009aea71c3 0000000000000000
!	Mem[0000000010041424] = e5541976, %l6 = fffffffffffffe56
	ldsba	[%i1+0x024]%asi,%l6	! %l6 = ffffffffffffffe5
!	Mem[0000000010081408] = c05600f2 3fff5bb1, %l6 = ffffffe5, %l7 = 000000be
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000c05600f2 000000003fff5bb1
!	Mem[0000000030141400] = 000000b1, %l5 = 0000000000000000
	ldswa	[%i5+%g0]0x81,%l5	! %l5 = 00000000000000b1
!	Mem[0000000030101400] = ff000000, %l3 = 00d963bd142e3618
	ldswa	[%i4+%g0]0x89,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010001408] = 00000000 1bf4f800, %l2 = 00000000, %l3 = ff000000
	ldda	[%i0+0x008]%asi,%l2	! %l2 = 0000000000000000 000000001bf4f800
!	Mem[0000000010001408] = 00000000, %l2 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = ff8c2cff, %l2 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l2	! %l2 = ffffffffffffff8c
!	Mem[0000000030041400] = 000000ff, %l6 = 00000000c05600f2
	ldsha	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = fffffffffffffff2, Mem[00000000100c1400] = ff000000
	stba	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff0000f2

p0_label_210:
!	%f28 = ff008cf2 eb0000ff, Mem[0000000010081410] = f2000000 ffdc0354
	std	%f28,[%i2+%o5]	! Mem[0000000010081410] = ff008cf2 eb0000ff
!	%l4 = 9aea71c3, %l5 = 000000b1, Mem[0000000030081410] = 00000000 00570000
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 9aea71c3 000000b1
!	%f17 = 000057ff, Mem[0000000030001400] = ffffff00
	sta	%f17,[%i0+%g0]0x89	! Mem[0000000030001400] = 000057ff
!	%l4 = 000000009aea71c3, Mem[0000000030001408] = 4969f3adff5bdc77
	stxa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000009aea71c3
!	%f16 = 00000000 000057ff ff570000 00003b05
!	%f20 = 00000000 ff000000 c05600f2 3fff5bb1
!	%f24 = 00000000 ffff00f2 000000ff 5c06ff76
!	%f28 = ff008cf2 eb0000ff 77dc5bff adf36949
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	%l2 = ffffff8c, %l3 = 1bf4f800, Mem[00000000100c1400] = ff0000f2 000000f2
	stda	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffff8c 1bf4f800
!	%l3 = 000000001bf4f800, Mem[0000000030101400] = ff000000
	stha	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = ff00f800
!	%l4 = 000000009aea71c3, Mem[0000000010001410] = ffffff76
	stha	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 71c3ff76
!	Mem[0000000010141400] = ff006c00, %l5 = 00000000000000b1
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l4 = 000000009aea71c3
	ldsh	[%i3+%o5],%l4		! %l4 = 0000000000000000

p0_label_211:
!	%f0  = 00000000 000057ff, Mem[0000000030141408] = ffff00f2 800000ff
	stda	%f0 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000 000057ff
!	Mem[0000000030101410] = 00003b05, %l5 = 00000000000000ff
	ldswa	[%i4+%o5]0x81,%l5	! %l5 = 0000000000003b05
!	Mem[0000000030181400] = c371ea9a, %f4  = ffff0000
	lda	[%i6+%g0]0x81,%f4 	! %f4 = c371ea9a
!	Mem[0000000010101410] = 053b0000, %l5 = 0000000000003b05
	ldub	[%i4+0x011],%l5		! %l5 = 000000000000003b
!	Mem[0000000030041410] = 2ac4d1eb, %f3  = ae0d0000
	lda	[%i1+%o5]0x81,%f3 	! %f3 = 2ac4d1eb
!	Mem[0000000030041410] = 2ac4d1eb429c26ff, %l6 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l6	! %l6 = 2ac4d1eb429c26ff
!	Mem[0000000010181408] = 77dc5bff, %l1 = ff269c42ebd1c42a
	lduba	[%i6+%o4]0x80,%l1	! %l1 = 0000000000000077
!	Mem[0000000030101408] = 1e000000, %l1 = 0000000000000077
	lduba	[%i4+%o4]0x81,%l1	! %l1 = 000000000000001e
!	Mem[0000000010181400] = ff570000000000ff, %f8  = d11954e5 8429aab2
	ldda	[%i6+%g0]0x88,%f8 	! %f8  = ff570000 000000ff
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffff8c, Mem[000000001000143a] = 00005fdc
	stb	%l2,[%i0+0x03a]		! Mem[0000000010001438] = 00008cdc

p0_label_212:
!	Mem[0000000030001400] = ff570000, %l6 = 2ac4d1eb429c26ff
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 00000000ff570000
!	Mem[0000000030181400] = 9aea71c3, %l6 = 00000000ff570000
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 000000009aea71c3
!	%l4 = 0000000000000000, Mem[0000000030181400] = ff570000
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = ff570000
	membar	#Sync			! Added by membar checker (31)
!	%l7 = 000000003fff5bb1, Mem[0000000010081400] = 000000ff
	stw	%l7,[%i2+%g0]		! Mem[0000000010081400] = 3fff5bb1
!	%l2 = ffffff8c, %l3 = 1bf4f800, Mem[0000000010081410] = ff008cf2 eb0000ff
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffff8c 1bf4f800
!	Mem[0000000010041428] = 000000ff, %l3 = 000000001bf4f800
	ldstuba	[%i1+0x028]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = 3fff5bb1, %l7 = 000000003fff5bb1
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 000000003fff5bb1
!	Mem[0000000010101410] = 053b0000, %l2 = ffffffffffffff8c
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 00000005000000ff
!	%l6 = 000000009aea71c3, Mem[0000000010001438] = 00008cdc000057ff
	stx	%l6,[%i0+0x038]		! Mem[0000000010001438] = 000000009aea71c3
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff5bdc77, %f18 = ff570000
	lda	[%i6+%o4]0x88,%f18	! %f18 = ff5bdc77

p0_label_213:
!	Mem[0000000010001410] = 71c3ff76, %l0 = fffffffffffffff2
	lduwa	[%i0+%o5]0x80,%l0	! %l0 = 0000000071c3ff76
!	Mem[0000000010141408] = 000000ff, %l4 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030001410] = 0000e2ff, %l7 = 000000003fff5bb1
	ldswa	[%i0+%o5]0x89,%l7	! %l7 = 000000000000e2ff
!	Mem[0000000030001410] = ffe20000 84000000, %l2 = 00000005, %l3 = 00000000
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 00000000ffe20000 0000000084000000
!	Mem[0000000030181408] = 7a8eeeff, %l5 = 000000000000003b
	lduha	[%i6+%o4]0x89,%l5	! %l5 = 000000000000eeff
!	Mem[00000000201c0000] = 6949eaae, %l4 = ffffffffffffffff
	ldsh	[%o0+%g0],%l4		! %l4 = 0000000000006949
!	Mem[00000000100c1408] = a69ebf0f3f000000, %l1 = 000000000000001e
	ldxa	[%i3+%o4]0x88,%l1	! %l1 = a69ebf0f3f000000
!	%l7 = 000000000000e2ff, Mem[0000000010181400] = ff000000
	stwa	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000e2ff
!	Mem[00000000218000c0] = ffff3492, %l2 = 00000000ffe20000
	lduba	[%o3+0x0c1]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 000000009aea71c3, Mem[0000000020800001] = ffff5b63
	stb	%l6,[%o1+0x001]		! Mem[0000000020800000] = ffc35b63

p0_label_214:
!	%l5 = 000000000000eeff, immed = fffffefb, %y  = 00000354
	umul	%l5,-0x105,%l3		! %l3 = 0000eefeff0c5605, %y = 0000eefe
!	%l6 = 9aea71c3, %l7 = 0000e2ff, Mem[0000000010181410] = 00000000 ff000000
	stda	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 9aea71c3 0000e2ff
!	Mem[0000000030181410] = 000000ff, %l1 = a69ebf0f3f000000
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%l4 = 0000000000006949, %l7 = 000000000000e2ff, %y  = 0000eefe
	sdiv	%l4,%l7,%l6		! %l6 = 000000007fffffff
	mov	%l0,%y			! %y = 71c3ff76
!	%l2 = 000000ff, %l3 = ff0c5605, Mem[00000000100c1400] = ffffff8c 1bf4f800
	stda	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff ff0c5605
!	%l4 = 00006949, %l5 = 0000eeff, Mem[0000000010081400] = b15bff3f c826f2ec
	stda	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00006949 0000eeff
!	%l1 = 00000000000000ff, Mem[00000000300c1410] = f2000000000000ff
	stxa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000000000ff
!	%l3 = 0000eefeff0c5605, Mem[0000000030041408] = ff000000
	stba	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 05000000
!	Mem[0000000030141408] = 00000000, %l6 = 000000007fffffff
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 1e000000, %l4 = 0000000000006949
	lduh	[%i0+%g0],%l4		! %l4 = 0000000000001e00

p0_label_215:
!	Mem[0000000030001400] = b15b0000ff269c42, %f30 = 77dc5bff adf36949
	ldda	[%i0+%g0]0x89,%f30	! %f30 = b15b0000 ff269c42
!	Mem[00000000218000c0] = ffff3492, %l6 = 0000000000000000
	ldsb	[%o3+0x0c1],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030041408] = 00ffff76 00000005, %l6 = ffffffff, %l7 = 0000e2ff
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000005 0000000000ffff76
!	Mem[0000000010181408] = ff5bdc77, %l6 = 0000000000000005
	lduba	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000077
!	Mem[0000000010001408] = 00000000, %l0 = 0000000071c3ff76
	lduha	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = 690c52af7a8eeeff, %f22 = c05600f2 3fff5bb1
	ldda	[%i6+%o4]0x89,%f22	! %f22 = 690c52af 7a8eeeff
!	Mem[0000000010001408] = 000000001bf4f800, %f14 = ffee8e7a af520c69
	ldda	[%i0+%o4]0x80,%f14	! %f14 = 00000000 1bf4f800
!	Mem[0000000010041408] = ff0000ff, %l7 = 0000000000ffff76
	ldswa	[%i1+%o4]0x88,%l7	! %l7 = ffffffffff0000ff
!	Mem[0000000010041430] = eb0000ffa0626a6b, %f20 = 00000000 ff000000
	ldd	[%i1+0x030],%f20	! %f20 = eb0000ff a0626a6b
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000077, Mem[0000000010041408] = ff0000ff76ffff00
	stx	%l6,[%i1+%o4]		! Mem[0000000010041408] = 0000000000000077

p0_label_216:
!	%l6 = 0000000000000077, Mem[00000000211c0001] = e0ff4b99, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = e0774b99
!	%f16 = 00000000 000057ff, %l2 = 00000000000000ff
!	Mem[00000000100c1428] = 0000000000000071
	add	%i3,0x028,%g1
	stda	%f16,[%g1+%l2]ASI_PST16_P ! Mem[00000000100c1428] = 00000000000057ff
!	%f26 = 000000ff 5c06ff76, Mem[0000000030141410] = a40000ff ae0d0000
	stda	%f26,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff 5c06ff76
!	%l7 = ffffffffff0000ff, Mem[0000000010141410] = ff8c2cff
	stba	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = ff8c2cff
!	Mem[00000000300c1400] = 00000000, %l5 = 000000000000eeff
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l3 = 0000eefeff0c5605, immed = fffffaef, %y  = 71c3ff76
	smul	%l3,-0x511,%l3		! %l3 = 00000004d28030ab, %y = 00000004
!	%l3 = 00000004d28030ab, Mem[0000000030181400] = 000057ff
	stba	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = ab0057ff
!	Mem[0000000010181410] = 9aea71c3, %l3 = 00000004d28030ab
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 000000009aea71c3
!	Mem[0000000010101410] = 00003bff, %l0 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = b15bff3f053b0000, %l7 = ffffffffff0000ff
	ldxa	[%i4+%o5]0x89,%l7	! %l7 = b15bff3f053b0000

p0_label_217:
!	Mem[0000000010141418] = 74a5f194, %l6 = 0000000000000077
	ldsha	[%i5+0x01a]%asi,%l6	! %l6 = fffffffffffff194
!	Mem[0000000030181410] = 0000003f, %l5 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l5	! %l5 = 000000000000003f
!	Mem[0000000010001410] = 76ffc371, %l2 = 00000000000000ff
	ldsba	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000071
!	Mem[0000000010041410] = ffffffffffe0c300, %l0 = 00000000000000ff
	ldxa	[%i1+%o5]0x88,%l0	! %l0 = ffffffffffe0c300
!	Mem[0000000010001428] = ffffffff, %l2 = 0000000000000071
	ldsb	[%i0+0x02b],%l2		! %l2 = ffffffffffffffff
!	Mem[00000000218001c0] = 00ffeec2, %l2 = ffffffffffffffff
	lduha	[%o3+0x1c0]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081430] = 00000000ff0000ff, %f0  = 00000000 000057ff
	ldd	[%i2+0x030],%f0 	! %f0  = 00000000 ff0000ff
!	Mem[0000000010101408] = ff000000, %f4  = c371ea9a
	lda	[%i4+%o4]0x80,%f4 	! %f4 = ff000000
!	Mem[0000000010041408] = 00000000, %f26 = 000000ff
	lda	[%i1+0x008]%asi,%f26	! %f26 = 00000000
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_33:
!	%l0 = ffffffffffe0c300
	setx	0x1601423069718edc,%g7,%l0 ! %l0 = 1601423069718edc
!	%l1 = 00000000000000ff
	setx	0xd2e8ff0fa2d95f0d,%g7,%l1 ! %l1 = d2e8ff0fa2d95f0d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1601423069718edc
	setx	0xfb920d28107c3fd9,%g7,%l0 ! %l0 = fb920d28107c3fd9
!	%l1 = d2e8ff0fa2d95f0d
	setx	0x515418b7da7208e6,%g7,%l1 ! %l1 = 515418b7da7208e6

p0_label_218:
!	%f30 = b15b0000 ff269c42, %l1 = 515418b7da7208e6
!	Mem[0000000010181418] = c056fff23fff5bb1
	add	%i6,0x018,%g1
	stda	%f30,[%g1+%l1]ASI_PST32_P ! Mem[0000000010181418] = b15b00003fff5bb1
!	%f14 = 00000000 1bf4f800, Mem[00000000300c1410] = 000000ff 00000000
	stda	%f14,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 1bf4f800
!	Mem[00000000211c0001] = e0774b99, %l3 = 000000009aea71c3
	ldstub	[%o2+0x001],%l3		! %l3 = 00000077000000ff
!	%l5 = 000000000000003f, Mem[000000001004143c] = 7bffffff
	stw	%l5,[%i1+0x03c]		! Mem[000000001004143c] = 0000003f
!	Mem[000000001008143c] = 00000000, %l5 = 000000000000003f, %asi = 80
	swapa	[%i2+0x03c]%asi,%l5	! %l5 = 0000000000000000
!	%l4 = 0000000000001e00, Mem[000000001008142e] = ffffd1eb, %asi = 80
	stha	%l4,[%i2+0x02e]%asi	! Mem[000000001008142c] = ffff1e00
!	Mem[000000001010141f] = ff000000, %l7 = b15bff3f053b0000
	ldstuba	[%i4+0x01f]%asi,%l7	! %l7 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030081408] = ff570000
	stwa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000ff
!	Mem[0000000030181408] = 690c52af7a8eeeff, %f2  = ffffffff 2ac4d1eb
	ldda	[%i6+%o4]0x89,%f2 	! %f2  = 690c52af 7a8eeeff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l1 = 515418b7da7208e6
	lduwa	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_219:
!	Mem[0000000030001410] = ffe2000084000000, %f4  = ff000000 ff000000
	ldda	[%i0+%o5]0x81,%f4 	! %f4  = ffe20000 84000000
!	Mem[0000000010001408] = 00000000, %l3 = 0000000000000077
	ldswa	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000021800040] = 1e4307c8, %l3 = 0000000000000000
	ldsha	[%o3+0x040]%asi,%l3	! %l3 = 0000000000001e43
!	Mem[0000000030141400] = b1000000, %f31 = ff269c42
	lda	[%i5+%g0]0x89,%f31	! %f31 = b1000000
!	Mem[0000000010141408] = ff000000, %l3 = 0000000000001e43
	lduha	[%i5+0x00a]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l7 = 0000000000000000
	lduba	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = ff2c8cff, %l6 = fffffffffffff194
	ldsba	[%i5+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030041410] = 2ac4d1eb, %f29 = eb0000ff
	lda	[%i1+%o5]0x81,%f29	! %f29 = 2ac4d1eb
!	Mem[0000000030081408] = ff000000, %l2 = 00000000000000ff
	lduha	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010001408] = 00000000
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000

p0_label_220:
!	%l0 = fb920d28107c3fd9, Mem[0000000030141410] = 5c06ff76
	stba	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 5c06ffd9
!	Randomly selected nop
	nop
!	%l0 = fb920d28107c3fd9, Mem[0000000030181400] = ff5700ab
	stha	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = ff573fd9
!	%l4 = 00001e00, %l5 = 00000000, Mem[00000000300c1400] = 000000ff 00000000
	stda	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00001e00 00000000
!	Mem[0000000030101400] = 00f800ff, %l1 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[000000001010143a] = 37bb86bf, %l1 = 0000000000000000
	ldstub	[%i4+0x03a],%l1		! %l1 = 00000086000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030081408] = 000000ff 00003b05
	stda	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 00000000
!	%l0 = 107c3fd9, %l1 = 00000086, Mem[00000000100c1428] = 00000000 000057ff
	std	%l0,[%i3+0x028]		! Mem[00000000100c1428] = 107c3fd9 00000086
!	Mem[0000000010141400] = 006c00ff, %l6 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l5 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000

p0_label_221:
!	Mem[0000000010141408] = ffffffff000000ff, %l2 = 0000000000000000
	ldxa	[%i5+%o4]0x88,%l2	! %l2 = ffffffff000000ff
!	Mem[0000000010001410] = 71c3ff76, %l0 = fb920d28107c3fd9
	ldsha	[%i0+%o5]0x80,%l0	! %l0 = 00000000000071c3
!	Mem[0000000010181410] = ab3080d2, %l7 = 0000000000000000
	lduw	[%i6+%o5],%l7		! %l7 = 00000000ab3080d2
!	Mem[0000000030141400] = 00000000b1000000, %l3 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l3	! %l3 = 00000000b1000000
!	Mem[0000000010141410] = ff8c2cff0000ffff, %f4  = ffe20000 84000000
	ldda	[%i5+%o5]0x80,%f4 	! %f4  = ff8c2cff 0000ffff
!	Mem[0000000010041408] = 00000000, %f22 = 690c52af
	lda	[%i1+%o4]0x88,%f22	! %f22 = 00000000
!	Mem[0000000010141410] = ff2c8cff, %l2 = ffffffff000000ff
	ldsha	[%i5+%o5]0x88,%l2	! %l2 = ffffffffffff8cff
!	Mem[0000000010001400] = 000000000000001e, %f14 = 00000000 1bf4f800
	ldda	[%i0+%g0]0x88,%f14	! %f14 = 00000000 0000001e
!	%l0 = 000071c3, %l1 = 00000086, Mem[0000000030041408] = 00000005 00ffff76
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 000071c3 00000086
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ff006c00, %l1 = 0000000000000086
	ldstuba	[%i5+%g0]0x80,%l1	! %l1 = 000000ff000000ff

p0_label_222:
!	%l0 = 00000000000071c3, Mem[00000000300c1410] = 00f8f41b
	stwa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000071c3
!	Mem[00000000100c143b] = 8ae1e2be, %l4 = 0000000000001e00
	ldstub	[%i3+0x03b],%l4		! %l4 = 000000be000000ff
!	Mem[0000000010101408] = 000000ff, %l7 = 00000000ab3080d2
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010101400] = c371ea9a
	stba	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 0071ea9a
!	%l0 = 000071c3, %l1 = 000000ff, Mem[0000000010041410] = 00c3e0ff ffffffff
	std	%l0,[%i1+%o5]		! Mem[0000000010041410] = 000071c3 000000ff
!	Mem[0000000030001410] = 0000e2ff, %l5 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l5	! %l5 = 000000000000e2ff
!	%f26 = 00000000 5c06ff76, Mem[0000000010081410] = ffffff8c 1bf4f800
	stda	%f26,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 5c06ff76
!	%l3 = 00000000b1000000, Mem[0000000010001408] = 00000000
	stba	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	Mem[0000000010001400] = 1e000000, %l5 = 000000000000e2ff
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 0000001e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ebd1c42a, %l4 = 00000000000000be
	ldsba	[%i1+%o5]0x89,%l4	! %l4 = 000000000000002a

p0_label_223:
!	Mem[0000000030101408] = 0000001e, %l5 = 000000000000001e
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 000000000000001e
!	Mem[0000000030081410] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = ffc35b63, %l6 = 00000000000000ff
	lduba	[%o1+0x001]%asi,%l6	! %l6 = 00000000000000c3
!	Mem[0000000010141418] = 74a5f194, %l3 = 00000000b1000000
	ldsba	[%i5+0x01b]%asi,%l3	! %l3 = ffffffffffffff94
!	Mem[0000000010181410] = ab3080d2, %l4 = 000000000000002a
	lduba	[%i6+%o5]0x80,%l4	! %l4 = 00000000000000ab
!	Mem[0000000030081410] = 00000000, %l2 = ffffffffffff8cff
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 0000001e, %f3  = 7a8eeeff
	lda	[%i4+%o4]0x89,%f3 	! %f3 = 0000001e
!	Mem[0000000010141400] = 006c00ff, %l6 = 00000000000000c3
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%f14 = 00000000, %f18 = ff5bdc77, %f9  = 000000ff
	fdivs	%f14,%f18,%f9 		! %f9  = 80000000
!	Starting 10 instruction Store Burst
!	%l0 = 000071c3, %l1 = 000000ff, Mem[0000000030001400] = ff269c42 b15b0000
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 000071c3 000000ff

p0_label_224:
!	Mem[0000000010181424] = ffa56439, %l0 = 00000000000071c3
	ldstuba	[%i6+0x024]%asi,%l0	! %l0 = 000000ff000000ff
!	%f4  = ff8c2cff 0000ffff, Mem[0000000030041408] = c3710000 86000000
	stda	%f4 ,[%i1+%o4]0x81	! Mem[0000000030041408] = ff8c2cff 0000ffff
!	%l2 = 0000000000000000, Mem[0000000020800000] = ffc35b63, %asi = 80
	stha	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 00005b63
!	Mem[00000000100c1400] = ff000000, %l6 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030181410] = 3f000000, %l3 = ffffffffffffff94
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 000000003f000000
!	Mem[0000000010141400] = 006c00ff, %l1 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%l4 = 00000000000000ab, Mem[0000000030141410] = d9ff065c
	stha	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00ab065c
!	%f14 = 00000000, %f14 = 00000000
	fcmps	%fcc1,%f14,%f14		! %fcc1 = 0
!	Mem[00000000100c1428] = 107c3fd900000086, %l0 = 00000000000000ff, %l5 = 000000000000001e
	add	%i3,0x28,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = 107c3fd900000086
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = f20056c0, %l5 = 107c3fd900000086
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 00000000f20056c0

p0_label_225:
!	Mem[000000001004141c] = 8bf2c6ff, %l2 = 0000000000000000
	ldsha	[%i1+0x01e]%asi,%l2	! %l2 = ffffffffffffc6ff
!	Mem[0000000030141410] = 00ab065c ff000000, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 0000000000ab065c 00000000ff000000
!	Mem[0000000010101400] = 0071ea9a00000000, %l7 = 00000000ff000000
	ldxa	[%i4+%g0]0x80,%l7	! %l7 = 0071ea9a00000000
!	Mem[0000000010101408] = d28030abc30000ff, %f2  = 690c52af 0000001e
	ldda	[%i4+%o4]0x80,%f2 	! %f2  = d28030ab c30000ff
!	%l0 = 00000000000000ff, %l6 = 0000000000ab065c, %l7 = 0071ea9a00000000
	xor	%l0,%l6,%l7		! %l7 = 0000000000ab06a3
!	Mem[0000000010181400] = ffe20000, %l5 = 00000000f20056c0
	lduba	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l0 = 00000000000000ff
	ldsh	[%i2+%o5],%l0		! %l0 = 0000000000000000
!	%l0 = 0000000000000000, %l7 = 0000000000ab06a3, %l0 = 0000000000000000
	xnor	%l0,%l7,%l0		! %l0 = ffffffffff54f95c
!	%f9  = 80000000, %f31 = b1000000
	fcmpes	%fcc2,%f9 ,%f31		! %fcc2 = 2
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 00000000, %l3 = 000000003f000000
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_226:
!	%f14 = 00000000, Mem[000000001014143c] = 7a8eeeff
	sta	%f14,[%i5+0x03c]%asi	! Mem[000000001014143c] = 00000000
!	%f16 = 00000000, Mem[0000000010041410] = c3710000
	sta	%f16,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l2 = ffffc6ff, %l3 = 00000000, Mem[0000000030141400] = b1000000 00000000
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffc6ff 00000000
!	%f9  = 80000000, Mem[0000000030041410] = ebd1c42a
	sta	%f9 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 80000000
!	Mem[0000000010041408] = 0000003f, %l1 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l1	! %l1 = 000000000000003f
!	%l1 = 000000000000003f, imm = 0000000000000f4d, %l4 = 00000000000000ab
	and	%l1,0xf4d,%l4		! %l4 = 000000000000000d
!	%f0  = 00000000 ff0000ff d28030ab c30000ff
!	%f4  = ff8c2cff 0000ffff 9e3da5c0 94f1a574
!	%f8  = ff570000 80000000 ff000080 f200ffff
!	%f12 = ffffffff adf36949 00000000 0000001e
	stda	%f0,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	%f19 = 00003b05, %f27 = 5c06ff76, %f30 = b15b0000
	fsubs	%f19,%f27,%f30		! %l0 = ffffffffff54f97e, Unfinished, %fsr = 2800000400
!	%l1 = 000000000000003f, Mem[0000000030181400] = ff573fd9
	stba	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = ff573f3f
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = d28030ab, %l0 = ffffffffff54f97e
	lduba	[%i6+%o5]0x88,%l0	! %l0 = 00000000000000ab

p0_label_227:
!	Mem[00000000100c142c] = 00000086, %l1 = 000000000000003f
	ldsw	[%i3+0x02c],%l1		! %l1 = 0000000000000086
!	Mem[0000000020800000] = 00005b63, %l7 = 0000000000ab06a3
	ldsha	[%o1+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = ffff0000 ff2c8cff, %l4 = 0000000d, %l5 = 00000000
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 00000000ff2c8cff 00000000ffff0000
!	%f28 = ff008cf2, %f29 = 2ac4d1eb
	fcmpes	%fcc2,%f28,%f29		! %fcc2 = 1
!	%f24 = 00000000 ffff00f2, %f30 = b15b0000 b1000000
	fxtod	%f24,%f30		! %f30 = 41efffe0 1e400000
!	%l1 = 0000000000000086, imm = 0000000000000a4c, %l6 = 0000000000ab065c
	and	%l1,0xa4c,%l6		! %l6 = 0000000000000004
!	Mem[00000000100c1420] = 00ff0000, %l1 = 0000000000000086
	ldub	[%i3+0x022],%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %l3 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l1 = 0000000000000000, imm = fffffffffffff861, %l4 = 00000000ff2c8cff
	andn	%l1,-0x79f,%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = 0000a555, %l1 = 0000000000000000
	ldstub	[%o1+0x040],%l1		! %l1 = 00000000000000ff

p0_label_228:
!	%l3 = 00000000000000ff, Mem[0000000010181428] = 000000ff
	stw	%l3,[%i6+0x028]		! Mem[0000000010181428] = 000000ff
!	%l1 = 0000000000000000, Mem[0000000030001408] = 00000000
	stha	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%l4 = 0000000000000000, Mem[00000000300c1408] = eb0000ff95ffe03a
	stxa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	%l6 = 00000004, %l7 = 00000000, Mem[0000000030141410] = 0000ffff ff8c2cff
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000004 00000000
!	%l1 = 0000000000000000, Mem[0000000010041412] = 00000000
	stb	%l1,[%i1+0x012]		! Mem[0000000010041410] = 00000000
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000030141410] = 04000000, %l0 = 00000000000000ab
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 00000004000000ff
!	%l5 = 00000000ffff0000, Mem[0000000010101410] = 00003bff
	stha	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000010041410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001420] = 0000337e, %l3 = 00000000, %l1 = 00000000
	add	%i0,0x20,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 000000000000337e
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = eb0000ff a0626a6b, %l0 = 00000004, %l1 = 0000337e
	ldda	[%i1+0x030]%asi,%l0	! %l0 = 00000000eb0000ff 00000000a0626a6b

p0_label_229:
!	Mem[0000000010101408] = d28030ab, %l5 = 00000000ffff0000
	ldswa	[%i4+%o4]0x80,%l5	! %l5 = ffffffffd28030ab
!	Mem[0000000010101418] = 1bf4f800, %l5 = ffffffffd28030ab
	lduwa	[%i4+0x018]%asi,%l5	! %l5 = 000000001bf4f800
!	Mem[000000001008140c] = 3fff5bb1, %l1 = 00000000a0626a6b
	ldsh	[%i2+0x00e],%l1		! %l1 = 0000000000005bb1
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%l7 = 0000000000000000, immed = fffff09a, %y  = 00000004
	udiv	%l7,-0xf66,%l5		! %l5 = 0000000000000004
	mov	%l0,%y			! %y = eb0000ff
!	Mem[00000000100c1400] = 000000ff, %l0 = 00000000eb0000ff
	ldsha	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = 000000ff, %l0 = 00000000000000ff
	lduha	[%i5+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001410] = 71c3ff76, %l0 = 00000000000000ff
	ldsha	[%i0+%o5]0x80,%l0	! %l0 = 00000000000071c3
!	Mem[0000000010181410] = 0000e2ff d28030ab, %l4 = 00000000, %l5 = 00000004
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 00000000d28030ab 000000000000e2ff
!	Starting 10 instruction Store Burst
!	Mem[000000001008140c] = 3fff5bb1, %l5 = 0000e2ff, %l2 = ffffc6ff
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 000000003fff5bb1

p0_label_230:
!	Mem[0000000010081408] = f20056c0, %l6 = 0000000000000004
	swapa	[%i2+%o4]0x88,%l6	! %l6 = 00000000f20056c0
!	Mem[0000000010141410] = ff8c2cff, %l3 = 0000000000000000, %asi = 80
	swapa	[%i5+0x010]%asi,%l3	! %l3 = 00000000ff8c2cff
!	%f20 = eb0000ff a0626a6b, %l3 = 00000000ff8c2cff
!	Mem[0000000010041428] = ff0000ffffffff95
	add	%i1,0x028,%g1
	stda	%f20,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010041428] = 6b6a62a0ff0000eb
!	Mem[00000000218000c0] = ffff3492, %l7 = 0000000000000000
	ldstuba	[%o3+0x0c0]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000300c1408] = 00000000, %l6 = 00000000f20056c0
	ldstuba	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l2 = 000000003fff5bb1
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l5 = 000000000000e2ff
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010081400] = 00006949
	stha	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%l1 = 0000000000005bb1, Mem[0000000030101408] = 1e000000000000ff
	stxa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000005bb1
!	Starting 10 instruction Load Burst
!	Mem[0000000010181420] = ffffed05, %l4 = 00000000d28030ab
	lduha	[%i6+0x022]%asi,%l4	! %l4 = 000000000000ed05

p0_label_231:
!	Mem[0000000030081400] = 00000000000057ff, %f16 = 00000000 000057ff
	ldda	[%i2+%g0]0x81,%f16	! %f16 = 00000000 000057ff
!	Mem[00000000201c0000] = 6949eaae, %l1 = 0000000000005bb1
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000006949
!	Mem[0000000010181408] = ff5bdc77, %l2 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l2	! %l2 = 000000000000dc77
!	Mem[0000000030001410] = 00000000, %l2 = 000000000000dc77
	lduha	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141408] = ffffffff 000000ff, %l4 = 0000ed05, %l5 = 00000000
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000ff 00000000ffffffff
!	Mem[0000000010041414] = 000000ff, %l1 = 0000000000006949
	ldswa	[%i1+0x014]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 00000000ff5bdc77, %l5 = 00000000ffffffff
	ldxa	[%i6+%o4]0x88,%l5	! %l5 = 00000000ff5bdc77
!	Mem[00000000300c1400] = 00001e00, %l1 = 00000000000000ff
	ldswa	[%i3+%g0]0x89,%l1	! %l1 = 0000000000001e00
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = ff5bdc77, Mem[0000000030181408] = 7a8eeeff 690c52af
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 ff5bdc77

p0_label_232:
!	Mem[0000000030141408] = ff0000c3, %l6 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l6	! %l6 = 00000000ff0000c3
!	%l6 = 00000000ff0000c3, Mem[0000000010141410] = 00000000
	stwa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = ff0000c3
!	%f26 = 00000000 5c06ff76, %l7 = 00000000000000ff
!	Mem[0000000010181428] = 000000ff5c06ff76
	add	%i6,0x028,%g1
	stda	%f26,[%g1+%l7]ASI_PST32_P ! Mem[0000000010181428] = 000000005c06ff76
!	Mem[0000000010001400] = 000000ff, %l0 = 00000000000071c3
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010081408] = 00000004
	stba	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	Mem[0000000030081410] = 00000000, %l6 = 00000000ff0000c3
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141402] = ff006c00, %l0 = 00000000000000ff
	ldstuba	[%i5+0x002]%asi,%l0	! %l0 = 0000006c000000ff
!	%f20 = eb0000ff a0626a6b, Mem[0000000030041408] = ff8c2cff 0000ffff
	stda	%f20,[%i1+%o4]0x81	! Mem[0000000030041408] = eb0000ff a0626a6b
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010181428] = 00000000 5c06ff76
	stda	%l6,[%i6+0x028]%asi	! Mem[0000000010181428] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 9aea7100, %l4 = 0000000000000000
	lduba	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_233:
!	Mem[0000000030141408] = 00000000, %l1 = 0000000000001e00
	lduha	[%i5+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 0000003f, %l1 = 0000000000000000
	ldub	[%i3+0x00b],%l1		! %l1 = 000000000000003f
!	Mem[0000000010081410] = 000000005c06ff76, %l3 = 00000000ff8c2cff
	ldxa	[%i2+%o5]0x80,%l3	! %l3 = 000000005c06ff76
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010041408] = 000000ff
	stwa	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	Mem[00000000100c1400] = ff000000, %l7 = 00000000000000ff
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010081400] = 0000eeff 000000ff, %l6 = 00000000, %l7 = 0000ff00
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff 000000000000eeff
!	Mem[00000000100c1408] = 0000003f, %l7 = 000000000000eeff
	lduba	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %f26 = 00000000
	lda	[%i2+%o4]0x81,%f26	! %f26 = 00000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000006c, %l1 = 0000003f, Mem[0000000010081408] = 00000000 3fff5bb1
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000006c 0000003f

p0_label_234:
!	%l4 = 0000000000000000, Mem[0000000030001400] = 000071c3
	stba	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 00007100
!	%l7 = 0000000000000000, Mem[0000000010101408] = d28030ab
	stha	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 000030ab
!	%l2 = 0000000000000000, Mem[0000000010141408] = ff000000
	stba	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%f4  = ff8c2cff, %f22 = 00000000
	fcmps	%fcc1,%f4 ,%f22		! %fcc1 = 3
!	%f10 = ff000080, Mem[0000000010101408] = ab300000
	sta	%f10,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000080
!	%f0  = 00000000 ff0000ff, Mem[0000000010041408] = 00000000 00000077
	stda	%f0 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 ff0000ff
!	%f14 = 00000000 0000001e, Mem[0000000030181410] = 94ffffff 6c000000
	stda	%f14,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 0000001e
!	%l1 = 000000000000003f, Mem[0000000010041400] = eb0000ff
	stha	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 003f00ff
!	Code Fragment 3
p0_fragment_34:
!	%l0 = 000000000000006c
	setx	0xc77816884a0afd0b,%g7,%l0 ! %l0 = c77816884a0afd0b
!	%l1 = 000000000000003f
	setx	0x90d54f2ffedf14d7,%g7,%l1 ! %l1 = 90d54f2ffedf14d7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c77816884a0afd0b
	setx	0xe7325a77ad03fb4b,%g7,%l0 ! %l0 = e7325a77ad03fb4b
!	%l1 = 90d54f2ffedf14d7
	setx	0xa920c207db443614,%g7,%l1 ! %l1 = a920c207db443614
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = eb0000ff, %l0 = e7325a77ad03fb4b
	lduwa	[%i1+%o4]0x81,%l0	! %l0 = 00000000eb0000ff

p0_label_235:
!	%l2 = 0000000000000000, immed = fffff66b, %y  = eb0000ff
	udiv	%l2,-0x995,%l3		! %l3 = 00000000eb0009ca
	mov	%l0,%y			! %y = eb0000ff
!	Mem[0000000030101408] = 00000000, %l3 = 00000000eb0009ca
	ldsba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 001e0000, %l4 = 0000000000000000
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 00000000001e0000
!	Mem[0000000030181400] = 3f3f57ff, %l7 = 0000000000000000
	ldswa	[%i6+%g0]0x81,%l7	! %l7 = 000000003f3f57ff
!	Mem[0000000030001408] = 00000000 9aea71c3, %l4 = 001e0000, %l5 = ff5bdc77
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000 000000009aea71c3
!	Mem[00000000300c1400] = 001e000000000000, %l1 = a920c207db443614
	ldxa	[%i3+%g0]0x81,%l1	! %l1 = 001e000000000000
!	Mem[0000000010001408] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181410] = 1e000000, %l6 = 00000000000000ff
	lduwa	[%i6+%o5]0x81,%l6	! %l6 = 000000001e000000
!	Mem[0000000020800040] = ff00a555, %l4 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l4	! %l4 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000010001408] = ff000000
	stha	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = ffff0000

p0_label_236:
!	%f24 = 00000000, Mem[0000000010081408] = 6c000000
	sta	%f24,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%f0  = 00000000 ff0000ff d28030ab c30000ff
!	%f4  = ff8c2cff 0000ffff 9e3da5c0 94f1a574
!	%f8  = ff570000 80000000 ff000080 f200ffff
!	%f12 = ffffffff adf36949 00000000 0000001e
	stda	%f0,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
!	%l1 = 001e000000000000, Mem[0000000020800040] = ff00a555
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 0000a555
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010081410] = 0000ffff, %l0 = 00000000eb0000ff
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[00000000100c1400] = 000000ff
	stba	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	Mem[0000000030001400] = 00710000, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%l1 = 001e000000000000, %l3 = 0000000000000000, %y  = eb0000ff
	sdiv	%l1,%l3,%l0		! Div by zero, %l0 = 000000000000014f
	mov	%l0,%y			! %y = 00000127
!	%f10 = ff000080, %f9  = 80000000, %f26 = 00000000
	fmuls	%f10,%f9 ,%f26		! %f26 = 00000000
!	Mem[000000001018143d] = adf36949, %l4 = ffffffffffffff00
	ldstub	[%i6+0x03d],%l4		! %l4 = 000000f3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff573f3f, %l1 = 001e000000000000
	ldswa	[%i6+%g0]0x89,%l1	! %l1 = ffffffffff573f3f

p0_label_237:
!	Mem[0000000030181410] = 1e000000, %l6 = 000000001e000000
	lduwa	[%i6+%o5]0x81,%l6	! %l6 = 000000001e000000
!	Mem[0000000010101408] = 800000ff, %f15 = 0000001e
	lda	[%i4+%o4]0x80,%f15	! %f15 = 800000ff
!	Mem[000000001000141c] = 0dae598d, %l5 = 000000009aea71c3
	ldsh	[%i0+0x01e],%l5		! %l5 = 000000000000598d
!	Mem[0000000010001410] = 71c3ff76, %l6 = 000000001e000000
	ldsba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000071
!	Mem[0000000030081410] = ff000000, %l1 = ffffffffff573f3f
	ldsha	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010181430] = ff008cff, %l5 = 000000000000598d
	ldswa	[%i6+0x030]%asi,%l5	! %l5 = ffffffffff008cff
!	Mem[0000000010141408] = 00000000, %l6 = 0000000000000071
	lduba	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 000000ff 000000ff, %l0 = 00000127, %l1 = ffffff00
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff 00000000000000ff
!	Mem[0000000010041410] = ff000000, %f7  = 94f1a574
	lda	[%i1+%o5]0x80,%f7 	! %f7 = ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 00ff00ff, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 000000ff000000ff

p0_label_238:
!	%f12 = ffffffff adf36949, %l2 = ffffffffffffffff
!	Mem[0000000010041430] = eb0000ffa0626a6b
	add	%i1,0x030,%g1
	stda	%f12,[%g1+%l2]ASI_PST16_P ! Mem[0000000010041430] = ffffffffadf36949
!	Mem[00000000211c0001] = e0ff4b99, %l4 = 00000000000000f3
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010141404] = 00000000, %l2 = ffffffffffffffff, %asi = 80
	swapa	[%i5+0x004]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 0000ffff, %l2 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 000000000000ffff
!	%l3 = 0000000000000000, Mem[0000000010101408] = ff000080
	stwa	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%l7 = 000000003f3f57ff, Mem[00000000300c1410] = 000071c3
	stba	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff0071c3
!	%l1 = 00000000000000ff, Mem[0000000030141400] = ff0000ff
	stba	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = ff0000ff
!	%l1 = 00000000000000ff, %l4 = 00000000000000ff, %l6  = 00000000000000ff
	mulx	%l1,%l4,%l6		! %l6 = 000000000000fe01
!	Mem[0000000010001418] = 00ff0000, %l0 = 00000000000000ff
	swap	[%i0+0x018],%l0		! %l0 = 0000000000ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000c30000ff, %l0 = 0000000000ff0000
	ldxa	[%i4+%o4]0x80,%l0	! %l0 = 00000000c30000ff

p0_label_239:
!	Mem[0000000030081408] = 00000000, %f29 = 2ac4d1eb
	lda	[%i2+%o4]0x81,%f29	! %f29 = 00000000
!	Mem[0000000030101408] = 00000000, %f25 = ffff00f2
	lda	[%i4+%o4]0x81,%f25	! %f25 = 00000000
!	Mem[0000000010081410] = ff8c2cff00000000, %l3 = 0000000000000000
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = ff8c2cff00000000
!	Mem[0000000030081400] = 00000000, %l6 = 000000000000fe01
	ldsba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l0 = 00000000c30000ff
	ldsha	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 00000000ff0000ff, %l0 = 00000000000000ff
	ldxa	[%i1+%o4]0x80,%l0	! %l0 = 00000000ff0000ff
!	%f6  = 9e3da5c0, %f21 = a0626a6b, %f20 = eb0000ff
	fsubs	%f6 ,%f21,%f20		! %f20 = 2056900f
!	Mem[0000000030041410] = 80000000, %l5 = ffffffffff008cff
	ldsha	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181424] = ffa56439, %l2 = 000000000000ffff, %asi = 80
	swapa	[%i6+0x024]%asi,%l2	! %l2 = 00000000ffa56439

p0_label_240:
!	%l3 = ff8c2cff00000000, Mem[000000001000143c] = 9aea71c3
	stw	%l3,[%i0+0x03c]		! Mem[000000001000143c] = 00000000
!	%f12 = ffffffff adf36949, Mem[0000000010001408] = ffff0000 1bf4f800
	stda	%f12,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff adf36949
!	%l2 = 00000000ffa56439, Mem[00000000300c1410] = c37100ff
	stba	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = c3710039
!	%l7 = 000000003f3f57ff, Mem[0000000010181410] = ab3080d2
	stba	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = ff3080d2
!	Mem[0000000030001400] = ff710000, %l1 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l1	! %l1 = 00000000ff710000
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010101410] = ff000000 000057ff
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff 00000000
!	Mem[0000000030081400] = 00000000, %l1 = 00000000ff710000
	ldstuba	[%i2+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141430] = 00000000ffffffff, %l3 = ff8c2cff00000000, %l2 = 00000000ffa56439
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = 00000000ffffffff
!	%l6 = 00000000, %l7 = 3f3f57ff, Mem[0000000030081408] = 00000000 00000000
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 3f3f57ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 00008319, %l1 = 0000000000000000
	ldsha	[%o3+0x140]%asi,%l1	! %l1 = 0000000000000000

p0_label_241:
!	Mem[000000001000142c] = 0000ffff, %l0 = 00000000ff0000ff
	lduh	[%i0+0x02e],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030081408] = 00000000, %l1 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = ff003f00, %l0 = 000000000000ffff
	ldsba	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = ff000000, %l1 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030101410] = 00003b053fff5bb1, %l4 = 00000000000000ff
	ldxa	[%i4+%o5]0x81,%l4	! %l4 = 00003b053fff5bb1
!	Mem[00000000100c1410] = 00000000, %f3  = c30000ff
	lda	[%i3+%o5]0x80,%f3 	! %f3 = 00000000
!	Mem[0000000030081400] = ff000000, %f0  = 00000000
	lda	[%i2+%g0]0x81,%f0 	! %f0 = ff000000
!	Mem[0000000030141400] = 00000000ff0000ff, %l2 = 00000000ffffffff
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000030181408] = 00000000, %l2 = 00000000ff0000ff
	lduha	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = ff000000, Mem[00000000100c1400] = ff000000 05560cff
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 ff000000

p0_label_242:
!	Mem[0000000030101410] = 053b0000, %l0 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101410] = 053b00ff, %l6 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 00000000053b00ff
!	Mem[0000000030041400] = ff000000, %l1 = 00000000ff000000
	ldstuba	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1439] = 8ae1e2ff, %l5 = 0000000000000000
	ldstub	[%i3+0x039],%l5		! %l5 = 000000e1000000ff
!	Code Fragment 3
p0_fragment_35:
!	%l0 = 0000000000000000
	setx	0x6f5e0effac5efe0a,%g7,%l0 ! %l0 = 6f5e0effac5efe0a
!	%l1 = 0000000000000000
	setx	0x50d56dc83d1527db,%g7,%l1 ! %l1 = 50d56dc83d1527db
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6f5e0effac5efe0a
	setx	0x7db5faa03c00cc02,%g7,%l0 ! %l0 = 7db5faa03c00cc02
!	%l1 = 50d56dc83d1527db
	setx	0x18b93c17ee63497e,%g7,%l1 ! %l1 = 18b93c17ee63497e
!	%l3 = ff8c2cff00000000, Mem[0000000030041408] = eb0000ff
	stwa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Mem[0000000030181410] = 1e000000, %l3 = ff8c2cff00000000
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 000000001e000000
!	%l2 = 0000000000000000, Mem[0000000030101408] = 00000000
	stwa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	Mem[0000000010141400] = ff00ff00, %l4 = 00003b053fff5bb1
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 00000000ff00ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000ff, %f26 = 00000000
	lda	[%i5+%o5]0x89,%f26	! %f26 = 000000ff

p0_label_243:
!	Mem[0000000010001410] = 71c3ff76, %l4 = 00000000ff00ff00
	ldsba	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000071
!	Mem[0000000010141408] = 00000000 ffffffff, %l0 = 3c00cc02, %l1 = ee63497e
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000 00000000ffffffff
!	Mem[0000000010181400] = 0000e2ff 000057ff, %l4 = 00000071, %l5 = 000000e1
	ldda	[%i6+%g0]0x80,%l4	! %l4 = 000000000000e2ff 00000000000057ff
!	Mem[0000000010081434] = ffffffff, %l6 = 00000000053b00ff
	ldsba	[%i2+0x034]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030181400] = ff573f3f, %l1 = 00000000ffffffff
	lduba	[%i6+%g0]0x89,%l1	! %l1 = 000000000000003f
!	Mem[0000000010041408] = 00000000ff0000ff, %f6  = 9e3da5c0 ff000000
	ldda	[%i1+%o4]0x80,%f6 	! %f6  = 00000000 ff0000ff
!	Mem[0000000030041410] = 00000080, %l1 = 000000000000003f
	ldsha	[%i1+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = ffffffff adf36949, %l4 = 0000e2ff, %l5 = 000057ff
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 00000000ffffffff 00000000adf36949
!	Mem[0000000030081408] = 00000000, %l1 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f13 = adf36949, Mem[0000000010001428] = ffffffff
	st	%f13,[%i0+0x028]	! Mem[0000000010001428] = adf36949

p0_label_244:
!	%l7 = 000000003f3f57ff, Mem[0000000030181410] = 00000000
	stha	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 000057ff
!	%l5 = 00000000adf36949, Mem[0000000010181408] = 77dc5bff00000000
	stxa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000adf36949
!	Mem[0000000010181410] = d28030ff, %l7 = 000000003f3f57ff
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030001410] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f16 = 00000000 000057ff ff5bdc77 00003b05
!	%f20 = 2056900f a0626a6b 00000000 7a8eeeff
!	%f24 = 00000000 00000000 000000ff 5c06ff76
!	%f28 = ff008cf2 00000000 41efffe0 1e400000
	stda	%f16,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	%l4 = 00000000ffffffff, Mem[00000000300c1400] = 00000000
	stha	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000ffff
!	Mem[000000001018142d] = 000000ff, %l5 = 00000000adf36949
	ldstuba	[%i6+0x02d]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181418] = b15b00003fff5bb1, %l3 = 000000001e000000, %l3 = 000000001e000000
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = b15b00003fff5bb1
!	%l1 = 0000000000000000, Mem[00000000211c0001] = e0ff4b99, %asi = 80
	stba	%l1,[%o2+0x001]%asi	! Mem[00000000211c0000] = e0004b99
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l4 = 00000000ffffffff
	lduha	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_245:
!	Mem[0000000010141410] = c30000ff0000ffff, %f14 = 00000000 800000ff
	ldda	[%i5+%o5]0x80,%f14	! %f14 = c30000ff 0000ffff
	membar	#Sync			! Added by membar checker (34)
!	Mem[00000000300c1400] = 0000ffff, %l7 = 00000000000000ff
	ldsba	[%i3+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %l7 = ffffffffffffffff
	lduha	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%l2 = 0000000000000000, %l6 = ffffffffffffffff, %y  = 00000127
	smul	%l2,%l6,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000010041408] = ff0000ff00000000, %f6  = 00000000 ff0000ff
	ldda	[%i1+%o4]0x88,%f6 	! %f6  = ff0000ff 00000000
!	Mem[0000000030041400] = ff0000ff81f1fffe, %l0 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l0	! %l0 = ff0000ff81f1fffe
!	Mem[0000000030041410] = 80000000, %l7 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l7	! %l7 = ffffffff80000000
!	Mem[0000000030001410] = 00000084000000ff, %l5 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l5	! %l5 = 00000084000000ff
!	Mem[00000000211c0000] = e0004b99, %l4 = 0000000000000000
	ldub	[%o2+0x001],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = ffffffff80000000, Mem[0000000030101400] = ff00f8ff
	stba	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = ff00f800

p0_label_246:
!	%l0 = ff0000ff81f1fffe, Mem[0000000030001408] = 00000000
	stba	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000fe
!	%l4 = 0000000000000000, Mem[0000000010001400] = 000071c3
	stwa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	Mem[0000000010081400] = ff0000ff, %l6 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	%f24 = 00000000 00000000, %l6 = 00000000000000ff
!	Mem[0000000030141408] = 00000000ab3080d2
	add	%i5,0x008,%g1
	stda	%f24,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030141408] = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l4 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%f22 = 00000000 7a8eeeff, %l7 = ffffffff80000000
!	Mem[0000000010041428] = 6b6a62a0ff0000eb
	add	%i1,0x028,%g1
	stda	%f22,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010041428] = 6b6a62a0ff0000eb
!	%l0 = 81f1fffe, %l1 = 00000000, Mem[0000000010041408] = 00000000 ff0000ff
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 81f1fffe 00000000
!	%f10 = ff000080 f200ffff, Mem[0000000010181410] = ff3080d2 ffe20000
	std	%f10,[%i6+%o5]	! Mem[0000000010181410] = ff000080 f200ffff
!	%l1 = 0000000000000000, Mem[0000000010141408] = 00000000
	stwa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff5bdc7700000000, %f24 = 00000000 00000000
	ldda	[%i6+%o4]0x89,%f24	! %f24 = ff5bdc77 00000000

p0_label_247:
!	%f20 = 2056900f a0626a6b, %l0 = ff0000ff81f1fffe
!	Mem[00000000300c1400] = ffff0000000057ff
	stda	%f20,[%i3+%l0]ASI_PST32_SL ! Mem[00000000300c1400] = ffff00000f905620
!	Mem[0000000010081408] = c30000ff, %l2 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041424] = e5541976, %l1 = 0000000000000000
	lduha	[%i1+0x026]%asi,%l1	! %l1 = 0000000000001976
!	Mem[0000000010181410] = ff000080, %l3 = b15b00003fff5bb1
	ldsba	[%i6+%o5]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101408] = 00000000, %f31 = 1e400000
	lda	[%i4+%o4]0x89,%f31	! %f31 = 00000000
!	Mem[0000000010001410] = 76ffc371, %f10 = ff000080
	lda	[%i0+%o5]0x88,%f10	! %f10 = 76ffc371
!	Mem[0000000030041408] = 00000000, %l7 = ffffffff80000000
	lduba	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = ff000000 000000ff, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff000000 00000000000000ff
!	Mem[0000000010141410] = ff0000c3, %l7 = 00000000000000ff
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = ffffffffff0000c3
!	Starting 10 instruction Store Burst
!	%f30 = 41efffe0, %f8  = ff570000, %f11 = f200ffff
	fmuls	%f30,%f8 ,%f11		! %f11 = ff800000

p0_label_248:
!	%l0 = ff0000ff81f1fffe, Mem[0000000030181408] = 00000000
	stha	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = fffe0000
!	%l5 = 00000084000000ff, Mem[0000000010001408] = ffffffff
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	Mem[0000000010041410] = 000000ff, %l5 = 00000084000000ff
	swapa	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[00000000201c0000] = 6949eaae, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000eaae
!	Mem[0000000010081408] = ff0000c3, %l0 = ff0000ff81f1fffe
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 00000000ff0000c3
!	%f0  = ff000000, Mem[0000000030101400] = ff00f800
	sta	%f0 ,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000000
!	Mem[0000000030101410] = 00000000, %l2 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%l0 = 00000000ff0000c3, Mem[0000000010181400] = ff570000ffe20000
	stxa	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000ff0000c3
!	%l2 = 0000000000000000, Mem[0000000010181410] = ffff00f2800000ff
	stxa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	%l1 = 0000000000001976, immed = 00000a3c, %y  = 00000000
	sdiv	%l1,0xa3c,%l0		! %l0 = 0000000000000002
	mov	%l0,%y			! %y = 00000002

p0_label_249:
!	Mem[000000001000143c] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i0+0x03c]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l0 = 0000000000000002
	ldsh	[%i2+0x012],%l0		! %l0 = 0000000000000000
!	Mem[0000000010041410] = ff000000000000ff, %l0 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = ff000000000000ff
!	Mem[00000000100c1400] = 00000000, %l7 = ffffffffff0000c3
	lduha	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800100] = eaff7eb5, %l2 = 0000000000000000
	lduba	[%o3+0x101]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = 3f3f57ff00000000, %f22 = 00000000 7a8eeeff
	ldda	[%i6+%g0]0x81,%f22	! %f22 = 3f3f57ff 00000000
!	Mem[0000000010081410] = 00000000, %l6 = 00000000ff000000
	ldsba	[%i2+0x013]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = ff0000ff, %l0 = ff000000000000ff
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = ffffffffff0000ff
!	Mem[0000000010141408] = 00000000, %l4 = 0000000000000000
	ldswa	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030101408] = 0000000000005bb1
	stxa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000

p0_label_250:
!	%f0  = ff000000 ff0000ff d28030ab 00000000
!	%f4  = ff8c2cff 0000ffff ff0000ff 00000000
!	%f8  = ff570000 80000000 76ffc371 ff800000
!	%f12 = ffffffff adf36949 c30000ff 0000ffff
	stda	%f0,[%i5]ASI_BLK_AIUP	! Block Store to 0000000010141400
!	%l1 = 0000000000001976, %l5 = 0000000000000000, %l3 = ffffffffffffffff
	andn	%l1,%l5,%l3		! %l3 = 0000000000001976
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010141410] = ff2c8cff, %l1 = 0000000000001976
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000300c1400] = ffff0000, %l2 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000ffff0000
!	Mem[0000000030101408] = 00000000, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = ff573f3f, %l2 = 00000000ffff0000
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 0000003f000000ff
!	Mem[0000000030181410] = 000057ff, %l3 = 0000000000001976
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000021800081] = ffff3e7c, %l2 = 000000000000003f
	ldstub	[%o3+0x081],%l2		! %l2 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stha	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 81f1fffe, %l5 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffff81f1

p0_label_251:
!	Mem[0000000030181408] = 0000feff, %l6 = 0000000000000000
	ldsha	[%i6+%o4]0x89,%l6	! %l6 = fffffffffffffeff
!	Mem[0000000010181428] = 00000000 00ff00ff, %l4 = 00000000, %l5 = ffff81f1
	ldd	[%i6+0x028],%l4		! %l4 = 0000000000000000 0000000000ff00ff
!	Mem[00000000300c1400] = 000000ff, %l0 = ffffffffff0000ff
	ldswa	[%i3+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041400] = ff003f00, %l2 = 00000000000000ff
	ldsha	[%i1+%g0]0x88,%l2	! %l2 = 0000000000003f00
!	Mem[0000000030001408] = fe000000, %l3 = 00000000000000ff
	lduwa	[%i0+%o4]0x81,%l3	! %l3 = 00000000fe000000
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000003f00
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000000ff00ff
	ldsha	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = ff0000ff, %l7 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[000000001000143c] = 00000000, %l0 = 000000ff, %l4 = 00000000
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 0000000000000000

p0_label_252:
!	Mem[0000000010101424] = ae000000, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x024]%asi,%l0	! %l0 = 00000000ae000000
!	%l5 = 0000000000000000, Mem[0000000030001408] = 000000fe
	stha	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000fe000000
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l6 = fffffeff, %l7 = ffffff00, Mem[0000000030081408] = 00000000 ff573f3f
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = fffffeff ffffff00
!	Mem[0000000010181429] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i6+0x029]%asi,%l3	! %l3 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030181410] = 000057ff
	stha	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	%l6 = fffffffffffffeff, Mem[0000000030101410] = ff000000
	stba	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = ff000000
!	%l7 = ffffffffffffff00, Mem[0000000010141434] = adf36949
	stw	%l7,[%i5+0x034]		! Mem[0000000010141434] = ffffff00
!	%f3  = 00000000, Mem[00000000100c1410] = 000000ff
	sta	%f3 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %l0 = 00000000ae000000
	ldsb	[%i0+0x009],%l0		! %l0 = 0000000000000000

p0_label_253:
!	Mem[0000000010041410] = ff000000000000ff, %f22 = 3f3f57ff 00000000
	ldda	[%i1+%o5]0x88,%f22	! %f22 = ff000000 000000ff
!	Mem[0000000010101410] = ff000000, %l3 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l3	! %l3 = ffffffffff000000
!	Mem[00000000100c1408] = 0000003f, %f11 = ff800000
	lda	[%i3+%o4]0x80,%f11	! %f11 = 0000003f
!	Mem[00000000201c0000] = 0000eaae, %l5 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l7 = ffffffffffffff00
	ldsha	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0000] = 0000eaae, %l6 = fffffffffffffeff
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 00000000ff000000, %l4 = 0000000000000000
	ldxa	[%i4+%g0]0x89,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1430] = af520c69ffffe8de, %f0  = ff000000 ff0000ff
	ldd	[%i3+0x030],%f0 	! %f0  = af520c69 ffffe8de
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030101410] = ff0000003fff5bb1
	stxa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000000

p0_label_254:
!	Mem[00000000100c1408] = 0000003f, %l0 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = ab3080d2, %l2 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 000000d2000000ff
!	Mem[000000001008140e] = ab3080d2, %l7 = 00000000000000ff
	ldstub	[%i2+0x00e],%l7		! %l7 = 00000080000000ff
!	%f12 = ffffffff adf36949, Mem[0000000010041408] = fefff181 00000000
	stda	%f12,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffff adf36949
!	%f24 = ff5bdc77 00000000, %l3 = ffffffffff000000
!	Mem[0000000030041430] = 000000785aad3c10
	add	%i1,0x030,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_S ! Mem[0000000030041430] = 000000785aad3c10
!	Mem[0000000010001408] = 000000ff, %l2 = 00000000000000d2
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%f16 = 00000000, Mem[00000000100c1438] = 8affe2ff
	st	%f16,[%i3+0x038]	! Mem[00000000100c1438] = 00000000
!	%f0  = af520c69 ffffe8de, %l3 = ffffffffff000000
!	Mem[0000000030181400] = ff3f57ff00000000
	stda	%f0,[%i6+%l3]ASI_PST8_SL ! Mem[0000000030181400] = ff3f57ff00000000
!	%l2 = 00000000000000ff, Mem[0000000030101400] = ff000000
	stwa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = 1e00000000000000, %l4 = 00000000ff000000
	ldx	[%i2+0x038],%l4		! %l4 = 1e00000000000000

p0_label_255:
!	Mem[0000000010081410] = ff8c2cff00000000, %l6 = 0000000000000000
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = ff8c2cff00000000
!	Mem[0000000010101408] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = 0000eaae, %l3 = ffffffffff000000
	ldsba	[%o0+0x001]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l2 = 00000000000000ff
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = 00000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	%f23 = 000000ff, %f31 = 00000000, %f14 = c30000ff
	fsubs	%f23,%f31,%f14		! %l0 = 0000000000000022, Unfinished, %fsr = 2700000400
!	Mem[0000000010101410] = ff000000, %l2 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101404] = 00000000, %l0 = 0000000000000022
	ldub	[%i4+0x007],%l0		! %l0 = 0000000000000000
!	Mem[0000000010041408] = adf36949, %l7 = 0000000000000080
	lduwa	[%i1+%o4]0x88,%l7	! %l7 = 00000000adf36949
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010141408] = ff8030ab 00000000
	stda	%l4,[%i5+0x008]%asi	! Mem[0000000010141408] = 00000000 00000000

p0_label_256:
!	%l1 = 0000000000000000, Mem[0000000010181410] = 0000000000000000
	stxa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000030081400] = 000000ff
	stha	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010041432] = ffffffff
	stb	%l2,[%i1+0x032]		! Mem[0000000010041430] = ffff00ff
!	%l5 = 0000000000000000, Mem[0000000010041408] = 4969f3ad
	stba	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 0069f3ad
!	%l6 = ff8c2cff00000000, Mem[0000000010001408] = 000000ff
	stwa	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	Mem[0000000030041410] = 00000080, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000080
!	Mem[0000000010001404] = 00000000, %l2 = 00000000, %l3 = 00000080
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 0000000000000000
!	%l6 = ff8c2cff00000000, Mem[000000001014142c] = ff800000, %asi = 80
	stba	%l6,[%i5+0x02c]%asi	! Mem[000000001014142c] = 00800000
!	%f20 = 2056900f, Mem[0000000010141408] = 00000000
	sta	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = 2056900f
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l5 = 0000000000000000
	lduha	[%i6+0x010]%asi,%l5	! %l5 = 0000000000000000

p0_label_257:
!	Mem[0000000030001410] = ff000000, %l5 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[00000000211c0000] = e0004b99, %l3 = 0000000000000000
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffe000
!	Mem[0000000030081408] = fffeffff00ffffff, %l1 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l1	! %l1 = fffeffff00ffffff
!	Mem[0000000010001410] = 6c8e7ad376ffc371, %f10 = 76ffc371 0000003f
	ldda	[%i0+%o5]0x88,%f10	! %f10 = 6c8e7ad3 76ffc371
!	Mem[0000000010041408] = 0069f3adffffffff, %l2 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l2	! %l2 = 0069f3adffffffff
!	Mem[0000000010041410] = ff000000, %l1 = fffeffff00ffffff
	ldsha	[%i1+%o5]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030081408] = fffeffff, %l3 = ffffffffffffe000
	lduha	[%i2+%o4]0x81,%l3	! %l3 = 000000000000fffe
!	Mem[000000001014143c] = 0000ffff, %l7 = 00000000adf36949
	lduba	[%i5+0x03d]%asi,%l7	! %l7 = 0000000000000000
!	%l0 = 0000000000000000, %l1 = ffffffffffffff00, %l6 = ff8c2cff00000000
	orn	%l0,%l1,%l6		! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 0069f3ad, %l2 = 0069f3adffffffff
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 000000000069f3ad

p0_label_258:
!	%f16 = 00000000 000057ff, Mem[0000000010081410] = 00000000 ff2c8cff
	stda	%f16,[%i2+0x010]%asi	! Mem[0000000010081410] = 00000000 000057ff
!	%f20 = 2056900f a0626a6b, %l3 = 000000000000fffe
!	Mem[0000000010041400] = 003f00ff000000ff
	stda	%f20,[%i1+%l3]ASI_PST8_PL ! Mem[0000000010041400] = 006a62a00f905620
!	Mem[0000000030001410] = 000000ff, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101410] = 000000ff, %l3 = 000000000000fffe
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l1 = ffffffffffffff00, Mem[0000000010001400] = 00000000
	stwa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffff00
!	%l1 = ffffffffffffff00, Mem[0000000010041408] = ffffffff
	stba	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ffffff
!	%f7  = 00000000, Mem[00000000100c1420] = 00ff0000
	sta	%f7 ,[%i3+0x020]%asi	! Mem[00000000100c1420] = 00000000
!	%f6  = ff0000ff 00000000, Mem[00000000300c1408] = 77dc5bff 053b0000
	stda	%f6 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff0000ff 00000000
!	Mem[0000000010001408] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff2c8cff, %l4 = 00000000000000ff
	ldswa	[%i5+%o5]0x88,%l4	! %l4 = ffffffffff2c8cff

p0_label_259:
!	%l1 = ffffffffffffff00, immed = 00000619, %y  = 00000002
	umul	%l1,0x619,%l1		! %l1 = 00000618fff9e700, %y = 00000618
!	%f24 = ff5bdc77, %f28 = ff008cf2
	fcmps	%fcc2,%f24,%f28		! %fcc2 = 1
!	Mem[0000000010001408] = ff000000, %l6 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[00000000100c1410] = 00000000, %l1 = 00000618fff9e700
	lduha	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = ff000000 000000ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i1+%o5]0x80,%l0	! %l0 = 00000000ff000000 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l0 = 00000000ff000000
	ldsba	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 0000000000000000, %f24 = ff5bdc77 00000000
	ldda	[%i4+%o5]0x89,%f24	! %f24 = 00000000 00000000
!	Mem[0000000010041400] = 006a62a0, %l2 = 000000000069f3ad
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = ff0000ff 81f1fffe, %l6 = 0000ff00, %l7 = 00000000
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 00000000ff0000ff 0000000081f1fffe
!	Starting 10 instruction Store Burst
!	%f18 = ff5bdc77 00003b05, Mem[0000000010001430] = dee8ffff 690c52af
	stda	%f18,[%i0+0x030]%asi	! Mem[0000000010001430] = ff5bdc77 00003b05

p0_label_260:
!	%l3 = 0000000000000000, Mem[0000000010001423] = 0000337e, %asi = 80
	stba	%l3,[%i0+0x023]%asi	! Mem[0000000010001420] = 00003300
!	%f4  = ff8c2cff, Mem[0000000030001410] = 00000000
	sta	%f4 ,[%i0+%o5]0x89	! Mem[0000000030001410] = ff8c2cff
!	%l2 = 0000000000000000, Mem[0000000010101400] = 0071ea9a
	stha	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000ea9a
!	%l3 = 0000000000000000, Mem[0000000030181400] = ff573fff
	stwa	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l2 = 0000000000000000, Mem[000000001000141e] = 0dae598d
	sth	%l2,[%i0+0x01e]		! Mem[000000001000141c] = 0dae0000
!	%f24 = 00000000, Mem[00000000300c1408] = 00000000
	sta	%f24,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%f20 = 2056900f a0626a6b, Mem[00000000300c1410] = 0f905620 6b6a62a0
	stda	%f20,[%i3+%o5]0x89	! Mem[00000000300c1410] = 2056900f a0626a6b
!	Mem[0000000010141410] = ff8c2cff, %l3 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	%l5 = 000000000000ff00, Mem[0000000010141400] = ff000000ff0000ff
	stxa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000000000ff00
!	Starting 10 instruction Load Burst
!	%f3  = 00000000, %f28 = ff008cf2, %f24 = 00000000 00000000
	fsmuld	%f3 ,%f28,%f24		! %f24 = 80000000 00000000

p0_label_261:
!	Mem[0000000010081410] = 00000000, %l5 = 000000000000ff00
	ldswa	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[000000001010142c] = ffffffff, %l1 = 00000000000000ff
	ldsb	[%i4+0x02d],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010141400] = 00000000, %l4 = ffffffffff2c8cff
	ldsha	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l0 = 0000000000000000
	lduwa	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 0000eaae, %l4 = 0000000000000000
	ldsh	[%o0+%g0],%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff, %l4 = 0000000000000000
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %l6 = 00000000ff0000ff
	lduba	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = ff8c2cff, %l5 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[000000001018142c] = 00ff00ff, %l5 = ffffffffffffffff
	lduwa	[%i6+0x02c]%asi,%l5	! %l5 = 0000000000ff00ff
!	Starting 10 instruction Store Burst
!	%f4  = ff8c2cff 0000ffff, Mem[0000000030041400] = ff0000ff 81f1fffe
	stda	%f4 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ff8c2cff 0000ffff

p0_label_262:
!	Mem[0000000010081400] = ff0000ff, %l5 = 0000000000ff00ff
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	%f26 = 000000ff 5c06ff76, %l7 = 0000000081f1fffe
!	Mem[0000000030141430] = 4969f3adffffffff
	add	%i5,0x030,%g1
	stda	%f26,[%g1+%l7]ASI_PST32_S ! Mem[0000000030141430] = 000000ffffffffff
!	Mem[000000001018143c] = adff6949, %l2 = 0000000000000000
	ldstuba	[%i6+0x03c]%asi,%l2	! %l2 = 000000ad000000ff
!	Mem[0000000030041400] = ff2c8cff, %l7 = 0000000081f1fffe
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030001410] = ff2c8cff, %l3 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010141408] = 0f905620, %l7 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 0000000f000000ff
!	Mem[0000000030141410] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030101410] = 00000000, %l7 = 000000000000000f
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010101418] = 1bf4f800
	sth	%l7,[%i4+0x018]		! Mem[0000000010101418] = 0000f800
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 0000eaae, %l1 = ffffffffffffffff
	lduh	[%o0+%g0],%l1		! %l1 = 0000000000000000

p0_label_263:
!	Mem[0000000010101400] = 000000009aea0000, %l2 = 00000000000000ad
	ldxa	[%i4+%g0]0x88,%l2	! %l2 = 000000009aea0000
!	Mem[0000000010001408] = ff000000, %l4 = 00000000000000ff
	lduba	[%i0+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001400] = ffffff00, %l2 = 000000009aea0000
	ldswa	[%i0+%g0]0x88,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010041410] = ff000000, %l1 = 0000000000000000
	lduba	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000021800180] = 84ff1c36, %l4 = 00000000000000ff
	lduha	[%o3+0x180]%asi,%l4	! %l4 = 00000000000084ff
!	Mem[0000000020800040] = 0000a555, %l5 = 00000000000000ff
	lduba	[%o1+0x040]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 00ffffff, %l7 = 0000000000000000
	ldsb	[%i1+0x00a],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010141414] = 0000ffff, %l0 = 00000000000000ff
	ldsb	[%i5+0x014],%l0		! %l0 = 0000000000000000
!	Mem[0000000010101430] = 95ffe03a d37a8e6c, %l0 = 00000000, %l1 = 000000ff
	ldd	[%i4+0x030],%l0		! %l0 = 0000000095ffe03a 00000000d37a8e6c
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 00000000, %l4 = 00000000000084ff
	ldstuba	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000ff

p0_label_264:
!	%l7 = ffffffffffffffff, Mem[0000000010001410] = 76ffc371
	stwa	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = a0626a00, %l3 = 00000000000000ff
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041410] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	%l0 = 0000000095ffe03a, Mem[0000000030001400] = 000000ff
	stba	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 3a0000ff
!	%l0 = 0000000095ffe03a, Mem[0000000010141400] = 00000000
	stha	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000e03a
!	Mem[00000000201c0000] = 0000eaae, %l3 = 0000000000000000
	ldstub	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	%l6 = 00000000, %l7 = ffffffff, Mem[00000000300c1408] = 00000000 ff0000ff
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 ffffffff
!	Mem[0000000030001400] = ff00003a, %l2 = ffffffffffffff00
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 0000003a000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000000000000000, %l2 = 000000000000003a
	ldxa	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000

p0_label_265:
!	Mem[0000000010181408] = 000000ff, %l5 = 00000000000000ff
	lduwa	[%i6+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[000000001010141c] = ff0000ff, %l7 = ffffffffffffffff
	ldsh	[%i4+0x01e],%l7		! %l7 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%f1  = ffffe8de, %f3  = 00000000
	fcmps	%fcc3,%f1 ,%f3 		! %fcc3 = 3
!	Mem[0000000010141400] = 3ae000000000ff00, %f2  = d28030ab 00000000
	ldda	[%i5+%g0]0x80,%f2 	! %f2  = 3ae00000 0000ff00
!	Mem[0000000021800080] = ffff3e7c, %l5 = 00000000000000ff
	ldsha	[%o3+0x080]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041410] = 00000000, %l3 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l5 = ffffffffffffffff
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f23 = 000000ff, %f30 = 41efffe0, %f10 = 6c8e7ad3
	fmuls	%f23,%f30,%f10		! %l0 = 0000000095ffe05c, Unfinished, %fsr = 3700000400

p0_label_266:
!	%l5 = 0000000000000000, Mem[00000000218001c0] = 00ffeec2
	stb	%l5,[%o3+0x1c0]		! Mem[00000000218001c0] = 00ffeec2
!	Mem[0000000030081408] = fffffeff, %l0 = 0000000095ffe05c
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000010141410] = ff2c8cff
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = ff2c8c00
!	%l2 = 0000000000000000, Mem[0000000010001400] = 00ffffff
	stwa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%f22 = ff000000 000000ff, %l5 = 0000000000000000
!	Mem[0000000010101428] = ff0000ffffffffff
	add	%i4,0x028,%g1
	stda	%f22,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010101428] = ff0000ffffffffff
!	%l5 = 0000000000000000, Mem[0000000010081428] = ffff00f2800000ff, %asi = 80
	stxa	%l5,[%i2+0x028]%asi	! Mem[0000000010081428] = 0000000000000000
!	Mem[00000000201c0000] = ff00eaae, %l7 = 00000000000000ff
	ldstub	[%o0+%g0],%l7		! %l7 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000021800000] = c60ef55e, %asi = 80
	stha	%l0,[%o3+0x000]%asi	! Mem[0000000021800000] = 00fff55e
!	%f30 = 41efffe0 00000000, %l0 = 00000000000000ff
!	Mem[0000000030181420] = 7f57000000002700
	add	%i6,0x020,%g1
	stda	%f30,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030181420] = 00000000e0ffef41
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = fffe0000, %l6 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l6	! %l6 = fffffffffffffffe

p0_label_267:
!	%f8  = ff570000, %f5  = 0000ffff
	fsqrts	%f8 ,%f5 		! %f5  = 7fffffff
!	Mem[0000000010101408] = 00000000, %f24 = 80000000
	lda	[%i4+%o4]0x80,%f24	! %f24 = 00000000
!	Mem[0000000030081400] = 00000000, %l0 = 00000000000000ff
	lduha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = ff0000ff, %l6 = fffffffffffffffe
	ldsba	[%i0+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141408] = 00000000, %l1 = 00000000d37a8e6c
	ldsha	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = ff0000ff, %l6 = ffffffffffffffff
	ldsba	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141408] = 0000000000000000, %l3 = 0000000000000000
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = 3ae00000 0000ff00, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i5+0x000]%asi,%l4	! %l4 = 000000003ae00000 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, imm = fffffffffffffb0c, %l2 = 0000000000000000
	subc	%l7,-0x4f4,%l2		! %l2 = 00000000000005f3

p0_label_268:
!	%l2 = 000005f3, %l3 = 00000000, Mem[0000000030001410] = ff8c2cff 00000084
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 000005f3 00000000
!	%l6 = ffffffffffffffff, Mem[0000000030041408] = 00000000
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000ffff
!	Mem[0000000010081400] = ff0000ff, %l7 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ff0000ff
!	Mem[00000000201c0000] = ff00eaae, %l2 = 00000000000005f3
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%l4 = 3ae00000, %l5 = 0000ff00, Mem[0000000030141408] = 00000000 00000000
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 3ae00000 0000ff00
!	Mem[0000000010101400] = 0000ea9a, %l0 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l0	! %l0 = 000000000000ea9a
!	%l7 = 00000000ff0000ff, %l4 = 000000003ae00000, %l7 = 00000000ff0000ff
	subc	%l7,%l4,%l7		! %l7 = 00000000c42000ff
!	Mem[00000000100c1408] = ff00003f, %l7 = 00000000c42000ff
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	%f0  = af520c69, Mem[0000000010141418] = ff0000ff
	sta	%f0 ,[%i5+0x018]%asi	! Mem[0000000010141418] = af520c69
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000, %f15 = 0000ffff
	lda	[%i6+%g0]0x81,%f15	! %f15 = 00000000

p0_label_269:
!	Mem[0000000010181400] = c30000ff 00000000, %l4 = 3ae00000, %l5 = 0000ff00
	ldda	[%i6+%g0]0x80,%l4	! %l4 = 00000000c30000ff 0000000000000000
!	Mem[00000000211c0000] = e0004b99, %l6 = ffffffffffffffff
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffe000
!	%f14 = c30000ff, %f19 = 00003b05
	fcmpes	%fcc2,%f14,%f19		! %fcc2 = 1
!	Mem[00000000300c1400] = 000000ff, %l6 = ffffffffffffe000
	lduha	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = ff000000, %l4 = 00000000c30000ff
	lduha	[%i6+%o4]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030101400] = 000000ff, %l4 = 000000000000ff00
	ldsha	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041400] = 2056900fa0626aff, %l5 = 0000000000000000
	ldxa	[%i1+%g0]0x88,%l5	! %l5 = 2056900fa0626aff
!	Mem[0000000030081408] = fffffeff, %f23 = 000000ff
	lda	[%i2+%o4]0x89,%f23	! %f23 = fffffeff
!	Mem[0000000010181424] = 0000ffff, %l4 = 00000000000000ff
	ldub	[%i6+0x024],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 00000000, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_270:
!	%l7 = 00000000000000ff, Mem[0000000010181430] = ff008cff
	sth	%l7,[%i6+0x030]		! Mem[0000000010181430] = 00ff8cff
!	Mem[0000000030141408] = 3ae00000, %l1 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101410] = ff0000ff, %l7 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000010041408] = ffffffffffffff00
	stxa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	%f25 = 00000000, Mem[0000000030041410] = 00000000
	sta	%f25,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = 008c2cff, %l1 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%l5 = 2056900fa0626aff, %l4 = 0000000000000000, %l3  = 0000000000000000
	mulx	%l5,%l4,%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000000000ff, %f18 = ff5bdc77 00003b05
	ldda	[%i4+%g0]0x89,%f18	! %f18 = 00000000 000000ff

p0_label_271:
!	Mem[000000001010140c] = c30000ff, %f29 = 00000000
	ld	[%i4+0x00c],%f29	! %f29 = c30000ff
!	Mem[0000000010101410] = ff0000ff00000000, %l1 = 0000000000000000
	ldx	[%i4+%o5],%l1		! %l1 = ff0000ff00000000
!	Mem[0000000010181410] = 00000000, %l0 = 000000000000ea9a
	lduba	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 0000000000000000, %f24 = 00000000 00000000
	ldda	[%i4+%g0]0x80,%f24	! %f24 = 00000000 00000000
!	Mem[0000000010081408] = fefff181, %l3 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 00000000fefff181
!	Mem[00000000300c1410] = 6b6a62a0, %l1 = ff0000ff00000000
	lduba	[%i3+%o5]0x81,%l1	! %l1 = 000000000000006b
!	Mem[00000000218000c0] = ffff3492, %l4 = 0000000000000000
	ldsba	[%o3+0x0c1]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000000000
	lduha	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101438] = 37bbffbf, %l0 = 0000000000000000
	ldsh	[%i4+0x03a],%l0		! %l0 = ffffffffffffffbf
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 000057ff, Mem[0000000030181400] = 00000000 00000000
	stda	%f16,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 000057ff

p0_label_272:
!	%l2 = 00000000000000ff, Mem[0000000010141410] = ff2c8cff
	stba	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = ff2c8cff
!	%f16 = 00000000 000057ff, Mem[00000000100c1410] = 00000000 00000000
	stda	%f16,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 000057ff
!	%l0 = ffffffbf, %l1 = 0000006b, Mem[0000000010101400] = 00000000 00000000
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffbf 0000006b
!	%f30 = 41efffe0 00000000, Mem[0000000010041410] = ff000000 000000ff
	stda	%f30,[%i1+%o5]0x80	! Mem[0000000010041410] = 41efffe0 00000000
!	%l1 = 000000000000006b, Mem[0000000010041426] = e5541976
	stb	%l1,[%i1+0x026]		! Mem[0000000010041424] = e5546b76
!	%f24 = 00000000 00000000, %l4 = ffffffffffffffff
!	Mem[00000000300c1428] = 000000ff5c06ff76
	add	%i3,0x028,%g1
	stda	%f24,[%g1+%l4]ASI_PST16_SL ! Mem[00000000300c1428] = 0000000000000000
!	%f24 = 00000000 00000000, Mem[0000000010101410] = ff0000ff 00000000
	stda	%f24,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 00000000
!	%l7 = 00000000000000ff, Mem[0000000010181410] = 0000000000000000
	stxa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000000000ff
!	%f26 = 000000ff 5c06ff76, %l7 = 00000000000000ff
!	Mem[00000000100c1430] = af520c69ffffe8de
	add	%i3,0x030,%g1
	stda	%f26,[%g1+%l7]ASI_PST32_PL ! Mem[00000000100c1430] = 76ff065cff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff000000, %f9  = 80000000
	lda	[%i6+%o4]0x80,%f9 	! %f9 = ff000000

p0_label_273:
!	Mem[0000000010141408] = ff905620 00000000, %l2 = 000000ff, %l3 = fefff181
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 00000000ff905620 0000000000000000
!	Mem[0000000010001414] = d37a8e6c, %l0 = ffffffffffffffbf
	ldsha	[%i0+0x016]%asi,%l0	! %l0 = ffffffffffff8e6c
!	Mem[0000000010141408] = ff905620, %l3 = 0000000000000000
	lduwa	[%i5+0x008]%asi,%l3	! %l3 = 00000000ff905620
!	Mem[00000000100c1420] = 00000000, %l1 = 000000000000006b
	ldsh	[%i3+0x022],%l1		! %l1 = 0000000000000000
!	Mem[0000000010141410] = ffff0000 ff2c8cff, %l0 = ffff8e6c, %l1 = 00000000
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 00000000ff2c8cff 00000000ffff0000
!	%l1 = 00000000ffff0000, imm = fffffffffffff963, %l2 = 00000000ff905620
	xnor	%l1,-0x69d,%l2		! %l2 = 00000000ffff069c
!	Mem[0000000030001400] = ff0000ff, %l6 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l4 = ffffffffffffffff
	ldswa	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 00000000 ff000000, %l0 = ff2c8cff, %l1 = ffff0000
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l5 = 2056900fa0626aff, Mem[0000000030001410] = 000005f3
	stba	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 000005ff

p0_label_274:
!	%l2 = 00000000ffff069c, Mem[0000000030081400] = 00000000
	stwa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = ffff069c
!	Mem[0000000020800000] = 00005b63, %l6 = 00000000000000ff
	ldstuba	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1410] = 6b6a62a0, %l2 = 00000000ffff069c
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 0000006b000000ff
!	%f11 = 76ffc371, Mem[0000000010101410] = 00000000
	sta	%f11,[%i4+0x010]%asi	! Mem[0000000010101410] = 76ffc371
!	%f22 = ff000000, Mem[000000001008143c] = 00000000
	sta	%f22,[%i2+0x03c]%asi	! Mem[000000001008143c] = ff000000
!	%l5 = 2056900fa0626aff, Mem[0000000010181410] = ff000000
	stba	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000
!	%l7 = 00000000000000ff, Mem[0000000010041408] = 0000000000000000
	stxa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000000000ff
!	Mem[0000000030081408] = fffeffff, %l3 = 00000000ff905620
	swapa	[%i2+%o4]0x81,%l3	! %l3 = 00000000fffeffff
!	Mem[0000000010141410] = ff8c2cff, %l1 = 00000000ff000000
	ldstuba	[%i5+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000, %l2 = 000000000000006b
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000

p0_label_275:
!	Mem[00000000300c1410] = a0626aff, %l0 = 0000000000000000
	lduwa	[%i3+%o5]0x89,%l0	! %l0 = 00000000a0626aff
!	Mem[0000000020800040] = 0000a555, %l4 = 0000000000000000
	ldsba	[%o1+0x040]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 41efffe0, %l1 = 00000000000000ff
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000041
!	Mem[00000000211c0000] = e0004b99, %l2 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffe000
!	Mem[0000000030141410] = 00000000000000ff, %f4  = ff8c2cff 7fffffff
	ldda	[%i5+%o5]0x89,%f4 	! %f4  = 00000000 000000ff
!	Mem[0000000030141400] = ff0000ff, %l2 = ffffffffffffe000
	lduwa	[%i5+%g0]0x89,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000030141400] = ff0000ff, %l4 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030141408] = ff00e03a, %l7 = 00000000000000ff
	ldsba	[%i5+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1410] = 00000000, %l7 = ffffffffffffffff
	lduw	[%i3+%o5],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 00000000, %l5 = 2056900fa0626aff
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff

p0_label_276:
!	Mem[0000000030101410] = ff000000, %l1 = 0000000000000041
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l4 = ffffffffffffff00, Mem[0000000010041400] = ff6a62a0, %asi = 80
	stha	%l4,[%i1+0x000]%asi	! Mem[0000000010041400] = ff0062a0
!	%f1  = ffffe8de, Mem[0000000030141408] = 3ae000ff
	sta	%f1 ,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffe8de
!	%l0 = a0626aff, %l1 = 000000ff, Mem[0000000030001408] = 00000000 9aea71c3
	stda	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = a0626aff 000000ff
!	%l7 = 0000000000000000, Mem[0000000030141400] = ff0000ff
	stha	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff
!	%l7 = 0000000000000000, Mem[0000000010101400] = ffffffbf
	stwa	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l0 = a0626aff, %l1 = 000000ff, Mem[0000000010041420] = b636000f e5546b76
	stda	%l0,[%i1+0x020]%asi	! Mem[0000000010041420] = a0626aff 000000ff
!	%f23 = fffffeff, Mem[0000000030001410] = ff050000
	sta	%f23,[%i0+%o5]0x81	! Mem[0000000030001410] = fffffeff
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000030081400] = ffff069c 000057ff ff905620 00ffffff
!	Mem[0000000030081410] = ff000000 ff000000 c05600f2 3fff5bb1
!	Mem[0000000030081420] = 00000000 ffff00f2 000000ff 5c06ff76
!	Mem[0000000030081430] = ff008cf2 eb0000ff 77dc5bff adf36949
	ldda	[%i2]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030081400
!	Starting 10 instruction Load Burst
!	%l1 = 00000000000000ff, imm = fffffffffffff240, %l4 = ffffffffffffff00
	addc	%l1,-0xdc0,%l4		! %l4 = fffffffffffff33f

p0_label_277:
!	Mem[0000000030141408] = ffffe8de, %l6 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l6	! %l6 = 00000000ffffe8de
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l6 = 00000000ffffe8de
	lduwa	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = ff8c2cff, %f21 = a0626a6b
	lda	[%i5+%o5]0x80,%f21	! %f21 = ff8c2cff
!	Mem[0000000030001410] = 00000000 fffeffff, %l2 = ff0000ff, %l3 = fffeffff
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 00000000fffeffff 0000000000000000
!	Mem[0000000030181408] = ff5bdc77 0000feff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i6+%o4]0x89,%l6	! %l6 = 000000000000feff 00000000ff5bdc77
!	Mem[0000000010101420] = ff2770d4, %f18 = 00000000
	ld	[%i4+0x020],%f18	! %f18 = ff2770d4
!	Mem[0000000010181408] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[000000001018140c] = adf36949, %l0 = 00000000a0626aff
	lduwa	[%i6+0x00c]%asi,%l0	! %l0 = 00000000adf36949
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030041410] = 00000000
	stba	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000

p0_label_278:
!	Mem[0000000010181400] = c30000ff, %l3 = ffffffffffffffff
	swapa	[%i6+%g0]0x80,%l3	! %l3 = 00000000c30000ff
!	%l4 = fffffffffffff33f, %l7 = 00000000ff5bdc77, %y  = 00000618
	smul	%l4,%l7,%l6		! %l6 = 000000082d693649, %y = 00000008
!	%f26 = 000000ff 5c06ff76, %l0 = 00000000adf36949
!	Mem[0000000010041410] = 41efffe000000000
	add	%i1,0x010,%g1
	stda	%f26,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010041410] = 76efff5c00000000
!	%l6 = 000000082d693649, immed = 00000945, %y  = 00000008
	umul	%l6,0x945,%l2		! %l2 = 000001a4f04432ad, %y = 000001a4
!	Mem[0000000010081408] = 81f1fffe, %l3 = 00000000c30000ff
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 0000000081f1fffe
!	%l7 = 00000000ff5bdc77, Mem[00000000100c1408] = 3f0000ff
	stha	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 3f00dc77
!	%l7 = 00000000ff5bdc77, imm = fffffffffffffe2b, %l4 = fffffffffffff33f
	orn	%l7,-0x1d5,%l4		! %l4 = 00000000ff5bddf7
!	%l4 = 00000000ff5bddf7, Mem[00000000201c0000] = ff00eaae
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = f700eaae
!	%l4 = 00000000ff5bddf7, Mem[0000000010081407] = 00000000
	stb	%l4,[%i2+0x007]		! Mem[0000000010081404] = 000000f7
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 000000ff, %l6 = 000000082d693649
	ldsba	[%i6+%o4]0x88,%l6	! %l6 = ffffffffffffffff

p0_label_279:
!	%l5 = 0000000000000000, immd = fffffffffffffde7, %l5  = 0000000000000000
	mulx	%l5,-0x219,%l5		! %l5 = 0000000000000000
!	Mem[00000000211c0000] = e0004b99, %l1 = 00000000000000ff
	ldsb	[%o2+0x001],%l1		! %l1 = 0000000000000000
!	Mem[0000000010081410] = ff000000, %l3 = 0000000081f1fffe
	ldub	[%i2+0x011],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041410] = 00000000 5cffef76, %l4 = ff5bddf7, %l5 = 00000000
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 000000005cffef76 0000000000000000
!	Mem[0000000010141408] = ff905620 00000000, %l0 = adf36949, %l1 = 00000000
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 00000000ff905620 0000000000000000
!	Mem[0000000030101400] = 00000000000000ff, %l0 = 00000000ff905620
	ldxa	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081408] = ff0000c3, %f23 = fffffeff
	lda	[%i2+%o4]0x88,%f23	! %f23 = ff0000c3
!	Mem[0000000010081400] = f7000000ff000000, %l7 = 00000000ff5bdc77
	ldxa	[%i2+%g0]0x88,%l7	! %l7 = f7000000ff000000
!	Mem[00000000300c1410] = ff6a62a0, %l1 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, %l4 = 000000005cffef76, %y  = 000001a4
	umul	%l0,%l4,%l7		! %l7 = 0000005ca2ef868a, %y = 0000005c

p0_label_280:
!	Mem[0000000010101410] = 76ffc371, %l6 = ffffffffffffffff
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 0000000076ffc371
!	%f16 = 00000000 000057ff ff2770d4 000000ff
!	%f20 = 2056900f ff8c2cff ff000000 ff0000c3
!	%f24 = 00000000 00000000 000000ff 5c06ff76
!	%f28 = ff008cf2 c30000ff 41efffe0 00000000
	stda	%f16,[%i2]ASI_BLK_S	! Block Store to 0000000030081400
!	%l0 = 00000000000000ff, Mem[0000000021800040] = 1e4307c8
	stb	%l0,[%o3+0x040]		! Mem[0000000021800040] = ff4307c8
!	Mem[0000000010101436] = d37a8e6c, %l4 = 000000005cffef76
	ldstub	[%i4+0x036],%l4		! %l4 = 0000008e000000ff
!	Mem[0000000010041408] = 00000000, %l4 = 000000000000008e
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000005ca2ef868a, Mem[0000000010101400] = 6b00000000000000
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000005ca2ef868a
!	%l0 = 00000000000000ff, Mem[00000000211c0000] = e0004b99, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff4b99
!	%l3 = 0000000000000000, Mem[0000000030141410] = 000000ff
	stwa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%f8  = f200ffff 00000000, Mem[0000000030101400] = 000000ff 00000000
	stda	%f8 ,[%i4+%g0]0x89	! Mem[0000000030101400] = f200ffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffffffff, %l3 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l3	! %l3 = ffffffffffffffff

p0_label_281:
!	Mem[0000000030041408] = 0000ffff, %l1 = 00000000000000ff
	lduba	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141400] = 000000ff, %l0 = 00000000000000ff
	lduba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000010081400] = ff000000, %l4 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = ffffffff, %l2 = 000001a4f04432ad
	lduha	[%i0+%o5]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010081400] = 000000ff000000f7, %f8  = f200ffff 00000000
	ldd	[%i2+%g0],%f8 		! %f8  = 000000ff 000000f7
!	Mem[0000000010001430] = ff5bdc77, %l7 = 0000005ca2ef868a
	ldsb	[%i0+0x030],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030001400] = ff0000ff, %f31 = 00000000
	lda	[%i0+%g0]0x89,%f31	! %f31 = ff0000ff
!	Mem[0000000030001408] = a0626aff, %l2 = 000000000000ffff
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 000000000000a062
!	Mem[0000000010101408] = 000000ff, %l7 = ffffffffffffffff
	ldswa	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f24 = 00000000 00000000, Mem[0000000010181430] = 00ff8cff eb0000ff
	stda	%f24,[%i6+0x030]%asi	! Mem[0000000010181430] = 00000000 00000000

p0_label_282:
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010081418] = 74a5f194 c0a53d9e
	stda	%l4,[%i2+0x018]%asi	! Mem[0000000010081418] = 00000000 00000000
!	Mem[00000000201c0001] = f700eaae, %l6 = 0000000076ffc371
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030181410] = ff000000 00000000
	stda	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 000000ff
!	%l7 = 00000000000000ff, Mem[0000000010081410] = 000000ff
	stha	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	%l2 = 000000000000a062, Mem[0000000030041408] = 0000ffff
	stba	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000ff62
!	%f20 = 2056900f ff8c2cff, Mem[00000000100c1408] = 77dc003f 0fbf9ea6
	std	%f20,[%i3+%o4]	! Mem[00000000100c1408] = 2056900f ff8c2cff
!	Mem[0000000010181408] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, imm = fffffffffffffb33, %l5 = 00000000000000ff
	subc	%l5,-0x4cd,%l5		! %l5 = 00000000000005cc
!	%l6 = 0000000000000000, Mem[0000000010081400] = ff000000
	stha	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000000057ff, %l5 = 00000000000005cc
	ldxa	[%i6+%g0]0x81,%l5	! %l5 = 00000000000057ff

p0_label_283:
!	Mem[0000000030141400] = ff000000, %l5 = 00000000000057ff
	ldsha	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%f6  = b15bff3f f20056c0, %f22 = ff000000 ff0000c3
	fxtod	%f6 ,%f22		! %f22 = c3d3a900 30037fea
!	Mem[0000000030081408] = d47027ff, %l4 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001400] = 80000000 00000000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000080000000
!	Mem[0000000030081400] = ff57000000000000, %f4  = 000000ff 000000ff
	ldda	[%i2+%g0]0x89,%f4 	! %f4  = ff570000 00000000
!	Mem[00000000300c1410] = ff6a62a00f905620, %f18 = ff2770d4 000000ff
	ldda	[%i3+%o5]0x81,%f18	! %f18 = ff6a62a0 0f905620
!	Mem[0000000030041400] = ff2c8cff, %l2 = 000000000000a062
	lduwa	[%i1+%g0]0x89,%l2	! %l2 = 00000000ff2c8cff
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 5cffef76, %l6 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = 000000005cffef76
!	Starting 10 instruction Store Burst
!	%f2  = ffffff00 205690ff, Mem[00000000100c1400] = 00000000 000000ff
	stda	%f2 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffff00 205690ff

p0_label_284:
!	%f4  = ff570000 00000000, Mem[0000000010101410] = ffffffff 00000000
	stda	%f4 ,[%i4+%o5]0x88	! Mem[0000000010101410] = ff570000 00000000
!	Mem[0000000030081408] = ff2770d4, %l1 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	%l7 = 0000000080000000, Mem[000000001010143c] = 48972b83
	stb	%l7,[%i4+0x03c]		! Mem[000000001010143c] = 00972b83
!	%l7 = 0000000080000000, Mem[00000000300c1400] = 000000ff
	stha	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff
!	%l3 = ffffffffffffffff, Mem[0000000010081418] = 0000000000000000
	stx	%l3,[%i2+0x018]		! Mem[0000000010081418] = ffffffffffffffff
!	Mem[0000000010141400] = 3ae00000, %l5 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 000000003ae00000
!	Mem[000000001014142d] = 00800000, %l5 = 000000003ae00000
	ldstub	[%i5+0x02d],%l5		! %l5 = 00000080000000ff
!	%l6 = 000000005cffef76, immed = 00000b77, %y  = 0000005c
	umul	%l6,0xb77,%l0		! %l0 = 0000042a3a4261da, %y = 0000042a
!	%l5 = 0000000000000080, Mem[0000000030181408] = fffe0000
	stha	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 00800000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000080
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_285:
!	Mem[0000000030001408] = ff000000ff6a62a0, %l7 = 0000000080000000
	ldxa	[%i0+%o4]0x89,%l7	! %l7 = ff000000ff6a62a0
!	Mem[00000000300c1408] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = ff0062a0 0f905620, %l6 = 5cffef76, %l7 = ff6a62a0
	ldd	[%i1+%g0],%l6		! %l6 = 00000000ff0062a0 000000000f905620
!	%f14 = 4969f3ad, %f30 = 41efffe0, %f23 = 30037fea
	fdivs	%f14,%f30,%f23		! %f23 = 46f98c96
!	Mem[0000000030081400] = 00000000, %l1 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = a2ef868a, %f2  = ffffff00
	lda	[%i4+%g0]0x88,%f2 	! %f2 = a2ef868a
!	Mem[0000000010141428] = 76ffc371, %l5 = 0000000000000000
	ldswa	[%i5+0x028]%asi,%l5	! %l5 = 0000000076ffc371
!	Starting 10 instruction Store Burst
!	%l7 = 000000000f905620, Mem[0000000030101410] = ff000000
	stwa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 0f905620

p0_label_286:
!	%l3 = ffffffffffffffff, Mem[0000000030141408] = dee8ffff
	stha	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff
!	%f9  = 000000f7, %f20 = 2056900f, %f1  = 9c06ffff
	fmuls	%f9 ,%f20,%f1 		! %f1  = 00000000
!	%l6 = ff0062a0, %l7 = 0f905620, Mem[0000000010141410] = ff8c2cff 0000ffff
	std	%l6,[%i5+%o5]		! Mem[0000000010141410] = ff0062a0 0f905620
!	Mem[00000000100c1408] = 2056900f, %l3 = ffffffffffffffff
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 000000002056900f
!	%l0 = 0000042a3a4261da, Mem[0000000030141400] = 000000ff
	stwa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 3a4261da
!	%l2 = ff2c8cff, %l3 = 2056900f, Mem[0000000030081408] = d47027ff ff000000
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = ff2c8cff 2056900f
!	Mem[0000000010081408] = ff0000c3, %l7 = 000000000f905620
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 000000c3000000ff
!	%l4 = ffffffff, %l5 = 76ffc371, Mem[0000000030001410] = fffffeff 00000000
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffff 76ffc371
!	%f14 = 4969f3ad, Mem[0000000030001410] = ffffffff
	sta	%f14,[%i0+%o5]0x89	! Mem[0000000030001410] = 4969f3ad
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 000000ff0f905620, %l1 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l1	! %l1 = 000000ff0f905620

p0_label_287:
!	Mem[0000000010101410] = 00000000, %l4 = ffffffffffffffff
	lduba	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l2 = 00000000ff2c8cff
	lduwa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800000] = 00fff55e, %l0 = 0000042a3a4261da
	lduha	[%o3+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001410] = adf36949, %l5 = 0000000076ffc371
	ldsha	[%i0+%o5]0x81,%l5	! %l5 = ffffffffffffadf3
!	Mem[0000000030181410] = 00000000, %l1 = 000000ff0f905620
	ldsba	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l4 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030081400] = ff57000000000000, %f22 = c3d3a900 46f98c96
	ldda	[%i2+%g0]0x89,%f22	! %f22 = ff570000 00000000
!	Mem[0000000010001400] = 00000000, %l4 = 00000000ff000000
	lduwa	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000218000c0] = ffff3492, %l0 = 00000000000000ff
	lduh	[%o3+0x0c0],%l0		! %l0 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l3 = 000000002056900f, Mem[00000000211c0001] = 00ff4b99, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = 000f4b99

p0_label_288:
!	%l0 = 000000000000ffff, Mem[0000000010001410] = ffffffff
	stha	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff
!	%l4 = 00000000, %l5 = ffffadf3, Mem[0000000030041400] = ff2c8cff ffff0000
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 ffffadf3
!	%l0 = 000000000000ffff, Mem[0000000030181408] = 00008000
	stba	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 000080ff
!	%l6 = 00000000ff0062a0, imm = fffffffffffff161, %l0 = 000000000000ffff
	xor	%l6,-0xe9f,%l0		! %l0 = ffffffff00ff93c1
!	%l2 = 00000000, %l3 = 2056900f, Mem[0000000010001408] = ff000000 adf36949
	stda	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 2056900f
!	Mem[00000000201c0001] = f7ffeaae, %l0 = ffffffff00ff93c1
	ldstub	[%o0+0x001],%l0		! %l0 = 000000ff000000ff
!	%l7 = 00000000000000c3, %l3 = 000000002056900f, %l0 = 00000000000000ff
	sdivx	%l7,%l3,%l0		! %l0 = 0000000000000000
!	Mem[0000000030181408] = 000080ff, %l5 = ffffffffffffadf3
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000201c0000] = f7ffeaae, %l5 = 00000000000000ff
	ldstub	[%o0+%g0],%l5		! %l5 = 000000f7000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 000f4b99, %l0 = 0000000000000000
	ldsb	[%o2+%g0],%l0		! %l0 = 0000000000000000

p0_label_289:
!	Mem[000000001008143c] = ff000000, %l5 = 00000000000000f7
	ldsh	[%i2+0x03c],%l5		! %l5 = ffffffffffffff00
!	Mem[00000000100c1424] = 000057ff, %l0 = 0000000000000000
	ldsw	[%i3+0x024],%l0		! %l0 = 00000000000057ff
!	Mem[0000000030081408] = ff8c2cff0f905620, %l4 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l4	! %l4 = ff8c2cff0f905620
	membar	#Sync			! Added by membar checker (38)
!	Mem[00000000300c1400] = 000000ff 0f905620 00000000 ffffffff
!	Mem[00000000300c1410] = ff6a62a0 0f905620 00000000 7a8eeeff
!	Mem[00000000300c1420] = 00000000 00000000 00000000 00000000
!	Mem[00000000300c1430] = ff008cf2 00000000 41efffe0 1e400000
	ldda	[%i3]ASI_BLK_AIUSL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030041410] = 00000000, %l5 = ffffffffffffff00
	lduwa	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = adf36949, %l0 = 00000000000057ff
	lduha	[%i0+%o5]0x81,%l0	! %l0 = 000000000000adf3
!	Mem[0000000030141410] = 00000000, %l3 = 000000002056900f
	lduba	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = ffffeaae, %l1 = 0000000000000000
	ldub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010141410] = ff0062a0 0f905620, %l0 = 0000adf3, %l1 = 000000ff
	ldda	[%i5+0x010]%asi,%l0	! %l0 = 00000000ff0062a0 000000000f905620
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, %l6 = 00000000ff0062a0, %l5 = 0000000000000000
	and	%l2,%l6,%l5		! %l5 = 0000000000000000

p0_label_290:
!	Mem[0000000030041400] = 00000000, %l6 = 00000000ff0062a0
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l0 = 00000000ff0062a0, Mem[0000000030001408] = ff6a62a0
	stba	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = ff6a62a0
!	%l1 = 000000000f905620, imm = 0000000000000996, %l5 = 0000000000000000
	xnor	%l1,0x996,%l5		! %l5 = fffffffff06fa049
!	%l1 = 000000000f905620, Mem[0000000010141400] = 00000000
	stba	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000020
!	Mem[0000000010041418] = 00005405, %l4 = ff8c2cff0f905620
	swap	[%i1+0x018],%l4		! %l4 = 0000000000005405
!	Mem[0000000010001410] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i0+0x010]%asi,%l3	! %l3 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (39)
!	%l2 = 00000000, %l3 = 000000ff, Mem[00000000300c1408] = 00000000 ffffffff
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 000000ff
!	%l0 = ff0062a0, %l1 = 0f905620, Mem[0000000010001430] = ff5bdc77 00003b05
	stda	%l0,[%i0+0x030]%asi	! Mem[0000000010001430] = ff0062a0 0f905620
!	%l0 = ff0062a0, %l1 = 0f905620, Mem[0000000010141408] = ff905620 00000000
	std	%l0,[%i5+%o4]		! Mem[0000000010141408] = ff0062a0 0f905620
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l7 = 00000000000000c3
	lduwa	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_291:
!	Mem[0000000010001408] = 00000000, %f11 = ff000000
	lda	[%i0+%o4]0x88,%f11	! %f11 = 00000000
!	Mem[00000000100c1410] = 00000000, %l1 = 000000000f905620
	ldsba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%l2 = 0000000000000000, imm = fffffffffffffad7, %l0 = 00000000ff0062a0
	or	%l2,-0x529,%l0		! %l0 = fffffffffffffad7
!	Mem[0000000010081400] = 000000ff, %l0 = fffffffffffffad7
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = a2ef868a, %l1 = 0000000000000000
	lduwa	[%i4+%g0]0x88,%l1	! %l1 = 00000000a2ef868a
!	%l0 = 0000000000000000, Mem[0000000030041408] = 0000ff62
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	Mem[0000000030181400] = ff57000000000000, %l1 = 00000000a2ef868a
	ldxa	[%i6+%g0]0x89,%l1	! %l1 = ff57000000000000
!	Mem[0000000030141408] = ffffffff 00ff0000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000ffffffff 0000000000ff0000
!	Mem[0000000010001400] = 8000000000000000, %l1 = 0000000000ff0000
	ldxa	[%i0+%g0]0x88,%l1	! %l1 = 8000000000000000
!	Starting 10 instruction Store Burst
!	%f1  = 00000000, Mem[00000000100c1400] = 205690ff
	sta	%f1 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000

p0_label_292:
!	%l2 = 0000000000000000, Mem[0000000030181408] = ff800000
	stba	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 00800000
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l4 = 0000000000005405, Mem[0000000010141428] = 76ffc37100ff0000
	stx	%l4,[%i5+0x028]		! Mem[0000000010141428] = 0000000000005405
!	Code Fragment 3
p0_fragment_36:
!	%l0 = 00000000ffffffff
	setx	0x483c3877df29bcd4,%g7,%l0 ! %l0 = 483c3877df29bcd4
!	%l1 = 8000000000000000
	setx	0xadee16c81fb73523,%g7,%l1 ! %l1 = adee16c81fb73523
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 483c3877df29bcd4
	setx	0x2c1476284a031bb6,%g7,%l0 ! %l0 = 2c1476284a031bb6
!	%l1 = adee16c81fb73523
	setx	0x8a5e242068e22afd,%g7,%l1 ! %l1 = 8a5e242068e22afd
!	%l5 = fffffffff06fa049, Mem[00000000300c1408] = 00000000
	stba	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000049
!	Mem[0000000010101420] = ff2770d4000000ff, %l7 = 0000000000000000, %l1 = 8a5e242068e22afd
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = ff2770d4000000ff
!	%l2 = 0000000000000000, Mem[0000000030141408] = ffffffff
	stba	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffff00
!	%f16 = 2056900f ff000000, Mem[00000000300c1408] = 00000049 ff000000
	stda	%f16,[%i3+%o4]0x89	! Mem[00000000300c1408] = 2056900f ff000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141410] = ff0062a0 0f905620
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	%l4 = 0000000000005405, Mem[0000000010141410] = 00000000
	stwa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 00005405

p0_label_293:
!	Mem[0000000030081400] = 00000000 000057ff ff8c2cff 0f905620
!	Mem[0000000030081410] = 2056900f ff8c2cff ff000000 ff0000c3
!	Mem[0000000030081420] = 00000000 00000000 000000ff 5c06ff76
!	Mem[0000000030081430] = ff008cf2 c30000ff 41efffe0 00000000
	ldda	[%i2]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Mem[0000000030041408] = 00000000a0626a6b, %f8  = 000000ff 000000f7
	ldda	[%i1+%o4]0x81,%f8 	! %f8  = 00000000 a0626a6b
!	%l4 = 0000000000005405, Mem[00000000100c1410] = 00000000000057ff
	stxa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000005405
!	Mem[0000000010041410] = 76efff5c, %l1 = ff2770d4000000ff
	lduba	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000076
!	Mem[00000000100c1400] = 00000000, %l2 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = 000f4b99, %l1 = 0000000000000076
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 000000000000000f
!	Mem[00000000300c1400] = ff000000, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = ff000000, %l1 = 000000000000000f
	ldsba	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = ff0062a0, %f15 = ff5bdc77
	lda	[%i5+%o4]0x80,%f15	! %f15 = ff0062a0
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 00000000, %l5 = fffffffff06fa049
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000

p0_label_294:
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010041400] = ff0062a0 0f905620
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 000000ff
!	%l1 = 0000000000000000, Mem[0000000010141408] = a06200ff
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = a0620000
!	%f8  = 00000000 a0626a6b, Mem[0000000030141410] = 00000000 00000000
	stda	%f8 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 a0626a6b
!	%l4 = 00005405, %l5 = 00000000, Mem[0000000010081410] = ff000000 000057ff
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00005405 00000000
!	%f5  = 00000000, Mem[0000000030041408] = 00000000
	sta	%f5 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010081400] = ff000000 f7000000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 00000000
!	Mem[0000000030081400] = 00000000, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l5 = 0000000000000000
	swap	[%i4+%o4],%l5		! %l5 = 00000000ff000000
!	%l1 = 0000000000000000, Mem[0000000010041400] = 00000000
	sth	%l1,[%i1+%g0]		! Mem[0000000010041400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000000000ff, %f8  = 00000000 a0626a6b
	ldda	[%i4+%o4]0x89,%f8 	! %f8  = 00000000 000000ff

p0_label_295:
!	Mem[0000000010141400] = 20000000, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 0000000020000000
!	Mem[0000000010141400] = 00000000, %l0 = 2c1476284a031bb6
	lduh	[%i5+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010101400] = a2ef868a, %l2 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l2	! %l2 = ffffffffa2ef868a
!	Mem[00000000300c1400] = ff000000, %l6 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181430] = 0000000000000000, %l2 = ffffffffa2ef868a
	ldx	[%i6+0x030],%l2		! %l2 = 0000000000000000
!	%f0  = ff570000, %f12 = ff0000eb, %f5  = 00000000
	fsubs	%f0 ,%f12,%f5 		! %f5  = feadfe2a
!	Mem[00000000100c1410] = 00000000, %f8  = 00000000
	lda	[%i3+%o5]0x80,%f8 	! %f8 = 00000000
!	Mem[00000000100c1400] = 00000000, %f6  = b15bff3f
	lda	[%i3+%g0]0x88,%f6 	! %f6 = 00000000
!	Mem[00000000100c1438] = 00000000 000000ff, %l2 = 00000000, %l3 = 000000ff
	ldd	[%i3+0x038],%l2		! %l2 = 0000000000000000 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ff000000, Mem[00000000300c1400] = ff000000
	stba	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff000000

p0_label_296:
!	Mem[00000000100c1408] = ffffffff, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000030101408] = ff000000, %l5 = 00000000ff000000
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010001412] = ffffffff
	sth	%l3,[%i0+0x012]		! Mem[0000000010001410] = ffff00ff
!	Mem[0000000021800101] = eaff7eb5, %l5 = 00000000000000ff
	ldstub	[%o3+0x101],%l5		! %l5 = 000000ff000000ff
!	%f16 = 00000000 000057ff, %l7 = 0000000000000000
!	Mem[0000000030101410] = 0f90562000000000
	add	%i4,0x010,%g1
	stda	%f16,[%g1+%l7]ASI_PST16_S ! Mem[0000000030101410] = 0f90562000000000
!	%f8  = 00000000, Mem[0000000010101438] = 37bbffbf
	sta	%f8 ,[%i4+0x038]%asi	! Mem[0000000010101438] = 00000000
!	Mem[0000000010081400] = 00000000, %l2 = 00000000ffffffff
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l1 = 0000000020000000
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%f16 = 00000000 000057ff ff8c2cff 0f905620
!	%f20 = 2056900f ff8c2cff ff000000 ff0000c3
!	%f24 = 00000000 00000000 000000ff 5c06ff76
!	%f28 = ff008cf2 c30000ff 41efffe0 00000000
	stda	%f16,[%i6]ASI_BLK_P	! Block Store to 0000000010181400
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_297:
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000000
	ldub	[%i3+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000020800000] = ff005b63, %l3 = 0000000000000000
	lduba	[%o1+0x000]%asi,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000010181438] = 41efffe0, %l7 = 0000000000000000
	ldswa	[%i6+0x038]%asi,%l7	! %l7 = 0000000041efffe0
!	Mem[0000000010081410] = 00005405, %l5 = 00000000000000ff
	lduha	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = 00008000, %l1 = 0000000000000000
	ldswa	[%i6+%o4]0x89,%l1	! %l1 = 0000000000008000
!	Mem[0000000030181408] = 00008000, %l7 = 0000000041efffe0
	lduba	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041414] = 00000000, %l6 = 0000000000000000
	ldsb	[%i1+0x017],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041408] = 00000000a0626a6b, %l0 = 0000000000000000
	ldxa	[%i1+%o4]0x81,%l0	! %l0 = 00000000a0626a6b
!	Mem[0000000010041400] = 00000000, %f23 = ff0000c3
	ld	[%i1+%g0],%f23	! %f23 = 00000000
!	Starting 10 instruction Store Burst
!	%f28 = ff008cf2 c30000ff, Mem[0000000030001408] = ff6a62a0 ff000000
	stda	%f28,[%i0+%o4]0x89	! Mem[0000000030001408] = ff008cf2 c30000ff

p0_label_298:
!	Mem[0000000010141408] = a0620000, %l1 = 0000000000008000
	lduwa	[%i5+%o4]0x88,%l1	! %l1 = 00000000a0620000
!	Mem[0000000010141400] = 00000000, %l4 = 0000000000005405
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010001408] = f06fa049
	stba	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 006fa049
!	%l4 = 0000000000000000, Mem[0000000010141408] = 000062a00f905620
	stxa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010141408] = 00000000
	stha	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l7 = 0000000000000000, Mem[0000000010141410] = 0000000005540000
	stxa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000020800000] = ff005b63, %asi = 80
	stha	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 00005b63
!	%l2 = 0000000000000000, Mem[0000000030001408] = ff0000c3f28c00ff
	stxa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010101400] = 8a86efa25c000000
	stxa	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = 00fff55e, %l6 = 0000000000000000
	ldub	[%o3+0x001],%l6		! %l6 = 00000000000000ff

p0_label_299:
!	Mem[0000000010101410] = 00000000 000057ff, %l0 = a0626a6b, %l1 = a0620000
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000000057ff
!	%l0 = 0000000000000000, %l3 = 00000000000000ff, %l7 = 0000000000000000
	xor	%l0,%l3,%l7		! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l1 = 00000000000057ff
	lduba	[%i3+0x009]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = 006fa049, %f21 = ff8c2cff
	ld	[%i0+%o4],%f21	! %f21 = 006fa049
!	Mem[00000000100c1428] = 107c3fd9, %l2 = 0000000000000000
	ldsh	[%i3+0x02a],%l2		! %l2 = 0000000000003fd9
!	%f30 = 41efffe0, %f25 = 00000000, %f2  = a2ef868a 205690ff
	fsmuld	%f30,%f25,%f2 		! %f2  = 00000000 00000000
!	Mem[0000000030181408] = 00008000, %l1 = 0000000000000000
	ldswa	[%i6+%o4]0x89,%l1	! %l1 = 0000000000008000
!	Mem[000000001010141c] = ff0000ff, %l3 = 00000000000000ff
	lduw	[%i4+0x01c],%l3		! %l3 = 00000000ff0000ff
!	Mem[0000000010181410] = 2056900f, %l3 = 00000000ff0000ff
	ldswa	[%i6+%o5]0x80,%l3	! %l3 = 000000002056900f
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030141410] = 6b6a62a000000000
	stxa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000

p0_label_300:
!	%l5 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stha	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	Mem[0000000030001410] = adf36949, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 000000ad000000ff
!	Mem[0000000030041400] = ff0062a0, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 00000000ff0062a0
!	Mem[0000000010141434] = ffffff00, %l3 = 000000002056900f, %asi = 80
	swapa	[%i5+0x034]%asi,%l3	! %l3 = 00000000ffffff00
!	%l7 = 00000000000000ff, Mem[00000000211c0000] = 000f4b99
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 00ff4b99
!	%f8  = 00000000, %f12 = ff0000eb, %f23 = 00000000
	fdivs	%f8 ,%f12,%f23		! %f23 = 80000000
!	%f12 = ff0000eb f28c00ff, %l5 = 00000000ff0062a0
!	Mem[0000000010181410] = 2056900fff8c2cff
	add	%i6,0x010,%g1
	stda	%f12,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010181410] = 2056900fff8c2cff
!	%f16 = 00000000, Mem[00000000100c1404] = 00ffffff
	st	%f16,[%i3+0x004]	! Mem[00000000100c1404] = 00000000
!	%f30 = 41efffe0, Mem[0000000010081408] = ff0000ff
	sta	%f30,[%i2+0x008]%asi	! Mem[0000000010081408] = 41efffe0
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = fff36949, %l1 = 0000000000008000
	ldsba	[%i0+%o5]0x81,%l1	! %l1 = ffffffffffffffff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	ldda	[%i3+0x018]%asi,%l2
	stha	%l2,[%i5+0x00c]%asi
	udiv	%l7,0x20b,%l4
	fsubs	%f3,%f19,%f22
	stda	%l6,[%i0+0x030]%asi
	or	%l1,%l4,%l3
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
	cmp	%l1,%g2			! %l1 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000003fd9
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000ffffff00
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000000000ad
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000ff0062a0
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

	set	0x0000042a,%g2
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
	cmp	%l0,%l1			! %f0  should be ff570000 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ff570000 feadfe2a
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 f20056c0
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 000000ff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 76ff065c 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be ff0000eb f28c00ff
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 4969f3ad ff0062a0
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 000057ff
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ff8c2cff 0f905620
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 2056900f 006fa049
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ff000000 80000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 00000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 000000ff 5c06ff76
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ff008cf2 c30000ff
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 41efffe0 00000000
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
	or	%l5,%l0,%l4
	subc	%l4,%l6,%l6
	fmuls	%f5 ,%f5 ,%f10
	fsubs	%f13,%f9 ,%f14
	fmuls	%f15,%f1 ,%f8 
	fdivs	%f9 ,%f8 ,%f15
	fsubs	%f6 ,%f0 ,%f11
	done

p0_trap1o:
	or	%l5,%l0,%l4
	subc	%l4,%l6,%l6
	fmuls	%f5 ,%f5 ,%f10
	fsubs	%f13,%f9 ,%f14
	fmuls	%f15,%f1 ,%f8 
	fdivs	%f9 ,%f8 ,%f15
	fsubs	%f6 ,%f0 ,%f11
	done


p0_trap2e:
	ldda	[%i4+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010101400]
	sub	%l4,-0x778,%l0
	fcmps	%fcc3,%f1 ,%f0 
	fmuls	%f13,%f1 ,%f0 
	xnor	%l1,%l5,%l3
	orn	%l4,%l0,%l6
	done

p0_trap2o:
	ldda	[%o4+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010101400]
	sub	%l4,-0x778,%l0
	fcmps	%fcc3,%f1 ,%f0 
	fmuls	%f13,%f1 ,%f0 
	xnor	%l1,%l5,%l3
	orn	%l4,%l0,%l6
	done


p0_trap3e:
	sub	%l3,-0x08c,%l5
	and	%l0,-0xb66,%l3
	done

p0_trap3o:
	sub	%l3,-0x08c,%l5
	and	%l0,-0xb66,%l3
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
	ldx	[%g1+0x000],%l0		! %l0 = 95c30eebd0b000e6
	ldx	[%g1+0x008],%l1		! %l1 = 53e1c9f7f5a9ff7c
	ldx	[%g1+0x010],%l2		! %l2 = d308f4101dfdfa3a
	ldx	[%g1+0x018],%l3		! %l3 = 83c8391a06dc575c
	ldx	[%g1+0x020],%l4		! %l4 = 6bad4728a8e2e78e
	ldx	[%g1+0x028],%l5		! %l5 = 3201198adfa0ac4f
	ldx	[%g1+0x030],%l6		! %l6 = 02704c8e479f27b5
	ldx	[%g1+0x038],%l7		! %l7 = 876085d29f2a1214

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
	or	%l5,%l0,%l4
	fcmps	%fcc1,%f6 ,%f14
	fmuls	%f7 ,%f11,%f5 
	orn	%l4,-0x8eb,%l5
	subc	%l0,0xbb9,%l5
	fsubs	%f0 ,%f11,%f15
	jmpl	%o7,%g0
	fmuls	%f8 ,%f6 ,%f0 
p0_near_0_he:
	fmuls	%f24,%f16,%f26
	sub	%l0,-0x426,%l4
	jmpl	%o7,%g0
	xor	%l6,-0xc3e,%l3
near0_b2b_h:
	umul	%l3,0xd71,%l0
	sub	%l3,%l5,%l2
	fdivs	%f20,%f25,%f28
	fdivs	%f25,%f19,%f17
	mulx	%l6,%l2,%l2
	fcmps	%fcc2,%f30,%f21
	jmpl	%o7,%g0
	addc	%l0,0x4ff,%l5
near0_b2b_l:
	udivx	%l4,%l0,%l4
	fmuls	%f13,%f3 ,%f6 
	mulx	%l5,0x67f,%l7
	smul	%l1,-0x3aa,%l7
	andn	%l1,0xa9e,%l7
	fmuls	%f9 ,%f3 ,%f2 
	jmpl	%o7,%g0
	umul	%l4,%l5,%l3
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	add	%l2,0x952,%l5
	mulx	%l3,0x678,%l7
	fadds	%f6 ,%f11,%f1 
	fstoi	%f10,%f13
	xnor	%l1,0x2d4,%l7
	smul	%l6,%l6,%l5
	jmpl	%o7,%g0
	fcmps	%fcc2,%f0 ,%f5 
p0_near_1_he:
	fcmps	%fcc0,%f25,%f21
	addc	%l1,%l1,%l3
	orn	%l6,%l2,%l3
	subc	%l5,%l6,%l2
	jmpl	%o7,%g0
	fmuls	%f17,%f27,%f17
near1_b2b_h:
	addc	%l1,%l6,%l0
	sub	%l0,-0x871,%l4
	udivx	%l4,-0x05a,%l4
	jmpl	%o7,%g0
	fadds	%f27,%f27,%f27
near1_b2b_l:
	fadds	%f6 ,%f5 ,%f13
	fsubs	%f1 ,%f10,%f2 
	mulx	%l4,0x8ff,%l6
	jmpl	%o7,%g0
	fadds	%f13,%f1 ,%f11
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	xnor	%l5,%l2,%l7
	umul	%l3,%l5,%l3
	xor	%l5,%l5,%l2
	sdivx	%l1,%l6,%l5
	jmpl	%o7,%g0
	addc	%l7,0xf4e,%l2
p0_near_2_he:
	subc	%l0,0xd76,%l3
	and	%l7,-0xeb1,%l0
	swap	[%i5+0x004],%l1		! Mem[0000000010141404]
	umul	%l0,%l7,%l5
	smul	%l2,%l5,%l6
	swap	[%i0+0x000],%l5		! Mem[0000000010001400]
	umul	%l6,%l6,%l7
	jmpl	%o7,%g0
	sub	%l3,-0x0e8,%l2
near2_b2b_h:
	fdivs	%f27,%f30,%f18
	and	%l3,-0xc58,%l5
	sub	%l7,%l5,%l0
	jmpl	%o7,%g0
	fcmps	%fcc0,%f19,%f21
near2_b2b_l:
	andn	%l0,-0xdc3,%l5
	umul	%l5,-0x6c4,%l3
	mulx	%l3,0x398,%l6
	jmpl	%o7,%g0
	fsubs	%f4 ,%f12,%f14
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	smul	%l4,%l4,%l1
	fsubs	%f15,%f1 ,%f15
	subc	%l2,0x6e2,%l7
	fdtos	%f8 ,%f6 
	and	%l7,0x952,%l2
	jmpl	%o7,%g0
	fdivs	%f15,%f4 ,%f0 
p0_near_3_he:
	add	%l2,%l5,%l3
	lduw	[%i5+0x00c],%l1		! Mem[000000001014140c]
	udivx	%l1,-0x87d,%l5
	jmpl	%o7,%g0
	or	%l6,0x57e,%l2
near3_b2b_h:
	sdivx	%l4,%l6,%l0
	fsubs	%f29,%f19,%f20
	umul	%l7,%l1,%l7
	fadds	%f18,%f17,%f28
	mulx	%l5,0xb4a,%l0
	mulx	%l7,%l2,%l1
	jmpl	%o7,%g0
	fitod	%f25,%f20
near3_b2b_l:
	and	%l6,-0x5ed,%l5
	andn	%l4,%l2,%l3
	fmuls	%f10,%f2 ,%f12
	umul	%l2,-0xd5a,%l3
	xnor	%l5,%l1,%l0
	fadds	%f0 ,%f1 ,%f8 
	jmpl	%o7,%g0
	umul	%l2,%l7,%l4
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	mulx	%l0,%l5,%l7
	orn	%l3,0x8db,%l4
	or	%l2,%l4,%l0
	ldd	[%i4+0x000],%l0		! Mem[0000000010101400]
	sdivx	%l5,-0x7b1,%l7
	jmpl	%o7,%g0
	addc	%l0,-0x50c,%l4
p0_far_0_lem:
	mulx	%l0,%l5,%l7
	orn	%l3,0x8db,%l4
	or	%l2,%l4,%l0
	membar	#Sync
	ldd	[%i4+0x000],%l0		! Mem[0000000010101400]
	sdivx	%l5,-0x7b1,%l7
	jmpl	%o7,%g0
	addc	%l0,-0x50c,%l4
p0_far_0_he:
	subc	%l0,%l6,%l6
	jmpl	%o7,%g0
	andn	%l5,-0x86a,%l7
p0_far_0_hem:
	subc	%l0,%l6,%l6
	jmpl	%o7,%g0
	andn	%l5,-0x86a,%l7
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	subc	%l7,-0x7c2,%l5
	xor	%l6,%l1,%l1
	udivx	%l3,%l5,%l3
	add	%l2,0x822,%l5
	jmpl	%o7,%g0
	orn	%l3,%l3,%l6
far0_b2b_l:
	mulx	%l0,%l7,%l4
	xor	%l7,%l5,%l7
	sub	%l5,%l5,%l5
	xor	%l2,%l4,%l1
	jmpl	%o7,%g0
	sdivx	%l1,%l4,%l5
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	or	%l0,0xaef,%l2
	sub	%l6,%l4,%l6
	mulx	%l3,-0xbcb,%l3
	xor	%l3,0x647,%l1
	umul	%l3,%l5,%l4
	fdivs	%f1 ,%f7 ,%f5 
	jmpl	%o7,%g0
	xor	%l5,%l3,%l7
p0_far_1_lem:
	or	%l0,0xaef,%l2
	sub	%l6,%l4,%l6
	mulx	%l3,-0xbcb,%l3
	xor	%l3,0x647,%l1
	umul	%l3,%l5,%l4
	fdivs	%f1 ,%f7 ,%f5 
	jmpl	%o7,%g0
	xor	%l5,%l3,%l7
p0_far_1_he:
	ldx	[%i2+0x000],%l0		! Mem[0000000010081400]
	jmpl	%o7,%g0
	orn	%l3,%l1,%l5
p0_far_1_hem:
	membar	#Sync
	ldx	[%i2+0x000],%l0		! Mem[0000000010081400]
	jmpl	%o7,%g0
	orn	%l3,%l1,%l5
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	add	%l5,%l7,%l2
	sub	%l2,0x198,%l6
	jmpl	%o7,%g0
	xnor	%l4,-0x7a0,%l0
far1_b2b_l:
	xnor	%l6,%l4,%l4
	andn	%l6,%l1,%l0
	jmpl	%o7,%g0
	sub	%l4,-0x775,%l2
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	st	%f0 ,[%i3+0x03c]	! Mem[00000000100c143c]
	fadds	%f15,%f5 ,%f7 
	jmpl	%o7,%g0
	fsubs	%f6 ,%f3 ,%f10
p0_far_2_lem:
	membar	#Sync
	st	%f0 ,[%i3+0x03c]	! Mem[00000000100c143c]
	fadds	%f15,%f5 ,%f7 
	jmpl	%o7,%g0
	fsubs	%f6 ,%f3 ,%f10
p0_far_2_he:
	subc	%l3,%l3,%l7
	mulx	%l3,%l7,%l1
	andn	%l5,-0xc2f,%l4
	umul	%l1,%l3,%l3
	umul	%l1,0x2d0,%l6
	fmuls	%f23,%f20,%f20
	sub	%l3,0x300,%l6
	jmpl	%o7,%g0
	fstoi	%f27,%f31
p0_far_2_hem:
	subc	%l3,%l3,%l7
	mulx	%l3,%l7,%l1
	andn	%l5,-0xc2f,%l4
	umul	%l1,%l3,%l3
	umul	%l1,0x2d0,%l6
	fmuls	%f23,%f20,%f20
	sub	%l3,0x300,%l6
	jmpl	%o7,%g0
	fstoi	%f27,%f31
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fmuls	%f28,%f21,%f24
	andn	%l4,-0xd86,%l0
	fadds	%f23,%f24,%f26
	jmpl	%o7,%g0
	xnor	%l5,0xfd5,%l5
far2_b2b_l:
	xor	%l4,%l2,%l6
	fsqrts	%f10,%f4 
	and	%l5,0x31b,%l4
	jmpl	%o7,%g0
	add	%l0,%l5,%l6
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	fitos	%f15,%f7 
	add	%l4,0xb91,%l4
	smul	%l6,0x4ed,%l4
	subc	%l4,-0x30a,%l0
	fsubs	%f13,%f4 ,%f14
	fcmps	%fcc1,%f15,%f8 
	sub	%l6,%l1,%l3
	jmpl	%o7,%g0
	umul	%l4,%l5,%l0
p0_far_3_lem:
	fitos	%f15,%f7 
	add	%l4,0xb91,%l4
	smul	%l6,0x4ed,%l4
	subc	%l4,-0x30a,%l0
	fsubs	%f13,%f4 ,%f14
	fcmps	%fcc1,%f15,%f8 
	sub	%l6,%l1,%l3
	jmpl	%o7,%g0
	umul	%l4,%l5,%l0
p0_far_3_he:
	udivx	%l0,%l3,%l3
	sdivx	%l3,%l5,%l4
	and	%l4,-0x4c5,%l3
	fmuls	%f16,%f20,%f17
	fsubs	%f31,%f24,%f25
	umul	%l2,%l3,%l3
	add	%l7,-0xa0c,%l1
	jmpl	%o7,%g0
	orn	%l4,0x474,%l1
p0_far_3_hem:
	udivx	%l0,%l3,%l3
	sdivx	%l3,%l5,%l4
	and	%l4,-0x4c5,%l3
	fmuls	%f16,%f20,%f17
	fsubs	%f31,%f24,%f25
	umul	%l2,%l3,%l3
	add	%l7,-0xa0c,%l1
	jmpl	%o7,%g0
	orn	%l4,0x474,%l1
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	sub	%l7,%l1,%l6
	fadds	%f16,%f20,%f24
	andn	%l7,-0xc6a,%l6
	jmpl	%o7,%g0
	fsubs	%f21,%f26,%f18
far3_b2b_l:
	xor	%l2,%l4,%l7
	mulx	%l4,%l5,%l3
	and	%l6,%l2,%l4
	jmpl	%o7,%g0
	orn	%l3,0x010,%l2
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	mulx	%l4,0xeac,%l5
	fmuls	%f10,%f13,%f10
	sdivx	%l6,-0xedb,%l6
	fadds	%f7 ,%f11,%f5 
	subc	%l5,%l2,%l5
	smul	%l5,0x0ee,%l1
	jmpl	%g6+8,%g0
	umul	%l3,0x1cc,%l7
p0_call_0_le:
	smul	%l0,%l2,%l2
	fcmps	%fcc1,%f0 ,%f10
	lduw	[%i6+0x038],%l1		! Mem[0000000010181438]
	retl
	or	%l6,%l2,%l3
p0_jmpl_0_lo:
	mulx	%l4,0xeac,%l5
	fmuls	%f10,%f13,%f10
	sdivx	%l6,-0xedb,%l6
	fadds	%f7 ,%f11,%f5 
	subc	%l5,%l2,%l5
	smul	%l5,0x0ee,%l1
	jmpl	%g6+8,%g0
	umul	%l3,0x1cc,%l7
p0_call_0_lo:
	smul	%l0,%l2,%l2
	fcmps	%fcc1,%f0 ,%f10
	lduw	[%o6+0x038],%l1		! Mem[0000000010181438]
	retl
	or	%l6,%l2,%l3
p0_jmpl_0_he:
	fadds	%f21,%f18,%f27
	or	%l0,-0x93c,%l0
	sdivx	%l1,-0x23d,%l0
	addc	%l0,0x988,%l7
	smul	%l5,%l6,%l3
	fdivs	%f30,%f16,%f29
	jmpl	%g6+8,%g0
	subc	%l5,-0x0e1,%l7
p0_call_0_he:
	andn	%l4,%l6,%l0
	fsqrts	%f30,%f22
	mulx	%l3,%l7,%l5
	umul	%l5,-0x5da,%l0
	sdivx	%l0,%l2,%l6
	andn	%l1,%l1,%l5
	retl
	andn	%l4,-0xb0d,%l5
p0_jmpl_0_ho:
	fadds	%f21,%f18,%f27
	or	%l0,-0x93c,%l0
	sdivx	%l1,-0x23d,%l0
	addc	%l0,0x988,%l7
	smul	%l5,%l6,%l3
	fdivs	%f30,%f16,%f29
	jmpl	%g6+8,%g0
	subc	%l5,-0x0e1,%l7
p0_call_0_ho:
	andn	%l4,%l6,%l0
	fsqrts	%f30,%f22
	mulx	%l3,%l7,%l5
	umul	%l5,-0x5da,%l0
	sdivx	%l0,%l2,%l6
	andn	%l1,%l1,%l5
	retl
	andn	%l4,-0xb0d,%l5
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	orn	%l6,-0xd5b,%l0
	fdivs	%f8 ,%f3 ,%f9 
	sdivx	%l3,0xa6c,%l5
	sdivx	%l4,-0xd28,%l5
	ldd	[%i5+0x028],%l4		! Mem[0000000010141428]
	jmpl	%g6+8,%g0
	add	%l2,%l0,%l7
p0_call_1_le:
	andn	%l1,0x09e,%l5
	retl
	smul	%l0,-0x2fa,%l2
p0_jmpl_1_lo:
	orn	%l6,-0xd5b,%l0
	fdivs	%f8 ,%f3 ,%f9 
	sdivx	%l3,0xa6c,%l5
	sdivx	%l4,-0xd28,%l5
	ldd	[%o5+0x028],%l4		! Mem[0000000010141428]
	jmpl	%g6+8,%g0
	add	%l2,%l0,%l7
p0_call_1_lo:
	andn	%l1,0x09e,%l5
	retl
	smul	%l0,-0x2fa,%l2
p0_jmpl_1_he:
	fsubs	%f20,%f16,%f17
	jmpl	%g6+8,%g0
	fsubs	%f20,%f23,%f31
p0_call_1_he:
	umul	%l6,%l1,%l6
	or	%l5,-0x8ee,%l6
	umul	%l6,%l4,%l3
	sth	%l1,[%i1+0x012]		! Mem[0000000010041412]
	and	%l2,-0xa4c,%l2
	sub	%l3,-0xdef,%l5
	and	%l0,%l0,%l5
	retl
	mulx	%l5,-0xea4,%l6
p0_jmpl_1_ho:
	fsubs	%f20,%f16,%f17
	jmpl	%g6+8,%g0
	fsubs	%f20,%f23,%f31
p0_call_1_ho:
	umul	%l6,%l1,%l6
	or	%l5,-0x8ee,%l6
	umul	%l6,%l4,%l3
	sth	%l1,[%o1+0x012]		! Mem[0000000010041412]
	and	%l2,-0xa4c,%l2
	sub	%l3,-0xdef,%l5
	and	%l0,%l0,%l5
	retl
	mulx	%l5,-0xea4,%l6
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	lduh	[%i4+0x030],%l3		! Mem[0000000010101430]
	addc	%l6,%l1,%l2
	jmpl	%g6+8,%g0
	fcmps	%fcc0,%f11,%f5 
p0_call_2_le:
	fcmps	%fcc3,%f8 ,%f12
	mulx	%l4,%l5,%l6
	smul	%l5,%l2,%l3
	fdivs	%f14,%f13,%f1 
	and	%l1,%l7,%l4
	retl
	andn	%l2,-0x2b1,%l7
p0_jmpl_2_lo:
	lduh	[%o4+0x030],%l3		! Mem[0000000010101430]
	addc	%l6,%l1,%l2
	jmpl	%g6+8,%g0
	fcmps	%fcc0,%f11,%f5 
p0_call_2_lo:
	fcmps	%fcc3,%f8 ,%f12
	mulx	%l4,%l5,%l6
	smul	%l5,%l2,%l3
	fdivs	%f14,%f13,%f1 
	and	%l1,%l7,%l4
	retl
	andn	%l2,-0x2b1,%l7
p0_jmpl_2_he:
	fdivs	%f18,%f20,%f25
	jmpl	%g6+8,%g0
	fadds	%f29,%f23,%f18
p0_call_2_he:
	mulx	%l6,%l6,%l5
	fmuls	%f17,%f24,%f30
	retl
	fcmps	%fcc0,%f25,%f23
p0_jmpl_2_ho:
	fdivs	%f18,%f20,%f25
	jmpl	%g6+8,%g0
	fadds	%f29,%f23,%f18
p0_call_2_ho:
	mulx	%l6,%l6,%l5
	fmuls	%f17,%f24,%f30
	retl
	fcmps	%fcc0,%f25,%f23
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	xnor	%l3,%l7,%l4
	fdtos	%f12,%f2 
	subc	%l1,%l1,%l6
	xnor	%l6,-0x6f1,%l6
	subc	%l0,-0x89e,%l4
	smul	%l0,-0x2ff,%l5
	jmpl	%g6+8,%g0
	udivx	%l4,%l6,%l1
p0_call_3_le:
	fdivs	%f2 ,%f2 ,%f11
	retl
	fdivs	%f1 ,%f1 ,%f9 
p0_jmpl_3_lo:
	xnor	%l3,%l7,%l4
	fdtos	%f12,%f2 
	subc	%l1,%l1,%l6
	xnor	%l6,-0x6f1,%l6
	subc	%l0,-0x89e,%l4
	smul	%l0,-0x2ff,%l5
	jmpl	%g6+8,%g0
	udivx	%l4,%l6,%l1
p0_call_3_lo:
	fdivs	%f2 ,%f2 ,%f11
	retl
	fdivs	%f1 ,%f1 ,%f9 
p0_jmpl_3_he:
	jmpl	%g6+8,%g0
	xnor	%l2,%l3,%l3
p0_call_3_he:
	udivx	%l3,-0x9ea,%l0
	fadds	%f20,%f23,%f19
	addc	%l4,%l1,%l0
	fsqrts	%f27,%f17
	xor	%l6,-0xccd,%l6
	sub	%l1,-0x2a2,%l6
	retl
	sub	%l3,0x7e0,%l6
p0_jmpl_3_ho:
	jmpl	%g6+8,%g0
	xnor	%l2,%l3,%l3
p0_call_3_ho:
	udivx	%l3,-0x9ea,%l0
	fadds	%f20,%f23,%f19
	addc	%l4,%l1,%l0
	fsqrts	%f27,%f17
	xor	%l6,-0xccd,%l6
	sub	%l1,-0x2a2,%l6
	retl
	sub	%l3,0x7e0,%l6
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
	.word	0x95c30eeb,0xd0b000e6		! Init value for %l0
	.word	0x53e1c9f7,0xf5a9ff7c		! Init value for %l1
	.word	0xd308f410,0x1dfdfa3a		! Init value for %l2
	.word	0x83c8391a,0x06dc575c		! Init value for %l3
	.word	0x6bad4728,0xa8e2e78e		! Init value for %l4
	.word	0x3201198a,0xdfa0ac4f		! Init value for %l5
	.word	0x02704c8e,0x479f27b5		! Init value for %l6
	.word	0x876085d2,0x9f2a1214		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x38b51efc,0xa83b2d1f		! Init value for %f0 
	.word	0xbf56dced,0x78e1c136		! Init value for %f2 
	.word	0x8d1f3bd4,0x4fcb9bc3		! Init value for %f4 
	.word	0xfd1391e4,0xdfd9ce76		! Init value for %f6 
	.word	0x28326b59,0x76a2a117		! Init value for %f8 
	.word	0x3301a2ab,0x768c1512		! Init value for %f10
	.word	0x32b001c0,0x5aadd6fd		! Init value for %f12
	.word	0x4fd79745,0x6ffa1d62		! Init value for %f14
	.word	0xe79d7db9,0xbdd3ee12		! Init value for %f16
	.word	0xbff47cb4,0x54d907a8		! Init value for %f18
	.word	0x70d12ea4,0xd39ca6e3		! Init value for %f20
	.word	0x57e6b81a,0x221ada99		! Init value for %f22
	.word	0x4d3cc2da,0x617ebc64		! Init value for %f24
	.word	0xbe342c94,0x593d4611		! Init value for %f26
	.word	0xda573830,0x269650fe		! Init value for %f28
	.word	0xc86246bf,0xb9e10c97		! Init value for %f30
	.word	0x8d913ce2,0x5818bb3f		! Init value for %f32
	.word	0x3f240e52,0xfbb0f85e		! Init value for %f34
	.word	0xc417e972,0x2e33b61f		! Init value for %f36
	.word	0xca807afb,0xccdd005f		! Init value for %f38
	.word	0x7f3ecc49,0x7c8f651b		! Init value for %f40
	.word	0x4b25ea3a,0xabcf8a71		! Init value for %f42
	.word	0x69b8ed9a,0x265dcce0		! Init value for %f44
	.word	0xf493eaf0,0x1e3a3452		! Init value for %f46
	.word	0xd11c16c0,0xade0e7c9
	.word	0xa3d227d8,0x597b0469
	.word	0x5112138a,0x3eb0a717
	.word	0xcdd84740,0x1d1a3c7b
	.word	0xee07121a,0x2d1b2726
	.word	0x697310e2,0x99f2bbff
	.word	0x6dd04887,0x336767d6
	.word	0x2c95f936,0xc2e5fb6a
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
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x00003fd9
	.word	0x00000000,0xffffff00
	.word	0x00000000,0x000000ad
	.word	0x00000000,0xff0062a0
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
p0_expected_fp_regs:
	.word	0xff570000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xff570000,0xfeadfe2a
	.word	0x00000000,0xf20056c0
	.word	0x00000000,0x000000ff
	.word	0x76ff065c,0x00000000
	.word	0xff0000eb,0xf28c00ff
	.word	0x4969f3ad,0xff0062a0
	.word	0x00000000,0x000057ff
	.word	0xff8c2cff,0x0f905620
	.word	0x2056900f,0x006fa049
	.word	0xff000000,0x80000000
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x5c06ff76
	.word	0xff008cf2,0xc30000ff
	.word	0x41efffe0,0x00000000
	.word	0x00000037,0x00000400		! %fsr = 0000003700000400
p0_local0_expect:
	.word	0x00000000,0x00000080
	.word	0x006fa049,0x2056900f
	.word	0xffff00ff,0xd37a8e6c
	.word	0x000000ff,0x0dae0000
	.word	0x00003300,0x000000ff
	.word	0xadf36949,0x0000ffff
	.word	0xff0062a0,0x0f905620
	.word	0x00000000,0x00000000
p0_local0_sec_expect:
	.word	0xff0000ff,0xff000000
	.word	0x00000000,0x00000000
	.word	0xfff36949,0x76ffc371
	.word	0x38b51efc,0x6e840000
	.word	0x0db79c36,0x36000000
	.word	0x5405617e,0xff0000ff
	.word	0xb62c8ce5,0x00000071
	.word	0x77dc5bff,0xadf36949
p0_local1_expect:
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x000000ff
	.word	0x76efff5c,0x00000000
	.word	0x0f905620,0x8bf2c6ff
	.word	0xa0626aff,0x000000ff
	.word	0x6b6a62a0,0xff0000eb
	.word	0xffff00ff,0xadf36949
	.word	0x00e100be,0x0000003f
p0_local1_sec_expect:
	.word	0x00000000,0xf3adffff
	.word	0x00000000,0xa0626a6b
	.word	0x00000000,0x429c26ff
	.word	0xc056b74d,0x3fd45bb1
	.word	0xff2c00e5,0xff030354
	.word	0xa69ebf0f,0x00000000
	.word	0x00000078,0x5aad3c10
	.word	0xff1de8de,0x000000f8
p0_local2_expect:
	.word	0xffffffff,0x00000000
	.word	0x41efffe0,0xab30ffd2
	.word	0x00005405,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0x00000080,0x000057ff
	.word	0x00000000,0x00000000
	.word	0x4969f3ad,0xffffffff
	.word	0x1e000000,0xff000000
p0_local2_sec_expect:
	.word	0x00000020,0x000057ff
	.word	0xff8c2cff,0x0f905620
	.word	0x2056900f,0xff8c2cff
	.word	0xff000000,0xff0000c3
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x5c06ff76
	.word	0xff008cf2,0xc30000ff
	.word	0x41efffe0,0x00000000
p0_local3_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff8c2cff
	.word	0x00000000,0x00005405
	.word	0x42e510f7,0x000057ff
	.word	0x00000000,0x000057ff
	.word	0x107c3fd9,0x00000086
	.word	0x76ff065c,0xff000000
	.word	0x00000000,0x000000ff
p0_local3_sec_expect:
	.word	0x000000ff,0x0f905620
	.word	0x000000ff,0x0f905620
	.word	0xff6a62a0,0x0f905620
	.word	0x00000000,0x7a8eeeff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xff008cf2,0x00000000
	.word	0x41efffe0,0x1e400000
p0_local4_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0xc30000ff
	.word	0x00000000,0x000057ff
	.word	0x0000f800,0xff0000ff
	.word	0xff2770d4,0x000000ff
	.word	0xff0000ff,0xffffffff
	.word	0x95ffe03a,0xd37aff6c
	.word	0x00000000,0x00972b83
p0_local4_sec_expect:
	.word	0x00000000,0xffff00f2
	.word	0xff000000,0x00000000
	.word	0x0f905620,0x00000000
	.word	0xb62c8ce5,0xfc90520c
	.word	0x89d516c4,0xabc26868
	.word	0x429c26ff,0x0000006c
	.word	0xffa56439,0x000000ff
	.word	0x98d0e6b4,0x7a8e4aff
p0_local5_expect:
	.word	0x00005405,0x0000ff00
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xaf520c69,0x00000000
	.word	0xff570000,0x80000000
	.word	0x00000000,0x00005405
	.word	0xffffffff,0x2056900f
	.word	0xc30000ff,0x0000ffff
p0_local5_sec_expect:
	.word	0x3a4261da,0x00000000
	.word	0x00ffffff,0x00ff0000
	.word	0x00000000,0x00000000
	.word	0x74a5f194,0xc0a53d9e
	.word	0x00000080,0x000057ff
	.word	0xffff00f2,0x800000ff
	.word	0x000000ff,0xffffffff
	.word	0x1e000000,0x00000000
p0_local6_expect:
	.word	0x00000000,0x000057ff
	.word	0xff8c2cff,0x0f905620
	.word	0x2056900f,0xff8c2cff
	.word	0xff000000,0xff0000c3
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x5c06ff76
	.word	0xff008cf2,0xc30000ff
	.word	0x41efffe0,0x00000000
p0_local6_sec_expect:
	.word	0x00000000,0x000057ff
	.word	0x00800000,0x77dc5bff
	.word	0x00000000,0x000000ff
	.word	0x95a4cc3a,0x4569d318
	.word	0x00000000,0xe0ffef41
	.word	0x7d245d2a,0x9518063d
	.word	0x33a1e205,0x5de0de4e
	.word	0x0d17eca1,0x4c916471
share0_expect:
	.word	0xffffeaae,0x65d68115
	.word	0xd46fe033,0xd79ccc6c
	.word	0x616e68cf,0xb815cef2
	.word	0x87c7e979,0xb24992b3
	.word	0x91548f30,0xed93dedb
	.word	0xb53742e6,0xf21b846a
	.word	0x535b6dc7,0x2e2a7fd3
	.word	0xfcf87d52,0xce61d1a2
share1_expect:
	.word	0x00005b63,0x599f7a06
	.word	0x7c126568,0xffca1d12
	.word	0x7521ca8c,0x173809c0
	.word	0x88cbe70f,0xa6e87cf8
	.word	0x03591b85,0xd20450fa
	.word	0x61dd544c,0xf9f55317
	.word	0x6a6732dc,0x33b85c9c
	.word	0x2f3625af,0x21ac8d2e
	.word	0x0000a555,0x28faa948
	.word	0x8daf64a7,0x9855faf4
	.word	0x79d8da7f,0x2cf2a2b9
	.word	0xe4364dc8,0xf607b2ce
	.word	0x836f63c4,0x828be378
	.word	0x0024974c,0x33e83704
	.word	0x5489d37b,0xeb636b36
	.word	0xa2deb75e,0x7f07c23d
share2_expect:
	.word	0x00ff4b99,0x30091350
	.word	0xd53409a0,0xc4cc5cf3
	.word	0xa8449779,0x2022840d
	.word	0x660eab5d,0xa7500e6e
	.word	0xbbebba43,0x02a9c1b3
	.word	0x7befb876,0x50142377
	.word	0x5742ef58,0x75421f5c
	.word	0x630a0032,0x8abf97ea
share3_expect:
	.word	0x00fff55e,0xa54096ab
	.word	0x7d3cf99f,0xfd2e245d
	.word	0x9bfa900b,0xa94d12f9
	.word	0xb91daaa6,0xc32d288a
	.word	0x77d6796d,0x0cf0d6b9
	.word	0x55b62cd5,0xa0fedbf5
	.word	0x0a4aeade,0x7cac4343
	.word	0x8b20ec8a,0x92cd62fb
	.word	0xff4307c8,0xf29b3467
	.word	0x09763b45,0x79fb8c9f
	.word	0x099f5b70,0x6f848a38
	.word	0x572296bf,0x1c4fbea0
	.word	0xe17c0e00,0xa37dd930
	.word	0x9570282b,0xe139b962
	.word	0x70df8437,0x8f9d0cba
	.word	0xd6577173,0x9bec08cb
	.word	0xffff3e7c,0x2e84e722
	.word	0x87940377,0xb3868751
	.word	0x0a035d99,0xc2a424fe
	.word	0x36eeed4c,0x63046965
	.word	0xfe8f8dd8,0x6c3fbf02
	.word	0x0baf2d3b,0x5e6145ad
	.word	0xd158142b,0x203d4af5
	.word	0x09b8429c,0x86f3539a
	.word	0xffff3492,0x0a1624b9
	.word	0x5f900fde,0x2b456af1
	.word	0xc38191b4,0xddad23f0
	.word	0xcb489a2e,0x0a63c5cd
	.word	0xa4727d0a,0x7b104baa
	.word	0x07d4a495,0xc00bdf79
	.word	0x6dcf643e,0x29ea0fde
	.word	0x0b9fc36e,0xfa87ff13
	.word	0xeaff7eb5,0x9e55eb2a
	.word	0x051d5b97,0x6830baea
	.word	0x0f871a8b,0x187d05ab
	.word	0x942f530f,0x06958fe0
	.word	0x8bf91029,0x4d6afc60
	.word	0xa33a32e1,0xd1ea5d7e
	.word	0x7d911587,0xe3035d79
	.word	0x26151095,0xfdb17bd5
	.word	0x00008319,0x8cfe023d
	.word	0x9157d55c,0xdac1617b
	.word	0xb130ffc2,0x413965a1
	.word	0xa024d4ff,0xc291a56b
	.word	0xeb01a18b,0x34749366
	.word	0x3d4bf8a4,0x80e52f8b
	.word	0x9c6a1d81,0x2f6cfaa0
	.word	0x2fa5f3d1,0x9d5376c0
	.word	0x84ff1c36,0x20bef81a
	.word	0xb7d437a4,0xf6f5ceb9
	.word	0x2669f51b,0xdb5d4318
	.word	0x2a9604fb,0xe2d9b763
	.word	0x6b8ce4cf,0x46a90892
	.word	0x19ff6f0e,0xf0b6231f
	.word	0x615f8b02,0x9f8c3e85
	.word	0xeb5c3935,0x84f6affd
	.word	0x00ffeec2,0x6d9c6b7d
	.word	0xe46f288c,0xf3bf5c6d
	.word	0x5e518fd1,0xb0b45fa2
	.word	0x045dfd29,0x28311633
	.word	0xa075f410,0xb9dba90b
	.word	0x23624263,0xf91b378e
	.word	0x4c3f4dca,0xcfaf6218
	.word	0x1bc1be79,0x0ee9272b
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
	.word	0x46b6f627,0xf399e728
	.word	0x00000000,0x00000002
	.word	0x2e85929f,0xefb52cc0
	.word	0x00000000,0x00000003
	.word	0x08f41d3f,0xc8aa083e
	.word	0x00000000,0x00000004
	.word	0xdb3b8007,0xa3ded019
	.word	0x00000000,0x00000005
	.word	0x2a820b90,0x42f00f1f
	.word	0x00000000,0x00000006
	.word	0xaa1958c7,0x88e8f603
	.word	0x00000000,0x00000007
	.word	0x61b84b00,0x57502b3f
	.word	0x00000000,0x00000008
	.word	0xbc0663ff,0xbc368528
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
	.word	0x369dec9d,0xab7361d0,0x4c05bd3d,0xb8f161e8
	.word	0xd4903fa1,0x1ad070ea,0x98d0e6b4,0x1afba657
	.word	0x0db79c36,0xc750ee45,0x22d7337e,0x28e63c7e
	.word	0x010a115a,0xe7e770fa,0x77dc5bff,0xadf371ad
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
	.word	0x07a82aa1,0xe47b6216,0xb0fed535,0x18661e79
	.word	0x5cd3715f,0x98d55407,0xf82df2ce,0x822190d7
	.word	0x5d28c91a,0x5a6b513c,0x3acc4978,0xe4da6f29
	.word	0x29d29f36,0x3c465500,0x5239399d,0x52f7d0d1
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
	.word	0x6e13d48a,0x131e2efd,0xa6eb0c26,0x11b59f35
	.word	0x241a94fb,0xa763103a,0xaf0140dc,0xeeb0070d
	.word	0xe45f81ed,0x1d22008e,0x76ff2604,0x382a2198
	.word	0x4bf2955b,0x18e99ccf,0xeeec8fc6,0xefbc79b6
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
	.word	0x0f686e68,0x89a1bcb0,0xd4c6f28b,0x19b11335
	.word	0x924816a2,0x5cb239cf,0x7e5da5c0,0x94f14874
	.word	0xd11954e5,0x8429aab2,0xc371ea9a,0x11acf543
	.word	0x102c0183,0x61d5e96d,0xcd3f8433,0x0ca4ff79
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
	.word	0x1170adf8,0x695fe48a,0x86f4624f,0x4689ce49
	.word	0x7d08b64e,0x30eb03f0,0xf78cb2f4,0xd42b6f1b
	.word	0x262b71a7,0x8d9039a3,0x5403dcf8,0x23c848d7
	.word	0x67138f59,0xfbee4764,0x7f9995a9,0x8cae2507
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
	.word	0xcbb059c7,0x61833684,0x1e8cab71,0xb747e508
	.word	0xd745ac45,0x9fdf938e,0x029d915c,0x015552b2
	.word	0x77948618,0x05a799e6,0x9ece16bc,0x6e5de08c
	.word	0xfc763002,0x82958041,0xcb2597ce,0x1c8a888c
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
	.word	0x2007b7ba,0x323ebeac,0x6b7e613d,0xe635b7cc
	.word	0xe8405eac,0x3b70ef3b,0x8d59ff24,0x0923f7ad
	.word	0xb6366b43,0x84bc058d,0x7a8e4af0,0x7e610554
	.word	0xaf520c69,0xf21de8de,0x8ae1e2be,0x7b3c982e
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
	.word	0xd49fed5b,0xe32dd524,0xa9c2c86f,0x41770a1b
	.word	0x8b9902eb,0x895ab544,0xb62c8ce5,0xfc90520c
	.word	0x89d516c4,0xabc26868,0x3b341992,0x88ef9f08
	.word	0x6f143112,0xcf54a533,0x981cc911,0x3850cf48
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
	.word	0x53ad409c,0xba1fd126,0x0cf9081d,0xabe656e6
	.word	0x114ed438,0x9695bbf8,0x1bf4cbdc,0x053b7086
	.word	0xfac942fd,0x7a78b8d6,0x3121a4ea,0x9cc3788a
	.word	0x9504cf24,0xd37aa06c,0x37bb86bf,0x48972b83
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
	.word	0xc1e0f782,0x49004366,0xfd4dddaa,0xdfec98c8
	.word	0x8705d318,0x09f97dc0,0xebd44844,0x3dc9d4f5
	.word	0x6ab18d34,0x9df266d0,0x619b7509,0x273d46db
	.word	0xca345df8,0x82896e44,0xea19c75d,0x5ea3f693
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
	.word	0xf5a2e5f0,0x7c74fcde,0x18c2a287,0x88b7831d
	.word	0x53c2f2e6,0x0cf14ef3,0x2c7cbe24,0x7420a04b
	.word	0xd75b2994,0xb6c23df8,0xc94ecbd6,0x252f334c
	.word	0x1a0ad0bb,0x77f6cf06,0x2860b7d7,0xa7195457
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
	.word	0xc17a70d4,0x62597181,0xba9574dc,0xf49ac0da
	.word	0x06d774dd,0xc6ac212d,0x405a8df6,0x6aa78bba
	.word	0x739f0674,0x5fe16869,0x2f33ee26,0x1acad9d9
	.word	0xb4b423e5,0x75c7815a,0xa63ebc79,0x565da1a3
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
	.word	0xb26bf527,0x8bc06aa8,0x02148563,0x91c1f147
	.word	0x6dfba1d0,0xff269c42,0xc056b74d,0x3fd45bb1
	.word	0xdc69e2cf,0x2e17228c,0xa69ebf0f,0x5c068e76
	.word	0x72e7bf45,0x192b3c10,0x4cbd48a2,0xcaf4af8c
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
	.word	0x49699178,0xbb3c2ead,0x9eaae217,0xfb9cd25c
	.word	0xee567a29,0x5f9fe92d,0x95a4cc3a,0x4569d318
	.word	0x7f90b859,0x0fa627de,0x7d245d2a,0x9518063d
	.word	0x33a1e205,0x5de0de4e,0x0d17eca1,0x4c916471
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
	.word	0x1388eaae,0x65d68115,0xd46fe033,0xd79ccc6c
	.word	0x616e68cf,0xb815cef2,0x87c7e979,0xb24992b3
	.word	0x91548f30,0xed93dedb,0xb53742e6,0xf21b846a
	.word	0x535b6dc7,0x2e2a7fd3,0xfcf87d52,0xce61d1a2
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
	.word	0x365c5b63,0x599f7a06,0x7c126568,0xffca1d12
	.word	0x7521ca8c,0x173809c0,0x88cbe70f,0xa6e87cf8
	.word	0x03591b85,0xd20450fa,0x61dd544c,0xf9f55317
	.word	0x6a6732dc,0x33b85c9c,0x2f3625af,0x21ac8d2e
	.word	0x735fa555,0x28faa948,0x8daf64a7,0x9855faf4
	.word	0x79d8da7f,0x2cf2a2b9,0xe4364dc8,0xf607b2ce
	.word	0x836f63c4,0x828be378,0x0024974c,0x33e83704
	.word	0x5489d37b,0xeb636b36,0xa2deb75e,0x7f07c23d
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
	.word	0xe58c4b99,0x30091350,0xd53409a0,0xc4cc5cf3
	.word	0xa8449779,0x2022840d,0x660eab5d,0xa7500e6e
	.word	0xbbebba43,0x02a9c1b3,0x7befb876,0x50142377
	.word	0x5742ef58,0x75421f5c,0x630a0032,0x8abf97ea
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
	.word	0xc60ef55e,0xa54096ab,0x7d3cf99f,0xfd2e245d
	.word	0x9bfa900b,0xa94d12f9,0xb91daaa6,0xc32d288a
	.word	0x77d6796d,0x0cf0d6b9,0x55b62cd5,0xa0fedbf5
	.word	0x0a4aeade,0x7cac4343,0x8b20ec8a,0x92cd62fb
	.word	0x19dc07c8,0xf29b3467,0x09763b45,0x79fb8c9f
	.word	0x099f5b70,0x6f848a38,0x572296bf,0x1c4fbea0
	.word	0xe17c0e00,0xa37dd930,0x9570282b,0xe139b962
	.word	0x70df8437,0x8f9d0cba,0xd6577173,0x9bec08cb
	.word	0xbb203e7c,0x2e84e722,0x87940377,0xb3868751
	.word	0x0a035d99,0xc2a424fe,0x36eeed4c,0x63046965
	.word	0xfe8f8dd8,0x6c3fbf02,0x0baf2d3b,0x5e6145ad
	.word	0xd158142b,0x203d4af5,0x09b8429c,0x86f3539a
	.word	0x16743492,0x0a1624b9,0x5f900fde,0x2b456af1
	.word	0xc38191b4,0xddad23f0,0xcb489a2e,0x0a63c5cd
	.word	0xa4727d0a,0x7b104baa,0x07d4a495,0xc00bdf79
	.word	0x6dcf643e,0x29ea0fde,0x0b9fc36e,0xfa87ff13
	.word	0xeab07eb5,0x9e55eb2a,0x051d5b97,0x6830baea
	.word	0x0f871a8b,0x187d05ab,0x942f530f,0x06958fe0
	.word	0x8bf91029,0x4d6afc60,0xa33a32e1,0xd1ea5d7e
	.word	0x7d911587,0xe3035d79,0x26151095,0xfdb17bd5
	.word	0xe61a8319,0x8cfe023d,0x9157d55c,0xdac1617b
	.word	0xb130ffc2,0x413965a1,0xa024d4ff,0xc291a56b
	.word	0xeb01a18b,0x34749366,0x3d4bf8a4,0x80e52f8b
	.word	0x9c6a1d81,0x2f6cfaa0,0x2fa5f3d1,0x9d5376c0
	.word	0x846e1c36,0x20bef81a,0xb7d437a4,0xf6f5ceb9
	.word	0x2669f51b,0xdb5d4318,0x2a9604fb,0xe2d9b763
	.word	0x6b8ce4cf,0x46a90892,0x19ff6f0e,0xf0b6231f
	.word	0x615f8b02,0x9f8c3e85,0xeb5c3935,0x84f6affd
	.word	0x2934eec2,0x6d9c6b7d,0xe46f288c,0xf3bf5c6d
	.word	0x5e518fd1,0xb0b45fa2,0x045dfd29,0x28311633
	.word	0xa075f410,0xb9dba90b,0x23624263,0xf91b378e
	.word	0x4c3f4dca,0xcfaf6218,0x1bc1be79,0x0ee9272b
share3_end:
