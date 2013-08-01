/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_4000l.s
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
!	Seed = 326121456
!	Riesling can be on
!	1 Thread, 4000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_4000l_new.s created on Mar 26, 2009 (12:14:56)
!	RC file : mar26.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar26.rc -o mpgen_4000l_new -p 1 -l 4000

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
!	%f0  = 26de903b 03e8e6c8 4f752913 566c92f3
!	%f4  = 5cf4ec97 2752d5ed 6a5e375c ceac7e73
!	%f8  = 2036b5ea 09275b0d b991c190 aac85f02
!	%f12 = 9b91ca6c 573d6472 341775dc 4f480bf8
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = d95dc06d 00b05a62 a62a7b3d 65032b63
!	%f20 = 8ef6b733 e9251f9b a87f4fc3 9f65f7e5
!	%f24 = 63b53ff4 fa2142eb 35c884b1 36cccd84
!	%f28 = 2d1ea416 61c67279 c85a5f2c ea81b6ab
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 911b4233 d8df1dd9 b3179ce2 3a7c4f04
!	%f36 = c8258c8c 0feb55e4 e1018a2d 1879809d
!	%f40 = d1f925dc eba38366 f9464e56 85adf98b
!	%f44 = 9cd70d81 d8f26aff 180ffaf7 c5097346
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xee837c7800000002,%g7,%g1 ! GSR scale =  0, align = 2
	wr	%g1,%g0,%gsr		! GSR = ee837c7800000002
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000010041424] = 3f403703, %l3 = 52f1c087c1c6f5b4
	ldsw	[%i1+0x024],%l3		! %l3 = 000000003f403703
!	Mem[0000000030181410] = 5b552696, %l5 = 4a96823fbb9fa589
	ldsba	[%i6+%o5]0x89,%l5	! %l5 = ffffffffffffff96
!	%l2 = 8c8e1f81d97effb0, Mem[0000000010001400] = 9cf5435ccfcf3245
	stxa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 8c8e1f81d97effb0
!	%f22 = a87f4fc3 9f65f7e5, Mem[0000000030081410] = bb476e3b 05229dc6
	stda	%f22,[%i2+%o5]0x89	! Mem[0000000030081410] = a87f4fc3 9f65f7e5
!	Mem[0000000030181408] = e676e08e, %l2 = 8c8e1f81d97effb0
	ldsha	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffffe676
!	Mem[0000000010081408] = 787dff91, %l1 = 51e0383612faecd1
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 00000091000000ff
!	Mem[0000000010181408] = e73b61e7 85f2c6fe, %l2 = ffffe676, %l3 = 3f403703
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 00000000e73b61e7 0000000085f2c6fe
!	%l2 = 00000000e73b61e7, Mem[0000000030101410] = 6fe2cc7d0169d763
	stxa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000e73b61e7
!	Mem[000000001014140e] = 2c05a2f6, %l3 = 0000000085f2c6fe
	ldstuba	[%i5+0x00e]%asi,%l3	! %l3 = 000000a2000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 90ac91f0, %l6 = 6bde661c77c1d4ab
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 0000000090ac91f0

p0_label_2:
!	%l5 = ffffffffffffff96, Mem[0000000030041410] = 674511f1b257d382
	stxa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffffffffff96
!	%l3 = 00000000000000a2, Mem[0000000010181410] = d75f44e6
	stwa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000a2
!	%l4 = deb06ddabe1563dd, Mem[00000000100c1400] = 3e16e907
	stha	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 3e1663dd
!	%f14 = 341775dc 4f480bf8, Mem[0000000010001408] = acf2627d 76f2f71b
	stda	%f14,[%i0+%o4]0x88	! Mem[0000000010001408] = 341775dc 4f480bf8
!	%f16 = d95dc06d 00b05a62 a62a7b3d 65032b63
!	%f20 = 8ef6b733 e9251f9b a87f4fc3 9f65f7e5
!	%f24 = 63b53ff4 fa2142eb 35c884b1 36cccd84
!	%f28 = 2d1ea416 61c67279 c85a5f2c ea81b6ab
	stda	%f16,[%i2]ASI_BLK_AIUS	! Block Store to 0000000030081400
!	%f6  = 6a5e375c, Mem[00000000100c1408] = 81f0596c
	sta	%f6 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 6a5e375c
!	Mem[00000000211c0000] = 896fe4d2, %l0 = a7a7b42658d3204c
	ldstub	[%o2+%g0],%l0		! %l0 = 00000089000000ff
!	%l6 = 0000000090ac91f0, Mem[00000000201c0000] = 0390afd5, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 91f0afd5
!	%l7 = 492eebbadf1352cc, Mem[0000000030141410] = 1796e2b6
	stwa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = df1352cc
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = e7613be7, %l2 = 00000000e73b61e7
	ldswa	[%i6+%o4]0x88,%l2	! %l2 = ffffffffe7613be7

p0_label_3:
!	Mem[00000000100c1400] = 3e1663dd, %l5 = ffffffffffffff96
	lduha	[%i3+%g0]0x88,%l5	! %l5 = 00000000000063dd
!	Mem[0000000010001400] = b0ff7ed9, %l5 = 00000000000063dd
	ldsba	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffffb0
!	Mem[00000000218001c0] = 5a379ea8, %l3 = 00000000000000a2
	ldsh	[%o3+0x1c0],%l3		! %l3 = 0000000000005a37
!	Mem[0000000020800040] = e9e6e589, %l3 = 0000000000005a37
	ldsba	[%o1+0x041]%asi,%l3	! %l3 = ffffffffffffffe6
!	Mem[0000000010181400] = 80492987, %l5 = ffffffffffffffb0
	ldswa	[%i6+%g0]0x88,%l5	! %l5 = ffffffff80492987
!	Mem[00000000300c1410] = a7740b98, %l7 = 492eebbadf1352cc
	lduwa	[%i3+%o5]0x81,%l7	! %l7 = 00000000a7740b98
!	Mem[0000000030181410] = f88ff5815b552696, %l2 = ffffffffe7613be7
	ldxa	[%i6+%o5]0x89,%l2	! %l2 = f88ff5815b552696
!	Mem[0000000010101400] = 8f0bc83ea1a8578a, %l1 = 0000000000000091
	ldxa	[%i4+%g0]0x88,%l1	! %l1 = 8f0bc83ea1a8578a
!	Mem[00000000300c1408] = a2ffbbd9 a3d2d9bb, %l2 = 5b552696, %l3 = ffffffe6
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 00000000a2ffbbd9 00000000a3d2d9bb
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = bfaff38a, %l2 = 00000000a2ffbbd9
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000bfaff38a

p0_label_4:
!	%f0  = 26de903b 03e8e6c8, Mem[0000000030001410] = 64f31bd6 15b532d1
	stda	%f0 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 26de903b 03e8e6c8
!	%l5 = ffffffff80492987, Mem[0000000010181430] = 7ade25ca, %asi = 80
	stwa	%l5,[%i6+0x030]%asi	! Mem[0000000010181430] = 80492987
!	%f8  = 2036b5ea, Mem[0000000030081400] = d95dc06d
	sta	%f8 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 2036b5ea
!	Mem[0000000030001408] = 703ef719, %l6 = 0000000090ac91f0
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 00000070000000ff
!	%f6  = 6a5e375c, Mem[0000000010041410] = e63d86e6
	sta	%f6 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 6a5e375c
!	%f0  = 26de903b 03e8e6c8, %l2 = 00000000bfaff38a
!	Mem[0000000010081408] = ffff7d780dd4a978
	add	%i2,0x008,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010081408] = ffe67d030dd4a926
!	Mem[0000000030181410] = 9626555b, %l1 = 8f0bc83ea1a8578a
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 000000009626555b
!	Mem[00000000201c0001] = 91f0afd5, %l6 = 0000000000000070
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000f0000000ff
!	%l5 = ffffffff80492987, Mem[0000000010141408] = a76e61bd
	stha	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 298761bd
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 67e8c7b0, %l6 = 00000000000000f0
	ldsha	[%i4+%o5]0x88,%l6	! %l6 = ffffffffffffc7b0

p0_label_5:
!	Mem[0000000010041408] = 5ea5364fad982c1e, %l1 = 000000009626555b
	ldxa	[%i1+%o4]0x80,%l1	! %l1 = 5ea5364fad982c1e
!	Mem[00000000300c1400] = fd86919f, %l7 = 00000000a7740b98
	ldsha	[%i3+%g0]0x89,%l7	! %l7 = ffffffffffff919f
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010081408] = ffe67d03, %l5 = ffffffff80492987
	ldswa	[%i2+%o4]0x80,%l5	! %l5 = ffffffffffe67d03
!	Mem[00000000201c0000] = 91ffafd5, %l4 = deb06ddabe1563dd
	lduh	[%o0+%g0],%l4		! %l4 = 00000000000091ff
!	Mem[0000000030141400] = e7909c4d 086d6fdf, %l0 = 00000089, %l1 = ad982c1e
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 00000000086d6fdf 00000000e7909c4d
!	Mem[0000000030101408] = 599d9075, %l2 = 00000000bfaff38a
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = 00000000599d9075
!	Mem[00000000100c1400] = 3e1663dd, %l3 = 00000000a3d2d9bb
	ldsba	[%i3+%g0]0x88,%l3	! %l3 = ffffffffffffffdd
!	Mem[0000000030081410] = 8ef6b733, %l3 = ffffffffffffffdd
	lduwa	[%i2+%o5]0x81,%l3	! %l3 = 000000008ef6b733
!	Mem[00000000100c1400] = dd63163e, %l1 = 00000000e7909c4d
	lduh	[%i3+0x002],%l1		! %l1 = 000000000000163e
!	Starting 10 instruction Store Burst
!	Mem[0000000021800081] = ac91b20f, %l4 = 00000000000091ff
	ldstub	[%o3+0x081],%l4		! %l4 = 00000091000000ff

!	Check Point 1 for processor 0

	set	p0_check_pt_data_1,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000086d6fdf
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000163e
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000599d9075
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000008ef6b733
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000091
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffe67d03
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffc7b0
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffff919f
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 26de903b 03e8e6c8
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 4f752913 566c92f3
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1

!	Check Point 1 completed


p0_label_6:
!	%l7 = ffffffffffff919f, Mem[00000000100c1400] = 3e1663dd
	stha	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 3e16919f
!	%l5 = ffffffffffe67d03, Mem[0000000030101410] = 00000000
	stba	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 03000000
!	%f30 = c85a5f2c ea81b6ab, %l2 = 00000000599d9075
!	Mem[0000000030141420] = 58fb1d0ce4557670
	add	%i5,0x020,%g1
	stda	%f30,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030141420] = abfb810c2c5f5a70
!	Mem[0000000030041410] = 96ffffff, %l7 = ffffffffffff919f
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 00000096000000ff
!	Mem[000000001014143c] = 6a9c2c2b, %l1 = 000000000000163e, %asi = 80
	swapa	[%i5+0x03c]%asi,%l1	! %l1 = 000000006a9c2c2b
!	%f5  = 2752d5ed, Mem[0000000010141408] = 298761bd
	sta	%f5 ,[%i5+0x008]%asi	! Mem[0000000010141408] = 2752d5ed
!	%l0 = 00000000086d6fdf, Mem[0000000030001410] = 26de903b03e8e6c8
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000086d6fdf
!	Mem[0000000010081400] = 97db64d3, %l6 = ffffffffffffc7b0
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 00000097000000ff
!	Mem[00000000300c1400] = fd86919f, %l1 = 000000006a9c2c2b
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 00000000fd86919f
!	Starting 10 instruction Load Burst
!	%f14 = 341775dc, %f4  = 5cf4ec97 2752d5ed
	fitod	%f14,%f4 		! %f4  = 41ca0bba ee000000

p0_label_7:
!	Mem[0000000010081414] = 40a0b34d, %l3 = 000000008ef6b733
	ldsw	[%i2+0x014],%l3		! %l3 = 0000000040a0b34d
!	Mem[0000000010041428] = 93e8f9863028972c, %l7 = 0000000000000096
	ldxa	[%i1+0x028]%asi,%l7	! %l7 = 93e8f9863028972c
!	Mem[0000000010081408] = ffe67d030dd4a926, %l1 = 00000000fd86919f
	ldxa	[%i2+0x008]%asi,%l1	! %l1 = ffe67d030dd4a926
!	Mem[0000000030181400] = 9bb10a3e, %l4 = 0000000000000091
	ldsba	[%i6+%g0]0x89,%l4	! %l4 = 000000000000003e
!	Mem[0000000010081400] = d364dbff, %l7 = 93e8f9863028972c
	ldsha	[%i2+%g0]0x88,%l7	! %l7 = ffffffffffffdbff
!	Mem[00000000100c1410] = 5c13117e, %l2 = 00000000599d9075
	lduwa	[%i3+%o5]0x80,%l2	! %l2 = 000000005c13117e
!	Mem[0000000010001400] = d97effb0, %l7 = ffffffffffffdbff
	ldsba	[%i0+%g0]0x88,%l7	! %l7 = ffffffffffffffb0
!	%l6 = 0000000000000097, Mem[0000000010081428] = 85e5edce6bd78a02
	stx	%l6,[%i2+0x028]		! Mem[0000000010081428] = 0000000000000097
!	Mem[00000000300c1410] = 980b74a7, %l2 = 000000005c13117e
	lduwa	[%i3+%o5]0x89,%l2	! %l2 = 00000000980b74a7
!	Starting 10 instruction Store Burst
!	%l1 = ffe67d030dd4a926, Mem[0000000010081400] = ffdb64d3
	stwa	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 0dd4a926

p0_label_8:
!	Mem[0000000030101400] = b3562a47, %l7 = ffffffffffffffb0
	swapa	[%i4+%g0]0x89,%l7	! %l7 = 00000000b3562a47
!	%l6 = 0000000000000097, Mem[0000000010001400] = b0ff7ed9
	stba	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 97ff7ed9
!	%l7 = 00000000b3562a47, Mem[0000000010181400] = fdb9496c80492987
	stxa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000b3562a47
!	%l0 = 00000000086d6fdf, Mem[00000000201c0000] = 91ffafd5, %asi = 80
	stba	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = dfffafd5
!	Mem[0000000030001408] = ff3ef719, %l2 = 00000000980b74a7
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 00000000ff3ef719
!	%l0 = 086d6fdf, %l1 = 0dd4a926, Mem[0000000030101400] = ffffffb0 3c318787
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 086d6fdf 0dd4a926
!	Mem[0000000010141400] = ada57f64, %l0 = 00000000086d6fdf
	swapa	[%i5+%g0]0x80,%l0	! %l0 = 00000000ada57f64
!	%l2 = ff3ef719, %l3 = 40a0b34d, Mem[0000000030181408] = e676e08e f7bcdb60
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ff3ef719 40a0b34d
!	Mem[0000000030141408] = d9bbffa2, %l5 = ffffffffffe67d03
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 00000000d9bbffa2
!	Starting 10 instruction Load Burst
!	Mem[000000001014140c] = 2c05fff6, %l7 = 00000000b3562a47
	lduha	[%i5+0x00e]%asi,%l7	! %l7 = 000000000000fff6

p0_label_9:
!	Mem[0000000030041400] = 1f1755384f7bf710, %f12 = 9b91ca6c 573d6472
	ldda	[%i1+%g0]0x89,%f12	! %f12 = 1f175538 4f7bf710
!	Mem[00000000100c1408] = 5c375e6a, %l3 = 0000000040a0b34d
	ldswa	[%i3+%o4]0x80,%l3	! %l3 = 000000005c375e6a
!	Mem[0000000030001400] = e78184359e0ba66e, %f2  = 4f752913 566c92f3
	ldda	[%i0+%g0]0x89,%f2 	! %f2  = e7818435 9e0ba66e
!	Mem[0000000030001410] = df6f6d08, %l6 = 0000000000000097
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffffdf6f
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010081400] = 0dd4a926 959c094a ffe67d03 0dd4a926
!	Mem[0000000010081410] = 8f1a5501 40a0b34d 4e7b6629 01ff6647
!	Mem[0000000010081420] = a509aa5e d5cf6cf8 00000000 00000097
!	Mem[0000000010081430] = 8fbbc3a2 ff72c64a 2ce1bd8e daa49daa
	ldda	[%i2]ASI_BLK_P,%f0	! Block Load from 0000000010081400
!	Mem[0000000030141400] = e7909c4d 086d6fdf, %l0 = ada57f64, %l1 = 0dd4a926
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 00000000086d6fdf 00000000e7909c4d
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 00000000086d6fdf
	setx	0x45e007b062ca458f,%g7,%l0 ! %l0 = 45e007b062ca458f
!	%l1 = 00000000e7909c4d
	setx	0x982517d045829504,%g7,%l1 ! %l1 = 982517d045829504
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 45e007b062ca458f
	setx	0x1c2aaa7039a840ab,%g7,%l0 ! %l0 = 1c2aaa7039a840ab
!	%l1 = 982517d045829504
	setx	0x217ab71fe0a79c1d,%g7,%l1 ! %l1 = 217ab71fe0a79c1d
!	Mem[0000000010081400] = 0dd4a926, %l1 = 217ab71fe0a79c1d
	ldsb	[%i2+0x001],%l1		! %l1 = ffffffffffffffd4
!	Mem[0000000010001408] = f80b484f, %l3 = 000000005c375e6a
	lduha	[%i0+%o4]0x80,%l3	! %l3 = 000000000000f80b
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000fff6, Mem[000000001014143a] = 6cc1ff49, %asi = 80
	stha	%l7,[%i5+0x03a]%asi	! Mem[0000000010141438] = 6cc1fff6

p0_label_10:
!	%l0 = 39a840ab, %l1 = ffffffd4, Mem[0000000010001410] = e5bca3bd 76dd34c1
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 39a840ab ffffffd4
!	%f18 = a62a7b3d 65032b63, %l6 = ffffffffffffdf6f
!	Mem[0000000010181438] = 3ebec9a2463df772
	add	%i6,0x038,%g1
	stda	%f18,[%g1+%l6]ASI_PST16_P ! Mem[0000000010181438] = a62a7b3d65032b63
!	Mem[00000000300c1400] = 2b2c9c6a, %l6 = ffffffffffffdf6f
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 000000002b2c9c6a
!	%f26 = 35c884b1 36cccd84, %l7 = 000000000000fff6
!	Mem[0000000010141428] = 4d15f728a5f9d78e
	add	%i5,0x028,%g1
	stda	%f26,[%g1+%l7]ASI_PST8_P ! Mem[0000000010141428] = 35c884b1a5cccd8e
!	Mem[000000001004141b] = 5c844f11, %l2 = 00000000ff3ef719
	ldstuba	[%i1+0x01b]%asi,%l2	! %l2 = 00000011000000ff
!	%f28 = 2d1ea416 61c67279, Mem[0000000010181408] = e7613be7 fec6f285
	stda	%f28,[%i6+%o4]0x88	! Mem[0000000010181408] = 2d1ea416 61c67279
!	Mem[0000000030141408] = 037de6ff, %l6 = 000000002b2c9c6a
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 00000000037de6ff
!	Mem[0000000030081400] = eab53620, %l2 = 0000000000000011
	swapa	[%i2+%g0]0x89,%l2	! %l2 = 00000000eab53620
!	%l7 = 000000000000fff6, Mem[000000001010142d] = eb0e3d12, %asi = 80
	stba	%l7,[%i4+0x02d]%asi	! Mem[000000001010142c] = ebf63d12
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 0a2dbb34, %l1 = ffffffffffffffd4
	lduba	[%o1+0x000]%asi,%l1	! %l1 = 000000000000000a

!	Check Point 2 for processor 0

	set	p0_check_pt_data_2,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 1c2aaa7039a840ab
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000000a
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000eab53620
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000f80b
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000003e
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000037de6ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 000000000000fff6
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 0dd4a926 959c094a
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffe67d03 0dd4a926
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 8f1a5501 40a0b34d
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 4e7b6629 01ff6647
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = a509aa5e d5cf6cf8
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 00000097
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 8fbbc3a2 ff72c64a
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 2ce1bd8e daa49daa
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1

!	Check Point 2 completed


p0_label_11:
!	Mem[0000000030001408] = 980b74a7, %f6  = 4e7b6629
	lda	[%i0+%o4]0x81,%f6 	! %f6 = 980b74a7
!	Mem[0000000010101410] = b0c7e867 61fa6bf3, %l2 = eab53620, %l3 = 0000f80b
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 00000000b0c7e867 0000000061fa6bf3
!	Mem[0000000010101400] = 8a57a8a1, %l7 = 000000000000fff6
	ldsba	[%i4+%g0]0x80,%l7	! %l7 = ffffffffffffff8a
!	Mem[0000000010181428] = 5804006a, %l7 = ffffffffffffff8a
	ldsha	[%i6+0x028]%asi,%l7	! %l7 = 0000000000005804
!	Mem[0000000010141408] = edd55227, %l4 = 000000000000003e
	lduba	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000027
!	Mem[0000000010001400] = 97ff7ed9, %f26 = 35c884b1
	lda	[%i0+%g0]0x80,%f26	! %f26 = 97ff7ed9
!	Mem[0000000010181400] = 472a56b3, %l5 = 00000000d9bbffa2
	lduha	[%i6+%g0]0x80,%l5	! %l5 = 000000000000472a
!	Mem[00000000100c1400] = 9f91163ed0eab90c, %f30 = c85a5f2c ea81b6ab
	ldda	[%i3+%g0]0x80,%f30	! %f30 = 9f91163e d0eab90c
!	Mem[0000000010181400] = 472a56b3, %f11 = 00000097
	lda	[%i6+%g0]0x80,%f11	! %f11 = 472a56b3
!	Starting 10 instruction Store Burst
!	%l6 = 00000000037de6ff, Mem[0000000030081408] = 3d7b2aa6
	stha	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 3d7be6ff

p0_label_12:
!	%f6  = 980b74a7 01ff6647, %l5 = 000000000000472a
!	Mem[0000000030041418] = 16a66f51f4dc12c7
	add	%i1,0x018,%g1
	stda	%f6,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030041418] = 16a66f51a7740b98
!	%l4 = 00000027, %l5 = 0000472a, Mem[00000000300c1408] = d9bbffa2 bbd9d2a3
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000027 0000472a
!	%f13 = ff72c64a, Mem[0000000010001410] = ab40a839
	sta	%f13,[%i0+%o5]0x88	! Mem[0000000010001410] = ff72c64a
!	%f2  = ffe67d03 0dd4a926, Mem[0000000030001408] = 980b74a7 8a9cf0df
	stda	%f2 ,[%i0+%o4]0x81	! Mem[0000000030001408] = ffe67d03 0dd4a926
!	%l7 = 0000000000005804, Mem[00000000218000c0] = 1365cd54, %asi = 80
	stha	%l7,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 5804cd54
!	%l7 = 0000000000005804, Mem[0000000030181400] = 3e0ab19b81d10d02
	stxa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000005804
!	Mem[0000000030081410] = 8ef6b733, %l0 = 1c2aaa7039a840ab
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 0000008e000000ff
!	%l1 = 000000000000000a, Mem[00000000100c1408] = 5c375e6a
	stba	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0a375e6a
!	%f8  = a509aa5e d5cf6cf8, %l1 = 000000000000000a
!	Mem[0000000010101400] = 8a57a8a13ec80b8f
	stda	%f8,[%i4+%l1]ASI_PST16_PL ! Mem[0000000010101400] = 8a57cfd53ec809a5
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 6a5e370a, %l2 = 00000000b0c7e867
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = 000000000000000a

p0_label_13:
!	Mem[0000000010101410] = 67e8c7b0, %f1  = 959c094a
	lda	[%i4+%o5]0x88,%f1 	! %f1 = 67e8c7b0
!	Mem[0000000030141408] = 2b2c9c6a, %l3 = 0000000061fa6bf3
	lduha	[%i5+%o4]0x89,%l3	! %l3 = 0000000000009c6a
!	Mem[0000000030001400] = 6ea60b9e, %l4 = 0000000000000027
	lduba	[%i0+%g0]0x81,%l4	! %l4 = 000000000000006e
!	Mem[0000000010141410] = 922ff31f, %l1 = 000000000000000a
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = ffffffff922ff31f
!	Mem[0000000010141410] = 922ff31f, %l7 = 0000000000005804
	ldsha	[%i5+%o5]0x80,%l7	! %l7 = ffffffffffff922f
!	Mem[0000000010001408] = 4f480bf8, %f28 = 2d1ea416
	lda	[%i0+%o4]0x88,%f28	! %f28 = 4f480bf8
!	Mem[0000000010081410] = 4db3a04001551a8f, %f22 = a87f4fc3 9f65f7e5
	ldda	[%i2+%o5]0x88,%f22	! %f22 = 4db3a040 01551a8f
!	Mem[0000000010041400] = 05b8d534 ce9d913e, %l0 = 0000008e, %l1 = 922ff31f
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 00000000ce9d913e 0000000005b8d534
!	Mem[00000000201c0000] = dfffafd5, %l3 = 0000000000009c6a
	ldsb	[%o0+%g0],%l3		! %l3 = ffffffffffffffdf
!	Starting 10 instruction Store Burst
!	%f21 = e9251f9b, Mem[000000001004143c] = 01af9aa5
	sta	%f21,[%i1+0x03c]%asi	! Mem[000000001004143c] = e9251f9b

p0_label_14:
!	%f30 = 9f91163e d0eab90c, Mem[0000000030001400] = 9e0ba66e e7818435
	stda	%f30,[%i0+%g0]0x89	! Mem[0000000030001400] = 9f91163e d0eab90c
!	%f20 = 8ef6b733 e9251f9b, Mem[0000000010101408] = 77c1d4ab 82f42373
	stda	%f20,[%i4+%o4]0x80	! Mem[0000000010101408] = 8ef6b733 e9251f9b
!	Mem[0000000010141410] = 922ff31f, %l4 = 000000000000006e
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 00000092000000ff
!	%l4 = 0000000000000092, Mem[00000000300c1400] = ffffdf6f5caf5830
	stxa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000092
!	Mem[0000000030081410] = 33b7f6ff, %l5 = 000000000000472a
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030001400] = 0cb9ead0, %l1 = 0000000005b8d534
	swapa	[%i0+%g0]0x81,%l1	! %l1 = 000000000cb9ead0
!	%l0 = 00000000ce9d913e, Mem[0000000010041413] = 6a5e375c
	stb	%l0,[%i1+0x013]		! Mem[0000000010041410] = 6a5e373e
!	%l1 = 000000000cb9ead0, Mem[0000000030181410] = a1a8578a81f58ff8
	stxa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000000cb9ead0
!	Mem[00000000300c1410] = a7740b98, %l6 = 00000000037de6ff
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 000000a7000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010141400] = 086d6fdf 10111074 2752d5ed 2c05fff6
!	Mem[0000000010141410] = ff2ff31f 84d45987 908a7c20 32ea7f0d
!	Mem[0000000010141420] = 0e0a2639 da94f32f 35c884b1 a5cccd8e
!	Mem[0000000010141430] = 621ebbdd fe4b4cc8 6cc1fff6 0000163e
	ldda	[%i5]ASI_BLK_AIUP,%f16	! Block Load from 0000000010141400

p0_label_15:
!	Mem[000000001004141c] = 6004a862, %l5 = 00000000000000ff
	ldsh	[%i1+0x01e],%l5		! %l5 = ffffffffffffa862
!	Mem[0000000030101408] = 599d9075, %l4 = 0000000000000092
	lduwa	[%i4+%o4]0x81,%l4	! %l4 = 00000000599d9075
!	Mem[0000000030101408] = ac35f303 75909d59, %l4 = 599d9075, %l5 = ffffa862
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 0000000075909d59 00000000ac35f303
!	Mem[0000000030141410] = df1352cc8ffe275d, %f8  = a509aa5e d5cf6cf8
	ldda	[%i5+%o5]0x81,%f8 	! %f8  = df1352cc 8ffe275d
!	Mem[0000000030001408] = ffe67d03, %l0 = 00000000ce9d913e
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 000000000000ffe6
!	Mem[0000000030101400] = 086d6fdf, %l7 = ffffffffffff922f
	lduwa	[%i4+%g0]0x89,%l7	! %l7 = 00000000086d6fdf
!	Mem[0000000030101400] = 086d6fdf, %l3 = ffffffffffffffdf
	lduwa	[%i4+%g0]0x89,%l3	! %l3 = 00000000086d6fdf
!	Mem[0000000030081408] = ffe67b3d, %l3 = 00000000086d6fdf
	ldswa	[%i2+%o4]0x81,%l3	! %l3 = ffffffffffe67b3d
!	Mem[0000000030141410] = df1352cc8ffe275d, %f14 = 2ce1bd8e daa49daa
	ldda	[%i5+%o5]0x81,%f14	! %f14 = df1352cc 8ffe275d
!	Starting 10 instruction Store Burst
!	%l7 = 00000000086d6fdf, Mem[0000000030101400] = df6f6d08
	stba	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = df6f6d08

!	Check Point 3 for processor 0

	set	p0_check_pt_data_3,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000ffe6
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000cb9ead0
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000000a
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffe67b3d
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000075909d59
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ac35f303
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000a7
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000086d6fdf
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 0dd4a926 67e8c7b0
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffe67d03 0dd4a926
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 8f1a5501 40a0b34d
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 980b74a7 01ff6647
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = df1352cc 8ffe275d
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 472a56b3
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = df1352cc 8ffe275d
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 086d6fdf 10111074
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 2752d5ed 2c05fff6
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x90],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ff2ff31f 84d45987
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x98],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 908a7c20 32ea7f0d
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa0],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 0e0a2639 da94f32f
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xa8],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 35c884b1 a5cccd8e
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 621ebbdd fe4b4cc8
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xb8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 6cc1fff6 0000163e
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 3 completed


p0_label_16:
!	%l2 = 000000000000000a, Mem[0000000030141408] = 2b2c9c6a
	stba	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 2b2c9c0a
!	Mem[0000000010041428] = 93e8f986, %l5 = 00000000ac35f303
	swap	[%i1+0x028],%l5		! %l5 = 0000000093e8f986
!	%f9  = 8ffe275d, Mem[00000000100c1408] = 6a5e370a
	sta	%f9 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 8ffe275d
!	Mem[0000000030041408] = a738dbaf, %l3 = ffffffffffe67b3d
	swapa	[%i1+%o4]0x81,%l3	! %l3 = 00000000a738dbaf
!	Mem[0000000010001412] = 4ac672ff, %l4 = 0000000075909d59
	ldstuba	[%i0+0x012]%asi,%l4	! %l4 = 00000072000000ff
!	%l1 = 000000000cb9ead0, Mem[0000000010101408] = 33b7f68e
	stba	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 33b7f6d0
!	%l2 = 000000000000000a, Mem[0000000010081408] = ffe67d03
	stba	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 0ae67d03
	membar	#Sync			! Added by membar checker (4)
!	%l2 = 000000000000000a, Mem[0000000010141400] = df6f6d08
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = df6f6d0a
!	%l6 = 00000000000000a7, Mem[0000000010041408] = 4f36a55e
	stha	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 4f3600a7
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = 5804cd54, %l6 = 00000000000000a7
	lduh	[%o3+0x0c0],%l6		! %l6 = 0000000000005804

p0_label_17:
!	Mem[0000000010101410] = b0c7e867, %l6 = 0000000000005804
	lduba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000b0
!	Mem[0000000030081410] = fff6b733, %l7 = 00000000086d6fdf
	lduwa	[%i2+%o5]0x81,%l7	! %l7 = 00000000fff6b733
!	Mem[0000000010081400] = 0dd4a926 959c094a 0ae67d03 0dd4a926
!	Mem[0000000010081410] = 8f1a5501 40a0b34d 4e7b6629 01ff6647
!	Mem[0000000010081420] = a509aa5e d5cf6cf8 00000000 00000097
!	Mem[0000000010081430] = 8fbbc3a2 ff72c64a 2ce1bd8e daa49daa
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000010041400] = 05b8d534 ce9d913e, %l4 = 00000072, %l5 = 93e8f986
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 00000000ce9d913e 0000000005b8d534
!	Mem[000000001000143c] = bb5ee3d7, %l0 = 0000ffe6, %l6 = 000000b0
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 00000000bb5ee3d7
!	Mem[0000000010141404] = 10111074, %f3  = 0dd4a926
	lda	[%i5+0x004]%asi,%f3 	! %f3 = 10111074
!	Mem[0000000010041408] = 4f3600a7, %l4 = 00000000ce9d913e
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000a7
!	Mem[0000000030041410] = ffffffff, %l6 = 00000000bb5ee3d7
	ldswa	[%i1+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041400] = 3e919dce, %l4 = 00000000000000a7
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 000000000000003e
!	Starting 10 instruction Store Burst
!	Mem[0000000010081406] = 959c094a, %l5 = 0000000005b8d534
	ldstub	[%i2+0x006],%l5		! %l5 = 00000009000000ff

p0_label_18:
!	Mem[00000000300c1408] = 27000000, %l3 = 00000000a738dbaf
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 00000027000000ff
!	%f16 = 0dd4a926 959c094a 0ae67d03 0dd4a926
!	%f20 = 8f1a5501 40a0b34d 4e7b6629 01ff6647
!	%f24 = a509aa5e d5cf6cf8 00000000 00000097
!	%f28 = 8fbbc3a2 ff72c64a 2ce1bd8e daa49daa
	stda	%f16,[%i2]ASI_COMMIT_P	! Block Store to 0000000010081400
!	Mem[000000001004143c] = e9251f9b, %l4 = 000000000000003e
	swap	[%i1+0x03c],%l4		! %l4 = 00000000e9251f9b
!	%l6 = ffffffff, %l7 = fff6b733, Mem[0000000030001408] = ffe67d03 0dd4a926
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff fff6b733
!	%f4  = 8f1a5501 40a0b34d, %l0 = 000000000000ffe6
!	Mem[0000000030181408] = ff3ef71940a0b34d
	add	%i6,0x008,%g1
	stda	%f4,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030181408] = ff3ea0400155b34d
!	%l6 = ffffffff, %l7 = fff6b733, Mem[0000000030041400] = 4f7bf710 1f175538
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff fff6b733
!	%l0 = 0000ffe6, %l1 = 0cb9ead0, Mem[0000000010001408] = f80b484f dc751734
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000ffe6 0cb9ead0
!	%l3 = 0000000000000027, Mem[0000000010181408] = 61c67279
	stba	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 61c67227
!	Mem[00000000100c1438] = 8dff72e3, %l2 = 0000000a, %l6 = ffffffff
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l2,%l6	! %l6 = 000000008dff72e3
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 33b7f6ffffffffff, %l0 = 000000000000ffe6
	ldxa	[%i0+%o4]0x89,%l0	! %l0 = 33b7f6ffffffffff

p0_label_19:
!	Mem[0000000010001408] = 0000ffe6, %l4 = 00000000e9251f9b
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = 000000000000ffe6
!	Mem[0000000030041408] = 3d7be6ff, %l5 = 0000000000000009
	ldsba	[%i1+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000201c0000] = dfffafd5, %l0 = 33b7f6ffffffffff
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000df
!	Mem[0000000010041410] = 3e375e6a, %l3 = 0000000000000027
	lduba	[%i1+%o5]0x88,%l3	! %l3 = 000000000000006a
!	Mem[0000000010181408] = 61c67227, %l4 = 000000000000ffe6
	lduba	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000027
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010081410] = 01551a8f, %l3 = 000000000000006a
	lduwa	[%i2+%o5]0x88,%l3	! %l3 = 0000000001551a8f
!	Mem[0000000030101410] = 03000000, %l4 = 0000000000000027
	ldsha	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000300
!	Mem[0000000030081410] = 33b7f6ff, %f22 = 4e7b6629
	lda	[%i2+%o5]0x89,%f22	! %f22 = 33b7f6ff
!	Mem[0000000030001408] = ffffffff, %l7 = 00000000fff6b733
	lduwa	[%i0+%o4]0x81,%l7	! %l7 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000300, Mem[0000000030001408] = fffffffffff6b733
	stxa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000300

p0_label_20:
!	%l7 = 00000000ffffffff, Mem[0000000010181400] = b3562a47
	stha	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = b356ffff
!	%l5 = ffffffffffffffff, Mem[0000000030141410] = df1352cc
	stba	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = ff1352cc
!	%l6 = 000000008dff72e3, Mem[0000000010041400] = 3e919dce
	stwa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 8dff72e3
!	%l6 = 000000008dff72e3, Mem[00000000100c1400] = 3e16919f
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 3e1672e3
!	%l5 = ffffffffffffffff, Mem[00000000300c1400] = 00000000
	stha	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffff0000
!	%l6 = 000000008dff72e3, Mem[00000000211c0001] = ff6fe4d2, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffe3e4d2
!	%l1 = 000000000cb9ead0, Mem[00000000100c1424] = e08281c1
	stb	%l1,[%i3+0x024]		! Mem[00000000100c1424] = d08281c1
!	Mem[0000000030001400] = 34d5b805, %l1 = 000000000cb9ead0
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 00000005000000ff
!	Mem[0000000030141400] = 086d6fdf, %l6 = 000000008dff72e3
	swapa	[%i5+%g0]0x89,%l6	! %l6 = 00000000086d6fdf
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 0458000000000000, %l0 = 00000000000000df
	ldxa	[%i6+%g0]0x89,%l0	! %l0 = 0458000000000000

!	Check Point 4 for processor 0

	set	p0_check_pt_data_4,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0458000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000005
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000001551a8f
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000300
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000086d6fdf
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffe67d03 10111074
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 8f1a5501 40a0b34d
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 0dd4a926 959c094a
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x58],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 0ae67d03 0dd4a926
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 8f1a5501 40a0b34d
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x68],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 33b7f6ff 01ff6647
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x70],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = a509aa5e d5cf6cf8
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x78],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 00000097
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x80],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 8fbbc3a2 ff72c64a
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x88],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 2ce1bd8e daa49daa
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 4 completed


p0_label_21:
!	Mem[00000000300c1408] = 000000ff, %l3 = 0000000001551a8f
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = 8dff72e3, %l0 = 0458000000000000
	ldsha	[%i1+0x002]%asi,%l0	! %l0 = 00000000000072e3
!	Mem[0000000030181408] = ff3ea040, %l5 = ffffffffffffffff
	lduha	[%i6+%o4]0x81,%l5	! %l5 = 000000000000ff3e
!	Mem[0000000010141410] = 1ff32fff, %l1 = 0000000000000005
	lduwa	[%i5+%o5]0x88,%l1	! %l1 = 000000001ff32fff
!	Mem[00000000211c0000] = ffe3e4d2, %l6 = 00000000086d6fdf
	ldub	[%o2+0x001],%l6		! %l6 = 00000000000000e3
!	Mem[0000000030001400] = ffb8d5343e16919f, %l3 = 00000000000000ff
	ldxa	[%i0+%g0]0x81,%l3	! %l3 = ffb8d5343e16919f
!	Mem[0000000030101410] = 00000003, %l4 = 0000000000000300
	lduwa	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000003
!	Mem[0000000010041438] = 3b52db8a0000003e, %f24 = a509aa5e d5cf6cf8
	ldd	[%i1+0x038],%f24	! %f24 = 3b52db8a 0000003e
!	Mem[0000000030081408] = ffe67b3d, %l1 = 000000001ff32fff
	lduha	[%i2+%o4]0x81,%l1	! %l1 = 000000000000ffe6
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ffffffff, Mem[0000000010141410] = 1ff32fff
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffff

p0_label_22:
!	%l5 = 000000000000ff3e, Mem[0000000010001434] = 5b4a6750, %asi = 80
	stwa	%l5,[%i0+0x034]%asi	! Mem[0000000010001434] = 0000ff3e
!	%f18 = 0ae67d03 0dd4a926, Mem[0000000010081400] = 26a9d40d 4a099c95
	stda	%f18,[%i2+%g0]0x88	! Mem[0000000010081400] = 0ae67d03 0dd4a926
!	%l4 = 0000000000000003, Mem[0000000010001400] = 8c8e1f81d97eff97
	stxa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000003
!	%f28 = 8fbbc3a2, Mem[0000000030081400] = 11000000
	sta	%f28,[%i2+%g0]0x81	! Mem[0000000030081400] = 8fbbc3a2
!	%l3 = ffb8d5343e16919f, Mem[0000000030181400] = 00000000
	stwa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 3e16919f
!	%l0 = 00000000000072e3, Mem[0000000020800040] = e9e6e589
	stb	%l0,[%o1+0x040]		! Mem[0000000020800040] = e3e6e589
!	Mem[00000000300c1400] = ffff0000, %l2 = 000000000000000a
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000ffff0000
!	Mem[0000000020800041] = e3e6e589, %l7 = 00000000ffffffff
	ldstuba	[%o1+0x041]%asi,%l7	! %l7 = 000000e6000000ff
!	Mem[0000000030101400] = df6f6d08, %l0 = 00000000000072e3
	swapa	[%i4+%g0]0x81,%l0	! %l0 = 00000000df6f6d08
!	Starting 10 instruction Load Burst
!	Mem[000000001008141c] = 01ff6647, %l1 = 000000000000ffe6
	ldsh	[%i2+0x01e],%l1		! %l1 = 0000000000006647

p0_label_23:
!	Mem[0000000010081410] = 4db3a040 01551a8f, %l0 = df6f6d08, %l1 = 00006647
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 0000000001551a8f 000000004db3a040
!	Mem[0000000010141408] = edd55227, %f8  = df1352cc
	lda	[%i5+%o4]0x88,%f8 	! %f8 = edd55227
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030141400] = e372ff8d 4d9c90e7 0a9c2c2b 9f5e6240
!	Mem[0000000030141410] = ff1352cc 8ffe275d 4bbe3cde 1468c5b9
!	Mem[0000000030141420] = abfb810c 2c5f5a70 d3f1a09c 1b8734ed
!	Mem[0000000030141430] = baf9b00d 1a53d335 e697de10 d004a503
	ldda	[%i5]ASI_BLK_SL,%f16	! Block Load from 0000000030141400
!	Mem[0000000020800040] = e3ffe589, %l1 = 000000004db3a040
	ldsb	[%o1+0x041],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010141410] = ffffffff, %l7 = 00000000000000e6
	lduha	[%i5+%o5]0x80,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030141400] = e372ff8d 4d9c90e7 0a9c2c2b 9f5e6240
!	Mem[0000000030141410] = ff1352cc 8ffe275d 4bbe3cde 1468c5b9
!	Mem[0000000030141420] = abfb810c 2c5f5a70 d3f1a09c 1b8734ed
!	Mem[0000000030141430] = baf9b00d 1a53d335 e697de10 d004a503
	ldda	[%i5]ASI_BLK_AIUS,%f0	! Block Load from 0000000030141400
!	Mem[0000000010001410] = ffffc64a, %l4 = 0000000000000003
	lduba	[%i0+%o5]0x88,%l4	! %l4 = 000000000000004a
!	Mem[00000000100c141c] = 52529726, %l2 = 00000000ffff0000
	lduwa	[%i3+0x01c]%asi,%l2	! %l2 = 0000000052529726
!	Mem[0000000010001428] = 000353ac, %f25 = 0c81fbab
	lda	[%i0+0x028]%asi,%f25	! %f25 = 000353ac
!	Starting 10 instruction Store Burst
!	%f24 = 705a5f2c, %f21 = cc5213ff, %f16 = e7909c4d 8dff72e3
	fsmuld	%f24,%f21,%f16		! %f16 = c7a66664 15a21a80

p0_label_24:
!	%l4 = 0000004a, %l5 = 0000ff3e, Mem[00000000100c1408] = 8ffe275d 6108c224
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000004a 0000ff3e
!	%l3 = ffb8d5343e16919f, Mem[0000000010141408] = edd55227
	stha	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = edd5919f
!	Mem[000000001014140c] = 2c05fff6, %l2 = 52529726, %l7 = 0000ffff
	add	%i5,0x0c,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 000000002c05fff6
!	%f26 = ed34871b 9ca0f1d3, Mem[0000000030041410] = ffffffff ffffffff
	stda	%f26,[%i1+%o5]0x81	! Mem[0000000030041410] = ed34871b 9ca0f1d3
!	%f30 = 03a504d0 10de97e6, %l2 = 0000000052529726
!	Mem[00000000300c1430] = 9703e30bbbeddb77
	add	%i3,0x030,%g1
	stda	%f30,[%g1+%l2]ASI_PST32_SL ! Mem[00000000300c1430] = 9703e30bd004a503
!	Mem[0000000030181410] = 00000000, %l4 = 000000000000004a
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101400] = e3720000, %l7 = 000000002c05fff6
	swapa	[%i4+%g0]0x89,%l7	! %l7 = 00000000e3720000
!	%f26 = ed34871b, Mem[0000000010081400] = 26a9d40d
	sta	%f26,[%i2+%g0]0x80	! Mem[0000000010081400] = ed34871b
	membar	#Sync			! Added by membar checker (7)
!	%f20 = 5d27fe8f cc5213ff, Mem[0000000030141410] = cc5213ff 5d27fe8f
	stda	%f20,[%i5+%o5]0x89	! Mem[0000000030141410] = 5d27fe8f cc5213ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = b0c7e867, %f0  = e372ff8d
	lda	[%i4+%o5]0x80,%f0 	! %f0 = b0c7e867

p0_label_25:
!	Mem[0000000030001408] = 00000000, %l2 = 0000000052529726
	ldsba	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = 000000a2, %l0 = 0000000001551a8f
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 75909d59, %l6 = 00000000000000e3
	ldswa	[%i4+%o4]0x89,%l6	! %l6 = 0000000075909d59
!	Mem[0000000010101400] = 8a57cfd5, %l0 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l0	! %l0 = ffffffffffffff8a
!	Mem[0000000010181408] = 2772c661, %l6 = 0000000075909d59
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 000000002772c661
!	Mem[000000001014143c] = 0000163e, %l5 = 000000000000ff3e
	ldub	[%i5+0x03d],%l5		! %l5 = 0000000000000000
!	Mem[0000000010081400] = ed34871b, %l5 = 0000000000000000
	lduw	[%i2+%g0],%l5		! %l5 = 00000000ed34871b
!	Mem[0000000030081410] = 33b7f6ff, %l3 = ffb8d5343e16919f
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 0000000033b7f6ff
!	Mem[0000000030001400] = ffb8d5343e16919f, %f30 = 03a504d0 10de97e6
	ldda	[%i0+%g0]0x81,%f30	! %f30 = ffb8d534 3e16919f
!	Starting 10 instruction Store Burst
!	%f10 = d3f1a09c 1b8734ed, Mem[0000000010181400] = b356ffff 00000000
	stda	%f10,[%i6+%g0]0x88	! Mem[0000000010181400] = d3f1a09c 1b8734ed

!	Check Point 5 for processor 0

	set	p0_check_pt_data_5,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffff8a
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000033b7f6ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ed34871b
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000002772c661
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000e3720000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = b0c7e867 4d9c90e7
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 0a9c2c2b 9f5e6240
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff1352cc 8ffe275d
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 4bbe3cde 1468c5b9
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = abfb810c 2c5f5a70
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = d3f1a09c 1b8734ed
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = baf9b00d 1a53d335
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = e697de10 d004a503
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = c7a66664 15a21a80
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 40625e9f 2b2c9c0a
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x98],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 5d27fe8f cc5213ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0xa0],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = b9c56814 de3cbe4b
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa8],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 705a5f2c 000353ac
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xb0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ed34871b 9ca0f1d3
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb8],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 35d3531a 0db0f9ba
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xc0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ffb8d534 3e16919f
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 5 completed


p0_label_26:
!	%f18 = 40625e9f 2b2c9c0a, Mem[0000000010101408] = d0f6b733 e9251f9b
	stda	%f18,[%i4+%o4]0x80	! Mem[0000000010101408] = 40625e9f 2b2c9c0a
!	Mem[000000001010140c] = 2b2c9c0a, %l7 = 00000000e3720000, %asi = 80
	swapa	[%i4+0x00c]%asi,%l7	! %l7 = 000000002b2c9c0a
!	%l7 = 000000002b2c9c0a, Mem[0000000010141408] = 9f91d5ed2c05fff6, %asi = 80
	stxa	%l7,[%i5+0x008]%asi	! Mem[0000000010141408] = 000000002b2c9c0a
!	%f20 = 5d27fe8f cc5213ff, Mem[0000000010001408] = 0000ffe6 0cb9ead0
	stda	%f20,[%i0+%o4]0x80	! Mem[0000000010001408] = 5d27fe8f cc5213ff
!	Mem[0000000030141400] = 8dff72e3, %l3 = 0000000033b7f6ff
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 000000e3000000ff
!	%l6 = 000000002772c661, Mem[0000000010141430] = 621ebbddfe4b4cc8, %asi = 80
	stxa	%l6,[%i5+0x030]%asi	! Mem[0000000010141430] = 000000002772c661
!	%l6 = 000000002772c661, Mem[0000000010001436] = 0000ff3e
	sth	%l6,[%i0+0x036]		! Mem[0000000010001434] = 0000c661
!	Mem[00000000100c1410] = 5c13117e, %l0 = ffffffffffffff8a
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 000000005c13117e
!	%l1 = ffffffffffffffff, Mem[0000000030001410] = df6f6d0800000000
	stxa	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000ff, %l6 = 000000002772c661
	lduwa	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_27:
!	Mem[00000000100c1400] = e372163e, %l6 = 00000000000000ff
	ldsba	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffffffe3
!	Mem[0000000030001410] = ffffffff, %l7 = 000000002b2c9c0a
	lduha	[%i0+%o5]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010181400] = ed34871b, %l1 = ffffffffffffffff
	lduba	[%i6+%g0]0x80,%l1	! %l1 = 00000000000000ed
!	Mem[0000000010101408] = 40625e9f e3720000, %l6 = ffffffe3, %l7 = 0000ffff
	ldda	[%i4+%o4]0x80,%l6	! %l6 = 0000000040625e9f 00000000e3720000
!	Mem[0000000010101408] = 9f5e6240, %l0 = 000000005c13117e
	lduwa	[%i4+%o4]0x88,%l0	! %l0 = 000000009f5e6240
!	Mem[0000000030141410] = ff1352cc8ffe275d, %l4 = 0000000000000000
	ldxa	[%i5+%o5]0x81,%l4	! %l4 = ff1352cc8ffe275d
!	Mem[00000000100c1430] = 3b54f316, %l0 = 000000009f5e6240
	lduh	[%i3+0x032],%l0		! %l0 = 000000000000f316
!	Mem[0000000030041408] = ffe67b3d8ebce0f2, %f26 = ed34871b 9ca0f1d3
	ldda	[%i1+%o4]0x81,%f26	! %f26 = ffe67b3d 8ebce0f2
!	Mem[0000000010141408] = 0a9c2c2b 00000000, %l2 = 00000000, %l3 = 000000e3
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000 000000000a9c2c2b
!	Starting 10 instruction Store Burst
!	%l4 = ff1352cc8ffe275d, Mem[00000000100c1410] = 0131e0ed8affffff
	stxa	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff1352cc8ffe275d

p0_label_28:
!	%l2 = 0000000000000000, Mem[0000000010001408] = 8ffe275d
	stwa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	%l4 = 8ffe275d, %l5 = ed34871b, Mem[0000000010101408] = 9f5e6240 000072e3
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 8ffe275d ed34871b
!	%l6 = 40625e9f, %l7 = e3720000, Mem[0000000010001400] = 00000003 00000000
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 40625e9f e3720000
!	%l0 = 0000f316, %l1 = 000000ed, Mem[0000000010001408] = 00000000 ff1352cc
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000f316 000000ed
!	Mem[0000000010141408] = 00000000, %l1 = 00000000000000ed
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c141c] = 52529726, %l5 = ed34871b, %l5 = ed34871b
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 0000000052529726
!	%f24 = 705a5f2c, Mem[00000000100c1408] = 0000004a
	sta	%f24,[%i3+%o4]0x88	! Mem[00000000100c1408] = 705a5f2c
!	%l6 = 0000000040625e9f, Mem[000000001010143a] = 9430fa40, %asi = 80
	stha	%l6,[%i4+0x03a]%asi	! Mem[0000000010101438] = 94305e9f
!	%l5 = 0000000052529726, Mem[0000000030101410] = 03000000e73b61e7
	stxa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000052529726
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 980b74ff, %l5 = 0000000052529726
	lduwa	[%i3+%o5]0x89,%l5	! %l5 = 00000000980b74ff

p0_label_29:
!	%l2 = 00000000, %l3 = 0a9c2c2b, Mem[0000000030081400] = 8fbbc3a2 00b05a62
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 0a9c2c2b
!	Mem[0000000030001410] = ffffffff ffffffff, %l0 = 0000f316, %l1 = 00000000
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010041400] = 8dff72e334d5b805, %l4 = ff1352cc8ffe275d
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = 8dff72e334d5b805
!	Mem[0000000020800000] = 0a2dbb34, %l0 = 00000000ffffffff
	ldsba	[%o1+0x001]%asi,%l0	! %l0 = 000000000000002d
!	%l1 = 00000000ffffffff, Mem[0000000010141408] = ed0000002b2c9c0a
	stxa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000ffffffff
!	Mem[0000000010141410] = ffffffff, %f3  = 9f5e6240
	lda	[%i5+%o5]0x88,%f3 	! %f3 = ffffffff
!	Mem[00000000100c1408] = 0000ff3e 705a5f2c, %l0 = 0000002d, %l1 = ffffffff
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 00000000705a5f2c 000000000000ff3e
!	Mem[0000000030041408] = 3d7be6ff, %l4 = 8dff72e334d5b805
	ldsba	[%i1+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041400] = ffffffff, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l2	! %l2 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000040625e9f, Mem[0000000010181410] = 000000a2
	stba	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 9f0000a2

p0_label_30:
!	Mem[0000000010101438] = 94305e9f8c4ee51a, %l4 = ffffffffffffffff, %l1 = 000000000000ff3e
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l4,%l1	! %l1 = 94305e9f8c4ee51a
!	%l7 = 00000000e3720000, Mem[0000000010181408] = 2d1ea41661c67227
	stxa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000e3720000
!	Mem[0000000030081410] = 33b7f6ff, %l1 = 94305e9f8c4ee51a
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	%l4 = ffffffffffffffff, Mem[0000000010101422] = f283ac8f, %asi = 80
	stba	%l4,[%i4+0x022]%asi	! Mem[0000000010101420] = f283ff8f
!	%l6 = 40625e9f, %l7 = e3720000, Mem[0000000030001410] = ffffffff ffffffff
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 40625e9f e3720000
!	%f12 = baf9b00d 1a53d335, %l2 = 00000000ffffffff
!	Mem[0000000030041430] = 8365f8b99554d663
	add	%i1,0x030,%g1
	stda	%f12,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030041430] = 35d3531a0db0f9ba
!	Mem[0000000010181410] = 9f0000a2, %l3 = 000000000a9c2c2b
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 000000009f0000a2
!	%l5 = 00000000980b74ff, Mem[0000000010101408] = 8ffe275d
	stba	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 8ffe27ff
!	%f30 = ffb8d534 3e16919f, Mem[0000000010081410] = 01551a8f 4db3a040
	stda	%f30,[%i2+%o5]0x88	! Mem[0000000010081410] = ffb8d534 3e16919f
!	Starting 10 instruction Load Burst
!	Mem[000000001004140c] = ad982c1e, %l2 = 00000000ffffffff
	lduw	[%i1+0x00c],%l2		! %l2 = 00000000ad982c1e

!	Check Point 6 for processor 0

	set	p0_check_pt_data_6,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000705a5f2c
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ad982c1e
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000009f0000a2
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000980b74ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000040625e9f
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000e3720000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = b0c7e867 4d9c90e7
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 0a9c2c2b ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 4bbe3cde 1468c5b9
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ffe67b3d 8ebce0f2
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 6 completed


p0_label_31:
!	Mem[0000000030101410] = 00000000, %f3  = ffffffff
	lda	[%i4+%o5]0x81,%f3 	! %f3 = 00000000
!	Mem[0000000010101430] = 28e3c8f7, %l6 = 0000000040625e9f
	lduw	[%i4+0x030],%l6		! %l6 = 0000000028e3c8f7
!	Mem[0000000010101420] = f283ff8f, %l4 = ffffffffffffffff
	lduba	[%i4+0x020]%asi,%l4	! %l4 = 00000000000000f2
!	Mem[0000000010001400] = 40625e9f, %l3 = 000000009f0000a2
	ldswa	[%i0+%g0]0x88,%l3	! %l3 = 0000000040625e9f
!	Mem[0000000030101410] = 00000000, %l0 = 00000000705a5f2c
	lduba	[%i4+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 0a6d6fdf10111074, %l6 = 0000000028e3c8f7
	ldxa	[%i5+%g0]0x80,%l6	! %l6 = 0a6d6fdf10111074
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010081400] = ed34871b 037de60a 0ae67d03 0dd4a926
!	Mem[0000000010081410] = 9f91163e 34d5b8ff 4e7b6629 01ff6647
!	Mem[0000000010081420] = a509aa5e d5cf6cf8 00000000 00000097
!	Mem[0000000010081430] = 8fbbc3a2 ff72c64a 2ce1bd8e daa49daa
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000010141408] = 00000000, %l4 = 00000000000000f2
	ldstuba	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181410] = 000000ff, %f4  = ff1352cc
	lda	[%i6+%o5]0x89,%f4 	! %f4 = 000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010001410] = 4ac6ffff
	stwa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000

p0_label_32:
!	%l3 = 0000000040625e9f, Mem[0000000010181402] = ed34871b
	sth	%l3,[%i6+0x002]		! Mem[0000000010181400] = ed345e9f
!	Mem[0000000010101410] = b0c7e867, %l0 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 00000000b0c7e867
!	%f0  = b0c7e867 4d9c90e7, Mem[0000000030081400] = 00000000 2b2c9c0a
	stda	%f0 ,[%i2+%g0]0x89	! Mem[0000000030081400] = b0c7e867 4d9c90e7
!	%l5 = 00000000980b74ff, Mem[0000000030181400] = 3e16919f
	stwa	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 980b74ff
!	%l6 = 0a6d6fdf10111074, Mem[000000001014141c] = 32ea7f0d, %asi = 80
	stwa	%l6,[%i5+0x01c]%asi	! Mem[000000001014141c] = 10111074
	membar	#Sync			! Added by membar checker (9)
!	%l0 = 00000000b0c7e867, Mem[0000000010081410] = 3e16919f
	stba	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 3e169167
!	%f14 = e697de10 d004a503, Mem[00000000300c1400] = 0000000a 00000092
	stda	%f14,[%i3+%g0]0x81	! Mem[00000000300c1400] = e697de10 d004a503
!	Mem[0000000030041400] = ffffffff, %l0 = 00000000b0c7e867
	swapa	[%i1+%g0]0x89,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030041410] = 1b8734ed, %l2 = 00000000ad982c1e
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 000000ed000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l5 = 00000000980b74ff
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_33:
!	Mem[00000000100c1400] = e372163e, %l6 = 0a6d6fdf10111074
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffffe372
!	Mem[000000001008141c] = 01ff6647, %l5 = 0000000000000000
	lduha	[%i2+0x01c]%asi,%l5	! %l5 = 00000000000001ff
!	Mem[0000000030081400] = e7909c4d67e8c7b0, %l5 = 00000000000001ff
	ldxa	[%i2+%g0]0x81,%l5	! %l5 = e7909c4d67e8c7b0
!	Mem[0000000010081410] = 6791163e, %l2 = 00000000000000ed
	ldswa	[%i2+%o5]0x80,%l2	! %l2 = 000000006791163e
!	Mem[0000000030101408] = 75909d59, %l0 = 00000000ffffffff
	ldsha	[%i4+%o4]0x89,%l0	! %l0 = ffffffffffff9d59
!	Mem[00000000100c1438] = 8dff72e3 785462bf, %l0 = ffff9d59, %l1 = 000000ff
	ldda	[%i3+0x038]%asi,%l0	! %l0 = 000000008dff72e3 00000000785462bf
!	Mem[0000000030041400] = 67e8c7b0, %l1 = 00000000785462bf
	lduba	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000067
!	Mem[0000000010041408] = a700364f, %l1 = 0000000000000067
	ldsba	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffffa7
!	Mem[0000000010041408] = 4f3600a7, %l0 = 000000008dff72e3
	lduwa	[%i1+%o4]0x88,%l0	! %l0 = 000000004f3600a7
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = e372163e, %l1 = ffffffffffffffa7
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000e372163e

p0_label_34:
!	Mem[0000000010101400] = d5cf578a, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 00000000d5cf578a
!	Mem[00000000300c1410] = 980b74ff, %l1 = 00000000e372163e
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 00000000980b74ff
!	%l6 = ffffffffffffe372, Mem[0000000030081410] = 33b7f6ff
	stha	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 33b7e372
!	Mem[0000000030181400] = ff740b98, %l3 = 0000000040625e9f
	ldstuba	[%i6+%g0]0x89,%l3	! %l3 = 00000098000000ff
!	%f16 = ed34871b 037de60a 0ae67d03 0dd4a926
!	%f20 = 9f91163e 34d5b8ff 4e7b6629 01ff6647
!	%f24 = a509aa5e d5cf6cf8 00000000 00000097
!	%f28 = 8fbbc3a2 ff72c64a 2ce1bd8e daa49daa
	stda	%f16,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
!	Mem[0000000010041400] = 8dff72e3, %l1 = 00000000980b74ff
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 000000008dff72e3
!	%f9  = 2c5f5a70, Mem[0000000030101408] = 75909d59
	sta	%f9 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 2c5f5a70
!	%l1 = 000000008dff72e3, Mem[0000000010041408] = 4f3600a7
	stba	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 4f3600e3
!	%l0 = 000000004f3600a7, Mem[0000000030181410] = 000000ff
	stha	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000a7
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = 4e7b662901ff6647, %l0 = 000000004f3600a7
	ldxa	[%i2+0x018]%asi,%l0	! %l0 = 4e7b662901ff6647

p0_label_35:
!	Mem[0000000010041410] = 3e375e6a, %l2 = 000000006791163e
	lduha	[%i1+%o5]0x88,%l2	! %l2 = 0000000000005e6a
!	Mem[0000000010081408] = 037de60a, %l4 = 00000000d5cf578a
	ldsba	[%i2+%o4]0x88,%l4	! %l4 = 000000000000000a
!	Mem[0000000030041408] = ffe67b3d, %l0 = 4e7b662901ff6647
	ldswa	[%i1+%o4]0x81,%l0	! %l0 = ffffffffffe67b3d
!	Mem[0000000010081400] = ed34871b, %l1 = 000000008dff72e3
	ldsba	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffffed
!	Mem[0000000030101400] = f6ff052c, %l2 = 0000000000005e6a
	lduba	[%i4+%g0]0x81,%l2	! %l2 = 00000000000000f6
!	Mem[00000000100c1410] = ff1352cc8ffe275d, %f0  = b0c7e867 4d9c90e7
	ldda	[%i3+%o5]0x88,%f0 	! %f0  = ff1352cc 8ffe275d
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010141410] = ffb8d5343e16919f, %l1 = ffffffffffffffed
	ldxa	[%i5+%o5]0x88,%l1	! %l1 = ffb8d5343e16919f
!	Mem[0000000010141400] = ed34871b, %l7 = 00000000e3720000
	lduha	[%i5+%g0]0x80,%l7	! %l7 = 000000000000ed34
!	Mem[0000000010181408] = e3720000, %l5 = e7909c4d67e8c7b0
	lduba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = ed34871b 037de60a, Mem[0000000010041408] = e300364f ad982c1e
	stda	%f16,[%i1+%o4]0x80	! Mem[0000000010041408] = ed34871b 037de60a

!	Check Point 7 for processor 0

	set	p0_check_pt_data_7,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffe67b3d
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffb8d5343e16919f
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000f6
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000098
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000000a
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffe372
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000ed34
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff1352cc 8ffe275d
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 0a9c2c2b 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 000000ff 8ffe275d
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ed34871b 037de60a
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 0ae67d03 0dd4a926
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 9f91163e 34d5b8ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 4e7b6629 01ff6647
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = a509aa5e d5cf6cf8
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 00000097
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 8fbbc3a2 ff72c64a
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 2ce1bd8e daa49daa
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 7 completed


p0_label_36:
!	Mem[0000000010041410] = 6a5e373e, %l0 = ffffffffffe67b3d
	swapa	[%i1+%o5]0x80,%l0	! %l0 = 000000006a5e373e
!	%l2 = 00000000000000f6, Mem[0000000030101408] = 2c5f5a70
	stha	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 2c5f00f6
!	%f6  = 4bbe3cde, Mem[0000000010181410] = 0a9c2c2b
	sta	%f6 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 4bbe3cde
!	%l7 = 000000000000ed34, Mem[0000000030181408] = 40a03eff
	stba	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 40a03e34
!	%l7 = 000000000000ed34, Mem[0000000010001428] = 000353ac, %asi = 80
	stba	%l7,[%i0+0x028]%asi	! Mem[0000000010001428] = 340353ac
!	%f30 = 2ce1bd8e daa49daa, Mem[0000000030101408] = 2c5f00f6 ac35f303
	stda	%f30,[%i4+%o4]0x89	! Mem[0000000030101408] = 2ce1bd8e daa49daa
!	%f2  = 0a9c2c2b 00000000, Mem[0000000030081408] = ffe67b3d 65032b63
	stda	%f2 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 0a9c2c2b 00000000
!	%l0 = 6a5e373e, %l1 = 3e16919f, Mem[0000000030101408] = daa49daa 2ce1bd8e
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 6a5e373e 3e16919f
!	Mem[0000000010041400] = 980b74ff, %l7 = 000000000000ed34
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 00000098000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 26a9d40d 037de60a, %l6 = ffffe372, %l7 = 00000098
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 00000000037de60a 0000000026a9d40d

p0_label_37:
!	Mem[0000000010041400] = 05b8d534 ff740bff, %l2 = 000000f6, %l3 = 00000098
	ldda	[%i1+%g0]0x88,%l2	! %l2 = 00000000ff740bff 0000000005b8d534
!	Mem[0000000030081408] = 2b2c9c0a, %l1 = ffb8d5343e16919f
	ldswa	[%i2+%o4]0x89,%l1	! %l1 = 000000002b2c9c0a
!	Mem[0000000020800000] = 0a2dbb34, %l5 = 0000000000000000
	ldsh	[%o1+%g0],%l5		! %l5 = 0000000000000a2d
!	Mem[0000000030081408] = 2b2c9c0a, %l4 = 000000000000000a
	ldswa	[%i2+%o4]0x89,%l4	! %l4 = 000000002b2c9c0a
!	Mem[0000000010141408] = 0ae67d03, %l0 = 000000006a5e373e
	lduha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000ae6
!	Mem[0000000010041410] = ffe67b3df778f552, %l7 = 0000000026a9d40d
	ldxa	[%i1+%o5]0x80,%l7	! %l7 = ffe67b3df778f552
!	Mem[000000001004142c] = 3028972c, %l4 = 000000002b2c9c0a
	ldswa	[%i1+0x02c]%asi,%l4	! %l4 = 000000003028972c
!	%f5  = 8ffe275d, %f4  = 000000ff 8ffe275d
	fstox	%f5 ,%f4 		! %f4  = 00000000 00000000
!	Mem[0000000030141410] = cc5213ff, %l6 = 00000000037de60a
	lduha	[%i5+%o5]0x89,%l6	! %l6 = 00000000000013ff
!	Starting 10 instruction Store Burst
!	%l4 = 000000003028972c, Mem[0000000030041410] = ff34871b
	stha	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 972c871b

p0_label_38:
!	%l7 = ffe67b3df778f552, Mem[0000000010141408] = 0ae67d030dd4a926
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = ffe67b3df778f552
!	%l1 = 000000002b2c9c0a, Mem[000000001008140c] = 0dd4a926
	sth	%l1,[%i2+0x00c]		! Mem[000000001008140c] = 9c0aa926
!	%l0 = 0000000000000ae6, Mem[0000000030001410] = 40625e9f
	stba	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 40625ee6
!	%l2 = 00000000ff740bff, Mem[0000000010081418] = 4e7b662901ff6647, %asi = 80
	stxa	%l2,[%i2+0x018]%asi	! Mem[0000000010081418] = 00000000ff740bff
!	Mem[000000001018142c] = 7792950d, %l1 = 000000002b2c9c0a, %asi = 80
	swapa	[%i6+0x02c]%asi,%l1	! %l1 = 000000007792950d
!	%l1 = 000000007792950d, Mem[0000000010001408] = 000000ed0000f316
	stxa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000007792950d
!	Mem[0000000030141408] = 2b2c9c0a, %l4 = 000000003028972c
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 0000000a000000ff
!	%f4  = 00000000, Mem[000000001008143c] = daa49daa
	st	%f4 ,[%i2+0x03c]	! Mem[000000001008143c] = 00000000
!	%l2 = 00000000ff740bff, Mem[0000000030081400] = e7909c4d
	stba	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = ff909c4d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1404] = d0eab90c, %f30 = 2ce1bd8e
	ld	[%i3+0x004],%f30	! %f30 = d0eab90c

p0_label_39:
!	Mem[00000000201c0000] = dfffafd5, %l6 = 00000000000013ff
	ldsb	[%o0+%g0],%l6		! %l6 = ffffffffffffffdf
!	Mem[0000000021800140] = b18f9071, %l7 = ffe67b3df778f552
	ldsba	[%o3+0x141]%asi,%l7	! %l7 = ffffffffffffff8f
!	Mem[0000000010041410] = 52f578f73d7be6ff, %f2  = 0a9c2c2b 00000000
	ldda	[%i1+%o5]0x88,%f2 	! %f2  = 52f578f7 3d7be6ff
!	Mem[0000000030141408] = ff9c2c2b, %l5 = 0000000000000a2d
	lduwa	[%i5+%o4]0x81,%l5	! %l5 = 00000000ff9c2c2b
!	Mem[0000000010141400] = ed34871b, %f6  = 4bbe3cde
	lda	[%i5+%g0]0x80,%f6 	! %f6 = ed34871b
!	Mem[00000000100c1408] = 705a5f2c, %l0 = 0000000000000ae6
	ldswa	[%i3+%o4]0x88,%l0	! %l0 = 00000000705a5f2c
!	Mem[0000000030041408] = ffe67b3d, %l6 = ffffffffffffffdf
	lduwa	[%i1+%o4]0x81,%l6	! %l6 = 00000000ffe67b3d
!	Mem[0000000010081428] = 0000000000000097, %f22 = 4e7b6629 01ff6647
	ldd	[%i2+0x028],%f22	! %f22 = 00000000 00000097
!	Mem[0000000030141410] = ff1352cc, %l5 = 00000000ff9c2c2b
	lduwa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ff1352cc
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = ffe3e4d2, %l4 = 000000000000000a
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 000000e3000000ff

p0_label_40:
!	%l1 = 000000007792950d, Mem[000000001018142f] = 2b2c9c0a
	stb	%l1,[%i6+0x02f]		! Mem[000000001018142c] = 2b2c9c0d
!	%l6 = 00000000ffe67b3d, Mem[0000000010041408] = ed34871b037de60a
	stxa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000ffe67b3d
!	Mem[00000000300c1408] = ff000000, %l5 = 00000000ff1352cc
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	%l1 = 000000007792950d, Mem[00000000201c0000] = dfffafd5, %asi = 80
	stba	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0dffafd5
!	%l4 = 00000000000000e3, Mem[00000000100c1400] = a7ffffff
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = a7ffffe3
!	%l0 = 00000000705a5f2c, Mem[0000000010001408] = 0d95927700000000
	stxa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000705a5f2c
!	Mem[0000000030001410] = e65e6240, %l4 = 00000000000000e3
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 000000e6000000ff
!	Mem[0000000010141410] = 3e16919f, %l3 = 0000000005b8d534
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 000000003e16919f
!	%f22 = 00000000 00000097, %l7 = ffffffffffffff8f
!	Mem[0000000030141420] = abfb810c2c5f5a70
	add	%i5,0x020,%g1
	stda	%f22,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030141420] = 9700000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 9f91163e34d5b8ff, %f20 = 9f91163e 34d5b8ff
	ldda	[%i0+%g0]0x89,%f20	! %f20 = 9f91163e 34d5b8ff

!	Check Point 8 for processor 0

	set	p0_check_pt_data_8,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000705a5f2c
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000007792950d
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000e6
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l5,%g2			! %l5 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffe67b3d
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffff8f
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 52f578f7 3d7be6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ed34871b 1468c5b9
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 9f91163e 34d5b8ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x58],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 00000097
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x60],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = d0eab90c daa49daa
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 8 completed


p0_label_41:
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 00000000705a5f2c
	setx	0x7487ffd02ec8935d,%g7,%l0 ! %l0 = 7487ffd02ec8935d
!	%l1 = 000000007792950d
	setx	0x8561a0d03ee66d79,%g7,%l1 ! %l1 = 8561a0d03ee66d79
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7487ffd02ec8935d
	setx	0x4f4758206a320905,%g7,%l0 ! %l0 = 4f4758206a320905
!	%l1 = 8561a0d03ee66d79
	setx	0x85ea71a81ece3771,%g7,%l1 ! %l1 = 85ea71a81ece3771
!	Mem[00000000300c1410] = e372163e, %l1 = 85ea71a81ece3771
	ldsba	[%i3+%o5]0x89,%l1	! %l1 = 000000000000003e
!	Mem[0000000010181430] = 804929876092688d, %f14 = e697de10 d004a503
	ldd	[%i6+0x030],%f14	! %f14 = 80492987 6092688d
!	Mem[0000000030041400] = b0c7e867, %l6 = 00000000ffe67b3d
	lduwa	[%i1+%g0]0x89,%l6	! %l6 = 00000000b0c7e867
!	Mem[0000000010081410] = 6791163e34d5b8ff, %l6 = 00000000b0c7e867
	ldxa	[%i2+%o5]0x80,%l6	! %l6 = 6791163e34d5b8ff
!	Mem[0000000010001430] = a0f4213d, %l3 = 000000003e16919f
	ldub	[%i0+0x030],%l3		! %l3 = 00000000000000a0
!	Mem[0000000010101400] = 00000000, %l0 = 4f4758206a320905
	lduba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001010141c] = c96f6fe3, %l5 = 00000000ff000000
	ldsha	[%i4+0x01e]%asi,%l5	! %l5 = 0000000000006fe3
!	Mem[0000000010041414] = f778f552, %l4 = 00000000000000e6
	ldsha	[%i1+0x014]%asi,%l4	! %l4 = fffffffffffff778
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000a0, Mem[0000000030181408] = 40a03e34
	stwa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000a0

p0_label_42:
!	%f16 = ed34871b 037de60a 0ae67d03 0dd4a926
!	%f20 = 9f91163e 34d5b8ff 00000000 00000097
!	%f24 = a509aa5e d5cf6cf8 00000000 00000097
!	%f28 = 8fbbc3a2 ff72c64a d0eab90c daa49daa
	stda	%f16,[%i6]ASI_BLK_P	! Block Store to 0000000010181400
!	%f2  = 52f578f7 3d7be6ff, %l7 = ffffffffffffff8f
!	Mem[0000000030041420] = 9a1c65342bd8373d
	add	%i1,0x020,%g1
	stda	%f2,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030041420] = ffe67b3df778f552
!	%l2 = ff740bff, %l3 = 000000a0, Mem[0000000010001408] = 00000000 705a5f2c
	std	%l2,[%i0+%o4]		! Mem[0000000010001408] = ff740bff 000000a0
!	Mem[0000000010081400] = 1b8734ed, %l6 = 6791163e34d5b8ff
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 000000ed000000ff
!	%l0 = 0000000000000000, Mem[0000000010001408] = ff740bff000000a0
	stxa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000000
!	%l0 = 00000000, %l1 = 0000003e, Mem[0000000030041400] = 67e8c7b0 33b7f6ff
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 0000003e
!	Mem[0000000010101408] = 8ffe27ff, %l0 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 000000008ffe27ff
!	%f4  = 00000000 00000000, %l6 = 00000000000000ed
!	Mem[0000000010181418] = 0000000000000097
	add	%i6,0x018,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010181418] = 0000000000000097
!	%f12 = baf9b00d 1a53d335, Mem[0000000010001410] = 00000000 ffffffd4
	stda	%f12,[%i0+%o5]0x80	! Mem[0000000010001410] = baf9b00d 1a53d335
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 2c05fff6, %l1 = 000000000000003e
	ldsha	[%i4+%g0]0x89,%l1	! %l1 = fffffffffffffff6

p0_label_43:
!	Mem[0000000010101400] = 00000000, %f5  = 00000000
	lda	[%i4+%g0]0x80,%f5 	! %f5 = 00000000
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010181408] = 037de60a, %l7 = ffffffffffffff8f
	ldsha	[%i6+%o4]0x88,%l7	! %l7 = ffffffffffffe60a
!	Mem[0000000010181408] = 0ae67d03 0dd4a926, %l0 = 8ffe27ff, %l1 = fffffff6
	ldd	[%i6+%o4],%l0		! %l0 = 000000000ae67d03 000000000dd4a926
!	Mem[0000000030181400] = ff0b74ff 00005804, %l6 = 000000ed, %l7 = ffffe60a
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 00000000ff0b74ff 0000000000005804
!	Mem[0000000030001400] = 34d5b8ff, %l5 = 0000000000006fe3
	ldsha	[%i0+%g0]0x89,%l5	! %l5 = ffffffffffffb8ff
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000005804
	ldsba	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 33b7e372, %f9  = 2c5f5a70
	lda	[%i2+%o5]0x89,%f9 	! %f9 = 33b7e372
!	Mem[0000000010181430] = 8fbbc3a2ff72c64a, %f20 = 9f91163e 34d5b8ff
	ldd	[%i6+0x030],%f20	! %f20 = 8fbbc3a2 ff72c64a
!	Mem[0000000010101418] = f101c0ef c96f6fe3, %l6 = ff0b74ff, %l7 = 00000000
	ldda	[%i4+0x018]%asi,%l6	! %l6 = 00000000f101c0ef 00000000c96f6fe3
!	Starting 10 instruction Store Burst
!	%l4 = fffffffffffff778, Mem[0000000010181424] = d5cf6cf8, %asi = 80
	stha	%l4,[%i6+0x024]%asi	! Mem[0000000010181424] = f7786cf8

p0_label_44:
!	%f2  = 52f578f7, Mem[0000000010001408] = 00000000
	sta	%f2 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 52f578f7
!	%l6 = 00000000f101c0ef, Mem[00000000100c1410] = 5d27fe8fcc5213ff, %asi = 80
	stxa	%l6,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00000000f101c0ef
!	Mem[0000000010081420] = a509aa5e, %l0 = 0ae67d03, %l3 = 000000a0
	add	%i2,0x20,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 00000000a509aa5e
!	%f17 = 037de60a, Mem[0000000010101410] = 00000000
	sta	%f17,[%i4+%o5]0x88	! Mem[0000000010101410] = 037de60a
!	%f18 = 0ae67d03 0dd4a926, Mem[0000000030001400] = ffb8d534 3e16919f
	stda	%f18,[%i0+%g0]0x81	! Mem[0000000030001400] = 0ae67d03 0dd4a926
!	%f13 = 1a53d335, Mem[0000000010141438] = 2ce1bd8e
	st	%f13,[%i5+0x038]	! Mem[0000000010141438] = 1a53d335
!	%l5 = ffffffffffffb8ff, Mem[00000000211c0000] = ffffe4d2
	stb	%l5,[%o2+%g0]		! Mem[00000000211c0000] = ffffe4d2
!	%l6 = 00000000f101c0ef, Mem[0000000010101404] = 3ec809a5, %asi = 80
	stwa	%l6,[%i4+0x004]%asi	! Mem[0000000010101404] = f101c0ef
!	Mem[0000000030081408] = 2b2c9c0a, %l1 = 000000000dd4a926
	swapa	[%i2+%o4]0x89,%l1	! %l1 = 000000002b2c9c0a
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 26a9d40d037de60a, %l1 = 000000002b2c9c0a
	ldxa	[%i0+%g0]0x89,%l1	! %l1 = 26a9d40d037de60a

p0_label_45:
!	Mem[0000000030081410] = 33b7e372, %l2 = 00000000ff740bff
	lduba	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000072
!	Mem[0000000010041410] = 52f578f7 3d7be6ff, %l2 = 00000072, %l3 = a509aa5e
	ldda	[%i1+%o5]0x88,%l2	! %l2 = 000000003d7be6ff 0000000052f578f7
!	%l4 = fffffffffffff778, imm = fffffffffffffa2e, %l4 = fffffffffffff778
	andn	%l4,-0x5d2,%l4		! %l4 = 0000000000000550
!	Mem[0000000030041410] = 972c871b, %l3 = 0000000052f578f7
	ldsha	[%i1+%o5]0x81,%l3	! %l3 = ffffffffffff972c
!	Mem[0000000010141400] = ed34871b037de60a, %f24 = a509aa5e d5cf6cf8
	ldda	[%i5+0x000]%asi,%f24	! %f24 = ed34871b 037de60a
!	Mem[0000000030141400] = 8dff72ff, %l0 = 000000000ae67d03
	lduha	[%i5+%g0]0x89,%l0	! %l0 = 00000000000072ff
!	Mem[0000000010141400] = 1b8734ed, %f12 = baf9b00d
	lda	[%i5+%g0]0x88,%f12	! %f12 = 1b8734ed
!	Mem[00000000100c1400] = 0cb9ead0a7ffffe3, %l4 = 0000000000000550
	ldxa	[%i3+%g0]0x88,%l4	! %l4 = 0cb9ead0a7ffffe3
!	Mem[00000000201c0000] = 0dffafd5, %l7 = 00000000c96f6fe3
	ldsh	[%o0+%g0],%l7		! %l7 = 0000000000000dff
!	Starting 10 instruction Store Burst
!	%l4 = 0cb9ead0a7ffffe3, Mem[0000000010081408] = 0ae67d03
	stha	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = ffe37d03

!	Check Point 9 for processor 0

	set	p0_check_pt_data_9,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000072ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 26a9d40d037de60a
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000003d7be6ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffff972c
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0cb9ead0a7ffffe3
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffb8ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000f101c0ef
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000dff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff1352cc 8ffe275d
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 52f578f7 3d7be6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ed34871b 1468c5b9
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = abfb810c 33b7e372
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 1b8734ed 1a53d335
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 80492987 6092688d
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 8fbbc3a2 ff72c64a
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ed34871b 037de60a
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 9 completed


p0_label_46:
!	%l2 = 3d7be6ff, %l3 = ffff972c, Mem[0000000010181408] = 037de60a 26a9d40d
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 3d7be6ff ffff972c
!	Mem[0000000010101410] = 0ae67d03, %l4 = 0cb9ead0a7ffffe3
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 0000000a000000ff
!	%f26 = 00000000, %f9  = 33b7e372, %f1  = 8ffe275d
	fadds	%f26,%f9 ,%f1 		! %f1  = 33b7e372
!	Mem[0000000030041410] = 1b872c97, %l2 = 000000003d7be6ff
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 000000001b872c97
!	%l0 = 00000000000072ff, Mem[0000000010001404] = 000072e3
	stb	%l0,[%i0+0x004]		! Mem[0000000010001404] = ff0072e3
!	%l1 = 26a9d40d037de60a, Mem[0000000030041410] = ffe67b3d
	stha	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = e60a7b3d
!	%l7 = 0000000000000dff, Mem[000000001014141c] = 01ff6647, %asi = 80
	stwa	%l7,[%i5+0x01c]%asi	! Mem[000000001014141c] = 00000dff
!	%f28 = 8fbbc3a2 ff72c64a, %l0 = 00000000000072ff
!	Mem[0000000030081408] = 26a9d40d00000000
	add	%i2,0x008,%g1
	stda	%f28,[%g1+%l0]ASI_PST16_S ! Mem[0000000030081408] = 8fbbc3a2ff72c64a
!	%l4 = 000000000000000a, Mem[00000000300c1410] = e372163e
	stha	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = e372000a
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 3d7be6ff, %l2 = 000000001b872c97
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = ffffffffffffffff

p0_label_47:
!	Mem[0000000030001408] = 00000000, %l2 = ffffffffffffffff
	ldswa	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = ffb8d5343e169167, %l3 = ffffffffffff972c
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = ffb8d5343e169167
!	Mem[0000000010141408] = 3d7be6ff, %l1 = 26a9d40d037de60a
	lduha	[%i5+%o4]0x88,%l1	! %l1 = 000000000000e6ff
!	Mem[0000000010101408] = 00000000, %l5 = ffffffffffffb8ff
	ldsha	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = baf9b00d, %l7 = 0000000000000dff
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = ffffffffffffbaf9
!	Mem[0000000010041408] = 00000000 ffe67b3d, %l4 = 0000000a, %l5 = 00000000
	ldd	[%i1+%o4],%l4		! %l4 = 0000000000000000 00000000ffe67b3d
!	Mem[0000000010101428] = 387becacebf63d12, %l3 = ffb8d5343e169167
	ldxa	[%i4+0x028]%asi,%l3	! %l3 = 387becacebf63d12
!	Mem[0000000030141408] = ff9c2c2b, %l0 = 00000000000072ff
	ldsba	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030081408] = 8fbbc3a2, %l0 = ffffffffffffffff
	lduwa	[%i2+%o4]0x81,%l0	! %l0 = 000000008fbbc3a2
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[000000001010140a] = 00000000, %asi = 80
	stba	%l4,[%i4+0x00a]%asi	! Mem[0000000010101408] = 00000000

p0_label_48:
!	%l7 = ffffffffffffbaf9, Mem[0000000021800181] = 52b6ae0c, %asi = 80
	stba	%l7,[%o3+0x181]%asi	! Mem[0000000021800180] = 52f9ae0c
!	Mem[0000000010181410] = 9f91163e, %l7 = ffffffffffffbaf9
	ldstuba	[%i6+%o5]0x80,%l7	! %l7 = 0000009f000000ff
!	Mem[00000000211c0001] = ffffe4d2, %l3 = 387becacebf63d12
	ldstub	[%o2+0x001],%l3		! %l3 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000010081410] = ffb8d5343e169167
	stxa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000000
!	Mem[0000000010181400] = 1b8734ed, %l3 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 000000001b8734ed
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = f778f552, %l2 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l2	! %l2 = 00000000f778f552
!	%f1  = 33b7e372, Mem[0000000030141408] = 2b2c9cff
	sta	%f1 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 33b7e372
!	Mem[0000000010181410] = ff91163e, %l0 = 000000008fbbc3a2
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = baf9b00d 1a53d335, %l2 = f778f552, %l3 = 1b8734ed
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 00000000baf9b00d 000000001a53d335

p0_label_49:
!	Mem[0000000010041408] = 00000000, %l2 = 00000000baf9b00d
	ldsha	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = 0dffafd5, %l3 = 000000001a53d335
	lduh	[%o0+%g0],%l3		! %l3 = 0000000000000dff
!	Mem[00000000100c1410] = 00000000, %l0 = 00000000000000ff
	lduwa	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800040] = e3ffe589, %l4 = 0000000000000000
	lduha	[%o1+0x040]%asi,%l4	! %l4 = 000000000000e3ff
!	Mem[00000000300c1410] = e372000a, %l1 = 000000000000e6ff
	lduha	[%i3+%o5]0x89,%l1	! %l1 = 000000000000000a
!	Mem[0000000030181400] = ff740bff, %l6 = 00000000f101c0ef
	lduwa	[%i6+%g0]0x89,%l6	! %l6 = 00000000ff740bff
!	%l4 = 000000000000e3ff, imm = 0000000000000144, %l2 = 0000000000000000
	or	%l4,0x144,%l2		! %l2 = 000000000000e3ff
!	Mem[0000000030081410] = 72e3b733, %l5 = 00000000ffe67b3d
	ldsha	[%i2+%o5]0x81,%l5	! %l5 = 00000000000072e3
!	Mem[0000000010081438] = 2ce1bd8e00000000, %f20 = 8fbbc3a2 ff72c64a
	ldda	[%i2+0x038]%asi,%f20	! %f20 = 2ce1bd8e 00000000
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000009f, Mem[0000000010101404] = f101c0ef
	sth	%l7,[%i4+0x004]		! Mem[0000000010101404] = 009fc0ef

p0_label_50:
!	%l3 = 0000000000000dff, Mem[0000000010001400] = 40625e9f
	stba	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 40625eff
!	%l1 = 000000000000000a, Mem[0000000030181400] = ff0b74ff
	stba	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 0a0b74ff
!	Mem[0000000030141408] = 72e3b733, %l4 = 000000000000e3ff
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 00000072000000ff
!	%f2  = 52f578f7 3d7be6ff, %l0 = 0000000000000000
!	Mem[0000000030101408] = 3e375e6a9f91163e
	add	%i4,0x008,%g1
	stda	%f2,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030101408] = 3e375e6a9f91163e
!	Mem[0000000010041408] = 00000000ffe67b3d, %l5 = 00000000000072e3, %l1 = 000000000000000a
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 00000000ffe67b3d
!	%l5 = 00000000000072e3, Mem[0000000010081418] = 00000000, %asi = 80
	stwa	%l5,[%i2+0x018]%asi	! Mem[0000000010081418] = 000072e3
!	Mem[0000000010041406] = 34d5b805, %l7 = 000000000000009f
	ldstuba	[%i1+0x006]%asi,%l7	! %l7 = 000000b8000000ff
!	%l5 = 00000000000072e3, Mem[0000000030041400] = 00000000
	stba	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = e3000000
!	%l3 = 0000000000000dff, Mem[0000000010081430] = 8fbbc3a2ff72c64a, %asi = 80
	stxa	%l3,[%i2+0x030]%asi	! Mem[0000000010081430] = 0000000000000dff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffb8d5343e1691ff, %l2 = 000000000000e3ff
	ldxa	[%i6+%o5]0x88,%l2	! %l2 = ffb8d5343e1691ff

!	Check Point 10 for processor 0

	set	p0_check_pt_data_10,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ffe67b3d
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffb8d5343e1691ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000dff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000072
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000072e3
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ff740bff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000b8
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff1352cc 33b7e372
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 52f578f7 3d7be6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 2ce1bd8e 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 10 completed


p0_label_51:
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000ff740bff
	ldsha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = a7000000, %l2 = ffb8d5343e1691ff
	lduha	[%i6+%o5]0x81,%l2	! %l2 = 000000000000a700
!	Mem[0000000010081410] = 00000000, %f16 = ed34871b
	lda	[%i2+%o5]0x80,%f16	! %f16 = 00000000
!	Mem[00000000201c0000] = 0dffafd5, %l4 = 0000000000000072
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000dff
!	Mem[0000000010001410] = baf9b00d, %l5 = 00000000000072e3
	ldswa	[%i0+%o5]0x80,%l5	! %l5 = ffffffffbaf9b00d
!	Mem[0000000030001410] = e372000040625eff, %f12 = 1b8734ed 1a53d335
	ldda	[%i0+%o5]0x89,%f12	! %f12 = e3720000 40625eff
!	Mem[0000000010181400] = ff000000037de60a, %l7 = 00000000000000b8
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = ff000000037de60a
!	Mem[0000000030101410] = 00000000, %l3 = 0000000000000dff
	lduba	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 705a5f2c, %f21 = 00000000
	lda	[%i3+%o4]0x88,%f21	! %f21 = 705a5f2c
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 0dffafd5, %l3 = 0000000000000000
	ldstub	[%o0+0x001],%l3		! %l3 = 000000ff000000ff

p0_label_52:
!	%l6 = 0000000000000000, Mem[0000000010041408] = 00000000ffe67b3d
	stxa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000030081400] = 4d9c90ff, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 000000004d9c90ff
!	%l0 = 4d9c90ff, %l1 = ffe67b3d, Mem[0000000010181430] = 8fbbc3a2 ff72c64a
	std	%l0,[%i6+0x030]		! Mem[0000000010181430] = 4d9c90ff ffe67b3d
!	Mem[00000000211c0000] = ffffe4d2, %l7 = ff000000037de60a
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	%l5 = ffffffffbaf9b00d, Mem[0000000030081410] = 33b7e372
	stwa	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = baf9b00d
!	Mem[0000000010101408] = 000000001b8734ed, %l5 = ffffffffbaf9b00d, %l0 = 000000004d9c90ff
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = 000000001b8734ed
!	Mem[0000000010101408] = 00000000, %l1 = 00000000ffe67b3d
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1401] = e3ffffa7, %l2 = 000000000000a700
	ldstub	[%i3+0x001],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000010041414] = f778f552, %l1 = 0000000000000000
	swap	[%i1+0x014],%l1		! %l1 = 00000000f778f552
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0dd4a926 2c05fff6, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 000000002c05fff6 000000000dd4a926

p0_label_53:
!	Mem[0000000010001400] = 40625eff, %l5 = ffffffffbaf9b00d
	lduba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l2 = 00000000000000ff
	lduba	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181428] = 00000000, %l0 = 000000001b8734ed
	ldsha	[%i6+0x028]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800040] = 862b9b4e, %l4 = 0000000000000dff
	lduh	[%o3+0x040],%l4		! %l4 = 000000000000862b
!	Mem[00000000300c1410] = 0a0072e3f18144db, %l5 = 00000000000000ff
	ldxa	[%i3+%o5]0x81,%l5	! %l5 = 0a0072e3f18144db
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 705a5f2c, %l0 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l0	! %l0 = 00000000705a5f2c
!	Mem[0000000010141410] = ffb8d53405b8d534, %l1 = 00000000f778f552
	ldxa	[%i5+%o5]0x88,%l1	! %l1 = ffb8d53405b8d534
!	Mem[0000000010101424] = 1b666ef5, %l0 = 00000000705a5f2c
	ldsb	[%i4+0x027],%l0		! %l0 = fffffffffffffff5
!	Starting 10 instruction Store Burst
!	%l1 = ffb8d53405b8d534, Mem[0000000010141408] = 3d7be6ff
	stba	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 3d7be634

p0_label_54:
!	%l4 = 000000000000862b, Mem[0000000010081410] = 0000000000000000
	stxa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000000000862b
!	Mem[000000001008142a] = 00000000, %l0 = fffffffffffffff5
	ldstub	[%i2+0x02a],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030041408] = ffe67b3d, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000030181410] = d0eab90c000000a7
	stxa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000000ff
!	Mem[000000001000142f] = c12833b5, %l0 = 0000000000000000
	ldstub	[%i0+0x02f],%l0		! %l0 = 000000b5000000ff
!	Mem[0000000010141408] = 3d7be634, %l7 = 000000000dd4a926
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 000000003d7be634
!	Mem[0000000030141410] = cc5213ff, %l7 = 000000003d7be634
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 00000000cc5213ff
!	%l6 = 000000002c05fff6, Mem[000000001018142d] = 00000097, %asi = 80
	stba	%l6,[%i6+0x02d]%asi	! Mem[000000001018142c] = 00f60097
!	%l3 = 00000000000000ff, Mem[0000000010041400] = ff0b74ff
	stwa	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 000000a0, %l2 = 00000000000000ff
	ldsba	[%i6+%o4]0x89,%l2	! %l2 = ffffffffffffffa0

p0_label_55:
!	Mem[0000000030001410] = e372000040625eff, %f26 = 00000000 00000097
	ldda	[%i0+%o5]0x89,%f26	! %f26 = e3720000 40625eff
!	Mem[0000000010181400] = ff000000 037de60a, %l0 = 000000b5, %l1 = 05b8d534
	ldd	[%i6+%g0],%l0		! %l0 = 00000000ff000000 00000000037de60a
!	Mem[00000000100c1410] = 00000000, %l1 = 00000000037de60a
	ldswa	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800180] = 52f9ae0c, %l5 = 0a0072e3f18144db
	lduba	[%o3+0x180]%asi,%l5	! %l5 = 0000000000000052
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010041400] = 000000ff 34d5ff05 00000000 00000000
!	Mem[0000000010041410] = ffe67b3d 00000000 5c844fff 6004a862
!	Mem[0000000010041420] = 6081daa3 3f403703 ac35f303 3028972c
!	Mem[0000000010041430] = c40ffeae 04f0a313 3b52db8a 0000003e
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[0000000030181400] = 0a0b74ff00005804, %l7 = 00000000cc5213ff
	ldxa	[%i6+%g0]0x81,%l7	! %l7 = 0a0b74ff00005804
!	Mem[0000000010181400] = ff000000, %l1 = 0000000000000000
	lduba	[%i6+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = ff1352cc, %f19 = 0dd4a926
	lda	[%i3+%o4]0x81,%f19	! %f19 = ff1352cc
!	Mem[0000000030181400] = 0a0b74ff, %l0 = 00000000ff000000
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = 000000000000000a
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 2c5f5a70, %l6 = 000000002c05fff6
	swapa	[%i3+%o4]0x80,%l6	! %l6 = 000000002c5f5a70

!	Check Point 11 for processor 0

	set	p0_check_pt_data_11,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000000a
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffa0
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000862b
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000052
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000002c5f5a70
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0a0b74ff00005804
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff 34d5ff05
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffe67b3d 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 5c844fff 6004a862
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 6081daa3 3f403703
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ac35f303 3028972c
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = c40ffeae 04f0a313
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 3b52db8a 0000003e
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 037de60a
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 0ae67d03 ff1352cc
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x98],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 2ce1bd8e 705a5f2c
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0xa0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = e3720000 40625eff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 11 completed


p0_label_56:
!	%f4  = ffe67b3d, %f18 = 0ae67d03
	fstoi	%f4 ,%f18		! %f18 = 80000000
!	Mem[0000000010101410] = ffe67d03 61fa6bf3, %l0 = 0000000a, %l1 = 000000ff
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 00000000ffe67d03 0000000061fa6bf3
!	%l5 = 0000000000000052, Mem[0000000030101408] = 6a5e373e
	stwa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000052
!	%f7  = 6004a862, Mem[0000000010001410] = 0db0f9ba
	sta	%f7 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 6004a862
!	Mem[0000000010041410] = ffe67b3d, %l4 = 000000000000862b
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ffe67b3d
!	%l3 = 00000000000000ff, Mem[0000000010001419] = 169285da, %asi = 80
	stba	%l3,[%i0+0x019]%asi	! Mem[0000000010001418] = 16ff85da
!	%f31 = daa49daa, Mem[0000000030001400] = 0ae67d03
	sta	%f31,[%i0+%g0]0x81	! Mem[0000000030001400] = daa49daa
!	%l4 = 00000000ffe67b3d, Mem[00000000100c1400] = e3ffffa7
	stba	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 3dffffa7
!	%f16 = 00000000 037de60a 80000000 ff1352cc
!	%f20 = 2ce1bd8e 705a5f2c 00000000 00000097
!	%f24 = ed34871b 037de60a e3720000 40625eff
!	%f28 = 8fbbc3a2 ff72c64a d0eab90c daa49daa
	stda	%f16,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff5e6240, %l4 = 00000000ffe67b3d
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 000000000000ff5e

p0_label_57:
!	Mem[0000000010081424] = d5cf6cf8, %l2 = ffffffffffffffa0
	lduwa	[%i2+0x024]%asi,%l2	! %l2 = 00000000d5cf6cf8
!	Mem[0000000030101408] = 520000009f91163e, %l7 = 0a0b74ff00005804
	ldxa	[%i4+%o4]0x81,%l7	! %l7 = 520000009f91163e
	membar	#Sync			! Added by membar checker (13)
!	Mem[00000000300c1410] = 2ce1bd8e705a5f2c, %f6  = 5c844fff 6004a862
	ldda	[%i3+%o5]0x81,%f6 	! %f6  = 2ce1bd8e 705a5f2c
!	Mem[00000000218000c0] = 5804cd54, %l4 = 000000000000ff5e
	ldsh	[%o3+0x0c0],%l4		! %l4 = 0000000000005804
!	Mem[0000000030101410] = 2697525200000000, %f10 = ac35f303 3028972c
	ldda	[%i4+%o5]0x89,%f10	! %f10 = 26975252 00000000
!	Mem[0000000030001410] = ff5e6240, %l3 = 00000000000000ff
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000201c0000] = 0dffafd5, %l4 = 0000000000005804
	ldub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010001400] = 40625eff, %l4 = 00000000000000ff
	ldsha	[%i0+%g0]0x88,%l4	! %l4 = 0000000000005eff
!	Mem[0000000030181400] = 0a0b74ff 00005804 a0000000 0155b34d
!	Mem[0000000030181410] = ff000000 00000000 06582203 f64a2132
!	Mem[0000000030181420] = 5ca9dfbf f70c378d 08f9732e ce384f20
!	Mem[0000000030181430] = 8deee6bc e106c493 4900113d 3c53c2a1
	ldda	[%i6]ASI_BLK_AIUS,%f16	! Block Load from 0000000030181400
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1411] = 00000000, %l2 = 00000000d5cf6cf8
	ldstuba	[%i3+0x011]%asi,%l2	! %l2 = 00000000000000ff

p0_label_58:
!	%l4 = 0000000000005eff, Mem[0000000010041400] = 05ffd534ff000000
	stxa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000005eff
!	%f6  = 2ce1bd8e 705a5f2c, %l7 = 520000009f91163e
!	Mem[0000000010101420] = f283ff8f1b666ef5
	add	%i4,0x020,%g1
	stda	%f6,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010101420] = f283ff8f8ebde12c
!	%f16 = 0a0b74ff 00005804 a0000000 0155b34d
!	%f20 = ff000000 00000000 06582203 f64a2132
!	%f24 = 5ca9dfbf f70c378d 08f9732e ce384f20
!	%f28 = 8deee6bc e106c493 4900113d 3c53c2a1
	stda	%f16,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	%l7 = 520000009f91163e, Mem[00000000201c0000] = 0dffafd5
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 3effafd5
!	%l5 = 0000000000000052, Mem[000000001018141a] = 00000000, %asi = 80
	stha	%l5,[%i6+0x01a]%asi	! Mem[0000000010181418] = 00000052
!	Mem[0000000010101400] = 00000000, %l5 = 0000000000000052
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[00000000300c1410] = 8ebde12c
	stba	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 8ebde1ff
!	Mem[0000000030081400] = 00000000, %l7 = 520000009f91163e
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = ffe1bd8e, %l3 = ffffffffffffffff
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 00000000ffe1bd8e
!	Starting 10 instruction Load Burst
!	%l6 = 000000002c5f5a70, Mem[0000000010181430] = 4d9c90ff, %asi = 80
	stba	%l6,[%i6+0x030]%asi	! Mem[0000000010181430] = 709c90ff

p0_label_59:
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010181414] = 34d5b8ff, %l7 = 0000000000000000
	lduha	[%i6+0x014]%asi,%l7	! %l7 = 00000000000034d5
!	Mem[0000000030101410] = 00000000, %f31 = 3c53c2a1
	lda	[%i4+%o5]0x81,%f31	! %f31 = 00000000
!	Mem[00000000100c1400] = a7ffff3d, %l4 = 0000000000005eff
	lduba	[%i3+%g0]0x88,%l4	! %l4 = 000000000000003d
!	Mem[0000000010141410] = 34d5b805, %f9  = 3f403703
	lda	[%i5+0x010]%asi,%f9 	! %f9 = 34d5b805
!	Mem[00000000300c1400] = 00000000, %l0 = 00000000ffe67d03
	ldswa	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = ed34871b, %f14 = 3b52db8a
	lda	[%i5+%g0]0x80,%f14	! %f14 = ed34871b
!	Mem[0000000010181400] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101410] = ffe67d03, %l4 = 000000000000003d
	lduba	[%i4+0x010]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141400] = ff72ff8d4d9c90e7, %f24 = 5ca9dfbf f70c378d
	ldda	[%i5+%g0]0x81,%f24	! %f24 = ff72ff8d 4d9c90e7
!	Starting 10 instruction Store Burst
!	%l6 = 000000002c5f5a70, Mem[00000000300c1410] = 2c5f5a70ffffffff
	stxa	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000002c5f5a70

p0_label_60:
!	%f24 = ff72ff8d, Mem[0000000030101408] = 52000000
	sta	%f24,[%i4+%o4]0x81	! Mem[0000000030101408] = ff72ff8d
!	%f10 = 26975252 00000000, Mem[0000000010041408] = 00000000 00000000
	stda	%f10,[%i1+%o4]0x80	! Mem[0000000010041408] = 26975252 00000000
!	Mem[0000000030141410] = 34e67b3d, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 0000000034e67b3d
!	%f0  = 000000ff 34d5ff05 00000000 00000000
!	%f4  = ffe67b3d 00000000 2ce1bd8e 705a5f2c
!	%f8  = 6081daa3 34d5b805 26975252 00000000
!	%f12 = c40ffeae 04f0a313 ed34871b 0000003e
	stda	%f0,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%l1 = 0000000061fa6bf3, Mem[00000000218001c0] = 5a379ea8
	sth	%l1,[%o3+0x1c0]		! Mem[00000000218001c0] = 6bf39ea8
!	%l2 = ffffffff, %l3 = ffe1bd8e, Mem[0000000030141400] = 8dff72ff e7909c4d
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffff ffe1bd8e
!	%l4 = 00000000000000ff, Mem[0000000021800001] = f2b5ed58
	stb	%l4,[%o3+0x001]		! Mem[0000000021800000] = f2ffed58
!	Mem[00000000300c1400] = 00000000, %l0 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%l5 = 0000000034e67b3d, Mem[0000000010041410] = 0000862b
	stwa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 34e67b3d
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff5e6240 ff0072e3 00000000 00000000
!	Mem[0000000010001410] = 62a80460 1a53d335 16ff85da 40588747
!	Mem[0000000010001420] = de45fb04 a1472f5e 340353ac c12833ff
!	Mem[0000000010001430] = a0f4213d 0000c661 62ef3c78 bb5ee3d7
	ldda	[%i0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010001400

!	Check Point 12 for processor 0

	set	p0_check_pt_data_12,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 00000000ffe1bd8e
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000034e67b3d
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = 00000000000034d5
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff 34d5ff05
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 2ce1bd8e 705a5f2c
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x48],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 6081daa3 34d5b805
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 26975252 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ed34871b 0000003e
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff5e6240 ff0072e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 62a80460 1a53d335
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 16ff85da 40588747
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = de45fb04 a1472f5e
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 340353ac c12833ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = a0f4213d 0000c661
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 62ef3c78 bb5ee3d7
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 12 completed


p0_label_61:
!	Mem[0000000010041400] = ff5e0000, %l0 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l0	! %l0 = 000000000000ff5e
!	Mem[0000000030001410] = ff5e6240000072e3, %l2 = ffffffffffffffff
	ldxa	[%i0+%o5]0x81,%l2	! %l2 = ff5e6240000072e3
!	Mem[0000000030101410] = 2697525200000000, %l1 = 0000000061fa6bf3
	ldxa	[%i4+%o5]0x89,%l1	! %l1 = 2697525200000000
!	Mem[0000000010181408] = ffe67b3d, %l0 = 000000000000ff5e
	ldsba	[%i6+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181408] = 4db35501, %l6 = 000000002c5f5a70
	lduwa	[%i6+%o4]0x81,%l6	! %l6 = 000000004db35501
!	Mem[0000000010141400] = ed34871b, %l6 = 000000004db35501
	ldswa	[%i5+%g0]0x80,%l6	! %l6 = ffffffffed34871b
!	Mem[0000000010001404] = ff0072e3, %l5 = 0000000034e67b3d
	ldsh	[%i0+0x004],%l5		! %l5 = ffffffffffffff00
!	Mem[0000000030141400] = ffffffff8ebde1ff, %l3 = 00000000ffe1bd8e
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = ffffffff8ebde1ff
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010081408] = 037de3ff, %l4 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = ffffffffffffe3ff
!	Starting 10 instruction Store Burst
!	%f18 = 00000000, Mem[0000000010081400] = 1b8734ff
	sta	%f18,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000

p0_label_62:
!	%l4 = ffffffffffffe3ff, Mem[0000000010001410] = 62a80460
	stba	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = ffa80460
!	Mem[0000000020800001] = 0a2dbb34, %l0 = ffffffffffffffff
	ldstuba	[%o1+0x001]%asi,%l0	! %l0 = 0000002d000000ff
!	Mem[0000000010081400] = 00000000, %l0 = 000000000000002d
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f0  = 000000ff 34d5ff05, Mem[0000000030181410] = 00000000 000000ff
	stda	%f0 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff 34d5ff05
!	%f4  = ffe67b3d 00000000, Mem[00000000300c1400] = 00000000 0ae67d03
	stda	%f4 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffe67b3d 00000000
!	%l2 = ff5e6240000072e3, Mem[0000000030081410] = ffe67b3d00000000
	stxa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = ff5e6240000072e3
!	%l6 = ed34871b, %l7 = 000034d5, Mem[0000000010181408] = ffe67b3d 2c97ffff
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = ed34871b 000034d5
!	%l4 = ffffe3ff, %l5 = ffffff00, Mem[00000000300c1408] = 00000080 cc5213ff
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffe3ff ffffff00
!	Mem[0000000021800081] = acffb20f, %l5 = ffffffffffffff00
	ldstuba	[%o3+0x081]%asi,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ffb8d53405b8d534, %l4 = ffffffffffffe3ff
	ldxa	[%i5+%o5]0x88,%l4	! %l4 = ffb8d53405b8d534

p0_label_63:
!	Mem[0000000010141410] = 05b8d534, %l2 = ff5e6240000072e3
	lduba	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000034
!	Mem[00000000201c0000] = 3effafd5, %l0 = 0000000000000000
	ldsh	[%o0+%g0],%l0		! %l0 = 0000000000003eff
!	Mem[00000000211c0000] = ffffe4d2, %l7 = 00000000000034d5
	ldsba	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041410] = 3d7be634, %l1 = 2697525200000000
	ldswa	[%i1+%o5]0x88,%l1	! %l1 = 000000003d7be634
!	Mem[0000000010041408] = 26975252, %l7 = ffffffffffffffff
	ldswa	[%i1+%o4]0x80,%l7	! %l7 = 0000000026975252
!	Mem[0000000010001400] = e37200ff40625eff, %f18 = 00000000 00000000
	ldda	[%i0+%g0]0x88,%f18	! %f18 = e37200ff 40625eff
!	Mem[0000000010101410] = ffe67d03, %f30 = 62ef3c78
	lda	[%i4+%o5]0x80,%f30	! %f30 = ffe67d03
!	Mem[00000000300c1400] = 00000000, %l0 = 0000000000003eff
	ldsha	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = 26975252, %l3 = ffffffff8ebde1ff
	ldsw	[%i1+%o4],%l3		! %l3 = 0000000026975252
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 00000000, %l3 = 0000000026975252
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 00000000000000ff

p0_label_64:
!	Mem[0000000010141408] = 0dd4a926, %l2 = 0000000000000034
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 000000000dd4a926
!	%l7 = 0000000026975252, Mem[0000000010041420] = 6081daa3
	sth	%l7,[%i1+0x020]		! Mem[0000000010041420] = 5252daa3
!	%l1 = 000000003d7be634, Mem[0000000010041400] = 0000000000005eff
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000003d7be634
!	%l5 = 00000000000000ff, Mem[0000000010081408] = 037de3ff
	stba	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 037de3ff
!	Mem[0000000030001400] = daa49daa, %l0 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 00000000daa49daa
!	Mem[0000000030141400] = ffffffff, %l1 = 000000003d7be634
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000211c0000] = ffffe4d2, %l2 = 000000000dd4a926
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010041408] = 52529726, %l1 = 00000000000000ff
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 0000000052529726
!	%l6 = ffffffffed34871b, Mem[00000000201c0000] = 3effafd5, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 871bafd5
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %f31 = bb5ee3d7
	lda	[%i4+%o5]0x89,%f31	! %f31 = 00000000

p0_label_65:
!	Mem[0000000010001410] = ffa80460, %l6 = ffffffffed34871b
	ldsw	[%i0+%o5],%l6		! %l6 = ffffffffffa80460
!	Mem[0000000030101408] = ff72ff8d, %f2  = 00000000
	lda	[%i4+%o4]0x81,%f2 	! %f2 = ff72ff8d
!	Mem[0000000010181410] = ff91163e34d5b8ff, %f2  = ff72ff8d 00000000
	ldda	[%i6+%o5]0x80,%f2 	! %f2  = ff91163e 34d5b8ff
!	Mem[00000000211c0000] = ffffe4d2, %l1 = 0000000052529726
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[00000000300c1400] = ffe67b3d 00000000, %l0 = daa49daa, %l1 = ffffffff
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000 00000000ffe67b3d
!	Mem[00000000300c1400] = 00000000, %l1 = 00000000ffe67b3d
	ldswa	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 000000003d7be634, %f6  = 2ce1bd8e 705a5f2c
	ldda	[%i1+%g0]0x88,%f6 	! %f6  = 00000000 3d7be634
!	Mem[00000000300c1408] = ffe3ffff, %l3 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l3	! %l3 = ffffffffffffffe3
!	Mem[0000000030081400] = 34d5ff05, %l4 = ffb8d53405b8d534
	ldsba	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000005
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000030001408] = 00000000
	stwa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff

!	Check Point 13 for processor 0

	set	p0_check_pt_data_13,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffe3
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000005
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffa80460
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000026975252
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff 34d5ff05
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff91163e 34d5b8ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 3d7be634
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = e37200ff 40625eff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ffe67d03 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 13 completed


p0_label_66:
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000005
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%f29 = 0000c661, Mem[0000000010081420] = a509aa5e
	sta	%f29,[%i2+0x020]%asi	! Mem[0000000010081420] = 0000c661
!	%l2 = 00000000000000ff, Mem[0000000010041408] = ff00000000000000
	stxa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000000000ff
!	Mem[000000001010140c] = 1b8734ed, %l6 = ffffffffffa80460
	ldstuba	[%i4+0x00c]%asi,%l6	! %l6 = 0000001b000000ff
!	Mem[0000000030001400] = 05000000, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041400] = 34e67b3d, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 0000000034e67b3d
!	Mem[0000000010181410] = 3e1691ff, %l0 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 000000003e1691ff
!	Mem[0000000030101408] = 8dff72ff, %l1 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%f16 = ff5e6240 ff0072e3, %l6 = 000000000000001b
!	Mem[0000000010041418] = 5c844fff6004a862
	add	%i1,0x018,%g1
	stda	%f16,[%g1+%l6]ASI_PST8_P ! Mem[0000000010041418] = 5c844f40ff0472e3
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 34d5ff05, %f19 = 40625eff
	lda	[%i2+%g0]0x89,%f19	! %f19 = 34d5ff05

p0_label_67:
!	Mem[000000001000141c] = 40588747, %l2 = 0000000034e67b3d
	ldsba	[%i0+0x01f]%asi,%l2	! %l2 = 0000000000000047
!	Mem[0000000030041408] = 3d7be6ff, %l7 = 0000000026975252
	ldsba	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081400] = 05ffd534 ff000000, %l2 = 00000047, %l3 = ffffffe3
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 0000000005ffd534 00000000ff000000
!	Mem[0000000010101400] = efc09f00000000ff, %f26 = 340353ac c12833ff
	ldda	[%i4+%g0]0x88,%f26	! %f26 = efc09f00 000000ff
!	Mem[00000000218000c0] = 5804cd54, %l5 = 00000000000000ff
	lduba	[%o3+0x0c1]%asi,%l5	! %l5 = 0000000000000004
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010041400] = 000000ff 00000000 00000000 000000ff
!	Mem[0000000010041410] = 34e67b3d 00000000 5c844f40 ff0472e3
!	Mem[0000000010041420] = 5252daa3 3f403703 ac35f303 3028972c
!	Mem[0000000010041430] = c40ffeae 04f0a313 3b52db8a 0000003e
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[00000000100c1410] = 00ff0000, %l7 = ffffffffffffffff
	ldswa	[%i3+%o5]0x80,%l7	! %l7 = 0000000000ff0000
!	Mem[00000000300c1400] = 00000000, %l3 = 00000000ff000000
	lduha	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000ff0000, Mem[0000000010001408] = ff000000
	stha	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000

p0_label_68:
!	%f6  = 00000000 3d7be634, Mem[0000000010141418] = 4e7b6629 00000dff
	std	%f6 ,[%i5+0x018]	! Mem[0000000010141418] = 00000000 3d7be634
!	Mem[0000000030181408] = 4db35501, %l7 = 0000000000ff0000
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 0000004d000000ff
!	%l2 = 0000000005ffd534, Mem[0000000010001434] = 0000c661, %asi = 80
	stha	%l2,[%i0+0x034]%asi	! Mem[0000000010001434] = d534c661
!	%l1 = 00000000000000ff, Mem[0000000010001408] = 00000000
	stwa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	%l4 = 0000000000000000, Mem[00000000211c0000] = ffffe4d2, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000e4d2
!	Mem[000000001010140c] = ff8734ed, %l1 = 000000ff, %l3 = 00000000
	add	%i4,0x0c,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 00000000ff8734ed
!	Mem[0000000010001408] = 000000ff, %l1 = 00000000000000ff
	swapa	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l5 = 0000000000000004, Mem[0000000010141410] = 05b8d534
	stba	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 05b8d504
!	%l4 = 0000000000000000, Mem[0000000010141420] = a509aa5e
	stw	%l4,[%i5+0x020]		! Mem[0000000010141420] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000 3d7be6ff ffe3ffff 00ffffff
!	Mem[00000000300c1410] = 705a5f2c 00000000 00000000 00000097
!	Mem[00000000300c1420] = ed34871b 037de60a e3720000 40625eff
!	Mem[00000000300c1430] = 8fbbc3a2 ff72c64a d0eab90c daa49daa
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400

p0_label_69:
!	Mem[0000000010001410] = ffa80460, %l1 = 00000000000000ff
	lduha	[%i0+0x012]%asi,%l1	! %l1 = 0000000000000460
!	Mem[0000000021800100] = 97530ae8, %l2 = 0000000005ffd534
	lduh	[%o3+0x100],%l2		! %l2 = 0000000000009753
!	Mem[0000000010041438] = 3b52db8a, %l1 = 0000000000000460
	ldsh	[%i1+0x038],%l1		! %l1 = 0000000000003b52
!	Mem[00000000201c0000] = 871bafd5, %l0 = 000000003e1691ff
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffff871b
!	Mem[00000000300c1400] = 000000003d7be6ff, %l3 = 00000000ff8734ed
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = 000000003d7be6ff
!	Mem[0000000010141400] = ed34871b037de60a, %f16 = 000000ff 00000000
	ldda	[%i5+%g0]0x80,%f16	! %f16 = ed34871b 037de60a
!	Mem[00000000201c0000] = 871bafd5, %l6 = 000000000000001b
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 000000000000001b
!	Mem[0000000030081400] = 05ffd534, %l6 = 000000000000001b
	lduba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000005
!	Mem[0000000030001408] = 00030000ff000000, %f24 = 5252daa3 3f403703
	ldda	[%i0+%o4]0x89,%f24	! %f24 = 00030000 ff000000
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000004d, Mem[0000000030001408] = 000000ff
	stba	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 4d0000ff

p0_label_70:
!	%f22 = 5c844f40 ff0472e3, Mem[0000000030101400] = f6ff052c 26a9d40d
	stda	%f22,[%i4+%g0]0x81	! Mem[0000000030101400] = 5c844f40 ff0472e3
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000004
	swapa	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001414] = 1a53d335, %l0 = ffffffffffff871b, %asi = 80
	swapa	[%i0+0x014]%asi,%l0	! %l0 = 000000001a53d335
!	%f18 = 00000000 000000ff, Mem[0000000010141408] = 00000034 52f578f7
	stda	%f18,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 000000ff
!	%l1 = 0000000000003b52, Mem[0000000030041408] = ffe67b3d
	stwa	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 00003b52
!	Mem[0000000030001408] = ff00004d, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 00000000ff00004d
!	%f25 = ff000000, Mem[0000000030181400] = 00005804
	sta	%f25,[%i6+%g0]0x89	! Mem[0000000030181400] = ff000000
!	Mem[0000000010101400] = 000000ff, %l5 = 00000000ff00004d
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030181400] = ff000000, %f16 = ed34871b
	lda	[%i6+%g0]0x89,%f16	! %f16 = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 523b0000, %l3 = 000000003d7be6ff
	ldsha	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000

!	Check Point 14 for processor 0

	set	p0_check_pt_data_14,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000001a53d335
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000003b52
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000009753
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000005
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000004d
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 3d7be6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffe3ffff 00ffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 705a5f2c 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000097
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ed34871b 037de60a
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = e3720000 40625eff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 8fbbc3a2 ff72c64a
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = d0eab90c daa49daa
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 037de60a
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x98],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 34e67b3d 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0xa0],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 5c844f40 ff0472e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa8],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00030000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xb0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ac35f303 3028972c
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb8],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = c40ffeae 04f0a313
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xc0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 3b52db8a 0000003e
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 14 completed


p0_label_71:
!	Mem[0000000010081408] = ffe37d03 9c0aa926, %l6 = 00000005, %l7 = 0000004d
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000ffe37d03 000000009c0aa926
!	Mem[0000000030101410] = 0000000052529726, %l0 = 000000001a53d335
	ldxa	[%i4+%o5]0x81,%l0	! %l0 = 0000000052529726
!	Mem[0000000010081408] = 037de3ff, %l0 = 0000000052529726
	ldswa	[%i2+%o4]0x88,%l0	! %l0 = 00000000037de3ff
!	Mem[0000000010041428] = ac35f3033028972c, %l5 = 00000000000000ff
	ldxa	[%i1+0x028]%asi,%l5	! %l5 = ac35f3033028972c
!	Mem[0000000010001408] = 00000000 000000ff, %l4 = 00000000, %l5 = 3028972c
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[0000000030101400] = 404f845c, %l5 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l5	! %l5 = 000000000000845c
!	Mem[000000001000141c] = 40588747, %l7 = 000000009c0aa926
	lduba	[%i0+0x01f]%asi,%l7	! %l7 = 0000000000000047
!	Mem[0000000010101408] = ff000000, %l3 = 0000000000000000
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[00000000300c1400] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (17)
!	%l2 = 0000000000009753, Mem[00000000300c1408] = ffffe3ff
	stwa	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00009753

p0_label_72:
!	%f23 = ff0472e3, Mem[0000000010001400] = ff5e6240
	sta	%f23,[%i0+%g0]0x80	! Mem[0000000010001400] = ff0472e3
!	%l4 = 0000000000000000, Mem[0000000010141410] = 05b8d504
	stha	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 05b80000
!	%f30 = 3b52db8a 0000003e, Mem[0000000030081410] = 000072e3 ff5e6240
	stda	%f30,[%i2+%o5]0x89	! Mem[0000000030081410] = 3b52db8a 0000003e
!	Mem[0000000010101420] = f283ff8f, %l5 = 000000000000845c, %asi = 80
	swapa	[%i4+0x020]%asi,%l5	! %l5 = 00000000f283ff8f
!	Mem[0000000010141408] = ff000000, %l2 = 0000000000009753
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1434] = 23237bf5, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x034]%asi,%l2	! %l2 = 0000000023237bf5
!	%l1 = 0000000000003b52, Mem[0000000010081410] = 0000862b
	stwa	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 00003b52
!	%f0  = 00000000 3d7be6ff, %l6 = 00000000ffe37d03
!	Mem[0000000030041430] = 35d3531a0db0f9ba
	add	%i1,0x030,%g1
	stda	%f0,[%g1+%l6]ASI_PST16_S ! Mem[0000000030041430] = 35d3531a3d7be6ff
!	Mem[0000000020800000] = 0affbb34, %l3 = 000000000000ff00
	ldstuba	[%o1+0x000]%asi,%l3	! %l3 = 0000000a000000ff
!	Starting 10 instruction Load Burst
!	%l0 = 00000000037de3ff, Mem[0000000030081408] = 00000004
	stwa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 037de3ff

p0_label_73:
!	Mem[0000000010141410] = 0000b805, %l5 = 00000000f283ff8f
	lduwa	[%i5+%o5]0x80,%l5	! %l5 = 000000000000b805
!	Mem[00000000300c1410] = 2c5f5a70, %l2 = 0000000023237bf5
	lduha	[%i3+%o5]0x89,%l2	! %l2 = 0000000000005a70
!	Mem[0000000030001408] = 00000000, %f14 = d0eab90c
	lda	[%i0+%o4]0x89,%f14	! %f14 = 00000000
!	%f31 = 0000003e, %f29 = 04f0a313, %f19 = 000000ff
	fsubs	%f31,%f29,%f19		! %l0 = 00000000037de421, Unfinished, %fsr = 0000000000
!	Mem[0000000030181400] = ff000000, %f29 = 04f0a313
	lda	[%i6+%g0]0x89,%f29	! %f29 = ff000000
!	Mem[00000000300c1410] = 2c5f5a70, %l2 = 0000000000005a70
	lduba	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000070
!	Mem[0000000010141410] = 05b80000, %f12 = 8fbbc3a2
	lda	[%i5+%o5]0x88,%f12	! %f12 = 05b80000
!	Mem[0000000020800040] = e3ffe589, %l3 = 000000000000000a
	ldsha	[%o1+0x040]%asi,%l3	! %l3 = ffffffffffffe3ff
!	Mem[0000000030101410] = 2697525200000000, %f24 = 00030000 ff000000
	ldda	[%i4+%o5]0x89,%f24	! %f24 = 26975252 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000000, %l2 = 0000000000000070
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff

p0_label_74:
!	Mem[0000000020800000] = ffffbb34, %l6 = 00000000ffe37d03
	ldstuba	[%o1+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	%f2  = ffe3ffff 00ffffff, %l1 = 0000000000003b52
!	Mem[0000000010001428] = 340353acc12833ff
	add	%i0,0x028,%g1
	stda	%f2,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010001428] = 340353acffffe3ff
!	Mem[0000000030041408] = 00003b52, %l5 = 000000000000b805
	swapa	[%i1+%o4]0x81,%l5	! %l5 = 0000000000003b52
!	Mem[0000000030141400] = ffffffff, %l1 = 0000000000003b52
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030181410] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101410] = ffe67d03, %l3 = ffffffffffffe3ff
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	%l5 = 0000000000003b52, Mem[0000000010181400] = 000000ff
	stba	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000052
!	Mem[0000000020800001] = ffffbb34, %l0 = 00000000037de421
	ldstub	[%o1+0x001],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000010001400] = e37204ff, %l3 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 00000000e37204ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = 862b9b4e, %l6 = 00000000000000ff
	lduh	[%o3+0x040],%l6		! %l6 = 000000000000862b

p0_label_75:
!	Mem[0000000021800080] = acffb20f, %l2 = 0000000000000000
	lduha	[%o3+0x080]%asi,%l2	! %l2 = 000000000000acff
!	Mem[00000000211c0000] = 0000e4d2, %l1 = 00000000000000ff
	ldub	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000030001408] = 0003000000000000, %l4 = 0000000000000000
	ldxa	[%i0+%o4]0x89,%l4	! %l4 = 0003000000000000
!	Mem[0000000030181400] = ff000000, %l2 = 000000000000acff
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = efc001f10000ff00, %l5 = 0000000000003b52
	ldxa	[%i3+%o5]0x88,%l5	! %l5 = efc001f10000ff00
!	Mem[0000000010141410] = 05b80000, %l0 = 00000000000000ff
	lduha	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l2 = 0000000000000000
	lduba	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l0 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %f26 = ac35f303
	lda	[%i0+%o4]0x88,%f26	! %f26 = 000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = e37204ff, Mem[0000000010001408] = 000000ff 00000000
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 e37204ff

!	Check Point 15 for processor 0

	set	p0_check_pt_data_15,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000e37204ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0003000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = efc001f10000ff00
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000000000862b
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000047
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 705a5f2c 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000097
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 05b80000 ff72c64a
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 00000000 daa49daa
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 26975252 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x70],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 000000ff 3028972c
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x78],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = c40ffeae ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 15 completed


p0_label_76:
!	%f28 = c40ffeae ff000000, %l3 = 00000000e37204ff
!	Mem[0000000010041428] = ac35f3033028972c
	add	%i1,0x028,%g1
	stda	%f28,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010041428] = 000000ffaefe0fc4
!	%f8  = ed34871b 037de60a, %l0 = 0000000000000000
!	Mem[0000000030101410] = 0000000052529726
	add	%i4,0x010,%g1
	stda	%f8,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030101410] = 0000000052529726
!	Mem[00000000218000c0] = 5804cd54, %l4 = 0003000000000000
	ldstuba	[%o3+0x0c0]%asi,%l4	! %l4 = 00000058000000ff
!	%f24 = 26975252 00000000, %l4 = 0000000000000058
!	Mem[00000000100c1418] = 3317a61252529726
	add	%i3,0x018,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_PL ! Mem[00000000100c1418] = 3317a60052529726
!	%l2 = 0000000000000000, Mem[0000000010101410] = f36bfa61037de6ff
	stxa	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	%l2 = 00000000, %l3 = e37204ff, Mem[0000000030081400] = 05ffd534 ff000000
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 e37204ff
!	%l4 = 00000058, %l5 = 0000ff00, Mem[0000000030081400] = 00000000 e37204ff
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000058 0000ff00
!	Mem[0000000010141408] = ff000000, %l3 = 00000000e37204ff
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010041400] = 000000ff, %l0 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffb35501, %f2  = ffe3ffff
	lda	[%i6+%o4]0x81,%f2 	! %f2 = ffb35501

p0_label_77:
!	Mem[0000000010181410] = ff00000034d5b8ff, %l6 = 000000000000862b
	ldxa	[%i6+%o5]0x80,%l6	! %l6 = ff00000034d5b8ff
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010041400] = 00000000 00000000 00000000 000000ff
!	Mem[0000000010041410] = 34e67b3d 00000000 5c844f40 ff0472e3
!	Mem[0000000010041420] = 5252daa3 3f403703 000000ff aefe0fc4
!	Mem[0000000010041430] = c40ffeae 04f0a313 3b52db8a 0000003e
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000010101400] = ff000000, %f1  = 3d7be6ff
	lda	[%i4+%g0]0x80,%f1 	! %f1 = ff000000
!	Mem[0000000010181410] = ff000000, %l6 = ff00000034d5b8ff
	ldsha	[%i6+%o5]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000047
	ldsba	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = ffe37d03, %l0 = 00000000000000ff
	lduba	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000003
!	Mem[0000000010081400] = 0000002d, %l3 = 00000000ff000000
	lduba	[%i2+0x002]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 0000e4d2, %l3 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 0000003e, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l1	! %l1 = 000000000000003e
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 0000b805, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 000000000000b805

p0_label_78:
!	Mem[00000000100c1439] = 8dff72e3, %l0 = 0000000000000003
	ldstub	[%i3+0x039],%l0		! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000010101410] = 0000000000000000
	stxa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000000000ff
!	%l1 = 000000000000003e, Mem[0000000030181408] = ffb35501
	stha	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 003e5501
!	Mem[0000000030001408] = 00000000, %l7 = 000000000000b805
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l1 = 000000000000003e
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041428] = 000000ffaefe0fc4, %l7 = 0000000000000000, %l5 = efc001f10000ff00
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = 000000ffaefe0fc4
!	Mem[0000000010181410] = 000000ff, %l4 = 0000000000000058
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%f6  = 00000000, Mem[0000000030001408] = 000000ff
	sta	%f6 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010001400] = ff000000
	stha	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1404] = d0eab90c, %l1 = 0000000000000000
	lduw	[%i3+0x004],%l1		! %l1 = 00000000d0eab90c

p0_label_79:
!	Mem[0000000010141410] = 05b80000, %l6 = ffffffffffffff00
	lduha	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 00000000000000ff
	setx	0x54aa7c080b32680f,%g7,%l0 ! %l0 = 54aa7c080b32680f
!	%l1 = 00000000d0eab90c
	setx	0x2ae38a6838adb30c,%g7,%l1 ! %l1 = 2ae38a6838adb30c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 54aa7c080b32680f
	setx	0xfd896da7db645910,%g7,%l0 ! %l0 = fd896da7db645910
!	%l1 = 2ae38a6838adb30c
	setx	0x8cf605e032e32a36,%g7,%l1 ! %l1 = 8cf605e032e32a36
!	Mem[0000000030141400] = ffffffff8ebde1ff, %l2 = 0000000000000000
	ldxa	[%i5+%g0]0x81,%l2	! %l2 = ffffffff8ebde1ff
!	Mem[0000000030001400] = ff000005, %l5 = 000000ffaefe0fc4
	lduha	[%i0+%g0]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[00000000218000c0] = ff04cd54, %l1 = 8cf605e032e32a36
	lduh	[%o3+0x0c0],%l1		! %l1 = 000000000000ff04
!	Mem[0000000030181410] = ff0000ff 34d5ff05, %l2 = 8ebde1ff, %l3 = 00000000
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff0000ff 0000000034d5ff05
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l2 = 00000000ff0000ff
	lduba	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 0000000000f60097, %l1 = 000000000000ff04, %l5 = 000000000000ff00
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l1,%l5	! %l5 = 0000000000f60097

p0_label_80:
!	Mem[00000000300c1410] = 705a5f2c, %l5 = 0000000000f60097
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 00000070000000ff
!	Mem[0000000010081410] = 00003b52, %l3 = 0000000034d5ff05
	swapa	[%i2+%o5]0x88,%l3	! %l3 = 0000000000003b52
!	Mem[000000001000141e] = 40588747, %l0 = fd896da7db645910
	ldstuba	[%i0+0x01e]%asi,%l0	! %l0 = 00000087000000ff
!	%l4 = 000000ff, %l5 = 00000070, Mem[0000000030001410] = 40625eff e3720000
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff 00000070
!	Mem[0000000030141400] = ffffffff, %l0 = 0000000000000087
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%f10 = e3720000 40625eff, %l4 = 00000000000000ff
!	Mem[0000000010141438] = 1a53d335daa49daa
	add	%i5,0x038,%g1
	stda	%f10,[%g1+%l4]ASI_PST32_P ! Mem[0000000010141438] = e372000040625eff
!	%l4 = 00000000000000ff, Mem[0000000010141400] = 1b8734ed
	stha	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 1b8700ff
!	%l1 = 000000000000ff04, Mem[0000000030141410] = 00000000
	stha	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = ff040000
!	%f8  = ed34871b 037de60a, Mem[0000000030041400] = e3000000 0000003e
	stda	%f8 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ed34871b 037de60a
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000

!	Check Point 16 for processor 0

	set	p0_check_pt_data_16,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ff04
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000003b52
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000070
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffb35501 00ffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 34e67b3d 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 5c844f40 ff0472e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x78],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 5252daa3 3f403703
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 000000ff aefe0fc4
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x88],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = c40ffeae 04f0a313
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x90],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 3b52db8a 0000003e
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 16 completed


p0_label_81:
!	Mem[00000000100c1408] = 2c05fff63eff0000, %f0  = 00000000 ff000000
	ldda	[%i3+%o4]0x80,%f0 	! %f0  = 2c05fff6 3eff0000
!	Mem[0000000010141408] = ff0472e3, %l6 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000e3
!	Mem[0000000030001400] = ff000005, %l0 = 00000000000000ff
	ldsha	[%i0+%g0]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030141410] = ff040000, %l4 = 0000000000000000
	ldswa	[%i5+%o5]0x81,%l4	! %l4 = ffffffffff040000
!	Mem[0000000010141400] = ff00871b, %f18 = 00000000
	lda	[%i5+%g0]0x80,%f18	! %f18 = ff00871b
!	Mem[0000000030101400] = 404f845c, %l5 = 0000000000000070
	lduwa	[%i4+%g0]0x89,%l5	! %l5 = 00000000404f845c
!	Mem[00000000211c0000] = 0000e4d2, %l4 = ffffffffff040000
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %f11 = 40625eff
	lda	[%i1+%o4]0x89,%f11	! %f11 = 00000000
!	Mem[0000000010081424] = d5cf6cf8, %l3 = 0000000000003b52
	lduwa	[%i2+0x024]%asi,%l3	! %l3 = 00000000d5cf6cf8
!	Starting 10 instruction Store Burst
!	%l3 = 00000000d5cf6cf8, Mem[0000000030101410] = 00000000
	stba	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = f8000000

p0_label_82:
!	%l7 = 0000000000000000, Mem[0000000010181410] = 000000ff
	stwa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%l6 = 00000000000000e3, Mem[00000000201c0000] = 871bafd5
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 00e3afd5
!	%f6  = 00000000 00000097, Mem[0000000030041408] = 00000000 8ebce0f2
	stda	%f6 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 00000097
!	Mem[0000000030081400] = 00000058, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000058
!	%l6 = 00000000000000e3, Mem[0000000010081408] = 26a90a9c037de3ff
	stxa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000e3
!	%l3 = 00000000d5cf6cf8, Mem[0000000030041408] = 0000000000000097
	stxa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000d5cf6cf8
!	%l7 = 0000000000000000, Mem[0000000030101410] = f8000000
	stwa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%f30 = 3b52db8a, Mem[00000000300c1410] = ff5a5f2c
	sta	%f30,[%i3+%o5]0x81	! Mem[00000000300c1410] = 3b52db8a
!	Mem[0000000010001400] = 00000000, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000ff00, %l1 = 000000000000ff04
	lduba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000

p0_label_83:
!	Mem[0000000010041408] = 00000000, %f30 = 3b52db8a
	lda	[%i1+%o4]0x88,%f30	! %f30 = 00000000
!	Mem[00000000300c1408] = 53970000, %f8  = ed34871b
	lda	[%i3+%o4]0x81,%f8 	! %f8 = 53970000
!	Mem[0000000010001410] = ffa80460, %l4 = 0000000000000000
	ldsh	[%i0+0x012],%l4		! %l4 = 0000000000000460
!	Mem[0000000030041408] = 00000000d5cf6cf8, %l4 = 0000000000000460
	ldxa	[%i1+%o4]0x81,%l4	! %l4 = 00000000d5cf6cf8
!	Mem[0000000030081408] = 037de3ff, %l1 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l1	! %l1 = 000000000000037d
!	Mem[0000000010101410] = 000000ff, %f29 = 04f0a313
	lda	[%i4+%o5]0x88,%f29	! %f29 = 000000ff
!	Mem[00000000300c1400] = 00000000, %l1 = 000000000000037d
	lduba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = 0000b805, %f5  = 00000000
	lda	[%i5+%o5]0x80,%f5 	! %f5 = 0000b805
!	Mem[0000000030101400] = 5c844f40, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l7	! %l7 = 000000005c844f40
!	Starting 10 instruction Store Burst
!	%l4 = 00000000d5cf6cf8, Mem[0000000030101410] = 00000000
	stha	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 00006cf8

p0_label_84:
!	Mem[0000000010001410] = 6004a8ff, %l5 = 00000000404f845c
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	%f29 = 000000ff, Mem[0000000030101410] = f86c0000
	sta	%f29,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff
!	%f5  = 0000b805, Mem[0000000010141410] = 05b80000
	sta	%f5 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000b805
!	Mem[0000000030041408] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%f16 = 00000000 00000000 ff00871b 000000ff
!	%f20 = 34e67b3d 00000000 5c844f40 ff0472e3
!	%f24 = 5252daa3 3f403703 000000ff aefe0fc4
!	%f28 = c40ffeae 000000ff 00000000 0000003e
	stda	%f16,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
	membar	#Sync			! Added by membar checker (19)
!	%l7 = 000000005c844f40, Mem[0000000010141418] = 5c844f40, %asi = 80
	stwa	%l7,[%i5+0x018]%asi	! Mem[0000000010141418] = 5c844f40
!	%l6 = 000000e3, %l7 = 5c844f40, Mem[0000000030141408] = ffe3b733 9f5e6240
	stda	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000e3 5c844f40
!	%l0 = ffffff00, %l1 = 00000000, Mem[0000000030181400] = ff0000ff 0a0b74ff
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffff00 00000000
!	%l5 = 0000000000000000, Mem[0000000010001408] = 00000000
	stha	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00ff0000, %l2 = 0000000000000058
	lduwa	[%i3+%o5]0x80,%l2	! %l2 = 0000000000ff0000

p0_label_85:
!	Mem[0000000010101408] = 000000ff, %l1 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101408] = 000000ff, %l2 = 0000000000ff0000
	ldsha	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 00e3afd5, %l0 = ffffffffffffff00
	ldsba	[%o0+0x001]%asi,%l0	! %l0 = ffffffffffffffe3
!	Mem[0000000010081410] = 05ffd534, %l0 = ffffffffffffffe3
	lduwa	[%i2+%o5]0x80,%l0	! %l0 = 0000000005ffd534
!	Mem[0000000010081410] = 34d5ff05, %l4 = 00000000d5cf6cf8
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 000000000000ff05
!	Mem[0000000010081400] = 0000002d 037de60a, %l0 = 05ffd534, %l1 = 000000ff
	ldda	[%i2+0x000]%asi,%l0	! %l0 = 000000000000002d 00000000037de60a
!	Mem[0000000020800000] = ffffbb34, %l4 = 000000000000ff05
	ldsb	[%o1+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010181410] = ffb8d53400000000, %l5 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l5	! %l5 = ffb8d53400000000
!	Starting 10 instruction Store Burst
!	Mem[000000001018141a] = 00000052, %l6 = 00000000000000e3
	ldstub	[%i6+0x01a],%l6		! %l6 = 00000000000000ff

!	Check Point 17 for processor 0

	set	p0_check_pt_data_17,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000002d
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000037de60a
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000d5cf6cf8
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffb8d53400000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000005c844f40
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 2c05fff6 3eff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 705a5f2c 0000b805
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 53970000 037de60a
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = e3720000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff00871b 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = c40ffeae 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x78],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 0000003e
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 17 completed


p0_label_86:
!	%f24 = 5252daa3 3f403703, %l1 = 00000000037de60a
!	Mem[00000000100c1400] = 3dffffa7d0eab90c
	stda	%f24,[%i3+%l1]ASI_PST32_P ! Mem[00000000100c1400] = 5252daa3d0eab90c
!	%l0 = 000000000000002d, Mem[00000000100c1430] = 3b54f316000000ff
	stx	%l0,[%i3+0x030]		! Mem[00000000100c1430] = 000000000000002d
!	Mem[0000000010141416] = 00000000, %l4 = ffffffffffffffff
	ldstub	[%i5+0x016],%l4		! %l4 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030181400] = ffffff00
	stha	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = ffff00ff
!	%l3 = 00000000d5cf6cf8, Mem[0000000030081410] = 3e000000
	stha	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 6cf80000
!	%f10 = e3720000 00000000, Mem[0000000010001408] = 00000000 ff0472e3
	std	%f10,[%i0+%o4]	! Mem[0000000010001408] = e3720000 00000000
!	%f24 = 5252daa3 3f403703, Mem[00000000100c1408] = 2c05fff6 3eff0000
	stda	%f24,[%i3+%o4]0x80	! Mem[00000000100c1408] = 5252daa3 3f403703
!	%l0 = 000000000000002d, Mem[0000000030141408] = 000000e3
	stwa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000002d
!	Mem[00000000100c1400] = a3da5252, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 00000052000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 34d5ff05, %f28 = c40ffeae
	lda	[%i2+%o5]0x88,%f28	! %f28 = 34d5ff05

p0_label_87:
!	Mem[0000000030141410] = 5d27fe8f000004ff, %l6 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l6	! %l6 = 5d27fe8f000004ff
!	Mem[000000001000142c] = ffffe3ff, %l7 = 000000005c844f40
	ldsh	[%i0+0x02c],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010101408] = ed3487ff000000ff, %f8  = 53970000 037de60a
	ldda	[%i4+%o4]0x88,%f8 	! %f8  = ed3487ff 000000ff
!	Mem[0000000030181400] = 00000000 ffff00ff, %l4 = 00000052, %l5 = 00000000
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 00000000ffff00ff 0000000000000000
!	Mem[0000000010141408] = ff0000001b8700ff, %l4 = 00000000ffff00ff
	ldxa	[%i5+%o4]0x88,%l4	! %l4 = ff0000001b8700ff
!	Mem[0000000010101408] = 000000ff, %l5 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041400] = 00000000 00000000 00000000 000000ff
!	Mem[0000000010041410] = 34e67b3d 00000000 5c844f40 ff0472e3
!	Mem[0000000010041420] = 5252daa3 3f403703 000000ff aefe0fc4
!	Mem[0000000010041430] = c40ffeae 04f0a313 3b52db8a 0000003e
	ldda	[%i1]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010041400
!	Mem[0000000010041404] = 00000000, %l7 = ffffffffffffffff
	lduha	[%i1+0x004]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = ed34871b, %f9  = 000000ff
	lda	[%i6+%o4]0x80,%f9 	! %f9 = ed34871b
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 01553e00, %l4 = ff0000001b8700ff
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 0000000001553e00

p0_label_88:
!	%f6  = 00000000 00000097, Mem[0000000010181410] = 00000000 34d5b8ff
	stda	%f6 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 00000097
!	%f6  = 00000000 00000097, Mem[00000000100c1408] = a3da5252 0337403f
	stda	%f6 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 00000097
!	Mem[00000000300c1410] = 3b52db8a, %l5 = 00000000000000ff
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 0000003b000000ff
	membar	#Sync			! Added by membar checker (20)
!	%l6 = 5d27fe8f000004ff, Mem[0000000010041400] = 00000000
	stba	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff
!	Mem[0000000010001431] = a0f4213d, %l2 = 00000000000000ff
	ldstuba	[%i0+0x031]%asi,%l2	! %l2 = 000000f4000000ff
!	%l7 = 0000000000000000, Mem[0000000030081410] = 6cf80000
	stha	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l5 = 000000000000003b, Mem[00000000201c0000] = 00e3afd5, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 003bafd5
!	Mem[00000000100c1400] = a3da52ff, %l6 = 5d27fe8f000004ff
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010001400] = 00000000, %l0 = 000000000000002d
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 34d5ff05, %l0 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l0	! %l0 = 000000000000ff05

p0_label_89:
!	Mem[0000000010081400] = 2d000000, %l1 = 00000000037de60a
	ldswa	[%i2+%g0]0x88,%l1	! %l1 = 000000002d000000
!	Mem[0000000030141400] = ffffffff, %l6 = 00000000000000ff
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030141410] = ff040000, %l0 = 000000000000ff05
	lduha	[%i5+%o5]0x81,%l0	! %l0 = 000000000000ff04
!	Mem[0000000030101408] = 3e16919f8dff72ff, %l2 = 00000000000000f4
	ldxa	[%i4+%o4]0x89,%l2	! %l2 = 3e16919f8dff72ff
!	Mem[00000000100c1424] = d08281c1, %f10 = e3720000
	lda	[%i3+0x024]%asi,%f10	! %f10 = d08281c1
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 000000000000ff04
	setx	0x96ad8ecfa30daff5,%g7,%l0 ! %l0 = 96ad8ecfa30daff5
!	%l1 = 000000002d000000
	setx	0xba7b74d01bd67fbc,%g7,%l1 ! %l1 = ba7b74d01bd67fbc
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 96ad8ecfa30daff5
	setx	0x5ade97a073ffb364,%g7,%l0 ! %l0 = 5ade97a073ffb364
!	%l1 = ba7b74d01bd67fbc
	setx	0x2edcf94fcfaed64a,%g7,%l1 ! %l1 = 2edcf94fcfaed64a
!	Mem[0000000030001410] = ff000000, %l6 = 000000000000ffff
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010181408] = ed34871b, %l6 = 00000000ff000000
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 00000000ed34871b
!	Mem[00000000100c141c] = 52529726, %l3 = 00000000d5cf6cf8
	lduba	[%i3+0x01e]%asi,%l3	! %l3 = 0000000000000097
!	Starting 10 instruction Store Burst
!	%l1 = 2edcf94fcfaed64a, Mem[0000000010081408] = 000000e3
	stwa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = cfaed64a

p0_label_90:
!	%l7 = 0000000000000000, Mem[0000000010041400] = 000000ff
	stba	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%l7 = 0000000000000000, Mem[0000000030001400] = ff000005
	stba	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000005
!	Mem[0000000030141410] = 000004ff, %l1 = 2edcf94fcfaed64a
	ldstuba	[%i5+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	%l4 = 01553e00, %l5 = 0000003b, Mem[00000000300c1408] = 53970000 00ffffff
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 01553e00 0000003b
!	Mem[0000000030181400] = ffff00ff, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 00000000ffff00ff
!	%l0 = 73ffb364, %l1 = 000000ff, Mem[0000000030181400] = 00000000 00000000
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 73ffb364 000000ff
!	Mem[0000000010181400] = 52000000, %l5 = 000000000000003b
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000052000000ff
!	%l0 = 5ade97a073ffb364, Mem[0000000030141408] = 0000002d
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = b364002d
!	%f30 = 3e000000 8adb523b, %f24 = 0337403f
	fdtoi	%f30,%f24		! %f24 = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041418] = 5c844f40 ff0472e3, %l6 = ed34871b, %l7 = ffff00ff
	ldd	[%i1+0x018],%l6		! %l6 = 000000005c844f40 00000000ff0472e3

!	Check Point 18 for processor 0

	set	p0_check_pt_data_18,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 5ade97a073ffb364
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 3e16919f8dff72ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000097
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000001553e00
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000052
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000005c844f40
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff0472e3
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 705a5f2c 0000b805
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000097
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ed3487ff ed34871b
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = d08281c1 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 3d7be634
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = e37204ff 404f845c
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 a3da5252
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = c40ffeae ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 13a3f004 aefe0fc4
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 3e000000 8adb523b
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 18 completed


p0_label_91:
!	Mem[0000000030141408] = b364002d5c844f40, %f12 = 05b80000 ff72c64a
	ldda	[%i5+%o4]0x81,%f12	! %f12 = b364002d 5c844f40
!	Mem[0000000030141400] = ffffffff, %l7 = 00000000ff0472e3
	ldswa	[%i5+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041424] = 3f403703, %l7 = ffffffffffffffff
	ldswa	[%i1+0x024]%asi,%l7	! %l7 = 000000003f403703
!	Mem[00000000201c0000] = 003bafd5, %l7 = 000000003f403703
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = 000000000000003b
!	Mem[0000000010041418] = 5c844f40, %l7 = 000000000000003b
	ldsha	[%i1+0x018]%asi,%l7	! %l7 = 0000000000005c84
!	Mem[0000000010041400] = 0000000000000000, %l1 = 00000000000000ff
	ldxa	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = ffe37d03, %l0 = 5ade97a073ffb364
	lduba	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000003
!	Mem[0000000030181410] = ff0000ff, %f13 = 5c844f40
	lda	[%i6+%o5]0x89,%f13	! %f13 = ff0000ff
!	Mem[0000000030181408] = a0000000 1b8700ff, %l6 = 5c844f40, %l7 = 00005c84
	ldda	[%i6+%o4]0x89,%l6	! %l6 = 000000001b8700ff 00000000a0000000
!	Starting 10 instruction Store Burst
!	Mem[000000001008143a] = 2ce1bd8e, %l7 = 00000000a0000000
	ldstuba	[%i2+0x03a]%asi,%l7	! %l7 = 000000bd000000ff

p0_label_92:
!	%l1 = 0000000000000000, Mem[0000000030141408] = 2d0064b3
	stwa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%l2 = 3e16919f8dff72ff, Mem[0000000030001408] = 00000000
	stwa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 8dff72ff
!	%l0 = 0000000000000003, Mem[0000000030041408] = ff000000
	stba	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 03000000
!	%l1 = 0000000000000000, Mem[0000000010081410] = 05ffd53400000000
	stxa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000000
!	Mem[00000000100c143c] = 785462bf, %l2 = 8dff72ff, %l4 = 01553e00
	add	%i3,0x3c,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 00000000785462bf
!	%f14 = 00000000, Mem[0000000030001408] = 8dff72ff
	sta	%f14,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	Mem[0000000030101410] = ff000000, %l0 = 0000000000000003
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 00000000ff000000
!	%f22 = e37204ff 404f845c, Mem[0000000030181410] = ff0000ff 34d5ff05
	stda	%f22,[%i6+%o5]0x81	! Mem[0000000030181410] = e37204ff 404f845c
!	%l7 = 00000000000000bd, Mem[0000000030141410] = ff040000
	stba	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = bd040000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000009fc0ef, %f2  = ffb35501 00ffffff
	ldda	[%i4+%g0]0x80,%f2 	! %f2  = ff000000 009fc0ef

p0_label_93:
!	Mem[00000000100c1410] = 0000ff00, %l1 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 01553e00, %l0 = 00000000ff000000
	ldsba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000001
!	Mem[0000000010101400] = ff000000, %l0 = 0000000000000001
	lduba	[%i4+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = bd040000 8ffe275d, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 00000000bd040000 000000008ffe275d
!	Mem[0000000010101410] = ff000000000000ff, %f30 = 3e000000 8adb523b
	ldda	[%i4+%o5]0x80,%f30	! %f30 = ff000000 000000ff
!	Mem[0000000030081408] = ffe37d03, %l5 = 0000000000000052
	ldswa	[%i2+%o4]0x89,%l5	! %l5 = ffffffffffe37d03
!	Mem[00000000300c1400] = 000000003d7be6ff, %f10 = d08281c1 00000000
	ldda	[%i3+%g0]0x81,%f10	! %f10 = 00000000 3d7be6ff
!	Mem[0000000010001408] = 00000000 000072e3, %l2 = 8dff72ff, %l3 = 00000097
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 00000000000072e3 0000000000000000
!	Mem[0000000010001434] = d534c661, %l3 = 0000000000000000
	lduw	[%i0+0x034],%l3		! %l3 = 00000000d534c661
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000072e3, Mem[0000000030181408] = a00000001b8700ff
	stxa	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000072e3

p0_label_94:
!	%l2 = 00000000000072e3, Mem[0000000030101408] = ff72ff8d
	stba	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = e372ff8d
!	%l1 = 000000008ffe275d, Mem[0000000010081408] = cfaed64a
	stwa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 8ffe275d
!	%l2 = 00000000000072e3, Mem[0000000020800040] = e3ffe589
	sth	%l2,[%o1+0x040]		! Mem[0000000020800040] = 72e3e589
!	%f18 = ff000000 00000000, %l6 = 000000001b8700ff
!	Mem[0000000030181438] = a1c2533c3d110049
	add	%i6,0x038,%g1
	stda	%f18,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030181438] = 00000000000000ff
!	Mem[00000000201c0000] = 003bafd5, %l2 = 00000000000072e3
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000, %l3 = d534c661, Mem[0000000010001410] = 6004a8ff 1b87ffff
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 d534c661
!	Mem[00000000100c1404] = d0eab90c, %l4 = 785462bf, %l4 = 785462bf
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 00000000d0eab90c
!	%l2 = 00000000, %l3 = d534c661, Mem[0000000010181400] = 000000ff 0ae67d03
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 d534c661
!	Mem[0000000030141410] = bd040000, %l3 = 00000000d534c661
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 00000000bd040000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ed34871b, %l3 = 00000000bd040000
	lduha	[%i6+%o4]0x80,%l3	! %l3 = 000000000000ed34

p0_label_95:
!	Mem[0000000010141420] = 5252daa3, %f0  = 2c05fff6
	ld	[%i5+0x020],%f0 	! %f0 = 5252daa3
!	Mem[0000000010141400] = 00000000, %l0 = 00000000bd040000
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = 000072e3, %l1 = 000000008ffe275d
	ldsha	[%i6+%o4]0x89,%l1	! %l1 = 00000000000072e3
!	Mem[0000000030001410] = ff00000070000000, %l0 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l0	! %l0 = ff00000070000000
!	Mem[0000000030001408] = 00000000, %l1 = 00000000000072e3
	lduha	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = e372ff8d, %f6  = 00000000
	lda	[%i4+%o4]0x81,%f6 	! %f6 = e372ff8d
!	Mem[0000000030081410] = 00000000 8adb523b, %l6 = 1b8700ff, %l7 = 000000bd
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000 000000008adb523b
!	Mem[0000000010081404] = 037de60a, %l1 = 0000000000000000
	lduw	[%i2+0x004],%l1		! %l1 = 00000000037de60a
!	Mem[0000000010001410] = 00000000, %l3 = 000000000000ed34
	lduwa	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[00000000201c0000] = ff3bafd5, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000afd5

!	Check Point 19 for processor 0

	set	p0_check_pt_data_19,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ff00000070000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000037de60a
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffe37d03
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = 000000008adb523b
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 5252daa3 3eff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 009fc0ef
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = e372ff8d 00000097
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 3d7be6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = b364002d ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 19 completed


p0_label_96:
!	%l3 = 0000000000000000, Mem[0000000010001410] = 00000000
	stw	%l3,[%i0+%o5]		! Mem[0000000010001410] = 00000000
!	Mem[00000000300c1400] = 00000000, %l1 = 00000000037de60a
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%l4 = 00000000d0eab90c, Mem[0000000010181410] = 00000000
	stwa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = d0eab90c
!	Mem[0000000030101410] = 00000003, %l0 = ff00000070000000
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000003
!	%l3 = 0000000000000000, Mem[00000000300c1400] = ffe67b3d0ae67d03
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	%l0 = 00000003, %l1 = 00000000, Mem[0000000030041410] = e60a7b3d 9ca0f1d3
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000003 00000000
!	%l0 = 00000003, %l1 = 00000000, Mem[0000000030001410] = 000000ff 00000070
	stda	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000003 00000000
!	Mem[0000000010041408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = d0eab90c, %l0 = 0000000000000003
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000d0eab90c
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 64b3ff73, %f18 = ff000000
	lda	[%i6+%g0]0x81,%f18	! %f18 = 64b3ff73

p0_label_97:
!	Mem[0000000010101418] = f101c0efc96f6fe3, %l6 = 0000000000000000
	ldxa	[%i4+0x018]%asi,%l6	! %l6 = f101c0efc96f6fe3
!	Mem[0000000010041400] = 00000000, %l7 = 000000008adb523b
	ldswa	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = ff00871b000000ff, %l0 = 00000000d0eab90c
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = ff00871b000000ff
!	Mem[0000000010101408] = ed3487ff000000ff, %l5 = ffffffffffe37d03
	ldxa	[%i4+%o4]0x88,%l5	! %l5 = ed3487ff000000ff
!	Mem[0000000010041410] = 34e67b3d, %f20 = 00000000
	ld	[%i1+%o5],%f20	! %f20 = 34e67b3d
!	Mem[0000000010101400] = efc09f00000000ff, %f8  = ed3487ff ed34871b
	ldda	[%i4+%g0]0x88,%f8 	! %f8  = efc09f00 000000ff
!	Mem[00000000100c1408] = 00000097, %l2 = 0000000000000000
	lduba	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000097
!	Mem[0000000010101414] = 000000ff, %l5 = ed3487ff000000ff
	lduha	[%i4+0x016]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101410] = ff000000000000ff, %f0  = 5252daa3 3eff0000
	ldda	[%i4+%o5]0x80,%f0 	! %f0  = ff000000 000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010001408] = e3720000
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = ff720000

p0_label_98:
!	Mem[0000000030001408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l6 = f101c0efc96f6fe3, Mem[0000000010041408] = ff000000
	stba	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = e3000000
!	%f14 = 00000000, Mem[0000000030041400] = ed34871b
	sta	%f14,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%f20 = 34e67b3d, Mem[0000000030041400] = 00000000
	sta	%f20,[%i1+%g0]0x89	! Mem[0000000030041400] = 34e67b3d
!	%l2 = 0000000000000097, Mem[0000000010101428] = 387becacebf63d12
	stx	%l2,[%i4+0x028]		! Mem[0000000010101428] = 0000000000000097
!	%f26 = c40ffeae ff000000, %l7 = 0000000000000000
!	Mem[0000000030081430] = 13a3f004aefe0fc4
	add	%i2,0x030,%g1
	stda	%f26,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030081430] = 13a3f004aefe0fc4
!	Mem[0000000030001408] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%f6  = e372ff8d 00000097, Mem[0000000010141408] = 1b8700ff ff000000
	stda	%f6 ,[%i5+%o4]0x88	! Mem[0000000010141408] = e372ff8d 00000097
!	Mem[0000000030001410] = 03000000, %l2 = 0000000000000097
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 00000003000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000, %l0 = ff00871b000000ff
	ldsha	[%i4+%g0]0x80,%l0	! %l0 = ffffffffffffff00

p0_label_99:
!	Mem[00000000300c1408] = 01553e00, %l3 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 0000000001553e00
!	Mem[0000000030041408] = f86ccfd5 00000003, %l0 = ffffff00, %l1 = 00000000
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000003 00000000f86ccfd5
!	Mem[0000000010141410] = 3d7be634, %l7 = 00000000000000ff
	lduwa	[%i5+%o5]0x88,%l7	! %l7 = 000000003d7be634
!	Mem[0000000010001400] = 2d000000, %l1 = 00000000f86ccfd5
	lduwa	[%i0+%g0]0x88,%l1	! %l1 = 000000002d000000
!	Mem[0000000010141410] = 3d7be634, %l4 = 00000000d0eab90c
	lduba	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000034
!	Mem[0000000020800040] = 72e3e589, %l2 = 0000000000000003
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = 00000000000072e3
!	Mem[0000000010081400] = 0000002d, %l0 = 0000000000000003
	lduba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = d53400001b8734ed, %l7 = 000000003d7be634
	ldxa	[%i6+%o4]0x88,%l7	! %l7 = d53400001b8734ed
!	Mem[00000000100c1400] = ff52daa3 d0eab90c, %l0 = 00000000, %l1 = 2d000000
	ldda	[%i3+0x000]%asi,%l0	! %l0 = 00000000ff52daa3 00000000d0eab90c
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff000000, %l1 = d0eab90c, %l4 = 00000034
	add	%i4,0x08,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000ff000000

p0_label_100:
!	%l6 = f101c0efc96f6fe3, Mem[0000000030001410] = ff00000000000000
	stxa	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = f101c0efc96f6fe3
!	%f5  = 0000b805, Mem[0000000010101408] = 000000ff
	sta	%f5 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000b805
!	%l6 = f101c0efc96f6fe3, Mem[0000000030041400] = 34e67b3d
	stba	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 34e67be3
!	%f26 = c40ffeae ff000000, Mem[0000000030181410] = e37204ff 404f845c
	stda	%f26,[%i6+%o5]0x81	! Mem[0000000030181410] = c40ffeae ff000000
!	%f14 = 00000000, Mem[0000000010181414] = 00000097
	sta	%f14,[%i6+0x014]%asi	! Mem[0000000010181414] = 00000000
!	Mem[00000000100c1408] = 97000000 00000000, %l2 = 000072e3, %l3 = 01553e00
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 0000000097000000 0000000000000000
!	%l7 = d53400001b8734ed, Mem[00000000211c0000] = 0000e4d2, %asi = 80
	stba	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = ed00e4d2
!	Mem[0000000030041410] = 03000000, %l2 = 0000000097000000
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 0000000003000000
!	%f12 = b364002d ff0000ff, %l7 = d53400001b8734ed
!	Mem[0000000010001430] = a0ff213dd534c661
	add	%i0,0x030,%g1
	stda	%f12,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010001430] = ff00213d2d0064b3
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l0 = 00000000ff52daa3
	ldswa	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000

!	Check Point 20 for processor 0

	set	p0_check_pt_data_20,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000d0eab90c
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000003000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = f101c0efc96f6fe3
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = d53400001b8734ed
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 009fc0ef
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = efc09f00 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 64b3ff73 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 34e67b3d 3d7be634
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 20 completed


p0_label_101:
!	Mem[00000000100c1428] = 44a4c480 b75cd9da, %l4 = ff000000, %l5 = 000000ff
	ldda	[%i3+0x028]%asi,%l4	! %l4 = 0000000044a4c480 00000000b75cd9da
!	Mem[0000000010041410] = 3d7be634, %l1 = 00000000d0eab90c
	ldswa	[%i1+%o5]0x88,%l1	! %l1 = 000000003d7be634
!	Mem[0000000030181408] = 000072e3, %f19 = 00000000
	lda	[%i6+%o4]0x89,%f19	! %f19 = 000072e3
!	Mem[00000000100c1408] = 97000000, %l5 = 00000000b75cd9da
	lduba	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000097
!	Mem[0000000010041400] = 00000000, %l4 = 0000000044a4c480
	ldsba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = ff52db8a, %l6 = f101c0efc96f6fe3
	ldsha	[%i3+%o5]0x81,%l6	! %l6 = ffffffffffffff52
!	Mem[00000000300c1410] = 8adb52ff, %f8  = efc09f00
	lda	[%i3+%o5]0x89,%f8 	! %f8 = 8adb52ff
!	Mem[0000000010081420] = 0000c661d5cf6cf8, %f20 = 34e67b3d 3d7be634
	ldd	[%i2+0x020],%f20	! %f20 = 0000c661 d5cf6cf8
!	Mem[0000000030101410] = 0000007052529726, %f22 = e37204ff 404f845c
	ldda	[%i4+%o5]0x81,%f22	! %f22 = 00000070 52529726
!	Starting 10 instruction Store Burst
!	%l2 = 03000000, %l3 = 00000000, Mem[0000000010041400] = 00000000 00000000
	std	%l2,[%i1+%g0]		! Mem[0000000010041400] = 03000000 00000000

p0_label_102:
!	%l0 = 00000000, %l1 = 3d7be634, Mem[00000000100c1400] = ff52daa3 d0eab90c
	stda	%l0,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000 3d7be634
!	%l7 = d53400001b8734ed, Mem[0000000030041410] = 97000000
	stwa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 1b8734ed
!	%l0 = 00000000, %l1 = 3d7be634, Mem[00000000100c1408] = 00000097 00000000
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 3d7be634
!	Mem[0000000030001400] = 00000005, %l5 = 0000000000000097
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000005
!	%l4 = 0000000000000000, Mem[0000000010001400] = e37200ff2d000000
	stxa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	%f28 = 13a3f004, Mem[0000000030081408] = 037de3ff
	sta	%f28,[%i2+%o4]0x81	! Mem[0000000030081408] = 13a3f004
!	%l6 = ffffffffffffff52, Mem[0000000030081400] = 00000000
	stha	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000ff52
!	%f0  = ff000000 000000ff, Mem[0000000010001418] = 16ff85da 4058ff47
	std	%f0 ,[%i0+0x018]	! Mem[0000000010001418] = ff000000 000000ff
!	Mem[0000000030141410] = 61c634d5, %l2 = 0000000003000000
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 0000000061c634d5
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 000000e3, %l6 = ffffffffffffff52
	lduba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000e3

p0_label_103:
!	Mem[00000000201c0000] = 0000afd5, %l5 = 0000000000000005
	ldub	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[00000000211c0000] = ed00e4d2, %l0 = 0000000000000000
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ed00
!	Mem[0000000010141414] = 0000ff00, %l4 = 0000000000000000
	lduw	[%i5+0x014],%l4		! %l4 = 000000000000ff00
!	Mem[0000000010001408] = 00000000000072ff, %f2  = ff000000 009fc0ef
	ldda	[%i0+%o4]0x88,%f2 	! %f2  = 00000000 000072ff
!	Mem[0000000030101408] = 3e16919f8dff72e3, %l4 = 000000000000ff00
	ldxa	[%i4+%o4]0x89,%l4	! %l4 = 3e16919f8dff72e3
!	Mem[000000001004140c] = 000000ff, %f18 = 64b3ff73
	ld	[%i1+0x00c],%f18	! %f18 = 000000ff
!	Mem[0000000010141408] = 970000008dff72e3, %f30 = ff000000 000000ff
	ldd	[%i5+%o4],%f30		! %f30 = 97000000 8dff72e3
!	Mem[0000000030001408] = ff00000000000300, %l3 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l3	! %l3 = ff00000000000300
!	Mem[0000000030181400] = 73ffb364, %l4 = 3e16919f8dff72e3
	ldswa	[%i6+%g0]0x89,%l4	! %l4 = 0000000073ffb364
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 0000ff52, %l6 = 00000000000000e3
	ldstuba	[%i2+%g0]0x89,%l6	! %l6 = 00000052000000ff

p0_label_104:
!	Mem[00000000211c0000] = ed00e4d2, %l7 = d53400001b8734ed
	ldstub	[%o2+%g0],%l7		! %l7 = 000000ed000000ff
!	Mem[0000000010141428] = 000000ffaefe0fc4, %l2 = 0000000061c634d5, %l7 = 00000000000000ed
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = 000000ffaefe0fc4
!	Mem[0000000010081408] = 5d27fe8f, %l2 = 0000000061c634d5
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 0000005d000000ff
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000073ffb364
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%f30 = 97000000 8dff72e3, Mem[00000000100c1420] = 9b3ca75d d08281c1
	std	%f30,[%i3+0x020]	! Mem[00000000100c1420] = 97000000 8dff72e3
!	Mem[0000000021800040] = 862b9b4e, %l1 = 000000003d7be634
	ldstuba	[%o3+0x040]%asi,%l1	! %l1 = 00000086000000ff
!	%l2 = 000000000000005d, Mem[0000000030101400] = 404f845c
	stwa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000005d
!	Mem[0000000010141400] = 00000000, %l6 = 0000000000000052
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%f24 = 00000000, Mem[00000000100c1400] = 00000000
	sta	%f24,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = 00000000, %l4 = 0000000000000000
	ldsh	[%i5+0x038],%l4		! %l4 = 0000000000000000

p0_label_105:
!	Mem[0000000020800040] = 72e3e589, %l2 = 000000000000005d
	ldsh	[%o1+0x040],%l2		! %l2 = 00000000000072e3
!	Mem[0000000010001400] = 00000000, %l2 = 00000000000072e3
	lduw	[%i0+%g0],%l2		! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = ff000000000000ff, %f30 = 97000000 8dff72e3
	ldda	[%i4+%o5]0x80,%f30	! %f30 = ff000000 000000ff
!	Mem[0000000030141400] = ffffffff, %l4 = 0000000000000000
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101410] = ff000000000000ff, %l6 = 0000000000000000
	ldxa	[%i4+%o5]0x88,%l6	! %l6 = ff000000000000ff
!	Mem[0000000010181400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141428] = 000000ff, %l7 = 000000ffaefe0fc4
	lduh	[%i5+0x02a],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010041410] = 34e67b3d00000000, %l0 = 000000000000ed00
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = 34e67b3d00000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030081408] = 04f0a313
	stha	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 04f00000

!	Check Point 21 for processor 0

	set	p0_check_pt_data_21,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 34e67b3d00000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000086
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ff00000000000300
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ff000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 000072ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 705a5f2c 0000b805
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 8adb52ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 000000ff 000072e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 0000c661 d5cf6cf8
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000070 52529726
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x78],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 21 completed


p0_label_106:
!	Mem[0000000030081400] = ffff0000, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l2	! %l2 = 00000000ffff0000
!	Mem[0000000030181410] = c40ffeae, %l6 = ff000000000000ff
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 000000c4000000ff
!	%l3 = ff00000000000300, Mem[0000000010041410] = 34e67b3d
	stha	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 03007b3d
!	Mem[0000000030001408] = ff000000, %l6 = 00000000000000c4
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000030041410] = ed34871b
	stba	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 0034871b
!	%f14 = 00000000 daa49daa, Mem[0000000010001408] = ff720000 00000000
	std	%f14,[%i0+%o4]	! Mem[0000000010001408] = 00000000 daa49daa
!	%l6 = 00000000000000ff, Mem[000000001014140c] = 8dff72e3
	sth	%l6,[%i5+0x00c]		! Mem[000000001014140c] = 00ff72e3
!	Mem[00000000100c1410] = 0000ff00, %l3 = ff00000000000300
	ldstuba	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000ffff0000, Mem[0000000030081410] = 3b52db8a00000000
	stxa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = efc001f1, %l7 = 00000000000000ff
	ldswa	[%i0+%o5]0x89,%l7	! %l7 = ffffffffefc001f1

p0_label_107:
!	Mem[0000000020800000] = ffffbb34, %l6 = 00000000000000ff
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[00000000100c1430] = 000000000000002d, %f24 = 00000000 a3da5252
	ldda	[%i3+0x030]%asi,%f24	! %f24 = 00000000 0000002d
!	Mem[0000000030041400] = 34e67be3, %l1 = 0000000000000086
	lduha	[%i1+%g0]0x89,%l1	! %l1 = 0000000000007be3
!	Mem[0000000030181408] = e3720000, %l5 = 0000000000000000
	lduwa	[%i6+%o4]0x81,%l5	! %l5 = 00000000e3720000
!	Mem[0000000030041408] = 03000000, %f30 = ff000000
	lda	[%i1+%o4]0x81,%f30	! %f30 = 03000000
!	Mem[0000000020800000] = ffffbb34, %l3 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[00000000100c1438] = 8dff72e3785462bf, %l2 = 00000000ffff0000
	ldx	[%i3+0x038],%l2		! %l2 = 8dff72e3785462bf
!	Mem[0000000010181400] = 00000000, %l6 = 000000000000ffff
	ldsh	[%i6+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181410] = 00000000 00000003, %l4 = 000000ff, %l5 = e3720000
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000003 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000003, %l5 = 00000000, Mem[0000000010101410] = ff000000 000000ff
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000003 00000000

p0_label_108:
!	%l0 = 34e67b3d00000000, Mem[0000000030101400] = 5d000000
	stha	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Mem[00000000300c1400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141430] = c40ffeae, %l3 = 000000000000ffff
	swap	[%i5+0x030],%l3		! %l3 = 00000000c40ffeae
!	%l0 = 34e67b3d00000000, Mem[00000000100c1408] = 000000ff
	stba	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010141400] = 52000000, %l4 = 00000003, %l2 = 785462bf
	casa	[%i5]0x80,%l4,%l2	! %l2 = 0000000052000000
!	%l1 = 0000000000007be3, Mem[0000000030181400] = 000000ff73ffb364
	stxa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000007be3
!	%f4  = 705a5f2c 0000b805, Mem[0000000010081418] = 000072e3 ff740bff
	std	%f4 ,[%i2+0x018]	! Mem[0000000010081418] = 705a5f2c 0000b805
!	%l1 = 0000000000007be3, Mem[0000000010001408] = 00000000
	stha	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 7be30000
!	%l7 = ffffffffefc001f1, Mem[0000000030181400] = 00007be3
	stba	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 00007bf1
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000003
	ldsha	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_109:
!	Mem[0000000010041420] = 5252daa33f403703, %f12 = b364002d ff0000ff
	ldd	[%i1+0x020],%f12	! %f12 = 5252daa3 3f403703
!	Mem[00000000100c1410] = 0000ffff, %f20 = 0000c661
	lda	[%i3+%o5]0x88,%f20	! %f20 = 0000ffff
!	Mem[0000000030081408] = 04f00000, %l2 = 0000000052000000
	lduha	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800180] = 52f9ae0c, %l4 = 0000000000000000
	ldsb	[%o3+0x181],%l4		! %l4 = fffffffffffffff9
!	Mem[0000000010001410] = 00000000, %f16 = 00000000
	lda	[%i0+%o5]0x88,%f16	! %f16 = 00000000
!	Mem[0000000030181410] = 000000ffaefe0fff, %f0  = ff000000 000000ff
	ldda	[%i6+%o5]0x89,%f0 	! %f0  = 000000ff aefe0fff
!	Mem[0000000030101410] = 2697525270000000, %f6  = e372ff8d 00000097
	ldda	[%i4+%o5]0x89,%f6 	! %f6  = 26975252 70000000
!	Mem[0000000030181410] = aefe0fff, %l1 = 0000000000007be3
	ldswa	[%i6+%o5]0x89,%l1	! %l1 = ffffffffaefe0fff
!	Mem[00000000100c1410] = 0000ffff, %l5 = 0000000000000000
	ldswa	[%i3+%o5]0x88,%l5	! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 0300000000000000, %l3 = 00000000c40ffeae, %l2 = 0000000000000000
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = 0300000000000000

p0_label_110:
!	Mem[0000000010001408] = 0000e37b, %l4 = fffffffffffffff9
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 0000007b000000ff
!	%l5 = 000000000000ffff, Mem[0000000010081408] = ff27fe8f
	stwa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000ffff
!	Mem[0000000030081410] = 0000ffff, %l1 = ffffffffaefe0fff
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 000000000000ffff
!	%l3 = 00000000c40ffeae, Mem[0000000010181408] = 1b8734ed
	stba	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 1b8734ae
!	Mem[0000000010041400] = 03000000, %l1 = 000000000000ffff
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 0000000003000000
!	%l2 = 0300000000000000, Mem[0000000030141400] = ffffffff
	stwa	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Mem[0000000010101400] = 000000ff, %l7 = ffffffffefc001f1
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l1 = 0000000003000000
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%l2 = 0300000000000000, Mem[00000000300c1410] = ff52db8a00000000
	stxa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0300000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l3 = 00000000c40ffeae
	ldsha	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000

!	Check Point 22 for processor 0

	set	p0_check_pt_data_22,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 0300000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 000000000000007b
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff aefe0fff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 705a5f2c 0000b805
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 26975252 70000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 5252daa3 3f403703
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 0000ffff d5cf6cf8
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 0000002d
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x78],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 03000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 22 completed


p0_label_111:
!	Mem[0000000010001434] = 2d0064b3, %f11 = 3d7be6ff
	ld	[%i0+0x034],%f11	! %f11 = 2d0064b3
!	Mem[0000000021800100] = 97530ae8, %l3 = 0000000000000000
	lduha	[%o3+0x100]%asi,%l3	! %l3 = 0000000000009753
!	Mem[0000000030081410] = aefe0fff, %l2 = 0300000000000000
	ldswa	[%i2+%o5]0x81,%l2	! %l2 = ffffffffaefe0fff
!	Mem[00000000201c0000] = 0000afd5, %l3 = 0000000000009753
	lduba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l7 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = ff000000, %l7 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[00000000100c1408] = 00000000, %l7 = ffffffffffffff00
	ldsba	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (21)
!	Mem[00000000300c1400] = ff000000 00000000 01553e00 0000003b
!	Mem[00000000300c1410] = 03000000 00000000 00000000 00000097
!	Mem[00000000300c1420] = ed34871b 037de60a e3720000 40625eff
!	Mem[00000000300c1430] = 8fbbc3a2 ff72c64a d0eab90c daa49daa
	ldda	[%i3]ASI_BLK_AIUS,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010041408] = e3000000 000000ff, %l4 = 0000007b, %l5 = 0000ffff
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 00000000e3000000 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = aefe0fff, %l3 = 00000000, Mem[0000000010181400] = 00000000 d534c661
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = aefe0fff 00000000

p0_label_112:
!	Mem[0000000030101410] = 00000070, %l2 = ffffffffaefe0fff
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000020800001] = ffffbb34, %l4 = 00000000e3000000
	ldstuba	[%o1+0x001]%asi,%l4	! %l4 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (22)
!	%l2 = 00000000, %l3 = 00000000, Mem[00000000300c1408] = 003e5501 3b000000
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 00000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141408] = 97000000 00ff72e3
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 00000000
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000000000, %asi = 80
	swapa	[%i3+0x008]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = ff0ffeae, %l0 = 34e67b3d00000000
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	%f4  = 705a5f2c 0000b805, Mem[0000000030081400] = 00000000 0000ff00
	stda	%f4 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 705a5f2c 0000b805
!	%l6 = 0000000000000000, Mem[0000000030081410] = ff0ffeae
	stba	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = ff0ffe00
!	%l5 = 00000000000000ff, Mem[00000000100c1408] = 00000000
	stwa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l4 = 00000000000000ff
	lduha	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000

p0_label_113:
!	Mem[00000000201c0000] = 0000afd5, %l2 = 0000000000000000
	ldsb	[%o0+0x001],%l2		! %l2 = 0000000000000000
!	Mem[0000000021800180] = 52f9ae0c, %l7 = 0000000000000000
	ldsb	[%o3+0x180],%l7		! %l7 = 0000000000000052
!	Mem[0000000010181408] = 1b8734ae, %l5 = 00000000000000ff
	ldswa	[%i6+%o4]0x88,%l5	! %l5 = 000000001b8734ae
!	Mem[0000000010101400] = efc001f1, %l1 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l1	! %l1 = ffffffffefc001f1
!	Mem[0000000021800100] = 97530ae8, %l6 = 0000000000000000
	ldsba	[%o3+0x100]%asi,%l6	! %l6 = ffffffffffffff97
!	Mem[0000000010041400] = ffff0000, %l4 = 0000000000000000
	ldsba	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001430] = ff00213d2d0064b3, %l4 = 0000000000000000
	ldxa	[%i0+0x030]%asi,%l4	! %l4 = ff00213d2d0064b3
!	Mem[0000000010001408] = 0000e3ff, %l5 = 000000001b8734ae
	lduha	[%i0+%o4]0x88,%l5	! %l5 = 000000000000e3ff
!	Mem[00000000300c1410] = 0300000000000000, %f20 = 03000000 00000000
	ldda	[%i3+%o5]0x81,%f20	! %f20 = 03000000 00000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010001400] = 0000000000000000
	stxa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000

p0_label_114:
!	%l6 = ffffffffffffff97, Mem[0000000010081400] = 0000002d037de60a
	stxa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffffffffff97
!	%l0 = 00000000000000ff, Mem[0000000030101400] = 00000000
	stha	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00ff0000
!	%l0 = 000000ff, %l1 = efc001f1, Mem[0000000010041400] = 0000ffff 00000000
	std	%l0,[%i1+%g0]		! Mem[0000000010041400] = 000000ff efc001f1
!	%l5 = 000000000000e3ff, Mem[0000000020800001] = ffffbb34
	stb	%l5,[%o1+0x001]		! Mem[0000000020800000] = ffffbb34
!	%l0 = 00000000000000ff, Mem[00000000201c0000] = 0000afd5
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = ff00afd5
!	%f14 = 00000000 daa49daa, %l6 = ffffffffffffff97
!	Mem[0000000030081410] = 00fe0fff00000000
	add	%i2,0x010,%g1
	stda	%f14,[%g1+%l6]ASI_PST16_S ! Mem[0000000030081410] = 00fe0000daa49daa
!	%f28 = 8fbbc3a2 ff72c64a, %l1 = ffffffffefc001f1
!	Mem[0000000010001400] = 0000000000000000
	stda	%f28,[%i0+%l1]ASI_PST32_PL ! Mem[0000000010001400] = 4ac672ff00000000
!	%f2  = 00000000 000072ff, %l1 = ffffffffefc001f1
!	Mem[0000000030081430] = 13a3f004aefe0fc4
	add	%i2,0x030,%g1
	stda	%f2,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030081430] = ffa3f00400000000
!	%f26 = e3720000 40625eff, %l7 = 0000000000000052
!	Mem[0000000010101438] = 94305e9f8c4ee51a
	add	%i4,0x038,%g1
	stda	%f26,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010101438] = 94305e9f000072e3
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ffff0000, %l7 = 0000000000000052
	ldswa	[%i3+%o5]0x80,%l7	! %l7 = ffffffffffff0000

p0_label_115:
!	Mem[0000000030181400] = f17b0000, %l1 = ffffffffefc001f1
	ldswa	[%i6+%g0]0x81,%l1	! %l1 = fffffffff17b0000
!	Mem[00000000100c1408] = 000000ff, %l6 = ffffffffffffff97
	ldswa	[%i3+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181400] = 00007bf1, %f15 = daa49daa
	lda	[%i6+%g0]0x89,%f15	! %f15 = 00007bf1
!	Mem[0000000010101410] = 00000003 00000000, %l6 = 000000ff, %l7 = ffff0000
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000003 0000000000000000
!	Mem[0000000010081408] = 00000000ffff0000, %f22 = 00000000 00000097
	ldda	[%i2+%o4]0x88,%f22	! %f22 = 00000000 ffff0000
!	Mem[0000000010181408] = ae34871b, %l4 = ff00213d2d0064b3
	lduwa	[%i6+%o4]0x80,%l4	! %l4 = 00000000ae34871b
!	Mem[0000000030081410] = 00fe0000, %l1 = fffffffff17b0000
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 00000000000000fe
!	Mem[0000000010181400] = ff0ffeae00000000, %f26 = e3720000 40625eff
	ldda	[%i6+%g0]0x80,%f26	! %f26 = ff0ffeae 00000000
!	Mem[0000000030181400] = f17b0000, %l7 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l7	! %l7 = fffffffffffff17b
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000e3ff, Mem[0000000030081410] = aa9da4da0000fe00
	stxa	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000000000e3ff

!	Check Point 23 for processor 0

	set	p0_check_pt_data_23,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000fe
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ae34871b
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000e3ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000003
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = fffffffffffff17b
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 705a5f2c 0000b805
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 26975252 70000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 2d0064b3
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 00000000 00007bf1
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 01553e00 0000003b
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 03000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 ffff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ed34871b 037de60a
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff0ffeae 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 8fbbc3a2 ff72c64a
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = d0eab90c daa49daa
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 23 completed


p0_label_116:
!	%l5 = 000000000000e3ff, Mem[00000000100c1408] = 000000ff
	stba	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff0000ff
!	Mem[0000000030001408] = 000000ff, %l2 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[000000001010141c] = c96f6fe3, %l2 = 00000000000000ff
	swap	[%i4+0x01c],%l2		! %l2 = 00000000c96f6fe3
!	Mem[0000000030001408] = 00000000, %l1 = 00000000000000fe
	swapa	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%l6 = 00000003, %l7 = fffff17b, Mem[0000000010101428] = 00000000 00000097
	std	%l6,[%i4+0x028]		! Mem[0000000010101428] = 00000003 fffff17b
!	%l2 = c96f6fe3, %l3 = 00000000, Mem[0000000010101410] = 03000000 00000000
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = c96f6fe3 00000000
!	%l3 = 0000000000000000, Mem[0000000010001410] = 000000ff
	stha	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	%l6 = 0000000000000003, Mem[0000000010101416] = 00000000, %asi = 80
	stha	%l6,[%i4+0x016]%asi	! Mem[0000000010101414] = 00000003
!	Mem[0000000010181400] = ff0ffeae, %l5 = 000000000000e3ff
	swap	[%i6+%g0],%l5		! %l5 = 00000000ff0ffeae
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0000f004, %l6 = 0000000000000003
	ldswa	[%i2+%o4]0x81,%l6	! %l6 = 000000000000f004

p0_label_117:
!	Mem[0000000010001408] = 0000e3ff, %f24 = ed34871b
	lda	[%i0+%o4]0x88,%f24	! %f24 = 0000e3ff
!	Mem[0000000010101438] = 94305e9f, %f22 = 00000000
	lda	[%i4+0x038]%asi,%f22	! %f22 = 94305e9f
!	Mem[0000000010141408] = 00000000, %l2 = 00000000c96f6fe3
	lduba	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = 3d7b0003, %f9  = 000000ff
	lda	[%i1+%o5]0x88,%f9 	! %f9 = 3d7b0003
!	Mem[000000001018143c] = daa49daa, %l3 = 0000000000000000
	ldswa	[%i6+0x03c]%asi,%l3	! %l3 = ffffffffdaa49daa
!	Mem[0000000030101410] = ff000070, %l2 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1410] = 00000003, %l6 = 000000000000f004
	ldsha	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000003
!	Mem[0000000020800040] = 72e3e589, %l2 = 00000000000000ff
	ldsb	[%o1+0x041],%l2		! %l2 = ffffffffffffffe3
!	Mem[0000000030001408] = 000000fe, %l5 = 00000000ff0ffeae
	lduha	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000fe
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ae34871b, Mem[0000000010181400] = ffe30000
	stha	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ffe3871b

p0_label_118:
!	%l2 = ffffffffffffffe3, Mem[00000000300c1410] = 03000000
	stwa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffe3
!	%f28 = 8fbbc3a2, Mem[0000000010081410] = 00000000
	sta	%f28,[%i2+%o5]0x80	! Mem[0000000010081410] = 8fbbc3a2
!	%f0  = 000000ff, Mem[0000000030181400] = 00007bf1
	sta	%f0 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	%l6 = 0000000000000003, Mem[0000000010081408] = 0000ffff00000000
	stxa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000003
!	%f26 = ff0ffeae 00000000, Mem[0000000030101410] = 700000ff 26975252
	stda	%f26,[%i4+%o5]0x89	! Mem[0000000030101410] = ff0ffeae 00000000
!	%l3 = ffffffffdaa49daa, Mem[00000000211c0001] = ff00e4d2, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffaae4d2
!	Mem[0000000010001400] = ff72c64a, %l7 = fffffffffffff17b
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 00000000ff72c64a
!	Mem[0000000030141400] = 00000000, %l3 = ffffffffdaa49daa
	ldstuba	[%i5+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%f8  = 8adb52ff 3d7b0003, Mem[0000000010101400] = f101c0ef 009fc0ef
	stda	%f8 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 8adb52ff 3d7b0003
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000000000000000, %l6 = 0000000000000003
	ldxa	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_119:
!	Mem[0000000010081410] = a2c3bb8f, %l3 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = ffffffffffffff8f
!	Mem[00000000211c0000] = ffaae4d2, %l4 = 00000000ae34871b
	ldub	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010141428] = 000000ff aefe0fc4, %l2 = ffffffe3, %l3 = ffffff8f
	ldda	[%i5+0x028]%asi,%l2	! %l2 = 00000000000000ff 00000000aefe0fc4
!	Mem[0000000020800000] = ffffbb34, %l0 = 00000000000000ff
	ldub	[%o1+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010001400] = 7bf1ffff, %l0 = 00000000000000ff
	ldsba	[%i0+0x003]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001408] = ffe30000, %f24 = 0000e3ff
	lda	[%i0+%o4]0x80,%f24	! %f24 = ffe30000
!	Mem[00000000100c143c] = 785462bf, %l4 = 00000000000000ff
	lduwa	[%i3+0x03c]%asi,%l4	! %l4 = 00000000785462bf
!	Mem[0000000030041400] = e37be634 037de60a 03000000 d5cf6cf8
!	Mem[0000000030041410] = 0034871b 00000000 16a66f51 a7740b98
!	Mem[0000000030041420] = ffe67b3d f778f552 80a2ecaa 77a322cb
!	Mem[0000000030041430] = 35d3531a 3d7be6ff 74bd5edc 52d51ebb
	ldda	[%i1]ASI_BLK_S,%f0	! Block Load from 0000000030041400
!	Mem[00000000100c1400] = 00000000, %l4 = 00000000785462bf
	lduh	[%i3+%g0],%l4		! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000003, %l7 = 00000000ff72c64a
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 00000003000000ff

p0_label_120:
!	Mem[0000000010001408] = 0000e3ff, %l0 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000201c0000] = ff00afd5, %l6 = 0000000000000000
	ldstub	[%o0+%g0],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000010001410] = 00000000, %l1 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%f20 = 03000000 00000000, Mem[0000000010001410] = 00000000 61c634d5
	stda	%f20,[%i0+%o5]0x80	! Mem[0000000010001410] = 03000000 00000000
!	%l3 = 00000000aefe0fc4, Mem[0000000030141408] = 000000005c844f40
	stxa	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000aefe0fc4
!	%l6 = 00000000000000ff, Mem[00000000100c1425] = 8dff72e3
	stb	%l6,[%i3+0x025]		! Mem[00000000100c1424] = 8dff72e3
!	Mem[0000000030101410] = 00000000, %l5 = 00000000000000fe
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%f23 = ffff0000, Mem[0000000030101400] = 00ff0000
	sta	%f23,[%i4+%g0]0x81	! Mem[0000000030101400] = ffff0000
!	%f0  = e37be634 037de60a 03000000 d5cf6cf8
!	%f4  = 0034871b 00000000 16a66f51 a7740b98
!	%f8  = ffe67b3d f778f552 80a2ecaa 77a322cb
!	%f12 = 35d3531a 3d7be6ff 74bd5edc 52d51ebb
	stda	%f0,[%i2]ASI_BLK_AIUPL	! Block Store to 0000000010081400
!	Starting 10 instruction Load Burst
!	Mem[00000000100c140c] = 34e67b3d, %l5 = 0000000000000000
	ldswa	[%i3+0x00c]%asi,%l5	! %l5 = 0000000034e67b3d

!	Check Point 24 for processor 0

	set	p0_check_pt_data_24,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 00000000aefe0fc4
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000034e67b3d
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000003
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = e37be634 037de60a
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 03000000 d5cf6cf8
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 0034871b 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 16a66f51 a7740b98
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ffe67b3d f778f552
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 80a2ecaa 77a322cb
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 35d3531a 3d7be6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 74bd5edc 52d51ebb
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 94305e9f ffff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ffe30000 037de60a
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 24 completed


p0_label_121:
!	Mem[00000000100c1418] = 3317a600, %l3 = 00000000aefe0fc4
	lduba	[%i3+0x019]%asi,%l3	! %l3 = 0000000000000017
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010081410] = 0034871b00000000, %f14 = 74bd5edc 52d51ebb
	ldda	[%i2+%o5]0x88,%f14	! %f14 = 0034871b 00000000
!	Mem[0000000030101410] = fe000000, %l6 = 00000000000000ff
	lduba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = ffe30000, %l5 = 0000000034e67b3d
	ldsha	[%i0+%o4]0x80,%l5	! %l5 = ffffffffffffffe3
!	Mem[00000000100c1408] = ff0000ff, %l5 = ffffffffffffffe3
	ldswa	[%i3+%o4]0x80,%l5	! %l5 = ffffffffff0000ff
!	Mem[0000000010081408] = f86ccfd5, %l2 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l2	! %l2 = fffffffffffffff8
!	Mem[0000000030101400] = e37204ff0000ffff, %f20 = 03000000 00000000
	ldda	[%i4+%g0]0x89,%f20	! %f20 = e37204ff 0000ffff
!	Mem[00000000100c1410] = ffff0000f101c0ef, %f30 = d0eab90c daa49daa
	ldda	[%i3+0x010]%asi,%f30	! %f30 = ffff0000 f101c0ef
!	Mem[0000000010101410] = 03000000c96f6fe3, %f18 = 01553e00 0000003b
	ldda	[%i4+%o5]0x88,%f18	! %f18 = 03000000 c96f6fe3
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00000003, Mem[0000000010181400] = ffe3871b 00000000
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 00000003

p0_label_122:
!	Mem[0000000010001438] = 62ef3c78bb5ee3d7, %l0 = 00000000000000ff, %l6 = 0000000000000000
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = 62ef3c78bb5ee3d7
!	%l3 = 0000000000000017, Mem[0000000010001400] = 7bf1ffff, %asi = 80
	stwa	%l3,[%i0+0x000]%asi	! Mem[0000000010001400] = 00000017
!	%l5 = ffffffffff0000ff, Mem[0000000010101408] = 0000b805
	stha	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	Mem[0000000030141410] = 03000000, %l7 = 0000000000000003
	ldstuba	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041408] = 00000003, %l7 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l7	! %l7 = 00000003000000ff
!	%l6 = 62ef3c78bb5ee3d7, Mem[00000000201c0001] = ff00afd5, %asi = 80
	stba	%l6,[%o0+0x001]%asi	! Mem[00000000201c0000] = ffd7afd5
!	Mem[0000000010141400] = 00000052, %l4 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000052
!	%l3 = 0000000000000017, Mem[0000000030181408] = e372000000000000
	stxa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000000017
!	%f30 = ffff0000 f101c0ef, Mem[0000000010141408] = 00000000 00000000
	stda	%f30,[%i5+%o4]0x88	! Mem[0000000010141408] = ffff0000 f101c0ef
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000003 8ffe275d, %l4 = 00000052, %l5 = ff0000ff
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 00000000ff000003 000000008ffe275d

p0_label_123:
!	Mem[0000000030041400] = e37be634, %l7 = 0000000000000003
	lduha	[%i1+%g0]0x81,%l7	! %l7 = 000000000000e37b
!	Mem[0000000010081410] = 00000000, %f15 = 00000000
	lda	[%i2+%o5]0x88,%f15	! %f15 = 00000000
!	Mem[0000000010081400] = 037de60a, %l5 = 000000008ffe275d
	ldsba	[%i2+%g0]0x88,%l5	! %l5 = 000000000000000a
!	Mem[0000000030181400] = ff000000, %l0 = 00000000000000ff
	lduba	[%i6+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[000000001014143c] = 0000003e, %l4 = 00000000ff000003
	lduba	[%i5+0x03d]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 0000e3ff, %l0 = 00000000000000ff
	lduha	[%i2+%o5]0x89,%l0	! %l0 = 000000000000e3ff
!	Mem[000000001014141c] = ff0472e3, %l6 = 62ef3c78bb5ee3d7
	lduwa	[%i5+0x01c]%asi,%l6	! %l6 = 00000000ff0472e3
!	Mem[0000000010101410] = e36f6fc900000003, %f10 = 80a2ecaa 77a322cb
	ldda	[%i4+%o5]0x80,%f10	! %f10 = e36f6fc9 00000003
!	Mem[0000000010101400] = 8adb52ff3d7b0003, %l2 = fffffffffffffff8
	ldx	[%i4+%g0],%l2		! %l2 = 8adb52ff3d7b0003
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 0000000000000000, %l2 = 8adb52ff3d7b0003, %l5 = 000000000000000a
	casxa	[%i5]0x80,%l2,%l5	! %l5 = 0000000000000000

p0_label_124:
!	%f30 = ffff0000 f101c0ef, Mem[0000000030081410] = ffe30000 00000000
	stda	%f30,[%i2+%o5]0x81	! Mem[0000000030081410] = ffff0000 f101c0ef
!	%l0 = 000000000000e3ff, Mem[0000000010001408] = ffe30000
	stwa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000e3ff
!	%l5 = 0000000000000000, Mem[00000000201c0000] = ffd7afd5, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000afd5
!	%l2 = 8adb52ff3d7b0003, Mem[0000000030101410] = 000000fe
	stba	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 030000fe
!	Mem[0000000020800000] = ffffbb34, %l2 = 8adb52ff3d7b0003
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000030041400] = e37be634
	stba	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 007be634
!	Mem[0000000030101408] = 8dff72e3, %l0 = 000000000000e3ff
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 000000e3000000ff
!	Mem[00000000100c1400] = 00000000, %l0 = 00000000000000e3
	swapa	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l2 = 000000ff, %l3 = 00000017, Mem[00000000300c1410] = e3ffffff 00000000
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff 00000017
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (24)
!	Mem[00000000100c1400] = e3000000 3d7be634 ff0000ff 34e67b3d
!	Mem[00000000100c1410] = ffff0000 f101c0ef 3317a600 52529726
!	Mem[00000000100c1420] = 97000000 8dff72e3 44a4c480 b75cd9da
!	Mem[00000000100c1430] = 00000000 0000002d 8dff72e3 785462bf
	ldda	[%i3]ASI_BLK_AIUPL,%f0	! Block Load from 00000000100c1400

p0_label_125:
!	Mem[0000000010181408] = d5340000 1b8734ae, %l0 = 00000000, %l1 = 00000000
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 000000001b8734ae 00000000d5340000
!	Mem[0000000010041408] = e3000000000000ff, %f20 = e37204ff 0000ffff
	ldda	[%i1+%o4]0x80,%f20	! %f20 = e3000000 000000ff
!	Mem[0000000030041400] = 34e67b00, %l2 = 00000000000000ff
	lduba	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %f22 = 94305e9f
	lda	[%i2+%o5]0x88,%f22	! %f22 = 00000000
!	Mem[0000000030081410] = 0000ffff, %l1 = 00000000d5340000
	lduba	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141410] = ff000003, %l3 = 0000000000000017
	lduba	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = ff000000, %l0 = 000000001b8734ae
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010141408] = efc001f1, %l5 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l5	! %l5 = ffffffffffffefc0
!	Mem[0000000010141400] = 0000000000000000, %f24 = ffe30000 037de60a
	ldda	[%i5+%g0]0x88,%f24	! %f24 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%f18 = 03000000 c96f6fe3, Mem[0000000010081410] = 00000000 0034871b
	stda	%f18,[%i2+%o5]0x88	! Mem[0000000010081410] = 03000000 c96f6fe3

!	Check Point 25 for processor 0

	set	p0_check_pt_data_25,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffff000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffefc0
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ff0472e3
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000e37b
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 34e67b3d 000000e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 3d7be634 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = efc001f1 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 26975252 00a61733
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = e372ff8d 00000097
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = dad95cb7 80c4a444
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 2d000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = bf625478 e372ff8d
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 03000000 c96f6fe3
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x90],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = e3000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x98],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 ffff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa0],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ffff0000 f101c0ef
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 25 completed


p0_label_126:
!	%l0 = ffffffffff000000, Mem[0000000030081410] = efc001f10000ffff
	stxa	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffffff000000
	membar	#Sync			! Added by membar checker (25)
!	%l0 = ffffffffff000000, Mem[00000000100c1420] = 970000008dff72e3
	stx	%l0,[%i3+0x020]		! Mem[00000000100c1420] = ffffffffff000000
!	%l6 = ff0472e3, %l7 = 0000e37b, Mem[0000000010081410] = c96f6fe3 03000000
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = ff0472e3 0000e37b
!	%l7 = 000000000000e37b, Mem[0000000010081430] = ffe67b3d1a53d335, %asi = 80
	stxa	%l7,[%i2+0x030]%asi	! Mem[0000000010081430] = 000000000000e37b
!	Mem[0000000030181408] = 00000000, %l5 = ffffffffffffefc0
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030181400] = 000000ff 00000000
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 00000000
!	Mem[00000000100c1400] = e3000000, %l6 = 00000000ff0472e3
	swapa	[%i3+%g0]0x80,%l6	! %l6 = 00000000e3000000
!	%l0 = ff000000, %l1 = 000000ff, Mem[0000000010141408] = f101c0ef ffff0000
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000 000000ff
!	%f9  = 00000097, Mem[0000000030081410] = 000000ff
	sta	%f9 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000097
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0000f00400000000, %f24 = 00000000 00000000
	ldda	[%i2+%o4]0x81,%f24	! %f24 = 0000f004 00000000

p0_label_127:
!	Mem[0000000010101408] = ff000000ff8734ed, %l1 = 00000000000000ff
	ldxa	[%i4+0x008]%asi,%l1	! %l1 = ff000000ff8734ed
!	Mem[0000000010041410] = 03007b3d00000000, %l2 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l2	! %l2 = 03007b3d00000000
!	Mem[0000000010101410] = e36f6fc900000003, %l2 = 03007b3d00000000
	ldxa	[%i4+0x010]%asi,%l2	! %l2 = e36f6fc900000003
!	Mem[0000000010041410] = 03007b3d00000000, %l0 = ffffffffff000000
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = 03007b3d00000000
!	Mem[0000000030181408] = 000000ff, %l6 = 00000000e3000000
	ldswa	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = e37204ff7be30000, %l5 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = e37204ff7be30000
!	Mem[0000000030141408] = 00000000, %l1 = ff000000ff8734ed
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = f101c0efc96f6fe3, %f18 = 03000000 c96f6fe3
	ldda	[%i0+%o5]0x81,%f18	! %f18 = f101c0ef c96f6fe3
!	Mem[00000000100c1408] = ff0000ff, %l5 = e37204ff7be30000
	ldub	[%i3+0x00a],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 000000ff, %l6 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 000000ff000000ff

p0_label_128:
!	%f22 = 00000000 ffff0000, Mem[0000000010101400] = ff52db8a 03007b3d
	stda	%f22,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 ffff0000
!	%l6 = 00000000000000ff, Mem[0000000030101410] = 030000feaefe0fff
	stxa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000000000ff
!	Mem[00000000100c1424] = ff000000, %l1 = 0000000000000000, %asi = 80
	swapa	[%i3+0x024]%asi,%l1	! %l1 = 00000000ff000000
!	%l0 = 03007b3d00000000, Mem[0000000010101408] = ff000000
	stw	%l0,[%i4+%o4]		! Mem[0000000010101408] = 00000000
!	%l7 = 000000000000e37b, Mem[0000000030001400] = 00000097
	stwa	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000e37b
!	%l4 = 0000000000000000, imm = fffffffffffffb11, %l2 = e36f6fc900000003
	xor	%l4,-0x4ef,%l2		! %l2 = fffffffffffffb11
!	Mem[0000000030141408] = 00000000, %l1 = 00000000ff000000
	ldstuba	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 0000e37b, Mem[0000000030001408] = fe000000 00000300
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff 0000e37b
!	Mem[00000000300c1400] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i3+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000000ff, %l5 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l5	! %l5 = 00000000000000ff

p0_label_129:
!	Mem[0000000030141408] = c40ffeae000000ff, %f10 = dad95cb7 80c4a444
	ldda	[%i5+%o4]0x89,%f10	! %f10 = c40ffeae 000000ff
!	Mem[0000000010081400] = 0ae67d03 34e67be3, %l6 = 000000ff, %l7 = 0000e37b
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 000000000ae67d03 0000000034e67be3
!	Mem[0000000010101400] = 0000ffff, %l2 = fffffffffffffb11
	lduba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = f86ccfd5, %l5 = 00000000000000ff
	ldsha	[%i2+%o4]0x80,%l5	! %l5 = fffffffffffff86c
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010081400] = 0ae67d03 34e67be3 f86ccfd5 00000003
!	Mem[0000000010081410] = e37204ff 7be30000 980b74a7 516fa616
!	Mem[0000000010081420] = 52f578f7 3d7be6ff cb22a377 aaeca280
!	Mem[0000000010081430] = 00000000 0000e37b bb1ed552 dc5ebd74
	ldda	[%i2]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[00000000100c1418] = 3317a600, %l2 = 0000000000000000
	lduw	[%i3+0x018],%l2		! %l2 = 000000003317a600
!	Mem[00000000100c1428] = 44a4c480 b75cd9da, %l6 = 0ae67d03, %l7 = 34e67be3
	ldda	[%i3+0x028]%asi,%l6	! %l6 = 0000000044a4c480 00000000b75cd9da
!	Mem[0000000010181400] = 00000000, %f10 = c40ffeae
	lda	[%i6+%g0]0x88,%f10	! %f10 = 00000000
!	Mem[0000000010001410] = 00000003, %l6 = 0000000044a4c480
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000003
!	Starting 10 instruction Store Burst
!	%l5 = fffffffffffff86c, Mem[0000000010001400] = 17000000
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 1700006c

p0_label_130:
!	%l3 = 00000000000000ff, Mem[0000000030041410] = 1b873400
	stba	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 1b8734ff
!	Mem[0000000030181410] = ff0ffeae, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l2 = 000000003317a600, Mem[0000000010181408] = ae34871b
	stwa	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 3317a600
!	%f10 = 00000000 000000ff, Mem[0000000010001428] = 340353ac ffffe3ff
	stda	%f10,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000 000000ff
!	%l6 = 0000000000000003, Mem[0000000010001408] = 0000e3ff
	stha	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 0003e3ff
!	Mem[0000000010181419] = 0000ff52, %l5 = fffffffffffff86c
	ldstuba	[%i6+0x019]%asi,%l5	! %l5 = 00000000000000ff
!	%f6  = 26975252, Mem[0000000010041408] = 000000e3
	sta	%f6 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 26975252
!	%f0  = 34e67b3d 000000e3, Mem[0000000010181400] = 00000000 03000000
	stda	%f0 ,[%i6+0x000]%asi	! Mem[0000000010181400] = 34e67b3d 000000e3
!	%l0 = 03007b3d00000000, Mem[0000000010041408] = 52529726
	stha	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00009726
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = e37204ff7be30000, %l6 = 0000000000000003
	ldxa	[%i2+%o5]0x80,%l6	! %l6 = e37204ff7be30000

!	Check Point 26 for processor 0

	set	p0_check_pt_data_26,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 03007b3d00000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000003317a600
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = e37204ff7be30000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 26975252 00a61733
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x40],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x48],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = e37be634 037de60a
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x50],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 03000000 d5cf6cf8
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x58],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 0000e37b ff0472e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x60],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 16a66f51 a7740b98
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x68],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ffe67b3d f778f552
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x70],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 80a2ecaa 77a322cb
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x78],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 7be30000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x80],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 74bd5edc 52d51ebb
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 26 completed


p0_label_131:
!	%f10 = 00000000 000000ff, Mem[0000000030041410] = 1b8734ff 00000000
	stda	%f10,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 000000ff
!	Mem[0000000010141400] = 0000000000000000, %l1 = 00000000000000ff
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = ffff0000, %l5 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 26970000, %l3 = 00000000000000ff
	lduha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = ffaae4d2, %l5 = 0000000000000000
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = 00000000 04f00000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 0000000004f00000 0000000000000000
!	Mem[0000000030181410] = aefe0fff, %l6 = e37204ff7be30000
	lduba	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = e36f6fc9, %l3 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 00000000e36f6fc9
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000030041410] = ff000000
	stwa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff

p0_label_132:
!	Mem[0000000010081400] = 037de60a, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 0000000a000000ff
!	%l6 = 000000ff, %l7 = b75cd9da, Mem[0000000030181408] = ff000000 00000017
	stda	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ff b75cd9da
!	%l6 = 00000000000000ff, Mem[0000000010101418] = f101c0ef, %asi = 80
	stwa	%l6,[%i4+0x018]%asi	! Mem[0000000010101418] = 000000ff
!	%l6 = 00000000000000ff, Mem[0000000010041410] = 3d7b0003
	stha	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 3d7b00ff
!	Mem[0000000030081400] = 2c5f5a70, %l5 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 000000002c5f5a70
!	%l4 = 000000000000000a, Mem[0000000010001428] = 00000000, %asi = 80
	stwa	%l4,[%i0+0x028]%asi	! Mem[0000000010001428] = 0000000a
!	%l0 = 0000000004f00000, Mem[000000001004141e] = ff0472e3, %asi = 80
	stha	%l0,[%i1+0x01e]%asi	! Mem[000000001004141c] = ff040000
!	Mem[0000000030001410] = f101c0ef, %l5 = 000000002c5f5a70
	swapa	[%i0+%o5]0x81,%l5	! %l5 = 00000000f101c0ef
!	%l7 = 00000000b75cd9da, Mem[0000000030141410] = 030000ff
	stba	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 030000da
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 03000000c96f6fe3, %f26 = 80a2ecaa 77a322cb
	ldda	[%i4+%o5]0x88,%f26	! %f26 = 03000000 c96f6fe3

p0_label_133:
!	Mem[0000000030101408] = 8dff72ff, %l4 = 000000000000000a
	ldsha	[%i4+%o4]0x89,%l4	! %l4 = 00000000000072ff
!	Mem[0000000010041410] = ff007b3d00000000, %l5 = 00000000f101c0ef
	ldxa	[%i1+0x010]%asi,%l5	! %l5 = ff007b3d00000000
!	Mem[0000000010041408] = 00009726, %l1 = 0000000000000000
	lduha	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 00009726 000000ff, %l2 = 3317a600, %l3 = e36f6fc9
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 0000000000009726 00000000000000ff
!	Mem[0000000010001408] = 0003e3ffdaa49daa, %l6 = 00000000000000ff
	ldxa	[%i0+0x008]%asi,%l6	! %l6 = 0003e3ffdaa49daa
!	Mem[0000000030001408] = ff000000, %l7 = 00000000b75cd9da
	lduha	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = aefe0fff, %l2 = 0000000000009726
	ldswa	[%i6+%o5]0x89,%l2	! %l2 = ffffffffaefe0fff
!	Mem[0000000010041410] = ff007b3d00000000, %f14 = bf625478 e372ff8d
	ldda	[%i1+%o5]0x80,%f14	! %f14 = ff007b3d 00000000
!	Mem[0000000010001434] = 2d0064b3, %l1 = 0000000000000000
	ldsha	[%i0+0x036]%asi,%l1	! %l1 = 00000000000064b3
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ff0000ff, %l4 = 00000000000072ff
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 000000ff000000ff

p0_label_134:
!	%l4 = 00000000000000ff, Mem[00000000201c0000] = 0000afd5
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 00ffafd5
!	Mem[0000000010041438] = 3b52db8a0000003e, %l5 = ff007b3d00000000, %l5 = ff007b3d00000000
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = 3b52db8a0000003e
!	Mem[00000000300c1408] = 00000000, %l1 = 00000000000064b3
	ldstuba	[%i3+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%f16 = e37be634 037de60a, Mem[0000000010141420] = 5252daa3 3f403703
	stda	%f16,[%i5+0x020]%asi	! Mem[0000000010141420] = e37be634 037de60a
!	Mem[000000001008143c] = dc5ebd74, %l2 = ffffffffaefe0fff
	swap	[%i2+0x03c],%l2		! %l2 = 00000000dc5ebd74
!	%l0 = 04f00000, %l1 = 00000000, Mem[0000000010041438] = 3b52db8a 0000003e
	std	%l0,[%i1+0x038]		! Mem[0000000010041438] = 04f00000 00000000
!	%l0 = 0000000004f00000, Mem[0000000010181410] = 00000000000000ff
	stxa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000004f00000
!	%l5 = 3b52db8a0000003e, Mem[0000000010101428] = 00000003fffff17b
	stx	%l5,[%i4+0x028]		! Mem[0000000010101428] = 3b52db8a0000003e
!	%l0 = 0000000004f00000, Mem[00000000100c1424] = 00000000
	stw	%l0,[%i3+0x024]		! Mem[00000000100c1424] = 04f00000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000ff, %f1  = 000000e3
	lda	[%i3+%o4]0x89,%f1 	! %f1 = 000000ff

p0_label_135:
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000030141400] = ff000000 8ebde1ff ff000000 aefe0fc4
!	Mem[0000000030141410] = da000003 8ffe275d 4bbe3cde 1468c5b9
!	Mem[0000000030141420] = 97000000 00000000 d3f1a09c 1b8734ed
!	Mem[0000000030141430] = baf9b00d 1a53d335 e697de10 d004a503
	ldda	[%i5]ASI_BLK_AIUS,%f16	! Block Load from 0000000030141400
!	Mem[0000000010181430] = 709c90ffffe67b3d, %f10 = 00000000 000000ff
	ldd	[%i6+0x030],%f10	! %f10 = 709c90ff ffe67b3d
!	Mem[0000000030101408] = ff72ff8d, %l4 = 00000000000000ff
	lduwa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ff72ff8d
!	Mem[0000000030181408] = 000000ff, %l0 = 0000000004f00000
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l3 = 00000000000000ff
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001430] = ff00213d2d0064b3, %f8  = e372ff8d 00000097
	ldda	[%i0+0x030]%asi,%f8 	! %f8  = ff00213d 2d0064b3
!	Mem[0000000030101408] = ff72ff8d9f91163e, %l7 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l7	! %l7 = ff72ff8d9f91163e
!	Mem[00000000300c1408] = ff000000, %l0 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010081408] = f86ccfd5, %f10 = 709c90ff
	lda	[%i2+%o4]0x80,%f10	! %f10 = f86ccfd5
!	Starting 10 instruction Store Burst
!	%l6 = 0003e3ffdaa49daa, Mem[0000000030101400] = 0000ffff
	stba	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ffaa

!	Check Point 27 for processor 0

	set	p0_check_pt_data_27,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000dc5ebd74
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff72ff8d
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 3b52db8a0000003e
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0003e3ffdaa49daa
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ff72ff8d9f91163e
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 34e67b3d 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 3d7be634 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ff00213d 2d0064b3
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = f86ccfd5 ffe67b3d
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff007b3d 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 8ebde1ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff000000 aefe0fc4
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = da000003 8ffe275d
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 4bbe3cde 1468c5b9
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 97000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = d3f1a09c 1b8734ed
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = baf9b00d 1a53d335
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = e697de10 d004a503
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 27 completed


p0_label_136:
!	%f15 = 00000000, Mem[000000001014143c] = 0000003e
	st	%f15,[%i5+0x03c]	! Mem[000000001014143c] = 00000000
!	%l4 = 00000000ff72ff8d, Mem[0000000010081410] = ff0472e3
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = ff04728d
!	%f10 = f86ccfd5, Mem[0000000010181410] = 04f00000
	sta	%f10,[%i6+%o5]0x88	! Mem[0000000010181410] = f86ccfd5
!	Mem[0000000030141400] = ff000000, %l0 = 00000000ff000000
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010101410] = c96f6fe3, %l0 = 00000000ff000000
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 000000e3000000ff
!	%l2 = 00000000dc5ebd74, Mem[00000000100c1408] = ff0000ff
	stha	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = bd7400ff
!	%l6 = daa49daa, %l7 = 9f91163e, Mem[0000000010001408] = 0003e3ff daa49daa
	stda	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = daa49daa 9f91163e
!	%l5 = 3b52db8a0000003e, Mem[0000000030181408] = ff000000
	stba	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = ff00003e
!	Mem[000000001010141f] = 000000ff, %l4 = 00000000ff72ff8d
	ldstub	[%i4+0x01f],%l4		! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001018140c] = 000034d5, %l5 = 3b52db8a0000003e
	lduh	[%i6+0x00c],%l5		! %l5 = 0000000000000000

p0_label_137:
!	Mem[0000000010181430] = 709c90ff, %f7  = 00a61733
	ld	[%i6+0x030],%f7 	! %f7 = 709c90ff
!	Mem[0000000010001400] = 6c00001700000000, %l3 = 00000000000000ff
	ldxa	[%i0+%g0]0x80,%l3	! %l3 = 6c00001700000000
!	Mem[000000001014141c] = ff0472e3, %f7  = 709c90ff
	ld	[%i5+0x01c],%f7 	! %f7 = ff0472e3
!	Mem[0000000030001400] = 0000e37b, %l6 = 0003e3ffdaa49daa
	ldswa	[%i0+%g0]0x81,%l6	! %l6 = 000000000000e37b
!	Mem[0000000030101408] = 3e16919f8dff72ff, %l3 = 6c00001700000000
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = 3e16919f8dff72ff
!	Mem[0000000030141400] = ff000000, %l3 = 3e16919f8dff72ff
	ldswa	[%i5+%g0]0x81,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030041408] = ff000000 d5cf6cf8, %l2 = dc5ebd74, %l3 = ff000000
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000ff000000 00000000d5cf6cf8
!	Mem[0000000010001408] = daa49daa, %l0 = 00000000000000e3
	ldsb	[%i0+0x00a],%l0		! %l0 = ffffffffffffff9d
!	%l7 = ff72ff8d9f91163e, imm = 0000000000000361, %l6 = 000000000000e37b
	xnor	%l7,0x361,%l6		! %l6 = 008d0072606eeaa0
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 0000ffff, %l3 = 00000000d5cf6cf8
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 000000000000ffff

p0_label_138:
!	Mem[0000000030181400] = 00000000, %l6 = 008d0072606eeaa0
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%f19 = aefe0fc4, Mem[0000000030081408] = 04f00000
	sta	%f19,[%i2+%o4]0x89	! Mem[0000000030081408] = aefe0fc4
!	Mem[0000000020800041] = 72e3e589, %l5 = 0000000000000000
	ldstub	[%o1+0x041],%l5		! %l5 = 000000e3000000ff
!	%l3 = 000000000000ffff, Mem[0000000010141410] = 34e67b3d
	stha	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = ffff7b3d
!	%l1 = 0000000000000000, Mem[0000000030101400] = aaff0000
	stwa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%f30 = e697de10 d004a503, Mem[0000000030001410] = 705a5f2c e36f6fc9
	stda	%f30,[%i0+%o5]0x89	! Mem[0000000030001410] = e697de10 d004a503
!	Mem[0000000010141430] = 0000ffff, %l3 = 0000ffff, %l2 = ff000000
	add	%i5,0x30,%g1
	casa	[%g1]0x80,%l3,%l2	! %l2 = 000000000000ffff
!	%f20 = da000003, Mem[0000000030001410] = 03a504d0
	sta	%f20,[%i0+%o5]0x81	! Mem[0000000030001410] = da000003
!	%f30 = e697de10 d004a503, %l1 = 0000000000000000
!	Mem[0000000010081428] = cb22a377aaeca280
	add	%i2,0x028,%g1
	stda	%f30,[%g1+%l1]ASI_PST16_P ! Mem[0000000010081428] = cb22a377aaeca280
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 0300000000000000, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = 0300000000000000

p0_label_139:
!	Mem[00000000300c1410] = 000000ff, %l6 = 0000000000000000
	ldswa	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010081400] = ffe67d03 34e67be3 f86ccfd5 00000003
!	Mem[0000000010081410] = 8d7204ff 7be30000 980b74a7 516fa616
!	Mem[0000000010081420] = 52f578f7 3d7be6ff cb22a377 aaeca280
!	Mem[0000000010081430] = 00000000 0000e37b bb1ed552 aefe0fff
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000030081400] = 00000000 0000b805, %l0 = ffffff9d, %l1 = 00000000
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000 000000000000b805
!	Mem[0000000010041410] = ff007b3d 00000000, %l4 = 000000ff, %l5 = 000000e3
	ldda	[%i1+0x010]%asi,%l4	! %l4 = 00000000ff007b3d 0000000000000000
!	Mem[0000000030081408] = 00000000aefe0fc4, %f6  = 26975252 ff0472e3
	ldda	[%i2+%o4]0x89,%f6 	! %f6  = 00000000 aefe0fc4
!	Mem[0000000010081400] = 037de6ff, %l0 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l0	! %l0 = 00000000037de6ff
!	Mem[0000000030181408] = 3e0000ff, %l4 = 00000000ff007b3d
	lduha	[%i6+%o4]0x81,%l4	! %l4 = 0000000000003e00
!	Mem[0000000030001400] = 0000e37b0dd4a926, %l7 = ff72ff8d9f91163e
	ldxa	[%i0+%g0]0x81,%l7	! %l7 = 0000e37b0dd4a926
!	Mem[0000000010181404] = 000000e3, %l1 = 000000000000b805
	ldsba	[%i6+0x007]%asi,%l1	! %l1 = ffffffffffffffe3
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000003e00, Mem[000000001014141e] = ff0472e3
	sth	%l4,[%i5+0x01e]		! Mem[000000001014141c] = ff043e00

p0_label_140:
!	Mem[0000000030101408] = 8dff72ff, %l3 = 000000000000ffff
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 000000008dff72ff
!	Mem[0000000010101410] = ff6f6fc9, %l1 = ffffffe3, %l0 = 037de6ff
	add	%i4,0x10,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 00000000ff6f6fc9
!	%f4  = efc001f1 0000ffff, Mem[0000000010181408] = 3317a600 000034d5
	stda	%f4 ,[%i6+%o4]0x80	! Mem[0000000010181408] = efc001f1 0000ffff
!	%l4 = 0000000000003e00, Mem[00000000100c1400] = e37204ff
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = e3720400
	membar	#Sync			! Added by membar checker (29)
!	%f11 = ffe67b3d, Mem[000000001008143c] = aefe0fff
	sta	%f11,[%i2+0x03c]%asi	! Mem[000000001008143c] = ffe67b3d
!	Mem[000000001004141c] = ff040000, %l6 = 000000ff, %l7 = 0dd4a926
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 00000000ff040000
!	%f9  = 2d0064b3, Mem[0000000030001400] = 7be30000
	sta	%f9 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 2d0064b3
!	Mem[0000000010041400] = ff000000, %l0 = 00000000ff6f6fc9
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%f30 = bb1ed552 aefe0fff, Mem[0000000030081408] = aefe0fc4 00000000
	stda	%f30,[%i2+%o4]0x89	! Mem[0000000030081408] = bb1ed552 aefe0fff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = efc001f10000ffff, %l7 = 00000000ff040000
	ldxa	[%i3+%o5]0x88,%l7	! %l7 = efc001f10000ffff

!	Check Point 28 for processor 0

	set	p0_check_pt_data_28,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffe3
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 000000008dff72ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000003e00
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = efc001f10000ffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 34e67b3d 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 3d7be634 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = efc001f1 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 aefe0fc4
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffe67d03 34e67be3
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = f86ccfd5 00000003
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 8d7204ff 7be30000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 980b74a7 516fa616
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 52f578f7 3d7be6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = cb22a377 aaeca280
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 0000e37b
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = bb1ed552 aefe0fff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 28 completed


p0_label_141:
!	Mem[0000000010001400] = 00000000 1700006c, %l6 = 000000ff, %l7 = 0000ffff
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 000000001700006c 0000000000000000
!	Mem[00000000100c143c] = 785462bf, %l0 = 0000000000000000
	ldsha	[%i3+0x03e]%asi,%l0	! %l0 = 00000000000062bf
!	Mem[00000000300c1400] = 000000ff, %l2 = 000000000000ffff
	ldsha	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%f27 = aaeca280, %f15 = 00000000
	fitos	%f27,%f15		! %f15 = ceaa26bb
!	Mem[0000000010101410] = ff6f6fc9, %l2 = 00000000000000ff
	lduba	[%i4+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001400] = 6c00001700000000, %l2 = 00000000000000ff
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = 6c00001700000000
!	Mem[0000000010001408] = daa49daa, %l6 = 000000001700006c
	ldsba	[%i0+%o4]0x80,%l6	! %l6 = ffffffffffffffda
!	Mem[0000000010001438] = 62ef3c78bb5ee3d7, %f28 = 00000000 0000e37b
	ldd	[%i0+0x038],%f28	! %f28 = 62ef3c78 bb5ee3d7
!	Mem[0000000010041408] = 00009726, %f30 = bb1ed552
	lda	[%i1+%o4]0x80,%f30	! %f30 = 00009726
!	Starting 10 instruction Store Burst
!	Mem[0000000010101429] = 3b52db8a, %l5 = 0000000000000000
	ldstuba	[%i4+0x029]%asi,%l5	! %l5 = 00000052000000ff

p0_label_142:
!	Mem[0000000010001408] = aa9da4da, %l2 = 6c00001700000000
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 000000da000000ff
!	%f18 = f86ccfd5 00000003, Mem[0000000030181408] = 3e0000ff b75cd9da
	stda	%f18,[%i6+%o4]0x81	! Mem[0000000030181408] = f86ccfd5 00000003
!	Mem[0000000030081410] = 97000000, %l5 = 0000000000000052
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%f16 = ffe67d03, Mem[0000000010101400] = d5cf6cf8
	sta	%f16,[%i4+0x000]%asi	! Mem[0000000010101400] = ffe67d03
!	Mem[00000000201c0000] = 00ffafd5, %l0 = 00000000000062bf
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	%f2  = 3d7be634 ff0000ff, %l5 = 0000000000000000
!	Mem[0000000030181420] = 8d370cf7bfdfa95c
	add	%i6,0x020,%g1
	stda	%f2,[%g1+%l5]ASI_PST8_S ! Mem[0000000030181420] = 8d370cf7bfdfa95c
!	Mem[00000000300c1400] = 000000ff, %l0 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%l3 = 000000008dff72ff, Mem[0000000021800140] = b18f9071, %asi = 80
	stha	%l3,[%o3+0x140]%asi	! Mem[0000000021800140] = 72ff9071
!	Mem[0000000010001408] = ffa49daa, %l1 = ffffffe3, %l0 = 000000ff
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 00000000ffa49daa
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ff000000, %l0 = 00000000ffa49daa
	lduba	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000ff

p0_label_143:
!	Mem[0000000030101408] = ffff0000, %l7 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 00000000ffff0000
!	Mem[0000000010081408] = d5cf6cf8, %l1 = ffffffffffffffe3
	ldsba	[%i2+%o4]0x88,%l1	! %l1 = fffffffffffffff8
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010081400] = ffe67d03 34e67be3 f86ccfd5 00000003
!	Mem[0000000010081410] = 8d7204ff 7be30000 980b74a7 516fa616
!	Mem[0000000010081420] = 52f578f7 3d7be6ff cb22a377 aaeca280
!	Mem[0000000010081430] = 00000000 0000e37b bb1ed552 ffe67b3d
	ldda	[%i2]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[00000000100c1400] = 34e67b3de3720400, %f12 = 2d000000 00000000
	ldda	[%i3+%g0]0x88,%f12	! %f12 = 34e67b3d e3720400
!	Mem[00000000100c1400] = 000472e3, %l2 = 00000000000000da
	ldswa	[%i3+%g0]0x80,%l2	! %l2 = 00000000000472e3
!	Mem[0000000010181408] = ffff0000f101c0ef, %l0 = 00000000000000ff
	ldxa	[%i6+%o4]0x88,%l0	! %l0 = ffff0000f101c0ef
!	Mem[0000000010181420] = a509aa5e, %l6 = ffffffffffffffda
	lduw	[%i6+0x020],%l6		! %l6 = 00000000a509aa5e
!	Mem[0000000030101410] = ff00000000000000, %f8  = ff00213d 2d0064b3
	ldda	[%i4+%o5]0x89,%f8 	! %f8  = ff000000 00000000
!	Mem[0000000010101410] = ff6f6fc9, %l3 = 000000008dff72ff
	ldswa	[%i4+%o5]0x80,%l3	! %l3 = ffffffffff6f6fc9
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffff6f6fc9, Mem[0000000020800000] = ffffbb34
	stb	%l3,[%o1+%g0]		! Mem[0000000020800000] = c9ffbb34

p0_label_144:
!	%f8  = ff000000 00000000, %l1 = fffffffffffffff8
!	Mem[0000000030181430] = 93c406e1bce6ee8d
	add	%i6,0x030,%g1
	stda	%f8,[%g1+%l1]ASI_PST8_S ! Mem[0000000030181430] = ff00000000e6ee8d
!	%l6 = a509aa5e, %l7 = ffff0000, Mem[0000000010181418] = 00ffff52 00000097
	stda	%l6,[%i6+0x018]%asi	! Mem[0000000010181418] = a509aa5e ffff0000
!	Mem[0000000030181408] = f86ccfd5, %l7 = 00000000ffff0000
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 000000f8000000ff
!	%l5 = 0000000000000000, Mem[0000000010041400] = f101c0efff0000ff
	stxa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000
!	Mem[0000000010041408] = 26970000, %l1 = fffffffffffffff8
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l7 = 00000000000000f8, Mem[00000000201c0000] = ffffafd5
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = f8ffafd5
	membar	#Sync			! Added by membar checker (31)
!	%l6 = a509aa5e, %l7 = 000000f8, Mem[0000000010081430] = 00000000 0000e37b
	stda	%l6,[%i2+0x030]%asi	! Mem[0000000010081430] = a509aa5e 000000f8
!	%l7 = 00000000000000f8, Mem[0000000010181410] = f86ccfd5
	stwa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000f8
!	%l0 = ffff0000f101c0ef, Mem[0000000010101408] = 00000000
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = f101c0ef
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 2d0064b3, %l0 = ffff0000f101c0ef
	lduwa	[%i0+%g0]0x89,%l0	! %l0 = 000000002d0064b3

p0_label_145:
!	Mem[0000000030141410] = 030000da, %l3 = ffffffffff6f6fc9
	ldsha	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000da
!	Mem[0000000010181408] = f101c0ef, %l6 = 00000000a509aa5e
	ldsba	[%i6+%o4]0x88,%l6	! %l6 = ffffffffffffffef
!	Mem[0000000030081408] = bb1ed552 aefe0fff, %l4 = 00003e00, %l5 = 00000000
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 00000000aefe0fff 00000000bb1ed552
!	Mem[0000000010081428] = cb22a377 aaeca280, %l0 = 2d0064b3, %l1 = 00000000
	ldda	[%i2+0x028]%asi,%l0	! %l0 = 00000000cb22a377 00000000aaeca280
!	Mem[0000000010041408] = 269700ff, %f9  = 00000000
	lda	[%i1+%o4]0x88,%f9 	! %f9 = 269700ff
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 00000000cb22a377
	setx	0xf24e22a048bdcf5f,%g7,%l0 ! %l0 = f24e22a048bdcf5f
!	%l1 = 00000000aaeca280
	setx	0xa2cda46070f315b1,%g7,%l1 ! %l1 = a2cda46070f315b1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f24e22a048bdcf5f
	setx	0x8da977984d66023c,%g7,%l0 ! %l0 = 8da977984d66023c
!	%l1 = a2cda46070f315b1
	setx	0xfd1e25d069af7cd6,%g7,%l1 ! %l1 = fd1e25d069af7cd6
!	Mem[0000000030101410] = ff000000 00000000, %l6 = ffffffef, %l7 = 000000f8
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[00000000100c1430] = 000000000000002d, %l1 = fd1e25d069af7cd6
	ldxa	[%i3+0x030]%asi,%l1	! %l1 = 000000000000002d
!	Mem[00000000100c1410] = ffff0000f101c0ef, %f4  = efc001f1 0000ffff
	ldda	[%i3+%o5]0x80,%f4 	! %f4  = ffff0000 f101c0ef
!	Starting 10 instruction Store Burst
!	%f30 = 3d7be6ff 52d51ebb, Mem[0000000010081408] = d5cf6cf8 03000000
	stda	%f30,[%i2+%o4]0x88	! Mem[0000000010081408] = 3d7be6ff 52d51ebb

!	Check Point 29 for processor 0

	set	p0_check_pt_data_29,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 8da977984d66023c
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000002d
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000472e3
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000da
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000bb1ed552
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 34e67b3d 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffff0000 f101c0ef
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 aefe0fc4
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ff000000 269700ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 34e67b3d e3720400
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff007b3d ceaa26bb
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = e37be634 037de6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 03000000 d5cf6cf8
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 0000e37b ff04728d
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 16a66f51 a7740b98
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ffe67b3d f778f552
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 80a2ecaa 77a322cb
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 7be30000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 3d7be6ff 52d51ebb
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 29 completed


p0_label_146:
!	%l4 = 00000000aefe0fff, Mem[0000000030041410] = 000000ff
	stba	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = ff0000ff
!	Mem[0000000030081410] = ff000097, %l0 = 8da977984d66023c
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 00000000ff000097
!	%f28 = 7be30000 00000000, %l4 = 00000000aefe0fff
!	Mem[0000000030141418] = 4bbe3cde1468c5b9
	add	%i5,0x018,%g1
	stda	%f28,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030141418] = 000000000000e37b
!	%l3 = 00000000000000da, Mem[0000000010041420] = 5252daa33f403703, %asi = 80
	stxa	%l3,[%i1+0x020]%asi	! Mem[0000000010041420] = 00000000000000da
!	Mem[0000000030181408] = d5cf6cff, %l5 = 00000000bb1ed552
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l0 = ff000097, %l1 = 0000002d, Mem[0000000010081400] = ffe67d03 34e67be3
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000097 0000002d
!	%f7  = aefe0fc4, Mem[0000000030101408] = 0000ffff
	sta	%f7 ,[%i4+%o4]0x89	! Mem[0000000030101408] = aefe0fc4
!	%l2 = 000472e3, %l3 = 000000da, Mem[0000000010141420] = e37be634 037de60a
	stda	%l2,[%i5+0x020]%asi	! Mem[0000000010141420] = 000472e3 000000da
!	%f16 = e37be634 037de6ff 03000000 d5cf6cf8
!	%f20 = 0000e37b ff04728d 16a66f51 a7740b98
!	%f24 = ffe67b3d f778f552 80a2ecaa 77a322cb
!	%f28 = 7be30000 00000000 3d7be6ff 52d51ebb
	stda	%f16,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff0000ff00000000, %l3 = 00000000000000da
	ldxa	[%i1+%o5]0x81,%l3	! %l3 = ff0000ff00000000

p0_label_147:
!	Mem[0000000030081400] = 05b8000000000000, %f2  = 3d7be634 ff0000ff
	ldda	[%i2+%g0]0x89,%f2 	! %f2  = 05b80000 00000000
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000010041410] = 0000e37b, %l1 = 000000000000002d
	lduha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 3d7be634, %l4 = 00000000aefe0fff
	ldsha	[%i6+%g0]0x88,%l4	! %l4 = ffffffffffffe634
!	Mem[00000000201c0000] = f8ffafd5, %l3 = ff0000ff00000000
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = fffffffffffff8ff
!	Mem[0000000030141410] = 030000da, %l6 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000da
!	Mem[0000000010081430] = a509aa5e000000f8, %f24 = ffe67b3d f778f552
	ldd	[%i2+0x030],%f24	! %f24 = a509aa5e 000000f8
!	Mem[0000000030101400] = 00000000, %l2 = 00000000000472e3
	lduwa	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 03000000, %l1 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l1	! %l1 = 0000000003000000
!	Mem[0000000030181410] = 000000ffaefe0fff, %l0 = 00000000ff000097
	ldxa	[%i6+%o5]0x89,%l0	! %l0 = 000000ffaefe0fff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081420] = 52f578f73d7be6ff, %l6 = 00000000000000da, %l7 = 00000000ff000000
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = 52f578f73d7be6ff

p0_label_148:
!	%l1 = 0000000003000000, Mem[0000000010181408] = efc001f10000ffff
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000003000000
!	%l2 = 0000000000000000, Mem[0000000030001408] = ff000000
	stba	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ff000000
!	%l0 = 000000ffaefe0fff, Mem[00000000201c0000] = f8ffafd5, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0fffafd5
!	%l0 = 000000ffaefe0fff, Mem[0000000030141408] = c40ffeae000000ff
	stxa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ffaefe0fff
!	Mem[0000000030001408] = 000000ff, %l3 = fffffffffffff8ff
	ldstuba	[%i0+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030001400] = b364002d
	stha	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000002d
!	Mem[0000000010041408] = 03000000, %l5 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 00000003000000ff
!	Mem[0000000030141408] = ff0ffeae, %l3 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l3	! %l3 = 00000000ff0ffeae
!	%l7 = 52f578f73d7be6ff, Mem[0000000010081412] = 8d7204ff
	stb	%l7,[%i2+0x012]		! Mem[0000000010081410] = 8d72ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 0fffafd5, %l7 = 52f578f73d7be6ff
	ldsh	[%o0+%g0],%l7		! %l7 = 0000000000000fff

p0_label_149:
!	Mem[0000000010181410] = f8000000 00000000, %l6 = 000000da, %l7 = 00000fff
	ldda	[%i6+0x010]%asi,%l6	! %l6 = 00000000f8000000 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l0 = 000000ffaefe0fff
	lduwa	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101404] = 00000000, %l7 = 0000000000000000
	lduba	[%i4+0x004]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 970000ff, %l1 = 0000000003000000
	ldsha	[%i2+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = ff00000000000000, %f18 = 03000000 d5cf6cf8
	ldda	[%i3+%o4]0x81,%f18	! %f18 = ff000000 00000000
!	Mem[00000000300c1410] = ff000000, %l1 = 00000000000000ff
	lduba	[%i3+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101400] = 00000000ff0472e3, %f24 = a509aa5e 000000f8
	ldda	[%i4+%g0]0x81,%f24	! %f24 = 00000000 ff0472e3
!	Mem[0000000030101408] = aefe0fc4, %f23 = a7740b98
	lda	[%i4+%o4]0x89,%f23	! %f23 = aefe0fc4
!	Mem[0000000010101400] = ffe67d03, %l3 = 00000000ff0ffeae
	ldswa	[%i4+0x000]%asi,%l3	! %l3 = ffffffffffe67d03
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 0000e37b, %l5 = 0000000000000003
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 000000000000e37b

p0_label_150:
!	%l1 = 00000000000000ff, Mem[0000000010001408] = ffa49daa
	stha	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 00ff9daa
!	%l6 = f8000000, %l7 = 00000000, Mem[0000000030101410] = 00000000 000000ff
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = f8000000 00000000
!	Mem[0000000010041424] = f778f552, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i1+0x024]%asi,%l0	! %l0 = 00000000f778f552
!	Mem[0000000010001438] = 62ef3c78, %l5 = 000000000000e37b
	ldsh	[%i0+0x03a],%l5		! %l5 = 0000000000003c78
!	Mem[00000000300c1408] = ff000000, %l3 = ffffffffffe67d03
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[00000000100c1408] = bd7400ff, %l5 = 0000000000003c78
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 00000000bd7400ff
!	%f6  = 00000000 aefe0fc4, Mem[0000000010101400] = 037de6ff 00000000
	stda	%f6 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 aefe0fc4
!	%l0 = 00000000f778f552, Mem[00000000100c1400] = 000472e3
	stb	%l0,[%i3+%g0]		! Mem[00000000100c1400] = 520472e3
!	Mem[0000000030141410] = 030000da, %l6 = 00000000f8000000
	swapa	[%i5+%o5]0x89,%l6	! %l6 = 00000000030000da
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff0ffeaeff000000, %l0 = 00000000f778f552
	ldxa	[%i6+%o5]0x81,%l0	! %l0 = ff0ffeaeff000000

!	Check Point 30 for processor 0

	set	p0_check_pt_data_30,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ff0ffeaeff000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffe634
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000bd7400ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000030000da
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 05b80000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 aefe0fc4
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x60],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 16a66f51 aefe0fc4
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x68],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 ff0472e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 30 completed


p0_label_151:
!	Mem[0000000030141408] = 000000ff00000000, %l4 = ffffffffffffe634
	ldxa	[%i5+%o4]0x89,%l4	! %l4 = 000000ff00000000
!	Mem[0000000030181408] = d5cf6cff, %f18 = ff000000
	lda	[%i6+%o4]0x89,%f18	! %f18 = d5cf6cff
!	Mem[0000000010041430] = 7be3000000000000, %f0  = 34e67b3d 000000ff
	ldd	[%i1+0x030],%f0 	! %f0  = 7be30000 00000000
!	Mem[0000000010101408] = efc001f1ff8734ed, %f4  = ffff0000 f101c0ef
	ldda	[%i4+%o4]0x80,%f4 	! %f4  = efc001f1 ff8734ed
!	Mem[0000000010041408] = f86ccfd5 000000ff, %l4 = 00000000, %l5 = bd7400ff
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff 00000000f86ccfd5
!	Mem[0000000030181400] = 00000000 000000ff, %l4 = 000000ff, %l5 = f86ccfd5
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[0000000010081400] = ff000097, %l1 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ff000097
!	Mem[0000000010081410] = 8d72ffff, %l0 = ff0ffeaeff000000
	ldsha	[%i2+0x012]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[000000001004142c] = 77a322cb, %l6 = 00000000030000da
	lduw	[%i1+0x02c],%l6		! %l6 = 0000000077a322cb
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ff000097, Mem[0000000030081400] = 00000000
	stwa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000097

p0_label_152:
!	Mem[0000000010001400] = 6c00001700000000, %l4 = 00000000000000ff, %l0 = ffffffffffffffff
	casxa	[%i0]0x80,%l4,%l0	! %l0 = 6c00001700000000
!	Mem[0000000010141438] = 00000000, %l6 = 0000000077a322cb
	swap	[%i5+0x038],%l6		! %l6 = 0000000000000000
!	Mem[0000000030141400] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%l0 = 00000000, %l1 = ff000097, Mem[00000000100c1400] = e3720452 34e67b3d
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 ff000097
!	%l4 = 00000000000000ff, Mem[0000000030101408] = aefe0fc4
	stha	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = aefe00ff
!	%l2 = 00000000, %l3 = ff000000, Mem[0000000010141408] = 000000ff ff000000
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 ff000000
!	Mem[00000000300c1408] = 037de6ff, %l6 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030181400] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000021800101] = 97530ae8, %l3 = 00000000ff000000
	ldstub	[%o3+0x101],%l3		! %l3 = 00000053000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 000000f8, %l6 = 00000000000000ff
	lduba	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000f8

p0_label_153:
!	Mem[0000000010081420] = 52f578f7 3d7be6ff, %l2 = 000000ff, %l3 = 00000053
	ldda	[%i2+0x020]%asi,%l2	! %l2 = 0000000052f578f7 000000003d7be6ff
!	Mem[0000000030141400] = 000000ff, %l1 = 00000000ff000097
	lduwa	[%i5+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101404] = 00000000, %l0 = 6c00001700000000
	lduh	[%i4+0x006],%l0		! %l0 = 0000000000000000
!	Mem[00000000218000c0] = ff04cd54, %l3 = 000000003d7be6ff
	lduba	[%o3+0x0c0]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101408] = efc001f1, %f3  = 00000000
	lda	[%i4+%o4]0x80,%f3 	! %f3 = efc001f1
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000030101400] = 00000000 ff0472e3 ff00feae 9f91163e
!	Mem[0000000030101410] = f8000000 00000000 99222fbf d1e047ee
!	Mem[0000000030101420] = e3583621 2cced994 2dee399f 47c2c6a4
!	Mem[0000000030101430] = e3dfa430 a3429ce0 ebc7bffd d0a5e0d1
	ldda	[%i4]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030101400
!	Mem[0000000010141400] = 00000000, %l6 = 00000000000000f8
	ldub	[%i5+0x003],%l6		! %l6 = 0000000000000000
!	Mem[0000000030101410] = f800000000000000, %l4 = 00000000000000ff
	ldxa	[%i4+%o5]0x81,%l4	! %l4 = f800000000000000
!	Mem[0000000010181438] = d0eab90c, %f24 = 00000000
	ld	[%i6+0x038],%f24	! %f24 = d0eab90c
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 030000da, %l4 = f800000000000000
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 00000000030000da

p0_label_154:
!	%f28 = 7be30000 00000000, Mem[0000000010141400] = 00000000 00000000
	stda	%f28,[%i5+%g0]0x80	! Mem[0000000010141400] = 7be30000 00000000
!	%l0 = 0000000000000000, Mem[0000000010081410] = 0000e37bffff728d
	stxa	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000000
!	%l2 = 0000000052f578f7, Mem[0000000030041400] = 007be634
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 78f7e634
!	Mem[0000000010181408] = 00000000, %l0 = 0000000000000000, %asi = 80
	swapa	[%i6+0x008]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 0fffafd5, %l3 = 00000000000000ff
	ldstub	[%o0+%g0],%l3		! %l3 = 0000000f000000ff
!	Mem[00000000300c1410] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	%l2 = 0000000052f578f7, Mem[0000000030041400] = 78f7e634
	stba	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = f7f7e634
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030001408] = ff0000ff 7be30000
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 000000ff
	membar	#Sync			! Added by membar checker (34)
!	%l7 = 00000000000000ff, Mem[0000000030101410] = 000000f8
	stba	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = c40ffeae 00000000, %l4 = 030000da, %l5 = 00000000
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 00000000c40ffeae 0000000000000000

p0_label_155:
!	Mem[0000000010181410] = f800000000000000, %l3 = 000000000000000f
	ldxa	[%i6+%o5]0x80,%l3	! %l3 = f800000000000000
!	Mem[0000000030001410] = e697de1000000000, %f12 = e09c42a3 30a4dfe3
	ldda	[%i0+%o5]0x89,%f12	! %f12 = e697de10 00000000
!	Mem[000000001000142c] = 000000ff, %l4 = 00000000c40ffeae
	ldsh	[%i0+0x02e],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010041410] = 03000000, %l6 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = 0000000003000000
!	Mem[0000000010041408] = f86ccfd5000000ff, %l5 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l5	! %l5 = f86ccfd5000000ff
!	Mem[0000000030001408] = 00000000, %l0 = 0000000000000000
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800180] = 52f9ae0c, %l7 = 00000000000000ff
	ldsha	[%o3+0x180]%asi,%l7	! %l7 = 00000000000052f9
!	Mem[00000000100c1410] = ffff0000, %f14 = d1e0a5d0
	lda	[%i3+%o5]0x80,%f14	! %f14 = ffff0000
!	Mem[0000000030041400] = f7f7e634 037de60a, %l6 = 03000000, %l7 = 000052f9
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 00000000f7f7e634 00000000037de60a
!	Starting 10 instruction Store Burst
!	%l3 = f800000000000000, Mem[0000000010001410] = 0000000000000003
	stxa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = f800000000000000

!	Check Point 31 for processor 0

	set	p0_check_pt_data_31,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000052f578f7
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = f800000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = f86ccfd5000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000f7f7e634
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000037de60a
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = e37204ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 3e16919f aefe00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 000000f8
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ee47e0d1 bf2f2299
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 94d9ce2c 213658e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = a4c6c247 9f39ee2d
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = e697de10 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ffff0000 fdbfc7eb
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = d5cf6cff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = d0eab90c ff0472e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 31 completed


p0_label_156:
!	%f17 = 037de6ff, Mem[0000000030001410] = 00000000
	sta	%f17,[%i0+%o5]0x89	! Mem[0000000030001410] = 037de6ff
!	%l1 = 00000000000000ff, Mem[0000000010141400] = 0000e37b
	stba	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000e3ff
!	%l6 = 00000000f7f7e634, Mem[0000000030041400] = f7f7e634
	stwa	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = f7f7e634
!	Mem[0000000030041410] = ff0000ff, %l4 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000020800040] = 72ffe589, %l7 = 00000000037de60a
	ldstub	[%o1+0x040],%l7		! %l7 = 00000072000000ff
!	%l0 = 0000000000000000, Mem[00000000300c1410] = ff000000
	stha	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%l4 = ff0000ff, %l5 = 000000ff, Mem[0000000030101408] = aefe00ff 3e16919f
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = ff0000ff 000000ff
!	%l6 = 00000000f7f7e634, Mem[0000000010081408] = bb1ed552
	stwa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = f7f7e634
!	%f14 = ffff0000, Mem[0000000010001410] = 00000000
	sta	%f14,[%i0+%o5]0x80	! Mem[0000000010001410] = ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff0ffeae, %l5 = f86ccfd5000000ff
	lduba	[%i6+%o5]0x81,%l5	! %l5 = 00000000000000ff

p0_label_157:
!	Mem[0000000030041410] = ff000000, %l5 = 00000000000000ff
	lduha	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = 000000001700006c, %l5 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l5	! %l5 = 000000001700006c
!	Mem[00000000100c1410] = 0000ffff, %l1 = 00000000000000ff
	lduha	[%i3+%o5]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010181408] = 00000000 03000000, %l0 = 00000000, %l1 = 0000ffff
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000 0000000003000000
!	Mem[0000000030101408] = ff0000ff, %f5  = 000000f8
	lda	[%i4+%o4]0x81,%f5 	! %f5 = ff0000ff
!	Mem[0000000030001410] = ffe67d03, %l2 = 0000000052f578f7
	lduwa	[%i0+%o5]0x81,%l2	! %l2 = 00000000ffe67d03
!	Mem[0000000030001400] = 26a9d40d2d000000, %f22 = 16a66f51 aefe0fc4
	ldda	[%i0+%g0]0x89,%f22	! %f22 = 26a9d40d 2d000000
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000030101400] = 00000000 ff0472e3 ff0000ff ff000000
!	Mem[0000000030101410] = ff000000 00000000 99222fbf d1e047ee
!	Mem[0000000030101420] = e3583621 2cced994 2dee399f 47c2c6a4
!	Mem[0000000030101430] = e3dfa430 a3429ce0 ebc7bffd d0a5e0d1
	ldda	[%i4]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030101400
!	Mem[0000000010001420] = de45fb04a1472f5e, %f4  = 00000000 ff0000ff
	ldda	[%i0+0x020]%asi,%f4 	! %f4  = de45fb04 a1472f5e
!	Starting 10 instruction Store Burst
!	%l6 = 00000000f7f7e634, Mem[0000000010001400] = 1700006c
	stba	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 17000034

p0_label_158:
!	Mem[0000000030041408] = ff000000, %l2 = 00000000ffe67d03
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 00000000ff000000
!	%f4  = de45fb04 a1472f5e, Mem[0000000030041410] = ff000000 00000000
	stda	%f4 ,[%i1+%o5]0x89	! Mem[0000000030041410] = de45fb04 a1472f5e
	membar	#Sync			! Added by membar checker (36)
!	%l2 = ff000000, %l3 = 00000000, Mem[0000000030101408] = ff0000ff ff000000
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000 00000000
!	Mem[0000000030081410] = 4d66023c, %l6 = 00000000f7f7e634
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 0000004d000000ff
!	%l7 = 0000000000000072, Mem[00000000201c0000] = ffffafd5
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 72ffafd5
!	%l7 = 0000000000000072, Mem[0000000030181408] = d5cf6cff
	stba	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = d5cf6c72
!	Mem[0000000010001432] = ff00213d, %l2 = 00000000ff000000
	ldstuba	[%i0+0x032]%asi,%l2	! %l2 = 00000021000000ff
!	%l4 = 00000000ff0000ff, Mem[00000000218000c1] = ff04cd54, %asi = 80
	stba	%l4,[%o3+0x0c1]%asi	! Mem[00000000218000c0] = ffffcd54
!	%l4 = 00000000ff0000ff, Mem[0000000010101400] = aefe0fc4
	stwa	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = efc001f10000ffff, %l5 = 000000001700006c
	ldxa	[%i3+%o5]0x88,%l5	! %l5 = efc001f10000ffff

p0_label_159:
!	Mem[0000000010001424] = a1472f5e, %f8  = 94d9ce2c
	lda	[%i0+0x024]%asi,%f8 	! %f8 = a1472f5e
!	Mem[0000000010141428] = 000000ffaefe0fc4, %l5 = efc001f10000ffff
	ldxa	[%i5+0x028]%asi,%l5	! %l5 = 000000ffaefe0fc4
!	Mem[0000000020800040] = ffffe589, %l2 = 0000000000000021
	ldsba	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101408] = 000000ff, %l3 = f800000000000000
	lduwa	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = ff0000970000b805, %f6  = ee47e0d1 bf2f2299
	ldda	[%i2+%g0]0x81,%f6 	! %f6  = ff000097 0000b805
!	Mem[0000000010181420] = a509aa5e, %l6 = 000000000000004d
	lduha	[%i6+0x020]%asi,%l6	! %l6 = 000000000000a509
!	Mem[0000000030181400] = ff000000, %l0 = 0000000000000000
	lduwa	[%i6+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030081400] = 970000ff, %l5 = 000000ffaefe0fc4
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001424] = a1472f5e, %l7 = 0000000000000072
	lduwa	[%i0+0x024]%asi,%l7	! %l7 = 00000000a1472f5e
!	Starting 10 instruction Store Burst
!	Mem[0000000010141420] = 000472e3, %l0 = ff000000, %l4 = ff0000ff
	add	%i5,0x20,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 00000000000472e3

p0_label_160:
!	%l5 = ffffffffffffffff, Mem[00000000300c1410] = 00000000
	stha	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000ffff
!	%l1 = 0000000003000000, Mem[0000000021800141] = 72ff9071
	stb	%l1,[%o3+0x141]		! Mem[0000000021800140] = 72009071
!	%l7 = 00000000a1472f5e, Mem[00000000201c0000] = 72ffafd5
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 2f5eafd5
!	%f14 = ffff0000 fdbfc7eb, Mem[0000000030101400] = 00000000 e37204ff
	stda	%f14,[%i4+%g0]0x89	! Mem[0000000030101400] = ffff0000 fdbfc7eb
!	%f17 = 00000000, Mem[0000000010001410] = ffff0000
	sta	%f17,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	Mem[00000000100c1408] = 783c0000, %l6 = 000000000000a509
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%f8  = a1472f5e, Mem[0000000010101400] = ff0000ff
	sta	%f8 ,[%i4+%g0]0x80	! Mem[0000000010101400] = a1472f5e
!	%l4 = 00000000000472e3, Mem[0000000010141400] = 000000000000e3ff
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000000472e3
!	%f28 = e09c42a3, Mem[00000000300c1408] = 037de6ff
	sta	%f28,[%i3+%o4]0x89	! Mem[00000000300c1408] = e09c42a3
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff003c78, %l3 = 00000000000000ff
	lduba	[%i3+%o4]0x80,%l3	! %l3 = 00000000000000ff

!	Check Point 32 for processor 0

	set	p0_check_pt_data_32,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000003000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000a1472f5e
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = e37204ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = de45fb04 a1472f5e
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff000097 0000b805
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = a1472f5e 213658e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = e37204ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 000000ff ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ee47e0d1 bf2f2299
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 94d9ce2c 213658e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = a4c6c247 9f39ee2d
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = e09c42a3 30a4dfe3
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = d1e0a5d0 fdbfc7eb
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 32 completed


p0_label_161:
!	Mem[0000000010081400] = ff000097, %l3 = 00000000000000ff
	ldsha	[%i2+%g0]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010141400] = e3720400, %l1 = 0000000003000000
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 000000000000e372
!	Mem[0000000030181408] = d5cf6c72, %l7 = 00000000a1472f5e
	lduha	[%i6+%o4]0x89,%l7	! %l7 = 0000000000006c72
!	Mem[0000000030141400] = ff000000 8ebde1ff, %l2 = ffffffff, %l3 = ffffff00
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000ff000000 000000008ebde1ff
!	Mem[0000000030101408] = ff000000, %l6 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[00000000218000c0] = ffffcd54, %l3 = 000000008ebde1ff
	ldsh	[%o3+0x0c0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010081400] = ff000097, %l1 = 000000000000e372
	ldsba	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1410] = efc001f10000ffff, %l5 = ffffffffffffffff
	ldxa	[%i3+%o5]0x88,%l5	! %l5 = efc001f10000ffff
!	Mem[0000000030101400] = ebc7bffd 0000ffff, %l4 = 000472e3, %l5 = 0000ffff
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 00000000ebc7bffd 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 970000ff, %l3 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 000000ff000000ff

p0_label_162:
!	Mem[0000000010181410] = f8000000, %l7 = 0000000000006c72
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 00000000f8000000
!	Mem[0000000010041400] = 34e67be3, %l0 = 00000000ff000000
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 0000000034e67be3
!	%l0 = 0000000034e67be3, Mem[000000001000142a] = 0000000a, %asi = 80
	stha	%l0,[%i0+0x02a]%asi	! Mem[0000000010001428] = 00007be3
!	Mem[0000000010141420] = 000472e3, %l4 = 00000000ebc7bffd
	swap	[%i5+0x020],%l4		! %l4 = 00000000000472e3
!	Mem[000000001004140d] = d5cf6cf8, %l0 = 0000000034e67be3
	ldstuba	[%i1+0x00d]%asi,%l0	! %l0 = 000000cf000000ff
!	Mem[000000001000143c] = bb5ee3d7, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x03c]%asi,%l3	! %l3 = 00000000bb5ee3d7
!	Mem[0000000020800040] = ffffe589, %l5 = 000000000000ffff
	ldstub	[%o1+0x040],%l5		! %l5 = 000000ff000000ff
!	%l6 = 00000000ff000000, Mem[0000000010081410] = 0000000000000000
	stxa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000ff000000
!	Mem[0000000021800141] = 72009071, %l7 = 00000000f8000000
	ldstuba	[%o3+0x141]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = f7f7e634037de60a, %l4 = 00000000000472e3
	ldxa	[%i1+%g0]0x81,%l4	! %l4 = f7f7e634037de60a

p0_label_163:
!	Mem[0000000010001400] = 0000000017000034, %f12 = e697de10 00000000
	ldda	[%i0+%g0]0x88,%f12	! %f12 = 00000000 17000034
!	Mem[0000000010141410] = 3d7bffff, %l2 = 00000000ff000000
	lduha	[%i5+%o5]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010001400] = 17000034, %l5 = 00000000000000ff
	ldsha	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000034
!	Mem[00000000300c1410] = 0000ffff, %l6 = 00000000ff000000
	ldswa	[%i3+%o5]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030101400] = ebc7bffd0000ffff, %f18 = 000000ff ff0000ff
	ldda	[%i4+%g0]0x81,%f18	! %f18 = ebc7bffd 0000ffff
!	Mem[0000000010081410] = 000000ff 00000000, %l0 = 000000cf, %l1 = ffffffff
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[0000000030081400] = 970000ff, %l3 = 00000000bb5ee3d7
	ldsha	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l3 = 00000000000000ff
	lduwa	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = ff66023c, %l4 = f7f7e634037de60a
	lduha	[%i2+%o5]0x81,%l4	! %l4 = 000000000000ff66
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000ffff, Mem[0000000010101400] = a1472f5e
	stha	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = ffff2f5e

p0_label_164:
!	%l1 = 00000000000000ff, Mem[0000000030081410] = 3c0266ff
	stwa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	%l3 = 0000000000000000, Mem[0000000030101408] = ff000000
	stwa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[0000000020800040] = ffffe589, %l1 = 00000000000000ff
	ldstuba	[%o1+0x040]%asi,%l1	! %l1 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000030001400] = 2d000000
	stba	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 2d000000
!	%l4 = 000000000000ff66, Mem[0000000010041400] = ffe67d03ff000000
	stxa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000000ff66
!	%l1 = 00000000000000ff, Mem[0000000010101410] = c96f6fff
	stba	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = c96f6fff
!	Mem[0000000010081408] = f7f7e634, %l1 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l1	! %l1 = 000000f7000000ff
!	%f14 = ffff0000, Mem[0000000010181424] = f7786cf8
	sta	%f14,[%i6+0x024]%asi	! Mem[0000000010181424] = ffff0000
!	Mem[00000000300c1400] = 00000000, %l6 = 000000000000ffff
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffffffff000000ff, %l5 = 0000000000000034
	ldxa	[%i2+%o5]0x89,%l5	! %l5 = ffffffff000000ff

p0_label_165:
!	Mem[0000000010101408] = ed3487ff f101c0ef, %l0 = 00000000, %l1 = 000000f7
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 00000000f101c0ef 00000000ed3487ff
!	Mem[0000000010001408] = 00ff9daa, %l1 = 00000000ed3487ff
	lduba	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = ff000097, %l6 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = ffffffffff000097
!	Mem[0000000030141400] = ff000000, %f8  = a1472f5e
	lda	[%i5+%g0]0x81,%f8 	! %f8 = ff000000
!	Mem[0000000010081428] = cb22a377aaeca280, %f8  = ff000000 213658e3
	ldda	[%i2+0x028]%asi,%f8 	! %f8  = cb22a377 aaeca280
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000010001400] = 34000017 00000000 00ff9daa 9f91163e
!	Mem[0000000010001410] = 00000000 000000f8 ff000000 000000ff
!	Mem[0000000010001420] = de45fb04 a1472f5e 00007be3 000000ff
!	Mem[0000000010001430] = ff00ff3d 2d0064b3 62ef3c78 000000ff
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Mem[0000000030041400] = f7f7e634037de60a, %l3 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l3	! %l3 = f7f7e634037de60a
!	Mem[0000000010181420] = a509aa5e, %l6 = ffffffffff000097
	lduha	[%i6+0x022]%asi,%l6	! %l6 = 000000000000aa5e
!	Mem[0000000010141438] = 77a322cb, %l1 = 0000000000000000
	lduba	[%i5+0x03b]%asi,%l1	! %l1 = 00000000000000cb
!	Starting 10 instruction Store Burst
!	%l3 = f7f7e634037de60a, Mem[00000000300c1410] = 0000ffff
	stba	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000ff0a

!	Check Point 33 for processor 0

	set	p0_check_pt_data_33,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000f101c0ef
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000cb
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = f7f7e634037de60a
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000ff66
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffff000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000000000aa5e
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 34000017 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00ff9daa 9f91163e
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 000000f8
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = de45fb04 a1472f5e
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00007be3 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ff00ff3d 2d0064b3
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 62ef3c78 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ebc7bffd 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1

!	Check Point 33 completed


p0_label_166:
!	%f20 = 00000000 000000ff, Mem[0000000010041420] = ffe67b3d 000000ff
	std	%f20,[%i1+0x020]	! Mem[0000000010041420] = 00000000 000000ff
!	%l0 = f101c0ef, %l1 = 000000cb, Mem[0000000010141400] = 000472e3 00000000
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = f101c0ef 000000cb
!	%l0 = 00000000f101c0ef, Mem[000000001014141b] = 5c844f40, %asi = 80
	stba	%l0,[%i5+0x01b]%asi	! Mem[0000000010141418] = 5c844fef
!	%l0 = 00000000f101c0ef, Mem[0000000020800040] = ffffe589
	sth	%l0,[%o1+0x040]		! Mem[0000000020800040] = c0efe589
!	%l7 = 0000000000000000, Mem[0000000030001410] = ffe67d03
	stwa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%l2 = 000000000000ffff, imm = 0000000000000783, %l5 = ffffffff000000ff
	and	%l2,0x783,%l5		! %l5 = 0000000000000783
	membar	#Sync			! Added by membar checker (38)
!	%l4 = 000000000000ff66, Mem[0000000010001410] = 00000000
	stha	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000ff66
!	Mem[00000000211c0000] = ffaae4d2, %l7 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	%l3 = f7f7e634037de60a, Mem[00000000100c1400] = 00000000
	stba	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0a000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 000000ff, %l5 = 0000000000000783
	ldswa	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000ff

p0_label_167:
!	Mem[0000000030101400] = fdbfc7eb, %f22 = ee47e0d1
	lda	[%i4+%g0]0x89,%f22	! %f22 = fdbfc7eb
!	Mem[0000000010181408] = 0000000300000000, %f6  = ff000000 000000ff
	ldda	[%i6+%o4]0x88,%f6 	! %f6  = 00000003 00000000
!	Mem[0000000010081400] = ff000097, %l4 = 000000000000ff66
	lduba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %f20 = 00000000
	lda	[%i5+%o4]0x88,%f20	! %f20 = 00000000
!	Mem[0000000010081428] = cb22a377aaeca280, %l5 = 00000000000000ff
	ldxa	[%i2+0x028]%asi,%l5	! %l5 = cb22a377aaeca280
!	Mem[0000000010041400] = 0000ff66, %l5 = cb22a377aaeca280
	ldswa	[%i1+%g0]0x88,%l5	! %l5 = 000000000000ff66
!	Mem[0000000030101400] = ffff0000 fdbfc7eb, %l6 = 0000aa5e, %l7 = 000000ff
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 00000000fdbfc7eb 00000000ffff0000
!	Mem[0000000030041408] = ffe67d03, %f0  = 34000017
	lda	[%i1+%o4]0x81,%f0 	! %f0 = ffe67d03
!	Mem[0000000010141410] = 3d7bffff, %l3 = f7f7e634037de60a
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041416] = ff04728d, %l2 = 000000000000ffff
	ldstub	[%i1+0x016],%l2		! %l2 = 00000072000000ff

p0_label_168:
!	%l4 = 00000000000000ff, Mem[00000000300c1408] = a3429ce0
	stha	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ff9ce0
!	%l3 = 000000000000ffff, Mem[00000000100c1408] = ff003c7834e67b3d
	stxa	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000000000ffff
!	Mem[0000000010181408] = 00000000, %l7 = 00000000ffff0000
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = ffff7b3d, %l0 = 00000000f101c0ef
	swap	[%i5+%o5],%l0		! %l0 = 00000000ffff7b3d
!	%l4 = 00000000000000ff, Mem[00000000300c1410] = 0aff0000
	stha	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ff0000
!	%l4 = 000000ff, %l5 = 0000ff66, Mem[0000000010141410] = f101c0ef 0000ff00
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff 0000ff66
!	%l6 = 00000000fdbfc7eb, Mem[0000000020800040] = c0efe589, %asi = 80
	stha	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = c7ebe589
!	%l0 = 00000000ffff7b3d, Mem[00000000100c1410] = 0000ffff
	stwa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffff7b3d
!	Mem[0000000010081410] = 00000000, %l6 = 00000000fdbfc7eb
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 000000ff, %l7 = 0000000000000000
	ldsba	[%i4+%o5]0x89,%l7	! %l7 = ffffffffffffffff

p0_label_169:
!	Mem[0000000030181408] = 726ccfd5, %l4 = 00000000000000ff
	lduba	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000072
!	Mem[0000000010041428] = 80a2ecaa, %l7 = ffffffffffffffff
	ldsba	[%i1+0x02b]%asi,%l7	! %l7 = ffffffffffffffaa
!	Mem[0000000010101418] = 000000ff, %l3 = 000000000000ffff
	ldsh	[%i4+0x018],%l3		! %l3 = 0000000000000000
!	Mem[0000000030041408] = ffe67d03, %l7 = ffffffffffffffaa
	lduha	[%i1+%o4]0x81,%l7	! %l7 = 000000000000ffe6
!	Mem[0000000010081410] = fdbfc7eb, %l7 = 000000000000ffe6
	ldswa	[%i2+%o5]0x80,%l7	! %l7 = fffffffffdbfc7eb
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = 000000ff, %f25 = 213658e3
	lda	[%i5+%g0]0x89,%f25	! %f25 = 000000ff
!	Mem[0000000030041400] = f7f7e634 037de60a ffe67d03 d5cf6cf8
!	Mem[0000000030041410] = 5e2f47a1 04fb45de 16a66f51 a7740b98
!	Mem[0000000030041420] = ffe67b3d f778f552 80a2ecaa 77a322cb
!	Mem[0000000030041430] = 35d3531a 3d7be6ff 74bd5edc 52d51ebb
	ldda	[%i1]ASI_BLK_AIUS,%f16	! Block Load from 0000000030041400
!	Mem[0000000030181410] = aefe0fff, %l6 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l6	! %l6 = ffffffffaefe0fff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00000000, %l6 = ffffffffaefe0fff
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000

p0_label_170:
!	%l5 = 000000000000ff66, immed = fffff0f0, %y  = 00000000
	sdiv	%l5,-0xf10,%l0		! %l0 = fffffffffffffff0
	mov	%l0,%y			! %y = fffffff0
!	Mem[0000000010141430] = ff000000, %l5 = 000000000000ff66, %asi = 80
	swapa	[%i5+0x030]%asi,%l5	! %l5 = 00000000ff000000
!	%l4 = 0000000000000072, Mem[0000000010041410] = 00000003ff04ff8d
	stxa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000072
!	%f15 = 000000ff, Mem[00000000100c1400] = 0a000000
	sta	%f15,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	%f6  = 00000003, Mem[0000000030081410] = 000000ff
	sta	%f6 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000003
!	%f10 = 00007be3 000000ff, %l3 = 0000000000000000
!	Mem[0000000010081438] = bb1ed552ffe67b3d
	add	%i2,0x038,%g1
	stda	%f10,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010081438] = bb1ed552ffe67b3d
!	Mem[0000000030001410] = 00000000, %l0 = fffffffffffffff0
	ldsba	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010081418] = 980b74a7516fa616, %asi = 80
	stxa	%l3,[%i2+0x018]%asi	! Mem[0000000010081418] = 0000000000000000
!	%f9  = a1472f5e, Mem[0000000010041408] = 000000ff
	sta	%f9 ,[%i1+%o4]0x88	! Mem[0000000010041408] = a1472f5e
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000ff, %l0 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000

!	Check Point 34 for processor 0

	set	p0_check_pt_data_34,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000072
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000072
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = fffffffffdbfc7eb
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ffe67d03 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000003 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = f7f7e634 037de60a
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x58],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ffe67d03 d5cf6cf8
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 5e2f47a1 04fb45de
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x68],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 16a66f51 a7740b98
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x70],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ffe67b3d f778f552
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x78],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 80a2ecaa 77a322cb
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x80],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 35d3531a 3d7be6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x88],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 74bd5edc 52d51ebb
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 34 completed


p0_label_171:
!	Mem[0000000030041400] = f7f7e634, %l6 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l6	! %l6 = 00000000000000f7
!	Mem[0000000010081408] = 34e6f7ff, %f29 = 3d7be6ff
	lda	[%i2+%o4]0x88,%f29	! %f29 = 34e6f7ff
!	Mem[0000000030101408] = 0000000000000000, %l5 = 00000000ff000000
	ldxa	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081418] = 00000000, %f4  = 00000000
	ld	[%i2+0x018],%f4 	! %f4 = 00000000
!	Mem[0000000010141408] = 00000000ff000000, %f20 = 5e2f47a1 04fb45de
	ldd	[%i5+%o4],%f20		! %f20 = 00000000 ff000000
!	Mem[0000000010181410] = 00006c72, %l0 = 0000000000000000
	lduwa	[%i6+%o5]0x80,%l0	! %l0 = 0000000000006c72
!	Mem[0000000010141400] = f101c0ef, %f11 = 000000ff
	lda	[%i5+%g0]0x88,%f11	! %f11 = f101c0ef
!	Mem[0000000010041400] = 66ff0000, %l6 = 00000000000000f7
	lduha	[%i1+%g0]0x80,%l6	! %l6 = 00000000000066ff
!	Mem[00000000300c1408] = 00ff9ce0, %l0 = 0000000000006c72
	lduba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = efc001f1, %l4 = 0000000000000072
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000efc001f1

p0_label_172:
!	%l6 = 00000000000066ff, Mem[00000000100c1410] = 3d7bffff
	stwa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000066ff
!	Mem[0000000010101424] = 8ebde12c, %l6 = 00000000000066ff, %asi = 80
	swapa	[%i4+0x024]%asi,%l6	! %l6 = 000000008ebde12c
!	Mem[0000000030141410] = f8000000, %l7 = fffffffffdbfc7eb
	ldstuba	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%f14 = 62ef3c78 000000ff, Mem[0000000010181408] = 000000ff 00000003
	stda	%f14,[%i6+%o4]0x88	! Mem[0000000010181408] = 62ef3c78 000000ff
!	Mem[0000000030001400] = 2d000000, %l2 = 0000000000000072
	swapa	[%i0+%g0]0x89,%l2	! %l2 = 000000002d000000
!	Mem[0000000030041408] = ffe67d03, %l7 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000300c1410] = 0000ff00, %l5 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001400] = 34000017, %l4 = 00000000efc001f1
	swap	[%i0+%g0],%l4		! %l4 = 0000000034000017
!	%l6 = 8ebde12c, %l7 = 000000ff, Mem[00000000300c1408] = 00ff9ce0 00000000
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 8ebde12c 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l1 = 00000000000000cb
	lduha	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_173:
!	Mem[0000000030181408] = d5cf6c72, %l4 = 0000000034000017
	ldsha	[%i6+%o4]0x89,%l4	! %l4 = 0000000000006c72
!	Mem[0000000010141410] = ff000000, %l3 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001418] = ff000000, %l7 = 00000000000000ff
	lduba	[%i0+0x019]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = f80000ff, %l0 = 0000000000000000
	ldswa	[%i5+%o5]0x89,%l0	! %l0 = fffffffff80000ff
!	Code Fragment 4
p0_fragment_6:
!	%l0 = fffffffff80000ff
	setx	0xfbc11e700bacba22,%g7,%l0 ! %l0 = fbc11e700bacba22
!	%l1 = 0000000000000000
	setx	0x321c1fcfa11c2547,%g7,%l1 ! %l1 = 321c1fcfa11c2547
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fbc11e700bacba22
	setx	0x7f072f78459ad3fd,%g7,%l0 ! %l0 = 7f072f78459ad3fd
!	%l1 = 321c1fcfa11c2547
	setx	0x5f42441001968f39,%g7,%l1 ! %l1 = 5f42441001968f39
!	Mem[0000000010141430] = 0000ff66 000000ff, %l2 = 2d000000, %l3 = 00000000
	ldda	[%i5+0x030]%asi,%l2	! %l2 = 000000000000ff66 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010101430] = 28e3c8f79ff26985
	stx	%l5,[%i4+0x030]		! Mem[0000000010101430] = 0000000000000000
!	Mem[0000000010041400] = 66ff0000, %l0 = 7f072f78459ad3fd
	ldsha	[%i1+%g0]0x80,%l0	! %l0 = 00000000000066ff
!	Mem[0000000030141400] = ff000000, %l2 = 000000000000ff66
	ldswa	[%i5+%g0]0x81,%l2	! %l2 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 72000000, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 0000000072000000

p0_label_174:
!	%l2 = ff000000, %l3 = 000000ff, Mem[00000000100c1408] = 00000000 0000ffff
	std	%l2,[%i3+%o4]		! Mem[00000000100c1408] = ff000000 000000ff
!	%l1 = 5f42441001968f39, Mem[00000000300c1408] = ff0000002ce1bd8e
	stxa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 5f42441001968f39
!	%l1 = 5f42441001968f39, Mem[0000000030001410] = 00000000
	stba	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = 39000000
!	Mem[0000000030101410] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010041408] = 5e2f47a1d5ff6cf8, %l7 = 0000000072000000, %l1 = 5f42441001968f39
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = 5e2f47a1d5ff6cf8
!	Mem[0000000030181400] = 000000ff, %l0 = 00000000000066ff
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	%l4 = 0000000000006c72, Mem[00000000211c0001] = ffaae4d2
	stb	%l4,[%o2+0x001]		! Mem[00000000211c0000] = ff72e4d2
!	%l2 = ffffffffff000000, Mem[00000000100c1408] = ff000000
	stwa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff000000
!	%l1 = 5e2f47a1d5ff6cf8, Mem[0000000020800041] = c7ebe589, %asi = 80
	stba	%l1,[%o1+0x041]%asi	! Mem[0000000020800040] = c7f8e589
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = c96f6fff, %l4 = 0000000000006c72
	ldsba	[%i4+%o5]0x88,%l4	! %l4 = ffffffffffffffff

p0_label_175:
!	Mem[0000000010001400] = efc001f100000000, %f8  = de45fb04 a1472f5e
	ldda	[%i0+%g0]0x80,%f8 	! %f8  = efc001f1 00000000
!	Mem[0000000010041410] = 00000000, %l1 = 5e2f47a1d5ff6cf8
	lduwa	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1418] = 3317a600, %l1 = 0000000000000000
	lduh	[%i3+0x018],%l1		! %l1 = 0000000000003317
!	Mem[0000000010041428] = 80a2ecaa77a322cb, %l3 = 00000000000000ff
	ldx	[%i1+0x028],%l3		! %l3 = 80a2ecaa77a322cb
!	Mem[0000000010081418] = 0000000000000000, %f8  = efc001f1 00000000
	ldd	[%i2+0x018],%f8 	! %f8  = 00000000 00000000
!	Mem[0000000030001400] = 00000000, %f11 = f101c0ef
	lda	[%i0+%g0]0x89,%f11	! %f11 = 00000000
!	Mem[0000000010041400] = 000000000000ff66, %l1 = 0000000000003317
	ldxa	[%i1+%g0]0x88,%l1	! %l1 = 000000000000ff66
!	Mem[0000000010101408] = 00000072ff8734ed, %f6  = 00000003 00000000
	ldda	[%i4+%o4]0x80,%f6 	! %f6  = 00000072 ff8734ed
!	Mem[00000000300c1410] = ffff0000, %l1 = 000000000000ff66
	lduwa	[%i3+%o5]0x81,%l1	! %l1 = 00000000ffff0000
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffff0000, Mem[0000000030001410] = 3900000010de97e6
	stxa	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000ffff0000

!	Check Point 35 for processor 0

	set	p0_check_pt_data_35,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ffff0000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffff000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 80a2ecaa77a322cb
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000008ebde12c
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000072000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00ff9daa 9f91163e
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 000000f8
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000072 ff8734ed
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00007be3 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 35d3531a 34e6f7ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 35 completed


p0_label_176:
!	%l4 = ffffffffffffffff, Mem[00000000100c141f] = 52529726, %asi = 80
	stba	%l4,[%i3+0x01f]%asi	! Mem[00000000100c141c] = 525297ff
!	%l0 = 00000000000000ff, Mem[00000000300c1400] = 0000ffff
	stwa	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	Mem[0000000010041408] = a1472f5e, %l3 = 80a2ecaa77a322cb
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 0000005e000000ff
!	%l2 = ffffffffff000000, Mem[0000000010081408] = 34e6f7ff
	stba	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 34e6f700
!	%f6  = 00000072, Mem[0000000030081400] = 970000ff
	sta	%f6 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000072
!	%l0 = 00000000000000ff, Mem[000000001014142a] = 000000ff, %asi = 80
	stha	%l0,[%i5+0x02a]%asi	! Mem[0000000010141428] = 000000ff
!	%f28 = 35d3531a 34e6f7ff, Mem[0000000030081408] = ff0ffeae 52d51ebb
	stda	%f28,[%i2+%o4]0x81	! Mem[0000000030081408] = 35d3531a 34e6f7ff
!	%f16 = f7f7e634 037de60a ffe67d03 d5cf6cf8
!	%f20 = 00000000 ff000000 16a66f51 a7740b98
!	%f24 = ffe67b3d f778f552 80a2ecaa 77a322cb
!	%f28 = 35d3531a 34e6f7ff 74bd5edc 52d51ebb
	stda	%f16,[%i5]ASI_BLK_P	! Block Store to 0000000010141400
!	Mem[00000000300c1400] = ff000000, %l7 = 0000000072000000
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ebc7bffd, %l3 = 000000000000005e
	ldsba	[%i4+%g0]0x81,%l3	! %l3 = ffffffffffffffeb

p0_label_177:
!	Mem[0000000010001400] = f101c0ef, %l1 = 00000000ffff0000
	ldsha	[%i0+%g0]0x88,%l1	! %l1 = ffffffffffffc0ef
!	Mem[0000000030181410] = aefe0fff, %l1 = ffffffffffffc0ef
	ldsba	[%i6+%o5]0x89,%l1	! %l1 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (39)
!	Mem[00000000300c1400] = 72000000 00000000 398f9601 1044425f
!	Mem[00000000300c1410] = ffff0000 17000000 00000000 00000097
!	Mem[00000000300c1420] = ed34871b 037de60a e3720000 40625eff
!	Mem[00000000300c1430] = 8fbbc3a2 ff72c64a d0eab90c daa49daa
	ldda	[%i3]ASI_BLK_SL,%f0	! Block Load from 00000000300c1400
!	Mem[00000000218001c0] = 6bf39ea8, %l2 = ffffffffff000000
	lduba	[%o3+0x1c1]%asi,%l2	! %l2 = 00000000000000f3
!	Mem[0000000030041410] = 5e2f47a1, %l6 = 000000008ebde12c
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = 0000000000005e2f
!	Mem[0000000030041408] = ffe67d03, %l3 = ffffffffffffffeb
	lduwa	[%i1+%o4]0x81,%l3	! %l3 = 00000000ffe67d03
!	Mem[00000000211c0000] = ff72e4d2, %l7 = 00000000ff000000
	lduh	[%o2+%g0],%l7		! %l7 = 000000000000ff72
!	Mem[0000000030141408] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = 72000000, %l5 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800001] = f2ffed58, %l0 = 00000000000000ff
	ldstuba	[%o3+0x001]%asi,%l0	! %l0 = 000000ff000000ff

p0_label_178:
!	%f16 = f7f7e634 037de60a, %l7 = 000000000000ff72
!	Mem[0000000030081438] = 3e0000001b8734ed
	add	%i2,0x038,%g1
	stda	%f16,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030081438] = 3e00000034e6f7f7
!	Mem[0000000010101413] = ff6f6fc9, %l6 = 0000000000005e2f
	ldstub	[%i4+0x013],%l6		! %l6 = 000000c9000000ff
!	%l6 = 00000000000000c9, Mem[0000000010001400] = f101c0ef
	stwa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000c9
!	%f22 = 16a66f51, Mem[0000000010001400] = c9000000
	sta	%f22,[%i0+%g0]0x80	! Mem[0000000010001400] = 16a66f51
!	%f20 = 00000000 ff000000, Mem[00000000100c1410] = 000066ff f101c0ef
	stda	%f20,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 ff000000
!	%l0 = 000000ff, %l1 = ffffffff, Mem[0000000030041408] = ffe67d03 d5cf6cf8
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff ffffffff
!	%l3 = 00000000ffe67d03, Mem[0000000030041400] = 34e6f7f7
	stha	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 34e67d03
!	%l1 = ffffffffffffffff, Mem[0000000010141400] = 0ae67d0334e6f7f7
	stxa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffffffffffff
!	Mem[0000000010041408] = a1472fff, %l1 = ffffffffffffffff
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 00000000a1472fff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000, %l1 = 00000000a1472fff
	lduha	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000

p0_label_179:
!	Mem[0000000030141410] = ff0000f8, %f31 = 52d51ebb
	lda	[%i5+%o5]0x81,%f31	! %f31 = ff0000f8
!	Mem[00000000201c0000] = 2f5eafd5, %l1 = 0000000000000000
	ldsh	[%o0+%g0],%l1		! %l1 = 0000000000002f5e
!	Mem[0000000010101410] = ff6f6fff, %l0 = 00000000000000ff
	ldsba	[%i4+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001410] = 00000000, %l7 = 000000000000ff72
	lduba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = c9ffbb34, %l3 = 00000000ffe67d03
	lduh	[%o1+%g0],%l3		! %l3 = 000000000000c9ff
!	Mem[0000000010101408] = 00000072, %l4 = ffffffffffffffff
	ldsba	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = 00ff9daa, %l5 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101408] = 72000000, %l1 = 0000000000002f5e
	ldsha	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = ebc7bffd, %l3 = 000000000000c9ff
	ldswa	[%i2+%o5]0x88,%l3	! %l3 = ffffffffebc7bffd
!	Starting 10 instruction Store Burst
!	%f24 = ffe67b3d f778f552, Mem[0000000030181410] = aefe0fff 000000ff
	stda	%f24,[%i6+%o5]0x89	! Mem[0000000030181410] = ffe67b3d f778f552

p0_label_180:
!	%l0 = ffffffffffffffff, Mem[0000000030181400] = ff000000
	stha	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = ffff0000
!	%l5 = 00000000000000ff, Mem[0000000030081408] = 35d3531a34e6f7ff
	stxa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000000ff
!	Mem[00000000300c1400] = 00000072, %l0 = ffffffffffffffff
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000072
!	%l5 = 00000000000000ff, Mem[0000000010081408] = 00f7e634ffe67b3d
	stxa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000030041408] = ff000000
	stha	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = ff0000ff
!	%l3 = ffffffffebc7bffd, Mem[0000000030141410] = ff0000f88ffe275d
	stxa	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffffebc7bffd
!	%l0 = 00000072, %l1 = 00000000, Mem[0000000030181408] = d5cf6c72 03000000
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000072 00000000
	membar	#Sync			! Added by membar checker (40)
!	%l0 = 0000000000000072, Mem[00000000300c1410] = ffff0000
	stba	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 72ff0000
!	Mem[00000000100c1404] = 970000ff, %l3 = ffffffffebc7bffd
	swap	[%i3+0x004],%l3		! %l3 = 00000000970000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 52f578f7 3d7be6ff, %l6 = 000000c9, %l7 = 00000000
	ldda	[%i2+0x020]%asi,%l6	! %l6 = 0000000052f578f7 000000003d7be6ff

!	Check Point 36 for processor 0

	set	p0_check_pt_data_36,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000072
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000f3
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000970000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000052f578f7
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000003d7be6ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 00000072
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 5f424410 01968f39
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000017 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 97000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 0ae67d03 1b8734ed
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff5e6240 000072e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 4ac672ff a2c3bb8f
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = aa9da4da 0cb9ead0
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 74bd5edc ff0000f8
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 36 completed


p0_label_181:
!	Mem[0000000010001408] = 00ff9daa, %l4 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l1 = 0000000000000000
	ldswa	[%i2+0x008]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041400] = 0ae67d03 34e67d03, %l6 = 52f578f7, %l7 = 3d7be6ff
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 0000000034e67d03 000000000ae67d03
!	Mem[0000000030081408] = 00000000, %l4 = 00000000000000ff
	lduba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%f16 = f7f7e634, %f30 = 74bd5edc
	fitos	%f16,%f30		! %f30 = cd00819d
!	Mem[0000000030041410] = 5e2f47a1, %l7 = 000000000ae67d03
	lduha	[%i1+%o5]0x81,%l7	! %l7 = 0000000000005e2f
!	Mem[0000000010041410] = 0000000000000072, %f12 = 4ac672ff a2c3bb8f
	ldda	[%i1+0x010]%asi,%f12	! %f12 = 00000000 00000072
!	Mem[0000000010081434] = 000000f8, %l3 = 00000000970000ff
	lduwa	[%i2+0x034]%asi,%l3	! %l3 = 00000000000000f8
!	Mem[0000000010101400] = ffff2f5e, %l3 = 00000000000000f8
	lduha	[%i4+%g0]0x80,%l3	! %l3 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000034e67d03, Mem[0000000030101408] = 00000000
	stba	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 03000000

p0_label_182:
!	Mem[00000000100c1408] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	%f25 = f778f552, Mem[0000000030181410] = f778f552
	sta	%f25,[%i6+%o5]0x89	! Mem[0000000030181410] = f778f552
!	Mem[0000000010101408] = 72000000, %l2 = 00000000000000f3
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081410] = 03000000, %l7 = 0000000000005e2f
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 00000003000000ff
!	%l6 = 0000000034e67d03, Mem[00000000201c0001] = 2f5eafd5
	stb	%l6,[%o0+0x001]		! Mem[00000000201c0000] = 2f03afd5
!	%f28 = 35d3531a 34e6f7ff, %l5 = 00000000000000ff
!	Mem[0000000030181428] = 204f38ce2e73f908
	add	%i6,0x028,%g1
	stda	%f28,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030181428] = fff7e6341a53d335
!	%l4 = 0000000000000000, Mem[0000000030081410] = ff000000ffffffff
	stxa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	%l0 = 0000000000000072, Mem[00000000100c1408] = 000000ff
	stba	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000072
!	Mem[0000000010181410] = 00006c72, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff0000970000002d, %l5 = 00000000000000ff
	ldxa	[%i2+%g0]0x80,%l5	! %l5 = ff0000970000002d

p0_label_183:
!	Mem[0000000010081410] = ebc7bffd, %l6 = 0000000034e67d03
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 000000000000bffd
!	Mem[0000000021800000] = f2ffed58, %l1 = 0000000000000000
	ldsb	[%o3+%g0],%l1		! %l1 = fffffffffffffff2
!	Mem[0000000010041408] = ffffffff, %l3 = 000000000000ffff
	lduba	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l6 = 000000000000bffd
	lduba	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l5 = ff0000970000002d
	ldswa	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141438] = 74bd5edc 52d51ebb, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i5+0x038]%asi,%l2	! %l2 = 0000000074bd5edc 0000000052d51ebb
!	Mem[0000000030081410] = 0000000000000000, %f26 = 80a2ecaa 77a322cb
	ldda	[%i2+%o5]0x89,%f26	! %f26 = 00000000 00000000
!	Mem[0000000020800040] = c7f8e589, %l4 = 0000000000000000
	ldsba	[%o1+0x040]%asi,%l4	! %l4 = ffffffffffffffc7
!	Mem[0000000010001400] = 516fa616, %l2 = 0000000074bd5edc
	ldswa	[%i0+%g0]0x88,%l2	! %l2 = 00000000516fa616
!	Starting 10 instruction Store Burst
!	%l2 = 00000000516fa616, Mem[0000000010041418] = 16a66f51a7740b98
	stx	%l2,[%i1+0x018]		! Mem[0000000010041418] = 00000000516fa616

p0_label_184:
!	Mem[0000000030101408] = 00000003, %l2 = 00000000516fa616
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000003
!	%l6 = 00000000, %l7 = 00000003, Mem[0000000030181400] = ffff0000 00000000
	stda	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 00000003
!	Mem[0000000010141408] = ffe67d03, %l0 = 0000000000000072
	ldstuba	[%i5+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010081408] = 00000000, %l5 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = f778f552, %l6 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 00000000f778f552
!	%l5 = 0000000000000000, Mem[0000000010141408] = ffe67d03d5cf6cf8
	stxa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000000
!	%l4 = ffffffc7, %l5 = 00000000, Mem[0000000010181410] = ff006c72 00000000
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffc7 00000000
!	%f10 = ff5e6240, Mem[000000001014143c] = 52d51ebb
	st	%f10,[%i5+0x03c]	! Mem[000000001014143c] = ff5e6240
!	Mem[0000000010101408] = 720000ff, %l4 = ffffffffffffffc7
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 000000ff00000000, %l5 = 0000000000000000
	ldxa	[%i5+%o4]0x89,%l5	! %l5 = 000000ff00000000

p0_label_185:
!	Mem[0000000030041400] = 34e67d03, %l5 = 000000ff00000000
	lduwa	[%i1+%g0]0x89,%l5	! %l5 = 0000000034e67d03
!	Mem[00000000300c1400] = ffffffff, %l3 = 0000000052d51ebb
	lduba	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041410] = 7200000000000000, %l5 = 0000000034e67d03
	ldxa	[%i1+%o5]0x88,%l5	! %l5 = 7200000000000000
!	Mem[0000000030101400] = fdbfc7eb, %f27 = 00000000
	lda	[%i4+%g0]0x89,%f27	! %f27 = fdbfc7eb
!	Mem[0000000010101408] = ed3487ff720000ff, %l4 = 00000000000000ff
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = ed3487ff720000ff
!	Mem[0000000030041410] = a1472f5e, %l7 = 0000000000000003
	lduwa	[%i1+%o5]0x89,%l7	! %l7 = 00000000a1472f5e
!	Mem[0000000030181400] = 00000000, %f29 = 34e6f7ff
	lda	[%i6+%g0]0x81,%f29	! %f29 = 00000000
!	Mem[0000000010081408] = ff00000000000000, %l2 = 0000000000000003
	ldxa	[%i2+%o4]0x88,%l2	! %l2 = ff00000000000000
!	Mem[0000000010181408] = 000000ff, %l0 = 00000000000000ff
	ldsba	[%i6+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = ff00000000000000, Mem[0000000010141408] = 00000000
	stha	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000

!	Check Point 37 for processor 0

	set	p0_check_pt_data_37,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = fffffffffffffff2
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ff00000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ed3487ff720000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 7200000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000f778f552
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000a1472f5e
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 5f424410 01968f39
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 97000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 00000072
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 fdbfc7eb
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x68],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 35d3531a 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x70],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = cd00819d ff0000f8
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 37 completed


p0_label_186:
!	%l4 = ed3487ff720000ff, Mem[0000000010041410] = 00000000
	stba	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	%l0 = ffffffffffffffff, Mem[0000000030001408] = 000000ffff0ffeae
	stxa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffffffffffff
!	%l5 = 7200000000000000, Mem[0000000030101408] = 16a66f51
	stba	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 00a66f51
!	%l4 = ed3487ff720000ff, Mem[0000000030141410] = fdbfc7ebffffffff
	stxa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = ed3487ff720000ff
!	%f10 = ff5e6240 000072e3, Mem[0000000010081408] = 00000000 000000ff
	stda	%f10,[%i2+%o4]0x80	! Mem[0000000010081408] = ff5e6240 000072e3
!	Mem[00000000100c1431] = 00000000, %l5 = 7200000000000000
	ldstuba	[%i3+0x031]%asi,%l5	! %l5 = 00000000000000ff
!	%f10 = ff5e6240 000072e3, Mem[0000000030141408] = 00000000 ff000000
	stda	%f10,[%i5+%o4]0x81	! Mem[0000000030141408] = ff5e6240 000072e3
!	Mem[0000000010181430] = 709c90ff, %l0 = ffffffffffffffff, %asi = 80
	swapa	[%i6+0x030]%asi,%l0	! %l0 = 00000000709c90ff
!	Mem[0000000010141400] = ffffffff, %l3 = 00000000000000ff
	lduha	[%i5+%g0]0x88,%l3	! %l3 = 000000000000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff5e6240, %l3 = 000000000000ffff
	ldsha	[%i5+%o4]0x81,%l3	! %l3 = ffffffffffffff5e

p0_label_187:
!	Mem[0000000010081410] = fdbfc7eb, %l4 = ed3487ff720000ff
	lduba	[%i2+%o5]0x80,%l4	! %l4 = 00000000000000fd
!	Mem[0000000010041400] = 66ff0000, %l6 = 00000000f778f552
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = 0000000066ff0000
!	Mem[0000000021800100] = 97ff0ae8, %l7 = 00000000a1472f5e
	lduh	[%o3+0x100],%l7		! %l7 = 00000000000097ff
!	Mem[0000000010041400] = 0000ff66, %l7 = 00000000000097ff
	lduba	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000066
!	Mem[0000000010181408] = ff000000, %l5 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l5	! %l5 = ffffffffff000000
!	Mem[0000000030001408] = ffffffff, %f7  = 00000000
	lda	[%i0+%o4]0x89,%f7 	! %f7 = ffffffff
!	Mem[0000000030001408] = ffffffffffffffff, %f16 = f7f7e634 037de60a
	ldda	[%i0+%o4]0x89,%f16	! %f16 = ffffffff ffffffff
!	Mem[0000000030001400] = 00000000, %l1 = fffffffffffffff2
	lduha	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = c7ffffff, %l0 = 00000000709c90ff
	ldswa	[%i6+%o5]0x88,%l0	! %l0 = ffffffffc7ffffff
!	Starting 10 instruction Store Burst
!	%f14 = aa9da4da 0cb9ead0, Mem[0000000030101408] = 00a66f51 00000000
	stda	%f14,[%i4+%o4]0x81	! Mem[0000000030101408] = aa9da4da 0cb9ead0

p0_label_188:
!	Mem[0000000010041424] = 000000ff, %l7 = 0000000000000066
	swap	[%i1+0x024],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010101408] = ff000072, %l4 = 00000000000000fd
	swap	[%i4+%o4],%l4		! %l4 = 00000000ff000072
!	%l3 = ffffffffffffff5e, Mem[0000000030081408] = 00000000
	stha	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = ff5e0000
!	%f20 = 00000000 ff000000, Mem[0000000010041408] = ffffffff f86cffd5
	stda	%f20,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 ff000000
!	%l6 = 0000000066ff0000, Mem[0000000010001408] = 00ff9daa
	stha	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 00009daa
!	%l7 = 00000000000000ff, Mem[0000000010101410] = ff6f6fff
	stha	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = ff6f00ff
!	%l1 = 0000000000000000, Mem[0000000010181408] = 62ef3c78000000ff
	stxa	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000000000000
!	Mem[00000000201c0000] = 2f03afd5, %l2 = ff00000000000000
	ldstub	[%o0+%g0],%l2		! %l2 = 0000002f000000ff
!	Mem[0000000030141408] = ff5e6240, %l2 = 000000000000002f
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00009daa9f91163e, %l4 = 00000000ff000072
	ldxa	[%i0+%o4]0x80,%l4	! %l4 = 00009daa9f91163e

p0_label_189:
!	Mem[0000000030041410] = a1472f5e, %l1 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l1	! %l1 = 000000000000005e
!	%l5 = ffffffffff000000, Mem[00000000300c1400] = ffffffff
	stha	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000ffff
!	Mem[0000000010181408] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 970000ff, %l6 = 0000000066ff0000
	lduwa	[%i2+%g0]0x88,%l6	! %l6 = 00000000970000ff
!	Mem[0000000010141400] = ffffffff, %l2 = 00000000000000ff
	lduha	[%i5+%g0]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010141424] = f778f552, %l4 = 00009daa9f91163e
	ldsb	[%i5+0x025],%l4		! %l4 = 0000000000000078
!	Mem[0000000010141418] = 16a66f51a7740b98, %f0  = 00000000 00000072
	ldda	[%i5+0x018]%asi,%f0 	! %f0  = 16a66f51 a7740b98
!	Mem[0000000030081400] = 72000000, %l6 = 00000000970000ff
	ldsba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000072
!	Mem[0000000030001400] = 00000000, %l7 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[000000001000142c] = 000000ff
	stw	%l7,[%i0+0x02c]		! Mem[000000001000142c] = 00000000

p0_label_190:
!	Mem[0000000010101408] = 000000fd, %l1 = 000000000000005e
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000201c0001] = ff03afd5, %l4 = 0000000000000078
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 00000003000000ff
!	Mem[0000000030141410] = ff000072, %l6 = 0000000000000072
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Code Fragment 3
p0_fragment_7:
!	%l0 = ffffffffc7ffffff
	setx	0x1678489fd9710172,%g7,%l0 ! %l0 = 1678489fd9710172
!	%l1 = 0000000000000000
	setx	0x6c7eca6809c5e73a,%g7,%l1 ! %l1 = 6c7eca6809c5e73a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1678489fd9710172
	setx	0x19dfd3e0041a6d32,%g7,%l0 ! %l0 = 19dfd3e0041a6d32
!	%l1 = 6c7eca6809c5e73a
	setx	0x6a0e9b70111c2b94,%g7,%l1 ! %l1 = 6a0e9b70111c2b94
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000030001410] = 00000000 0000ffff
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff 00000000
!	%f18 = ffe67d03 d5cf6cf8, Mem[00000000300c1400] = ffff0000 00000000
	stda	%f18,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffe67d03 d5cf6cf8
!	%f14 = aa9da4da 0cb9ead0, %l4 = 0000000000000003
!	Mem[00000000300c1428] = e372000040625eff
	add	%i3,0x028,%g1
	stda	%f14,[%g1+%l4]ASI_PST8_SL ! Mem[00000000300c1428] = d0ea000040625eff
!	%l1 = 6a0e9b70111c2b94, Mem[0000000030141410] = ff000072
	stba	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 94000072
!	%f8  = 0ae67d03, Mem[0000000030101400] = fdbfc7eb
	sta	%f8 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 0ae67d03
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 72000000, %l1 = 6a0e9b70111c2b94
	lduba	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000072

!	Check Point 38 for processor 0

	set	p0_check_pt_data_38,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 19dfd3e0041a6d32
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000072
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffff5e
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000003
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffff000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 16a66f51 a7740b98
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 97000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffffffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1

!	Check Point 38 completed


p0_label_191:
!	Mem[0000000030001410] = ff000000, %l4 = 0000000000000003
	ldsha	[%i0+%o5]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010001400] = 516fa616, %f12 = 00000000
	lda	[%i0+%g0]0x88,%f12	! %f12 = 516fa616
!	Mem[00000000211c0000] = ff72e4d2, %l3 = ffffffffffffff5e
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ff72
!	Mem[0000000010181408] = 00000000, %l5 = ffffffffff000000
	lduwa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l4 = ffffffffffffff00
	lduwa	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff00000000, %f26 = 00000000 fdbfc7eb
	ldda	[%i3+%o5]0x88,%f26	! %f26 = 000000ff 00000000
!	Mem[0000000010141400] = ffffffff, %l6 = 00000000000000ff
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101408] = ed3487ff fd0000ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 00000000fd0000ff 00000000ed3487ff
!	Mem[0000000030101410] = 000000ff, %l4 = 00000000fd0000ff
	ldsha	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000ffff, Mem[0000000020800040] = c7f8e589
	sth	%l2,[%o1+0x040]		! Mem[0000000020800040] = ffffe589

p0_label_192:
!	%f10 = ff5e6240, Mem[0000000030041410] = 5e2f47a1
	sta	%f10,[%i1+%o5]0x81	! Mem[0000000030041410] = ff5e6240
!	%l0 = 19dfd3e0041a6d32, Mem[0000000010081400] = 970000ff
	stwa	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 041a6d32
!	Mem[0000000010081410] = fdbfc7ebff000000, %l6 = ffffffffffffffff, %l1 = 0000000000000072
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = fdbfc7ebff000000
!	%f12 = 516fa616, Mem[0000000030041410] = 40625eff
	sta	%f12,[%i1+%o5]0x89	! Mem[0000000030041410] = 516fa616
!	%l1 = fdbfc7ebff000000, Mem[000000001014143c] = ff5e6240, %asi = 80
	stwa	%l1,[%i5+0x03c]%asi	! Mem[000000001014143c] = ff000000
!	Mem[0000000030141408] = ff5e6240, %l2 = 000000000000ffff
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	%l0 = 19dfd3e0041a6d32, Mem[0000000010181400] = 34e67b3d000000e3
	stxa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 19dfd3e0041a6d32
!	%f0  = 16a66f51 a7740b98 5f424410 01968f39
!	%f4  = 00000017 0000ffff 97000000 ffffffff
!	%f8  = 0ae67d03 1b8734ed ff5e6240 000072e3
!	%f12 = 516fa616 00000072 aa9da4da 0cb9ead0
	stda	%f0,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	%f28 = 35d3531a, Mem[00000000300c1408] = 01968f39
	sta	%f28,[%i3+%o4]0x89	! Mem[00000000300c1408] = 35d3531a
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = aa9d0000, %l2 = 00000000000000ff
	ldsha	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000

p0_label_193:
!	Mem[0000000030081410] = 00000000, %l5 = 00000000ed3487ff
	lduha	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = ffffffc700000000, %f30 = cd00819d ff0000f8
	ldda	[%i6+%o5]0x80,%f30	! %f30 = ffffffc7 00000000
!	Mem[0000000030101408] = aa9da4da, %l7 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l7	! %l7 = 000000000000aa9d
!	Mem[0000000010181400] = 19dfd3e0, %l6 = ffffffffffffffff
	ldsha	[%i6+%g0]0x80,%l6	! %l6 = 00000000000019df
!	Mem[00000000100c1400] = 000000ff, %l5 = 0000000000000000
	lduwa	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = 00000072, %l5 = 00000000000000ff
	lduba	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000072
!	Mem[00000000300c1400] = f86ccfd5, %l0 = 19dfd3e0041a6d32
	lduwa	[%i3+%g0]0x81,%l0	! %l0 = 00000000f86ccfd5
!	Mem[00000000300c1410] = 000000170000ff72, %f28 = 35d3531a 00000000
	ldda	[%i3+%o5]0x89,%f28	! %f28 = 00000017 0000ff72
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000030141410] = 0000ffff, %l4 = 00000000000000ff
	ldsba	[%i5+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 0000ff72, %l7 = 000000000000aa9d
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 000000000000ff72

p0_label_194:
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = 326d1a04, %l3 = 000000000000ff72
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 00000032000000ff
!	%l3 = 0000000000000032, Mem[0000000010141400] = ffffffff
	stwa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000032
!	%f28 = 00000017, Mem[0000000030101410] = 000000ff
	sta	%f28,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000017
!	%l0 = 00000000f86ccfd5, Mem[000000001000141a] = ff000000
	stb	%l0,[%i0+0x01a]		! Mem[0000000010001418] = ff00d500
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 00000000f86ccfd5
	setx	0xadb46bcfec8bb677,%g7,%l0 ! %l0 = adb46bcfec8bb677
!	%l1 = fdbfc7ebff000000
	setx	0xa9a44967b6885d83,%g7,%l1 ! %l1 = a9a44967b6885d83
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = adb46bcfec8bb677
	setx	0x675a802820fd39dc,%g7,%l0 ! %l0 = 675a802820fd39dc
!	%l1 = a9a44967b6885d83
	setx	0x0a3bad2f84af0b17,%g7,%l1 ! %l1 = 0a3bad2f84af0b17
!	Mem[0000000010141410] = 00000000, %l6 = 00000000000019df
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010101410] = ff006fff00000003
	stxa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	Mem[0000000030181408] = 72000000, %l4 = ffffffffffffffff
	ldstuba	[%i6+%o4]0x81,%l4	! %l4 = 00000072000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff000000, %l1 = 0a3bad2f84af0b17
	lduba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_195:
!	Mem[0000000030101400] = 037de60a, %l7 = 000000000000ff72
	ldswa	[%i4+%g0]0x81,%l7	! %l7 = 00000000037de60a
!	Mem[00000000300c1410] = 00000017 0000aa9d, %l6 = 00000000, %l7 = 037de60a
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 000000000000aa9d 0000000000000017
!	Mem[0000000010141400] = 00000032, %l5 = 0000000000000072
	lduha	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800000] = c9ffbb34, %l3 = 0000000000000032
	ldub	[%o1+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %f2  = 5f424410
	lda	[%i3+%o5]0x88,%f2 	! %f2 = 00000000
!	Mem[0000000010081400] = 041a6dff, %l0 = 675a802820fd39dc
	ldsha	[%i2+%g0]0x88,%l0	! %l0 = 0000000000006dff
!	Mem[0000000010001408] = aa9d0000, %f30 = ffffffc7
	lda	[%i0+%o4]0x88,%f30	! %f30 = aa9d0000
!	Mem[0000000010001408] = 00009daa9f91163e, %l4 = 0000000000000072
	ldxa	[%i0+%o4]0x80,%l4	! %l4 = 00009daa9f91163e
!	Mem[0000000010181410] = ffffffc7, %l6 = 000000000000aa9d
	lduwa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ffffffc7
!	Starting 10 instruction Store Burst
!	Mem[0000000010001438] = 62ef3c78000000ff, %l5 = 0000000000000000, %l6 = 00000000ffffffc7
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 62ef3c78000000ff

!	Check Point 39 for processor 0

	set	p0_check_pt_data_39,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000006dff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00009daa9f91163e
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 62ef3c78000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000017
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 01968f39
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000017 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 97000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 516fa616 00000072
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x70],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000017 0000ff72
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x78],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = aa9d0000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 39 completed


p0_label_196:
!	%f24 = ffe67b3d f778f552, Mem[0000000010141400] = 00000032 ffffffff
	stda	%f24,[%i5+%g0]0x80	! Mem[0000000010141400] = ffe67b3d f778f552
!	%f4  = 00000017 0000ffff, Mem[00000000300c1410] = 9daa0000 17000000
	stda	%f4 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000017 0000ffff
!	Mem[0000000010101408] = fd0000ff, %l7 = 0000000000000017
	swapa	[%i4+%o4]0x88,%l7	! %l7 = 00000000fd0000ff
!	%f26 = 000000ff 00000000, %l6 = 62ef3c78000000ff
!	Mem[0000000010181408] = ff00000000000000
	add	%i6,0x008,%g1
	stda	%f26,[%g1+%l6]ASI_PST8_P ! Mem[0000000010181408] = 000000ff00000000
!	%l1 = 0000000000000000, Mem[000000001014142a] = 80a2ecaa, %asi = 80
	stha	%l1,[%i5+0x02a]%asi	! Mem[0000000010141428] = 80a20000
!	Mem[0000000030181400] = 00000000, %l6 = 62ef3c78000000ff
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141408] = 01968f39, %l3 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 0000000001968f39
!	%f12 = 516fa616, Mem[0000000010101410] = 00000000
	sta	%f12,[%i4+%o5]0x88	! Mem[0000000010101410] = 516fa616
!	Mem[0000000010101410] = 16a66f51, %l7 = 00000000fd0000ff
	swapa	[%i4+%o5]0x80,%l7	! %l7 = 0000000016a66f51
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff00000000000000, %f16 = ffffffff ffffffff
	ldda	[%i0+%o5]0x81,%f16	! %f16 = ff000000 00000000

p0_label_197:
!	Mem[0000000030001410] = 000000ff, %l3 = 0000000001968f39
	lduba	[%i0+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000020800040] = ffffe589, %l4 = 00009daa9f91163e
	ldsh	[%o1+0x040],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010041434] = 00000000, %l6 = 0000000000000000
	ldsh	[%i1+0x034],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 000000ff, %l1 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101428] = 3bffdb8a, %l6 = 0000000000000000
	ldub	[%i4+0x028],%l6		! %l6 = 000000000000003b
!	Mem[0000000030181408] = 00000000000000ff, %f6  = 97000000 ffffffff
	ldda	[%i6+%o4]0x89,%f6 	! %f6  = 00000000 000000ff
!	%l1 = 0000000000000000, Mem[0000000010181418] = a509aa5effff0000, %asi = 80
	stxa	%l1,[%i6+0x018]%asi	! Mem[0000000010181418] = 0000000000000000
!	Mem[0000000010081424] = 3d7be6ff, %l0 = 0000000000006dff
	ldub	[%i2+0x026],%l0		! %l0 = 00000000000000e6
!	Mem[0000000010141420] = ffe67b3d f778f552, %l6 = 0000003b, %l7 = 16a66f51
	ldd	[%i5+0x020],%l6		! %l6 = 00000000ffe67b3d 00000000f778f552
!	Starting 10 instruction Store Burst
!	%l7 = 00000000f778f552, Mem[0000000030141408] = ff000000
	stba	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 52000000

p0_label_198:
!	%l5 = 0000000000000000, Mem[00000000100c1418] = 3317a600
	sth	%l5,[%i3+0x018]		! Mem[00000000100c1418] = 0000a600
!	%l7 = 00000000f778f552, Mem[0000000030181408] = ff000000
	stha	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = f5520000
!	%l4 = ffffffffffffffff, Mem[0000000010041438] = 3d7be6ff
	stw	%l4,[%i1+0x038]		! Mem[0000000010041438] = ffffffff
!	Mem[0000000030181400] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i6+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	%l4 = ffffffffffffffff, Mem[00000000100c1400] = fdbfc7ebff000000
	stxa	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffffffffffff
!	%l0 = 00000000000000e6, Mem[0000000010181400] = e0d3df19
	stwa	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000e6
!	%f0  = 16a66f51, Mem[0000000030081400] = 72000000
	sta	%f0 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 16a66f51
!	Mem[0000000010041400] = 0000ff66, %l3 = 00000000000000ff
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 000000000000ff66
!	%l7 = 00000000f778f552, Mem[00000000300c1400] = ffe67d03d5cf6cf8
	stxa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000f778f552
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = d0eab90cdaa49daa, %l3 = 000000000000ff66
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = d0eab90cdaa49daa

p0_label_199:
!	Mem[00000000300c1408] = 1a53d335, %f23 = a7740b98
	lda	[%i3+%o4]0x81,%f23	! %f23 = 1a53d335
!	Mem[0000000030181400] = ff000000, %l1 = ffffffffffffffff
	ldsba	[%i6+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1400] = f778f552, %l4 = ffffffffffffffff
	lduha	[%i3+%g0]0x89,%l4	! %l4 = 000000000000f552
!	Mem[00000000218000c0] = ffffcd54, %l0 = 00000000000000e6
	ldsh	[%o3+0x0c0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030101410] = 00000017, %l1 = ffffffffffffffff
	ldsba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000017
!	Mem[0000000010141430] = 35d3531a 34e6f7ff, %l2 = 00000000, %l3 = daa49daa
	ldda	[%i5+0x030]%asi,%l2	! %l2 = 0000000035d3531a 0000000034e6f7ff
!	Mem[00000000100c1400] = ffffffff, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181400] = 000000ff, %l7 = 00000000f778f552
	lduwa	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001430] = ff00ff3d, %l7 = 00000000000000ff
	ldsha	[%i0+0x032]%asi,%l7	! %l7 = ffffffffffffff3d
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = ff000000, %l3 = 0000000034e6f7ff
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 000000ff000000ff

p0_label_200:
!	Mem[0000000030101410] = 00000017, %l2 = 0000000035d3531a
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000017
!	%l4 = 000000000000f552, Mem[00000000300c1400] = f778f552
	stha	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = f778f552
!	%f0  = 16a66f51 a7740b98, %l0 = ffffffffffffffff
!	Mem[00000000300c1400] = 52f578f700000000
	stda	%f0,[%i3+%l0]ASI_PST8_SL ! Mem[00000000300c1400] = 980b74a7516fa616
!	%f26 = 000000ff 00000000, %l4 = 000000000000f552
!	Mem[0000000010041420] = 0000000000000066
	add	%i1,0x020,%g1
	stda	%f26,[%g1+%l4]ASI_PST16_P ! Mem[0000000010041420] = 0000000000000066
!	Mem[0000000030001408] = ffffffff, %l2 = 0000000000000017
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 00000000ffffffff
!	%f2  = 00000000 01968f39, %l5 = 00000000000000ff
!	Mem[00000000100c1420] = ffffffff04f00000
	add	%i3,0x020,%g1
	stda	%f2,[%g1+%l5]ASI_PST32_PL ! Mem[00000000100c1420] = 398f960100000000
!	%l5 = 00000000000000ff, Mem[0000000010101400] = ffff2f5e
	stha	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 00ff2f5e
!	%l2 = 00000000ffffffff, Mem[0000000010081434] = 000000f8, %asi = 80
	stba	%l2,[%i2+0x034]%asi	! Mem[0000000010081434] = ff0000f8
!	Mem[00000000211c0001] = ff72e4d2, %l4 = 000000000000f552
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 00000072000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 34e67d03, %l2 = 00000000ffffffff
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = 0000000000007d03

!	Check Point 40 for processor 0

	set	p0_check_pt_data_40,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000017
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000007d03
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000072
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffe67b3d
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffff3d
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 01968f39
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 16a66f51 1a53d335
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1

!	Check Point 40 completed


p0_label_201:
!	Mem[0000000030001408] = 17000000, %l1 = 0000000000000017
	lduha	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 0000000000000000, %l6 = 00000000ffe67b3d
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 000000ff, %l0 = ffffffffffffffff
	lduha	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = ffffffff, %l6 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = ffffe4d2, %l6 = ffffffffffffffff
	ldsb	[%o2+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010101410] = fd0000ff00000000, %l0 = 0000000000000000
	ldxa	[%i4+%o5]0x80,%l0	! %l0 = fd0000ff00000000
!	Mem[00000000211c0000] = ffffe4d2, %l1 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = ffe67b3d, %l0 = fd0000ff00000000
	lduw	[%i5+%g0],%l0		! %l0 = 00000000ffe67b3d
!	%l0 = 00000000ffe67b3d, %l3 = 00000000000000ff, %l4 = 0000000000000072
	udivx	%l0,%l3,%l4		! %l4 = 000000000100e762
!	Starting 10 instruction Store Burst
!	%f26 = 000000ff 00000000, %l4 = 000000000100e762
!	Mem[0000000030141428] = e372000040625eff
	add	%i5,0x028,%g1
	stda	%f26,[%g1+%l4]ASI_PST32_S ! Mem[0000000030141428] = 000000ff40625eff

p0_label_202:
!	%l4 = 000000000100e762, Mem[0000000030001400] = 00000000
	stba	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 62000000
!	%l7 = ffffffffffffff3d, Mem[00000000211c0000] = ffffe4d2, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff3de4d2
!	%f18 = ffe67d03, Mem[00000000100c1408] = 00000072
	sta	%f18,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffe67d03
!	%l0 = ffe67b3d, %l1 = 000000ff, Mem[0000000030041400] = 037de634 037de60a
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = ffe67b3d 000000ff
!	%l5 = 00000000000000ff, Mem[00000000300c1400] = a7740b98
	stwa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	%l4 = 0100e762, %l5 = 000000ff, Mem[0000000010141408] = 00000000 00000000
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 0100e762 000000ff
!	%f12 = 516fa616, Mem[0000000010081400] = 041a6dff
	sta	%f12,[%i2+%g0]0x88	! Mem[0000000010081400] = 516fa616
!	%l7 = ffffffffffffff3d, Mem[00000000300c1408] = 1a53d3351044425f
	stxa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffffffffff3d
!	Mem[0000000010041410] = ff000000, %l5 = 00000000000000ff
	swap	[%i1+%o5],%l5		! %l5 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 35d3531a, %l0 = 00000000ffe67b3d
	ldswa	[%i4+%o5]0x89,%l0	! %l0 = 0000000035d3531a

p0_label_203:
!	Mem[0000000010181438] = d0eab90c, %f29 = 0000ff72
	lda	[%i6+0x038]%asi,%f29	! %f29 = d0eab90c
!	Mem[0000000030081400] = 516fa616, %l1 = 00000000000000ff
	ldsha	[%i2+%g0]0x89,%l1	! %l1 = ffffffffffffa616
!	Mem[0000000030001410] = 00000000000000ff, %f24 = ffe67b3d f778f552
	ldda	[%i0+%o5]0x89,%f24	! %f24 = 00000000 000000ff
!	Mem[0000000030001408] = 17000000, %l3 = 00000000000000ff
	ldswa	[%i0+%o4]0x89,%l3	! %l3 = 0000000017000000
!	Mem[0000000030041408] = ff0000ff ffffffff, %l6 = ffffffff, %l7 = ffffff3d
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 00000000ff0000ff 00000000ffffffff
!	Mem[0000000010181408] = ff000000, %l0 = 0000000035d3531a
	lduba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = 326d1a04000000e6, %l5 = 00000000ff000000
	ldxa	[%i6+%g0]0x88,%l5	! %l5 = 326d1a04000000e6
!	Mem[0000000010181408] = 000000ff, %l3 = 0000000017000000
	ldsba	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141430] = 35d3531a34e6f7ff, %f16 = ff000000 00000000
	ldda	[%i5+0x030]%asi,%f16	! %f16 = 35d3531a 34e6f7ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 17000000, %l3 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff

p0_label_204:
!	%l5 = 326d1a04000000e6, Mem[0000000030141400] = 16a66f51a7740b98
	stxa	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 326d1a04000000e6
!	Mem[0000000010101410] = ff0000fd, %l1 = ffffffffffffa616
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 000000fd000000ff
!	%l2 = 00007d03, %l3 = 00000000, Mem[0000000010101408] = 17000000 ff8734ed
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00007d03 00000000
!	Mem[0000000030181400] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	%l7 = 00000000ffffffff, Mem[00000000201c0000] = ffffafd5, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffffafd5
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000007d03
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = 0000ffff, %l3 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%f28 = 00000017, Mem[0000000030001410] = 000000ff
	sta	%f28,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000017
!	Mem[0000000020800040] = ffffe589, %l3 = 00000000000000ff
	ldstub	[%o1+0x040],%l3		! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 0000ff66, %l6 = 00000000ff0000ff
	lduba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000066

p0_label_205:
!	Mem[0000000010041438] = ffffffff, %l2 = 0000000000000000
	ldswa	[%i1+0x038]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181410] = ffe67b3d00000000, %l1 = 00000000000000fd
	ldxa	[%i6+%o5]0x89,%l1	! %l1 = ffe67b3d00000000
!	Mem[0000000010001410] = 0000ff66, %l0 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l0	! %l0 = 000000000000ff66
!	Mem[0000000030001410] = 00000017, %l5 = 326d1a04000000e6
	lduwa	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000017
!	Mem[0000000010181418] = 0000000000000000, %l5 = 0000000000000017
	ldx	[%i6+0x018],%l5		! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %f18 = ffe67d03
	lda	[%i3+%o5]0x88,%f18	! %f18 = 000000ff
!	Mem[0000000010181408] = 000000ff 00000000, %l0 = 0000ff66, %l1 = 00000000
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000010101400] = 000000005e2fff00, %l4 = 000000000100e762
	ldxa	[%i4+%g0]0x88,%l4	! %l4 = 000000005e2fff00
!	Mem[00000000201c0000] = ffffafd5, %l4 = 000000005e2fff00
	ldub	[%o0+%g0],%l4		! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f30 = aa9d0000 00000000, Mem[0000000010181408] = 000000ff 00000000
	std	%f30,[%i6+%o4]	! Mem[0000000010181408] = aa9d0000 00000000

!	Check Point 41 for processor 0

	set	p0_check_pt_data_41,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000066
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 16a66f51 a7740b98
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 35d3531a 34e6f7ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x58],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 000000ff d5cf6cf8
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x60],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x68],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000017 d0eab90c
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 41 completed


p0_label_206:
!	Mem[0000000030001400] = 00000062, %l2 = ffffffffffffffff
	swapa	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000062
!	%f18 = 000000ff d5cf6cf8, %l0 = 00000000000000ff
!	Mem[0000000030101410] = 1a53d33500000000
	add	%i4,0x010,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_S ! Mem[0000000030101410] = 000000ffd5cf6cf8
!	Mem[0000000020800041] = ffffe589, %l1 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l1	! %l1 = 000000ff000000ff
!	%l2 = 00000062, %l3 = 000000ff, Mem[00000000100c1430] = 00ff0000 0000002d
	stda	%l2,[%i3+0x030]%asi	! Mem[00000000100c1430] = 00000062 000000ff
!	%l2 = 0000000000000062, Mem[0000000010001410] = 0000ff66
	stba	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000ff62
!	%l7 = 00000000ffffffff, Mem[0000000020800040] = ffffe589, %asi = 80
	stha	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = ffffe589
!	%l0 = 00000000000000ff, Mem[0000000010041410] = 000000ff00000072
	stx	%l0,[%i1+%o5]		! Mem[0000000010041410] = 00000000000000ff
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000066
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000010081408] = ff5e6240 000072e3
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000017, %l2 = 0000000000000062
	ldswa	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000017

p0_label_207:
!	Mem[00000000201c0000] = ffffafd5, %l2 = 0000000000000017
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1438] = 8dff72e3, %l4 = 00000000000000ff
	ldsb	[%i3+0x03b],%l4		! %l4 = ffffffffffffffe3
!	Mem[0000000010081400] = 516fa616, %l6 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l6	! %l6 = 000000000000a616
!	Mem[0000000010101400] = 5e2fff00, %l1 = 00000000000000ff
	ldsba	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = e6000000, %l3 = 00000000000000ff
	ldsba	[%i5+%g0]0x81,%l3	! %l3 = ffffffffffffffe6
!	Mem[0000000010181428] = 00000000, %l7 = 00000000ffffffff
	ldsw	[%i6+0x028],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141408] = 62e70001 ff000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 0000000062e70001 00000000ff000000
!	Mem[0000000010141410] = 000019dfff000000, %l2 = ffffffffffffffff
	ldxa	[%i5+%o5]0x80,%l2	! %l2 = 000019dfff000000
!	Mem[0000000010001400] = 16a66f51, %f11 = 000072e3
	lda	[%i0+%g0]0x80,%f11	! %f11 = 16a66f51
!	Starting 10 instruction Store Burst
!	%f20 = 00000000 ff000000, %l6 = 000000000000a616
!	Mem[0000000030041420] = ffe67b3df778f552
	add	%i1,0x020,%g1
	stda	%f20,[%g1+%l6]ASI_PST16_S ! Mem[0000000030041420] = ffe60000ff00f552

p0_label_208:
!	%f24 = 00000000 000000ff, Mem[0000000010041400] = ff000000 00000000
	stda	%f24,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 000000ff
!	%f4  = 00000017 0000ffff, Mem[00000000300c1410] = 170000ff ffff0000
	stda	%f4 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000017 0000ffff
!	%l6 = 0000a616, %l7 = 00000000, Mem[0000000030101410] = ff000000 f86ccfd5
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000a616 00000000
!	%l0 = 0000000062e70001, Mem[00000000100c1410] = ff000000
	stha	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00010000
!	%l6 = 000000000000a616, Mem[0000000030081400] = 516fa616
	stwa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000a616
!	%l3 = ffffffffffffffe6, Mem[0000000010141410] = 000019df
	stw	%l3,[%i5+%o5]		! Mem[0000000010141410] = ffffffe6
!	Mem[0000000010101400] = 00ff2f5e, %l6 = 000000000000a616
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 0000000000ff2f5e
!	%l6 = 00ff2f5e, %l7 = 00000000, Mem[0000000030041410] = 516fa616 de45fb04
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00ff2f5e 00000000
!	%l0 = 0000000062e70001, Mem[0000000010141427] = f778f552, %asi = 80
	stba	%l0,[%i5+0x027]%asi	! Mem[0000000010141424] = f778f501
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ebc7bffd, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000fd

p0_label_209:
!	Mem[0000000030081400] = 16a60000, %l0 = 0000000062e70001
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 0000000016a60000
!	Mem[0000000030041400] = ffe67b3d, %l0 = 0000000016a60000
	lduha	[%i1+%g0]0x81,%l0	! %l0 = 000000000000ffe6
!	Mem[0000000010101408] = 037d0000, %l0 = 000000000000ffe6
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = e6000000, %l3 = ffffffffffffffe6
	ldsba	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffffe6
!	Mem[0000000030041400] = ffe67b3d000000ff, %l6 = 0000000000ff2f5e
	ldxa	[%i1+%g0]0x81,%l6	! %l6 = ffe67b3d000000ff
!	Mem[0000000010081400] = 16a66f51, %l4 = ffffffffffffffe3
	lduwa	[%i2+%g0]0x80,%l4	! %l4 = 0000000016a66f51
!	Mem[0000000030101410] = 0000a616, %l1 = 00000000ff000000
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 000000000000a616
!	%f20 = 00000000 ff000000, Mem[0000000030101408] = aa9da4da 0cb9ead0
	stda	%f20,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 ff000000
!	Mem[00000000211c0000] = ff3de4d2, %l1 = 000000000000a616
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffff3d
!	Starting 10 instruction Store Burst
!	%l6 = ffe67b3d000000ff, Mem[0000000010141408] = 0100e762
	stwa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff

p0_label_210:
!	Mem[0000000010081400] = 16a66f51, %l5 = 00000000000000fd, %asi = 80
	swapa	[%i2+0x000]%asi,%l5	! %l5 = 0000000016a66f51
!	%l4 = 0000000016a66f51, Mem[0000000010181410] = ffffffc7
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 16a66f51
!	Mem[00000000300c1410] = ffff0000, %l4 = 0000000016a66f51
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l2 = 000019dfff000000, Mem[0000000030081408] = ff00000000005eff
	stxa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 000019dfff000000
!	Mem[0000000030141400] = 000000e6, %l4 = 00000000000000ff
	ldstuba	[%i5+%g0]0x89,%l4	! %l4 = 000000e6000000ff
!	%l5 = 0000000016a66f51, Mem[0000000030001400] = 26a9d40dffffffff
	stxa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000016a66f51
!	Mem[0000000010181401] = e6000000, %l2 = 000019dfff000000
	ldstuba	[%i6+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000020800041] = ffffe589, %l0 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l0	! %l0 = 000000ff000000ff
!	%f28 = 00000017 d0eab90c, %l1 = ffffffffffffff3d
!	Mem[0000000030041400] = ffe67b3d000000ff
	stda	%f28,[%i1+%l1]ASI_PST32_S ! Mem[0000000030041400] = ffe67b3dd0eab90c
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l1 = ffffffffffffff3d
	lduba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000

!	Check Point 42 for processor 0

	set	p0_check_pt_data_42,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffe6
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000e6
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000016a66f51
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffe67b3d000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 16a66f51 a7740b98
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff5e6240 16a66f51
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1

!	Check Point 42 completed


p0_label_211:
!	Mem[0000000010081400] = 000000fd0000002d, %f26 = 000000ff 00000000
	ldda	[%i2+%g0]0x80,%f26	! %f26 = 000000fd 0000002d
!	Mem[0000000010181418] = 00000000, %l6 = ffe67b3d000000ff
	ldsha	[%i6+0x018]%asi,%l6	! %l6 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[00000000100c1410] = 000000ff00000100
	stxa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000000000ff
!	Mem[0000000010001408] = 00009daa, %l2 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l2	! %l2 = 0000000000009daa
!	Mem[0000000030081410] = 00000000, %f2  = 00000000
	lda	[%i2+%o5]0x81,%f2 	! %f2 = 00000000
!	Mem[00000000100c1408] = 037de6ff, %l7 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = 00000000037de6ff
!	Mem[00000000100c1408] = 037de6ff000000ff, %l2 = 0000000000009daa
	ldxa	[%i3+%o4]0x80,%l2	! %l2 = 037de6ff000000ff
!	Mem[0000000030101400] = 0ae67d03, %f11 = 16a66f51
	lda	[%i4+%g0]0x89,%f11	! %f11 = 0ae67d03
!	Mem[0000000010001408] = aa9d0000, %l1 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 16a66f51 a7740b98, %l7 = 00000000037de6ff
!	Mem[0000000030141438] = d0eab90cdaa49daa
	add	%i5,0x038,%g1
	stda	%f0,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030141438] = 980b74a7516fa616

p0_label_212:
!	%f20 = 00000000, Mem[0000000010001400] = 516fa616
	sta	%f20,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010101408] = 037d0000
	stha	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 037d0000
!	%l3 = ffffffffffffffe6, Mem[0000000030081400] = 0000a616
	stba	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000a6e6
!	Mem[0000000030101400] = 037de60a, %l5 = 0000000016a66f51
	ldstuba	[%i4+%g0]0x81,%l5	! %l5 = 00000003000000ff
!	Mem[0000000030101410] = 16a60000, %l0 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l0	! %l0 = 00000016000000ff
!	Mem[0000000020800001] = c9ffbb34, %l5 = 0000000000000003
	ldstub	[%o1+0x001],%l5		! %l5 = 000000ff000000ff
!	Mem[0000000021800041] = ff2b9b4e, %l6 = 0000000000000000
	ldstub	[%o3+0x041],%l6		! %l6 = 0000002b000000ff
!	%l0 = 00000016, %l1 = 00000000, Mem[0000000010041410] = ff000000 000000ff
	stda	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000016 00000000
!	%l3 = ffffffffffffffe6, Mem[0000000010081410] = ebc7bffd
	stba	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = ebc7bfe6
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 000000ff, %l5 = 00000000000000ff
	ldsha	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_213:
!	Mem[0000000010041400] = ff00000000000000, %l0 = 0000000000000016
	ldxa	[%i1+%g0]0x88,%l0	! %l0 = ff00000000000000
!	Mem[00000000300c1410] = ffff0000, %f21 = ff000000
	lda	[%i3+%o5]0x81,%f21	! %f21 = ffff0000
!	Mem[0000000030001408] = 00000017, %l4 = 00000000000000e6
	ldsba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = ffe67b3d, %l1 = 0000000000000000
	ldsha	[%i5+%g0]0x80,%l1	! %l1 = ffffffffffffffe6
!	Mem[0000000030181410] = 00000000, %l0 = ff00000000000000
	lduwa	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001418] = ff00d500, %l0 = 0000000000000000
	ldsb	[%i0+0x019],%l0		! %l0 = 0000000000000000
!	Mem[0000000030041410] = 00ff2f5e, %l7 = 00000000037de6ff
	lduha	[%i1+%o5]0x89,%l7	! %l7 = 0000000000002f5e
!	Mem[00000000201c0000] = ffffafd5, %l6 = 000000000000002b
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030141408] = 00000052, %l7 = 0000000000002f5e
	ldsba	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000052
!	Starting 10 instruction Store Burst
!	Mem[000000001004142c] = 77a322cb, %l2 = 037de6ff000000ff
	lduwa	[%i1+0x02c]%asi,%l2	! %l2 = 0000000077a322cb

p0_label_214:
!	%f25 = 000000ff, Mem[00000000300c1408] = ffffffff
	sta	%f25,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	%l5 = 0000000000000000, Mem[0000000010001400] = 0000000000000000
	stxa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	Mem[0000000010181410] = 16a66f51, %l0 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 00000016000000ff
!	%l2 = 0000000077a322cb, Mem[0000000010041408] = ff000000
	stha	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = ff0022cb
!	%l4 = 0000000000000000, Mem[0000000010041400] = 00000000
	stha	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%f12 = 516fa616 00000072, Mem[0000000010181400] = e6ff0000 041a6d32
	stda	%f12,[%i6+0x000]%asi	! Mem[0000000010181400] = 516fa616 00000072
!	%f22 = 16a66f51 1a53d335, Mem[0000000010141428] = 80a20000 77a322cb
	stda	%f22,[%i5+0x028]%asi	! Mem[0000000010141428] = 16a66f51 1a53d335
!	%f18 = 000000ff, Mem[00000000100c1408] = ffe67d03
	sta	%f18,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	Mem[0000000030181408] = 000052f5, %l6 = 000000000000ffff
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 000000f5000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = e6bfc7ebff000000, %l7 = 0000000000000052
	ldxa	[%i2+%o5]0x80,%l7	! %l7 = e6bfc7ebff000000

p0_label_215:
!	Mem[0000000010041410] = 0000001600000000, %f16 = 35d3531a 34e6f7ff
	ldda	[%i1+0x010]%asi,%f16	! %f16 = 00000016 00000000
!	Mem[0000000010181410] = ffa66f51, %l3 = ffffffffffffffe6
	lduha	[%i6+%o5]0x80,%l3	! %l3 = 000000000000ffa6
!	Mem[00000000300c1408] = ff000000, %l4 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010081400] = fd000000, %l6 = 00000000000000f5
	ldswa	[%i2+%g0]0x88,%l6	! %l6 = fffffffffd000000
!	Mem[0000000010001400] = 0000000000000000, %f14 = aa9da4da 0cb9ead0
	ldda	[%i0+%g0]0x88,%f14	! %f14 = 00000000 00000000
!	Mem[0000000021800000] = f2ffed58, %l0 = 0000000000000016
	ldsha	[%o3+0x000]%asi,%l0	! %l0 = fffffffffffff2ff
!	Mem[0000000010181410] = 516fa6ff, %l3 = 000000000000ffa6
	lduba	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = 00000000, %f7  = 000000ff
	lda	[%i6+%o5]0x89,%f7 	! %f7 = 00000000
!	Mem[0000000030101400] = 0ae67dff, %f18 = 000000ff
	lda	[%i4+%g0]0x89,%f18	! %f18 = 0ae67dff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 00000000, %l6 = fffffffffd000000
	swapa	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000

!	Check Point 43 for processor 0

	set	p0_check_pt_data_43,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = fffffffffffff2ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffe6
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000077a322cb
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffff00
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = e6bfc7ebff000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 01968f39
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff5e6240 0ae67d03
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000016 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 0ae67dff d5cf6cf8
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 ffff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 000000fd 0000002d
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 43 completed


p0_label_216:
!	Mem[0000000030181410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%f16 = 00000016 00000000 0ae67dff d5cf6cf8
!	%f20 = 00000000 ffff0000 16a66f51 1a53d335
!	%f24 = 00000000 000000ff 000000fd 0000002d
!	%f28 = 00000017 d0eab90c aa9d0000 00000000
	stda	%f16,[%i2]ASI_BLK_AIUS	! Block Store to 0000000030081400
!	%l3 = 0000000000000000, Mem[0000000010141408] = ff000000
	stba	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[00000000100c1424] = 00000000, %l1 = ffffffffffffffe6
	ldstuba	[%i3+0x024]%asi,%l1	! %l1 = 00000000000000ff
!	%l2 = 0000000077a322cb, Mem[0000000010041410] = 0000001600000000
	stxa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000077a322cb
!	Mem[0000000030101410] = ffa60000, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 00000000ffa60000
!	%l7 = e6bfc7ebff000000, Mem[0000000010041408] = cb2200ff
	stba	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 002200ff
!	%l2 = 0000000077a322cb, Mem[0000000030081400] = 00000016
	stwa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 77a322cb
!	Mem[0000000010141428] = 16a66f511a53d335, %l6 = 0000000000000000, %l4 = ffffffffffffff00
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = 16a66f511a53d335
!	Starting 10 instruction Load Burst
!	Mem[00000000100c142c] = b75cd9da, %l3 = 00000000ffa60000
	lduw	[%i3+0x02c],%l3		! %l3 = 00000000b75cd9da

p0_label_217:
!	Mem[0000000021800000] = f2ffed58, %l6 = 0000000000000000
	ldsb	[%o3+%g0],%l6		! %l6 = fffffffffffffff2
!	Mem[0000000030101408] = 00000000, %l4 = 16a66f511a53d335
	ldswa	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = ff0000ff, %l1 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l1	! %l1 = 00000000ff0000ff
!	Mem[0000000010041408] = 002200ff00000000, %l7 = e6bfc7ebff000000
	ldxa	[%i1+%o4]0x80,%l7	! %l7 = 002200ff00000000
!	Mem[0000000020800040] = ffffe589, %l0 = fffffffffffff2ff
	ldsba	[%o1+0x040]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101410] = ff0000ff, %f0  = 16a66f51
	lda	[%i4+%o5]0x80,%f0 	! %f0 = ff0000ff
!	Mem[0000000010041410] = 00000000 77a322cb, %l2 = 77a322cb, %l3 = b75cd9da
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000 0000000077a322cb
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000030081408] = ff7de60a, %l0 = ffffffffffffffff
	ldsba	[%i2+%o4]0x89,%l0	! %l0 = 000000000000000a
!	Mem[0000000010101410] = 00000000 ff0000ff, %l2 = 00000000, %l3 = 77a322cb
	ldda	[%i4+%o5]0x88,%l2	! %l2 = 00000000ff0000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = fffffffffffffff2, Mem[0000000010041410] = 0000000077a322cb
	stxa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = fffffffffffffff2

p0_label_218:
!	Mem[0000000010001424] = a1472f5e, %l2 = 00000000ff0000ff
	ldstuba	[%i0+0x024]%asi,%l2	! %l2 = 000000a1000000ff
!	%f14 = 00000000 00000000, Mem[00000000300c1410] = 0000ffff 00000017
	stda	%f14,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 00000000
!	Mem[00000000211c0001] = ff3de4d2, %l4 = 0000000000000000
	ldstub	[%o2+0x001],%l4		! %l4 = 0000003d000000ff
!	Mem[00000000100c1408] = ff000000, %l4 = 000000000000003d
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	%f29 = d0eab90c, Mem[0000000030041408] = ff0000ff
	sta	%f29,[%i1+%o4]0x89	! Mem[0000000030041408] = d0eab90c
!	%f5  = 0000ffff, Mem[0000000030141408] = 00000052
	sta	%f5 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000ffff
!	%f30 = aa9d0000, %f1  = a7740b98
	fsqrts	%f30,%f1 		! %f1  = 7fffffff
!	%l7 = 002200ff00000000, Mem[0000000010181408] = 00009daa
	stha	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%l6 = fffffff2, %l7 = 00000000, Mem[0000000010001410] = 62ff0000 000000f8
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = fffffff2 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 16a66f51000000ff, %l0 = 000000000000000a
	ldxa	[%i3+%g0]0x89,%l0	! %l0 = 16a66f51000000ff

p0_label_219:
!	Mem[0000000030181410] = ff000000, %l4 = 00000000000000ff
	lduwa	[%i6+%o5]0x89,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010101410] = ff0000ff, %l4 = 00000000ff000000
	lduha	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 3d7be6ff, %l5 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l5	! %l5 = ffffffffffffe6ff
!	Mem[0000000021800180] = 52f9ae0c, %l7 = 002200ff00000000
	ldub	[%o3+0x180],%l7		! %l7 = 0000000000000052
!	Mem[0000000010141410] = e6ffffff, %l2 = 00000000000000a1
	lduba	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[000000001008142c] = aaeca280, %l7 = 0000000000000052
	ldsw	[%i2+0x02c],%l7		! %l7 = ffffffffaaeca280
!	Mem[0000000030001410] = 17000000, %f11 = 0ae67d03
	lda	[%i0+%o5]0x81,%f11	! %f11 = 17000000
!	Mem[0000000010181400] = 516fa616, %l3 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000051
!	Mem[0000000010081400] = 000000fd, %f4  = 00000017
	lda	[%i2+%g0]0x80,%f4 	! %f4 = 000000fd
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = ffff0000, %l5 = ffffffffffffe6ff
	ldstuba	[%i5+%o4]0x81,%l5	! %l5 = 000000ff000000ff

p0_label_220:
!	Mem[0000000010101420] = 0000845c, %l7 = ffffffffaaeca280
	ldstuba	[%i4+0x020]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1420] = 398f9601ff000000, %l5 = 00000000000000ff, %l6 = fffffffffffffff2
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 398f9601ff000000
!	%f23 = 1a53d335, Mem[0000000010041410] = ffffffff
	sta	%f23,[%i1+%o5]0x88	! Mem[0000000010041410] = 1a53d335
!	Mem[0000000030081400] = 77a322cb, %l1 = 00000000ff0000ff
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 00000077000000ff
!	Mem[0000000030101400] = 0ae67dff, %l1 = 0000000000000077
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 000000000ae67dff
!	Mem[0000000030041408] = 0cb9ead0, %l2 = 00000000000000ff
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 0000000c000000ff
!	%l5 = 00000000000000ff, Mem[0000000010081400] = fd000000
	stwa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%f4  = 000000fd 0000ffff, Mem[0000000030001408] = 00000017 ffffffff
	stda	%f4 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000fd 0000ffff
!	%l1 = 000000000ae67dff, Mem[0000000010101400] = 0000a61600000000
	stxa	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000000ae67dff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ebc7bfe6, %l4 = 00000000000000ff
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 000000000000bfe6

!	Check Point 44 for processor 0

	set	p0_check_pt_data_44,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 16a66f51000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000ae67dff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000000c
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000051
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000bfe6
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 398f9601ff000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff0000ff 7fffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 01968f39
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 000000fd 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff5e6240 17000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1

!	Check Point 44 completed


p0_label_221:
!	Mem[0000000010041410] = 35d3531afffffff2, %l2 = 000000000000000c
	ldx	[%i1+%o5],%l2		! %l2 = 35d3531afffffff2
!	Mem[0000000030141408] = ffff00001044425f, %l2 = 35d3531afffffff2
	ldxa	[%i5+%o4]0x81,%l2	! %l2 = ffff00001044425f
!	Mem[0000000030101400] = 77000000, %l3 = 0000000000000051
	ldswa	[%i4+%g0]0x81,%l3	! %l3 = 0000000077000000
!	Mem[00000000100c1400] = ffffffffffffffff, %l3 = 0000000077000000
	ldxa	[%i3+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[000000001004143c] = 52d51ebb, %l2 = ffff00001044425f
	ldsw	[%i1+0x03c],%l2		! %l2 = 0000000052d51ebb
!	Mem[00000000300c1408] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %f31 = 00000000
	lda	[%i4+%o4]0x81,%f31	! %f31 = 00000000
!	Mem[0000000030001410] = 00000017, %l4 = 000000000000bfe6
	ldsha	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000017
!	Mem[000000001000143c] = 000000ff, %l1 = 000000000ae67dff
	lduw	[%i0+0x03c],%l1		! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 17000000, %l7 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 0000000017000000

p0_label_222:
!	Mem[0000000010101410] = ff0000ff, %l7 = 0000000017000000
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030081408] = 0ae67dff, %l4 = 0000000000000017
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 0000000a000000ff
!	%l1 = 00000000000000ff, Mem[00000000201c0000] = ffffafd5
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 00ffafd5
!	%f16 = 00000016 00000000, Mem[0000000010081420] = 52f578f7 3d7be6ff
	stda	%f16,[%i2+0x020]%asi	! Mem[0000000010081420] = 00000016 00000000
!	%l3 = ffffffffffffffff, Mem[0000000030101408] = 00000000
	stha	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = ffff0000
!	%l6 = 398f9601ff000000, Mem[00000000100c1433] = 00000062, %asi = 80
	stba	%l6,[%i3+0x033]%asi	! Mem[00000000100c1430] = 00000000
!	%l3 = ffffffffffffffff, Mem[0000000010181410] = ffa66f51
	stw	%l3,[%i6+%o5]		! Mem[0000000010181410] = ffffffff
!	%l1 = 00000000000000ff, Mem[00000000100c1400] = ffffffff
	stba	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffff
!	%f4  = 000000fd 0000ffff, %l4 = 000000000000000a
!	Mem[0000000010101410] = ff0000ff00000000
	add	%i4,0x010,%g1
	stda	%f4,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010101410] = ff00000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ffafd5, %l2 = 0000000052d51ebb
	lduba	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000

p0_label_223:
!	Mem[0000000010101408] = 00000000 037d0000, %l6 = ff000000, %l7 = 000000ff
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 00000000037d0000 0000000000000000
!	Mem[00000000100c1404] = ffffffff, %f15 = 00000000
	ld	[%i3+0x004],%f15	! %f15 = ffffffff
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 2d000000000000ff, %l6 = 00000000037d0000
	ldxa	[%i2+%g0]0x88,%l6	! %l6 = 2d000000000000ff
!	Mem[0000000010181438] = d0eab90c, %l6 = 2d000000000000ff
	ldswa	[%i6+0x038]%asi,%l6	! %l6 = ffffffffd0eab90c
!	Mem[0000000010001410] = f2ffffff, %l7 = 0000000000000000
	ldsba	[%i0+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101400] = 00000077, %l4 = 000000000000000a
	ldswa	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000077
	membar	#Sync			! Added by membar checker (43)
!	Mem[00000000300c1400] = ff000000 516fa616 ff000000 ffffff3d
!	Mem[00000000300c1410] = 00000000 00000000 00000000 00000097
!	Mem[00000000300c1420] = ed34871b 037de60a d0ea0000 40625eff
!	Mem[00000000300c1430] = 8fbbc3a2 ff72c64a d0eab90c daa49daa
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Mem[0000000010101408] = 037d0000, %l6 = ffffffffd0eab90c
	ldswa	[%i4+%o4]0x88,%l6	! %l6 = 00000000037d0000
!	Starting 10 instruction Store Burst
!	%f29 = d0eab90c, Mem[0000000010101410] = 000000ff
	sta	%f29,[%i4+%o5]0x88	! Mem[0000000010101410] = d0eab90c

p0_label_224:
!	%f22 = 16a66f51, Mem[000000001004140c] = 00000000
	st	%f22,[%i1+0x00c]	! Mem[000000001004140c] = 16a66f51
!	%l2 = 0000000000000000, Mem[0000000010181408] = 00000000
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%l7 = ffffffffffffffff, Mem[00000000100c1410] = 000000ff
	stba	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	%l7 = ffffffffffffffff, Mem[0000000030141410] = 0000ffff
	stba	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ffff
!	Mem[0000000030001410] = 000000ff 00000000, %l6 = 037d0000, %l7 = ffffffff
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000ff 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030141410] = ffff000017000000
	stxa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000000
!	Mem[000000001010140c] = 00000000, %l2 = 0000000000000000
	ldsw	[%i4+0x00c],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081410] = e6bfc7eb, %l5 = 00000000000000ff
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 00000000e6bfc7eb
!	%f18 = 0ae67dff d5cf6cf8, Mem[0000000010001400] = 00000000 00000000
	std	%f18,[%i0+%g0]	! Mem[0000000010001400] = 0ae67dff d5cf6cf8
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 16a66f51, %l4 = 0000000000000077
	lduwa	[%i6+%g0]0x88,%l4	! %l4 = 0000000016a66f51

p0_label_225:
!	Mem[0000000010081408] = 000000fd, %l4 = 0000000016a66f51
	ldsha	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = ff000000000000ff, %f26 = 000000fd 0000002d
	ldda	[%i3+%o4]0x88,%f26	! %f26 = ff000000 000000ff
!	Mem[0000000010141414] = ff000000, %f27 = 000000ff
	lda	[%i5+0x014]%asi,%f27	! %f27 = ff000000
!	Mem[0000000010141400] = 52f578f7 3d7be6ff, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 000000003d7be6ff 0000000052f578f7
!	Mem[0000000010181400] = 516fa616 00000072, %l4 = 00000000, %l5 = e6bfc7eb
	ldda	[%i6+%g0]0x80,%l4	! %l4 = 00000000516fa616 0000000000000072
!	Mem[00000000100c1438] = 8dff72e3785462bf, %f18 = 0ae67dff d5cf6cf8
	ldd	[%i3+0x038],%f18	! %f18 = 8dff72e3 785462bf
!	Mem[0000000030041400] = ffe67b3dd0eab90c, %l4 = 00000000516fa616
	ldxa	[%i1+%g0]0x81,%l4	! %l4 = ffe67b3dd0eab90c
!	Mem[0000000030101408] = ffff0000ff000000, %l7 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l7	! %l7 = ffff0000ff000000
!	Mem[0000000030001410] = ff000000, %l7 = ffff0000ff000000
	lduwa	[%i0+%o5]0x89,%l7	! %l7 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800040] = ffff9b4e, %l6 = 00000000000000ff
	ldstub	[%o3+0x040],%l6		! %l6 = 000000ff000000ff

!	Check Point 45 for processor 0

	set	p0_check_pt_data_45,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 000000003d7be6ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000052f578f7
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = ffe67b3dd0eab90c
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 516fa616
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 ffffff3d
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000097
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ed34871b 037de60a
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = d0ea0000 40625eff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 8fbbc3a2 ff72c64a
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x70],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = d0eab90c daa49daa
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 8dff72e3 785462bf
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x88],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = aa9d0000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 45 completed


p0_label_226:
!	Mem[0000000030001408] = fd000000, %l5 = 0000000000000072
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 00000000fd000000
!	%l7 = 00000000ff000000, Mem[0000000010141400] = 3d7be6ff
	stha	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 3d7b0000
!	%l5 = 00000000fd000000, Mem[0000000030141410] = 00000000
	stba	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l7 = 00000000ff000000, Mem[0000000010181408] = 00000000
	stwa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = ff000000
!	Mem[0000000010001410] = fffffff2, %l5 = 00000000fd000000
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030181408] = ff520000, %l6 = 00000000000000ff
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000ff520000
!	%l4 = d0eab90c, %l5 = 000000ff, Mem[00000000100c1400] = ffffffff ffffffff
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = d0eab90c 000000ff
!	%l4 = d0eab90c, %l5 = 000000ff, Mem[0000000010141408] = 00000000 ff000000
	std	%l4,[%i5+%o4]		! Mem[0000000010141408] = d0eab90c 000000ff
!	%f8  = ed34871b, Mem[0000000030101408] = 0000ffff
	sta	%f8 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ed34871b
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = 0000000000000066, %f6  = 00000000 00000097
	ldd	[%i1+0x020],%f6 	! %f6  = 00000000 00000066

p0_label_227:
!	Mem[00000000100c1410] = 00000000000000ff, %f4  = 00000000 00000000
	ldda	[%i3+%o5]0x88,%f4 	! %f4  = 00000000 000000ff
!	Mem[0000000030001400] = 516fa616, %l4 = ffe67b3dd0eab90c
	ldsha	[%i0+%g0]0x81,%l4	! %l4 = 000000000000516f
!	Mem[0000000010141400] = 3d7b0000, %l1 = 00000000000000ff
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 000000003d7b0000
!	Mem[0000000010001410] = fffffff200000000, %f12 = 8fbbc3a2 ff72c64a
	ldda	[%i0+%o5]0x80,%f12	! %f12 = fffffff2 00000000
!	Mem[0000000010041410] = 35d3531afffffff2, %l0 = 16a66f51000000ff
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = 35d3531afffffff2
!	Mem[00000000100c1408] = ff000000, %l2 = 000000003d7be6ff
	ldswa	[%i3+%o4]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000021800000] = f2ffed58, %l5 = 00000000000000ff
	lduha	[%o3+0x000]%asi,%l5	! %l5 = 000000000000f2ff
!	Mem[0000000030081408] = ff7de6ff, %l7 = 00000000ff000000
	lduba	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 000000ff00000000, %l7 = 00000000000000ff
	ldxa	[%i0+%o5]0x81,%l7	! %l7 = 000000ff00000000
!	Starting 10 instruction Store Burst
!	%f10 = d0ea0000 40625eff, Mem[0000000010181418] = 00000000 00000000
	stda	%f10,[%i6+0x018]%asi	! Mem[0000000010181418] = d0ea0000 40625eff

p0_label_228:
!	%l6 = ff520000, %l7 = 00000000, Mem[0000000030041410] = 5e2fff00 00000000
	stda	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = ff520000 00000000
!	Mem[0000000010101400] = 00000000, %l2 = ffffffffff000000
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%f28 = 00000017 d0eab90c, %l2 = 00000000000000ff
!	Mem[0000000030081430] = 00000017d0eab90c
	add	%i2,0x030,%g1
	stda	%f28,[%g1+%l2]ASI_PST8_S ! Mem[0000000030081430] = 00000017d0eab90c
!	Mem[00000000211c0001] = ffffe4d2, %l5 = 000000000000f2ff
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000021800000] = f2ffed58, %asi = 80
	stha	%l5,[%o3+0x000]%asi	! Mem[0000000021800000] = 00ffed58
!	Mem[0000000030141408] = ffff0000, %l0 = 35d3531afffffff2
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 00000000ffff0000
!	%f10 = d0ea0000, Mem[0000000030141400] = ff000000
	sta	%f10,[%i5+%g0]0x81	! Mem[0000000030141400] = d0ea0000
!	%f20 = 00000000 ffff0000, %l2 = 00000000000000ff
!	Mem[0000000030041418] = 16a66f51a7740b98
	add	%i1,0x018,%g1
	stda	%f20,[%g1+%l2]ASI_PST16_S ! Mem[0000000030041418] = 00000000ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000ffffffff, %f14 = d0eab90c daa49daa
	ldda	[%i6+%o5]0x88,%f14	! %f14 = 00000000 ffffffff

p0_label_229:
!	Mem[0000000010081410] = 000000ff, %l7 = 000000ff00000000
	lduwa	[%i2+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = 00000077, %l2 = 00000000000000ff
	lduha	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000077
!	Mem[0000000010081400] = ff000000, %l5 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030141408] = f2ffffff, %l5 = 00000000ff000000
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041400] = ff00000000000000, %l2 = 0000000000000077
	ldxa	[%i1+%g0]0x88,%l2	! %l2 = ff00000000000000
!	Mem[00000000201c0000] = 00ffafd5, %l5 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001410] = ff000000, %l4 = 000000000000516f
	lduha	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = f86ccfd5ff7de6ff, %f26 = ff000000 ff000000
	ldda	[%i2+%o4]0x89,%f26	! %f26 = f86ccfd5 ff7de6ff
!	Mem[0000000030001410] = 00000000ff000000, %l3 = 0000000052f578f7
	ldxa	[%i0+%o5]0x89,%l3	! %l3 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 1a53d335, %l7 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l7	! %l7 = 00000035000000ff

p0_label_230:
!	%l6 = 00000000ff520000, Mem[0000000030141410] = 00000000
	stwa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = ff520000
!	Mem[000000001000141c] = 000000ff, %l4 = 00000000, %l1 = 3d7b0000
	add	%i0,0x1c,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 00000000000000ff
!	%l3 = 00000000ff000000, Mem[0000000010041408] = 002200ff
	stba	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 002200ff
!	%f10 = d0ea0000 40625eff, %l6 = 00000000ff520000
!	Mem[0000000010081418] = 0000000000000000
	add	%i2,0x018,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_P ! Mem[0000000010081418] = 0000000000000000
!	Mem[0000000010141410] = e6ffffff, %l3 = 00000000ff000000
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	%l6 = 00000000ff520000, Mem[0000000010001410] = f2ffffff
	stba	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = f2ffff00
!	%l7 = 0000000000000035, Mem[0000000030141400] = d0ea0000041a6d32
	stxa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000035
!	Mem[0000000020800040] = ffffe589, %l5 = 00000000000000ff
	ldstuba	[%o1+0x040]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000201c0001] = 00ffafd5, %l0 = 00000000ffff0000
	ldstub	[%o0+0x001],%l0		! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = 000000ff, %l5 = 00000000000000ff
	ldub	[%i4+0x019],%l5		! %l5 = 0000000000000000

!	Check Point 46 for processor 0

	set	p0_check_pt_data_46,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ff00000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000035
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000066
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = fffffff2 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = f86ccfd5 ff7de6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 46 completed


p0_label_231:
!	Mem[0000000010041408] = 516fa616 ff002200, %l0 = 000000ff, %l1 = 000000ff
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000ff002200 00000000516fa616
!	Mem[0000000010181410] = 00000000ffffffff, %l5 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010141428] = 16a66f51, %l1 = 00000000516fa616
	lduha	[%i5+0x02a]%asi,%l1	! %l1 = 0000000000006f51
!	Mem[0000000010041408] = 002200ff, %l7 = 0000000000000035
	ldsba	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = ffffffff, %l0 = 00000000ff002200
	lduh	[%i6+0x012],%l0		! %l0 = 000000000000ffff
!	Mem[000000001014140c] = 000000ff, %l0 = 000000000000ffff
	ldsb	[%i5+0x00d],%l0		! %l0 = 0000000000000000
!	Mem[0000000030181408] = 000000ff, %l3 = 00000000000000ff
	ldsha	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 00007d03, %l0 = 0000000000000000
	ldsba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 516fa616, %l3 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 00000000516fa616
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000006f51, Mem[0000000010141430] = 35d3531a
	sth	%l1,[%i5+0x030]		! Mem[0000000010141430] = 6f51531a

p0_label_232:
!	Mem[0000000030081410] = 00000000, %l5 = 00000000ffffffff
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%f21 = ffff0000, Mem[0000000010141410] = ffffffe6
	sta	%f21,[%i5+%o5]0x80	! Mem[0000000010141410] = ffff0000
!	%l5 = 0000000000000000, Mem[0000000030141400] = 00000000
	stha	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%f6  = 00000000 00000066, Mem[0000000010001418] = ff00d500 000000ff
	std	%f6 ,[%i0+0x018]	! Mem[0000000010001418] = 00000000 00000066
!	%f0  = ff000000 516fa616 ff000000 ffffff3d
!	%f4  = 00000000 000000ff 00000000 00000066
!	%f8  = ed34871b 037de60a d0ea0000 40625eff
!	%f12 = fffffff2 00000000 00000000 ffffffff
	stda	%f0,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	%f24 = 00000000, Mem[0000000030181410] = ff000000
	sta	%f24,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%f30 = aa9d0000, Mem[00000000100c1438] = 8dff72e3
	st	%f30,[%i3+0x038]	! Mem[00000000100c1438] = aa9d0000
!	%l2 = ff00000000000000, Mem[00000000100c1400] = 0cb9ead0
	stba	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00b9ead0
!	%f17 = 00000000, Mem[0000000010141430] = 6f51531a
	sta	%f17,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000 3d7be6ff, %l6 = ff520000, %l7 = 00000000
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000 000000003d7be6ff

p0_label_233:
!	Mem[0000000010181428] = 00000000, %l5 = 0000000000000000
	lduwa	[%i6+0x028]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 000000ff, %l3 = 00000000516fa616
	lduwa	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = ffa322cb, %f29 = d0eab90c
	lda	[%i2+%g0]0x81,%f29	! %f29 = ffa322cb
!	Mem[0000000010041410] = ffd3531a, %l2 = ff00000000000000
	lduha	[%i1+%o5]0x80,%l2	! %l2 = 000000000000ffd3
!	Mem[0000000030041400] = 3d7be6ff, %l6 = 0000000000000000
	ldsba	[%i1+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141400] = 00007b3d, %l1 = 0000000000006f51
	ldsha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff, %l4 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = cb22a3ff, %f27 = ff7de6ff
	lda	[%i2+%g0]0x89,%f27	! %f27 = cb22a3ff
!	Mem[0000000010141400] = 52f578f73d7b0000, %l1 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = 52f578f73d7b0000
!	Starting 10 instruction Store Burst
!	%f16 = 00000016 00000000 8dff72e3 785462bf
!	%f20 = 00000000 ffff0000 16a66f51 1a53d335
!	%f24 = 00000000 000000ff f86ccfd5 cb22a3ff
!	%f28 = 00000017 ffa322cb aa9d0000 00000000
	stda	%f16,[%i6]ASI_COMMIT_S	! Block Store to 0000000030181400

p0_label_234:
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010141408] = d0eab90c 000000ff
	stda	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff 00000000
!	Mem[0000000010041400] = 00000000, %l1 = 52f578f73d7b0000
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%l7 = 000000003d7be6ff, Mem[00000000100c1408] = ff000000
	stwa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 3d7be6ff
!	%f6  = 00000000 00000066, %l7 = 000000003d7be6ff
!	Mem[0000000010081418] = 0000000000000000
	add	%i2,0x018,%g1
	stda	%f6,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010081418] = 6600000000000000
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000010001400] = ff7de60a, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 0000000a000000ff
!	%l3 = 00000000000000ff, Mem[0000000030101408] = 1b8734ed
	stwa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	Mem[00000000100c142c] = b75cd9da, %l0 = 0000000000000000
	swap	[%i3+0x02c],%l0		! %l0 = 00000000b75cd9da
!	%l6 = ffffffff, %l7 = 3d7be6ff, Mem[0000000010141408] = 000000ff 00000000
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffff 3d7be6ff
!	%f28 = 00000017, Mem[00000000100c1400] = d0eab900
	sta	%f28,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000017
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000ffff000000, %l3 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = 000000ffff000000

p0_label_235:
!	Mem[00000000300c1410] = 0000000000000000, %l5 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141418] = 16a66f51, %l3 = 000000ffff000000
	ldsh	[%i5+0x01a],%l3		! %l3 = 0000000000006f51
!	Mem[0000000010181418] = d0ea000040625eff, %l1 = 000000000000000a
	ldxa	[%i6+0x018]%asi,%l1	! %l1 = d0ea000040625eff
!	Mem[0000000010181400] = 7200000016a66f51, %l6 = ffffffffffffffff
	ldxa	[%i6+%g0]0x88,%l6	! %l6 = 7200000016a66f51
!	Mem[0000000010141408] = ffffffff, %l3 = 0000000000006f51
	lduwa	[%i5+%o4]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010181400] = 516fa616 00000072, %l6 = 16a66f51, %l7 = 3d7be6ff
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000516fa616 0000000000000072
!	Mem[0000000030001400] = 000000ff, %l3 = 00000000ffffffff
	ldsha	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101434] = 00000000, %f27 = cb22a3ff
	ld	[%i4+0x034],%f27	! %f27 = 00000000
!	Mem[00000000300c1400] = 000000ff, %l6 = 00000000516fa616
	ldswa	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000030081408] = f86ccfd5ff7de6ff
	stxa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000ff

!	Check Point 47 for processor 0

	set	p0_check_pt_data_47,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000b75cd9da
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = d0ea000040625eff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000ffd3
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000072
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 516fa616
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000066
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = f86ccfd5 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x60],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000017 ffa322cb
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 47 completed


p0_label_236:
!	%l6 = 00000000000000ff, Mem[0000000010001428] = 00007be300000000, %asi = 80
	stxa	%l6,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[000000001010141c] = 000000ff
	stw	%l6,[%i4+0x01c]		! Mem[000000001010141c] = 000000ff
!	%l0 = b75cd9da, %l1 = 40625eff, Mem[0000000010041400] = ff000000 000000ff
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = b75cd9da 40625eff
!	Mem[0000000010181400] = 516fa616, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000051000000ff
!	Mem[0000000030101400] = 00000077, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000077
!	Mem[0000000010001431] = ff00ff3d, %l7 = 0000000000000072
	ldstuba	[%i0+0x031]%asi,%l7	! %l7 = 00000000000000ff
!	%l0 = 00000000b75cd9da, Mem[0000000010141408] = ffe67b3dffffffff
	stxa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000b75cd9da
!	%l7 = 0000000000000000, Mem[00000000100c1410] = 000000ff
	stba	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l3 = 00000000000000ff, Mem[0000000030141410] = ff520000
	stha	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 52f578f73d7b0000, %l6 = 0000000000000077
	ldxa	[%i5+%g0]0x88,%l6	! %l6 = 52f578f73d7b0000

p0_label_237:
!	Mem[0000000030101410] = 00000000, %l0 = 00000000b75cd9da
	ldsha	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1420] = 398f9601 ff000000, %l0 = 00000000, %l1 = 40625eff
	ldd	[%i3+0x020],%l0		! %l0 = 00000000398f9601 00000000ff000000
!	Mem[0000000010101408] = 037d0000, %f12 = fffffff2
	lda	[%i4+%o4]0x88,%f12	! %f12 = 037d0000
!	Mem[0000000010181420] = a509aa5e, %l1 = 00000000ff000000
	ldsw	[%i6+0x020],%l1		! %l1 = ffffffffa509aa5e
!	Mem[0000000010101408] = 037d0000, %l0 = 00000000398f9601
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[000000001004140c] = 16a66f51, %f17 = 00000000
	lda	[%i1+0x00c]%asi,%f17	! %f17 = 16a66f51
!	Mem[0000000020800040] = ffffe589, %l0 = 0000000000000000
	lduba	[%o1+0x041]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1400] = 000000ff00000017, %f16 = 00000016 16a66f51
	ldda	[%i3+%g0]0x88,%f16	! %f16 = 000000ff 00000017
!	Mem[0000000010001410] = f2ffff00, %l5 = 0000000000000051
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffa509aa5e, Mem[0000000010141410] = 0000ffff
	stwa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = a509aa5e

p0_label_238:
!	%l4 = 00000000000000ff, Mem[0000000030001410] = 00000000
	stba	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	%f27 = 00000000, Mem[0000000030081408] = 000000ff
	sta	%f27,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%f24 = 00000000 000000ff, Mem[0000000010141408] = dad95cb7 00000000
	stda	%f24,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 000000ff
!	%f12 = 037d0000 00000000, %l6 = 52f578f73d7b0000
!	Mem[0000000030181408] = 8dff72e3785462bf
	add	%i6,0x008,%g1
	stda	%f12,[%g1+%l6]ASI_PST8_S ! Mem[0000000030181408] = 8dff72e3785462bf
!	%f26 = f86ccfd5, Mem[0000000030001408] = ff000000
	sta	%f26,[%i0+%o4]0x81	! Mem[0000000030001408] = f86ccfd5
!	%f0  = ff000000 516fa616, Mem[0000000010001400] = ffe67dff d5cf6cf8
	stda	%f0 ,[%i0+%g0]0x80	! Mem[0000000010001400] = ff000000 516fa616
!	%l6 = 52f578f73d7b0000, Mem[00000000300c1410] = 00000000
	stba	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%f26 = f86ccfd5 00000000, Mem[00000000100c1408] = 3d7be6ff 000000ff
	stda	%f26,[%i3+%o4]0x80	! Mem[00000000100c1408] = f86ccfd5 00000000
!	%f16 = 000000ff 00000017 8dff72e3 785462bf
!	%f20 = 00000000 ffff0000 16a66f51 1a53d335
!	%f24 = 00000000 000000ff f86ccfd5 00000000
!	%f28 = 00000017 ffa322cb aa9d0000 00000000
	stda	%f16,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000 ff000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 00000000ff000000 0000000000000000

p0_label_239:
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000010041400] = 17000000ff000000, %f10 = d0ea0000 40625eff
	ldda	[%i1+%g0]0x88,%f10	! %f10 = 17000000 ff000000
!	Mem[0000000010081410] = 000000ff, %l2 = 000000000000ffd3
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800040] = ffffe589, %l5 = 0000000000000000
	ldub	[%o1+0x040],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030001410] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = ff000000, %l0 = 00000000000000ff
	ldsba	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 00ffafd5, %l1 = ffffffffa509aa5e
	lduh	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030101408] = 000000ff, %l6 = 52f578f73d7b0000
	ldswa	[%i4+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001408] = 00009daa9f91163e, %f2  = ff000000 ffffff3d
	ldd	[%i0+%o4],%f2 		! %f2  = 00009daa 9f91163e
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1414] = 00000000, %l4 = 00000000ff000000
	swap	[%i3+0x014],%l4		! %l4 = 0000000000000000

p0_label_240:
!	%l6 = 00000000000000ff, Mem[0000000030181400] = 16000000
	stwa	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	%l4 = 0000000000000000, Mem[0000000010181400] = 16a66fff
	stwa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[0000000030081400] = ffa322cb, %l3 = 00000000000000ff
	ldstuba	[%i2+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	%f10 = 17000000 ff000000, Mem[0000000030141408] = f2ffffff 5f424410
	stda	%f10,[%i5+%o4]0x89	! Mem[0000000030141408] = 17000000 ff000000
!	%f18 = 8dff72e3 785462bf, Mem[0000000030141400] = 00000000 35000000
	stda	%f18,[%i5+%g0]0x89	! Mem[0000000030141400] = 8dff72e3 785462bf
!	Mem[0000000010001400] = ff000000, %l1 = 00000000000000ff
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ff000000
!	%f2  = 00009daa 9f91163e, Mem[0000000010081408] = fd000000 ffffffff
	stda	%f2 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 00009daa 9f91163e
!	%l3 = 00000000000000ff, Mem[00000000201c0000] = 00ffafd5, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ffafd5
!	%f30 = aa9d0000 00000000, %l2 = 0000000000000000
!	Mem[00000000100c1420] = 398f9601ff000000
	add	%i3,0x020,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_PL ! Mem[00000000100c1420] = 398f9601ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = f86ccfd5, %l3 = 00000000000000ff
	lduha	[%i0+%o4]0x81,%l3	! %l3 = 000000000000f86c

!	Check Point 48 for processor 0

	set	p0_check_pt_data_48,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000f86c
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 516fa616
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00009daa 9f91163e
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 17000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 037d0000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 000000ff 00000017
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1

!	Check Point 48 completed


p0_label_241:
!	Mem[000000001008143c] = ffe67b3d, %l3 = 000000000000f86c
	lduw	[%i2+0x03c],%l3		! %l3 = 00000000ffe67b3d
!	Mem[00000000300c1400] = ff000000516fa616, %f30 = aa9d0000 00000000
	ldda	[%i3+%g0]0x81,%f30	! %f30 = ff000000 516fa616
!	Mem[0000000030181400] = 000000ff, %l1 = 00000000ff000000
	ldsba	[%i6+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181408] = ff000000, %f10 = 17000000
	lda	[%i6+%o4]0x88,%f10	! %f10 = ff000000
!	Mem[0000000010081410] = 000000ff, %f3  = 9f91163e
	lda	[%i2+%o5]0x80,%f3 	! %f3 = 000000ff
!	Mem[00000000201c0000] = 00ffafd5, %l3 = 00000000ffe67b3d
	ldsh	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010101408] = 00007d03, %l7 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = 000000ffa509aa5e, %l1 = ffffffffffffffff
	ldxa	[%i5+%o5]0x88,%l1	! %l1 = 000000ffa509aa5e
!	Mem[0000000030001408] = 3dffffff d5cf6cf8, %l0 = 00000000, %l1 = a509aa5e
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000d5cf6cf8 000000003dffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = e372ff8d, %l0 = 00000000d5cf6cf8
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 00000000e372ff8d

p0_label_242:
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = 00fffff2, %l7 = 0000000000000000, %asi = 80
	swapa	[%i0+0x010]%asi,%l7	! %l7 = 0000000000fffff2
!	Mem[0000000030081400] = cb22a3ff, %l5 = 00000000000000ff
	lduwa	[%i2+%g0]0x89,%l5	! %l5 = 00000000cb22a3ff
!	%l6 = 00000000000000ff, Mem[0000000030181408] = 8dff72e3
	stba	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = ffff72e3
!	%l4 = 00000000, %l5 = cb22a3ff, Mem[0000000010101430] = 00000000 00000000
	stda	%l4,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000 cb22a3ff
!	%l5 = 00000000cb22a3ff, Mem[0000000010081408] = 00009daa9f91163e
	stxa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000cb22a3ff
!	%l0 = 00000000e372ff8d, Mem[0000000030041400] = 3d7be6ff
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = e372ff8d
!	%l4 = 0000000000000000, Mem[0000000010181408] = 000000ff
	stha	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff
!	Mem[0000000030181408] = e372ffff, %l0 = 00000000e372ff8d
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 00000000e372ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000000000ff, %l2 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000ff

p0_label_243:
!	Mem[0000000010101400] = ff000000, %l7 = 0000000000fffff2
	ldswa	[%i4+%g0]0x80,%l7	! %l7 = ffffffffff000000
!	Mem[0000000010041408] = f86ccfd5785462bf, %l7 = ffffffffff000000
	ldxa	[%i1+0x008]%asi,%l7	! %l7 = f86ccfd5785462bf
!	Mem[0000000010181408] = 000000ff, %l2 = 00000000000000ff
	lduwa	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l7 = f86ccfd5785462bf
	lduha	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = 00000000000052ff, %f2  = 00009daa 000000ff
	ldda	[%i1+%o5]0x89,%f2 	! %f2  = 00000000 000052ff
!	Mem[0000000010001410] = 0000000000000000, %f6  = 00000000 00000066
	ldda	[%i0+%o5]0x80,%f6 	! %f6  = 00000000 00000000
!	Mem[000000001014143c] = ff000000, %l5 = 00000000cb22a3ff
	lduh	[%i5+0x03c],%l5		! %l5 = 000000000000ff00
!	Mem[00000000201c0000] = 00ffafd5, %l2 = 00000000000000ff
	ldub	[%o0+%g0],%l2		! %l2 = 0000000000000000
!	Mem[00000000100c1424] = ff000000, %l7 = 0000000000000000
	ldub	[%i3+0x024],%l7		! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f22 = 16a66f51 1a53d335, Mem[0000000030181408] = e372ff8d bf625478
	stda	%f22,[%i6+%o4]0x89	! Mem[0000000030181408] = 16a66f51 1a53d335

p0_label_244:
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030041408] = d0eab9ff ffffffff
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 00000000
!	%f16 = 000000ff, Mem[0000000010001408] = 00009daa
	sta	%f16,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff
!	%l7 = 00000000000000ff, Mem[0000000030141410] = 00ff0000
	stwa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff
!	%f18 = 8dff72e3, Mem[0000000030181410] = 00000000
	sta	%f18,[%i6+%o5]0x81	! Mem[0000000030181410] = 8dff72e3
!	Mem[0000000030041410] = 000052ff, %l5 = 000000000000ff00
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%l6 = 000000ff, %l7 = 000000ff, Mem[00000000100c1408] = f86ccfd5 00000000
	stda	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff 000000ff
!	%l3 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stwa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010181400] = 00000000, %l0 = 00000000e372ffff
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 000000ff, %l4 = 0000000000000000
	lduwa	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 5eaa09a5ff000000, %f20 = 00000000 ffff0000
	ldda	[%i5+%o5]0x80,%f20	! %f20 = 5eaa09a5 ff000000

p0_label_245:
!	Mem[0000000020800000] = c9ffbb34, %l0 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 000000000000c9ff
!	Mem[0000000020800040] = ffffe589, %l5 = 00000000000000ff
	lduh	[%o1+0x040],%l5		! %l5 = 000000000000ffff
!	Mem[00000000100c1400] = 00000017, %l1 = 000000003dffffff
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000017
!	Mem[00000000201c0000] = 00ffafd5, %l7 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101408] = 00007d0300000000, %f26 = f86ccfd5 00000000
	ldd	[%i4+%o4],%f26		! %f26 = 00007d03 00000000
!	Mem[00000000100c1408] = 000000ff, %f2  = 00000000
	lda	[%i3+%o4]0x80,%f2 	! %f2 = 000000ff
!	Mem[00000000300c1410] = 00000000, %l2 = 0000000000000000
	ldswa	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001418] = 00000000, %f5  = 000000ff
	ld	[%i0+0x018],%f5 	! %f5 = 00000000
!	Mem[0000000030181408] = 35d3531a, %f9  = 037de60a
	lda	[%i6+%o4]0x81,%f9 	! %f9 = 35d3531a
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[00000000100c1410] = ff000000
	stwa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000

!	Check Point 49 for processor 0

	set	p0_check_pt_data_49,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000c9ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000017
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 516fa616
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 000000ff 000052ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ed34871b 35d3531a
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 5eaa09a5 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00007d03 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x80],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff000000 516fa616
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 49 completed


p0_label_246:
!	%f0  = ff000000 516fa616 000000ff 000052ff
!	%f4  = 00000000 00000000 00000000 00000000
!	%f8  = ed34871b 35d3531a ff000000 ff000000
!	%f12 = 037d0000 00000000 00000000 ffffffff
	stda	%f0,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	%l4 = 000000ff, %l5 = 0000ffff, Mem[00000000300c1408] = 000000ff 3dffffff
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff 0000ffff
!	%l7 = 00000000000000ff, Mem[0000000010081408] = cb22a3ff
	stha	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = cb2200ff
!	Mem[0000000010181410] = ffffffff, %l0 = 000000000000c9ff
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000010001410] = 00000000, %asi = 80
	stwa	%l3,[%i0+0x010]%asi	! Mem[0000000010001410] = 00000000
!	%f25 = 000000ff, Mem[0000000010181418] = d0ea0000
	st	%f25,[%i6+0x018]	! Mem[0000000010181418] = 000000ff
!	%l6 = 00000000000000ff, Mem[00000000100c1408] = 000000ff
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ff00ff
!	%f18 = 8dff72e3 785462bf, Mem[0000000010041408] = ff000000 ff520000
	stda	%f18,[%i1+%o4]0x88	! Mem[0000000010041408] = 8dff72e3 785462bf
!	Mem[0000000030081408] = 00000000, %l0 = 00000000000000ff
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff0022cb 00000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000ff0022cb 0000000000000000

p0_label_247:
!	Mem[0000000010101410] = d0eab90c, %l7 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l7	! %l7 = ffffffffffffb90c
!	Mem[00000000300c1408] = 000000ff, %l7 = ffffffffffffb90c
	lduwa	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010041404] = 516fa616, %l3 = 0000000000000000
	ldub	[%i1+0x007],%l3		! %l3 = 0000000000000016
!	Mem[0000000010041408] = bf625478e372ff8d, %l7 = 00000000000000ff
	ldxa	[%i1+%o4]0x80,%l7	! %l7 = bf625478e372ff8d
!	Mem[0000000010101418] = 000000ff000000ff, %f0  = ff000000 516fa616
	ldda	[%i4+0x018]%asi,%f0 	! %f0  = 000000ff 000000ff
!	Mem[0000000010101410] = 0cb9ead000000000, %f26 = 00007d03 00000000
	ldd	[%i4+%o5],%f26		! %f26 = 0cb9ead0 00000000
!	Mem[0000000010081408] = ff0022cb, %l3 = 0000000000000016
	ldsha	[%i2+%o4]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010081400] = 000000ff, %l4 = 00000000000000ff
	ldsba	[%i2+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081408] = ff0022cb, %l6 = 00000000ff0022cb
	lduha	[%i2+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%f16 = 000000ff 00000017, %l0 = 0000000000000000
!	Mem[0000000030141408] = 000000ff00000017
	add	%i5,0x008,%g1
	stda	%f16,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030141408] = 000000ff00000017

p0_label_248:
!	Mem[0000000030141400] = 785462bf, %l4 = ffffffffffffffff
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 00000000785462bf
!	Mem[000000001004141c] = 00000000, %l4 = 00000000785462bf
	swap	[%i1+0x01c],%l4		! %l4 = 0000000000000000
!	Mem[0000000020800040] = ffffe589, %l0 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 000000ff000000ff
!	%f8  = ed34871b 35d3531a, Mem[0000000010101428] = 3bffdb8a 0000003e
	stda	%f8 ,[%i4+0x028]%asi	! Mem[0000000010101428] = ed34871b 35d3531a
!	Mem[00000000100c1400] = 00000017, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 00000017000000ff
!	Mem[0000000030101400] = ff000000, %l6 = 000000000000ff00
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010181434] = ffe67b3d, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x034]%asi,%l0	! %l0 = 00000000ffe67b3d
!	%f26 = 0cb9ead0 00000000, %l1 = 0000000000000017
!	Mem[0000000010101400] = ff0000000ae67dff
	stda	%f26,[%i4+%l1]ASI_PST32_P ! Mem[0000000010101400] = 0cb9ead000000000
!	%l0 = ffe67b3d, %l1 = 00000017, Mem[0000000030141400] = ffffffff 8dff72e3
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = ffe67b3d 00000017
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff000000, %l0 = 00000000ffe67b3d
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 000000000000ff00

p0_label_249:
!	Mem[0000000030181400] = ff000000, %l0 = 000000000000ff00
	ldswa	[%i6+%g0]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000020800040] = ffffe589, %l4 = 0000000000000017
	ldsh	[%o1+0x040],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030101408] = 000000ff, %l5 = 000000000000ffff
	ldswa	[%i4+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 0000000000000000, %l2 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l7 = bf625478e372ff8d
	lduha	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 000000ff, %l6 = 00000000000000ff
	lduha	[%i1+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = 00ffafd5, %l1 = 0000000000000017
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 000000ff, %l2 = 0000000000000000
	lduha	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181430] = ffffffff 000000ff, %l6 = 000000ff, %l7 = 00000000
	ldd	[%i6+0x030],%l6		! %l6 = 00000000ffffffff 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffff00, Mem[00000000201c0000] = 00ffafd5
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = ff00afd5

p0_label_250:
!	%l7 = 00000000000000ff, Mem[0000000030001408] = f86ccfd5
	stwa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff
!	Mem[000000001014141c] = a7740b98, %l0 = ffffffffff000000, %asi = 80
	swapa	[%i5+0x01c]%asi,%l0	! %l0 = 00000000a7740b98
!	Mem[0000000010041408] = bf625478, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 000000bf000000ff
!	%f26 = 0cb9ead0 00000000, %l3 = ffffffffffffff00
!	Mem[0000000010001428] = 00000000000000ff
	add	%i0,0x028,%g1
	stda	%f26,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010001428] = 00000000000000ff
!	%f14 = 00000000, Mem[0000000010081400] = ff000000
	sta	%f14,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%l4 = ffffffffffffffff, Mem[0000000030141408] = ff000000
	stba	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = ff0000ff
!	%f15 = ffffffff, Mem[0000000010101410] = d0eab90c
	sta	%f15,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff
!	Mem[0000000010181400] = ffff72e3, %l6 = 00000000ffffffff
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 00000000ffff72e3
!	Mem[00000000100c1408] = ff00ff00, %l4 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = 97ff0ae8, %l0 = 00000000a7740b98
	lduha	[%o3+0x100]%asi,%l0	! %l0 = 00000000000097ff

!	Check Point 50 for processor 0

	set	p0_check_pt_data_50,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000097ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000bf
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffff00
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffff72e3
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 0cb9ead0 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 50 completed


p0_label_251:
!	Mem[00000000201c0000] = ff00afd5, %l2 = 00000000000000bf
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000030101400] = ff000000 0000ffff 000000ff ff000000
!	Mem[0000000030101410] = 00000000 00000000 99222fbf d1e047ee
!	Mem[0000000030101420] = e3583621 2cced994 2dee399f 47c2c6a4
!	Mem[0000000030101430] = e3dfa430 a3429ce0 ebc7bffd d0a5e0d1
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[0000000030101410] = 0000000000000000, %l4 = 0000000000000000
	ldxa	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = 16a66f51 ff000000, %l2 = 00000000, %l3 = ffffff00
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 00000000ff000000 0000000016a66f51
!	Mem[0000000010181408] = 000000ff, %l5 = 00000000000000ff
	ldsha	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l2 = 00000000ff000000
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%l3 = 0000000016a66f51, Mem[0000000030181408] = 1a53d335
	stba	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 1a53d351
!	Mem[0000000010101408] = 037d0000, %l5 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[000000001000143c] = 000000ff, %f31 = 516fa616
	ld	[%i0+0x03c],%f31	! %f31 = 000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010101428] = ed34871b 35d3531a
	std	%l4,[%i4+0x028]		! Mem[0000000010101428] = 00000000 00000000

p0_label_252:
!	%l6 = ffff72e3, %l7 = 000000ff, Mem[00000000100c1400] = 000000ff 000000ff
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffff72e3 000000ff
!	%f16 = 000000ff 00000017, Mem[0000000030081410] = ffffffff 0000ffff
	stda	%f16,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff 00000017
!	Mem[0000000030041400] = 8dff72e3, %l3 = 0000000016a66f51
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 0000008d000000ff
!	%l6 = 00000000ffff72e3, Mem[0000000030181410] = 8dff72e3
	stha	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 72e372e3
!	%l5 = 0000000000000000, Mem[00000000300c1400] = 000000ff
	stba	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010001410] = 00000000
	stwa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010041400] = 000000ff
	stha	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Mem[0000000021800100] = 97ff0ae8, %l7 = 00000000000000ff
	ldstuba	[%o3+0x100]%asi,%l7	! %l7 = 00000097000000ff
!	%f26 = 0cb9ead0, Mem[0000000010141410] = a509aa5e
	sta	%f26,[%i5+%o5]0x88	! Mem[0000000010141410] = 0cb9ead0
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %l0 = 00000000000097ff
	ldsha	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_253:
!	Mem[0000000030001400] = 000000ff, %l3 = 000000000000008d
	ldsha	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = ff000000, %l3 = 00000000000000ff
	ldswa	[%i2+%o5]0x88,%l3	! %l3 = ffffffffff000000
!	Mem[0000000010101404] = 00000000, %l1 = 0000000000000000
	ldswa	[%i4+0x004]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001428] = 00000000 000000ff, %l2 = 00000000, %l3 = ff000000
	ldda	[%i0+0x028]%asi,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l0 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = ffff72e3, %l5 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001400] = 000000ff, %l4 = 0000000000000000
	ldsb	[%i0+0x001],%l4		! %l4 = 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l6 = 00000000ffff72e3
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 00007d03, %l4 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ffffffff, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 000000ff000000ff

p0_label_254:
!	%l1 = 0000000000000000, Mem[0000000010181400] = ffffffff
	stha	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = ffff0000
!	%f16 = 000000ff, Mem[0000000030081410] = 00000017
	sta	%f16,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	Mem[0000000010181400] = 0000ffff, %l5 = ffffffffffffffff
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 000000000000ffff
!	%l6 = 00000000, %l7 = 00000097, Mem[0000000010081400] = 00000000 2d000000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 00000097
!	Mem[00000000100c1408] = ffff00ff, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stwa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	%l5 = 000000000000ffff, Mem[0000000010141408] = 00000000
	stba	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = ff000000
!	Mem[000000001014143c] = ff000000, %l4 = 0000000000000000
	ldstub	[%i5+0x03c],%l4		! %l4 = 000000ff000000ff
!	%f18 = 8dff72e3 785462bf, Mem[0000000030181410] = 72e372e3 ffff0000
	stda	%f18,[%i6+%o5]0x81	! Mem[0000000030181410] = 8dff72e3 785462bf
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff0000ff, %f3  = ff000000
	lda	[%i5+%o4]0x81,%f3 	! %f3 = ff0000ff

p0_label_255:
!	Mem[0000000010181408] = 000000ff00000000, %l2 = 00000000000000ff
	ldx	[%i6+%o4],%l2		! %l2 = 000000ff00000000
!	Mem[0000000010001434] = 2d0064b3, %l3 = 00000000000000ff
	ldsha	[%i0+0x036]%asi,%l3	! %l3 = 00000000000064b3
!	Mem[0000000030001410] = 000000ff, %l0 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1420] = 398f9601, %l5 = 000000000000ffff
	lduha	[%i3+0x020]%asi,%l5	! %l5 = 000000000000398f
!	Mem[0000000010041400] = 00000000, %l1 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800140] = 72ff9071, %l4 = 00000000000000ff
	ldsh	[%o3+0x140],%l4		! %l4 = 00000000000072ff
!	Mem[0000000010001410] = 00000000, %f6  = 99222fbf
	lda	[%i0+%o5]0x80,%f6 	! %f6 = 00000000
!	Mem[0000000030001400] = 000000ff, %l2 = 000000ff00000000
	ldsba	[%i0+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041408] = 00000000 00000000, %l4 = 000072ff, %l5 = 0000398f
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = ff000000, Mem[000000001008140c] = 00000000
	st	%f30,[%i2+0x00c]	! Mem[000000001008140c] = ff000000

!	Check Point 51 for processor 0

	set	p0_check_pt_data_51,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000064b3
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000097
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 000000ff ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 d1e047ee
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = e3583621 2cced994
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 2dee399f 47c2c6a4
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = e3dfa430 a3429ce0
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ebc7bffd d0a5e0d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 51 completed


p0_label_256:
!	Mem[0000000010181410] = ffffffff00000000, %l0 = 00000000000000ff, %l2 = ffffffffffffffff
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l0,%l2	! %l2 = ffffffff00000000
!	Mem[0000000030101408] = 000000ff, %l2 = ffffffff00000000
	swapa	[%i4+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030001408] = ff000000
	stwa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
!	%f2  = 000000ff ff0000ff, %l5 = 0000000000000000
!	Mem[00000000300c1428] = d0ea000040625eff
	add	%i3,0x028,%g1
	stda	%f2,[%g1+%l5]ASI_PST32_SL ! Mem[00000000300c1428] = d0ea000040625eff
!	Mem[0000000010041400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%f8  = e3583621, Mem[0000000030001400] = 000000ff
	sta	%f8 ,[%i0+%g0]0x89	! Mem[0000000030001400] = e3583621
!	%l5 = 0000000000000000, Mem[0000000010041410] = 00000000
	stha	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	Mem[0000000010101400] = d0eab90c, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l4	! %l4 = 0000000c000000ff
!	%l3 = 00000000000064b3, Mem[0000000030041400] = e372ffff
	stba	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = e372ffb3
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 0000000000000000, %f6  = 00000000 d1e047ee
	ldda	[%i1+%o4]0x81,%f6 	! %f6  = 00000000 00000000

p0_label_257:
!	Mem[0000000010181400] = ffffffff, %l4 = 000000000000000c
	lduba	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101410] = ffffffff00000000, %f12 = e3dfa430 a3429ce0
	ldda	[%i4+%o5]0x80,%f12	! %f12 = ffffffff 00000000
!	Mem[0000000030101408] = 00000000, %l2 = 00000000000000ff
	ldsba	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 000000ff9f91163e, %l3 = 00000000000064b3
	ldxa	[%i0+%o4]0x80,%l3	! %l3 = 000000ff9f91163e
!	Mem[00000000100c1414] = ff000000, %f14 = ebc7bffd
	ld	[%i3+0x014],%f14	! %f14 = ff000000
!	Mem[0000000010181430] = ffffffff 000000ff, %l4 = 000000ff, %l5 = 00000000
	ldd	[%i6+0x030],%l4		! %l4 = 00000000ffffffff 00000000000000ff
!	Mem[00000000100c1410] = 000000ff00000000, %l1 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l1	! %l1 = 000000ff00000000
!	Mem[0000000030041400] = b3ff72e3, %l3 = 000000ff9f91163e
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 00000000b3ff72e3
!	Mem[00000000300c1410] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (48)
!	%l7 = 0000000000000097, Mem[0000000030101410] = 0000000000000000
	stxa	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000097

p0_label_258:
!	Mem[0000000030041410] = 000052ff, %l1 = 000000ff00000000
	ldstuba	[%i1+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 00000097, Mem[0000000010041400] = 000000ff 16a66f51
	stda	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 00000097
!	%l5 = 00000000000000ff, Mem[00000000211c0000] = ffffe4d2
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00ffe4d2
!	%f15 = d0a5e0d1, Mem[0000000010181408] = 000000ff
	sta	%f15,[%i6+%o4]0x80	! Mem[0000000010181408] = d0a5e0d1
!	%f22 = 16a66f51 1a53d335, %l4 = 00000000ffffffff
!	Mem[0000000010141430] = 0000000034e6f7ff
	add	%i5,0x030,%g1
	stda	%f22,[%g1+%l4]ASI_PST8_P ! Mem[0000000010141430] = 16a66f511a53d335
!	%l1 = 00000000000000ff, Mem[000000001004140b] = ff625478, %asi = 80
	stba	%l1,[%i1+0x00b]%asi	! Mem[0000000010041408] = ff6254ff
!	%l6 = 0000000000000000, Mem[0000000010141410] = 0cb9ead0
	stwa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Mem[000000001004143b] = 00000000, %l4 = 00000000ffffffff
	ldstuba	[%i1+0x03b]%asi,%l4	! %l4 = 00000000000000ff
!	%f22 = 16a66f51, Mem[0000000010141430] = 16a66f51
	st	%f22,[%i5+0x030]	! Mem[0000000010141430] = 16a66f51
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = e372ffff, %l7 = 0000000000000097
	lduba	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000e3

p0_label_259:
!	Mem[0000000010181408] = d1e0a5d0, %l4 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l4	! %l4 = ffffffffffffa5d0
!	Mem[0000000030001400] = 213658e3, %l2 = 0000000000000000
	lduha	[%i0+%g0]0x81,%l2	! %l2 = 0000000000002136
!	Mem[00000000300c1400] = 00000000 516fa616, %l6 = 00000000, %l7 = 000000e3
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000 00000000516fa616
!	Mem[00000000100c1400] = e372ffff, %l5 = 00000000000000ff
	ldsha	[%i3+%g0]0x80,%l5	! %l5 = ffffffffffffe372
!	Mem[0000000030041410] = ff520000 00000000, %l6 = 00000000, %l7 = 516fa616
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 00000000ff520000 0000000000000000
!	Mem[0000000030181408] = 51d3531a, %l1 = 00000000000000ff
	ldsba	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000051
!	Mem[00000000100c1400] = e372ffff, %f18 = 8dff72e3
	lda	[%i3+%g0]0x80,%f18	! %f18 = e372ffff
!	Mem[0000000030001400] = 213658e3, %l1 = 0000000000000051
	lduba	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000021
!	Mem[0000000010081410] = ff000000, %l0 = 0000000000000000
	lduwa	[%i2+%o5]0x88,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000021
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_260:
!	Mem[0000000010001418] = 0000000000000066, %l4 = ffffffffffffa5d0, %l2 = 0000000000002136
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 0000000000000066
!	Mem[0000000030041410] = ff520000, %l6 = 00000000ff520000
	swapa	[%i1+%o5]0x81,%l6	! %l6 = 00000000ff520000
!	Mem[0000000010001438] = 62ef3c78000000ff, %l0 = 00000000ff000000, %l0 = 00000000ff000000
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l0,%l0	! %l0 = 62ef3c78000000ff
!	Mem[0000000030181400] = 000000ff, %l0 = 62ef3c78000000ff
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	%l3 = 00000000b3ff72e3, immed = 0000086e, %y  = fffffff0
	umul	%l3,0x86e,%l0		! %l0 = 000005ed535a758a, %y = 000005ed
!	Mem[0000000030181400] = 000000ff, %l5 = ffffffffffffe372
	ldstuba	[%i6+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010101410] = ffffffff
	stba	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffff
!	%f20 = 5eaa09a5 ff000000, %l3 = 00000000b3ff72e3
!	Mem[0000000010181418] = 000000ff40625eff
	add	%i6,0x018,%g1
	stda	%f20,[%g1+%l3]ASI_PST32_P ! Mem[0000000010181418] = 5eaa09a5ff000000
!	Mem[0000000010141410] = 00000000, %l6 = 00000000ff520000
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffffffff, %l0 = 000005ed535a758a
	ldsha	[%i6+%g0]0x88,%l0	! %l0 = ffffffffffffffff

!	Check Point 52 for processor 0

	set	p0_check_pt_data_52,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000066
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000b3ff72e3
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffa5d0
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ffffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 d0a5e0d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = e372ffff 785462bf
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1

!	Check Point 52 completed


p0_label_261:
!	Mem[0000000010141400] = 3d7b0000, %l3 = 00000000b3ff72e3
	lduha	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000066
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = e372ffb3, %l3 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l3	! %l3 = ffffffffffffffb3
!	Mem[0000000010041400] = 00000097 00000000, %l2 = 00000000, %l3 = ffffffb3
	ldda	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000 0000000000000097
!	Mem[0000000010141408] = ff000000, %l1 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010181400] = ffffffff, %l0 = ffffffffffffffff
	ldsha	[%i6+0x002]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101408] = 037d0000, %l4 = ffffffffffffa5d0
	ldsha	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = 000000ff, %l3 = 0000000000000097
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 000000ff, %l5 = 00000000000000ff
	ldsba	[%i0+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff00, Mem[0000000030141400] = 3d7be6ff17000000
	stxa	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffffffffff00

p0_label_262:
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000010001410] = 00000000 00000000
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 ffffffff
!	%f0  = ff000000 0000ffff 000000ff ff0000ff
!	%f4  = 00000000 00000000 00000000 00000000
!	%f8  = e3583621 2cced994 2dee399f 47c2c6a4
!	%f12 = ffffffff 00000000 ff000000 d0a5e0d1
	stda	%f0,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	%l7 = 0000000000000000, Mem[0000000010101438] = 94305e9f000072e3
	stx	%l7,[%i4+0x038]		! Mem[0000000010101438] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010181410] = ffffffff
	stba	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffff00
!	%f16 = 000000ff 00000017, Mem[00000000100c1408] = ff000000 ff0000ff
	stda	%f16,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff 00000017
!	%l3 = 0000000000000000, Mem[00000000100c1418] = 00000000
	stw	%l3,[%i3+0x018]		! Mem[00000000100c1418] = 00000000
!	%l3 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stwa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%f18 = e372ffff 785462bf, Mem[0000000010001428] = 00000000 000000ff
	std	%f18,[%i0+0x028]	! Mem[0000000010001428] = e372ffff 785462bf
!	Mem[0000000030001410] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 21000000, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000021

p0_label_263:
!	Mem[0000000030001408] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1408] = 000000ff, %f16 = 000000ff
	lda	[%i3+%o4]0x89,%f16	! %f16 = 000000ff
!	Mem[0000000010001410] = 00000000, %l4 = 0000000000000000
	ldsba	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = 00ffffffffffffff, %l0 = ffffffffffffffff
	ldxa	[%i5+%g0]0x89,%l0	! %l0 = 00ffffffffffffff
!	Mem[00000000300c1410] = 00000000, %l0 = 00ffffffffffffff
	lduwa	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = ffb9ead0, %f28 = 00000017
	lda	[%i4+%g0]0x80,%f28	! %f28 = ffb9ead0
!	Mem[0000000010001410] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 00007d03, %l6 = 0000000000000021
	ldub	[%i4+%o4],%l6		! %l6 = 0000000000000000
!	Mem[0000000010141410] = 000000ff, %l3 = 0000000000000000
	ldswa	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000021800040] = ffff9b4e, %l3 = 00000000000000ff
	ldstuba	[%o3+0x040]%asi,%l3	! %l3 = 000000ff000000ff

p0_label_264:
!	%f30 = ff000000 000000ff, %l3 = 00000000000000ff
!	Mem[00000000100c1408] = 17000000ff000000
	add	%i3,0x008,%g1
	stda	%f30,[%g1+%l3]ASI_PST16_P ! Mem[00000000100c1408] = ff000000000000ff
	membar	#Sync			! Added by membar checker (49)
!	Mem[00000000100c1408] = ff000000, %l4 = 0000000000000000, %asi = 80
	swapa	[%i3+0x008]%asi,%l4	! %l4 = 00000000ff000000
!	%l7 = 0000000000000000, Mem[0000000010081410] = ff000000
	stwa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	%f14 = ff000000, Mem[0000000010041410] = 00000000
	st	%f14,[%i1+%o5]		! Mem[0000000010041410] = ff000000
!	%l7 = 0000000000000000, Mem[0000000030001410] = 000000ff
	stba	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l4 = ff000000, %l5 = ffffffff, Mem[0000000010141408] = ff000000 000000ff
	std	%l4,[%i5+%o4]		! Mem[0000000010141408] = ff000000 ffffffff
!	%f2  = 000000ff ff0000ff, %l5 = ffffffffffffffff
!	Mem[0000000030141438] = 980b74a7516fa616
	add	%i5,0x038,%g1
	stda	%f2,[%g1+%l5]ASI_PST32_S ! Mem[0000000030141438] = 000000ffff0000ff
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010081410] = 00000000 ff000000
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff 000000ff
!	Mem[000000001000142f] = 785462bf, %l2 = 00000000000000ff
	ldstub	[%i0+0x02f],%l2		! %l2 = 000000bf000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000ff, %l6 = 0000000000000000
	ldsh	[%i2+0x012],%l6		! %l6 = 00000000000000ff

p0_label_265:
!	Mem[00000000218001c0] = 6bf39ea8, %l7 = 0000000000000000
	lduha	[%o3+0x1c0]%asi,%l7	! %l7 = 0000000000006bf3
!	Mem[0000000030081400] = 00000000 cb22a3ff, %l0 = 00000000, %l1 = ffffff00
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 00000000cb22a3ff 0000000000000000
!	Mem[0000000030141408] = ff0000ff, %l5 = ffffffffffffffff
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[000000001004140c] = e372ff8d, %l2 = 00000000000000bf
	ldsh	[%i1+0x00e],%l2		! %l2 = ffffffffffffff8d
!	Mem[00000000100c1400] = ff0000000000ffff, %f20 = 5eaa09a5 ff000000
	ldda	[%i3+0x000]%asi,%f20	! %f20 = ff000000 0000ffff
!	Mem[00000000211c0000] = 00ffe4d2, %l3 = 00000000000000ff
	lduba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1428] = 2dee399f47c2c6a4, %l0 = 00000000cb22a3ff
	ldx	[%i3+0x028],%l0		! %l0 = 2dee399f47c2c6a4
!	Mem[0000000030181400] = 000000ff, %l2 = ffffffffffffff8d
	ldsba	[%i6+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041410] = ff520000, %l7 = 0000000000006bf3
	lduha	[%i1+%o5]0x81,%l7	! %l7 = 000000000000ff52
!	Starting 10 instruction Store Burst
!	%f16 = 000000ff 00000017, %f31 = 000000ff
	fdtoi	%f16,%f31		! %l0 = 2dee399f47c2c6c6, Unfinished, %fsr = 0000000000

!	Check Point 53 for processor 0

	set	p0_check_pt_data_53,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 2dee399f47c2c6c6
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000ff52
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 000000ff ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 000000ff 00000017
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ff000000 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x68],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffb9ead0 ffa322cb
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 53 completed


p0_label_266:
!	Mem[0000000010081400] = 00000021, %l0 = 2dee399f47c2c6c6
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 00000021000000ff
!	%f7  = 00000000, Mem[0000000010041408] = ff6254ff
	sta	%f7 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	Mem[0000000030081400] = ffa322cb, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 00000000ffa322cb
!	Mem[0000000010041408] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010081408] = cb2200ff
	stha	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = cb2200ff
!	Mem[0000000010181408] = d1e0a5d0, %l1 = 00000000ffa322cb
	swapa	[%i6+%o4]0x88,%l1	! %l1 = 00000000d1e0a5d0
!	%l6 = 00000000000000ff, Mem[00000000300c1400] = 00000000
	stba	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	Mem[0000000010141408] = ff000000, %l3 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l2 = ffffffffffffffff, Mem[0000000030141410] = 00000000ff000000
	stxa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ffffffff, %l2 = ffffffffffffffff
	lduba	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff

p0_label_267:
!	Mem[0000000030101400] = ff000000, %l4 = 00000000ff000000
	lduba	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l0 = 0000000000000021
	lduha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %f21 = 0000ffff
	lda	[%i4+%o4]0x81,%f21	! %f21 = 00000000
!	Mem[00000000100c1410] = 0000000000000000, %f12 = ffffffff 00000000
	ldda	[%i3+%o5]0x80,%f12	! %f12 = 00000000 00000000
!	Mem[0000000010141410] = ff000000, %l1 = 00000000d1e0a5d0
	ldsha	[%i5+%o5]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010141408] = ff000000 ffffffff, %l6 = 000000ff, %l7 = 0000ff52
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 00000000ff000000 00000000ffffffff
!	Mem[0000000030041410] = ff52000000000000, %l4 = 00000000000000ff
	ldxa	[%i1+%o5]0x81,%l4	! %l4 = ff52000000000000
!	Mem[0000000030041400] = e372ffb3, %l1 = ffffffffffffff00
	ldsba	[%i1+%g0]0x89,%l1	! %l1 = ffffffffffffffb3
!	Mem[00000000100c1408] = 00000000, %l6 = 00000000ff000000
	lduha	[%i3+0x008]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010081408] = 000000ffcb2200ff
	stxa	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000ff

p0_label_268:
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i1+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	%f0  = ff000000 0000ffff, %l4 = ff52000000000000
!	Mem[0000000030141408] = ff0000ff00000017
	add	%i5,0x008,%g1
	stda	%f0,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030141408] = ff0000ff00000017
!	%l5 = 0000000000000000, Mem[0000000010041400] = 00000097000000ff
	stxa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000
!	%l4 = ff52000000000000, Mem[0000000030001400] = e3583621
	stba	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = e3583600
!	%l0 = 0000000000000000, Mem[0000000020800040] = ffffe589, %asi = 80
	stha	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000e589
!	Mem[00000000201c0000] = ff00afd5, %l0 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000201c0001] = ff00afd5, %l5 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010141408] = ffffffff000000ff
	stxa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000000000ff
!	%f26 = 0cb9ead0, Mem[0000000010181400] = ffffffff
	sta	%f26,[%i6+%g0]0x80	! Mem[0000000010181400] = 0cb9ead0
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000, %l4 = ff52000000000000
	ldsha	[%i5+%o4]0x80,%l4	! %l4 = ffffffffffffff00

p0_label_269:
!	Mem[0000000010181408] = cb22a3ff 00000000, %l0 = 000000ff, %l1 = ffffffb3
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 00000000cb22a3ff 0000000000000000
!	Mem[0000000030101400] = ff000000, %l7 = 00000000ffffffff
	ldsha	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010001410] = 00000000 ffffffff, %l6 = 00000000, %l7 = ffffff00
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000 00000000ffffffff
!	%f28 = ffb9ead0 ffa322cb, %f19 = 785462bf
	fdtos	%f28,%f19		! %f19 = ff800000
!	Mem[0000000010001408] = 000000ff 9f91163e, %l6 = 00000000, %l7 = ffffffff
	ldd	[%i0+%o4],%l6		! %l6 = 00000000000000ff 000000009f91163e
!	Mem[0000000010041410] = 000000ff, %l6 = 00000000000000ff
	lduwa	[%i1+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101410] = 00000097, %f26 = 0cb9ead0
	lda	[%i4+%o5]0x89,%f26	! %f26 = 00000097
!	Mem[0000000010141408] = ff000000, %l4 = ffffffffffffff00
	ldswa	[%i5+%o4]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[00000000100c1410] = 00000000, %l2 = 00000000000000ff
	lduha	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000020800000] = c9ffbb34
	stb	%l3,[%o1+%g0]		! Mem[0000000020800000] = ffffbb34

p0_label_270:
!	%f26 = 00000097, Mem[0000000010101400] = ffb9ead0
	sta	%f26,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000097
!	%l0 = 00000000cb22a3ff, Mem[0000000010001408] = ff000000
	stba	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = ff0000ff
!	%f31 = 000000ff, Mem[0000000010081410] = 000000ff
	sta	%f31,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	%l2 = 0000000000000000, Mem[00000000211c0001] = 00ffe4d2
	stb	%l2,[%o2+0x001]		! Mem[00000000211c0000] = 0000e4d2
!	Mem[0000000010181410] = ffffff00, %l7 = 000000009f91163e
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010001410] = 00000000
	stha	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff
!	Mem[00000000100c1400] = ff000000, %l3 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000ff000000
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010001410] = 000000ff
	stha	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000, %l1 = 0000000000000000
	lduba	[%i5+%o4]0x80,%l1	! %l1 = 00000000000000ff

!	Check Point 54 for processor 0

	set	p0_check_pt_data_54,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000cb22a3ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffff000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = e372ffff ff800000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000097 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 54 completed


p0_label_271:
!	Mem[000000001010143c] = 00000000, %l1 = 00000000000000ff
	lduba	[%i4+0x03c]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = 00007d0300000000, %l7 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l7	! %l7 = 00007d0300000000
!	Mem[000000001008142c] = aaeca280, %l7 = 00007d0300000000
	ldsh	[%i2+0x02c],%l7		! %l7 = ffffffffffffaaec
!	Mem[000000001004143c] = ffffffff, %l7 = ffffffffffffaaec
	ldswa	[%i1+0x03c]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101410] = ffffffff 00000000, %l4 = ff000000, %l5 = 00000000
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Mem[00000000300c1408] = 0000ffff 000000ff, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff 000000000000ffff
!	Mem[0000000010081418] = 66000000, %l6 = 00000000000000ff
	ldsh	[%i2+0x01a],%l6		! %l6 = 0000000000000000
!	Mem[0000000030141400] = ffffffff, %l0 = 00000000cb22a3ff
	ldsha	[%i5+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141410] = ff000000ff000000, %f2  = 000000ff ff0000ff
	ldda	[%i5+%o5]0x80,%f2 	! %f2  = ff000000 ff000000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ffffafd5, %l6 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 000000ff000000ff

p0_label_272:
!	%l7 = 000000000000ffff, Mem[0000000010081400] = ff000000
	stba	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010081408] = 000000ff 00000000
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 00000000
!	%l2 = 0000000000000000, Mem[0000000010001410] = 00000000ffffffff
	stxa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l6 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l0 = ffffffffffffffff, Mem[0000000030101400] = ff000000
	stwa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffff
!	%l5 = 0000000000000000, Mem[0000000030001400] = e3583600
	stba	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = e3583600
!	%f10 = 2dee399f 47c2c6a4, Mem[0000000010081410] = 000000ff 000000ff
	stda	%f10,[%i2+%o5]0x80	! Mem[0000000010081410] = 2dee399f 47c2c6a4
!	%l0 = ffffffff, %l1 = 00000000, Mem[0000000010041400] = 00000000 00000000
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffff 00000000
!	%l0 = ffffffffffffffff, Mem[0000000010081400] = ff000000
	stha	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 3d7b0000, %l7 = 000000000000ffff
	ldsha	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000

p0_label_273:
!	Mem[000000001014142c] = 1a53d335, %l2 = 0000000000000000
	lduw	[%i5+0x02c],%l2		! %l2 = 000000001a53d335
!	Mem[0000000010181400] = 0cb9ead000000072, %l4 = 00000000ffffffff
	ldxa	[%i6+%g0]0x80,%l4	! %l4 = 0cb9ead000000072
!	Mem[0000000010001408] = ff0000ff, %l6 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010001408] = ff0000ff9f91163e, %l7 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l7	! %l7 = ff0000ff9f91163e
!	Mem[0000000010041438] = 000000ff ffffffff, %l4 = 00000072, %l5 = 00000000
	ldda	[%i1+0x038]%asi,%l4	! %l4 = 00000000000000ff 00000000ffffffff
!	Mem[0000000010081408] = 00000000, %f25 = 000000ff
	lda	[%i2+%o4]0x80,%f25	! %f25 = 00000000
!	Mem[0000000010101408] = 00000000 037d0000, %l2 = 1a53d335, %l3 = 00000000
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 00000000037d0000 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l2 = 00000000037d0000
	lduba	[%i4+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l6 = 000000000000ff00
	lduha	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 000000ff, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff

p0_label_274:
!	Mem[0000000010081400] = ffff0000, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 00000000ffff0000
!	%l6 = 00000000ffff0000, Mem[00000000100c1430] = ffffffff00000000
	stx	%l6,[%i3+0x030]		! Mem[00000000100c1430] = 00000000ffff0000
!	%f20 = ff000000 00000000, %l3 = 0000000000000000
!	Mem[00000000100c1408] = 00000000000000ff
	add	%i3,0x008,%g1
	stda	%f20,[%g1+%l3]ASI_PST16_PL ! Mem[00000000100c1408] = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[000000001000143a] = 62ef3c78
	sth	%l1,[%i0+0x03a]		! Mem[0000000010001438] = 62ef00ff
!	%f25 = 00000000, Mem[0000000010001400] = ff0000ff
	st	%f25,[%i0+%g0]		! Mem[0000000010001400] = 00000000
!	%l0 = ffffffffffffffff, Mem[0000000010181417] = 00000000, %asi = 80
	stba	%l0,[%i6+0x017]%asi	! Mem[0000000010181414] = 000000ff
!	%l4 = 00000000000000ff, Mem[0000000030081408] = ff000000
	stwa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	%l2 = 00000000000000ff, Mem[00000000100c1418] = 0000000000000000
	stx	%l2,[%i3+0x018]		! Mem[00000000100c1418] = 00000000000000ff
!	%l0 = ffffffffffffffff, Mem[0000000010041408] = ff000000
	stwa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 52f578f7 3d7b0000, %l6 = ffff0000, %l7 = 9f91163e
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 000000003d7b0000 0000000052f578f7

p0_label_275:
!	Mem[0000000010041410] = 000000ff, %l7 = 0000000052f578f7
	ldswa	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081410] = 9f39ee2d, %l6 = 000000003d7b0000
	ldsha	[%i2+%o5]0x88,%l6	! %l6 = ffffffffffffee2d
!	Mem[0000000030081408] = ff000000, %l3 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[00000000300c1400] = 000000ff, %l6 = ffffffffffffee2d
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000211c0000] = 0000e4d2, %l6 = 00000000000000ff
	lduba	[%o2+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800040] = 0000e589, %l6 = 0000000000000000
	lduh	[%o1+0x040],%l6		! %l6 = 0000000000000000
!	Mem[0000000030141400] = ffffffff, %l3 = 00000000ff000000
	ldswa	[%i5+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000201c0000] = ffffafd5, %l1 = 00000000000000ff
	lduh	[%o0+%g0],%l1		! %l1 = 000000000000ffff
!	Mem[0000000010041400] = 00000000 ffffffff, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Starting 10 instruction Store Burst
!	%f23 = 1a53d335, Mem[0000000010081408] = 00000000
	sta	%f23,[%i2+%o4]0x88	! Mem[0000000010081408] = 1a53d335

!	Check Point 55 for processor 0

	set	p0_check_pt_data_55,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 55 completed


p0_label_276:
!	Mem[0000000010041410] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%f5  = 00000000, Mem[0000000030041408] = 00000000
	sta	%f5 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%f15 = d0a5e0d1, Mem[0000000030141410] = ffffffff
	sta	%f15,[%i5+%o5]0x81	! Mem[0000000030141410] = d0a5e0d1
!	%f16 = 000000ff, Mem[0000000030141408] = ff0000ff
	sta	%f16,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	Mem[0000000030001410] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030081410] = ff000000
	stwa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff
!	Mem[000000001010141c] = 000000ff, %l3 = ffffffff, %l2 = 000000ff
	add	%i4,0x1c,%g1
	casa	[%g1]0x80,%l3,%l2	! %l2 = 00000000000000ff
!	%f31 = 000000ff, Mem[0000000030001400] = e3583600
	sta	%f31,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	%l7 = 0000000000000000, Mem[0000000010041410] = ff00000000000000
	stxa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff000000000000ff, %l2 = 00000000000000ff
	ldxa	[%i0+%o5]0x81,%l2	! %l2 = ff000000000000ff

p0_label_277:
!	Mem[0000000010181410] = ff000000 ffffffff, %l0 = ffffffff, %l1 = 0000ffff
	ldda	[%i6+%o5]0x88,%l0	! %l0 = 00000000ffffffff 00000000ff000000
!	Mem[0000000010181400] = 0cb9ead0, %l2 = ff000000000000ff
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = 000000000000000c
!	Mem[0000000010101408] = 037d0000, %l2 = 000000000000000c
	ldsha	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %f15 = d0a5e0d1
	lda	[%i3+%g0]0x81,%f15	! %f15 = ff000000
!	Mem[0000000010141438] = 74bd5edc, %l1 = 00000000ff000000
	ldsw	[%i5+0x038],%l1		! %l1 = 0000000074bd5edc
!	Mem[00000000100c1400] = 000000ff, %f0  = ff000000
	lda	[%i3+%g0]0x80,%f0 	! %f0 = 000000ff
!	Mem[00000000100c1410] = 000000ff, %l3 = ffffffffffffffff
	ldsha	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081434] = ff0000f8, %l3 = 0000000000000000
	lduha	[%i2+0x034]%asi,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010041410] = 00000000, %l0 = 00000000ffffffff
	lduha	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stha	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000

p0_label_278:
!	Mem[0000000030101410] = 00000097, %l6 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000097
!	Mem[0000000010081400] = 00000000, %l3 = 000000000000ff00
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030001410] = ff000000
	stha	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	Mem[0000000010001410] = 00000000, %l1 = 0000000074bd5edc
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%f21 = 00000000, Mem[00000000300c1410] = 00000000
	sta	%f21,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010141410] = ff000000, %l0 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	%l3 = 0000000000000000, Mem[0000000030101408] = 00000000
	stwa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l6 = 0000000000000097, Mem[0000000030081410] = 000000ff
	stwa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000097
!	%l6 = 0000000000000097, Mem[0000000030081410] = 97000000
	stwa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000097
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 1a53d335, %l0 = 00000000ff000000
	ldsba	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000035

p0_label_279:
!	Mem[0000000030141410] = d0a5e0d1 ffffffff, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 00000000d0a5e0d1 00000000ffffffff
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000000000097
	lduba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = 000000ff, %l0 = 0000000000000035
	ldsha	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101410] = 000000ff, %l0 = 00000000000000ff
	ldsha	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1438] = ff000000 d0a5e0d1, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+0x038]%asi,%l2	! %l2 = 00000000ff000000 00000000d0a5e0d1
!	Mem[0000000010081408] = 35d3531a, %l4 = 00000000d0a5e0d1
	ldsba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000035
!	Mem[0000000030041408] = 00000000 00000000, %l4 = 00000035, %l5 = ffffffff
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010101400] = 00000097, %f25 = 00000000
	lda	[%i4+%g0]0x80,%f25	! %f25 = 00000097
!	Mem[00000000100c1410] = ff000000, %l1 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = ff000000, %l3 = d0a5e0d1, Mem[0000000010001408] = ff0000ff 3e16919f
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000 d0a5e0d1

p0_label_280:
!	%l2 = ff000000, %l3 = d0a5e0d1, Mem[0000000010041408] = ffffffff e372ff8d
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000 d0a5e0d1
!	Mem[00000000100c1410] = 000000ff, %l2 = 00000000ff000000
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010001410] = 74bd5edc 00000000
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff 00000000
!	%l2 = 00000000, %l3 = d0a5e0d1, Mem[0000000010001410] = ff000000 00000000
	std	%l2,[%i0+%o5]		! Mem[0000000010001410] = 00000000 d0a5e0d1
!	Mem[0000000030141410] = d1e0a5d0, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 00000000d1e0a5d0
!	Mem[00000000211c0001] = 0000e4d2, %l4 = 00000000d1e0a5d0
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030001410] = 00000000 000000ff
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 00000000
!	%f4  = 00000000 00000000, %l6 = 0000000000000000
!	Mem[0000000030101430] = e3dfa430a3429ce0
	add	%i4,0x030,%g1
	stda	%f4,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030101430] = e3dfa430a3429ce0
!	%f0  = 000000ff 0000ffff ff000000 ff000000
!	%f4  = 00000000 00000000 00000000 00000000
!	%f8  = e3583621 2cced994 2dee399f 47c2c6a4
!	%f12 = 00000000 00000000 ff000000 ff000000
	stda	%f0,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000097, %l1 = 0000000000000000
	lduwa	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000097

!	Check Point 56 for processor 0

	set	p0_check_pt_data_56,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000097
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000d0a5e0d1
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 00000097
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 56 completed


p0_label_281:
!	Mem[0000000010081410] = a4c6c2479f39ee2d, %f2  = ff000000 ff000000
	ldda	[%i2+%o5]0x88,%f2 	! %f2  = a4c6c247 9f39ee2d
!	Mem[0000000030001400] = ff000000, %l5 = 0000000000000000
	ldsha	[%i0+%g0]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010041408] = 000000ff, %l1 = 0000000000000097
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030141410] = 00000000, %l5 = ffffffffffffff00
	lduha	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = 51d3531a 516fa616, %l0 = 000000ff, %l1 = ffffffff
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 0000000051d3531a 00000000516fa616
!	Mem[0000000010141410] = 00000000 ff000000, %l2 = 00000000, %l3 = d0a5e0d1
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[00000000100c1408] = ff000000 00000000, %l0 = 51d3531a, %l1 = 516fa616
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000 00000000ff000000
!	Mem[0000000010101420] = ff00845c000066ff, %f20 = ff000000 00000000
	ldda	[%i4+0x020]%asi,%f20	! %f20 = ff00845c 000066ff
!	Mem[0000000030041410] = ff520000, %l3 = 00000000ff000000
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff520000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030081400] = 0000000000000000
	stxa	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000000000

p0_label_282:
!	%f4  = 00000000 00000000, Mem[0000000010141430] = 16a66f51 1a53d335
	std	%f4 ,[%i5+0x030]	! Mem[0000000010141430] = 00000000 00000000
!	%l5 = 0000000000000000, Mem[0000000020800000] = ffffbb34
	sth	%l5,[%o1+%g0]		! Mem[0000000020800000] = 0000bb34
!	%f0  = 000000ff 0000ffff a4c6c247 9f39ee2d
!	%f4  = 00000000 00000000 00000000 00000000
!	%f8  = e3583621 2cced994 2dee399f 47c2c6a4
!	%f12 = 00000000 00000000 ff000000 ff000000
	stda	%f0,[%i6]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	%l6 = 0000000000000000, Mem[0000000010001408] = ff000000
	stba	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000
!	Mem[0000000030041400] = b3ff72e3, %l3 = 00000000ff520000
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 000000b3000000ff
!	Mem[0000000030141408] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030001410] = 00000000, %l1 = 00000000ff000000
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%f30 = ff000000 000000ff, Mem[0000000010001408] = 000000ff d1e0a5d0
	stda	%f30,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000 000000ff
!	Mem[0000000030141410] = 00000000, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 0000ffff 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000 000000000000ffff

p0_label_283:
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000010181410] = 00000000, %f30 = ff000000
	lda	[%i6+%o5]0x88,%f30	! %f30 = 00000000
!	Mem[0000000010001400] = 00000000, %l6 = 0000000000000000
	lduba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = 000000ff, %l7 = 000000000000ffff
	lduha	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081438] = bb1ed552, %l0 = 0000000000000000
	lduh	[%i2+0x03a],%l0		! %l0 = 000000000000d552
!	Mem[0000000010081400] = ff000000, %l4 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081400] = 00000097000000ff, %f24 = 00000000 00000097
	ldda	[%i2+%g0]0x88,%f24	! %f24 = 00000097 000000ff
!	Mem[0000000010141410] = 000000ff00000000, %l3 = 00000000000000b3
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = 000000ff00000000
!	Mem[0000000010041400] = ffffffff00000000, %f22 = 16a66f51 1a53d335
	ldda	[%i1+%g0]0x80,%f22	! %f22 = ffffffff 00000000
!	Mem[0000000030141408] = 17000000 000000ff, %l0 = 0000d552, %l1 = 00000000
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff 0000000017000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 00000000, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_284:
!	Mem[00000000100c1428] = 2dee399f47c2c6a4, %l2 = 0000000000000000, %l0 = 00000000000000ff
	add	%i3,0x28,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = 2dee399f47c2c6a4
!	%l2 = 0000000000000000, Mem[0000000030081410] = 97000000ff000000
	stxa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000000000
!	Mem[0000000010081430] = a509aa5e, %l3 = 000000ff00000000
	swap	[%i2+0x030],%l3		! %l3 = 00000000a509aa5e
!	%f12 = 00000000 00000000, Mem[00000000300c1410] = 00000000 00000000
	stda	%f12,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 00000000
!	%l2 = 00000000, %l3 = a509aa5e, Mem[0000000010041410] = 00000000 00000000
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 a509aa5e
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000017000000
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = ffffffff, %l3 = 00000000a509aa5e
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 00000000ffffffff
!	%f17 = 00000017, Mem[0000000010141400] = 3d7b0000
	sta	%f17,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000017
!	%f24 = 00000097, Mem[0000000010081408] = 35d3531a
	sta	%f24,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000097
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000

p0_label_285:
!	Mem[00000000100c1400] = ffff0000ff000000, %l1 = 0000000000000000
	ldxa	[%i3+%g0]0x88,%l1	! %l1 = ffff0000ff000000
!	Mem[00000000211c0000] = 00ffe4d2, %l3 = 00000000ffffffff
	ldsb	[%o2+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[00000000100c1400] = 000000ff 0000ffff, %l4 = ffffffff, %l5 = 000000ff
	ldda	[%i3+0x000]%asi,%l4	! %l4 = 00000000000000ff 000000000000ffff
!	Mem[0000000010001400] = 00000000, %l0 = 2dee399f47c2c6a4
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 0000000000000000, %f28 = ffb9ead0 ffa322cb
	ldda	[%i6+%o5]0x89,%f28	! %f28 = 00000000 00000000
!	Mem[0000000030001400] = 000000ff, %l3 = ffffffffffffffff
	lduwa	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l5 = 000000000000ffff
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[000000001014141c] = ff000000, %l3 = 00000000000000ff
	ldsha	[%i5+0x01e]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 00007d03, %l5 = 0000000000000000
	ldsba	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 000000ff 00000017 e372ffff ff800000
!	%f20 = ff00845c 000066ff ffffffff 00000000
!	%f24 = 00000097 000000ff 00000097 00000000
!	%f28 = 00000000 00000000 00000000 000000ff
	stda	%f16,[%i3]ASI_BLK_AIUS	! Block Store to 00000000300c1400

!	Check Point 57 for processor 0

	set	p0_check_pt_data_57,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffff0000ff000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = a4c6c247 9f39ee2d
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ff00845c 000066ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x68],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ffffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x70],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000097 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x78],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x80],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 57 completed


p0_label_286:
!	%f10 = 2dee399f, Mem[0000000010081408] = 97000000
	sta	%f10,[%i2+%o4]0x88	! Mem[0000000010081408] = 2dee399f
!	%f24 = 00000097 000000ff, %l5 = 0000000000000000
!	Mem[0000000030141418] = ffffffff00000097
	add	%i5,0x018,%g1
	stda	%f24,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030141418] = ffffffff00000097
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030081408] = 000000ff
	stha	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010041438] = 000000ff ffffffff
	std	%l4,[%i1+0x038]		! Mem[0000000010041438] = 000000ff 00000000
!	%l0 = 0000000000000000, Mem[0000000010081400] = ff00000097000000, %asi = 80
	stxa	%l0,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000000000000000
!	Mem[0000000020800041] = 0000e589, %l1 = ffff0000ff000000
	ldstuba	[%o1+0x041]%asi,%l1	! %l1 = 00000000000000ff
!	%f0  = 000000ff 0000ffff, Mem[0000000010141408] = 000000ff 00000000
	stda	%f0 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff 0000ffff
!	Mem[0000000021800141] = 72ff9071, %l3 = 0000000000000000
	ldstub	[%o3+0x141],%l3		! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000000ff 0000ffff ff000000 ff000000
!	Mem[0000000010181410] = 00000000 00000000 00000000 00000000
!	Mem[0000000010181420] = e3583621 2cced994 2dee399f 47c2c6a4
!	Mem[0000000010181430] = 00000000 00000000 ff000000 ff000000
	ldda	[%i6]ASI_BLK_AIUP,%f0	! Block Load from 0000000010181400

p0_label_287:
!	Mem[0000000010181408] = ff000000, %l6 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010181400] = ffff0000ff000000, %f24 = 00000097 000000ff
	ldda	[%i6+%g0]0x88,%f24	! %f24 = ffff0000 ff000000
!	Mem[000000001004143c] = 00000000, %f18 = e372ffff
	ld	[%i1+0x03c],%f18	! %f18 = 00000000
!	Mem[0000000030181400] = ff000000, %l6 = 00000000ff000000
	lduba	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = 0000000000000000, %l5 = 0000000000000000
	ldxa	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (51)
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041424] = 35d3531a, %l0 = 0000000000000000
	ldub	[%i1+0x026],%l0		! %l0 = 0000000000000053
!	Mem[0000000030001408] = ff000000ffffff3d, %l3 = 00000000000000ff
	ldxa	[%i0+%o4]0x81,%l3	! %l3 = ff000000ffffff3d
!	%f18 = 00000000 ff800000, Mem[0000000010001428] = e372ffff 785462ff
	stda	%f18,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000 ff800000
!	Starting 10 instruction Store Burst
!	%l0 = 00000053, %l1 = 00000000, Mem[0000000010181410] = 00000000 00000000
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000053 00000000

p0_label_288:
!	%l2 = 0000000000000000, Mem[0000000010081400] = 0000000000000000, %asi = 80
	stxa	%l2,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000000000000000
!	%l3 = ff000000ffffff3d, Mem[0000000010081407] = 00000000, %asi = 80
	stba	%l3,[%i2+0x007]%asi	! Mem[0000000010081404] = 0000003d
!	%l2 = 0000000000000000, Mem[00000000100c1414] = 00000000
	sth	%l2,[%i3+0x014]		! Mem[00000000100c1414] = 00000000
!	%l2 = 00000000, %l3 = ffffff3d, Mem[0000000030081410] = 00000000 00000000
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 ffffff3d
!	%l2 = 00000000, %l3 = ffffff3d, Mem[0000000030081400] = 00000000 00000000
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 ffffff3d
!	Mem[0000000010181400] = 000000ff, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	Mem[0000000030041410] = ff520000, %l2 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1400] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff000000, %f23 = 00000000
	lda	[%i0+%o4]0x81,%f23	! %f23 = ff000000

p0_label_289:
!	Mem[00000000211c0000] = 00ffe4d2, %l0 = 0000000000000053
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081408] = 00000000, %l0 = 00000000000000ff
	lduha	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l0 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 17000000ff000000, %f16 = 000000ff 00000017
	ldda	[%i3+%g0]0x89,%f16	! %f16 = 17000000 ff000000
!	Mem[0000000021800000] = 00ffed58, %l5 = 00000000000000ff
	ldsha	[%o3+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = ffff0000ffffffff, %l2 = 00000000000000ff
	ldxa	[%i4+%g0]0x89,%l2	! %l2 = ffff0000ffffffff
!	Mem[0000000010101408] = 037d0000, %l7 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l7	! %l7 = 00000000037d0000
!	Mem[0000000030141400] = ffffffffffffff00, %f30 = 00000000 000000ff
	ldda	[%i5+%g0]0x81,%f30	! %f30 = ffffffff ffffff00
!	Mem[0000000010041410] = 00000000 a509aa5e, %l6 = 00000000, %l7 = 037d0000
	ldda	[%i1+0x010]%asi,%l6	! %l6 = 0000000000000000 00000000a509aa5e
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff

p0_label_290:
!	Mem[0000000030001408] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = 9f39ee2d, %l3 = ff000000ffffff3d
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 0000002d000000ff
!	Mem[0000000010101400] = 97000000, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%f26 = 00000097 00000000, Mem[0000000010081400] = 00000000 0000003d
	stda	%f26,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000097 00000000
!	Mem[0000000010041410] = 00000000, %l3 = 000000000000002d
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181416] = 00000000, %l5 = 0000000000000000
	ldstub	[%i6+0x016],%l5		! %l5 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030141410] = 00000000
	stba	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000010141408] = ffff0000ff000000
	stxa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffffffff, %l0 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l0	! %l0 = ffffffffffffffff

!	Check Point 58 for processor 0

	set	p0_check_pt_data_58,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffff0000ffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000a509aa5e
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = e3583621 2cced994
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 2dee399f 47c2c6a4
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 17000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 ff800000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x90],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ffffffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x98],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ffff0000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ffffffff ffffff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 58 completed


p0_label_291:
!	Mem[0000000010081400] = 00000097, %l4 = 00000000000000ff
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 2dee399f, %l4 = 0000000000000000
	ldsba	[%i2+%o4]0x88,%l4	! %l4 = ffffffffffffff9f
!	Mem[0000000010001408] = 000000ff, %f20 = ff00845c
	lda	[%i0+%o4]0x88,%f20	! %f20 = 000000ff
!	Mem[0000000030081408] = 00000000, %l0 = ffffffffffffffff
	lduba	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %f24 = ffff0000
	lda	[%i5+%o5]0x80,%f24	! %f24 = 00000000
!	Mem[0000000030101408] = 000000ff000000ff, %l6 = 00000000000000ff
	ldxa	[%i4+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000201c0000] = ffffafd5, %l2 = ffff0000ffffffff
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101410] = 00000000000000ff, %f20 = 000000ff 000066ff
	ldda	[%i4+%o5]0x89,%f20	! %f20 = 00000000 000000ff
!	Mem[00000000300c1400] = 000000ff00000017, %l7 = 00000000a509aa5e
	ldxa	[%i3+%g0]0x81,%l7	! %l7 = 000000ff00000017
!	Starting 10 instruction Store Burst
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010181400] = 00000000 ffff0000
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff 00000000

p0_label_292:
!	%f18 = 00000000 ff800000, Mem[00000000100c1400] = ff0000ff 0000ffff
	stda	%f18,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000 ff800000
!	%l4 = ffffff9f, %l5 = 00000000, Mem[0000000030181408] = a4c6c247 9f39ee2d
	stda	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffff9f 00000000
!	Mem[0000000021800000] = 00ffed58, %l6 = 000000ff000000ff
	ldstub	[%o3+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010101410] = ffffffff, %l1 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030081400] = 000000ff, %l4 = ffffffffffffff9f
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030041400] = 0cb9ead0e372ffff
	stxa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	Mem[00000000201c0000] = ffffafd5, %l7 = 000000ff00000017
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	%l6 = 0000000000000000, Mem[0000000010101400] = ff000097
	stba	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000097
!	%f18 = 00000000, Mem[0000000030041410] = 000052ff
	sta	%f18,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l1 = 00000000ffffffff
	ldsba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_293:
!	Mem[00000000100c1408] = ff00000000000000, %l0 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l0	! %l0 = ff00000000000000
!	Mem[00000000100c1420] = e3583621, %f14 = ff000000
	ld	[%i3+0x020],%f14	! %f14 = e3583621
!	Mem[00000000300c1400] = ff000000, %l1 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = 0000000000000000, %f30 = ffffffff ffffff00
	ldda	[%i1+%o5]0x81,%f30	! %f30 = 00000000 00000000
!	Mem[0000000010181408] = 000000ff, %l7 = 00000000000000ff
	lduba	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 5eaa09a5, %l4 = 00000000000000ff
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 000000000000005e
!	Mem[0000000020800040] = 00ffe589, %l7 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = ffffff9f, %l5 = 0000000000000000
	lduwa	[%i2+%g0]0x89,%l5	! %l5 = 00000000ffffff9f
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030141408] = 17000000000000ff
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000

p0_label_294:
!	%f6  = 00000000 00000000, Mem[0000000010081410] = 9f39eeff a4c6c247
	stda	%f6 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 00000000
!	Mem[0000000010181428] = 2dee399f47c2c6a4, %l6 = 0000000000000000, %l6 = 0000000000000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 2dee399f47c2c6a4
!	%l5 = 00000000ffffff9f, Mem[000000001008143d] = ffe67b3d
	stb	%l5,[%i2+0x03d]		! Mem[000000001008143c] = ff9f7b3d
!	Mem[0000000030081408] = 00000000, %l0 = ff00000000000000
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%f4  = 00000000 00000000, Mem[0000000030101400] = ffffffff 0000ffff
	stda	%f4 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 00000000
!	Mem[0000000010001420] = de45fb04, %l2 = ffffffff, %l0 = 00000000
	add	%i0,0x20,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 00000000de45fb04
!	%l0 = 00000000de45fb04, Mem[0000000010001408] = 000000ff
	stha	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000fb04
!	%l1 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stha	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%l1 = 0000000000000000, Mem[0000000030101410] = 00000000000000ff
	stxa	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff000000, %l0 = 00000000de45fb04
	ldsha	[%i1+%o5]0x80,%l0	! %l0 = ffffffffffffff00

p0_label_295:
!	Mem[0000000010001410] = d1e0a5d000000000, %f26 = 00000097 00000000
	ldda	[%i0+%o5]0x88,%f26	! %f26 = d1e0a5d0 00000000
!	Mem[00000000100c1410] = ff0000ff, %l4 = 000000000000005e
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030101400] = 00000000 00000000, %l0 = ffffff00, %l1 = 00000000
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000021800100] = ffff0ae8, %l5 = 00000000ffffff9f
	ldsha	[%o3+0x100]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181410] = 53000000, %l5 = ffffffffffffffff
	lduba	[%i6+%o5]0x80,%l5	! %l5 = 0000000000000053
!	Mem[0000000010001430] = ffffff3d, %l6 = 2dee399f47c2c6a4
	lduba	[%i0+0x030]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l0 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = ff000000, %l7 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041408] = 00000000, %f26 = d1e0a5d0
	lda	[%i1+%o4]0x89,%f26	! %f26 = 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010001400] = 16a66f5100000000
	stxa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000000000ff

!	Check Point 59 for processor 0

	set	p0_check_pt_data_59,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000053
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = e3583621 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x50],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x58],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x68],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 59 completed


p0_label_296:
!	%l4 = 000000000000ff00, Mem[0000000030001410] = 000000ff
	stba	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010081434] = ff0000f8
	sth	%l1,[%i2+0x034]		! Mem[0000000010081434] = 000000f8
!	Mem[0000000030001410] = 00000000, %l5 = 0000000000000053
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l4 = 000000000000ff00
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030001400] = ff000000516fa616
	stxa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000010181408] = ff000000ff000000
	stxa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000000000ff
!	%f8  = e3583621 2cced994, %l7 = ffffffffffffffff
!	Mem[0000000010001420] = de45fb04ff472f5e
	add	%i0,0x020,%g1
	stda	%f8,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010001420] = 94d9ce2c213658e3
!	Mem[0000000030081410] = 00000000, %l6 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l2 = ffffffffffffffff, Mem[0000000010081408] = 9f39ee2d
	stba	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ff39ee2d
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 9fffffff, %l1 = 0000000000000000
	ldsba	[%i6+%o4]0x89,%l1	! %l1 = ffffffffffffffff

p0_label_297:
!	Mem[0000000010181424] = 2cced994, %l0 = 0000000000000000
	lduwa	[%i6+0x024]%asi,%l0	! %l0 = 000000002cced994
!	Mem[0000000010041408] = d1e0a5d0000000ff, %l7 = ffffffffffffffff
	ldxa	[%i1+%o4]0x88,%l7	! %l7 = d1e0a5d0000000ff
!	Mem[0000000010141408] = ff00000000000000, %l2 = ffffffffffffffff
	ldxa	[%i5+%o4]0x88,%l2	! %l2 = ff00000000000000
!	Mem[00000000100c1410] = ff0000ff, %l4 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001408] = ff000000, %l4 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = 0000000000000000, %l4 = 00000000000000ff
	ldxa	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = ffffffff, %l3 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081410] = 00000000, %l5 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 0000000000000000, %l0 = 000000002cced994
	ldxa	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010181408] = 00000000
	stba	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff

p0_label_298:
!	%l2 = ff00000000000000, Mem[0000000010001404] = 00000000, %asi = 80
	stwa	%l2,[%i0+0x004]%asi	! Mem[0000000010001404] = 00000000
!	Mem[0000000030101400] = 00000000, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l0 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[0000000010181410] = 00000053
	stba	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	%l4 = 0000000000000000, Mem[000000001014143d] = ff000000
	stb	%l4,[%i5+0x03d]		! Mem[000000001014143c] = ff000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030001410] = ff000000 00000000
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 00000000
!	%l7 = d1e0a5d0000000ff, Mem[0000000010081438] = bb1ed552ff9f7b3d, %asi = 80
	stxa	%l7,[%i2+0x038]%asi	! Mem[0000000010081438] = d1e0a5d0000000ff
!	Mem[000000001010140c] = 00000000, %l3 = ffffffffffffffff
	ldstuba	[%i4+0x00c]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = 00000000, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff6600005c8400ff, %f4  = 00000000 00000000
	ldda	[%i3+%o5]0x89,%f4 	! %f4  = ff660000 5c8400ff

p0_label_299:
!	Mem[0000000010001410] = d1e0a5d000000000, %f4  = ff660000 5c8400ff
	ldda	[%i0+%o5]0x88,%f4 	! %f4  = d1e0a5d0 00000000
!	Mem[0000000010001424] = 213658e3, %l5 = 0000000000000000
	ldsha	[%i0+0x024]%asi,%l5	! %l5 = 0000000000002136
!	Mem[0000000030141408] = 00000000, %l1 = ffffffffffffffff
	ldswa	[%i5+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800040] = 00ffe589, %l3 = 0000000000000000
	ldsh	[%o1+0x040],%l3		! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000002136
	lduwa	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101404] = 00000000, %l3 = 00000000000000ff
	lduh	[%i4+0x006],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141414] = ff000000, %l5 = 0000000000000000
	ldswa	[%i5+0x014]%asi,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030181410] = 00000000 00000000
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 00000000

p0_label_300:
!	%l2 = ff00000000000000, Mem[0000000030081408] = 00000000000000ff
	stxa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = ff00000000000000
!	%l3 = 0000000000000000, Mem[000000001008140a] = ff39ee2d, %asi = 80
	stha	%l3,[%i2+0x00a]%asi	! Mem[0000000010081408] = ff390000
!	%l3 = 0000000000000000, Mem[0000000010041418] = 00000000785462bf, %asi = 80
	stxa	%l3,[%i1+0x018]%asi	! Mem[0000000010041418] = 0000000000000000
!	Mem[0000000010181408] = ff000000, %l5 = ffffffffff000000
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%l4 = 0000000000000000, Mem[0000000010101408] = 037d0000
	stha	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 037d0000
!	Mem[0000000010181419] = 00000000, %l5 = 00000000000000ff
	ldstub	[%i6+0x019],%l5		! %l5 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030001410] = 00000000
	stwa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%l7 = d1e0a5d0000000ff, Mem[000000001008141a] = 66000000
	stb	%l7,[%i2+0x01a]		! Mem[0000000010081418] = 6600ff00
!	%f14 = e3583621 ff000000, %l6 = 0000000000000000
!	Mem[0000000030081420] = 00000000000000ff
	add	%i2,0x020,%g1
	stda	%f14,[%g1+%l6]ASI_PST32_S ! Mem[0000000030081420] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %l1 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000

!	Check Point 60 for processor 0

	set	p0_check_pt_data_60,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ff00000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = d1e0a5d0000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = d1e0a5d0 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1

!	Check Point 60 completed


p0_label_301:
!	Mem[0000000030081410] = 000000ff, %l1 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[000000001014140c] = 000000ff, %l4 = 0000000000000000
	ldsh	[%i5+0x00e],%l4		! %l4 = 00000000000000ff
!	Mem[000000001018140c] = 000000ff, %l5 = 0000000000000000
	ldsw	[%i6+0x00c],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010141428] = 16a66f511a53d335, %f2  = ff000000 ff000000
	ldda	[%i5+0x028]%asi,%f2 	! %f2  = 16a66f51 1a53d335
!	Mem[0000000030081400] = ffffff9f, %l1 = 00000000000000ff
	ldsha	[%i2+%g0]0x89,%l1	! %l1 = ffffffffffffff9f
!	Mem[0000000030101400] = 0000000000000000, %f24 = 00000000 ff000000
	ldda	[%i4+%g0]0x89,%f24	! %f24 = 00000000 00000000
!	Mem[0000000010141400] = 00000017, %l2 = ff00000000000000
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000017
!	Mem[0000000030141408] = 00000000, %l6 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141428] = 16a66f511a53d335, %f22 = ffffffff ff000000
	ldda	[%i5+0x028]%asi,%f22	! %f22 = 16a66f51 1a53d335
!	Starting 10 instruction Store Burst
!	%f28 = 00000000, Mem[0000000010141400] = 17000000
	st	%f28,[%i5+%g0]		! Mem[0000000010141400] = 00000000

p0_label_302:
!	Mem[0000000030041400] = 00000000, %l7 = d1e0a5d0000000ff
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = ff0000ff, %l5 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030001408] = 000000ff 3dffffff
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 00000000
!	%l5 = 00000000000000ff, Mem[00000000201c0000] = ffffafd5
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 00ffafd5
!	%f5  = 00000000, Mem[0000000010101400] = 00000097
	sta	%f5 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%f26 = 00000000 00000000, Mem[00000000300c1408] = ffff72e3 000080ff
	stda	%f26,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 00000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030181410] = 00000000 00000000
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 00000000
!	Mem[00000000100c1400] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000211c0000] = 00ffe4d2, %l0 = 00000000000000ff
	ldstub	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 037d0000 00000000, %l0 = 00000000, %l1 = ffffff9f
	ldda	[%i1+0x030]%asi,%l0	! %l0 = 00000000037d0000 0000000000000000

p0_label_303:
!	Mem[0000000010081410] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 9fffffff, %l6 = 0000000000000000
	ldsba	[%i2+%g0]0x81,%l6	! %l6 = ffffffffffffff9f
!	Mem[0000000030181410] = 00000000, %l0 = 00000000037d0000
	lduha	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 00000000 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l7 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000100c1400] = 000000ff, %f10 = 2dee399f
	lda	[%i3+%g0]0x88,%f10	! %f10 = 000000ff
!	Mem[0000000030101408] = ff000000ff000000, %f16 = 17000000 ff000000
	ldda	[%i4+%o4]0x81,%f16	! %f16 = ff000000 ff000000
!	Mem[00000000100c1408] = 00000000, %l6 = ffffffffffffff9f
	lduwa	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l2 = 0000000000000017
	ldswa	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010041400] = 5eaa09a5
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 00aa09a5

p0_label_304:
!	Mem[0000000010001420] = 94d9ce2c, %l7 = 00000000000000ff
	swap	[%i0+0x020],%l7		! %l7 = 0000000094d9ce2c
!	%l3 = 0000000000000000, Mem[0000000010081414] = 00000000
	stw	%l3,[%i2+0x014]		! Mem[0000000010081414] = 00000000
!	Mem[00000000300c1400] = 000000ff, %l0 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030041408] = 00000000
	stha	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Mem[0000000030041400] = 000000ff, %l7 = 0000000094d9ce2c
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000201c0001] = 00ffafd5, %l6 = 0000000000000000
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000030001410] = 00000000
	stha	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ff0000
!	%f25 = 00000000, Mem[0000000010181408] = ff000000
	sta	%f25,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%l4 = 0000000000000000, Mem[0000000020800040] = 00ffe589, %asi = 80
	stha	%l4,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000e589
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000 00000000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000000

p0_label_305:
!	Mem[00000000201c0000] = 00ffafd5, %l5 = 00000000000000ff
	ldub	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000030041400] = ff000000 00000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 00000000ff000000 0000000000000000
	membar	#Sync			! Added by membar checker (52)
!	Mem[0000000030181400] = 000000ff 0000ffff ffffff9f 00000000
!	Mem[0000000030181410] = 00000000 00000000 00000000 00000000
!	Mem[0000000030181420] = e3583621 2cced994 2dee399f 47c2c6a4
!	Mem[0000000030181430] = 00000000 00000000 ff000000 ff000000
	ldda	[%i6]ASI_BLK_SL,%f16	! Block Load from 0000000030181400
!	Mem[0000000010101410] = 00000000, %l6 = 00000000ff000000
	lduwa	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1430] = 00000000ffff0000, %l6 = 0000000000000000
	ldxa	[%i3+0x030]%asi,%l6	! %l6 = 00000000ffff0000
!	Mem[0000000030001408] = 0000000000000000, %l6 = 00000000ffff0000
	ldxa	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 00000000 d0a5e0d1, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000 00000000d0a5e0d1
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000000
	lduba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800040] = 0000e589, %l7 = 0000000000000000
	ldub	[%o1+0x040],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 000000ff 0000ffff 16a66f51 1a53d335
!	%f4  = d1e0a5d0 00000000 00000000 00000000
!	%f8  = e3583621 2cced994 000000ff 47c2c6a4
!	%f12 = 00000000 00000000 e3583621 ff000000
	stda	%f0,[%i4]ASI_COMMIT_P	! Block Store to 0000000010101400

!	Check Point 61 for processor 0

	set	p0_check_pt_data_61,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000d0a5e0d1
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 16a66f51 1a53d335
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 000000ff 47c2c6a4
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffff0000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 9fffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 94d9ce2c 213658e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = a4c6c247 9f39ee2d
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 61 completed


p0_label_306:
!	%l0 = 0000000000000000, Mem[0000000010181410] = ff000000
	stba	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	Mem[0000000010141400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030141400] = ffffffffffffff00
	stxa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000218001c1] = 6bf39ea8
	stb	%l2,[%o3+0x1c1]		! Mem[00000000218001c0] = 6b009ea8
!	%f15 = ff000000, Mem[000000001014142c] = 1a53d335
	st	%f15,[%i5+0x02c]	! Mem[000000001014142c] = ff000000
!	Mem[0000000030001408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l1 = 00000000d0a5e0d1
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010141420] = ffe67b3df778f501, %asi = 80
	stxa	%l4,[%i5+0x020]%asi	! Mem[0000000010141420] = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010041400] = 00aa09a5
	stwa	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = ed34871b35d3531a, %l5 = 0000000000000000
	ldx	[%i1+0x020],%l5		! %l5 = ed34871b35d3531a

p0_label_307:
!	Mem[0000000010081408] = 000039ff, %f23 = 00000000
	lda	[%i2+%o4]0x88,%f23	! %f23 = 000039ff
!	Mem[0000000010081414] = 00000000, %l2 = 0000000000000000
	ldub	[%i2+0x017],%l2		! %l2 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %f8  = e3583621
	lda	[%i6+%o4]0x88,%f8 	! %f8 = 00000000
!	Mem[0000000010001400] = ff000000 00000000 04fb0000 000000ff
!	Mem[0000000010001410] = 00000000 d0a5e0d1 00000000 00000066
!	Mem[0000000010001420] = 000000ff 213658e3 00000000 ff800000
!	Mem[0000000010001430] = ffffff3d 2d0064b3 62ef00ff 000000ff
	ldda	[%i0]ASI_BLK_AIUP,%f0	! Block Load from 0000000010001400
	membar	#Sync			! Added by membar checker (53)
!	Mem[0000000010101410] = d0a5e0d1, %l3 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l3	! %l3 = ffffffffffffe0d1
!	Mem[000000001008143c] = 000000ff, %l4 = 0000000000000000
	ldsha	[%i2+0x03e]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = 00000000, %l7 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l5 = ed34871b35d3531a, Mem[0000000010001400] = 000000ff
	stha	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000531a
!	Mem[0000000010001410] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 35d3531a, Mem[0000000030181408] = ffffff9f 00000000
	stda	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 35d3531a

p0_label_308:
!	%f22 = 00000000 000039ff, Mem[0000000010001408] = 0000fb04 ff000000
	stda	%f22,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 000039ff
!	%l6 = 0000000000000000, Mem[0000000030041410] = 00000000
	stha	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	Mem[0000000010001400] = 1a530000, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 0000001a000000ff
!	%f14 = 62ef00ff 000000ff, Mem[0000000010101408] = 16a66f51 1a53d335
	stda	%f14,[%i4+%o4]0x80	! Mem[0000000010101408] = 62ef00ff 000000ff
!	Mem[0000000030001408] = 000000ff, %l3 = ffffffffffffe0d1
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010101408] = ff00ef62, %l0 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 00000000ff00ef62
!	Mem[0000000030041408] = 00000000, %l1 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800000] = 0000bb34, %l6 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	%f21 = 00000000, Mem[0000000030001410] = 00ff0000
	sta	%f21,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c143c] = d0a5e0d1, %f25 = 213658e3
	ld	[%i3+0x03c],%f25	! %f25 = d0a5e0d1

p0_label_309:
!	Mem[0000000030141408] = 0000000000000000, %l4 = 0000000000000000
	ldxa	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = ff000000, %f3  = 000000ff
	lda	[%i6+%g0]0x89,%f3 	! %f3 = ff000000
!	Mem[00000000211c0000] = ffffe4d2, %l4 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030001410] = 0000000000000000, %f10 = 00000000 ff800000
	ldda	[%i0+%o5]0x89,%f10	! %f10 = 00000000 00000000
!	Mem[0000000020800000] = ff00bb34, %l3 = 00000000000000ff
	ldsha	[%o1+0x000]%asi,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000021800180] = 52f9ae0c, %l2 = 000000000000001a
	ldub	[%o3+0x180],%l2		! %l2 = 0000000000000052
!	Mem[0000000010181400] = ffffffff, %f28 = 00000000
	lda	[%i6+0x000]%asi,%f28	! %f28 = ffffffff
!	Mem[0000000010181400] = 00000000 ffffffff, %l0 = ff00ef62, %l1 = 00000000
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 00000000ffffffff 0000000000000000
!	Mem[0000000030081400] = 9fffffff, %l2 = 0000000000000052
	lduwa	[%i2+%g0]0x81,%l2	! %l2 = 000000009fffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00000000, %l5 = ed34871b35d3531a
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 00000000000000ff

p0_label_310:
!	%l3 = ffffffffffffff00, Mem[00000000100c1410] = 00000000ff0000ff
	stxa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffffffffffff00
!	%l0 = 00000000ffffffff, Mem[00000000100c1410] = ffffffffffffff00
	stxa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000ffffffff
!	%l3 = ffffffffffffff00, Mem[0000000010141410] = 00000000
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000ff00
!	%l3 = ffffffffffffff00, Mem[0000000020800000] = ff00bb34, %asi = 80
	stha	%l3,[%o1+0x000]%asi	! Mem[0000000020800000] = ff00bb34
!	%l7 = 0000000000000000, Mem[00000000100c1408] = 00000000000000ff
	stxa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	Mem[00000000100c1420] = e35836212cced994, %l0 = 00000000ffffffff, %l3 = ffffffffffffff00
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = e35836212cced994
!	%f10 = 00000000 00000000, Mem[0000000010001400] = ff530000 00000000
	stda	%f10,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 00000000
!	%f28 = ffffffff, Mem[0000000010001400] = 00000000
	sta	%f28,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffff
!	Mem[0000000030141410] = 00000000, %l4 = 000000000000ffff
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 0000000000000000, %f26 = a4c6c247 9f39ee2d
	ldda	[%i6+%o5]0x81,%f26	! %f26 = 00000000 00000000

!	Check Point 62 for processor 0

	set	p0_check_pt_data_62,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 000000009fffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = e35836212cced994
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 04fb0000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 d0a5e0d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000066
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 000000ff 213658e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ffffff3d 2d0064b3
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 62ef00ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 000039ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 94d9ce2c d0a5e0d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 62 completed


p0_label_311:
!	Mem[0000000030141400] = 00000000, %l4 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l3 = e35836212cced994
	lduha	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %f20 = 00000000
	lda	[%i6+%o5]0x88,%f20	! %f20 = 00000000
!	Mem[0000000010081400] = 00000097, %l7 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l4 = 0000000000000000
	lduba	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 00000000ffffffff
	setx	0xecb4cef0515a438a,%g7,%l0 ! %l0 = ecb4cef0515a438a
!	%l1 = 0000000000000000
	setx	0x106e2740253c8ab4,%g7,%l1 ! %l1 = 106e2740253c8ab4
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ecb4cef0515a438a
	setx	0xc0a661a0067c7cee,%g7,%l0 ! %l0 = c0a661a0067c7cee
!	%l1 = 106e2740253c8ab4
	setx	0x62db22c004f58b2c,%g7,%l1 ! %l1 = 62db22c004f58b2c
!	Mem[0000000010141408] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141430] = 00000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+0x030]%asi,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010001408] = ff390000, %f21 = 00000000
	lda	[%i0+%o4]0x80,%f21	! %f21 = ff390000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l4	! %l4 = 00000000000000ff

p0_label_312:
!	%f18 = 00000000 9fffffff, Mem[0000000030101410] = 00000000 00000000
	stda	%f18,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 9fffffff
!	%l2 = 000000009fffffff, Mem[0000000010001408] = ff390000
	stha	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = ffff0000
!	%l5 = 0000000000000000, Mem[0000000010001408] = 0000ffff
	stba	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000ff00
!	Mem[0000000010041408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101408] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%f2  = 04fb0000 ff000000, Mem[0000000030081408] = 00000000 ff000000
	stda	%f2 ,[%i2+%o4]0x89	! Mem[0000000030081408] = 04fb0000 ff000000
!	Mem[0000000030001400] = 00000000, %l2 = 000000009fffffff
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[00000000218001c0] = 6b009ea8
	sth	%l5,[%o3+0x1c0]		! Mem[00000000218001c0] = 00ff9ea8
!	Mem[0000000030081400] = 9fffffff, %l0 = c0a661a0067c7cee
	ldstuba	[%i2+%g0]0x81,%l0	! %l0 = 0000009f000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff000000, %l6 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l6	! %l6 = 00000000ff000000

p0_label_313:
!	Mem[00000000211c0000] = ffffe4d2, %l7 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030081410] = ff000000, %l7 = 000000000000ffff
	lduha	[%i2+%o5]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[00000000100c1410] = ffffffff00000000, %f8  = 000000ff 213658e3
	ldda	[%i3+%o5]0x80,%f8 	! %f8  = ffffffff 00000000
!	Mem[00000000100c1408] = 00000000, %l1 = 62db22c004f58b2c
	ldsba	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = ffffff3dffffffff, %f16 = ffff0000 ff000000
	ldda	[%i2+%g0]0x89,%f16	! %f16 = ffffff3d ffffffff
!	Mem[0000000010041434] = 00000000, %f21 = ff390000
	lda	[%i1+0x034]%asi,%f21	! %f21 = 00000000
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l1 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = ff000000, %l7 = 0000ff00, Mem[0000000010001410] = 000000ff d1e0a5d0
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = ff000000 0000ff00

p0_label_314:
!	%l6 = 00000000ff000000, Mem[00000000100c1410] = ffffffff
	stba	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00ffffff
!	Mem[0000000010181418] = 00ff000000000000, %l1 = 0000000000000000, %l2 = 00000000000000ff
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = 00ff000000000000
!	%l3 = 0000000000000000, Mem[0000000010041410] = 000000ff
	stha	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%f14 = 62ef00ff 000000ff, %l1 = 0000000000000000
!	Mem[0000000030181438] = ff000000ff000000
	add	%i6,0x038,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_S ! Mem[0000000030181438] = ff000000ff000000
!	Mem[0000000010141410] = 00ff0000, %l7 = 000000000000ff00
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 0000000000ff0000
!	%l7 = 0000000000ff0000, Mem[00000000300c1400] = 0000000000000017
	stxa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000ff0000
!	%f0  = ff000000 00000000, Mem[0000000010041400] = 00000000 00000000
	stda	%f0 ,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000 00000000
!	%f22 = 00000000, Mem[0000000030101410] = ffffff9f
	sta	%f22,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%f0  = ff000000 00000000, Mem[0000000010081410] = 000000ff 00000000
	stda	%f0 ,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ffafd5, %l2 = 00ff000000000000
	ldsh	[%o0+%g0],%l2		! %l2 = 00000000000000ff

p0_label_315:
!	Mem[00000000300c1400] = 00000000 00ff0000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000 0000000000ff0000
!	Mem[0000000030001408] = ff000000, %l3 = 0000000000ff0000
	ldsba	[%i0+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141410] = 0000ff00, %f18 = 00000000
	lda	[%i5+%o5]0x80,%f18	! %f18 = 0000ff00
!	Mem[0000000010081400] = 97000000, %l5 = 00000000000000ff
	ldsha	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 00ffafd5, %l0 = 000000000000009f
	ldub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[00000000218000c0] = ffffcd54, %l0 = 00000000000000ff
	ldsh	[%o3+0x0c0],%l0		! %l0 = ffffffffffffffff
!	%f4  = 00000000 d0a5e0d1, Mem[00000000300c1410] = ff00845c 000066ff
	stda	%f4 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 d0a5e0d1
!	Mem[0000000010181408] = 00000000, %l4 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l7 = 0000000000ff0000
	ldsha	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, immed = fffff369, %y  = 000005ed
	sdiv	%l0,-0xc97,%l7		! %l7 = ffffffff876d370c
	mov	%l0,%y			! %y = ffffffff

!	Check Point 63 for processor 0

	set	p0_check_pt_data_63,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffff876d370c
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 04fb0000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 d0a5e0d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ffffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffffff3d ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 0000ff00 9fffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 63 completed


p0_label_316:
!	%l6 = 00000000ff000000, Mem[0000000010081410] = 00000000000000ff
	stxa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000ff000000
!	%l0 = ffffffffffffffff, Mem[0000000010001410] = ff000000
	stba	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = ff0000ff
!	%l6 = 00000000ff000000, Mem[0000000010081408] = 000039ff
	stwa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = ff000000
!	%f22 = 00000000 000039ff, Mem[0000000010181408] = 00000000 000000ff
	stda	%f22,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 000039ff
!	%f26 = 00000000, Mem[0000000010001400] = ffffffff
	sta	%f26,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%f12 = ffffff3d 2d0064b3, Mem[0000000030101410] = 00000000 00000000
	stda	%f12,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffff3d 2d0064b3
!	%l4 = 0000000000000000, Mem[0000000010041408] = d1e0a5d0000000ff
	stxa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l3 = ffffffffffffffff
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030141400] = 00000000, %l0 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000, %l0 = 0000000000000000
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_317:
!	Mem[000000001010143c] = ff000000, %l2 = 0000000000000000
	ldsb	[%i4+0x03d],%l2		! %l2 = 0000000000000000
!	Mem[0000000020800000] = ff00bb34, %l1 = 0000000000000000
	lduh	[%o1+%g0],%l1		! %l1 = 000000000000ff00
!	Mem[00000000201c0000] = 00ffafd5, %l6 = 00000000ff000000
	ldsba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800180] = 52f9ae0c, %l3 = 00000000ff000000
	ldsh	[%o3+0x180],%l3		! %l3 = 00000000000052f9
!	Mem[0000000010001408] = 00ff0000, %l0 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101408] = ff000000ff000000, %l4 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l4	! %l4 = ff000000ff000000
!	Mem[0000000010181408] = 00000000, %l4 = ff000000ff000000
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000218000c0] = ffffcd54, %l0 = 00000000000000ff
	ldsb	[%o3+0x0c1],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030181408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = ffffffff876d370c, Mem[0000000030101408] = ff000000
	stba	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 0c000000

p0_label_318:
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000100c1400] = 000000ff 000080ff
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 00000000
!	Mem[000000001008140d] = 00000000, %l0 = ffffffffffffffff
	ldstub	[%i2+0x00d],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030081410] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%f11 = 00000000, %f1  = 00000000
	fcmps	%fcc1,%f11,%f1 		! %fcc1 = 0
!	%f6  = 00000000 00000066, Mem[0000000010101410] = d1e0a5d0 00000000
	stda	%f6 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 00000066
!	%l5 = 0000000000000000, Mem[0000000030101400] = 00000000
	stha	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Mem[0000000010181400] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 876d370c, Mem[00000000300c1410] = 00000000 d1e0a5d0
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 876d370c
!	Mem[0000000030101408] = 0000000c, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 0000000c000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l2 = 00000000000000ff
	ldsba	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000

p0_label_319:
!	Mem[0000000030041408] = 0000000000000000, %l0 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l3 = 00000000000052f9
	ldsha	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %f4  = 00000000
	lda	[%i6+%o5]0x81,%f4 	! %f4 = 00000000
!	Mem[00000000300c1410] = 876d370c00000000, %l5 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l5	! %l5 = 876d370c00000000
!	Mem[0000000010001410] = ff0000ff, %l4 = 00000000000000ff
	ldsha	[%i0+%o5]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010001400] = 0000000000000000, %l4 = ffffffffffffff00
	ldxa	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = 00ff0000, %l6 = 000000000000000c
	lduha	[%i0+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l7 = ffffffff876d370c
	lduba	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = ffffffff, %l0 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f0  = ff000000 00000000, %l7 = 0000000000000000
!	Mem[0000000010081420] = 0000001600000000
	add	%i2,0x020,%g1
	stda	%f0,[%g1+%l7]ASI_PST32_P ! Mem[0000000010081420] = 0000001600000000

p0_label_320:
!	%f28 = ffffffff, Mem[0000000030181400] = ff000000
	sta	%f28,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff
!	%l5 = 876d370c00000000, Mem[0000000010041408] = 00000000
	stwa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	Mem[0000000010041408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%f2  = 04fb0000 ff000000, %l1 = 000000000000ff00
!	Mem[0000000030001410] = 0000000000000000
	add	%i0,0x010,%g1
	stda	%f2,[%g1+%l1]ASI_PST16_S ! Mem[0000000030001410] = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l1 = 000000000000ff00
	swapa	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030041408] = 00000000
	stha	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Mem[0000000010101410] = 00000000, %l0 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l3 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010101400] = 000000ff 0000ffff
	stda	%l4,[%i4+0x000]%asi	! Mem[0000000010101400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ff000000, %l3 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l3	! %l3 = ffffffffffffffff

!	Check Point 64 for processor 0

	set	p0_check_pt_data_64,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 876d370c00000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 d0a5e0d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1

!	Check Point 64 completed


p0_label_321:
!	Mem[0000000030001400] = ff000000, %f1  = 00000000
	lda	[%i0+%g0]0x81,%f1 	! %f1 = ff000000
!	Mem[00000000300c1408] = 00000000, %f10 = 00000000
	lda	[%i3+%o4]0x81,%f10	! %f10 = 00000000
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000010041400] = 00000000 000000ff ff000000 00000000
!	Mem[0000000010041410] = 00000000 a509aa5e 00000000 00000000
!	Mem[0000000010041420] = ed34871b 35d3531a ff000000 ff000000
!	Mem[0000000010041430] = 037d0000 00000000 000000ff 00000000
	ldda	[%i1]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010041400
!	Mem[00000000100c1430] = 00000000ffff0000, %f0  = ff000000 ff000000
	ldd	[%i3+0x030],%f0 	! %f0  = 00000000 ffff0000
!	Mem[0000000030081400] = ffffffff, %l1 = 0000000000000000
	ldswa	[%i2+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 000000ff, %l3 = ffffffffffffffff
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = ffffffff, %l3 = 00000000000000ff
	lduwa	[%i2+%g0]0x81,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010141420] = 0000000000000000, %l5 = 876d370c00000000
	ldxa	[%i5+0x020]%asi,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_322:
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l3 = 00000000ffffffff
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%f6  = 00000000, Mem[0000000010001400] = 00000000
	sta	%f6 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	Mem[0000000021800140] = 72ff9071, %l1 = ffffffffffffffff
	ldstub	[%o3+0x140],%l1		! %l1 = 00000072000000ff
!	%l3 = 0000000000000000, Mem[00000000300c1408] = 0000000000000000
	stxa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	Mem[0000000030081400] = ffffffff, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030101410] = b364002d, %l4 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l4	! %l4 = 00000000b364002d
!	Mem[0000000030181408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff000000, %l7 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l7	! %l7 = ffffffffffffff00

p0_label_323:
!	Mem[0000000030081410] = ff0000003dffffff, %l1 = 0000000000000072
	ldxa	[%i2+%o5]0x81,%l1	! %l1 = ff0000003dffffff
!	Mem[00000000201c0000] = 00ffafd5, %l2 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = ff000000, %f1  = ffff0000
	lda	[%i0+%o5]0x81,%f1 	! %f1 = ff000000
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 00000000ffffffff
	setx	0x400c99405d4a351f,%g7,%l0 ! %l0 = 400c99405d4a351f
!	%l1 = ff0000003dffffff
	setx	0x799bd4d7b2c0b060,%g7,%l1 ! %l1 = 799bd4d7b2c0b060
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 400c99405d4a351f
	setx	0x2f67a23fc38b84f9,%g7,%l0 ! %l0 = 2f67a23fc38b84f9
!	%l1 = 799bd4d7b2c0b060
	setx	0xd9bffd3044e56ade,%g7,%l1 ! %l1 = d9bffd3044e56ade
!	Code Fragment 4
p0_fragment_11:
!	%l0 = 2f67a23fc38b84f9
	setx	0x6ba03e47c68c9417,%g7,%l0 ! %l0 = 6ba03e47c68c9417
!	%l1 = d9bffd3044e56ade
	setx	0xf740a5001883bf17,%g7,%l1 ! %l1 = f740a5001883bf17
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6ba03e47c68c9417
	setx	0x413d673067353dbd,%g7,%l0 ! %l0 = 413d673067353dbd
!	%l1 = f740a5001883bf17
	setx	0xeb8e0207a3563487,%g7,%l1 ! %l1 = eb8e0207a3563487
!	Mem[0000000010001408] = 00ff0000, %l7 = ffffffffffffff00
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 0000000000ff0000
!	Mem[0000000030001410] = 00000000 000000ff, %l4 = b364002d, %l5 = 00000000
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[0000000020800000] = ff00bb34, %l7 = 0000000000ff0000
	ldsba	[%o1+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141410] = 0000ff00ff000000, %l3 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l3	! %l3 = 0000ff00ff000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000030001408] = ff000000
	stha	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ff0000

p0_label_324:
!	Mem[00000000300c1410] = 0000ff00, %l7 = ffffffffffffffff
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 000000000000ff00
!	%f10 = 00000000 00000000, Mem[0000000030001410] = 000000ff 00000000
	stda	%f10,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 00000000
!	Mem[0000000010001400] = 00000000, %l0 = 413d673067353dbd
	ldstub	[%i0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000000, %asi = 80
	swapa	[%i1+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800040] = ffff9b4e, %l4 = 00000000000000ff
	ldstub	[%o3+0x040],%l4		! %l4 = 000000ff000000ff
!	%f20 = 5eaa09a5, Mem[0000000030101410] = 00000000
	sta	%f20,[%i4+%o5]0x81	! Mem[0000000030101410] = 5eaa09a5
!	%f30 = 00000000 ff000000, Mem[0000000010181400] = ffffffff 00000000
	stda	%f30,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 ff000000
!	%l1 = eb8e0207a3563487, Mem[0000000030001410] = 00000000
	stba	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000087
!	Mem[0000000010181424] = 2cced994, %f22 = 00000000
	lda	[%i6+0x024]%asi,%f22	! %f22 = 2cced994
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l6 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000

p0_label_325:
!	Mem[0000000020800000] = ff00bb34, %l5 = 0000000000000000
	ldsha	[%o1+0x000]%asi,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000030041408] = 00000000, %l5 = ffffffffffffff00
	ldswa	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l3 = 0000ff00ff000000
	lduba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = ff0000ff, %f6  = 00000000
	lda	[%i0+%o5]0x80,%f6 	! %f6 = ff0000ff
!	Mem[0000000030141400] = ff000000 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010101428] = 000000ff 47c2c6a4, %l2 = ff000000, %l3 = 00000000
	ldda	[%i4+0x028]%asi,%l2	! %l2 = 00000000000000ff 0000000047c2c6a4
!	%l7 = 000000000000ff00, Mem[0000000010101438] = e3583621, %asi = 80
	stwa	%l7,[%i4+0x038]%asi	! Mem[0000000010101438] = 0000ff00
!	Mem[0000000010001408] = ffffff00, %l2 = 00000000000000ff
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 00000000ffffff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 00000000, %l7 = 000000000000ff00
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000

!	Check Point 65 for processor 0

	set	p0_check_pt_data_65,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = eb8e0207a3563487
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ffffff00
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000047c2c6a4
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 04fb0000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 d0a5e0d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff0000ff 00000066
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 5eaa09a5 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 2cced994 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 1a53d335 1b8734ed
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 00007d03
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 65 completed


p0_label_326:
!	%l6 = 0000000000000000, Mem[00000000300c1410] = ffffffff
	stba	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ffffff
!	Code Fragment 3
p0_fragment_12:
!	%l0 = 0000000000000000
	setx	0x9c4d6b77c239952d,%g7,%l0 ! %l0 = 9c4d6b77c239952d
!	%l1 = eb8e0207a3563487
	setx	0x88e499700322cd6a,%g7,%l1 ! %l1 = 88e499700322cd6a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9c4d6b77c239952d
	setx	0x623359dffa8b477d,%g7,%l0 ! %l0 = 623359dffa8b477d
!	%l1 = 88e499700322cd6a
	setx	0xaef4d5806d40b5ad,%g7,%l1 ! %l1 = aef4d5806d40b5ad
!	%l2 = 00000000ffffff00, Mem[0000000010181414] = 0000ff00, %asi = 80
	stba	%l2,[%i6+0x014]%asi	! Mem[0000000010181414] = 0000ff00
!	%f7  = 00000066, Mem[0000000030181410] = 00000000
	sta	%f7 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000066
!	%l5 = 0000000000000000, Mem[00000000100c1400] = 0000000000000000
	stxa	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010141420] = 0000000000000000
	stx	%l7,[%i5+0x020]		! Mem[0000000010141420] = 0000000000000000
!	%f14 = 62ef00ff 000000ff, Mem[0000000030001408] = 00ff0000 00000000
	stda	%f14,[%i0+%o4]0x81	! Mem[0000000030001408] = 62ef00ff 000000ff
!	%f18 = 00000000, Mem[0000000010141400] = 000000ff
	sta	%f18,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[00000000300c1400] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ffafd5, %l6 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff

p0_label_327:
!	Mem[0000000030181410] = 00000066, %l5 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000066
!	Mem[00000000201c0000] = 00ffafd5, %l3 = 0000000047c2c6a4
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[000000001000141c] = 00000066, %l5 = 0000000000000066
	lduba	[%i0+0x01f]%asi,%l5	! %l5 = 0000000000000066
!	Mem[0000000010181428] = 2dee399f47c2c6a4, %l0 = 623359dffa8b477d
	ldxa	[%i6+0x028]%asi,%l0	! %l0 = 2dee399f47c2c6a4
!	Mem[0000000010081408] = ffffffff 00ff0000, %l2 = ffffff00, %l3 = 000000ff
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 00000000ffffffff 0000000000ff0000
!	Mem[0000000010041410] = 00000000a509aa5e, %l7 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l7	! %l7 = 00000000a509aa5e
!	Mem[0000000010181410] = 00000000, %l2 = 00000000ffffffff
	ldsba	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = 00000000 ff000000, %l4 = 00000000, %l5 = 00000066
	ldda	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000 00000000ff000000
!	Mem[000000001018140c] = 000039ff, %l1 = aef4d5806d40b5ad
	ldub	[%i6+0x00e],%l1		! %l1 = 0000000000000039
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000039, Mem[0000000010141400] = 00000000
	stha	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 00390000

p0_label_328:
!	%l1 = 0000000000000039, Mem[0000000010181410] = 00000000
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000039
!	Mem[0000000010141410] = 0000ff00, %l3 = 0000000000ff0000
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 000000000000ff00
!	%f10 = 00000000 00000000, %l0 = 2dee399f47c2c6a4
!	Mem[00000000300c1428] = 0000009700000000
	add	%i3,0x028,%g1
	stda	%f10,[%g1+%l0]ASI_PST16_SL ! Mem[00000000300c1428] = 0000009700000000
!	Mem[00000000211c0000] = ffffe4d2, %l6 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000100c1410] = ffffff00, %l6 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 00000000ffffff00
!	Mem[0000000010101400] = 00000000, %l1 = 0000000000000039
	swapa	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 000000ff, %l0 = 2dee399f47c2c6a4
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l2 = 00000000, %l3 = 0000ff00, Mem[00000000100c1400] = 00000000 00000000
	stda	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 0000ff00
!	%l6 = 00000000ffffff00, Mem[0000000010001400] = 000000ff
	stwa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffff00
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 000000ff, %f9  = 00000000
	lda	[%i3+%g0]0x89,%f9 	! %f9 = 000000ff

p0_label_329:
!	Mem[00000000211c0000] = ffffe4d2, %l4 = 0000000000000000
	ldsb	[%o2+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030041400] = ff000000 00000000 00000000 00000000
!	Mem[0000000030041410] = 00000000 00000000 00000000 ffff0000
!	Mem[0000000030041420] = ffe60000 ff00f552 80a2ecaa 77a322cb
!	Mem[0000000030041430] = 35d3531a 3d7be6ff 74bd5edc 52d51ebb
	ldda	[%i1]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030041400
!	Mem[0000000030041410] = 00000000, %l4 = ffffffffffffffff
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = ff000000, %f23 = 00000000
	lda	[%i2+%o4]0x89,%f23	! %f23 = ff000000
!	Mem[00000000100c1400] = 00ff0000 00000000, %l4 = 00000000, %l5 = ff000000
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000000 0000000000ff0000
!	Mem[0000000030041400] = 000000ff, %l4 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 00390000, %l5 = 0000000000ff0000
	ldswa	[%i5+%g0]0x80,%l5	! %l5 = 0000000000390000
!	Mem[0000000030001410] = 87000000, %l6 = 00000000ffffff00
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffff8700
!	Mem[0000000030081400] = 00000000, %l6 = ffffffffffff8700
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff000000, %l0 = 00000000000000ff
	ldstub	[%i4+%o4],%l0		! %l0 = 000000ff000000ff

p0_label_330:
!	Mem[0000000010001410] = ff0000ff, %l7 = 00000000a509aa5e
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 00000000ff0000ff
!	Mem[000000001004143e] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i1+0x03e]%asi,%l6	! %l6 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[00000000211c0000] = ffffe4d2
	sth	%l0,[%o2+%g0]		! Mem[00000000211c0000] = 00ffe4d2
	membar	#Sync			! Added by membar checker (55)
!	%f26 = 000000ff 000000ff, Mem[0000000030041408] = 00000000 00000000
	stda	%f26,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff 000000ff
!	%l4 = 00000000000000ff, Mem[00000000201c0001] = 00ffafd5
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = 00ffafd5
!	Mem[00000000100c1400] = 00000000, %l4 = 00000000000000ff
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000010041410] = 00000000
	stwa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	Mem[0000000030141410] = 0000ffff, %l0 = 00000000000000ff
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030001410] = 00000087, %l5 = 0000000000390000
	swapa	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000087
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000000, %f22 = 2cced994
	ld	[%i2+%o5],%f22	! %f22 = 00000000

!	Check Point 66 for processor 0

	set	p0_check_pt_data_66,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000087
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0000ffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 52f500ff 0000e6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = cb22a377 aaeca280
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ffe67b3d 1a53d335
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = bb1ed552 dc5ebd74
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1

!	Check Point 66 completed


p0_label_331:
!	Mem[0000000010001410] = a509aa5e, %l5 = 0000000000000087
	ldsha	[%i0+%o5]0x88,%l5	! %l5 = ffffffffffffaa5e
!	Mem[0000000010001430] = ffffff3d, %l1 = 0000000000000000
	ldsh	[%i0+0x030],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010101400] = 39000000 00000000, %l4 = 00000000, %l5 = ffffaa5e
	ldda	[%i4+0x000]%asi,%l4	! %l4 = 0000000039000000 0000000000000000
!	Mem[00000000300c1410] = 00ffffff, %l0 = 000000000000ffff
	lduha	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041434] = 00000000, %l3 = 000000000000ff00
	ldsb	[%i1+0x036],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141404] = f778f552, %f8  = 52f500ff
	ld	[%i5+0x004],%f8 	! %f8 = f778f552
!	Mem[000000001018141c] = 00000000, %l2 = 0000000000000000
	ldsb	[%i6+0x01d],%l2		! %l2 = 0000000000000000
!	Mem[0000000021800100] = ffff0ae8, %l3 = 0000000000000000
	lduha	[%o3+0x100]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030041400] = ff000000 00000000, %l4 = 39000000, %l5 = 00000000
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ff0000ff, Mem[00000000100c1400] = ff000000
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff0000ff

p0_label_332:
!	%f10 = cb22a377 aaeca280, Mem[0000000010001400] = ffffff00 00000000
	stda	%f10,[%i0+%g0]0x88	! Mem[0000000010001400] = cb22a377 aaeca280
!	Mem[00000000201c0000] = 00ffafd5, %l7 = 00000000ff0000ff
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0000] = ffffafd5, %l3 = 000000000000ffff
	ldstub	[%o0+%g0],%l3		! %l3 = 000000ff000000ff
!	%f16 = ff000000 00000000, Mem[0000000010181408] = 00000000 ff390000
	stda	%f16,[%i6+%o4]0x88	! Mem[0000000010181408] = ff000000 00000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010181408] = 00000000 000000ff
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 00000000
!	%f25 = 1b8734ed, Mem[0000000010181408] = 00000000
	sta	%f25,[%i6+%o4]0x80	! Mem[0000000010181408] = 1b8734ed
!	%f14 = bb1ed552 dc5ebd74, %l1 = ffffffffffffffff
!	Mem[0000000030001438] = 00000000ffffffff
	add	%i0,0x038,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030001438] = 74bd5edc52d51ebb
!	Mem[0000000010081400] = 00000097, %l3 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000097
!	%f8  = f778f552, Mem[0000000030081408] = ff000000
	sta	%f8 ,[%i2+%o4]0x89	! Mem[0000000030081408] = f778f552
!	Starting 10 instruction Load Burst
!	%f17 = 00000000, %f12 = ffe67b3d 1a53d335
	fitod	%f17,%f12		! %f12 = 00000000 00000000

p0_label_333:
!	Mem[0000000010181400] = 00000000, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %l4 = 00000000ff000000
	lduba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001410] = 0000ff00a509aa5e, %l6 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l6	! %l6 = 0000ff00a509aa5e
!	Mem[0000000030181408] = a4c6c247, %l3 = 0000000000000097
	ldsha	[%i6+%o4]0x81,%l3	! %l3 = ffffffffffffa4c6
!	Mem[0000000010181400] = 00000000, %l0 = 00000000000000ff
	lduba	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 00003900, %l3 = ffffffffffffa4c6
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = 0000000000003900
!	Mem[0000000010141418] = 16a66f51, %l1 = ffffffffffffffff
	ldsw	[%i5+0x018],%l1		! %l1 = 0000000016a66f51
!	Mem[0000000010101400] = 00000039, %f0  = 00000000
	lda	[%i4+%g0]0x88,%f0 	! %f0 = 00000039
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010041408] = ff000000
	stwa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000

p0_label_334:
!	Mem[0000000010101408] = ff000000, %l4 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	%l3 = 0000000000003900, Mem[0000000010081404] = 00000000
	stw	%l3,[%i2+0x004]		! Mem[0000000010081404] = 00003900
!	%f6  = 0000ffff, Mem[0000000010041408] = 00000000
	sta	%f6 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000ffff
!	Mem[000000001010141c] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i4+0x01c]%asi,%l2	! %l2 = 00000000000000ff
!	%l6 = 0000ff00a509aa5e, Mem[0000000020800040] = 0000e589
	stb	%l6,[%o1+0x040]		! Mem[0000000020800040] = 5e00e589
!	%l7 = 0000000000000000, Mem[0000000010101408] = ff000000
	stha	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000
!	%f11 = aaeca280, Mem[0000000010081400] = 000000ff
	sta	%f11,[%i2+%g0]0x80	! Mem[0000000010081400] = aaeca280
!	%l1 = 0000000016a66f51, Mem[0000000030141408] = 000000ff
	stwa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 16a66f51
!	Mem[0000000030081408] = f778f552, %l1 = 0000000016a66f51
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 00000052000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff00bb34, %l2 = 0000000000000000
	ldsha	[%o1+0x000]%asi,%l2	! %l2 = ffffffffffffff00

p0_label_335:
	membar	#Sync			! Added by membar checker (56)
!	Mem[0000000030141400] = ff000000 00000000 516fa616 00000000
!	Mem[0000000030141410] = ff000000 ffffffff ffffffff 00000097
!	Mem[0000000030141420] = ed34871b 037de60a 000000ff 40625eff
!	Mem[0000000030141430] = 72000000 16a66f51 000000ff ff0000ff
	ldda	[%i5]ASI_BLK_SL,%f16	! Block Load from 0000000030141400
!	Mem[0000000010181408] = 1b8734ed 00000000, %l2 = ffffff00, %l3 = 00003900
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 000000001b8734ed 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l6 = 0000ff00a509aa5e
	ldsha	[%i1+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 00000039, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000039
!	Mem[0000000010101400] = 0000000000000039, %l6 = 00000000000000ff
	ldxa	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000039
!	Mem[0000000010001410] = 5eaa09a5, %l5 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l5	! %l5 = 000000005eaa09a5
!	Mem[0000000010101408] = ff000000 ff000000, %l4 = ff000000, %l5 = 5eaa09a5
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 00000000ff000000 00000000ff000000
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000000039
	lduba	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181420] = e35836212cced994, %f0  = 00000039 000000ff
	ldd	[%i6+0x020],%f0 	! %f0  = e3583621 2cced994
!	Starting 10 instruction Store Burst
!	%f2  = 00000000 00000000, Mem[00000000300c1400] = ff000000 00ff0000
	stda	%f2 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 00000000

!	Check Point 67 for processor 0

	set	p0_check_pt_data_67,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000052
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000001b8734ed
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000039
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = e3583621 2cced994
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = f778f552 0000e6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 16a66f51
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 97000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 0ae67d03 1b8734ed
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff5e6240 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 516fa616 00000072
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff0000ff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 67 completed


p0_label_336:
!	Mem[00000000201c0000] = ffffafd5, %l6 = 0000000000000000
	ldstub	[%o0+%g0],%l6		! %l6 = 000000ff000000ff
!	%l1 = 0000000000000052, Mem[0000000030081410] = 000000ff
	stba	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000052
!	%l0 = 0000000000000000, Mem[0000000030081400] = 00000000
	stba	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%f24 = 0ae67d03 1b8734ed, Mem[0000000010181400] = 00000000 ff000000
	stda	%f24,[%i6+%g0]0x80	! Mem[0000000010181400] = 0ae67d03 1b8734ed
!	%f16 = 00000000 000000ff, %l3 = 0000000000000000
!	Mem[0000000010101420] = e35836212cced994
	add	%i4,0x020,%g1
	stda	%f16,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010101420] = e35836212cced994
!	%l4 = 00000000ff000000, Mem[0000000030081410] = 00000052
	stwa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = ff000000
!	%f0  = e3583621 2cced994, Mem[00000000300c1400] = 00000000 00000000
	stda	%f0 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = e3583621 2cced994
!	%f0  = e3583621 2cced994, Mem[0000000010081408] = ffffffff 00ff0000
	stda	%f0 ,[%i2+%o4]0x80	! Mem[0000000010081408] = e3583621 2cced994
!	Mem[0000000010101400] = 00000039, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 00000039000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff000000 00000000 ff000000 ff000000
!	Mem[0000000030041410] = 00000000 00000000 00000000 ffff0000
!	Mem[0000000030041420] = ffe60000 ff00f552 80a2ecaa 77a322cb
!	Mem[0000000030041430] = 35d3531a 3d7be6ff 74bd5edc 52d51ebb
	ldda	[%i1]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030041400

p0_label_337:
!	Mem[0000000030041408] = 000000ff, %l1 = 0000000000000052
	lduwa	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = fff578f70000fb04, %l4 = 00000000ff000000
	ldxa	[%i2+%o4]0x81,%l4	! %l4 = fff578f70000fb04
!	Mem[0000000010141410] = 00ff0000, %l1 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = 0000000000ff0000
!	Mem[0000000010041410] = ff000000 a509aa5e, %l0 = 00000039, %l1 = 00ff0000
	ldda	[%i1+%o5]0x80,%l0	! %l0 = 00000000ff000000 00000000a509aa5e
!	Mem[0000000010001438] = 62ef00ff000000ff, %f10 = cb22a377 aaeca280
	ldd	[%i0+0x038],%f10	! %f10 = 62ef00ff 000000ff
!	Mem[0000000030101400] = 00000000 00000000, %l4 = 0000fb04, %l5 = ff000000
	ldda	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010041430] = 037d0000 00000000, %l2 = 1b8734ed, %l3 = 00000000
	ldda	[%i1+0x030]%asi,%l2	! %l2 = 00000000037d0000 0000000000000000
!	Mem[0000000010081410] = 00000000, %l7 = 0000000000000039
	lduwa	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000300c1400] = e3583621
	stba	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00583621

p0_label_338:
!	%f9  = 0000e6ff, Mem[0000000010041410] = ff000000
	sta	%f9 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000e6ff
!	%l5 = 0000000000000000, Mem[00000000100c1410] = ff00000000000000
	stxa	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010081410] = 00000000
	stha	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%l5 = 0000000000000000, Mem[00000000300c1400] = 94d9ce2c21365800
	stxa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%f14 = bb1ed552 dc5ebd74, Mem[00000000300c1410] = ffffff00 876d370c
	stda	%f14,[%i3+%o5]0x89	! Mem[00000000300c1410] = bb1ed552 dc5ebd74
	membar	#Sync			! Added by membar checker (57)
!	%l3 = 0000000000000000, Mem[0000000030141400] = ff00000000000000
	stxa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000000
!	Mem[0000000030181410] = 66000000, %l1 = 00000000a509aa5e
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 0000000066000000
!	%l6 = 0000000000000000, Mem[0000000010101408] = 000000ff
	stba	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffffff00, %l3 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l3	! %l3 = 000000000000ffff

p0_label_339:
!	Mem[0000000030101400] = 00000000, %f30 = bb1ed552
	lda	[%i4+%g0]0x81,%f30	! %f30 = 00000000
!	Mem[0000000010141400] = 00003900, %f4  = 00000000
	lda	[%i5+%g0]0x88,%f4 	! %f4 = 00003900
!	Mem[0000000010081428] = cb22a377, %l0 = 00000000ff000000
	ldswa	[%i2+0x028]%asi,%l0	! %l0 = ffffffffcb22a377
!	Mem[0000000030141400] = 00000000, %l6 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 1b8734ed, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = 000000001b8734ed
!	Mem[0000000030041410] = 00000000, %l4 = 000000001b8734ed
	ldsha	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = a509aa5e, %l6 = 0000000000000000
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = 000000000000005e
!	Mem[0000000010081400] = 80a2ecaa, %l7 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l7	! %l7 = 000000000000ecaa
!	Mem[0000000010181400] = 037de60a, %l7 = 000000000000ecaa
	lduwa	[%i6+%g0]0x88,%l7	! %l7 = 00000000037de60a
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000ffff, Mem[00000000300c1410] = 74bd5edc
	stha	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffff5edc

p0_label_340:
!	Mem[0000000030141400] = 00000000, %l5 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%l6 = 0000005e, %l7 = 037de60a, Mem[0000000030041410] = 00000000 00000000
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000005e 037de60a
!	%f24 = 52f500ff 0000e6ff, Mem[0000000030001400] = ff000000 00000000
	stda	%f24,[%i0+%g0]0x81	! Mem[0000000030001400] = 52f500ff 0000e6ff
!	%l5 = 0000000000000000, Mem[0000000010081400] = 0039000080a2ecaa
	stxa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000000
!	%l3 = 000000000000ffff, Mem[000000001018143c] = ff000000
	stw	%l3,[%i6+0x03c]		! Mem[000000001018143c] = 0000ffff
!	%l3 = 000000000000ffff, Mem[0000000010181410] = 00ff000000000039
	stxa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000000000ffff
!	Mem[0000000010181400] = 0ae67d03, %l2 = 00000000037d0000
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 000000000ae67d03
!	Mem[0000000010081410] = 00000000, %l6 = 000000000000005e
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800000] = ff00bb34, %l6 = 0000000000000000
	ldstub	[%o1+%g0],%l6		! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00003900, %f13 = 00000000
	lda	[%i0+%o5]0x81,%f13	! %f13 = 00003900

!	Check Point 68 for processor 0

	set	p0_check_pt_data_68,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffcb22a377
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000066000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = 00000000037de60a
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = e3583621 2cced994
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00003900 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 62ef00ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 00003900
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 0000ffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 52f500ff 0000e6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = cb22a377 aaeca280
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffe67b3d 1a53d335
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 dc5ebd74
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 68 completed


p0_label_341:
!	Mem[00000000211c0000] = 00ffe4d2, %l2 = 000000000ae67d03
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Code Fragment 4
p0_fragment_13:
!	%l0 = ffffffffcb22a377
	setx	0xd102347ff4062424,%g7,%l0 ! %l0 = d102347ff4062424
!	%l1 = 0000000066000000
	setx	0x594e04a84716e95a,%g7,%l1 ! %l1 = 594e04a84716e95a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d102347ff4062424
	setx	0xf4bf261f8aa9a409,%g7,%l0 ! %l0 = f4bf261f8aa9a409
!	%l1 = 594e04a84716e95a
	setx	0x7eae4c17fb4d16b8,%g7,%l1 ! %l1 = 7eae4c17fb4d16b8
!	Mem[0000000030141410] = 000000ff, %l2 = 00000000000000ff
	ldsba	[%i5+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c141c] = 000000ff, %l5 = 0000000000000000
	lduba	[%i3+0x01f]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181410] = 5eaa09a5, %l4 = 0000000000000000
	ldsha	[%i6+%o5]0x89,%l4	! %l4 = 00000000000009a5
!	Mem[0000000010141408] = 00000000, %l0 = f4bf261f8aa9a409
	lduwa	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = 213658e3, %l3 = 000000000000ffff
	ldsba	[%i2+%o4]0x88,%l3	! %l3 = ffffffffffffffe3
!	Mem[00000000211c0000] = 00ffe4d2, %l6 = 00000000000000ff
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041408] = ffff0000, %l1 = 7eae4c17fb4d16b8
	lduha	[%i1+%o4]0x80,%l1	! %l1 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 00000000, %l4 = 00000000000009a5
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff

p0_label_342:
!	%l7 = 00000000037de60a, Mem[0000000010141408] = 00000000
	stba	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 0a000000
!	%f26 = cb22a377 aaeca280, Mem[0000000030181410] = 5eaa09a5 00000000
	stda	%f26,[%i6+%o5]0x89	! Mem[0000000030181410] = cb22a377 aaeca280
!	%f30 = 00000000, Mem[0000000030041410] = 0000005e
	sta	%f30,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l6 = 000000ff, %l7 = 037de60a, Mem[0000000010141400] = 00003900 52f578f7
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff 037de60a
!	Mem[00000000300c1408] = 00000000, %l3 = ffffffffffffffe3
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = ff000000, %l2 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000300c1400] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141410] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000300c1400] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i3+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = aaeca280, %l1 = 000000000000ffff
	lduba	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000080

p0_label_343:
!	Mem[00000000300c1410] = ffff5edc, %l0 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101408] = ff000000ff000000, %l5 = 00000000000000ff
	ldxa	[%i4+%o4]0x88,%l5	! %l5 = ff000000ff000000
!	Mem[00000000100c1410] = 000000ff, %l6 = 0000000000000000
	lduwa	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081438] = d1e0a5d0, %l4 = 00000000000000ff
	ldsh	[%i2+0x03a],%l4		! %l4 = ffffffffffffa5d0
!	Mem[0000000030101408] = 000000ff, %l6 = 00000000000000ff
	ldsha	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000211c0000] = 00ffe4d2, %l0 = 00000000000000ff
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000080
	ldsba	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = ff000000, %l4 = ffffffffffffa5d0
	lduw	[%i2+%o5],%l4		! %l4 = 00000000ff000000
!	Mem[0000000030141410] = ff000000ffffffff, %l6 = 00000000000000ff
	ldxa	[%i5+%o5]0x81,%l6	! %l6 = ff000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = 5e00e589, %l7 = 00000000037de60a
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 0000005e000000ff

p0_label_344:
!	%f12 = 00000000 00003900, Mem[0000000010081410] = ff000000 ff000000
	std	%f12,[%i2+%o5]	! Mem[0000000010081410] = 00000000 00003900
!	%f16 = 00000000 000000ff 000000ff 000000ff
!	%f20 = 00000000 00000000 0000ffff 00000000
!	%f24 = 52f500ff 0000e6ff cb22a377 aaeca280
!	%f28 = ffe67b3d 1a53d335 00000000 dc5ebd74
	stda	%f16,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
!	%l7 = 000000000000005e, Mem[0000000010141407] = 0ae67d03, %asi = 80
	stba	%l7,[%i5+0x007]%asi	! Mem[0000000010141404] = 0ae67d5e
!	%l2 = 00000000000000ff, Mem[0000000010041400] = 0000ff00000000ff
	stxa	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l7 = 000000000000005e
	swapa	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1417] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i3+0x017]%asi,%l0	! %l0 = 00000000000000ff
!	%f6  = 0000ffff 00000000, %l0 = 0000000000000000
!	Mem[0000000030041428] = 80a2ecaa77a322cb
	add	%i1,0x028,%g1
	stda	%f6,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030041428] = 80a2ecaa77a322cb
!	Mem[00000000211c0000] = 00ffe4d2, %l4 = 00000000ff000000
	ldstub	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030081410] = 000000ff
	stha	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 516fa616, %l4 = 0000000000000000
	lduba	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000051

p0_label_345:
!	Mem[0000000010041410] = 0000e6ff, %l2 = 00000000000000ff
	lduha	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 0000ffff, %l1 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l1	! %l1 = 000000000000ffff
	membar	#Sync			! Added by membar checker (58)
!	Mem[0000000010101408] = 000000ff, %f10 = 62ef00ff
	lda	[%i4+%o4]0x88,%f10	! %f10 = 000000ff
!	Mem[0000000030181408] = a4c6c247, %l5 = ff000000ff000000
	lduba	[%i6+%o4]0x81,%l5	! %l5 = 00000000000000a4
!	Mem[0000000010101408] = 000000ff000000ff, %f20 = 00000000 00000000
	ldda	[%i4+%o4]0x88,%f20	! %f20 = 000000ff 000000ff
!	Mem[0000000010041400] = 00000000, %l1 = 000000000000ffff
	lduba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l2 = 0000000000000000
	lduw	[%i4+%o5],%l2		! %l2 = 0000000000000000
!	Mem[0000000030001410] = 00003900 00000000, %l4 = 00000051, %l5 = 000000a4
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 0000000000003900 0000000000000000
!	Mem[0000000010101410] = 00000000, %l2 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = 52f500ff 0000e6ff, Mem[0000000030101410] = 5eaa09a5 3dffffff
	stda	%f24,[%i4+%o5]0x81	! Mem[0000000030101410] = 52f500ff 0000e6ff

!	Check Point 69 for processor 0

	set	p0_check_pt_data_69,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000003900
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ff000000ffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00003900 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 69 completed


p0_label_346:
!	Mem[00000000300c1400] = 0000005e, %l6 = ff000000ffffffff
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 000000000000005e
!	Mem[0000000030081400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010181400] = 037d00001b8734ed
	stxa	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000000000ff
!	%l0 = 0000000000000000, Mem[00000000100c1410] = ff000000
	stha	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[0000000010081418] = 6600ff0000000000, %l4 = 0000000000003900, %l6 = 000000000000005e
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = 6600ff0000000000
!	%l3 = 0000000000000000, Mem[0000000030001400] = ffe60000ff00f552
	stxa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000000
!	Mem[0000000030001408] = 62ef00ff, %l2 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 0000000062ef00ff
!	%l7 = 00000000000000ff, Mem[000000001010140e] = ff000000
	stb	%l7,[%i4+0x00e]		! Mem[000000001010140c] = ff00ff00
!	%l1 = 0000000000000000, Mem[0000000010041428] = ff000000ff000000, %asi = 80
	stxa	%l1,[%i1+0x028]%asi	! Mem[0000000010041428] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %l0 = 0000000000000000
	lduba	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000

p0_label_347:
!	Mem[0000000010041410] = 0000e6ff, %l4 = 0000000000003900
	ldswa	[%i1+%o5]0x80,%l4	! %l4 = 000000000000e6ff
!	Mem[00000000300c1410] = ffff5edc52d51ebb, %l5 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l5	! %l5 = ffff5edc52d51ebb
!	Mem[0000000030101410] = 52f500ff, %l2 = 0000000062ef00ff
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000052
!	Mem[0000000010081410] = 0000000000003900, %f4  = 00003900 00000000
	ldda	[%i2+%o5]0x80,%f4 	! %f4  = 00000000 00003900
!	Mem[0000000010041400] = 00000000, %f4  = 00000000
	lda	[%i1+%g0]0x88,%f4 	! %f4 = 00000000
!	Mem[00000000100c1400] = 00ff0000 ff0000ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%g0]0x88,%l0	! %l0 = 00000000ff0000ff 0000000000ff0000
!	Mem[0000000010081408] = e3583621, %l4 = 000000000000e6ff
	ldsb	[%i2+0x00b],%l4		! %l4 = 0000000000000021
!	Mem[0000000030001400] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[000000001010140c] = ff00ff00, %l1 = 0000000000ff0000
	ldub	[%i4+0x00e],%l1		! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081404] = 00000000, %l3 = 00000000, %l0 = ff0000ff
	add	%i2,0x04,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 0000000000000000

p0_label_348:
!	%l7 = 0000000000000000, Mem[0000000030101410] = 52f500ff0000e6ff
	stxa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010141420] = 0000000000000000, %asi = 80
	stxa	%l0,[%i5+0x020]%asi	! Mem[0000000010141420] = 0000000000000000
!	Mem[0000000010081408] = e3583621, %l5 = ffff5edc52d51ebb
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 000000e3000000ff
!	%f4  = 00000000 00003900, Mem[0000000030041408] = 000000ff 000000ff
	stda	%f4 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 00003900
!	%f10 = 000000ff 000000ff, Mem[0000000010101400] = ff000000 00000000
	std	%f10,[%i4+%g0]	! Mem[0000000010101400] = 000000ff 000000ff
!	%l0 = 0000000000000000, Mem[0000000030101400] = 00000000
	stba	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Mem[00000000300c1408] = 000000ff, %l1 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%f4  = 00000000 00003900, Mem[00000000100c1408] = ff000000 00000000
	std	%f4 ,[%i3+%o4]	! Mem[00000000100c1408] = 00000000 00003900
!	%f4  = 00000000 00003900, Mem[0000000030041410] = 00000000 0ae67d03
	stda	%f4 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 00003900
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000000021
	ldsha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_349:
!	%f0  = e3583621 2cced994 00000000 00000000
!	%f4  = 00000000 00003900 0000ffff 00000000
!	%f8  = f778f552 0000e6ff 000000ff 000000ff
!	%f12 = 00000000 00003900 bb1ed552 dc5ebd74
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	Mem[0000000010101400] = 000000ff000000ff, %f18 = 000000ff 000000ff
	ldda	[%i4+%g0]0x80,%f18	! %f18 = 000000ff 000000ff
	membar	#Sync			! Added by membar checker (59)
!	Mem[0000000030041410] = 00000000, %f28 = ffe67b3d
	lda	[%i1+%o5]0x81,%f28	! %f28 = 00000000
!	Mem[0000000010041408] = 0000ffff, %l4 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 000000000000ffff
!	Mem[0000000020800040] = ff00e589, %l2 = 0000000000000052
	lduha	[%o1+0x040]%asi,%l2	! %l2 = 000000000000ff00
!	Mem[00000000211c0000] = ffffe4d2, %l4 = 000000000000ffff
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010081408] = ff583621, %l1 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1410] = dc5effff, %l5 = 00000000000000e3
	lduwa	[%i3+%o5]0x89,%l5	! %l5 = 00000000dc5effff
!	Mem[0000000010141400] = 000000ff, %l7 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff0000ff, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 00000000ff0000ff

p0_label_350:
!	Mem[0000000010001428] = 00000000ff800000, %l6 = 6600ff0000000000, %l5 = 00000000dc5effff
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l6,%l5	! %l5 = 00000000ff800000
!	%l5 = 00000000ff800000, Mem[0000000010101400] = ff000000ff000000
	stxa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000ff800000
!	Mem[0000000010041400] = 00000000, %l1 = ffffffffffffffff
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%f20 = 000000ff 000000ff, Mem[00000000100c1408] = 00000000 00003900
	std	%f20,[%i3+%o4]	! Mem[00000000100c1408] = 000000ff 000000ff
!	Mem[0000000030041410] = 00000000, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%f7  = 00000000, Mem[0000000010101410] = ff000000
	sta	%f7 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	Mem[0000000010101400] = 000080ff, %l6 = 6600ff0000000000
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 0000ffff, %l3 = 00000000ff0000ff
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	%f13 = 00003900, %f4  = 00000000
	fitos	%f13,%f4 		! %f4  = 46640000

!	Check Point 70 for processor 0

	set	p0_check_pt_data_70,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ff800000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = e3583621 2cced994
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 46640000 00003900
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x60],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 1a53d335
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 70 completed


p0_label_351:
!	Mem[0000000030101408] = ff000000, %f3  = 00000000
	lda	[%i4+%o4]0x81,%f3 	! %f3 = ff000000
!	Mem[0000000010081408] = ff583621, %l7 = 00000000000000ff
	lduwa	[%i2+%o4]0x80,%l7	! %l7 = 00000000ff583621
!	Mem[00000000300c1410] = bb1ed552dc5effff, %l1 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l1	! %l1 = bb1ed552dc5effff
!	Mem[0000000030001410] = 00390000, %l1 = bb1ed552dc5effff
	lduha	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i5+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %l7 = 00000000ff583621
	ldsba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = ffffafd5, %l7 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030081410] = ff000000, %l0 = ffffffffffffffff
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 00ffffff, %l5 = 00000000ff800000
	lduha	[%i0+%o4]0x88,%l5	! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f26 = cb22a377 aaeca280, Mem[0000000010041410] = ffe60000 5eaa09a5
	stda	%f26,[%i1+%o5]0x88	! Mem[0000000010041410] = cb22a377 aaeca280

p0_label_352:
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x010]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = 47c2c6a4, %l1 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 000000a4000000ff
!	%l5 = 000000000000ffff, Mem[0000000010181400] = 00000000
	stwa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000ffff
!	Mem[0000000010041438] = 000000ff0000ff00, %l6 = 0000000000000000, %l4 = ffffffffffffffff
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = 000000ff0000ff00
!	%l0 = 0000000000000000, Mem[0000000030181410] = aaeca280
	stba	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = aaeca200
!	Mem[0000000010081400] = 00000000, %l1 = 00000000000000a4
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%l7 = 000000000000ffff, Mem[0000000010141410] = 0000ff00
	stba	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000ffff
!	Mem[0000000010181410] = 0000ffff, %l6 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l6	! %l6 = 000000000000ffff
!	%f9  = 0000e6ff, Mem[00000000100c1408] = 000000ff
	sta	%f9 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000e6ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 213658e3, %l6 = 000000000000ffff
	lduha	[%i1+%g0]0x89,%l6	! %l6 = 00000000000058e3

p0_label_353:
!	Mem[00000000100c1400] = 00ff0000 00000000, %l6 = 000058e3, %l7 = 0000ffff
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000ff0000
!	Mem[00000000201c0000] = ffffafd5, %l4 = 000000ff0000ff00
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = ff000000, %l1 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030081408] = f778f5ff, %l7 = 0000000000ff0000
	lduha	[%i2+%o4]0x89,%l7	! %l7 = 000000000000f5ff
!	Mem[0000000010001400] = cb22a377aaeca280, %f8  = f778f552 0000e6ff
	ldda	[%i0+%g0]0x88,%f8 	! %f8  = cb22a377 aaeca280
!	Mem[0000000020800040] = ff00e589, %l0 = 0000000000000000
	ldsb	[%o1+0x040],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000211c0000] = ffffe4d2, %l4 = ffffffffffffffff
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[00000000100c1400] = 000000000000ff00, %l3 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[0000000030141408] = 16a66f51, %l7 = 000000000000f5ff
	ldsba	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000051
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[0000000030001408] = 00000000
	stha	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = ffff0000

p0_label_354:
!	Mem[0000000010041410] = aaeca280, %l7 = 0000000000000051
	ldsba	[%i1+%o5]0x88,%l7	! %l7 = ffffffffffffff80
!	%l4 = ffffffffffffffff, Mem[00000000100c1410] = 000000ff
	stwa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffff
!	%l4 = ffffffff, %l5 = 0000ffff, Mem[0000000030081410] = 000000ff 3dffffff
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffff 0000ffff
!	%l1 = 00000000ff000000, Mem[0000000010181400] = ffff0000
	stha	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = ffff0000
!	Mem[00000000300c1408] = 000000ff, %l3 = 000000000000ff00
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%f23 = 00000000, Mem[0000000010041410] = aaeca280
	sta	%f23,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Mem[0000000010141400] = ff000000, %l2 = 000000000000ff00
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%l6 = 0000000000000000, Mem[00000000300c1400] = ffffffff
	stwa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l3 = 00000000000000ff, Mem[00000000100c1410] = ffffffff
	stwa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ffff0000, %f13 = 00003900
	lda	[%i0+%o4]0x81,%f13	! %f13 = ffff0000

p0_label_355:
!	Mem[0000000030141400] = 00000000, %l6 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ffffe4d2, %l1 = 00000000ff000000
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030101400] = 00000000, %l5 = 000000000000ffff
	lduwa	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = ffffe4d2, %l1 = ffffffffffffffff
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000ffff
!	Mem[000000001014140c] = 000000ff, %l3 = 00000000000000ff
	lduwa	[%i5+0x00c]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101418] = 00000000ffff0000, %f24 = 52f500ff 0000e6ff
	ldda	[%i4+0x018]%asi,%f24	! %f24 = 00000000 ffff0000
!	Mem[0000000010181408] = 1b8734ed, %f12 = 00000000
	lda	[%i6+%o4]0x80,%f12	! %f12 = 1b8734ed
!	Mem[0000000030181400] = ffffffff, %f25 = ffff0000
	lda	[%i6+%g0]0x89,%f25	! %f25 = ffffffff
!	Mem[0000000030081410] = ffffffff, %l0 = ffffffffffffffff
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000000, %l5 = 0000000000000000
	ldstub	[%i6+%o5],%l5		! %l5 = 00000000000000ff

!	Check Point 71 for processor 0

	set	p0_check_pt_data_71,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffff80
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0000ffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = cb22a377 aaeca280
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 1b8734ed ffff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 71 completed


p0_label_356:
!	%l5 = 0000000000000000, Mem[0000000030101410] = 0000000000000000
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l4 = ffffffffffffffff
	lduba	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800041] = ff00e589, %l1 = 000000000000ffff
	ldstub	[%o1+0x041],%l1		! %l1 = 00000000000000ff
!	%l0 = ffffffffffffffff, Mem[0000000010001427] = 213658e3, %asi = 80
	stba	%l0,[%i0+0x027]%asi	! Mem[0000000010001424] = 213658ff
!	Mem[0000000010001410] = a509aa5e, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000a509aa5e
!	%f6  = 0000ffff 00000000, %l2 = 00000000000000ff
!	Mem[00000000300c1430] = 0000000000000000
	add	%i3,0x030,%g1
	stda	%f6,[%g1+%l2]ASI_PST16_SL ! Mem[00000000300c1430] = 00000000ffff0000
!	%l4 = 0000000000000000, Mem[0000000010001410] = 0000ff0000000000
	stxa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	%l1 = 0000000000000000, Mem[00000000100c1408] = 0000e6ff
	stba	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000e6ff
!	%f26 = cb22a377, Mem[0000000010141410] = ffff0000
	sta	%f26,[%i5+%o5]0x80	! Mem[0000000010141410] = cb22a377
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ed34871b, %l7 = ffffffffffffff80
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = 000000000000001b

p0_label_357:
!	Mem[00000000100c1410] = 000000ff, %l5 = 0000000000000000
	lduha	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (60)
!	Mem[0000000030181400] = ffffffff 0000ffff ffc6c247 35d3531a
!	Mem[0000000030181410] = 00a2ecaa 77a322cb 00000000 00000000
!	Mem[0000000030181420] = e3583621 2cced994 2dee399f 47c2c6a4
!	Mem[0000000030181430] = 00000000 00000000 ff000000 ff000000
	ldda	[%i6]ASI_BLK_SL,%f16	! Block Load from 0000000030181400
!	Mem[00000000201c0000] = ffffafd5, %l0 = ffffffffffffffff
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	%l6 = 00000000a509aa5e, Mem[0000000010141410] = cb22a377
	stwa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = a509aa5e
!	Mem[0000000010001414] = 00000000, %l0 = ffffffffffffffff
	ldsw	[%i0+0x014],%l0		! %l0 = 0000000000000000
!	Mem[0000000030081408] = 04fb0000f778f5ff, %l1 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l1	! %l1 = 04fb0000f778f5ff
!	Mem[0000000030041410] = 00000000, %l1 = 04fb0000f778f5ff
	lduba	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000218000c0] = ffffcd54, %l6 = 00000000a509aa5e
	ldsb	[%o3+0x0c1],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010101400] = ff0080ff, %l7 = 000000000000001b
	ldsba	[%i4+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (61)
!	%f13 = ffff0000, Mem[0000000030181408] = 47c2c6ff
	sta	%f13,[%i6+%o4]0x89	! Mem[0000000030181408] = ffff0000

p0_label_358:
!	%l2 = 00000000000000ff, Mem[0000000030141410] = 000000ff
	stha	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	%f22 = 00000000 00000000, Mem[0000000030001410] = 00390000 00000000
	stda	%f22,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 00000000
!	%l2 = 00000000000000ff, Mem[0000000030001410] = 00000000
	stba	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010001400] = aaeca280 cb22a377
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 000000ff
!	Mem[0000000030041410] = 00000000, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%f2  = 00000000 ff000000, Mem[0000000010181400] = ffff0000 ff000000
	stda	%f2 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 ff000000
!	%l2 = 00000000000000ff, Mem[0000000010141408] = 0000000a
	stwa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	%f12 = 1b8734ed ffff0000, %l5 = 00000000000000ff
!	Mem[0000000010001410] = 0000000000000000
	add	%i0,0x010,%g1
	stda	%f12,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010001410] = 0000ffffed34871b
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010101400] = ff8000ff 00000000
	stda	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 000000ff, %l2 = 00000000000000ff
	lduwa	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_359:
!	Mem[0000000030001408] = ff0000000000ffff, %l6 = ffffffffffffffff
	ldxa	[%i0+%o4]0x89,%l6	! %l6 = ff0000000000ffff
!	Mem[0000000010141434] = 00000000, %l4 = 0000000000000000
	lduw	[%i5+0x034],%l4		! %l4 = 0000000000000000
!	Mem[0000000010081428] = cb22a377aaeca280, %f12 = 1b8734ed ffff0000
	ldda	[%i2+0x028]%asi,%f12	! %f12 = cb22a377 aaeca280
!	Mem[0000000010101400] = ff000000, %l2 = 00000000000000ff
	ldsha	[%i4+0x000]%asi,%l2	! %l2 = ffffffffffffff00
!	Mem[00000000100c1408] = 0000e6ff000000ff, %f24 = 94d9ce2c 213658e3
	ldda	[%i3+%o4]0x80,%f24	! %f24 = 0000e6ff 000000ff
!	Mem[0000000030141410] = 000000ff, %l3 = 00000000000000ff
	ldsha	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = ffffffff, %l5 = 00000000000000ff
	ldsha	[%i1+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081400] = 000000ff, %l6 = ff0000000000ffff
	ldswa	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041400] = e3583621, %l4 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l4	! %l4 = 00000000000000e3
!	Starting 10 instruction Store Burst
!	%f24 = 0000e6ff, Mem[0000000030041410] = 00000000
	sta	%f24,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000e6ff

p0_label_360:
!	%l5 = ffffffffffffffff, Mem[0000000010041400] = ffffffff000000ff
	stxa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffffffffffff
!	%l3 = 00000000000000ff, Mem[0000000010081408] = ff583621
	stwa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff
!	%f8  = cb22a377 aaeca280, Mem[0000000030141408] = 516fa616 00000000
	stda	%f8 ,[%i5+%o4]0x81	! Mem[0000000030141408] = cb22a377 aaeca280
!	Mem[0000000010081410] = 00000000, %l2 = ffffffffffffff00
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f9  = aaeca280, Mem[0000000030101400] = 00000000
	sta	%f9 ,[%i4+%g0]0x81	! Mem[0000000030101400] = aaeca280
!	%l7 = ffffffffffffffff, Mem[0000000010001400] = 00000000ff000000
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffffffffffff
!	Mem[0000000010081413] = ff000000, %l4 = 00000000000000e3
	ldstub	[%i2+0x013],%l4		! %l4 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[00000000211c0000] = ffffe4d2, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ffe4d2
!	%l1 = 0000000000000000, Mem[0000000010141400] = ff000000
	stba	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffffff, %l3 = 00000000000000ff
	lduw	[%i1+%g0],%l3		! %l3 = 00000000ffffffff

!	Check Point 72 for processor 0

	set	p0_check_pt_data_72,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = cb22a377 aaeca280
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x50],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffff0000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x58],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 1a53d335 47c2c6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = cb22a377 aaeca200
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x68],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x70],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 0000e6ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x78],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = a4c6c247 9f39ee2d
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x80],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x88],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 72 completed


p0_label_361:
!	Mem[0000000010041410] = 00000000 77a322cb, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000 0000000077a322cb
!	Mem[0000000010141410] = a509aa5e, %f2  = 00000000
	lda	[%i5+%o5]0x80,%f2 	! %f2 = a509aa5e
!	Mem[000000001000140c] = 00000000, %l0 = 0000000000000000
	lduw	[%i0+0x00c],%l0		! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l3 = 00000000ffffffff
	lduwa	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101430] = 35d3531a, %l4 = 0000000000000000
	ldub	[%i4+0x031],%l4		! %l4 = 00000000000000d3
!	Mem[0000000030141408] = cb22a377, %l6 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffffcb
!	Mem[00000000300c1408] = 00ff0000, %l5 = ffffffffffffffff
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = 0000000000ff0000
!	Mem[0000000030101410] = 00000000, %l6 = ffffffffffffffcb
	lduba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 1b8734ed, %l4 = 00000000000000d3
	lduha	[%i6+%o4]0x80,%l4	! %l4 = 0000000000001b87
!	Starting 10 instruction Store Burst
!	%f2  = a509aa5e, Mem[0000000030181400] = ffffffff
	sta	%f2 ,[%i6+%g0]0x89	! Mem[0000000030181400] = a509aa5e

p0_label_362:
!	Mem[0000000030141400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030141400] = ff000000
	stba	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[0000000010101410] = 00000000, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = ffff0000, %l6 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 00000000ffff0000
!	Mem[00000000100c1403] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i3+0x003]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181418] = 00ff0000, %l7 = 0000000077a322cb
	swap	[%i6+0x018],%l7		! %l7 = 0000000000ff0000
!	%f18 = 1a53d335, Mem[0000000010101400] = ff000000
	st	%f18,[%i4+%g0]		! Mem[0000000010101400] = 1a53d335
!	%f28 = 00000000 00000000, Mem[0000000030141410] = ff000000 ffffffff
	stda	%f28,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 00000000
!	%l3 = 0000000000000000, Mem[0000000010001410] = 0000ffff, %asi = 80
	stwa	%l3,[%i0+0x010]%asi	! Mem[0000000010001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = ffffed58, %l2 = 0000000000000000
	lduh	[%o3+%g0],%l2		! %l2 = 000000000000ffff

p0_label_363:
!	Mem[0000000010041400] = ffffffff, %l7 = 0000000000ff0000
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041410] = 0000e6ff, %l6 = 00000000ffff0000
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l4 = 0000000000001b87
	lduba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = ff0000ff, %l4 = 0000000000000000
	ldsba	[%i2+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030081410] = ffffffff, %l0 = 0000000000000000
	ldsha	[%i2+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Code Fragment 3
p0_fragment_14:
!	%l0 = ffffffffffffffff
	setx	0x759cbedf9b95909b,%g7,%l0 ! %l0 = 759cbedf9b95909b
!	%l1 = 0000000000000000
	setx	0x49206e5865348521,%g7,%l1 ! %l1 = 49206e5865348521
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 759cbedf9b95909b
	setx	0x76afcba86cf13ca9,%g7,%l0 ! %l0 = 76afcba86cf13ca9
!	%l1 = 49206e5865348521
	setx	0x868a84378cff1f1b,%g7,%l1 ! %l1 = 868a84378cff1f1b
!	Mem[0000000010001400] = ffffffff, %f0  = e3583621
	lda	[%i0+%g0]0x80,%f0 	! %f0 = ffffffff
!	Mem[0000000010101400] = 1a53d335ff000000, %f30 = 000000ff 000000ff
	ldda	[%i4+0x000]%asi,%f30	! %f30 = 1a53d335 ff000000
!	Mem[0000000030141400] = 00000000, %l1 = 868a84378cff1f1b
	ldswa	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = a509aa5e, %l6 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 00000000a509aa5e

p0_label_364:
!	%l0 = 76afcba86cf13ca9, Mem[0000000030041410] = 0000e6ff
	stba	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = a900e6ff
!	%f18 = 1a53d335 47c2c6ff, %l2 = 000000000000ffff
!	Mem[0000000030081408] = fff578f70000fb04
	add	%i2,0x008,%g1
	stda	%f18,[%g1+%l2]ASI_PST32_S ! Mem[0000000030081408] = 1a53d33547c2c6ff
!	%l5 = 0000000000ff0000, Mem[0000000030081408] = 35d3531a
	stha	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 35d30000
!	%l1 = 0000000000000000, Mem[00000000100c1408] = 0000e6ff
	stha	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000e6ff
!	%l6 = a509aa5e, %l7 = ffffffff, Mem[0000000010001418] = 00000000 00000066
	std	%l6,[%i0+0x018]		! Mem[0000000010001418] = a509aa5e ffffffff
!	%f10 = 000000ff 000000ff, Mem[0000000010001400] = ffffffff ffffffff
	stda	%f10,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff 000000ff
!	%f4  = 46640000 00003900, Mem[0000000010181410] = ff000000 00000000
	stda	%f4 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 46640000 00003900
!	%f31 = ff000000, Mem[0000000010041438] = 000000ff
	sta	%f31,[%i1+0x038]%asi	! Mem[0000000010041438] = ff000000
!	%l4 = ffffffff, %l5 = 00ff0000, Mem[00000000300c1408] = 0000ff00 00000000
	stda	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffff 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000000ff, %l0 = 76afcba86cf13ca9
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_365:
!	Mem[0000000010001414] = ed34871b, %l6 = 00000000a509aa5e
	lduha	[%i0+0x014]%asi,%l6	! %l6 = 000000000000ed34
	membar	#Sync			! Added by membar checker (62)
!	Mem[0000000010141400] = 00000000 0ae67d5e ff000000 000000ff
!	Mem[0000000010141410] = 00000000 ff000000 16a66f51 ff000000
!	Mem[0000000010141420] = 00000000 00000000 16a66f51 ff000000
!	Mem[0000000010141430] = 00000000 00000000 74bd5edc ff000000
	ldda	[%i5]ASI_BLK_PL,%f16	! Block Load from 0000000010141400
!	Mem[00000000300c1408] = ffffffff, %l1 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030141410] = 00000000, %l6 = 000000000000ed34
	lduha	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = ed34871b, %f4  = 46640000
	lda	[%i6+%o4]0x88,%f4 	! %f4 = ed34871b
!	Mem[0000000010081400] = ff0000ff000000ff, %f12 = cb22a377 aaeca280
	ldda	[%i2+%g0]0x88,%f12	! %f12 = ff0000ff 000000ff
!	Mem[0000000010181400] = 000000ff 00000000, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000010081400] = ff000000ff0000ff, %f4  = ed34871b 00003900
	ldda	[%i2+%g0]0x80,%f4 	! %f4  = ff000000 ff0000ff
!	Mem[0000000010041410] = 00000000, %l0 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = ff00bb34, %l0 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l0	! %l0 = 000000ff000000ff

!	Check Point 73 for processor 0

	set	p0_check_pt_data_73,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000ff0000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ffffffff 2cced994
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = a509aa5e ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0000ffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ff0000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 5e7de60a 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 000000ff 516fa616
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 000000ff 516fa616
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 000000ff dc5ebd74
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 73 completed


p0_label_366:
!	Mem[000000001018141c] = 00000000, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x01c]%asi,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000ff0000, Mem[0000000010041410] = 00000000
	stba	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Mem[0000000010001439] = 62ef00ff, %l1 = 000000000000ffff
	ldstub	[%i0+0x039],%l1		! %l1 = 000000ef000000ff
!	Mem[0000000010141414] = ff000000, %l6 = 0000000000000000
	swap	[%i5+0x014],%l6		! %l6 = 00000000ff000000
!	%l6 = 00000000ff000000, Mem[0000000030081408] = 0000d33547c2c6ff
	stxa	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000ff000000
!	Mem[0000000030041408] = 00000000, %l6 = 00000000ff000000
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 000000ff, %l1 = 00000000000000ef
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030141400] = 0000000000000000
	stxa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000000
	membar	#Sync			! Added by membar checker (63)
!	%l0 = 00000000000000ff, Mem[0000000010141408] = ff000000000000ff
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ff00000000000000, %l6 = 0000000000000000
	ldxa	[%i1+%o4]0x81,%l6	! %l6 = ff00000000000000

p0_label_367:
!	Mem[00000000211c0000] = 00ffe4d2, %l1 = 00000000000000ff
	ldsh	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030041400] = e3583621, %f7  = 00000000
	lda	[%i1+%g0]0x81,%f7 	! %f7 = e3583621
!	Mem[0000000010001430] = ffffff3d, %l1 = 00000000000000ff
	swap	[%i0+0x030],%l1		! %l1 = 00000000ffffff3d
!	Mem[0000000010101414] = 00000000, %l7 = 0000000000000000
	ldsh	[%i4+0x016],%l7		! %l7 = 0000000000000000
!	Mem[0000000010081408] = 94d9ce2cff000000, %l2 = 000000000000ffff
	ldxa	[%i2+%o4]0x88,%l2	! %l2 = 94d9ce2cff000000
!	Mem[0000000030181408] = 1a53d335 ffff0000, %l0 = 000000ff, %l1 = ffffff3d
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 00000000ffff0000 000000001a53d335
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l4 = ffffffffffffffff
	ldswa	[%i4+%o4]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[0000000030001400] = 00000000, %l2 = 94d9ce2cff000000
	lduwa	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010001410] = 00000000 ed34871b
	std	%l2,[%i0+%o5]		! Mem[0000000010001410] = 00000000 00000000

p0_label_368:
!	%l0 = 00000000ffff0000, Mem[00000000211c0000] = 00ffe4d2
	sth	%l0,[%o2+%g0]		! Mem[00000000211c0000] = 0000e4d2
!	%l6 = ff00000000000000, Mem[0000000030081410] = ffff0000ffffffff
	stxa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = ff00000000000000
!	%l4 = ff000000, %l5 = 00ff0000, Mem[0000000010101408] = ff000000 ff00ff00
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000 00ff0000
!	Mem[00000000100c140c] = 000000ff, %l5 = 0000000000ff0000
	lduwa	[%i3+0x00c]%asi,%l5	! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010001400] = 000000ff000000ff
	stxa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	%l4 = ffffffffff000000, Mem[0000000010001400] = 0000000000000000
	stxa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffffff000000
!	%l1 = 000000001a53d335, Mem[0000000030041410] = ffe600a9
	stha	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = ffe6d335
!	%f30 = 000000ff dc5ebd74, Mem[0000000010001400] = ff000000 ffffffff
	stda	%f30,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff dc5ebd74
!	Mem[00000000100c1408] = 0000e6ff, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 1b8734ed, %l6 = ff00000000000000
	ldsba	[%i6+%o4]0x80,%l6	! %l6 = 000000000000001b

p0_label_369:
!	Mem[0000000010141408] = ff00000000000000, %f0  = ffffffff 2cced994
	ldda	[%i5+%o4]0x88,%f0 	! %f0  = ff000000 00000000
!	Mem[00000000100c1408] = ff00e6ff, %f0  = ff000000
	lda	[%i3+%o4]0x80,%f0 	! %f0 = ff00e6ff
!	Mem[0000000020800000] = ff00bb34, %l3 = 0000000000000000
	lduh	[%o1+%g0],%l3		! %l3 = 000000000000ff00
!	Mem[00000000300c1410] = dc5effff, %f10 = 000000ff
	lda	[%i3+%o5]0x89,%f10	! %f10 = dc5effff
!	Mem[00000000211c0000] = 0000e4d2, %l6 = 000000000000001b
	lduh	[%o2+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000030101408] = 000000ef, %l3 = 000000000000ff00
	ldsha	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ef
!	Mem[00000000100c1400] = ff000000, %l5 = 00000000000000ff
	lduba	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = 80a2ecaa 77a322cb, %l2 = 00000000, %l3 = 000000ef
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 0000000077a322cb 0000000080a2ecaa
!	Mem[00000000100c1420] = e35836212cced994, %l6 = 0000000000000000
	ldxa	[%i3+0x020]%asi,%l6	! %l6 = e35836212cced994
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ffffafd5, %l0 = 00000000ffff0000
	ldstub	[%o0+%g0],%l0		! %l0 = 000000ff000000ff

p0_label_370:
!	Mem[0000000010081410] = ff0000ff, %l1 = 000000001a53d335
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%f8  = cb22a377 aaeca280, Mem[0000000030081408] = 00000000 000000ff
	stda	%f8 ,[%i2+%o4]0x89	! Mem[0000000030081408] = cb22a377 aaeca280
!	%l5 = 0000000000000000, Mem[0000000010181410] = 46640000
	stba	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 00640000
!	%l2 = 0000000077a322cb, Mem[00000000100c1410] = ff000000
	stha	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 22cb0000
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000030101400] = aaeca280 00000000
	stda	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff 000000ff
!	%l1 = 00000000000000ff, Mem[0000000010101400] = 1a53d335
	stha	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 00ffd335
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000010141400] = 00000000 0ae67d5e
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff 000000ff
!	%l6 = e35836212cced994, Mem[00000000300c1400] = 0000000000000000
	stxa	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = e35836212cced994
!	%f28 = 00000000, Mem[0000000010101410] = 00000000
	sta	%f28,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000ff 0000ff00, %l6 = 2cced994, %l7 = 00000000
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000ff 000000000000ff00

!	Check Point 74 for processor 0

	set	p0_check_pt_data_74,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000077a322cb
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000080a2ecaa
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffff000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff00e6ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = a509aa5e ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0000ffff e3583621
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = dc5effff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1

!	Check Point 74 completed


p0_label_371:
!	Code Fragment 3
p0_fragment_15:
!	%l0 = 00000000000000ff
	setx	0x67d20dbfaa667d4d,%g7,%l0 ! %l0 = 67d20dbfaa667d4d
!	%l1 = 00000000000000ff
	setx	0xc9f8f4c825df701c,%g7,%l1 ! %l1 = c9f8f4c825df701c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 67d20dbfaa667d4d
	setx	0x371d2e0ff2de71a0,%g7,%l0 ! %l0 = 371d2e0ff2de71a0
!	%l1 = c9f8f4c825df701c
	setx	0x468c7167d1848eb1,%g7,%l1 ! %l1 = 468c7167d1848eb1
!	Mem[00000000300c1408] = ffffffff 0000ff00, %l2 = 77a322cb, %l3 = 80a2ecaa
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 00000000ffffffff 000000000000ff00
	membar	#Sync			! Added by membar checker (64)
!	Mem[0000000010001400] = 74bd5edc ff000000 ffffff00 00000000
!	Mem[0000000010001410] = 00000000 00000000 a509aa5e ffffffff
!	Mem[0000000010001420] = 000000ff 213658ff 00000000 ff800000
!	Mem[0000000010001430] = 000000ff 2d0064b3 62ff00ff 000000ff
	ldda	[%i0]ASI_BLK_PL,%f0	! Block Load from 0000000010001400
!	Mem[00000000100c1408] = ff00e6ff, %l2 = 00000000ffffffff
	ldsba	[%i3+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181400] = 000000ff, %l2 = ffffffffffffffff
	ldsha	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = ff00e6ff 000000ff, %l2 = 00000000, %l3 = 0000ff00
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 00000000ff00e6ff 00000000000000ff
!	Mem[0000000010181400] = ff000000, %l0 = 371d2e0ff2de71a0
	lduha	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 00ffffff, %l3 = 00000000000000ff
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010001410] = 0000000000000000, %l4 = ffffffffff000000
	ldxa	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = ff00e6ff, %l3 = 0000ffff, Mem[0000000010141418] = 16a66f51 ff000000
	stda	%l2,[%i5+0x018]%asi	! Mem[0000000010141418] = ff00e6ff 0000ffff

p0_label_372:
!	Mem[0000000030101400] = 000000ff, %l6 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l2 = 00000000ff00e6ff
	ldstuba	[%i5+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181410] = 00a2ecaa, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101418] = 00000000, %l1 = 468c7167d1848eb1
	ldstub	[%i4+0x018],%l1		! %l1 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010081400] = 000000ff
	stha	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	Mem[0000000010181400] = 000000ff, %l3 = 000000000000ffff
	ldstuba	[%i6+%g0]0x80,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (65)
!	%l3 = 0000000000000000, Mem[0000000010001408] = 00ffffff
	stba	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 00ffff00
!	%f24 = 00000000 00000000, %l5 = 0000000000000000
!	Mem[0000000010101428] = 80a2ecaa77a322cb
	add	%i4,0x028,%g1
	stda	%f24,[%g1+%l5]ASI_PST8_P ! Mem[0000000010101428] = 80a2ecaa77a322cb
!	%f16 = 5e7de60a, Mem[0000000030101400] = ff0000ff
	sta	%f16,[%i4+%g0]0x89	! Mem[0000000030101400] = 5e7de60a
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 74bd5edc, %f11 = 00000000
	lda	[%i0+%g0]0x80,%f11	! %f11 = 74bd5edc

p0_label_373:
!	Mem[0000000010141408] = 00000000000000ff, %l6 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041400] = ffffffff, %l0 = 0000000000000000
	lduba	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0000] = ffffafd5, %l1 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	lduwa	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 213658e3, %l1 = 000000000000ffff
	ldswa	[%i3+%g0]0x89,%l1	! %l1 = 00000000213658e3
!	Mem[00000000211c0000] = 0000e4d2, %l4 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = ffe600ff, %l1 = 00000000213658e3
	ldstuba	[%i3+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030041410] = ffe6d335, %l7 = 000000000000ff00
	ldsha	[%i1+%o5]0x89,%l7	! %l7 = ffffffffffffd335
!	Mem[00000000300c1400] = e35836212cced994, %l0 = 00000000000000ff
	ldxa	[%i3+%g0]0x81,%l0	! %l0 = e35836212cced994
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010141410] = 00000000000000ff
	stxa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000

p0_label_374:
!	%l3 = 0000000000000000, Mem[00000000201c0000] = ffffafd5, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000afd5
!	%l1 = 00000000000000ff, Mem[0000000010141408] = 00000000
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	Mem[0000000010181410] = 00640000, %l6 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010101400] = 35d3ff00
	stwa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	Mem[0000000010101418] = ff000000ffff0000, %l3 = 0000000000000000, %l3 = 0000000000000000
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = ff000000ffff0000
!	Mem[0000000021800181] = 52f9ae0c, %l6 = 0000000000000000
	ldstub	[%o3+0x181],%l6		! %l6 = 000000f9000000ff
!	%f26 = 000000ff, Mem[0000000030141408] = 77a322cb
	sta	%f26,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	Mem[00000000211c0001] = 0000e4d2, %l0 = e35836212cced994
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000021800000] = ffffed58, %l3 = ff000000ffff0000
	ldsha	[%o3+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000 00000000, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000 0000000000000000

p0_label_375:
!	Mem[0000000030081400] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l3 = ffffffffffffffff
	lduha	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 00ffe4d2, %l1 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141410] = 00000000 00000000, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = 00000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000020800000] = ff00bb34, %l5 = 0000000000000000
	lduba	[%o1+0x001]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %l6 = 00000000000000f9
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l0 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[00000000201c0000] = 0000afd5
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 0000afd5

!	Check Point 75 for processor 0

	set	p0_check_pt_data_75,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffd335
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff dc5ebd74
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00ffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffffffff 5eaa09a5
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ff583621 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 000080ff 74bd5edc
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = b364002d ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 ff00ff62
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1

!	Check Point 75 completed


p0_label_376:
!	%f30 = 000000ff dc5ebd74, %l7 = ffffffffffffd335
!	Mem[0000000010081408] = 000000ff2cced994
	add	%i2,0x008,%g1
	stda	%f30,[%g1+%l7]ASI_PST8_P ! Mem[0000000010081408] = 000000ff2c5ed974
!	%f12 = b364002d ff000000, Mem[0000000010001400] = 74bd5edc ff000000
	stda	%f12,[%i0+%g0]0x80	! Mem[0000000010001400] = b364002d ff000000
!	%l6 = 0000000000000000, Mem[0000000030101410] = 00000000
	stha	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l5 = 0000000000000000, Mem[00000000300c1410] = dc5effff
	stwa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[0000000030001408] = 0000ffff, %l7 = ffffffffffffd335
	swapa	[%i0+%o4]0x89,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030001410] = 000000ff, %l3 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030141400] = 00000000
	stha	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[0000000030141410] = 00000000, %l6 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffffff, %l7 = 000000000000ffff
	ldsha	[%i1+0x000]%asi,%l7	! %l7 = ffffffffffffffff

p0_label_377:
!	Mem[0000000030101410] = 00000000, %l3 = 00000000000000ff
	lduba	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[000000001014142c] = ff000000, %l7 = ffffffffffffffff
	ldsb	[%i5+0x02e],%l7		! %l7 = 0000000000000000
!	Mem[0000000030181408] = 0000ffff, %l7 = 0000000000000000
	lduwa	[%i6+%o4]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000021800140] = ffff9071, %l7 = 000000000000ffff
	lduha	[%o3+0x140]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000021800100] = ffff0ae8, %l2 = 00000000000000ff
	lduba	[%o3+0x100]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l4 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = 000000ff, %l4 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181410] = ffa2ecaa, %l5 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[00000000300c1400] = e3583621
	stwa	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000

p0_label_378:
!	Mem[0000000010101420] = ffe60000, %l6 = 0000000000000000
	swap	[%i4+0x020],%l6		! %l6 = 00000000ffe60000
!	%f6  = ffffffff, Mem[0000000010181404] = 00000000
	st	%f6 ,[%i6+0x004]	! Mem[0000000010181404] = ffffffff
!	Mem[0000000010101408] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030181408] = ffff0000, %l6 = 00000000ffe60000
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 00000000ffff0000
!	%f24 = 00000000 00000000, %l0 = 00000000000000ff
!	Mem[0000000030181408] = 0000e6ff35d3531a
	add	%i6,0x008,%g1
	stda	%f24,[%g1+%l0]ASI_PST32_S ! Mem[0000000030181408] = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l6 = 00000000ffff0000
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%f2  = 00000000 00ffffff, %l6 = 0000000000000000
!	Mem[0000000010141410] = 0000000000000000
	add	%i5,0x010,%g1
	stda	%f2,[%g1+%l6]ASI_PST16_P ! Mem[0000000010141410] = 0000000000000000
!	Mem[0000000010001434] = 2d0064b3, %l2 = 00000000000000ff
	ldstuba	[%i0+0x034]%asi,%l2	! %l2 = 0000002d000000ff
!	Mem[0000000010181400] = ff0000ff, %l4 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff640000, %l2 = 000000000000002d
	lduha	[%i6+%o5]0x80,%l2	! %l2 = 000000000000ff64

p0_label_379:
!	Mem[0000000010181400] = ff000000ffffffff, %l6 = 0000000000000000
	ldx	[%i6+%g0],%l6		! %l6 = ff000000ffffffff
!	Mem[0000000010141410] = 00000000, %l3 = 0000000000000000
	lduw	[%i5+%o5],%l3		! %l3 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %f28 = 00000000
	lda	[%i1+%o4]0x81,%f28	! %f28 = ff000000
!	Mem[0000000010181408] = 1b8734ed 00000000, %l2 = 0000ff64, %l3 = 00000000
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 000000001b8734ed 0000000000000000
!	Mem[00000000300c1408] = ffffffff, %l6 = ff000000ffffffff
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Code Fragment 3
p0_fragment_16:
!	%l0 = 00000000000000ff
	setx	0x409eede7c9b93f3d,%g7,%l0 ! %l0 = 409eede7c9b93f3d
!	%l1 = 0000000000000000
	setx	0xd7062b5816888fd5,%g7,%l1 ! %l1 = d7062b5816888fd5
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 409eede7c9b93f3d
	setx	0xdb0b91900c77e4c9,%g7,%l0 ! %l0 = db0b91900c77e4c9
!	%l1 = d7062b5816888fd5
	setx	0x2603640f94aa2a9e,%g7,%l1 ! %l1 = 2603640f94aa2a9e
!	Mem[0000000030081410] = 00000000, %l7 = 000000000000ffff
	lduwa	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = 35d3e6ff, %l7 = 0000000000000000
	ldsba	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000035
!	Mem[0000000010101424] = ff00f552, %l7 = 0000000000000035
	ldsw	[%i4+0x024],%l7		! %l7 = ffffffffff00f552
!	Starting 10 instruction Store Burst
!	%f10 = 000080ff 74bd5edc, Mem[00000000300c1400] = ffff0000 2cced994
	stda	%f10,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000080ff 74bd5edc

p0_label_380:
!	%l2 = 000000001b8734ed, Mem[0000000010101410] = 00000000
	stwa	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 1b8734ed
!	Mem[0000000010181410] = ff640000, %l4 = 00000000ff0000ff
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%f12 = b364002d ff000000, Mem[0000000030041408] = ff000000 00000000
	stda	%f12,[%i1+%o4]0x81	! Mem[0000000030041408] = b364002d ff000000
!	Mem[0000000010101410] = 1b8734ed, %l5 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 000000ed000000ff
!	Mem[00000000300c1410] = 00000000, %l0 = db0b91900c77e4c9
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = 0000000000000000, %l2 = 000000001b8734ed, %l0 = 0000000000000000
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = 0000000000000000
!	%l1 = 2603640f94aa2a9e, Mem[0000000010001414] = 00000000
	stw	%l1,[%i0+0x014]		! Mem[0000000010001414] = 94aa2a9e
!	%l7 = ffffffffff00f552, Mem[00000000100c1414] = 000000ff, %asi = 80
	stwa	%l7,[%i3+0x014]%asi	! Mem[00000000100c1414] = ff00f552
!	%l3 = 0000000000000000, Mem[0000000030141400] = 00000000
	stwa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = dc5ebd74ff800000, %f24 = 00000000 00000000
	ldda	[%i3+%g0]0x89,%f24	! %f24 = dc5ebd74 ff800000

!	Check Point 76 for processor 0

	set	p0_check_pt_data_76,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 2603640f94aa2a9e
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000001b8734ed
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ed
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffff00f552
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00ffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = dc5ebd74 ff800000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x58],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 76 completed


p0_label_381:
!	Mem[00000000300c1410] = 0c77e4c9, %l4 = 00000000000000ff
	ldsha	[%i3+%o5]0x89,%l4	! %l4 = ffffffffffffe4c9
!	Mem[000000001014143c] = ff000000, %l0 = 0000000000000000
	ldsh	[%i5+0x03c],%l0		! %l0 = ffffffffffffff00
!	Mem[00000000300c1408] = ffffffff, %l6 = ffffffffffffffff
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030081408] = aaeca280, %l1 = 2603640f94aa2a9e
	lduha	[%i2+%o4]0x89,%l1	! %l1 = 000000000000a280
!	Mem[0000000030141410] = 00000000 00000000, %l4 = ffffe4c9, %l5 = 000000ed
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030141400] = 00000000, %l0 = ffffffffffffff00
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l1 = 000000000000a280
	lduha	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = 0000000000000000, %l1 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = ef000000, %f5  = 00000000
	lda	[%i4+%o4]0x81,%f5 	! %f5 = ef000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 000000ff, %l6 = 00000000ffffffff
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff

p0_label_382:
!	Mem[0000000030001410] = 00000000, %l7 = ffffffffff00f552
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001400] = ff000000, %l6 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030141410] = 00000000, %l2 = 000000001b8734ed
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001400] = b364002d, %l6 = 00000000ff000000
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 000000b3000000ff
!	Mem[0000000010101400] = 00000000, %l0 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030041408] = b364002d
	stba	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 0064002d
!	%f16 = 5e7de60a 00000000 ff000000 000000ff
!	%f20 = 000000ff 00000000 000000ff 516fa616
!	%f24 = dc5ebd74 ff800000 000000ff 516fa616
!	%f28 = ff000000 00000000 000000ff dc5ebd74
	stda	%f16,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400
!	%f2  = 00000000 00ffffff, %l0 = 0000000000000000
!	Mem[0000000010141410] = 0000000000000000
	add	%i5,0x010,%g1
	stda	%f2,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010141410] = 0000000000000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (66)
!	Mem[0000000030081408] = ff000000, %l6 = 00000000000000b3
	ldswa	[%i2+%o4]0x81,%l6	! %l6 = ffffffffff000000

p0_label_383:
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 0000000000000000
	setx	0x5faf8778395fab85,%g7,%l0 ! %l0 = 5faf8778395fab85
!	%l1 = 0000000000000000
	setx	0x0e1f30ff8442fd3e,%g7,%l1 ! %l1 = 0e1f30ff8442fd3e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5faf8778395fab85
	setx	0x58f190d829b61990,%g7,%l0 ! %l0 = 58f190d829b61990
!	%l1 = 0e1f30ff8442fd3e
	setx	0xe6ba1e4ff77a7f15,%g7,%l1 ! %l1 = e6ba1e4ff77a7f15
!	Mem[0000000030041400] = e35836212cced994, %l7 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l7	! %l7 = e35836212cced994
!	Mem[0000000030181408] = 00000000000000ff, %f10 = 000080ff 74bd5edc
	ldda	[%i6+%o4]0x89,%f10	! %f10 = 00000000 000000ff
!	Mem[00000000100c142c] = 47c2c6a4, %l3 = 0000000000000000
	lduh	[%i3+0x02e],%l3		! %l3 = 000000000000c6a4
!	Mem[00000000100c1408] = ff00e6ff, %l3 = 000000000000c6a4
	ldswa	[%i3+%o4]0x80,%l3	! %l3 = ffffffffff00e6ff
!	Mem[0000000030101400] = 0ae67d5e, %l6 = ffffffffff000000
	ldsha	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000ae6
!	Mem[000000001010142c] = 77a322cb, %l6 = 0000000000000ae6
	lduha	[%i4+0x02c]%asi,%l6	! %l6 = 00000000000077a3
!	Mem[00000000201c0000] = 0000afd5, %l4 = 0000000000000000
	ldsh	[%o0+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010001418] = a509aa5e, %l4 = 0000000000000000
	ldub	[%i0+0x019],%l4		! %l4 = 0000000000000009
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00000000, %l7 = e35836212cced994
	ldstuba	[%i4+%g0]0x88,%l7	! %l7 = 00000000000000ff

p0_label_384:
!	%l7 = 0000000000000000, Mem[0000000010181418] = 77a322cb, %asi = 80
	stwa	%l7,[%i6+0x018]%asi	! Mem[0000000010181418] = 00000000
!	Mem[0000000030041400] = 213658e3, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 000000e3000000ff
!	%l1 = e6ba1e4ff77a7f15, Mem[0000000010041426] = 35d3531a, %asi = 80
	stba	%l1,[%i1+0x026]%asi	! Mem[0000000010041424] = 35d3151a
!	%f14 = ff000000 ff00ff62, Mem[0000000030181408] = 000000ff 00000000
	stda	%f14,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000 ff00ff62
!	Mem[00000000300c1400] = 000080ff, %l5 = 00000000000000e3
	swapa	[%i3+%g0]0x81,%l5	! %l5 = 00000000000080ff
!	%l6 = 00000000000077a3, Mem[0000000010141408] = ff000000
	stwa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 000077a3
!	%l2 = 0000000000000000, Mem[0000000021800041] = ffff9b4e, %asi = 80
	stba	%l2,[%o3+0x041]%asi	! Mem[0000000021800040] = ff009b4e
!	%f0  = 000000ff dc5ebd74 00000000 00ffffff
!	%f4  = 00000000 ef000000 ffffffff 5eaa09a5
!	%f8  = ff583621 ff000000 00000000 000000ff
!	%f12 = b364002d ff000000 ff000000 ff00ff62
	stda	%f0,[%i0]ASI_BLK_S	! Block Store to 0000000030001400
!	Mem[0000000030041410] = 35d3e6ff, %l3 = ffffffffff00e6ff
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 00000035000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l5 = 00000000000080ff
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_385:
	membar	#Sync			! Added by membar checker (67)
!	Mem[0000000010001400] = ff64002d ff000000, %l6 = 000077a3, %l7 = 00000000
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000ff64002d 00000000ff000000
!	Mem[0000000010141400] = ff000000, %l0 = 58f190d829b61990
	lduba	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %f18 = ff000000
	lda	[%i1+%o4]0x88,%f18	! %f18 = 00000000
!	Mem[0000000010081430] = 00000000, %l0 = 0000000000000000
	ldsba	[%i2+0x031]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = ffffffff ffffffff 00000000 00000000
!	Mem[0000000010041410] = 00000000 77a322cb 00000000 00000000
!	Mem[0000000010041420] = ed34871b 35d3151a 00000000 00000000
!	Mem[0000000010041430] = 037d0000 00000000 ff000000 0000ff00
	ldda	[%i1]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010041400
!	Mem[0000000030181400] = a509aa5e, %l3 = 0000000000000035
	lduba	[%i6+%g0]0x89,%l3	! %l3 = 000000000000005e
!	Mem[00000000201c0000] = 0000afd5, %l5 = 0000000000000000
	ldsb	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000030141410] = 00000000 000000ff, %l6 = ff64002d, %l7 = ff000000
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000030081408] = 000000ff, %l0 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010141400] = 000000ff000000ff
	stxa	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000000000ff

!	Check Point 77 for processor 0

	set	p0_check_pt_data_77,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = e6ba1e4ff77a7f15
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000005e
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000009
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 ef000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffffffff 5eaa09a5
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffffffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = cb22a377 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 1a15d335 1b8734ed
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 00007d03
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00ff0000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 77 completed


p0_label_386:
!	%f24 = 1a15d335 1b8734ed, Mem[0000000030181408] = ff00ff62 ff000000
	stda	%f24,[%i6+%o4]0x89	! Mem[0000000030181408] = 1a15d335 1b8734ed
!	%f28 = 00000000 00007d03, %l5 = 0000000000000000
!	Mem[0000000030181438] = ff000000ff000000
	add	%i6,0x038,%g1
	stda	%f28,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030181438] = ff000000ff000000
!	%f2  = 00000000, Mem[00000000100c1410] = 22cb0000
	sta	%f2 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[0000000030041408] = 0064002d, %l3 = 000000000000005e
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = ff000000, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 00000000ff000000
!	%f6  = ffffffff 5eaa09a5, Mem[0000000030101408] = 000000ef 000000ff
	stda	%f6 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffff 5eaa09a5
	membar	#Sync			! Added by membar checker (68)
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010041408] = 00000000 00000000
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff 00000000
!	Mem[00000000211c0001] = 00ffe4d2, %l6 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030081408] = 000000ff, %l6 = 00000000000000ff
	swapa	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff000000, %l6 = 00000000000000ff
	ldswa	[%i5+%o4]0x81,%l6	! %l6 = ffffffffff000000

p0_label_387:
!	Mem[0000000030101408] = a509aa5effffffff, %l7 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l7	! %l7 = a509aa5effffffff
!	Mem[0000000010181400] = ffffffff, %l5 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041400] = ff583621, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l2	! %l2 = 00000000ff583621
!	Mem[0000000010141420] = 00000000, %f13 = ff000000
	ld	[%i5+0x020],%f13	! %f13 = 00000000
!	Mem[0000000010101410] = 1b8734ff, %l6 = ffffffffff000000
	lduba	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081408] = 000000ff, %l1 = e6ba1e4ff77a7f15
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141408] = ff000000, %l6 = 00000000000000ff
	ldsba	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001408] = ffffff0000000000, %l6 = ffffffffffffffff
	ldxa	[%i0+%o4]0x89,%l6	! %l6 = ffffff0000000000
!	Mem[00000000201c0000] = 0000afd5, %l2 = 00000000ff583621
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000000009
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_388:
!	%f25 = 1b8734ed, Mem[0000000010101400] = ff000000
	sta	%f25,[%i4+%g0]0x80	! Mem[0000000010101400] = 1b8734ed
!	%l0 = 00000000000000ff, Mem[0000000030041408] = 2d0064ff
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 2d0000ff
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000030101400] = 0ae67d5e 000000ff
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 ffffffff
!	%f4  = 00000000, Mem[00000000300c1400] = 000000e3
	sta	%f4 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Mem[0000000030181408] = 1b8734ed, %l0 = 00000000000000ff
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 000000ed000000ff
!	Mem[0000000030081400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000000000ed, Mem[0000000030001400] = 74bd5edc00000000
	stxa	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000000000ed
!	%l7 = a509aa5effffffff, Mem[0000000030041400] = ff583621
	stwa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff
!	Mem[00000000300c1408] = ffffffff, %l3 = 00000000ff000000
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = 74bd5edc, %f24 = 1a15d335
	lda	[%i5+0x038]%asi,%f24	! %f24 = 74bd5edc

p0_label_389:
!	Mem[0000000010141400] = 00000000000000ff, %l2 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = 1b8734ed, %l0 = 00000000000000ed
	ldsha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000001b87
!	Mem[0000000030181400] = a509aa5e, %l5 = ffffffffffffffff
	lduba	[%i6+%g0]0x89,%l5	! %l5 = 000000000000005e
	membar	#Sync			! Added by membar checker (69)
!	Mem[0000000030081400] = ff000000 0ae67d5e ff000000 000000ff
!	Mem[0000000030081410] = 00000000 ff000000 16a66f51 ff000000
!	Mem[0000000030081420] = 000080ff 74bd5edc 16a66f51 ff000000
!	Mem[0000000030081430] = 00000000 000000ff 74bd5edc ff000000
	ldda	[%i2]ASI_BLK_AIUS,%f0	! Block Load from 0000000030081400
!	Mem[00000000100c1410] = 00000000, %l5 = 000000000000005e
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = 000000ff, %l2 = 00000000000000ff
	ldsba	[%i5+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141408] = 000077a3, %l1 = 00000000000000ff
	ldsha	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = 0000afd5, %l3 = 00000000000000ff
	lduh	[%o0+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000021800080] = acffb20f, %l6 = ffffff0000000000
	ldsb	[%o3+0x081],%l6		! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000ff

p0_label_390:
!	%l3 = 0000000000000000, Mem[0000000030141410] = 00000000000000ff
	stxa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010001400] = 000000ff2d0064ff
	stxa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	%f22 = 00000000 00000000, Mem[0000000010041400] = ffffffff ffffffff
	stda	%f22,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 00000000
!	%l6 = ffffffff, %l7 = ffffffff, Mem[0000000030001408] = 00000000 ffffff00
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff ffffffff
!	Mem[0000000010081400] = ff000000ff0000ff, %l6 = ffffffffffffffff, %l0 = 0000000000001b87
	casxa	[%i2]0x80,%l6,%l0	! %l0 = ff000000ff0000ff
!	Mem[0000000010001400] = 00000000, %l6 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%f22 = 00000000 00000000, Mem[0000000030001400] = 000000ed 00000000
	stda	%f22,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 00000000
!	%l5 = 0000000000000000, Mem[000000001000140a] = 00ffff00, %asi = 80
	stba	%l5,[%i0+0x00a]%asi	! Mem[0000000010001408] = 00ff0000
!	Mem[0000000030141408] = ff000000, %l2 = ffffffffffffffff
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 00000000ff000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (70)
!	%f22 = 00000000 00000000, Mem[0000000030081408] = ff000000 000000ff
	stda	%f22,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 00000000

!	Check Point 78 for processor 0

	set	p0_check_pt_data_78,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ff000000ff0000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = a509aa5effffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 0ae67d5e
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 16a66f51 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 000080ff 74bd5edc
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 16a66f51 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 74bd5edc ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 74bd5edc 1b8734ed
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 78 completed


p0_label_391:
!	Mem[00000000100c1408] = ffe600ff, %l3 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = 1b8734edff000000, %l1 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l1	! %l1 = 1b8734edff000000
!	Mem[0000000030001400] = 00000000, %l3 = ffffffffffffffff
	ldsba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0000] = 0000afd5, %l4 = 0000000000000000
	ldsb	[%o0+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010041400] = 00000000 00000000, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i1+0x000]%asi,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030081408] = 00000000, %l1 = 1b8734edff000000
	lduha	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l1 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = ffffffffffffffff, %f16 = ffffffff ffffffff
	ldda	[%i6+%g0]0x88,%f16	! %f16 = ffffffff ffffffff
!	Mem[0000000030041408] = 2d0000ff, %l2 = 00000000ff000000
	lduwa	[%i1+%o4]0x89,%l2	! %l2 = 000000002d0000ff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010181400] = ffffffffffffffff
	stxa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000000

p0_label_392:
!	Mem[0000000030181408] = 1b8734ff, %l0 = ff000000ff0000ff
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 000000001b8734ff
!	Mem[0000000010181410] = 00390000000064ff, %f10 = 16a66f51 ff000000
	ldda	[%i6+%o5]0x88,%f10	! %f10 = 00390000 000064ff
!	%l3 = 0000000000000000, Mem[000000001004140e] = 00000000
	stb	%l3,[%i1+0x00e]		! Mem[000000001004140c] = 00000000
!	%f14 = 74bd5edc ff000000, Mem[0000000010001408] = 00ff0000 00000000
	stda	%f14,[%i0+%o4]0x80	! Mem[0000000010001408] = 74bd5edc ff000000
!	%f19 = 00000000, Mem[0000000010081408] = 000000ff
	sta	%f19,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	Mem[0000000030101400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l0 = 000000001b8734ff, Mem[0000000010001410] = 0000000094aa2a9e
	stxa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000001b8734ff
!	Mem[0000000010101408] = ff000000, %l2 = 000000002d0000ff
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff00000077a322cb, %l6 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l6	! %l6 = ff00000077a322cb

p0_label_393:
!	Mem[0000000010101408] = ff000000, %l5 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[000000001010142c] = 77a322cb, %l4 = 0000000000000000
	lduw	[%i4+0x02c],%l4		! %l4 = 0000000077a322cb
!	Mem[0000000021800180] = 52ffae0c, %l6 = ff00000077a322cb
	ldsb	[%o3+0x180],%l6		! %l6 = 0000000000000052
!	Mem[0000000010001410] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = 74d95e2c 00000000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000 0000000074d95e2c
!	Mem[0000000010101410] = 1b8734ff, %l2 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = 00000000 000000ff, %l4 = 77a322cb, %l5 = 00000000
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = ff000000 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = ff000000, %l5 = 00000000, Mem[0000000030081408] = 00000000 00000000
	stda	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000 00000000

p0_label_394:
!	%f4  = 00000000, Mem[0000000030101408] = 5eaa09a5
	sta	%f4 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	Mem[0000000010101410] = 1b8734ff, %l2 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l2	! %l2 = 000000001b8734ff
!	%l2 = 000000001b8734ff, Mem[0000000030141410] = 00000000
	stha	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 000034ff
!	%l4 = 00000000ff000000, Mem[0000000010101408] = 000000ff
	stwa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000
!	%f0  = ff000000 0ae67d5e, %l2 = 000000001b8734ff
!	Mem[0000000010081430] = 00000000000000f8
	add	%i2,0x030,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_P ! Mem[0000000010081430] = ff0000000ae67d5e
!	%l0 = 1b8734ff, %l1 = 00000000, Mem[00000000300c1408] = ffffffff 00ff0000
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 1b8734ff 00000000
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000052
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010001400] = ff00000000000000
	stxa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000
!	%f19 = 00000000, Mem[0000000030181410] = ffa2ecaa
	sta	%f19,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %f5  = ff000000
	lda	[%i5+%o5]0x88,%f5 	! %f5 = 00000000

p0_label_395:
!	Mem[0000000010081400] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i2+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[000000001014140c] = 000000ff, %l3 = 0000000074d95e2c
	ldsw	[%i5+0x00c],%l3		! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = ff000000 ffe600ff, %l0 = 1b8734ff, %l1 = ffffffff
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 00000000ffe600ff 00000000ff000000
!	Mem[00000000100c1410] = 00000000ff00f552, %l0 = 00000000ffe600ff
	ldxa	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff00f552
!	Mem[0000000010101410] = ff000000, %f2  = ff000000
	lda	[%i4+%o5]0x80,%f2 	! %f2 = ff000000
!	Mem[0000000010181410] = 00390000 000064ff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 00000000000064ff 0000000000390000
!	Mem[0000000030101400] = ff000000ffffffff, %f8  = 000080ff 74bd5edc
	ldda	[%i4+%g0]0x81,%f8 	! %f8  = ff000000 ffffffff
!	Mem[0000000030041410] = ffe6d3ff, %l6 = 00000000000064ff
	lduha	[%i1+%o5]0x89,%l6	! %l6 = 000000000000d3ff
!	Mem[0000000030041400] = ffffffff2cced994, %f20 = cb22a377 00000000
	ldda	[%i1+%g0]0x81,%f20	! %f20 = ffffffff 2cced994
!	Starting 10 instruction Store Burst
!	%l6 = 0000d3ff, %l7 = 00390000, Mem[0000000030001400] = 00000000 00000000
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000d3ff 00390000

!	Check Point 79 for processor 0

	set	p0_check_pt_data_79,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff00f552
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000001b8734ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000000000d3ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000390000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 0ae67d5e
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 16a66f51 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ff000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00390000 000064ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffffffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffff 2cced994
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 79 completed


p0_label_396:
!	%l7 = 0000000000390000, Mem[00000000211c0000] = 00ffe4d2, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000e4d2
!	%l0 = ff00f552, %l1 = ff000000, Mem[0000000010181408] = 1b8734ed 00000000
	stda	%l0,[%i6+0x008]%asi	! Mem[0000000010181408] = ff00f552 ff000000
!	%l0 = 00000000ff00f552, Mem[0000000030081400] = ff000000
	stba	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 52000000
!	%f30 = 00ff0000 000000ff, Mem[0000000010101410] = ff000000 00000000
	stda	%f30,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ff0000 000000ff
!	%l1 = 00000000ff000000, Mem[0000000010001410] = 000000001b8734ff
	stxa	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000ff000000
!	%l6 = 000000000000d3ff, Mem[0000000030141400] = 00000000
	stha	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000d3ff
!	%l7 = 0000000000390000, Mem[00000000100c1410] = 00000000
	stha	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	Mem[00000000300c1410] = 0c77e4c9, %l1 = 00000000ff000000
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 000000000c77e4c9
!	%l2 = 1b8734ff, %l3 = 000000ff, Mem[0000000010001410] = 00000000 000000ff
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 1b8734ff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffd30000, %l1 = 000000000c77e4c9
	lduha	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_397:
!	Mem[00000000100c1400] = ff000000, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 000064ff, %l4 = 00000000ff000000
	lduba	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081418] = 6600ff00, %l3 = 00000000000000ff
	ldsha	[%i2+0x018]%asi,%l3	! %l3 = 0000000000006600
!	Mem[0000000030041400] = ffffffff, %l2 = 000000001b8734ff
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141400] = 00000000, %l3 = 0000000000006600
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = ff000000, %f8  = ff000000
	lda	[%i4+%g0]0x81,%f8 	! %f8 = ff000000
!	Mem[0000000010101400] = 000000ffed34871b, %l6 = 000000000000d3ff
	ldxa	[%i4+%g0]0x88,%l6	! %l6 = 000000ffed34871b
!	Mem[0000000010181410] = 000064ff, %l1 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = ff34871b00000000, %f0  = ff000000 0ae67d5e
	ldda	[%i3+%o4]0x81,%f0 	! %f0  = ff34871b 00000000
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000010101410] = 0000ff00
	stha	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000ffff

p0_label_398:
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%f20 = ffffffff 2cced994, %l2 = ffffffffffffffff
!	Mem[0000000010001410] = ff34871bff000000
	add	%i0,0x010,%g1
	stda	%f20,[%g1+%l2]ASI_PST16_P ! Mem[0000000010001410] = ffffffff2cced994
!	%l2 = ffffffffffffffff, Mem[0000000010181410] = 000064ff
	stba	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 000064ff
!	Mem[0000000010141420] = 0000000000000000, %l2 = ffffffffffffffff, %l3 = 0000000000000000
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010101410] = ff0000000000ffff
	stxa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	%f23 = 00000000, Mem[00000000100c1410] = 00000000
	sta	%f23,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000030181410] = 00000000 77a322cb
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff 00000000
!	Mem[0000000030181400] = 5eaa09a5, %l6 = 000000ffed34871b
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 000000005eaa09a5
!	Mem[00000000300c1408] = 1b8734ff, %l7 = 0000000000390000
	ldstuba	[%i3+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 00000016 00000000, %l0 = ff00f552, %l1 = 000000ff
	ldda	[%i2+0x020]%asi,%l0	! %l0 = 0000000000000016 0000000000000000

p0_label_399:
!	Mem[0000000010101410] = 00000000, %l0 = 0000000000000016
	ldsba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001004141c] = 00000000, %l0 = 0000000000000000
	ldub	[%i1+0x01e],%l0		! %l0 = 0000000000000000
!	Mem[0000000030001400] = 0000d3ff, %l0 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = 1b8734ff, %f19 = 00000000
	lda	[%i3+%o4]0x89,%f19	! %f19 = 1b8734ff
!	Mem[0000000010101408] = 0000ff00ff000000, %f22 = 00000000 00000000
	ldda	[%i4+%o4]0x88,%f22	! %f22 = 0000ff00 ff000000
!	Mem[0000000010101408] = 000000ff, %l2 = ffffffffffffffff
	lduba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 52000000 0ae67d5e, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 0000000052000000 000000000ae67d5e
!	Mem[0000000030181408] = ff0000ff, %l3 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000 1b8734ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 000000001b8734ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%f26 = 00000000 00000000, %l3 = 00000000000000ff
!	Mem[0000000010081430] = ff0000000ae67d5e
	add	%i2,0x030,%g1
	stda	%f26,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010081430] = 0000000000000000

p0_label_400:
!	Mem[0000000010081400] = ff000000, %l6 = 000000005eaa09a5
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	%l5 = 000000000ae67d5e, Mem[00000000300c1410] = 000000ff
	stha	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 7d5e00ff
!	%l7 = 00000000000000ff, Mem[0000000010141412] = 00000000
	sth	%l7,[%i5+0x012]		! Mem[0000000010141410] = 000000ff
!	%f20 = ffffffff 2cced994, %f0  = ff34871b 00000000
	fdtox	%f20,%f0 		! %f0  = 80000000 00000000
!	Mem[000000001018143c] = 0000ffff, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x03c]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010101403] = 1b8734ed, %l7 = 00000000000000ff
	ldstuba	[%i4+0x003]%asi,%l7	! %l7 = 000000ed000000ff
!	%f4  = 00000000 00000000, Mem[0000000030141400] = ffd30000 00000000
	stda	%f4 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 00000000
!	Mem[0000000010081400] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%l4 = 0000000052000000, Mem[0000000030141410] = 000034ff
	stha	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff000000, %l6 = 00000000000000ff
	lduba	[%i4+%g0]0x81,%l6	! %l6 = 00000000000000ff

!	Check Point 80 for processor 0

	set	p0_check_pt_data_80,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000001b8734ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000052000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000ae67d5e
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ed
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 80000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ff000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 1b8734ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 0000ff00 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1

!	Check Point 80 completed


	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	stda	%l6,[%i5+0x010]%asi
	ldsba	[%i5+0x032]%asi,%l7
	lduwa	[%i0+0x034]%asi,%l6
	lduha	[%i2+0x03c]%asi,%l6
	udiv	%l6,0x003,%l2
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1

!	Check %y register

	set	0xffffffff,%g2
	rd	%y,%g3
	cmp	%g2,%g3
	bne,a	p0_failed
	mov	0x111,%g1

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
p0_ccr_fail:
	ba	p0_failed
	mov	%g5,%g3			! %g5 = %ccr
p0_reg_check_fail0:
	ba	p0_failed
	mov	%l0,%g3			! Reg %l0 compare failed
p0_reg_check_fail1:
	ba	p0_failed
	mov	%l1,%g3			! Reg %l1 compare failed
p0_reg_check_fail2:
	ba	p0_failed
	mov	%l2,%g3			! Reg %l2 compare failed
p0_reg_check_fail3:
	ba	p0_failed
	mov	%l3,%g3			! Reg %l3 compare failed
p0_reg_check_fail4:
	ba	p0_failed
	mov	%l4,%g3			! Reg %l4 compare failed
p0_reg_check_fail5:
	ba	p0_failed
	mov	%l5,%g3			! Reg %l5 compare failed
p0_reg_check_fail6:
	ba	p0_failed
	mov	%l6,%g3			! Reg %l6 compare failed
p0_reg_check_fail7:
	ba	p0_failed
	mov	%l7,%g3			! Reg %l7 compare failed
p0_freg_check_fail:
	ba	p0_failed
	nop

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
	ldswa	[%i5+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010141400]
	swapa	[%i0+%o5]ASI_AS_IF_USER_PRIMARY,%l1	! Mem[0000000010001410]
	lduwa	[%i1+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010041400]
	stba	%l0,[%i3+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[00000000100c1400]
	done

p0_trap1o:
	ldswa	[%o5+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010141400]
	swapa	[%o0+%i5]ASI_AS_IF_USER_PRIMARY,%l1	! Mem[0000000010001410]
	lduwa	[%o1+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010041400]
	stba	%l0,[%o3+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[00000000100c1400]
	done


p0_trap2e:
	ldstuba	[%i2+%o4]ASI_AS_IF_USER_PRIMARY,%l1	! Mem[0000000010081408]
	stwa	%l7,[%i0+%o5]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010001410]
	fdivs	%f4 ,%f11,%f3 
	fstoi	%f1 ,%f13
	fdtoi	%f14,%f11
	fitos	%f10,%f0 
	done

p0_trap2o:
	ldstuba	[%o2+%i4]ASI_AS_IF_USER_PRIMARY,%l1	! Mem[0000000010081408]
	stwa	%l7,[%o0+%i5]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010001410]
	fdivs	%f4 ,%f11,%f3 
	fstoi	%f1 ,%f13
	fdtoi	%f14,%f11
	fitos	%f10,%f0 
	done


p0_trap3e:
	xnor	%l2,0x884,%l4
	orn	%l2,0xcf4,%l4
	done

p0_trap3o:
	xnor	%l2,0x884,%l4
	orn	%l2,0xcf4,%l4
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
	ldx	[%g1+0x000],%l0		! %l0 = a7a7b42658d3204c
	ldx	[%g1+0x008],%l1		! %l1 = 51e0383612faecd1
	ldx	[%g1+0x010],%l2		! %l2 = 8c8e1f81d97effb0
	ldx	[%g1+0x018],%l3		! %l3 = 52f1c087c1c6f5b4
	ldx	[%g1+0x020],%l4		! %l4 = deb06ddabe1563dd
	ldx	[%g1+0x028],%l5		! %l5 = 4a96823fbb9fa589
	ldx	[%g1+0x030],%l6		! %l6 = 6bde661c77c1d4ab
	ldx	[%g1+0x038],%l7		! %l7 = 492eebbadf1352cc

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
	fsqrts	%f6 ,%f3 
	sub	%l6,-0x52b,%l0
	fstod	%f7 ,%f6 
	jmpl	%o7,%g0
	st	%f7 ,[%i5+0x02c]	! Mem[000000001014142c]
p0_near_0_he:
	std	%l4,[%i3+0x018]		! Mem[00000000100c1418]
	ldsh	[%i2+0x022],%l3		! Mem[0000000010081422]
	ldstub	[%i0+0x035],%l7		! Mem[0000000010001435]
	jmpl	%o7,%g0
	and	%l1,%l3,%l4
near0_b2b_h:
	nop
	jmpl	%o7,%g0
	sub	%l1,-0x197,%l6
near0_b2b_l:
	fdivs	%f12,%f3 ,%f3 
	jmpl	%o7,%g0
	smul	%l0,%l4,%l1
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	ldd	[%i1+0x010],%l0		! Mem[0000000010041410]
	ldstub	[%o2+0x001],%l4		! Mem[00000000211c0001]
	xor	%l5,%l1,%l3
	fadds	%f0 ,%f2 ,%f5 
	sth	%l0,[%i6+0x02c]		! Mem[000000001018142c]
	jmpl	%o7,%g0
	ldstub	[%o2+0x001],%l4		! Mem[00000000211c0001]
p0_near_1_he:
	and	%l6,0x29f,%l5
	jmpl	%o7,%g0
	udivx	%l0,%l6,%l6
near1_b2b_h:
	jmpl	%o7,%g0
	fmuls	%f25,%f27,%f20
	jmpl	%o7,%g0
	nop
near1_b2b_l:
	jmpl	%o7,%g0
	subc	%l0,%l4,%l2
	jmpl	%o7,%g0
	nop
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	lduw	[%i5+0x01c],%l7		! Mem[000000001014141c]
	orn	%l6,%l5,%l0
	fdtoi	%f10,%f4 
	ldsh	[%i1+0x010],%l3		! Mem[0000000010041410]
	jmpl	%o7,%g0
	smul	%l4,-0x73c,%l1
p0_near_2_he:
	jmpl	%o7,%g0
	stw	%l4,[%i0+0x020]		! Mem[0000000010001420]
	jmpl	%o7,%g0
	nop
near2_b2b_h:
	fcmps	%fcc1,%f25,%f18
	mulx	%l2,0xdfb,%l1
	fmuls	%f17,%f30,%f28
	addc	%l1,%l3,%l0
	and	%l0,0x019,%l1
	fsubs	%f22,%f17,%f22
	jmpl	%o7,%g0
	fdivs	%f28,%f24,%f25
near2_b2b_l:
	fdtos	%f4 ,%f0 
	sub	%l2,-0x130,%l6
	fdtoi	%f4 ,%f1 
	and	%l0,0xd5b,%l3
	subc	%l0,0x5ad,%l1
	fstoi	%f5 ,%f0 
	jmpl	%o7,%g0
	xnor	%l4,%l5,%l7
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	fsubs	%f8 ,%f0 ,%f12
	st	%f1 ,[%i1+0x014]	! Mem[0000000010041414]
	ldub	[%i2+0x019],%l3		! Mem[0000000010081419]
	ldd	[%i3+0x008],%f12	! Mem[00000000100c1408]
	ldx	[%i6+0x038],%l1		! Mem[0000000010181438]
	xnor	%l2,-0x0e1,%l2
	andn	%l5,%l5,%l2
	jmpl	%o7,%g0
	ldub	[%i2+0x001],%l0		! Mem[0000000010081401]
p0_near_3_he:
	fadds	%f25,%f30,%f24
	swap	[%i6+0x018],%l2		! Mem[0000000010181418]
	sth	%l1,[%i1+0x03c]		! Mem[000000001004143c]
	fitod	%f28,%f24
	ldstub	[%o3+0x101],%l0		! Mem[0000000021800101]
	stw	%l0,[%i1+0x014]		! Mem[0000000010041414]
	sdivx	%l4,%l7,%l1
	jmpl	%o7,%g0
	and	%l5,-0x7b7,%l2
near3_b2b_h:
	jmpl	%o7,%g0
	fdivs	%f26,%f30,%f17
	jmpl	%o7,%g0
	nop
near3_b2b_l:
	jmpl	%o7,%g0
	smul	%l2,%l0,%l5
	jmpl	%o7,%g0
	nop
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fadds	%f8 ,%f0 ,%f7 
	jmpl	%o7,%g0
	std	%f12,[%i5+0x008]	! Mem[0000000010141408]
p0_far_0_lem:
	fadds	%f8 ,%f0 ,%f7 
	membar	#Sync
	jmpl	%o7,%g0
	std	%f12,[%i5+0x008]	! Mem[0000000010141408]
p0_far_0_he:
	ldsh	[%i1+0x03e],%l7		! Mem[000000001004143e]
	sub	%l5,0x4da,%l5
	subc	%l4,-0x61b,%l2
	fdivs	%f25,%f27,%f31
	smul	%l2,%l1,%l2
	ldstub	[%o2+0x000],%l7		! Mem[00000000211c0000]
	fsqrts	%f26,%f18
	jmpl	%o7,%g0
	fitod	%f25,%f24
p0_far_0_hem:
	membar	#Sync
	ldsh	[%i1+0x03e],%l7		! Mem[000000001004143e]
	sub	%l5,0x4da,%l5
	subc	%l4,-0x61b,%l2
	fdivs	%f25,%f27,%f31
	smul	%l2,%l1,%l2
	ldstub	[%o2+0x000],%l7		! Mem[00000000211c0000]
	fsqrts	%f26,%f18
	jmpl	%o7,%g0
	fitod	%f25,%f24
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	udivx	%l1,%l0,%l4
	jmpl	%o7,%g0
	xnor	%l7,%l4,%l7
far0_b2b_l:
	xnor	%l3,-0xb9f,%l6
	jmpl	%o7,%g0
	sub	%l4,0xfe1,%l1
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	std	%f0 ,[%i1+0x020]	! Mem[0000000010041420]
	ldstub	[%i1+0x039],%l1		! Mem[0000000010041439]
	lduw	[%i1+0x000],%l4		! Mem[0000000010041400]
	addc	%l5,-0x970,%l7
	ld	[%i2+0x02c],%f0 	! Mem[000000001008142c]
	jmpl	%o7,%g0
	sub	%l7,%l0,%l5
p0_far_1_lem:
	membar	#Sync
	std	%f0 ,[%i1+0x020]	! Mem[0000000010041420]
	ldstub	[%i1+0x039],%l1		! Mem[0000000010041439]
	lduw	[%i1+0x000],%l4		! Mem[0000000010041400]
	addc	%l5,-0x970,%l7
	ld	[%i2+0x02c],%f0 	! Mem[000000001008142c]
	jmpl	%o7,%g0
	sub	%l7,%l0,%l5
p0_far_1_he:
	std	%l0,[%i5+0x008]		! Mem[0000000010141408]
	fdtos	%f24,%f28
	fdivs	%f29,%f27,%f29
	jmpl	%o7,%g0
	fdtos	%f30,%f24
p0_far_1_hem:
	membar	#Sync
	std	%l0,[%i5+0x008]		! Mem[0000000010141408]
	fdtos	%f24,%f28
	fdivs	%f29,%f27,%f29
	jmpl	%o7,%g0
	fdtos	%f30,%f24
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	fstoi	%f31,%f26
	fdtoi	%f24,%f26
	fmuls	%f26,%f23,%f16
	jmpl	%o7,%g0
	orn	%l4,%l0,%l2
far1_b2b_l:
	addc	%l2,%l5,%l2
	or	%l1,0x9b2,%l3
	fdivs	%f3 ,%f0 ,%f1 
	jmpl	%o7,%g0
	fdtoi	%f4 ,%f2 
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	xnor	%l3,-0x363,%l4
	ldsw	[%i4+0x010],%l3		! Mem[0000000010101410]
	xor	%l2,0x7a5,%l0
	sub	%l4,0x3d5,%l1
	jmpl	%o7,%g0
	st	%f15,[%i3+0x038]	! Mem[00000000100c1438]
p0_far_2_lem:
	xnor	%l3,-0x363,%l4
	membar	#Sync
	ldsw	[%i4+0x010],%l3		! Mem[0000000010101410]
	xor	%l2,0x7a5,%l0
	sub	%l4,0x3d5,%l1
	membar	#Sync
	jmpl	%o7,%g0
	st	%f15,[%i3+0x038]	! Mem[00000000100c1438]
p0_far_2_he:
	swap	[%i2+0x034],%l2		! Mem[0000000010081434]
	ldsw	[%i5+0x030],%l6		! Mem[0000000010141430]
	ldsb	[%i5+0x015],%l6		! Mem[0000000010141415]
	or	%l3,-0x1ac,%l3
	ldsb	[%i6+0x003],%l4		! Mem[0000000010181403]
	jmpl	%o7,%g0
	sub	%l5,%l5,%l3
p0_far_2_hem:
	membar	#Sync
	swap	[%i2+0x034],%l2		! Mem[0000000010081434]
	ldsw	[%i5+0x030],%l6		! Mem[0000000010141430]
	ldsb	[%i5+0x015],%l6		! Mem[0000000010141415]
	or	%l3,-0x1ac,%l3
	ldsb	[%i6+0x003],%l4		! Mem[0000000010181403]
	jmpl	%o7,%g0
	sub	%l5,%l5,%l3
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	addc	%l7,-0x57f,%l6
	andn	%l4,%l3,%l3
	fitod	%f20,%f16
	fsqrts	%f17,%f17
	fdtoi	%f18,%f29
	jmpl	%o7,%g0
	subc	%l3,%l6,%l1
far2_b2b_l:
	xnor	%l2,%l3,%l5
	fitod	%f14,%f10
	andn	%l4,-0x848,%l7
	udivx	%l1,-0xb77,%l5
	xnor	%l1,0x9ec,%l5
	jmpl	%o7,%g0
	umul	%l4,0x93d,%l0
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	addc	%l3,0xf2e,%l4
	stb	%l5,[%i4+0x006]		! Mem[0000000010101406]
	fadds	%f0 ,%f9 ,%f5 
	umul	%l1,-0x6df,%l7
	jmpl	%o7,%g0
	nop
p0_far_3_lem:
	addc	%l3,0xf2e,%l4
	membar	#Sync
	stb	%l5,[%i4+0x006]		! Mem[0000000010101406]
	fadds	%f0 ,%f9 ,%f5 
	umul	%l1,-0x6df,%l7
	jmpl	%o7,%g0
	nop
p0_far_3_he:
	stx	%l6,[%i1+0x000]		! Mem[0000000010041400]
	ld	[%i0+0x03c],%f17	! Mem[000000001000143c]
	jmpl	%o7,%g0
	ldstub	[%i2+0x017],%l4		! Mem[0000000010081417]
p0_far_3_hem:
	membar	#Sync
	stx	%l6,[%i1+0x000]		! Mem[0000000010041400]
	ld	[%i0+0x03c],%f17	! Mem[000000001000143c]
	membar	#Sync
	jmpl	%o7,%g0
	ldstub	[%i2+0x017],%l4		! Mem[0000000010081417]
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fitod	%f29,%f28
	jmpl	%o7,%g0
	udivx	%l5,%l4,%l7
far3_b2b_l:
	orn	%l6,0x9fb,%l7
	jmpl	%o7,%g0
	fitod	%f3 ,%f10
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	orn	%l5,%l3,%l5
	sub	%l6,-0x666,%l1
	fmuls	%f2 ,%f2 ,%f12
	jmpl	%g6+8,%g0
	ldstub	[%i0+0x02c],%l5		! Mem[000000001000142c]
p0_call_0_le:
	ldstub	[%i6+0x02e],%l4		! Mem[000000001018142e]
	fsqrts	%f3 ,%f4 
	sub	%l3,-0x63c,%l4
	udivx	%l2,%l1,%l0
	retl
	and	%l7,0xed7,%l7
p0_jmpl_0_lo:
	orn	%l5,%l3,%l5
	sub	%l6,-0x666,%l1
	fmuls	%f2 ,%f2 ,%f12
	jmpl	%g6+8,%g0
	ldstub	[%o0+0x02c],%l5		! Mem[000000001000142c]
p0_call_0_lo:
	ldstub	[%o6+0x02e],%l4		! Mem[000000001018142e]
	fsqrts	%f3 ,%f4 
	sub	%l3,-0x63c,%l4
	udivx	%l2,%l1,%l0
	retl
	and	%l7,0xed7,%l7
p0_jmpl_0_he:
	stw	%l3,[%i3+0x03c]		! Mem[00000000100c143c]
	mulx	%l1,%l6,%l6
	fsubs	%f31,%f30,%f28
	jmpl	%g6+8,%g0
	fdivs	%f20,%f25,%f19
p0_call_0_he:
	fadds	%f25,%f27,%f28
	orn	%l3,%l1,%l0
	retl
	fsqrts	%f25,%f17
p0_jmpl_0_ho:
	stw	%l3,[%o3+0x03c]		! Mem[00000000100c143c]
	mulx	%l1,%l6,%l6
	fsubs	%f31,%f30,%f28
	jmpl	%g6+8,%g0
	fdivs	%f20,%f25,%f19
p0_call_0_ho:
	fadds	%f25,%f27,%f28
	orn	%l3,%l1,%l0
	retl
	fsqrts	%f25,%f17
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	fstoi	%f14,%f15
	std	%f8 ,[%i5+0x008]	! Mem[0000000010141408]
	ldsh	[%i4+0x03e],%l1		! Mem[000000001010143e]
	orn	%l6,%l0,%l0
	add	%l6,0xedd,%l5
	ldstub	[%i1+0x011],%l7		! Mem[0000000010041411]
	jmpl	%g6+8,%g0
	sub	%l0,-0xac7,%l5
p0_call_1_le:
	fdivs	%f4 ,%f10,%f13
	std	%f2 ,[%i0+0x038]	! Mem[0000000010001438]
	retl
	ldd	[%i3+0x020],%l6		! Mem[00000000100c1420]
p0_jmpl_1_lo:
	fstoi	%f14,%f15
	std	%f8 ,[%o5+0x008]	! Mem[0000000010141408]
	ldsh	[%o4+0x03e],%l1		! Mem[000000001010143e]
	orn	%l6,%l0,%l0
	add	%l6,0xedd,%l5
	ldstub	[%o1+0x011],%l7		! Mem[0000000010041411]
	jmpl	%g6+8,%g0
	sub	%l0,-0xac7,%l5
p0_call_1_lo:
	fdivs	%f4 ,%f10,%f13
	std	%f2 ,[%o0+0x038]	! Mem[0000000010001438]
	retl
	ldd	[%o3+0x020],%l6		! Mem[00000000100c1420]
p0_jmpl_1_he:
	stw	%l6,[%i5+0x014]		! Mem[0000000010141414]
	jmpl	%g6+8,%g0
	stw	%l7,[%i4+0x02c]		! Mem[000000001010142c]
p0_call_1_he:
	ld	[%i0+0x014],%f26	! Mem[0000000010001414]
	ldsh	[%i3+0x008],%l1		! Mem[00000000100c1408]
	fstod	%f16,%f18
	fitod	%f26,%f20
	sub	%l7,0x939,%l1
	retl
	smul	%l2,0x11f,%l4
p0_jmpl_1_ho:
	stw	%l6,[%o5+0x014]		! Mem[0000000010141414]
	jmpl	%g6+8,%g0
	stw	%l7,[%o4+0x02c]		! Mem[000000001010142c]
p0_call_1_ho:
	ld	[%o0+0x014],%f26	! Mem[0000000010001414]
	ldsh	[%o3+0x008],%l1		! Mem[00000000100c1408]
	fstod	%f16,%f18
	fitod	%f26,%f20
	sub	%l7,0x939,%l1
	retl
	smul	%l2,0x11f,%l4
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	nop
	fmuls	%f8 ,%f7 ,%f5 
	jmpl	%g6+8,%g0
	ldd	[%i4+0x010],%f10	! Mem[0000000010101410]
p0_call_2_le:
	retl
	fstoi	%f5 ,%f9 
p0_jmpl_2_lo:
	nop
	fmuls	%f8 ,%f7 ,%f5 
	jmpl	%g6+8,%g0
	ldd	[%o4+0x010],%f10	! Mem[0000000010101410]
p0_call_2_lo:
	retl
	fstoi	%f5 ,%f9 
p0_jmpl_2_he:
	umul	%l7,0xcc1,%l1
	lduh	[%i2+0x006],%l1		! Mem[0000000010081406]
	xor	%l6,-0xd3f,%l7
	lduh	[%i3+0x026],%l6		! Mem[00000000100c1426]
	jmpl	%g6+8,%g0
	lduh	[%i6+0x00a],%l4		! Mem[000000001018140a]
p0_call_2_he:
	sth	%l7,[%i5+0x038]		! Mem[0000000010141438]
	fsubs	%f19,%f26,%f16
	retl
	stb	%l1,[%i1+0x005]		! Mem[0000000010041405]
p0_jmpl_2_ho:
	umul	%l7,0xcc1,%l1
	lduh	[%o2+0x006],%l1		! Mem[0000000010081406]
	xor	%l6,-0xd3f,%l7
	lduh	[%o3+0x026],%l6		! Mem[00000000100c1426]
	jmpl	%g6+8,%g0
	lduh	[%o6+0x00a],%l4		! Mem[000000001018140a]
p0_call_2_ho:
	sth	%l7,[%o5+0x038]		! Mem[0000000010141438]
	fsubs	%f19,%f26,%f16
	retl
	stb	%l1,[%o1+0x005]		! Mem[0000000010041405]
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	lduh	[%i2+0x010],%l6		! Mem[0000000010081410]
	fstoi	%f6 ,%f11
	ldd	[%i4+0x000],%f8 	! Mem[0000000010101400]
	lduh	[%i5+0x036],%l3		! Mem[0000000010141436]
	smul	%l2,0x311,%l2
	fsubs	%f10,%f3 ,%f1 
	ldx	[%i4+0x038],%l0		! Mem[0000000010101438]
	jmpl	%g6+8,%g0
	ldsw	[%i1+0x01c],%l1		! Mem[000000001004141c]
p0_call_3_le:
	fmuls	%f5 ,%f3 ,%f2 
	subc	%l0,-0x31f,%l5
	st	%f2 ,[%i6+0x00c]	! Mem[000000001018140c]
	sdivx	%l0,%l2,%l0
	fmuls	%f13,%f5 ,%f4 
	sth	%l5,[%i5+0x030]		! Mem[0000000010141430]
	retl
	std	%f14,[%i1+0x028]	! Mem[0000000010041428]
p0_jmpl_3_lo:
	lduh	[%o2+0x010],%l6		! Mem[0000000010081410]
	fstoi	%f6 ,%f11
	ldd	[%o4+0x000],%f8 	! Mem[0000000010101400]
	lduh	[%o5+0x036],%l3		! Mem[0000000010141436]
	smul	%l2,0x311,%l2
	fsubs	%f10,%f3 ,%f1 
	ldx	[%o4+0x038],%l0		! Mem[0000000010101438]
	jmpl	%g6+8,%g0
	ldsw	[%o1+0x01c],%l1		! Mem[000000001004141c]
p0_call_3_lo:
	fmuls	%f5 ,%f3 ,%f2 
	subc	%l0,-0x31f,%l5
	st	%f2 ,[%o6+0x00c]	! Mem[000000001018140c]
	sdivx	%l0,%l2,%l0
	fmuls	%f13,%f5 ,%f4 
	sth	%l5,[%o5+0x030]		! Mem[0000000010141430]
	retl
	std	%f14,[%o1+0x028]	! Mem[0000000010041428]
p0_jmpl_3_he:
	mulx	%l4,%l5,%l4
	jmpl	%g6+8,%g0
	stw	%l6,[%i3+0x014]		! Mem[00000000100c1414]
p0_call_3_he:
	ld	[%i3+0x000],%f19	! Mem[00000000100c1400]
	stx	%l4,[%i0+0x008]		! Mem[0000000010001408]
	ld	[%i5+0x00c],%f29	! Mem[000000001014140c]
	st	%f28,[%i1+0x02c]	! Mem[000000001004142c]
	sdivx	%l6,%l4,%l1
	retl
	mulx	%l1,0x377,%l3
p0_jmpl_3_ho:
	mulx	%l4,%l5,%l4
	jmpl	%g6+8,%g0
	stw	%l6,[%o3+0x014]		! Mem[00000000100c1414]
p0_call_3_ho:
	ld	[%o3+0x000],%f19	! Mem[00000000100c1400]
	stx	%l4,[%o0+0x008]		! Mem[0000000010001408]
	ld	[%o5+0x00c],%f29	! Mem[000000001014140c]
	st	%f28,[%o1+0x02c]	! Mem[000000001004142c]
	sdivx	%l6,%l4,%l1
	retl
	mulx	%l1,0x377,%l3
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
	.word	0xa7a7b426,0x58d3204c		! Init value for %l0
	.word	0x51e03836,0x12faecd1		! Init value for %l1
	.word	0x8c8e1f81,0xd97effb0		! Init value for %l2
	.word	0x52f1c087,0xc1c6f5b4		! Init value for %l3
	.word	0xdeb06dda,0xbe1563dd		! Init value for %l4
	.word	0x4a96823f,0xbb9fa589		! Init value for %l5
	.word	0x6bde661c,0x77c1d4ab		! Init value for %l6
	.word	0x492eebba,0xdf1352cc		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x26de903b,0x03e8e6c8		! Init value for %f0 
	.word	0x4f752913,0x566c92f3		! Init value for %f2 
	.word	0x5cf4ec97,0x2752d5ed		! Init value for %f4 
	.word	0x6a5e375c,0xceac7e73		! Init value for %f6 
	.word	0x2036b5ea,0x09275b0d		! Init value for %f8 
	.word	0xb991c190,0xaac85f02		! Init value for %f10
	.word	0x9b91ca6c,0x573d6472		! Init value for %f12
	.word	0x341775dc,0x4f480bf8		! Init value for %f14
	.word	0xd95dc06d,0x00b05a62		! Init value for %f16
	.word	0xa62a7b3d,0x65032b63		! Init value for %f18
	.word	0x8ef6b733,0xe9251f9b		! Init value for %f20
	.word	0xa87f4fc3,0x9f65f7e5		! Init value for %f22
	.word	0x63b53ff4,0xfa2142eb		! Init value for %f24
	.word	0x35c884b1,0x36cccd84		! Init value for %f26
	.word	0x2d1ea416,0x61c67279		! Init value for %f28
	.word	0xc85a5f2c,0xea81b6ab		! Init value for %f30
	.word	0x911b4233,0xd8df1dd9		! Init value for %f32
	.word	0xb3179ce2,0x3a7c4f04		! Init value for %f34
	.word	0xc8258c8c,0x0feb55e4		! Init value for %f36
	.word	0xe1018a2d,0x1879809d		! Init value for %f38
	.word	0xd1f925dc,0xeba38366		! Init value for %f40
	.word	0xf9464e56,0x85adf98b		! Init value for %f42
	.word	0x9cd70d81,0xd8f26aff		! Init value for %f44
	.word	0x180ffaf7,0xc5097346		! Init value for %f46
	.word	0x6c869b37,0xcc704f5a
	.word	0x715ec39b,0x182c522e
	.word	0x0ecc2fbd,0x19aaf957
	.word	0x151e815c,0x66c413ac
	.word	0x0ce8c85d,0x204cca06
	.word	0x09c94c7c,0x4c7eb93f
	.word	0x3a7725b6,0xaf80b48b
	.word	0x24d70969,0x192acc77
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
	.word	0x00000000,0x1b8734ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x0000ffff
	.word	0x00000000,0x52000000
	.word	0x00000000,0x0ae67d5e
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ed
p0_expected_fp_regs:
	.word	0x80000000,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x16a66f51,0xff000000
	.word	0xff000000,0xffffffff
	.word	0x00390000,0x000064ff
	.word	0x00000000,0x000000ff
	.word	0x74bd5edc,0xff000000
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x1b8734ff
	.word	0xffffffff,0x2cced994
	.word	0x0000ff00,0xff000000
	.word	0x74bd5edc,0x1b8734ed
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00007d03
	.word	0x00ff0000,0x000000ff
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0x00000000,0x00000000
	.word	0x74bd5edc,0xff000000
	.word	0xffffffff,0x2cced994
	.word	0xa509aa5e,0xffffffff
	.word	0x000000ff,0x213658ff
	.word	0x00000000,0xff800000
	.word	0x000000ff,0xff0064b3
	.word	0x62ff00ff,0x000000ff
p0_local0_sec_expect:
	.word	0x0000d3ff,0x00390000
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0xef000000
	.word	0xffffffff,0x5eaa09a5
	.word	0xff583621,0xff000000
	.word	0x00000000,0x000000ff
	.word	0xb364002d,0xff000000
	.word	0xff000000,0xff00ff62
p0_local1_expect:
	.word	0x00000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0xff000000,0x77a322cb
	.word	0x00000000,0x00000000
	.word	0xed34871b,0x35d3151a
	.word	0x00000000,0x00000000
	.word	0x037d0000,0x00000000
	.word	0xff000000,0x0000ff00
p0_local1_sec_expect:
	.word	0xffffffff,0x2cced994
	.word	0xff00002d,0xff000000
	.word	0xffd3e6ff,0x00003900
	.word	0x0000ffff,0x00000000
	.word	0xf778f552,0x0000e6ff
	.word	0x000000ff,0x000000ff
	.word	0x00000000,0x00003900
	.word	0xbb1ed552,0xdc5ebd74
p0_local2_expect:
	.word	0xff000000,0xff0000ff
	.word	0x00000000,0x2c5ed974
	.word	0xff0000ff,0x00003900
	.word	0x6600ff00,0x00000000
	.word	0x00000016,0x00000000
	.word	0xcb22a377,0xaaeca280
	.word	0x00000000,0x00000000
	.word	0xd1e0a5d0,0x000000ff
p0_local2_sec_expect:
	.word	0x52000000,0x0ae67d5e
	.word	0xff000000,0x00000000
	.word	0x00000000,0xff000000
	.word	0x16a66f51,0xff000000
	.word	0x000080ff,0x74bd5edc
	.word	0x16a66f51,0xff000000
	.word	0x00000000,0x000000ff
	.word	0x74bd5edc,0xff000000
p0_local3_expect:
	.word	0x000000ff,0x0000ff00
	.word	0xff00e6ff,0x000000ff
	.word	0x00000000,0xff00f552
	.word	0x00000000,0x000000ff
	.word	0xe3583621,0x2cced994
	.word	0x2dee399f,0x47c2c6a4
	.word	0x00000000,0xffff0000
	.word	0xff000000,0xd0a5e0d1
p0_local3_sec_expect:
	.word	0x00000000,0x74bd5edc
	.word	0xff34871b,0x00000000
	.word	0x7d5e00ff,0x52d51ebb
	.word	0xffffffff,0x00000000
	.word	0x00000097,0x000000ff
	.word	0x00000097,0x00000000
	.word	0x00000000,0xffff0000
	.word	0x00000000,0x000000ff
p0_local4_expect:
	.word	0x1b8734ff,0xff000000
	.word	0x000000ff,0x00ff0000
	.word	0x00000000,0x00000000
	.word	0xff000000,0xffff0000
	.word	0x00000000,0xff00f552
	.word	0x80a2ecaa,0x77a322cb
	.word	0x35d3531a,0x3d7be6ff
	.word	0x74bd5edc,0x00000000
p0_local4_sec_expect:
	.word	0xff000000,0xffffffff
	.word	0x00000000,0xffffffff
	.word	0x00000000,0x00000000
	.word	0x99222fbf,0xd1e047ee
	.word	0xe3583621,0x2cced994
	.word	0x2dee399f,0x47c2c6a4
	.word	0xe3dfa430,0xa3429ce0
	.word	0xebc7bffd,0xd0a5e0d1
p0_local5_expect:
	.word	0x00000000,0x000000ff
	.word	0x000077a3,0x000000ff
	.word	0x000000ff,0x00000000
	.word	0xff00e6ff,0x0000ffff
	.word	0x00000000,0x00000000
	.word	0x16a66f51,0xff000000
	.word	0x00000000,0x00000000
	.word	0x74bd5edc,0xff000000
p0_local5_sec_expect:
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xaaeca280
	.word	0x00000000,0x00000000
	.word	0xffffffff,0x00000097
	.word	0xed34871b,0x037de60a
	.word	0x000000ff,0x40625eff
	.word	0x72000000,0x16a66f51
	.word	0x000000ff,0xff0000ff
p0_local6_expect:
	.word	0xff000000,0x00000000
	.word	0xff00f552,0xff000000
	.word	0xff640000,0x00003900
	.word	0x00000000,0x000000ff
	.word	0xe3583621,0x2cced994
	.word	0x2dee399f,0x47c2c6a4
	.word	0x00000000,0x00000000
	.word	0xff000000,0x000000ff
p0_local6_sec_expect:
	.word	0xed34871b,0x0000ffff
	.word	0xff0000ff,0x35d3151a
	.word	0xffffffff,0x00000000
	.word	0x00000000,0x00000000
	.word	0xe3583621,0x2cced994
	.word	0x2dee399f,0x47c2c6a4
	.word	0x00000000,0x00000000
	.word	0xff000000,0xff000000
share0_expect:
	.word	0x0000afd5,0x6a1c30db
	.word	0xbd03f523,0x91f29af7
	.word	0xede5fb91,0xb31eb95e
	.word	0xe2011ce3,0x984530ae
	.word	0xf69eeb6a,0x73d5710b
	.word	0x11268075,0xddf3e311
	.word	0xa0a959d8,0x0c271550
	.word	0x226f94e9,0xdca559ee
share1_expect:
	.word	0xff00bb34,0xc6a2c1e2
	.word	0x78afda44,0x92c9cc75
	.word	0xee5593e9,0xcef9612a
	.word	0x2a3ad584,0xa634a80e
	.word	0x23e53cf4,0x01876f47
	.word	0x3fb61964,0x8e18b2bb
	.word	0x54b491fc,0x9f877a52
	.word	0x120adb9c,0x0f8c3fe5
	.word	0xffffe589,0x3b2322a7
	.word	0x706f1ea1,0xe53142a3
	.word	0x31ac200f,0x46ad0657
	.word	0xbb2bf0c5,0xac929063
	.word	0x6369a35f,0x8dda16a3
	.word	0xd3143363,0x01abeac0
	.word	0x85d826c9,0xd215a565
	.word	0xdfd18392,0xbff02df5
share2_expect:
	.word	0x0000e4d2,0xad5ead69
	.word	0xdbe69618,0x7ee1f77e
	.word	0x8c1dd099,0xd1386d9b
	.word	0xa0bcf63c,0xcbbcfdd8
	.word	0xd9d01a69,0xaa9d045f
	.word	0x9e48c619,0x85edcb4b
	.word	0x215ee032,0x3e2cb767
	.word	0x0b4a1ddb,0x7fb43de0
share3_expect:
	.word	0xffffed58,0x8980c2c1
	.word	0x19207b55,0x6881a8b7
	.word	0xf53edc15,0xaa42daed
	.word	0xee5f3091,0xb2d0a6ed
	.word	0x7ae0bfe0,0x895d1126
	.word	0x43c146ec,0x13a912bb
	.word	0xf4870d83,0xd6d18da4
	.word	0x1a50d7fe,0x54a1598c
	.word	0xff009b4e,0x7985e306
	.word	0x250143ac,0x43e6eb12
	.word	0xd6962cf0,0xe05aaa93
	.word	0x6db103a4,0x443c7b1c
	.word	0x6784bdcd,0xd6b8a4dd
	.word	0x3ce9e495,0x80de1e58
	.word	0x4d826cfa,0x2c6de276
	.word	0x68c5b081,0xa771312e
	.word	0xacffb20f,0x7fd00572
	.word	0xe668b591,0xb447adde
	.word	0xeadae5a3,0x11f36404
	.word	0x1fcf7e72,0x7b47ce4b
	.word	0x00951ee3,0x100f83f8
	.word	0xf5929bc0,0x6ff234f0
	.word	0x5bd4eccd,0xbdce8012
	.word	0x115a7a09,0x9318641d
	.word	0xffffcd54,0x70db6175
	.word	0x749d9c74,0x7d07cd28
	.word	0x1a8530a4,0x23a055df
	.word	0xd2aa106c,0xbabe4b75
	.word	0xad68d7b3,0xa37a09a8
	.word	0x897943df,0x83f90c0e
	.word	0x31d0b180,0x1db13fdb
	.word	0x6f9517a1,0x91747482
	.word	0xffff0ae8,0x5c967b9c
	.word	0x653bec6a,0xcda473f5
	.word	0x35faffd0,0xbfbfff25
	.word	0x0d9cd9ff,0x1f4fd3ec
	.word	0xd1ea22a9,0x3a398c07
	.word	0x3475f12e,0x8aec81b4
	.word	0x8c6e0436,0xe1bdc617
	.word	0x7625d428,0xc69df62e
	.word	0xffff9071,0xad2dcd6d
	.word	0xc842fc2e,0x1391b9eb
	.word	0x6ecd64b7,0x23755cba
	.word	0x9e0f49cb,0xd1136ec9
	.word	0x3ea3d2bc,0x181657fc
	.word	0xab059be6,0x41c89eb8
	.word	0xcdee93a0,0xe0dc98f4
	.word	0x73e26d09,0xf9ff1ad9
	.word	0x52ffae0c,0xb8c6a877
	.word	0x2a98f529,0x6ff3a6b8
	.word	0xb929adb2,0x9992e1b6
	.word	0xf41f6b3a,0x19776492
	.word	0x57125010,0xbd1dd040
	.word	0x618bd560,0x1172e113
	.word	0x6d055ac7,0xae44b3e9
	.word	0x14178b8a,0x86aa910c
	.word	0x00ff9ea8,0xcba01051
	.word	0x60e30e45,0x73baed91
	.word	0x87361e3c,0xb00effd5
	.word	0x90580448,0xb84a120c
	.word	0x9fb72ef7,0x276f574f
	.word	0xd7590c04,0x05bee117
	.word	0xa3b5ad89,0x3d3c047d
	.word	0xc0acc062,0xea3c25ea
p0_invalidate_semaphore:
	.word	0

!	Data for check points

	.align	8
p0_check_pt_data_1:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x086d6fdf		! Expected data for %l0
	.word	0x00000000,0x0000163e		! Expected data for %l1
	.word	0x00000000,0x599d9075		! Expected data for %l2
	.word	0x00000000,0x8ef6b733		! Expected data for %l3
	.word	0x00000000,0x00000091		! Expected data for %l4
	.word	0xffffffff,0xffe67d03		! Expected data for %l5
	.word	0xffffffff,0xffffc7b0		! Expected data for %l6
	.word	0xffffffff,0xffff919f		! Expected data for %l7
	.word	0x26de903b,0x03e8e6c8		! Expected data for %f0
	.word	0x4f752913,0x566c92f3		! Expected data for %f2
p0_check_pt_data_2:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x1c2aaa70,0x39a840ab		! Expected data for %l0
	.word	0x00000000,0x0000000a		! Expected data for %l1
	.word	0x00000000,0xeab53620		! Expected data for %l2
	.word	0x00000000,0x0000f80b		! Expected data for %l3
	.word	0x00000000,0x0000003e		! Expected data for %l4
	.word	0x00000000,0x037de6ff		! Expected data for %l6
	.word	0x00000000,0x0000fff6		! Expected data for %l7
	.word	0x0dd4a926,0x959c094a		! Expected data for %f0
	.word	0xffe67d03,0x0dd4a926		! Expected data for %f2
	.word	0x8f1a5501,0x40a0b34d		! Expected data for %f4
	.word	0x4e7b6629,0x01ff6647		! Expected data for %f6
	.word	0xa509aa5e,0xd5cf6cf8		! Expected data for %f8
	.word	0x00000000,0x00000097		! Expected data for %f10
	.word	0x8fbbc3a2,0xff72c64a		! Expected data for %f12
	.word	0x2ce1bd8e,0xdaa49daa		! Expected data for %f14
p0_check_pt_data_3:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000ffe6		! Expected data for %l0
	.word	0x00000000,0x0cb9ead0		! Expected data for %l1
	.word	0x00000000,0x0000000a		! Expected data for %l2
	.word	0xffffffff,0xffe67b3d		! Expected data for %l3
	.word	0x00000000,0x75909d59		! Expected data for %l4
	.word	0x00000000,0xac35f303		! Expected data for %l5
	.word	0x00000000,0x000000a7		! Expected data for %l6
	.word	0x00000000,0x086d6fdf		! Expected data for %l7
	.word	0x0dd4a926,0x67e8c7b0		! Expected data for %f0
	.word	0xffe67d03,0x0dd4a926		! Expected data for %f2
	.word	0x8f1a5501,0x40a0b34d		! Expected data for %f4
	.word	0x980b74a7,0x01ff6647		! Expected data for %f6
	.word	0xdf1352cc,0x8ffe275d		! Expected data for %f8
	.word	0x00000000,0x472a56b3		! Expected data for %f10
	.word	0xdf1352cc,0x8ffe275d		! Expected data for %f14
	.word	0x086d6fdf,0x10111074		! Expected data for %f16
	.word	0x2752d5ed,0x2c05fff6		! Expected data for %f18
	.word	0xff2ff31f,0x84d45987		! Expected data for %f20
	.word	0x908a7c20,0x32ea7f0d		! Expected data for %f22
	.word	0x0e0a2639,0xda94f32f		! Expected data for %f24
	.word	0x35c884b1,0xa5cccd8e		! Expected data for %f26
	.word	0x621ebbdd,0xfe4b4cc8		! Expected data for %f28
	.word	0x6cc1fff6,0x0000163e		! Expected data for %f30
p0_check_pt_data_4:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x04580000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000005		! Expected data for %l1
	.word	0x00000000,0x01551a8f		! Expected data for %l3
	.word	0x00000000,0x00000300		! Expected data for %l4
	.word	0xffffffff,0xffffffff		! Expected data for %l5
	.word	0x00000000,0x086d6fdf		! Expected data for %l6
	.word	0x00000000,0xffffffff		! Expected data for %l7
	.word	0xffe67d03,0x10111074		! Expected data for %f2
	.word	0x8f1a5501,0x40a0b34d		! Expected data for %f4
	.word	0x0dd4a926,0x959c094a		! Expected data for %f16
	.word	0x0ae67d03,0x0dd4a926		! Expected data for %f18
	.word	0x8f1a5501,0x40a0b34d		! Expected data for %f20
	.word	0x33b7f6ff,0x01ff6647		! Expected data for %f22
	.word	0xa509aa5e,0xd5cf6cf8		! Expected data for %f24
	.word	0x00000000,0x00000097		! Expected data for %f26
	.word	0x8fbbc3a2,0xff72c64a		! Expected data for %f28
	.word	0x2ce1bd8e,0xdaa49daa		! Expected data for %f30
p0_check_pt_data_5:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffff8a		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x33b7f6ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0xed34871b		! Expected data for %l5
	.word	0x00000000,0x2772c661		! Expected data for %l6
	.word	0x00000000,0xe3720000		! Expected data for %l7
	.word	0xb0c7e867,0x4d9c90e7		! Expected data for %f0
	.word	0x0a9c2c2b,0x9f5e6240		! Expected data for %f2
	.word	0xff1352cc,0x8ffe275d		! Expected data for %f4
	.word	0x4bbe3cde,0x1468c5b9		! Expected data for %f6
	.word	0xabfb810c,0x2c5f5a70		! Expected data for %f8
	.word	0xd3f1a09c,0x1b8734ed		! Expected data for %f10
	.word	0xbaf9b00d,0x1a53d335		! Expected data for %f12
	.word	0xe697de10,0xd004a503		! Expected data for %f14
	.word	0xc7a66664,0x15a21a80		! Expected data for %f16
	.word	0x40625e9f,0x2b2c9c0a		! Expected data for %f18
	.word	0x5d27fe8f,0xcc5213ff		! Expected data for %f20
	.word	0xb9c56814,0xde3cbe4b		! Expected data for %f22
	.word	0x705a5f2c,0x000353ac		! Expected data for %f24
	.word	0xed34871b,0x9ca0f1d3		! Expected data for %f26
	.word	0x35d3531a,0x0db0f9ba		! Expected data for %f28
	.word	0xffb8d534,0x3e16919f		! Expected data for %f30
p0_check_pt_data_6:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x705a5f2c		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0xad982c1e		! Expected data for %l2
	.word	0x00000000,0x9f0000a2		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x980b74ff		! Expected data for %l5
	.word	0x00000000,0x40625e9f		! Expected data for %l6
	.word	0x00000000,0xe3720000		! Expected data for %l7
	.word	0xb0c7e867,0x4d9c90e7		! Expected data for %f0
	.word	0x0a9c2c2b,0xffffffff		! Expected data for %f2
	.word	0x4bbe3cde,0x1468c5b9		! Expected data for %f6
	.word	0xffe67b3d,0x8ebce0f2		! Expected data for %f26
p0_check_pt_data_7:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffe67b3d		! Expected data for %l0
	.word	0xffb8d534,0x3e16919f		! Expected data for %l1
	.word	0x00000000,0x000000f6		! Expected data for %l2
	.word	0x00000000,0x00000098		! Expected data for %l3
	.word	0x00000000,0x0000000a		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0xffffffff,0xffffe372		! Expected data for %l6
	.word	0x00000000,0x0000ed34		! Expected data for %l7
	.word	0xff1352cc,0x8ffe275d		! Expected data for %f0
	.word	0x0a9c2c2b,0x00000000		! Expected data for %f2
	.word	0x000000ff,0x8ffe275d		! Expected data for %f4
	.word	0xed34871b,0x037de60a		! Expected data for %f16
	.word	0x0ae67d03,0x0dd4a926		! Expected data for %f18
	.word	0x9f91163e,0x34d5b8ff		! Expected data for %f20
	.word	0x4e7b6629,0x01ff6647		! Expected data for %f22
	.word	0xa509aa5e,0xd5cf6cf8		! Expected data for %f24
	.word	0x00000000,0x00000097		! Expected data for %f26
	.word	0x8fbbc3a2,0xff72c64a		! Expected data for %f28
	.word	0x2ce1bd8e,0xdaa49daa		! Expected data for %f30
p0_check_pt_data_8:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x705a5f2c		! Expected data for %l0
	.word	0x00000000,0x7792950d		! Expected data for %l1
	.word	0x00000000,0x000000e6		! Expected data for %l4
	.word	0x00000000,0xff000000		! Expected data for %l5
	.word	0x00000000,0xffe67b3d		! Expected data for %l6
	.word	0xffffffff,0xffffff8f		! Expected data for %l7
	.word	0x52f578f7,0x3d7be6ff		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0xed34871b,0x1468c5b9		! Expected data for %f6
	.word	0x9f91163e,0x34d5b8ff		! Expected data for %f20
	.word	0x00000000,0x00000097		! Expected data for %f22
	.word	0xd0eab90c,0xdaa49daa		! Expected data for %f30
p0_check_pt_data_9:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000072ff		! Expected data for %l0
	.word	0x26a9d40d,0x037de60a		! Expected data for %l1
	.word	0x00000000,0x3d7be6ff		! Expected data for %l2
	.word	0xffffffff,0xffff972c		! Expected data for %l3
	.word	0x0cb9ead0,0xa7ffffe3		! Expected data for %l4
	.word	0xffffffff,0xffffb8ff		! Expected data for %l5
	.word	0x00000000,0xf101c0ef		! Expected data for %l6
	.word	0x00000000,0x00000dff		! Expected data for %l7
	.word	0xff1352cc,0x8ffe275d		! Expected data for %f0
	.word	0x52f578f7,0x3d7be6ff		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0xed34871b,0x1468c5b9		! Expected data for %f6
	.word	0xabfb810c,0x33b7e372		! Expected data for %f8
	.word	0x1b8734ed,0x1a53d335		! Expected data for %f12
	.word	0x80492987,0x6092688d		! Expected data for %f14
	.word	0x8fbbc3a2,0xff72c64a		! Expected data for %f20
	.word	0xed34871b,0x037de60a		! Expected data for %f24
p0_check_pt_data_10:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0xffe67b3d		! Expected data for %l1
	.word	0xffb8d534,0x3e1691ff		! Expected data for %l2
	.word	0x00000000,0x00000dff		! Expected data for %l3
	.word	0x00000000,0x00000072		! Expected data for %l4
	.word	0x00000000,0x000072e3		! Expected data for %l5
	.word	0x00000000,0xff740bff		! Expected data for %l6
	.word	0x00000000,0x000000b8		! Expected data for %l7
	.word	0xff1352cc,0x33b7e372		! Expected data for %f0
	.word	0x52f578f7,0x3d7be6ff		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0x2ce1bd8e,0x00000000		! Expected data for %f20
p0_check_pt_data_11:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000000a		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0xffffffff,0xffffffa0		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x0000862b		! Expected data for %l4
	.word	0x00000000,0x00000052		! Expected data for %l5
	.word	0x00000000,0x2c5f5a70		! Expected data for %l6
	.word	0x0a0b74ff,0x00005804		! Expected data for %l7
	.word	0x000000ff,0x34d5ff05		! Expected data for %f0
	.word	0x00000000,0x00000000		! Expected data for %f2
	.word	0xffe67b3d,0x00000000		! Expected data for %f4
	.word	0x5c844fff,0x6004a862		! Expected data for %f6
	.word	0x6081daa3,0x3f403703		! Expected data for %f8
	.word	0xac35f303,0x3028972c		! Expected data for %f10
	.word	0xc40ffeae,0x04f0a313		! Expected data for %f12
	.word	0x3b52db8a,0x0000003e		! Expected data for %f14
	.word	0x00000000,0x037de60a		! Expected data for %f16
	.word	0x0ae67d03,0xff1352cc		! Expected data for %f18
	.word	0x2ce1bd8e,0x705a5f2c		! Expected data for %f20
	.word	0xe3720000,0x40625eff		! Expected data for %f26
p0_check_pt_data_12:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x00000000,0xffe1bd8e		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x34e67b3d		! Expected data for %l5
	.word	0x00000000,0x000034d5		! Expected data for %l7
	.word	0x000000ff,0x34d5ff05		! Expected data for %f0
	.word	0x2ce1bd8e,0x705a5f2c		! Expected data for %f6
	.word	0x6081daa3,0x34d5b805		! Expected data for %f8
	.word	0x26975252,0x00000000		! Expected data for %f10
	.word	0xed34871b,0x0000003e		! Expected data for %f14
	.word	0xff5e6240,0xff0072e3		! Expected data for %f16
	.word	0x00000000,0x00000000		! Expected data for %f18
	.word	0x62a80460,0x1a53d335		! Expected data for %f20
	.word	0x16ff85da,0x40588747		! Expected data for %f22
	.word	0xde45fb04,0xa1472f5e		! Expected data for %f24
	.word	0x340353ac,0xc12833ff		! Expected data for %f26
	.word	0xa0f4213d,0x0000c661		! Expected data for %f28
	.word	0x62ef3c78,0xbb5ee3d7		! Expected data for %f30
p0_check_pt_data_13:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0xffffffff,0xffffffe3		! Expected data for %l3
	.word	0x00000000,0x00000005		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0xffffffff,0xffa80460		! Expected data for %l6
	.word	0x00000000,0x26975252		! Expected data for %l7
	.word	0x000000ff,0x34d5ff05		! Expected data for %f0
	.word	0xff91163e,0x34d5b8ff		! Expected data for %f2
	.word	0x00000000,0x3d7be634		! Expected data for %f6
	.word	0xe37200ff,0x40625eff		! Expected data for %f18
	.word	0xffe67d03,0x00000000		! Expected data for %f30
p0_check_pt_data_14:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x1a53d335		! Expected data for %l0
	.word	0x00000000,0x00003b52		! Expected data for %l1
	.word	0x00000000,0x00009753		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x00000005		! Expected data for %l6
	.word	0x00000000,0x0000004d		! Expected data for %l7
	.word	0x00000000,0x3d7be6ff		! Expected data for %f0
	.word	0xffe3ffff,0x00ffffff		! Expected data for %f2
	.word	0x705a5f2c,0x00000000		! Expected data for %f4
	.word	0x00000000,0x00000097		! Expected data for %f6
	.word	0xed34871b,0x037de60a		! Expected data for %f8
	.word	0xe3720000,0x40625eff		! Expected data for %f10
	.word	0x8fbbc3a2,0xff72c64a		! Expected data for %f12
	.word	0xd0eab90c,0xdaa49daa		! Expected data for %f14
	.word	0xff000000,0x037de60a		! Expected data for %f16
	.word	0x00000000,0x000000ff		! Expected data for %f18
	.word	0x34e67b3d,0x00000000		! Expected data for %f20
	.word	0x5c844f40,0xff0472e3		! Expected data for %f22
	.word	0x00030000,0xff000000		! Expected data for %f24
	.word	0xac35f303,0x3028972c		! Expected data for %f26
	.word	0xc40ffeae,0x04f0a313		! Expected data for %f28
	.word	0x3b52db8a,0x0000003e		! Expected data for %f30
p0_check_pt_data_15:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0xe37204ff		! Expected data for %l3
	.word	0x00030000,0x00000000		! Expected data for %l4
	.word	0xefc001f1,0x0000ff00		! Expected data for %l5
	.word	0x00000000,0x0000862b		! Expected data for %l6
	.word	0x00000000,0x00000047		! Expected data for %l7
	.word	0x705a5f2c,0x00000000		! Expected data for %f4
	.word	0x00000000,0x00000097		! Expected data for %f6
	.word	0x05b80000,0xff72c64a		! Expected data for %f12
	.word	0x00000000,0xdaa49daa		! Expected data for %f14
	.word	0x26975252,0x00000000		! Expected data for %f24
	.word	0x000000ff,0x3028972c		! Expected data for %f26
	.word	0xc40ffeae,0xff000000		! Expected data for %f28
p0_check_pt_data_16:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x0000ff04		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00003b52		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000070		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000000,0xff000000		! Expected data for %f0
	.word	0xffb35501,0x00ffffff		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f16
	.word	0x00000000,0x000000ff		! Expected data for %f18
	.word	0x34e67b3d,0x00000000		! Expected data for %f20
	.word	0x5c844f40,0xff0472e3		! Expected data for %f22
	.word	0x5252daa3,0x3f403703		! Expected data for %f24
	.word	0x000000ff,0xaefe0fc4		! Expected data for %f26
	.word	0xc40ffeae,0x04f0a313		! Expected data for %f28
	.word	0x3b52db8a,0x0000003e		! Expected data for %f30
p0_check_pt_data_17:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000002d		! Expected data for %l0
	.word	0x00000000,0x037de60a		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0xd5cf6cf8		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0xffb8d534,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x5c844f40		! Expected data for %l7
	.word	0x2c05fff6,0x3eff0000		! Expected data for %f0
	.word	0x705a5f2c,0x0000b805		! Expected data for %f4
	.word	0x53970000,0x037de60a		! Expected data for %f8
	.word	0xe3720000,0x00000000		! Expected data for %f10
	.word	0xff00871b,0x000000ff		! Expected data for %f18
	.word	0xc40ffeae,0x000000ff		! Expected data for %f28
	.word	0x00000000,0x0000003e		! Expected data for %f30
p0_check_pt_data_18:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x5ade97a0,0x73ffb364		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x3e16919f,0x8dff72ff		! Expected data for %l2
	.word	0x00000000,0x00000097		! Expected data for %l3
	.word	0x00000000,0x01553e00		! Expected data for %l4
	.word	0x00000000,0x00000052		! Expected data for %l5
	.word	0x00000000,0x5c844f40		! Expected data for %l6
	.word	0x00000000,0xff0472e3		! Expected data for %l7
	.word	0x705a5f2c,0x0000b805		! Expected data for %f4
	.word	0x00000000,0x00000097		! Expected data for %f6
	.word	0xed3487ff,0xed34871b		! Expected data for %f8
	.word	0xd08281c1,0x00000000		! Expected data for %f10
	.word	0x00000000,0x00000000		! Expected data for %f16
	.word	0xff000000,0x00000000		! Expected data for %f18
	.word	0x00000000,0x3d7be634		! Expected data for %f20
	.word	0xe37204ff,0x404f845c		! Expected data for %f22
	.word	0x00000000,0xa3da5252		! Expected data for %f24
	.word	0xc40ffeae,0xff000000		! Expected data for %f26
	.word	0x13a3f004,0xaefe0fc4		! Expected data for %f28
	.word	0x3e000000,0x8adb523b		! Expected data for %f30
p0_check_pt_data_19:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xff000000,0x70000000		! Expected data for %l0
	.word	0x00000000,0x037de60a		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0xffffffff,0xffe37d03		! Expected data for %l5
	.word	0x00000000,0x8adb523b		! Expected data for %l7
	.word	0x5252daa3,0x3eff0000		! Expected data for %f0
	.word	0xff000000,0x009fc0ef		! Expected data for %f2
	.word	0xe372ff8d,0x00000097		! Expected data for %f6
	.word	0x00000000,0x3d7be6ff		! Expected data for %f10
	.word	0xb364002d,0xff0000ff		! Expected data for %f12
	.word	0xff000000,0x000000ff		! Expected data for %f30
p0_check_pt_data_20:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0xd0eab90c		! Expected data for %l1
	.word	0x00000000,0x03000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0xff000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0xf101c0ef,0xc96f6fe3		! Expected data for %l6
	.word	0xd5340000,0x1b8734ed		! Expected data for %l7
	.word	0xff000000,0x000000ff		! Expected data for %f0
	.word	0xff000000,0x009fc0ef		! Expected data for %f2
	.word	0xefc09f00,0x000000ff		! Expected data for %f8
	.word	0x64b3ff73,0x00000000		! Expected data for %f18
	.word	0x34e67b3d,0x3d7be634		! Expected data for %f20
p0_check_pt_data_21:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x34e67b3d,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000086		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0xff000000,0x00000300		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0xff000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00000000,0x000072ff		! Expected data for %f2
	.word	0x705a5f2c,0x0000b805		! Expected data for %f4
	.word	0x8adb52ff,0x000000ff		! Expected data for %f8
	.word	0x000000ff,0x000072e3		! Expected data for %f18
	.word	0x0000c661,0xd5cf6cf8		! Expected data for %f20
	.word	0x00000070,0x52529726		! Expected data for %f22
	.word	0xff000000,0x000000ff		! Expected data for %f30
p0_check_pt_data_22:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x03000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x0000007b		! Expected data for %l4
	.word	0x00000000,0x0000ffff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x000000ff,0xaefe0fff		! Expected data for %f0
	.word	0x705a5f2c,0x0000b805		! Expected data for %f4
	.word	0x26975252,0x70000000		! Expected data for %f6
	.word	0x5252daa3,0x3f403703		! Expected data for %f12
	.word	0x00000000,0x00000000		! Expected data for %f16
	.word	0x0000ffff,0xd5cf6cf8		! Expected data for %f20
	.word	0x00000000,0x0000002d		! Expected data for %f24
	.word	0x03000000,0x000000ff		! Expected data for %f30
p0_check_pt_data_23:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x000000fe		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0xae34871b		! Expected data for %l4
	.word	0x00000000,0x0000e3ff		! Expected data for %l5
	.word	0x00000000,0x00000003		! Expected data for %l6
	.word	0xffffffff,0xfffff17b		! Expected data for %l7
	.word	0x705a5f2c,0x0000b805		! Expected data for %f4
	.word	0x26975252,0x70000000		! Expected data for %f6
	.word	0x00000000,0x2d0064b3		! Expected data for %f10
	.word	0x00000000,0x00007bf1		! Expected data for %f14
	.word	0xff000000,0x00000000		! Expected data for %f16
	.word	0x01553e00,0x0000003b		! Expected data for %f18
	.word	0x03000000,0x00000000		! Expected data for %f20
	.word	0x00000000,0xffff0000		! Expected data for %f22
	.word	0xed34871b,0x037de60a		! Expected data for %f24
	.word	0xff0ffeae,0x00000000		! Expected data for %f26
	.word	0x8fbbc3a2,0xff72c64a		! Expected data for %f28
	.word	0xd0eab90c,0xdaa49daa		! Expected data for %f30
p0_check_pt_data_24:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0xaefe0fc4		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x34e67b3d		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000003		! Expected data for %l7
	.word	0xe37be634,0x037de60a		! Expected data for %f0
	.word	0x03000000,0xd5cf6cf8		! Expected data for %f2
	.word	0x0034871b,0x00000000		! Expected data for %f4
	.word	0x16a66f51,0xa7740b98		! Expected data for %f6
	.word	0xffe67b3d,0xf778f552		! Expected data for %f8
	.word	0x80a2ecaa,0x77a322cb		! Expected data for %f10
	.word	0x35d3531a,0x3d7be6ff		! Expected data for %f12
	.word	0x74bd5edc,0x52d51ebb		! Expected data for %f14
	.word	0x94305e9f,0xffff0000		! Expected data for %f22
	.word	0xffe30000,0x037de60a		! Expected data for %f24
p0_check_pt_data_25:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xff000000		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0xffffffff,0xffffefc0		! Expected data for %l5
	.word	0x00000000,0xff0472e3		! Expected data for %l6
	.word	0x00000000,0x0000e37b		! Expected data for %l7
	.word	0x34e67b3d,0x000000e3		! Expected data for %f0
	.word	0x3d7be634,0xff0000ff		! Expected data for %f2
	.word	0xefc001f1,0x0000ffff		! Expected data for %f4
	.word	0x26975252,0x00a61733		! Expected data for %f6
	.word	0xe372ff8d,0x00000097		! Expected data for %f8
	.word	0xdad95cb7,0x80c4a444		! Expected data for %f10
	.word	0x2d000000,0x00000000		! Expected data for %f12
	.word	0xbf625478,0xe372ff8d		! Expected data for %f14
	.word	0x03000000,0xc96f6fe3		! Expected data for %f18
	.word	0xe3000000,0x000000ff		! Expected data for %f20
	.word	0x00000000,0xffff0000		! Expected data for %f22
	.word	0x00000000,0x00000000		! Expected data for %f24
	.word	0xffff0000,0xf101c0ef		! Expected data for %f30
p0_check_pt_data_26:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x03007b3d,0x00000000		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x3317a600		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0xe37204ff,0x7be30000		! Expected data for %l6
	.word	0x26975252,0x00a61733		! Expected data for %f6
	.word	0x00000000,0x000000ff		! Expected data for %f10
	.word	0xe37be634,0x037de60a		! Expected data for %f16
	.word	0x03000000,0xd5cf6cf8		! Expected data for %f18
	.word	0x0000e37b,0xff0472e3		! Expected data for %f20
	.word	0x16a66f51,0xa7740b98		! Expected data for %f22
	.word	0xffe67b3d,0xf778f552		! Expected data for %f24
	.word	0x80a2ecaa,0x77a322cb		! Expected data for %f26
	.word	0x7be30000,0x00000000		! Expected data for %f28
	.word	0x74bd5edc,0x52d51ebb		! Expected data for %f30
p0_check_pt_data_27:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0xdc5ebd74		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0xff72ff8d		! Expected data for %l4
	.word	0x3b52db8a,0x0000003e		! Expected data for %l5
	.word	0x0003e3ff,0xdaa49daa		! Expected data for %l6
	.word	0xff72ff8d,0x9f91163e		! Expected data for %l7
	.word	0x34e67b3d,0x000000ff		! Expected data for %f0
	.word	0x3d7be634,0xff0000ff		! Expected data for %f2
	.word	0xff00213d,0x2d0064b3		! Expected data for %f8
	.word	0xf86ccfd5,0xffe67b3d		! Expected data for %f10
	.word	0xff007b3d,0x00000000		! Expected data for %f14
	.word	0xff000000,0x8ebde1ff		! Expected data for %f16
	.word	0xff000000,0xaefe0fc4		! Expected data for %f18
	.word	0xda000003,0x8ffe275d		! Expected data for %f20
	.word	0x4bbe3cde,0x1468c5b9		! Expected data for %f22
	.word	0x97000000,0x00000000		! Expected data for %f24
	.word	0xd3f1a09c,0x1b8734ed		! Expected data for %f26
	.word	0xbaf9b00d,0x1a53d335		! Expected data for %f28
	.word	0xe697de10,0xd004a503		! Expected data for %f30
p0_check_pt_data_28:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0xffffffff,0xffffffe3		! Expected data for %l1
	.word	0x00000000,0x8dff72ff		! Expected data for %l3
	.word	0x00000000,0x00003e00		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0xefc001f1,0x0000ffff		! Expected data for %l7
	.word	0x34e67b3d,0x000000ff		! Expected data for %f0
	.word	0x3d7be634,0xff0000ff		! Expected data for %f2
	.word	0xefc001f1,0x0000ffff		! Expected data for %f4
	.word	0x00000000,0xaefe0fc4		! Expected data for %f6
	.word	0xffe67d03,0x34e67be3		! Expected data for %f16
	.word	0xf86ccfd5,0x00000003		! Expected data for %f18
	.word	0x8d7204ff,0x7be30000		! Expected data for %f20
	.word	0x980b74a7,0x516fa616		! Expected data for %f22
	.word	0x52f578f7,0x3d7be6ff		! Expected data for %f24
	.word	0xcb22a377,0xaaeca280		! Expected data for %f26
	.word	0x00000000,0x0000e37b		! Expected data for %f28
	.word	0xbb1ed552,0xaefe0fff		! Expected data for %f30
p0_check_pt_data_29:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x8da97798,0x4d66023c		! Expected data for %l0
	.word	0x00000000,0x0000002d		! Expected data for %l1
	.word	0x00000000,0x000472e3		! Expected data for %l2
	.word	0x00000000,0x000000da		! Expected data for %l3
	.word	0x00000000,0xbb1ed552		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0xff000000		! Expected data for %l7
	.word	0x34e67b3d,0x000000ff		! Expected data for %f0
	.word	0xffff0000,0xf101c0ef		! Expected data for %f4
	.word	0x00000000,0xaefe0fc4		! Expected data for %f6
	.word	0xff000000,0x269700ff		! Expected data for %f8
	.word	0x34e67b3d,0xe3720400		! Expected data for %f12
	.word	0xff007b3d,0xceaa26bb		! Expected data for %f14
	.word	0xe37be634,0x037de6ff		! Expected data for %f16
	.word	0x03000000,0xd5cf6cf8		! Expected data for %f18
	.word	0x0000e37b,0xff04728d		! Expected data for %f20
	.word	0x16a66f51,0xa7740b98		! Expected data for %f22
	.word	0xffe67b3d,0xf778f552		! Expected data for %f24
	.word	0x80a2ecaa,0x77a322cb		! Expected data for %f26
	.word	0x7be30000,0x00000000		! Expected data for %f28
	.word	0x3d7be6ff,0x52d51ebb		! Expected data for %f30
p0_check_pt_data_30:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xff0ffeae,0xff000000		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0xff000000		! Expected data for %l3
	.word	0xffffffff,0xffffe634		! Expected data for %l4
	.word	0x00000000,0xbd7400ff		! Expected data for %l5
	.word	0x00000000,0x030000da		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x05b80000,0x00000000		! Expected data for %f2
	.word	0x00000000,0xaefe0fc4		! Expected data for %f6
	.word	0xff000000,0x00000000		! Expected data for %f18
	.word	0x16a66f51,0xaefe0fc4		! Expected data for %f22
	.word	0x00000000,0xff0472e3		! Expected data for %f24
p0_check_pt_data_31:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x52f578f7		! Expected data for %l2
	.word	0xf8000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0xf86ccfd5,0x000000ff		! Expected data for %l5
	.word	0x00000000,0xf7f7e634		! Expected data for %l6
	.word	0x00000000,0x037de60a		! Expected data for %l7
	.word	0xe37204ff,0x00000000		! Expected data for %f0
	.word	0x3e16919f,0xaefe00ff		! Expected data for %f2
	.word	0x00000000,0x000000f8		! Expected data for %f4
	.word	0xee47e0d1,0xbf2f2299		! Expected data for %f6
	.word	0x94d9ce2c,0x213658e3		! Expected data for %f8
	.word	0xa4c6c247,0x9f39ee2d		! Expected data for %f10
	.word	0xe697de10,0x00000000		! Expected data for %f12
	.word	0xffff0000,0xfdbfc7eb		! Expected data for %f14
	.word	0xd5cf6cff,0x00000000		! Expected data for %f18
	.word	0xd0eab90c,0xff0472e3		! Expected data for %f24
p0_check_pt_data_32:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff000000		! Expected data for %l0
	.word	0x00000000,0x03000000		! Expected data for %l1
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0xa1472f5e		! Expected data for %l7
	.word	0xe37204ff,0x00000000		! Expected data for %f0
	.word	0xde45fb04,0xa1472f5e		! Expected data for %f4
	.word	0xff000097,0x0000b805		! Expected data for %f6
	.word	0xa1472f5e,0x213658e3		! Expected data for %f8
	.word	0xe37204ff,0x00000000		! Expected data for %f16
	.word	0x000000ff,0xff0000ff		! Expected data for %f18
	.word	0x00000000,0x000000ff		! Expected data for %f20
	.word	0xee47e0d1,0xbf2f2299		! Expected data for %f22
	.word	0x94d9ce2c,0x213658e3		! Expected data for %f24
	.word	0xa4c6c247,0x9f39ee2d		! Expected data for %f26
	.word	0xe09c42a3,0x30a4dfe3		! Expected data for %f28
	.word	0xd1e0a5d0,0xfdbfc7eb		! Expected data for %f30
p0_check_pt_data_33:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xf101c0ef		! Expected data for %l0
	.word	0x00000000,0x000000cb		! Expected data for %l1
	.word	0x00000000,0x0000ffff		! Expected data for %l2
	.word	0xf7f7e634,0x037de60a		! Expected data for %l3
	.word	0x00000000,0x0000ff66		! Expected data for %l4
	.word	0xffffffff,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x0000aa5e		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x34000017,0x00000000		! Expected data for %f0
	.word	0x00ff9daa,0x9f91163e		! Expected data for %f2
	.word	0x00000000,0x000000f8		! Expected data for %f4
	.word	0xff000000,0x000000ff		! Expected data for %f6
	.word	0xde45fb04,0xa1472f5e		! Expected data for %f8
	.word	0x00007be3,0x000000ff		! Expected data for %f10
	.word	0xff00ff3d,0x2d0064b3		! Expected data for %f12
	.word	0x62ef3c78,0x000000ff		! Expected data for %f14
	.word	0xebc7bffd,0x0000ffff		! Expected data for %f18
p0_check_pt_data_34:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000072		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000072		! Expected data for %l4
	.word	0x00000000,0xff000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0xffffffff,0xfdbfc7eb		! Expected data for %l7
	.word	0xffe67d03,0x00000000		! Expected data for %f0
	.word	0x00000003,0x00000000		! Expected data for %f6
	.word	0xf7f7e634,0x037de60a		! Expected data for %f16
	.word	0xffe67d03,0xd5cf6cf8		! Expected data for %f18
	.word	0x5e2f47a1,0x04fb45de		! Expected data for %f20
	.word	0x16a66f51,0xa7740b98		! Expected data for %f22
	.word	0xffe67b3d,0xf778f552		! Expected data for %f24
	.word	0x80a2ecaa,0x77a322cb		! Expected data for %f26
	.word	0x35d3531a,0x3d7be6ff		! Expected data for %f28
	.word	0x74bd5edc,0x52d51ebb		! Expected data for %f30
p0_check_pt_data_35:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0xffff0000		! Expected data for %l1
	.word	0xffffffff,0xff000000		! Expected data for %l2
	.word	0x80a2ecaa,0x77a322cb		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x8ebde12c		! Expected data for %l6
	.word	0x00000000,0x72000000		! Expected data for %l7
	.word	0x00ff9daa,0x9f91163e		! Expected data for %f2
	.word	0x00000000,0x000000f8		! Expected data for %f4
	.word	0x00000072,0xff8734ed		! Expected data for %f6
	.word	0x00000000,0x00000000		! Expected data for %f8
	.word	0x00007be3,0x00000000		! Expected data for %f10
	.word	0x00000000,0xff000000		! Expected data for %f20
	.word	0x35d3531a,0x34e6f7ff		! Expected data for %f28
p0_check_pt_data_36:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000072		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x000000f3		! Expected data for %l2
	.word	0x00000000,0x970000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x52f578f7		! Expected data for %l6
	.word	0x00000000,0x3d7be6ff		! Expected data for %l7
	.word	0x00000000,0x00000072		! Expected data for %f0
	.word	0x5f424410,0x01968f39		! Expected data for %f2
	.word	0x00000017,0x0000ffff		! Expected data for %f4
	.word	0x97000000,0x00000000		! Expected data for %f6
	.word	0x0ae67d03,0x1b8734ed		! Expected data for %f8
	.word	0xff5e6240,0x000072e3		! Expected data for %f10
	.word	0x4ac672ff,0xa2c3bb8f		! Expected data for %f12
	.word	0xaa9da4da,0x0cb9ead0		! Expected data for %f14
	.word	0x74bd5edc,0xff0000f8		! Expected data for %f30
p0_check_pt_data_37:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0xffffffff,0xfffffff2		! Expected data for %l1
	.word	0xff000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0xed3487ff,0x720000ff		! Expected data for %l4
	.word	0x72000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0xf778f552		! Expected data for %l6
	.word	0x00000000,0xa1472f5e		! Expected data for %l7
	.word	0x5f424410,0x01968f39		! Expected data for %f2
	.word	0x97000000,0x00000000		! Expected data for %f6
	.word	0x00000000,0x00000072		! Expected data for %f12
	.word	0x00000000,0xfdbfc7eb		! Expected data for %f26
	.word	0x35d3531a,0x00000000		! Expected data for %f28
	.word	0xcd00819d,0xff0000f8		! Expected data for %f30
p0_check_pt_data_38:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x19dfd3e0,0x041a6d32		! Expected data for %l0
	.word	0x00000000,0x00000072		! Expected data for %l1
	.word	0x00000000,0x0000ffff		! Expected data for %l2
	.word	0xffffffff,0xffffff5e		! Expected data for %l3
	.word	0x00000000,0x00000003		! Expected data for %l4
	.word	0xffffffff,0xff000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x16a66f51,0xa7740b98		! Expected data for %f0
	.word	0x97000000,0xffffffff		! Expected data for %f6
	.word	0xffffffff,0xffffffff		! Expected data for %f16
p0_check_pt_data_39:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00006dff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00009daa,0x9f91163e		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x62ef3c78,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000017		! Expected data for %l7
	.word	0x00000000,0x01968f39		! Expected data for %f2
	.word	0x00000017,0x0000ffff		! Expected data for %f4
	.word	0x97000000,0xffffffff		! Expected data for %f6
	.word	0x516fa616,0x00000072		! Expected data for %f12
	.word	0x000000ff,0x00000000		! Expected data for %f26
	.word	0x00000017,0x0000ff72		! Expected data for %f28
	.word	0xaa9d0000,0x00000000		! Expected data for %f30
p0_check_pt_data_40:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x00000017		! Expected data for %l1
	.word	0x00000000,0x00007d03		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000072		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0xffe67b3d		! Expected data for %l6
	.word	0xffffffff,0xffffff3d		! Expected data for %l7
	.word	0x00000000,0x01968f39		! Expected data for %f2
	.word	0x00000000,0x000000ff		! Expected data for %f6
	.word	0xff000000,0x00000000		! Expected data for %f16
	.word	0x16a66f51,0x1a53d335		! Expected data for %f22
p0_check_pt_data_41:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000066		! Expected data for %l6
	.word	0x16a66f51,0xa7740b98		! Expected data for %f0
	.word	0x00000000,0x000000ff		! Expected data for %f6
	.word	0x35d3531a,0x34e6f7ff		! Expected data for %f16
	.word	0x000000ff,0xd5cf6cf8		! Expected data for %f18
	.word	0x00000000,0x000000ff		! Expected data for %f24
	.word	0x00000017,0xd0eab90c		! Expected data for %f28
p0_check_pt_data_42:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0xffffffff,0xffffffe6		! Expected data for %l3
	.word	0x00000000,0x000000e6		! Expected data for %l4
	.word	0x00000000,0x16a66f51		! Expected data for %l5
	.word	0xffe67b3d,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x16a66f51,0xa7740b98		! Expected data for %f0
	.word	0xff5e6240,0x16a66f51		! Expected data for %f10
p0_check_pt_data_43:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xfffff2ff		! Expected data for %l0
	.word	0xffffffff,0xffffffe6		! Expected data for %l1
	.word	0x00000000,0x77a322cb		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0xffffffff,0xffffff00		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0xe6bfc7eb,0xff000000		! Expected data for %l7
	.word	0x00000000,0x01968f39		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0xff5e6240,0x0ae67d03		! Expected data for %f10
	.word	0x00000000,0x00000000		! Expected data for %f14
	.word	0x00000016,0x00000000		! Expected data for %f16
	.word	0x0ae67dff,0xd5cf6cf8		! Expected data for %f18
	.word	0x00000000,0xffff0000		! Expected data for %f20
	.word	0x000000fd,0x0000002d		! Expected data for %f26
p0_check_pt_data_44:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x16a66f51,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x0ae67dff		! Expected data for %l1
	.word	0x00000000,0x0000000c		! Expected data for %l2
	.word	0x00000000,0x00000051		! Expected data for %l3
	.word	0x00000000,0x0000bfe6		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x398f9601,0xff000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff0000ff,0x7fffffff		! Expected data for %f0
	.word	0x00000000,0x01968f39		! Expected data for %f2
	.word	0x000000fd,0x0000ffff		! Expected data for %f4
	.word	0xff5e6240,0x17000000		! Expected data for %f10
p0_check_pt_data_45:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x3d7be6ff		! Expected data for %l2
	.word	0x00000000,0x52f578f7		! Expected data for %l3
	.word	0xffe67b3d,0xd0eab90c		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0xff000000		! Expected data for %l7
	.word	0xff000000,0x516fa616		! Expected data for %f0
	.word	0xff000000,0xffffff3d		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0x00000000,0x00000097		! Expected data for %f6
	.word	0xed34871b,0x037de60a		! Expected data for %f8
	.word	0xd0ea0000,0x40625eff		! Expected data for %f10
	.word	0x8fbbc3a2,0xff72c64a		! Expected data for %f12
	.word	0xd0eab90c,0xdaa49daa		! Expected data for %f14
	.word	0x8dff72e3,0x785462bf		! Expected data for %f18
	.word	0xff000000,0xff000000		! Expected data for %f26
	.word	0xaa9d0000,0x00000000		! Expected data for %f30
p0_check_pt_data_46:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0xff000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000035		! Expected data for %l7
	.word	0x00000000,0x000000ff		! Expected data for %f4
	.word	0x00000000,0x00000066		! Expected data for %f6
	.word	0xfffffff2,0x00000000		! Expected data for %f12
	.word	0x00000000,0xffffffff		! Expected data for %f14
	.word	0xf86ccfd5,0xff7de6ff		! Expected data for %f26
p0_check_pt_data_47:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xb75cd9da		! Expected data for %l0
	.word	0xd0ea0000,0x40625eff		! Expected data for %l1
	.word	0x00000000,0x0000ffd3		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000072		! Expected data for %l7
	.word	0xff000000,0x516fa616		! Expected data for %f0
	.word	0x00000000,0x00000066		! Expected data for %f6
	.word	0xf86ccfd5,0x00000000		! Expected data for %f26
	.word	0x00000017,0xffa322cb		! Expected data for %f28
p0_check_pt_data_48:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0xff000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x0000f86c		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xff000000,0x516fa616		! Expected data for %f0
	.word	0x00009daa,0x9f91163e		! Expected data for %f2
	.word	0x00000000,0x000000ff		! Expected data for %f4
	.word	0x17000000,0xff000000		! Expected data for %f10
	.word	0x037d0000,0x00000000		! Expected data for %f12
	.word	0x000000ff,0x00000017		! Expected data for %f16
p0_check_pt_data_49:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000c9ff		! Expected data for %l0
	.word	0x00000000,0x00000017		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x0000ffff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xff000000,0x516fa616		! Expected data for %f0
	.word	0x000000ff,0x000052ff		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0xed34871b,0x35d3531a		! Expected data for %f8
	.word	0xff000000,0xff000000		! Expected data for %f10
	.word	0x5eaa09a5,0xff000000		! Expected data for %f20
	.word	0x00007d03,0x00000000		! Expected data for %f26
	.word	0xff000000,0x516fa616		! Expected data for %f30
p0_check_pt_data_50:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000097ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x000000bf		! Expected data for %l2
	.word	0xffffffff,0xffffff00		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0xffff72e3		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x000000ff,0x000000ff		! Expected data for %f0
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0x0cb9ead0,0x00000000		! Expected data for %f26
p0_check_pt_data_51:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x000064b3		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000097		! Expected data for %l7
	.word	0xff000000,0x0000ffff		! Expected data for %f0
	.word	0x000000ff,0xff0000ff		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0x00000000,0xd1e047ee		! Expected data for %f6
	.word	0xe3583621,0x2cced994		! Expected data for %f8
	.word	0x2dee399f,0x47c2c6a4		! Expected data for %f10
	.word	0xe3dfa430,0xa3429ce0		! Expected data for %f12
	.word	0xebc7bffd,0xd0a5e0d1		! Expected data for %f14
	.word	0xff000000,0x000000ff		! Expected data for %f30
p0_check_pt_data_52:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000066		! Expected data for %l2
	.word	0x00000000,0xb3ff72e3		! Expected data for %l3
	.word	0xffffffff,0xffffa5d0		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0xffffffff,0x00000000		! Expected data for %f12
	.word	0xff000000,0xd0a5e0d1		! Expected data for %f14
	.word	0xe372ffff,0x785462bf		! Expected data for %f18
p0_check_pt_data_53:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x2dee399f,0x47c2c6c6		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0xff000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x0000ff52		! Expected data for %l7
	.word	0xff000000,0x0000ffff		! Expected data for %f0
	.word	0x000000ff,0xff0000ff		! Expected data for %f2
	.word	0x000000ff,0x00000017		! Expected data for %f16
	.word	0xff000000,0x0000ffff		! Expected data for %f20
	.word	0xffb9ead0,0xffa322cb		! Expected data for %f28
p0_check_pt_data_54:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xcb22a3ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0xffffffff,0xff000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff000000,0x0000ffff		! Expected data for %f0
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0x00000000,0x00000000		! Expected data for %f12
	.word	0xe372ffff,0xff800000		! Expected data for %f18
	.word	0xff000000,0x00000000		! Expected data for %f20
	.word	0x00000097,0x00000000		! Expected data for %f26
p0_check_pt_data_55:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x0000ffff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xff000000,0xff000000		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0x00000000,0x00000000		! Expected data for %f24
p0_check_pt_data_56:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000097		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0xd0a5e0d1		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x000000ff,0x0000ffff		! Expected data for %f0
	.word	0xff000000,0xff000000		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0xff000000,0xff000000		! Expected data for %f14
	.word	0x00000000,0x00000097		! Expected data for %f24
p0_check_pt_data_57:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0xffff0000,0xff000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x000000ff,0x0000ffff		! Expected data for %f0
	.word	0xa4c6c247,0x9f39ee2d		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0xff00845c,0x000066ff		! Expected data for %f20
	.word	0xffffffff,0x00000000		! Expected data for %f22
	.word	0x00000097,0x000000ff		! Expected data for %f24
	.word	0x00000000,0x00000000		! Expected data for %f28
	.word	0x00000000,0x000000ff		! Expected data for %f30
p0_check_pt_data_58:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0xffff0000,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0xa509aa5e		! Expected data for %l7
	.word	0x000000ff,0x0000ffff		! Expected data for %f0
	.word	0xff000000,0xff000000		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0xe3583621,0x2cced994		! Expected data for %f8
	.word	0x2dee399f,0x47c2c6a4		! Expected data for %f10
	.word	0x00000000,0x00000000		! Expected data for %f12
	.word	0xff000000,0xff000000		! Expected data for %f14
	.word	0x17000000,0xff000000		! Expected data for %f16
	.word	0x00000000,0xff800000		! Expected data for %f18
	.word	0xffffffff,0xff000000		! Expected data for %f22
	.word	0xffff0000,0xff000000		! Expected data for %f24
	.word	0xffffffff,0xffffff00		! Expected data for %f30
p0_check_pt_data_59:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x0000ff00		! Expected data for %l4
	.word	0x00000000,0x00000053		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0xffffffff,0xffffffff		! Expected data for %l7
	.word	0x000000ff,0x0000ffff		! Expected data for %f0
	.word	0xe3583621,0xff000000		! Expected data for %f14
	.word	0x00000000,0x000000ff		! Expected data for %f20
	.word	0x00000000,0xff000000		! Expected data for %f24
	.word	0x00000000,0x00000000		! Expected data for %f26
	.word	0x00000000,0x00000000		! Expected data for %f30
p0_check_pt_data_60:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0xff000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0xd1e0a5d0,0x000000ff		! Expected data for %l7
	.word	0xd1e0a5d0,0x00000000		! Expected data for %f4
p0_check_pt_data_61:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0xd0a5e0d1		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x000000ff,0x0000ffff		! Expected data for %f0
	.word	0x16a66f51,0x1a53d335		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0x000000ff,0x47c2c6a4		! Expected data for %f10
	.word	0xffff0000,0xff000000		! Expected data for %f16
	.word	0x00000000,0x9fffffff		! Expected data for %f18
	.word	0x00000000,0x00000000		! Expected data for %f20
	.word	0x00000000,0x00000000		! Expected data for %f22
	.word	0x94d9ce2c,0x213658e3		! Expected data for %f24
	.word	0xa4c6c247,0x9f39ee2d		! Expected data for %f26
	.word	0x00000000,0x00000000		! Expected data for %f28
	.word	0x000000ff,0x000000ff		! Expected data for %f30
p0_check_pt_data_62:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x9fffffff		! Expected data for %l2
	.word	0xe3583621,0x2cced994		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff000000,0x00000000		! Expected data for %f0
	.word	0x04fb0000,0xff000000		! Expected data for %f2
	.word	0x00000000,0xd0a5e0d1		! Expected data for %f4
	.word	0x00000000,0x00000066		! Expected data for %f6
	.word	0x000000ff,0x213658e3		! Expected data for %f8
	.word	0x00000000,0x00000000		! Expected data for %f10
	.word	0xffffff3d,0x2d0064b3		! Expected data for %f12
	.word	0x62ef00ff,0x000000ff		! Expected data for %f14
	.word	0x00000000,0x000039ff		! Expected data for %f22
	.word	0x94d9ce2c,0xd0a5e0d1		! Expected data for %f24
	.word	0x00000000,0x00000000		! Expected data for %f26
	.word	0xffffffff,0x00000000		! Expected data for %f28
p0_check_pt_data_63:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0xff000000		! Expected data for %l6
	.word	0xffffffff,0x876d370c		! Expected data for %l7
	.word	0x04fb0000,0xff000000		! Expected data for %f2
	.word	0x00000000,0xd0a5e0d1		! Expected data for %f4
	.word	0xffffffff,0x00000000		! Expected data for %f8
	.word	0xffffff3d,0xffffffff		! Expected data for %f16
	.word	0x0000ff00,0x9fffffff		! Expected data for %f18
	.word	0x00000000,0x00000000		! Expected data for %f20
p0_check_pt_data_64:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x876d370c,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000000,0xd0a5e0d1		! Expected data for %f4
p0_check_pt_data_65:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0xeb8e0207,0xa3563487		! Expected data for %l1
	.word	0x00000000,0xffffff00		! Expected data for %l2
	.word	0x00000000,0x47c2c6a4		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000000,0xff000000		! Expected data for %f0
	.word	0x04fb0000,0xff000000		! Expected data for %f2
	.word	0x00000000,0xd0a5e0d1		! Expected data for %f4
	.word	0xff0000ff,0x00000066		! Expected data for %f6
	.word	0x00000000,0x00000000		! Expected data for %f10
	.word	0xff000000,0x00000000		! Expected data for %f16
	.word	0x00000000,0x000000ff		! Expected data for %f18
	.word	0x5eaa09a5,0x00000000		! Expected data for %f20
	.word	0x2cced994,0x00000000		! Expected data for %f22
	.word	0x1a53d335,0x1b8734ed		! Expected data for %f24
	.word	0x000000ff,0x000000ff		! Expected data for %f26
	.word	0x00000000,0x00007d03		! Expected data for %f28
	.word	0x00000000,0xff000000		! Expected data for %f30
p0_check_pt_data_66:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000ffff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x0000ff00		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000087		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0xff0000ff		! Expected data for %l7
	.word	0x00000000,0x000000ff		! Expected data for %f0
	.word	0x00000000,0x00000000		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0x0000ffff,0x00000000		! Expected data for %f6
	.word	0x52f500ff,0x0000e6ff		! Expected data for %f8
	.word	0xcb22a377,0xaaeca280		! Expected data for %f10
	.word	0xffe67b3d,0x1a53d335		! Expected data for %f12
	.word	0xbb1ed552,0xdc5ebd74		! Expected data for %f14
	.word	0x00000000,0xff000000		! Expected data for %f22
p0_check_pt_data_67:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000052		! Expected data for %l1
	.word	0x00000000,0x1b8734ed		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0xff000000		! Expected data for %l4
	.word	0x00000000,0xff000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000039		! Expected data for %l7
	.word	0xe3583621,0x2cced994		! Expected data for %f0
	.word	0x00000000,0x00000000		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0xf778f552,0x0000e6ff		! Expected data for %f8
	.word	0x00000000,0x00000000		! Expected data for %f12
	.word	0x00000000,0x000000ff		! Expected data for %f16
	.word	0x00000000,0x16a66f51		! Expected data for %f18
	.word	0xffffffff,0x000000ff		! Expected data for %f20
	.word	0x97000000,0xffffffff		! Expected data for %f22
	.word	0x0ae67d03,0x1b8734ed		! Expected data for %f24
	.word	0xff5e6240,0xff000000		! Expected data for %f26
	.word	0x516fa616,0x00000072		! Expected data for %f28
	.word	0xff0000ff,0xff000000		! Expected data for %f30
p0_check_pt_data_68:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xcb22a377		! Expected data for %l0
	.word	0x00000000,0x66000000		! Expected data for %l1
	.word	0x00000000,0x0000ffff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x037de60a		! Expected data for %l7
	.word	0xe3583621,0x2cced994		! Expected data for %f0
	.word	0x00000000,0x00000000		! Expected data for %f2
	.word	0x00003900,0x00000000		! Expected data for %f4
	.word	0x62ef00ff,0x000000ff		! Expected data for %f10
	.word	0x00000000,0x00003900		! Expected data for %f12
	.word	0x00000000,0x000000ff		! Expected data for %f16
	.word	0x000000ff,0x000000ff		! Expected data for %f18
	.word	0x00000000,0x00000000		! Expected data for %f20
	.word	0x0000ffff,0x00000000		! Expected data for %f22
	.word	0x52f500ff,0x0000e6ff		! Expected data for %f24
	.word	0xcb22a377,0xaaeca280		! Expected data for %f26
	.word	0xffe67b3d,0x1a53d335		! Expected data for %f28
	.word	0x00000000,0xdc5ebd74		! Expected data for %f30
p0_check_pt_data_69:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00003900		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0xff000000,0xffffffff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00003900,0x00000000		! Expected data for %f4
	.word	0x000000ff,0x000000ff		! Expected data for %f10
	.word	0x000000ff,0x000000ff		! Expected data for %f20
p0_check_pt_data_70:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x0000ff00		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0xff800000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xe3583621,0x2cced994		! Expected data for %f0
	.word	0x46640000,0x00003900		! Expected data for %f4
	.word	0x000000ff,0x000000ff		! Expected data for %f18
	.word	0x00000000,0x1a53d335		! Expected data for %f28
p0_check_pt_data_71:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x0000ffff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0xffffffff,0xffffff80		! Expected data for %l7
	.word	0x00000000,0xff000000		! Expected data for %f2
	.word	0x0000ffff,0x00000000		! Expected data for %f6
	.word	0xcb22a377,0xaaeca280		! Expected data for %f8
	.word	0x1b8734ed,0xffff0000		! Expected data for %f12
	.word	0x00000000,0xffffffff		! Expected data for %f24
p0_check_pt_data_72:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0xffffffff,0xffffffff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0xffffffff,0xffffffff		! Expected data for %l7
	.word	0xcb22a377,0xaaeca280		! Expected data for %f12
	.word	0xffff0000,0xffffffff		! Expected data for %f16
	.word	0x1a53d335,0x47c2c6ff		! Expected data for %f18
	.word	0xcb22a377,0xaaeca200		! Expected data for %f20
	.word	0x00000000,0x00000000		! Expected data for %f22
	.word	0x0000e6ff,0x000000ff		! Expected data for %f24
	.word	0xa4c6c247,0x9f39ee2d		! Expected data for %f26
	.word	0x00000000,0x00000000		! Expected data for %f28
	.word	0x000000ff,0x000000ff		! Expected data for %f30
p0_check_pt_data_73:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x0000ffff		! Expected data for %l1
	.word	0x00000000,0x0000ffff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x00ff0000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xffffffff,0x2cced994		! Expected data for %f0
	.word	0xa509aa5e,0xff000000		! Expected data for %f2
	.word	0xff000000,0xff0000ff		! Expected data for %f4
	.word	0x0000ffff,0x00000000		! Expected data for %f6
	.word	0xff0000ff,0x000000ff		! Expected data for %f12
	.word	0x5e7de60a,0x00000000		! Expected data for %f16
	.word	0xff000000,0x000000ff		! Expected data for %f18
	.word	0x000000ff,0x00000000		! Expected data for %f20
	.word	0x000000ff,0x516fa616		! Expected data for %f22
	.word	0x00000000,0x00000000		! Expected data for %f24
	.word	0x000000ff,0x516fa616		! Expected data for %f26
	.word	0x00000000,0x00000000		! Expected data for %f28
	.word	0x000000ff,0xdc5ebd74		! Expected data for %f30
p0_check_pt_data_74:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x77a322cb		! Expected data for %l2
	.word	0x00000000,0x80a2ecaa		! Expected data for %l3
	.word	0xffffffff,0xff000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x0000ff00		! Expected data for %l7
	.word	0xff00e6ff,0x00000000		! Expected data for %f0
	.word	0xa509aa5e,0xff000000		! Expected data for %f2
	.word	0x0000ffff,0xe3583621		! Expected data for %f6
	.word	0xdc5effff,0x000000ff		! Expected data for %f10
p0_check_pt_data_75:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0xffffffff,0xffffd335		! Expected data for %l7
	.word	0x000000ff,0xdc5ebd74		! Expected data for %f0
	.word	0x00000000,0x00ffffff		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0xffffffff,0x5eaa09a5		! Expected data for %f6
	.word	0xff583621,0xff000000		! Expected data for %f8
	.word	0x000080ff,0x74bd5edc		! Expected data for %f10
	.word	0xb364002d,0xff000000		! Expected data for %f12
	.word	0xff000000,0xff00ff62		! Expected data for %f14
p0_check_pt_data_76:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x2603640f,0x94aa2a9e		! Expected data for %l1
	.word	0x00000000,0x1b8734ed		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x000000ed		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0xffffffff,0xff00f552		! Expected data for %l7
	.word	0x00000000,0x00ffffff		! Expected data for %f2
	.word	0xdc5ebd74,0xff800000		! Expected data for %f24
	.word	0xff000000,0x00000000		! Expected data for %f28
p0_check_pt_data_77:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0xe6ba1e4f,0xf77a7f15		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x0000005e		! Expected data for %l3
	.word	0x00000000,0x00000009		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000000,0xef000000		! Expected data for %f4
	.word	0xffffffff,0x5eaa09a5		! Expected data for %f6
	.word	0x00000000,0x000000ff		! Expected data for %f10
	.word	0xffffffff,0xffffffff		! Expected data for %f16
	.word	0x00000000,0x00000000		! Expected data for %f18
	.word	0xcb22a377,0x00000000		! Expected data for %f20
	.word	0x00000000,0x00000000		! Expected data for %f22
	.word	0x1a15d335,0x1b8734ed		! Expected data for %f24
	.word	0x00000000,0x00000000		! Expected data for %f26
	.word	0x00000000,0x00007d03		! Expected data for %f28
	.word	0x00ff0000,0x000000ff		! Expected data for %f30
p0_check_pt_data_78:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xff000000,0xff0000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0xff000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0xa509aa5e,0xffffffff		! Expected data for %l7
	.word	0xff000000,0x0ae67d5e		! Expected data for %f0
	.word	0xff000000,0x000000ff		! Expected data for %f2
	.word	0x00000000,0xff000000		! Expected data for %f4
	.word	0x16a66f51,0xff000000		! Expected data for %f6
	.word	0x000080ff,0x74bd5edc		! Expected data for %f8
	.word	0x16a66f51,0xff000000		! Expected data for %f10
	.word	0x00000000,0x000000ff		! Expected data for %f12
	.word	0x74bd5edc,0xff000000		! Expected data for %f14
	.word	0x74bd5edc,0x1b8734ed		! Expected data for %f24
p0_check_pt_data_79:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff00f552		! Expected data for %l0
	.word	0x00000000,0xff000000		! Expected data for %l1
	.word	0x00000000,0x1b8734ff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0xff000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x0000d3ff		! Expected data for %l6
	.word	0x00000000,0x00390000		! Expected data for %l7
	.word	0xff000000,0x0ae67d5e		! Expected data for %f0
	.word	0xff000000,0x000000ff		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0x16a66f51,0xff000000		! Expected data for %f6
	.word	0xff000000,0xffffffff		! Expected data for %f8
	.word	0x00390000,0x000064ff		! Expected data for %f10
	.word	0xffffffff,0xffffffff		! Expected data for %f16
	.word	0xffffffff,0x2cced994		! Expected data for %f20
p0_check_pt_data_80:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x1b8734ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x0000ffff		! Expected data for %l3
	.word	0x00000000,0x52000000		! Expected data for %l4
	.word	0x00000000,0x0ae67d5e		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x000000ed		! Expected data for %l7
	.word	0x80000000,0x00000000		! Expected data for %f0
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0xff000000,0xffffffff		! Expected data for %f8
	.word	0x00000000,0x1b8734ff		! Expected data for %f18
	.word	0x0000ff00,0xff000000		! Expected data for %f22
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
	.word	0xe69f9358,0x520c6cfb
	.word	0x00000000,0x00000002
	.word	0xb0227038,0x5fd8ff21
	.word	0x00000000,0x00000003
	.word	0xfdd72c30,0x26a17d50
	.word	0x00000000,0x00000004
	.word	0x0c07a648,0x6e168497
	.word	0x00000000,0x00000005
	.word	0x15718780,0x2fd64cf7
	.word	0x00000000,0x00000006
	.word	0x901d06cf,0xdff72691
	.word	0x00000000,0x00000007
	.word	0xe9d44057,0xff30ee41
	.word	0x00000000,0x00000008
	.word	0xa6000c3f,0x960224d1
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
	.word	0x4532cfcf,0x5c43f59c,0x7d62f2ac,0x1bf7f276
	.word	0xe5bca3bd,0x76dd34c1,0x169285da,0x40588747
	.word	0xde45fb04,0xa1472f5e,0x000353ac,0xc12833b5
	.word	0xa0f4213d,0x5b4a6750,0x62ef3c78,0xbb5ee3d7
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
	.word	0x6ea60b9e,0x358481e7,0x703ef719,0x8a9cf0df
	.word	0xd61bf364,0xd132b515,0x065d534c,0xfa9063f9
	.word	0x0e2069d3,0x292670c7,0xb8ce4ce5,0xf24d805d
	.word	0xe5c0ce8a,0x07140f03,0x9603e03c,0x64e327aa
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
	.word	0x3e919dce,0x34d5b805,0x5ea5364f,0xad982c1e
	.word	0xe63d86e6,0xf778f552,0x5c844f11,0x6004a862
	.word	0x6081daa3,0x3f403703,0x93e8f986,0x3028972c
	.word	0xc40ffeae,0x04f0a313,0x3b52db8a,0x01af9aa5
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
	.word	0x10f77b4f,0x3855171f,0xa738dbaf,0x8ebce0f2
	.word	0x82d357b2,0xf1114567,0x16a66f51,0xf4dc12c7
	.word	0x9a1c6534,0x2bd8373d,0x80a2ecaa,0x77a322cb
	.word	0x8365f8b9,0x9554d663,0x74bd5edc,0x52d51ebb
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
	.word	0x97db64d3,0x959c094a,0x91ff7d78,0x0dd4a978
	.word	0x8f1a5501,0x40a0b34d,0x4e7b6629,0x01ff6647
	.word	0xa509aa5e,0xd5cf6cf8,0x85e5edce,0x6bd78a02
	.word	0x8fbbc3a2,0xff72c64a,0x2ce1bd8e,0xdaa49daa
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
	.word	0x469b489f,0x911d70c3,0x7ea0df51,0x7a6eab22
	.word	0x3b6e47bb,0xc69d2205,0x5bd6f1a4,0x01b0af02
	.word	0x65786870,0x1eeea64c,0x198cc89d,0x11904845
	.word	0x1ad14753,0x00cc1d7f,0x4dbb5334,0x0ece28c2
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
	.word	0x07e9163e,0xd0eab90c,0x6c59f081,0x24c20861
	.word	0x5c13117e,0xede03101,0x3317a612,0x52529726
	.word	0x9b3ca75d,0xe08281c1,0x44a4c480,0xb75cd9da
	.word	0x3b54f316,0x23237bf5,0x8dff72e3,0x785462bf
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
	.word	0x9f9186fd,0x5caf5830,0xa2ffbbd9,0xa3d2d9bb
	.word	0xa7740b98,0xf18144db,0x69c3a8df,0xe92969ad
	.word	0xf58d3d73,0xbfa5ae97,0xea9cac76,0xacf27fe6
	.word	0x9703e30b,0xbbeddb77,0x4a93c893,0x2a33c88f
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
	.word	0x8a57a8a1,0x3ec80b8f,0x90ac91f0,0x82f42373
	.word	0xb0c7e867,0x61fa6bf3,0xf101c0ef,0xc96f6fe3
	.word	0xf283ac8f,0x1b666ef5,0x387becac,0xeb0e3d12
	.word	0x28e3c8f7,0x9ff26985,0x9430fa40,0x8c4ee51a
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
	.word	0x472a56b3,0x8787313c,0x599d9075,0x03f335ac
	.word	0x6fe2cc7d,0x0169d763,0x99222fbf,0xd1e047ee
	.word	0xe3583621,0x2cced994,0x2dee399f,0x47c2c6a4
	.word	0xe3dfa430,0xa3429ce0,0xebc7bffd,0xd0a5e0d1
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
	.word	0xada57f64,0x10111074,0xa76e61bd,0x2c05a2f6
	.word	0x922ff31f,0x84d45987,0x908a7c20,0x32ea7f0d
	.word	0x0e0a2639,0xda94f32f,0x4d15f728,0xa5f9d78e
	.word	0x621ebbdd,0xfe4b4cc8,0x6cc1ff49,0x6a9c2c2b
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
	.word	0xdf6f6d08,0x4d9c90e7,0x8af3afbf,0x9f5e6240
	.word	0x1796e2b6,0x8ffe275d,0x4bbe3cde,0x1468c5b9
	.word	0x58fb1d0c,0xe4557670,0xd3f1a09c,0x1b8734ed
	.word	0xbaf9b00d,0x1a53d335,0xe697de10,0xd004a503
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
	.word	0x87294980,0x6c49b9fd,0xe73b61e7,0x85f2c6fe
	.word	0xd75f44e6,0x709fd3b5,0x1afbe745,0xcc2c93db
	.word	0x50b75876,0x231332a7,0x5804006a,0x7792950d
	.word	0x7ade25ca,0x6092688d,0x3ebec9a2,0x463df772
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
	.word	0x3e0ab19b,0x81d10d02,0xe676e08e,0xf7bcdb60
	.word	0x9626555b,0x81f58ff8,0x06582203,0xf64a2132
	.word	0x5ca9dfbf,0xf70c378d,0x08f9732e,0xce384f20
	.word	0x8deee6bc,0xe106c493,0x4900113d,0x3c53c2a1
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
	.word	0x0390afd5,0x6a1c30db,0xbd03f523,0x91f29af7
	.word	0xede5fb91,0xb31eb95e,0xe2011ce3,0x984530ae
	.word	0xf69eeb6a,0x73d5710b,0x11268075,0xddf3e311
	.word	0xa0a959d8,0x0c271550,0x226f94e9,0xdca559ee
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
	.word	0x0a2dbb34,0xc6a2c1e2,0x78afda44,0x92c9cc75
	.word	0xee5593e9,0xcef9612a,0x2a3ad584,0xa634a80e
	.word	0x23e53cf4,0x01876f47,0x3fb61964,0x8e18b2bb
	.word	0x54b491fc,0x9f877a52,0x120adb9c,0x0f8c3fe5
	.word	0xe9e6e589,0x3b2322a7,0x706f1ea1,0xe53142a3
	.word	0x31ac200f,0x46ad0657,0xbb2bf0c5,0xac929063
	.word	0x6369a35f,0x8dda16a3,0xd3143363,0x01abeac0
	.word	0x85d826c9,0xd215a565,0xdfd18392,0xbff02df5
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
	.word	0x896fe4d2,0xad5ead69,0xdbe69618,0x7ee1f77e
	.word	0x8c1dd099,0xd1386d9b,0xa0bcf63c,0xcbbcfdd8
	.word	0xd9d01a69,0xaa9d045f,0x9e48c619,0x85edcb4b
	.word	0x215ee032,0x3e2cb767,0x0b4a1ddb,0x7fb43de0
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
	.word	0xf2b5ed58,0x8980c2c1,0x19207b55,0x6881a8b7
	.word	0xf53edc15,0xaa42daed,0xee5f3091,0xb2d0a6ed
	.word	0x7ae0bfe0,0x895d1126,0x43c146ec,0x13a912bb
	.word	0xf4870d83,0xd6d18da4,0x1a50d7fe,0x54a1598c
	.word	0x862b9b4e,0x7985e306,0x250143ac,0x43e6eb12
	.word	0xd6962cf0,0xe05aaa93,0x6db103a4,0x443c7b1c
	.word	0x6784bdcd,0xd6b8a4dd,0x3ce9e495,0x80de1e58
	.word	0x4d826cfa,0x2c6de276,0x68c5b081,0xa771312e
	.word	0xac91b20f,0x7fd00572,0xe668b591,0xb447adde
	.word	0xeadae5a3,0x11f36404,0x1fcf7e72,0x7b47ce4b
	.word	0x00951ee3,0x100f83f8,0xf5929bc0,0x6ff234f0
	.word	0x5bd4eccd,0xbdce8012,0x115a7a09,0x9318641d
	.word	0x1365cd54,0x70db6175,0x749d9c74,0x7d07cd28
	.word	0x1a8530a4,0x23a055df,0xd2aa106c,0xbabe4b75
	.word	0xad68d7b3,0xa37a09a8,0x897943df,0x83f90c0e
	.word	0x31d0b180,0x1db13fdb,0x6f9517a1,0x91747482
	.word	0x97530ae8,0x5c967b9c,0x653bec6a,0xcda473f5
	.word	0x35faffd0,0xbfbfff25,0x0d9cd9ff,0x1f4fd3ec
	.word	0xd1ea22a9,0x3a398c07,0x3475f12e,0x8aec81b4
	.word	0x8c6e0436,0xe1bdc617,0x7625d428,0xc69df62e
	.word	0xb18f9071,0xad2dcd6d,0xc842fc2e,0x1391b9eb
	.word	0x6ecd64b7,0x23755cba,0x9e0f49cb,0xd1136ec9
	.word	0x3ea3d2bc,0x181657fc,0xab059be6,0x41c89eb8
	.word	0xcdee93a0,0xe0dc98f4,0x73e26d09,0xf9ff1ad9
	.word	0x52b6ae0c,0xb8c6a877,0x2a98f529,0x6ff3a6b8
	.word	0xb929adb2,0x9992e1b6,0xf41f6b3a,0x19776492
	.word	0x57125010,0xbd1dd040,0x618bd560,0x1172e113
	.word	0x6d055ac7,0xae44b3e9,0x14178b8a,0x86aa910c
	.word	0x5a379ea8,0xcba01051,0x60e30e45,0x73baed91
	.word	0x87361e3c,0xb00effd5,0x90580448,0xb84a120c
	.word	0x9fb72ef7,0x276f574f,0xd7590c04,0x05bee117
	.word	0xa3b5ad89,0x3d3c047d,0xc0acc062,0xea3c25ea
share3_end:
