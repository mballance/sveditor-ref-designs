/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000_17.s
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
!	Seed = 330103945
!	Riesling can be on
!	1 Thread, 5000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_5000_17.s created on Mar 30, 2009 (10:39:45)
!	RC file : mar26.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar26.rc -o mpgen_5000_17 -p 1 -l 5000

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
!	%f0  = d958b216 f6d90c68 31b86b5e cc1695a4
!	%f4  = 93cd39e6 4482c20c bc89d647 fb516337
!	%f8  = 503da932 3553528e ffdce7e9 f5f90b12
!	%f12 = dc90759b 22863d1b 444907e2 a3ec5e26
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 5874a511 9555d6df 2c5022ea fc4a768a
!	%f20 = 2e681bab d6c55960 29f8f4e3 c0493bae
!	%f24 = 99cf22f6 6d887bae b1264b15 f60fe4d6
!	%f28 = 4011b4d4 0b40fd20 33d76dda 87e7db8f
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 23204f15 b2fd173b 26fcb792 1835078f
!	%f36 = 710cd47b 121d0610 b2114ee7 14d6c413
!	%f40 = 20d4845b 912acebd 237d9e42 ee1f6f20
!	%f44 = 55db7524 e45fc7cd 5e1c2da7 2830e7aa
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x71e3e5570000000d,%g7,%g1 ! GSR scale =  1, align = 5
	wr	%g1,%g0,%gsr		! GSR = 71e3e5570000000d
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000030041408] = 096e44d2, %l2 = d788507cea3f60cb
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 00000009000000ff
!	%f2  = 31b86b5e cc1695a4, %l1 = 976c61ac69d6794d
!	Mem[0000000030001400] = 23286e4e72ce1b3c
	stda	%f2,[%i0+%l1]ASI_PST8_S ! Mem[0000000030001400] = 23b86e4ecc161ba4
!	%l6 = 048e69084c6b862c, Mem[0000000030001408] = 4e1ab7b8
	stwa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 4c6b862c
!	Mem[0000000010181400] = 94d96c68, %l3 = 7347ccd4b22a47df
	lduba	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000068
!	%l4 = ef0459f9b7d6f9fb, Mem[0000000010181410] = 387cb656
	stba	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 387cb6fb
!	Mem[00000000100c1408] = 6fd341d6b211e0cb, %l5 = 8eb5e90e801df7de
	ldxa	[%i3+0x008]%asi,%l5	! %l5 = 6fd341d6b211e0cb
!	%l4 = b7d6f9fb, %l5 = b211e0cb, Mem[0000000010041400] = ce710783 86ca3bd4
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = b7d6f9fb b211e0cb
!	Mem[0000000010001410] = 822d3941, %l1 = 976c61ac69d6794d
	ldsha	[%i0+%o5]0x88,%l1	! %l1 = 0000000000003941
!	Mem[0000000030101408] = 59f10dde, %l2 = 0000000000000009
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000de
!	Starting 10 instruction Store Burst
!	%f25 = 6d887bae, Mem[0000000030101400] = 6fc745be
	sta	%f25,[%i4+%g0]0x89	! Mem[0000000030101400] = 6d887bae

p0_label_2:
!	Mem[0000000030081400] = 7140c421, %l3 = 0000000000000068
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 00000021000000ff
!	%f0  = d958b216 f6d90c68 31b86b5e cc1695a4
!	%f4  = 93cd39e6 4482c20c bc89d647 fb516337
!	%f8  = 503da932 3553528e ffdce7e9 f5f90b12
!	%f12 = dc90759b 22863d1b 444907e2 a3ec5e26
	stda	%f0,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	%l7 = b158a4424279e764, Mem[000000001008141e] = 3c55aa29, %asi = 80
	stha	%l7,[%i2+0x01e]%asi	! Mem[000000001008141c] = 3c55e764
!	Mem[00000000100c1410] = a7a2cfd3, %l1 = 0000000000003941
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 000000d3000000ff
!	%l4 = ef0459f9b7d6f9fb, Mem[0000000010181420] = bc6703b3
	stw	%l4,[%i6+0x020]		! Mem[0000000010181420] = b7d6f9fb
!	%f30 = 33d76dda, Mem[0000000010041400] = fbf9d6b7
	sta	%f30,[%i1+%g0]0x88	! Mem[0000000010041400] = 33d76dda
!	%l4 = b7d6f9fb, %l5 = b211e0cb, Mem[0000000010141410] = 41fdfdbe 27036963
	std	%l4,[%i5+%o5]		! Mem[0000000010141410] = b7d6f9fb b211e0cb
!	Mem[0000000010081408] = 27055343, %l0 = 2a7faa2272411517
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 00000043000000ff
!	%l7 = b158a4424279e764, Mem[0000000020800040] = f9064bbb, %asi = 80
	stha	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = e7644bbb
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 52932556, %f21 = d6c55960
	lda	[%i5+%g0]0x81,%f21	! %f21 = 52932556

p0_label_3:
!	Mem[0000000010101410] = d73b545a, %l3 = 0000000000000021
	ldsw	[%i4+%o5],%l3		! %l3 = ffffffffd73b545a
!	Mem[0000000030181410] = 779994fd3dca4ccd, %l5 = 6fd341d6b211e0cb
	ldxa	[%i6+%o5]0x81,%l5	! %l5 = 779994fd3dca4ccd
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010041408] = 005dce31, %l2 = 00000000000000de
	lduba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000031
!	Mem[0000000010081418] = 4a16708c 3c55e764, %l0 = 00000043, %l1 = 000000d3
	ldd	[%i2+0x018],%l0		! %l0 = 000000004a16708c 000000003c55e764
!	Mem[0000000010081428] = ec30e485, %l5 = 779994fd3dca4ccd
	lduw	[%i2+0x028],%l5		! %l5 = 00000000ec30e485
!	Mem[0000000010041428] = 9fb6d02e3a505a63, %l7 = b158a4424279e764
	ldxa	[%i1+0x028]%asi,%l7	! %l7 = 9fb6d02e3a505a63
!	Mem[0000000010001430] = 4f52ac7d20c310c2, %l6 = 048e69084c6b862c
	ldx	[%i0+0x030],%l6		! %l6 = 4f52ac7d20c310c2
!	Mem[0000000030041408] = 31b86b5ecc1695a4, %f16 = 5874a511 9555d6df
	ldda	[%i1+%o4]0x89,%f16	! %f16 = 31b86b5e cc1695a4
!	Mem[0000000030101400] = ae7b886d9b0aebbb, %f14 = 444907e2 a3ec5e26
	ldda	[%i4+%g0]0x81,%f14	! %f14 = ae7b886d 9b0aebbb
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = fbb67c38, %l5 = 00000000ec30e485
	ldstuba	[%i6+%o5]0x80,%l5	! %l5 = 000000fb000000ff

p0_label_4:
!	Mem[0000000010081408] = 270553ff, %l3 = ffffffffd73b545a
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%l6 = 4f52ac7d20c310c2, Mem[0000000010181410] = 387cb6ff
	stba	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 387cb6c2
!	Mem[0000000010181400] = 94d96c68, %l4 = ef0459f9b7d6f9fb
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 0000000094d96c68
!	%l6 = 20c310c2, %l7 = 3a505a63, Mem[0000000010141410] = b7d6f9fb b211e0cb
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 20c310c2 3a505a63
!	Mem[0000000010081430] = c6a8432c24a56a1b, %l5 = 00000000000000fb, %l7 = 9fb6d02e3a505a63
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = c6a8432c24a56a1b
!	%l5 = 00000000000000fb, Mem[0000000030181408] = f5d3d9e7
	stwa	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000fb
!	%l1 = 000000003c55e764, Mem[0000000030101408] = 59f10dde
	stha	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 59f1e764
!	%l1 = 000000003c55e764, Mem[0000000010001400] = 5163266e
	stha	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 5163e764
!	Mem[0000000030081400] = ffc44071, %l3 = 00000000000000ff
	ldstuba	[%i2+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = cd4cca3d fd949977, %l6 = 20c310c2, %l7 = 24a56a1b
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 00000000fd949977 00000000cd4cca3d

p0_label_5:
!	Mem[0000000010041430] = aa74498d, %l0 = 000000004a16708c
	lduha	[%i1+0x032]%asi,%l0	! %l0 = 000000000000498d
!	Mem[0000000010041410] = d8c30501, %l3 = 00000000000000ff
	ldsha	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000501
!	Mem[00000000211c0000] = 018958bc, %l1 = 000000003c55e764
	ldsh	[%o2+%g0],%l1		! %l1 = 0000000000000189
!	Mem[0000000010101400] = ece3c015, %l0 = 000000000000498d
	ldswa	[%i4+%g0]0x88,%l0	! %l0 = ffffffffece3c015
!	Mem[0000000030101408] = 59f1e764, %l1 = 0000000000000189
	lduha	[%i4+%o4]0x89,%l1	! %l1 = 000000000000e764
!	Mem[0000000010041408] = 005dce31, %l2 = 0000000000000031
	lduwa	[%i1+%o4]0x88,%l2	! %l2 = 00000000005dce31
!	Mem[0000000030081400] = ffc44071 c7cb9392, %l2 = 005dce31, %l3 = 00000501
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000ffc44071 00000000c7cb9392
!	Mem[0000000010001408] = 859c447628fd28c8, %f6  = bc89d647 fb516337
	ldda	[%i0+%o4]0x88,%f6 	! %f6  = 859c4476 28fd28c8
!	Mem[00000000100c1410] = 798483eba7a2cfff, %f0  = d958b216 f6d90c68
	ldda	[%i3+%o5]0x88,%f0 	! %f0  = 798483eb a7a2cfff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ffc44071, Mem[0000000010181410] = 387cb6c2
	stha	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 387c4071

p0_label_6:
!	Mem[0000000030081410] = 3b46270b, %l5 = 00000000000000fb
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 000000003b46270b
!	%f14 = ae7b886d 9b0aebbb, Mem[0000000030141408] = deba0e09 9445f204
	stda	%f14,[%i5+%o4]0x89	! Mem[0000000030141408] = ae7b886d 9b0aebbb
!	%l6 = fd949977, %l7 = cd4cca3d, Mem[0000000030041410] = 4482c20c 93cd39e6
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = fd949977 cd4cca3d
!	Mem[0000000010141400] = 184cf29d, %l0 = ffffffffece3c015
	ldstuba	[%i5+%g0]0x88,%l0	! %l0 = 0000009d000000ff
!	Mem[0000000010001410] = 41392d82, %l4 = 0000000094d96c68
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 00000041000000ff
!	Mem[0000000010101404] = f84eefba, %l1 = 000000000000e764
	swap	[%i4+0x004],%l1		! %l1 = 00000000f84eefba
!	Mem[00000000300c1400] = 3b3140e1, %l4 = 0000000000000041
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 000000003b3140e1
!	%l2 = ffc44071, %l3 = c7cb9392, Mem[0000000010001410] = ff392d82 5cce3b46
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = ffc44071 c7cb9392
!	Mem[0000000010101400] = ece3c015, %l2 = 00000000ffc44071
	lduwa	[%i4+%g0]0x88,%l2	! %l2 = 00000000ece3c015
!	Starting 10 instruction Load Burst
!	Mem[0000000010141428] = ef45dc5841fdddfc, %l7 = 00000000cd4cca3d
	ldxa	[%i5+0x028]%asi,%l7	! %l7 = ef45dc5841fdddfc

p0_label_7:
!	Mem[0000000030181410] = fd949977, %l7 = ef45dc5841fdddfc
	lduha	[%i6+%o5]0x89,%l7	! %l7 = 0000000000009977
!	Mem[0000000010181404] = ba439dac, %l0 = 000000000000009d
	ldsb	[%i6+0x006],%l0		! %l0 = ffffffffffffff9d
!	Mem[0000000010041408] = 31ce5d000b7d59d7, %l2 = 00000000ece3c015
	ldx	[%i1+%o4],%l2		! %l2 = 31ce5d000b7d59d7
!	Mem[000000001000143c] = 198ebd89, %l3 = 00000000c7cb9392
	ldsha	[%i0+0x03c]%asi,%l3	! %l3 = 000000000000198e
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010141400] = fff24c18 46692fe0 982a3c92 b7e0ede4
!	Mem[0000000010141410] = 20c310c2 3a505a63 ce367da3 d753121c
!	Mem[0000000010141420] = a209c2df d104baa0 ef45dc58 41fdddfc
!	Mem[0000000010141430] = fc01d20a 2d60334d 9a421fd5 e84387dd
	ldda	[%i5]ASI_BLK_AIUP,%f0	! Block Load from 0000000010141400
!	Mem[0000000030041408] = a49516cc, %l2 = 31ce5d000b7d59d7
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = ffffffffffffa495
!	Mem[0000000010101400] = ece3c015, %l2 = ffffffffffffa495
	ldsha	[%i4+%g0]0x88,%l2	! %l2 = ffffffffffffc015
!	Mem[0000000010001400] = 64e76351, %l2 = ffffffffffffc015
	ldsba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000064
!	Mem[0000000030081400] = ffc44071, %l4 = 000000003b3140e1
	ldsba	[%i2+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = fb000000, %l5 = 000000003b46270b
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 000000fb000000ff

p0_label_8:
!	%l0 = ffffff9d, %l1 = f84eefba, Mem[0000000010041408] = 005dce31 d7597d0b
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffff9d f84eefba
!	Mem[0000000010101408] = ef6db0dc, %l0 = ffffffffffffff9d
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 000000dc000000ff
!	%f26 = b1264b15 f60fe4d6, %l2 = 0000000000000064
!	Mem[0000000010041408] = 9dffffffbaef4ef8
	add	%i1,0x008,%g1
	stda	%f26,[%g1+%l2]ASI_PST16_P ! Mem[0000000010041408] = 9dff4b15baef4ef8
!	Mem[0000000010041408] = 9dff4b15, %l6 = 00000000fd949977
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 000000009dff4b15
!	Mem[0000000030041408] = a49516cc, %l5 = 00000000000000fb
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 000000a4000000ff
!	Mem[00000000201c0001] = 0e4e0847, %l2 = 0000000000000064
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 0000004e000000ff
!	%l4 = ffffffff, %l5 = 000000a4, Mem[0000000030001408] = 4c6b862c 670319ae
	stda	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff 000000a4
!	%l0 = 00000000000000dc, Mem[0000000021800180] = 8f6b809b
	sth	%l0,[%o3+0x180]		! Mem[0000000021800180] = 00dc809b
!	Mem[0000000010181408] = e17f0d7c, %l2 = 000000000000004e
	ldstuba	[%i6+%o4]0x80,%l2	! %l2 = 000000e1000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = 6d45f510, %l4 = ffffffffffffffff
	ldsha	[%o3+0x0c0]%asi,%l4	! %l4 = 0000000000006d45

p0_label_9:
!	Mem[0000000010141430] = fc01d20a2d60334d, %f22 = 29f8f4e3 c0493bae
	ldda	[%i5+0x030]%asi,%f22	! %f22 = fc01d20a 2d60334d
!	Mem[00000000100c1408] = cbe011b2d641d36f, %f24 = 99cf22f6 6d887bae
	ldda	[%i3+%o4]0x88,%f24	! %f24 = cbe011b2 d641d36f
!	Mem[0000000010041418] = 73f485ac, %l5 = 00000000000000a4
	ldsha	[%i1+0x018]%asi,%l5	! %l5 = 00000000000073f4
!	Mem[0000000010081400] = 0429857a6d51e871, %f26 = b1264b15 f60fe4d6
	ldda	[%i2+%g0]0x80,%f26	! %f26 = 0429857a 6d51e871
!	Mem[0000000030041410] = fd949977, %f20 = 2e681bab
	lda	[%i1+%o5]0x89,%f20	! %f20 = fd949977
!	Mem[0000000010181408] = 7c0d7fff, %l5 = 00000000000073f4
	lduha	[%i6+%o4]0x88,%l5	! %l5 = 0000000000007fff
!	Mem[0000000010181418] = 32eb21cc53eaa308, %f22 = fc01d20a 2d60334d
	ldda	[%i6+0x018]%asi,%f22	! %f22 = 32eb21cc 53eaa308
!	Mem[0000000010041410] = 0105c3d8, %f29 = 0b40fd20
	ld	[%i1+%o5],%f29	! %f29 = 0105c3d8
!	Mem[0000000010001410] = 7140c4ff, %l2 = 00000000000000e1
	lduha	[%i0+%o5]0x88,%l2	! %l2 = 000000000000c4ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 5a543bd7, %l2 = 000000000000c4ff
	swapa	[%i4+%o5]0x88,%l2	! %l2 = 000000005a543bd7

p0_label_10:
!	%l6 = 9dff4b15, %l7 = 00009977, Mem[0000000010181408] = ff7f0d7c 1b4c5acf
	std	%l6,[%i6+%o4]		! Mem[0000000010181408] = 9dff4b15 00009977
!	%l6 = 9dff4b15, %l7 = 00009977, Mem[0000000010181410] = 71407c38 4dcd3ed8
	std	%l6,[%i6+%o5]		! Mem[0000000010181410] = 9dff4b15 00009977
!	%l3 = 000000000000198e, Mem[0000000030081408] = 2320b4eb
	stha	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 2320198e
!	%f30 = 33d76dda, Mem[0000000010041410] = 0105c3d8
	sta	%f30,[%i1+0x010]%asi	! Mem[0000000010041410] = 33d76dda
!	Mem[00000000211c0000] = 018958bc, %l5 = 0000000000007fff
	ldstub	[%o2+%g0],%l5		! %l5 = 00000001000000ff
	membar	#Sync			! Added by membar checker (3)
!	%l4 = 0000000000006d45, Mem[0000000010141400] = fff24c1846692fe0
	stxa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000006d45
!	%f10 = ef45dc58 41fdddfc, Mem[0000000030181410] = 779994fd 3dca4ccd
	stda	%f10,[%i6+%o5]0x81	! Mem[0000000030181410] = ef45dc58 41fdddfc
!	%l4 = 0000000000006d45, Mem[0000000030081408] = 8e1920235e9777e6
	stxa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000006d45
!	%f8  = a209c2df d104baa0, Mem[0000000030001410] = 3e68badd 4b80492e
	stda	%f8 ,[%i0+%o5]0x89	! Mem[0000000030001410] = a209c2df d104baa0
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 20c310c2, %l0 = 00000000000000dc
	lduba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000020

p0_label_11:
!	Mem[0000000030001400] = a41b16cc4e6eb823, %f10 = ef45dc58 41fdddfc
	ldda	[%i0+%g0]0x89,%f10	! %f10 = a41b16cc 4e6eb823
!	Mem[0000000010001400] = 64e76351f55387cf, %f4  = 20c310c2 3a505a63
	ldda	[%i0+%g0]0x80,%f4 	! %f4  = 64e76351 f55387cf
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030181400] = 20e23eb4 dab52edf ff000000 b20fc2d9
!	Mem[0000000030181410] = ef45dc58 41fdddfc 1a7531a7 8788c6cd
!	Mem[0000000030181420] = 35340afd 157839c2 74592f4e 299bb4bb
!	Mem[0000000030181430] = 0d2123e9 34e7136a 109da19c 16afb44d
	ldda	[%i6]ASI_BLK_AIUS,%f16	! Block Load from 0000000030181400
!	Mem[0000000010041400] = cbe011b233d76dda, %f0  = fff24c18 46692fe0
	ldda	[%i1+%g0]0x88,%f0 	! %f0  = cbe011b2 33d76dda
!	Mem[00000000100c142c] = 2fe83a41, %l5 = 0000000000000001
	lduw	[%i3+0x02c],%l5		! %l5 = 000000002fe83a41
!	Mem[0000000030081410] = 000000fb, %l3 = 000000000000198e
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000fb
!	Mem[00000000201c0000] = 0eff0847, %l0 = 0000000000000020
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000eff
!	Mem[0000000010081410] = 5564459d, %l5 = 000000002fe83a41
	lduwa	[%i2+%o5]0x80,%l5	! %l5 = 000000005564459d
!	Mem[0000000030081410] = fb000000 88165e09, %l4 = 00006d45, %l5 = 5564459d
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 00000000fb000000 0000000088165e09
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 6fd341d6, %l1 = 00000000f84eefba
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 000000006fd341d6

p0_label_12:
!	Mem[0000000010041410] = da6dd733, %l5 = 0000000088165e09
	swapa	[%i1+%o5]0x88,%l5	! %l5 = 00000000da6dd733
!	%l6 = 000000009dff4b15, Mem[0000000010101408] = ffb06def
	stba	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 15b06def
!	Mem[000000001000143c] = 198ebd89, %l1 = 000000006fd341d6, %asi = 80
	swapa	[%i0+0x03c]%asi,%l1	! %l1 = 00000000198ebd89
!	Mem[0000000010041408] = fd949977, %l0 = 0000000000000eff
	swap	[%i1+%o4],%l0		! %l0 = 00000000fd949977
!	Mem[0000000010081400] = 7a852904, %l3 = 00000000000000fb
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 00000004000000ff
!	%f16 = 20e23eb4 dab52edf ff000000 b20fc2d9
!	%f20 = ef45dc58 41fdddfc 1a7531a7 8788c6cd
!	%f24 = 35340afd 157839c2 74592f4e 299bb4bb
!	%f28 = 0d2123e9 34e7136a 109da19c 16afb44d
	stda	%f16,[%i0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	%l7 = 0000000000009977, Mem[0000000010081428] = ec30e485f583560f
	stx	%l7,[%i2+0x028]		! Mem[0000000010081428] = 0000000000009977
!	%l7 = 0000000000009977, Mem[0000000010041408] = 00000eff
	stba	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 77000eff
!	Mem[0000000030141410] = ec565b8c, %l5 = 00000000da6dd733
	swapa	[%i5+%o5]0x89,%l5	! %l5 = 00000000ec565b8c
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 68e6cf48, %l1 = 00000000198ebd89
	lduwa	[%i3+%g0]0x88,%l1	! %l1 = 0000000068e6cf48

p0_label_13:
!	Mem[0000000010081400] = ff29857a, %l3 = 0000000000000004
	ldsba	[%i2+0x003]%asi,%l3	! %l3 = 000000000000007a
!	Mem[00000000211c0000] = ff8958bc, %l6 = 000000009dff4b15
	lduba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000089
!	Mem[0000000030041408] = ff9516cc5e6bb831, %f12 = fc01d20a 2d60334d
	ldda	[%i1+%o4]0x81,%f12	! %f12 = ff9516cc 5e6bb831
!	Mem[00000000300c1410] = 162bf0f2, %l3 = 000000000000007a
	lduwa	[%i3+%o5]0x81,%l3	! %l3 = 00000000162bf0f2
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010001400] = df2eb5da b43ee220, %l2 = 5a543bd7, %l3 = 162bf0f2
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 00000000b43ee220 00000000df2eb5da
!	Mem[0000000010081400] = ff29857a, %l5 = 00000000ec565b8c
	lduha	[%i2+%g0]0x80,%l5	! %l5 = 000000000000ff29
!	Mem[0000000030181408] = ff000000b20fc2d9, %f8  = a209c2df d104baa0
	ldda	[%i6+%o4]0x81,%f8 	! %f8  = ff000000 b20fc2d9
!	Mem[0000000010101408] = 15b06def4b8b56e4, %l6 = 0000000000000089
	ldxa	[%i4+%o4]0x80,%l6	! %l6 = 15b06def4b8b56e4
!	Mem[00000000201c0000] = 0eff0847, %l2 = 00000000b43ee220
	lduh	[%o0+%g0],%l2		! %l2 = 0000000000000eff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = ffcfa2a7, %l1 = 0000000068e6cf48
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 00000000ffcfa2a7

p0_label_14:
!	Mem[0000000030141400] = 52932556, %l5 = 000000000000ff29
	ldstuba	[%i5+%g0]0x81,%l5	! %l5 = 00000052000000ff
!	%f14 = 9a421fd5 e84387dd, Mem[0000000010101408] = 15b06def 4b8b56e4
	stda	%f14,[%i4+%o4]0x80	! Mem[0000000010101408] = 9a421fd5 e84387dd
!	%f4  = 64e76351 f55387cf, Mem[0000000030181408] = ff000000 b20fc2d9
	stda	%f4 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 64e76351 f55387cf
!	%f19 = b20fc2d9, Mem[0000000010081404] = 6d51e871
	sta	%f19,[%i2+0x004]%asi	! Mem[0000000010081404] = b20fc2d9
!	Mem[0000000030181400] = b43ee220, %l6 = 15b06def4b8b56e4
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000b43ee220
!	%l4 = 00000000fb000000, Mem[0000000010101400] = ece3c015
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = ece30000
!	%f4  = 64e76351 f55387cf, %l2 = 0000000000000eff
!	Mem[0000000010081408] = ff53052790f8c256
	add	%i2,0x008,%g1
	stda	%f4,[%g1+%l2]ASI_PST32_P ! Mem[0000000010081408] = 64e76351f55387cf
!	%f22 = 1a7531a7, Mem[0000000030101410] = 7829c723
	sta	%f22,[%i4+%o5]0x89	! Mem[0000000030101410] = 1a7531a7
!	%l6 = b43ee220, %l7 = 00009977, Mem[0000000010081430] = c6a8432c 24a56a1b
	std	%l6,[%i2+0x030]		! Mem[0000000010081430] = b43ee220 00009977
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 7a8529ff, %l6 = 00000000b43ee220
	ldswa	[%i2+%g0]0x88,%l6	! %l6 = 000000007a8529ff

p0_label_15:
!	Mem[0000000010101438] = 70001f4b927a5681, %l6 = 000000007a8529ff
	ldxa	[%i4+0x038]%asi,%l6	! %l6 = 70001f4b927a5681
!	Mem[0000000010181408] = 9dff4b15, %l4 = 00000000fb000000
	lduha	[%i6+%o4]0x80,%l4	! %l4 = 0000000000009dff
!	Mem[0000000010101410] = 0000c4ff, %l5 = 0000000000000052
	lduha	[%i4+%o5]0x88,%l5	! %l5 = 000000000000c4ff
!	Mem[00000000300c1408] = d8188706, %l2 = 0000000000000eff
	ldsha	[%i3+%o4]0x89,%l2	! %l2 = ffffffffffff8706
!	Mem[0000000010181408] = 154bff9d, %l1 = 00000000ffcfa2a7
	ldswa	[%i6+%o4]0x88,%l1	! %l1 = 00000000154bff9d
!	Mem[0000000021800180] = 00dc809b, %l6 = 70001f4b927a5681
	ldsh	[%o3+0x180],%l6		! %l6 = 00000000000000dc
!	Mem[0000000010101400] = 0000e3ec, %f24 = 35340afd
	lda	[%i4+%g0]0x80,%f24	! %f24 = 0000e3ec
!	Mem[00000000100c1400] = 68e6cf48, %l7 = 0000000000009977
	lduwa	[%i3+%g0]0x88,%l7	! %l7 = 0000000068e6cf48
!	Mem[00000000300c1410] = f2f02b16, %l4 = 0000000000009dff
	lduwa	[%i3+%o5]0x89,%l4	! %l4 = 00000000f2f02b16
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = baef4ef8, %l3 = 00000000df2eb5da
	swapa	[%i3+%o4]0x88,%l3	! %l3 = 00000000baef4ef8

p0_label_16:
!	%f8  = ff000000 b20fc2d9, Mem[0000000030181410] = 58dc45ef fcddfd41
	stda	%f8 ,[%i6+%o5]0x89	! Mem[0000000030181410] = ff000000 b20fc2d9
!	Mem[0000000030041400] = 680cd9f6, %l0 = 00000000fd949977
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 00000068000000ff
!	Mem[0000000010181400] = b7d6f9fb, %l4 = 00000000f2f02b16
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000b7d6f9fb
!	Mem[0000000010001438] = 109da19c, %l6 = 000000dc, %l5 = 0000c4ff
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 00000000109da19c
!	%f16 = 20e23eb4 dab52edf, %l5 = 00000000109da19c
!	Mem[0000000010081430] = b43ee22000009977
	add	%i2,0x030,%g1
	stda	%f16,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010081430] = b43ee22000009977
!	Mem[00000000211c0000] = ff8958bc, %l3 = 00000000baef4ef8
	ldstub	[%o2+%g0],%l3		! %l3 = 000000ff000000ff
!	Mem[0000000030001408] = ffffffff, %l6 = 00000000000000dc
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000300c1410] = 162bf0f2, %l2 = ffffffffffff8706
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 00000000162bf0f2
!	Mem[0000000030081408] = 00000000, %l4 = 00000000b7d6f9fb
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = a4000000ffffffff, %f16 = 20e23eb4 dab52edf
	ldda	[%i0+%o4]0x89,%f16	! %f16 = a4000000 ffffffff

p0_label_17:
!	Mem[0000000010081410] = 5564459d 3bc87061, %l2 = 162bf0f2, %l3 = 000000ff
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 000000005564459d 000000003bc87061
!	Mem[0000000010041408] = 77000eff, %l2 = 000000005564459d
	lduwa	[%i1+0x008]%asi,%l2	! %l2 = 0000000077000eff
!	Mem[0000000021800180] = 00dc809b, %l5 = 00000000109da19c
	lduh	[%o3+0x180],%l5		! %l5 = 00000000000000dc
!	Mem[0000000010001428] = 74592f4e299bb4bb, %l1 = 00000000154bff9d
	ldx	[%i0+0x028],%l1		! %l1 = 74592f4e299bb4bb
!	Mem[0000000010041410] = 88165e09, %l3 = 000000003bc87061
	lduwa	[%i1+%o5]0x88,%l3	! %l3 = 0000000088165e09
!	Mem[0000000030041410] = 779994fd, %l3 = 0000000088165e09
	ldsba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000077
!	Mem[0000000030001400] = 23b86e4e, %l7 = 0000000068e6cf48
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000023
!	Mem[0000000030041410] = 779994fd3dca4ccd, %l1 = 74592f4e299bb4bb
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = 779994fd3dca4ccd
!	Mem[00000000300c1408] = d8188706, %l6 = 00000000000000ff
	lduwa	[%i3+%o4]0x89,%l6	! %l6 = 00000000d8188706
!	Starting 10 instruction Store Burst
!	%f0  = cbe011b2 33d76dda 982a3c92 b7e0ede4
!	%f4  = 64e76351 f55387cf ce367da3 d753121c
!	%f8  = ff000000 b20fc2d9 a41b16cc 4e6eb823
!	%f12 = ff9516cc 5e6bb831 9a421fd5 e84387dd
	stda	%f0,[%i0]ASI_BLK_AIUS	! Block Store to 0000000030001400

p0_label_18:
!	%f22 = 1a7531a7, Mem[0000000030181408] = 5163e764
	sta	%f22,[%i6+%o4]0x89	! Mem[0000000030181408] = 1a7531a7
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030001400] = b211e0cb, %l7 = 0000000000000023
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 00000000b211e0cb
!	%f16 = a4000000 ffffffff, Mem[0000000010001410] = ef45dc58 41fdddfc
	stda	%f16,[%i0+%o5]0x80	! Mem[0000000010001410] = a4000000 ffffffff
!	Mem[000000001014142e] = 41fdddfc, %l1 = 779994fd3dca4ccd
	ldstub	[%i5+0x02e],%l1		! %l1 = 000000dd000000ff
!	Mem[00000000100c1400] = 68e6cf48, %l7 = 00000000b211e0cb
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 00000048000000ff
!	%f18 = ff000000 b20fc2d9, Mem[0000000030181400] = 4b8b56e4 df2eb5da
	stda	%f18,[%i6+%g0]0x89	! Mem[0000000030181400] = ff000000 b20fc2d9
!	%l4 = 0000000000000000, Mem[0000000030001410] = 5163e764
	stba	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 5163e700
!	%f5  = f55387cf, Mem[00000000100c1400] = ffcfe668
	sta	%f5 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = f55387cf
!	Mem[0000000030081410] = fb000000, %l3 = 0000000000000077
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 000000fb000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = b20fc2d9, %f20 = ef45dc58
	lda	[%i6+%o5]0x89,%f20	! %f20 = b20fc2d9

p0_label_19:
!	Mem[0000000010141400] = 00000000, %l5 = 00000000000000dc
	ldsba	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = ff932556, %l3 = 00000000000000fb
	lduha	[%i5+%g0]0x81,%l3	! %l3 = 000000000000ff93
!	Mem[0000000030041410] = 779994fd, %l3 = 000000000000ff93
	lduba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000077
!	Mem[00000000100c1410] = 48cfe668, %l1 = 00000000000000dd
	ldswa	[%i3+%o5]0x88,%l1	! %l1 = 0000000048cfe668
!	Mem[0000000010101410] = ffc40000, %l4 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l4	! %l4 = 00000000ffc40000
!	Mem[0000000010181400] = f2f02b16, %l5 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l5	! %l5 = 0000000000002b16
!	Mem[0000000010181410] = 154bff9d, %l2 = 0000000077000eff
	lduha	[%i6+%o5]0x88,%l2	! %l2 = 000000000000ff9d
!	Mem[0000000010141418] = ce367da3d753121c, %f18 = ff000000 b20fc2d9
	ldd	[%i5+0x018],%f18	! %f18 = ce367da3 d753121c
!	Mem[0000000010141430] = fc01d20a2d60334d, %l3 = 0000000000000077
	ldx	[%i5+0x030],%l3		! %l3 = fc01d20a2d60334d
!	Starting 10 instruction Store Burst
!	%f0  = cbe011b2 33d76dda 982a3c92 b7e0ede4
!	%f4  = 64e76351 f55387cf ce367da3 d753121c
!	%f8  = ff000000 b20fc2d9 a41b16cc 4e6eb823
!	%f12 = ff9516cc 5e6bb831 9a421fd5 e84387dd
	stda	%f0,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400

p0_label_20:
!	%f24 = 0000e3ec 157839c2, Mem[0000000010181430] = 5d0e1277 0a952ec4
	stda	%f24,[%i6+0x030]%asi	! Mem[0000000010181430] = 0000e3ec 157839c2
!	Mem[0000000010081410] = 5564459d, %l0 = 0000000000000068
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 00000055000000ff
!	%l6 = d8188706, %l7 = 00000048, Mem[00000000300c1400] = 41000000 1af77f72
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = d8188706 00000048
!	Mem[0000000010041400] = 33d76dda, %l5 = 0000000000002b16
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 000000da000000ff
!	%l4 = 00000000ffc40000, Mem[0000000010081410] = ff64459d3bc87061
	stxa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000ffc40000
!	%l3 = fc01d20a2d60334d, Mem[0000000030141410] = 33d76dda
	stha	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 334d6dda
!	%l4 = 00000000ffc40000, Mem[0000000010141408] = 982a3c92
	stwa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = ffc40000
	membar	#Sync			! Added by membar checker (7)
!	%l1 = 0000000048cfe668, Mem[0000000030001400] = b211e0cb
	stba	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = b211e068
!	%l6 = d8188706, %l7 = 00000048, Mem[0000000010141410] = 20c310c2 3a505a63
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = d8188706 00000048
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = e7644bbb, %l7 = 0000000000000048
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = ffffffffffffe764

p0_label_21:
!	Mem[0000000010001420] = 35340afd, %l4 = 00000000ffc40000
	lduw	[%i0+0x020],%l4		! %l4 = 0000000035340afd
!	Mem[00000000300c1408] = 037a4374 d8188706, %l4 = 35340afd, %l5 = 000000da
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 00000000d8188706 00000000037a4374
!	Mem[0000000030081408] = fbf9d6b7, %f31 = 16afb44d
	lda	[%i2+%o4]0x89,%f31	! %f31 = fbf9d6b7
!	Mem[0000000010041408] = ff0e0077, %l5 = 00000000037a4374
	ldsba	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000077
!	Mem[0000000010081400] = ff29857a, %l7 = ffffffffffffe764
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 000000000000ff29
!	Mem[0000000010181400] = ac9d43baf2f02b16, %l7 = 000000000000ff29
	ldxa	[%i6+%g0]0x88,%l7	! %l7 = ac9d43baf2f02b16
!	Mem[0000000010181428] = 9547dba4, %l1 = 0000000048cfe668
	ldsb	[%i6+0x02b],%l1		! %l1 = ffffffffffffffa4
!	Mem[0000000030001400] = 68e011b2, %l7 = ac9d43baf2f02b16
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000068
!	Mem[0000000010041400] = 33d76dff, %l5 = 0000000000000077
	lduwa	[%i1+%g0]0x88,%l5	! %l5 = 0000000033d76dff
!	Starting 10 instruction Store Burst
!	Mem[000000001004140c] = baef4ef8, %l5 = 0000000033d76dff
	swap	[%i1+0x00c],%l5		! %l5 = 00000000baef4ef8

p0_label_22:
!	Mem[0000000030001408] = 923c2a98, %l0 = 0000000000000055
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 00000000923c2a98
!	Mem[0000000030041408] = cc1695ff, %l1 = ffffffffffffffa4
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 00000000cc1695ff
!	Mem[0000000010081400] = ff29857a, %l2 = 000000000000ff9d
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000ff29857a
!	%f4  = 64e76351 f55387cf, Mem[00000000100c1400] = f55387cf 14d4f57a
	stda	%f4 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 64e76351 f55387cf
!	%l7 = 0000000000000068, Mem[0000000020800001] = 633e261d, %asi = 80
	stba	%l7,[%o1+0x001]%asi	! Mem[0000000020800000] = 6368261d
!	%l3 = fc01d20a2d60334d, Mem[00000000201c0000] = 0eff0847
	stb	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 4dff0847
!	Mem[0000000010001400] = 20e23eb4, %l0 = 00000000923c2a98
	swap	[%i0+%g0],%l0		! %l0 = 0000000020e23eb4
!	%f29 = 34e7136a, Mem[00000000100c1410] = 68e6cf48
	sta	%f29,[%i3+%o5]0x80	! Mem[00000000100c1410] = 34e7136a
!	Mem[0000000010081408] = 5163e764, %l1 = 00000000cc1695ff
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 000000005163e764
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = a731751a f55387cf, %l0 = 20e23eb4, %l1 = 5163e764
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 00000000a731751a 00000000f55387cf

p0_label_23:
!	Mem[0000000010041404] = b211e0cb, %f18 = ce367da3
	lda	[%i1+0x004]%asi,%f18	! %f18 = b211e0cb
!	Mem[0000000030081408] = fbf9d6b7, %f16 = a4000000
	lda	[%i2+%o4]0x89,%f16	! %f16 = fbf9d6b7
!	Mem[0000000030081410] = ff000000, %l7 = 0000000000000068
	lduwa	[%i2+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[00000000300c1408] = 037a4374d8188706, %f26 = 74592f4e 299bb4bb
	ldda	[%i3+%o4]0x89,%f26	! %f26 = 037a4374 d8188706
!	Mem[0000000010101428] = fb58c9c8, %l7 = 00000000ff000000
	ldsha	[%i4+0x028]%asi,%l7	! %l7 = fffffffffffffb58
!	Mem[0000000030001410] = 64e76351, %l1 = 00000000f55387cf
	ldsha	[%i0+%o5]0x81,%l1	! %l1 = 00000000000064e7
!	Mem[0000000010041408] = 77000eff, %l3 = fc01d20a2d60334d
	ldsba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000077
!	Mem[0000000030041408] = a4ffffff, %l3 = 0000000000000077
	lduwa	[%i1+%o4]0x81,%l3	! %l3 = 00000000a4ffffff
!	Mem[0000000021800140] = 3c3bf4c2, %l3 = 00000000a4ffffff
	ldsha	[%o3+0x140]%asi,%l3	! %l3 = 0000000000003c3b
!	Starting 10 instruction Store Burst
!	%l2 = ff29857a, %l3 = 00003c3b, Mem[0000000030041400] = f6d90cff d958b216
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = ff29857a 00003c3b

p0_label_24:
!	%l1 = 00000000000064e7, Mem[0000000010101420] = 0c77e2b3
	sth	%l1,[%i4+0x020]		! Mem[0000000010101420] = 64e7e2b3
!	Mem[00000000100c1400] = 64e76351, %l0 = 00000000a731751a
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 00000064000000ff
!	Mem[0000000030141400] = ff932556, %l6 = 00000000d8188706
	swapa	[%i5+%g0]0x81,%l6	! %l6 = 00000000ff932556
!	%l7 = fffffffffffffb58, Mem[0000000020800000] = 6368261d, %asi = 80
	stha	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = fb58261d
!	Mem[0000000030181410] = b20fc2d9, %l0 = 0000000000000064
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 00000000b20fc2d9
!	Mem[0000000010081410] = 00000000, %l0 = 00000000b20fc2d9
	swapa	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000
!	%l2 = 00000000ff29857a, Mem[0000000010141410] = 068718d8
	stha	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 0687857a
!	Mem[0000000010041410] = 88165e09, %l2 = 00000000ff29857a
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 0000000088165e09
!	Mem[0000000030041408] = a4ffffff, %l6 = 00000000ff932556
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 00000000a4ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %f12 = ff9516cc
	lda	[%i0+0x008]%asi,%f12	! %f12 = ff000000

p0_label_25:
!	Mem[0000000010041408] = ff6dd733ff0e0077, %l4 = 00000000d8188706
	ldxa	[%i1+%o4]0x88,%l4	! %l4 = ff6dd733ff0e0077
!	Mem[0000000010001410] = 000000a4, %f2  = 982a3c92
	lda	[%i0+%o5]0x88,%f2 	! %f2 = 000000a4
!	Mem[0000000010081408] = cc1695ff, %l2 = 0000000088165e09
	ldsba	[%i2+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001408] = d9c20fb2000000ff, %l0 = 0000000000000000
	ldxa	[%i0+%o4]0x88,%l0	! %l0 = d9c20fb2000000ff
!	Mem[0000000010081410] = b20fc2d9, %l0 = d9c20fb2000000ff
	ldsba	[%i2+%o5]0x88,%l0	! %l0 = ffffffffffffffd9
!	Mem[0000000010181410] = 154bff9d, %l4 = ff6dd733ff0e0077
	ldsba	[%i6+%o5]0x88,%l4	! %l4 = ffffffffffffff9d
!	Mem[0000000010101400] = 0000e3ec, %l6 = 00000000a4ffffff
	lduwa	[%i4+%g0]0x80,%l6	! %l6 = 000000000000e3ec
!	Mem[0000000010101408] = 9a421fd5, %l2 = ffffffffffffffff
	ldsba	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffffff9a
!	Mem[0000000021800140] = 3c3bf4c2, %l3 = 0000000000003c3b
	ldsha	[%o3+0x140]%asi,%l3	! %l3 = 0000000000003c3b
!	Starting 10 instruction Store Burst
!	%l5 = 00000000baef4ef8, Mem[0000000030101400] = 6d887bae
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 6d887bf8

p0_label_26:
!	Mem[0000000010001408] = 000000ff, %l6 = 000000000000e3ec
	swapa	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181400] = d9c20fb2, %l4 = ffffffffffffff9d
	swapa	[%i6+%g0]0x81,%l4	! %l4 = 00000000d9c20fb2
!	%f26 = 037a4374 d8188706, Mem[0000000010101408] = d51f429a dd8743e8
	stda	%f26,[%i4+%o4]0x88	! Mem[0000000010101408] = 037a4374 d8188706
!	Mem[000000001004143c] = dd11c2da, %l1 = 00000000000064e7, %asi = 80
	swapa	[%i1+0x03c]%asi,%l1	! %l1 = 00000000dd11c2da
!	%l5 = 00000000baef4ef8, Mem[00000000300c1408] = 068718d874437a03
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000baef4ef8
!	Mem[000000001014140b] = ffc40000, %l1 = 00000000dd11c2da
	ldstub	[%i5+0x00b],%l1		! %l1 = 00000000000000ff
!	%l2 = ffffffffffffff9a, Mem[0000000021800180] = 00dc809b
	sth	%l2,[%o3+0x180]		! Mem[0000000021800180] = ff9a809b
!	%l0 = ffffffffffffffd9, imm = fffffffffffff4b3, %l4 = 00000000d9c20fb2
	sub	%l0,-0xb4d,%l4		! %l4 = 0000000000000b26
!	%l5 = 00000000baef4ef8, Mem[0000000010141408] = ffc400ff
	stwa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = baef4ef8
!	Starting 10 instruction Load Burst
!	Mem[0000000010101428] = fb58c9c8390dda80, %l7 = fffffffffffffb58
	ldxa	[%i4+0x028]%asi,%l7	! %l7 = fb58c9c8390dda80

p0_label_27:
!	Mem[0000000030101408] = 61951c65 59f1e764, %l6 = 000000ff, %l7 = 390dda80
	ldda	[%i4+%o4]0x89,%l6	! %l6 = 0000000059f1e764 0000000061951c65
!	Mem[0000000010141400] = 00000000, %l0 = ffffffffffffffd9
	lduba	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l4 = 0000000000000b26
	ldsw	[%i5+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000030001408] = e4ede0b700000055, %f24 = 0000e3ec 157839c2
	ldda	[%i0+%o4]0x89,%f24	! %f24 = e4ede0b7 00000055
!	Mem[0000000010181418] = 32eb21cc53eaa308, %l4 = 0000000000000000
	ldx	[%i6+0x018],%l4		! %l4 = 32eb21cc53eaa308
!	Mem[0000000030141408] = bbeb0a9b, %l2 = ffffffffffffff9a
	lduba	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000bb
!	Mem[0000000010181400] = 162bf0f2, %l4 = 32eb21cc53eaa308
	lduwa	[%i6+%g0]0x80,%l4	! %l4 = 00000000162bf0f2
!	Mem[00000000100c1400] = ffe76351, %f23 = 8788c6cd
	lda	[%i3+%g0]0x80,%f23	! %f23 = ffe76351
!	Mem[0000000010101408] = 037a4374d8188706, %l6 = 0000000059f1e764
	ldxa	[%i4+%o4]0x88,%l6	! %l6 = 037a4374d8188706
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000bb, Mem[0000000010081410] = d9c20fb2ffc40000
	stxa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000000000bb

p0_label_28:
!	Mem[0000000020800000] = fb58261d, %l7 = 0000000061951c65
	lduh	[%o1+%g0],%l7		! %l7 = 000000000000fb58
!	%l1 = 0000000000000000, Mem[0000000030081400] = 9293cbc77140c4ff
	stxa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000000000
!	%l2 = 000000bb, %l3 = 00003c3b, Mem[0000000010141418] = ce367da3 d753121c
	stda	%l2,[%i5+0x018]%asi	! Mem[0000000010141418] = 000000bb 00003c3b
!	%f2  = 000000a4, %f4  = 64e76351, %f17 = ffffffff
	fdivs	%f2 ,%f4 ,%f17		! %f17 = 00000000
!	Mem[0000000010181410] = 9dff4b15, %l5 = 00000000baef4ef8
	ldswa	[%i6+%o5]0x80,%l5	! %l5 = ffffffff9dff4b15
!	%l4 = 162bf0f2, %l5 = 9dff4b15, Mem[0000000010101420] = 64e7e2b3 19be1820
	std	%l4,[%i4+0x020]		! Mem[0000000010101420] = 162bf0f2 9dff4b15
!	%f5  = f55387cf, Mem[0000000030001408] = 55000000
	sta	%f5 ,[%i0+%o4]0x81	! Mem[0000000030001408] = f55387cf
!	%l0 = 0000000000000000, Mem[000000001014142d] = 41fdfffc
	stb	%l0,[%i5+0x02d]		! Mem[000000001014142c] = 4100fffc
!	Mem[0000000010101414] = decc7b7c, %l6 = d8188706, %l1 = 00000000
	add	%i4,0x14,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 00000000decc7b7c
!	Starting 10 instruction Load Burst
!	Mem[000000001010141c] = 1a7d7397, %l6 = 037a4374d8188706
	lduha	[%i4+0x01e]%asi,%l6	! %l6 = 0000000000007397

p0_label_29:
!	Mem[0000000010181400] = 162bf0f2, %f16 = fbf9d6b7
	lda	[%i6+%g0]0x80,%f16	! %f16 = 162bf0f2
!	Mem[0000000010141410] = 7a858706, %l5 = ffffffff9dff4b15
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = 0000000000007a85
!	Mem[00000000300c1408] = f84eefba00000000, %l2 = 00000000000000bb
	ldxa	[%i3+%o4]0x89,%l2	! %l2 = f84eefba00000000
!	Mem[0000000010081410] = bb00000000000000, %f22 = 1a7531a7 ffe76351
	ldda	[%i2+%o5]0x88,%f22	! %f22 = bb000000 00000000
!	Mem[00000000100c1410] = 6a13e734, %f21 = 41fdddfc
	lda	[%i3+%o5]0x88,%f21	! %f21 = 6a13e734
!	Mem[0000000010001410] = 000000a4, %f4  = 64e76351
	lda	[%i0+%o5]0x88,%f4 	! %f4 = 000000a4
!	Mem[0000000010041400] = ff6dd733b211e0cb, %l0 = 0000000000000000
	ldxa	[%i1+0x000]%asi,%l0	! %l0 = ff6dd733b211e0cb
!	Mem[0000000030181408] = a731751af55387cf, %l0 = ff6dd733b211e0cb
	ldxa	[%i6+%o4]0x81,%l0	! %l0 = a731751af55387cf
!	Mem[0000000010181408] = 77990000 154bff9d, %l0 = f55387cf, %l1 = decc7b7c
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 00000000154bff9d 0000000077990000
!	Starting 10 instruction Store Burst
!	%f12 = ff000000, Mem[0000000010041408] = ff0e0077
	sta	%f12,[%i1+%o4]0x88	! Mem[0000000010041408] = ff000000

p0_label_30:
!	%l2 = 00000000, %l3 = 00003c3b, Mem[0000000010041408] = 000000ff 33d76dff
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 00003c3b
!	%l1 = 0000000077990000, Mem[0000000010041408] = 00000000
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000007397
	ldstuba	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041410] = 7a8529ff, %l4 = 00000000162bf0f2
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 000000007a8529ff
!	Mem[0000000010081420] = d3c415d3c24b0ab3, %l4 = 000000007a8529ff, %l5 = 0000000000007a85
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l4,%l5	! %l5 = d3c415d3c24b0ab3
!	%l5 = d3c415d3c24b0ab3, Mem[0000000010041410] = f2f02b16
	stha	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = f2f00ab3
!	%l2 = 00000000, %l3 = 00003c3b, Mem[00000000100c1400] = ffe76351 f55387cf
	std	%l2,[%i3+%g0]		! Mem[00000000100c1400] = 00000000 00003c3b
!	Mem[0000000010141410] = 0687857a, %l1 = 0000000077990000
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 000000000687857a
!	Mem[0000000030141400] = 068718d8, %l4 = 000000007a8529ff
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 00000000068718d8
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00009977, %l5 = d3c415d3c24b0ab3
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_31:
!	Mem[0000000030081400] = 00000000, %l0 = 00000000154bff9d
	lduha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = d9c20fb20000e3ec, %f8  = ff000000 b20fc2d9
	ldda	[%i0+%o4]0x88,%f8 	! %f8  = d9c20fb2 0000e3ec
!	Mem[0000000030001400] = b211e068, %l6 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l6	! %l6 = ffffffffb211e068
!	Mem[0000000030081410] = ff000000, %l6 = ffffffffb211e068
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141408] = bbeb0a9b, %l1 = 000000000687857a
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffffbbeb
!	Mem[0000000030041400] = 7a8529ff, %l3 = 0000000000003c3b
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 000000007a8529ff
!	Mem[0000000010001400] = 982a3c92, %f10 = a41b16cc
	lda	[%i0+%g0]0x88,%f10	! %f10 = 982a3c92
!	Mem[0000000030181408] = a731751a, %l3 = 000000007a8529ff
	lduwa	[%i6+%o4]0x81,%l3	! %l3 = 00000000a731751a
!	Mem[0000000010141410] = 00009977, %l2 = f84eefba00000000
	lduwa	[%i5+%o5]0x80,%l2	! %l2 = 0000000000009977
!	Starting 10 instruction Store Burst
!	%f2  = 000000a4 b7e0ede4, %l0 = 0000000000000000
!	Mem[0000000010081428] = 0000000000009977
	add	%i2,0x028,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_P ! Mem[0000000010081428] = 0000000000009977

p0_label_32:
!	Mem[0000000010081408] = cc1695ff, %l7 = 000000000000fb58
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010001410] = a4000000, %l2 = 0000000000009977
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 00000000a4000000
!	Mem[0000000030041400] = ff29857a, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 0000007a000000ff
!	Mem[0000000010081408] = cc1695ff, %l6 = 00000000000000ff
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%l1 = ffffffffffffbbeb, Mem[00000000300c1400] = d8188706
	stwa	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffbbeb
!	%f8  = d9c20fb2 0000e3ec, Mem[0000000010041400] = ff6dd733 b211e0cb
	stda	%f8 ,[%i1+0x000]%asi	! Mem[0000000010041400] = d9c20fb2 0000e3ec
!	%l4 = 00000000068718d8, Mem[0000000030081410] = ff000000
	stha	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 18d80000
!	Mem[0000000010141400] = 00000000, %l2 = 00000000a4000000
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = 562593ff, %l6 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 162bf0f2, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 00000000162bf0f2

p0_label_33:
!	Mem[00000000100c1410] = 798483eb6a13e734, %f20 = b20fc2d9 6a13e734
	ldda	[%i3+%o5]0x88,%f20	! %f20 = 798483eb 6a13e734
!	Mem[00000000300c1410] = ffff87068f289034, %f4  = 000000a4 f55387cf
	ldda	[%i3+%o5]0x81,%f4 	! %f4  = ffff8706 8f289034
!	Mem[0000000020800000] = fb58261d, %l2 = 00000000162bf0f2
	ldsb	[%o1+0x001],%l2		! %l2 = 0000000000000058
!	Mem[00000000100c1408] = df2eb5da, %l6 = 00000000000000ff
	ldsha	[%i3+%o4]0x88,%l6	! %l6 = ffffffffffffb5da
!	Mem[0000000030001408] = cf8753f5, %l3 = 00000000a731751a
	lduwa	[%i0+%o4]0x89,%l3	! %l3 = 00000000cf8753f5
!	Mem[0000000010081418] = 4a16708c, %l5 = 000000000000007a
	ldsha	[%i2+0x018]%asi,%l5	! %l5 = 0000000000004a16
!	Mem[0000000010141400] = a4000000, %l6 = ffffffffffffb5da
	lduha	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 779994fd, %f18 = b211e0cb
	lda	[%i1+%o5]0x81,%f18	! %f18 = 779994fd
!	Mem[0000000030041410] = cd4cca3dfd949977, %f6  = ce367da3 d753121c
	ldda	[%i1+%o5]0x89,%f6 	! %f6  = cd4cca3d fd949977
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030041400] = ff8529ff
	stwa	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000

p0_label_34:
!	Mem[0000000030081408] = b7d6f9fb, %l4 = 00000000068718d8
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 000000b7000000ff
!	Mem[0000000010001410] = 00009977, %l6 = 00000000, %l1 = ffffbbeb
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 0000000000009977
!	Mem[0000000010141414] = 00000048, %l6 = 00000000, %l5 = 00004a16
	add	%i5,0x14,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 0000000000000048
!	%l0 = 0000000000000000, Mem[0000000030181410] = 64000000
	stha	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	Mem[0000000030081400] = 00000000, %l7 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%f30 = 109da19c fbf9d6b7, Mem[0000000010141400] = 000000a4 00006d45
	stda	%f30,[%i5+0x000]%asi	! Mem[0000000010141400] = 109da19c fbf9d6b7
!	%l4 = 000000b7, %l5 = 00000048, Mem[0000000030081410] = 18d80000 88165e09
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000b7 00000048
!	%l3 = 00000000cf8753f5, Mem[0000000010001408] = d9c20fb20000e3ec
	stxa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000cf8753f5
!	%l6 = 0000000000000000, Mem[00000000100c1408] = dab52edf
	stba	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00b52edf
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = 87febdaf1132255f, %l2 = 0000000000000058
	ldxa	[%i3+0x020]%asi,%l2	! %l2 = 87febdaf1132255f

p0_label_35:
!	Mem[0000000030081408] = ffd6f9fb, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l7	! %l7 = ffffffffffd6f9fb
!	Mem[0000000030041400] = 00000000, %l6 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ff8958bc, %l1 = 0000000000009977
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffff89
!	Mem[0000000010181430] = 0000e3ec157839c2, %l2 = 87febdaf1132255f
	ldxa	[%i6+0x030]%asi,%l2	! %l2 = 0000e3ec157839c2
!	Mem[0000000030081400] = 00000000ff000000, %l2 = 0000e3ec157839c2
	ldxa	[%i2+%g0]0x89,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010001408] = f55387cf 00000000, %l4 = 000000b7, %l5 = 00000048
	ldda	[%i0+0x008]%asi,%l4	! %l4 = 00000000f55387cf 0000000000000000
!	Mem[0000000010081400] = 0000ff9d, %l4 = 00000000f55387cf
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 000000b7, %l1 = ffffffffffffff89
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 64e7f159, %l0 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l0	! %l0 = 0000000064e7f159
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 64e7f159, %l5 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 00000064000000ff

p0_label_36:
!	%l1 = 0000000000000000, Mem[0000000030081410] = 000000b700000048
	stxa	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	%l0 = 64e7f159, %l1 = 00000000, Mem[0000000010041408] = 00000000 00003c3b
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 64e7f159 00000000
!	Mem[00000000100c1428] = ed685f56, %l4 = 0000000000000000, %asi = 80
	swapa	[%i3+0x028]%asi,%l4	! %l4 = 00000000ed685f56
!	%l0 = 0000000064e7f159, Mem[0000000030081400] = 000000ff
	stwa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 64e7f159
!	%l4 = 00000000ed685f56, Mem[0000000030141400] = ff29857a
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 5f56857a
!	%l5 = 0000000000000064, Mem[0000000010181410] = 154bff9d
	stba	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 154bff64
!	Mem[00000000100c1438] = 4772839e7558bfbd, %l6 = 0000000000000000, %l7 = ffffffffffd6f9fb
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = 4772839e7558bfbd
!	Mem[0000000030081408] = fbf9d6ff, %l1 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030141400] = 5f56857a, %l0 = 0000000064e7f159
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 000000005f56857a
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 4dff0847, %l6 = 0000000000000000
	lduh	[%o0+%g0],%l6		! %l6 = 0000000000004dff

p0_label_37:
!	Mem[00000000201c0000] = 4dff0847, %l6 = 0000000000004dff
	lduh	[%o0+%g0],%l6		! %l6 = 0000000000004dff
!	Mem[0000000010081408] = cf8753f5cc1695ff, %l5 = 0000000000000064
	ldxa	[%i2+%o4]0x88,%l5	! %l5 = cf8753f5cc1695ff
!	Mem[0000000010001400] = 982a3c92, %l2 = 00000000ff000000
	ldswa	[%i0+%g0]0x88,%l2	! %l2 = ffffffff982a3c92
!	Mem[0000000030101410] = a731751a, %l1 = 00000000000000ff
	ldsba	[%i4+%o5]0x81,%l1	! %l1 = ffffffffffffffa7
!	Mem[0000000030001410] = 64e76351, %f15 = e84387dd
	lda	[%i0+%o5]0x81,%f15	! %f15 = 64e76351
!	Mem[0000000030041400] = 00000000, %l6 = 0000000000004dff
	lduwa	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181438] = fd312cf8, %l0 = 000000005f56857a
	ldub	[%i6+0x038],%l0		! %l0 = 00000000000000fd
!	Mem[0000000030041400] = 00000000, %l7 = 4772839e7558bfbd
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = 59f1e764, %l6 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l6	! %l6 = 000000000000e764
!	Starting 10 instruction Store Burst
!	%f2  = 000000a4, Mem[0000000030081400] = 59f1e764
	sta	%f2 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000a4

p0_label_38:
!	%f24 = e4ede0b7, Mem[00000000100c143c] = 7558bfbd
	sta	%f24,[%i3+0x03c]%asi	! Mem[00000000100c143c] = e4ede0b7
!	Mem[0000000010181410] = 154bff64, %l3 = 00000000cf8753f5
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 00000000154bff64
!	%l3 = 00000000154bff64, Mem[0000000030081410] = 00000000
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 64000000
!	Mem[0000000010041434] = 1778ea23, %l6 = 000000000000e764, %asi = 80
	swapa	[%i1+0x034]%asi,%l6	! %l6 = 000000001778ea23
!	%f14 = 9a421fd5, Mem[00000000100c1410] = 6a13e734
	sta	%f14,[%i3+%o5]0x88	! Mem[00000000100c1410] = 9a421fd5
!	%f28 = 0d2123e9 34e7136a, %l6 = 000000001778ea23
!	Mem[0000000030001430] = ff9516cc5e6bb831
	add	%i0,0x030,%g1
	stda	%f28,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030001430] = 6a13e734e923210d
!	Mem[0000000030001400] = b211e068, %l2 = ffffffff982a3c92
	swapa	[%i0+%g0]0x89,%l2	! %l2 = 00000000b211e068
!	%f30 = 109da19c fbf9d6b7, Mem[0000000030041400] = 00000000 3b3c0000
	stda	%f30,[%i1+%g0]0x81	! Mem[0000000030041400] = 109da19c fbf9d6b7
!	%f0  = cbe011b2 33d76dda 000000a4 b7e0ede4
!	%f4  = ffff8706 8f289034 cd4cca3d fd949977
!	%f8  = d9c20fb2 0000e3ec 982a3c92 4e6eb823
!	%f12 = ff000000 5e6bb831 9a421fd5 64e76351
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010041428] = 9fb6d02e 3a505a63, %l0 = 000000fd, %l1 = ffffffa7
	ldda	[%i1+0x028]%asi,%l0	! %l0 = 000000009fb6d02e 000000003a505a63

p0_label_39:
!	Mem[0000000010141400] = 9ca19d10, %l6 = 000000001778ea23
	ldswa	[%i5+%g0]0x88,%l6	! %l6 = ffffffff9ca19d10
!	Mem[0000000020800000] = fb58261d, %l1 = 000000003a505a63
	lduba	[%o1+0x001]%asi,%l1	! %l1 = 0000000000000058
!	Mem[0000000010141408] = baef4ef8, %l5 = cf8753f5cc1695ff
	lduba	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ba
!	Mem[0000000010041410] = f2f00ab3, %l0 = 000000009fb6d02e
	ldsha	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000ab3
!	Mem[0000000010141410] = 00009977, %l7 = 0000000000000000
	lduha	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 0000ff9d, %l5 = 00000000000000ba
	lduwa	[%i2+%g0]0x80,%l5	! %l5 = 000000000000ff9d
!	Mem[0000000010181400] = 162bf0f2ba439dac, %l2 = 00000000b211e068
	ldxa	[%i6+0x000]%asi,%l2	! %l2 = 162bf0f2ba439dac
!	Mem[0000000010101400] = 0000e3ec, %l1 = 0000000000000058
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ff8958bc, %l6 = ffffffff9ca19d10
	lduba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000089
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ff9d, Mem[0000000010041400] = d9c20fb2
	stwa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000ff9d

p0_label_40:
!	%f4  = ffff8706 8f289034, %l2 = 162bf0f2ba439dac
!	Mem[00000000100c1430] = 33b36bc937dba7b4
	add	%i3,0x030,%g1
	stda	%f4,[%g1+%l2]ASI_PST8_PL ! Mem[00000000100c1430] = 33b3288f3787a7ff
!	Mem[0000000030081400] = 000000a4, %l6 = 0000000000000089
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000a4
!	Mem[000000001018140f] = 00009977, %l0 = 0000000000000ab3
	ldstuba	[%i6+0x00f]%asi,%l0	! %l0 = 00000077000000ff
!	%l2 = 162bf0f2ba439dac, Mem[0000000010141408] = baef4ef8
	stba	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = acef4ef8
!	%l4 = ed685f56, %l5 = 0000ff9d, Mem[0000000010101408] = d8188706 037a4374
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = ed685f56 0000ff9d
!	%l3 = 00000000154bff64, Mem[0000000030181408] = a731751a
	stha	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = ff64751a
!	Mem[0000000010041410] = b30af0f2, %l6 = 00000000000000a4
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 000000b3000000ff
!	Mem[0000000030081410] = 64000000, %l2 = 162bf0f2ba439dac
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 00000064000000ff
!	%l0 = 0000000000000077, Mem[0000000030101408] = 59f1e7ff
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 59f1e777
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff000000, %l5 = 000000000000ff9d
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffffff

p0_label_41:
!	Mem[0000000030081400] = 89000000, %l0 = 0000000000000077
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 0000000089000000
!	Mem[0000000010141408] = acef4ef8, %l2 = 0000000000000064
	lduha	[%i5+%o4]0x80,%l2	! %l2 = 000000000000acef
!	Mem[0000000010101408] = 565f68ed, %l1 = 0000000000000000
	lduha	[%i4+%o4]0x80,%l1	! %l1 = 000000000000565f
!	Mem[00000000100c1400] = 3b3c000000000000, %l4 = 00000000ed685f56
	ldxa	[%i3+%g0]0x88,%l4	! %l4 = 3b3c000000000000
!	Mem[00000000201c0000] = 4dff0847, %l3 = 00000000154bff64
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000004dff
!	Mem[0000000010181424] = 4e48ad12, %l1 = 000000000000565f
	ldswa	[%i6+0x024]%asi,%l1	! %l1 = 000000004e48ad12
!	Mem[0000000010001408] = 00000000 cf8753f5, %l2 = 0000acef, %l3 = 00004dff
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 00000000cf8753f5 0000000000000000
!	Mem[0000000030081410] = ff000000, %l2 = 00000000cf8753f5
	ldswa	[%i2+%o5]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[00000000100c1410] = d51f429aeb838479, %l4 = 3b3c000000000000
	ldx	[%i3+%o5],%l4		! %l4 = d51f429aeb838479
!	Starting 10 instruction Store Burst
!	%l4 = d51f429aeb838479, Mem[0000000010101400] = ece30000
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = ece38479

p0_label_42:
!	Mem[0000000030041408] = a4000000, %l6 = 00000000000000b3
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 00000000a4000000
!	%f16 = 162bf0f2 00000000 779994fd d753121c
!	%f20 = 798483eb 6a13e734 bb000000 00000000
!	%f24 = e4ede0b7 00000055 037a4374 d8188706
!	%f28 = 0d2123e9 34e7136a 109da19c fbf9d6b7
	stda	%f16,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	%f11 = 4e6eb823, Mem[0000000010041408] = 59f1e764
	sta	%f11,[%i1+%o4]0x88	! Mem[0000000010041408] = 4e6eb823
!	%l6 = 00000000a4000000, Mem[0000000030041410] = 0687ffff
	stha	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 06870000
!	%l4 = d51f429aeb838479, Mem[0000000010101408] = 565f68ed, %asi = 80
	stwa	%l4,[%i4+0x008]%asi	! Mem[0000000010101408] = eb838479
!	%l0 = 0000000089000000, Mem[0000000010081408] = ff9516cc
	stwa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 89000000
!	%l2 = ffffffffff000000, Mem[00000000100c1400] = 00000000
	stba	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%f14 = 9a421fd5, Mem[0000000030141400] = 00000000
	sta	%f14,[%i5+%g0]0x89	! Mem[0000000030141400] = 9a421fd5
!	%f14 = 9a421fd5, Mem[0000000010141400] = 109da19c
	sta	%f14,[%i5+%g0]0x80	! Mem[0000000010141400] = 9a421fd5
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffc40000, %l5 = ffffffffffffffff
	ldsha	[%i4+%o5]0x80,%l5	! %l5 = ffffffffffffffc4

p0_label_43:
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010141400] = 9a421fd5 fbf9d6b7, %l6 = a4000000, %l7 = 00000000
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 000000009a421fd5 00000000fbf9d6b7
!	Mem[0000000030181400] = ffffff9d000000ff, %l4 = d51f429aeb838479
	ldxa	[%i6+%g0]0x81,%l4	! %l4 = ffffff9d000000ff
!	Mem[0000000030041400] = cbe011b2, %l7 = 00000000fbf9d6b7
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000cb
!	Mem[00000000100c1438] = 4772839e, %l0 = 0000000089000000
	ldsb	[%i3+0x03b],%l0		! %l0 = ffffffffffffff9e
!	Mem[0000000010101400] = 7984e3ec0000e764, %f6  = cd4cca3d fd949977
	ldda	[%i4+%g0]0x80,%f6 	! %f6  = 7984e3ec 0000e764
!	Mem[0000000010181400] = f2f02b16, %f30 = 109da19c
	lda	[%i6+%g0]0x88,%f30	! %f30 = f2f02b16
!	Mem[000000001008142c] = 00009977, %l0 = ffffffffffffff9e
	lduwa	[%i2+0x02c]%asi,%l0	! %l0 = 0000000000009977
!	Mem[0000000010041438] = 1549dfee 000064e7, %l6 = 9a421fd5, %l7 = 000000cb
	ldda	[%i1+0x038]%asi,%l6	! %l6 = 000000001549dfee 00000000000064e7
!	Mem[0000000010041410] = ff0af0f2, %l4 = ffffff9d000000ff
	ldsha	[%i1+%o5]0x80,%l4	! %l4 = ffffffffffffff0a
!	Starting 10 instruction Store Burst
!	%f26 = 037a4374 d8188706, Mem[0000000010041420] = 65e64233 ead4a1c9
	stda	%f26,[%i1+0x020]%asi	! Mem[0000000010041420] = 037a4374 d8188706

p0_label_44:
!	%l1 = 000000004e48ad12, Mem[00000000211c0001] = ff8958bc, %asi = 80
	stba	%l1,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff1258bc
!	Mem[0000000030181410] = 00000000, %l2 = ffffffffff000000
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010101430] = f1cfdc0a 13fe7b7d
	stda	%l2,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000 00000000
!	Mem[0000000010001410] = 77990000, %l5 = ffffffffffffffc4
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 0000000077990000
!	%l3 = 0000000000000000, Mem[0000000010181418] = 32eb21cc
	sth	%l3,[%i6+0x018]		! Mem[0000000010181418] = 000021cc
!	%l0 = 0000000000009977, Mem[000000001014142c] = 4100fffc, %asi = 80
	stba	%l0,[%i5+0x02c]%asi	! Mem[000000001014142c] = 7700fffc
!	%l1 = 000000004e48ad12, Mem[0000000030141408] = 1c1253d7
	stba	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 121253d7
!	Mem[0000000010081410] = 00000000, %l6 = 000000001549dfee
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%f20 = 798483eb 6a13e734, Mem[0000000010141410] = 00009977 00000048
	stda	%f20,[%i5+%o5]0x80	! Mem[0000000010141410] = 798483eb 6a13e734
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = eedf4915, %f7  = 0000e764
	lda	[%i2+%o5]0x88,%f7 	! %f7 = eedf4915

p0_label_45:
!	Mem[00000000211c0000] = ff1258bc, %l0 = 0000000000009977
	ldsb	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030181410] = ff000000, %l2 = 0000000000000000
	ldsha	[%i6+%o5]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[00000000300c1408] = 000000ff, %l5 = 0000000077990000
	ldsha	[%i3+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041410] = ff0af0f2, %l0 = ffffffffffffffff
	ldsba	[%i1+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Code Fragment 3
p0_fragment_1:
!	%l0 = ffffffffffffffff
	setx	0x6979ed7826ccb6f0,%g7,%l0 ! %l0 = 6979ed7826ccb6f0
!	%l1 = 000000004e48ad12
	setx	0xd845cabfda516691,%g7,%l1 ! %l1 = d845cabfda516691
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6979ed7826ccb6f0
	setx	0xe0d87188435de02b,%g7,%l0 ! %l0 = e0d87188435de02b
!	%l1 = d845cabfda516691
	setx	0xb990635043d8f6e2,%g7,%l1 ! %l1 = b990635043d8f6e2
!	Mem[0000000010181410] = f55387cf, %l4 = ffffffffffffff0a
	ldswa	[%i6+%o5]0x80,%l4	! %l4 = fffffffff55387cf
!	Mem[0000000010101400] = 7984e3ec, %l7 = 00000000000064e7
	ldsba	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000079
!	Mem[0000000010001408] = cf8753f5, %l5 = 00000000000000ff
	ldswa	[%i0+%o4]0x88,%l5	! %l5 = ffffffffcf8753f5
!	Mem[0000000030001408] = f55387cf, %l2 = ffffffffffffff00
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 000000000000f553
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 9547dba4, %l3 = 00000000, %l6 = 00000000
	add	%i6,0x28,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 000000009547dba4

p0_label_46:
!	%l7 = 0000000000000079, Mem[0000000030081410] = ff000000
	stha	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 00790000
!	%l3 = 0000000000000000, Mem[0000000010181410] = f55387cf
	stba	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 005387cf
!	Mem[0000000030001410] = 64e76351, %l4 = fffffffff55387cf
	swapa	[%i0+%o5]0x81,%l4	! %l4 = 0000000064e76351
!	Mem[0000000010041430] = aa74498d, %l4 = 0000000064e76351, %asi = 80
	swapa	[%i1+0x030]%asi,%l4	! %l4 = 00000000aa74498d
!	%l7 = 0000000000000079, Mem[0000000030141408] = d7531212
	stha	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = d7530079
!	Mem[0000000030101400] = f87b886d, %l6 = 000000009547dba4
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 000000f8000000ff
!	Mem[0000000030181408] = 1a7564ff, %l0 = e0d87188435de02b
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 000000001a7564ff
!	Mem[0000000030101410] = 1a7531a7, %l1 = b990635043d8f6e2
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 000000a7000000ff
!	%l4 = 00000000aa74498d, Mem[00000000300c1408] = 000000ff
	stba	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000008d
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = acef4ef8b7e0ede4, %l1 = 00000000000000a7
	ldxa	[%i5+%o4]0x80,%l1	! %l1 = acef4ef8b7e0ede4

p0_label_47:
!	Mem[00000000201c0000] = 4dff0847, %l1 = acef4ef8b7e0ede4
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 000000000000004d
!	Mem[00000000100c1400] = 00000000, %l6 = 00000000000000f8
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = 798483eb6a13e734, %l6 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l6	! %l6 = 798483eb6a13e734
!	Mem[00000000100c1400] = 0000000000003c3b, %f4  = ffff8706 8f289034
	ldda	[%i3+0x000]%asi,%f4 	! %f4  = 00000000 00003c3b
!	Mem[0000000030141400] = 9a421fd5, %l4 = 00000000aa74498d
	lduwa	[%i5+%g0]0x89,%l4	! %l4 = 000000009a421fd5
!	Mem[0000000010141410] = 798483eb, %l6 = 798483eb6a13e734
	lduwa	[%i5+%o5]0x80,%l6	! %l6 = 00000000798483eb
!	Mem[0000000030041410] = 00008706, %l3 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = 0000000000008706
!	Mem[0000000010081410] = 1549dfee000000bb, %l1 = 000000000000004d
	ldxa	[%i2+%o5]0x80,%l1	! %l1 = 1549dfee000000bb
!	Mem[0000000030081410] = 00007900, %l4 = 000000009a421fd5
	lduwa	[%i2+%o5]0x89,%l4	! %l4 = 0000000000007900
!	Starting 10 instruction Store Burst
!	%f6  = 7984e3ec eedf4915, Mem[0000000030181408] = 435de02b cf8753f5
	stda	%f6 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 7984e3ec eedf4915

p0_label_48:
!	%l0 = 000000001a7564ff, Mem[0000000010101408] = eb838479
	stha	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 64ff8479
!	%l2 = 000000000000f553, Mem[0000000010141400] = d51f429a
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = d51f4253
!	Mem[000000001018141c] = 53eaa308, %l7 = 0000000000000079
	ldstub	[%i6+0x01c],%l7		! %l7 = 00000053000000ff
!	Mem[0000000030181410] = ff000000, %l6 = 00000000798483eb
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 00000000ff000000
!	%f0  = cbe011b2 33d76dda, Mem[0000000010181410] = 005387cf 00009977
	stda	%f0 ,[%i6+%o5]0x80	! Mem[0000000010181410] = cbe011b2 33d76dda
!	%f10 = 982a3c92 4e6eb823, Mem[0000000010001408] = f55387cf 00000000
	stda	%f10,[%i0+%o4]0x80	! Mem[0000000010001408] = 982a3c92 4e6eb823
!	%l6 = 00000000ff000000, Mem[0000000030081410] = 0079000000000000
	stxa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000ff000000
!	%l3 = 0000000000008706, Mem[0000000010081408] = 89000000
	stha	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 87060000
!	Mem[00000000100c1400] = 00000000, %l4 = 0000000000007900
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000089, %l7 = 0000000000000053
	ldswa	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000089

p0_label_49:
!	Mem[0000000010041418] = 73f485ac, %l2 = 000000000000f553
	lduha	[%i1+0x01a]%asi,%l2	! %l2 = 00000000000085ac
!	Mem[0000000030181408] = 7984e3eceedf4915, %l3 = 0000000000008706
	ldxa	[%i6+%o4]0x89,%l3	! %l3 = 7984e3eceedf4915
!	Mem[0000000010041434] = 0000e764, %l0 = 000000001a7564ff
	ldsh	[%i1+0x036],%l0		! %l0 = ffffffffffffe764
!	Mem[00000000100c1410] = 9a421fd5, %l1 = 1549dfee000000bb
	lduha	[%i3+%o5]0x88,%l1	! %l1 = 0000000000001fd5
!	Mem[00000000100c1408] = df2eb500, %l1 = 0000000000001fd5
	lduwa	[%i3+%o4]0x88,%l1	! %l1 = 00000000df2eb500
!	Mem[00000000100c1400] = 000000ff, %l6 = 00000000ff000000
	lduba	[%i3+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1408] = 00b52edfb211e0cb, %l5 = ffffffffcf8753f5
	ldxa	[%i3+%o4]0x80,%l5	! %l5 = 00b52edfb211e0cb
!	Mem[0000000010001418] = 1a7531a7, %l3 = 7984e3eceedf4915
	ldub	[%i0+0x01b],%l3		! %l3 = 00000000000000a7
!	Mem[0000000010001408] = 982a3c92, %l2 = 00000000000085ac
	ldsba	[%i0+%o4]0x80,%l2	! %l2 = ffffffffffffff98
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010001402] = 923c2a98
	sth	%l4,[%i0+0x002]		! Mem[0000000010001400] = 923c0000

p0_label_50:
!	%l6 = 00000000000000ff, Mem[0000000030041408] = e4ede0b7000000b3
	stxa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000000000ff
!	%l6 = 000000ff, %l7 = 00000089, Mem[0000000010041408] = 4e6eb823 00000000
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff 00000089
!	%l5 = 00b52edfb211e0cb, Mem[0000000010001410] = ffffffc4
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = b211e0cb
!	%l1 = 00000000df2eb500, Mem[0000000030081400] = 89000000
	stba	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[0000000010041410] = ff0af0f2, %l7 = 0000000000000089
	swapa	[%i1+%o5]0x80,%l7	! %l7 = 00000000ff0af0f2
!	%f25 = 00000055, Mem[0000000010181408] = 154bff9d
	sta	%f25,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000055
!	%l0 = ffffffffffffe764, Mem[0000000030041410] = 06870000
	stha	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 0687e764
!	%l2 = ffffffffffffff98, Mem[0000000010041400] = 9dff0000
	stha	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 9dffff98
!	Mem[0000000010041400] = 98ffff9d, %l2 = ffffffffffffff98
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 0000000098ffff9d
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ece3000098ffffff, %f6  = 7984e3ec eedf4915
	ldda	[%i1+%g0]0x88,%f6 	! %f6  = ece30000 98ffffff

p0_label_51:
!	Mem[0000000010041408] = 000000ff, %l4 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = 77e7f159651c9561, %l2 = 0000000098ffff9d
	ldxa	[%i4+%o4]0x81,%l2	! %l2 = 77e7f159651c9561
!	Mem[0000000010041438] = 1549dfee, %l2 = 77e7f159651c9561
	lduha	[%i1+0x03a]%asi,%l2	! %l2 = 000000000000dfee
!	Mem[00000000300c1400] = ebbbffff, %l2 = 000000000000dfee
	lduwa	[%i3+%g0]0x89,%l2	! %l2 = 00000000ebbbffff
!	Mem[0000000010181418] = 000021cc, %f31 = fbf9d6b7
	lda	[%i6+0x018]%asi,%f31	! %f31 = 000021cc
!	Mem[0000000010001400] = 923c0000, %l3 = 00000000000000a7
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffff92
!	Mem[0000000010001400] = 00003c92, %f19 = d753121c
	lda	[%i0+%g0]0x88,%f19	! %f19 = 00003c92
!	Mem[0000000010141400] = 53421fd5, %l3 = ffffffffffffff92
	ldsha	[%i5+%g0]0x80,%l3	! %l3 = 0000000000005342
!	Mem[0000000010001410] = cbe011b2, %l6 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l6	! %l6 = ffffffffffffffcb
!	Starting 10 instruction Store Burst
!	Mem[000000001018140e] = 000099ff, %l4 = 00000000000000ff
	ldstuba	[%i6+0x00e]%asi,%l4	! %l4 = 00000099000000ff

p0_label_52:
!	%l2 = 00000000ebbbffff, Mem[0000000030001400] = 923c2a98
	stba	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ff3c2a98
!	Mem[0000000030181400] = 9dffffff, %l5 = 00b52edfb211e0cb
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 000000009dffffff
!	%f26 = 037a4374 d8188706, Mem[00000000100c1438] = 4772839e e4ede0b7
	stda	%f26,[%i3+0x038]%asi	! Mem[00000000100c1438] = 037a4374 d8188706
!	%f2  = 000000a4 b7e0ede4, %l0 = ffffffffffffe764
!	Mem[0000000030101428] = 084bc7d9fe46add6
	add	%i4,0x028,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030101428] = 084bc7d9fe46add6
!	Mem[0000000010041400] = ffffff98, %l0 = ffffffffffffe764
	swapa	[%i1+%g0]0x80,%l0	! %l0 = 00000000ffffff98
!	%l4 = 0000000000000099, Mem[0000000030101408] = 59f1e777
	stwa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000099
!	%l0 = ffffff98, %l1 = df2eb500, Mem[0000000010101410] = ffc40000 decc7b7c
	stda	%l0,[%i4+0x010]%asi	! Mem[0000000010101410] = ffffff98 df2eb500
!	Mem[0000000010141400] = 53421fd5fbf9d6b7, %l4 = 0000000000000099, %l5 = 000000009dffffff
	casxa	[%i5]0x80,%l4,%l5	! %l5 = 53421fd5fbf9d6b7
!	%l6 = ffffffffffffffcb, Mem[00000000100c1400] = 3b3c0000000000ff
	stxa	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffffffffffcb
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = eedf4915, %l5 = 53421fd5fbf9d6b7
	ldswa	[%i6+%o4]0x89,%l5	! %l5 = ffffffffeedf4915

p0_label_53:
!	Mem[00000000100c1408] = 00b52edf, %f6  = ece30000
	lda	[%i3+0x008]%asi,%f6 	! %f6 = 00b52edf
!	Mem[00000000201c0000] = 4dff0847, %l0 = 00000000ffffff98
	lduh	[%o0+%g0],%l0		! %l0 = 0000000000004dff
!	Mem[0000000030141400] = d51f429a, %l6 = ffffffffffffffcb
	lduwa	[%i5+%g0]0x81,%l6	! %l6 = 00000000d51f429a
!	Mem[0000000030101400] = 6d887bff, %l7 = 00000000ff0af0f2
	lduha	[%i4+%g0]0x89,%l7	! %l7 = 0000000000007bff
!	Mem[00000000300c1400] = ebbbffff, %l1 = 00000000df2eb500
	lduha	[%i3+%g0]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[000000001004141c] = 3dbc8fde, %l5 = ffffffffeedf4915
	lduh	[%i1+0x01c],%l5		! %l5 = 0000000000003dbc
!	Mem[0000000010181410] = b211e0cb, %l0 = 0000000000004dff
	lduba	[%i6+%o5]0x88,%l0	! %l0 = 00000000000000cb
!	Mem[0000000030141400] = d51f429a, %l3 = 0000000000005342
	ldsha	[%i5+%g0]0x81,%l3	! %l3 = ffffffffffffd51f
!	Mem[0000000010081428] = 00000000, %l3 = ffffffffffffd51f
	lduha	[%i2+0x02a]%asi,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 162bf0f2 00000000, %l5 = 0000000000003dbc
!	Mem[0000000010041418] = 73f485ac3dbc8fde
	add	%i1,0x018,%g1
	stda	%f16,[%g1+%l5]ASI_PST16_P ! Mem[0000000010041418] = 162bf0f23dbc8fde

p0_label_54:
!	%l0 = 00000000000000cb, Mem[0000000030041408] = 000000ff
	stba	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000cb
!	Mem[00000000100c1400] = cbffffff, %l1 = 000000000000ffff
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000cbffffff
!	%f24 = e4ede0b7 00000055, Mem[0000000010081408] = 00000687 cf8753f5
	stda	%f24,[%i2+%o4]0x88	! Mem[0000000010081408] = e4ede0b7 00000055
!	%f10 = 982a3c92, Mem[0000000010081408] = 55000000
	sta	%f10,[%i2+%o4]0x80	! Mem[0000000010081408] = 982a3c92
!	Mem[00000000100c1408] = df2eb500, %l1 = 00000000cbffffff
	ldstuba	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141408] = 790053d7, %l7 = 0000000000007bff
	lduha	[%i5+%o4]0x81,%l7	! %l7 = 0000000000007900
!	Mem[0000000010101400] = ece38479, %l2 = 00000000ebbbffff
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 00000079000000ff
!	%f4  = 00000000 00003c3b, Mem[00000000100c1408] = ffb52edf b211e0cb
	stda	%f4 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 00003c3b
!	%f12 = ff000000 5e6bb831, Mem[0000000010041400] = ffffe764 0000e3ec
	stda	%f12,[%i1+%g0]0x80	! Mem[0000000010041400] = ff000000 5e6bb831
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = cbe011b2, %l5 = 0000000000003dbc
	ldsha	[%i6+%o5]0x80,%l5	! %l5 = ffffffffffffcbe0

p0_label_55:
!	Mem[0000000030181408] = eedf4915, %l4 = 0000000000000099
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = ffffffffeedf4915
!	Mem[0000000010041410] = 00000089, %f23 = 00000000
	lda	[%i1+%o5]0x80,%f23	! %f23 = 00000089
!	Mem[0000000030141408] = 779994fd d7530079, %l0 = 000000cb, %l1 = 00000000
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 00000000d7530079 00000000779994fd
!	Mem[0000000030101410] = ff31751a 256271c4, %l2 = 00000079, %l3 = 00000000
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000ff31751a 00000000256271c4
!	Mem[0000000030141410] = 6a13e734, %l7 = 0000000000007900
	lduwa	[%i5+%o5]0x89,%l7	! %l7 = 000000006a13e734
!	Mem[00000000300c1400] = 48000000 ebbbffff, %l6 = d51f429a, %l7 = 6a13e734
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 00000000ebbbffff 0000000048000000
!	Mem[0000000010001408] = 982a3c924e6eb823, %l2 = 00000000ff31751a
	ldxa	[%i0+%o4]0x80,%l2	! %l2 = 982a3c924e6eb823
!	Mem[0000000030141410] = 34e7136aeb838479, %f0  = cbe011b2 33d76dda
	ldda	[%i5+%o5]0x81,%f0 	! %f0  = 34e7136a eb838479
!	Mem[0000000030101410] = 1a7531ff, %l5 = ffffffffffffcbe0
	lduha	[%i4+%o5]0x89,%l5	! %l5 = 00000000000031ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 9547dba44b9d9c26, %l1 = 00000000779994fd, %l7 = 0000000048000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 9547dba44b9d9c26

p0_label_56:
!	Mem[00000000300c1410] = ffff8706, %l7 = 9547dba44b9d9c26
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 00000000ffff8706
!	%l4 = ffffffffeedf4915, Mem[0000000030181410] = eb838479
	stha	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = eb834915
!	Mem[0000000030141408] = 790053d7, %l0 = 00000000d7530079
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 00000000790053d7
!	%f10 = 982a3c92 4e6eb823, Mem[0000000010101430] = 00000000 00000000
	std	%f10,[%i4+0x030]	! Mem[0000000010101430] = 982a3c92 4e6eb823
!	%l7 = 00000000ffff8706, Mem[0000000010141400] = 53421fd5
	stw	%l7,[%i5+%g0]		! Mem[0000000010141400] = ffff8706
!	Mem[0000000010081400] = 9dff0000, %l3 = 00000000256271c4
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041408] = 000000ff, %l2 = 982a3c924e6eb823
	swapa	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001400] = 923c0000, %l0 = 00000000790053d7
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 00000092000000ff
!	%l0 = 00000092, %l1 = 779994fd, Mem[0000000010101410] = ffffff98 df2eb500
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000092 779994fd
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 92000000, %l6 = 00000000ebbbffff
	lduwa	[%i4+%o5]0x88,%l6	! %l6 = 0000000092000000

p0_label_57:
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1438] = 037a4374 d8188706, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i3+0x038]%asi,%l2	! %l2 = 00000000037a4374 00000000d8188706
!	Mem[00000000300c1410] = 269c9d4b, %l6 = 0000000092000000
	ldsha	[%i3+%o5]0x89,%l6	! %l6 = ffffffffffff9d4b
!	Mem[0000000010101408] = 7984ff64, %l1 = 00000000779994fd
	ldsha	[%i4+%o4]0x88,%l1	! %l1 = ffffffffffffff64
!	Mem[0000000010181410] = cbe011b2, %l4 = ffffffffeedf4915
	lduwa	[%i6+%o5]0x80,%l4	! %l4 = 00000000cbe011b2
!	Mem[00000000201c0000] = 4dff0847, %l7 = 00000000ffff8706
	lduh	[%o0+%g0],%l7		! %l7 = 0000000000004dff
!	Mem[0000000010141400] = ffff8706, %l3 = 00000000d8188706
	lduwa	[%i5+%g0]0x80,%l3	! %l3 = 00000000ffff8706
!	Mem[00000000201c0000] = 4dff0847, %l3 = 00000000ffff8706
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000004dff
!	Mem[0000000030041408] = cb000000, %l0 = 0000000000000092
	lduwa	[%i1+%o4]0x81,%l0	! %l0 = 00000000cb000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000cbe011b2, Mem[0000000010001400] = ff3c0000dab52edf
	stx	%l4,[%i0+%g0]		! Mem[0000000010001400] = 00000000cbe011b2

p0_label_58:
!	%l2 = 00000000037a4374, Mem[00000000300c1408] = f84eefba0000008d
	stxa	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000037a4374
!	Mem[000000001010141a] = d175d1a0, %l0 = 00000000cb000000
	ldstuba	[%i4+0x01a]%asi,%l0	! %l0 = 000000d1000000ff
!	Mem[0000000010141408] = acef4ef8, %l5 = 00000000000031ff
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 00000000acef4ef8
!	%l4 = cbe011b2, %l5 = acef4ef8, Mem[0000000010141420] = a209c2df d104baa0
	stda	%l4,[%i5+0x020]%asi	! Mem[0000000010141420] = cbe011b2 acef4ef8
!	%f0  = 34e7136a eb838479, Mem[0000000010181400] = 162bf0f2 ba439dac
	stda	%f0 ,[%i6+0x000]%asi	! Mem[0000000010181400] = 34e7136a eb838479
!	%l6 = ffff9d4b, %l7 = 00004dff, Mem[0000000010001410] = b211e0cb ffffffff
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = ffff9d4b 00004dff
!	%f8  = d9c20fb2 0000e3ec, Mem[0000000010181408] = 55000000 0000ffff
	stda	%f8 ,[%i6+%o4]0x80	! Mem[0000000010181408] = d9c20fb2 0000e3ec
!	%l1 = ffffffffffffff64, Mem[0000000010141400] = ffff8706fbf9d6b7, %asi = 80
	stxa	%l1,[%i5+0x000]%asi	! Mem[0000000010141400] = ffffffffffffff64
!	%f1  = eb838479, Mem[0000000010001408] = 982a3c92
	sta	%f1 ,[%i0+%o4]0x80	! Mem[0000000010001408] = eb838479
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = eb838479, %l5 = 00000000acef4ef8
	ldswa	[%i0+%o4]0x80,%l5	! %l5 = ffffffffeb838479

p0_label_59:
!	Mem[0000000010141400] = ffffffff ffffff64, %l0 = 000000d1, %l1 = ffffff64
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 00000000ffffffff 00000000ffffff64
!	Mem[00000000100c1400] = ffff0000, %f11 = 4e6eb823
	lda	[%i3+%g0]0x88,%f11	! %f11 = ffff0000
!	Mem[00000000201c0000] = 4dff0847, %l4 = 00000000cbe011b2
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010001400] = 00000000, %l7 = 0000000000004dff
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = d51f429aeb838479, %l3 = 0000000000004dff
	ldxa	[%i3+%o5]0x80,%l3	! %l3 = d51f429aeb838479
!	Mem[0000000030001400] = ff3c2a9833d76dda, %f22 = bb000000 00000089
	ldda	[%i0+%g0]0x81,%f22	! %f22 = ff3c2a98 33d76dda
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010101400] = ff84e3ec 0000e764 64ff8479 9dff0000
!	Mem[0000000010101410] = 00000092 779994fd d175ffa0 1a7d7397
!	Mem[0000000010101420] = 162bf0f2 9dff4b15 fb58c9c8 390dda80
!	Mem[0000000010101430] = 982a3c92 4e6eb823 70001f4b 927a5681
	ldda	[%i4]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400
!	Mem[0000000030001400] = ff3c2a9833d76dda, %f14 = 9a421fd5 64e76351
	ldda	[%i0+%g0]0x81,%f14	! %f14 = ff3c2a98 33d76dda
!	Mem[00000000100c141c] = a3efe193, %l7 = 0000000000000000
	lduh	[%i3+0x01c],%l7		! %l7 = 000000000000a3ef
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = d7530079, %l3 = d51f429aeb838479
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 000000d7000000ff

p0_label_60:
!	%f12 = ff000000 5e6bb831, %l2 = 00000000037a4374
!	Mem[0000000030181438] = 109da19c16afb44d
	add	%i6,0x038,%g1
	stda	%f12,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030181438] = 109da19c16afb44d
	membar	#Sync			! Added by membar checker (11)
!	%f4  = 00000000 00003c3b, %l4 = ffffffffffffffff
!	Mem[0000000010101428] = fb58c9c8390dda80
	add	%i4,0x028,%g1
	stda	%f4,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010101428] = 3b3c000000000000
!	%f6  = 00b52edf 98ffffff, Mem[0000000030041410] = 0687e764 3490288f
	stda	%f6 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 00b52edf 98ffffff
!	Mem[00000000100c1430] = 33b3288f3787a7ff, %l5 = ffffffffeb838479, %l1 = 00000000ffffff64
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 33b3288f3787a7ff
!	%l4 = ffffffffffffffff, Mem[0000000021800040] = d859c626, %asi = 80
	stba	%l4,[%o3+0x040]%asi	! Mem[0000000021800040] = ff59c626
!	%f10 = 982a3c92 ffff0000, %l5 = ffffffffeb838479
!	Mem[0000000010101408] = 64ff84799dff0000
	add	%i4,0x008,%g1
	stda	%f10,[%g1+%l5]ASI_PST32_P ! Mem[0000000010101408] = 64ff8479ffff0000
!	%f26 = fb58c9c8 390dda80, Mem[0000000030081410] = 00000000 ff000000
	stda	%f26,[%i2+%o5]0x81	! Mem[0000000030081410] = fb58c9c8 390dda80
!	Mem[00000000300c1408] = 74437a03, %l4 = ffffffffffffffff
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 0000000074437a03
!	Mem[000000001008142f] = 00009977, %l4 = 0000000074437a03
	ldstub	[%i2+0x02f],%l4		! %l4 = 00000077000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff84e3ec, %l0 = 00000000ffffffff
	lduha	[%i4+%g0]0x80,%l0	! %l0 = 000000000000ff84

p0_label_61:
!	Mem[0000000030041400] = cbe011b2, %l3 = 00000000000000d7
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 00000000cbe011b2
!	Mem[0000000010001410] = ffff9d4b, %f11 = ffff0000
	lda	[%i0+%o5]0x88,%f11	! %f11 = ffff9d4b
!	Mem[0000000030001408] = cf8753f5, %l6 = ffffffffffff9d4b
	ldsba	[%i0+%o4]0x89,%l6	! %l6 = fffffffffffffff5
!	Mem[0000000010001410] = ffff9d4b, %l7 = 000000000000a3ef
	lduwa	[%i0+%o5]0x88,%l7	! %l7 = 00000000ffff9d4b
!	Mem[00000000201c0000] = 4dff0847, %l7 = 00000000ffff9d4b
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 0000000000004dff
!	Mem[0000000010081410] = 1549dfee000000bb, %f18 = 64ff8479 9dff0000
	ldda	[%i2+%o5]0x80,%f18	! %f18 = 1549dfee 000000bb
!	Mem[0000000020800000] = fb58261d, %l7 = 0000000000004dff
	lduha	[%o1+0x000]%asi,%l7	! %l7 = 000000000000fb58
!	Mem[0000000021800180] = ff9a809b, %l5 = ffffffffeb838479
	ldsh	[%o3+0x180],%l5		! %l5 = ffffffffffffff9a
!	Mem[0000000030041400] = b211e0cb, %l4 = 0000000000000077
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = ffffffffffffe0cb
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = c8c958fb, %l3 = 00000000cbe011b2
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 000000fb000000ff

p0_label_62:
!	%f22 = d175ffa0 1a7d7397, %l6 = fffffffffffffff5
!	Mem[0000000010041428] = 9fb6d02e3a505a63
	add	%i1,0x028,%g1
	stda	%f22,[%g1+%l6]ASI_PST32_P ! Mem[0000000010041428] = 9fb6d02e1a7d7397
!	%l0 = 000000000000ff84, Mem[000000001010143a] = 70001f4b, %asi = 80
	stha	%l0,[%i4+0x03a]%asi	! Mem[0000000010101438] = 7000ff84
!	Mem[0000000010141400] = ffffffff, %l3 = 00000000000000fb
	swapa	[%i5+%g0]0x80,%l3	! %l3 = 00000000ffffffff
!	%f29 = 4e6eb823, Mem[0000000030081410] = c8c958ff
	sta	%f29,[%i2+%o5]0x89	! Mem[0000000030081410] = 4e6eb823
!	%l6 = fffffffffffffff5, Mem[0000000010181408] = b20fc2d9
	stba	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = b20fc2f5
!	Mem[00000000201c0000] = 4dff0847, %l3 = 00000000ffffffff
	ldstub	[%o0+%g0],%l3		! %l3 = 0000004d000000ff
!	Mem[00000000100c1408] = 00000000, %l4 = ffffffffffffe0cb
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = 982a3cff, %l7 = 000000000000fb58
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000030101410] = ff31751a
	stha	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000751a
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffff9d4b, %l4 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l4	! %l4 = 0000000000009d4b

p0_label_63:
!	Mem[0000000010041438] = 1549dfee, %f23 = 1a7d7397
	ld	[%i1+0x038],%f23	! %f23 = 1549dfee
!	Mem[0000000030101400] = 6d887bff, %l3 = 000000000000004d
	lduha	[%i4+%g0]0x89,%l3	! %l3 = 0000000000007bff
!	Mem[0000000030181408] = eedf4915, %l1 = 33b3288f3787a7ff
	lduha	[%i6+%o4]0x89,%l1	! %l1 = 0000000000004915
!	Mem[0000000030081408] = ffd6f9fb, %l5 = ffffffffffffff9a
	ldsba	[%i2+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1410] = 269c9d4b, %f11 = ffff9d4b
	lda	[%i3+%o5]0x89,%f11	! %f11 = 269c9d4b
!	Mem[00000000100c1410] = 9a421fd5, %l0 = 000000000000ff84
	lduha	[%i3+%o5]0x88,%l0	! %l0 = 0000000000001fd5
!	Mem[0000000030181400] = cbe011b2, %l2 = 00000000037a4374
	ldswa	[%i6+%g0]0x81,%l2	! %l2 = ffffffffcbe011b2
!	Mem[00000000201c0000] = ffff0847, %l5 = ffffffffffffffff
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010041408] = 23b86e4e, %l1 = 0000000000004915
	lduha	[%i1+%o4]0x80,%l1	! %l1 = 00000000000023b8
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ffff0847, %l5 = 000000000000ffff
	ldstub	[%o0+0x001],%l5		! %l5 = 000000ff000000ff

p0_label_64:
!	Mem[0000000030081408] = ffd6f9fb, %l0 = 0000000000001fd5
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000010181410] = b211e0cb
	stwa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	%l1 = 00000000000023b8, Mem[0000000010141400] = fb000000
	stwa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 000023b8
!	%l6 = fffffffffffffff5, Mem[0000000030001410] = cf8753f5
	stha	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = cf87fff5
!	Mem[0000000010181408] = b20fc2f5, %l7 = 00000000000000ff
	swapa	[%i6+%o4]0x88,%l7	! %l7 = 00000000b20fc2f5
!	%l3 = 0000000000007bff, Mem[0000000030181408] = 1549dfee
	stha	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 7bffdfee
!	%l6 = fffffffffffffff5, Mem[0000000010041408] = 4e6eb823
	stha	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 4e6efff5
!	Mem[0000000020800000] = fb58261d, %l0 = 00000000000000ff
	ldstuba	[%o1+0x000]%asi,%l0	! %l0 = 000000fb000000ff
!	%l7 = 00000000b20fc2f5, Mem[0000000020800000] = ff58261d
	sth	%l7,[%o1+%g0]		! Mem[0000000020800000] = c2f5261d
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = fbf9d6ff, %l4 = 0000000000009d4b
	lduba	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff

p0_label_65:
!	Mem[0000000030081410] = 23b86e4e, %l3 = 0000000000007bff
	ldsba	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000023
!	Mem[0000000010081408] = 923c2a98, %l7 = 00000000b20fc2f5
	lduha	[%i2+%o4]0x88,%l7	! %l7 = 0000000000002a98
!	Mem[00000000201c0000] = ffff0847, %l5 = 00000000000000ff
	ldsb	[%o0+0x001],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010141428] = ef45dc58 7700fffc, %l6 = fffffff5, %l7 = 00002a98
	ldd	[%i5+0x028],%l6		! %l6 = 00000000ef45dc58 000000007700fffc
!	Mem[0000000030141410] = 34e7136a, %f25 = 9dff4b15
	lda	[%i5+%o5]0x81,%f25	! %f25 = 34e7136a
!	Mem[0000000010141410] = eb838479, %l3 = 0000000000000023
	ldsba	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000079
!	Mem[0000000030101408] = 00000099, %l1 = 00000000000023b8
	ldswa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000099
!	Mem[0000000010181408] = ff000000, %l1 = 0000000000000099
	ldswa	[%i6+%o4]0x80,%l1	! %l1 = ffffffffff000000
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030081400] = 00000000 00000000 ffd6f9fb 00006d45
!	Mem[0000000030081410] = 23b86e4e 390dda80 51f2aaac 32230641
!	Mem[0000000030081420] = 8792e3e9 6dbeebba 4758f443 91146da7
!	Mem[0000000030081430] = 52305949 43ad5600 b1d07051 682a607a
	ldda	[%i2]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffcbe011b2, Mem[0000000030001408] = cf8753f5
	stba	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = cf8753b2

p0_label_66:
!	%l7 = 000000007700fffc, Mem[0000000030001400] = 982a3cff
	stha	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 982afffc
!	%l2 = ffffffffcbe011b2, Mem[0000000030041408] = cb000000
	stha	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 11b20000
!	%f6  = 00b52edf 98ffffff, Mem[0000000030101408] = 99000000 651c9561
	stda	%f6 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 00b52edf 98ffffff
!	%l7 = 000000007700fffc, Mem[00000000201c0000] = ffff0847
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = fcff0847
!	%l3 = 0000000000000079, Mem[0000000010041408] = f5ff6e4e
	stwa	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000079
!	Mem[0000000010001408] = 798483eb, %l6 = 00000000ef45dc58
	swapa	[%i0+%o4]0x88,%l6	! %l6 = 00000000798483eb
!	Mem[0000000010001426] = 157839c2, %l6 = 00000000798483eb
	ldstub	[%i0+0x026],%l6		! %l6 = 00000039000000ff
!	%l6 = 0000000000000039, Mem[0000000030041408] = 000000000000b211
	stxa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000039
!	%l6 = 0000000000000039, Mem[0000000030041400] = cbe011b2
	stba	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 39e011b2
!	Starting 10 instruction Load Burst
!	Mem[0000000010101404] = 0000e764, %l6 = 0000000000000039
	ldswa	[%i4+0x004]%asi,%l6	! %l6 = 000000000000e764

p0_label_67:
!	Mem[0000000030181400] = cbe011b2000000ff, %l5 = ffffffffffffffff
	ldxa	[%i6+%g0]0x81,%l5	! %l5 = cbe011b2000000ff
!	Mem[0000000010081410] = bb000000eedf4915, %l3 = 0000000000000079
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = bb000000eedf4915
!	Mem[0000000030041400] = da6dd733 b211e039, %l2 = cbe011b2, %l3 = eedf4915
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 00000000b211e039 00000000da6dd733
!	Mem[0000000010141410] = eb838479, %l4 = 00000000000000ff
	ldsba	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000079
!	Mem[00000000201c0001] = fcff0847, %l2 = 00000000b211e039
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1408] = ff000000, %l7 = 000000007700fffc
	lduba	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181400] = b211e0cb, %l7 = 00000000000000ff
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000cb
!	Mem[0000000030101410] = 1a750000, %l1 = ffffffffff000000
	lduha	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ff1258bc, %l6 = 000000000000e764
	ldsba	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 64ff8479, %l7 = 00000000000000cb
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 00000064000000ff

p0_label_68:
!	Mem[0000000030001410] = cf87fff5, %l5 = cbe011b2000000ff
	swapa	[%i0+%o5]0x89,%l5	! %l5 = 00000000cf87fff5
!	%f7  = 98ffffff, Mem[00000000300c1410] = 4b9d9c26
	sta	%f7 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 98ffffff
!	%l4 = 00000079, %l5 = cf87fff5, Mem[0000000010081400] = 9dff00ff d9c20fb2
	stda	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000079 cf87fff5
!	Mem[0000000030181410] = 154983eb, %l6 = ffffffffffffffff
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 00000000154983eb
!	Mem[0000000010081410] = eedf4915, %l5 = 00000000cf87fff5
	ldsba	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000015
!	%f0  = 34e7136a eb838479 000000a4 b7e0ede4
!	%f4  = 00000000 00003c3b 00b52edf 98ffffff
!	%f8  = d9c20fb2 0000e3ec 982a3c92 269c9d4b
!	%f12 = ff000000 5e6bb831 ff3c2a98 33d76dda
	stda	%f0,[%i4]ASI_COMMIT_S	! Block Store to 0000000030101400
!	%l2 = 000000ff, %l3 = da6dd733, Mem[0000000030141408] = ff530079 fd949977
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff da6dd733
!	%l4 = 0000000000000079, Mem[0000000010181400] = 6a13e734
	stba	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 6a13e779
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 00000000000000fb
	setx	0xb9192df027bf05ad,%g7,%l0 ! %l0 = b9192df027bf05ad
!	%l1 = 0000000000000000
	setx	0x5d890640303c9e87,%g7,%l1 ! %l1 = 5d890640303c9e87
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b9192df027bf05ad
	setx	0xa46df6d06e18b068,%g7,%l0 ! %l0 = a46df6d06e18b068
!	%l1 = 5d890640303c9e87
	setx	0x059115c7a0095b17,%g7,%l1 ! %l1 = 059115c7a0095b17
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 000000ff, %l1 = 059115c7a0095b17
	ldsba	[%i0+%o5]0x89,%l1	! %l1 = ffffffffffffffff

p0_label_69:
!	Mem[0000000030001400] = 982afffc, %f30 = b1d07051
	lda	[%i0+%g0]0x89,%f30	! %f30 = 982afffc
!	Mem[00000000100c1408] = 000000ff, %l3 = 00000000da6dd733
	lduwa	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = ffffff98, %l1 = ffffffffffffffff
	lduwa	[%i3+%o5]0x89,%l1	! %l1 = 00000000ffffff98
!	Mem[0000000010041410] = 00000089, %l7 = 0000000000000064
	ldswa	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000089
!	Mem[00000000201c0000] = fcff0847, %l2 = 00000000000000ff
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = ffffffff, %f27 = 91146da7
	lda	[%i3+%o4]0x89,%f27	! %f27 = ffffffff
!	Mem[0000000010141400] = b8230000, %f17 = 00000000
	lda	[%i5+%g0]0x80,%f17	! %f17 = b8230000
!	Mem[0000000010041410] = 89000000, %l4 = 0000000000000079
	ldswa	[%i1+%o5]0x88,%l4	! %l4 = ffffffff89000000
!	Mem[0000000030081408] = fbf9d6ff, %l7 = 0000000000000089
	lduha	[%i2+%o4]0x89,%l7	! %l7 = 000000000000d6ff
!	Starting 10 instruction Store Burst
!	%l4 = ffffffff89000000, Mem[0000000030181408] = 7bffdfeeece38479
	stxa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff89000000

p0_label_70:
!	%l2 = 00000000000000ff, Mem[0000000010081408] = e4ede0b7923c2a98
	stxa	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l4 = ffffffff89000000
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = ffffffff, %l0 = a46df6d06e18b068
	ldstuba	[%i6+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000020800000] = c2f5261d, %asi = 80
	stha	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 00ff261d
!	Mem[0000000010181408] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%l1 = 00000000ffffff98, Mem[0000000010041429] = 9fb6d02e
	stb	%l1,[%i1+0x029]		! Mem[0000000010041428] = 9f98d02e
!	Mem[0000000010041410] = 89000000, %l6 = 00000000154983eb
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081408] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (13)
!	%f6  = 00b52edf 98ffffff, %l2 = 00000000000000ff
!	Mem[0000000010101428] = 3b3c000000000000
	add	%i4,0x028,%g1
	stda	%f6,[%g1+%l2]ASI_PST16_P ! Mem[0000000010101428] = 00b52edf98ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181420] = b7d6f9fb, %l0 = 00000000000000ff
	ldsw	[%i6+0x020],%l0		! %l0 = ffffffffb7d6f9fb

p0_label_71:
!	Mem[0000000010001400] = b211e0cb00000000, %l5 = 0000000000000015
	ldxa	[%i0+%g0]0x88,%l5	! %l5 = b211e0cb00000000
!	Mem[0000000010081400] = cf87fff500000079, %l7 = 000000000000d6ff
	ldxa	[%i2+%g0]0x88,%l7	! %l7 = cf87fff500000079
!	Mem[0000000010041408] = 00000079, %l1 = 00000000ffffff98
	lduh	[%i1+%o4],%l1		! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ff1258bc, %l6 = 0000000000000000
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000ff12
!	Mem[0000000030001410] = ff000000, %l6 = 000000000000ff12
	ldsba	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101400] = 34e7136aeb838479, %l5 = b211e0cb00000000
	ldxa	[%i4+%g0]0x81,%l5	! %l5 = 34e7136aeb838479
!	Mem[0000000010101438] = 7000ff84, %l2 = 00000000000000ff
	lduwa	[%i4+0x038]%asi,%l2	! %l2 = 000000007000ff84
!	Mem[0000000010081400] = 79000000, %l1 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l1	! %l1 = 0000000079000000
!	Mem[0000000010041410] = ff000089, %f18 = ffd6f9fb
	lda	[%i1+%o5]0x80,%f18	! %f18 = ff000089
!	Starting 10 instruction Store Burst
!	%f12 = ff000000 5e6bb831, Mem[0000000030041408] = 00000039 00000000
	stda	%f12,[%i1+%o4]0x89	! Mem[0000000030041408] = ff000000 5e6bb831

p0_label_72:
!	Mem[0000000030001410] = 000000ff, %l7 = cf87fff500000079
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	%l5 = 34e7136aeb838479, Mem[0000000010081418] = 4a16708c, %asi = 80
	stha	%l5,[%i2+0x018]%asi	! Mem[0000000010081418] = 8479708c
!	%f16 = 00000000 b8230000, %l5 = 34e7136aeb838479
!	Mem[00000000300c1428] = 6ad014b2cfd52e4b
	add	%i3,0x028,%g1
	stda	%f16,[%g1+%l5]ASI_PST32_S ! Mem[00000000300c1428] = 6ad014b2b8230000
!	%l6 = ffffffffffffffff, Mem[0000000030101408] = 000000a4
	stwa	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffffff
!	%l6 = ffffffffffffffff, Mem[0000000010081410] = 1549dfee
	stha	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffdfee
!	%l5 = 34e7136aeb838479, Mem[00000000100c1428] = 000000002fe83a41, %asi = 80
	stxa	%l5,[%i3+0x028]%asi	! Mem[00000000100c1428] = 34e7136aeb838479
!	%f21 = 390dda80, Mem[00000000300c1408] = ffffffff
	sta	%f21,[%i3+%o4]0x81	! Mem[00000000300c1408] = 390dda80
!	Mem[0000000010141400] = 000023b8, %l0 = ffffffffb7d6f9fb
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 00000000000023b8
!	%l2 = 000000007000ff84, Mem[0000000010141408] = 000031ff
	stwa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 7000ff84
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffffdfee, %l6 = ffffffffffffffff
	lduba	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000ff

p0_label_73:
!	Mem[0000000010101400] = ff84e3ec, %l0 = 00000000000023b8
	ldswa	[%i4+%g0]0x80,%l0	! %l0 = ffffffffff84e3ec
!	Mem[00000000100c1400] = 0000ffff, %f26 = 4758f443
	lda	[%i3+%g0]0x80,%f26	! %f26 = 0000ffff
!	Mem[00000000100c1414] = eb838479, %l2 = 000000007000ff84
	ldsw	[%i3+0x014],%l2		! %l2 = ffffffffeb838479
!	Mem[0000000010081408] = ff000000 00000000, %l0 = ff84e3ec, %l1 = 79000000
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000010081408] = 00000000000000ff, %f6  = 00b52edf 98ffffff
	ldda	[%i2+%o4]0x88,%f6 	! %f6  = 00000000 000000ff
!	Mem[0000000030101410] = 00000000, %l0 = 00000000ff000000
	lduwa	[%i4+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = ff000089, %l1 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1400] = 0000ffff, %l7 = 00000000000000ff
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 5e6bb831, %f26 = 0000ffff
	lda	[%i1+%o4]0x89,%f26	! %f26 = 5e6bb831
!	Starting 10 instruction Store Burst
!	Mem[0000000010101430] = 982a3c92, %l4 = 00000000000000ff
	swap	[%i4+0x030],%l4		! %l4 = 00000000982a3c92

p0_label_74:
!	%l7 = 0000000000000000, Mem[0000000030101408] = ffffffff
	stwa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%f18 = ff000089 00006d45, Mem[00000000100c1418] = ee2e0ba8 a3efe193
	stda	%f18,[%i3+0x018]%asi	! Mem[00000000100c1418] = ff000089 00006d45
!	%f10 = 982a3c92 269c9d4b, %l5 = 34e7136aeb838479
!	Mem[0000000010001418] = 1a7531a78788c6cd
	add	%i0,0x018,%g1
	stda	%f10,[%g1+%l5]ASI_PST32_P ! Mem[0000000010001418] = 1a7531a7269c9d4b
!	%l0 = 00000000, %l1 = ffffffff, Mem[0000000010101408] = 7984ffff 0000ffff
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 ffffffff
!	%f20 = 23b86e4e, Mem[0000000010101400] = ece384ff
	sta	%f20,[%i4+%g0]0x88	! Mem[0000000010101400] = 23b86e4e
!	Mem[00000000100c1400] = ffff0000, %l4 = 00000000982a3c92
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = 000000ff, %l1 = ffffffffffffffff
	swapa	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101410] = 00000092, %l2 = ffffffffeb838479
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000092
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010141400] = fbf9d6b7 ffffff64
	stda	%l0,[%i5+0x000]%asi	! Mem[0000000010141400] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff00ffffffffffff, %f4  = 00000000 00003c3b
	ldda	[%i3+%g0]0x80,%f4 	! %f4  = ff00ffff ffffffff

p0_label_75:
!	Mem[0000000021800140] = 3c3bf4c2, %l0 = 0000000000000000
	ldub	[%o3+0x140],%l0		! %l0 = 000000000000003c
!	Mem[00000000211c0000] = ff1258bc, %l6 = 00000000000000ff
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffff12
!	Mem[0000000020800040] = e7644bbb, %l2 = 0000000000000092
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffffe764
!	Mem[0000000010101400] = 64e7000023b86e4e, %l3 = 00000000000000ff
	ldxa	[%i4+%g0]0x88,%l3	! %l3 = 64e7000023b86e4e
!	Mem[00000000100c1400] = ff00ffff, %l1 = 00000000000000ff
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010001428] = 74592f4e299bb4bb, %l7 = 0000000000000000
	ldxa	[%i0+0x028]%asi,%l7	! %l7 = 74592f4e299bb4bb
!	Mem[0000000010181434] = 157839c2, %l4 = 0000000000000000
	lduwa	[%i6+0x034]%asi,%l4	! %l4 = 00000000157839c2
!	Mem[00000000100c1408] = ffffffff 00003c3b, %l6 = ffffff12, %l7 = 299bb4bb
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 00000000ffffffff 0000000000003c3b
!	Mem[0000000030001410] = 000000ff, %l7 = 0000000000003c3b
	ldsha	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 34e7136aeb838479, Mem[0000000010081430] = b43ee220
	stw	%l5,[%i2+0x030]		! Mem[0000000010081430] = eb838479

p0_label_76:
!	%l6 = 00000000ffffffff, Mem[0000000010041408] = 79000000
	stba	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 790000ff
!	Mem[000000001010141f] = 1a7d7397, %l7 = 00000000000000ff
	ldstub	[%i4+0x01f],%l7		! %l7 = 00000097000000ff
!	Mem[0000000010181408] = 000000ff, %l6 = 00000000ffffffff
	swapa	[%i6+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101420] = 162bf0f29dff4b15, %l3 = 64e7000023b86e4e, %l4 = 00000000157839c2
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 162bf0f29dff4b15
!	%l0 = 000000000000003c, Mem[0000000021800100] = 67538452
	sth	%l0,[%o3+0x100]		! Mem[0000000021800100] = 003c8452
!	%l3 = 64e7000023b86e4e, Mem[0000000030041408] = 31b86b5e000000ff
	stxa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 64e7000023b86e4e
!	Mem[0000000010001408] = 58dc45ef, %l2 = ffffffffffffe764, %asi = 80
	swapa	[%i0+0x008]%asi,%l2	! %l2 = 0000000058dc45ef
!	%f4  = ff00ffff, Mem[0000000030081408] = ffd6f9fb
	sta	%f4 ,[%i2+%o4]0x81	! Mem[0000000030081408] = ff00ffff
!	%f22 = 51f2aaac, Mem[00000000100c141c] = 00006d45
	sta	%f22,[%i3+0x01c]%asi	! Mem[00000000100c141c] = 51f2aaac
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ffffffff000000ff, %l3 = 64e7000023b86e4e
	ldxa	[%i6+%o5]0x81,%l3	! %l3 = ffffffff000000ff

p0_label_77:
!	Mem[0000000010041408] = ff000079, %f20 = 23b86e4e
	ld	[%i1+%o4],%f20	! %f20 = ff000079
!	Mem[0000000030001408] = cf8753b2, %l3 = ffffffff000000ff
	lduha	[%i0+%o4]0x89,%l3	! %l3 = 00000000000053b2
!	Mem[0000000010141408] = 7000ff84b7e0ede4, %f24 = 8792e3e9 6dbeebba
	ldda	[%i5+0x008]%asi,%f24	! %f24 = 7000ff84 b7e0ede4
!	Mem[0000000030001410] = ff000000, %f10 = 982a3c92
	lda	[%i0+%o5]0x81,%f10	! %f10 = ff000000
!	Mem[0000000020800040] = e7644bbb, %l6 = 00000000000000ff
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = ffffffffffffe764
!	Mem[0000000010141400] = 00000000, %l6 = ffffffffffffe764
	ldswa	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ff1258bc, %l1 = ffffffffffffff00
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 000000000000ff12
!	Mem[0000000030041408] = 64e70000 23b86e4e, %l2 = 58dc45ef, %l3 = 000053b2
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 0000000064e70000 0000000023b86e4e
!	Mem[0000000010041400] = ff000000 5e6bb831, %l2 = 64e70000, %l3 = 23b86e4e
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff000000 000000005e6bb831
!	Starting 10 instruction Store Burst
!	Mem[0000000010101438] = 7000ff84927a5681, %l5 = 34e7136aeb838479, %l0 = 000000000000003c
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = 7000ff84927a5681

p0_label_78:
!	%l7 = 0000000000000097, Mem[0000000010001410] = 4b9dffffff4d0000
	stxa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000097
!	%l3 = 000000005e6bb831, Mem[0000000030141408] = ff000000
	stwa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 5e6bb831
!	%l2 = 00000000ff000000, Mem[0000000010181410] = 000000ff
	stwa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = ff000000
!	%l0 = 7000ff84927a5681, Mem[00000000300c1408] = 80da0d39
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 80da0d81
!	Mem[0000000010081400] = 79000000, %l5 = 34e7136aeb838479
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 00000079000000ff
!	Mem[0000000030101408] = 00000000, %l7 = 0000000000000097
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%l3 = 000000005e6bb831, Mem[00000000201c0001] = fcff0847, %asi = 80
	stba	%l3,[%o0+0x001]%asi	! Mem[00000000201c0000] = fc310847
!	Mem[0000000010041420] = 037a4374, %l0 = 7000ff84927a5681, %asi = 80
	swapa	[%i1+0x020]%asi,%l0	! %l0 = 00000000037a4374
!	%l1 = 000000000000ff12, Mem[0000000010081400] = ff000000
	stha	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = ff120000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000 00000097, %l0 = 037a4374, %l1 = 0000ff12
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000 0000000000000097

p0_label_79:
!	Mem[0000000030081400] = 0000000000000089, %f6  = 00000000 000000ff
	ldda	[%i2+%g0]0x89,%f6 	! %f6  = 00000000 00000089
!	Mem[0000000010101408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 00000097, %l0 = 0000000000000000
	lduba	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000097
	membar	#Sync			! Added by membar checker (14)
!	Mem[00000000300c1400] = ffffbbeb 00000048 810dda80 00000000
!	Mem[00000000300c1410] = 98ffffff 8f289034 f4df2837 efe09bab
!	Mem[00000000300c1420] = 68ebf655 d87b3978 6ad014b2 b8230000
!	Mem[00000000300c1430] = 3c76f8fb 152a7b16 4613c66d 1e4f7940
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000021800180] = ff9a809b, %l4 = 162bf0f29dff4b15
	ldsb	[%o3+0x180],%l4		! %l4 = ffffffffffffffff
!	%f2  = 000000a4, %f15 = 33d76dda, %f11 = 269c9d4b
	fadds	%f2 ,%f15,%f11		! %l0 = 00000000000000b9, Unfinished, %fsr = 0000000000
!	Mem[0000000030181400] = cbe011b2 000000ff ffffffff 89000000
!	Mem[0000000030181410] = ffffffff 000000ff 1a7531a7 8788c6cd
!	Mem[0000000030181420] = 35340afd 157839c2 74592f4e 299bb4bb
!	Mem[0000000030181430] = 0d2123e9 34e7136a 109da19c 16afb44d
	ldda	[%i6]ASI_BLK_S,%f0	! Block Load from 0000000030181400
!	Mem[0000000010141420] = cbe011b2acef4ef8, %l5 = 0000000000000079
	ldxa	[%i5+0x020]%asi,%l5	! %l5 = cbe011b2acef4ef8
!	Mem[0000000030101400] = 34e7136aeb838479, %l6 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l6	! %l6 = 34e7136aeb838479
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (15)
!	%f20 = 98ffffff 8f289034, Mem[00000000300c1410] = ffffff98 3490288f
	stda	%f20,[%i3+%o5]0x89	! Mem[00000000300c1410] = 98ffffff 8f289034

p0_label_80:
!	%l7 = 0000000000000000, Mem[0000000010141422] = cbe011b2
	stb	%l7,[%i5+0x022]		! Mem[0000000010141420] = cbe000b2
!	Mem[0000000030001410] = ff000000, %l4 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%f4  = ffffffff 000000ff, %l4 = 00000000000000ff
!	Mem[0000000030081418] = 51f2aaac32230641
	add	%i2,0x018,%g1
	stda	%f4,[%g1+%l4]ASI_PST16_S ! Mem[0000000030081418] = ffffffff000000ff
!	Mem[0000000010181410] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f0  = cbe011b2 000000ff ffffffff 89000000
!	%f4  = ffffffff 000000ff 1a7531a7 8788c6cd
!	%f8  = 35340afd 157839c2 74592f4e 299bb4bb
!	%f12 = 0d2123e9 34e7136a 109da19c 16afb44d
	stda	%f0,[%i4]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	%f21 = 8f289034, Mem[0000000010141410] = 798483eb
	sta	%f21,[%i5+%o5]0x80	! Mem[0000000010141410] = 8f289034
!	%l7 = 0000000000000000, Mem[0000000030141400] = 162bf0f29a421fd5
	stxa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	%f19 = 00000000, Mem[0000000010001408] = ffffe764
	sta	%f19,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%f26 = 6ad014b2, Mem[0000000010101420] = 162bf0f2
	sta	%f26,[%i4+0x020]%asi	! Mem[0000000010101420] = 6ad014b2
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff0000ff33d76dda, %f30 = 4613c66d 1e4f7940
	ldda	[%i6+%o5]0x80,%f30	! %f30 = ff0000ff 33d76dda

p0_label_81:
!	Mem[0000000010141410] = 8f289034, %l7 = 0000000000000000
	lduha	[%i5+%o5]0x80,%l7	! %l7 = 0000000000008f28
!	Mem[0000000010141408] = e4ede0b784ff0070, %l1 = 0000000000000097
	ldxa	[%i5+%o4]0x88,%l1	! %l1 = e4ede0b784ff0070
!	Mem[0000000030141400] = 00000000, %l5 = cbe011b2acef4ef8
	lduwa	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 7000ff84, %l5 = 0000000000000000
	ldsba	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000070
!	Mem[0000000010181400] = 798483eb6a13e779, %l6 = 34e7136aeb838479
	ldxa	[%i6+%g0]0x88,%l6	! %l6 = 798483eb6a13e779
!	Mem[0000000010001408] = 000000004e6eb823, %f18 = 810dda80 00000000
	ldda	[%i0+%o4]0x80,%f18	! %f18 = 00000000 4e6eb823
!	Mem[00000000300c1400] = ffffbbeb, %l5 = 0000000000000070
	ldsba	[%i3+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000211c0000] = ff1258bc, %l0 = 00000000000000b9
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffff12
!	Mem[0000000030141410] = 34e7136a, %l1 = e4ede0b784ff0070
	lduba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000034
!	Starting 10 instruction Store Burst
!	%l0 = ffffff12, %l1 = 00000034, Mem[0000000010041400] = ff000000 5e6bb831
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffff12 00000034

p0_label_82:
!	Mem[0000000010181400] = 6a13e779, %l4 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000079
!	%f0  = cbe011b2 000000ff ffffffff 89000000
!	%f4  = ffffffff 000000ff 1a7531a7 8788c6cd
!	%f8  = 35340afd 157839c2 74592f4e 299bb4bb
!	%f12 = 0d2123e9 34e7136a 109da19c 16afb44d
	stda	%f0,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	Mem[0000000030141408] = 31b86b5e, %l2 = 00000000ff000000
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 00000031000000ff
!	%f20 = 98ffffff 8f289034, Mem[0000000030181410] = ffffffff ff000000
	stda	%f20,[%i6+%o5]0x89	! Mem[0000000030181410] = 98ffffff 8f289034
!	Mem[0000000010141408] = 84ff0070, %l5 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 00000070000000ff
	membar	#Sync			! Added by membar checker (16)
!	%f29 = 152a7b16, Mem[0000000010081420] = d3c415d3
	sta	%f29,[%i2+0x020]%asi	! Mem[0000000010081420] = 152a7b16
!	%f10 = 74592f4e, Mem[0000000010181408] = ffffffff
	sta	%f10,[%i6+%o4]0x80	! Mem[0000000010181408] = 74592f4e
!	%l0 = ffffff12, %l1 = 00000034, Mem[0000000010081400] = ff120000 f5ff87cf
	stda	%l0,[%i2+0x000]%asi	! Mem[0000000010081400] = ffffff12 00000034
!	Mem[0000000010101410] = eb838479779994fd, %l6 = 798483eb6a13e779, %l4 = 0000000000000079
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = eb838479779994fd
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 84ff00ff, %l6 = 798483eb6a13e779
	lduha	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff

p0_label_83:
!	Mem[00000000100c1414] = eb838479, %f21 = 8f289034
	ld	[%i3+0x014],%f21	! %f21 = eb838479
!	Mem[0000000030181400] = cbe011b2, %l7 = 0000000000008f28
	lduwa	[%i6+%g0]0x81,%l7	! %l7 = 00000000cbe011b2
!	Mem[0000000030141408] = 33d76dda5e6bb8ff, %f22 = f4df2837 efe09bab
	ldda	[%i5+%o4]0x89,%f22	! %f22 = 33d76dda 5e6bb8ff
!	Mem[0000000010101438] = 7000ff84, %l2 = 0000000000000031
	lduw	[%i4+0x038],%l2		! %l2 = 000000007000ff84
!	Mem[0000000010141400] = 00000000, %l7 = 00000000cbe011b2
	ldsba	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 00000089ffffffff, %f0  = cbe011b2 000000ff
	ldda	[%i2+%o4]0x89,%f0 	! %f0  = 00000089 ffffffff
!	Mem[0000000010041400] = ffffff1200000034, %l0 = ffffffffffffff12
	ldxa	[%i1+0x000]%asi,%l0	! %l0 = ffffff1200000034
!	Mem[0000000010041408] = ff00007989000000, %f6  = 1a7531a7 8788c6cd
	ldda	[%i1+%o4]0x80,%f6 	! %f6  = ff000079 89000000
!	Mem[0000000030081410] = ffffffff 000000ff, %l0 = 00000034, %l1 = 00000034
	ldda	[%i2+%o5]0x81,%l0	! %l0 = 00000000ffffffff 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffffffff, Mem[0000000010041410] = 890000ff
	stha	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 8900ffff

p0_label_84:
!	Mem[00000000201c0000] = fc310847, %l5 = 0000000000000070
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 000000fc000000ff
!	%l5 = 00000000000000fc, Mem[0000000030041400] = 39e011b2
	stwa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000fc
!	%l3 = 000000005e6bb831, Mem[0000000021800180] = ff9a809b
	sth	%l3,[%o3+0x180]		! Mem[0000000021800180] = b831809b
!	Mem[00000000211c0001] = ff1258bc, %l1 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 00000012000000ff
!	Mem[0000000010001400] = 00000000, %l4 = eb838479779994fd
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000021800080] = 0a282e44, %l1 = 0000000000000012
	ldstuba	[%o3+0x080]%asi,%l1	! %l1 = 0000000a000000ff
!	%l0 = ffffffff, %l1 = 0000000a, Mem[00000000300c1400] = ffffbbeb 00000048
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff 0000000a
!	Mem[0000000010081410] = eedfffff, %l5 = 00000000000000fc
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010081438] = f317fbab, %l2 = 000000007000ff84
	ldstub	[%i2+0x038],%l2		! %l2 = 000000f3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 6a13e734, %l3 = 000000005e6bb831
	lduha	[%i5+%o5]0x89,%l3	! %l3 = 000000000000e734

p0_label_85:
!	Mem[0000000021800000] = 94ad951b, %l3 = 000000000000e734
	ldsha	[%o3+0x000]%asi,%l3	! %l3 = ffffffffffff94ad
!	Mem[0000000010181410] = ff0000ff33d76dda, %f2  = ffffffff 89000000
	ldda	[%i6+%o5]0x80,%f2 	! %f2  = ff0000ff 33d76dda
!	Mem[0000000010001408] = 23b86e4e 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000 0000000023b86e4e
!	Mem[00000000100c1400] = ffff00ff, %l3 = ffffffffffff94ad
	ldsha	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000201c0000] = ff310847, %l1 = 000000000000000a
	ldsb	[%o0+0x001],%l1		! %l1 = 0000000000000031
!	%l7 = 0000000000000000, Mem[0000000010101410] = fd949977798483eb
	stxa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	Mem[0000000010081400] = ffffff12, %l1 = 0000000000000031
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081410] = ffffdfee, %l4 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 00000000ffffdfee
!	Mem[0000000030101408] = ffffffff89000000, %l4 = 00000000ffffdfee
	ldxa	[%i4+%o4]0x81,%l4	! %l4 = ffffffff89000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800080] = ff282e44, %l6 = 00000000000000ff
	ldstuba	[%o3+0x080]%asi,%l6	! %l6 = 000000ff000000ff

p0_label_86:
!	%l4 = ffffffff89000000, Mem[0000000030041400] = 000000fc
	stba	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000fc
!	%l7 = 0000000000000000, Mem[0000000010041408] = 790000ff
	stwa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[00000000100c1410] = 9a421fd5, %l0 = 00000000ffffffff
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 000000d5000000ff
!	%f8  = 35340afd, Mem[0000000010001408] = 00000000
	sta	%f8 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 35340afd
!	Mem[0000000010041410] = ffff0089, %l1 = 00000000000000ff
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000ffff0089
!	Mem[0000000030001400] = fcff2a98, %l3 = 00000000000000ff
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 000000fc000000ff
!	%f30 = ff0000ff, Mem[0000000010081420] = 152a7b16
	st	%f30,[%i2+0x020]	! Mem[0000000010081420] = ff0000ff
!	%f24 = 68ebf655 d87b3978, Mem[0000000010001418] = 1a7531a7 269c9d4b
	stda	%f24,[%i0+0x018]%asi	! Mem[0000000010001418] = 68ebf655 d87b3978
!	%f16 = ffffbbeb 00000048 00000000 4e6eb823
!	%f20 = 98ffffff eb838479 33d76dda 5e6bb8ff
!	%f24 = 68ebf655 d87b3978 6ad014b2 b8230000
!	%f28 = 3c76f8fb 152a7b16 ff0000ff 33d76dda
	stda	%f16,[%i6]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010181400] = ffffbbeb 00000048, %l2 = 000000f3, %l3 = 000000fc
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000048 00000000ffffbbeb

p0_label_87:
!	Mem[0000000010001410] = 00000000, %l5 = 0000000023b86e4e
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 8f289034, %l1 = 00000000ffff0089
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 0000000000009034
!	Mem[0000000010001410] = 00000000, %l5 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = ff310847, %l0 = 00000000000000d5
	ldsba	[%o0+0x001]%asi,%l0	! %l0 = 0000000000000031
!	Mem[0000000010101408] = 00000000, %l2 = 0000000000000048
	lduwa	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l4 = ffffffff89000000
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010081408] = ff000000, %l4 = ffffffffff000000
	lduba	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141400] = 00000000, %l4 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181428] = 000023b8b214d06a, %f14 = 109da19c 16afb44d
	ldda	[%i6+0x028]%asi,%f14	! %f14 = 000023b8 b214d06a
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000009034, Mem[0000000030181408] = ffffffff
	stba	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffff34

p0_label_88:
!	Mem[0000000010041400] = 12ffffff, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010001400] = 779994fd, %l1 = 0000000000009034
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000779994fd
!	Mem[0000000010101408] = 00000000, %l6 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141420] = cbe000b2acef4ef8, %l0 = 0000000000000031, %l3 = 00000000ffffbbeb
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = cbe000b2acef4ef8
!	Mem[0000000030081408] = ffffffff, %l3 = cbe000b2acef4ef8
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010081434] = 00009977, %l5 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x034]%asi,%l5	! %l5 = 0000000000009977
!	%l6 = 0000000000000000, Mem[0000000010101414] = 00000000
	stw	%l6,[%i4+0x014]		! Mem[0000000010101414] = 00000000
!	Mem[000000001018141c] = da6dd733, %l2 = 00000000, %l5 = 00009977
	add	%i6,0x1c,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 00000000da6dd733
!	%l3 = 00000000000000ff, Mem[0000000021800101] = 003c8452
	stb	%l3,[%o3+0x101]		! Mem[0000000021800100] = 00ff8452
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff000000 00000000, %l4 = 00000000, %l5 = da6dd733
	ldda	[%i2+%o4]0x80,%l4	! %l4 = 00000000ff000000 0000000000000000

p0_label_89:
!	Mem[0000000010181410] = 798483eb ffffff98, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 00000000798483eb 00000000ffffff98
!	Mem[0000000010041408] = 0000000089000000, %f18 = 00000000 4e6eb823
	ldda	[%i1+%o4]0x80,%f18	! %f18 = 00000000 89000000
!	Mem[0000000010101410] = 00000000, %l0 = 0000000000000031
	ldsha	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 64e7000023b86e4e, %l0 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = 64e7000023b86e4e
!	Mem[0000000030041410] = ffffff98, %l0 = 64e7000023b86e4e
	lduba	[%i1+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0000] = ff310847, %l1 = 00000000779994fd
	ldsb	[%o0+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[00000000100c1424] = 1132255f, %l2 = 00000000798483eb
	ldsha	[%i3+0x024]%asi,%l2	! %l2 = 0000000000001132
!	Mem[0000000010001410] = 00000000, %l0 = 00000000000000ff
	lduh	[%i0+0x012],%l0		! %l0 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff 00003c3b, %l4 = ff000000, %l5 = 00000000
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 00000000ffffffff 0000000000003c3b
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030101408] = ffffffff
	stha	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ffff

p0_label_90:
!	%l7 = 0000000000000000, Mem[00000000300c1408] = 810dda80
	stba	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000dda80
!	Mem[0000000010001400] = 34900000, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l6	! %l6 = 0000000034900000
!	Mem[0000000010181408] = 4e6eb823, %l2 = 0000000000001132
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 00000023000000ff
!	%l4 = 00000000ffffffff, Mem[0000000010181400] = 00000048
	stwa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff
!	Mem[00000000100c1414] = eb838479, %l1 = ffffffffffffffff, %asi = 80
	swapa	[%i3+0x014]%asi,%l1	! %l1 = 00000000eb838479
!	Mem[0000000010141410] = 3490288f, %l4 = 00000000ffffffff
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 000000003490288f
!	%l1 = 00000000eb838479, Mem[0000000030001408] = e4ede0b7cf8753b2
	stxa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000eb838479
!	Mem[0000000030101400] = cbe011b2, %l5 = 0000000000003c3b
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000cbe011b2
!	%l5 = 00000000cbe011b2, Mem[00000000100c1408] = ffffffff
	stba	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = b2ffffff
!	Starting 10 instruction Load Burst
!	Mem[000000001014142c] = 7700fffc, %l0 = 0000000000000000
	ldsba	[%i5+0x02d]%asi,%l0	! %l0 = 0000000000000000

p0_label_91:
!	Mem[00000000300c1400] = ffffffff, %f24 = 68ebf655
	lda	[%i3+%g0]0x81,%f24	! %f24 = ffffffff
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000030081400] = cbe011b2 000000ff ffffffff 89000000
!	Mem[0000000030081410] = ffffffff 000000ff 1a7531a7 8788c6cd
!	Mem[0000000030081420] = 35340afd 157839c2 74592f4e 299bb4bb
!	Mem[0000000030081430] = 0d2123e9 34e7136a 109da19c 16afb44d
	ldda	[%i2]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030081400
!	Mem[0000000030141410] = 798483eb6a13e734, %l5 = 00000000cbe011b2
	ldxa	[%i5+%o5]0x89,%l5	! %l5 = 798483eb6a13e734
!	Mem[0000000010081408] = ff000000, %l3 = 00000000ffffff98
	lduba	[%i2+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = ffffff12 00000034, %l6 = 34900000, %l7 = 00000000
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ffffff12 0000000000000034
!	Mem[0000000010001408] = fd0a34354e6eb823, %f14 = 000023b8 b214d06a
	ldda	[%i0+%o4]0x80,%f14	! %f14 = fd0a3435 4e6eb823
!	Mem[0000000010141400] = 00000000, %f13 = 34e7136a
	lda	[%i5+%g0]0x88,%f13	! %f13 = 00000000
!	Mem[00000000211c0000] = ffff58bc, %l4 = 000000003490288f
	ldsba	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = ffffdfee, %l7 = 0000000000000034
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ff000000, %l7 = ffffffffffffffff
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 00000000ff000000

p0_label_92:
!	%l6 = 00000000ffffff12, Mem[0000000010001400] = 00000000
	stwa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffff12
!	Mem[0000000010041430] = 64e76351, %l2 = 0000000000000023
	ldstub	[%i1+0x030],%l2		! %l2 = 00000064000000ff
!	%l1 = 00000000eb838479, Mem[0000000030141410] = 6a13e734
	stha	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 6a138479
!	%l2 = 0000000000000064, Mem[0000000010041420] = 927a5681d8188706, %asi = 80
	stxa	%l2,[%i1+0x020]%asi	! Mem[0000000010041420] = 0000000000000064
!	Mem[0000000030081408] = ffffffff, %l2 = 0000000000000064
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 00000000ffffffff
!	%l0 = 0000000000000000, Mem[0000000010181400] = ffffffff
	stba	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 00ffffff
!	Mem[0000000030181408] = ffffff34, %l0 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 00000034000000ff
!	Mem[0000000010141400] = 00000000000000ff, %l0 = 0000000000000034, %l7 = 00000000ff000000
	casxa	[%i5]0x80,%l0,%l7	! %l7 = 00000000000000ff
!	%l6 = ffffff12, %l7 = 000000ff, Mem[0000000030041408] = 0000e764 4e6eb823
	stda	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffff12 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 9a421fff, %l5 = 798483eb6a13e734
	ldsha	[%i3+%o5]0x88,%l5	! %l5 = 0000000000001fff

p0_label_93:
!	Mem[0000000010041434] = 0000e764, %l1 = 00000000eb838479
	lduw	[%i1+0x034],%l1		! %l1 = 000000000000e764
!	Mem[0000000010041438] = 1549dfee, %l5 = 0000000000001fff
	ldswa	[%i1+0x038]%asi,%l5	! %l5 = 000000001549dfee
!	Mem[0000000030001410] = ffffffff, %l1 = 000000000000e764
	lduha	[%i0+%o5]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010001410] = 0000000000000097, %f4  = ffffffff 000000ff
	ldda	[%i0+%o5]0x80,%f4 	! %f4  = 00000000 00000097
!	Mem[0000000030041400] = fc000000, %l2 = 00000000ffffffff
	ldswa	[%i1+%g0]0x89,%l2	! %l2 = fffffffffc000000
!	Mem[00000000300c1408] = 00000000 80da0d00, %l0 = 00000034, %l1 = 0000ffff
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 0000000080da0d00 0000000000000000
!	Mem[0000000030181410] = 8f289034, %l4 = ffffffffffffffff
	ldsba	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000034
!	Mem[0000000010001400] = 12ffffff, %l3 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = 3400000012ffffff, %l0 = 0000000080da0d00
	ldxa	[%i2+%g0]0x88,%l0	! %l0 = 3400000012ffffff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[00000000100c1420] = 87febdaf
	stw	%l7,[%i3+0x020]		! Mem[00000000100c1420] = 000000ff

p0_label_94:
!	%f12 = 0d2123e9 00000000, Mem[0000000010181420] = 78397bd8 55f6eb68
	stda	%f12,[%i6+0x020]%asi	! Mem[0000000010181420] = 0d2123e9 00000000
!	%f0  = 00000089 ffffffff, Mem[0000000010181430] = 167b2a15 fbf8763c
	std	%f0 ,[%i6+0x030]	! Mem[0000000010181430] = 00000089 ffffffff
!	Mem[0000000030041400] = 000000fc, %l7 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%f0  = 00000089 ffffffff, %l0 = 3400000012ffffff
!	Mem[00000000300c1428] = 6ad014b2b8230000
	add	%i3,0x028,%g1
	stda	%f0,[%g1+%l0]ASI_PST8_SL ! Mem[00000000300c1428] = ffffffff89000000
!	%l0 = 3400000012ffffff, Mem[0000000020800001] = 00ff261d
	stb	%l0,[%o1+0x001]		! Mem[0000000020800000] = 00ff261d
!	%l2 = fffffffffc000000, Mem[00000000300c1408] = 80da0d00
	stba	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 80da0d00
!	%l4 = 0000000000000034, Mem[00000000300c1400] = ffffffff
	stwa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000034
!	%l7 = 0000000000000000, Mem[00000000100c1400] = ff00ffff
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%f12 = 0d2123e9 00000000, Mem[0000000030141400] = 00000000 00000000
	stda	%f12,[%i5+%g0]0x81	! Mem[0000000030141400] = 0d2123e9 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 9a421fff, %l4 = 0000000000000034
	ldswa	[%i3+%o5]0x88,%l4	! %l4 = ffffffff9a421fff

p0_label_95:
!	Mem[0000000030141410] = 6a138479, %l3 = 00000000000000ff
	lduha	[%i5+%o5]0x89,%l3	! %l3 = 0000000000008479
!	Mem[0000000030081410] = ffffffff, %l3 = 0000000000008479
	lduwa	[%i2+%o5]0x81,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010101428] = 00b52edf, %l5 = 000000001549dfee
	lduha	[%i4+0x028]%asi,%l5	! %l5 = 00000000000000b5
!	Mem[0000000010101408] = ff000000, %l5 = 00000000000000b5
	lduwa	[%i4+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[000000001018142c] = b214d06a, %l6 = 00000000ffffff12
	ldub	[%i6+0x02c],%l6		! %l6 = 00000000000000b2
!	Mem[00000000300c1410] = 8f289034, %l6 = 00000000000000b2
	lduba	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000034
!	Mem[0000000010101408] = ff000000, %l4 = ffffffff9a421fff
	lduha	[%i4+%o4]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030101408] = 0000ffff, %f29 = e923210d
	lda	[%i4+%o4]0x81,%f29	! %f29 = 0000ffff
!	Mem[0000000010041400] = 12ffffff, %l7 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l7	! %l7 = 0000000012ffffff
!	Starting 10 instruction Store Burst
!	Mem[000000001010142c] = 98ffffff, %l0 = 3400000012ffffff, %asi = 80
	swapa	[%i4+0x02c]%asi,%l0	! %l0 = 0000000098ffffff

p0_label_96:
!	%f18 = 00000089, Mem[0000000010181410] = eb838479
	sta	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000089
!	%l4 = 000000000000ff00, Mem[0000000030181400] = ff000000b211e0cb
	stxa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000000000ff00
!	Mem[0000000030001400] = 982affff, %l6 = 0000000000000034
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 00000000982affff
!	Mem[0000000010141420] = cbe000b2acef4ef8, %l7 = 0000000012ffffff, %l7 = 0000000012ffffff
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = cbe000b2acef4ef8
!	%l2 = fc000000, %l3 = ffffffff, Mem[0000000010141400] = 00000000 000000ff
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = fc000000 ffffffff
!	Mem[0000000030041408] = 12ffffff, %l4 = 000000000000ff00
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 0000000012ffffff
!	%l5 = 00000000ff000000, Mem[0000000020800001] = 00ff261d, %asi = 80
	stba	%l5,[%o1+0x001]%asi	! Mem[0000000020800000] = 0000261d
!	Mem[00000000300c1400] = 34000000, %l5 = 00000000ff000000
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000034000000ff
!	Mem[0000000010081410] = ffffdfee000000bb, %l4 = 0000000012ffffff, %l7 = cbe000b2acef4ef8
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = ffffdfee000000bb
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 3b3c0000ffffffb2, %l3 = 00000000ffffffff
	ldxa	[%i3+%o4]0x88,%l3	! %l3 = 3b3c0000ffffffb2

p0_label_97:
!	Mem[0000000010101438] = 7000ff84, %l2 = fffffffffc000000
	ldsha	[%i4+0x038]%asi,%l2	! %l2 = 0000000000007000
!	Mem[00000000300c1410] = 3490288f, %l5 = 0000000000000034
	lduwa	[%i3+%o5]0x81,%l5	! %l5 = 000000003490288f
!	Mem[0000000010081410] = eedfffff, %l7 = ffffdfee000000bb
	ldsba	[%i2+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141410] = 7984136a, %l4 = 0000000012ffffff
	lduha	[%i5+%o5]0x81,%l4	! %l4 = 0000000000007984
!	Mem[0000000030101410] = ff000000 ffffffff, %l2 = 00007000, %l3 = ffffffb2
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 00000000ffffffff 00000000ff000000
!	Mem[0000000030041410] = ffffff98, %l5 = 000000003490288f
	lduba	[%i1+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = 000000fc, %l1 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l1	! %l1 = 00000000000000fc
!	Mem[0000000030141408] = 33d76dda5e6bb8ff, %l7 = ffffffffffffffff
	ldxa	[%i5+%o4]0x89,%l7	! %l7 = 33d76dda5e6bb8ff
!	Mem[0000000030101400] = 00003c3b000000ff, %l5 = 00000000000000ff
	ldxa	[%i4+%g0]0x81,%l5	! %l5 = 00003c3b000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00003c3b000000ff, Mem[0000000010141422] = cbe000b2
	stb	%l5,[%i5+0x022]		! Mem[0000000010141420] = cbe0ffb2

p0_label_98:
!	Mem[0000000010041400] = 12ffffff, %l7 = 33d76dda5e6bb8ff
	swapa	[%i1+%g0]0x88,%l7	! %l7 = 0000000012ffffff
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000098ffffff
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %l6 = 00000000982affff
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1425] = 1132255f, %l7 = 0000000012ffffff
	ldstub	[%i3+0x025],%l7		! %l7 = 00000032000000ff
!	%l6 = 00000000000000ff, Mem[00000000100c1408] = b2ffffff
	stwa	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	%l7 = 0000000000000032, Mem[0000000010001400] = ffffff12
	stha	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 0032ff12
!	Mem[0000000030141400] = 0d2123e9, %l1 = 00000000000000fc
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 0000000d000000ff
!	%l5 = 00003c3b000000ff, Mem[0000000010001408] = 35340afd
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	Mem[0000000030081410] = ffffffff, %l5 = 00003c3b000000ff
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 89000000, %l6 = 00000000000000ff
	ldsha	[%i6+%o5]0x80,%l6	! %l6 = ffffffffffff8900

p0_label_99:
!	Mem[0000000030101410] = ffffffff, %l3 = 00000000ff000000
	ldsha	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	%f8  = 35340afd 157839c2, Mem[0000000030041400] = fc0000ff da6dd733
	stda	%f8 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 35340afd 157839c2
!	Mem[0000000010081400] = 12ffffff, %l5 = 00000000000000ff
	lduba	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041400] = 157839c2, %l2 = 00000000ffffffff
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = 00000000000039c2
!	Mem[0000000030041410] = ffffff98df2eb500, %f14 = fd0a3435 4e6eb823
	ldda	[%i1+%o5]0x81,%f14	! %f14 = ffffff98 df2eb500
!	Mem[000000001010142c] = 12ffffff, %f8  = 35340afd
	lda	[%i4+0x02c]%asi,%f8 	! %f8 = 12ffffff
!	Mem[00000000300c1410] = 3490288f, %l1 = 000000000000000d
	lduha	[%i3+%o5]0x81,%l1	! %l1 = 0000000000003490
!	Mem[0000000010181400] = 00ffffffebbbffff, %l1 = 0000000000003490
	ldxa	[%i6+%g0]0x80,%l1	! %l1 = 00ffffffebbbffff
!	Mem[00000000201c0000] = ff310847, %l7 = 0000000000000032
	ldsb	[%o0+%g0],%l7		! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000007984, Mem[0000000010181410] = 89000000ffffff98
	stxa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000007984

p0_label_100:
!	%l7 = ffffffffffffffff, Mem[00000000211c0000] = ffff58bc, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff58bc
!	%l0 = 00000000, %l1 = ebbbffff, Mem[00000000300c1400] = 000000ff 0a000000
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 ebbbffff
!	%f2  = ff0000ff 33d76dda, Mem[0000000030141408] = 5e6bb8ff 33d76dda
	stda	%f2 ,[%i5+%o4]0x89	! Mem[0000000030141408] = ff0000ff 33d76dda
!	%l0 = 00000000, %l1 = ebbbffff, Mem[00000000300c1410] = 3490288f ffffff98
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 ebbbffff
!	Mem[000000001000141c] = d87b3978, %l6 = ffffffffffff8900
	ldsha	[%i0+0x01e]%asi,%l6	! %l6 = 0000000000003978
!	Mem[0000000030081400] = cbe011b2, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 00000000cbe011b2
!	%l7 = ffffffffffffffff, Mem[0000000010141400] = 000000fc
	stba	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	Mem[0000000030081400] = 00000000, %l0 = 00000000cbe011b2
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%l6 = 0000000000003978, Mem[00000000300c1400] = 00000000ffffbbeb
	stxa	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000003978
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffb86e4e, %l5 = 00000000000000ff
	lduwa	[%i6+%o4]0x80,%l5	! %l5 = 00000000ffb86e4e

p0_label_101:
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000030001400] = 34000000 33d76dda 798483eb 00000000
!	Mem[0000000030001410] = ffffffff f55387cf ce367da3 d753121c
!	Mem[0000000030001420] = ff000000 b20fc2d9 a41b16cc 4e6eb823
!	Mem[0000000030001430] = 6a13e734 e923210d 9a421fd5 e84387dd
	ldda	[%i0]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030001400
!	Mem[0000000010181400] = ffffff00, %f17 = b211e0cb
	lda	[%i6+%g0]0x88,%f17	! %f17 = ffffff00
!	Mem[0000000010181400] = 00ffffff, %f25 = fd0a3435
	lda	[%i6+%g0]0x80,%f25	! %f25 = 00ffffff
!	Mem[0000000010001438] = 109da19c16afb44d, %l3 = ffffffffffffffff
	ldxa	[%i0+0x038]%asi,%l3	! %l3 = 109da19c16afb44d
!	Mem[00000000300c1410] = 00000000, %f23 = a731751a
	lda	[%i3+%o5]0x89,%f23	! %f23 = 00000000
!	Mem[0000000030041408] = 000000ff00ff0000, %l5 = 00000000ffb86e4e
	ldxa	[%i1+%o4]0x89,%l5	! %l5 = 000000ff00ff0000
!	Mem[0000000030101400] = 00003c3b000000ff, %l1 = 00ffffffebbbffff
	ldxa	[%i4+%g0]0x81,%l1	! %l1 = 00003c3b000000ff
!	Mem[0000000010081408] = ff000000, %l0 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000020800040] = e7644bbb, %l2 = 00000000000039c2
	ldub	[%o1+0x041],%l2		! %l2 = 0000000000000064
!	Starting 10 instruction Store Burst
!	%f30 = 4db4af16 9ca19d10, Mem[0000000030101408] = 0000ffff 89000000
	stda	%f30,[%i4+%o4]0x81	! Mem[0000000030101408] = 4db4af16 9ca19d10

p0_label_102:
!	%f20 = ff000000, Mem[0000000010181400] = 00ffffff
	sta	%f20,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000000
!	%f17 = ffffff00, Mem[000000001000140c] = 4e6eb823
	sta	%f17,[%i0+0x00c]%asi	! Mem[000000001000140c] = ffffff00
!	%l7 = ffffffffffffffff, Mem[0000000030101408] = 4db4af16
	stba	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = ffb4af16
!	%l2 = 00000064, %l3 = 16afb44d, Mem[0000000030041410] = ffffff98 df2eb500
	stda	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000064 16afb44d
!	%f22 = cdc68887 00000000, %l4 = 0000000000007984
!	Mem[0000000030141428] = 068718d874437a03
	add	%i5,0x028,%g1
	stda	%f22,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030141428] = 068718d874437a03
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000030101400] = 3b3c0000 ff000000
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff 000000ff
!	%l3 = 109da19c16afb44d, Mem[0000000010101428] = 00b52edf12ffffff
	stx	%l3,[%i4+0x028]		! Mem[0000000010101428] = 109da19c16afb44d
!	Mem[0000000030081400] = cbe011b2, %l5 = 000000ff00ff0000
	ldswa	[%i2+%g0]0x89,%l5	! %l5 = ffffffffcbe011b2
!	Mem[0000000030041400] = c2397815, %l3 = 109da19c16afb44d
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000c2397815
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff2123e9 00000000, %l4 = 00007984, %l5 = cbe011b2
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 00000000ff2123e9 0000000000000000

p0_label_103:
!	Mem[00000000211c0000] = ffff58bc, %l2 = 0000000000000064
	ldub	[%o2+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010101400] = 64e7000023b86e4e, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l5	! %l5 = 64e7000023b86e4e
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000003978
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 34000000, %f29 = 0000ffff
	lda	[%i0+%g0]0x81,%f29	! %f29 = 34000000
!	Mem[0000000010101408] = 982affff, %f22 = cdc68887
	lda	[%i4+%o4]0x88,%f22	! %f22 = 982affff
!	Mem[0000000030001400] = 00000034, %f30 = 4db4af16
	lda	[%i0+%g0]0x89,%f30	! %f30 = 00000034
!	Mem[0000000010101408] = ffff2a98ffffffff, %f22 = 982affff 00000000
	ldda	[%i4+%o4]0x80,%f22	! %f22 = ffff2a98 ffffffff
!	Mem[0000000010101400] = 4e6eb8230000e764, %l5 = 64e7000023b86e4e
	ldxa	[%i4+%g0]0x80,%l5	! %l5 = 4e6eb8230000e764
!	Mem[0000000030081400] = cbe011b2, %l4 = 00000000ff2123e9
	ldswa	[%i2+%g0]0x89,%l4	! %l4 = ffffffffcbe011b2
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (20)
!	%f30 = 00000034 9ca19d10, Mem[0000000030001410] = ffffffff cf8753f5
	stda	%f30,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000034 9ca19d10

p0_label_104:
!	%l6 = 0000000000000000, Mem[00000000100c140f] = 00003c3b
	stb	%l6,[%i3+0x00f]		! Mem[00000000100c140c] = 00003c00
!	%l7 = ffffffffffffffff, Mem[0000000010081420] = ff0000ff
	stw	%l7,[%i2+0x020]		! Mem[0000000010081420] = ffffffff
!	Mem[0000000010001410] = 00000000, %l3 = 00000000c2397815
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = 000dda80, %l0 = 00000000000000ff
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 00000000000dda80
!	%f14 = dd8743e8 d51f429a, Mem[0000000030001410] = 109da19c 34000000
	stda	%f14,[%i0+%o5]0x81	! Mem[0000000030001410] = dd8743e8 d51f429a
!	%l2 = 0000000000000000, Mem[0000000010041410] = ff000000
	stwa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Mem[00000000100c1408] = 000000ff, %l5 = 4e6eb8230000e764
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%f20 = ff000000 ffffffff, %l4 = ffffffffcbe011b2
!	Mem[0000000030101428] = 74592f4e299bb4bb
	add	%i4,0x028,%g1
	stda	%f20,[%g1+%l4]ASI_PST32_S ! Mem[0000000030101428] = ff000000299bb4bb
!	Starting 10 instruction Load Burst
!	Mem[000000001004143c] = 000064e7, %l2 = 0000000000000000
	lduha	[%i1+0x03e]%asi,%l2	! %l2 = 00000000000064e7

p0_label_105:
!	Mem[0000000010181410] = 00000000, %l2 = 00000000000064e7
	ldsha	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %f5  = ffffffff
	lda	[%i3+%o5]0x89,%f5 	! %f5 = 00000000
!	Mem[0000000010141424] = acef4ef8, %f28 = 6a13e734
	ld	[%i5+0x024],%f28	! %f28 = acef4ef8
!	Mem[0000000010141410] = ffffffff, %l6 = 0000000000000000
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030081410] = ffffffff000000ff, %f18 = 00000089 ffffffff
	ldda	[%i2+%o5]0x81,%f18	! %f18 = ffffffff 000000ff
!	Mem[0000000010141410] = ffffffff 6a13e734, %l0 = 000dda80, %l1 = 000000ff
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 00000000ffffffff 000000006a13e734
!	Mem[0000000010101410] = 00000000000000ff, %f16 = ff000000 ffffff00
	ldda	[%i4+%o5]0x88,%f16	! %f16 = 00000000 000000ff
!	Mem[0000000010001438] = 109da19c, %l6 = 00000000ffffffff
	lduw	[%i0+0x038],%l6		! %l6 = 00000000109da19c
!	Mem[0000000010101428] = 109da19c, %l6 = 00000000109da19c
	lduba	[%i4+0x02b]%asi,%l6	! %l6 = 000000000000009c
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = ff1f429a, %l3 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 000000ff000000ff

p0_label_106:
!	%f24 = c2397815, Mem[0000000010101430] = 000000ff
	sta	%f24,[%i4+0x030]%asi	! Mem[0000000010101430] = c2397815
!	Mem[0000000030081410] = ffffffff, %l6 = 000000000000009c
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	%f4  = cf8753f5, Mem[0000000010041428] = 9f98d02e
	st	%f4 ,[%i1+0x028]	! Mem[0000000010041428] = cf8753f5
!	%l2 = 0000000000000000, Mem[0000000030141408] = 33d76dda
	stha	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 33d70000
!	%l6 = 000000ff, %l7 = ffffffff, Mem[0000000030081408] = 00000064 89000000
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000ff ffffffff
!	%f6  = 1c1253d7 a37d36ce, %l1 = 000000006a13e734
!	Mem[0000000030141408] = 0000d733ff0000ff
	add	%i5,0x008,%g1
	stda	%f6,[%g1+%l1]ASI_PST8_S ! Mem[0000000030141408] = 000053d7ff7d00ff
!	Mem[0000000030001410] = e84387dd, %l6 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 00000000e84387dd
!	Mem[00000000100c1437] = 3787a7ff, %l4 = ffffffffcbe011b2
	ldstuba	[%i3+0x037]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000100c1406] = ffffffff, %l4 = 00000000000000ff
	ldstuba	[%i3+0x006]%asi,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 4e6eb823, %l0 = 00000000ffffffff
	lduwa	[%i4+%g0]0x80,%l0	! %l0 = 000000004e6eb823

p0_label_107:
!	Mem[0000000010041400] = 5e6bb8ff, %l7 = ffffffffffffffff
	ldswa	[%i1+%g0]0x88,%l7	! %l7 = 000000005e6bb8ff
!	Mem[0000000030001410] = ff000000d51f429a, %f26 = bbb49b29 4e2f5974
	ldda	[%i0+%o5]0x81,%f26	! %f26 = ff000000 d51f429a
!	Mem[0000000010101410] = ff00000000000000, %l1 = 000000006a13e734
	ldx	[%i4+%o5],%l1		! %l1 = ff00000000000000
!	Mem[0000000010001408] = ff000000, %l4 = 00000000000000ff
	ldsh	[%i0+0x00a],%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l3 = 00000000000000ff
	ldsba	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 4e6eb823, %l5 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l5	! %l5 = 0000000000004e6e
!	Mem[00000000211c0000] = ffff58bc, %l0 = 000000004e6eb823
	lduba	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1408] = 003c0000 ff0000ff, %l4 = 00000000, %l5 = 00004e6e
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000ff0000ff 00000000003c0000
!	Mem[0000000030181408] = ffffffff, %l2 = 0000000000000000
	lduba	[%i6+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f24 = c2397815 00ffffff, Mem[0000000030001410] = 000000ff 9a421fd5
	stda	%f24,[%i0+%o5]0x89	! Mem[0000000030001410] = c2397815 00ffffff

p0_label_108:
!	%l2 = 00000000000000ff, Mem[0000000010141410] = ffffffff
	stha	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = ffff00ff
!	Mem[0000000010041400] = 5e6bb8ff, %l2 = 00000000000000ff
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l5 = 00000000003c0000, Mem[0000000030001400] = 34000000
	stwa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 003c0000
!	Mem[000000001014142c] = 7700fffc, %l6 = 00000000e84387dd, %asi = 80
	swapa	[%i5+0x02c]%asi,%l6	! %l6 = 000000007700fffc
!	Mem[00000000201c0000] = ff310847, %l4 = 00000000ff0000ff
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%f30 = 00000034 9ca19d10, %l0 = 00000000000000ff
!	Mem[0000000030081408] = 000000ffffffffff
	add	%i2,0x008,%g1
	stda	%f30,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030081408] = 109da19c34000000
!	%l3 = 0000000000000000, Mem[00000000100c1424] = 11ff255f, %asi = 80
	stha	%l3,[%i3+0x024]%asi	! Mem[00000000100c1424] = 0000255f
!	%l4 = 000000ff, %l5 = 003c0000, Mem[0000000030081410] = ffffffff 000000ff
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff 003c0000
!	%l0 = 00000000000000ff, Mem[0000000030001400] = 00003c00
	stha	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l2 = 00000000000000ff
	lduba	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000

p0_label_109:
!	Mem[0000000010181434] = ffffffff, %l3 = 0000000000000000
	lduba	[%i6+0x034]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1424] = 0000255f, %l1 = ff00000000000000
	lduh	[%i3+0x024],%l1		! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 0000000000003978, %l4 = 00000000000000ff
	ldxa	[%i3+%g0]0x81,%l4	! %l4 = 0000000000003978
!	Mem[0000000010081400] = 12ffffff, %l0 = 00000000000000ff
	lduba	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1430] = 33b3288f3787a7ff, %f10 = 23b86e4e cc161ba4
	ldd	[%i3+0x030],%f10	! %f10 = 33b3288f 3787a7ff
!	Mem[0000000010041408] = 0000000089000000, %l0 = 00000000000000ff
	ldxa	[%i1+0x008]%asi,%l0	! %l0 = 0000000089000000
!	Mem[00000000100c1410] = 9a421fff, %l5 = 00000000003c0000
	ldswa	[%i3+%o5]0x88,%l5	! %l5 = ffffffff9a421fff
!	Mem[0000000030001400] = ff000000, %l7 = 000000005e6bb8ff
	lduha	[%i0+%g0]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[0000000021800180] = b831809b, %l0 = 0000000089000000
	ldstuba	[%o3+0x180]%asi,%l0	! %l0 = 000000b8000000ff
!	Starting 10 instruction Store Burst
!	%f18 = ffffffff 000000ff, Mem[0000000030081400] = cbe011b2 ff000000
	stda	%f18,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffff 000000ff

p0_label_110:
!	%l0 = 00000000000000b8, Mem[0000000010181400] = ff000000ebbbffff
	stxa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000000000b8
!	%l4 = 00003978, %l5 = 9a421fff, Mem[0000000030181408] = ffffffff 00000089
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00003978 9a421fff
!	Mem[0000000030181400] = 0000ff00, %l7 = 000000000000ff00
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010141416] = 6a13e734, %l7 = 000000000000ff00
	ldstub	[%i5+0x016],%l7		! %l7 = 000000e7000000ff
!	%f30 = 00000034 9ca19d10, Mem[0000000010081408] = 000000ff 00000000
	stda	%f30,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000034 9ca19d10
!	%f4  = cf8753f5 00000000, Mem[0000000030081400] = 000000ff ffffffff
	stda	%f4 ,[%i2+%g0]0x89	! Mem[0000000030081400] = cf8753f5 00000000
!	Mem[0000000030181400] = 0000ff00, %l5 = ffffffff9a421fff
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 000000000000ff00
!	%l4 = 0000000000003978, Mem[0000000010041438] = 1549dfee000064e7, %asi = 80
	stxa	%l4,[%i1+0x038]%asi	! Mem[0000000010041438] = 0000000000003978
!	%f20 = ff000000 ffffffff, %l7 = 00000000000000e7
!	Mem[0000000010101438] = 7000ff84927a5681
	add	%i4,0x038,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010101438] = ffffff84920000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ffffff12, %l7 = 00000000000000e7
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 000000000000ffff

p0_label_111:
!	Mem[00000000100c1410] = ff1f429a, %f24 = c2397815
	lda	[%i3+%o5]0x80,%f24	! %f24 = ff1f429a
!	Mem[00000000300c1410] = 00000000, %f19 = 000000ff
	lda	[%i3+%o5]0x89,%f19	! %f19 = 00000000
!	Mem[0000000010181410] = 84790000 00000000, %l6 = 7700fffc, %l7 = 0000ffff
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000 0000000084790000
!	Mem[0000000030101400] = ff000000, %l1 = 0000000000000000
	ldsba	[%i4+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081400] = 12ffffff, %l2 = 0000000000000000
	ldswa	[%i2+%g0]0x88,%l2	! %l2 = 0000000012ffffff
!	Mem[0000000030101408] = 16afb4ff, %l2 = 0000000012ffffff
	lduha	[%i4+%o4]0x89,%l2	! %l2 = 000000000000b4ff
!	Mem[0000000010101408] = ffff2a98, %l4 = 0000000000003978
	lduha	[%i4+%o4]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010001408] = ff000000, %l6 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010141410] = ffff00ff, %l2 = 000000000000b4ff
	ldsba	[%i5+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f10 = 33b3288f 3787a7ff, %l0 = 00000000000000b8
!	Mem[0000000030181420] = 35340afd157839c2
	add	%i6,0x020,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_S ! Mem[0000000030181420] = 3334288f377839c2

p0_label_112:
!	%f0  = da6dd733 00000034, Mem[0000000030001408] = eb838479 00000000
	stda	%f0 ,[%i0+%o4]0x89	! Mem[0000000030001408] = da6dd733 00000034
!	Mem[00000000100c1408] = ff0000ff, %l0 = 00000000000000b8
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 00000000ff0000ff
!	%l5 = 000000000000ff00, Mem[0000000010141410] = ff00ffff
	stba	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000ffff
!	Mem[0000000030041410] = 64000000, %l3 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 0000000064000000
!	%f2  = 00000000 eb838479, %l0 = 00000000ff0000ff
!	Mem[0000000010181420] = 0d2123e900000000
	add	%i6,0x020,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_P ! Mem[0000000010181420] = 00000000eb838479
!	%l5 = 000000000000ff00, Mem[00000000211c0000] = ffff58bc, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff0058bc
!	Mem[0000000010041408] = 00000000, %l1 = ffffffffffffffff
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 34000000, %l2 = ffffffffffffffff
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 0000000034000000
!	%l4 = 000000000000ffff, Mem[00000000100c1410] = ff1f429affffffff
	stxa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000000000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 78390000, %l3 = 0000000064000000
	lduwa	[%i6+%o4]0x81,%l3	! %l3 = 0000000078390000

p0_label_113:
!	Mem[00000000300c1410] = 00000000, %f0  = da6dd733
	lda	[%i3+%o5]0x81,%f0 	! %f0 = 00000000
!	Mem[0000000010041400] = ffb86b5e, %l3 = 0000000078390000
	ldsh	[%i1+0x002],%l3		! %l3 = 0000000000006b5e
!	Mem[0000000030101410] = ff000000ffffffff, %f20 = ff000000 ffffffff
	ldda	[%i4+%o5]0x89,%f20	! %f20 = ff000000 ffffffff
!	Mem[0000000030001400] = da6dd733 000000ff, %l6 = ffffff00, %l7 = 84790000
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff 00000000da6dd733
!	Mem[0000000010041404] = 00000034, %l1 = 0000000000000000
	ldsw	[%i1+0x004],%l1		! %l1 = 0000000000000034
!	Mem[0000000010101410] = ff00000000000000, %f28 = acef4ef8 34000000
	ldda	[%i4+%o5]0x80,%f28	! %f28 = ff000000 00000000
!	Mem[000000001000141c] = d87b3978, %f8  = d9c20fb2
	lda	[%i0+0x01c]%asi,%f8 	! %f8 = d87b3978
!	Mem[0000000030081410] = ff000000, %l3 = 0000000000006b5e
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030041408] = 0000ff00, %l3 = 00000000ff000000
	lduba	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ff00, Mem[0000000010001408] = ff000000
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000

p0_label_114:
!	%l4 = 000000000000ffff, Mem[0000000010181410] = 00000000
	stwa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000ffff
!	%l2 = 0000000034000000, Mem[0000000030081400] = 00000000
	stha	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%l5 = 000000000000ff00, Mem[00000000300c1400] = 7839000000000000
	stxa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000000000ff00
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = ffffff98
	stba	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff
!	%l2 = 0000000034000000, Mem[0000000030001410] = ffffff00
	stba	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ffff00
!	%l4 = 000000000000ffff, Mem[0000000010041410] = 00000000
	stwa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000ffff
!	Mem[0000000010081415] = 000000bb, %l6 = 00000000000000ff
	ldstuba	[%i2+0x015]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081400] = 12ffffff, %l4 = 000000000000ffff
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 0000000012ffffff
!	%f6  = 1c1253d7 a37d36ce, %f9  = 000000ff
	fdtoi	%f6 ,%f9 		! %f9  = 00000000
!	Starting 10 instruction Load Burst
!	%f18 = ffffffff, Mem[000000001014142c] = e84387dd
	sta	%f18,[%i5+0x02c]%asi	! Mem[000000001014142c] = ffffffff

p0_label_115:
!	Mem[0000000010181400] = 00000000, %l5 = 000000000000ff00
	lduba	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800040] = e7644bbb, %l6 = 0000000000000000
	lduh	[%o1+0x040],%l6		! %l6 = 000000000000e764
!	Mem[0000000010101400] = 23b86e4e, %l5 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l5	! %l5 = 0000000023b86e4e
!	Mem[000000001000141c] = d87b3978, %f11 = 3787a7ff
	lda	[%i0+0x01c]%asi,%f11	! %f11 = d87b3978
!	Mem[0000000010181428] = 000023b8, %l0 = 00000000ff0000ff
	lduba	[%i6+0x02b]%asi,%l0	! %l0 = 00000000000000b8
!	Mem[00000000300c1400] = 00ff0000, %l2 = 0000000034000000
	lduha	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = 5e6bb8ff, %l0 = 00000000000000b8
	lduba	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101410] = ff000000, %l3 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ff000000
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000030041400] = 16afb44d fd0a3435 0000ff00 ff000000
!	Mem[0000000030041410] = ff000000 16afb44d cd4cca3d fd949977
!	Mem[0000000030041420] = d9c20fb2 0000e3ec 982a3c92 4e6eb823
!	Mem[0000000030041430] = ff000000 5e6bb831 9a421fd5 64e76351
	ldda	[%i1]ASI_BLK_S,%f0	! Block Load from 0000000030041400
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[00000000100c142c] = eb838479, %asi = 80
	stwa	%l2,[%i3+0x02c]%asi	! Mem[00000000100c142c] = 000000ff

p0_label_116:
!	%l1 = 0000000000000034, Mem[0000000030101408] = ffb4af16
	stba	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 34b4af16
!	%f18 = ffffffff 00000000, %l7 = 00000000da6dd733
!	Mem[00000000100c1428] = 34e7136a000000ff
	add	%i3,0x028,%g1
	stda	%f18,[%g1+%l7]ASI_PST16_PL ! Mem[00000000100c1428] = 00000000000000ff
!	Mem[0000000021800040] = ff59c626, %l3 = 00000000ff000000
	ldstub	[%o3+0x040],%l3		! %l3 = 000000ff000000ff
!	Mem[0000000030001408] = ffffffff, %l3 = 00000000000000ff
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 00000000ffffffff
!	%l2 = 00000000000000ff, Mem[00000000300c1408] = 000000ff
	stwa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff
!	%l6 = 0000e764, %l7 = da6dd733, Mem[0000000010101410] = 000000ff 00000000
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000e764 da6dd733
!	%f22 = ffff2a98 ffffffff, Mem[0000000030141408] = d7530000 ff007dff
	stda	%f22,[%i5+%o4]0x89	! Mem[0000000030141408] = ffff2a98 ffffffff
!	%l7 = 00000000da6dd733, Mem[0000000030001408] = 000000ff
	stwa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = da6dd733
!	%l7 = 00000000da6dd733, Mem[0000000010081410] = ffffdfee
	stha	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = d733dfee
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000000ff, %l6 = 000000000000e764
	ldsha	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff

p0_label_117:
!	Mem[0000000010081418] = 8479708c3c55e764, %f26 = ff000000 d51f429a
	ldd	[%i2+0x018],%f26	! %f26 = 8479708c 3c55e764
!	Mem[0000000030141408] = ffffffff, %l3 = 00000000ffffffff
	lduba	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041410] = 21c27743 0000ffff, %l0 = 000000ff, %l1 = 00000034
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 000000000000ffff 0000000021c27743
!	Mem[0000000010041408] = ffffffff, %l4 = 0000000012ffffff
	ldsw	[%i1+%o4],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030141408] = ffffffff, %l1 = 0000000021c27743
	lduha	[%i5+%o4]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[00000000300c1408] = 000000ff, %f17 = 000000ff
	lda	[%i3+%o4]0x81,%f17	! %f17 = 000000ff
!	Mem[00000000300c1400] = 0000ff00, %l7 = 00000000da6dd733
	lduha	[%i3+%g0]0x89,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030101408] = 34b4af16, %l4 = ffffffffffffffff
	lduba	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000034
!	Mem[00000000300c1408] = 000000ff, %l4 = 0000000000000034
	lduwa	[%i3+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 0000ff00, %l3 = 00000000000000ff
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff

p0_label_118:
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010001430] = 0d2123e9 34e7136a
	stda	%l2,[%i0+0x030]%asi	! Mem[0000000010001430] = 000000ff 00000000
!	Mem[0000000030001408] = 33d76dda, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l3	! %l3 = 00000033000000ff
!	%l6 = 00000000000000ff, Mem[000000001014143c] = e84387dd, %asi = 80
	stwa	%l6,[%i5+0x03c]%asi	! Mem[000000001014143c] = 000000ff
!	%l4 = 000000ff, %l5 = 23b86e4e, Mem[0000000030101400] = ff000000 ff000000
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff 23b86e4e
!	Mem[0000000010141410] = ffff0000, %l6 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141418] = 000000bb, %l5 = 23b86e4e, %l0 = 0000ffff
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 00000000000000bb
!	%l3 = 0000000000000033, Mem[0000000010141400] = ff000000
	stw	%l3,[%i5+%g0]		! Mem[0000000010141400] = 00000033
!	Mem[0000000010081410] = d733dfee, %l3 = 0000000000000033
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 000000d7000000ff
!	Mem[0000000010081418] = 8479708c3c55e764, %l3 = 00000000000000d7, %l0 = 00000000000000bb
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = 8479708c3c55e764
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff00ff84, %l1 = 000000000000ffff
	lduba	[%i5+%o4]0x80,%l1	! %l1 = 00000000000000ff

p0_label_119:
!	Mem[0000000010101400] = 64e70000 23b86e4e, %l4 = 000000ff, %l5 = 23b86e4e
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 0000000023b86e4e 0000000064e70000
!	Mem[00000000100c1408] = b8000000, %l2 = 00000000000000ff
	ldsba	[%i3+%o4]0x80,%l2	! %l2 = ffffffffffffffb8
!	Mem[0000000030001400] = ff000000 33d76dda, %l6 = 00000000, %l7 = 0000ff00
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 00000000ff000000 0000000033d76dda
!	Mem[00000000100c1420] = 000000ff0000255f, %l4 = 0000000023b86e4e
	ldxa	[%i3+0x020]%asi,%l4	! %l4 = 000000ff0000255f
!	Mem[0000000030181410] = 3490288f, %l2 = ffffffffffffffb8
	lduwa	[%i6+%o5]0x81,%l2	! %l2 = 000000003490288f
!	Mem[0000000010081410] = ff33dfee, %l4 = 000000ff0000255f
	lduba	[%i2+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001408] = da6dd733da6dd7ff, %l2 = 000000003490288f
	ldxa	[%i0+%o4]0x89,%l2	! %l2 = da6dd733da6dd7ff
!	Mem[0000000020800000] = 0000261d, %l6 = 00000000ff000000
	ldsb	[%o1+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041410] = ff000000 16afb44d, %l0 = 3c55e764, %l1 = 000000ff
	ldda	[%i1+%o5]0x81,%l0	! %l0 = 00000000ff000000 0000000016afb44d
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 33d76dda, Mem[00000000300c1400] = 00ff0000 00000000
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 33d76dda

p0_label_120:
!	%l0 = 00000000ff000000, Mem[0000000010101400] = 4e6eb823
	stha	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000b823
!	Mem[00000000211c0001] = ff0058bc, %l7 = 0000000033d76dda
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030001410] = 00ffff00
	stha	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000ff00
!	Mem[0000000021800081] = ff282e44, %l7 = 0000000000000000
	ldstub	[%o3+0x081],%l7		! %l7 = 00000028000000ff
!	%l2 = da6dd7ff, %l3 = 000000d7, Mem[0000000010081410] = ff33dfee 00ff00bb
	std	%l2,[%i2+%o5]		! Mem[0000000010081410] = da6dd7ff 000000d7
!	Mem[0000000030141400] = e92321ff, %l5 = 0000000064e70000
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%f2  = 0000ff00 ff000000, %l3 = 00000000000000d7
!	Mem[0000000030101418] = 1a7531a78788c6cd
	add	%i4,0x018,%g1
	stda	%f2,[%g1+%l3]ASI_PST16_S ! Mem[0000000030101418] = 1a75ff00ff000000
!	%f10 = 982a3c92 4e6eb823, %l2 = da6dd733da6dd7ff
!	Mem[0000000010141430] = fc01d20a2d60334d
	add	%i5,0x030,%g1
	stda	%f10,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010141430] = 23b86e4e923c2a98
!	%f30 = 00000034 9ca19d10, Mem[0000000030181400] = ff1f429a 00000000
	stda	%f30,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000034 9ca19d10
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff58bc, %l0 = 00000000ff000000
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffffff

p0_label_121:
!	Mem[00000000211c0000] = ffff58bc, %l4 = 00000000000000ff
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010081408] = 109da19c, %l3 = 00000000000000d7
	lduba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000010
!	Mem[00000000300c1408] = 00000000ff000000, %f12 = ff000000 5e6bb831
	ldda	[%i3+%o4]0x89,%f12	! %f12 = 00000000 ff000000
!	Mem[0000000010081410] = d7000000ffd76dda, %f8  = d9c20fb2 0000e3ec
	ldda	[%i2+%o5]0x88,%f8 	! %f8  = d7000000 ffd76dda
!	Mem[0000000010101410] = 0000e764, %l6 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l6	! %l6 = 000000000000e764
!	Mem[0000000010141434] = 923c2a98, %l5 = 00000000000000ff
	lduha	[%i5+0x034]%asi,%l5	! %l5 = 000000000000923c
!	Mem[0000000010141410] = ffff00ff, %l1 = 0000000016afb44d
	lduwa	[%i5+%o5]0x88,%l1	! %l1 = 00000000ffff00ff
!	Mem[0000000010001408] = 00000000ffffff00, %l6 = 000000000000e764
	ldxa	[%i0+%o4]0x80,%l6	! %l6 = 00000000ffffff00
!	Mem[0000000010101410] = 64e70000, %l1 = 00000000ffff00ff
	lduha	[%i4+%o5]0x80,%l1	! %l1 = 00000000000064e7
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000010, Mem[0000000030141400] = e92321ff
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = e9232110

p0_label_122:
!	%l6 = ffffff00, %l7 = 00000028, Mem[0000000010181408] = ffb86e4e 00000000
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffff00 00000028
!	Mem[000000001004140c] = 89000000, %l2 = da6dd733da6dd7ff
	ldstuba	[%i1+0x00c]%asi,%l2	! %l2 = 00000089000000ff
!	Mem[0000000030041410] = 000000ff, %l4 = ffffffffffffffff
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000ffffff00, Mem[0000000010101410] = 0000e764
	stwa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffff00
!	%l3 = 0000000000000010, Mem[0000000010181410] = ffff0000
	stwa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000010
!	%l2 = 0000000000000089, Mem[0000000030081408] = 9ca19d10
	stha	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 9ca10089
!	%l6 = 00000000ffffff00, Mem[0000000030001400] = 000000ff
	stba	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[000000001000140c] = ffffff00, %l4 = 000000ff, %l1 = 000064e7
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 00000000ffffff00
!	Mem[0000000030101410] = ffffffff, %l4 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l4	! %l4 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff58bc, %l0 = ffffffffffffffff
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffffff

p0_label_123:
!	Mem[0000000010081408] = 109da19c, %f29 = 00000000
	lda	[%i2+%o4]0x80,%f29	! %f29 = 109da19c
!	Mem[00000000100c1430] = 33b3288f3787a7ff, %f30 = 00000034 9ca19d10
	ldd	[%i3+0x030],%f30	! %f30 = 33b3288f 3787a7ff
!	Mem[0000000010101410] = 00ffffff, %l5 = 000000000000923c
	lduwa	[%i4+%o5]0x80,%l5	! %l5 = 0000000000ffffff
!	Mem[000000001010140c] = ffffffff, %l6 = 00000000ffffff00
	lduba	[%i4+0x00d]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181410] = 3490288f, %l0 = ffffffffffffffff
	ldsha	[%i6+%o5]0x81,%l0	! %l0 = 0000000000003490
!	Mem[00000000100c1408] = 000000b8, %l1 = 00000000ffffff00
	ldswa	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000b8
!	Mem[0000000030001408] = da6dd733 da6dd7ff, %l6 = 000000ff, %l7 = 00000028
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000da6dd7ff 00000000da6dd733
!	Mem[0000000010181430] = 00000089ffffffff, %f18 = ffffffff 00000000
	ldda	[%i6+0x030]%asi,%f18	! %f18 = 00000089 ffffffff
!	Mem[0000000010001400] = 12ff3200, %l6 = 00000000da6dd7ff
	ldsba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000089, Mem[0000000010001400] = 0032ff12
	stha	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 0089ff12

p0_label_124:
!	Mem[00000000100c1414] = 0000ffff, %l1 = 00000000000000b8
	ldstub	[%i3+0x014],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010081408] = 109da19c, %l5 = 0000000000ffffff
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 00000010000000ff
!	Mem[0000000030041408] = 00ff00ff, %l7 = 00000000da6dd733
	ldstuba	[%i1+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	%f24 = ff1f429a 00ffffff, %l3 = 0000000000000010
!	Mem[0000000010181400] = 00000000000000b8
	stda	%f24,[%i6+%l3]ASI_PST16_P ! Mem[0000000010181400] = 00000000000000b8
!	Mem[0000000020800001] = 0000261d, %l6 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	%l2 = 0000000000000089, Mem[0000000010181408] = 00ffffff
	stba	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 00ffff89
!	%f9  = ffd76dda, Mem[0000000010001400] = 12ff8900
	sta	%f9 ,[%i0+%g0]0x88	! Mem[0000000010001400] = ffd76dda
!	Mem[0000000010181400] = 00000000, %l4 = 00000000ffffffff
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000030141410] = 7984136a
	stba	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 0084136a
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = d442a805, %l6 = 0000000000000000
	ldsha	[%o3+0x1c0]%asi,%l6	! %l6 = ffffffffffffd442

p0_label_125:
!	Mem[0000000030181410] = 8f289034, %l7 = 00000000000000ff
	ldswa	[%i6+%o5]0x89,%l7	! %l7 = ffffffff8f289034
!	Mem[00000000300c1410] = 00000000, %l2 = 0000000000000089
	lduba	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l6 = ffffffffffffd442
	ldsba	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 000000ff, %l1 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001410] = 00ff0000, %l1 = 00000000000000ff
	ldsha	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = ffff2a98, %f24 = ff1f429a
	lda	[%i4+%o4]0x80,%f24	! %f24 = ffff2a98
!	Mem[00000000300c1408] = ff000000, %l1 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = da6dd7ff, %l3 = 0000000000000010
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 000000000000da6d
!	Mem[0000000030081408] = 8900a19c, %f17 = 000000ff
	lda	[%i2+%o4]0x81,%f17	! %f17 = 8900a19c
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = ffff58bc, %l2 = 0000000000000000
	ldstub	[%o2+0x001],%l2		! %l2 = 000000ff000000ff

p0_label_126:
!	Mem[0000000010101408] = 982affff, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000982affff
!	%f4  = ff000000, Mem[0000000030181408] = 00003978
	sta	%f4 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000
!	Mem[00000000201c0000] = ff310847, %l4 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%f30 = 33b3288f 3787a7ff, Mem[0000000030101408] = 16afb434 109da19c
	stda	%f30,[%i4+%o4]0x89	! Mem[0000000030101408] = 33b3288f 3787a7ff
!	Mem[00000000100c1434] = 3787a7ff, %l3 = 000000000000da6d, %asi = 80
	swapa	[%i3+0x034]%asi,%l3	! %l3 = 000000003787a7ff
!	%f23 = ffffffff, Mem[0000000010141408] = ff00ff84
	sta	%f23,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffff
!	Mem[0000000010141410] = ffff00ff, %l0 = 0000000000003490
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101410] = 00ffffff33d76dda, %l5 = 0000000000000010, %l7 = ffffffff8f289034
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = 00ffffff33d76dda
!	Mem[0000000030141410] = 0084136a, %l4 = 00000000000000ff
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffa78737, %l0 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l0	! %l0 = ffffffffffffffff

p0_label_127:
!	Mem[0000000010181408] = 89ffff00, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = ffffffff89ffff00
!	Mem[00000000300c1410] = ffffbbeb00000000, %f6  = cd4cca3d fd949977
	ldda	[%i3+%o5]0x89,%f6 	! %f6  = ffffbbeb 00000000
!	Mem[0000000030101408] = ffa78737, %l6 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l6	! %l6 = 00000000ffa78737
!	Mem[0000000010141410] = ff00ffff, %l2 = 00000000000000ff
	ldsba	[%i5+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181418] = ffb86b5eda6dd733, %l3 = 000000003787a7ff
	ldx	[%i6+0x018],%l3		! %l3 = ffb86b5eda6dd733
!	Mem[0000000030081400] = 00000000, %l1 = 00000000982affff
	ldsha	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = ffb86b5e, %l3 = ffb86b5eda6dd733
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101408] = 00000000ffffffff, %l5 = 0000000000000010
	ldxa	[%i4+0x008]%asi,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010141410] = ff00ffff6a13ff34, %f28 = ff000000 109da19c
	ldd	[%i5+%o5],%f28		! %f28 = ff00ffff 6a13ff34
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffa78737, Mem[0000000010141410] = ff00ffff, %asi = 80
	stha	%l6,[%i5+0x010]%asi	! Mem[0000000010141410] = 8737ffff

p0_label_128:
!	%f4  = ff000000, Mem[0000000010101410] = ffffff00
	sta	%f4 ,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000000
!	%l6 = ffa78737, %l7 = 33d76dda, Mem[0000000030001408] = da6dd7ff da6dd733
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = ffa78737 33d76dda
!	%f0  = 16afb44d fd0a3435 0000ff00 ff000000
!	%f4  = ff000000 16afb44d ffffbbeb 00000000
!	%f8  = d7000000 ffd76dda 982a3c92 4e6eb823
!	%f12 = 00000000 ff000000 9a421fd5 64e76351
	stda	%f0,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	Mem[00000000100c142e] = 000000ff, %l0 = ffffffffffffffff
	ldstub	[%i3+0x02e],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030081408] = 8900a19c, %l3 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 00000089000000ff
!	Mem[0000000010181410] = 10000000, %l3 = 0000000000000089
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 0000000010000000
!	Mem[00000000100c1404] = ffffffff, %l0 = 0000000000000000
	swap	[%i3+0x004],%l0		! %l0 = 00000000ffffffff
!	Mem[0000000010181408] = 89ffff00, %l3 = 0000000010000000
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 00000089000000ff
!	%f26 = 8479708c, Mem[0000000010001408] = ff000000
	sta	%f26,[%i0+%o4]0x88	! Mem[0000000010001408] = 8479708c
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l2 = ffffffffffffffff
	ldsb	[%i4+%o4],%l2		! %l2 = 0000000000000000

p0_label_129:
!	Mem[0000000010181418] = ffb86b5e, %l2 = 0000000000000000
	ldswa	[%i6+0x018]%asi,%l2	! %l2 = ffffffffffb86b5e
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010001430] = 000000ff, %l4 = ffffffff89ffff00
	lduh	[%i0+0x032],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030141400] = 102123e900000000, %f6  = ffffbbeb 00000000
	ldda	[%i5+%g0]0x81,%f6 	! %f6  = 102123e9 00000000
!	Mem[0000000010041418] = 162bf0f2, %l6 = 00000000ffa78737
	ldsw	[%i1+0x018],%l6		! %l6 = 00000000162bf0f2
!	Mem[0000000010181410] = 89000000, %f15 = 64e76351
	lda	[%i6+%o5]0x80,%f15	! %f15 = 89000000
!	Mem[0000000010001400] = fd0a3435, %l2 = ffffffffffb86b5e
	lduha	[%i0+%g0]0x88,%l2	! %l2 = 0000000000003435
!	Mem[00000000100c1408] = 000000b8, %f11 = 4e6eb823
	lda	[%i3+%o4]0x88,%f11	! %f11 = 000000b8
!	Mem[00000000100c1438] = 037a4374, %l7 = 00ffffff33d76dda
	lduwa	[%i3+0x038]%asi,%l7	! %l7 = 00000000037a4374
!	Mem[00000000201c0000] = ff310847, %l6 = 00000000162bf0f2
	ldsba	[%o0+0x001]%asi,%l6	! %l6 = 0000000000000031
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 00ff00ff, %l2 = 0000000000003435
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 000000ff000000ff

p0_label_130:
!	Mem[0000000010081400] = ffff000000000034, %l0 = 00000000ffffffff, %l0 = 00000000ffffffff
	casxa	[%i2]0x80,%l0,%l0	! %l0 = ffff000000000034
!	Mem[0000000010041410] = 0000ffff, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 000000000000ffff
!	%f30 = 33b3288f 3787a7ff, %l2 = 00000000000000ff
!	Mem[0000000010141428] = ef45dc58ffffffff
	add	%i5,0x028,%g1
	stda	%f30,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010141428] = ffa787378f28b333
!	%l0 = ffff000000000034, Mem[0000000010041410] = 000000004377c221
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = ffff000000000034
!	Mem[00000000201c0000] = ff310847, %l1 = 000000000000ffff
	ldstub	[%o0+%g0],%l1		! %l1 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[0000000010001400] = 35340afd
	stha	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 00ff0afd
!	Mem[0000000010041408] = ffffffff, %l0 = ffff000000000034
	swapa	[%i1+%o4]0x80,%l0	! %l0 = 00000000ffffffff
!	Mem[00000000218001c0] = d442a805, %l0 = 00000000ffffffff
	ldstub	[%o3+0x1c0],%l0		! %l0 = 000000d4000000ff
!	%l7 = 00000000037a4374, Mem[0000000010001410] = 4db4af16
	stwa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 037a4374
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 8479000000000089, %l1 = 00000000000000ff
	ldxa	[%i6+%o5]0x88,%l1	! %l1 = 8479000000000089

p0_label_131:
!	Mem[0000000010041410] = 340000000000ffff, %l6 = 0000000000000031
	ldxa	[%i1+%o5]0x88,%l6	! %l6 = 340000000000ffff
!	Mem[0000000030001410] = c239781500ff0000, %l5 = 00000000ffffffff
	ldxa	[%i0+%o5]0x89,%l5	! %l5 = c239781500ff0000
!	Mem[00000000201c0000] = ff310847, %l7 = 00000000037a4374
	ldsba	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081410] = 000000ff, %l5 = c239781500ff0000
	lduba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1404] = 00000000, %l4 = 00000000000000ff
	ldub	[%i3+0x007],%l4		! %l4 = 0000000000000000
!	Mem[000000001004141c] = 3dbc8fde, %l5 = 0000000000000000
	lduba	[%i1+0x01e]%asi,%l5	! %l5 = 000000000000008f
!	Mem[00000000300c1400] = 0000000033d76dda, %l0 = 00000000000000d4
	ldxa	[%i3+%g0]0x81,%l0	! %l0 = 0000000033d76dda
!	Mem[0000000010081410] = ffd76dda, %l3 = 0000000000000089
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = ffffffffffffffda
!	Mem[0000000010001418] = 00000000, %l1 = 8479000000000089
	ldub	[%i0+0x01a],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030181400] = 34000000
	stha	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 34000000

p0_label_132:
!	%l4 = 0000000000000000, Mem[0000000010001400] = fd0aff00
	stwa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%l2 = 00000000000000ff, Mem[0000000010181408] = 00ffffff
	stha	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 00ff00ff
!	Mem[0000000010101408] = 00000000, %l3 = ffffffffffffffda
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l7 = ffffffffffffffff, Mem[00000000100c1400] = ffffffff
	stba	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffff
!	%f20 = ff000000 ffffffff, %l2 = 00000000000000ff
!	Mem[0000000030101400] = 000000ff23b86e4e
	stda	%f20,[%i4+%l2]ASI_PST16_SL ! Mem[0000000030101400] = ffffffff000000ff
!	Mem[0000000010141410] = ffff3787, %l1 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 00000087000000ff
!	%l1 = 0000000000000087, Mem[0000000010041410] = ffff0000
	stwa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000087
!	%l4 = 00000000, %l5 = 0000008f, Mem[0000000010141410] = ff37ffff 6a13ff34
	std	%l4,[%i5+%o5]		! Mem[0000000010141410] = 00000000 0000008f
!	Mem[0000000030181408] = 000000ff, %l6 = 340000000000ffff
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = b8000000 ffffffff, %l4 = 00000000, %l5 = 0000008f
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 00000000ffffffff 00000000b8000000

p0_label_133:
!	Mem[00000000100c1400] = ffffffff 00000000, %l0 = 33d76dda, %l1 = 00000087
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 00000000ffffffff 0000000000000000
!	Mem[0000000030041400] = 16afb44d, %l0 = 00000000ffffffff
	ldswa	[%i1+%g0]0x81,%l0	! %l0 = 0000000016afb44d
!	Mem[0000000010081400] = 0000ffff, %l6 = 00000000000000ff
	lduha	[%i2+%g0]0x88,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010101438] = ffffff84, %l5 = 00000000b8000000
	lduh	[%i4+0x03a],%l5		! %l5 = 000000000000ff84
!	Mem[00000000300c1400] = 00000000, %l3 = 0000000000000000
	ldswa	[%i3+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = ffff00ff00000000, %l7 = ffffffffffffffff
	ldxa	[%i3+%o5]0x88,%l7	! %l7 = ffff00ff00000000
!	Mem[0000000030101408] = ffa78737 8f28b333, %l6 = 0000ffff, %l7 = 00000000
	ldda	[%i4+%o4]0x81,%l6	! %l6 = 00000000ffa78737 000000008f28b333
!	Mem[00000000300c1400] = 00000000, %l7 = 000000008f28b333
	lduha	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l1 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 3490288f, %l5 = 000000000000ff84
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 000000003490288f

p0_label_134:
!	Mem[0000000010041438] = 00000000, %l6 = 00000000ffa78737
	swap	[%i1+0x038],%l6		! %l6 = 0000000000000000
!	%l2 = 00000000000000ff, Mem[0000000010181400] = ffffffff
	stha	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00ffffff
!	%l5 = 000000003490288f, Mem[00000000201c0000] = ff310847, %asi = 80
	stba	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 8f310847
!	%l6 = 0000000000000000, Mem[0000000010081408] = 9ca19dff
	stba	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 9ca19d00
!	%f15 = 89000000, Mem[0000000030101400] = ffffffff
	sta	%f15,[%i4+%g0]0x89	! Mem[0000000030101400] = 89000000
!	%f16 = 00000000 8900a19c 00000089 ffffffff
!	%f20 = ff000000 ffffffff ffff2a98 ffffffff
!	%f24 = ffff2a98 00ffffff 8479708c 3c55e764
!	%f28 = ff00ffff 6a13ff34 33b3288f 3787a7ff
	stda	%f16,[%i4]ASI_COMMIT_P	! Block Store to 0000000010101400
!	%f8  = d7000000 ffd76dda, Mem[0000000010141408] = ffffffff e4ede0b7
	stda	%f8 ,[%i5+%o4]0x88	! Mem[0000000010141408] = d7000000 ffd76dda
!	%f8  = d7000000, Mem[0000000010041410] = 00000087
	sta	%f8 ,[%i1+0x010]%asi	! Mem[0000000010041410] = d7000000
!	%l2 = 00000000000000ff, Mem[0000000030081400] = 00000000
	stba	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000000000, imm = fffffffffffffe4e, %l5 = 000000003490288f
	sub	%l6,-0x1b2,%l5		! %l5 = 00000000000001b2

p0_label_135:
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 0000000016afb44d
	setx	0xa523544808f0c980,%g7,%l0 ! %l0 = a523544808f0c980
!	%l1 = 0000000000000000
	setx	0xc10b6757f2724b6d,%g7,%l1 ! %l1 = c10b6757f2724b6d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a523544808f0c980
	setx	0x87ec807798ec638d,%g7,%l0 ! %l0 = 87ec807798ec638d
!	%l1 = c10b6757f2724b6d
	setx	0xc8b970c7af771bdd,%g7,%l1 ! %l1 = c8b970c7af771bdd
!	Mem[0000000030101410] = ff000000, %l2 = 00000000000000ff
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141400] = 00000033ffffffff, %f4  = ff000000 16afb44d
	ldda	[%i5+%g0]0x80,%f4 	! %f4  = 00000033 ffffffff
!	Mem[0000000010001434] = 00000000, %l7 = 0000000000000000
	ldsh	[%i0+0x036],%l7		! %l7 = 0000000000000000
!	Mem[0000000030141400] = e9232110, %l6 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l6	! %l6 = 0000000000002110
!	Mem[0000000030181408] = ffff0000, %l1 = c8b970c7af771bdd
	ldsba	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 00000033, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000033
!	Mem[0000000030101400] = 89000000, %l6 = 0000000000002110
	ldswa	[%i4+%g0]0x89,%l6	! %l6 = ffffffff89000000
!	Mem[0000000010141408] = da6dd7ff, %l6 = ffffffff89000000
	lduha	[%i5+%o4]0x80,%l6	! %l6 = 000000000000da6d
!	Starting 10 instruction Store Burst
!	Mem[0000000010001430] = 000000ff00000000, %l3 = 0000000000000000, %l5 = 00000000000001b2
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = 000000ff00000000

p0_label_136:
!	%l2 = ffffffffffffffff, Mem[00000000100c1400] = ffffffff
	stwa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff
!	%l0 = 87ec807798ec638d, Mem[000000001000143c] = d51f429a, %asi = 80
	stwa	%l0,[%i0+0x03c]%asi	! Mem[000000001000143c] = 98ec638d
!	%l7 = 0000000000000033, Mem[0000000030181410] = 0000ff84ffffff98
	stxa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000033
!	%f6  = 102123e9 00000000, %l6 = 000000000000da6d
!	Mem[0000000010081438] = ff17fbab1fb3483b
	add	%i2,0x038,%g1
	stda	%f6,[%g1+%l6]ASI_PST8_P ! Mem[0000000010081438] = ff2123ab00004800
!	Mem[0000000030141400] = e9232110, %l7 = 0000000000000033
	ldstuba	[%i5+%g0]0x89,%l7	! %l7 = 00000010000000ff
!	%l5 = 000000ff00000000, Mem[0000000010141410] = 00000000
	stha	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%f6  = 102123e9, %f13 = ff000000, %f3  = ff000000
	fadds	%f6 ,%f13,%f3 		! %f3  = ff000000
!	Mem[000000001018142f] = b214d06a, %l7 = 0000000000000010
	ldstub	[%i6+0x02f],%l7		! %l7 = 0000006a000000ff
!	%l6 = 000000000000da6d, Mem[0000000030081400] = 000000ff
	stba	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000006d
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 9a421fffffff0000, %l5 = 000000ff00000000
	ldxa	[%i6+%o4]0x89,%l5	! %l5 = 9a421fffffff0000

p0_label_137:
!	Mem[00000000100c142c] = 0000ffff, %l4 = 00000000ffffffff
	lduwa	[%i3+0x02c]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010041400] = ffb86b5e, %l5 = 9a421fffffff0000
	lduh	[%i1+%g0],%l5		! %l5 = 000000000000ffb8
!	Mem[0000000010141410] = 00000000, %l5 = 000000000000ffb8
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[000000001014140c] = 000000d7, %l6 = 000000000000da6d
	ldub	[%i5+0x00e],%l6		! %l6 = 0000000000000000
!	Mem[0000000020800000] = 00ff261d, %l4 = 000000000000ffff
	ldsha	[%o1+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000021800080] = ffff2e44, %l4 = 00000000000000ff
	ldsh	[%o3+0x080],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010041408] = 00000034, %l3 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000034
!	Mem[0000000030001408] = ffa78737, %f25 = 00ffffff
	lda	[%i0+%o4]0x89,%f25	! %f25 = ffa78737
!	Mem[0000000030101410] = ff000000, %l5 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff

p0_label_138:
!	%l2 = ffffffffffffffff, Mem[0000000030181400] = 34000000
	stba	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 340000ff
!	%l3 = 0000000000000034, Mem[0000000010041400] = ffb86b5e
	stha	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 00346b5e
!	%l1 = 0000000000000000, Mem[0000000030081408] = 9ca100ff
	stha	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 9ca10000
!	%f8  = d7000000, Mem[0000000010141400] = 00000033
	sta	%f8 ,[%i5+%g0]0x80	! Mem[0000000010141400] = d7000000
!	Mem[00000000100c1408] = 000000b8, %l2 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 000000b8000000ff
!	%l4 = ffffffffffffffff, Mem[0000000030041400] = 4db4af16
	stwa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff
!	%l4 = ffffffffffffffff, Mem[0000000010181436] = ffffffff, %asi = 80
	stba	%l4,[%i6+0x036]%asi	! Mem[0000000010181434] = ffffffff
!	Mem[0000000010181400] = 00ffffff, %l5 = ffffffffffffffff
	swap	[%i6+%g0],%l5		! %l5 = 0000000000ffffff
!	%l2 = 00000000000000b8, Mem[0000000030101410] = ff000000
	stha	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 00b80000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff000000, %l3 = 0000000000000034
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 000000000000ff00

p0_label_139:
!	Mem[0000000030001410] = c2397815 00ff0000, %l2 = 000000b8, %l3 = 0000ff00
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 0000000000ff0000 00000000c2397815
!	Mem[0000000010141408] = da6dd7ff 000000d7, %l4 = ffffffff, %l5 = 00ffffff
	ldda	[%i5+0x008]%asi,%l4	! %l4 = 00000000da6dd7ff 00000000000000d7
!	Mem[0000000010181408] = ff00ff0000000028, %l7 = 000000000000006a
	ldxa	[%i6+%o4]0x80,%l7	! %l7 = ff00ff0000000028
!	Mem[0000000010001408] = 8c707984 00ff0000, %l2 = 00ff0000, %l3 = c2397815
	ldd	[%i0+%o4],%l2		! %l2 = 000000008c707984 0000000000ff0000
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 00000000ff000000, %l7 = ff00ff0000000028
	ldxa	[%i3+%o4]0x89,%l7	! %l7 = 00000000ff000000
!	Mem[00000000300c1410] = 00000000ebbbffff, %l4 = 00000000da6dd7ff
	ldxa	[%i3+%o5]0x81,%l4	! %l4 = 00000000ebbbffff
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010101410] = ff000000, %l4 = 00000000ebbbffff
	lduha	[%i4+0x012]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = ffa78737, %l1 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l1	! %l1 = ffffffffffffffa7
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 0000ff00, %l2 = 000000008c707984
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 00000000000000ff

p0_label_140:
!	%f28 = ff00ffff 6a13ff34, Mem[0000000030001400] = 00000000 da6dd733
	stda	%f28,[%i0+%g0]0x89	! Mem[0000000030001400] = ff00ffff 6a13ff34
!	Mem[0000000030141410] = ff84136a, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000ff84136a
!	%f24 = ffff2a98, Mem[0000000010081408] = 9ca19d00
	sta	%f24,[%i2+%o4]0x88	! Mem[0000000010081408] = ffff2a98
!	Mem[0000000010101408] = 89000000, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l0 = 87ec807798ec638d, Mem[0000000010001410] = 037a4374
	stba	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 8d7a4374
!	%l1 = ffffffffffffffa7, Mem[00000000100c1408] = 000000ff
	stwa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffa7
!	%l0 = 87ec807798ec638d, Mem[0000000030041410] = ffffffff16afb44d
	stxa	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 87ec807798ec638d
!	%l5 = 00000000000000d7, Mem[00000000100c1408] = ffffffa7
	stwa	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000d7
!	%f27 = 3c55e764, Mem[0000000010101408] = ff000089
	sta	%f27,[%i4+%o4]0x80	! Mem[0000000010101408] = 3c55e764
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 6d000000, %l6 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l6	! %l6 = 000000006d000000

p0_label_141:
!	Mem[0000000010141400] = d7000000, %f19 = ffffffff
	lda	[%i5+%g0]0x80,%f19	! %f19 = d7000000
!	Mem[0000000010081400] = 0000ffff, %f31 = 3787a7ff
	lda	[%i2+%g0]0x88,%f31	! %f31 = 0000ffff
!	Mem[00000000100c1418] = ff00008951f2aaac, %l5 = 00000000000000d7
	ldx	[%i3+0x018],%l5		! %l5 = ff00008951f2aaac
!	Mem[00000000300c1408] = 000000ff, %l7 = 00000000ff000000
	lduha	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = ff000000 4db4af16, %l2 = ff84136a, %l3 = 00ff0000
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ff000000 000000004db4af16
!	Mem[0000000010141400] = d7000000, %l3 = 000000004db4af16
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 00000000000000d7
!	Mem[0000000030001408] = 33d76ddaffa78737, %l4 = 0000000000000000
	ldxa	[%i0+%o4]0x89,%l4	! %l4 = 33d76ddaffa78737
!	Mem[0000000010081400] = 0000ffff, %f31 = 0000ffff
	lda	[%i2+%g0]0x88,%f31	! %f31 = 0000ffff
!	Mem[0000000010081410] = da6dd7ff, %l7 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l7	! %l7 = 00000000da6dd7ff
!	Starting 10 instruction Store Burst
!	%l4 = ffa78737, %l5 = 51f2aaac, Mem[0000000030081400] = 0000006d cf8753f5
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = ffa78737 51f2aaac

p0_label_142:
!	%l7 = 00000000da6dd7ff, Mem[0000000030181410] = 00000000
	stha	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = d7ff0000
!	Mem[0000000021800180] = ff31809b, %l5 = ff00008951f2aaac
	ldstuba	[%o3+0x180]%asi,%l5	! %l5 = 000000ff000000ff
!	%l4 = 33d76ddaffa78737, Mem[0000000010141410] = 00000000
	stha	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 87370000
!	Mem[0000000010181420] = 00000000, %l7 = 00000000da6dd7ff, %asi = 80
	swapa	[%i6+0x020]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = ffa78737, %l0 = 87ec807798ec638d
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 00000000ffa78737
!	%l6 = 000000006d000000, Mem[00000000100c1410] = 00000000ff00ffff
	stxa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000006d000000
!	Mem[0000000010041400] = 00346b5e, %l5 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l4 = ffa78737, %l5 = 00000000, Mem[0000000010081400] = 0000ffff 34000000
	stda	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = ffa78737 00000000
!	Mem[0000000010141400] = 000000d7, %l2 = 00000000ff000000
	ldstuba	[%i5+%g0]0x88,%l2	! %l2 = 000000d7000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 33b3288f3787a7ff, %f28 = ff00ffff 6a13ff34
	ldda	[%i4+%o4]0x89,%f28	! %f28 = 33b3288f 3787a7ff

p0_label_143:
!	Mem[0000000010141410] = 00003787, %l6 = 000000006d000000
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 0000000000003787
!	Mem[0000000030081408] = 0000a19c, %l6 = 0000000000003787
	lduba	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = da6dd7ff 000000d7, %l0 = ffa78737, %l1 = ffffffa7
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000da6dd7ff 00000000000000d7
!	Mem[000000001018142c] = b214d0ff, %l3 = 00000000000000d7
	lduha	[%i6+0x02e]%asi,%l3	! %l3 = 000000000000d0ff
!	Mem[0000000010001414] = 000000ff, %f24 = ffff2a98
	lda	[%i0+0x014]%asi,%f24	! %f24 = 000000ff
!	Mem[00000000211c0000] = ffff58bc, %l2 = 00000000000000d7
	lduh	[%o2+%g0],%l2		! %l2 = 000000000000ffff
!	Mem[0000000030081408] = 0000a19c, %f29 = 3787a7ff
	lda	[%i2+%o4]0x81,%f29	! %f29 = 0000a19c
!	Mem[0000000010001400] = ff000000, %l5 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010181408] = 00ff00ff, %l0 = 00000000da6dd7ff
	lduba	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f24 = 000000ff ffa78737, Mem[0000000010141400] = ff000000 ffffffff
	stda	%f24,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff ffa78737

p0_label_144:
!	%l4 = 33d76ddaffa78737, Mem[000000001000142c] = 923c2a98, %asi = 80
	stba	%l4,[%i0+0x02c]%asi	! Mem[000000001000142c] = 373c2a98
!	%f19 = d7000000, Mem[0000000010041404] = 00000034
	sta	%f19,[%i1+0x004]%asi	! Mem[0000000010041404] = d7000000
!	%f22 = ffff2a98 ffffffff, Mem[0000000010141400] = ff000000 3787a7ff
	stda	%f22,[%i5+%g0]0x88	! Mem[0000000010141400] = ffff2a98 ffffffff
!	%f20 = ff000000, Mem[00000000100c1430] = 33b3288f
	st	%f20,[%i3+0x030]	! Mem[00000000100c1430] = ff000000
!	%f10 = 982a3c92, Mem[0000000030181400] = ff000034
	sta	%f10,[%i6+%g0]0x81	! Mem[0000000030181400] = 982a3c92
!	Mem[0000000010181400] = ffffffff, %l5 = ffffffffffffff00
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 00000000ffffffff
!	%f22 = ffff2a98 ffffffff, Mem[00000000100c1400] = ffffffff 00000000
	stda	%f22,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffff2a98 ffffffff
!	%l5 = 00000000ffffffff, Mem[0000000030141400] = ff2123e9
	stwa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffff
!	%l5 = 00000000ffffffff, Mem[0000000010101400] = 000000008900a19c
	stxa	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 000000ff, %l3 = 000000000000d0ff
	lduha	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_145:
!	Mem[0000000030001400] = 34ff136a, %l2 = 000000000000ffff
	lduwa	[%i0+%g0]0x81,%l2	! %l2 = 0000000034ff136a
!	Mem[00000000100c1408] = d7000000, %l1 = 00000000000000d7
	ldswa	[%i3+0x008]%asi,%l1	! %l1 = ffffffffd7000000
!	Mem[0000000010001410] = 74437a8d, %l3 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l3	! %l3 = 000000000000008d
!	Mem[0000000010181400] = ffffff00, %l3 = 000000000000008d
	ldsba	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1408] = d7000000, %l3 = ffffffffffffffff
	ldswa	[%i3+%o4]0x80,%l3	! %l3 = ffffffffd7000000
!	Mem[00000000100c1410] = 00000000, %l3 = ffffffffd7000000
	lduwa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l5 = 00000000ffffffff
	ldsba	[%i3+0x011]%asi,%l5	! %l5 = 0000000000000000
!	Mem[000000001000142c] = 373c2a98, %l5 = 0000000000000000
	ldub	[%i0+0x02d],%l5		! %l5 = 000000000000003c
!	Mem[000000001004142c] = 1a7d7397, %l2 = 0000000034ff136a
	ldsba	[%i1+0x02e]%asi,%l2	! %l2 = 0000000000000073
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000000, %l5 = 000000000000003c
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_146:
!	Mem[0000000010141400] = ffffffff, %l2 = 0000000000000073
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 00000000ffffffff
!	%l1 = ffffffffd7000000, Mem[0000000030081400] = 51f2aaacffa78737
	stxa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffffd7000000
!	%l7 = 0000000000000000, Mem[0000000010041400] = ff346b5e
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00346b5e
!	Mem[00000000300c1410] = 00000000, %l7 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000021800000] = 94ad951b
	stb	%l5,[%o3+%g0]		! Mem[0000000021800000] = 00ad951b
!	Mem[00000000100c1400] = ffffffff, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 00000000ffffffff
!	%l3 = 00000000ffffffff, Mem[0000000010181400] = 00ffffff
	stha	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 00ffffff
!	%f9  = ffd76dda, Mem[0000000030041408] = ff00ff00
	sta	%f9 ,[%i1+%o4]0x81	! Mem[0000000030041408] = ffd76dda
!	%l3 = 00000000ffffffff, Mem[0000000030041400] = ffffffff
	stba	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 87ec8077, %l4 = 33d76ddaffa78737
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = ffffffffffff87ec

p0_label_147:
!	Mem[0000000010181410] = 89000000, %l2 = 00000000ffffffff
	lduwa	[%i6+%o5]0x80,%l2	! %l2 = 0000000089000000
!	Mem[0000000010141414] = 0000008f, %f13 = ff000000
	lda	[%i5+0x014]%asi,%f13	! %f13 = 0000008f
!	Mem[0000000010081410] = ffd76dda, %f3  = ff000000
	lda	[%i2+%o5]0x88,%f3 	! %f3 = ffd76dda
!	Mem[0000000010101410] = ffffffff000000ff, %f16 = 00000000 8900a19c
	ldda	[%i4+%o5]0x88,%f16	! %f16 = ffffffff 000000ff
!	Mem[0000000010141408] = da6dd7ff, %l2 = 0000000089000000
	ldsha	[%i5+0x00a]%asi,%l2	! %l2 = ffffffffffffd7ff
!	Mem[0000000010041410] = d7000000, %l7 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l7	! %l7 = 000000000000d700
!	Mem[0000000021800140] = 3c3bf4c2, %l4 = ffffffffffff87ec
	ldsb	[%o3+0x141],%l4		! %l4 = 000000000000003b
!	Mem[0000000010141400] = ffff2a9873000000, %l5 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l5	! %l5 = ffff2a9873000000
!	Mem[0000000010001410] = 74437a8d, %l7 = 000000000000d700
	lduha	[%i0+%o5]0x88,%l7	! %l7 = 0000000000007a8d
!	Starting 10 instruction Store Burst
!	%l5 = ffff2a9873000000, Mem[000000001000143c] = 98ec638d, %asi = 80
	stwa	%l5,[%i0+0x03c]%asi	! Mem[000000001000143c] = 73000000

p0_label_148:
!	%l2 = ffffd7ff, %l3 = ffffffff, Mem[0000000030181400] = 982a3c92 9ca19d10
	stda	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffd7ff ffffffff
!	Mem[0000000030041410] = 7780ec87, %l1 = ffffffffd7000000
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 000000007780ec87
!	%l0 = 00000000000000ff, Mem[0000000010041410] = 000000d7
	stwa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	%l3 = 00000000ffffffff, Mem[0000000010101400] = 00000000
	stba	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000
!	Mem[0000000010101428] = 8479708c3c55e764, %l4 = 000000000000003b, %l0 = 00000000000000ff
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = 8479708c3c55e764
!	%l7 = 0000000000007a8d, Mem[0000000010101438] = 33b3288f3787a7ff
	stx	%l7,[%i4+0x038]		! Mem[0000000010101438] = 0000000000007a8d
!	%l7 = 0000000000007a8d, Mem[0000000010101408] = 3c55e764
	stwa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00007a8d
!	%l4 = 000000000000003b, Mem[0000000010141400] = 00000073
	stha	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 003b0073
!	%l0 = 8479708c3c55e764, Mem[0000000030141410] = 00000000eb838479
	stxa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 8479708c3c55e764
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00b80000 000000ff, %l4 = 0000003b, %l5 = 73000000
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 0000000000b80000 00000000000000ff

p0_label_149:
!	Mem[0000000010001418] = 00000000, %l2 = ffffffffffffd7ff
	ldsw	[%i0+0x018],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081410] = da6dd7ff 000000d7, %l0 = 3c55e764, %l1 = 7780ec87
	ldda	[%i2+0x010]%asi,%l0	! %l0 = 00000000da6dd7ff 00000000000000d7
!	Mem[0000000010041410] = ff00000000000034, %l1 = 00000000000000d7
	ldxa	[%i1+%o5]0x80,%l1	! %l1 = ff00000000000034
!	Mem[0000000010141420] = cbe0ffb2, %l5 = 00000000000000ff
	lduh	[%i5+0x022],%l5		! %l5 = 000000000000ffb2
!	Mem[0000000020800040] = e7644bbb, %l5 = 000000000000ffb2
	ldsb	[%o1+0x040],%l5		! %l5 = ffffffffffffffe7
!	Mem[0000000030101408] = ffa78737, %l2 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l2	! %l2 = 000000000000ffa7
!	Mem[0000000010101400] = ff000000, %l5 = ffffffffffffffe7
	ldswa	[%i4+%g0]0x80,%l5	! %l5 = ffffffffff000000
!	Mem[0000000030181410] = 330000000000ffd7, %f16 = ffffffff 000000ff
	ldda	[%i6+%o5]0x89,%f16	! %f16 = 33000000 0000ffd7
!	Mem[0000000010141408] = d7000000ffd76dda, %f16 = 33000000 0000ffd7
	ldda	[%i5+%o4]0x88,%f16	! %f16 = d7000000 ffd76dda
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000021800140] = 3c3bf4c2, %asi = 80
	stha	%l6,[%o3+0x140]%asi	! Mem[0000000021800140] = 0000f4c2

p0_label_150:
!	Mem[0000000030181410] = 0000ffd7, %l1 = ff00000000000034
	ldsha	[%i6+%o5]0x89,%l1	! %l1 = ffffffffffffffd7
!	%f24 = 000000ff, Mem[00000000300c1400] = 00000000
	sta	%f24,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	%l6 = 0000000000000000, Mem[0000000010041400] = 5e6b3400
	stba	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 5e6b3400
!	%f0  = 16afb44d fd0a3435, %l6 = 0000000000000000
!	Mem[0000000010081408] = 982affff34000000
	add	%i2,0x008,%g1
	stda	%f0,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010081408] = 982affff34000000
!	Mem[0000000030001410] = 00ff00ff, %l0 = 00000000da6dd7ff
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	%l4 = 0000000000b80000, Mem[0000000010141408] = da6dd7ff
	stwa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00b80000
!	Mem[0000000010041408] = 00000034, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l1 = ffffffffffffffd7, Mem[0000000020800000] = 00ff261d, %asi = 80
	stba	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = d7ff261d
!	Mem[00000000300c1408] = 000000ff, %l0 = 00000000000000ff
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff00000033d76dda, %l3 = 00000000ffffffff
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = ff00000033d76dda

p0_label_151:
!	Mem[0000000030141410] = 8c707984, %l3 = ff00000033d76dda
	ldsba	[%i5+%o5]0x89,%l3	! %l3 = ffffffffffffff84
!	Mem[00000000201c0000] = 8f310847, %l6 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffff8f
!	Mem[0000000030141410] = 8c707984, %l1 = ffffffffffffffd7
	lduwa	[%i5+%o5]0x89,%l1	! %l1 = 000000008c707984
!	Mem[0000000030181410] = d7ff000000000033, %f26 = 8479708c 3c55e764
	ldda	[%i6+%o5]0x81,%f26	! %f26 = d7ff0000 00000033
!	Mem[0000000010181410] = 8900000000007984, %f16 = d7000000 ffd76dda
	ldda	[%i6+0x010]%asi,%f16	! %f16 = 89000000 00007984
!	Mem[0000000030181400] = ffd7ffff, %f9  = ffd76dda
	lda	[%i6+%g0]0x89,%f9 	! %f9 = ffd7ffff
!	Mem[000000001004143c] = 00003978, %l5 = ffffffffff000000
	lduba	[%i1+0x03e]%asi,%l5	! %l5 = 0000000000000039
!	Mem[0000000030081410] = 000000ff, %l4 = 0000000000b80000
	lduha	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181414] = 00007984, %l0 = 0000000000000000
	ldub	[%i6+0x014],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f13 = 0000008f, Mem[0000000030141410] = 8c707984
	sta	%f13,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000008f

p0_label_152:
!	%f0  = 16afb44d fd0a3435 0000ff00 ffd76dda
!	%f4  = 00000033 ffffffff 102123e9 00000000
!	%f8  = d7000000 ffd7ffff 982a3c92 000000b8
!	%f12 = 00000000 0000008f 9a421fd5 89000000
	stda	%f0,[%i6]ASI_BLK_SL	! Block Store to 0000000030181400
!	%l3 = ffffffffffffff84, Mem[0000000030101400] = ff00000089000000
	stxa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffffffffff84
!	Mem[0000000010141408] = 0000b800, %l7 = 0000000000007a8d
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 000000000000b800
!	%l4 = 0000000000000000, immd = fffffffffffffce9, %l2  = 000000000000ffa7
	mulx	%l4,-0x317,%l2		! %l2 = 0000000000000000
!	%l1 = 000000008c707984, Mem[0000000010041410] = ff00000000000034
	stxa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000008c707984
!	Mem[0000000030001408] = 98ec638d, %l3 = ffffffffffffff84
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 0000000098ec638d
	membar	#Sync			! Added by membar checker (24)
!	Mem[000000001018140c] = 00000028, %l6 = ffffffffffffff8f, %asi = 80
	swapa	[%i6+0x00c]%asi,%l6	! %l6 = 0000000000000028
!	%l5 = 0000000000000039, Mem[0000000030041410] = d7000000
	stha	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = d7000039
!	%l4 = 00000000, %l5 = 00000039, Mem[0000000010081410] = ffd76dda d7000000
	stda	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 00000039
!	Starting 10 instruction Load Burst
!	%f15 = 89000000, %f28 = 33b3288f
	fsqrts	%f15,%f28		! %f28 = 7fffffff

p0_label_153:
!	Mem[0000000030001400] = 34ff136a, %l0 = 0000000000000000
	lduha	[%i0+%g0]0x81,%l0	! %l0 = 00000000000034ff
!	Mem[0000000010181400] = ffffff00, %l2 = 0000000000000000
	ldsha	[%i6+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141420] = cbe0ffb2, %l4 = 0000000000000000
	lduh	[%i5+0x022],%l4		! %l4 = 000000000000ffb2
!	Mem[0000000030181400] = fd0a3435, %l6 = 0000000000000028
	lduha	[%i6+%g0]0x89,%l6	! %l6 = 0000000000003435
!	%l5 = 0000000000000039, Mem[0000000010101408] = 8d7a0000
	stha	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 8d7a0039
!	Mem[0000000010041438] = ffa78737 00003978, %l6 = 00003435, %l7 = 0000b800
	ldd	[%i1+0x038],%l6		! %l6 = 00000000ffa78737 0000000000003978
!	Mem[0000000030041400] = ffffffff, %l7 = 0000000000003978
	ldsha	[%i1+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181408] = ff00ff00ffffff8f, %f22 = ffff2a98 ffffffff
	ldda	[%i6+%o4]0x80,%f22	! %f22 = ff00ff00 ffffff8f
!	Mem[0000000021800140] = 0000f4c2, %l1 = 000000008c707984
	ldsha	[%o3+0x140]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030101408] = ffa78737
	stwa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000

p0_label_154:
!	%l4 = 000000000000ffb2, Mem[0000000030001410] = 00ff00ff
	stha	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 00ffffb2
!	%l6 = 00000000ffa78737, Mem[000000001004141c] = 3dbc8fde
	stw	%l6,[%i1+0x01c]		! Mem[000000001004141c] = ffa78737
!	Mem[0000000010081411] = 00000000, %l0 = 00000000000034ff
	ldstub	[%i2+0x011],%l0		! %l0 = 00000000000000ff
!	%f8  = d7000000 ffd7ffff, %l5 = 0000000000000039
!	Mem[0000000030081420] = 35340afd157839c2
	add	%i2,0x020,%g1
	stda	%f8,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030081420] = ffffd7ff157839c2
!	%l6 = 00000000ffa78737, Mem[0000000030081410] = ff000000
	stha	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = ff008737
!	Mem[0000000010101410] = 000000ff, %l1 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030101400] = 84ffffff
	stha	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000ffff
!	%l2 = ffffffffffffffff, Mem[0000000010141430] = 23b86e4e, %asi = 80
	stha	%l2,[%i5+0x030]%asi	! Mem[0000000010141430] = ffff6e4e
!	Mem[0000000010141410] = 873700000000008f, %l6 = 00000000ffa78737, %l1 = 00000000000000ff
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 873700000000008f
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l2 = ffffffffffffffff
	ldsba	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000000

p0_label_155:
!	Mem[0000000020800040] = e7644bbb, %l2 = 0000000000000000
	lduh	[%o1+0x040],%l2		! %l2 = 000000000000e764
!	Mem[0000000030181400] = fd0a3435, %l3 = 0000000098ec638d
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000035
!	Mem[0000000010001410] = 74437a8d, %l3 = 0000000000000035
	lduba	[%i0+%o5]0x88,%l3	! %l3 = 000000000000008d
!	Mem[0000000030101410] = 0000b800, %l5 = 0000000000000039
	ldsba	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = 35340afd, %l2 = 000000000000e764
	ldswa	[%i6+%g0]0x81,%l2	! %l2 = 0000000035340afd
!	Mem[0000000010081410] = 00ff0000, %l3 = 000000000000008d
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = 0000000000ff0000
!	Mem[0000000030101410] = ff0000000000b800, %l6 = 00000000ffa78737
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = ff0000000000b800
!	Mem[0000000010001400] = 16afb44d 000000ff, %l0 = 00000000, %l1 = 0000008f
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff 0000000016afb44d
!	Mem[0000000030101410] = ff000000 0000b800, %l6 = 0000b800, %l7 = ffffffff
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 000000000000b800 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = 16afb44d, Mem[0000000010141428] = ffa78737 8f28b333
	std	%l0,[%i5+0x028]		! Mem[0000000010141428] = 000000ff 16afb44d

p0_label_156:
!	Mem[0000000010141410] = 87370000, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 0000000087370000
!	%f10 = 982a3c92 000000b8, %l1 = 0000000016afb44d
!	Mem[0000000010101430] = ff00ffff6a13ff34
	add	%i4,0x030,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010101430] = b80000006a13ff34
!	%l3 = 0000000000ff0000, Mem[0000000010001408] = 8479708c
	stba	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 84797000
!	%l4 = 0000ffb2, %l5 = 87370000, Mem[0000000010001408] = 00707984 00ff0000
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000ffb2 87370000
!	Mem[0000000030081410] = 378700ff, %l4 = 000000000000ffb2
	ldstuba	[%i2+%o5]0x81,%l4	! %l4 = 00000037000000ff
!	%f18 = 00000089 d7000000, Mem[0000000010041418] = 162bf0f2 ffa78737
	std	%f18,[%i1+0x018]	! Mem[0000000010041418] = 00000089 d7000000
!	%l1 = 0000000016afb44d, Mem[00000000300c1410] = 00000000
	stwa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 16afb44d
!	Mem[00000000100c1434] = 0000da6d, %l2 = 0000000035340afd
	swap	[%i3+0x034],%l2		! %l2 = 000000000000da6d
!	%l2 = 000000000000da6d, Mem[0000000010001408] = 0000ffb2
	stwa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000da6d
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff0000ff, %f19 = d7000000
	lda	[%i3+%o4]0x89,%f19	! %f19 = ff0000ff

p0_label_157:
!	Mem[0000000030081400] = 000000d7, %l1 = 0000000016afb44d
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = ff0000000000b800, %l3 = 0000000000ff0000
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = ff0000000000b800
!	Mem[0000000010101400] = ff000000, %l4 = 0000000000000037
	ldsha	[%i4+%g0]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010001410] = 74437a8d, %l7 = 00000000ff000000
	lduwa	[%i0+%o5]0x88,%l7	! %l7 = 0000000074437a8d
!	Mem[0000000030041410] = 390000d7, %f24 = 000000ff
	lda	[%i1+%o5]0x81,%f24	! %f24 = 390000d7
!	Mem[0000000010041400] = 5e6b3400, %l4 = ffffffffffffff00
	lduha	[%i1+%g0]0x88,%l4	! %l4 = 0000000000003400
!	Mem[0000000030081408] = 0000a19c34000000, %f28 = 7fffffff 0000a19c
	ldda	[%i2+%o4]0x81,%f28	! %f28 = 0000a19c 34000000
!	Mem[00000000100c1410] = 0000006d3c000000, %f0  = 16afb44d fd0a3435
	ldda	[%i3+%o5]0x88,%f0 	! %f0  = 0000006d 3c000000
!	Mem[0000000010081434] = 000000ff, %l7 = 0000000074437a8d
	ldswa	[%i2+0x034]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f0  = 0000006d 3c000000 0000ff00 ffd76dda
!	%f4  = 00000033 ffffffff 102123e9 00000000
!	%f8  = d7000000 ffd7ffff 982a3c92 000000b8
!	%f12 = 00000000 0000008f 9a421fd5 89000000
	stda	%f0,[%i2]ASI_COMMIT_P	! Block Store to 0000000010081400

p0_label_158:
!	Mem[00000000300c1410] = 4db4af16, %l2 = 000000000000da6d
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 0000004d000000ff
!	Mem[0000000010181408] = ff00ff00, %l4 = 0000000000003400
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000010041408] = ff000034
	stha	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000034
!	%f26 = d7ff0000 00000033, %l0 = 00000000000000ff
!	Mem[0000000010041428] = cf8753f51a7d7397
	add	%i1,0x028,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_P ! Mem[0000000010041428] = d7ff000000000033
!	%l5 = 0000000087370000, Mem[0000000030041400] = 35340afdffffffff
	stxa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000087370000
!	%l5 = 0000000087370000, Mem[0000000030141400] = ffffffff
	stba	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00ffffff
!	%f24 = 390000d7 ffa78737, %l2 = 000000000000004d
!	Mem[0000000010001408] = 0000da6d87370000
	add	%i0,0x008,%g1
	stda	%f24,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010001408] = 3787da6dd7000039
!	Mem[0000000030081410] = ff0087ff, %l3 = ff0000000000b800
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 00000000ff0087ff
	membar	#Sync			! Added by membar checker (25)
!	%f16 = 89000000 00007984 00000089 ff0000ff
!	%f20 = ff000000 ffffffff ff00ff00 ffffff8f
!	%f24 = 390000d7 ffa78737 d7ff0000 00000033
!	%f28 = 0000a19c 34000000 33b3288f 0000ffff
	stda	%f16,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00b80000000000ff, %f8  = d7000000 ffd7ffff
	ldda	[%i4+%o5]0x81,%f8 	! %f8  = 00b80000 000000ff

p0_label_159:
!	Mem[0000000010181410] = 00000089, %l1 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000089
!	Mem[0000000030041408] = 000000ff da6dd7ff, %l2 = 0000004d, %l3 = ff0087ff
	ldda	[%i1+%o4]0x89,%l2	! %l2 = 00000000da6dd7ff 00000000000000ff
!	Mem[0000000030181400] = 16afb44d fd0a3435, %l2 = da6dd7ff, %l3 = 000000ff
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 00000000fd0a3435 0000000016afb44d
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010081430] = 0000a19c, %f8  = 00b80000
	lda	[%i2+0x030]%asi,%f8 	! %f8 = 0000a19c
!	Mem[0000000010181410] = 89000000, %l2 = 00000000fd0a3435
	lduha	[%i6+%o5]0x80,%l2	! %l2 = 0000000000008900
!	Mem[0000000010081408] = 00000089 ff0000ff, %l6 = 0000b800, %l7 = 000000ff
	ldda	[%i2+0x008]%asi,%l6	! %l6 = 0000000000000089 00000000ff0000ff
!	Mem[0000000030101408] = 00000000, %l0 = 00000000000000ff
	lduba	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = 00346b5e, %l4 = 00000000000000ff
	lduwa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000346b5e
!	Mem[0000000021800100] = 00ff8452, %l0 = 0000000000000000
	ldsba	[%o3+0x101]%asi,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 000000ff, %l6 = 0000000000000089
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 000000ff000000ff

p0_label_160:
!	Mem[000000001004142c] = 00000033, %l2 = 00008900, %l1 = 00000089
	add	%i1,0x2c,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 0000000000000033
!	Mem[0000000010141408] = 00007a8d, %l4 = 0000000000346b5e
	ldstuba	[%i5+%o4]0x88,%l4	! %l4 = 0000008d000000ff
!	Mem[0000000010181400] = ffffff00, %l7 = 00000000ff0000ff, %asi = 80
	swapa	[%i6+0x000]%asi,%l7	! %l7 = 00000000ffffff00
!	%f22 = ff00ff00, Mem[0000000030181410] = ffffffff
	sta	%f22,[%i6+%o5]0x89	! Mem[0000000030181410] = ff00ff00
!	%l5 = 0000000087370000, Mem[0000000021800001] = 00ad951b, %asi = 80
	stba	%l5,[%o3+0x001]%asi	! Mem[0000000021800000] = 0000951b
!	%l4 = 000000000000008d, Mem[0000000030081400] = d7000000
	stha	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = d700008d
!	Mem[00000000300c1408] = ff0000ff, %f17 = 00007984
	lda	[%i3+%o4]0x89,%f17	! %f17 = ff0000ff
!	Mem[0000000030081410] = 00b80000, %l7 = 00000000ffffff00
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 0000000000b80000
!	%l7 = 0000000000b80000, Mem[0000000030081408] = 9ca10000
	stwa	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 00b80000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 16afb44d 000000ff, %l4 = 0000008d, %l5 = 87370000
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff 0000000016afb44d

p0_label_161:
!	Mem[0000000030141410] = 8f0000003c55e764, %l4 = 00000000000000ff
	ldxa	[%i5+%o5]0x81,%l4	! %l4 = 8f0000003c55e764
!	Mem[0000000030181410] = 00ff00ff, %l0 = ffffffffffffffff
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = 8f000000 00000000, %l0 = 00000000, %l1 = 00000033
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000 000000008f000000
!	Mem[0000000010101400] = ff000000ffffffff, %l7 = 0000000000b80000
	ldxa	[%i4+%g0]0x80,%l7	! %l7 = ff000000ffffffff
!	Mem[0000000010181410] = 89000000, %l1 = 000000008f000000
	ldsha	[%i6+0x010]%asi,%l1	! %l1 = ffffffffffff8900
!	Mem[00000000201c0000] = 8f310847, %l0 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 0000000000008f31
!	Mem[0000000030181408] = ffd76dda, %l5 = 0000000016afb44d
	lduba	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000da
!	Mem[00000000100c1408] = d7000000, %l1 = ffffffffffff8900
	ldsba	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffffffd7
!	Mem[00000000100c1430] = ff000000 35340afd, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%i3+0x030]%asi,%l6	! %l6 = 00000000ff000000 0000000035340afd
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 00000000, %l0 = 0000000000008f31
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_162:
!	%l7 = 0000000035340afd, Mem[0000000010041410] = 00000000
	stha	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000afd
!	Mem[0000000030181408] = ffd76dda, %l2 = 0000000000008900
	swapa	[%i6+%o4]0x89,%l2	! %l2 = 00000000ffd76dda
!	%l2 = ffd76dda, %l3 = 16afb44d, Mem[00000000300c1410] = 16afb4ff ffffbbeb
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffd76dda 16afb44d
!	%f14 = 9a421fd5 89000000, Mem[0000000030001400] = 6a13ff34 ff00ffff
	stda	%f14,[%i0+%g0]0x89	! Mem[0000000030001400] = 9a421fd5 89000000
!	%l4 = 8f0000003c55e764, Mem[0000000010141414] = 0000008f
	stw	%l4,[%i5+0x014]		! Mem[0000000010141414] = 3c55e764
!	%l2 = ffd76dda, %l3 = 16afb44d, Mem[00000000100c1430] = ff000000 35340afd
	std	%l2,[%i3+0x030]		! Mem[00000000100c1430] = ffd76dda 16afb44d
!	Mem[0000000030081408] = 00b80000, %l5 = 00000000000000da
	swapa	[%i2+%o4]0x89,%l5	! %l5 = 0000000000b80000
!	Mem[00000000100c1408] = d7000000, %l6 = 00000000ff000000
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 000000d7000000ff
!	%f3  = ffd76dda, Mem[0000000030181400] = fd0a3435
	sta	%f3 ,[%i6+%g0]0x89	! Mem[0000000030181400] = ffd76dda
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00003787, %l7 = 0000000035340afd
	lduwa	[%i1+%g0]0x81,%l7	! %l7 = 0000000000003787

p0_label_163:
!	Mem[0000000010081400] = 89000000, %l0 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffff8900
!	Mem[0000000010141408] = 00007aff, %l5 = 0000000000b80000
	ldsha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000007aff
!	Mem[0000000010041408] = 00000034, %l0 = ffffffffffff8900
	lduba	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 003b0073, %l5 = 0000000000007aff
	lduha	[%i5+%g0]0x80,%l5	! %l5 = 000000000000003b
!	Mem[0000000010001420] = da6dd7ff000000d7, %l0 = 0000000000000000
	ldx	[%i0+0x020],%l0		! %l0 = da6dd7ff000000d7
!	Mem[0000000030141400] = 00000000ffffff00, %l2 = 00000000ffd76dda
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = 00000000ffffff00
!	Mem[0000000010081410] = ffffffff000000ff, %l3 = 0000000016afb44d
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = ffffffff000000ff
!	Mem[0000000010141410] = 00000000, %l0 = da6dd7ff000000d7
	ldswa	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 003b0073, %l3 = ffffffff000000ff
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000003787, Mem[000000001004143a] = ffa78737
	sth	%l7,[%i1+0x03a]		! Mem[0000000010041438] = ffa73787

p0_label_164:
!	Mem[0000000010141418] = 000000bb, %l0 = 0000000000000000
	swap	[%i5+0x018],%l0		! %l0 = 00000000000000bb
!	%l5 = 000000000000003b, Mem[0000000030081400] = d700008d
	stwa	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000003b
!	Mem[0000000010181424] = eb838479, %l4 = 8f0000003c55e764
	ldstuba	[%i6+0x024]%asi,%l4	! %l4 = 000000eb000000ff
!	%l2 = ffffff00, %l3 = 00000000, Mem[00000000300c1410] = da6dd7ff 4db4af16
	stda	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffff00 00000000
!	%l4 = 00000000000000eb, Mem[0000000030001400] = 89000000
	stba	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 890000eb
!	%l4 = 00000000000000eb, Mem[0000000030141410] = 8f000000
	stwa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000eb
!	%l1 = ffffffffffffffd7, Mem[0000000030181400] = da6dd7ff
	stba	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = d76dd7ff
!	Mem[0000000010101408] = 39007a8d, %l2 = 00000000ffffff00
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 0000000039007a8d
!	Mem[00000000300c1410] = ffffff00, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 00000000ffffff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 8d7a4374, %l4 = 00000000000000eb
	ldsb	[%i0+0x012],%l4		! %l4 = 0000000000000043

p0_label_165:
!	Mem[0000000010041408] = 00000034, %l2 = 0000000039007a8d
	lduw	[%i1+%o4],%l2		! %l2 = 0000000000000034
!	Mem[0000000030081400] = 3b000000, %f23 = ffffff8f
	lda	[%i2+%g0]0x81,%f23	! %f23 = 3b000000
!	Mem[0000000030181410] = ff00ff00, %f31 = 0000ffff
	lda	[%i6+%o5]0x89,%f31	! %f31 = ff00ff00
!	Mem[0000000030041408] = ffd76dda, %l5 = 000000000000003b
	ldsha	[%i1+%o4]0x81,%l5	! %l5 = ffffffffffffffd7
!	Mem[00000000300c1408] = ff0000ff, %l5 = ffffffffffffffd7
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = ffffffffff0000ff
!	Mem[00000000300c1408] = ff0000ff00000000, %f22 = ff00ff00 3b000000
	ldda	[%i3+%o4]0x81,%f22	! %f22 = ff0000ff 00000000
!	Mem[00000000300c1400] = ff000000, %l4 = 0000000000000043
	lduba	[%i3+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = 000000008f28b333, %f2  = 0000ff00 ffd76dda
	ldda	[%i4+%o4]0x81,%f2 	! %f2  = 00000000 8f28b333
!	Mem[0000000030181410] = 00000033 ff00ff00, %l0 = 000000bb, %l1 = ffffffd7
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000ff00ff00 0000000000000033
!	Starting 10 instruction Store Burst
!	%l6 = 000000d7, %l7 = 00003787, Mem[0000000010101438] = 00000000 00007a8d
	stda	%l6,[%i4+0x038]%asi	! Mem[0000000010101438] = 000000d7 00003787

p0_label_166:
!	%f24 = 390000d7 ffa78737, %l0 = 00000000ff00ff00
!	Mem[0000000030101400] = 0000ffffffffffff
	stda	%f24,[%i4+%l0]ASI_PST32_SL ! Mem[0000000030101400] = 0000ffffffffffff
!	%l0 = ff00ff00, %l1 = 00000033, Mem[0000000030101410] = 0000b800 ff000000
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = ff00ff00 00000033
!	%l0 = 00000000ff00ff00, Mem[0000000010041400] = 000000d75e6b3400
	stxa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000ff00ff00
!	Mem[0000000010081410] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f9  = 000000ff, Mem[00000000300c1400] = 000000ff
	sta	%f9 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	%f20 = ff000000 ffffffff, %l7 = 0000000000003787
!	Mem[0000000030181400] = d76dd7ff4db4af16
	stda	%f20,[%i6+%l7]ASI_PST16_SL ! Mem[0000000030181400] = ffffffff0000af16
!	%f10 = 982a3c92 000000b8, Mem[00000000100c1428] = 00000000 0000ffff
	std	%f10,[%i3+0x028]	! Mem[00000000100c1428] = 982a3c92 000000b8
!	%l1 = 0000000000000033, Mem[000000001010141a] = ffff2a98, %asi = 80
	stba	%l1,[%i4+0x01a]%asi	! Mem[0000000010101418] = ffff3398
!	%f16 = 89000000 ff0000ff, Mem[0000000030141408] = ffffffff ffff2a98
	stda	%f16,[%i5+%o4]0x89	! Mem[0000000030141408] = 89000000 ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 9a421fd5 890000eb, %l4 = 000000ff, %l5 = ff0000ff
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000890000eb 000000009a421fd5

p0_label_167:
!	Mem[000000001000142c] = 373c2a98, %l6 = 00000000000000d7
	lduwa	[%i0+0x02c]%asi,%l6	! %l6 = 00000000373c2a98
!	Mem[0000000030101410] = 00ff00ff, %l4 = 00000000890000eb
	lduwa	[%i4+%o5]0x81,%l4	! %l4 = 0000000000ff00ff
!	Mem[0000000030181410] = 00ff00ff, %l0 = 00000000ff00ff00
	ldsha	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 34000000, %l1 = 0000000000000033
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = 00ff00ff, %f19 = ff0000ff
	lda	[%i6+%o5]0x81,%f19	! %f19 = 00ff00ff
!	Mem[0000000030081410] = ffffff00, %l7 = 0000000000003787
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101408] = 000000008f28b333, %f30 = 33b3288f ff00ff00
	ldda	[%i4+%o4]0x81,%f30	! %f30 = 00000000 8f28b333
!	Mem[0000000010081424] = ffa78737, %l4 = 0000000000ff00ff
	lduw	[%i2+0x024],%l4		! %l4 = 00000000ffa78737
!	Mem[0000000010141410] = 00000000, %l3 = 00000000ffffff00
	ldsba	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 0000006d 3c000000, Mem[0000000030081400] = 3b000000 ffffffff
	stda	%f0 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000006d 3c000000

p0_label_168:
!	Mem[00000000100c1410] = 0000003c6d000000, %l3 = 0000000000000000, %l3 = 0000000000000000
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = 0000003c6d000000
!	%l2 = 00000034, %l3 = 6d000000, Mem[0000000010181400] = ff0000ff 000000b8
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000034 6d000000
!	%f6  = 102123e9 00000000, Mem[0000000010081400] = 89000000 00007984
	stda	%f6 ,[%i2+%g0]0x80	! Mem[0000000010081400] = 102123e9 00000000
!	%l3 = 0000003c6d000000, Mem[00000000300c1400] = da6dd733000000ff
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000003c6d000000
!	Mem[0000000010041408] = 00000034, %l7 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081410] = ffffff00, %l2 = 0000000000000034
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	%f3  = 8f28b333, Mem[0000000010081434] = 34000000
	sta	%f3 ,[%i2+0x034]%asi	! Mem[0000000010081434] = 8f28b333
!	Mem[000000001004143c] = 00003978, %l6 = 00000000373c2a98, %asi = 80
	swapa	[%i1+0x03c]%asi,%l6	! %l6 = 0000000000003978
!	Mem[000000001014140c] = 000000d7, %l4 = 00000000ffa78737
	swap	[%i5+0x00c],%l4		! %l4 = 00000000000000d7
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l5 = 000000009a421fd5
	ldsba	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000

p0_label_169:
!	Mem[0000000010041408] = 340000ff, %l1 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081400] = 0000006d3c000000, %f6  = 102123e9 00000000
	ldda	[%i2+%g0]0x81,%f6 	! %f6  = 0000006d 3c000000
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000000
	ldswa	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = ffffff00ffffffff, %f2  = 00000000 8f28b333
	ldda	[%i4+%o4]0x80,%f2 	! %f2  = ffffff00 ffffffff
!	Mem[0000000010181400] = 0000006d34000000, %f18 = 00000089 00ff00ff
	ldda	[%i6+%g0]0x88,%f18	! %f18 = 0000006d 34000000
!	Mem[00000000201c0000] = 8f310847, %l4 = 00000000000000d7
	ldsh	[%o0+%g0],%l4		! %l4 = ffffffffffff8f31
!	Mem[0000000030181410] = 00000033ff00ff00, %f24 = 390000d7 ffa78737
	ldda	[%i6+%o5]0x89,%f24	! %f24 = 00000033 ff00ff00
!	Mem[0000000030081408] = da00000034000000, %l7 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l7	! %l7 = da00000034000000
!	Mem[0000000010181410] = 8479000000000089, %f10 = 982a3c92 000000b8
	ldda	[%i6+%o5]0x88,%f10	! %f10 = 84790000 00000089
!	Starting 10 instruction Store Burst
!	%l3 = 0000003c6d000000, Mem[0000000030101410] = 00000033ff00ff00
	stxa	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000003c6d000000

p0_label_170:
!	%f10 = 84790000 00000089, %l4 = ffffffffffff8f31
!	Mem[0000000030001428] = a41b16cc4e6eb823
	add	%i0,0x028,%g1
	stda	%f10,[%g1+%l4]ASI_PST32_S ! Mem[0000000030001428] = a41b16cc00000089
!	Mem[0000000030041410] = d7000039, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 00000000d7000039
!	%l2 = 00000000000000ff, Mem[0000000030141400] = 00ffffff
	stba	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffff
!	%l3 = 0000003c6d000000, Mem[0000000021800181] = ff31809b, %asi = 80
	stba	%l3,[%o3+0x181]%asi	! Mem[0000000021800180] = ff00809b
!	%l6 = 00003978, %l7 = 34000000, Mem[00000000100c1408] = 000000ff 003c0000
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00003978 34000000
!	%f20 = ff000000, Mem[0000000030181400] = ffffffff
	sta	%f20,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	Mem[0000000010101408] = ffffff00, %l0 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	%l1 = ffffffffffffffff, Mem[0000000030181410] = ff00ff00
	stba	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = ff00ffff
!	%f22 = ff0000ff 00000000, Mem[0000000010041408] = ff000034 ff000000
	stda	%f22,[%i1+%o4]0x80	! Mem[0000000010041408] = ff0000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00ffffff, %l1 = ffffffffffffffff
	ldsha	[%i2+%o5]0x89,%l1	! %l1 = ffffffffffffffff

p0_label_171:
!	Mem[0000000030141410] = 000000eb, %l3 = 0000003c6d000000
	ldswa	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000eb
!	Mem[0000000030181408] = 0089000000ff0000, %f18 = 0000006d 34000000
	ldda	[%i6+%o4]0x81,%f18	! %f18 = 00890000 00ff0000
!	Mem[0000000030101400] = ffff0000, %l5 = 00000000d7000039
	ldsba	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001430] = 000000ff, %l5 = 0000000000000000
	lduha	[%i0+0x030]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800000] = d7ff261d, %l2 = 00000000000000ff
	ldsba	[%o1+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081418] = ff00ff00, %l6 = 0000000000003978
	ldsh	[%i2+0x01a],%l6		! %l6 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (27)
!	Mem[00000000300c1400] = 0000006d 3c000000 ff0000ff 00000000
!	Mem[00000000300c1410] = 00000000 00000000 f4df2837 efe09bab
!	Mem[00000000300c1420] = 68ebf655 d87b3978 ffffffff 89000000
!	Mem[00000000300c1430] = 3c76f8fb 152a7b16 4613c66d 1e4f7940
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000020800000] = d7ff261d, %l6 = ffffffffffffff00
	ldsh	[%o1+%g0],%l6		! %l6 = ffffffffffffd7ff
!	Mem[00000000211c0000] = ffff58bc, %l7 = da00000034000000
	lduh	[%o2+%g0],%l7		! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f15 = 89000000, Mem[0000000010001434] = 00000000
	st	%f15,[%i0+0x034]	! Mem[0000000010001434] = 89000000

p0_label_172:
!	Mem[0000000010181408] = 00ff00ff, %l0 = 00000000000000ff
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 0000000000ff00ff
!	%l3 = 00000000000000eb, Mem[0000000010181400] = 000000346d000000
	stxa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000000000eb
	membar	#Sync			! Added by membar checker (28)
!	%l0 = 0000000000ff00ff, Mem[00000000300c1408] = ff0000ff
	stba	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff0000ff
!	%l3 = 00000000000000eb, Mem[0000000010181434] = ffffffff
	stw	%l3,[%i6+0x034]		! Mem[0000000010181434] = 000000eb
!	%f31 = 1e4f7940, Mem[0000000010081408] = 89000000
	sta	%f31,[%i2+%o4]0x88	! Mem[0000000010081408] = 1e4f7940
!	%l4 = ffffffffffff8f31, Mem[000000001004142f] = 00000033, %asi = 80
	stba	%l4,[%i1+0x02f]%asi	! Mem[000000001004142c] = 00000031
!	Mem[00000000300c1400] = 0000006d, %l3 = 00000000000000eb
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 000000000000006d
!	%f12 = 00000000 0000008f, Mem[0000000030141400] = ffffffff 00000000
	stda	%f12,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 0000008f
!	%f0  = 0000006d 3c000000, %l5 = 0000000000000000
!	Mem[0000000010001400] = ff0000004db4af16
	stda	%f0,[%i0+%l5]ASI_PST8_PL ! Mem[0000000010001400] = ff0000004db4af16
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000089, %f14 = 9a421fd5
	lda	[%i6+%o5]0x88,%f14	! %f14 = 00000089

p0_label_173:
!	Mem[0000000010041408] = ff0000ff, %l1 = ffffffffffffffff
	ldub	[%i1+0x009],%l1		! %l1 = 0000000000000000
!	Mem[0000000010041424] = 00000064, %f22 = f4df2837
	ld	[%i1+0x024],%f22	! %f22 = 00000064
!	Mem[0000000030181400] = 000000ff, %f1  = 3c000000
	lda	[%i6+%g0]0x89,%f1 	! %f1 = 000000ff
!	Mem[0000000030141400] = 8f000000, %l5 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l5	! %l5 = 000000008f000000
!	Mem[0000000010001410] = 8d7a4374, %l5 = 000000008f000000
	lduha	[%i0+%o5]0x80,%l5	! %l5 = 0000000000008d7a
!	Mem[0000000010101408] = 00ffffff, %l0 = 0000000000ff00ff
	lduwa	[%i4+%o4]0x88,%l0	! %l0 = 0000000000ffffff
!	Mem[0000000010081410] = ff000000, %l6 = ffffffffffffd7ff
	lduh	[%i2+%o5],%l6		! %l6 = 000000000000ff00
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010001400] = ff000000 4db4af16 3787da6d d7000039
!	Mem[0000000010001410] = 8d7a4374 000000ff 00000000 ebbbffff
!	Mem[0000000010001420] = da6dd7ff 000000d7 23b86e4e 373c2a98
!	Mem[0000000010001430] = 000000ff 89000000 5163e764 73000000
	ldda	[%i0]ASI_BLK_PL,%f0	! Block Load from 0000000010001400
!	Mem[0000000010041428] = d7ff000000000031, %f18 = ff0000ff 00000000
	ldda	[%i1+0x028]%asi,%f18	! %f18 = d7ff0000 00000031
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ffff, Mem[0000000021800040] = ff59c626
	sth	%l7,[%o3+0x040]		! Mem[0000000021800040] = ffffc626

p0_label_174:
!	%l4 = ffff8f31, %l5 = 00008d7a, Mem[0000000010101400] = ff000000 ffffffff
	stda	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = ffff8f31 00008d7a
!	%l7 = 000000000000ffff, Mem[00000000218001c0] = ff42a805, %asi = 80
	stba	%l7,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = ff42a805
!	%l0 = 00ffffff, %l1 = 00000000, Mem[0000000010081408] = 1e4f7940 ff0000ff
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00ffffff 00000000
!	Mem[00000000100c1410] = 3c000000, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 000000003c000000
!	%f18 = d7ff0000, %f28 = 3c76f8fb 152a7b16
	fstod	%f18,%f28		! %f28 = c2ffe000 00000000
!	%l0 = 0000000000ffffff, Mem[0000000010101410] = 318f0000
	stwa	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00ffffff
!	%f16 = 0000006d 3c000000, Mem[0000000030001410] = b2ffff00 157839c2
	stda	%f16,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000006d 3c000000
!	%l4 = ffffffffffff8f31, Mem[0000000030141408] = ff0000ff00000089
	stxa	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffffffff8f31
!	%l1 = 000000003c000000, Mem[0000000030181408] = 00008900
	stha	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0000008f, %l2 = ffffffffffffffff
	lduha	[%i5+%g0]0x89,%l2	! %l2 = 000000000000008f

p0_label_175:
!	Mem[0000000030081408] = da000000, %f21 = 00000000
	lda	[%i2+%o4]0x81,%f21	! %f21 = da000000
!	Mem[0000000010081414] = ffffffff, %l6 = 000000000000ff00
	ldsh	[%i2+0x016],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000100c1408] = 00003978, %l6 = ffffffffffffffff
	lduha	[%i3+%o4]0x88,%l6	! %l6 = 0000000000003978
!	Mem[0000000030041408] = ffd76ddaff000000, %l0 = 0000000000ffffff
	ldxa	[%i1+%o4]0x81,%l0	! %l0 = ffd76ddaff000000
!	Mem[0000000010141410] = 00000000, %l2 = 000000000000008f
	lduh	[%i5+%o5],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l2 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030141400] = 8f00000000000000, %l5 = 0000000000008d7a
	ldxa	[%i5+%g0]0x81,%l5	! %l5 = 8f00000000000000
!	Mem[0000000010141408] = 00007aff, %f16 = 0000006d
	lda	[%i5+%o4]0x88,%f16	! %f16 = 00007aff
!	Mem[0000000010001400] = ff0000004db4af16, %l0 = ffd76ddaff000000
	ldx	[%i0+%g0],%l0		! %l0 = ff0000004db4af16
!	Starting 10 instruction Store Burst
!	%l1 = 000000003c000000, Mem[0000000010101410] = 00ffffff
	stwa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 3c000000

p0_label_176:
!	%f30 = 4613c66d 1e4f7940, %l2 = 000000000000ff00
!	Mem[0000000010181410] = 8900000000007984
	add	%i6,0x010,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_P ! Mem[0000000010181410] = 8900000000007984
!	%l0 = ff0000004db4af16, Mem[0000000030001410] = 0000003c6d000000
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = ff0000004db4af16
!	%l1 = 000000003c000000, Mem[0000000010101410] = 0000003cffffffff
	stxa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000003c000000
!	Mem[0000000030181400] = ff000000, %l4 = ffffffffffff8f31
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	%f29 = 00000000, Mem[0000000030101400] = 0000ffff
	sta	%f29,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%f24 = 68ebf655, Mem[0000000010181410] = 00000089
	sta	%f24,[%i6+%o5]0x88	! Mem[0000000010181410] = 68ebf655
!	%l1 = 000000003c000000, Mem[0000000010181410] = 55f6eb68
	stha	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000eb68
!	Mem[00000000100c1400] = 00000000, %l7 = 000000000000ffff
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = 6dda8737, %l7 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 00000037000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff000000, %l1 = 000000003c000000
	ldsha	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffff00

p0_label_177:
!	Mem[0000000010101400] = ffff8f31, %l7 = 0000000000000037
	lduba	[%i4+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1400] = eb000000, %f24 = 68ebf655
	lda	[%i3+%g0]0x89,%f24	! %f24 = eb000000
!	Mem[00000000300c1408] = ff0000ff, %f5  = 74437a8d
	lda	[%i3+%o4]0x81,%f5 	! %f5 = ff0000ff
!	Mem[0000000020800000] = d7ff261d, %l6 = 0000000000003978
	ldsba	[%o1+0x001]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101400] = 00000000, %l3 = 000000000000006d
	lduha	[%i4+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 00000000 e9232110, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 00000000e9232110 0000000000000000
!	Mem[0000000030141410] = eb000000, %l0 = ff0000004db4af16
	lduba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 4db4af16, %f20 = 00000000
	lda	[%i0+%o5]0x89,%f20	! %f20 = 4db4af16
!	Mem[00000000100c1400] = ff000000, %l7 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 000000eb, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000ff

p0_label_178:
!	Mem[0000000030181410] = ffff00ff, %l0 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000030141400] = 0000008f
	stha	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	%f3  = 6dda8737, Mem[0000000030001400] = 890000eb
	sta	%f3 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 6dda8737
!	Mem[0000000030141408] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000010041408] = ff0000ff
	stha	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ff00ff
!	Mem[0000000030101408] = 00000000, %l7 = 000000000000ff00
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%f12 = 00000089 ff000000, %f4  = ff000000
	fxtos	%f12,%f4 		! %f4  = 5309ff00
!	%f12 = 00000089 ff000000, Mem[0000000030041410] = 00000000 8d63ec98
	stda	%f12,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000089 ff000000
!	%l7 = 0000000000000000, Mem[0000000030101410] = 0000006d3c000000
	stxa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 84ffffffda6dd733, %l5 = 8f00000000000000
	ldxa	[%i0+%o4]0x81,%l5	! %l5 = 84ffffffda6dd733

p0_label_179:
!	Mem[0000000010141400] = 003b0073982affff, %f16 = 00007aff 3c000000
	ldda	[%i5+%g0]0x80,%f16	! %f16 = 003b0073 982affff
!	Mem[00000000100c1410] = 0000006d00000000, %f22 = 00000064 efe09bab
	ldda	[%i3+%o5]0x88,%f22	! %f22 = 0000006d 00000000
!	Mem[0000000010181408] = 000000ff, %l4 = 00000000000000ff
	ldsba	[%i6+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141410] = 00000000, %l2 = 000000000000ff00
	lduba	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 33b3288f00ff0000, %l0 = 00000000000000ff
	ldxa	[%i4+%o4]0x89,%l0	! %l0 = 33b3288f00ff0000
!	Mem[0000000030041400] = 00003787, %f14 = 00000073
	lda	[%i1+%g0]0x81,%f14	! %f14 = 00003787
!	Mem[0000000030181410] = ff00ffff, %l7 = 0000000000000000
	lduwa	[%i6+%o5]0x89,%l7	! %l7 = 00000000ff00ffff
!	Mem[0000000010041400] = 00000000ff00ff00, %f22 = 0000006d 00000000
	ldda	[%i1+%g0]0x88,%f22	! %f22 = 00000000 ff00ff00
!	Mem[00000000100c1400] = 000000ff, %l6 = 00000000e9232110
	lduba	[%i3+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff00, Mem[0000000030081410] = 00003c0000ffffff
	stxa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffffffffff00

p0_label_180:
!	Mem[00000000201c0000] = 8f310847, %l0 = 33b3288f00ff0000
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 000000000000008f
!	%l6 = 00000000000000ff, Mem[0000000010081400] = e9232110
	stba	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = e92321ff
!	%f12 = 00000089 ff000000, Mem[0000000010101410] = 00000000 0000003c
	stda	%f12,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000089 ff000000
!	Mem[0000000010101408] = 00ffffff, %l7 = 00000000ff00ffff
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 0000000000ffffff
!	Mem[0000000010141410] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l4 = ffffffffffffffff, Mem[0000000030001410] = ff0000004db4af16
	stxa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffffffffffffff
!	Mem[00000000300c1410] = 00000000, %l6 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%f5  = ff0000ff, Mem[0000000030101410] = 00000000
	sta	%f5 ,[%i4+%o5]0x81	! Mem[0000000030101410] = ff0000ff
!	Mem[0000000030181410] = ff00ffff, %l4 = ffffffffffffffff
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff87da6d, %l3 = 00000000000000ff
	lduwa	[%i0+%o4]0x80,%l3	! %l3 = 00000000ff87da6d

p0_label_181:
!	Mem[0000000010081414] = ffffffff, %f20 = 4db4af16
	lda	[%i2+0x014]%asi,%f20	! %f20 = ffffffff
!	Mem[00000000100c1410] = 00000000, %l1 = ffffffffffffff00
	ldsha	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l5 = 84ffffffda6dd733
	ldswa	[%i1+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141410] = 000000ff, %l2 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041410] = 8479708c 00000afd, %l6 = 00000000, %l7 = 00ffffff
	ldda	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000afd 000000008479708c
!	Mem[0000000030141400] = ff000000, %l1 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181408] = 00000000, %l0 = 000000000000008f
	ldswa	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l5 = 00000000000000ff
	lduwa	[%i1+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101400] = ffff8f31, %l5 = 00000000000000ff
	lduha	[%i4+%g0]0x80,%l5	! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ff87da6d, Mem[00000000201c0000] = 8f310847
	stb	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 6d310847

p0_label_182:
!	%l5 = 000000000000ffff, Mem[0000000010081400] = ff2123e9
	stba	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = ff2123e9
!	%l1 = ffffffffffffffff, Mem[0000000030101410] = ff0000ff00000000
	stxa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffffffffffff
	membar	#Sync			! Added by membar checker (30)
!	%f24 = eb000000 d87b3978, Mem[0000000010001400] = ff000000 4db4af16
	stda	%f24,[%i0+%g0]0x80	! Mem[0000000010001400] = eb000000 d87b3978
!	%l6 = 0000000000000afd, Mem[0000000030181408] = 00000000
	stha	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000afd
!	%l3 = 00000000ff87da6d, Mem[00000000211c0000] = ffff58bc
	stb	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 6dff58bc
!	Mem[0000000030101400] = 00000000, %l1 = ffffffffffffffff
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%f28 = c2ffe000 00000000, Mem[00000000100c1408] = 00003978 34000000
	stda	%f28,[%i3+%o4]0x88	! Mem[00000000100c1408] = c2ffe000 00000000
!	%f28 = c2ffe000 00000000, Mem[0000000030081400] = 6d000000 0000003c
	stda	%f28,[%i2+%g0]0x89	! Mem[0000000030081400] = c2ffe000 00000000
!	Mem[0000000010041404] = 00000000, %l0 = 00000000, %l3 = ff87da6d
	add	%i1,0x04,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = e92321ff, %l0 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff

p0_label_183:
!	Mem[0000000030041408] = ffd76ddaff000000, %f20 = ffffffff da000000
	ldda	[%i1+%o4]0x81,%f20	! %f20 = ffd76dda ff000000
!	Mem[00000000201c0000] = 6d310847, %l6 = 0000000000000afd
	ldsb	[%o0+%g0],%l6		! %l6 = 000000000000006d
!	Mem[0000000030181400] = ff000000, %l3 = 0000000000000000
	ldswa	[%i6+%g0]0x81,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030141410] = eb0000ff, %l6 = 000000000000006d
	lduha	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081408] = 00ffffff, %l7 = 000000008479708c
	ldsba	[%i2+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041408] = 00ff00ff, %l1 = 0000000000000000
	ldsba	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = ffff00ff33000000, %f2  = 390000d7 6dda8737
	ldda	[%i6+%o5]0x81,%f2 	! %f2  = ffff00ff 33000000
!	Mem[0000000030141400] = 000000ff, %l5 = 000000000000ffff
	ldsha	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1400] = 000000eb, %l0 = 00000000000000ff
	ldsba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010181400] = 00000000
	stwa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff

p0_label_184:
!	%f26 = ffffffff, Mem[00000000100c1418] = ff000089
	st	%f26,[%i3+0x018]	! Mem[00000000100c1418] = ffffffff
!	Mem[0000000030041408] = ffd76dda, %l4 = 00000000000000ff
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%f0  = 16afb44d 000000ff ffff00ff 33000000
!	%f4  = 5309ff00 ff0000ff ffffbbeb 00000000
!	%f8  = d7000000 ffd76dda 982a3c37 4e6eb823
!	%f12 = 00000089 ff000000 00003787 64e76351
	stda	%f0,[%i6]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	Mem[0000000010081400] = ff2123e9, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 00000000ff2123e9
!	%l6 = 00000000ff2123e9, Mem[0000000010181408] = ff000000
	stwa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = ff2123e9
!	%l3 = ffffffffff000000, Mem[0000000030181408] = ff00ffff
	stwa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000
!	%f22 = 00000000 ff00ff00, Mem[0000000030081410] = 00ffffff ffffffff
	stda	%f22,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 ff00ff00
!	%f22 = 00000000 ff00ff00, Mem[0000000030081410] = 00000000 00ff00ff
	stda	%f22,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 ff00ff00
!	%l1 = 0000000000000000, Mem[0000000030181410] = 00ff0953
	stba	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 00ff0900
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = ffff2e44, %l5 = 00000000000000ff
	lduha	[%o3+0x080]%asi,%l5	! %l5 = 000000000000ffff

p0_label_185:
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010181400] = ff000000, %l1 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001408] = 6dda87ff, %l2 = 00000000000000ff
	lduha	[%i0+%o4]0x88,%l2	! %l2 = 00000000000087ff
!	Mem[0000000010001410] = 74437a8d, %l1 = ffffffffffffffff
	ldswa	[%i0+%o5]0x88,%l1	! %l1 = 0000000074437a8d
!	Mem[00000000300c1408] = ff0000ff, %l7 = ffffffffffffffff
	ldsha	[%i3+%o4]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030141410] = eb0000ff, %l7 = ffffffffffffff00
	lduwa	[%i5+%o5]0x89,%l7	! %l7 = 00000000eb0000ff
!	Mem[0000000030141400] = ff00000000000000, %l1 = 0000000074437a8d
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = ff00000000000000
!	Mem[0000000010181410] = 0000eb6800007984, %l7 = 00000000eb0000ff
	ldxa	[%i6+%o5]0x80,%l7	! %l7 = 0000eb6800007984
!	Mem[0000000030181400] = 16afb44d, %l5 = 000000000000ffff
	lduwa	[%i6+%g0]0x81,%l5	! %l5 = 0000000016afb44d
!	Mem[0000000010181400] = eb000000000000ff, %f6  = ffffbbeb 00000000
	ldda	[%i6+%g0]0x88,%f6 	! %f6  = eb000000 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 0000eb68, %l1 = ff00000000000000
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 00000000000000ff

p0_label_186:
!	Mem[0000000021800040] = ffffc626, %l5 = 0000000016afb44d
	ldstuba	[%o3+0x040]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030101400] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i4+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%f4  = 5309ff00 ff0000ff, %l6 = 00000000ff2123e9
!	Mem[0000000010041430] = ffe763510000e764
	add	%i1,0x030,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_P ! Mem[0000000010041430] = ffe76351ff0000ff
!	%l2 = 00000000000087ff, Mem[0000000010181408] = e92321ff
	stha	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = e92387ff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[00000000100c1400] = 000000ff ffff2a98
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff 000000ff
!	Mem[0000000010141428] = 000000ff16afb44d, %l6 = 00000000ff2123e9, %l6 = 00000000ff2123e9
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 000000ff16afb44d
!	%f8  = d7000000 ffd76dda, %l7 = 0000eb6800007984
!	Mem[0000000010081410] = ff000000ffffffff
	add	%i2,0x010,%g1
	stda	%f8,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010081410] = ff000000ffffffff
!	%f23 = ff00ff00, Mem[0000000010041400] = 00ff00ff
	sta	%f23,[%i1+%g0]0x80	! Mem[0000000010041400] = ff00ff00
!	Mem[0000000010041410] = 00000afd, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000afd
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffffffff, %l3 = ffffffffff000000
	lduwa	[%i5+%o4]0x81,%l3	! %l3 = 00000000ffffffff

p0_label_187:
!	Mem[0000000030101400] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030101408] = 33b3288f 00ff0000, %l2 = 000087ff, %l3 = ffffffff
	ldda	[%i4+%o4]0x89,%l2	! %l2 = 0000000000ff0000 0000000033b3288f
!	Mem[0000000010081410] = ffffffff000000ff, %f4  = 5309ff00 ff0000ff
	ldda	[%i2+%o5]0x88,%f4 	! %f4  = ffffffff 000000ff
!	Mem[0000000010101404] = 00008d7a, %l6 = 000000ff16afb44d
	lduw	[%i4+0x004],%l6		! %l6 = 0000000000008d7a
!	Mem[0000000010181408] = ff8723e9, %l3 = 0000000033b3288f
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 00000000ff8723e9
!	Mem[0000000010081410] = ff000000ffffffff, %f8  = d7000000 ffd76dda
	ldda	[%i2+%o5]0x80,%f8 	! %f8  = ff000000 ffffffff
!	Mem[0000000010181410] = 8479000068eb00ff, %l5 = 00000000000000ff
	ldxa	[%i6+%o5]0x88,%l5	! %l5 = 8479000068eb00ff
!	Mem[0000000030001410] = ffffffff, %l2 = 0000000000ff0000
	lduwa	[%i0+%o5]0x89,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010041408] = ff00ff00, %l6 = 0000000000008d7a
	ldswa	[%i1+%o4]0x88,%l6	! %l6 = ffffffffff00ff00
!	Starting 10 instruction Store Burst
!	%l7 = 0000eb6800007984, Mem[00000000300c1410] = 00000000
	stha	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00007984

p0_label_188:
!	Mem[0000000030141400] = ff000000, %l5 = 8479000068eb00ff
	swapa	[%i5+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	%l0 = 000000ff, %l1 = 00000afd, Mem[0000000010081408] = ffffff00 00000000
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff 00000afd
!	%l4 = 00000000000000ff, Mem[00000000300c1410] = 84790000
	stba	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff790000
!	%l5 = 00000000ff000000, Mem[0000000010101410] = ff000000
	stwa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000000
!	Mem[0000000030041408] = da6dd7ff, %l3 = 00000000ff8723e9
	ldstuba	[%i1+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	%l2 = 00000000ffffffff, Mem[0000000030041410] = 000000ff
	stba	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = ff0000ff
!	Mem[0000000030041408] = da6dd7ff, %l5 = 00000000ff000000
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 00000000da6dd7ff
!	Mem[00000000100c1408] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l5 = 00000000da6dd7ff, Mem[00000000211c0001] = 6dff58bc
	stb	%l5,[%o2+0x001]		! Mem[00000000211c0000] = 6dff58bc
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 6d310847, %l6 = ffffffffff00ff00
	ldsb	[%o0+%g0],%l6		! %l6 = 000000000000006d

p0_label_189:
!	Mem[0000000030141408] = ffffffff, %l6 = 000000000000006d
	lduha	[%i5+%o4]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010141408] = 00007aff, %l3 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101418] = ffff3398ffffffff, %l1 = 0000000000000afd
	ldxa	[%i4+0x018]%asi,%l1	! %l1 = ffff3398ffffffff
!	Mem[0000000030101408] = 33b3288f00ff0000, %f22 = 00000000 ff00ff00
	ldda	[%i4+%o4]0x89,%f22	! %f22 = 33b3288f 00ff0000
!	Mem[000000001004142c] = 00000031, %l2 = 00000000ffffffff
	lduwa	[%i1+0x02c]%asi,%l2	! %l2 = 0000000000000031
!	Mem[00000000300c1410] = ff79000000000000, %f26 = ffffffff 89000000
	ldda	[%i3+%o5]0x81,%f26	! %f26 = ff790000 00000000
!	Mem[00000000211c0000] = 6dff58bc, %l4 = 00000000000000ff
	ldsh	[%o2+%g0],%l4		! %l4 = 0000000000006dff
!	Mem[0000000030181410] = 0009ff00ff0000ff, %f22 = 33b3288f 00ff0000
	ldda	[%i6+%o5]0x81,%f22	! %f22 = 0009ff00 ff0000ff
!	Mem[000000001004143c] = 373c2a98, %l4 = 0000000000006dff
	lduh	[%i1+0x03c],%l4		! %l4 = 000000000000373c
!	Starting 10 instruction Store Burst
!	%l4 = 0000373c, %l5 = da6dd7ff, Mem[00000000100c1400] = ff000000 ff000000
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000373c da6dd7ff

p0_label_190:
!	%l1 = ffff3398ffffffff, Mem[0000000010181410] = ff00eb68
	stha	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffeb68
!	%l0 = 00000000000000ff, Mem[0000000010141410] = ff0000003c55e764
	stxa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000000000ff
!	%l6 = 000000000000ffff, Mem[0000000030101400] = ffffffff000000ff
	stxa	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000000000ffff
!	Mem[00000000300c1408] = ff0000ff, %l6 = 000000000000ffff
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 00000000ff0000ff
!	%l0 = 00000000000000ff, Mem[0000000010081400] = ff000000
	stwa	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%l6 = 00000000ff0000ff, Mem[00000000100c1410] = 00000000
	stwa	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff0000ff
!	%l5 = 00000000da6dd7ff, Mem[0000000010181400] = ff000000, %asi = 80
	stwa	%l5,[%i6+0x000]%asi	! Mem[0000000010181400] = da6dd7ff
!	%l2 = 0000000000000031, Mem[0000000010141408] = 3787a7ff00007aff
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000031
!	Mem[000000001018140d] = ffffff8f, %l3 = 00000000000000ff
	ldstub	[%i6+0x00d],%l3		! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffff00ff, %l3 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 000000000000ffff

p0_label_191:
!	Mem[0000000030001408] = 33d76dda ffffff84, %l0 = 000000ff, %l1 = ffffffff
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000ffffff84 0000000033d76dda
!	Mem[000000001000143c] = 73000000, %l7 = 0000eb6800007984
	lduh	[%i0+0x03c],%l7		! %l7 = 0000000000007300
!	Mem[0000000010141408] = 00000031, %l5 = 00000000da6dd7ff
	lduwa	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000031
!	Mem[00000000300c1408] = ffff0000, %f15 = 64e76351
	lda	[%i3+%o4]0x81,%f15	! %f15 = ffff0000
!	Mem[0000000030001400] = 3787da6dd51f429a, %l2 = 0000000000000031
	ldxa	[%i0+%g0]0x81,%l2	! %l2 = 3787da6dd51f429a
!	Mem[0000000030081400] = c2ffe00000000000, %f18 = d7ff0000 00000031
	ldda	[%i2+%g0]0x89,%f18	! %f18 = c2ffe000 00000000
!	Mem[0000000030041410] = ff0000ff, %l2 = 3787da6dd51f429a
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001400] = 000000eb, %f7  = 000000ff
	lda	[%i0+%g0]0x88,%f7 	! %f7 = 000000eb
!	Mem[0000000010001404] = d87b3978, %l5 = 0000000000000031
	ldsba	[%i0+0x005]%asi,%l5	! %l5 = 000000000000007b
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = eb000000, %l5 = 000000000000007b
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 00000000eb000000

p0_label_192:
!	%f6  = eb000000, Mem[0000000010001410] = 74437a8d
	sta	%f6 ,[%i0+%o5]0x88	! Mem[0000000010001410] = eb000000
!	%l1 = 0000000033d76dda, Mem[0000000030181408] = 000000ff
	stwa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 33d76dda
!	Mem[0000000030041410] = ff0000ff, %l3 = 000000000000ffff
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff0000ff
!	Mem[0000000010041410] = 00000000, %l7 = 0000000000007300
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%f4  = ffffffff 000000ff, %l3 = 00000000ff0000ff
!	Mem[0000000010101438] = 000000d700003787
	add	%i4,0x038,%g1
	stda	%f4,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010101438] = ff000000ffffffff
!	%l1 = 0000000033d76dda, Mem[0000000030181408] = da6dd733
	stwa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 33d76dda
!	%l5 = 00000000eb000000, Mem[0000000010001400] = 7b000000
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 7b000000
!	%l4 = 000000000000373c, Mem[0000000010141400] = 003b0073982affff
	stxa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000000000373c
!	Mem[0000000010001410] = 000000eb000000ff, %l2 = ffffffffffffffff, %l0 = 00000000ffffff84
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = 000000eb000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ffffffff, %l6 = 00000000ff0000ff
	lduba	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff

p0_label_193:
!	Mem[0000000010101408] = ff00ffff, %l2 = ffffffffffffffff
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = ffffffffff00ffff
!	Mem[0000000030141408] = 318fffff ffffffff, %l0 = 000000ff, %l1 = 33d76dda
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 00000000ffffffff 00000000318fffff
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000010041400] = ff00ff00 ff87da6d 00ff00ff 00000000
!	Mem[0000000010041410] = ff000000 8c707984 00000089 d7000000
!	Mem[0000000010041420] = 00000000 00000064 d7ff0000 00000031
!	Mem[0000000010041430] = ffe76351 ff0000ff ffa73787 373c2a98
	ldda	[%i1]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010041400
!	Mem[0000000010101410] = 000000ff89000000, %f6  = eb000000 000000eb
	ldda	[%i4+0x010]%asi,%f6 	! %f6  = 000000ff 89000000
!	Mem[00000000300c1408] = 0000ffff, %l2 = ffffffffff00ffff
	lduba	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %l1 = 00000000318fffff
	ldswa	[%i2+%g0]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010041408] = 00ff00ff, %l6 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1408] = ff000000, %l7 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010181410] = 8479000068ebffff, %f0  = 16afb44d 000000ff
	ldda	[%i6+%o5]0x88,%f0 	! %f0  = 84790000 68ebffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ffffffff, %l1 = ffffffffff000000
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 00000000ffffffff

p0_label_194:
!	Mem[0000000010141408] = 31000000, %l3 = 00000000ff0000ff
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 0000000031000000
!	Mem[0000000010101408] = ffff00ff, %l2 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	%l1 = 00000000ffffffff, Mem[0000000010141433] = ffff6e4e, %asi = 80
	stba	%l1,[%i5+0x033]%asi	! Mem[0000000010141430] = ffff6eff
!	%l7 = ffffffffff000000, Mem[0000000010181408] = ff8723e9ffffff8f
	stxa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffffff000000
	membar	#Sync			! Added by membar checker (33)
!	%l0 = 00000000ffffffff, Mem[0000000010041410] = ff0000008c707984
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000ffffffff
!	%l6 = 000000ff, %l7 = ff000000, Mem[0000000030101400] = 0000ffff 00000000
	stda	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff ff000000
!	Mem[0000000030001408] = ffffff84, %l1 = 00000000ffffffff
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 00000084000000ff
!	Mem[0000000010101430] = b80000006a13ff34, %l5 = 00000000eb000000, %l3 = 0000000031000000
	add	%i4,0x30,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = b80000006a13ff34
!	%l4 = 0000373c, %l5 = eb000000, Mem[0000000010141410] = 00000000 000000ff
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000373c eb000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffffff, %l7 = ffffffffff000000
	ldsha	[%i6+%o4]0x80,%l7	! %l7 = ffffffffffffffff

p0_label_195:
!	Mem[0000000010101408] = ffff00ff, %l2 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030101400] = ff000000, %l2 = 000000000000ffff
	ldswa	[%i4+%g0]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000030081408] = 000000da, %l4 = 000000000000373c
	lduwa	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000da
!	Mem[0000000010141408] = 00000000ff0000ff, %l0 = 00000000ffffffff
	ldxa	[%i5+%o4]0x88,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000030001400] = 3787da6d, %l2 = ffffffffff000000
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000037
!	Mem[0000000010041408] = ff00ff00, %l5 = 00000000eb000000
	lduwa	[%i1+%o4]0x88,%l5	! %l5 = 00000000ff00ff00
!	Mem[0000000030181408] = da6dd733, %l3 = b80000006a13ff34
	ldsba	[%i6+%o4]0x81,%l3	! %l3 = ffffffffffffffda
!	Mem[0000000010181410] = ffffeb68, %l7 = ffffffffffffffff
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l4 = 00000000000000da, Mem[0000000030141410] = 64e7553ceb0000ff
	stxa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000000000da
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 6dff58bc, %l4 = 00000000000000da
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 000000ff000000ff

p0_label_196:
!	%l1 = 0000000000000084, Mem[00000000300c1400] = 0000003ceb000000
	stxa	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000084
!	%l4 = 000000ff, %l5 = ff00ff00, Mem[0000000010001400] = 0000007b d87b3978
	stda	%l4,[%i0+0x000]%asi	! Mem[0000000010001400] = 000000ff ff00ff00
!	%f10 = 982a3c37 4e6eb823, %f14 = 00003787
	fxtos	%f10,%f14		! %f14 = decfab88
!	%l6 = 00000000000000ff, Mem[0000000010101412] = 000000ff
	sth	%l6,[%i4+0x012]		! Mem[0000000010101410] = 000000ff
!	%f1  = 68ebffff, %f30 = 982a3c37
	fcmps	%fcc3,%f1 ,%f30		! %fcc3 = 2
!	%l4 = 00000000000000ff, Mem[0000000030001408] = ffffffff
	stwa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
!	%l0 = 00000000ff0000ff, Mem[0000000010181408] = ffffffffff000000
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000ff0000ff
!	%l1 = 0000000000000084, Mem[0000000030181410] = 0009ff00
	stwa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000084
!	Mem[0000000010081408] = ff000000, %l4 = 00000000000000ff
	swapa	[%i2+%o4]0x88,%l4	! %l4 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffff00ff, %f27 = 0000ffd7
	ld	[%i4+%o4],%f27	! %f27 = ffff00ff

p0_label_197:
!	Mem[00000000100c1400] = 3c370000, %l4 = 00000000ff000000
	lduwa	[%i3+%g0]0x88,%l4	! %l4 = 000000003c370000
!	Mem[0000000010001410] = 000000eb000000ff, %l6 = 00000000000000ff
	ldx	[%i0+%o5],%l6		! %l6 = 000000eb000000ff
!	Mem[0000000030141408] = ffffffffffff8f31, %f16 = 6dda87ff 00ff00ff
	ldda	[%i5+%o4]0x81,%f16	! %f16 = ffffffff ffff8f31
!	Mem[0000000010001438] = 5163e764 73000000, %l0 = ff0000ff, %l1 = 00000084
	ldda	[%i0+0x038]%asi,%l0	! %l0 = 000000005163e764 0000000073000000
!	Mem[0000000010141438] = 9a421fd5, %l7 = 00000000000000ff
	ldub	[%i5+0x039],%l7		! %l7 = 0000000000000042
!	Mem[0000000030001410] = ffffffff, %l0 = 000000005163e764
	lduba	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001410] = 000000eb 000000ff, %l2 = 00000037, %l3 = ffffffda
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 00000000000000eb 00000000000000ff
!	Mem[00000000300c1400] = 00000084, %l5 = 00000000ff00ff00
	ldswa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000084
!	Mem[0000000021800080] = ffff2e44, %l0 = 00000000000000ff
	ldub	[%o3+0x081],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000eb, Mem[0000000010081400] = 000000ff
	stwa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000eb

p0_label_198:
!	%l2 = 00000000000000eb, Mem[0000000030081400] = c2ffe00000000000
	stxa	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000000000eb
!	Mem[0000000010181408] = 00000000, %l5 = 0000000000000084
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l6 = 000000eb000000ff, Mem[0000000010181410] = ffffeb68
	stba	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffeb68
!	%f24 = 64000000 00000000, Mem[0000000010181428] = 000023b8 b214d0ff
	stda	%f24,[%i6+0x028]%asi	! Mem[0000000010181428] = 64000000 00000000
!	Mem[0000000010141408] = ff0000ff, %l1 = 0000000073000000
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 00000000ff0000ff
!	%f30 = 982a3c37 8737a7ff, Mem[0000000010081400] = eb000000 00000000
	stda	%f30,[%i2+%g0]0x80	! Mem[0000000010081400] = 982a3c37 8737a7ff
!	%f6  = 000000ff, Mem[0000000010001430] = 000000ff
	st	%f6 ,[%i0+0x030]	! Mem[0000000010001430] = 000000ff
!	%l6 = 000000eb000000ff, Mem[00000000211c0000] = 6dff58bc
	stb	%l6,[%o2+%g0]		! Mem[00000000211c0000] = ffff58bc
!	%l1 = 00000000ff0000ff, Mem[0000000010101408] = ffff00ff
	stba	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = ffff00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00ff00ff00000000, %f2  = ffff00ff 33000000
	ldda	[%i2+%o5]0x81,%f2 	! %f2  = 00ff00ff 00000000

p0_label_199:
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 00000000000000ff
	setx	0xa64c0b77933f48c4,%g7,%l0 ! %l0 = a64c0b77933f48c4
!	%l1 = 00000000ff0000ff
	setx	0x7c72d1c0453bdcc3,%g7,%l1 ! %l1 = 7c72d1c0453bdcc3
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a64c0b77933f48c4
	setx	0xff5a2c9029263ba8,%g7,%l0 ! %l0 = ff5a2c9029263ba8
!	%l1 = 7c72d1c0453bdcc3
	setx	0xf0ff04a847a9a938,%g7,%l1 ! %l1 = f0ff04a847a9a938
!	Mem[0000000030041400] = 00003787, %l6 = 000000eb000000ff
	lduha	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = ffa73787373c2a98, %f12 = 00000089 ff000000
	ldda	[%i2+%g0]0x88,%f12	! %f12 = ffa73787 373c2a98
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010001400] = 000000ff ff00ff00 ff87da6d d7000039
!	Mem[0000000010001410] = 000000eb 000000ff 00000000 ebbbffff
!	Mem[0000000010001420] = da6dd7ff 000000d7 23b86e4e 373c2a98
!	Mem[0000000010001430] = 000000ff 89000000 5163e764 73000000
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Mem[0000000010181424] = ff838479, %l3 = 00000000000000ff
	ldsb	[%i6+0x025],%l3		! %l3 = ffffffffffffff83
!	Mem[0000000030041400] = 0000000087370000, %f22 = 000000d7 89000000
	ldda	[%i1+%g0]0x89,%f22	! %f22 = 00000000 87370000
!	Mem[0000000030001410] = ffffffff, %l1 = f0ff04a847a9a938
	lduha	[%i0+%o5]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010001410] = eb000000, %l6 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l6	! %l6 = 00000000eb000000
!	Mem[0000000030141400] = 68eb00ff, %l3 = ffffffffffffff83
	lduba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000068
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000042, Mem[0000000030001400] = 6dda8737
	stha	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 6dda0042

p0_label_200:
!	%l5 = 0000000000000000, Mem[0000000010041400] = 00ff00ff
	stwa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%l4 = 000000003c370000, Mem[0000000010101420] = ffff2a98
	stw	%l4,[%i4+0x020]		! Mem[0000000010101420] = 3c370000
!	%l5 = 0000000000000000, Mem[00000000300c1408] = 0000ffff
	stha	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000021800000] = 0000951b, %l2 = 00000000000000eb
	ldstub	[%o3+%g0],%l2		! %l2 = 00000000000000ff
!	%f26 = 31000000 ffff00ff, Mem[0000000010181408] = 000000ff ff0000ff
	stda	%f26,[%i6+%o4]0x88	! Mem[0000000010181408] = 31000000 ffff00ff
!	%l1 = 000000000000ffff, %l2 = 0000000000000000, %l7 = 0000000000000042
	add	%l1,%l2,%l7		! %l7 = 000000000000ffff
!	%l5 = 0000000000000000, Mem[0000000030041410] = 0000ffff
	stba	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000ffff
	membar	#Sync			! Added by membar checker (35)
!	%f28 = ff0000ff 5163e7ff, Mem[0000000010001410] = 000000eb 000000ff
	stda	%f28,[%i0+%o5]0x80	! Mem[0000000010001410] = ff0000ff 5163e7ff
!	Mem[0000000030081400] = eb000000, %l3 = 0000000000000068
	ldstuba	[%i2+%g0]0x81,%l3	! %l3 = 000000eb000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff000000, %f31 = 8737a7ff
	lda	[%i0+%g0]0x88,%f31	! %f31 = ff000000

p0_label_201:
!	Mem[0000000030181400] = 16afb44d 000000ff da6dd733 33000000
!	Mem[0000000030181410] = 00000084 ff0000ff ffffbbeb 00000000
!	Mem[0000000030181420] = d7000000 ffd76dda 982a3c37 4e6eb823
!	Mem[0000000030181430] = 00000089 ff000000 00003787 64e76351
	ldda	[%i6]ASI_BLK_S,%f16	! Block Load from 0000000030181400
!	Mem[0000000010141400] = 000000000000373c, %l2 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = 000000000000373c
!	Mem[0000000010101400] = ffff8f31, %l3 = 00000000000000eb
	lduba	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041410] = 0000ffff 89000000, %l2 = 0000373c, %l3 = 000000ff
	ldda	[%i1+%o5]0x81,%l2	! %l2 = 000000000000ffff 0000000089000000
!	Mem[0000000010081438] = 33b3288f, %l4 = 000000003c370000
	ldsba	[%i2+0x038]%asi,%l4	! %l4 = 0000000000000033
!	Mem[0000000010181430] = 00000089, %l5 = 0000000000000000
	ldsha	[%i6+0x030]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = 000000ff, %l3 = 0000000089000000
	ldswa	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %f11 = 373c2a98
	ld	[%i1+%g0],%f11	! %f11 = 00000000
!	Mem[000000001018142c] = 00000000, %l5 = 0000000000000000
	lduh	[%i6+0x02e],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001008143c] = 0000ffff, %l5 = 00000000, %l1 = 0000ffff
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 000000000000ffff

p0_label_202:
!	Mem[0000000030081410] = ff00ff00, %l6 = 00000000eb000000
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%f4  = 000000eb, Mem[0000000010181408] = ffff00ff
	sta	%f4 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000eb
!	%l5 = 0000000000000000, Mem[00000000300c1410] = ff790000
	stha	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Mem[0000000030181408] = da6dd733, %l5 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l5	! %l5 = 00000000da6dd733
!	Mem[0000000030181410] = 00000084, %l5 = 00000000da6dd733
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000084
!	%l5 = 0000000000000084, Mem[0000000021800180] = ff00809b, %asi = 80
	stha	%l5,[%o3+0x180]%asi	! Mem[0000000021800180] = 0084809b
!	Mem[0000000010101432] = b8000000, %l0 = ff5a2c9029263ba8
	ldstuba	[%i4+0x032]%asi,%l0	! %l0 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030141400] = ff00eb68
	stwa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l3 = 00000000000000ff, Mem[00000000100c1400] = ffd76dda3c370000
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081428] = d7ff0000, %l0 = 0000000000000000
	lduha	[%i2+0x02a]%asi,%l0	! %l0 = 0000000000000000

p0_label_203:
	membar	#Sync			! Added by membar checker (36)
!	Mem[00000000300c1400] = 84000000 00000000 00000000 00000000
!	Mem[00000000300c1410] = 00000000 00000000 f4df2837 efe09bab
!	Mem[00000000300c1420] = 68ebf655 d87b3978 ffffffff 89000000
!	Mem[00000000300c1430] = 3c76f8fb 152a7b16 4613c66d 1e4f7940
	ldda	[%i3]ASI_BLK_AIUSL,%f0	! Block Load from 00000000300c1400
!	Mem[00000000211c0000] = ffff58bc, %l4 = 0000000000000033
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[00000000211c0000] = ffff58bc, %l3 = 00000000000000ff
	ldub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030041400] = 0000378700000000, %l2 = 000000000000ffff
	ldxa	[%i1+%g0]0x81,%l2	! %l2 = 0000378700000000
!	Mem[0000000010141408] = 00000073, %l0 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141424] = acef4ef8, %l2 = 0000378700000000
	lduw	[%i5+0x024],%l2		! %l2 = 00000000acef4ef8
!	Mem[0000000021800140] = 0000f4c2, %l6 = 0000000000000000
	ldsh	[%o3+0x140],%l6		! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 00000084, %l7 = 000000000000ffff
	ldsba	[%i3+%g0]0x89,%l7	! %l7 = ffffffffffffff84
!	Mem[00000000100c1410] = ff0000ff, %l3 = 00000000000000ff
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000acef4ef8, Mem[0000000030141408] = ffffffffffff8f31
	stxa	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000acef4ef8

p0_label_204:
!	Mem[0000000030041408] = 000000ff, %l0 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%l7 = ffffffffffffff84, Mem[00000000201c0000] = 6d310847
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = ff840847
!	Mem[0000000010141410] = 0000373c, %l5 = 0000000000000084
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%f22 = ffffbbeb 00000000, %l5 = 0000000000000000
!	Mem[0000000030081420] = ffffd7ff157839c2
	add	%i2,0x020,%g1
	stda	%f22,[%g1+%l5]ASI_PST16_S ! Mem[0000000030081420] = ffffd7ff157839c2
!	Mem[0000000010101410] = ff000000, %l2 = 00000000acef4ef8
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f21 = ff0000ff, Mem[0000000030001408] = 000000ff
	sta	%f21,[%i0+%o4]0x89	! Mem[0000000030001408] = ff0000ff
!	Mem[0000000010041430] = ffe76351, %l1 = 0000ffff, %l5 = 00000000
	add	%i1,0x30,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 00000000ffe76351
!	%l4 = ffffffffffffffff, Mem[0000000010041408] = 00000000ff00ff00
	stxa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffffffffffff
!	%l2 = 0000000000000000, Mem[0000000030001410] = ffffffff
	stba	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffff00
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = c2ffe000 000000ff, %l0 = 000000ff, %l1 = 0000ffff
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ff 00000000c2ffe000

p0_label_205:
!	Mem[0000000010141410] = ff00373c, %l4 = ffffffffffffffff
	ldsha	[%i5+%o5]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030081410] = ff00ffff, %l6 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l6	! %l6 = ffffffffff00ffff
!	Mem[0000000030041410] = 0000ffff89000000, %l0 = 00000000000000ff
	ldxa	[%i1+%o5]0x81,%l0	! %l0 = 0000ffff89000000
!	Mem[00000000201c0000] = ff840847, %l7 = ffffffffffffff84
	ldsba	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1408] = ff000000, %l5 = 00000000ffe76351
	lduwa	[%i3+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010081400] = ffa73787 373c2a98, %l2 = 00000000, %l3 = ff0000ff
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000373c2a98 00000000ffa73787
!	Mem[0000000010001430] = 000000ff89000000, %f28 = 00000089 ff000000
	ldda	[%i0+0x030]%asi,%f28	! %f28 = 000000ff 89000000
!	Mem[0000000030141410] = da000000, %l4 = ffffffffffffff00
	lduwa	[%i5+%o5]0x81,%l4	! %l4 = 00000000da000000
!	Mem[0000000010081400] = 982a3c37, %l4 = 00000000da000000
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 000000000000982a
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00000000, %l4 = 000000000000982a
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_206:
!	%l4 = 00000000, %l5 = ff000000, Mem[0000000010141400] = 00000000 3c370000
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 ff000000
!	Mem[0000000010081410] = ff000000, %l6 = ffffffffff00ffff
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000300c1410] = 00000000, %l2 = 00000000373c2a98
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	%f0  = 00000000, Mem[0000000030141400] = 00000000
	sta	%f0 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l5 = 00000000ff000000, Mem[0000000010181400] = da6dd7ff000000eb
	stxa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000ff000000
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 0000ffff89000000
	setx	0x9f170a77f1ba1848,%g7,%l0 ! %l0 = 9f170a77f1ba1848
!	%l1 = 00000000c2ffe000
	setx	0x5da16ae00ece816e,%g7,%l1 ! %l1 = 5da16ae00ece816e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9f170a77f1ba1848
	setx	0x545ee64fd5b36aa4,%g7,%l0 ! %l0 = 545ee64fd5b36aa4
!	%l1 = 5da16ae00ece816e
	setx	0x48d2c97865643359,%g7,%l1 ! %l1 = 48d2c97865643359
!	%l0 = 545ee64fd5b36aa4, Mem[0000000010001406] = ff00ff00
	sth	%l0,[%i0+0x006]		! Mem[0000000010001404] = ff006aa4
	membar	#Sync			! Added by membar checker (37)
!	%f11 = ffffffff, Mem[00000000300c1400] = 00000084
	sta	%f11,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffff
!	%l0 = d5b36aa4, %l1 = 65643359, Mem[0000000010181410] = ffffeb68 00007984
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = d5b36aa4 65643359
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 16afb44d, %l1 = 48d2c97865643359
	lduha	[%i6+%g0]0x81,%l1	! %l1 = 00000000000016af

p0_label_207:
!	Mem[0000000030101408] = 00ff0000, %l6 = 00000000000000ff
	lduwa	[%i4+%o4]0x89,%l6	! %l6 = 0000000000ff0000
!	Mem[0000000010101408] = ffffffffff00ffff, %f30 = 00003787 64e76351
	ldda	[%i4+%o4]0x88,%f30	! %f30 = ffffffff ff00ffff
!	Mem[0000000030141410] = da000000, %l3 = 00000000ffa73787
	lduha	[%i5+%o5]0x81,%l3	! %l3 = 000000000000da00
!	Mem[0000000010181400] = 000000ff00000000, %f16 = 16afb44d 000000ff
	ldda	[%i6+%g0]0x88,%f16	! %f16 = 000000ff 00000000
!	Mem[0000000010041400] = 00000000, %l1 = 00000000000016af
	ldsba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = ffffff00, %l3 = 000000000000da00
	ldsha	[%i0+%o5]0x89,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030141408] = 00000000, %l5 = 00000000ff000000
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = ff0000ff, %l2 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1408] = ff000000, %l1 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030041408] = 00000000
	stwa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000

p0_label_208:
!	Mem[0000000010001404] = ff006aa4, %l1 = 0000ff00, %l7 = ffffffff
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l1,%l7	! %l7 = 00000000ff006aa4
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010141408] = 00000073 00000000
	stda	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 00000000
!	%l1 = 000000000000ff00, Mem[0000000010081409] = ff000000, %asi = 80
	stba	%l1,[%i2+0x009]%asi	! Mem[0000000010081408] = ff000000
!	%l4 = 0000000000000000, Mem[00000000300c1408] = 2a980000
	stha	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%l2 = ffffffffffffffff, Mem[0000000030001410] = ffffff00
	stha	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffffff
!	%l7 = 00000000ff006aa4, Mem[0000000010101408] = ffff00ffffffffff
	stxa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000ff006aa4
!	%l4 = 0000000000000000, Mem[0000000010041426] = 00000064, %asi = 80
	stba	%l4,[%i1+0x026]%asi	! Mem[0000000010041424] = 00000064
!	Mem[0000000010101400] = ffff8f31, %l1 = 000000000000ff00
	ldstuba	[%i4+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	%l6 = 0000000000ff0000, Mem[0000000010041400] = 00000000
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff0000ff, %l4 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l4	! %l4 = 00000000ff0000ff

p0_label_209:
!	Mem[0000000010081400] = ffa73787373c2a98, %f10 = 00000089 ffffffff
	ldda	[%i2+%g0]0x88,%f10	! %f10 = ffa73787 373c2a98
!	Mem[0000000010081410] = ffffffff000000ff, %l6 = 0000000000ff0000
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = ffffffff000000ff
!	Mem[0000000010101420] = 3c370000, %l1 = 00000000000000ff
	ldub	[%i4+0x021],%l1		! %l1 = 0000000000000037
!	Mem[0000000010001410] = ff0000ff, %l5 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000030101400] = ff000000000000ff, %l1 = 0000000000000037
	ldxa	[%i4+%g0]0x89,%l1	! %l1 = ff000000000000ff
!	Mem[0000000010001410] = ff0000ff 5163e7ff, %l6 = 000000ff, %l7 = ff006aa4
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 00000000ff0000ff 000000005163e7ff
!	Mem[0000000010101408] = 00000000, %f26 = 982a3c37
	lda	[%i4+%o4]0x80,%f26	! %f26 = 00000000
!	Mem[00000000300c1400] = ffffffff, %l1 = ff000000000000ff
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101408] = 00000000, %l1 = ffffffffffffffff
	lduha	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ff0000ff, Mem[0000000030101400] = ff000000
	stha	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 00ff0000

p0_label_210:
!	%l3 = ffffffffffffff00, Mem[0000000010101400] = ffff8f31
	stha	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = ff008f31
!	Mem[00000000100c1400] = ff000000, %l4 = 00000000ff0000ff
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 00000000ff000000
!	%l3 = ffffffffffffff00, Mem[0000000021800001] = ff00951b, %asi = 80
	stba	%l3,[%o3+0x001]%asi	! Mem[0000000021800000] = ff00951b
!	%f16 = 000000ff 00000000 da6dd733 33000000
!	%f20 = 00000084 ff0000ff ffffbbeb 00000000
!	%f24 = d7000000 ffd76dda 00000000 4e6eb823
!	%f28 = 000000ff 89000000 ffffffff ff00ffff
	stda	%f16,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	Mem[0000000010141400] = 00000000, %l7 = 000000005163e7ff
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[00000000300c1410] = 00000000000000ff
	stxa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	%l0 = 545ee64fd5b36aa4, Mem[0000000030081408] = 000000da
	stba	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000a4
!	Mem[0000000010141434] = 923c2a98, %l4 = 00000000ff000000, %asi = 80
	swapa	[%i5+0x034]%asi,%l4	! %l4 = 00000000923c2a98
!	%l7 = 0000000000000000, Mem[00000000211c0000] = ffff58bc, %asi = 80
	stba	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff58bc
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000030101408] = 0000003333d76dda, %f6  = ab9be0ef 3728dff4
	ldda	[%i4+%o4]0x81,%f6 	! %f6  = 00000033 33d76dda

p0_label_211:
!	Mem[0000000010101408] = 00000000, %l2 = ffffffffffffffff
	ldsha	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 000000da, %l7 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l7	! %l7 = ffffffffffffffda
!	Mem[0000000010101410] = 00000089ff0000ff, %l6 = 00000000ff0000ff
	ldxa	[%i4+%o5]0x88,%l6	! %l6 = 00000089ff0000ff
!	Mem[0000000030041400] = 87370000, %l3 = ffffffffffffff00
	ldsha	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = ff000000, %l0 = 545ee64fd5b36aa4
	ldsba	[%i2+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141418] = 00000000, %l4 = 00000000923c2a98
	ldsw	[%i5+0x018],%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 00000000ffffffff, %l5 = 00000000ff0000ff
	ldxa	[%i3+%g0]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[00000000300c1400] = ffffffff00000000, %l5 = 00000000ffffffff
	ldxa	[%i3+%g0]0x81,%l5	! %l5 = ffffffff00000000
!	Mem[0000000030041410] = ffff0000, %l5 = ffffffff00000000
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = ffffffffffff0000
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 00000084, %l2 = 0000000000000000
!	Mem[0000000030141418] = 00000000000000bb
	add	%i5,0x018,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030141418] = 00000000000000bb

p0_label_212:
!	Mem[0000000010101400] = ff008f31, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 00000000ff008f31
!	%l1 = 0000000000000000, Mem[0000000030101410] = ff0000ff
	stha	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000
!	%l5 = ffffffffffff0000, Mem[0000000010041400] = 00000000
	stba	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%f24 = d7000000 ffd76dda, Mem[0000000010081408] = 000000ff fd0a0000
	stda	%f24,[%i2+%o4]0x88	! Mem[0000000010081408] = d7000000 ffd76dda
!	%l7 = ffffffffffffffda, Mem[0000000010081400] = 373c2a98
	stwa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffda
!	%f24 = d7000000 ffd76dda, %l7 = ffffffffffffffda
!	Mem[0000000010001428] = 23b86e4e373c2a98
	add	%i0,0x028,%g1
	stda	%f24,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010001428] = 236d6eff003c00d7
!	Mem[00000000300c1408] = 00000000, %l0 = ffffffffffffffff
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%f8  = 78397bd8 55f6eb68, %l5 = ffffffffffff0000
!	Mem[0000000010181430] = 00000089000000eb
	add	%i6,0x030,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_P ! Mem[0000000010181430] = 00000089000000eb
!	%f18 = da6dd733 33000000, %l6 = 00000089ff0000ff
!	Mem[0000000030141410] = da00000000000000
	add	%i5,0x010,%g1
	stda	%f18,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030141410] = 0000003333d76dda
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ffffffda, %l6 = 00000089ff0000ff
	lduwa	[%i2+%g0]0x88,%l6	! %l6 = 00000000ffffffda

p0_label_213:
!	Mem[0000000030081400] = ff000000 00000000 a4000000 34000000
!	Mem[0000000030081410] = ffff00ff 00000000 1a7531a7 8788c6cd
!	Mem[0000000030081420] = ffffd7ff 157839c2 74592f4e 299bb4bb
!	Mem[0000000030081430] = 0d2123e9 34e7136a 109da19c 16afb44d
	ldda	[%i2]ASI_BLK_S,%f0	! Block Load from 0000000030081400
!	Mem[0000000010081420] = 390000d7, %l6 = 00000000ffffffda
	ldub	[%i2+0x021],%l6		! %l6 = 0000000000000000
!	Mem[0000000030081408] = a4000000, %l2 = 0000000000000000
	lduba	[%i2+%o4]0x81,%l2	! %l2 = 00000000000000a4
!	Mem[000000001008140c] = 000000d7, %l4 = 00000000ff008f31
	ldsba	[%i2+0x00f]%asi,%l4	! %l4 = ffffffffffffffd7
!	Mem[0000000010101410] = ff0000ff, %l0 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000030041408] = 00000000, %l0 = 00000000ff0000ff
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = a46ab3d5, %l0 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l0	! %l0 = 00000000000000d5
!	Mem[0000000030041408] = 00000000ff000000, %l7 = ffffffffffffffda
	ldxa	[%i1+%o4]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030181410] = da6dd733 ff0000ff, %l4 = ffffffd7, %l5 = ffff0000
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 00000000da6dd733 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000a4, Mem[0000000010041408] = ffffffff
	stba	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = a4ffffff

p0_label_214:
!	%l2 = 000000a4, %l3 = 00000000, Mem[0000000010001410] = ff0000ff 5163e7ff
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000a4 00000000
!	%l7 = 00000000ff000000, Mem[00000000100c1408] = c2ffe000000000ff
	stxa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000ff000000
!	Mem[0000000030141400] = 00000000, %l6 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%l7 = 00000000ff000000, Mem[0000000010181410] = d5b36aa465643359
	stxa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000ff000000
!	%l4 = da6dd733, %l5 = ff0000ff, Mem[0000000030141400] = 00000000 00000000
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = da6dd733 ff0000ff
!	%l3 = 0000000000000000, Mem[0000000030001410] = ffffffffffffffff
	stxa	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000000000000
!	Mem[00000000300c1400] = ffffffff, %l2 = 00000000000000a4
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%l5 = 00000000ff0000ff, Mem[0000000030001410] = 00000000
	stba	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000
!	Mem[000000001014141c] = 00003c3b, %l1 = 0000000000000000
	lduba	[%i5+0x01e]%asi,%l1	! %l1 = 000000000000003c
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = 6d45f510, %l7 = 00000000ff000000
	ldsb	[%o3+0x0c0],%l7		! %l7 = 000000000000006d

p0_label_215:
!	Mem[0000000030001408] = ff0000ff, %f22 = ffffbbeb
	lda	[%i0+%o4]0x89,%f22	! %f22 = ff0000ff
!	Mem[0000000010141410] = ff00373c, %l4 = 00000000da6dd733
	lduba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 000000ff, %l1 = 000000000000003c
	lduba	[%i5+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = 16afb44d000000ff, %f18 = da6dd733 33000000
	ldda	[%i6+%g0]0x81,%f18	! %f18 = 16afb44d 000000ff
!	Mem[0000000010041420] = 00000000 00000064, %l4 = 000000ff, %l5 = ff0000ff
	ldd	[%i1+0x020],%l4		! %l4 = 0000000000000000 0000000000000064
!	Mem[00000000300c1408] = ffffffff, %f20 = 00000084
	lda	[%i3+%o4]0x89,%f20	! %f20 = ffffffff
!	Mem[00000000300c1408] = ffffffff, %l1 = 00000000000000ff
	lduba	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l7 = 000000000000006d
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = ffff0000, %l4 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000d5, Mem[0000000010081408] = d7000000ffd76dda
	stxa	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000d5

p0_label_216:
!	%l4 = 00000000, %l5 = 00000064, Mem[00000000100c1430] = ffd76dda 16afb44d
	std	%l4,[%i3+0x030]		! Mem[00000000100c1430] = 00000000 00000064
!	Mem[0000000010141434] = ff000000, %l3 = 0000000000000000
	swap	[%i5+0x034],%l3		! %l3 = 00000000ff000000
!	%l0 = 00000000000000d5, Mem[0000000010001408] = 6dda87ff
	stba	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 6dda87d5
!	Mem[0000000030081408] = 000000a4, %l2 = 00000000000000ff
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000a4
!	%f17 = 00000000, Mem[0000000030141408] = 00000000
	sta	%f17,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	%l4 = 0000000000000000, Mem[00000000300c1400] = ffffffff
	stha	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000ffff
!	%f26 = 00000000 4e6eb823, Mem[0000000010101400] = 00000000 7a8d0000
	stda	%f26,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 4e6eb823
!	%f6  = 1a7531a7, Mem[0000000010041434] = ff0000ff
	sta	%f6 ,[%i1+0x034]%asi	! Mem[0000000010041434] = 1a7531a7
!	Mem[00000000100c1418] = ffffffff, %l2 = 00000000000000a4
	ldstub	[%i3+0x018],%l2		! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 6dda0042, %l4 = 0000000000000000
	ldsba	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000042

p0_label_217:
!	Mem[0000000010141410] = 3c3700ff, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[000000001018143c] = ff0000ff, %l1 = 00000000000000ff
	lduh	[%i6+0x03c],%l1		! %l1 = 000000000000ff00
!	Mem[0000000030101410] = ff000000, %l0 = 00000000000000d5
	lduwa	[%i4+%o5]0x89,%l0	! %l0 = 00000000ff000000
!	%l4 = 0000000000000042, Mem[0000000030041400] = 0000378700000000
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000042
!	Mem[0000000010001410] = 000000a400000000, %f4  = ffff00ff 00000000
	ldda	[%i0+%o5]0x80,%f4 	! %f4  = 000000a4 00000000
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000030141400] = 33d76dda ff0000ff 00000000 acef4ef8
!	Mem[0000000030141410] = 00000033 33d76dda 00000000 000000bb
!	Mem[0000000030141420] = 55000000 b7e0ede4 068718d8 74437a03
!	Mem[0000000030141430] = 6a13e734 e923210d b7d6f9fb 9ca19d10
	ldda	[%i5]ASI_BLK_S,%f0	! Block Load from 0000000030141400
!	Mem[0000000030081410] = ffff00ff, %l1 = 000000000000ff00
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141410] = da6dd73333000000, %l0 = 00000000ff000000
	ldxa	[%i5+%o5]0x89,%l0	! %l0 = da6dd73333000000
!	Mem[0000000030181400] = 16afb44d, %l7 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l7	! %l7 = 00000000000016af
!	Starting 10 instruction Store Burst
!	%l0 = 33000000, %l1 = 000000ff, Mem[0000000010041408] = a4ffffff ffffffff
	std	%l0,[%i1+%o4]		! Mem[0000000010041408] = 33000000 000000ff

p0_label_218:
!	Mem[0000000010041419] = 00000089, %l6 = 00000000000000ff
	ldstub	[%i1+0x019],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010001410] = 000000a4, %l7 = 00000000000016af
	swapa	[%i0+%o5]0x80,%l7	! %l7 = 00000000000000a4
!	Mem[00000000300c1408] = ffffffff, %l7 = 00000000000000a4
	swapa	[%i3+%o4]0x89,%l7	! %l7 = 00000000ffffffff
!	%f24 = d7000000 ffd76dda, Mem[00000000100c1400] = ff0000ff 00000000
	stda	%f24,[%i3+%g0]0x88	! Mem[00000000100c1400] = d7000000 ffd76dda
!	Mem[000000001008141a] = ff00ff00, %l2 = 00000000000000ff
	ldstub	[%i2+0x01a],%l2		! %l2 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (40)
!	%l2 = 00000000000000ff, Mem[0000000030141400] = 33d76dda
	stha	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00ff6dda
!	%f14 = b7d6f9fb 9ca19d10, Mem[00000000300c1408] = 000000a4 00000000
	stda	%f14,[%i3+%o4]0x89	! Mem[00000000300c1408] = b7d6f9fb 9ca19d10
!	%l2 = 00000000000000ff, Mem[0000000030001400] = 4200da6d
	stba	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ff00da6d
!	Mem[000000001004143d] = 373c2a98, %l1 = 00000000000000ff
	ldstuba	[%i1+0x03d]%asi,%l1	! %l1 = 0000003c000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff0000ff, %l5 = 0000000000000064
	ldsha	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff

p0_label_219:
!	Mem[0000000010141400] = 000000ff, %l2 = 00000000000000ff
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081410] = ff000000, %f16 = 000000ff
	lda	[%i2+%o5]0x80,%f16	! %f16 = ff000000
!	Mem[0000000030041410] = 0000ffff, %l2 = 00000000000000ff
	lduha	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 000000ff, %l0 = da6dd73333000000
	lduwa	[%i2+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041410] = 0000ffff, %l5 = 00000000000000ff
	ldsha	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l0 = 00000000000000ff
	lduba	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l1 = 000000000000003c
	ldswa	[%i0+%g0]0x88,%l1	! %l1 = ffffffffff000000
!	Mem[00000000300c1410] = 0000000000000000, %f28 = 000000ff 89000000
	ldda	[%i3+%o5]0x89,%f28	! %f28 = 00000000 00000000
!	Mem[0000000010081410] = ff000000, %l7 = 00000000ffffffff
	ldsha	[%i2+%o5]0x80,%l7	! %l7 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffff00, Mem[0000000030041410] = 0000ffff89000000
	stxa	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffffffffff00

p0_label_220:
!	%f5  = 33d76dda, %f27 = 4e6eb823
	fitos	%f5 ,%f27		! %f27 = 4e4f5db7
!	%l5 = 0000000000000000, Mem[0000000010141414] = eb000000
	stw	%l5,[%i5+0x014]		! Mem[0000000010141414] = 00000000
!	%f16 = ff000000 00000000, Mem[0000000010101400] = 4e6eb823 00000000
	stda	%f16,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000 00000000
!	%f22 = ff0000ff 00000000, Mem[0000000010181400] = 00000000 ff000000
	stda	%f22,[%i6+%g0]0x80	! Mem[0000000010181400] = ff0000ff 00000000
!	%l0 = 0000000000000000, Mem[0000000010181408] = 000000eb
	stwa	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%f19 = 000000ff, Mem[0000000010101424] = 00ffffff
	sta	%f19,[%i4+0x024]%asi	! Mem[0000000010101424] = 000000ff
!	%l0 = 0000000000000000, Mem[0000000030001410] = ff000000
	stwa	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%l0 = 00000000, %l1 = ff000000, Mem[0000000010041410] = 00000000 ffffffff
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 ff000000
!	%l6 = 0000000000000000, Mem[0000000010081400] = daffffff
	stba	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00ffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff840847, %l4 = 0000000000000042
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000ff84

p0_label_221:
!	Mem[0000000030081400] = 000000ff, %l3 = 00000000ff000000
	lduba	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1414] = 6d000000, %l6 = 0000000000000000
	ldsb	[%i3+0x015],%l6		! %l6 = 0000000000000000
!	Mem[0000000030081400] = ff000000, %f18 = 16afb44d
	lda	[%i2+%g0]0x81,%f18	! %f18 = ff000000
!	Mem[0000000030001400] = 9a421fd5 6dda00ff, %l4 = 0000ff84, %l5 = 00000000
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 000000006dda00ff 000000009a421fd5
!	Mem[0000000030001400] = 6dda00ff, %l6 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081408] = d5000000, %l0 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l0	! %l0 = ffffffffffffffd5
!	Mem[0000000030101410] = 000000ff, %f9  = b7e0ede4
	lda	[%i4+%o5]0x81,%f9 	! %f9 = 000000ff
!	Mem[0000000030101410] = 00000084 ff000000, %l6 = 000000ff, %l7 = ffffff00
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 00000000ff000000 0000000000000084
!	Mem[0000000030001410] = 0000000000000000, %l1 = ffffffffff000000
	ldxa	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = ff000000, %l7 = 00000084, Mem[0000000010101408] = 00000000 a46a00ff
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000 00000084

p0_label_222:
!	%l0 = ffffffd5, %l1 = 00000000, Mem[00000000300c1400] = ffff0000 00000000
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffd5 00000000
!	Mem[000000001004140c] = 000000ff, %l1 = 0000000000000000
	ldstub	[%i1+0x00c],%l1		! %l1 = 00000000000000ff
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010081400] = 00ffffff 8737a7ff
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 000000ff
!	%l6 = 00000000ff000000, Mem[0000000010001428] = 236d6eff003c00d7, %asi = 80
	stxa	%l6,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000ff000000
!	%l0 = ffffffffffffffd5, Mem[0000000030101410] = ff000000
	stba	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = ff0000d5
!	%f28 = 00000000, Mem[0000000030001400] = 6dda00ff
	sta	%f28,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[0000000021800100] = 00ff8452, %l1 = 0000000000000000
	ldstuba	[%o3+0x100]%asi,%l1	! %l1 = 00000000000000ff
!	%l7 = 0000000000000084, Mem[0000000010101408] = 000000ff84000000
	stxa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000084
!	%l1 = 0000000000000000, Mem[0000000010141433] = ffff6eff
	stb	%l1,[%i5+0x033]		! Mem[0000000010141430] = ffff6e00
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000ff, %l4 = 000000006dda00ff
	ldsba	[%i5+%g0]0x88,%l4	! %l4 = ffffffffffffffff

p0_label_223:
!	Mem[00000000100c1434] = 00000064, %l2 = 0000000000000000
	ldsh	[%i3+0x034],%l2		! %l2 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %f15 = 9ca19d10
	lda	[%i6+%o4]0x80,%f15	! %f15 = 00000000
!	Mem[00000000300c1408] = b7d6f9fb9ca19d10, %f30 = ffffffff ff00ffff
	ldda	[%i3+%o4]0x89,%f30	! %f30 = b7d6f9fb 9ca19d10
!	Mem[0000000010001408] = 390000d76dda87d5, %f10 = 068718d8 74437a03
	ldda	[%i0+%o4]0x88,%f10	! %f10 = 390000d7 6dda87d5
!	Mem[0000000030101400] = 00000000, %f29 = 00000000
	lda	[%i4+%g0]0x89,%f29	! %f29 = 00000000
!	Mem[0000000030001410] = 00000000, %l3 = 00000000000000ff
	lduha	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l4 = ffffffffffffffff
	lduwa	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181404] = 00000000, %l5 = 000000009a421fd5
	ldsh	[%i6+0x004],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ff840847, %l4 = 0000000000000000
	ldstub	[%o0+%g0],%l4		! %l4 = 000000ff000000ff

p0_label_224:
!	%f10 = 390000d7 6dda87d5, %l0 = ffffffffffffffd5
!	Mem[00000000300c1438] = 4613c66d1e4f7940
	add	%i3,0x038,%g1
	stda	%f10,[%g1+%l0]ASI_PST16_SL ! Mem[00000000300c1438] = d587c66dd7007940
!	%l5 = 0000000000000000, Mem[0000000010141410] = ff00373c00000000, %asi = 80
	stxa	%l5,[%i5+0x010]%asi	! Mem[0000000010141410] = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stha	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000030001410] = 00000000, %l7 = 0000000000000084
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800040] = ffffc626, %l0 = ffffffffffffffd5
	ldstub	[%o3+0x040],%l0		! %l0 = 000000ff000000ff
!	%f14 = b7d6f9fb, Mem[0000000030081410] = ffff00ff
	sta	%f14,[%i2+%o5]0x81	! Mem[0000000030081410] = b7d6f9fb
!	%f22 = ff0000ff 00000000, %l5 = 0000000000000000
!	Mem[00000000300c1420] = 68ebf655d87b3978
	add	%i3,0x020,%g1
	stda	%f22,[%g1+%l5]ASI_PST8_S ! Mem[00000000300c1420] = 68ebf655d87b3978
!	Mem[0000000030181410] = da6dd733, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 00000000da6dd733
!	Mem[0000000010041410] = 00000000, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %f26 = 00000000
	lda	[%i1+%g0]0x89,%f26	! %f26 = 00000000

p0_label_225:
!	Mem[00000000100c1400] = ffd76dda, %l7 = 0000000000000000
	lduha	[%i3+%g0]0x88,%l7	! %l7 = 0000000000006dda
!	Mem[0000000030041400] = 00000000, %l0 = 00000000000000ff
	ldsha	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = 0000000000000000, %l0 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041404] = ff87da6d, %l7 = 0000000000006dda
	ldsh	[%i1+0x006],%l7		! %l7 = ffffffffffffda6d
!	Mem[0000000010181410] = 00000000, %l0 = 0000000000000000
	lduh	[%i6+%o5],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181418] = ffb86b5eda6dd733, %f4  = 00000033 33d76dda
	ldda	[%i6+0x018]%asi,%f4 	! %f4  = ffb86b5e da6dd733
!	Mem[00000000211c0000] = 00ff58bc, %l4 = 00000000000000ff
	ldsh	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010181400] = ff0000ff, %l4 = 00000000000000ff
	lduba	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1418] = ffffffff51f2aaac, %l4 = 00000000000000ff
	ldx	[%i3+0x018],%l4		! %l4 = ffffffff51f2aaac
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010101410] = ff0000ff89000000
	stxa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000

p0_label_226:
!	%l6 = ff000000, %l7 = ffffda6d, Mem[0000000010181410] = 00000000 ff000000
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000 ffffda6d
!	%f4  = ffb86b5e, Mem[0000000010001408] = d587da6d
	sta	%f4 ,[%i0+%o4]0x80	! Mem[0000000010001408] = ffb86b5e
!	Mem[0000000030081408] = ff000000, %l2 = 00000000da6dd733
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	%f30 = b7d6f9fb 9ca19d10, Mem[0000000030041400] = 00000000 00000042
	stda	%f30,[%i1+%g0]0x81	! Mem[0000000030041400] = b7d6f9fb 9ca19d10
!	%l4 = 51f2aaac, %l5 = 00000000, Mem[00000000100c1408] = ff000000 00000000
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 51f2aaac 00000000
!	%f10 = 390000d7 6dda87d5, %l2 = 00000000000000ff
!	Mem[0000000010101410] = 0000000000000000
	add	%i4,0x010,%g1
	stda	%f10,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010101410] = d587da6dd7000039
!	%l0 = 0000000000000000, Mem[0000000010141414] = 00000000, %asi = 80
	stha	%l0,[%i5+0x014]%asi	! Mem[0000000010141414] = 00000000
!	%l7 = ffffffffffffda6d, Mem[0000000010101410] = 6dda87d5
	stwa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffda6d
!	%l5 = 0000000000000000, Mem[00000000100c1400] = da6dd7ff000000d7
	stxa	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 000000ff, %l1 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l1	! %l1 = 00000000000000ff

p0_label_227:
!	Mem[0000000010101410] = ffffda6d, %l1 = 00000000000000ff
	ldswa	[%i4+%o5]0x88,%l1	! %l1 = ffffffffffffda6d
!	Mem[0000000010001410] = af160000, %f29 = 00000000
	lda	[%i0+%o5]0x88,%f29	! %f29 = af160000
!	Mem[0000000010141400] = 00000000, %l1 = ffffffffffffda6d
	ldsha	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l3 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 00000000 ff000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000 00000000ff000000
!	Mem[0000000010141428] = 000000ff, %l7 = ffffffffffffda6d
	ldsb	[%i5+0x02b],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000020800000] = d7ff261d, %l4 = ffffffff51f2aaac
	ldsha	[%o1+0x000]%asi,%l4	! %l4 = ffffffffffffd7ff
!	Mem[0000000010041434] = 1a7531a7, %l5 = 0000000000000000
	lduwa	[%i1+0x034]%asi,%l5	! %l5 = 000000001a7531a7
!	Mem[0000000010081410] = 000000ff, %l2 = 00000000000000ff
	ldsba	[%i2+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000030001408] = ff0000ff da6dd733
	stda	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff 00000000

p0_label_228:
!	%f30 = b7d6f9fb 9ca19d10, Mem[0000000030001408] = ffffffff 00000000
	stda	%f30,[%i0+%o4]0x81	! Mem[0000000030001408] = b7d6f9fb 9ca19d10
!	%f16 = ff000000 00000000 ff000000 000000ff
!	%f20 = ffffffff ff0000ff ff0000ff 00000000
!	%f24 = d7000000 ffd76dda 00000000 4e4f5db7
!	%f28 = 00000000 af160000 b7d6f9fb 9ca19d10
	stda	%f16,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%l7 = ffffffffffffffff, Mem[0000000010001404] = ff006aa4
	stw	%l7,[%i0+0x004]		! Mem[0000000010001404] = ffffffff
!	Mem[00000000300c1408] = 9ca19d10, %l1 = 00000000ff000000
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 00000010000000ff
!	Mem[00000000201c0000] = ff840847, %l7 = ffffffffffffffff
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000030081400] = ff000000
	stwa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l7 = 00000000000000ff, Mem[0000000030141410] = 00000033
	stha	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 00ff0033
!	Mem[0000000010141408] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l2 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = b7d6f9fb, %l6 = 00000000ff000000
	lduwa	[%i0+%o4]0x81,%l6	! %l6 = 00000000b7d6f9fb

p0_label_229:
!	Mem[0000000030101410] = d50000ff, %l5 = 000000001a7531a7
	ldsha	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffffd500
!	Mem[0000000030101410] = 00000084 ff0000d5, %l2 = 00000000, %l3 = 00000000
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 00000000ff0000d5 0000000000000084
!	Mem[0000000010001410] = 000016af, %l4 = ffffffffffffd7ff
	ldsba	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000010101428] = 00000000 4e4f5db7, %l2 = ff0000d5, %l3 = 00000084
	ldda	[%i4+0x028]%asi,%l2	! %l2 = 0000000000000000 000000004e4f5db7
!	Mem[00000000100c1410] = ff0000ff, %l3 = 000000004e4f5db7
	ldswa	[%i3+%o5]0x80,%l3	! %l3 = ffffffffff0000ff
!	Mem[00000000100c140c] = 00000000, %f28 = 00000000
	ld	[%i3+0x00c],%f28	! %f28 = 00000000
!	Mem[0000000010041408] = 00000033, %l0 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000033
!	Mem[0000000010041400] = ff000000, %l5 = ffffffffffffd500
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030141410] = da6dd7333300ff00, %l4 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l4	! %l4 = da6dd7333300ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 000000ff, %l0 = 0000000000000033
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 000000ff000000ff

p0_label_230:
!	%l1 = 0000000000000010, Mem[00000000201c0000] = ff840847, %asi = 80
	stba	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 10840847
!	Mem[0000000030101410] = ff0000d5, %l5 = 00000000ff000000
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 00000000ff0000d5
!	%l0 = 00000000000000ff, Mem[00000000100c1408] = acaaf251
	stwa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	%f19 = 000000ff, Mem[0000000030001400] = 00000000
	sta	%f19,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	%l1 = 0000000000000010, Mem[00000000300c1410] = 00000000
	stwa	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000010
!	%f0  = 33d76dda ff0000ff 00000000 acef4ef8
!	%f4  = ffb86b5e da6dd733 00000000 000000bb
!	%f8  = 55000000 000000ff 390000d7 6dda87d5
!	%f12 = 6a13e734 e923210d b7d6f9fb 00000000
	stda	%f0,[%i6]ASI_BLK_SL	! Block Store to 0000000030181400
!	%l0 = 00000000000000ff, Mem[0000000030181408] = f84eefac00000000
	stxa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000000000ff
!	%f21 = ff0000ff, Mem[0000000010001438] = 5163e764
	st	%f21,[%i0+0x038]	! Mem[0000000010001438] = ff0000ff
!	%l6 = 00000000b7d6f9fb, Mem[0000000030141400] = 00ff6dda
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = f9fb6dda
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = 982a3c92000000b8, %f22 = ff0000ff 00000000
	ldda	[%i3+0x028]%asi,%f22	! %f22 = 982a3c92 000000b8

p0_label_231:
!	Mem[0000000030001408] = b7d6f9fb 9ca19d10, %l0 = 000000ff, %l1 = 00000010
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 00000000b7d6f9fb 000000009ca19d10
!	Mem[00000000100c1408] = 000000ff, %l0 = 00000000b7d6f9fb
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 10840847, %l4 = da6dd7333300ff00
	ldub	[%o0+%g0],%l4		! %l4 = 0000000000000010
!	Mem[0000000030041400] = fbf9d6b7, %l5 = 00000000ff0000d5
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 000000000000d6b7
!	Mem[0000000010041410] = 00000000000000ff, %l3 = ffffffffff0000ff
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %l2 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000010181408] = 00000000, %l0 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 10840847, %l3 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000001084
!	Mem[0000000010001410] = af160000, %f15 = 00000000
	lda	[%i0+%o5]0x88,%f15	! %f15 = af160000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010041400] = 000000ff
	stwa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000

p0_label_232:
!	%f22 = 982a3c92 000000b8, Mem[0000000010001400] = ff000000 ffffffff
	stda	%f22,[%i0+%g0]0x88	! Mem[0000000010001400] = 982a3c92 000000b8
!	%l6 = 00000000b7d6f9fb, Mem[0000000010101400] = ff00000000000000
	stxa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000b7d6f9fb
!	%l5 = 000000000000d6b7, Mem[00000000300c1408] = ff9da19c
	stba	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = b79da19c
!	%l1 = 000000009ca19d10, Mem[0000000010181400] = ff0000ff00000000
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000009ca19d10
!	Mem[0000000030101400] = 00000000, %l1 = 000000009ca19d10
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%f16 = ff000000 00000000 ff000000 000000ff
!	%f20 = ffffffff ff0000ff 982a3c92 000000b8
!	%f24 = d7000000 ffd76dda 00000000 4e4f5db7
!	%f28 = 00000000 af160000 b7d6f9fb 9ca19d10
	stda	%f16,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	Mem[0000000010141400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l3 = 0000000000001084, Mem[0000000010041428] = 00000000
	sth	%l3,[%i1+0x028]		! Mem[0000000010041428] = 10840000
!	%l1 = 0000000000000000, Mem[0000000030181400] = ff0000ff
	stwa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l2 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000

p0_label_233:
!	Mem[0000000010141400] = ff000000000000ff, %l1 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = ff000000000000ff
!	Mem[0000000010101408] = 000000ff, %l1 = ff000000000000ff
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001408] = ffb86b5e d7000039, %l4 = 00000010, %l5 = 0000d6b7
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 00000000ffb86b5e 00000000d7000039
!	Mem[0000000010081410] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	%l3 = 0000000000001084, Mem[0000000010041410] = ffffffff
	stba	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 84ffffff
!	Mem[0000000010141408] = ff000000, %f5  = da6dd733
	lda	[%i5+%o4]0x80,%f5 	! %f5 = ff000000
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000010041400] = 000000ff, %l2 = ffffffffffffffff
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l3 = 0000000000001084
	lduwa	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = b7d6f9fb, %l7 = 0000000000000000
	lduba	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000b7
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010141423] = cbe0ffb2, %asi = 80
	stba	%l0,[%i5+0x023]%asi	! Mem[0000000010141420] = cbe0ff00

p0_label_234:
!	Mem[0000000010181400] = 00000000, %l7 = 00000000000000b7
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 000000b7, %l4 = 00000000ffb86b5e
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000b7
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 00000010
	stwa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Mem[00000000100c1420] = 000000ff, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x020]%asi,%l2	! %l2 = 00000000000000ff
!	%f1  = ff0000ff, Mem[0000000010181400] = 5e6bb8ff
	sta	%f1 ,[%i6+%g0]0x80	! Mem[0000000010181400] = ff0000ff
!	%l6 = 00000000b7d6f9fb, Mem[0000000010001400] = b8000000923c2a98
	stxa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000b7d6f9fb
!	%f12 = 6a13e734 e923210d, %l3 = 0000000000000000
!	Mem[00000000100c1400] = 0000000000000000
	stda	%f12,[%i3+%l3]ASI_PST32_PL ! Mem[00000000100c1400] = 0000000000000000
!	%l1 = 00000000000000ff, Mem[00000000100c142a] = 982a3c92, %asi = 80
	stba	%l1,[%i3+0x02a]%asi	! Mem[00000000100c1428] = 982aff92
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 0000000000000000
	setx	0x8976a83fa548e89d,%g7,%l0 ! %l0 = 8976a83fa548e89d
!	%l1 = 00000000000000ff
	setx	0x672a28b023d2a8a1,%g7,%l1 ! %l1 = 672a28b023d2a8a1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8976a83fa548e89d
	setx	0xfb78dce050521455,%g7,%l0 ! %l0 = fb78dce050521455
!	%l1 = 672a28b023d2a8a1
	setx	0x905dd12803acde82,%g7,%l1 ! %l1 = 905dd12803acde82
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = fbf9d6b7, %l1 = 905dd12803acde82
	ldsba	[%i0+%o4]0x89,%l1	! %l1 = ffffffffffffffb7

p0_label_235:
!	Mem[0000000010081410] = 000000ff, %l1 = ffffffffffffffb7
	ldsha	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101408] = 000000ff, %l4 = 00000000000000b7
	lduwa	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081410] = fbf9d6b7, %l2 = 00000000000000ff
	lduha	[%i2+%o5]0x89,%l2	! %l2 = 000000000000d6b7
!	Mem[0000000010081408] = 000000d5, %l5 = 00000000d7000039
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000d5
!	Mem[0000000021800080] = ffff2e44, %l7 = 0000000000000000
	lduh	[%o3+0x080],%l7		! %l7 = 000000000000ffff
!	Mem[0000000010041408] = 000000ff, %l1 = 00000000000000ff
	ldswa	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181414] = ffffda6d, %l4 = 00000000000000ff
	ldub	[%i6+0x017],%l4		! %l4 = 000000000000006d
!	Mem[0000000010041410] = 84ffffffff0000ff, %f10 = 390000d7 6dda87d5
	ldda	[%i1+%o5]0x80,%f10	! %f10 = 84ffffff ff0000ff
!	Mem[0000000030001410] = 0000000084000000, %l2 = 000000000000d6b7
	ldxa	[%i0+%o5]0x89,%l2	! %l2 = 0000000084000000
!	Starting 10 instruction Store Burst
!	%f14 = b7d6f9fb, Mem[0000000030181400] = 00000000
	sta	%f14,[%i6+%g0]0x89	! Mem[0000000030181400] = b7d6f9fb

p0_label_236:
!	Mem[0000000010081410] = 000000ff, %l0 = fb78dce050521455
	swapa	[%i2+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l5 = 00000000000000d5
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%l2 = 0000000084000000, Mem[0000000030141400] = da6dfbf9
	stba	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = da6dfb00
!	%l3 = 0000000000000000, Mem[0000000030101400] = 9ca19d10
	stha	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 9ca10000
!	%l6 = 00000000b7d6f9fb, Mem[0000000030001410] = 0000008400000000
	stxa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000b7d6f9fb
!	%l4 = 000000000000006d, Mem[0000000030101410] = ff000000
	stha	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = ff00006d
!	Mem[0000000010081400] = 00000000, %l1 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l7 = 000000000000ffff, Mem[00000000300c1408] = b79da19c
	stba	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff9da19c
!	%f0  = 33d76dda ff0000ff 00000000 acef4ef8
!	%f4  = ffb86b5e ff000000 00000000 000000bb
!	%f8  = 55000000 000000ff 84ffffff ff0000ff
!	%f12 = 6a13e734 e923210d b7d6f9fb af160000
	stda	%f0,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 109da19cfbf9d6b7, %f26 = 00000000 4e4f5db7
	ldda	[%i0+%o4]0x89,%f26	! %f26 = 109da19c fbf9d6b7

p0_label_237:
!	Mem[0000000030101410] = 6d0000ff 84000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 000000006d0000ff 0000000084000000
!	Mem[0000000010181428] = 64000000, %l0 = 000000006d0000ff
	ldub	[%i6+0x02b],%l0		! %l0 = 0000000000000000
!	Mem[0000000030181410] = ffb86b5e da6dd733, %l6 = b7d6f9fb, %l7 = 0000ffff
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 00000000da6dd733 00000000ffb86b5e
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000030041400] = 33d76dda ff0000ff, %l4 = 0000006d, %l5 = 00000000
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 00000000ff0000ff 0000000033d76dda
!	Mem[0000000030081400] = 00000000, %l2 = 0000000084000000
	ldswa	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %f10 = 84ffffff
	ld	[%i3+%g0],%f10	! %f10 = 00000000
!	Mem[0000000030101400] = 0000a19c, %l2 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = ffb86b5e, %l3 = 0000000000000000
	lduba	[%i0+0x00a]%asi,%l3	! %l3 = 000000000000006b
!	%l3 = 000000000000006b, Mem[00000000211c0000] = 00ff58bc, %asi = 80
	stba	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 6bff58bc
!	Starting 10 instruction Store Burst
!	%l5 = 0000000033d76dda, Mem[0000000030041408] = 00000000acef4ef8
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000033d76dda

p0_label_238:
!	%l3 = 000000000000006b, Mem[0000000030141410] = 00ff0033
	stwa	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000006b
!	Mem[0000000030181410] = da6dd733, %l0 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 00000000da6dd733
!	Mem[00000000100c1410] = ff0000ff, %l3 = 000000000000006b
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030041400] = ff0000ff, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000010181424] = ff838479, %l4 = 00000000ff0000ff, %asi = 80
	swapa	[%i6+0x024]%asi,%l4	! %l4 = 00000000ff838479
!	%f14 = b7d6f9fb, Mem[0000000030041410] = ff000000
	sta	%f14,[%i1+%o5]0x89	! Mem[0000000030041410] = b7d6f9fb
!	%l4 = 00000000ff838479, Mem[0000000030081410] = fbf9d6b7
	stwa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = ff838479
!	%l5 = 0000000033d76dda, Mem[0000000020800041] = e7644bbb
	stb	%l5,[%o1+0x041]		! Mem[0000000020800040] = e7da4bbb
!	%f18 = ff000000, Mem[0000000010181410] = 000000ff
	sta	%f18,[%i6+%o5]0x88	! Mem[0000000010181410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l6 = 00000000da6dd733
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000

p0_label_239:
!	Mem[00000000100c1408] = 000000ff, %f6  = 00000000
	lda	[%i3+%o4]0x80,%f6 	! %f6 = 000000ff
!	Mem[0000000010181430] = 00000089000000eb, %l6 = 0000000000000000
	ldxa	[%i6+0x030]%asi,%l6	! %l6 = 00000089000000eb
!	Mem[0000000010141408] = ff000000 00000000, %l2 = ff0000ff, %l3 = 000000ff
	ldd	[%i5+%o4],%l2		! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010101418] = ff0000ff, %l7 = 00000000ffb86b5e
	lduba	[%i4+0x019]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000218001c0] = ff42a805, %l5 = 0000000033d76dda
	ldsh	[%o3+0x1c0],%l5		! %l5 = ffffffffffffff42
!	Mem[0000000010001400] = 00000000 b7d6f9fb, %l2 = ff000000, %l3 = 00000000
	ldd	[%i0+%g0],%l2		! %l2 = 0000000000000000 00000000b7d6f9fb
!	Mem[000000001004142c] = 4e4f5db7, %l4 = 00000000ff838479
	ldswa	[%i1+0x02c]%asi,%l4	! %l4 = 000000004e4f5db7
!	Mem[0000000010081410] = 55145250, %l2 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 00000055000000ff
!	Mem[0000000010101408] = ff000000, %l3 = 00000000b7d6f9fb
	ldsh	[%i4+0x00a],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = b7d6f9fb 9ca19d10, %l2 = 0000000000000055
!	Mem[0000000010001400] = 00000000b7d6f9fb
	stda	%f30,[%i0+%l2]ASI_PST16_PL ! Mem[0000000010001400] = 109d0000fbf9f9fb

p0_label_240:
!	%l7 = 0000000000000000, Mem[00000000201c0001] = 10840847, %asi = 80
	stba	%l7,[%o0+0x001]%asi	! Mem[00000000201c0000] = 10000847
!	Mem[00000000211c0001] = 6bff58bc, %l4 = 000000004e4f5db7
	ldstub	[%o2+0x001],%l4		! %l4 = 000000ff000000ff
!	Mem[0000000010181424] = ff0000ff, %f24 = d7000000
	lda	[%i6+0x024]%asi,%f24	! %f24 = ff0000ff
!	%f20 = ffffffff, Mem[00000000100c1400] = 00000000
	sta	%f20,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffff
!	%l7 = 0000000000000000, Mem[0000000030141400] = 00fb6dda
	stba	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 00fb6dda
!	%l6 = 000000eb, %l7 = 00000000, Mem[0000000010181408] = 00000000 31000000
	stda	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000eb 00000000
!	%l0 = 00000000da6dd733, Mem[0000000010101408] = ff000000
	stw	%l0,[%i4+%o4]		! Mem[0000000010101408] = da6dd733
!	%l4 = 00000000000000ff, Mem[0000000010081410] = ff145250
	stba	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = ff145250
!	Mem[00000000300c1400] = ffffffd5, %l1 = 0000000084000000
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 000000d5000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffffffffff0000ff, %f28 = 00000000 af160000
	ldda	[%i4+%o5]0x80,%f28	! %f28 = ffffffff ff0000ff

p0_label_241:
!	Mem[0000000010101410] = ffffffff, %l1 = 00000000000000d5
	ldsha	[%i4+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001408] = 109da19cfbf9d6b7, %f0  = 33d76dda ff0000ff
	ldda	[%i0+%o4]0x89,%f0 	! %f0  = 109da19c fbf9d6b7
!	Mem[00000000300c1410] = 0000000000000000, %f16 = ff000000 00000000
	ldda	[%i3+%o5]0x81,%f16	! %f16 = 00000000 00000000
!	Mem[0000000010181410] = 6ddaffffff000000, %f10 = 00000000 ff0000ff
	ldda	[%i6+%o5]0x88,%f10	! %f10 = 6ddaffff ff000000
!	Mem[0000000010101410] = ff0000ffffffffff, %l0 = 00000000da6dd733
	ldxa	[%i4+%o5]0x88,%l0	! %l0 = ff0000ffffffffff
!	Mem[0000000010081410] = ff145250, %l3 = 0000000000000000
	ldsba	[%i2+%o5]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101418] = ff0000ff00000000, %l4 = 00000000000000ff
	ldxa	[%i4+0x018]%asi,%l4	! %l4 = ff0000ff00000000
!	Mem[0000000030001400] = 9a421fd5 ff000000, %l4 = 00000000, %l5 = ffffff42
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000ff000000 000000009a421fd5
!	Mem[0000000010081410] = ff145250, %l1 = ffffffffffffffff
	ldswa	[%i2+%o5]0x80,%l1	! %l1 = ffffffffff145250
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010101410] = ffffffff
	stha	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = ffff0000

p0_label_242:
!	%l4 = ff000000, %l5 = 9a421fd5, Mem[0000000010081400] = ff000000 ff000000
	stda	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000 9a421fd5
!	%f4  = ffb86b5e ff000000, %l6 = 00000089000000eb
!	Mem[0000000030141410] = 0000006b33d76dda
	add	%i5,0x010,%g1
	stda	%f4,[%g1+%l6]ASI_PST8_S ! Mem[0000000030141410] = ffb86b6bffd70000
!	Mem[0000000010101400] = 00000000, %l3 = ffffffffffffffff
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%l2 = 00000055, %l3 = 00000000, Mem[0000000030101400] = 0000a19c ff000000
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000055 00000000
!	%f16 = 00000000 00000000, Mem[0000000010181438] = da6dd733 ff0000ff
	stda	%f16,[%i6+0x038]%asi	! Mem[0000000010181438] = 00000000 00000000
!	%l6 = 00000089000000eb, Mem[0000000021800100] = ffff8452, %asi = 80
	stha	%l6,[%o3+0x100]%asi	! Mem[0000000021800100] = 00eb8452
!	%l0 = ffffffff, %l1 = ff145250, Mem[0000000010101410] = 0000ffff ff0000ff
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffff ff145250
!	Mem[0000000010181400] = ff0000ff, %l0 = ff0000ffffffffff
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	%l5 = 000000009a421fd5, Mem[0000000030041408] = 0000000033d76dda
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000009a421fd5
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff00000000000000, %l0 = 00000000000000ff
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = ff00000000000000

p0_label_243:
!	Code Fragment 3
p0_fragment_7:
!	%l0 = ff00000000000000
	setx	0x61834ab854322344,%g7,%l0 ! %l0 = 61834ab854322344
!	%l1 = ffffffffff145250
	setx	0x8f725b9848e0a6a6,%g7,%l1 ! %l1 = 8f725b9848e0a6a6
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 61834ab854322344
	setx	0xcbcfa9c0074f1eb0,%g7,%l0 ! %l0 = cbcfa9c0074f1eb0
!	%l1 = 8f725b9848e0a6a6
	setx	0xf0efa6e00870591a,%g7,%l1 ! %l1 = f0efa6e00870591a
!	Mem[0000000010001400] = 109d0000fbf9f9fb, %f16 = 00000000 00000000
	ldda	[%i0+%g0]0x80,%f16	! %f16 = 109d0000 fbf9f9fb
!	Mem[00000000100c1400] = ffffffff, %l6 = 00000089000000eb
	lduha	[%i3+%g0]0x80,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010081418] = ff00ff00, %l0 = cbcfa9c0074f1eb0
	ldsb	[%i2+0x018],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010141408] = 000000ff, %l1 = f0efa6e00870591a
	ldswa	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l5 = 000000009a421fd5
	ldswa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff 00000000, %l2 = 00000055, %l3 = 00000000
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[0000000010181400] = ff0000ff, %l6 = 000000000000ffff
	ldswa	[%i6+%g0]0x88,%l6	! %l6 = ffffffffff0000ff
!	Mem[0000000030101410] = ff00006d, %l6 = ffffffffff0000ff
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = 000000000000006d
!	Starting 10 instruction Store Burst
!	%f20 = ffffffff ff0000ff, Mem[0000000010081400] = 000000ff d51f429a
	stda	%f20,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff ff0000ff

p0_label_244:
!	Mem[0000000010001439] = ff0000ff, %l2 = 00000000ffffffff
	ldstuba	[%i0+0x039]%asi,%l2	! %l2 = 00000000000000ff
!	%l6 = 000000000000006d, Mem[0000000010141410] = 000000d500000000, %asi = 80
	stxa	%l6,[%i5+0x010]%asi	! Mem[0000000010141410] = 000000000000006d
!	%f24 = ff0000ff ffd76dda, Mem[0000000010081410] = 505214ff ffffffff
	stda	%f24,[%i2+%o5]0x88	! Mem[0000000010081410] = ff0000ff ffd76dda
!	%l4 = 00000000ff000000, Mem[0000000010081418] = ff00ff00
	stb	%l4,[%i2+0x018]		! Mem[0000000010081418] = 0000ff00
!	%l6 = 000000000000006d, Mem[0000000010181400] = ff0000ff
	stba	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = ff00006d
!	Mem[0000000010181410] = 000000ff, %l4 = 00000000ff000000
	lduba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l5 = 0000000000000000, Mem[000000001004140e] = 000000ff, %asi = 80
	stha	%l5,[%i1+0x00e]%asi	! Mem[000000001004140c] = 00000000
!	Mem[0000000010141408] = 000000ff, %l6 = 000000000000006d
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010041410] = 84ffffff, %l0 = ffffffffffffffff
	swapa	[%i1+%o5]0x80,%l0	! %l0 = 0000000084ffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffffffff 00000000, %l0 = 84ffffff, %l1 = 000000ff
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 00000000ffffffff 0000000000000000

p0_label_245:
!	Mem[00000000300c1400] = 00000000ffffffff, %l2 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l2	! %l2 = 00000000ffffffff
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000030141400] = 00fb6dda ff0000ff 00000000 acef4ef8
!	Mem[0000000030141410] = ffb86b6b ffd70000 00000000 000000bb
!	Mem[0000000030141420] = 55000000 b7e0ede4 068718d8 74437a03
!	Mem[0000000030141430] = 6a13e734 e923210d b7d6f9fb 9ca19d10
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000010081400] = ffffffff ff0000ff, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 00000000ffffffff 00000000ff0000ff
!	Mem[0000000010081418] = 0000ff00, %l4 = 0000000000000000
	ldsw	[%i2+0x018],%l4		! %l4 = 000000000000ff00
!	%l3 = 00000000ff0000ff, Mem[0000000030101410] = 6d0000ff
	stha	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ff00ff
!	Mem[0000000030041408] = 000000009a421fd5, %f14 = b7d6f9fb af160000
	ldda	[%i1+%o4]0x89,%f14	! %f14 = 00000000 9a421fd5
!	Mem[0000000010141438] = 9a421fd5 000000ff, %l0 = ffffffff, %l1 = 00000000
	ldd	[%i5+0x038],%l0		! %l0 = 000000009a421fd5 00000000000000ff
!	Mem[0000000030141408] = 00000000acef4ef8, %l7 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l7	! %l7 = 00000000acef4ef8
!	Mem[0000000010041410] = ff0000ff ffffffff, %l6 = 000000ff, %l7 = acef4ef8
	ldda	[%i1+%o5]0x88,%l6	! %l6 = 00000000ffffffff 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ff0000ff, Mem[0000000010081410] = da6dd7ff
	stha	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ffd7ff

p0_label_246:
!	%l3 = 00000000ff0000ff, Mem[00000000300c1400] = ffffffff
	stwa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff0000ff
!	%l0 = 000000009a421fd5, Mem[00000000211c0001] = 6bff58bc, %asi = 80
	stba	%l0,[%o2+0x001]%asi	! Mem[00000000211c0000] = 6bd558bc
!	Mem[0000000010041410] = ffffffff, %l6 = 00000000ffffffff
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 00000000ffffffff
!	%l1 = 00000000000000ff, Mem[0000000010141437] = 00000000, %asi = 80
	stba	%l1,[%i5+0x037]%asi	! Mem[0000000010141434] = 000000ff
!	Mem[0000000010141424] = acef4ef8, %l3 = 00000000ff0000ff, %asi = 80
	swapa	[%i5+0x024]%asi,%l3	! %l3 = 00000000acef4ef8
!	%l0 = 000000009a421fd5, Mem[0000000010041410] = ffffffff
	stba	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffd5
!	Mem[0000000010181428] = 64000000, %l0 = 000000009a421fd5, %asi = 80
	swapa	[%i6+0x028]%asi,%l0	! %l0 = 0000000064000000
!	%l7 = 00000000ff0000ff, Mem[0000000010101408] = da6dd733
	stha	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00ffd733
!	%f2  = 00000000 acef4ef8, Mem[0000000030101400] = 55000000 00000000
	stda	%f2 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 acef4ef8
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffffffff, %f7  = 000000bb
	lda	[%i4+%o5]0x80,%f7 	! %f7 = ffffffff

p0_label_247:
!	Mem[0000000010101410] = ffffffff, %f12 = 6a13e734
	lda	[%i4+%o5]0x80,%f12	! %f12 = ffffffff
!	Mem[0000000010181400] = 6d0000ff, %l7 = 00000000ff0000ff
	ldswa	[%i6+%g0]0x80,%l7	! %l7 = 000000006d0000ff
!	Mem[000000001000143c] = 73000000, %l1 = 00000000000000ff
	ldsw	[%i0+0x03c],%l1		! %l1 = 0000000073000000
!	Mem[0000000010101408] = 00ffd733, %l0 = 0000000064000000
	ldsha	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081408] = ff000000, %f6  = 000000ff
	lda	[%i2+%o4]0x81,%f6 	! %f6 = ff000000
!	Mem[0000000010001410] = 000016af, %l4 = 000000000000ff00
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = 00000000000016af
!	Mem[00000000300c1408] = b7d6f9fb9ca19dff, %f10 = 6ddaffff ff000000
	ldda	[%i3+%o4]0x89,%f10	! %f10 = b7d6f9fb 9ca19dff
!	Mem[00000000211c0000] = 6bd558bc, %l0 = 00000000000000ff
	ldub	[%o2+0x001],%l0		! %l0 = 00000000000000d5
!	Mem[00000000211c0000] = 6bd558bc, %l1 = 0000000073000000
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 0000000000006bd5
!	Starting 10 instruction Store Burst
!	Mem[000000001018142e] = 00000000, %l6 = 00000000ffffffff
	ldstuba	[%i6+0x02e]%asi,%l6	! %l6 = 00000000000000ff

p0_label_248:
!	%f12 = ffffffff, Mem[0000000010081408] = d5000000
	sta	%f12,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff
!	%l7 = 000000006d0000ff, Mem[0000000010101408] = 00ffd733
	stba	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffd733
!	%l6 = 00000000, %l7 = 6d0000ff, Mem[0000000030101408] = 33000000 da6dd733
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 6d0000ff
!	%l4 = 00000000000016af, Mem[00000000100c1408] = ff000000
	stha	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff0016af
!	%l6 = 0000000000000000, Mem[0000000010041410] = ffffffd5
	stha	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = ffff0000
	membar	#Sync			! Added by membar checker (46)
!	%f1  = fbf9d6b7, Mem[0000000030141400] = 00fb6dda
	sta	%f1 ,[%i5+%g0]0x81	! Mem[0000000030141400] = fbf9d6b7
!	%l1 = 0000000000006bd5, Mem[0000000030101410] = 00ff00ff84000000
	stxa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000006bd5
!	%l7 = 000000006d0000ff, Mem[0000000021800041] = ffffc626
	stb	%l7,[%o3+0x041]		! Mem[0000000021800040] = ffffc626
!	%l3 = 00000000acef4ef8, Mem[0000000030081408] = ff000000
	stba	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = f8000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000 00000000, %l2 = ffffffff, %l3 = acef4ef8
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 00000000ff000000 0000000000000000

p0_label_249:
!	Mem[0000000010001400] = 109d0000 fbf9f9fb, %l0 = 000000d5, %l1 = 00006bd5
	ldda	[%i0+0x000]%asi,%l0	! %l0 = 00000000109d0000 00000000fbf9f9fb
!	Mem[0000000020800040] = e7da4bbb, %l4 = 00000000000016af
	lduba	[%o1+0x041]%asi,%l4	! %l4 = 00000000000000da
!	Mem[0000000010001408] = 5e6bb8ff, %l4 = 00000000000000da
	ldswa	[%i0+%o4]0x88,%l4	! %l4 = 000000005e6bb8ff
!	Mem[00000000300c1400] = ff0000ff, %l0 = 00000000109d0000
	ldsha	[%i3+%g0]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000021800000] = ff00951b, %l3 = 0000000000000000
	ldsb	[%o3+0x001],%l3		! %l3 = 0000000000000000
!	Mem[00000000100c1410] = ff0000ff, %l7 = 000000006d0000ff
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141400] = ff0000ffb7d6f9fb, %l0 = ffffffffffffff00
	ldxa	[%i5+%g0]0x89,%l0	! %l0 = ff0000ffb7d6f9fb
!	Mem[0000000010081420] = 390000d7, %l2 = 00000000ff000000
	lduha	[%i2+0x022]%asi,%l2	! %l2 = 00000000000000d7
!	Mem[0000000030081408] = 000000f8, %l6 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l6	! %l6 = fffffffffffffff8
!	Starting 10 instruction Store Burst
!	%l2 = 000000d7, %l3 = 00000000, Mem[0000000030141408] = 00000000 acef4ef8
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000d7 00000000

p0_label_250:
!	%f18 = 00000000 acef4ef8, Mem[0000000010001408] = ffb86b5e d7000039
	stda	%f18,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 acef4ef8
!	%f18 = 00000000 acef4ef8, Mem[0000000030041408] = 9a421fd5 00000000
	stda	%f18,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 acef4ef8
!	Mem[0000000010081408] = ffffffff, %l7 = 00000000000000ff
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	%l1 = 00000000fbf9f9fb, Mem[0000000010181400] = 6d0000ff9ca19d10
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000fbf9f9fb
!	%f14 = 00000000, Mem[0000000010041410] = ffff0000
	sta	%f14,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Mem[0000000010101410] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010041428] = 10840000, %l0 = ff0000ffb7d6f9fb
	swap	[%i1+0x028],%l0		! %l0 = 0000000010840000
!	%l0 = 0000000010840000, Mem[00000000100c1400] = ffffffff
	stha	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffff0000
!	%f4  = ffb86b5e ff000000, %l1 = 00000000fbf9f9fb
!	Mem[0000000010041408] = ff00000000000000
	add	%i1,0x008,%g1
	stda	%f4,[%g1+%l1]ASI_PST8_P ! Mem[0000000010041408] = ffb86b5eff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffffd733 000000ff, %l0 = 10840000, %l1 = fbf9f9fb
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 00000000ffffd733 00000000000000ff

p0_label_251:
!	Mem[0000000030141410] = ffb86b6b, %l5 = 0000000000000000
	lduwa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ffb86b6b
!	Mem[00000000100c1410] = ff0000ff, %l5 = 00000000ffb86b6b
	ldsha	[%i3+0x012]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l0 = 00000000ffffd733
	lduwa	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 000000ff ffffda6d, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 00000000000000ff 00000000ffffda6d
!	Mem[0000000030001410] = 00000000, %l7 = 00000000000000ff
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[000000001004142c] = 4e4f5db7, %l2 = 00000000000000d7
	ldsba	[%i1+0x02d]%asi,%l2	! %l2 = 000000000000004f
!	Mem[0000000010141408] = 000000ff, %f17 = ff0000ff
	lda	[%i5+%o4]0x88,%f17	! %f17 = 000000ff
!	Mem[0000000030101410] = d56b0000 00000000, %l0 = 000000ff, %l1 = ffffda6d
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000 00000000d56b0000
!	Mem[0000000010001400] = 00009d10, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 0000000000009d10
!	Starting 10 instruction Store Burst
!	Mem[0000000021800180] = 0084809b, %l2 = 000000000000004f
	ldstuba	[%o3+0x180]%asi,%l2	! %l2 = 00000000000000ff

p0_label_252:
!	%l6 = fffffffffffffff8, Mem[00000000100c1437] = 00000064, %asi = 80
	stba	%l6,[%i3+0x037]%asi	! Mem[00000000100c1434] = 000000f8
!	%l1 = 00000000d56b0000, Mem[0000000010081400] = ffffffff
	stwa	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = d56b0000
!	%l2 = 0000000000000000, Mem[0000000010141400] = ff000000000000ff
	stxa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010181402] = 00000000, %asi = 80
	stha	%l0,[%i6+0x002]%asi	! Mem[0000000010181400] = 00000000
!	Mem[0000000010181400] = 00000000, %l7 = 00009d10, %l4 = 5e6bb8ff
	casa	[%i6]0x80,%l7,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041412] = 00000000, %l2 = 0000000000000000
	ldstub	[%i1+0x012],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010101408] = ffffd733, %l7 = 0000000000009d10
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	%f12 = ffffffff e923210d, %l3 = 00000000000000ff
!	Mem[0000000010041408] = ffb86b5eff000000
	add	%i1,0x008,%g1
	stda	%f12,[%g1+%l3]ASI_PST8_P ! Mem[0000000010041408] = ffffffffe923210d
!	Mem[0000000010081408] = ffffffff, %l5 = 00000000000000ff
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = af1600ff, %l6 = fffffffffffffff8
	ldsb	[%i3+0x009],%l6		! %l6 = 0000000000000016

p0_label_253:
!	Mem[00000000201c0000] = 10000847, %l5 = 00000000ffffffff
	lduh	[%o0+%g0],%l5		! %l5 = 0000000000001000
!	Mem[0000000010081420] = 390000d7, %l5 = 0000000000001000
	ldsba	[%i2+0x023]%asi,%l5	! %l5 = ffffffffffffffd7
!	Mem[0000000010181410] = 000000ffffffda6d, %l7 = 00000000000000ff
	ldxa	[%i6+%o5]0x80,%l7	! %l7 = 000000ffffffda6d
!	Mem[0000000010081438] = 33b3288f0000ffff, %f16 = 00fb6dda 000000ff
	ldda	[%i2+0x038]%asi,%f16	! %f16 = 33b3288f 0000ffff
!	Mem[0000000010181418] = ffb86b5e, %l4 = 0000000000000000
	lduba	[%i6+0x01b]%asi,%l4	! %l4 = 000000000000005e
!	Mem[0000000030001400] = 000000ffd51f429a, %f16 = 33b3288f 0000ffff
	ldda	[%i0+%g0]0x81,%f16	! %f16 = 000000ff d51f429a
!	Mem[0000000010041414] = ff0000ff, %l0 = 0000000000000000
	ldswa	[%i1+0x014]%asi,%l0	! %l0 = ffffffffff0000ff
!	Mem[0000000030141408] = 000000d7, %l2 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000d7
!	Mem[0000000030141408] = 000000d7 00000000, %l2 = 000000d7, %l3 = 000000ff
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000d7 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = b7d6f9fb, %l0 = ffffffffff0000ff
	swapa	[%i5+%g0]0x89,%l0	! %l0 = 00000000b7d6f9fb

p0_label_254:
!	%l5 = ffffffffffffffd7, Mem[0000000020800040] = e7da4bbb, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = ffd74bbb
!	Mem[0000000010081400] = 00006bd5, %l5 = ffffffffffffffd7
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 0000000000006bd5
!	Mem[0000000010181431] = 00000089, %l5 = 0000000000006bd5
	ldstub	[%i6+0x031],%l5		! %l5 = 00000000000000ff
!	%l4 = 000000000000005e, Mem[0000000010181410] = 000000ff
	stba	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 5e0000ff
!	%l0 = 00000000b7d6f9fb, Mem[0000000030001408] = b7d6f9fb
	stba	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = fbd6f9fb
!	%l7 = 000000ffffffda6d, Mem[0000000030081400] = 00000000
	stwa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffda6d
!	Mem[0000000021800000] = ff00951b, %l3 = 0000000000000000
	ldstub	[%o3+%g0],%l3		! %l3 = 000000ff000000ff
!	%f2  = 00000000, Mem[0000000030041408] = acef4ef8
	sta	%f2 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l2 = 00000000000000d7, Mem[0000000020800041] = ffd74bbb, %asi = 80
	stba	%l2,[%o1+0x041]%asi	! Mem[0000000020800040] = ffd74bbb
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 00000000b7d6f9fb
	setx	0xb0d3e40033868562,%g7,%l0 ! %l0 = b0d3e40033868562
!	%l1 = 00000000d56b0000
	setx	0x3e998a4038a9cc71,%g7,%l1 ! %l1 = 3e998a4038a9cc71
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b0d3e40033868562
	setx	0x490008078c3b2e92,%g7,%l0 ! %l0 = 490008078c3b2e92
!	%l1 = 3e998a4038a9cc71
	setx	0x781e7b0861566c41,%g7,%l1 ! %l1 = 781e7b0861566c41

p0_label_255:
!	Mem[0000000010101408] = ffffd733, %l5 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181400] = 00000000fbf9f9fb, %f0  = 109da19c fbf9d6b7
	ldda	[%i6+%g0]0x80,%f0 	! %f0  = 00000000 fbf9f9fb
!	Mem[000000001004143c] = 9ca19d10, %l3 = 00000000000000ff
	ldsha	[%i1+0x03c]%asi,%l3	! %l3 = ffffffffffff9ca1
!	Mem[0000000030041400] = 00000000, %l5 = ffffffffffffffff
	lduwa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l4 = 000000000000005e
	ldsha	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = ff0000ff, %l5 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000010141408] = ff00000000000000, %l0 = 490008078c3b2e92
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = ff00000000000000
!	Mem[0000000030141410] = 0000d7ff6b6bb8ff, %f30 = b7d6f9fb 9ca19d10
	ldda	[%i5+%o5]0x89,%f30	! %f30 = 0000d7ff 6b6bb8ff
!	Mem[00000000300c1410] = 00000000, %l6 = 0000000000000016
	lduha	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f22 = 00000000 000000bb, Mem[0000000010041410] = 00ff0000 ff0000ff
	stda	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 000000bb

p0_label_256:
!	Mem[00000000100c1410] = ff0000ff, %l0 = ff00000000000000
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010001410] = 000016af, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l2 = 00000000000000d7
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000010081400] = ffffffd7
	stwa	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	Mem[00000000300c1408] = 9ca19dff, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 000000009ca19dff
!	%l4 = 0000000000000000, Mem[0000000010041408] = ffffffff
	stba	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffff00
!	%l4 = 00000000, %l5 = ff0000ff, Mem[00000000300c1400] = ff0000ff 00000000
	stda	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 ff0000ff
!	Mem[0000000030181400] = fbf9d6b7, %l3 = ffffffffffff9ca1
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 00000000fbf9d6b7
!	Mem[0000000010041410] = bb000000, %l3 = fbf9d6b7, %l6 = 00000000
	add	%i1,0x10,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 00000000bb000000
!	Starting 10 instruction Load Burst
!	Mem[000000001004141c] = 000000b8, %l5 = 00000000ff0000ff
	lduw	[%i1+0x01c],%l5		! %l5 = 00000000000000b8

p0_label_257:
!	Mem[0000000030101410] = 00000000, %l1 = 781e7b0861566c41
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 00000000fbf9d6b7, %l5 = 00000000000000b8
	ldxa	[%i3+%o4]0x81,%l5	! %l5 = 00000000fbf9d6b7
!	Mem[0000000010041410] = bb000000, %l2 = 000000009ca19dff
	ldsba	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffffbb
!	Mem[0000000030141400] = ff0000ff, %l7 = 000000ffffffda6d
	ldsha	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l5 = 00000000fbf9d6b7, Mem[0000000030041400] = 00000000
	stwa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = fbf9d6b7
!	Mem[00000000100c1410] = ff0000ff6d000000, %l2 = ffffffffffffffbb
	ldxa	[%i3+%o5]0x80,%l2	! %l2 = ff0000ff6d000000
!	Mem[0000000010041400] = 00000000 000000ff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000010141408] = 000000ff, %f17 = d51f429a
	lda	[%i5+%o4]0x88,%f17	! %f17 = 000000ff
!	Mem[0000000010141408] = ff00000000000000, %f10 = b7d6f9fb 9ca19dff
	ldda	[%i5+0x008]%asi,%f10	! %f10 = ff000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = b7d6f9fb, %l7 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 00000000b7d6f9fb

p0_label_258:
!	%f28 = 6a13e734 e923210d, Mem[0000000010101400] = ffffffff fbf9d6b7
	stda	%f28,[%i4+%g0]0x88	! Mem[0000000010101400] = 6a13e734 e923210d
!	%f26 = 068718d8, Mem[0000000030181410] = 00000000
	sta	%f26,[%i6+%o5]0x89	! Mem[0000000030181410] = 068718d8
!	Mem[00000000100c1410] = ff0000ff, %l4 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 00000000ff0000ff
!	%l7 = 00000000b7d6f9fb, Mem[0000000010001430] = 000000ff89000000, %asi = 80
	stxa	%l7,[%i0+0x030]%asi	! Mem[0000000010001430] = 00000000b7d6f9fb
!	Mem[0000000010181400] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[000000001010141a] = ff0000ff, %l3 = 00000000fbf9d6b7
	ldstuba	[%i4+0x01a]%asi,%l3	! %l3 = 00000000000000ff
!	%f10 = ff000000, Mem[0000000030041408] = 00000000
	sta	%f10,[%i1+%o4]0x81	! Mem[0000000030041408] = ff000000
!	%l4 = 00000000ff0000ff, Mem[00000000300c1400] = 00000000
	stwa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff0000ff
!	Mem[0000000010041408] = ffffff00, %l0 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 00000000ffffff00
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 000000ff, %l5 = 00000000fbf9d6b7
	ldswa	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000ff

p0_label_259:
!	Mem[0000000030181408] = 00000000, %l2 = ff0000ff6d000000
	lduwa	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = 798483ff, %l4 = 00000000ff0000ff
	lduwa	[%i2+%o5]0x81,%l4	! %l4 = 00000000798483ff
!	Mem[0000000030081408] = f800000034000000, %l0 = 00000000ffffff00
	ldxa	[%i2+%o4]0x81,%l0	! %l0 = f800000034000000
!	Mem[0000000010181408] = 000000eb, %l1 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000eb
!	Mem[0000000030001408] = fbd6f9fb, %l6 = 00000000bb000000
	ldsba	[%i0+%o4]0x81,%l6	! %l6 = fffffffffffffffb
!	Mem[00000000100c1400] = 00000000ffff0000, %l4 = 00000000798483ff
	ldxa	[%i3+%g0]0x88,%l4	! %l4 = 00000000ffff0000
!	Mem[00000000300c1408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101420] = d7000000ffd76dda, %f26 = 068718d8 74437a03
	ldd	[%i4+0x020],%f26	! %f26 = d7000000 ffd76dda
!	Starting 10 instruction Store Burst
!	%l6 = fffffffffffffffb, Mem[0000000010141400] = 00000000
	stha	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = fffb0000

p0_label_260:
!	Mem[00000000300c1400] = ff0000ff, %l7 = 00000000b7d6f9fb
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[0000000030101410] = 00000000
	stwa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000ffff0000
	ldstuba	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = 000000ff, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = 10000847, %l5 = 00000000000000ff
	ldstub	[%o0+%g0],%l5		! %l5 = 00000010000000ff
!	%l1 = 00000000000000eb, Mem[0000000010141400] = 0000fbff
	stba	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000fbeb
!	%f16 = 000000ff 000000ff, %l7 = 00000000000000ff
!	Mem[0000000010181438] = 0000000000000000
	add	%i6,0x038,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010181438] = ff000000ff000000
!	%f4  = ffb86b5e ff000000, %l1 = 00000000000000eb
!	Mem[0000000030101408] = 00000000ff00006d
	add	%i4,0x008,%g1
	stda	%f4,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030101408] = 000000ffff00b8ff
!	Mem[0000000030001410] = 00000000, %l1 = 00000000000000eb
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = fbf9d6b75e6bb8ff, %f30 = 0000d7ff 6b6bb8ff
	ldda	[%i1+%o5]0x81,%f30	! %f30 = fbf9d6b7 5e6bb8ff

p0_label_261:
!	Mem[0000000010041408] = 00000000e923210d, %l6 = fffffffffffffffb
	ldxa	[%i1+%o4]0x80,%l6	! %l6 = 00000000e923210d
!	Mem[0000000010001410] = 00000000af1600ff, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l3	! %l3 = 00000000af1600ff
!	Mem[00000000100c1408] = af1600ff, %l0 = f800000034000000
	lduwa	[%i3+%o4]0x80,%l0	! %l0 = 00000000af1600ff
!	Mem[0000000010001430] = 00000000b7d6f9fb, %l0 = 00000000af1600ff
	ldxa	[%i0+0x030]%asi,%l0	! %l0 = 00000000b7d6f9fb
!	Mem[0000000010141400] = 0000fbeb, %l3 = 00000000af1600ff
	ldsba	[%i5+%g0]0x88,%l3	! %l3 = ffffffffffffffeb
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000e923210d
	ldsha	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000030081400] = ffffda6d 00000000 f8000000 34000000
!	Mem[0000000030081410] = 798483ff 00000000 1a7531a7 8788c6cd
!	Mem[0000000030081420] = ffffd7ff 157839c2 74592f4e 299bb4bb
!	Mem[0000000030081430] = 0d2123e9 34e7136a 109da19c 16afb44d
	ldda	[%i2]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Mem[0000000030041400] = 000000ff, %l3 = ffffffffffffffeb
	lduwa	[%i1+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081410] = 00000000ff838479, %f6  = ff000000 ffffffff
	ldda	[%i2+%o5]0x89,%f6 	! %f6  = 00000000 ff838479
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000201c0000] = ff000847
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 00000847

p0_label_262:
!	%l2 = 0000000000000000, Mem[00000000100c1434] = 000000f8, %asi = 80
	stwa	%l2,[%i3+0x034]%asi	! Mem[00000000100c1434] = 00000000
!	Mem[0000000010181400] = 000000ff, %l5 = 0000000000000010
	ldstuba	[%i6+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030101410] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081430] = 0000a19c, %l0 = 00000000b7d6f9fb
	swap	[%i2+0x030],%l0		! %l0 = 000000000000a19c
!	%l7 = 00000000000000ff, Mem[000000001004141e] = 000000b8, %asi = 80
	stha	%l7,[%i1+0x01e]%asi	! Mem[000000001004141c] = 000000ff
!	Mem[0000000010001438] = ffff00ff73000000, %l4 = 0000000000000000, %l2 = 0000000000000000
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = ffff00ff73000000
!	Mem[00000000201c0001] = 00000847, %l6 = 0000000000000000
	ldstub	[%o0+0x001],%l6		! %l6 = 00000000000000ff
!	%f15 = 9a421fd5, Mem[0000000010101400] = 0d2123e9
	sta	%f15,[%i4+0x000]%asi	! Mem[0000000010101400] = 9a421fd5
!	Mem[0000000030101408] = ff000000, %l3 = 00000000000000ff
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff0016af 00000000, %l2 = 73000000, %l3 = ff000000
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 00000000ff0016af 0000000000000000

p0_label_263:
!	Mem[0000000030001400] = 00000000, %l0 = 000000000000a19c
	ldswa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 00000000 000000ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000010181400] = ff000000fbf9f9fb, %l4 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l4	! %l4 = ff000000fbf9f9fb
!	Mem[0000000010141400] = ebfb0000, %f8  = 55000000
	ld	[%i5+%g0],%f8 	! %f8 = ebfb0000
!	Mem[0000000010141408] = ff000000, %l5 = 00000000000000ff
	lduha	[%i5+%o4]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010181410] = ff00005e, %f1  = fbf9f9fb
	lda	[%i6+%o5]0x88,%f1 	! %f1 = ff00005e
!	Mem[0000000030181410] = d81887065e6bb8ff, %l0 = 00000000000000ff
	ldxa	[%i6+%o5]0x81,%l0	! %l0 = d81887065e6bb8ff
!	Mem[00000000218000c0] = 6d45f510, %l0 = d81887065e6bb8ff
	ldsb	[%o3+0x0c1],%l0		! %l0 = 0000000000000045
!	Mem[0000000010141410] = 000000d7, %l1 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = ffffffff e923210d, Mem[00000000100c1420] = 000000ff 0000255f
	std	%f12,[%i3+0x020]	! Mem[00000000100c1420] = ffffffff e923210d

p0_label_264:
!	%f3  = acef4ef8, Mem[0000000010181410] = 5e0000ff
	sta	%f3 ,[%i6+%o5]0x80	! Mem[0000000010181410] = acef4ef8
!	%l7 = 00000000000000ff, Mem[00000000300c1410] = ff000000
	stwa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff
!	Mem[00000000100c1430] = 0000000000000000, %l3 = 0000000000000000, %l3 = 0000000000000000
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = 0000000000000000
!	%f5  = ff000000, Mem[0000000030001408] = fbd6f9fb
	sta	%f5 ,[%i0+%o4]0x81	! Mem[0000000030001408] = ff000000
!	Mem[00000000100c1410] = 00000000, %l5 = 000000000000ff00
	ldstuba	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l1 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[000000001010143e] = 9ca19d10, %l3 = 0000000000000000
	ldstuba	[%i4+0x03e]%asi,%l3	! %l3 = 0000009d000000ff
!	Mem[0000000010081418] = 0000ff00ffffff8f, %l3 = 000000000000009d, %l7 = 00000000000000ff
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = 0000ff00ffffff8f
!	Mem[0000000010101400] = 9a421fd5, %l1 = 0000000000000000
	lduba	[%i4+%g0]0x80,%l1	! %l1 = 000000000000009a
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000000000ff, %f6  = 00000000 ff838479
	ldda	[%i1+%o4]0x89,%f6 	! %f6  = 00000000 000000ff

p0_label_265:
!	Mem[0000000010041438] = b7d6f9fb, %l6 = 0000000000000000
	ldsb	[%i1+0x039],%l6		! %l6 = ffffffffffffffd6
!	Mem[0000000010141438] = 9a421fd5, %l0 = 0000000000000045
	ldsha	[%i5+0x03a]%asi,%l0	! %l0 = 0000000000001fd5
!	Mem[0000000010001408] = 00000000, %l3 = 000000000000009d
	lduwa	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = acef4ef8, %f17 = 00000000
	lda	[%i6+%o5]0x80,%f17	! %f17 = acef4ef8
!	Mem[0000000030101410] = 000000ff, %l0 = 0000000000001fd5
	ldsba	[%i4+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181424] = ff0000ff, %f22 = 1a7531a7
	ld	[%i6+0x024],%f22	! %f22 = ff0000ff
!	Mem[00000000300c1410] = 00000000ff000000, %f14 = 00000000 9a421fd5
	ldda	[%i3+%o5]0x89,%f14	! %f14 = 00000000 ff000000
!	Mem[0000000030141400] = ff0000ffff0000ff, %l1 = 000000000000009a
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = ff0000ffff0000ff
!	%f16 = ffffda6d, %f18 = f8000000 34000000
	fstox	%f16,%f18		! %f18 = 80000000 00000000
!	Starting 10 instruction Store Burst
!	%l2 = ff0016af, %l3 = 00000000, Mem[0000000030101410] = 000000ff d56b0000
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = ff0016af 00000000

p0_label_266:
!	%l4 = ff000000fbf9f9fb, Mem[00000000211c0001] = 6bd558bc
	stb	%l4,[%o2+0x001]		! Mem[00000000211c0000] = 6bfb58bc
!	%f18 = 80000000 00000000, Mem[0000000010001410] = ff0016af 00000000
	stda	%f18,[%i0+%o5]0x80	! Mem[0000000010001410] = 80000000 00000000
!	Mem[0000000010101410] = ffffffff, %l2 = 00000000ff0016af
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 00000000ffffffff
!	%l4 = fbf9f9fb, %l5 = 00000000, Mem[0000000030181408] = 00000000 000000ff
	stda	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = fbf9f9fb 00000000
	membar	#Sync			! Added by membar checker (48)
!	%l5 = 0000000000000000, Mem[0000000030081408] = 00000034000000f8
	stxa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000000000000000
!	%f2  = 00000000 acef4ef8, Mem[0000000030081410] = 798483ff 00000000
	stda	%f2 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 acef4ef8
!	Mem[00000000300c1410] = 000000ff, %l4 = ff000000fbf9f9fb
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000021800080] = ffff2e44, %l3 = 0000000000000000
	ldstuba	[%o3+0x080]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000300c1400] = ff0000ff, %l1 = ff0000ffff0000ff
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff0000ff, %l2 = 00000000ffffffff
	lduwa	[%i3+%g0]0x89,%l2	! %l2 = 00000000ff0000ff

p0_label_267:
!	Mem[0000000010041428] = b7d6f9fb, %l6 = ffffffffffffffd6
	ldsb	[%i1+0x029],%l6		! %l6 = ffffffffffffffd6
!	Mem[0000000010001408] = 00000000, %l0 = ffffffffffffffff
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = ff000000, %f15 = ff000000
	ld	[%i5+%o4],%f15	! %f15 = ff000000
!	Mem[0000000030101408] = ff000000, %l7 = 0000ff00ffffff8f
	lduba	[%i4+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0000] = 00ff0847, %l2 = 00000000ff0000ff
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001408] = ff000000, %l0 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010001400] = 109d0000, %l3 = 00000000000000ff
	ldsw	[%i0+%g0],%l3		! %l3 = 00000000109d0000
!	Mem[0000000010101408] = 33d7ffff, %l1 = 00000000ff0000ff
	lduba	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041400] = ff000000da6dd733, %l7 = 00000000000000ff
	ldxa	[%i1+%g0]0x81,%l7	! %l7 = ff000000da6dd733
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000010141408] = 000000ff
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff

p0_label_268:
!	%f14 = 00000000 ff000000, Mem[0000000030081400] = ffffda6d 00000000
	stda	%f14,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 ff000000
!	%l1 = 00000000000000ff, Mem[00000000201c0000] = 00ff0847, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff0847
!	%l6 = ffffffffffffffd6, %l7 = ff000000da6dd733, %l3 = 00000000109d0000
	orn	%l6,%l7,%l3		! %l3 = ffffffffffffffde
!	%f30 = 109da19c 16afb44d, Mem[0000000010181408] = eb000000 00000000
	stda	%f30,[%i6+%o4]0x80	! Mem[0000000010181408] = 109da19c 16afb44d
!	%l0 = ffffffffffffff00, Mem[0000000030001400] = 00000000
	stwa	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffff00
!	%l0 = ffffffffffffff00, Mem[00000000211c0000] = 6bfb58bc
	sth	%l0,[%o2+%g0]		! Mem[00000000211c0000] = ff0058bc
!	Mem[0000000010001410] = 80000000, %l3 = ffffffffffffffde
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 0000000080000000
!	Mem[0000000030181408] = fbf9f9fb, %f12 = ffffffff
	lda	[%i6+%o4]0x89,%f12	! %f12 = fbf9f9fb
!	Mem[0000000030041410] = b7d6f9fb, %l6 = ffffffffffffffd6
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 000000fb000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 9ca19d10, %f27 = 299bb4bb
	lda	[%i6+%o4]0x88,%f27	! %f27 = 9ca19d10

p0_label_269:
!	Mem[0000000030181410] = 068718d8, %l3 = 0000000080000000
	ldswa	[%i6+%o5]0x89,%l3	! %l3 = 00000000068718d8
!	Mem[0000000030081400] = 00000000, %l0 = ffffffffffffff00
	ldsba	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[000000001018143c] = ff000000, %l1 = 00000000000000ff
	lduha	[%i6+0x03e]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800140] = 0000f4c2, %l6 = 00000000000000fb
	ldsha	[%o3+0x140]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = f84eefac 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000 00000000f84eefac
!	Mem[00000000300c1400] = ff0000ffff0000ff, %l3 = 00000000068718d8
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = ff0000ffff0000ff
!	Mem[0000000010141410] = 000000d70000006d, %f20 = 798483ff 00000000
	ldda	[%i5+%o5]0x80,%f20	! %f20 = 000000d7 0000006d
!	Mem[0000000030141410] = 6b6bb8ff, %f8  = ebfb0000
	lda	[%i5+%o5]0x89,%f8 	! %f8 = 6b6bb8ff
!	Mem[00000000211c0000] = ff0058bc, %l4 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010001408] = 00000000
	stwa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000

p0_label_270:
!	Mem[0000000010101420] = d7000000, %l7 = ff000000da6dd733
	swap	[%i4+0x020],%l7		! %l7 = 00000000d7000000
!	Mem[0000000030101410] = af1600ff, %l6 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000af1600ff
!	Mem[00000000211c0001] = ff0058bc, %l3 = ff0000ffff0000ff
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[00000000201c0000] = 00ff0847
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 00ff0847
!	Mem[0000000010001410] = ffffffde, %l2 = 00000000000000ff
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%f24 = ffffd7ff 157839c2, Mem[0000000010041400] = ff000000 00000000
	stda	%f24,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffd7ff 157839c2
!	%l7 = 00000000d7000000, Mem[0000000010081427] = ffa78737, %asi = 80
	stba	%l7,[%i2+0x027]%asi	! Mem[0000000010081424] = ffa78700
!	%l6 = af1600ff, %l7 = d7000000, Mem[00000000100c1400] = 0000ffff 00000000
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = af1600ff d7000000
!	Mem[0000000010001410] = deffffff, %l7 = 00000000d7000000
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 00000000deffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ff000000, %l1 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffff00

p0_label_271:
!	Mem[0000000030141400] = ff0000ff, %f10 = ff000000
	lda	[%i5+%g0]0x89,%f10	! %f10 = ff0000ff
!	Mem[00000000100c1410] = ff000000, %l0 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010101408] = ffffd733, %l7 = 00000000deffffff
	lduba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041438] = b7d6f9fb 9ca19d10, %l0 = ff000000, %l1 = ffffff00
	ldd	[%i1+0x038],%l0		! %l0 = 00000000b7d6f9fb 000000009ca19d10
!	Mem[0000000010001408] = 00000000acef4ef8, %f24 = ffffd7ff 157839c2
	ldda	[%i0+%o4]0x80,%f24	! %f24 = 00000000 acef4ef8
!	Mem[0000000010001438] = ffff00ff, %l0 = 00000000b7d6f9fb
	ldsb	[%i0+0x03b],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000100c1410] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = d51f429a, %l5 = 00000000f84eefac
	ldsha	[%i4+%g0]0x88,%l5	! %l5 = 000000000000429a
!	Mem[0000000030001408] = ff000000 9ca19d10, %l4 = 00000000, %l5 = 0000429a
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 00000000ff000000 000000009ca19d10
!	Starting 10 instruction Store Burst
!	Mem[0000000010101424] = ffd76dda, %l7 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x024]%asi,%l7	! %l7 = 00000000ffd76dda

p0_label_272:
!	Mem[0000000030181400] = a19cffff, %l6 = 00000000af1600ff
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000a19cffff
!	%l0 = ffffffff, %l1 = 9ca19d10, Mem[0000000010181400] = 000000ff fbf9f9fb
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff 9ca19d10
!	Mem[00000000201c0000] = 00ff0847, %l0 = ffffffffffffffff
	ldstub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	%f20 = 000000d7 0000006d, Mem[00000000300c1410] = ff0000ff 00000000
	stda	%f20,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000d7 0000006d
!	%l3 = ffffffffffffffff, Mem[0000000030141400] = ff0000ffff0000ff
	stxa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffffffffffff
!	Mem[0000000010141410] = 000000d7, %l4 = 00000000ff000000
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = 000000ff, %l3 = ffffffffffffffff
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000030141400] = ffffffff ffffffff
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff 000000ff
!	%f12 = fbf9f9fb e923210d, Mem[0000000010181408] = 9ca19d10 4db4af16
	stda	%f12,[%i6+%o4]0x88	! Mem[0000000010181408] = fbf9f9fb e923210d
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = acef4ef8, %l4 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l4	! %l4 = 00000000acef4ef8

p0_label_273:
!	Mem[0000000010041408] = 0d2123e900000000, %f2  = 00000000 acef4ef8
	ldda	[%i1+%o4]0x88,%f2 	! %f2  = 0d2123e9 00000000
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 0000000000000000
	setx	0x2872529799bf2a8a,%g7,%l0 ! %l0 = 2872529799bf2a8a
!	%l1 = 000000009ca19d10
	setx	0x9a26bf5022f06916,%g7,%l1 ! %l1 = 9a26bf5022f06916
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2872529799bf2a8a
	setx	0xb3a9088fd1856ee9,%g7,%l0 ! %l0 = b3a9088fd1856ee9
!	%l1 = 9a26bf5022f06916
	setx	0x0824daa03373700a,%g7,%l1 ! %l1 = 0824daa03373700a
!	Mem[0000000030081400] = 00000000, %l1 = 0824daa03373700a
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181404] = 109da19c, %l1 = 0000000000000000
	ldsb	[%i6+0x005],%l1		! %l1 = ffffffffffffff9d
!	Mem[0000000030041400] = ff000000, %l1 = ffffffffffffff9d
	lduwa	[%i1+%g0]0x81,%l1	! %l1 = 00000000ff000000
!	%f24 = 00000000, %f10 = ff0000ff 00000000
	fstod	%f24,%f10		! %f10 = 00000000 00000000
!	Mem[0000000030001410] = 000000eb, %l0 = b3a9088fd1856ee9
	ldsba	[%i0+%o5]0x89,%l0	! %l0 = ffffffffffffffeb
!	Mem[0000000030181408] = fbf9f9fb, %l5 = 000000009ca19d10
	lduwa	[%i6+%o4]0x81,%l5	! %l5 = 00000000fbf9f9fb
!	Mem[00000000100c141c] = 51f2aaac, %l1 = 00000000ff000000
	lduha	[%i3+0x01e]%asi,%l1	! %l1 = 000000000000aaac
!	Starting 10 instruction Store Burst
!	%l6 = a19cffff, %l7 = ffd76dda, Mem[0000000030081400] = 00000000 ff000000
	stda	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = a19cffff ffd76dda

p0_label_274:
!	%l0 = ffffffffffffffeb, Mem[0000000030141400] = ff000000ff000000
	stxa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffffffffffeb
!	%l5 = 00000000fbf9f9fb, Mem[0000000030001410] = eb000000b7d6f9fb
	stxa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000fbf9f9fb
!	%l2 = 00000000000000ff, Mem[00000000201c0000] = ffff0847, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff0847
!	Mem[0000000030101410] = 00000000, %l6 = 00000000a19cffff
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%f8  = 6b6bb8ff 000000ff, Mem[0000000010081400] = 000000ff ff0000ff
	stda	%f8 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 6b6bb8ff 000000ff
!	%l6 = 00000000, %l7 = ffd76dda, Mem[0000000030181410] = 068718d8 ffb86b5e
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 ffd76dda
!	%f20 = 000000d7 0000006d, Mem[0000000010181410] = f84eefac 6ddaffff
	stda	%f20,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000d7 0000006d
!	Mem[0000000010081400] = ff000000, %l7 = ffd76dda, %l3 = 000000ff
	casa	[%i2]0x80,%l7,%l3	! %l3 = 00000000ff000000
!	Mem[00000000100c1408] = ff0016af, %l2 = 00000000000000ff
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 00000000ff0016af
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 33d76dda af1600ff, %l0 = ffffffeb, %l1 = 0000aaac
	ldda	[%i6+%g0]0x89,%l0	! %l0 = 00000000af1600ff 0000000033d76dda

p0_label_275:
!	Mem[0000000030141400] = ffffffff, %l6 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001400] = 00009d10, %l5 = 00000000fbf9f9fb
	ldswa	[%i0+%g0]0x88,%l5	! %l5 = 0000000000009d10
!	Mem[00000000300c1410] = 6d000000, %f0  = 00000000
	lda	[%i3+%o5]0x81,%f0 	! %f0 = 6d000000
!	Mem[0000000010101410] = ff0016af, %f6  = 00000000
	lda	[%i4+%o5]0x80,%f6 	! %f6 = ff0016af
!	Mem[00000000300c1408] = 00000000fbf9d6b7, %f16 = ffffda6d acef4ef8
	ldda	[%i3+%o4]0x81,%f16	! %f16 = 00000000 fbf9d6b7
!	Mem[0000000030001410] = 00000000, %l5 = 0000000000009d10
	lduha	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = ff000000, %l0 = 00000000af1600ff
	ldsba	[%i3+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101400] = f84eefac00000000, %f18 = 80000000 00000000
	ldda	[%i4+%g0]0x81,%f18	! %f18 = f84eefac 00000000
!	Mem[0000000010001408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 fbf9d6b7, Mem[0000000030141410] = 6b6bb8ff 0000d7ff
	stda	%f16,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 fbf9d6b7

p0_label_276:
!	%l3 = 00000000ff000000, Mem[00000000100c1438] = 037a4374, %asi = 80
	stwa	%l3,[%i3+0x038]%asi	! Mem[00000000100c1438] = ff000000
!	%l6 = ffffffff, %l7 = ffd76dda, Mem[0000000010041408] = 00000000 e923210d
	std	%l6,[%i1+%o4]		! Mem[0000000010041408] = ffffffff ffd76dda
!	%l4 = 00000000acef4ef8, Mem[0000000030001400] = 00ffffff
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = acef4ef8
!	Mem[0000000010181410] = 0000006d, %l7 = 00000000ffd76dda
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 0000006d000000ff
!	Mem[0000000010041408] = ffffffff, %l1 = 0000000033d76dda
	ldstuba	[%i1+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	%l7 = 000000000000006d, Mem[0000000010001410] = 000000d7
	stha	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 006d00d7
!	Mem[0000000030141408] = d7000000, %l4 = 00000000acef4ef8
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l6 = ffffffff, %l7 = 0000006d, Mem[00000000100c1400] = af1600ff d7000000
	std	%l6,[%i3+%g0]		! Mem[00000000100c1400] = ffffffff 0000006d
!	%l1 = 00000000000000ff, Mem[0000000010081400] = ff000000
	stwa	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 6a13e734d51f429a, %l3 = 00000000ff000000
	ldxa	[%i4+%g0]0x88,%l3	! %l3 = 6a13e734d51f429a

p0_label_277:
!	Mem[00000000300c1410] = 000000d7 0000006d, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 000000000000006d 00000000000000d7
!	Mem[00000000201c0000] = 00ff0847, %l6 = ffffffffffffffff
	ldsh	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010141408] = 000000ff, %l5 = 00000000000000d7
	ldsha	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101408] = ffffffff, %l1 = 00000000000000ff
	lduwa	[%i4+%o4]0x81,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010041410] = bb000000 00000000, %l6 = 000000ff, %l7 = 0000006d
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 00000000bb000000 0000000000000000
!	Mem[0000000021800140] = 0000f4c2, %l7 = 0000000000000000
	lduh	[%o3+0x140],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141408] = 00000000 000000ff, %l2 = ff0016af, %l3 = d51f429a
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000010001430] = 00000000b7d6f9fb, %l4 = 000000000000006d
	ldx	[%i0+0x030],%l4		! %l4 = 00000000b7d6f9fb
!	Mem[0000000030041400] = ff000000, %l3 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffffffff, Mem[00000000300c1410] = 6d000000
	stha	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffff0000

p0_label_278:
!	Mem[0000000010001428] = 00000000, %l1 = ffffffff, %l4 = b7d6f9fb
	add	%i0,0x28,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0001] = 00ff0847, %l6 = 00000000bb000000
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	%f30 = 109da19c 16afb44d, %l7 = 0000000000000000
!	Mem[0000000010041418] = 982a3c92000000ff
	add	%i1,0x018,%g1
	stda	%f30,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010041418] = 982a3c92000000ff
!	Mem[0000000030081410] = 00000000, %l3 = ffffffffffffffff
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l1 = 00000000ffffffff, Mem[0000000030081410] = ffffffff
	stba	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffff
!	%l6 = 00000000000000ff, Mem[0000000030101400] = acef4ef8
	stwa	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	%l4 = 0000000000000000, Mem[0000000030101400] = 00000000000000ff
	stxa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000000
!	%f8  = 6b6bb8ff, Mem[0000000010081408] = 000000ff
	sta	%f8 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 6b6bb8ff
!	Mem[0000000010141408] = ff000000, %l4 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 00000000 00003c3b, %l0 = ffffffff, %l1 = ffffffff
	ldda	[%i5+0x018]%asi,%l0	! %l0 = 0000000000000000 0000000000003c3b

p0_label_279:
!	Mem[0000000030101410] = 00000000000000ff, %l6 = 00000000000000ff
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = 00ff0847, %l7 = 0000000000000000
	ldub	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000030181408] = fbf9f9fb, %l2 = 00000000000000ff
	ldsba	[%i6+%o4]0x81,%l2	! %l2 = fffffffffffffffb
!	Mem[0000000030141400] = ffffffff, %l0 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030041400] = ff000000, %l6 = 00000000000000ff
	ldsha	[%i1+%g0]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010001410] = 00000000 d7006d00, %l2 = fffffffb, %l3 = 00000000
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 00000000d7006d00 0000000000000000
!	Mem[0000000010101408] = ffffd733, %l7 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l7	! %l7 = 00000000ffffd733
!	Mem[0000000030001410] = 00000000, %l2 = 00000000d7006d00
	swapa	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001418] = 00000000, %f5  = ff000000
	ld	[%i0+0x018],%f5 	! %f5 = 00000000
!	Starting 10 instruction Store Burst
!	%f9  = 000000ff, Mem[0000000010141408] = 00000000
	sta	%f9 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff

p0_label_280:
!	%f8  = 6b6bb8ff 000000ff, Mem[0000000010001400] = 00009d10 fbf9f9fb
	stda	%f8 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 6b6bb8ff 000000ff
!	Mem[00000000100c1400] = ffffffff, %l1 = 0000000000003c3b
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 00000000ffffffff
!	%f0  = 6d000000 ff00005e, Mem[00000000300c1410] = 0000ffff 000000d7
	stda	%f0 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 6d000000 ff00005e
!	Mem[0000000030181400] = af1600ff, %l2 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010001400] = ff000000, %l2 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000300c1408] = 00000000, %l1 = 00000000ffffffff
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%f28 = 0d2123e9, Mem[00000000300c1408] = ffffffff
	sta	%f28,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0d2123e9
!	%l5 = 00000000000000ff, Mem[00000000201c0001] = 00ff0847
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = 00ff0847
!	Mem[0000000030181400] = af1600ff, %l5 = 00000000000000ff
	ldstuba	[%i6+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_281:
!	Mem[0000000030041410] = fff9d6b7, %l1 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l1	! %l1 = 000000000000fff9
!	Mem[0000000020800040] = ffd74bbb, %l2 = 00000000000000ff
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffffffd7
!	Mem[00000000100c1410] = ff0000006d000000, %l6 = ffffffffffffff00
	ldxa	[%i3+%o5]0x80,%l6	! %l6 = ff0000006d000000
!	Mem[00000000211c0000] = ffff58bc, %l6 = ff0000006d000000
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[00000000201c0000] = 00ff0847, %l5 = 00000000000000ff
	ldsb	[%o0+0x001],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000300c1400] = ff0000ffff0000ff, %l1 = 000000000000fff9
	ldxa	[%i3+%g0]0x81,%l1	! %l1 = ff0000ffff0000ff
!	Mem[0000000010181408] = 0d2123e9, %l5 = ffffffffffffffff
	ldsha	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000d21
!	Mem[000000001000142c] = ff000000, %l6 = 000000000000ffff
	ldsw	[%i0+0x02c],%l6		! %l6 = ffffffffff000000
!	Mem[0000000010081400] = ff000000, %l3 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l3	! %l3 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 3b3c0000, %l7 = 00000000ffffd733
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 000000003b3c0000

p0_label_282:
!	%l7 = 000000003b3c0000, Mem[00000000100c1400] = 33d7ffff
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 3b3c0000
!	Mem[0000000010041428] = b7d6f9fb4e4f5db7, %l5 = 0000000000000d21, %l6 = ffffffffff000000
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = b7d6f9fb4e4f5db7
!	Mem[0000000010041400] = ffd7ffff, %l4 = 00000000ff000000
	ldstuba	[%i1+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	%l5 = 0000000000000d21, Mem[0000000010141400] = ebfb0000
	stw	%l5,[%i5+%g0]		! Mem[0000000010141400] = 00000d21
!	%l0 = ffffffff, %l1 = ff0000ff, Mem[0000000010181420] = da6dd7ff ff0000ff
	std	%l0,[%i6+0x020]		! Mem[0000000010181420] = ffffffff ff0000ff
!	%f30 = 109da19c 16afb44d, Mem[0000000010081410] = ffd7ff00 ff0000ff
	stda	%f30,[%i2+%o5]0x88	! Mem[0000000010081410] = 109da19c 16afb44d
!	%l0 = ffffffff, %l1 = ff0000ff, Mem[00000000100c1410] = 000000ff 0000006d
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffffff ff0000ff
!	%l7 = 000000003b3c0000, Mem[0000000010041408] = ffffffff
	stwa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 3b3c0000
!	%f2  = 0d2123e9 00000000, Mem[0000000010041410] = 000000bb 00000000
	stda	%f2 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 0d2123e9 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff000000, %l1 = ff0000ffff0000ff
	lduha	[%i4+%o5]0x81,%l1	! %l1 = 000000000000ff00

p0_label_283:
!	Mem[0000000030101410] = ff000000, %l5 = 0000000000000d21
	lduwa	[%i4+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	%l6 = b7d6f9fb4e4f5db7, %l6 = b7d6f9fb4e4f5db7, %y  = 00000000
	umul	%l6,%l6,%l0		! %l0 = 17f475b67d4078d1, %y = 17f475b6
!	Mem[0000000010041408] = 00003c3b, %l0 = 17f475b67d4078d1
	ldswa	[%i1+%o4]0x88,%l0	! %l0 = 0000000000003c3b
!	Mem[0000000010181430] = 00ff0089, %l0 = 0000000000003c3b
	lduwa	[%i6+0x030]%asi,%l0	! %l0 = 0000000000ff0089
!	Mem[0000000010181410] = 000000d7 000000ff, %l4 = 000000ff, %l5 = ff000000
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff 00000000000000d7
!	Mem[0000000030141400] = ffffffff, %l7 = 000000003b3c0000
	ldsba	[%i5+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000021800180] = ff84809b, %l5 = 00000000000000d7
	lduha	[%o3+0x180]%asi,%l5	! %l5 = 000000000000ff84
!	Mem[0000000010001400] = 6b6bb8ff000000ff, %f26 = 74592f4e 9ca19d10
	ldda	[%i0+%g0]0x88,%f26	! %f26 = 6b6bb8ff 000000ff
!	Mem[00000000300c1400] = ff0000ff, %l0 = 0000000000ff0089
	ldsba	[%i3+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 0000ff84, Mem[0000000010001430] = 00000000 b7d6f9fb
	stda	%l4,[%i0+0x030]%asi	! Mem[0000000010001430] = 000000ff 0000ff84

p0_label_284:
!	%l0 = ffffffffffffffff, Mem[00000000218000c0] = 6d45f510, %asi = 80
	stba	%l0,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = ff45f510
!	Mem[00000000300c1410] = 5e0000ff, %l4 = 00000000000000ff
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 000000005e0000ff
!	Mem[0000000010101400] = 9a421fd5, %l2 = ffffffffffffffd7, %asi = 80
	swapa	[%i4+0x000]%asi,%l2	! %l2 = 000000009a421fd5
!	%l5 = 000000000000ff84, Mem[0000000010101433] = 00000000, %asi = 80
	stba	%l5,[%i4+0x033]%asi	! Mem[0000000010101430] = 00000084
!	%l2 = 000000009a421fd5, Mem[0000000010101410] = af1600ff
	stha	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = af161fd5
!	%l1 = 000000000000ff00, Mem[0000000021800000] = ff00951b
	sth	%l1,[%o3+%g0]		! Mem[0000000021800000] = ff00951b
!	Mem[0000000010001400] = ff000000, %l7 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000100c141c] = 51f2aaac, %l4 = 000000005e0000ff
	ldstuba	[%i3+0x01c]%asi,%l4	! %l4 = 00000051000000ff
!	%l4 = 0000000000000051, Mem[0000000030181400] = af1600ff
	stha	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = af160051
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = fbf9f9fb 00000000, %l2 = 9a421fd5, %l3 = ff000000
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 00000000fbf9f9fb 0000000000000000

p0_label_285:
!	Mem[00000000300c1400] = ff0000ffff0000ff, %l0 = ffffffffffffffff
	ldxa	[%i3+%g0]0x81,%l0	! %l0 = ff0000ffff0000ff
!	Mem[0000000010041408] = 3b3c0000, %f29 = 34e7136a
	lda	[%i1+%o4]0x80,%f29	! %f29 = 3b3c0000
!	Mem[0000000030041410] = fff9d6b7, %l6 = b7d6f9fb4e4f5db7
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = fffffffffffffff9
!	Mem[0000000030101400] = 00000000, %l5 = 000000000000ff84
	lduwa	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = af161fd5, %l2 = 00000000fbf9f9fb
	lduba	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000d5
!	Mem[0000000010041410] = 00000000, %f24 = 00000000
	lda	[%i1+%o5]0x80,%f24	! %f24 = 00000000
!	Code Fragment 3
p0_fragment_10:
!	%l0 = ff0000ffff0000ff
	setx	0xb8097cf7e130e21d,%g7,%l0 ! %l0 = b8097cf7e130e21d
!	%l1 = 000000000000ff00
	setx	0x0e62375ff9ec2040,%g7,%l1 ! %l1 = 0e62375ff9ec2040
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b8097cf7e130e21d
	setx	0x228f2d304a79b39e,%g7,%l0 ! %l0 = 228f2d304a79b39e
!	%l1 = 0e62375ff9ec2040
	setx	0xb2fc5c0ff0f80337,%g7,%l1 ! %l1 = b2fc5c0ff0f80337
!	Mem[0000000010001420] = da6dd7ff000000d7, %f30 = 109da19c 16afb44d
	ldda	[%i0+0x020]%asi,%f30	! %f30 = da6dd7ff 000000d7
!	Mem[0000000030081410] = ffffffff, %l4 = 0000000000000051
	ldsha	[%i2+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000d5, Mem[0000000030181408] = fbf9f9fb
	stba	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = d5f9f9fb

p0_label_286:
!	%l1 = b2fc5c0ff0f80337, Mem[0000000030041410] = fff9d6b7
	stha	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 0337d6b7
!	Mem[0000000020800041] = ffd74bbb, %l7 = 00000000000000ff
	ldstub	[%o1+0x041],%l7		! %l7 = 000000d7000000ff
!	%l4 = ffffffffffffffff, Mem[00000000300c1400] = ff0000ffff0000ff
	stxa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffffffffffff
!	%l2 = 000000d5, %l3 = 00000000, Mem[0000000030001410] = d7006d00 fbf9f9fb
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000d5 00000000
!	Mem[0000000010001410] = d7006d00, %l7 = 00000000000000d7
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030001410] = d5000000
	stba	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = d5000000
!	Mem[0000000021800100] = 00eb8452, %l0 = 228f2d304a79b39e
	ldstub	[%o3+0x100],%l0		! %l0 = 00000000000000ff
!	%f2  = 0d2123e9 00000000, %l4 = ffffffffffffffff
!	Mem[0000000030001430] = 6a13e734e923210d
	add	%i0,0x030,%g1
	stda	%f2,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030001430] = 00000000e923210d
!	%f16 = 00000000 fbf9d6b7, Mem[0000000030101400] = 00000000 00000000
	stda	%f16,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 fbf9d6b7
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 5e0000ff0000006d, %l2 = 00000000000000d5
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = 5e0000ff0000006d

p0_label_287:
!	Mem[0000000010181430] = 00ff0089, %l3 = 0000000000000000
	ldsh	[%i6+0x030],%l3		! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = 000000ff, %l6 = fffffffffffffff9
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030041410] = b7d63703, %l2 = 5e0000ff0000006d
	ldsha	[%i1+%o5]0x89,%l2	! %l2 = 0000000000003703
!	Mem[00000000211c0000] = ffff58bc, %l7 = 0000000000000000
	lduba	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = ff00000000000000, %l3 = 00000000000000ff
	ldxa	[%i3+%o4]0x80,%l3	! %l3 = ff00000000000000
!	Mem[0000000010041408] = 3b3c0000, %l7 = 00000000000000ff
	ldsba	[%i1+%o4]0x80,%l7	! %l7 = 000000000000003b
!	Mem[0000000010001400] = ff000000, %l7 = 000000000000003b
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010041408] = 3b3c0000, %l6 = ffffffffffffffff
	ldsha	[%i1+%o4]0x80,%l6	! %l6 = 0000000000003b3c
!	Mem[00000000100c1408] = 000000ff, %l2 = 0000000000003703
	lduha	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f22 = ff0000ff 8788c6cd, Mem[0000000030101410] = ff000000 00000000
	stda	%f22,[%i4+%o5]0x81	! Mem[0000000030101410] = ff0000ff 8788c6cd

p0_label_288:
!	Mem[0000000030101408] = ffffffff, %l3 = ff00000000000000
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010041428] = b7d6f9fb, %l6 = 00003b3c, %l3 = 000000ff
	add	%i1,0x28,%g1
	casa	[%g1]0x80,%l6,%l3	! %l3 = 00000000b7d6f9fb
!	%l6 = 0000000000003b3c, %l4 = ffffffffffffffff, %l4 = ffffffffffffffff
	sub	%l6,%l4,%l4		! %l4 = 0000000000003b3d
!	%f6  = ff0016af 000000ff, Mem[0000000010181410] = ff000000 d7000000
	stda	%f6 ,[%i6+%o5]0x80	! Mem[0000000010181410] = ff0016af 000000ff
!	%f12 = fbf9f9fb e923210d, Mem[0000000030041400] = 000000ff 33d76dda
	stda	%f12,[%i1+%g0]0x89	! Mem[0000000030041400] = fbf9f9fb e923210d
!	%f22 = ff0000ff 8788c6cd, Mem[00000000100c1438] = ff000000 d8188706
	std	%f22,[%i3+0x038]	! Mem[00000000100c1438] = ff0000ff 8788c6cd
!	%l1 = b2fc5c0ff0f80337, Mem[0000000020800001] = d7ff261d
	stb	%l1,[%o1+0x001]		! Mem[0000000020800000] = d737261d
!	%l1 = b2fc5c0ff0f80337, Mem[0000000010081403] = 000000ff
	stb	%l1,[%i2+0x003]		! Mem[0000000010081400] = 00000037
!	%l4 = 0000000000003b3d, Mem[0000000010141400] = 00000000210d0000
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000003b3d
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = 000000ff, %l6 = 0000000000003b3c
	lduba	[%i0+0x031]%asi,%l6	! %l6 = 0000000000000000

p0_label_289:
!	Mem[00000000300c1410] = ff00005e, %l1 = b2fc5c0ff0f80337
	ldsba	[%i3+%o5]0x89,%l1	! %l1 = 000000000000005e
!	Mem[0000000010041430] = 00000000 af160000, %l6 = 00000000, %l7 = 0000ff00
	ldda	[%i1+0x030]%asi,%l6	! %l6 = 0000000000000000 00000000af160000
!	Mem[000000001004143c] = 9ca19d10, %l0 = 0000000000000000
	ldub	[%i1+0x03c],%l0		! %l0 = 000000000000009c
!	Mem[0000000010041428] = b7d6f9fb 4e4f5db7, %l6 = 00000000, %l7 = af160000
	ldd	[%i1+0x028],%l6		! %l6 = 00000000b7d6f9fb 000000004e4f5db7
!	Mem[0000000010141400] = 0000000000003b3d, %f14 = 00000000 ff000000
	ldda	[%i5+%g0]0x88,%f14	! %f14 = 00000000 00003b3d
!	Mem[00000000300c1408] = 0d2123e9, %l3 = 00000000b7d6f9fb
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 000000000d2123e9
!	Mem[00000000300c1400] = ffffffff, %l6 = 00000000b7d6f9fb
	lduha	[%i3+%g0]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030001410] = 000000d5 00000000, %l2 = 000000ff, %l3 = 0d2123e9
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 00000000000000d5 0000000000000000
!	Mem[0000000010001410] = d7006dff, %l3 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000006dff
!	Starting 10 instruction Store Burst
!	%l6 = 0000ffff, %l7 = 4e4f5db7, Mem[0000000010001400] = 000000ff 6b6bb8ff
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000ffff 4e4f5db7

p0_label_290:
!	%l3 = 0000000000006dff, Mem[0000000010101400] = ffffffd7
	stha	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 6dffffd7
!	%l5 = 0000000000000000, Mem[0000000010041400] = ffd7ffff
	stha	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = ffd70000
!	Mem[0000000030081410] = ffffffff, %l3 = 0000000000006dff
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010001430] = 000000ff, %l4 = 0000000000003b3d, %asi = 80
	swapa	[%i0+0x030]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000201c0001] = 00ff0847, %l3 = 00000000ffffffff
	ldstub	[%o0+0x001],%l3		! %l3 = 000000ff000000ff
!	%l7 = 000000004e4f5db7, Mem[00000000300c1400] = ffffffff
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 4e4f5db7
!	%f17 = fbf9d6b7, Mem[0000000030001410] = 000000d5
	sta	%f17,[%i0+%o5]0x81	! Mem[0000000030001410] = fbf9d6b7
!	Mem[0000000030041408] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030041400] = 0d2123e9, %l3 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 0000000d000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff0847, %l1 = 000000000000005e
	lduh	[%o0+%g0],%l1		! %l1 = 00000000000000ff

p0_label_291:
!	Mem[0000000021800100] = ffeb8452, %l5 = 0000000000000000
	ldub	[%o3+0x101],%l5		! %l5 = 00000000000000eb
!	Mem[0000000030001400] = acef4ef8, %l0 = 000000000000009c
	lduwa	[%i0+%g0]0x81,%l0	! %l0 = 00000000acef4ef8
!	Mem[0000000010081420] = 390000d7 ffa78700, %l6 = 0000ffff, %l7 = 4e4f5db7
	ldd	[%i2+0x020],%l6		! %l6 = 00000000390000d7 00000000ffa78700
!	Mem[0000000010041418] = 982a3c92000000ff, %l1 = 00000000000000ff
	ldxa	[%i1+0x018]%asi,%l1	! %l1 = 982a3c92000000ff
!	Mem[0000000010081408] = 6b6bb8ff, %f12 = fbf9f9fb
	lda	[%i2+%o4]0x88,%f12	! %f12 = 6b6bb8ff
!	Mem[0000000030081410] = ff6d0000, %l5 = 00000000000000eb
	lduha	[%i2+%o5]0x81,%l5	! %l5 = 000000000000ff6d
!	Mem[0000000010141400] = 3d3b0000, %l4 = 00000000000000ff
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 000000000000003d
!	Mem[00000000100c1428] = 982aff92, %f29 = 3b3c0000
	lda	[%i3+0x028]%asi,%f29	! %f29 = 982aff92
!	Mem[0000000010101410] = d51f16af, %l5 = 000000000000ff6d
	ldsba	[%i4+0x011]%asi,%l5	! %l5 = 000000000000001f
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 000000ff, %l5 = 000000000000001f
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 000000ff000000ff

p0_label_292:
!	%l6 = 00000000390000d7, Mem[0000000010141400] = 0000000000003b3d
	stxa	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000390000d7
!	%f3  = 00000000, Mem[0000000030001408] = 000000ff
	sta	%f3 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%f20 = 000000d7 0000006d, %l7 = 00000000ffa78700
!	Mem[0000000010181410] = ff0016af000000ff
	add	%i6,0x010,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_P ! Mem[0000000010181410] = ff0016af000000ff
!	%l3 = 000000000000000d, Mem[0000000010041400] = 0000d7ff
	stha	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 000dd7ff
!	%l3 = 000000000000000d, Mem[0000000010081410] = 16afb44d
	stwa	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000d
!	Mem[0000000021800080] = ffff2e44, %l5 = 00000000000000ff
	ldstub	[%o3+0x080],%l5		! %l5 = 000000ff000000ff
!	%l0 = 00000000acef4ef8, Mem[0000000010101410] = 505214ffaf161fd5
	stxa	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000acef4ef8
!	Mem[0000000010081400] = 00000037, %l6 = 00000000390000d7, %asi = 80
	swapa	[%i2+0x000]%asi,%l6	! %l6 = 0000000000000037
!	%l4 = 000000000000003d, Mem[0000000010081410] = 109da19c0000000d
	stxa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000000000003d
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff00005e, %l5 = 00000000000000ff
	ldsba	[%i3+%o5]0x89,%l5	! %l5 = 000000000000005e

p0_label_293:
!	Mem[0000000010041420] = d7000000ffd76dda, %l4 = 000000000000003d
	ldxa	[%i1+0x020]%asi,%l4	! %l4 = d7000000ffd76dda
!	Mem[0000000010141408] = 000000ff, %l6 = 0000000000000037
	ldswa	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101400] = 00000000 fbf9d6b7, %l6 = 000000ff, %l7 = ffa78700
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000 00000000fbf9d6b7
!	Mem[0000000010181408] = 0d2123e9, %l4 = d7000000ffd76dda
	ldsha	[%i6+0x008]%asi,%l4	! %l4 = 0000000000000d21
!	Mem[000000001018141c] = da6dd733, %l6 = 0000000000000000
	ldsba	[%i6+0x01d]%asi,%l6	! %l6 = 000000000000006d
!	Mem[0000000010041410] = 00000000, %l2 = 00000000000000d5
	lduwa	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = ffffffff, %l3 = 000000000000000d
	lduba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = ff000000, %l7 = 00000000fbf9d6b7
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = ffffffffff000000
!	Mem[0000000030181410] = ffd76dda 00000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000000 00000000ffd76dda
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 00000000acef4ef8
	setx	0xe9e89e806ccab655,%g7,%l0 ! %l0 = e9e89e806ccab655
!	%l1 = 982a3c92000000ff
	setx	0x9a7262f86a3409b2,%g7,%l1 ! %l1 = 9a7262f86a3409b2
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e9e89e806ccab655
	setx	0x71504a0026dda731,%g7,%l0 ! %l0 = 71504a0026dda731
!	%l1 = 9a7262f86a3409b2
	setx	0x18dceedf856855db,%g7,%l1 ! %l1 = 18dceedf856855db

p0_label_294:
!	Mem[00000000100c1400] = 3b3c0000, %l3 = 00000000ffd76dda
	ldstuba	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%f18 = f84eefac 00000000, Mem[0000000010001410] = ff6d00d7 00000000
	std	%f18,[%i0+%o5]	! Mem[0000000010001410] = f84eefac 00000000
!	%f4  = ffb86b5e 00000000, Mem[0000000030141400] = ffffffff ebffffff
	stda	%f4 ,[%i5+%g0]0x89	! Mem[0000000030141400] = ffb86b5e 00000000
!	Mem[0000000030181400] = af160051, %l6 = 000000000000006d
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000af160051
!	%l5 = 000000000000005e, Mem[0000000030141410] = fbf9d6b7
	stba	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = fbf9d65e
!	%f14 = 00000000 00003b3d, %l2 = 0000000000000000
!	Mem[0000000010041430] = 00000000af160000
	add	%i1,0x030,%g1
	stda	%f14,[%g1+%l2]ASI_PST16_P ! Mem[0000000010041430] = 00000000af160000
!	%l6 = 00000000af160051, Mem[0000000010081410] = 0000003d
	stwa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = af160051
!	%f6  = ff0016af 000000ff, Mem[0000000010101408] = ffffd733 000000ff
	stda	%f6 ,[%i4+%o4]0x80	! Mem[0000000010101408] = ff0016af 000000ff
!	%f10 = 00000000 00000000, Mem[0000000010041410] = 00000000 0d2123e9
	stda	%f10,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = e92321ff, %l6 = 00000000af160051
	lduwa	[%i1+%g0]0x89,%l6	! %l6 = 00000000e92321ff

p0_label_295:
!	Mem[00000000300c1400] = b75d4f4e, %l1 = 18dceedf856855db
	lduba	[%i3+%g0]0x89,%l1	! %l1 = 000000000000004e
!	Mem[0000000010001400] = 4e4f5db70000ffff, %l2 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l2	! %l2 = 4e4f5db70000ffff
!	Mem[0000000010001400] = ffff0000, %l5 = 000000000000005e
	lduha	[%i0+%g0]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030101400] = 00000000, %l3 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800040] = ffff4bbb, %l1 = 000000000000004e
	lduh	[%o1+0x040],%l1		! %l1 = 000000000000ffff
	membar	#Sync			! Added by membar checker (49)
!	Mem[0000000010141400] = d7000039 00000000 ff000000 00000000
!	Mem[0000000010141410] = ff0000d7 0000006d 00000000 00003c3b
!	Mem[0000000010141420] = cbe0ff00 ff0000ff 000000ff 16afb44d
!	Mem[0000000010141430] = ffff6e00 000000ff 9a421fd5 000000ff
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000030001410] = b7d6f9fb, %l7 = ffffffffff000000
	ldsba	[%i0+%o5]0x89,%l7	! %l7 = fffffffffffffffb
!	Mem[00000000100c1414] = ff0000ff, %l2 = 4e4f5db70000ffff
	lduh	[%i3+0x016],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030001400] = 9a421fd5f84eefac, %l3 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l3	! %l3 = 9a421fd5f84eefac
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000ffff, Mem[0000000010041410] = 00000000
	stba	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff

p0_label_296:
!	%f11 = 00000000, Mem[00000000300c1400] = 4e4f5db7
	sta	%f11,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l1 = 000000000000ffff, Mem[00000000300c1408] = fbf9d6b7
	stha	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = fbf9ffff
!	%l6 = 00000000e92321ff, Mem[0000000030101410] = ff0000ff
	stba	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = ff0000ff
!	Mem[00000000211c0000] = ffff58bc, %l2 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010081408] = 6b6bb8ff, %l2 = 00000000000000ff
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%l3 = 9a421fd5f84eefac, Mem[00000000300c1400] = 00000000
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = ac000000
!	%l6 = 00000000e92321ff, Mem[0000000010041410] = 00000000000000ff
	stxa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000e92321ff
!	%l3 = 9a421fd5f84eefac, Mem[0000000030101408] = ffffffff
	stha	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffefac
!	%l3 = 9a421fd5f84eefac, Mem[0000000010101430] = 00000084af160000
	stx	%l3,[%i4+0x030]		! Mem[0000000010101430] = 9a421fd5f84eefac
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 0d2123e9, %l6 = 00000000e92321ff
	ldsb	[%i6+0x009],%l6		! %l6 = 0000000000000021

p0_label_297:
!	Mem[0000000010041410] = ff2123e9, %l4 = 0000000000000d21
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = ff000000, %l3 = 9a421fd5f84eefac
	ldswa	[%i5+%o4]0x80,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010081408] = 00000000 6b6bb8ff, %l0 = 26dda731, %l1 = 0000ffff
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 000000006b6bb8ff 0000000000000000
!	Mem[0000000030081410] = f84eefac00006dff, %l2 = 00000000000000ff
	ldxa	[%i2+%o5]0x89,%l2	! %l2 = f84eefac00006dff
!	Mem[0000000010141408] = ff00000000000000, %f4  = ffb86b5e 00000000
	ldd	[%i5+%o4],%f4 		! %f4  = ff000000 00000000
!	Mem[0000000030081410] = 00006dff, %f0  = 6d000000
	lda	[%i2+%o5]0x89,%f0 	! %f0 = 00006dff
!	Mem[0000000010081400] = 390000d7, %l7 = fffffffffffffffb
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = 00000000390000d7
!	Mem[00000000100c1410] = ffffffff, %l4 = ffffffffffffffff
	lduba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[000000001018142c] = 0000ff00, %l0 = 000000006b6bb8ff
	lduba	[%i6+0x02f]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f10 = 00000000 00000000, Mem[0000000030101408] = acefffff ff00b8ff
	stda	%f10,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 00000000

p0_label_298:
!	Mem[000000001000143a] = ffff00ff, %l0 = 0000000000000000
	ldstuba	[%i0+0x03a]%asi,%l0	! %l0 = 00000000000000ff
!	%l4 = 000000ff, %l5 = 0000ffff, Mem[0000000030081400] = ffff9ca1 da6dd7ff
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff 0000ffff
!	Mem[0000000030041410] = b7d63703, %l2 = f84eefac00006dff
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 00000003000000ff
!	%l4 = 00000000000000ff, Mem[0000000010081408] = 000000006b6bb8ff
	stxa	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000ff
	membar	#Sync			! Added by membar checker (50)
!	%l4 = 00000000000000ff, Mem[0000000010141410] = d70000ff
	stwa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	Mem[0000000030181410] = 00000000, %l3 = ffffffffff000000
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%f5  = 00000000, Mem[0000000030081408] = 00000000
	sta	%f5 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	Mem[0000000010101420] = da6dd733, %l0 = 00000000, %l5 = 0000ffff
	add	%i4,0x20,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000da6dd733
!	%l7 = 00000000390000d7, Mem[0000000030141410] = 5ed6f9fb
	stba	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = d7d6f9fb
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 3b3c0000, %l5 = 00000000da6dd733
	lduwa	[%i1+%o4]0x80,%l5	! %l5 = 000000003b3c0000

p0_label_299:
!	Mem[0000000010001400] = ffff0000 b75d4f4e, %l4 = 000000ff, %l5 = 3b3c0000
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 00000000ffff0000 00000000b75d4f4e
!	Mem[000000001018141c] = da6dd733, %l6 = 0000000000000021
	lduba	[%i6+0x01d]%asi,%l6	! %l6 = 000000000000006d
!	Mem[0000000010081400] = 6b6bb8ffd7000039, %f28 = ffff6e00 000000ff
	ldda	[%i2+%g0]0x88,%f28	! %f28 = 6b6bb8ff d7000039
!	Mem[0000000010101430] = 9a421fd5f84eefac, %f18 = ff000000 00000000
	ldda	[%i4+0x030]%asi,%f18	! %f18 = 9a421fd5 f84eefac
!	Mem[0000000010181400] = ffffffff, %l2 = 0000000000000003
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ff0847, %l4 = 00000000ffff0000
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = ff37d6b75e6bb8ff, %l2 = ffffffffffffffff
	ldxa	[%i1+%o5]0x81,%l2	! %l2 = ff37d6b75e6bb8ff
!	Mem[0000000030141408] = d70000ff, %l6 = 000000000000006d
	lduha	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181408] = e923210d, %l4 = 00000000000000ff
	ldswa	[%i6+%o4]0x88,%l4	! %l4 = ffffffffe923210d
!	Starting 10 instruction Store Burst
!	%l7 = 00000000390000d7, Mem[0000000010101433] = 9a421fd5
	stb	%l7,[%i4+0x033]		! Mem[0000000010101430] = 9a421fd7

p0_label_300:
!	Mem[0000000010141400] = 390000d7, %l4 = ffffffffe923210d
	swapa	[%i5+%g0]0x88,%l4	! %l4 = 00000000390000d7
!	Mem[000000001004141c] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i1+0x01c]%asi,%l0	! %l0 = 00000000000000ff
!	%l4 = 00000000390000d7, Mem[0000000030181410] = 000000ff
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = d70000ff
!	%l1 = 0000000000000000, Mem[000000001018142a] = 9a421fd5
	sth	%l1,[%i6+0x02a]		! Mem[0000000010181428] = 9a420000
!	%l6 = 00000000000000ff, Mem[00000000211c0000] = ffff58bc
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 00ff58bc
!	Mem[0000000020800040] = ffff4bbb, %l4 = 00000000390000d7
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000020800000] = d737261d, %l6 = 00000000000000ff
	ldstub	[%o1+%g0],%l6		! %l6 = 000000d7000000ff
!	Mem[000000001000141a] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i0+0x01a]%asi,%l3	! %l3 = 00000000000000ff
!	%f0  = 00006dff ff00005e, Mem[00000000100c1408] = 000000ff 00000000
	stda	%f0 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00006dff ff00005e
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = d70000ff, %f22 = 00000000
	lda	[%i6+%o5]0x81,%f22	! %f22 = d70000ff

p0_label_301:
!	Mem[000000001010143c] = 9ca1ff10, %l3 = 0000000000000000
	lduw	[%i4+0x03c],%l3		! %l3 = 000000009ca1ff10
!	Mem[000000001010140c] = 000000ff, %l5 = 00000000b75d4f4e
	lduw	[%i4+0x00c],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010181414] = 000000ff, %l7 = 00000000390000d7
	lduw	[%i6+0x014],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030101400] = b7d6f9fb00000000, %f12 = 6b6bb8ff e923210d
	ldda	[%i4+%g0]0x89,%f12	! %f12 = b7d6f9fb 00000000
!	Mem[0000000010101408] = ff0016af, %l4 = 00000000000000ff
	lduba	[%i4+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181420] = ffffffff, %l7 = 00000000000000ff
	ldsba	[%i6+0x022]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101404] = 34e7136a, %f1  = ff00005e
	ld	[%i4+0x004],%f1 	! %f1 = 34e7136a
!	Mem[0000000010041400] = 000dd7ff, %f12 = b7d6f9fb
	lda	[%i1+%g0]0x80,%f12	! %f12 = 000dd7ff
!	Mem[0000000010141410] = ff000000, %l6 = 00000000000000d7
	ldsh	[%i5+0x012],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffff, Mem[0000000010141408] = ff00000000000000
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffffffffffff

p0_label_302:
!	%l6 = 0000000000000000, Mem[0000000030101408] = 00000000
	stwa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	Mem[0000000010101408] = ff0016af, %f14 = 00000000
	lda	[%i4+%o4]0x80,%f14	! %f14 = ff0016af
!	Mem[0000000010081400] = 390000d7, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 00000039000000ff
!	%f2  = 0d2123e9 00000000, Mem[00000000100c1410] = ffffffff ff0000ff
	stda	%f2 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0d2123e9 00000000
!	Mem[0000000010041400] = 000dd7ff, %l4 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141410] = 000000ff, %l2 = ff37d6b75e6bb8ff
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101410] = acef4ef8, %l7 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 000000f8000000ff
!	%l2 = 000000ff, %l3 = 9ca1ff10, Mem[0000000030101400] = 00000000 fbf9d6b7
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff 9ca1ff10
!	Mem[0000000010101400] = d7ffff6d, %l3 = 000000009ca1ff10
	swapa	[%i4+%g0]0x88,%l3	! %l3 = 00000000d7ffff6d
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = e923210d, %l3 = 00000000d7ffff6d
	ldswa	[%i6+%o4]0x88,%l3	! %l3 = ffffffffe923210d

p0_label_303:
!	Mem[0000000010041400] = c2397815ffd70dff, %l0 = 0000000000000000
	ldxa	[%i1+%g0]0x88,%l0	! %l0 = c2397815ffd70dff
!	Mem[0000000030181410] = ffd76ddaff0000d7, %l6 = 0000000000000000
	ldxa	[%i6+%o5]0x89,%l6	! %l6 = ffd76ddaff0000d7
!	Mem[0000000020800000] = ff37261d, %l0 = c2397815ffd70dff
	ldub	[%o1+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010081418] = 0000ff00, %l7 = 00000000000000f8
	ldsh	[%i2+0x01a],%l7		! %l7 = ffffffffffffff00
!	Mem[0000000010041408] = 3b3c0000, %f29 = d7000039
	lda	[%i1+0x008]%asi,%f29	! %f29 = 3b3c0000
!	Mem[00000000300c1408] = fbf9ffff, %l6 = ffd76ddaff0000d7
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101410] = acef4eff, %l0 = 00000000000000ff
	ldsha	[%i4+%o5]0x88,%l0	! %l0 = 0000000000004eff
!	Mem[0000000010041400] = ff0dd7ff, %l3 = ffffffffe923210d
	lduha	[%i1+%g0]0x80,%l3	! %l3 = 000000000000ff0d
!	Mem[0000000021800040] = ffffc626, %l2 = 00000000000000ff
	ldsb	[%o3+0x040],%l2		! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000030141410] = fbf9d6d7
	stwa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff

p0_label_304:
!	Mem[0000000010001408] = 00000000, %l0 = 0000000000004eff
	lduh	[%i0+%o4],%l0		! %l0 = 0000000000000000
!	%f6  = ff0016af 000000ff, Mem[00000000100c1420] = ffffffff e923210d
	stda	%f6 ,[%i3+0x020]%asi	! Mem[00000000100c1420] = ff0016af 000000ff
!	%l2 = ffffffffffffffff, Mem[0000000010081428] = d7ff000000000033, %asi = 80
	stxa	%l2,[%i2+0x028]%asi	! Mem[0000000010081428] = ffffffffffffffff
!	Mem[0000000010141400] = e923210d, %l6 = 00000000000000ff
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 00000000e923210d
!	%l3 = 000000000000ff0d, Mem[0000000010001400] = ffff0000b75d4f4e
	stx	%l3,[%i0+%g0]		! Mem[0000000010001400] = 000000000000ff0d
!	%f4  = ff000000, Mem[0000000010181410] = af1600ff
	sta	%f4 ,[%i6+%o5]0x88	! Mem[0000000010181410] = ff000000
!	Mem[0000000030001410] = b7d6f9fb, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 00000000b7d6f9fb
!	%l5 = 00000000000000ff, Mem[0000000010001400] = 0dff000000000000
	stxa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000000000ff
!	Mem[0000000010181410] = 000000ff, %l2 = ffffffffffffffff
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001014142c] = 16afb44d, %l7 = ffffffffffffff00
	ldsh	[%i5+0x02c],%l7		! %l7 = 00000000000016af

p0_label_305:
!	Mem[0000000030001400] = 9a421fd5 f84eefac, %l2 = 000000ff, %l3 = 0000ff0d
	ldda	[%i0+%g0]0x89,%l2	! %l2 = 00000000f84eefac 000000009a421fd5
!	Mem[0000000030081410] = ff6d0000acef4ef8, %l7 = 00000000000016af
	ldxa	[%i2+%o5]0x81,%l7	! %l7 = ff6d0000acef4ef8
!	Mem[0000000030001410] = 00000000 00000000, %l6 = e923210d, %l7 = acef4ef8
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010041430] = 00000000, %f3  = 00000000
	lda	[%i1+0x030]%asi,%f3 	! %f3 = 00000000
!	Mem[0000000030141408] = ff0000d7, %l7 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l7	! %l7 = 00000000ff0000d7
!	Mem[0000000010141400] = 00000000 000000ff, %l4 = b7d6f9fb, %l5 = 000000ff
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[0000000010001410] = 00000000 acef4ef8, %l2 = f84eefac, %l3 = 9a421fd5
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 00000000acef4ef8 0000000000000000
!	Mem[0000000010041410] = ff2123e900000000, %l3 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = ff2123e900000000
!	Mem[0000000010081410] = 510016af00000000, %f6  = ff0016af 000000ff
	ldda	[%i2+%o5]0x80,%f6 	! %f6  = 510016af 00000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030001400] = f84eefac
	stba	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = f84eef00

p0_label_306:
!	%l6 = 0000000000000000, Mem[0000000030101408] = 00000000
	stwa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%l1 = 0000000000000039, Mem[0000000010181428] = 9a420000
	stw	%l1,[%i6+0x028]		! Mem[0000000010181428] = 00000039
!	%f28 = 6b6bb8ff, Mem[0000000010181408] = e923210d
	sta	%f28,[%i6+%o4]0x88	! Mem[0000000010181408] = 6b6bb8ff
!	Mem[0000000010101438] = b7d6f9fb, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x038]%asi,%l4	! %l4 = 00000000b7d6f9fb
!	%l5 = 0000000000000000, Mem[0000000030101400] = 000000ff
	stha	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	%l2 = acef4ef8, %l3 = 00000000, Mem[0000000030001400] = 00ef4ef8 d51f429a
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = acef4ef8 00000000
!	Mem[0000000030081408] = 00000000, %l1 = 0000000000000039
	swapa	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010101410] = ff4eefac
	stwa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	Mem[0000000010101400] = 9ca1ff10, %l7 = 00000000ff0000d7
	ldstuba	[%i4+%g0]0x88,%l7	! %l7 = 00000010000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000d70000ff, %l4 = 00000000b7d6f9fb
	ldxa	[%i5+%o4]0x89,%l4	! %l4 = 00000000d70000ff

p0_label_307:
!	Mem[0000000010041410] = ff2123e9, %l2 = 00000000acef4ef8
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffff21
!	Mem[0000000010101410] = 00000000, %l2 = ffffffffffffff21
	ldswa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %l7 = 0000000000000010
	ldsha	[%i1+%o4]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010081408] = 00000000 000000ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000030141410] = 00000000ffffffff, %f16 = d7000039 00000000
	ldda	[%i5+%o5]0x89,%f16	! %f16 = 00000000 ffffffff
!	Mem[0000000010001410] = acef4ef8, %l1 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l1	! %l1 = 00000000acef4ef8
	membar	#Sync			! Added by membar checker (51)
!	Mem[0000000010041400] = ff0dd7ff 157839c2 3b3c0000 ffd76dda
!	Mem[0000000010041410] = ff2123e9 00000000 982a3c92 ff0000ff
!	Mem[0000000010041420] = d7000000 ffd76dda b7d6f9fb 4e4f5db7
!	Mem[0000000010041430] = 00000000 af160000 b7d6f9fb 9ca19d10
	ldda	[%i1]ASI_BLK_PL,%f0	! Block Load from 0000000010041400
!	Mem[0000000010081414] = 00000000, %l5 = 0000000000000000
	lduw	[%i2+0x014],%l5		! %l5 = 0000000000000000
!	Mem[0000000030041410] = b7d637ff, %l4 = 00000000d70000ff
	lduha	[%i1+%o5]0x89,%l4	! %l4 = 00000000000037ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff0016af, %l2 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 000000ff000000ff

p0_label_308:
!	%f24 = cbe0ff00 ff0000ff, %l0 = 0000000000000000
!	Mem[0000000030001428] = a41b16cc00000089
	add	%i0,0x028,%g1
	stda	%f24,[%g1+%l0]ASI_PST8_S ! Mem[0000000030001428] = a41b16cc00000089
!	Mem[00000000211c0001] = 00ff58bc, %l2 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	%f30 = 9a421fd5 000000ff, %l6 = 0000000000000000
!	Mem[00000000300c1420] = 68ebf655d87b3978
	add	%i3,0x020,%g1
	stda	%f30,[%g1+%l6]ASI_PST16_S ! Mem[00000000300c1420] = 68ebf655d87b3978
!	%l3 = 0000000000000000, Mem[0000000010081410] = af160051
	stha	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = af160000
!	%l0 = 00000000, %l1 = acef4ef8, Mem[0000000030041410] = ff37d6b7 5e6bb8ff
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 acef4ef8
!	%l0 = 0000000000000000, Mem[0000000030081410] = ff6d0000
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 006d0000
!	%l6 = 0000000000000000, Mem[000000001010141c] = 00000000
	sth	%l6,[%i4+0x01c]		! Mem[000000001010141c] = 00000000
!	%f26 = 000000ff 16afb44d, %l1 = 00000000acef4ef8
!	Mem[0000000030001428] = a41b16cc00000089
	add	%i0,0x028,%g1
	stda	%f26,[%g1+%l1]ASI_PST32_S ! Mem[0000000030001428] = a41b16cc00000089
!	%f30 = 9a421fd5 000000ff, Mem[0000000010101410] = 00000000 00000000
	stda	%f30,[%i4+0x010]%asi	! Mem[0000000010101410] = 9a421fd5 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = ffff6e00, %l7 = ffffffffffffff00
	ldswa	[%i5+0x030]%asi,%l7	! %l7 = ffffffffffff6e00

p0_label_309:
!	Mem[0000000030141408] = ff0000d7, %l6 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000021800180] = ff84809b, %l7 = ffffffffffff6e00
	lduba	[%o3+0x180]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081410] = 00006d00, %l1 = 00000000acef4ef8
	lduba	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l7 = 00000000000000ff
	ldsh	[%i0+0x002],%l7		! %l7 = 0000000000000000
!	Mem[0000000030001410] = 0000000000000000, %f30 = 9a421fd5 000000ff
	ldda	[%i0+%o5]0x81,%f30	! %f30 = 00000000 00000000
!	Mem[0000000010141408] = ffffffff, %l0 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = ff0000d7, %l4 = 00000000000037ff
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000d7
!	Mem[000000001014142c] = 16afb44d, %f28 = 6b6bb8ff
	ld	[%i5+0x02c],%f28	! %f28 = 16afb44d
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1402] = ff003c3b, %l6 = ffffffffffffffff
	ldstub	[%i3+0x002],%l6		! %l6 = 0000003c000000ff

p0_label_310:
	membar	#Sync			! Added by membar checker (52)
!	%l4 = 000000d7, %l5 = 00000000, Mem[0000000010041410] = ff2123e9 00000000
	stda	%l4,[%i1+0x010]%asi	! Mem[0000000010041410] = 000000d7 00000000
!	Mem[0000000010041400] = ff0dd7ff, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000ff0dd7ff
!	Mem[0000000030101408] = 00000000, %l0 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041410] = d7000000, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l5	! %l5 = 00000000d7000000
!	%l2 = 00000000000000ff, Mem[0000000010141410] = ffb86b5e
	stba	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = ffb86b5e
!	Mem[000000001000140e] = acef4ef8, %l4 = 00000000000000d7
	ldstub	[%i0+0x00e],%l4		! %l4 = 0000004e000000ff
!	Mem[0000000010141408] = ffffffff, %l1 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c143d] = 8788c6cd, %l3 = 00000000ff0dd7ff
	ldstuba	[%i3+0x03d]%asi,%l3	! %l3 = 00000088000000ff
!	%f14 = 109da19c fbf9d6b7, %l4 = 000000000000004e
!	Mem[0000000030001400] = acef4ef800000000
	stda	%f14,[%i0+%l4]ASI_PST8_S ! Mem[0000000030001400] = ac9d4ef8fbf9d600
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ff58bc, %l2 = 00000000000000ff
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = ffffffffffffffff

p0_label_311:
!	Mem[00000000100c1400] = ff00ff3b, %l6 = 000000000000003c
	lduh	[%i3+%g0],%l6		! %l6 = 000000000000ff00
!	Mem[00000000211c0000] = 00ff58bc, %l5 = 00000000d7000000
	ldsb	[%o2+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010181400] = ffffffff, %f5  = e92321ff
	lda	[%i6+%g0]0x80,%f5 	! %f5 = ffffffff
!	Mem[0000000010041408] = 3b3c0000, %l1 = 00000000000000ff
	ldsha	[%i1+%o4]0x80,%l1	! %l1 = 0000000000003b3c
!	Mem[0000000030181400] = 6d000000, %l0 = 0000000000000000
	lduwa	[%i6+%g0]0x81,%l0	! %l0 = 000000006d000000
!	Mem[0000000010001400] = 000000ff, %l0 = 000000006d000000
	ldswa	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081410] = 006d0000, %f26 = 000000ff
	lda	[%i2+%o5]0x81,%f26	! %f26 = 006d0000
!	Mem[0000000030141410] = ffffffff, %l5 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010101408] = af1600ff, %l6 = 000000000000ff00
	lduha	[%i4+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ffff, Mem[0000000010101410] = 9a421fd5
	stb	%l5,[%i4+%o5]		! Mem[0000000010101410] = ff421fd5

p0_label_312:
!	%l2 = ffffffffffffffff, %l7 = 0000000000000000, %l4 = 000000000000004e
	addc	%l2,%l7,%l4		! %l4 = ffffffffffffffff
!	%l3 = 0000000000000088, Mem[0000000010181408] = ffb86b6bfbf9f9fb
	stxa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000088
!	%l1 = 0000000000003b3c, Mem[00000000201c0000] = 00ff0847
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 3cff0847
!	Mem[0000000030101410] = ff0000ff, %l0 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l0	! %l0 = 00000000ff0000ff
!	%l7 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stha	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	%l7 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stwa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%f14 = 109da19c, Mem[0000000010141408] = ffffffff
	sta	%f14,[%i5+%o4]0x88	! Mem[0000000010141408] = 109da19c
!	%l0 = 00000000ff0000ff, Mem[0000000010141408] = ffffffff109da19c
	stxa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000ff0000ff
!	Mem[0000000010101410] = d51f42ff, %l6 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l6	! %l6 = 00000000d51f42ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181420] = ffffffffff0000ff, %f14 = 109da19c fbf9d6b7
	ldda	[%i6+0x020]%asi,%f14	! %f14 = ffffffff ff0000ff

p0_label_313:
!	Mem[00000000300c1400] = ac000000, %l2 = ffffffffffffffff
	ldsha	[%i3+%g0]0x81,%l2	! %l2 = ffffffffffffac00
!	Mem[0000000020800000] = ff37261d, %l6 = 00000000d51f42ff
	ldsh	[%o1+%g0],%l6		! %l6 = ffffffffffffff37
!	Mem[0000000010041408] = da6dd7ff00003c3b, %f18 = 9a421fd5 f84eefac
	ldda	[%i1+%o4]0x88,%f18	! %f18 = da6dd7ff 00003c3b
!	Mem[00000000201c0000] = 3cff0847, %l4 = ffffffffffffffff
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %f10 = b75d4f4e
	lda	[%i0+%o4]0x89,%f10	! %f10 = 00000000
!	Mem[0000000010181400] = ffffffff, %f8  = da6dd7ff
	lda	[%i6+0x000]%asi,%f8 	! %f8 = ffffffff
!	Mem[00000000100c1400] = 3bff00ff, %l0 = 00000000ff0000ff
	ldsba	[%i3+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141438] = 9a421fd5, %l1 = 0000000000003b3c
	lduba	[%i5+0x03a]%asi,%l1	! %l1 = 000000000000001f
!	Mem[00000000201c0000] = 3cff0847, %l6 = ffffffffffffff37
	ldsh	[%o0+%g0],%l6		! %l6 = 0000000000003cff
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ffff, Mem[0000000030001408] = 109da19c00000000
	stxa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000000000ffff

p0_label_314:
!	Mem[00000000300c1408] = fbf9ffff, %l5 = 000000000000ffff
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000020800001] = ff37261d, %l2 = ffffffffffffac00
	ldstub	[%o1+0x001],%l2		! %l2 = 00000037000000ff
!	%l0 = ffffffffffffffff, Mem[00000000100c1420] = ff0016af, %asi = 80
	stha	%l0,[%i3+0x020]%asi	! Mem[00000000100c1420] = ffff16af
!	Mem[0000000010001410] = acef4ef8, %l2 = 0000000000000037
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 00000000acef4ef8
!	Mem[0000000030181400] = 0000006d, %l6 = 0000000000003cff
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 000000000000006d
!	Mem[0000000010001410] = 00000037, %l1 = 000000000000001f
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 00000037000000ff
!	%l5 = 00000000000000ff, Mem[00000000300c1400] = 000000ac
	stba	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	%f12 = 000016af 00000000, %l0 = ffffffffffffffff
!	Mem[0000000030141430] = 6a13e734e923210d
	add	%i5,0x030,%g1
	stda	%f12,[%g1+%l0]ASI_PST16_S ! Mem[0000000030141430] = 000016af00000000
!	%l7 = 0000000000000000, Mem[0000000010081424] = ffa78700, %asi = 80
	stwa	%l7,[%i2+0x024]%asi	! Mem[0000000010081424] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 39000000, %l4 = ffffffffffffffff
	ldsha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000003900

p0_label_315:
!	Mem[0000000010001400] = ff000000, %l1 = 0000000000000037
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030141400] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041438] = b7d6f9fb, %l3 = 0000000000000088
	ldsha	[%i1+0x038]%asi,%l3	! %l3 = ffffffffffffb7d6
!	Mem[0000000010181410] = ffffffff, %l7 = 0000000000000000
	ldsba	[%i6+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101410] = 000000ff, %l2 = 00000000acef4ef8
	lduwa	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = 3cff0847, %l2 = 00000000000000ff
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081400] = ff000000, %l1 = 00000000ff000000
	lduha	[%i2+%g0]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010041410] = 00000000, %l7 = ffffffffffffffff
	lduba	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l6 = 000000000000006d
	ldswa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030101400] = ff000000 10ffa19c
	stda	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 00000000

p0_label_316:
!	%l1 = 000000000000ff00, Mem[0000000030181410] = ffd76ddaff0000d7
	stxa	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000000000ff00
!	%l1 = 000000000000ff00, Mem[0000000030101400] = 00000000
	stwa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000ff00
!	%l4 = 00003900, %l5 = 00000000, Mem[0000000030101410] = 000000ff 8788c6cd
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 00003900 00000000
!	%l2 = ffffffffffffffff, Mem[0000000010141400] = 00000000
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffffff
!	Mem[0000000010041408] = 00003c3b, %l6 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l6	! %l6 = 0000000000003c3b
!	%f24 = cbe0ff00 ff0000ff, %l0 = ffffffffffffffff
!	Mem[0000000010001408] = 00000000aceffff8
	add	%i0,0x008,%g1
	stda	%f24,[%g1+%l0]ASI_PST8_P ! Mem[0000000010001408] = cbe0ff00ff0000ff
!	%l4 = 0000000000003900, Mem[0000000030181400] = 33d76dda00003cff
	stxa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000003900
!	%l3 = ffffffffffffb7d6, Mem[0000000030081408] = 0000000000000039
	stxa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffffffffb7d6
!	%l6 = 00003c3b, %l7 = 00000000, Mem[0000000030141408] = d70000ff 00000000
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00003c3b 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff0000d7 ffb86b6b, %l2 = ffffffff, %l3 = ffffb7d6
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 00000000ff0000d7 00000000ffb86b6b

p0_label_317:
!	Mem[0000000030081410] = 006d0000, %l2 = 00000000ff0000d7
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 000000000000006d
!	Mem[0000000030101410] = 0000390000000000, %f20 = ff0000d7 0000006d
	ldda	[%i4+%o5]0x81,%f20	! %f20 = 00003900 00000000
!	Mem[000000001004142c] = 4e4f5db7, %l2 = 000000000000006d
	lduba	[%i1+0x02f]%asi,%l2	! %l2 = 00000000000000b7
!	Mem[0000000010181400] = ffffffff109da19c, %l5 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l5	! %l5 = ffffffff109da19c
!	Mem[0000000010141408] = ff0000ff, %l1 = 000000000000ff00
	ldsba	[%i5+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[000000001010140c] = 000000ff, %l1 = ffffffffffffffff
	ldsb	[%i4+0x00c],%l1		! %l1 = 0000000000000000
!	Mem[0000000010081410] = af160000, %l1 = 0000000000000000
	ldsha	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = ff00ff3b, %l6 = 0000000000003c3b
	lduba	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (53)
!	Mem[0000000010181400] = ffffffff 109da19c 00000000 00000088
!	Mem[0000000010181410] = ffffffff 000000ff ffb86b5e da6dd733
!	Mem[0000000010181420] = ffffffff ff0000ff 00000039 0000ff00
!	Mem[0000000010181430] = 00ff0089 000000eb ff000000 ff000000
	ldda	[%i6]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	%f12 = 000016af, Mem[0000000010141420] = cbe0ff00
	sta	%f12,[%i5+0x020]%asi	! Mem[0000000010141420] = 000016af

p0_label_318:
!	%l4 = 0000000000003900, Mem[0000000010041410] = 00000000
	stba	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Mem[00000000211c0001] = 00ff58bc, %l4 = 0000000000003900
	ldstub	[%o2+0x001],%l4		! %l4 = 000000ff000000ff
!	%f0  = c2397815 ffd70dff da6dd7ff 00003c3b
!	%f4  = 00000000 ffffffff ff0000ff 923c2a98
!	%f8  = ffffffff 000000d7 00000000 fbf9d6b7
!	%f12 = 000016af 00000000 ffffffff ff0000ff
	stda	%f0,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	Mem[0000000010181410] = ffffffff000000ff, %l5 = ffffffff109da19c, %l3 = 00000000ffb86b6b
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = ffffffff000000ff
!	%l5 = ffffffff109da19c, Mem[0000000030181410] = 00ff0000
	stwa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 109da19c
!	Mem[0000000010181410] = ffffffff, %l6 = 00000000000000ff
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010041404] = 157839c2, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i1+0x004]%asi,%l4	! %l4 = 00000000157839c2
!	Mem[00000000300c1410] = 5e0000ff, %l4 = 00000000157839c2
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 0000005e000000ff
!	%f30 = 000000ff, Mem[0000000030001408] = ffff0000
	sta	%f30,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000000af160000, %l0 = ffffffffffffffff
	ldxa	[%i2+%o5]0x88,%l0	! %l0 = 00000000af160000

p0_label_319:
!	Mem[0000000010141410] = ffb86b5e, %l3 = ffffffff000000ff
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = ffffffffffb86b5e
!	Mem[0000000010081434] = 8f28b333, %l0 = 00000000af160000
	ldsba	[%i2+0x035]%asi,%l0	! %l0 = 0000000000000028
!	Mem[0000000030141400] = 00000000, %l5 = ffffffff109da19c
	ldswa	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001420] = da6dd7ff000000d7, %f22 = 33d76dda 5e6bb8ff
	ldda	[%i0+0x020]%asi,%f22	! %f22 = da6dd7ff 000000d7
!	Mem[0000000010081410] = 00000000af160000, %l6 = 00000000ffffffff
	ldxa	[%i2+%o5]0x88,%l6	! %l6 = 00000000af160000
!	Mem[0000000020800040] = ffff4bbb, %l5 = 0000000000000000
	ldub	[%o1+0x041],%l5		! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = 3cff0847, %l4 = 000000000000005e
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 0000000000003cff
!	Mem[0000000030141400] = ffb86b5e 00000000, %l6 = af160000, %l7 = 00000000
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000 00000000ffb86b5e
!	Mem[0000000010181418] = ffb86b5eda6dd733, %f24 = ff0000ff ffffffff
	ldda	[%i6+0x018]%asi,%f24	! %f24 = ffb86b5e da6dd733
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000010101408] = ff0016af000000ff, %l5 = 00000000000000ff, %l6 = 0000000000000000
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = ff0016af000000ff

p0_label_320:
!	%f21 = ffffffff, Mem[00000000300c1408] = fbf9ffff
	sta	%f21,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffff
!	%f30 = 000000ff 000000ff, Mem[0000000010181410] = ff000000 ff000000
	stda	%f30,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff 000000ff
!	Mem[0000000021800141] = 0000f4c2, %l0 = 0000000000000028
	ldstuba	[%o3+0x141]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l3 = ffffffffffb86b5e
	ldstuba	[%i3+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%f28 = eb000000, Mem[0000000010181408] = 00000000
	sta	%f28,[%i6+%o4]0x88	! Mem[0000000010181408] = eb000000
!	%l4 = 0000000000003cff, Mem[000000001014140c] = 00000000
	sth	%l4,[%i5+0x00c]		! Mem[000000001014140c] = 3cff0000
!	Mem[0000000010101408] = ff0016af, %l3 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010081408] = 000000ff, %l6 = ff0016af000000ff
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%f20 = ff000000, %f23 = 000000d7
	fsqrts	%f20,%f23		! %f23 = 7fffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ffffffff 00000000, %l2 = 000000b7, %l3 = 000000ff
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000ffffffff 0000000000000000

p0_label_321:
!	Mem[0000000010081400] = ff0000d7, %l5 = 00000000000000ff
	ldsha	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010041430] = 00000000, %l6 = 00000000000000ff
	lduw	[%i1+0x030],%l6		! %l6 = 0000000000000000
!	Mem[0000000030141400] = ffb86b5e00000000, %f26 = 00ff0000 39000000
	ldda	[%i5+%g0]0x89,%f26	! %f26 = ffb86b5e 00000000
!	Mem[0000000030041408] = ff000000, %l5 = ffffffffffffff00
	lduwa	[%i1+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030041408] = 000000ff, %f27 = 00000000
	lda	[%i1+%o4]0x89,%f27	! %f27 = 000000ff
!	Mem[0000000010081400] = d70000ff, %l2 = 00000000ffffffff
	ldsha	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = ff2123e9, %l5 = 00000000ff000000
	lduha	[%i1+%g0]0x81,%l5	! %l5 = 000000000000ff21
!	Mem[00000000201c0000] = 3cff0847, %l4 = 0000000000003cff
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = 000000000000003c
!	Mem[0000000021800100] = ffeb8452, %l3 = 0000000000000000
	ldsba	[%o3+0x100]%asi,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030141400] = ffb86b5e00000000
	stxa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000

p0_label_322:
!	Mem[0000000010181410] = 000000ff, %l3 = ffffffffffffffff
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f18 = 88000000 00000000, Mem[0000000030041408] = 000000ff 00000000
	stda	%f18,[%i1+%o4]0x89	! Mem[0000000030041408] = 88000000 00000000
!	%l4 = 000000000000003c, Mem[0000000030041400] = ff2123e9fbf9f9fb
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000000000003c
!	Mem[0000000030041408] = 00000000, %l4 = 000000000000003c
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%f8  = ffffffff 000000d7, %l4 = 0000000000000000
!	Mem[0000000010101410] = ff000000000000ff
	add	%i4,0x010,%g1
	stda	%f8,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010101410] = ff000000000000ff
!	%f1  = ffd70dff, Mem[00000000300c1410] = ff0000ff
	sta	%f1 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffd70dff
!	%f22 = da6dd7ff 7fffffff, Mem[00000000300c1410] = ff0dd7ff 6d000000
	stda	%f22,[%i3+%o5]0x89	! Mem[00000000300c1410] = da6dd7ff 7fffffff
!	%f22 = da6dd7ff 7fffffff, %l1 = 0000000000000000
!	Mem[0000000010181428] = 000000390000ff00
	add	%i6,0x028,%g1
	stda	%f22,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010181428] = 000000390000ff00
!	Mem[0000000010001400] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l5 = 000000000000ff21
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000000

p0_label_323:
!	Mem[0000000010041408] = da6dd7ff00000000, %l5 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l5	! %l5 = da6dd7ff00000000
!	Mem[0000000030181408] = fbf9f9d5, %f4  = 00000000
	lda	[%i6+%o4]0x89,%f4 	! %f4 = fbf9f9d5
!	Mem[0000000010041400] = 00000000, %l3 = 00000000000000ff
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000010101400] = ffffa19c 34e7136a ff0016af 000000ff
!	Mem[0000000010101410] = ff000000 000000ff ff00ffff 00000000
!	Mem[0000000010101420] = da6dd733 000000ff 00000000 4e4f5db7
!	Mem[0000000010101430] = 9a421fd7 f84eefac 000000ff 9ca1ff10
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400
!	Mem[0000000030141410] = 00000000 ffffffff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[0000000030181408] = fbf9f9d5, %l4 = 0000000000000000
	ldsha	[%i6+%o4]0x89,%l4	! %l4 = fffffffffffff9d5
!	Mem[0000000030001410] = 00000000, %l6 = 00000000000000ff
	lduba	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = cbe0ff00, %l3 = 0000000000000000
	ldsba	[%i0+0x009]%asi,%l3	! %l3 = ffffffffffffffe0
!	Mem[00000000100c1400] = 3bff00ff, %l5 = da6dd7ff00000000
	ldsba	[%i3+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = fffffffffffff9d5, Mem[00000000100c1408] = ff00005e
	stwa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = fffff9d5

p0_label_324:
!	%l7 = 00000000ffb86b5e, Mem[0000000030081408] = ffffb7d6
	stba	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffb75e
!	%l7 = 00000000ffb86b5e, Mem[0000000010141400] = 00000000ffffffff
	stxa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000ffb86b5e
!	%l5 = ffffffffffffffff, Mem[00000000300c1408] = ffffffff
	stba	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffff
!	%l6 = 00000000, %l7 = ffb86b5e, Mem[00000000100c1400] = ff00ff3b 0000006d
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 ffb86b5e
!	Mem[0000000010041410] = 00000000, %l4 = fffffffffffff9d5
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f24 = ffb86b5e da6dd733, Mem[0000000010001400] = ff000000 00000000
	stda	%f24,[%i0+%g0]0x80	! Mem[0000000010001400] = ffb86b5e da6dd733
!	%l5 = ffffffffffffffff, Mem[0000000030001400] = f84e9dac
	stba	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = f84e9dff
!	%l0 = 0000000000000000, Mem[0000000010041410] = 000000ff
	stwa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000030101400] = ffd70dff c2397815
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = cbe0ff00, %f30 = 000000ff
	lda	[%i0+%o4]0x80,%f30	! %f30 = cbe0ff00

p0_label_325:
!	Mem[0000000030001410] = 0000000000000000, %f16 = 9ca19d10 ffffffff
	ldda	[%i0+%o5]0x89,%f16	! %f16 = 00000000 00000000
!	Mem[0000000030001408] = ff000000, %f28 = eb000000
	lda	[%i0+%o4]0x89,%f28	! %f28 = ff000000
!	Mem[0000000030101410] = ffffffff, %l5 = ffffffffffffffff
	lduba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000020800040] = ffff4bbb, %l0 = 0000000000000000
	lduh	[%o1+0x040],%l0		! %l0 = 000000000000ffff
!	Mem[00000000100c1408] = fffff9d5, %l7 = 00000000ffb86b5e
	ldswa	[%i3+%o4]0x88,%l7	! %l7 = fffffffffffff9d5
!	Mem[0000000010001410] = ff000000, %l3 = ffffffffffffffe0
	ldsha	[%i0+%o5]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010181410] = ffffffffff000000, %f30 = cbe0ff00 000000ff
	ldd	[%i6+%o5],%f30		! %f30 = ffffffff ff000000
!	Mem[00000000300c1408] = ffffffff, %l3 = ffffffffffffff00
	lduba	[%i3+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = d70000ff, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[000000001014140c] = 3cff0000, %l4 = 0000000000000000, %asi = 80
	swapa	[%i5+0x00c]%asi,%l4	! %l4 = 000000003cff0000

p0_label_326:
!	%l5 = 00000000000000ff, Mem[0000000010081400] = d70000ff
	stwa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%l4 = 000000003cff0000, Mem[0000000030181400] = 00390000
	stwa	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 3cff0000
!	Mem[0000000030001410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001408] = cbe0ff00, %l0 = 000000000000ffff
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 000000cb000000ff
!	%f22 = da6dd7ff, Mem[00000000100c1404] = ffb86b5e
	st	%f22,[%i3+0x004]	! Mem[00000000100c1404] = da6dd7ff
!	%l6 = 00000000000000ff, Mem[0000000010001400] = 5e6bb8ff
	stwa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	%l4 = 000000003cff0000, Mem[0000000010181408] = 000000eb00000088
	stx	%l4,[%i6+%o4]		! Mem[0000000010181408] = 000000003cff0000
!	%l1 = 0000000000000000, Mem[0000000010001410] = ff00000000000000
	stxa	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	%l4 = 000000003cff0000, Mem[0000000010141410] = 5e6bb8ff
	stwa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 3cff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffffffff, %l2 = 00000000ffffffff
	lduha	[%i6+%o5]0x80,%l2	! %l2 = 000000000000ffff

p0_label_327:
!	Mem[0000000010141410] = 0000ff3c, %l7 = fffffffffffff9d5
	lduwa	[%i5+%o5]0x80,%l7	! %l7 = 000000000000ff3c
!	Mem[0000000010181438] = ff000000ff000000, %f22 = da6dd7ff 7fffffff
	ldd	[%i6+0x038],%f22	! %f22 = ff000000 ff000000
!	Mem[000000001000141c] = ebbbffff, %l5 = 00000000000000ff
	lduwa	[%i0+0x01c]%asi,%l5	! %l5 = 00000000ebbbffff
!	Mem[0000000010081400] = 6b6bb8ff 000000ff, %l4 = 3cff0000, %l5 = ebbbffff
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff 000000006b6bb8ff
!	Mem[0000000010181438] = ff000000ff000000, %f20 = ff000000 ffffffff
	ldda	[%i6+0x038]%asi,%f20	! %f20 = ff000000 ff000000
!	Mem[0000000010101408] = ff000000af1600ff, %f22 = ff000000 ff000000
	ldda	[%i4+%o4]0x88,%f22	! %f22 = ff000000 af1600ff
!	Mem[0000000030001408] = 000000ff00000000, %f4  = ff000000 000000ff
	ldda	[%i0+%o4]0x81,%f4 	! %f4  = 000000ff 00000000
!	Mem[0000000010001410] = 0000000000000000, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = ffffa19c 34e7136a, %l6 = 000000ff, %l7 = 0000ff3c
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000ffffa19c 0000000034e7136a
!	Starting 10 instruction Store Burst
!	Mem[0000000010141418] = 00000000, %l7 = 34e7136a, %l7 = 34e7136a
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 0000000000000000

p0_label_328:
	membar	#Sync			! Added by membar checker (56)
!	%l4 = 00000000000000ff, Mem[0000000010101410] = 000000ff
	stwa	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	%l7 = 0000000000000000, Mem[0000000030041408] = 3c000000
	stwa	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l6 = 00000000ffffa19c, Mem[0000000030141410] = 00000000ffffffff
	stxa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000ffffa19c
!	Mem[0000000010041400] = 00000000, %l4 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%f16 = 00000000 00000000 88000000 00000000
!	%f20 = ff000000 ff000000 ff000000 af1600ff
!	%f24 = ffb86b5e da6dd733 ffb86b5e 000000ff
!	%f28 = ff000000 8900ff00 ffffffff ff000000
	stda	%f16,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	Mem[0000000010081410] = 000016af, %l0 = 00000000000000cb
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 00000000000016af
	membar	#Sync			! Added by membar checker (57)
!	%l7 = 0000000000000000, Mem[0000000030001410] = ff000000
	stwa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%l2 = 000000000000ffff, Mem[0000000010081400] = ff000000
	stwa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000ffff
!	%l4 = 00000000, %l5 = 6b6bb8ff, Mem[0000000010181408] = 00000000 3cff0000
	stda	%l4,[%i6+0x008]%asi	! Mem[0000000010181408] = 00000000 6b6bb8ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 00fff4c2, %l2 = 000000000000ffff
	ldsh	[%o3+0x140],%l2		! %l2 = 00000000000000ff

p0_label_329:
!	Mem[0000000010041428] = b7d6f9fb 4e4f5db7, %l0 = 000016af, %l1 = 00000000
	ldda	[%i1+0x028]%asi,%l0	! %l0 = 00000000b7d6f9fb 000000004e4f5db7
!	Mem[0000000010141410] = 0000ff3c0000006d, %f20 = ff000000 ff000000
	ldda	[%i5+0x010]%asi,%f20	! %f20 = 0000ff3c 0000006d
!	Mem[0000000030081408] = ffffb75e, %l5 = 000000006b6bb8ff
	ldsha	[%i2+%o4]0x89,%l5	! %l5 = ffffffffffffb75e
!	Mem[0000000030181400] = 3cff0000, %l1 = 000000004e4f5db7
	lduba	[%i6+%g0]0x81,%l1	! %l1 = 000000000000003c
!	Mem[0000000010141430] = ffff6e00, %l6 = 00000000ffffa19c
	ldsw	[%i5+0x030],%l6		! %l6 = ffffffffffff6e00
!	Mem[0000000010001400] = ff000000, %l6 = ffffffffffff6e00
	ldsha	[%i0+%g0]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030141408] = 3b3c0000, %l6 = ffffffffffffff00
	lduwa	[%i5+%o4]0x81,%l6	! %l6 = 000000003b3c0000
!	Mem[0000000020800040] = ffff4bbb, %l7 = 0000000000000000
	lduha	[%o1+0x040]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030001410] = 000000ff00000000, %l4 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = 000000ff00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = ffff4bbb, %l5 = ffffffffffffb75e
	ldstuba	[%o1+0x040]%asi,%l5	! %l5 = 000000ff000000ff

p0_label_330:
!	Mem[00000000300c1400] = ff000000, %l5 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[00000000100c1408] = d5f9ffff, %l1 = 000000000000003c
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 00000000d5f9ffff
!	Mem[0000000010001408] = 00ffe0ff, %l2 = 00000000000000ff
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 0000000000ffe0ff
!	%f15 = ff000000, Mem[00000000100c1424] = 000000ff
	st	%f15,[%i3+0x024]	! Mem[00000000100c1424] = ff000000
!	Mem[0000000010181410] = ffffffff, %l0 = 00000000b7d6f9fb
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000ffffffff
!	Mem[00000000100c1400] = 00000000, %l4 = 000000ff00000000
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%f0  = 6a13e734 9ca1ffff, Mem[0000000010041400] = 000000ff 000000ff
	stda	%f0 ,[%i1+0x000]%asi	! Mem[0000000010041400] = 6a13e734 9ca1ffff
!	Mem[0000000010101408] = af1600ff, %l1 = 00000000d5f9ffff
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000af1600ff
!	%l7 = 000000000000ffff, Mem[0000000010001408] = ff000000ff0000ff
	stxa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000000000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 3b3c0000, %l4 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l4	! %l4 = 000000003b3c0000

p0_label_331:
!	Mem[0000000030001408] = 00000088, %l3 = 00000000000000ff
	lduha	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000088
!	Mem[0000000010181410] = b7d6f9fb, %l5 = 00000000ff000000
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = ffffffffb7d6f9fb
!	Mem[00000000100c140c] = ff6d0000, %l4 = 000000003b3c0000
	lduw	[%i3+0x00c],%l4		! %l4 = 00000000ff6d0000
!	Mem[0000000010141400] = 5e6bb8ff 00000000, %l2 = 00ffe0ff, %l3 = 00000088
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 000000005e6bb8ff 0000000000000000
!	Mem[0000000010181408] = 00000000, %l6 = 000000003b3c0000
	lduba	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 000000ff, %l1 = 00000000af1600ff
	ldswa	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %f21 = 0000006d
	lda	[%i0+%o5]0x89,%f21	! %f21 = 00000000
!	Mem[000000001014140c] = 00000000, %l3 = 0000000000000000
	lduha	[%i5+0x00c]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800040] = ffff4bbb, %l0 = 00000000ffffffff
	ldub	[%o1+0x040],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = ff6d0000, %l5 = b7d6f9fb, Mem[00000000300c1408] = ffffffff b7d6f9fb
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff6d0000 b7d6f9fb

p0_label_332:
!	%l6 = 0000000000000000, Mem[0000000030101410] = 00000000ffffffff
	stxa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030081410] = 00006d00, %l4 = 00000000ff6d0000
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 0000000000006d00
!	Mem[0000000030081410] = 00006dff, %l4 = 0000000000006d00
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 0000000000006dff
!	%f16 = 00000000 00000000 88000000 00000000
!	%f20 = 0000ff3c 00000000 ff000000 af1600ff
!	%f24 = ffb86b5e da6dd733 ffb86b5e 000000ff
!	%f28 = ff000000 8900ff00 ffffffff ff000000
	stda	%f16,[%i6]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	%f2  = ff000000 af1600ff, Mem[00000000300c1400] = 000000ff ffffffff
	stda	%f2 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000 af1600ff
!	%f2  = ff000000, Mem[0000000010081408] = 000000ff
	sta	%f2 ,[%i2+%o4]0x88	! Mem[0000000010081408] = ff000000
!	Mem[0000000020800040] = ffff4bbb, %l5 = ffffffffb7d6f9fb
	ldstuba	[%o1+0x040]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010141418] = 00000000, %l2 = 000000005e6bb8ff
	swap	[%i5+0x018],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 0000000000000088, %l4 = 0000000000006dff
	ldxa	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000088

p0_label_333:
!	Mem[00000000300c1410] = ffffff7f, %l7 = 000000000000ffff
	ldswa	[%i3+%o5]0x81,%l7	! %l7 = ffffffffffffff7f
!	Mem[0000000030141400] = 0000000000000000, %f8  = ff000000 33d76dda
	ldda	[%i5+%g0]0x81,%f8 	! %f8  = 00000000 00000000
!	Mem[0000000010101400] = 9ca1ffff, %l0 = 00000000000000ff
	lduwa	[%i4+%g0]0x88,%l0	! %l0 = 000000009ca1ffff
!	Mem[00000000201c0000] = 3cff0847, %l7 = ffffffffffffff7f
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = 0000000000003cff
!	Mem[00000000211c0000] = 00ff58bc, %l1 = 00000000000000ff
	lduh	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010081400] = 0000ffff, %l1 = 00000000000000ff
	lduha	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[000000001004141c] = ff0000ff, %l2 = 0000000000000000
	ldsh	[%i1+0x01e],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030181410] = 109da19c00000000, %f10 = b75d4f4e 00000000
	ldda	[%i6+%o5]0x81,%f10	! %f10 = 109da19c 00000000
!	Mem[0000000010141410] = 0000ff3c, %l6 = 00000000000000ff
	lduha	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f8  = 00000000, Mem[0000000010081408] = 000000ff
	sta	%f8 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000

p0_label_334:
!	%f0  = 6a13e734 9ca1ffff, Mem[0000000010181410] = 00000000 3cff0000
	stda	%f0 ,[%i6+0x010]%asi	! Mem[0000000010181410] = 6a13e734 9ca1ffff
!	Mem[000000001008141c] = ffffff8f, %l1 = 0000000000000000, %asi = 80
	swapa	[%i2+0x01c]%asi,%l1	! %l1 = 00000000ffffff8f
!	Mem[0000000030141410] = ffffa19c, %l2 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 0000009c000000ff
!	%l2 = 0000009c, %l3 = 00000000, Mem[0000000030081400] = 000000ff 0000ffff
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000009c 00000000
	membar	#Sync			! Added by membar checker (58)
!	Mem[0000000010181434] = 000000ff, %l2 = 000000000000009c
	swap	[%i6+0x034],%l2		! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = ff000000, %l7 = 0000000000003cff
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 00000000ff000000
!	%l3 = 0000000000000000, Mem[00000000201c0000] = 3cff0847, %asi = 80
	stba	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff0847
!	Mem[0000000020800041] = ffff4bbb, %l3 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 000000ff000000ff
!	%l7 = 00000000ff000000, Mem[0000000010081401] = 0000ffff, %asi = 80
	stba	%l7,[%i2+0x001]%asi	! Mem[0000000010081400] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffff261d, %l5 = 00000000000000ff
	lduh	[%o1+%g0],%l5		! %l5 = 000000000000ffff

p0_label_335:
!	Mem[0000000030141410] = ffffa1ff, %l4 = 0000000000000088
	lduwa	[%i5+%o5]0x89,%l4	! %l4 = 00000000ffffa1ff
!	Mem[0000000030001410] = 000000ff00000000, %f14 = 10ffa19c ff000000
	ldda	[%i0+%o5]0x89,%f14	! %f14 = 000000ff 00000000
!	Mem[0000000030141410] = ffa1ffff, %l3 = 00000000000000ff
	ldsha	[%i5+%o5]0x81,%l3	! %l3 = ffffffffffffffa1
!	Mem[0000000010041408] = 00000000, %l5 = 000000000000ffff
	ldsba	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 00000000ffd76dda, %f4  = 000000ff 00000000
	ldda	[%i1+%o4]0x80,%f4 	! %f4  = 00000000 ffd76dda
!	Mem[0000000010141418] = 5e6bb8ff, %f20 = 0000ff3c
	ld	[%i5+0x018],%f20	! %f20 = 5e6bb8ff
!	Mem[0000000030001410] = 000000ff00000000, %f20 = 5e6bb8ff 00000000
	ldda	[%i0+%o5]0x89,%f20	! %f20 = 000000ff 00000000
!	Mem[0000000010141410] = 0000ff3c, %l4 = 00000000ffffa1ff
	ldsha	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 109da19c, %l7 = 00000000ff000000
	ldsba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000010
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000300c1410] = ffffff7f
	stha	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000ff7f

p0_label_336:
!	%l3 = ffffffffffffffa1, Mem[0000000030101408] = 3b3c0000
	stha	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = ffa10000
!	%l6 = 0000000000000000, Mem[00000000100c1408] = 3c000000
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030081410] = 006d0000
	stwa	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[00000000100c1400] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	%l0 = 000000009ca1ffff, Mem[0000000010181400] = 00000000
	stha	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = ffff0000
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000000010
	swapa	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000010001400] = ff000000
	stba	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = ff000000
!	Mem[0000000030001408] = 88000000, %l2 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 0000000088000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 0000ff7f, %l7 = 0000000000000000
	lduha	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_337:
!	Mem[0000000030001408] = ff000000, %l3 = ffffffffffffffa1
	lduwa	[%i0+%o4]0x89,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010181408] = 88000000 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000 0000000088000000
!	Mem[0000000010141410] = 0000ff3c0000006d, %f14 = 000000ff 00000000
	ldda	[%i5+%o5]0x80,%f14	! %f14 = 0000ff3c 0000006d
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 000000009ca1ffff
	setx	0x76b206f7cd019da0,%g7,%l0 ! %l0 = 76b206f7cd019da0
!	%l1 = 00000000ffffff8f
	setx	0xa7e3d5a7815f4b14,%g7,%l1 ! %l1 = a7e3d5a7815f4b14
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 76b206f7cd019da0
	setx	0xa9221b37df972197,%g7,%l0 ! %l0 = a9221b37df972197
!	%l1 = a7e3d5a7815f4b14
	setx	0xfac1de6077c0efc4,%g7,%l1 ! %l1 = fac1de6077c0efc4
!	Mem[0000000030101410] = 00000000, %f30 = ffffffff
	lda	[%i4+%o5]0x89,%f30	! %f30 = 00000000
!	Mem[0000000010101400] = ffffa19c 34e7136a fffff9d5 000000ff
!	Mem[0000000010101410] = ff000000 000000ff ff00ffff 00000000
!	Mem[0000000010101420] = da6dd733 000000ff 00000000 4e4f5db7
!	Mem[0000000010101430] = 9a421fd7 f84eefac 000000ff 9ca1ff10
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000030181400] = 3cff0000, %f1  = 9ca1ffff
	lda	[%i6+%g0]0x81,%f1 	! %f1 = 3cff0000
!	Mem[0000000030181400] = 3cff000000000000, %l3 = 00000000ff000000
	ldxa	[%i6+%g0]0x81,%l3	! %l3 = 3cff000000000000
!	Mem[0000000010181410] = 6a13e734, %f0  = 6a13e734
	lda	[%i6+%o5]0x80,%f0 	! %f0 = 6a13e734
!	Starting 10 instruction Store Burst
!	%f10 = 109da19c 00000000, %l5 = 0000000088000000
!	Mem[0000000010081438] = 33b3288f0000ffff
	add	%i2,0x038,%g1
	stda	%f10,[%g1+%l5]ASI_PST32_P ! Mem[0000000010081438] = 33b3288f0000ffff

p0_label_338:
!	%l2 = 88000000, %l3 = 00000000, Mem[0000000010181400] = 0000ffff 00000000
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 88000000 00000000
!	%l4 = 0000000000000000, Mem[0000000010041418] = 982a3c92ff0000ff
	stx	%l4,[%i1+0x018]		! Mem[0000000010041418] = 0000000000000000
!	Mem[0000000010081400] = 0000ffff, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 000000000000ffff
!	%l4 = 0000000000000000, %l4 = 0000000000000000, %y  = 17f475b6
	umul	%l4,%l4,%l3		! %l3 = 0000000000000000, %y = 00000000
!	%l6 = 0000ffff, %l7 = 00000000, Mem[0000000010041408] = 00000000 da6dd7ff
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000ffff 00000000
!	Mem[0000000010141410] = 3cff0000, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l7	! %l7 = 000000003cff0000
!	Mem[0000000010081400] = 00000000, %l7 = 000000003cff0000
	ldstuba	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%f10 = 109da19c 00000000, Mem[0000000010081430] = b7d6f9fb 8f28b333
	stda	%f10,[%i2+0x030]%asi	! Mem[0000000010081430] = 109da19c 00000000
!	%l7 = 0000000000000000, Mem[0000000010181408] = 00000000
	stba	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l3 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_339:
!	Mem[0000000010001408] = 00000000, %l2 = 0000000088000000
	lduwa	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 00000000ff000000, %l6 = 000000000000ffff
	ldxa	[%i0+%o4]0x89,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030141408] = 3b3c0000 00000000, %l4 = 00000000, %l5 = 88000000
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 000000003b3c0000 0000000000000000
!	Mem[0000000030001410] = 00000000, %l7 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000000000
	lduha	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800000] = ff00951b, %l1 = fac1de6077c0efc4
	ldub	[%o3+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[00000000100c1400] = 000000ff, %l4 = 000000003b3c0000
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ff0847, %l3 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 000000ff, %l0 = a9221b37df972197
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010001408] = 00000000 0000ffff
	std	%l2,[%i0+%o4]		! Mem[0000000010001408] = 00000000 00000000

p0_label_340:
!	Mem[0000000030041408] = 00000000, %l4 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030181400] = 0000ff3c 00000000
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 00000000
!	%l3 = 0000000000000000, Mem[0000000010041408] = ffff0000
	stba	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ff0000
!	Mem[00000000211c0001] = 00ff58bc, %l1 = 00000000000000ff
	ldstub	[%o2+0x001],%l1		! %l1 = 000000ff000000ff
!	Mem[000000001008141c] = 00000000, %l0 = 00000000000000ff
	swap	[%i2+0x01c],%l0		! %l0 = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000300c1410] = 7fff0000
	stha	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 7fff0000
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (59)
!	%l6 = ff000000, %l7 = 00000000, Mem[0000000010101408] = fffff9d5 000000ff
	std	%l6,[%i4+%o4]		! Mem[0000000010101408] = ff000000 00000000
!	Mem[0000000030001410] = 00000000, %l0 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = df972197, %l2 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l2	! %l2 = 0000000000002197

p0_label_341:
!	Mem[0000000010101410] = 000000ff, %l6 = 00000000ff000000
	ldswa	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041408] = 00ff0000, %l7 = 0000000000000000
	lduha	[%i1+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l6 = 00000000000000ff
	lduha	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 9ca1ffff, %f9  = 00000000
	lda	[%i4+%g0]0x88,%f9 	! %f9 = 9ca1ffff
!	Mem[0000000010001400] = 000000ff, %l3 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c140c] = ff6d0000, %l6 = 0000000000000000
	ldub	[%i3+0x00f],%l6		! %l6 = 0000000000000000
!	Mem[0000000020800000] = ffff261d, %l5 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000000000
	lduba	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00000000, %l2 = 0000000000002197
	swapa	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_342:
!	%l0 = 0000000000000000, Mem[0000000010141408] = ff0000ff
	stha	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff
!	Mem[0000000010141408] = ff000000, %l5 = 000000000000ffff
	swapa	[%i5+%o4]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[0000000020800040] = ffff4bbb, %l4 = 0000000000000000
	ldstub	[%o1+0x040],%l4		! %l4 = 000000ff000000ff
!	%f16 = ffffa19c 34e7136a fffff9d5 000000ff
!	%f20 = ff000000 000000ff ff00ffff 00000000
!	%f24 = da6dd733 000000ff 00000000 4e4f5db7
!	%f28 = 9a421fd7 f84eefac 000000ff 9ca1ff10
	stda	%f16,[%i6]ASI_BLK_P	! Block Store to 0000000010181400
!	Mem[0000000010041400] = 34e7136a, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 0000006a000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141408] = ffff0000
	stba	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = ffff0000
!	%l4 = 000000ff, %l5 = ff000000, Mem[0000000030101400] = 97210000 ffffffff
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff ff000000
!	Mem[0000000030001400] = 000000ff, %l1 = 00000000000000ff
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030041400] = 00000000, %l5 = 00000000ff000000
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = 00000000ff000000, %l2 = 0000000000000000
	ldx	[%i0+0x028],%l2		! %l2 = 00000000ff000000

p0_label_343:
!	Mem[0000000030181410] = 9ca19d10, %l4 = 00000000000000ff
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000010
!	Mem[0000000010041400] = ff13e734, %f10 = 109da19c
	lda	[%i1+%g0]0x80,%f10	! %f10 = ff13e734
!	Mem[0000000010001410] = ff000000 00000000, %l4 = 00000010, %l5 = 00000000
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000020800040] = ffff4bbb, %l7 = 00000000000000ff
	lduha	[%o1+0x040]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030101400] = 000000ff, %l2 = 00000000ff000000
	ldsba	[%i4+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1410] = 0000ff7f, %l2 = ffffffffffffffff
	lduba	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l0 = 0000000000000000
	lduba	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 0000a1ff, %l3 = 000000000000006a
	lduba	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041408] = 000000ff, %l0 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081404] = ffb86b6b, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x004]%asi,%l0	! %l0 = 00000000ffb86b6b

p0_label_344:
	membar	#Sync			! Added by membar checker (60)
!	Mem[000000001018140d] = 000000ff, %l4 = 00000000ff000000
	ldstuba	[%i6+0x00d]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[000000001018142f] = 4e4f5db7, %l4 = 0000000000000000
	ldstub	[%i6+0x02f],%l4		! %l4 = 000000b7000000ff
!	Mem[0000000021800041] = ffffc626, %l3 = 00000000000000ff
	ldstub	[%o3+0x041],%l3		! %l3 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[0000000030101410] = 00000000
	stwa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff
!	%l0 = 00000000ffb86b6b, Mem[0000000030181410] = 109da19c
	stwa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = ffb86b6b
!	%f24 = da6dd733, Mem[0000000010081410] = 000000cb
	sta	%f24,[%i2+%o5]0x80	! Mem[0000000010081410] = da6dd733
!	%l3 = 00000000000000ff, Mem[0000000030101400] = 000000ff
	stwa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	Mem[0000000010181410] = 000000ff, %l0 = 00000000ffb86b6b
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00003c3b, %f14 = 0000ff3c
	lda	[%i5+%o4]0x89,%f14	! %f14 = 00003c3b

p0_label_345:
!	Mem[0000000030101400] = ff000000 000000ff, %l6 = 00000000, %l7 = 0000ffff
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff 00000000ff000000
!	Mem[00000000100c140c] = ff6d0000, %l3 = 00000000000000ff
	ldswa	[%i3+0x00c]%asi,%l3	! %l3 = ffffffffff6d0000
!	Mem[0000000030181400] = 0000000000000000, %l3 = ffffffffff6d0000
	ldxa	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 0000ffff, %f11 = 00000000
	lda	[%i5+%o4]0x88,%f11	! %f11 = 0000ffff
!	Mem[00000000211c0000] = 00ff58bc, %l5 = 0000000000000000
	ldsh	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010101400] = ffffa19c 34e7136a ff000000 00000000
!	Mem[0000000010101410] = ff000000 000000ff ff00ffff 00000000
!	Mem[0000000010101420] = da6dd733 000000ff 00000000 4e4f5db7
!	Mem[0000000010101430] = 9a421fd7 f84eefac 000000ff 9ca1ff10
	ldda	[%i4]ASI_BLK_PL,%f0	! Block Load from 0000000010101400
!	Mem[0000000010101408] = ff000000 00000000, %l4 = 000000b7, %l5 = 000000ff
	ldda	[%i4+0x008]%asi,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[00000000100c1430] = 0000000000000000, %f20 = ff000000 000000ff
	ldda	[%i3+0x030]%asi,%f20	! %f20 = 00000000 00000000
!	Mem[0000000010101400] = ffffa19c34e7136a, %f28 = 9a421fd7 f84eefac
	ldda	[%i4+%g0]0x80,%f28	! %f28 = ffffa19c 34e7136a
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030101410] = 000000ff
	stba	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff

p0_label_346:
!	Mem[0000000010041408] = 00ff0000, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 0000000000ff0000
!	%l5 = 0000000000000000, Mem[0000000010041400] = ff13e734
	stwa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Mem[0000000010101428] = 000000004e4f5db7, %l6 = 00000000000000ff, %l0 = 0000000000000000
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = 000000004e4f5db7
!	%l4 = 00000000ff000000, Mem[0000000010001408] = 0000000000000000
	stxa	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000ff000000
!	Mem[0000000010001410] = 000000ff, %l1 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	%l6 = 000000ff, %l7 = ff000000, Mem[00000000100c1400] = 000000ff ffd76dda
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff ff000000
!	%f19 = 000000ff, Mem[0000000030101408] = 0000a1ff
	sta	%f19,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff
!	Mem[0000000030041408] = ff000000, %l2 = 0000000000ff0000
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 00000000ff000000
!	%f20 = 00000000 00000000, %l1 = 00000000000000ff
!	Mem[0000000030141430] = 000016af00000000
	add	%i5,0x030,%g1
	stda	%f20,[%g1+%l1]ASI_PST8_S ! Mem[0000000030141430] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000ffffa1ff, %f20 = 00000000 00000000
	ldda	[%i5+%o5]0x89,%f20	! %f20 = 00000000 ffffa1ff

p0_label_347:
!	Mem[0000000030141408] = 3b3c0000, %l2 = 00000000ff000000
	lduha	[%i5+%o4]0x81,%l2	! %l2 = 0000000000003b3c
!	Mem[0000000010001410] = 00000000 000000ff, %l6 = 000000ff, %l7 = ff000000
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000010041408] = 00000000 00000000, %l0 = 4e4f5db7, %l1 = 000000ff
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
	membar	#Sync			! Added by membar checker (61)
!	Mem[0000000030041400] = 000000ff 0000003c 00ff0000 00000088
!	Mem[0000000030041410] = 00000000 acef4ef8 bb000000 00000000
!	Mem[0000000030041420] = ff000000 00000055 ff0000ff ffffff84
!	Mem[0000000030041430] = 0d2123e9 34e7136a 000016af fbf9d6b7
	ldda	[%i1]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000030001400] = 000000ff, %l1 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181428] = 00000000, %l3 = 0000000000000000
	ldsba	[%i6+0x02a]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l0 = 0000000000000000
	ldsba	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = ff000000, %f12 = acef4ef8
	lda	[%i3+%o4]0x80,%f12	! %f12 = ff000000
!	Mem[0000000010001400] = 000000ff, %l2 = 0000000000003b3c
	ldsha	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 9ca1ffff, %l3 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l3	! %l3 = 000000ff000000ff

p0_label_348:
!	%l0 = 00000000, %l1 = 000000ff, Mem[00000000300c1408] = ff6d0000 b7d6f9fb
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 000000ff
!	%l0 = 0000000000000000, Mem[0000000030141400] = 00000000
	stha	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[0000000010101438] = 000000ff, %l3 = 000000ff, %l5 = 00000000
	add	%i4,0x38,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010081410] = da6dd733
	stwa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%f12 = ff000000 d71f429a, Mem[0000000010101418] = ff00ffff 00000000
	stda	%f12,[%i4+0x018]%asi	! Mem[0000000010101418] = ff000000 d71f429a
!	Mem[0000000030041400] = ff000000, %l6 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141400] = 00000000, %l1 = 00000000000000ff
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%f6  = 00000000 ffff00ff, %l6 = 0000000000000000
!	Mem[0000000010141438] = 9a421fd5000000ff
	add	%i5,0x038,%g1
	stda	%f6,[%g1+%l6]ASI_PST8_P ! Mem[0000000010141438] = 9a421fd5000000ff
	membar	#Sync			! Added by membar checker (62)
!	%l6 = 0000000000000000, Mem[0000000030041408] = 0000ff00
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 6b6bb8ff, %l3 = 00000000000000ff
	ldsba	[%i6+%o5]0x89,%l3	! %l3 = ffffffffffffffff

p0_label_349:
!	Mem[0000000030181408] = d5f9f9fb, %l1 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l1	! %l1 = ffffffffd5f9f9fb
!	Mem[0000000030081408] = 5eb7ffff, %l3 = ffffffffffffffff
	lduba	[%i2+%o4]0x81,%l3	! %l3 = 000000000000005e
!	Mem[0000000030181410] = 6b6bb8ff, %l1 = ffffffffd5f9f9fb
	lduwa	[%i6+%o5]0x89,%l1	! %l1 = 000000006b6bb8ff
!	Mem[00000000100c141c] = fff2aaac, %l3 = 000000000000005e
	ldsb	[%i3+0x01f],%l3		! %l3 = ffffffffffffffac
!	Mem[0000000030041410] = 00000000, %f25 = 00000055
	lda	[%i1+%o5]0x81,%f25	! %f25 = 00000000
!	Mem[0000000030141410] = 00000000 ffffa1ff, %l4 = ff000000, %l5 = 000000ff
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 00000000ffffa1ff 0000000000000000
!	Mem[0000000030041400] = ff0000ff, %l2 = 00000000000000ff
	lduha	[%i1+%g0]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010101410] = ff000000, %l1 = 000000006b6bb8ff
	ldsha	[%i4+%o5]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000021800080] = ffff2e44, %l4 = 00000000ffffa1ff
	ldub	[%o3+0x080],%l4		! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 0000ff00, %l3 = ffffffac, Mem[0000000030041410] = 00000000 f84eefac
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000ff00 ffffffac

p0_label_350:
!	Mem[0000000030001408] = 000000ff, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141400] = ffb86b5e, %l3 = ffffffffffffffac
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 00000000ffb86b5e
!	%l0 = 000000ff, %l1 = ffffff00, Mem[0000000010081400] = df972197 ff000000
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff ffffff00
!	%l5 = 0000000000000000, Mem[0000000030101410] = ff000000
	stha	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000
!	%f12 = ff000000 d71f429a, Mem[0000000010081400] = ff000000 00ffffff
	stda	%f12,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000 d71f429a
!	Mem[0000000010101420] = da6dd733000000ff, %l2 = 000000000000ff00, %l5 = 0000000000000000
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = da6dd733000000ff
!	%l0 = 00000000000000ff, Mem[00000000211c0000] = 00ff58bc, %asi = 80
	stba	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff58bc
!	%l4 = 00000000000000ff, Mem[0000000010081410] = 00000000
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	%l4 = 00000000000000ff, Mem[0000000010001400] = 000000ff
	stba	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000ff 00000000, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000 00000000000000ff

p0_label_351:
!	Mem[00000000300c1408] = 00000000ff000000, %f20 = 00000000 acef4ef8
	ldda	[%i3+%o4]0x81,%f20	! %f20 = 00000000 ff000000
!	Mem[00000000100c1408] = 000000ff, %l0 = 00000000000000ff
	lduwa	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = 00000000 ffffa1ff, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 00000000ffffa1ff 0000000000000000
!	Mem[0000000030141400] = ff000000, %l2 = 000000000000ff00
	ldsha	[%i5+%g0]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[00000000211c0000] = ffff58bc, %l5 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000020800000] = ffff261d, %l0 = 00000000000000ff
	ldub	[%o1+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030101400] = ff000000, %l2 = ffffffffffffff00
	lduha	[%i4+%g0]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030001408] = 00000000, %l3 = 00000000ffb86b5e
	ldswa	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = 00ff0847, %l6 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001008143b] = 33b3288f, %l6 = 0000000000000000
	ldstub	[%i2+0x03b],%l6		! %l6 = 0000008f000000ff

p0_label_352:
!	%l4 = 00000000ffffa1ff, Mem[0000000030081400] = 9c00000000000000
	stxa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000ffffa1ff
!	Mem[0000000010101408] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010181400] = 9ca1ffff
	stha	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 9ca100ff
!	%l1 = ffffffffffffff00, Mem[0000000030101408] = da6dd7ff000000ff
	stxa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffffffffff00
!	%f28 = 0d2123e9 34e7136a, Mem[0000000010081408] = 00000000 00000000
	stda	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = 0d2123e9 34e7136a
!	%f6  = 00000000, Mem[0000000030101410] = 000000ff
	sta	%f6 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Mem[0000000010001400] = 000000ff, %l0 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l2 = 000000000000ff00, Mem[00000000100c1400] = 000000ff
	stwa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000ff00
!	%l3 = 00000000000000ff, Mem[0000000010001439] = ffffffff, %asi = 80
	stba	%l3,[%i0+0x039]%asi	! Mem[0000000010001438] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00ff0000, %l0 = 00000000000000ff
	ldsha	[%i1+%o5]0x81,%l0	! %l0 = 00000000000000ff

p0_label_353:
!	Mem[0000000030081408] = ffffb75e, %l5 = 000000000000ffff
	ldsba	[%i2+%o4]0x89,%l5	! %l5 = 000000000000005e
!	Mem[0000000010181408] = d5f9ffff, %l2 = 000000000000ff00
	ldswa	[%i6+%o4]0x88,%l2	! %l2 = ffffffffd5f9ffff
!	Mem[000000001008140c] = 34e7136a, %l0 = 00000000000000ff
	ldsha	[%i2+0x00c]%asi,%l0	! %l0 = 00000000000034e7
!	Mem[0000000010141410] = 00000000, %f8  = ff000000
	lda	[%i5+%o5]0x88,%f8 	! %f8 = 00000000
!	Mem[0000000030181400] = 00000000, %f26 = ff0000ff
	lda	[%i6+%g0]0x81,%f26	! %f26 = 00000000
!	Mem[0000000020800040] = ffff4bbb, %l0 = 00000000000034e7
	lduba	[%o1+0x040]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041420] = d7000000, %l0 = 00000000000000ff
	lduha	[%i1+0x020]%asi,%l0	! %l0 = 000000000000d700
!	Mem[0000000030041408] = 0000000000000088, %f22 = bb000000 00000000
	ldda	[%i1+%o4]0x81,%f22	! %f22 = 00000000 00000088
!	Mem[0000000010141410] = 000000000000006d, %l1 = ffffffffffffff00
	ldxa	[%i5+%o5]0x80,%l1	! %l1 = 000000000000006d
!	Starting 10 instruction Store Burst
!	%l2 = d5f9ffff, %l3 = 000000ff, Mem[0000000030041408] = 00000000 88000000
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = d5f9ffff 000000ff

p0_label_354:
!	Mem[0000000030041400] = ff0000ff, %l0 = 000000000000d700
	ldstuba	[%i1+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	%f0  = 6a13e734, Mem[0000000030101410] = 00000000
	sta	%f0 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 6a13e734
!	Mem[0000000010081408] = 0d2123e9, %l4 = 00000000ffffa1ff
	swapa	[%i2+%o4]0x80,%l4	! %l4 = 000000000d2123e9
!	Mem[0000000020800040] = ffff4bbb, %l4 = 000000000d2123e9
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 000000ff000000ff
!	%f2  = 00000000, Mem[00000000300c1408] = 00000000
	sta	%f2 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%f28 = 0d2123e9, Mem[0000000010041410] = 00000000
	sta	%f28,[%i1+%o5]0x88	! Mem[0000000010041410] = 0d2123e9
!	Mem[0000000020800040] = ffff4bbb, %l5 = 000000000000005e
	ldstuba	[%o1+0x040]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030001410] = 00000000, %l6 = 000000000000008f
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[000000001018140c] = 00ff00ff, %l4 = 000000ff, %l1 = 0000006d
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 0000000000ff00ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff58bc, %l3 = 00000000000000ff
	ldsba	[%o2+0x001]%asi,%l3	! %l3 = ffffffffffffffff

p0_label_355:
!	Mem[0000000010101438] = 00000000, %l2 = ffffffffd5f9ffff
	lduha	[%i4+0x038]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %f2  = 00000000
	lda	[%i1+%o4]0x88,%f2 	! %f2 = 00000000
!	Mem[0000000030181408] = 00000000 fbf9f9d5, %l0 = 000000ff, %l1 = 00ff00ff
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 00000000fbf9f9d5 0000000000000000
!	Mem[0000000030001400] = ff000000, %l0 = 00000000fbf9f9d5
	ldswa	[%i0+%g0]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[00000000100c142c] = 000000b8, %f25 = 00000000
	ld	[%i3+0x02c],%f25	! %f25 = 000000b8
!	Mem[0000000010181400] = 6a13e734 9ca100ff, %l0 = ff000000, %l1 = 00000000
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 000000009ca100ff 000000006a13e734
!	Mem[0000000030041408] = fffff9d5 ff000000, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 00000000fffff9d5 00000000ff000000
!	Mem[0000000010041408] = 0000000000000000, %l3 = ffffffffffffffff
	ldxa	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l5 = 00000000ff000000
	lduha	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = d5f9ffff, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 000000ff000000ff

p0_label_356:
!	%f23 = 00000088, Mem[0000000010101404] = 34e7136a
	sta	%f23,[%i4+0x004]%asi	! Mem[0000000010101404] = 00000088
!	%l6 = 00000000000000ff, Mem[0000000010101400] = 9ca1ffff
	stwa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	%f20 = 00000000 ff000000, Mem[00000000100c1420] = ffff16af ff000000
	stda	%f20,[%i3+0x020]%asi	! Mem[00000000100c1420] = 00000000 ff000000
!	%f14 = 10ffa19c ff000000, %l3 = 0000000000000000
!	Mem[0000000030181438] = 00000000fbf9d6b7
	add	%i6,0x038,%g1
	stda	%f14,[%g1+%l3]ASI_PST16_S ! Mem[0000000030181438] = 00000000fbf9d6b7
!	%l4 = 00000000fffff9d5, Mem[00000000100c1408] = 00006dff000000ff
	stxa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000fffff9d5
!	%l0 = 000000009ca100ff, Mem[0000000010141408] = 000000000000ffff
	stxa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000009ca100ff
!	Mem[0000000030081408] = ffffb75e, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 0000005e000000ff
!	Mem[000000001008142a] = ffffffff, %l7 = 000000000000005e
	ldstuba	[%i2+0x02a]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030141410] = ffffa1ff, %l2 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffff261d, %l3 = 0000000000000000
	lduh	[%o1+%g0],%l3		! %l3 = 000000000000ffff

p0_label_357:
!	Mem[0000000030141408] = 00003c3b, %l2 = 00000000000000ff
	lduba	[%i5+%o4]0x89,%l2	! %l2 = 000000000000003b
!	Mem[0000000010141420] = 000016af, %l6 = 00000000000000ff
	ldsw	[%i5+0x020],%l6		! %l6 = 00000000000016af
!	Mem[0000000010081410] = 000000ff, %l2 = 000000000000003b
	lduba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = 00000000, %l2 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141418] = 5e6bb8ff, %f9  = 33d76dda
	ld	[%i5+0x018],%f9 	! %f9 = 5e6bb8ff
!	Mem[00000000100c1408] = d5f9ffff, %l5 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l5	! %l5 = 00000000000000d5
!	Mem[0000000010001410] = 00000000000000ff, %f30 = 000016af fbf9d6b7
	ldda	[%i0+%o5]0x88,%f30	! %f30 = 00000000 000000ff
!	Mem[0000000030081400] = 00000000, %l5 = 00000000000000d5
	lduba	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000000
	lduh	[%i1+%g0],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 000000ff 0000003c 00ff0000 00000088
!	%f20 = 00000000 ff000000 00000000 00000088
!	%f24 = ff000000 000000b8 00000000 ffffff84
!	%f28 = 0d2123e9 34e7136a 00000000 000000ff
	stda	%f16,[%i4]ASI_BLK_AIUPL	! Block Store to 0000000010101400

p0_label_358:
!	%f13 = d71f429a, Mem[0000000010141408] = ff00a19c
	sta	%f13,[%i5+%o4]0x80	! Mem[0000000010141408] = d71f429a
!	%l0 = 9ca100ff, %l1 = 6a13e734, Mem[0000000010001410] = 000000ff 00000000
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 9ca100ff 6a13e734
!	%l2 = 0000000000000000, Mem[0000000030081410] = 00000000
	stba	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[00000000100c142f] = 000000b8, %l5 = 0000000000000000
	ldstuba	[%i3+0x02f]%asi,%l5	! %l5 = 000000b8000000ff
!	%l2 = 0000000000000000, Mem[00000000300c1410] = da6dd7ff7fff0000
	stxa	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	%l4 = fffff9d5, %l5 = 000000b8, Mem[0000000010141410] = 00000000 0000006d
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = fffff9d5 000000b8
!	%f2  = 00000000 000000ff, %l1 = 000000006a13e734
!	Mem[0000000010141408] = d71f429a00000000
	add	%i5,0x008,%g1
	stda	%f2,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010141408] = d71f429a00000000
!	%f8  = 00000000 5e6bb8ff, %l1 = 000000006a13e734
!	Mem[0000000030141438] = b7d6f9fb9ca19d10
	add	%i5,0x038,%g1
	stda	%f8,[%g1+%l1]ASI_PST32_S ! Mem[0000000030141438] = b7d6f9fb9ca19d10
!	%f0  = 6a13e734 9ca1ffff 00000000 000000ff
!	%f4  = ff000000 000000ff 00000000 ffff00ff
!	%f8  = 00000000 5e6bb8ff b75d4f4e 00000000
!	%f12 = ff000000 d71f429a 10ffa19c ff000000
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000, %l3 = 000000000000ffff
	lduba	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000000

p0_label_359:
!	Mem[0000000030101408] = 00ffffff, %l3 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (63)
!	Mem[0000000030041410] = ff000000000000ff, %f22 = 00000000 00000088
	ldda	[%i1+%o5]0x81,%f22	! %f22 = ff000000 000000ff
!	Mem[0000000010041410] = e923210d, %f26 = 00000000
	lda	[%i1+%o5]0x80,%f26	! %f26 = e923210d
!	Mem[0000000021800000] = ff00951b, %l0 = 000000009ca100ff
	ldub	[%o3+0x001],%l0		! %l0 = 0000000000000000
!	Mem[0000000030181410] = 6b6bb8ff, %l6 = 00000000000016af
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181408] = fffff9d5, %f24 = ff000000
	lda	[%i6+%o4]0x80,%f24	! %f24 = fffff9d5
!	Mem[00000000201c0000] = 00ff0847, %l1 = 000000006a13e734
	ldsba	[%o0+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001400] = 000000ff, %l1 = ffffffffffffffff
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = 000000000d2123e9, %f30 = 00000000 000000ff
	ldda	[%i1+%o5]0x88,%f30	! %f30 = 00000000 0d2123e9
!	Starting 10 instruction Store Burst
!	%f22 = ff000000 000000ff, Mem[0000000010101410] = 000000ff 00000000
	stda	%f22,[%i4+%o5]0x80	! Mem[0000000010101410] = ff000000 000000ff

p0_label_360:
!	Mem[0000000010141414] = 000000b8, %l1 = 00000000000000ff
	swap	[%i5+0x014],%l1		! %l1 = 00000000000000b8
!	Mem[000000001014142c] = 16afb44d, %l1 = 00000000000000b8, %asi = 80
	swapa	[%i5+0x02c]%asi,%l1	! %l1 = 0000000016afb44d
!	Mem[0000000010001408] = ff000000, %l7 = 00000000000000ff
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 00000000ff000000
!	%f2  = 00000000 000000ff, Mem[0000000010001410] = 9ca100ff 6a13e734
	stda	%f2 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 000000ff
!	%l1 = 0000000016afb44d, Mem[0000000030101408] = ffffffffffffff00
	stxa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000016afb44d
!	%l4 = fffff9d5, %l5 = 000000b8, Mem[0000000010041400] = 00000000 9ca1ffff
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = fffff9d5 000000b8
!	Mem[0000000010101400] = 3c000000, %l3 = 00000000000000ff
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 000000003c000000
!	%l0 = 0000000000000000, Mem[0000000010101410] = 000000ff
	stha	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000010041400] = fffff9d5, %l3 = 3c000000, %l0 = 00000000
	casa	[%i1]0x80,%l3,%l0	! %l0 = 00000000fffff9d5
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000000 00000000, %l6 = ffffffff, %l7 = ff000000
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 00000000ff000000 0000000000000000

p0_label_361:
!	Mem[0000000010141400] = acffffff, %l6 = 00000000ff000000
	ldsb	[%i5+0x003],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000300c1408] = 00000000, %l3 = 000000003c000000
	ldsba	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (64)
!	Mem[0000000030101400] = ff000000 000000ff 4db4af16 00000000
!	Mem[0000000030101410] = 34e7136a 00000000 982a3c92 ff0000ff
!	Mem[0000000030101420] = d7000000 ffffffff b7d6f9fb 00000000
!	Mem[0000000030101430] = 00000000 af160000 ff0000ff ffffffff
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[00000000211c0000] = ffff58bc, %l1 = 0000000016afb44d
	ldsba	[%o2+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141410] = fffff9d5, %f4  = ff000000
	lda	[%i5+%o5]0x80,%f4 	! %f4 = fffff9d5
!	Mem[0000000010141420] = 000016af, %l4 = 00000000fffff9d5
	lduw	[%i5+0x020],%l4		! %l4 = 00000000000016af
!	Mem[00000000300c1400] = ff3c0000, %l5 = 00000000000000b8
	ldswa	[%i3+%g0]0x89,%l5	! %l5 = ffffffffff3c0000
!	Mem[0000000010041410] = 0d2123e9, %l3 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = ffffffffffffffe9
!	Mem[0000000010001408] = ff00000000000000, %l1 = ffffffffffffffff
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = ff00000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 00000000, %l2 = 0000000000000000, %asi = 80
	swapa	[%i4+0x010]%asi,%l2	! %l2 = 0000000000000000

p0_label_362:
!	%l7 = 0000000000000000, Mem[00000000300c1400] = ff3c0000
	stwa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Mem[00000000201c0001] = 00ff0847, %l7 = 0000000000000000
	ldstub	[%o0+0x001],%l7		! %l7 = 000000ff000000ff
!	Mem[00000000211c0000] = ffff58bc, %l4 = 00000000000016af
	ldstub	[%o2+%g0],%l4		! %l4 = 000000ff000000ff
!	Code Fragment 3
p0_fragment_13:
!	%l0 = 00000000fffff9d5
	setx	0xdab565300fba8c31,%g7,%l0 ! %l0 = dab565300fba8c31
!	%l1 = ff00000000000000
	setx	0x0e54762860205b2b,%g7,%l1 ! %l1 = 0e54762860205b2b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dab565300fba8c31
	setx	0x5aee211f8b4038fa,%g7,%l0 ! %l0 = 5aee211f8b4038fa
!	%l1 = 0e54762860205b2b
	setx	0xda5899181c660481,%g7,%l1 ! %l1 = da5899181c660481
!	%l4 = 00000000000000ff, Mem[0000000010101420] = b8000000000000ff
	stx	%l4,[%i4+0x020]		! Mem[0000000010101420] = 00000000000000ff
!	%l4 = 000000ff, %l5 = ff3c0000, Mem[00000000300c1408] = 00000000 000000ff
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff ff3c0000
!	%l4 = 00000000000000ff, Mem[0000000020800001] = ffff261d, %asi = 80
	stba	%l4,[%o1+0x001]%asi	! Mem[0000000020800000] = ffff261d
!	Mem[0000000010041408] = 00000000, %l3 = ffffffe9, %l2 = 00000000
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l3,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141414] = 000000ff, %l4 = 000000ff, %l0 = 8b4038fa
	add	%i5,0x14,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041404] = 000000b8, %l2 = 0000000000000000
	lduba	[%i1+0x007]%asi,%l2	! %l2 = 00000000000000b8

p0_label_363:
!	Mem[00000000300c1408] = 000000ff, %l7 = 00000000000000ff
	ldswa	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001400] = ff000000, %l7 = 00000000000000ff
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010101408] = 88000000, %l6 = ffffffffffffffff
	lduha	[%i4+%o4]0x80,%l6	! %l6 = 0000000000008800
!	Mem[0000000030081410] = 00000000, %l6 = 0000000000008800
	lduwa	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = 00000000ffffa1ff, %l0 = 00000000000000ff
	ldxa	[%i2+%g0]0x81,%l0	! %l0 = 00000000ffffa1ff
!	Mem[00000000201c0000] = 00ff0847, %l3 = ffffffffffffffe9
	ldub	[%o0+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[00000000300c1408] = ff000000, %l2 = 00000000000000b8
	lduba	[%i3+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000021800100] = ffeb8452, %l5 = ffffffffff3c0000
	ldsh	[%o3+0x100],%l5		! %l5 = ffffffffffffffeb
!	Mem[00000000100c1400] = 00ff0000, %f4  = fffff9d5
	lda	[%i3+%g0]0x80,%f4 	! %f4 = 00ff0000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 10000000, %l0 = 00000000ffffa1ff
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 0000000010000000

p0_label_364:
!	%l3 = 00000000000000ff, Mem[0000000030081410] = 00000000
	stwa	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff
!	%l1 = da5899181c660481, Mem[0000000010081410] = ff000000
	stwa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 1c660481
!	%f0  = 6a13e734 9ca1ffff 00000000 000000ff
!	%f4  = 00ff0000 000000ff 00000000 ffff00ff
!	%f8  = 00000000 5e6bb8ff b75d4f4e 00000000
!	%f12 = ff000000 d71f429a 10ffa19c ff000000
	stda	%f0,[%i2]ASI_COMMIT_P	! Block Store to 0000000010081400
!	%f30 = ff0000ff ffffffff, Mem[0000000010101400] = 000000ff ff000000
	stda	%f30,[%i4+0x000]%asi	! Mem[0000000010101400] = ff0000ff ffffffff
!	%f31 = ffffffff, Mem[0000000030081408] = ffb7ffff
	sta	%f31,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffffff
!	Mem[0000000010001408] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 000000ff000000ff
!	%f30 = ff0000ff ffffffff, Mem[0000000010181410] = ffb86b6b ff000000
	stda	%f30,[%i6+%o5]0x88	! Mem[0000000010181410] = ff0000ff ffffffff
	membar	#Sync			! Added by membar checker (65)
!	%l0 = 10000000, %l1 = 1c660481, Mem[0000000030101408] = 4db4af16 00000000
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 10000000 1c660481
!	%l2 = 00000000000000ff, Mem[00000000211c0000] = ffff58bc, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff58bc
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 6b6bb8ff, %l4 = 00000000000000ff
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 000000000000b8ff

p0_label_365:
!	Mem[0000000010101408] = 00000088, %l0 = 0000000010000000
	ldswa	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000088
!	Mem[0000000030081408] = ffffffff, %l2 = 00000000000000ff
	ldswa	[%i2+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001408] = 000000ff, %l2 = ffffffffffffffff
	lduwa	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081408] = ffffffff, %l6 = 00000000000000ff
	lduba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001418] = 0000ff00, %l3 = 00000000000000ff
	ldsha	[%i0+0x01a]%asi,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010081400] = ffffa19c 34e7136a, %l0 = 00000088, %l1 = 1c660481
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 0000000034e7136a 00000000ffffa19c
!	Mem[00000000100c1400] = 00ff0000000000ff, %f10 = b75d4f4e 00000000
	ldda	[%i3+0x000]%asi,%f10	! %f10 = 00ff0000 000000ff
!	Mem[0000000030001408] = 0000000000000000, %f0  = 6a13e734 9ca1ffff
	ldda	[%i0+%o4]0x89,%f0 	! %f0  = 00000000 00000000
!	Mem[0000000010101410] = 00000000000000ff, %f20 = 34e7136a 00000000
	ldda	[%i4+%o5]0x80,%f20	! %f20 = 00000000 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 6b6bb8ff, %l0 = 0000000034e7136a
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 000000006b6bb8ff

p0_label_366:
!	Mem[0000000010001418] = 0000ff00ebbbffff, %l4 = 000000000000b8ff, %l4 = 000000000000b8ff
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l4,%l4	! %l4 = 0000ff00ebbbffff
!	%f0  = 00000000 00000000, Mem[0000000030041400] = 6a13e734 9ca1ffff
	stda	%f0 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 00000000
!	Mem[0000000010181408] = fffff9d5, %l5 = ffffffffffffffeb, %asi = 80
	swapa	[%i6+0x008]%asi,%l5	! %l5 = 00000000fffff9d5
!	%l5 = 00000000fffff9d5, Mem[0000000010001410] = 000000ff
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = fffff9d5
!	Mem[0000000010041400] = fffff9d5, %l2 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%l4 = ebbbffff, %l5 = fffff9d5, Mem[0000000030041400] = 00000000 00000000
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = ebbbffff fffff9d5
!	%l7 = ffffffffffffff00, Mem[0000000010181430] = 9a421fd7, %asi = 80
	stwa	%l7,[%i6+0x030]%asi	! Mem[0000000010181430] = ffffff00
!	%l0 = 000000006b6bb8ff, Mem[000000001014141e] = 00003c3b, %asi = 80
	stha	%l0,[%i5+0x01e]%asi	! Mem[000000001014141c] = 0000b8ff
!	%l7 = ffffffffffffff00, Mem[00000000100c1400] = 0000ff00
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff0000ffffffffff, %l6 = 00000000000000ff
	ldxa	[%i6+%o5]0x88,%l6	! %l6 = ff0000ffffffffff

p0_label_367:
!	Mem[00000000300c1408] = ff000000, %l1 = 00000000ffffa19c
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030141408] = 3b3c000000000000, %l2 = 00000000000000ff
	ldxa	[%i5+%o4]0x81,%l2	! %l2 = 3b3c000000000000
!	Mem[0000000010181400] = 6a13e734 9ca100ff, %l0 = 6b6bb8ff, %l1 = ffffff00
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 000000009ca100ff 000000006a13e734
!	Mem[00000000300c1400] = 00000000, %l0 = 000000009ca100ff
	lduba	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 000000ff, %l1 = 000000006a13e734
	lduha	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001400] = ff000000, %l6 = ff0000ffffffffff
	lduha	[%i0+%g0]0x81,%l6	! %l6 = 000000000000ff00
!	Mem[0000000020800000] = ffff261d, %l5 = 00000000fffff9d5
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030081400] = ffa1ffff00000000, %l4 = 0000ff00ebbbffff
	ldxa	[%i2+%g0]0x89,%l4	! %l4 = ffa1ffff00000000
!	Mem[00000000100c1408] = d5f9ffff, %l6 = 000000000000ff00
	ldsb	[%i3+0x00a],%l6		! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = d5f9ffff, %l6 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 000000d5000000ff

p0_label_368:
!	%l5 = 000000000000ffff, Mem[0000000010101408] = 88000000
	stwa	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000ffff
!	%l6 = 000000d5, %l7 = ffffff00, Mem[0000000010101400] = ff0000ff ffffffff
	stda	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000d5 ffffff00
!	%f10 = 00ff0000 000000ff, %l1 = 00000000000000ff
!	Mem[0000000030001410] = 0000008fff000000
	add	%i0,0x010,%g1
	stda	%f10,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030001410] = ff0000000000ff00
!	%l1 = 00000000000000ff, Mem[0000000010001437] = 0000ff84, %asi = 80
	stba	%l1,[%i0+0x037]%asi	! Mem[0000000010001434] = 0000ffff
!	%l3 = ffffffffffffff00, Mem[0000000030101410] = 6a13e734
	stha	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 6a13ff00
!	%l4 = ffa1ffff00000000, Mem[0000000010101400] = d5000000
	stwa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Mem[0000000030101410] = 6a13ff00, %l0 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1408] = 000000ff, %l3 = ffffffffffffff00
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000300c1400] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 34e7136a, %l5 = 000000000000ffff
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 000000000000136a

p0_label_369:
!	Mem[00000000100c1410] = 0d2123e9 ffa1ffff, %l6 = 000000d5, %l7 = ffffff00
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 00000000ffa1ffff 000000000d2123e9
!	Mem[0000000021800180] = ff84809b, %l4 = ffa1ffff00000000
	ldsba	[%o3+0x181]%asi,%l4	! %l4 = ffffffffffffff84
!	Mem[0000000010181410] = ffffffff, %l0 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010081420] = 00000000, %l2 = 3b3c000000000000
	ldub	[%i2+0x021],%l2		! %l2 = 0000000000000000
!	Mem[0000000021800140] = 00fff4c2, %l2 = 0000000000000000
	ldsh	[%o3+0x140],%l2		! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (66)
!	Mem[0000000030041400] = ffffbbeb d5f9ffff 00000000 000000ff
!	Mem[0000000030041410] = ff000000 000000ff 00000000 ffff00ff
!	Mem[0000000030041420] = 00000000 5e6bb8ff b75d4f4e 00000000
!	Mem[0000000030041430] = ff000000 d71f429a 10ffa19c ff000000
	ldda	[%i1]ASI_BLK_AIUS,%f16	! Block Load from 0000000030041400
!	Mem[0000000010081408] = 00000000, %l7 = 000000000d2123e9
	ldsha	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = ff000000, %l0 = 00000000ffffffff
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030101400] = ff000000 000000ff 10000000 1c660481
!	Mem[0000000030101410] = ffff136a 00000000 982a3c92 ff0000ff
!	Mem[0000000030101420] = d7000000 ffffffff b7d6f9fb 00000000
!	Mem[0000000030101430] = 00000000 af160000 ff0000ff ffffffff
	ldda	[%i4]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030101400
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000136a, Mem[0000000010181400] = 9ca100ff
	stwa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000136a

p0_label_370:
!	%l1 = 00000000000000ff, Mem[0000000030081410] = 000000ff
	stha	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 00ff00ff
!	%l6 = 00000000ffa1ffff, Mem[0000000030141400] = ffffffff
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffff
!	Mem[0000000010101410] = 00000000, %l6 = 00000000ffa1ffff
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%l2 = 00000000000000ff, Mem[000000001008143c] = ff000000
	stb	%l2,[%i2+0x03c]		! Mem[000000001008143c] = ff000000
	membar	#Sync			! Added by membar checker (67)
!	%l5 = 000000000000136a, Mem[0000000030041408] = 00000000
	stha	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 136a0000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010001418] = 0000ff00 ebbbffff
	stda	%l6,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000000 00000000
!	%l7 = 0000000000000000, Mem[0000000010081404] = 9ca1ffff
	stb	%l7,[%i2+0x004]		! Mem[0000000010081404] = 00a1ffff
!	%l3 = 0000000000000000, Mem[0000000010081438] = 10ffa19cff000000, %asi = 80
	stxa	%l3,[%i2+0x038]%asi	! Mem[0000000010081438] = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l2 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff000000, %l5 = 000000000000136a
	lduha	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_371:
!	Mem[0000000010181400] = 0000136a, %l6 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 000000000000136a
!	Mem[0000000030141408] = 3b3c0000, %l6 = 000000000000136a
	lduba	[%i5+%o4]0x81,%l6	! %l6 = 000000000000003b
!	Mem[0000000010101410] = ffa1ffff, %l5 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041400] = fffff9d5, %l4 = ffffffffffffff84
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141438] = 9a421fd5 000000ff, %l2 = ff000000, %l3 = 00000000
	ldda	[%i5+0x038]%asi,%l2	! %l2 = 000000009a421fd5 00000000000000ff
!	Mem[0000000020800000] = ffff261d, %l4 = ffffffffffffffff
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010001410] = fffff9d5, %l3 = 00000000000000ff
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = fffffffffffff9d5
!	Mem[0000000010041400] = fffff9d5000000b8, %l4 = 000000000000ffff
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = fffff9d5000000b8
!	Mem[0000000010041424] = ffd76dda, %l4 = fffff9d5000000b8
	lduwa	[%i1+0x024]%asi,%l4	! %l4 = 00000000ffd76dda
!	Starting 10 instruction Store Burst
!	%f20 = 00000000 6a13ffff, Mem[00000000100c1408] = fffff9ff 00000000
	stda	%f20,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 6a13ffff

p0_label_372:
!	%l5 = 00000000000000ff, Mem[0000000010081432] = ff000000
	stb	%l5,[%i2+0x032]		! Mem[0000000010081430] = ff00ff00
!	%f12 = ff000000 d71f429a, Mem[0000000030181400] = 00000000 00000000
	stda	%f12,[%i6+%g0]0x89	! Mem[0000000030181400] = ff000000 d71f429a
!	Mem[0000000010101420] = 00000000, %l3 = fffffffffffff9d5
	ldstub	[%i4+0x020],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010101409] = 0000ffff, %l5 = 00000000000000ff
	ldstub	[%i4+0x009],%l5		! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000100c1408] = 000000006a13ffff
	stxa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000000
!	Mem[0000000010101418] = 8800000000000000, %l1 = 00000000000000ff, %l2 = 000000009a421fd5
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = 8800000000000000
!	%f16 = ff000000 000000ff, %l2 = 8800000000000000
!	Mem[0000000030101438] = ff0000ffffffffff
	add	%i4,0x038,%g1
	stda	%f16,[%g1+%l2]ASI_PST8_S ! Mem[0000000030101438] = ff0000ffffffffff
!	%f19 = 00000010, Mem[000000001018143c] = 9ca1ff10
	st	%f19,[%i6+0x03c]	! Mem[000000001018143c] = 00000010
!	%l5 = 0000000000000000, Mem[0000000020800040] = ffff4bbb, %asi = 80
	stba	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = 00ff4bbb
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l0 = 00000000ff000000
	ldswa	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000

p0_label_373:
!	Mem[0000000010001400] = ff000000, %f23 = 923c2a98
	lda	[%i0+%g0]0x80,%f23	! %f23 = ff000000
!	Mem[0000000030181408] = d5f9f9fb, %l6 = 000000000000003b
	lduba	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000d5
!	Mem[0000000030081408] = ffffffffffffffff, %f28 = 000016af 00000000
	ldda	[%i2+%o4]0x89,%f28	! %f28 = ffffffff ffffffff
!	Mem[00000000211c0000] = 00ff58bc, %l0 = 0000000000000000
	ldsba	[%o2+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181424] = 000000ff, %f30 = ffffffff
	lda	[%i6+0x024]%asi,%f30	! %f30 = 000000ff
!	Mem[00000000300c1400] = 000000ff, %l1 = 00000000000000ff
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Code Fragment 3
p0_fragment_14:
!	%l0 = 0000000000000000
	setx	0xfcf14458073bdb26,%g7,%l0 ! %l0 = fcf14458073bdb26
!	%l1 = 0000000000000000
	setx	0xc29aefe7c1c435b6,%g7,%l1 ! %l1 = c29aefe7c1c435b6
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fcf14458073bdb26
	setx	0xba5e13c0750018c8,%g7,%l0 ! %l0 = ba5e13c0750018c8
!	%l1 = c29aefe7c1c435b6
	setx	0x007075e859f21c46,%g7,%l1 ! %l1 = 007075e859f21c46
!	Mem[0000000010081400] = 34e7136a, %l3 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l3	! %l3 = 000000000000136a
!	Mem[0000000010041420] = d7000000ffd76dda, %f20 = 00000000 6a13ffff
	ldda	[%i1+0x020]%asi,%f20	! %f20 = d7000000 ffd76dda
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000136a, Mem[0000000010181410] = ffffffffff0000ff, %asi = 80
	stxa	%l3,[%i6+0x010]%asi	! Mem[0000000010181410] = 000000000000136a

p0_label_374:
!	%l2 = 8800000000000000, Mem[0000000030001400] = ff000000
	stba	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l0 = ba5e13c0750018c8, Mem[0000000010081410] = ff0000000000ff00
	stxa	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = ba5e13c0750018c8
!	%l2 = 8800000000000000, Mem[0000000030001400] = 00000000
	stba	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%f0  = 00000000 00000000 00000000 000000ff
!	%f4  = 00ff0000 000000ff 00000000 ffff00ff
!	%f8  = 00000000 5e6bb8ff 00ff0000 000000ff
!	%f12 = ff000000 d71f429a 10ffa19c ff000000
	stda	%f0,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%l3 = 000000000000136a, Mem[0000000010181410] = 00000000
	stba	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000006a
!	%l6 = 00000000000000d5, Mem[0000000020800001] = ffff261d, %asi = 80
	stba	%l6,[%o1+0x001]%asi	! Mem[0000000020800000] = ffd5261d
!	%l2 = 8800000000000000, Mem[0000000030181408] = d5f9f9fb
	stwa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%l2 = 8800000000000000, Mem[0000000010101408] = 00ffffff
	stwa	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Mem[0000000010181404] = 34e7136a, %l2 = 8800000000000000, %asi = 80
	swapa	[%i6+0x004]%asi,%l2	! %l2 = 0000000034e7136a
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (68)
!	Mem[00000000100c1438] = ff0000ff 87ffc6cd, %l0 = 750018c8, %l1 = 59f21c46
	ldda	[%i3+0x038]%asi,%l0	! %l0 = 00000000ff0000ff 0000000087ffc6cd

p0_label_375:
!	Mem[000000001008140c] = 000000ff, %l6 = 00000000000000d5
	ldswa	[%i2+0x00c]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = 00000000 00ffffff 00000000 0000ff00
!	Mem[0000000010101410] = ffa1ffff 000000ff 88000000 00000000
!	Mem[0000000010101420] = ff000000 000000ff 84ffffff 00000000
!	Mem[0000000010101430] = 6a13e734 e923210d ff000000 00000000
	ldda	[%i4]ASI_BLK_PL,%f16	! Block Load from 0000000010101400
!	Mem[0000000020800000] = ffd5261d, %l3 = 000000000000136a
	lduh	[%o1+%g0],%l3		! %l3 = 000000000000ffd5
!	Mem[00000000211c0000] = 00ff58bc, %l1 = 0000000087ffc6cd
	ldub	[%o2+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff58bc, %l6 = 00000000000000ff
	ldsba	[%o2+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l2 = 0000000034e7136a
	lduwa	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = 000000ff, %l4 = 00000000ffd76dda
	ldswa	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l7 = 0000000000000000
	ldswa	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l3 = 000000000000ffd5
	ldsha	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[00000000300c1400] = 00000000
	stha	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00ff0000

p0_label_376:
!	Mem[0000000010001400] = 000000ff, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[00000000100c1404] = 000000ff
	sth	%l1,[%i3+0x004]		! Mem[00000000100c1404] = 00ff00ff
!	Mem[0000000010101414] = 000000ff, %l3 = ffffff00, %l4 = 000000ff
	add	%i4,0x14,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (69)
!	%f1  = 00000000, Mem[0000000010101410] = ffa1ffff
	sta	%f1 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l5 = 00000000000000ff, Mem[0000000010001408] = 00000000000000ff
	stxa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000000000ff
!	Mem[0000000010001408] = ff000000, %l4 = 000000ff, %l2 = 00000000
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010101400] = 00000000, %l2 = 00000000ff000000
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081408] = ffffffff, %l0 = 00000000ff0000ff
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ffffffff
!	%f8  = 00000000, Mem[0000000010001408] = ff000000
	sta	%f8 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[000000001008143c] = 00000000, %l1 = 00000000000000ff
	ldsh	[%i2+0x03e],%l1		! %l1 = 0000000000000000

p0_label_377:
!	Mem[00000000100c1400] = 00ffffff 00ff00ff 00000000 00000000
!	Mem[00000000100c1410] = ffffa1ff e923210d ffffffff fff2aaac
!	Mem[00000000100c1420] = 00000000 ff000000 982aff92 000000ff
!	Mem[00000000100c1430] = 00000000 00000000 ff0000ff 87ffc6cd
	ldda	[%i3]ASI_BLK_PL,%f0	! Block Load from 00000000100c1400
!	Mem[00000000300c1410] = 00ff0000000000ff, %f30 = 00000000 000000ff
	ldda	[%i3+%o5]0x89,%f30	! %f30 = 00ff0000 000000ff
!	Mem[00000000201c0000] = 00ff0847, %l5 = 00000000000000ff
	ldsba	[%o0+0x001]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001400] = 00000000, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = ff000000, %l3 = ffffffffffffff00
	lduha	[%i3+%o5]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[00000000100c1428] = 982aff92000000ff, %l5 = ffffffffffffffff
	ldx	[%i3+0x028],%l5		! %l5 = 982aff92000000ff
!	Mem[00000000300c1408] = 00000000000000ff, %f30 = 00ff0000 000000ff
	ldda	[%i3+%o4]0x89,%f30	! %f30 = 00000000 000000ff
!	Mem[0000000030041408] = 136a0000, %l2 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000013
!	Mem[0000000010181410] = 6a000000, %l3 = 000000000000ff00
	lduwa	[%i6+%o5]0x80,%l3	! %l3 = 000000006a000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010081416] = c0135eba, %asi = 80
	stha	%l7,[%i2+0x016]%asi	! Mem[0000000010081414] = c0130000

p0_label_378:
!	Mem[00000000300c1400] = 0000ff00, %l5 = 982aff92000000ff
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%f18 = 00ff0000, Mem[0000000010101400] = ff000000
	sta	%f18,[%i4+%g0]0x80	! Mem[0000000010101400] = 00ff0000
!	Mem[000000001008143b] = 00000000, %l4 = 00000000000000ff
	ldstub	[%i2+0x03b],%l4		! %l4 = 00000000000000ff
!	Mem[0000000021800001] = ff00951b, %l7 = 0000000000000000
	ldstub	[%o3+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010141408] = 9a421fd7, %l3 = 000000006a000000
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 000000009a421fd7
!	Mem[0000000010181418] = ff00ffff00000000, %l6 = 0000000000000000, %l0 = 00000000ffffffff
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = ff00ffff00000000
!	%l6 = 0000000000000000, Mem[0000000030081400] = 00000000
	stwa	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[0000000010181408] = ffffffeb00ff00ff, %l4 = 0000000000000000, %l7 = 0000000000000000
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = ffffffeb00ff00ff
!	%f24 = ff000000 000000ff, Mem[0000000010101400] = 0000ff00 ffffff00
	stda	%f24,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 0000136a, %l1 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 000000000000136a

p0_label_379:
!	Mem[0000000030001408] = 00000000, %l7 = ffffffeb00ff00ff
	lduwa	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 00ff0847, %l7 = 0000000000000000
	ldsh	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = 00ffffff, %f29 = 34e7136a
	lda	[%i3+%g0]0x80,%f29	! %f29 = 00ffffff
!	Mem[0000000010001408] = 00000000, %l4 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = 000000000000ff00, %l2 = 0000000000000013
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = 000000000000ff00
	membar	#Sync			! Added by membar checker (70)
!	Mem[00000000300c1400] = ffff0000 00000000 ff000000 00000000
!	Mem[00000000300c1410] = ff000000 0000ff00 ff00ffff 00000000
!	Mem[00000000300c1420] = ffb86b5e 00000000 ff000000 0000ff00
!	Mem[00000000300c1430] = 9a421fd7 000000ff 000000ff 9ca1ff10
	ldda	[%i3]ASI_BLK_AIUS,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030081400] = 00000000, %l1 = 000000000000136a
	lduba	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 0000ffff, %f28 = 0d2123e9
	lda	[%i3+%g0]0x89,%f28	! %f28 = 0000ffff
!	Mem[0000000010081410] = c8180075, %l0 = ff00ffff00000000
	lduwa	[%i2+%o5]0x80,%l0	! %l0 = 00000000c8180075
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (71)
!	%f21 = ffffa1ff, Mem[00000000300c1400] = ffff0000
	sta	%f21,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffa1ff

p0_label_380:
!	Mem[0000000010001414] = 00000000, %l3 = 000000009a421fd7
	ldstuba	[%i0+0x014]%asi,%l3	! %l3 = 00000000000000ff
!	%f18 = 00ff0000, Mem[0000000010181418] = ff00ffff
	sta	%f18,[%i6+0x018]%asi	! Mem[0000000010181418] = 00ff0000
!	Mem[0000000010041410] = 0d2123e9, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 000000e9000000ff
!	%f18 = 00ff0000 00000000, Mem[0000000010001400] = 00000000 33d76dda
	stda	%f18,[%i0+%g0]0x88	! Mem[0000000010001400] = 00ff0000 00000000
!	Mem[0000000010181434] = f84eefac, %l2 = 000000000000ff00
	swap	[%i6+0x034],%l2		! %l2 = 00000000f84eefac
!	%l2 = 00000000f84eefac, Mem[0000000010101408] = 00000000
	stwa	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = f84eefac
!	Mem[0000000030081408] = ff0000ff, %l7 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	%l6 = 0000000000000000, Mem[0000000010141438] = 9a421fd5, %asi = 80
	stha	%l6,[%i5+0x038]%asi	! Mem[0000000010141438] = 00001fd5
!	Mem[0000000010001410] = fffff9d5, %l5 = 00000000000000e9
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 000000d5000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00ff00ff, %l4 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l4	! %l4 = 00000000000000ff

p0_label_381:
!	Mem[0000000030101408] = 10000000, %l3 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l3	! %l3 = 0000000010000000
!	Mem[0000000030001410] = 000000ff, %f21 = ffffa1ff
	lda	[%i0+%o5]0x89,%f21	! %f21 = 000000ff
!	Mem[0000000010141410] = fa38408bd5f9ffff, %l3 = 0000000010000000
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = fa38408bd5f9ffff
!	%l2 = 00000000f84eefac, Mem[0000000030081400] = ffa1ffff00000000
	stxa	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000f84eefac
!	%f16 = ffffff00, Mem[0000000010081408] = 00000000
	sta	%f16,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffff00
!	Mem[0000000010101404] = 000000ff, %f29 = 00ffffff
	ld	[%i4+0x004],%f29	! %f29 = 000000ff
!	Mem[000000001000140c] = 00000000, %l5 = 00000000000000d5
	ldsha	[%i0+0x00e]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = ffffff00, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1438] = ff0000ff, %l3 = fa38408bd5f9ffff
	ldsha	[%i3+0x03a]%asi,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010041400] = d5f9ffff b8000000
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff 00000000

p0_label_382:
!	%l7 = 00000000000000ff, Mem[00000000100c1436] = 00000000, %asi = 80
	stha	%l7,[%i3+0x036]%asi	! Mem[00000000100c1434] = 000000ff
!	%l3 = 00000000000000ff, Mem[0000000030081408] = ffffffffff0000ff
	stxa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000ff
!	%f2  = ff000000 00000000, %l5 = 0000000000000000
!	Mem[0000000010181400] = 6a13000000000000
	stda	%f2,[%i6+%l5]ASI_PST8_P ! Mem[0000000010181400] = 6a13000000000000
!	%f30 = 00000000 000000ff, Mem[0000000010041400] = ff000000 00000000
	stda	%f30,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 000000ff
!	Mem[00000000201c0001] = 00ff0847, %l7 = 00000000000000ff
	ldstub	[%o0+0x001],%l7		! %l7 = 000000ff000000ff
!	%f22 = 00000000 00000088, Mem[0000000030001410] = 000000ff 00ff0000
	stda	%f22,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 00000088
!	%l1 = 0000000000000000, Mem[0000000010081408] = 00ffffff
	stwa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%f3  = 00000000, Mem[00000000300c1400] = ffffa1ff
	sta	%f3 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%f0  = ffff0000 00000000, %l6 = 0000000000000000
!	Mem[0000000030101410] = ffff136a00000000
	add	%i4,0x010,%g1
	stda	%f0,[%g1+%l6]ASI_PST16_S ! Mem[0000000030101410] = ffff136a00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = acffffff, %l5 = 0000000000000000
	ldsw	[%i5+%g0],%l5		! %l5 = ffffffffacffffff

p0_label_383:
!	Mem[00000000300c1408] = 000000ff, %l3 = 00000000000000ff
	lduba	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %f6  = ff00ffff
	lda	[%i2+0x008]%asi,%f6 	! %f6 = 00000000
!	Mem[00000000211c0000] = 00ff58bc, %l5 = ffffffffacffffff
	ldsba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 6a13e734, %f16 = ffffff00
	lda	[%i2+%g0]0x80,%f16	! %f16 = 6a13e734
!	Mem[0000000010181408] = ebffffff, %l2 = 00000000f84eefac
	lduba	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = 0000000000000000, %f24 = ff000000 000000ff
	ldda	[%i1+%o4]0x80,%f24	! %f24 = 00000000 00000000
!	Mem[00000000201c0000] = 00ff0847, %l2 = 00000000000000ff
	ldsb	[%o0+0x001],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010181410] = 6a000000, %l0 = 00000000c8180075
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = 000000006a000000
!	Mem[0000000010081410] = c8180075, %l6 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l6	! %l6 = ffffffffc8180075
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 136a0000, %l7 = 00000000000000ff
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 00000000136a0000

p0_label_384:
!	%l5 = 0000000000000000, Mem[00000000100c1434] = 000000ff
	stw	%l5,[%i3+0x034]		! Mem[00000000100c1434] = 00000000
!	Mem[0000000010181408] = ffffffeb, %l1 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 00000000ffffffeb
!	Mem[0000000010181400] = 6a130000, %l1 = 00000000ffffffeb
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 000000006a130000
!	%l6 = c8180075, %l7 = 136a0000, Mem[0000000030101408] = 00000010 8104661c
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = c8180075 136a0000
!	Mem[0000000030101400] = ff000000, %l3 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010081402] = 6a13e734
	sth	%l5,[%i2+0x002]		! Mem[0000000010081400] = 6a130000
!	Mem[0000000010001408] = 00000000, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%f14 = 000000ff 9ca1ff10, %l0 = 000000006a000000
!	Mem[0000000030141410] = ffa1ffff00000000
	add	%i5,0x010,%g1
	stda	%f14,[%g1+%l0]ASI_PST16_S ! Mem[0000000030141410] = ffa1ffff00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ffffa1ff, %l3 = 00000000000000ff
	ldsha	[%i5+%o5]0x89,%l3	! %l3 = ffffffffffffa1ff

p0_label_385:
!	Mem[00000000211c0000] = 00ff58bc, %l7 = 00000000136a0000
	lduba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = ffffa1ff, %l6 = ffffffffc8180075
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101410] = ffff136a00000000, %l7 = 0000000000000000
	ldxa	[%i4+%o5]0x81,%l7	! %l7 = ffff136a00000000
!	Mem[0000000021800040] = ffffc626, %l2 = ffffffffffffffff
	lduba	[%o3+0x041]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181410] = 0000006a, %l7 = ffff136a00000000
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 000000000000006a
!	Mem[0000000030081400] = acef4ef8, %l2 = 00000000000000ff
	ldswa	[%i2+%g0]0x81,%l2	! %l2 = ffffffffacef4ef8
!	Mem[0000000010001410] = fff9ffff, %l6 = ffffffffffffffff
	ldsha	[%i0+%o5]0x80,%l6	! %l6 = fffffffffffffff9
!	Mem[0000000010181400] = ebffffff, %l5 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010001434] = 0000ffff, %l0 = 000000006a000000
	ldsba	[%i0+0x037]%asi,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = ff000000, %l3 = ffffffffffffa1ff
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 00000000ff000000

p0_label_386:
!	%l6 = fffffffffffffff9, Mem[0000000010041408] = 00000000
	stba	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000f9
!	%l3 = 00000000ff000000, Mem[0000000010001408] = 0000000000000000
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000ff000000
!	%l4 = 00000000000000ff, Mem[0000000030041408] = ff000000ffffa1ff
	stxa	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000000000ff
!	%f0  = ffff0000 00000000, Mem[0000000010041410] = 0d2123ff 00000000
	stda	%f0 ,[%i1+%o5]0x88	! Mem[0000000010041410] = ffff0000 00000000
!	%l1 = 000000006a130000, Mem[0000000010081400] = 6a130000
	stha	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%l3 = 00000000ff000000, Mem[0000000010141408] = 0000006a
	stba	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000006a
!	Mem[0000000030181410] = 6a13e734, %l5 = 000000000000ffff
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 000000006a13e734
!	%l7 = 000000000000006a, Mem[00000000201c0000] = 00ff0847
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 6aff0847
!	%l5 = 000000006a13e734, Mem[0000000010001400] = 00000000
	stwa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 6a13e734
!	Starting 10 instruction Load Burst
!	Mem[0000000010181428] = 00000000 4e4f5dff, %l4 = 000000ff, %l5 = 6a13e734
	ldda	[%i6+0x028]%asi,%l4	! %l4 = 0000000000000000 000000004e4f5dff

p0_label_387:
!	Mem[0000000010041408] = 000000f9, %l5 = 000000004e4f5dff
	ldsba	[%i1+%o4]0x88,%l5	! %l5 = fffffffffffffff9
!	Mem[0000000010001410] = fff9ffff, %l3 = 00000000ff000000
	lduwa	[%i0+%o5]0x80,%l3	! %l3 = 00000000fff9ffff
!	Mem[00000000100c1414] = e923210d, %l5 = fffffffffffffff9
	ldub	[%i3+0x015],%l5		! %l5 = 0000000000000023
!	Mem[00000000201c0000] = 6aff0847, %l5 = 0000000000000023
	lduba	[%o0+0x000]%asi,%l5	! %l5 = 000000000000006a
!	Mem[0000000010001400] = 34e7136a0000ff00, %l5 = 000000000000006a
	ldxa	[%i0+%g0]0x80,%l5	! %l5 = 34e7136a0000ff00
!	Mem[0000000030041400] = ffffbbeb, %l2 = ffffffffacef4ef8
	ldsba	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1410] = ffffa1ffe923210d, %f22 = 00000000 00000088
	ldda	[%i3+0x010]%asi,%f22	! %f22 = ffffa1ff e923210d
!	Mem[00000000100c1400] = 00ffffff 00ff00ff, %l0 = ffffffff, %l1 = 6a130000
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 0000000000ffffff 0000000000ff00ff
!	Mem[0000000010101408] = acef4ef8, %l0 = 0000000000ffffff
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = fffffffffffffff8
!	Starting 10 instruction Store Burst
!	%f16 = 6a13e734 00000000, %l0 = fffffffffffffff8
!	Mem[00000000100c1408] = ff00000000000000
	add	%i3,0x008,%g1
	stda	%f16,[%g1+%l0]ASI_PST8_PL ! Mem[00000000100c1408] = ff00000034e7136a

p0_label_388:
!	Mem[0000000030041410] = 000000ff, %l7 = 000000000000006a
	swapa	[%i1+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010001427] = 000000d7
	stb	%l7,[%i0+0x027]		! Mem[0000000010001424] = 000000ff
!	Mem[0000000010041410] = 00000000, %l6 = fffffffffffffff9
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1410] = ff000000, %l5 = 34e7136a0000ff00
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010101400] = ff000000, %l7 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	%f9  = 00000000, Mem[0000000030081410] = ff00ff00
	sta	%f9 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%f26 = 00000000, Mem[0000000010001434] = 0000ffff
	sta	%f26,[%i0+0x034]%asi	! Mem[0000000010001434] = 00000000
!	Mem[0000000010101408] = f84eefac, %l7 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 00000000f84eefac
!	%f2  = ff000000 00000000, Mem[0000000010081410] = c8180075 c0130000
	stda	%f2 ,[%i2+%o5]0x80	! Mem[0000000010081410] = ff000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 6a000000000000ff, %l3 = 00000000fff9ffff
	ldxa	[%i1+%o5]0x81,%l3	! %l3 = 6a000000000000ff

p0_label_389:
!	Mem[0000000010101410] = 00000000, %l3 = 6a000000000000ff
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 0000006a, %l0 = fffffffffffffff8
	lduba	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = 0000000000000000, %l4 = 0000000000000000
	ldxa	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l3 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = 6aff0847, %l4 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = 000000000000006a
!	Mem[000000001010142c] = 00000000, %l5 = 00000000000000ff
	ldub	[%i4+0x02f],%l5		! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 6aff0847, %l1 = 0000000000ff00ff
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = 000000000000006a
!	Mem[0000000010001400] = 34e7136a, %l7 = 00000000f84eefac
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 00000000000034e7
!	Mem[0000000010041410] = ff000000, %l1 = 000000000000006a
	lduha	[%i1+%o5]0x80,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 00000000, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_390:
!	Mem[0000000010041408] = f9000000, %l7 = 00000000000034e7
	ldstuba	[%i1+%o4]0x80,%l7	! %l7 = 000000f9000000ff
!	Mem[0000000010041426] = ffd76dda, %l3 = 0000000000000000
	ldstub	[%i1+0x026],%l3		! %l3 = 0000006d000000ff
!	Mem[0000000030081408] = 000000ff, %l1 = 000000000000ff00
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%l2 = ffffffffffffffff, Mem[0000000010101400] = ff000000
	stwa	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffff
!	%l4 = 0000006a, %l5 = 00000000, Mem[00000000300c1408] = 000000ff 00000000
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000006a 00000000
!	%l3 = 000000000000006d, Mem[0000000030041408] = 000000ff
	stha	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000006d
!	Mem[0000000010101410] = 00000000, %l3 = 000000000000006d
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010181400] = ebffffff
	stha	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = ebff0000
!	Mem[00000000300c1410] = ff000000, %l5 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 0000006a, %l0 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l0	! %l0 = 000000000000006a

p0_label_391:
!	Mem[0000000010101414] = 000000ff, %l4 = 000000000000006a
	ldsba	[%i4+0x016]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = ff000000, %l5 = 00000000ff000000
	lduwa	[%i3+%o4]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030141408] = 3b3c000000000000, %l3 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l3	! %l3 = 3b3c000000000000
!	Mem[00000000211c0000] = 00ff58bc, %l3 = 3b3c000000000000
	ldsba	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = ff000000, %f14 = 000000ff
	lda	[%i1+%o5]0x80,%f14	! %f14 = ff000000
!	Mem[0000000030041400] = ebbbffff, %f5  = 0000ff00
	lda	[%i1+%g0]0x89,%f5 	! %f5 = ebbbffff
!	Mem[0000000021800040] = ffffc626, %l7 = 00000000000000f9
	ldub	[%o3+0x040],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010101400] = ff000000ffffffff, %l6 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l6	! %l6 = ff000000ffffffff
!	Mem[0000000010101410] = 0000006d, %f2  = ff000000
	lda	[%i4+%o5]0x88,%f2 	! %f2 = 0000006d
!	Starting 10 instruction Store Burst
!	%f20 = ff000000, Mem[0000000010081424] = 5e6bb8ff
	st	%f20,[%i2+0x024]	! Mem[0000000010081424] = ff000000

p0_label_392:
!	%l2 = ffffffffffffffff, Mem[0000000010101408] = 00ff0000ff000000
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffffffffffff
!	Mem[00000000100c1438] = ff0000ff, %l1 = 000000ff, %l0 = 0000006a
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 00000000ff0000ff
!	%l6 = ff000000ffffffff, Mem[000000001010141d] = 00000000, %asi = 80
	stba	%l6,[%i4+0x01d]%asi	! Mem[000000001010141c] = 00ff0000
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000030001410] = 00000088 00000000
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffffff 00000000
!	%l5 = 00000000ff000000, Mem[00000000300c1408] = 6a000000
	stba	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Mem[0000000010081410] = ff000000, %l2 = ffffffffffffffff, %asi = 80
	swapa	[%i2+0x010]%asi,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030141408] = 00003c3b, %l2 = 00000000ff000000
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 0000000000003c3b
!	Mem[00000000300c1408] = 00000000, %l2 = 0000000000003c3b
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041410] = 000000ff, %l5 = 00000000ff000000
	swapa	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = ff000000, %l6 = ff000000ffffffff
	ldsw	[%i4+0x038],%l6		! %l6 = ffffffffff000000

p0_label_393:
!	Mem[0000000010001408] = 00000000ff000000, %f24 = 00000000 00000000
	ldda	[%i0+%o4]0x80,%f24	! %f24 = 00000000 ff000000
!	Mem[0000000030081408] = 00000000 000000ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000010181400] = 0000ffeb, %f27 = ffffff84
	lda	[%i6+%g0]0x80,%f27	! %f27 = 0000ffeb
!	Mem[00000000300c1408] = 000000ff, %l7 = 00000000000000ff
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181410] = 0000ffff00000000, %l1 = 00000000000000ff
	ldxa	[%i6+%o5]0x81,%l1	! %l1 = 0000ffff00000000
!	Mem[0000000030181408] = 00000000, %l7 = ffffffffffffffff
	ldsba	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = ffffffff, %l7 = 0000000000000000
	lduba	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = ff000000, %f3  = 00000000
	lda	[%i3+%o4]0x80,%f3 	! %f3 = ff000000
!	Mem[0000000010041410] = 000000ff 0000ffff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i1+0x010]%asi,%l2	! %l2 = 00000000000000ff 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[00000000100c1408] = ff000000
	stwa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff

p0_label_394:
!	Mem[000000001008141d] = ffff00ff, %l0 = 00000000ff0000ff
	ldstub	[%i2+0x01d],%l0		! %l0 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000030081408] = 000000ff
	stwa	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	%l5 = 00000000000000ff, Mem[0000000010101400] = ffffffff
	stwa	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff
!	Mem[0000000030081410] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010181410] = 00000000 6a130000
	stda	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 000000ff
!	Mem[0000000010001402] = 34e7136a, %l2 = 0000000000000000
	ldstuba	[%i0+0x002]%asi,%l2	! %l2 = 00000013000000ff
!	%l0 = 00000000000000ff, Mem[0000000010141430] = ffff6e00000000ff, %asi = 80
	stxa	%l0,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000000000000ff
!	Mem[0000000010181400] = 0000ffeb, %l2 = 0000000000000013
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 000000000000ffeb
!	%f26 = 00000000 0000ffeb, Mem[00000000300c1400] = 00000000 00000000
	stda	%f26,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 0000ffeb
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 9a421fd7, %l2 = 000000000000ffeb
	lduwa	[%i6+%g0]0x81,%l2	! %l2 = 000000009a421fd7

p0_label_395:
!	%l2 = 000000009a421fd7, Mem[0000000030181408] = 00000000
	stha	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 1fd70000
!	Mem[0000000010041410] = 000000ff, %l0 = 00000000000000ff
	ldsha	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041418] = 00000000 00000000, %l0 = 00000000, %l1 = 00000000
	ldd	[%i1+0x018],%l0		! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010001408] = 00000000, %l2 = 000000009a421fd7
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = 000000ff, %l4 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041400] = fffff9d5ebbbffff, %f4  = ff000000 ebbbffff
	ldda	[%i1+%g0]0x89,%f4 	! %f4  = fffff9d5 ebbbffff
!	Mem[00000000300c1408] = ff000000 00000000, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000030001400] = 00000000, %l7 = 00000000000000ff
	lduba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 6d000000, %l4 = 00000000ff000000
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = 000000006d000000
!	Starting 10 instruction Store Burst
!	%f0  = ffff0000 00000000, Mem[0000000010181408] = 00000000 ff00ff00
	stda	%f0 ,[%i6+%o4]0x88	! Mem[0000000010181408] = ffff0000 00000000

p0_label_396:
!	%f2  = 0000006d ff000000, Mem[00000000300c1410] = 00000000 00ff0000
	stda	%f2 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000006d ff000000
!	%l2 = 00000000, %l3 = 0000ffff, Mem[0000000030001400] = 00000000 00000000
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 0000ffff
!	%f30 = 00000000 000000ff, Mem[0000000030001408] = 00000000 00000000
	stda	%f30,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 000000ff
!	%f6  = 00000000 00000000, %l6 = ffffffffff000000
!	Mem[0000000010041410] = 000000ff0000ffff
	add	%i1,0x010,%g1
	stda	%f6,[%g1+%l6]ASI_PST8_P ! Mem[0000000010041410] = 000000ff0000ffff
!	%f16 = 6a13e734, Mem[0000000010041400] = 00000000
	sta	%f16,[%i1+%g0]0x80	! Mem[0000000010041400] = 6a13e734
!	%f10 = ff000000 0000ff00, %l0 = 0000000000000000
!	Mem[0000000010141408] = 0000006a00000000
	add	%i5,0x008,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010141408] = 0000006a00000000
!	Mem[0000000030181410] = 0000ffff, %l6 = ffffffffff000000
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030141410] = ffa1ffff, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ffa1ffff
!	%f0  = ffff0000 00000000 0000006d ff000000
!	%f4  = fffff9d5 ebbbffff 00000000 00000000
!	%f8  = ffb86b5e 00000000 ff000000 0000ff00
!	%f12 = 9a421fd7 000000ff ff000000 9ca1ff10
	stda	%f0,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ffffffff, %l7 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l7	! %l7 = 000000000000ffff

p0_label_397:
!	Mem[0000000030141400] = ffffffff, %l0 = 0000000000000000
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[000000001000143c] = 73000000, %l1 = 0000000000000000
	ldswa	[%i0+0x03c]%asi,%l1	! %l1 = 0000000073000000
	membar	#Sync			! Added by membar checker (72)
!	Mem[0000000010081414] = ebbbffff, %l7 = 000000000000ffff
	lduwa	[%i2+0x014]%asi,%l7	! %l7 = 00000000ebbbffff
!	Mem[00000000300c1400] = 00000000, %l7 = 00000000ebbbffff
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = ffd5261d, %l1 = 0000000073000000
	ldsba	[%o1+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081410] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001410] = 00000000ffffffff, %l4 = 000000006d000000
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010141414] = 8b4038fa, %l7 = 0000000000000000
	ldsh	[%i5+0x014],%l7		! %l7 = ffffffffffff8b40
!	Mem[0000000010041408] = ff000000, %l7 = ffffffffffff8b40
	ldswa	[%i1+%o4]0x80,%l7	! %l7 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%f13 = 000000ff, Mem[00000000300c1408] = 000000ff
	sta	%f13,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff

p0_label_398:
!	%l5 = 00000000ffa1ffff, Mem[0000000010141408] = 0000006a
	stwa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = ffa1ffff
!	%f24 = 00000000 ff000000, %l2 = 00000000000000ff
!	Mem[0000000030101428] = b7d6f9fb00000000
	add	%i4,0x028,%g1
	stda	%f24,[%g1+%l2]ASI_PST8_S ! Mem[0000000030101428] = 00000000ff000000
!	%f2  = 0000006d ff000000, Mem[0000000010181400] = 13000000 00000000
	stda	%f2 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000006d ff000000
!	Mem[0000000010001408] = 00000000, %l1 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%f29 = 000000ff, Mem[0000000030101400] = ff000000
	sta	%f29,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	%l4 = 00000000ffffffff, Mem[0000000010141420] = 000016afff0000ff, %asi = 80
	stxa	%l4,[%i5+0x020]%asi	! Mem[0000000010141420] = 00000000ffffffff
!	Mem[0000000010101408] = ffffffff, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l1	! %l1 = 00000000ffffffff
!	%l5 = 00000000ffa1ffff, Mem[0000000010041414] = 0000ffff
	stw	%l5,[%i1+0x014]		! Mem[0000000010041414] = ffa1ffff
!	Mem[0000000030001410] = ffffffff, %l0 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000ff, %l4 = 00000000ffffffff
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff

p0_label_399:
!	Mem[0000000030181400] = 9a421fd7 000000ff 1fd70000 00000000
!	Mem[0000000030181410] = ff000000 00000000 bb000000 00000000
!	Mem[0000000030181420] = ff000000 00000055 d587da6d d7000039
!	Mem[0000000030181430] = 0d2123e9 34e7136a 00000000 fbf9d6b7
	ldda	[%i6]ASI_BLK_S,%f0	! Block Load from 0000000030181400
!	Mem[0000000030041408] = 6d000000, %l0 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = 000000000000006d
!	Mem[0000000010041400] = 6a13e734, %l3 = 000000000000ffff
	ldsba	[%i1+%g0]0x80,%l3	! %l3 = 000000000000006a
!	Mem[0000000030041400] = ffffbbeb, %l5 = 00000000ffa1ffff
	ldsha	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081408] = 0000006d, %l4 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = ffff0000 00000000, %l6 = 0000ffff, %l7 = ff000000
	ldd	[%i2+%g0],%l6		! %l6 = 00000000ffff0000 0000000000000000
!	Mem[0000000030181410] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141410] = d5f9ffff, %l0 = 000000000000006d
	ldsha	[%i5+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1410] = ffa1ffff, %l2 = 00000000000000ff
	lduha	[%i3+%o5]0x88,%l2	! %l2 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ffff136a, %l3 = 000000000000006a
	ldstuba	[%i4+%o5]0x81,%l3	! %l3 = 000000ff000000ff

p0_label_400:
!	%l6 = ffff0000, %l7 = 00000000, Mem[0000000010141400] = acffffff 00000000
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = ffff0000 00000000
!	Mem[0000000010041400] = 34e7136a, %l0 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 0000006a000000ff
!	Mem[0000000030001410] = ffffffff, %l5 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030041400] = ebbbffff, %l1 = 00000000ffffffff
	ldstuba	[%i1+%g0]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030001400] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%f21 = 000000ff, Mem[00000000300c1400] = 00000000
	sta	%f21,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff
!	%l1 = 0000000000000000, Mem[00000000100c1408] = 000000ff34e7136a
	stxa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	%f26 = 00000000 0000ffeb, Mem[0000000010181408] = 00000000 0000ffff
	stda	%f26,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 0000ffeb
!	%l2 = 0000ffff, %l3 = 000000ff, Mem[0000000030141408] = 000000ff 00000000
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000ffff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 9a421fd7, %l3 = 00000000000000ff
	lduha	[%i6+%g0]0x81,%l3	! %l3 = 0000000000009a42

p0_label_401:
!	Mem[0000000030141408] = 0000ffff000000ff, %f30 = 00000000 000000ff
	ldda	[%i5+%o4]0x81,%f30	! %f30 = 0000ffff 000000ff
	membar	#Sync			! Added by membar checker (73)
!	Mem[0000000030001400] = ff000000 0000ffff ff000000 00000000
!	Mem[0000000030001410] = ffffffff 00000000 ff000000 af1600ff
!	Mem[0000000030001420] = ffb86b5e da6dd733 ffb86b5e 000000ff
!	Mem[0000000030001430] = ff000000 8900ff00 ffffffff ff000000
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000030141400] = ffffffff, %l7 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030001408] = ff000000, %l2 = 000000000000ffff
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff 0000ffeb ff000000 00000000
!	Mem[00000000300c1410] = 000000ff 6d000000 ff00ffff 00000000
!	Mem[00000000300c1420] = ffb86b5e 00000000 ff000000 0000ff00
!	Mem[00000000300c1430] = 9a421fd7 000000ff 000000ff 9ca1ff10
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Code Fragment 4
p0_fragment_15:
!	%l0 = 000000000000006a
	setx	0x3f7f0477bc9e513f,%g7,%l0 ! %l0 = 3f7f0477bc9e513f
!	%l1 = 0000000000000000
	setx	0x0602b5cfc29d7eb4,%g7,%l1 ! %l1 = 0602b5cfc29d7eb4
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3f7f0477bc9e513f
	setx	0xc0215237c483754a,%g7,%l0 ! %l0 = c0215237c483754a
!	%l1 = 0602b5cfc29d7eb4
	setx	0x807b149838716607,%g7,%l1 ! %l1 = 807b149838716607
!	Mem[0000000030141400] = ffffffff, %l0 = c0215237c483754a
	lduba	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081400] = f84eefac, %l1 = 807b149838716607
	ldsha	[%i2+%g0]0x89,%l1	! %l1 = ffffffffffffefac
!	Mem[0000000010141414] = 8b4038fa, %f17 = 0000ffff
	ld	[%i5+0x014],%f17	! %f17 = 8b4038fa
!	Starting 10 instruction Store Burst
!	%f18 = ff000000 00000000, Mem[0000000010141410] = fffff9d5 8b4038fa
	stda	%f18,[%i5+0x010]%asi	! Mem[0000000010141410] = ff000000 00000000

p0_label_402:
!	%f16 = ff000000 8b4038fa, %l1 = ffffffffffffefac
!	Mem[0000000030101438] = ff0000ffffffffff
	add	%i4,0x038,%g1
	stda	%f16,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030101438] = ff00408bff00ffff
	membar	#Sync			! Added by membar checker (74)
!	%l3 = 0000000000009a42, Mem[00000000300c1408] = ff00000000000000
	stxa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000009a42
!	%l0 = 00000000000000ff, Mem[0000000010181408] = 00000000
	stba	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000000
!	%l0 = 00000000000000ff, Mem[0000000010181431] = ffffff00, %asi = 80
	stba	%l0,[%i6+0x031]%asi	! Mem[0000000010181430] = ffffff00
!	Mem[0000000010081410] = d5f9ffff, %l4 = 00000000000000ff
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010001400] = 34e7ff6a, %l1 = ffffffffffffefac
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 0000000034e7ff6a
!	%l7 = 000000000000ffff, Mem[0000000010101410] = 0000006d
	stwa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000ffff
!	%l7 = 000000000000ffff, Mem[0000000010181408] = ff000000
	stwa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000ffff
!	%l3 = 0000000000009a42, Mem[0000000030001400] = 000000ff
	stha	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 00009a42
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = fffff9d5ebbbffff, %l1 = 0000000034e7ff6a
	ldxa	[%i2+%o5]0x80,%l1	! %l1 = fffff9d5ebbbffff

p0_label_403:
!	Mem[0000000030001400] = 429a0000, %l6 = 00000000ffff0000
	lduba	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000042
!	Mem[0000000010181410] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 000000006a13ffff, %l4 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l4	! %l4 = 000000006a13ffff
!	Mem[0000000010141400] = 00000000 0000ffff, %l6 = 00000042, %l7 = 0000ffff
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 000000000000ffff 0000000000000000
!	Mem[00000000211c0000] = 00ff58bc, %l7 = 0000000000000000
	ldsh	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	%f26 = ffb86b5e 000000ff, %f17 = 8b4038fa
	fdtos	%f26,%f17		! %f17 = ff800000
!	Mem[0000000030101410] = 6a13ffff, %l0 = 00000000000000ff
	ldsba	[%i4+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081438] = ff000000 9ca1ff10, %l0 = ffffffff, %l1 = ebbbffff
	ldd	[%i2+0x038],%l0		! %l0 = 00000000ff000000 000000009ca1ff10
!	Mem[0000000020800000] = ffd5261d, %l1 = 000000009ca1ff10
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 000000000000ffd5
!	Starting 10 instruction Store Burst
!	%f4  = 000000ff 6d000000, Mem[0000000010001408] = ff000000 ff000000
	stda	%f4 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff 6d000000

p0_label_404:
!	%f26 = ffb86b5e, Mem[0000000010101410] = 0000ffff
	sta	%f26,[%i4+%o5]0x88	! Mem[0000000010101410] = ffb86b5e
!	%l3 = 0000000000009a42, Mem[0000000010181410] = 00000000
	stwa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 00009a42
!	%l4 = 000000006a13ffff, Mem[0000000010101410] = ffb86b5e
	stwa	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 6a13ffff
!	%l7 = 00000000000000ff, Mem[0000000010081400] = 0000ffff
	stwa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	Mem[0000000030001400] = 00009a42, %l6 = 000000000000ffff
	ldstuba	[%i0+%g0]0x89,%l6	! %l6 = 00000042000000ff
!	%l6 = 0000000000000042, Mem[0000000030041408] = 0000006d
	stwa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000042
!	%l6 = 0000000000000042, Mem[0000000030101408] = 136a0000c8180075
	stxa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000042
!	%l2 = 000000ff, %l3 = 00009a42, Mem[0000000010101410] = 6a13ffff ff000000
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff 00009a42
!	%l7 = 00000000000000ff, Mem[0000000010101410] = 000000ff
	stwa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 429a0000, %l1 = 000000000000ffd5
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000042

p0_label_405:
!	Mem[00000000100c1400] = 00ffffff 00ff00ff, %l2 = 000000ff, %l3 = 00009a42
	ldd	[%i3+%g0],%l2		! %l2 = 0000000000ffffff 0000000000ff00ff
!	Mem[0000000030141410] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 6d000000, %f2  = ff000000
	lda	[%i2+%o4]0x88,%f2 	! %f2 = 6d000000
!	Mem[0000000010181410] = 429a0000, %l3 = 0000000000ff00ff
	ldswa	[%i6+%o5]0x80,%l3	! %l3 = 00000000429a0000
!	Mem[0000000030141408] = 0000ffff, %f22 = ff000000
	lda	[%i5+%o4]0x81,%f22	! %f22 = 0000ffff
!	Mem[0000000010081408] = 0000006dff000000, %l4 = 000000006a13ffff
	ldxa	[%i2+%o4]0x80,%l4	! %l4 = 0000006dff000000
!	Mem[0000000010001408] = ff000000, %l6 = 0000000000000042
	ldsha	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[000000001008140c] = ff000000, %l3 = 00000000429a0000
	ldsh	[%i2+0x00c],%l3		! %l3 = ffffffffffffff00
!	Mem[0000000030101408] = 42000000, %l1 = 0000000000000042
	lduba	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000042
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = ff13e734, %l0 = 00000000ff000000
	swapa	[%i1+%g0]0x80,%l0	! %l0 = 00000000ff13e734

p0_label_406:
!	Mem[0000000030141410] = 00000000, %l4 = 0000006dff000000
	swapa	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	%l0 = ff13e734, %l1 = 00000042, Mem[00000000100c1420] = 00000000 ff000000
	stda	%l0,[%i3+0x020]%asi	! Mem[00000000100c1420] = ff13e734 00000042
!	Mem[0000000030081408] = 000000ff, %l4 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%f8  = ffb86b5e 00000000, Mem[0000000030041410] = 6a000000 000000ff
	stda	%f8 ,[%i1+%o5]0x81	! Mem[0000000030041410] = ffb86b5e 00000000
!	Mem[00000000100c1410] = ffa1ffff, %l5 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	%f8  = ffb86b5e 00000000, %l0 = 00000000ff13e734
!	Mem[0000000030141418] = 00000000000000bb
	add	%i5,0x018,%g1
	stda	%f8,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030141418] = 000000005e6b00bb
!	%f16 = ff000000 ff800000 ff000000 00000000
!	%f20 = ffffffff 00000000 0000ffff af1600ff
!	%f24 = ffb86b5e da6dd733 ffb86b5e 000000ff
!	%f28 = ff000000 8900ff00 ffffffff ff000000
	stda	%f16,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%l0 = ff13e734, %l1 = 00000042, Mem[0000000010101408] = 00000000 ffffffff
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = ff13e734 00000042
!	Mem[00000000211c0000] = 00ff58bc, %l6 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181428] = 000000004e4f5dff, %f0  = 000000ff 0000ffeb
	ldd	[%i6+0x028],%f0 	! %f0  = 00000000 4e4f5dff

p0_label_407:
	membar	#Sync			! Added by membar checker (75)
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = ffa1ffff, %l2 = 0000000000ffffff
	lduba	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c141c] = fff2aaac, %l2 = 00000000000000ff
	lduh	[%i3+0x01e],%l2		! %l2 = 000000000000aaac
!	Mem[00000000300c1400] = ff800000, %l2 = 000000000000aaac
	ldsba	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 0000ffff, %l3 = ffffffffffffff00
	ldsha	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 000000ff, %l3 = 0000000000000000
	ldswa	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081410] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141418] = 5e6bb8ff0000b8ff, %f24 = ffb86b5e da6dd733
	ldd	[%i5+0x018],%f24	! %f24 = 5e6bb8ff 0000b8ff
!	Mem[0000000010181408] = 0000ffff, %l0 = 00000000ff13e734
	ldsba	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = ffff58bc, %l1 = 0000000000000042
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 000000ff000000ff

p0_label_408:
!	%l4 = 00000000000000ff, Mem[0000000010081430] = 9a421fd7000000ff
	stx	%l4,[%i2+0x030]		! Mem[0000000010081430] = 00000000000000ff
!	Mem[0000000010181400] = ff000000, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 00000000ff000000
!	%l4 = 00000000000000ff, Mem[0000000030101400] = ff000000
	stba	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = ff0000ff
!	Mem[00000000201c0001] = 6aff0847, %l2 = 0000000000000000
	ldstub	[%o0+0x001],%l2		! %l2 = 000000ff000000ff
!	Mem[00000000100c1400] = 00ffffff00ff00ff, %l5 = 00000000000000ff, %l1 = 00000000000000ff
	casxa	[%i3]0x80,%l5,%l1	! %l1 = 00ffffff00ff00ff
!	Mem[00000000300c1410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030041410] = ffb86b5e00000000
	stxa	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000000000ff
!	Mem[0000000030101410] = 6a13ffff, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%f5  = 6d000000, Mem[0000000010181430] = ffffff00
	sta	%f5 ,[%i6+0x030]%asi	! Mem[0000000010181430] = 6d000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000000, %l5 = 00000000000000ff
	ldsba	[%i5+%o5]0x81,%l5	! %l5 = ffffffffffffffff

p0_label_409:
	membar	#Sync			! Added by membar checker (76)
!	Mem[00000000300c1400] = 000080ff 000000ff 00000000 000000ff
!	Mem[00000000300c1410] = ff000000 ffffffff ff0016af ffff0000
!	Mem[00000000300c1420] = 33d76dda 5e6bb8ff ff000000 5e6bb8ff
!	Mem[00000000300c1430] = 00ff0089 000000ff 000000ff ffffffff
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010101400] = ff000000ff000000, %l0 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = ff000000ff000000
!	Mem[0000000030181410] = ff000000, %l1 = 00ffffff00ff00ff
	lduwa	[%i6+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[000000001010143c] = 00000000, %l1 = 00000000ff000000
	lduw	[%i4+0x03c],%l1		! %l1 = 0000000000000000
!	Mem[000000001014141c] = 0000b8ff, %l2 = 00000000000000ff
	ldsh	[%i5+0x01e],%l2		! %l2 = ffffffffffffb8ff
!	Mem[0000000010101420] = ff000000, %l3 = 00000000000000ff
	ldsha	[%i4+0x020]%asi,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010101400] = 000000ff000000ff, %l6 = 00000000ff000000
	ldxa	[%i4+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030181400] = 9a421fd7000000ff, %l0 = ff000000ff000000
	ldxa	[%i6+%g0]0x81,%l0	! %l0 = 9a421fd7000000ff
!	Mem[000000001000142c] = ff000000, %f4  = 000000ff
	lda	[%i0+0x02c]%asi,%f4 	! %f4 = ff000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[000000001010141c] = 00ff0000
	sth	%l7,[%i4+0x01c]		! Mem[000000001010141c] = 00ff0000

p0_label_410:
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000010181410] = 00009a42 000000ff
	stda	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff ffffffff
!	%f0  = 00000000 4e4f5dff 6d000000 00000000
!	%f4  = ff000000 6d000000 ff00ffff 00000000
!	%f8  = ffb86b5e 00000000 ff000000 0000ff00
!	%f12 = 9a421fd7 000000ff 000000ff 9ca1ff10
	stda	%f0,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%l6 = 000000ff000000ff, Mem[0000000020800041] = 00ff4bbb, %asi = 80
	stba	%l6,[%o1+0x041]%asi	! Mem[0000000020800040] = 00ff4bbb
!	%l3 = ffffffffffffff00, Mem[0000000030101410] = ffff136a00000000
	stxa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffffffffff00
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000030101400] = ff0000ff ff000000
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff 00000000
!	%l2 = ffffffffffffb8ff, Mem[0000000010041410] = 000000ff
	stba	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = ff0000ff
!	%f24 = 33d76dda 5e6bb8ff, Mem[0000000010101408] = 0000006d 00000000
	stda	%f24,[%i4+%o4]0x88	! Mem[0000000010101408] = 33d76dda 5e6bb8ff
!	%l1 = 0000000000000000, Mem[0000000030001408] = ff00000000000000
	stxa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000000
!	%l5 = ffffffffffffffff, Mem[0000000010181404] = 6d000000
	stw	%l5,[%i6+0x004]		! Mem[0000000010181404] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = ff000000, %l3 = ffffffffffffff00
	lduh	[%i2+0x03a],%l3		! %l3 = 0000000000000000

p0_label_411:
!	Mem[0000000030141408] = ffff0000, %l4 = 00000000000000ff
	lduba	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = ffffefac, %l1 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1400] = ff00ff00 ffffff00, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 00000000ffffff00 00000000ff00ff00
!	Mem[000000001004140c] = 00000000, %l4 = 00000000ffffff00
	ldsw	[%i1+0x00c],%l4		! %l4 = 0000000000000000
!	Mem[0000000030081408] = 0000000000000000, %l1 = ffffffffffffffff
	ldxa	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = 0000ffff, %f28 = 00ff0089
	lda	[%i5+%o4]0x81,%f28	! %f28 = 0000ffff
!	Mem[0000000010181420] = da6dd733000000ff, %l5 = 00000000ff00ff00
	ldx	[%i6+0x020],%l5		! %l5 = da6dd733000000ff
!	Mem[00000000100c1400] = 00ffffff, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000218000c0] = ff45f510, %l7 = 00000000000000ff
	ldsba	[%o3+0x0c0]%asi,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 000000ff, %l1 = 00000000000000ff
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 000000ff000000ff

p0_label_412:
!	Mem[00000000100c141c] = fff2aaac, %l5 = da6dd733000000ff, %asi = 80
	swapa	[%i3+0x01c]%asi,%l5	! %l5 = 00000000fff2aaac
!	%l3 = 0000000000000000, Mem[0000000010001410] = fffff9ff
	stwa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	%l7 = ffffffffffffffff, Mem[0000000010141420] = 00000000ffffffff, %asi = 80
	stxa	%l7,[%i5+0x020]%asi	! Mem[0000000010141420] = ffffffffffffffff
!	Mem[0000000010141418] = 5e6bb8ff0000b8ff, %l5 = 00000000fff2aaac, %l1 = 00000000000000ff
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 5e6bb8ff0000b8ff
!	Mem[0000000020800001] = ffd5261d, %l3 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l3	! %l3 = 000000d5000000ff
!	%f16 = 000080ff 000000ff, %l4 = 0000000000000000
!	Mem[0000000010081430] = 00000000000000ff
	add	%i2,0x030,%g1
	stda	%f16,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010081430] = 00000000000000ff
!	%f18 = 00000000 000000ff, Mem[0000000010001420] = da6dd7ff 000000ff
	stda	%f18,[%i0+0x020]%asi	! Mem[0000000010001420] = 00000000 000000ff
!	Mem[00000000300c1408] = 00000000, %l0 = 9a421fd7000000ff
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%f18 = 00000000 000000ff, Mem[0000000030041410] = 00000000 000000ff
	stda	%f18,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 0000d71f, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = 000000000000d71f

p0_label_413:
!	Mem[0000000010181408] = ebff0000ffff0000, %l6 = 000000ff000000ff
	ldxa	[%i6+%o4]0x88,%l6	! %l6 = ebff0000ffff0000
!	Mem[0000000020800000] = ffff261d, %l0 = 0000000000000000
	ldsb	[%o1+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010181400] = 00000000ffffffff, %f18 = 00000000 000000ff
	ldd	[%i6+%g0],%f18		! %f18 = 00000000 ffffffff
!	Mem[0000000020800000] = ffff261d, %l5 = 00000000fff2aaac
	ldsba	[%o1+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1408] = 0000000000000000, %l7 = ffffffffffffffff
	ldxa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = ff800000, %l2 = ffffffffffffb8ff
	lduba	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 00000000 ff000000, %l0 = ffffffff, %l1 = 0000b8ff
	ldda	[%i0+0x010]%asi,%l0	! %l0 = 0000000000000000 00000000ff000000
!	Mem[0000000010001410] = 00000000, %l6 = ebff0000ffff0000
	ldsba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = 6d000000, %l4 = 000000000000d71f
	lduha	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = 000000ff ffffffff, Mem[0000000010081408] = 6d000000 000000ff
	stda	%f30,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff ffffffff

p0_label_414:
!	%f16 = 000080ff 000000ff 00000000 ffffffff
!	%f20 = ff000000 ffffffff ff0016af ffff0000
!	%f24 = 33d76dda 5e6bb8ff ff000000 5e6bb8ff
!	%f28 = 0000ffff 000000ff 000000ff ffffffff
	stda	%f16,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000030081408] = 00000000 00000000
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 ffffffff
!	%l2 = 0000000000000000, Mem[0000000010001410] = 000000ff00000000
	stxa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	%f2  = 6d000000 00000000, Mem[0000000030081400] = f84eefac 00000000
	stda	%f2 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 6d000000 00000000
!	Mem[0000000030101408] = 00000042, %l1 = 00000000ff000000
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000042
!	%l4 = 0000000000000000, Mem[0000000010041427] = ffd7ffda
	stb	%l4,[%i1+0x027]		! Mem[0000000010041424] = ffd7ff00
!	Mem[0000000030001400] = ff9a0000, %l3 = 00000000000000d5
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1430] = 00000000, %l3 = 000000ff, %l4 = 00000000
	add	%i3,0x30,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000, %l1 = 0000000000000042
	ldsba	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffffff

p0_label_415:
!	Mem[0000000010081400] = ff000000, %l3 = 00000000000000ff
	lduha	[%i2+%g0]0x80,%l3	! %l3 = 000000000000ff00
	membar	#Sync			! Added by membar checker (77)
!	Mem[0000000010041438] = b7d6f9fb 9ca19d10, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+0x038]%asi,%l6	! %l6 = 00000000b7d6f9fb 000000009ca19d10
!	Mem[0000000010141410] = 000000ff, %f25 = 5e6bb8ff
	lda	[%i5+%o5]0x88,%f25	! %f25 = 000000ff
!	Mem[0000000030041408] = 00000000, %l5 = ffffffffffffffff
	ldsha	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l1 = ffffffffffffffff
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041400] = ff000000ff800000, %f22 = ff0016af ffff0000
	ldda	[%i1+%g0]0x89,%f22	! %f22 = ff000000 ff800000
!	Mem[00000000300c1400] = ff800000, %l3 = 000000000000ff00
	ldsba	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = ff0000ffffa1ffff, %l5 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l5	! %l5 = ff0000ffffa1ffff
!	Mem[0000000010141410] = 00000000000000ff, %l3 = 0000000000000000
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f22 = ff000000, Mem[0000000010001408] = 000000ff
	sta	%f22,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000

p0_label_416:
!	%f1  = 4e4f5dff, Mem[0000000030101400] = ff000000
	sta	%f1 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 4e4f5dff
!	Mem[00000000300c1400] = 000080ff, %l4 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 00000000000080ff
!	%f6  = ff00ffff 00000000, %l7 = 000000009ca19d10
!	Mem[0000000030101400] = 4e4f5dff00000000
	stda	%f6,[%i4+%l7]ASI_PST32_S ! Mem[0000000030101400] = 4e4f5dff00000000
!	Mem[0000000030181410] = ff000000, %l1 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	%l6 = 00000000b7d6f9fb, Mem[0000000010041400] = ff000000
	stwa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = b7d6f9fb
!	%f10 = ff000000, Mem[0000000030181408] = 1fd70000
	sta	%f10,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000
!	%f16 = 000080ff 000000ff 00000000 ffffffff
!	%f20 = ff000000 ffffffff ff000000 ff800000
!	%f24 = 33d76dda 000000ff ff000000 5e6bb8ff
!	%f28 = 0000ffff 000000ff 000000ff ffffffff
	stda	%f16,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	Mem[0000000010041408] = ff000000, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010001408] = ff000000, %l4 = 00000000000080ff
	swapa	[%i0+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l2 = 00000000ff000000
	ldsha	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000

p0_label_417:
!	Mem[0000000010181410] = ff000000ffffffff, %l3 = 00000000000000ff
	ldxa	[%i6+%o5]0x80,%l3	! %l3 = ff000000ffffffff
!	Mem[00000000218001c0] = ff42a805, %l5 = ff0000ffffa1ffff
	lduh	[%o3+0x1c0],%l5		! %l5 = 000000000000ff42
!	Mem[0000000030101400] = 00000000 ff5d4f4e, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 00000000ff5d4f4e 0000000000000000
!	%f14 = 000000ff, Mem[0000000030081408] = 00000000
	sta	%f14,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	Mem[0000000010041414] = ffa1ffff, %l7 = 000000009ca19d10
	ldswa	[%i1+0x014]%asi,%l7	! %l7 = ffffffffffa1ffff
!	Mem[0000000010101408] = 5e6bb8ff, %l5 = 000000000000ff42
	ldsba	[%i4+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1428] = 982aff92000000ff, %l1 = 00000000ff000000
	ldxa	[%i3+0x028]%asi,%l1	! %l1 = 982aff92000000ff
!	Mem[0000000030181408] = 000000ff, %l3 = 0000000000000000
	lduha	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (78)
!	Mem[0000000030141410] = ffffffff, %l7 = ffffffffffa1ffff
	lduwa	[%i5+%o5]0x81,%l7	! %l7 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%f26 = ff000000 5e6bb8ff, Mem[00000000300c1410] = 000000ff ffffffff
	stda	%f26,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff000000 5e6bb8ff

p0_label_418:
!	%f12 = 9a421fd7 000000ff, Mem[0000000030101400] = ff5d4f4e 00000000
	stda	%f12,[%i4+%g0]0x89	! Mem[0000000030101400] = 9a421fd7 000000ff
!	Mem[0000000010101408] = 5e6bb8ff, %l3 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 000000005e6bb8ff
!	Mem[000000001008141d] = 00000000, %l5 = ffffffffffffffff
	ldstuba	[%i2+0x01d]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001410] = ffffffff, %l0 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030081408] = 000000ff, %l6 = 00000000b7d6f9fb
	ldstuba	[%i2+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000100c1410] = ffffa1ff, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x010]%asi,%l0	! %l0 = 00000000ffffa1ff
!	%f4  = ff000000 6d000000, Mem[0000000010101408] = 000000ff 33d76dda
	stda	%f4 ,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000 6d000000
!	%l2 = 00000000ff5d4f4e, Mem[0000000010001400] = ffffefac
	stha	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 4f4eefac
!	%f12 = 9a421fd7 000000ff, Mem[0000000010141438] = 00001fd5 000000ff
	stda	%f12,[%i5+0x038]%asi	! Mem[0000000010141438] = 9a421fd7 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff000000ff800000, %l6 = 00000000000000ff
	ldxa	[%i1+%g0]0x89,%l6	! %l6 = ff000000ff800000

p0_label_419:
	membar	#Sync			! Added by membar checker (79)
!	Mem[0000000010001400] = 4f4eefac 0000ff00 000080ff 6d000000
!	Mem[0000000010001410] = 00000000 00000000 00000000 00000000
!	Mem[0000000010001420] = 00000000 000000ff 00000000 ff000000
!	Mem[0000000010001430] = 00003b3d 00000000 ffffffff 73000000
	ldda	[%i0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[0000000010101408] = 0000006d, %l0 = 00000000ffffa1ff
	lduha	[%i4+0x008]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = ff800000, %l0 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = ffff58bc, %l1 = 982aff92000000ff
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101410] = ff000000, %l1 = ffffffffffffffff
	lduwa	[%i4+%o5]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010081410] = fffff9d5, %l5 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l5	! %l5 = 00000000fffff9d5
!	Mem[00000000100c1410] = 000000ff, %l3 = 000000005e6bb8ff
	lduwa	[%i3+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = ffff000000009aff, %l2 = 00000000ff5d4f4e
	ldxa	[%i0+%g0]0x89,%l2	! %l2 = ffff000000009aff
!	Mem[0000000030141410] = ffffffff, %l7 = 00000000ffffffff
	ldswa	[%i5+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[00000000100c1400] = ff00ff00ffffff00
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000000000ff

p0_label_420:
!	Mem[0000000030081410] = ff000000, %l6 = ff000000ff800000
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101412] = ff000000, %asi = 80
	stha	%l3,[%i4+0x012]%asi	! Mem[0000000010101410] = ff0000ff
!	%l1 = 00000000ff000000, Mem[0000000010081430] = 00000000, %asi = 80
	stha	%l1,[%i2+0x030]%asi	! Mem[0000000010081430] = 00000000
!	%f0  = 00000000 4e4f5dff 6d000000 00000000
!	%f4  = ff000000 6d000000 ff00ffff 00000000
!	%f8  = ffb86b5e 00000000 ff000000 0000ff00
!	%f12 = 9a421fd7 000000ff 000000ff 9ca1ff10
	stda	%f0,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	Mem[0000000010141408] = ffa1ffff, %l1 = 00000000ff000000, %asi = 80
	swapa	[%i5+0x008]%asi,%l1	! %l1 = 00000000ffa1ffff
	membar	#Sync			! Added by membar checker (80)
!	%l6 = 000000ff, %l7 = ffffffff, Mem[0000000010001400] = acef4e4f 00ff0000
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff ffffffff
!	Mem[00000000300c1400] = 00000000, %l1 = 00000000ffa1ffff
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000020800040] = 00ff4bbb
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 00ff4bbb
!	%l0 = 0000000000000000, Mem[0000000020800000] = ffff261d, %asi = 80
	stha	%l0,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000261d
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 9a421fd7 000000ff, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 000000009a421fd7 00000000000000ff

p0_label_421:
!	Mem[000000001000141c] = 00000000, %l6 = 000000009a421fd7
	ldsw	[%i0+0x01c],%l6		! %l6 = 0000000000000000
!	Mem[0000000030001410] = 00000000ffffffff, %l0 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l0	! %l0 = 00000000ffffffff
!	Mem[00000000100c1400] = 000000ff, %l0 = 00000000ffffffff
	lduha	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1408] = 000000ff, %f7  = 00000000
	lda	[%i3+%o4]0x89,%f7 	! %f7 = 000000ff
!	Mem[00000000100c1408] = 000000ff, %l4 = 00000000ff000000
	lduba	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l3 = 00000000000000ff
	lduba	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 0000006d, %l5 = 00000000fffff9d5
	lduwa	[%i4+%o4]0x80,%l5	! %l5 = 000000000000006d
!	Mem[0000000010141408] = ff000000, %l2 = ffff000000009aff
	lduba	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = ff5d4f4e00000000, %f16 = 00ff0000 acef4e4f
	ldda	[%i4+%g0]0x88,%f16	! %f16 = ff5d4f4e 00000000
!	Starting 10 instruction Store Burst
!	%f12 = 9a421fd7 000000ff, %l0 = 00000000000000ff
!	Mem[0000000030041408] = 00000000ffffffff
	add	%i1,0x008,%g1
	stda	%f12,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030041408] = ff000000d71f429a

p0_label_422:
!	Mem[0000000010181400] = 00000000, %l5 = 000000000000006d
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000021800140] = 00fff4c2, %l7 = 00000000000000ff
	ldstuba	[%o3+0x140]%asi,%l7	! %l7 = 00000000000000ff
!	%f16 = ff5d4f4e, Mem[0000000010101408] = 0000006d
	sta	%f16,[%i4+%o4]0x80	! Mem[0000000010101408] = ff5d4f4e
!	Mem[0000000030081408] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010101400] = ff5d4f4e00000000
	stxa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000000
!	%f12 = 9a421fd7 000000ff, Mem[0000000010181400] = ff000000 ffffffff
	stda	%f12,[%i6+%g0]0x80	! Mem[0000000010181400] = 9a421fd7 000000ff
!	Mem[0000000010181400] = 9a421fd7, %l6 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l6	! %l6 = 0000009a000000ff
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010001408] = ff800000 0000006d
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff 00000000
!	%l6 = 000000000000009a, Mem[00000000300c1408] = 000000ff
	stha	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000009a
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 9a000000, %l2 = 00000000000000ff
	lduha	[%i3+%o4]0x81,%l2	! %l2 = 0000000000009a00

p0_label_423:
!	Mem[00000000211c0000] = ffff58bc, %l1 = 0000000000000000
	ldub	[%o2+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[0000000021800040] = ffffc626, %l4 = 00000000000000ff
	ldsb	[%o3+0x041],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = fffff9d5ebbbffff, %f14 = 000000ff 9ca1ff10
	ldda	[%i2+%o5]0x80,%f14	! %f14 = fffff9d5 ebbbffff
!	Mem[0000000021800080] = ffff2e44, %l5 = 0000000000000000
	lduha	[%o3+0x080]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010141418] = 5e6bb8ff0000b8ff, %l3 = 0000000000000000
	ldxa	[%i5+0x018]%asi,%l3	! %l3 = 5e6bb8ff0000b8ff
!	Mem[00000000211c0000] = ffff58bc, %l6 = 000000000000009a
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030001400] = 00009aff, %l1 = 00000000000000ff
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = ffffffffffff9aff
!	Mem[0000000030041410] = ff000000, %l1 = ffffffffffff9aff
	ldsha	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030001410] = ffffffff, %f8  = ffb86b5e
	lda	[%i0+%o5]0x89,%f8 	! %f8 = ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = ff000000, %l5 = 000000000000ffff
	ldstuba	[%i5+%g0]0x81,%l5	! %l5 = 000000ff000000ff

p0_label_424:
!	%f20 = 00000000, Mem[0000000010101400] = 00000000
	sta	%f20,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l4 = ffffffffffffffff, Mem[0000000010041410] = ff0000006d000000
	stxa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffffffffffff
!	%f12 = 9a421fd7, Mem[0000000030181410] = 00000000
	sta	%f12,[%i6+%o5]0x89	! Mem[0000000030181410] = 9a421fd7
!	%l6 = 000000000000ffff, Mem[0000000030081408] = ff000000
	stha	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = ffff0000
!	%l4 = ffffffffffffffff, Mem[0000000030041410] = 000000ff
	stba	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	%f20 = 00000000 00000000, %l3 = 5e6bb8ff0000b8ff
!	Mem[0000000010141430] = 00000000000000ff
	add	%i5,0x030,%g1
	stda	%f20,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010141430] = 0000000000000000
!	Mem[0000000010041410] = ffffffff, %l2 = 0000000000009a00
	ldstuba	[%i1+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%l4 = ffffffffffffffff, Mem[00000000100c1410] = 000000ff
	stba	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff0000ff
!	Mem[0000000030041410] = ff000000, %l4 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffffffff, %l5 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = ffffffffffffffff

p0_label_425:
!	Mem[0000000010141410] = ff000000, %l3 = 5e6bb8ff0000b8ff
	lduha	[%i5+%o5]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[0000000030141410] = ffffffff, %l6 = 000000000000ffff
	lduha	[%i5+%o5]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030141410] = ffffffff, %l1 = ffffffffffffff00
	lduha	[%i5+%o5]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030101408] = 000000ff 00000000, %l0 = 000000ff, %l1 = 0000ffff
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000010081418] = 00000000, %l2 = 00000000000000ff
	ldswa	[%i2+0x018]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = ffffffffffffffff, %f24 = ff000000 00000000
	ldda	[%i1+%o5]0x80,%f24	! %f24 = ffffffff ffffffff
!	Mem[0000000010001420] = 00000000 000000ff, %l6 = 0000ffff, %l7 = 00000000
	ldda	[%i0+0x020]%asi,%l6	! %l6 = 0000000000000000 00000000000000ff
!	Mem[0000000030041400] = 000080ff000000ff, %f14 = fffff9d5 ebbbffff
	ldda	[%i1+%g0]0x81,%f14	! %f14 = 000080ff 000000ff
!	Mem[0000000030081400] = 00000000, %l4 = 00000000000000ff
	lduba	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010101410] = ff0000ff
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ff00ff

p0_label_426:
!	%f28 = 00000000, Mem[0000000030081408] = 0000ffff
	sta	%f28,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010041400] = 4e4f5dff
	stwa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%f8  = ffffffff, Mem[0000000010141400] = 0000ffff
	sta	%f8 ,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffff
!	Mem[0000000010181409] = 0000ffff, %l5 = ffffffffffffffff
	ldstuba	[%i6+0x009]%asi,%l5	! %l5 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[00000000300c1408] = 9a000000000000ff
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000ff
!	Mem[000000001000143c] = 73000000, %l7 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x03c]%asi,%l7	! %l7 = 0000000073000000
!	%l1 = 0000000000000000, Mem[0000000010001418] = 0000000000000000
	stx	%l1,[%i0+0x018]		! Mem[0000000010001418] = 0000000000000000
!	Mem[0000000010001418] = 00000000, %l4 = 0000000000000000, %asi = 80
	swapa	[%i0+0x018]%asi,%l4	! %l4 = 0000000000000000
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000030001400] = 00009aff ffff0000
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 5e6bb8ff0000b8ff, %l6 = 0000000000000000
	ldxa	[%i5+0x018]%asi,%l6	! %l6 = 5e6bb8ff0000b8ff

p0_label_427:
!	Mem[0000000010001408] = ff00000000000000, %l1 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = ff00000000000000
!	Mem[0000000010081400] = ff000000 00000000, %l2 = 00000000, %l3 = 0000ff00
	ldd	[%i2+%g0],%l2		! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010001428] = 00000000, %l6 = 5e6bb8ff0000b8ff
	ldsb	[%i0+0x02b],%l6		! %l6 = 0000000000000000
!	Mem[0000000010041410] = ffffffff, %l5 = 0000000000000000
	lduba	[%i1+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041410] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041420] = 000000005e6bb8ff, %f0  = 00000000 4e4f5dff
	ldda	[%i1+0x020]%asi,%f0 	! %f0  = 00000000 5e6bb8ff
!	Mem[00000000300c1408] = ff000000 00000000, %l2 = ff000000, %l3 = ffffffff
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000010181400] = d71f42ff, %l4 = 0000000000000000
	ldsha	[%i6+%g0]0x88,%l4	! %l4 = 00000000000042ff
!	Mem[0000000030141410] = ffffffff, %f20 = 00000000
	lda	[%i5+%o5]0x89,%f20	! %f20 = ffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ff000000, %l0 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff000000

p0_label_428:
!	Mem[0000000010101414] = 6d000000, %l4 = 00000000000042ff
	ldstub	[%i4+0x014],%l4		! %l4 = 0000006d000000ff
!	Mem[00000000300c1408] = 00000000, %l3 = 00000000ff000000
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%f14 = 000080ff 000000ff, Mem[0000000030141408] = ffffffff 00000000
	stda	%f14,[%i5+%o4]0x81	! Mem[0000000030141408] = 000080ff 000000ff
!	%f26 = 000000ff 00000000, Mem[0000000030041410] = ff000000 ffffffff
	stda	%f26,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff 00000000
!	%l0 = 00000000ff000000, Mem[0000000010101408] = ff0000004e4f5dff
	stxa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000ff000000
!	Mem[0000000010081420] = ffb86b5e, %l6 = 00000000, %l6 = 00000000
	add	%i2,0x20,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 00000000ffb86b5e
!	Mem[0000000010001408] = ff000000, %l0 = 00000000ff000000
	swapa	[%i0+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000021800101] = ffeb8452, %l5 = 00000000000000ff
	ldstub	[%o3+0x101],%l5		! %l5 = 000000eb000000ff
!	%l7 = 0000000073000000, Mem[0000000030181410] = 9a421fd7
	stba	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 9a421f00
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l7 = 0000000073000000
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000

p0_label_429:
!	Mem[0000000010101410] = 000000ffff00ff00, %f10 = ff000000 0000ff00
	ldda	[%i4+%o5]0x88,%f10	! %f10 = 000000ff ff00ff00
!	Mem[0000000030101410] = 00ffffff ffffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 00000000ffffffff 0000000000ffffff
!	Mem[0000000010181410] = 000000ff, %l3 = 0000000000ffffff
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l5 = 00000000000000eb
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = 000080ff, %l2 = 00000000ffffffff
	lduwa	[%i1+%g0]0x81,%l2	! %l2 = 00000000000080ff
!	Mem[00000000218001c0] = ff42a805, %l2 = 00000000000080ff
	ldsba	[%o3+0x1c0]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041400] = 0000000000000000, %l4 = 000000000000006d
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (81)
!	Mem[0000000010181400] = ff421fd7 000000ff 00ffffff 0000ffeb
!	Mem[0000000010181410] = ff000000 ffffffff 00ff0000 00000000
!	Mem[0000000010181420] = da6dd733 000000ff 00000000 4e4f5dff
!	Mem[0000000010181430] = 6d000000 0000ff00 000000ff 00000010
	ldda	[%i6]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[0000000010101410] = 00ff00ff, %l6 = 00000000ffb86b5e
	ldsha	[%i4+0x010]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = ff000000, %l0 = 00000000ff000000
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 000000ff000000ff

p0_label_430:
!	%l6 = 00000000000000ff, Mem[0000000030001410] = ffffffff
	stha	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ffffff
!	Mem[0000000030101400] = 000000ff, %l1 = ff00000000000000
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = ffffffff, %l0 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[00000000300c1400] = ff000000ff000000
	stxa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l6 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101400] = 00000000
	stha	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	Mem[0000000030181410] = 9a421f00, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000021800100] = ffff8452, %asi = 80
	stha	%l6,[%o3+0x100]%asi	! Mem[0000000021800100] = 00ff8452
!	Mem[0000000010141400] = ffffffff, %l0 = 00000000000000ff
	swap	[%i5+%g0],%l0		! %l0 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff0000ff, %l2 = ffffffffffffffff
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff

p0_label_431:
!	Mem[0000000030101410] = ffffffffffffff00, %l1 = 00000000000000ff
	ldxa	[%i4+%o5]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010101410] = 00ff00ff, %l5 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = ffff58bc, %l1 = ffffffffffffff00
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000ffff
!	Mem[0000000010181408] = 00ffffff, %l3 = 00000000000000ff
	lduw	[%i6+%o4],%l3		! %l3 = 0000000000ffffff
!	Mem[000000001008141c] = 00ff0000, %l5 = 0000000000000000
	ldsw	[%i2+0x01c],%l5		! %l5 = 0000000000ff0000
!	Mem[0000000030081400] = 6d00000000000000, %l5 = 0000000000ff0000
	ldxa	[%i2+%g0]0x89,%l5	! %l5 = 6d00000000000000
!	Mem[0000000010181408] = 00ffffff, %l3 = 0000000000ffffff
	ldswa	[%i6+%o4]0x80,%l3	! %l3 = 0000000000ffffff
!	Mem[0000000010181400] = ff421fd7000000ff, %f4  = ff000000 6d000000
	ldda	[%i6+%g0]0x80,%f4 	! %f4  = ff421fd7 000000ff
!	Mem[0000000010101420] = ffb86b5e, %l5 = 6d00000000000000
	ldsba	[%i4+0x023]%asi,%l5	! %l5 = 000000000000005e
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 000000ff000000ff

p0_label_432:
!	%l4 = 0000000000000000, Mem[0000000030181400] = d71f429a
	stwa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Mem[0000000010141410] = ff000000, %l6 = 00000000000000ff
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	%l3 = 0000000000ffffff, Mem[00000000100c1400] = 000000ff
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00ffffff
!	%f4  = ff421fd7 000000ff, Mem[0000000010041400] = 00000000 00000000
	stda	%f4 ,[%i1+%g0]0x80	! Mem[0000000010041400] = ff421fd7 000000ff
!	%l0 = 00000000ffffffff, Mem[00000000100c1400] = ffffff0000000000
	stxa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000ffffffff
!	%f0  = 00000000 5e6bb8ff, %l2 = 00000000000000ff
!	Mem[0000000010081418] = 0000000000ff0000
	add	%i2,0x018,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010081418] = ffb86b5e00000000
!	Mem[0000000010141400] = ff000000, %l5 = 000000000000005e
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030101408] = 000000ff
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	%l4 = 0000000000000000, Mem[0000000010101408] = 000000ff
	stba	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = 00000000, %l6 = 00000000ff000000
	ldsw	[%i3+0x030],%l6		! %l6 = 0000000000000000

p0_label_433:
!	Mem[0000000030101410] = ffffffffffffff00, %l5 = 0000000000000000
	ldxa	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010081428] = ff0000000000ff00, %f0  = 00000000 5e6bb8ff
	ldda	[%i2+0x028]%asi,%f0 	! %f0  = ff000000 0000ff00
!	Mem[0000000010141408] = 000000ff, %l3 = 0000000000ffffff
	ldsha	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081410] = ff000000, %l5 = ffffffffffffff00
	ldsha	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010081430] = 00000000 000000ff, %l0 = ffffffff, %l1 = 0000ffff
	ldda	[%i2+0x030]%asi,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[0000000010001400] = 000000ff, %f7  = 000000ff
	lda	[%i0+%g0]0x88,%f7 	! %f7 = 000000ff
!	Mem[0000000030041408] = ff000000d71f429a, %l2 = 00000000000000ff
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = ff000000d71f429a
!	Mem[0000000010041438] = 10ffa19c ff000000, %l2 = d71f429a, %l3 = 000000ff
	ldda	[%i1+0x038]%asi,%l2	! %l2 = 0000000010ffa19c 00000000ff000000
!	%l4 = 0000000000000000, %l1 = 00000000000000ff, %l5 = ffffffffffffff00
	subc	%l4,%l1,%l5		! %l5 = ffffffffffffff01
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 000000ff, %l1 = 00000000000000ff
	swapa	[%i4+%g0]0x88,%l1	! %l1 = 00000000000000ff

p0_label_434:
!	%l6 = 0000000000000000, Mem[00000000211c0001] = ffff58bc
	stb	%l6,[%o2+0x001]		! Mem[00000000211c0000] = ff0058bc
!	%f10 = 000000ff ff00ff00, Mem[0000000030001408] = 00000000 00000000
	stda	%f10,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff ff00ff00
!	%f0  = ff000000, Mem[0000000010041410] = ffffffff
	sta	%f0 ,[%i1+%o5]0x88	! Mem[0000000010041410] = ff000000
!	%l5 = ffffffffffffff01, Mem[00000000201c0000] = 6aff0847
	stb	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 01ff0847
!	%f12 = 9a421fd7 000000ff, Mem[0000000030101400] = 00000000 d71f429a
	stda	%f12,[%i4+%g0]0x81	! Mem[0000000030101400] = 9a421fd7 000000ff
!	%l6 = 0000000000000000, Mem[0000000010041400] = d71f42ff
	stwa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Mem[00000000100c1410] = ff0000ff, %l0 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000010101400] = ff000000, %l0 = 00000000ff0000ff
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	%f16 = ff421fd7 000000ff, Mem[0000000030101410] = ffffffff ffffff00
	stda	%f16,[%i4+%o5]0x81	! Mem[0000000030101410] = ff421fd7 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000, %l5 = ffffffffffffff01
	lduha	[%i5+0x00a]%asi,%l5	! %l5 = 0000000000000000

p0_label_435:
!	%f16 = ff421fd7 000000ff, %l5 = 0000000000000000
!	Mem[00000000100c1400] = 00000000ffffffff
	stda	%f16,[%i3+%l5]ASI_PST16_P ! Mem[00000000100c1400] = 00000000ffffffff
!	Mem[0000000010141400] = ff0000ff, %l3 = 00000000ff000000
	lduwa	[%i5+%g0]0x88,%l3	! %l3 = 00000000ff0000ff
!	Mem[0000000010181410] = 000000ff, %l2 = 0000000010ffa19c
	ldswa	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001434] = 00000000, %l1 = 00000000000000ff
	ldsh	[%i0+0x036],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %l6 = 0000000000000000
	ldswa	[%i1+%o4]0x81,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010181434] = 0000ff00, %l1 = 0000000000000000
	ldsba	[%i6+0x035]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l6 = ffffffffff000000
	ldsba	[%i6+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141418] = 5e6bb8ff, %l1 = 0000000000000000
	ldsha	[%i5+0x01a]%asi,%l1	! %l1 = ffffffffffffb8ff
!	Mem[0000000010041410] = 000000ff ffffffff, %l2 = 000000ff, %l3 = ff0000ff
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000000000ff 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ffffffff, Mem[0000000030081408] = 00000000
	stha	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = ffff0000

p0_label_436:
!	%f16 = ff421fd7 000000ff 00ffffff 0000ffeb
!	%f20 = ff000000 ffffffff 00ff0000 00000000
!	%f24 = da6dd733 000000ff 00000000 4e4f5dff
!	%f28 = 6d000000 0000ff00 000000ff 00000010
	stda	%f16,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	%f12 = 9a421fd7, Mem[0000000010001410] = 00000000
	sta	%f12,[%i0+%o5]0x80	! Mem[0000000010001410] = 9a421fd7
!	Mem[0000000010181410] = ff000000, %l6 = ffffffffffffffff
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	%l7 = 00000000000000ff, Mem[0000000010001410] = 9a421fd7
	stwa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff
!	%l6 = 00000000ff000000, Mem[00000000100c1400] = 00000000
	stba	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010081410] = d5f9ffff
	stha	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = d5f90000
!	%l3 = 00000000ffffffff, Mem[0000000010081410] = d5f90000
	stwa	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffff
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000010001400] = 000000ff ffffffff
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff ffffffff
!	Mem[0000000030181410] = 9a421fff, %l2 = 00000000000000ff
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (82)
!	Mem[0000000030141410] = ff000000ffffffff, %f10 = 000000ff ff00ff00
	ldda	[%i5+%o5]0x81,%f10	! %f10 = ff000000 ffffffff

p0_label_437:
!	Mem[0000000030041400] = 000080ff, %l1 = ffffffffffffb8ff
	lduha	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081430] = 00000000 000000ff, %l2 = 000000ff, %l3 = ffffffff
	ldda	[%i2+0x030]%asi,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000010181410] = ffffffff, %l1 = 0000000000000000
	ldswa	[%i6+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101408] = 000000ff00000000, %f20 = ff000000 ffffffff
	ldda	[%i4+%o4]0x80,%f20	! %f20 = 000000ff 00000000
!	%f16 = ff421fd7 000000ff 00ffffff 0000ffeb
!	%f20 = 000000ff 00000000 00ff0000 00000000
!	%f24 = da6dd733 000000ff 00000000 4e4f5dff
!	%f28 = 6d000000 0000ff00 000000ff 00000010
	stda	%f16,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400
!	Mem[0000000010101408] = 000000ff, %f14 = 000080ff
	lda	[%i4+%o4]0x80,%f14	! %f14 = 000000ff
!	Mem[0000000030081408] = ffff0000, %l6 = 00000000ff000000
	lduwa	[%i2+%o4]0x81,%l6	! %l6 = 00000000ffff0000
!	Mem[0000000010141408] = 000000ff, %l7 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000e923210d, %l0 = 00000000000000ff
	ldxa	[%i3+%o5]0x80,%l0	! %l0 = 00000000e923210d
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (83)
!	%f16 = ff421fd7 000000ff 00ffffff 0000ffeb
!	%f20 = 000000ff 00000000 00ff0000 00000000
!	%f24 = da6dd733 000000ff 00000000 4e4f5dff
!	%f28 = 6d000000 0000ff00 000000ff 00000010
	stda	%f16,[%i1]ASI_BLK_PL	! Block Store to 0000000010041400

p0_label_438:
!	%f4  = ff421fd7 000000ff, Mem[0000000010081408] = ffffffff ff000000
	stda	%f4 ,[%i2+%o4]0x80	! Mem[0000000010081408] = ff421fd7 000000ff
!	Mem[0000000030081400] = 00000000, %l0 = 00000000e923210d
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[00000000211c0001] = ff0058bc
	stb	%l0,[%o2+0x001]		! Mem[00000000211c0000] = ff0058bc
!	%l0 = 0000000000000000, Mem[0000000020800000] = 0000261d
	sth	%l0,[%o1+%g0]		! Mem[0000000020800000] = 0000261d
!	%l6 = ffff0000, %l7 = 000000ff, Mem[0000000010081438] = ff000000 9ca1ff10
	std	%l6,[%i2+0x038]		! Mem[0000000010081438] = ffff0000 000000ff
!	%f10 = ff000000 ffffffff, Mem[0000000030041410] = ff000000 00000000
	stda	%f10,[%i1+%o5]0x89	! Mem[0000000030041410] = ff000000 ffffffff
!	%l2 = 0000000000000000, Mem[00000000201c0000] = 01ff0847, %asi = 80
	stba	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff0847
!	%l6 = 00000000ffff0000, Mem[0000000030141400] = ff421fd7
	stba	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00421fd7
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010181410] = ffffffff ffffffff
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000 000000ff ff000000 00000000
!	Mem[0000000030181410] = ff1f429a 00000000 bb000000 00000000
!	Mem[0000000030181420] = ff000000 00000055 d587da6d d7000039
!	Mem[0000000030181430] = 0d2123e9 34e7136a 00000000 fbf9d6b7
	ldda	[%i6]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030181400

p0_label_439:
	membar	#Sync			! Added by membar checker (84)
!	Mem[0000000010041400] = ff000000 d71f42ff, %l6 = ffff0000, %l7 = 000000ff
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ff000000 00000000d71f42ff
!	Mem[0000000010181400] = ff421fd7, %l6 = 00000000ff000000
	ldswa	[%i6+%g0]0x80,%l6	! %l6 = ffffffffff421fd7
!	Mem[0000000010101400] = ff000000, %l6 = ffffffffff421fd7
	ldsha	[%i4+%g0]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[00000000201c0000] = 00ff0847, %l4 = 0000000000000000
	lduh	[%o0+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030141408] = 00ffffff, %l2 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101438] = 000000ff9ca1ff10, %l6 = ffffffffffffff00
	ldxa	[%i4+0x038]%asi,%l6	! %l6 = 000000ff9ca1ff10
!	Mem[0000000030001400] = 00000000000000ff, %f20 = 00000000 9a421fff
	ldda	[%i0+%g0]0x89,%f20	! %f20 = 00000000 000000ff
!	Mem[00000000100c1424] = 00000042, %l6 = 000000ff9ca1ff10
	ldswa	[%i3+0x024]%asi,%l6	! %l6 = 0000000000000042
!	Mem[00000000300c1400] = ff00000000000000, %l6 = 0000000000000042
	ldxa	[%i3+%g0]0x81,%l6	! %l6 = ff00000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141404] = 00000000, %l0 = 0000000000000000
	swap	[%i5+0x004],%l0		! %l0 = 0000000000000000

p0_label_440:
!	Mem[0000000030101408] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l1 = ffffffffffffffff, Mem[0000000010101410] = 00ff00ff
	stha	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = ffff00ff
!	Mem[0000000010081408] = ff421fd7000000ff, %l0 = 0000000000000000, %l5 = 0000000000000000
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = ff421fd7000000ff
!	Mem[000000001014142c] = 000000b8, %l7 = d71f42ff, %l7 = d71f42ff
	add	%i5,0x2c,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 00000000000000b8
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010141410] = ff000000 00000000
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff 000000ff
!	Mem[0000000010041429] = ff5d4f4e, %l5 = ff421fd7000000ff
	ldstuba	[%i1+0x029]%asi,%l5	! %l5 = 0000005d000000ff
!	Mem[00000000201c0000] = 00ff0847, %l1 = ffffffffffffffff
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030101410] = d71f42ff
	stha	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = d71f0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = 000000ff, %l1 = 0000000000000000
	ldswa	[%i4+0x038]%asi,%l1	! %l1 = 00000000000000ff

p0_label_441:
!	Mem[0000000010081400] = 000000ff, %l7 = 00000000000000b8
	lduwa	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = 000000ff, %f15 = 000000ff
	lda	[%i5+%o4]0x88,%f15	! %f15 = 000000ff
!	Mem[0000000030101410] = d71f0000, %l3 = 00000000000000ff
	lduwa	[%i4+%o5]0x89,%l3	! %l3 = 00000000d71f0000
!	Mem[0000000030181400] = 00000000, %l6 = ff00000000000000
	ldsba	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181438] = 000000ff00000010, %f26 = 390000d7 6dda87d5
	ldda	[%i6+0x038]%asi,%f26	! %f26 = 000000ff 00000010
!	Mem[0000000010101400] = ff000000, %l2 = 00000000000000ff
	ldswa	[%i4+%g0]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010081410] = ffffffffebbbffff, %l0 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l0	! %l0 = ffffffffebbbffff
!	Mem[0000000010101424] = 00000000, %l5 = 000000000000005d
	ldsha	[%i4+0x026]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = ff0000ff, %l1 = 00000000000000ff
	ldsha	[%i4+%o4]0x81,%l1	! %l1 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ff000000, %l7 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 000000ff000000ff

p0_label_442:
!	%f0  = ff000000 0000ff00, %l0 = ffffffffebbbffff
!	Mem[0000000030041410] = ffffffff000000ff
	add	%i1,0x010,%g1
	stda	%f0,[%g1+%l0]ASI_PST8_S ! Mem[0000000030041410] = ff0000000000ff00
!	%f16 = ff000000, Mem[0000000010101410] = ff00ffff
	sta	%f16,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000000
!	%f10 = ff000000 ffffffff, Mem[00000000300c1408] = 000000ff ff000000
	stda	%f10,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff000000 ffffffff
!	%l4 = 00000000000000ff, Mem[0000000030141408] = ffffff00
	stba	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff
!	%l6 = 0000000000000000, Mem[0000000010181424] = 000000ff, %asi = 80
	stba	%l6,[%i6+0x024]%asi	! Mem[0000000010181424] = 000000ff
!	%f30 = b7d6f9fb 00000000, Mem[00000000300c1400] = 000000ff 00000000
	stda	%f30,[%i3+%g0]0x89	! Mem[00000000300c1400] = b7d6f9fb 00000000
!	%l1 = ffffffffffffff00, Mem[0000000030141410] = 000000ff
	stha	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ff00
!	%f28 = 6a13e734 e923210d, Mem[0000000010081418] = ffb86b5e 00000000
	std	%f28,[%i2+0x018]	! Mem[0000000010081418] = 6a13e734 e923210d
!	%l3 = 00000000d71f0000, Mem[00000000100c143d] = 87ffc6cd, %asi = 80
	stba	%l3,[%i3+0x03d]%asi	! Mem[00000000100c143c] = 8700c6cd
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 000000ff, %l0 = ffffffffebbbffff
	lduha	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff

p0_label_443:
!	Mem[00000000211c0000] = ff0058bc, %l5 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = ff000000, %l6 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010141408] = ff000000, %l4 = 00000000000000ff
	lduwa	[%i5+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030081410] = ff000000 acef4ef8, %l2 = ff000000, %l3 = d71f0000
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff000000 00000000acef4ef8
!	Mem[0000000010101400] = ff000000, %l3 = 00000000acef4ef8
	lduwa	[%i4+0x000]%asi,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030141410] = 0000ff00, %l2 = 00000000ff000000
	ldsha	[%i5+%o5]0x89,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030081410] = ff000000 acef4ef8, %l2 = ffffff00, %l3 = ff000000
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff000000 00000000acef4ef8
!	Mem[0000000030001400] = ff000000 00000000 000000ff ff00ff00
!	Mem[0000000030001410] = 00ffffff 00000000 ff000000 af1600ff
!	Mem[0000000030001420] = ffb86b5e da6dd733 ffb86b5e 000000ff
!	Mem[0000000030001430] = ff000000 8900ff00 ffffffff ff000000
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000010001408] = ff000000, %l5 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff00, Mem[0000000030081400] = ff0000000000006d
	stxa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffffffffff00

p0_label_444:
!	Mem[00000000300c1408] = ffffffff, %l1 = ffffffffffffff00
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%l6 = ffffffffff000000, Mem[0000000010181425] = 000000ff, %asi = 80
	stba	%l6,[%i6+0x025]%asi	! Mem[0000000010181424] = 000000ff
!	%l2 = 00000000ff000000, Mem[00000000201c0001] = ffff0847
	stb	%l2,[%o0+0x001]		! Mem[00000000201c0000] = ff000847
!	%f10 = ff000000 ffffffff, Mem[00000000100c1408] = ff000000 00000000
	std	%f10,[%i3+%o4]	! Mem[00000000100c1408] = ff000000 ffffffff
!	Mem[0000000030041410] = ff000000, %l6 = ffffffffff000000
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	%l2 = 00000000ff000000, Mem[0000000010181410] = 00000000
	stba	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%f7  = 000000ff, Mem[0000000030141410] = 0000ff00
	sta	%f7 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	%l3 = 00000000acef4ef8, Mem[0000000010041410] = 00000000ff000000
	stxa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000acef4ef8
!	%f11 = ffffffff, Mem[0000000010001410] = ff000000
	sta	%f11,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff000000, %l2 = 00000000ff000000
	lduha	[%i6+%o4]0x81,%l2	! %l2 = 000000000000ff00

p0_label_445:
!	Mem[00000000100c1438] = ff0000ff 8700c6cd, %l6 = 000000ff, %l7 = 000000ff
	ldd	[%i3+0x038],%l6		! %l6 = 00000000ff0000ff 000000008700c6cd
!	Mem[0000000010001400] = ff000000ffffffff, %f2  = 6d000000 00000000
	ldda	[%i0+%g0]0x80,%f2 	! %f2  = ff000000 ffffffff
!	Mem[0000000010081438] = ffff0000, %l2 = 000000000000ff00
	ldsw	[%i2+0x038],%l2		! %l2 = ffffffffffff0000
!	Mem[0000000030041400] = 000080ff, %l1 = 00000000000000ff
	lduwa	[%i1+%g0]0x81,%l1	! %l1 = 00000000000080ff
!	Mem[0000000030081410] = f84eefac000000ff, %f6  = ff00ffff 000000ff
	ldda	[%i2+%o5]0x89,%f6 	! %f6  = f84eefac 000000ff
!	Mem[00000000211c0000] = ff0058bc, %l3 = 00000000acef4ef8
	lduba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (85)
!	Mem[0000000030141400] = 00421fd7 000000ff ffffffff 0000ffeb
!	Mem[0000000030141410] = ff000000 ffffffff 00ff0000 00000000
!	Mem[0000000030141420] = da6dd733 000000ff 00000000 4e4f5dff
!	Mem[0000000030141430] = 6d000000 0000ff00 000000ff 00000010
	ldda	[%i5]ASI_BLK_AIUS,%f16	! Block Load from 0000000030141400
!	Mem[00000000100c1408] = ff000000, %l3 = 00000000000000ff
	lduba	[%i3+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101400] = d71f429a, %l6 = 00000000ff0000ff
	lduwa	[%i4+%g0]0x89,%l6	! %l6 = 00000000d71f429a
!	Starting 10 instruction Store Burst
!	%f14 = 000000ff, Mem[000000001000140c] = 00000000
	sta	%f14,[%i0+0x00c]%asi	! Mem[000000001000140c] = 000000ff

p0_label_446:
!	Mem[00000000211c0000] = ff0058bc, %l7 = 000000008700c6cd
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 000000000000ff00
	membar	#Sync			! Added by membar checker (86)
!	%l3 = 00000000000000ff, Mem[0000000030141408] = ffffffff
	stba	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff
!	%l3 = 00000000000000ff, Mem[0000000030181400] = 00000000
	stba	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	Mem[00000000211c0000] = ff0058bc, %l4 = 00000000ff000000
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000030081408] = ffffffff0000ffff
	stxa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000ff
!	%l1 = 00000000000080ff, Mem[0000000030181400] = ff000000000000ff
	stxa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000000080ff
!	%l1 = 00000000000080ff, Mem[0000000010141410] = 000000ff
	stwa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 000080ff
!	%f28 = 6d000000, Mem[00000000100c1408] = ff000000
	sta	%f28,[%i3+%o4]0x80	! Mem[00000000100c1408] = 6d000000
!	Mem[00000000100c140c] = ffffffff, %l2 = ffffffffffff0000
	swap	[%i3+0x00c],%l2		! %l2 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000 00000000 ff421fd7 000000ff
!	Mem[0000000010081410] = ffffffff ebbbffff 6a13e734 e923210d
!	Mem[0000000010081420] = ffb86b5e 00000000 ff000000 0000ff00
!	Mem[0000000010081430] = 00000000 000000ff ffff0000 000000ff
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400

p0_label_447:
!	Mem[00000000300c1400] = 00000000fbf9d6b7, %l1 = 00000000000080ff
	ldxa	[%i3+%g0]0x81,%l1	! %l1 = 00000000fbf9d6b7
!	Mem[0000000030101408] = ff0000ff, %l5 = 00000000000000ff
	lduwa	[%i4+%o4]0x89,%l5	! %l5 = 00000000ff0000ff
!	Mem[00000000100c1410] = 00000000, %l5 = 00000000ff0000ff
	lduh	[%i3+%o5],%l5		! %l5 = 0000000000000000
!	Mem[00000000201c0000] = ff000847, %l3 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030101400] = d71f429a, %f12 = 9a421fd7
	lda	[%i4+%g0]0x89,%f12	! %f12 = d71f429a
!	Mem[00000000100c1400] = ffffffff00000000, %l3 = ffffffffffffff00
	ldxa	[%i3+%g0]0x88,%l3	! %l3 = ffffffff00000000
!	Mem[000000001008142c] = 0000ff00, %l1 = 00000000fbf9d6b7
	lduba	[%i2+0x02c]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = ebff0000 ffffffff, %l6 = d71f429a, %l7 = 0000ff00
	ldda	[%i5+%o4]0x89,%l6	! %l6 = 00000000ffffffff 00000000ebff0000
!	Mem[0000000030001400] = ff000000, %l2 = 00000000ffffffff
	lduwa	[%i0+%g0]0x81,%l2	! %l2 = 00000000ff000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (87)
!	%l5 = 0000000000000000, Mem[0000000010081400] = 000000ff
	stwa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000

p0_label_448:
!	%l5 = 0000000000000000, Mem[0000000030141400] = d71f4200
	stwa	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l2 = ff000000, %l3 = 00000000, Mem[0000000030141400] = 00000000 ff000000
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ff000000 00000000
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010081408] = d71f42ff ff000000
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff 00000000
!	%l1 = 0000000000000000, Mem[0000000030101400] = 9a421fd7
	stha	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 00001fd7
!	%l1 = 0000000000000000, %l7 = 00000000ebff0000, %l2 = 00000000ff000000
	and	%l1,%l7,%l2		! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000100c1408] = 0000006d
	stha	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010001400] = ff000000ffffffff, %l0 = 00000000000000ff, %l6 = 00000000ffffffff
	casxa	[%i0]0x80,%l0,%l6	! %l6 = ff000000ffffffff
!	%f30 = ffff0000 000000ff, Mem[0000000010141408] = 000000ff 00000000
	stda	%f30,[%i5+%o4]0x88	! Mem[0000000010141408] = ffff0000 000000ff
!	%f22 = 6a13e734 e923210d, Mem[00000000100c1428] = 982aff92 000000ff
	stda	%f22,[%i3+0x028]%asi	! Mem[00000000100c1428] = 6a13e734 e923210d
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 5e6bb8ff, %l6 = ff000000ffffffff
	lduha	[%i3+%o5]0x89,%l6	! %l6 = 000000000000b8ff

p0_label_449:
!	Mem[0000000030141400] = ff000000, %f4  = ff421fd7
	lda	[%i5+%g0]0x89,%f4 	! %f4 = ff000000
!	Mem[0000000010101408] = ff000000, %l5 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 00ffffff, %l4 = 00000000000000ff
	lduwa	[%i6+%o4]0x80,%l4	! %l4 = 0000000000ffffff
!	Mem[0000000030101408] = ff0000ff, %l6 = 000000000000b8ff
	lduha	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000e923210d, %l6 = 00000000000000ff
	ldxa	[%i3+%o5]0x80,%l6	! %l6 = 00000000e923210d
!	Mem[0000000010041410] = 00000000, %l6 = 00000000e923210d
	lduha	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = ff000000000000ff, %f28 = 00000000 000000ff
	ldda	[%i0+%o4]0x80,%f28	! %f28 = ff000000 000000ff
!	Mem[0000000010181408] = ebff0000ffffff00, %f4  = ff000000 000000ff
	ldda	[%i6+%o4]0x88,%f4 	! %f4  = ebff0000 ffffff00
!	Mem[0000000030041408] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f17 = 00000000, Mem[0000000010041404] = d71f42ff
	st	%f17,[%i1+0x004]	! Mem[0000000010041404] = 00000000

p0_label_450:
!	%l6 = 00000000, %l7 = ebff0000, Mem[00000000100c1408] = 00000000 ffff0000
	stda	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 ebff0000
!	%f13 = 000000ff, Mem[0000000030041410] = 000000ff
	sta	%f13,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000030001410] = 00ffffff 00000000
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff 00000000
!	Mem[0000000010141408] = ff000000, %l3 = ffffffff00000000
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030141400] = 000000ff, %l7 = 00000000ebff0000
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081408] = ff000000, %l4 = 0000000000ffffff
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000030141410] = 000000ff
	stwa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	Mem[0000000010141408] = 00000000, %l0 = 00000000000000ff
	swapa	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%f20 = ffffffff, Mem[0000000010141408] = ff000000
	sta	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = ffffffff, %l0 = 0000000000000000
	lduh	[%i0+0x038],%l0		! %l0 = 000000000000ffff

p0_label_451:
!	Mem[0000000030001400] = ff00000000000000, %f2  = ff000000 ffffffff
	ldda	[%i0+%g0]0x81,%f2 	! %f2  = ff000000 00000000
!	Mem[0000000010001410] = ffffffff, %f25 = 00000000
	lda	[%i0+%o5]0x80,%f25	! %f25 = ffffffff
!	Mem[0000000030001400] = 000000ff, %l7 = 00000000000000ff
	ldswa	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[000000001010141c] = 00000000, %l4 = 00000000000000ff
	ldsw	[%i4+0x01c],%l4		! %l4 = 0000000000000000
!	Mem[000000001008142c] = 0000ff00, %l3 = 00000000ff000000
	ldsw	[%i2+0x02c],%l3		! %l3 = 000000000000ff00
!	Mem[0000000010101408] = ff000000, %l7 = 00000000000000ff
	lduba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = ff000000, %l2 = 00000000000000ff
	ldswa	[%i2+%o4]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[00000000201c0000] = ff000847, %l4 = 0000000000000000
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ff00
!	Mem[0000000010081400] = 00000000, %f30 = ffff0000
	lda	[%i2+%g0]0x80,%f30	! %f30 = 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030081410] = ff000000acef4ef8
	stxa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000

p0_label_452:
!	%l4 = 000000000000ff00, Mem[00000000211c0000] = ff0058bc, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff0058bc
!	Mem[00000000300c1410] = ffb86b5e, %l4 = 000000000000ff00
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010081400] = 00000000, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l2 = ff000000, %l3 = 0000ff00, Mem[0000000010001438] = ffffffff 000000ff
	std	%l2,[%i0+0x038]		! Mem[0000000010001438] = ff000000 0000ff00
!	Mem[0000000030001408] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010101400] = 000000ff
	stwa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	Mem[0000000030081400] = ffffffff, %l5 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 00000000ffffffff
!	%l4 = 0000000000000000, Mem[000000001004143b] = 10000000, %asi = 80
	stba	%l4,[%i1+0x03b]%asi	! Mem[0000000010041438] = 10000000
!	%l2 = ffffffffff000000, Mem[0000000010081410] = ffffffffebbbffff
	stxa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffffff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ebff0000, %l1 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffffebff

p0_label_453:
!	Mem[0000000010001438] = ff000000 0000ff00, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+0x038]%asi,%l6	! %l6 = 00000000ff000000 000000000000ff00
!	Mem[00000000300c1400] = 00000000, %l7 = 000000000000ff00
	lduba	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001434] = 00000000, %l3 = 000000000000ff00
	ldsb	[%i0+0x036],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041408] = 0000ffeb, %l2 = ffffffffff000000
	ldsha	[%i1+%o4]0x88,%l2	! %l2 = ffffffffffffffeb
!	Mem[00000000201c0000] = ff000847, %l3 = 0000000000000000
	lduh	[%o0+%g0],%l3		! %l3 = 000000000000ff00
!	Mem[0000000010001408] = ff000000 000000ff, %l2 = ffffffeb, %l3 = 0000ff00
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 00000000ff000000 00000000000000ff
!	Mem[0000000030101410] = d71f0000, %l2 = 00000000ff000000
	ldswa	[%i4+%o5]0x89,%l2	! %l2 = ffffffffd71f0000
!	Mem[00000000211c0000] = ff0058bc, %l5 = 00000000ffffffff
	ldsh	[%o2+%g0],%l5		! %l5 = ffffffffffffff00
!	Mem[0000000030001408] = ff0000ff, %l4 = 0000000000000000
	ldswa	[%i0+%o4]0x89,%l4	! %l4 = ffffffffff0000ff
!	Starting 10 instruction Store Burst
!	%f4  = ebff0000 ffffff00, %l6 = 00000000ff000000
!	Mem[0000000030001438] = ffffffffff000000
	add	%i0,0x038,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030001438] = ffffffffff000000

p0_label_454:
!	Mem[00000000300c1408] = ffffffff, %l2 = ffffffffd71f0000
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010101400] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l4 = ffffffffff0000ff, Mem[0000000030181400] = 00000000
	stwa	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = ff0000ff
!	Mem[0000000030181400] = ff0000ff, %l2 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l2	! %l2 = 00000000ff0000ff
!	%f4  = ebff0000 ffffff00, Mem[0000000030041400] = 000080ff 000000ff
	stda	%f4 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ebff0000 ffffff00
!	%l0 = 0000ffff, %l1 = ffffebff, Mem[0000000010181420] = da6dd733 000000ff
	std	%l0,[%i6+0x020]		! Mem[0000000010181420] = 0000ffff ffffebff
!	%l7 = 0000000000000000, Mem[0000000010101411] = 000000ff
	stb	%l7,[%i4+0x011]		! Mem[0000000010101410] = 000000ff
!	%l2 = ff0000ff, %l3 = 000000ff, Mem[0000000010141408] = ffffffff 0000ffff
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = ff0000ff 000000ff
!	Mem[0000000030141400] = ebff0000, %l4 = ffffffffff0000ff
	ldstuba	[%i5+%g0]0x81,%l4	! %l4 = 000000eb000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff000000, %l0 = 000000000000ffff
	lduha	[%i2+%o4]0x81,%l0	! %l0 = 000000000000ff00

p0_label_455:
!	Mem[0000000010141400] = 00000000 ff0000ff, %l2 = ff0000ff, %l3 = 000000ff
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 00000000ff0000ff 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l3 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = ff000847, %l4 = 00000000000000eb
	ldub	[%o0+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010141408] = ff000000 ff0000ff, %l6 = ff000000, %l7 = 00000000
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 00000000ff0000ff 00000000ff000000
!	Mem[0000000030001400] = ff000000, %l1 = ffffffffffffebff
	lduha	[%i0+%g0]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000030041408] = ff000000, %l0 = 000000000000ff00
	lduba	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[000000001010141c] = 00000000, %l2 = 00000000ff0000ff
	ldsb	[%i4+0x01d],%l2		! %l2 = 0000000000000000
!	Mem[00000000300c1408] = ffffffff, %l6 = 00000000ff0000ff
	ldswa	[%i3+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141408] = ff0000ff, %f10 = ff000000
	lda	[%i5+%o4]0x80,%f10	! %f10 = ff0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = ffff0000, %l1 = 000000000000ff00
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 000000ff000000ff

p0_label_456:
!	%l6 = ffffffffffffffff, Mem[0000000010041400] = ff00000000000000
	stxa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffffffffffff
!	Mem[0000000010101410] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030041408] = 000000ff
	stwa	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	Mem[0000000030081410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181410] = 9a421fff, %l6 = ffffffffffffffff
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010041400] = ffffffff, %l4 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 00000000ffffffff
!	%l0 = 00000000000000ff, Mem[0000000030141408] = ffffffff
	stwa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff
!	Mem[0000000030001410] = ff000000, %l7 = 00000000ff000000
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141400] = ff0000ff, %l1 = 00000000000000ff
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffb86b5e, %l4 = 00000000ffffffff
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 00000000ffb86b5e

p0_label_457:
!	Mem[0000000030101408] = 00000000 ff0000ff, %l0 = 000000ff, %l1 = ff0000ff
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 00000000ff0000ff 0000000000000000
	membar	#Sync			! Added by membar checker (88)
!	Mem[0000000010081400] = 00000000 00000000 ff000000 00000000
!	Mem[0000000010081410] = ffffffff ff000000 6a13e734 e923210d
!	Mem[0000000010081420] = ffb86b5e 00000000 ff000000 0000ff00
!	Mem[0000000010081430] = 00000000 000000ff ffff0000 000000ff
	ldda	[%i2]ASI_BLK_AIUP,%f0	! Block Load from 0000000010081400
!	Mem[0000000010181408] = ffffff00, %l7 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030101410] = ff000000d71f0000, %l3 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = ff000000d71f0000
!	Mem[00000000100c1400] = 00000000, %l1 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1430] = 00000000, %l6 = 00000000000000ff
	lduh	[%i3+0x032],%l6		! %l6 = 0000000000000000
!	Mem[0000000010041408] = ebff0000, %l6 = 0000000000000000
	lduha	[%i1+%o4]0x80,%l6	! %l6 = 000000000000ebff
!	Mem[0000000010181410] = 00000000, %l6 = 000000000000ebff
	ldsba	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 00000000 acef4ef8, %l2 = 00000000, %l3 = d71f0000
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000 00000000acef4ef8
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffff00, Mem[00000000201c0000] = ff000847
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = ff000847

p0_label_458:
!	%f0  = 00000000 00000000 ff000000 00000000
!	%f4  = ffffffff ff000000 6a13e734 e923210d
!	%f8  = ffb86b5e 00000000 ff000000 0000ff00
!	%f12 = 00000000 000000ff ffff0000 000000ff
	stda	%f0,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	Mem[0000000030101410] = 00001fd7, %l3 = 00000000acef4ef8
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 0000000000001fd7
!	%l7 = ffffffffffffff00, Mem[0000000010101408] = 000000ff, %asi = 80
	stwa	%l7,[%i4+0x008]%asi	! Mem[0000000010101408] = ffffff00
!	Mem[00000000100c1408] = 00000000ebff0000, %l4 = 00000000ffb86b5e, %l7 = ffffffffffffff00
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 00000000ebff0000
!	%f30 = 00000000 000000ff, %l6 = 0000000000000000
!	Mem[0000000030181420] = ff00000000000055
	add	%i6,0x020,%g1
	stda	%f30,[%g1+%l6]ASI_PST16_S ! Mem[0000000030181420] = ff00000000000055
!	%l0 = 00000000ff0000ff, Mem[0000000010101408] = ffffff0000000000, %asi = 80
	stxa	%l0,[%i4+0x008]%asi	! Mem[0000000010101408] = 00000000ff0000ff
!	%l3 = 0000000000001fd7, Mem[0000000030101408] = ff0000ff00000000
	stxa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000001fd7
!	Mem[0000000010101410] = ff0000ff, %l6 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000010001430] = 00003b3d, %l3 = 00001fd7, %l6 = ff0000ff
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 0000000000003b3d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l7 = 00000000ebff0000
	lduba	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_459:
	membar	#Sync			! Added by membar checker (89)
!	Mem[0000000030141408] = 000000ff, %l3 = 0000000000001fd7
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = ffb86b5e000000ff, %f28 = ff000000 000000ff
	ldda	[%i3+%o5]0x81,%f28	! %f28 = ffb86b5e 000000ff
!	Mem[0000000030141400] = 00000000, %l3 = 00000000000000ff
	lduba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[000000001008140c] = 00000000, %l4 = 00000000ffb86b5e
	lduw	[%i2+0x00c],%l4		! %l4 = 0000000000000000
!	Mem[0000000030001410] = ff0000ff, %l2 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000211c0000] = ff0058bc, %l2 = 00000000000000ff
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030101410] = f84eefac, %l6 = 0000000000003b3d
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = ffffffffffffefac
!	Mem[0000000010181410] = ff00000000000000, %f0  = 00000000 00000000
	ldda	[%i6+%o5]0x88,%f0 	! %f0  = ff000000 00000000
!	Mem[00000000100c1438] = ff0000ff, %l7 = 0000000000000000
	lduha	[%i3+0x03a]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffff00, Mem[0000000010181410] = ff00000000000000
	stxa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffffffffff00

p0_label_460:
!	%l4 = 0000000000000000, Mem[0000000030101410] = f84eefac
	stwa	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l2 = 000000000000ff00, Mem[0000000030101400] = ff000000d71f0000
	stxa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000000000ff00
!	Mem[0000000010081400] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[000000001000141b] = 00000000, %asi = 80
	stba	%l1,[%i0+0x01b]%asi	! Mem[0000000010001418] = 00000000
!	%l7 = 0000000000000000, Mem[00000000100c1430] = 00000000
	sth	%l7,[%i3+0x030]		! Mem[00000000100c1430] = 00000000
!	%f10 = ff000000 0000ff00, Mem[0000000010141438] = 9a421fd7 000000ff
	stda	%f10,[%i5+0x038]%asi	! Mem[0000000010141438] = ff000000 0000ff00
!	%l2 = 000000000000ff00, Mem[0000000010081408] = ff000000
	stha	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000
!	Mem[0000000010001400] = 000000ff, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l2 = 000000000000ff00
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 000000ff, %l6 = ffffffffffffefac
	lduwa	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_461:
!	Mem[00000000201c0000] = ff000847, %l1 = 0000000000000000
	ldsb	[%o0+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030181410] = ff1f429a, %l6 = 00000000000000ff
	ldswa	[%i6+%o5]0x81,%l6	! %l6 = ffffffffff1f429a
!	Mem[0000000010041408] = 0000ffeb, %l5 = ffffffffffffff00
	ldswa	[%i1+%o4]0x88,%l5	! %l5 = 000000000000ffeb
	membar	#Sync			! Added by membar checker (90)
!	Mem[0000000010101400] = ff000000 00000000 0000ff00 ff0000ff
!	Mem[0000000010101410] = 00000000 ff000000 ff00ffff 00000000
!	Mem[0000000010101420] = ffb86b5e 00000000 ff000000 0000ff00
!	Mem[0000000010101430] = 9a421fd7 000000ff 000000ff 9ca1ff10
	ldda	[%i4]ASI_BLK_AIUP,%f0	! Block Load from 0000000010101400
!	Mem[00000000211c0000] = ff0058bc, %l6 = ffffffffff1f429a
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffff00
!	Mem[0000000030001410] = ff0000ff, %l5 = 000000000000ffeb
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041434] = 0000006d, %l0 = 00000000ff0000ff
	lduba	[%i1+0x035]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = ffffffffffffff00, %f28 = ffb86b5e 000000ff
	ldda	[%i6+%o5]0x88,%f28	! %f28 = ffffffff ffffff00
!	Mem[0000000021800080] = ffff2e44, %l7 = 0000000000000000
	lduba	[%o3+0x081]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041418] = 00000000, %l2 = 00000000, %l5 = 000000ff
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 0000000000000000

p0_label_462:
!	Mem[0000000010081400] = 000000ff, %l6 = ffffffffffffff00
	swapa	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030041410] = 000000ff 00ff0000
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 00000000
!	%f28 = ffffffff ffffff00, Mem[0000000030001408] = ff0000ff ff00ff00
	stda	%f28,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff ffffff00
!	Mem[0000000030141400] = 00000000, %l7 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 000000ff, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000021800081] = ffff2e44, %l7 = 00000000000000ff
	ldstub	[%o3+0x081],%l7		! %l7 = 000000ff000000ff
!	Mem[0000000020800040] = 00ff4bbb, %l3 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l3	! %l3 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000030141408] = 000000ff 00000000
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff 000000ff
!	%f19 = 000000ff, Mem[0000000030101408] = 00000000
	sta	%f19,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041428] = ffff4f4e, %l2 = 0000000000000000
	ldsh	[%i1+0x028],%l2		! %l2 = ffffffffffffffff

p0_label_463:
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800040] = ffffc626, %l2 = ffffffffffffffff
	ldsh	[%o3+0x040],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010081410] = ffffffff, %l3 = 0000000000000000
	ldsha	[%i2+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101408] = ff000000, %l6 = 00000000000000ff
	lduba	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 00ffffff, %l7 = 00000000000000ff
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = 000000ff000080ff, %f22 = 6a13e734 e923210d
	ldda	[%i5+%o5]0x88,%f22	! %f22 = 000000ff 000080ff
!	Mem[0000000010181410] = 00ffffffffffffff, %f28 = ffffffff ffffff00
	ldd	[%i6+%o5],%f28		! %f28 = 00ffffff ffffffff
!	Mem[0000000010081400] = 00ffffff, %f25 = ffffffff
	lda	[%i2+%g0]0x80,%f25	! %f25 = 00ffffff
!	Mem[0000000010081428] = ff0000000000ff00, %l7 = 00000000000000ff
	ldx	[%i2+0x028],%l7		! %l7 = ff0000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010141430] = 0000000000000000, %l4 = 00000000000000ff, %l1 = ffffffffffffffff
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l4,%l1	! %l1 = 0000000000000000

p0_label_464:
!	Mem[000000001010143c] = 9ca1ff10, %l7 = ff0000000000ff00
	swap	[%i4+0x03c],%l7		! %l7 = 000000009ca1ff10
!	%f26 = ff000000 0000ff00, Mem[0000000010181400] = d71f42ff ff000000
	stda	%f26,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000000 0000ff00
!	%f24 = ffb86b5e 00ffffff, Mem[0000000030081400] = 00000000 ffffff00
	stda	%f24,[%i2+%g0]0x81	! Mem[0000000030081400] = ffb86b5e 00ffffff
!	Mem[0000000010081430] = 00000000, %l4 = 000000ff, %l3 = ffffffff
	add	%i2,0x30,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030041400] = 0000ffeb
	stba	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000ff00
!	%f24 = ffb86b5e 00ffffff, Mem[0000000010141400] = ff000000 00000000
	stda	%f24,[%i5+%g0]0x80	! Mem[0000000010141400] = ffb86b5e 00ffffff
!	Mem[0000000010081400] = 00ffffff, %l5 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c140c] = ebff0000, %l7 = 000000009ca1ff10, %asi = 80
	swapa	[%i3+0x00c]%asi,%l7	! %l7 = 00000000ebff0000
!	Mem[00000000201c0001] = ff000847, %l4 = 00000000000000ff
	ldstub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000ebff0000
	lduwa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000

p0_label_465:
!	Mem[0000000010041408] = ebff0000, %l4 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l4	! %l4 = ffffffffebff0000
!	Mem[00000000300c1410] = 5e6bb8ff, %l5 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001410] = ffffffff00000000, %f20 = ffffffff ebbbffff
	ldda	[%i0+%o5]0x80,%f20	! %f20 = ffffffff 00000000
!	Mem[0000000010141438] = ff0000000000ff00, %l4 = ffffffffebff0000
	ldxa	[%i5+0x038]%asi,%l4	! %l4 = ff0000000000ff00
!	Mem[0000000030041400] = 00ff0000, %l0 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l0	! %l0 = 0000000000ff0000
!	Mem[0000000030001400] = 000000ff, %l2 = ffffffffffffffff
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l2 = 00000000000000ff
	lduwa	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181428] = 00000000 4e4f5dff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+0x028]%asi,%l2	! %l2 = 0000000000000000 000000004e4f5dff
!	Mem[0000000010081400] = ffffffff, %l6 = 0000000000000000
	lduha	[%i2+%g0]0x80,%l6	! %l6 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l3 = 000000004e4f5dff, Mem[0000000030181400] = 00000000000080ff
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000004e4f5dff

p0_label_466:
!	%l5 = 00000000000000ff, Mem[0000000030101408] = 000000ff
	stha	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 00ff00ff
!	Mem[0000000010041410] = 00000000, %l4 = ff0000000000ff00
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%f29 = ffffffff, Mem[0000000010081408] = ff000000
	sta	%f29,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff
!	Mem[0000000030001408] = ffffffff, %l3 = 000000004e4f5dff
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 00000000ffffffff
!	%l1 = 0000000000000000, Mem[00000000201c0001] = ffff0847, %asi = 80
	stba	%l1,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff000847
!	Mem[0000000010081438] = ffff0000000000ff, %l3 = 00000000ffffffff, %l2 = 0000000000000000
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = ffff0000000000ff
!	Mem[0000000030101400] = 00ff0000, %l7 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l7	! %l7 = 0000000000ff0000
	membar	#Sync			! Added by membar checker (91)
!	%f14 = 000000ff 9ca1ff10, Mem[0000000010101400] = ff000000 00000000
	stda	%f14,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff 9ca1ff10
!	%l2 = 000000ff, %l3 = ffffffff, Mem[00000000100c1408] = 00000000 10ffa19c
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffffffff, %l7 = 0000000000ff0000
	lduba	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ff

p0_label_467:
!	Mem[0000000030001408] = 4e4f5dff, %l7 = 00000000000000ff
	ldsha	[%i0+%o4]0x81,%l7	! %l7 = 0000000000004e4f
!	Mem[0000000010001400] = 00000000ffffffff, %l7 = 0000000000004e4f
	ldx	[%i0+%g0],%l7		! %l7 = 00000000ffffffff
!	Mem[0000000010081408] = ffffffff, %f6  = ff00ffff
	lda	[%i2+%o4]0x88,%f6 	! %f6 = ffffffff
!	%l7 = 00000000ffffffff, Mem[0000000010141430] = 0000000000000000
	stx	%l7,[%i5+0x030]		! Mem[0000000010141430] = 00000000ffffffff
!	Mem[0000000030001408] = 4e4f5dff, %l0 = 0000000000ff0000
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 0000000000004e4f
!	Mem[0000000030101410] = 00000000000000ff, %f14 = 000000ff 9ca1ff10
	ldda	[%i4+%o5]0x81,%f14	! %f14 = 00000000 000000ff
!	Mem[00000000201c0000] = ff000847, %l4 = 0000000000000000
	ldub	[%o0+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l6 = 000000000000ffff
	ldub	[%i3+%o5],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001408] = ff000000000000ff, %f22 = 000000ff 000080ff
	ldda	[%i0+%o4]0x88,%f22	! %f22 = ff000000 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 0000ff00, %l2 = ffff0000000000ff
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 000000000000ff00

p0_label_468:
!	%l5 = 00000000000000ff, Mem[00000000100c1400] = 00000000
	stwa	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	Mem[0000000010001400] = 00000000, %l5 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081404] = 00000000, %l7 = 00000000ffffffff, %asi = 80
	swapa	[%i2+0x004]%asi,%l7	! %l7 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000010001400] = ff000000
	sth	%l4,[%i0+%g0]		! Mem[0000000010001400] = 00ff0000
!	%l5 = 0000000000000000, Mem[0000000010041400] = ff000000
	stha	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000
!	Mem[0000000010041414] = acef4ef8, %l3 = 00000000ffffffff
	ldstuba	[%i1+0x014]%asi,%l3	! %l3 = 000000ac000000ff
!	Mem[0000000030001410] = ff0000ff, %l4 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%f20 = ffffffff 00000000, %l6 = 0000000000000000
!	Mem[0000000030001420] = ffb86b5eda6dd733
	add	%i0,0x020,%g1
	stda	%f20,[%g1+%l6]ASI_PST8_S ! Mem[0000000030001420] = ffb86b5eda6dd733
!	%l6 = 0000000000000000, Mem[0000000010181438] = 000000ff00000010
	stx	%l6,[%i6+0x038]		! Mem[0000000010181438] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c143c] = 8700c6cd, %l3 = 00000000000000ac
	ldsw	[%i3+0x03c],%l3		! %l3 = ffffffff8700c6cd

p0_label_469:
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = ff0000ff, %l5 = 0000000000000000
	lduba	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l0 = 0000000000004e4f
	lduw	[%i4+%o5],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141408] = ff000000ff0000ff, %f12 = 9a421fd7 000000ff
	ldda	[%i5+%o4]0x88,%f12	! %f12 = ff000000 ff0000ff
!	Mem[0000000030101400] = 00000000, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800000] = ffff951b, %l1 = 0000000000000000
	lduba	[%o3+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = ff000000, %l6 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081410] = ffffffff, %l5 = 00000000000000ff
	ldsh	[%i2+%o5],%l5		! %l5 = ffffffffffffffff
!	Mem[000000001000140c] = 000000ff, %l1 = 00000000000000ff
	lduha	[%i0+0x00e]%asi,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = ffffffff8700c6cd, Mem[0000000010041400] = ff000000
	stba	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = ff0000cd

p0_label_470:
!	%f24 = ffb86b5e 00ffffff, Mem[0000000010081410] = ffffffff 000000ff
	stda	%f24,[%i2+%o5]0x88	! Mem[0000000010081410] = ffb86b5e 00ffffff
!	%f30 = 00000000, Mem[0000000010041400] = ff0000cd
	sta	%f30,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Mem[0000000010081400] = ffffffff, %l6 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030001400] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010081414] = 5e6bb8ff, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x014]%asi,%l6	! %l6 = 000000005e6bb8ff
!	%f27 = 0000ff00, Mem[0000000010041410] = 000000ff
	sta	%f27,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000ff00
!	Mem[0000000030181400] = 00000000, %l6 = 000000005e6bb8ff
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010001410] = 00000000ffffffff
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = ff84809b, %l1 = 00000000000000ff
	ldsha	[%o3+0x180]%asi,%l1	! %l1 = ffffffffffffff84

p0_label_471:
!	Mem[0000000010001410] = 00000000, %l3 = ffffffff8700c6cd
	ldsha	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %l5 = ffffffffffffffff
	ldsha	[%i3+%g0]0x80,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010081420] = ffb86b5e, %l4 = 0000000000000000
	ldsha	[%i2+0x020]%asi,%l4	! %l4 = ffffffffffffffb8
!	Mem[0000000010101430] = 9a421fd7, %f27 = 0000ff00
	ld	[%i4+0x030],%f27	! %f27 = 9a421fd7
!	Mem[0000000010141408] = ff0000ff000000ff, %l4 = ffffffffffffffb8
	ldxa	[%i5+%o4]0x80,%l4	! %l4 = ff0000ff000000ff
!	Mem[0000000030141408] = ff000000, %f25 = 00ffffff
	lda	[%i5+%o4]0x81,%f25	! %f25 = ff000000
!	Mem[0000000010181418] = 00ff0000, %l1 = ffffffffffffff84
	ldswa	[%i6+0x018]%asi,%l1	! %l1 = 0000000000ff0000
!	Mem[0000000010141410] = 000080ff, %l6 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l6	! %l6 = 00000000000080ff
!	Mem[0000000030001410] = ff0000ff, %l5 = ffffffffffffff00
	ldsha	[%i0+%o5]0x81,%l5	! %l5 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010041408] = ebff0000ffffff00
	stxa	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000000

p0_label_472:
!	Mem[0000000020800000] = 0000261d, %l4 = ff0000ff000000ff
	ldstub	[%o1+%g0],%l4		! %l4 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[00000000100c1410] = 0d2123e900000000
	stxa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000000
!	%l0 = 0000000000000000, Mem[00000000218000c0] = ff45f510, %asi = 80
	stba	%l0,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 0045f510
!	%l3 = 0000000000000000, Mem[00000000218000c0] = 0045f510, %asi = 80
	stba	%l3,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 0045f510
!	%f15 = 000000ff, Mem[000000001000142c] = ff000000
	st	%f15,[%i0+0x02c]	! Mem[000000001000142c] = 000000ff
!	%f26 = ff000000, Mem[0000000010101418] = ff00ffff
	st	%f26,[%i4+0x018]	! Mem[0000000010101418] = ff000000
!	Mem[000000001008141c] = e923210d, %l5 = ffffffffffffff00, %asi = 80
	swapa	[%i2+0x01c]%asi,%l5	! %l5 = 00000000e923210d
!	Mem[0000000010101408] = 00ff0000, %l7 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1408] = ffffffff, %l1 = 0000000000ff0000
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff000000ff000000, %f14 = 00000000 000000ff
	ldda	[%i5+%o4]0x81,%f14	! %f14 = ff000000 ff000000

p0_label_473:
!	Mem[0000000010141408] = ff0000ff, %l2 = 000000000000ff00
	lduha	[%i5+%o4]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030081410] = ff00000000000000, %l7 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l7	! %l7 = ff00000000000000
!	Mem[000000001014142c] = 000000b8, %f5  = ff000000
	ld	[%i5+0x02c],%f5 	! %f5 = 000000b8
!	Mem[0000000010001400] = 0000ff00, %f2  = 0000ff00
	lda	[%i0+%g0]0x88,%f2 	! %f2 = 0000ff00
!	Mem[0000000030001408] = ff5d4f4e, %f9  = 00000000
	lda	[%i0+%o4]0x89,%f9 	! %f9 = ff5d4f4e
!	Mem[00000000100c1424] = 00000042, %l4 = 0000000000000000
	lduba	[%i3+0x025]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041404] = ffffffff, %f31 = 000000ff
	ld	[%i1+0x004],%f31	! %f31 = ffffffff
!	Mem[0000000030081408] = ff000000 00000000, %l4 = 00000000, %l5 = e923210d
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000010141410] = 000000ff 000080ff, %l4 = ff000000, %l5 = 00000000
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 00000000000080ff 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff

p0_label_474:
!	Mem[0000000010001410] = 00000000, %l1 = 00000000ffffffff
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f16 = ff000000 00000000, %l5 = 0000000000000000
!	Mem[0000000010041418] = 000000ff0000ff00
	add	%i1,0x018,%g1
	stda	%f16,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010041418] = 000000ff0000ff00
!	Mem[0000000030001410] = ff0000ff, %l6 = 00000000000080ff
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000010041420] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i1+0x020]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000300c1400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181400] = ff000000, %l6 = 00000000ff0000ff
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010101426] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i4+0x026]%asi,%l0	! %l0 = 00000000000000ff
!	%l7 = ff00000000000000, Mem[00000000300c1410] = ff0000005e6bb8ff
	stxa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff00000000000000
!	%f14 = ff000000 ff000000, Mem[0000000030101410] = 000000ff ff000000
	stda	%f14,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000 ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i1+0x002]%asi,%l3	! %l3 = 0000000000000000

p0_label_475:
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = 000000ff000000ff, %f30 = 00000000 ffffffff
	ldda	[%i5+%o4]0x89,%f30	! %f30 = 000000ff 000000ff
!	Mem[00000000211c0000] = ff0058bc, %l5 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010181408] = ffffff00, %l1 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010001430] = 00003b3d 00000000, %l2 = 0000ff00, %l3 = 00000000
	ldd	[%i0+0x030],%l2		! %l2 = 0000000000003b3d 0000000000000000
!	Mem[0000000030141410] = ffffffff, %l6 = 00000000000000ff
	ldswa	[%i5+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = ff00000000000000, %f22 = ff000000 000000ff
	ldda	[%i0+%g0]0x81,%f22	! %f22 = ff000000 00000000
!	Mem[00000000201c0000] = ff000847, %l4 = 00000000000080ff
	ldsh	[%o0+%g0],%l4		! %l4 = ffffffffffffff00
!	Mem[0000000030081400] = 5e6bb8ff, %l0 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l0	! %l0 = 000000005e6bb8ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141401] = ffb86b5e, %l0 = 000000005e6bb8ff
	ldstub	[%i5+0x001],%l0		! %l0 = 000000b8000000ff

p0_label_476:
!	%f0  = ff000000 00000000, %l2 = 0000000000003b3d
!	Mem[0000000010081400] = ffffffffffffffff
	stda	%f0,[%i2+%l2]ASI_PST16_PL ! Mem[0000000010081400] = 0000ffff000000ff
!	Mem[00000000300c1408] = 00ff0000, %l4 = ffffffffffffff00
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000ff0000
!	%f13 = ff0000ff, Mem[0000000030081400] = ffb86b5e
	sta	%f13,[%i2+%g0]0x81	! Mem[0000000030081400] = ff0000ff
!	Mem[0000000030181400] = 000000ff, %l0 = 00000000000000b8
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%f5  = 000000b8, Mem[0000000010141410] = 000080ff
	sta	%f5 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000b8
!	%f9  = ff5d4f4e, Mem[0000000010141400] = 5e6bffff
	sta	%f9 ,[%i5+%g0]0x88	! Mem[0000000010141400] = ff5d4f4e
!	Mem[0000000010101434] = 000000ff, %l4 = 0000000000ff0000
	swap	[%i4+0x034],%l4		! %l4 = 00000000000000ff
!	%l2 = 00003b3d, %l3 = 00000000, Mem[0000000010081410] = ffffff00 000000ff
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00003b3d 00000000
!	Mem[0000000010141418] = 5e6bb8ff0000b8ff, %l3 = 0000000000000000, %l3 = 0000000000000000
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = 5e6bb8ff0000b8ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff0000ff, %l4 = 00000000000000ff
	lduba	[%i5+%o4]0x80,%l4	! %l4 = 00000000000000ff

p0_label_477:
!	Mem[0000000010041400] = 00000000, %l7 = ff00000000000000
	ldsw	[%i1+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010181408] = 00ffffff, %f15 = ff000000
	lda	[%i6+%o4]0x80,%f15	! %f15 = 00ffffff
!	Mem[0000000030001410] = ff800000, %l4 = 00000000000000ff
	lduba	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = 00ff00ff00001fd7, %l2 = 0000000000003b3d
	ldxa	[%i4+%o4]0x81,%l2	! %l2 = 00ff00ff00001fd7
!	Mem[0000000010181408] = 00ffffff, %l3 = 5e6bb8ff0000b8ff
	ldsha	[%i6+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = ff000000000000ff, %f6  = ffffffff 00000000
	ldda	[%i6+%g0]0x88,%f6 	! %f6  = ff000000 000000ff
!	Mem[0000000030181410] = ff1f429a 00000000, %l2 = 00001fd7, %l3 = 000000ff
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff1f429a 0000000000000000
!	Mem[0000000030181410] = 9a421fff, %f8  = ffb86b5e
	lda	[%i6+%o5]0x89,%f8 	! %f8 = 9a421fff
!	Mem[0000000010101400] = 10ffa19cff000000, %l4 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l4	! %l4 = 10ffa19cff000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[00000000211c0000] = ff0058bc
	stb	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 000058bc

p0_label_478:
!	%f5  = 000000b8, Mem[0000000010101408] = ff00ff00
	sta	%f5 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000b8
!	Mem[00000000300c1408] = ffffff00, %l5 = ffffffffffffff00
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 00000000ffffff00
!	%l0 = 00000000000000ff, Mem[00000000100c1410] = 00000000
	stba	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000
!	%f19 = 000000ff, Mem[0000000010181400] = 000000ff
	sta	%f19,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	%l2 = 00000000ff1f429a, Mem[0000000030001400] = ff000000
	stba	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 9a000000
!	%l4 = 10ffa19cff000000, Mem[0000000030081410] = ff00000000000000
	stxa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 10ffa19cff000000
!	%l1 = ffffffffffffff00, Mem[00000000300c1400] = b7d6f9fb000000ff
	stxa	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffffffffff00
!	%l2 = 00000000ff1f429a, Mem[0000000010141400] = ffffff00ff5d4f4e
	stxa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000ff1f429a
!	Mem[0000000030141410] = ffffffffff000000, %f18 = ff421fd7 000000ff
	ldda	[%i5+%o5]0x81,%f18	! %f18 = ffffffff ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff00261d, %l7 = 0000000000000000
	ldsb	[%o1+0x001],%l7		! %l7 = 0000000000000000

p0_label_479:
!	Mem[0000000030001410] = 000080ff, %l0 = 00000000000000ff
	ldsha	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041430] = 00ff0000, %l2 = 00000000ff1f429a
	ldub	[%i1+0x031],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030141400] = ff000000, %l4 = 10ffa19cff000000
	lduwa	[%i5+%g0]0x89,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010101408] = 000000b8, %l2 = 00000000000000ff
	lduwa	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000b8
!	Mem[0000000010181400] = 000000ff, %l7 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081400] = 0000ffff, %l0 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030181400] = 000000b8, %l4 = 00000000ff000000
	ldsha	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000b8
!	Mem[0000000030001410] = 000080ff, %l2 = 00000000000000b8
	lduha	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = 0000ff00, %l6 = ffffffffffffffff
	lduwa	[%i0+%g0]0x88,%l6	! %l6 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000ffff, Mem[0000000010081400] = 0000ffff000000ff
	stxa	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000000000ffff

p0_label_480:
!	%f24 = ffb86b5e ff000000, Mem[0000000010141430] = 00000000 ffffffff
	std	%f24,[%i5+0x030]	! Mem[0000000010141430] = ffb86b5e ff000000
!	Mem[00000000100c1408] = ff000000, %l1 = ffffffffffffff00
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	%f16 = ff000000, Mem[0000000030041408] = 00000000
	sta	%f16,[%i1+%o4]0x89	! Mem[0000000030041408] = ff000000
!	%l4 = 00000000000000b8, Mem[0000000010001400] = 0000ff00
	stha	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000b8
!	%f22 = ff000000 00000000, %l5 = 00000000ffffff00
!	Mem[0000000010001428] = 00000000000000ff
	add	%i0,0x028,%g1
	stda	%f22,[%g1+%l5]ASI_PST8_P ! Mem[0000000010001428] = 00000000000000ff
!	%l5 = 00000000ffffff00, Mem[0000000030001410] = 000080ff00000000
	stxa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000ffffff00
!	%l6 = 000000000000ff00, Mem[00000000300c1410] = 00000000
	stwa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000ff00
!	Mem[0000000010001410] = ff000000, %l4 = 00000000000000b8
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030081410] = 9ca1ff10, %l7 = 00000000000000ff
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 00000010000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000ff, %l4 = 00000000ff000000
	ldsha	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000

p0_label_481:
!	Mem[0000000030181400] = 000000b8, %l6 = 000000000000ff00
	lduba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000b8
!	Mem[0000000010141408] = ff0000ff, %l2 = 0000000000000000
	ldsb	[%i5+0x00b],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000, %l7 = 0000000000000010
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101414] = ff000000, %l5 = 00000000ffffff00
	ldsha	[%i4+0x016]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %l7 = 0000000000000000
	lduba	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 00003b3d, %l7 = 0000000000000000
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %f22 = ff000000
	lda	[%i4+%o5]0x88,%f22	! %f22 = 000000ff
!	Mem[0000000010081400] = 00000000, %l2 = ffffffffffffffff
	ldsba	[%i2+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = ffffffff, %l5 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 0000ff00, %l2 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_482:
!	%f28 = 00ffffff ffffffff, %l1 = 00000000000000ff
!	Mem[0000000010181408] = 00ffffff0000ffeb
	add	%i6,0x008,%g1
	stda	%f28,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010181408] = ffffffffffffff00
!	%l7 = 0000000000000000, Mem[0000000010081408] = ffffffff
	stha	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000ffff
!	Mem[0000000010101410] = ff000000, %l0 = 000000000000ffff
	swap	[%i4+%o5],%l0		! %l0 = 00000000ff000000
!	%l3 = 0000000000000000, Mem[00000000100c1413] = ff000000, %asi = 80
	stba	%l3,[%i3+0x013]%asi	! Mem[00000000100c1410] = ff000000
!	Mem[0000000010001400] = b8000000, %l7 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 000000b8000000ff
!	Mem[0000000030141408] = ff000000, %l5 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030041408] = ff000000, %l7 = 00000000000000b8
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 00000000ff000000
!	Mem[000000001004143c] = ff000000, %l6 = 00000000000000b8
	swap	[%i1+0x03c],%l6		! %l6 = 00000000ff000000
!	%l0 = 00000000ff000000, Mem[0000000030141410] = 000000ffffffffff
	stxa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000ff, %l0 = 00000000ff000000
	lduba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_483:
!	Mem[0000000010041400] = 00000000, %f12 = ff000000
	ld	[%i1+%g0],%f12	! %f12 = 00000000
!	Mem[0000000010001408] = ff000000, %l1 = 00000000000000ff
	lduwa	[%i0+%o4]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030041410] = 00000000, %l1 = 00000000ff000000
	lduba	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800080] = ffff2e44, %l5 = 00000000000000ff
	lduba	[%o3+0x081]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 0000ff00, %l7 = 00000000ff000000
	ldswa	[%i3+%o5]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010181408] = ffffffff, %l5 = 00000000000000ff
	lduwa	[%i6+%o4]0x80,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000030101400] = 00000000, %l7 = 000000000000ff00
	ldsba	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = ff000000, %f16 = ff000000
	lda	[%i2+%o4]0x81,%f16	! %f16 = ff000000
!	Mem[0000000010001400] = 000000ff, %l0 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000021800180] = ff84809b, %l0 = 00000000000000ff
	ldsba	[%o3+0x181]%asi,%l0	! %l0 = ffffffffffffff84

p0_label_484:
!	Mem[0000000010101408] = b8000000, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000b8000000
!	%l3 = 0000000000000000, Mem[0000000010101410] = 0000ffff
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%f20 = ffffffff 00000000, Mem[00000000100c1400] = 000000ff ffffffff
	stda	%f20,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff 00000000
!	%l1 = 0000000000000000, Mem[0000000010001416] = 00000000, %asi = 80
	stha	%l1,[%i0+0x016]%asi	! Mem[0000000010001414] = 00000000
!	%l6 = ff000000, %l7 = 00000000, Mem[0000000010041408] = 00000000 00000000
	stda	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000 00000000
!	%l7 = 0000000000000000, Mem[0000000030141410] = ff000000
	stha	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000000
!	%f18 = ffffffff ff000000, Mem[0000000010181410] = 00ffffff ffffffff
	stda	%f18,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffff ff000000
!	%f9  = ff5d4f4e, Mem[0000000030181410] = ff1f429a
	sta	%f9 ,[%i6+%o5]0x81	! Mem[0000000030181410] = ff5d4f4e
!	%l4 = 00000000b8000000, Mem[0000000030081400] = ff0000ff
	stwa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = b8000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffffffff, %l5 = 00000000ffffffff
	ldsha	[%i6+%o5]0x88,%l5	! %l5 = ffffffffffffffff

p0_label_485:
!	Mem[0000000030041400] = ffff0000ffffff00, %f4  = 00000000 000000b8
	ldda	[%i1+%g0]0x81,%f4 	! %f4  = ffff0000 ffffff00
!	Mem[0000000030041408] = b8000000 d71f429a, %l4 = b8000000, %l5 = ffffffff
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 00000000b8000000 00000000d71f429a
!	Mem[0000000030081408] = ff000000, %l1 = 0000000000000000
	lduba	[%i2+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041400] = ffff0000, %l4 = 00000000b8000000
	lduha	[%i1+%g0]0x81,%l4	! %l4 = 000000000000ffff
!	%f12 = 00000000, %f2  = 0000ff00, %f29 = ffffffff
	fmuls	%f12,%f2 ,%f29		! %f29 = 00000000
!	Mem[00000000100c1400] = 00000000, %l4 = 000000000000ffff
	ldswa	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = ff000000000000ff, %l1 = 00000000000000ff
	ldx	[%i0+%o4],%l1		! %l1 = ff000000000000ff
!	Mem[0000000010101434] = 00ff0000, %l2 = 0000000000000000
	ldsba	[%i4+0x035]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081410] = 000000ff9ca1ffff, %l6 = 00000000ff000000
	ldxa	[%i2+%o5]0x89,%l6	! %l6 = 000000ff9ca1ffff
!	Starting 10 instruction Store Burst
!	%f6  = ff000000 000000ff, %l4 = 0000000000000000
!	Mem[0000000010081410] = 00003b3d00000000
	add	%i2,0x010,%g1
	stda	%f6,[%g1+%l4]ASI_PST32_P ! Mem[0000000010081410] = 00003b3d00000000

p0_label_486:
!	%l6 = 000000ff9ca1ffff, Mem[00000000218001c1] = ff42a805
	stb	%l6,[%o3+0x1c1]		! Mem[00000000218001c0] = ffffa805
!	Mem[0000000010041400] = 00000000, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = ff000000, %l1 = ff000000000000ff
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%f22 = 000000ff, Mem[0000000030181410] = 4e4f5dff
	sta	%f22,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	Mem[0000000010181432] = 6d000000, %l1 = 0000000000000000
	ldstub	[%i6+0x032],%l1		! %l1 = 00000000000000ff
!	%f18 = ffffffff, %f6  = ff000000
	fsqrts	%f18,%f6 		! %f6  = ffffffff
!	%l1 = 0000000000000000, Mem[0000000030141408] = 000000ff
	stwa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%l4 = 0000000000000000, Mem[0000000030001408] = ff5d4f4e
	stwa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Mem[0000000030041400] = 0000ffff, %l0 = ffffffffffffff84
	swapa	[%i1+%g0]0x89,%l0	! %l0 = 000000000000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000ff 9ca1ff10, %l4 = 00000000, %l5 = d71f429a
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 00000000000000ff 000000009ca1ff10

p0_label_487:
!	Mem[0000000030001408] = 00000000, %l0 = 000000000000ffff
	ldsba	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l1 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = 000000b8, %l6 = 000000ff9ca1ffff
	lduba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000b8
!	Mem[0000000010141400] = ff1f429a, %l6 = 00000000000000b8
	lduha	[%i5+%g0]0x88,%l6	! %l6 = 000000000000429a
!	Mem[0000000020800040] = ffff4bbb, %l2 = ffffffffffffffff
	ldsh	[%o1+0x040],%l2		! %l2 = ffffffffffffffff
!	Mem[00000000211c0000] = 000058bc, %l3 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = ff0000ff, %l7 = 0000000000000000
	lduh	[%i5+0x00a],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030141408] = 00000000, %l0 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = 00003b3d, %l3 = 0000000000000000
	lduha	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f22 = 000000ff 00000000, Mem[0000000010081410] = 3d3b0000 00000000
	stda	%f22,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff 00000000

p0_label_488:
!	%l5 = 000000009ca1ff10, Mem[0000000030041408] = b8000000
	stha	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = ff100000
!	%l5 = 000000009ca1ff10, Mem[00000000211c0000] = 000058bc, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff1058bc
!	%f10 = ff000000 0000ff00, Mem[0000000010041408] = 000000ff 00000000
	stda	%f10,[%i1+%o4]0x88	! Mem[0000000010041408] = ff000000 0000ff00
!	%l1 = 0000000000000000, Mem[000000001004141a] = 000000ff, %asi = 80
	stba	%l1,[%i1+0x01a]%asi	! Mem[0000000010041418] = 000000ff
!	%l0 = 0000000000000000, Mem[0000000030101400] = 00000000
	stwa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%f26 = ff000000 9a421fd7, %l0 = 0000000000000000
!	Mem[0000000030001430] = ff0000008900ff00
	add	%i0,0x030,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_S ! Mem[0000000030001430] = ff0000008900ff00
!	%f12 = 00000000 ff0000ff, Mem[0000000030141410] = 000000ff 00000000
	stda	%f12,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 ff0000ff
!	%f28 = 00ffffff 00000000, Mem[0000000030001400] = 0000009a 00000000
	stda	%f28,[%i0+%g0]0x89	! Mem[0000000030001400] = 00ffffff 00000000
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000030001410] = 00000000 ffffff00
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 000000ff, %l3 = 0000000000000000
	lduba	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff

p0_label_489:
!	Mem[0000000010081410] = 00000000, %l0 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = 000000ff, %l3 = 00000000000000ff
	lduwa	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041408] = 0000ff00, %l1 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030141400] = ff000000, %l4 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = ffffff00, %f29 = 00000000
	lda	[%i3+%o4]0x81,%f29	! %f29 = ffffff00
!	Mem[00000000100c1400] = 00000000, %l2 = ffffffffffffffff
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = ff1058bc, %l3 = 00000000000000ff
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000ff10
!	Mem[0000000030181400] = b8000000, %l2 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l2	! %l2 = 000000000000b800
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00000000, %l5 = 000000009ca1ff10
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_490:
!	Mem[0000000010101408] = 00000000, %l7 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 00ff0000
	stha	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00ff0000
!	%l1 = ffffffffffffff00, Mem[0000000030101400] = 00000000
	stba	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%f25 = ff000000, Mem[0000000030041410] = 00000000
	sta	%f25,[%i1+%o5]0x89	! Mem[0000000030041410] = ff000000
!	Mem[0000000010141400] = ff1f429a, %l5 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l5	! %l5 = 00000000ff1f429a
!	Mem[00000000300c1408] = ffffff00, %l2 = 000000000000b800
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	%f2  = 0000ff00 ff0000ff, Mem[0000000010141408] = ff0000ff ff000000
	stda	%f2 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000ff00 ff0000ff
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = ffff0000, %l1 = ffffffffffffff00
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 00000000ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 9a421fd7000010ff, %f8  = 9a421fff ff5d4f4e
	ldda	[%i1+%o4]0x89,%f8 	! %f8  = 9a421fd7 000010ff

p0_label_491:
!	Mem[00000000100c1410] = ff000000, %l0 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[00000000300c1408] = ffffff00, %f18 = ffffffff
	lda	[%i3+%o4]0x81,%f18	! %f18 = ffffff00
!	Mem[0000000030181400] = b8000000 4e4f5dff, %l6 = 0000429a, %l7 = 00000000
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 00000000b8000000 000000004e4f5dff
!	Mem[00000000100c1408] = ff000000, %l7 = 000000004e4f5dff
	ldsba	[%i3+0x00b]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081418] = 6a13e734ffffff00, %l7 = 0000000000000000
	ldxa	[%i2+0x018]%asi,%l7	! %l7 = 6a13e734ffffff00
!	Mem[0000000010101410] = 00000000, %l2 = 00000000000000ff
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 0000ff00, %l3 = 000000000000ff10
	lduwa	[%i3+%o5]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010081400] = 00000000, %l5 = 00000000ff1f429a
	lduw	[%i2+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l6 = 00000000b8000000
	ldswa	[%i1+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 000000ff, %l4 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff

p0_label_492:
!	%l1 = 00000000ffff0000, Mem[0000000030041400] = 84ffffff
	stwa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = ffff0000
!	Mem[0000000010001430] = 00003b3d, %l0 = 00000000ff000000
	swap	[%i0+0x030],%l0		! %l0 = 0000000000003b3d
!	%l3 = 000000000000ff00, Mem[0000000030001408] = ff000000
	stwa	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000ff00
!	Mem[0000000010001400] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	%f0  = ff000000 00000000 0000ff00 ff0000ff
!	%f4  = ffff0000 ffffff00 ffffffff 000000ff
!	%f8  = 9a421fd7 000010ff ff000000 0000ff00
!	%f12 = 00000000 ff0000ff ff000000 00ffffff
	stda	%f0,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400
!	%f20 = ffffffff 00000000, %l6 = 00000000000000ff
!	Mem[0000000030041438] = 000000ffffffffff
	add	%i1,0x038,%g1
	stda	%f20,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030041438] = 00000000ffffffff
!	Mem[0000000010181408] = ffffffff, %l0 = 0000000000003b3d
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 00000000ffffffff
!	%f26 = ff000000 9a421fd7, %l6 = 00000000000000ff
!	Mem[0000000030081430] = ff0000ff00000000
	add	%i2,0x030,%g1
	stda	%f26,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030081430] = d71f429a000000ff
!	%f22 = 000000ff, Mem[0000000010081400] = 00000000
	st	%f22,[%i2+%g0]		! Mem[0000000010081400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 00000000000000ff

p0_label_493:
!	Mem[0000000010101404] = 9ca1ff10, %l1 = 00000000ffff0000
	lduha	[%i4+0x004]%asi,%l1	! %l1 = 0000000000009ca1
	membar	#Sync			! Added by membar checker (92)
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 00ffffff0000ffff, %f4  = ffff0000 ffffff00
	ldda	[%i2+%o5]0x81,%f4 	! %f4  = 00ffffff 0000ffff
!	Mem[0000000030001400] = 00000000, %l3 = 000000000000ff00
	ldsha	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141430] = ffb86b5e, %l3 = 0000000000000000
	ldsha	[%i5+0x030]%asi,%l3	! %l3 = ffffffffffffffb8
!	Mem[0000000010081408] = 00ffffff, %l0 = 00000000ffffffff
	lduha	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081408] = 00ffffff, %l3 = ffffffffffffffb8
	lduwa	[%i2+%o4]0x80,%l3	! %l3 = 0000000000ffffff
!	Mem[00000000100c1400] = ffffffff00000000, %l6 = 0000000000000000
	ldxa	[%i3+%g0]0x88,%l6	! %l6 = ffffffff00000000
!	Mem[0000000010041400] = 00000000 ffffffff 00ff0000 000000ff
!	Mem[0000000010041410] = 00ff0000 ffef4ef8 000000ff 0000ff00
!	Mem[0000000010041420] = ff000000 33d76dda ffff4f4e 00000000
!	Mem[0000000010041430] = 00ff0000 0000006d 10000000 000000b8
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010001434] = 00000000, %asi = 80
	stba	%l0,[%i0+0x034]%asi	! Mem[0000000010001434] = ff000000

p0_label_494:
!	%l0 = 00000000000000ff, Mem[0000000010141410] = 000000b8
	stba	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%f24 = ffb86b5e ff000000, Mem[0000000030181410] = 000000ff 00000000
	stda	%f24,[%i6+%o5]0x89	! Mem[0000000030181410] = ffb86b5e ff000000
!	%l5 = 00000000000000ff, Mem[0000000020800040] = ffff4bbb
	sth	%l5,[%o1+0x040]		! Mem[0000000020800040] = 00ff4bbb
!	Mem[0000000030081408] = ff0000ff, %l4 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%l6 = ffffffff00000000, Mem[0000000010081400] = ff000000
	stba	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000
!	%l2 = 0000000000000000, Mem[0000000010101410] = 00000000
	stha	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	Mem[0000000030101410] = ff0000ff, %l6 = ffffffff00000000
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[00000000300c1400] = ffffffffffffff00
	stxa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000000000ff
!	Mem[0000000010141400] = ff000000, %l1 = 0000000000009ca1
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000ff00000000, %l6 = 00000000000000ff
	ldxa	[%i5+%g0]0x81,%l6	! %l6 = 000000ff00000000

p0_label_495:
!	Mem[0000000010081410] = 00000000, %l3 = 0000000000ffffff
	lduha	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l7 = 6a13e734ffffff00
	ldswa	[%i2+0x010]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = 000000ff, %f16 = ff000000
	lda	[%i6+%o5]0x81,%f16	! %f16 = 000000ff
!	Mem[0000000030081408] = ff0000ff, %l1 = 00000000ff000000
	lduha	[%i2+%o4]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010101410] = 00000000, %l6 = 000000ff00000000
	ldsha	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 00ffffff, %f30 = 000000ff
	lda	[%i2+%o5]0x81,%f30	! %f30 = 00ffffff
!	Mem[0000000030181400] = ff5d4f4e000000b8, %l7 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l7	! %l7 = ff5d4f4e000000b8
!	Mem[0000000030141408] = 000000ff00000000, %f26 = ff000000 9a421fd7
	ldda	[%i5+%o4]0x89,%f26	! %f26 = 000000ff 00000000
!	Mem[0000000030041400] = 00ffffff 0000ffff, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 000000000000ffff 0000000000ffffff
!	Starting 10 instruction Store Burst
!	%f20 = ffffffff 00000000, %l1 = 000000000000ff00
!	Mem[0000000030041410] = 000000ff00000000
	add	%i1,0x010,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030041410] = 000000ff00000000

p0_label_496:
!	Mem[0000000010101410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l7 = ff5d4f4e000000b8, Mem[00000000218000c0] = 0045f510
	sth	%l7,[%o3+0x0c0]		! Mem[00000000218000c0] = 00b8f510
!	Mem[0000000010181424] = ffffebff, %l4 = 0000ffff, %l2 = 00000000
	add	%i6,0x24,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000ffffebff
!	Mem[0000000010041410] = 00ff0000, %l4 = 000000000000ffff
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l0 = 000000ff, %l1 = 0000ff00, Mem[0000000010001408] = ff000000 000000ff
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff 0000ff00
!	%l5 = 0000000000ffffff, Mem[0000000010141408] = ff0000ff
	stwa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 00ffffff
!	Mem[0000000010181408] = 00003b3d, %l5 = 0000000000ffffff
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000003b3d
!	Mem[0000000010141418] = 5e6bb8ff0000b8ff, %l7 = ff5d4f4e000000b8, %l0 = 00000000000000ff
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 5e6bb8ff0000b8ff
!	%l0 = 0000b8ff, %l1 = 0000ff00, Mem[0000000010101408] = 00000000 ff0000ff
	std	%l0,[%i4+%o4]		! Mem[0000000010101408] = 0000b8ff 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff000000 000000ff, %l4 = 00000000, %l5 = 00003b3d
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff 00000000ff000000

p0_label_497:
!	Mem[0000000010181418] = 00ff000000000000, %f26 = 000000ff 00000000
	ldda	[%i6+0x018]%asi,%f26	! %f26 = 00ff0000 00000000
!	Mem[00000000100c1410] = 000000ff, %l1 = 000000000000ff00
	ldsba	[%i3+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181400] = ff000000, %l7 = ff5d4f4e000000b8
	lduha	[%i6+%g0]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010001408] = 000000ff, %l2 = 00000000ffffebff
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141408] = 0000ff0000ffffff, %l5 = 00000000ff000000
	ldxa	[%i5+%o4]0x88,%l5	! %l5 = 0000ff0000ffffff
!	Mem[00000000201c0000] = ff000847, %l7 = 000000000000ff00
	ldsh	[%o0+%g0],%l7		! %l7 = ffffffffffffff00
!	Mem[0000000010041400] = ffffffff00000000, %l3 = 0000000000000000
	ldxa	[%i1+%g0]0x88,%l3	! %l3 = ffffffff00000000
!	Mem[0000000010101408] = ffb80000, %f8  = ff000000
	lda	[%i4+%o4]0x88,%f8 	! %f8 = ffb80000
!	Mem[0000000030081410] = 00ffffff, %l6 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l6	! %l6 = 0000000000ffffff
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 ffffffff 00ff0000 000000ff
!	%f4  = 00ff0000 ffef4ef8 000000ff 0000ff00
!	%f8  = ffb80000 33d76dda ffff4f4e 00000000
!	%f12 = 00ff0000 0000006d 10000000 000000b8
	stda	%f0,[%i4]ASI_BLK_P	! Block Store to 0000000010101400

p0_label_498:
!	Mem[0000000010081418] = 6a13e734, %l6 = 0000000000ffffff
	swap	[%i2+0x018],%l6		! %l6 = 000000006a13e734
!	%l2 = 000000ff, %l3 = 00000000, Mem[00000000300c1410] = 00ff0000 ff000000
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff 00000000
!	%l2 = 00000000000000ff, Mem[000000001008142a] = ff000000
	stb	%l2,[%i2+0x02a]		! Mem[0000000010081428] = ff00ff00
!	Mem[00000000300c1400] = 000000ff, %l3 = ffffffff00000000
	ldstuba	[%i3+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c1414] = 00000000, %l2 = 000000ff, %l7 = ffffff00
	add	%i3,0x14,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = ff000000, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 00000000ff000000
!	%l4 = 00000000000000ff, Mem[0000000010101410] = 0000ff00
	stba	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000ffff
!	Mem[0000000010001400] = ff000000, %l5 = 0000ff0000ffffff
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	Code Fragment 3
p0_fragment_16:
!	%l0 = 5e6bb8ff0000b8ff
	setx	0x2f9289c7be38dfc1,%g7,%l0 ! %l0 = 2f9289c7be38dfc1
!	%l1 = ffffffffffffffff
	setx	0x3793359828b2dc88,%g7,%l1 ! %l1 = 3793359828b2dc88
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2f9289c7be38dfc1
	setx	0xa8bf0710791cb3e0,%g7,%l0 ! %l0 = a8bf0710791cb3e0
!	%l1 = 3793359828b2dc88
	setx	0x8b3c28605f6fd35f,%g7,%l1 ! %l1 = 8b3c28605f6fd35f
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (93)
!	Mem[0000000010101400] = 00000000 ffffffff 00ff0000 000000ff
!	Mem[0000000010101410] = ffff0000 ffef4ef8 000000ff 0000ff00
!	Mem[0000000010101420] = ffb80000 33d76dda ffff4f4e 00000000
!	Mem[0000000010101430] = 00ff0000 0000006d 10000000 000000b8
	ldda	[%i4]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400

p0_label_499:
!	Mem[0000000030141408] = 00000000 ff000000, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000 00000000ff000000
!	Mem[0000000030181410] = 000000ff, %l7 = 00000000ff000000
	lduha	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l2 = 00000000000000ff
	lduba	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = d71f0000 ff00ff00, %l0 = 791cb3e0, %l1 = 5f6fd35f
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 00000000ff00ff00 00000000d71f0000
!	Mem[0000000030181400] = b80000004e4f5dff, %l2 = 0000000000000000
	ldxa	[%i6+%g0]0x81,%l2	! %l2 = b80000004e4f5dff
!	Mem[0000000010081438] = ffff0000, %l1 = 00000000d71f0000
	lduw	[%i2+0x038],%l1		! %l1 = 00000000ffff0000
!	Mem[0000000010141430] = ffb86b5e, %l4 = 0000000000000000
	ldsha	[%i5+0x032]%asi,%l4	! %l4 = 0000000000006b5e
!	Mem[0000000010081410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = ff000000ffffffff, %f4  = 00ff0000 ffef4ef8
	ldda	[%i0+%g0]0x80,%f4 	! %f4  = ff000000 ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = ff100000, %l1 = 00000000ffff0000
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 00000000ff100000

p0_label_500:
!	Mem[0000000010081408] = ffffff00, %l6 = 000000006a13e734
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c140c] = ffffffff, %l6 = 0000000000000000
	swap	[%i3+0x00c],%l6		! %l6 = 00000000ffffffff
!	%l7 = 0000000000000000, Mem[00000000211c0001] = ff1058bc
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = ff0058bc
!	Mem[0000000030081410] = ffffff00, %l6 = 00000000ffffffff
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 00000000ffffff00
!	%f4  = ff000000 ffffffff, Mem[0000000010081408] = ffffffff 00000000
	stda	%f4 ,[%i2+%o4]0x88	! Mem[0000000010081408] = ff000000 ffffffff
!	Mem[0000000010101408] = 0000ff00, %l3 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010001400] = 000000ff, %l3 = 000000000000ff00
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%f14 = 10000000 000000b8, Mem[0000000030081410] = ffffffff 0000ffff
	stda	%f14,[%i2+%o5]0x81	! Mem[0000000030081410] = 10000000 000000b8
!	Mem[00000000300c1408] = ffffff00, %l0 = 00000000ff00ff00
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff0058bc, %l3 = 00000000000000ff
	lduba	[%o2+0x001]%asi,%l3	! %l3 = 0000000000000000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	stxa	%l2,[%i0+0x010]%asi
	lduha	[%i2+0x014]%asi,%l6
	stha	%l6,[%i0+0x016]%asi
	std	%l6,[%i4+0x020]
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0

1:	membar	#Sync			! Force all stores to complete


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000ff100000
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be b80000004e4f5dff
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000006b5e
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000ff000000
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000ffffff00
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
	cmp	%l0,%l1			! %f0  should be 00000000 ffffffff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00ff0000 000000ff
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ff000000 ffffffff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 000000ff 0000ff00
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be ffb80000 33d76dda
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be ffff4f4e 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00ff0000 0000006d
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 10000000 000000b8
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ffffffff 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ff000000 0000ff00
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be f84eefff 0000ffff
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00ff0000 ff000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be da6dd733 0000b8ff
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 4e4fffff
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 6d000000 0000ff00
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be b8000000 00000010
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
	stda	%l4,[%i5+%o4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010141408]
	fsqrts	%f11,%f7 
	done

p0_trap1o:
	stda	%l4,[%o5+%i4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010141408]
	fsqrts	%f11,%f7 
	done


p0_trap2e:
	sub	%l2,-0xddf,%l4
	done

p0_trap2o:
	sub	%l2,-0xddf,%l4
	done


p0_trap3e:
	addc	%l6,%l3,%l7
	addc	%l3,%l7,%l7
	and	%l5,%l4,%l7
	xor	%l6,%l6,%l4
	andn	%l0,%l0,%l0
	done

p0_trap3o:
	addc	%l6,%l3,%l7
	addc	%l3,%l7,%l7
	and	%l5,%l4,%l7
	xor	%l6,%l6,%l4
	andn	%l0,%l0,%l0
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
	ldx	[%g1+0x000],%l0		! %l0 = 2a7faa2272411517
	ldx	[%g1+0x008],%l1		! %l1 = 976c61ac69d6794d
	ldx	[%g1+0x010],%l2		! %l2 = d788507cea3f60cb
	ldx	[%g1+0x018],%l3		! %l3 = 7347ccd4b22a47df
	ldx	[%g1+0x020],%l4		! %l4 = ef0459f9b7d6f9fb
	ldx	[%g1+0x028],%l5		! %l5 = 8eb5e90e801df7de
	ldx	[%g1+0x030],%l6		! %l6 = 048e69084c6b862c
	ldx	[%g1+0x038],%l7		! %l7 = b158a4424279e764

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
	std	%l6,[%i3+0x008]		! Mem[00000000100c1408]
	jmpl	%o7,%g0
	fdtos	%f10,%f14
p0_near_0_he:
	fsubs	%f19,%f26,%f16
	ldd	[%i3+0x020],%l0		! Mem[00000000100c1420]
	nop
	lduh	[%i4+0x030],%l4		! Mem[0000000010101430]
	stx	%l3,[%i6+0x030]		! Mem[0000000010181430]
	smul	%l7,%l7,%l7
	jmpl	%o7,%g0
	sub	%l5,0x081,%l3
near0_b2b_h:
	umul	%l1,%l6,%l2
	or	%l6,0x556,%l2
	umul	%l0,0x3af,%l1
	smul	%l6,%l7,%l2
	add	%l6,-0x33d,%l2
	addc	%l6,-0x608,%l6
	and	%l5,%l5,%l0
	jmpl	%o7,%g0
	xor	%l3,%l7,%l4
near0_b2b_l:
	andn	%l7,-0x3ee,%l2
	fsubs	%f7 ,%f11,%f11
	xnor	%l2,-0x538,%l2
	fdtoi	%f6 ,%f2 
	subc	%l3,-0x564,%l2
	fitod	%f7 ,%f10
	umul	%l5,-0x4e8,%l4
	jmpl	%o7,%g0
	fcmps	%fcc0,%f0 ,%f1 
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	lduw	[%i4+0x014],%l0		! Mem[0000000010101414]
	xnor	%l2,-0x1ab,%l6
	ldd	[%i6+0x010],%l6		! Mem[0000000010181410]
	sth	%l0,[%i0+0x006]		! Mem[0000000010001406]
	ldsb	[%i6+0x018],%l5		! Mem[0000000010181418]
	ldsh	[%i5+0x018],%l4		! Mem[0000000010141418]
	jmpl	%o7,%g0
	smul	%l1,-0xe38,%l5
p0_near_1_he:
	std	%f24,[%i6+0x008]	! Mem[0000000010181408]
	xor	%l5,%l7,%l3
	fdtos	%f20,%f25
	sdivx	%l6,%l0,%l2
	jmpl	%o7,%g0
	fitod	%f28,%f16
near1_b2b_h:
	andn	%l0,0xbaf,%l7
	jmpl	%o7,%g0
	udivx	%l1,-0x5c7,%l7
near1_b2b_l:
	andn	%l4,%l4,%l5
	jmpl	%o7,%g0
	addc	%l4,0xa50,%l6
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	jmpl	%o7,%g0
	fdtoi	%f12,%f15
	jmpl	%o7,%g0
	nop
p0_near_2_he:
	stx	%l6,[%i4+0x018]		! Mem[0000000010101418]
	fadds	%f25,%f21,%f18
	swap	[%i0+0x028],%l0		! Mem[0000000010001428]
	std	%l0,[%i5+0x008]		! Mem[0000000010141408]
	ldub	[%i3+0x000],%l1		! Mem[00000000100c1400]
	andn	%l7,-0xa3c,%l4
	jmpl	%o7,%g0
	ldd	[%i5+0x020],%f16	! Mem[0000000010141420]
near2_b2b_h:
	and	%l2,%l6,%l6
	jmpl	%o7,%g0
	fdivs	%f20,%f28,%f18
near2_b2b_l:
	sdivx	%l5,%l2,%l5
	jmpl	%o7,%g0
	andn	%l7,-0x226,%l1
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	mulx	%l1,0xa8a,%l3
	smul	%l1,-0x3db,%l3
	jmpl	%o7,%g0
	ldd	[%i6+0x028],%l2		! Mem[0000000010181428]
p0_near_3_he:
	xor	%l3,%l6,%l0
	jmpl	%o7,%g0
	fdivs	%f25,%f26,%f18
near3_b2b_h:
	subc	%l7,0x18b,%l0
	umul	%l6,%l3,%l2
	sdivx	%l1,%l1,%l1
	orn	%l0,-0x45b,%l4
	andn	%l7,%l4,%l1
	xor	%l1,%l3,%l0
	jmpl	%o7,%g0
	add	%l3,%l2,%l5
near3_b2b_l:
	orn	%l6,-0x223,%l6
	add	%l2,-0xa3b,%l5
	fdivs	%f11,%f15,%f11
	fdtoi	%f10,%f15
	nop
	fdivs	%f9 ,%f7 ,%f13
	jmpl	%o7,%g0
	xnor	%l2,%l6,%l4
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	jmpl	%o7,%g0
	sth	%l4,[%i3+0x03e]		! Mem[00000000100c143e]
	jmpl	%o7,%g0
	nop
p0_far_0_lem:
	membar	#Sync
	jmpl	%o7,%g0
	sth	%l4,[%i3+0x03e]		! Mem[00000000100c143e]
	jmpl	%o7,%g0
	nop
p0_far_0_he:
	orn	%l0,0x306,%l6
	jmpl	%o7,%g0
	fmuls	%f21,%f21,%f19
p0_far_0_hem:
	orn	%l0,0x306,%l6
	jmpl	%o7,%g0
	fmuls	%f21,%f21,%f19
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	udivx	%l1,0xb84,%l7
	smul	%l0,%l1,%l7
	nop
	jmpl	%o7,%g0
	fsubs	%f31,%f21,%f23
far0_b2b_l:
	fcmps	%fcc0,%f14,%f15
	xnor	%l1,-0x75c,%l1
	fitod	%f0 ,%f6 
	jmpl	%o7,%g0
	nop
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fitod	%f0 ,%f12
	ldstub	[%o0+0x001],%l0		! Mem[00000000201c0001]
	jmpl	%o7,%g0
	addc	%l6,-0x78a,%l1
p0_far_1_lem:
	fitod	%f0 ,%f12
	ldstub	[%o0+0x001],%l0		! Mem[00000000201c0001]
	jmpl	%o7,%g0
	addc	%l6,-0x78a,%l1
p0_far_1_he:
	fdtoi	%f22,%f26
	stb	%l7,[%i2+0x02f]		! Mem[000000001008142f]
	or	%l6,%l3,%l7
	ldstub	[%i6+0x007],%l0		! Mem[0000000010181407]
	ldstub	[%o2+0x000],%l5		! Mem[00000000211c0000]
	jmpl	%o7,%g0
	fdivs	%f23,%f20,%f23
p0_far_1_hem:
	fdtoi	%f22,%f26
	membar	#Sync
	stb	%l7,[%i2+0x02f]		! Mem[000000001008142f]
	or	%l6,%l3,%l7
	ldstub	[%i6+0x007],%l0		! Mem[0000000010181407]
	ldstub	[%o2+0x000],%l5		! Mem[00000000211c0000]
	jmpl	%o7,%g0
	fdivs	%f23,%f20,%f23
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	udivx	%l5,%l2,%l5
	nop
	fstod	%f30,%f16
	and	%l5,-0xe05,%l3
	jmpl	%o7,%g0
	or	%l0,-0x2ca,%l5
far1_b2b_l:
	sub	%l7,0xe8c,%l4
	xor	%l5,%l5,%l7
	add	%l5,%l3,%l4
	fitos	%f8 ,%f8 
	jmpl	%o7,%g0
	sub	%l4,-0xe58,%l6
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	std	%f0 ,[%i5+0x010]	! Mem[0000000010141410]
	fdivs	%f6 ,%f14,%f15
	jmpl	%o7,%g0
	std	%l4,[%i1+0x000]		! Mem[0000000010041400]
p0_far_2_lem:
	membar	#Sync
	std	%f0 ,[%i5+0x010]	! Mem[0000000010141410]
	fdivs	%f6 ,%f14,%f15
	membar	#Sync
	jmpl	%o7,%g0
	std	%l4,[%i1+0x000]		! Mem[0000000010041400]
p0_far_2_he:
	smul	%l5,-0x555,%l0
	udivx	%l0,%l0,%l7
	jmpl	%o7,%g0
	stb	%l7,[%i4+0x01b]		! Mem[000000001010141b]
p0_far_2_hem:
	smul	%l5,-0x555,%l0
	udivx	%l0,%l0,%l7
	membar	#Sync
	jmpl	%o7,%g0
	stb	%l7,[%i4+0x01b]		! Mem[000000001010141b]
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	sdivx	%l1,%l5,%l2
	fitos	%f28,%f21
	mulx	%l4,%l0,%l0
	fcmps	%fcc2,%f31,%f24
	jmpl	%o7,%g0
	fstod	%f20,%f18
far2_b2b_l:
	xor	%l1,-0xa83,%l2
	fitos	%f0 ,%f13
	fsubs	%f9 ,%f15,%f8 
	udivx	%l5,%l3,%l4
	jmpl	%o7,%g0
	umul	%l4,%l6,%l3
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	fitod	%f4 ,%f12
	orn	%l2,-0x374,%l5
	fmuls	%f8 ,%f11,%f11
	swap	[%i5+0x014],%l4		! Mem[0000000010141414]
	jmpl	%o7,%g0
	addc	%l5,%l6,%l4
p0_far_3_lem:
	fitod	%f4 ,%f12
	orn	%l2,-0x374,%l5
	fmuls	%f8 ,%f11,%f11
	membar	#Sync
	swap	[%i5+0x014],%l4		! Mem[0000000010141414]
	jmpl	%o7,%g0
	addc	%l5,%l6,%l4
p0_far_3_he:
	sth	%l7,[%i4+0x020]		! Mem[0000000010101420]
	jmpl	%o7,%g0
	andn	%l3,%l5,%l4
p0_far_3_hem:
	membar	#Sync
	sth	%l7,[%i4+0x020]		! Mem[0000000010101420]
	jmpl	%o7,%g0
	andn	%l3,%l5,%l4
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	orn	%l6,-0x8b0,%l2
	or	%l1,-0x03d,%l4
	udivx	%l6,0xc60,%l5
	fsqrts	%f21,%f25
	jmpl	%o7,%g0
	or	%l3,0x41a,%l7
far3_b2b_l:
	fcmps	%fcc2,%f8 ,%f4 
	sub	%l6,-0x7cb,%l1
	smul	%l4,%l7,%l5
	fsubs	%f11,%f2 ,%f4 
	jmpl	%o7,%g0
	fmuls	%f13,%f1 ,%f5 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	ldsw	[%i3+0x008],%l4		! Mem[00000000100c1408]
	jmpl	%g6+8,%g0
	fcmps	%fcc0,%f12,%f1 
p0_call_0_le:
	add	%l7,%l0,%l4
	fstoi	%f3 ,%f12
	ldsw	[%i2+0x014],%l2		! Mem[0000000010081414]
	ldsw	[%i5+0x010],%l1		! Mem[0000000010141410]
	nop
	retl
	ldsh	[%i6+0x008],%l1		! Mem[0000000010181408]
p0_jmpl_0_lo:
	ldsw	[%o3+0x008],%l4		! Mem[00000000100c1408]
	jmpl	%g6+8,%g0
	fcmps	%fcc0,%f12,%f1 
p0_call_0_lo:
	add	%l7,%l0,%l4
	fstoi	%f3 ,%f12
	ldsw	[%o2+0x014],%l2		! Mem[0000000010081414]
	ldsw	[%o5+0x010],%l1		! Mem[0000000010141410]
	nop
	retl
	ldsh	[%o6+0x008],%l1		! Mem[0000000010181408]
p0_jmpl_0_he:
	sdivx	%l1,-0xb5b,%l2
	orn	%l5,%l3,%l7
	fstoi	%f17,%f26
	ldsw	[%i1+0x030],%l7		! Mem[0000000010041430]
	fdtoi	%f24,%f24
	stb	%l4,[%i1+0x027]		! Mem[0000000010041427]
	jmpl	%g6+8,%g0
	fdtoi	%f24,%f27
p0_call_0_he:
	ldsb	[%i6+0x02e],%l6		! Mem[000000001018142e]
	umul	%l4,%l0,%l5
	orn	%l7,%l2,%l6
	or	%l0,%l2,%l4
	fcmps	%fcc3,%f19,%f21
	fitod	%f24,%f30
	retl
	orn	%l7,0xcd3,%l2
p0_jmpl_0_ho:
	sdivx	%l1,-0xb5b,%l2
	orn	%l5,%l3,%l7
	fstoi	%f17,%f26
	ldsw	[%o1+0x030],%l7		! Mem[0000000010041430]
	fdtoi	%f24,%f24
	stb	%l4,[%o1+0x027]		! Mem[0000000010041427]
	jmpl	%g6+8,%g0
	fdtoi	%f24,%f27
p0_call_0_ho:
	ldsb	[%o6+0x02e],%l6		! Mem[000000001018142e]
	umul	%l4,%l0,%l5
	orn	%l7,%l2,%l6
	or	%l0,%l2,%l4
	fcmps	%fcc3,%f19,%f21
	fitod	%f24,%f30
	retl
	orn	%l7,0xcd3,%l2
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	jmpl	%g6+8,%g0
	sdivx	%l0,%l5,%l5
p0_call_1_le:
	ldstub	[%o3+0x0c0],%l0		! Mem[00000000218000c0]
	fmuls	%f11,%f13,%f5 
	fstoi	%f9 ,%f15
	subc	%l6,%l0,%l6
	swap	[%i1+0x014],%l7		! Mem[0000000010041414]
	retl
	mulx	%l2,%l6,%l6
p0_jmpl_1_lo:
	jmpl	%g6+8,%g0
	sdivx	%l0,%l5,%l5
p0_call_1_lo:
	ldstub	[%i3+0x0c0],%l0		! Mem[00000000218000c0]
	fmuls	%f11,%f13,%f5 
	fstoi	%f9 ,%f15
	subc	%l6,%l0,%l6
	swap	[%o1+0x014],%l7		! Mem[0000000010041414]
	retl
	mulx	%l2,%l6,%l6
p0_jmpl_1_he:
	fsubs	%f29,%f26,%f24
	umul	%l2,0xc79,%l2
	fstoi	%f23,%f25
	stx	%l1,[%i6+0x018]		! Mem[0000000010181418]
	fadds	%f21,%f27,%f17
	jmpl	%g6+8,%g0
	ld	[%i6+0x020],%f20	! Mem[0000000010181420]
p0_call_1_he:
	mulx	%l2,%l3,%l3
	add	%l7,%l2,%l5
	fcmps	%fcc2,%f19,%f24
	std	%l2,[%i6+0x020]		! Mem[0000000010181420]
	fstoi	%f27,%f30
	sth	%l6,[%i2+0x010]		! Mem[0000000010081410]
	sth	%l7,[%i2+0x01a]		! Mem[000000001008141a]
	retl
	fdivs	%f24,%f22,%f23
p0_jmpl_1_ho:
	fsubs	%f29,%f26,%f24
	umul	%l2,0xc79,%l2
	fstoi	%f23,%f25
	stx	%l1,[%o6+0x018]		! Mem[0000000010181418]
	fadds	%f21,%f27,%f17
	jmpl	%g6+8,%g0
	ld	[%o6+0x020],%f20	! Mem[0000000010181420]
p0_call_1_ho:
	mulx	%l2,%l3,%l3
	add	%l7,%l2,%l5
	fcmps	%fcc2,%f19,%f24
	std	%l2,[%o6+0x020]		! Mem[0000000010181420]
	fstoi	%f27,%f30
	sth	%l6,[%o2+0x010]		! Mem[0000000010081410]
	sth	%l7,[%o2+0x01a]		! Mem[000000001008141a]
	retl
	fdivs	%f24,%f22,%f23
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	fstoi	%f9 ,%f6 
	fsqrts	%f12,%f4 
	ldstub	[%o1+0x001],%l5		! Mem[0000000020800001]
	add	%l6,%l5,%l0
	subc	%l2,0x623,%l7
	fsqrts	%f13,%f12
	addc	%l4,%l4,%l6
	jmpl	%g6+8,%g0
	stx	%l1,[%i4+0x010]		! Mem[0000000010101410]
p0_call_2_le:
	andn	%l5,0x6c6,%l7
	fadds	%f7 ,%f9 ,%f14
	xor	%l1,0x0ea,%l1
	retl
	and	%l4,-0x03a,%l6
p0_jmpl_2_lo:
	fstoi	%f9 ,%f6 
	fsqrts	%f12,%f4 
	ldstub	[%i1+0x001],%l5		! Mem[0000000020800001]
	add	%l6,%l5,%l0
	subc	%l2,0x623,%l7
	fsqrts	%f13,%f12
	addc	%l4,%l4,%l6
	jmpl	%g6+8,%g0
	stx	%l1,[%o4+0x010]		! Mem[0000000010101410]
p0_call_2_lo:
	andn	%l5,0x6c6,%l7
	fadds	%f7 ,%f9 ,%f14
	xor	%l1,0x0ea,%l1
	retl
	and	%l4,-0x03a,%l6
p0_jmpl_2_he:
	jmpl	%g6+8,%g0
	udivx	%l2,-0x950,%l0
p0_call_2_he:
	fstoi	%f21,%f19
	udivx	%l2,%l5,%l1
	stb	%l3,[%i0+0x001]		! Mem[0000000010001401]
	ldstub	[%o1+0x040],%l0		! Mem[0000000020800040]
	or	%l7,%l3,%l7
	fdtoi	%f22,%f16
	retl
	xor	%l7,0x169,%l3
p0_jmpl_2_ho:
	jmpl	%g6+8,%g0
	udivx	%l2,-0x950,%l0
p0_call_2_ho:
	fstoi	%f21,%f19
	udivx	%l2,%l5,%l1
	stb	%l3,[%o0+0x001]		! Mem[0000000010001401]
	ldstub	[%i1+0x040],%l0		! Mem[0000000020800040]
	or	%l7,%l3,%l7
	fdtoi	%f22,%f16
	retl
	xor	%l7,0x169,%l3
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	xor	%l6,0x2f4,%l6
	lduw	[%i5+0x024],%l2		! Mem[0000000010141424]
	stx	%l4,[%i3+0x028]		! Mem[00000000100c1428]
	lduw	[%i5+0x00c],%l1		! Mem[000000001014140c]
	jmpl	%g6+8,%g0
	orn	%l6,-0xa2f,%l1
p0_call_3_le:
	ldstub	[%o0+0x000],%l2		! Mem[00000000201c0000]
	fsqrts	%f6 ,%f8 
	ldd	[%i3+0x020],%f8 	! Mem[00000000100c1420]
	ldstub	[%o3+0x1c0],%l3		! Mem[00000000218001c0]
	st	%f5 ,[%i2+0x020]	! Mem[0000000010081420]
	retl
	fdtoi	%f12,%f5 
p0_jmpl_3_lo:
	xor	%l6,0x2f4,%l6
	lduw	[%o5+0x024],%l2		! Mem[0000000010141424]
	stx	%l4,[%o3+0x028]		! Mem[00000000100c1428]
	lduw	[%o5+0x00c],%l1		! Mem[000000001014140c]
	jmpl	%g6+8,%g0
	orn	%l6,-0xa2f,%l1
p0_call_3_lo:
	ldstub	[%i0+0x000],%l2		! Mem[00000000201c0000]
	fsqrts	%f6 ,%f8 
	ldd	[%o3+0x020],%f8 	! Mem[00000000100c1420]
	ldstub	[%i3+0x1c0],%l3		! Mem[00000000218001c0]
	st	%f5 ,[%o2+0x020]	! Mem[0000000010081420]
	retl
	fdtoi	%f12,%f5 
p0_jmpl_3_he:
	ldub	[%i3+0x02e],%l7		! Mem[00000000100c142e]
	xor	%l2,%l4,%l7
	fmuls	%f19,%f21,%f27
	fitod	%f23,%f24
	jmpl	%g6+8,%g0
	std	%f16,[%i6+0x010]	! Mem[0000000010181410]
p0_call_3_he:
	swap	[%i5+0x004],%l6		! Mem[0000000010141404]
	fitod	%f21,%f24
	fsubs	%f31,%f23,%f25
	orn	%l4,-0x89e,%l6
	sth	%l5,[%i6+0x012]		! Mem[0000000010181412]
	retl
	sub	%l0,-0xdc1,%l6
p0_jmpl_3_ho:
	ldub	[%o3+0x02e],%l7		! Mem[00000000100c142e]
	xor	%l2,%l4,%l7
	fmuls	%f19,%f21,%f27
	fitod	%f23,%f24
	jmpl	%g6+8,%g0
	std	%f16,[%o6+0x010]	! Mem[0000000010181410]
p0_call_3_ho:
	swap	[%o5+0x004],%l6		! Mem[0000000010141404]
	fitod	%f21,%f24
	fsubs	%f31,%f23,%f25
	orn	%l4,-0x89e,%l6
	sth	%l5,[%o6+0x012]		! Mem[0000000010181412]
	retl
	sub	%l0,-0xdc1,%l6
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
	.word	0x2a7faa22,0x72411517		! Init value for %l0
	.word	0x976c61ac,0x69d6794d		! Init value for %l1
	.word	0xd788507c,0xea3f60cb		! Init value for %l2
	.word	0x7347ccd4,0xb22a47df		! Init value for %l3
	.word	0xef0459f9,0xb7d6f9fb		! Init value for %l4
	.word	0x8eb5e90e,0x801df7de		! Init value for %l5
	.word	0x048e6908,0x4c6b862c		! Init value for %l6
	.word	0xb158a442,0x4279e764		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xd958b216,0xf6d90c68		! Init value for %f0 
	.word	0x31b86b5e,0xcc1695a4		! Init value for %f2 
	.word	0x93cd39e6,0x4482c20c		! Init value for %f4 
	.word	0xbc89d647,0xfb516337		! Init value for %f6 
	.word	0x503da932,0x3553528e		! Init value for %f8 
	.word	0xffdce7e9,0xf5f90b12		! Init value for %f10
	.word	0xdc90759b,0x22863d1b		! Init value for %f12
	.word	0x444907e2,0xa3ec5e26		! Init value for %f14
	.word	0x5874a511,0x9555d6df		! Init value for %f16
	.word	0x2c5022ea,0xfc4a768a		! Init value for %f18
	.word	0x2e681bab,0xd6c55960		! Init value for %f20
	.word	0x29f8f4e3,0xc0493bae		! Init value for %f22
	.word	0x99cf22f6,0x6d887bae		! Init value for %f24
	.word	0xb1264b15,0xf60fe4d6		! Init value for %f26
	.word	0x4011b4d4,0x0b40fd20		! Init value for %f28
	.word	0x33d76dda,0x87e7db8f		! Init value for %f30
	.word	0x23204f15,0xb2fd173b		! Init value for %f32
	.word	0x26fcb792,0x1835078f		! Init value for %f34
	.word	0x710cd47b,0x121d0610		! Init value for %f36
	.word	0xb2114ee7,0x14d6c413		! Init value for %f38
	.word	0x20d4845b,0x912acebd		! Init value for %f40
	.word	0x237d9e42,0xee1f6f20		! Init value for %f42
	.word	0x55db7524,0xe45fc7cd		! Init value for %f44
	.word	0x5e1c2da7,0x2830e7aa		! Init value for %f46
	.word	0x9d22766a,0x507d869c
	.word	0xdafc1e8a,0x71836dda
	.word	0x7327dcfc,0x8e565e24
	.word	0xabee45a8,0x2dda2de1
	.word	0x0ffae359,0xa6f38573
	.word	0xdd93bb91,0x09c7e4f2
	.word	0x5f91ba94,0x6e7a3434
	.word	0xc0bf1afb,0x08d910d8
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
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xff100000
	.word	0xb8000000,0x4e4f5dff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00006b5e
	.word	0x00000000,0xff000000
	.word	0x00000000,0xffffff00
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0x00000000,0xffffffff
	.word	0x00ff0000,0x000000ff
	.word	0xff000000,0xffffffff
	.word	0x000000ff,0x0000ff00
	.word	0xffb80000,0x33d76dda
	.word	0xffff4f4e,0x00000000
	.word	0x00ff0000,0x0000006d
	.word	0x10000000,0x000000b8
	.word	0xffffffff,0x00000000
	.word	0xff000000,0x0000ff00
	.word	0xf84eefff,0x0000ffff
	.word	0x00ff0000,0xff000000
	.word	0xda6dd733,0x0000b8ff
	.word	0x00000000,0x4e4fffff
	.word	0x6d000000,0x0000ff00
	.word	0xb8000000,0x00000010
	.word	0x00000020,0x00000000		! %fsr = 0000002000000000
p0_local0_expect:
	.word	0x00ff0000,0xffffffff
	.word	0x000000ff,0x0000ff00
	.word	0x000000b8,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0xff000000,0xff000000
	.word	0xff000000,0x0000ff00
p0_local0_sec_expect:
	.word	0x00000000,0xffffff00
	.word	0x0000ff00,0xffffff00
	.word	0xffffffff,0x00000000
	.word	0xff000000,0xaf1600ff
	.word	0xffb86b5e,0xda6dd733
	.word	0xffb86b5e,0x000000ff
	.word	0xff000000,0x8900ff00
	.word	0xffffffff,0xff000000
p0_local1_expect:
	.word	0x00000000,0xffffffff
	.word	0x00ff0000,0x000000ff
	.word	0xffff0000,0xffef4ef8
	.word	0x000000ff,0x0000ff00
	.word	0xff000000,0x33d76dda
	.word	0xffff4f4e,0x00000000
	.word	0x00ff0000,0x0000006d
	.word	0x10000000,0x000000b8
p0_local1_sec_expect:
	.word	0xffff0000,0xffffff00
	.word	0xffff0000,0xd71f429a
	.word	0x000000ff,0x00000000
	.word	0xff0016af,0xffff0000
	.word	0x33d76dda,0x5e6bb8ff
	.word	0xff000000,0x5e6bb8ff
	.word	0x0000ffff,0x000000ff
	.word	0x00000000,0xffffffff
p0_local2_expect:
	.word	0x000000ff,0x0000ffff
	.word	0xffffffff,0x000000ff
	.word	0x00000000,0xff000000
	.word	0x00ffffff,0xffffff00
	.word	0xffb86b5e,0x00000000
	.word	0xff00ff00,0x0000ff00
	.word	0x00000000,0x000000ff
	.word	0xffff0000,0x000000ff
p0_local2_sec_expect:
	.word	0x00000000,0x000000ff
	.word	0xff0000ff,0x00ff0000
	.word	0x10000000,0x000000b8
	.word	0xff000000,0xffffffff
	.word	0xff100000,0xd71f429a
	.word	0x00ff0000,0x000000ff
	.word	0xd71f429a,0x000000ff
	.word	0xffffff00,0x000000ff
p0_local3_expect:
	.word	0x00000000,0xffffffff
	.word	0xff000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0xffffffff,0x000000ff
	.word	0xff13e734,0x00000042
	.word	0x6a13e734,0xe923210d
	.word	0x00000000,0x00000000
	.word	0xff0000ff,0x8700c6cd
p0_local3_sec_expect:
	.word	0xff000000,0x00000000
	.word	0xffffff00,0x000000ff
	.word	0xff000000,0x00000000
	.word	0xff0016af,0xffff0000
	.word	0x33d76dda,0x5e6bb8ff
	.word	0xff000000,0x5e6bb8ff
	.word	0x00ff0089,0x000000ff
	.word	0x000000ff,0xffffffff
p0_local4_expect:
	.word	0x00000000,0xffffffff
	.word	0xff000000,0x000000ff
	.word	0xffff0000,0xffef4ef8
	.word	0x000000ff,0x0000ff00
	.word	0xffb80000,0x33d76dda
	.word	0xffff4f4e,0x00000000
	.word	0x00ff0000,0x0000006d
	.word	0x10000000,0x000000b8
p0_local4_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00ff00ff,0x00001fd7
	.word	0xff0000ff,0x000000ff
	.word	0x982a3c92,0xff0000ff
	.word	0xd7000000,0xffffffff
	.word	0x00000000,0xff000000
	.word	0x00000000,0xaf160000
	.word	0xff00408b,0xff00ffff
p0_local5_expect:
	.word	0x00009ca1,0x00000000
	.word	0xffffff00,0x00ff0000
	.word	0x00000000,0xff000000
	.word	0x5e6bb8ff,0x0000b8ff
	.word	0xffffffff,0xffffffff
	.word	0x000000ff,0x000000b8
	.word	0xffb86b5e,0xff000000
	.word	0xff000000,0x0000ff00
p0_local5_sec_expect:
	.word	0x000000ff,0x00000000
	.word	0x00000000,0xff000000
	.word	0x00000000,0xff0000ff
	.word	0x6a13e734,0xe923210d
	.word	0xffb86b5e,0x00000000
	.word	0xff000000,0x0000ff00
	.word	0x00000000,0x000000ff
	.word	0xffff0000,0x000000ff
p0_local6_expect:
	.word	0xff000000,0x000000ff
	.word	0x00ffffff,0xffffff00
	.word	0xffffffff,0xff000000
	.word	0x00ff0000,0x00000000
	.word	0x0000ffff,0xffffebff
	.word	0x00000000,0x4e4f5dff
	.word	0x6d00ff00,0x0000ff00
	.word	0x00000000,0x00000000
p0_local6_sec_expect:
	.word	0xb8000000,0x4e4f5dff
	.word	0xff000000,0x00000000
	.word	0x000000ff,0x5e6bb8ff
	.word	0xbb000000,0x00000000
	.word	0xff000000,0x00000055
	.word	0xd587da6d,0xd7000039
	.word	0x0d2123e9,0x34e7136a
	.word	0x00000000,0xfbf9d6b7
share0_expect:
	.word	0xff000847,0x30eaa2e1
	.word	0x4520ae1a,0xb9857429
	.word	0xb39be7cb,0x43a5ace2
	.word	0xac410d6c,0xd18fdf8e
	.word	0x18a2a22f,0x842cf78b
	.word	0xaef86c19,0xee5f4e64
	.word	0xb7e1b386,0x2197d763
	.word	0x15827b61,0xc9ef6473
share1_expect:
	.word	0xff00261d,0xa4eeaf24
	.word	0xa8b2eeae,0x616dee0f
	.word	0x97f63043,0x44f484ec
	.word	0xe522a181,0x52ac0059
	.word	0xc608eb6b,0xc85a190e
	.word	0x63f4636b,0x1b7b1606
	.word	0xfebd8161,0xee779414
	.word	0x57f3ffd9,0x5ac3574a
	.word	0x00ff4bbb,0xb602deae
	.word	0x2613b37b,0x27372543
	.word	0xd660cb2f,0xe38159ce
	.word	0xaf9078ea,0xa4066420
	.word	0x0862214b,0xa988c479
	.word	0xa941b481,0x345d2c69
	.word	0xdd7edc88,0xf0cf9064
	.word	0xdb1d1045,0x96ba8ad8
share2_expect:
	.word	0xff0058bc,0xb6319f6a
	.word	0x7fce4743,0x4b125d76
	.word	0xe3084e7c,0x11a92b62
	.word	0x5eb7e88b,0x4270531b
	.word	0x2e503432,0x25d5928d
	.word	0x6a17dc93,0xc8dcb416
	.word	0x372c5f34,0x9f595b5d
	.word	0x0e17ed29,0x065c9839
share3_expect:
	.word	0xffff951b,0x231485bd
	.word	0x32cb8f10,0x421a4391
	.word	0xfe907217,0x06ff4a53
	.word	0xdf2d3a36,0xe48b6dd8
	.word	0x79a021c3,0x5097e67c
	.word	0xac45793c,0xf7655532
	.word	0x704c022c,0x7e830d09
	.word	0x9fdb1864,0x2cc72c9b
	.word	0xffffc626,0x005044de
	.word	0x1fb6576b,0x99d29644
	.word	0xbe767fe2,0xbcddc3a4
	.word	0x43ac14a6,0xaa7cd001
	.word	0x64841082,0x4a1cafa1
	.word	0xb34c102f,0x7a6b0faf
	.word	0x02cd4083,0x57c57111
	.word	0x40e1e2dc,0xa069afc7
	.word	0xffff2e44,0xe67d9639
	.word	0x25f36e14,0xa8144b71
	.word	0x13aa50d5,0xc639cb0f
	.word	0x323124f2,0xb48ffbc5
	.word	0x615bddee,0xc35ce633
	.word	0xc736f29a,0x948cdb5a
	.word	0xcf0390dc,0xfdc0df44
	.word	0x105e5b98,0x007d94da
	.word	0x00b8f510,0x984044ac
	.word	0xcda73e11,0x1cd561bb
	.word	0xeb2635d3,0x6ccf7302
	.word	0x1290445b,0x6445ed19
	.word	0xca4fa34e,0x9b44fe08
	.word	0x9c7cecb0,0xde2f4b85
	.word	0x407235cd,0xbbc82fc4
	.word	0xd12edaf5,0x3a458442
	.word	0x00ff8452,0xdaff06aa
	.word	0xd2cf302b,0xe56ca88a
	.word	0x9ded0e8f,0x27a257e3
	.word	0x8021c3f4,0x0d2d5915
	.word	0x91ab5d0a,0x4595b7aa
	.word	0xd108827f,0xcdfc11c6
	.word	0xd7e52c38,0x212a8b32
	.word	0xf7a62608,0xc981ee73
	.word	0xfffff4c2,0x466643bf
	.word	0x50c27c42,0x6bdb832c
	.word	0xadb66496,0xc305b49c
	.word	0x09cd018c,0x2a0ac3cc
	.word	0x8827004e,0x320183d0
	.word	0xa90e2c65,0x961a2b9a
	.word	0xa9c1cfe0,0xd66eae0b
	.word	0x0f8284e0,0x5db60744
	.word	0xff84809b,0x31181dcf
	.word	0x4117674c,0x8695a68e
	.word	0x9c214c6b,0x8a4bad8c
	.word	0x7fa4097c,0x821c080e
	.word	0x223f8dae,0xf18e7a38
	.word	0x7cfd6735,0x4119f851
	.word	0x0a95cdbe,0x2e45aefe
	.word	0x5c4489da,0xc36c9a00
	.word	0xffffa805,0x12ce1fb2
	.word	0x444705eb,0x2fe92f34
	.word	0xd0e6c5cb,0xbbcc94ee
	.word	0x781af7f9,0x4910cb53
	.word	0x40bf0afa,0x0d22d33b
	.word	0xc6611bfe,0x709cf365
	.word	0x6fac2188,0xaece267b
	.word	0xafe0c626,0x3db85c77
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
	.word	0x543637a7,0x924b38c9
	.word	0x00000000,0x00000002
	.word	0x26c46be0,0x2941c116
	.word	0x00000000,0x00000003
	.word	0x4a72ac28,0x6892ecb0
	.word	0x00000000,0x00000004
	.word	0xf564b237,0xa3a23598
	.word	0x00000000,0x00000005
	.word	0x1ae28cf0,0x10959ad6
	.word	0x00000000,0x00000006
	.word	0x16839507,0x91b43805
	.word	0x00000000,0x00000007
	.word	0xc83ad7b8,0x0bcdca1d
	.word	0x00000000,0x00000008
	.word	0x1a9a83b8,0x6e44abd1
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
	.word	0x6e266351,0xf55387cf,0xc828fd28,0x76449c85
	.word	0x41392d82,0x5cce3b46,0xb5cfe323,0x3a0954ff
	.word	0x4bf9fd92,0x50b31d88,0x968a7692,0x3ecf1a87
	.word	0x4f52ac7d,0x20c310c2,0xbb7fb290,0x198ebd89
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
	.word	0x23286e4e,0x72ce1b3c,0x4e1ab7b8,0x670319ae
	.word	0xddba683e,0x2e49804b,0xee589e3a,0x85dd8425
	.word	0x0f14f585,0x81712cf4,0x44945a39,0x2a34cc91
	.word	0xd519e452,0x19fbf8c1,0x9d36154f,0xae11e7a3
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
	.word	0xce710783,0x86ca3bd4,0x31ce5d00,0x0b7d59d7
	.word	0x0105c3d8,0x4377c221,0x73f485ac,0x3dbc8fde
	.word	0x65e64233,0xead4a1c9,0x9fb6d02e,0x3a505a63
	.word	0xaa74498d,0x1778ea23,0x1549dfee,0xdd11c2da
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
	.word	0xc2dff6c6,0xca67b78e,0x096e44d2,0x6c3cc845
	.word	0x3d079987,0xadb14a3c,0x2972f16c,0x0054f3e4
	.word	0x9f39528c,0x28d90dac,0xfba87ce7,0xb4a2119b
	.word	0xe54d0a73,0xedff3411,0x398560e4,0xc9e29374
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
	.word	0x0429857a,0x6d51e871,0x43530527,0x90f8c256
	.word	0x5564459d,0x3bc87061,0x4a16708c,0x3c55aa29
	.word	0xd3c415d3,0xc24b0ab3,0xec30e485,0xf583560f
	.word	0xc6a8432c,0x24a56a1b,0xf317fbab,0x1fb3483b
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
	.word	0x21c44071,0xc7cb9392,0xebb42023,0x5e9777e6
	.word	0x0b27463b,0x88165e09,0x51f2aaac,0x32230641
	.word	0x8792e3e9,0x6dbeebba,0x4758f443,0x91146da7
	.word	0x52305949,0x43ad5600,0xb1d07051,0x682a607a
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
	.word	0x48cfe668,0x14d4f57a,0x6fd341d6,0xb211e0cb
	.word	0xd3cfa2a7,0xeb838479,0xee2e0ba8,0xa3efe193
	.word	0x87febdaf,0x1132255f,0xed685f56,0x2fe83a41
	.word	0x33b36bc9,0x37dba7b4,0x4772839e,0x7558bfbd
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
	.word	0xe140313b,0x1af77f72,0x068718d8,0x74437a03
	.word	0x162bf0f2,0x8f289034,0xf4df2837,0xefe09bab
	.word	0x68ebf655,0xd87b3978,0x6ad014b2,0xcfd52e4b
	.word	0x3c76f8fb,0x152a7b16,0x4613c66d,0x1e4f7940
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
	.word	0x15c0e3ec,0xf84eefba,0xdcb06def,0x4b8b56e4
	.word	0xd73b545a,0xdecc7b7c,0xd175d1a0,0x1a7d7397
	.word	0x0c77e2b3,0x19be1820,0xfb58c9c8,0x390dda80
	.word	0xf1cfdc0a,0x13fe7b7d,0x70001f4b,0x927a5681
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
	.word	0xbe45c76f,0x9b0aebbb,0xde0df159,0x651c9561
	.word	0x23c72978,0x256271c4,0x5a8cb6a5,0x31accfcd
	.word	0x37ebb8aa,0x9731ca5d,0x084bc7d9,0xfe46add6
	.word	0xca151cd5,0xab67c57c,0xc71b8911,0x22f50817
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
	.word	0x9df24c18,0x46692fe0,0x982a3c92,0xb7e0ede4
	.word	0x41fdfdbe,0x27036963,0xce367da3,0xd753121c
	.word	0xa209c2df,0xd104baa0,0xef45dc58,0x41fdddfc
	.word	0xfc01d20a,0x2d60334d,0x9a421fd5,0xe84387dd
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
	.word	0x52932556,0xba69f8df,0x090ebade,0x04f24594
	.word	0x8c5b56ec,0x43726d80,0xd35b4488,0xf087c4fd
	.word	0x25eaeb97,0xafe31480,0x43d924d4,0x2e30c9fc
	.word	0x165fb655,0x1e4c30ba,0x6fc46b8d,0x3e344898
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
	.word	0x686cd994,0xba439dac,0xe17f0d7c,0x1b4c5acf
	.word	0x56b67c38,0x4dcd3ed8,0x32eb21cc,0x53eaa308
	.word	0xbc6703b3,0x4e48ad12,0x9547dba4,0x4b9d9c26
	.word	0x5d0e1277,0x0a952ec4,0xfd312cf8,0x56714c08
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
	.word	0x20e23eb4,0xdab52edf,0xe7d9d3f5,0xb20fc2d9
	.word	0x779994fd,0x3dca4ccd,0x1a7531a7,0x8788c6cd
	.word	0x35340afd,0x157839c2,0x74592f4e,0x299bb4bb
	.word	0x0d2123e9,0x34e7136a,0x109da19c,0x16afb44d
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
	.word	0x0e4e0847,0x30eaa2e1,0x4520ae1a,0xb9857429
	.word	0xb39be7cb,0x43a5ace2,0xac410d6c,0xd18fdf8e
	.word	0x18a2a22f,0x842cf78b,0xaef86c19,0xee5f4e64
	.word	0xb7e1b386,0x2197d763,0x15827b61,0xc9ef6473
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
	.word	0x633e261d,0xa4eeaf24,0xa8b2eeae,0x616dee0f
	.word	0x97f63043,0x44f484ec,0xe522a181,0x52ac0059
	.word	0xc608eb6b,0xc85a190e,0x63f4636b,0x1b7b1606
	.word	0xfebd8161,0xee779414,0x57f3ffd9,0x5ac3574a
	.word	0xf9064bbb,0xb602deae,0x2613b37b,0x27372543
	.word	0xd660cb2f,0xe38159ce,0xaf9078ea,0xa4066420
	.word	0x0862214b,0xa988c479,0xa941b481,0x345d2c69
	.word	0xdd7edc88,0xf0cf9064,0xdb1d1045,0x96ba8ad8
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
	.word	0x018958bc,0xb6319f6a,0x7fce4743,0x4b125d76
	.word	0xe3084e7c,0x11a92b62,0x5eb7e88b,0x4270531b
	.word	0x2e503432,0x25d5928d,0x6a17dc93,0xc8dcb416
	.word	0x372c5f34,0x9f595b5d,0x0e17ed29,0x065c9839
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
	.word	0x94ad951b,0x231485bd,0x32cb8f10,0x421a4391
	.word	0xfe907217,0x06ff4a53,0xdf2d3a36,0xe48b6dd8
	.word	0x79a021c3,0x5097e67c,0xac45793c,0xf7655532
	.word	0x704c022c,0x7e830d09,0x9fdb1864,0x2cc72c9b
	.word	0xd859c626,0x005044de,0x1fb6576b,0x99d29644
	.word	0xbe767fe2,0xbcddc3a4,0x43ac14a6,0xaa7cd001
	.word	0x64841082,0x4a1cafa1,0xb34c102f,0x7a6b0faf
	.word	0x02cd4083,0x57c57111,0x40e1e2dc,0xa069afc7
	.word	0x0a282e44,0xe67d9639,0x25f36e14,0xa8144b71
	.word	0x13aa50d5,0xc639cb0f,0x323124f2,0xb48ffbc5
	.word	0x615bddee,0xc35ce633,0xc736f29a,0x948cdb5a
	.word	0xcf0390dc,0xfdc0df44,0x105e5b98,0x007d94da
	.word	0x6d45f510,0x984044ac,0xcda73e11,0x1cd561bb
	.word	0xeb2635d3,0x6ccf7302,0x1290445b,0x6445ed19
	.word	0xca4fa34e,0x9b44fe08,0x9c7cecb0,0xde2f4b85
	.word	0x407235cd,0xbbc82fc4,0xd12edaf5,0x3a458442
	.word	0x67538452,0xdaff06aa,0xd2cf302b,0xe56ca88a
	.word	0x9ded0e8f,0x27a257e3,0x8021c3f4,0x0d2d5915
	.word	0x91ab5d0a,0x4595b7aa,0xd108827f,0xcdfc11c6
	.word	0xd7e52c38,0x212a8b32,0xf7a62608,0xc981ee73
	.word	0x3c3bf4c2,0x466643bf,0x50c27c42,0x6bdb832c
	.word	0xadb66496,0xc305b49c,0x09cd018c,0x2a0ac3cc
	.word	0x8827004e,0x320183d0,0xa90e2c65,0x961a2b9a
	.word	0xa9c1cfe0,0xd66eae0b,0x0f8284e0,0x5db60744
	.word	0x8f6b809b,0x31181dcf,0x4117674c,0x8695a68e
	.word	0x9c214c6b,0x8a4bad8c,0x7fa4097c,0x821c080e
	.word	0x223f8dae,0xf18e7a38,0x7cfd6735,0x4119f851
	.word	0x0a95cdbe,0x2e45aefe,0x5c4489da,0xc36c9a00
	.word	0xd442a805,0x12ce1fb2,0x444705eb,0x2fe92f34
	.word	0xd0e6c5cb,0xbbcc94ee,0x781af7f9,0x4910cb53
	.word	0x40bf0afa,0x0d22d33b,0xc6611bfe,0x709cf365
	.word	0x6fac2188,0xaece267b,0xafe0c626,0x3db85c77
share3_end:
